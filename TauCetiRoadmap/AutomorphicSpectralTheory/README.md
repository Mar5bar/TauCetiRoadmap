# Roadmap: automorphic spectral theory and trace distributions

**Summary.** This roadmap constructs the spectral theory of automorphic forms on a connected reductive group G over a number field F and the trace distributions built from it. The main theorem decomposes L²(G(F)\G(𝔸)¹) by continued Eisenstein series and their square-integrable residues. Arthur truncation and the Maass–Selberg relations compute the inner products and lead to the coarse, fine and invariant trace formulas and the L²-Lefschetz formula. Weighted complexes and Franke's filtration connect this analysis to ordinary arithmetic cohomology. Two explicit branches develop rank-one modular kernels and the everywhere-unramified GLₙ trace over 𝔽_q(X), with the measure and finite-cover factors needed for counting local systems. The GLₙ applications include number-field residual blocks, Rankin–Selberg strip bounds and normalizers, standard-completion growth and super-positivity, and solvable base change.

## Scope and ownership

The new functional analysis consists of measurable Hilbert fields and direct integrals, their multiplication models, measurable integral kernels and complex operator traces, locally convex vector integration, meromorphic families and strip-order continuation. The automorphic layers own convergent and continued intertwining operators, Eisenstein residues, truncation, spectral completeness, weighted finite-character acyclicity, Franke's comparison and its cuspidal-support weight contract, Paley–Wiener transforms and trace distributions.

OperatorTheory/SelfAdjointSpectralTheory owns projection-valued measures and bounded Borel calculus, Stone's correspondence and unbounded self-adjoint spectral measures. OperatorTheory/OperatorIdeals owns the Hilbert–Schmidt and trace-class ideals and their gauges. RepresentationTheory/CompactGroups owns Peter–Weyl and its continuous compact-group kernels. The present additions are measurable multiplicity models, square-integrable kernels on general scalar L² spaces, the complex trace and its representative-dependent diagonal formula.

For number fields, AdelicAlgebraicGroups owns the adelic topology, restricted Haar products, rational characters, logarithmic height, G(𝔸)¹, homogeneous quotient integration, parabolic and Iwasawa data, reduction and Siegel estimates. ReductiveGroupsPartII owns the underlying local points, parabolics and L-groups. SmoothRepresentationsOfLocalGroups owns the finite-place representation categories, Hecke algebras, normalized induction, Jacquet modules and Satake theory. Sections 0.48–0.50 construct the general-group real representation foundations, smooth Fréchet globalizations and restricted tensor factorization, consuming the GLₙ specializations from AutomorphicLFunctionsAndLocalFactors. ArithmeticLocallySymmetricSpaces owns relative cochains, smooth growth spaces, constant terms, cusp forms and their discreteness, and the de Rham and moderate-growth comparisons. In particular, the comparison from all smooth functions to uniform moderate growth is a supplier theorem; the new comparison here passes from uniform moderate growth to central-finite automorphic forms. AutomorphicLFunctionsAndLocalFactors also owns scalar L-functions, local factors, Fourier–Laplace analysis, K-Bessel transforms, curve additive analysis, GLₙ isobaric sums, cuspidal continuation and pole criteria, and the pure curve-cohomological realization. The present roadmap constructs residual-block classification (§§4.14–4.14a), residual scalar applications (§§4.15a–4.15e), normalized GLₙ intertwining estimates (§2.3a), global strip bounds and standard-completion applications (§§3.6a–3.6d), and GLₙ transfer applications (Layer 7).

Ordinary orbital integrals, discrete-series pseudo-coefficients and generic packets built from given tempered packets are constructed here. Stable orbital integrals, endoscopic transfer and stabilization belong to the roadmaps that consume them. Tempered packets, their generic members and compatibility of their local factors with parameters are hypotheses; this roadmap does not prove the general local Langlands correspondence. Its analytic Green kernel precedes the arithmetic Green functions and heights of Gross–Zagier.

## Conventions

Hilbert spaces are complete and complex, with the first inner-product slot conjugated. Measurable fields have separable fibres and countable fundamental sequences; direct-integral vectors are classes modulo almost-everywhere equality. Projection measures are strongly countably additive. Operator traces require trace class; a diagonal requires a specified representative or a factorization.

Use normalized induction with δ_P^(1/2)=a^ρ_P, where δ_P is the full positive modulus character. Fix compatible Haar and quotient measures, with vol K=vol(N_P(F)\N_P(𝔸))=1 when the statement says so. The norm-one quotient and the quotient by A_G(ℝ)⁰ are identified through the supplier's measure comparison; full-height Fourier transforms do not automatically descend through the split centre. Weyl denominators, coroot covolumes and stabilizer orders remain in every formula. The convention (A−zI)⁻¹ is the negative of the library's (zI−A)⁻¹. Stone's group is U(t)=exp(itA), with generator iA. For A=0 and z=i, (A−zI)⁻¹=iI has positive imaginary scalar pairing; reversing this sign would invalidate the Herglotz convention.

Additive (G,M)-families use the coroot denominators of §6.7. In rank one, fix reference P, its simple root α, z=Λ(α∨) and coroot-lattice covolume v. Then θ_P(z)=z/v and θ_P̄(z)=−z/v. For R=R_(P̄|P):I_P→I_P̄, the family uses R(λ)⁻¹R(λ+Λ); a prime differentiates in λ(α∨), with the central parameter fixed. Its regularized value is −vR(λ)⁻¹R′(λ). The scalar normalizing-factor families and global intertwiner families in the fine spectral expansion use this same orientation.

The modular branch uses Γ=PSL₂(ℤ), Δ=−y²(∂ₓ²+∂ᵧ²), dμ=dxdy/y² and e(x)=exp(2πix). Gross–Zagier's convention is Δ_GZ=−Δ. Thus Δy²=−2y² whereas Δ_GZ y²=2y². Positive real bases use real logarithms in complex powers. For F=y^(k/2)f, the classical and unitary weight conventions obey Δ_classical f=y^(−k/2)(Δ_unitary F+(k²/4−k/2)F); at k=1/2 the shift is −3/16. Green sums count Γ₀(N)/{±I} once, whereas Eisenstein sums range over Γ_∞\Γ. The primitive-pair expression has a factor 1/2 for ±(c,d). Every Fourier and residue formula retains its frequency, parameter, off-orbit and endpoint restrictions.

The function-field branch, denoted convention Y below, uses F=𝔽_q(X) for X smooth, projective and geometrically connected, and n>0. Except for compact-torus assertions it concerns everywhere-unramified GLₙ. Haar on every compact character group has total mass one, including all components: each of r components has mass 1/r. Fix determinant degree and the half-modulus normalization, and impose gcd(e,n)=1 exactly in the vanishing statements that need it. Convention D below means the positive modular Laplacian above; convention G means Δ_GZ. J_ν and I_ν use principal powers and regularized hypergeometric functions; K_ν uses its positive-argument Mellin integral. The completed scalar zeta is `completedRiemannZeta`, with Λ(1−s)=Λ(s).

For cohomology, V=V_λ is a finite-dimensional algebraic coefficient module and J=Ann_Z(V∨). At neat finite level K, remove the split-central Lie algebra: 𝔪_G=𝔤/𝔞_G. Keep the full K_∞, including its component group. Balance the A_∞-character ζ_V and apply the associated finite-adelic twist to the Hecke action. Normalized induction of π agrees with unnormalized induction of σ=δ_P^(1/2)π; the coefficient weight belongs to σ. In the rank-one dilation model r^(s+1/2)f(rx), the squared norm is r^(2 Re s)‖f‖². At r=4 and Re s=0 it is unchanged; deleting r^(1/2) halves the norm.

## Exact supplier contracts

**Dependencies.** The adelic and automorphic supplier contracts are listed in the table below. The analytic, geometric and arithmetic foundation contracts are specified below and in the *Needs* clauses. Residual-block classification and scalar normalization are constructed in §§4.14–4.15e from cuspidal Eisenstein families and the supplied cuspidal factors.

| Supplier | Sections and supplied mathematics |
|---|---|
| ReductiveGroupsPartII | RG2.0, RG2.4–RG2.5: local points, decompositions, integration, dual groups and L-groups. |
| SmoothRepresentationsOfLocalGroups | SR.1–SR.4: Hecke actions, normalized induction, Jacquet modules, finite length, conditional Langlands classification and Satake parameters. |
| AdelicAlgebraicGroups | §§0.1–0.3, 2.1–2.3, 3.1, 3.4–3.6: restricted Haar products, height, quotient integration, Iwasawa data and reduction. |
| ArithmeticGaloisRepresentations | §§2.4–2.7: local factors and constants evaluated on the specified compatible packet parameter in §2.8. |
| ArithmeticLocallySymmetricSpaces | ALS.0.2, ALS.F.1, ALS.F.5–ALS.F.6, ALS.4.5, ALS.5b.1, ALS.5b.3, ALS.5b.5: real Lie data, cochains, growth spaces, constant terms, cuspidal discreteness, Kostant theory and cohomological comparisons. |
| AutomorphicLFunctionsAndLocalFactors | Representation prerequisites, `isobaric-construction`, `archimedean-smooth-representations`, `restricted-tensor-realizations`; AL.0–AL.2 Fourier/Tate/standard-factor analysis and generic paired Hadamard theory; AL.3 cuspidal pair factors, continuation, functional equations, poles, `isobaric-strong-multiplicity-one`, curve additive analysis, pure realization and tensor determinant. |

### From Mathlib

The signatures are expressed against Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Library notions remain native: `Lp`, `HilbertBasis`, `LinearPMap`, `ContinuousLinearMap`, `SchwartzMap`, `TestFunction`, `HomologicalComplex`, `AnalyticOnNhd` and `MeromorphicOn`.

- `MeasureTheory.L2.inner_def` gives the conjugate-first scalar L² pairing. `MeasureTheory.integral_prod` and `MeasureTheory.integral_tsum` supply Fubini and summation under their integrability hypotheses; they do not justify a formally divergent spectral integral.
- `hasFDerivAt_integral_of_dominated_of_fderiv_le` and `hasDerivAt_integral_of_dominated_loc_of_deriv_le` supply differentiated integrals with local domination. `WithSeminorms.banach_steinhaus` supplies equicontinuity on barrelled spaces, rather than a nuclear LF construction.
- `Complex.besselJ` in `Mathlib.Analysis.SpecialFunctions.Bessel` supplies the principal-power first-kind Bessel function, `Complex.besselJ_neg_int` its integer-order symmetry, `Complex.besselJ_zero` its zero value, and `Complex.analyticOnNhd_besselJ` and `Complex.analyticOnNhd_besselJ_int` its slit-plane and integer-order analyticity. Use these declarations for J throughout; §0.25 adds its series, differential equation, recurrences and half-order evaluation.
- `Complex.regularizedHGFun`, `Complex.radius_regularizedHGFunSeries_eq_top`, `Complex.betaIntegral_eq_Gamma_mul_div` and `Complex.Gamma_mul_Gamma_add_half` supply the series, beta integral and duplication identities used for Whittaker and Bessel functions. `completedRiemannZeta_one_sub` and `zeta_eq_tsum_one_div_nat_add_one_cpow` supply scalar zeta normalization in their stated domains.
- `MonoidHom.measurePreserving` applies to the surjective homomorphisms of compact groups with probability Haar. `UnitAddTorus.hasSum_mFourier_series_apply_of_summable`, `AddChar.expect_eq_ite` and `AddChar.complexBasis` supply summable torus Fourier inversion and finite-character orthogonality; finite components are retained.
- `UpperHalfPlane.cosh_dist` and `UpperHalfPlane.tanh_half_dist` identify the hyperbolic point-pair coordinate. `CongruenceSubgroup.Gamma0` supplies the level subgroup, not its nonholomorphic Eisenstein series.
- `SchwartzMap.postcompCLM` and `TestFunction.topologicalSpace` supply normed-target Schwartz postcomposition and the real test-function topology. `LinearMap.IsSymmetric.eigenvectorBasis` is the finite-dimensional self-adjoint specialization. `IsHilbertSum.mkInternal` assembles an orthogonal family after density has been proved.
- `Module.AEval'` and `Module.AEval'.X_smul_of` express the polynomial-module Jordan controls for ideal torsion. `ArithmeticFunction.moebius` supplies the arithmetic Möbius function.

`Ideal.primaryComponent V J` is the underlying module ⋃_n{v:J^n v=0}, for any commutative ring and module. `Ideal.primaryComponent_mem`, `Ideal.primaryComponent.map`, and `Ideal.primaryComponent.map_ker_eq` supply membership, functorial restriction and the kernel comparison. This includes the uniform ideal-power condition, without a prime-ideal hypothesis. Layer 5 adds its compatible Harish-Chandra structure and derived comparison. ([Fra98], §4, (1), p.207.)

**Checks of the supplied ideal-power module.**

- At J=0 the primary component is V.
- At J=Z it is zero, including the zero module.
- For the polynomial module `Module.AEval'` of N(x,y)=(y,0) on ℂ², the (X)-primary component is the whole module: X² annihilates it, whereas X·(0,1)=(1,0)≠0.


### From Tau Ceti

`TauCeti.stdPeterWeylBasis` supplies the compact-group Hilbert basis. `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul` supplies Stone's correspondence for a self-adjoint partial operator. `IsCompactOperator.finiteDimensional_eigenspace`, `TauCeti.isFredholm_one_sub` and `ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector` supply compact-operator finiteness and the compact self-adjoint basis in their respective hypotheses. `TauCeti.vitali` in `TauCeti.Analysis.Complex.Conformal.Vitali` supplies scalar holomorphic Vitali convergence on a connected open domain, assuming local boundedness and pointwise convergence on a set with an interior accumulation point; the locally convex strip-order extension is §0.18. `TauCeti.Multiquadratic.IsFundamentalDiscriminant` supplies the arithmetic discriminant criterion. The module `TauCeti.Analysis.Normed.Operator.Resolvent.Unbounded` supplies the resolvent of a partial operator: `TauCeti.LinearPMap.IsResolventAt` (a bounded two-sided inverse of λ−A on the domain), `TauCeti.LinearPMap.resolventSet` and `TauCeti.LinearPMap.resolvent`; `TauCeti.LinearPMap.analyticAt_resolvent` in `TauCeti.Analysis.Normed.Operator.Resolvent.Analytic` gives its analyticity on the resolvent set. Algebraic bijectivity is insufficient, and operator-norm analyticity off spectrum does not continue an embedded modular eigenvalue through the continuous spectrum.

Tau Ceti supplies `TauCeti.exists_isFiniteMeasure_eq_nevanlinnaKernel_add` in `TauCeti.Analysis.Complex.Pick.Nevanlinna`: a holomorphic F with Im F≥0 on the upper half-plane is F(z)=bz+∫(1+tz)/(t−z)dρ(t)+Re F(i) with ρ finite and b≥0. The density conversion to the subtracted kernel, uniqueness of the triple and the resolvent specialization are the additions here (§0.5).

### From TauCetiRoadmap.OperatorTheory and RepresentationTheory

SelfAdjointSpectralTheory Part B supplies projection-valued measures (SA-B14–SA-B33), with the diagonal scalar measure `ProjValMeasure.diagMeasure` (SA-B21: μ_v(B)=⟪v,E(B)v⟫ is positive of mass ‖v‖²), the intersection law `proj_inter` (SA-B29: E(B)E(C)=E(B∩C)) and the Borel functional calculus `borelCalculus` of a normal bounded operator (SA-B05), under which bounded Borel indicators map to spectral projections (SA-B26). SA-B01–SA-B36 is the normal bounded calculus. Part E supplies the spectral projection-valued measure P_A of an unbounded self-adjoint A (SA-E01, SA-E03), the resolvent formula ⟪ξ,R(z)ξ⟫=∫(z−s)⁻¹dμ_ξ(s) with R(z)=(z−A)⁻¹ (SA-E05), Stone's theorem (SA-E43) and uniqueness of the spectral measure (SA-E44); it does not state the representation A=∫t dP_A(t) on {v:∫t²dμ_v<∞}, which §0.6 proves. SA-D20 supplies R(z)⁎=R(z̄) for self-adjoint A. These are consumed contracts. ([Tes09], §3.1, (3.5)–(3.15), pp.88–90; §§3.1–3.3, pp.88–105.)

**Checks of the supplied projection-measure contract.**

- For diag(a,b), E(B)=diag(1_B(a),1_B(b)).
- E(∅)=0 and E(ℝ)=I, including the zero Hilbert space.
- On L²(ℝ), E(B) is multiplication by 1_B.

OperatorIdeals supplies the nuclear gauge and the trace-class family (OI-B29–OI-B30), the Hilbert–Schmidt energy `hilbertSchmidtEnergy` and its basis independence (OI-B32–OI-B35), the Hilbert–Schmidt norm and family (OI-B36–OI-B41), the identification of Schatten exponent 1 with trace class (OI-B83) and the Hilbert–Schmidt compactness and energy API (OI-B90, OI-C01–OI-C14). In the notation used below, the basis-norm contract is ‖A‖HS²=Σ_j‖Ae_j‖² (OI-B32–OI-B35) and the ideal bound is ‖BAC‖HS≤‖B‖‖A‖HS‖C‖ (OI-B40). OperatorIdeals does not state that a product of two Hilbert–Schmidt operators is trace class; that statement, BC trace class with ‖BC‖₁≤‖B‖HS‖C‖HS, is the target `trace_class_of_hs_mul` of §0.9 ([Tes09], §6.3, Lemma 6.13, pp.142–143). Trace class means summable singular values; the gauge is Σs_j(A). The complex trace and measurable-kernel formulas below use these contracts. ([Tes09], §§6.2–6.3, Theorems 6.6–6.7, Lemmas 6.10, 6.13, 6.15–6.16 and Corollary 6.14, pp.136–144.) RepresentationTheory/CompactGroups supplies Peter–Weyl, with the convolution operators of continuous kernels used in its proof (Layer 5); general square-integrable kernels are §0.8 here. RepresentationTheory/LieHighestWeight Layer 7 supplies the Harish-Chandra central algebra and infinitesimal characters.

### From the adelic and local representation roadmap targets

AdelicAlgebraicGroups Layer 0, §§0.1–0.3 supplies the restricted products and Haar product; §§2.1–2.3 supplies logarithmic height, modulus and quotient integration with integration in stages and split-centre comparison; §3.1 supplies Levi and Iwasawa data, relative roots and chambers; §§3.4–3.6 supplies rational reduction, adelic heights, Siegel covering and finiteness. SmoothRepresentationsOfLocalGroups SR.1.1–SR.1.3 supplies the Hecke action, SR.2.2 normalized parabolic induction and Jacquet modules, SR.3.1 finite length, SR.3.3 tempered representations and the Langlands classification conditional on Harish–Chandra tempered support (so §2.7 inherits that hypothesis), and SR.4.1–SR.4.2 Satake and spherical parameters. ReductiveGroupsPartII RG2.0 supplies the local-point topology, RG2.4 the nonarchimedean decompositions and integration, and RG2.5 the dual group and L-group to these contracts; the rational parabolics and relative roots are supplied by ReductiveGroups Layer 7. None of these contracts supplies an Eisenstein continuation or automorphic spectral completeness theorem.

### From ArithmeticLocallySymmetricSpaces and the automorphic roadmap targets

ArithmeticLocallySymmetricSpaces ALS.F.5 supplies relative (𝔤,K) cochains and their invariant forms; ALS.5b.1 specializes them to (𝔪_G,K_∞) with 𝔪_G=𝔤/𝔞_G. ALS.F.6 supplies smooth adelic functions, the uniform-moderate-growth space T([G]), constant terms, cuspidal automorphic representations, and cuspidal discreteness/finite multiplicity. Transitivity of constant terms in stages is constructed in §0.51 from integration in stages (AdelicAlgebraicGroups §2.2). ALS.4.5 supplies Kostant's decomposition with weights w(λ+ρ)−ρ. ALS.5b.1 supplies de Rham comparison with local coefficients, ALS.5b.3 supplies moderate-growth comparison, and ALS.5b.5 supplies cuspidal cohomology. ALS.5b.4 takes `LocallySymmetric.FrankeInput(G,K,V)` as a hypothesis. Layer 5 below proves all three clauses of that hypothesis under the neat-level, irreducible-coefficient, split-central and full-K_∞ conventions above; it uses none of those clauses as an assumption.

ArithmeticLocallySymmetricSpaces ALS.F.1 (`LocallySymmetric.realPoints_lieGroup`) supplies the real Lie group and maximal compact; ALS.0.2 supplies the real reductive Lie adapter. RepresentationTheory/LieGroups Layer 9 supplies `iwasawaDecomposition`, Cartan and KAK decompositions. Sections 0.48–0.49 construct real discrete series, tempered representations, the real Langlands classification, smooth Fréchet globalizations and normalized real induction with covariance a^(ν+ρ_P)σ(m), right translation, K∩M_P compact picture and induction in stages. For GLₙ, consume AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, `archimedean-smooth-representations` and `restricted-tensor-realizations`; §§0.49–0.50 construct the general-group extensions with agreement on those specializations. For convention Y, consume completion-valued adeles, residue characters and the discrete/cocompact rational additive quotient from its AL.3 `curve-additive-analysis`, including the `CurveAdditiveAnalysis` annihilator, conductor and Poisson API. Section 1.10a adds determinant-degree/Iwasawa data, quotient-volume normalization and reduction; §1.10b constructs the Eisenstein theory. Consume GLₙ isobaric sums and Satake products from its Representation prerequisites, `isobaric-construction`, and isobaric uniqueness over number fields from AL.3 `isobaric-strong-multiplicity-one`. Residual classification is constructed in §§4.14–4.14a after the cuspidal Eisenstein continuation and residue prefix; §§4.15a–4.15e construct the residual scalar applications from the AL.3 cuspidal factors, with the normalizing scalar owned by §4.15d. AutomorphicLFunctionsAndLocalFactors AL.0 supplies local and adelic Fourier analysis with self-dual measures and Fourier inversion, and its Bessel transforms section specifies K_ν(c)=(1/2)∫₀^∞u^(ν−1)exp(−c(u+u⁻¹)/2)du for c>0, with K_{−ν}=K_ν, entire dependence on ν and K_{1/2}(c)=√(π/(2c))e^(−c). These are mathematical target contracts, rather than declarations imported from the pinned libraries. The Euclidean Paley–Wiener theorem on 𝔞_P^G is the target in §1.6; AutomorphicLFunctionsAndLocalFactors AL.1 supplies the global Tate zeta integral and Hecke functional equation; AL.2–AL.3 supply standard and cuspidal Rankin–Selberg scalar factors.

For the specified compatible packet parameters in §2.8, ArithmeticGaloisRepresentations §§2.4–2.7 supplies the local parameter-factor calculations, using ReductiveGroupsPartII RG2.5's dual groups and L-groups. Section 2.8 constructs the displayed classical-group normalizer and its global meromorphic product comparison under the packet-compatibility hypothesis.

## How to read the build

Layer 0 constructs the new analytic interfaces and explicit kernels. Layers 1–4 pass from convergent induction and Eisenstein series through continuation, truncation and norm identities to the onto spectral transform. Layer 5 uses that theory to prove weighted acyclicity and the complete Franke contract. Within Layer 5, construct the rapidly decreasing core theorem §5.7a and the constant-term resolution §5.9 before weighted acyclicity §5.8. Layer 6 constructs Paley–Wiener transforms and then the trace distributions. Layer 7 constructs the cyclic twisted trace comparison and norm transfer from those distributions, then solvable base change and the degree-one comparison. Build §2.3a before §3.6a; build §§3.6a–3.6d in order after their listed prerequisites. The number-field residual-block theorem §4.14a follows §§1.1–1.5, 2.4 and 2.6. Within the main branch, chamber convergence and the pseudo-Eisenstein inner product precede continuation; the packet norm precedes, and does not substitute for, onto completeness.

The layers group targets by subject. Two branches therefore cite later-numbered sections; the dependency graph has no cycles, and the following orders build them.

- *Modular branch.* The special functions of §§0.25–0.45 and the series of §§1.14–1.28 come first, then the completed series and its Fourier expansion and continuation (§1.15, §§2.17–2.18). The growth and weight-two expansions §§1.29–1.30 use §2.17. The self-adjoint level-N Laplacians and their cusp domains of §1.16a precede the spectral expansion §4.8, which also needs the main-branch completeness of §§4.3–4.4. The resolvent and residue sections §§2.19–2.23 use §4.8 and come after it, as do §§4.9 and 4.18–4.20. The initial Green sum §2.25 needs only Layers 0–1; its continued residue theorem §2.24 needs both §2.25 and the resolvent §2.19.
- *Function-field branch* (everywhere-unramified GLₙ over 𝔽_q(X)). (1) The function-field adelic and cuspidal analytic prerequisites §§1.10a–1.10b, then the finite-dimensional prefix: the character tori §1.11, determinant root coordinates §3.10, Weyl-fixed Levis §6.25 and torus pairings §6.26. (2) The discrete spectrum and discrete pairs §§4.11–4.12, then the induced sections §1.12. (3) Additive and multiplicative (G,M)-families and their identities: §§6.7–6.8, then §§6.27–6.33. (4) Good representatives, residual classification and scalar applications: §§4.13–4.15e, then §4.17 and §4.16, using the cuspidal families of §1.10b and the retained AutomorphicLFunctionsAndLocalFactors AL.3 cuspidal factors. In particular, §§4.14–4.15e precede the residual specialization of §2.16. Section 4.14a is the separate number-field branch. (5) Extend the intertwiner families §2.15 to these discrete data, then §1.13 and §2.16. (6) The degree cutoffs §§3.11–3.19. (7) The cycle covers §§0.19–0.24, then §6.34. (8) The fixed-degree trace §§6.21–6.22, the bundle, Higgs and stability dictionaries §§6.22a–6.22c, then §§6.23–6.24, then §§6.36, 6.37, 6.38, 6.35 and 6.39. The root-basis identity §6.40 needs only §3.1 and §3.10.

## Layer 0: Hilbert fields, vector analysis and rank-one kernels

### 0.1 Measurable separable Hilbert fields

Define `measurable_hilbert_field` as follows. A measurable Hilbert field over a standard Borel X has complete complex fibres Hₓ and a complex-linear section space M: x↦‖s(x)‖ is measurable for s∈M; a section t lies in M exactly when x↦⟪t(x),s(x)⟫ is measurable for every s∈M; and M contains a countable sequence whose values are dense in every fibre. Changing the fundamental sequence preserves M.

*Standing hypotheses:* X is standard Borel; fibres are separable; inner products conjugate the first variable.

Prove the following API statements.
- `ofFundamental`: A sequence with measurable pairwise Gram entries and pointwise dense span generates exactly one saturated measurable-section space.
- `mem_iff_pairing`: s∈M iff its pairings with every fundamental section are measurable.
- `map_isometry`: A fibrewise unitary carrying one fundamental sequence to measurable sections transports M; identity and composition agree.

**Checks.**
- For the standard constant ℂ field, with the constant-one section in M, M is exactly the measurable complex functions.
- If every fibre is zero, M contains the unique section.
- Adding measurable limits of finite rational combinations to a fundamental sequence leaves M unchanged.

([Yetter04], §2 Definition 1, pp.2–3; Example 4, p.4.)

*Needs:* `MeasureTheory.L2.inner_def`.


### 0.2 Direct integral Hilbert space

Define `direct_integral` as follows. For a measurable Hilbert field and a σ-finite Borel measure μ, form square-integrable measurable sections s with ∫‖s(x)‖²dμ<∞, quotient by equality μ-almost everywhere, and give the quotient inner product ∫⟪s(x),t(x)⟫dμ. This is complete and separable for a standard Borel σ-finite measure. Null fibres and null subsets have no effect. Scalar-valued and finite atomic instances identify with Mathlib L² and weighted Hilbert sums.

*Standing hypotheses:* the field is measurable in the preceding saturated/countable sense; μ is σ-finite.

Prove the following API statements.
- `mk`: A measurable square-integrable section has a canonical class.
- `mk_eq_mk`: Two such classes agree iff the sections agree μ-almost everywhere.
- `inner_mk`: The inner product of classes is the integral of fibre inner products.
- `reindex`: A measure-preserving Borel isomorphism and measurable fibrewise unitaries induce a unitary reindexing map.

**Checks.**
- The standard constant ℂ field, with the constant-one section in M, identifies unitarily with L²(μ;ℂ).
- For μ=aδ₀+bδ₁ with a,b>0, ‖(v₀,v₁)‖²=a‖v₀‖²+b‖v₁‖².
- Changing a section on a μ-null singleton leaves its class unchanged even when its value changes.

([Yetter04], §4 Definition 26, p.13; Theorem 27, pp.13–14.)

*Needs:* §0.1; `MeasureTheory.L2.inner_def`; `MeasureTheory.integral_tsum`.


### 0.3 Decomposable operators

Define `decomposable_operator` as follows. An operator field Aₓ:Hₓ→Kₓ is measurable when it carries every measurable section to a measurable section. If ess supₓ‖Aₓ‖<∞, it induces a bounded operator D(A) between the direct integrals by [s]↦[x↦Aₓs(x)]. Its norm equals ess sup‖Aₓ‖; adjoints and compositions are fibrewise, and two fields induce the same operator iff they agree almost everywhere.

*Standing hypotheses:* σ-finite standard Borel base; measurable separable fields; essentially bounded operator norm.

Prove the following API statements.
- `apply_mk`: D(A)[s]=[Aₓsₓ].
- `norm_eq_essSup`: ‖D(A)‖=ess supₓ‖Aₓ‖.
- `adjoint`: D(A)⁎=D(A⁎); D(B∘A)=D(B)∘D(A).

**Checks.**
- The identity operator field induces the identity on the direct integral, of norm one whenever the direct integral is nonzero.
- Changing A on a null set induces the same operator.
- Multiplication by the real coordinate on L²(ℝ) has no bounded extension agreeing almost everywhere on all compactly supported vectors.

([Yetter04], §2 Definition 2, p.3; §4 Definition 26, p.13; Theorem 27, pp.13–14.)

*Needs:* §0.2.


### 0.4 Isometric integration maps

Prove `isometric_integration_map`. Let D be a dense linear subspace of a direct integral and W₀:D→H a linear map into a complete Hilbert space satisfying ⟪W₀u,W₀v⟫=∫⟪uₓ,vₓ⟫dμ. Then W₀ extends uniquely to a linear isometry W of the entire direct integral. Its range is closed; W is unitary onto H exactly when the range of W₀ is dense. An isometry alone does not prove spectral completeness.

*Standing hypotheses:* D is dense; the stated Gram identity holds for every u,v∈D.

([Tes09], §§0.4–0.5 Theorems 0.23, 0.26, pp.22–24.)

*Needs:* §0.2.


### 0.5 Herglotz representation

Prove `herglotz_representation`: for holomorphic F with Im F≥0 on the upper half-plane, the subtracted-kernel representation F(z)=a+bz+∫[(t−z)⁻¹−t/(1+t²)]dν has a unique triple with a=Re F(i), b≥0, ν positive and ∫(1+t²)⁻¹dν finite. The new content is the density conversion dν=(1+t²)dρ from the supplied finite measure and uniqueness in this convention. For resolvents, identify b=0 and finite mass by the asymptotic at i∞; polarize to reconstruct the spectral measure.

The API uses `weightedMeasure` for the positive density change, `weighted_mass` for ∫(1+t²)⁻¹dν=ρ(ℝ), and `integral_conversion` for equality of the two integrable kernels.

**Checks.**

- For ρ=0, ν=0 and the representation reduces to a+bz.
- For ρ=δ₂, ν=5δ₂ and ∫(1+t²)⁻¹dν=1; using the reciprocal density gives the wrong mass.
- For F(z)=z the unique triple is (a,b,ν)=(0,1,0); reversing the resolvent sign violates the nonnegative-imaginary-part hypothesis.

*Standing hypotheses:* the sign is the resolvent convention (A−z)⁻¹; a resolvent written (z−A)⁻¹ has the opposite sign.

([Tes09], §3.4 Theorem 3.20, p.107; [Sha25], §10.1 Theorem 10.5, equation (10.1), and proof, printed pp.125–126.)

*Needs:* Tau Ceti `Analysis.Complex.Pick.Nevanlinna`; Mathlib `Measure.withDensity` and change-of-density integration.


### 0.6 Unbounded self-adjoint spectral theorem

Prove `unbounded_selfadjoint_spectral`, the measurable-multiplicity form of the supplied spectral theorem. If H is separable, A is unitarily equivalent to multiplication by the coordinate on a countable Hilbert sum of cyclic spaces L²(ℝ,μₙ), hence on a measurable-multiplicity direct integral (§0.2), compatibly with Stone's correspondence. As a corollary, with P_A the supplied spectral measure, dom A={v:∫t²dμ_v(t)<∞} and ⟪w,Av⟫=∫t d⟪w,P_A(t)v⟫ for v in the domain; the upstream roadmap supplies P_A and the resolvent formula but not this representation.

*Standing hypotheses:* A is self-adjoint, not merely symmetric or essentially self-adjoint on an unspecified domain.

([Tes09], §3.1, Lemma 3.4, p.93 and Theorem 3.7, p.96; §3.3, Theorem 3.17, p.105.)

*Needs:* the projection-measure supplier contract; §0.5; §0.2; `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul`.


### 0.7 Bounded normal spectral theorem

Prove `bounded_normal_spectral`, the measurable-multiplicity model of the supplied normal calculus. On a separable space N is unitarily equivalent to coordinate multiplication on a measurable-multiplicity direct integral over its spectrum; the finite-dimensional eigenbasis is the atomic case.

*Standing hypotheses:* N⁎N=NN⁎; H is separable and complete.

([Tes09], §3.1, Lemma 3.4, p.93 and §3.3, Lemma 3.16 and Theorem 3.17, pp.104–105 gives self-adjoint multiplication models. The bounded-normal complex-spectrum multiplicity model is the extension required here.)

*Needs:* §0.6; the projection-measure supplier contract; §0.2; `LinearMap.IsSymmetric.eigenvectorBasis`.


### 0.8 Measurable Hilbert–Schmidt kernels

Define `hilbert_schmidt_kernel` on scalar L² spaces as follows. On σ-finite standard Borel measure spaces X and Y, a square-integrable kernel gives a Hilbert–Schmidt operator with exactly its kernel L² norm, extending the continuous compact-kernel case of CompactGroups.

Throughout, the scalar L² spaces are complete and separable; use countable orthonormal bases and the product measure on X×Y.

Prove the following API statements.
- `kernel_apply`: The integral operator agrees almost everywhere with x↦∫K(x,y)f(y)dμ(y).
- `kernel_unique`: Equal kernel L² classes induce equal operators, and the kernel-to-operator map is an isometric linear embedding.
- `kernel_norm`: For K∈L²(X×Y), the integral operator has HS norm ‖K‖₂.

**Checks.**
- For v↦⟪u,v⟫w, ‖A‖HS=‖u‖‖w‖.
- On a Hilbert space with an ℕ-indexed Hilbert basis the identity has no Hilbert–Schmidt representative.
- On an n-dimensional Hilbert space the identity is Hilbert–Schmidt and has Hilbert–Schmidt norm √n.

([Tes09], §6.3, (6.8)–(6.13) and Lemma 6.10, pp.139–140.)

*Needs:* the OperatorIdeals Hilbert–Schmidt contract; `MeasureTheory.integral_prod`; `MeasureTheory.L2.inner_def`.


### 0.9 Complex operator trace

Define `operator_trace` on the supplied trace-class ideal by tr A=Σ⟪e_j,Ae_j⟫. The diagonal series is absolutely convergent and basis independent, |tr A|≤‖A‖₁, and tr(AD)=tr(DA) for bounded D. Trace norm convergence permits passage through trace, unlike strong convergence alone.

*Standing hypotheses:* trace is operator trace, with the first inner-product slot conjugated.

Prove the following API statements.
- `trace_basis`: tr A=Σ_j⟪e_j,Ae_j⟫ with absolute convergence for any basis.
- `trace_class_of_hs_mul`: for Hilbert–Schmidt B,C, BC is trace class with ‖BC‖₁≤‖B‖HS‖C‖HS, and every trace-class operator is such a product ([Tes09], §6.3, Lemma 6.13, pp.142–143).
- `trace_hs_product`: For Hilbert–Schmidt B,C, tr(BC)=Σ_j⟪B⁎e_j,Ce_j⟫; this series converges absolutely by Cauchy–Schwarz.
- `trace_cyclic`: For trace-class A and bounded D, tr(AD)=tr(DA).
- `trace_continuous`: |tr(A−B)|≤‖A−B‖₁.

**Checks.**
- tr(v↦⟪u,v⟫w)=⟪u,w⟫.
- The bounded diagonal operator with basis coefficients 1/(n+1) is Hilbert–Schmidt and has no trace-class representative.
- An orthogonal projection of rank r has trace and trace norm r.

([Tes09], §6.2 Theorems 6.6–6.7; §6.3 Lemma 6.13, Corollary 6.14 and Lemmas 6.15–6.16, printed pp.136–144.)

*Needs:* §0.8; the OperatorIdeals trace-class and product contracts.


### 0.10 Diagonal trace under a factorization hypothesis

Prove `kernel_trace_diagonal`. Let X be σ-finite and K₁,K₂∈L²(X×X). The trace-class product T₁T₂ has trace ∫_{X×X}K₁(x,y)K₂(y,x)dμ(x)dμ(y). If specified representatives give K(x,z)=∫K₁(x,y)K₂(y,z)dμ(y) at every diagonal point almost everywhere, with that diagonal measurable, then tr(T₁T₂)=∫K(x,x)dμ(x). A bare equivalence class K∈L²(X×X) does not define K(x,x); continuity or the displayed factorization must fix the representative.

*Standing hypotheses:* Fubini is applied to the absolutely integrable product, bounded by ‖K₁‖₂‖K₂‖₂.

([Tes09], §6.3, (6.10)–(6.12), p.139 and Lemma 6.15, p.143. The representative-sensitive diagonal identity is obtained from the product-kernel expansion.)

*Needs:* §0.8; §0.9; `MeasureTheory.integral_prod`.


### 0.11 Nuclear Fréchet and LF test spaces

Define `nuclear_lf_space` as follows. For Hausdorff locally convex complex E, define Fréchet by completeness and a countable seminorm topology. Nuclear maps admit Banach factorizations Σ_jλ_jℓ_j⊗v_j with Σ_j|λ_j|<∞ and bounded functionals/vectors; nuclear spaces require these factorizations for strengthened seminorm quotient maps. A strict LF space is a countable inductive limit of Fréchet spaces with closed topological embeddings. Fixed-level, fixed-compact-support smooth adelic functions are nuclear Fréchet, and their support/level limit is the nuclear LF space 𝓓(G(𝔸)). Quasi-completeness means completeness of every closed bounded subset.

*Standing hypotheses:* a countable exhaustion and a second-countable finite-dimensional real Lie group are fixed; nonarchimedean test functions are locally constant.

Prove the following API statements.
- `supportLevelPiece`: Compact support and finite level define a nuclear Fréchet subspace with seminorms sup‖D f‖.
- `inclusion`: Increasing support and lowering finite level give continuous closed embeddings and their induced LF maps.
- `bounded_stage`: A bounded set in the strict LF test space is contained and bounded in one Fréchet stage.
- `distributionDual`: Continuous complex-linear functionals form the strong and weak distribution duals with their topologies.

**Checks.**
- The constant finite-group function stages induce exactly the usual finite-dimensional topology on their function space.
- For real smooth compactly supported tests, the support-stage construction agrees with Mathlib TestFunction topology, and each fixed-support stage embeds as a closed subspace.
- The translates by n of a fixed nonzero real test function are not von Neumann bounded in the LF topology; failure of a common support alone is not the conclusion.

([BPCZ22], Appendix A.0.1, A.0.4 and A.0.6, pp.326–330.)

*Needs:* ArithmeticLocallySymmetricSpaces ALS.F.6 (smooth adelic functions); `WithSeminorms.banach_steinhaus`; `TestFunction`; `TestFunction.topologicalSpace`.


### 0.12 Quasi-complete vector integration and summation

Prove `locally_convex_integration`. For a quasi-complete Hausdorff locally convex E and a continuous E-valued map on a σ-compact locally compact Radon space, integrability of every continuous seminorm gives a unique vector integral characterized by all continuous linear functionals. Absolutely seminorm-summable families admit unordered sums and continuous linear maps commute with both constructions. A nuclear continuous map carries summable families to absolutely summable families. Bochner integrals in complete normed spaces agree with this integral.

*Standing hypotheses:* every seminorm integral is finite; summable and absolutely summable are different hypotheses.

([BPCZ22], Appendix A.0.2 and Lemmas A.0.6.1–A.0.6.2, pp.327, 329–330.)

The integration API consists of `integral_dual` (every continuous scalar functional commutes with the integral), `integral_map` (continuous linear postcomposition), `sum_map` (the analogous unordered-sum law), and `bochner_comparison` (agreement with the complete normed-space integral).

**Checks.**

- On a two-point probability space a function with values v and w integrates to (v+w)/2; counting measure instead gives v+w.
- The zero function and the empty summation family give zero, including the zero target space.
- In E=ℂ, integrating t↦t over [0,1] gives 1/2, agreeing with the native Bochner integral; merely weak convergence cannot replace the required seminorm majorants.

*Needs:* §0.11; `MeasureTheory.integral_tsum`; `MeasureTheory.integral_prod`.


### 0.13 Nuclear LF function-space kernel theorem

Consume the Hausdorff completed projective tensor E⊗̂πF, its complete-target universal property, canonical bilinear map and functoriality from NoncommutativeGeometry N1. Prove `nuclear_function_kernel`: let E and F be Hausdorff locally convex spaces of complex functions on sets X and Y, with topologies finer than pointwise convergence, and let E be a complete nuclear LF space. Require the completion F̂ to be realized as a space of functions on Y whose point evaluations separate points. The map e⊗f↦((x,y)↦e(x)f(y)) extends to a continuous linear injection E⊗̂πF→ℂ^(X×Y). Its image consists precisely of functions h for which h(x,−) belongs to the completion F̂ for every x, and x↦ℓ(h(x,−)) belongs to E for every ℓ∈F′, extended continuously to F̂.

*Standing hypotheses:* the pointwise embeddings of E and F̂ and Hausdorffness are specified; completeness and nuclear LF structure are required on E; the second factor is completed in its stated function realization.

The API identifies elementary tensors pointwise, proves uniqueness from point evaluations, and characterizes the image by the two slice conditions.

**Checks.**

- For E=ℂ^m and F=ℂ^n, the image is all m×n arrays.
- For X a singleton and E=ℂ, the image is F̂ in its pointwise function realization.
- If either factor is zero, the image is zero.

([BPCZ22], Appendix A.0.7, (A.0.7.8), pp.330–331.)

*Needs:* NoncommutativeGeometry N1 (completed projective tensors); §0.11; §0.12.


### 0.14 Vector-valued Schwartz spaces

Define `vector_schwartz` as follows. For finite-dimensional real V and quasi-complete locally convex E, define 𝓢(V,E) by smoothness and finiteness of sup_v(1+‖v‖)^N p(Df(v)) for every N, constant-coefficient differential operator D and continuous seminorm p; these define its topology. For complete nuclear E, identify it with 𝓢(V)⊗̂πE under the completeness hypotheses of A.0.9. The normed-target and continuous-postcomposition cases consume Mathlib's SchwartzMap.

*Standing hypotheses:* V finite dimensional; E Hausdorff quasi-complete; tensor identification assumes the stronger stated completeness/nuclearity.

Prove the following API statements.
- `tensor_apply`: (φ⊗e)(v)=φ(v)e.
- `map`: A continuous linear map E→F acts pointwise continuously on Schwartz spaces.
- `fourier`: The vector Fourier transform commutes with continuous scalar functionals and is a continuous automorphism with the dual Haar normalization.

**Checks.**
- For E=ℂ this agrees with Mathlib SchwartzMap.
- The transform of e^(−π‖v‖²)e is the same Gaussian times e for self-dual Euclidean measure.
- A nonzero constant E-valued map on ℝ is not Schwartz.

([BPCZ22], Appendix A.0.8–A.0.9 and Lemma A.0.9.1, pp.331–332.)

*Needs:* NoncommutativeGeometry N1 (completed projective tensors); §0.13; §0.12; `SchwartzMap`; `SchwartzMap.postcompCLM`.


### 0.15 Weak and strong meromorphic operator families

Define `operator_meromorphic` as follows. On a finite-dimensional complex parameter domain U, a continuous-operator family A:E→F is strongly meromorphic with locally finite polar hyperplanes if locally a finite product q of defining linear forms makes qA holomorphic for the topology of uniform convergence on bounded sets. Weak meromorphy tests ℓ(A(z)e), but its equivalence to strong meromorphy requires one common local denominator, barrelled E, quasi-complete F, and locally bounded regularized maps. Laurent coefficients along a transverse coordinate are continuous operators; finite-rank polar parts are an additional conclusion, not part of the definition.

*Standing hypotheses:* one common denominator and the specified bounded-set topology are essential.

Prove the following API statements.
- `regularize`: Strong meromorphy is equivalent to a local common scalar denominator giving bounded-set holomorphy.
- `coefficient`: A transverse Laurent coefficient is obtained by a continuous vector Cauchy integral.
- `compose`: Continuous fixed pre- and post-composition commute with regularization and Laurent coefficients.

**Checks.**
- For A(z)=z⁻¹id, the residue at 0 is id and is infinite rank when E is infinite dimensional.
- A holomorphic family has zero negative Laurent coefficients.
- For the direct-sum family with nth coordinate z^(−n), every finitely supported vector has a local denominator, but no common exponent and radius regularize all basis vectors.

([BPCZ22], Appendix A.0.3–A.0.4, pp.328–329 supplies weak holomorphy and pointwise Hom topology. The bounded-set operator topology and common-denominator meromorphic extension are additional targets here; [Art05], §7, pp.33–35 supplies their Eisenstein application.)

For a normed target and an open one-complex-parameter domain U, `CommonDenominator(U,f)` means that near every z∈U there are n≥0, r>0 and an analytic g with g(s)=(s−z)^n f(s) for s≠z. Require the chosen ball to lie in U. The value assigned to f(z) is irrelevant. `CommonDenominator.mono` restricts to an open subdomain and `CommonDenominator.postcomp` transports regularization through a continuous linear map.

**Checks.**

- The function z↦1/z has a common denominator at zero with exponent one and regularized value one.
- An analytic function uses exponent zero; a removable singularity does not require a nonzero polar part.
- The scalar essential singularity exp(1/z) has no finite denominator at zero, and the coordinate family z^(−n) has no common exponent for all coordinates.

*Needs:* §0.11; §0.12; `WithSeminorms.banach_steinhaus`.


### 0.16 Analytic Fredholm continuation

Prove `analytic_fredholm`. For a norm-holomorphic compact-operator family K(z) on a connected open subset of ℂ, either 1−K(z) is nowhere invertible, or its inverse is norm-meromorphic with discrete poles and finite-rank principal parts. At one invertible point the second alternative holds globally; its inverse agrees with the ordinary bounded inverse away from poles. This one-variable theorem does not by itself supply several-variable hyperplane geometry of Eisenstein singularities.

*Standing hypotheses:* Banach-space norm holomorphy; compact K(z); a known invertible point when claiming continuation.

([DZ22], Appendix C, §C.3, Definitions C.6–C.7 and Theorem C.8, pp.521–523. Apply the Fredholm theorem to 1−K(z); the compact-perturbation contract supplies index zero.)

*Needs:* §0.15; `TauCeti.isFredholm_one_sub`.


### 0.17 Distributional and dominated spectral interchanges

Prove `distribution_convergence`. For the continuous dual of the LF test space, weak distributional convergence means convergence on every fixed test function; strong convergence means uniform convergence on every bounded test set. A uniformly seminorm-dominated family of kernels or spectral integrals admits sum–integral interchange, differentiation and distributional passage to a limit using the cited Mathlib integrability theorems and locally convex integration. Strong convergence follows only when the estimates are uniform on bounded test sets; pointwise convergence alone is insufficient.

*Standing hypotheses:* the majorant is integrable and uniform in the asserted parameter neighborhood and test set.

([BPCZ22], Appendix A.0.2–A.0.4, pp.327–329.)

*Needs:* §0.11; §0.12; `MeasureTheory.integral_prod`; `MeasureTheory.integral_tsum`; `hasFDerivAt_integral_of_dominated_of_fderiv_le`.


### 0.18 Vector Phragmén–Lindelöf principle

Prove `vector_phragmen_lindelof`. Let V be a Hausdorff quasi-complete complex locally convex space and C>0. Let Z_±: {Re s>C}→V be holomorphic of finite order in vertical strips. Let H⊂V′ be total (its common kernel is zero). Suppose every ℓ∘Z_±, ℓ∈H, extends to an entire scalar function of finite order in vertical strips and satisfies ℓZ_+(s)=ℓZ_−(−s). Then uniquely Z_± extend to entire V-valued functions of finite order in vertical strips, satisfying Z_+(s)=Z_−(−s). Order≤d means that for every d′>d, exp(−|s|^(d′))Z(s) is bounded in each closed vertical strip of the domain. Finite order is not a polynomial bound.

*Standing hypotheses:* V is quasi-complete and Hausdorff; C>0; one finite order for each initial vector family; H is a linear total subspace of the continuous dual. Scalar entire continuation, finite strip order and the reflected functional equation hold for every ℓ∈H.

([BPCZ22], Appendix A.0.8 definition; Lemma A.0.10.1, printed p.332.)

In a normed specialization, `StripOrder(f,d,C)` is the displayed bound for every d′>d and every C<a≤b. `FiniteStripOrder(f,C)` asserts some positive d. Prove `StripOrder.mono_order`, `StripOrder.add` (with order the larger of the two positive orders), and `FiniteStripOrder.postcomp`.

**Checks.**

- A constant normed-valued function has strip order one on every right half-plane; the zero function permits the bound M=0.
- The entire scalar family exp(z²) has finite strip order although it need not have polynomial growth in every direction. The definition controls vertical strips, rather than requiring a polynomial bound on ℂ.
- On a strip through the imaginary axis, exp(exp(−iz)) is not of finite strip order: at z=it its norm is exp(exp(t)), exceeding every bound exp(|t|^d′)M.

*Needs:* §0.12; §0.15.


### 0.19 Cycle coordinates for the spectral character cover

Define `spectral_cycle_coordinates` as follows. Let w permute equal-rank blocks of M. Index its nonempty cycles by j, with length l_j≥1 and common block rank d_j≥1; N_j=l_j*d_j and n=ΣN_j. In unit-circle coordinates z_(j,t), define T by ∏_(j,t)z_(j,t)^d_j=1; A consists of cycle-constant u_j with ∏u_j^N_j=1; B satisfies ∏_t v_(j,t)^d_j=1 separately for each j, and B0 satisfies ∏_t v_(j,t)=1 separately. Embed A and B in T. These are respectively Im X_M^G, Im X_L^G, Im X_M^L and its identity component, L=L_w.

*Standing hypotheses:* compact abelian Lie groups with probability Haar, including disconnected components; smoothness and finite covering assumptions in the statement.

Prove the following API statements.
- `cycleTori`: Construct closed subgroups T,A,B,B0 of finite products of Circle from positive integral cycle/rank data.
- `componentProduct`: The map B→∏_j μ_(d_j), v↦(∏_t v_(j,t))_j is onto with connected kernel B0.
- `embedCentral`: A embeds by repeating u_j in its l_j coordinates, and its intersection with B0 is ∏_j μ_(l_j).

**Checks.**
- For one cycle l=2,d=1: A=μ₂, B=B0={(z,z⁻¹)}.
- For one cycle l=1,d=2: B=μ₂ while B0={1}; replacing B by its identity component loses two points.
- For w=1, every l_j=1, A=T and B=∏_j μ_(d_j), with B0={1}.

([Yu22], §§5.2.2–5.2.3, pp.32–36.)

*Needs:* §1.11; §6.25; §6.26; `MeasureTheory.integral_prod`.


### 0.20 Difference map on every Weyl cycle

Prove `weyl_cycle_difference_map`. For the groups of §0.19, δ_w:B→B0, v↦v/w⁻¹(v), is surjective, with kernel ∏_j μ_(N_j). Every fibre has ∏_j N_j points, even when B is disconnected.

*Standing hypotheses:* compact abelian Lie groups with probability Haar, including disconnected components; smoothness and finite covering assumptions in the statement.

([Yu22], §§5.2.2–5.2.3, pp.32–36.)

*Needs:* §0.19; `MeasureTheory.integral_prod`.


### 0.21 Degree and fibres of the spectral cover

Prove `spectral_cover_fibres`. The continuous homomorphism mu_w:A×B→T, (a,c)↦a*δ_w(c), is onto with |ker mu_w|=D=(∏l_j)(∏N_j)=|w|*|X_L^L|. For any tau∈T its fibre consists of the finite pairs a∈A, b∈B0 with tau=a*b, followed by c∈B with δ_w(c)=b. There are ∏l_j outer pairs and ∏N_j inner lifts.

*Standing hypotheses:* compact abelian Lie groups with probability Haar, including disconnected components; smoothness and finite covering assumptions in the statement.

([Yu22], §§5.2.2–5.2.3, pp.32–36.)

*Needs:* §0.19; §0.20; `MeasureTheory.integral_prod`.


### 0.22 Normalized transfer along a finite compact-group cover

Define `compact_cover_transfer` as follows. For a continuous surjective homomorphism p:H→K of compact abelian Lie groups with finite kernel F of size D>0, define Tr_p f(y)=D⁻¹Σ_(p(x)=y) f(x). For continuous f this is continuous, and for smooth f it is smooth. Every group carries probability Haar.

*Standing hypotheses:* compact abelian Lie groups with probability Haar, including disconnected components; smoothness and finite covering assumptions in the statement.

Prove the following API statements.
- `transfer`: Use any lift x of y and average f(x*k) over k∈ker p; prove lift independence.
- `integralTransfer`: For continuous f, ∫_K Tr_p f=∫_H f, by kernel averaging and Haar invariance.
- `pullbackTransfer`: For continuous g on K, Tr_p(g∘p)=g; for a character χ of H the transfer vanishes unless χ is trivial on ker p, in which case it is the descended character.

**Checks.**
- Tr_id f=f and Tr_p 1=1 for every nonempty finite fibre.
- For the circle square-cover, normalized transfer of z² is the target coordinate and transfer of z is zero.
- For C₄→C₂, j↦j mod 2, the character i^j transfers to zero; the even nontrivial character (−1)^j descends to the nontrivial character of C₂.

([Yu22], §§5.2.2–5.2.3, pp.32–36.)

*Needs:* `MeasureTheory.integral_prod`; `MonoidHom.measurePreserving`; `UnitAddTorus.hasSum_mFourier_series_apply_of_summable`; `AddChar.expect_eq_ite`.


### 0.23 Pointwise character inversion gives the fibre average

Prove `character_inversion_fibre_average`. For p:H→K as in §0.22 and smooth complex f on H, at every y∈K the absolutely convergent character sum Σ_(χ∈Khat) ∫_H χ(p(x)/y)*f(x) dx equals Tr_p f(y). Equivalently the coefficient indexed by χ is the (χ⁻¹)-Fourier coefficient of Tr_p f. Apply p=mu_w and y=lambda_pi to obtain (5.2.12) with factor D⁻¹.

*Standing hypotheses:* compact abelian Lie groups with probability Haar, including disconnected components; smoothness and finite covering assumptions in the statement.

([Yu22], §5.2.3, equation (5.2.12), printed p.35; compact smooth Fourier argument via §§5.2.1–5.2.3, pp.32–36.)

*Needs:* §0.21; §0.22; §0.24; `MeasureTheory.integral_prod`; `MonoidHom.measurePreserving`; `UnitAddTorus.hasSum_mFourier_series_apply_of_summable`; `AddChar.expect_eq_ite`; `AddChar.complexBasis`.


### 0.24 Smooth Fourier decay on the character groups in the trace formula

Prove `torus_fourier_decay`. On a finite product of Circle and a finite abelian group, a smooth complex function has absolutely summable Fourier coefficients. For torus dimension d and integer s with 2s>d, |fhat(k)|≤C(1+4π²||k||²)^(-s). The statement includes dimension zero and is uniform in a compact auxiliary parameter when the corresponding derivatives are uniformly bounded.

*Standing hypotheses:* compact abelian Lie groups with probability Haar, including disconnected components; smoothness and finite covering assumptions in the statement.

([Yu22], §5.2.3, equation (5.2.12), printed p.35; smooth Fourier justification.)

*Needs:* `MeasureTheory.integral_prod`; `MonoidHom.measurePreserving`; `UnitAddTorus.hasSum_mFourier_series_apply_of_summable`; `AddChar.expect_eq_ite`.


### 0.25 Bessel functions J_ν and I_ν

For the supplied first-kind function write J_ν(y)=Complex.besselJ ν y. Define `bessel_i` for ν∈ℂ and real y by I_ν(y)=(y/2)^ν ₀F̃₁(;ν+1;y²/4), where (y/2)^ν is Mathlib's principal complex power and ₀F̃₁ is Mathlib's entire regularized hypergeometric function `Complex.regularizedHGFun`. Equivalently J_ν(y)=Σ_{k≥0}(−1)^k(y/2)^{ν+2k}/(k!Γ(ν+k+1)) and I_ν drops the sign, with 1/Γ read as entire, so every order is allowed. At y=0 Mathlib's 0^0=1 gives I₀(0)=J₀(0)=1. For positive x, write `rpowC(x,s)=exp(s log x)`; `rpowC.cpow` identifies it with the library's complex power, `rpowC.add` is x^(s+t)=x^s x^t, and `rpowC.deriv` differentiates in the order with factor log x.

**Checks of the positive-base power.**

- rpowC(4,1/2)=2.
- rpowC(4,−1)=1/4 and rpowC(1,s)=1 for every s.
- x=0 is excluded from this analytic interface: a totalized real-log expression there is not the complex-power convention 0^0=1, 0^1=0.


*Standing hypotheses:* ν∈ℂ arbitrary; statements about derivatives are for y>0.

Prove the following API statements.
- `bessel_j_series`, `bessel_i_series`: the displayed power series converge absolutely for every y.
- `bessel_j_ode`, `bessel_i_ode`: for y>0, y²w″+yw′+(y²−ν²)w=0 for w=J_ν and y²w″+yw′−(y²+ν²)w=0 for w=I_ν.
- `bessel_j_recurrence`: J_{ν−1}(y)+J_{ν+1}(y)=(2ν/y)J_ν(y) for y>0.
- `bessel_i_recurrence`: I_{ν−1}(y)−I_{ν+1}(y)=(2ν/y)I_ν(y) for y>0.
- `bessel_i_neg_int`: I_{−n}(y)=I_n(y) for integral n≥0 and y>0.

**Checks of J.**
- J_{1/2}(y)=√(2/(πy)) sin y for y>0.
- J_{−n}=(−1)^n J_n for integers n≥0. The library's totalized reciprocal gamma vanishes at gamma poles; treating a classical pole as an undefined summand would invalidate the series.
- J₀(0)=1 in the totalized series convention; setting every zero-base power to zero loses this value.

**Checks of I.**
- I_{1/2}(y)=√(2/(πy)) sinh y for y>0, so I is not J with the sign of y² forgotten.
- I₀(0)=1 in the totalized series convention.
- I_{−1}(y)=I₁(y) for y>0, whereas J_{−1}(y)=−J₁(y); this distinguishes the modified-Bessel order symmetry.

([DLMF](https://dlmf.nist.gov/10) 10.2.1, 10.2.2, 10.4.1, 10.6.1, 10.16.1, 10.16.9, 10.25.1, 10.25.2, 10.27.1, 10.29.1 and 10.39.1.)

*Needs:* `Complex.regularizedHGFun`; `Complex.radius_regularizedHGFunSeries_eq_top`.


### 0.26 Whittaker M and W functions

Define `whittaker_m` as follows. For y>0 put M_{μ,ν}(y)=Γ(1+2ν)e^(−y/2)y^(ν+1/2) regularized ₁F₁(ν−μ+1/2;1+2ν;y). Initially when Re(ν±μ+1/2)>0 this equals y^(ν+1/2)e^(y/2)Γ(1+2ν)/[Γ(ν+μ+1/2)Γ(ν−μ+1/2)] ∫₀¹ t^(ν+μ−1/2)(1−t)^(ν−μ−1/2)e^(−yt)dt. Define W by y^(ν+1/2)e^(y/2)/Γ(ν−μ+1/2) ∫₁∞t^(ν+μ−1/2)(t−1)^(ν−μ−1/2)e^(−yt)dt in that region, then continue. The M series in the statement is entire in y after stripping the y power and meromorphic in ν; W has decaying normalization.

*Standing hypotheses:* y>0; initial Euler-integral assumptions Re(ν±μ+1/2)>0; continuation excludes uncompensated gamma poles.

Prove the following API statements.
- `eulerIntegral`: For y>0 and Re(ν±μ+1/2)>0, the series-defined M agrees with its displayed Euler integral (`whittaker_m_euler`); the separately continued `whittaker_w` agrees with the convergent tail integral in this region.
- `hypergeometricSeries`: For Re(s)>0, M_{μ,s−1/2}(y)=e^(−y/2)y^s Γ(2s)·regularized ₁F₁(s−μ;2s;y), using Mathlib Complex.regularizedHGFun with singleton numerator and denominator multisets.
- `decayingNormalization`: At positive infinity, W has leading term y^μ exp(−y/2), fixing its scale.
- `whittaker_w_ode`: The continued W solves the same differential equation as M, with the decaying normalization fixing the solution.
- `whittaker_w_order_symm`: W_{μ,−ν}=W_{μ,ν} on the positive real argument.

**Checks of M.**
- M_{0,1/2}(y)=2 sinh(y/2).
- At μ=1, ν=1/2 and y>0, M_{1,1/2}(y)=y e^(−y/2), so the growing-asymptotic coefficient vanishes.
- For t>0, M_{0,1/2}(2t sin(π/2))=2 sinh(t); replacing the argument by t sin(π/2) gives the wrong value.

**Checks of W.**

- W_{0,1/2}(y)=e^(−y/2) for y>0; choosing M instead gives growth.
- W_{1,1/2}(y)=y e^(−y/2) for y>0, by continuation at the exceptional Euler parameter.
- W_{μ,−ν}(y)=W_{μ,ν}(y), including W_{0,−1/2}=W_{0,1/2}; the positive-power prefactor alone does not have this symmetry.

([DIT11], Appendix A, (A.1)–(A.2), p.977; [DIT16], §5, p.961 and Appendix A, M-series display, p.984; [DLMF](https://dlmf.nist.gov/13.14.E31) 13.14.31 supplies W's order symmetry.)

*Needs:* `Complex.regularizedHGFun`; `Complex.radius_regularizedHGFunSeries_eq_top`; `Complex.betaIntegral_eq_Gamma_mul_div`.


### 0.27 Whittaker–Bessel comparison

Prove `whittaker_bessel_comparison`. For y>0 and Re(ν+1/2)>0, I_ν(y)=2^(−2ν−1/2)Γ(ν+1)⁻¹y^(−1/2)M_{0,ν}(2y) and K_ν(y)=√(π/(2y))W_{0,ν}(2y). Beyond this initial integral range, use continued W and exceptional-parameter limits; a divergent totalized integral is not W. Reconcile every factor 2√y in weight-zero expansions.

([DIT11], Appendix A, (A.1)–(A.2) and the Bessel comparisons, p.977.)

*Needs:* `Complex.regularizedHGFun`; `Complex.radius_regularizedHGFunSeries_eq_top`; `Complex.betaIntegral_eq_Gamma_mul_div`; §0.25; AutomorphicLFunctionsAndLocalFactors AL.0, Bessel transforms; §0.26.


### 0.28 Whittaker differential and asymptotic API

Prove `whittaker_asymptotics`. W and M satisfy w″+(−1/4+μ/y+(1/4−ν²)/y²)w=0. For Re(s)>0, M_{μ,s−1/2}(y)=y^s(1+O(y)) near 0. Away from exceptional parameters its large-y growing term and the decaying W asymptotic have the gamma constants in DIT11 (A.4). Uniform derivative bounds are needed before differentiation under integrals. More explicitly, W_{μ,ν}~y^μe^(−y/2), M_{μ,ν}~Γ(1+2ν)/Γ(ν−μ+1/2)y^(−μ)e^(y/2) in the initial Euler-integral region, continued only where the growing coefficient is nonzero.

([DIT11], Appendix A, (A.3)–(A.5), p.977.)

*Needs:* `Complex.regularizedHGFun`; `Complex.radius_regularizedHGFunSeries_eq_top`; `Complex.betaIntegral_eq_Gamma_mul_div`; §0.26.


### 0.29 Sine-power integral

Prove `sine_power_integral`. For Re(ν)>0 and complex β, ∫_0^π e^{iβθ}sin^(ν−1)θ dθ=πe^{iπβ/2}Γ(ν)/(2^(ν−1)Γ((ν+β+1)/2)Γ((ν−β+1)/2)), interpreted via reciprocal gamma. The factor 2^(ν−1) is missing in the displayed source formula on p.984.

([DIT16], Appendix A, p.984; the sine-power identity numbered 3.892(1) in the integral-table reference cited there.)

*Needs:* §0.26; `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; `Complex.Gamma_mul_Gamma_add_half`; §0.25; §0.27.


### 0.30 Whittaker cycle integral

Prove `whittaker_cycle_integral`. For μ∈ℂ, t>0 and Re(s)>0, ∫_0^π exp(±i(t cosθ+μθ))M_{μ,s−1/2}(2t sinθ)dθ/sinθ = exp(±iπμ/2)(2π)^(3/2)2^(−s)Γ(2s)[Γ((s+1+μ)/2)Γ((s+1−μ)/2)]⁻¹ t^(1/2)J_{s−1/2}(t). Establish the ODE by integration by parts and its t^s leading coefficient using §0.29.

([DIT16], Lemma 7, display (9.4), p. 980 (statement); restated as (A.1), Appendix A, p. 983; proof Appendix A, pp. 983–985.)

*Needs:* §0.26; `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; `Complex.Gamma_mul_Gamma_add_half`; §0.25.


### 0.31 Endpoint-justified integration by parts for both signs

Prove `whittaker_integration_by_parts`. Let H_ε(t)=t^(−s)∫₀^π exp(εi(t cosθ+μθ))M_{μ,s−1/2}(2t sinθ)dθ/sinθ, μ∈ℂ, Re(s)>0, t>0, ε=±1. Then f_ε=t^sH_ε satisfies f_ε″+(1−s(s−1)/t²)f_ε=0. On every compact parameter set with Re(s)≥σ>0 the integrands and their first two t derivatives are bounded by C sin^(σ−1)θ; the integration-by-parts endpoint terms are O(δ^σ). The calculation works for both signs without complex conjugation.

([DIT16], Appendix A, proof of (A.1), p.984: Whittaker angular integration by parts and the differential equation for the angular integral, with vanishing endpoint terms.)

*Needs:* §0.26; `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; `Complex.Gamma_mul_Gamma_add_half`.


### 0.32 Series expansion (A.2) of the Whittaker cycle integral

Prove `whittaker_cycle_series`. For μ ∈ ℂ, Re(s) > 0 and t > 0, ∫_0^π e^{i(t cos θ+μθ)} M_{μ,s−1/2}(2t sin θ) dθ/sin θ = 2π e(μ/4) Γ(2s) Σ_{ℓ≥0} Σ_{m+n=ℓ} (−1)^m (s−μ)_n Γ(s+n) / ( m! n! Γ(2s+n) Γ((n+s+m+μ+1)/2) Γ((n+s−m−μ+1)/2) ) · t^{s+ℓ}. The double series converges absolutely for every t, and the reciprocal gammas are entire. The paper writes (s−μ)_n as Γ(s−μ+n)/Γ(s−μ), so the printed prefactor is 2π e(μ/4)Γ(2s)/Γ(s−μ).

([DIT16], Appendix A, (A.2), p. 985 (derivation p. 984).)

*Needs:* §0.26; `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; `Complex.Gamma_mul_Gamma_add_half`.


### 0.33 Series expansion (A.3) of G(s,μ) t^{1/2} J_{s−1/2}(t)

Prove `bessel_cycle_series`. For μ ∈ ℂ, Re(s) > 0, t > 0: G(s,μ) t^{1/2} J_{s−1/2}(t) = π^{3/2} e(μ/4) 2^{2−2s} Γ(2s) / (Γ((s+1+μ)/2) Γ((s+1−μ)/2)) · Σ_{r≥0} (−1)^r 2^{−2r} / (r! Γ(s+1/2+r)) · t^{s+2r}, where G(s,μ) = e(μ/4)(2π)^{3/2}2^{−s}Γ(2s)/(Γ((s+1+μ)/2)Γ((s+1−μ)/2)).

([DIT16], Appendix A, (A.3), p. 985.)

*Needs:* §0.26; `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; `Complex.Gamma_mul_Gamma_add_half`; §0.25.


### 0.34 Agreement of the first coefficients of (A.2) and (A.3)

Prove `cycle_series_leading_coefficients`. The t^s coefficients in (A.2) and (A.3) both equal 2π e(μ/4)Γ(s)/(Γ((s+1+μ)/2)Γ((s+1−μ)/2)). In (A.2) the t^(s+1) coefficient vanishes by cancellation of (m,n)=(1,0),(0,1), using ((s−μ)/2)/Γ((s−μ)/2+1)=1/Γ((s−μ)/2). The t^(s+2) coefficients also agree. The shared ODE and Frobenius uniqueness from c₀ imply (A.1).

([DIT16], Appendix A, p. 985 (last paragraph of the proof).)

*Needs:* §0.26; `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; `Complex.Gamma_mul_Gamma_add_half`.


### 0.35 Legendre function of the second kind Q_{s−1} (2.5), (2.6)

Define `legendre_q` as follows. For t>1 and complex s with Re(s)>0, define Q_{s−1}(t)=∫₀∞(t+√(t²−1)cosh u)^(−s)du with the positive real base. It equals Γ(s)²/[2Γ(2s)](2/(1+t))^s ₂F₁(s,s;2s;2/(1+t)), satisfies ((1−t²)Q′)′+s(s−1)Q=0, and for integer s=k≥1 equals the Q_{k−1} of GZ IV(5.7). In particular Q₀(t)=½log((t+1)/(t−1)) and Q₁(t)=tQ₀(t)−1.

Prove the following API statements.
- `integral`: Use the positive-base convergent integral for Re(s)>0.
- `hypergeometric`: Compare with the displayed ₂F₁ formula on its open-disc argument (`legendre_q_hypergeometric`).
- `integer_specialization`: The integer k case is the same Q_{k−1}, with Q₀,Q₁ as stated.

**Checks.**
- At s=1, Q₀(3)=½log2.
- At s=2, Q₁(3)=3/2 log2−1.
- t=1 has a logarithmic singularity and is excluded from the ordinary pointwise definition.

([GZ86], Chapter II, §2, (2.5), (2.6), p. 238.)

*Needs:* `Complex.regularizedHGFun`; `Complex.betaIntegral_eq_Gamma_mul_div`; `hasDerivAt_integral_of_dominated_loc_of_deriv_le`.


### 0.36 Asymptotics of Q_{s−1} (2.7), (2.8)

Prove `legendre_q_asymptotics`. Q_{s−1}(t) = −½ log(t − 1) + O(1) as t ↘ 1 (2.7), and Q_{s−1}(t) = O(t^{−s}) as t → ∞ (2.8) (s > 1 fixed).

([GZ86], Chapter II, §2, (2.7), (2.8), p. 238.)

*Needs:* `Complex.regularizedHGFun`; `Complex.betaIntegral_eq_Gamma_mul_div`; `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; §0.35.


### 0.37 Point-pair invariants g and g_s (2.4), (2.9)

Define `point_pair_invariant` as follows. g(z, z′) = log(|z − z′|²/|z̄ − z′|²) satisfies a′) g(γz, γz′) = g(z, z′) for γ ∈ PSL₂(ℝ); b′) continuous and harmonic in each variable on 𝔥 × 𝔥 ∖ diagonal; c′) g = log|z − z′|² + O(1) as z′ → z; but Σ_{γ ∈ Γ₀(N)} g(z, γz′) diverges (barely). For s > 1, g_s(z, z′) = −2Q_{s−1}(1 + |z − z′|²/(2yy′)) (z ≠ z′) (2.9) satisfies a′), c′) (by (2.7)) and Δg_s = s(s−1)g_s in each variable; g₁ = g. The positive spectral Laplacian convention of DIT is −Δ_GZ, so its eigenvalue here is s(1−s).

Prove the following API statements.
- `invariant`: Simultaneous PSL₂(ℝ) action preserves g_s (`point_pair_invariant_invariant` on the SL₂(ℝ) cover).
- `s_one`: At s=1, −2Q₀(cosh dist)=log(|z−z′|²/|z−bar z′|²).
- `laplace`: Off the diagonal, Δ_GZ g_s=s(s−1)g_s in either variable.

**Checks.**
- g_s(z,z′)=g_s(z′,z).
- The diagonal value is not a finite smooth kernel.
- The Γ₀(N) sum at s=1 diverges; subtract the pole before taking the finite part.

([GZ86], Chapter II, §2, (2.4), (2.9), pp. 238–239.)

*Needs:* §0.35; `UpperHalfPlane.cosh_dist`; `UpperHalfPlane.tanh_half_dist`.


### 0.38 Asymptotics of the Legendre function Q_{s−1}(t) as t ↘ 1

Prove `legendre_q_near_one`. For the Legendre function of the second kind Q_{s−1} (s > 1, s near 1) as t ↘ 1: Q_{s−1}(t) = ½ log((t + 1)/(t − 1)) − (Γ′/Γ(s) − Γ′/Γ(1)) + o(1).

([GZ86], Chapter II, §5, display after (5.7), p. 251.)

*Needs:* `Complex.regularizedHGFun`; `Complex.betaIntegral_eq_Gamma_mul_div`; `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; §0.35.


### 0.39 The archimedean integral V_s(t)

Define `archimedean_v_integral` as follows. Fix k ≥ 1. For s ∈ ℂ with Re(s) > 1−k and t ∈ ℝ: V_s(t) = ∫_{−∞}^{∞} e^{−2πixt} dx / ((x+i)^{2k−1}(x²+1)^s). This is the Fourier transform of x ↦ (x+i)^{−(2k−1)}(x²+1)^{−s}, which is absolutely integrable exactly when Re(s) > 1−k.

Prove the following API statements.
- `fourier_integral`: V_s is the explicit Lebesgue Fourier integral in Re(s)>1−k.
- `integrable_iff`: The seed norm is integrable exactly for Re(s)>1−k (`archimedean_v_integrable_iff`).
- `parameter_derivative`: Differentiate in a compact sub-half-plane using the logarithmic majorant.

**Checks.**
- At k=1, the initial absolutely integrable domain is Re(s)>0.
- At Re(s)=1−k the seed norm decays like |x|⁻¹ and is not integrable.
- t=0 equals the gamma formula in §0.40.

([GZ86], Chapter IV, (3.2) Proposition, p. 277.)

*Needs:* `Complex.betaIntegral_eq_Gamma_mul_div`; `hasDerivAt_integral_of_dominated_loc_of_deriv_le`.


### 0.40 Proposition (3.3a): the value V_s(0)

Prove `archimedean_v_at_zero`. For k ≥ 1: V_s(0) = (−1)^k π i 2^{−2s−2k+3} Γ(2s+2k−2)/(Γ(s)Γ(s+2k−1)). This holds for Re(s) > 1−k and gives the meromorphic continuation of V_s(0) in s.

([GZ86], Chapter IV, §3, (3.3) Proposition a), p. 277; proofs pp. 279–280.)

*Needs:* `Complex.betaIntegral_eq_Gamma_mul_div`; `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; §0.39.


### 0.41 Proposition (3.3b): holomorphy of V_s(t) in s and exponential decay in t

Prove `archimedean_v_holomorphic`. For t ≠ 0 the function s ↦ V_s(t) continues holomorphically to all s ∈ ℂ and satisfies, locally uniformly in s, V_s(t) = |t|^{O(1)} e^{−2π|t|} as |t| → ∞.

([GZ86], Chapter IV, §3, (3.3) Proposition b), p. 277; proof pp. 280–281.)

*Needs:* `Complex.betaIntegral_eq_Gamma_mul_div`; `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; §0.39; §0.26.


### 0.42 Proposition (3.3c): V*_s(t) is entire and satisfies V*_s(t) = sign(t) V*_{2−2k−s}(t)

Prove `archimedean_v_functional_equation`. For t ≠ 0 set V*_s(t) = (π|t|)^{−s−2k+1} Γ(s+2k−1) V_s(t). At Gamma poles the product means its removable holomorphic extension, rather than multiplication of totalized pointwise Gamma values. Then V*_s(t) is entire in s and V*_s(t) = sign(t) V*_{2−2k−s}(t). For t > 0 this comes from V*_s(t) = ∫_0^∞ u^{s+k−1} e^{−πt(u+1/u)} ∫_{−∞}^{∞} e^{−πtv²} (v + (u^{1/2}+u^{−1/2})/i)^{2k−1} dv du/u.

([GZ86], Chapter IV, §3, (3.3) Proposition c), p. 278; proof p. 280.)

The continuation API is `archimedean_v_normalized_entire` (existence and agreement with the initial gamma product), `archimedean_v_reflection` (the sign(t) functional equation), and `archimedean_v_removable` (the extension at gamma poles).

**Checks.**

- For k=1 and t>0, the K-Bessel expression is invariant under s↦−s, agreeing with reflection around 1−k=0.
- For t<0 and s=1−k the reflected value is its own negative, so V*_s(t)=0.
- At t=0 the factor (π|t|)^(−s−2k+1) is outside the interface; an arbitrary totalized product at a gamma pole need not be the removable extension.

*Needs:* `Complex.betaIntegral_eq_Gamma_mul_div`; `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; §0.39; §0.26.


### 0.43 Proposition (3.3d): V_{−r}(t) for integers 0 ≤ r ≤ k−1

Prove `archimedean_v_integer_points`. Let r ∈ ℤ with 0 ≤ r ≤ k−1. Then V_{−r}(t) = 0 for t < 0 and V_{−r}(t) = 2πi(−1)^{k−r} p_{k,r}(4πt) e^{−2πt} for t > 0, where p_{k,r}(t) = (t/2)^{2k−2−2r} Σ_{j=0}^{r} C(r, j) (−t)^j/(2k−2r−2+j)! (a polynomial). Here V_{−r}(t) = ∫ (x−i)^r (x+i)^{−(2k−1−r)} e^{−2πixt} dx, conditionally convergent for r = k−1.

([GZ86], Chapter IV, §3, (3.3) Proposition d), p. 278; proof p. 281.)

*Needs:* `Complex.betaIntegral_eq_Gamma_mul_div`; `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; §0.39.


### 0.44 Proposition (3.3e): ∂_s V_s(t) at the centre s = 1−k for t < 0

Prove `archimedean_v_central_derivative`. For t < 0: ∂/∂s V_s(t)|_{s=1−k} = −2πi q_{k−1}(4π|t|) e^{−2πt}, where q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1} x^{−k} e^{−xt} dx (t > 0).

([GZ86], Chapter IV, §3, (3.3) Proposition e), p. 278; proof p. 281.)

*Needs:* `Complex.betaIntegral_eq_Gamma_mul_div`; `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; §0.39.


### 0.45 K-Bessel expression for V*_s(t), t > 0

Prove `archimedean_v_bessel_k`. For t > 0: V*_s(t) = i Σ_{a,b,c≥0, 2a+b+c=2k−1} (−1)^{k−a}(2k−1)!/((2a)! b! c!) · Γ(a+½)/(πt)^{a+½} · ∫_0^∞ u^{s+k+(b−c)/2−2} e^{−πt(u+1/u)} du = (2(−1)^k i/t^{1/2}) Σ_{a,b,c≥0, 2a+b+c=2k−1} (2k−1)!/(a! b! c!) · (−1/(4πt))^a · K_{s+k−1+(b−c)/2}(2πt). For k = 1: V*_s(t) = (−2i/√t)(K_{1/2+s}(2πt) + K_{1/2−s}(2πt)). The functional equation (3.3c) for t > 0 follows from K_ν = K_{−ν} by interchanging b and c.

([GZ86], Chapter IV, §3, proof of (3.3), p. 280.)

*Needs:* `Complex.betaIntegral_eq_Gamma_mul_div`; `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; §0.39; §0.26; §0.25; AutomorphicLFunctionsAndLocalFactors AL.0, Bessel transforms.


### 0.46 Entire continuation of Schwartz families

Prove `schwartz_family_continuation`. Let A be finite-dimensional real and C>0. Two scalar families Z₊(a,s), Z₋(a,s) are entire of finite order in vertical strips at each a, satisfy Z₊(a,s)=Z₋(a,−s), and, on Re(s)>C, take values holomorphically in the usual Fréchet Schwartz space. On this initial half-plane each family has one common finite strip-order exponent for all weighted derivative seminorms; constants may depend on the seminorm and the strip. There are unique entire Schwartz-valued continuations agreeing with those scalar values. They agree with the initial families, satisfy the reflected functional equation and have finite order in the full Schwartz topology on every vertical strip.

*Standing hypotheses:* finite-dimensional A with its usual Schwartz seminorm topology; both scalar and vector hypotheses of BPCZ Corollary A.0.11.1. A common initial order exponent controls all Schwartz seminorms; the bounding constants may depend on the seminorm and strip.

([BPCZ22], Corollary A.0.11.1, pp.332–333.)

*Needs:* §0.18; §0.14.


### 0.47 Entire continuation of LF dual families

Prove `lf_dual_continuation`. Let W be an LF space, H⊂W a dense linear subspace, and C>0. Suppose Z_±(s,·) are continuous functionals for Re(s)>C, with each scalar Z_±(s,w) holomorphic of one common order≤d in vertical strips. On H they have entire scalar finite-order continuation with Z_+(s,h)=Z_−(−s,h). Then Z_± extend as entire W′-valued finite-order functions and their functional equation holds on every w∈W. Here W′ carries the weak topology of pointwise convergence, as fixed in BPCZ A.0.1; no strong-dual holomorphy is inferred from this citation.

*Standing hypotheses:* W is LF; H is dense; d is common to all initial scalar evaluations.

([BPCZ22], Corollary A.0.11.2, p.333.)

*Needs:* §0.18; §0.11; `WithSeminorms.banach_steinhaus`.


### 0.48 Real reductive representation foundations

Construct `real_representation_foundations` for a linear real reductive group G, full maximal compact K and compatible (𝔤_ℂ,K)-actions. Harish-Chandra modules are finitely generated with finite K-multiplicities. Construct normalized smooth parabolic induction with covariance a^(ν+ρ_P)σ(m), right translation and the K∩M compact picture; prove induction in stages and compatibility with the K-finite module. Develop tempered and square-integrable-mod-centre representations with unitary central character, discrete series and their Harish-Chandra parameters, and the real Langlands classification: positive standard modules have a unique irreducible quotient, and every irreducible admissible module has unique standard data up to the prescribed Weyl equivalence. For split centre, fix its character and apply square integrability on the central quotient.

The API includes central twisting, compact-picture evaluation, contragredients and the transport between submodule and quotient conventions in the classification.

**Checks.**

- For compact G every irreducible unitary representation is discrete series, with Schur orthogonality normalized by probability Haar.
- SL₂(ℝ) has holomorphic and antiholomorphic discrete series of integral lowest/highest weights k≥2; the trivial module is not discrete series.
- In the spherical SL₂ standard module with positive exponent giving infinitesimal character of the trivial module, the Langlands quotient is trivial; reducibility does not identify the quotient with the whole induced module.

([Wal79], §§1–2 and 6, Theorems 6.3 and 6.7, pp.71–74, 79–80; use contragredients to pass from its submodule convention to positive standard quotients; discrete-series parameter theory cited there. [CD90], §§1–2, pp.196–205.)

*Needs:* ArithmeticLocallySymmetricSpaces ALS.F.1 (real points and maximal compact) and ALS.0.2 (real reductive Lie adapter); RepresentationTheory/LieGroups Layer 9 (Iwasawa, Cartan and KAK); ReductiveGroupsPartII RG2.0 (shared point topology); RepresentationTheory/LieHighestWeight Layer 7 (central algebra); RepresentationTheory/CompactGroups (K-types).


### 0.49 Smooth Fréchet globalizations

Construct `smooth_frechet_globalization` for the linear real reductive groups of §0.48, consuming the GLₙ(ℝ) and GLₙ(ℂ) case from AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, `archimedean-smooth-representations`. Taking K-finite vectors is an equivalence between smooth admissible Fréchet representations of moderate growth and Harish-Chandra modules. Construct its inverse, the unique smooth moderate-growth globalization, and extend every module morphism uniquely and continuously. Prove exactness and compatibility with normalized parabolic induction, finite-dimensional tensor products and the smooth vectors of a specified unitary Hilbert realization, agreeing with the supplied GLₙ constructions. Moderate growth is a seminorm estimate p(π(g)v)≤C‖g‖^N q(v), with the source seminorm q and exponent depending on p; admissibility and finite generation are required for this equivalence.

**Checks.**

- For compact G a finite-dimensional module globalizes to the same representation and topology.
- A unitary discrete-series Hilbert space and its dense smooth globalization have the same K-finite module, but different topologies.
- The countable direct sum of trivial modules is locally K-finite and has infinite trivial K-multiplicity; it lies outside the globalization equivalence's admissible category.

([BK14], §§1–2, Theorem 1.1, and §§9–11, especially Theorem 11.6 for parameter families.)

*Needs:* §0.48; the locally convex topology and integration of §§0.11–0.12; AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, `archimedean-smooth-representations` (GLₙ specialization).


### 0.50 Restricted tensor factorization

Construct `restricted_tensor_factorization` for irreducible admissible adelic representations over a global field, with (𝔤_∞,K_∞)-modules at infinite places and smooth representations at finite places. Consume the GLₙ realization from AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, `restricted-tensor-realizations`, and construct the extension to general reductive groups with agreement on that specialization. Choose spherical vectors at almost all finite places and form the algebraic restricted tensor product; prove irreducibility, factorization and uniqueness of the local factors. For an irreducible unitary Hilbert realization, normalize the distinguished vectors to norm one and identify the algebraic K-finite tensor product with the finite-place smooth, archimedean K-finite vectors of the restricted Hilbert tensor completion. Continuous smooth archimedean factors use §0.49.

**Checks.**

- For GL₁ an adelic character factors into its local characters, trivial on the integral units at almost every place.
- Changing finitely many nonzero distinguished spherical vectors gives an isomorphic algebraic restricted tensor product; zero distinguished vectors do not define this construction.
- Two admissible irreducible factors on a product of two finite-place groups give an irreducible tensor product; a direct sum of two distinct global constituents is outside the irreducibility hypothesis.

([Fla79], Theorems 1–4, pp.179–182.)

*Needs:* §0.48; §0.49 for number fields; SmoothRepresentationsOfLocalGroups SR.1–SR.3; AdelicAlgebraicGroups Layer 0 (generic restricted products), and §1.10a for function-field specialization; AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, `restricted-tensor-realizations` (GLₙ realization).


### 0.51 Constant terms in stages

Prove `constant_term_transitivity`. For nested rational parabolics P⊆Q in a number-field reductive G, let P∩M_Q be the induced parabolic of M_Q. Normalize the rational unipotent quotients compatibly and prove f_P=(f_Q)_{P∩M_Q}. Construct the exact sequence N_Q→N_P→N_{P∩M_Q}, its rational/adelic quotient integration in stages, and invariance under Levi representatives. Smooth finite-level forms are integrable on these compact unipotent quotients; for other input functions carry the absolute-integrability hypothesis. The function-field version is part of §1.10b.

**Checks.**

- Q=G gives f_P=(f_G)_P with f_G=f.
- For the upper Borel inside the (2,1) parabolic of GL₃, integration over its three unipotent coordinates equals integration first over the two-dimensional radical of Q, then over the remaining Levi coordinate.
- With probability unipotent quotients the constant function has every constant term equal to one; changing one stage's measure by two changes the iterated integral by two.

([Art05], §8 (8.1), pp.41–42; the nested-parabolic identity follows from the unipotent decomposition and Fubini.)

*Needs:* ArithmeticLocallySymmetricSpaces ALS.F.6 (constant terms); AdelicAlgebraicGroups §2.2 (integration in stages); ReductiveGroups Layer 7 (parabolics).


### Examples

For μ=aδ₀+bδ₁ the direct-integral norm is a‖v₀‖²+b‖v₁‖², while altering values on a null singleton changes no class. In the Herglotz conversion δ₂ becomes 5δ₂ and still has weighted mass one. The Legendre identity gives Q₀(3)=½log2 and Q₁(3)=3/2 log2−1. The Whittaker cycle's leading coefficient is 2πe(μ/4)Γ(s)/(Γ((s+1+μ)/2)Γ((s+1−μ)/2)); the next coefficient cancels, fixing both the angular phase and the factor 2 in its argument.

### Dependencies

The Hilbert branch uses the measure, operator and compact-group supplier contracts. The vector branch uses TestFunction, SchwartzMap, barrelled-space Banach–Steinhaus and the nuclear LF construction before projective tensors or continuation. The rank-one branch uses regularized hypergeometric functions, gamma identities, the supplied positive-argument K-Bessel kernel and the hyperbolic metric. The cycle-cover branch uses the independent function-field root and torus prefix described in How to read the build.

## Layer 1: Normalized induction and convergent Eisenstein families

### 1.1 Normalized induced Hilbert families

Define `induced_family` as follows. Fix P=MN and a discrete unitary representation σ of M(𝔸)¹, with its automorphic multiplicity space. H_P is the space of measurable functions on N(𝔸)M(F)A_M(ℝ)⁰\G(𝔸) whose m-slices lie in the σ-isotypic discrete space and with ∫_K∫_[M]¹|φ(mk)|²dm dk finite. I_P(λ,g)φ(x)=φ(xg)exp((λ+ρ_P)(H_P(xg)−H_P(x))). The carrier is independent of λ. H_P⁰ consists of smooth, finite-level, K-finite vectors lying in a finite sum of inducing irreducible spaces. A holomorphic section is a holomorphic map to a fixed finite-dimensional subspace of H_P⁰; its flat sections are constant in this compact picture.

*Standing hypotheses:* F is a number field; G is connected reductive; compatible Iwasawa measures have vol K=vol(N(F)\N(𝔸))=1; work on G(𝔸)¹ or quotient A_G(ℝ)⁰ throughout.

Prove the following API statements.
- `action_comp`: I_P(λ,gh)=I_P(λ,g)I_P(λ,h).
- `unitary_axis`: For λ imaginary, I_P(λ,g) is unitary.
- `flat_section`: A fixed φ∈H_P⁰ gives an entire flat section λ↦φ; evaluation and right translation are holomorphic.
- `local_tensor`: For factorizable σ and section, I_P(σ,λ) is the restricted tensor product of the local normalized inductions.

**Checks.**
- For P=G on G(𝔸)¹, ρ_P=H_P=0 and I_P is right translation on the discrete inducing space.
- The GL₂ open-cell torus model acts by r^(s+1/2)f(rx), and preserves the L² norm for purely imaginary s.
- Dropping the half-modulus in the same dilation model, at r=4 a nonzero vector has half its original norm.

([Art05], §7 pp.32–34.)

*Needs:* §0.48; §0.49; §0.50; AdelicAlgebraicGroups §2.1 (logarithmic height); AdelicAlgebraicGroups §2.2 (parabolic modulus); AdelicAlgebraicGroups §2.3 (automorphic quotient measure); ArithmeticLocallySymmetricSpaces ALS.F.6 (cuspidal representations); §0.2.


### 1.2 Eisenstein series in the convergence chamber

Define `eisenstein_series` as follows. For φ∈H_P⁰, define E_P(g,φ,λ)=Σ_{δ∈P(F)\G(F)}φ(δg)exp((λ+ρ_P)H_P(δg)). It is smooth and automorphic in the positive chamber, independent of representatives; Layer 2 gives continuation.

*Standing hypotheses:* Re(λ−ρ_P)(α∨)>0 for every simple root; φ is smooth K-finite finite-level discrete inducing data; the sum ranges over all rational cosets.

Prove the following API statements.
- `linear`: E_P(aφ+bψ)=aE_P(φ)+bE_P(ψ). Require summable φ and ψ summands, supplied by chamber convergence.
- `automorphic`: E_P(γg,φ,λ)=E_P(g,φ,λ), γ∈G(F). The proof uses the permutation of P(F)\G(F) by γ, which preserves the translated height and the inducing value.
- `right_equivariant`: E(g,I_P(λ,h)φ,λ)=E(gh,φ,λ), using normalized induction’s pointwise weighted-translation identity.

**Checks.**
- For P=G, E_G(g,φ,0)=φ(g).
- E(g,0,λ)=0.
- For Γ=SL₂(ℤ), the spherical section gives Σ_{Γ∞\Γ}Im(γz)^s for Re s>1, with λ=s−1/2.

([Art05], §7 (7.1), p.33; Lemma 7.1, p.34.)

*Needs:* §1.1; AdelicAlgebraicGroups §§3.4, 3.6 (Siegel covering).


### 1.3 Absolute and differentiated chamber convergence

Prove `eisenstein_convergence`. On Re λ∈ρ_P+(𝔞_P*)⁺ the series defining E_P and the unipotent integrals defining M(w,λ) converge absolutely, locally uniformly for g in compact sets and λ in compact subsets of that chamber. They are holomorphic in λ. Every fixed right archimedean differential operator and finite-level translation can be applied termwise; resulting functions have moderate growth on Siegel sets uniformly on compact parameter subsets. For a finite-dimensional inducing space and fixed derivative, a finite power of the adelic height bounds the absolute majorant.

*Standing hypotheses:* the inducing vectors are H_P⁰; local uniformity stays strictly inside the chamber; differentiated bounds are for a fixed finite family of derivatives.

([Art05], §7 Lemma 7.1, p.34; §13 paragraph after Proposition 13.2 and (13.9), p.73.)

*Needs:* §1.1; AdelicAlgebraicGroups §§3.5–3.6 (height estimates on Siegel sets); ArithmeticLocallySymmetricSpaces ALS.F.6 (cuspidal discreteness and finite multiplicity); `hasFDerivAt_integral_of_dominated_of_fderiv_le`.


### 1.4 Convergent Weyl intertwining integrals

Define `convergent_intertwiner` as follows. For w∈W(𝔞_P,𝔞_Q), choose a rational representative ŵ. In the common compact picture M(w,λ)φ(x)=exp(−(wλ+ρ_Q)H_Q(x))∫_{(N_Q∩ŵN_Pŵ⁻¹)(𝔸)\N_Q(𝔸)}φ(ŵ⁻¹nx)exp((λ+ρ_P)H_P(ŵ⁻¹nx))dn. The chamber convergence theorem defines this on H_P⁰. Rational representatives and compatible quotient measures give the same map to H_Q; it intertwines I_P(λ) with I_Q(wλ). This object precedes both the constant-term and pseudo-Eisenstein inner-product formulas.

*Standing hypotheses:* Re λ−ρ_P is positive; Haar measures and rational Weyl representatives are fixed compatibly.

Prove the following API statements.
- `intertwines`: M(w,λ)I_P(λ,g)=I_Q(wλ,g)M(w,λ).
- `identity`: M(1,λ)=id for P=Q.
- `holomorphic_chamber`: Every compact-picture matrix coefficient is holomorphic in the chamber.

**Checks.**
- For P=Q and w=1 the unipotent quotient is a point, so M(1,λ)φ=φ; a definition carrying a nontrivial measure or normalizing constant at w=1 fails this.
- For GL₂ over ℚ, the convergent real spherical integral times its finite-prime Euler product gives ξ(2s−1)/ξ(2s) on the spherical eigenline, with λ=s−1/2 and ξ the completed Riemann zeta function.
- For GL₂, the Borel B and the nontrivial Weyl element w, M(w,λ) maps the space induced from χ₁⊗χ₂ to the space induced from χ₂⊗χ₁, with parameter wλ=−λ. A definition that leaves the inducing character untransported fails the intertwining identity.

([Art05], §7 equation (7.2) and Lemma 7.1, p.34.)

*Needs:* §1.1; §1.3; AdelicAlgebraicGroups §2.2 (integration in stages); `zeta_eq_tsum_one_div_nat_add_one_cpow`.


### 1.5 Finite Weyl constant-term formula

Prove `cuspidal_constant_term`. For cuspidal inducing φ∈H_P,cusp⁰, the N_Q constant term of E_P equals the sum over W(𝔞_P,𝔞_Q) of exp((wλ+ρ_Q)H_Q(g))(M(w,λ)φ)(g). When the Weyl set is empty the term is zero. For an arbitrary parabolic constant term, the general formula groups rational Bruhat cells by double cosets: each surviving summand is an Eisenstein series on M_Q induced from the appropriate constant term of φ, with its own Levi intertwiner. The displayed finite exponential formula is asserted only for associate Q and cuspidal data.

*Standing hypotheses:* initial equality is in absolute convergence; N_Q(F)\N_Q(𝔸) has volume one; the simple associate formula uses cuspidal data.

([Lan66], §3, Lemma 3 and the following Bruhat computation, transcription pp.3–4.)

*Needs:* §1.2; §1.4; ArithmeticLocallySymmetricSpaces ALS.F.6 (constant terms); SmoothRepresentationsOfLocalGroups Layer 2.


### 1.6 Paley–Wiener pseudo-Eisenstein series

Define `pseudo_eisenstein` as follows. Fix cuspidal data (P,σ). Let Ψ:(𝔞_P^G)_ℂ*→H_P,cusp,σ⁰ be entire, valued in one finite-dimensional subspace, and the Fourier–Laplace transform of a smooth compactly supported function on 𝔞_P^G. Set ψ(g)=∫_{Λ+i(𝔞_P^G)*}exp((λ+ρ_P)H_P(g))Ψ(λ,g)dλ and Eψ(g)=Σ_{P(F)\G(F)}ψ(δg). Fourier inversion makes ψ compactly supported in the projected height H_P^G, so the result is independent of Λ. The dual measure satisfies ∫_{i(𝔞_P^G)*}∫_{𝔞_P^G} h(H)e^(−λ(H))dH dλ=h(0); no extra (2π)^rank factor is inserted. This is the fixed trivial A_G(ℝ)⁰-character version on G(F)\G(𝔸)¹ (equivalently the quotient by A_G(ℝ)⁰): λ vanishes on 𝔞_G and the inducing central action is compatible. Arthur Lemmas 12.2–12.4 first use all of 𝔞_P and L²(G(F)\G(𝔸)); that full-height version is a separate construction and does not automatically descend to the central quotient.

*Standing hypotheses:* Ψ is Paley–Wiener, valued in a fixed finite-dimensional compact-picture space; trivial split-central character, parameters in (𝔞_P^G)_ℂ* and the matching central restriction of the inducing datum (𝔞_P and the full quotient in the full-height variant).

Prove the following API statements.
- `contour_independent`: The inverse-transform ψ is independent of the real shift Λ.
- `linear`: Ψ↦Eψ is complex linear.
- `eisenstein_integral`: For Λ with Λ−ρ_P in the open positive chamber (the absolute-convergence region of §1.3), Eψ(g)=∫_{Λ+i(𝔞_P^G)*} E_P(g,Ψ(λ),λ)dλ.

**Checks.**
- The zero Paley–Wiener section gives zero.
- For a split torus, P=G: the full-height construction is inverse Fourier–Laplace transformation on 𝔞_G, whereas the fixed-central-character construction has 𝔞_P^G=0.
- For V=ℂ, Ψ(z)=exp(z⁴) is entire but not Paley–Wiener and does not qualify for this construction. More generally exp(z⁴)v is excluded only when v≠0.

The construction rests on the Euclidean Paley–Wiener theorem, recorded here as the target `euclidean_paley_wiener`. For a finite-dimensional real vector space 𝔞, a chosen Euclidean norm and its dual norm, and R≥0, with Lebesgue measure and dual measure on i𝔞*, the Fourier–Laplace transform ĥ(λ)=∫_𝔞 h(H)e^(−λ(H))dH maps the smooth functions supported in the closed radius-R ball onto the entire functions on 𝔞_ℂ* with sup_λ e^(−R‖Re λ‖)(1+‖λ‖)^N|ĥ(λ)|<∞ for every N, and h(H)=∫_{Λ+i𝔞*}ĥ(λ)e^(λ(H))dλ for every real Λ. Vector-valued versions with values in a fixed finite-dimensional space follow coordinatewise. The support characterization and contour-shift inversion are proved in [RM19], §1.8.2, Theorem 1.70 and its proof, printed pp.30–33. Substitute ζ=−iλ in its Fourier convention and absorb (2π)^(-dim 𝔞) in the dual measure; Cauchy estimates recover its derivative bounds from the displayed entire-function bounds. [Art05], §12, p.65 uses this theorem for pseudo-Eisenstein series.

**Checks of the Euclidean transform.**
- On 𝔞=ℝ the indicator of [−1,1], which is not smooth, has transform 2 sinh(λ)/λ: entire of type 1, but only O(1/|λ|) on the imaginary axis, so the rapid-decay clause fails without smoothness.
- The zero function has the zero transform at every radius.
- Translating h by H₀ multiplies ĥ(λ) by e^(−λ(H₀)) and gives the exponential-type upper bound R+‖H₀‖. The minimal centered type can decrease: a smooth bump with support closure [−1,0] has type 1, while translation by 1/2 gives type 1/2.

([Art05], §12 preceding Lemma 12.2, pp.64–66.)

*Needs:* §1.1; §1.2; §1.4; AutomorphicLFunctionsAndLocalFactors Layer 0 (Fourier inversion and self-dual measures); `euclidean_paley_wiener` above.


### 1.7 Square-integrability of pseudo-Eisenstein series

Prove `pseudo_eisenstein_l2`. For the fixed-central-character pseudo-Eisenstein series just defined, Eψ belongs to L²(G(F)\G(𝔸)¹), equivalently L²(G(F)\G(𝔸)/A_G(ℝ)⁰), using parameters and compact height support in 𝔞_P^G. If one instead uses the full 𝔞_P transform of Arthur Lemma 12.2, the target is L²(G(F)\G(𝔸)); no descent through the split centre is asserted for an arbitrary full-height section. Both assertions concern finite-dimensional cuspidal Paley–Wiener sections, not an individual unitary-axis Eisenstein series.

*Standing hypotheses:* cuspidal inducing vectors; compact height support before summation; quotient measures, height space and central variant as in §1.6.

([Art05], §12 Lemma 12.2, pp.64–66.)

*Needs:* §1.6; §1.4; `MeasureTheory.integral_prod`.


### 1.8 Langlands pseudo-Eisenstein inner product

Prove `pseudo_eisenstein_inner_product`. With Mathlib’s conjugate-first inner product, ⟪Eψ′,Eψ⟫=∫_{Λ+i(𝔞_P^G)*}Σ_{w∈W(𝔞_P,𝔞_Q)}⟪Ψ′(−overline(wλ)),M(w,λ)Ψ(λ)⟫dλ, where Ψ is attached to (P,σ), Ψ′ to (Q,σ′), and Λ−ρ_P is positive. Only compatible inducing cuspidal isotypic spaces contribute. The conjugation in −overline(wλ) is essential: the second section is evaluated on the reflected real contour. On an imaginary contour after justified continuation this becomes wλ. Use the same fixed-central datum and quotient as pseudo-eisenstein. For the full-height version replace 𝔞_P^G by 𝔞_P and use the full arithmetic quotient on both sides.

*Standing hypotheses:* Paley–Wiener sections of §1.6, with one central variant and its measures throughout; the identity is first proved in the absolute-convergence chamber, with conjugation in the reflected contour.

([Lan66], §4, Corollary (2), transcription p.4.)

*Needs:* §1.7; §1.5; `MeasureTheory.integral_prod`.


### 1.9 Cuspidal-data generated subspaces

Define `cuspidal_datum_space` as follows. A cuspidal datum χ is a Weyl-associate class of (P,σ), with σ occurring in L²_cusp([M_P]¹), from ArithmeticLocallySymmetricSpaces ALS.F.6. Let L²_χ be the closed G(𝔸)¹-invariant span of its pseudo-Eisenstein series. Association transports both σ and P; identifying parabolics alone loses spectral information.

*Standing hypotheses:* the central quotient/G(𝔸)¹ convention is fixed; equivalence includes the representation.

Prove the following API statements.
- `generator_mem`: Each Eψ attached to χ lies in L²_χ.
- `right_invariant`: Right translation preserves L²_χ.
- `associate_eq`: Weyl-associate pairs define the same subspace, with the representation transported by that Weyl element.

**Checks.**
- For χ represented by (G,σ), L²_χ is the σ-isotypic cuspidal summand.
- Two non-Weyl-associate data (P,σ) and (P,σ′) with nonzero inducing spaces generate orthogonal distinct nonzero blocks. For GL₂/ℚ at the Borel, distinct unitary Hecke characters χ₁,χ₂ give inequivalent χ₁⊗χ₂ and χ₂⊗χ₁ but the same block by Weyl association.
- The closed span of the zero generator set is the zero subspace.

([Art05], §12 Lemma 12.4 and its definition, pp.64–66.)

*Needs:* §1.7; ArithmeticLocallySymmetricSpaces ALS.F.6 (cuspidal representations).


### 1.10 Elementary orthogonal cuspidal-data decomposition

Prove `cuspidal_data_orthosum`. The L²_χ form an orthogonal Hilbert sum equal to L²([G]¹), with dense finite sums. Orthogonality uses the convergent pseudo-Eisenstein inner-product formula; density uses parabolic-rank induction and constant-term Fourier inversion. This precedes continuation and Plancherel parametrization.

For generators Sχ, require `OrthogonalFamily` of closed spans and dense span of ⋃χ Sχ. `IsHilbertSum.mkInternal` gives H ≃ₗᵢ `lp (fun χ => cuspidal_datum_space (Sχ)) 2`; inverse single coordinates are inclusions; coordinate sums converge to their inverse image. The automorphic content is the proof of these two inputs.

**Checks.**
- A family that lists the same nonzero block twice is not orthogonal, so the Hilbert-sum identification fails for it.
- On H=ℂ, the family whose only generator set is {0} has zero closed span and fails density.
- A family with a single block whose generators span a dense subspace gives the whole of H.

*Standing hypotheses:* all cuspidal associate classes χ occur; reductive Levis use the same quotient measures.

([Art05], §12 Lemma 12.4, equation (12.4), pp.64–66.)

*Needs:* §1.9; §1.8; ArithmeticLocallySymmetricSpaces ALS.F.6 (constant terms); §0.51 (constant-term transitivity); Mathlib `IsHilbertSum.mkInternal` (`l2Space`).


### 1.10a Function-field adelic topology, degree and integration

Construct `function_field_adelic_data` under convention Y: X/𝔽_q smooth, projective and geometrically connected, F=𝔽_q(X), and G=GL_n, n≥1, with its block Levis and unipotent radicals. Consume the completions F_v, compact valuation rings 𝒪_v, finite residue fields, completion-valued adeles 𝔸_F=∏′_v(F_v,𝒪_v), residue characters and discrete/cocompact rational additive quotient from AutomorphicLFunctionsAndLocalFactors AL.3 `curve-additive-analysis`. Its Representation prerequisite `restricted-tensor-realizations` supplies the compact rational unipotent quotients and their probability measures. Use |ϖ_v|_v=q^(−deg v) and deg(a)=−Σ_v deg(v)v(a_v), so |a|_𝔸=q^(deg a); the degree-zero principal-divisor law from AlgebraicCurves gives the multiplicative product formula. Construct K=∏_vGL_n(𝒪_v), Haar with vol K=1, rational counting measure and quotient integration/unfolding. Derive the volume conversion vol(F\𝔸_F)=q^(g−1) when vol(𝒪_v)=1; compare it with probability normalization on N(F)\N(𝔸_F) and track the resulting Haar factor separately. Prove finite-volume degree fibres modulo the specified centre and the reduction bounds used for convergent series.

Construct a degree-one idele a, Ξ_M generated by its block scalars, determinant-degree heights H_P, Iwasawa decomposition G(𝔸_F)=N_P(𝔸_F)M_P(𝔸_F)K and its integration formula. Fix the half-modulus δ_P^(1/2) with δ_P=|det Ad(m)|_{Lie N_P,𝔸}; Yu's notation |g|=q^(deg det g) agrees with this adelic determinant absolute value. Prove functoriality under Levi restriction, degree-additivity, quotient integration in stages, and the lattice/chamber formulas. The generic restricted-product carrier, topology and glued Haar construction are consumed from AdelicAlgebraicGroups AA.0.1–AA.0.3; its number-field adelic specialization is not an input here.

**Checks.**

- For X=ℙ¹, vol(F\𝔸_F)=q^(−1) with integral local additive measures; probability normalization on the quotient rescales this Haar by q.
- Scalar multiplication by a on GL_n changes determinant degree by n, so a single fixed-degree fibre is not invariant under Ξ_G.
- For GL_a×GL_b, block scalars a^i,a^j have determinant-degree vector (ai,bj), retaining the block sizes in the central lattice.

([Yu22], §§2.2.1–2.2.5, pp.8–9 and §§3.1.4–3.1.5, pp.14–15; the global/local Haar comparison in Proposition 5.3.4, p.39. AlgebraicCurves Layers 4–5 and 9 supply the Riemann–Roch and completion inputs to the quotient-volume construction.)

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.3 `curve-additive-analysis` and its AL.0 compact-open Fourier proof, and Representation prerequisites, `restricted-tensor-realizations` (rational unipotent quotients); AlgebraicCurves Layers 0–5 and 9 (places, completions, Riemann–Roch); AdelicAlgebraicGroups AA.0.1–AA.0.3 (generic restricted products and Haar); ReductiveGroups Layer 7; ReductiveGroupsPartII RG2.0 and RG2.4 for local GL_n points and integration.


### 1.10b Function-field induction and Eisenstein theory

Construct `function_field_eisenstein_theory` for the groups and measures of §1.10a. Consume the function-field cuspidal automorphic carrier from AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, `restricted-tensor-realizations`; construct its unitary central-character L² realization and prove compact support modulo centre, discreteness and finite multiplicity. For cuspidal Levi data, construct half-modulus-normalized parabolic induction, compact-picture finite-level sections, induction in stages, and transitivity of constant terms. Define Eisenstein sums and unipotent intertwiner integrals in the strict convergence chamber for determinant-degree characters; prove absolute local normal convergence and the cuspidal constant-term formula, with compatible quotient measures.

Continue these families rationally in the unramified character coordinates, prove Weyl functional/composition equations and unitarity at regular unitary parameters, and construct Laurent residues on the specified central quotient. Extension to discrete inducing data proceeds by induction in stages and the cuspidal residue description of §§4.14–4.17; that extension is used in §2.15, not in constructing the initial cuspidal theory. Prove level-change, character-twist and restricted-tensor compatibility. This is the function-field analytic input to convention Y, independent of the number-field statements in §§1.1 and 2.4.

**Checks.**

- For GL₁, P=G, Eisenstein summation and the same-parabolic intertwiner are both the identity.
- In unramified rank one the raw local spherical intertwiner is (1−q_v^(−1)z)/(1−z); at q_v=2,z=−1 its value is 3/4, so unitary normalization cannot be omitted.
- Normalized adjacent intertwiners compose to the identity at a regular unitary parameter; at a polar parameter the identity is meromorphic and does not license evaluation of a divergent integral.

([Laf97], Chapter VI §§1–2, in particular the induced spaces and intertwiners, pp.284–304; [Yu22], §§5.2.2–5.2.3, pp.32–35 and §5.3.1, pp.36–39 for the discrete residue extension.)

*Needs:* §1.10a; §0.50; AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, `restricted-tensor-realizations` (function-field cuspidal carrier); SmoothRepresentationsOfLocalGroups SR.1–SR.4; §0.15 (operator meromorphy).


### 1.11 Unramified character tori and central degree lattices

Define `unramified_character_torus` as follows. For M=∏GL_ni let M(A)^0 be the simultaneous kernel of rational-character degrees, Xi_M the central lattice generated by a in each block, X_M=Hom(M(A)/M(A)^0,C*)≅(C*)^r and X_M^L the characters trivial on Z_L(A). The latter need not be connected; Im denotes its unitary subgroup.

Prove the following API statements.
- `detCoordinates`: identify the unramified characters of a product Levi
- `trivialOnCenter`: construct X_M^L with its components
- `unitaryPart`: restrict to probability-Haar compact character tori

**Checks.**
- For M=G=GL_n, X_G^G={z∈C*:z^n=1}.
- For M=GL₂ and L=M, Im X_M^L=μ₂ has two points and is not connected.
- For M=GL_a×GL_b in G=GL_(a+b), X_M^G is given by x^a y^b=1, rather than xy=1 unless a=b=1.

([Yu22], §2.2.3, p. 9 (M(A)^0, Ξ_M, X_M, X_M^L); unitary parts Im X in §4.)

*Needs:* §1.10a (function-field adeles, heights and measures).


### 1.12 Induced spherical sections with a fixed normalization

Define `induced_spherical_section` as follows. For each R∈P(M), fix the inducing character s_R explicitly. The spherical section space consists of phi on M(F)N_R(A)\G(A)/K with s_R⁻¹ phi|_M∈pi; its basis is s_R*phi_pi. [Laf97], p.284, and [Yu22], p.32, use s_R=rho_R (with P to be read as R in [Yu22]); [Yu22], p.39, uses s_R=rho_R⁻¹. Use induction_normalization_transport to transport conventions and fix the choice matching the Rankin–Selberg normalizers of §4.15d.

Prove the following API statements.
- `sphericalSection`: For specified s_R, extend phi_pi by phi_R(nmk)=s_R(m)phi_pi(m).
- `leviRestriction`: Recover phi_pi by multiplying the Levi restriction by s_R⁻¹.
- `parameterTwist`: transport along an unramified lambda

**Checks.**
- For prescribed s_R, the Levi restriction of s_R*phi_pi multiplied by s_R⁻¹ equals phi_pi.
- For R=G the modular character is 1, so both displayed rho conventions give the same section.
- At an Iwasawa point with ρ_R=2, transport from ρ_R to ρ_R⁻¹ multiplies any spherical section by 1/4: a value-six section becomes 3/2, while its recovered Levi vector stays three.

([Yu22], §5.2.2 and §5.3.2, pp.32, 39.)

*Needs:* §4.11; §4.12; §1.10a (function-field adeles, heights and measures); §1.10b (function-field induction).


### 1.13 Explicit transport between induction normalization conventions

Define `induction_normalization_transport` as follows. Fix positive inducing characters s_R on M(A). Define A_R,pi^s by s_R⁻¹*phi|_M∈pi and spherical basis phi_R(nmk)=s_R(m)*phi_pi(m). For a second convention t_R, C_R^(s→t) multiplies by t_R/s_R in Iwasawa coordinates. Transport each operator by M^t_(R′|R)=C_R′ M^s_(R′|R) C_R⁻¹. [Yu22], p.32, and [Laf97], p.284, use s_R=rho_R in their membership formula ([Yu22] writes P); [Yu22], p.39, uses s_R=rho_R⁻¹. One cannot identify the numerical normalizers constructed in §4.15d until this dictionary, including parameter conventions, is checked.

Prove the following API statements.
- `normalizedSection`: From a fixed positive character s_R, extend a Levi spherical vector by multiplication by s_R; independence follows from its triviality on M∩K.
- `changeConvention`: C_R^(t→u)∘C_R^(s→t)=C_R^(s→u), and C_R^(s→s)=Id.
- `conjugateOperators`: Transport domains, intertwining identities and norms together; a closed composition on A_P is conjugated by C_P, hence has unchanged finite-dimensional trace.

**Checks.**
- The section transport from ρ to ρ⁻¹ sends a value-two vector to one half when ρ=2.
- Restricting s_R*phi_pi and multiplying by s_R⁻¹ recovers phi_pi exactly.
- The squared norm of the transported section, integrated with the compensating factor |ρ|⁴, equals the original integrated squared norm.

([Yu22], §§5.2.2–5.2.3, pp.32–36.)

*Needs:* §1.12; §2.15; §1.10a (function-field adeles, heights and measures); §1.10b (function-field induction).


### 1.14 Nonholomorphic Eisenstein series

Define `nonholomorphic_eisenstein` as follows. For Re(s)>1, E(z,s)=Σ_{Γ∞\PSL₂(Z)}Im(γz)^s=(1/2)y^sΣ_{gcd(c,d)=1}|cz+d|^(−2s). The half accounts for ±(c,d). Prove local normal convergence and ΔE=s(1−s)E.

Prove the following API statements.
- `cosetSum`: Define E by ΣIm(γz)^s in Re(s)>1.
- `primitivePairs`: The coprime(c, d) expression has factor 1/2 for ±pairs.
- `automorphy`: E(γz, s)=E(z, s) and ΔE=s(1−s)E in the normal-convergence region (`nonholomorphic_eisenstein_automorphy` and `nonholomorphic_eisenstein_eigenfunction`).
- `nonholomorphic_eisenstein_summable`: The primitive-pair sum is absolutely and locally normally convergent for Re(s)>1.

**Checks.**
- Along the imaginary axis E(iy,2)/y² tends to one as y tends to infinity, testing the Eisenstein leading constant term.
- Summing primitive pairs without 1/2 doubles E.
- The critical-line value requires continuation and cannot be obtained by declaring the initial series convergent there.

([DIT16], §5, (5.2), p.961.)

*Needs:* §1.3.


### 1.15 Completed Eisenstein series

Define `completed_eisenstein` as follows. Let Λ(s)=π^(−s/2)Γ(s/2)ζ(s), and E*(z,s)=Λ(2s)E(z,s), with meromorphic values interpreted through continuation. Its critical-line use includes the limit at t=0.

Prove the following API statements.
- `completion`: Multiply E(z, s) by Λ(2 s) where Λ is the completed scalar zeta.
- `constantTerm`: Its constant Fourier coefficient is Λ(2 s)y^s+Λ(2−2 s)y^(1−s).
- `continuation`: Define equality with the initial completion on Re(s)>1 and extend meromorphically (`completed_eisenstein_continuation`). The uncompleted continuation has residue 3/π at one (`nonholomorphic_eisenstein_continuation`).

**Checks.**
- Residues at 0 and 1 are −1/2 and +1/2.
- At critical t=0, cancellations between meromorphic pieces require a limit.
- An uncompleted E period cannot be substituted into Theorem 3 of [DIT16] without dividing by Λ(2 s).

([DIT16], §5, (5.3), p.962.)

*Needs:* §1.3; §1.14; AutomorphicLFunctionsAndLocalFactors Layer 0; AutomorphicLFunctionsAndLocalFactors Layer 1, Hecke functional equation; AutomorphicLFunctionsAndLocalFactors Layer 1, global Tate zeta integral.


### 1.16 Kloosterman sums and hyperbolic Laplacians

Define `kloosterman_sum`, `weight_laplacian` as follows. For m,n∈ℤ and c≥1, S(m,n;c)=Σ_{d∈(ℤ/cℤ)^×}e((md+nd̄)/c) with dd̄≡1 mod c and e(x)=exp(2πix). For real k and a twice real-differentiable f on ℍ, z=x+iy, the weight-k Laplacian is Δ_k f=−y²(∂ₓ²+∂ᵧ²)f+iky(∂ₓ+i∂ᵧ)f. Its weight-zero case is the convention-D Laplacian Δ=Δ₀, and Δ_GZ=−Δ₀.

*Standing hypotheses:* c≥1; f is C² on ℍ.

Prove the following API statements.
- `kloosterman_sum_symm`: S(m,n;c)=S(n,m;c), by d↦d̄; so the sum does not depend on which variable carries the inverse.
- `kloosterman_real`: S(m,n;c) is real, by d↦−d.
- `weight_laplacian_slash`: for integral k, Δ_k commutes with the slash action f↦(cz+d)^(−k)f(gz) of SL₂(ℝ).
- `weight_laplacian_power`: Δ_k y^s=s(1−k−s)y^s for every complex s, with y>0.

**Checks of the finite sum.**
- S(m,n;1)=1, including m=n=0.
- S(0,0;c)=φ(c); summing over all residue classes would give c instead.
- S(m,0;p)=p−1 if p divides m and −1 otherwise, for prime p. More generally S(m,0;c)=Σ_{d|(m,c)}μ(c/d)d.

**Checks of the Laplacian.**
- Δ_k 1=0 for every real k.
- Δ₀ y²=−2y²; the opposite-sign convention gives 2y².
- Δ_k y^s=s(1−k−s)y^s, while Δ_GZ y^s=s(s−1)y^s at k=0. Conjugating by y^(k/2) gives the constant shift k²/4−k/2, which is −3/16 at k=1/2.

([DIT16], §8, p.974 (the sum in Φ(m,n;s)); [DLMF](https://dlmf.nist.gov/27.10) 27.10.4–27.10.5 (Ramanujan's sum); Bruinier–Funke, [On two geometric theta lifts](https://arxiv.org/pdf/math/0212286v2), Duke Math. J. 125 (2004), §3 (3.1), p.8.)

*Needs:* `ArithmeticFunction.moebius`.


### 1.16a Self-adjoint modular Laplacians

Construct `modular_laplacian_realization` for N≥1 on the complete finite-area hyperbolic orbifold Γ₀(N)/{±I}\ℍ, with dμ=dxdy/y². On smooth compactly supported orbifold functions Δ_N=−y²(∂ₓ²+∂ᵧ²) is densely defined, symmetric and nonnegative. Close the quadratic form ∫(|∂ₓf|²+|∂ᵧf|²)dxdy and construct its Friedrichs operator; prove that the minimal differential operator is essentially self-adjoint, so its closure equals this realization. Identify its domain with f∈L² whose distributional Δ_N f lies in L², and prove local elliptic regularity, including the finite-stabilizer orbifold charts. Self-adjointness is an operator/domain theorem, independent of the later continued kernel.

Construct the cusp Fourier realization at every level-N cusp, with its actual width: the zero mode supplies the continuous channel, while nonzero modes have the confining cusp operator. Prove that the zero-constant-term subspace is reducing, its Laplacian has compact resolvent, and its eigenfunctions are smooth and rapidly decreasing in each cusp. The spectral expansion §4.8 uses these operators; §2.19 constructs their continued resolvent kernels.

**Checks.**

- The constant function belongs to the full operator domain, has Δ_N1=0 and norm squared equal to the quotient volume; it is outside the cuspidal subspace.
- At the infinity cusp, Δ_N y^s=s(1−s)y^s; for Re(s)=1/2 this power is not L² on the cusp, so it is a generalized mode rather than a domain vector.
- For Γ₀(2) the cusps at infinity and zero have widths one and two, respectively; keeping only the infinity zero mode loses a continuous channel.

([DIT16], §5 (5.1)–(5.6), pp.961–962 and §8 (8.2), p.973; the form construction uses [Tes09], §2.3, the Friedrichs extension. Essential self-adjointness uses completeness and cutoff integration by parts; interior regularity uses PDE's elliptic regularity estimates in orbifold charts.)

*Needs:* §1.16; §0.6; FuchsianOrbifolds Layer 4 (finite-area modular quotients); PDE (elliptic regularity); SelfAdjointSpectralTheory (closed self-adjoint operators).


### 1.17 Weight-zero Bessel–Kloosterman coefficient

Define `bessel_kloosterman_coefficient` as follows. For mn≠0 and Re(s)>1, Φ(m,n;s)=Σ_{c>0}c⁻¹K(m,n;c)B_{2s−1}(4π√|mn|/c), using I for mn<0 and J for mn>0. This sign convention must match the F_{−m} residue.

Prove the following API statements.
- `signBranch`: Use I_{2 s−1} for mn<0 and J_{2 s−1} for mn>0.
- `initialConvergence`: The series over c defines Φ in Re(s)>1 for fixed nonzero m,n.
- `resolventComparison`: Identify Φwith the Fourier coefficient of F_m before continuation.

**Checks.**
- m=n=1 uses J.
- m=−1, n=1 uses I.
- The formula for Φ(m,n;s) excludes m=0 and n=0. Its coefficient at (1,1) uses J_{2s−1}(4π/c); the zero frequency uses its separate constant-term formula.

([DIT16], §8, p.974.)

*Needs:* §0.26; §0.27; §0.25; §1.16.


### 1.18 Weight-zero Poincaré family

Define `poincare_family` as follows. For m≠0 and Re(s)>1 let F_m(z,s)=Σ_{Γ∞\Γ}√Im(γz) I_{s−1/2}(2π|m|Im(γz))e(m Re(γz)); F_0=E. No L² assumption is imposed on the exponentially growing seed.

Prove the following API statements.
- `seed`: Use √yI_{s−1/2}(2π|m|y)e(mx) for nonzero m.
- `automorphicSum`: The coset sum is Γ-invariant in Re(s)>1.
- `resolventContinuation`: Relate the seed and Fourier expansion to the resolvent rather than assuming the growing series is L².

**Checks.**
- m=0 gives E by a separate definition.
- The absolute value of m occurs in the Bessel argument but not in the phase.
- The large-argument I-Bessel asymptotic makes the nonzero Poincaré seed's squared cusp norm nonintegrable for real s>1; the seed is not an L² vector.

([DIT16], §8, (8.1), p.973.)

*Needs:* §1.3; §0.26; §0.27; §0.25.


### 1.19 Poincaré eigenfunction and convergence

Prove `poincare_eigenfunction`. F_m converges normally on compact sets for Re(s)>1, is Γ-invariant and satisfies ΔF_m=s(1−s)F_m. The differentiated series needs its own compact majorant.

([DIT16], §8, p.973.)

*Needs:* §0.26; §0.27; §0.25.


### 1.20 Weight-two Poincaré one-form

Define `poincare_one_form` as follows. For smooth φ:(0,∞)→ℂ with φ(y)≪y^ε near zero, ε>0, and m∈ℤ, define P_m(τ,φ)=Σ_(γ∈Γ∞\Γ)e(m Re(γτ))φ(Im(γτ))·d(γτ)/dτ. It has weight two, making P_m dτ invariant. The value bound suffices for absolute convergence and Lemma 6 unfolding; φ from (9.2) satisfies it for Re(s)>1. The paper's stronger y^(1+ε) bound is unnecessary for these value assertions. Differentiating the series needs additional derivative bounds.

Prove the following API statements.
- `oneFormSum`: Sum the seed times d(γz), including the Möbius derivative.
- `weightTwo`: P_m(γz)γ′(z)=P_m(z), so the one-form P_m dz descends to the quotient.
- `parameterBounds`: Expose small-y bounds for φ and the derivatives actually used in normal convergence.

**Checks.**
- For a smooth compactly supported seed, inversion transforms the Poincaré coefficient with derivative z^(−2), as required for the descended weight-two one-form.
- Reversing the interval orientation negates the integral of the poincare_one_form one-form pulled back along a parametrized cycle.
- The smooth seed y²sin(exp(1/y)) satisfies the order-two value bound, including the ε=1 small-y condition, but has no uniformly bounded derivative near zero.

([DIT16], §9, p.979.)

*Needs:* §1.3.


### 1.21 Differentiated Whittaker seed

Prove `whittaker_seed_derivative`. For m∈ℤ with m≠0, Re(s)>1 and z=x+iy∈ℍ, −2i∂_zF_m is the weight-two Poincaré series with seed −s|m|^(−1/2)(2πy)⁻¹ Γ(s)/Γ(2s) M_{sgn(m),s−1/2}(4π|m|y)e(mx). Justify termwise differentiation with the compact majorants and derivative bounds of §§1.18–1.20. For m=0, differentiate F₀=E separately: the weight-two seed is −s y^(s−1), with the same convergence half-plane.

**Checks.**

- At m=0 and s=2, the leading y² Eisenstein term has −2i∂_z derivative −2y; the nonzero-frequency Whittaker seed does not apply.
- At m=1 the Whittaker index is 1 and the phase is e(x); at m=−1 they are −1 and e(−x), with the same positive Whittaker argument 4πy.
- The endpoint Re(s)=1 is outside the differentiated-series assertion; a continued value there requires the continuation theory.

([DIT16], §9, (9.2), p.979.)

*Needs:* §0.26; §0.27; §§1.18–1.20 (compact majorants and seed derivative bounds).


### 1.22 Fourier expansion of F_m(z,s)

Prove `poincare_fourier_expansion`. Let m≠0 and Re(s)>1. Then F_m(z,s)=f_m(z,s)+2|m|^{1/2−s}σ_{2s−1}(|m|)((2s−1)Λ(2s))⁻¹y^{1−s}+2y^{1/2}Σ_{n≠0}Φ(m,n;s)K_{s−1/2}(2π|n|y)e(nx), with Λ(s)=π^{−s/2}Γ(s/2)ζ(s) and Φ as defined by `bessel_kloosterman_coefficient`.

([DIT16], §8, p.974, citing Hejhal for continuation and Iwaniec for the Fourier expansion.)

*Needs:* §0.26; §0.27.


### 1.23 Weight-0 Eisenstein series E_N(z, s) at ∞ (2.14)

Define `level_eisenstein` as follows. For N≥1 and Re(s)>1 define the cusp-∞ Eisenstein series E_N(z,s)=Σ_{γ∈Γ∞\Γ₀(N)}Im(γz)^s, equivalently (1/2)Σ y^s|cz+d|^(−2s) over coprime (c,d) with N|c. Prove local normal convergence, Γ₀(N)-invariance and that E_1 is the series of §1.14. Under Δ_GZ=+y²(∂x²+∂y²), Δ_GZ E_N=s(s−1)E_N; −4πE_N has residue κ_N=−12/[SL₂(ℤ):Γ₀(N)] at s=1.

Prove the following API statements.
- `coprime_pairs`: E_N is half the sum over coprime (c,d) with N|c in Re(s)>1.
- `coset_sum`: E_N is the coset sum over Γ∞\Γ₀(N) in Re(s)>1; `level_eisenstein_summable` gives absolute convergence and `level_eisenstein_automorphy` gives Γ₀(N)-invariance for N≥1.
- `level_one`: At N=1 it equals the DIT E with the same half for ±pairs.

**Checks.**
- N=1 gives E and residue 3/π.
- For N=p the congruence-pair Eisenstein continuation, with Mathlib Riemann zeta normalization, gives residue 3/[π(p+1)] at s=1.
- The unrestricted nonzero integer-pair Eisenstein sum at s=2 equals 2ζ(4) times the primitive-coset nonholomorphic_eisenstein series and differs from that normalized series.
- At N=0 the coprime-pair expression retains only c=0,d=±1 and equals y^s; it is outside the positive-level analytic and residue assertions.


([GZ86], Chapter II, §2, (2.14), p. 239.)

*Needs:* §1.14; Mathlib `CongruenceSubgroup.Gamma0`; `zeta_eq_tsum_one_div_nat_add_one_cpow`.


### 1.24 E_N via the SL₂(ℤ) series (2.16)

Prove `level_eisenstein_mobius`. For N ≥ 1: E_N(z, s) = N^{−s} ∏_{p|N} (1 − p^{−2s})⁻¹ Σ_{d|N} μ(d) d^{−s} E((N/d)z, s), E = E₁ the SL₂(ℤ) series; consequently E_N(w_N z, s) = N^{−s} ∏_{p|N}(1 − p^{−2s})⁻¹ Σ_{d|N} μ(d) d^{−s} E(dz, s) (p. 241).

([GZ86], Chapter II, §2, (2.16), p. 240; p. 241.)

*Needs:* §1.14; §1.23; Mathlib `CongruenceSubgroup.Gamma0`; `ArithmeticFunction.moebius`.


### 1.25 Non-holomorphic Eisenstein series E_s = E_{M,ε,2k−1,s} of level M = N|D|

Define `character_eisenstein` as follows. Let D<0 be a fundamental discriminant, ε its odd primitive quadratic character, δ=|D|, k≥1 and (N,D)=1. With M = N|D|: E_s(z) = E_{M,ε,2k−1,s}(z) = L^{(N)}(2s+2k−1, ε) Σ_{±(∗ ∗; c d) ∈ Γ_∞\Γ₀(M)} ε(d)(cz+d)^{−(2k−1)} y^s |cz+d|^{−2s} = ½ Σ_{c,d∈ℤ, c≡0 (mod M), (d,M)=1} ε(d)(cz+d)^{−(2k−1)} y^s |cz+d|^{−2s}, for Re(s) large. Here L^{(N)}(s, ε) = Σ_{(n,N)=1} ε(n)n^{−s} and Γ_∞ = {±(1 n; 0 1)}. E_s ∈ M̃_{2k−1}(Γ₀(M), ε). (The two expressions agree: pull out g = gcd(c,d), which is prime to M, and pair ±(c,d) using ε(−1)(−1)^{2k−1} = 1.)

Prove the following API statements.
- `primitive_to_full`: The L^(N) factor converts the primitive coset sum into the half unrestricted sum.
- `automorphy`: The series has weight 2k−1 and Nebentypus ε on Γ₀(Nδ).
- `n_one`: For N=1 it is the D₁=1 case of §1.26.

**Checks.**
- With an odd character, negating both lattice indices leaves the character_eisenstein summand unchanged; the half-sum equals the normalized Eisenstein series.
- N=1 gives level δ.
- With an even character and an absolutely summable odd-weight lattice family, the character_eisenstein series vanishes by cancellation of opposite indices.

([GZ86], Chapter IV, §1, p. 271.)

*Needs:* §1.1; §1.3; AutomorphicLFunctionsAndLocalFactors Layer 0; AutomorphicLFunctionsAndLocalFactors Layer 1, Hecke functional equation; AutomorphicLFunctionsAndLocalFactors Layer 1, global Tate zeta integral.


### 1.26 Eisenstein series E^{(D₁)}_s attached to a decomposition D = D₁·D₂ (2.1)

Define `genus_eisenstein` as follows. Fix an odd negative fundamental discriminant D, k≥1 and a factorization D=D₁D₂ into fundamental discriminants, allowing D_i=1. Let ε_i be the primitive quadratic characters of conductors |D_i|. For sufficiently large Re(s), define E_s^(D₁)(z) by half the sum over integer pairs (m,n) with D₂ dividing m of ε₁(m)ε₂(n)(mz+n)^(−2k+1) Im(z)^s |mz+n|^(−2s). Its transformation law has weight 2k−1 and character ε₁ε₂ on Γ₀(|D|). The case D₁=1 recovers the level-|D₂| series. Genus characters and ramified ideals are imported arithmetic data for the consumers, rather than part of this analytic definition.

Prove the following API statements.
- `pair_sum`: Use ½Σ_{D₂|m}ε₁(m)ε₂(n)(mz+n)^(−2k+1)y^s|mz+n|^(−2s).
- `d1_one`: D₁=1 recovers E^(1)_s of GZ IV(1.2).
- `automorphy`: The coefficient pair transforms by ε(d), giving weight 2k−1 on Γ₀(δ).

**Checks.**
- D₁=1 gives the level δ series.
- When the product of the two character parities is odd, simultaneous sign reversal preserves the two-character lattice summand and its half-sum is genus_eisenstein.
- The supplied discriminant criterion accepts 12 and rejects 16. In the negative odd domain of this genus character, −7 is permitted and −9 is excluded. The raw analytic lattice sum alone does not construct primitive arithmetic characters.

([GZ86], Chapter IV, §2, (2.1), p. 273.)

*Needs:* §1.1; §1.3; AutomorphicLFunctionsAndLocalFactors Layer 0; AutomorphicLFunctionsAndLocalFactors Layer 1, Hecke functional equation; AutomorphicLFunctionsAndLocalFactors Layer 1, global Tate zeta integral; `TauCeti.Multiquadratic.IsFundamentalDiscriminant`.


### 1.27 Poisson (Lipschitz-type) identity for Σ_l (z+l)^{−(2k−1)}|z+l|^{−2s}

Prove `lipschitz_poisson_identity`. For k ≥ 1, z = x+iy ∈ ℌ and Re(s) > 1−k: Σ_{l∈ℤ} 1/((z+l)^{2k−1}|z+l|^{2s}) = y^{−2s−2k+2} Σ_{r∈ℤ} V_s(ry) e^{2πirx}. Termwise Poisson requires the value/derivative decay proved from the explicit seed; general L¹ Fourier inversion alone is insufficient.

([GZ86], Chapter IV, §3, proof of (3.2), p. 278.)

*Needs:* §0.39.


### 1.28 Fourier expansion of E^{(D₁)}_s

Prove `genus_eisenstein_fourier`. Let D<0 be an odd fundamental discriminant, δ=|D|, ε its primitive quadratic character, k≥1, N≥1 and (D,2N)=1. For a factorization D=D₁D₂ into fundamental discriminants (allowing D_i=1), put δ_i=|D_i|, ε_i=ε_(D_i), and κ(D₁)=1 or i according to its sign. Write E_s^(D₁)(z)=Σ_n e_s^(D₁)(n,y)e(nx). The constant coefficient is L(2s+2k−1,ε)y^s if (D₁,D₂)=(1,D), is V_s(0)L(2s+2k−2,ε)y^(−s−2k+2) if (D₁,D₂)=(D,1), and is zero otherwise. For n≠0 it is [ε₁(δ₂)κ(D₂)/δ₂^(2s+2k−3/2)]·[Σ_(m|n,m>0)ε₁(m)ε₂(n/m)m^(−2s−2k+2)]·y^(−s−2k+2)V_s(ny), with L(s,ε)=Σ_(n≥1)ε(n)n^(−s). The formula holds initially for large Re(s) and continues meromorphically.

([GZ86], Chapter IV, §3, proof of (3.2), pp. 278–279.)

*Needs:* §0.39; §1.26; §1.27.


### 1.29 Growth of the SL₂(ℤ) Eisenstein series: E(z,s) = y^s + O(y^{1−s})

Prove `eisenstein_growth`. For real s > 1 let E(z,s) = Σ_{γ∈Γ_∞\SL₂(ℤ)} Im(γz)^s = Σ_{(c,d)=1, mod ±} y^s/|cz+d|^{2s}. Then E(z,s) = y^s + O(y^{1−s}) as y → ∞ (uniformly in x).

([GZ86], Chapter IV §5 proof of (5.1), p.289; estimate follows from Chapter II, (2.17), p.240.)

*Needs:* §2.17.


### 1.30 Fourier expansion of the weight-0 Eisenstein series and of E_{2,s}

Prove `eisenstein_fourier_weight_two`. For E(z,s) = Σ_{Γ∞\SL₂(ℤ)} Im(γz)^s (weight 0): E(z,s) = y^s + π^{1/2}Γ(s−½)ζ(2s−1)/(Γ(s)ζ(2s)) · y^{1−s} + (2π^s y^{1/2}/(Γ(s)ζ(2s))) Σ_{m≠0} |m|^{1/2−s} σ_{2s−1}(m) K_{s−1/2}(2π|m|y) e^{2πimx}, σ_ν(m) = Σ_{d|m} d^ν, K_ν = K-Bessel function. The identity (cz+d)^{−2}|cz+d|^{−2s} y^s = (2i/(s+1)) ∂/∂z (y^{s+1}/|cz+d|^{2s+2}) gives E_{2,s}(z) = (2i/(s+1)) ∂/∂z E(z, s+1), hence E_{2,s}(z) = y^s − π^{1/2} s Γ(s+½)ζ(2s+1)/(Γ(s+2)ζ(2s+2)) · y^{−1−s} + Σ_{m≠0} e_{2,s}(m,y)e^{2πimz} with e_{2,s}(m,y) = (2π^{s+1}|m|^{−s−1/2}/(Γ(s+2)ζ(2s+2))) σ_{2s+1}(m) e^{2πmy} (∂/∂y − 2πm)(√y K_{s+1/2}(2π|m|y)).

([GZ86], Chapter IV, §6, proof of (6.2), pp. 298-299.)

*Needs:* §2.17; §1.20.


### Examples

In the full modular case λ=s−1/2 and E(z,s)=½y^sΣ_(c,d)=1|cz+d|^(−2s). Its constant leading term at infinity is y^s; deleting the half doubles it. For N=p the cusp-∞ residue is 3/[π(p+1)]. For the nonzero Poincaré seed the I-Bessel growth prevents L² membership, so it cannot be inserted as an L² vector. Changing a spherical section from ρ to ρ⁻¹ sends its value two to one half when ρ=2; closed operator compositions must be conjugated with this transport.

### Dependencies

Use the adelic quotient and reduction contracts, the cuspidal space, normalized local and real induction and scalar Fourier–Laplace analysis. The pseudo-Eisenstein inner product uses only chamber convergence and convergent intertwiners; the elementary orthosum is established before meromorphic continuation. Modular sums use the explicit special functions from Layer 0 and the Kloosterman/Laplacian construction of this layer. The function-field section normalization uses the character torus and discrete-pair branch of Layer 4.

## Layer 2: Meromorphic continuation, local normalization and residues

### 2.1 Local standard intertwining operators

Define `local_intertwiner` as follows. For a characteristic-zero local field k, a Levi M of a connected reductive G and irreducible admissible π of M(k), J_Q|P(π_λ):H_P(π)→H_Q(π) is the quotient unipotent integral with half-modulus twists, initially where Re λ is sufficiently positive relative to π. Its K-finite matrix coefficients continue meromorphically; they are rational in q^(−λ(α∨)) for nonarchimedean k. The fixed compact picture and normalized induction are imported; the new interface supplies the analytic integral and its continuation.

*Standing hypotheses:* P,Q have common Levi M; π is admissible; sufficiently positive means relative to the exponents of π, not a uniform chamber for all π.

Prove the following API statements.
- `intertwines`: J_Q|P(π_λ) intertwines I_P(π_λ) and I_Q(π_λ).
- `identity`: J_P|P(π_λ)=id.
- `meromorphic_coefficients`: Each fixed K-finite matrix coefficient is meromorphic in λ, rational in the exponential coordinates over nonarchimedean k.

**Checks.**
- When P=Q the integral is the identity.
- For GL₂(k), unramified χ₁⊗χ₂ and hyperspecial normalization, the nontrivial Weyl integral on the spherical vector equals (1−q⁻¹z)/(1−z), z=χ₁(ϖ)/χ₂(ϖ), in |z|<1.
- The continued spherical eigenline, identified with the valuation-shell integral in its chamber, sends one to a vector of norm 3/4 at q=2,z=−1; it does not preserve norm on the unitary axis.

([Art05], §21 pp.134–135 preceding Theorem 21.4.)

*Needs:* SmoothRepresentationsOfLocalGroups Layer 2; SmoothRepresentationsOfLocalGroups Layer 3; §0.48 (real reductive representation foundations); §0.15.


### 2.2 Harish-Chandra μ-function

Define `mu_function` as follows. For irreducible admissible π and opposite P,P̄ with Levi M, the composition J_P|P̄(π_λ)J_P̄|P(π_λ) is the scalar μ_M(π_λ)⁻¹ times the identity as a meromorphic family. This defines the measure-dependent μ-function with the specified Haar measures. It is not the global scattering matrix, and a change of the two unipotent measures rescales μ inversely by their product. Rank-one root factors control the higher-rank Plancherel density.

*Standing hypotheses:* characteristic-zero local field; irreducible admissible inducing representation; generic irreducibility and analytic continuation identify the scalar meromorphically.

Prove the following API statements.
- `opposite_composition`: J_P|P̄ J_P̄|P=μ_M⁻¹ id as meromorphic families.
- `measure_change`: Multiplying the two unipotent measures by c,d multiplies μ⁻¹ by cd.
- `rank_one_product`: The reduced-root rank-one composition scalars give the higher-rank μ-product with the fixed measures.

**Checks.**
- For M=G the point integral gives μ=1.
- For unramified GL₂, μ⁻¹=c(z)c(z⁻¹), c(z)=(1−q⁻¹z)/(1−z), interpreted meromorphically.
- Rescaling both opposite measures by 2 changes μ⁻¹ by 4; μ is not measure independent.

([Art05], §21 p.135 before Theorem 21.4.)

*Needs:* §2.1.


### 2.3 Existence of local normalizing factors

Prove `local_normalization`. There exist scalar meromorphic r_Q|P(π_λ), products of reduced-root rank-one factors, such that R_Q|P=r_Q|P⁻¹J_Q|P is transitive: R_R|P=R_R|Q R_Q|P. It is equivariant under Weyl transport and compatible with induction in stages. For unitary π, R_Q|P is analytic and unitary on i𝔞_M* and R_Q|P(λ)*=R_P|Q(−overline λ). K-finite coefficients are rational in λ(α∨) over real fields and in q^(−λ(α∨)) over nonarchimedean fields. For tempered π, r_Q|P has no zeros or poles in the open P-positive chamber. For unramified π and hyperspecial K with the normalized spherical vector, R_Q|P maps that vector to its counterpart in H_Q. The factors are choices satisfying these properties, not a canonical global L-function for every reductive group.

*Standing hypotheses:* characteristic-zero local fields; connected reductive G; irreducible admissible π; unitary, tempered and spherical clauses carry their own additional hypotheses.

([Art89W], §2, Theorem 2.1, pp.28–29; its real and nonarchimedean constructions occupy §§3–4, pp.32–44.)

*Needs:* §2.2; §2.1; SmoothRepresentationsOfLocalGroups Layer 4.


### 2.3a GLₙ normalized intertwining estimates

<a id="gln-normalized-intertwining"></a>

**GLₙ normalized intertwining estimates.** For a characteristic-zero local F and generic unitary irreducible π₁,π₂ of GL_n(F),GL_m(F), use normalized induction to GL_(n+m) in a fixed compact picture. Starting from the standard unipotent intertwiner J of §2.1, construct N with the Rankin–Selberg L/epsilon normalization of Gelbart–Shahidi (2.5); compare those local factors with AutomorphicLFunctionsAndLocalFactors AL.3's integral factors. Transport the inducing representation, Weyl element and additive character in the inverse identity (2.6). Prove the GLₙ instance of Assumption 2.1: at each s with Re(s)≥1/2 there is a flat section and an evaluation g for which N(s) applied to that section is holomorphic and nonzero at s. On fixed finite-level/maximal-compact-type blocks prove polynomial bounds for its matrix coefficients on finite strips away from their poles; at infinity retain continuous seminorm bounds in the compact picture. Unitarity on the imaginary axis from §2.3 alone does not give this positive-half-plane statement. Both a representation and its contragredient carry the hypotheses.

**Checks.** The identity Weyl element gives the identity operator; at an unramified place with conductor-O additive character and hyperspecial Haar normalization, the normalized spherical line maps to its counterpart with value 1; at every point of Re(s)=1/2 at least one flat-section evaluation is nonzero, so the zero operator cannot satisfy the contract.

(Source: Gelbart–Shahidi [GS01], *Boundedness of automorphic L-functions in vertical strips*, JAMS 14 (2001), §2, (2.5)–(2.6) and Assumption 2.1, pp.84–85; §4, Corollary 4.2 and its proof, p.88; Mœglin–Waldspurger [MW89], I §10, Proposition, pp.639–640.)

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.3, local L/epsilon factors and local functional equation; [Archimedean Whittaker comparisons](../AutomorphicLFunctionsAndLocalFactors/README.md#archimedean-smooth-representations); SmoothRepresentationsOfLocalGroups SR.2–SR.3; §§2.1–2.3 for unipotent operators, continuation and compact-picture normalization.


### 2.4 Langlands meromorphic continuation and functional equations

Prove `eisenstein_continuation`. For φ∈H_P⁰, E_P(g,φ,λ) and M(w,λ)φ extend meromorphically to all 𝔞_P,ℂ*. On each finite inducing/K-type block there is a common local product of affine linear forms clearing the polar divisor. They obey E_Q(g,M(w,λ)φ,wλ)=E_P(g,φ,λ) and M(vw,λ)=M(v,wλ)M(w,λ). On i𝔞_P* both families are regular and M(w,λ) extends to a unitary H_P→H_Q. Regularity here is for unitary discrete inducing data and the global family; a scalar normalizing factor or arbitrary nonunitary local family can still have a pole.

*Standing hypotheses:* number field; discrete inducing H_P⁰; hyperplane denominators are local and on fixed finite blocks; the whole smooth Fréchet family requires the explicit seminorm extension.

([Art05], §7 Theorem 7.2(a), equations (7.3)–(7.4), p.35.)

*Needs:* §1.10; §1.8; §1.4; §0.6; §0.15; §0.16.


### 2.5 Local–global factorization and adjoints

Prove `intertwiner_factorization`. For a factorizable discrete π=⊗′π_v and vector, the global M_Q|P restricted to its π-isotypic inducing space is m_disc(π) copies of ⊗′J_Q|P(π_v,λ), first in the common convergence chamber and then meromorphically. With compatible chosen local factors, R_Q|P(global)=⊗′R_Q|P(local) is a finite product on a spherical-outside-S vector. M_Q|P=r_Q|P R_Q|P, where r_Q|P is the analytically continued Euler product; no absolute Euler-product convergence is asserted on the unitary axis. Globally M(w,λ)*=M(w⁻¹,−overline(wλ)) and the cocycle implies the inverse on the regular unitary axis.

*Standing hypotheses:* restricted tensor factorization of automorphic π is an imported theorem; outside S data and normalizations are hyperspecial spherical.

([Art05], §21, (21.13)–(21.14), p.136.)

*Needs:* §2.3; §2.4; §1.1; §0.50 (restricted tensor factorization), restricted tensor factorization.


### 2.6 Polar hyperplanes and ordered Eisenstein residues

Define `residue_calculus` as follows. On a fixed finite inducing/K-type block, regularize E and M near a parameter λ₀ by a finite affine-root hyperplane product. For an ordered list of independent hyperplanes choose transverse coordinates z₁,…,z_r and define the ordered residue by successive z_j⁻¹ Laurent coefficients. It is a continuous linear map of inducing vectors, with the order and coordinates included as data. Residues that meet Langlands’s square-integrability exponent criterion give residual automorphic forms; a pole of M alone does not certify a nonzero L² residue of E.

*Standing hypotheses:* common denominator; an ordered independent hyperplane flag; the L² assertion additionally requires every surviving exponent to lie in the appropriate negative cone modulo center.

Prove the following API statements.
- `coefficient`: Ordered residues compose Laurent-coefficient maps. Each Cauchy circle has positive radius, contains no other pole and uses a common denominator with holomorphy on the punctured closed ball.
- `constant_term`: Constant term commutes with a justified common-denominator residue and reveals its exponents.
- `change_coordinate`: Changing transverse coordinates transforms residue differential forms by the determinant; a scalar residue requires the chosen coordinates.

**Checks.**
- The ordered residue of v/(z₁z₂) is v in either coordinate order.
- A holomorphic family has zero residue.
- The scalar family 1/z² has a pole at zero and residue zero.

([Art05], §12 p.66 discussion of contour shifts.)

*Needs:* §2.4; §1.5; §0.15; ArithmeticLocallySymmetricSpaces ALS.F.6.


### 2.7 Generic local packets of classical groups

Define `generic_packet` as follows. Let F be a local field of characteristic zero, H*_m a quasi-split symplectic, special orthogonal or unitary group over F (unitary for E/F), and H_m a pure inner form. On restriction to the Weil–Deligne group of E put φ_i^*=φ_i^{c∨} in the unitary case, with c the nontrivial automorphism of E/F, and φ_i^*=φ_i^∨ otherwise. A relevant local L-parameter φ of H*_m is written up to conjugacy as (φ₁|·|^{β₁}⊕φ₁^*|·|^{−β₁})⊕⋯⊕(φ_t|·|^{β_t}⊕φ_t^*|·|^{−β_t})⊕φ₀ with β₁>⋯>β_t>0, where φ_i is a tempered parameter of a general linear group G_{E/F}(n_i) and φ₀ a tempered parameter of H*_{n₀}. Given the tempered packet Π_{φ₀}(H_{n₀}) and the unitary generic tempered τ(φ_i) attached to φ_i, the packet Π_φ(H_m) is the set of Langlands quotients of the standard modules Ind_P^{H_m}(τ(φ₁)|det|^{β₁}⊗⋯⊗τ(φ_t)|det|^{β_t}⊗σ₀), σ₀∈Π_{φ₀}(H_{n₀}), P the standard parabolic with Levi ∏G_{E/F}(n_i)×H_{n₀}. This packet construction applies to general relevant φ. The parameter is generic when Π_φ(H*_m) contains a generic member. For generic φ, choose such a member σ°; the local L- and ε-factors of every σ∈Π_φ(H_m) are then defined through σ°. The star convention interprets the dual shorthand in [JZ20] (B.1) compatibly with τ*=ι(τ)∨ in §5.1.

*Standing hypotheses:* the tempered packets and the general-linear correspondence are given data with three properties: members of tempered packets are irreducible and tempered; the quasi-split tempered packet of a generic parameter has a generic member; and the Langlands–Shahidi factors of that member equal the Artin factors of the parameter.

Prove the following API statements.
- `mem_iff`: σ∈Π_φ(H_m) iff σ is the Langlands quotient of one of the displayed standard modules (Langlands classification: SmoothRepresentationsOfLocalGroups Layer 3, and §0.48 (real reductive representation foundations), real Langlands classification for archimedean F).
- `tempered`: for t=0, Π_φ(H_m)=Π_{φ₀}(H_m).
- `local_factor`: For generic φ and a chosen quasi-split generic member σ°, L(s,τ×σ)=L(s,τ×σ°) and ε(s,τ×σ,ψ)=ε(s,τ×σ°,ψ) for every member σ.

**Checks.**
- with t=0 the packet is the whole tempered packet, not only its generic member.
- for H*_1=SL₂=Sp₂, φ=|·|^β⊕|·|^{−β}⊕1 with 0<β<1/2, the packet is the irreducible complementary series Ind(|·|^β), which equals its Langlands quotient.
- for SL₂ and φ=|·|⊕1⊕|·|^{−1}, the standard module Ind(|·|) is reducible, its Langlands quotient is the trivial representation, and φ is not generic; no definition through σ° applies.
- for E/F=ℂ/ℝ and θ(z)=z/|z|, θ^{c∨}=θ≠θ^∨. For β>0, θ|·|^β⊕θ|·|^{−β} is conjugate-self-dual, whereas θ|·|^β⊕θ⁻¹|·|^{−β} is not.

([JZ20], Appendix B (B.1)–(B.2), pp.84–85; the generic member, proof of Theorem B.2, p.86, citing Arthur's and Mok's endoscopic classifications.)

*Needs:* SmoothRepresentationsOfLocalGroups Layer 2; SmoothRepresentationsOfLocalGroups Layer 3; §0.48 (real reductive representation foundations), real Langlands classification; §2.1.


### 2.8 Classical-group Shahidi normalization

Define `shahidi_normalization` as follows. For special orthogonal or unitary H_{a+m} and H_m, with Levi G_{E/F}(a)×H_m, τ unitary generic self-dual and σ in a relevant generic local packet (§2.7), define β_v(s)=L_v(1+s,τ×σ)L_v(1+2s,τ,ρ)ε_v(s,τ×σ,ψ)ε_v(2s,τ,ρ,ψ)/(L_v(s,τ×σ)L_v(2s,τ,ρ)) and N_v(s)=β_v(s)M_v(s). Here ρ=∧² for even orthogonal, Sym² for odd orthogonal, and Asai⊗ξ^m for unitary groups. The dual target is τ*=ι(τ)∨ with |det|^(−s). Evaluate the local L/ε factors using ArithmeticGaloisRepresentations §§2.4–2.7 on the tensor and displayed exterior-square, symmetric-square or Asai representations of the supplied compatible L-parameter, with the dual/L-group data of ReductiveGroupsPartII RG2.5 and the specified additive character. Multiply the factors in precisely this orientation; construct their global meromorphic product comparison here.

*Standing hypotheses:* characteristic-zero local field; special orthogonal or unitary groups of [JZ20] §5.1; relevant classical-group packet with generic parameter; specified ψ and compatible measures; self-dual is conjugate-self-dual in the unitary case.

Prove the following API statements.
- `normalized_eq`: N_v=β_v M_v with β_v equal to the displayed L/ε ratio.
- `target`: N_v maps I(τ|det|^s⊗σ) to I(τ*|det|^(−s)⊗σ).
- `global_product`: On factorizable data the global scalar ratio uses L(s,τ×σ)L(2s,τ,ρ) divided by the shifted L-factors and ε-factors, as in (5.2)–(5.4).

**Checks.**
- For unramified SO₃ with Levi GL₁×SO₁, trivial τ, residue size 2, hyperspecial root Haar measures, conductor-zero ψ and s=1/2, the raw spherical scalar is (1−2⁻²)/(1−2⁻¹)=3/2 and β=2/3, so N fixes the spherical vector.
- For the unramified tempered self-dual two-dimensional parameter (i,−i), the exterior-square weight is 1 and the symmetric-square weights are −1,1,−1. Their L-factors, hence their normalizers at a regular parameter, differ.
- For E/F=ℂ/ℝ and τ(z)=z/|z|, τ*=τ, whereas τ^∨=τ⁻¹≠τ; the target uses the inverse-conjugate character in this conjugate-self-dual unitary example.

([JZ20], §5.1, (5.3)–(5.4), p.48.)

*Needs:* §2.1; §2.7; ArithmeticGaloisRepresentations §§2.4–2.7 (local factors and constants of the supplied compatible parameter); ReductiveGroupsPartII RG2.5 (dual groups and L-groups).


### 2.9 Irreducibility of generic packet standard modules

Prove `generic_standard_module`. For the relevant generic local parameter φ⁺ of a generic global Arthur parameter, each σ in Π_φ⁺(H_m) is the irreducible standard module induced from tempered unitary τ(φ_i)|det|^β_i and σ₀, with 1/2>β₁>⋯>β_t>0. The unitary generic self-dual τ has a symmetric standard-module realization with tempered unitary pieces and exponents 1/2>α₁>⋯>α_d>0. These bounds and irreducibility are retained for every pure inner form occurring in the theorem.

*Standing hypotheses:* φ⁺ is a local component of an H_m-relevant generic global Arthur parameter, not an arbitrary generic nonunitary parameter.

([JZ20], Appendix B Proposition B.1, p.85; (B.5)–(B.6), p.86.)

*Needs:* §2.7; SmoothRepresentationsOfLocalGroups Layer 3; §0.48 (real reductive representation foundations).


### 2.10 Tempered GL intertwiner half-plane

Prove `tempered_gl_intertwiner`. For unitary tempered τ,τ′ on general linear groups, the Mœglin–Waldspurger normalized rank-one GL×GL intertwiner is holomorphic and nonzero on Re s>−1. This is a statement about the source’s rank-one parameter convention, transported unchanged to (B.7)–(B.8); it is not a claim that every normalization of a reducible induced GL representation is invertible everywhere in that half-plane.

*Standing hypotheses:* tempered unitary GL data and the MW normalization; the conclusion is nonzero, not necessarily invertible at a reducibility point.

([JZ20], Appendix B (B.7)–(B.9), pp.86–87, citing [66].)

*Needs:* §2.3; SmoothRepresentationsOfLocalGroups Layer 3.


### 2.11 Tempered classical standard integral half-plane

Prove `tempered_standard_intertwiner`. For unitary tempered GL data τ and a tempered classical packet member σ₀, the raw rank-one standard operator M(w,τ⊗σ₀,s) is holomorphic and nonzero for Re s>0. The normalizing L-factors equal those of the generic tempered member σ₀° and are holomorphic and nonzero there, so the source’s normalized operator has the same property. This is the positive-open-half-plane input, before shifting by |α|<1/2.

*Standing hypotheses:* H_m and H_{a+m} are special orthogonal or unitary, with ρ as in §2.8; σ₀ is in the tempered packet of the generic parameter used in Appendix B; characteristic-zero local field.

([JZ20], Appendix B p.87.)

*Needs:* §2.7; §2.8; §0.48 (real reductive representation foundations); SmoothRepresentationsOfLocalGroups Layer 3.


### 2.12 Generic classical normalized intertwiner bound

Prove `generic_normalized_intertwiner`. For a generic unitary member of the relevant classical packet and unitary generic GL inducing data, the Shahidi normalized rank-one operator is holomorphic and nonzero for Re s≥1/2, with the source’s parameter and ρ convention. The general theorem reduces the nongeneric members to this input plus the tempered shifted factors.

*Standing hypotheses:* H_m and H_{a+m} are special orthogonal or unitary, with ρ as in §2.8; generic member of a relevant generic unitary packet; normalization is (5.4).

([JZ20], Appendix B proof of Theorem B.2, p.86, citing Cogdell–Kim–Piatetski-Shapiro–Shahidi, Publ. Math. IHÉS 99 (2004), Theorem 11.1.)

*Needs:* §2.7; §2.8.


### 2.13 Jiang–Zhang intertwiner holomorphy

Prove `jiang_zhang_holomorphy`. Let φ⁺ be the local component of an H_m-relevant generic global Arthur parameter. If τ is irreducible admissible unitary generic self-dual on G_{E/F}(a)(k) and σ∈Π_φ⁺(H_m), then N(w₀,τ⊗σ,s) with (5.4) normalization is holomorphic and nonzero for Re s≥1/2. This includes nongeneric members of pure inner forms; it does not include arbitrary local Arthur parameters or nonunitary τ.

*Standing hypotheses:* H_m and H_{a+m} are special orthogonal or unitary, with ρ as in §2.8; all hypotheses are those of Appendix B Theorem B.2; the local factors use the same packet and ψ.

([JZ20], Appendix B Theorem B.2, p.85; proof pp.86–87; §5.1 Theorem 5.1.)

*Needs:* §2.9; §2.10; §2.11; §2.12.


### 2.14 GLₙ isobaric automorphic sums

Use `isobaric_sum` as the adapter to AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, [GLₙ isobaric sums](../AutomorphicLFunctionsAndLocalFactors/README.md#isobaric-construction). For cuspidal automorphic representations π_i of GL_{n_i}(𝔸_F), with specified real/unitary twists and Σn_i=n, consume the supplied Langlands quotient ⊞_iπ_i of normalized parabolic induction in its prescribed order. Prove its automorphic realization with those cuspidal Langlands data and its comparison with the continued induction of §2.4. Its unramified Satake multiset is the union of the summands’ multisets; compare its standard L-function with the product of their standard L-functions using AL.2's standard-factor API. Over number fields, uniqueness from almost-all Satake data consumes AL.3 [Strong multiplicity one for isobaric sums](../AutomorphicLFunctionsAndLocalFactors/README.md#isobaric-strong-multiplicity-one). The convention-Y specialization transports the supplied Langlands sum and Satake product to the half-modulus Hecke convention of §1.12. The symbol does not mean a Hilbert direct sum of representations of different groups.

*Standing hypotheses:* cuspidal GL_{n_i} data and their twists; compatible Langlands order; strong multiplicity one is required for uniqueness from almost-all Satake parameters.

Prove the following API statements.
- `satake_union`: At a place where all summands are unramified, the Satake eigenvalues concatenate.
- `standard_L_product`: L(s,⊞π_i)=∏_i L(s,π_i) with the summand twists retained.
- `permutation`: Permuting summands with the corresponding Langlands ordering gives the same isobaric representation.

**Checks.**
- The isobaric sum of a single cusp π is π.
- For unramified characters χ₁,χ₂ the GL₂ Satake polynomial is (1−χ₁(ϖ)T)(1−χ₂(ϖ)T).
- π₁⊕π₂ is not the isobaric GL_{n₁+n₂} representation: it does not even carry the same group action.

([ACC+23], §1.2, local-sum convention p.907 and adelic isobaric-sum convention p.908; the supplied construction, standard factors and uniqueness are sourced in AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, AL.2 and AL.3.)

*Needs:* AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, [GLₙ isobaric sums](../AutomorphicLFunctionsAndLocalFactors/README.md#isobaric-construction), AL.3 [Strong multiplicity one for isobaric sums](../AutomorphicLFunctionsAndLocalFactors/README.md#isobaric-strong-multiplicity-one) for number-field Satake uniqueness, and AL.2 [The standard local L-factor](../AutomorphicLFunctionsAndLocalFactors/README.md#standard-local-l-factor) for the standard-factor product comparison; §§1.1–1.5 and 2.4 for automorphic realization and continued induction; §1.12 for convention Y; SmoothRepresentationsOfLocalGroups SR.2–SR.4.


### 2.15 Intertwiners and operator-valued families

Define `operator_intertwiner_family` as follows. Construct M_(R'|R)(w,lambda) by the convergent unipotent integral and meromorphic continuation on induced sections. It satisfies the composition and unitary-axis identities. Ratios M_R(lambda,P;mu)=M_(R|P)(lambda)^−1 M_(R|P)(lambda/mu) give the operator-valued (G,M)-family on its regular domain.

Prove the following API statements.
- `integralIntertwiner`: define on the domain of absolute convergence
- `continueOperator`: prove meromorphic continuation and functional equations
- `ratioFamily`: form the regular operator family on the unitary domain

**Checks.**
- At a regular parameter the same-parabolic operator M_(R|R) is the identity.
- The ratio family built from the inverse regular intertwiner and operator_intertwiner_family at λ/μ gives the identity at μ=1.
- Composing two regular intertwiners gives the operator for the composed Weyl transport, with its parameter transported as in the cocycle law.

([Yu22], §§5.2.2–5.2.3, pp.32–35.)

*Needs:* §6.27; §1.12; §1.10b (function-field Eisenstein and intertwiner theory).


### 2.16 Scalar intertwiners on spherical sections

Prove `spherical_scalar_intertwiner`. Let (P,π) be a good everywhere-unramified discrete pair, M=M_P, fix nonzero spherical φ_Π for each discrete Π and φ_π their tensor product, and for R in P(M) let φ_R(nmk)=ρ_R(m)φ_π(m) with ρ_R=δ_R^{1/2}. For S,R in P(M): M_{R|S}(λ)φ_S=n_{R|S}(π,λ)φ_R with n_{R|S}(π,λ)=∏_{β in Φ(Z_M,G), β in Φ_S ∩ Φ_{R̄}} n_β(π,λ^{−β^∨}) (equivalently ∏_{α in Φ_R ∩ Φ_S̄} n_{−α}(π,λ^{α^∨})), n_β as constructed in §4.15d ([Yu22], (5.1.1)); for L ⊇ M and Q,Q' in P(L) group the factors over β restricting to α in Φ(Z_L,G). In particular M(w,λ)φ_P=n_π(w,λ)φ_P for (w,1) in stab(P,π). The factor q^{(1−g)n_in_j} comes from vol(N(F)\N(A))=1 versus local vol(N(O_v))=1 (vol(F\A)=q^{g−1} for the product measure). Prove the local Gindikin–Karpelevich factors, the restricted Euler product and the global Haar factor separately.

([Yu22], Proposition 5.3.4, p.39.)

*Needs:* §1.10b; §1.12; §2.15; §4.15d (residual normalizing scalar); AutomorphicLFunctionsAndLocalFactors AL.3 (cuspidal pair factors); SmoothRepresentationsOfLocalGroups Layer 4.


### 2.17 Eisenstein Fourier expansion

Prove `completed_eisenstein_fourier`. E*(z,s)=Λ(2s)y^s+Λ(2−2s)y^(1−s)+2√y Σ_{n≠0}|n|^(s−1/2)σ_{1−2s}(|n|)K_{s−1/2}(2π|n|y)e(nx). Prove local convergence and parameter continuation of the expansion.

([DIT16], §5, (5.3), p.962.)

*Needs:* §1.15; §2.4.


### 2.18 Eisenstein continuation and residues

Prove `completed_eisenstein_continuation`. E*(z,s) extends meromorphically with only simple poles at s=0,1, residues −1/2,+1/2, and E*(z,s)=E*(z,1−s). Do not infer this function-valued statement from scalar ζ continuation alone.

([DIT16], §5, text before (5.4), (5.4) and (5.5), p.962.)

*Needs:* §1.15; §2.4.


### 2.19 Weight-zero resolvent kernel

Define `resolvent_kernel` as follows. Construct the kernel G(z,z′;s) of (Δ_N−s(1−s))⁻¹ for the self-adjoint level-N realization of §1.16a on L²(Γ₀(N)/{±I}\ℍ), N≥1, off spectrum, and its continued kernel. The displayed full-modular Fourier formulas use N=1; at other levels retain all cusp channels and their scattering matrix. Bounded-inverse analyticity applies only at genuine spectral gaps. At s₀=1/2+ir, r>0, a cuspidal eigenvalue is embedded in continuous spectrum: the finite-rank subtraction in (8.4) requires meromorphic continuation in weighted/test spaces, not operator-norm holomorphy on full L².

Prove the following API statements.
- `inverseEquation`: (Δ−s(1−s))R_s=1 on its domain, assuming membership in the bounded-inverse resolvent set; algebraic bijectivity alone is insufficient.
- `kernelSymmetry`: The self-adjoint resolvent kernel obeys R_s(z,z′)=conj(R_conj(s)(z′,z)), with conjugation of the parameter as well as exchange of the spatial variables.
- `restrictedResolvent`: For the closed reducing complement C and its partial Laplacian Δ_C, require s₀(1−s₀) in its bounded-inverse resolvent set; the complement inverse is then holomorphic near s₀. `operatorAdjoint` specializes SA-D20 to R_s*=R_conj(s), requiring both shifts off spectrum; a spatial kernel requires its own realization.

**Checks.**
- On the constant eigenline, the scalar Laplacian resolvent is −1/[s(1−s)] off its poles.
- At the parameter 1/2+it for the scalar Laplacian eigenvalue 1/4+t², its defining inverse equation has no solution for every right-hand side; a bounded inverse cannot be used there.
- The scalar resolvent on the eigenline of eigenvalue 1/4 is (s−1/2)^(−2), so the parameter pole is double at the threshold.

([DIT16], §8 (8.2)–(8.4), pp.973–974, citing Fay [20, Theorem 3.1, p.173] and Hejhal [27].)

*Needs:* §1.16a; §0.6; §0.15; §4.8; SelfAdjointSpectralTheory SA-D20; Tau Ceti `TauCeti.LinearPMap.resolvent`, `TauCeti.LinearPMap.IsResolventAt`, `TauCeti.LinearPMap.analyticAt_resolvent`.


### 2.20 Finite-rank resolvent polar part

Prove `resolvent_polar_part`. Let s₀=1/2+ir with r>0, and let {u} be an orthonormal basis of the Δ-eigenspace with eigenvalue 1/4+r². With the convention (8.2), (Δ−s(1−s))∫_F G(z,z′;s)u(z)dμ(z)=u(z′), the polar part of G at s₀ is (1/4+r²−s(1−s))⁻¹ Σ_u conj(u(z)) u(z′), as in (8.4). Since 1/4+r²−s(1−s)=(s−s₀)(2s₀−1)+O((s−s₀)²), Res_{s₀}(2s−1)G(z,z′;s)=Σ_u conj(u(z))u(z′).

([DIT16], §8, (8.4), p.974.)

*Needs:* §0.6; §0.15; §4.8; §2.19.


### 2.21 Poincaré residue theorem

Prove `poincare_residue`. For m≠0, F_m extends meromorphically to Re(s)>0 and Res_{s=1/2+ir}[(2s−1)F_m(z,s)]=Σ_φ2a(m)||φ||⁻²φ(z), with the real Hecke normalization a(m); equivalently the residue of (2s−1)F_{−m} uses 2a(−m). The eigenspace sum contains all Hecke eigenforms at λ. The displayed simple-pole formula assumes r>0; the threshold r=0 has a quadratic parameter denominator.

([DIT16], Proposition 3, pp.973–974.)

*Needs:* §0.6; §0.15; §4.8; §2.19; §1.18; §2.23.


### 2.22 Bessel coefficient residue

Prove `bessel_coefficient_residue`. Let m,n≠0. Then Φ(m,n;s) continues meromorphically to Re(s)>0, and Res_{s=1/2+ir}(2s−1)Φ(−m,n;s)=2Σ_φ⟨φ,φ⟩⁻¹a(−m)a(n)=2Σ_φ⟨φ,φ⟩⁻¹a(−1)a(m)a(n). The sum runs over all Hecke–Maass cusp forms φ with eigenvalue 1/4+r², and the a(n) are real. The paper prints a(m)a(n), which is correct only for the even φ (retain the parity factor for odd forms). Assume r>0 for the simple-pole parameter residue; arbitrary complex orthonormal bases require conjugation in the polar projector.

([DIT16], §8, pp.974–975.)

*Needs:* §0.6; §0.15; §4.8; §2.19; §1.17; §2.21.


### 2.23 Fourier expansion of the weight-0 resolvent kernel (Fay Thm 3.1, cited)

Prove `resolvent_kernel_fourier`. Let Re(s)>1 and let y′>max_{γ∈Γ}Im(γz), which holds for example when z lies in the standard fundamental domain and y′>y. Then G(z,z′;s)=(2s−1)⁻¹y′^{1−s}E(z,s)+√y′Σ_{m≠0}F_{−m}(z,s)K_{s−1/2}(2π|m|y′)e(mx′).

([DIT16], (8.3), p.973, citing Fay [20, Thm 3.1, p.173].)

*Needs:* §0.6; §0.15; §4.8; §2.19.


### 2.24 Meromorphic continuation of G_{N,s}; residue κ_N (2.13)

Prove `green_kernel_continuation`. G_{N,s}(z, z′) extends meromorphically in s to a neighbourhood of s = 1 with a simple pole at s = 1 of residue κ_N = −12/[SL₂(ℤ) : Γ₀(N)] = −12 N⁻¹ ∏_{p|N} (1 + 1/p)⁻¹, independent of z, z′. Consequently lim_{s→1}[G_{N,s} − κ_N/(s−1)] is not harmonic: its Laplacian is κ_N ≠ 0. The automorphic kernel is G_{N,s}(z,z′)=Σ_{γ∈Γ₀(N)/{±I}}−2Q_{s−1}(1+|z−γz′|²/(2y Im(γz′))), initially Re(s)>1 and z outside the Γ-orbit of z′. The comparison G_{N,s}=−4πR_{N,s} with the level-N resolvent gives residue −4π/vol(Γ₀(N)/{±I}\ℍ)=κ_N. Its finite part at s=1 has Δ_GZ equal to κ_N and is not harmonic; the cusp-corrected arithmetic Green function is not constructed here.

([GZ86], Chapter II, §2, (2.13), p. 239.)

*Needs:* §1.16a; §0.35; §2.19; §0.37; §2.25.


### 2.25 Level-N automorphic Green kernel

Define `automorphic_green` as follows. For N≥1 and z,z′∈𝔥 off the Γ₀(N)-orbit diagonal, construct G_{N,s}(z,z′), initially Σ_{γ∈Γ₀(N)/{±I}}g_s(z,γz′) for Re(s)>1, with its meromorphic continuation near s=1 supplied by §2.24. Here g_s=−2Q_{s−1}(1+|z−z′|²/(2yy′)); Γ is interpreted as the effective projective action, with each ±I pair counted once. It is Γ-invariant in each variable, symmetric in z,z′ and satisfies Δ_GZ G=s(s−1)G away from its diagonal. With convention D and hyperbolic measure, this is the scaled analytic resolvent kernel G_{N,s}=−4πR_{N,s}, where R_{N,s} is the kernel of (Δ_N−s(1−s))⁻¹. Distributionally (Δ_N−s(1−s))G_{N,s}=−4πδ; arithmetic cusp corrections are outside this construction.

*Standing hypotheses:* N≥1; the two points are outside the orbit diagonal; the effective projective-group sum and hyperbolic measure dxdy/y² are fixed. For the initial sum Re(s)>1; continuation uses the Hejhal continuation theorem cited in [GZ86, II §2, p.239] and the spectral/resolvent inputs.

Prove the following API statements.
- `initial_sum`: For Re(s)>1 off the orbit diagonal G_{N,s}=Σ_{Γ₀(N)/±I}g_s(z,γz′), absolutely and locally uniformly.
- `symmetry`: G_{N,s}(z,z′)=G_{N,s}(z′,z); invariance holds in both variables with the effective-group convention.
- `eigenfunction`: Away from the orbit diagonal Δ_GZ,z G_{N,s}=Δ_GZ,z′ G_{N,s}=s(s−1)G_{N,s}.

**Checks.**
- At N=1 the s=1 residue is −12, with hyperbolic quotient volume π/3.
- For the identity summand g_s(z,z′)=g_s(z′,z), since the point-pair invariant is symmetric.
- For N=1, subtracting −12/(s−1) leaves a Green finite part with Δ_GZ value −12 off the modular orbit.

([GZ86], Chapter II, §2, (2.10)–(2.13), p.239.)

*Needs:* §0.35; §0.36; §0.37; §0.6; §1.14; §1.16; Mathlib `CongruenceSubgroup.Gamma0`.


### Examples

For unramified GL₂ at q=2,z=−1, the raw spherical factor is (1−q⁻¹z)/(1−z)=3/4, so it is not unitary. Multiplying both opposite Haar measures by two multiplies μ⁻¹ by four. The ordered residue of v/(z₁z₂) is v, while 1/z² has pole but zero residue. At the modular threshold λ=1/4 the resolvent denominator is (s−1/2)²; it has a double parameter pole and is excluded from the r>0 simple-residue formula. For N=1 the Green residue is −12, and its pole-subtracted finite part has Δ_GZ equal to −12 off the orbit.

### Dependencies

The main continuation uses the convergent pseudo-Eisenstein inner product and elementary cuspidal-data orthosum, locally convex regularization, the analytic Fredholm interface and local representation theory. Packet normalization takes compatible tempered packets as data. GLₙ scalar L/epsilon factors use AutomorphicLFunctionsAndLocalFactors AL.1–AL.3; classical-group local parameter factors use ArithmeticGaloisRepresentations §§2.4–2.7 and ReductiveGroupsPartII RG2.5 under §2.8's compatibility hypothesis. The residual function-field normalizing scalars are constructed in §4.15d from the supplied AL.3 cuspidal pair factors. The modular resolvent branch uses the completed Fourier expansion, the modular spectral theorem in Layer 4 and genuine bounded-inverse or weighted-space continuation hypotheses. The initial effective-group Green sum precedes its continued residue assertion.

## Layer 3: Truncation, Maass–Selberg relations and wave packets

### 3.1 Parabolic truncation cones and denominators

Define `truncation_cones` as follows. For P⊂Q use the relative simple roots Δ_P^Q and their dual fundamental weights Δ̂_P^Q on 𝔞_P^Q. τ_P^Q(H) is the indicator that every α(H)>0; τ̂_P^Q(H) is the indicator that every ϖ(H)>0. Set θ_P^Q(ν)=vol(𝔞_P^Q/ℤ(Δ_P^Q)∨)⁻¹∏_{α∈Δ_P^Q}ν(α∨), using the fixed Lebesgue measure. These root and dual-weight cones are different. Their alternating incidence sums satisfy the Langlands combinatorial cancellation identities. Cone boundaries use strict positivity; the constant-term support complement therefore uses ≤0.

*Standing hypotheses:* a compatible relative root datum and dual Lebesgue measures are fixed; rank-zero products and cone indicators are 1.

Prove the following API statements.
- `rank_zero`: For P=Q, τ=τ̂=θ=1.
- `alternating_sum`: Compatible root/dual-weight cones satisfy incidence cancellation, with rank-zero value 1 and the subset signs of Identity 6.2; singleton weights fail.
- `theta_homogeneous`: θ_P^Q(tν)=t^dim(𝔞_P^Q)θ_P^Q(ν).

**Checks.**
- For one coroot α∨, θ(ν)=ν(α∨)/vol(𝔞/ℤα∨).
- At α(H)=0 the strict root-cone indicator is 0.
- The A₂ simple-root cutoff is zero at root coordinates (−1,3), while the cutoff for the two inverse-Cartan fundamental weights is one.

([Art05], §6 Identity 6.2, (6.3), p.31; §13 proof, p.69; §15 denominator (15.7), p.84.)

*Needs:* ReductiveGroups Layer 7 (parabolics and relative roots); AdelicAlgebraicGroups §3.1 for number-field height spaces; §1.10a for convention Y.


### 3.2 Arthur truncation operator

Define `arthur_truncation` as follows. For sufficiently regular T∈𝔞₀⁺ define Λᵀf(g)=Σ_{P⊃P₀}(−1)^dim(𝔞_P^G)Σ_{δ∈P(F)\G(F)}f_P(δg)τ̂_P(H_P(δg)−T), where f_P=∫_{N_P(F)\N_P(𝔸)}f(ng)dn. For locally bounded measurable automorphic f, the inner sum is finite at each g and locally finite on compact g-sets. T is projected to each 𝔞_P. This function truncation is distinct from diagonal kernel truncation kᵀ, although they give the same integrated distribution for sufficiently regular T relative to test-function support.

*Standing hypotheses:* number field; compatible measures with vol[N_P]=1; regularity of T is a reduction-theoretic threshold.

Prove the following API statements.
- `cusp_fixed`: If every proper constant term of f vanishes, Λᵀf=f.
- `linear`: Λᵀ is complex linear on its domain.
- `local_finite`: On each compact g-set only finitely many rational cosets can contribute for fixed regular T.

**Checks.**
- A cuspidal automorphic form is unchanged, not annihilated, by Λᵀ.
- The one-cusp strip model at T=log Y truncates one to 1_(y≤Y); identifying it globally uses the large-Y reduction theorem.
- When G has no proper rational parabolic, Λᵀ=id.

([Art05], §13, (13.1), p.68.)

*Needs:* §3.1; ArithmeticLocallySymmetricSpaces ALS.F.6 (constant terms); AdelicAlgebraicGroups §§3.4, 3.6 (Siegel finiteness).


### 3.3 Self-adjoint projection and constant-term support

Prove `truncation_projection`. For sufficiently regular T, the P-constant term of Λᵀf vanishes unless every ϖ(H_P(g)−T)≤0. Moreover ΛᵀΛᵀ=Λᵀ. For locally bounded f and compactly supported continuous h, ⟪Λᵀf,h⟫=⟪f,Λᵀh⟫ whenever the displayed pairings are defined. It extends as an orthogonal projection on L². The support inequality is non-strict, correcting the strict inequality printed in [Art80], Lemma 1.1.

*Standing hypotheses:* regular T and genuine rational constant terms; initial self-adjointness uses one compactly supported factor.

([Art05], §13 Proposition 13.1(a)–(c) and correction, pp.68–69.)

*Needs:* §3.2; §3.1; `MeasureTheory.integral_prod`.


### 3.4 Rapid decay of truncated uniform-moderate families

Prove `truncation_rapid_decay`. If f is smooth of uniform moderate growth (one height exponent N₀ works for all archimedean derivatives, with derivative-dependent constants), Λᵀf is rapidly decreasing on every Siegel set for regular T. Quantitatively, for each desired decay exponent N, input N₀ and finite level K₀, there are finitely many differential operators X_i and a differentiability order r such that sup_{x∈S}‖x‖^N∫_Ω|Λᵀf_ω(x)|dω is bounded by a fixed constant times sup_y‖y‖^(−N₀)Σ_i∫_Ω|X_i f_ω(y)|dω. Thus a regular unitary Eisenstein series truncates to L², and dominated parameter families can be integrated after truncation.

*Standing hypotheses:* the quantitative bound is for fixed T/S/N/N₀/K₀; input is C^r and measurable in ω; right side finite.

([Art05], §13 Proposition 13.2(a)–(b), (13.5)–(13.6), p.71.)

*Needs:* §3.3; §1.3; §2.4; AdelicAlgebraicGroups §§3.5–3.6 (height estimates on Siegel sets).


### 3.5 Exact cuspidal Maass–Selberg relations

Prove `cuspidal_maass_selberg`. For cuspidal φ∈H_P⁰ and φ′∈H_R⁰ and regular T, the truncated Gram pairing ⟪ΛᵀE_R(φ′,λ′),ΛᵀE_P(φ,λ)⟫ equals ωᵀ(λ,λ′;φ,φ′)=Σ_QΣ_{w∈W(𝔞_P,𝔞_Q)}Σ_{w′∈W(𝔞_R,𝔞_Q)}exp((wλ+overline(w′λ′))(T_Q))⟪M(w′,λ′)φ′,M(w,λ)φ⟫/θ_Q^G(wλ+overline(w′λ′)). Initially take generic regular parameters; at a denominator zero take the holomorphic limit of the whole finite sum. The sum is zero for nonassociate P,R. Exact equality here requires cuspidal inducing data.

*Standing hypotheses:* the Gram vectors and ωᵀ come from the same cuspidal inducing data; regular T; meromorphic continuation; generic parameters first; conjugate-first Gram convention.

([Art82], Introduction (1), pp.35–36; §9 ωᵀ formula, pp.68–69.)

*Needs:* §3.4; §3.1; §1.5; §2.4.


### 3.6 Discrete-data Maass–Selberg asymptotics

Prove `discrete_maass_selberg_asymptotic`. For fixed cuspidal support χ and finite K-type set Γ, arbitrary discrete inducing vectors φ∈H_P,χ,Γ⁰ and φ′∈H_R,χ,Γ⁰ on the imaginary axes satisfy |⟪ΛᵀE_R(φ′,λ′),ΛᵀE_P(φ,λ)⟫−ωᵀ(λ,λ′;φ,φ′)|≤ρ(λ,λ′)‖φ‖‖φ′‖exp(−ε‖T‖). For each fixed δ>0 and sufficiently large N, this holds when every α(T)>δ‖T‖>N; ε>0 and ρ is locally bounded on i𝔞_P*×i𝔞_R*. The ωᵀ finite sum has the preceding operator form, but equality for general discrete data is replaced by this error estimate.

*Standing hypotheses:* number field; fixed χ,Γ; T away from all walls; locally bounded ρ. Unrelated constant error 1 with φ=φ′=0 violates the estimate.

([Art82], §9 Theorem 9.1, Q=G, printed p.69.)

*Needs:* §3.5; §2.6.


### 3.6a Rankin–Selberg vertical-strip bounds

<a id="rs-vertical-strip-bounds"></a>

**Rankin–Selberg vertical-strip bounds.** The completed Λ(s,π×π′) for unitary cuspidal inputs is bounded on finite vertical strips away from its polar points. For m=n or n−1, finite K-finite test realization reduces this to the global-integral bounds. For arbitrary rank gaps prove the GL_(n+m), Levi GL_n×GL_m specialization of Gelbart–Shahidi Theorem 4.1 from the normalized-intertwiner target. Establish its finite-order and Whittaker-coefficient bounds, using the continued Eisenstein and truncated-inner-product contracts of §§2.4, 3.1–3.6, then the scalar complex-analysis argument of §§5–6. Identify its local normalizing factors with the AutomorphicLFunctionsAndLocalFactors AL.3 integral factors before applying it to Λ. Clear the finitely many poles with a polynomial and apply the completed functional equation and archimedean gamma estimates; retain excluded neighborhoods of polar points.

Work under the following hypotheses. K is a number field; the function-field statements are established in AutomorphicLFunctionsAndLocalFactors AL.3's curve-cohomological targets. This is a completed-function bound, not a uniform boundedness assertion for the finite Dirichlet series with gamma factors removed.

(Source: [Cog04], Lecture9 §5, pp.72–73; Gelbart–Shahidi [GS01], §4, Theorem 4.1 and Corollary 4.2, pp.87–88, §§5–6, pp.91–104.)

**Checks.** A GL₁ trivial self-pair gives the completed Dedekind zeta function with poles at 0 and 1, so polar neighborhoods are excluded; a cuspidal pair of different ranks has no pole and is bounded on the whole strip; the statement controls the completed factor, while removing gamma factors can leave polynomial growth.

*Needs:* [GLₙ normalized intertwining estimates](#gln-normalized-intertwining); §§2.4 and 3.1–3.6; [Rankin–Selberg local integrals](../AutomorphicLFunctionsAndLocalFactors/README.md#rs-local-integrals); [Archimedean realization of holomorphic multiples](../AutomorphicLFunctionsAndLocalFactors/README.md#rs-archimedean-realization); [Global Rankin–Selberg unfolding](../AutomorphicLFunctionsAndLocalFactors/README.md#global-rs-unfolding); **ArithmeticLocallySymmetricSpaces**, ALS.F.6, *automorphic-forms* (unitary central character and rapid decay); [Archimedean Whittaker comparisons](../AutomorphicLFunctionsAndLocalFactors/README.md#archimedean-smooth-representations); [Archimedean GLₙ parameters](../AutomorphicLFunctionsAndLocalFactors/README.md#archimedean-gln-parameters).


### 3.6b Growth of the centered entire standard completion

<a id="standard-order-one"></a>

**Growth of the centered entire standard completion.** For unitary cuspidal π over a number field whose standard completion is entire, its conductor-balanced centered function φ(z)=Λ(1/2+z,π) is an entire function of order at most1: for every ε>0, |φ(z)|≤exp(C_ε(1+|z|)^(1+ε)). Over a function field an entire standard L-function is a polynomial in q^(−s) times a real exponential, hence has order at most1.

Work under the following hypotheses. The rank-one norm/degree characters with poles are excluded by the explicit entirety hypothesis.

(Source: [YZ17], TheoremB.2 proof p.904; RemarkB.4 p.905.)

**Checks.**

- An entire standard completion of a nontrivial unitary GL₁ Hecke character satisfies the bound without a pole-clearing factor.
- A function-field polynomial P(q^(−s)) times a real exponential has growth at most exp(C(1+|s|)); centering preserves this bound.
- The trivial number-field GL₁ character has poles at 0 and 1 and fails the entirety hypothesis.

*Needs:* [The global standard L-function](../AutomorphicLFunctionsAndLocalFactors/README.md#global-godement-jacquet); [Rankin–Selberg vertical-strip bounds](#rs-vertical-strip-bounds); AutomorphicLFunctionsAndLocalFactors AL.3 [unramified pure realization](../AutomorphicLFunctionsAndLocalFactors/README.md#curve-arithmetic-and-the-unramified-pure-realization).


### 3.6c Super-positivity of the standard completion

<a id="standard-superpositivity"></a>

**Super-positivity of the standard completion.** Let π be unitary, self-dual and cuspidal, with entire completed standard L-function. Under RH in the number-field case, every derivative of the real conductor-balanced Λ at1/2 is nonnegative. If centered Λ is non-polynomial, a nonzero derivative of order r forces every derivative of order r+2j to be positive. A constant centered function has positive zeroth derivative and zero higher derivatives.

Work under the following hypotheses. Use the unitary normalization, global root number±1, order≤1, and positivity sufficiently far right. For the function-field specialization use AutomorphicLFunctionsAndLocalFactors AL.3’s pure realization and tensor cohomological determinant theorem.

(Source: [YZ17], Appendix B corrected PropositionB.1, TheoremB.2, RemarkB.4 pp.902–906.)

**Checks.**

- For root number −1 the central value is zero and all even central derivatives vanish; a nonzero odd derivative propagates strict positivity along the odd orders in the non-polynomial case.
- A positive constant centered completion has positive zeroth derivative and every higher derivative is zero.
- For a polynomial centered completion every derivative above its degree vanishes; strictness requires the stated non-polynomial hypothesis.

*Needs:* [Real coefficients of unitary self-dual factors](../AutomorphicLFunctionsAndLocalFactors/README.md#unitary-self-dual-real-factors); [Growth of the centered entire standard completion](#standard-order-one); AutomorphicLFunctionsAndLocalFactors AL.2, centered entire functions and paired Hadamard theorem; its AL.3 unramified pure realization.


### 3.6d Clearing the trivial function-field poles

<a id="trivial-function-field-pole-clearer"></a>

**Clearing the trivial function-field poles.** For the trivial character over X/F_q, let ζ_X(s)=P_X(q^(−s))/((1−q^(−s))(1−q^(1−s))) and Λ(1,s)=q^((g−1)(s−1/2))ζ_X(s). Then q^(s−1/2)(1−q^(−s))(1−q^(1−s))Λ(1,s)=q^(g(s−1/2))P_X(q^(−s)) is entire and symmetric under s↦1−s. Its central derivatives are nonnegative by the paired-root argument; for g=0 it is1.

Work under the following hypotheses. The curve-cohomological determinant theorem of AutomorphicLFunctionsAndLocalFactors AL.3 supplies the zeta numerator, reciprocity and root location. The number-field factor s(s−1) does not remove the periodic function-field poles.

(Source: [YZ17], Appendix B, Remark B.5, p.906; apply the displayed reciprocal zeta-factor calculation above to clear every periodic pole.)

**Checks.**

- For genus zero P_X=1 and the corrected entire function is identically 1, with every positive-order central derivative zero.
- The factors 1−q^(−s) and 1−q^(1−s) clear the poles at every imaginary translate of 0 and 1 by 2πi/log q.
- Substituting the reciprocal identity for P_X into q^(g(s−1/2))P_X(q^(−s)) gives the same expression at 1−s, retaining the genus exponent.

*Needs:* [Super-positivity of the standard completion](#standard-superpositivity); AutomorphicLFunctionsAndLocalFactors AL.3, tensor cohomological determinant theorem.


### 3.7 Regular Eisenstein wave packets

Define `eisenstein_wave_packet` as follows. Let F_P be a smooth compactly supported function on i(𝔞_P/𝔞_G)* with values in a fixed finite-dimensional H_P⁰ subspace and whose support avoids any poles of the chosen inducing continuation. Define W_P(F)(g)=∫E_P(g,F_P(λ),λ)dλ. This initially defines a smooth automorphic function by compact-parameter integration. For an associate family impose F_Q(wλ)=M(w,λ)F_P(λ) and sum n_P⁻¹W_P(F_P), with n_P=Σ_Q|W(𝔞_P,𝔞_Q)|. The weighted family is an L² wave packet by the norm theorem; its construction is here, before Layer 3’s pairings, while onto completeness belongs to Layer 4.

*Standing hypotheses:* finite-dimensional smooth inducing space; compact smooth spectral support; compatible dual measure and central quotient.

Prove the following API statements.
- `linear`: F↦W(F) is complex linear.
- `right_equivariant`: Right translation acts by the corresponding induced action on F_P(λ).
- `truncate_integral`: Λᵀ commutes with the compact-parameter integral under the quantitative truncation estimates.

**Checks.**
- Zero sections give zero packets.
- For P=G on [G]¹ the zero-dimensional integral gives the inducing vector.
- A compatible constant section v on a two-element Weyl orbit with half counting measure averages to v; omitting the denominator gives 2v.

([Art05], §7 Theorem 7.2(b) wave-packet formula, pp.32–35.)

*Needs:* §2.4; §2.5; §0.12; §3.4.


### 3.8 Integrated wave-packet Gram identities

Prove `wave_packet_gram`. For compact spectral wave packets F,F′, the truncated pairing is the double integral of the truncated Eisenstein Gram pairing. For cuspidal inducing data insert the exact ωᵀ sum; for general discrete data insert ωᵀ plus the uniformly exponentially small error on compact parameter support. After imposing associate symmetry, the T→∞ limit is Σ_P n_P⁻¹∫⟪F′_P(λ),F_P(λ)⟫dλ. This proves the isometric dense-domain norm identity, separately from surjectivity.

*Standing hypotheses:* compact smooth spectral support; compatible associate symmetry; controlled regular T-cone for the discrete error estimate.

([Art05], §7 Theorem 7.2(b), p.35; §12 contour discussion, p.66.)

*Needs:* §3.7; §3.5; §3.6; `MeasureTheory.integral_prod`.


### 3.9 Coalescing parameters and residue Gram forms

Prove `singular_parameter_limits`. Near coincident regular parameters, the complete Maass–Selberg Weyl sum extends as the truncated Gram function even when individual θ denominators vanish. Differentiating that full regularized identity gives Gram forms of parameter derivatives. For ordered polar flags with a common denominator, take the chosen residue coefficients on both sides; the resulting residue Gram form uses the same coordinate/order conventions. No positivity or L² membership follows from a formal Laurent coefficient.

*Standing hypotheses:* differentiation and residues have the common denominator and locally uniform derivative majorants; exact equality is the cuspidal formula, while general discrete data retains its controlled error.

([Art82], §§3–6 taking residues; §9 regularity discussion, pp.68–69.)

*Needs:* §3.5; §3.6; §2.6; `hasFDerivAt_integral_of_dominated_of_fderiv_le`.


### 3.10 GL_n relative root spaces and degree projections

Define `gln_relative_roots` as follows. Using the imported rational root spaces of AdelicAlgebraicGroups §3.1, construct their determinant-degree coordinates for function-field GL_n. For M=∏GL_ni, use determinant coordinates for a_M and its dual. Projection a_B→a_M takes block sums, while dual projection takes block averages. Relative roots are det_i/ni−det_j/nj, coroots e_i−e_j, a_M^G has coordinate sum zero and its dual has Σni x_i=0.

Prove the following API statements.
- `blockProjection`: implement sums on a_M and averages on its dual
- `relativeRoot`: construct det_i/ni−det_j/nj and coroots
- `fundamentalWeight`: export the prefix inequalities with exact denominators

**Checks.**
- The block projection for 1|23 sends (1,2,3) to (1,5), and its averaged dual projection gives (1,5/2).
- For the single rank-n block, n>0, subtracting the central projection gives the zero relative-height vector for every input.
- For blocks of ranks 1 and 2, α(x,y)=x−y/2 and α∨=(1,−1), with the degree-zero condition x+y=0.

([Yu22], §§3.1.1–3.1.6, pp.13–15.)

*Needs:* §1.11; §1.10a (function-field adeles, heights and measures); §1.10a (function-field Iwasawa data and chambers); ReductiveGroups Layer 7 (parabolics and Levis).


### 3.11 Chamber functions and parabolic height

Define `chamber_height_functions` as follows. Import the root/fundamental-weight cones from §3.1 and specialize their height argument to the function-field determinant-degree lattice. Define tau_P and hat-tau_P as strict positive-root/fundamental-weight cone indicators. For g=nmk, H_P(g) is the vector of determinant degrees of m. Record block-weight denominators and proper-parabolic conventions in the truncation cutoff.

Prove the following API statements.
- `height`: extract Levi determinant degrees from Iwasawa decomposition
- `tau`: test strict simple-root inequalities
- `hatTau`: test strict fundamental-weight inequalities

**Checks.**
- The empty product of cone conditions for GL₁ is 1.
- A point on a required wall, with the corresponding pairing zero, does not satisfy the strict cone condition.
- For the determinant-height homomorphism with trivial unipotent and compact factors, the height of nmk is that of m, and both cone cutoffs agree.

([Yu22], §§3.1.3–3.1.6, pp.14–15.)

*Needs:* §3.10; §1.10a (function-field adeles, heights and measures); §3.1.


### 3.12 Generic auxiliary chamber selector

Define `auxiliary_chamber_selector` as follows. Choose kappa in the positive chamber outside every relative-root hyperplane for every semistandard Levi. The unique Q_L with all its simple roots positive on kappa orders the Levi blocks. Merely requiring nonzero projections to a_L is insufficient.

Prove the following API statements.
- `avoidHyperplanes`: choose a point off the finite union of relative-root walls
- `orderedParabolic`: recover Q_L from the signs
- `weylTransport`: relate a semistandard Levi to the ordered standard one

**Checks.**
- The vector (3,2,1) fails membership in the selector for the crossed partition {1,3}|{2}, because its block averages are equal.
- The vector (2,0) belongs to the GL₂ regular selector and chooses the positive ordered parabolic.
- Multiplying a generic kappa by a positive real preserves every relative-root sign, hence preserves every Q_L.

([Yu22], §5.1.1, p.29.)

*Needs:* §3.10; §6.25; §1.10a (function-field adeles, heights and measures).


### 3.13 Degree-filtered lattice cone series

Define `degree_cone_series` as follows. Let M be standard, Q in P(M) and s in W_n/W^Q with sQs^{-1} standard. Let φ_Q be the indicator of {H in a_{s(M)} : for all α in Δ_Q, ϖ_{s(α)}(H)≤0 if α(κ)>0 and ϖ_{s(α)}(H)>0 if α(κ)<0}, where ϖ_{s(α)} in Δ̂_{sQs^{-1}} is dual to s(α)^∨, and let ε(Q)=#{α in Δ_Q : α(κ)<0}. Then 1̂_Q(λ) on X_M^G is the analytic continuation of (−1)^{ε(Q)}Σ_{H in a_{M,Z}/X_*(Z_G)} φ_Q(s(H))λ^{−H}, which converges where |λ^{α^∨}|<1 for all α in Φ(Z_M,G) with α(κ)>0 (a region meeting every component of X_M^G). For semi-standard L and Q in P(L), 1̂_Q(λ):=1̂_{wQw^{-1}}(w(λ)), where w in W_n/W^{Q_L} is the unique element with wQ_Lw^{-1} standard. For ζ a primitive n-th root of unity, η=ζ^{deg det} in X_G^G and e in Z, 1̂^e_Q(λ)=n^{-1}Σ_{k=1}^n ζ^{ek}1̂_Q(λη^k); it is the part of the series with Σ_iH_i≡e (mod n), and 1̂_Q=Σ_{e=0}^{n−1}1̂^e_Q.

Prove the following API statements.
- `coneSeries`: define in a convergence chamber then continue
- `degreeFourierProjector`: select a degree residue by the finite Fourier sum
- `sumResidues`: recover the unfiltered series

**Checks.**
- For n=1 the Fourier degree projector has one term and hat1_Q^0=hat1_Q.
- Summing hat1_Q^e over e=0,..,n−1 recovers hat1_Q.
- For n=2,zeta=−1, the even/odd projectors of a function f are (f(lambda)±f(lambda*eta))/2.

([Yu22], §5.2.1, pp.31–32.)

*Needs:* §3.11; §6.26; §3.12; §1.10a (function-field adeles, heights and measures).


### 3.14 Floor-vector expression for the cone series

Prove `cone_series_floor_vector`. For ordered block prefix ranks r_s^i, H_Q^e=s^−1(floor(e r_s^0/n)−floor(e r_s^1/n),..,floor(e r_s^(r−1)/n)−floor(e r_s^r/n)) belongs to the integral a_L lattice with total degree −e. Then hat1_Q^e=lambda^H∏_{alpha∈Delta_Q}(1−lambda^alpha∨)^−1; for e=−1 this is (−1)^(r−1)(∏lambda_i)/theta_Q.

([Yu22], Proposition 5.2.1, p.32.)

*Needs:* §3.10; §6.26; §3.13; §1.10a (function-field adeles, heights and measures).


### 3.15 Degree floor-monomial family

Define `floor_monomial_family` as follows. Set I_Q^e=H_Q^e+s^−1(0,1,..,1). The functions lambda↦lambda^I_Q^e form a (G,M)-family, and hat1_Q^e=(−1)^dim(a_M^G)lambda^I_Q^e/theta_Q. Adjacent-block compatibility follows from the floor identities on the wall.

Prove the following API statements.
- `floorExponent`: add the ordered (0,1,..,1) vector
- `wallAgreement`: prove adjacent exponent compatibility
- `cutoffFactor`: recover hat1_Q^e with the single theta denominator

**Checks.**
- The floor-height and shifted-exponent constructions for ranks (1,2), total rank three and degree one give H=(0,−1), I=(0,0).
- The total of H_Q^e is −e and the total of I_Q^e is r−1−e.
- For two blocks, λ₂⁻¹/(1−λ₁/λ₂)=−1/(λ₁−λ₂). Multiplication by linear θ cancels the pole, whereas its inverse doubles the denominator.

([Yu22], Lemme A.1, p.75; [Laf97], Lemme 5(ii), p.301.)

*Needs:* §6.27; §3.14; §1.10a (function-field adeles, heights and measures).


### 3.16 Translated degree-cutoff vanishing

Prove `degree_cutoff_vanishing`. Let n≥1, gcd(e,n)=1, M a standard Levi of GL_n and μ₀∈X_M^G. Suppose the (G,M)-family (c_Q) is defined on a domain containing μ₀^ℤ, c_M^Q is independent of Q∈P(L) for each L∈L(M), and c_Q(λμ₀)=c_Q(λ). Then lim_(λ→1) Σ_(Q∈P(M)) 1̂_Q^e(λμ₀)c_Q(λμ₀)=0 unless μ₀∈X_G^G. Coprimality is essential; the conclusion can fail otherwise.

([Yu22], Lemme A.2, pp.75–76.)

*Needs:* §6.29; §6.33; §3.15; §1.10a (function-field adeles, heights and measures).


### 3.17 Dependence of cutoff values only on degree order

Prove `cutoff_degree_order`. Under the same partial-value compatibility, lim_(mu→1)Σ_Qhat1_Q^e(mu)c_Q(mu) depends only on the order of e in Z/nZ. On a Levi with block sizes m_j, the top-degree floor-monomial contribution vanishes unless n|e m_j for every j; product descent gives the assertion.

([Yu22], Lemme A.3, pp.76–77.)

*Needs:* §6.29; §3.14; §3.15; §1.10a (function-field adeles, heights and measures).


### 3.17a Geometric and alternating Γ cutoffs

Construct `gamma_cutoffs`. For any compatible reductive relative root datum and standard P, define Γ′_P(H,T)=Σ_{P⊆Q⊆G}(−1)^dim(𝔞_Q^G)τ_P^Q(H)τ̂_Q(H−T), using the projected arguments and strict cones of §3.1. Prove compact support in H modulo 𝔞_G for fixed T, Γ′_G=1, and the Levi/projection compatibilities used for truncation translation. Incidence inversion identifies the alternating sum with Arthur's recursion (9.1). For GL_n with block ranks n₁,…,n_r and determinant degrees H=(d₁,…,d_r), define Γ_P(H,T) to be the indicator that d₁/n₁>⋯>d_r/n_r and every proper block-prefix degree, after subtracting its proportional share of total degree, is at most the corresponding centered prefix of T. Thus for k=n₁+⋯+n_j the bound is Σ_{i≤j}d_i−(k/n)Σ_i d_i≤Σ_{a≤k}T_a−(k/n)Σ_a T_a. Identify this Γ_P with Yu's Γ_(n₁,…,n_r).

Prove Γ_P=Γ′_P when T₁≥⋯≥T_n, including chamber walls, and compact support modulo 𝔞_G. Prove Γ_G=1 and Γ_P(·,0)=0 for proper P. The non-strict prefix bound and strict slope inequalities are both essential.

**Checks.**

- For P=G, the slope and prefix conditions are empty and Γ_G=Γ′_G=1, including GL₁.
- For the GL₂ Borel, H=(h,−h) and T=(t,−t) with t≥0, Γ_B=Γ′_B=1_(0<h≤t). At t=1 the values at h=0,1,2 are 0,1,0.
- At the chamber wall T=0 every proper GL_n cutoff is zero; adding c(n₁,…,n_r) to H leaves both cutoffs unchanged. In rank one Γ′_B(h,0)=1_(h>0)−1_(h>0)=0.

([Ch15], §4.5 (4.5.1)–(4.5.2), Remarques 4.5.1 and Lemma 4.5.2, pp.23–24; [Art05], §9 (9.1) and Lemma 9.2, pp.47–48, and its use in the proof of Theorem 9.1, pp.48–50, for the general reductive Γ′ and translation identities.)

*Needs:* §3.1 for the general alternating cones; §§3.10–3.11 for the GL_n determinant-degree coordinates and prefix weights.


### 3.18 Quasi-polynomiality of the Γ-lattice counts and determination from the deep chamber

Prove `lattice_count_quasipolynomial`. Let M_P ≅ GL(n_1) × ⋯ × GL(n_r), e ∈ Z and e_i ∈ Z/n_iZ, and let h = h^e_{(e_i)} = {(d_1, …, d_r) ∈ Z^r : Σ d_i = e, d_i ≡ e_i mod n_i}. (a) [Ch15, Prop 4.5.5] On lattice points T ∈ Hom(X^*(B), Z) ≅ Z^n with T_1 ≥ ⋯ ≥ T_n, the finite sum T ↦ Σ_{H∈h} Γ_{(n_1,…,n_r)}(H, T) agrees with a quasi-polynomial Σ_{ν∈f} p_ν(T) q^{⟨ν,T⟩}, with f ⊂ (2πi/log q) X^*(B) ⊗ Q finite and each p_ν a polynomial. Yu's Γ_I equals Chaudouard's Γ_P. (b) Two such quasi-polynomials that agree at all lattice points T with d(T) ≥ c agree on all lattice points of the closed chamber, in particular at T = 0. (c) (Remarque 3.3.3) Γ_I(·, 0) ≡ 0 for r > 1 and Γ_{(n)} ≡ 1.

([Yu22], §3.3.1, p. 20, and Remarque 3.3.3, p. 19; [Ch15, Définition 4.5.3, Proposition 4.5.5].)

*Needs:* §1.10a (function-field adeles, heights and measures); §3.10; §3.11; §3.17a (Γ and Γ′ cutoffs).


### 3.19 Vanishing of the degree-e cone sum on a proper Levi

Prove `cone_sum_levi_vanishing`. For a standard Levi L=∏_(i=1)^k GL_(m_i) of GL_n with k≥2, put d=gcd(m₁,…,m_k). The sum Σ_(Q∈P(L))1̂_Q^e(λ) is identically zero on X_L^G unless (n/d) divides e, hence vanishes for gcd(e,n)=1. When (n/d) divides e it is a single monomial taking root-of-unity values. For L=T⊂GL₂ and e=0 it is identically one.

([Yu22], Appendix A, pp. 75–76, input to Lemme A.2 (supplement; not stated in the paper).)

*Needs:* §1.10a (function-field adeles, heights and measures).


### Examples

The rank-one constant function truncates to 1_(y≤Y) at T=log Y; cusp forms are fixed. In A₂, root coordinates (−1,3) are outside the strict simple-root cone but inside the fundamental-weight cone. The GL₃ block projection 1|23 sends (1,2,3) to (1,5), whereas the dual projection takes (1,5/2). At n=2 the degree Fourier projectors are (f(λ)±f(λη))/2. For two blocks the identity λ₂⁻¹/(1−λ₁/λ₂)=−1/(λ₁−λ₂) fixes the direction of the theta denominator.

### Dependencies

Truncation uses rational constant terms, Siegel finiteness, relative cones and compatible measures. Exact Maass–Selberg uses cuspidal data; the discrete version uses controlled residues and retains its error estimate. Compact parameter integration and the Gram limit use Layer 0 vector analysis and Layer 2 unitary-axis continuation. The function-field cutoff suffix follows determinant coordinates and the torus/family prefix in Layer 6; coprime vanishing uses its translated-family and product-descent theorems.

## Layer 4: Automorphic spectral completeness

### 4.1 Measurable associate spectral parameters

Define `associate_parameter_fields` as follows. For each associate class 𝒫 of rational parabolics take measurable families F_P:i(𝔞_P/𝔞_G)*→H_P with F_Q(wλ)=M(w,λ)F_P(λ), and norm² Σ_{P∈𝒫}n_P⁻¹∫‖F_P(λ)‖²dλ, n_P=Σ_{Q∈𝒫}|W(𝔞_P,𝔞_Q)|. This closed symmetric subspace of the Hilbert direct sum is the quotient-free model of the measurable Weyl parameter space. Choosing Borel fundamental domains gives an equivalent quotient model with stabilizers and multiplicity spaces retained. The discrete inducing representation of each Levi includes its cuspidal and already constructed residual parts. Lebesgue measure is dual to the fixed height measure; residual atoms are not absorbed into it.

*Standing hypotheses:* number field; countably many discrete inducing constituents at each level/K-type; compatible central quotient and unitary-axis intertwiner fields.

Prove the following API statements.
- `symmetric_norm`: The symmetric-family norm is Σ_P n_P⁻¹∫‖F_P‖².
- `weyl_transport`: F_P↦F_Q(wλ) is the unitary fibre transport M(w,λ), satisfying identity and composition.
- `quotient_equiv`: A Borel orbit-domain model with the orbit/stabilizer measure is unitarily equivalent to the symmetric-family model.

**Checks.**
- A constant section over the single point with n_G=1 maps to a field vector whose squared norm is the original squared norm.
- For a reflected compatible section over the real parameter line with n_P=2, the field vector has half the full integrated squared norm.
- A nonzero vector fixed by the stabilizer operator defines a nonzero point-field vector, with the reciprocal stabilizer norm factor retained.

([Art05], §7 Theorem 7.2(b), definition of L̂_𝒫, pp.32–35.)

*Needs:* §0.1; §0.2; §0.3; §2.4; §2.5.


### 4.2 Unitary Eisenstein spectral map

Define `spectral_map` as follows. On smooth compactly supported symmetric associate families define U(F)=Σ_P n_P⁻¹∫E_P(g,F_P(λ),λ)dλ. Extend by the wave-packet Gram identity to the direct sum over associate classes. The resulting map is an isometry intertwining G(𝔸)¹. The spectral orthosum theorem proves it onto L²([G]¹), so its inverse, the spectral transform, is a unitary equivalence, not just an isometric embedding.

*Standing hypotheses:* dense smooth compact spectral domain in the symmetric-family Hilbert space; all discrete Levi data are included.

Prove the following API statements.
- `packet_apply`: On the dense domain U equals the normalized sum of Eisenstein integrals.
- `norm`: ‖U(F)‖²=Σ_P n_P⁻¹∫‖F_P(λ)‖².
- `right_intertwines`: U I(g)=R(g)U; after onto completeness its inverse has the same intertwining property.

**Checks.**
- The P=G cuspidal component maps identically to the ArithmeticLocallySymmetricSpaces ALS.F.6 cuspidal subspace.
- U(0)=0.
- A proper closed inclusion of Hilbert spaces satisfies the norm law but fails the required surjectivity condition.

([Art05], §7 Theorem 7.2(b), pp.32–35.)

*Needs:* §4.1; §3.7; §3.8; §0.4.


### 4.3 Completeness of the automorphic spectral decomposition

Prove `spectral_orthosum`. The isometric map U from all associate classes is onto L²([G]¹). Equivalently the closed invariant images L²_𝒫 are pairwise orthogonal and their Hilbert sum is all of L². A vector perpendicular to all wave packets is zero: project it to every elementary χ-block, apply the pseudo-Eisenstein pairing, shift the contour and include every residual contribution. Orthogonality or an isometric map alone is insufficient.

*Standing hypotheses:* all associate parabolics and all discrete inducing representations of their Levis; ordered residual terms from every crossed polar flag.

([Art05], §7 Theorem 7.2(b), equation (7.5), p.35; §12 Lemma 12.4 and contour discussion, pp.65–66.)

*Needs:* §4.2; §1.10; §2.6.


### 4.4 Residual discrete automorphic spectrum

Define `residual_spectrum` as follows. Import L²_cusp and its finite-multiplicity decomposition from ArithmeticLocallySymmetricSpaces ALS.F.6. Define L²_disc as the closed sum of irreducible closed invariant subrepresentations in L², and L²_res=L²_disc∩(L²_cusp)⊥. The residual construction identifies L²_res with the closed span of the nonzero square-integrable ordered Eisenstein residues from proper Levi cuspidal data. Define L²_cont=(L²_disc)⊥. These are orthogonal closed invariant spaces; a formal residue outside the L² exponent criterion is not a residual summand.

*Standing hypotheses:* the complete spectral theorem and the negative-exponent residue criterion; cuspidal space is imported rather than reconstructed.

Prove the following API statements.
- `orthogonal`: L²_disc=L²_cusp⊕L²_res and L²=L²_disc⊕L²_cont.
- `residue_mem`: A nonzero ordered residue satisfying the negative-exponent criterion defines a vector in L²_res.
- `projection_equivariant`: The three orthogonal projections commute with the unitary right action and every bounded integrated Hecke action.

**Checks.**
- If G is anisotropic modulo center, there are no proper rational parabolics and L²_res=L²_cont=0.
- The modular Eisenstein residue is 3/π. If the discrete Hilbert space is the orthogonal sum of cusp space and the nonzero constant line, the residual space is that line.
- For a surviving cusp power y^a with a≥1/2, there is no L² representative for the hyperbolic cusp measure, so the power cannot be a vector in any L² residual subspace.

([Art05], §7 Theorem 7.2(b), p.35; §12 contour residues and (12.5), p.66.)

*Needs:* §4.3; §2.6; ArithmeticLocallySymmetricSpaces ALS.F.6 (cuspidal discreteness and finite multiplicity).


### 4.5 Finite multiplicity in the discrete spectrum

Prove `discrete_finite_multiplicity`. Every irreducible unitary automorphic representation occurs in L²_disc([G]¹) with finite multiplicity. At fixed compact open finite level, finite K∞-type set and fixed infinitesimal character, the corresponding discrete automorphic space is finite dimensional. The cuspidal part is supplied by ArithmeticLocallySymmetricSpaces ALS.F.6; the new conclusion concerns residual constituents, their finite multiplicity and the combination. This does not assert that the whole residual Hilbert space is finite dimensional.

*Standing hypotheses:* fixed central character and the number-field quotient; finite level, K-types and infinitesimal character only in the finite-dimensional clause.

([Art05], §7 discrete inducing spaces, pp.32–33; §12 discrete decomposition (12.5)–(12.6), p.66.)

*Needs:* §4.4; §0.50 (restricted tensor factorization); ArithmeticLocallySymmetricSpaces ALS.F.6 (cuspidal discreteness and finite multiplicity).


### 4.6 Hecke and central-character spectral compatibility

Prove `hecke_central_compatibility`. For an L¹ compactly supported finite Hecke test h, U⁻¹R(h)U is the decomposable field I_P(λ,h) and ‖R(h)‖≤‖h‖₁. The field preserves the associate symmetry and all cusp/residual/continuous projections. Restricting to a fixed unitary central character uses the matching induced central character and quotient measures. Twisting by a unitary global character transports the spectral decomposition and Haar data; a nonunitary twist requires the corresponding change of weighted Hilbert norm and is not asserted as unitary on the original space.

*Standing hypotheses:* the transform is onto; h has finite level and integrable compact support; the central character is unitary in the L² model.

([Art05], §7 Theorem 7.2(b) and its representation interpretation, pp.35–36; §12 (12.5)–(12.6), p.66; §15 unitary-axis intertwiner normalization, pp.85–87.)

*Needs:* §4.3; §4.4; §0.3; SmoothRepresentationsOfLocalGroups Layer 1; AdelicAlgebraicGroups §§2.1–2.3 (split-centre quotient comparison).


### 4.7 Compact quotient discrete spectral specialization

Prove `compact_quotient_spectrum`. For a cocompact lattice Γ in a real reductive G with fixed central quotient and finite level as appropriate, L²(Γ\G) is a discrete Hilbert sum of irreducible unitary representations with finite multiplicities. Smooth compactly supported convolution is trace class and admits its smooth periodized kernel. This allows Γ\G compact while G itself is noncompact; compact-group Peter–Weyl supplies the distinct Γ={1}, G compact specialization. On a finite-volume noncompact quotient, arbitrary full-space convolution need not be trace class.

*Standing hypotheses:* cocompact lattice and quotient measure; smooth compact test; admissible real representation theory; central quotient removes any noncompact split-center direction.

([Art05], §1, equations (1.1)–(1.3), pp.7–11.)

*Needs:* §0.8; §0.9; §0.10; AdelicAlgebraicGroups §3.4 (compactness modulo the centre); §0.48 (real reductive representation foundations); `TauCeti.stdPeterWeylBasis`; `IsCompactOperator.finiteDimensional_eigenspace`.


### 4.8 GL₂ modular spectral expansion

Prove `gl2_spectral_expansion`. On PSL₂(ℤ)\ℍ with dμ=dx dy/y², Δ=−y²(∂ₓ²+∂ᵧ²) has constant eigenvector, a countable orthogonal cusp spectrum and continuous generalized eigenfunctions E(z,1/2+it). For f∈C_c∞, f=3π⁻¹∫f dμ+Σ_φ⟪φ,f⟫φ/‖φ‖²+(4π)⁻¹∫_ℝ⟪E(·,1/2+it),f⟫E(z,1/2+it)dt, in L² and locally uniformly. A level subgroup has one Eisenstein family per cusp and its scattering matrix, not the one-cusp formula unchanged. Cusp eigenvalues can be denoted 1/4+r² with r real or purely imaginary; the general spectral theorem does not remove exceptional eigenvalues.

*Standing hypotheses:* compact smooth f; one-cusp full modular group in the displayed formula; orthogonal nonzero cusp eigenvectors; standard E normalization.

([DIT16], §5, (5.1)–(5.6), pp.961–962.)

*Needs:* §1.16a; §4.3; §4.4; §2.4; §1.16.


### 4.9 Modular Weyl law and spectral summability

Prove `modular_weyl_estimates`. For the full modular cusp spectrum counted with multiplicity, N(X)=#{φ:λ_φ≤X}∼X/12. For compactly supported smooth f, its cusp and Eisenstein coefficients decrease faster than every fixed inverse spectral power after repeated integration by parts with Δ; on compact z-sets the eigenfunction/Eisenstein bounds and Weyl counting make the spectral expansion absolutely summable after sufficiently many derivatives. These estimates justify the hyperbolic Weyl-integral pairings for the compact core; cusp-end integrals require their separate endpoint bounds.

*Standing hypotheses:* actual spectral values λ_φ; no assertion λ_φ>1/4 is used; fixed compact z-set and fixed smooth f.

([DIT16], §5, (5.10) and the paragraph after (5.11), p.963.)

*Needs:* §4.8.


### 4.10 Wallach tempered cuspidality criterion

Prove `wallach_cuspidality`. For a semisimple real group arising from a Q-group and an arithmetic lattice Γ as in Wallach, any (𝔤,K)-homomorphism from a tempered Harish-Chandra module V into A(Γ\G)∩L²(Γ\G) has cuspidal image. Consequently a square-integrable automorphic representation with tempered archimedean component is cuspidal in this setting. For a general reductive group and an essentially tempered archimedean component, first remove the specified positive central twist and pass to the finite-volume central quotient; the transfer of this criterion requires a separate central-reduction proof.

*Standing hypotheses:* Wallach Theorem 4.3’s arithmetic semisimple setting; the essentially tempered central extension is distinguished as an additional adaptation.

([Wal84], §4 Theorem 4.3 and its proof pp.233–234.)

*Needs:* §0.48 (real reductive representation foundations); ArithmeticLocallySymmetricSpaces ALS.F.6 (constant terms); §4.4.


### 4.11 Discrete spherical spectrum

Define `discrete_spherical_spectrum` as follows. For a fixed central character theta, use the paper's |theta|-weighted L² norm on the central quotient and take irreducible spherical constituents of the discrete subspace. Cuspidal constituents are discrete; residual constituents must not be discarded.

Prove the following API statements.
- `weightedNorm`: use theta's absolute-value normalization
- `discreteSubspace`: separate discrete from continuous spectral pieces
- `cuspidalInclusion`: embed cuspidal constituents without identifying them with all discrete ones

**Checks.**
- For n≥2 and trivial θ, the constant function is a spherical vector of the discrete spectrum that is residual, not cuspidal; a definition keeping only cuspidal constituents loses it.
- For |theta|=1 the |theta|-weighted integrand equals |phi|².
- When the section and its weight transform by the same nonzero central character, the integrated discrete_spherical_spectrum norm is unchanged under central translation.

([Yu22], §2.3.3, pp. 10–11, Définition 2.3.4 and the definition of L²(M_P(F)\M_P(A))_θ^K.)

*Needs:* §1.11; §1.10a (function-field adeles, heights and measures).


### 4.12 Discrete pairs, their equivalence and stabilizers

Define `discrete_pair` as follows. A pair (P,pi) has standard P and a discrete spherical representation of M_P, with central character trivial on Xi_M. Quotient by Weyl transport and unramified twists in X_M^G; stab(P,pi) comprises the corresponding pairs (w,lambda).

Prove the following API statements.
- `pair`: construct standard-parabolic discrete data
- `weylTwistEquiv`: transport both the parabolic and coefficient representation
- `stabilizer`: record the Weyl element and its compensating character

**Checks.**
- (1,1) belongs to stab(P,pi).
- For GL₂ with diagonal Levi and unramified unitary Hecke characters χ₁,χ₂ whose restrictions to the degree-zero idele classes differ, π=χ₁⊗χ₂ has no transposition in its Weyl/twist stabilizer: unramified degree twists cannot exchange their inertial classes.
- The inverse stabilizer element of (w,tau) is (w⁻¹,w(tau)⁻¹), in the convention of Yu (5.2.11).

([Yu22], §2.3.3, pp.11–12.)

*Needs:* §1.11; §4.11; §1.10a (function-field adeles, heights and measures).


### 4.13 Good representatives of discrete pairs

Define `good_discrete_pair` as follows. Choose pi=⊗_i Π_i^⊗mi with equal representatives of each inertial class and distinct classes for distinct i. Then stabilizers split into permutations of equal factors and their twist stabilizers. These choices are required in the zero/pole and cycle computations.

Prove the following API statements.
- `groupEqualTypes`: choose one representative of each inertial class
- `cycleData`: decompose stabilizing permutations on multiplicity blocks
- `stabilizerCard`: compute factorial and twist factors

**Checks.**
- Two raw representations in the same inertial class have equal chosen representatives under good_discrete_pair, so their distinguished tuple is fixed by transposition.
- For two distinct inertial classes and a representative section of the class map, transposition does not fix the distinguished tuple.
- When twisting preserves the distinguished tuple's inertial classes, its Weyl/twist stabilizer is the product of permutation and twist stabilizers.

([Yu22], §2.3.3, p. 12 ('bon représentant'); used in §6.2.1 and §6.4.1.)

*Needs:* §4.12; §1.10a (function-field adeles, heights and measures).


### 4.14 Moeglin–Waldspurger classification

Prove `moeglin_waldspurger`, the everywhere-unramified function-field residual classification in convention Y ([MW89], Théorème, p.606, with the function-field central-character clauses of IV). Let Π be a discrete everywhere-unramified automorphic representation of G_n(A) in the central-character realization of §4.11. For a nonunitary character, first unitarize by its specified positive determinant twist, apply the unitary classification, and twist back in the weighted norm. There are d | n, the standard parabolic P with M_P = G_d × ⋯ × G_d (ν = n/d factors), and an everywhere-unramified cuspidal representation π of G_d(A) with the corresponding central character such that, with |g| = q^{deg det g} and π̃ = π|·|^{(ν−1)/2} ⊗ π|·|^{(ν−3)/2} ⊗ ⋯ ⊗ π|·|^{−(ν−1)/2}, Π ≅ π̃ as H_G-modules via t_P at every place. The pair (π, ν) is unique. Conversely, for every such π and every ν ≥ 1, π̃ viewed as an H_G-module via t_P is isomorphic to the H_G-module of a discrete everywhere-unramified representation of G_{νd}(A), denoted π ⊠ ν. Construct these representations from the cuspidal Eisenstein continuation and ordered residues, with their fixed central characters; prove multiplicity one in the corresponding discrete central-character space. The classification follows the cuspidal Eisenstein prefix of §1.10b.

([Yu22], §2.3.4, p. 12, Théorème 2.3.6 (the theorem is on p. 12 only).)

**Checks.**

- For ν=1 the classified block is the original cuspidal representation.
- For ν=2 the inducing exponents are ±1/2 and the block is not cuspidal.
- For d=1 and ν=2 the residual determinant character is nongeneric; Whittaker formulas describe its cuspidal inducing data rather than a Whittaker model of the quotient.

*Needs:* §1.10b (cuspidal continuation and residues); §4.11; §1.12 (half-modulus Hecke transport); §1.10a (function-field adeles, heights and measures); AutomorphicLFunctionsAndLocalFactors AL.3, cuspidal continuation and pole criteria.


### 4.14a Number-field GLₙ residual blocks

<a id="number-field-residual-blocks"></a>

**Number-field GLₙ residual blocks.** Fix a number field F and a unitary central character ω of GL_N(𝔸_F). For each N=dν with d,ν≥1 and unitary cuspidal τ of GL_d(𝔸_F) satisfying ω_τ^ν=ω, construct the discrete block τ⊠ν as the irreducible quotient of the ordered normalized induction with exponents (ν−1)/2,(ν−3)/2,…,−(ν−1)/2. Realize it automorphically by the corresponding nonzero iterated residue of the cuspidal Eisenstein family and verify the square-integrability exponent criterion modulo the centre. Every irreducible constituent of the discrete central-character space is one such block, the pair (τ,ν) is unique, and its multiplicity is one. The cuspidal case is exactly ν=1; ν>1 gives the residual spectrum. Identify the unramified Satake multiset with the union of the twisted cuspidal multisets, using the isobaric quotient and its local Langlands data supplied by AutomorphicLFunctionsAndLocalFactors. For a specified nonunitary central character, unitarize by its positive determinant twist, apply this classification, and twist back with the corresponding weighted norm.

*Standing hypotheses:* fixed central-character L² realization modulo the centre; normalized induction with the displayed ordered real exponents; positive integer block length; the unitarization and its norm transport are part of the nonunitary assertion. Residue nonvanishing and the multiplicity assertion are conclusions, rather than assumptions about a formal list of Satake roots.

**Checks.**

- At ν=1 the block is τ and occurs in the cuspidal spectrum with multiplicity one.
- At ν=2 the exponents are ±1/2 and the block is residual, with central character ω_τ².
- For d=1,ν=2 the residual representation is the determinant character associated to τ and is nongeneric, so generic integral formulas are applied to its inducing data.
- A fixed-character space contains only the blocks satisfying ω_τ^ν=ω; changing the character changes that selection without changing the multiplicity of an admitted block.

(Source: Mœglin–Waldspurger [MW89], introduction theorem, pp.605–606; Cogdell [Cog04], Lecture 9, pp.75–76, for the isobaric Langlands data.)

*Needs:* §§1.1–1.5, 2.4 and 2.6; AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, [GLₙ isobaric sums](../AutomorphicLFunctionsAndLocalFactors/README.md#isobaric-construction); its AL.3 [cuspidal continuation and poles](../AutomorphicLFunctionsAndLocalFactors/README.md#rs-global-poles); SmoothRepresentationsOfLocalGroups SR.2–SR.3; §0.48 for archimedean Langlands quotients.


### 4.15 Residual twist stabilizers

Prove `residual_twist_stabilizer`. Fix(pi box ν)≅Fix(pi). Two such discrete constituents are inertially equivalent exactly when their ν agree and their cuspidal inputs are inertially equivalent.

([Yu22], Proposition 2.3.7, p.13.)

*Needs:* §4.14; §1.10a (function-field adeles, heights and measures).


### 4.15a The residual Rankin–Selberg product

<a id="residual-rs-product"></a>

**The residual Rankin–Selberg product.** Given the discrete residual representations of §4.14, Π₁=π₁⊠ν₁ and Π₂=π₂⊠ν₂ in unitary normalization, L(Π₁×Π₂∨,z)=∏_{i=1}^{ν₁}∏_{j=1}^{ν₂}L(π₁×π₂∨,q^((ν₁+ν₂)/2+1−i−j)z). The ranks of Π_k are n_kν_k, where n_k is the cusp rank.

Work under the following hypotheses. ν₁,ν₂ positive integers; everywhere-unramified function-field representations. Use §4.14’s everywhere-unramified function-field residual classification.

**Checks.** ν₁=ν₂=1 recovers the cuspidal pair factor; ν₁=2,ν₂=1 gives shifts ±1/2; ν₁=ν₂=2 gives shifts 1,0,0,−1, so the unshifted factor occurs twice. These factors use residual inducing data even though a residual quotient can be nongeneric.

(Source: [Yu22], Lemma6.1.3, pp.43–44.)

*Needs:* [The function-field pair Euler product](../AutomorphicLFunctionsAndLocalFactors/README.md#function-field-rs-euler-product); [Cuspidal pair degrees and poles over a function field](../AutomorphicLFunctionsAndLocalFactors/README.md#function-field-cuspidal-polynomial); §4.14 (actual residual representations and their spherical Hecke modules). Construct the residual Euler-factor comparison from those modules and the supplied cuspidal factors.


### 4.15b Telescoping the residual normalizing quotient

<a id="residual-rs-telescoping"></a>

**Telescoping the residual normalizing quotient.** If ν₁≥ν₂, L(Π₁×Π₂∨,z)/L(Π₁×Π₂∨,q^(−1)z)=∏_{i=1}^{ν₂}L(π₁×π₂∨,q^((ν₁+ν₂)/2−i)z)/∏_{i=1}^{ν₂}L(π₁×π₂∨,q^(−(ν₁+ν₂)/2+i−1)z).

The algebraic prototype is `AL3.ResidualRsTelescoping`.

Work under the following hypotheses. ν₁≥ν₂≥1, with the residual representations and unitary normalization of §4.15a. Equality of nonzero rational functions; the two products include their possible cancellations.

(Source: [Yu22], (6.1.5), p.44.)

**Checks.**

- For ν₁=ν₂=1 the quotient is L(π₁×π₂∨,z)/L(π₁×π₂∨,q^(−1)z).
- For ν₁=2,ν₂=1 cancellation leaves L(π₁×π₂∨,q^(1/2)z)/L(π₁×π₂∨,q^(−3/2)z).
- For ν₁=ν₂=2 the surviving numerator shifts are 1,0 and denominator shifts are −2,−1, with cancellations interpreted rationally.

*Needs:* [The residual Rankin–Selberg product](#residual-rs-product).


### 4.15c The residual zero–pole index

<a id="residual-rs-index"></a>

**The residual zero–pole index.** For unitary everywhere-unramified Π₁=π₁⊠ν₁,Π₂=π₂⊠ν₂ with ν₁≥ν₂, the open-disc index of L(z)/L(q^(−1)z) is ν₂(2g−2)n₁n₂ plus d=|Fix(π₁)| precisely when Π₁ and Π₂ are inertially equivalent (equivalently ν₁=ν₂ and π₁ inertially equivalent to π₂); otherwise there is no d term.

Work under the following hypotheses. Inertial twists have unit-modulus degree parameter, so they rotate roots without changing this index. The extra term depends on inertial equivalence, including nontrivial degree twists, rather than equality of representations.

(Source: [Yu22], Corollary6.1.2 and proof pp.43–44.)

**Checks.**

- At g=1 a non-inertially-equivalent pair has index zero.
- At g=1 and equal residual lengths, an inertially equivalent pair has index d, including a nontrivial unitary degree twist.
- For unequal residual lengths the d correction is absent even when the cuspidal inputs are inertially equivalent.

*Needs:* §4.15 (residual twists and inertial equivalence); [Telescoping the residual normalizing quotient](#residual-rs-telescoping); [The self-pair polynomial reflection](../AutomorphicLFunctionsAndLocalFactors/README.md#function-field-self-pair-reflection); [The open-disc zero–pole index](../AutomorphicLFunctionsAndLocalFactors/README.md#open-disc-zero-pole-index).


### 4.15d The Rankin–Selberg normalizing scalar

<a id="rs-normalizing-scalar"></a>

**The Rankin–Selberg normalizing scalar.** For a positive root β joining residual blocks Π_i,Π_j of ranks N_i,N_j over X/F_q, put n_β(z)=q^((1−g)N_iN_j)L(Π_i×Π_j∨,z)/L(Π_i×Π_j∨,q^(−1)z). The scalar for a Weyl element is the product over its positive inversion roots, with the corresponding character ratios substituted for z. The subsequent operator realization in §§2.15–2.16 identifies this scalar with the spherical intertwiner after this rational construction.

Work under the following hypotheses. Nonzero rational factors; equality is meromorphic/rational, not a value formula at poles.

Require the following API.

- `AL3.RsNormalizingScalar.root`: The single-root scalar is the displayed shifted-L quotient.
- `AL3.RsNormalizingScalar.identity_weyl`: The empty inversion product is1.
- `AL3.RsNormalizingScalar.weyl_product`: For length-additive Weyl products, inversion factors compose after character substitution.

**Checks.**

- `AL3.RsNormalizingScalar.genus_one`: At g=1 the q prefactor is1.
- `AL3.RsNormalizingScalar.one_root`: A simple reflection has exactly one root factor.
- `AL3.RsNormalizingScalar.pole_not_value`: If the numerator has a pole at z=1, the scalar is compared as a rational function, not by substituting a totalized pole value.

(Source: [Yu22], §5.1.2 (5.1.1)–(5.1.3) pp.29–30.)

*Needs:* §§4.14 and 4.15a (residual blocks and factor comparison); AutomorphicLFunctionsAndLocalFactors AL.3, cuspidal pair factors; [Telescoping the residual normalizing quotient](#residual-rs-telescoping); [The function-field pair Euler product](../AutomorphicLFunctionsAndLocalFactors/README.md#function-field-rs-euler-product).


### 4.15e Reflection of the self-pair normalizer

<a id="self-pair-normalizer-reflection"></a>

**Reflection of the self-pair normalizer.** For Π=π⊠ν, cusp rank r, f=|Fix(π)| and self-pair numerator P, define F(z)=∏_{i=1}^ν P(q^(−i)z)∏_{i=1}^ν(1−(q^iz)^f)∏_{i=1}^{ν−1}(1−(q^iz)^f). Then n_β(z)=−z^E F(1/z)/F(z), E=((2g−2)r²+4f)ν−f. F is a polynomial in z^f with no roots on |z|=1.

Work under the following hypotheses. ν≥1; q>1 and the self-pair reflection/purity theorem. E is an integer, so this is a rational monomial identity.

(Source: [Yu22], (6.2.5)–(6.2.6), p.46.)

**Checks.**

- At ν=1 the product indexed from 1 to ν−1 is empty and E=(2g−2)r²+3f.
- For f=2 the polynomial F is even; more generally F(ζz)=F(z) for every ζ with ζ^f=1.
- On |z|=1 the nonvanishing of F makes the quotient regular and nonzero; the monomial −z^E does not introduce a unit-circle pole.

*Needs:* [The Rankin–Selberg normalizing scalar](#rs-normalizing-scalar); [The self-pair polynomial reflection](../AutomorphicLFunctionsAndLocalFactors/README.md#function-field-self-pair-reflection).


### 4.16 A stabilizing twist fixes the spherical function

Prove `stabilizing_twist_spherical`. If lambda_pi∈Fix(pi), multiplication by lambda_pi acts as the identity on A_(P,pi). First evaluate the scalar at a degree-zero nonvanishing point for cuspidal pi; extend to residual pi by the Eisenstein residue construction. On the full smooth G(A)-span it is an intertwiner, not generally the identity.

([Yu22], Proposition 5.3.1 and Remarque 5.3.2, pp.36–39.)

*Needs:* §4.17; §4.14; §4.15; §1.12; §1.10a (function-field adeles, heights and measures).


### 4.17 Residual discrete forms are residues of cuspidal Eisenstein series

Prove `residual_eisenstein_residue`, due to Langlands ([MW94], V.3.13(iii)). Let π be an everywhere-unramified discrete, non-cuspidal automorphic representation of G_n(A). For every φ in π there are a discrete pair (P',π') all of whose factors are cuspidal, a cuspidal φ' in A_{P',π'} and a point λ' in X_{P'}^G such that φ(g)=Res_{λ'}E(φ',·)(g) for all g in G(A), where E(φ',λ) is the Eisenstein series of φ' (MW94 II.1.5) and Res_{λ'} is an iterated residue operator at λ'. Moreover E(φ'λ0,λ)=λ0·E(φ',λ) for λ0 in X_G^G.

([Yu22], §5.3.1, pp.38–39, proof of Proposition 5.3.1, citing [MW94], V.3.13(iii) and II.1.5.)

*Needs:* §1.10a (function-field adeles, heights and measures); §4.14; §1.10b; §1.12.


### 4.17a Real-quadratic surfaces and genus characters

Construct `quadratic_weyl_domains` for a real quadratic field K of positive fundamental discriminant D. Construct its narrow ideal class group Cl⁺(K), with the class J exchanging the two norm signs, and the genus character χ attached to D=d′d, a factorization into fundamental discriminants. Define χ on prime ideals coprime to the discriminants using the Kronecker symbol and prove multiplicative extension, independence of ideal representatives and χ(J)=sgn(d)=sgn(d′).

For A∈Cl⁺(K), construct the reduced quadratic irrational and its periodic minus-continued-fraction cycle, DIT's subgroup Γ_A⊆PSL₂(ℤ), Nielsen region and finite-area hyperbolic orbifold surface F_A with its oriented boundary. Changing the reduced representative conjugates the subgroup and transports the surface and boundary measures. Construct the map to the modular surface, retaining multiplicities, and prove area(F_A)=πℓ_A and length(∂F_A)=2 log ε_D, where ε_D>1 is the primitive norm-one unit and ℓ_A the cycle length. Prove the compact-core/finite-width-cusp decomposition and compatibility of area measure dxdy/y² and boundary arclength y^(−1)|dz| with the Stokes orientation. These give well-defined genus-weighted surface and boundary integrals.

**Checks.**

- For D=28, the principal class has minus cycle (3,6), surface area 2π and boundary length 2 log(8+3√7).
- Replacing a reduced representative by its next cycle element gives the same surface and weighted integrals under the induced isometry.
- The factorization D=1·D gives the trivial genus character; when d,d′<0, χ(J)=−1, distinguishing the boundary sign case from d,d′>0.

([DIT16], §§2–3, pp.951–959, especially Theorem 1 and (3.3), pp.957–958, and §7, genus-character definition, p.968.)

*Needs:* GlobalQuadraticForms and NumberFieldArithmetic (quadratic fields, ideals and units); FuchsianOrbifolds (hyperbolic quotients, fundamental polygons and Gauss–Bonnet); §0.37.


### 4.18 Cusp decay for the Stokes input

Prove `cusp_decay`. For u=E(z,1/2+it), its derivative constant terms are O(Y^(−1/2)) for fixed t, with the t=0 limit treated separately; nonconstant terms decay exponentially. Cusp forms have exponential decay. Hence the horizontal derivative integral tends to 0 and u is absolutely integrable on each finite-width core cusp.

([DIT16], proof of Lemma 1, p.972.)

*Needs:* §4.17a; §2.17; §4.8.


### 4.19 Vanishing of the Weyl integrals of the wrong sign

Prove `wrong_sign_weyl_vanishing`. Let D>0 be a fundamental discriminant, D=d′d a factorization into fundamental discriminants with genus character χ, and u either E(z,s) with Re(s)=1/2 or ⟨φ,φ⟩^{−1}φ for a Hecke–Maass cusp form φ (λ its eigenvalue). If d′,d>0 then Σ_{A∈Cl⁺(K)} χ(A)(λ/2)∫_{F_A}u dμ = 0 (this includes the trivial character d′=1). If d′,d<0 then Σ_{A∈Cl⁺(K)} χ(A)∫_{∂F_A}u y^{−1}|dz| = 0.

([DIT16], §5, p.963, paragraph after (5.12).)

*Needs:* §4.17a; §2.17; §4.8.


### 4.20 Absolute integrability of E(z,s) over F_A on the critical line

Prove `eisenstein_core_integrable`. For Re(s)=1/2, E(z,s) is absolutely integrable over F_A with respect to dμ=y^{−2}dxdy.

*Standing hypotheses:* convention D; the quotient has a compact part and finitely many cusp ends of finite width; at removable points E takes its continued value.

([DIT16], §5, p.963, the remark that E is integrable by (5.3).)

*Needs:* §4.17a; §2.17; §4.8.


### Examples

A reflected compatible rank-one parameter family has half the norm squared of the unrestricted full-line integral; residual atoms are separate summands. The constant line on the full modular quotient has coefficient 3/π and is residual, while a cusp power y^a with a≥1/2 cannot represent an L² residual vector. A proper closed Hilbert inclusion satisfies an isometry identity and fails spectral completeness. In the function-field branch, two equal inertial classes admit a transposition stabilizer; distinct inertial classes do not, and a stabilizing twist fixes the spherical line without fixing every smooth translate.

### Dependencies

The associate model uses direct integrals and continued unitary intertwiner fields. The isometric packet map uses Layer 3's norm identity; onto completeness also uses the elementary decomposition of Layer 1 and all residual flags. The finite-multiplicity extension is built on the supplied cuspidal finiteness. Compact quotient kernels use the measurable kernel and trace API. Function-field discrete-pair classification, torus covers and spherical sections form the separate branch specified in How to read the build; critical modular integrals use Fourier decay at every cusp endpoint.

## Layer 5: Weighted cohomology and cuspidal support

### 5.1 Weighted L² de Rham complexes

Define `weighted_l2_complex` as follows. On X_K=G(F)\G(𝔸)/(A_G(ℝ)⁰K∞K_f), with an algebraic coefficient local system E and its invariant metric, an admissible positive smooth weight p satisfies |Dp|≤C_D p for every archimedean differential operator. Define L_p^q(E)={measurable E-valued q-forms ω: pω∈L² and p dω∈L²}, where dω is the distributional local-system derivative. Give it the graph norm and differential d. The union over sufficiently decreasing exponential Siegel weights computes ordinary de Rham cohomology; the single weight p=1 instead gives an L² complex. Use p_λ comparable to exp(λ(H(g))) on Siegel sets and eventually N_P-invariant in the deep P-cusp.

*Standing hypotheses:* neat finite level or the orbifold variant with its stabilizer conventions; finite-dimensional algebraic E; fixed quotient measure and metric; d interpreted distributionally.

Prove the following API statements.
- `domain`: ω lies in L_p^q iff pω and its distributional p dω are L².
- `weight_comparison`: If p≤Cq, there is a continuous complex inclusion L_q^•→L_p^•.
- `d_squared`: The distributional derivative squares to zero on the graph domain.

**Checks.**
- For p=1 this is the maximal L² de Rham graph complex.
- On a compact quotient all admissible weights bounded above and below give the same form domain and cohomology.
- For the power vector y^a, weight y^b and its radial differential ay^a, membership in the graph domain is equivalent to a+b<1/2; the critical boundary fails membership.

([Fra98], §2.1, (1)–(7), pp.186–190; §2.2, (1)–(3), pp.190–191.)

*Needs:* ArithmeticLocallySymmetricSpaces ALS.5b.1 (de Rham comparison); AdelicAlgebraicGroups §3.5 (adelic height); §0.17.


### 5.2 Weighted regularization and relative cochains

Prove `weighted_regularization`: at every admissible smooth positive weight p with controlled logarithmic derivatives, the smooth all-derivative weighted de Rham complex computes the distributional graph-complex cohomology of §5.1. At fixed finite K_∞ types, convolution regularization and the Casimir/Sobolev homotopies preserve equivalent weights and give quasi-isomorphisms. Construct these operators with the fixed-weight estimates required for the finite-character acyclicity argument; compatibility with decreasing weights gives the transition maps used below.

Use ArithmeticLocallySymmetricSpaces ALS.5b.1 and ALS.5b.3 to identify the resulting decreasing-weight union with the relative (𝔪_G,K_∞) cochains of uniform moderate-growth smooth functions, tensored with the algebraic coefficient E and the central balancing twist. The union comparison is a supplied theorem. The new assertion is the regularization and homotopy at each fixed weight.

Throughout, E is algebraic, 𝔪_G=𝔤_ℂ/𝔞_G,ℂ and K_∞ is the full possibly disconnected maximal compact group. The derivatives of p obey the admissibility bounds of §5.1.

([Fra98], §2.2 theorem, p.190; §2.3 Theorem 3, p.193; §3 Theorem 4, p.198.)

*Needs:* §5.1; ArithmeticLocallySymmetricSpaces ALS.F.5 (relative cochains), ALS.5b.1 (de Rham comparison) and ALS.5b.3 (moderate-growth comparison).


### 5.3 Finite-infinitesimal-character functor

Construct the abelian category `compatible_module_category` of all complex (𝔪_G,K_∞)-modules with locally finite K_∞ action, compatible infinitesimal compact action and conjugation, without finite generation or admissibility. Construct kernels, cokernels and filtered colimits, enough injectives by the compatible coinduction/locally finite functor, injective resolutions and the comparison maps defining right derived functors. Its Harish-Chandra subcategory is the finite-generation, finite-K-multiplicity restriction of §0.48. Define `finite_character_functor` on this larger category by giving the native module `Ideal.primaryComponent V J` its restricted (𝔪_G,K_∞) action. Here Z=Z(U(𝔪_G)), J is a finite-codimension ideal invariant under the full K_∞, and V has the compatible central action. The restriction is stable under 𝔪_G because its action commutes with Z, and under K_∞ because conjugation preserves J. At J=Ann_Z(E∨) this invariance comes from the algebraic coefficient representation. Derive this functor in the larger compatible-module category, with R^i Fin_J(V)=colim_n Ext_Z^i(Z/J^n,V) carrying the compatible action.

Prove the additional API statements.

- `central_stable`: the 𝔪_G action restricts to the native ideal-power component.
- `compact_stable`: the full K_∞ action restricts, retaining its finite-type condition and its conjugation compatibility with 𝔪_G.
- `forget_primaryComponent`: forgetting the compatible (𝔪_G,K_∞) action recovers exactly the native primary-component submodule and map, so its supplied membership and left-exactness API applies.

**Checks.**

- On the zero compatible module the restricted action and Fin_J module are zero. An infinite direct sum of trivial modules belongs to this category but is not admissible; its finite-character derived functors still have their specified meaning.
- On a one-dimensional central-character module, J equal to its character annihilator gives the whole module; a distinct maximal character ideal gives zero.
- For a compatible two-dimensional module on which one central generator acts by a size-two nilpotent Jordan block, Fin_(X) retains both vectors and the nilpotent action. Restricting to ker X loses one vector and changes the module.
- For a disconnected compact action interchanging two central characters, a single character ideal is not invariant. The full-K_∞ stability theorem requires the invariant ideal or the orbit of character ideals.

([Fra98], §4, (1), p.207, and Theorem 7(1)–(2), p.208; enough injectives and compatible coinduction are the (𝔤,K)-module category of [Vog81], §§6.1–6.2; the module construction and its map/kernel laws are the Mathlib contracts above.)

*Needs:* RepresentationTheory/LieHighestWeight Layer 7 (infinitesimal characters); §0.48 (real reductive representation foundations), Harish-Chandra modules; Mathlib's `Ideal.primaryComponent` and its functorial API.


### 5.4 Derived finite-character and coefficient comparison

Prove `derived_finite_character`. The finite-character functor preserves injective (𝔪_G,K_∞)-modules in the larger category of §5.3 and its derived functors are the filtered Ext groups stated above. If E is a finite-dimensional (𝔪_G,K_∞)-module and J=Ann_Z(E∨), inclusion Fin_J(V)→V induces the relative-cohomology comparison once V is Fin_J-acyclic; in general the comparison is the derived one, with the spectral sequence for R^iFin_J(V), not an unconditional underived equality.

*Standing hypotheses:* finite-dimensional E and J=Ann_Z(E∨); all actions and resolutions use the locally K_∞-finite compatible (𝔪_G,K_∞)-module category of §5.3. No admissibility or finite generation is required on V or its resolution.

([Fra98], §4 Theorem 7(1)–(3), (3)–(4), pp.208–209.)

*Needs:* §5.3; ArithmeticLocallySymmetricSpaces ALS.F.5 (relative-cohomology functoriality).


### 5.5 Franke constant-term filtration

Define `franke_filtration` as follows. For fixed J and an associate parabolic class {P}, every Fin_J uniform-moderate form has finitely many constant-term exponents: f_{N_Q}(g)=Σ_λ exp((ρ_Q+λ)H_Q(g)) f_{Q,λ}(H_Q(g),g), with polynomial height coefficients and smooth Levi functions. Decompose each real exponent as λ=λ₊+λ₋ by Franke’s root/fundamental-weight decomposition (§6 Lemma 1). Let F_J be the finite set of possible (Re λ)₊. Choose T:F_J→ℤ with T(λ)<T(θ) whenever λ≠θ and θ∈λ−closure(positive root cone). Define the descending filtration F_T^i by f_{Q,λ}=0 whenever T((Re λ)₊)<i for every Q. At weighted boundary use S_{p_{−r}+log}=⋃_n S_{w^(−n)p_{−r}} and S_{p_{−r}−log}=⋂_n S_{w^n p_{−r}}, with w the positive logarithmic Siegel height of §5. The filtration is finite and (𝔤,K,G_f)-stable.

*Standing hypotheses:* r in the closed positive chamber; J finite codimensional; all constant terms, not only the minimal one; the ordering function is strictly compatible with the source root cone.

Prove the following API statements.
- `mem_iff`: f∈F_T^i iff every nonzero constant-term coefficient has T((Re λ)₊)≥i.
- `descending`: F_T^(i+1)⊂F_T^i and the filtration has finite length.
- `levi_compatible`: The positive-part decomposition commutes with Levi projection (§6 (6)). Unrelated coefficient maps need not give equal filtrations.

**Checks.**
- If the only exponent weight has T-value j, F_T^i is the whole space for i≤j and zero for i>j.
- The zero vector belongs to every step.
- For two exponent coefficients of one parabolic with T-values zero and one, only the vector supported at exponent one belongs to step one. Parabolic rank alone cannot define the filtration.

([Fra98], §6 (1)–(9), printed pp.232–233.)

*Needs:* §5.3; ArithmeticLocallySymmetricSpaces ALS.F.6 (constant terms); §0.51 (constant-term transitivity); §3.1.


### 5.6 Principal values of meromorphic Eisenstein jets

Define `eisenstein_principal_value` as follows. For a finite set of polar hyperplanes through λ_t choose a transverse direction ξ avoiding each hyperplane. A meromorphic germ f has f(λ_t+zξ)=Σ_{k≫−∞}a_k z^k; define MW_ξ(f)=a₀. Holomorphic jets at λ_t are finite linear combinations of parameter derivatives. Applying MW_ξ to such a derivative of E gives a smooth automorphic principal value. It need not be equivariant as an unfiltered map; in the appropriate Franke graded quotient it is equivariant and independent of ξ.

*Standing hypotheses:* a common finite hyperplane divisor and transverse ξ; target complete locally convex space; graded independence is the theorem below, not part of the raw definition.

Prove the following API statements.
- `holomorphic_eval`: For a holomorphic germ, MW_ξ(f)=f(λ_t).
- `linear`: MW_ξ is linear and commutes with continuous fixed target maps.
- `graded_independent`: The induced Eisenstein-jet map to the prescribed graded quotient is independent of ξ.

**Checks.**
- MW(z⁻¹v+w)=w.
- MW of a constant vector v is v.
- Restrict the same germ (z₁,z₂)↦z₁/z₂ along directions (1,1) and (2,1): the principal values are one and two.

([Fra98], §6 (12)–(13), printed pp.235–236.)

*Needs:* §0.15; §2.4; §5.5.


### 5.7 Eisenstein description of the graded pieces

Prove `franke_graded_isomorphism`. For r in the closed positive chamber, each graded piece F_T^i/F_T^(i+1) of Fin_J S_{p_{−r}+log}^{{P}} is the direct sum over Levi ranks k of the colimit, under Weyl transport, of M(t)=W(u_t)⊗D_t with T(Re λ_t)=i (choose an equivalent shifted ordering so all filtration indices are positive). Here t=(R,Λ,χ) has R containing a member of {P}, continuous central character Λ, infinitesimal character χ in the finite J-support, Re λ_t in the closed positive chamber and in r−closure(positive root cone); u_t=Λ exp(−λ_tH_R) is unitary inducing data, W(u_t) is its induced discrete automorphic module, and D_t is the space of finite-order holomorphic functionals supported at λ_t. The map is MW_ξ applied to the corresponding derivative of E. It is a (𝔤,K,G_f)-isomorphism independent of ξ.

*Standing hypotheses:* all index conditions in Franke §6 (10)–(14), including J-support and weighted exponent bounds; colimit identifies Weyl-isomorphic data, not a free direct sum over repetitions.

([Fra98], §6 Theorem 14, (14), p.236.)

*Needs:* §5.5; §5.6; §4.4.


### 5.7a Finite-character acyclicity of the rapidly decreasing core

Prove `core_finite_character_acyclic`: the all-derivative logarithmically weighted smooth space S_log([G]) of [Fra98] §5 is Fin_J-acyclic in the larger category of §5.3, for finite-codimension invariant J. Construct the Casimir spectral cutoffs and polynomially bounded smooth multiplier estimates of [Fra98] §5.1: each cutoff acts continuously on the all-derivative weighted seminorms, commutes with the compatible actions and provides the finite-character comparison homotopy. Use the split spectral models of [Fra98] §5.3 and the filtered Koszul calculation of its §5.4 on distributions supported at the finite central-character locus to prove R^iFin_J(S_log)=0 for i>0. This is a derived-functor theorem for S_log itself; the boundary consumer uses its inclusion in the weighted spaces and the compatible quotient resolution of §5.9. In the cocompact case all weights are equivalent and this supplies the induction base of §5.8.

**Checks.**

- On a compact quotient the logarithmic weights are bounded above and below; the core is the full smooth K-finite space and the higher Fin_J functors vanish.
- In one spectral coordinate the filtered Koszul complex on distributions at zero retains the finite-order delta derivatives in degree zero and has zero positive cohomology.
- A smooth power y^a on a noncompact cusp need not belong to S_log: its all-log-weight seminorms distinguish this core from an arbitrary smooth growth space.

([Fra98], §5.1 Theorems 8–10, pp.214–219; §5.3 Theorem 12, pp.222–230; §5.4 Theorem 13 and its Koszul proof, pp.230–231.)

*Needs:* §5.3; §5.4; §5.2; §4.3–§4.4; §0.6; §3.4.


### 5.8 Acyclicity of weighted smooth spaces

Prove `weighted_finite_character_acyclic`. For r in the closed positive chamber, R^i Fin_J(S_{p_{−r}+log}([G]))=0 for i>0. For the stronger S_{p_{−r}−log} space the same holds when r lies in the intersection of the closed positive Weyl chamber with the interior of the positive root cone. Passing to the union over sufficiently decreasing weights gives Fin_J-acyclicity of the uniform-moderate-growth smooth space. This acyclicity concerns the derived central torsion functor, not vanishing of every relative Lie algebra cohomology group.

*Standing hypotheses:* finite-codimension J; weights and log modifications as above; the second clause additionally requires r in the interior of the positive root cone.

([Fra98], §7 Theorem 16, p.246.)

*Needs:* §5.4; §5.7; §5.7a; §5.9; §3.4.


### 5.9 Acyclic parabolic constant-term resolution

Prove `constant_term_resolution`. Let S_c be the weighted smooth functions whose P-constant terms vanish in every sufficiently deep P-cusp. For the finite poset of proper standard parabolics, the constant-term map S_p([G])/S_c([G])→lim_P S_p[P] is an isomorphism and R^i lim_P S_p[P]=0 for i>0, with the restriction maps and their compatible weights specified by Franke §7.1. The associated finite alternating parabolic complex therefore resolves that quotient. For the logarithmic modifications of §5.8, construct the compatible quotient boundary resolutions of S_{p_{−r}+log}/S_log and S_{p_{−r}−log}/S_log, with the corresponding Levi weights and constant-term transition maps. Compare these diagrams through S_c⊆S_log rather than identifying the two spaces. These are the boundary complexes used in the Fin_J induction.

*Standing hypotheses:* admissible weights; the constant-term transition maps; functions are finite-level and K-finite as in Franke.

([Fra98], §7.1 Theorem 17, (2)–(3), p.247; §7.2, pp.249–252 for the logarithmic quotient diagrams.)

*Needs:* §5.1; §5.5; §3.3.


### 5.10 Franke ordinary-cohomology comparison

Prove `franke_comparison`. For a connected reductive number-field group, algebraic finite-dimensional E, and finite level K_f, the inclusions A_J([G])=Fin_J S_umg([G])→S_umg([G])→C∞([G]) induce isomorphisms on H^q(𝔪_G,K∞;−⊗E) when J=Ann_Z(E∨), the central annihilator of the contragredient coefficient module. Through the ArithmeticLocallySymmetricSpaces ALS.5b de Rham comparison this equals ordinary H^q(X_K,𝓔), with the split-central balancing twist and full disconnected K∞ invariants. The isomorphisms are compatible with level changes and finite Hecke correspondences. This is ordinary cohomology; replacing it by cusp or L² cohomology would change the theorem.

*Standing hypotheses:* algebraic E; the finite-level neat/orbifold conventions of ArithmeticLocallySymmetricSpaces ALS.5b; 𝔪_G removes the split-center Lie algebra; coefficient central character is balanced.

([Fra98], §7.4 Theorem 18, pp.255–256.)

*Needs:* §5.2; §5.8; §5.4; §5.9; ArithmeticLocallySymmetricSpaces ALS.5b.1 (de Rham comparison); ArithmeticLocallySymmetricSpaces ALS.F.6 (smooth automorphic forms).


### 5.11 GLₙ and SLₙ cuspidal cohomology diagram

Prove `gl_sl_cuspidal_diagram`. At level one and trivial algebraic coefficients, the BCG diagram compares ⊕_πH*(𝔰𝔩_n,O(n);π∞) with H*_cusp(GL_n(ℤ),ℂ), and the corresponding SO(n) sum with H*_cusp(SL_n(ℤ),ℂ). The top is the O(n)/SO(n)-invariant part of the bottom. For odd n the two cusp cohomologies agree; for even n, the SO(n) cohomology of the unique tempered cohomological archimedean constituent is free over ℂ[ℤ/2], giving dim H*_cusp(SL_n)=2 dim H*_cusp(GL_n). Nonvanishing is equivalent to a level-one weight-zero cusp π. In the displayed sums multiplicity one and one-dimensional spherical finite vectors are the GL_n inputs.

*Standing hypotheses:* level-one GL_n/Q, trivial coefficients; algebraic cohomological weight-zero convention; full O(n), not just its identity component.

([BCG25], Remark 1.2, pp.511–512.)

*Needs:* ArithmeticLocallySymmetricSpaces ALS.5b.5 (cuspidal cohomology); §0.48 (real reductive representation foundations).


### 5.12 Franke–Schwermer cuspidal-support decomposition

Prove `franke_schwermer_support`. For finite-codimension J, the space A_J(G) of automorphic forms decomposes algebraically as a direct sum over associate classes of parabolics and Weyl-associate cuspidal data on their Levis, generated by Laurent coefficients and derivatives of the corresponding cuspidal Eisenstein series with infinitesimal character in J-support. The resulting relative-cohomology decomposition is Hecke compatible. For a general reductive group this is a cuspidal-support decomposition; the phrase isobaric automorphic representation is reserved for the GL_n specialization.

*Standing hypotheses:* fixed J and central balancing; every coefficient belongs to the automorphic space; Weyl equivalence includes cuspidal data.

([Mun], §2.1, (2.1.1) and Theorem 2.1.1, pp.14–15, states the general-group decomposition and identifies its cuspidal summand, with attribution to Franke–Schwermer. The GLₙ application is [CGH20], §3, proof of Lemma 3.1.)

*Needs:* §5.7; §5.10; §1.9.


### 5.13 Isobaric realization of GLₙ cohomology eigenclasses

Prove `isobaric_realization`. For an ordinary cohomology Hecke eigenclass of the arithmetic quotient of Res_{F/ℚ}PGL_n with algebraic coefficients over ℂ, its unramified Hecke eigenvalues outside a finite set are those of an isobaric GL_n automorphic representation, obtained from a cuspidal-support summand of the Franke–Schwermer decomposition. The class may be Eisenstein; the theorem does not force that isobaric representation to be cuspidal or tempered. For a general reductive group the conclusion is realization in a cuspidal-support Eisenstein module, not an undefined general-group isobaric sum.

*Standing hypotheses:* complex algebraic coefficients; anemic unramified Hecke eigenclass; GL_n/PGL_n central convention; no assertion about torsion classes.

([CGH20], §3, proof of Lemma 3.1, p.5 gives the weight-zero application; [Fra98], §7.6, Theorem 20, p.261 supplies the GLₙ cohomological classification used for algebraic coefficients.)

*Needs:* §5.12; §2.14.


### 5.14 Kostant weights in proper cuspidal-support cohomology

Prove `franke_support_weights` for a connected reductive G over a number field F, neat finite level K and irreducible finite-dimensional complex algebraic V_λ. Fix J=Ann_Z(V_λ∨), the A_∞-character ζ_V, 𝔪_G=𝔤/𝔞_G, the full K_∞ and the balanced finite-adelic Hecke action. Let S contain the places where the group or level is ramified, and let H(G^S,K^S) be the unramified Hecke algebra. For every proper associate class {P}, every Hecke eigensystem occurring in

```text
H^q(𝔪_G,K_∞; 𝒜_{J,{P}}(G)^K ⊗ V_λ)(ζ_V)
```

is the eigensystem of the unnormalized finite-adelic induction Ind_{P(𝔸^∞)}^{G(𝔸^∞)}σ^∞ of a cuspidal automorphic representation σ of L_P(𝔸). Its infinitesimal character is that of (V^{L_P}_{w·λ})∨, where w·λ=w(λ+ρ)−ρ, ρ is half the G-positive roots and w∈W^P is a Kostant representative taking dominant G-weights to dominant L_P-weights. Representatives of {P} and cuspidal data are transported together. This is an eigensystem assertion, not an isomorphism of the whole cohomology module with one induction and not a cuspidality assertion for G.

Derive this target from the cuspidal-support decomposition and Franke's finite filtration, refined by cuspidal data. Use its induced jet modules and their relative-cohomology spectral sequence; arbitrary quotients of a jet module do not justify a cohomology surjection. If a residual datum occurs at an intermediate Levi, resolve it into cuspidal Eisenstein residues and apply induction in stages before extracting the Hecke eigensystem. The induced-jet calculation in [Mun], §2.2, Theorem 2.2.3, pp.22–24 forces χ_π to have representative −w(λ+ρ). Rewrite normalized induction of π as unnormalized induction of σ=δ_P^(1/2)π. Since ρ=ρ_{L_P}+ρ_P, the dual of the L_P-highest-weight module with weight w·λ has infinitesimal-character representative −w(λ+ρ)+ρ_P, modulo the Levi Weyl group. This equals χ_σ=χ_π+ρ_P. The filtration spectral sequence then gives the eigensystem assertion with the central balancing twist included throughout. No claim that π itself has the algebraic weight of σ is made.

The general-group statement is the corollary to be proved from this filtration and weight calculation. Franke's §7.6, p.261 specializes to GLₙ; it is not cited as a theorem for all G. The GLₙ calculation and the conversion to unnormalized induction are explicit in [ACC+23], §2.4.9, proof of Theorem 2.4.10, pp.949–950; the unitary application appears in the proof of Theorem 2.4.11, pp.952–953. The filtration is [Fra98], §6 Theorem 14, p.236, and the cohomological spectral sequence is §7.4, (1)–(4), p.256. For general groups, [Mun], §2.1, Theorems 2.1.1 and 2.1.4, pp.15, 17–18 gives the cuspidal-data decomposition and refined graded pieces, and §2.2, Theorem 2.2.3, pp.22–24 computes induced cohomology. Apply the rational-group statements to Res_{F/ℚ}G. Its allowed K′_∞ includes the full K_∞; alternatively take invariants of the finite component group over ℂ. The split-central convention is transported by the fixed ζ_V twist. These inputs, together with ArithmeticLocallySymmetricSpaces ALS.4.5, give the stated proof route.

Combining `franke_comparison`, `franke_schwermer_support` and `franke_support_weights` proves `franke_input`: respectively clauses (a), (b) and (c) of `LocallySymmetric.FrankeInput(G,K,V_λ)` in ArithmeticLocallySymmetricSpaces ALS.5b.4. In clause (b) the {G}-summand is exactly the J-finite cusp forms. The conclusion is Hecke compatible and respects finite-level pullback.

**Checks.**

- For P=G, Kostant has W^P={1} and w·λ=λ. This tests the weight convention, while the proper-support assertion excludes this cuspidal summand.
- For GL₂ with λ=0 and P=B, Kostant's weights are 0 and −α. On the diagonal torus the nontrivial representative gives (−1,1); dualizing gives (1,−1). Omitting either ρ or the dual changes these weights.
- For a trivial coefficient GL₂ Eisenstein eigensystem, unnormalized induction from trivial Levi characters gives the spherical Hecke value 1+q_v. Normalized induction requires the compensating half-modulus twist; identifying the two inducing representations loses this value.
- When G is anisotropic modulo its centre there is no proper rational parabolic. The support decomposition has only {G}, and the comparison gives Matsushima's formula.

*Needs:* §§5.7, 5.10, 5.12; §§1.1, 2.6, 4.4; ArithmeticLocallySymmetricSpaces ALS.4.5 and ALS.F.5–ALS.F.6; the normalized-induction and induction-in-stages supplier contracts.

### Examples

On a hyperbolic cusp, y^a with weight y^b belongs to the graph complex exactly when a+b<1/2; the critical equality gives logarithmic divergence. The finite-character functor on a two-step nilpotent Jordan module is the whole module even though the first power of (X) does not annihilate it. Principal values of z₁/z₂ along (1,1) and (2,1) are one and two; direction independence holds only after passing to the specified graded quotient. For GL₂ the nontrivial Kostant weight for λ=0 is (−1,1), with dual (1,−1), and unnormalized finite induction retains the Eisenstein Hecke value 1+q_v.

### Dependencies

Use ALS.F.5 relative cochains, ALS.F.6 growth spaces and constant terms, ALS.5b.1 de Rham and ALS.5b.3 moderate-growth comparison. Weighted regularization at a fixed weight, central-ideal torsion and the finite constant-term filtration feed the Eisenstein graded-piece theorem. Layer 2 continuation and Layer 4 residual completeness supply its analytic inputs; acyclicity and the boundary resolution feed Franke's central-finite comparison. ALS.4.5 Kostant theory and the cuspidal-support jet filtration give the proper-support weight statement. The resulting `franke_input` is a theorem here and is the hypothesis consumed by ALS.5b.4.

## Layer 6: Paley–Wiener theory and trace distributions

### 6.1 Real invariant Paley–Wiener theorem

Prove `real_invariant_paley_wiener`. For a real reductive algebraic group G with maximal compact K and radius r>0, the trace transforms of smooth bi-K-finite functions supported in the radius-r ball are exactly the collections F_i(δ,ν) on basic representations induced from limits of discrete series of Levi subgroups satisfying: finite support in δ; entire scalar Paley–Wiener bounds of type r in ν; K-conjugacy/Weyl invariance; and every induction-in-stages additivity relation (iv) of Clozel–Delorme Theorem 1. The LF image carries the quotient topology. All four conditions are required; a Weyl-invariant entire function alone is insufficient.

*Standing hypotheses:* the real reductive setting, basic representations and Haar, norm and radius conventions of Clozel–Delorme §0; holomorphic finite-K-type matrix coefficients.

([CD90], §0 Theorem 1(i)–(iv), pp.194–195; §5 Theorem 1′.)

*Needs:* §0.11; §0.48 (normalized real induction); §0.49 (smooth Fréchet globalizations).


### 6.2 Real operator Paley–Wiener theorem

Prove `real_operator_paley_wiener`. For Arthur’s real reductive group G and K, Fourier transformation f↦{I_B(σ,λ,f)} is a topological algebra isomorphism C_c^∞(G,K)→PW(G,K). At fixed radius N and finite K-type set Γ it identifies C_N^∞(G)_Γ with PW_N(G)_Γ: entire finite-dimensional operator families with all seminorms sup e^(−N||Re λ||)(1+||λ||)^n||F_B(σ,λ)|| finite and all differential matrix-coefficient relations (III.4.1) inherited from the induced representations. The relations include derivatives, not just ordinary intertwining covariance.

*Standing hypotheses:* the representation, radius and finite-K-type conventions of [Art83PW], III §4; holomorphic finite-dimensional matrix-coefficient spaces.

([Art83PW], III §4 Theorem 4.1, pp.84–85.)

*Needs:* §0.14; §0.11; §0.49 (smooth Fréchet globalizations); §0.48 (normalized real induction).


### 6.3 Arthur spectral multipliers

Define `spectral_multiplier` as follows. For a compactly supported W-invariant distribution γ on the real Cartan space h, and f∈C_c^∞(G,K), construct the unique f_γ with π(f_γ)=γ̂(ν_π)π(f) for every irreducible admissible π. A radius-N input and radius-N_γ distribution give radius≤N+N_γ output with the same finite K-types. The multiplier is a continuous convolution-central endomorphism of the Hecke LF space.

*Standing hypotheses:* real reductive group; infinitesimal character ν_π as a W-orbit; Fourier–Laplace convention γ̂(ν)=γ(exp⟨ν,·⟩).

Prove the following API statements.
- `character`: π(f_γ)=γ̂(ν_π)π(f) for every irreducible admissible π, with ν_π its infinitesimal-character W-orbit.
- `composition`: (f_γ)_η=f_(γ*η).
- `support`: A radius N input and radius N_γ multiplier have output supported in radius N+N_γ, with the same K-types.

**Checks.**
- The Dirac distribution at 0 acts as identity.
- For the distribution whose transform is the Harish-Chandra polynomial p_z, f_γ=zf.
- The zero distribution sends every f to zero.

Prove the growth step `spectral_multiplier_growth`: a symbol bounded by C e^(R|Re s|)(1+|s|)^d maps radius-r rapid decay to radius r+R, using the input seminorm n+d. The operator-family proof must also preserve every differentiated relation (III.4.1) and fixed K-types before applying the radius-preserving inverse transform. Spatial support uses the full transform.

**Checks of the growth bound.**

- The polynomial symbol (1+s)^d retains the radius and consumes d additional decay powers.
- For real a, multiplication by exp(as) gives exponential-type upper bound r+|a|; the minimal centered type may decrease. The support-closure [−1,0] bump of §1.6, multiplied in the transform by exp(−s/2), has type 1/2 instead of 1.
- The zero symbol gives the zero family at every radius.

([Art83PW], III §4 Theorem 4.2 and its proof, pp.86–87.)

*Needs:* §6.2; §0.12.


### 6.4 Automorphic convolution kernels

Define `automorphic_kernel` as follows. For f∈C_c^∞(G(𝔸)^1), define K_f(x,y)=Σ_{γ∈G(F)}f(x⁻¹γy), the kernel of right convolution on [G]^1=G(F)\G(𝔸)^1. For P=MN define K_{P,f}(x,y)=∫_{N_P(𝔸)}Σ_{γ∈M_P(F)}f(x⁻¹γny)dn. Geometric summation uses the semisimple-part equivalence classes o, while spectral projection uses Weyl-cuspidal classes χ. The two kernels have distinct indices and must not be identified term by term.

*Standing hypotheses:* connected reductive number-field G; rational quotient, Haar and N(F)\N(𝔸) volume-one conventions; smooth finite-level compact support.

Prove the following API statements.
- `operator`: R(f)u(x)=∫_[G] K_f(x,y)u(y)dy on smooth compactly supported quotient functions.
- `constant_term`: The parabolic kernel is obtained by the indicated unipotent integral and rational Levi sum.
- `adjoint`: For a rational index family equipped with an explicit inversion reindexing j↦j⁻¹, K_{f*}(x,y)=conj K_f(y,x).

**Checks.**
- For finite G(F) inside a finite group, unfolding gives the usual finite convolution matrix.
- For G=ℝ with the trivial lattice, K_f(x,x)=f(0) is constant, so the diagonal is not integrable over the infinite-volume quotient unless f(0)=0.
- For an inversion-stable rational index family with explicit bijective inversion reindexing and f(g)=conj f(g⁻¹), the periodized kernel is Hermitian.

([Art05], §4, (4.1), p.23 and §14, spectral kernels preceding Theorem 14.1, pp.72–74.)

*Needs:* AdelicAlgebraicGroups §2.3 (automorphic quotient measure); AdelicAlgebraicGroups §§3.4, 3.6 (Siegel covering); §4.2.


### 6.5 Coarse truncated trace kernels

Define `coarse_truncated_kernel` as follows. For a positive regular T, define k_f^T(x)=Σ_{P⊃P₀}(−1)^dim(a_P/a_G)Σ_{δ∈P(F)\G(F)}τ̂_P(H_P(δx)−T)K_{P,f}(δx,δx). Keeping only a geometric class o or spectral class χ defines k_o^T or k_χ^T. Its integral J^T(f) is a regularized trace, not the ordinary trace of R(f) on noncompact [G]. At fixed f the class integrals are polynomials of degree≤dim(a₀/a_G) for sufficiently regular T.

*Standing hypotheses:* number-field test function and measures above; dual-weight open cone indicators, all standard parabolics including G; T sufficiently regular relative to supp f.

Prove the following API statements.
- `decomposition`: k_f^T=Σ_o k_o^T=Σ_χ k_χ^T with the absolute integrated convergence theorem.
- `levi_translation`: Translation of T is expressed using Γ′-cone integrals and constant-term test functions on Levis.
- `canonical_value`: J(f) is the polynomial J^T(f) evaluated at Arthur’s distinguished point T₀, not its leading coefficient.

**Checks.**
- With only the whole-group parabolic, the coarse_truncated_kernel equals the original kernel diagonal.
- In the constant-term logarithmic cusp model, the two-parabolic truncated diagonal is integrable on positive heights and its integral is T for T≥0, a degree-one polynomial.
- f=0 gives k_f^T=0 and J^T(f)=0.

([Art05], §6, (6.1), pp.29–30; §9, Theorem 9.1, p.46; §14, (14.2), p.74.)

*Needs:* §6.4; §3.1; §3.17a (Γ′ and Levi translation); AdelicAlgebraicGroups §3.5 (adelic height).


### 6.6 Coarse trace formula

Prove `coarse_trace_identity`. For f∈C_c^∞(G(𝔸)^1) and T sufficiently regular relative to supp f, Σ_o∫|k_o^T| and Σ_χ∫|k_χ^T| are finite, and Σ_o J_o^T(f)=J^T(f)=Σ_χ J_χ^T(f). Each spectral class integral is also ∫_[G] Λ₂^T K_χ(x,x)dx. Polynomial evaluation at T₀ gives Σ_o J_o(f)=Σ_χ J_χ(f). This compares the class totals, without a bijection between o and χ.

*Standing hypotheses:* number-field G, smooth compact support at fixed finite level; sufficiently regular truncation; consistent quotient measures.

([Art05], §14 Theorem 14.1, pp.74–77; §16 (16.1), pp.88–89.)

*Needs:* §6.5; `MeasureTheory.integral_tsum`.


### 6.7 Arthur (G,M)-families

Define `gm_family` as follows. Fix G,M and Haar measure on a_M^G. A (G,M)-family consists of smooth c_P:ia_M*→ℂ, P∈P(M), agreeing on shared adjacent walls. Set θ_P(λ)=vol(a_M^G/ℤΔ_P∨)⁻¹∏_{α∈Δ_P}λ(α∨). Off walls, c_M(λ)=Σ_P c_P(λ)/θ_P(λ); cancellation gives a smooth extension and c_M=c_M(0). Use the coroots and covolumes. Levi/parabolic restriction gives families for splitting/descent; likewise for operator-valued families.

*Standing hypotheses:* finite rational parabolic/root data; smoothness on the imaginary real vector space; coroot lattice covolume and fixed Haar.

Prove the following API statements.
- `wall`: Adjacent c_P,c_P′ have identical restrictions to the common wall.
- `product`: Pointwise multiplication and restriction produce (G,M)-families.
- `regularized_sum`: c_M is the unique smooth extension of Σ_P c_P/θ_P, evaluated at zero.

**Checks.**
- For a genuine one-member gm_family with no walls, the regularized zero value equals its member at zero.
- For a genuine two-member family with agreement on the shared wall, the full regularized sum has limit c₊′(0)−c₋′(0), and its zero-value construction has that value.
- No gm_family on a domain containing the shared wall can have constant members one and zero on the adjacent parabolics.

([Art05], §17 definition and Lemma 17.1, pp.93–94.)

*Needs:* §3.1; §0.14.


### 6.8 Splitting and descent of Arthur families

Prove `gm_splitting`. For compatible (G,M)-families, (cd)_M=Σ_{Q∈F(M)}c_M^Q d_Q′. Independence of c_M^L from Q∈P(L) reduces this to Σ_{L∈L(M)}c_M^L d_L. The descent/splitting coefficient d_M^G(L₁,L₂) is zero unless a_M^{L₁}⊕a_M^{L₂}→a_M^G is an isomorphism, and otherwise is its determinant with fixed measures. Local products yield weighted orbital/character splitting with normalized Levi constant terms.

*Standing hypotheses:* smooth wall-compatible families; the indicated independence for the shorter Levi-only sum; the section selecting Q₁,Q₂ and all measures of [Art05], §17.

For two chambers with θ±(z)=±z and common wall values c₀,d₀, (cd)_M=c_M d₀+c₀ d_M, and for c±(z)=b+a±z one has c_M=a₊−a₋.

**Checks.**
- Equal slopes a₊=a₋ give c_M=0.
- With c₊(z)=3z, c₋(z)=z and θ±(z)=±z, c_M=2; omitting the denominators gives 4z, with the finite but incorrect limit zero.
- Wall values 2 and 5 with slope pairs (3,1) and (7,4) give (cd)_M=2·5+2·3=16; with both wall values 1, (cd)_M is the sum of the two slope differences.

([Art05], §17 Lemmas 17.4–17.6, (17.8), (17.12)–(17.14), pp.97–101; two chambers use Lemma 17.1, p.94, and the derivative product rule.)

*Needs:* §6.7; §3.1.


### 6.9 Invariant orbital integrals

Define `orbital_integral` as follows. Let S be a finite set of places, G(F_S)=∏_{v∈S}G(F_v) and γ∈G(F_S). The connected centralizer G_γ is the product of the identity components of the centralizers of the γ_v, and G_{γ,+}⊇G_γ is the full centralizer. G_γ(F_S) is unimodular, so Haar measures on G(F_S) and G_γ(F_S) give a right-invariant measure dx on G_γ(F_S)\G(F_S). For f∈C_c^∞(G(F_S)) put O_γ(f)=∫_{G_γ(F_S)\G(F_S)}f(x⁻¹γx)dx and J_G(γ,f)=|D(γ)|^{1/2}O_γ(f), with D(γ)=∏_v det(1−Ad(σ_v))|_{𝔤/𝔤_{σ_v}} for σ_v the semisimple part of γ_v. The map x↦x⁻¹γx is onto the class of γ with fibres G_{γ,+}(F_S)/G_γ(F_S). For every γ, semisimple or not, dx defines a G(F_S)-invariant Radon measure on the class, so O_γ is a continuous invariant distribution; for semisimple γ the class is closed.

*Standing hypotheses:* G connected reductive over F; characteristic-zero local fields; fixed Haar measures on G(F_S) and on each centralizer.

Prove the following API statements.
- `quotient_measure`: O_γ is linear in the quotient measure; scaling the centralizer measure by c scales both by c⁻¹.
- `invariant`: O_γ(f^y)=O_γ(f) for f^y(x)=f(yxy⁻¹), and O_{yγy⁻¹}(f)=O_γ(f) with the transported centralizer measure.
- `fibre_card`: each fibre of x↦x⁻¹γx has [G_{γ,+}(F_S):G_γ(F_S)] points.

**Checks.**
- For central γ, matching the centralizer Haar to the ambient Haar gives quotient-point mass one, O_γ(f)=f(γ) and D(γ)=1. Doubling only the centralizer Haar instead gives O_γ(f)=f(γ)/2.
- If G is a torus and its centralizer Haar is the ambient Haar, O_γ(f)=f(γ) for all γ; otherwise retain the quotient-point mass.
- in PGL₂(ℝ), γ=diag(1,−1) has [G_{γ,+}:G_γ]=2 (the antidiagonal element), so integrating over G_{γ,+}\G instead halves O_γ.

([Art05], §18, pp.102–104 (connected centralizer, unimodularity, the Deligne–Ranga Rao invariant measure and the discriminant of (18.3)), citing R. Ranga Rao, Ann. of Math. 96 (1972), 505–510.)

*Needs:* AdelicAlgebraicGroups Layer 0, §§0.1–0.3 (restricted Haar products); AdelicAlgebraicGroups §2.2.


### 6.10 Weighted orbital integrals

Define `weighted_orbital_integral` as follows. For γ∈M(F_S) with connected G_γ=M_γ, define J_M^G(γ,f)=|D^G(γ)|^(1/2)∫_{G_γ(F_S)\G(F_S)} f(x⁻¹γx)v_M(x)dx. Here v_M is the zero value of the family exp(−λH_P(x)), hence the volume of the convex hull of {−H_P(x)} in a_M^G. For arbitrary γ use the canonical induced-class measure/central-shift limit of Arthur Theorem 18.2, not the same integral when the centralizer condition fails. The unweighted integral and its quotient measure are §6.9; this construction adds the weight, its estimates, splitting and descent.

*Standing hypotheses:* local/product-local connected centralizers, compatible Haar quotient and coroot covolumes; smooth compact support; absolute convergence before identifying a distribution.

Prove the following API statements.
- `weight`: v_M(x)=lim_(λ→0)Σ_P exp(−λH_P(x))/θ_P(λ).
- `full_levi`: J_G(γ,f)=|D^G(γ)|^(1/2)O_γ(f), the integral of §6.9.
- `splitting`: For two place sets, J_M is Σ d_M^G(L₁,L₂)J_M^{L₁}(γ₁,f₁,Q₁)J_M^{L₂}(γ₂,f₂,Q₂).

**Checks.**
- M=G gives weight 1.
- In rank one, if −H_P(x) and −H_P̄(x) differ by r≥0 times the coroot and a_M^G/ℤα∨ has volume vol, then v_M(x)=r·vol, the measure of the segment they span; a weight defined without the covolume factor fails this.
- Scaling the centralizer Haar by c scales the quotient integral by c⁻¹; the global centralizer-volume coefficient scales by c and cancels it.

([Art05], §18, (18.3), p.104; (18.10), p.107; Theorem 18.2, p.108.)

*Needs:* §6.9; §6.7; §6.8.


### 6.11 Normalized weighted characters

Define `weighted_character` as follows. Fix π unitary on M(F_S), reference P∈P(M) and normalized local intertwiners R_(Q|P):I_P→I_Q, with R_(P|P)=1. The family ℛ_Q(Λ,π_λ)=R_(Q|P)(π_λ)⁻¹R_(Q|P)(π_(λ+Λ)) has wall compatibility. Its regularized zero value ℛ_M uses §6.7's coroot denominators and gives J_M(π_λ,f)=tr(ℛ_M(π_λ,P)I_P(π_λ,f)). Fourier integration over ia_M,S*/ia_G,S* defines J_M(π,X,f), where Z=H_G(X) and f is restricted to height Z. The definition for nonunitary data uses the specified finite contour combination; no pole-free unitary formula is asserted there.

*Standing hypotheses:* S has Arthur’s closure property; fixed finite K-types of f; analytic unitary-axis normalized intertwiners; quotient Haar/Fourier dual measures.

Prove the following API statements.
- `trace`: J_M(π_λ,f)=tr(ℛ_M(π_λ,P)I_P(π_λ,f)).
- `full_levi`: For M=G, ℛ_G=1 and J_G is the ordinary character.
- `parabolic_independence`: Conjugating by normalized R identifies the definitions for different P, so their traces agree.
- `weighted_character_rank_one_scalar`: For scalar R differentiable at λ with R(λ)≠0 and scalar test operator a, lim_(z→0)[1/z+R(λ)⁻¹R(λ+z)/(−z)]a=−R(λ)⁻¹R′(λ)a, with the punctured limit in the unit-covolume coroot coordinate.

**Checks.**
- M=G recovers tr π(f).
- In rank one, fix reference P, its simple root α, z=Λ(α∨) and coroot-lattice covolume one, so θ_P(z)=z and θ_P̄(z)=−z. On a finite-dimensional compact-picture space take differentiable, invertible R(λ)=R_(P̄|P)(π_λ):I_P→I_P̄, with R′ differentiating in λ(α∨) at fixed central parameter. Then ℛ_P(z)=1 and ℛ_P̄(z)=R(λ)⁻¹R(λ+z), so J_M(π_λ,f)=−tr(R(λ)⁻¹R′(λ)I_P(π_λ,f)).
- With this reference P and coordinate, on a one-dimensional space with I_P(π_λ,f)=1, R(λ)=exp(λ) gives ℛ_P(z)=1 and ℛ_P̄(z)=exp(z), whose regularized weighted trace is −1 at λ=0. Taking R≡1 gives zero. Both intertwiners are unitary on the imaginary axis.

([Art05], §21, (21.11)–(21.16), pp.135–137; §23, (23.1)–(23.2), pp.146–148.)

*Needs:* §2.3; §6.7; §0.9.


### 6.12 Fine geometric expansion

Prove `fine_geometric_expansion`. Given a compact support neighborhood Δ⊂G(𝔸)^1, there is S_Δ such that for every S⊃S_Δ and f supported in Δ at S with spherical unit outside S, J(f)=Σ_M |W₀^M|/|W₀^G| Σ_{γ∈(M(F))_(M,S)}a^M(S,γ)J_M(γ,f). Each inner sum is finite. The coefficients are defined from unipotent distributions in connected semisimple centralizers and their volume/descent factors; they depend on S and the equivalence class. They are not all ordinary centralizer volumes.

*Standing hypotheses:* number field; sufficiently large S depending on support and ramification; Arthur connected-centralizer and (M,S)-equivalence conventions.

([Art05], §19, Theorem 19.1, p.110; Theorem 19.2, p.113; Corollary 19.3 and (19.10), p.115.)

*Needs:* §6.6; §6.10; §6.8.


### 6.13 Fine spectral expansion

Prove `fine_spectral_expansion`. For f in the adelic bi-K-finite Hecke algebra H(G), J(f)=Σ_{t≥0}Σ_{M,L⊃M}Σ_{s∈W^L(M)_reg} (|W₀^M|/|W₀^G|)|det(s−1)|_(a_M^L)⁻¹ ∫_(ia_L*/ia_G*) tr(ℳ_L(λ,P)M_P(s,0)I_(P,t)(λ,f))dλ, with ℳ_L the regularized family built from global M. Decomposing M=rR separates global logarithmic r-derivatives and local normalized weighted characters. For each t all displayed integrals converge absolutely; Σ_t|J_t(f)|<∞. Joint absolute convergence after taking the absolute value inside every t-integral is not supplied. The L=G terms include singular continuous contributions as well as the genuine discrete spectrum. The Jacobian acts on a_M^L, as in [Art05], (21.5) and Corollary 21.3, and [Art88G], p.520.

*Standing hypotheses:* number-field connected reductive G; f∈H(G), including finite archimedean K-types; quotient determinant space a_M^L and its Haar; t=minimum-norm imaginary infinitesimal-character height.

([Art05], §21, Theorem 21.6, p.137, and Corollary 21.7, p.138, with Remarks 3–4; (21.5), p.130; Corollary 21.3, p.134. [Art88G], Theorem 4.4, and the first coefficient in its proof, p.520.)

*Needs:* §6.3; §6.11; §6.6; §3.6; §2.5.


### 6.14 Almost compact invariant Fourier spaces

Define `almost_compact_test_space` as follows. For S with the closure property (an archimedean place, or only finite places of one residual characteristic), a_G,S=H_G(G(F_S)) is closed. H_ac(G)_Γ consists of functions with fixed finite K-types Γ for which f(x)b(H_G(x))∈H(G)_Γ for every compactly supported smooth b on a_G,S. I_ac(G)_Γ consists of character-side functions φ(π,Z), satisfying φ(π_λ,Z)=exp(λZ)φ(π,Z), for which φ b lies in the invariant Fourier image I(G)_Γ for every such b. Take the LF union in Γ. The weighted Fourier map φ_M(f)(π,X)=J_M(π,X,f) is continuous H_ac(G)→I_ac(M).

*Standing hypotheses:* tempered π on G(F_S); central Fourier dual quotient ia_G*/ia_G,S∨, with periods 2πℤ; the invariant PW image, not all functions on tempered representations.

Prove the following API statements.
- `cutoff`: Membership means every compact smooth height cutoff belongs to the same Γ piece of H or I.
- `height_covariance`: φ(π_λ,Z)=e^(λZ)φ(π,Z).
- `weighted_fourier`: φ_M(f)(π,X)=J_M(π,X,f), a continuous linear map into I_ac(M).

**Checks.**
- H(G) embeds into H_ac(G).
- If a_G=0 then H_ac(G)=H(G), and likewise for I.
- A smooth coefficient family can have compact support per K-type and finitely many types at each height, yet involve all labels within one compact height interval. No fixed finite-type almost-compact space contains it.

([Art05], §23 pp.146–148 and Proposition 23.1.)

*Needs:* §6.11; §6.1.


### 6.15 Invariantization by Levi recursion

Define `invariant_recursion` as follows. Define I_M^G(γ,f)=J_M^G(γ,f)−Σ_{L⊃M,L≠G}Î_M^L(γ,φ_L(f)) and the parallel I_M^G(π,X,f) with the same lower-Levi subtraction. Define I^G(f)=J^G(f)−Σ_{L≠G}(|W₀^L|/|W₀^G|)Î^L(φ_L(f)). Hats mean factoring a distribution through the invariant character image, not choosing a representative test function. Simultaneous induction proves conjugation invariance and annihilation of every test function with zero character transform, so every subtraction is well-defined.

*Standing hypotheses:* S has closure property; H_ac domain; induction on proper Levis; character support is proved for these distributions, not assumed for all invariant distributions.

Prove the following API statements.
- `recursion`: The defining subtraction uses every proper Levi L containing M.
- `invariance`: Matching the conjugation defect of J with the weighted lower-Levi defects gives I(conjugate f)=I(f); the distribution construction supplies this compatibility.
- `character_support`: J=Î∘transform+Σ_L weight_L·lower_L∘φ_L implies I=Î∘transform, so transform f=0 implies I(f)=0.

**Checks.**
- I_G(γ,f)=J_G(γ,f) and I_G(π,Z,f)=tr π(f^Z).
- Construct J from a character-image functional plus the lower-Levi correction; invariant_recursion then vanishes when transform f=0.
- The global GL₂ recursion (23.10) has proper-Levi Weyl coefficient 1/2; the local I_M^G recursion (23.3) has coefficient one.

([Art05], §23, Theorems 23.2–23.3, (23.3)–(23.4), p.149; the global recursion (23.10), p.151.)

*Needs:* §6.10; §6.14; §6.6.


### 6.16 Invariant trace formula

Prove `invariant_trace_formula`. For f∈H(G), I(f)=lim_S Σ_M (|W₀^M|/|W₀^G|)Σ_{γ∈Γ(M)_S}a^M(γ)I_M(γ,f)=lim_T Σ_M (|W₀^M|/|W₀^G|)∫_{Π(M)_T}a^M(π)I_M(π,f)dπ. The geometric limit stabilizes for S sufficiently large depending only on support and ramification, and is finite. For each height bound T the spectral integral converges absolutely and the limit equals Σ_t I_t(f). The weak multiplier estimate is Σ_{t>T}|I_t(f_α)|≤C exp(kT) sup_{ν∈h_u*(r,T)}|α̂(ν)|, with C,k,r depending on f and α supported in a fixed-radius Cartan ball. This does not assert joint absolute convergence of every spectral term.

*Standing hypotheses:* number-field connected reductive G; adelic K-finite Hecke input; consistent normalizing factors, determinants and measures.

([Art05], §23, Theorem 23.4, (23.11)–(23.13), pp.151–152; [Art88G], §§3–6.)

*Needs:* §6.15; §6.12; §6.13; §6.3.


### 6.17 Trace formula for compact quotients

Prove `compact_trace_specialization`. If G(F)\G(𝔸)^1 is compact (equivalently G has no proper F-parabolic), smooth compactly supported convolution is trace class and its trace equals ∫_[G]K_f(x,x)dx=Σ_[γ] vol(G_γ(F)\G_γ(𝔸)^1)∫_{G_γ(𝔸)\G(𝔸)}f(x⁻¹γx)dx=Σ_πm(π)tr π(f). Use the same connected/full centralizer convention in both volume and orbital integral. The convolution spectrum is discrete with finite multiplicities; compactness of G itself is not required.

*Standing hypotheses:* compact arithmetic quotient; smooth finite-level f; compatible quotient measures; disconnected centralizer index retained.

([Art05], §1, (1.1)–(1.3), pp.7–11; §16, (16.1)′′, p.90.)

*Needs:* §6.4; §6.6; §4.7; §0.10.


### 6.18 Discrete functionals and pseudo-coefficients

Define `discrete_functional_trace`, `pseudo_coefficient` as follows. Let G be a real reductive group of Harish-Chandra's class with compact centre, K a maximal compact subgroup and R(G) the Grothendieck group of finite-length Harish-Chandra modules. A ℤ-linear form λ on R(G) is discrete when it vanishes on every representation induced from a proper parabolic, and admissible when it vanishes on every representation without a K-type from some finite set. Realization theorem: for every discrete admissible λ and every r>0 there is a bi-K-finite f∈C_c^∞(G) supported in the ball of radius r with tr π(f)=λ(π) for every finite-length π. Pseudo-coefficients: for each discrete series δ₀ (§0.48 (real reductive representation foundations), tempered and square-integrable representations) and r>0 there is such an f with tr δ₀(f)=1 and tr π(f)=0 for every standard module π≠δ₀ induced from a limit of discrete series; in particular tr π(f)=0 for every irreducible tempered π≇δ₀.

*Standing hypotheses:* compact centre (for groups with split centre, fix the central character as in §6.19); the Paley–Wiener theorem §6.1.

Prove the following API statements.
- `admissible_iff`: for discrete λ, admissibility is equivalent to λ vanishing off finitely many irreducible representations, and to vanishing off finitely many tempered ones.
- `pseudo_coefficient_trace`: the pseudo-coefficient property, from the realization theorem and Langlands' disjointness of the discrete series from the induced relations.

**Checks.**
- for compact G with probability Haar every λ is discrete, every irreducible π is discrete series, and conj(χ_π) is a pseudo-coefficient of π. The central idempotent d_π·conj(χ_π) acts as identity on π and has trace d_π; for the standard two-dimensional SU(2) representation that trace is 2.
- for SL₂(ℝ) and a nonzero bi-K-invariant f≥0, the trace on the spherical unitary principal series at parameter 0 is positive, so π↦tr π(f) need not be discrete.
- for G=ℝ_{>0}^×, the indicator of the trivial character is discrete and admissible but is no trace of a compactly supported f, whose traces form an entire function of the character; the compact-centre hypothesis cannot be dropped.

([CD90], §5.2 Lemma 6, Proposition 4 and its Corollary, pp.212–213.)

*Needs:* §6.1; §0.48 (real reductive representation foundations), tempered and square-integrable representations; §0.48 (real reductive representation foundations), real discrete series; §0.48 (real reductive representation foundations), real Langlands classification.


### 6.19 Real Euler–Poincaré test functions

Define `general_euler_poincare` as follows. This uses the realization theorem of §6.18 and ArithmeticLocallySymmetricSpaces ALS.F.5's relative cohomology. For compact-centre real G use (𝔤,K). If G has split centre A_G, balance the central character of π⊗ξ, work on G/A_G(ℝ)⁰ and use (𝔪_G,K), 𝔪_G=𝔤/𝔞_G. Write 𝔩 for this chosen Lie algebra. For finite-dimensional ξ, construct f_ξ within any prescribed positive support radius in that quotient, satisfying tr π(f_ξ)=Σ_q(−1)^q dim H^q(𝔩,K;π⊗ξ) for every finite-length admissible π with the fixed compatible central character. Without discrete series on the chosen central quotient, this Euler characteristic vanishes for all π and f_ξ=0 suffices.

*Standing hypotheses:* Clozel–Delorme real group conventions; finite-length Harish-Chandra module and finite-dimensional ξ; split-center/central-character balancing for adelic groups.

Prove the following API statements.
- `trace_identity`: tr π(f_ξ)=EP(𝔩,K;π⊗ξ) for every finite-length admissible π.
- `induced_vanishing`: representations induced from proper parabolics have Euler–Poincaré characteristic zero, although their cohomology need not vanish.
- `no_discrete_series`: Without discrete series on the chosen quotient, EP(𝔩,K;π⊗ξ)=0 for every finite-length π.

**Checks.**
- For compact G (so 𝔤/𝔨=0) and trivial ξ, the cohomology is (π⊗ξ)^K in degree zero, so EP(π)=1 exactly for the trivial π; the constant function 1, for Haar measure of total mass one, has these traces.
- For SL₂(ℂ), which has no discrete series, the trivial representation has (𝔤,K)-cohomology of dimension one in degrees 0 and 3, so its Euler–Poincaré characteristic is 0.
- For GL₂(ℝ) with balanced split-central action and a weight-two cohomological discrete-series module, the reduced EP is −1. Full (𝔤,K)-cohomology adds the exterior factor of the one-dimensional split centre and has EP zero; the reduced test function realizes −1.


([CD90], §0 Theorem 1, p.195; §5 Proposition 4, p.212, Theorem 3 and proof, pp.213–214.)

*Needs:* §6.1; §6.18; ArithmeticLocallySymmetricSpaces ALS.F.5 (relative Lie algebra cochains).


### 6.20 L²-Lefschetz traces of Hecke operators

Prove `l2_lefschetz`. For Arthur’s reductive Q-group, coefficient ξ, level K_f and central balancing character, with f_ξ constructed for the reduced pair (𝔪_G,K∞) and the same central quotient as §6.19, the alternating trace of h on finite-dimensional L² relative cohomology is Σ_{π∈Π_disc}m_disc(π)EP(𝔪_G,K∞;π∞⊗ξ)tr π_f(h)=I(f_ξ⊗h). The invariant geometric expansion computes this trace with lower-Levi corrections. In the split classical groups over ℤ of [CT20], at level one, h=∏_p1_{G(ℤ_p)} with vol G(ℤ_p)=1 gives EP(G;λ)=T_geom(G;λ); its elliptic term is Σ_[γ finite order]vol(G_γ(ℚ)\G_γ(𝔸))O_γ(h)tr(γ|V_λ), with signed Euler–Poincaré measure at infinity and the matching local centralizer measures. Residual cohomology contributes unless a separate theorem excludes it.

*Standing hypotheses:* finite-dimensional algebraic coefficient; finite level; full K∞ component; invariant quotient by the split centre; G(ℝ)/A_G(ℝ)⁰ has a compact Cartan subgroup ([Art89L], §2, p.264). The [CT20] specialization uses the split classical groups admitting discrete series and the coefficient regularity of its §1.4.

([Art89L], §2, p.264 (compact-Cartan hypothesis) and Proposition 2.1; §3, Proposition 3.2; §6, Theorem 6.1. [CT20], §1.4.)

*Needs:* §6.19; §6.16; §4.3; §4.5.


### 6.21 Truncated geometric kernel and fixed-degree trace

Define `fixed_degree_trace` as follows. Under convention Y fix K=∏_vGL_n(𝒪_v), vol K=1 and the identity-Hecke test f=1_K. For P=M_PN_P set k_P(x,y)=Σ_{a∈Ξ_G}Σ_{γ∈M_P(F)}∫_{N_P(𝔸)}1_K(y⁻¹γu x a)du, with vol(N_P(F)\N_P(𝔸))=1. Form k^T(x,x)=Σ_P(−1)^{dim 𝔞_P^G}Σ_{δ∈P(F)\G(F)}hat-tau_P(H_P(δx)−T)k_P(δx,δx). The central sum belongs to the kernel on the Ξ_G quotient; its restriction to a fixed-degree diagonal uses the same kernel. All counting identities of §§6.21–6.24 use this specified test. Set J_e^T=∫_{G(F)\G(A)^e} k^T(x,x) dx and J_e=J_e^0, with convergence proved separately.

Prove the following API statements.
- `parabolicKernel`: assemble rational sums and unipotent integration
- `truncate`: form the locally finite alternating parabolic sum
- `fixedDegreeIntegral`: integrate only after convergence and quotient-measure proofs

**Checks.**
- For G=GL₁, the parabolic truncation sum has only P=G and k^T=k_G.
- For n=1 and X=ℙ¹, the identity-Hecke diagonal kernel equals q−1, each degree-e bundle orbit has mass 1/(q−1), and there is one such orbit; hence J_e=1. Replacing 1_K by zero instead gives zero.
- The fixed-degree integral of the two-parabolic cusp model on [0,2T] is T and differs from the whole-group-only integral when T>0.

([Yu22], §3.2.1, pp.15–16.)

*Needs:* §4.12; §3.11; §1.10a (function-field adeles, heights and measures).


### 6.22 Convergence and quasipolynomial continuation

Prove `fixed_degree_continuation`. The truncated fixed-degree integral is absolutely convergent; T↦J_e^T is quasipolynomial in the lattice sense, with its extension determined by values sufficiently deep in the positive chamber. T=0 evaluation is not untruncated integration or an unjustified limit of finite counts.

**Checks.**

- constant one on ℕ with counting measure is nonintegrable, even with degree zero.

([Yu22], §3.2.1, (3.2.1)–(3.2.2), pp.15–16, and Théorème 3.3.1, p.18; [Laf97], p.227; [Ch15], Définition 4.5.3.)

*Needs:* §6.21; §1.10a (function-field adeles, heights and measures).


### 6.22a Adelic bundle and stabilizer dictionary

Construct `adelic_bundle_dictionary` under convention Y. Consume finite locally free sheaves and geometric vector bundles from AlgebraicVectorBundles L0B/L2B and curve degree, canonical sheaves and the divisor/sheaf comparison from AlgebraicCurves Layers 4, 9 and 12E. Prove the groupoid equivalence between rank-n vector bundles on X over 𝔽_q and [GL_n(F)\GL_n(𝔸_F)/K]: local lattices glued inside the generic fibre construct E_g, while changing generic or integral trivializations gives precisely the rational left and compact right actions. Identify the stabilizer with Aut(E_g)(𝔽_q), a finite group, and identify deg E_g with the fixed determinant degree in the chosen lattice convention.

Transport integration of right-K-invariant functions on a degree fibre to Σ_[E] f(E)/|Aut(E)(𝔽_q)|, initially for nonnegative or absolutely summable functions, using vol K=1. Construct the bijection between parabolic cosets and saturated bundle flags, with their Levi degrees and stabilizers; prove invariance under all representative changes.

**Checks.**

- In rank one on ℙ¹, the degree-e fibre is the class of 𝒪(e), with stabilizer 𝔽_q^× and orbit mass 1/(q−1).
- Multiplying a generic basis by a rational matrix does not change the bundle or its mass; changing the compact Haar normalization would change the mass.
- For E=𝒪⊕𝒪 on ℙ¹, Aut(E)(𝔽_q)=GL₂(𝔽_q) has order (q²−1)(q²−q); weighting this orbit by one loses its stabilizer factor.

([Yu22], §3.3.1, pp.18–19, especially the bundle/flag correspondence and orbit volume; [Ch15], §2.6, adelic description of bundles.)

*Needs:* §1.10a; AlgebraicVectorBundles L0B/L2B; AlgebraicCurves Layers 4, 9 and 12E.


### 6.22b Higgs pairs and invariant flags

Construct `higgs_flag_dictionary`. For a divisor D on X, a D-Higgs pair is a bundle E with an 𝒪_X-linear map θ:E→E(D). Morphisms commute with θ, and saturated flags are θ-invariant when every flag subbundle is preserved. Via §6.22a identify these pairs with rational Lie-algebra elements satisfying g⁻¹θg∈∏_vϖ_v^(−D_v)𝔤(𝒪_v); identify the parabolic kernel fibres with θ-invariant flags and transport their automorphism groups. At D=0, all characteristic-polynomial coefficients lie in H⁰(X,𝒪_X)=𝔽_q; invertible pairs give the automorphism fibres of the identity-Hecke group kernel. At D=K_can, identify 𝒪_X(D) with ω_X and retain the choice's transport invariance.

The API constructs the pair groupoid, direct sums, scalar shifts at D=0, invariant subquotients, characteristic polynomials and the weighted group/Lie fibre comparison.

**Checks.**

- For θ=α Id at D=0 every saturated flag is invariant and its characteristic polynomial is (X−α)^n.
- For a rank-two pair with θ represented generically by a single nilpotent Jordan block, its unique invariant generic line is the kernel line; a non-kernel generic line cannot define an invariant saturated subbundle.
- In rank one with D=K_can, there are q^g choices of θ for each degree-e line bundle, all with automorphism group 𝔽_q^×.

([Yu22], §3.2.3, pp.16–17 and Appendix B, pp.78–79; [Ch15], §§2.6–2.7 and §5.1, the bundle and truncated-kernel dictionaries.)

*Needs:* §6.22a; AlgebraicVectorBundles L0B/L2B; AlgebraicCurves Layer 12E (canonical sheaf and H⁰ comparison).


### 6.22c Higgs slopes, Harder–Narasimhan flags and cone cancellation

Construct `higgs_harder_narasimhan`. Define (geometric) semistability by deg F/rank F≤deg E/n for every nonzero proper θ-invariant saturated subbundle after base change, and stability by strict inequality. Prove existence and uniqueness of the θ-invariant Harder–Narasimhan filtration with semistable quotients and strictly decreasing slopes, its descent and base-change compatibility, and finiteness of the slope/flag data entering each truncated fibre. Prove that semistability implies stability when gcd(e,n)=1.

Prove the flag form of Arthur's alternating cone identity: for each pair and its invariant flags, the T=0 alternating sum of the truncation indicators equals one for semistable pairs and zero for unstable pairs. Transport this cancellation through the parabolic/unipotent integrations of §6.22b with each flag stabilizer retained. This is a pointwise flag identity; equality of integrated masses uses the absolute convergence and quasipolynomial continuation of §6.22. It applies at the canonical divisor without requiring deg D>2g−2.

**Checks.**

- Rank-one pairs have no proper flags, are stable, and have cone sum one.
- On ℙ¹, (𝒪(1)⊕𝒪(−1),0) is unstable with a unique destabilizing first step; its full alternating cone sum is zero, although its untruncated positive contribution is nonzero.
- At rank two, degree zero, θ=0 on 𝒪⊕𝒪 has equal-slope invariant lines and is semistable but not stable; gcd(e,n)=1 cannot be omitted from the stable-mass consumer.

([Ch15], §4.1 for T-semistability and §5.1, Proposition 5.1.1, the flag/cone kernel identity; the canonical-boundary application is [Yu22], Appendix B, p.79.)

*Needs:* §6.22a; §6.22b; §3.1 (Arthur cone identities); §6.22 for the integrated comparison.


### 6.23 Characteristic-polynomial refinements of the group and Lie kernels

Define `charpoly_kernel_refinement` as follows. For the identity-Hecke group kernel of §6.21 and the Lie test h_0=1_{𝔤(𝒪)}, for monic p∈Fq[X] of degree n restrict the large-T kernels to matrices/endormorphisms with characteristic polynomial p and extend their integrals quasipolynomially. If p(0)≠0, End(E) and Aut(E) fibres coincide; hence J_e=Σ_{p(0)≠0} tildeJ_p,e.

Prove the following API statements.
- `charpolyFibre`: restrict kernel sums to a monic degree-n polynomial
- `lieKernel`: replace automorphisms by all endomorphisms
- `continueInT`: extend each truncated integral quasipolynomially

**Checks.**
- The scalar matrix a·Id belongs to the (X−a)^n characteristic-polynomial fibre.
- For n>0, the zero matrix belongs to the X^n fibre, is not invertible, and does not belong to the (X−1)^n fibre.
- For A in the p characteristic-polynomial fibre, A is invertible iff p has nonzero constant term; on a bundle use the corresponding global Cayley–Hamilton inverse.

([Yu22], Appendix B, pp.78–79.)

*Needs:* §6.21; §6.22; §6.22a; §6.22b; §1.10a (function-field adeles, heights and measures); §3.18.


### 6.24 Coprime scalar-nilpotent vanishing and the Fourier comparison

Prove `coprime_nilpotent_vanishing`. Let X_1 be a smooth projective geometrically connected curve of genus g over F_q, n≥1 and gcd(n,e)=1. At divisor D=0 with the Lie test h_0 of §6.23, for monic p∈F_q[X] of degree n, the T=0 value J̃_{p,e} of the Lie-algebra quasi-polynomial vanishes unless p=(X−α)^n with α∈F_q; in that case translation by α gives J̃_{p,e}=J̃_{nilp,e}. ([Ch15], Theorem 6.2.1, pp.32–33.)

Prove `higgs_fourier_comparison` with the quotient measures of §1.10a and a canonical divisor K_can. For each divisor D use h_D=∏_v1_{ϖ_v^(−D_v)𝔤(𝒪_v)}, construct its truncated Lie kernel, and prove absolute convergence and quasipolynomial dependence on T by extending §6.22's estimates to these divisor tests. Write J_K for the divisor K_can test, keeping K for the compact subgroup in §6.21. Consume SchemeAndStackFoundations §3.3's vector-bundle degree, Riemann–Roch and Serre duality. Apply them to End(E)(D), of rank n² and degree n² deg D, using the perfect trace pairing End(E)^∨≅End(E). They give |Hom(E,E(D))|=q^{n²(1−g+deg D)}|Hom(E,E(K_can−D))|. The bundle dictionary and deep-chamber kernel comparison transport this equality to the truncated integrals; their quasipolynomial continuation gives it for every T and e. At D=0 this yields Σ_p J̃^T_{p,e}=J^{T,e}_0=q^{n²(1−g)}J^{T,e}_K. This proof requires no coprimality and uses the quotient-volume conversion of §1.10a. ([Ch15], §§5.1–5.2, Corollary 5.1.2 and Theorem 5.2.1, pp.28–29; Corollary 5.2.3 and its Riemann–Roch/Serre-duality proof, p.30.)

**Checks of the divisor comparison.**

- On ℙ¹ in rank one and D=0, Hom(E,E) has q elements and Hom(E,E(K_can)) has one element; the factor is q.
- In genus one with K_can=0 and D=0, the factor is one and the two tests coincide, for every rank and degree, including noncoprime data.
- Applying D↦K_can−D twice gives reciprocal factors, since deg K_can=2g−2; their product is one.

Prove the separate canonical-boundary target `canonical_higgs_mass`: under the coprime hypotheses above, J^{0,e}_K equals Σ_{[(E,θ)]}1/|Aut(E,θ)(F_q)| for geometrically stable Higgs bundles θ:E→E⊗ω of rank n and degree e. Semistability equals stability because gcd(n,e)=1. Derive this comparison by identifying the truncated kernel with θ-invariant flags and applying the Arthur cone identity at T=0: unstable Higgs bundles cancel, and stable ones have no proper slope-equality flag. Keep the finite stabilizer weights in the adelic bundle dictionary. Chaudouard's Corollary 5.2.2, p.30 assumes deg D>2g−2; it cannot supply this equality at deg K=2g−2 without this additional argument. The canonical case and resulting counting relation are stated in [Yu22], Appendix B, p.79.

Combine these targets with `charpoly_kernel_refinement` to obtain

```text
J_e = (q−1)J̃_{nilp,e}
    = ((q−1)/q) Σ_p J̃_{p,e}
    = ((q−1)/q) q^(−n²(g−1)) mass(Higgs^{st}_{n,e}(X_1)(F_q)).
```

**Checks.**

- In rank one every Higgs bundle is stable and has q−1 scalar automorphisms. The mass is |Pic^e(X_1)(F_q)|q^g/(q−1), so the displayed relation gives J_e=|Pic^e(X_1)(F_q)|, with both the q and q−1 factors accounted for.
- Scalar translation gives exactly q distinct characteristic-polynomial fibres (X−α)^n; dropping the zero scalar leaves q−1 and belongs to the group kernel rather than the unrestricted Lie-algebra kernel.
- At rank two and degree zero, equal-slope summands can occur. This fails the coprimality hypothesis, so neither semistable=stable nor the stable-mass comparison is asserted by this target.

*Needs:* §6.22; §6.23; §6.22a; §6.22b; §6.22c; §1.10a (quotient measures and volume conversion); SchemeAndStackFoundations §3.3 (vector-bundle degree, Riemann–Roch, Serre duality and Ext–Hom comparison).


### 6.25 Weyl permutations and fixed Levis

Define `weyl_fixed_levi` as follows. Let M be a semi-standard Levi subgroup of G=GL_n and w in W_n (a permutation matrix). Put w(M)=wMw^{-1}; then w(a_M)=a_{w(M)} and w induces an isomorphism w: X_M^G -> X_{w(M)}^G, w(λ)(m)=λ(w^{-1}mw) for m in w(M)(A). If w(M)=M (so w permutes the blocks of M, necessarily among blocks of equal size), there is a smallest Levi subgroup L_w containing M and w; it is characterized by a_{L_w}=ker((w−id)|a_M), its blocks are the unions of the blocks of M along the cycles of the block permutation induced by w, and w acts trivially on X_{L_w}^G. For M ⊆ L, restriction of characters gives an inclusion X_L^G ⊆ X_M^G. Track the lattices a_{M,Z}, a_{L,Z} as well as the real spaces.

Prove the following API statements.
- `leviFromCycles`: construct L_w from the permutation orbits
- `fixedVectorSpace`: identify a_L with ker(w−1)
- `centralCharacterAction`: prove w fixes X_L^G

**Checks.**
- For w=1 the minimal fixed Levi is M.
- For M=GL_d×GL_d and w swapping the two blocks, L_w=GL_(2d).
- For M=GL₁^4 and w=(12)(34), L_w=GL₂×GL₂ up to permutation, rather than GL₄.

([Yu22], §4.1.1, p. 21, and §4.1.3, p. 22.)

*Needs:* §1.11; §3.10; §1.10a (function-field adeles, heights and measures).


### 6.26 Multiplicative and linear torus pairings

Define `torus_pairing` as follows. In determinant coordinates set X_M^G={(lambda_i):∏lambda_i^ni=1}. Write lambda^H=∏lambda_i^H_i but <lambda,H>=Σlambda_i H_i, using the coordinate embedding, not a logarithm. The finite central subgroup X_G^G is mu_n.

Prove the following API statements.
- `multiplicativePairing`: evaluate lambda^H with integer exponents
- `linearPairing`: evaluate the coordinate-linear form without logarithms
- `centralRoots`: identify X_G^G with mu_n

**Checks.**
- lambda^(H+K)=lambda^H*lambda^K for integral H,K.
- For H=(1,−1), lambda^H=lambda1/lambda2 whereas <lambda,H>=lambda1−lambda2.
- For M=GL₁×GL₁⊆GL₂, λ=(i,−i) lies in X_M^G because its coordinate product is one. At H=(1,−1), λ^H=−1 and ⟨λ,H⟩=2i; a logarithmic pairing would give a different result. At H=0 the values are one and zero.

([Yu22], §4.1.5–4.1.6, p. 22.)

*Needs:* §1.11; §3.10; §1.10a (function-field adeles, heights and measures).


### 6.27 Arthur theta denominator and multiplicative families

Define `multiplicative_gm_family` as follows. For a semi-standard Levi L, the chambers of a_L^G correspond to P(L) via P ↦ {H in a_L^G : α(H)>0 for all α in Δ_P}; P̄ denotes the opposite parabolic (Φ_P̄=−Φ_P), and P,Q in P(L) are adjacent when |Φ_P̄ ∩ Φ_Q|=1. For Q in P(M) and λ in X_M put θ_Q(λ)=∏_{α in Δ_Q}⟨λ,α^∨⟩ (the linear pairing of 4.1.6, so ⟨λ,α^∨⟩=λ_u−λ_v for α^∨=e_{M,u}−e_{M,v}); this differs from Arthur's θ_Q by a volume factor. Let Ω ⊆ X_M^G or X_M be a domain. A family (c_P)_{P in P(M)} of holomorphic functions on Ω is a (G,M)-family if c_P(λ)=c_{P'}(λ) for every adjacent pair P,P' and every λ in Ω with λ^{α^∨}=1, where α is the unique root in Φ_P ∩ Φ_{P̄'}. For such a family c_M(λ)=Σ_{Q in P(M)} c_Q(λ)θ_Q(λ)^{-1} is meromorphic on Ω.

Prove the following API statements.
- `adjacentCompatibility`: state equality on the multiplicative coroot wall
- `theta`: construct the product of coordinate differences
- `regularizedSum`: name the sum before proving removable singularities

**Checks.**
- For GL₂ with diagonal Levi, theta_B=lambda1−lambda2 and theta_Bop=lambda2−lambda1.
- The multiplicative wall equation from the coroot (1,−1) rejects any multiplicative_gm_family family with constant adjacent members one and two on the whole character domain.
- For M=G, theta_G=1 and the single holomorphic member automatically satisfies the adjacency condition.

([Yu22], §4.1.2, p. 21, and §4.2.1, p. 23, Définition 4.2.1 and (4.2.1).)

*Needs:* §3.10; §6.25; §6.26; §1.10a (function-field adeles, heights and measures); §6.7; §6.8.


### 6.28 Regularized family value and descent

Prove `regularized_family_value`. (a) Let (c_Q)_{Q in P(M)} be meromorphic on X_M^G (or X_M) and a (G,M)-family on a neighbourhood of λ0 in X_M^G (or X_M). Then c_M(λ)=Σ_Q c_Q(λ)θ_Q(λ)^{-1} is regular at λ0. (b) For a (G,M)-family near 1 put c_M=lim_{λ→1}c_M(λ). For L in L(M), R in P(L) and Q in P^L(M), c^R_Q(λ)=c_{QN_R}(λ) (QN_R the unique element of P(M) contained in R with QN_R ∩ L=Q) is an (L,M)-family near 1, with value c^R_M=lim_{λ→1}Σ_{Q in P^L(M)} c^R_Q(λ)θ^L_Q(λ)^{-1}, θ^L_Q(λ)=∏_{α in Δ^L_Q}⟨λ,α^∨⟩. (c) For Q in P(L) and λ in X_L^G, c_Q(λ):=c_P(λ) for any P in P(M) with P ⊆ Q is independent of P and defines a (G,L)-family near 1.

([Yu22], §4.2.1–4.2.2, p. 23, Théorème 4.2.2 and (4.2.2)–(4.2.5).)

The API is `regularized_family_value.regular` for cancellation near λ₀, `regularized_family_value.levi` for partial values, and `regularized_family_value.parabolic_independent` for restriction to X_L^G.

**Checks.**

- A single summand such as 1/(λ₁/λ₂−1) has no analytic extension across the wall λ₁=λ₂; only the full sum over adjacent chambers is regular.
- In rank zero the regularized value is simply the sole member evaluated at one.
- For GL₂ and constant adjacent members both equal to c, c/(λ₁−λ₂)+c/(λ₂−λ₁)=0 after extension.
- For adjacent members c₊=λ₁ and c₋=λ₂, the regularized sum is one. Keeping only its first summand leaves a pole on the wall.

*Needs:* §6.27; §1.10a (function-field adeles, heights and measures); §6.7; §6.8.


### 6.29 Product formula for families

Prove `family_product_formula`. If c_M^Q is independent of Q∈P(L) for every L⊇M, then (cd)_M=Σ_L c_M^L d_L in Yu's normalization. This hypothesis is essential; the formula is not asserted for arbitrary families without the partial-value compatibility.

([Yu22], §4.2.2, pp. 23–24, Proposition 4.2.3 (a variant of [Art81], Corollary 6.5).)

*Needs:* §6.28; §1.10a (function-field adeles, heights and measures); §6.7; §6.8.


### 6.30 Root-product derivative formula

Prove `root_product_derivative`. For each root beta choose c_beta meromorphic on C*, regular at 1 with c_beta(1)=1. The products c_Q=∏_{beta∈Phi_Q} c_beta(lambda^beta∨) form a family; c_M=Σ_F ∏_{beta∈F}c_beta'(1), where F ranges over root subsets forming a basis of a_M^{G,*}.

([Yu22], Théorème 4.2.4, pp.24–26.)

*Needs:* §6.27; §6.28; §1.10a (function-field adeles, heights and measures); §6.7; §6.8.


### 6.31 Root-coordinate Haar integral

Prove `root_coordinate_haar`. For a root basis F and continuous functions fβ on S¹, the root-coordinate homomorphism p:Im X_M^G→(S¹)^F is surjective with finite kernel and pushes probability Haar to probability Haar. Thus ∫∏β fβ(pβ(λ))dλ=∏β(1/(2πi))∮ fβ(z)dz/z. Equivalently, including ∏βpβ(λ) in the integrand gives ∏β(1/(2πi))∮ fβ(z)dz, as in [Yu22], Lemme 4.2.5.

([Yu22], Lemme 4.2.5, p.26.)

*Needs:* §6.26; §6.30; §1.10a (function-field adeles, heights and measures).


### 6.32 Argument-principle integral of a family

Prove `family_argument_principle`. Assume each c_beta is meromorphic on a neighborhood of the closed unit disk and nonzero and finite on the unit circle |z|=1. For the ratio root-product family, its integrated regularized value is Σ_F∏_{beta∈F}(N(c_beta)−P(c_beta)), counting multiplicities in |z|<1. Rational L-ratios satisfy the needed extension assumption when boundary singularities are absent.

([Yu22], Corollaire 4.2.6, p.27.)

*Needs:* §6.30; §6.31; §1.10a (function-field adeles, heights and measures).


### 6.33 Ambient independence and central-translation vanishing

Prove `family_central_vanishing`. (a) [Lemme 4.2.7] If c_Q(λ)=∏_{β in Φ_Q} c_β(λ^{β^∨}) as in Théorème 4.2.4, then for every L in L(M) the value c^R_M is independent of R in P(L) (write c^L_M): c^R_Q=∏_{β in Φ(Z_M,N_Q)}c_β(λ^{β^∨})·∏_{β in Φ(Z_M,N_R)}c_β(λ^{β^∨}), and the second factor tends to 1. (b) [Lemme 4.2.8] Let μ0 in X_M^G and let (c_Q) be a (G,M)-family on a domain containing μ0^Z such that c^R_M is independent of R in P(L) for every L in L(M) and c_Q(λμ0)=c_Q(λ) wherever c_Q is defined. Then lim_{λ→1}Σ_{Q in P(M)} θ_Q(λμ0)^{-1}c_Q(λμ0)=0 unless μ0 in X_G^G, and for μ0 in X_G^G it equals μ_{01}^{−dim a_M^G} c_M, where μ_{01} is the (common) first coordinate of μ0.

([Yu22], Lemmes 4.2.7–4.2.8, pp.27–29.)

*Needs:* §6.28; §6.29; §6.30; §1.10a (function-field adeles, heights and measures); §6.7; §6.8.


### 6.34 Finite-kernel torus Fourier inversion

Prove `torus_fourier_inversion`. For L=L_w, the map mu_w:Im X_L^G×Im X_M^L→Im X_M^G, (mu,lambda')↦lambda' mu/w^−1(lambda'), is surjective with finite kernel of size |w||X_L^L|, where |w| is the product of cycle lengths. Haar Fourier inversion converts the character sum into a normalized sum over its finite fibres.

([Yu22], §5.2.3, pp.34–35.)

*Needs:* §0.19; §0.20; §0.21; §0.22; §0.23; §1.10a (function-field adeles, heights and measures); `MonoidHom.measurePreserving`; `UnitAddTorus.hasSum_mFourier_series_apply_of_summable`; `AddChar.expect_eq_ite`.


### 6.35 Corrected Arthur–Lafforgue spectral expression

Prove `arthur_lafforgue_spectral`. For G=GL_n over F_q(X), n>0, the everywhere-unramified trace at T=0 is J_eta=Σ_[(P,pi)] |stab(P,pi)|⁻¹ Σ_[(w,tau)∈stab(P,pi)] ∫_(lambda∈A) D⁻¹ Σ_[(a,c)∈mu_w⁻¹(tau)] F_eta(lambda,a,c) d lambda. Here A=Im X_L^G, B=Im X_M^L, L=L_w, mu_w(a,c)=a*c/w⁻¹(c), D=|w||X_L^L|, and F_eta is the exact ordered regularized trace of §6.36 with h_Q(v)=hat1_Q(v eta⁻¹). Haar on A has total mass one, including all components. The finite fibre is equivalently a∈A,b∈B0,tau=a*b,c∈B,δ_w(c)=b. Replacing h_Q by hat1_Q^e gives J_e for every e∈Z. No good-representative hypothesis is required for this spectral identity. The scalar specialization uses compatible spherical vectors, intertwiners, L-factors and Haar measures.

([Yu22], Théorème 5.2.2 and Corollaire 5.2.3, pp.33–36, correcting the corresponding theorem of [Laf97].)

*Needs:* §4.12; §6.21; §6.22; §3.13; §2.15; §6.34; §6.36; §6.37; §1.10a (function-field adeles, heights and measures).


### 6.36 Finite-fibre operator trace

Define `finite_fibre_trace` as follows. For a discrete pair (P,pi), (w,tau)∈stab(P,pi), L=L_w, a∈A, b∈B0, tau=a*b and c∈B with δ_w(c)=b, put z=lambda*c for lambda∈A. Define R_Q(z;v)=M_(R|P)(z)⁻¹∘M_(R|P)(z/v), where R∈P^Q(M), v∈X_L^G. For h_Q=hat1_Q(·eta⁻¹) or hat1_Q^e, set F_h(lambda,a,c)=lim_(mu→1 in X_L^G) Tr_(A_P,pi)[(Σ_(Q∈P(L))h_Q(mu*a) R_Q(z;mu*a))∘M(w,w⁻¹(c))∘U_tau]. U_tau is multiplication by tau. The Q-sum is continued holomorphically before evaluation at mu=1; the other parameters are unitary.

Prove the following API statements.
- `stabilizerTransport`: U_tau:A_P,pi→A_P,pi⊗tau followed by M(w,w⁻¹c):A_P,pi⊗tau→A_P,w(pi⊗tau)=A_P,pi closes the endomorphism because stab means w(pi⊗tau)=pi.
- `regularizedFamily`: For a fixed fibre and lambda form the meromorphic Q-sum, prove its extension near mu=1 by adjacent-wall gluing, then take the finite-dimensional trace.
- `spectralContribution`: Integrate F_h over probability Haar on A and average over the D-point fibre; multiply by |stab(P,pi)|⁻¹. Choice of R within P^Q(M) does not change the operator.

**Checks.**
- For all cycle lengths one, count the finite kernel of the map (a,c)↦aδ(c) on the constructed A×B cover: its cardinal is ∏d_j, retaining every finite component.
- In the general stabilizer case U_tau alone need not end in A_P,pi; the trace is formed only after the Weyl transport closes the endomorphism.
- For M=L=G the parabolic sum has one term and R_G(z;v)=Id; the formula reduces to the finite character average of h_G(a) times Tr(M(1,c)∘U_tau).

([Yu22], §§5.2.2–5.2.3, pp.32–36.)

*Needs:* §4.12; §3.13; §2.15; §0.19; §0.21; §1.10a (function-field adeles, heights and measures); §6.27; §6.28.


### 6.37 Degree Fourier recovery of the spectral contribution

Prove `degree_fourier_recovery`. Let n>0, zeta primitive of order n and eta=zeta^deg. If J_(eta^k)=Σ_(e mod n)zeta^(ek) J_e, then J_e=n⁻¹Σ_(k mod n)zeta^(−ek)J_(eta^k). In the finite-fibre trace this replaces hat1_Q(mu*a*eta^(−k)) by hat1_Q^e(mu*a)=n⁻¹Σ_k zeta^(ek)hat1_Q(mu*a*eta^k), leaving the fibre, operator order and denominator unchanged. It holds for every integer e, not just coprime e.

([Yu22], §§5.2.2–5.2.3, pp.32–36.)

*Needs:* §3.13; §6.36; §1.10a (function-field adeles, heights and measures); `MonoidHom.measurePreserving`; `UnitAddTorus.hasSum_mFourier_series_apply_of_summable`; `AddChar.expect_eq_ite`.


### 6.38 Twisted truncated trace and its degree decomposition

Prove `twisted_truncated_trace`. Let n≥1, ζ an n-th root of unity and η=ζ^{deg det} in X_G^G. Define J^T_η:=∫_{G(F)\G(A)/Ξ_G} η(g)k^T(g,g)dg, with k^T Arthur's truncated kernel (§6.21) and Ξ_G=a^Z (a a fixed idele of degree 1, as a scalar matrix, so deg det a=n). Since G(F) ⊂ G(A)^0, k^T(g,g) is Ξ_G-invariant, and G(F)\G(A)^e → G(F)\G(A)/Ξ_G is a measure-preserving bijection onto the classes with deg det ≡ e (mod n), one has J^T_η=Σ_{e=1}^n ζ^e J^T_e with J^T_e=∫_{G(F)\G(A)^e}k^T(x,x)dx, and J^T_e depends only on e mod n. Hence, for ζ primitive, J^T_{η^k}=Σ_{e=1}^nζ^{ek}J^T_e for all k in Z and J^T_e=n^{-1}Σ_{k=1}^nζ^{−ek}J^T_{η^k} for all e in Z.

([Yu22], §5.2.3, p. 33, equation (5.2.8); p. 36, displays before Corollaire 5.2.3.)

The API is `twisted_truncated_trace.descend` (invariance under Ξ_G), `twisted_truncated_trace.degree_sum`, and `twisted_truncated_trace.fourier_inverse`.

**Checks.**

- For n=1 there is one degree residue and twisting by the unique first root of unity leaves J^T unchanged.
- For n=2 and ζ=−1, J^T_η=J^T_0−J^T_1; the untwisted trace is their sum.
- Scaling by the chosen scalar idele changes determinant degree by n, so degree-e and degree-(e+n) integrals coincide; scaling by an arbitrary idele cannot be treated as degree zero.

*Needs:* §1.10a (function-field adeles, heights and measures); §6.21; §6.37.


### 6.39 Lafforgue's spectral expansion before Fourier inversion, twisted by η

Prove `lafforgue_spectral_expansion`. ([Laf97], VI §2, through Lemme 9 and Corollaire 10, with the change of variable μ_Q ↦ μ_Qη^{-1} at the start of step (e), p. 304.) For G=GL_n over the function field F of X_1 and η in X_G^G, J_η=J_η^{T=0} equals the sum, over inertial classes of everywhere-unramified discrete pairs (P,π) and over continuous characters χ of Im X_{M_P}^G, of |stab(P,π)|^{-1}Σ_{(w,λ_π) in stab(P,π)} lim_{μ0 in X_{L_w}^G, μ0→1} Σ_{Q in P(L_w)} ∫_{Im X_{L_w}^G}∫_{Im X_{M_P}^G} 1̂_Q(μμ0η^{-1}) χ(λ w(λ_π)μ0μ/w(λ)) Tr_{A_{P,π}}(M_Q(λ,P;μμ0) ∘ M(w^{-1},w(λ)) ∘ w(λ_π)^{-1}) dλ dμ, with probability Haar measures. The Q-sum is continued holomorphically as a whole before μ0→1 ([Laf97], Corollaire 10), using the isometry of intertwiners on the unitary axis, the functional equation, and the relations w(λ0)^{H_P}M(w,λ)φ=M(w,λλ0^{-1})(φλ0^{H_P}) and M(w,λμ)=M(w,λ) for μ in X_{L_w}^G.

([Yu22], §5.2.3, p. 34, proof of Théorème 5.2.2, equation (5.2.10).)

*Needs:* §1.10a (function-field adeles, heights and measures); §2.15; §6.38; §6.36; §0.23.


### 6.40 Arthur's root-basis identity for θ-sums

Prove `root_basis_identity`. Let m=dim a_M^G and β_1,…,β_m distinct elements of Φ(Z_M,G). For ξ in a_{M,C}^* with ⟨ξ,α^∨⟩≠0 for all α in Φ(Z_M,G), Σ'_Q θ_Q(ξ)^{-1}∏_{j=1}^m⟨ξ,β_j^∨⟩, summed over the Q in P(M) with {β_1,…,β_m} ⊆ Φ_Q, equals 0 if the β_j are linearly dependent and 1 if they form a basis of a_M^{G,*}. Here θ_Q is Yu's unnormalized θ_Q. In type A every basis of relative coroots generates the full lattice {x in Z^r: Σx=0}, so Arthur's volume factors cancel.

*Standing hypotheses:* G=GL_n with a specified block Levi M and Yu’s unnormalized θ; m=dim a_M^G, the β_j are distinct relative roots, and every relative-coroot pairing with ξ is nonzero. The selected parabolics contain all β_j. The value 1 uses type-A unimodularity; for another root system a covolume factor must be retained.

([Yu22], §4.2.3, proof of Théorème 4.2.4, p.26, case k=m, citing J. Arthur, "On a family of distributions obtained from Eisenstein series II: explicit formulas", Amer. J. Math. 104 (1982), pp.1319–1320.)

*Needs:* §3.1; §3.10; §1.10a (function-field Iwasawa data and chambers).


### Examples

In a two-chamber family c±=b+a±z, the regularized value is a₊−a₋. Wall values 2,5 and slope pairs (3,1),(7,4) give product value 2·5+2·3=16. For M=G the weighted orbital weight is one and the weighted character is the ordinary trace. In PGL₂(ℝ), the full centralizer of diag(1,−1) has index two over its connected centralizer; using the full quotient without the matching factor halves the orbital integral. At n=2 the twisted function-field trace is J₀−J₁, and inverse Fourier transformation recovers (J_untwisted±J_twisted)/2. The kernel denominator is the complete D=|w||X_L^L|, even when every cycle length is one.

### Dependencies

The real transform uses smooth LF tests, normalized real induction and infinitesimal characters. Spectral multipliers feed the spectral trace estimates. The coarse trace uses automorphic kernels, reduction and truncation; fine expansions add weighted orbital integrals and normalized weighted characters; invariant recursion uses the almost-compact Fourier image and lower-Levi descent. Pseudo-coefficients precede Euler–Poincaré functions and the L²-Lefschetz theorem. The function-field suffix uses fixed-degree kernel convergence, determinant roots, finite-kernel torus Fourier inversion, degree cutoffs and regularized operator families. Its root-basis and family identities are constructed before their cutoff and spectral consumers, in the order specified above.

## Layer 7: GLₙ transfer applications

### 7.1 Solvable GLₙ base change and descent

<a id="solvable-gln-base-change"></a>

**Solvable GLₙ base change and descent.** Over number fields construct cyclic prime-degree base change on cuspidal representations and extend it to isobaric sums and towers of cyclic prime-degree extensions. Prove unramified local compatibility: a place of residue degree f replaces each Satake eigenvalue α by α^f. Preserve central characters, duals and norm twists. For cyclic E/K of prime degree l with associated order-l character η, a cuspidal π has cuspidal base change precisely when π≄π⊗η; otherwise it splits as the orbit of l distinct conjugate cuspidal blocks of rank n/l. Prove descent of Galois-invariant cuspidal representations and the fibre theorem: cuspidal π,π′ with the same base change differ by a character trivial on norms from E. For isobaric inputs retain constituent orbit matching and multiplicities, rather than claiming one common twist for all constituents. Iterate these constructions and the fibre argument along the specified solvable tower; general normal K/F in the degree-one theorem is not itself assumed solvable.

**Checks.** GL₁ base change is composition with the idele norm; an unramified residue-degree-two place squares its Satake roots; π and π⊗η have the same cyclic base change, and the η-self-twist case need not remain cuspidal.

(Source: Arthur–Clozel [AC89], *Simple algebras, base change, and the advanced theory of the trace formula*, Chapter 3, Theorems 3.1, 4.2 and 5.1, pp.201–203 and 212–213; Ramakrishnan [Ram18], pp.3–6, Proposition 1.1 and Claim 1.2.)

*Needs:* AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, [GLₙ isobaric sums](../AutomorphicLFunctionsAndLocalFactors/README.md#isobaric-construction); ClassFieldTheory §4, Layers 11–12 (number-field Artin reciprocity, norm quotients and the cyclic character dictionary); AutomorphicLFunctionsAndLocalFactors AL.3's number-field Rankin–Selberg pole/nonvanishing and isobaric multiplicity-one prefix; Layer 6 (ordinary trace distributions). Construct the cyclic twisted trace comparison and norm-transfer identities used in Arthur–Clozel Chapter 3 §§1, 4–5 here from the trace distributions of Layer 6; their existence is part of this base-change target, with its number-field/cyclic hypotheses.


### 7.2 Ramakrishnan’s degree-one comparison

<a id="ramakrishnan-degree-one"></a>

**Ramakrishnan’s degree-one comparison.** Let K/F be an extension of number fields admitting a tower F=K₀⊂K₁⊂…⊂K_r=K with every K_j/K_{j−1} normal. If isobaric π,π′ of GL_n(𝔸_K) agree outside finitely many primes of K having relative degree1 over F, then π≅π′. In particular, for quadratic E/F, agreement above almost all split F-primes suffices.

Work under the following hypotheses. Do not weaken the normal-tower hypothesis to an arbitrary finite extension; the solvable-normal-closure case is the separate CorollaryB.

**Checks.** For K=F the statement reduces to isobaric strong multiplicity one; for quadratic K/F the required degree-one primes are precisely those above split primes; base change along an auxiliary cyclic extension can identify π with π⊗η, so descent uses its fibre theorem rather than injectivity.

(Source: [Ram18], TheoremA, pp.1–2; proof strategy pp.2–4.)

*Needs:* [Solvable GLₙ base change and descent](#solvable-gln-base-change), including unramified compatibility, cuspidality and the fibre theorem; [Strong multiplicity one for isobaric sums](../AutomorphicLFunctionsAndLocalFactors/README.md#isobaric-strong-multiplicity-one); [Continuation and the Rankin–Selberg pole criterion](../AutomorphicLFunctionsAndLocalFactors/README.md#rs-global-poles).


## Downstream consumers

Layer 5 supplies `LocallySymmetric.FrankeInput` to ArithmeticLocallySymmetricSpaces ALS.5b.4, including its cuspidal-support weight statement. The scalar L-factors and cuspidal analytic theorems supplied by AutomorphicLFunctionsAndLocalFactors support the continued Eisenstein families, residual scalar applications and GLₙ transfers here. Endoscopic trace comparisons consume the ordinary orbital integrals, pseudo-coefficients and generic-packet constructions here. The analytic Green kernel stops before the arithmetic heights of Gross–Zagier; the function-field trace stops at the fixed-degree spectral and geometric identities used in counting local systems.


## References

- **[RM19]**: Fulvio Ricci, course notes by Francesco Paolo Maiale, [Analysis of Sublaplacians on Lie Groups](https://poisson.phc.dm.unipi.it/~fpmaiale/notes/HAoLG.pdf). Version of 28 May 2019; locators use printed pagination.
- **[Yetter04]**: David N. Yetter, [Measurable Categories](https://arxiv.org/pdf/math/0309185). arXiv:math/0309185v2, 6 September 2004.
- **[Tes09]**: Gerald Teschl, [Mathematical Methods in Quantum Mechanics](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf). First edition, Graduate Studies in Mathematics 99 (2009), author PDF schroe.pdf, version 12 February 2009; locators use printed pagination.
- **[Wal79]**: Nolan R. Wallach, *Representations of reductive Lie groups*, Proc. Sympos. Pure Math. 33, Part 1 (1979), 71–86; the Corvallis volume's printed pagination.
- **[BK14]**: Joseph Bernstein and Bernhard Krötz, [Smooth Fréchet globalizations of Harish-Chandra modules](https://arxiv.org/pdf/0812.1684v3). Israel J. Math. 199 (2014), 45–111; locators use the arXiv v3 section and theorem numbers.
- **[Fla79]**: David Flath, *Decomposition of representations into tensor products*, Proc. Sympos. Pure Math. 33, Part 1 (1979), 179–183.
- **[Vog81]**: David A. Vogan Jr., *Representations of real reductive Lie groups*, Progress in Mathematics 15, Birkhäuser (1981), §§6.1–6.2; the compatible-module category and injective/coinduction machinery used in [Fra98], §4.
- **[Art05]**: James Arthur, [An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf). Clay Mathematics Proceedings 4 (2005), 1–263.
- **[Lan66]**: Robert P. Langlands, [Eisenstein Series](https://publications.ias.edu/sites/default/files/Eisenstein-series-rpl_0.pdf). Proc. Sympos. Pure Math. 9 (1966), 235–252, IAS transcription.
- **[Art80]**: James Arthur, [A Trace Formula for Reductive Groups II: Applications of a Truncation Operator](https://www.claymath.org/library/cw/arthur/pdf/9.pdf). Compositio Math. 40 (1980), 87–121.
- **[Art81]**: James Arthur, [The Trace Formula in Invariant Form](https://www.claymath.org/library/cw/arthur/pdf/10.pdf). Annals of Math. 114 (1981), 1–74.
- **[Art82]**: James Arthur, [On the Inner Product of Truncated Eisenstein Series](https://www.claymath.org/library/cw/arthur/pdf/12.pdf). Duke Math. J. 49 (1982), 35–70.
- **[Art83PW]**: James Arthur, [A Paley-Wiener Theorem for Real Reductive Groups](https://www.claymath.org/library/cw/arthur/pdf/15.pdf). Acta Math. 150 (1983), 1–89.
- **[Art88G]**: James Arthur, [The Invariant Trace Formula II: Global Theory](https://www.claymath.org/library/cw/arthur/pdf/27.pdf). JAMS 1 (1988), 501–554.
- **[Art89W]**: James Arthur, [Intertwining Operators and Residues I: Weighted Characters](https://www.claymath.org/library/cw/arthur/pdf/28.pdf). J. Funct. Anal. 84 (1989), 19–84.
- **[Art89L]**: James Arthur, [The L²-Lefschetz Numbers of Hecke Operators](https://www.claymath.org/library/cw/arthur/pdf/32.pdf). Invent. Math. 97 (1989), 257–290.
- **[CD90]**: Laurent Clozel and Patrick Delorme, [Le théorème de Paley-Wiener invariant pour les groupes de Lie réductifs II](https://www.numdam.org/article/ASENS_1990_4_23_2_193_0.pdf). Ann. ENS 23 (1990), 193–228.
- **[Fra98]**: Jens Franke, [Harmonic Analysis in Weighted L²-Spaces](https://www.numdam.org/item/10.1016/s0012-9593(98)80015-3.pdf). Ann. ENS 31 (1998), 181–279.
- **[Wal84]**: Nolan R. Wallach, [On the Constant Term of a Square Integrable Automorphic Form](https://mathweb.ucsd.edu/~nwallach/tempered-cuspidal.pdf). Monogr. Stud. Math. 18 (1984), 227–237, author scan.
- **[Yu22]**: Hongjie Yu, [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5). arXiv:1807.04659v5, 18 July 2022.
- **[JZ20]**: Dihua Jiang and Lei Zhang, [Arthur Parameters and Cuspidal Automorphic Modules of Classical Groups](https://arxiv.org/pdf/1508.03205v4). arXiv:1508.03205v4.
- **[DIT16]**: William Duke, Özlem İmamoğlu and Árpád Tóth, [Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf). Annals of Math. 184 (2016), 949–990.
- **[DIT11]**: William Duke, Özlem İmamoğlu and Árpád Tóth, [Cycle Integrals of the j-Function and Mock Modular Forms](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n2-p08-p.pdf). Annals of Math. 173 (2011), 947–981.
- **[CGH20]**: Frank Calegari, David Geraghty and Michael Harris, [Bloch–Kato Conjectures for Automorphic Motives](https://arxiv.org/pdf/1907.08694). arXiv:1907.08694v1, July2019.
- **[BCG25]**: George Boxer, Frank Calegari and Toby Gee, [Cuspidal Cohomology of GLₙ(Z) and SLₙ(Z)](https://math.uchicago.edu/~fcale/papers/WeightZero.pdf). author WeightZero PDF.
- **[BPCZ22]**: Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard and Michał Zydor, [The Global Gan–Gross–Prasad Conjecture for Unitary Groups: the Endoscopic Case](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf). Publ. Math. IHES 135 (2022), 183–337.
- **[CT20]**: Gaëtan Chenevier and Olivier Taïbi, [Discrete Series Multiplicities for Classical Groups over Z and Level 1 Algebraic Cusp Forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf). Publ. Math. IHES 131 (2020), 261–323.
- **[GZ86]**: Benedict H. Gross and Don B. Zagier, [Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf). Invent. Math. 84 (1986), 225–320.
- **[Sha25]**: Jacob Shapiro, [Functional Analysis: Princeton University MAT520 Lecture Notes](https://web.math.princeton.edu/~js129/PDFs/teaching/MAT520_fall_2025/MAT520_Lecture_Notes.pdf). Fall 2025; last typeset 10 December 2025.
- **[ACC+23]**: Patrick Allen et al., [Potential automorphy over CM fields](https://annals.math.princeton.edu/2023/197-3/p02). Annals of Math. 197 (2023), 897–1113; freely available as [arXiv:1812.09999](https://arxiv.org/abs/1812.09999). Locators use the Annals pagination.
- **[Mun]**: Sam Mundy, [Automorphic Cohomology, Arthur's Conjectures and Applications to G₂](https://web.math.princeton.edu/~sm7928/G2CohArt.pdf). Author version; locators use its printed pagination. Sections 2.1–2.2 treat general reductive groups, before the G₂ application in §2.3.
- **[DZ22]**: Semyon Dyatlov and Maciej Zworski, [Mathematical Theory of Scattering Resonances](https://math.mit.edu/~dyatlov/res/res_final.pdf). Author version 1.0, 19 August 2022; locators use this version's printed pagination.
- **[Ch15]**: Pierre-Henri Chaudouard, [Sur le comptage des fibrés de Hitchin](https://webusers.imj-prg.fr/~pierre-henri.chaudouard/contrib-Laumon.pdf). Author preprint of the article in Astérisque 369 (2015), 223–284; locators use the preprint's printed pagination.
- **[Laf97]**: Laurent Lafforgue, [Chtoucas de Drinfeld et conjecture de Ramanujan–Petersson](https://numdam.org/item/AST_1997__243__1_0.pdf). Astérisque 243 (1997); locators use the volume's printed pagination.
- **[MW89]**: Colette Mœglin and Jean-Loup Waldspurger, [Le spectre résiduel de GL(n)](https://www.numdam.org/item/ASENS_1989_4_22_4_605_0.pdf). Ann. Sci. ÉNS (4) 22 (1989), 605–674.
- **[MW94]**: Colette Mœglin and Jean-Loup Waldspurger, *Décomposition spectrale et séries d'Eisenstein. Une paraphrase de l'Écriture*. Progress in Mathematics 113, Birkhäuser, 1994; not freely available, and cited here only through its use in [Yu22], §5.3.1.

- **[GS01]**: Stephen Gelbart and Freydoon Shahidi, *Boundedness of automorphic L-functions in vertical strips*. J. Amer. Math. Soc. 14 (2001), 79–107; locators use published pagination.
- **[Cog04]**: James W. Cogdell, [Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf). Author Fields Institute lecture notes, 2004.
- **[YZ17]**: Zhiwei Yun and Wei Zhang, [Shtukas and the Taylor expansion of L-functions](https://math.mit.edu/~zyun/Taylor_Expansion_published.pdf). Annals of Math. 186 (2017), 767–911; published author PDF.
- **[AC89]**: James Arthur and Laurent Clozel, *Simple algebras, base change, and the advanced theory of the trace formula*. Annals of Mathematics Studies 120 (1989); Chapter 3 locators use printed pagination.
- **[Ram18]**: Dinakar Ramakrishnan, [A mild Tchebotarev theorem for GL(n)](https://arxiv.org/pdf/1806.08429v1). arXiv:1806.08429v1.

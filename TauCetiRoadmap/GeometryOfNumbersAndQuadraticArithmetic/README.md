# Roadmap: geometry of numbers, quadratic forms and homogeneous arithmetic

This roadmap builds the geometry of numbers and the arithmetic of quadratic and hermitian lattices on top of Mathlib's `ZLattice`, Minkowski's first theorem and the number-field embeddings, and on top of Tau Ceti's integral lattices over `ℤ`, its exact categories and its spinor norms. From covolumes and Gram determinants it goes to successive minima and both sharp halves of Minkowski's second theorem; from there to integral quadratic lattices over a Dedekind domain with their localisations, genera and spinor genera, to the local theory (invariant factors, dyadic normal forms, hermitian and quaternionic variants), to representation densities, Siegel polynomials and the mass of a genus; then to lattice-point counting, the homogeneous-dynamics theorems behind Margulis's and Duke's results, star bodies and transference; to a certified LLL reduction; and finally to Schlichting's hermitian K-theory of exact categories with its applications to Dedekind rings and to the integers. The end theorems are Minkowski's second theorem in both directions, the Cho–Yamauchi density formula and the mass identity for a definite genus, Henk's lattice-point bound, Margulis's theorem on values of indefinite forms, Duke's equidistribution of lattice points on spheres, the LLL approximation factor with an exact certificate, and the hermitian delooping theorem with the integral Grothendieck–Witt tables.

The construction has seven layers, in order.

| Layer | Construction |
| --- | --- |
| 0 | Lattices, Gram determinants and covolumes |
| 1 | Convex bodies, successive minima and Minkowski's theorems |
| 2 | Integral quadratic and hermitian lattices |
| 3 | Representation densities, mass and theta coefficients |
| 4 | Lattice points, star bodies and homogeneous dynamics |
| 5 | Certified LLL reduction |
| 6 | Hermitian K-theory of exact categories |

Layers 0 and 1 are the geometry of numbers proper and are consumed by Layers 3, 4 and 5. Layer 2 is independent of Layer 1 except for the finiteness lemma 1.2.2, which Layer 3 uses. Layer 5 needs only Layer 0 and the first minimum of Layer 1. Layer 6 needs Layer 2 only for its field-level and signed hermitian comparisons and can be built in parallel with Layers 3–5.

## Scope and ownership

This roadmap owns: the covolume calculus of discrete full lattices in real inner-product spaces beyond what Mathlib and Tau Ceti state (Hadamard, projections, duals, primitive intersections); successive minima of a convex body with respect to a lattice and Minkowski's second theorem in both directions; Minkowski's linear forms theorem; integral quadratic lattices over a Dedekind domain with localisation, descent, genus and proper spinor genus over a number field; invariant factors over a discrete valuation ring and Voight's atomic normal forms; integral hermitian lattices over a quadratic extension, quaternionic hermitian lattices over a quaternion order, and signed hermitian forms over a local field of odd residue characteristic; hermitian representation counts, local densities, Siegel polynomials and the Cho–Yamauchi formula; finite stabilizers and class sets over number rings, the mass of a genus, the adelic mass identity and the mass formula for maximal lattices; the theta series of a positive definite lattice as a holomorphic function with its coefficients; Henk's lattice-point bounds and Davenport's estimate; Howe–Moore, ergodicity, Dani–Margulis, Ratner's three theorems, Margulis's theorem on quadratic values and Duke's theorem with their analytic inputs; packing and covering radii, Gaussian lattice sums and transference; star bodies, critical determinants, critical lattices and Mahler's criterion; Siegel's mean value theorem; certified LLL reduction; and the hermitian K-theory of exact categories from dualities to the nonconnective spectrum, with the ordinary K-theoretic and homotopical inputs it needs.

It leaves to other roadmaps, and cites: the field theory of quadratic forms (QuadraticFormInvariants Layers 1–6 and 9: hyperbolic planes and Witt cancellation, quaternion algebras, discriminants, the Witt ring, the Brauer-valued invariants, classification over a local field, the Scharlau transfer); isotropy and isometry over number fields (GlobalQuadraticForms Layers 5 and 6); integral lattices over `ℤ` and `ℤ_p` with their duals, discriminant groups, overlattices, Jordan splittings, genera over `ℤ`, Minkowski reduction and class-number finiteness over `ℤ`, the local automorphism density over `ℤ_p` and the masses over `ℤ` (Completed IntegralLattices Layers 1, 2 and 4; IntegralLattices milestones 2A–2G, 3A–3F, 4A–4C and 7A–7C); the spinor norm over a field with `2` invertible, its local tables and its adelic form over `ℚ` (OrthogonalSpinGroups Layers 1–3); the Pin and Spin groups and the double cover (RepresentationTheory/SpinRepresentations Layer 2); matrix Lie groups and the closed-subgroup theorem (RepresentationTheory/LieGroups Layer 2); finite adelic points, quotient and Tamagawa measures, reduction theory and the finite volume of arithmetic quotients (AdelicAlgebraicGroups AA.1, AA.2 and AA.3); exact structures and conflation-exact functors (GrothendieckEulerForms Layer 0, Tau Ceti `ExactStructure`) and exact Grothendieck groups (GrothendieckEulerForms Layer 2, Tau Ceti `ExactK0`); and Construction A (AlgebraicCodingTheory Layer 6). General theta modularity, strong approximation for spin groups and the Smith–Minkowski–Siegel formula for arbitrary genera stay with their owners. The harmonic ternary theta specialization and the numerical orthogonal Tamagawa input needed below are constructed here.

Already in Mathlib or Tau Ceti, used without restatement: Blichfeldt's theorem (`MeasureTheory.exists_pair_mem_lattice_not_disjoint_vadd`), Minkowski's first theorem in its strict and compact forms (`exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`, `…_le_measure`), the covolume of an ideal lattice under the mixed embedding (`NumberField.mixedEmbedding.covolume_idealLattice`, `covolume_integerLattice`), the bounded ideal-class representatives (`NumberField.exists_ideal_in_class_of_norm_le`) and the unit rank (`NumberField.Units.finrank_modTorsion`); the squared covolume as a Gram determinant (`ZLattice.covolume_sq_eq_det_gram`, Tau Ceti) and the Gram determinant of the image of an orthonormal basis as a squared normal determinant (`LinearMap.normDet_sq_eq_det_gram`, Mathlib, of which the family form `det Gram(v) = ‖det_b v‖²` is the case `U = EuclideanSpace 𝕜 (Fin n)`); the dual lattice (`LinearMap.BilinForm.dualSubmodule`); the spinor norm `θ(τ_{v₁}⋯τ_{v_r}) = [Q v₁ ⋯ Q v_r]` (Tau Ceti `CliffordAlgebra.spinorNorm`) and its finite adelic form over `ℚ` (`OrthogonalCompactOpens.adelicSpinorNorm`); the finiteness of isometries into a positive definite `ℤ`-lattice (`IntegralLattice.IsPosDef.finite_isometry`) and representation numbers (`IntegralLattice.representationNumber`); the Witt and Witt–Grothendieck rings of a field (`WittRing`, `WittGrothendieckRing`); involutive dualities on a category (`Functor.IsInvolutiveDual`, `Functor.dualityEquivalence`); lattice-point counts with an error term for Lipschitz boundaries (`TauCeti.NumberTheory.GeometryOfNumbers.LatticePointCount`), which Layer 4 does not reprove; and exact categories with their conflations, exact functors and `K₀` (`TauCeti.CategoryTheory.Exact`, `TauCeti.ExactK0`). Where a target here is a variant of one of these, its entry says in one clause how it differs.

## Conventions

**Lattices and volumes.** A lattice is a `Submodule ℤ E` with `DiscreteTopology` and `IsZLattice ℝ`; a lattice of lower rank is moved into its real span before any volume is taken. Volumes are the canonical Euclidean volumes of the space in question (`volume` on a finite-dimensional real inner-product space), with volume `1` in dimension zero; the covolume is `ZLattice.covolume`. Gram matrices use Mathlib's convention that the inner product is conjugate-linear in the first argument. An oriented determinant is never used as a covolume.

**Convex bodies and minima.** A body is a `ConvexBody E` with `0` in its interior; central symmetry is a separate hypothesis, assumed only where stated. The gauge is Mathlib's `gauge`. The successive minima are real numbers indexed by `i : Fin d`, `d = dim E`, with `i` meaning the `(i+1)`-st minimum; there is no minimum in dimension zero. The polar of a box is a weighted cross-polytope.

**Integral lattices.** Over a Dedekind domain `R` with fraction field `K`, an integral quadratic lattice is a `Submodule R V` with `Submodule.IsLattice K` and a quadratic map `q : V → K` with `q(L) ⊆ R`; it is projective and may be non-free, and no basis is stored. The quadratic map is primary: the polar pairing `B(x,y) = q(x+y) − q(x) − q(y)` is never divided by two silently, and whenever a symmetric bilinear lattice is compared with a quadratic one the convention `q(x) = B(x,x)/2` is written out, with the resulting factor `2^{−n}` in determinants and the sign `(−1)^{n(n−1)/2}` in signed discriminants. Localisation at a prime and completion at a prime are different operations. Rational isometry, integral isometry, genus and proper spinor genus are four different relations with four different types.

**Local fields.** At a nonarchimedean place `q` denotes the residue cardinality of the base field; an unramified quadratic extension has residue field of size `q²`. Representation counts count all form-preserving maps; embedding counts count injective ones. Haar measure on lattice coordinates gives the integral coordinate lattice volume `1`.

**Mass.** The mass of a genus is the sum of the reciprocals of the orders of the finite integral isometry groups over the classes of the genus; the proper mass uses proper classes and `SO`. The two are related by an index comparison that is a theorem, not a convention.

**Reduction.** The LLL parameter is `δ = 3/4`, Gram–Schmidt coefficients are exact rational numbers, shears use nearest integers in descending index order, and every output carries an integer change-of-basis certificate `U, V` with `UV = VU = I`.

**Dynamics.** Homogeneous spaces are `G/Γ` for a connected real matrix Lie group `G` and a lattice `Γ`, with the invariant probability measure; mixing, ergodicity, nondivergence, orbit closures, measure classification and equidistribution are separate statements.

**Exact categories and dualities.** An exact category is a Tau Ceti `ExactStructure` on a preadditive category with a zero object and biproducts. A strong duality is Tau Ceti's `IsInvolutiveDual` together with exactness of the duality functor. Symmetric spaces have a pairing isomorphism; a Lagrangian is an admissible inflation whose quotient is the dual of the subobject; hyperbolic spaces and the diagonal Lagrangian use biproducts and never divide by two. Invertibility of `2` is a hypothesis of the individual targets that need it and nothing else.

## Exact supplier contracts

**From Mathlib.** `ZLattice.covolume`, `covolume_eq_det_mul_measureReal`, `covolume_div_covolume_eq_relIndex'`, `ZSpan.isAddFundamentalDomain'`, `ZSpan.fundamentalDomain_ae_parallelepiped`, `ZLattice.comap`, `Module.Basis.ofZLatticeBasis`, `Matrix.gram` with `gram_eq_conjTranspose_mul`, `posSemidef_gram`, `det_gram_ne_zero_iff_linearIndependent`, `InnerProductSpace.gramSchmidt`, `gramSchmidtOrthonormalBasis` and `gramSchmidtOrthonormalBasis_det`, `Submodule.exists_smith_normal_form_of_le`, `LinearMap.BilinForm.dualSubmodule`, `dualBasis` and `dualSubmodule_span_of_basis`, `ConvexBody`, `gauge` and the gauge lemmas named in Layer 1, `MeasureTheory.exists_pair_mem_lattice_not_disjoint_vadd` and the two Minkowski theorems, `MeasureTheory.Measure.addHaar_image_linearMap` and `addHaar_preimage_linearMap`, `Convex.addHaar_frontier`, `MeasureTheory.volume_sum_rpow_le`, `Submodule.IsLattice`, `QuadraticMap`, `QuadraticForm`, `LinearMap.IsSymm`, `Quaternion` and `QuaternionAlgebra`, `Subgroup.index` and `relIndex`, `ZMod`, `Nat.card`, `Polynomial` with `derivative`, `Metric.infEDist`, `CategoryTheory.nerve`, `SSet.toTop`, `HomotopyGroup`, `CategoryTheory.Localization`, `IsPullback`, biproducts, `FreeAbelianGroup`. Each is used with its actual hypotheses; in particular `QuadraticMap.associated`, `QuadraticForm.discr` and `QuadraticForm.baseChange` are used only where `2` is invertible.

**From Tau Ceti.** `ZLattice.covolume_sq_eq_det_gram`; `IntegralLattice`, `IntegralLattice.dualCarrier`, `IsPosDef.finite_isometry`, `representationNumber`, `IntegralLattice.minimum`; `CliffordAlgebra.spinorNorm`, the local spinor-norm images and `OrthogonalCompactOpens.adelicSpinorNorm`; `WittRing`, `WittGrothendieckRing`, `QuadraticMap.scharlauTransfer`; `Functor.IsInvolutiveDual` and `dualityEquivalence`; `ExactStructure`, `ExactStructure.IsConflationExact`, `ExactStructure.op`, `ExactStructure.split`, `ExactK0`, `ExactK0.of`, `ExactK0.of_conflation`, `ExactK0.map`; `TauCeti.NumberTheory.GeometryOfNumbers.LatticePointCount`.

**From TauCetiRoadmap.QuadraticFormInvariants.** Layer 1 (hyperbolic decomposition, reflection generation and Witt cancellation over fields of characteristic not `2`), used by 2.1.1; Layer 2 (quaternion algebras and the standard involution), used by 2.8; Layer 3 (rank, determinant and signed discriminant with the `q = B(x,x)/2` scaling), used by 2.1.2; Layer 4 (the Witt ring), used by 2.1.3; Layer 5 (Hasse and Clifford invariants as Brauer classes), used by 2.1.4; Layer 6 (classification over a nonarchimedean local field by dimension, discriminant and Hasse invariant), used by 2.1.5 and 2.4; Layer 9 (the Scharlau transfer and its change-of-functional theorem in the quadratic case), used by 2.9.6. What is assumed is exactly the field statements; no integral consequence is read into them.

**From TauCetiRoadmap.GlobalQuadraticForms.** Layer 5 (Hasse–Minkowski isotropy over a number field), used by 2.1.6; Layer 6 (local-to-global isometry of regular forms), used by 2.1.7 and 2.4.1. Neither supplies an integral isometry.

**From Completed/IntegralLattices and TauCetiRoadmap/IntegralLattices.** Completed Layer 1 (the `ℤ`-carrier with a symmetric rational form), Layer 2 (duality and the discriminant group) and Layer 4 (overlattices and isotropic subgroups) are the three comparison targets of 2.3; IntegralLattices milestones 2A–2C, 2F–2G, 3A, 3F, 4C and 7A are the `ℤ`-cases that the variants of 1.2.1, 2.2.2, 2.4.1, 2.4.5, 3.3.1–3.3.3 and 3.4.1 cite.

**From TauCetiRoadmap.OrthogonalSpinGroups and RepresentationTheory/SpinRepresentations.** The spinor norm on `O(Q)` and `SO(Q)` over a field with `2` invertible (OrthogonalSpinGroups 1D), the local tables (2F), the adelic norm over `ℚ` (3F), and the spin double cover with kernel the spinor norm (SpinRepresentations Layer 2) are consumed by 2.4; no surjectivity of `Spin → SO` on local points is assumed.

**From AdelicAlgebraicGroups.** AA.1 (finite adelic points of a linear algebraic group with the restricted-product topology, and the induced map of adelic points along a homomorphism), used by 2.4; AA.2 (compatible Haar measures on local factors, quotient measures and `L²` of the quotient), used by 3.3.4, 4.2.1 and 4.2.2; AA.3 (reduction domains, finite volume of `G(K)\G(𝔸)` for semisimple `G`, and the quotient topology of `SL_n(ℝ)/SL_n(ℤ)`), used by 3.3.2, 3.3.4, 4.5.8 and 4.6.1. No Tamagawa number is read off from these.

**From TauCetiRoadmap.GrothendieckEulerForms.** Layer 0 (intrinsic exact structures, conflation-exact functors, biproduct conflations, the opposite exact structure), used throughout Layer 6; Layer 2 (exact Grothendieck groups), used by 6.4 and 6.1.2.

**From TauCetiRoadmap.AlgebraicCodingTheory.** Layer 6 (Construction A with its exact index, duality and parity hypotheses), used by 4.7.1.

**From RepresentationTheory/LieGroups.** Layer 2 supplies closed matrix subgroups and the Lie algebras of `SL_n` and `SO(p,q)`; Layer 9 supplies Cartan/KAK, restricted roots and root subgroups for 4.2. Their Lie-theoretic carriers do not supply measure rigidity.

**From TauCetiRoadmap.DifferentialGeometry.** Layer 12.1 supplies pullback and product Riemannian metrics; Layer 12.4 supplies `riemannianDensity`, its chart coefficient `chartVolumeDensity`, the existing measure `TauCeti.riemannianVolume`, and `integral_riemannianVolume_eq_integralDensity`. The compact SO sphere-submersion and its density factorization are the additional adapter in 3.3; the general manifold measure is not constructed again.

**From TauCetiRoadmap.ReductiveGroups.** Layer 9 supplies the explicit pinned Chevalley–Demazure group scheme over Z for a root datum, its split torus, base change and root subgroup maps. In 3.3 the SO toral basis is obtained from a basis of its full cocharacter lattice, not just the coroot lattice. The conversion to the real skew basis and the arithmetic comparison of the resulting differential are the additional targets here. The smooth maximal/Iwahori lattice models required by 3.3.8 retain their separate contracts.

## How to read the build

Layer 0 gives the Gram-determinant and covolume identities and the adapted bases behind them. Layer 1 defines successive minima and proves Minkowski's theorems. Layer 2 sets up integral quadratic and hermitian lattices over Dedekind domains with their local theory and their genera, and the comparisons that connect them to the field theory and to the `ℤ`-lattices of Tau Ceti. Layer 3 counts: finite-field representation numbers, local densities and Siegel polynomials, stabilizers, classes, mass, theta coefficients. Layer 4 is the analytic and dynamical side: lattice-point bounds, the homogeneous-dynamics theorems and their two arithmetic applications, transference, star bodies and critical lattices, Siegel's mean value theorem, lattices from codes. Layer 5 is the certified LLL algorithm. Layer 6 is hermitian K-theory of exact categories, beginning with the ordinary K-theoretic inputs it needs. Within Layer 2, build 2.2 and 2.7 before the field comparisons and the dual-quotient invariants. Within Layer 3, build the primitive/saturation counts and the 3.2.5 finite weights before the 3.2.4 polynomial, then the spherical Fourier comparison before its functional equation. The 3.4 theta convergence proof uses an elementary lattice-ball count from Layers 0–1 and does not depend on Layer 4. Within Layer 6, build 6.1a–b and 6.8a before their derived consumers, 6.6a filtering quotients before the cone suspension, and 6.10.6 multiplicative suppliers before the 6.10.4 stable comparison; the degree-zero presentations and formation comparison feed the topological comparisons. Each target's `*Needs:*` line names its inputs by subsection number or supplier, and every definition ends with its checks, which reappear as `example`s in `Suggested.lean`.
## Layer 0: Lattices, Gram determinants and covolumes

This layer is the calculus of covolumes of discrete full ℤ-submodules of a real inner-product space `E`. Everything is stated intrinsically: a lattice of lower rank is first moved into its real span, which carries the inherited inner product and its own Lebesgue measure, and every volume is the canonical Euclidean volume of the space in which it is taken, with volume one in dimension zero. The layer proves the Gram–Hadamard inequality in the hermitian generality needed by Couveignes’ counting argument, and establishes the three covolume identities of Horesh–Karasik’s appendix: the covolume of an orthogonal projection, the reciprocal covolume of the inner dual, and the equality of the covolumes of the two primitive intersections `Δ ∩ W` and `Δ ∩ W^⊥` of a self-dual lattice. The adapted-basis lemmas of 0.2 are the integral linear algebra these identities need (Smith normal form for a saturated sublattice, the projected basis, biorthogonal families) and are reusable on their own.

### 0.1 Gram determinants and the Hadamard inequality

Prove `orthonormal_coordinate_hadamard` (0.1.1): for an orthonormal basis b:Fin n→E over an RCLike field and any v:Fin n→E, ‖det_b(v)‖≤∏i ‖v_i‖.
b is a full orthonormal basis; n=0 and dependent families are allowed.
(Source: Couveignes2020, §3, printed p.494 (physical PDF p.8), Gram/covolume calculation.)
*Needs:* Mathlib `InnerProductSpace.gramSchmidtOrthonormalBasis`, `InnerProductSpace.gramSchmidtOrthonormalBasis_det`, `norm_inner_le_norm`, `Orientation.abs_volumeForm_apply_le`, Mathlib `LinearMap.normDet_sq_eq_det_gram`.
**Checks.**

- Orthogonal real columns (2,0),(0,3) attain determinant norm 6 and product norm 6.
- Columns (1,0),(1,1) have determinant norm 1 and product norm √2; equality fails.
- Duplicate nonzero columns have determinant 0 and positive product norms.

Prove `hermitian_gram_hadamard` (0.1.2): for any v:Fin n→E in a normed RCLike inner-product space, det Gram(v) is the scalar image of its real part, and 0≤Re(det Gram(v))≤∏i ‖v_i‖². The ambient space need not be finite-dimensional.
E is normed, not merely seminormed; n may be zero. No linear independence or nonsingularity assumption.
(Source: Couveignes2020, §3, printed p.494 (physical PDF p.8), Gram/covolume calculation.)
*Needs:* Mathlib `Matrix.det_gram_ne_zero_iff_linearIndependent`, `Matrix.posSemidef_gram`, `finrank_span_eq_card`, Mathlib `LinearMap.normDet_sq_eq_det_gram`, 0.1 `orthonormal_coordinate_hadamard`.
**Checks.**

- The empty Gram determinant and diagonal product both equal 1.
- Family (1,i) in C has Gram [[1,i],[-i,1]], determinant 0 and diagonal product 1; conjugation is essential.
- Real vectors (1,0),(1,1) have Gram [[1,1],[1,2]], determinant 1 and diagonal product 2.

Prove `gram_uniform_bound` (0.1.3): if D≥0 and every v_i in v:Fin n→E satisfies ‖v_i‖²≤D, then Re(det Gram(v))≤D^n.
The bound is on squared norms, not individual coefficients; n=0 is allowed.
(Source: Couveignes2020, §3, printed p.494 (physical PDF p.8), Gram/covolume calculation.)
*Needs:* 0.1 `hermitian_gram_hadamard`.
**Checks.**

- n=0,D=0 gives 1≤0^0=1.
- A nonempty zero family with D=0 has determinant 0.
- Two orthogonal vectors of squared norm 5 attain determinant 25, so replacing D^n by D fails.

### 0.2 Adapted integral bases, projections and biorthogonal families

E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero.

For 0.2.1, 0.2.6: Δ is a discrete full Z-submodule of E. W is a real subspace. L is the comap of Δ along W→E; span_R(L)=W, written intrinsically as span_R(L in W)=top. P is the image of Δ under orthogonal projection E→W-perp.
For 0.2.7, 0.2.8: E is a finite-dimensional real normed inner-product space, L a discrete full Z-submodule, and d=dim_R E. Reuse IsZLattice, Basis and Basis.flag. The minimum index i:Fin d is zero-based; dimension zero has no index.

Prove `saturated_adapted_basis` (0.2.1): With E, Δ, W and L as in the hypotheses, there exist natural numbers r,s, an integral basis b of Δ indexed by Fin r disjoint-union Fin s, and an integral basis c of L indexed by Fin r, such that b(inl i)=c_i in E for every i. Consequently r=dim W, s=dim W-perp and r+s=dim E; no orthogonality of the integral complement is asserted.

(Source: Horesh–Karasik2023, Proposition B.4, published p.1290, basis-completion step.)
*Needs:* Mathlib `Submodule.exists_smith_normal_form_of_le`, `instModuleFinite_of_discrete_submodule`, `instModuleFree_of_discrete_submodule`, `ZLattice.comap_discreteTopology`, `Module.Basis.isUnitSMul`, `Module.Basis.ofZLatticeBasis`, `Submodule.finrank_add_finrank_orthogonal`, `Module.finrank_eq_card_basis`.
**Checks.**

- Columns (1,1),(0,1) form an integral basis: determinant 1.
- No matrix with first column (2,0) and an integral second column has determinant ±1.
- The zero lattice in zero-dimensional Euclidean space admits the empty integral basis.

Prove `projected_adapted_basis` (0.2.2): let b be an integral basis of a full lattice Δ indexed by Fin r disjoint-union Fin s, c a real basis of W indexed by Fin r, and b(inl i)=c_i in E. Then the vectors q_j=π(b(inr j)), with π:E→W-perp orthogonal projection, form a real basis q of W-perp, and their integral span is exactly P=π(Δ). In particular P is discrete and full in W-perp; these properties are conclusions.
Δ is a discrete full lattice, b and c are the displayed actual bases, and the first block equality is assumed; no image discreteness, rational coordinate matrix or orthogonal integral splitting is assumed.
(Source: Horesh–Karasik2023, Proposition B.4, published p.1290, projected last block; Appendix introduction pp.1284–1285.)
*Needs:* Mathlib `Module.Basis.ofZLatticeBasis`, `Submodule.ker_orthogonalProjectionOnto`, `Submodule.isCompl_orthogonal`, `ZSpan.discreteTopology_pi_basisFun`, `instIsZLatticeRealSpan`, `Module.Basis.restrictScalars`.
**Checks.**

- Projecting e₂ orthogonally off R(1,1) gives (−1/2,1/2), not (−1,1).
- Projection off the full ambient space sends every integral submodule to the zero submodule of the zero-dimensional complement.
- The projection of Z² off the diagonal is exactly the integral span of the projected e₂.

Prove `gram_det_adapted_projection` (0.2.3): let b be a real basis of E indexed by Fin r disjoint-union Fin s and c a real basis of W indexed by Fin r, with b(inl i)=c_i in E. Then det Gram(b)=det Gram(c)·det Gram(j↦π(b(inr j))), where π:E→W-perp and each Gram matrix uses the intrinsic real inner product.
The first block spans W and is a basis of W; r or s may be zero.
(Source: Horesh–Karasik2023, Proposition B.4, published p.1290, block-triangular determinant proof.)
*Needs:* Mathlib `stdOrthonormalBasis`, `Module.Basis.prod`, `Submodule.prodEquivOfIsCompl`, `Submodule.isCompl_orthogonal`, `Matrix.det_fromBlocks_zero₂₁`, Mathlib `LinearMap.normDet_sq_eq_det_gram`.
**Checks.**

- The adapted columns (1,1),(0,1) give Gram determinant 1 = 2·(1/2).
- A sign-reversed coordinate basis has determinant −1 but Gram determinant 1.
- Empty Gram determinants multiply as 1 = 1·1.

Prove `gram_det_biorthogonal` (0.2.4): for real bases b,d of E indexed by Fin n satisfying inner(b_i,d_j)=δ_ij, det Gram(b)·det Gram(d)=1. This includes n=0 and does not say either basis is orthonormal.
b and d are actual real bases, with the displayed mixed inner products.
(Source: Horesh–Karasik2023, Corollary A.3, published p.1285, reciprocal Gram determinants; proof of A.1, p.1284, biorthogonality.)
*Needs:* Mathlib `stdOrthonormalBasis`, `OrthonormalBasis.sum_inner_mul_inner`, `Matrix.det_mul`, `Matrix.det_conjTranspose`, Mathlib `LinearMap.normDet_sq_eq_det_gram`.
**Checks.**

- The paired real bases 2 and 1/2 have Gram determinants 4 and 1/4.
- Gram matrices [[2,1],[1,1]] and [[1,−1],[−1,2]] have determinant product 1.
- Two copies of the basis vector 2 are not a biorthogonal pair: their Gram determinant product is 16, not 1.

Prove `dual_projection_comap` (0.2.5): for any Z-submodule Δ of E and real subspace W, let π:E→W-perp be orthogonal projection. The intrinsic inner dual of π(Δ) equals the comap of the ambient inner dual Δ* along W-perp→E: (π(Δ))*=Δ*∩W-perp. Here every dual is the BilinForm.dualSubmodule with the real inner product. No discreteness, fullness or rationality is required for this equality of submodules.
Dual means integer-valued pairing with every member of the submodule; the intrinsic dual is formed inside W-perp.
(Source: Horesh–Karasik2023, Proposition B.5, published p.1291, corrected pairing proof.)
*Needs:* Mathlib `LinearMap.BilinForm.dualSubmodule`, `ZLattice.comap`, `Submodule.inner_orthogonalProjectionOnto_eq_of_mem_left`.
**Checks.**

- The integral span of any finite real orthonormal basis is self-dual for the integer-valued inner pairing.
- For Δ=2Z in R the dual is (1/2)Z, so an arbitrary ambient lattice cannot be substituted for its dual.
- The dual of the projected Z² lattice in the diagonal's orthogonal line is exactly Z² intersected with that line.

Prove `orthogonal_intersection_basis` (0.2.6): Under the full-lattice and rational-intersection hypotheses on Δ,W,L, assume Δ*=Δ for the real inner pairing. Then there exist s and a real basis q of W-perp indexed by Fin s such that span_Z(q)=Δ∩W-perp, with s=dim W-perp. Thus the primitive orthogonal intersection is a discrete full lattice in its intrinsic space.
Ambient self-duality Δ*=Δ is required, not merely covolume one or integrality.
(Source: Horesh–Karasik2023, Corollary A.2, p.1285, and Proposition B.5, p.1291.)
*Needs:* Mathlib `Module.Basis.ofZLatticeBasis`, `LinearMap.BilinForm.dualBasis`, `LinearMap.BilinForm.dualSubmodule_span_of_basis`, `ZSpan.discreteTopology_pi_basisFun`, `instIsZLatticeRealSpan`, 0.2 `saturated_adapted_basis`, 0.2 `projected_adapted_basis`, 0.2 `dual_projection_comap`.
**Checks.**

- The orthogonal intersection for the diagonal in Z² is the integral span of a real basis indexed by one element.
- The orthogonal intersection for the full plane has an empty real basis.
- The orthogonal intersection for the zero subspace in the plane has a two-element real basis.

Prove `saturated_adapted_basis_of_basis` (0.2.7): if W is a real subspace whose intersection with L spans W, every prescribed integral basis c:Fin r→(L∩W) extends to an integral basis b of L indexed by Fin r disjoint-union Fin s, with r+s=d and initial vectors exactly c_i in E.
L∩W means the lattice comap along W→E. The input c is a basis of this saturated intersection, not an independent family of nontrivial index.
(Source: Henk2002, p.3, simultaneous integral-basis statement before (2.1).)
*Needs:* Mathlib `Module.Basis.constr`, `Module.Basis.equiv`, `Module.finrank_eq_card_basis`, `ZLattice.rank`, 0.2 `saturated_adapted_basis`.
**Checks.**

- The columns (1,1),(0,−1) have determinant −1, so orientation reversal is allowed.
- Every matrix with first column (2,0) has even determinant, hence cannot be an integral basis of Z².

Prove `exists_integral_basis_same_flag` (0.2.8): for a real basis w:Fin d→E with w_i∈L, there is an integral basis b:Fin d→L whose real extension has exactly the same basis flags as w at every k=0,…,d.
Equality concerns real prefix spans, not equality of the vectors or their integral spans. The w_i need not be an integral basis.
(Source: Henk2002, p.3, prefix-span equality and (2.1).)
*Needs:* Mathlib `Module.Basis.flag`, `Module.Basis.span`, `Module.Basis.ofZLatticeBasis`, `ZLattice.comap_discreteTopology`, `ZLattice.rank`, `Module.finrank_eq_card_basis`, 0.2 `saturated_adapted_basis_of_basis`.
**Checks.**

- The columns (1,1),(1,−1) have determinant −2: an independent integral-valued real basis is not necessarily an integral basis.
- For the standard real basis of R³, x lies in flag 2 exactly when x_2=0.

### 0.3 Covolumes of projections, duals and primitive intersections

E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero.

*Standing hypotheses.* E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero.

Prove `covolume_projection` (0.3.1): Under the full-lattice and rational-intersection hypotheses on Δ,W,L, the projected lattice P=π(Δ) in W-perp satisfies covol(P)=covol(Δ)/covol(L), with canonical intrinsic Euclidean volumes. No unimodularity or self-duality of Δ is assumed.
Δ is a discrete full Z-submodule of E. W is a real subspace. L is the comap of Δ along W→E; span_R(L)=W, written intrinsically as span_R(L in W)=top. P is the image of Δ under orthogonal projection E→W-perp.
(Source: Horesh–Karasik2023, Proposition B.4, published p.1290.)
*Needs:* Mathlib `Module.Basis.ofZLatticeBasis`, `Module.Basis.restrictScalars`, `ZLattice.covolume_pos`, 0.2 `saturated_adapted_basis`, 0.2 `projected_adapted_basis`, 0.2 `gram_det_adapted_projection`, Tau Ceti `ZLattice.covolume_sq_eq_det_gram`.
**Checks.**

- The projected Z² lattice off the diagonal has intrinsic covolume 1/√2.
- The zero lattice in zero-dimensional Euclidean space has intrinsic covolume 1.
- For Δ=2Ze₁⊕3Ze₂ and L=2Ze₁ the projected covolume is 3=6/2, not 1/2.

Prove `covolume_dual` (0.3.2): for a discrete full Z-lattice L in a finite-dimensional real inner-product space E with canonical intrinsic Euclidean volume, covol(L*)=covol(L)^{-1}, where L* is the integer-valued inner dual in E. The full-lattice property of L* follows from the dual-basis and span-basis results and is not an additional assumption.
L is discrete and spans E over R. A lower-rank lattice is first transported into its real span; its ambient polar is not used.
(Source: Horesh–Karasik2023, Corollary A.3, published p.1285.)
This variant uses real covolumes of the inner dual, rather than rational Gram determinants, and includes dimension zero.
*Needs:* Mathlib `Module.Basis.ofZLatticeBasis`, `Module.Basis.ofZLatticeBasis_span`, `LinearMap.BilinForm.dualBasis`, `LinearMap.BilinForm.apply_dualBasis_right`, `LinearMap.BilinForm.dualSubmodule_span_of_basis`, `Module.Basis.restrictScalars`, `ZSpan.discreteTopology_pi_basisFun`, `instIsZLatticeRealSpan`, `ZLattice.covolume_pos`, 0.2 `gram_det_biorthogonal`, Tau Ceti `ZLattice.covolume_sq_eq_det_gram`.
**Checks.**

- The inner dual of 2Z in R has covolume 1/2.
- The standard integral lattice in Euclidean n-space has covolume one, including n=0.
- The ambient inner dual of the zero subgroup in R is all of R, not a discrete full lattice; a lower-rank lattice must be dualized inside its span.

Prove `primitive_orthogonal_covolume` (0.3.3): let Δ be a discrete full self-dual lattice in E for the real inner pairing, and W a real subspace such that L=Δ∩W spans W. Then K=Δ∩W-perp is a full lattice in W-perp and covol(K)=covol(L), intrinsically. In particular, for rational W in R^n and Δ=Z^n, the primitive intersections W∩Z^n and W-perp∩Z^n have equal covolumes. This includes n=0, W=0 and W=E.
Δ is a discrete full Z-submodule of E. W is a real subspace. L is the comap of Δ along W→E; span_R(L)=W, written intrinsically as span_R(L in W)=top. P is the image of Δ under orthogonal projection E→W-perp. Self-duality Δ*=Δ is explicit. For Z^n use the integral span of the standard orthonormal basis; rational W means its integral intersection spans it.
(Source: Horesh–Karasik2023, Corollary B.6, published p.1291; Couveignes2020 p.493 uses its standard-lattice case.)
*Needs:* Mathlib `LinearMap.BilinForm.dualSubmodule_span_of_basis`, `LinearMap.BilinForm.dualBasis_eq_iff`, `OrthonormalBasis.inner_eq_ite`, `ZLattice.covolume_pos`, 0.2 `orthogonal_intersection_basis`, 0.2 `saturated_adapted_basis`, 0.2 `projected_adapted_basis`, 0.3 `covolume_projection`, 0.3 `covolume_dual`, 0.2 `dual_projection_comap`.
**Checks.**

- Both primitive diagonal and antidiagonal intersections in Z² have intrinsic covolume √2.
- Replacing the primitive generator (1,1) by (2,2) doubles its one-dimensional covolume while leaving its orthogonal line unchanged.
- The primitive diagonal and antidiagonal generators form an index-two sublattice, not an integral basis of Z².

### Examples

`ℤ(1,1)` in its own line has intrinsic covolume `√2` and Gram determinant `2`, while the ambient plane gives it volume `0`. For `W = ℝ(1,2) ⊂ ℝ²` and `Δ = ℤ²`, the intersections `W ∩ ℤ² = ℤ(1,2)` and `W^⊥ ∩ ℤ² = ℤ(2,−1)` both have covolume `√5`, as 0.3.3 predicts. The lattice `2ℤ ⊕ 3ℤ` has covolume `6` and inner dual `½ℤ ⊕ ⅓ℤ` of covolume `1/6`. The empty family in the zero space has Gram determinant `1` and the zero lattice has covolume `1`.

### Dependencies

Mathlib only: `ZLattice.covolume` and `covolume_eq_det_mul_measureReal`, `Matrix.gram`, `InnerProductSpace.gramSchmidtOrthonormalBasis`, `Submodule.exists_smith_normal_form_of_le`, `LinearMap.BilinForm.dualSubmodule` and the orthogonal-projection API.

## Layer 1: Convex bodies, successive minima and Minkowski’s theorems

This layer defines the successive minima `λ_i(L, K)` of a convex body `K` with `0` in its interior with respect to a discrete full lattice `L`, as real numbers indexed by `Fin d` with `d = dim E`, and proves both halves of Minkowski’s second theorem in their sharp form, Minkowski’s linear forms theorem with its boundary convention, and the elementary ordered-product and ball-volume bounds that the counting arguments of Layer 4 use. The lower inequality is the weighted cross-polytope argument; the upper inequality follows Henk’s short proof through volumes of unions of translates of `½K` along a flag of coordinate boxes (1.5). The minima are defined on the carriers `IsZLattice` and `ConvexBody`; the symmetric hypothesis is imposed only where the statement needs it.

### 1.1 Elementary product and volume bounds

Couveignes2020, §3, printed p.494 (physical PDF p.8), ordered norms and intrinsic closed-ball volume supplies `ordered_tail_product`, `ordered_product_root_bound`, `orthonormal_cube_volume`, `inscribed_cube`, `intrinsic_ball_lower_bound`.

Prove `ordered_tail_product` (1.1.1): for monotone a:Fin n→R with a_j≥1, every i:Fin n satisfies a_i^(n−i.val)≤∏j a_j.
Indices are zero-based; tail length n−i.val is strictly positive. The lower bound 1 and monotonicity are both load-bearing.
**Checks.**

- For (1,2,4), the three left sides are 1,4,4 and total product is 8.
- Dropping a_j≥1 fails for (1/2,2): final term 2 exceeds total product 1.
- Dropping ordering fails for (4,1): first square 16 exceeds product 4.

Prove `ordered_product_root_bound` (1.1.2): if a:Fin n→R is monotone, a_j≥1, and ∏j a_j≤V, then a_i≤V^(1/(n−i.val)) for every i:Fin n, using Real.rpow.
V≥1 follows from the hypotheses; no negative-base root. n−i.val>0 follows from i:Fin n; n=0 has no requested index.
*Needs:* Mathlib `Real.le_rpow_inv_iff_of_pos`, 1.1 `ordered_tail_product`.
**Checks.**

- All terms 1 and V=1 give equality.
- For (1,2,4),V=8, the final bound has exponent 1, not 1/0.
- For (2,2),V=4, the first bound 2≤√4 is exact.

Prove `orthonormal_cube_volume` (1.1.3): for a full real orthonormal basis b:Fin n→E and r≥0, volume_E{x : every |(b.repr x)_i|≤r}=ENNReal.ofReal((2r)^n).
E finite-dimensional with Borel structure and canonical volume. n=0 and r=0 allowed; no new cube type.
*Needs:* Mathlib `OrthonormalBasis.measurePreserving_repr`, `PiLp.volume_preserving_ofLp`, `Real.volume_Icc_pi`.
**Checks.**

- n=0,r=0 gives volume 1.
- n=1,r=0 gives volume 0.
- n=2,r=3 gives 36, not 9: r is half-side length.

Prove `inscribed_cube` (1.1.4): for a real orthonormal basis b:Fin n→E and n>0, the coordinate cube |(b.repr x)_i|≤1/√n is contained in closedBall_E(0,1).
The norm is Euclidean and b orthonormal; a general algebraic basis is insufficient. The normalized radius requires n>0.
*Needs:* Mathlib `EuclideanSpace.real_norm_sq_eq`.
**Checks.**

- n=1 gives [−1,1], whose endpoints have norm 1.
- n=4 gives half-side 1/2; the vertex with all four coordinates 1/2 has squared norm 1.
- Half-side 1 fails for n=2 at (1,1).

Prove `intrinsic_ball_lower_bound` (1.1.5): for a finite-dimensional real inner-product space E with an orthonormal basis indexed by Fin n and n>0, ENNReal.ofReal((2/√n)^n)≤volume_E(closedBall_E(0,1)). The real lower constant equals 2^n·n^(−n/2).
Intrinsic volume on E; for a proper subspace of R^M instantiate E with the subspace. This is a closed ball, not its boundary sphere. Dimension zero has unit volume and is separate from division by √0.
*Needs:* 1.1 `orthonormal_cube_volume`, 1.1 `inscribed_cube`.
**Checks.**

- n=1 gives exact lower bound 2.
- n=4 gives lower constant 1.
- n=2 gives lower constant 2, not 4; ambient volume of a ball in a proper subspace is zero and cannot satisfy this intrinsic estimate.

### 1.2 Successive minima

Evertse2023, §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14) supplies `successiveMin_def`, `finite_gauge_sublevel`, `exists_min_gauge_outside`, `exists_greedy_gauge_family`, `successiveMin_isLeast`, `successiveMin_pos`, `successiveMin_monotone`, `successiveMin_le_iff`, `exists_successiveMin_witnesses`, `successiveMin_smul_body`.

*Standing hypotheses.* E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the IsZLattice carrier). K is an ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Define `successiveMin_def` (1.2.1): for a Z-submodule L of a finite-dimensional real normed space E, K:ConvexBody E and i:Fin d, define λ_i(L,K) as the real infimum of A_i={r∈R : 0≤r and i.val+1≤dim_R span_R{x∈L : gauge K x≤r}}. This is a real-valued function on carriers. Its geometric laws require L discrete and full and 0∈interior K; central symmetry is needed for Minkowski’s product inequality.
Its API is `successiveMin_def` (λ_i is the infimum of the nonnegative gauge-rank thresholds A_i specified in the definition.); `successiveMin_isLeast` (For every i:Fin d, λ_i(L,K) is the least element of A_i={r≥0 : dim span_R{x∈L : gauge K x≤r}≥i.val+1}.); `successiveMin_pos` (For every i:Fin d, 0<λ_i(L,K).); `successiveMin_monotone` (The function i↦λ_i(L,K), on Fin d, is monotone.); `successiveMin_le_iff` (For r≥0, λ_i(L,K)≤r if and only if i.val+1≤dim_R span_R((L:Set E)∩r·(K:Set E)).); `exists_successiveMin_witnesses` (There exists a real basis b indexed by Fin d such that b_i∈L, gauge K b_i=λ_i(L,K), and every x∈L of gauge<λ_i lies in span_R{b_j:j<i}. In particular b_i∈λ_iK and all minimum bounds are attained by one independent family.); `successiveMin_antitone_body` (If K⊆K' and both bodies contain zero in their interior, then λ_i(L,K')≤λ_i(L,K) for every i.); `successiveMin_monotone_lattice` (If L≤M are discrete full lattices in the same E, then λ_i(M,K)≤λ_i(L,K).); `successiveMin_smul_body` (For c>0, λ_i(L,cK)=λ_i(L,K)/c. The scalar action on ConvexBody is the one.); `successiveMin_linearEquiv` (Let e:E≃_R F, L'=e(L) as integral submodules, and K'=e(K) as convex bodies. For valid indices i,j with i.val=j.val, λ_j(L',K')=λ_i(L,K). Finite-dimensional normed real E,F and the discrete/full/interior hypotheses are understood. The equivalence need not be orthogonal or unimodular.); `successiveMin_first_le_iff` (If d>0 and r≥0, λ_0(L,K)≤r if and only if there exists x∈L with x≠0 and x∈rK.); `successiveMin_box` (Let b be a real basis of E indexed by Fin d, L=span_Z(range b), and a:Fin d→R positive and nondecreasing. If K is the convex body {x:∀j, a_j|b.repr(x)_j|≤1}, then λ_i(L,K)=a_i for every i.); `successiveMin_crosspolytope` (With b,L and positive nondecreasing a as for rectangular-body-minima, let K={x:Σ_j a_j|b.repr(x)_j|≤1}. Then λ_i(L,K)=a_i. Together with weighted-crosspolytope-volume, this attains equality in minkowski-second-lower.).
This variant takes any convex body with `0` in its interior and is real-valued; for the Euclidean ball it agrees with squared-length minima after a square root.
*Needs:* Mathlib `ConvexBody`, `gauge`, `finrank_span_eq_card`, `gauge_closedBall`.
**Checks.**

- For L=Z⊂R and K=[−2,2], λ_0(L,K)=1/2.
- For L=Z² and K={|x_0|≤1/2, |x_1|≤1/3}, (λ_0,λ_1)=(2,3).
- For the zero lattice in R^0 and its singleton convex body, the product over all minima indices is 1.
- For L=2Z in R and K=[−1,1], λ_0=2, not 1.
- On K=closedBall(0,1), the defining rank condition is dim span{x∈L : norm x≤r}≥i.val+1.
- In Z² with the unit square, vectors (1,1),(1,−1) independently attain both minima 1 but their integral span has index two.
- In Z and K=[−1,1], the attained minimum 1 has nonzero boundary witnesses; the strict sublevel {x∈Z : gauge K x<1} is {0}.
- For a lattice that is not full (`ℤ(1,0)` in `ℝ²`) the minima beyond the rank are the junk value `0` of `sInf ∅`; this is why every law of 1.2 assumes `IsZLattice ℝ L`.

Prove `finite_gauge_sublevel` (1.2.2): for every real R, the set {x∈L : gauge K x≤R} is finite.
*Needs:* Mathlib `gauge_nonneg`, `gauge_eq_zero`, `gauge_smul_of_nonneg`, `gauge_le_one_iff_mem_closure`, `ConvexBody.isClosed`, `ConvexBody.isCompact`, `ZSpan.setFinite_inter`, `Module.Basis.ofZLatticeBasis`, `Module.Basis.ofZLatticeBasis_span`, `absorbent_nhds_zero`, `IsCompact.isVonNBounded`.
**Checks.**

- Negative bound gives the empty set.
- Bound zero gives precisely the zero lattice vector.
- For Z² and the unit square, bound 2 gives 25 points.

Prove `exists_min_gauge_outside` (1.2.3): if W<E is a proper real subspace, there is v∈L∖W with gauge K v≤gauge K x for every x∈L∖W. In particular the selected gauge is positive.
*Needs:* Mathlib `IsZLattice`, `Set.exists_min_image`, `gauge_pos`, `absorbent_nhds_zero`, `ConvexBody.isCompact`, `IsCompact.isVonNBounded`, 1.2 `finite_gauge_sublevel`.
**Checks.**

- For Z², the rectangle with minima 2,3, and W=Re_0, the least outside gauge is 3.
- W=top is excluded because the complement is empty.

Prove `exists_greedy_gauge_family` (1.2.4): There is a real-linearly-independent family v:Fin d→L such that a_i=gauge K v_i is positive and nondecreasing, and every x∈L with gauge K x<a_i lies in span_R{v_j:j<i}. The family has d members and thus spans E over R. No integral-basis claim is made.
*Needs:* Mathlib `linearIndependent_finSucc'`, `finrank_span_eq_card`, `basisOfLinearIndependentOfCardEqFinrank'`, 1.2 `exists_min_gauge_outside`.
**Checks.**

- Repeated minima are allowed: the unit square has both values 1.
- Strict inequality in the flag is essential: e_0 has gauge equal to the first minimum and does not lie in the zero prefix.

Prove `successiveMin_isLeast` (1.2.5): for every i:Fin d, λ_i(L,K) is the least element of A_i={r≥0 : dim span_R{x∈L : gauge K x≤r}≥i.val+1}.
*Needs:* Mathlib `Submodule.finrank_mono`, `finrank_span_eq_card`, `Real.sInf_nonneg`, 1.2 `successiveMin_def`, 1.2 `exists_greedy_gauge_family`.
**Checks.**

- A_i contains its endpoint; replacing ≤ by < in the membership assertion is false.
- For the rectangle 2,3 the rank jumps from zero to one at 2 and from one to two at 3.

Prove `successiveMin_pos` (1.2.6): for every i:Fin d, 0<λ_i(L,K).
*Needs:* 1.2 `successiveMin_isLeast`, 1.2 `exists_greedy_gauge_family`.
**Checks.**

- For (1/2)Z and the unit interval the minimum is 1/2: positivity does not imply a lower bound of 1.

Prove `successiveMin_monotone` (1.2.7): The function i↦λ_i(L,K), on Fin d, is monotone.
*Needs:* 1.2 `successiveMin_isLeast`.
**Checks.**

- The unit cube has a constant sequence of minima; strict monotonicity is false.

Prove `successiveMin_le_iff` (1.2.8): for r≥0, λ_i(L,K)≤r if and only if i.val+1≤dim_R span_R((L:Set E)∩r·(K:Set E)).
*Needs:* Mathlib `gauge_eq_zero`, `gauge_smul_of_nonneg`, `gauge_le_one_iff_mem_closure`, `Submodule.finrank_mono`, `absorbent_nhds_zero`, `ConvexBody.isCompact`, `IsCompact.isVonNBounded`, 1.2 `successiveMin_isLeast`.
**Checks.**

- At r=0 the right side is false for every valid index.
- At r=λ_i the threshold holds.

Prove `exists_successiveMin_witnesses` (1.2.9): There exists a real basis b indexed by Fin d such that b_i∈L, gauge K b_i=λ_i(L,K), and every x∈L of gauge<λ_i lies in span_R{b_j:j<i}. In particular b_i∈λ_iK and all minimum bounds are attained by one independent family.
*Needs:* Mathlib `basisOfLinearIndependentOfCardEqFinrank'`, `gauge_le_one_iff_mem_closure`, `gauge_smul_of_nonneg`, `absorbent_nhds_zero`, 1.2 `exists_greedy_gauge_family`, 1.2 `successiveMin_isLeast`, 1.2 `successiveMin_pos`.
**Checks.**

- The unit-square diagonal pair has determinant −2 and attains both minima, so attainment alone does not certify an integral basis.
- The zero-dimensional family is an empty real basis and has no minimum value to evaluate.

Prove `successiveMin_antitone_body` (1.2.10): if K⊆K' and both bodies contain zero in their interior, then λ_i(L,K')≤λ_i(L,K) for every i.
(Source: direct body-monotonicity deduction from the threshold definition in Evertse §2.3, printed p.23.)
*Needs:* Mathlib `Submodule.finrank_mono`, 1.2 `successiveMin_le_iff`, 1.2 `successiveMin_pos`.
**Checks.**

- Changing [−1,1] to [−2,2] divides the only minimum by two.

Prove `successiveMin_monotone_lattice` (1.2.11): if L≤M are discrete full lattices in the same E, then λ_i(M,K)≤λ_i(L,K).
(Source: deduction from the threshold definition in Evertse §2.3, printed p.23; Lemma 2.8, pp.23–24, supplies attainment, rather than stating lattice monotonicity.)
*Needs:* Mathlib `Submodule.finrank_mono`, 1.2 `successiveMin_le_iff`, 1.2 `successiveMin_pos`.
**Checks.**

- 2Z⊂Z gives minima 2 and 1 for the unit interval.

Prove `successiveMin_smul_body` (1.2.12): for c>0, λ_i(L,cK)=λ_i(L,K)/c. The scalar action on ConvexBody is the one.
*Needs:* Mathlib `gauge_smul_left_of_nonneg`, `ConvexBody.coe_smul`, 1.2 `successiveMin_isLeast`.
**Checks.**

- Scaling the unit interval by 3 changes its minimum from 1 to 1/3.

Prove `successiveMin_linearEquiv` (1.2.13): let e:E≃_R F, L'=e(L) as integral submodules, and K'=e(K) as convex bodies. For valid indices i,j with i.val=j.val, λ_j(L',K')=λ_i(L,K). Finite-dimensional normed real E,F and the discrete/full/interior hypotheses are understood. The equivalence need not be orthogonal or unimodular.
(Source: Evertse2023, §2.3, change-of-coordinates remark after Theorem 2.9, printed pp.24–25 (physical pp.14–15); corrected nonsingularity hypothesis in sourceIssue E11.)
*Needs:* Mathlib `LinearEquiv.finrank_eq`, 1.2 `successiveMin_le_iff`, 1.2 `successiveMin_pos`.
**Checks.**

- Scaling both Z and [−1,1] by 2 preserves minimum 1; scaling only the lattice gives 2.
- A shear acts simultaneously on the standard lattice and unit square without changing their two minima.

Prove `successiveMin_first_le_iff` (1.2.14): if d>0 and r≥0, λ_0(L,K)≤r if and only if there exists x∈L with x≠0 and x∈rK.
(Source: Evertse2023, §2.3, definition and Lemma 2.8, pp.23–24; Henk p.2 before Theorem 1.2.)
*Needs:* Mathlib `finrank_span_eq_card`, `Submodule.finrank_mono`, 1.2 `successiveMin_le_iff`.
**Checks.**

- For Z and the unit interval, r=1 has witnesses ±1, while every 0≤r<1 has none.

Prove `exists_integral_minimum_flag` (1.2.15): There is an integral basis b:Fin d→L such that x∈L and gauge_K(x)<λ_i imply x belongs to the real flag of b at i, the span of its first i vectors.
E is a finite-dimensional real normed inner-product space, L a discrete full Z-submodule, and d=dim_R E. Reuse IsZLattice, Basis and Basis.flag. The minimum index i:Fin d is zero-based; dimension zero has no index. K is a ConvexBody with zero in its interior. Write λ_i=successiveMin L K i. Symmetry is imposed only on the final counting theorem. No bound on the individual gauges of b_i is claimed; only the attained real basis's flag is preserved.
(Source: Henk2002, pp.3–4, (2.1)–(2.3).)
*Needs:* Mathlib `Module.Basis.flag`, 1.2 `exists_successiveMin_witnesses`, 0.2 `exists_integral_basis_same_flag`.
**Checks.**

- The nonzero constant vector in R² does not belong to flag zero; equality at the first minimum is not a strict sublevel.
- The empty standard basis of R⁰ has flag zero equal to the entire zero space.

### 1.3 Minkowski’s lower inequality and its sharpness

Prove `weighted_crosspolytope_volume` (1.3.1): let E be a finite-dimensional real inner-product space with canonical volume, o an orthonormal basis and b any real basis, both indexed by Fin n. For positive a_i, volume{x:Σ_i a_i·|b.repr(x)_i|≤1}=ofReal((2^n/n!)·|det_o(b)|/∏_i a_i). Dimension zero is included.
E has the canonical inner-product volume; o is orthonormal and b is a basis, not an arbitrary dependent family. Each a_i>0. n can be zero.
(Source: Evertse2023, §2.3, proof of the lower bound in Theorem 2.9, printed p.27 (physical p.17).)
*Needs:* Mathlib `MeasureTheory.volume_sum_rpow_le`, `Real.Gamma_nat_eq_factorial`, `MeasureTheory.Measure.addHaar_image_linearMap`, `OrthonormalBasis.measurePreserving_repr`, `PiLp.volume_preserving_ofLp`, `Matrix.det_mul`, `volume_euclideanSpace_eq_dirac`, `Matrix.det_diagonal`.
**Checks.**

- n=0 gives volume one.
- With the standard basis and a=(2,3), the planar diamond has area 1/3.
- Replacing the basis by (2e_0,3e_1), with a=(1,1), gives area 12.

Prove `weighted_crosspolytope_subset` (1.3.2): let K be symmetric about zero with zero in its interior. For a real basis b and positive a_i, if b_i∈a_iK for every i, then {x:Σ_i a_i|b.repr(x)_i|≤1}⊆K.
K:ConvexBody E, 0∈interior K and x∈K implies −x∈K. b is a finite real basis. All a_i are positive. The containment is independent of any lattice or volume normalization.
(Source: Evertse2023, §2.3, Lemma 2.10 and lower-bound proof, printed pp.26–27 (physical pp.16–17).)
*Needs:* Mathlib `gauge_le_of_mem`, `gauge_sum_le`, `gauge_neg`, `gauge_smul_of_nonneg`, `gauge_le_one_iff_mem_closure`, `absorbent_nhds_zero`.
**Checks.**

- The diamond with vertices ±e_0,±e_1 is contained in the unit square.
- Without symmetry, containing b_i/a_i does not imply containing its negative.

Prove `covolume_le_abs_basis_det` (1.3.3): In a finite-dimensional real inner-product space with canonical volume, let L be a discrete full lattice, o an orthonormal basis and b a real basis with every b_i∈L. Then covolume(L)≤|det_o(b)|.
Both bases have the full ambient rank, including rank zero. L is discrete and full. The measure is intrinsic canonical Euclidean volume.
(Source: Evertse2023, §2.3, lower-bound proof, printed p.27 (physical p.17).)
*Needs:* Mathlib `ZLattice.covolume_div_covolume_eq_relIndex'`, `ZLattice.covolume_eq_det_mul_measureReal`, `ZLattice.covolume_pos`, `ZSpan.fundamentalDomain_ae_parallelepiped`, `OrthonormalBasis.volume_parallelepiped`, `instIsZLatticeRealSpan`, `Module.Basis.restrictScalars`.
**Checks.**

- The diagonal and antidiagonal vectors in Z² have absolute determinant 2≥1.
- For 2Ze_0⊕3Ze_1 the basis determinant and covolume are both 6.

Prove `minkowski_second_lower` (1.3.4): for a discrete full lattice L in a finite-dimensional real inner-product space E and a symmetric convex body K with zero in its interior, (2^d/d!)·covolume(L)≤(∏_{i:Fin d}λ_i(L,K))·volume.real(K). Here d=finrank_R E and volume is intrinsic canonical Euclidean volume. The formula holds also for d=0.
E is a finite-dimensional real inner-product space with Borel structure and canonical volume. L is a discrete full integral submodule. K is compact convex, centrally symmetric about zero, and has zero in its interior. A lower-rank lattice is first considered as a full lattice in its real span with that span’s own volume. No ambient-volume inequality for a measure-zero subspace is claimed.
(Source: Evertse2023, §2.3, Theorem 2.9 and its complete lower-bound proof, printed pp.24,26–27.)
*Needs:* Mathlib `ConvexBody.isCompact`, `volume_euclideanSpace_eq_dirac`, 1.2 `exists_successiveMin_witnesses`, 1.2 `successiveMin_pos`, 1.3 `weighted_crosspolytope_volume`, 1.3 `weighted_crosspolytope_subset`, 1.3 `covolume_le_abs_basis_det`.
**Checks.**

- For Z² and the unit diamond, product 1 times area 2 equals 2²/2!.
- For Z² and the unit square, product 1 times area 4 is strictly larger than 2.
- For 2Z and [−3,3], minimum 2/3 times length 6 equals 4=(2/1!)·2.
- For dimension zero both sides are 1.

Prove `successiveMin_box` (1.3.5): let b be a real basis of E indexed by Fin d, L=span_Z(range b), and a:Fin d→R positive and nondecreasing. If K is the convex body {x:∀j, a_j|b.repr(x)_j|≤1}, then λ_i(L,K)=a_i for every i.
b:Basis (Fin d) R E where d=finrank_R E. L is exactly its integral span. All a_i>0 and a is monotone. The stated set is the carrier of K.
(Source: Evertse2023, §2.3, Example 2, printed pp.25–26 (physical pp.15–16).)
*Needs:* Mathlib `finrank_span_eq_card`, `Submodule.finrank_mono`, 1.2 `successiveMin_le_iff`, 1.2 `successiveMin_pos`.
**Checks.**

- a=(2,3) gives minima 2,3.
- a=(1,1,4) gives a repeated first value; the two shortest lattice vectors may be opposites and still fail to be independent.

Prove `successiveMin_crosspolytope` (1.3.6): With b,L and positive nondecreasing a as for rectangular-body-minima, let K={x:Σ_j a_j|b.repr(x)_j|≤1}. Then λ_i(L,K)=a_i. Together with weighted-crosspolytope-volume, this attains equality in minkowski-second-lower.
b:Basis (Fin d) R E where d=finrank_R E. L is exactly its integral span. All a_i>0 and a is monotone. The weighted l1 set is the carrier of K.
(Source: Evertse2023, §2.3, Example 3 and Exercise 2.9, printed p.26 (physical p.16).)
*Needs:* Mathlib `finrank_span_eq_card`, `Submodule.finrank_mono`, `ZLattice.covolume_eq_det_mul_measureReal`, 1.2 `successiveMin_le_iff`, 1.2 `successiveMin_pos`, 1.3 `weighted_crosspolytope_volume`.
**Checks.**

- a=(2,3), b standard in R² gives minima 2,3 and area 1/3, so the product-volume is 2.
- Empty dimension has no minimum index and still attains the volume-product equality 1.

### 1.4 Minkowski’s linear forms theorem

Prove `linear_forms_box_volume` (1.4.1): for n≥0, an invertible real n×n matrix A and positive a_i, the set C={x∈R^n:∀i, |(Ax)_i|≤a_i} has volume ofReal(2^n·(∏a_i)/|det A|).
The matrix is square and det A≠0; all a_i>0. Lebesgue measure is the product volume on Fin n→R. n=0 is allowed for this volume identity.
(Source: Evertse2023, §2.2, Corollary 2.6, printed p.20 (physical p.10).)
*Needs:* Mathlib `LinearMap.det_toLin'`, `LinearMap.equivOfDetNeZero`, `MeasureTheory.Measure.addHaar_preimage_linearMap`, `Real.volume_Icc_pi`.
**Checks.**

- For n=1, A=(−2) and a=3 the set is [−3/2,3/2] of length 3.
- For A=diag(2,3), a=(2,3), the region is the unit square of area 4.
- For n=0 the determinant, coordinate product and volume are one.

Prove `minkowski_linear_forms` (1.4.2): for n≥1, an invertible real n×n matrix A and positive a_i with ∏a_i≥|det A|, there exists z∈Z^n, z≠0, with |Σ_j A_ij z_j|≤a_i for every i. Every coordinate inequality is non-strict, including at equality in the determinant bound.
n≥1, A:Matrix(Fin n,Fin n,R), det A≠0, all a_i>0, and ∏a_i≥|det A|. No rationality of the matrix entries is required.
(Source: Evertse2023, §2.2, Corollary 2.6 and complete proof, printed p.20 (physical p.10).)
*Needs:* Mathlib `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure`, `ZSpan.isAddFundamentalDomain'`, `ZSpan.volume_fundamentalDomain`, `instIsZLatticeRealSpan`, 1.4 `linear_forms_box_volume`.
**Checks.**

- For n=1, A=(2), a=2, z=1 is a boundary witness; replacing ≤ with < would eliminate every nonzero integer witness.
- A determinant of −2 has the same threshold as 2.
- n=0 is excluded: its only integer vector is zero despite the empty-product determinant inequality.

### 1.5 Minkowski’s upper inequality

For 1.5.11, 1.5.12, 1.5.13, 1.5.14, 1.5.15, 1.5.16, 1.5.20: These are sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the zero-dimensional convention.
For 1.5.2, 1.5.3, 1.5.4, 1.5.5, 1.5.6, 1.5.7: E and F are finite-dimensional real normed vector spaces with their Borel measurable structures; μ and ν are additive Haar measures on E and F. Use their product measure μ×ν. The spaces may have dimension zero. For a finite indexing type I and v:I→E, write U_v(K)=⋃_{i∈I}{(v_i+x,y):(x,y)∈K}. Write f₁,r(x,y)=(rx,y), f₂,r(x,y)=(x,ry). These are ordinary finite unions and linear maps, not new constructors or carrier types.

Prove `finite_interior_disjoint_translate_volume` (1.5.1): let K⊆E be compact and convex, and v:I→E a finite family. If v_i+int(K) and v_j+int(K) are disjoint whenever i≠j, then μ(⋃_i(v_i+K))=|I|·μ(K). Equality is in the nonnegative extended reals.
E is finite-dimensional real normed with Borel structure; μ is an additive Haar measure. No symmetry, origin condition or positive-dimensional interior of K is required. The index type may be empty. Repeated translation vectors are not silently deduplicated; the stated interior-disjointness hypothesis controls when the cardinal factor is valid.
(Source: Henk2002, p.5 (3.2), and p.6 the two volume factorizations after (3.4).)
*Needs:* Mathlib `Convex.addHaar_frontier`, `Convex.translate`, `Homeomorph.image_interior`, `IsCompact.image`, `IsCompact.isClosed`, `IsClosed.measurableSet`, `MeasureTheory.measure_iUnion₀`, `MeasureTheory.measure_preimage_mul_right`.
**Checks.**

- The closed intervals [0,1] and [1,2] have union of real volume 2 despite sharing an endpoint.
- Two copies of [0,1] have union volume 1, not 2; their interiors are not disjoint.

Prove `finite_translate_section` (1.5.2): for every K⊆E×F, y∈F and finite v:I→E, {x:(x,y)∈U_v(K)}=⋃_i(v_i+{x:(x,y)∈K}).

(Source: Henk2002, p.6, the section inclusion between (3.6) and the successive integrations.)
**Checks.**

- The union of translates of [0,1] indexed by Fin 0 is the empty real set.

Prove `convex_section_enlargement` (1.5.3): if K⊆E×F is convex and r≥1, then for every y∈F there exists t∈E such that {x:(x,y)∈U_v(K)}⊆t+{x:(x,y)∈U_v(f₁,r(K))}.

(Source: Henk2002, p.6, pointwise t(x) inclusion immediately after (3.6).)
*Needs:* Mathlib `Convex.add_smul_sub_mem`, 1.5 `finite_translate_section`.
**Checks.**

- [2,3]⊆[4,6]−2, using a=2 and r=2.
- [2,3] is not a subset of its dilation [4,6] about zero; the translation cannot be omitted.
- There is no real t with {0,1,3}⊆{0,2,6}+t; arbitrary nonconvex sections do not satisfy the containment.

Prove `section_union_volume_mono` (1.5.4): for convex K⊆E×F, r≥1 and every y∈F, μ{x:(x,y)∈U_v(K)}≤μ{x:(x,y)∈U_v(f₁,r(K))}.

(Source: Henk2002, p.6, the inequality between section-volume integrals.)
*Needs:* Mathlib `MeasureTheory.measure_preimage_mul_right`, 1.5 `convex_section_enlargement`.
**Checks.**

- At r=1, f₁,r(K)=K for every subset of ℝ×ℝ, so every section inequality is equality.

Prove `partial_dilation_union_volume` (1.5.5): for compact convex K⊆E×F, finite v:I→E and r≥1, (μ×ν)(U_v(K))≤(μ×ν)(U_v(f₁,r(K))).

(Source: Henk2002, p.6 (3.6) and the three-line successive-integration argument ending on p.7.)
*Needs:* Mathlib `IsCompact.image`, `isCompact_iUnion`, `IsCompact.isClosed`, `IsClosed.measurableSet`, `measurable_measure_prodMk_right`, `MeasureTheory.Measure.prod_apply_symm`, `MeasureTheory.lintegral_mono`, 1.5 `section_union_volume_mono`.
**Checks.**

- At r=1 both measurable unions are the same, so the product-volume comparison is equality.
- For an empty index type both sides are zero, including when either factor has dimension zero.
- The integration uses only the two measurable section-volume functions; no measurable choice of the pointwise center is permitted as an unstated premise.

Prove `complementary_dilation_union` (1.5.6): for any real r, any K⊆E×F and finite v:I→E, U_v(rK)=f₂,r(U_v(f₁,r(K))).

(Source: Henk2002, p.6, identity M_q^i+K_{i+1}=f₂(M_q^i+f₁(K_i)).)
**Checks.**

- On ℝ×ℝ, f₁,2(3,5)=(6,5).
- On ℝ×ℝ, f₂,2(3,5)=(3,10); it must leave the translation coordinate unchanged.

Prove `transverse_union_volume` (1.5.7): for compact convex K⊆E×F, finite v:I→E and r≥1, r^(dim F)·(μ×ν)(U_v(K))≤(μ×ν)(U_v(rK)), interpreting the scalar factor by the nonnegative extended-real inclusion.

(Source: Henk2002, p.6 (3.5), using the partial maps and (3.6).)
*Needs:* Mathlib `MeasureTheory.Measure.addHaar_image_linearMap`, `LinearMap.det_prodMap`, `LinearMap.det_smul`, `MeasureTheory.Measure.prod.instIsHaarMeasure`, 1.5 `partial_dilation_union_volume`, 1.5 `complementary_dilation_union`.
**Checks.**

- For F=EuclideanSpace ℝ (Fin 0), the factor 2^(dim F) is 1, not 2 or zero.

Prove `gauge_linearEquiv` (1.5.8): for real modules E,F, a linear equivalence e:E≃_R F, K⊆E and x∈E, gauge_{e(K)}(e(x))=gauge_K(x). No convexity, boundedness, symmetry or nonempty-interior hypothesis is needed.
E,F are real modules with additive commutative group structure. Both the set and the evaluation point are transformed; this is a comparison for the gauge, not another gauge definition.
(Source: direct deduction from Mathlib `gauge_def'`; Henk p.5, §3, uses the accompanying reduction to a standard lattice.)
*Needs:* Mathlib `gauge_def'`.
**Checks.**

- For K=[−1,1], transforming K and x=1 by multiplication by 2 gives gauge_[−2,2](2)=1.
- Keeping K=[−1,1] while replacing x=1 by x=2 gives gauge 2, not 1.

Prove `convex_cluster_intersection_null` (1.5.9): for finite families A:I→Set(E), B:J→Set(E) of convex sets, if int(A_i) and int(B_j) are disjoint for every i,j, then μ((⋃_i A_i)∩(⋃_j B_j))=0.
E is finite-dimensional real normed, with Borel structure and an additive Haar measure μ. The families may be empty; the individual convex sets need not be closed or bounded. The unions need not be convex.
(Source: Henk2002, p.6, the volume factorizations immediately after (3.4).)
*Needs:* Mathlib `mem_frontier_iff_notMem_interior`, `Convex.addHaar_frontier`, `MeasureTheory.measure_iUnion_null_iff`, `MeasureTheory.measure_union_null`, `MeasureTheory.measure_mono_null`.
**Checks.**

- ([0,2]∪[1,3])∩([3,5]∪[4,6]) has real volume zero.
- [0,2]∩[1,3] has volume one: dropping cross-interior disjointness is false.

Prove `clustered_translate_volume` (1.5.10): for compact convex K⊆E, finite u:I→E and v:J→E, suppose int(u_i+v_j+K) and int(u_i′+v_j′+K) are disjoint whenever j≠j′, for all i,i′. Then μ(⋃_j⋃_i(u_i+v_j+K))=|J|·μ(⋃_i(u_i+K)).
E is finite-dimensional real normed and Borel; μ is additive Haar measure. Both index types may be empty. Within each row j, the sets may overlap and the labels i may repeat.
(Source: Henk2002, p.6, the two factorizations following (3.4).)
*Needs:* Mathlib `Convex.translate`, `Homeomorph.image_interior`, `IsCompact.image`, `isCompact_iUnion`, `IsCompact.isClosed`, `IsClosed.measurableSet`, `MeasureTheory.measure_iUnion₀`, `MeasureTheory.measure_preimage_mul_right`, 1.5 `convex_cluster_intersection_null`.
**Checks.**

- The union of [0,2],[1,3],[3,5],[4,6] has volume 6=2·3, not 4·2=8.
- Repeating [0,1] within a row does not double that row's volume; two touching translated rows still have total volume 2.

Prove `strict_flag_translate_separation` (1.5.11): let K⊆R^d be a symmetric convex body with 0 in its interior, t>0 and 0≤k≤d. Suppose every z∈Z^d with gauge_K(c(z))<t has z_j=0 for j≥k. If x,y∈Z^d differ in some coordinate j≥k, then c(x)+int((t/2)K) and c(y)+int((t/2)K) are disjoint.
The flag condition is strict. No assertion about gauge=t points is made. A minimum vector need not be a basis vector, and no equality between a real and integral basis is assumed.
(Source: Henk2002, pp.5–6, (3.2) and (3.4), using the strict flag from (2.3).)
*Needs:* Mathlib `interior_subset_gauge_lt_one`, `gauge_smul_left_of_nonneg`, `gauge_add_le`, `gauge_neg`, `absorbent_nhds_zero`.
**Checks.**

- The open intervals (−1/2,1/2) and (1/2,3/2) are disjoint, even though the corresponding closed intervals touch.
- Replacing the half-body by the whole unit interval makes translates centered at 0 and 1 overlap on (0,1).

Prove `lattice_box_row_volume` (1.5.12): for compact convex S⊆R^d, q∈N and k≤d, assume c(x)+int(S) and c(y)+int(S) are disjoint for all x,y∈M_q whose tails (coordinates j≥k) differ. Then volume(U_q(S))=(2q+1)^(d−k)·volume(U_q^k(S)).
Lebesgue volume is the product volume on R^d. The statement is in the nonnegative extended reals, with the natural cardinal factor cast into that space.
(Source: Henk2002, p.6, the two displayed volume factorizations after (3.4).)
*Needs:* Mathlib `Equiv.piEquivPiSubtypeProd`, `Pi.card_Icc`, `Int.card_Icc`, 1.5 `clustered_translate_volume`.
**Checks.**

- For q=1,k=1,d=2 and S=[−1,1]×[−1/2,1/2], the prefix union has area 4 and the full union area 12=3·4; summing nine individual areas would incorrectly give 18.
- M_0 consists only of zero in every dimension, so every row-volume factor at q=0 is one.

Prove `coordinate_transverse_union_volume` (1.5.13): for k≤d, compact convex S⊆R^d, a finite family v:I→R^d with (v_i)_j=0 whenever j≥k, and r≥1, r^(d−k)·volume(⋃_i(v_i+S))≤volume(⋃_i(v_i+rS)).
No symmetry or origin condition is required for S. The family may be empty or have repeated labels. This is the product-space inequality expressed in coordinate space, not a new geometric carrier.
(Source: Henk2002, p.6, (3.5) and the coordinate maps f₁,f₂.)
*Needs:* Mathlib `Equiv.piEquivPiSubtypeProd`, `Homeomorph.piEquivPiSubtypeProd`, `MeasureTheory.volume_preserving_piEquivPiSubtypeProd`, `Module.finrank_fintype_fun_eq_card`, 1.5 `transverse_union_volume`.
**Checks.**

- For d=3,k=1,r=2 the multiplier is 4, not the ambient factor 8.
- For k=d the multiplier is r^0=1; for k=0 it is r^d.

Prove `flag_box_volume_ratio` (1.5.14): for K⊆R^d a symmetric convex body with 0 in its interior, 0<s≤t, q∈N and k≤d, assume gauge_K(c(z))<t implies z_j=0 for all j≥k. Then (t/s)^(d−k)·volume.real(U_q((s/2)K))≤volume.real(U_q((t/2)K)).
K is the compact nonempty ConvexBody; compactness is used to convert finite union measures to real volume.
(Source: Henk2002, pp.5–6, (3.3)–(3.5).)
*Needs:* Mathlib `IsCompact.measure_lt_top`, `isCompact_iUnion`, `IsCompact.image`, 1.5 `strict_flag_translate_separation`, 1.5 `lattice_box_row_volume`, 1.5 `coordinate_transverse_union_volume`.
**Checks.**

- If s=t>0, the ratio inequality is equality, including every q and cutoff.
- For q=1, K=[−1,1]×[−1/3,1/3], s=1,t=3,k=1, the smaller and larger union areas are 3 and 15. The required factor gives 9≤15; the incorrect ambient exponent gives 27≤15, which is false.

Prove `first_box_volume` (1.5.15): for K⊆R^d a symmetric convex body with 0 in its interior and s>0, suppose gauge_K(c(z))<s for an integer vector z implies z=0. Then for every q∈N, volume.real(U_q((s/2)K))=(2q+1)^d·(s/2)^d·volume.real(K).
K is the compact nonempty ConvexBody; compactness is used to convert finite union measures to real volume.
(Source: Henk2002, p.5, (3.2).)
*Needs:* Mathlib `Pi.card_Icc`, `Int.card_Icc`, `MeasureTheory.Measure.addHaar_smul_of_nonneg`, `IsCompact.measure_lt_top`, 1.5 `strict_flag_translate_separation`, 1.5 `finite_interior_disjoint_translate_volume`.
**Checks.**

- For q=1 and K=[−1,1]^2 with s=1, the union area is 9=3²·(1/2)²·4.
- For q=1, K=[−2,2]×[−1,1] and s=1/2, the union area is 9/2=3²·(1/4)²·8.

Prove `outer_lattice_box_volume` (1.5.16): for any compact S⊆R^d there is R≥0 such that, for every q∈N, volume.real(U_q(S))≤(2q+2R)^d.
S need not be convex, symmetric or nonempty. R depends on S and d but is chosen once, independently of q.
(Source: Henk2002, p.5, (3.1).)
*Needs:* Mathlib `IsCompact.isBounded`, `isBounded_iff_forall_norm_le'`, `MeasureTheory.measureReal_mono`, `Real.volume_Icc_pi`.
**Checks.**

- For q=1 and R=3/2 in dimension two, the enclosing area is (2+3)²=25, bounding the anisotropic row example of area 15.
- In dimension zero the right side is one, including q=R=0; the empty union's volume is zero.

Prove `weighted_ratio_product` (1.5.17): for n∈N and positive a:Fin(n+1)→R, a_0^(n+1)·∏_{i:Fin n}(a_{i+1}/a_i)^(n−i)=∏_{j:Fin(n+1)}a_j.
All a_j are strictly positive, so every denominator is nonzero. No monotonicity is needed for this algebraic identity. With n=0 the ratio product is empty and both sides are a_0.
(Source: Henk2002, p.7, the final product expansion.)
*Needs:* Mathlib `Fin.prod_univ_succ`.
**Checks.**

- For a=(2,3,5), 2³·(3/2)²·(5/3)=30=2·3·5.
- For a=(2,2,5), the repeated ratio is one and the identity gives 20.
- For n=0, the empty ratio product gives a_0^1=a_0.

Prove `weighted_volume_chain` (1.5.18): for positive a:Fin(n+1)→R, nonnegative V:Fin(n+1)→R and B≥0, assume a_0^(n+1)B≤V_0 and (a_{i+1}/a_i)^(n−i)V_i≤V_{i+1} for every i:Fin n. Then (∏_j a_j)B≤V_n.
All sequence entries and endpoints use Fin(n+1). The recurrence has exactly n inequalities, so for n=0 the conclusion is the initial inequality.
(Source: Henk2002, p.7, the chain of inequalities after (3.6).)
*Needs:* 1.5 `weighted_ratio_product`.
**Checks.**

- For a=(2,3,5), B=1 and V=(8,18,30), the two recurrence steps are equalities and the endpoint is 30.
- With B=0 and V identically zero the conclusion holds; a proof that divides by a volume would be invalid.

Prove `large_box_comparison_limit` (1.5.19): for d∈N and real R,B, if (2q+1)^d B≤(2q+2R)^d for every q∈N, then B≤1.
The scalar statement does not require R≥0 or B≥0; the geometric application supplies both. The denominator 2q+1 is always strictly positive. Dimension zero is allowed.
(Source: Henk2002, p.7, the last display and its conclusion for all q.)
*Needs:* Mathlib `tendsto_add_mul_div_add_mul_atTop_nhds`, `le_of_tendsto'`.
**Checks.**

- For R=1/2 the ratio (2q+2R)/(2q+1) is identically one.
- For d=0 both powers are one even when the numerator vanishes.

Prove `coordinate_flag_upper` (1.5.20): let K be a symmetric convex body in R^d with 0 in its interior, and let a:Fin d→R be positive and nondecreasing. Suppose for every i and z∈Z^d, gauge_K(c(z))<a_i implies z_j=0 for all j≥i. Then (∏_i a_i)·volume.real(K)≤2^d.
The a_i are threshold data satisfying the explicit flag condition; the statement does not define a new successive-minimum invariant. The conclusion includes d=0.
(Source: Henk2002, §3, pp.5–7, (3.1)–(3.6) and final display.)
*Needs:* Mathlib `MeasureTheory.Measure.volume_pi_eq_dirac`, `ConvexBody.isCompact`, 1.5 `flag_box_volume_ratio`, 1.5 `first_box_volume`, 1.5 `weighted_volume_chain`, 1.5 `outer_lattice_box_volume`, 1.5 `large_box_comparison_limit`.
**Checks.**

- For Z² and K=[−3,3]×[−1,1], thresholds (1/3,1) give product-volume 4, exactly 2².
- For the unit diamond and thresholds (1,1), product-volume is 2<4.
- For d=0 the product-volume and the bound are both one.

Prove `minkowski_second_upper` (1.5.21): for a discrete full Z-lattice L in a finite-dimensional real inner-product space E and a centrally symmetric convex body K with 0 in its interior, (∏_{i:Fin d}λ_i(L,K))·volume.real(K)≤2^d·covolume(L), where d=dim_R E and λ_i is the inherited zero-based successive minimum. The formula includes d=0.
E carries its Borel structure and canonical intrinsic Euclidean volume. L uses Submodule Z E, DiscreteTopology and IsZLattice. K uses ConvexBody. Lower-rank lattices are first regarded as full lattices in their real spans, with intrinsic measure. No ambient-volume conclusion for a lower-dimensional body is substituted.
(Source: Henk2002, p.2 Theorem 1.3 and complete §3 proof, pp.5–7.)
*Needs:* Mathlib `Module.Basis.ofZLatticeBasis_repr_apply`, `Module.Basis.mem_flag_iff_repr_eq_zero`, `Module.Basis.equivFun`, `Convex.linear_image`, `Homeomorph.image_interior`, `IsCompact.image`, `IsCompact.isClosed`, `IsClosed.measurableSet`, `ZLattice.volume_image_eq_volume_div_covolume'`, `ZLattice.covolume_pos`, `IsCompact.measure_lt_top`, 1.2 `exists_integral_minimum_flag`, 1.5 `gauge_linearEquiv`, 1.2 `successiveMin_pos`, 1.2 `successiveMin_monotone`, 1.5 `coordinate_flag_upper`.
**Checks.**

- For L=2Z and K=[−3,3], minimum 2/3 times length 6 is 4=2·covolume(L); omitting covolume would assert 4≤2.
- For L=2Z×3Z and K=[−2,2]×[−1,1], minima (1,3) and area 8 give 24=4·6.
- In the zero-dimensional canonical space the empty product, volume, covolume and 2^0 are all one.

### Examples

For `L = ℤ^d` and the cube `K = [−1,1]^d` every minimum is `1` and the product `λ_1⋯λ_d · vol K = 2^d` attains the upper bound. For positive half-widths `a_i`, both the weighted cross-polytope `{Σ|x_i|/a_i ≤ 1}` and the box `∏[−a_i,a_i]` have the reciprocals `1/a_i` as their successive minima, sorted in increasing order of the reciprocals. With half-widths `(2,1)` the minima are `(1/2,1)`, not `(1,2)`. The cross-polytope attains the lower bound `2^d/d!`. For Dirichlet approximation apply the linear forms theorem to `x−αy` and `y` with bounds `(1/T,T)`, `T>1`: the determinant is `1`, so there is a nonzero integer pair with `|x−αy|≤1/T` and `|y|≤T`. Since `1/T<1`, `y=0` would also force `x=0`, so the denominator is nonzero.

### Dependencies

Layer 0 (Gram determinants and covolumes); Mathlib `ConvexBody`, `gauge` and its calculus, `MeasureTheory.exists_pair_mem_lattice_not_disjoint_vadd`, `ZSpan.isAddFundamentalDomain`, `ZLattice.volume_image_eq_volume_div_covolume`, `Module.Basis.flag`, the Haar-measure image lemmas.

## Layer 2: Integral quadratic and hermitian lattices

This layer builds the arithmetic of integral quadratic and hermitian lattices over a Dedekind domain `R` with fraction field `K`, not only over `ℤ`: the carrier is a full `R`-submodule of a `K`-quadratic space on which the quadratic map takes values in `R`, with no basis stored. Localisation at a prime and descent from a completion (2.2) let every local question be asked of a lattice over a discrete valuation ring. The genus and the proper spinor genus (2.4) are defined over a number field with the spin image taken place by place. The local theory has three branches: invariant factors over a DVR (2.5), Voight’s atomic normal forms over a characteristic-zero DVR, dyadic case included (2.6), and the hermitian, quaternionic and signed hermitian variants (2.7–2.9). The field-level comparisons of 2.1 and the ℤ-lattice comparisons of 2.3 are the exact bridges to QuadraticFormInvariants, GlobalQuadraticForms and the two IntegralLattices roadmaps, with the convention `q(x) = B(x,x)/2` made explicit at every crossing.

### 2.1 Comparisons with the field theory

2.1.1. Prove that for a finite-dimensional field space with 2 invertible, passage from a nondegenerate symmetric pairing B to q(x)=B(x,x)/2 identifies its categorical hyperbolic plane with the hyperbolic plane `xy` of QuadraticFormInvariants Layer 1. The integral hyperbolic plane over Z needs no division by 2.
(Source: QuadraticFormInvariants, Layer 1, hyperbolic decomposition and Witt cancellation, in its supplier README.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, QuadraticFormInvariants Layer 1.

2.1.2. Prove that in a basis of the generic space, the plain quadratic discriminant of QuadraticFormInvariants Layer 3 of q=B(x,x)/2 is the square class of 2^(−n) det Gram(B), and signed discriminant multiplies by (−1)^(n(n−1)/2). Basis changes multiply by a square.
(Source: QuadraticFormInvariants, Conventions and Layer 3, plain and signed discriminants, in its supplier README.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, QuadraticFormInvariants Layer 3.

2.1.3. Prove Over a field with 2 invertible, the exact-category symmetric W0 of finite-dimensional vector spaces is additively isomorphic to the Witt ring of QuadraticFormInvariants Layer 4 via B↦B(x,x)/2; orthogonal sums and hyperbolic relations agree. This supplies no integral Witt ring or dyadic quadratic-refinement identification.
(Source: QuadraticFormInvariants, Layer 4, Witt and Witt–Grothendieck rings; the B/2 comparison is an additive transport, in its supplier README.)
The field Witt ring is Tau Ceti `WittRing K` with `WittGrothendieckRing K`; the exact-category group `W₀` is constructed in 6.4, so this comparison is stated here and proved there.
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, QuadraticFormInvariants Layer 4.

2.1.4. Prove that the generic quadratic form of an integral lattice uses the Brauer-valued Hasse and Clifford invariants of QuadraticFormInvariants Layer 5, with its signed/plain discriminant conventions; integral basis change preserves these through the generic isometry. No complete invariant claim over a general field is made.
(Source: QuadraticFormInvariants, Layer 5, Hasse and Clifford invariants, in its supplier README.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, QuadraticFormInvariants Layer 5.

2.1.5. Prove that for a characteristic-zero nonarchimedean local field, generic nondegenerate quadratic spaces are isometric exactly when dimension, plain discriminant and local Hasse sign agree. Completed integral lattices with those generic invariants can still be inequivalent.
(Source: QuadraticFormInvariants, Layer 6, local Hasse invariant and local classification, in its supplier README.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, QuadraticFormInvariants Layer 6.

2.1.6. Prove that for the generic nondegenerate quadratic form over a number field, a nonzero isotropic vector exists exactly when one exists at all finite and real completions. Integral representation of a prescribed value requires additional lattice conditions.
(Source: GlobalQuadraticForms, Layer 5, Hasse–Minkowski isotropy, in its supplier README.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, GlobalQuadraticForms Layer 5.

2.1.7. Prove Local generic isometry at every finite and real place gives a single generic K-isometry. It does not identify the embedded lattices; the integral-genus relation and its class set retain precisely that extra problem.
(Source: GlobalQuadraticForms, Layer 6, local-to-global isometry, in its supplier README.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, GlobalQuadraticForms Layer 6.

### 2.2 Integral quadratic lattices over a Dedekind domain, localisation and descent

For 2.2.3, 2.2.4: R is a Dedekind domain; intersections are in the fixed K-space. This detects embedded submodule equality, not the existence of a compatible family of integral isometries.

Define `IntegralQuadraticLattice.ofCarrier` (2.2.1): for a Dedekind domain R with fraction field K, a finite-dimensional K-space V and q:V→K quadratic, an integral quadratic lattice is L:Submodule R V with Submodule.IsLattice K L and q(L)⊆R. Nondegeneracy of q and unimodularity of its integral polar pairing are separate predicates. There is no global free-basis field.
K has characteristic different from 2 for the field-classification interface; the integral quadratic-map definition itself does not require 2 to be a unit in R. The embedding R→K and scalar tower are fixed. Invariant-factor and genus work uses a nondegenerate generic fibre.
Its API is `IntegralQuadraticLattice.ofCarrier` (Bundle a full finite submodule and q with q(L)⊆R.); `IntegralQuadraticLattice.carrier` (Return the original R-submodule, preserving its IsLattice instance.); `IntegralQuadraticLattice.quadraticMap` (The restricted R-quadratic map extends back to q on the K-span.); `IntegralQuadraticLattice.ext` (For fixed q, equal carriers yield equal bundled integral-lattice data.).
(Source: Voight2026, §9.3 Definition 9.3.1 and §9.7 Definitions 9.7.1–9.7.8, printed pp.137,144–145.)
The carrier in `Suggested.lean` is stated for any commutative ring `R` with an `R`-algebra field `K`; the Dedekind hypothesis is carried by the theorems of 2.2.2–2.2.5, not by the structure.
*Needs:* Mathlib `Submodule.IsLattice`, `QuadraticMap`, `QuadraticForm`.
**Checks.**

- R=Z, K=Q, L=Z and q(x)=x² give an integral lattice whose polar pairing is 2xy and is not unimodular.
- Over a non-Dedekind base such as `R = ℤ[√−3]` the structure still makes sense, but 2.2.3 (recovery from localisations) is a Dedekind statement and is not claimed there.
- The integral symmetric pairing B(x,y)=xy on Z does not make q(x)=B(x,x)/2 integral.
- A nonprincipal fractional ideal is allowed as an R-lattice; no constructor asks for an R-basis.

Construct `IntegralQuadraticLattice.localize` (2.2.2): for a nonzero prime p of R, extend L to L_(p)=L⊗R R_(p), viewed as the span of L in the same K-space; extend its quadratic map and coefficient line by scalar change. Integral values and full finite generation are preserved.
Use localization R_(p), not completion R_p; the latter changes the ambient field. No global freeness is assumed.
Its API is `IntegralQuadraticLattice.localize` (Return the R_(p)-lattice and restricted quadratic form.); `IntegralQuadraticLattice.localize_mem_iff` (x lies in L_(p) iff s x lies in L for some s∈R\p.); `IntegralQuadraticLattice.localize_map` (functoriality: An integral isometry localizes, preserving identity and composition.).
(Source: Voight2026, §9.4, (9.4.1)–(9.4.5), printed pp.139–140.)
This variant localises at a prime of a Dedekind domain inside the fixed fraction-field space; it keeps completion, which changes the ambient field, for 2.2.5.
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`.
**Checks.**

- Z_(2) contains 1/3 and excludes 1/2; this is not Z₂.
- Localizing a nonprincipal coefficient ideal makes it principal at a nonzero prime of a Dedekind domain.
- Localizing the zero-dimensional lattice still gives the zero-dimensional lattice.

2.2.3. Prove that for full R-lattices L,M in a fixed fraction-field K-space over a Dedekind domain, L is contained in M iff L_(p) is contained in M_(p) for every maximal ideal p.

(Source: Voight2026, Lemma 9.4.6 and Corollary 9.4.7, printed p.140.)
*Needs:* 2.2.4, 2.2 `IntegralQuadraticLattice.localize`.
**Checks.**

- 2Z is contained in Z at every prime, and the reverse inclusion fails at prime 2.

2.2.4. Prove that for a full R-lattice L in a fixed fraction-field K-space over a Dedekind domain, L equals the intersection of its localizations L_(p) over maximal ideals p, as embedded submodules.

(Source: Voight2026, Lemma 9.4.6 and Corollary 9.4.7, printed p.140.)
*Needs:* 2.2 `IntegralQuadraticLattice.localize`.
**Checks.**

- 2Z and Z differ at the prime 2, though their Q-spans coincide.
- For equal embedded localizations the conclusion is L=M; independent local isometries do not supply a single global integral isometry.

2.2.5. Prove that if R is a DVR with fraction field K and completion R̂ with fraction field K̂, extension L↦L⊗R R̂ and intersection N↦N∩V are inverse bijections between full R-lattices in finite-dimensional V and full R̂-lattices in V⊗K K̂.
Intersection uses the canonical injection V→V⊗K K̂. Finite-generation and torsion-free hypotheses are retained; a torsion R-module is not declared free.
(Source: Voight2026, §9.5 (9.5.1)–(9.5.4), Lemma 9.5.3 and full proof, printed pp.142–143.)
*Needs:* 2.2 `IntegralQuadraticLattice.localize`.
**Checks.**

- The descent of 2Z₂⊂Q₂ is 2Z_(2)⊂Q, not 2Z as a global lattice.
- The finite quotient comparison R/p^e≅R̂/p^e for e≥1 is essential to lifting completed generators.

### 2.3 Comparisons with symmetric ℤ-lattices

2.3.1. Prove that for R=Z,K=Q and a symmetric integral pairing B, the GN integral hermitian carrier with trivial involution recovers the completed IntegralLattices carrier. For an integral quadratic q use B=polar(q), not q(x)=B(x,x)/2 without the evenness condition.
(Source: Completed/IntegralLattices, Layer 1, embedded rational carrier and restricted integer pairing, in its supplier README.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, Completed IntegralLattices Layer 1.

2.3.2. Prove Under the same symmetric Q-space specialization, GN hermitian dual equals B.dualSubmodule L as embedded Z-submodules. The quotient L∨/L and its determinant cardinality are the discriminant group of Completed IntegralLattices Layer 2, for nondegenerate integral L.
(Source: Completed/IntegralLattices, Layer 2, duality and discriminant group, in its supplier README.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, Completed IntegralLattices Layer 2.

2.3.3. Prove that for the specialization, intermediate L⊂M⊂L∨ correspond through Completed IntegralLattices Layer 4 to subgroups of A_L. Integral M requires vanishing of the bilinear form; even M requires the quadratic refinement. A subgroup isotropic only for a quadratic form is used only when L is even.
(Source: Completed/IntegralLattices, Layer 4, integral and even overlattice correspondences, in its supplier README.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, Completed IntegralLattices Layer 4.

### 2.4 Genus and proper spinor genus

Define `IntegralGenus.localIsometry` (2.4.1): within a fixed nondegenerate quadratic K-space (V,q), two integral R-lattices belong to the same genus when their completed lattices are isometric under O(q_v)(K_v) at every nonzero prime v. If quadratic spaces themselves vary, also require the archimedean signature data and the rational-space identification from GlobalQuadraticForms. Genus classes are integral isometry classes inside this equivalence class.
R is the ring of integers of a number field, or a specified localization with exactly its retained places. Genus, rational isometry and global integral isometry have separate types and separate quotient relations.
Its API is `IntegralGenus.localIsometry` (data: A local isometry at each retained finite place, with archimedean data when spaces vary.); `IntegralGenus.equivalence` (structure: The genus relation is an equivalence relation.); `IntegralGenus.ofIntegralIsometry` (A global integral isometry determines a genus relation.); `IntegralGenus.classSet` (Integral-isometry classes of lattices in the fixed genus.).
(Source: Voight2026, Definition 9.7.13, printed p.146; completion comparison §9.5.)
This variant is over a number ring or its localisation, with archimedean data as part of the definition.
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, 2.2.5, QuadraticFormInvariants Layer 6, GlobalQuadraticForms Layer 6.
**Checks.**

- In fixed (Q,x²), Z and 2Z are rationally in the same ambient space but not in one integral genus.
- A global integral isometry yields local isometries at every place.
- Opposite real signatures cannot be identified when ambient spaces vary.

2.4.2. Prove that for a nondyadic nonarchimedean local field and nondegenerate unimodular lattice of rank at least two, the proper stabilizer spinor norm image is R×K×².
(Source: Schulze-Pillot2021v2, §9.2, Lemma 9.19, printed pp.126–127.)
OrthogonalSpinGroups milestone 2F tabulates `θ(SO(V_v))` over `ℚ_p` and `ℝ`; this is the image on the integral stabilizer of a unimodular lattice over any nondyadic local field.
*Needs:* 2.4 `ProperSpinorGenus.orbit`, QuadraticFormInvariants Layer 6.

2.4.3. Prove Local spinor norms of an adelic proper isometry assemble to an idele square class: almost all coordinates are units since its components stabilize unimodular local lattices.
(Source: Schulze-Pillot2021v2, §9.2, Definition/Lemma 9.20, printed p.127.)
OrthogonalSpinGroups milestone 3F and Tau Ceti `OrthogonalCompactOpens.adelicSpinorNorm` are the adelic spinor norm for `K = ℚ`; this target is its number-field form, with the reference subgroups given by the unimodular stabilizers of 2.4.2.
*Needs:* 2.4.2, AdelicAlgebraicGroups AA.1.

2.4.4. Prove that in the proper genus, φL belongs to the proper spinor genus of L exactly when θ(φ) lies in θ(SO(K))θ(SO(A;L)); proper spinor genera correspond to the quotient of the actual adelic spinor-norm image by this product.
(Source: Schulze-Pillot2021v2, §9.2, Theorem 9.21 and full proof, printed p.127.)
*Needs:* 2.4.3, 2.4 `ProperSpinorGenus.orbit`.

Define `ProperSpinorGenus.orbit` (2.4.5): for nondegenerate q in characteristic different from 2, proper spinor genus is the orbit of an integral lattice under SO(q)(K) times the image of Spin(q)(A_f)→SO(q)(A_f), acting on its finite adelic completion. Proper genus uses SO instead of O. Their forgetful maps to ordinary genus are separate.
Use the actual local-field image of the spin covering; no blanket surjectivity on local rational points. Dyadic spinor-norm images and signatures are supplied by their owners or left as precise gaps.
Its API is `ProperSpinorGenus.orbit` (Use global SO and the finite adelic spin image.); `ProperSpinorGenus.equivalence` (structure: Orbit relation is reflexive, symmetric and transitive.); `ProperSpinorGenus.toGenus` (Forget orientation and the spin-image restriction.).
(Source: Schulze-Pillot2021v2, §9.2, Definitions 9.9,9.13 and Remark 9.14, printed pp.124–126.)
This variant takes the spin image at each finite place of a number field, rather than only over `ℚ`; no surjectivity of `Spin → SO` on local points is assumed.
*Needs:* 2.4 `IntegralGenus.localIsometry`, RepresentationTheory/SpinRepresentations Layer 2, AdelicAlgebraicGroups AA.1.
**Checks.**

- For q=xy, τ_(1,1)τ_(1,2)=diag(2,1/2) has spinor norm [2]; over Q₂ this is not in the spin image.
- Over Q₃ the same diag(2,1/2) stabilizes Z₃² and has nonsquare unit norm [2], so the integral stabilizer image is nontrivial.
- In rank one SO is trivial and its spinor orbit fixes the lattice.

### 2.5 Invariant factors over a discrete valuation ring

2.5.1. Prove that for an integral nondegenerate rank-n lattice over a DVR, L∨/L is a finitely generated torsion module of finite length, killed by some π^a, and generated by at most n elements. It is finite as a set only when the residue field is finite; this includes the local-number-field setting of Li–Zhang. The algebraic statement also applies to infinite residue fields.
(Source: Li–Zhang2019v3, §1.7, printed p.8.)
*Needs:* 2.7 `IntegralHermitianLattice.dual`.

2.5.2. Prove that the primary torsion cited decomposes L∨/L into O_F/(π^a_i); remove zero summands, order the exponents and pad with zeros to exactly n entries.
(Source: Li–Zhang2019v3, §1.7, printed p.8.)
*Needs:* Mathlib `Module.torsion_by_prime_power_decomposition`, 2.5.1.

2.5.3. Prove that for exponents a_i and m≥1, dimension over the residue field of π^(m−1)M/π^m M is #{i:a_i≥m}.
(Source: Li–Zhang2019v3, §1.7, printed p.8.)
*Needs:* 2.5.2.

2.5.4. Prove Two ordered length-n exponent tuples defining the same finite-length DVR module coincide, including padded zeros.
(Source: Li–Zhang2019v3, §1.7, printed p.8.)
*Needs:* 2.5.3.

2.5.5. Prove Replacing π by uπ, u a unit, preserves the ordered exponent tuple and every type/length invariant.
(Source: Li–Zhang2019v3, §1.7, printed p.8.)
*Needs:* 2.5.4.

2.5.6. Prove that for finite residue field of size Q, length(M)=Σa_i and #M=Q^(Σa_i). For an unramified quadratic O_F/O_F0 extension Q=q², giving q^(2Σa_i).
(Source: Li–Zhang2019v3, §1.7, printed p.8.)
*Needs:* 2.5.3.

### 2.6 Atomic forms over a local principal ideal domain

Define `IsAtomicIntegralQuadraticForm` (2.6.1): Over a DVR R with valuation v and uniformizer π, an atomic quadratic form is either ⟨a⟩ with a a unit, or, when 2 is not a unit, a binary [a,b,c] satisfying v(b)<v(2a)≤v(2c) and at least one of a,b a unit. These are integral quadratic maps; the polar pairing is not divided by two.
Valuation may take infinity for zero; the stated strict inequality excludes the unwanted zero terms. The field case of the source’s trivial-valuation convention is outside this DVR predicate; the normalization theorem below additionally assumes characteristic zero.
Its API is `IsAtomicIntegralQuadraticForm` (The exact unary or dyadic binary valuation predicate.); `IsAtomicIntegralQuadraticForm.unary` (Unary atomic forms have unit coefficient.); `IsAtomicIntegralQuadraticForm.binary` (The binary case includes 2 nonunit and all valuation inequalities.).
(Source: Voight2026, Definition 9.8.1 and Example 9.8.2, printed p.147.)
*Needs:* Mathlib `QuadraticMap`, `IsDiscreteValuationRing.addVal`.
**Checks.**

- Over Z₂ the hyperbolic quadratic form xy is an atomic binary form.
- Over a ring with 2 invertible only the rank-one unit case occurs.
- The zero-dimensional quadratic form is not an atomic unary or binary block; zero blocks in a normalization require the separate infinity-exponent convention.

2.6.2. Prove that for nonzero polar matrix choose an entry of minimal valuation, preferring a diagonal entry in a tie. The chosen pivot divides every entry over the DVR.
(Source: Voight2012v2, §3, Algorithm 3.12, correctness proof, printed pp.12–14.)
*Needs:* 2.6 `IsAtomicIntegralQuadraticForm`.

2.6.3. Prove that if 2 is a unit and the strictly minimal entry is off diagonal T_ij, the vector e_i+e_j has T(v,v) of the same minimal valuation.
(Source: Voight2012v2, §3, Algorithm 3.12, correctness proof, printed pp.12–14.)
*Needs:* 2.6.2.

2.6.4. Prove that a minimal diagonal pivot v admits integral ratios T(v,e_k)/T(v,v); subtracting these multiples of v produces an orthogonal complementary basis.
(Source: Voight2012v2, §3, Algorithm 3.12, correctness proof, printed pp.12–14.)
*Needs:* 2.6.2, 2.6.3.

2.6.5. Prove that for a strict off-diagonal minimum at a dyadic DVR, scale e_i by the unit π^v(T_ij)/T_ij and take e_j as the second vector. Their off-diagonal entry is π^v(T_ij), with both diagonal entries of strictly higher valuation.
(Source: Voight2012v2, §3, Algorithm 3.12, correctness proof, printed pp.12–14.)
*Needs:* 2.6.2.

2.6.6. Prove that for diagonal entries A,C and off-diagonal B with v(A),v(C)>v(B), d=AC−B² has valuation 2v(B).
(Source: Voight2012v2, §3, Algorithm 3.12, correctness proof, printed pp.12–14.)
*Needs:* 2.6.5.

2.6.7. Prove that for each remaining e_k put t=B T(v2,e_k)−C T(v1,e_k), u=B T(v1,e_k)−A T(v2,e_k). Both t/d,u/d are integral; e_k+(t/d)v1+(u/d)v2 is orthogonal to the binary plane.
(Source: Voight2012v2, §3, Algorithm 3.12, correctness proof, printed pp.12–14.)
*Needs:* 2.6.6.

2.6.8. Prove Remove the common valuation from the unary or binary pivot. A binary pivot has at least one unit quadratic coefficient or unit middle coefficient, and satisfies the atomic inequalities.
(Source: Voight2012v2, §3, Algorithm 3.12, correctness proof, printed pp.12–14.)
*Needs:* 2.6.4, 2.6.7.

2.6.9. Prove Each nonzero pivot removes a unary or binary rank, so recursion terminates. In a characteristic-zero DVR a zero polar matrix means q=0, recorded as zero blocks with infinite exponent.
(Source: Voight2012v2, §3, Algorithm 3.12, correctness proof, printed pp.12–14.)
*Needs:* 2.6.8.

2.6.10. When the unary pivot a is allowed, [a,b,c] becomes ⟨a,c−b²/(4a)⟩ in the basis `(e₁,e₂−(b/(2a))e₁)`. Require `a≠0`, `2≠0`, and `b/(2a)∈R`, the integral unary-pivot condition; the second diagonal entry is `c−b²/(4a)`. The printed plus signs in Example 3.14 are incorrect.
(Source: Voight2012v2, §3, Algorithm 3.12, correctness proof, printed pp.12–14.)
*Needs:* 2.6.4.

2.6.11. Prove that every finite-projective quadratic form over a characteristic-zero DVR has an integral basis giving an orthogonal sum π^{e₁}Q₁⊥…⊥π^{e_s}Q_s of atomic unary/binary forms, with ordered exponents e_i≥0, allowing the zero blocks specified by the source infinity convention. This normalized form is not asserted unique.
Over a local PID the finite-projective underlying module is free. No uniform diagonalization theorem is exported for dyadic rings. Algorithm comparison here is proved for a finite free module over a characteristic-zero DVR; a projective module is free locally. The broader source proposition remains a separate scope, not an equal-characteristic-two algorithm assertion.
(Source: Voight2026, Proposition 9.8.4 and proof reference, printed pp.147–148.)
*Needs:* 2.6 `IsAtomicIntegralQuadraticForm`, 2.6.9.
**Checks.**

- The binary hyperbolic dyadic block cannot be discarded in favour of an unsupported integral diagonalization.
- The zero quadratic map requires the specified zero-block convention.

### 2.7 Hermitian lattices

Define `IntegralHermitianLattice.ofCarrier` (2.7.1): let K be a field with involution, R⊂K a stable integral subring and V a finite K-space. A hermitian integral lattice consists of L:Submodule R V, Submodule.IsLattice K L and a sesquilinear H, conjugate-linear in its first argument and linear in its second, with H(y,x)=star H(x,y) and H(L,L)⊆R. Generic nondegeneracy is distinct from integral self-duality.
Commutative K/R in this declaration; the quaternionic right-module variant is a separate target. For Li–Zhang density the extension is unramified quadratic F/F₀ and F₀ has characteristic different from 2; dyadic residue fields are allowed in §3 except its explicitly geometric branch.
Its API is `IntegralHermitianLattice.ofCarrier` (Bundle the full finite submodule and actual integral star-sesquilinear form.); `IntegralHermitianLattice.carrier` (The R-submodule, with its IsLattice certificate.); `IntegralHermitianLattice.ext` (For fixed H, equality of carriers identifies bundled lattice data.); `IntegralHermitianLattice.map` (functoriality: Transport along a hermitian isometry; identity and composition laws.).
(Source: Li–Zhang2019v3, §1.7, physical p.8; §3 hypotheses, physical p.15.)
*Needs:* Mathlib `Submodule.IsLattice`, `LinearMap.IsSymm`, `LinearMap.Nondegenerate`.
**Checks.**

- For rank one over an unramified quadratic extension, H(x,y)=star(x)y on O_F is integral and self-dual.
- Replacing conjugate transpose by ordinary transpose on the complex vector (i) changes its Gram value from 1 to −1.
- An integral hermitian lattice with nonunit Gram determinant is nondegenerate over F but not self-dual over O_F.

Construct `IntegralHermitianLattice.dual` (2.7.2): for a nondegenerate integral hermitian lattice L in V, define L∨={x∈V : H(x,L)⊆R}; under the stable involution this equals the right-dual condition H(L,x)⊆R. This is a full finite R-lattice over a Dedekind domain; integrality is equivalent to L⊆L∨. Self-duality means equality, not just equality of generic spans.
R is Dedekind and stable under the involution; H is nondegenerate on the generic fibre. No finiteness of residue fields is needed until cardinalities are used.
Its API is `IntegralHermitianLattice.dual` (The submodule defined by integral pairings.); `IntegralHermitianLattice.mem_dual_iff` (Membership is equivalent to all pairings with L lying in R.); `IntegralHermitianLattice.dual_dual` (The double dual equals L under the stated Dedekind/nondegeneracy hypotheses.); `IntegralHermitianLattice.integral_iff_le_dual` (Integrality is exactly L⊆L∨.).
(Source: Li–Zhang2019v3, §1.7, physical pp.8–9.)
*Needs:* 2.7 `IntegralHermitianLattice.ofCarrier`, 2.2.5.
**Checks.**

- For rank-one Gram π^a over an unramified extension, the dual of O_F e is π^−a O_F e.
- The Gram-1 lattice is self-dual; Gram-π lattice is integral but not self-dual.
- The zero-dimensional lattice equals its dual and has zero discriminant length.

Construct `HermitianLatticeInvariants.ofDualQuotient` (2.7.3): for an integral nondegenerate O_F-hermitian lattice L of rank n over a DVR, attach the unique ordered a₁≤…≤a_n with a_i≥0 and L∨/L≅⊕O_F/π^{a_i}; define val(L)=Σa_i and t(L)=#{i:a_i>0}. Vertex means a_i∈{0,1}; self-dual means all a_i=0.
The `Suggested.lean` carrier is stated for any principal ideal domain `R` with an element `π` and any module `M`; the discrete-valuation-ring, uniformiser and torsion hypotheses are those of the theorems.
The quotient is measured by O_F-length; q is the size of the residue field of F₀ when F/F₀ is unramified quadratic. A_i=0 contributes the zero summand; n=0 has length/type 0.
Its API is `HermitianLatticeInvariants.ofDualQuotient` (The ordered DVR elementary-divisor exponents.); `HermitianLatticeInvariants.valuation` (data: Sum of the exponents, equal to O_F-length.); `HermitianLatticeInvariants.type` (data: Number of positive exponents.); `HermitianLatticeInvariants.selfDual_iff` (Self-duality iff valuation is zero.); `HermitianLatticeInvariants.vertex_iff` (Vertex iff every exponent is 0 or 1.).
(Source: Li–Zhang2019v3, §1.7, physical p.8.)
*Needs:* 2.7 `IntegralHermitianLattice.dual`, 2.5.2, 2.5.4, 2.5.5, 2.5.6.
**Checks.**

- Rank one with Gram π³ has val=3 and type=1; it is not a vertex lattice.
- Invariants (0,1,1) give val=2, type=2 and a vertex lattice.
- The cardinality of L∨/L is q^{2 val(L)} in an unramified quadratic extension, not q^{val(L)}.

### 2.8 Quaternionic hermitian lattices

Construct `QuaternionicIntegralHermitianLattice.ofOrderStableCarrier` (2.8.1): An embedded full central-ring lattice L in a right quaternion module is stable under the chosen star-stable quaternion order O. A nondegenerate pairing h has h(xa,yb)=star(a)h(x,y)b and h(y,x)=star(h(x,y)); integrality means h(L,L)⊂O. The right module is represented by the opposite-ring action and the quaternion algebra and standard involution by an actual algebra-isomorphism model.
Characteristic-zero central fraction field, standard-involution quaternion algebra, order full over the central ring, and a right module whose opposite-ring action is compatible with central scalar multiplication. The pairing is perfect on the generic space; integral regularity is an additional condition.
Its API is `QuaternionicIntegralHermitianLattice.ofOrderStableCarrier` (The actual O-stable R-lattice and quaternionic pairing.); `QuaternionicIntegralHermitianLattice.order` (Retain the coefficient order and its involution.); `QuaternionicIntegralHermitianLattice.localize` (functoriality: Localize order, lattice and pairing simultaneously.).
(Source: Emery–Kim 2022, §5.1, printed pp.10–11.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, QuadraticFormInvariants Layer 2.
**Checks.**

- For a star-stable quaternion order O, H(x,y)=star(x)y on O satisfies the integral pairing condition.
- Taking reduced trace of H(1,1)=1 gives 2, so reduced-trace metric normalization is a separate comparison.
- Changing the order changes the integral-isometry problem even when the ambient quaternion algebra is unchanged.

2.8.2. Prove that for a quaternion order over the number ring, standard involution preserves the order.
(Source: Emery–Kim 2022, §5.1, printed p.10.)
*Needs:* 2.8 `QuaternionicIntegralHermitianLattice.ofOrderStableCarrier`.

2.8.3. Prove that for a right order module L, its dual of right-linear maps to the order becomes a right module by (f·a)(x)=star(a)f(x). The adjoint x↦h(x,−) is right-linear for this action.
(Source: Emery–Kim 2022, §5.1, printed pp.10–11.)
*Needs:* 2.8 `QuaternionicIntegralHermitianLattice.ofOrderStableCarrier`, 2.8.2.

2.8.4. Prove On a free right order module with diagonal hermitian coefficients central units a_i, the adjoint is an isomorphism, with inverse on dual basis e_i*↦e_i a_i^−1.
(Source: Emery–Kim 2022, Lemma 5.1 and full proof, printed p.11.)
*Needs:* 2.8.3.

2.8.5. Prove that for a PID R with fraction field K, a split order O⊗R≅M2(R) and a regular free rank-r right hermitian module, its unitary stabilizer identifies with Sp_(2r)(R) inside the generic unitary group identified with Sp_(2r)(K).
(Source: Emery–Kim 2022, Lemma 5.2 and full proof, printed pp.11–12.)
*Needs:* 2.8.4.

### 2.9 Signed hermitian forms over a local field of odd residue characteristic

*Standing hypotheses.* Nonarchimedean local fields of odd residue characteristic; commutative trivial or quadratic extension with its specified involution.

The carrier `SignedHermitianSpace K V ε` and its adjoint apply to any commutative field with involution and finite-dimensional V. They store ε=±1, an ε-symmetric sesquilinear pairing and nondegeneracy; finite dimension makes the induced dual map an isomorphism. Construct `signedHermitianAdjoint`, characterized by h(av,w)=h(v,a*w), with `signedHermitianAdjoint_unique`, `signedHermitianAdjoint_id`, `signedHermitianAdjoint_comp` (composition reversal) and `signedHermitianAdjoint_involutive`. The local-field hypotheses above apply to the classification and transfer-image theorems. (Source: Kurinczuk–Skodlerack–Stevens, §3.3, pp.13–14; the adjoint construction is finite-dimensional linear duality.)
**Checks.**

- The zero-dimensional rational space admits both signs; its empty pairing is perfect.
- On the complex line, h(x,y)=conj(x)y is perfect with sign +1 and h(i,i)=1; x y would give −1 at this pair and is not sesquilinear.
- A one-dimensional rational skew-symmetric space cannot be perfect, because its pairing is zero. This negative control uses characteristic different from two.

2.9.1. Prove that for a quadratic local extension F/F0 of odd residue characteristic, norms are the base-field units/elements lying in F-squares at even base valuation, together with negatives of F-squares at odd base valuation. In the unramified case they are exactly elements of even base valuation.
(Source: Kurinczuk–Skodlerack–Stevens, Lemma 3.1 and full proof, printed pp.10–11.)
*Needs:* 2.7 `IntegralHermitianLattice.ofCarrier`.

2.9.2. Prove that the determinant of a nondegenerate ε-hermitian field space is a well-defined class modulo the norm group, and changes by N(det B) under basis change; for the trivial extension the quotient is by squares. For a hyperbolic plane the class is −ε.
(Source: Kurinczuk–Skodlerack–Stevens, §3.2, printed pp.12–13.)
*Needs:* 2.7 `IntegralHermitianLattice.ofCarrier`, 2.1.2, 2.9.1.

Construct `signedHermitianTwist` (2.9.3): for perfect ε-hermitian h and invertible endomorphism a with adjoint(a)=ηa, η=±1, put h_a(v,w)=h(v,aw). This is perfect ηε-hermitian and its adjoint is b↦a^−1 adjoint(b)a.
Its API is `signedHermitianTwist` (Compose the perfect sesquilinear form in its second variable with the given unit endomorphism.); `signedHermitianTwist_apply` (Evaluate as h(v,aw).); `signedHermitianTwist_adjoint` (The endomorphism adjoint is conjugated by a, with the displayed order.).
(Source: Kurinczuk–Skodlerack–Stevens, §3.3, printed pp.13–14.)
*Needs:* 2.7 `IntegralHermitianLattice.ofCarrier`.
**Checks.**

- a=1 leaves h unchanged.
- A scalar of negative involution changes hermitian to skew-hermitian.
- a=0 fails perfectness in positive rank and is excluded.

- Finite dimension is essential for the adjoint: on the direct sum of countably many rational lines with its dot pairing, T(e_j)=e_0 is an endomorphism, but its adjoint at e_0 would have every coordinate one. No finitely supported vector has those coordinates.

2.9.4. Prove that the exact-category Witt quotient for finite signed-hermitian vector spaces identifies with the anisotropic-class Witt group. For a quadratic extension it has order four, C2×C2 when −1 is a norm and C4 otherwise. The trivial-extension alternating case is zero; the orthogonal case imports the field Witt theory.
(Source: Kurinczuk–Skodlerack–Stevens, §3.4, Proposition 3.12, printed p.14.)
*Needs:* 2.9.1, QuadraticFormInvariants Layer 4.

2.9.5. Prove that for γ≠0 with involution(γ)=ηγ, scalar twisting induces an additive equivalence Wε(F/F0)→Wηε(F/F0), with inverse twist by γ^−1.
(Source: Kurinczuk–Skodlerack–Stevens, §3.4, printed p.14.)
*Needs:* 2.9 `signedHermitianTwist`, 2.9.4.

Construct `signedHermitianTransfer` (2.9.6): for finite E/F with extending involutions and a nonzero involution-equivariant F-linear map λ:E→F, restriction of scalars with λ∘h gives a perfect ε-hermitian form. It sends a hyperbolic E-plane to [E:F] hyperbolic F-planes and induces a Witt homomorphism.
Its API is `signedHermitianTransfer` (Transfer an actual sesquilinear field form using a nonzero equivariant functional.); `signedHermitianTransfer_apply` (Evaluate as λ(h(v,w)).); `signedHermitianTransfer_hyperbolic` (A hyperbolic plane transfers to [E:F] hyperbolic planes.); `signedHermitianTransfer_witt` (functoriality: The induced additive map on the exact Witt quotients.).
(Source: Kurinczuk–Skodlerack–Stevens, §3.5, printed p.15.)
*Needs:* 2.9.4, QuadraticFormInvariants Layer 9.
**Checks.**

- E=F and λ=id give the identity.
- A hyperbolic plane transfers to degree-many hyperbolic planes.
- The zero linear functional on a positive-rank space is degenerate and is excluded.
- The scalar-tower law is required: the F-action on the underlying module must be the restriction of the E-action. Two unrelated module structures do not make λ∘h sesquilinear over F.
- Over 𝔽₂ the diagonal bilinear plane with matrix diag(1,1) has the isotropic line (1,1), but is nonalternating since B((1,0),(1,0))=1. Thus a Lagrangian alone cannot define a hyperbolic bilinear form in characteristic two; the Lean hyperbolic predicate requires 2≠0.

2.9.7. Prove that for a self-dual extension E=F[β] with involution β↦−β, the image of the signed Witt transfer does not depend on the nonzero equivariant functional λ.
(Source: Kurinczuk–Skodlerack–Stevens, Proposition 3.13(i) and proof, printed p.15.)
*Needs:* 2.9 `signedHermitianTransfer`, 2.9.5.

2.9.8. Prove that for the self-dual extension, transfer sends the unique maximal anisotropic Witt class to the target maximal class.
(Source: Kurinczuk–Skodlerack–Stevens, Proposition 3.13(ii) and printed proof, printed p.15; Skodlerack–Stevens, *Intertwining semisimple characters for p-adic classical groups*, Theorem 4.4, Proposition 4.6 and Lemma 4.7 with proofs, printed pp.13–14, supply the cited transfer argument.)
*Needs:* 2.9.7.

2.9.9. Prove Outside the alternating trivial-extension case, for a self-dual E=F[β] extension, signed transfer is injective separately on the even and the odd anisotropic-dimension classes. It need not be globally injective.
(Source: Kurinczuk–Skodlerack–Stevens, Proposition 3.14 and full proof, printed p.15.)
*Needs:* 2.9.8, 2.9.4.

### Examples

`ℤ ⊂ ℚ` with `q(x) = x²` is an integral quadratic lattice whose polar pairing `2xy` is not unimodular. `ℤ` and `2ℤ` in `(ℚ, x²)` are not in one genus. Over `ℤ₂` the form `[1,1,1]` (that is `x² + xy + y²`) is atomic and binary; the substitution `(x,y) ↦ (x + y/3, y/3)` shows that the coefficient triple of an atomic presentation is not an isometry invariant. For `q = xy` the product of the reflections in `(1,1)` and `(1,2)` is `diag(2, 1/2)`, with spinor norm `[2]`, a nonsquare unit at `3` and outside the spin image at `2`. The Lipschitz order in Hamilton’s quaternions with `h(x,y) = x̄y` is a quaternionic integral hermitian lattice.

### Dependencies

QuadraticFormInvariants Layers 1, 2, 3, 4, 5, 6 and 9; GlobalQuadraticForms Layers 5 and 6; Completed IntegralLattices Layers 1, 2 and 4; OrthogonalSpinGroups Layers 1–3 and RepresentationTheory/SpinRepresentations Layer 2 for the spinor norm and the spin cover; AdelicAlgebraicGroups AA.1 for finite adelic points; Mathlib `Submodule.IsLattice`, `QuadraticMap`, `LinearMap.BilinForm.dualSubmodule`, `Quaternion`, the DVR and PID module theory.

## Layer 3: Representation densities, mass and theta coefficients

This layer counts. Over a finite field with an involution it counts hermitian representations and embeddings (3.1); over an unramified quadratic extension of a nonarchimedean local field it defines the hermitian local representation density as a limit of normalised finite-level counts, with the empty-generic-fibre branch made explicit, constructs the normalised Siegel polynomial `D_L` and proves the Cho–Yamauchi overlattice formula and the functional equation (3.2). Over a totally real number field it proves finiteness of definite stabilizers and of the class set of a definite genus, defines the mass of a genus as a weighted class sum, identifies it with an adelic volume quotient under explicitly fixed Haar measures, and states the mass formula for the genus of maximal integral lattices with its exact local table (3.3). The theta series of a positive definite ℤ-lattice and its coefficients are defined in 3.4; their modularity is not.

### 3.1 Hermitian representation counts over finite fields

Define `hermitianRepresentationCount` (3.1.1): for a finite commutative star ring A and hermitian Gram matrices G of size m and B of size n, count all m×n matrices X with XᴴGX=B. This is a finite count of form-preserving maps, including noninjective maps when the source form is degenerate.
m,n may be zero; star is part of the input. The target space is rank m and the represented/source lattice is rank n.
Its API is `hermitianRepresentationCount` (Finite cardinality of XᴴGX=B.); `hermitianRepresentationCount_empty` (The empty source has count 1.); `hermitianRepresentationCount_basisChange` (functoriality: Invertible source/target coordinate changes induce a bijection of representation sets.).
(Source: Li–Zhang2019v3, §3.1, definition of Rep_{M,L}, physical p.15.)
*Needs:* Mathlib `Matrix.conjTranspose`.
**Checks.**

- Over Z/3 with trivial star, m=n=1, G=B=1 gives 2 maps.
- With G=1,B=0 over Z/3 the count is 1: the zero map.
- For n=0 there is one empty-column representation, for every ambient rank.

Define `hermitianEmbeddingCount` (3.1.2): for the same finite matrices, count solutions XᴴGX=B whose associated A-linear map A^n→A^m is injective. Over finite fields this is equivalent to column rank n; with a degenerate source it is stronger than the representation equation.
The finite-field formula uses the extension F_{q²}/F_q with its nontrivial involution. Injectivity is not substituted by invertibility unless m=n.
Its API is `hermitianEmbeddingCount` (Finite count with the actual injectivity condition.); `hermitianEmbeddingCount_empty` (Count is 1 for n=0.); `hermitianEmbeddingCount_le` (Embedding count is at most representation count.); `hermitianEmbeddingCount_eq_of_nonsingular` (Over a field with nonsingular source, every representation is injective.).
(Source: Li–Zhang2019v3, Proof of Theorem 3.5.1, physical p.18, finite hermitian isometries.)
*Needs:* 3.1 `hermitianRepresentationCount`.
**Checks.**

- Over Z/3, G=1,B=0 at rank one gives 0 embeddings but 1 representation.
- For an empty source the unique map is injective and the count is 1.
- When n>m over a field the embedding count is zero.

3.1.3. Prove that for an n-dimensional F_{q²}/F_q-hermitian source with radical dimension a and a nondegenerate m-dimensional target, m≥n, the number of injective isometries is q^{n(2m−n)} ∏_{i=0}^{n+a−1}(1−(−q)^{i−m}).
q is a prime power ≥2; the involution is x↦x^q. Count embeddings, not all maps from a degenerate source.
(Source: Li–Zhang2019v3, Proof of Theorem 3.5.1, physical p.18.)
*Needs:* 3.1 `hermitianEmbeddingCount`.
Prove `finite_hermitian_norm_fiber` first: every nonzero fixed-field norm value has q+1 preimages, from the cyclic multiplicative group of F_(q²) and the exponent q+1 norm map. Count vectors of each norm by induction in an orthogonal basis, obtaining |U_r(q)|=q^{r(r−1)/2}∏_(j=1)^r(q^j−(−1)^j). Split the source into a nonsingular (n−a)-space and its radical. Witt extension and orbit–stabilizer count the embeddings of the first summand into the target. In its orthogonal complement count ordered independent totally isotropic a-frames: at each step pass to the perpendicular quotient by the previously chosen isotropic space and retain the q-powers for lifts. Multiply these factors and simplify to the displayed formula. Prove the recurrence with its zero factors as well: when n+a>m, the product contains i=m and vanishes, recording the impossible isotropic-frame dimension. The zero source and the zero radical start the induction. The involution is the q-power Frobenius; an arbitrary star ring is insufficient. This is the finite-field part of Li–Zhang's proof, with its group and frame counts exposed rather than inferred from a local-density limit.
**Checks.**

- n=m=1,a=0 gives q+1 norm-one elements.
- n=m=1,a=1 gives 0 embeddings.
- n=0,a=0 gives the empty product 1.
- With q=2 and the square-Frobenius involution on F₄, the norm fibers over 1 and 0 have respectively 3 and 1 elements. Embeddings of a unit line into the unit hermitian spaces of dimensions 1, 2 and 3 have counts 3, 6 and 36. These are field counts; Z/4 with the identity involution does not meet the hypotheses.

### 3.2 Local densities and Siegel polynomials

**Representation charts and stabilization.** Construct `hermitianRepresentationScheme` over O_(F0) for the equation XᴴGX=B and its primitive open `primitiveHermitianRepresentationScheme`, defined by an invertible n×n minor of X over O_F. Its points over an O_(F0)-algebra S are matrices over O_F⊗S satisfying this equation; the involution acts on the O_F factor. Represent this functor by finitely many polynomial equations in 2mn coordinates, with the n² independent hermitian equations. Its API includes the finite-level point/count comparison, basis-change isomorphisms, the primitive open immersion, and generic relative dimension n(2m−n) for nondegenerate G and B. Prove `hermitian_generic_jacobian_surjective` using the derivative Y↦XᴴGY+YᴴGX: over F0, XᴴGX=B is nonsingular, and Y=XB^−1H/2 maps to a hermitian H. This division occurs over the characteristic-not-two fraction field, not over the integral ring.
(Source: Li–Zhang §3.1, p.15; the fibre/differential construction is the hermitian adaptation of Cho–Yamauchi §3.1, Definition 3.1 and Corollary 3.5, pp.11–13.)
**Checks.**

- The rank-zero source gives the terminal scheme and one primitive point at every finite level.
- A rank-one zero Gram source can have a zero representation, but that point is outside the primitive open.
- Over F4/F2, rank-one unit Gram matrices have three primitive points. The derivative on the diagonal uses the surjective field trace F4→F2, not multiplication by 2.

Prove `hermitian_count_stabilizes`: for integral nondegenerate G and B with n≤m, there is N0 such that #Rep(O_(F0)/π^(N+1))=q^{n(2m−n)}#Rep(O_(F0)/π^N) for every N≥N0. Give a separate compact-chart proof for arbitrary nonsingular integral target: the exact integral solution set is compact; the Jacobian right inverse above has bounded denominators (depending on v(2) and v(det B)). A multivariate quadratic Hensel construction yields finitely many disjoint residue charts on which the Gram map has an invertible transverse differential after fixed coordinate scalings. The chart's n(2m−n) free coordinates yield exactly q^d more residue points per level once those scalings are absorbed. Compactness also shows all sufficiently accurate approximate solutions lie in these charts: otherwise a convergent subsequence produces an uncovered exact solution. The empty branch is 3.2.3. State and prove the chart lifting, uniform denominator bound and finite chart cover as the intermediate obligations of this target; generic smoothness alone does not count reductions. This proves a finite rational, eventually constant normalized sequence, including when v(2)>0.
(Source: the fibre measure and lattice-coordinate normalization of Cho–Yamauchi §3.1, Definition 3.1, pp.11–12; explicit quadratic Hensel/chart argument specialized here to Li–Zhang's representation functor, §3.1, p.15.)

**Primitive smooth count and saturation decomposition.** Prove `primitive_hermitian_smooth_count` for a self-dual target I_m: the primitive Gram morphism is smooth over O_(F0), including dyadic places. On its special fibre, injectivity of X and nondegeneracy of G make Y↦XᴴGY onto all matrices; A↦A+Aᴴ is onto the hermitian matrices, with the diagonal supplied by the trace of the unramified quadratic extension. Lift this trace-surjectivity over O_(F0) and apply the Jacobian criterion. Consequently each special-fibre point has q^{(N−1)d} points at level N, and the primitive density equals q^−d times the finite-field embedding count. Prove `hermitian_saturation_density_sum`: every exact representation of L extends uniquely to a primitive representation of an integral overlattice L′, its saturated preimage in the target, and
Den(I_m,L)=Σ_(L⊆L′⊆(L′)∨) q^{−2(m−n)length(L′/L)} Den_prim(I_m,L′).
The possible L′ are finite submodules of L∨/L. The change-of-variables factor is q^{−2mℓ} on Hom coordinates and q^{2nℓ} on hermitian-form coordinates. Prove the partition and these determinants before interchanging the finite sum and stabilized counts. Neither the quadratic exponent in Cho–Yamauchi nor the q² residue cardinal is substituted into the normalized hermitian exponent.
(Source: Li–Zhang, Theorem 3.5.1 and proof, pp.17–18; Cho–Yamauchi, Theorem 3.9, Lemma 3.10, Corollary 3.11 and Theorem 3.12, pp.15–16, and equation (3.4), §3.3. The explicit unramified hermitian tangent argument here supplies the dyadic step referenced there to Gan–Yu Lemma 5.5.2 and §9.)

Define `normalizedHermitianCount` (3.2.1): for N≥1 let A_N=O_F/π^N, reduce fixed integral source/target Gram matrices of ranks n≤m to A_N, and let q=#k_{F₀}. Set a_N=hermitianRepresentationCount(G_N,B_N)/q^{N n(2m−n)}. Equivalently its numerator is #Rep_{M,L}(O_{F₀}/π^N), because the representation scheme is over O_{F₀}; it is not #Rep_{M,L}(A_N). The denominator uses q, not q².
The `Suggested.lean` definition takes the finite ring `A_N`, `q` and `N` as parameters and is total (with `q ≥ 2` the denominator is nonzero); the identification `A_N = O_F/π^N` with `q = #k_{F₀}` is a hypothesis of every theorem about it.
F/F₀ is unramified quadratic and F₀ is a nonarchimedean local field of characteristic different from 2. The generic representation scheme is nonempty with dimension n(2m−n). This sequence does not by itself assert convergence.
Its API is `normalizedHermitianCount` (Finite count divided by q^{N n(2m−n)}.); `normalizedHermitianCount_empty` (The empty-source count is 1.); `normalizedHermitianCount_basisChange` (Integral invertible basis changes preserve every normalized count.).
(Source: Li–Zhang2019v3, §3.1 local density definition, physical p.15.)
*Needs:* 3.1 `hermitianRepresentationCount`, 2.7 `IntegralHermitianLattice.ofCarrier`.
**Checks.**

- For n=0 the normalized count is 1 at every level.
- For m=n=1 the exponent is N, not 2N.
- A generic empty representation problem is not treated as a smooth nonempty scheme of the stated dimension.

Construct `hermitianLocalDensity` (3.2.2): In the stated unramified local-field setting, Den(M,L) is the limit of normalized finite-level representation counts. For nonempty generic fibre use its specified dimension and the source existence theorem. For empty generic fibre set Den(M,L)=0; eventual emptiness of the finite-level counts proves agreement with the limit for any fixed exponent. Its finite value and integral-basis independence are part of the construction.
The unramified analytic density branch allows residue characteristic 2; geometric §3.4 hypotheses are not assumed throughout §3. Haar measures on lattice coordinates assign volume 1 to the integral coordinate lattice before any self-dual Fourier normalization is applied.
Its API is `hermitianLocalDensity` (The proved limit of normalized counts.); `hermitianLocalDensity_tendsto` (The normalized sequence tends to the stated density.); `hermitianLocalDensity_basisChange` (Integral isometries preserve the density.); `hermitianLocalDensity_emptyGeneric` (An empty generic representation fibre has density zero.).
(Source: Li–Zhang2019v3, §§3.1–3.2, physical pp.15–16.)
*Needs:* 3.2 `normalizedHermitianCount`, `hermitianRepresentationScheme`, `hermitian_count_stabilizes`, 3.2.3. Define the density as the eventual normalized rational value, then prove the stated real-limit characterization; a bare choice of a real limit is not the construction.
**Checks.**

- Density of the empty source is 1.
- The denominator and measure use q=#k_{F₀}; substituting q² changes the limit.
- A ramified quadratic extension cannot reuse the unramified formula without a new theorem.
- An empty generic representation fibre has density zero, although initial finite reductions can still admit solutions.

3.2.3. Prove that for complete discrete valuation fields in the stated unramified hermitian setting, if the generic representation scheme Rep(M,L)(F0) is empty, there is N0 such that every integral Gram representation count modulo pi^N is zero for N>=N0. Consequently every fixed-power normalized count is eventually zero and its limit is zero.
The unramified analytic density branch allows residue characteristic 2; geometric §3.4 hypotheses are not assumed throughout §3. Haar measures on lattice coordinates assign volume 1 to the integral coordinate lattice before any self-dual Fourier normalization is applied.
(Source: Li–Zhang2019v3, Li–Zhang §3.1, physical p.15, definition of the count.)
*Needs:* 3.1 `hermitianRepresentationCount`.
**Checks.**

- For a rank-one target of norm 1 and source of norm pi, reduction modulo pi has a zero-vector solution, while modulo pi^2 no solution can have norm of valuation one. Generic emptiness implies eventual zero, not zero at every finite level.

Construct `normalizedSiegelPolynomial` (3.2.4): for an integral nondegenerate unramified hermitian lattice L of rank n, first define D_L∈Z[X] by the finite overlattice sum of 3.2.6, using the weight of 3.2.5. Then prove D_L((−q)^−k)=Den(⟨1⟩_{n+k},L)/Den(⟨1⟩_{n+k},⟨1⟩_n) for every integer k≥0. The denominator is ∏_{i=1}^n(1−(−q)^−i(−q)^−k), which is nonzero for q≥2. Uniqueness follows from the infinitely many distinct points (−q)^−k over Q, rather than being assumed in the construction.
q≥2 and the extension is unramified quadratic. The interpolating polynomial and its integral coefficients require a proof, not a generic choice of a function through finitely many values.
Its API is `normalizedSiegelPolynomial` (The integral normalized density polynomial.); `normalizedSiegelPolynomial_eval` (Evaluate at (−q)^−k to recover the specified density ratio.); `normalizedSiegelPolynomial_selfDual` (Polynomial equals 1 for a self-dual lattice.); `normalizedSiegelPolynomial_isometry` (functoriality: Integral hermitian isometries preserve the polynomial.).
(Source: Li–Zhang2019v3, §3.2, physical p.16.)
*Needs:* 3.2 `choYamauchiWeight` (build 3.2.5 first), 2.7 integral overlattices and their finite dual quotient, `primitive_hermitian_smooth_count`, `hermitian_saturation_density_sum`, 3.1 `finite_hermitian_isometry_formula`. The primitive count factor is the self-dual denominator times m_q(t(L′);(−q)^−k); the saturation factor is ((−q)^−k)^{2ℓ}. Thus the finite sum proves interpolation and integral coefficients without using interpolation to define its summands. Hironaka's polynomial-existence theorem is not an additional unproved input to this route.
**Checks.**

- For a rank-one lattice with valuation a, D_L(X)=Σ_{i=0}^a(−X)^i.
- A self-dual lattice has polynomial 1.
- Using q^−k instead of (−q)^−k loses the alternating sign.

Define `choYamauchiWeight` (3.2.5): for q≥2 and a∈N define m_q(a;X)=∏_{i=0}^{a−1}(1−(−q)^i X) in Z[X], with empty product m_q(0;X)=1. The derivative weight is −m_q(a;X)′ at X=1; for a=0 it is 0, and for a≥1 it is ∏_{i=1}^{a−1}(1−(−q)^i).
The negative base is in Z before taking powers. Polynomial empty weight 1 and derivative empty weight 0 are distinct.
Its API is `choYamauchiWeight` (The integral polynomial finite product.); `choYamauchiWeight_zero` (Empty polynomial weight is 1.); `choYamauchiWeight_succ` (m(a+1;X)=m(a;X)(1−(−q)^a X).); `choYamauchiWeight_derivative` (The negative derivative at 1 is 0 for a=0 and the stated product for a>0.).
(Source: Li–Zhang2019v3, §3.5 before Theorem 3.5.1, physical p.17.)
*Needs:* Mathlib `Polynomial`, `Polynomial.derivative`.
**Checks.**

- m_q(0;X)=1, derivative weight 0.
- m_q(1;X)=1−X, derivative weight 1.
- m_q(2;X)=(1−X)(1+qX), derivative weight 1+q.

3.2.6. Prove D_L(X)=Σ_{L⊆L′⊆(L′)∨} X^{2 length_{O_F}(L′/L)} m_q(t(L′);X), summing over integral overlattices of L. The sum is finite because every such L′ lies between L and L∨.
Unramified quadratic extension of a local field of characteristic different from 2, including dyadic residue characteristic in this analytic statement. Length is over O_F; t is the number of positive fundamental invariants.
(Source: Li–Zhang2019v3, Theorem 3.5.1 and proof, physical pp.17–18.)
*Needs:* 3.2.4's finite-sum construction, `primitive_hermitian_smooth_count`, `hermitian_saturation_density_sum`, 3.1 `finite_hermitian_isometry_formula`. This identifies the already constructed finite-sum polynomial with the normalized density polynomial; it does not construct a second polynomial or feed cyclically into its own definition.
**Checks.**

- For valuation-one rank one, D=1−X and the negative derivative is 1.
- For valuation-three rank one, D=1−X+X²−X³ and the negative derivative is 2.
- A self-dual L contributes just L with type 0 and polynomial 1.

3.2.7. Prove that for integral nondegenerate L, D_L(X)=(−X)^{val(L)}D_L(X^−1), interpreted in the Laurent polynomial ring. If val(L) is odd then D_L(1)=0.
The val(L) parity and the negative sign are retained.
(Source: Li–Zhang2019v3, §3.2 (3.2.0.2), physical p.16.)
*Needs:* 3.2 `normalizedSiegelPolynomial`, 2.7 `HermitianLatticeInvariants.ofDualQuotient`, `hermitian_spherical_weyl_equation` and `hermitian_siegel_integral_comparison` below. Follow Hironaka's original functional-equation proof, not an inference from polynomial existence. After the spherical equation, divide out the explicit self-dual Euler polynomial, change its variable to X, and use interpolation at infinitely many (−q)^−k to identify its polynomial with 3.2.4. Use `hermitian_siegel_density_transform` below for the exact variable conversion; it supplies the determinant sign as well as the power of X.
**Checks.**

- Rank-one D=1−X at valuation 1 satisfies D(X)=−X D(X^−1).
- At valuation 2, D=1−X+X² and D(1)=1, so the odd-valuation vanishing does not extend to even valuation.

**Spherical-function proof of the Siegel equation.** For nonsingular T=Tᴴ∈M_n(F), define `hermitianSiegelIntegral` as b_T(t)=∫_(Herm_n(F))ν(R)^(−t)ψ(tr(TR))dR, where ψ has conductor O_(F0), the integral hermitian lattice has Haar volume one, and ν(R)=q^(Σ_j e_j) for the negative elementary divisors π^(−e_j) of R. Matrix trace tr(TR) lies in F0; no extra extension trace is inserted. Construct `hermitianSphericalFunction` on X_T={X∈M_(2n,n)(F):XᴴH_nX=T}, H_n=[[0,I],[I,0]], modulo the right U(T) action. Write X₂ for its lower n×n block and f_i(X)=det((X₂T^(−1)X₂ᴴ)_(1..i,1..i)). Define ω_T(X;s)=∫_K∏_i |f_i(kX)|^(s_i+ε_i)dk over the nonvanishing locus, with Haar(K)=1, ε_i=−1+πi/log q for i<n and ε_n=−1/2+πi/log q. The domain Re(s_i)≥−Re(ε_i) gives absolute convergence. In z variables, s_i=−z_i+z_(i+1) for i<n and s_n=−z_n. The API includes invariance under K and right U(T), change of integral basis, the relative-invariant transformation under the upper-triangular Borel, and rational continuation in q^(s_i). For b_T, Re(t)>2n is a sufficient convergence domain. These are actual integrals, not functions with an equation stored as a field.
(Source: Hironaka, *Spherical functions on U(2n)/(U(n)×U(n)) and hermitian Siegel series*, arXiv:0904.4304v3, §§1 and 5, equations (1.2), (1.4), (5.1)–(5.3), pp.2–5 and 27–29.)
**Checks.**

- With n=0 the matrix spaces are points and the normalized integral is 1.
- The nonsingular unit lattice gives normalized polynomial 1, including at residue cardinal q=2.
- Changing the conductor without changing the Haar and lattice normalization changes the integral comparison; it is not the same input data.

Prove `hermitian_spherical_weyl_equation`: for W=S_n⋉{±1}^n acting on z and every σ∈W, ω_T(X;z)=Γ_σ(z)ω_T(X;σz) as rational functions. Here

```text
Γ_σ(z) = ∏_(α=e_i±e_j, i<j, σα negative)
             (1−q^(⟨α,z⟩−1))/(q^⟨α,z⟩−q^(−1)).
```

The long-root reflection z_n↦−z_n has factor one. First prove the simple-reflection equations by the rank-one hermitian integral and determinant relative invariant; the cocycle relation Γ_(σ₂σ₁)(z)=Γ_σ₂(σ₁z)Γ_σ₁(z) and the root inversion set then give the product. Identities are rational/meromorphic identities; a pole is not assigned a finite integral value.  Prove `hermitian_siegel_integral_comparison` by Fourier inversion on the hermitian matrix space, the determinant zeta integral on M_n(O_F), and the finite K-orbit decomposition of the integral representation space. The long Weyl element sends t to 2n−t and yields the Siegel integral equation of Hironaka Theorem 5.6. Its elementary gamma factors cancel to the normalized equation above. The proof targets are the simple-reflection equations, their cocycle product, the Fourier/fibre integral comparison, and the determinant zeta evaluation; none is supplied by a generic density limit.
(Source: Hironaka, Theorem 2.3, p.10, and proof through p.14, Theorem 2.6, p.15, and Corollary 2.7, p.16, Lemma 5.1, Theorem 5.2 and Proposition 5.3, pp.28–29, and Theorem 5.6 and proof, pp.31–32. This preprint numbers the theorem 5.6; Li–Zhang cites the published theorem as 5.3.)

Prove `hermitian_siegel_density_transform`: with a=val(det T), f_n(Y)=∏_(i=0)^(n−1)(1−(−q)^iY), and g_T(q^(−t))=b_T(t)/f_n(q^(−t)), one has

```text
D_L(X)=g_T((−q)^(−n)X),
g_T(Y)=(−1)^(a(n−1)) q^(an) Y^a g_T(q^(−2n)Y^(−1)).
```

The second equality follows from Hironaka's Theorem 5.6 after cancelling f_n. For the first, finite Fourier orthogonality on Herm_n(O_F/π^N) identifies the representation count with the integral-character average of its Gram equation. Integrate the rows of I_(n+k) separately: the unramified norm Gaussian on a diagonal coefficient of negative valuation e contributes (−q)^(−e) per row; unit coefficients contribute one. Hermitian diagonalization over F0 and integral changes of basis separate the elementary divisors. Taking N beyond the count-stabilization threshold gives g_T((−q)^(−(n+k))) times the self-dual density. Thus both polynomials agree at all X=(−q)^(−k), and polynomial uniqueness gives the first equality. The three integral identities below supply this conversion with its measure calculation. Applying Y=(−q)^(−n)X to the second formula gives (−X)^a: (−1)^(a(n−1))q^(an)(−q)^(−na)=(−1)^a. (Hironaka Theorem 5.6 and Remark 5.7, pp.31–32; Li–Zhang §3.1–§3.2, pp.15–16, for the density normalization.)

**Checks.**

- For n=1 and valuation a=1, g_T(Y)=1+qY and D_L(X)=1−X. The substitution q^(−n)X instead of (−q)^(−n)X fails this control.
- For n=1,a=2, g_T(Y)=1+qY+q²Y² and D_L(X)=1−X+X²; the functional equation has positive sign. For a=0 both normalized polynomials are one.
- In the empty rank, f₀=g_T=D_L=1 and all matrix integrals are over a point. In rank one the long-root Weyl reflection has Γ=1 even at dyadic residue cardinality q=2.

Prove `unramified_hermitian_norm_gaussian`: with Haar(O_F)=1, an additive character ψ of F0 of conductor O_(F0), an unramified quadratic extension F/F0 and a unit u∈O_(F0)×,

```text
∫_(O_F) ψ(u π^(−e) N_(F/F0)(x)) dx = (−q)^(−e)       (e≥0).
```

For e=0 the character is trivial on the integral norm. For e=1, reduce modulo π; each nonzero norm fibre has q+1 elements and the zero fibre has one, so additive-character orthogonality makes the sum −q, divided by q². For e≥2, split x into a residue class modulo π. In a nonzero class the norm derivative is the surjective trace map multiplied by a unit, so averaging the last digit makes that class contribute zero. In the zero class x=πy gives q⁻² times the integral with e−2. This proves the stated sign and power, including q=2. The trace-surjectivity step uses the unramified extension; it cannot be applied to a ramified quadratic extension. (Deduction from the norm fibres of 3.1 and the unramified trace map; compare the Fourier normalization in Hironaka §5, Lemma 5.1 and Theorem 5.2, pp.27–29.)

Prove `hermitian_finite_fourier_count`: put m=n+k, A=I_m, T integral hermitian of rank n, and let C_N count X∈M_(m,n)(O_F/π^N) with XᴴX=T modulo π^N. Normalize dX and dR so their integral coordinate lattices have measure one. The trace pairing on Herm_n(O_F) is self-dual for ψ: diagonal coordinates use ψ on F0 and off-diagonal coordinates use ψ∘Tr_(F/F0), whose different is the unit ideal. Finite character orthogonality gives

```text
q^(−N(2mn−n²)) C_N
  = ∫_(π^(−N) Herm_n(O_F)) ψ(−tr(TR))
       (∫_(M_(m,n)(O_F)) ψ(tr(R XᴴX)) dX) dR.
```

This is a finite sum of integrals constant on the integral R cosets; no interchange of nonconvergent infinite integrals is used. Diagonalize integral hermitian matrices over the unramified extension by integral congruence, permitting negative diagonal valuations, and apply the one-row Gaussian m times. A diagonal factor with negative valuation e contributes (−q)^(−me), while an integral factor contributes one. Thus the inner integral is (−1)^(m Σe_j)ν(R)^(−m). This also specifies the imaginary part of Hironaka's parameter: q^(−t)=(−q)^(−m), rather than q^(−t)=q^(−m). (The finite Fourier argument is the density counterpart of Hironaka's Lemma 5.1 and Theorem 5.2, pp.27–29; its counting normalization is Li–Zhang §3.1, p.15.)

Prove `hermitian_stabilized_fourier_density`: for k≥0 take the limit of these compact-domain Fourier integrals using the density-stabilization theorem of 3.2. The resulting b_T value is understood by rational continuation when its defining integral is not absolutely convergent. Identify that continued value by first proving the equality in the absolutely convergent range m>2n, then identifying the rational functions at infinitely many such integers m=n+k. Dividing by f_n((−q)^(−m)) gives the density ratio at every k≥0 through the already constructed polynomial and the stabilized count, rather than an unproved exchange of limits at m=n. The distinct interpolation points accumulate at zero and f_n is nonzero on them. (Hironaka Corollary 5.4, Remark 5.5 and Theorem 5.6, pp.29–32; Li–Zhang §3.2, p.16.)

**Checks.**

- For q=2 the one-row integral at e=0,1,2 is 1, −1/2, 1/4. The positive base q⁻ᵉ fails at e=1.
- For n=m=1 over F₄, modulo π the equation N(x)=1 has three solutions. Its normalized count is 3/2: the two R residues give 1+(−1)(−1/2)=3/2. For T=0 there is one solution and the same calculation gives 1−1/2=1/2. Omitting the q^(Nn²) Fourier factor would give 3/4 instead.
- For n=0 both sides of the finite identity and the density ratio are one for every N,m. A ramified quadratic extension lies outside the trace-self-duality hypothesis; its different changes the Fourier lattice.

Keep two proof branches. `hermitian_siegel_functional_equation_charZero` applies Hironaka's p-adic proof, including dyadic residue characteristic. `hermitian_spherical_equalCharOdd` transports that proof to equal positive characteristic different from two: construct the unramified quadratic basis, verify trace/norm surjectivity and the rank-one integral identities, and repeat the simple-reflection and Fourier calculations over that local field. In this branch 2 is a unit, so the basis (1,(1+√ε)/2) and the determinant-character argument are valid; no mixed-characteristic analytic comparison or characteristic-zero lifting is assumed. This is a proof adaptation required by Li–Zhang's characteristic-not-two scope, rather than a claim that Hironaka states the larger scope. Equal characteristic two remains excluded.

### 3.3 Finite stabilizers, genus classes and mass

**Trace lattice and its number-ring action.** Construct `numberRingTraceForm` for an integral quadratic lattice L over O_F by Q_Z(x)=Tr_(F/Q)(Q(x)). Construct `traceLatticeRealComparison` between its real scalar extension and ⊕_(σ:F→R) V_σ; its quadratic form is Σ_σ Q_σ. Assume F totally real and every Q_σ positive definite. The underlying module is finite free over Z of rank [F:Q] rank_(O_F)L, even when L is merely projective over O_F. Use a pseudo-basis (coefficient fractional ideals retained), the canonical number-field embedding lattice, and finite-index comparison to prove the diagonal image discrete and full. The associated metric is the bilinear form obtained by dividing the polar form by 2 over R. Its API consists of the trace evaluation, integral values, positivity, rank, full-lattice comparison, isometry transport, and compatibility with localization at each rational prime. The last decomposes O_F⊗Z_p over all primes of F above p; no single completion suffices.
(Source: restriction-of-scalars deduction using Mathlib `Algebra.trace`, `QuadraticMap.restrictScalars`, `LinearMap.compQuadraticMap`, `NumberField.mixedEmbedding`, and the ideal embedding lattice; the Z-lattice realization and finiteness results are IntegralLattices 0E and 2A–2G. Schulze-Pillot2021v2, Theorem 6.10, Remarks 6.11 and 6.13, pp.77–78, give the number-ring finiteness statement.)
**Checks.**

- For F=Q, this construction is the original integral quadratic form; rank zero remains rank zero and has determinant 1. For Q(x)=x², its values at 2, −3 and 0 are 4, 9 and 0; for 2x² its value at 3 is 18. These evaluate the trace carrier itself.
- For F=Q(√5), O_F=Z[ω], ω=(1+√5)/2, and Q(x)=x², the trace form in basis (1,ω) is 2a²+2ab+3b², with rational Gram matrix [[2,1],[1,3]] of determinant 5. Its polar matrix has determinant 20; the factor of 2 in each dimension is retained.
- Taking just one embedding of Z[ω] into R gives a nondiscrete subgroup; both real embeddings are necessary. A nonprincipal coefficient ideal still has a Z-basis, and the comparison does not assert it has an O_F-basis.

**Bounded integral endomorphisms.** Prove `finite_bounded_integral_endomorphisms`: on a finitely generated free Z-module with a positive integral trace form, for C≥0 there are finitely many integral linear endomorphisms T with Q_Z(Tx)≤C²Q_Z(x) for every x. Evaluate on a finite Z-basis and use IntegralLattices 2A for each image; an endomorphism is determined by these images. Prove `trace_scalar_operator_bound`: multiplication by a∈O_F is self-adjoint for the trace metric and satisfies this bound with C=max_σ|σ(a)|, using the real direct-sum comparison. This applies to a fixed finite set of integral algebra generators of O_F, whose bounds depend on F and the chosen generators, not on L.
(Source: deduction from the trace comparison and IntegralLattices 2A; Schulze-Pillot, Remarks 6.11 and 6.13, pp.77–78, for the intended number-ring scope.)
**Checks.**

- On Z with Q_Z(x)=x² and C=1, the allowed endomorphisms multiply by −1, 0 or 1.
- At C=0 only the zero map remains, including on the zero module.
- Without positivity, the zero quadratic form allows every integer multiplication and the finiteness assertion fails.

3.3.1. Prove that the integral isometry group of a totally positive number-field quadratic lattice is finite, by restriction through all real embeddings to a positive-definite real lattice.
Definiteness and full finite generation are essential; indefinite lattices can have infinite isometry groups.
(Source: trace-lattice deduction from IntegralLattices 2C; the stabilizer/mass convention is Voight2026, Definition 9.7.13.)
*Needs:* `numberRingTraceForm`, `traceLatticeRealComparison`, IntegralLattices 2C. Restriction of an O_F-isometry to its underlying Z-module is injective and preserves the trace form. Apply the existing positive Z-lattice automorphism finiteness theorem; do not plan it again.
**Checks.**

- For (Z,x²) the isometry group is {±1}, so its mass weight is 1/2.
- Positive definiteness cannot be dropped: Pell-type indefinite rank-two lattices have infinite stabilizers.

3.3.2. Prove that the integral-isometry class set of a fixed totally positive quadratic genus over a number ring is finite.
A fixed determinant/discriminant ideal and archimedean signatures belong to the genus data. This is finiteness of classes, not finiteness of all embedded lattices.
(Source: Schulze-Pillot, Theorem 6.10, Corollary 6.12 and Remarks 6.11, 6.13, printed pp.77–78; the following positive-definite proof uses IntegralLattices 2G through restriction of scalars.)
*Needs:* 2.4 `IntegralGenus.localIsometry`, `traceLatticeRealComparison`, `finite_bounded_integral_endomorphisms`, `trace_scalar_operator_bound`, IntegralLattices 2G. Local genus isometries make the positive integral trace lattices have the same rank and determinant, so 2G gives finitely many underlying Z-isometry classes. On each fixed representative, the images of finitely many algebra generators of O_F lie in the finite bounded-endomorphism sets just proved. There are therefore only finitely many possible O_F-actions. The trace pairing of F/Q is nondegenerate: the Z-polar form evaluated on (ax,y), for all a∈O_F, recovers the F-valued polar form, and hence Q since char F=0. Thus the trace form together with its O_F-action determines the original quadratic lattice up to O_F-isometry. This proves finiteness without imposing freeness over O_F or discarding coefficient ideals.
**Checks.**

- Infinitely many embedded coordinate changes can represent one integral-isometry class.
- The rank-one positive unimodular Z-genus has one class, though its isometry group has two elements.

Define `genusMass` (3.3.3): for a positive-definite genus with its proved finite class set, mass(L)=Σ_[M] 1/|O(M)| as a positive rational number. Proper mass uses proper classes and SO(M) separately; neither is substituted for the other without an index comparison.
Finite automorphism groups and a finite class set are supplied before summing. Their orders are positive because they contain the identity. The total Lean finite-sum adapter permits zero orders with inverse zero, but such inputs are outside arithmetic mass. Unweighted class number and mass are different invariants.
Its API is `genusMass` (Finite sum of rational reciprocal integral-isometry stabilizer orders.); `genusMass_representative` (The summand is independent of the chosen representative.); `genusMass_singleton` (A singleton class set has mass the reciprocal stabilizer order.); `genusMass_pos` (A nonempty finite positive genus has strictly positive mass.).
(Source: Voight2026, §9.7 genus class set.)
This variant is over a number ring; its index comparison is a separate target.
*Needs:* 3.3.1, 3.3.2.
**Checks.**

- The rank-one positive unimodular genus has ordinary mass 1/2, not class number 1.
- For proper rank-one classes the stabilizer is trivial and proper mass is 1.
- Changing representatives cannot change the stabilizer cardinality.

3.3.4. Let q be totally positive over a totally real number field, G=SO(q), and K_f the integral stabilizer of a fixed lattice in its finite adelic genus. For compatible product Haar measures with convergent product vol(K_f), proper mass equals vol(G(K)\G(A))/(vol(G(K∞))·vol(K_f)). Every double-coset contribution is the reciprocal order of the proper integral stabilizer.
Use proper SO classes and weights consistently. Local measures, archimedean measure and the convergent product are fixed before numerical evaluation. The numerator is not replaced by 2 until a separate Tamagawa-number theorem is supplied; low-rank tori have separate behavior.
(Source: double-coset integration in Gan–Hanke–Yu §7, printed pp.118–119; Benoist physical pp.5–7 supplies the quotient/Haar convention.)
*Needs:* 3.3 `genusMass`, AdelicAlgebraicGroups AA.2, AdelicAlgebraicGroups AA.3.
**Checks.**

- Rescaling one local Haar measure changes the numerator and local factor compatibly.
- For proper rank-one classes the SO stabilizer is trivial and mass equals class count. A proper class whose stabilizer has order four contributes 1/4; for example SO(Z^2,x^2+y^2) has order four.
- The numerical constant 2 is not an assumption-free formula for SO of rank 1 or 2.

**Rank-one Weil operators and quadratic fibres.** Construct `adelicSchwartzBruhat V` as the restricted tensor product of the local Schwartz spaces, using compactly supported locally constant functions at finite places and Schwartz functions at infinity. Fix a nontrivial additive character of A_K/K and its self-dual measures. For a nondegenerate quadratic form Q define multiplication by ψ(bQ(x)), normalized dilation |a|^(m/2)φ(ax), and Fourier transformation with respect to Q's polar pairing. Construct `quadraticWeilOperators Q` as the central extension of SL₂(A_K) generated by these operators and scalars, rather than declaring a linear SL₂ representation at each place. Prove the Gaussian relations and the splitting over SL₂(K); the global splitting follows by applying Poisson to the rational vector lattice, or equivalently the product formula for the local Gaussian indices. Orthogonal changes of variables commute with these operators. Its API is preservation and continuity on Schwartz–Bruhat functions, the generator relations, rational splitting, orthogonal commutation, and invariance of the theta distribution Θ(φ)=Σ_(x∈V(K))φ(x).
(Source: Weil, *Sur certains groupes d'opérateurs unitaires*, §13, p.160, and Theorem 2 with Corollaries 1–2, §14, pp.161–162, §40, formula (38), pp.191–193, Theorem 6 and proof, §41, pp.193–194, and Proposition 9 with its adelic corollary, §51, p.210. Only this quadratic rank-one subset is required here.)
**Checks.**

- Multiplication at b=0 and dilation at a=1 are the identity; dilation at −1 reflects the argument. Normalization uses the square root of the additive modulus.
- Two self-dual Fourier transformations give φ(−x), rather than φ(x). On a two-point finite test group with pairing (x,y)↦(−1)^(xy), the Fourier matrix is 2^(−1/2)[[1,1],[1,−1]] and its square is the identity because reflection is trivial there.
- Theta invariance for a∈K× uses the bijection x↦ax and the product formula. Arbitrary adelic a need not preserve V(K), so invariance under all dilations is excluded.

For m>4 construct `quadraticFiberDistribution Q t` on {x≠0 : Q(x)=t}, with gauge dx/dQ. Prove `quadraticFiberFourier`: φ↦F_φ(t), the integral against this gauge, is continuous in t and its Fourier transform is b↦∫φ(x)ψ(bQ(x))dx. This includes t=0 on the nonsingular locus. Apply Fourier inversion to the pushforward under Q; integrability of the oscillatory integral follows after diagonalization from the product of one-dimensional Gaussian estimates. Its decay exponent m/2 exceeds two, giving the continuity and summability needed here. No atomic mass at the singular point is included. Prove scaling F_(φ∘a)(t)=|a|^(−m+2)F_φ(a²t), with compatible coordinate measures. The API includes positivity, orthogonal invariance, transport under isometry, scaling and the local-to-adelic product of these fibre measures. At almost all finite places, finite orthogonal orbit counts give the convergence factors; their deviation from one is O(q^(−2)) in this rank range.
(Source: Weil, *Sur la formule de Siegel dans la théorie des groupes classiques*, Proposition 6, §37, p.54; §§42–43, pp.60–62; Theorem 2, §44, pp.62–63. The local pushforward/Fourier criterion is Proposition 1, §2, pp.6–7; its regularization lemmas are §1–2, pp.4–5.)
**Checks.**

- On a positive real form the fibre at a negative t is empty. At t=0 its nonsingular locus is empty, so its fibre distribution is zero, although δ₀ is nonzero.
- For the split form xy+z₁²+z₂²+z₃², the nonzero zero fibre is nonempty and has positive mass against a nonnegative test function supported near a nonsingular isotropic point.
- Scaling five coordinates by a gives |a|^(−3), not |a|^(−5); the quadratic target contributes the factor |a|². The hypothesis m>4 excludes the borderline convergence argument in rank four.

**Orthogonal theta average and Tamagawa number.** Prove `rankOneSiegelWeil`: for m>4, the integral of Θ(gφ) over SO(Q)(K)\SO(Q)(A_K), with quotient measure normalized to one, equals the rank-one Eisenstein distribution. Construct that distribution from the rational Weil operators, with its zero term δ₀ and its full-rank terms Σ_(t∈K) quadraticFiberDistribution(Q,t). Prove absolute convergence and continuity in φ before integrating. In rank one the parabolic exponent is m/4>1; reduction and the lattice height count bound the rational projective-line sum. The theta integral converges by reduction with exponent m−WittIndex(Q)>2. The uniqueness argument isolates a fibre by Fourier coefficients of the quadratic-phase operators, then uses orthogonal transitivity at one good finite place to make its difference a scalar multiple of the canonical fibre measure. Dilation towards zero has exponent −m/2+2<0, whereas the difference remains bounded on the reduced adelic domain; hence that scalar is zero. The zero coefficient agrees because the averaging measure has total mass one. This proves the comparison without assuming a Tamagawa number.
(Source: Weil 1965, Theorems 1–3, §§40–44, pp.57–63; Theorem 4, §50, pp.72–74; Proposition 8, §51, pp.75–76; Theorem 5 and proof, §52, pp.76–80.)

Prove `orthogonalTamagawa_stabilizer`: for a nonzero vector in rank m>4, the group and its connected stabilizer have equal Tamagawa numbers with compatible invariant gauges. Unfold its rational orbit in the theta identity and compare the quotient gauge with dx/dQ. A nonisotropic stabilizer is SO of its orthogonal complement; an isotropic stabilizer is SO of the rank m−2 residual form extended by a unipotent group of Tamagawa number one. These assertions include the same convergence factors on both group measures.
(Source: Weil 1965, §§53–54, pp.80–82, especially formula (43).)

Prove `quaternionAdjointTamagawa`: τ(PGL₁(D))=2 for a quaternion algebra over a number field. First the zeta-residue and Poisson calculation gives τ(SL₁(D))=1 and normalized τ(GL₁(D))=1; the reduced norm has image the idèles positive at ramified real places, and weak approximation identifies the resulting quotient with the ordinary idèle-class quotient. The global norm image is proved by choosing a quadratic polynomial of prescribed norm irreducible at every ramified place and using the quadratic embedding criterion. For 1→G_m→GL₁(D)→PGL₁(D)→1, Hilbert 90 gives trivial local and global lifting obstructions. The quotient-volume formula has character index two because Nrd restricted to the scalar G_m is t². Its Jacobian therefore gives τ(PGL₁(D))=2τ(GL₁(D))/τ(G_m)=2. Construct this character-index comparison from Smith normal form, compatible local gauges, the character L-factors and quotient integration; do not infer it from a finite kernel's cardinality.
(Source: Voight, Theorems 29.10.1 and 29.10.20, pp.516–521, and Theorem 29.11.3 and proof, pp.524–525; Main Theorem 14.7.4 and proof, pp.225–227; Sansuc, *Groupe de Brauer et arithmétique des groupes algébriques linéaires sur un corps de nombres*, Proposition 10.4 and proof, pp.74–77, and Corollary 10.5, p.77. The idèle residue is the library's `NumberField.dedekindZeta_residue`; ClassFieldTheory supplies Hilbert 90 and the idèle-class quotient.)

Prove `orthogonalTamagawa_two`: τ(SO(Q))=2 for every nondegenerate quadratic form of rank m≥3 over a number field. Rank three is PGL₁ of the even Clifford quaternion algebra (QuadraticFormInvariants Layer 2). For rank four diagonal Q=Q₃⊕⟨a⟩, apply the rank-five stabilizer comparisons to Q⊕⟨−a⟩≅Q₃⊕H: its nonisotropic stabilizer has form Q and its isotropic stabilizer has residual form Q₃. This identifies both constants with the rank-three value. Higher ranks descend by nonisotropic vectors. The intermediate form may be indefinite; its finite adelic volume comes from AA.3, not positive definiteness.
*Needs:* AA.1–AA.3, 3.3 rank-one Weil operators and fibre measures, quadratic local orbit/isometry theory and Clifford identification from QuadraticFormInvariants Layers 1–2 and 5–6, the quaternion norm comparison just stated, and 1.1 lattice/height bounds.
**Checks.**

- SO₁ is trivial and has Tamagawa number one, so m≥3 is essential; the binary torus also has a different theorem.
- Rank-three anisotropic and split forms give the same constant two. Compactness at the real places does not set the adelic quotient volume to one.
- For Q₄=⟨1,1,1,1⟩ over Q, the auxiliary Q₅=⟨1,1,1,1,−1⟩ has the nonzero isotropic vector (0,0,0,1,1); both reductions give the required comparison. The rank-four form itself has no such rational isotropic vector.

**Completed zeta factors for the mass normalization.** Define `dedekindArchimedeanFactor K s` as Γ_R(s)^r₁ Γ_C(s)^r₂, using Mathlib `Complex.Gammaℝ` and `Complex.Gammaℂ`; the latter includes the factor two. Define `completedDedekindFactor K s` as |disc K|^(s/2) times this factor. Its API includes nonvanishing for Re(s)>0, evaluation at one, and transport under a field isomorphism. Construct `continuedDedekindZeta K` as a meromorphic function agreeing with `NumberField.dedekindZeta K` for Re(s)>1. The library's total L-series definition is not the continuation at negative integers. Its completed product Λ_K satisfies Λ_K(s)=Λ_K(1−s), as an equality of meromorphic functions. Prove the continuation by writing the adelic Mellin integral as its norm≥1 entire part and its Fourier-transformed entire part, plus V φ̂(0)/(s−1)−V φ(0)/s. Poisson supplies the substitution t↦1/t; local Gaussian integrals supply the existing Gamma factors and the different gives |disc K|^(s/2). The completed quadratic character factor for E/K is Λ_E/Λ_K; its discriminant and conductor powers follow from disc(E)=disc(K)²N(d_E/K). Apply these identities and the library's Gamma recurrence/reflection formulas to transform the negative-integer motivic mass factors into the positive-integer ζ_K and ζ_E/ζ_K factors of 3.3.5.
(Source: Poonen, *Tate's thesis*, Theorem 5.7, pp.29–30, Theorem 5.16 with Lemmas 5.18–5.19 and proof, pp.34–37, and Theorem 5.22 with proof, pp.38–39; Gan–Hanke–Yu, Propositions 7.4–7.5, pp.119–120.)
**Checks.**

- For Q the archimedean factor at s=1,2,3 is respectively 1, 1/π, 1/(2π); the discriminant multiplier is one.
- A field with one complex place and no real place has archimedean factor 1/π at s=1. Omitting Γ_C's factor two gives the wrong normalization.
- The continuation has ζ_Q(−1)=−1/12 and ζ_Q(2)=π²/6; positivity of the mass uses the absolute value of the negative-integer product. Substituting the total L-series at −1 does not give this value.

Define `orthogonalArchimedeanConstant r oddRank` by the factorial products in 3.3.5. Prove positivity and γ_odd(r+1)/γ_odd(r)=(2r+1)!/(2π)^(2r+2). Define `orthogonalSkewBasisVolume n` as ∏_(j=2)^n 2π^(j/2)/Γ(j/2), with empty product one, and `orthogonalMassGaugeScale n` as 2^(−floor(n/2)) for odd n and one for even n. Their APIs give the sphere-factor recurrence, positivity, and the comparisons V_(2r+1)=2^r/γ_odd(r), V_(2r)=1/γ_even(r), r≥1 in the even formula.

Prove `compactOrthogonalSkewBasisVolume`: Haar measure on SO(n) induced by the metric in which E_ij−E_ji, i<j, is orthonormal has total volume V_n. For n≥2, g↦ge_n gives the Riemannian submersion SO(n)→S^(n−1). Its horizontal basis maps isometrically to the sphere tangent basis; its fibers carry the same metric as SO(n−1). Integrating in local trivializations gives V_n=area(S^(n−1))V_(n−1). Derive the sphere factor from the radial Gaussian integral and Mathlib's `EuclideanSpace.volume_ball`, then use Gamma recurrence and Γ(1/2)=√π. The base SO(1) is a point. Define the real mass gauge as `orthogonalMassGaugeScale n` times this measure. Thus `compactOrthogonalGaugeVolume` gives 1/γ in odd and even rank. For a positive real form, transport this gauge by an isometry to the standard form; conjugation by any orthogonal isometry preserves it.

Prove `orthogonalPinnedGaugeJacobian`: for Q=Σ_(i=1)^r u_i v_i+w² in odd rank, and Σ_i u_i v_i in even rank, take a primitive cocharacter basis of the split SO torus and the pinned root generators. The reciprocal determinant top differential in this basis, transported by u_i=(e_(2i−1)+ie_(2i))/2 and v_i=(e_(2i−1)−ie_(2i))/2, has real absolute density 2^(−r) in odd rank and one in even rank relative to the skew-orthonormal metric. Each toral direction contributes absolute determinant one, each pair of short-root generators contributes two, and the four long-root directions for each i<j contribute one. There are r short pairs only in odd rank. This proves that the pinned real density has compact volume 1/γ. It is invariant under changing the ordering or signs of the pinning. This is a matrix calculation from ReductiveGroups Layer 9's root maps and cocharacter lattice; the metric and density carriers are DifferentialGeometry 12.1 and 12.4.

The further arithmetic comparison `orthogonalIntegralRealGaugeCompatibility` must compare this pinned real density and the local good-special-model gauges in the globally normalized Tamagawa product, including the motive, discriminant and ramification factors. The real Jacobian does not by itself identify that global product. Its outstanding proof input is the canonical-measure/conductor comparison of Gross–Gan, Proposition 10.7, as used in GHY §2; this is not supplied by the sphere calculation. (GHY §2, pp.102–105, and Proposition 7.4, p.119; Kirschmer2013 §3, pp.3–4.)
**Checks.**

- γ_odd(0)=V_1=1; this empty product supplies no rank-zero Tamagawa formula.
- V_2=2π, V_3=8π², V_4=16π⁴. The mass-gauge scale at n=1,3,4,5 is 1, 1/2, 1, 1/4; its rank-three volume is 4π². Calling the unscaled skew-basis volume 4π² would be false.
- In rank three the ordered columns (H,e_short,f_short), in skew coordinates, form [[−i,0,0],[0,−1,−1],[0,−i,i]] with determinant −2. Replacing H by the coroot 2H gives −4 and the wrong gauge. The four long-root columns have determinant −1. These pin the odd-rank scaling, toral lattice and long-root normalization.
- γ_odd(1)=1/(4π²), γ_odd(2)=6/(2π)⁶, γ_even(2)=1/(2π)⁴. Substituting the odd formula at even rank changes the answer.

3.3.5. Let K be totally real of degree d≥2, Q a totally positive nondegenerate m-dimensional form, m≥3, and Λ the genus of maximal integral O_K-lattices. With ordinary O-isometry mass, r=floor(m/2), G=SO(Q), 2 mass(Λ)=2 γ_G^d |disc K|^(dim G/2) L(G) ∏_p λ_p(Q). Here dim G=r(2r−(−1)^m); γ_G=∏_(i=1)^r(2i−1)!/(2π)^(r(r+1)) for odd m and (r−1)!∏_(i=1)^(r−1)(2i−1)!/(2π)^(r²) for even m. L(G)=∏_(i=1)^r ζ_K(2i) for odd m; ζ_K(r)∏_(i=1)^(r−1)ζ_K(2i) for even m with square discriminant; otherwise [ζ_E(r)/ζ_K(r)] N(d_E/K)^(r−1/2)∏_(i=1)^(r−1)ζ_K(2i), E=K(√disc Q). The local λ_p are `maximalLocalMassFactor` below; they are distinct from the hermitian normalized density polynomial of 3.2.
Maximal integrality is essential. Do not apply this formula to arbitrary lattices or indefinite forms. The leading two multiplies the ordinary O mass; τ(SO)=2, the compatible Tamagawa measures, and the evaluation of the archimedean volume require separate proofs. The preceding targets supply the orthogonal Tamagawa number and completed-zeta conversion; `orthogonalIntegralRealGaugeCompatibility` still requires its arithmetic proof input. The finite exceptional product and convergent positive-integer zeta Euler products are required.
(Source: Kirschmer2013, pp.3–4, Definition 3.1, Proposition 3.2 and Theorem 3.3; Gan–Hanke–Yu, *On an exact mass formula of Shimura*, §6 Tables 3–4, printed pp.115–116, and Propositions 7.4–7.5, pp.119–120.)
*Needs:* 3.3 `genusMass`, 3.3.4, 2.4 `IntegralGenus.localIsometry`.
**Checks.**

- Class number one implies mass=1/|Aut L|; it is not an unweighted class count.
- The formula is restricted to m≥3; binary zeta-at-one substitution is excluded.
- A dyadic exceptional factor is retained rather than set to one.

3.3.6. Prove that in positive rank, for the genus of a totally positive lattice over a number ring, the sum of the proper masses of the proper genera inside its ordinary genus is twice its ordinary mass. The rational group `O(Q)(K)` has two determinant components (a reflection supplies determinant −1). When an ordinary class has an improper integral automorphism it gives one proper class with an index-two proper stabilizer; otherwise it gives two proper classes with unchanged stabilizer. Both cases double its total weight. This comparison concerns the entire ordinary genus; no equality of a single proper genus with that sum is assumed.
(Source: orbit–stabilizer deduction from the `O`/`SO` class sets of Kirschmer §2, p.3, and Gan–Hanke–Yu §7, pp.118–119.) *Needs:* 3.3.1–3.3.3, field reflection generation of QuadraticFormInvariants Layer 1.
**Checks.**

- The positive rank-one ordinary class has stabilizer order 2 and mass 1/2; its proper mass is 1.
- If an ordinary stabilizer has order 4 and has no improper automorphism, its two proper classes contribute 1/4+1/4=1/2.
- In rank zero `O=SO` is trivial, so both masses are 1 and the doubling formula is excluded.

Define `MaximalMassLocalType` (3.3.7) with cases `zero`, `I`, `IIPlus`, `IIMinus`, `II`, `IIIPlus`, `IIIMinus`. For a characteristic-zero nonarchimedean local field, rank `m≥3`, and diagonal form with coefficients `a_i`, use the **signed** discriminant `d_Q=(−1)^{m(m−1)/2}∏a_i` and Hasse invariant `c=∏_{i<j}(a_i,a_j)`. Its Witt sign is `ω=c` for `m≡1,2 (mod 8)`, `c(−1,−1)` for `m≡5,6`, `c(−1,d_Q)` for `m≡0,3`, and `c(−1,−d_Q)` for `m≡4,7`. For odd rank the nonzero types are `I` when `v(d_Q)` is even and `ω=−1`, and `IIPlus` or `IIMinus` when `v(d_Q)` is odd, according to `ω`. For even rank they are `I` when `d_Q` is square and `ω=−1`; `II` when the nonsquare discriminant extension is unramified and `ω=−1`; and `IIIPlus` or `IIIMinus` when that extension is ramified, according to `ω`. All other cases have type `zero`. This classification includes dyadic fields; it does not extend the characteristic-zero table to equal characteristic two.
Its API is `MaximalMassLocalType` names the table cases; `maximalMassWittSign` implements the rank-mod-eight conversion; `maximalMassLocalType` selects a case from rank, valuation parity, square class, ramification and Witt sign, and `maximalMassLocalType_basisChange` proves that a basis change preserves it.
(Source: Kirschmer §2, equation (1) and Table 1, pp.2–3; Gan–Hanke–Yu §6, pp.114–116.) *Needs:* 2.1 field invariants, local Hilbert symbols and quadratic-extension ramification from QuadraticFormInvariants Layers 5–6.
**Checks.**

- `⟨1,1⟩` has determinant 1 but signed discriminant −1; the split plane `⟨1,−1⟩` has signed discriminant 1.
- At odd rank and odd discriminant valuation the signs +1 and −1 select different `II` cases; at even valuation the positive sign has type `zero`.
- At even rank a ramified nonsquare discriminant has a `III` type for either sign, including residue characteristic 2; its local factor is not 1.

Define `orthogonalLocalVolumeRatio q NH NG orderH orderG` as (q^(−NH)orderH)/(q^(−NG)orderG) in Q. The normalized reductive quotient orders above give λ, and the canonical local stabilizer volume is its reciprocal. Its API is positivity and the self-ratio identity with q>1 and both orders positive; it also respects an isomorphism of either finite reductive quotient. The total arithmetic expression returns zero at orderG=0, outside the group hypotheses. A zero quotient order is never used in a volume theorem. (Source: Gan–Hanke–Yu, §2, equations (2.6)–(2.13), pp.104–105.)

**Checks.**

- The good split rank-three quotient at q=3 has N=1 and order 24 on both sides; the ratio is one.
- For the anisotropic rank-three quotient at q=3, NG=0 and orderG=4; against NH=1 and orderH=24, the ratio is two, so the stabilizer volume is 1/2.
- The corresponding numerical q=2 ratio with orders 6 and 3 is one. This checks the arithmetic expression; it does not assign an arbitrary dyadic lattice this quotient type.
- A zero denominator order gives zero in the total Lean adapter and fails the positive-order volume hypotheses. Omitting that guard would produce a false positivity theorem.

**Smooth maximal orthogonal stabilizers.** For a characteristic-zero complete discretely valued field F with finite residue field k of cardinality q≥2, a nondegenerate quadratic space (V,Q) of rank m≥3, and a maximal integral lattice Λ, construct `smoothMaximalOrthogonalModel`. Its generic fibre is SO(Q); its integral points are exactly the SO(F)-stabilizer of Λ. Construct its special fibre, unipotent radical, and maximal reductive quotient `maximalOrthogonalReductiveQuotient`, retaining the component group. Prove that the standard-representation closure in GL(Λ) gives this smooth model except when the residue characteristic is 2, m is even, and the discriminant extension is ramified. In that case the special fibre has two components, and its identity component is the closure in GL(A²⊕Λ) of the enlarged representation below. These are affine group schemes with their actual coordinate Hopf algebras, not just groups of A-points. Construct their morphisms under unramified scalar extension and the identification of the generic fibre. Smoothness, integral points, reduction surjectivity, component group, and the reductive-quotient table are separate API targets `smoothMaximalOrthogonalModel_smooth`, `_integralPoints`, `_reduction_surjective`, `_components`, and `maximalOrthogonalReductiveQuotient_type`.
(Source: Gan–Hanke–Yu, Proposition 6.12 and Remarks, p.116; Proposition 6.15, pp.117–118; Tables 3–4, pp.115–116. Use ReductiveGroupsPartII RG2.3.1 and RG2.3.3 for the general smooth affine/parahoric model, special-fibre quotient and schematic closure. The specialization is the lattice-specific closure argument of Gan–Hanke–Yu; Bruhat–Tits II 4.6.2 and 4.6.7, pp.124–127, identify the model, integral points and reduction.)
**Checks.**

- In odd rank 3, split good reduction has reductive quotient SO₃; at q=2 its group of rational points has order 6, and the good factor is 1.
- In even rank 4, ramified discriminant at a dyadic place gives a two-component quotient of type (Z/2)×SO₃; discarding the components doubles its factor from 1/2 to 1.
- The naive determinant-one quadratic-preserving equations and the smooth model have the same integral points but need not have the same points modulo π; counting their first residue fibres is not interchangeable.

**Enlarged dyadic representation and congruence subgroups.** In the exceptional case write V=H^(r−1)⊕E and Λ=H_A^(r−1)⊕A_E, with E/F ramified quadratic. Let d be the different exponent. Choose h≥h′ with h+h′=d and h−h′ either 0 or 1, and a basis (e_r,f_r) with polar-dual lattice Λ̃=H_A^(r−1)⊕Aπ^(−h)e_r⊕Aπ^(−h′)f_r. For the block matrix M(g) on V and N=diag(π^(−h),π^(−h′)), define `dyadicEnlargedRepresentation` by the three-block matrix [[I₂,0,0],[M₁₂N,M₁₁,M₁₂],[(M₂₂−I₂)N,M₂₁,M₂₂]]. Prove it is a faithful rational representation, identify its smooth identity-component closure, and prove `smoothOrthogonalCongruenceKernel`: for every integer a>0 the reduction kernel is {g:(g−1)Λ̃⊆π^aΛ} in the exceptional case and {g:(g−1)Λ⊆π^aΛ} otherwise. These formulas use the quadratic polar pairing defining Λ̃, without replacing it by a half pairing over A. The API evaluates identity and multiplication, changes the chosen adapted basis by integral conjugation, and compares the two congruence conditions when Λ̃=Λ.
(Source: Gan–Hanke–Yu equations (6.13)–(6.16), pp.117–118, and Proposition 6.17 with proof, p.118.)
**Checks.**

- At g=1 every off-diagonal block is zero and the enlarged matrix is the identity of dimension m+2.
- For different exponent d=3, the two exponents are h=2,h′=1. At π=2 the diagonal entries of N are 1/4 and 1/2, so using equal exponents gives the wrong representation.
- On A=Z₂, Λ=A, Λ̃=(1/2)A, the endomorphism g−1=2 maps Λ into 2Λ but does not map Λ̃ into 2Λ. The two congruence conditions differ even at a=1; this calculation tests the conditions, without claiming g is an orthogonal automorphism of a rank-one lattice.

**Reductive-quotient orders and canonical local volume.** Prove `finiteOrthogonalOrder`: for the nonsingular split and nonsplit quadratic groups over F_q, |SO_(2r)^±(F_q)|=q^(r(r−1))(q^r∓1)∏_(i=1)^(r−1)(q^(2i)−1), r≥1. For odd dimension 2r+1, the reductive group of type B_r has order q^(r²)∏_(i=1)^r(q^(2i)−1); in characteristic 2 use its reductive orthogonal realization, rather than imposing a nondegenerate alternating polar form in odd dimension. Retain the orders of the disconnected O-factors in Tables 3–4. Define `orthogonalLocalVolumeRatio` as q^(−N(H⁰))|H⁰(k)| divided by q^(−N(Ḡ))|Ḡ(k)|, where H⁰ is the good special quotient of the quasi-split inner form, Ḡ is the entire maximal-lattice reductive quotient, and N counts positive roots of the identity component. Its API proves positivity, good value 1, unramified-extension compatibility, and identification with `maximalLocalMassFactor`. Prove the measure comparison `orthogonalCanonicalLocalVolume`: let ω_H be a top differential nonzero modulo the uniformizer on the smooth good special model of the quasi-split inner form, and transport it to the canonical inner-form gauge |ω_v|. If ν_v is instead nonzero on the smooth Iwahori model, then |ω_v|=q^(−N(H⁰))|ν_v|. Define μ_v=L_v(M_G^∨(1))|ω_v|. For the maximal-lattice stabilizer K_v, prove μ_v(K_v)=1/λ_v. The local motive identity is L_v(M_G^∨(1))^(−1)=q^(−dim H⁰)|H⁰(k)|. Count Iwahori reduction, multiply by its index in K_v and by q^(−N(H⁰)); the unipotent dimensions cancel to leave this ratio. Identifying ω_v with ν_v would omit that last factor. No smoothness of the naive orthogonal equations is used. (GHY §2, equations (2.6)–(2.13), pp.104–105.)
(Source: Gan–Hanke–Yu §2, equations (2.7)–(2.12), pp.104–105, and Tables 3–4, pp.115–116; their proof derives the required local measure formula from the smooth parahoric model.)
**Checks.**

- At q=2, SO₄⁺ has order 36 and SO₄⁻ has order 60; swapping the discriminant signs changes the quotient count.
- The total even-order polynomial at r=0 returns 0 in its split branch and 2 in its nonsplit branch; these are outside its r≥1 group interpretation. SO₀ itself is trivial. At q=1 the odd rank-three polynomial returns zero, and q=1 is not a residue-field cardinality.
- At q=3, the two binary full orthogonal groups have orders 4 and 8; their special groups have orders 2 and 4. Retaining the full component group is necessary.
- At q=2,r=1, an odd nonsplit unit-discriminant case has λ=1/2 and μ_v(K_v)=2. The exceptional even ramified case has λ=1/2 as well; a local volume need not be bounded by 1.

3.3.8. Define the rational function `maximalLocalMassFactor(q,r,odd,t)` for residue cardinality `q≥2`, rank `2r+1≥3` when `odd`, and rank `2r≥4` otherwise. Type `zero` gives 1. For odd rank, type `I` gives `(q^{2r}−1)/(2(q+1))`, and type `IIPlus` or `IIMinus` gives `(q^r±1)/2`. For even rank, type `I` gives `(q^{r−1}−1)(q^r−1)/(2(q+1))`, type `II` gives `(q^{r−1}+1)(q^r+1)/(2(q+1))`, and either `III` type gives `1/2`. The function is used only with the compatible types of 3.3.7. The only denominators are 2 and `2(q+1)`, which are nonzero in ℚ.
Its API is `maximalLocalMassFactor` evaluates the rational table; `maximalLocalMassFactor_zero` is its good-place value; `maximalLocalMassFactor_odd_I`, `maximalLocalMassFactor_even_II`, and `maximalLocalMassFactor_even_III` pin the exceptional factors. The local comparison identifies these factors with the reductive-quotient factors of the smooth integral stabilizer model, including its component group. Use `smoothMaximalOrthogonalModel`, `maximalOrthogonalReductiveQuotient_type`, `finiteOrthogonalOrder` and `orthogonalCanonicalLocalVolume` to prove this comparison.
(Source: Kirschmer Definition 3.1, p.4; Gan–Hanke–Yu Tables 3–4, pp.115–116, Proposition 6.12 and its remarks, p.116.) *Needs:* 3.3.7, finite reductive-group orders and smooth integral stabilizer models.
**Checks.**

- At `q=2,r=1`, odd types `I`, `IIPlus`, `IIMinus` give respectively `1/2,3/2,1/2`.
- At `q=3,r=2`, even types `I`, `II`, `IIIPlus` give respectively `2,5,1/2`.
- Good type `zero` gives 1 at `q=2`; ramified even type `IIIMinus` gives `1/2`, so dyadic factors cannot all be dropped.

### 3.4 Theta series and their coefficients

Define `latticeThetaSeries` (3.4.1): for a positive definite integral lattice `L` (the Completed IntegralLattices carrier: a full ℤ-submodule of a rational space with a symmetric rational form `B` that is integral on `L`), define `latticeThetaSeries L τ = Σ_{x ∈ L} exp(π i τ B(x,x))` for `τ` in the upper half-plane, and prove that the sum converges absolutely and locally uniformly, so that it is holomorphic; and that, writing `q = exp(π i τ)`, the coefficient of `q^m` is the representation number `r_L(m) = #{x ∈ L : B(x,x) = m}` (Tau Ceti `IntegralLattice.representationNumber`), which is finite by 1.2.2. Use `latticeThetaSeries_gaussian` to identify the summand with exp(−πt‖e(x)‖²) at τ=it, for the real scalar-extension embedding e with ‖e(x)‖²=B(x,x). The positive Gram form constructs that metric; finite-dimensional norm equivalence bounds all derivatives on compact subsets of Im τ>0 by a polynomial times a Gaussian. For Gaussian summability, disjoint open balls of radius half the first positive lattice minimum give the number of vectors `x∈L` with `‖x‖≤R`≤C(1+R)^d by comparing their union with one ambient ball. Splitting into integer norm shells then dominates each differentiated summand by a polynomial times exp(−c j²), uniformly when Im τ is bounded below by a positive constant. Termwise complex differentiation gives local uniform convergence and holomorphy. This uses the real trace metric, the first minimum and ball volumes from Layers 0–1; it precedes the Gaussian transference API of Layer 4. Integral-norm fibers are finite by the bounded-norm supplier and regrouping the absolutely convergent sum gives the coefficient identity. In rank zero the sole vector is zero. For an even lattice the series is a power series in `exp(2π i τ)` with coefficient `#{x : B(x,x)/2 = m}` at `m`. Modularity of the series is not stated in this roadmap.
Positive definiteness is essential: for an indefinite or negative definite form the series diverges. An odd lattice has half-norms in `½ℤ`, so the `exp(2π i τ)`-expansion convention applies only to even lattices.
Its API is `latticeThetaSeries_summable` (convergence: absolute, locally uniform summability on the upper half-plane); `latticeThetaSeries_coeff` (the coefficient of `q^m` is `r_L(m)`); `latticeThetaSeries_directSum` (`Θ_{L ⊕ M} = Θ_L · Θ_M`); `latticeThetaSeries_rescale` (`Θ_{L(a)}(τ) = Θ_L(aτ)` for an integer `a > 0`); `latticeThetaSeries_coeff_even` (the even-lattice expansion in `exp(2π i τ)`).
(Source: Duke 1988, printed p.74; the unweighted analytic specialization is the Gaussian argument just described, using 4.4.5–6 and native integral forms.)
*Needs:* Completed IntegralLattices Layer 1, Tau Ceti `IntegralLattice.representationNumber` (IntegralLattices milestone 2B), 1.2 `finiteGaugeSublevel`, the positive first minimum of 1.2, the real metric comparison of 3.3 and Mathlib ball-volume scaling.
**Checks.**

- For `L = ℤ` with `B(x,y) = xy` the coefficient of `q` is `2`, of `q²` and `q³` is `0`, and of `q⁴` is `2`.
- For `L = ℤ²` with the standard form the coefficient of `q` is `4` and of `q²` is `4`.
- The rank-zero lattice has theta series `1`.
- For `L = ℤ` with `B(x,y) = xy`, the half-norm of `1` is `½`, so the series is not a power series in `exp(2π i τ)`; the even convention does not apply.

### Examples

Over `𝔽_{q²}/𝔽_q` the embedding count of the zero rank-one source into an anisotropic rank-one target is `0`, while its representation count is `1`. For a rank-one hermitian lattice of valuation `a` the Siegel polynomial is `Σ_{i=0}^{a} (−X)^i`, and a self-dual lattice has polynomial `1`. The norm form `x² + y² = 3` over the unramified quadratic extension of `ℚ₃` has one solution modulo `3` and none modulo `9`: initial finite levels can be nonempty while the density is `0`. The square lattice `ℤ²` has four proper isometries, so its single proper class contributes `1/4` to the proper mass.

### Dependencies

Layers 1 and 2; AdelicAlgebraicGroups AA.2 (quotient and Tamagawa measures) and AA.3 (reduction and finite volume); the existing ℤ-lattice supplier contracts in the boundaries section; Mathlib `ZMod`, `Nat.card`, the finite-quotient and Haar-measure API.

## Layer 4: Lattice points, star bodies and homogeneous dynamics

This layer has four independent branches. Lattice-point counting (4.1) proves Henk’s bound `#(L ∩ K) < 2^{d−1} ∏ (⌊2/λ_i⌋ + 1)` through the sublattice and first-minimum bounds, and states Davenport’s multiset estimate for bounded semialgebraic regions with its uniform constant. Homogeneous dynamics (4.2–4.3) states, with their exact hypotheses, Howe–Moore decay of matrix coefficients, ergodicity of noncompact subgroup actions, Dani–Margulis nondivergence, Ratner’s orbit-closure, measure-classification and equidistribution theorems, and the two arithmetic applications: Margulis’s theorem on values of irrational indefinite forms and Duke’s equidistribution of lattice points on spheres. Packing, covering and transference (4.4) go through the Gaussian-sum argument of Regev’s lecture, with the lattice Poisson summation it needs stated as a target; star bodies, critical determinants, the existence of critical lattices and Mahler’s compactness criterion are 4.5; Siegel’s mean value theorem is 4.6; the real-metric form of Construction A is 4.7.

### 4.1 Lattice-point counting

For 4.1.11, 4.1.12: E is a finite-dimensional real normed inner-product space, L a discrete full Z-submodule, and d=dim_R E. Reuse IsZLattice, Basis and Basis.flag. The minimum index i:Fin d is zero-based; dimension zero has no index. K is a ConvexBody with zero in its interior. Write λ_i=successiveMin L K i. Symmetry is imposed only on the final counting theorem.

Prove `ncard_le_index_mul` (4.1.1): for an additive commutative group G, finite-index subgroup N, sets S,T⊆G with T finite, suppose x,y∈S and x−y∈N imply x−y∈T. Then S is bounded in cardinality by |S|≤[G:N]·|T|, with both cardinalities the natural cardinal. No finiteness assumption on S is needed: the proof injects it into a finite set.
N has finite index; T is finite. No topology, convexity, lattice, or prior finiteness of S is required.
(Source: Henk2002, §2, Lemma 2.1 proof, p.4.)
*Needs:* Mathlib `Subgroup.index`, `AddSubgroup.FiniteIndex`, `Subgroup.finite_quotient_of_finiteIndex`, `QuotientGroup.eq_iff_div_mem`, `Nat.card_le_card_of_injective`, `Nat.card_prod`, `Nat.card_coe_set_eq`.
**Checks.**

- The empty subset of Z has natural cardinal zero.
- For N={0} in Z, N.index=0 but |{0}|=1; finite-index hypotheses are essential.

Prove `henk_sublattice_count` (4.1.2): let E be a finite-dimensional real normed space, L a discrete full integral lattice, M≤L a submodule with nonzero finite relative index m=[L:M], and K a symmetric convex body with 0 in its interior. Then |L∩K|≤m·|M∩2K|. Counts include boundary points and the origin. In real inner-product coordinates with canonical volume and full M, the already-built index/covolume formula identifies m=covol(M)/covol(L), exactly as in Henk Lemma 2.1.
L is discrete and full; M≤L; M.toAddSubgroup.relIndex(L.toAddSubgroup)≠0. K is compact convex, 0∈interior K, and x∈K implies −x∈K. Dimension zero is allowed.
(Source: Henk2002, §2, Lemma 2.1 and its complete proof, p.4.)
*Needs:* Mathlib `Subgroup.relIndex`, `Set.ncard_image_of_injective`, `Convex.midpoint_mem`, `ConvexBody.convex`, `gauge_le_of_mem`, `ZLattice.covolume_div_covolume_eq_relIndex'`, `ZLattice.covolume_pos`, 4.1 `ncard_le_index_mul`, 1.2 `finite_gauge_sublevel`.
**Checks.**

- The set {−1,0,1} has three elements, {−2,0,2} has three elements, and 3≤2·3.
- The singleton consisting of the zero function Fin 0→Z has cardinal one.

Prove `ncard_le_pow_of_no_congruent` (4.1.3): let G be an additive commutative group with an integral basis b indexed by Fin n, let q≥1 be a natural number, and let S⊆G. Suppose x,y∈S and x−y=qz for some z∈G imply x=y. Then |S|≤q^n. The basis is an integral basis of all G, not merely an independent family; n=0 is included.
b:Basis(Fin n,Z,G); q is a positive natural number. Separation is modulo qG. No topology or prior finiteness of S is required.
(Source: Henk2002, §2, p.4, inequality (1.3) deduction after Lemma 2.1.)
*Needs:* Mathlib `AddSubgroup.index_range_nsmul`, `Module.finrank_eq_card_basis`, 4.1 `ncard_le_index_mul`.
**Checks.**

- The residue images of −1,0,1 in ZMod 3 have cardinal three.
- In ZMod 2 the integers 0 and 2 have equal residue, although they differ in Z.
- Nat.card(ZMod 0)=0; this does not make ZMod 0 finite.

Prove `homothetic_lattice_avoidance` (4.1.4): for a discrete full integral lattice L in finite-dimensional real normed E, a convex body K with 0 in its interior, d=dim E>0, and q≥1 natural with 2/q<λ_0(L,K), one has (qL)∩2K={0}. Here qL is the pointwise real scalar image of the lattice set. Symmetry is not needed for this lemma.
d>0, q>0, and the threshold is strict: 2/q<λ_0. L is discrete/full and K has zero in its interior.
(Source: Henk2002, §2, p.4, inequality (1.3) deduction after Lemma 2.1.)
*Needs:* 1.2 `successiveMin_first_le_iff`.
**Checks.**

- An integer divisible by 3 with absolute value at most 2 is zero.
- 2 is nonzero, divisible by 2, and has absolute value at most 2; also 2/2=1.

Prove `lattice_count_le_first_minimum` (4.1.5): for a discrete full integral lattice L in finite-dimensional real normed E of positive dimension d and a symmetric convex body K with 0 in its interior, |L∩K|≤(floor(2/λ_0(L,K))+1)^d. The floor is the natural floor of the positive real argument; λ_0 is the source's first minimum. Counts include closed boundary points. This is Henk (1.3), not Conjecture 1.4 and not the stronger Theorem 1.5.
d>0; L discrete/full; K compact convex symmetric about zero with 0 in its interior.
(Source: Henk2002, p.2, inequality (1.3); §2 p.4, its complete deduction after Lemma 2.1.)
*Needs:* Mathlib `Module.finBasisOfFinrankEq`, `ZLattice.rank`, `instModuleFinite_of_discrete_submodule`, `instModuleFree_of_discrete_submodule`, `Nat.lt_floor_add_one`, `Convex.midpoint_mem`, `ConvexBody.convex`, `Set.ncard_image_of_injective`, 4.1 `ncard_le_pow_of_no_congruent`, 4.1 `homothetic_lattice_avoidance`, 1.2 `successiveMin_pos`.
**Checks.**

- The product {−1,0,1}×{−1,0,1} has cardinal nine, equal to (floor(2/1)+1)^2.
- For λ_0=3 the factor floor(2/λ_0)+1 is one.
- For minima 1/2 and 3, the first-minimum square bound is 25 while the last-minimum substitution gives 1<5.

Prove `divisible_rounding_step` (4.1.6): for positive naturals q,m with m<2q, let n=m if q≤m and n=q+m−(q mod m) otherwise. Then q≤n<2q and m divides n.
Subtraction is natural. Even when the remainder is zero the second branch advances to the next multiple; no least-multiple claim.
(Source: Henk2002, p.4, two-case construction after (2.4).)
**Checks.**

- q=5,m=6 gives n=6.
- q=6,m=3 gives n=9, not 6; it still satisfies the strict upper bound.

Prove `exists_divisible_rounding` (4.1.7): for any positive antitone q:Fin d→N there exists n with q_i≤n_i, n_i=q_i at the final index, n_i<2q_i at earlier indices, and n_j dividing n_i whenever i≤j.
The empty family is allowed. Antitone means q_j≤q_i for i≤j. Positivity of n follows from q_i≤n_i.
(Source: Henk2002, p.4, (2.4) and backward induction.)
*Needs:* 4.1 `divisible_rounding_step`.
**Checks.**

- q=(7,5,3) gives n=(12,6,3), with 3|6|12 and both earlier factors strictly below twice q.
- The empty factor product is one.

Prove `divisible_rounding_product` (4.1.8): for d≥2, positive q, n_i≥q_i, final n_i=q_i and earlier n_i<2q_i imply ∏n_i<2^(d−1)∏q_i.
Products are natural. This consequence needs no divisibility assumption.
(Source: Henk2002, pp.4–5, (2.4)–(2.5).)
*Needs:* Mathlib `Finset.prod_lt_prod`.
**Checks.**

- 12·6·3=216<2²·7·5·3=420.
- For d=1,q=n=3 the strict assertion would be 3<3 and is false.

Prove `mem_diagonal_span_iff` (4.1.9): for an integral basis b:Fin d→G of an additive commutative group, x∈span_Z{n_i b_i} if and only if each n_i divides the integral coordinate b.repr(x)_i.
The n_i are arbitrary naturals, including zero; use the Submodule.span and integral module structure.
(Source: Henk2002, pp.4–5, lattice generated by n_i e_i.)
*Needs:* Mathlib `Module.Basis.sum_repr`.
**Checks.**

- Coordinates (4,6) satisfy divisibility by (2,3), while 3 is not divisible by 2.
- Zero divides an integer z exactly when z=0.

Prove `diagonal_span_index` (4.1.10): The additive index of span_Z{n_i b_i} in the finite free integral module with basis b is ∏n_i.
The n_i are arbitrary naturals. A zero factor gives infinite index and the index sentinel zero; all-positive factors give nonzero finite index. The empty product is one.
(Source: Henk2002, p.4, determinant ratio of the diagonal sublattice.)
*Needs:* Mathlib `Module.Basis.equivFun`, `Subgroup.index_map_equiv`, `Subgroup.index_pi`, `Int.index_zmultiples`, 4.1 `mem_diagonal_span_iff`.
**Checks.**

- 2Z×3Z has index six.
- 2Z×{0} has natural index zero, not a positive finite cardinality.

Prove `diagonal_lattice_avoidance` (4.1.11): Given an integral basis with the strict minimum-flag property, positive n_i with n_j|n_i for i≤j and 2/n_i<λ_i, every point of span_Z{n_i b_i}∩2K is zero.
The exact flag hypothesis is the conclusion of integral-minimum-flag. Symmetry is unnecessary here.
(Source: Henk2002, p.5, largest nonzero coordinate argument after (2.5).)
*Needs:* Mathlib `Module.Basis.sum_repr`, `Module.Basis.mem_flag_iff_repr_eq_zero`, `Module.Basis.ofZLatticeBasis_repr_apply`, `gauge_le_of_mem`, 4.1 `mem_diagonal_span_iff`.
**Checks.**

- No integer equals 2/3; division by the last factor is not integral without the divisibility condition.
- For Z and K=[−1,1], n=2 leaves the point 2 in nZ∩2K at the equality 2/n=λ_0=1.

Prove `lattice_count_lt_successive_minima` (4.1.12): for d≥2 and centrally symmetric K, |L∩K|<2^(d−1)∏_{i<d}(floor(2/λ_i)+1). The count includes the origin and all boundary points.
Floor means the greatest integer at most the input. This is Theorem 1.5, not Conjecture 1.4.
(Source: Henk2002, pp.3–5, Theorem 1.5 and (2.1)–(2.5).)
*Needs:* Mathlib `Nat.floor_mono`, `Nat.lt_floor_add_one`, `Subgroup.relIndex`, 1.2 `exists_integral_minimum_flag`, 1.2 `successiveMin_pos`, 1.2 `successiveMin_monotone`, 4.1 `exists_divisible_rounding`, 4.1 `divisible_rounding_product`, 4.1 `diagonal_span_index`, 4.1 `diagonal_lattice_avoidance`, 4.1 `henk_sublattice_count`.
**Checks.**

- For the standard unit square the nine points satisfy 9<2·3·3=18.
- A rectangle with minima (1,3) has three points and gives 3<2·3·1=6; its product factor 3 is below the first-minimum square factor 9.

Define `SemialgebraicMultiset n m k ell` by a multiplicity function μ:Rⁿ→N, bounded support, μ≤m, and a bounded-format witness for every superlevel {x:j≤μ(x)}, 1≤j≤m. Each witness is a Boolean combination of at most k polynomial sign conditions of degree at most ell. Use RealAlgebraicGeometry's `IsSemialgebraic`, sign formulas, and cylindrical decomposition; this bounded-format record adds quantitative hypotheses, not another semialgebraic-set predicate. The API includes support, superlevel sets, measurability, finite lattice support, restriction, and transport by an invertible real linear map with explicit new format bounds. Define `multisetLatticeCount μ` as Σ_{z∈Zⁿ}μ(z), and `multisetVolume μ` as ∫μ. Their APIs are additivity, decomposition as the finite sum of superlevel counts/volumes, and volume invariance under determinant-one transport. Finiteness and integrability follow from the stated bounds; the total `tsum`/integral formulas are used only after these hypotheses have been discharged.
(Source: Bhargava–Shankar, Proposition 2.5, physical p.14; the explicit superlevel format is the consumer contract for its multiset adaptation.)
**Checks.**

- For μ twice the indicator of [0,N], N a nonnegative integer, count=2(N+1) and volume=2N. All positive superlevels need a format witness, not just support.
- Empty multiplicity has count and volume zero; m=0 admits only this case.
- The indicator of {0,2} in R has count two and volume zero. A format bound that discards isolated cells cannot prove the estimate.

Prove `semialgebraic_uniform_fiber_components`: for fixed n,k,ell there is H such that every coordinate projection of a set with this format meets every axis-parallel line in at most H intervals or isolated points. Projection closure and the uniform bound on cylindrical cells come from RealAlgebraicGeometry Layers 2–6. This is the corrected condition used by Davenport, rather than the false assertion that each projection is defined by a conjunction of a bounded number of polynomial inequalities.
(Source: Davenport's 1964 corrigendum, p.580, correcting the remark after his 1951 theorem on p.180; Rogers, *The reduction of star sets*, Theorem 9, pp.59–93, is the original projection-cell input. Here the existing cylindrical-decomposition supplier supplies that input.)
4.1.13. Prove `davenport_fiber_estimate`: for a closed bounded set in Rⁿ, n≥1, satisfying this bound with H≥1 on the set and all proper coordinate projections, its integer count differs from volume by at most Σ_(j=0)^(n−1) H^(n−j)V_j, where V_j is the sum of the j-dimensional coordinate-projection volumes and V_0=1. The closed bounded version is Davenport's theorem, p.180; the semialgebraic variant also admits open endpoints by the same one-dimensional estimate and measurable-cell decomposition. This gives C(n,H) times max(1, all proper coordinate-projection volumes). Induct on n by first applying the (n−1)-dimensional estimate to slices and integrating the remaining coordinate. Separately replace integration in that coordinate by summation, with error at most H times the indicator of the projection onto the remaining coordinates; apply induction to that projected indicator. Adding the two estimates supplies every proper coordinate subset with weight H^(n−j), as in the two error terms of §3, pp.182–183. All sums have bounded support and Fubini applies to the measurable indicators. This avoids a variation bound on moving fiber endpoints, which the hypotheses do not give. The base case counts endpoints and isolated intervals. The same induction with the last coordinate translated by a linear function of the previous coordinates proves the upper-triangular shear variant; reverse coordinate order for lower-triangular shears. The component bound is uniform over these translated fibers, while the projection terms are those of the original set. Iterating the shear argument uses the original coordinate flag, not volumes of arbitrarily transformed projections. Summing over the m superlevels proves the target: for n≥1 and triangular unipotent A,
|multisetLatticeCount(μ∘A⁻¹)−multisetVolume μ|≤C(n,m,k,ell)max(1,max_{0<d<n}vol_d(proj_d support μ)).
The n=1 projection maximum is empty and uses 1. Sup-level projections lie in support projections, giving the displayed bound. General linear images require a different projection statement.
(Source: Davenport 1951, theorem and induction, pp.179–183, with his 1964 correction; Bhargava–Shankar Proposition 2.5, physical p.14, for the triangular multiset formulation.)
**Checks.**

- For [0,N], count−length=1, including N=0. A volume-only error bound fails on this singleton.
- On the unit square with integral shear (x,y)↦(x,y+Mx), the count is four and the original one-dimensional projections both have length one for every integer M. A shear-dependent constant is unnecessary.
- Arbitrarily many isolated points violate a fixed format/component bound even though their volume is zero. The theorem excludes boundedness as its only hypothesis.

### 4.2 Mixing, ergodicity and unipotent flows

**Strongly continuous Hilbert representations.** Use Mathlib `ContRepresentation ℂ G H`, with H a complete complex inner-product space, and `ContRepresentation.invariants`. Reuse CompactGroups `IsUnitary` (its inner-product-preservation formula needs neither compactness nor finite dimension). Add `StronglyContinuous`: for every v, g↦π(g)v is continuous. The pinned `ContRepresentation` bundles continuity of each operator, not continuity in g. The matrix coefficient is CompactGroups `matrixCoeff` with this additional continuity proof; its evaluation remains ⟪π(g)v,w⟫. Prove `stronglyContinuous_joint` (unitarity upgrades strong to joint continuity), `matrixCoeff_continuous`, `matrixCoeff_bound` (absolute value at most ‖v‖‖w‖), and `invariants_closed`. No finite-dimensional hypothesis is used. The coefficient order follows Mathlib's conjugate-linear first variable.
(Source: Ciobotaru, *A unified proof of the Howe–Moore property*, Definition 2.2, Lemma 2.4 and Remark 2.3, pp.3–4; CompactGroups Layers 1 and 3 supply the reused predicate and coefficient.)
**Checks.**

- The identity representation on any Hilbert space is strongly continuous; its coefficient is constant and a nonzero vector is invariant.
- On the zero Hilbert space every coefficient is zero; absence of nonzero invariants holds without a nonzero-space hypothesis.
- The character t↦exp(it) on the additive real group has coefficient exp(−it) at v=w=1 under the stated order. Its norm is one; being unitary alone does not imply decay. A discontinuous character would fail strong continuity.

**Contraction subgroups and weak limits.** Define `contractionSubgroup a` by u∈U_a⁺ iff a_j⁻¹ua_j→1, and `oppositeContractionSubgroup a` by a_jua_j⁻¹→1. These are subgroups; use their closures when fixed vectors are asserted. Prove `contraction_fixed_weak_limit`: a weak limit of π(a_j)v is fixed by the closure of U_a⁺. Prove `commuting_unitary_weak_limit`: on a separable H, a sequence of commuting unitary operators has a weak-operator convergent subsequence, and the limiting contraction is normal. Construct this topology from the evaluations (T,v,w)↦⟪Tv,w⟫, using Banach–Alaoglu and a countable dense vector set, rather than claiming operator-norm compactness. Prove `contraction_generation_decay`: if a_j commute, escape compact sets, and the closed group generated by U_a⁺ and U_a⁻ is G, then all coefficients along a_j tend to zero when π has no nonzero invariant. Mautner gives π(U_a⁺)E=E=Eπ(U_a⁻); normality makes E*E=EE*, whose nonzero range would supply an invariant vector.
(Source: Ciobotaru Definition 2.11, Lemmas 2.12–2.13 and 3.1, pp.6–8. Banach–Alaoglu is Mathlib `WeakDual.isCompact_closedBall`; the operator topology and diagonal argument are the owned adapter.)
The API is `contractionSubgroup_mem`, `contractionSubgroup_inv`, and `oppositeContractionSubgroup_eq` (replace a_j by a_j⁻¹); the closure acts trivially on the weak-limit vector.
**Checks.**

- For the constant sequence a_j=1 in a Hausdorff group, both contraction subgroups are trivial.
- In SL₂(R), a_j=diag(e^j,e^(−j)) contracts upper unipotents under a_j⁻¹ua_j; the opposite convention contracts lower unipotents.
- In an abelian Hausdorff group both subgroups are trivial, even for an escaping sequence. Thus escape by itself does not supply the generation hypothesis.

**Cartan reduction to coefficient decay.** Prove `cartan_coefficient_reduction`: for G=K₁A⁺K₂ with compact K₁,K₂, coefficient decay along every escaping sequence in A⁺ implies decay on G. Strong continuity lets the compact factors' vectors converge in norm. Prove `simple_cartan_contraction_generation`: for a connected noncompact almost-simple real group with finite centre, every escaping sequence in A⁺ has a subsequence whose positive and negative contraction groups generate a dense subgroup of G. Import Cartan/KAK, restricted roots and root subgroups from LieGroups Layer 9, not just Layer 2. Pass to a subsequence on which each restricted root either stays bounded or tends to infinity; escaping gives a nonempty root direction. The two contractions generate a nontrivial normal connected subgroup, and almost simplicity makes it G. A constant identity sequence is excluded. For arbitrary H, restrict to the separable invariant Hilbert space generated by the two tested vectors; second countability makes their orbit spans separable. These targets imply 4.2.1 without assuming separability of the original representation.
(Source: Ciobotaru Lemma 2.9, Theorem 3.2 and §4.1, Lemma 4.2, pp.5,9–10; the root/KAK carrier is LieGroups Layer 9.)

**The quotient L² representation.** For a measure-preserving G-action on X, assemble `quotientKoopman` from Mathlib `Lp.compMeasurePreservingₗᵢ`, on Lp ℂ 2 μ, by (π(g)f)(x)=f(g⁻¹x) and specialize it to the actual invariant probability measure on X=G/Γ. The generic construction requires no quotient or transitivity; only its fixed-constant theorem uses the homogeneous quotient. `quotientKoopman_apply` is its a.e. representative formula. Reuse Mathlib `Lp.compMeasurePreserving_continuous`, with its Borel, R₁, inner-regular and locally-finite measure hypotheses, to obtain strong continuity for a continuous group action. This imports the existing analytic continuity result. Prove `quotientKoopman_unitary`, `quotientKoopman_strong`, and `quotientKoopman_invariants`: its G-fixed subspace consists exactly of a.e. constant functions, using transitivity and quotient-Haar integration. The homogeneous setting has a second-countable locally compact group, a closed discrete lattice, its standard Borel quotient and a normalized invariant Radon measure. For every g, the fixed-space condition means equality a.e.; TauCeti `Probability.mem_fixedSpace_iff_ae_eq` supplies this equivalence for each operator. Fubini against quotient Haar measure then forces constancy, without treating L² representatives as pointwise invariant. Construct `meanZeroL2` as the orthogonal complement of constants, equivalently the kernel of f↦∫f dμ when μ is a probability measure; prove it invariant and has no nonzero G-fixed vector. Finally `ergodic_iff_L2_fixed_constants`, using Mathlib `ErgodicSMul`, identifies H-ergodicity with H-invariant L² functions being a.e. constant. For an H-fixed vector in the mean-zero representation, a sequence in noncompact closed H escaping G would have a constant coefficient equal to its squared norm; 4.2.1 forces that norm to zero, proving 4.2.2.
(Source: Morris2015v6, §§11.1–11.2, pp.213–220, and §14.2, pp.289–292, for the Koopman, invariant-functions and Moore argument; Ciobotaru Definition 2.2 for strong continuity; Mathlib `MeasureTheory.Lp`, density of continuous compactly supported functions and invariant quotient measures from AA.2.)
**Checks.**

- Finite measure is required for the integral-kernel construction: on N with counting measure, f(n)=1/(n+1) and g(n)=1_{n=0}−f(n) are in L², both have totalized integral zero because neither is in L¹, but f+g has integral one. This kernel is not a submodule on an arbitrary infinite measure space.
- On a probability space the constant function 1 has norm one and is removed from `meanZeroL2`. On three points with counting measure and the cycle 0→1→2→0, the observable (0,1,2) transforms to (2,0,1): pullback uses the inverse cycle. On two points with probabilities 1/2,1/2, the observable (1,−1) has mean zero and norm one.
- On a singleton probability quotient the mean-zero space is zero, and its invariant subspace is zero.
- For the trivial H action on a two-point probability space, (1,−1) is a nonzero mean-zero invariant; the action is not ergodic. Replacing H by a compact subgroup does not prove Moore's conclusion.

**Good functions and exterior covolumes.** On finite-dimensional real normed spaces with a locally finite additive Haar measure, define `GoodOn f C α V`, with C,α>0, to mean that f is continuous on V and, for every ball B with its closure contained in V and every δ>0, vol{x∈B:|f(x)|<δ sup_B|f|}≤Cδ^α vol(B). When sup_B|f|=0 this relative sublevel is empty. This is the division-free equivalent of the source's absolute-threshold bound with its zero-supremum convention. Its API is `GoodOn_abs`, `GoodOn_smul`, `GoodOn_max`, its finite-supremum iteration `GoodOn_sup` (requiring C,α>0 also for an empty family), and `polynomial_good`: a real polynomial of degree at most k≥1 is (2k(k+1)^(1/k),1/k)-good. The proof chooses k+1 separated sublevel points and uses Lagrange interpolation. Define `primitiveExteriorCovolume h Δ b` as the supremum over tuples I:Fin k→Fin d of |det((hb_j)_(I_i))|, for an integral basis b of rank k. Repeated rows contribute zero and the rank-zero value is one. On a nonzero primitive subgroup Δ⊂Z^d as the coordinate sup norm of the exterior product of an integral basis of hΔ, independent of its orientation; it is comparable, not identical, to Euclidean covolume. Its API is `primitiveExteriorCovolume_basisChange`, `primitiveExteriorCovolume_nonneg`, `primitiveExteriorCovolume_continuous`, positivity for invertible h and real-independent basis vectors, the rank-one maximum coordinate norm, and the bound ‖Δ+Zv‖≤d‖Δ‖‖v‖ after saturation.
(Source: Kleinbock–Margulis §3, Lemma 3.1, Proposition 3.2, pp.6–7, and §5, Lemma 5.1, pp.13–14.)
**Checks.**

- The zero polynomial is good by the zero-supremum branch; a nonzero constant has empty sublevels below its absolute value.
- On (−1,1), f(t)=t has sublevel proportion ε for 0<ε≤1, whereas f(t)=t² has proportion √ε. A degree-independent exponent one would fail.
- For the primitive vector (1,1) exterior sup norm is 1 and Euclidean length is √2; sign reversal leaves the former unchanged. Rank-zero exterior product has norm 1, but is excluded from the nonzero-subgroup poset.
- A generator (2,0) gives exterior norm 2; diag(2,3) sends (1,1) to exterior norm 3; the zero matrix gives norm 0 in positive rank and fails invertibility.

Define `integralPrimitiveSubgroup Δ` by containment in the integer-coordinate lattice and saturation there: for z∈Z^d and a∈Z\{0}, az∈Δ implies z∈Δ. Its API is the zero/full-coordinate cases, integral-basis existence, rank at most d, and strict rank growth for proper inclusions of primitive subgroups. This is saturation inside Z^d; a nonzero subgroup is never saturated in the ambient real vector space. Define `shortIntegerVectorSet h B ε` as {x∈B: some z∈Z^d\{0} has ‖h(x)z‖_∞<ε}; its API is threshold monotonicity and measurability for continuous h and measurable B. The integer quantifier makes it a countable union.
**Checks.**

- Z(1,1) is primitive in Z²; Z(2,0) is not, since 2(1,0) belongs and (1,0) does not.
- The zero subgroup is primitive, including d=0, but is excluded from the nonzero poset. The full coordinate lattice is primitive.
- For h=1, ε=1/2 gives an empty short-vector set; ε=2 gives all of B. In d=0 it is empty for every ε because no nonzero integer vector exists.

Prove `quantitative_nondivergence`: on a ball B⊂R^s with enlarged ball 3^d B, h:3^dB→GL_d(R) continuous, every nonzero primitive Δ has `primitiveExteriorCovolume(hΔ)` (C,α)-good and supremum on B at least ρ, where 0<ρ≤1/d. Then for 0<ε≤ρ the proportion with a nonzero hZ^d vector of sup norm <ε is at most dC(3^s N_s)^d(ε/ρ)^α, with N_s=Mathlib `Besicovitch.multiplicity (Fin s → ℝ)`, its finite-dimensional packing/covering constant; use `Besicovitch.exist_disjoint_covering_families` rather than reconstructing the covering theorem. Prove `marked_primitive_chain_estimate` first: the primitive-subgroup poset has length d, its small-coordinate sets are locally finite, and the good-function covering estimate bounds failure of a marked chain by that constant. The exterior inequality above turns a marked chain into the lower bound on every vector. For h(t)=u_t g, the exterior coordinates are polynomials of degree ≤d², and ρ=min(1/d,inf_Δ‖gΔ‖)>0 by exterior-lattice discreteness. This gives `unipotent_quantitative_recurrence`, with exponent 1/d² and a constant depending only on d. Apply 4.5 Mahler compactness to the resulting shortest-vector lower bound to obtain 4.2.3, uniformly for every T>0.
(Source: Kleinbock–Margulis Theorem 4.1, pp.10–13, Theorem 5.2 and Theorem 5.3 with their proofs, pp.14–15; source labels the latter a theorem, not a corollary.)

4.2.1. Prove that for a connected noncompact almost-simple real Lie group G with finite centre and a strongly continuous unitary representation on a Hilbert space with no nonzero G-invariant vector, every matrix coefficient tends to 0 as g leaves all compact subsets of G.
Strong continuity, unitarity, finite centre and almost simplicity are retained. For a semisimple product one must specify escape in every noncompact factor or the appropriate factor-invariant exclusions.
(Source: Ciobotaru Theorems 1.1 and 3.2, §4.1, pp.2,9–10; Benoist Fact 3.3, physical p.20, is the consumer statement.)
*Needs:* `StronglyContinuous`, `contraction_generation_decay`, `cartan_coefficient_reduction`, `simple_cartan_contraction_generation`, RepresentationTheory/LieGroups Layer 9.
**Checks.**

- A constant vector in the full L² quotient space has a nondecaying coefficient; remove constants before applying the theorem.
- Escaping only one factor of a product does not justify the unqualified product theorem.

4.2.2. Let G be connected noncompact almost-simple with finite centre, Γ a lattice and μ the invariant probability measure on G/Γ. Every closed noncompact subgroup H acts ergodically on (G/Γ,μ).
Finite quotient volume is used to normalize μ; G is almost-simple, not an arbitrary product.
(Source: Morris2015v6, Moore-ergodicity conventions in the standing setting, §4.10; consequence derived from the preceding matrix-coefficient target.)
*Needs:* 4.2.1, `quotientKoopman_invariants`, `meanZeroL2`, `ergodic_iff_L2_fixed_constants`, AdelicAlgebraicGroups AA.2.
**Checks.**

- A compact subgroup does not meet the noncompactness hypothesis.
- For a semisimple product, a lattice quotient with factor-invariant functions requires an irreducibility/factor version instead.

4.2.3. Prove that for d≥2, X=SL_d(R)/SL_d(Z), a one-parameter unipotent subgroup u_t, x∈X and epsilon>0, there exists a compact K⊂X such that for every T>0, Leb{t∈[0,T]:u_t x∈K}/T≥1−epsilon.
K depends on x, epsilon and the flow. This is qualitative recurrence; no spectral rate or uniform compact set over all x is asserted.
(Source: Benoist2019, Fact 3.4, physical p.20.)
*Needs:* `unipotent_quantitative_recurrence`, 4.5 Mahler compactness. The compact set is the shortest-vector sublevel complement, not a consequence of Minkowski alone.
**Checks.**

- A diagonal flow can diverge and cannot replace the unipotent flow.
- The statement controls every T>0 with a compact set containing the necessary initial trajectory segment.

**Algebraic support and shearing.** The measure-classification branch first treats a real linear algebraic G and a connected algebraic unipotent U, with Γ discrete and μ a U-invariant ergodic probability on G/Γ. Prove `minimal_algebraic_support`: a positive-measure algebraic subset of G contains a coset Px whose image supports μ, for a connected algebraic subgroup P containing U. Minimize dimension using Noetherianity; invariance and countably many Γ-translates identify the minimal cosets, and ergodicity selects one. The input `algebraic_probability_fixed_points` says that a probability invariant under a group generated by unipotents and real-split semisimple elements is supported on its fixed points in a real algebraic variety. A projective embedding and the attracting/escaping orbit alternatives prove the one-generator case; intersections prove the generated-group case. This applies also to the Grassmannian-valued stabilizer maps. Thus the later proof may assume connected G and Zariski-dense μ, without assuming the support is already homogeneous. Prove `transverse_recurrence_pairs`: for a sufficiently large-measure set Q, a local algebraic transversal L to an open subgroup F and a proper algebraic M⊊L, Zariski-dense F-invariant μ gives g_j→1 in L\M with Q∩g_jQ nonempty. Local product coordinates and Fubini would otherwise concentrate positive measure on a proper algebraic coset.
(Source: Margulis–Tomanov, Lemmas 3.1 and 3.3 and Proposition 3.2, pp.356–358; real specialization. LieGroups Layer 9 and the algebraic-group/Grassmannian suppliers provide the carriers.)
**Checks.**

- A Dirac probability on a fixed point has minimal support a point; positive measure does not imply full Zariski support.
- An invariant probability on a finite algebraic orbit must be supported on fixed points when the acting group is connected. A disconnected permutation group would violate this conclusion and is excluded.
- On a two-dimensional local product chart, Haar measure admits returns off any proper algebraic curve. A measure supported on that curve lacks the Zariski-density hypothesis.

Define `StronglyQuasiregularMap U G` as a rational map φ on a Zariski-open subset of U containing 1, with φ(1)=1, obtained locally uniformly as α_j(u)g_jb_j(u). Here g_j→1 lies outside N_G(U), α_j are polynomial automorphisms of U of uniformly bounded degree, and b_j are rational U-valued maps; for each rational representation and U-fixed vector, the corresponding φ-orbit map extends polynomially. The API records the open domain, compact-uniform convergence, representation-polynomial extension, and independence of the Chevalley embedding used to construct it. Prove `quasiregular_rescaling`: conjugation dilations by a real-split semisimple s expanding U, together with g_j, produce a nonconstant φ after first-exit normalization and passage to a subsequence. Bounded degree makes coefficient convergence compact; a rational cross-section to G/U lifts the nonconstant polynomial limit. Prove `quasiregular_normalizes`: φ takes values in N_G(U), and its image is unbounded modulo U. The rescaling step requires the explicit condition that s^(-r_j)g_js^(r_j) stays bounded. Prove `unipotent_weight_filtration_rescaling`: an algebraic embedding in SL_N with a weight filtration adapted to Lie(U) arranges N_G(U₀)∩W⁻(s)={1} for the limiting U₀, which supplies that condition. It is not true for arbitrary choices of s and g_j.
(Source: Margulis–Tomanov §5, pp.359–362, Lemma 6.1, pp.362–363, the condition preceding Lemma 6.7, p.367, and Lemma 6.8, pp.369–370.)
**Checks.**

- In SL₂, write u(t)=[[1,t],[0,1]] and g_ε=[[1,0],[ε,1]]. For a≠−1 and ε≠0, u(a/ε)g_εu(−a/(ε(1+a)))=[[1+a,0],[ε,(1+a)⁻¹]]. Its limit is the nonconstant diagonal map with entries 1+a and (1+a)⁻¹; it normalizes U but is not U-valued.
- At a=0 the limit is 1; at a=1 it is diag(2,1/2). At a=−1 the rational cross-section is undefined, so a globally regular G-valued map is not asserted.
- For U={1}, N_G(U)=G and no g_j outside the normalizer exists. A constant limit cannot substitute for the nonconstant rescaling theorem.

**Finite Poisson sampling.** For a measurable space X, a finite measure μ and intensity a≥0, define `finitePoissonConfiguration a μ` on Σ_(n∈N)Xⁿ by mixing the product measures (μ/μ(X))ⁿ with the existing Mathlib `ProbabilityTheory.poissonMeasure (a μ(X))`. At μ(X)=0 all mass is on the empty configuration, so no positive-mass assumption is needed. Define `configurationCount A (n,x)=Σ_(i<n)1_A(x_i)`, counting repetitions. Its API is measurable evaluation on measurable A, count on the universe, monotonicity, and additivity on disjoint sets. The sampling API is probability normalization, `finitePoissonConfiguration_count` (count in A has Poisson parameter aμ(A)), `finitePoissonConfiguration_indep_counts` for disjoint measurable sets, and `finitePoissonConfiguration_campbell`: the expected sum of an integrable real f over the configuration is a∫f dμ. Expand the product integral at each count n; multinomial allocation gives independent Poisson counts, and their first moments give Campbell's identity. All products use the measurable sigma-type carrier, not an unspecified random subset. The greedy covering construction uses precisely these finite-window samples; it requires no construction of a process on the whole noncompact group. (Source: Lindenstrauss, *Pointwise theorems for amenable groups*, author manuscript dated 31 January 2001, proof of Lemma 2.1, pp.7–13; the count law and its convolution are reused from Mathlib `Probability/Distributions/Poisson/Basic`.)
**Checks.**

- Zero μ gives count zero with probability one. For a=1 and μ=δ_* on a singleton, the universe count has Poisson parameter 1, even though a configuration may repeat the point.
- On two points with counting measure and a=2, the count at either point has parameter 2 and the two counts are independent; the universe count has parameter 4.
- The configuration (0,1,0) has count 2 in {0}; (0,0) has count 0 in the empty set; the empty configuration has universe count 0.

**Averaging and additional measure invariance.** Construct `ActionErgodicKernel μ U` as a measurable probability kernel whose integral is μ and whose values are U-invariant and U-ergodic almost everywhere, with the integral identity for every integrable observable and uniqueness modulo the invariant σ-algebra. Its defining invariant-set identity is κ(x,A)=1_A(x) almost everywhere for every μ-essentially U-invariant measurable A; this ties the component to x. `exists_actionErgodicKernel` first treats countable groups on nonempty standard Borel probability spaces, with measurable action and invariant measure. A countable dense subgroup and continuity in L¹ give the locally compact, second-countable continuous-action extension. The API is `ActionErgodicKernel.integral`, `ActionErgodicKernel.const_of_ergodic`, a.e. uniqueness, and restriction to a conull invariant set. Use Mathlib's standard-Borel conditional kernels and conditional expectation, and prove the invariant-kernel/ergodicity adapter by a countable generating algebra; the exchangeability-specific decomposition is not a supplier for arbitrary U-actions. Define `normalizedActionAverage η A f x` as (η(A))⁻¹∫_A f(ux)dη(u), and `AveragingSequence μ η A κ` by positive finite Haar volume and a.e. convergence of the normalized A_j averages of every compactly supported continuous observable to its component integral. Its API includes null-set independence, a countable dense observable test, conjugation transport with its Haar Jacobian, and convergence for approximated averaging sets. Prove `expanding_unipotent_averages`: for a relatively compact positive-volume A⊂U, the sets s^jAs^(-j), with s expanding all of U, form such a sequence. Verify `TemperedFolnerSequence`: compact measurable A_j of positive finite Haar volume, a uniform bound η(⋃_(k<j) A_k⁻¹A_j)≤Cη(A_j), and η((KA_j)△A_j)/η(A_j)→0 for compact K containing 1. The API includes tail/subsequence stability, scalar-Haar invariance, and the finite-group constant-universe case. Prove `tempered_action_maximal_inequality`: for λ>0 the measure of {x:sup_j |average_j f(x)|>λ} is at most 2(1+C)‖f‖₁/λ. First prove the finite-cover selection bound using independent finite Poisson samples on compact possible-center sets, with expected multiplicity conditioned on being positive ≤1+δ and expected covered mass ≥δ/(1+Cδ) times the center mass. The needed finite Poisson law is built by sampling a Poisson-distributed count and independent normalized-Haar points; its thinning identity and expected-sum identity supply the calculation. Transference integrates this bound over the action. Prove `tempered_action_pointwise`: averages converge a.e. to conditional expectation on the invariant σ-algebra. Bounded coboundaries have zero limit by Følner invariance and span a dense subspace of the conditional-mean-zero L¹ space; the maximal inequality extends convergence to that closure. The component-kernel identity identifies the limit. This is distinct from the L² mean ergodic theorem. Then prove `uniform_unipotent_averaging_set`: for each δ>0 there is a compact M of μ-measure >1−δ on which all these averages converge uniformly, simultaneously for a countable dense set of observables and Haar-approximating sets. Egoroff and regularity give M; approximation extends to each required A.
(Source: Margulis–Tomanov Definition 7.1 and Lemmas 7.2–7.3, pp.370–372. Lindenstrauss, author preprint dated 31 January 2001, Definition 1.1 and Theorem 1.2, p.2, Lemma 2.1 and its finite-Poisson construction, pp.7–13, Theorems 3.2–3.3 and proofs, pp.20–22, supplies the maximal/pointwise route just stated. The finite-Poisson and invariant-kernel constructions precede the averaging API.)
**Checks.**

- For an ergodic probability all component integrals are the ordinary μ-integral; for a mixture of two distinct invariant ergodic probabilities they retain the component parameter.
- On R acting on R/Z by translations, normalized averages on [0,T] of exp(2πix) tend to zero; the constant observable has average one for every T.
- A singleton averaging set has Haar volume zero in a positive-dimensional U and is excluded. L² convergence alone does not provide the uniform M used in the next target.
- For the trivial action on two equiprobable points, κ(x)=δ_x is the component kernel and its singleton-group averages reproduce f(x). The constant kernel κ(x)=μ is stationary but is not a component kernel and its predicted average fails on (1,−1).
- For the full permutation action on those points, κ(x)=μ and averaging over the whole finite group gives zero on (1,−1) and one on the constant observable. The constant whole-group sequence is tempered Følner; a singleton sequence in that nontrivial group is not, and the empty sequence fails positivity. Empty-set averages are zero and cannot be used by the convergence theorem.

Prove `quasiregular_measure_enlargement`: if x_j→x, x_j and g_jx_j lie in a common uniform-averaging M, and g_j has the bounded-conjugate rescaling condition, then the U-ergodic component at x is invariant under φ(U). The proof compares the two averages after the rational changes of parameter b_j; local invertibility and uniform Jacobian convergence on compact subsets control both their domains and weights. A bare weak limit of g_j does not imply this invariance. Enlarge a maximal unipotent measure stabilizer by these φ-values. Prove `maximal_leaf_transversality`: in the presence of the resulting real-split s, returns transverse to the maximal expanding unipotent stabilizer must have contracting transverse depth strictly larger than the depth inside that stabilizer; otherwise the same averaging argument creates a new unipotent measure symmetry, contradicting maximality. Recurrent s-orbits then give `opposite_leaf_support`: a conull Y meets each contracting W⁻(s)-leaf only in the corresponding U⁻(s)-leaf. The maximal stabilizer is a measurable Grassmannian-valued map; algebraic fixed-point reduction makes it constant on the relevant ergodic component.
(Source: Margulis–Tomanov Basic Lemma 7.5 and its proof, pp.372–376, Proposition 8.2, pp.377–378, Proposition 8.3 and Corollary 8.4, pp.378–380.)

**Entropy and Haar measure on leaves.** Define `SubordinatePartition μ V Y` by a measurable label X→Y into a standard Borel space Y. Almost every atom lies in one V-orbit, is contained in Kx for some compact K⊂V, and contains Ux for an open identity neighborhood U⊂V. Thus Y may be uncountable; a countably generated partition is not a partition with countably many atoms. Its API gives the atom-in-orbit property, relabeling by a measurable isomorphism, transport by a normalizer, and passage to an absolutely continuous measure. For the conditional kernel of an atom use Mathlib `ProbabilityTheory.condDistrib id label μ`; standard-Borel disintegration supplies it, and the measurable-diagonal argument supplies the atom evaluation. Do not require a compact preimage in V when the orbit has a noncompact stabilizer.

Define `finitePartitionEntropy μ label` as −Σ_i p_i log p_i, p_i=μ(label⁻¹{i}), with 0 log 0=0. Define `countablePartitionEntropy` as the extended nonnegative sum of these summands. For measurable countable labels a,b, define `conditionalPartitionEntropy` as Σ_(i,j) p_ij log(p_j/p_ij), including zero-mass cells with contribution zero. Its API is the finite-sum comparison, chain rule, label-isomorphism invariance, and addition for independent labels. Define `iteratedPartitionLabel T a n` by (a(x),a(Tx),…,a(T^(n−1)x)). Define `partitionEntropyRate` as inf_(n≥1) H(join_n a)/n, and prove this is the limit for a measure-preserving T when H(a)<∞, using the chain-rule subadditivity and Fekete's lemma. Define `measureEntropy μ T` as the supremum of these rates over measurable labels into N with finite entropy; any countable label space embeds in N. The value is in [0,∞], so infinite entropy is retained. On a probability space, the finite entropy is nonnegative and at most log(card ι).

For general standard-Borel labels define `atomInformation p` to be ∞ at p=0 and −log p otherwise, and define `conditionalLabelEntropy μ a b` by integrating this information for the conditional probability of a(x)'s atom in the conditional kernel given b(x). Prove that this agrees with the countable formula above and is unchanged by a.e. replacement of the kernel. This version states H(sη|η) for subordinate partitions with uncountably many atoms. It does not assign zero information to a zero-probability atom. Prove the chain rule, entropy invariance under conjugacy, `entropy_inverse`, and `contracting_subordinate_entropy`: for μ s-ergodic and a closed contracting leaf group W⁻, there is an increasing subordinate η with H(sη|η)=h_μ(s). Local leaf boxes and first returns construct η; Kac's return-time identity gives integrability, and a dyadic-level partition with integrable logarithmic mesh gives the finite-entropy fine partition. This mesh lemma is constructed without assuming a finite generator on a noncompact quotient. Use natural logarithms for entropy and Haar modulus throughout.
Prove `leaf_entropy_bound_and_equality`: for a closed V⊂W⁻ normalized by s, H(sη|η)≤log α(s⁻¹,V), and equality holds exactly when the conditional leaf measures are normalized Haar measures, equivalently μ is V-invariant. Compare conditional atom weights with Haar atom weights by the log-sum inequality. The Haar weights sum to at most one; equality forces proportionality on every refinement. The integral of the logarithmic normalization coboundary is zero, by truncation and the pointwise ergodic theorem. Contracting iterates exhaust the leaf, so the conditional-Haar conclusion yields global V-invariance. Consequently, if a conull Y intersects W⁻-leaves only in V-leaves, h_μ(s)≤log α(s⁻¹,V), with equality forcing V-invariance. If μ is V-invariant, equality holds.
(Source: Margulis–Tomanov Lemma 9.2 and Proposition 9.3, pp.380–383, Lemmas 9.4–9.5 and Proposition 9.6, pp.383–385, and Theorem 9.7, pp.385–386. The finite-mesh and entropy/disintegration adapters above are owned inputs.)
**Checks.**

- One atom has entropy zero; a fair binary label has entropy log 2; independent fair binary labels have conditional entropy log 2, while conditioning a label on itself gives zero. The empty zero-measure label gives zero.
- Iterating a fixed binary label under the identity gives (i,i,i); iterating the two-point flip from 0 gives (0,1,0). Both transformations have entropy zero. A fair two-sided Bernoulli shift has coordinate-label rate and measure entropy log 2; a definition returning zero for every transformation fails this case.
- A nonatomic uniform probability on [0,1), with the point label conditioned on a constant, has conditional-label entropy ∞. Conditioning the point label on itself has entropy zero. The singleton Dirac probability has zero conditional entropy in either case.
- For the trivial action on two points, the singleton partition is subordinate and the constant partition is not. For translations of R, the singleton partition fails the neighborhood condition at a Dirac point; the floor label is subordinate at δ_(1/2), with compact orbit pieces and an identity neighborhood. At zero μ all a.e. requirements are vacuous.
- A periodic s-orbit has entropy zero and need not have Haar conditionals on a positive-dimensional contracting leaf; an inequality is insufficient for invariance. For s=diag(e^t,e^(−t)), t>0, the lower-unipotent modulus is α(s,V)=e^(−2t), hence log α(s⁻¹,V)=2t. Reversing the modulus gives an impossible negative entropy bound.

These targets prove `unipotent_measure_classification_algebraic`: after minimal-support reduction, let N be the maximal normal unipotent-generated measure stabilizer. If U⊄N, shearing enlargement supplies s with α(s,F(s))≥1. Disintegrate into s-ergodic components; generalized Mautner invariance gives U⁺-invariance, and opposite-leaf support gives the matching upper entropy bound for U⁻. Since h(s)=h(s⁻¹), the bounds force equality and thus U⁻-invariance. Transverse recurrence and maximality then force U⁻=W⁻, and the total adjoint modulus one forces U⁺=W⁺. This contradicts maximality of N. Hence U⊂N; lift μ to G, use normality and unimodularity of N, and take the closure of NΓ to identify μ as Haar probability on a closed orbit. For a connected algebraic group H generated by unipotent subgroups, prove `maximal_unipotent_ergodicity`: an H-ergodic probability is ergodic for a maximal unipotent V⊂H. Pass to the Koopman representation, use the unipotent radical and a Levi decomposition, and apply Howe–Moore in each noncompact semisimple factor to show that V-fixed vectors are H-fixed. Compact anisotropic factors cannot occur in a unipotent-generated H. Then the unipotent classification applies to V; do not assume H itself is unipotent. For the real Lie-group statement, prove `semisimple_algebraic_envelope`: a connected linear semisimple real G identifies with the identity component of the real points of its algebraic envelope. Regard μ as a probability on the larger quotient; its measure stabilizer stays in the component carrying its support. This finite-component adapter preserves closed orbits and their normalized measures.
(Source: Margulis–Tomanov Theorem 1, p.347, Lemmas 10.1–10.2 and proof in §10, pp.386–387; the generated-subgroup extension and real-envelope reduction must preserve the stated U-ergodicity and quotient measure.)

**Semisimple algebraic envelope.** Prove `semisimple_algebraic_envelope`: for a connected closed matrix Lie subgroup G⊂GL_d(R) with semisimple Lie algebra, its real Zariski closure H is semisimple and G=H(R)⁰. Use LieHighestWeight Layer 5 for complete reducibility of the complexified defining representation. Its irreducible summands are preserved by H, and the determinant on each summand is one: its derivative is a character of a perfect Lie algebra and G is connected. A connected abelian normal subgroup A of H has finitely many common-eigenvector weights. Connected H preserves each weight space; irreducibility makes A scalar on each summand. The determinant-one condition makes those scalars finite roots of unity, so connected A is trivial. The last nonzero derived subgroup of a nontrivial connected solvable radical would be such an A; hence H is semisimple. Prove `matrix_lie_normalizer_algebraic`: preserving Lie(G) is a polynomial condition on a matrix and its inverse; connected G is generated by exponentials, so preserving its Lie algebra is equivalent to normalizing G. Consequently H normalizes G. Semisimple Lie ideals give a complementary centralizing factor C up to finite central isogeny; G=C_H(C)⁰. This centralizer is algebraic and has exactly Lie(G), proving G=H(R)⁰. RealAlgebraicGeometry's finite-component theorem supplies the finite-component quotient adapter, and LieGroups Layers 2 and 4 supply the subgroup/Lie-algebra correspondence. No statement for an arbitrary connected abelian matrix group is inferred.
(Source: Morris, Theorem A4.9, p.436, and Corollaries A7.7–A7.8, pp.443–444; the complete-reducibility and normalizer steps above make explicit the inputs of that proof.)
**Checks.**

- SL₂(R) is connected and already algebraic. SO(2,1)⁰ has the same Lie algebra as SO(2,1) but is only its identity component; the full real-point group cannot replace the conclusion.
- The trivial group has zero semisimple Lie algebra and trivial envelope, including the zero-dimensional defining representation.
- The graph t↦diag(exp(t),exp(√2t)) is a closed connected abelian matrix group whose Zariski closure is a two-dimensional torus. Its Lie algebra is not semisimple; dropping that hypothesis gives the wrong dimension.

**Borel density needed by the arithmetic reduction.** Prove `borel_density_unipotent_generated`: if a connected real algebraic matrix group H is generated by real one-parameter unipotent subgroups, Γ⊂H is a lattice, and ρ is a rational finite-dimensional representation, every Γ-invariant linear subspace is H-invariant. For a d-dimensional subspace W, map H/Γ equivariantly to the projective space of Λ^dρ by hΓ↦[Λ^dρ(h)W] and push its finite invariant probability forward. For a unipotent generator u, write ρ(u)=1+N. If r is maximal with N^rv≠0, (1+N)^nv/n^r tends projectively to [N^rv], which is fixed. Poincaré recurrence forces almost every starting line to equal this limit. Thus the probability is supported on fixed lines for every generator; closedness, second countability and a countable dense family of generators give simultaneous invariance. The orbit map's continuous image and Haar full support then put W in that fixed locus. Degree-by-degree, the finite-dimensional space of polynomials vanishing on Γ is Γ-stable. Apply the invariant-subspace result to right translation and evaluate at the identity to show all those polynomials vanish on H. This gives `borel_density_zariski` without an unavailable Borel-density import.
(Source: Morris, Theorem 4.5.1(2), pp.56–57, Proposition 4.6.3 and its proof, pp.61–62; this is the algebraic, unipotent-generated specialization.)
**Checks.**

- For H=SL₂(R), Γ=SL₂(Z), a polynomial vanishing on Γ vanishes on H. The vector fixed by both integral upper and lower elementary unipotents is fixed by H.
- For a compact rotation group, normalized probability on a nontrivial projective orbit need not be supported on fixed points. Such a group fails the unipotent-generation hypothesis.
- For the trivial representation every subspace is invariant; the zero subspace uses Λ⁰ and causes no exception. An infinite-volume quotient supplies no invariant probability for the recurrence argument.

**Linearization of singular homogeneous orbits.** Fix a right-invariant Riemannian metric on a real matrix Lie group G and a lattice Γ. Define `FiniteVolumeZariskiSubgroup Γ` to consist of connected closed H⊂G with H∩Γ a lattice and Ad(H∩Γ) Zariski dense in Ad(H). Define `homogeneousWedge H` as an oriented unit vector p_H∈Λ^(dim H)Lie(G) spanning Λ^(dim H)Lie(H). Define `homogeneousWedgeOrbitMap H g` as (Λ Ad g)p_H. Its API is change of orientation, equivariance, stabilizer N_G¹(H)={g∈N_G(H):det(Ad g|Lie H)=1}, and norm equal to the ratio of the translated homogeneous-orbit volumes. Quotient by p↦−p when the Γ-normalizer reverses orientation; this does not identify wedges of different magnitudes. For a subgroup U generated by unipotent flows, define `singularHomogeneousSet H U` as the union of N(F,U) over proper F in this family contained in H, where N(F,U)={g:U⊂gFg⁻¹}. Define `homogeneousWedgeRepresentatives H A` as {g p̄_H:gΓ∈A}. Its API gives image of a singleton, monotonicity, Γ-representative independence, and the relation N(H,U)=η_H⁻¹(V(H,U)), V(H,U)=span_R η_H(N(H,U)). The last follows from the linear equations u∧p=0 for u∈Lie(U).
(Source: Shah1994, Notations 2.15, 2.17, 2.25, pp.22–23, 26; Theorem 2.23 and Proposition 2.24, pp.25–26.)
**Checks.**

- For H={1}, p_H=1 in Λ⁰, η_H is constant, N(H,U) is empty for nontrivial U and all of G for trivial U; the singular set is empty.
- For H=G, unimodularity gives constant η_H. Its representative set on a nonempty subset is a singleton, while the representative set of the empty subset is empty.
- For the upper unipotent subgroup in SL₂(R), p_H is a positive multiple of E₁₂. Its SL₂(Z)-conjugates have integral coordinates after one fixed rescaling; p_H and 2p_H remain distinct even in the orientation quotient. The periodic orbit U/(U∩SL₂(Z)) is a circle.

Prove `boundedVolumeSubgroupFiniteness`: for every c>0, only finitely many H in `FiniteVolumeZariskiSubgroup Γ` have homogeneous-orbit Riemannian volume<c. Prove `homogeneousWedgeProperness`: Γp_H is closed discrete and gΓ_H↦(gΓ,g p_H), Γ_H={γ∈Γ:γp_H=p_H}, is proper. The volume-ratio identity and bounded-volume finiteness make its wedge orbit locally finite; compact lifts of compact quotient sets then give properness. The unoriented version follows by the finite orientation quotient. In particular representatives over a compact quotient set form a closed set. The bounded-volume finiteness proof remains a required input: Shah's Proposition 2.16, p.22, invokes Dani–Margulis1993 Theorem 5.1, rather than proving it. The volume claim does not follow merely from countability of H.

Prove `finiteVolumeOrbitEnvelope`: for a connected real Lie group G, a lattice Γ, a subgroup L generated by Ad-unipotent flows and x∈G/Γ, the smallest closed subgroup F⊃L for which Fx is closed exists; F∩G_x is a lattice. The L-action on Fx is ergodic and some one-parameter Ad-unipotent subgroup in L acts ergodically there. Every finite-dimensional real representation of F that is unipotent on these generators has Zariski-dense image of F∩G_x. Here the one-parameter conclusion includes the trivial subgroup only on a one-point orbit. The minimum uses local finiteness of intersections of closed finite-volume orbits, rather than arbitrary intersections of closed subsets.

Its proof requires `unipotentPropertyD`: every locally finite measure invariant under an Ad-unipotent element of G on G/Γ has a countable invariant Borel partition into sets of finite measure. `unipotentRadicalStructure` identifies the subgroup generated by flows as a semisimple group without compact factors times its unipotent radical; Mautner then extends property D from a maximal unipotent subgroup to it. The normal Mautner envelope H of L in F acts ergodically on the locally finite relatively invariant Haar measure of Fx, since HF∩G_x is dense in F. Property D forces that measure to be finite, hence F unimodular. Mautner returns L-ergodicity. A separate `unipotentErgodicOneParameterSelector` chooses an ergodic flow in an ergodic unipotent action; the semisimple case first uses normal closure and Mautner. The projective exterior-power recurrence argument proves the representation-density assertion. Property D and the selector remain required proof inputs, not consequences of the lattice-space estimate. (Shah1994, Theorem 2.4, p.18 and proof pp.21–22; Propositions 2.6,2.8–2.13, pp.18–21. Proposition 2.6 invokes Dani1984 Theorem 4.3, while Proposition 2.11 invokes its cited unipotent selector.)

**Checks.**

- For L={1}, its envelope at x is {1}, and its one-point Haar probability is ergodic.
- For the upper-unipotent flow on SL₂(R)/SL₂(Z) through the identity coset, its orbit is a closed circle, with its normalized Haar measure.
- A diagonal flow on the same quotient is excluded: recurrence and orbit closure do not provide property D by this proof.

Prove `singularWedgeUniqueRepresentative`: for compact K⊂G/Γ and D⊂V̄(H,U), the points of K with at least two representatives in D form a compact set covered by finitely many smaller-dimensional singular sets. Every compact subset of its complement has a neighborhood Φ of D with at most one representative per point. Properness gives compact lifts C; discreteness of Γ makes C⁻¹C∩Γ finite. For each nonnormalizing γ in that finite set, use the subgroup generated by unipotents in H∩γHγ⁻¹ and its smallest closed finite-volume envelope. Its dimension is strictly smaller than dim H. The envelope-existence step is an additional input of this assertion. (Source: Shah1994, Proposition 2.26 and proof, pp.26–27; the finite-volume envelope is Theorem 2.4, statement p.18 and proof pp.21–22, using Propositions 2.6, 2.8–2.13.)

Prove `polynomialSingularAvoidance`: for compact C⊂N(H,U) outside `singularHomogeneousSet H U`, ε>0 and polynomial adjoint degree bound d, there is a neighborhood Ω of π(C) such that a polynomial trajectory either has a constant wedge representative in V̄(H,U), or spends at most εT time in Ω for all sufficiently large T. First apply the polynomial small-value estimate to the finitely many linear equations defining V(H,U) and to ||η||². Given C, enlarge it to a compact D; for each Φ⊃D choose Ψ⊃C so that a polynomial excursion starting outside Φ spends less than ε/2 of its Φ-time in Ψ. The unique-representative neighborhood allows maximal excursion intervals to be matched to a fixed Γ-wedge; their multiplicity is at most two. A polynomial bounded on an unbounded excursion is constant, giving the first alternative; otherwise summing the excursion bounds gives the second. For θ(t)=u_tg, the first alternative and the wedge equation force U⊂gγHγ⁻¹g⁻¹ and place the starting point on that closed homogeneous orbit.
(Source: Shah1994, Propositions 2.27–2.28 and complete proofs, pp.27–29.)
**Checks.**

- A trajectory already on the periodic upper-unipotent circle has a constant representative and takes the first alternative. Its average is the circle Haar probability.
- A polynomial identically zero satisfies every small-value equation but has no positive sup norm; the polynomial-good estimate is used only on a nonzero defining functional or a positive norm excursion.
- Repeated Γ-wedge representatives cannot be silently treated as unique on the singular set; the smaller-dimensional exclusion is essential. Countability without properness does not give a finite compact-overlap cover.

Prove `generalUnipotentNoEscape`: for each x∈G/Γ and ε>0 there is compact K such that liminf_(T→∞)T⁻¹|{t∈[0,T]:u_t x∈K}|≥1−ε. This is required on arbitrary finite-volume quotients; the quantitative exterior-lattice estimate earlier supplies it only for the specified lattice spaces. Its general reduction and proof remain required.

With these inputs, prove `oneOrbitAverageIdentification` without assuming an orbit-closure theorem. Every cluster point of the averages on the one-point compactification is a probability on G/Γ by no escape, and is U-invariant by the O(1/T) endpoint error. Disintegrate it using measure classification and the countable homogeneous subgroup family. Choose a subgroup of smallest dimension with positive component weight; a compact regular part of that stratum has positive limit weight. Polynomial singular avoidance rules out the small-time alternative and puts the original orbit in its closed finite-volume subgroup orbit. Induct on dimension there. At the terminal dimension the limit is the unique homogeneous Haar probability, so every cluster point agrees and the averages converge. Its full support implies the positive-time orbit closure is exactly that homogeneous orbit. General connected U generated by flows is handled by the finite-dimensional subgroup-enlargement argument; no average over a nonexistent Haar interval on U is assumed.
(Source: Shah1994, Theorem 2.29 and proof, pp.29–30.)

4.2.4. Prove that for a connected linear semisimple real Lie group G, a lattice Γ, a connected subgroup U generated by one-parameter unipotent subgroups and x=gΓ, the closure of Ux is Lx for a connected closed subgroup L containing U, with L∩gΓg^−1 a lattice in L.
The homogeneous orbit has finite invariant volume; the subgroup is generated by unipotent flows. A general diagonal orbit does not satisfy this conclusion.
(Source: Morris2015v6, Theorem 20.1.3 and Remarks 20.1.4–20.1.5, printed pp.406–407; connected specialization.)
*Needs:* `unipotent_measure_classification_algebraic`, the generated-subgroup and algebraic-envelope adapters, LieGroups Layer 9, `generalUnipotentNoEscape`, `boundedVolumeSubgroupFiniteness`, `singularWedgeUniqueRepresentative`, `polynomialSingularAvoidance`, and `oneOrbitAverageIdentification`. The flow case precedes the generated-subgroup enlargement; it does not use 4.2.6 as an assumed theorem.
**Checks.**

- The orbit closure carries a finite L-invariant measure, not just an unspecified closed set.

4.2.5. Prove that in the preceding homogeneous setting, every ergodic U-invariant probability measure on G/Γ is the unique normalized L-invariant measure on a closed finite-volume orbit Lx for a closed subgroup L containing U.
U is connected and generated by one-parameter unipotent subgroups. Probability, invariance and ergodicity are separate hypotheses.
(Source: Morris2015v6, Theorem 20.3.4, printed p.413.)
*Needs:* `minimal_algebraic_support`, `quasiregular_measure_enlargement`, `maximal_leaf_transversality`, `opposite_leaf_support`, `leaf_entropy_bound_and_equality`, `unipotent_measure_classification_algebraic`, and the generated-subgroup and algebraic-envelope adapters. Their measurable-partition, disintegration and pointwise-averaging constructions precede this theorem.
**Checks.**

- A convex combination of different homogeneous orbit measures need not be ergodic.
- Replacing probability by an arbitrary infinite invariant measure is outside the statement.

4.2.6. Prove that for a one-parameter unipotent flow u_t and x∈G/Γ, there is a closed finite-volume homogeneous orbit Lx containing u_t x and a normalized invariant probability μ_L such that T^−1∫_0^T f(u_t x)dt→∫f dμ_L for every continuous compactly supported f.
The orbit measure is on the actual orbit closure, not necessarily all of G/Γ. No quantitative rate is inferred.
(Source: Morris2015v6, Definition 20.3.2 and Theorem 20.3.3, printed pp.412–413.)
*Needs:* 4.2.5, `oneOrbitAverageIdentification`, `generalUnipotentNoEscape`, `homogeneousWedgeProperness`, and `polynomialSingularAvoidance`. The last proof chain requires the general bounded-volume finiteness, finite-volume-envelope and no-escape inputs named above; it is independent of 4.2.4.
**Checks.**

- A closed periodic unipotent orbit equidistributes on itself, not on the full quotient.
- The limiting measure has mass 1; vague convergence with escaped mass would not satisfy the statement.

### 4.3 Oppenheim and Duke

**Harmonic ternary theta coefficients.** For a real polynomial P in three variables, use Mathlib `MvPolynomial.IsHomogeneous P ℓ` and define `polynomialLaplacian P=Σ_i ∂_i²P`; harmonicity is its vanishing, with Mathlib's polynomial derivatives. Its API is additivity, compatibility with scalar multiplication and evaluation against the analytic Laplacian. This condition is an adapter to `HarmonicOnNhd`, not a second definition of analytic harmonicity. Define `ternaryShell n` by Σ_i v_i²=n in Z³, `ternaryWeightedCoefficient P n` by summing P(v) over that finite shell, and `ternaryHarmonicTheta P τ` by Σ_v P(v)exp(2πiτΣ_i v_i²). The API proves shell finiteness, additivity in P, the coefficient identity, absolute locally uniform convergence, and cancellation for odd homogeneous degree. Normalization to the unit sphere multiplies the coefficient by n^(−ℓ/2) for n>0. Prove `fourier_harmonic_gaussian`: in n-dimensional Euclidean space, with P homogeneous harmonic of degree ℓ, and Fourier phase exp(−2πi⟨x,ξ⟩), the transform of P(x)exp(−πt‖x‖²) is (−i)^ℓ t^(−ℓ−n/2)P(ξ)exp(−π‖ξ‖²/t), t>0. Differentiate the Gaussian transform; the harmonicity condition removes the contraction terms. This also constructs the weighted Schwartz function used in Poisson summation.
(Source: Duke 1988, p.74, weighted spherical harmonics; the Fourier calculation is the harmonic-polynomial specialization of Mathlib's Schwartz/Fourier API and 4.4.6, not a consequence of the unweighted coefficient formula.)
**Checks.**

- The constant polynomial 1 gives coefficient 6 at n=1 and a nonzero constant term. It is excluded from the positive-degree cusp assertion.
- P=X₀ gives coefficient zero on every shell by v↦−v. P=X₀²−X₁² is harmonic but its coefficients also vanish, by coordinate permutation; harmonicity does not imply a nonzero theta series.
- P=Σ_i X_i⁴−(3/5)(Σ_i X_i²)² is harmonic of degree four: its two Laplacians are 12Σ_i X_i² and 20Σ_i X_i². Its n=1 coefficient is 12/5, so the coefficient construction must retain the weight.

**Checks for the weighted Fourier transform.**
- In dimension one, P(x)=x and t=1 give −iξ exp(−πξ²); using +i reverses the Fourier phase.
- In dimension two, P(x)=x₀²−x₁² gives −P(ξ)exp(−π‖ξ‖²). It is harmonic, whereas x₀² alone has an additional constant contraction term.
- In dimension zero the degree-zero constant has transform 1, with the canonical measure of its singleton equal to one. For t>0, the constant in dimension n has the scaling t^(−n/2); positive harmonic degree adds t^(−ℓ).

**Half-integral cusp forms and the ternary specialization.** Define `HalfIntegralCuspForm k N`, k a positive half-integer and 4|N, on the upper half-plane using the theta multiplier j(γ,τ)=θ(γτ)/θ(τ) for γ∈Γ₀(4), holomorphy, and vanishing at every cusp. Prove theta nonvanishing by its convergent product; the Gaussian Poisson transformation identifies this ratio with the square-root/Kronecker multiplier of Iwaniec §2. A form satisfies f(γτ)=j(γ,τ)^(2k)f(τ). Cusp vanishing is imposed after the appropriate metaplectic lift at each rational cusp, not only at infinity. The API is Fourier coefficients at infinity, all-cusp expansions, linear operations, the Petersson inner product ∫_{Γ₀(N)\H}f conjugate(g)y^k dxdy/y², and its positive definiteness. Prove `ternaryHarmonicTheta_cuspidal`: if P is homogeneous harmonic of positive even degree ℓ, its theta series belongs to `HalfIntegralCuspForm (ℓ+3/2) 4` with the standard theta multiplier. Poisson on the three cusp representatives ∞,0,1/2 gives the transformation; the constant terms vanish because P(0)=0 and the Fourier transform remains harmonic of positive degree. Odd degree gives the zero cusp form separately. This owns only the specialization needed here, not general lattice-theta modularity.
(Source: Iwaniec 1987, §2, pp.387–389, multiplier and cusp/Petersson definitions; Duke 1988, p.74, the harmonic theta specialization.)
**Checks.**

- θ³ has weight 3/2 and constant coefficient 1. It is modular but not cuspidal.
- The degree-two difference polynomial produces the zero cusp form of weight 7/2; zero must be admitted by the carrier.
- The degree-four polynomial above produces a nonzero cusp form of weight 11/2, with coefficient 12/5 at n=1. Replacing its weight by 3/2 fails the Gaussian scaling transformation.

**Half-integral coefficient estimate.** Prove `halfIntegralCoefficientBound`: for k=ℓ+1/2≥5/2, level N divisible by four, a cusp form f with Petersson norm one, and positive square-free n, |a_f(n)|≪_k n^(k/2−2/7)τ(n)(log(2n))². Scaling gives the f-dependent version with n^ε. The proof inputs are `halfIntegralPeterssonFormula`, the diagonal spectral identity in Iwaniec Lemma 1, p.390, and `averagedHalfIntegralKloostermanEstimate`, Theorem 3, p.399, with the following exact level-average contract. For positive square-free n, 8|N, x≥1, P≥1 and −1<v<1, put Q_set={pN:P<p≤2P, p prime, p∤2n} and K_Q(x)=Σ_(1≤c≤x,Q|c)c^(−1/2)K(n,n;c)exp(2πiv·2n/c). There is an absolute constant C such that

```text
Σ_(Q∈Q_set) |K_Q(x)| ≤ C [xP^(−1/2) + xn^(−1/2)
  + (x+n)^(5/8)(x^(1/4)P^(3/8) + n^(1/8)x^(1/8)P^(1/4))]
  · τ(n) · log(nx)².
```

The finite sums are continuous in v and the bound is uniform, so passage to v=−1,0,1 gives the three phases used by the Bessel expansion. At nx=1 the relevant sum is empty because every Q is divisible by eight; the zero logarithm is harmless. If 4|N but 8∤N, regard f at level 2N first and adjust its Petersson normalization by the subgroup index; the original level-four cusp space is not substituted directly into Theorem 3.  Define `thetaMultiplierPhase d` to be 1 for d≡1 mod4 and i for d≡3 mod4, with odd d in its multiplier API. Define `halfIntegralKloosterman ℓ m n c`, c>0 and 4|c in its arithmetic API, by

```text
Σ_(d∈(Z/cZ)*) ε_d^(−(2ℓ+1)) (c/d) exp(2πi(m d^(−1)+nd)/c).
```

Representatives d are the least positive residues, (c/d) is the Jacobi symbol and the inverse is taken in the unit group. Its API includes periodicity in m,n modulo c, period two in ℓ, Chinese-remainder factorization with its multiplier phases, and the Salié evaluation. Define `halfIntegralKloostermanPartialSum` by the finite c-sum K_Q(x) above, with x≥0 and Q>0 in its arithmetic API; it is continuous in v. Its API includes empty ranges, changes at a modulus, endpoint-phase limits and the averaged estimate. (Iwaniec equations (2.2)–(2.3), p.389, and (4.1), p.394.)

**Checks.**

- The multiplier phases at d=1,3,5 are 1,i,1. Replacing the inverse exponent by the positive exponent conjugates the c=4 example.
- K_(ℓ=0)(0,0;4)=1−i, K_(ℓ=1)(0,0;4)=1+i, and K_(ℓ=0)(1,1;4)=−1+i.
- K_4(3)=0; with ℓ=n=v=0, K_4(4)=(1−i)/2. At x=0 every partial sum is zero. Including c=0 would introduce a denominator and is excluded by construction.

 The API includes Chinese-remainder factorization and the Salié evaluation, Lemmas 2–7, pp.390–393; the incomplete-sum estimate is Lemma 8, pp.393–394. The proof of the averaged estimate separates small-factor ranges by (5.2)–(5.3), p.397, from the prime-level averaged Cauchy estimates (6.1)–(6.3), p.398. Level raising to pN, averaging, and splitting the Bessel integral at c=n yields the bound with P=n^(1/7), §8, pp.400–401. These named intermediate targets supply the estimate rather than treating a coefficient bound as a formal consequence of Poisson summation.
(Source: Iwaniec 1987, Theorem 1, p.386, and full proof §§2–8, pp.387–401.)
**Checks.**

- The zero form has zero coefficients and is covered by the scaled version, while the norm-one statement excludes it.
- A scalar multiple multiplies both coefficient and Petersson norm by the scalar's absolute value; a bound independent of f without normalization is false.
- The degree-four ternary series has k=11/2. After sphere normalization the exponent is 3/4−2/7 before division by r₃(n), independently of ℓ.

**The finite coefficient bridge.** Define `signedThreeSquareCount n` in Z as
6(−1)^(n+1)Σ_(r,s≥1,rs=n)(−1)^(r+s) + 4(−1)^(n+1)Σ_(r,s,t≥1,rs+rt+st=n)(−1)^(r+s+t).
All indices may be bounded by n; at n=0 both sums are empty. Its API is the finite bounds, permutation of the three triple indices, and `gauss_signed_three_square_count`: for n>0 it equals the integer cast of `Nat.card (ternaryShell n)`.

**Checks.**

- At n=1 the pair sum is 1 and the triple sum is 0, giving 6.
- At n=2 the two pairs contribute −2 and the triple sum is 0, giving 12.
- At n=3 the pair sum is 2 and the single triple (1,1,1) contributes −1, giving 8.
- At n=7 the signed contributions cancel to zero. At n=0 the function is zero, whereas the shell has one element; positivity is necessary in the theorem.

Prove the coefficient bridge through these owned analytic targets, without importing the higher QSeries roadmap. `jacobi_product_specialization` identifies Σ_(z∈Z)(−1)^z q^(z²) with ∏_(j≥1)(1−q^j)/(1+q^j), for |q|<1. Its more general intermediate triple product has parameters 0<|q|<1 and x≠0. Derive it by induction on N in the finite q-binomial theorem, shift the length-2N product to indices −N,…,N−1, normalize its central coefficient, and pass to the limit; geometric product convergence and the quadratic exponent bound justify local uniform convergence on compact subsets of C*. This proves the product, its simple zero locations and its differentiated residues. `kronecker_single_identity` proves the bilateral single-denominator identity by matching these residues and the q-shift equation, with the constant fixed by its Laurent coefficient. `appell_lerch_difference_identity` proves the difference of the two absolutely convergent Appell–Lerch series by the same pole and shift argument; here m(x,q,z)=j(z;q)^(-1)Σ_(k∈Z)(−1)^k q^(k(k−1)/2)z^k/(1−q^(k−1)xz), with poles excluded. These analytic identities are the auxiliary targets, rather than unexplained q-series inputs.

Define `qPochhammer a q=P(a;q)=∏_(j≥0)(1−aq^j)` and `jacobiProduct a q=J(a;q)=P(a;q)P(q/a;q)P(q;q)`. For |q|<1 the product converges; its API includes `qPochhammer_shift`, P(a;q)=(1−a)P(aq;q), and, for a≠0, `jacobiProduct_inversion`, J(a⁻¹;q)=−a⁻¹J(a;q). The shift, triple-product series and simple zeros supply all divisions below. Define `kroneckerSummand q x y z s t=q^(st)y^s z^t/(1−xq^(s+t))` for integer s,t; `kroneckerDoubleKernel` is its sum over s,t≥0 minus its sum over s,t<0. Define `kroneckerCyclicTerm` T and `kroneckerCorrection` C by
```text
T(x,y,z;q) = P(xy;q²)P(q²/(xy);q²)P(q;q)² /
             [P(x;q)P(y;q)P(q/x;q)P(q/y;q)P(q²;q²)]
             · Σ_(k∈Z) (−1)^k q^(k²)(xy)^k/(1+q^(2k)z),
C(x,y,z;q) = 2P(q²;q²)³
             · ∏_(a∈{xy,xz,yz}) P(a;q²)P(q²/a;q²) /
             [∏_(a∈{x,y,z}) P(a;q)P(q/a;q)P(−a;q²)P(−q²/a;q²)].
```
The products indexed by braces retain multiplicity. Their API is exchange of x,y in T, permutation invariance of C, absolute summability of the kernel and bilateral series on compact sets avoiding poles, and meromorphic continuation of the cyclic combination. For 0<|q|<1, |q|<|y|,|z|<1, x≠0, x∉q^Z, and x,y,z∉−q^(2Z), prove `kronecker_double_identity`: the kernel equals T(x,y,z;q)+T(x,z,y;q)+T(y,z,x;q)−C(x,y,z;q). The last exclusions ensure that each separately displayed quotient is defined; continuation removes the apparent negative-even-power poles in their combination. (Mortenson2016, Theorem 1.1, pp.2–3, and §§2–5, pp.4–11.)

**Checks.**

- P(0;q)=1, P(a;0)=1−a and P(1;q)=0. The factor at index zero cannot be omitted.
- For a≠0, J(a;0)=1−a; J(1;q)=0 and J(q;q)=0 when |q|<1. These distinguish the q/a factor from a/q.
- At (q,x,y,z)=(1/2,1/3,2/3,3/4), the summand at (s,t)=(0,0),(1,0),(−1,−1) is respectively 3/2,4/5,−3. The negative quadrant is subtracted after this signed denominator evaluation.
- The total kernel definitions at q=0 give respectively 1,3/2,7/2 for (x,y,z)=(0,0,0),(1/3,0,0),(1/3,1/2,1/2). These boundary computations do not extend the theorem's nonzero-q domain.
- At q=0, T(1/3,2/3,3/4), T(1/3,3/4,2/3), T(2/3,3/4,1/3) are 2,27/10,9/2. The distinct values pin the cyclic positions and bilateral zero term.
- At q=0, C(0,0,0), C(0,0,1/2), C(1/3,2/3,3/4) are 2,8/3,27/10. The initial factor two and the negative-argument products both affect these values.

Then prove `kronecker_double_identity` in the annulus |q|<|x|,|y|,|z|<1: express the same-sign triple sum by summing its first geometric series. The resulting double series and the three Appell–Lerch terms plus theta quotient have identical residues at x=q^k and x=−q^(2k). The single identity and Appell difference identity cancel their apparent poles. Their entire difference on C* obeys H(q²x)=xq/(yz)H(x). Its Laurent coefficients satisfy C_k=(yz)^(-k)q^(−k²)C_0, incompatible with convergence on any annulus unless C_0=0; all coefficients vanish. Let x=y=z approach −1 radially from inside the annulus. The three Appell terms each contribute half the cubed theta product and the remaining quotient contributes minus twice that product. Separating the zero-index faces of the triple sum gives the displayed finite signed coefficients. Use locally uniform convergence before extracting a positive coefficient. (Mortenson, *A double-sum Kronecker-type identity*, arXiv:1601.01913v2, Theorem 1.1 and §§2–5, pp.4–11; *A Kronecker-type identity and the representations of a number as a sum of three squares*, arXiv:1702.01627v2, Theorem 1.2, (1.8), and §3, pp.6–7.)

**Binary classes and the unit exceptions.** Define `PositiveBinaryForm D` by integer coefficients (a,b,c), a>0 and b²−4ac=D<0; `PositiveBinaryForm.value q (x,y)=ax²+bxy+cy²`, and `PositiveBinaryForm.IsPrimitive` means gcd(a,b,c)=1. Define `properBinaryEquivalent q r` by an SL₂(Z) matrix g with r(x)=q(gx). The induced `properBinarySetoid` is the equivalence relation on primitive forms; `properBinaryClass D` is its primitive subset modulo determinant-one integral changes of variables. The API includes the action, discriminant and gcd invariance, reduction |b|≤a≤c with nonnegative b on the boundary, finiteness, and the cardinal h(D). `binaryFormIdealCorrespondence` sends a primitive form to the oriented ideal generated by a and (−b+√D)/2 in the order of discriminant D, with its norm form divided by the ideal norm as inverse. Verify the two compositions after scaling the ideal and changing an oriented basis. Define `binaryFormUnitCount q` as the cardinal of the determinant-one integral stabilizer. Its API proves finiteness, invariance under proper equivalence, and identifies that stabilizer with the order's norm-one unit group; quotienting by the central ±1 leaves size w(D)/2.

**Checks.**

- D=−4 has the single primitive class (1,0,1), with w=4 and Hurwitz weight 1/2.
- D=−3 has the single class (1,1,1), with w=6 and weight 1/3.
- D=−23 has three primitive classes, represented by (1,1,6),(2,1,3),(2,−1,3); w=2. The last two distinguish determinant-one equivalence from unrestricted changes of basis.
- The values of (1,0,1) at (1,2), (1,1,1) at (1,1), and (2,−1,3) at (1,1) are 5,3,4. The first two forms are primitive; (2,0,2) of discriminant −16 is not.
- Proper equivalence is reflexive, and (a,b,c) is properly equivalent to (c,−b,a) using the determinant-one quarter turn. At −23, (2,1,3) and (2,−1,3) are not properly equivalent. These test the relation and its setoid, independently of class cardinality.

`binary_class_well_count` proves the primitive class count directly. Use the SL₂(Z) generators to identify classes with oriented topographs; the elementary climbing rule makes each positive topograph have a unique well. At a vertex well its outgoing edges satisfy −D=ef+eg+fg. For odd D the three edges are odd with gcd one. For even D divide the even edges by two; their gcd is one and they are not all odd. An edge well has b=0 and −D=4ac. Strictly ordered triples give two orientations; two equal edges give one; the all-equal vertex and equal-sided edge give precisely the unit exceptions. Dropping the gcd condition weights these last cases by 1/3 and 1/2. Partition the signed coefficient sum by edge equality and parity to get r₃(n)=12H(4n) for n≡1,2 mod4, r₃(n)=12(H(4n)−2H(n)) for n≡3 mod8. The residue-square computation gives zero at 7 mod8 and reduction by four when 4|n. Removing common divisors by square-divisor Möbius inversion gives the primitive formulas; for square-free n every vector is primitive. (O'Sullivan, *Topographs for binary quadratic forms and class numbers*, arXiv:2408.14405v3, §§3.3,4.3, Theorems 5.1–5.4 and Lemma 5.5/Theorem 5.6, pp.14–17.)

Finally `quadratic_order_conductor_two` proves h(−4n)=3h(−n) for square-free n>3 with n≡3 mod8. For O of discriminant −n and R=Z+2O, establish the exact sequence O*→(O/2O)*/(Z/2Z)*→Pic(R)→Pic(O)→1 by extending prime-to-two ideals and contracting them, with the kernel represented by principal O-ideals and their residue units. Here O/2O=F₄ and the residue quotient has order three. For n>3 all units are ±1 and have trivial residue, giving the ratio three. At n=3 the extra units map onto F₄*, so h(−12)=h(−3)=1 instead; compute r₃(3)=8 separately. At n=1 the weight 1/2 gives r₃(1)=6. This supplies the exceptional factors 24/w and 48/w in `gauss_three_square_class_number`. (O'Sullivan, Lemma 5.7, pp.17–18, for the required conductor specialization; the ideal-kernel argument above is the proof target.)

**The ineffective three-square lower bound.** Define `ternaryFundamentalDiscriminant n` for positive square-free n by −n if n≡3 mod4 and −4n otherwise. Prove `gauss_three_square_class_number`: r₃(n)=24h(d)/w(d) for n≡1,2 mod4; r₃(n)=48h(d)/w(d) for n≡3 mod8; and r₃(n)=0 for n≡7 mod8. Here h is the class number of primitive positive binary forms and w is the number of units of the imaginary quadratic order. Identify these classes with ideal classes using the explicit oriented ideal/binary-form correspondence; the two inverses and stabilizers are part of the target, including d=−3,−4. Prove `quadraticClassNumberFormula`: L(1,χ_d)=2πh(d)/(w(d)√|d|). Its analytic input is the degree-two specialization of the positive theta integral and residue formula in the mass analytic targets; the ideal-class regrouping uses the existing number-field ideal class group and unit results.
(Source: O'Sullivan, Theorems 5.1–5.6 and Lemma 5.7, pp.14–18; Mortenson, Theorem 1.2 and §3, pp.6–7, for the counting identity; Siegel 1935, p.83, for the analytic class-number formula.)
Prove `siegelQuadraticLowerBound`: for every ε>0 there is c_ε>0 such that L(1,χ_d)≥c_ε|d|^(−ε) for all fundamental quadratic d. Construct the nonnegative ideal-theta integral for fields of degrees two and four and its pole term (Siegel Hilfssatz 1, p.84). Its zero-term lower bound gives Hilfssatz 2, p.85; the biquadratic Euler factorization is Hilfssatz 3, p.85; partial summation gives L(1,χ_d)<3log|d| for |d|>1, Hilfssatz 4, p.86. If arbitrarily small values existed, fix one such discriminant with a real zero σ close to one. Apply the positive-integral lower bound to its biquadratic compositum with each different quadratic field, and bound the other two L-values above. The discriminant inequality |disc(Q(√d,√D))|≤|dD|² gives the lower bound for all sufficiently large D; finitely many smaller values are positive. The selection of the fixed exceptional discriminant is non-effective. Deduce `siegelLowerBound_r3` with r₃(n)≥c_ε n^(1/2−ε) on the admissible positive square-free sequence.
(Source: Siegel, *Über die Classenzahl quadratischer Zahlkörper*, Acta Arithmetica 1 (1935), pp.83–86, Hilfssätze 1–4 and the concluding argument on p.86.)
**Checks.**

- At n=1,2,3, the discriminants are −4,−8,−3 and the representation counts are 6,12,8; the exceptional unit factors 4 and 6 cannot be replaced by 2.
- At n=7 the count is zero, so no positive lower bound is asserted.
- n=4 is not square-free. The stated class-number formula is not applied to it, although its sphere still has six lattice points.

**Rational ternary restriction.** Prove `irrational_indefinite_ternary_restriction`: for n≥3 and nondegenerate indefinite q on Rⁿ irrational up to scalar, there is a rational n×3 matrix A with injective real linear map such that q∘A is nondegenerate, indefinite and irrational up to scalar. Nondegeneracy and signature are open in the frame, so rational density first gives a regular indefinite rational three-frame (u₁,u₂,u₃), with q(u_j)≠0. Suppose every such rational restriction were proportional to a rational form. Fix its scale c and vary u₁ to u₁+tv for any rational v and sufficiently small rational t. The unchanged nonzero value q(u₂) forces the scale of every varied restriction to differ from c by a rational factor. Thus q(u₁+tv)/c is rational at three distinct rational t. Interpolating its quadratic polynomial makes q(v)/c rational. Since v was arbitrary, polarization on rational coordinate vectors makes every coefficient of q/c rational, a contradiction. Clear denominators of A before comparing integer-value sets; q(AZ³)⊂D⁻²q(Zⁿ), and rescaling preserves density. This proof does not assume a prescribed isotropic rational plane exists.
**Checks.**

- For n=3 the identity restriction preserves each of the three hypotheses. For diag(1,1,−√2), its values at e₁ and e₃ rule out rationality up to scalar.
- diag(1,1,−1) is nondegenerate and indefinite, but fails irrationality; multiplying it by √2 still fails irrationality up to scalar.
- A zero form fails nondegeneracy and indefiniteness. A binary form has no injective ternary frame, and a positive-definite form has no indefinite restriction.

**Maximal ternary orthogonal subgroup.** Prove `ternary_orthogonal_maximal_in_sl3`: for a nondegenerate real ternary form of signature (2,1) or (1,2), H=SO(q)⁰ is generated by one-parameter unipotents, and a connected Lie subgroup H≤L≤SL₃(R) is either H or SL₃(R). In isotropic real coordinates, identify H with PSL₂(R) on Sym²(R²). Upper and lower elementary unipotents generate it. Split sl₃ into the q-skew part h and the q-self-adjoint trace-zero part S₀. The latter is the highest-weight-four module: its weights are −4,−2,0,2,4 and adjacent raising/lowering coefficients are nonzero. Import irreducibility of V(4) and Sym² decomposition from LieHighestWeight Layer 0; construct the explicit intertwiner for this q. Therefore any intermediate Lie algebra has quotient either zero or S₀. LieGroups Layer 4 identifies connected subgroups with the resulting Lie algebras. Over R all nondegenerate indefinite ternary forms are conjugate up to sign and scale, so the statement is independent of the chosen isotropic coordinates.
**Checks.**

- For diag(1,1,−1), dim h=3, dim sl₃=8 and dim S₀=5. Adding a nonzero S₀-vector generates the full quotient, rather than a codimension-one intermediate algebra.
- A definite ternary group is compact and fails the unipotent-generation assertion. A degenerate ternary form fails the decomposition, so neither branch includes it.
- In dimension four, SO(2,2) has a different representation decomposition; the dimension-three maximality statement supplies no general-dimensional shortcut.

**Arithmetic obstruction to a closed ternary orbit.** Prove `lattice_orthogonal_rational_form`: if q is nondegenerate indefinite ternary and SO(q)⁰∩SL₃(Z) is a lattice, q is proportional to a rational form. Apply `borel_density_zariski` to identify its real Zariski closure with SO(q). Because every lattice matrix has rational entries, each finite-degree evaluation kernel of its vanishing ideal has a rational basis; scalar extension gives exactly the real evaluation kernel. Thus SO(q) is defined over Q. Its rational Lie algebra defines rational linear equations AᵀB+BA=0 on symmetric matrices B. The real solution space is the one-dimensional invariant-form line of the irreducible Sym² representation (the preceding explicit intertwiner). A rational linear system of real nullity one has a nonzero rational solution, hence q is a real scalar multiple of it.
**Checks.**

- For q=x²+y²−z², its orthogonal arithmetic group has finite covolume by AA.3; this agrees with rationality. Scaling q by any nonzero real number leaves its orthogonal group unchanged and must not change the conclusion.
- The form x²+y²−√2z² is irrational up to scalar. Its integral orthogonal subgroup therefore cannot be a lattice in SO(q)⁰.
- The one-dimensional invariant-form line is essential: for a trivial matrix group all symmetric matrices are invariant and no particular irrational form can be recovered from rational group data.

Prove `indefinite_quadratic_surjective`: an indefinite real quadratic form assumes every real value by scaling a positive or negative witness, including zero at the origin. Apply 4.2.4 to the H-orbit of the standard lattice. The maximal-subgroup theorem leaves a closed H-orbit or a dense SL₃-orbit; the arithmetic obstruction excludes the closed branch for irrational q. The dense lattice orbit makes HZ³ dense in R³ (approximate a chosen nonzero vector by first columns of determinant-one frames). Since q is H-invariant, continuity and the preceding surjectivity give dense integer values. The rational ternary restriction then proves the statement for n>3.
(Source: Morris, Corollary 20.2.5, pp.410–411, for the Ratner reduction; the explicit rational-restriction, matrix-module and rational-descent arguments above supply the auxiliary calculations that reduction requires. Their library inputs are LieGroups Layers 2 and 4, LieHighestWeight Layer 0, AA.3 arithmetic finite volume, `borel_density_zariski` and rational Gaussian elimination.)

4.3.1. Prove that for n≥3, a real nondegenerate indefinite quadratic form q on R^n that is not proportional to a form with rational coefficients has q(Z^n) dense in R.
Nondegeneracy, indefiniteness, dimension≥3 and irrationality up to scalar are all retained.
(Source: Morris2015v6, Corollary 20.2.5 and three-variable proof, printed pp.410–411.)
*Needs:* 4.2.4, `irrational_indefinite_ternary_restriction`, `ternary_orthogonal_maximal_in_sl3`, `lattice_orthogonal_rational_form` and `indefinite_quadratic_surjective`.
**Checks.**

- An integral form has discrete values and is excluded.
- Positive-definite forms do not have values dense in all R.
- The n=2 form x²−(3+2√2)y² shows why dimension≥3 is required.

4.3.2. Prove As n→∞ through positive square-free integers n not congruent to 7 modulo 8, the normalized counting measure on {v/√n:v∈Z³,‖v‖²=n} converges to normalized rotation-invariant surface measure on S².
The representation set is nonempty on the stated admissible sequence by `siegelLowerBound_r3`. No effective constant is claimed: the representation-number lower bound is ineffective.
(Source: Duke 1988, Introduction, printed p.74, before Theorem 1.)
*Needs:* `ternaryHarmonicTheta_cuspidal`, `halfIntegralCoefficientBound`, and `siegelLowerBound_r3`. Divide the weighted coefficient by n^(ℓ/2)r₃(n): the remaining exponent is −1/28+2ε, hence negative for ε<1/56. Nonconstant spherical harmonics therefore have mean tending to zero; constants have mean one. Their polynomial span is dense in C(S²), by Mathlib Stone–Weierstrass, giving weak convergence of probability measures.
**Checks.**

- n≡7 mod8 has no three-square representations and is excluded.
- A measure on primitive representations for nonsquare-free n is a different theorem.

### 4.4 Packing, covering and transference

Define `latticePackingRadius` (4.4.1): for a positive-dimensional full Euclidean lattice L, its packing radius is half the attained shortest nonzero norm. In dimension zero set it to zero.
Full rank and positive dimension are retained; zero dimension has a separate radius-0 convention.
Its API is `latticePackingRadius` (Half the attained first Euclidean minimum, zero in rank zero.); `latticePackingRadius_eq_half` (In positive rank it is half the first Euclidean minimum.); `latticePackingRadius_smul` (functoriality: Positive scalar multiplication multiplies the packing radius by that scalar.).
(Source: Benoist2019, Physical pp.5–7 quotient/lattice conventions.)
*Needs:* Mathlib `ZLattice.covolume`, 1.2 `successiveMin_first_le_iff`.
**Checks.**

- For aZ in R, a>0, the packing radius is a/2.
- For Z² the packing radius is 1/2.
- In dimension zero the packing radius is zero.

Define `latticeCoveringRadius` (4.4.2): for a full Euclidean lattice L, μ(L)=sup_x inf_{v∈L} ‖x−v‖. It is the maximum of the continuous periodic distance-to-L function on the compact quotient; dimension zero gives zero.
Finite-dimensional real Euclidean ambient space; L is discrete and spans the ambient space.
Its API is `latticeCoveringRadius` (Supremum of the distance-to-lattice function.); `latticeCoveringRadius_attained` (A point in a compact fundamental domain attains the radius.); `latticeCoveringRadius_smul` (functoriality: Positive scalar multiplication multiplies μ by the same scalar.).
(Source: Regev2004, p.2, Definition 2 and Example 1.)
*Needs:* Mathlib `ZLattice.covolume`, `Metric.infEDist`, 1.2 `successiveMin_first_le_iff`.
**Checks.**

- For aZ in R with a>0, μ=a/2.
- For Z², μ=√2/2, larger than its packing radius 1/2.
- In dimension zero μ=0; a non-full-rank subgroup in positive dimension can have infinite ambient covering radius.

4.4.3. Prove that for a full real Euclidean lattice L and symmetric convex body K with nonempty interior, λ_i(K,L)·λ_{n+1−i}(K°,L*)≥1 for 1≤i≤n, where K° is the inner-product polar and L* the pairing-integral dual.
Use the same inner-product and intrinsic dimension on both sides. The sharp upper transference and covering bounds require separate source theorems; they are not exported by this elementary lower bound.
(Source: Lenstra–Lenstra–Lovász 1982, Proposition 1.11 uses the same integral-coefficient norm floor; transference is a separate deduction from the polar pairing, not an attributed LLL theorem.)
*Needs:* 1.2 `exists_successiveMin_witnesses`, 0.3 `covolume_dual`.
**Checks.**

- For L=Z^n and K=product_i[-a_i,a_i], a_i>0, the polar is the cross-polytope sum_i a_i|y_i|<=1. The ordered minima of K are sorted reciprocals 1/a_i and those of its polar are sorted a_i, so the oppositely indexed products equal one.
- An arbitrary real pairing has no integer ≥1 floor.

Define `latticeGaussianSum` (4.4.4): for s>0 define ρ_s(x)=exp(-π||x||²/s²) and ρ_s(L+u)=Σ_{x∈L}ρ_s(x+u), using the countable sum of real values.
Its API is `latticeGaussianSum` (The countable Gaussian sum on the lattice subtype.); `latticeGaussianSum_zeroRank` (The sum in rank zero is 1.); `latticeGaussianSum_translate` (Integral shifts preserve the sum.); `latticeGaussianSum_scale` (Simultaneous positive scaling of L,u,s preserves the sum.).
(Source: Regev2004, Lecture 11, Definition 2, p.2 and Poisson identities p.3.)
**Checks.**

- For rank zero the sum is 1.
- For L=aZ and s=a the unshifted sum equals that for Z at s=1.
- For u∈L the shifted sum equals the unshifted sum.

4.4.5. Prove that for a full discrete lattice and s>0, the Gaussian and every polynomial-weighted Gaussian are absolutely summable over lattice translates.
(Source: Regev2004, Lecture 11 p.3, justification required for its Poisson use.)
*Needs:* 4.4 `latticeGaussianSum`.

4.4.6. Prove ρ_s(L+u)=covol(L)^(-1)s^n Σ_{y∈L*}ρ_(1/s)(y) exp(2πi<y,u>); in particular ρ_s(L)=covol(L)^(-1)s^nρ_(1/s)(L*).
(Source: Regev2004, Lecture 11 p.3, equations preceding Lemma 5.)
*Needs:* 4.4.5, 0.3 `covolume_dual`.

4.4.7. Prove that for every translate u, ρ_s(L+u)≤ρ_s(L).
(Source: Regev2004, Lecture 11 Lemma 5, p.3.)
*Needs:* 4.4.6.

4.4.8. Prove that for s≥1, ρ_s(L+u)≤s^nρ_1(L).
(Source: Regev2004, Lecture 11 Lemma 6, p.3.)
*Needs:* 4.4.7, 4.4.6.

4.4.9. Prove that for n≥1, the sum of ρ_1 over (L+u) outside the open radius-√n ball is at most c^nρ_1(L), where c=2 exp(-3π/4)<1/4.
(Source: Regev2004, Lecture 11 Lemma 7, p.4.)
*Needs:* 4.4.8.

4.4.10. Prove that for n≥1, if λ₁(L)>√n, put R=ρ_1(L\{0}). Then R≤c^n/(1-c^n), with c as in the shifted-tail lemma.
(Source: Regev2004, Lecture 11 Corollary 8, pp.4–5; explicit-constant strengthening.)
*Needs:* 4.4.9.

4.4.11. Prove that for every u, |ρ_1(L*+u)-covol(L)|≤covol(L)R, where R=ρ_1(L\{0}).
(Source: Regev2004, Lecture 11 Lemma 9, p.5.)
*Needs:* 4.4.6.

4.4.12. Prove that for n≥1, if λ₁(L)>√n, then no translate of L* can avoid the closed √n-ball. The lower estimate 1-R and upper estimate c^n(1+R) contradict each other since c^n<1/3.
(Source: Regev2004, Lecture 11 Theorem 4, pp.5–6.)
*Needs:* 4.4.10, 4.4.11, 4.4.9.

4.4.13. Prove that for a full rank-n Euclidean lattice L, n≥1, and 1≤i≤n, λ_i(L)λ_(n+1−i)(L*)≤n, where L* is defined by integral inner products and both bodies are the Euclidean unit ball.
The n constant here is Euclidean; it is not asserted for arbitrary polar convex bodies.
(Source: Banaszczyk, *New bounds in some transference theorems in the geometry of numbers*, Theorem 2.1 and proof, printed pp.631–632.)
*Needs:* `shortVectorSpan`, `gaussianCharacteristic`, `gaussian_variable_tail`, `gaussian_characteristic_poisson`, `gaussian_short_spans_contradiction` below, and 1.2 `successiveMin_smul_body` and `successiveMin_linearEquiv`: apply the latter to multiplication by c to obtain λ_i(cL,K)=cλ_i(L,K), and the dual lattice identity (cL)*=c^(−1)L*. For n≥3, a product greater than n permits a positive rescaling with λ_i(L)>3√n/4 and λ_(n+1−i)(L*)>4√n/3. The dimensions of the two short-vector spans then sum to at most n−1. Their common perpendicular supplies the contradiction below. In dimension one the product is exactly one. In dimension two, a Gauss-reduced basis gives each paired product at most 2/√3: write the second vector as a component of absolute value at most half the first length plus its perpendicular height, and use the reciprocal basis. These are separate low-dimensional proof branches; the n≥3 Gaussian constants are not used there.
**Checks.**

- For aZ in R, the product is one.
- For Zⁿ, each product is one and is at most n.
- For the fixed `hexagonalLattice` generated by (1,0),(1/2,√3/2), both Euclidean minima are one, both reciprocal minima are 2/√3, and its covolume is √3/2. The paired product is 2/√3>1; square-lattice controls alone would miss a false constant one in dimension two. The point (0,1) is not in this lattice. Its API gives discrete/full instances, the displayed basis and reciprocal basis, and these minima/covolume identities, by m²+mn+n²≥1 for nonzero integers (m,n).

**Short-vector spans.** Define `shortVectorSpan L r` as the real span of the lattice vectors with norm strictly less than r. Its API is monotonicity in r, compatibility with positive rescaling, and `shortVectorSpan_dim_lt_minimum`: if r<λ_i(L), its dimension is at most i−1, using the one-based index. Construct a vector of prescribed positive norm perpendicular to two such spans whenever their dimension sum is less than n. This is a linear-algebra dimension argument and uses no discreteness of the sum of the two lattices.
(Source: Banaszczyk, proof of Theorem 2.1, p.631, the subspaces M and N.)
**Checks.**

- For Z in R, threshold 1 gives the zero span; the inequality in the definition is strict.
- For Z in R, threshold 2 gives all of R.
- A nonpositive threshold gives the zero span, also in rank zero.

**Gaussian characteristic function.** Define `gaussianCharacteristic L u` as the Gaussian-weighted cosine sum divided by ρ_1(L): Σ_(x∈L) exp(−π‖x‖²) cos(2π⟨x,u⟩)/ρ_1(L). Absolute summability and ρ_1(L)≥1 justify this real characteristic function. Its API gives value 1 at zero, invariance under translating u by L*, and `gaussian_characteristic_poisson`: it equals ρ_1(L*+u)/ρ_1(L*). The reciprocal lattice and the inner product are exactly those of 4.4.6.
(Source: Banaszczyk, §1, equation (1.2), p.627, and Theorem 2.1, pp.631–632.)
**Checks.**

- In rank zero the value is 1, since the Gaussian measure has its sole atom at zero.
- For Z in R, the value at 1 equals the value at 0.
- For Z in R, the value at 1/2 is strictly less than 1: the odd lattice points have cosine −1 and positive Gaussian weight.

**Gaussian variable tail.** Prove `gaussian_variable_tail`: for n≥1 and c≥(2π)^−1/2, the unshifted Gaussian mass at norm at least c√n is at most b(c)^nρ_1(L), where b(c)=c√(2πe)exp(−πc²). Apply the Gaussian scale bound with scale √(2πc²) and compare each summand on the tail; optimize the resulting exponential factor. In particular b(3/4)^n<3/20 for n≥3. This is the sharper unshifted bound needed here; 4.4.9 supplies the translated tail at radius √n.
(Source: Banaszczyk, Lemma 1.5(i) and proof, p.630.)

**Two short spans contradiction.** Prove `gaussian_short_spans_contradiction`: for a full lattice of rank n≥3, if the real spans of its vectors of norm <3√n/4 and of its reciprocal's vectors of norm <4√n/3 have dimension sum <n, there exists u of norm 1/√3 with `gaussianCharacteristic L u`>7/10 and ρ_1(L*+u)/ρ_1(L*)<2/5. The first inequality uses that the cosine is 1 on the first span and at least −1 elsewhere. For the second, split L* into the subgroup generated by its short vectors and its complement. Orthogonality factors the first part by exp(−π/3); the complement translated by u has norm at least √n and is bounded by 4.4.9. Check exp(−π/3)+(2exp(−3π/4))^n<2/5 for n≥3. The Poisson identity equates the two quantities, giving a contradiction. The existence assertion deliberately exposes the incompatible estimates for the subsequent proof by contradiction.
(Source: Banaszczyk, Theorem 2.1, equations (9)–(13) and conclusion, pp.631–632.)

4.4.14. Prove that for a full rank-n Euclidean lattice L, n≥1, 1/2≤μ(L)λ_1(L*)≤n. The upper constant n is the uniform estimate proved in Regev’s lecture.
Full rank, positive dimension and the actual Euclidean reciprocal lattice.
(Source: Regev2004, p.2, Claim 3 and Theorem 4.)
*Needs:* 4.4 `latticeCoveringRadius`, 4.4.3, 4.4.12.
**Checks.**

- For aZ in R the product is 1/2.
- For Zⁿ the product is √n/2.
- An asymptotic 0.1275+o(1) constant from Aggarwal–Stephens-Davidowitz is not a uniform small-rank constant.

### 4.5 Star bodies, critical determinants and Mahler compactness

Define `CompactStarBody.ofGauge` (4.5.1): A compact star body is specified by a continuous positive homogeneous function p:V→R_{≥0} with p(x)=0 iff x=0, p(t x)=t p(x) for t≥0, and compact unit sublevel K={p≤1}. Convexity is not assumed. Nonzero lattice avoidance and critical determinants use this body, rather than the convex-body API without its hypotheses.
Finite-dimensional real V; the compactness/properness condition is explicit. The body contains a neighborhood of zero.
Its API is `CompactStarBody.ofGauge` (The actual continuous definite homogeneous gauge and compact unit sublevel.); `CompactStarBody.radial` (Positive radial scaling is governed by p(tx)=t p(x).); `CompactStarBody.admissible` (data: No nonzero lattice point in the interior.); `CompactStarBody.convexComparison` (When the unit sublevel is convex, compare to the ConvexBody.).
(Source: Benoist2019, Mahler statement physical p.7 motivates compactness.)
**Checks.**

- The Euclidean norm gives a convex star body.
- p(x,y)=(√|x|+√|y|)² gives a compact nonconvex star body: (1,0),(0,1) lie in it but their midpoint does not.
- A gauge vanishing along a nonzero ray fails the stated definiteness/compactness conditions.

Define `criticalDeterminant` (4.5.2): for a compact star body K in finite-dimensional Euclidean E (including rank zero), Δ(K) is the infimum of covolumes of full discrete Z-lattices L with (int K)∩L={0}, equivalently p_K(x)≥1 for all nonzero lattice vectors (`int K` is the interior, not the polar body). A critical lattice attains this infimum.
Its API is `criticalDeterminant` (Infimum over admissible full lattices.); `criticalDeterminant_le_covolume` (Δ(K)≤covolume(L) for each admissible full L.); `criticalDeterminant_mono` (Body inclusion K⊂H implies Δ(K)≤Δ(H).); `criticalDeterminant_smul` (Δ(aK)=a^n Δ(K), a>0.).
(Source: Mahler 1946, §6, Definition 3 and Theorems 6–7, printed pp.158–159.)
*Needs:* 4.5 `CompactStarBody.ofGauge`.
**Checks.**

- For p(x)=|x| on R, Δ=1 and Z is critical.
- For p(x)=|x|/2 on R, Δ=2 and 2Z is critical.
- For the Euclidean rank-zero convention Δ=1, the zero lattice is critical; the positive-dimension positivity proof is not used.

4.5.3. Prove that there is ρ>0 such that the Euclidean open ball B(0,ρ) lies in the strict gauge sublevel p<1.
(Source: Mahler 1946, §6, proof of Theorem 6, printed p.158.)
*Needs:* 4.5 `CompactStarBody.ofGauge`.

4.5.4. Prove that there exists an admissible full lattice for every bounded star body: scale an orthonormal Z-basis lattice past a bound for its unit sublevel.
(Source: Mahler 1946, Worker orthonormal-basis construction from compact boundedness; background Definition 3 and Theorem 6, §6 printed p.158.)
*Needs:* 4.5 `CompactStarBody.ofGauge`.

4.5.5. Prove that in positive dimension, Δ(K)>0: every admissible lattice has covolume at least the Minkowski threshold for an interior Euclidean ball.
(Source: Mahler 1946, §6, Theorem 6, printed p.158.)
*Needs:* 4.5 `criticalDeterminant`, 4.5.3, Mathlib `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` and its compact `le` form.

4.5.6. Prove that there is a sequence of admissible lattices whose covolumes converge to Δ(K), bounded above by a fixed positive number and with every shortest nonzero vector at least ρ.
(Source: Mahler 1946, §7, proof of Theorem 8, printed pp.158–159.)
*Needs:* 4.5.5, 4.5.4, 4.5.3.

4.5.7. Prove that if bases b_m converge to an independent basis b and their integer spans are K-admissible, then the integer span of b is admissible.
(Source: Mahler 1946, §7, proof of Theorem 8, printed p.159; asymmetric gauge extension uses the same argument.)
*Needs:* 4.5 `CompactStarBody.ofGauge`.

4.5.8. Prove that for n≥2 and X_n=SL_n(R)/SL_n(Z), the closed set of covolume-one lattices whose shortest nonzero norm is at least epsilon>0 is compact. A subset is relatively compact iff its first minimum is uniformly bounded below away from zero.
Covolume normalization and closedness for compactness are explicit. Relative compactness does not require the subset itself to be closed.
(Source: Benoist2019, Fact 1.5, physical p.7.)
*Needs:* 1.5 `minkowski_second_upper`, AdelicAlgebraicGroups AA.3.
**Checks.**

- diag(t,t^−1)Z² escapes compact sets as t→∞ because its first minimum tends to 0.
- A nonclosed subset with a uniform first-minimum bound is relatively compact, but need not be compact.

4.5.9. Prove that every compact star body in finite-dimensional Euclidean space has a critical full lattice.
(Source: Mahler 1946, §7, Theorem 8 and its complete proof, printed pp.158–159.)
*Needs:* 4.5.6, 4.5.8, 4.5.7.

### 4.6 Siegel’s mean value theorem

4.6.1. Prove that for n≥2, invariant probability μ on X_n=SL_n(R)/SL_n(Z), and integrable f:R^n→R, its lattice transform Σ_{v∈L\{0}}f(v) is integrable on X_n and its μ-integral equals the Lebesgue integral of f. For nonnegative measurable f the Tonelli version permits infinity.
Zero vectors are excluded; μ has total mass 1 and lattices have covolume 1. n=1 is excluded. Integrability of the lattice transform is a theorem, not an assumption silently imported from integrability of f.
(Source: Siegel, *A mean value theorem in geometry of numbers*, theorem and equation (2), p.341; proof §§4–6, pp.342–346.)
*Needs:* AdelicAlgebraicGroups AA.2 and AA.3, `siegelTransform` below, `siegel_reduction_majorant`, `siegel_primitive_unfolding`, `siegel_dilation_limit`. Prove `siegel_reduction_majorant`: for bounded compactly supported Riemann-integrable f, the transforms t^nΣ_(v≠0)|f(tv)|, 0<t≤1, have a common integrable majorant on a reduced fundamental domain (Siegel §4, lemma, pp.343–344). Prove `siegel_dilation_limit` by lattice Riemann sums and dominated convergence. Prove `siegel_primitive_unfolding` using the stabilizer of the first column and the decomposition of every nonzero integer vector as a positive integer times a primitive vector; its scalar factor is ζ(n), finite precisely for n≥2 (Siegel §§5–6, pp.344–346). Unfolding makes the averaged dilated transform independent of t; the dilation limit determines its value. Extend from test functions to nonnegative measurable functions by equality of measures and monotone convergence, and then to L¹ by positive and negative parts. The majorant proves transform integrability; it is not a hypothesis.
**Checks.**

- Including v=0 adds f(0) and changes the formula.
- In dimension one the single lattice Z does not give the Lebesgue mean-value formula.

**Lattice transform.** Define `siegelTransform L f` as Σ_(v∈L\{0})f(v). Its API gives additivity when the summands are summable, positivity for nonnegative f, and the measurable quotient descent under integral basis change; the theorem supplies L¹ descent for integrable f on R^n.
**Checks.**

- The zero lattice has transform zero, even when f(0)≠0.
- For Z in R and f the indicator of [−1/2,1/2], the transform is zero while the Lebesgue integral is one; this pins the n=1 exclusion.
- For Z and the indicator of [−1,1], the transform is two, excluding the origin.

### 4.7 Lattices from codes

4.7.1. Prove that for a linear code C⊂F_p^n, take the Construction A lattice of AlgebraicCodingTheory Layer 6 and identify its unscaled real realization {x∈Z^n:x mod p∈C} with covolume p^{n−dim C}. The rescaled realization p^−1/2L has covolume p^{n/2−dim C}; unimodularity/integrality/evenness require the cited roadmap’s exact self-duality and parity hypotheses.
p is prime and C is linear; no code-distance statement alone supplies integral Gram conditions. Construction A itself is owned by AlgebraicCodingTheory layer 6.
(Source: AlgebraicCodingTheory Layer 6, Construction A index and discriminant; real covolume follows from the index and scalar-dilation identities of Layer 0.)
AlgebraicCodingTheory Layer 6 proves the discriminant `m^n/(#C)²` and the duality `P_m(C)^∨ = P_m(C^⊥)`; the statement here is only the real covolume of the unscaled and rescaled realisations.
*Needs:* Mathlib `ZLattice.covolume`, AlgebraicCodingTheory Layer 6.
**Checks.**

- For the zero code, the unscaled lattice is pZ^n and has covolume p^n.
- For the whole code it is Z^n with covolume 1.

### Examples

For `d≥2`, `ℤ^d` and the cube `[−1,1]^d` Henk’s bound gives `#(L ∩ K) = 3^d < 2^{d−1} · 3^d`. For `d=1` the proposed strict inequality is equality; for `d=0` the lattice-point count is one. The binary form `x² − (3+2√2)y²` has no nonzero value in `(−1,1)`, so its values are not dense. To check this, put `a=|x|`, `b=|y|`, `α=1+√2`, `α′=1−√2`. For a nonzero integer pair, `N=a²−2ab−b²` is a nonzero integer and `|x²−α²y²|=|N|(a+αb)/(a−α′b)≥1`. A claim that the value set is discrete is stronger and is not needed. `n ≡ 7 (mod 8)` has no representation as a sum of three squares and is excluded from Duke’s sequence. For `d≥1`, the packing radius of `ℤ^d` is `½` and its covering radius is `√d/2`, so the product of the covering radius with the first minimum of the dual is between `½` and `d`. The zero code gives the lattice `pℤ^n` of covolume `p^n`; the full code gives `ℤ^n`.

### Dependencies

Layers 0, 1 and 3; RepresentationTheory/LieGroups Layer 2 for the closed-subgroup theorem and the matrix groups; AdelicAlgebraicGroups AA.2 and AA.3 for the invariant measures and finite volume of `SL_n(ℝ)/SL_n(ℤ)`; AlgebraicCodingTheory Layer 6; Mathlib `Metric.infDist`, `Real.Gamma`, the Gaussian integral and the `ZMod` counting API.

## Layer 5: Certified LLL reduction

This layer is the Lenstra–Lenstra–Lovász reduction with every step certified: the exact Gram–Schmidt coefficients `μ_{ij}` over an ordered real basis, the reduced-basis condition with `δ = 3/4`, the approximation factor `2^{(n−1)/2}` for the first vector, and an algorithm whose output comes with an integer change-of-basis certificate that is checked against the input lattice. The elementary transitions (a nearest-integer shear, an adjacent swap) are separate lemmas with explicit formulas for the new orthogonalised vectors and coefficients (5.2); termination is proved from the integer prefix-Gram potential, which strictly decreases at every swap, together with the cursor position in a lexicographic measure (5.3); the assembled reduction and its verification theorem are 5.4. Floating-point output is never a proof here: all Gram data is exact and rational.

### 5.1 Gram–Schmidt coefficients and reduced families

Define `lllCoefficient` (5.1.1): for a real inner-product space and a family b:Fin n→V, set μ_{ij}=⟨b_i,b*_j⟩/‖b*_j‖² using the ordered gramSchmidt b. Reduced-basis theorems require linear independence so denominators for relevant j are nonzero; the total function still uses the zero-division convention.
Indices are zero based; size reduction concerns j<i only. Exact rational Gram data is retained for certified arithmetic; floating approximations do not discharge inequalities.
Its API is `lllCoefficient` (The Gram–Schmidt inner-product ratio.); `lllCoefficient_eq` (Evaluation equals the stated ratio.); `lllCoefficient_orthogonal` (Off-diagonal coefficient is zero for an orthogonal family.); `lllCoefficient_denominator_pos` (Independent input gives a strictly positive squared denominator.).
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.2)–(1.3), physical p.2.)
*Needs:* Mathlib `InnerProductSpace.gramSchmidt`, `InnerProductSpace.gramSchmidt_ne_zero`.
**Checks.**

- For b=((1,0),(1/2,1)) the coefficient μ₁₀ is 1/2.
- For an orthogonal family, off-diagonal reduction coefficients vanish.
- For dependent input b*_j can be zero; the total coefficient does not certify a reduced basis.

Define `IsLLLReduced` (5.1.2): An LLL-reduced family at δ=3/4 is linearly independent, has |μ_{ij}|≤1/2 for j<i, and for each adjacent j<i with i=j+1 satisfies ‖b*_i‖²≥(3/4−μ_{ij}²)‖b*_j‖². A basis of the input lattice is required separately by output certificates.
The equality boundary is accepted; swaps occur for strict failure. The empty family is reduced by vacuity; positive-rank approximation statements assume n≥1.
Its API is `IsLLLReduced` (The concrete independence, size and Lovász predicate.); `IsLLLReduced.linearIndependent` (Return independence.); `IsLLLReduced.size` (Return |μ_{ij}|≤1/2 for j<i.); `IsLLLReduced.lovasz` (Return the adjacent δ=3/4 inequality.).
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.4)–(1.5), physical pp.2–3.)
*Needs:* 5.1 `lllCoefficient`.
**Checks.**

- The standard orthonormal basis is reduced.
- The basis ((2,0),(0,1)) has size coefficients zero but fails the Lovász condition.
- The dependent family ((1,0),(2,0)) is not reduced even when a zero-denominator convention makes some inequalities vacuous.

5.1.3. Prove that for an LLL-reduced family and j<i, ‖b*_j‖²≤2^{i−j}‖b*_i‖².
Fin-index differences are ordinary nonnegative integer differences.
(Source: Lenstra–Lenstra–Lovász 1982, Proof of Proposition 1.6, physical p.3.)
*Needs:* 5.1 `IsLLLReduced`.
**Checks.**

- For orthonormal input the right-hand side is at least the left-hand side.
- The exponent is an index difference, not the full ambient dimension.

5.1.4. Prove that for n≥1 and an LLL-reduced basis b of a full real Euclidean Z-lattice L, every nonzero x∈L satisfies ‖b₀‖²≤2^{n−1}‖x‖². Equivalently b₀ is within factor 2^{(n−1)/2} of the shortest nonzero vector.
L-membership is in the exact integer span of b, not the real span. This is an approximation bound; it does not assert exact SVP or CVP.
(Source: Lenstra–Lenstra–Lovász 1982, Proposition 1.11 and its proof, physical p.4.)
*Needs:* 5.1 `IsLLLReduced`, 5.1.3.
**Checks.**

- For n=1 the factor is 1 and the basis vector is shortest.
- Replacing integer coordinates by real coefficients destroys the lower bound on the last nonzero coefficient.

### 5.2 Change-of-basis certificates and the elementary transitions

Define `UnimodularBasisCertificate.ofMatrices` (5.2.1): A certificate for input b and output c consists of U,V∈Mat_n(Z), UV=VU=I, and c_i=Σ_j U_{ji}b_j. Columns are output coordinates in the input family. This proves equality of integer spans and determinant ±1; determinant −1 is allowed.
Input and output families have the same dimension; an input real basis gives an output basis. The certificate matrices are integral, not arbitrary rational or real inverses.
Its API is `UnimodularBasisCertificate.ofMatrices` (Supply actual integral inverse matrices and the exact output coordinates.); `UnimodularBasisCertificate.span_eq` (The input and output Z-spans are equal.); `UnimodularBasisCertificate.det_unit` (det U is 1 or −1.); `UnimodularBasisCertificate.trans` (functoriality: Compose certificates by matrix multiplication with the correct column order.).
(Source: Lenstra–Lenstra–Lovász 1982, reduction algorithm following (1.15), size reductions and adjacent swaps, physical pp.5–7; certificate format is a worker verification interface.)
*Needs:* Mathlib `Matrix.det_mul`.
**Checks.**

- The coordinate swap [[0,1],[1,0]] has determinant −1 and is a valid certificate.
- diag(2,1) is not an integer-invertible basis change.
- A floating matrix approximately inverting U does not inhabit this certificate.

5.2.2. Prove that for t∈R put r=floor(t+1/2). Then -1/2≤t-r<1/2; in particular |t-r|≤1/2. This fixes ties deterministically.
(Source: Lenstra–Lenstra–Lovász 1982, §1, size reduction in (1.18), printed p.31 (physical p.5); the floor tie choice is the convention here.)

5.2.3. Prove Replacing b_i by b_i-r b_j, j<i and r∈Z, has integral inverse replacing that column by b_i+r b_j; the two coordinate matrices multiply to the identity.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34).)
*Needs:* 5.2 `UnimodularBasisCertificate.ofMatrices`.

5.2.4. Prove that for independent b and j<i, subtracting an integral multiple r b_j from b_i preserves every Gram–Schmidt vector.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34).)
*Needs:* 5.1 `lllCoefficient`, 5.2.3.

5.2.5. Prove that for c_i=b_i-r b_j and c_k=b_k otherwise, μ(c)_ij=μ(b)_ij-r; for ℓ<j, μ(c)_iℓ=μ(b)_iℓ-r μ(b)_jℓ; coefficients in every other row, and in row i at j<ℓ<i, agree.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34).)
*Needs:* 5.2.4.

5.2.6. Prove Process j=i-1,...,0 using the nearest-integer shear. Already bounded coefficients with index greater than j stay bounded; the final row i satisfies all |μ_ij|≤1/2.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34).)
*Needs:* 5.2.2, 5.2.5.

5.2.7. Prove Swapping adjacent columns i,j=i+1 gives an integral involutive coordinate matrix and hence a unimodular certificate.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34).)
*Needs:* 5.2 `UnimodularBasisCertificate.ofMatrices`.

5.2.8. Prove Write u=b*_i, v=b*_j, a=μ_ji, B=||u||²,C=||v||²,T=C+a²B. For the adjacent swap c, c*_i=v+a u and ||c*_i||²=T>0.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.22), printed p.32.)
*Needs:* 5.1 `lllCoefficient`, 5.2.7.

5.2.9. Prove that in the same notation c*_j=(C/T)u-(a B/T)v, ||c*_j||²=BC/T, and μ(c)_ji=a B/T; T is positive.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.22), printed p.32.)
*Needs:* 5.2.8.

5.2.10. Prove that for k>j, μ(c)_kj=μ(b)_ki-a μ(b)_kj and μ(c)_ki=μ(b)_kj+(aB/T)μ(c)_kj. Orthogonalized vectors outside i,j are unchanged; earlier coefficients of rows i,j are interchanged.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.22), printed p.32.)
*Needs:* 5.2.9.

### 5.3 The integer potential and termination

Define `lllIntegerPotential` (5.3.1): for independent integer-column input in Euclidean R^n, let d_i be the determinant of the Gram matrix of the first i vectors, d₀=1, and D=∏_{1≤i<n} d_i. Each d_i is a positive integer; in ranks 0 and 1 the empty potential is 1.
The metric is the standard integral Gram metric, or a specified positive-definite rational Gram metric cleared by a common denominator. For arbitrary real Gram data integrality of the potential is not claimed.
Its API is `lllIntegerPotential` (Product of positive integral Gram-prefix determinants.); `lllIntegerPotential_pos` (The potential is a positive integer for independent integral input.); `lllIntegerPotential_sizeReduce` (An integer shear within the relevant prefix preserves the potential.); `lllIntegerPotential_swap` (A strict Lovász-failing adjacent swap decreases the potential by a factor strictly below 3/4.).
(Source: Lenstra–Lenstra–Lovász 1982, (1.23)–(1.25), physical pp.7–8.)
*Needs:* Mathlib `Matrix.gram`, `Matrix.det_mul`.
**Checks.**

- The standard basis has all prefix determinants and potential equal to 1.
- A rational metric with denominator 2 needs a fixed rescaling; its original determinants are not asserted to be integers.
- In ranks 0 and 1 the empty potential is 1, and no adjacent swap exists.

5.3.2. Prove that for independent b and 0≤k≤n, d_k=det Gram(b_0,...,b_(k-1))=∏_{i<k}||b*_i||²>0, including d_0=1.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.24)–(1.25), printed p.33.)
*Needs:* 5.1 `lllCoefficient`.

5.3.3. Prove that if every original Gram entry is integral, each d_k is a positive integer. Integral shears and swaps preserve integral Gram entries.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.23)–(1.25), printed pp.33–34; integral-Gram extension of the coordinate-integer source setting.)
*Needs:* 5.3.2, 5.2 `UnimodularBasisCertificate.ofMatrices`.

5.3.4. Prove that for j<i, replacing b_i by b_i-r b_j preserves every d_k and therefore D=∏_{k=0}^{n-1}d_k.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34).)
*Needs:* 5.2.4, 5.3.2.

5.3.5. Prove that for j=i+1 only d_j changes under the adjacent swap, and its ratio is T/B. Thus D(c)=(T/B)D(b).
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34).)
*Needs:* 5.2.8, 5.2.9, 5.3.2.

5.3.6. Prove that if C<(3/4-a²)B then 0<T/B<3/4 and 4D(c)<3D(b). For integral Gram data D is a positive integer, so D(c)<D(b).
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34).)
*Needs:* 5.3.5, 5.3.3.

5.3.7. Prove At outer index 1≤k≤n, all pairs in the prefix b_0,...,b_(k-1) satisfy size and Lovász inequalities. A swap at k after reducing μ_k,k-1 preserves this invariant at max(1,k-1); a successful descending reduction extends it to k+1.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.16)–(1.21), printed pp.31–33.)
*Needs:* 5.2.6, 5.2.10.

5.3.8. Prove Outer transitions for n≥2 strictly decrease the lexicographic pair (D,n-k): swaps decrease D; successful passes increase k at fixed D. The finite descending shear loop terminates separately. The rank-zero and rank-one algorithms terminate immediately.
(Source: Lenstra–Lenstra–Lovász 1982, §1, termination argument (1.23)–(1.25), printed pp.33–34.)
*Needs:* 5.3.6, 5.3.4, 5.3.7.

### 5.4 The reduction and its verification

Construct `exactLLL` (5.4.1): Given a nonsingular integer basis matrix (or rational input cleared by a common denominator) in the standard Euclidean metric, compute a reduced output basis together with an exact unimodular-basis certificate. Use nearest-integer size reduction and strict Lovász-failing adjacent swaps at δ=3/4.
Rank 0 and rank 1 return immediately with the identity certificate. Rounding ties use a fixed nearest-integer rule satisfying distance≤1/2. The polynomial complexity theorem is not supplied here; its proof continues beyond the selected p.8 source slice.
Its API is `exactLLL` (Return output coordinates, reducedness and the exact integer inverse certificate.); `exactLLL_certificate` (Recover the original-lattice certificate.); `exactLLL_reduced` (Recover the exact size and Lovász tests.); `exactLLL_shortVector` (For positive rank, the first vector satisfies the proven approximation inequality in the original lattice.).
(Source: Lenstra–Lenstra–Lovász 1982, reduction algorithm following (1.15), updates (1.22), Figure 1, termination proof, physical pp.5–8.)
*Needs:* 5.1 `IsLLLReduced`, 5.2 `UnimodularBasisCertificate.ofMatrices`, 5.3 `lllIntegerPotential`, 5.2.2, 5.2.6, 5.3.7, 5.3.8, 5.2.3, 5.2.7.
**Checks.**

- Input columns (2,0),(0,1) require a swap; the returned certificate may have determinant −1.
- Rank zero returns an empty reduced basis and empty identity matrices.
- An output without a proven Lovász condition is rejected even if short in floating-point arithmetic.

5.4.2. Prove that if a certified output c is LLL-reduced and b is an independent input basis of L, then c₀∈L is nonzero and for every nonzero x∈L, ‖c₀‖²≤2^{n−1}‖x‖², for n≥1.
The metric used by reduction and verification is the same exact Euclidean or specified rational Gram metric. Arithmetic height, relation exclusion and representation conditions are consumer-owned inputs.
(Source: Lenstra–Lenstra–Lovász 1982, Proposition 1.11 plus exact shear/swap lattice preservation, physical pp.4–8.)
*Needs:* 5.2 `UnimodularBasisCertificate.ofMatrices`, 5.1 `IsLLLReduced`, 5.1.4.
**Checks.**

- A verified certificate includes both original membership and the approximation factor.
- A short vector in the real span but outside the integer span cannot pass verification.

### Examples

The basis `(1,0), (1/2,1)` has `μ_{10} = 1/2` and is already reduced; `(1,0), (0,1)` has `μ_{10} = 0`. The basis `(1,0), (1,1)` size-reduces by the shear `b_1 ↦ b_1 − b_0` with certificate `U = [[1,−1],[0,1]]`. The basis `(2,0), (1,1)` fails the Lovász condition at `δ = 3/4` and a swap strictly decreases the potential. The output of the reduction on a rank-one lattice is its generator, with factor `1`.

### Dependencies

Layer 0 (Gram determinants) and Layer 1 (the first minimum); Mathlib `InnerProductSpace.gramSchmidt`, `gramSchmidt_ne_zero`, `Matrix.SpecialLinearGroup`, `Int.floor` and `round`, `Polynomial` for the potential arithmetic.

## Layer 6: Hermitian K-theory of exact categories

This layer is Schlichting’s hermitian K-theory of exact categories, built on Tau Ceti’s intrinsic exact structures: a strong duality on a category and on an exact category (6.2), symmetric spaces, Lagrangians, hyperbolic spaces and isotropic reduction (6.2–6.3), the Grothendieck–Witt and Witt groups in degree zero with the forgetful and hyperbolic maps (6.4), the hermitian Q-construction and the Grothendieck–Witt space as a homotopy fibre with its higher groups (6.5), cofinality (6.6), the hermitian cone, suspension, delooping and the nonconnective hermitian spectrum (6.7), formations as the loop-space presentation (6.8), localisation for Dedekind rings with the residue duality line (6.9), the source-scoped periodicity and number-ring comparisons (6.10) and the integral tables (6.11). The ordinary K-theory and homotopical inputs the layer consumes are stated as its own targets in 6.1, against Tau Ceti’s `ExactStructure` and `ExactK0` and Mathlib’s nerve, geometric realisation and homotopy groups. No invertibility of `2` is assumed except where a target says so.

### 6.1 Ordinary K-theory and homotopical inputs

The constructions of this layer need Quillen’s Q-construction and K-groups of an exact category, Waldhausen’s S-construction with its delooping, the nonconnective K-theory spectrum obtained by suspension, geometric realisation of nerves, Quillen’s Theorems A and B, and the group completion of a symmetric monoidal groupoid. None of these is in Mathlib or Tau Ceti beyond `ExactK0`, `CategoryTheory.nerve` and `SSet.toTop`, so they are targets here, stated for the exact categories of Tau Ceti’s `ExactStructure`.

Define `quillenQ E` (6.1.1) for an exact category `E`: the objects are those of `E`, a morphism `X → Y` is an isomorphism class of spans `X ↞ Z ↣ Y` with an admissible deflation on the left and an admissible inflation on the right, and composition is by pullback of the inflation along the deflation, which is again admissible by Tau Ceti’s exact axioms. Prove `quillenQ.ofSpan_eq_iff` (two spans represent the same morphism exactly when they are isomorphic over `X` and `Y`), `quillenQ.comp_ofSpan`, `quillenQ.id_ofSpan` and associativity, and use the image of a chosen zero object of `E` as the distinguished basepoint of the nerve. It is generally not a categorical zero object of `quillenQ E`. (Source: Quillen, *Higher algebraic K-theory I*, §2, the definition of `QM` and the paragraph following it.) *Needs:* Tau Ceti `ExactStructure`, GrothendieckEulerForms Layer 0, Mathlib `IsPullback`.
**Checks.**

- The two spans `X ↞ X ≅ Y` and `X ≅ Y ↣ Y` attached to an isomorphism `X ≅ Y` represent the same morphism of `quillenQ E`.
- `Hom(0, X)` is in bijection with the isomorphism classes of admissible inflations `Z ↣ X` (every `Z ↠ 0` is an admissible deflation), so it is a singleton exactly when `X` has no admissible subobject other than `0`; for `X = 0` it is a singleton, and for a nonzero vector space in the split structure it is not.
- In the split exact structure on finite-dimensional vector spaces, every subquotient `X ⊇ A ⊇ B` gives the morphism `A/B → X` and the morphism also retains the chosen identification with the source. Two spans are equal precisely under the equivalence of spans, rather than merely when their quotient objects are abstractly isomorphic.

Define `exactKGroup E n` (6.1.2) as the homotopy group `π_{n+1}(|N(quillenQ E)|, 0)`, using Mathlib’s `CategoryTheory.nerve`, `SSet.toTop` and `HomotopyGroup`, and prove `exactKGroup_zero_iso`, the isomorphism `exactKGroup E 0 ≃ ExactK0 E` of Tau Ceti (Quillen §2, Theorem 1), `exactKGroup_map` (functoriality for conflation-exact functors) and `exactKGroup_prod` (products of exact categories). (Source: Quillen, *Higher algebraic K-theory I*, §2, Theorem 1 and the definition of `K_i` following it; §3 for products.) *Needs:* 6.1.1, Tau Ceti `ExactK0`, Mathlib `CategoryTheory.nerve`, `SSet.toTop`, `HomotopyGroup`.
**Checks.**

- `exactKGroup E 0` is generated by the classes `[X]` subject to `[Y] = [X] + [Z]` for every conflation, through `exactKGroup_zero_iso`.
- The zero exact category has `exactKGroup 0 n = 0` for every `n`.
- For a field `k`, `exactKGroup (finite-dimensional k-spaces) 0 ≃ ℤ` by dimension.

Prove `nerveRealization_homotopy` (6.1.3): a natural transformation `F ⇒ G` of functors between small categories induces a homotopy between `|N F|` and `|N G|`; `nerveRealization_contractible_of_initial`: a category with an initial or terminal object has contractible realisation; `quillenTheoremA`: if every comma category `f/Y` is contractible then `|N f|` is a homotopy equivalence; and `quillenTheoremB`: if every base change `Y → Y'` induces a homotopy equivalence `f/Y → f/Y'`, then `|N(f/Y)|` is the homotopy fibre of `|N f|` over `Y`, with the long exact sequence. (Source: Quillen, *Higher algebraic K-theory I*, §1, Theorem A, Theorem B and the corollaries preceding them.) *Needs:* Mathlib `CategoryTheory.nerve`, `SSet.toTop`, `CategoryTheory.Comma`, `ContinuousMap.Homotopy`.
**Checks.**

- Theorem A applied to the identity functor is the identity equivalence.
- A functor with a right adjoint satisfies the hypothesis of Theorem A, since `f/Y` has the terminal object determined by the counit `f(RY)→Y`. For a left adjoint, the corresponding under-comma category instead has an initial object.
- The projection `E × E' → E` of nerves of exact categories has homotopy fibre `|N E'|` by Theorem B.

6.1.4. Define Waldhausen’s `waldhausenS E` for an exact category `E` (the simplicial category of filtered objects `0 = X_0 ↣ X_1 ↣ ⋯ ↣ X_n` with chosen admissible quotients `X_j/X_i`), prove the additivity theorem, the comparison `|N(quillenQ E)| ≃ |N(iS_• E)|`, and the identification of `exactKGroup E n` with `π_n` of the K-theory space `Ω|N(iS_• E)|`. Here `iS_n E` is the groupoid of isomorphisms in `S_n E` and the displayed realisation is the diagonal of its bisimplicial nerve. The iterated construction gives the additional delooping `|N(iS_• E)| ≃ Ω|N(iS_• S_• E)|`; this is a different statement from the Q-comparison. (Source: Waldhausen, *Algebraic K-theory of spaces*, §1.3 for `S.`, §1.4 Theorem 1.4.2 for additivity, §1.5 for iterated delooping and §1.9 for the comparison with the Q-construction, printed pp.375–376 (physical pp.57–58).) *Needs:* 6.1.1–6.1.3.
**Checks.**

- `S_0 E` is the trivial category and `S_1 E` is `E`.
- Additivity: the two functors `S_2 E → E` sending a conflation to its outer terms induce, with the total object, a homotopy equivalence `|wS.S_2 E| ≃ |wS.E| × |wS.E|`.
- For finite-dimensional spaces over a field, `|N(QE)|` is connected, while `π₀ Ω|N(iS_• E)|=ℤ`; equating these two spaces would lose a loop. The comparison gives `π₁ |N(QE)|=π₁ |N(iS_• E)|=K₀(E)`.

6.1.5. For an idempotent complete exact category `E`, construct Schlichting’s suspension `SE = CE/E` through the countable envelope `CE` of admissible-inflation sequences, with `Hom((A_i),(B_j))=lim_i colim_j Hom_E(A_i,B_j)` and its induced exact structure. Prove the filtering hypotheses needed to construct the exact quotient; flasqueness alone is insufficient. Use this envelope, prove that `K(CE)` is contractible by the Eilenberg swindle, that `K(E) → ΩK(SE)` is a homotopy equivalence on the idempotent completion, and define `nonconnectiveKSpectrum E` with `π_{−n} = K₀(̃SⁿE)` for `n≥1`, where the tilde denotes idempotent completion. Its degree-zero group is `K₀(̃E)`. (Source: Schlichting2004, Topology 43 (2004), Definition 3.3 and Theorem 3.4; the author’s *Higher Algebraic K-Theory*, §§2.4.3–2.4.6, printed pp.181–183, gives the envelope, quotient, negative-group convention and vanishing statement.) *Needs:* 6.1.4, GrothendieckEulerForms Layer 0.
**Checks.**

- The negative K-groups of a field, and more generally of a regular noetherian ring, vanish.
- `π_0` of the spectrum is `ExactK0 E` for idempotent complete `E`.
- The hermitian cone of 6.7 maps to `CE` by forgetting the duality, and the hyperbolic comparison of 6.7 is a map of spectra.

6.1.6. For a symmetric monoidal groupoid `M` construct the group completion `groupCompletion M` as a Segal Γ-space, prove `groupCompletion_pi0` (its `π_0` is the Grothendieck group of the monoid of isomorphism classes) and the group-completion theorem on homology: for the topological monoid model of `|N M|`, require centrality of `π₀ M` in its Pontryagin homology ring and identify `H_*(M)[(π₀M)⁻¹]` with `H_*(ΩBM)`. Orthogonal sum supplies the required commutativity. For a **split exact** category with duality `E`, prove that the group completion of the isometry-class monoid maps isomorphically to `π₀ GW(E)=GW₀(E)` of 6.5, using Schlichting’s stable metabolic cancellation. For arbitrary exact `E`, the metabolic relations of 6.4 are additional relations and this comparison is not asserted. (Source: Segal1974, Topology 13 (1974), §§1–2, Proposition 1.4 and the symmetric-monoidal-category construction of §2, printed pp.296–300; McDuff–Segal, *Homology fibrations and the group-completion theorem*, Invent. Math. 31 (1976), Proposition 1, printed p.279, with the homology-fibration construction of Proposition 2, p.280; Schlichting 2010, Lemma 2.9 and Corollary 2.10, printed pp.111–112.) *Needs:* 6.1.3, 6.4 (metabolic relations), Mathlib `CategoryTheory.MonoidalCategory`.
**Checks.**

- For the groupoid of finite sets under disjoint union the `π_0` is `ℤ`.
- The orthogonal sum is associative and commutative up to the coherence isomorphisms of 6.2, and these are what the Γ-space records.
- A groupoid with a single object and trivial automorphism group has contractible group completion.

### 6.1a Stable categories and spectra

**Stable infinity categories.** Define `StableInfinityCategory` on Mathlib `SSet.Quasicategory`: a small quasicategory, a zero object, finite limits and colimits, and the assertion that a square is a pushout iff it is a pullback. Use mapping Kan complexes and diagram limits in the quasicategory, not limits merely in its homotopy category. Exact functors preserve zero and finite colimits, equivalently finite limits. Its API supplies fibers, cofibers, suspension/loop inverse equivalences, biproducts and `stableMappingSpectrum`, with π_j Map(X,Y)=Hom_{hC}(Σ^j X,Y). Prove the homotopy-category comparison with native triangulated categories. Mathlib's `DerivedCategory` already owns ordinary derived categories; the new work is the enhancement and its higher mapping objects.
(Source: Lurie, *Higher Algebra*, Definition 1.1.1.9, pp.19–20, Proposition 1.1.3.4, p.31, and Theorem 1.1.2.14, p.27.)
**Checks.**

- The zero quasicategory is stable, with zero mapping spectra.
- In perfect complexes over Z, the cofiber of multiplication by two on Z[0] is the two-term complex [Z→²Z], quasi-isomorphic to (Z/2)[0]. A quotient in the category of projective modules alone would miss this object.
- Vector spaces viewed as a discrete enriched category are not stable: their categorical suspension is zero, so it cannot be an equivalence on a nonzero object.

**Spectra and stable equivalences.** Construct `Spectrum` as the homotopy limit of the loop tower of pointed Kan spaces, using the native simplicial-set carrier. Equivalently, an object is a coherently compatible sequence X_j with equivalences X_j≃ΩX_(j+1). Before spectrification, a prespectrum has structure maps ΣX_j→X_(j+1); its stable homotopy group in degree i is colim_j π_(i+j)X_j, beginning where i+j≥0. Localize prespectra at stable equivalences and prove equivalence with the loop-tower construction. The API is `spectrumHomotopyGroup`, `spectrumFiber`, `spectrumCofiber`, suspension by every integer, `omegaInfinity`, the sphere, Eilenberg–MacLane spectra, and the long exact sequence. Prove that these spectra form a stable infinity category and that a map is an equivalence iff all integer homotopy groups are isomorphisms. The ordinary K-spectrum of 6.1.5 and hermitian spectrum of 6.7.20 are interpreted by this carrier, with their stated structure maps.
(Source: Lurie, *Higher Algebra*, Proposition 1.4.2.24, pp.147–149, Corollary 1.4.2.17, p.146, and Definition 1.4.3.1, p.150.)
**Checks.**

- HZ has π₀=Z and all other homotopy groups zero.
- ΣHZ has π₁=Z and π₀=0; shifting a spectrum differs from changing a duality index.
- A constant sequence of noncontractible pointed spaces with identity maps is not automatically a spectrum: it lacks the required equivalences to the next loop space.

**C₂ actions, fixed points, orbits and Tate spectra.** Define `C2Spectrum` as a functor from BC₂, the nerve of the one-object group category, to spectra. Its coherences are part of the functor; an involution on π₀ alone is insufficient. Construct `spectrumHomotopyOrbits` as its colimit and `spectrumHomotopyFixedPoints` as its limit. The finite-group transfer defines `spectrumNorm` from orbits to fixed points; define `spectrumTate` as its cofiber. The API is naturality, restriction of trivial actions, the norm fiber sequence, finite-sum compatibility, and the orbit/fixed/Tate spectral sequences with their convergence hypotheses. For K-theory, contravariant perfect duality induces the action through the equivalence K(C^op)≃K(C); the bidual coherence proves that this is an actual C₂ action. Construct `c2Norm` and `c2Difference` on an abelian group with involution by 1+σ and 1−σ. Their alternating periodic complex computes the Tate groups of its Eilenberg–MacLane spectrum. This is also the calculation that fixes the sign convention used for skew duality.
(Source: Calmès et al. I, §1.1, Lemmas 1.1.9–10, pp.12–13; II, §4.4 and Corollary 4.4.13, for the compatible norm comparison.)
**Checks.**

- For trivial action on Z, norm is multiplication by two and difference is zero; HZ has Tate homotopy Z/2 in even degrees and zero in odd degrees.
- For σ=−1 on Z, norm is zero and difference is multiplication by two. The Tate parity is reversed.
- For trivial action on F₂ both maps are zero; for a Q-vector space the norm splits by 1/2 and the Tate spectrum is zero. Fixed points cannot be replaced by invariants without derived terms at two.

**Derived two-adic completion.** Define `spectrumTwoCompletion X=lim_a cofiber(2^a:X→X)`, a≥1, with the reduction transition maps. The API includes the completion map, exactness, idempotence, finite-sum compatibility and `twoAdicEquivalence`: a map whose cofiber is killed by this completion, equivalently an equivalence modulo two. Prove the Milnor exact sequence relating π_i of the limit to lim and lim¹ of the tower. Identify completion with the expected completed homotopy groups only with the required boundedness and Mittag–Leffler hypotheses. In the number-ring comparison the spectra are bounded below when the classical connective cover is used, and finite generation supplies the required homotopy-group comparison. Distinguish completion from localization at the odd integers and from inverting two.
(Source: Berrick–Karoubi–Schlichting–Østvær, Theorem 2.2 and Remark 2.3, pp.3–4, with the inverse-limit definition; Calmès et al. III, Theorem 3.1.7, pp.51–52.)
**Checks.**

- The completion of HZ is HZ₂; HZ localized at two has π₀=Z_(2), a different group.
- H(Z/3) completes to zero; H(Z/2) is already complete.
- A finite wedge commutes with homotopy fixed points. This does not assert that an infinite wedge commutes with a limit over BC₂.

### 6.1b K-theory of stable and finite-length categories

**Waldhausen infinity categories.** Define `WaldhausenInfinityCategory` on the quasicategory carrier of 6.1a, with a subcategory of ingressive arrows containing equivalences, a zero object, all arrows out of zero ingressive, and pushouts of ingressives existing and ingressive. Exact functors preserve these data. Define `infinityWaldhausenS` by diagrams on the arrow category of [n]: the diagonal objects are zero, horizontal arrows ingressive and each displayed quotient square a pushout. Its API is face/degeneracy functors, S₀=0, S₁=C, the outer-term/total-object additivity equivalence, and iterated S-delooping. Define `waldhausenInfinityKSpectrum` by the iterated realizations of the cores. On the nerve of an ordinary exact category this recovers 6.1.4; on a stable category every arrow is ingressive and its cofibers are the chosen quotients. Construct the canonical equivalence K(C^op)≃K(C) by reversing gap diagrams in the exact infinity-category structure. This is the coherent map used for the K-theory duality action. (Source: Barwick, *On exact ∞-categories and the Theorem of the Heart*, Recollection 1.2 and Definition 1.3, p.4; Definition 3.1, pp.6–7; Corollary 5.16.1, p.18. The S-construction and additivity extend the gap-diagram construction of 6.1.4 to homotopy pushouts.)

**Checks.**

- For the zero category every iterated realization is contractible.
- A two-step filtration 0→X→Y supplies [Y]=[X]+[cofiber(X→Y)] on K₀; in Perf(Z), the cofiber of 2:Z→Z gives [Z/2]=0.
- The nerve of projective Z-modules uses split injections as ingressives; the map 2:Z→Z is not one. In Perf(Z) it is ingressive. Using the first Waldhausen structure for the second category would omit its torsion cofibers.

**Fibration and the heart.** Prove `waldhausenInfinityFibration` for a subcategory wC containing equivalences and satisfying gluing for pushout cubes and enough cofibrations: the inclusions of ingressive weak arrows into weak arrows are realization equivalences for C, its arrow category and its category of ingressive arrows. Then K(C^w) is the fiber of K(C)→|K(B_•(C,wC))|, where C^w consists of objects whose arrow from zero is weak, and B_m consists of strings of weak arrows with objectwise ingressives. Prove the special localization form for a compactly generated category with an accessible localization preserving filtered colimits, whose equivalences are strongly generated by the compact equivalences. Its compact kernel supplies the fiber.

For a small stable C with bounded t-structure, prove `stableKHeartComparison`: K(C^♥)≃K(C), with its canonical inclusion map, in connective K-theory. Localize the Ind-category by the negative truncation, identify its compact kernel with the nonnegative half, and show the maximal Waldhausen structure on the negative half has zero K-theory: iterated truncated suspension kills each bounded object, and stabilization preserves K. To compare with the heart, pass to opposites and use the Waldhausen structure on the nonpositive half where ingressives are monomorphisms on π₀. For a weak map f:X→Y, factor it through fiber(Y→τ_(≤0)cofiber(f)); this gives functorial deformation retractions for all three enough-cofibrations tests. At every S-level, the truncation adjunction identifies the remaining weak-arrow realization with the maximal negative half, whose K-theory vanishes. The self-duality equivalence then returns the heart comparison. No assertion about arbitrary unbounded t-structures or negative K-groups follows from this theorem. (Source: Barwick, Theorems 6.1, 6.2 and 6.4 and complete proof, pp.19–22.) Needs 6.1a, the preceding construction, functor categories, compact generation and Ind-completion; the truncation/fiber constructions are the stable t-structure API.

**Checks.**

- For Perf(Z), the bounded t-heart is finitely generated Z-modules. Its resolution comparison identifies K with finite projectives; Z/2 has zero K₀ class there.
- The negative half must have the maximal Waldhausen structure in the vanishing argument; the structure with monomorphisms on π₋₁ instead has the K-theory of C.
- A zero bounded t-heart gives zero connective K; boundedness excludes a nonzero stable category with a degenerate t-structure and zero heart.

**Stable Verdier localization.** For a small stable category B and a full stable subcategory A closed under retracts in B, construct `stableVerdierQuotient B A` by inverting maps whose cofiber lies in A. Its API is the exact projection, kernel A, descent of exact functors annihilating A, and `stableVerdierMappingSpace`: Map_(B/A)(x,y)=colim_(y→y′)Map_B(x,y′), with cofiber(y→y′) in A. The indexing category is filtered. A pushout gives the left adjoint on the corresponding categories of roofs; realization of that adjunction proves the mapping formula. Two-out-of-six for these equivalences identifies the realization of their category with the core of B/A. For a finite poset I, prove Fun(I,B)/Fun(I,A)≃Fun(I,B/A): finite limits of mapping spaces commute with the filtered colimits, and induction on the height of I lifts its objects. No idempotent completion is included in this construction.

Prove `stableKVerdierLocalization`: the connective K-spectrum of 6.1b sends A→B→B/A to a fiber sequence. The core of the quotient is the realization of weak-arrow strings by the mapping-space result. Applying Q preserves this identification, since Q_k is a finite-poset diagram category; additivity then identifies the fiber. The map on K₀ is surjective because the projection is essentially surjective on objects. This last fact is needed to obtain a fiber sequence of connective spectra from the fiber sequence of their infinite loop spaces. Idempotent-completing the quotient can add K₀ classes and requires the cofinality theorem separately. (Source: Hebestreit–Lachmann–Steimle, arXiv:2205.06104, §6, Theorem 6.1, Proposition 6.2, Lemma 6.4, Propositions 6.6/6.8 and Theorem 6.9 with their proofs, pp.16–19.) Needs 6.1a, the Q/S comparison and additivity of 6.1b, filtered colimits of spaces and the coherent stable quotient.

**Checks.**

- A=0 gives B/A=B and identity on K; A=B gives the zero quotient and identity as its fiber map.
- For B=Perf(Z), the subcategory of complexes killed by tensoring with Z[1/2] gives quotient Perf(Z[1/2]); the cone of 2 becomes zero, while the cone of 3 does not.
- A subcategory closed under finite sums but not under retracts cannot be substituted for A: the kernel of localization is its stable retract closure. For a dense inclusion, the missing K₀ classes measure the cofinality correction.

**Finite-length K-dévis­sage.** For an essentially small abelian A and a nonempty full subcategory B closed under subobjects, quotients and finite sums, prove `finiteFiltrationKDevissage`: if every object has a finite B-filtration, K(B)→K(A) is an equivalence. The comma category of Q(B)→Q(A) over M is the poset of layers M₁/M₀ in B. If M′⊂M has B-quotient, intersection with M′ and adjoining M′ give a retraction and two natural transformations identifying the layer posets up to homotopy. Induct along a finite filtration and apply Quillen A. In a finite-length category, take B semisimple, decompose into finite-support sums of its simple isotypic parts, and identify each part by Hom from its simple object with vector spaces over the opposite endomorphism division ring. This proves K(A)≃⊕_s K(End(s)^op), with restriction-of-scalars maps. Combined with the bounded-heart theorem, it gives the ordinary K-input for 6.8a residue dévissage. (Source: Quillen, *Higher algebraic K-theory I*, §5 Theorem 4 and Corollary 1, printed pp.112–113, physical PDF pp.28–29 of the public Edinburgh scan.) Needs 6.1.1–6.1.4, the preceding heart comparison and ordinary abelian subquotients.

**Checks.**

- Finite abelian 2-groups have one simple object Z/2; dévissage gives their connective K-theory as K(F₂), not K(Z).
- Objects supported at 2 and 3 give K(F₂)⊕K(F₃); each object has finite support, even when the permitted set of primes is infinite.
- The subcategory of vector spaces of even dimension is not closed under subobjects; it misses the one-dimensional K₀ generator and does not qualify.

### 6.2 Dualities, symmetric spaces and Lagrangians

Construct `ExactCategoryDuality.ofExactFunctor` (6.2.1): on an TauCeti.ExactStructure on a preadditive category E, equip a strong duality D that is additive and sends each conflation X→Y→Z to the reversed dual conflation DZ→DY→DX. The coefficient sign −η gives the alternating variant when D is additive.
Use the completed intrinsic ExactStructure carrier and conflation-exact functors. No assumption 2 is invertible is required for this classical exact-category construction.
Its API is `ExactCategoryDuality.ofExactFunctor` (An additive conflation-exact strong duality on the exact category.); `ExactCategoryDuality.map_conflation` (functoriality: Reverse a conflation to its dual conflation.); `ExactCategoryDuality.sign` (The sign-twisted duality with double dual −η.).
(Source: Schlichting2010, Definition 2.1, Example 2.2 and §2.4, printed pp.109–110.)
*Needs:* Tau Ceti `TauCeti.ExactStructure`, Tau Ceti `TauCeti.ExactStructure.IsConflationExact`, Tau Ceti `TauCeti.ExactStructure.op`, Tau Ceti `TauCeti.ExactStructure.split`, Tau Ceti `Functor.IsInvolutiveDual` and `Functor.dualityEquivalence`, GrothendieckEulerForms Layer 0.
**Checks.**

- Finite projective R-modules with Hom_R(−,R) form the split exact example; arbitrary finite modules need not have invertible biduality.
- Over Z the hyperbolic symmetric plane is available without 1/2.
- Changing η to −η changes the symmetry equation and does not identify symmetric and quadratic refinements at 2.

Define `SymmetricSpace` (6.2.2): for strong duality (D,η), a symmetric space is (X,φ) with an isomorphism φ:X→DX satisfying D(φ)η_X=φ. A form-preserving map f:X→Y satisfies φ_X=D(f)φ_Y f; an isometry is such a map whose underlying morphism is an isomorphism.
Nondegeneracy is an isomorphism, not merely a separating form over a ring. Symplectic spaces use the sign-twisted duality; a quadratic refinement is additional data at dyadic coefficients.
Its API is `SymmetricSpace` (Object, pairing isomorphism and typed symmetry equation.); `SymmetricSpace.pairing` (The actual map X≅DX.); `SymmetricSpace.preserves` (Form-preservation is the displayed categorical equation.); `SymmetricSpace.preserves_id` (Identity preserves a symmetric space.); `SymmetricSpace.preserves_comp` (functoriality: The composite of form-preserving maps preserves the forms.).
(Source: Schlichting2010, Definition 2.4 and §3.1, printed pp.110,113.)
*Needs:* Tau Ceti `Functor.IsInvolutiveDual` and `Functor.dualityEquivalence`.
**Checks.**

- The rank-one pairing xy on Z is nondegenerate; 2xy is separating but not a pairing isomorphism over Z.
- The identity map preserves every symmetric space.
- A noninvertible form-preserving map is not called an isometry.

Define `SymmetricIsometry` (6.2.3): Isometry classes are the quotient of nondegenerate symmetric spaces by existence of an actual form-preserving categorical isomorphism.
Its API is `SymmetricIsometry` (data: A categorical isomorphism satisfying the pairing equation.); `symmetricIsometrySetoid` (Two spaces are related exactly when such an isometry exists.); `SymmetricIsometryClass` (The quotient by that setoid; its generator identifies precisely isometric spaces.).
(Source: Schlichting2010, §2.2, printed p.111.)
*Needs:* 6.2 `SymmetricSpace`.
**Checks.**

- A rank-one Z pairing xy is not isometric to 2xy, which is not perfect.
- The zero space has a single isometry class.
- Over Q, determinant square class separates ⟨1⟩ from ⟨2⟩.

Construct `orthogonalSum` (6.2.4): Orthogonal sum has carrier X⊕Y and the direct-sum pairing, transported across the additive duality biproduct isomorphism.
Its API is `orthogonalSum` (Construct the space on the actual categorical biproduct.); `orthogonalSum_carrier` (Its carrier is X.carrier⊕Y.carrier.); `orthogonalSum_assoc` (The canonical biproduct associator preserves the pairing.); `orthogonalSum_comm` (The biproduct swap is an isometry.).
(Source: Schlichting2010, §2.2, printed p.111.)
*Needs:* 6.2 `ExactCategoryDuality.ofExactFunctor`, 6.2 `SymmetricSpace`.
**Checks.**

- The sum of two rank-one unit forms over Z has diagonal Gram matrix (1,1).
- Zero is a unit up to isometry.
- Rank and determinant multiply in the usual block formula.

Construct `negativeSpace` (6.2.5): Negate the pairing isomorphism on the same object; additive duality preserves the symmetry equation.
Its API is `negativeSpace` (Negate the perfect pairing without changing the carrier.); `negativeSpace_carrier` (The underlying object is unchanged.); `negativeSpace_pairing` (The pairing hom is the negative of the original hom.); `negativeSpace_negative` (Double negation recovers the original pairing.).
(Source: Schlichting2010, §2.2, printed p.111.)
*Needs:* 6.2 `ExactCategoryDuality.ofExactFunctor`, 6.2 `SymmetricSpace`.
**Checks.**

- Negating ⟨1⟩ gives ⟨−1⟩ over Q.
- Negation twice recovers the original space.
- Negation preserves the zero space.

Define `ExactLagrangian.ofConflation` (6.2.6): A Lagrangian of (X,φ) is an admissible inflation i:L→X such that L→X→DL, with second map D(i)φ, is a conflation. Thus L is its own orthogonal, in the actual exact structure. A space is metabolic when a Lagrangian exists.
An arbitrary isotropic submodule is not automatically admissible. An exact Lagrangian specifies the quotient and conflation, not only a rank equality.
Its API is `ExactLagrangian.ofConflation` (A conflation L→X→DL with the displayed second map.); `ExactLagrangian.zero` (D(i)φi=0.); `ExactLagrangian.mapIsometry` (functoriality: An isometry transports the admissible Lagrangian.).
(Source: Schlichting2010, Definition 2.5, printed p.110.)
*Needs:* Tau Ceti `TauCeti.ExactStructure.split`, 6.2 `SymmetricSpace`, 6.2 `ExactCategoryDuality.ofExactFunctor`.
**Checks.**

- The first summand of the hyperbolic plane is a Lagrangian.
- 2Z⊂Z is not an admissible summand in the split exact category of projectives.
- An isotropic subobject of too small a rank is not a Lagrangian.

Construct `hyperbolicSpace` (6.2.7): for X in an exact category with duality, H(X) has underlying object X⊕DX and pairing matrix [[0,1],[η_X,0]] to DX⊕DDX, with its actual biproduct identifications. The inclusion of X is an admissible Lagrangian.
No division by 2 is used. The exact category’s split biproduct conflation is imported.
Its API is `hyperbolicSpace` (The biproduct with the off-diagonal perfect pairing.); `hyperbolicLagrangian` (The first summand is an admissible Lagrangian.); `hyperbolicSpace_sum` (Hyperbolic construction carries sums to orthogonal sums.).
(Source: Schlichting2010, After Definition 2.5, printed p.110.)
*Needs:* 6.2 `ExactCategoryDuality.ofExactFunctor`, 6.2 `SymmetricSpace`, 6.2 `ExactLagrangian.ofConflation`.
**Checks.**

- Over Z, H(Z) has Gram [[0,1],[1,0]] and is even unimodular.
- H(0) is the zero symmetric space.
- H(X⊕Y) is isometric to H(X)⊥H(Y).

6.2.8. Prove that for a symmetric space X in an exact category with strong exact duality, the diagonal X into X orthogonally summed with -X is an admissible Lagrangian.
The diagonal Lagrangian proof uses the actual perfect pairing and split exactness of its short sequence.
(Source: Schlichting2010, §2.2 and Lemma 2.8, printed pp.111–112.)
*Needs:* 6.2 `SymmetricSpace`, 6.2 `ExactLagrangian.ofConflation`, 6.2 `negativeSpace`, 6.2 `orthogonalSum`.
**Checks.**

- For a one-dimensional field form <a>, the diagonal line in <a> orthogonal-sum <-a> has zero pairing and is the Lagrangian.

### 6.3 Isotropic reduction

Define `ExactIsotropicSubobject` (6.3.1): Store L→L-perp→X, the quotient L-perp→Q and the two conflations L→L-perp→Q and L-perp→X→DL. The composite L→X is an inflation. The second outgoing map is obtained from the actual pairing and dual inclusion.
Its API is `ExactIsotropicSubobject` (data: The two actual conflations, inclusion and quotient maps.); `ExactIsotropicSubobject.totalInclusion` (The composite admissible inclusion L→X.); `ExactIsotropicSubobject.quotientMap` (The specified admissible quotient L-perp→Q.).
(Source: Schlichting2010, Lemma 2.6, printed pp.110–111.)
*Needs:* 6.2 `ExactCategoryDuality.ofExactFunctor`, 6.2 `SymmetricSpace`.
**Checks.**

- L=0 in a perfect field space gives Q=X.
- A Lagrangian gives Q=0.
- The image 2Z inside the first summand of H(Z) does not qualify in the projective split exact structure.

6.3.2. Prove that in an exact category a map of conflations with isomorphisms on both ends is an isomorphism in the middle.
(Source: Schlichting2010, Lemma 2.6 proof, printed p.111; elementary exact-category comparison.)
*Needs:* 6.2 `ExactCategoryDuality.ofExactFunctor`.

6.3.3. Prove that the restricted pairing on L-perp factors uniquely through the admissible quotient in both variables to a map Q→DQ.
(Source: Schlichting2010, Lemma 2.6 proof, printed p.111.)
*Needs:* 6.3 `ExactIsotropicSubobject`, 6.2 `ExactCategoryDuality.ofExactFunctor`.

6.3.4. Prove that the descended quotient pairing satisfies the strong-duality symmetry equation.
(Source: Schlichting2010, Lemma 2.6 proof, printed p.111.)
*Needs:* 6.3.3.

6.3.5. Prove that the descended quotient pairing is an isomorphism.
(Source: Schlichting2010, Lemma 2.6 proof, printed p.111.)
*Needs:* 6.3.3, 6.3.2.

6.3.6. Prove that the graph L-perp→X⊕−Q given by its inclusion and quotient is an admissible Lagrangian.
(Source: Schlichting2010, Lemma 2.6 proof, printed pp.110–111.)
*Needs:* 6.3.5, 6.2 `ExactLagrangian.ofConflation`.

Construct `isotropicReduction` (6.3.7): for an admissible totally isotropic L⊂X with L⊂L⊥ also an inflation, there is a unique nondegenerate symmetric form on L⊥/L pulling back to the restricted form.
Both admissibility conditions are retained. The quotient is the exact-category quotient of the specified conflation.
Its API is `isotropicReduction` (The unique induced perfect symmetric quotient form.); `isotropicReduction_pullback` (Its pullback is the restricted pairing.); `isotropicReduction_isometry` (functoriality: An isometry carrying one admissible isotropic subobject to another induces an isometry of their perfect quotient forms.).
(Source: Schlichting2010, Lemma 2.6 and complete proof, printed pp.110–111.)
*Needs:* 6.3 `ExactIsotropicSubobject`, 6.3.4, 6.3.5.
**Checks.**

- For L=0 the quotient is X and X⊥−X is metabolic.
- For a Lagrangian L the quotient L⊥/L is zero.
- For a nonadmissible inclusion the quotient construction cannot be invoked.

6.3.8. Prove that for the admissible isotropic subobject L and induced perfect quotient form of isotropic-reduction, X orthogonally summed with the negative quotient form is metabolic, with admissible Lagrangian L-perp mapped by inclusion and quotient.
Both admissibility conditions are retained. The quotient is the exact-category quotient of the specified conflation.
(Source: Schlichting2010, Lemma 2.6 and complete proof, printed pp.110–111.)
*Needs:* 6.3 `isotropicReduction`, 6.3.6, 6.2 `negativeSpace`, 6.2 `orthogonalSum`.
**Checks.**

- At L=0 the reduction is X and the comparison becomes X orthogonal-sum -X with its diagonal Lagrangian.

### 6.4 Grothendieck–Witt and Witt groups in degree zero

Construct `ExactGW0` (6.4.1): GW₀(E) is the group completion of isometry classes of nondegenerate symmetric spaces modulo [M]=[H(L)] for every metabolic M with an admissible Lagrangian L. Orthogonal sum is addition. This extra relation is essential in a nonsplit exact category.
E is essentially small with its intrinsic exact structure and strong exact duality. Degree-zero field Witt/GW theory is QuadraticFormInvariants Layer 4; this declaration supplies the general exact-category extension and the comparison.
Its API is `ExactGW0` (The presented additive group.); `ExactGW0.of` (The generator class of a symmetric space.); `ExactGW0.sum` (Orthogonal sum becomes addition.); `ExactGW0.metabolic` ([M]=[H(L)] for an admissible Lagrangian.); `ExactGW0.lift` (Descend exactly the additive invariants satisfying the metabolic relation.).
(Source: Schlichting2010, §2.2, printed p.111.)
*Needs:* Mathlib `FreeAbelianGroup`, 6.2 `SymmetricSpace`, 6.2 `ExactLagrangian.ofConflation`, 6.2 `hyperbolicSpace`, 6.2 `SymmetricIsometry`, 6.2 `orthogonalSum`.
**Checks.**

- A metabolic space with Lagrangian L has the same GW class as H(L).
- Over a split exact projective category, stable metabolic cancellation yields the usual group completion.
- Over Z the symmetric and quadratic-refined group presentations are not conflated.

Construct `ExactW0` (6.4.2): W0(E) is the orthogonal-sum monoid of symmetric-space isometry classes modulo metabolic spaces, equipped with its abelian group structure: the negative form supplies the inverse, as proved by symmetric-diagonal-lagrangian.
The diagonal Lagrangian proof uses the actual perfect pairing and split exactness of its short sequence.
Its API is `ExactW0` (The metabolic quotient group.); `ExactW0.of` (The Witt class of a symmetric space.); `ExactW0.metabolic` (Metabolic spaces have zero class.); `ExactW0.neg` (Negating the pairing gives the additive inverse.); `ExactW0.fieldComparison` (For fields in the owner’s scope, recover its Witt group.).
(Source: Schlichting2010, §2.2 and Lemma 2.8, printed pp.111–112.)
Specialised to finite-dimensional signed hermitian spaces over a nonarchimedean local field of odd residue characteristic, this presentation recovers the anisotropic-class Witt group of 2.9.
*Needs:* 6.4 `ExactGW0`, 6.2 `ExactLagrangian.ofConflation`, 6.2 `hyperbolicSpace`, QuadraticFormInvariants Layer 4, 6.2.8.
**Checks.**

- A hyperbolic plane has zero Witt class.
- The inverse of [X,φ] is [X,−φ].
- W=GW is false: over R the hyperbolic plane has nonzero rank in GW but zero Witt class.

Construct `grothendieckWittForgetful` (6.4.3): for a small exact category E with strong exact duality, the underlying-object assignment induces the group homomorphism F:GW0(E)->K0(E).
K₀ is the imported exact Grothendieck group. The duality involution can act nontrivially on K₀; multiplication by two is only a specialization when it acts trivially.
Its API is `grothendieckWittForgetful` (The underlying-object group homomorphism.); `grothendieckWittForgetful_of` (F([X,phi])=[X].); `grothendieckWittForgetful_natural` (functoriality: Commutes with exact form functors and their underlying exact functors.).
(Source: Schlichting2010, Lemma 2.8 and proof, printed p.112.)
*Needs:* Tau Ceti `TauCeti.ExactK0`, Tau Ceti `TauCeti.ExactK0.of`, Tau Ceti `TauCeti.ExactK0.of_conflation`, Tau Ceti `TauCeti.ExactK0.map`, 6.4 `ExactGW0`, 6.1 `exactKGroup`.
**Checks.**

- F of the zero space is zero.
- Over a field, a nonsingular one-dimensional form has underlying K0 rank one.
- F of a metabolic space with Lagrangian L is [L]+[DL].

Construct `grothendieckWittHyperbolic` (6.4.4): for a small exact category E with strong exact duality, X maps to H(X) and induces a group homomorphism H:K0(E)->GW0(E).
K₀ is the imported exact Grothendieck group. The duality involution can act nontrivially on K₀; multiplication by two is only a specialization when it acts trivially.
Its API is `grothendieckWittHyperbolic` (The hyperbolic group homomorphism.); `grothendieckWittHyperbolic_of` (H([X])=[H(X)].); `grothendieckWittHyperbolic_natural` (functoriality: Commutes with nonsingular exact form functors.).
(Source: Schlichting2010, Lemma 2.8 and proof, printed p.112.)
*Needs:* Tau Ceti `TauCeti.ExactK0`, Tau Ceti `TauCeti.ExactK0.map`, 6.4 `ExactGW0`, 6.2 `hyperbolicSpace`, 6.1 `exactKGroup`.
**Checks.**

- H(0)=0.
- Over a field the underlying rank of H of a rank-one class is two.
- For each exact conflation X->Y->Z, H([Y])=H([X])+H([Z]).

6.4.5. Prove that for a small exact category with strong exact duality, K0(E) --H--> GW0(E) -> W0(E) -> 0 is exact.
K₀ is the imported exact Grothendieck group. The duality involution can act nontrivially on K₀; multiplication by two is only a specialization when it acts trivially.
(Source: Schlichting2010, Lemma 2.8 and proof, printed p.112.)
*Needs:* 6.4 `ExactGW0`, 6.4 `ExactW0`, 6.4 `grothendieckWittHyperbolic`.
**Checks.**

- Each hyperbolic class maps to zero in the Witt group.

6.4.6. Prove that the composite of the forgetful and hyperbolic maps is F H=1+D on the exact Grothendieck group: F H([X])=[X]+[DX]. It specializes to multiplication by two only when D acts trivially.
K₀ is the imported exact Grothendieck group. The duality involution can act nontrivially on K₀; multiplication by two is only a specialization when it acts trivially.
(Source: Schlichting2010, Lemma 2.8 and proof, printed p.112.)
*Needs:* 6.4 `grothendieckWittForgetful`, 6.4 `grothendieckWittHyperbolic`.
**Checks.**

- Over a field with trivial rank-duality action, F H doubles rank.
- The hyperbolic image maps to zero in W₀.
- For a nontrivial K₀ involution, the equation is 1+D and cannot be simplified without proof.

### 6.5 The hermitian Q-construction and the Grothendieck–Witt space

Define `HermitianQSpan` (6.5.1): A representative X←U→Y has admissible deflation p and inflation i; the square from U to Y and X, with opposite corner DU and maps φY followed by Di and φX followed by Dp, is both cartesian and cocartesian.
Its API is `HermitianQSpan` (Store the actual bicartesian square and admissible span legs.); `HermitianQSpan.identity` (The two identity arrows give an identity representative.); `HermitianQSpan.equivalent` (A middle-object isomorphism commutes with both legs.); `HermitianQSpan.comp` (Use the exact pullback of the next deflation along the previous inflation.).
(Source: Schlichting2010, Definition 4.1, printed p.116.)
*Needs:* 6.2 `ExactCategoryDuality.ofExactFunctor`, 6.2 `SymmetricSpace`.
**Checks.**

- The identity representative uses U=X and both identity legs.
- A Lagrangian inclusion represents zero→X.
- An inclusion with a nonzero restricted self-pairing cannot represent zero→X.

6.5.2. Prove Isomorphisms of middle objects respecting both legs give an equivalence relation on hermitian Q representatives.
(Source: Schlichting2010, Definition 4.1, printed p.116.)
*Needs:* 6.5 `HermitianQSpan`.

6.5.3. Prove Pullback composition of admissible spans produces another admissible hermitian bicartesian span.
(Source: Schlichting2010, Definition 4.1 and Remark 4.3, printed pp.116–117; source omitted routine diagram verification is made explicit.)
*Needs:* 6.5 `HermitianQSpan`, 6.3 `isotropicReduction`.

6.5.4. Prove Isomorphic input spans have isomorphic pullback composites, respecting both outer legs.
(Source: Schlichting2010, Definition 4.1, printed p.116; exact pullback comparison.)
*Needs:* 6.5.3.

6.5.5. Prove Composing an identity representative on either side gives an equivalent span.
(Source: Schlichting2010, Definition 4.1, printed p.116.)
*Needs:* 6.5.3.

6.5.6. Prove that the two iterated pullback composites are isomorphic representatives, compatibly with the outer legs.
(Source: Schlichting2010, Definition 4.1, printed p.116.)
*Needs:* 6.5.3.

Construct `HermitianQ` (6.5.7): Qʰ(E) has symmetric spaces as objects. A morphism X→Y is an isomorphism class of spans X←p U→i Y with p an admissible deflation and i an admissible inflation, satisfying the matching restricted pairings and ker p≅ker(D(i)φ_Y). Equivalently the corresponding pairing square is bicartesian. Composition is the imported Q pullback composition.
Use the actual pairing square and exact-category quotient data; not every ordinary Q-span lifts.
Its API is `HermitianQ` (The category of hermitian Q-spans.); `HermitianQ.ofSpan` (A span with its actual bicartesian pairing condition.); `HermitianQ.forget` (functoriality: Forget the pairings to the Q-construction.); `HermitianQ.identity` (Identity is the identity span.).
(Source: Schlichting2010, Definition 4.1 and §4.1, printed pp.116–117.)
*Needs:* 6.5.2, 6.5.4, 6.5.5, 6.5.6, 6.1 `quillenQ`.
**Checks.**

- A Lagrangian gives a Qʰ path from zero to its metabolic space.
- The identity span gives the identity morphism.
- A Q-span with incompatible pairing or wrong kernel is not a hermitian morphism.

6.5.8. Prove Forgetting the pairings and bicartesian witness gives a functor Qh(E)→Q(E), preserving the chosen zero-object basepoint and representative composition.
(Source: Schlichting2010, Definition 4.1 and Definition 4.4, printed pp.116–117.)
*Needs:* 6.5 `HermitianQ`, 6.1 `quillenQ`.

6.5.9. Prove that for the hyperbolic category HE=E×E-op with exchange duality, Qh(HE) is equivalent to Q(E), and its GW fibre space is equivalent to K(E).
(Source: Schlichting2010, Example 2.3, Remark 4.3 and Example 4.5, printed pp.109,117.)
*Needs:* 6.5 `HermitianQ`, 6.5.8, 6.1 `exactKGroup`.

6.5.10. Prove Take Mathlib’s `CategoryTheory.nerve` of a small model of Qh(E), apply the supplied geometric realization functor and realize the forgetful natural transformation. The zero symmetric space gives the fibre base point.
(Source: Schlichting2010, Definition 4.4, printed p.117; the realization comparison is 6.1.3.)
*Needs:* Mathlib `CategoryTheory.nerve`, `CategoryTheory.nerveMap`, 6.5.8, 6.1 `nerveRealization`, 6.1 `quillenTheoremA`.

Construct `grothendieckWittSpace` (6.5.11): GW(E) is the pointed homotopy fibre over the zero object of |Qʰ(E)|→|Q(E)|.
Use actual nerve realization, homotopy fibre and homotopy groups from 6.1. No assumption 2 is invertible is needed for Schlichting’s exact-category model.
Its API is `grothendieckWittSpace` (The specified pointed homotopy fibre.); `grothendieckWittSpace_fibration` (GW(E)→|QʰE|→|QE| is the defining fibre sequence.); `grothendieckWittSpace_map` (functoriality: Nonsingular exact form functors induce pointed maps.).
(Source: Schlichting2010, Definition 4.4 and Definition 4.12, printed pp.117–118,122.)
*Needs:* 6.5.10.
**Checks.**

- For the constant map from a point to false in the discrete two-point space, the homotopy fibre over true is empty: there is no path joining the two points.
- The fibre of the identity of the discrete two-point space over false is a singleton.
- The fibre of the constant point-to-false map over false is a singleton; keeping the endpoint is essential.
- The zero symmetric space supplies the distinguished base point; it is not an arbitrary unrecorded form.
- For the hyperbolic category HE, GW(HE)≃K(E).
- A four-periodic shifted-duality statement does not imply GW_i≅GW_{i+4}; homotopy degree and duality shift are separate indices.

Define `higherGrothendieckWittGroup` (6.5.12): for i≥0, GW_i(E)=π_i of the pointed Grothendieck–Witt fibre space; in degree zero use its canonical abelian H-space component group, not a shifted-duality index.
Use actual pointed homotopy groups and orthogonal sum.
Its API is `higherGrothendieckWittGroup` (Pointed homotopy group of the Grothendieck–Witt fibre.); `higherGrothendieckWittGroup_map` (functoriality: Nonsingular exact form functors induce group maps.); `higherGrothendieckWittGroup_zero` (π0 as a type is equivalent to path components of the fibre. Its canonical abelian H-space law and comparison with exact GW0 are the separate components theorem and group-completion interface of 6.1.6.).
(Source: Schlichting2010, printed pp.121–122, Proposition 4.11 and Definition 4.12.)
*Needs:* Mathlib `HomotopyGroup`, `HomotopyGroup.pi0EquivZerothHomotopy`, 6.5 `grothendieckWittSpace`.
**Checks.**

- GW_0 agrees with the exact presentation, including metabolic relations.
- For HE the higher groups agree with ordinary K_i(E).
- For the terminal pointed fibre, each pointed homotopy group is a singleton; this does not use a duality shift or a periodicity hypothesis.

6.5.13. Prove Orthogonal sum of exact form functors induces the sum of their maps on the pointed GW H-space; a natural form isometry gives a homotopy.
(Source: Schlichting2010, §4.2 and Corollary 9.6 proof, printed pp.118,161.)
*Needs:* 6.5 `grothendieckWittSpace`, 6.2 `orthogonalSum`, 6.1 `groupCompletion`.

6.5.14. Prove that there is a natural additive isomorphism π₀GW(E)≅GW₀(E) with the previously defined metabolic presentation, compatible with forgetful and hyperbolic maps.
Essentially small exact category with strong exact duality; no 1/2 assumption.
(Source: Schlichting2010, Proposition 4.11 and full proof, printed pp.121–122.)
*Needs:* 6.5 `grothendieckWittSpace`, 6.4 `ExactGW0`, 6.4 `ExactW0`, 6.1 `exactKGroup`, 6.8.3, 6.8.4.
**Checks.**

- The comparison respects the hyperbolic image of an actual exact object.
- The degree-zero class is the metabolic GW presentation, not just unconstrained free isometry classes.

### 6.6 Cofinality

6.6.1. Prove that for a full extension-closed cofinal inclusion A⊂B, every object X of B admits T with X⊕T in A.
(Source: Schlichting2010, §5.1, printed p.124.)
*Needs:* 6.2 `ExactCategoryDuality.ofExactFunctor`.

6.6.2. Prove that the two comma-category inclusions in the proof of hermitian cofinality have contractible classifying spaces.
(Source: Schlichting2010, Theorem 5.1 full proof, printed pp.126–127.)
*Needs:* 6.6.1, 6.2 `hyperbolicSpace`, 6.2.8, 6.5 `HermitianQ`, 6.1 `quillenTheoremA`.

6.6.3. Prove that for a duality-preserving cofinal fully exact inclusion, |Qh A|→|Qh B|→|H(B,A)| is a homotopy fibration; H(B,A) is the comma category for the relative hyperbolic map K0(B,A)→GW0(B,A).
(Source: Schlichting2010, Theorem 5.1, printed pp.126–127.)
*Needs:* 6.6.2, 6.4 `grothendieckWittHyperbolic`, 6.1 `quillenTheoremA`.

6.6.4. Prove that a duality-preserving cofinal inclusion induces isomorphisms on GW_i for i≥1 and a monomorphism on GW0. Surjectivity on GW0 is not asserted.
(Source: Schlichting2010, Corollary 5.2 and full proof, printed pp.127–128.)
*Needs:* 6.6.3, 6.5 `grothendieckWittSpace`, 6.1 `exactKGroup`.

### 6.6a S-filtering exact quotients

Define `SFiltering E A` for an isomorphism-closed, extension-closed full subcategory `A` of the exact category `E`, containing the zero object and carrying the induced exact structure. Its four conditions are these: every map from `A` factors through an admissible subobject in `A`; every map to `A` factors through an admissible quotient in `A`; a deflation `U → A₀` with `A₀ ∈ A` admits an inflation `B → U`, with `B ∈ A`, whose composite to `A₀` is a deflation; and an inflation `A₀ → U` admits a deflation `U → B`, with `B ∈ A`, whose composite from `A₀` is an inflation. The last two composites are admissible in the induced exact structure on `A`, not merely epimorphic or monomorphic. The API exposes `left_factor`, `right_factor`, `lift_deflation`, and `descend_inflation`; prove invariance under exact equivalences and passage to opposites. (Source: Schlichting2010, §8.1, printed p.140.) *Needs:* the intrinsic exact structure and 6.2.

**Checks.**

- The zero subcategory and the whole category satisfy all four conditions; the empty subcategory fails because it omits zero.
- In finitely generated abelian groups, the fully exact subcategory of free groups is not s-filtering. For the admissible injection `2 : ℤ → ℤ`, an admissible quotient of its target which is free has rank zero or one. Rank zero destroys injectivity; rank one is an isomorphism and leaves a nonsplit injection between free groups. Thus the fourth condition fails.
- The finite groups inside finitely generated abelian groups fail `lift_deflation`: Z↠Z/2 has no finite subgroup mapping onto Z/2. Thus an ordinary Serre quotient cannot automatically be justified by this four-condition theorem. The Lean negative controls cover this case and the free-group obstruction to `descend_inflation`.

Define `sFilteringWeakGenerator E A` as the union of deflations with kernel in `A` and inflations with cokernel in `A`, witnessed by actual conflations. Define `sFilteringWeakIsomorphisms` as its finite multiplicative closure, including identities. Prove the left and right calculus of fractions, using the two factorisation conditions for Ore squares and the last two conditions for admissible replacements. The API gives the kernel/cokernel constructors, `id_mem`, `comp_mem`, and `op`; no arbitrary map is made a generator by specifying its source and target. (Source: Schlichting §8.1, p.140; *Delooping the K-theory of exact categories*, author manuscript dated 1 July 2003, Definitions 1.12–1.14 and Lemma 1.13, p.4.) *Needs:* `SFiltering`, Mathlib `MorphismProperty.multiplicativeClosure` and its localization/fraction machinery.

**Checks.**

- Identity maps are weak isomorphisms, including the identity of zero.
- A map which is neither an inflation nor a deflation is not an elementary generator.
- For the zero subcategory the elementary generators and their composites are exactly the isomorphisms; a multiplication-by-two map on `ℤ` is not among them.

Construct `sFilteringQuotient E A` as the Mathlib localization at these weak isomorphisms, with its additive structure, zero object, finite biproducts and exact structure. Its conflations are exactly the short complexes isomorphic to images of conflations of `E`. Prove the exact universal property: precomposition by `sFilteringQuotientFunctor` identifies exact functors out of the quotient with exact functors out of `E` killing `A`, including natural transformations. The API includes `sFilteringQuotientExact_conflation`, exactness of the quotient functor, `kill`, `lift`, and uniqueness of the factorization up to natural isomorphism. This is an exact localization, rather than the additive ideal quotient by maps through `A`. (Source: Schlichting §8.1, p.140; *Delooping*, Definitions 1.14–1.15, p.4, Proposition 1.16 and its proof, pp.4–7.) *Needs:* the preceding calculus of fractions, native preadditive localization, 6.2 exact functors.

For left Ore squares, push out an inflation generator. For a deflation generator, factor its kernel map through an admissible A-subobject of the other target and quotient by that subobject. For cancellation after an inflation, factor the difference through its A-cokernel and quotient an admissible A-subobject containing its image; after a deflation cancellation is already literal. Induction extends both constructions to finite composites; passing to opposites gives right fractions. To construct the exact structure, first assume A idempotent complete: replace each weak denominator by an inflation with A-cokernel, lift finite diagrams of conflations simultaneously, and use the resulting common denominators to show that quotient pushouts of inflations and pullbacks of deflations remain universal. Their images are kernel–cokernel pairs, and admissible composites lift after another common denominator. For arbitrary A, embed in the relative completion consisting of objects U with U⊕A₀ in E for some A₀ in the idempotent completion of A. A finite diagram admits a common choice of these complements, so adding and then killing them identifies both quotient categories and their conflations. This transports the exact axioms back without assuming that E itself is idempotent complete. (Source: the same *Delooping* manuscript, Lemma 1.17, pp.4–7, proof of Proposition 1.16 and Lemma 1.20, p.7; the finite-complement argument supplies the last lemma's omitted verification.)

**Checks.**

- Every object of `A` maps to a zero object.
- For `A = 0` the quotient functor is an exact equivalence; in particular it is fully faithful.
- For `A = E` every quotient object is zero. In a product of two finite-dimensional vector-space categories, quotienting by the first factor gives the second factor, with its induced split exact structure.

Define `DualityStable E D A` by `A X ↔ A (D X)` and construct `sFilteringQuotientDuality` when this condition holds. The duality sends elementary deflations to elementary inflations and reverses weak-isomorphism composites; localization therefore descends the actual contravariant functor, bidual isomorphism and its coherence. Prove that the quotient form functor intertwines these dualities and that descended duality preserves reversed conflations. (Source: Schlichting §8.1, p.140, paragraph preceding Theorem 8.2.) *Needs:* the exact quotient and 6.2 `ExactCategoryDuality`.

**Checks.**

- Both the zero and whole subcategories are stable under every strong duality.
- A subcategory containing `X` but excluding `D X` fails the stability test and cannot use this construction.
- The bidual identification on the quotient is the image of the original one. Sign twisting before or after descent gives the same duality; it does not identify symmetric and alternating spaces.

Prove `hermitianFilteringLocalization`: if `A` is also idempotent complete, `|Qʰ A| → |Qʰ E| → |Qʰ(E/A)|` is a pointed homotopy fibre sequence over zero. Build this result here, after the quotient, using the hermitian Q-spans, comma-category contractions and isotropic reduction; the hermitian envelope quotients of 6.7 are its exact-category applications. The perfect-complex localization of 6.9.2 uses the distinct stable construction of 6.8a. (Source: Schlichting, Theorem 8.2 and proof, pp.140–154.) *Needs:* 6.3 isotropic reduction, 6.5 hermitian Q, 6.1 Quillen Theorems A/B, the duality-stable quotient above.

**Checks.**

- With `A = 0` the fibre over zero is contractible.
- With `A = E` the sequence has contractible third term and identifies the fibre with `|Qʰ E|`.
- Idempotent completeness is retained, and no surjectivity of `W₀(E) → W₀(E/A)` follows; Schlichting Remark 8.3 supplies this warning.

### 6.7 Hermitian cones, suspension and the nonconnective spectrum

Define `HermitianConeDiagram` (6.7.1): C0(E,E) is the full subcategory of functors on the linear order N⊔N-op, all forward positions preceding every backward position. Forward arrows are inflations, backward arrows deflations. For a uniform k, all crossing arrows U_i→U^(i+k) are inflations and U_(i+k)→U^i deflations.
Its API is `HermitianConeDiagram` (The full-subcategory object is an actual functor with the specified admissibility conditions.); `HermitianConeDiagram.diagram` (The underlying functor on N⊔N-op.); `HermitianConeDiagram.constant` (Embed an exact object as its constant diagram.); `HermitianConeDiagram.crossingBound` (A single natural number controls both crossing families.).
(Source: Schlichting2010, §9.1, printed pp.154–155.)
*Needs:* Mathlib `CategoryTheory.ObjectProperty.FullSubcategory`, 6.2 `ExactCategoryDuality.ofExactFunctor`.
**Checks.**

- Constant diagrams satisfy the conditions with k=0.
- A diagram whose forward map is multiplication by 2 on a projective Z-module fails inflation.
- Separate crossing bounds that are unbounded in i do not supply a cone object.

6.7.2. Prove that the cone conditions are closed under pointwise conflations, giving the induced exact structure on C0(E,E).
(Source: Schlichting2010, §9.1, printed p.155.)
*Needs:* 6.7 `HermitianConeDiagram`.

Construct `coneLowerShift` (6.7.3): The forward-row shift U[k] replaces U_i by U_(i+k) and leaves U^i unchanged; the backward-row shift U^[k] replaces U^i by U^(i+k) and leaves U_i unchanged. Their natural maps are U→U[k] and U^[k]→U. The shifts commute and preserve pointwise conflations.
Its API is `coneLowerShift` (The lower-row reindexing exact endofunctor.); `coneUpperShift` (The upper-row reindexing exact endofunctor.); `coneLowerShiftMap` (data: The natural map from the identity to the lower shift.); `coneUpperShiftMap` (data: The natural map from the upper shift to the identity.).
(Source: Schlichting2010, §9.1, printed p.155.)
*Needs:* 6.7 `HermitianConeDiagram`.
**Checks.**

- The zero shift is the identity.
- Two lower shifts add their indices.
- A lower and an upper shift commute.

6.7.4. Prove Dualizing a cone diagram exchanges its forward and backward rows and interchanges the lower and upper shifts, reversing the comparison maps.
(Source: Schlichting2010, §9.1, printed p.155.)
*Needs:* 6.7 `coneLowerShift`, 6.2 `ExactCategoryDuality.ofExactFunctor`.

Construct `ConeFraction` (6.7.5): The cone morphisms U→V are the filtered colimit of Hom_C0(U^[i],V[j]); representatives agree after sufficiently increasing both shift indices.
Its API is `ConeFraction` (A shifted middle map and its two indices.); `ConeFraction.advance` (Increase both shift indices by composing the canonical shift maps.); `ConeFraction.equivalent` (Equality of those specific advanced maps at a common larger shift.); `ConeFraction.comp` (Shift the two representatives to compose; the new indices are their sums.); `ConeFraction.toLocalization` (The universal comparison to categorical localization.).
(Source: Schlichting2010, Definition 9.1, printed pp.155–156.)
*Needs:* 6.7 `coneLowerShift`.
**Checks.**

- Unshifted maps embed faithfully.
- Every lower and upper comparison map becomes invertible.
- Constant-diagram morphisms agree with the original E morphisms.

6.7.6. Prove that the representative g[j] composed with f^[k] defines associative, representative-independent composition with the shift comparisons as identities.
(Source: Schlichting2010, Definition 9.1, printed pp.155–156.)
*Needs:* 6.7 `ConeFraction`.

6.7.7. Prove that a sequence in C(E,E) is a conflation exactly when it is isomorphic to a localized pointwise conflation; these sequences form an exact structure and duality descends.
(Source: Schlichting2010, Lemma 9.2 and full proof, printed pp.156–158.)
*Needs:* Mathlib `CategoryTheory.MorphismProperty.Localization`, `CategoryTheory.MorphismProperty.Q`, 6.7.2, 6.7.6, 6.7.4.

6.7.8. Prove that the constant-diagram embedding E→C(E,E) is fully faithful, exact and reflects conflations.
(Source: Schlichting2010, Lemma 9.3 and full proof, printed pp.158–159.)
*Needs:* 6.7.7.

6.7.9. Prove that for idempotent-complete E, its fully exact constant inclusion into C(E,E) satisfies all four s-filtering conditions.
(Source: Schlichting2010, Lemma 9.3 full proof, printed pp.158–159.)
*Needs:* 6.7.8, 6.7 `coneLowerShift`.

6.7.10. Prove that for the fully exact inclusion A⊂U of the source, C(A,A)/A→C(U,A)/U is an exact duality-preserving equivalence.
(Source: Schlichting2010, Lemma 9.4 and full proof, printed pp.159–160.)
*Needs:* 6.7.7, 6.7.9.

Construct `coneZeroExtension` (6.7.11): The simultaneous backward shift [-1] inserts zero at index 0 in both rows and takes the old (i−1)-component at i≥1; it is exact and duality-preserving.
Its API is `coneZeroExtension` (The diagram functor with the initial zero inserted.); `coneZeroExtension_zero` (Both components at zero are zero objects.); `coneZeroExtension_successor` (Both successor components recover the original components.).
(Source: Schlichting2010, Lemma 9.5 proof, printed p.160.)
*Needs:* 6.7 `HermitianConeDiagram`.
**Checks.**

- The new zero-position component is zero.
- Its index-one component is the original index-zero component.
- Duality commutes with this simultaneous shift.

Construct `coneSwindle` (6.7.12): T is the pointwise sum of all nonnegative iterates of the zero-extension shift. At index i only the first i+1 terms contribute, so no countable coproduct hypothesis on E is introduced.
Its API is `coneSwindle` (The locally finite diagonal sum exact endofunctor.); `coneSwindle_component` (The i-th component is the finite sum of shifted source components.); `coneSwindle_duality` (The simultaneous dual shift makes T a form functor.).
(Source: Schlichting2010, Lemma 9.5 proof, printed pp.160–161.)
*Needs:* 6.7 `coneZeroExtension`, 6.2 `orthogonalSum`.
**Checks.**

- At index zero T has the original zero-index object.
- At index one its component is U1⊕U0.
- For the zero diagram every component is zero.

6.7.13. Prove T sends both shift comparison families to isomorphisms in C(E,E), hence descends as an exact form endofunctor.
(Source: Schlichting2010, Lemma 9.5 proof, printed p.161.)
*Needs:* 6.7 `coneSwindle`, 6.7.6.

6.7.14. Prove On the localized cone, the exact form functors id orthogonal-sum T and T are naturally isometric.
(Source: Schlichting2010, Lemma 9.5 proof, printed pp.160–161.)
*Needs:* 6.7.13.

Construct `hermitianCone` (6.7.15): for the small exact category E with strong exact duality, C(E,E) is the exact diagram category of Schlichting section 9.1, localized at its specified shift morphisms, with induced strong exact duality and its embedded copy of E.
C(E,E) is the filtered diagram/cone category of §9, not a ring of dummy symbols. Do not replace a hermitian cone by the ordinary K-theory cone without a duality comparison.
Its API is `hermitianCone` (The diagram cone category with exact structure and strong duality.); `hermitianConeLocalization` (data: The canonical functor from genuine cone diagrams to their shift localization.); `hermitianConeLocalization_inverts` (functoriality: Each specified shift morphism becomes an isomorphism under that localization.).
(Source: Schlichting2010, §9.1, Definition 9.1 and Lemmas 9.2–9.4, printed pp.154–160.)
*Needs:* 6.7.7, 6.7.8.
**Checks.**

- The cone of the zero exact category is equivalent to the zero exact category.
- The shift maps chosen for localization become isomorphisms.
- The embedded E objects retain their original morphisms, exact conflations and pairings.

6.7.16. Prove GW(C(E,E)) is contractible, using the source exact form endofunctor T and its natural form isomorphism id orthogonal-sum T isomorphic to T.
C(E,E) is the filtered diagram/cone category of §9, not a ring of dummy symbols. Do not replace a hermitian cone by the ordinary K-theory cone without a duality comparison.
(Source: Schlichting2010, printed pp.159–162, Lemma 9.5, Corollary 9.6, Definition 9.10.)
*Needs:* 6.7.14, 6.5.13.
**Checks.**

- C(E,E) is the filtered diagram/cone category of §9, not a ring of dummy symbols.

Construct `hermitianSuspension` (6.7.17): for idempotent-complete exact E with strong exact duality, S_h E=C(E,E)/E is Schlichting's hermitian suspension, the actual filtering exact quotient of the diagram cone, equipped with its induced strong exact duality.
C(E,E) is the filtered diagram/cone category of §9, not a ring of dummy symbols. Do not replace a hermitian cone by the ordinary K-theory cone without a duality comparison.
Its API is `hermitianSuspension` (The specified exact quotient with induced strong duality.); `hermitianSuspension_map` (functoriality: Compatible exact form functors induce suspension form functors.); `hermitianSuspension_duality` (The quotient form functor from the cone intertwines the induced suspension duality with the cone duality.).
(Source: Schlichting2010, printed pp.159–162, Lemma 9.5, Corollary 9.6, Definition 9.10.)
*Needs:* 6.7 `hermitianCone`, 6.6a `hermitianFilteringLocalization`, 6.7.9.
**Checks.**

- The cone GW space is contractible by id⊥T≅T.
- The quotient is by the embedded E and retains exact duality.
- Every constant diagram from E has zero image in the filtering quotient C(E,E)/E.

6.7.18. Prove that the idempotent-completion map Omega GW(S_h E) -> Omega GW(completion(S_h E)) is an equivalence, by hermitian cofinality.
No invertibility of two is imposed on this exact-category model.
(Source: Schlichting2010, printed p.162, Theorem 9.11 and Remark 9.12.)
*Needs:* 6.7 `hermitianSuspension`, 6.6.4.
**Checks.**

- No invertibility of two is imposed on this exact-category model.

6.7.19. Prove that for idempotent-complete exact E with strong exact duality, GW(E) is equivalent to Omega GW(S_h E).
No invertibility of two is imposed on this exact-category model.
(Source: Schlichting2010, printed p.162, Theorem 9.11 and Remark 9.12.)
*Needs:* 6.7 `hermitianSuspension`, 6.6a `hermitianFilteringLocalization`, 6.7.16.
**Checks.**

- Idempotent completion is explicitly retained before iteration.
- The analogous Ω|Qʰ(S_h E)| completion map is not always a π_0 isomorphism.

Construct `nonconnectiveHermitianSpectrum` (6.7.20): Iterating idempotent-completed hermitian suspension gives the Omega-spectrum with levels GW(E), GW(completion(S_h E)), GW(completion(S_h^2 E)), and so on, and structure equivalences induced by hermitian delooping. Its homotopy groups in all integer degrees are the nonconnective hermitian groups.
Keep hermitian structure maps and all idempotent completions. The sequence of |Qʰ(˜S_hⁿ E)| spaces alone is generally not an Ω-spectrum.
Its API is `nonconnectiveHermitianSpectrum` (The completed hermitian-suspension Ω-spectrum.); `nonconnectiveHermitianSpectrum_loop` (Each adjacent structure map is a loop equivalence.); `nonconnectiveHermitianSpectrum_homotopy` (The homotopy group in any integer degree is the corresponding nonconnective hermitian group, with the fixed suspension convention.).
(Source: Schlichting2010, printed p.162, Remark 9.12.)
*Needs:* 6.7.19, 6.7.18, 6.5 `higherGrothendieckWittGroup`.
**Checks.**

- For the zero exact category, all integer-degree nonconnective hermitian groups are zero.
- For HE negative groups recover nonconnective K groups.
- If an exact category has nonzero negative K group, its hyperbolic Qh-only tower fails an adjacent loop equivalence; replacing the fibre levels by Qh levels loses that group.

6.7.21. Prove that for the hyperbolic exact category HE with its exchange duality, the completed-suspension nonconnective hermitian spectrum is naturally equivalent to the nonconnective K-theory spectrum of 6.1.5 of E.
Keep hermitian structure maps and all idempotent completions. The sequence of |Qʰ(˜S_hⁿ E)| spaces alone is generally not an Ω-spectrum.
(Source: Schlichting2010, printed p.162, Remark 9.12.)
*Needs:* 6.7 `nonconnectiveHermitianSpectrum`, 6.1 `nonconnectiveKSpectrum`.
**Checks.**

- Positive degrees agree with Quillen K groups; degree zero uses the idempotent-completed derived-category convention of the imported spectrum.

### 6.8 Formations

Define `Formation` (6.8.1): A formation is a perfect symmetric space with two specified admissible Lagrangians. An isometry must carry each named Lagrangian to the corresponding one.
Its API is `Formation` (A symmetric space and two actual ExactLagrangian objects.); `Formation.first` (The first admissible Lagrangian.); `Formation.second` (The second admissible Lagrangian.); `Formation.swap` (Exchange the two named Lagrangians.).
(Source: Schlichting2010, §4.3, printed pp.119–120.)
*Needs:* 6.2 `ExactLagrangian.ofConflation`, 6.2 `SymmetricIsometry`.
**Checks.**

- Using the same Lagrangian twice gives a trivial formation class.
- Interchanging the Lagrangians reverses its class.
- Over Q, the two coordinate Lagrangians of the hyperbolic plane are a formation; a non-isotropic coordinate does not qualify.

Construct `FormationGroup` (6.8.2): The formation group is the free abelian group on formation isometry classes, modulo orthogonal additivity, concatenation [L1,L2]+[L2,L3]=[L1,L3], and common admissible isotropic reduction.
Its API is `FormationGroup` (The actual group quotient by the three relation families.); `FormationGroup.of` (The class of a formation.); `FormationGroup.concat` (The three-Lagrangian concatenation relation.); `FormationGroup.reduce` (Common admissible isotropic reduction leaves the class unchanged.); `FormationGroup.lift` (A function on formation classes respecting all three relations induces a unique additive map.).
(Source: Schlichting2010, §4.3, printed pp.119–120.)
*Needs:* Mathlib `FreeAbelianGroup`, 6.8 `Formation`, 6.2 `orthogonalSum`, 6.3 `isotropicReduction`.
**Checks.**

- The class [L,L] is zero by concatenation.
- Swapping gives its additive negative.
- Reducing both Lagrangians by a common admissible isotropic subobject preserves the formation class.

6.8.3. Prove that sending (X,L1,L2) to the loop formed by the L1 path followed by the inverse L2 path identifies the formation group with π1|Qh E| at zero.
(Source: Schlichting2010, Proposition 4.9 and full proof, printed pp.120–121; Lemma 4.15 full proof pp.123–124.)
*Needs:* 6.8 `FormationGroup`, 6.5 `HermitianQ`, 6.1 `groupCompletion`.

6.8.4. Prove that the homomorphism from formations to ExactK0 sending a formation to [L1]−[L2] has image equal to the kernel of the hyperbolic homomorphism.
(Source: Schlichting2010, Lemma 4.10 and full proof, printed p.121.)
*Needs:* Tau Ceti `TauCeti.ExactK0.of`, 6.8 `FormationGroup`, 6.4 `grothendieckWittHyperbolic`, 6.4.5.

### 6.8a Derived duality and Poincaré spectra

**DG categories with weak equivalences and duality.** Construct `DGCategory` with mapping cochain complexes of modules, degree-zero closed identities and chain-map composition satisfying associativity and the graded Leibniz rule. Reuse native `CochainComplex` and linear maps. Its `pretriangulatedHull` consists of finite twisted complexes, with shifts, finite sums and mapping cones; taking retracts is a separate idempotent completion. For a full acyclic subcategory A₀, define `DGWeakEquivalences` as the maps becoming invertible in the Verdier quotient H⁰(A^ptr)/H⁰(A₀^ptr). Thus weak equivalences are saturated, and their cones are acyclic. The API includes exact DG functors, the localization universal property, homotopy equivalences, and the comparison of the homotopy category with that quotient. This does not redefine Mathlib's ordinary derived category.

Define `DGDuality` as a DG functor from the graded opposite, with coherent bidual identification, preserving the acyclic subcategory. The opposite composition has sign (−1)^(|f||g|). For bounded cochain complexes the conventions are (DX)^i=D(X^(−i)), d_D^i=(−1)^(i+1)D(d_X^(−i−1)), and η_D^i=(−1)^iη_(X^i); on a homogeneous component f:X^i→Y^j, dualization includes (−1)^(i(j−i)). Prove the differential, composition and bidual identities, restriction to native `Functor.IsInvolutiveDual` in degree zero, and the coherent shifted dualities D^[r]. The sign functions `dgOppositeSign`, `dgDualDifferentialSign`, `dgBidualSign` and `dgDualMorphismSign` make these conventions testable against integer degrees. The differential changes sign in degree zero, while the bidual does not.

(Source: SchlichtingDerived, Definitions 1.24–1.26 and Examples 1.25–1.27, pp.18–19; Definition 1.29 and Example 1.30, pp.20–21; Definition 1.35, p.24.) Needs native cochain complexes and triangulated Verdier localization, 6.2 involutive exact duality, and 6.1a stable categories.

**Checks.**

- The cone of id_R is acyclic, whereas the cone of multiplication by 2 on Z has H⁰=Z/2 and is not acyclic. A map cannot be declared a quasi-isomorphism merely because its terms are projective.
- Two degree-one maps acquire opposite-composition sign −1; degrees (0,1) and (1,2) give +1.
- The dual differential signs in degrees −1,0,1 are +1,−1,+1, and the bidual signs are −1,+1,−1. For the two-term complex Z→²Z these signs make D² chain-isomorphic to the original complex.
- For a degree-one map from degree i=1 to j=2, the morphism sign is −1; i=0,j=1 gives +1 and i=−1,j=1 gives +1. Ignoring this sign breaks the DG composition identity.

**Perfect derived enhancement and derived Hom.** Construct `PerfectDerivedInfinity R` from bounded complexes of finitely generated projective R-modules, their DG nerve, localization at quasi-isomorphisms and idempotent completion. Construct the DG nerve with its mapping Kan complexes and coherent composition, rather than applying the ordinary nerve to H⁰. Its homotopy category is the full perfect subcategory of the existing `DerivedCategory (ModuleCat R)`; prove this comparison, finite-cone closure and invariance under replacing a projective resolution. Define `perfectDerivedHom X Y` by the total Hom complex: degree n is the finite product of Hom_R(X^i,Y^(i+n)), and d(f)=d_Y f−(−1)^n f d_X. Its Eilenberg–MacLane mapping spectrum realizes the stable mapping spectrum. The API is adjunction with derived tensor, shift compatibility, exactness in either variable, π_j=Hom_D(X[j],Y), and the Yoneda composition pairing. Construct the Eilenberg–MacLane realization of cochain complexes, with quasi-isomorphisms exactly the maps inducing spectrum equivalences. The perfect model is small after choosing a skeleton; its ambient derived module category allows arbitrary sums when required for Tate coefficients.

(Source: SchlichtingDerived, Example 1.4 and §§1.6–1.8, pp.9–19; Lurie, Higher Algebra, Construction 1.3.1.6 and Proposition 1.3.1.10, pp.81–82; CDH I, §4.2, pp.65–73.) Needs 6.1a and the preceding DG construction; ordinary derived categories are reused from Mathlib.

**Checks.**

- RHom_Z(Z,Z) has Z only in cochain degree zero; RHom_Z(Z/2,Z) has Z/2 only in degree one, using the resolution Z→²Z.
- In homotopy indexing this latter complex is H(Z/2)[−1], with π_(−1)=Z/2 and π₀=0.
- A bounded contractible projective complex is zero in `PerfectDerivedInfinity`; the complex Z→²Z is not. The zero perfect complex has zero mapping spectrum to every object.

**Derived coefficient lines and duality.** Define `DerivedCoefficientLine R` as an invertible coefficient module M with its involution and bidual-compatible evaluation. For commutative R in 6.9–6.11, M is a rank-one finite projective R-module and its involution is ±1. Define `perfectDual M X=RHom_R(X,M)`, prove it remains perfect, and construct the coherent evaluation equivalence X≃D²X. Tensoring M by a line and base changing along a ring map give the expected coefficient changes, retaining the chosen involution. The API supplies form functors, shifted dualities, evaluation on projectives, and compatibility of derived tensor with duality. The general invertible bimodule convention needed by 6.10.5–6.10.6 is the one in CDH I, Definition 4.2.2; its involution swaps the two R actions. Do not substitute a merely self-dual object for an invertible coefficient.

(Source: CDH I, Definitions 4.2.2 and 4.2.4 and Lemma 4.2.3, p.68.) Needs perfect derived Hom and 6.2 bidual coherence.

**Checks.**

- For M=R, the degree-zero dual of R is R and the bidual sends x to evaluation at x.
- Replacing the involution +1 by −1 changes symmetric to skew-symmetric forms without changing the underlying Hom module; over Q a nondegenerate skew line cannot exist.
- With shifted coefficient R[1], the dual of R is R[1], and the dual of R[1] is R. Duality shift changes the coefficient, independently of the homotopy group being computed.

**Poincaré structures and Poincaré objects.** Define `PoincareInfinityCategory` as a small stable infinity category C with a reduced 2-excisive functor Q:C^op→Sp. Here 2-excisive means that strongly cocartesian three-cubes go to cartesian cubes. Its cross-effect B(X,Y)=fib(Q(X⊕Y)→Q(X)⊕Q(Y)) is bilinear and is represented by an involutive duality: B(X,Y)≃Map_C(X,DY), with the transposition and bidual coherences. A `PoincareObject` is X with a point q∈Ω∞Q(X) whose associated map X→DX is an equivalence. Its API includes orthogonal sum, pullback of forms, duality-preserving exact functors, isometries, the core of the object category, and Lagrangians with a specified null-homotopy and the resulting cofiber equivalence. Construct isotropic surgery from this data, so that an isotropic map and its null-homotopy determine a cobordant Poincaré object. Nondegeneracy is a condition on the actual map, not the class of its determinant alone.

(Source: CDH I, Definitions 1.1.1, 1.2.1 and 2.1.1, pp.10,17,30; CDH III, Definition 1.1.2 and surgery diagram (4), pp.16–18.) Needs 6.1a mapping spectra and the derived dualities above. This needed subset moves here from the unavailable higher GeneralAlgebraicKTheory direction.

**Checks.**

- The zero object with its unique form is Poincaré. On Q in degree zero, the form xy is Poincaré and the zero form is not.
- On Z, the form 2xy is symmetric but not Poincaré: its associated map has cokernel Z/2.
- For X⊕DX the hyperbolic form has the canonical Lagrangian X; specifying only an isotropic subobject of smaller rank does not supply a Lagrangian.

**Symmetric, quadratic and genuine structures.** Define `symmetricPoincareStructure M` by Q^s_M(X)=B_M(X,X)^(hC₂) and `quadraticPoincareStructure M` by Q^q_M(X)=B_M(X,X)_(hC₂). The norm gives the symmetrization map. For each m∈Z∪{±∞}, define `genuinePoincareStructure M m` as the pullback of Q^s_M(X)→Map_R(X,M^(tC₂)) along Map_R(X,τ_(≥m)M^(tC₂))→Map_R(X,M^(tC₂)). Here M^(tC₂) has the Tate-diagonal R action: multiplication by r acts through the two tensor factors before the Tate diagonal. It is not the naive action obtained by forgetting that diagonal. Construct this action and the equivalence B_M(X,X)^(tC₂)≃Map_R(X,M^(tC₂)) for perfect X. The API gives the maps as m varies, fiber sequence Q^q→Q^(≥m)→Map_R(X,τ_(≥m)M^(tC₂)), the endpoints, and shift comparisons. On projectives in degree zero, m=0,1,2 recovers respectively strict symmetric forms, the image of the norm (even forms), and quadratic refinements. Prove these identifications by evaluating on a free line and on cross-effects, then extending through finite sums, retracts and the derived quadratic extension. If 2 is a unit, Tate coefficients vanish and all these structures agree.

(Source: CDH I, Lemma 3.2.5 and Construction 3.2.6 and Example 3.2.8, pp.51–53; Remark 4.2.16, pp.70–71; Proposition 4.2.22, p.73.) Needs 6.1a C₂ spectra, perfect derived Hom, and Poincaré cross-effects.

**Checks.**

- Over F₂, the line with b(x,y)=xy is nondegenerate symmetric but admits no quadratic refinement, since the polar form of a quadratic refinement is alternating.
- Over F₂, q(x,y)=xy on F₂² refines the alternating hyperbolic pairing and is nondegenerate. The zero form on F₂² fails nondegeneracy in every flavor.
- On Z the pairing x y is not even, whereas 2xy is even but not unimodular on a line. Over Q norm divided by 2 gives the inverse of symmetrization.

**Stable Grothendieck–Witt, L-theory and localization.** Construct `stableGrothendieckWittSpectrum C Q` by spectrifying the prespectrum with positive spaces |Pn Q^(j)(C,Q[j])|. The bonding equivalences come from hermitian additivity; its infinite loop space is Ω|Pn Q(C,Q[1])|. This is additive group completion of the functor Pn, rather than pointwise group completion of each form space. Construct `stableLTheorySpectrum C Q` using `poincareAdConstruction`: in degree n it is the category of diagrams indexed by the opposite poset of nonempty subsets of [n], with the induced limit form. Its Poincaré core is a Kan simplicial space; its realization classifies cobordisms, and shifting Q deloops it. The APIs give form functoriality, orthogonal sums, integer shifts, filtered-colimit compatibility, L_i(C,Q)=L₀(C,Q[−i]), and π_(−i)GW=L₀(C,Q[i]) for i>0. (CDH II, Definitions 4.1.1/4.2.1, Corollaries 4.2.3/4.2.7, pp.97–100; Definition 3.6.10, pp.91–92; Theorem 4.4.2 and Definition 4.4.4, pp.103–105.)

Define `PoincareVerdierSequence` by a stable Verdier sequence A→B→B/A, duality invariance of A, and the quotient quadratic structure. For a quotient object represented by Y, this structure is colim_(Y→A′)Q_B(fib(Y→A′)), with A′ in A. Prove `poincareVerdierCompactFormLift`: a map into a quotient object and a form together with a homotopy parametrized by a finite CW space lift after replacing its representative by fib(Y→A′). The filtered formula and compactness first lift the form, then its homotopy. In the ad-construction this supplies hermitian boundary fillers. For a horn, the defect of nondegeneracy lies in the kernel of the quotient and the horn restriction. That intersection is the metabolic category of A with the appropriate shifted form. Its canonical Lagrangian gives relative surgery that kills the defect and preserves the horn and quotient. Thus `poincareAdVerdierKanFibration` makes Pn(ad B)→Pn(ad(B/A)) a Kan fibration with fiber Pn(ad A). Realization and the shift bonding maps prove `stableLVerdierLocalization`. (CDH II, Remark 1.1.7, pp.18–19; Lemma 4.4.3 and complete proof of Theorem 4.4.2, pp.103–105.)

Construct `additiveHermitianBordification F` for an additive spectrum-valued invariant F as cofib(F(Hyp C)_(hC₂)→F(C,Q)). Double hyperbolization is induced from the trivial subgroup, so its homotopy orbits map equivalently to F(Hyp C); the cofiber vanishes on hyperbolic categories. Hermitian additivity identifies this vanishing with bordism invariance. The hyperbolic/forgetful adjunction makes every transformation from homotopy orbits to a bordism-invariant functor null, proving the cofiber's universal property. Its API is the universal map, vanishing on metabolic categories, integer-shift delooping, and the reconstruction square over F(Hyp C)^(hC₂)→F(Hyp C)^(tC₂). On GW, hyperbolic additivity identifies F(Hyp C) with K(C). The map GW→L agrees on negative homotopy groups; both bordifications have shift delooping, so this agreement identifies all groups. This proves `stableGWFundamentalSquare`, GW→L over K^(hC₂)→K^(tC₂), and the fiber sequence K_(hC₂)→GW→L. The left term is homotopy orbits. Apply `stableKVerdierLocalization` and `stableLVerdierLocalization` to obtain `stableGWVerdierLocalization`. A Karoubi quotient requires its own K₀/cofinality comparison. (CDH II, Lemma 3.5.6, Proposition 3.5.8, pp.87–88; Proposition 3.6.5, Corollary 3.6.7, pp.89–90; Theorem 4.4.11 and Corollaries 4.4.13/4.5.1, pp.106–108.) Needs 6.1a, 6.1b stable Verdier localization, the metabolic and hermitian Q-constructions, and Poincaré surgery below.

**Checks.**

- The zero Poincaré category has contractible K, GW and L spectra.
- For the hyperbolic category C^op×C with factor-exchange duality, GW≃K(C) and L is zero; its C₂ K-spectrum is induced, so its Tate spectrum is zero.
- For an identity localization the quotient is zero and the fiber map is the identity. For the zero inclusion the quotient is the original category.

**Exact, DG and stable comparisons.** Define `HomotopicallySoundExactCategory` using an exact category with weak equivalences: deflations and weak equivalences form a category of fibrant objects, and, by duality, inflations give cofibrant objects. Include finite limits along deflations, closure of trivial deflations under pullback, path-object factorization, and the dual cylinder conditions. For bounded complexes with pointwise exact structure and quasi-isomorphisms, prove these conditions by mapping cylinders and the long exact homology sequence in the abelian hull. Define `exactDGStableGWComparison` from 6.5 to bounded complexes, then to their stable localization. If mapping complexes are uniquely 2-divisible, prove this is a GW-spectrum equivalence, compatible with shifted dualities. Resolve Poincaré objects over a fixed X through trivial deflations Y↠X, identify the derived mapping-space colimit, and use norm invertibility to commute its sifted colimit with C₂ fixed points. Repeat on each edgewise S-level to obtain a spectrum comparison. This proves the 6.10.1–6.10.2 dg hypotheses have an actual source. It does not identify classical integral GW with Q^s at dyadic coefficients.

Define `ExhaustiveWeightStructure` on a stable category by retract-closed halves, connective mapping spectra from the nonpositive half to the nonnegative half, and a fiber sequence Y→X→Z with Y nonpositive and Z[−1] nonnegative. The union of the bounded intervals is C. (HS, Definition 3.1.1, pp.16–17.) Its API includes weight intervals, extension and retract closure, translated structures, heart mapping-spectrum connectivity, and bounded induction.

Define `poincareLinearPart Q X` as cofib(B_Q(X,X)_(hC₂)→Q(X)); the map is induced by the quadratic cross-effect. Its API is exactness of this reduced linear functor, naturality for form functors, and the reconstruction square with B_Q(X,X)^(hC₂) over its Tate spectrum. For Q^q it is zero, for Q^s it is the Tate diagonal, and for Q^(≥m) it is the truncation τ_(≥m) of that diagonal. The underlying R action remains the Tate-diagonal action of the preceding construction. (CDH I, §1.3, the linear part and quadratic reconstruction; HS, §3.2, pp.21–24.)

Define `PoincareWeightDimensionAtLeast d` by D(C_(≤0))⊂C_(≥d) and `PoincareWeightDimensionExactly d` by this condition and D(C_(≥0))⊂C_(≤d). The API is the equivalent heart conditions, B_Q(X,Y) d-connective on heart objects for the lower bound, weight translation changing d by −2p, coefficient shift changing d by p, and opposite duality exchanging lower d with upper −d. With an exhaustive structure, checking D(X)∈C_[d,d] on the heart is equivalent to exact dimension d. A weight bound refers to the stated mapping-spectrum connectivity, rather than homological truncation. (HS, Definition 3.2.1, Lemma 3.2.3 and Example 3.2.4, pp.21–23.)

**Checks.**

- Quadratic Q has zero linear part; symmetric Q on a projective F₂-line has nonzero Tate coefficients, so it is not the same functor. On a rational line its Tate coefficients vanish.
- On a projective Z-line, the genuine symmetric linear part is τ_(≥0)HZ^(tC₂), connective; the untruncated symmetric Tate spectrum has nonzero negative even groups. These distinguish the truncation index.
- Perf(R) with a coefficient module in degree zero has exact weight dimension zero; coefficient R[1] has dimension one, while translating the weight heart by [1] changes dimension zero to −2. All bounds hold vacuously in the zero category.

Construct `PoincareSurgeryDatum` as a map T→X to a Poincaré object, a path trivializing its pulled-back Q-form, and its resulting isotropic trace X←fib(X→DT)→fib(X→DT)/T. Its API is the functorial surgery equivalence with metabolic objects, reversal of the trace, iterated surgery, and preservation of the numerical connectivity bounds. Define `PoincareCobordismCategory` by the complete Segal space of Poincaré objects in the hermitian twisted-arrow Q-constructions with shifted structure Q[1]. Its objects are Q[1]-Poincaré objects and its morphisms are the corresponding Poincaré cobordism spans; composition is stable pullback. Its API includes the symmetric monoidal orthogonal sum, endomorphisms of zero identified with Q-Poincaré objects, reflection of independent squares, and the GW delooping Ω|Cob(C,Q)|. Define `CobordismConnectivity m p` by m-connectivity of the left boundary maps and p-connectivity of its objects, using the fiber convention of the weight structure. The underlying full/wide subcategories are Cob^m and Cob^(m,p), respectively. (HS, §§2.1–2.2, pp.12–16; Definitions 3.2.5–3.2.6, pp.23–24; §4.1, pp.25–29. The Q-coherence and GW delooping use CDH II's hermitian Q-construction.)

**Checks.**

- On the hyperbolic form T⊕DT, its canonical Lagrangian T with the canonical null-homotopy gives zero surgery result; the trace is metabolic.
- The zero surgery datum on X leaves X as result. An isotropic map with no chosen null-homotopy does not give a datum. The symmetric F₂-line has no rank-one Lagrangian or surgery to zero.
- A morphism 0→0 in Cob(C,Q) is a Q-Poincaré object, while an object of Cob(C,Q) has the shifted Q[1]-structure. In exact dimension 2p, a (p+1)-connective Poincaré cobordism object is zero; p-connectivity alone does not force this.

Prove `quadraticCubeTwoFaceReconstruction`: for a stable C, a reduced quadratic Q:C^op→Sp and a strongly cocartesian cube T:[a]^(r+1)→C with T(0)=0, Q applied to its terminal vertices is strongly two-cartesian. The underlying diagram is left Kan extended from the axes; its Q-values are right Kan extended from faces having at most two axes. For finite-poset diagrams this gives `surgeryDataOneCoskeletal`: at each cobordism nerve degree, forgetting coherent disjoint surgery cubes is relatively one-coskeletal. Prove the cubical Kan-extension criterion by downward induction on the face dimension and then induction on the height of its initial vertex. Use quadraticity to turn the three-dimensional cocartesian faces into cartesian Q-faces, then extend across all higher faces. Fillings in degrees zero and one suffice for a trivial fibration; the numerical surgery bounds, rather than one-coskeletality alone, supply those two fillings. (HS, Theorem 5.2.1, Proposition 5.2.2, Lemma 5.2.3 and Corollary 5.2.4 with complete proof, pp.48–50.)

Define `disjointSurgeryComplex m p` as the semisimplicial category of strongly cocartesian cubes of surgery data, with initial value zero and each axis datum suitable for type (m,p). Its API is insertion/deletion of axes, forgetting the surgery choices, and multiple-surgery functors. Define `splitMiddleSurgeryComplex p` by additionally choosing a backwards splitting of each forward middle-dimensional datum. Its API is the forgetful map, twisted doubling, restriction to the slanted cube v↦2v−e_(first nonzero coordinate), and compatibility with all semisimplicial faces. These definitions concern coherent cubes, not pairwise disjoint subsets of an ordinary category.

Prove `surgeryComplexConnectivity`: if the weight dimension is at least d, 2p<d, p+m≤d, p≤m and the linear part is p-connective on the heart, forgetting disjoint data at each nerve degree is a trivial fibration and |Cob^(m,p+1)|→|Cob^(m,p)| is an equivalence. Weight decomposition supplies each initial surgery, and the bilinear connectivity bound supplies disjoint sums of two choices. Strongly cocartesian cubes make the forgetful map 1-coskeletal, so these degree-zero and degree-one fillings supply every boundary. The forward surgery trace gives inverse maps on realizations; adjoining the zero datum proves the required relative inverse. (HS, Theorem 5.2.1, pp.48–50; Propositions 6.1.3 and 6.1.5, pp.52–54; Proposition 6.2.2 and Theorem 6.2.3, pp.55–56.)

Prove `middleSurgeryConnectivity`: in exact dimension 2p with p-connective linear part on the heart, |Cob^(p,p+1)|→|Cob^(p,p)| identifies the basepoint component. Two nullcobordant objects have a cobordism whose two boundary maps can both be made p-connective; its boundary fiber is concentrated in weight p and gives surgery. The middle-dimensional data admit splittings because all their filtration terms and quotients lie in the same weight heart, whose fiber sequences split. The split-choice complex is again a trivial fibration. Direct sums alone may fail to kill the object; instead double each independent cobordism square and replace its reflected pieces through the chosen splittings. The twisted doubled cube is forward, and restricting to the slanted cube has zero surgery result at every noninitial vertex. The section and zero-datum argument then prove precisely the basepoint-component assertion. (HS, Lemma 6.3.1 and Proposition 6.3.2, pp.57–58; Definitions 6.4.2 and 6.4.5, Lemma 6.4.3, Proposition 6.4.6 and Lemma 6.4.8, pp.59–63; Theorem 6.4.1, pp.58–63.)

Prove `morphismSurgeryConnectivity`: |Cob^(m+1)|→|Cob^m| is an equivalence for 2m+1≤d. Build the analogous complex of two-stage boundary surgery data, factor each trace into forward/backward cobordisms, and reflect its independent square. The resulting diagram is indexed by H^(r+1), H=[1]∪_{1}[1]; its subdiagram having at least one second initial vertex lies in Cob^(m+1). Both index-poset realizations are contractible, so their evaluation maps and the zero-data section give an inverse. Exhaustiveness lets the object and morphism bounds descend without bound; realizations commute with these filtered unions. For exact dimension zero and connective Q on the heart, its connective linear part permits the middle theorem with p=0. Cob^(0,1) has only the zero object, with endomorphism monoid the heart Poincaré objects. Looping its classifying space proves `weightHeartGWComparison`. (HS, Proposition 7.1.5, pp.65–66; Theorem 7.2.1 and proof through Lemma 7.2.4, pp.67–68; Theorem 8.1.1 and Corollary 8.1.2, pp.69–70.)

**Checks.**

- The all-zero cube lies in every disjoint surgery complex and forgets to the zero cobordism; inserting a zero axis preserves its surgery result.
- In the two-term matrix control, the identity on Q² has determinant 1, whereas [[1,1],[1,1]] has determinant 0 and kernel vector (1,−1). Both diagonal singleton blocks are invertible. Their cones vanish individually, but the combined matrix cone has one-dimensional kernel and cokernel. Thus singleton surgery results cannot establish a combined result without checking the off-diagonal coherence; this is the obligation the twisted-double construction addresses.
- At d=p=m=0 the strict inequality 2p<d fails, so the below-middle theorem cannot be applied. The split-middle theorem applies only on the nullcobordant component. The nonzero symmetric rational line has nonzero Witt class and is excluded from that component; the hyperbolic plane is included.

For the integral classical comparison, if D preserves its heart and Q takes connective values there, prove `weightHeartGWComparison`: group completion of the core of heart Poincaré objects is Ω∞GW(C,Q). The proof uses parametrized surgery: on finite simplicial families, iteratively remove the highest and lowest weights with chosen surgery data; the complexes of compatible choices are contractible and group completion accounts for hyperbolic stabilization. The heart of Perf(R) is finite projective modules. Applied to Q^(≥0), Q^(≥1), Q^(≥2), this identifies classical symmetric, even and quadratic GW with the connective covers of the corresponding genuine spectra. For a Dedekind ring, the further symmetric comparison is τ_(≥0)GW^gs≃τ_(≥0)GW^s; for quadratic theory the corresponding comparison with symmetric GW begins at degree four. State these ranges instead of claiming all-flavor integral equivalence.

(Source: CDH II, Example B.2.1, Proposition B.2.2 and Corollaries B.2.3–B.2.4, pp.143–146; Hebestreit–Steimle, arXiv:2103.13911v5, Definition 3.1.1, pp.16–17, Theorem B, pp.4–5 and Corollary 8.1.2, pp.69–70; CDH III, Corollary 1.3.15, p.32.) Needs 6.1 group completion, 6.1a, DG duality, Poincaré surgery, and the genuine structures above.

**Checks.**

- On Perf(Q), norm/2 identifies symmetric and quadratic structures and the classical/stable comparison is compatible with every shift.
- The heart of Perf(Z) is projectives, not all finite modules: Z/2 belongs to Perf(Z) but not its weight heart. The bounded t-structure heart is a different notion.
- The F₂ symmetric line is detected by Q^(≥0), while its absent quadratic refinement prevents its use in Q^(≥2). Removing the 2-unit hypothesis from the exact-to-Q^s comparison would conflate these examples.

**Residue coefficient and symmetric dévissage.** For a nonzero prime ideal p of a Dedekind domain R and a line M, define `residueDualizingModule R p M` as coker(Hom_R(R,M)→Hom_R(p,M)), where the map is restriction. Prove it is a one-dimensional R/p-module and canonically p^(−1)M/M. The projective resolution p→R of R/p computes RHom_R(R/p,M) as this module in cochain degree one, hence as the coefficient shifted by −1. Construct its induced involution and evaluation duality; choosing a local generator of p identifies it with M/pM, with a unit change on changing the generator. Its API includes the canonical quotient map, residue scalar action, projective-resolution independence and the ramified base-change map. On perfect torsion complexes with support in a set S of primes, RHom_R(−,M)[1] preserves the finite-length heart.

Prove `symmetricHeartLTheory`: when duality interchanges the halves of a t-structure and every object has finite amplitude, symmetric L_(4j), L_(4j+2) are the Witt groups of the heart with respectively its original and negated bidual identification, and the odd groups vanish. Truncation and isotropic surgery reduce objects and Lagrangians to the stated heart ranges. Prove finite-length Witt dévissage by successive isotropic reductions along socle submodules and their annihilators; the surviving simple constituents have their residue coefficient duality. Together with ordinary K-theory of the heart and finite-length K-dévis­sage, the fundamental square gives `symmetricResidueDevissage`: the sum of the residue-field GW spectra is equivalent to GW of perfect torsion complexes. The residue pushforward is fully faithful on the simple heart, not on all derived mapping spectra. Obtain 6.9.3 by applying stable localization to this torsion category and Perf(R)→Perf(R_S).

(Source: CDH III, Lemma 2.2.2, p.37; Theorem 2.2.4 and Corollary 2.2.5, pp.38–39; Corollary 1.3.8 and its proof, p.30.) Needs derived Hom, symmetric Poincaré structures, stable localization and the ordinary finite-length K inputs of 6.1b. The proof must supply those K inputs at the category-of-the-heart level, beyond exact-category filtering.

**Checks.**

- For R=Z,p=(2),M=Z, the quotient Hom(2Z,Z)/res Hom(Z,Z) has two elements; for p=(3) it has three. In both cases RHom has no degree-zero cohomology.
- For M=0 the quotient is zero; this example fails the coefficient-line hypothesis and must not be used to infer a rank-one residue coefficient.
- Under Z→Z[i] at the prime (1+i), the canonical boundary/base-change comparison has ramification multiplicity two on K₀ and zero on symmetric L₀ over the characteristic-two residue field. Replacing it by the identity would give the wrong localization map.

### 6.9 Localisation for Dedekind rings

6.9.1. For a Dedekind domain R, nonzero prime p and coefficient line M, prove RHom_R(R/p,M)≃`residueDualizingModule R p M`[−1], using the canonical quotient constructed in 6.8a. Its R/p-module structure and involution are retained. A uniformizer identifies the unshifted line with M/pM, with the corresponding unit transformation under a different uniformizer. This choice is not natural under arbitrary ramified base change. (Source: CDH III, Lemma 2.2.2, p.37.) Needs 6.8a perfect derived Hom, residue duality and symmetric Poincaré structures.

**Checks.**

- Over Z at (2), cochain H¹ is Z/2 and H⁰ is zero; at (3), H¹ is Z/3. The spectrum coefficient shift is −1 in both cases.
- Over a DVR, replacing a uniformizer π by uπ changes the chosen residue-line identification by a unit, while the canonical derived coefficient is unchanged.
- For Z→Z[i] at (1+i), 2 has valuation two and is not a uniformizer; the ramified comparison cannot be the naive residue-field identity.

6.9.2. Define `torsionPerfectCategory R S` as the full stable subcategory of perfect R-complexes whose cohomology is supported on a set S of nonzero primes. Define R_S inside the fraction field by nonnegative valuations at primes outside S; it need not be obtained by inverting a multiplicative subset. The API is kernel identification for derived tensor with R_S, closure under truncation and duality, finite-support decompositions, and the Verdier quotient equivalence with Perf(R_S). Prove R_S is the filtered union of inverse fractional ideals supported on S, hence flat with R_S⊗_R R_S≃R_S. Their quotients by R generate the fiber by perfect torsion complexes. Surjectivity Pic(R)→Pic(R_S), through divisor classes, supplies the K₀ control needed for the full perfect quotient. With the symmetric coefficient M[1], its finite-length heart has duality Hom_R(−,M_S/M). Prove the shifted identification by the exact sequence 0→M→M_S→M_S/M→0. This is the stable localization of 6.8a, not an application of exact strong Hom-duality on all finite R-modules; Hom_R(torsion,M) alone would be zero. (Source: CDH III, Lemma 2.1.2, Proposition 2.1.3 and Lemma 2.1.4, pp.33–35.)

**Checks.**

- S empty gives R_S=R and the zero torsion category. S all nonzero primes gives the fraction field and all finite torsion perfect complexes.
- Over Z with S={(2)}, R_S=Z[1/2], Z/4 is in the kernel, and Z/3 is not.
- With M=Z, the heart dual of Z/2 is Hom_Z(Z/2,Z[1/2]/Z)≃Z/2; Hom_Z(Z/2,Z)=0 is the wrong duality.

6.9.3. For R,M,S as above and every duality shift r, prove the canonical fiber sequence ⊕_(p∈S)GW(R/p;Q^s_(RHom_R(R/p,M))[r])→GW(R;Q^s_M[r])→GW(R_S;Q^s_(M_S)[r]). A uniformizer replaces the left coefficient by (M/pM)[r−1]. Construct the left map by residue restriction of scalars with its right-adjoint coefficient; then apply 6.8a symmetric residue dévissage to 6.9.2. No 2-unit assumption is imposed. The quadratic variant does not follow at dyadic primes. (Source: CDH III, Theorem 2.2.4, Corollary 2.2.5 and Remark 2.2.6, pp.38–39.) Needs all the derived, Poincaré, dévissage and stable-localization constructions of 6.8a, with the residue coefficient of 6.9.1.

**Checks.**

- S empty gives the identity map and zero fiber; one prime gives its single residue spectrum.
- The coefficient shift is r−1 after a uniformizer choice. It does not shift the right-hand spectrum's homotopy-group index.
- Under the ramified map Z→Z[i] at two, the K-boundary comparison has multiplicity two and the symmetric L-boundary comparison in characteristic two is zero. The quadratic localization statement fails there without a different theorem.

### 6.10 Periodicity and number rings

6.10.1. For a small dg category A with weak equivalences and duality over a commutative base in which 2 is invertible, construct the exact triangle GW^[r](A) → K(A) → GW^[r+1](A) → ΣGW^[r](A), with forgetful, hyperbolic and cup-product-with-η maps. Here K is the connective Waldhausen spectrum; GW is Schlichting's dg spectrum, whose negative groups are triangular Witt groups. Replacing K by a nonconnective spectrum requires a separate localization theorem. Pass to the pretriangulated hull before applying the following constructions; the hull comparison preserves the spectra.

Construct `dgArrowCategory A` with the arrow-reversing duality, the identity-arrow inclusion I, and the cone form functor to the once-shifted duality. Define v to be the arrow morphisms whose cones are weak equivalences. Prove `dgConeGW_fibration` by the change-of-weak-equivalences theorem at every iterated hermitian R-construction level. The v-acyclic arrows are weak-equivalence arrows: evaluation at their source is an inverse to I, with comparison (1,f) and duality compatibility f*. The cone functor identifies the v-localization with A[1]: its inverse sends X to 0→X, and the comparison factors through Cone(id_X)→Cone(f). These functors and natural weak equivalences produce the cartesian square with a contractible acyclic corner, hence its fibre sequence. The 2-invertibility hypothesis enters the change-of-weak-equivalences theorem; it is not inferred from the existence of cones.

Prove `dgArrowGW_hyperbolic`: send f:A₀→A₁ to (A₀,A₁*) in the hyperbolic category A×Aᵒᵖ; its inverse sends a pair to the zero arrow. Hermitian additivity for the conflation (0→A₁)→f→(A₀→0) identifies their composite with the identity on GW. The hyperbolic R-construction identifies the resulting spectrum with K(A). Under this equivalence I becomes forgetful and Cone becomes hyperbolic composed with the shift, which acts by −1 on K. Multiplicativity of the cone square identifies its connecting map with −η, where η is minus the boundary of the unit form. Changing both signs gives the displayed triangle. This construction supplies its maps and exactness, rather than storing exactness as a field of an unspecified spectrum.
(Source: Schlichting2017, Proposition 4.9, Lemma 4.10 and Corollary 4.11, pp.47–49; Proposition 5.6, pp.53–54; Theorem 6.1 and proof, pp.57–58.)
*Needs:* 6.8a dg duality, mapping cones and dg/exact comparisons; 6.5 hermitian additivity and change of weak equivalences; 6.1 iterated Waldhausen constructions; 6.1a spectra.
**Checks.**

- For the zero dg category all three spectra are contractible; the triangle has zero boundary.
- On finite-dimensional vector spaces over Q, forgetting a rank-one symmetric form gives rank 1, whereas the hyperbolic image of the rank-one K-class has underlying rank 2. Interchanging the two maps fails this test.
- Cone(id_X) is acyclic but Cone(0→X) is X; identifying both with an acyclic object destroys the cone-localization inverse. The resulting boundary has the sign fixed by η=−∂⟨1⟩.

6.10.2. Under the hypotheses of 6.10.1, define εU as fib(K→εGW) and εV as fib(εGW→K), for ε=±1. Prove −εV≃ΩεU and GW^[r+4]≃GW^[r], with homotopy degree unchanged. The first triangle identifies εU with εGW^[−1] and εV with ΩεGW^[1]. Tensoring with the symmetric coefficient line in degree one, whose square lies in degree two with negative bidual map, identifies (A[−1],can) with (A[1],−can). This gives the U/V equivalence. Applying this sign-changing equivalence twice gives the four-shift comparison. Construct its inverse with the oppositely shifted line; its evaluation maps and tensor associativity give the inverse identities and naturality under dg form functors.
(Source: Schlichting, Theorem 6.2 and proof, p.58; the shifted coefficient-line conventions are in §1.10–1.11 and §1.35.)
*Needs:* 6.10.1, 6.8a shifted dg duality and coefficient lines.
**Checks.**

- Over Q a degree-zero rank-one symmetric space has a nonzero rank class. It does not become an alternating line under an unshifted identification: a nondegenerate alternating line is impossible.
- A two-shift reverses the bidual sign; a four-shift restores it. The coefficient-line equivalences keep πᵢ fixed, rather than comparing πᵢ with πᵢ₊₄.
- In characteristic two the dg cones and duality signs still make sense, but the 2-invertibility hypothesis of the Bott argument fails. This theorem supplies no comparison there.

**Number-field virtual cohomological dimension.** Use `cd_p` from ProfiniteCohomology Layer 11 and the absolute Galois group of a field; define `virtualTwoCohomologicalDimension K` to be cd₂(G_(K(i))), where i²=−1. This definition includes the case that i already belongs to K. Its API is independence of the chosen root and separable closure, invariance under field isomorphism, and the bound under finite extensions. Prove `numberField_virtual_cd_two_le`: for a number field K, this invariant is at most two. Prove the corresponding bound for a finite field of odd characteristic (at most one); characteristic two is excluded from the later comparison, irrespective of its Galois cohomological dimension. The arithmetic input is `globalHighDegreeRestriction`: for a finite discrete G_K-module A and r≥3, restriction identifies Hʳ(K,A) with the product of Hʳ(K_v,A) over real places. Here positive-degree ordinary and Tate cohomology at a real place agree. Construct the restriction from chosen local embeddings and prove its independence under conjugacy. No real place survives in K(i), so these groups vanish; continuous cohomology commutes with the filtered union of finite submodules of a discrete torsion representation, extending the vanishing to every 2-primary torsion module. This last passage uses ProfiniteCohomology's finite-primary characterization of `cd_p`, rather than checking just the trivial coefficient F₂.

To prove the high-degree restriction, use the exact sequence of units, idèles and idèle classes over the separable closure. Construct `globalIdeleExtDuality`, Extʳ_(G_K)(A,C)=H^(2−r)(K,A)ᵛ for finite A in the degrees r≥1, with the dual coefficient in the units term. ClassFieldTheory Layer 11 supplies the idèle class formation and fundamental class; its Tate theorem, restriction/corestriction compatibility and the continuous Ext limit over finite splitting extensions give this duality. Construct `globalIdeleLocalExt`: the idèle Ext groups are the sums of the local groups in degrees at least two, using Shapiro on the local factors and vanishing of the higher unramified-unit terms. ClassFieldTheory's local duality and the cohomological triviality of unramified units supply these terms; outside finitely many ramified places the restricted-product factors are units. The Ext long exact sequence and the zero negative degrees on the class-formation duality then identify the global groups in degree at least three with their local restrictions. Nonarchimedean local fields have cd₂≤2 by ClassFieldTheory Layer 5; complex places have trivial Galois group. This leaves exactly the real factors in the asserted product.
(Source: Milne, *Arithmetic Duality Theorems*, second edition, I, Theorem 4.6, pp.52–53, Theorem 4.10(c), pp.56–57, and its proof through Lemmas 4.12–4.13, pp.59–62. For the finite-field Galois group use ProfiniteCohomology Layers 4 and 11, with its computed cd_p of the procyclic group.)
**Checks.**

- K=Q(i) has no real embeddings; adjoining i changes neither its field nor the bound. K=Q still has a real place before adjoining i: Hʳ(R,F₂)=F₂ for every r≥0, so ordinary cd₂(G_Q) is not a substitute for the virtual invariant.
- For F₃ the absolute Galois group is procyclic and cd₂=1. Its quadratic extension F₉ still has cd₂=1, so the operation need not decrease the dimension strictly.
- The zero coefficient has zero positive-degree cohomology. For a real place, trivial action on Z/2 and Z/4 gives positive-degree C₂ cohomology of order two in both cases; inverting two kills these groups. Testing only the zero module would miss the obstruction.

**Finite even residue fields.** Prove `finiteEvenFieldHomotopyLimit`: for q=2^e with e≥1, an invertible coefficient line with its involution, and every integer shift r, GW(F_q;Q^s_M[r])→K(F_q;Q^s_M[r])^{hC₂} is an integral spectrum equivalence. Trivialize the line only after retaining its evaluation and shift. The fundamental square of 6.8a reduces the assertion to L→K^{tC₂}. Symmetric L-theory of a perfect characteristic-two field is two-periodic, with L₀=F₂ generated by the bilinear line ⟨1⟩ and L₁=0. The metabolic shift equivalence reduces all r to zero. The remaining ordinary K input is `finiteFieldKGroups`: K₀(F_q)=Z, K_(2j)(F_q)=0 and K_(2j−1)(F_q)=Z/(q^j−1), j≥1. For even q its positive groups have odd order; rank gives an equivariant 2-adic equivalence K→HZ. Tate of HZ has F₂ in even degrees and zero in odd degrees. The line maps to rank one, so L₀→π₀K^{tC₂} is the identity on F₂; periodicity proves the equivalence. This proof uses the odd-order calculation, not an assertion that every positive K-group is zero. (Source: CDH III, Proposition 3.1.4 and complete proof, pp.50–51; the ordinary input is Quillen, *On the cohomology and K-theory of the general linear groups over a finite field*, Ann. of Math. 96 (1972), 552–586.) *Needs:* 6.1a, 6.1b, 6.8a, the finite-field K-group calculation. **Gap:** the latter calculation's Brauer-lifting and finite-group cohomology proof is not supplied by the ordinary Q/S constructions of 6.1.

**Checks.**

- For F₂, the symmetric bilinear line has Witt class 1∈F₂ and rank 1 modulo two. Replacing symmetric bilinear forms by alternating forms deletes this generator.
- K₁(F₄)=Z/3, while K₂(F₄)=0. Completion kills the former; vanishing of the former before completion would be false.
- For shift −1 the action on K₀ is the sign action. HZ(−1)^{hC₂} has π₀=0 and no positive groups, although its negative derived groups need not vanish. A shift-free residue term would falsely leave an invariant rank class.

**Finite-vcd field and scheme comparisons.** Prove `fieldFiniteVcdHomotopyLimit`: for a field k of characteristic different from two with vcd₂(k)<∞, every invertible line with involution and integer shift gives a 2-adic equivalence GW(k;Q^s_M[r])→K(k;Q^s_M[r])^{hC₂}. Define `QLScheme X` by: X is noetherian of finite Krull dimension, two is invertible, the numbers vcd₂(k(x)) are uniformly bounded over all points, and X has an ample family of line bundles. Its API includes affine schemes satisfying the first three conditions, open restrictions, and the field case. Prove `qlSchemeHomotopyLimit` for every such X and every line with shift: the comparison is an equivalence modulo 2^a for a≥1, hence after derived 2-completion. Here GW is the DG/stable comparison of 6.8a and K is connective K of perfect complexes. The scheme theorem is required on Spec(R[1/2]); the fraction-field theorem alone does not replace it. (Source: Berrick–Karoubi–Schlichting–Østvær, Definition 2.1 and Theorem 2.2, p.3; Lemmas 4.1 and 4.3–4.6 and proof of Theorem 2.2, pp.8–11.)

The characteristic-zero field proof uses the equivariant motivic K-theory comparison of Hu–Kriz–Ormsby, Theorem 16, pp.30–32, and the Witt-completion comparison of Theorem 20, p.35. Its required target `finiteVcdWittCompletion` identifies lim W(k)/2^a with lim W(k)/I^a, where I is the even-rank ideal. Its associated-graded input is the norm-residue theorem and the Milnor conjecture for the fundamental ideal, giving gr_I W(k)≃H*(k,F₂). If −1 is nonsquare, k(i)/k is quadratic. In its Hochschild–Serre calculation retain the conjugation action on H^q(k(i),F₂): the E₂ page is H^p(C₂,H^q(k(i),F₂)), not a tensor product with a trivial action. Periodicity in positive C₂-cohomological degree and the bound on q make cup product by [−1] invertible in sufficiently high total degree. On gr_I this is multiplication by two. To pass from successive approximations to membership in 2^aW, one also needs the I-adic closedness of each principal Pfister ideal 2^aW. This is the separate input used in Hu–Kriz–Ormsby, Lemma 19 and Theorem 20, pp.34–35; it is not a consequence of a formal spectral sequence alone. If −1 is square, there is no quadratic C₂-extension here: ⟨1,1⟩ is hyperbolic, so 2W(k)=0. For d=cd₂(k)<∞ the associated graded vanishes above d. Together with I-adic separation (the Arason–Pfister dimension theorem), this gives I^(d+1)=0, and both completions are W(k). Separation is an additional Witt-theoretic supplier, not a consequence of the vanishing of the graded pieces. In derived completion, the transition maps of the Moore tower are eventually zero on the relevant finite-Moore torsion, giving a pro-zero tower; do not assume multiplication by two on a mod-two Moore spectrum is literally zero.

For odd positive characteristic, pass to a perfect closure, use the complete Witt-vector DVR V, and compare its residue field to Frac(V). The obstruction functor F=fib(GW→K^{hC₂}) is rigid modulo two and satisfies localization. The map V[t,t⁻¹]→Frac(V), t↦p, and the augmentation t↦1 give the retract diagram that transfers the characteristic-zero result. For schemes, use Nisnevich descent and henselian rigidity to obtain the uniform high-degree comparison from residue fields. Construct a positive Bott element modulo 2^a, compare étale-local GW and K after inverting it, and use the η-periodicity of the obstruction to turn high-degree vanishing into all-degree vanishing. The étale K comparison requires the K-theoretic Quillen–Lichtenbaum theorem with the uniform vcd bound. (Same source, Lemma 4.1, p.8, Lemmas 4.3–4.6, pp.9–10, and concluding proof, pp.10–11.) **Gap:** the equivariant motivic K slice/coniveau comparison, norm-residue identification, I-adic separation and Pfister-ideal closedness, Bott-element construction, and étale K descent comparison require proof suppliers beyond 6.1 and 6.8a. They are explicit inputs of these two comparisons, rather than consequences of the newly defined stable categories. *Needs:* 6.1a spectra, 6.8a DG/stable GW comparison, ProfiniteCohomology's continuous cohomology and finite-primary dimension API, and these motivic, Witt and étale inputs.

**Checks.**

- Spec(Q), Spec(Q(i)) and Spec(Z[1/2]) satisfy the QL conditions with dimension respectively 0, 0 and 1 and uniform virtual bounds at most 2. The scheme comparison includes all nonzero prime points, not just the generic point.
- Spec(Z) fails invertibility of two; Spec(F₂) also fails it despite its small Galois dimension. Its integral comparison is the preceding separate theorem.
- For a real closed field W=Z and I=2Z, so the two completions are Z₂. For a quadratically closed field of characteristic different from two, W=Z/2 and I=0; both completions are Z/2. Localization gives Z_(2) in the first case and cannot replace completion.
- A field with no finite virtual bound is outside the theorem; a finite-dimensional scheme whose residue-field bounds are not uniform is outside `QLScheme`. Finite dimension alone does not supply that bound.

6.10.3. Prove that for a Dedekind ring R whose fraction field is a number field, a line bundle M with involution ±1 and any duality shift r, GW(R;Q^s_M[r])→K(R;Q^s_M[r])^{hC₂} is a 2-adic equivalence. Its classical symmetric connective-cover specialization is an equivalence in nonnegative degrees after 2-completion.
Use the spectrum and C₂ constructions of 6.1a and the stable Poincaré, DG and weight-heart comparisons of 6.8a. The field and scheme comparisons require the preceding motivic, Witt-completion and étale contracts. Real embeddings require completion; localization at two alone is insufficient.
Let S be the finite set of dyadic primes. The residue localization and dévissage sequence and its K-theory counterpart form two fiber sequences. Homotopy fixed points commute with this finite residue sum and preserve the K fiber sequence. The left comparison is the integral finite-even-field equivalence; the right comparison is the QL scheme theorem on R[1/2]. Its points have finite residue fields with vcd₂≤1 and a number-field generic point with vcd₂≤2. Two invertible vertical maps after completion force the middle one. The classical specialization uses the connective-cover comparison, not an identification in negative degrees.
(Source: CDHIII2026v4, Theorem 3.1.7 and full proof, physical pp.51–52.)
*Needs:* 6.9.3, 6.1a, 6.8a, `numberField_virtual_cd_two_le`, `finiteEvenFieldHomotopyLimit` and `qlSchemeHomotopyLimit`.
**Checks.**

- A number ring with real places requires 2-completion; the rational signature contribution prevents the unqualified integral statement.
- Classical connective groups give the nonnegative-degree specialization.
- For R=Z[1/2], S is empty and the argument reduces exactly to the scheme theorem; finite residue fields alone cannot prove this case.

6.10.4. Prove that for a Dedekind ring R with number-field fraction field and epsilon=±1, GW^s(R;epsilon)→GW^s(R[1/2];epsilon) is a 2-local equivalence on connected covers, hence in strictly positive homotopy degrees, and is injective in degree zero.
The fiber is the finite sum of residue GW spectra with shift −1. The finite-even-field equivalence identifies these with K homotopy fixed points. Rank identifies their 2-local form with HZ_(2) carrying the sign action: its fixed rank group is zero and its positive homotopy groups vanish. Thus the fiber is strictly negative after localization, which gives an isomorphism in positive degrees and an injection in degree zero. A degree-zero isomorphism is not asserted. 2-local equivalence is distinct from the preceding 2-adic homotopy-limit comparison.
(Source: CDHIII2026v4, Proposition 3.1.11 and proof, physical p.53.)
*Needs:* 6.9.3, `finiteEvenFieldHomotopyLimit`, and `finiteFieldKGroups`.
**Checks.**

- The map on π₀ is injective; it need not be surjective.
- The theorem compares R with R[1/2], not GW with ordinary K without duality.
- For R=Z[1/2] the map is an identity; for R=Z the residue term uses the sign action, whose invariant subgroup in Z_(2) is zero. A trivial action would give the wrong degree-zero fiber.

6.10.5. Prove that for a ring R and invertible coefficient bimodule M with involution, if the mod-2 map from connective classical symmetric GW to K homotopy fixed points is n-truncated, n≥0, then Lgs(R;M)→Ls(R;M) is (n−1)-truncated.
(Source: CDHIII2026v4, Proposition 3.1.13 and full proof, printed pp.53–54.)
*Needs:* 6.10.6.

6.10.6. Prove that for any ring R, invertible coefficient bimodule M with involution and m∈Z∪{±∞}, L(R;Q_M^≥m)[1/2]→L(R;Q_M^s)[1/2] is an equivalence.
(Source: CDHIII2026v4, Proposition 3.1.14 and full proof, printed p.54.)

The proof requires a spectrum-level multiplicative target `genuineLTheoryModule`: Lgs(Z) is an E∞ ring spectrum, and L(R;Q_M^≥m) is a coherently unital module over it, natural in R, M and m. Construct `poincareTensorProduct` on perfect objects with derived tensor and coefficient tensor, including the symmetry signs and form pullbacks; the module structure must descend through the ad construction and its stabilization, not merely through π₀. The degree-four class x represented by Z[−2] with signature one acts by the comparison shift. Prove `symmetricLTheoryShiftTelescope`: L(R;Q_M^s) is the telescope of multiplication by x on L(R;Q_M^≥m), equivalently the derived module tensor with Ls(Z). The calculation Lgs(Z)[1/2]≃Ls(Z)[1/2] then makes the telescope comparison an equivalence after inverting two. For 6.10.5, the fundamental square modulo two gives the truncated Lgs→K^tC₂ comparison; the fourfold shift acts invertibly on Tate. Passing to the telescope gives the modulo-two truncation, and the two-inverted equivalence lowers the integral truncation bound by one. *Needs:* 6.1a, 6.8a, coherent tensor/module structures, the shift telescope, and the integral L(Z) calculation.

CDH I, §5.3, constructs tensor products of Poincaré categories; §7.5, Proposition 7.5.3 and Corollary 7.5.10, pp.172–175, supplies the degree-zero GW and graded L products. **Gap:** these graded products do not construct the coherent spectrum module or prove the telescope identification. CDH III explicitly assigns that spectrum-level multiplicative input to its Part IV, which is listed as in preparation. A degreewise product on groups cannot be substituted for this missing supplier.

**Checks.**

- Tensoring with the rank-one bilinear unit over Z retains the coefficient line and form; tensoring with the zero object gives zero. A unital action cannot take both to zero.
- Exchanging two degree-one tensor factors gives sign −1; forgetting that symmetry changes the coefficient involution. The class Z[−2] has signature one in Lgs₄(Z); its action shifts the comparison by four. A signature-eight E₈ class gives a different integral action, even though both become units after inverting two.
- Lgs₀(Z)→Ls₀(Z) is an identity on signature, whereas Lgq₀(Z)→Lgs₀(Z) multiplies signature by eight. For n=0, 6.10.5 gives a (−1)-truncated map, not an unqualified spectrum equivalence.


### 6.11 The integers


The integer table needs two arithmetic proof suppliers in addition to 6.10. Define `integerKOddPart` as the subgroup of K_n(Z) consisting of elements of finite odd order; retaining this subgroup avoids assuming its cyclicity. Prove `integerKArithmeticInput`: finite generation of K_n(Z), the orders |K_(8k+2)(Z)|=2c_(2k+1) and |K_(8k+6)(Z)|=c_(2k+2), the cyclic groups K_(8k+3)(Z)=Z/(2w_(4k+2)) and K_(8k+7)(Z)=Z/w_(4k+4), and the 2-inverted duality action (−1)^j on K_(2j−1) and K_(2j−2), j≥2. Here c_j and w_(2j) are the positive numerator and denominator of |B_(2j)/(4j)| in lowest terms. This is an arithmetic K-theory input using Quillen–Lichtenbaum, not a consequence of the Q construction. Separately prove `twoLocalGWZHalf`: the positive-degree symmetric and symplectic GW groups of Z[1/2] are the 2-primary groups of Berrick–Karoubi, Theorem B, published p.789. Its proof uses their cartesian orthogonal/symplectic Brauer-lift squares, Theorem A, together with topological Bott periodicity and the ordinary K-theoretic cartesian square. Combine this input with 6.10.4 and the two-inverted fundamental-square splitting; finite generation then recovers the integral groups. The odd K contribution remains its actual group, rather than an assumed cyclic group. (Source: CDH III, §3.2, Theorem 3.2.2, Lemma 3.2.4 and proof, pp.55–57.) **Gap:** the Brauer-lift/cartesian-square proof and the arithmetic K(Z) proof chain are not supplied by 6.1 or the stable-category definitions. They remain prerequisite obligations for every row below.

The API for `integerKOddPart` includes its subgroup inclusion, functoriality under homomorphisms, and the splitting of a finite torsion group into 2-primary and odd-primary parts. **Checks.** Z/6 has odd part Z/3; Z/4 has zero odd part; Z/3⊕Z/3 is its own odd part and is noncyclic. For the arithmetic denominators, B₂=1/6 gives w₂=24 and B₄=−1/30 gives w₄=240. Thus the degree-three symmetric entry is Z/24 and its symplectic entry is Z/48; these cannot be exchanged with degree zero, whose symmetric group is Z².

6.11.1. Prove that for Z, symmetric classical GW0 is Z⊕Z generated by ⟨1⟩,⟨−1⟩; symplectic GW0 is Z generated by the rank-two alternating hyperbolic form.
(Source: CDHIII2026v4, §3.2, printed pp.54–55.)
*Needs:* 6.4 `ExactGW0`.

6.11.2. Prove that for k≥0 and n=8k+0≥1, the classical symmetric group is Z⊕Z/2 and the classical symplectic group is 0. Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.
(Source: CDHIII2026v4, Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57.)
*Needs:* 6.10.4, 6.10.3.

6.11.3. Prove that for k≥0 and n=8k+1≥1, the classical symmetric group is (Z/2)^3 and the classical symplectic group is 0. Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.
(Source: CDHIII2026v4, Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57.)
*Needs:* 6.10.4, 6.10.3.

6.11.4. Prove that for k≥0 and n=8k+2≥1, the classical symmetric group is (Z/2)^2⊕K_(8k+2)(Z)_odd and the classical symplectic group is Z⊕K_(8k+2)(Z)_odd. Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.
(Source: CDHIII2026v4, Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57.)
*Needs:* 6.10.4, 6.10.3.

6.11.5. Prove that for k≥0 and n=8k+3≥1, the classical symmetric group is Z/w_(4k+2) and the classical symplectic group is Z/(2w_(4k+2)). Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.
(Source: CDHIII2026v4, Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57.)
*Needs:* 6.10.4, 6.10.3.

6.11.6. Prove that for k≥0 and n=8k+4≥1, the classical symmetric group is Z and the classical symplectic group is Z/2. Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.
(Source: CDHIII2026v4, Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57.)
*Needs:* 6.10.4, 6.10.3.

6.11.7. Prove that for k≥0 and n=8k+5≥1, the classical symmetric group is 0 and the classical symplectic group is Z/2. Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.
(Source: CDHIII2026v4, Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57.)
*Needs:* 6.10.4, 6.10.3.

6.11.8. Prove that for k≥0 and n=8k+6≥1, the classical symmetric group is K_(8k+6)(Z)_odd and the classical symplectic group is Z⊕K_(8k+6)(Z)_odd. Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.
(Source: CDHIII2026v4, Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57.)
*Needs:* 6.10.4, 6.10.3.

6.11.9. Prove that for k≥0 and n=8k+7≥1, the classical symmetric group is Z/w_(4k+4) and the classical symplectic group is Z/w_(4k+4). Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.
(Source: CDHIII2026v4, Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57.)
*Needs:* 6.10.4, 6.10.3.

6.11.10. Prove that the cofiber C of Lgq(Z)→Lgs(Z) has π1=Z/2, π0=Z/8, π−1=Z/2, and all other homotopy groups zero. The degree-zero L map is multiplication by 8.
(Source: CDHIII2026v4, Lemma 3.2.7 and full proof, printed p.58.)
*Needs:* 6.9.3.

6.11.11. Prove Classical quadratic GW0(Z)=Z⊕Z, with generators Hq and E8; GW1(Z)=(Z/2)^2. Symmetrization identifies quadratic and symmetric GW_n(Z) for every n≥2.
(Source: CDHIII2026v4, Theorem 3.2.9 and full proof, printed pp.58–59.)
*Needs:* 6.11.1, 6.11.10, 6.11.3.

6.11.12. Prove that the cofiber D of L−gq(Z)→L−gs(Z) is equivalent to Σ²C, with the symmetrization map identified under the two double-suspension equivalences.
(Source: CDHIII2026v4, Lemma 3.2.10 and full proof, printed p.59.)
*Needs:* 6.11.10.

6.11.13. Prove that for K(Z) with the skew-duality C2 action, π1 of the homotopy-orbit spectrum is Z/4 and π2 is zero.
(Source: CDHIII2026v4, Lemma 3.2.11 and full proof, printed pp.59–60.)
*Needs:* 6.10.4, 6.11.3, 6.11.4.

6.11.14. Prove Classical skew-quadratic GW_n(Z), for n=0,1,2,3, is respectively Z⊕Z/2, Z/4, Z and Z/24. For n≥4 it agrees with symplectic GW_n(Z). The Z/2 in degree zero is the Arf class.
(Source: CDHIII2026v4, Theorem 3.2.13 and full proof, printed pp.60–61.)
*Needs:* 6.11.12, 6.11.13, 6.11.5.

### Examples

Over a field with `2` invertible, the symmetric `W₀` of finite-dimensional vector spaces is additively isomorphic to the underlying Witt group of QuadraticFormInvariants Layer 4 under `B ↦ B(x,x)/2`. This convention is not a unital tensor-ring comparison: the bilinear unit `⟨1⟩` maps to `⟨1/2⟩`. The hyperbolic plane has Witt class `0` and nonzero class in `GW₀`. For the hyperbolic category `HE` the Grothendieck–Witt space is `K(E)`. The zero exact category has all hermitian groups zero. Over `ℤ` the symmetric Grothendieck–Witt groups in degrees `0` to `7` modulo the ordinary `K(ℤ)` contributions are the eight rows of 6.11, with `GW₀^s(ℤ) = ℤ ⊕ ℤ` generated by `⟨1⟩` and `⟨−1⟩`.

### Dependencies

GrothendieckEulerForms Layer 0 (intrinsic exact structures, conflation-exact functors) and Layer 2 (exact Grothendieck groups), Tau Ceti `ExactStructure` and `ExactK0`; Layer 2 (the field and signed hermitian comparisons); the 6.1 targets; Mathlib `CategoryTheory.nerve`, `SSet.toTop`, `HomotopyGroup`, `CategoryTheory.Localization`, biproducts and `IsPullback`.

## Downstream consumers

ArithmeticStatistics ST.0 (families, heights and measures) and DiophantineApproximationAndTranscendence DT.0 (heights and approximation constants) consume Layer 1; DiophantineApproximationAndTranscendence DT.4 and EffectiveDiophantineMethods ED.1 (lattice reduction and integer relations) consume Layer 5 and use only its exported certificate and approximation factor; ProbabilisticAndMetricNumberTheory PM.4 consumes Layer 4. The Grothendieck–Witt groups of Layer 6 are the degree-zero and higher hermitian invariants that a stable Poincaré-category treatment of hermitian K-theory compares against.

## References

Locators in the layers refer to the following editions.

- **Couveignes, *Enumerating number fields*** — Jean-Marc Couveignes, *Enumerating number fields*. Annals of Mathematics 192 (2020), 487–497. https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf
- **Horesh–Karasik 2023** — Tal Horesh and Yakov Karasik, *Equidistribution of primitive lattices in R^n*. The Quarterly Journal of Mathematics 74 (2023), 1253–1294, DOI 10.1093/qmath/haad008; version of record deposited at ISTA. https://research-explorer.ista.ac.at/download/14717/14720/2023_QuarterlyJourMath_Horesh.pdf
- **Horesh–Karasik, arXiv v2** — Tal Horesh and Yakov Karasik, *Equidistribution of primitive lattices in R^n*. arXiv:2012.04508v2, 28 October 2021; superseded by the 2023 published text. https://arxiv.org/pdf/2012.04508v2
- **Evertse, *Geometry of numbers*** — Jan-Hendrik Evertse, *Diophantine approximation, Chapter 2: Geometry of numbers*. Author-hosted dio19-2.pdf linked by the Fall 2023 course page. https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf
- **Henk, *Successive minima and lattice points*** — Martin Henk, *Successive Minima and Lattice Points*. arXiv:math/0204158v1 (12 April 2002), seven-page preprint. Author bibliography lists Rend. Circ. Mat. Palermo (2), Suppl.70 (2002), 377–384. https://arxiv.org/pdf/math/0204158v1
- **Lenstra–Lenstra–Lovász 1982** — A. K. Lenstra, H. W. Lenstra, Jr., L. Lovász, *Factoring polynomials with rational coefficients*. Math. Ann. 261 (1982), 515–534; scanned academic mirror with reprint folios 27–46. https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf
- **Voight, *Quaternion algebras*** — John Voight, *Quaternion algebras*. Author post-publication v.1.0.7u, 5 August 2026. https://jvoight.github.io/quat-book.pdf
- **Li–Zhang, *Kudla–Rapoport cycles*** — Chao Li, Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*.  https://arxiv.org/pdf/1908.01701v3
- **Schlichting, *Hermitian K-theory of exact categories*** — Marco Schlichting, *Hermitian K-theory of exact categories*.  https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf
- **Schlichting, *Hermitian K-theory, derived equivalences and Karoubi’s fundamental theorem*** — Marco Schlichting, *Hermitian K-theory, derived equivalences and Karoubi’s Fundamental Theorem*. arXiv:1209.0848v3, 7 September 2016. https://arxiv.org/pdf/1209.0848v3
- **Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III** — Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus, Wolfgang Steimle, *Hermitian K-theory for stable infinity-categories III: Grothendieck–Witt groups of rings*. arXiv:2009.07225v4, 27 April 2026. https://arxiv.org/pdf/2009.07225v4
- **Bhargava–Shankar, *Binary quartic forms*** — Manjul Bhargava, Arul Shankar, *Binary quartic forms having bounded invariants, and the boundedness of the average rank of elliptic curves*.  https://arxiv.org/pdf/1006.1002v2
- **Duke 1988** — W. Duke, *Hyperbolic distribution problems and half-integral weight Maass forms*. Published-layout author copy, Invent. Math. 92 (1988), 73–90. https://www.math.ucla.edu/~wdduke/preprints/hyperbolic.pdf
- **Benoist, *Arithmeticity of discrete subgroups*** — Yves Benoist, *Arithmeticity of discrete subgroups*.  https://www.imo.universite-paris-saclay.fr/~yves.benoist/prepubli/19ArithmeticityLectures.pdf
- **Morris, *Introduction to arithmetic groups*** — Dave Witte Morris, *Introduction to Arithmetic Groups*.  https://arxiv.org/pdf/math/0106063v6
- **Regev, *Transference theorems* (lecture 11)** — Oded Regev; scribe Elad Verbin, *Transference Theorems, Lattices in Computer Science, Lecture 11*. Fall 2004, author-hosted lecture notes. https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf
- **Aggarwal–Stephens-Davidowitz 2019** — Divesh Aggarwal; Noah Stephens-Davidowitz, *An improved constant in Banaszczyk’s transference theorem*. arXiv:1907.09020v1, 21 July 2019. https://arxiv.org/pdf/1907.09020v1
- **Kirschmer, *One-class genera of maximal integral quadratic forms*** — Markus Kirschmer, *One-class genera of maximal integral quadratic forms*. Author preprint, June 2013. https://www.math.rwth-aachen.de/~Markus.Kirschmer/papers/maxgen.pdf
- **Mahler 1946** — Kurt Mahler, *On lattice points in n-dimensional star bodies I. Existence theorems*. Published-layout archival copy, Proc. Royal Society A 187 (1946), 151–187. https://carmamaths.org/resources/mahler/docs/090.pdf
- **Schulze-Pillot, *Lecture notes on quadratic forms*** — Rainer Schulze-Pillot, *Lecture notes on quadratic forms and their arithmetic*. arXiv:2008.12847v2, 21 March 2021. https://arxiv.org/pdf/2008.12847
- **Voight, *Identifying the matrix ring* (2012)** — John Voight, *Identifying the matrix ring: algorithms for quaternion algebras and quadratic forms*. arXiv:1004.0994v2, 30 April 2012. https://arxiv.org/pdf/1004.0994
- **Emery–Kim 2022** — Vincent Emery and Inkang Kim, *Quaternionic hyperbolic lattices of minimal covolume*. Version of record, Forum of Mathematics, Sigma 10 (2022), e68, pp.1–19; DOI 10.1017/fms.2022.43. https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FB96042ED962BAA031D1F39C7A8AA012/S2050509422000433a.pdf/quaternionic-hyperbolic-lattices-of-minimal-covolume.pdf
- **Kurinczuk–Skodlerack–Stevens** — Robert Kurinczuk, Daniel Skodlerack and Shaun Stevens, *Endo-parameters for p-adic classical groups*. arXiv:1611.02667v3, 31 August 2020. https://arxiv.org/pdf/1611.02667
- **Voight, *Identifying the matrix ring* (2019 revision)** — John Voight, *Author revision, 21 May 2019, 38 physical pages*.  https://jvoight.github.io/articles/quatalgs-051919.pdf
- **Voight, *Identifying the matrix ring*, errata** — John Voight, *Author errata, 21 May 2019, two pages, read in full*. Algorithm 3.22 correction, no Example 3.14 correction. https://jvoight.github.io/articles/quatalgs-errata.pdf
- **Quillen, *Higher algebraic K-theory I*** — D. Quillen, in *Algebraic K-theory I*, Lecture Notes in Mathematics 341 (1973), 85–147.
- **Waldhausen, *Algebraic K-theory of spaces*** — F. Waldhausen, in *Algebraic and geometric topology*, Lecture Notes in Mathematics 1126 (1985), 318–419.
- **Gan–Hanke–Yu 2001** — Wee Teck Gan, Jonathan Hanke and Jiu-Kang Yu, *On an exact mass formula of Shimura*. Duke Mathematical Journal 107 (2001), 101–133. Author-hosted published-layout copy. https://web.math.princeton.edu/~jonhanke/Web-02/Mass-Formula-of-Shimura/shimura-mass.pdf
- **Schlichting, *Higher Algebraic K-Theory*** — Marco Schlichting, *Higher Algebraic K-Theory (After Quillen, Thomason and Others)*, lecture notes, §§2.4.3–2.4.6, printed pp.181–183. https://warwick.ac.uk/fac/sci/maths/people/staff/marco_schlichting/research/sedanosln2008.pdf
- **Skodlerack–Stevens** — Daniel Skodlerack and Shaun Stevens, *Intertwining semisimple characters for p-adic classical groups*, accepted manuscript, §4, Theorem 4.4 and proof, pp.13–14. https://ueaeprints.uea.ac.uk/id/eprint/60983/1/Xin_manucript_2016.pdf
- **Schlichting, *Delooping the K-theory of exact categories*** — M. Schlichting, Topology 43 (2004), 1089–1103.
- **Segal, *Categories and cohomology theories*** — G. Segal, Topology 13 (1974), 293–312.
- **McDuff–Segal** — D. McDuff and G. Segal, *Homology fibrations and the group-completion theorem*, Invent. Math. 31 (1976), 279–284.
- **Iwaniec 1987** — H. Iwaniec, *Fourier coefficients of modular forms of half-integral weight*, Invent. Math. 87 (1987), 385–401.
- **Conway–Sloane** — J. H. Conway and N. J. A. Sloane, *Sphere packings, lattices and groups*, 3rd edition, Grundlehren 290 (1999).

- **Hironaka 2011v3** — Yumiko Hironaka, *Spherical functions on U(2n)/(U(n)×U(n)) and hermitian Siegel series*. arXiv:0904.4304v3, 3 March 2011. https://arxiv.org/pdf/0904.4304v3
- **Cho–Yamauchi 2020v2** — Sungmun Cho and Takuya Yamauchi, *A reformulation of the Siegel series and intersection numbers*. arXiv:1805.01666v2, 18 April 2020. https://arxiv.org/pdf/1805.01666v2
- **Weil 1964** — André Weil, *Sur certains groupes d’opérateurs unitaires*. Acta Mathematica 111 (1964), 143–211. Published-layout academic copy. https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf
- **Weil 1965** — André Weil, *Sur la formule de Siegel dans la théorie des groupes classiques*. Acta Mathematica 113 (1965), 1–87. https://doi.org/10.1007/BF02391774
- **Sansuc 1981** — Jean-Jacques Sansuc, *Groupe de Brauer et arithmétique des groupes algébriques linéaires sur un corps de nombres*. Journal für die reine und angewandte Mathematik 327 (1981), 12–80. https://doi.org/10.1515/crll.1981.327.12
- **Poonen, Tate's thesis** — Bjorn Poonen, *Tate's thesis*, Spring 2015 MIT lecture notes, 43 pages. https://math.mit.edu/~poonen/786/notes.pdf
- **Gross–Gan 1999** — Benedict H. Gross and Wee Teck Gan, *Haar measure and the Artin conductor*. Transactions of the American Mathematical Society 351 (1999), 1691–1704. https://doi.org/10.1090/S0002-9947-99-02095-4
- **Bruhat–Tits II** — François Bruhat and Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*. Publications Mathématiques de l'IHÉS 60 (1984), 5–184. https://www.numdam.org/item/PMIHES_1984__60__5_0/
- **Davenport 1951 and correction** — Harold Davenport, *On a principle of Lipschitz*. Journal of the London Mathematical Society 26 (1951), 179–183; correction, 39 (1964), 580. https://doi.org/10.1112/jlms/s1-26.3.179
- **Ciobotaru 2014v2** — Corina Ciobotaru, *A unified proof of the Howe–Moore property*. arXiv:1403.0223v2, 19 July 2014. https://arxiv.org/pdf/1403.0223v2
- **Kleinbock–Margulis 1998** — Dmitry Kleinbock and Grigory Margulis, *Flows on homogeneous spaces and Diophantine approximation on manifolds*. Annals of Mathematics 148 (1998), 339–360; arXiv:math/9810036. https://arxiv.org/pdf/math/9810036
- **Margulis–Tomanov 1994** — Grigory A. Margulis and George M. Tomanov, *Invariant measures for actions of unipotent groups over local fields on homogeneous spaces*. Inventiones Mathematicae 116 (1994), 347–392. https://doi.org/10.1007/BF01231565
- **Lindenstrauss 2001** — Elon Lindenstrauss, *Pointwise theorems for amenable groups*. Author manuscript dated 31 January 2001; published in Inventiones Mathematicae 146 (2001), 259–295. The layer's page locators refer to the author manuscript. https://doi.org/10.1007/s002220100162
- **Shah 1994** — Nimish A. Shah, *Unipotent flows on homogeneous spaces*. Ph.D. thesis, Tata Institute of Fundamental Research, 1994. https://people.math.osu.edu/shah.595/shah-phd.pdf
- **Dani–Margulis 1993** — S. G. Dani and G. A. Margulis, *Limit distributions of orbits of unipotent flows and values of quadratic forms*. Advances in Soviet Mathematics 16, Part I (1993), 91–137. This is the bounded-volume and general no-escape input named in Layer 4.
- **Mortenson 2016v2** — Eric T. Mortenson, *A double-sum Kronecker-type identity*. arXiv:1601.01913v2, 11 August 2016. https://arxiv.org/pdf/1601.01913v2
- **Mortenson 2017v2** — Eric T. Mortenson, *A Kronecker-type identity and the representations of a number as a sum of three squares*. arXiv:1702.01627v2, 13 February 2017. https://arxiv.org/pdf/1702.01627v2
- **O'Sullivan 2025v3** — Cormac O'Sullivan, *Topographs for binary quadratic forms and class numbers*. arXiv:2408.14405v3, 24 July 2025. https://arxiv.org/pdf/2408.14405v3
- **Siegel 1935** — Carl Ludwig Siegel, *Über die Classenzahl quadratischer Zahlkörper*. Acta Arithmetica 1 (1935), 83–86. [Publisher record](https://doi.org/10.4064/aa-1-1-83-86).
- **Banaszczyk 1993** — Wojciech Banaszczyk, *New bounds in some transference theorems in the geometry of numbers*. Mathematische Annalen 296 (1993), 625–635. https://doi.org/10.1007/BF01445125
- **Siegel 1945** — Carl Ludwig Siegel, *A mean value theorem in geometry of numbers*. Annals of Mathematics 46 (1945), 340–347. https://doi.org/10.2307/1969027
- **Lurie, Higher Algebra** — Jacob Lurie, *Higher Algebra*, author version dated September 2017. https://www.math.ias.edu/~lurie/papers/HA.pdf
- **CDH I** — Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus and Wolfgang Steimle, *Hermitian K-theory for stable infinity-categories I: Foundations*. arXiv:2009.07223v3, 27 December 2021. https://arxiv.org/pdf/2009.07223v3
- **CDH II** — The same nine authors, *Hermitian K-theory for stable infinity-categories II: Cobordism categories and additivity*. arXiv:2009.07224v5, 11 April 2025. https://arxiv.org/pdf/2009.07224v5
- **Hebestreit–Steimle 2025v5** — Fabian Hebestreit and Wolfgang Steimle, *Stable moduli spaces of hermitian forms*, with an appendix by Yonatan Harpaz. arXiv:2103.13911v5, 14 April 2025. https://arxiv.org/pdf/2103.13911v5
- **Hebestreit–Lachmann–Steimle 2023v2** — Fabian Hebestreit, Andrea Lachmann and Wolfgang Steimle, *The localisation theorem for the K-theory of stable infinity-categories*. arXiv:2205.06104v2, 14 March 2023. https://arxiv.org/pdf/2205.06104v2
- **Barwick, theorem of the heart** — Clark Barwick, *On exact infinity-categories and the Theorem of the Heart*. Author manuscript, §§1–6, pp.3–22; published in Compositio Mathematica 151 (2015), 2160–2186. https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/barwick-exact.pdf
- **Berrick–Karoubi–Schlichting–Østvær 2015v3** — A. J. Berrick, Max Karoubi, Marco Schlichting and Paul Arne Østvær, *The homotopy fixed point theorem and the Quillen–Lichtenbaum conjecture in hermitian K-theory*. arXiv:1011.4977v3, 18 February 2015. https://arxiv.org/pdf/1011.4977v3
- **Hu–Kriz–Ormsby** — Po Hu, Igor Kriz and Kyle Ormsby, *The homotopy limit problem for hermitian K-theory, equivariant motivic homotopy theory and motivic real cobordism*. Author manuscript, Theorems 16–20, pp.30–35. https://dept.math.lsa.umich.edu/~ikriz/ar1012.pdf
- **Milne 2006** — James S. Milne, *Arithmetic Duality Theorems*, second edition, BookSurge, 2006. Author's freely available text. https://www.jmilne.org/math/Books/ADT.pdf
- **Berrick–Karoubi 2005** — A. J. Berrick and Max Karoubi, *Hermitian K-theory of the integers*. American Journal of Mathematics 127 (2005), 785–823. Author-hosted published text. https://webusers.imj-prg.fr/~max.karoubi/Publications/68.pdf
- **Quillen 1972** — Daniel Quillen, *On the cohomology and K-theory of the general linear groups over a finite field*. Annals of Mathematics 96 (1972), 552–586. https://doi.org/10.2307/1970825
- **Platonov–Rapinchuk–Rapinchuk 2023** — Vladimir Platonov, Andrei Rapinchuk and Igor Rapinchuk, *Algebraic Groups and Number Theory*, Volume I, second edition, Cambridge University Press, 2023, Chapters 1–5. Locators in Layer 4 refer to this edition.

## Misprints in the sources

The following passages of the sources are misprinted or incomplete as printed; the targets above use the corrected statements. Each item gives the passage and the correction.

- **E1** (Couveignes2020, §3, published p.493 (PDF p.7).) Use 𝓛 ⊗_Z R, equivalently rationalize over Z first and then extend from Q to R.
- **E2** (Published p.1290 (physical PDF p.38), paragraph immediately after the proof of Proposition B.3; the preprint p.34 (physical p.34) has the stronger finite-group claim.) For nonsaturated Λ only Δ/Λ has nonzero torsion. Its map to π(Δ) has kernel (Δ∩span_R Λ)/Λ; π(Δ), being a subgroup of a real vector space, is torsion-free. B.3 itself remains valid under primitivity.
- **E3** (Published p.1290, Proposition B.4 proof, three transitions from squared Gram determinants to signed block determinants.) Use absolute values on all three determinants, or explicitly select compatible positively oriented bases/coordinates before these steps. The covolume quotient theorem is unchanged.
- **E4** (Preprint p.28, Example A.5; compare published p.1285, Example A.4.) The numerator is adj(BᵀB). The published displayed formula corrects it; its following prose still calls the adjugate that of B and should also say BᵀB.
- **E5** (Preprint p.34, Proposition B.5 proof, final paragraph and preceding span label; compare published p.1291.) Use the last complementary columns C of B: π(B) as an image lattice is spanned by π(C), not π(B′). The preceding common-span label must be VΛ-perp rather than VΛ. The published text replaces the proof with the correct direct pairing argument.
- **E6** (Preprint p.29, Proposition A.6 proof; compare published pp.1285–1286, Lemma A.5 and Proposition A.6.) Specify the quotient Haar measure and show the duality is induced by the identity on SO(n) and the inverse-transpose Cartan automorphism on GL(d). The published text supplies that argument; no measure-space claim is used in this blueprint.
- **E7** (Published p.1261, Definition 2.2, orientation on an arbitrary full lattice in VΛ-perp.) For arbitrary full L the criterion is det(B|C)>0. Equality to one is valid only with the additional normalization covol(Λ)covol(L)=1, which is imposed on the subsequently defined space of pairs but not on the stated arbitrary L.
- **E8** (Author course chapter dio19-2.pdf, Lemma 2.10, printed p.26 (physical p.16).) The coefficients of the r given vectors are indexed by i=1,…,r, matching both sums. The ambient dimension is n.
- **E9** (arXiv math/0204158v1, p.2, sentence after (1.2); preprint only.) For the displayed floor brackets, read greatest integer not greater than x.
- **E10** (§9.4.5: publisher version of record (2021), printed p.144 / physical p.160; also post-publication v1.0.7u (5 August 2026), printed p.140 / physical p.160. Both passages read; updated passage visually verified.) Every finitely generated torsion-free module over a DVR is free. The lattice applications have that torsion-free hypothesis because their carriers are submodules of a fraction-field vector space.
- **E11** (Course chapter dio19-2.pdf, remark after Theorem 2.9, printed pp.24–25 (physical PDF pp.14–15).) Require an invertible real linear transformation (a linear equivalence). Its nonzero determinant permits cancellation in the following covolume-to-volume quotient.
- **E12** (Example 9.8.2, post-publication v1.0.7u (5 August 2026), printed p.147 / physical p.167, final uniqueness assertion; rendered page inspected.) The stated normalization of a does not give a unique coefficient triple [a,1,c] within an integral isometry class. Retain existence of an atomic presentation, and require a separate justified classification/normalization for uniqueness.
- **E13** (Example 2.2, printed p.109 / physical PDF p.5; rendered author copy inspected.) Read P(R) as finitely generated projective right R-modules. The following bidual isomorphism and split exact category with duality assertion use that restriction.
- **E14** (arXiv math/0106063v6, prose immediately before Theorem 20.3.3, printed p.413 / physical p.429; rendered page inspected.) Insert unipotent in the preceding orbit-closure summary, as in the immediately following Theorem 20.3.3.
- **E15** (Example 3.14, printed p.13) Both correction terms have a minus sign.

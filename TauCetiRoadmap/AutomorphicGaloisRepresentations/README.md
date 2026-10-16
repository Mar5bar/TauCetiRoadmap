# Roadmap: galois representations attached to modular and Hilbert modular forms

**Summary.** Build the arithmetic realization of a cuspidal eigenform from
parabolic cohomology, coefficient projectors and local comparison, then identify
its rank-two Galois representations, fixed integral lattices and whole-ring
Hecke determinant. Higher-weight classical and geometric Hilbert constructions
lead to the unrestricted Hilbert constructor and full local compatibility;
weight one instead uses sparse eigenvalues and prime-to-order finite-group
lifting. The end results include strict fixed-eigenform compatible systems,
ordinary/crystalline realizations, large-image theorems and deformation maps
over integral Hecke algebras, with ramified monodromy and nilpotents retained.

## Scope and ownership

This roadmap owns arithmetic extraction from eigenforms, the concrete Kuga–Sato
projector and coefficient descent, the Hilbert normalization dictionary, and
comparison with integral Hecke and period realizations. Analytic form spaces,
Hecke operators, primitive/newform decomposition, modular-symbol rational
structures, coefficient fields and period lines belong to
TauCetiRoadmap.ModularForms. Tau Ceti's
`HeckeRing.GL2.EigenformAwayFromLevel` and `HeckeRing.GL2.Newform` already bundle
the analytic cusp form, character and good Hecke eigensystem; the newform bundle
also records the new-space condition and a₁=1. These are the analytic inputs,
not a second form-space definition. The Tau Ceti theorem
`TauCeti.det_tateModuleGaloisRepresentation`, for ℓ invertible in the separably
closed extension, and its Weil pairing supply the elliptic baseline.

Generic continuous representations, stable lattices, Weil–Deligne functors,
finite/Lie-group classification and Tate modules belong to
ArithmeticGaloisRepresentations and the existing Tau Ceti library. Generic
finite-group averaging is Mathlib's representation invariant projector.
TauCetiRoadmap.LocalGaloisGroups Layer 5 supplies the cyclotomic reciprocity
formulas `localCyclotomicCharacter_artinMap_unit` and
`localCyclotomicCharacter_artinMap_uniformizer`; their geometric normalization
is an input to the attached-character comparison below.
Generic determinant laws, Cayley–Hamilton reconstruction and coefficient descent
belong to TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants; the new targets here
extract the geometric Hecke module and apply those laws to that module.
Its Layer 3a.1 also supplies characteristic-polynomial duality, character
scaling and the classical k≥2 coefficient normalization. The light coefficient
expressions below fix the additional weight-one and inverse-Hecke-operator
conventions; they do not introduce another determinant or scaling theory.

The compatible-system carrier and character converse needed by this construction
are defined here before any potential-modularity application. The finite-weight
nearly ordinary data, ordinary attached-character formulas, and the particular
weight-two optimization/level-lowering inputs are also here. Their more general
modularity-lifting, Serre-weight and potential-automorphy applications consume
these interfaces. No such later theorem is a prerequisite of the attached
representation. The algebraic-character and generic period interfaces of
AutomorphicGaloisRepresentationsPartII, AG2.0 and AG2.P, are independent
suppliers. The unitary and GL₃ geometric instances used here are targets of
§0.6; comparison of the resulting rank-two members uses the local theorems below.

## Conventions

Let F be totally real, d=[F:Q], and π a cuspidal representation of GL₂(A_F).
Its infinity type `(k,w)` means that at each real embedding τ its component is
the discrete series D_{k_τ,w}, with k_τ≥2, k_τ≡w modulo 2, and central character
`t ↦ sgn(t)^{k_τ}|t|^{-w}`. Parallel weight is asserted only when stated.
For a coefficient number field E and λ|ℓ, representations are continuous over
E_λ; enlarge E when needed. No minimal field of definition is built into the
Hilbert constructor.

At an unramified finite v, write q_v for the residue cardinality and ϖ_v for a
uniformiser. The eigenvalues t_v and s_v are those of the double cosets
`diag(ϖ_v,1)` and `ϖ_v I₂`, respectively. Local class field theory sends ϖ_v to
**geometric** Frobenius. For v∤ℓ the cyclotomic character ε_ℓ has value q_v⁻¹
there, and corresponds to `|·|_v`. At v|ℓ its reciprocity values include
the algebraic norm factor specified in §4.11; q_v⁻¹ is not its value
at a coefficient-prime uniformizer.

The single Hilbert object used throughout is ρ_{π,λ}, characterized at good
geometric Frobenius by

`P_v(X)=X²−t_vX+q_vs_v`.

Its determinant is χ_{π,λ}ε_ℓ⁻¹. Here χ_{π,λ} is the Galois character of π's
central character. A twist by an algebraic Hecke character η multiplies the
representation by η_λ. In particular, π⊗|det|⁻¹ has type `(k,w+2)` and its
representation is ρ_{π,λ}⊗ε_ℓ⁻¹. Its good polynomial is
`X²−q_vt_vX+q_v³s_v`.

| Source object | Expression in this convention |
| --- | --- |
| Carayol σ_λ(π) | ρ_{π,λ}⊗χ_{π,λ}⁻¹ = ρ_{π^∨,λ} = ρ_{π,λ}^∨⊗ε_ℓ⁻¹ |
| Saito ρ_{f,λ} | Carayol σ_λ(π_f), with Saito weight w_S translated by w=2−w_S |
| Kisin ρ_{π,λ} and Skinner ρ_π | ρ_{π,λ} itself |
| Classical cohomological M_{f,λ}, type `(k,k−2)` | ρ_{π_f,λ} |
| Deligne's classical arithmetic representation | M_{f,λ}^∨ |
| Skinner–Wiles arithmetic representation | σ_λ(π)^∨ = ρ_{π,λ}⊗ε_ℓ |
| Khare–Wintenberger arithmetic representation | ρ_{π,λ}^∨ in their type `(k,k−2)` setup |
| CDN ρ_Π, whose cohomology multiplicity is ρ_Π(−1) | ρ_{π,λ}^∨ for the corresponding GL₂ transfer |

Saito and Carayol use inverse-uniformiser operators. Their eigenvalues are
`τ_v=t_v/s_v` and `r_v=s_v⁻¹`; `X²−τ_vX+q_vr_v` describes σ_λ(π), not ρ_{π,λ}.
The Skinner–Wiles polynomial at arithmetic Frobenius has these same coefficients.
A dual alone does not convert Carayol to the global object: the cyclotomic twist
is part of the identity.

Use the grading `D_HT(V)=⊕_n(V⊗C_p(n))^{G}`. In that grading ε_ℓ has degree −1,
and H¹_ét of an elliptic curve has degrees 0 and 1. At τ the degrees of
ρ_{π,λ} are

`((w−k_τ+2)/2, (w+k_τ)/2)`.

Both are integral by parity, and their difference is k_τ−1. The good-place
Frobenius weight is w+1. If cyclotomic Hodge–Tate weight is instead declared +1,
the corresponding weights are the negatives of these degrees. Skinner's printed
pair `((w−k_τ)/2,(w+k_τ−2)/2)` requires the shift w↦w+2 to express our type;
it must not be combined unshifted with his central-character parameter. For Δ,
type `(12,10)` gives degrees 0,11 and weight 11; for weight two, type `(2,0)`
gives degrees 0,1.

For Weil–Deligne data at geometric Frobenius F, use `FNF⁻¹=q_v⁻¹N`.
Frobenius-semisimplification keeps N. Thus a Steinberg parameter cannot be
replaced by the semisimple sum of its two characters. The cohomological local
parameter is `Rec_v(π_v⊗|·|_v⁻¹/²)`; its L-factor is `L(s−1/2,π_v)` and its
conductor is that of π_v. In Carayol's convention use π_v^∨ in this L-factor.

For a classical normalized newform of weight k, level N and nebentypus ψ,
`t_p=a_p` and `s_p=ψ(p)p^{k−2}`. The cohomological polynomial at geometric
Frobenius, and the arithmetic-dual polynomial at arithmetic Frobenius, are both
`X²−a_pX+ψ(p)p^{k−1}`. The cohomological polynomial at arithmetic Frobenius
instead has inverse roots. Diamond–Flach–Guo's initial factor realizes the
conjugate eigensystem; the ψ⁻¹ twist below identifies our M_f. Test this with a
character of order greater than two, where ψ and ψ⁻¹ differ.

Reduction always means choose a stable lattice, reduce, then semisimplify.
Only this last object is lattice independent. Residual recognition uses full
characteristic polynomials, including in characteristic two. Distinguish
characteristic-zero global absolute irreducibility, residual absolute
irreducibility, strong irreducibility after restriction to open subgroups, and
local reducibility in an ordinary filtration.

## Exact supplier contracts

Imports below specify mathematical obligations, including necessary extensions
in the supplier's direction. Naming a contract does not assert that its proof is
already in a library. Geometric comparison, local transfer and eigenvariety
interpolation are used only in the stated scope. In particular, an all-place
comparison cannot be deduced from almost-all Satake equality, and field-valued
eigenpoints cannot determine a nilpotent Hecke determinant.

### From Mathlib and the pinned Tau Ceti library

The baseline is Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Use `ModularForm` and `CuspForm`
with their subgroup and integer-weight parameters, and `Representation` as the
monoid homomorphism into linear endomorphisms. `Submodule.restrictScalars`
retains the underlying set under a scalar tower. `Representation.averageMap`
and `Representation.isProj_averageMap` require a finite group with a chosen Fintype
and an invertible group order.
`Matrix.det_fin_two` and `DualNumber.eps` support the division-free and
nilpotent negative controls. `Matrix.card_GL_field` counts all of GL_n over a
finite field, not a selected residual image.

`Subgroup.exists_right_complement'_of_coprime` requires a normal subgroup with
order coprime to its index; `nonempty_sections_of_finite_inverse_system`
requires nonempty finite stages and a directed index preorder. The group-lifting
proof must establish these hypotheses at each congruence stage.
`DirichletCharacter.LFunction_apply_one_ne_zero` requires a nontrivial complex
character with nonzero modulus; `riemannZeta_residue_one` is the residue limit at 1.
`NumberField.Embeddings.finite_of_norm_le` requires integrality and a bound at
every embedding. `TauCeti.LSeries.landau` requires nonnegative coefficients and
the actual finite abscissa of absolute convergence; a boundary inequality is
insufficient. Euler logarithms, bounded prime-power remainders and the normalized
prime sum remain the analytic supplier obligations below.

The analytic eigenform and newform carriers are
`HeckeRing.GL2.EigenformAwayFromLevel` and `HeckeRing.GL2.Newform` in
`TauCeti.NumberTheory.ModularForms.Newforms.Newform`; N is nonzero, k is an
integer and the nebentypus is a character of `(ZMod N)ˣ`.
`TauCeti.det_tateModuleGaloisRepresentation` in
`TauCeti.AlgebraicGeometry.EllipticCurve.TateModule.Determinant` requires
`(ℓ : K) ≠ 0` for the chosen separably closed extension K.
LocalGaloisGroups Layer 5 supplies `localCyclotomicCharacter_artinMap_unit`
and `localCyclotomicCharacter_artinMap_uniformizer`, with arithmetic Artin
normalization; invert that map for the geometric formulas used here.

### From ModularCurvesPartII

**Sections 14.1–14.4, 14.8, 14.11–14.12.** The universal elliptic
coefficient system Sym^{k−2}, finite and adic parabolic cohomology, boundary
and interior comparison, change of level, cohomological Hecke pull–push,
Poincaré pairing and the geometric modular-symbol lattice. Sections 7.1–7.6
supply the Hodge line, q-expansion pairing and weight-two differential
comparison. The Betti/de Rham/étale premotivic package, Scholl/DFG projector
comparison, coefficient-field action and S-integral newform kernel are the
applications of §§1.1–1.6, using the generic period comparisons specified below.
Here S contains the primes dividing Nk!, and integral Fontaine–Laffaille
comparison retains its safe interval. No crystalline integral comparison is
asserted at an excluded prime. (Diamond–Flach–Guo §§1.2, 2–3, Lemma 4.12.)

**Sections 13.3–13.6, 14.13–14.15.** The weight-two Hecke algebra 𝕋_ℤ of Γ_H(N) generated by the T_n and ⟨d⟩, acting on J_Γ and T_ℓ(J_Γ) compatibly with G_ℚ; faithfulness on S₂(Γ, R) and finite freeness of 𝕋_R; the Weil-pairing adjointness of T and w_N T w_N; and H₁(X_Γ, ℤ) ⊗ ℚ free of rank two over 𝕋_ℚ (Darmon–Diamond–Taylor Lemmas 1.34–1.39).

**Sections 17.1–17.2.** Weight-two special-fibre Eichler–Shimura correspondence with Frobenius/Verschiebung components and the corrected ordinary versus supersingular subgroup-scheme fibres. The conventions (the model of X₁(N), the Picard or Albanese action of T_p and ⟨p⟩) under which an arithmetic Frobenius on V_ℓ(A_f) has characteristic polynomial X² − a_pX + ψ(p)p (Darmon–Diamond–Taylor Theorems 1.41 and 3.1(a)); a character of order at least three distinguishes ψ from its inverse.

### From ArithmeticGaloisRepresentations

**Layer 6.** Tate modules of abelian varieties as continuous G_Q-modules, with their K_f-action for A_f, and smooth proper base change for good reduction.

**Sections 1.1–1.10.** Existence of G-stable lattices in continuous ℓ-adic representations of compact groups and Brauer–Nesbitt independence of the semisimplified reduction; Čebotarev uniqueness in characteristic zero, and full-polynomial recognition in arbitrary residue characteristic. Dirichlet characters as finite-order G_Q characters through Gal(Q(ζ_N)/Q), arithmetic good Frobenius value χ(q), and the ℓ-adic cyclotomic character of good Frobenius value q; used for the Eisenstein direct sum. For a complete DVR with finite residue field of characteristic ℓ, reduction GL_n(O/π^(m+1))→GL_n(O/π^m) is surjective; its successive congruence kernels are additive matrix ℓ-groups, and GL_n(O) is the topological inverse limit of these groups. Residual recognition in characteristic ℓ uses full characteristic polynomials, not traces alone. Stable lattices and lattice-independent residual semisimplification of the Hilbert eigenform representations, followed by full-polynomial recognition over the residue field; the classical-newform residual construction is not this Hilbert input.

**Sections 2.1–2.6.** Weil–Deligne representations of local Weil groups with Deligne's normalisation F N F^{−1} = q^{−1}N for geometric Frobenius, Frobenius-semisimplification and Grothendieck's ℓ-adic monodromy theorem. Purity of Weil–Deligne representations in the monodromy sense (Deligne): q-Weil numbers, the classification of Frobenius-semisimple indecomposables Λ ⊗ V_t, and stability of purity under sums, duals, Tate twists and tensor products (Blasius §§1.8–1.10, Proposition 1).

**Layer 4 and §§5.12, 7.6–7.7.** Dickson's classification for subgroups G of GL₂(F_ℓ) whose identity representation is semisimple, in the form of Serre, Propriétés galoisiennes des points d'ordre fini des courbes elliptiques (Invent. Math. 15, 1972), §2, Propositions 15–16, as Deligne–Serre 7.2 use it: G contains SL₂(F_ℓ), or lies in a Cartan subgroup, or lies in the normaliser of a Cartan subgroup but not in it, or has projective image A₄, S₄ or A₅. The reducible (diagonalisable) case is included. Continuous finite-dimensional Clifford theory and Ribet 1975 Theorem 2.3 for compact semisimple λ-adic groups with an open abelian subgroup and infinite projective image. Dickson classification with subfield form, exceptional-group bounds and tame-inertia order argument; generic finite/Lie-group input only, the non-CM Hilbert application is owned here. Generic compact λ-adic Lie-group Zariski closure, quaternionic norm-one groups, finite-group classification and integral commutator lifting. The modular inner-twist/Momose application remains owned by Layer 7.

**Layer 5.** Čebotarev recognition in characteristic zero for representations of G_ℚ with finite image (Deligne–Serre Lemme 3.2), after realising both over a common field; coefficient descent over a finite field (Lemme 6.13); and the fact that every element of a finite image of G_ℚ is a Frobenius at a prime outside any given finite set. Čebotarev/Brauer–Nesbitt recognition and continuous rank-two pseudorepresentation recognition; generic character recognition only; Hilbert irreducibility is proved by §3.14. Serre §7.2 Corollary 2 trace-zero density theorem for a non-CM modular λ-adic representation, or the general p-adic analytic Chebotarev/Haar-zero hypersurface theorem that implies it. Continuous semisimple recognition by good Frobenius traces.

### From GL2AutomorphicRepresentationsAndTransfer

**R16.3.** Local Langlands for GL_2(Q_p) and GL_2(F_v) with the Hecke normalisation σ_h (Carayol 0.5) and its relation to Langlands' (twist by ω^{1/2}, contragredient); preservation of conductors, L- and ε-factors; unramified twists of Steinberg ↔ N ≠ 0. Twisting and duality for the Langlands parameter: Rec_v(π_v ⊗ (χ∘det)) = Rec_v(π_v) ⊗ Rec_v(χ), Rec_v(π_v^∨) = Rec_v(π_v)^∨, π_v^∨ ≅ π_v ⊗ χ_{π_v}^{−1} for GL₂, and preservation of L-, ε-factors and conductors under these operations.

**R17.3.** The Jacquet–Langlands correspondence between automorphic representations of (D ⊗ A_F)^× and cuspidal representations of GL_2(A_F) that are discrete series at the ramification places of D, with local functoriality at every place (one-dimensional representations of D_v^× ↔ unramified twists of Steinberg), as used by KW II §7 and Taylor. Jacquet–Langlands to the totally definite quaternion algebra split at all finite places (Skinner §2.4.2), matching T^S-eigensystems.

**R17.4, especially §§R17.4.3, R17.4.13 and R17.4.17.** Local and global base change for GL₂ along extensions of degree at most 3: Langlands for cyclic extensions and Jacquet–Piatetski-Shapiro–Shalika for non-Galois cubic ones, with the compatibility of the lift with restriction of the Weil–Deligne representation for principal series, special and ordinary cuspidal π, which Carayol (12.2.2) asserts without a reference. Cyclic totally real base change, descent and compatibility of attached good-prime polynomials with restriction; do not infer non-normal cubic base change from cyclic base change. Cyclic and non-normal cubic base change with local parameters and compatibility with Galois restriction, including Carayol §12.2.2; cyclic base change alone does not supply the cubic step. Section R17.4.17 supplies the nonnormal cubic comparison. Carayol §12.2.1–12.2.2 uses its local parameter/restriction assertion for principal series, special and ordinary cuspidal components at the chosen place, in addition to almost-all Satake transfer. Abelian (cyclic, solvable) base change of a cuspidal π of infinity type (k,w) to a totally real F′, cuspidal unless π is induced from F′, compatible with Satake parameters at unramified places and with Rec at every place; totally real quadratic base change; and the Gelbart–Jacquet lift Sym²π ⊗ |·|^{−1} to GL₃, cuspidal for non-CM π.

**R17.5.** Automorphic induction 𝒲(L, ξ) from a CM quadratic extension L/F with prescribed local component, archimedean types and behaviour at v (Carayol 11.2); Tunnell's globalisation of primitive local representations ([Tu. 1], Theorem 1.3); and the Artin conjecture for tetrahedral (Langlands) and octahedral (Tunnell) representations, with Jacquet–Langlands chapter 12. Algebraic Hecke-character automorphic induction for quadratic extensions, theta-series correspondence, nontrivial quadratic self-twist criterion and index-two induced representation dictionary. The Grunwald–Wang existence theorem in the form Blasius §2.2 uses: for a totally real F, a finite place v and a finite-order character ψ of F_v^×, a finite-order idele class character η of F with η_v = ψ. Use §R16.1.8 for the extension with prescribed full local components; §§R17.5.15–R17.5.16 supply the stated globalization and induction.

**Section R16.4.4.** Strong multiplicity one: the away-p finite component of a cohomological cuspidal GL₂ transfer determines its p-component; used in CDN Proposition 5.2.

**R16.2.** Classification of the irreducible unitary generic representations of GL₂(F_v): tempered (supercuspidal, twist of Steinberg, unitary principal series) or complementary series π(μψ, μ^{−1}ψ) with μ = |·|^t, 0 < t < 1/2 (Blasius §2.2).

### From HilbertModularVarietiesAndShimuraCurves

**R18.4.** Shimura curves attached to quaternion algebras over totally real fields split at one real place, with the ℓ-adic sheaves F_λ and the Hecke decomposition of their cohomology used by Carayol (§§1–10). The CDN §5.2.1 quaternionic Shimura-curve tower and automorphic decomposition of H¹ with π_f⊗ρ_π(−1), all group actions and direct limits; HK/de Rham multiplicity extraction is owned here. Faithful generic rank-two Hecke multiplicity module from geometric cohomology, including the completed local algebra’s generalised eigenspaces, coefficient change and topology; needed before law descent. The quaternionic surfaces and their H² constituent comparison are constructed in §0.7; they are not part of the Shimura-curve carrier.

**R18.2.** Carayol's integral models of Shimura curves and their bad reduction (Compositio 59, 1986), on which Theorem (B) depends.

**Sections R18.2.3, R18.2.6, R18.5.19–R18.5.21.** The quaternionic
p-divisible sheaf, split-place height-two Drinfeld level models, the selected
component fields and compatible local tower geometry. Section 3.5 constructs
the supersingular local vanishing-cycle representation 𝒰 and its three
commuting actions from this geometry; the representation itself is part of
that target. The comparison with completed strict-henselization generic-fibre
cohomology uses Brylinski's appendix to Carayol.

### From WeightsInEtaleCohomology and DeligneWeightsAndPurity

WeightsInEtaleCohomology R34.3, “Saito's semistable model and period comparison”,
and R34.6, “Hilbert eigensummands and local monodromy weights”, supply the
geometric Saito comparison: g>1, w_S≥k_τ≥2, parity, and a finite discrete-series
place in even degree. Retain the coefficient projectors, nonconstant-coefficient
vanishing and the p-normalized monodromy. R34.6, “Transport through actual
arithmetic comparisons”, transports the geometric result through an actual
comparison; it supplies no unrestricted Hilbert theorem. R34.5–R34.6 supply
classical parabolic/Kuga–Sato purity with the projector hypotheses. In Saito's
source grading the étale and log-crystalline monodromy filtrations have weight
w_S−1 (Saito §8, Proposition 1, §10). The generic geometric input is independent
of the coefficient-prime application of Layer 4.

DeligneWeightsAndPurity §§4.3 and 7.15 supplies proper smooth purity. The surface
weight–monodromy theorem and the quaternionic surface realization required in
the even-degree weight-two case are the precise targets of §0.7.

### From AlgebraicModularFormsAndSerreWeights

**R15.5.** Mod-ℓ modular forms: the Eisenstein weight shift and the lifting of mod-λ eigenvalues (Deligne–Serre 6.9–6.11). Deligne–Serre 6.7 includes noncuspidal forms and coefficient characteristic dividing the level. Its reduction-to-weight-at-least-two application assumes a cuspidal integral reduction and ℓ prime to level; retain it for that subset and supply the general Eisenstein weight-shift/reduction-image argument and its integrality hypotheses for 6.7. The lifting lemma in R15.5, “The lifting lemma and its sharp limits”, supplies the finite-free commuting-Hecke input.

**R15.2.** Generation of the weight-two Hecke algebra 𝕋_R of Γ_H(N) (Darmon–Diamond–Taylor Lemma 4.1): by the T_n, or by the T_p and ⟨d⟩; and, for D prime to N with D odd or 2 invertible in R, by the T_n with (n, D) = 1 (Diamond–Im Proposition 3.5.1; Wiles 1995, p. 491).

### From IntegralHeckeAndGaloisDeterminants

**IHG.1.** Chenevier Theorem 2.22(i): faithful Cayley–Hamilton quotient over a henselian local coefficient ring with residually split absolutely irreducible determinant is M₂(A); reconstruction, conjugacy/strict equivalence and continuity. No algebraically-closed-residue hypothesis and no Deligne–Serre lifting step. Characteristic-zero continuous semisimple reconstruction of the compatible Taylor trace/determinant, without assuming that the residual representation at every λ is absolutely irreducible. Pseudo-character reconstruction of a continuous semisimple representation from compatible traces and determinants modulo λ^s (Taylor's congruence branch).

**IHG.4.** Integral descent/interpolation of a degree-two determinant from an actual rank-two generic Hecke module over a finite flat complete coefficient algebra: closed integral traces, cross coefficients without 1/2, universal polynomial-law identities, finite quotients and continuity. Field-valued reduced points alone are insufficient. For the reduced O-flat KW algebra, descend the full determinant law from its actual product representation using integral traces/determinants and mixed coefficients; record continuity. This is an instance of generic interpolation, not Theorem B over an algebraic closure.

### From GlobalGaloisDeformations

**R04.3.** The universal deformation ring R_Σ of liftings of type Σ of an odd absolutely irreducible ρ̄ : G_ℚ → GL₂(k), ℓ odd (determinant ε, the flat, ordinary or semistable condition at ℓ, minimal ramification at p ∉ Σ, no condition at p ∈ Σ − {ℓ}), with its universal representation ρ^univ_Σ, and the stability of these local conditions under products, subobjects and quotients. Representability and coefficient-quotient stability of the specified fixed-determinant/minimal/ordinary/flat type-Σ local functors and their global universal ring; supply the DDT Lemma 3.27 finite-quotient argument without a false product-embedding assumption. For the Hilbert non-Eisenstein residual representation, the universal fixed determinant ψχ_p deformation functor unramified outside S (and with every local condition explicitly named when one is imposed). Check the Schur and finite-generation hypotheses of LocalGaloisDeformationRings §§F.2.2, F.2.5 before invoking the universal ring.

### From TauCetiRoadmap.ModularForms

**layer 4 eigenforms newforms primitive forms the conductor.** The newform decomposition S₂(Γ_H(N), K) = ⊕_f S_{K,f} over newforms f of level N_f | N, with S_{K,f} spanned by the f(aτ), a | N/N_f (Darmon–Diamond–Taylor Theorem 1.22), and the characteristic polynomial u^{v−1}(u² − a_p(f)u + ψ_f(p)p) of T_p on the span of the f(ap^iτ), v = v_p(N/N_f). For Deligne–Serre 5.2, in any weight k: an eigenform of the T_p, p ∤ N, has the eigenvalues of a newform of level dividing N (Atkin–Lehner–Li), whose coefficients are multiplicative with a_{p^m} = a_p^m and |a_p| < p^{k/2} at p | N.

**layer 0 diamond operators and modular forms with character nebentypus.** Weight-one Eisenstein series with character and their Hecke eigenvalues: an Eisenstein eigenform of type (1, ε) on Γ₀(N) has a_p = χ₁(p) + χ₂(p) for p ∤ N, with Dirichlet characters satisfying χ₁χ₂ = ε (Hecke, Mathematische Werke p. 690, as cited in Deligne–Serre 8.1); and the Hecke-stable decomposition M₁(N, ε) = S₁(N, ε) ⊕ E₁(N, ε). For weights k≥2, the Hecke-stable cusp/Eisenstein decomposition and Eisenstein good-prime eigenvalue χ₁(q)+χ₂(q)q^{k−1}, with χ₁χ₂=ε, conductor and parity hypotheses; these give the two arithmetic character summands in Deligne–Serre Theorem 6.1.

**layer 8 modular symbols the integral hecke algebra and coefficient fields.** Use the existing modular-symbol rational structure, coefficient field, integral new Hecke algebra and ± period lines. Do not reconstruct or renormalise these upstream objects. For the weight-one sparse-eigenvalue proof, use the already specified sublayer8W inside this layer: Deligne–Serre Proposition2.7 integral-q-expansions-at-all-cusps finite-free Hecke-stable lattice, number field and algebraic-integral good-prime eigenvalues. The weight-one lattice precedes the Artin construction and is separate from the k≥2 modular-symbol proof.

**layer 8g galois stability the character field and rationality.** Use the existing conjugate-eigensystem construction over coefficient-field embeddings to obtain a weight-one eigenform with every good-prime eigenvalue σ(a_p). Layer8G imports the weight-one lattice from sublayer8W; use that branch and the existing eigenform/newform reduction when needed. Do not apply a discontinuous complex automorphism termwise to analytic functions or replan the upstream construction.

### From LefschetzPencilsAndVanishingCycles

**LPV.0.** The vanishing-cycle exact sequence for a proper curve over a strictly henselian discrete valuation ring with a lisse coefficient sheaf, and its compatibility with finite étale covers and group actions, as Carayol uses it in 4.2–4.5.

**Sections 7a.1–7a.3.** Picard–Lefschetz for a stable curve X over a strictly henselian discrete valuation ring (after the Deligne–Mumford semistable reduction theorem): the monodromy logarithm N maps H¹(X_η̄, F)(1) onto ker(H¹(X_s, F) → H¹(X̃_s, F)), the kernel of pull-back to the normalisation X̃_s, for a lisse F (Carayol 11.4–11.10, Langlands [L.1] for F = ℚ).

### From AutomorphicLFunctionsAndLocalFactors

**AL.3.** Rankin's theorem for a classical newform f = Σa_nqⁿ of type (k, ε) on Γ₀(N) (Rankin 1939; Deligne–Serre 5.2 also cite Jacquet LN 278, Li and Ogg): Σ|a_n|²n^{−s} converges for Re s > k, and ζ(2s − 2k + 2)·Σ|a_n|²n^{−s} extends meromorphically to ℂ with a single pole, simple, at s = k. This is the classical specialisation of the GL₂ × GL₂ Rankin–Selberg integral. Holomorphy of the standard L-function of a cuspidal GL₂ representation under the stated twist, and nonvanishing of the finite-order Hecke-character L-value at the noncancellation point in Skinner p. 256. For cuspidal π on GL₂(A_F) and an algebraic Hecke character ψ, L(π ⊗ ψ, s) is entire; Hecke L-functions L(ψ, s) do not vanish at s = 1 + n, n ≥ 0, and ζ_F has a pole at 1.

### From TauCetiRoadmap.Chebotarev

**layer 10 dirichlet density chebotarev.** Čebotarev's density theorem in Dirichlet density over ℚ: for a finite Galois extension M/ℚ and a conjugacy class C of Gal(M/ℚ), the unramified primes with Frobenius in C have Dirichlet density |C|/[M : ℚ]; in particular the primes that split completely in a Galois number field form an infinite set.

**layer 3 prime sums and density normalization.** The upper Dirichlet density dens.sup X = limsup_{s→1⁺} Σ_{p∈X} p^{−s}/log(1/(s − 1)) of a set X of rational primes (Deligne–Serre (5.4.1)), with Σ_p p^{−s} = log(1/(s − 1)) + O(1), monotonicity and finite subadditivity.

### From FiniteFlatGroupsAndIntegralPadicHodgeTheory

**R07.3.** Integral Fontaine–Laffaille comparison with coefficients and kernels for weights [0,k−1] inside [0,ℓ−2]; do not extend the proof to endpoint weights. Residual labelled tame-inertia characters for the regular Hilbert weights at sufficiently large unramified coefficient characteristic; inputs to Dimitrov §§2.12–2.13 and 3.1–3.2. The residual representation of a classical newform on inertia at ℓ for ℓ larger than the weight and prime to the level (fundamental characters of level one or two), as Ribet 1985 Theorem 2.1 uses it.

**R07.4.** Weight-two good-reduction crystalline representation from the p-divisible group of the modular abelian quotient; Barsotti–Tate equivalence in the stated coefficient conventions. The precise inertial/Hodge-type characterisation of weight-two potentially Barsotti–Tate lifts, including p=2 caveats; no extension of small-range Fontaine–Laffaille to weight p+1. The weight-two potentially Barsotti–Tate identification used in KW II Corollary 7.8(ii), with its norm-factor and local type hypotheses.

### From LocalGaloisDeformationRings

**Sections 3.1–3.7.** Kisin 2.7.6/2.7.7 fixed potentially semistable/crystalline inertial and Hodge-type quotient for any complete Noetherian local A° with a free continuous family, with finite-projective period module and coefficient specialisation. The universal pst-deformation-ring node alone is insufficient.

### Period and geometric comparison suppliers

PadicPeriodRings §§4.1–4.3 supplies the actual period rings, topologies,
actions, invariant functors and dimension predicates. FiniteFlatGroupsAndIntegralPadicHodgeTheory
§§R07.P7.1–R07.P7.3 supplies finite coefficient actions, labelled Hodge–Tate
and Sen operators, and rank-one local algebraicity. Its labelled convention
assigns +1 to the cyclotomic character; negate those labels for this roadmap's
D_HT grading. Sections R07.3.0–R07.3.3 and R07.4.13 supply filtered (φ,N)-modules,
weak admissibility, the induced-subobject inequality, exactness, full
faithfulness and weakly admissible implies admissible. Sections R07.4.27–R07.4.28
supply descent data at their stated odd-prime hypotheses.
AutomorphicGaloisRepresentationsPartII AG2.P, “Finite-coefficient periods,
descent and geometric comparison”, supplies the finite-field-coefficient
period API and potentially semistable WD descent at every prime, with tensor,
dual, Tate, idempotent and coefficient-change laws. Its geometric comparison
covers proper smooth good-reduction and proper strictly semistable realizations,
with Hyodo–Kato cohomology, filtration, cup products and algebraic
correspondences. These generic comparisons do not assert the eigenform
filtration of §4.11. CrystallineCohomology CR.6 supplies the Hyodo–Kato complexes.

The all-unit rank-one Frobenius formula, central-isogeny lifting, quaternionic
finite-slope family, analytic continuation of a crystalline period and
all-weight Wach construction are the targets of §§0.1–0.5. In particular,
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.26 supplies its p-divisible-group
cyclotomic-frame comparison at p>2, rather than an all-weight Wach theorem.

### From ArithmeticDirichletSeries (Completed), Layer 3

**layer 3 local factors and euler products.** For Dirichlet characters χ, expand log L(χ,s) in the absolutely convergent Euler product for real s>1, and bound the prime-power terms with exponent m≥2 uniformly as s→1+. Combined with nonvanishing L(χ,1), this gives bounded nontrivial-character prime sums; with the zeta residue it gives the trivial-character prime-sum logarithm used in Deligne–Serre 8.4.

### From AutomorphicGaloisRepresentationsPartII

**AG2.0, “The l-adic character r_{l,ι}(χ) of an algebraic Hecke character, its
Hodge–Tate numbers and its weight”.** Algebraic-character avatars, compatible
coefficient change, geometric reciprocity and labelled local degrees. Use this
rank-one construction without the higher-rank existence theorem. The generic
AG2.P period contract is specified above; the independent unitary geometry
and packet calculation needed by Skinner are the targets of §0.6.

### Analytic and unitary geometry suppliers

LocallyAnalyticDistributions §§4.2, 4.15–4.16 supplies Fredholm determinants,
Banach families and finite-slope decompositions; the carriers and Riesz
projectors come from CompactOperators §§1.7, 3.1–3.5 and 4.3 and the affinoid
gluing from RigidAnalyticGeometry Layers 1 and 6. The quaternionic eigenvariety
and classicality/density instance are constructed in §0.3. ShimuraVarieties
Layers 1–4 and §§8.18–8.23 supplies algebraic towers, canonical models and
minimal compactification functoriality used by §0.7.
PELModuli M0–M4 supplies the specified unitary PEL moduli problem, universal
abelian schemes, levels, good-prime integral models and canonical-model
comparison. EndoscopicTransferAndUnitaryTraceComparison §§13.1–13.4 supplies
unitary base change and cohomological transfer with its packet hypotheses.
Section 0.6 constructs the particular Blasius–Rogawski packet and cohomological
realizations, including its multiplicity and character corrections.

### Geometry and character contracts used by the concrete constructions

For the Kuga–Sato target, TauCetiRoadmap.StableReduction Layer 4 supplies the
Rees-algebra/relative-Proj blowup, its universal property and base change.
EtaleCohomologyFoundations §§0.7, F.4.5–F.4.6, F.5–F.7 supplies equivariant cohomological
pull–push, localization, duality and the projective-bundle comparison over
characteristic-zero coefficients. The explicit sequence of blowups, its local
charts, the Γ_r action and the parabolic boundary comparison are proved here
from Scholl §§2–3; they require no general resolution-of-singularities theorem. For the geometric-character
converse use ClassFieldTheory's geometric reciprocity, GlobalNumberFields'
idele/ray-class and unit theorems, and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.3’s rank-one local
classification. These generic suppliers do not assert the modular irreducibility
theorem which the character converse will prove here.

For the optimized weight-two and squarefree level-lowering targets, the
ModularCurvesPartII input must include the named degeneracy maps and localized
Ihara injectivity under their local/residual hypotheses. The weight-two
optimization and level-lowering deductions are targets of Layer 6 and Layer 7,
respectively. They cannot be imported from a later general weight roadmap.

## How to read the build

Layer 0 gives the specific period, analytic-family and geometric interfaces used
by the constructions. Layer 1 constructs classical geometric factors and their coefficient action.
Layer 2 completes the separate weight-one finite-image argument. Layer 3 builds
the geometric Hilbert local pieces, then the unrestricted representation,
its Hodge property and irreducibility. Layer 4 proves geometric weights and
local compatibility on both sides of the coefficient characteristic; its
geometric weight input is independent of its coefficient-prime theorem.
Layer 5 identifies ordinary lattices, crystalline/Wach factors and CM lines.
Layer 6 constructs integral Hecke families and their deformation maps from the
whole geometric determinant. Layer 7 assembles strict fixed-form systems and
their large-image and ordinary-density consequences. The internal prerequisites
of each subsection point backward in this build. All intended API names are in
`TauCetiRoadmap.AutomorphicGaloisRepresentations`; the representative signatures
in Suggested.lean use only carriers available at the pinned commits.

## Layer 0: Period, family and geometric interfaces

### 0.1 Rank-one local periods with all-unit values

Let K/ℚ_p and E/ℚ_p be finite, with E containing every embedding of K.
For a continuous character η:G_K→E× that is locally algebraic under geometric
reciprocity, write `η(rec_geom(x))=ν(x)∏_ττ(x)^{−a_τ}` on K×, where ν is
smooth with finite inertia image and a_τ are integers. Prove
`rankOnePeriodFormula`: η is potentially crystalline, its D_HT degrees are
(a_τ), and its geometric WD character is ν. If η is crystalline, for any
uniformizer ϖ its φ^{f_K} eigenvalue is
`η(rec_geom(ϖ))∏_ττ(ϖ)^{a_τ}=ν(ϖ)`.
For finite inertia obtain the same formula after a finite Galois extension
killing inertia and descend, using norm functoriality. This refines the
supplied local algebraicity criterion by identifying the Frobenius and the
finite unit factor. Prove compatibility with finite coefficient extension,
duals, products and change of uniformizer. The character must be continuous
and unit valued; an arbitrary smooth ν with a nonunit value at ϖ need not
extend from K× to G_K.

(Source: [Conrad](https://math.stanford.edu/~conrad/papers/locchar.pdf),
Appendix B, Definition B.1 p. 32, Propositions B.3–B.4 pp. 33–36.)

**Checks.**

- η=1 gives degree 0, ν=1 and Frobenius 1.
- η=ε_p has degree −1. Its values are `N(u)` on geometric units and
  `N(ϖ)/q_K` on a uniformizer, so the WD value is q_K⁻¹; at K=ℚ_p,
  ϖ=p its Galois value is 1.
- A finite ramified η has degree 0 and nontrivial WD inertia; replacing ν by
  its unramified restriction loses that finite character.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P7.1–R07.P7.3;
AutomorphicGaloisRepresentationsPartII AG2.P, “Finite-coefficient periods,
descent and geometric comparison”; LocalGaloisGroups Layer 5.

### 0.2 Crystalline lifting through the central isogeny

For finite K/ℚ_p and a crystalline representation into
`(GL₂/{±1})(ℚ̄_p)` whose Hodge cocharacter lifts to GL₂, prove
`crystallineLiftCentralIsogeny`: after a finite coefficient extension it is
the image of a crystalline GL₂-representation. Keep the lifted cocharacter
and the quotient identification. In the symmetric-square application, two
rank-two lifts with the specified common quotient differ by a continuous
quadratic character; this character need not be unramified. Prove transport
under finite restriction and coefficient extension. No residue-characteristic
restriction is imposed on this characteristic-zero theorem.

(Sources: Wintenberger, Invent. Math. 120 (1995), Theorem 1.1.3,
Proposition 1.2, Remarks 1.1.4;
[Wintenberger 1997](https://www.numdam.org/article/AIF_1997__47_5_1289_0.pdf),
Theorem 2.2.2, pp. 1310–1311;
[Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf),
§2.4.1 p. 252.)

**Checks.**

- The trivial quotient admits the trivial crystalline lift.
- The lift of the Hodge cocharacter is a hypothesis: a quotient cocharacter
  outside its integral image does not define the prescribed lifted type.
- A ramified quadratic twist of a crystalline lift has the same symmetric
  square and need not itself be crystalline. Equality of symmetric squares
  gives potential crystallinity, with the quadratic ambiguity retained.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.0–R07.3.3,
R07.4.13; ArithmeticGaloisRepresentations §7.6; ReductiveGroups Layer 9.

### 0.3 Quaternionic finite-slope families

For a reduced weight space W, commuting Hecke algebra H, Banach (Pr) modules
M_X over affinoid X⊆W, compact U_X and compatible links under restriction,
construct `FiniteSlopeEigenvariety` by gluing the finite Hecke algebras on
slope-adapted summands over `det(1−TU_X)=0`. It represents finite-slope
Hecke eigensystems with their weight and nonzero U-value. Prove independence
of the adapted cover, the cocycle identity on overlaps and compatibility with
coefficient extension. Classicality and density are properties of the supplied
family, proved separately for the following instance.

Over affinoid weight discs, construct `QuaternionicFiniteSlopeFamily` for the
totally definite quaternion algebra over a totally real F, with the tame level,
central character and p-level of Skinner §2.4.2. Its data are overconvergent
Banach modules `S^D_κ(U;m)`, commuting `T^S` and compact U_p actions,
restriction links and finite-projective slope summands. Glue their finite
Hecke spectra over the Fredholm spectral variety using the links. The reduced
charts carry the universal eigensystem; algebraic classical points satisfying
the small-slope bound are dense on the charts used in Skinner's argument.
The API consists of restriction and coefficient base change, compactness,
finite-slope decomposition, Hecke evaluation, overlap identifications and
`quaternionicFamily_classicalDensity`. Construct the quaternionic classicality
comparison as well as analytic gluing. For F=ℚ the bound is
`v_p(α)<k−1`; in the totally real instance use the labelled local-weight bounds
of Skinner §2.4.2 with its normalized operators.

(Sources: [Buzzard, Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf),
§§8–11, Lemma 12.2 pp. 78–79 and §13 pp. 79–80;
[Buzzard 2004](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/GL1.pdf),
§7 Proposition 4, p. 19; Skinner §2.4.2 pp. 253–255.)

**Checks.**

- For M_X=O(X) and U_X multiplication by a unit a, the spectral variety is
  `1−aT=0`, with U-eigenvalue a; its reciprocal coordinate is a⁻¹.
- Restricting a slope chart twice agrees with direct restriction and preserves
  its finite-projective rank.
- At F=ℚ, an algebraic eigenpoint of slope strictly below k−1 is classical;
  the endpoint is outside this criterion.
- A zero U_p eigenvalue has infinite slope and belongs to no finite-slope chart.

*Needs:* LocallyAnalyticDistributions §§4.2, 4.15–4.16;
CompactOperators §§1.7, 3.1–3.5, 4.3; RigidAnalyticGeometry Layers 1 and 6;
GL2AutomorphicRepresentationsAndTransfer §§R17.3.9, R16.6.3.

### 0.4 Crystalline periods in families

Prove `extendCrystallinePeriods` in Kisin's G_ℚ_p setting: R is a
Tate ℚ_p-algebra, M a finite free continuous R-representation, Y∈R×,
Sp(R) is Y-small in the sense of §5.2, and the Sen polynomial is TQ(T).
For each positive integer k require Tate R-algebras R_i such that
`∏_{j=0}^{k−1}Q(−j)` is invertible in every R_i, every equivariant map
`M^∨⊗R_i → B_dR^+/t^k ⊗̂ R_i` factors through the φ=Y crystalline periods,
and `R → ∏_i R_i` is injective. The conclusion is continuation for sufficiently
large truncations and a nonzero crystalline period at every continuous
specialization to a closed subfield of ℂ_p. Construct the required G_{F_v}
version with φ^{f_v}, retaining Q(0) as a non-zero-divisor on the family.
The API gives restriction to admissible affinoids, coefficient specialization,
the truncated comparison and the specialized eigenperiod. Prove that the
family of §0.3 satisfies the hypotheses used in §4.7; density of classical
field points alone is insufficient.

(Sources: [Kisin](https://abel.math.harvard.edu/~kisin/dvifiles/fmform.dvi),
Proposition 5.14 and Corollary 5.15, pp. 26–27;
Skinner §2.4.2 pp. 253–255, footnote 9.)

**Checks.**

- A constant trivial line has Y=1, Q=1 and the nonzero period 1 at each point.
- If Q(−j)=0 for an index in the truncation, that chart fails the invertibility
  hypothesis; a dense set of other points does not repair it.
- Over a nonreduced affinoid, a nilpotent killed by all reduced points defeats
  injectivity to those fields. The asserted product map must be injective.

*Needs:* §0.3; PadicPeriodRings §§4.1–4.3;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P7.1–R07.P7.2;
AutomorphicGaloisRepresentationsPartII AG2.P, finite-coefficient period API;
RigidAnalyticGeometry Layers 1 and 6.

### 0.5 Wach modules of crystalline lattices

For a finite unramified K/ℚ_p, finite E/ℚ_p with integers O_E, and a finite
free O_E-lattice T in a crystalline representation, construct `wachLattice T`
over `O_E ⊗_{ℤ_p} O_K[[π]]`, with its semilinear φ and cyclotomic Γ action. Normalize first to nonpositive
weights in the convention in which ε_p has weight +1, by a declared Tate
twist. For weights in [−r,0], its finite-height quotient is killed by q^r,
where `q=φ(π)/π`, and Γ is trivial modulo π. Its π-quotient is an integral
lattice; after inverting p identify it with D_cris, with the Frobenius-defined
filtration. Restore arbitrary weights by the recorded twist. Include p=2
and finite ramified coefficient fields E, and prove coefficient extension,
dual/Tate transport, recovery of T and semilinear basis change
`P ↦ U⁻¹Pφ(U)`. This is the all-weight construction used in §5.2;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.26 retains its own
p-divisible-group cyclotomic-frame comparison.

(Source: [Berger, Limites de représentations cristallines](https://arxiv.org/pdf/math/0201262v2),
§2.1 for the Wach lattice, Theorem 3.5 and Theorem 5.1 for the crystalline
comparison and filtration; arbitrary weight and coefficient transport are
required by these functorial constructions.)

**Checks.**

- The trivial O_E-line gives the rank-one coefficient power-series module;
  its π-quotient is O_E, whereas D_cris is obtained after inverting p.
- A Tate twist changes the height and filtration and changes Frobenius by
  the corresponding p-power; it cannot leave the same filtered module.
- A noncrystalline Tate-curve extension has N≠0 and supplies no Wach module
  of this crystalline category.

*Needs:* PadicPeriodRings §§4.1–4.3;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.4–R07.4.9,
R07.4.26; ArithmeticGaloisRepresentations §§1.2, 1.6.

### 0.6 The unitary and GL₃ geometric realizations

Construct the specific Blasius–Rogawski instances of Skinner §§2.3.1–2.3.3.
For E=FE₀ with E₀ imaginary quadratic and p split in E₀, use GU(Φ) of signature
(2,1) at one place and (3,0) elsewhere, with its universal abelian scheme.
Construct the U(2) packet with nonstandard base change
`π_E⊗η|·|^{1/2}`, the endoscopic packet on U(Φ) with multiplicity d(σ_f)=2,
and the algebraic coefficient projector. Under the source's geometric Hilbert
hypotheses, including some k_τ>2 in its non-discrete-series branch, realize
the prescribed CM base-change twist of ρ_π in that cohomology. Retain every
auxiliary character, Tate twist and multiplicity in the comparison.

For an essentially self-dual regular cuspidal Π on GL₃(A_F) whose archimedean
parameters restrict to
`z^{a_i}z̄^{b_i} ⊕ z^{b_i}z̄^{a_i} ⊕ (zz̄)^{(a_i+b_i)/2}`,
with a_i≠b_i and a_i+b_i even, construct the three-dimensional ρ_Π of
Skinner §2.3.3. Give its good-place WD comparison and realize its cuspidal
CM base-change twist in an abelian scheme over the Picard modular surface;
retain the character-induced alternative when that base change is not cuspidal.
At hyperspecial p-level with Π unramified, good reduction gives crystalline
periods and labelled degrees `−a_i,−b_i,−(a_i+b_i)/2`. The API comprises
coefficient change, Hecke and Galois equivariance, projector comparison,
the good-reduction model and the associated Frobenius polynomial.

(Sources: Skinner §2.3.1 pp. 247–248, §2.3.2 pp. 248–250 and §2.3.3
pp. 250–251; Blasius–Rogawski Proposition 4.1.2, Lemma 4.2.1 and
Theorem 3.3.1 as used there; Blasius §§4.1–4.6 for the GL₃ construction.)

**Checks.**

- Signature (2,1) gives a surface; compact signature (3,0) at every place
  gives dimension zero and cannot replace it.
- A multiplicity-two cohomology factor is not itself the single rank-two
  Galois representation; extraction must retain the automorphic factor.
- For the symmetric-square input after the norm conversion of §3.12,
  a=−2,b=0 gives degrees 2,0,1. These are the symmetric square of degrees 0,1.

*Needs:* PELModuli M0–M4; EndoscopicTransferAndUnitaryTraceComparison
§§13.1–13.4; EtaleCohomologyFoundations §§F.4–F.7;
AutomorphicGaloisRepresentationsPartII AG2.P, geometric period comparison,
and AG2.0, algebraic-character avatars;
GL2AutomorphicRepresentationsAndTransfer §R17.4.13.

### 0.7 Quaternionic surfaces and weight-monodromy

For F of even degree, construct the quaternionic Shimura surface for B split
at exactly two real places and every finite place, with its algebraic
coefficient system W and Hecke action. At a sufficiently small level and
a finite extension L containing the reflex data, prove the constituent
comparison of Blasius Proposition 6: the π′_f-part of degree-two cohomology
has the constituents of
`ρ_{π,λ}|G_L ⊗ {}^{τ₂}ρ_{π,λ}|G_L`.
Use intersection cohomology of the compactification when B=M₂, as in
Brylinski–Labesse; compact cohomology cannot be substituted in that case.
The API `quaternionicSurfaceRealization` carries level and coefficient change,
Hecke/Galois equivariance, the two distinguished embeddings and this tensor
comparison. This comparison is applied after §3.10 constructs ρ; the surface
and coefficient system themselves use only the geometric suppliers.

For a smooth projective surface X over a finite p-adic field and ℓ≠p,
prove `surfaceWeightMonodromy`: the monodromy-graded pieces of H²_ét have
weights 2+i in grade i. Retain the finite semistable alteration and descent
needed for the original coefficient representation. Also prove the geometric
integrality input used by Blasius Proposition 2: Frobenius eigenvalues of
H^j of a smooth projective variety over a local field are integral Weil
numbers of integral weights, without claiming purity in arbitrary degree.
These are inputs to §4.2's exclusion of complementary series.

(Sources: [Blasius](https://arxiv.org/pdf/math/0511007v1), Proposition 2 p. 11,
§4.2 pp. 21–22 and Proposition 6; Rapoport–Zink Satz 2.13 and de Jong's
alterations as used in Proposition 2; Brylinski–Labesse for the split
intersection-cohomology case as cited in §4.2.)

**Checks.**

- A product of two elliptic H¹ factors has H² tensor weight 2 at good reduction.
- B=M₂ occurs in degree two and requires the compactification/intersection
  cohomology branch.
- A split multiplicative elliptic factor has N≠0. Its tensor contribution
  retains monodromy; the Frobenius polynomial alone does not specify it.

*Needs:* ShimuraVarieties Layers 1–4 and §§8.18–8.23; PELModuli M0–M4;
HilbertModularVarietiesAndShimuraCurves §R18.1.7, auxiliary PEL comparison;
EtaleCohomologyFoundations §§F.4–F.8; LefschetzPencilsAndVanishingCycles
LPV.0–LPV.2; DeligneWeightsAndPurity §§4.3, 7.15;
ArithmeticGaloisRepresentations §2.6. The tensor identification additionally
uses §3.10; none of the construction or surface weight theorems uses §4.2.

### Examples

For the local cyclotomic character at ℚ_p, the geometric uniformizer value
is 1 while its crystalline Frobenius is p⁻¹. The trivial lattice has a Wach
π-quotient O_E and a rational crystalline module after inverting p. A zero
U_p eigenvalue lies outside the finite-slope families. The two-dimensional
special WD model of Layer 4 retains nonzero monodromy under these comparisons.

### Dependencies

The period, cohomology, PEL and analytic suppliers named above. The geometric
surface tensor comparison consumes §3.10 only when applied in §4.2;
§3.10 needs the curve construction, not the surface comparison.

## Layer 1: Classical cohomology and coefficient descent

### 1.1 Coefficient Eichler–Shimura

At a fine level n≥3, put r=k−2 and take p∤nℓ. On parabolic cohomology with Sym^r of the universal elliptic H¹, construct the geometric pull–push operators and prove T_p=F+I_p^*V, FV=p^{r+1}, and R_p=p^rI_p^*. Consequently `1−T_pX+pR_pX²=(1−FX)(1−I_p^*VX)`. The diamond factor I_p^* is essential away from level one. The underlying special-fibre correspondence comes from ModularCurvesPartII §§17.1–17.2; this target transports it through coefficients. Its fibre tests distinguish p+1 lines in the étale situation away from p, one supersingular subgroup scheme, and the connected/étale pair μ_p and Z/p at an ordinary characteristic-p fibre.

*Needs:* `ModularCurvesPartII:§§17.1–17.2`; `ModularCurvesPartII:§§14.1–14.4, 14.8, 14.11–14.12`; `ArithmeticGaloisRepresentations:Layer 6`; `ModularCurvesPartII:§§17.1–17.2`.

See [Pierre Deligne](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf) — Proposition 4.8 and Theorem 4.9, printed pp. 166–167; [Pierre Deligne](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf) — Proposition 3.18(ii), printed p. 158.

- `higherCoefficientHeckeAction` (constructor): Pull–push of the ModularCurvesPartII §§17.1–17.2 correspondence on Sym^r coefficients and parabolic cohomology.
- `higherCoefficientHeckeAction_level` (functoriality): Level change intertwines the higher-coefficient action.
- `higherCoefficientEichlerShimura` (relation): T_q=F+I_q^*V, FV=q^{r+1}, R_q=q^r I_q^*.
- `higherCoefficientEichlerShimura_factorisation` (compatibility): 1−T_qX+qR_qX²=(1−FX)(1−I_q^*VX).

**Checks.**

- `HeckeCorrespondence.fibre_q1_card_of_char_ne` (computation): For char k(s) ≠ p the fibre of q_1 has p + 1 points (the p + 1 lines of E_s[p] ≅ (Z/p)²).
- `HeckeCorrespondence.fibre_q1_supersingular` (degenerate): Over a supersingular point in characteristic p the fibre is the single point ker F.
- `HeckeCorrespondence.fibre_q1_ordinary` (non-example): Over an ordinary point in characteristic p the fibre has two points: a definition that keeps only ker F is wrong.
- `eichlerShimura_level_one` (compatibility): At level one I_q^*=1 and for r=k−2 the relation is 1−T_q X+q^{r+1}X²=(1−FX)(1−VX). For r=0 (classical weight two) it agrees with the ModularCurvesPartII §17.2 Eichler–Shimura relation.

### 1.2 Parabolic realisations

Package the image of H¹_c→H¹ with Sym^{k−2} coefficients as M(N,ψ)_!, with Betti conjugation, filtered de Rham and every λ-adic realisation and their comparisons. At an auxiliary fine level M≥3 with N|M and the same excluded prime set, require canonical change-of-level identifications. For each coefficient embedding its rank is twice the dimension of the corresponding ψ-cusp space; its top filtration has the cusp-space dimension. After tensoring over Q with C the top filtration is the product of those cusp spaces over all coefficient embeddings. The twisted Fricke pairing takes values in M_ψ(1−k) and is rationally perfect. Transport the full Hecke action with the DFG ψ⁻¹ convention. Integral/crystalline comparisons are restricted by the excluded set; λ-adic existence is not. The parabolic image excludes Eisenstein boundary classes.

Here k≥2, N≥1 and ψ has conductor dividing N and values in K. The excluded
set is S_N={ℓ:ℓ divides Nk!}, and the fine level satisfies S_M=S_N.
For DFG's action, T_p is the double coset of diag(p,1) multiplied by
ψ(p_p)⁻¹; for p∤N the scalar-p double coset multiplied by ψ(p_p)⁻²
acts by ψ(p_p)⁻¹p^{k−2}. These conventions hold on the entire parabolic
structure, before selecting a newform factor.

*Needs:* `ModularCurvesPartII:§§14.1–14.4, 14.8, 14.11–14.12`; Mathlib `ModularForm`; Mathlib `CuspForm`.

See [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — Theorem 2.4, p. 24 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §4.5, (28) and Lemma 4.12, p. 51 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — Proposition 5.6, p. 56 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §5.2, Lemma 5.2 and formula (29), pp. 53–54 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §1.3, p. 12 (arXiv v2).

- `ParabolicPremotive` (structure): M(N, ψ)_! with Betti realisation M_B (with complex conjugation), de Rham realisation M_dR with Hodge filtration Fil^•, λ-adic realisations M_λ (every finite λ; crystalline comparison only for λ ∉ S_N) and the comparison isomorphisms I_∞, I_λ.
- `ParabolicPremotive.filTopEquivCuspForms` (equivalence): C ⊗_Q Fil^{k−1} M_{!,dR} ≃ S_k(N, ψ)^{I_K}, compatible with q-expansions (Lemma 4.12).
- `ParabolicPremotive.pairing` (data): The duality pairing M(N, ψ)_! ⊗ M(N, ψ)_! → M_ψ(1 − k) of formula (29) in PM_K^S, perfect after tensoring with Q.
- `ParabolicPremotive.heckeAction` (instance): Module structure over the Hecke algebra T, compatible with every realisation and comparison; T_p ↔ [U(p 0; 0 1)U]ψ(p_p)^{−1}.
- `ParabolicPremotive.levelChange` (functoriality): Independence of the auxiliary level M (N | M, S_M = S_N) up to canonical isomorphism (§3.6).

**Checks.**

- `ParabolicPremotive.weight_two_trivial_character` (degenerate): For k = 2 and ψ = 1 the λ-adic realisation is H^1_et(X_0(N)_{Q̄}, K_λ).
- `ParabolicPremotive.dim_dR` (computation): dim_K M_{!,dR} = 2 dim S_k(N, ψ); for N = 11, k = 2, ψ = 1 it is 2.
- `ParabolicPremotive.fil_compat_mathlib` (compatibility): The isomorphism with S_k(N, ψ) lands in Mathlib's CuspForm space for Γ_1(N) with character ψ (level and weight agree).
- `ParabolicPremotive.no_eisenstein` (non-example): An Eisenstein series of weight k lies in Fil^{k−1} M_dR but not in Fil^{k−1} M_{!,dR}: the parabolic part excludes the boundary.

### 1.3 Scholl's projector

For k>2, r=k−2≥1 and n≥3, construct the fine-level Kuga–Sato fibre power and its equivariant smooth resolution over Q and the action of `Γ_r=((Z/n)²⋊μ₂)^r⋊S_r`. The character ε is trivial on translations, the product of the inversion signs on μ₂^r, and the sign on permutations. Define the rational average `e_ε=|Γ_r|⁻¹Σ_g ε(g)g` on each realisation, prove idempotence and identify its degree-(r+1) image with parabolic H¹(Sym^r). It commutes with Hecke correspondences and fine-level transport. The sign on S_r compensates for graded Künneth signs; dropping it is incorrect. Invert 2n·r! and hence the averaging denominators before asserting integrality. This construction provides cohomological/homological projectors, not an unconditional individual-newform Chow motive.

*Needs:* TauCetiRoadmap.StableReduction Layer 4, relative Proj/Rees blowups and their universal property; EtaleCohomologyFoundations §§0.7, F.4.5–F.4.6, F.5–F.7, equivariant cohomology, localization, duality and projective-bundle comparison; `ModularCurvesPartII:§§14.1–14.4, 14.8, 14.11–14.12`.

See [A. J. Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf) — §1.0–1.3, Theorems 1.2.1 and 1.2.4, author-copy pp. 1–3; [A. J. Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf) — §4.1, 4.1.1–4.1.4, p. 8.

Start with the universal elliptic curve over the fine modular curve, take its r-fold
fibre product, compactify over the cusps and resolve the toroidal boundary
equivariantly. Construct extension of the Γ_r action and Hecke correspondences.
Use Scholl's boundary exact sequence to identify the compactified ε-eigensummand
in degree r+1 with the kernel of the boundary map from open cohomology to the
cusps. Open cohomology has a nonzero cusp quotient; it cannot replace that kernel.
For r>0 use the weight argument of §1.3.4; for r=0 use the curve comparison
already supplied by parabolic cohomology. Scholl Theorems 1.2.1 and 1.3.3,
§1.3.4, pp. 2–3, and the resolution in §§2–3, pp. 4–7, specify this construction.
The coarse curve with no universal elliptic family does
not satisfy its input. In the local model x_iy_i=ϖ, blow up the reduced all-zero
stratum, then the proper transforms of the successive singular strata. The
charts A^j×E_{r−j} of Scholl Proposition 2.1.1 prove regularity; Theorem 3.1.0
extends the whole Γ_r action. The blowup formalism, smooth proper cohomology and
finite-group averaging are imported; the concrete Kuga–Sato compactification,
resolution and boundary comparison belong to this target. Use Mathlib's
`Representation.averageMap` and `Representation.isProj_averageMap` after the
ε-character twist for the rational averaging algebra, rather than introducing a
second theory of finite-group projectors.


- `schollProjector` (constructor): The ε-idempotent acting on all imported realisations.
- `schollProjector_idempotent` (relation): e_ε²=e_ε.
- `schollProjector_parabolic` (equivalence): Its degree-(r+1) image is parabolic H¹(Sym^r R¹f_*).
- `schollProjector_hecke` (compatibility): It intertwines the geometric Hecke action.
- `schollProjector_level` (functoriality): Transport through fine-level change commutes with the projector.

**Checks.**

- `schollProjector_weight_three` (computation): r=1: translations act trivially and inversion acts by −1 on H¹ of the elliptic fibre.
- `schollProjector_transposition` (non-example): r=2: omitting sign(S₂) changes the graded Künneth action and fails to recover Sym².
- `schollProjector_denominators` (computation): For n=3,r=2, |Γ_r|=(2·3²)²·2!=648; the averaging projector is rational, not an integral operator at 2 or 3.
- `schollProjector_boundary` (compatibility): The ε-part of the cohomology of the smooth compactification is the parabolic image, not the cohomology of the open curve; the ε-part of compactly supported cohomology of the open fibre power is H¹_c, which is larger.

### 1.4 Rational orbit projector and coefficient descent

In the semisimple rational new Hecke quotient form the central idempotent e_[f] for the Galois orbit of f. Its image on Betti, de Rham and λ-adic realisations has rank two over K_f; extension along an embedding σ:K_f→L identifies the σ(f) eigenspace. Construct the K_f-action on the factor itself: traces in K_f alone do not constitute coefficient descent. With Scholl's transposed Hecke action recover the cohomological trace a_p, and with the other action apply the DFG conjugate-form correction. Compare Betti ± lines with the existing modular-symbol period lines. Intersect with the fixed integral module and state any saturation/torsion-freeness requirements. The full old Hecke algebra is not the semisimple new quotient used to select e_[f].

*Needs:* [1.3 Scholl's projector](#13-scholls-projector); [1.2 Parabolic realisations](#12-parabolic-realisations); TauCetiRoadmap.ModularForms, layer 8 modular symbols the integral hecke algebra and coefficient fields; `ModularCurvesPartII:§§14.1–14.4, 14.8, 14.11–14.12`; `ModularCurvesPartII:§§16.2–16.3`; `ModularCurvesPartII:§16.4`.

See [A. J. Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf) — Theorem 1.2.4 and Remark 1.2.6, pp. 2–3; [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §1.2, pp. 8–10; §4.5, pp. 50–51; §§5.3–5.4, pp. 56–59; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Exercise 1.18, p. 30.

- `newformOrbitProjector` (constructor): The central idempotent e_[f] of the rational new Hecke algebra.
- `newformOrbitProjector_idempotent` (relation): e_[f]²=e_[f] and θ_f(e_[f])=1.
- `newformFactor` (data): The K_f-linear image on every realisation.
- `newformFactor_baseChange` (functoriality): Extension along σ:K_f→L identifies the factor with the σ(f)-eigenspace.
- `newformFactor_rank` (characterisation): Its K_f-dimension is two.
- `newformFactor_periodLines` (compatibility): The Betti ± lines and modular-symbol rational structure agree with the imported period lines.
- `newformFactor_lattice` (constructor): Intersect with the imported integral module and retain torsion-freeness and saturation hypotheses explicitly.

**Checks.**

- `newformFactor_level23` (computation): The degree-two coefficient field gives rational dimension four, not two.
- `newformFactor_delta` (computation): For Δ the factor has rank two over Q and is realised in degree eleven Kuga–Sato cohomology.
- `newformFactor_orbit` (non-example): Before scalar extension a single embedding of Q(√5) cannot replace the rational Galois-orbit factor.
- `newformFactor_periodScaling` (characterisation): Changing a generator of a period line by a K_f-unit preserves the line; an unspecified lattice cannot select a numerical period.
- `newformFactor_oldNilpotents` (non-example): The old Hecke algebra of 11a1 at level 88 (the case N = 88, p = 2 of Darmon–Diamond–Taylor Exercise 1.18) has nilpotents and is not the semisimple rational new quotient used by this projector.

### 1.5 Rank-two newform realisation

For a normalized cusp newform g, take the common kernel of its Hecke ideal in the rational parabolic realisation. It has rank two over the coefficient field. DFG's factor M_g^DFG realizes the conjugate form, with geometric good polynomial `X²−ψ(p)⁻¹a_pX+ψ(p)⁻¹p^{k−1}`. Define our cohomological factor by `M_g=M_g^DFG⊗M_{ψ⁻¹}`; its polynomial becomes `X²−a_pX+ψ(p)p^{k−1}` and its arithmetic dual is the classical Galois representation. Identify the top Hodge line with Kg and show oddness at every λ. Rational irreducibility has its own target in §4.8. For k=2 use the modular abelian quotient, and for k>2 use the Kuga–Sato projector.

The restricted Fricke pairing on M_g^DFG is alternating and perfect, giving
`∧²_K M_g^DFG ≅ M_ψ(1−k)`. After the twist,
`∧²_K M_g ≅ M_{ψ⁻¹}(1−k)`. Thus the arithmetic dual satisfies
`ρ_{g,λ} ≅ M_{g,λ}^DFG(k−1)` and
`det ρ_{g,λ}=ψχ_ℓ^{k−1}`, with ψ interpreted by arithmetic reciprocity.
It is continuous and unramified outside Nℓ, and complex conjugation is
conjugate to diag(1,−1). These rational statements hold at every finite λ.

*Needs:* [1.2 Parabolic realisations](#12-parabolic-realisations); [1.1 Coefficient Eichler–Shimura](#11-coefficient-eichlershimura); `ArithmeticGaloisRepresentations:§§1.1–1.10`; `ArithmeticGaloisRepresentations:Layer 6`; [1.4 Rational orbit projector and coefficient descent](#14-rational-orbit-projector-and-coefficient-descent).

See [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — Lemma 5.7, p. 58 (arXiv v2); [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Theorem 3.1(a)–(c), p. 86 (revision of 9 September 2007); [A. J. Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf) — Theorem 1.2.4(i), p. 2, with 1.0.0, p. 1, and 4.2.2, p. 9; [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §5.5, pp. 59–60, and p. 96 (arXiv v2).

For the light arithmetic calculation define `arithFrobCharpoly a ψ p k` over
any coefficient field to be X²−aX+ψp^{k−1}. Define
`arithFrobCharpolyDual a ψ p k` as X²−(a/d)X+1/d, where d=ψp^{k−1}.
The dual formula represents a characteristic polynomial only when d≠0;
it is the cohomological representation evaluated at arithmetic Frobenius.
The arithmetic dual of that cohomological representation has the original
polynomial. The functions make sense for k=0, but the geometric interpretation
here assumes k≥2 and must not use truncated natural subtraction as a weight-zero
formula.


- `arithFrobCharpoly`: The arithmetic good-prime polynomial with its nebentypus factor.
- `arithFrobCharpolyDual`: The dual polynomial at the same Frobenius, with the nonzero-determinant interpretation above.

**Checks.**

- For 11a1 at 3, a₃=−1, ψ=1 and k=2 give X²+X+3; the dual polynomial is X²+X/3+1/3.
- For Δ at 2, a₂=−24 and k=12 give X²+24X+2048; the dual has X-coefficient 3/256 and constant 1/2048.
- With k=2, a=2, p=3 and ψ=i, retain constant 3i; the dual has X-coefficient −2/(3i) and constant 1/(3i). Replacing ψ by ψ⁻¹ fails both checks.

### 1.6 Integral newform structures

Over O_K and the localization O_S with S containing primes dividing Nk!, construct finitely generated Betti, filtered de Rham and λ-adic integral modules, comparison maps and the Hecke-ideal kernel. Rationalization gives M_g^DFG and, after the ψ⁻¹ twist, M_g. Identify the top de Rham module with integral q-expansions and identify it with Hom_{O_S}(T,O_S) by f↦(T↦a₁(Tf)). Outside S the stable torsion-free lattices carry Fontaine–Laffaille comparison with 0≤k−1≤ℓ−2. Inside S retain the module, then explicitly take its image/torsion-free quotient when a lattice is required; freeness or integral perfection is not automatic. The normalized coefficient a₁(g)=1 detects whether a scalar multiple is integral.

*Needs:* [1.2 Parabolic realisations](#12-parabolic-realisations); [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); `ModularCurvesPartII:§§14.1–14.4, 14.8, 14.11–14.12`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`.

See [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §1.2, p. 9 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §4.5, Lemma 4.12, p. 51 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §5.3, Lemma 5.5, p. 56 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §5.4, p. 58 (arXiv v2).

- `IntegralPremotive` (structure): An S-integral premotivic structure over O_K: finitely generated integral modules 𝓜_B, 𝓜_dR (over O_S, filtered), 𝓜_λ, the Fontaine–Laffaille objects 𝓜_{λ-crys} (λ ∉ S) and integral comparison isomorphisms.
- `IntegralPremotive.kernel` (constructor): 𝓜[I] for an O_K-submodule I of End 𝓜, the common kernel of generators of I.
- `integralParabolic` (constructor): 𝓜(N, ψ)_{M,!} as an S-integral premotivic structure for S ⊇ S_N^K, with K ⊗ 𝓜(N, ψ)_{M,!} = M(N, ψ)_{M,!}.
- `integralParabolic_filTop` (characterisation): Fil^{k−1}𝓜(N, ψ)_{M,!,dR} = the cusp forms with q-expansion in O_S[[q]].
- `integralParabolic_heckeDuality` (characterisation): f ↦ (T ↦ a₁(Tf)) is an isomorphism Fil^{k−1}𝓜(N, ψ)_{M,!,dR} ≅ Hom_{O_S}(𝕋, O_S).
- `integralNewformPremotive` (constructor): 𝓜_g := 𝓜(N, ψ)_{M,!}[I_g].
- `integralNewformPremotive_rational` (compatibility): K ⊗ 𝓜_g = M_g^{DFG}, and K ⊗ (𝓜_g ⊗ 𝓜_{ψ^{−1}}) = M_g ([1.5 Rank-two newform realisation](#15-rank-two-newform-realisation)).

**Checks.**

- `integralNewformPremotive_level_eleven` (computation): For 11a1 (N = 11, k = 2, ψ = 1, S = {2, 11}): Fil¹𝓜_{g,dR} = ℤ[1/22]·f.
- `integralParabolic_bad_set` (non-example): For k=2 the prime 2 lies in S: the chosen Fontaine–Laffaille comparison requires k−1≤ℓ−2 and does not apply at 2. This says nothing against a separate crystalline realisation at a good prime 2.
- `integralNewformPremotive_rational_test` (compatibility): K ⊗ 𝓜_g recovers the rank-two M_g^{DFG} with Fil^{k−1} = Kg; for trivial ψ this is M_g itself.
- `integralParabolic_filTop_scalar` (degenerate): If c ∈ K and cg has q-expansion in O_S[[q]] then c ∈ O_S, since a₁(g) = 1.

### 1.7 Higher-weight classical existence

Let f≠0 be an eigenform of weight k≥2 and type (k,ψ), not necessarily cuspidal, over a number field containing its good eigenvalues and character values. For every finite λ construct the continuous semisimple arithmetic representation of G_Q, unramified outside Nℓ, with good polynomial `X²−a_pX+ψ(p)p^{k−1}`. Full good polynomials characterize it up to isomorphism. For cusp forms use the arithmetic dual of the geometric factor; for Eisenstein forms use the two Galois characters supplied by the cusp/Eisenstein decomposition. If eigenforms f,f′ of weights k,k′≥2 and levels N,N′ have a_p=a′_p on a density-one prime set, then k=k′, ψ=ψ′ and all good coefficients agree for p∤NN′; neither eigenform need be cuspidal. The weight-two branch uses a modular abelian quotient; Scholl's higher-weight theorem excludes that branch.

*Needs:* [1.1 Coefficient Eichler–Shimura](#11-coefficient-eichlershimura); [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); `ArithmeticGaloisRepresentations:§§1.1–1.10`; [1.4 Rational orbit projector and coefficient descent](#14-rational-orbit-projector-and-coefficient-descent); TauCetiRoadmap.ModularForms, layer 0 diamond operators and modular forms with character nebentypus; TauCetiRoadmap.ModularForms, layer 4 eigenforms newforms primitive forms the conductor.

See [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Theoreme 6.1, printed p. 520; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Remarque 6.2, printed p. 521; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — footnote (1) to 3.1, printed p. 513; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Introduction, printed p. 507; [A. J. Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf) — Theorem 1.2.4(i), p. 2, with 1.0.0, p. 1.

### Examples

At level 11 and weight two with ψ=1, the parabolic space has rank two and
the geometric good polynomial at 3 is X²+X+3. Its arithmetic dual has the same
polynomial at arithmetic Frobenius, whereas the cohomological object at
arithmetic Frobenius has X²+X/3+1/3. For Δ at level one and weight 12, t₂=−24
gives X²+24X+2048, and the Hodge pair is (0,11). The character-valued case must
keep the diamond operator and the DFG twist; neither trivial-character example
distinguishes ψ from ψ⁻¹.

For r=2, the tensor action of a transposition on two H¹ factors carries a
graded sign. Scholl's ε includes the permutation sign to recover Sym²; an
unsigned average selects the wrong summand. A projector at the rational new
Hecke quotient does not assert that the full old Hecke algebra is reduced.

### Dependencies

Mathlib and Tau Ceti; TauCetiRoadmap.ModularForms; ModularCurvesPartII Layers 13–17; ArithmeticGaloisRepresentations Layers 1 and 6; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3; generic geometric comparison and resolution.

## Layer 2: Weight-one representations

### 2.1 Rankin's prime estimate

For a cuspidal eigenform of weight k≥1 and real s>k, prove `Σ_{p∤N}|a_p|²p^{-s} ≤ log(1/(s−k))+O(1)` as s decreases to k. Import the Rankin–Selberg continuation and pole statement, and reduce away-from-level eigensystems to newforms. The output is an upper estimate, not an equality deduced without Ramanujan–Petersson. At weight one it will rule out a two-character cuspidal representation, whose prime sum has leading coefficient two.

*Needs:* `AutomorphicLFunctionsAndLocalFactors:AL.3`; Tau Ceti `TauCeti.LSeries.landau`; TauCetiRoadmap.ModularForms, layer 4 eigenforms newforms primitive forms the conductor.

See [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — §5, Proposition 5.1, printed p. 518; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Démonstration 5.2, printed p. 519.

### 2.2 Finite eigenvalue sets off sparse primes

For a weight-one cuspidal eigenform, first obtain algebraic-integral good eigenvalues in one Galois coefficient field from the weight-one lattice and its conjugate eigensystems. For every η>0 construct a prime set X_η of upper Dirichlet density at most η and a finite set Y_η of possible a_p for p∉X_η. Apply the Rankin estimate to every conjugate, and then finiteness of algebraic integers bounded at every embedding. These inputs precede the Artin representation; its finite image is not available as a proof of this statement.

*Needs:* [2.1 Rankin's prime estimate](#21-rankins-prime-estimate); Mathlib `NumberField.Embeddings.finite_of_norm_le`; TauCetiRoadmap.Chebotarev, layer 3 prime sums and density normalization; TauCetiRoadmap.ModularForms, layer 8 modular symbols the integral hecke algebra and coefficient fields; TauCetiRoadmap.ModularForms, layer 8g galois stability the character field and rationality.

See [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Proposition 5.5, printed pp. 519–520; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Remarque 5.6, printed p. 520.

### 2.3 Residual eigensystems before characteristic-zero eigenforms

For k≥1, start with a nonzero mod-λ eigenform arising from an integral form and eigenvalues away from Nℓ. A characteristic-zero simultaneous eigenvector is not assumed. Weight shifting and the finite-free commuting-Hecke lifting lemma give a continuous semisimple rank-two representation, unramified outside Nℓ, with the reduced good characteristic polynomials. Descend it to the finite field generated by the eigenvalues and character values. Keep the general reduction-image/integrality argument when ℓ divides the level or the form is noncuspidal; the prime-to-level cuspidal subset of R15.5 alone is insufficient. Uniqueness retains determinants in characteristic two.

*Needs:* [1.7 Higher-weight classical existence](#17-higher-weight-classical-existence); `AlgebraicModularFormsAndSerreWeights:R15.5, Application to modular forms`; `AlgebraicModularFormsAndSerreWeights:R15.5, The lifting lemma and its sharp limits`; `ArithmeticGaloisRepresentations:§§1.1–1.10`; `ArithmeticGaloisRepresentations:§§5.3–5.7`; TauCetiRoadmap.Chebotarev, layer 10 dirichlet density chebotarev; `AlgebraicModularFormsAndSerreWeights:R15.5`.

See [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Théorème 6.7, printed pp. 521–522; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — 6.9, printed p. 522; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Lemme 6.13 and its proof, printed p. 523.

### 2.4 Deligne–Serre Condition C

For a finite subgroup G of GL₂(F_ℓ), define C(η,M) by the existence of H⊆G with |H|≥(1−η)|G| and at most M polynomials det(1−hT), h∈H. Define semisimplicity of G by semisimplicity of its identity action on F_ℓ²: each invariant line has an invariant complement. Condition C is monotone in η and M, and restriction to an index-two subgroup gives C(2η,M). Count invertible two-by-two matrices with a fixed monic quadratic of nonzero constant term: the fibre cardinalities are ℓ²+ℓ, ℓ² and ℓ²−ℓ when there are two, one or no distinct roots over F_ℓ. The later order bound assumes η<1/2; that inequality is not part of the definition.

*Needs:* Mathlib `Matrix.card_GL_field`.

See [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — 7.1, printed p. 523.

- `ConditionC` (data): ConditionC ℓ G η M : Prop, for G : Subgroup (GL (Fin 2) (ZMod ℓ)), η : ℝ and M : ℕ.
- `IsSemisimpleSubgroup` (data): Every G-stable submodule of F_ℓ² has a G-stable complement.
- `ConditionC.mono` (relation): C(η, M) implies C(η′, M′) whenever η ≤ η′ and M ≤ M′.
- `ConditionC.of_index_two` (compatibility): If G′ ≤ G has index 2 and G satisfies C(η, M), then G′ satisfies C(2η, M): H ∩ G′ has at least (1 − η)|G| − |G|/2 = (1 − 2η)|G′| elements (Deligne–Serre 7.2, case (c)).
- `card_charpoly_fibre` (characterisation): For a monic quadratic Q=X²−tX+d over F_ℓ with d≠0, the number of elements of GL₂(F_ℓ) of characteristic polynomial Q is ℓ²+ℓ, ℓ² or ℓ²−ℓ according as Q has 2, 1 or 0 distinct roots in F_ℓ. No assertion is made for other polynomials or d=0.

**Checks.**

- GL₂(F_ℓ) satisfies C(0, ℓ(ℓ − 1)) and not C(0, M) for M < ℓ(ℓ − 1): its elements have exactly the ℓ(ℓ − 1) characteristic polynomials T² − tT + d with d ≠ 0.
- `not_conditionC_zero` (degenerate): For η < 1 no subgroup satisfies C(η, 0): H would have no polynomials, so H = ∅ and 0 ≥ (1 − η)|G| > 0.
- `not_conditionC_cyclic_five` (non-example): The subgroup of GL₂(F₅) generated by diag(2, 1) has order 4 and four characteristic polynomials (T − 2ⁱ)(T − 1), so it fails C(0, 3); it satisfies C(1/4, 3).
- The split Cartan subgroup of GL₂(F₃), also of order 4, satisfies C(0, 3): diag(1, 2) and diag(2, 1) share a characteristic polynomial. A definition that counted elements instead of polynomials would treat it like the cyclic group of order 4 above.
- `card_charpoly_fibre_three` (compatibility): For ℓ = 3 the fibres have sizes 12, 9 and 6, over 1, 2 and 3 polynomials, and 1·12 + 2·9 + 3·6 = 48 = |GL₂(F₃)| agrees with Mathlib's Matrix.card_GL_field.
- The trivial subgroup is semisimple, since every subspace has a complement.
- A split diagonal Cartan is semisimple even though it preserves two coordinate lines; irreducibility is not the definition.
- The cyclic group generated by !![1,1;0,1] over F₅ has no invariant complement to its fixed line and fails semisimplicity, despite satisfying C(0,1).

### 2.5 Bounded finite semisimple images

For each η<1/2 and M, find a bound A(η,M) independent of ℓ for |G| whenever the identity action of G⊆GL₂(F_ℓ) is semisimple and satisfies C(η,M). Use the characteristic-polynomial fibres and Dickson's alternatives: a subgroup containing SL₂, a Cartan, a Cartan normalizer, or an exceptional projective image A₄, S₄ or A₅. Include diagonalizable reducible subgroups. The index-two restriction changes η to 2η in the normalizer argument; handle the inequalities with that loss. The exceptional projective orders are at most 60, while scalar fibres still need the Condition C bound.

*Needs:* [2.4 Deligne–Serre Condition C](#24-deligneserre-condition-c); `ArithmeticGaloisRepresentations:§§4.4–4.7`; `ArithmeticGaloisRepresentations:Layer 4; §§5.12, 7.6–7.7`; Mathlib `Matrix.card_GL_field`.

See [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Proposition 7.2 and its proof, printed p. 524; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Proposition 7.2, case (d), printed p. 524.

- `card_le_of_conditionC`: The single order bound with η<1/2 and the semisimplicity hypothesis.

### 2.6 A bound uniform in splitting coefficient primes

Fix a weight-one cuspidal eigensystem and a Galois number field K containing its coefficients. For the infinitely many rational ℓ splitting completely in K, the residual coefficient field is F_ℓ. Use Chebotarev and the sparse-prime result to give its residual image C(η,M) with a single M independent of ℓ; count the finite set of Frobenius polynomials before reduction. The finite set of excluded primes Nℓ does not affect the density comparison. The finite-group bound then gives one A for every such residual image.

*Needs:* [2.3 Residual eigensystems before characteristic-zero eigenforms](#23-residual-eigensystems-before-characteristic-zero-eigenforms); [2.2 Finite eigenvalue sets off sparse primes](#22-finite-eigenvalue-sets-off-sparse-primes); [2.4 Deligne–Serre Condition C](#24-deligneserre-condition-c); [2.5 Bounded finite semisimple images](#25-bounded-finite-semisimple-images); TauCetiRoadmap.Chebotarev, layer 10 dirichlet density chebotarev; TauCetiRoadmap.Chebotarev, layer 3 prime sums and density normalization.

See [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — 8.2, printed p. 525; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Lemme 8.3 and its proof, printed p. 525; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Lemme 8.4, printed p. 525.

### 2.7 Prime-to-residue-characteristic lifting

Let O be a complete DVR with finite residue field κ of characteristic ℓ, Γ a finite group with ℓ∤|Γ|, and r:Γ→GL_n(κ). Construct a lift Γ→GL_n(O), retaining faithfulness when r is faithful. Apply Schur–Zassenhaus to successive additive congruence kernels and choose compatible lifts through the finite inverse system; O-completeness identifies the limit. This is a lifting theorem for a specified finite group, not a reconstruction theorem for an arbitrary Galois pseudorepresentation. The prime-to-order hypothesis is substantive: for ℓ≥5 an order-ℓ unipotent in GL₂(F_ℓ) cannot lift as an order-ℓ element of GL₂(Z_ℓ).

*Needs:* Mathlib `Subgroup.exists_right_complement'_of_coprime`; Mathlib `nonempty_sections_of_finite_inverse_system`; `ArithmeticGaloisRepresentations:§§1.1–1.10`.

See [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — 8.6, printed p. 526.

- `exists_lift_of_not_dvd_card`: Lift the specified finite-group representation over a complete DVR with finite residue field when the residue characteristic does not divide the group order.

### 2.8 A characteristic-zero weight-one lift

Enlarge K to contain roots of unity of orders at most A. Uniform image bounds imply a finite common list of possible Frobenius polynomials; discard the finite set of coefficient primes at which two distinct list members collide after reduction. Infinitely many residual congruences then force every good characteristic-zero polynomial onto that list. Lift one residual finite image at ℓ>A by the prime-to-order theorem and compare another coefficient prime to remove ramification at the first ℓ. Realize the resulting finite representation over algebraic numbers and then C. This construction does not use a topological embedding Q_ℓ→C.

*Needs:* [2.6 A bound uniform in splitting coefficient primes](#26-a-bound-uniform-in-splitting-coefficient-primes); [2.7 Prime-to-residue-characteristic lifting](#27-prime-to-residue-characteristic-lifting); `ArithmeticGaloisRepresentations:§§5.3–5.7`; TauCetiRoadmap.Chebotarev, layer 10 dirichlet density chebotarev.

See [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — 8.5, printed p. 525; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — 8.6, printed p. 526.

### 2.9 Weight-one cuspidal irreducibility

A reducible finite-image two-dimensional representation is a sum of two finite-order characters. The odd determinant makes them distinct. Euler logarithms, the bounded higher-prime-power remainder, nonvanishing of nontrivial character L-values at 1 and the zeta residue then give the coefficient-two prime estimate. It contradicts Rankin's coefficient-one bound for a cusp form. This proves irreducibility of the characteristic-zero lift; the reverse direction for an Eisenstein eigensystem belongs to the Artin identification.

*Needs:* [2.1 Rankin's prime estimate](#21-rankins-prime-estimate); [2.8 A characteristic-zero weight-one lift](#28-a-characteristic-zero-weight-one-lift); Mathlib `DirichletCharacter.LFunction_apply_one_ne_zero`; Mathlib `riemannZeta_residue_one`; TauCetiRoadmap.Chebotarev, layer 3 prime sums and density normalization; ArithmeticDirichletSeries (Completed), Layer 3, layer 3 local factors and euler products.

See [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — 8.7, printed p. 526; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — 8.7, printed p. 527.

### 2.10 The weight-one Artin representation

For a nonzero weight-one eigensystem of odd nebentypus ψ, combine the cuspidal lift with the Eisenstein character sum to attach a semisimple finite-image representation over C, unramified outside N, whose good trace is a_p and determinant is ψ(p). It is unique up to isomorphism and irreducible exactly for a cusp form. Complex conjugation has eigenvalues 1 and −1; all Frobenius eigenvalues are roots of unity, so |a_p|≤2. The cusp form η(z)η(23z) gives the dihedral S₃ example. Weight-one lattices and conjugate eigensystems are inputs, not consequences of this representation.

*Needs:* [1.7 Higher-weight classical existence](#17-higher-weight-classical-existence); `AlgebraicModularFormsAndSerreWeights:R15.5`; [2.8 A characteristic-zero weight-one lift](#28-a-characteristic-zero-weight-one-lift); [2.9 Weight-one cuspidal irreducibility](#29-weight-one-cuspidal-irreducibility); TauCetiRoadmap.ModularForms, layer 0 diamond operators and modular forms with character nebentypus; `ArithmeticGaloisRepresentations:§§5.3–5.7`.

See [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Theoreme 4.1, printed pp. 513-514; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Corollaire 4.2, printed p. 514; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Remarque 6.5, printed p. 521; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — section 8, opening and 8.1, printed p. 525.

### Examples

The trivial subgroup satisfies Condition C(η,1) for every η≥0 and fails
C(0,0). A full split diagonal Cartan in GL₂(F₃) has order four and three
characteristic polynomials: the two scalar polynomials and X²−1. The latter
has a fibre of size two. Thus polynomial support and group cardinality are
different quantities even in a semisimple example. A nontrivial unipotent
group is excluded by the semisimplicity hypothesis, not by its finite size.

In the lifting step choose ℓ larger than the single uniform image bound, then
reduce characteristic polynomials through the finite congruence stages. Only
after a finite set of possible characteristic-zero coefficients and infinitely
many coefficient primes have been obtained can congruence force equality.
A complex finite-image representation does not follow from one residual lift.

### Dependencies

Layer 1; TauCetiRoadmap.ModularForms 8W, 8G; AlgebraicModularFormsAndSerreWeights R15.5; ArithmeticGaloisRepresentations Layers 1, 4 and 5; TauCetiRoadmap.Chebotarev and ArithmeticDirichletSeries; AutomorphicLFunctionsAndLocalFactors AL.3.

## Layer 3: Hilbert constructions and their arithmetic properties

### 3.1 The quaternionic multiplicity space

Choose B/F split at one real place τ₁ and ramified at all the others, and split at every finite place except for one finite discrete-series place when d is even. Choose a finite Galois E/Q containing F and the coefficients of π and splitting B. Form the coefficient representation `⊗_τ det^{(w−k_τ+2)/2}Sym^{k_τ−2}`, of dimension ∏_τ(k_τ−1), whose center acts by the norm to the power w, and its lisse sheaf. Extract σ_λ as Hom from the finite automorphic factor to H¹ of the Shimura curve. Matsushima–Shimura multiplicity gives dimension two. Prove compatibility with level change and the direct-limit decomposition into π_f⊗σ_λ. If F=Q, take the parabolic image rather than all H¹; the boundary cannot be absorbed into a cuspidal multiplicity space.

*Needs:* `HilbertModularVarietiesAndShimuraCurves:R18.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 2.2.3, p. 420; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 2.2.4, p. 420; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 2.3, p. 421.

- `Carayol.sigmaLambda` (constructor): σ_λ(π) = Hom_{H(G(𝔸^f),K)}(π_f^K, H¹(M_K ⊗ F̄, F_λ)) for π ∈ C.
- `Carayol.sigmaLambda_finrank` (characterisation): dim_{E_λ} σ_λ(π) = 2.
- `Carayol.sigmaLambda_level_indep` (characterisation): σ_λ(π) does not depend on K with π_f^K ≠ 0.
- `Carayol.cohomology_decomposition` (relation): lim_K H¹(M_K ⊗ F̄, F_λ) ⊗ Ē_λ ≅ ⊕_{π∈C} π^f ⊗ σ(π) as G(𝔸^f) × Gal(F̄/F)-modules.

**Checks.**

- `Carayol.sigmaLambda_finrank_two` (computation): For every π ∈ C, σ_λ(π) has dimension 2.
- `Carayol.coefficient_rank` (computation): dim_E W = ∏_i (k_i − 1); with all k_i = 2 it is 1.
- `Carayol.parabolic_needed_over_Q` (non-example): For F = ℚ, using the full H¹ of the open modular curve adds Eisenstein classes, so σ(π) must be taken in parabolic cohomology.

### 3.2 Twisting and the exact determinant

Twisting π by a character with component t↦t^{-u} on the positive real scalars changes w to w+2u. Carayol's multiplicity space changes contravariantly by that character's inverse. Establish `det σ_λ=χ_{π,λ}⁻¹ε_ℓ⁻¹`. A calculation of the square of the determinant leaves a quadratic ambiguity; remove it using the source's global comparison, rather than claiming the squared identity already proves the determinant formula.

*Needs:* [3.1 The quaternionic multiplicity space](#31-the-quaternionic-multiplicity-space); `HilbertModularVarietiesAndShimuraCurves:R18.4`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 3.3, Proposition, p. 422; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 5.5, pp. 428–429; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 5.6.1, p. 429.

### 3.3 Vanishing-cycle filtration

At the bad place, identify the two-step filtration of σ_λ furnished by vanishing cycles and the further decomposition of its first piece into supersingular and normalized-curve contributions. If the normalized contribution σ̃₁ is nonzero, π_v is principal series. If dim σ̃₁=2, then σ_v=σ̃₁ and it is the full local parameter. At a smooth unramified place the multiplicity is already the two-dimensional normalized cohomology. Import bad-reduction models and equivariant vanishing cycles, and retain the distinction between these geometrically defined pieces and residual characters. The weight-two exception in the cohomological argument must be retained.

*Needs:* [3.1 The quaternionic multiplicity space](#31-the-quaternionic-multiplicity-space); [3.2 Twisting and the exact determinant](#32-twisting-and-the-exact-determinant); `HilbertModularVarietiesAndShimuraCurves:R18.2`; `LefschetzPencilsAndVanishingCycles:LPV.0`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 5.6, p. 429; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 11.1, p. 449.

Keep the term A=ker(H²(special fibre,F)→H²(generic fibre,F)) in the exact
sequence before extracting the cuspidal multiplicity. If every k_τ=2, the
coefficient sheaf is constant on each irreducible component and A need not
vanish. Otherwise H⁰ and H² on each component vanish. The action on A factors
through the idele norm, so A has no cuspidal automorphic constituent and its
localized cuspidal multiplicity vanishes even in weight two. These are the
distinct assertions in Carayol §4.4, p. 424, and §11.5, p. 451. A proof that
sets A=0 before localization in weight two fails this target.


### 3.4 Special local components

If π_v=χ·Sp, identify the parameter as the indecomposable special representation with characters χ⁻¹ and χ⁻¹ε_ℓ⁻¹ in Carayol's convention. The normalized contribution is zero and the supersingular piece supplies the kernel line. Picard–Lefschetz makes N nonzero, with image the kernel of pullback from special-fibre H¹ to the H¹ of its normalization. The target is this kernel, not the opposite cokernel. Semisimplifying the two characters would erase the extension and give an incorrect special parameter.

*Needs:* [3.3 Vanishing-cycle filtration](#33-vanishing-cycle-filtration); [3.2 Twisting and the exact determinant](#32-twisting-and-the-exact-determinant); `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `LefschetzPencilsAndVanishingCycles:§§7a.1–7a.3`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 6.7, Proposition, p. 432; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 6.7, Remarque, p. 432; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 11.4, Proposition, p. 451.

### 3.5 The local fundamental representation

The vanishing-cycle quotient σ₂ is nonzero if and only if π_v is essentially discrete series. Identify π_v⊗σ₂ with the π̄_v^∨-isotypic part of the representation U of the product of the local Weil group, GL₂(F_v) and the division-quaternion group. Construct U from the Drinfeld/supersingular geometry of
HilbertModularVarietiesAndShimuraCurves §§R18.2.3, R18.2.6 and R18.5.19–R18.5.21. This identifies the local Galois parameter independently of the global eigenform and supplies the cuspidal part of the geometric proof.

*Needs:* [3.3 Vanishing-cycle filtration](#33-vanishing-cycle-filtration); `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `HilbertModularVarietiesAndShimuraCurves:R18.5`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 10.6, Proposition, pp. 448–449.

The intended carrier `localFundamentalRepresentation` is the direct limit
of the degree-one vanishing-cycle spaces of the universal height-two formal
O_{F_v}-module, with all level structures and quasi-isogeny components. Here
ℓ differs from the residue characteristic of F_v. Construct its commuting
continuous Weil action and smooth GL₂(F_v) and division-quaternion actions.
Identify the vanishing cycles with cohomology of the generic fibre of the
completed strict henselization, retaining the component and descent actions.
The API comprises level transition, coefficient extension, commuting actions
and the π̄_v^∨-isotypic multiplicity comparison above. (Carayol §§7–9,
§10.3 and Brylinski's appendix, in the scan cited above.)

**Checks.**

- Passing between two successive full local levels intertwines all three
  group actions; forgetting the level must not change the Weil normalization.
- A principal-series component has σ₂=0, whereas an essentially discrete-series
  component has σ₂≠0; the local construction cannot assign the same zero
  multiplicity to both.
- Twisting by a nonquadratic unramified character distinguishes the
  π̄_v^∨-isotypic convention from the π̄_v-isotypic convention. Its scalar
  value and inverse must be transported by the determinant dictionary.

### 3.6 Ordinary cuspidal local components

Here “ordinary cuspidal” means the dihedral local representation, not p-ordinary. For the quadratic local extension L and character ξ, identify Carayol's parameter with `Ind ξ⁻¹|·|⁻¹/²`. Globalize it by quadratic automorphic induction with the necessary prescribed local component and nonsplit auxiliary place, then compare global representations. This step imports the induction and globalization theorem; it does not construct a second induction functor.

*Needs:* [3.5 The local fundamental representation](#35-the-local-fundamental-representation); [3.3 Vanishing-cycle filtration](#33-vanishing-cycle-filtration); `GL2AutomorphicRepresentationsAndTransfer:R17.5`; [3.4 Special local components](#34-special-local-components); `ArithmeticGaloisRepresentations:§§1.1–1.10`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 11.3, p. 450.

### 3.7 Carayol's Theorem B

For the fixed geometric construction and auxiliary discrete-series place v₀, identify σ_λ|W_v at every v≠v₀ away from λ except the extraordinary cuspidal case. Combine normalized cohomology for principal series, the special monodromy argument and the ordinary-cuspidal globalization. Both exclusions belong to the conclusion of this intermediate theorem and are discharged by the subsequent comparison steps.

*Needs:* [3.3 Vanishing-cycle filtration](#33-vanishing-cycle-filtration); [3.4 Special local components](#34-special-local-components); [3.5 The local fundamental representation](#35-the-local-fundamental-representation); [3.6 Ordinary cuspidal local components](#36-ordinary-cuspidal-local-components); [3.2 Twisting and the exact determinant](#32-twisting-and-the-exact-determinant); `GL2AutomorphicRepresentationsAndTransfer:R17.3`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 11.1, pp. 449–450; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 11.3, p. 450.

### 3.8 Primitive two-dimensional restriction

For the extraordinary dyadic local case, the finite projective image is A₄ or S₄. A local Galois quotient is solvable, so A₅ does not occur here. Restrict to the cubic extension fixed by a 2-Sylow subgroup: it is normal in the A₄ case and can be nonnormal in the S₄ case. The restricted representation is irreducible and monomial. Prove that matching restrictions together with matching determinants identify the original representations. The determinant condition is indispensable to this recognition.

*Needs:* `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 12.1.3, p. 456.

### 3.9 The extraordinary cubic step

Carry out base change along the chosen degree-at-most-three extension and compare the resulting local parameter with restriction of the Galois representation. Use cyclic base change in the normal case and the separate nonnormal cubic theorem in the other case. At the chosen place the transferred principal/special/ordinary-cuspidal parameter must agree with restriction, not merely at almost all places. Globalize the primitive local representation using the tetrahedral/octahedral inputs, apply Theorem B upstairs and descend with the preceding restriction lemma. This also provides the final comparison at the auxiliary place.

The local statement applies to every extension L/F_v of degree at most three
and every extraordinary cuspidal π_v: its base-change lift corresponds to
the irreducible restriction of its Weil representation to W_L. The comparison
also holds in the Hecke normalization.

*Needs:* `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.5`; `GL2AutomorphicRepresentationsAndTransfer:R16.3`; `GL2AutomorphicRepresentationsAndTransfer:§R17.4.17`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 12.2.2, Proposition, p. 457; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 12.2.3, p. 458.

### 3.10 The unrestricted Hilbert constructor

For every π of type (k,w) as fixed above, construct a continuous semisimple ρ_{π,λ} over a sufficiently large E_λ for every finite λ, unramified outside S_π and ℓ, with good geometric polynomial P_v. No finite discrete-series place is required when d is even. In the geometric branch twist Carayol's representation; in the other branch use auxiliary μ_s-new congruences modulo λ^s and compatible trace/determinant reconstruction. The auxiliary prime can vary with s and imposes no hypothesis on π. Prove independence of construction, extension/conjugation of coefficients, twist compatibility and agreement with the classical M_f. Good polynomials characterize the semisimple representation, while minimal descent to Q(π)_λ is a separate assertion not made here.

*Needs:* [3.7 Carayol's Theorem B](#37-carayols-theorem-b); [3.2 Twisting and the exact determinant](#32-twisting-and-the-exact-determinant); `ArithmeticGaloisRepresentations:§§1.1–1.10`; `ArithmeticGaloisRepresentations:Layer 5`; `IntegralHeckeAndGaloisDeterminants:IHG.1`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `HilbertModularVarietiesAndShimuraCurves:R18.4`; `AutomorphicGaloisRepresentationsPartII:AG2.0, The l-adic character r_{l,ι}(χ)`.

See [Mark Kisin](https://abel.math.harvard.edu/~kisin/dvifiles/def.dvi) — §4.1, author-copy p. 31; [Mark Kisin](https://abel.math.harvard.edu/~kisin/dvifiles/def.dvi) — Proof of Theorem 4.3, author-copy pp. 32–33; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Introduction, p. 242, after equation (1); [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.5, printed p. 410.

- `hilbertGaloisRep` (constructor): The continuous semisimple ρ_{π,λ}: G_F → GL₂(E_λ) attached to π of infinity type (k,w) and λ.
- `hilbertGaloisRep_charpoly` (characterisation): For v ∉ S_π, v ∤ ℓ: charpoly ρ_{π,λ}(Frob_v^{geom}) = X² − t_vX + q_vs_v, with t_v, s_v the eigenvalues of T_v and S_v defined by ϖ_v.
- `hilbertGaloisRep_det` (relation): det ρ_{π,λ} = χ_{π,λ}·ε_ℓ^{−1}, where χ_{π,λ} is the λ-adic character of the central character and ε_ℓ the cyclotomic character.
- `hilbertGaloisRep_twist` (functoriality): For an algebraic Hecke character χ of F: ρ_{π⊗(χ∘det),λ} ≅ ρ_{π,λ} ⊗ χ_λ; in particular ρ_{π⊗|det|^{−1},λ} ≅ ρ_{π,λ} ⊗ ε_ℓ^{−1}, and π ⊗ |det|^{−1} has infinity type (k, w+2).
- `hilbertGaloisRep_carayol` (compatibility): Carayol's σ_λ(π) ≅ ρ_{π,λ} ⊗ χ_{π,λ}^{−1} ≅ ρ_{π^∨,λ} ([3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem)).
- `hilbertGaloisRep_arithmeticDual` (compatibility): ρ_{π,λ}^∨ has characteristic polynomial X² − t_vX + q_vs_v at an arithmetic Frobenius, and ρ_{π,λ}^∨ ≅ σ_λ(π) ⊗ ε_ℓ.
- `hilbertGaloisRep_unique` (extensionality): Two continuous semisimple representations with the polynomials X² − t_vX + q_vs_v at a set of places of density one are isomorphic.
- `hilbertGaloisRep_coefficients` (functoriality): Extension of E and conjugation: for σ ∈ Aut(C), ρ_{π^σ,σ(λ)} is the σ-conjugate of ρ_{π,λ}.
- `hilbertGaloisRep_auxiliaryCongruence` (data): In the congruence branch, compatible traces and determinants modulo λ^s on μ_s-new Hecke quotients.
- `hilbertGaloisRep_classical` (compatibility): For F = Q and a newform f of weight k, the automorphic representation π_f of infinity type (k, k−2) has ρ_{π_f,λ} ≅ M_{f,λ}, the cohomological realisation of [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation).

**Checks.**

- `hilbertGaloisRep_ellipticCurve` (computation): F = Q, E = 11a1 with its unitary π_E of infinity type (2,0): t_3 = a_3 = −1, s_3 = 1, so the geometric Frobenius polynomial at 3 is X² + X + 3, that of H¹_ét(E_Q̄, Q_ℓ).
- `hilbertGaloisRep_delta` (computation): F = Q, π_Δ of infinity type (12,10): t_2 = τ(2) = −24, s_2 = 2^{10}, polynomial X² + 24X + 2048.
- `hilbertGaloisRep_normTwist` (characterisation): Replacing π by π ⊗ |det|^{−1} replaces (t_v, s_v) by (q_vt_v, q_v²s_v) and the polynomial by X² − q_vt_vX + q_v³s_v, whose roots are q_v times the old roots: the twist by ε_ℓ^{−1}.
- `hilbertGaloisRep_inverseUniformiser` (non-example): The polynomial X² − τ_vX + q_vρ_v built from Saito's inverse-uniformiser eigenvalues τ_v = t_v/s_v, ρ_v = s_v^{−1} is that of σ_λ(π), not of ρ_{π,λ}: for π_E ⊗ |det|^{−1} at p = 3 the two polynomials are X² + 3X + 27 and X² + X/3 + 1/3.
- `hilbertGaloisRep_branches` (compatibility): For π with a finite discrete-series place, the congruence branch and Carayol's branch give isomorphic representations.
- `hilbertGaloisRep_parity` (non-example): A multiweight with k_τ ≢ w mod 2 for some τ is not an infinity type (k,w) and is not covered.

### 3.11 The representation dictionary as a theorem

Prove all identities in the convention table, the inverse-uniformiser eigenvalue conversion, the determinant/twist formulas, the labelled Hodge degrees and the classical specialization. The essential local identity is the duality relation for GL₂ between π_v and its central-character inverse twist. Apply the de Rham algebraic-Hecke-character comparison when transporting this identity at v|ℓ. The L-factor and conductor translations apply at every place where local–global compatibility has been established. Test both a norm twist of a weight-two form and a nonquadratic nebentypus; otherwise inverse/dual errors can accidentally cancel.

*Needs:* [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); [3.7 Carayol's Theorem B](#37-carayols-theorem-b); [3.2 Twisting and the exact determinant](#32-twisting-and-the-exact-determinant); [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); `GL2AutomorphicRepresentationsAndTransfer:R16.3`; `ArithmeticGaloisRepresentations:§§1.1–1.10`; `ArithmeticGaloisRepresentations:§§2.1–2.6`; `AutomorphicGaloisRepresentationsPartII:AG2.0, The l-adic character r_{l,ι}(χ)`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.4–0.5, printed pp. 409–410; [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — §2, p. 9 of the arXiv version; [Mark Kisin](https://abel.math.harvard.edu/~kisin/dvifiles/def.dvi) — §4.1, author-copy p. 31; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Introduction, p. 242; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — §2.4.2, p. 255; [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §2.1, p. 9; (3.1′), p. 30; (3.2)–(3.3), pp. 38–39; [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — §1.2, p. 5; §7, pp. 59–60; §9.1.1, p. 80 (authors' final version); [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf) — §5.2.1, pp. 44–45.

For the light coefficient calculations define `hilbertGeomCharpoly t s q` as
X²−tX+qs over any coefficient field, `carayolGeomCharpoly t s q` as
X²−(t/s)X+q/s, and `hodgeDegrees k w` as
((w−k+2)/2,(w+k)/2). Require q,s≠0 for the representation dictionary and
k≥2 with k≡w mod 2 for the labelled-degree interpretation. The polynomial
expressions still exist algebraically outside these hypotheses; that does not
make the corresponding automorphic input admissible.


- `hilbertGeomCharpoly`: The rank-two geometric good polynomial, with coefficient of X equal to −t and constant coefficient qs.
- `carayolGeomCharpoly`: The polynomial after the central-character correction; multiply the roots of the first polynomial by s⁻¹.
- `hodgeDegrees`, `hodgeDegrees_sum`, `hodgeDegrees_normTwist`: The labelled pair, sum w+1 under parity, and shift by (1,1) for w↦w+2.

**Checks.**

- For 11a1 at 3, (t,s,q)=(−1,1,3) gives X²+X+3 in both polynomial definitions. Its labelled degrees at (k,w)=(2,0) are (0,1).
- After the norm twist, (t,s,q)=(−3,9,3) gives X²+3X+27 for `hilbertGeomCharpoly` and X²+X/3+1/3 for `carayolGeomCharpoly`; equating the two loses the central-character factor. The degrees become (1,2).
- With t=0,s=q=1 both polynomial definitions give X²+1. At (k,w)=(12,10), `hodgeDegrees` gives (0,11); the sum is 11.
- Taking s=0 is outside the dictionary even though field division makes an algebraic expression. Taking (k,w)=(2,1) violates parity and must not create a half-integral Hodge type by integer rounding.

### 3.12 Hilbert Hodge–Tate property

At v|ℓ all unrestricted Hilbert representations have exactly the two labelled degrees specified above. When d is odd, there is a finite discrete-series place, some k_τ>2, or π is CM, obtain de Rham comparison from geometric cohomology up to an algebraic character twist, or from the induced CM character. In the remaining even-degree, parallel-weight-two, everywhere-principal-series, non-CM case, make a totally real abelian base change and a twist to w=0. Its symmetric-square realization comes from a unitary Shimura variety for GU(Φ), over a CM field E=FE₀ with E₀ imaginary quadratic and ℓ split, with signature (2,1) at the distinguished archimedean place and (3,0) at the others. At the chosen good place the symmetric square is crystalline with degrees 0,1,2; lifting along GL₂→GL₂/{±1} gives a crystalline rank-two representation, with the original a possibly nontrivial quadratic twist. Hodge degrees survive this twist. Identification of its WD parameter with π_v requires the full coefficient-prime theorem, not just the symmetric-square argument.

*Needs:* [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); [3.1 The quaternionic multiplicity space](#31-the-quaternionic-multiplicity-space); `AutomorphicGaloisRepresentationsPartII:AG2.P, Finite-coefficient periods, descent and geometric comparison`; [0.2 Crystalline lifting through the central isogeny](#02-crystalline-lifting-through-the-central-isogeny); `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `GL2AutomorphicRepresentationsAndTransfer:§R17.4.13`; [0.6 The unitary and GL₃ geometric realizations](#06-the-unitary-and-gl₃-geometric-realizations); `ArithmeticGaloisRepresentations:§§1.1–1.10`; `AutomorphicGaloisRepresentationsPartII:AG2.0, The l-adic character r_{l,ι}(χ)`.

See [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Introduction, p. 243; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — §2.4.1, p. 251; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — §2.4.1, p. 252.

### 3.13 Geometric characters and algebraic Hecke characters

Let K be a number field, E_λ a finite extension of Q_ℓ and
χ:G_K→E_λ× a continuous character, unramified outside finitely many places and
de Rham at every v|ℓ. Prove, after enlarging a coefficient number field and choosing
its embedding into Q̄_ℓ, that χ is the λ-adic avatar of an algebraic Hecke
character. The avatar uses geometric reciprocity, and its labelled degrees agree
with those of χ. Conversely the avatar of an algebraic Hecke character is
geometric. This is a statement about characters; it does not assert the
Fontaine–Mazur conjecture for higher-dimensional representations.

Use local rank-one de Rham classification to obtain a Q-algebraic character
χ_alg on an open subgroup of ∏_{v|ℓ}K_v×. Define
η(x)=χ(rec_K(x))χ_alg(x_ℓ)⁻¹. It kills an open subgroup U of the ideles, but
on K× it equals χ_alg⁻¹, rather than 1. Choose U to include the connected
archimedean subgroup and a finite-conductor subgroup. Finiteness of the ray
class quotient A_K×/(K×U) gives finitely many representatives x_j and powers
x_j^{h_j}∈K×U. Their η-values therefore have algebraic powers, hence are
algebraic. Together with a field of definition of χ_alg they generate one
finite number field L containing every η-value. This also puts χ(W_v) in L
after enlarging L for the algebraic local uniformizer values. It supplies the
number-field-valued Weil-group hypothesis in the converse lemma, rather than
assuming that every continuous character already has algebraic Frobenius values.
Then apply the converse in [Conrad's algebraic Hecke-character notes](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/algebraicHeckecharacters.pdf),
the second Lemma 1 and its proof, pp. 9–10.

If K is totally real, Dirichlet's unit theorem forces the algebraic exponents to
be parallel. Hence χ=χ₀ε_ℓ^m for an integer m and finite-order χ₀. In our grading
the labelled degree is −m. Use this consequence in the reducibility argument of
[Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf),
Remark, printed p. 256. Over a CM field retain the separate exponents at the two
conjugate embeddings; parallel exponents cannot replace the CM character used in
quadratic induction.

*Needs:* TauCetiRoadmap.ClassFieldTheory, global reciprocity with geometric
normalization; TauCetiRoadmap.GlobalNumberFields, ideles, ray class groups and
the unit theorem; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.3 and
AutomorphicGaloisRepresentationsPartII AG2.P, rank-one local algebraicity
and stability of de Rham representations under subquotients;
AutomorphicGaloisRepresentationsPartII AG2.0, algebraic characters and their
avatars.

- `geometricCharacter_isHeckeAvatar`: Construct the algebraic character and coefficient extension with the prescribed λ-adic realization.
- `geometricCharacter_totallyReal`: Over a totally real field identify χ₀ and the single cyclotomic exponent m, with degree −m.
- `geometricCharacter_coeffChange`: Enlarging coefficients changes the chosen realization, not its conductor or labelled degrees.

**Checks.**

- The trivial character has m=0 and the trivial finite-order factor; ε_ℓ has m=1 and degree −1.
- The CM elliptic character over Q(i) has unequal labelled degrees at conjugate embeddings; the totally real conclusion must not apply to it.
- A continuous local character with a nonintegral Sen weight fails the de Rham hypothesis and supplies no algebraic avatar.

### 3.14 Determinant, total oddness and absolute irreducibility

For the unrestricted ρ_{π,λ}, prove determinant χ_{π,λ}ε_ℓ⁻¹, determinant −1 at complex conjugation at each real place, and absolute irreducibility. Use the exact determinant comparison to remove quadratic ambiguity. If a global decomposition existed, Hodge–Tate characters would be algebraic Hecke characters and the source's L-function pole argument would contradict cuspidality. Prove uniqueness from good Frobenius polynomials and identify totally real solvable cuspidal base change with restriction. Absolute irreducibility of the global representation does not rule out a reducible ordinary local restriction, nor does it imply residual irreducibility.

*Needs:* [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); [3.2 Twisting and the exact determinant](#32-twisting-and-the-exact-determinant); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); [3.12 Hilbert Hodge–Tate property](#312-hilbert-hodgetate-property); `ArithmeticGaloisRepresentations:§§1.1–1.10`; `ArithmeticGaloisRepresentations:Layer 5`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `AutomorphicLFunctionsAndLocalFactors:AL.3`; `AutomorphicGaloisRepresentationsPartII:AG2.0, The l-adic character r_{l,ι}(χ)`; [3.13 Geometric characters and algebraic Hecke characters](#313-geometric-characters-and-algebraic-hecke-characters).

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — §§3.1–3.3, printed pp. 421–422; §5.5, printed pp. 428–429; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Remark, p. 256; [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — §2, p. 9 of the arXiv version.

### 3.15 The CM predicate

On an existing regular Hilbert eigensystem define CM by π_f=AI_L^F(α), for a totally imaginary quadratic L/F and the matching infinity type. The infinity exponents of α are half-integral; the algebraic character is α′=α|·|_L⁻¹/². Its λ-adic induction is our ρ, and α′_λ must differ from its conjugate to give cuspidality and irreducibility. Carayol's inducing character is `(α⁻¹|·|_L⁻¹/²)_λ`; the arithmetic dual uses `(α′_λ)⁻¹`. Supply the inducing field, split/inert trace formulas and compatibility with twists and coefficient extension. The regular k_τ≥2 definition does not silently include the different finite-order weight-one case.

At a complex embedding above τ, the prescribed component of α is
`z^{(k_τ−1−w)/2} z̄^{(−k_τ+1−w)/2}`, or its conjugate. Twisting by
`|·|_L⁻¹/²` makes both exponents integral because k_τ≡w modulo 2.

*Needs:* `GL2AutomorphicRepresentationsAndTransfer:R17.5`; [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); `ArithmeticGaloisRepresentations:Layer 5`; [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); `AutomorphicGaloisRepresentationsPartII:AG2.0, The l-adic character r_{l,ι}(χ)`.

See [Samit Dasgupta and Mahesh Kakde](https://math.iisc.ac.in/~maheshkakde/brumerstark.pdf) — §9.1, p. 66, CM definition; [Baskar Balasubramanyam, Eknath Ghate and Vinayak Vatsal](https://mathweb.tifr.res.in/~eghate/hilbertCM.pdf) — Introduction, p. 2, Remarks (i)–(ii).

- `IsCMHilbert` (characterisation): Existence of L/F and α with π_f=AI(α) and the matching induced Galois representation.
- `IsCMHilbert.inducingField` (data): A CM quadratic inducing extension, recorded with its embedding and nontrivial automorphism.
- `IsCMHilbert.trace_inert` (simp): Trace is zero at unramified primes inert in L.
- `IsCMHilbert.trace_split` (simp): At a split prime the trace is α′_λ(Frob_w)+(α′_λ)^c(Frob_w), for geometric Frobenius elements.
- `IsCMHilbert.twist` (functoriality): A compatible algebraic character twist preserves CM, with inducing character multiplied by its restriction.
- `IsCMHilbert.coefficientExtension` (compatibility): CM is invariant under extending the coefficient field.

**Checks.**

- `IsCMHilbert_Qi` (computation): The weight-two form of y²=x³−x, conductor 32, is induced from Q(i); unramified primes 3 mod 4 have trace zero.
- `IsCMHilbert_twist` (characterisation): A finite-order character twist of this form has the same quadratic inducing field.
- `IsCMHilbert_delta` (non-example): The level-one form Δ has no CM quadratic self-twist.
- `IsCMHilbert_splitTrace` (computation): A split Frobenius acts diagonally by α′_λ and (α′_λ)^c; determinant is their product, whereas an inert Frobenius has trace zero.
- `IsCMHilbert_halfIntegralShift` (computation): For y²=x³−x and 5=(2+i)(2−i): a_5=−2, and the values of α′_λ at the two geometric Frobenius elements above 5 are −1±2i, of absolute value 5^{1/2} and sum −2; the values of α or of α|·|_L^{−1} there have absolute value 1 or 5.

### 3.16 Virtual reducibility characterizes CM

Suppose the regular, absolutely irreducible attached rank-two representation becomes reducible on an open subgroup. Compact semisimple Clifford theory and the infinite projective image forced by distinct labelled Hodge–Tate degrees give induction from a character of a quadratic extension. The algebraic character and archimedean parameter force that extension to be totally imaginary. Thus f is CM, and a non-CM regular form remains irreducible on every open subgroup. The infinite-projective-image condition and regular weight exclude the exceptional finite-image possibilities; the CM-field conclusion is not asserted for weight-one dihedral forms.

*Needs:* [3.14 Determinant, total oddness and absolute irreducibility](#314-determinant-total-oddness-and-absolute-irreducibility); [3.15 The CM predicate](#315-the-cm-predicate); `ArithmeticGaloisRepresentations:Layer 4; §§5.12, 7.6–7.7`; `GL2AutomorphicRepresentationsAndTransfer:R17.5`; [3.12 Hilbert Hodge–Tate property](#312-hilbert-hodgetate-property); `AutomorphicGaloisRepresentationsPartII:AG2.0, The l-adic character r_{l,ι}(χ)`; [3.13 Geometric characters and algebraic Hecke characters](#313-geometric-characters-and-algebraic-hecke-characters).

See [Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/invent_28.pdf) — Theorem 2.3 and proof, printed pp. 251–252; [Baskar Balasubramanyam, Eknath Ghate and Vinayak Vatsal](https://mathweb.tifr.res.in/~eghate/hilbertCM.pdf) — Remark (ii), p. 2; [Samit Dasgupta and Mahesh Kakde](https://math.iisc.ac.in/~maheshkakde/brumerstark.pdf) — §9.1, Lemma 9.1, p. 66, with its proof on p. 67.

### 3.17 Carayol's geometric Hilbert theorem

For π of type (k,w), require additionally a finite essentially square-integrable place if d is even. After enlarging the coefficient field construct Carayol's σ_λ system with the Hecke-correspondence local representation at every finite v of residue characteristic different from λ. The auxiliary-place and extraordinary-place exclusions of Theorem B are removed by base change and the primitive-restriction argument; the even-degree existence hypothesis is retained. Translate σ_λ to ρ_{π,λ} by the dictionary. This geometric theorem is distinct from the unrestricted Hilbert construction above.

*Needs:* `HilbertModularVarietiesAndShimuraCurves:R18.4`; `HilbertModularVarietiesAndShimuraCurves:R18.2`; [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); [3.7 Carayol's Theorem B](#37-carayols-theorem-b); [3.8 Primitive two-dimensional restriction](#38-primitive-two-dimensional-restriction); [3.9 The extraordinary cubic step](#39-the-extraordinary-cubic-step); [3.2 Twisting and the exact determinant](#32-twisting-and-the-exact-determinant); `GL2AutomorphicRepresentationsAndTransfer:R17.4`; [3.14 Determinant, total oddness and absolute irreducibility](#314-determinant-total-oddness-and-absolute-irreducibility); `ArithmeticGaloisRepresentations:§§1.1–1.10`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.3 and Theoreme (A), printed pp. 409–411; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — Theoreme (B), printed p. 411; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.11, printed p. 412; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 12.3.1, pp. 458–459; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 12.3.2, p. 459.

### Examples

For the elliptic representation with (k,w)=(2,0), t₃=−1,s₃=1 gives
X²+X+3. Twisting π by |det|⁻¹ changes the data to t₃=−3,s₃=9 and the polynomial
to X²+3X+27. Carayol's inverse-uniformizer convention instead gives
X²+X/3+1/3 at those twisted data. The distinct polynomials test the dictionary
even when the original central character was trivial.

The CM form of y²=x³−x has trace zero at unramified primes inert in Q(i).
At 5 the two geometric inducing-character values are −1±2i, giving trace −2
and determinant 5. Its separate local lines do not contradict global absolute
irreducibility, and the regular-weight CM conclusion is not a weight-one theorem.

### Dependencies

Layer 1; HilbertModularVarietiesAndShimuraCurves R18.2, R18.4–R18.5; GL2AutomorphicRepresentationsAndTransfer R16.3, R17.3–R17.5; LefschetzPencilsAndVanishingCycles LPV.0 and §§7a.1–7a.3; ArithmeticGaloisRepresentations; AutomorphicGaloisRepresentationsPartII AG2.0 and AG2.P; §0.6; §§0.1–0.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P7.1–R07.P7.3 and R07.3.0–R07.3.3; AutomorphicGaloisRepresentationsPartII AG2.P; ClassFieldTheory and GlobalNumberFields.

## Layer 4: Local compatibility and geometric weights

### 4.1 Geometric weight-monodromy and strict compatibility

For Saito's geometric Hilbert range g>1, w_S≥k_τ≥2 with matching parity, and a finite discrete-series place when g is even, prove strict compatibility away from the coefficient characteristic. Prove monodromy purity for both the étale WD representation away from λ and the log-crystalline D_pst representation at the coefficient characteristic. His cohomological representation has weight w_S−1; when N≠0 its kernel and cokernel have weights w_S−2 and w_S. In the fixed ρ-convention these become weight 3−w_S=w+1, kernel weight w and cokernel weight w+2. Include the classical geometric weight theorem with its separate source. The imported log-crystalline/étale weight theorem is independent of the coefficient-prime application; otherwise the proof would be circular. This scope is narrower than the all-Hilbert purity target.

*Needs:* [3.1 The quaternionic multiplicity space](#31-the-quaternionic-multiplicity-space); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); [3.17 Carayol's geometric Hilbert theorem](#317-carayols-geometric-hilbert-theorem); `WeightsInEtaleCohomology:R34.3, Saito’s semistable model and period comparison`; `WeightsInEtaleCohomology:R34.6`; `WeightsInEtaleCohomology:R34.6, Transport through actual arithmetic comparisons`; `ArithmeticGaloisRepresentations:§§2.1–2.6`.

See [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — Theorem 2, p. 13 of the arXiv version; [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — Remark after Theorem 2, p. 13 of the arXiv version; [Takeshi Saito](https://www.ms.u-tokyo.ac.jp/~t-saito/pp/weightmonodromy.pdf) — Theorem 1, printed p. 429 (page image).

### 4.2 Hilbert Ramanujan–Petersson

For every regular cohomological cuspidal π, its unitary twist π⊗|det|^{w/2} is tempered at every finite place. At an unramified place all roots of P_v have complex absolute value q_v^{(w+1)/2}, and |t_v|≤2q_v^{(w+1)/2} at every embedding. Exclude complementary-series parameters using the integrality of geometric weights and the local classification. In the remaining parallel-weight-two case use the degree-two cohomology of the quaternionic Shimura surface and weight-monodromy for surfaces; other geometric cases use the curve/unitary realisations. No residual irreducibility or finite discrete-series place is part of the theorem.

*Needs:* [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); [3.1 The quaternionic multiplicity space](#31-the-quaternionic-multiplicity-space); `DeligneWeightsAndPurity:§§4.3, 7.15`; [0.7 Quaternionic surfaces and weight-monodromy](#07-quaternionic-surfaces-and-weight-monodromy); `HilbertModularVarietiesAndShimuraCurves:R18.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `GL2AutomorphicRepresentationsAndTransfer:R16.2`; [0.6 The unitary and GL₃ geometric realizations](#06-the-unitary-and-gl₃-geometric-realizations); `GL2AutomorphicRepresentationsAndTransfer:R17.5`; `ArithmeticGaloisRepresentations:§§2.1–2.6`.

See [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — Theorem 1, p. 1 (arXiv v1); [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — §2.2, p. 15; [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — §4.2, p. 21; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — §2.4.1, Remark, p. 252; [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — Proposition 2, p. 11, and Proposition 5, pp. 16–17.

### 4.3 Hecke versus Langlands normalization

For every local π_v, Carayol's parameter σ(π_v) is the contragredient of the Langlands parameter after the |·|^{1/2} twist; characterize it by all twisted L- and ε-factors. For a unitary-induced principal series Ind(ξ₁,ξ₂) it is `ξ₁⁻¹|·|⁻¹/² ⊕ ξ₂⁻¹|·|⁻¹/²`. Prove `det σ(π_v)=χ_{π_v}⁻¹|·|⁻¹` and `σ(ηπ_v)=η⁻¹σ(π_v)`, and compatibility with coefficient automorphisms. In Carayol's geometric range, Theorem A identifies the actual λ-adic Weil representations at every v∤ℓ; this includes the monodromy operator, not just good Frobenius traces. Translate by the global dictionary to the parameter of ρ and deduce conductor and local-factor identities.

*Needs:* [3.17 Carayol's geometric Hilbert theorem](#317-carayols-geometric-hilbert-theorem); `GL2AutomorphicRepresentationsAndTransfer:R16.3`; `ArithmeticGaloisRepresentations:§§2.1–2.6`.

See [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.5, printed p. 410; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.5(a), printed p. 410; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.8 Corollaire, printed p. 411.

### 4.4 All-Hilbert compatibility away from λ

For every π of type (k,w), including even degree and principal series at every finite place, prove at every finite v∤ℓ that `WD(ρ_{π,λ}|G_{F_v})^{F-ss} ≅ Rec_v(π_v⊗|·|⁻¹/²)`. Retain the monodromy operator under Frobenius-semisimplification. Deduce equality of Artin conductors, the shifted automorphic L-factor and N≠0 precisely for a Steinberg twist. Carayol supplies the geometric case via the dictionary; the general assertion uses the unrestricted construction and its transfer compatibility. Equality of traces or semisimplified inertia is weaker than this target.

*Needs:* [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); [3.17 Carayol's geometric Hilbert theorem](#317-carayols-geometric-hilbert-theorem); [4.3 Hecke versus Langlands normalization](#43-hecke-versus-langlands-normalization); `GL2AutomorphicRepresentationsAndTransfer:R16.3`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `ArithmeticGaloisRepresentations:§§2.1–2.6`.

See [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Introduction, p. 242; [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — §3, p. 18; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — Theorem A, printed pp. 410–411; §§12.2–12.3, printed pp. 457–459.

### 4.5 Geometric coefficient-prime comparison

In the classical k≥2 branch, at every λ|p identify the potentially semistable cohomological realisation and its full WD parameter with the corresponding local automorphic parameter. For Hilbert forms in Saito's range retain g>1, w_S≥k_τ, parity and the even-degree discrete-series place. Transport his representation through the dictionary. At a good prime the representation is crystalline, with the Euler-root polynomial and labelled Hodge filtration. The finite-extension comparison and Weil-action trace calculation must identify the monodromy operator as well. Weight-two Barsotti–Tate consequences require the separate p-divisible-group comparison and do not extend to all weights.

*Needs:* [1.3 Scholl's projector](#13-scholls-projector); [1.4 Rational orbit projector and coefficient descent](#14-rational-orbit-projector-and-coefficient-descent); [3.17 Carayol's geometric Hilbert theorem](#317-carayols-geometric-hilbert-theorem); [4.1 Geometric weight-monodromy and strict compatibility](#41-geometric-weight-monodromy-and-strict-compatibility); `AutomorphicGaloisRepresentationsPartII:AG2.P, Finite-coefficient periods, descent and geometric comparison`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; `ModularCurvesPartII:§§16.2–16.3`; [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); `AutomorphicGaloisRepresentationsPartII:AG2.0, The l-adic character r_{l,ι}(χ)`.

See [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — Theorem 1, p. 12 of the arXiv version; [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — Claim 1, p. 12 of the arXiv version; [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — Abstract, p. 1 of the arXiv version; [Takeshi Saito](https://www.ms.u-tokyo.ac.jp/~t-saito/pp/weightmonodromy.pdf) — Theorem 3, printed pp. 429–430 (page image); [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Introduction, p. 243.

### 4.6 Kisin's coefficient-prime theorem

For π of arbitrary regular cohomological multiweight over a totally real F, λ|p and absolutely irreducible semisimplified residual representation, every v|p is potentially semistable with the prescribed labelled degrees and full Frobenius-semisimple WD parameter `Rec_v(π_v⊗|·|⁻¹/²)`. No parallel-weight, unramified-base or finite discrete-series assumption is imposed. In the proof the fixed-type quotient and finite-projective period module are defined over complete Noetherian local coefficient algebras, and are tested on finite Q_p-algebras with nilpotents. Do not substitute equality at field-valued points for this quotient property. The residual assumption belongs to this proof route and is removed by the next theorem.

*Needs:* [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); [4.5 Geometric coefficient-prime comparison](#45-geometric-coefficient-prime-comparison); `LocalGaloisDeformationRings:§§3.1–3.3`; `LocalGaloisDeformationRings:§§3.4–3.7`; `IntegralHeckeAndGaloisDeterminants:IHG.1`.

See [Mark Kisin](https://abel.math.harvard.edu/~kisin/dvifiles/def.dvi) — Theorem 4.3 and proof, author-copy pp. 32–33; [Mark Kisin](https://abel.math.harvard.edu/~kisin/dvifiles/def.dvi) — Theorem 2.5.5, author-copy pp. 19–20; Theorem 2.7.6, author-copy p. 23; [Mark Kisin](https://abel.math.harvard.edu/~kisin/dvifiles/def.dvi) — §4.1, author-copy p. 31.

### 4.7 Skinner's full coefficient-prime theorem

For the unrestricted Hilbert representation and every v|p, prove potential semistability, the labelled degrees and the full local parameter, without residual irreducibility or a discrete-series place. After the geometric/CM cases, reduce the remaining parallel-weight-two case by abelian base change. The symmetric-square geometric realization and crystalline lifting give the parameter up to quadratic twist; the quaternionic eigenvariety and analytic continuation of a crystalline period remove that ambiguity. At v|p the continuation input uses φ^{f_v} and a Sen polynomial P(X)=XQ(X) with Q(0) not a zero divisor. Require this condition on the family, not merely at selected classical points. Import generic periods, unitary geometry, eigenvariety gluing and their exact coefficient hypotheses. An equality of Hodge numbers alone does not discharge this target.

*Needs:* [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); [3.12 Hilbert Hodge–Tate property](#312-hilbert-hodgetate-property); [3.14 Determinant, total oddness and absolute irreducibility](#314-determinant-total-oddness-and-absolute-irreducibility); [4.4 All-Hilbert compatibility away from λ](#44-all-hilbert-compatibility-away-from-λ); [4.5 Geometric coefficient-prime comparison](#45-geometric-coefficient-prime-comparison); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:§§R07.P7.1–R07.P7.3, R07.3.0–R07.3.3, R07.4.13`; `AutomorphicGaloisRepresentationsPartII:AG2.P, Finite-coefficient periods, descent and geometric comparison`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `GL2AutomorphicRepresentationsAndTransfer:§R17.4.13`; [0.6 The unitary and GL₃ geometric realizations](#06-the-unitary-and-gl₃-geometric-realizations); [0.3 Quaternionic finite-slope families](#03-quaternionic-finite-slope-families); [0.3 Quaternionic finite-slope families](#03-quaternionic-finite-slope-families).

See [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Theorem 1 and Hodge–Tate definition, p. 242; proof strategy pp. 243–244; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — §2.4, p. 251; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — §2.4.2, p. 254.

### 4.8 Classical characteristic-zero irreducibility

For a classical cuspidal newform of k≥2, prove absolute irreducibility at every λ. Distinct Hodge–Tate degrees, the algebraic-Hecke-character description of a hypothetical rank-one constituent and the Ramanujan/purity argument exclude a decomposition. This concerns the characteristic-zero global representation; it neither forces a residual representation to be irreducible nor prevents an ordinary decomposition group from preserving a line.

*Needs:* [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); [1.3 Scholl's projector](#13-scholls-projector); [1.4 Rational orbit projector and coefficient descent](#14-rational-orbit-projector-and-coefficient-descent); `AutomorphicGaloisRepresentationsPartII:AG2.P, Finite-coefficient periods, descent and geometric comparison`; [3.13 Geometric characters and algebraic Hecke characters](#313-geometric-characters-and-algebraic-hecke-characters); `WeightsInEtaleCohomology:R34.6, Eigenform purity and the Ramanujan bound`.

See [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Remark, p. 256; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Theorem 3.1(a)–(c), p. 86 (revision of 9 September 2007).

### 4.9 The KW coefficient-prime local forms

Retain p unramified in F, parallel weights and the residual absolute-irreducibility assumptions of the KW application. An unramified local automorphic component gives a crystalline representation, including higher weights. In the weight-two tame-type branch the norm-factor character hypotheses give a potentially Barsotti–Tate representation; retain those character hypotheses separately from residual weight. For an unramified twist of Steinberg in weight two obtain semistability with nonzero N and arithmetic diagonal χ_pγ,γ, Hodge weights 0,1, hence failure of crystallinity. Prove the ordinary inertia characters from the selected unit-root local refinement, and use the weight-two equivalence of R07.4. These conclusions do not identify all higher-weight representations as Barsotti–Tate.

*Needs:* [4.6 Kisin's coefficient-prime theorem](#46-kisins-coefficient-prime-theorem); `AutomorphicGaloisRepresentationsPartII:AG2.P, Finite-coefficient periods, descent and geometric comparison`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem).

See [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — Lemma 7.7, p. 67 (authors' final version); [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — Corollary 7.8(i), p. 67; [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — Corollary 7.8, Steinberg case, p. 68.

The inertia formulas are proved here from the coefficient-prime comparison and the chosen ordinary refinement; they are not supplied by a later ordinary modularity-lifting theorem.


### 4.10 Finite-weight nearly ordinary data

For F totally real of even degree and p odd, fix the compact open U of
Skinner–Wiles, with U_v=GL₂(O_{F_v}) for v|p before imposing the p-power level.
Use the existing cuspidal automorphic space at k_τ≥2 of one parity and the
specified central character. Put µ=max_τ(k_τ)−2 and
v_τ=(µ+2−k_τ)/2, so v_τ≥0, min v_τ=0 and k−2t+2v=µt.
Define `NearlyOrdinaryEigenpacket` by a nonzero simultaneous eigenvector at
U_a=U∩U(p^a), its eigencharacter λ, its chosen local refinements, and unit
eigenvalues of the normalized T₀(v). Record the embeddings and all operator
normalizations. At parallel κ, v=0 and µ=κ−2.

Here write π_SW for the source's representation, rather than silently using
its infinity type for the forward Hecke convention. The weight action in
§3.1, p. 28, gives positive-real central character z↦z^µ: inserting zI into
`j(u,z)^{−k}det(u)^{v+k−t}` gives this exponent. Thus π_SW has type (k,−µ)
and Π=π_SW^∨ has type (k,µ) in this roadmap. Its cohomological representation
is ρ_Π=σ(π_SW); the source's arithmetic representation is ρ_Π^∨.

Use the inverse double-coset action (3.1′), p. 30, and the modified G(U_a)
action, including ∏_{v|p}ω(a_v)^{−µ}. The coordinates of G(U_a) on p-units
are `(a⁻¹d,a)`, §3.2, p. 32. Consequently T_y=(y,1) is represented by
`diag(1,y)` supported at the selected p-place. Its Teichmüller multiplier
is 1 because a=1; multiplying T_y by ω(y)^{−µ} would introduce a spurious
finite character. The central operators still require the modified action.

At a place 𝔭|p put K=F_𝔭 and Σ_𝔭={τ:F↪E_λ inducing 𝔭}; enlarge E_λ to
contain all embeddings. Define the algebraic character
`A_𝔭(x)=∏_{τ∈Σ_𝔭}τ(x)^{−v_τ}` on K×.
Choose ϖ∈F× which is a uniformizer at 𝔭 and a unit at the other p-places.
The source uses the *global* factor
`A_all(ϖ)=∏_ττ(ϖ)^{−v_τ}` in T₀^SW(𝔭).
Put `c_out(ϖ)=∏_{τ∉Σ_𝔭}τ(ϖ)^{−v_τ}`; this is an E_λ-unit, and set
`T₀^loc(ϖ)=c_out(ϖ)⁻¹T₀^SW(𝔭)` and `α_𝔭=λ(T₀^loc(ϖ))`.
Both operators have unit eigenvalues simultaneously. Their eigenvalues need
not be equal. Equivalently T₀^loc uses A_𝔭(ϖ) in place of A_all(ϖ), and can
be defined for any local uniformizer without a global representative.

Prove the following operator-to-character comparison on the chosen good line.
In the principal-series case
`π_SW,𝔭=Ind(η|·|⁻¹/²,ξ|·|⁻¹/²)`, or the special case with inducing
characters `ξ|·|⁻¹/²,ξ|·|¹/²`, put ν=ιξ⁻¹, the selected smooth WD character
of Π_𝔭⊗|·|⁻¹/². Then

`λ(T_y)=ν(y)` for **every** y∈O_K×, and `α_𝔭=ν(ϖ)A_𝔭(ϖ)`.

Derive the first identity from inverse translation on the refined local
principal/special model, with the coordinate computation above; derive the
second from the scaled inverse-coset operator. This is a concrete application
of R16.2's local models, not a hypothesis that a Galois filtration already
exists. The restriction ν|O_K× has finite image, whereas A_𝔭 generally does
not. Define the candidate character by

`δ_𝔭(yϖⁿ)=λ(T_y)A_𝔭(y)α_𝔭ⁿ=ν(yϖⁿ)A_𝔭(yϖⁿ)` for n∈Z.

It has values in O_{E_λ}× and is continuous. Local reciprocity extends it
uniquely to a continuous Galois character η_𝔭 with
`η_𝔭∘rec_geom=δ_𝔭`. This extension uses the profinite completion and
compactness, not an assumed continuous extension of an arbitrary smooth
character with a nonunit uniformizer value. For ϖ′=uϖ, u∈O_K×, prove

`T₀^loc(ϖ′)=A_𝔭(u)T_uT₀^loc(ϖ)`,
`α_𝔭′=λ(T_u)A_𝔭(u)α_𝔭=δ_𝔭(u)α_𝔭`.

These laws make δ_𝔭 independent of the uniformizer. For two admissible global
representatives also change c_out; the corresponding raw source eigenvalues
transform by ν(u)A_all(u), before dividing out the new c_out. Omitting this
unit factor would give an incorrect local character.

The finite-weight interface includes this full locally algebraic character.
Define its ordinary predicate by δ_𝔭|O_K×=1 at every p-place. The source's
condition ξ unramified agrees with that predicate when all local v_τ=0;
outside that range it describes the smooth factor only. A finite character
twist can remove finite unit ramification, but cannot remove nonzero labelled
algebraic exponents. In the parallel-weight range, the finite-character
extension of R17.5 supplies the global twist with the prescribed local
components; its weight, central character and every normalized Hecke value
must be transported. The Galois identification is the comparison target of
§4.11, not part of this data definition.

For light coefficient checks define `nearlyOrdinaryUnitValue νu xu v` over a
field with a finite embedding index as `νu * ∏_τ xu(τ)^{−v(τ)}`. Its local
interpretation requires nonzero embedding values and the finite smooth
character above. It only evaluates the coefficient expression; it does not
construct the local Galois character.

*Needs:* GL2AutomorphicRepresentationsAndTransfer R16.2, cohomological form
spaces and refined principal/special local models with inverse translation;
R17.5, the global finite-character extension with prescribed local components;
the Hecke action and coefficient representations of
HilbertModularVarietiesAndShimuraCurves R18.4; ClassFieldTheory local
reciprocity and profinite completion; [3.11 The representation dictionary as a
theorem](#311-the-representation-dictionary-as-a-theorem).

See [Skinner–Wiles](https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf),
§3.1 pp. 27–28 for the weight/action, (3.1′) and §3.2 p. 30 for inverse
translation and T₀, p. 31 for the selected ξ and good-line classification,
and p. 32 for the unit coordinates. These source formulas supply the
operator comparison above; they do not assert the general-weight Galois
identification proved in the next target.

- `NearlyOrdinaryEigenpacket`: Bundle the eigenvector, refinements, eigencharacter, global/local normalized operators and unit eigenvalues.
- `NearlyOrdinaryEigenpacket.quotientCharacter`: δ_𝔭 on arithmetic reciprocity is the quotient of ρ_Π^∨ by §4.11; its all-unit values are λ(T_y)A_𝔭(y), its uniformizer value is α_𝔭, and its geometric avatar η_𝔭 is the subcharacter of ρ_Π.
- `NearlyOrdinaryEigenpacket.twist`: Transport the weight, central character, all unit values and normalized roots by the specified global character, with the algebraic correction for a norm twist in §4.11.
- `NearlyOrdinaryEigenpacket.isOrdinary`: Require δ_𝔭|O_K×=1 at every p-place.
- `NearlyOrdinaryEigenpacket.changeUniformizer`: Transport the operator and root by δ_𝔭(u), leaving the character unchanged.
- `nearlyOrdinaryUnitValue`: Evaluate the finite factor times the labelled algebraic product; zero exponents return the finite factor, and nonzero exponents retain their labelled embeddings.

**Checks.**

- At parallel κ, v=0 gives the unscaled unit-root operator. T_y has Teichmüller factor 1 even at κ>2; only at κ=2 is the exponent on every modified operator zero.
- A finite ramified character twist of an ordinary eigenpacket remains nearly ordinary, but need not satisfy the unramified ordinary predicate.
- A supersingular good-prime polynomial with both roots of positive valuation gives no unit-root eigenpacket.
- For nonparallel k=(2,4), µ=2 and v=(1,0), the quotient on a principal unit with τ₁(u)=1+p is (1+p)⁻¹ when ν(u)=1. No finite twist can trivialize this on an open unit subgroup.
- For `nearlyOrdinaryUnitValue`, zero v and νu=−1 give −1; for embedding values (4,4) and v=(1,0), νu=1 gives 1/4; on the torsion unit −1 with embedding values (−1,−1) and νu=−1, the same exponents give 1. These detect losing either the algebraic or finite factor. At p=3, 4 is a principal unit.
- In F=Q(√13), p=3 splits and ϖ=4+√13 has norm 3. Choose 𝔭 where √13≡−1, so ϖ is a uniformizer there and a unit at the other 3-place. Put k=4 at 𝔭 and k=2 at the other place, giving v=(0,1). If θ is the other embedding of ϖ, then c_out=θ⁻¹; a raw root β=θ⁻¹ gives local α=1. Equating β with α fails this outside-place correction.
- At p=3, if ν(4)=ζ₃, A_𝔭(4)=1/4 and α=2, changing ϖ to 4ϖ gives α′=ζ₃/2. For x=yϖⁿ the new unit is yu^{−n}, so the new formula gives the same δ_𝔭(x), also for n<0.

### 4.11 The nearly ordinary Hilbert construction

Let p be odd, F totally real of even degree, U⊆GL₂(O_F⊗Ẑ) open compact, n the product of its nonmaximal primes, and π_SW nearly ordinary of parallel κ≥2 with Hecke eigencharacter λ. Attach Skinner–Wiles's continuous irreducible arithmetic representation. It is odd, unramified away from np, with trace λ(T(v)) and determinant Nv·λ(S(v)) at good arithmetic Frobenius, and determinant χ_{π_SW,λ}ε_p. For central x∈Z(U), this is λ^alg(S_x)ε_p(x), with the algebraic central specialization defined below. At each v|p its upper-triangular quotient character ψ₂ has ψ₂(y)=λ(T_y) on local units and ψ₂(ϖ_v)=λ(T₀(v)). The quotient character is the character of the finite-weight eigenpacket of §4.10; its subcharacter is det(V) times its inverse. These formulas are proved as part of this target. A finite character twist makes the relevant form ordinary, giving the nearly ordinary construction from the ordinary one. Under their arithmetic reciprocity and inverse Hecke action the representation is `σ_λ(π_SW)^∨=ρ_{π_SW,λ}⊗ε_ℓ`; retain that twist in every later comparison.

*Needs:* [4.10 Finite-weight nearly ordinary data](#410-finite-weight-nearly-ordinary-data); [3.17 Carayol's geometric Hilbert theorem](#317-carayols-geometric-hilbert-theorem); [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); [3.12 Hilbert Hodge–Tate property](#312-hilbert-hodgetate-property); [4.7 Skinner's full coefficient-prime theorem](#47-skinners-full-coefficient-prime-theorem); FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P7.1–R07.P7.3, R07.3.0–R07.3.3 and R07.4.13, with §0.1’s rank-one formula.

See [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §3.3, (3.2), p. 38 (Numdam PDF page 35; printed page = PDF page + 3); [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §3.3, p. 39; [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §2.1, p. 9, and (3.1′), p. 30.

For the central comparison, retain the difference between the finite-level
modified operator and its Galois character. On a p-unit idele x let
`θ_SW(x)=∏_{v|p}ω(x_v)^{−µ}`, the source's multiplier for its central operator.
Inverse translation gives
`λ(S_x)=θ_SW(x)χ_{π_SW,p}^{sm}(x)⁻¹`, where χ^{sm} is the smooth local
central character transported to E_λ. The algebraic specialization is

`λ^alg(S_x)=λ(S_x)θ_SW(x)⁻¹∏_ττ(x)^{−µ}
           =χ_{π_SW,λ}(rec_arith(x))`.

Thus `det S_SW(rec_arith(x))=λ^alg(S_x)ε_p(rec_arith(x))`.
At κ=2, µ=0 and λ^alg=λ. At κ>2 the raw finite-level λ(S_x) alone cannot
have the determinant's nonzero labelled algebraic degrees. Skinner–Wiles
(3.2), p. 38, writes the determinant as λ(S_x)ε_p; the comparison with its
weight-specialized central character must retain the algebraic correction
above when using the finite-level operators of §3.2. This correction also
follows independently from §3.11's exact determinant, so it does not assume
the local triangular statement to prove that determinant.

**General regular-weight comparison.** For any totally real F, any prime p,
and any cuspidal Π of type (k,µ), k_τ≥2 of one parity, choose a place 𝔭|p
and a principal/special refinement. Its selected smooth character ν is the
line in the full WD parameter of Π_𝔭⊗|·|⁻¹/², with N=0 on that line;
for a special parameter use ker N. Require the locally normalized
`α_𝔭=ν(ϖ)A_𝔭(ϖ)` to be an E_λ-unit. Use the local A_𝔭 and δ_𝔭 of §4.10.
In the Skinner–Wiles range Π=π_SW^∨, its operator comparison supplies exactly
these data. For other F or p, R16.2's same refined local models supply the
inverse unit/coset operators; the local comparison does not require the
even-degree or odd-p hypotheses of their global finite-weight Hecke algebra.
Put V=ρ_{Π,λ}|G_K, D=det V=χ_{Π,λ}ε_p⁻¹, and η=η_𝔭 the continuous
character with geometric reciprocity δ_𝔭=νA_𝔭. Prove a G_K-stable exact sequence

`0 → E_λ(η) → V → E_λ(Dη⁻¹) → 0`.

Duality gives `0 → E_λ(D⁻¹η) → V^∨ → E_λ(η⁻¹) → 0`.
Since rec_arith=rec_geom⁻¹, this arithmetic-dual quotient has value
δ_𝔭(y)=λ(T_y)∏_{τ∈Σ_𝔭}τ(y)^{−v_τ} on every local unit and value α_𝔭
on rec_arith(ϖ). Its labelled degrees in our grading are −v_τ; those of
its subcharacter are −(µ+1−v_τ). In V the degrees are v_τ and µ+1−v_τ.
The representation's determinant recovers the second character, including all
finite and central-character factors. Do not infer a split representation.

The proof has the following exact inputs and intermediate targets.

1. Import the rank-one locally algebraic comparison: η is potentially
   crystalline, has labelled degrees v_τ, and its full WD character in
   geometric convention is ν. On arithmetic units η has value
   ν(y)⁻¹A_𝔭(y)⁻¹. After a finite extension killing finite inertia,
   [Conrad](https://math.stanford.edu/~conrad/papers/locchar.pdf),
   Appendix B, Definition B.1 p. 32, Proposition B.3 pp. 33–34 and
   Proposition B.4 pp. 35–36, identify the degrees and Frobenius.
   In the crystalline case his formula gives
   `φ^{f_K}=δ_𝔭(ϖ)A_𝔭(ϖ)⁻¹=ν(ϖ)`; use norm functoriality and descent
   for finite inertia. This removes the algebraic factor from the WD
   parameter while retaining it in the Galois character.
2. Import [3.12 Hilbert Hodge–Tate property](#312-hilbert-hodgetate-property)
   and [4.7 Skinner's full coefficient-prime theorem](#47-skinners-full-coefficient-prime-theorem).
   They give potential semistability, degrees (v_τ,µ+1−v_τ), and the full
   Frobenius-semisimple WD parameter of Π_K⊗|·|⁻¹/², including N.
   Its selected line is ν, with N=0 on that line; in the special case
   it is ker N. This is a period line, not yet a Galois subrepresentation.
3. Twist W=V⊗η⁻¹. Its degrees are (0,k_τ−1). Over a finite Galois L/K
   making V and η semistable, its selected period line has φ^{f_L}=1,
   N=0 and Newton degree zero. The other Newton slope is positive,
   since weak admissibility of the whole module identifies its total
   Newton degree with the positive sum of the labelled k_τ−1.
   Thus the slope-zero line is unique, lifts from the Frobenius-semisimple
   parameter to the actual period module, and is preserved by descent.
   The monodromy relation also kills N on the minimal-slope line.
4. The ambient filtration has only nonnegative degrees, so the induced
   filtration on that line has nonnegative labelled degrees. Weak
   admissibility gives t_H(line)≤t_N(line)=0; hence every one of those
   degrees is zero. The line with its induced filtration is admissible.
   Use the semistable period functor's exactness and full faithfulness
   to obtain an invariant line in W|G_L. Its period module agrees with
   that of the trivial character. Uniqueness and descent make the line
   G_K-stable, and the full descended WD parameter identifies its
   character with 1, rather than an unspecified finite descent twist.
   Twisting back gives η⊂V.

The generic rank-one admissibility and fully faithful period-functor results
are supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.0–R07.3.3 and R07.4.13, with the coefficient action and finite
Galois descent retained. See
[Colmez–Fontaine](https://webusers.imj-prg.fr/~pierre.colmez/CF.pdf),
§3.4 pp. 21–22 for the subobject inequality, Proposition 4.2 and the
following equivalence p. 23 for the period functor, and Proposition 4.4 p. 24
for rank-one admissibility. For a finite coefficient field use Theorem A
p. 2 and the period equivalence on the underlying Q_p-module, retaining
its commuting E_λ-action. The selected module has slope and filtration zero
on every coefficient factor, so its underlying module is weakly admissible
as well; it is not necessary to identify an E_λ-line with a Q_p-line. The new target here is
their application to the selected modular parameter, not another construction
of the generic period equivalence. This proof uses the full theorem of §4.7;
a residual irreducibility assumption or a Hida-family control theorem is not
an extra hypothesis. Regularity k_τ≥2 and the normalized unit-root condition
are essential.

To transport back to the fixed ρ for the source form, put χ=χ_{π_SW,λ}.
By §3.11, D=χ⁻¹ε_p⁻¹ and the four ordered graded pairs are:

| Representation | Subcharacter | Quotient character |
| --- | --- | --- |
| σ(π_SW)=ρ_Π | η | χ⁻¹ε_p⁻¹η⁻¹ |
| S_SW=σ(π_SW)^∨=ρ_{π_SW}ε_p | χε_pη | η⁻¹ |
| ρ_{π_SW} | χη | ε_p⁻¹η⁻¹ |
| ρ_{π_SW}^∨ | ε_pη | χ⁻¹η⁻¹ |

For any row evaluate its actual Galois characters on the stated reciprocity
map. In particular, the quotient of S_SW on rec_arith has values δ_𝔭;
the quotient of ρ_{π_SW}^∨ has the further factor χ⁻¹∘rec_arith.
The latter two arithmetic representations cannot be identified without
that central correction. On coefficient-prime units
`ε_p(rec_geom(u))=N_{K/Q_p}(u)` and on a uniformizer
`ε_p(rec_geom(ϖ))=N_{K/Q_p}(ϖ)/q_K`.
These follow from ClassFieldTheory's arithmetic Artin normalization by
inversion and norm functoriality, as recorded in TauCetiRoadmap.LocalGaloisGroups
Layer 5. At K=Q_p and ϖ=p the value is 1, not p⁻¹. Use these formulas to
transport every cyclotomic factor in the table.

For a forward form Π of arbitrary type (k,w), let j=(w−µ)/2 and
Π₀=Π⊗|det|^j, of type (k,µ). Obtain its canonical character η₀ as above;
then `ρ_Π=ρ_{Π₀}ε_p^{−j}` and `η=η₀ε_p^{−j}`.
Writing a_τ=v_τ+j=(w−k_τ+2)/2, its geometric values are

`η(rec_geom(u))=ν₀(u)∏_ττ(u)^{−a_τ}`,
`η(rec_geom(ϖ))=α₀(N_{K/Q_p}(ϖ)/q_K)^{−j}`.

The smooth parameter is ν=ν₀|·|^{−j}, so the uniformizer value also equals
ν(ϖ)∏_ττ(ϖ)^{−a_τ}. These identities allow negative j, have the same
change-of-uniformizer law, and preserve unit-valued Galois characters.
The quotient of ρ_Π^∨ is η⁻¹, with these same values under rec_arith;
its subcharacter is (det ρ_Π)⁻¹η. The quotient is unramified exactly when
all local a_τ=0 and the finite unit factor is trivial. Distinct labelled
algebraic characters cannot be cancelled by a finite factor on an open
unit subgroup.

- `nearlyOrdinary_gradedCharacters`: Construct the invariant line and both graded characters of ρ_Π and its arithmetic dual under the stated regular-weight and unit-root hypotheses.
- `nearlyOrdinary_sourceDictionary`: Transport all four pairs by the determinant, central character and cyclotomic twist in the table.
- `nearlyOrdinary_centralCharacter`: Compare the modified finite-level λ(S_x) with λ^alg(S_x), hence with χ_{π_SW,λ} on arithmetic reciprocity, for all central p-units.
- `nearlyOrdinary_normTwist`: Shift each labelled degree by j and transport unit/uniformizer values by ε_p^{−j}.

**Checks.**

- For canonical parallel κ, v=0 and c_out=1. The quotient of S_SW on arithmetic reciprocity has values λ(T_y) and λ(T₀^SW); this is exactly the parallel theorem above. If ν is unramified it is an unramified quotient.
- At nonparallel (2,4), µ=2 and v=(1,0), the two cohomological degree pairs are (1,2) and (0,3). After twisting by η⁻¹ they are (0,1) and (0,3); a selected line with a positive labelled degree violates t_H≤0. On a principal unit with first embedding 4 at p=3 and finite factor 1, the arithmetic quotient value is 1/4, not 1.
- At v=(1,0), the torsion unit u=−1 has A_𝔭(u)=−1. If ν(u)=−1, its quotient value is 1; a formula dropping either factor gives −1. Checking only a sufficiently small principal-unit subgroup misses this finite factor. Changing ϖ to uϖ leaves α unchanged, as δ_𝔭(u)=1.
- For a unit of norm 1 with χ(rec_arith(u))=ζ₃≠1, the quotient of ρ_{π_SW}^∨ is ζ₃⁻¹δ_𝔭(u), whereas that of S_SW is δ_𝔭(u). A central character of order three detects the missing central correction.
- The central specialization has λ^alg(S_x)=λ(S_x) at µ=0. For µ=2, a local principal unit u=1+p, trivial smooth central character and θ_SW(u)=1, its values are λ(S_u)=1 but λ^alg(S_u)=u⁻², and det S_SW on rec_arith(u) is u⁻³. The raw central value would give u⁻¹ and the wrong determinant degree. If instead the smooth central value at u is ζ₃, retain the additional ζ₃⁻¹ in λ^alg and in the determinant; the algebraic correction cannot erase it.
- For canonical classical weight two at Q_p, twist the forward form by |det|⁻¹. Then j=1, η=η₀ε_p⁻¹, the cohomological degrees become (1,2), unit values acquire u⁻¹ and the value at ϖ=p stays α₀. Using p⁻¹ for ε_p at this place gives the wrong uniformizer value.
- In a special parameter with F=diag(1,q_K) after twisting, N=E₁₂ is nonzero and the selected line is ker N. The comparison gives a Galois line, not a split representation. A good supersingular parameter with both normalized roots of positive valuation fails the unit-root hypothesis and supplies no such line.

### 4.12 Nearly ordinary compatibility away from p

For that same Skinner–Wiles representation and every finite v∤p, prove the source's local formula with arithmetic reciprocity and its inverse inducing characters. In geometric reciprocity it becomes `Rec_v(π_v⊗|·|^{1/2})=σ_h(π_v)^∨`. This identifies the full local representation, not just its determinant, and keeps the same twist used by the global nearly ordinary construction.

*Needs:* [4.11 The nearly ordinary Hilbert construction](#411-the-nearly-ordinary-hilbert-construction); [4.3 Hecke versus Langlands normalization](#43-hecke-versus-langlands-normalization); `GL2AutomorphicRepresentationsAndTransfer:R16.3`; [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem).

See [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §3.3, (3.3), p. 39; [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §2.1, p. 9.

### 4.13 Shimura-curve Hyodo–Kato/de Rham multiplicity

In the CDN setup take a local field F/Q_p, a totally real E with E_𝔭=F, the quaternion algebra B̌ ramified at 𝔭 and split at one real place, and its inner form B split at 𝔭 and compact at infinity, with the other prescribed invariants. For a two-dimensional supercuspidal (φ,N,G_F)-module M in ΦN^ϖ, require ϖ trivial on JL(M), choose n with JL(M) trivial on 1+ϖ_D^nO_D, and choose Π̌∈SD_{2,n} with local factor JL(M). The real distinguished factor is holomorphic weight two with trivial central character there, and the other real factors are trivial; a globally trivial central character is not assumed. Extract `Hom_{Ǧ(A_f^p)}(Π_f^p,L⊗H¹_HK(Sh_n)) ≅ JL(M)⊗M`. For K containing E and F through the fixed embeddings the de Rham multiplicity is `JL(M)⊗(K⊗_F M_dR)`. Keep the coefficient completions, comparison map and group actions, and allow the source's globalization twist and extension of L. The étale multiplicity is ρ_Π(−1), hence the CDN ρ_Π is the arithmetic dual in our dictionary. This identifies a multiplicity space rather than the whole cohomology.

*Needs:* [4.7 Skinner's full coefficient-prime theorem](#47-skinners-full-coefficient-prime-theorem); [4.4 All-Hilbert compatibility away from λ](#44-all-hilbert-compatibility-away-from-λ); `HilbertModularVarietiesAndShimuraCurves:R18.4`; `AutomorphicGaloisRepresentationsPartII:AG2.P, Finite-coefficient periods, descent and geometric comparison`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `GL2AutomorphicRepresentationsAndTransfer:§R16.4.4`; [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem).

See [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf) — §5.2.1 Proposition 5.2 and proof, pp. 43–45.

### Examples

A geometric rank-two special WD model at q=3 has F=diag(1,3) and
N=[[0,1],[0,0]]. It satisfies FNF⁻¹=3⁻¹N. The model with the same F and N=0
has the same characteristic polynomial but a different local parameter and
conductor. Frobenius semisimplification retains the nonzero N.

In Saito's geometric range the fixed ρ-convention has total weight w+1, with
kernel weight w and cokernel weight w+2 when N≠0. The all-Hilbert theorem
comes later from Ramanujan and full local compatibility; it does not inherit
the geometric range's even-degree discrete-series hypothesis.

### Dependencies

Layers 1 and 3; WeightsInEtaleCohomology R34.3–R34.6 with the independent geometric scope; the Hilbert/transfer suppliers of Layer 3; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P7.1–R07.P7.3 and R07.3.0–R07.3.3; AutomorphicGaloisRepresentationsPartII AG2.P; LocalGaloisDeformationRings §§3.1–3.7; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4; §§0.3–0.4 and their analytic suppliers.

## Layer 5: Ordinary lattices and crystalline factors

### 5.1 Ordinary refinement and the fixed lattice

For a classical k≥2 newform, p∤N and a_p a λ-adic unit, choose the unit Euler root α. In the arithmetic representation prove `0→V⁺→V→V⁻→0`, with unramified quotient having arithmetic Frobenius α and subcharacter ψχ_p^{k−1}(V⁻)⁻¹. For the fixed stable lattice T define T⁺=T∩V⁺ and T⁻=T/T⁺. Prove saturation, torsion-freeness and rank one of T⁻ and compatibility with flat coefficient extension and the existing rational period line. On the cohomological realisation the ordinary line is instead the unramified subrepresentation at geometric Frobenius; use the annihilator under duality. For every regular Hilbert weight with the normalized unit-root refinement of §4.11 (given by §4.10 in the Skinner–Wiles range), use the rational filtration and exact graded characters proved in §4.11, then recover the other character from the determinant. The nearly ordinary quotient can be ramified; the unramified ordinary interface is its stated specialization.

*Needs:* [1.4 Rational orbit projector and coefficient descent](#14-rational-orbit-projector-and-coefficient-descent); [1.6 Integral newform structures](#16-integral-newform-structures); [4.11 The nearly ordinary Hilbert construction](#411-the-nearly-ordinary-hilbert-construction), including the general regular-weight comparison; `ArithmeticGaloisRepresentations:§§1.1–1.10`.

See [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §3.3 equation (3.2), pp. 38–39; [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §1.2, pp. 8–10; §4.5, pp. 50–51; §§5.3–5.4, pp. 56–59.

The line and quotient formulas are assertions to prove from the classical local
comparison: at good ordinary p the crystalline unit-root quotient is unramified,
and its arithmetic Frobenius value is α. For Hilbert weights, §4.11 identifies the arithmetic-dual quotient on all units
as λ(T_y)A_𝔭(y), and its uniformizer value as the local normalized α_𝔭;
the determinant gives the other character. Use its central/Tate table when
the chosen realization is ρ_{π_SW} instead of ρ_Π. A quotient is unramified only under the
ordinary specialization, not for every nearly ordinary form. Fix the rational
line before intersecting with T. Algebraically `ordinaryLatticePlus` is
`T ⊓ V⁺.restrictScalars O`, while `ordinaryLatticePlusIn` is the inverse image of
V⁺ in the module T; the latter is the submodule used to form the quotient. For a
DVR use a uniformizer ϖ_λ, so the nonsaturated competing submodule is
ϖ_λOe₁; p need not be a uniformizer in a ramified coefficient field.

The general regular-weight line is an output of §4.11's local period
comparison, before any lattice is chosen. For a stable full lattice in its
arithmetic-dual representation, intersection with the proved subline is
saturated, and the quotient is a rank-one lattice in η⁻¹. Its all-unit and
uniformizer characters remain those of §4.11; saturation does not change or
prove those formulas. The principal-unit expression agrees with
[Balasubramanyam–Ghate–Vatsal](https://mathweb.tifr.res.in/~eghate/hilbertCM.pdf),
§3, internal pp. 7–8, after translating their weights and reciprocity. The
all-unit/uniformizer comparison is obtained by the intervening argument of
§4.11, rather than an extension of the parallel Skinner–Wiles theorem.

- `nearlyOrdinaryRefinement_graded` (compatibility): For the chosen regular Hilbert refinement, identify the rational line and both graded lattices with §4.11's characters; its ordinary specialization requires the quotient to be unramified.
- `ordinaryRefinement` (constructor): The unit root α and the specified ordinary filtration proved above of the fixed representation.
- `ordinaryRefinement_quotient` (projection): The unramified quotient character with arithmetic Frob eigenvalue α.
- `ordinaryRefinement_subcharacter` (characterisation): The subcharacter is εχ_p^{k−1} times the inverse quotient character.
- `ordinaryLatticePlus` (constructor): T∩V⁺ as an invariant O_λ-submodule.
- `ordinaryLatticePlus_saturated` (structure): T/T⁺ is torsion-free of rank one.
- `ordinaryRefinement_coeffChange` (functoriality): Flat coefficient extension transports the line and lattice intersection with the appropriate saturation comparison.
- `ordinaryRefinement_period` (compatibility): Use the already specified rational period line under the realisation comparison.
- `ordinaryLatticePlusIn`: The inverse image of V⁺ under T↪V, as an O-submodule of T; its quotient is T/T⁺.
- `ordinaryLatticeQuotient_free_rank_one`: A finite full DVR lattice in a two-dimensional fraction-field space has free rank-one quotient by its intersection with a specified line.

**Checks.**

- `ordinaryRefinement_11a1_three` (computation): X²+X+3 has one 3-adic unit root; choose that root for the unramified quotient.
- `ordinaryRefinement_11a1_two` (non-example): X²+2X+2 at 2 has no unit root; ordinary refinement is not defined.
- In T=O² with V⁺=Ke₁ the intersection is Oe₁; ϖ_λOe₁ has torsion quotient and fails the contract.
- `ordinaryRefinement_determinant` (compatibility): The two characters multiply to εχ_p^{k−1}, including the unramified unit-root factor.
- For V⁺=0 the intersection in V and its inverse image in T are both zero; the quotient is T.
- For V⁺=V the intersection is T and its inverse image is the whole module T; the quotient is zero.
- For a finite full T⊆K² and V⁺=Ke₁ the two intersection presentations agree under T↪V, and the actual quotient has rank one over O.
- At k=(2,4), the normalization has v=(1,0); on principal units the algebraic factor is σ₁(u)⁻¹. For σ₁(u)=1+p and trivial ε₁,p, its value is (1+p)⁻¹, not 1. A formula using only the finite unit character fails this nonparallel control.

### 5.2 Good-prime crystalline and Wach factors

For every classical k≥2 at p∤N, identify D_cris of M_f with the projector factor, with degrees 0,k−1 and φ-polynomial `X²−a_pX+ψ(p)p^{k−1}`. No ordinarity or Fontaine–Laffaille range is required for characteristic-zero crystallinity. For a fixed lattice import its Wach module of §0.5 after declaring the precise dual/Tate twist needed by §0.5's weight convention. The quotient N(T)/π is an integral lattice; only after inverting p does it equal D_cris(T[1/p]). Transport φ and filtration. A chosen semilinear Frobenius matrix changes by `U⁻¹Pφ(U)`, not ordinary conjugation. Match the Euler roots used by regulator applications after a splitting coefficient extension, and require distinct roots before separating eigenlines or dividing by their difference.

*Needs:* [4.5 Geometric coefficient-prime comparison](#45-geometric-coefficient-prime-comparison); [1.6 Integral newform structures](#16-integral-newform-structures); [0.5 Wach modules of crystalline lattices](#05-wach-modules-of-crystalline-lattices); [0.5 Wach modules of crystalline lattices](#05-wach-modules-of-crystalline-lattices).

See [A. J. Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf) — Theorem 1.2.4, p. 2; [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §1.2, pp. 8–10; §5.4, pp. 58–59.

- `eigenformDcris` (constructor): The crystalline factor of the cohomological eigenform realisation.
- `eigenformDcris_charpoly` (characterisation): φ has the Hecke Euler-root polynomial in the stated cohomological convention.
- `eigenformWach` (constructor): The Wach module of §0.5 of the fixed lattice in its declared dual/twist convention.
- `eigenformWach_modParameter` (equivalence): The quotient N(T)/π is an integral O_λ-lattice; after inverting p it identifies with D_cris(T[1/p]), compatibly with φ and the declared filtration convention.
- `eigenformWach_changeBasis` (functoriality): A semilinear matrix changes by U⁻¹Pφ(U).
- `eigenformWach_roots` (compatibility): After coefficient extension the regulator roots coincide with the crystalline roots; separate distinct and repeated roots.

**Checks.**

- `eigenformDcris_11a1_two` (computation): At 2 the polynomial X²+2X+2 has slopes 1/2,1/2 and gives a good nonordinary example.
- `eigenformWach_twist` (compatibility): Dual/Tate-twist transport changes φ eigenvalues and Hodge degrees according to the imported period-functor laws.
- `eigenformWach_basis` (characterisation): Changing the basis preserves the φ-module under semilinear conjugation, not under ordinary matrix conjugation alone.
- `eigenformWach_repeatedRoot` (non-example): For a two-dimensional Jordan φ-module with repeated root, the two formal roots do not provide two independent eigenlines.
- `eigenformWach_integralQuotient` (non-example): For a rank-one trivial crystalline Z_p-lattice, N(T)/π≅Z_p while D_cris(Q_p)≅Q_p. They identify after inverting p, not as integral modules.

### 5.3 Ordinary CM primes split

For a regular cohomological CM form induced from L/F and ordinary at every v|p, prove each such v splits in L and the inducing character has a compatible p-ordinary CM type. For the Hara–Ochiai converse keep its infinity-type/ordinary-CM-type condition; splitting alone is not that iff criterion. Distinct regular-weight local characters are part of the argument. Local induction from an arbitrary index-two subgroup need not be irreducible.

*Needs:* [3.15 The CM predicate](#315-the-cm-predicate); [5.1 Ordinary refinement and the fixed lattice](#51-ordinary-refinement-and-the-fixed-lattice); `GL2AutomorphicRepresentationsAndTransfer:R17.5`; [3.12 Hilbert Hodge–Tate property](#312-hilbert-hodgetate-property).

See [Takashi Hara and Tadashi Ochiai](https://arxiv.org/pdf/1507.07309v2) — Appendix A Proposition A.3 and proof, pp. 70–71; §2.1 (ord); [Samit Dasgupta and Mahesh Kakde](https://math.iisc.ac.in/~maheshkakde/brumerstark.pdf) — Lemma 9.2 proof, p. 67.

### 5.4 Complex conjugation moves the ordinary CM line

For the regular p-ordinary CM form, choose the ordinary line V_{v,f} specified by the ordinary-refinement target. At the split v it is one of the two global G_L-character lines, distinguished by the source's ramified/unramified local characters. Any element of G_F inducing the nontrivial conjugation of L interchanges these lines, so V_{v,f} is not stable under it. Keep k>1 and the distinct-character hypotheses. A freely chosen invariant line when the characters coincide need not have this property.

*Needs:* [5.3 Ordinary CM primes split](#53-ordinary-cm-primes-split); [3.14 Determinant, total oddness and absolute irreducibility](#314-determinant-total-oddness-and-absolute-irreducibility); [5.1 Ordinary refinement and the fixed lattice](#51-ordinary-refinement-and-the-fixed-lattice).

See [Samit Dasgupta and Mahesh Kakde](https://math.iisc.ac.in/~maheshkakde/brumerstark.pdf) — Lemma 9.2 and proof, p. 67.

### 5.5 The endpoint-weight local contract

At a good classical prime with k=p+1, characteristic-zero comparison still gives crystallinity and arithmetic Hodge weights 0,p with the full parameter. The integral Fontaine–Laffaille interval [0,k−1] is outside [0,p−2], so that chosen small-weight integral comparison does not apply. Weight p+1 does not make this representation Barsotti–Tate and does not prescribe a residual ordinary/flat lift from a_p. A weight-two potentially Barsotti–Tate conclusion must specify a different lift, its residual weight/type comparison and every residual-inertia, determinant, modularity and local-type hypothesis. Keep characteristic-zero Hodge type, residual Serre weight and deformation-lift type separate.

*Needs:* [4.5 Geometric coefficient-prime comparison](#45-geometric-coefficient-prime-comparison); [4.9 The KW coefficient-prime local forms](#49-the-kw-coefficient-prime-local-forms); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

See [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — Corollary 7.8, pp. 67–68; [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §1.2, pp. 8–10; §5.4, pp. 58–59.

The assertion of a different weight-two potentially Barsotti–Tate lift is
conditional on an independently specified lift with that exact type. The local
crystalline weight-p+1 condition gives no existence theorem for it. The
optimized theorem in Layer 6 applies only after its own modularity, determinant,
semistable residual-type and quadratic-restriction hypotheses are established;
it cannot supply an unrestricted endpoint lifting criterion.


### Examples

For 11a1 at 3, X²+X+3 has exactly one 3-adic unit root α; the arithmetic
ordinary quotient has Frobenius α. At 2, X²+2X+2 has two slopes 1/2 and no unit
root, while crystallinity remains valid. For T=O² and V⁺=Ke₁, T⁺=Oe₁ and
T/T⁺≅O. Substituting ϖ_λOe₁ produces a quotient with O/ϖ_λ torsion and fails
saturation, also when p is ramified in K.

For the CM form at an ordinary split prime, conjugation exchanges the two
distinct global character lines. At weight p+1 the characteristic-zero
crystalline statement gives degrees 0,p; it provides no Fontaine–Laffaille
comparison in the small range and no automatic weight-two lift.

### Dependencies

Layers 1, 3 and 4; §0.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3–R07.4; algebraic-character induction and the labelled period functors.

## Layer 6: Integral Hecke families and deformation maps

### 6.1 Weight-two Tate-module decomposition

For a weight-two newform f, its modular abelian variety A_f has V_ℓ(A_f) free of rank two over K_f⊗Q_ℓ. Decompose along λ|ℓ and identify each factor with the arithmetic representation of f, giving Q_ℓ-dimension 2[K_f:Q]. This requires the coefficient action, Weil-pairing adjointness and Eichler–Shimura, not just an equality of Hecke traces. The abelian quotient is specific to weight two; it is not a construction for arbitrary higher weight.

Use the imported quotient `A_f=J₁(N)/𝔭_fJ₁(N)`. The λ-factor is
`K_{f,λ}⊗_{K_f⊗Q_ℓ}V_ℓ(A_f)`, and the direct sum of these factors is
an isomorphism of Q_ℓ[G_Q]-modules preserving the K_f-action. For K_f=Q,
A_f is the elliptic curve E_f.

*Needs:* `ModularCurvesPartII:§§16.2–16.3`; `ModularCurvesPartII:§16.4`; `ModularCurvesPartII:§§17.1–17.2`; [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); `ArithmeticGaloisRepresentations:Layer 6`; [4.8 Classical characteristic-zero irreducibility](#48-classical-characteristic-zero-irreducibility); `ModularCurvesPartII:§§13.3–13.6, 14.13–14.15`.

See [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Lemma 1.48, p. 46 (revision of 9 September 2007); [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §3.1, (3.1.1), p. 85; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Theorem 1.41, pp. 42–43, with Lemma 1.38, p. 41.

### 6.2 Residual newform representation

Choose a stable lattice in the arithmetic ρ_{f,λ} and define its semisimplified reduction over κ_λ. Its prime-to-ℓ conductor divides N. It is unramified outside Nℓ, has trace a_p modulo λ and determinant ψ̄χ̄_ℓ^{k−1}, and is independent of the lattice up to isomorphism. In odd residue characteristic it is odd. Prove uniqueness from good characteristic polynomials; full polynomials are required even for semisimple representations in characteristic two. A globally irreducible characteristic-zero representation may have reducible reduction. At weight two with rational coefficients compare it with E_f[ℓ]^{ss}, keeping nonsplit lattice reductions distinct before semisimplification.

For odd ℓ, irreducibility of this residual representation is equivalent to
absolute irreducibility. At every good arithmetic Frobenius p∤Nℓ the full
polynomial is `X²−(a_p mod λ)X+(ψ(p)p^{k−1} mod λ)`; both coefficients
are part of the recognition statement. The identity `det ρ̄(c)=−1` holds
in κ_λ for complex conjugation, including when ℓ=2 and −1=1.

*Needs:* [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); `ArithmeticGaloisRepresentations:§§1.1–1.10`; `ArithmeticGaloisRepresentations:§§5.3–5.7`; [4.8 Classical characteristic-zero irreducibility](#48-classical-characteristic-zero-irreducibility).

See [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §3.1, "Mod ℓ representations", p. 87 (revision of 9 September 2007).

- `residualRep` (data): ρ̄_{f,λ}: G_Q → GL_2(k_λ), semisimple, defined up to isomorphism.
- `residualRep_trace` (characterisation): tr ρ̄(Frob_p) = a_p mod λ for p ∤ Nℓ.
- `residualRep_det` (simp): det ρ̄ = ψ̄ χ̄_ℓ^{k−1}.
- `residualRep_lattice_indep` (extensionality): Any two stable lattices give isomorphic semisimplified reductions.
- `residualRep_unique_charpoly` (extensionality): A semisimple representation with the same good-prime characteristic polynomials is isomorphic to residualRep; retain determinant information also in characteristic two.

**Checks.**

- `residualRep_11a1_five` (computation): For 11a1 and λ = 5, ρ̄ ≅ 1 ⊕ χ̄_5.
- `residualRep_det_weight_two` (degenerate): For k = 2 and ψ = 1, det ρ̄ = χ̄_ℓ.
- `residualRep_eq_torsion` (compatibility): For K_f = Q, ρ̄_{f,ℓ} ≅ E_f[ℓ]^{ss} as G_Q-modules.
- `residualRep_not_reduction_without_ss` (non-example): For 11a1, λ = 5, different lattices give non-isomorphic reductions before semisimplification: the Tate modules of the isogenous curves 11a3 and 11a2 give the non-split (1 ∗; 0 χ̄_5) and (χ̄_5 ∗; 0 1), and that of 11a1 itself gives the split 1 ⊕ χ̄_5.
- `residualRep_trace_char_two` (non-example): Over F₄, let χ:C₃→F₄× have order three. The semisimple representations 1⊕1 and χ⊕χ both have identically zero trace, but determinant characters 1 and χ² differ. Full characteristic polynomials distinguish them.

### 6.3 The full weight-two Hecke algebra

For Γ_H(N), take T_Z generated by all T_n and diamond operators, and extend coefficients to R. It is finite free and acts faithfully on the weight-two space and the Jacobian. V_ℓ(J_Γ) is free of rank two over the full rational Hecke algebra; “full” retains generalized oldform eigenspaces and possible nilpotents. Its arithmetic Galois action has good polynomial `X²−T_pX+p〈p〉`. Field factors give characteristic-zero representations, while for odd ℓ reduction gives a semisimple representation depending only on the maximal ideal. A newform factor agrees with the previously constructed representation. Empty cusp spaces give the zero ring, not a rank-two representation over an invented coefficient field.

For an old eigenform the field-factor representation is the scalar extension
of the representation of its associated newform. Thus passing to an old level
does not construct a new Galois representation unrelated to that newform.

*Needs:* [1.1 Coefficient Eichler–Shimura](#11-coefficient-eichlershimura); [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); [6.1 Weight-two Tate-module decomposition](#61-weight-two-tate-module-decomposition); `ModularCurvesPartII:§§13.3–13.6, 14.13–14.15`; `ArithmeticGaloisRepresentations:Layer 6`; `ArithmeticGaloisRepresentations:§§1.1–1.10`; `AlgebraicModularFormsAndSerreWeights:R15.2`.

See [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.1, p. 107 (revision of 9 September 2007); [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §1.6, Lemma 1.39, p. 42; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.1, "Associated Galois representations", p. 109; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.1, "The structure of TK", p. 110.

- `fullHeckeAlgebra` (data): 𝕋_R = 𝕋_ℤ ⊗ R for Γ_H(N) in weight two, generated by the T_n and ⟨d⟩.
- `fullHeckeAlgebra_free` (characterisation): 𝕋_R is finite free over R and acts faithfully on S₂(Γ, R).
- `tateModule_free_rank_two` (characterisation): T_ℓ(J_Γ) ⊗ ℚ_ℓ is free of rank 2 over 𝕋_{ℚ_ℓ}.
- `heckeRep` (constructor): ρ_𝔭 : G_ℚ → GL₂(𝕋_K/𝔭) for a maximal ideal 𝔭 of 𝕋_K.
- `heckeRep_charpoly` (characterisation): For p ∤ Nℓ, the characteristic polynomial of ρ_𝔭(Frob_p) is X² − T_pX + p⟨p⟩ mod 𝔭.
- `residualHeckeRep` (constructor): For ℓ odd, ρ_𝔪 : G_ℚ → GL₂(𝕋_𝒪/𝔪), semisimple, depending only on 𝔪.
- `heckeRep_newform` (compatibility): If 𝔭 corresponds to a newform g, 𝕋_K/𝔭 ≅ K′_g and ρ_𝔭 ≅ ρ_g.

**Checks.**

- `fullHeckeAlgebra_level_eleven` (computation): For Γ₀(11) and ℓ = 5: 𝕋_ℤ = ℤ, 𝔪 = (5) and ρ_𝔪 ≅ 1 ⊕ χ̄₅.
- `fullHeckeAlgebra_not_reduced_level_88` (non-example): For Γ₀(88), T₂ on the old space of 11a1 generates K[u]/(u²(u² + 2u + 2)), in which u(u² + 2u + 2) is a nonzero nilpotent.
- `fullHeckeAlgebra_genus_zero` (degenerate): For Γ₀(N) with N ≤ 10, S₂(Γ₀(N)) = 0, so 𝕋_ℤ = 0 and there are no maximal ideals.
- `heckeRep_newform_compat` (compatibility): For a newform g of level N, ρ_𝔭 agrees with [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation).

### 6.4 Classical conductors and bad Euler factors

For the arithmetic representation of a classical k≥2 newform of level N, the Artin conductor away from ℓ is the prime-to-ℓ part of N. At p≠ℓ with p∥N and p∤cond ψ, its local matrix is an extension with diagonal χ_uχ_ℓ,χ_u, where χ_u is unramified with arithmetic Frobenius a_p and the extension has nonzero monodromy. If p∥N and p|cond ψ, the local representation is `χ_u⁻¹χ_ℓ^{k−1}ψ′ ⊕ χ_u`, where ψ′ is the Galois character of ψ. On the inertia invariants of the cohomological dual, geometric Frobenius gives Euler factors `(1−a_pp⁻ˢ+ψ(p)p^{k−1−2s})⁻¹` for p∤N and `(1−a_pp⁻ˢ)⁻¹` for p|N. At a Steinberg place the arithmetic representation's own invariant line instead has arithmetic Frobenius a_pp. For rational weight two identify the associated elliptic curve's conductor N and L-function with those of f.

*Needs:* [4.3 Hecke versus Langlands normalization](#43-hecke-versus-langlands-normalization); [3.17 Carayol's geometric Hilbert theorem](#317-carayols-geometric-hilbert-theorem); [6.1 Weight-two Tate-module decomposition](#61-weight-two-tate-module-decomposition); `GL2AutomorphicRepresentationsAndTransfer:R16.3`; `ArithmeticGaloisRepresentations:Layer 6`; [4.4 All-Hilbert compatibility away from λ](#44-all-hilbert-compatibility-away-from-λ).

See [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Theorem 3.1(d), p. 86 (revision of 9 September 2007); [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Theorem 3.1(e), p. 86; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.8, Corollaire, p. 411 (transcribed from the page image).

### 6.5 Nonempty optimized weight-two eigensystems

Let ℓ be odd, κ a finite field of characteristic ℓ, and let ρ̄:G_Q→GL₂(κ) be
continuous, absolutely irreducible and modular. For ℓ=3 also require absolute
irreducibility on G_{Q(√−3)}. Define
δ(ρ̄) by the inertia cases in DDT §3.2, immediately before Theorem 3.15,
pp. 90–91. Prove existence of a weight-two newform f with
N_f=N(ρ̄)ℓ^{δ(ρ̄)}, residual realization ρ̄ after coefficient extension, and
nebentypus of order prime to ℓ. This is [Darmon–Diamond–Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf),
Theorem 3.15, p. 91. Its proof invokes Diamond's level optimization; formalize
the particular weight-two optimization needed here, using the local newform and
degeneracy-map hypotheses of that proof. This target does not assert unrestricted
Serre weight optimization.

In the semistable type-Σ situation of §6.6, det ρ̄=χ̄_ℓ and the prime-to-ℓ-order
nebentypus reduces to 1. Injectivity of reduction on such roots of unity makes
ψ_f=1. The semistable inertia cases give δ=0 in the good case and δ=1 otherwise.
The type-Σ level bound then includes this f for every allowed Σ, so its product
of coefficient rings is nonempty. Keep the auxiliary quadratic restriction
hypothesis at ℓ=3; the finite-group argument deriving it from DDT's semistable
hypotheses is the exercise following Proposition 2.11, p. 51, and needs an
explicit proof rather than an appeal to oddness alone.

*Needs:* Layer 6's residual representation; AlgebraicModularFormsAndSerreWeights
R15.5, modular residual eigensystems and eigenvalue lifting; TauCetiRoadmap.ModularForms
Layer 4, newforms and degeneracy maps; FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.3–R07.4, the named good/ordinary/semistable residual inertia cases of R07.5;
ArithmeticGaloisRepresentations Layer 4, finite-image restriction and induction.

- `optimizedWeightTwo_exists`: Return the newform, coefficient embedding, exact optimized level and residual isomorphism.
- `optimizedWeightTwo_trivialCharacter`: Under det ρ̄=χ̄_ℓ, reduce and identify the prime-to-ℓ-order nebentypus as 1.
- `typeSigma_eigensystems_nonempty`: Insert the optimized form into the specified type-Σ index set.

**Checks.**

- For 11a1 at ℓ=7, the Frobenius polynomial at 2 is X²+2X+2 with nonsquare discriminant 3 modulo 7, so the residual representation is irreducible and oddness makes it absolutely irreducible. Good reduction at 7 gives δ=0 and the level bound includes level 11. At ℓ=5 this example is reducible and fails the hypotheses.
- At ℓ=3 retain the quadratic restriction hypothesis; residual irreducibility by itself is not the stated theorem.
- Without det ρ̄=χ̄_ℓ, the theorem returns a prime-to-ℓ-order character and does not force trivial nebentypus.

### 6.6 Classical type-Σ Hecke representation

Let ℓ be odd, K/Q_ℓ finite, O its integers and κ its residue field. Let ρ̄:G_Q→GL₂(κ) be continuous, irreducible and modular, with det ρ̄=χ̄_ℓ, semistable at ℓ, and #ρ̄(I_p) dividing ℓ for p≠ℓ. These hypotheses give absolute irreducibility on G_L for `L=Q(√((-1)^{(ℓ−1)/2}ℓ))`. Choose a finite Σ in the allowed set: p=ℓ is allowed only if ρ̄ is good and ordinary there, and p≠ℓ only if ρ̄ is unramified there. The optimized newforms have weight two, trivial character, residual representation ρ̄ after coefficient extension, and level dividing `ℓ^δ N(ρ̄)∏_{p∈Σ\{ℓ}}p^{dim ρ̄^{I_p}}`, with ℓ²∤N_f. Here δ=0 if ρ̄ is good at ℓ and ℓ∉Σ, and δ=1 otherwise; The optimized weight-two theorem supplies nonemptiness. The O-algebra T_Σ generated by T_p for p∉Σ, p∤ℓN(ρ̄), inside the product of coefficient integer rings is reduced, local, complete, Noetherian, finite free and has residue field κ. Construct its arithmetic representation, unramified with trace T_p at those good primes, lifting ρ̄ with type Σ, and the unique surjection R_Σ↠T_Σ carrying the universal lift to it. Enlargement Σ⊆Σ′ gives T_Σ′↠T_Σ; extension K⊆K′ gives T_Σ⊗_O O_{K′}; projection to an eigenform factor gives its representation.

*Needs:* [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); [6.2 Residual newform representation](#62-residual-newform-representation); [6.3 The full weight-two Hecke algebra](#63-the-full-weight-two-hecke-algebra); [6.4 Classical conductors and bad Euler factors](#64-classical-conductors-and-bad-euler-factors); [4.5 Geometric coefficient-prime comparison](#45-geometric-coefficient-prime-comparison); `GlobalGaloisDeformations:R04.3`; [6.5 Nonempty optimized weight-two eigensystems](#65-nonempty-optimized-weight-two-eigensystems).

See [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §3.3, p. 93; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §3.3, Lemma 3.26, p. 94; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §3.3, Lemma 3.27, p. 94; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §3.3, proof of Lemma 3.27, p. 95.

### 6.7 The specified reduced localization

At `N_Σ=ℓ^δ∏_{p|N(ρ̄)}p∏_{p∈Σ\{ℓ}}p²`, modify each optimized newform's old coefficients by a_p(g)=a_p(f) if p∤N_Σ/N_f, by zero at p≠ℓ dividing N_Σ/N_f, and at ℓ by the unit root of `X²−a_ℓ(f)X+ℓ` when ℓ|N_Σ/N_f. The common residual eigenform has a_p=tr(Frob_p on ρ̄'s I_p-coinvariants) for p=ℓ or p∉Σ and a_p=0 otherwise. It defines m in the full Hecke algebra, and the resulting localization is T_Σ≅T_m. This particular T_m is reduced: over a sufficiently large K it is the product of the optimized newform fields, with T_p=0 at p∈Σ\{ℓ} and the unit-root choice at ℓ∈Σ. At p|N(ρ̄)ℓ^δ the arithmetic Frobenius on the representation's inertia coinvariants is T_p. This reduced statement depends on the prescribed Σ and residual localization; a full old Hecke algebra at an unrelated level may contain nilpotents.

Retain all hypotheses of the classical type-Σ Hecke-representation theorem
of §6.6, including odd ℓ, modular irreducible ρ̄ with cyclotomic determinant,
semistability at ℓ, the inertia-order condition away from ℓ and the allowed
set Σ. These hypotheses are part of the reduced-localization theorem.

*Needs:* [6.6 Classical type-Σ Hecke representation](#66-classical-type-σ-hecke-representation); [6.3 The full weight-two Hecke algebra](#63-the-full-weight-two-hecke-algebra); [6.4 Classical conductors and bad Euler factors](#64-classical-conductors-and-bad-euler-factors); [4.5 Geometric coefficient-prime comparison](#45-geometric-coefficient-prime-comparison); `AlgebraicModularFormsAndSerreWeights:R15.2`; TauCetiRoadmap.ModularForms, layer 4 eigenforms newforms primitive forms the conductor.

See [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.2, p. 112; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.2, Lemma 4.6, p. 112; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.2, Proposition 4.7, p. 113; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.1, Lemma 4.4, p. 111.

### 6.8 The geometric Hecke determinant

Let O be a complete DVR and T_m a completed local finite O-flat Hecke algebra, including possible nilpotents. From the actual cohomology multiplicity construct a faithful generic rank-two T_m[1/ϖ_λ]-module with commuting continuous G_{F,S}-action. Descend its degree-two determinant law to all of T_m, with good geometric coefficients T_v,NvS_v, and prove continuity and compatibility with every finite quotient and coefficient change. O-flatness makes T_m→T_m[1/ϖ_λ] injective even with nilpotents. In weight two this module is H¹, dual to DDT's Tate module; its residual law is the dual of the arithmetic residual law. Use the full generalized oldform eigenspaces. Reduced eigenform points cannot supply the nilpotent coefficients; torsion/non-flat cohomological determinant construction is not implied by this flat-family theorem.

*Needs:* [1.4 Rational orbit projector and coefficient descent](#14-rational-orbit-projector-and-coefficient-descent); [3.1 The quaternionic multiplicity space](#31-the-quaternionic-multiplicity-space); [6.3 The full weight-two Hecke algebra](#63-the-full-weight-two-hecke-algebra); `IntegralHeckeAndGaloisDeterminants:IHG.4`; `ArithmeticGaloisRepresentations:Layer 5`; `HilbertModularVarietiesAndShimuraCurves:R18.4`.

See [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.1, the structure of the full Hecke algebra, pp. 109–110, and Lemmas 1.37–1.39; [Mark Kisin](https://abel.math.harvard.edu/~kisin/dvifiles/def.dvi) — Theorem 4.3 proof, author-copy pp. 32–33; [Gaetan Chenevier](https://arxiv.org/pdf/0809.0415v2) — §§1.1–1.5, pp. 7–8; §1.10, p. 12.

For descent use the whole-generic-algebra coefficient criterion of
TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §4.1, including
`Determinant.existsUnique_isCoefficientChange_of_compact` when its compact
coefficient hypotheses apply, and the integral generic-fibre criterion when
the source is T_m[1/ϖ_λ]. Check every group-algebra polynomial coefficient, not
only trace and determinant of single Frobenius matrices. Degree two's mixed
coefficient is `tr(A)tr(B)−tr(AB)`, a division-free identity valid also in
characteristic two. Integral topology and coefficient injectivity must be proved
for the actual geometric multiplicity module before invoking the supplier.


- `geometricHeckeDeterminant` (constructor): The integral degree-two law from the actual geometric generic rank-two Hecke family.
- `geometricHeckeDeterminant_goodFrob` (simp): Its characteristic polynomial at good geometric Frobenius has coefficients T_v,Nv S_v.
- `geometricHeckeDeterminant_continuous` (structure): Compatible continuous laws over all finite quotients T_m/m^n.
- `geometricHeckeDeterminant_coeffChange` (functoriality): Coefficient quotient/extension commutes with the geometric determinant.
- `geometricHeckeDeterminant_residual` (compatibility): Reduction identifies with det ρ̄ of the residual eigensystem, ρ̄ being taken in the geometric convention (the dual of the arithmetic residual representation).
- `geometricHeckeDeterminant_wholeRing` (characterisation): All identities hold over T_m, including its nilpotents, rather than only T_m,red.

**Checks.**

- `geometricHeckeDeterminant_dualNumbers` (non-example): Over A=k[ε]/ε², diag(1+ε,1) and identity have the same reduced point but different determinant at the generator of an infinite cyclic group.
- `geometricHeckeDeterminant_finiteQuotients` (compatibility): Reduction from T_m/m^{n+1} to T_m/m^n agrees with the n-th law.
- `geometricHeckeDeterminant_characteristicTwo` (computation): The cross coefficient tr(g)tr(h)−tr(gh) is integral in characteristic two; no 1/2 formula is used.
- `geometricHeckeDeterminant_oldspace` (computation): Retain the nonzero nilpotent u(u²+2u+2) in the level-88 old Hecke factor instead of replacing that factor by its reduced quotient.

### 6.9 From a determinant law to a Hecke representation

Let T be complete local and let D be a continuous degree-two determinant over its entire group algebra. Suppose its residual law is split and comes from a specified absolutely irreducible rank-two representation over the finite residue field. Import henselian Cayley–Hamilton reconstruction to obtain a continuous representation into GL₂(T), unique up to conjugacy and up to strict equivalence with fixed residual identification. The residue field need not be algebraically closed. Specialize through all coefficient quotients, including nilpotent ones. The good geometric polynomial is `X²−T_vX+Nv S_v`; take the arithmetic dual before a map to an arithmetic universal deformation problem.

*Needs:* `IntegralHeckeAndGaloisDeterminants:§1.3`; [6.8 The geometric Hecke determinant](#68-the-geometric-hecke-determinant); [6.2 Residual newform representation](#62-residual-newform-representation).

See [Gaetan Chenevier](https://arxiv.org/pdf/0809.0415v2) — Theorem 2.22(i), printed p. 34; split residual determinant definitions in §2.18–2.22.

The generic theorem is the existing
`Determinant.exists_ofMatrix_eq_of_henselian` of
TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §1.3. This target specializes
it to the actual geometric law and its specified residual identification,
then proves the good-polynomial and arithmetic-dual comparison required by the
Hecke/deformation consumer. The generic Cayley–Hamilton quotient, matrix-unit
construction and GMA theory remain with that supplier.


### 6.10 Quaternionic Hecke-algebra representations

Use the Khare–Wintenberger setting: F totally real of even degree, p unramified in F, D definite at infinity and ramified at a finite even-cardinality set Σ, forms S_{k,ψ}(U,O), and the Hecke algebra generated outside a bad set S. Take k≥2 parallel, k=2 if p=2; exclude Σ∩{v|p} if k>2. Choose a sufficiently large p-adic coefficient field containing the embeddings of F, splitting D at p, and a coefficient action with central restriction ψ⁻¹ and ψ on sufficiently small p-units equal to the norm power 2−k. For noncompact U at p=2 specify the extension of the weight-two trivial action from the maximal compact subgroup. S includes infinity, p, Σ, nonmaximal level and nontrivial coefficient action. At a non-Eisenstein maximal ideal, whose residual representation is absolutely irreducible, construct the arithmetic representation over the completed local Hecke algebra, unramified outside S with good polynomial `X²−T_vX+Nvψ(ϖ_v)`. Identify every eigenform specialization and construct the fixed-determinant deformation map; additional local conditions must be named individually.

The level `U=∏_v U_v` is open and compact modulo the centre in
`(D⊗_F A_F^∞)×`, and ψ is an O-valued character of
`F× ∖ (A_F^∞)×`. The representation is unique up to conjugacy, or up to
strict equivalence once its residual identification is fixed.

*Needs:* [6.9 From a determinant law to a Hecke representation](#69-from-a-determinant-law-to-a-hecke-representation); `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `IntegralHeckeAndGaloisDeterminants:IHG.1`; [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); `ArithmeticGaloisRepresentations:§§1.1–1.10`; `IntegralHeckeAndGaloisDeterminants:IHG.4`; `LocalGaloisDeformationRings:§F.2.5`; `LocalGaloisDeformationRings:§F.2.9`; `GlobalGaloisDeformations:R04.3`; [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem).

See [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — §9.1.1, p. 80 (authors' final version, 30 May 2009); [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — §9.1.1, p. 80.

### 6.11 A fixed character at quaternionic ramification places

Take the quaternionic Hecke setting of Layer 6: F totally real of even degree, p unramified in F, D definite with finite ramification Σ of even cardinality, parallel k≥2 (k=2 if p=2), and Σ disjoint from p when k>2, with the specified ψ-coefficient action. At its non-Eisenstein maximal ideal take U_v=O_{D_v}× for v∈Σ if p>2, and U_v=D_v× if p=2. For p>2 and v∈Σ away from p, impose `Nv≢−1 mod p`, or require that ρ̄_m|G_{F_v} is not a direct sum of two unramified characters. Then one unramified γ_v, independent of the eigenform in the localization, satisfies γ_v²=ψ_v and gives arithmetic local form `(χ_pγ_v,*;0,γ_v)`. In the fixed cohomological convention the diagonal characters are γ_v⁻¹ and γ_v⁻¹χ_p⁻¹. Read γ_v at arithmetic Frobenius from right translation by a quaternion uniformiser; inverse translation gives its inverse. If v|p, only the allowed weight-two/discrete-series branch supplies the comparison. At `Nv≡−1 mod p` with an unramified split residual representation the two signs can agree residually: a fixed sign cannot be inferred from the original localization. An integral family needs a finite-projective invariant line in addition to these eigenform identities.

*Needs:* [4.3 Hecke versus Langlands normalization](#43-hecke-versus-langlands-normalization); `GL2AutomorphicRepresentationsAndTransfer:R17.3`; [6.4 Classical conductors and bad Euler factors](#64-classical-conductors-and-bad-euler-factors); [6.10 Quaternionic Hecke-algebra representations](#610-quaternionic-hecke-algebra-representations); [4.5 Geometric coefficient-prime comparison](#45-geometric-coefficient-prime-comparison); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem).

See [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — Lemma 7.2 and its proof, pp. 60–61 (authors' final version); [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — Remark after Lemma 7.2, p. 61.

### 6.12 Local conditions on the entire Hecke family

For the reconstructed representation with specified absolutely irreducible residual object, verify determinant and ramification conditions over T_m and each finite quotient. For each chosen local deformation functor show factorization through its representing quotient: fixed determinant, minimal/unramified, ordinary with a chosen saturated flag, or potentially semistable with specified Hodge/inertial type. Combine these to construct the global universal deformation-ring map. Vanishing at characteristic-zero field points tests only the reduced generic fibre; for O-flat T_m, use the whole generic algebra, including nilpotents, before descending a defining ideal. Ordinary/flat conditions on torsion quotients require their exact functor argument. N≠0 is not a substitute for a deformation condition at every Artinian point, and Artinian Hecke quotients do not automatically embed into products of eigenform field quotients. For the particular reduced T_Σ, the quotients by T_Σ∩∏_f λ_f^n are cofinal and embed in products of eigenform quotients; that argument is not available for a nilpotent family.

*Needs:* [6.8 The geometric Hecke determinant](#68-the-geometric-hecke-determinant); [6.9 From a determinant law to a Hecke representation](#69-from-a-determinant-law-to-a-hecke-representation); [5.1 Ordinary refinement and the fixed lattice](#51-ordinary-refinement-and-the-fixed-lattice); [4.6 Kisin's coefficient-prime theorem](#46-kisins-coefficient-prime-theorem); `GlobalGaloisDeformations:R04.3`; `LocalGaloisDeformationRings:§§3.1–3.7`.

See [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Lemma 3.27 and proof, pp. 94–95; [Mark Kisin](https://abel.math.harvard.edu/~kisin/dvifiles/def.dvi) — Theorem 2.5.5, author-copy pp. 19–20; Theorem 2.7.6, author-copy p. 23; §4.3, author-copy pp. 32–33.

### Examples

On the 11a1 old space at level 88, the T₂ factor has relation
u²(u²+2u+2)=0. The nonzero class u(u²+2u+2) has square zero. Thus an integral
Hecke-family statement reconstructed from reduced field points loses data.
Likewise over k[ε]/ε² the matrix diag(1+ε,1) has determinant 1+ε, invisible in
the residual field.

The type-Σ example with residual 57B mod 3 and Σ=∅ has coefficient ring
{(x,y)∈Z₃²:x≡y mod 3}. It is local and reduced, but is not a product of
coefficient fields. Its particular finite congruence quotients embed in
products of eigenform quotients; an arbitrary Artinian Hecke quotient need not.

### Dependencies

Layers 1, 3, 4 and 5; ModularCurvesPartII Layers 13–17; TauCetiRoadmap.ModularForms; AlgebraicModularFormsAndSerreWeights R15.2, R15.5; HilbertModularVarietiesAndShimuraCurves R18.4; TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants §1.3 and §4.1; LocalGaloisDeformationRings §§3.1–3.7 and GlobalGaloisDeformations R04.3.

## Layer 7: Compatible systems and large images

### 7.1 The compatible-system carrier and operations

Define `CompatibleSystemData` over a number field F and coefficient number
field E with rank n, a finite set S of finite places of F, a monic degree-n
polynomial P_v∈E[X] for every v∉S, a continuous semisimple E_λ-representation
for every finite λ of E, and a labelled Hodge multiset H_τ of size n. The carrier
records these data separately from its compatibility predicates. For rank two
over Q this is the five-tuple of [Dieulefait–Pacetti](https://arxiv.org/pdf/2108.07577v2),
Definition 1.10, pp. 6–7; labelled multisets extend its parallel {0,k−1} field
to the Hilbert application.

Define `IsWeaklyCompatible` by good-place unramifiedness and the polynomial
identity for v∉S, v∤ℓ_λ, together with de Rhamness at every v|ℓ_λ, the specified
labelled degrees, and crystallinity at v∉S dividing ℓ_λ. Define
`IsStrictlyCompatible` by weak compatibility and a coefficient-field-independent
Frobenius-semisimple WD parameter at every finite v, with its monodromy operator
retained, comparing D_pst when v|ℓ_λ. The parameter may be specified over Ē with
its field of definition; an E-rational isomorphism class need not have a model
over E. Enlarge E once when a model is needed. Semisimplifying the entire WD
representation would incorrectly discard Steinberg monodromy.

For rank two define `IsAlmostStrictlyCompatible` by weak compatibility and a
common WD parameter, imposing the strict comparison at every pair (v,λ) except
when v|ℓ_λ, the global residual representation at λ is reducible, and either
ℓ_λ=2 or the common WD parameter at v is ramified. Thus at an odd unramified
coefficient prime comparison is still required. For F=Q this is exactly the
exception of Definition 1.10; the displayed pairwise condition defines its
extension to a general F. Record the omitted pairs; no existence theorem for
almost-strict systems over general F is asserted by this definition. Strict
compatibility implies almost strict, which implies weak.

Give coefficient extension, direct sum, tensor product, dual, algebraic-character
twist, finite base restriction and coefficient conjugation. Polynomials are
computed from roots or exterior powers without choosing an ordering; dual roots
are inverse roots, and ε_ℓ^m twists geometric roots by q_v^{−m}. Hodge degrees
negate under duality, add under tensor product and shift by −m under ε_ℓ^m.
Pullback to F′ uses the appropriate residue-degree power of Frobenius and base
change of the local WD parameter; retain finite ramification in the new S.
Prove preservation of weak and strict compatibility by these operations, with
the new rank, Hodge multisets and bad set. Character twists use a compatible
rank-one algebraic-character family, and its ramified places enter S.
Almost-strict compatibility is a rank-two predicate: direct sum or tensor
product of two rank-two systems has rank four and is outside its domain.
For operations whose output still has rank two, prove almost-strict
compatibility only when each required output pair is inherited from a required
input comparison, or its comparison is supplied separately. In particular,
finite restriction or a ramified character twist can turn a ramified common
parameter into an unramified one at an odd coefficient prime with reducible
residual representation; the formerly omitted comparison is then required.
Coefficient extension, duality and conjugation retain the omitted-pair
bookkeeping. No potential modularity theorem is used to define the carrier or
any operation.

*Needs:* ArithmeticGaloisRepresentations Layers 1–2, continuous semisimple
carriers, local WD functors and their tensor/dual laws; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P7.1–R07.P7.3,
labelled period functors; AutomorphicGaloisRepresentationsPartII AG2.0,
algebraic-character avatars; Layer 3's geometric-character theorem.

- `CompatibleSystemData`: The common field, polynomials, local members, exceptional places and labelled degrees.
- `CompatibleSystemData.IsWeaklyCompatible`, `.IsAlmostStrictlyCompatible`, `.IsStrictlyCompatible`: The separate predicates with the coefficient-prime clauses above.
- `CompatibleSystemData.coefficientExtension`, `.directSum`, `.dual`, `.twist`, `.tensor`, `.restrict`, `.conjugate`: Transport the data, weak compatibility and strict compatibility with the exact polynomial and labelled-degree formulas.
- `CompatibleSystemData.almostStrict_transport`: For a rank-two output, require comparisons at every output pair not covered by a required input comparison; an omitted input pair alone supplies no comparison.
- `CompatibleSystemData.strict_implies_almostStrict`, `.almostStrict_implies_weak`: Preserve all weaker clauses without asserting their converses.

**Checks.**

- The trivial rank-one family has P_v=X−1, degree 0, N=0 everywhere and satisfies the strict predicate.
- The classical arithmetic cyclotomic family, read at geometric Frobenius, has P_v=X−q_v⁻¹ and degree −1; its dual has P_v=X−q_v and degree 1.
- A weight-two Steinberg member has N≠0; replacing its WD module by the direct sum of its two characters fails strict compatibility although the Frobenius polynomial is unchanged.
- An arbitrary list of semisimple members with unrelated good polynomials inhabits the data carrier but fails weak compatibility.
- At a coefficient prime with reducible residual representation, the almost-strict exception does not authorize dropping the de Rham or good-prime crystalline clauses.
- The direct sum and tensor product of two rank-two systems have rank four; neither is an instance of the rank-two almost-strict predicate.
- At an odd coefficient prime with reducible residual representation, restrict a finite ramified scalar WD character to an extension that kills it, or twist by its inverse. The resulting unramified common parameter requires a coefficient-prime comparison that the original almost-strict hypothesis could omit.

### 7.2 Purity of the entire family

For the unrestricted Hilbert representation, the Frobenius-semisimple local parameter at every finite place is pure of weight w+1, including D_pst at the coefficient prime. Combine Ramanujan–Petersson with full local–global compatibility on both sides of the coefficient characteristic. If N=0 all eigenvalues have the weight w+1. If N≠0, the monodromy kernel and cokernel have weights w and w+2. Distinguish this theorem from the narrower Saito geometric weight input: it does not acquire that input's degree or discrete-series hypotheses.

*Needs:* [4.4 All-Hilbert compatibility away from λ](#44-all-hilbert-compatibility-away-from-λ); [4.7 Skinner's full coefficient-prime theorem](#47-skinners-full-coefficient-prime-theorem); [4.2 Hilbert Ramanujan–Petersson](#42-hilbert-ramanujanpetersson); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); `ArithmeticGaloisRepresentations:§§2.1–2.6`; `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

See [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — Corollary 7, p. 20; [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — Proposition 5, p. 16; [Takeshi Saito](https://www.ms.u-tokyo.ac.jp/~t-saito/pp/weightmonodromy.pdf) — Theorem 1, printed p. 429 (page image).

### 7.3 The fixed-eigenform compatible family

Use the compatible-system carrier of §7.1 over one sufficiently large coefficient field E. Its λ-member is ρ_{π,λ}, its bad set is S_π, its good polynomial is P_v∈E[X], its labelled degrees are the fixed pair above, and at every finite v its local parameter is `Rec_v(π_v⊗|·|⁻¹/²)`, with N retained. Full coefficient-prime compatibility together with away-prime compatibility proves strict compatibility; Ramanujan gives purity of weight w+1. If only good polynomials have been supplied, the family is merely weakly compatible. Kisin alone covers the residually absolutely irreducible coefficient primes and Saito alone his geometric range. Weight-one finite-image systems use their Artin construction, not this regular-weight carrier instance.

*Needs:* [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor); [3.11 The representation dictionary as a theorem](#311-the-representation-dictionary-as-a-theorem); [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); [4.4 All-Hilbert compatibility away from λ](#44-all-hilbert-compatibility-away-from-λ); [4.7 Skinner's full coefficient-prime theorem](#47-skinners-full-coefficient-prime-theorem); [7.2 Purity of the entire family](#72-purity-of-the-entire-family); [7.1 The compatible-system carrier and operations](#71-the-compatible-system-carrier-and-operations).

See [Luis Victor Dieulefait and Ariel Martin Pacetti](https://arxiv.org/pdf/2108.07577v2) — Definition 1.10 and following paragraph, pp. 6–7; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Theorem 1 and equation (1), p. 242.

Use the carrier and predicates of §7.1. There is no requirement that weak compatibility or potential modularity furnish this family: each member is the attached eigenform representation already constructed, and the local comparisons fill the strict predicate.


- `fixedEigenformFamily` (constructor): The compatible family {ρ_{π,λ}}_λ over one coefficient field E with ramification set S_π.
- `fixedEigenformFamily_member` (projection): Its λ-member is ρ_{π,λ} of [3.10 The unrestricted Hilbert constructor](#310-the-unrestricted-hilbert-constructor).
- `fixedEigenformFamily_goodPolynomial` (data): P_v(X) = X² − t_vX + q_vs_v ∈ E[X] for v ∉ S_π.
- `fixedEigenformFamily_localParameter` (data): At every finite v the parameter ιRec_v(π_v ⊗ |·|_v^{−1/2}), with N.
- `fixedEigenformFamily_coeffChange` (functoriality): Enlarging E or conjugating by σ ∈ Aut(C) gives the family of π^σ.
- `fixedEigenformFamily_strict` (characterisation): The family satisfies the strict predicate of §7.1 and is pure of weight w + 1.

**Checks.**

- `fixedEigenformFamily_delta` (computation): For Δ (infinity type (12,10)): P_2(X) = X² + 24X + 2048 for every λ ∤ 2, and the family is pure of weight 11.
- `fixedEigenformFamily_steinberg` (compatibility): For 11a1 at v = 11 the parameter is the twist of Steinberg with N ≠ 0, for every λ ∤ 11, and agrees with the Tate-curve representation H¹_ét.
- `fixedEigenformFamily_weakNotStrict` (non-example): The family defined only by its good polynomials, without the local parameters at bad places and at λ, is weakly but not thereby strictly compatible.
- `fixedEigenformFamily_evenHilbert` (degenerate): For d even and π principal series everywhere the strict family still exists; it does not rely on a discrete-series place.

### 7.4 Dimitrov's residual large image

For a fixed regular non-CM Hilbert form, exclude a finite set of rational characteristics depending on the form, coefficient field, level and weights. For every remaining relevant λ|ℓ, after conjugacy its residual image contains SL₂(F_q) for a finite subfield F_q⊆κ_λ and lies in κ_λ×GL₂(F_q). In particular it contains a conjugate of SL₂(F_ℓ). Retain the coefficient embeddings and sufficiently large tame-inertia weight conditions used in the exclusions. The conclusion is a large subgroup with its subfield structure, not the entire GL₂(κ_λ).

*Needs:* [3.15 The CM predicate](#315-the-cm-predicate); [3.14 Determinant, total oddness and absolute irreducibility](#314-determinant-total-oddness-and-absolute-irreducibility); `ArithmeticGaloisRepresentations:Layer 4; §§5.12, 7.6–7.7`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`; [7.3 The fixed-eigenform compatible family](#73-the-fixed-eigenform-compatible-family).

See [Mladen Dimitrov](https://arxiv.org/pdf/math/0411152v1) — Proposition 3.1, p. 22; Proposition 3.5, p. 24; Proposition 3.8, p. 25; [James Newton and Jack A. Thorne](https://arxiv.org/pdf/2212.03595v2) — Proof of Lemma 5.7, printed p. 41.

### 7.5 Ribet–Momose classical large image

For a fixed non-CM classical cusp newform k≥2, the characteristic-zero Zariski closure contains SL₂ over the algebraic closure for every λ. Residual absolute irreducibility holds outside a finite set of λ; residual image contains a conjugate of SL₂(F_ℓ) outside a finite set of rational ℓ, including the sufficiently large split primes used by symmetric-power applications. Preserve the inner-twist fixed field and quaternion algebra in the open-image formulation. These can constrain coefficients and determinants, so full GL₂(O_{K,λ}) is not the general conclusion.

*Needs:* [1.5 Rank-two newform realisation](#15-rank-two-newform-realisation); [3.15 The CM predicate](#315-the-cm-predicate); `ArithmeticGaloisRepresentations:Layer 4; §§5.12, 7.6–7.7`; [7.3 The fixed-eigenform compatible family](#73-the-fixed-eigenform-compatible-family); [4.8 Classical characteristic-zero irreducibility](#48-classical-characteristic-zero-irreducibility); [6.4 Classical conductors and bad Euler factors](#64-classical-conductors-and-bad-euler-factors); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`.

See [Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/rankin.pdf) — Theorem 2.1 pp. 188–190; §3 and Theorem 3.1 pp. 190–192; [James Newton and Jack A. Thorne](https://arxiv.org/pdf/2009.07180v2) — Proof of Theorem 3.1, printed p. 26.

### 7.6 Residual ramification at the fixed squarefree level

Fix a non-CM weight-two newform f of squarefree level N and trivial character.
For every sufficiently large rational p and every λ|p, prove that ρ̄_{f,λ} is
ramified at every q|N. First choose p≥5 outside the level and exceptional
residual-reducibility set, and enlarge the bound past every q+1 for q|N, so
q≢±1 modulo p. If a reduction is unramified at q, use the
weight-two squarefree-level lowering theorem with q≠p and absolute residual
irreducibility to obtain a weight-two form of level dividing N/q with the same
prime-to-Np residual eigensystem. Only finitely many newforms occur at those
divisor levels. Congruence to one of them at infinitely many coefficient primes
forces equality of every fixed good coefficient, and strong multiplicity one
contradicts f's conductor N. This is the argument of
[Skinner](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf),
§3, printed p. 350.

Prove the specific level-lowering input in the stated weight-two setting,
including its q-local degeneracy/Ihara hypotheses, from the modular-curve
cohomology of ModularCurvesPartII Layers 13–17 and the local residual conductor description. The theorem is
not inferred from semisimplification of the characteristic-zero local parameter:
a nontrivial integral extension can become split after reduction at finitely
many λ. The output is uniform over all λ above a sufficiently large p and over
the finite set of q|N.

*Needs:* Layer 7's Ribet–Momose finite residual exception set; Layer 6's
residual representations and classical conductor theorem; ModularCurvesPartII
Layers 13–17, degeneracy maps, localized parabolic cohomology and its Ihara
injectivity; TauCetiRoadmap.ModularForms Layer 4, finiteness at fixed weight and
bounded level; GL2AutomorphicRepresentationsAndTransfer R16.6, strong multiplicity
one. The required Ihara injectivity and weight-two level-lowering argument are
part of this target, using ModularCurvesPartII §§15.1–15.7; no higher-tier weight roadmap is
a prerequisite.

- `fixedSquarefreeForm_residual_ramified`: Produce one rational bound working for every λ|p and q|N.
- `weightTwo_squarefree_levelLowering`: Return the lower-level eigenform with its residual identification under the specified local hypotheses.

**Checks.**

- For level 11 the only proper divisor level is 1, whose weight-two cusp space is zero; this rules out an unramified residual representation at 11 once the hypotheses hold.
- The bound excludes the finite residual-reducibility set; the reducible mod-5 representation of 11a1 cannot be used as a counterexample.
- Level p or nonsquarefree N does not satisfy this target and cannot be inserted without new local hypotheses.

### 7.7 Density-one ordinary primes for the fixed weight-two form

Fix a non-CM weight-two newform of squarefree level N and trivial nebentypus. The rational primes p∤N at which some λ|p is ordinary have density one. For all sufficiently large such rational primes, every λ|p has absolutely irreducible residual representation ramified at each q|N. The norm/trace-zero density argument provides ordinarity; large image supplies irreducibility and level lowering supplies ramification. Thus one can choose p≥5 and an ordinary λ while retaining all residual conditions. Preserve the different “some λ” and “every λ” quantifiers, and exclude the finite coefficient-ramification and small-prime exceptions.

*Needs:* [7.5 Ribet–Momose classical large image](#75-ribetmomose-classical-large-image); `ArithmeticGaloisRepresentations:Layer 5`; [7.6 Residual ramification at the fixed squarefree level](#76-residual-ramification-at-the-fixed-squarefree-level); `GL2AutomorphicRepresentationsAndTransfer:§R16.4.4`; [7.3 The fixed-eigenform compatible family](#73-the-fixed-eigenform-compatible-family).

See [Christopher Skinner](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf) — §3, p. 350, first three paragraphs; [Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/rankin.pdf) — Theorem 2.1, pp. 188–190.

### Examples

For a fixed non-CM weight-two form and a sufficiently large unramified
p, if every λ|p is nonordinary then the integral a_p has norm divisible by
p^[E:Q]. The Ramanujan bound makes a nonzero norm impossible for p>4, so
a_p=0. Trace-zero density zero then gives ordinary primes of density one,
with at least one ordinary λ above each such rational prime; it does not say
that every λ is ordinary.

A CM form has trace zero at inert primes and fails that non-CM conclusion.
The strict compatible family still exists for CM forms. At a bad Steinberg
place its common WD parameter retains N≠0, unlike a list of good polynomials.

### Dependencies

Layers 1, 3, 4 and 6; ArithmeticGaloisRepresentations Layers 2, 4 and 5; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3; modular newform and local inertia contracts; generic p-adic analytic Chebotarev with the stated trace-zero hypothesis.


## Downstream consumers

Serre-weight and level optimization use the attached residual representation,
the explicit endpoint boundary and the weight-two optimization interface.
Ordinary modularity lifting uses the specified ordinary line, saturated lattice
and exact graded characters. Potential modularity and compatible systems use
the common carrier and operations, the strict fixed-eigenform family and the
geometric-character converse. Generalized Heegner cycles use the Kuga–Sato
realization, coefficient projector and fixed rational/integral period lines.
Crystalline regulators and explicit reciprocity use the actual Wach module and
semilinear Frobenius with the chosen lattice. Modular and Hilbert deformation
arguments use the whole integral Hecke determinant and the exact local-functor
factorizations, including nilpotent quotients. The later AG2 rank-two comparison
imports this normalization dictionary and local compatibility.


## References

Citations above use printed journal pages for the published scans and internal pages for the specified author or arXiv versions. Those are different from the published page ranges when an author version is used.

- [Pierre Deligne and Jean-Pierre Serre, *Formes modulaires de poids 1*](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf). Ann. Sci. École Norm. Sup. (4) 7 (1974), 507–530; printed journal pages in the Numdam scan.
- [Pierre Deligne, *Formes modulaires et representations l-adiques*](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf). Séminaire Bourbaki, 1968/69, exposé 355, published 1971, 139–172; printed pages in the Numdam scan.
- [Henri Carayol, *Sur les representations l-adiques associees aux formes modulaires de Hilbert*](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf). Ann. Sci. École Norm. Sup. (4) 19 (1986), 409–468; printed journal pages in the Numdam scan.
- [Takeshi Saito, *Hilbert modular forms and p-adic Hodge theory*](https://arxiv.org/pdf/math/0612077v2). arXiv:math/0612077v2 (11 December 2006), internal pages; published in Compositio Math. 145 (2009), 1081–1113.
- [Gaetan Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings*](https://arxiv.org/pdf/0809.0415v2). arXiv:0809.0415v2 (18 July 2013), internal pages.
- [Luis Victor Dieulefait and Ariel Martin Pacetti, *A simplified proof of Serre's conjecture*](https://arxiv.org/pdf/2108.07577v2). arXiv:2108.07577v2 (3 May 2022), internal pages.
- [F. Diamond, M. Flach and L. Guo, *Adjoint motives of modular forms and the Tamagawa number conjecture*](https://arxiv.org/pdf/2512.02348v2). arXiv:2512.02348v2 (11 December 2025), internal pages; revised author version of Ann. Sci. École Norm. Sup. 37 (2004), 663–727.
- [H. Darmon, F. Diamond and R. Taylor, *Fermat's Last Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf). Author revision of 9 September 2007, internal pages; article originally published in Current Developments in Mathematics 1995.
- [C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (II)*](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf). Author final version of 30 May 2009, internal pages; published in Invent. Math. 178 (2009), 505–586.
- [C. M. Skinner and A. J. Wiles, *Residually reducible representations and modular forms*](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf). Publ. Math. IHÉS 89 (1999), 5–126; printed journal pages in the Numdam scan.
- [A. J. Scholl, *Motives for modular forms*](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf). Author copy of Invent. Math. 100 (1990), 419–430; internal author-copy pages.
- [Mark Kisin, *Potentially semi-stable deformation rings*](https://abel.math.harvard.edu/~kisin/dvifiles/def.dvi). J. Amer. Math. Soc. 21 (2008), 513–546; locators here use the public author DVI: Theorem 2.5.5 pp. 19–20, Theorem 2.7.6 p. 23, §4.1 p. 31 and Theorem 4.3 pp. 32–33.
- [Christopher Skinner, *A note on the p-adic Galois representations attached to Hilbert modular forms*](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf). Documenta Math. 14 (2009), 241–258; printed journal pages in the EMS PDF.
- [Mladen Dimitrov, *Galois representations modulo p and cohomology of Hilbert modular varieties*](https://arxiv.org/pdf/math/0411152v1). arXiv:math/0411152v1, internal pages; published in Ann. Sci. École Norm. Sup. 38 (2005), 505–551.
- [Samit Dasgupta and Mahesh Kakde, *On the Brumer–Stark conjecture*](https://math.iisc.ac.in/~maheshkakde/brumerstark.pdf). Author copy of Ann. Math. 197 (2023), 289–388; internal pages.
- [Baskar Balasubramanyam, Eknath Ghate and Vinayak Vatsal, *On local Galois representations associated to ordinary Hilbert modular forms*](https://mathweb.tifr.res.in/~eghate/hilbertCM.pdf). Author copy of Manuscripta Math. 142 (2013), 513–524; internal pages.
- [Takashi Hara and Tadashi Ochiai, *The cyclotomic Iwasawa main conjecture for Hilbert cuspforms with complex multiplication*](https://arxiv.org/pdf/1507.07309v2). arXiv:1507.07309v2, internal pages; published in Kyoto J. Math. 58 (2018), 1–100.
- [Kenneth A. Ribet, *On l-adic representations attached to modular forms*](https://math.berkeley.edu/~ribet/Articles/invent_28.pdf). Invent. Math. 28 (1975), 245–275; printed journal pages in the author-hosted scan.
- [Kenneth A. Ribet, *On l-adic representations attached to modular forms II*](https://math.berkeley.edu/~ribet/Articles/rankin.pdf). Glasgow Math. J. 27 (1985), 185–194; printed journal pages in the author-hosted scan.
- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, *Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1*](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf). Author copy GPW5, internal pages 43–45 for the Shimura-curve comparison.
- [James Newton and Jack A. Thorne, *Symmetric power functoriality for holomorphic modular forms, II*](https://arxiv.org/pdf/2009.07180v2). arXiv:2009.07180v2, internal pages; published in Publ. Math. IHÉS 134 (2021), 1–152.
- [James Newton and Jack A. Thorne, *Symmetric power functoriality for Hilbert modular forms*](https://arxiv.org/pdf/2212.03595v2). arXiv:2212.03595v2 (19 February 2025), internal pages; published in Ann. Math. 203 (2026), no. 1.
- [Christopher Skinner, *A converse to a theorem of Gross, Zagier, and Kolyvagin*](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf). Ann. Math. 191 (2020), 329–354; printed journal pages in the published PDF.
- [Don Blasius, *Hilbert modular forms and the Ramanujan conjecture*](https://arxiv.org/pdf/math/0511007v1). arXiv:math/0511007v1 (1 November 2005), internal pages; published in Noncommutative Geometry and Number Theory, Aspects Math. E37 (2006), 35–56.
- [Takeshi Saito, *Weight-monodromy conjecture for ℓ-adic representations associated to modular forms. A supplement to the paper [10]*](https://www.ms.u-tokyo.ac.jp/~t-saito/pp/weightmonodromy.pdf). The Arithmetic and Geometry of Algebraic Cycles (2000), 427–431; printed pages in the author-hosted scan.

- [Brian Conrad, algebraic Hecke-character seminar notes](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/algebraicHeckecharacters.pdf), the second Lemma 1, internal pp. 9–10; local algebraicity and the global converse are distinguished.

- [Brian Conrad, *Lifting global representations with local properties*](https://math.stanford.edu/~conrad/papers/locchar.pdf). Author copy, internal pages; Appendix B, Definition B.1 p. 32, Propositions B.3–B.4 pp. 33–36 and Example B.5 p. 36.
- [Pierre Colmez and Jean-Marc Fontaine, *Construction des représentations p-adiques semi-stables*](https://webusers.imj-prg.fr/~pierre.colmez/CF.pdf). Author copy, internal pages; Theorem A p. 2, §3.4 pp. 21–22, Proposition 4.2 p. 23 and Proposition 4.4 p. 24.

- [Laurent Berger, *Limites de représentations cristallines*](https://arxiv.org/pdf/math/0201262v2). arXiv:math/0201262v2; §2.1, Theorems 3.5 and 5.1.
- [Kevin Buzzard, *Eigenvarieties*](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf). Author manuscript, §§8–13; Lemma 12.2 and §13, internal pp. 78–80.
- [Kevin Buzzard, *On p-adic families of automorphic forms*](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/GL1.pdf). Author manuscript, §7 Proposition 4, internal p. 19.
- [Jean-Pierre Wintenberger, *Propriétés du groupe tannakien des structures de Hodge p-adiques et torseur entre cohomologies cristalline et étale*](https://www.numdam.org/article/AIF_1997__47_5_1289_0.pdf). Ann. Inst. Fourier 47 (1997); Theorem 2.2.2, pp. 1310–1311.

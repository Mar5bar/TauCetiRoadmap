# p-adic period rings

**Summary.** This roadmap develops Mathlib's `PadicComplex` and constructs the completed algebraic closures of p-adic fields, their continuous Galois actions, normalized cyclotomic traces and Tate–Sen cohomology, and the topological de Rham, crystalline and semistable period rings. It develops the general-base invariant functors and the period identities that make these carriers usable, including the principal Fontaine divided-power envelope needed to construct crystalline periods.

## Scope and ownership

This roadmap owns the finite-K ℂ_p action, Ax–Sen–Tate, normalized traces, almost trace surjectivity, Tate's degree-zero and degree-one twist calculations and topological B_dR basics (§§1.1–1.5); their complete-discrete-valuation-field Tate–Sen extension (§2); the principal Fontaine envelope (§3); and the general-base topological B_dR/B_cris/B_st structures and invariant functors (§§4.1–4.3). Section 0 contains the procyclic and low-degree continuous-cochain preliminaries needed by those targets. The principal envelope is an ordinary algebraic and completed period construction; module-level derived tensor, limits and completion belong to DerivedModuleAlgebra.

Consumers are DerivedDeRhamCohomology, CrystallineCohomology, FiniteFlatGroupsAndIntegralPadicHodgeTheory, SelmerIwasawaCohomology, NeronModelsAndSemistableAbelianVarieties, ArithmeticGaloisRepresentations and ArithmeticGaloisDuality. The downstream finite-K comparison contracts identifying crystalline and semistable realizations with their arithmetic interfaces belong to FiniteFlatGroupsAndIntegralPadicHodgeTheory. Its downstream integral theory, Sen operators on representations, admissibility and realization theorems are separate from the carrier and invariant-functor construction here. Geometric crystalline and derived de Rham comparisons, Raynaud realizations, abelian-variety comparison and Selmer conditions belong to the named consumers. In particular, the finite-K B_st/D_st/PeriodRealization package and the finite-K crystalline realization contracts are downstream interfaces, not prerequisites here.

## Conventions

Fix a prime p, including p = 2. A general p-adic field K is a characteristic-zero field complete for a discrete valuation with arbitrary perfect residue field k of characteristic p. Choose the Cohen inclusion W(k) ⊆ O_K, and write K₀ = W(k)[1/p]. The algebraic closure has the extended valuation; C_K is its separated completion, with its norm topology and valuation ring O_C. Finite K/ℚ_p is represented inside Mathlib's PadicAlgCl p. The Galois group carries the Krull topology; every action on a completed or period coefficient is jointly continuous. Continuous cohomology means continuous cochain cohomology, using the underlying module of Mathlib's continuousCohomology through PerfectoidTowers P9.0. Topological assertions retain the quotient topology on cohomology.

The full cyclotomic tower K(μ_{p^∞}) retains the finite torsion in Γ_K. A torsion-free procyclic stage is chosen sufficiently high, at least stage 2 when p = 2, and may depend on a fixed twist. Trace normalization always uses the actual extension degree. Twists are g·x = χ(g)^i g(x); g(t) = χ(g)t, φ(t) = pt, grⁱ B_dR = C_K(i), and the covariant realization of ℚ_p(1) has filtration jump −1. The contravariant functor is the covariant functor on V^∨. Choose a branch of log for B_st → B_dR. Use the p-normalized monodromy N_p, with N_p φ = p φ N_p; a uniformizer-normalized operator for ord_K(π)=1 is e N_p, e=ord_K(p).

Names in this README are target names relative to TauCetiRoadmap.PadicPeriodRings. [Suggested.lean](Suggested.lean) records only real-bodied definitions and theorem signatures supported by the pinned libraries; this README is the definitive specification of every target. Use Mathlib's existing carriers and API, adopting its extensions as they become available and constructing the specified missing theory in Tau Ceti.

## Exact supplier contracts

| Supplier | Exact interface consumed |
| --- | --- |
| Mathlib, pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` | PadicAlgCl, PadicComplex, PadicComplexInt, spectralNorm, completion maps, algebraic closures and the Krull topology, cyclotomicCharacter and continuousCohomology; PreTilt, WittVector and Fontaine's θ; BDeRhamPlus and BDeRham as defined in [Mathlib/RingTheory/Perfectoid/BDeRham.lean](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Perfectoid/BDeRham.lean); localization, AdicCompletion, divided powers and DividedPowerAlgebra. The period topology, discrete valuation structure and comparisons are targets here. |
| Tau Ceti, pinned at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` | TauCeti.ContCohomology's explicit continuous cocycles, principal cocycles, invariants, restriction and inflation; its explicitInfRes_exact and explicitInfl1_injective in TauCeti.RepresentationTheory.Homological.ContCohomology.Inflation.Basic. Consume these with their topological coefficient and quotient-action hypotheses. |
| ProfiniteCohomology | Layers 3 and 5: canonical continuous-cohomology comparison and the low-degree restriction/inflation API. These supply the continuous cocycle vocabulary of §0. |
| ProfiniteArithmetic | Layer 0: profinite integers, units and continuous powers for the procyclic group and the cyclotomic character. |
| LocalFieldsRamification | Layer 3: the different, normalized trace estimates, upper ramification numbering and the Herbrand function. |
| LocalGaloisGroups | Layer 5: the local cyclotomic character and its agreement with Mathlib's character. |
| PerfectoidSpaces | §§P1.6, P1.10–P1.11, P1.16–P1.18: functorial tilting, perfectoid complete algebraically closed fields, Witt vectors, primitive degree-one kernels and comparison of θ with Mathlib; §P1.31 the completed cyclotomic field; §§P3.7, P3.12 finite perfectoid extensions and almost finite étale integral closure. |
| PerfectoidTowers | P9.0: **Lifting continuous cochains along finite surjections**, **Continuous cochains into an inverse limit**, and **Comparison with the canonical carrier for compact coefficients**. Use all degrees and jointly continuous actions, with quotient topology for topological statements and underlying modules for derived statements. These three targets have a single owner there. |
| EtaleCohomologyFoundations | §F.4.0: a stable lattice in a finite-dimensional continuous ℚ_p-representation of a compact group, used in the rational-coefficient procyclic calculation of §0.1. |
| DerivedModuleAlgebra | §R02.1.1: tower lim/lim¹ and Mittag–Leffler exactness for the lattice quotient towers of §0.1; §1.1 and §§1.2–1.5: module-level derived limits and completion when expressing those towers in the derived category. Module derived tensor is its §§0.1–0.3 contract; no sheaf or geometric derived completion is constructed here. |

## 0. Continuous-cochain preliminaries

### 0.1 H¹ of a procyclic group

**H¹ of a procyclic group.** Let Γ ≅ Ẑ with topological generator σ (for example Gal(k^s/k) for a finite field k, with σ the arithmetic Frobenius), and C a discrete torsion Γ-module, a finitely generated ℤ_p-module with continuous action, or a finite-dimensional ℚ_p-space with continuous action. Prove `procyclic_H1_equiv_coinvariants`: evaluation of continuous 1-cocycles at σ induces an isomorphism H¹(Γ, C) ≅ C/(σ − 1)C, natural in C. Prove this as follows. A continuous cocycle is determined by its value at σ, because the cocycle identity determines it on the dense subgroup σ^ℤ; conversely every c ∈ C defines a cocycle on σ^ℤ which extends continuously to Γ: for discrete torsion C the stabiliser of c is open and the partial sums 1 + σ + … + σ^{n−1} applied to c are periodic, and for compact or rational coefficients pass to the finite quotients C/p^mC (or a lattice) and to the limit (PerfectoidTowers P9.0, *Continuous cochains into an inverse limit*). Coboundaries evaluate to (σ − 1)C. (Rubin (1999 draft), Appendix B, Lemma 2.8 and its proof, printed p. 153 (PDF p. 163), which reduces to finite C by limits and cites Serre, *Local Fields*, §XIII.1, for that case.)

**Checks** (procyclic H¹).

- Γ = Ẑ, C = ℤ/p trivial: H¹ = Hom(Ẑ, ℤ/p) = ℤ/p = C/(σ − 1)C.
- Γ = Ẑ acting on C = ℤ_p with σ acting by 1 + p (through the ℤ_p-factor of Ẑ): (σ − 1)C = pℤ_p, so H¹ = ℤ/p, finite although C is torsion free.
- p odd, Γ = Ẑ, C = ℚ_p with σ acting by 2 ∈ ℤ_p^×: σ − 1 is invertible, so H¹ = 0, while for the trivial action H¹ = Hom_cont(Ẑ, ℚ_p) ≅ ℚ_p, through the ℤ_p-factor of Ẑ. In the previous check the invariants vanish while H¹ = ℤ/p, so H¹ is the coinvariants and not the invariants. For p = 2 no continuous action of Ẑ on ℚ₂ has σ acting by 2: the image of the compact group Ẑ in ℚ₂^× is compact, hence lies in ℤ₂^×, which does not contain 2.

*Needs:* Mathlib topology, finite modules and continuous cocycles; ProfiniteArithmetic Layer 0; ProfiniteCohomology Layers 3 and 5; PerfectoidTowers P9.0 (lifting continuous cochains, inverse-limit cochains and canonical compact-coefficient comparison); EtaleCohomologyFoundations §F.4.0 (stable lattices); DerivedModuleAlgebra §R02.1.1 (Mittag–Leffler exactness), §1.1 and §§1.2–1.5 for the module derived limit/completion description. The Banach-coefficient calculation required for C_K is the separate target in §§1.4 and 2; finite-type procyclic cohomology does not assert that calculation.

### 0.2 Inflation–restriction and finite descent for topological coefficients

**Low-degree continuous descent.** For a topological group G, closed normal subgroup H, and a Hausdorff topological additive G-module M with jointly continuous action, use the subspace topology on M^H and the quotient topology on G/H. With a jointly continuous descended action, prove the exact continuous-cochain sequence
0 → H¹(G/H,M^H) → H¹(G,M) → H¹(H,M).
Thus H¹(H,M)=0 identifies H¹(G,M) with H¹(G/H,M^H), compatibly with coefficient maps and twists trivial on H. This is the supplied Tau Ceti inflation–restriction theorem on its stated topological domain. Verify the descended joint continuity for the closed subgroups and invariant Banach spaces of §§1.4 and 2; the quotient map is open and invariants have their subspace topology. Construct the identification with Mathlib's `continuousCohomology` through PerfectoidTowers P9.0.

For a finite quotient F acting continuously and linearly on a Banach coefficient module over a characteristic-zero valued field, averaging by |F|⁻¹ gives an exact invariants functor and a continuous contracting homotopy in positive cochain degrees. Use this to prove restriction H¹(G,M) ≅ H¹(H,M)^F for a finite-index open normal H and to descend the finite cyclotomic-stage calculations to K, retaining the action of F on both coefficients and classes. No discreteness assumption on M is used.

*Source:* Neukirch–Schmidt–Wingberg, Cohomology of Number Fields, (1.6.7), the continuous inflation–restriction sequence; Rubin, Euler Systems, Appendix B §2, Proposition 2.3, printed p. 152 (PDF p. 162), cochain exactness; Brinon–Conrad §14.3, Proposition 14.3.3 and Theorem 14.3.4, pp. 253–254, finite descent in the Tate–Sen calculation.

*Needs:* ProfiniteCohomology Layers 3 and 5; the pinned Tau Ceti continuous cocycle, restriction and inflation API; PerfectoidTowers P9.0 (canonical compact-coefficient comparison); Mathlib quotient topology, continuous linear maps and finite-group averaging.

**Checks.**

- H=1: inflation is the identity on H¹(G,M), and the restriction target is zero.
- G=H: the image of inflation is zero and restriction is the identity.
- For M=ℚ_p trivial and a finite group F of order divisible by p, averaging still works since |F| is invertible in ℚ_p. For M=ℤ/p and F=ℤ/p trivial, H¹(F,M)=ℤ/p, so the characteristic-zero hypothesis cannot be dropped.
- For K=ℚ₃ and its full cyclotomic Γ_K, the order-two quotient acts on the twist; passing directly to the ℤ₃-subextension loses this action.

## 1. The finite-K completed field and de Rham core

Throughout, ℂ_p is Mathlib's `PadicComplex p`, the completion of `PadicAlgCl p` = `AlgebraicClosure ℚ_[p]` for the spectral norm, with `PadicComplex.isAlgClosed` and valuation ring `PadicComplexInt p`. A finite extension K/ℚ_p is a finite-dimensional intermediate field K ⊆ `PadicAlgCl p`; G_K is the group `PadicAlgCl p ≃ₐ[K] PadicAlgCl p` with its Krull topology, and χ : G_K → ℤ_p^× is the cyclotomic character (Mathlib `cyclotomicCharacter (PadicAlgCl p) p` on the underlying ring automorphisms; it agrees with Tau Ceti's `TauCeti.localCyclotomicCharacter` of TauCetiRoadmap.LocalGaloisGroups Layer 5). For i ∈ ℤ, ℂ_p(i) is ℂ_p with g·x = χ(g)^i g(x).

### 1.1 The Galois action on ℂ_p

**The Galois action on ℂ_p.** Prove `PadicAlgCl.norm_algEquiv_apply`: every ℚ_p-automorphism σ of `PadicAlgCl p` is an isometry, because the spectral norm of x depends only on the minimal polynomial of x over ℚ_p and σ(x) has the same minimal polynomial. Define `padicComplexGaloisAction` by `UniformSpace.Completion.map σ` and prove `padicComplexGaloisAction_spec`: it is the unique continuous extension of σ to ℂ_p, it is an isometric ℚ_p-algebra automorphism, σ ↦ `padicComplexGaloisAction σ` is a group homomorphism, and the action map G_K × ℂ_p → ℂ_p is continuous for the Krull topology. Hypotheses: K/ℚ_p finite inside `PadicAlgCl p`; nothing else.

(Brinon–Conrad, *CMI summer school notes on p-adic Hodge theory*, §2.1, p. 12; Fontaine–Ouyang, *Theory of p-adic Galois representations*, §4.1.2, p. 91, paragraph before Question 4.8.)

**Checks.**

- σ = id extends to the identity, and every σ fixes the image of ℚ_p in ℂ_p.
- For p odd and σ ∈ G_{ℚ_p} with σ(√p) = −√p, `padicComplexGaloisAction σ` is not the identity, although it is continuous and isometric.
- ℂ_p has field automorphisms that are not continuous (as an abstract field it is isomorphic to ℂ); the action is by the isometric extensions of Galois automorphisms only, and an arbitrary field automorphism of ℂ_p is not an element of G_K.

*Needs:* Mathlib PadicAlgCl, PadicComplex, spectralNorm, UniformSpace.Completion.map and Krull topology; LocalGaloisGroups Layer 5 (cyclotomic character).

### 1.2 Ax–Sen–Tate fixed points

**Ax–Sen–Tate.** Prove `padicComplex_fixed_eq`: for a closed subgroup H ⊆ G_{ℚ_p} with fixed field L = `PadicAlgCl p`^H, the H-fixed points of ℂ_p are the closure of L in ℂ_p, which is the completion L̂; in particular, for K/ℚ_p finite, ℂ_p^{G_K} = K. Prove this as follows. Approximate x ∈ ℂ_p^H by algebraic x_n with v(x − x_n) ≥ n; every H-conjugate of x_n is then close to x_n, and the Ax–Sen lemma gives y_n ∈ L with v(x_n − y_n) bounded below by n minus a constant depending only on p; the y_n converge to x.

(Fontaine–Ouyang, §4.1.2, Proposition 4.3 (Ax–Sen lemma), p. 88, and Proposition 4.9, p. 91; Brinon–Conrad, Proposition 2.1.2, p. 12; Ax, *Zeros of polynomials over local fields — the Galois action*, J. Algebra 15 (1970).)

**Checks.**

- H = 1: the fixed points are all of ℂ_p.
- H = G_{ℚ_p}: the fixed points are ℚ_p; ℂ_p has no transcendental Galois invariants.
- H = Gal(`PadicAlgCl p`/ℚ_p(μ_{p^∞})): the fixed points are the completion of ℚ_p(μ_{p^∞}), which strictly contains ℚ_p(μ_{p^∞}): an infinite-dimensional normed ℚ_p-space of countable dimension is not complete (Baire), so the closure cannot be dropped.

*Needs:* §1.1; Mathlib algebraic closures, nonarchimedean completions and closed subgroups; LocalFieldsRamification Layer 3 (valuation estimates).

### 1.3 Normalized cyclotomic traces and almost trace surjectivity

**Tate's normalized traces.** Let K/ℚ_p be finite, K_∞ = K(μ_{p^∞}) the full cyclotomic extension, K_n = K(μ_{p^n}), and Γ_K = Gal(K_∞/K), identified by χ with an open subgroup of ℤ_p^×. Retain its finite torsion subgroup. For n sufficiently large (n ≥ 2 at p = 2), Γ_n = Gal(K_∞/K_n) is torsion-free and procyclic; let γ_n generate it. Prove `tate_normalizedTrace`: the maps R_n = [K_m : K_n]^{−1} Tr_{K_m/K_n} on K_m (independent of m ≥ n) define a K_n-linear, Γ_K-equivariant retraction R_n : K_∞ → K_n that is bounded uniformly in n for n large and extends to K̂_∞; X_n = ker R_n is closed, K̂_∞ = K_n ⊕ X_n, and γ_n − 1 is invertible on X_n with an inverse bounded independently of n. Prove this as follows. Tate's estimates for the different of K_{n+1}/K_n in a ramified ℤ_p-extension (upper numbering and the Herbrand function, TauCetiRoadmap.LocalFieldsRamification Layer 3) give v(Tr_{K_{n+1}/K_n}(x)) ≥ v(x) + 1 − c p^{−n}, which bounds R_n; the invertibility of γ_n − 1 on X_n is the estimate v((γ_n − 1)x) ≤ v(x) + c′ on ker R_n, proved first on K_{n+1} and then by passage to the limit. Also prove `tate_almostEtale`: for every finite extension M/K_∞, the trace Tr_{M/K_∞}(𝒪_M) contains the maximal ideal of 𝒪_{K_∞}. This follows from PerfectoidSpaces §P1.31 (*the completed cyclotomic field*, perfectoid) together with §P3.7 (*finite extensions of perfectoid fields*) and §P3.12 (*the integral closure is almost finite étale*): the completed extension of valuation rings is almost finite étale, so its trace is almost surjective.

(Fontaine–Ouyang, §1.4, Theorem 1.92 (Sen's filtration theorem), Corollary 1.96 (the trace statement), Corollary 1.99, Definition 1.100 and Proposition 1.104, pp. 36–39; Brinon–Conrad, Theorem 13.1.2, p. 199, with Faltings's argument in Exercise 13.7.4, and Lemmas 14.1.3–14.1.4, pp. 237–238; Tate, *p-divisible groups*, Proceedings of a Conference on Local Fields (1967), §3.1.)

**Checks.**

- R_n restricted to K_n is the identity, and an element of K_{n+1} of trace zero to K_n lies in X_n.
- For the unramified ℤ_p-extension of K the normalized traces are not uniformly bounded: Tr_{K_m/K_n} maps 𝒪_{K_m} onto 𝒪_{K_n}, so R_n has norm p^{m−n} on K_m. Deep ramification is essential.
- For K = ℚ_p, the unramified ℤ_p-extension K′_∞ in place of K_∞ and M = K′_∞(p^{1/p²}), the Eisenstein polynomial X^{p²} − p gives a different of valuation 3p² − 1 in M, so Tr_{M/K′_∞}(𝒪_M) = p²𝒪_{K′_∞}, which does not contain p: the trace statement fails without deep ramification.

*Needs:* §§1.1–1.2; LocalFieldsRamification Layer 3 (different and cyclotomic ramification); PerfectoidSpaces §§P1.31, P3.7, P3.12 (completed cyclotomic field, finite extensions and almost étaleness).

### 1.4 Tate cohomology and the cyclotomic Banach calculation

**Tate's calculation of H⁰ and H¹(G_K, ℂ_p(i)).** For K/ℚ_p finite and i ∈ ℤ, with continuous cohomology for the Krull topology on G_K and the norm topology on ℂ_p (Mathlib `continuousCohomology`), prove `tate_H0_padicComplex_twist` and `tate_H1_padicComplex_twist`: H⁰(G_K, ℂ_p(i)) = K for i = 0 and 0 for i ≠ 0; H¹(G_K, ℂ_p(i)) is a one-dimensional K-space spanned by the class of log χ for i = 0, and 0 for i ≠ 0. Prove this as follows. H¹(H_K, ℂ_p(i)) = 0 for H_K = Gal(`PadicAlgCl p`/K_∞), by the trace argument: a continuous cocycle on H_K is a limit of cocycles trivialised on finite extensions M/K_∞, and `tate_almostEtale` supplies α ∈ M with Tr(α) = 1 and bounded denominator, which trivialises them uniformly. Degree-one inflation–restriction for continuous cocycles (proved directly for topological coefficients) and Ax–Sen–Tate identify H¹(G_K, ℂ_p(i)) with H¹(Γ_K, K̂_∞(i)) and H⁰ with K̂_∞(i)^{Γ_K}. On K̂_∞ = K_m ⊕ X_m the operator χ(γ_m)^iγ_m − 1 is invertible on X_m by `tate_normalizedTrace` and acts on K_m by χ(γ_m)^i − 1, which is invertible for i ≠ 0 and zero for i = 0. Hence H⁰(Γ_m, K̂_∞(i)) and H¹(Γ_m, K̂_∞(i)) = K̂_∞(i)/(χ(γ_m)^iγ_m − 1) are K_m for i = 0 and 0 otherwise; descend from K_m to K with the vanishing of finite-group cohomology of ℚ-vector spaces, keeping the finite-character action, and identify the i = 0 class with K·log χ. Here the Banach-coefficient calculation is the intermediate theorem `tate_cyclotomicBanachH1`: for fixed i and m sufficiently large, evaluation at γ_m identifies H¹(Γ_m, K̂_∞(i)) with the displayed quotient. Prove it directly on continuous cocycles: if A = χ(γ_m)^iγ_m − 1 is invertible on a summand, subtract the coboundary with value A⁻¹c(γ_m); density of γ_m^ℤ then kills the cocycle. The normalized-trace estimates also give invertibility of A on X_m for fixed i and m large (Brinon–Conrad Lemma 14.1.9). On K_m the action is scalar, invertible for i ≠ 0; for i = 0 continuous additive homomorphisms Γ_m → K_m are determined by their value at γ_m. Descend by Γ_K/Γ_m, including its torsion action. This calculation uses the norm topology and is a separate input from the finite-type procyclic theorem of §0.1.

(Fontaine–Ouyang, §4.3.5, Corollary 4.45 and Proposition 4.46 with its proof, pp. 105–106; Brinon–Conrad, Theorem 2.2.7, p. 15, and Proposition 14.3.3 with Theorem 14.3.4, pp. 253–254; Tate (1967), §3.3, Theorem 2.)

**Checks.**

- K = ℚ₃, i = 1: on the ℤ₃-subextension H_K still acts through the order-two part of χ, so ℂ₃(1)^{H_K} cannot be identified with that completed field with a descended χ. For K_∞ = ℚ₃(μ_{3^∞}), χ|_{H_K} = 1, and the remaining finite Γ_K-character is retained.
- i = 0, degree zero: H⁰(G_K, ℂ_p) = K, which is Ax–Sen–Tate.
- i = 1, degree zero: no nonzero x ∈ ℂ_p satisfies g(x) = χ(g)^{−1}x for all g; in particular the period t of B_dR (with g(t) = χ(g)t) does not lie in ℂ_p.
- i = 0, degree one: log χ is a nonzero class, so the extension of ℂ_p by ℂ_p it defines does not split, while every extension of ℂ_p by ℂ_p(1) splits since H¹(G_K, ℂ_p(1)) = 0. The calculation uses continuous cochains for the norm topology; with the discrete topology on ℂ_p the cohomology groups are different (the ℂ_p-valued homomorphisms of G_K would have to be locally constant).

*Needs:* §§0.1–0.2, 1.1–1.3; PerfectoidTowers P9.0 (canonical continuous-cochain comparison); Mathlib cyclotomicCharacter and continuousCohomology; LocalGaloisGroups Layer 5.

### 1.5 The topological de Rham period rings

**The de Rham period rings.** Import the perfectoid structure of ℂ_p (PerfectoidSpaces §P1.10, `isPerfectoidField_padicComplex`), its tilt, A_inf = W(𝒪_{ℂ_p}^♭) (PerfectoidSpaces §P1.16) and θ (PerfectoidSpaces §§P1.17–P1.18). Identify Mathlib `BDeRhamPlus`/`BDeRham` with the completion of A_inf[1/p] at ker θ and its localisation. Give the canonical quotient B_dR^+ → ℂ_p, its complete discrete valuation ring structure, the G_K-action extending the action on ℂ_p through the functoriality of tilting and of Witt vectors (PerfectoidSpaces §P1.6), and the canonical topology defined as the inverse limit of the p-adic quotient topologies (not the discrete topology on the quotients). For a compatible primitive roots-of-unity sequence ε, t = log[ε] is a uniformizer, g(t) = χ(g)t, Fil^i B_dR = t^i B_dR^+, and gr^i B_dR ≃ ℂ_p(i). Hypotheses: finite K/ℚ_p; the ring definitions are Mathlib's, and only these comparisons and structures are new.

Prove this as follows. Compare the θ of PerfectoidSpaces §P1.17 with Mathlib `fontaineThetaInvertP` and identify their adic completions by the universal property. Use the primitive kernel and first-order thickening to show t is a uniformizer; extend the action and compute its associated graded through g(t) = χ(g)t.

(Fontaine, *Le corps des périodes p-adiques*, §§1.5.1–1.5.7, pp. 71–74.)

**Checks.**

- B_dR^+/(t) ≃ ℂ_p; replacing the ker θ-adic completion by the p-adic completion fails.
- g(t) = χ(g)t, so gr¹ is ℂ_p(1), with positive Tate twist.
- The G_K-action is continuous for the canonical inverse-limit topology; the t-adic topology with discrete ℂ_p quotients is not a substitute.

*Needs:* §1.1; Mathlib BDeRhamPlus, BDeRham, fontaineThetaInvertP and AdicCompletion; PerfectoidSpaces §§P1.6, P1.10, P1.16–P1.18 (functorial tilt, perfectoid ℂ_p, primitive kernel and θ comparison).

The suggested Lean checks for §1.1 also require the identity extension, fixed base-field elements, and the nonidentity action on a square root of p at odd p. These checks use the same algebraic-closure and completion carriers as the action theorem.

## 2. Tate–Sen over a general p-adic field

Prove `tateSen` for complete discretely valued fields with arbitrary perfect residue field
and for the character criterion below. For finite K/ℚ_p, use §§1.1–1.4, namely
`padicComplex_fixed_eq`, `tate_normalizedTrace`, `tate_almostEtale`,
`tate_H0_padicComplex_twist` and `tate_H1_padicComplex_twist`; their general-base extension
is the content here. Let `K` be a field of characteristic `0`, complete for a discrete valuation, with
perfect residue field `k` of characteristic `p`; let `K̄` be an algebraic closure, `C` the
completion of `K̄` with its continuous action of `G_K = Gal(K̄/K)`, `χ : G_K → ℤ_p^×` the cyclotomic
character and `C(i)` the space `C` with `g` acting as `χ(g)^i · g`. Then:

1. `H⁰(G_K, C) = K` and `H⁰(G_K, C(i)) = 0` for `i ≠ 0`;
2. `H¹_cont(G_K, C(i)) = 0` for `i ≠ 0`, and `H¹_cont(G_K, C)` is a one-dimensional `K`-vector
   space, spanned by the class of the homomorphism `log χ : G_K → ℤ_p ⊂ C`;
3. more generally, for a continuous character `η : G_K → 𝒪_K^×` whose image is finite or contains an
   open subgroup isomorphic to `ℤ_p`, `H⁰` and `H¹_cont` of `C(η)` vanish when `η(I_K)` is infinite
   and are one-dimensional over `K` when `η(I_K)` is finite.

Construct `PadicFieldCompletion`, the valued completion C_K of K̄, with its continuous
G_K-action and valuation ring. For finite K/ℚ_p, identify it canonically with the supplied
Mathlib `PadicComplex` through the chosen embedding of K̄.

Cohomology is continuous cochain cohomology for the `p`-adic topology of `C` (Mathlib
`continuousCohomology`, applied to `C(i)` as a topological `G_K`-module); with discrete coefficients
the statement is false, since `C` is not a discrete module. For `K/ℚ_p` finite, `C` is Mathlib's
`PadicComplex p` (`PadicComplex`) with its `G_K`-action.

*Proof sketch.* Put `K_∞ = K(μ_{p^∞})`, `H = Gal(K̄/K_∞)` and `Γ = Gal(K_∞/K)`, an open subgroup of
`ℤ_p^×` through `χ`. First, `C^H` is the completion `K̂_∞` (the Ax–Sen–Tate theorem: an element of
`C` almost fixed by `H` is close to `K_∞`), and `H¹_cont(H, C) = 0`, by almost étaleness of `K̄/K_∞`
(Tate's estimate on the different of the cyclotomic tower). Put `K_n = K(μ_{p^n})`. For `x ∈ K_n`, `n
≥ m`, define
`R_m(x) = [K_n : K_m]⁻¹ Tr_{K_n/K_m}(x)`; transitivity makes this independent of n.
These normalised traces extend continuously to `K̂_∞` and split it as `K_m ⊕ X_m` with `X_m =
ker R_m`, stable under `Γ`; for sufficiently large m, `Γ_m = Gal(K_∞/K_m)` is torsion-free procyclic and,
for a topological generator `γ`, the map `γ − 1`
is bijective on `X_m` with continuous inverse. Hence the cohomology of `Γ` with coefficients in
`K̂_∞(i)` is that of `K_m(i)`, where `γ` acts through `χ(γ)^i·γ`; this is computed directly:
invariants and coinvariants on the finite-stage coefficient space, followed by descent to K.
The factor p^{m−n} equals [K_n : K_m]⁻¹ only after a stage where every transition has degree p;
the invertibility estimates use sufficiently large m (and, for twists, sufficiently large m
for the fixed twist). Inflation–restriction from `H`
to `G_K` gives parts 1 and 2. For the general character criterion, finite inertia
image becomes unramified after a finite extension; completed unramified descent
identifies C(η) with C, and finite Galois descent gives the one-dimensional groups.
For infinite inertia image, apply the Tate–Sen axioms to the splitting tower of η
and its twisted generator, as in Brinon–Conrad §14.3; the cyclotomic calculation
alone is used only for χ^i. (Tate 1967, §3.3, Theorems 1 and 2, pp. 176–177: parts 1 and 2 for
this `K`; Brinon–Conrad 2009, Theorem 2.2.7, p. 15: all three parts, proved in §14 through the
Tate–Sen axioms, Theorem 14.3.4; Stix 2012, Theorem 88: parts 1 and 2, as used for Tate's Hodge–Tate
decomposition.)

The general-base completion also has the unique isometric extension, identity and composition API of §1.1 and the closed-subgroup fixed-point theorem of §1.2, with the completed fixed field in place of L̂. Extend the normalized-trace bounds and the twist-dependent Banach calculation of §§1.3–1.4 on this domain; these are ingredients of the theorem, not finite-type procyclic substitutions.

The API:

- `tateSen_H0`: `(C(i))^{G_K} = K` for `i = 0` and `0` otherwise.
- `tateSen_H1`: `H¹_cont(G_K, C(i)) = 0` for `i ≠ 0`, and `H¹_cont(G_K, C) = K · [log χ]`.
- `tateSen_character`: the statement for `C(η)`, split by whether `η(I_K)` is finite.
- `normalisedTrace`: the continuous `K_m`-linear projection `R_m : K̂_∞ → K_m`, `Γ`-equivariant,
  equal to the identity on `K_m`.

*Needs:* §§0.1–0.2, 1.1–1.4; Mathlib continuousCohomology, PadicComplex, Field.absoluteGaloisGroup and nonarchimedean completion; LocalFieldsRamification Layer 3 (the different and cyclotomic ramification); LocalGaloisGroups Layer 5; PerfectoidSpaces §§P1.10–P1.11, P1.31, P3.7, P3.12 (perfectoid fields and almost finite étale extensions); PerfectoidTowers P9.0 (continuous-cochain comparison).

**Checks.**

- `tateSen_cyclotomic_twist`: `C(1)^{G_K} = 0`; forgetting the twist (letting `g` act on `C` as `g`
  alone) gives invariants `K ≠ 0`.
- `tateSen_trivial`: `C^{G_K} = K`: in particular `C^{G_K}` contains no transcendental element, and
  is not `K̂_∞` or `C`.
- `tateSen_unramified_character`: for `K = ℚ_p`, `p` odd, and the unramified character `η` with
  `η(Frob) = 1 + p` (image `1 + pℤ_p ≅ ℤ_p`, infinite, with `η(I_K) = 1`), `C(η)^{G_K}` is
  one-dimensional over `K`; the criterion is finiteness of `η(I_K)`, not of `η(G_K)`.
- `tateSen_H1_trivial_ne_zero`: the class of `log χ` in `H¹_cont(G_K, C)` is nonzero, so a statement
  "`H¹_cont(G_K, C(i)) = 0` for every `i`" fails at `i = 0`.
- For K = ℚ₃(ζ₉), K₁ = K₂ = K: at n ≥ 2 the degree is [K_n : K₁] = 3^{n−2}.
  Degree-normalized trace sends 1 to 1; the expression 3^{1−n}Tr sends it to 1/3.

## 3. The principal Fontaine divided-power envelope

**The local envelope prerequisite — `periodPDEnvelope`.** Let C be a complete algebraically closed nonarchimedean field of characteristic zero and residue characteristic p, O_C its valuation ring, A = W(O_C^♭), and θ:A→O_C the supplied Fontaine map. Let ξ generate ker θ, with ξ modulo p a nonzerodivisor, so (p,ξ) is a regular sequence. This section constructs the principal period envelope, denoted `periodPDEnvelope`, on precisely this domain. It includes its divided-power algebra prerequisites and universal property; no general crystalline-site or arbitrary-ideal envelope theory is assumed.

Form D as the A-subalgebra of A[1/p] generated by ξⁿ/n! for n≥1. Construct the divided-power ideal J₀ generated by these positive divided powers and the powers γ_n on it. Prove the divided-power identities, closure on sums and products, and independence of the primitive generator. Extend the canonical divided powers on (p) to J=J₀+pD, proving compatibility on the intersection. Constructing these operations is part of the target: use the existing DividedPowerAlgebra, construct its augmentation and its augmentation-ideal powers in this principal presentation, and impose the relation x=ξ. Prove that the presentation embeds into A[1/p] by the regular-sequence argument, with image D, that D has no p-torsion, and that D/J₀ ≅ O_C. The canonical base is (ℤ_p,(p),γ), γ_n(p)=pⁿ/n!; it is not the zero divided-power base.

Give the principal universal property: for a ℤ_p-algebra E with divided-power ideal L containing p, with the canonical powers on p, and a ring map f:A→E with f(ξ)∈L, there is a unique divided-power morphism D→E extending f. Equivalently D is the base-compatible envelope of (p,ξ), with distinguished sub-PD ideal J₀ generated by ξ. Prove its lift API, uniqueness, functorial maps for maps of these Fontaine data, identities and composition. The quotient by J is O_C/p; the quotient by J₀ is O_C.

Define A_cris(O_C) as the separated p-adic completion of D using Mathlib's ordinary AdicCompletion. Extend the powers to the closed PD ideal, prove p-torsion-freeness and the complete version of the initial property for p-adically complete separated E. Give θ_cris:A_cris→O_C, extending θ, killing γ_n(ξ) for n≥1, with kernel the closure of J₀ and quotient O_C. Functorial maps commute with θ_cris and completion. For a primitive roots-of-unity sequence ε, prove that
log[ε] = Σ_{n≥1}(−1)^{n−1}(n−1)! γ_n([ε]−1)
converges p-adically in A_cris. Include the p=2 convergence estimates. Changing ξ gives the unique same completed envelope fixing A; changing ε by a ℤ_p-unit rescales t by that unit.

*Source:* Fontaine, Le corps des périodes p-adiques, Theorem 2.2.1 and proof, pp. 76–77, and §§2.3.1–2.3.4, pp. 78–79; Stacks Project, §60.2 (07H7), Lemma 60.2.1 (07H8), Definition 60.2.2 (07H9) and Lemma 60.2.4 (07HC), specialized to the principal regular kernel; Bhatt, p-adic derived de Rham cohomology, §9, Proposition 9.9, p. 35; Bhatt–Morrow–Scholze, Integral p-adic Hodge theory, §3.3, Definition 3.22(i), p. 27.

*Needs:* Mathlib DividedPowers, DividedPowerAlgebra, PadicInt.dividedPowers, rational divided powers, sub-PD ideals, quotient divided powers, Witt vectors, localization and AdicCompletion; PerfectoidSpaces §§P1.10–P1.11, P1.16–P1.18 (perfectoid C, primitive kernel, θ and regularity); Mathlib p-adic series convergence for the logarithm. The algebraic augmentation, principal presentation, gluing and completion arguments just specified are local subtargets of this section.

**Checks.**

- ξⁿ=n! γ_n(ξ), and in D/p the image of ξ satisfies ξᵖ=0. Merely completing A at (p,ξ) would not create ξᵖ/p!.
- D/J₀=O_C while D/(J₀+pD)=O_C/p. Treating p as an element of ker θ would give the wrong quotient.
- Replacing ξ by a unit multiple gives the unique isomorphism fixing A and θ_cris; the same statement holds at p=2, with no inversion of 2 in D.
- The map θ_cris kills log[ε]. Localizing A_cris at log[ε] therefore cannot admit a unital extension of θ_cris to C.
- For the zero kernel over a p-torsion-free p-adically complete base already carrying the canonical powers on p, the analogous construction has D=A and completion A. It creates no independent formal PD variable.

## 4. General-base topological period rings and functors

### 4.1 Period carriers and their structure maps

**General-base period rings — `generalBasePeriodRings`.** Let K be a general p-adic field in the stated conventions, k its arbitrary perfect residue field, K₀=W(k)[1/p]⊆K, and C_K=PadicFieldCompletion of §2. C_K is a perfectoid field by PerfectoidSpaces §§P1.10–P1.11. Using its supplied tilt and Fontaine map, form
A_inf(C_K)=W(O_C^♭), A_cris(O_C) as the completed principal envelope of §3,
B_cris^+=A_cris[1/p], B_cris=B_cris^+[1/t], and B_st as the logarithmic extension of B_cris.
The de Rham carriers are Mathlib's `BDeRhamPlus O_C p` and `BDeRham O_C p`: identify them with the ker θ-adic completion of A_inf[1/p] and its localization by the §1.5 construction on C_K. Prove the valuation-ring quotient B_dR^+/(t)=C_K, complete discrete valuation structure and grⁱ B_dR=C_K(i), with Filⁱ=tⁱB_dR^+.

Give the canonical period topologies and continuous G_K-actions, extending the action through tilting, Witt vectors, the PD envelope, completion and localization. B_dR^+ carries the inverse limit of the p-adic quotient topologies, and B_dR carries the localization topology through the filtered union t⁻ⁿB_dR^+. For the crystalline carriers give the p-adic topology on A_cris and the canonical inductive limit topology through the p- and t-localizations. Give the compatible logarithmic topology on B_st. Prove continuity of multiplication, addition, the Galois actions and every structure map on these topologies; comparison with the inverse-limit descriptions is part of the target. None of these topologies is replaced by discrete coefficients or discrete residue quotients.

Construct Witt Frobenius on A_cris, including the estimate φ(ξ)∈(p,ξᵖ) needed to extend it through the divided-power envelope, and its extensions to B_cris and B_st. Embed K₀ in B_cris with σ-semilinear Frobenius. Prove φ(t)=pt, g(t)=χ(g)t, and commutation of G_K with φ. Construct A_cris→B_dR^+ by the convergent divided-power expansions and prove that log[ε] maps to the de Rham logarithm t, nonzero and a uniformizer. Give the injective maps B_cris→B_dR and K⊗_{K₀}B_cris→B_dR; the proof uses convergent divided-power expansions, not a formal inclusion of polynomial rings. The filtration on B_cris is the pullback of the de Rham filtration. The θ map is defined on the plus carriers before inverting t.

Construct B_st=B_cris[u] in a logarithmic frame, its Galois action, φ and the derivation N_p with N_p(u)=−1 and φ(u)=pu. With compatible p-power roots of p, g(u)=u+c(g)t for the Kummer cocycle c(g); prove independence of this presentation under changes of the compatible roots. Prove N_p φ=pφN_p, Galois commutation, ker N_p=B_cris and compatibility of the extending Frobenius. A chosen logarithm branch fixes the injective B_st→B_dR and its pullback filtration. State its transformation under a change of branch and distinguish structures intrinsic to B_st from this chosen filtered embedding. For ord_K(π)=1 retain N=eN_p, e=ord_K(p), throughout scalar extension and functoriality.

Supply functorial maps for continuous valued embeddings of the base fields with compatible algebraic closures and logarithmic choices. They commute with θ on plus carriers, φ, Galois restriction, N_p and filtrations. Prove identity and composition, independence of primitive θ-kernel generators and Tate generators, and compatibility with the completion universal properties. When K is finite over ℚ_p, the completed-field and de Rham identifications are exactly §§1.1 and 1.5; no additional finite-K crystalline or semistable comparison contract is assumed.

*Construction and source:* Brinon–Conrad, Definition 1.3.1, p. 7, §§4.3–4.4, pp. 49–55, §9.1, pp. 128–135, and §9.2, pp. 135–146. Fontaine, Le corps des périodes p-adiques, §§1.5.1–1.5.7, pp. 71–74; Theorem 2.2.1, pp. 76–77; §§2.3.1–2.3.4, pp. 78–79; §§3.1–3.2 and §4.2, pp. 79–86; §4.1, pp. 83–84, and Theorem 4.2.4, p. 86, proof §4.3, pp. 87–89. Apply the perfectoid primitive-kernel API, then §3's principal envelope and its completion. Identify the de Rham carriers by their universal properties and extend the action and period maps by continuity.

*Needs:* §§1.1, 1.5, 2, 3; PerfectoidSpaces §§P1.6, P1.10–P1.11, P1.16–P1.18 (tilts, perfectoid fields, Witt vectors and primitive θ-kernel); Mathlib BDeRhamPlus, BDeRham, Witt Frobenius, ordinary completions, localizations, polynomial rings and continuous maps.

**Checks.**

- K=ℚ_p gives the same Mathlib PadicComplex, BDeRhamPlus and BDeRham as §1, with the same θ and t. A second de Rham completion with discrete quotient topology fails this check.
- K=Frac W(𝔽_p(s)^perf) is allowed despite being infinite over ℚ_p; K₀=K, and no finite-residue-field or local compactness assumption is inserted.
- φ(t)=pt and N_pφ=pφN_p; assigning φ(u)=u would violate the latter identity on u.
- θ(t)=0 before localization, so no unital θ:B_cris→C_K exists. The crystalline-to-de Rham map is nevertheless injective.
- Changing log(p) changes the filtered embedding of B_st in B_dR. Its underlying B_cris-algebra, Frobenius and p-normalized monodromy retain their presentation-independent identifications.

### 4.2 The general-base invariant functors

**Covariant and contravariant period functors.** For a finite-dimensional continuous ℚ_p-representation V of G_K, define
`D_cris(V)`=(B_cris⊗_{ℚ_p}V)^{G_K}, `D_st(V)`=(B_st⊗_{ℚ_p}V)^{G_K},
and D_dR(V)=(B_dR⊗_{ℚ_p}V)^{G_K}. Use K₀ as the scalar field for the first two, and K for the last. Tensor products with finite-dimensional V carry their canonical finite-product topology, independent of the basis. The induced Frobenius, monodromy and filtrations descend from §4.1; the crystalline and semistable filtrations are on K⊗_{K₀}D. Define D*_st(V)=D_st(V^∨) and D*_cris(V)=D_cris(V^∨), retaining their contravariance.

Construct the functors on equivariant linear maps, with identity, composition, zero, finite direct sums, scalar maps and Tate twists. Supply the natural tensor and dual comparison maps as maps of the actual invariant modules; no tensor equivalence is asserted for arbitrary representations. Carry finite coefficient fields E/ℚ_p by scalar restriction and the commuting E-action on invariants, not by an unspecified Frobenius action on E. Prove D_cris(V)=D_st(V)^{N_p=0} as structured K₀-modules, and hence also for the nonzero scalar multiple N=eN_p.

*Source:* Brinon–Conrad, §9.1, pp. 128–135 and §9.2, pp. 135–146, crystalline and semistable invariant functors and regularity; Fontaine, Représentations p-adiques semi-stables, §§5.1.1–5.1.7, pp. 155–157, invariant modules and the N=0 comparison. These are general-base carrier functors; the consumer's finite-K realization comparisons are separate targets.

*Needs:* §4.1; Mathlib finite-dimensional representations, tensor products, duals, invariants, semilinear maps and filtrations; PerfectoidTowers P9.0 for the canonical continuous-cochain interpretation whenever a cohomological invariant is used.

**Checks.**

- V=0 gives zero for all three functors; their maps on zero spaces and finite direct sums agree with the corresponding invariant-module maps.
- V=ℚ_p(1) has D_cris generated by t⁻¹, φ=p⁻¹σ and filtration jump −1. D*_cris is generated by t, φ=pσ and jump +1. The same underlying invariant convention cannot give both functors the same twist.
- For ramified K, D_st and D_cris are K₀-spaces while D_dR is a K-space; extending the filtration does not change the original scalar field of D_st.
- The N_p=0 part of D_st agrees with D_cris on actual tensor invariants; replacing N_p by zero on all of B_st would incorrectly identify every semistable period with a crystalline period.

### 4.3 Fixed fields, regularity and the fundamental period identity

**General-base period identities.** For the same K and its canonical period topologies, prove B_cris^{G_K}=B_st^{G_K}=K₀ and B_dR^{G_K}=K. Prove regularity of the period rings in the sense used by the invariant comparison: the canonical maps B⊗_{B^{G_K}}D_B(V)→B⊗_{ℚ_p}V are injective and D_B(V) has dimension at most dim_{ℚ_p}V; Galois-stable period lines satisfy the invertibility criterion that makes equality equivalent to the map being an isomorphism. Define the crystalline, semistable and de Rham predicates by dimension equality with dim_{ℚ_p}V, and prove the equivalence to the canonical comparison-map isomorphism formulation using this regularity. In particular `generalBasePeriodRings` carries these invariant and regularity identities as well as the inherited structures.

Prove the G_K-equivariant fundamental exact sequence
0 → ℚ_p → B_cris^{φ=1} → B_dR/Fil⁰ B_dR → 0,
with the inclusion of constants followed by the crystalline-to-de Rham map modulo B_dR^+. Exactness is asserted on these topological carriers as underlying ℚ_p-vector spaces; constructing the finite-K continuous sections, connecting maps and arithmetic comparison contracts is the downstream consumer's work.

Use §2's Tate–Sen calculation on the de Rham graded quotients and their completed inverse limit; use convergent PD expansions, Frobenius estimates, the logarithmic construction and the period-line regularity argument for the crystalline and semistable identities. Include the construction of the fundamental-sequence surjectivity, not merely its name. All fields with the specified perfect residue field are covered, without reducing them to finite extensions of ℚ_p.

*Source:* Brinon–Conrad, §§4.3–4.4, pp. 49–55, §9.1, pp. 128–135 (fundamental exact sequence), and §9.2, pp. 135–146 (semistable periods and regularity); Fontaine, Le corps des périodes p-adiques, §1.5.7, p. 74; Fontaine, Représentations p-adiques semi-stables, Proposition 1.4.2, pp. 123–124, Proposition 5.1.2 and Lemma 5.1.3, pp. 155–156.

*Needs:* §§0.2, 1.4, 2, 3, 4.1–4.2; PerfectoidTowers P9.0 (cochains into limits and canonical topological-coefficient comparison); Mathlib invariants, finite-dimensional linear algebra, ordinary completion and localization.

**Checks.**

- For K=Frac W(𝔽_p(s)^perf), B_cris and B_st have fixed field K₀=K and B_dR has fixed field K. Substituting ℚ_p for those constants fails.
- The kernel of B_cris^{φ=1}→B_dR/B_dR^+ is ℚ_p. Although B_cris^{G_K}=K₀, its Frobenius-fixed constants in this kernel are ℚ_p, not K₀ for arbitrary k.
- For the trivial representation, D_cris=D_st=K₀ and D_dR=K, and each period comparison map is the identity after scalar extension.
- For the Tate line ℚ_p(n), the period is t⁻ⁿ, Frobenius is p⁻ⁿσ, and the filtration jump is −n. In degree zero the fixed-field statements agree with §2; the nonzero log χ class in degree one cannot be replaced by vanishing of all C_K-cohomology.

## References

- Olivier Brinon and Brian Conrad, [CMI summer school notes on p-adic Hodge theory](https://math.stanford.edu/~conrad/papers/notes.pdf), 2009; locators use printed pagination.
- Jean-Marc Fontaine and Yi Ouyang, [Theory of p-adic Galois representations](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf); locators use printed pagination.
- Jean-Marc Fontaine, [Le corps des périodes p-adiques](https://www.numdam.org/item/AST_1994__223__59_0.pdf), Astérisque 223 (1994), 59–111.
- Jean-Marc Fontaine, [Représentations p-adiques semi-stables](https://www.numdam.org/item/AST_1994__223__113_0.pdf), Astérisque 223 (1994), 113–184.
- James Ax, Zeros of polynomials over local fields — the Galois action, Journal of Algebra 15 (1970), 417–428.
- Jakob Stix, [A course on finite flat group schemes and p-divisible groups](https://www.math.uni-frankfurt.de/~stix/skripte/STIXfinflatGrpschemes20120918.pdf), 2012, Theorem 88.
- John Tate, p-divisible groups, Proceedings of a Conference on Local Fields, Springer (1967), 158–183.
- Karl Rubin, [Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), 1999 draft, Appendix B; both printed and PDF pagination are given in §0.
- Jürgen Neukirch, Alexander Schmidt and Kay Wingberg, Cohomology of Number Fields, second edition, Springer (2008).
- [Stacks Project, Divided power envelope, §60.2](https://stacks.math.columbia.edu/tag/07H7).
- Bhargav Bhatt, [p-adic derived de Rham cohomology](https://arxiv.org/abs/1204.6560), §9.
- Bhargav Bhatt, Matthew Morrow and Peter Scholze, [Integral p-adic Hodge theory](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §3.3.

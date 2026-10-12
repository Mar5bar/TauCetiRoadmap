# Roadmap: foundations of adic spaces, part III — formal geometry, formal models and coherent sheaves

**Summary.** Part III supplies the formal and coherent side of the adic-space programme. Layer F0
builds noetherian formal geometry after EGA I §10 and EGA III §§4–5: adic rings, the formal
spectrum and formal schemes, completion of schemes and coherent sheaves along closed subsets,
coherent formal modules, the theorem on formal functions, Grothendieck's existence theorem and
formal GAGA. Layer R2 develops formal models over a complete rank-one valuation ring `O_K`, not
assumed discretely valued: algebras topologically of finite presentation, admissible formal
schemes and their generic fibres, specialisation and tubes, admissible blow-ups and Raynaud's
theorem, flattening after Bosch–Lütkebohmert and Raynaud–Gruson, formal completions and good
reduction, smooth formal schemes and Frobenius lifts, and fractional valuation bounds, section
domains and Hasse domains. Layer R3 develops coherent sheaves on adic spaces: Huber's and Tate's
acyclicity for finite modules, Kiehl's glueing theorem, quasi-Stein spaces, vector bundles and
uniform rings, the sheaf of continuous differentials, Kiehl's proper mapping theorem, proper GAGA,
traces of finite locally free morphisms with the pull–identify–trace operators used for Hecke
correspondences, and the Gel'fand spectrum of a Banach ring. These are the inputs for families
and dagger geometry, étale and `p`-adic Hodge theory, and the integral models and Hasse domains of
modular curves and Shimura varieties.

| Layer | Title | What it builds |
|---|---|---|
| F0 | Formal geometry | adic rings, `Spf` and formal schemes, completion, coherent formal modules, formal functions, existence and algebraisation |
| R2 | Formal schemes, generic fibres and Hasse domains | tfp algebras, admissible formal schemes, generic fibres, Raynaud's theorem, flattening, good reduction, Hasse domains |
| R3 | Coherent sheaves and finite traces | `M̃`, Tate and Kiehl, vector bundles, the proper mapping theorem, GAGA, traces, the Gel'fand spectrum |

## Scope and ownership

Part III owns layers F0, R2 and R3. [AdicSpaces](../AdicSpaces/README.md) owns the adic-space
foundations (valuation spectra, rational subsets, the structure presheaf, sheafiness of strongly
noetherian and stably uniform Tate rings); [AdicSpacesPartII](../AdicSpacesPartII/README.md) owns
rings of noetherian type, adic homomorphisms, completed tensor products of Huber pairs, the
morphism classes of adic spaces, `K`-affinoid algebras, rigid spaces and the analytification and
rigid–adic functors, which Part III uses by label. Serre's theorems on ample sheaves and Chow's
lemma are SchemeAndStackFoundations layers SF.2 and SF.4; F0 states the forms it needs, and the
formal-scheme statements of SF.4 on the inductive-system carrier are transported to F0's locally
ringed carrier. The Deligne–Rapoport moduli of generalised elliptic curves with its formal group
along the identity section is stated in R2 for Conrad's Hasse domains. The Gel'fand spectrum
(R3.9) and the classical traces of finite projective algebras (R3.8) are cited by PerfectoidSpaces
(P0.12, P0.15, P1.12) and DiamondsAndVStacks (D5.13).

## Conventions

1. Huber pairs, pairs of definition and morphisms of pairs are Tau Ceti's `Huber.Pair`,
   `Huber.PairOfDefinition` and `Huber.Pair.Hom`.
2. Complete includes Hausdorff (separated) for rings, modules and pairs.
3. An adic ring is an adic ring of finite ideal type: complete and separated for the `I`-adic
   topology of a finitely generated ideal `I`; the topology is part of the data, and morphisms of
   adic rings are continuous ring homomorphisms. Scheme means Mathlib's `Scheme`; every scheme is
   a formal scheme with discrete affine rings.
4. Adic spaces are the objects of `TauCeti.AdicSpace`. A Huber ring is of noetherian type if it has
   a noetherian ring of definition or is a strongly noetherian Tate ring (AdicSpacesPartII's
   `Huber.IsNoetherianType`).
5. `K` is complete for a nontrivial rank-one nonarchimedean absolute value, `O_K = K°`, `ϖ` a
   pseudouniformiser, `k` the residue field, `Spa K = Spa(K, O_K)`. `O_K` is noetherian only when
   `K` is discretely valued; no statement assumes this unless it says so. `O_K` and every
   `O_K`-algebra carry the `ϖ`-adic topology, never the `𝔪_K`-adic one.
6. Completed tensor products are formed along adic structure maps; fibre products carry their own
   existence and sheafiness hypotheses (AdicSpacesPartII R0).
7. `|f| ≤ |g|^{a/b}` means `v(f^b) ≤ v(g^a)`; no root of `g` is assumed. Tubes and strict Hasse loci
   are interiors of preimages under specialisation.
8. Coherent sheaves are defined on locally noetherian adic spaces; vector bundles on every adic
   space, matching finite projective modules on sheafy Tate affinoids.
9. The trace of an endomorphism of a finite projective module is the contraction of its preimage
   in `M^∨ ⊗ M`; Mathlib's `LinearMap.trace` is used only for free modules, where it agrees. A
   trace is never defined as a sum over geometric points.
10. The thickening `Xₙ = V(I^{n+1} 𝒪_X)` of a scheme over `Spec A` is encoded by the universal
    quotient `F ⧸ I^{n+1} F` of an `𝒪_X`-module (`IsPowQuotient`); cohomology on `Xₙ` is
    cohomology on `X` of the quotient.

## Exact supplier contracts

| Supplier | Exact file | Contract used |
|---|---|---|
| `IsAdic`, `WithIdeal`, `IsAdicComplete`, `AdicCompletion`, `AdicCompletion.of` | `Mathlib/Topology/Algebra/Nonarchimedean/AdicTopology.lean:158,237`; `Mathlib/RingTheory/AdicCompletion/Basic.lean:56,171` | Adic topologies, the topology of a chosen ideal, adic completeness (separated and precomplete) and completion. |
| `TauCeti.Huber.IsHuberRing`, `IsTateRing`, `PairOfDefinition`, `isHuberRing_of_isAdic` | `TauCeti/RingTheory/Huber/Basic.lean:156,192,142`; `TauCeti/RingTheory/Huber/Adic.lean:124` | Huber and Tate rings; an adic ring with a finitely generated ideal of definition is Huber. |
| `TauCeti.Huber.restrictedMvPowerSeriesCompletion`, `weightedX` | `TauCeti/RingTheory/Huber/WeightedRestrictedSeries/Completion.lean:105`; `Basic.lean:747` | Restricted power series `A⟨T₁, …, T_r⟩` and its variables. |
| `TauCeti.Huber.PairOfDefinition.locUniformSpace`, `toCompletionLoc`, `hasDenominatorPower_of_isOpen_span` | `TauCeti/RingTheory/Huber/LocalizationTopology/Completion.lean:120,238`; `Basic.lean:411` | The completed rational localisation `A⟨T/s⟩` and its structure map. |
| `TauCeti.Huber.IsStronglyNoetherian`, `TauCeti.Huber.IsUniform` | `TauCeti/RingTheory/Huber/StronglyNoetherian.lean:135`; `Uniform.lean:65` | Strong noetherianness; uniformity as boundedness of `A°`. |
| `TauCeti.Huber.IsSheafyForEveryPresentation` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/SheafForEveryPresentation.lean:75` | Sheafiness of `Spa(A, A⁺)` on rational subsets, for the simple Laurent glueing square. |
| `TauCeti.ValuationSpectrum.laurentCover_injective`, `laurentCover_exact`, `laurentCover_surjective` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Localization/LaurentCover/Basic.lean:706,566,621` | Exactness of the structure presheaf on a simple Laurent cover of a strongly noetherian Tate ring; R3 adds finite modules and the noetherian-ring-of-definition case. |
| `TauCeti.ValuationSpectrum.spa`, `rationalSubset` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean:101`; `RationalSubset/Basic.lean:142` | `Spa(A, A⁺)` and rational subsets, in which fractional bounds are expressed. |
| `AlgebraicGeometry.Scheme.Modules.Cohomology`, `cohomologyMapBaseLinear`, `globalSectionsSmul`, `baseRingToGlobalSections` | `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61`; `Cohomology/Module/Base.lean:57`; `Modules/GlobalSections.lean:46,199` | Sheaf cohomology of `𝒪_X`-modules with its base-linear functoriality, and multiplication by base scalars, for formal functions and existence. |
| `SheafOfModules.IsFinitePresentation`, `AlgebraicGeometry.IsProper` | `Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean:269`; `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:41` | Coherent modules on locally noetherian schemes; proper morphisms. |
| `dualTensorHomEquiv`, `contractLeft`; `LinearMap.trace` | `Mathlib/LinearAlgebra/Contraction.lean:283,51`; `Mathlib/LinearAlgebra/Trace.lean:75` | The projective trace; Mathlib's trace, which is `0` without a finite basis. |
| `MulRingSeminorm`, `normRingSeminorm`, `smoothingFun`, `IsPowMul` | `Mathlib/Analysis/Normed/Unbundled/RingSeminorm.lean:61,191`; `SmoothingSeminorm.lean`; `Mathlib/Basic/Real/Basic.lean:563` | Multiplicative seminorms and the spectral seminorm `lim ‖xⁿ‖^{1/n}`. |
| AdicSpacesPartII `Huber.IsNoetherianType`, `Huber.IsAdicHom`, `AdicSpace.IsLocallyNoetherian`, `AdicSpace.IsProper`, `AdicSpace.Smooth`, `AdicSpace.Etale`, `AdicSpace.Flat`, `RigidSpace.IsAffinoidSubdomain` | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | Rings of noetherian type, adic maps, and the morphism classes and affinoid subdomains used by R2 and R3. |
| SchemeAndStackFoundations SF.0, SF.2, SF.4; StableReduction layers 2, 4; JacobianChallenge B, C; AlgebraicVectorBundles L0A, L0B; ModularCurves 0E | roadmaps | Scheme-level inputs cited by label at the targets: Serre's theorems, Chow's lemma, flattening by blow-up, strict transforms, coherence of proper direct images, affine acyclicity and Čech comparison, flat base change, internal Homs, faithfully flat descent. |

## How to read the build

`Suggested.lean` carries the parts of this roadmap that are a few lines over the pinned carriers:
adic rings, completed localisations and tensor products, finite modules as adic systems, formal
functions and Grothendieck existence on schemes proper over an adic noetherian ring, algebras
topologically of finite presentation, Frobenius lifts, fractional valuation bounds, glueing squares
and Kiehl's theorem, finite-module acyclicity on Laurent covers, uniform Banach rings, the
Gel'fand spectrum and projective traces. Formal schemes, coherent sheaves on adic spaces and
everything built on them are stated here only. Each target is one paragraph: statement with
hypotheses, source locator, the discriminating Checks and, when there is one, its Lean carrier;
a target without a Lean note is stated in this README only.

## Layer F0: formal geometry

F0 builds noetherian formal geometry after EGA I §10 and EGA III §§4–5, from adic rings to
Grothendieck existence and algebraization, over Mathlib's schemes, adic completion and Tau Ceti's
coherent cohomology. FK pages follow [arXiv:1308.4734v5](https://arxiv.org/pdf/1308.4734v5);
existence and algebraization cite EGA III₁, §5, pp. 149–158. Complete includes separated; an adic
ring includes its topology; schemes need not be separated; `Spf A` and formal schemes are locally
ringed spaces with section topologies from the sheaf; schemes are formal schemes (discrete rings).

### F0.1 Adic rings

**Adic rings.** (*adic-ring*) An ideal of definition of a topological ring `A` is an open ideal `J`
with some `J^n` (`n ≥ 1`) in each neighbourhood of `0` (EGA I Ch. 0, 7.1.2, p. 60); `A` is adic (of
finite ideal type) if `I`-adic and `I`-adically complete, `I` finitely generated (7.1.9, p. 62),
adic noetherian if noetherian; maps are continuous. `J` is one iff open with some `J^n ⊆ I`, and
then `A` is `J`-adically complete (7.1.4(i); 7.1.9, p. 62); `φ : A → B` is continuous iff
`φ(I) ⊆ √I_B`, iff `φ(I)` is topologically nilpotent; `A` is Huber with pair of definition `(A, I)`;
for noetherian `A`, `√I` is the largest one (7.1.6–7.1.7), ideals are closed and `A ⧸ 𝔞` is adic
noetherian for `I·(A ⧸ 𝔞)` (7.3.5), as are complete noetherian local rings (`𝔪`-adic). Checks: `ℤ_p`
with the `p`-adic topology and every discrete ring (ideal of definition `0`) are adic; `ℚ_p` is not,
its only open ideal being `ℚ_p`; a field is adic exactly for the discrete topology. Lean:
`IsAdicRing`, `IsAdicRing.ideal`, `IsAdicRing.isHuberRing`; rest README.

**Noetherian completions.** (*adic-completion-noetherian*) For a finitely generated ideal `I` of
`R`: (i) if `R` is `I`-adically complete and `R ⧸ I` noetherian, `R` is noetherian (EGA I Ch. 0,
7.2.6, p. 64); (ii) if `R` is noetherian, `R̂ = AdicCompletion I R` is noetherian and
`I·R̂`-adically complete with `I^n R̂ = ker(R̂ → R ⧸ I^n)`, hence adic noetherian (7.2.12; 7.3.1, p.
66). Check: `k[X₀, X₁, …]` is complete for `I = 0` and not noetherian, so the hypothesis on `R ⧸ I`
is needed. Lean: (i) `isNoetherianRing_of_isAdicComplete`, (ii) `IsAdicRing.adicCompletion`.

**Completed localisation.** (*completed-localization*) For `A` adic with ideal of definition `I` and
`f ∈ A`, the `I·A_f`-adic completion `A_{f}` of `A_f` is adic for `I·A_{f}`,
`A_{f} ⧸ I^{n+1} ≅ (A ⧸ I^{n+1})_f` (EGA I Ch. 0, 7.6.1–7.6.2, 7.6.15), independent of `I`, equal to
the Huber `A⟨1/f⟩`, zero iff `f` is nilpotent mod `I`; `A → A_{f}` is universal for continuous maps
inverting `f` to complete separated linearly topologised rings (7.6.6, p. 73); for noetherian `A`,
`A_{f}` is noetherian and `A`-flat (7.6.11, 7.6.13, p. 74); continuous `A`-maps `A_{f} → A_{g}`
exist, uniquely, iff `g ∈ √(fA + I)`; for open primes `p`, `colim_{f ∉ p} A_{f}` is local, residue
field `Frac(A ⧸ p)`, noetherian if `A` is (7.6.17, p. 75; 7.6.18). Lean: `AdicRing.CompletedAway`
with `CompletedAway.isAdicRing`, `CompletedAway.isNoetherianRing_flat`,
`CompletedAway.existsUnique_lift`; rest README.

**Restricted power series.** (*restricted-power-series-adic*) For `A` adic with ideal of definition
`I`, `A{T₁,…,T_r}` (coefficients tending to `0`; EGA I Ch. 0, 7.5.1, pp. 69–70) is (i) adic for
`I·A{T}`, with `A{T} ⧸ I^{n+1} ≅ (A ⧸ I^{n+1})[T]`; (ii) noetherian if `A` is (7.5.4(ii), p. 71);
(iii) free on the `T_i` (images arbitrary) among complete separated linearly topologised
`A`-algebras (7.5.3, p. 70; 7.5.2). Lean: (ii)
`IsAdicRing.isNoetherianRing_restrictedMvPowerSeriesCompletion`; (i), (iii) README.

**Topologically finite type.** (*topologically-finite-type-criterion*) For `A` adic noetherian with
ideal of definition `I` and continuous `A → B`, `B` complete separated linearly topologised,
equivalent (EGA I Ch. 0, 7.5.5, p. 71): (a) `B` is noetherian and `IB`-adic with `B ⧸ IB` of finite
type over `A ⧸ I`; (b) `B = lim B ⧸ I^{n+1}B` with `B ⧸ I²B` of finite type over `A ⧸ I²`; (c)
`B ≅ A{T₁,…,T_r} ⧸ 𝔞` topologically, `𝔞` closed (7.5.5 c), p. 71).

**Completed tensor products.** (*completed-tensor-product-adic*) For adic `A → B`, `A → C` (`I_A·B`,
`I_A·C` ideals of definition), ideals of definition `I_B`, `I_C`, and
`J = (I_B ⊗ 1, 1 ⊗ I_C) ⊆ B ⊗_A C`, `B ⊗̂_A C` is the `J`-adic completion (EGA I Ch. 0, 7.7.1, p.
75): adic for `J`, independent of `I_B`, `I_C`, with the quotients of `B ⊗_A C` mod `J^{n+1}`, so
equal to `lim (B ⧸ I_B^{n+1}) ⊗_A (C ⧸ I_C^{n+1})`; continuous `A`-maps to complete separated
linearly topologised `D` are pairs of such maps on `B`, `C` (7.7.6; EGA I Ch. I, proof of 10.7.2, p.
193), functorially; `A{S} ⊗̂_A C ≅ C{S}`; noetherian if `A`, `C` are and `B` is topologically of
finite type (10.13.5), not always (10.7.4, p. 194). Lean: `AdicRing.CompletedTensorProduct` with
`CompletedTensorProduct.isAdicRing`, `CompletedTensorProduct.existsUnique_lift`,
`CompletedTensorProduct.isNoetherianRing`; rest README.

**Mittag-Leffler systems.** (*mittag-leffler-exactness*) For exact `0 → (A_n) → (B_n) → (C_n) → 0`
of `ℕ`-systems of abelian groups: (i) if `(B_n)` is Mittag-Leffler so is `(C_n)`, and `(A_n)`,
`(C_n)` imply `(B_n)` (EGA III₁ Ch. 0, 13.2.1); (ii) if `(A_n)` is, `lim` is exact (13.2.2, p. 66);
(iii) artinian or surjective systems are (13.1.2, p. 65).

**Finite modules as systems.** (*finite-module-inverse-limit*) For `A` adic noetherian with ideal of
definition `I`: (i) on finite `M` the `I`-adic topology is the quotient topology of any `A^r ↠ M`;
linear maps are strict (EGA I Ch. 0, 7.3.6, p. 68; 7.2.10); (ii) for finite `A ⧸ I^{n+1}`-modules
`M_n`, `M_{n+1} ↠ M_n` of kernel `I^{n+1}M_{n+1}`, `M = lim M_n` is finite, `M ⧸ I^{n+1}M ≅ M_n`
(7.2.9, p. 65); (iii) `M ↦ (M ⧸ I^{n+1}M)_n` is fully faithful (7.2.10, p. 65), an equivalence
(Stacks Tag 087W, Lem. 30.23.1). Lean: (ii) `IsAdicRing.finite_limit`; (i), (iii) README.

### F0.2 The formal spectrum

**The formal spectrum.** (*formal-spectrum*) For `A` adic with ideal of definition `I`, `Spf A` is
the locally ringed space on open primes `V(I)`, homeomorphic to each `Spec(A ⧸ I^{n+1})` (EGA I Ch.
I, 10.1.1–10.1.2, pp. 180–181; Stacks Tag 0AHY, §87.2), with the limit of their sheaves (10.1.2, p.
181). `Γ(Spf A, O) ≅ A` (10.1.3, p. 181); the `D(f)` form a basis, `(D(f), O|) ≅ Spf A_{f}` (10.1.4,
p. 181); stalks are `colim_{f ∉ p} A_{f}`, residue field `Frac(A ⧸ p)`, noetherian if `A` is
(10.1.5–10.1.6, p. 182); continuous `B → A` induce `Spf A → Spf B` (10.2.1); `Spec(A ⧸ J) → Spf A`
is a homeomorphism with surjective sheaf map of kernel `J^Δ` (10.3.2, p. 184); `Γ(U, O)` (`U`
quasi-compact) has the limit topology, `I`-adic on `A`.

**Independence of the ideal.** (*spf-ideal-independence*) Ideals of definition `I`, `J` give
canonically isomorphic spectra over `V(I) = V(J)`, compatibly with sections and with the maps from
`Spec A ⧸ I^{n+1}` and `Spec A ⧸ J^{m+1}`, both being EGA's limit over all ideals of definition (EGA
I Ch. I, 10.1.1, pp. 180–181; EGA I Ch. 0, 7.1.8–7.1.9, p. 62).

**Morphisms into `Spf A`.** (*spf-morphism-correspondence*) For a formal scheme `X` and `A` adic
with finitely generated ideal of definition `I`, morphisms `X → Spf A` are the `φ : A → Γ(X, O_X)`
continuous on affine opens, i.e. killing `I` in each `κ(x)` (EGA I Ch. I, 10.2.2; 10.4.6, p. 186);
so `Hom(Spf B, Spf A) = Hom_cont(A, B)` (after 10.2.2, p. 183; Stacks Tag 0AHY, §87.2, eq.
87.2.0.1), `Spf` is fully faithful, maps are continuous on sections (10.4.5).

### F0.3 Formal schemes, ideals of definition and thickenings

**Thickening colimit, finite ideal type.** (*thickening-colimit-finite-ideal-type*) For `X` of
finite ideal type (no noetherian hypothesis) and `𝒥` an ideal of definition of finite type
(`𝒥|_U = J^Δ`, `J` finitely generated, on affine `U = Spf A`), `X_n = (X, O_X/𝒥^{n+1})`: (i)
`J^Δ = J·O_U` and `(𝒥|_U)^{n+1} = (J^{n+1})^Δ`, so the `𝒥^{n+1}` are a fundamental system and
`X_n|_U = Spec(A ⧸ J^{n+1})` (FK Ch. I, §1.1(d), Prop. 1.1.19, pp. 259–260, Cor. 1.1.21, p. 260,
Cor. 1.1.24, p. 261); (ii) `(X_n)` is an adic thickening system; (iii) `X = colim X_n` in formal
schemes (EGA I Ch. I, 10.6.2, p. 189; FK Ch. I, §1.4(a), Prop. 1.4.1, p. 266).

**Maps as systems, finite ideal type.** (*morphisms-as-compatible-systems-finite-ideal-type*) For
`X`, `Y` of finite ideal type with ideals of definition of finite type `𝒥`, `𝒦`: (i) if
`f^*(𝒦)O_X ⊆ 𝒥` then `f^*(𝒦^{n+1})O_X ⊆ 𝒥^{n+1}` and unique compatible `f_n : X_n → Y_n` exist (EGA
I Ch. I, 10.5.6; 10.6.7, p. 191); (ii) `f ↦ (f_n)` is bijective onto compatible sequences (10.6.8
and proof of 10.6.9, p. 192); (iii) over `S` with such an ideal `ℒ`, `p^*(ℒ)O_X ⊆ 𝒥` and
`q^*(ℒ)O_Y = 𝒦`, all `S`-maps satisfy (i) and `Hom_S(X, Y) ≃ lim_n Hom_{S_n}(X_n, Y_n)` (10.6.11;
for `𝒥 = ℒO_X`, FK Ch. I, Ex. I.1.7, p. 281).

**Adic systems, finite ideal type.** (*adic-systems-equivalence-finite-ideal-type*) For `S` of
finite ideal type with ideal of definition `ℒ` of finite type, `X ↦ (X ×_S S_n)_n` is an equivalence
from formal schemes adic over `S` (`ℒO_X` an ideal of definition; FK Ch. I, Def. 1.3.1) to sequences
of `S_n`-schemes with `X_m ≅ X_n ×_{S_n} S_m` (EGA I Ch. I, 10.12.3, p. 206, its noetherian step
10.12.3.1, p. 207, replaced by FK Ch. 0, §7.2(c), Prop. 7.2.12, p. 158); the inverse has
`(ℒO_X)^{n+1} = ker(O_X → O_{X_n})` (FK Ch. I, Ex. I.1.8, p. 281, solution p. 736, Prop. 1.4.3, p.
267); `X` is locally noetherian iff `X_0` is (10.6.4).

**Formal schemes.** (*locally-noetherian-formal-scheme*) A formal scheme is a locally ringed space
locally of the form `Spf A`; locally noetherian if the `A` can be noetherian, noetherian if
quasi-compact too (EGA I Ch. I, 10.4.2, p. 185); morphisms are those of locally ringed spaces, as in
EGA (10.4.5, p. 185; Stacks Tag 0AHY, §87.2). `X` is locally noetherian iff all affine `Γ(U, O_X)`
are; `Spf A` is noetherian iff `A` is (10.6.5); affine opens form a basis (10.4.3, p. 185); opens of
locally noetherian `X` are so, noetherian if quasi-compact, with noetherian stalks; affine `U` is
`Spf Γ(U, O_X)`, `J`-adic for finitely generated `J` with `√J` the sections vanishing on `U`;
schemes embed fully faithfully, keeping local noetherianity (10.4.8, p. 186).

**Gluing.** (*formal-scheme-gluing*) Locally ringed glue data with formal-scheme pieces `U_i` glue
to formal schemes covered by the open `U_i`, locally noetherian if all `U_i` are, noetherian for
finitely many noetherian `U_i`, with the universal property (EGA I Ch. 0, 4.1.7, p. 39; Ch. I,
10.4.2, p. 185; proof of 10.7.3, p. 193), compatibly with schemes.

**Ideals of definition.** (*ideal-of-definition*) `𝒥` is an ideal of definition if locally `J^Δ` on
`Spf A`, `J` a unique ideal of definition (EGA I Ch. I, 10.3.3; 10.3.5, p. 184; 10.5.1, pp.
186–187); `J^Δ = J·O` for finitely generated `J` (FK I, Prop. 1.1.20, p. 260); covers suffice
(10.3.7). `(X, O_X/𝒥)` is a scheme on `|X|`, affine (locally noetherian) if `X` is (10.5.2, p. 187);
for `𝒥` of finite type the thickenings `X_n = (X, O_X/𝒥^{n+1})` have closed transitions and
`O_X = lim O_X/𝒥^{n+1}` (10.5.3); on locally noetherian `X` powers of `𝒥` are a fundamental system
(10.5.1), uniformly if quasi-compact, and the largest, `𝒯` (vanishing sections; `√𝒥(U)` on
quasi-compact `U`), alone has reduced `X_red`, functorial (10.5.4, p. 187).

**Thickening systems.** (*colimit-of-thickenings*) For homeomorphic closed immersions
`X_n → X_{n+1}` with `𝒥_n = ker(O_n → O_0)` locally nilpotent, `ker(O_n → O_m) = 𝒥_n^{m+1}` and
`𝒥_1` of finite type (EGA I Ch. I, 10.6.3 b), c), p. 189), `X = (|X_0|, lim O_n)` is a formal
scheme, `𝒥 = ker(O_X → O_0)` an ideal of definition, `ker(O_X → O_n) = 𝒥^{n+1}`, `𝒥/𝒥² ≅ 𝒥_1`,
quotients `X_n`, functorially, (locally) noetherian with `X_0` (10.6.3, pp. 189–190; 10.6.4, p.
191); `X = Spf(lim A_n)` if `X_0 = Spec A_0` (EGA I Ch. 0, 7.2.7).

**Noetherian colimit.** (*formal-scheme-as-colimit*) On locally noetherian `X`, ideals of definition
`𝒥` exist and are of finite type, so `X = colim X_n` (EGA I Ch. I, 10.6.2, p. 189); `(X, 𝒥) ↦ (X_n)`
is an equivalence to thickening systems with locally noetherian `X_0` (10.6.4 and remark, p. 191).

**Maps as systems, noetherian case.** (*morphisms-as-compatible-systems*) For locally noetherian
`X`, `Y`: (i) `f^*(𝒦)O_X ⊆ 𝒯_X` for every `f : X → Y` (EGA I Ch. I, 10.6.10 (i), p. 192); (ii)–(iii)
of the finite-ideal-type case hold (10.6.7, 10.6.9, 10.6.11, pp. 191–193); so
`Hom(X, Y) ≃ lim_n Hom(X_n, Y_n)` for `𝒥 = 𝒯_X` (10.6.10 (ii), p. 192).

**Fibre products.** (*formal-fibre-product*) Fibre products of formal schemes of finite ideal type
exist; `Spf B ×_{Spf A} Spf C ≅ Spf(B ⊗̂_A C)` for adic maps (EGA I Ch. I, proof of 10.7.2, p. 193;
10.7.3, p. 193), and in general its ring is `lim (B/I_B^{n+1}) ⊗_A (C/I_C^{n+1})` (EGA I Ch. 0,
7.7.1); for ideals of definition of finite type with `f^*(ℒ)O_X ⊆ 𝒥`, `g^*(ℒ)O_Y ⊆ 𝒦`,
`X ×_S Y = colim X_n ×_{S_n} Y_n` and `𝒥 + 𝒦` is an ideal of definition (10.7.4, p. 194); `X ×_S Y`
is locally noetherian and of finite type over `Y` if `S`, `X`, `Y` are locally noetherian and `f` of
finite type (10.13.5 (ii), p. 209), not in general (10.7.4, p. 194).

**Carrier comparison.** (*formal-scheme-carrier-comparison*) Pairs `(X, 𝒥)` of a formal scheme of
finite ideal type and an ideal of definition of finite type, with morphisms satisfying
`f^*(𝒦)O_X ⊆ 𝒥`, are equivalent to SchemeAndStackFoundations SF.4's thickening systems (EGA I Ch. I,
10.6.2–10.6.4, 10.6.8–10.6.9, pp. 189–192; Stacks Tag 0AHY, §87.2, eq. 87.2.0.1), compatibly with
`Spf` (`(Spf A, I^Δ) ↦ (Spec A/I^{n+1})_n`; `φ(I) ⊆ √J` iff some `φ(I^k) ⊆ J`), fibre products
(termwise for adic maps with ideals from `S`), completion (`X̂ ↦ (V(𝓘^{n+1}))_n`) and, for locally
noetherian `X`, coherent modules (`F_{n+1} ⊗ O_{X_n} ≅ F_n`).

### F0.4 Adic, finite-type and proper morphisms; closed formal subschemes

**Adic morphisms.** (*adic-morphism-of-formal-schemes*) A morphism `f : X → Y` of locally noetherian
formal schemes is adic if `f^*(𝒦)O_X` is an ideal of definition for some (hence every) ideal of
definition `𝒦` of `Y`, equivalently if for some ideals of definition `𝒦`, `𝒥 ⊇ f^*(𝒦)O_X` the
reductions form cartesian squares (EGA I 10.12.1–3, pp. 206–207).

**Adic systems.** (*adic-systems-equivalence*) Over locally noetherian `S` with ideal of definition
`ℒ`, `X ↦ (X ×_S V(ℒ^{n+1}))_n` is an equivalence from adic formal `S`-schemes to adic systems with
`X_0` locally noetherian (EGA I 10.12.3–10.12.3.2, pp. 206–207; 10.6.4).

**Finite type.** (*formal-morphism-finite-type*) Over locally noetherian `Y` with ideal of
definition `𝒦`, `f : X → Y` is of finite type if `X` is locally noetherian, `f` is adic and its
reduction modulo `𝒦` is of finite type and quasi-compact (locally: without quasi-compactness);
locally `Spf(B{T}/𝔞) → Spf B` (EGA I 6.3.1; 10.13.1–6, pp. 207–209).

**Thickenings.** (*thickening-invariance*) For a thickening `Y ⊆ Y′` and `f′ : X′ → Y′` with base
change `f`, both locally of finite type, `f′` is proper (resp. finite, a closed immersion) iff `f`
is; properness needs only a thickening `X ⊆ X′` (Stacks Tag 0BPG, Lem. 37.3.4; EGA II, 5.4.5–5.4.6;
used in EGA III₁ 3.4.1, p. 119).

**Properness.** (*proper-formal-morphism*) A morphism of locally noetherian formal schemes is proper
if of finite type with proper reduction modulo any ideal of definition; a closed `Z ⊆ X` is proper
over `Y` if `Z_red ⊆ X_0` is proper over `Y_0` (EGA III₁ 3.4.1, p. 119).

**Subschemes.** (*closed-formal-subscheme*) On locally noetherian `X`, closed formal subschemes are
`(Supp(O_X/𝒜), O_X/𝒜)`, `𝒜` coherent; closed immersions (on affines `Spf(A/𝔞) → Spf A`) are adic, of
finite type, completion-stable (EGA I 10.14.1–5, pp. 209–211; 10.14.7).

**Closed immersions via reduction.** (*formal-closed-immersion-criterion*) An adic morphism of
locally noetherian formal schemes is a closed immersion iff its reduction modulo an ideal of
definition `𝒦` and `f^*(𝒦)O_X` is (EGA III₁ 4.8.10, p. 148).

### F0.5 Completion along a closed subset

**Formal completion.** (*formal-completion*) For `X` a locally noetherian scheme and `X′` closed,
`X̂_{/X′} = colim_n V(𝓘^{n+1})`, for any quasi-coherent `𝓘` of finite type with `V(𝓘) = X′`, is a
locally noetherian formal scheme on `X′` with `O = lim_n O_X/𝓘^{n+1}`, independent of `𝓘`, with
ideal of definition `𝓘O` and `i_X : X̂ → X`; `(Spec A)^_{/V(I)} = Spf Â`, and `X̂` is noetherian iff
`X′` is quasi-compact (EGA I 10.8.2–7, pp. 194–196).

**Completing morphisms.** (*completion-of-morphism*) A map `f : X → Y` of locally noetherian schemes
with `f(X′) ⊆ Y′` (closed) completes uniquely and functorially to `f̂ : X̂_{/X′} → Ŷ_{/Y′}` over
`f`, compatibly with products; if `X′ = f⁻¹(Y′)`, `X̂ = X ×_Y Ŷ` and `f̂` is adic, of finite type or
proper with `f` (EGA I 10.9.1–9, pp. 198–200; 10.13.6; EGA III₁ 3.4.1, p. 119).

**Equal completions.** (*completion-morphism-germ*) If `S`-morphisms `f, g : X → Y` of locally
noetherian `S`-schemes, mapping closed `X′` into closed `Y′`, agree near `X′` then `f̂ = ĝ`;
conversely if `Y` is of finite type over `S` (EGA I 10.9.4, p. 199).

**Completing coherent sheaves.** (*completion-of-coherent-sheaf*) For `X` locally noetherian, `X′`
closed and `F` coherent, `F̂ = lim_n (F/𝓘^{n+1}F)|_{X′} ≅ i_X^*F` is coherent with support
`Supp F ∩ X′` and `Γ(X̂, (M~)^) = M ⊗_A Â` for finite `M`, and commutes with `⊗`, `ℋom`, pullback
(EGA I 10.8.4–12, pp. 194–197; 10.9.5, p. 199; 10.10.1; EGA I Ch. 0, 7.3.3, p. 67).

**Exactness and flatness.** (*completion-exact*) For `X` locally noetherian and `X′` closed,
`F ↦ F̂` is exact on coherent modules and `i_X : X̂ → X` is flat (EGA I 10.8.8, p. 196; 10.8.9, p.
197; Stacks Tag 0881, Lem. 30.23.4).

**What completion sees.** (*completion-detects-near-closed*) On locally noetherian `X` with closed
`X′`, a section of coherent `F` dies in `Γ(X̂, F̂)` iff it vanishes near `X′`, and `û` (`u : F → G`)
is zero (mono, epi) iff `u` is so near `X′` (EGA I 10.8.11–14, pp. 197–198).

### F0.6 Coherent formal modules

**Coherent formal modules.** (*coherent-formal-module*) On a locally noetherian formal scheme `X`,
`Coh(X)` is the full subcategory of locally finitely presented `O_X`-modules
(`SheafOfModules.IsFinitePresentation`); it contains `O_X` and the `M^Δ`.

**The module `M^Δ`.** (*associated-formal-module*) For `(A, I)` adic noetherian and finite `M`,
`M^Δ = (M~)^` along `V(I)` has `Γ(D(f), M^Δ) = M ⊗_A A_{f}`, `Γ(Spf A, M^Δ) = M` and
`(Spf φ)^*N^Δ ≅ (A ⊗_B N)^Δ` (EGA I 10.10.1, p. 201; 10.10.8–9, p. 203).

**Coherent modules on `Spf A`.** (*affine-coherent-equivalence*) For `(A, I)` adic noetherian,
`M ↦ M^Δ` is an exact equivalence, respecting `⊗`, `Hom`, from finite `A`-modules to `Coh(Spf A)`;
`O_{Spf A}` is a coherent ring, and `F` is coherent iff `F = lim F_n` with coherent `F_n` on
`Spec(A/I^{n+1})`, `F_{n+1} ⊗ O_{X_n} ≅ F_n` (EGA I 10.10.2–6, pp. 201–203).

**Coherent modules as systems.** (*coherent-as-inverse-system*) For `X` locally noetherian with
ideal of definition `𝒥`, `F ↦ (F ⊗ O_X/𝒥^{n+1})_n` is an equivalence from `Coh(X)` to systems of
coherent `O_{X_n}`-modules with `u_{mn}^*F_n ≅ F_m`, respecting `Hom`, `ℋom`, `⊗`; `θ` is onto iff
`θ_0` is (EGA I 10.11.1–7, pp. 204–205; Stacks Tag 0EHN, §30.23).

**Theorem on formal functions.** (*theorem-on-formal-functions*) For `A` noetherian (not necessarily
complete), `I ⊆ A`, `f : X → Spec A` proper and `F` coherent, `H^p(X, F)` is finite and naturally
`H^p(X, F)^∧ ≅ lim_n H^p(X, F/I^{n+1}F)`, homeomorphically, hence `H^p(X, F) ≅` the limit for
complete `A` (EGA III₁ 4.1.7 (4.1.7.1); 5.1.2; Stacks Tag 02OC, Thm 30.20.5; Tag 087U, Lem.
30.20.6). Checks: for `I = 0` both sides are `H^p(X, F)` and for `I = A` both vanish (`F/I^{n+1}F`
is `F`, resp. `0`); properness is needed, as the punctured plane over `A¹_k` with `p = 0` shows.
Lean: `formalFunctions` (`IsPowQuotient` encodes `F → F/I^{n+1}F`); the rest README only.

**Graded cohomology.** (*graded-cohomology-finiteness*) For `X` proper over noetherian `A`, `B` a
finite-type graded `A`-algebra and `⊕_k 𝓕_k` quasi-coherent of finite type over `B~|_X`,
`⊕_k H^p(X, 𝓕_k)` is `B`-finite and, for ample `L`, `H^{p>0}(X, 𝓕_k ⊗ L^{⊗d}) = 0` for `d ≥ d_0`,
all `k` (EGA III₁ 2.4.1 (ii), pp. 107–108; 3.3.1–2, p. 118; Stacks Tag 0897, Lem. 30.19.3).

**Good filtrations.** (*formal-functions-affine*) In the setting of *theorem-on-formal-functions*,
for each `p` one `c ≥ 0` gives `Ker(H^p(X, F) → H^p(X, F_n)) ⊆ I^{n+1−c}H^p(X, F)`
(`F_n = F/I^{n+1}F`, `n + 1 ≥ c`) and equal images of `H^p(X, F_k)`, `H^p(X, F)` in `H^p(X, F_n)`
for `k ≥ n+c` (EGA III₁ 4.1.7–4.1.7.21, pp. 125–126; Stacks Tag 02OB, Lem. 30.20.4).

**At a point.** (*formal-functions-at-point*) For proper `f : X → Y`, `Y` locally noetherian,
coherent `F`, `y ∈ Y`, `(R^p f_*F)_y` is finite with completion `lim_k H^p(X ⊗ O_y/𝔪_y^{k+1}, F)`
(EGA III₁ 4.2.1, pp. 129–130; 4.2.2; 4.2.4; Zariski connectedness 4.3.1).

**Cohomology of limits.** (*cohomology-of-mittag-leffler-limit*) If `F = lim F_k` on a space, with
surjective transitions and a basis where each `(H^i(U, F_k))_k` is Mittag-Leffler and
`colim_{U∋x} lim_k H^i(U, F_k) = 0` for `i > 0`, then `H^i(X, F) → lim_k H^i(X, F_k)` is onto, and
bijective if `(H^{i−1}(X, F_k))_k` is Mittag-Leffler (EGA III₁ Ch. 0, 13.3.1, p. 68).

**Formal higher direct images.** (*formal-direct-image-comparison*) For `f : X → Y` proper, `Y`
locally noetherian and coherent `𝓘`, `F`, `R^n f̂_*F̂` on `Ŷ_{/V(𝓘)}` is coherent and
`(R^n f_*F)^ → R^n f̂_*F̂ → lim_k R^n f_*(F/(𝓘O_X)^{k+1}F)` are isomorphisms (EGA III₁ 4.1.5, p.
125; 4.1.6 (ii), p. 125; 4.1.8, p. 129; 4.1.9). Check: `H^1(P̂¹_{ℤ_p}, Ô(−2)) = ℤ_p`.

### F0.7 Grothendieck's existence theorem

**The closed fibre.** (*closed-fibre-neighbourhood*) For `A` adic of finite ideal type with ideal of
definition `I` (noetherianity unused) and `f : X → Spec A` with closed underlying map (e.g. proper),
every open containing `f⁻¹(V(I))` is `X` (EGA III₁ 5.1.3.1, p. 150).

**Full faithfulness.** (*existence-fully-faithful*) For `(A, I)` adic noetherian, `X` of finite type
(not necessarily separated) over `Spec A` and coherent `F`, `G` with `Supp F ∩ Supp G` proper over
`Spec A`, `Hom(F, G) ≅ Hom(F̂, Ĝ)`; if `X → Spec A` is closed, `u` is injective (surjective) iff `û`
is (EGA III₁ 5.1.3, p. 149; 4.5.3, p. 139; Stacks Tag 0883, Lem. 30.24.1).

**Formal Serre vanishing.** (*formal-serre-vanishing*) For `(A, I)` adic noetherian, `𝔛 → Spf A`
proper, `L` invertible with `L_0` ample and `F` coherent, one `m_0` gives
`H^{i>0}(X_n, F_n ⊗ L_n^{⊗m}) = 0` and `Γ(𝔛, F ⊗ L^{⊗m}) ↠ H^0(X_n, F_n ⊗ L_n^{⊗m})` for all `n`,
`m ≥ m_0` (EGA III₁ 5.2.3 (5.2.3.3), pp. 151–152; Stacks Tag 0884, Lem. 30.24.2).

**The projective case.** (*existence-projective-case*) For `(A, I)` adic noetherian and `X` proper
over `Spec A` with an ample invertible sheaf (so `X` is projective), `Coh(X) → Coh(X̂)` is an
equivalence (EGA III₁ 5.2.5, p. 153; Stacks Tag 0885, Lem. 30.24.3).

**Modifications.** (*existence-modification*) For `Y` noetherian, quasi-coherent `𝓙, 𝓚`, `π : X → Y`
proper and invertible off `V(𝓚)`, `G ∈ Coh(Ŷ_{/V(𝓙)})`, coherent `F` and `π̂^*G ≅ F̂`, some
`G → (π_*F)^` has kernel and cokernel killed by one `𝓚^t` (Stacks Tag 088B, Lem. 30.25.3; EGA III₁
5.3.4, pp. 154–155). Check: over `∐_n Spec ℤ` no uniform `t` exists.

**Bounded torsion.** (*bounded-torsion-algebraization*) For `X` noetherian, quasi-coherent `𝓘`,
coherent `H` and `α : G → Ĥ` in `Coh(X̂_{/V(𝓘)})` with kernel and cokernel killed by `𝓘^t`, there is
an essentially unique `(F, a : F → H, β : G ≅ F̂)`, `F` coherent, with `a` an isomorphism up to
`𝓘`-power torsion and `α = â ∘ β` (Stacks Tag 0889, Lem. 30.23.6 (1)).

**Dévissage.** (*existence-devissage*) For `X` noetherian, quasi-coherent `𝓘, 𝓚` and
`G ∈ Coh(X̂_{/V(𝓘)})`, if completion along `V(𝓘)` is an equivalence on each `V(𝓚^e)` and some
`G → Ĥ`, `H` coherent, has kernel and cokernel killed by a power of `𝓚`, then `G ≅ F̂` with `F`
coherent (Stacks Tag 088A, Lem. 30.25.2; EGA III₁ 5.3.1, p. 154; 5.3.2).

**Proper support.** (*existence-proper-support-reduction*) For `(A, I)` adic noetherian, `X`
separated of finite type over `Spec A` and `G ∈ Coh(X̂)` with support proper over `Spf A`, `G` is
killed by the completed ideal of a closed `Z ⊆ X` proper over `Spec A` (Stacks Tag 088E, Thm
30.27.1, first part of the proof; EGA III₁ 5.3.5, p. 155).

**Grothendieck's existence theorem.** (*grothendieck-existence*) For `(A, I)` adic noetherian and
`X` separated of finite type over `Spec A`, completion along the closed fibre is an equivalence
between coherent modules with support proper over `Spec A`, resp. `Spf A`; for proper `X`,
`Coh(X) ≃ Coh(X̂)`, i.e. compatible systems `(F_n)` of coherent modules on
`X ×_{Spec A} Spec(A/I^{n+1})` with `F_{n+1} ⊗ O_{X_n} ≅ F_n` (EGA III₁ 5.1.1, p. 149; 5.1.4, 5.1.6,
5.1.7, p. 150; Stacks Tag 088E, Thm 30.27.1; Tag 088C, Prop. 30.25.4; Tag 088F, Rem. 30.27.2). Lean:
`grothendieckExistence`, `grothendieckExistence_hom` (proper case, as compatible systems); other
forms README only.

### F0.8 Morphisms and algebraization (formal GAGA)

**Closed subschemes.** (*closed-subscheme-algebraization*) For `X` separated of finite type over
adic noetherian `(A, I)`, `Z ↦ Ẑ` matches closed (formal) subschemes proper over `Spec A`, resp.
`Spf A` (EGA III₁ 5.1.8, p. 151; Stacks Tag 0899, Lem. 30.28.1).

**Detecting isomorphisms.** (*completion-detects-isomorphism*) For `X`, `Y` proper over locally
noetherian `Z`, closed `Z′ ⊆ Z` and `f : X → Y` over `Z`, `f̂` is an isomorphism (closed immersion)
iff `f` is so near `Z′` (EGA III₁ 4.6.8, p. 144).

**Morphisms from proper schemes.** (*formal-morphism-full-faithfulness*) For `(A, I)` adic
noetherian, `X` proper and `Y` separated of finite type over `S = Spec A`,
`Hom_S(X, Y) ≅ Hom_{Spf A}(X̂, Ŷ)`, so `X ↦ X̂` is fully faithful onto algebraizable formal schemes
(EGA III₁ 5.4.1, p. 156; 5.4.2, p. 157; Stacks Tag 0A42, Lem. 30.28.3).

**Formal GAGA.** (*grothendieck-algebraization*) For `(A, I)` adic noetherian, `𝔛 → Spf A` proper
and `L` invertible on `𝔛` with `L_0` ample on `X_0`, `𝔛 ≅ X̂` for an `X` proper over `Spec A`,
unique up to unique isomorphism, and every such `X` has an ample `M` with `M̂ ≅ L`, so is projective
(EGA III₁ 5.4.5, pp. 157–158; Stacks Tag 089A, Thm 30.28.4; ample: EGA II, 4.5.2; Stacks Tag 01PR).
Check: without `L` it fails (EGA III₁ 5.4.3, p. 157; Stacks Tag 0D1Q).

**Gluing morphisms.** (*lrs-morphism-gluing*) Morphisms of locally ringed spaces `X|_{U_i} → Y` on
an open cover of `X` agreeing on overlaps glue uniquely (EGA I Ch. I, proof of 2.2.4, p. 99;
10.4.6); Mathlib has this for schemes only.

**Nilpotent thickenings.** (*affine-nilpotent-thickening*) A scheme `X` with a quasi-coherent ideal
`𝒥`, `𝒥^n = 0` for some `n ≥ 1`, is affine iff `V(𝒥)` is (EGA I 5.1.9, p. 130, proof pp. 130–131;
Stacks Tag 06AD, Lem. 37.2.3).

**Internal Hom.** (*internal-hom-sheaf-of-modules*) For modules on a scheme or locally noetherian
formal scheme, `f^*(F ⊗ G) ≅ f^*F ⊗ f^*G`, `f^*ℋom(F, G) ≅ ℋom(f^*F, f^*G)` for flat `f` and
finitely presented `F`, and `Hom_A(M, N)~ ≅ ℋom(M~, N~)` for finitely presented `M`, so `ℋom` of
coherent modules is coherent on locally noetherian schemes (EGA I Ch. 0, 4.1.5, pp. 37–38; 4.3.3.1,
p. 41; 6.7.6, p. 60; EGA I 1.3.12, pp. 88–89; 6.1.1, pp. 140–141).

**Closure properties.** (*coherent-formal-module-properties*) On locally noetherian `X`, `O_X` is
coherent, `Coh(X)` is abelian and closed under extensions, `⊗`, `ℋom` and pullback, and on
quasi-compact `U` the limit topology of `Γ(U, F)` makes coherent maps continuous, coherent
submodules closed (EGA I 10.10.3–8, pp. 202–203; 10.11.1–6, pp. 204–205).

**Formal glueing of modules.** (*formal-glueing-of-modules*) For a flat `R → S` and finitely
generated `I ⊆ R` with `R/I ≅ S/IS` (e.g. `S = Â`), an `S`-linear `M′ → N ⊗_R S` with
`I`-power-torsion kernel and cokernel descends to `M → N` with the same kernel and cokernel and
`M ⊗_R S ≅ M′`, and dually (Stacks Tag 0ALK, Lem. 15.91.17, Prop. 15.91.16).

**Serre classes.** (*proper-support-serre-subcategory*) For `X` of finite type over noetherian `S`,
quasi-coherent `𝓘`, the objects of `Coh(X̂_{/V(𝓘)})` with `S`-proper support, resp. killed by `𝓘_Z`
for a closed `S`-proper `Z ⊆ X`, are Serre (Stacks Tag 0CYV, Lem. 30.26.11).

### F0.9 Projective geometry over a noetherian base

**Projective geometry.** (*projective-bundles-ample-serre*) For `A` noetherian and finite `E`,
`P(E) = Proj(Sym E)` represents invertible quotients, compatibly with base change (EGA II 4.2.3;
3.5.3); Serre's theorems for `X` proper over `A` are SF.2's *ample-serre-vanishing* (EGA II 4.6.11;
EGA III₁ 2.2.1–2, 3.2.1; Stacks Tags 02O5, 0B5U, 01XO); for `S` finitely generated over `A` in
degree `1` and finite graded `M`, `M_n ≅ Γ(Proj S, M̃(n))` for `n ≫ 0` (EGA III₁ 2.3.1–2).

**Chow and dévissage.** (*chow-lemma-devissage*) Chow's lemma over a noetherian base is SF.4's
*chow-lemma* (EGA II 5.6.1–2; Stacks Tag 0200). On noetherian `X`, a property of coherent modules
holding for `0`, 2-of-3 in short exact sequences, and, for each integral closed `Z` with generic
point `ξ`, for some `G` with support `Z` and `G_ξ` a line over `κ(ξ)` (if closed under summands:
`G_ξ ≠ 0` killed by `𝔪_ξ`), holds for all (EGA III₁ 3.1.2–3; Stacks Tag 01YI).

### Examples

Main examples: `ℤ_p` and `k⟦t⟧` as adic rings, not `ℚ_p`; the one-point `Spf ℤ_p` and `P̂¹_{ℤ_p}`;
`Spf ℤ_p⟨T⟩ → Spf ℤ_p`, adic but not proper, against the non-adic `Spf ℤ_p⟦T⟧ → Spf ℤ_p`; `(ℤ/ℓ)~`
completing to `0` along `V(p)`; `O(−2)` on `P¹_{k[t]}` and the punctured plane for formal functions;
`ℤ_p[x] ≠ ℤ_p⟨x⟩` on `A¹_{ℤ_p}` for proper supports; a non-algebraizable K3 deformation.

### Dependencies

Mathlib/Tau Ceti schemes, Huber rings, `AdicCompletion`, sheaf cohomology. SchemeAndStackFoundations
SF.2 (*godement-resolution*, *ample-serre-vanishing*, *proper-fibre-dimension-vanishing*,
*qcoh-higher-direct-images*), SF.4 (*chow-lemma*); StableReduction 2; JacobianChallenge C;
AlgebraicVectorBundles L0A, L0B; AdicSpacesPartII R0 (cited only).

## Layer R2: formal schemes, generic fibres and Hasse domains

This layer builds on layer F0 and AdicSpacesPartII R0–R1. `K` is complete for a nontrivial rank-one
nonarchimedean absolute value, with valuation ring `O_K`, pseudouniformiser `ϖ` and residue field
`k`, and is not assumed discretely valued (`O_K` may be non-noetherian) unless a statement says so;
qc, qs, qcqs, lft mean quasi-compact, quasi-separated, both, locally of finite type.

### R2.1 Algebras topologically of finite presentation

**Tfp and admissible algebras.** (*topologically-finitely-presented-algebra*) An `O_K`-algebra `A`
is tft if `A ≅ O_K⟨ξ_1, …, ξ_n⟩/a`, tfp if some such `a` is finitely generated, admissible if tfp
and `ϖ`-torsion-free (`ϖ`-adic, not `m_K`-adic, topologies). Then tfp ⟺ any surjection `O_K⟨η⟩ → A`
has finitely generated kernel; tfp passes to `A/b` (`b` finitely generated), `A⟨η⟩`, `A⟨f⁻¹⟩`; tfp
`A` is `ϖ`-adically complete and separated, `A/ϖ^m A` finitely presented (complete separated `A` is
tft iff `A/ϖA` is of finite type, BL I §1, Lem. 1.5), `A[1/ϖ] = K⟨ξ⟩/aK⟨ξ⟩` strongly noetherian
Tate; admissible ⟺ tfp and flat; `A/A[ϖ^∞]` is admissible (BL I §1, before Prop. 1.1, p. 293;
Conrad-AWS §3.3, p. 30; FK Ch. 0, §8.4, Def. 8.4.1, p. 188). Check: `O_K⟨T⟩/(ϖT)` is tfp and not
admissible, `T` being `ϖ`-torsion. Lean: `Huber.IsCompleteRankOneBase`,
`Huber.IsTopologicallyFinitePresentation`, `Huber.IsAdmissibleAlgebra`,
`IsTopologicallyFinitePresentation.iff_of_surjective`,
`IsTopologicallyFinitePresentation.isAdicComplete`, `isAdmissibleAlgebra_iff_flat`.

**Saturated submodules.** (*saturated-submodule-finitely-generated*) For `A` tft and `F` finite free
over `A`, `ϖ`-saturated `M ⊆ F` are finitely generated (BL I §1, Lem. 1.2(c), p. 293), so `(A, ϖA)`
is adhesive (FK Ch. 0, §8.5, Prop. 8.5.3, p. 191, §9.2(a), Thm 9.2.1, p. 221; Conrad-AWS §3.3, Lem.
3.3.2, p. 31); `F` induces `ϖ`-adic topologies on submodules; finitely generated ones are complete,
closed for separated `A` (BL I §1, Lem. 1.2(a),(b)).

**Flat tft algebras are tfp.** (*flat-tft-is-tfp*) For tft `A = O_K⟨ξ⟩/a` (FK: any height), `A` is
`ϖ`-adically precomplete; `a` finitely generated ⇒ `a` closed, `A` complete and separated; `A`
`ϖ`-torsion-free (flat) ⇒ `a` finitely generated (BL I §1, Prop. 1.1(c), p. 293); globally,
`ϖ`-torsion-free tft charts are admissible (FK Ch. I, §2.3, Cor. 2.3.2, p. 288). Lean: partial,
`isTopologicallyFinitePresentation_of_flat`, `IsTopologicallyFinitePresentation.isAdicComplete`.

**Coherence.** (*tfp-algebra-coherent*) A tfp `A` is coherent, and coherent modules are stable under
kernels, cokernels, images, sums, intersections, `⊗`, `Hom` (BL I §1, Prop. 1.3, p. 294), as are
`Ann_A(M)`, `Ann_M(b)`, `M[ϖ^∞]` for coherent `b`, `M` (BL I §1, Lem. 1.4(c), p. 294). Lean:
ring-level core `IsTopologicallyFinitePresentation.finitePresentation_of_fg`.

**Locality on `Spf`; flatness modulo `ϖ^m`.** (*tfp-locality*) For complete separated `A` and a
finite affine cover `(Spf B_i)` of `Spf A` (EGA I §10), `A` is tfp (resp. admissible) iff all `B_i`
are, and then `A → ∏ B_i` is faithfully flat (BL I §1, Prop. 1.7 and after, pp. 296–297). For `A`,
`B` tfp (or `B` tft, separated), a coherent `B`-module `M` is (faithfully) flat over `A` iff all
`M/ϖ^m M` are over `A/ϖ^m A` (BL I §1, Lem. 1.6, p. 295, proof pp. 295–296).

### R2.2 Admissible formal schemes, type (S) and FS_C

**Admissible formal schemes.** (*admissible-formal-scheme*) A formal `O_K`-scheme of finite ideal
type (F0) is locally tfp if covered by `Spf A`, `A` tfp, and admissible if moreover `ϖ`-torsion-free
(⟺ the `A` of one cover are admissible ⟺ stalks are `O_K`-flat); morphisms are adic, and `X`,
`X_s = X ⊗ k` share a locally noetherian space. Define admissible fibre products (`X ×_Z Y` modulo
`ϖ`-power torsion), the universal admissible `X^{tf} = V(O_X[ϖ^∞])`, coherent open ideals (locally
`∋ ϖ^m`) and coherent modules. `ϖ`-adic completions of `O_K`-schemes locally of finite presentation
are locally tfp, admissible if flat; for discretely valued `K`, admissible = locally noetherian,
flat, adic lft (BL I §1, after Prop. 1.7, p. 297, p. 298; Conrad-AWS §3.3, Def. 3.3.5, p. 31, Exs.
3.3.1–3.3.11, pp. 30–33; EGA I §10.1, Déf. 10.1.2, p. 181).

**Type (S).** (*formal-schemes-of-type-S*) `X` is of type (S) if each point has an affine open with
adic ring `A` either (a) noetherian or (b) with `sA` an ideal of definition and `A(1/s)` (`A_s` with
basis `s^m A`) strongly noetherian Tate; morphisms are adic (lft) if locally adic (tft) on rings.
Then (S) is local, with finitely generated ideals of definition; locally noetherian formal schemes
and Conrad's `FS_C` satisfy (a); locally tft formal `O_K`-schemes and `Spf` of complete microbial
valuation rings satisfy (b); completions of lft morphisms along finite-type ideals keep (S);
`Spf O_K[[T]]` (`(ϖ, T)`-adic, `K` not discretely valued) is not of type (S) (Huber96 §1.9,
condition (S), p. 96, (1.9.5), Ex. 1.9.2(i), p. 97; Conrad-MR §3.1, Def. 3.1.1, p. 16).

### R2.3 Generic fibres

**Huber's functor `t`.** (*noetherian-formal-scheme-as-adic-space*) Locally noetherian formal `X`
has `π_X: (t(X), O⁺) → (X, O_X)`, `t(X)` adic, universal for morphisms of locally and topologically
ringed spaces from adic spaces; `t(Spf A) = Spa(A, A)` (Huber94 §2, Thm 2.2),
`π(x) = {a : |a(x)| < 1}`. `t` is fully faithful; `f` is adic (EGA I 10.12), resp. lft (EGA I
10.13), iff `t(f)` is; `π_X` is an isomorphism on trivial valuations; the image of `t` saturates to
the spaces locally `Spa(A, A⁺)`, `A` of finite type over a noetherian ring of definition `A_0`, `A⁺`
its integral closure (Huber94 §4, Props. 4.1–4.2, pp. 539–540; Hübner §8, Thm 8.1, pp. 37–38).

**Huber's generic fibre `d`.** (*generic-fibre-functor-d*) For `X` of type (S), `λ_X: d(X) → X` is
universal among adic `Z → X` on which sections vanishing on `X` generate `O` (analytic) and
`O_X → λ_*O` factors through `λ_*O⁺` as a local map; `d` is a functor on adic morphisms and
`d(U) = λ⁻¹(U)`. Affinely `d(Spf A)` is `t(Spf A)_a` (`A` noetherian) or `Spa(A(1/s), B)` (case (b),
`B` the integral closure of `A`, `A(1/s)` Hausdorff), spectral; for `X` locally tfp
`d(X) = d(X^{tf})`, qc (qs) if `X` is, and is `{|ϖ| ≠ 0} ⊆ t(X)` if `K` is discretely valued; for
complete microbial `A`, `λ: Spa(Frac A, A) → Spf A` is a homeomorphism (Huber96 §1.9, Prop. 1.9.1
and proof, pp. 96–97, Ex. 1.9.2(i), (1.9.3), p. 98; Hübner §8, after Def. 8.5, p. 38, Ex. 8.7, p.
39).

**Raynaud's generic fibre.** (*raynaud-generic-fibre*) For `X` locally tfp, with `r` of
AdicSpacesPartII R1 (*rigid-adic-comparison-functor*): `A_K°` is the integral closure of `A`, so
`d(Spf A) = Spa(A_K, A_K°) = r(Sp A_K)` (Huber94 §4, Lem. 4.4, p. 543); Raynaud's `X_rig`, glued
from `Sp A_K` along Laurent domains (BL I §4, p. 306; Conrad-AWS §3.3, Exercise 3.3.8, p. 32), is qs
and `d(X) ≅ r(X_rig)` functorially, compatibly with opens; `d(X)` is qs, lft, qc if `X` is (Huber96
§1.9, Ex. 1.9.2(ii), pp. 97–98; Huber94 §4, Rem. 4.6(ii), p. 544).

**Generic fibres of fibre products.** (*generic-fibre-fibre-products*) For `X → Z ← Y` locally tfp,
`d(X ×_Z Y) ≅ d(X) ×_{d(Z)} d(Y)` (also for admissible fibre products), and
`d(X ⊗̂_{O_K} O_{K'}) ≅ d(X) ×_{Spa(K, O_K)} Spa(K', O_{K'})` functorially for complete rank-one
`K'/K` (BL I §4, Cor. 4.6, p. 310; Conrad-MR §3.1, Thm 3.1.5(a), p. 16).

### R2.4 Specialisation, tubes and rig-points

**Specialisation.** (*specialisation-map*) For `X` of type (S), `λ_X(x) = {a : |a(x)| < 1}` on
`Spf A` is natural, continuous (`λ⁻¹(D(s)) = {|s| ≥ 1}`; `λ⁻¹(V(s)) = {|s| < 1}` closed, not open).
For `X` admissible, classical points map onto closed points of `X_s` (BL I §3, 3.4, 3.5), rig-points
to special points, i.e. Berthelot's anticontinuous `sp`; `λ` commutes with blow-ups, and for qc `X`,
`(d(X), O⁺) ≅ lim (X', O_{X'})` over them (Huber94 §4, proof of Prop. 4.1(1), p. 539; Hübner §8, p.
37, Thm 8.9; Conrad-AWS §3.3, Ex. 3.3.13, p. 34, §4.1, p. 35).

**Tubes.** (*tube*) For `X` of type (S) and `T ⊆ X` locally closed: `]U[ = λ⁻¹(U)`,
`]U ∩ Z[ = λ⁻¹(U) ∩ ]Z[`, and for `Z = V(ϖ, f_1, …, f_r)` in `Spf A` (in general, `s` with `sA` an
ideal of definition replaces `ϖ`) `]Z[ = ⋃_m {|f_i|^m ≤ |ϖ| ∀ i}`, choice-free, the interior of
`λ⁻¹(Z)`. Tubes are open, compatible with intersections and adic pullbacks; for `X` admissible, the
classical points of `]T[` form Berthelot's `sp⁻¹(T)` with `r(sp⁻¹(T)) = ]T[`, `]Z[ ≠ ∅` for `Z ≠ ∅`,
and blow-ups preserve tubes. Closed tubes `[Z]_q = {|f_i| ≤ |ϖ|^q}`, `q ∈ ℚ_{>0}`, depend on the
`f_i`, are qc and exhaust `]Z[` (radii as in *fractional-valuation-bound*; GK02 §2.3, p. 18;
Conrad-AWS §3.3, Ex. 3.3.13, p. 34; Conrad-MR App. A.1, before Lem. A.1.4, p. 38).

**Rig-points.** (*rig-point*) Rig-points of admissible `X` are classes of closed immersions
`u: Spf B → X` of admissible formal schemes, `B` a one-dimensional local domain, special point
`u(Spf B) ∈ X_s`; `B` is `O_K`-finite with normalisation `O_{Frac(B)}`, `Frac(B)/K` finite (BL I
3.2). They are functorial; admissible blow-ups biject them, preserving residue fields (BL I §3, Lem.
3.3, p. 304); on `Spf A` they ↔ primes `p ∌ ϖ` with `dim A/p = 1` ↔ `Max(A_K)` (BL I 3.4); each
closed point of `X_s` is special (BL I §3, Prop. 3.5, p. 305, via [BGR 7.1.5/4]); they ↔ classical
points of `d(X)` (BL I §3, Def. 3.1(b), p. 303; Conrad-MR App. A.1, Lem. A.1.5, p. 38).

### R2.5 Admissible blow-ups and Raynaud's theorem

**Admissible blow-ups.** (*admissible-blow-up*) For `X` admissible and `𝒜` a coherent open ideal
(non-open ones change `d`), `φ: X' = lim_m Proj(⊕_n 𝒜ⁿ ⊗ O_X/ϖ^{m+1}) → X` is locally the completed
scheme blow-up, with charts `A⟨ζ⟩/(f_iζ_j − f_j)` modulo `ϖ`-power torsion for `𝒜 = (f_0, …, f_r)`.
`X'` is admissible, universal for adic `Z → X` with `𝒜O_Z` invertible; `φ` is proper, surjective on
special fibres, an isomorphism off `V(𝒜)`, stable under flat (admissibly, all) base change (BL I §2,
Rem. 2.3); `Bl_{ℬO_{X'}} Bl_𝒜 = Bl_{𝒜ℬ}` (cofiltered); for `X` qcqs, (`U`-admissible) blow-ups
compose and extend from finitely many qc opens (BL I §2, 2.5, 2.6; RG §5.1, Lem. 5.1.4, p. 36; EGA
I_new 6.9.7, 6.9.9). Strict transforms (also on `X ×_T T'`) are `φ*ℳ` modulo `𝒜`-power torsion,
coherent if `ϖ`-torsion-free (RG §5.1, Déf. 5.1.1(ii), p. 35), and compose for centres off
schematically dense opens (RG §5.3, Rem. 5.3.2, p. 38) (BL I §2, p. 298, Prop. 2.1(c), Lem. 2.2, p.
299, Rem. 2.4(c), p. 301; Conrad-AWS §3.3, Ex. 3.3.11, p. 33).

**Generic fibres invert admissible blow-ups.** (*generic-fibre-inverts-admissible-blow-ups*) `d(φ)`
(equivalently `φ_rig`) is an isomorphism for every admissible blow-up `φ`: on `Spf A` with
`𝒜 = (f_0, …, f_r)`, the charts have generic fibres `R(f_0, …, f_r / f_i)`, which cover (BL I §4,
proof of Thm 4.1(a), p. 307; Conrad-AWS §3.3, Ex. 3.3.11, p. 33, Exercise 3.3.12).

**Bounded functions.** (*bounded-functions-blow-up*) For `A` admissible and `f_i ∈ A_K°`,
`B = A[f_1, …, f_n]` is admissible, finite over `A`, `B_K = A_K`, and `Spf B` is the blow-up of
`(ϖ^r, ϖ^r f_1, …, ϖ^r f_n)` if `ϖ^r f_i ∈ A` (BL I §4, Lem. 4.5, p. 309, via [BGR 6.3.4/1]). For
`f_i ∈ A[1/ϖ]` with `ϖ^N f_i ∈ A`, the `ϖ^N`-chart of the blow-up of `(ϖ^N, ϖ^N f_i)` has generic
fibre `{|f_i| ≤ 1}` (Conrad-AWS §3.3, Ex. 3.3.11, Exercise 3.3.12, pp. 33–34).

**Qc opens from blow-ups.** (*quasi-compact-opens-from-blow-ups*) For `X` qc admissible and qc opens
`U_1, …, U_n ⊆ d(X)`, an admissible blow-up `X'` has opens `U'_i`, `d(U'_i) = U_i`, covering `X'` if
the `U_i` do (BL I §4, Lem. 4.4, p. 308; Conrad-AWS §3.3, p. 34).

**Admissible models of affinoids.** (*affinoid-admissible-model*) For a `K`-affinoid algebra
`B = K⟨ξ⟩/b`, `A = O_K⟨ξ⟩/(b ∩ O_K⟨ξ⟩)` is admissible with `A ↪ B`, `A_K = B` and
`d(Spf A) = Spa(B, B°)` (BL I §4, after Thm 4.1, p. 306; Conrad-AWS §3.3, Exercise 3.3.3, p. 31).

**Raynaud's theorem.** (*raynaud-theorem*) `X ↦ X_rig` is an equivalence from qc admissible formal
`O_K`-schemes (automatically qs) localised at admissible blow-ups to qcqs rigid `K`-spaces (BL I §4,
Thm 4.1, p. 306; Conrad-AWS §3.3, p. 34), and via `d` and `r` to qcqs adic spaces lft over
`Spa(K, O_K)` (Hübner §8, Thm 8.8 and before it, p. 39): `φ_rig = ψ_rig ⇒ φ = ψ` (`ϖ`-torsion-free
source); generic-fibre morphisms (isomorphisms) lift to `Y' → X` (blow-ups of `X`) after blowing up
`Y`; `Hom(X, Y) = colim_{X' → X} Hom(X', Y)` (BL I §5).

### R2.6 Separatedness, flattening, quasi-finite models and finiteness criteria

**Separatedness of formal models.** (*formal-model-separatedness*) A morphism `f` of admissible
formal `O_K`-schemes is separated iff `f_rig` is, iff `d(f)` is (BL I §4, Prop. 4.7, p. 310;
Conrad-MR App. A.1, proof of Thm A.1.2, p. 38).

**Properness of formal models.** (*formal-rigid-properness-comparison*) For `f: X → Y` of admissible
formal `O_K`-schemes, `d(f)` is proper iff `f` is, and partially proper iff `f|_Z: Z → Y_s` is
proper for each irreducible closed `Z ⊆ X_s` (reduced) (Huber96 §1.3, Rem. 1.3.18, p. 59, quoting
[Hu4, 3.11, 3.13], Rem. 1.3.19, pp. 59–60; Conrad-MR §3.1, proof of Thm 3.1.6, p. 18; cited: [Te,
Cor. 4.4 and 4.5, p. 18 of the author version], [L1]).

**Flattening by admissible blow-up.** (*flattening-by-blow-up*) For `f: X → Y` of qc admissible
formal `O_K`-schemes with `f_rig` flat (resp. flat in dimension `≥ n`), an admissible blow-up
`Y' → Y` makes the strict transform of `X` so over `Y'`: *module-flattening-by-blow-up* for
`ℳ = O_X` (BL II §5, Thm 5.2, p. 426; Conrad-MR App. A.1, proof of Thm A.1.2, p. 38).

**Quasi-finite formal models.** (*quasi-finite-formal-model*) For `f: X → Y` of qc admissible formal
schemes, an admissible blow-up of `Y` with strict transform `f'` makes the fibres of `f'_0` of
dimension `≤ n` if those of `f_rig` (at rig-points, *rig-flat-in-dimension*) are (BL II §5, proof of
Cor. 5.3(a), p. 426), and `f'_0` locally quasi-finite (finite fibres) if `f_rig` is quasi-finite (BL
II §5, Cor. 5.3(b), p. 426; Conrad-MR App. A.1, proof of Thm A.1.2, p. 38).

**Conrad's scheme lemma.** (*fibral-finiteness-scheme-lemma*) A flat morphism of schemes locally of
finite presentation is finite iff it is separated with finite fibres and locally constant rank
`y ↦ dim_{κ(y)} Γ(X_y, O)`, without qc or noetherian hypotheses (Conrad-MR App. A.1, Lem. A.1.4 and
proof, p. 38, via [EGA IV] IV_4 18.5.11(c) and fpqc descent, [EGA IV] IV_2 2.7.1).

**Fibral finiteness criterion.** (*fibral-finiteness-criterion*) A flat map of rigid `K`-spaces is
finite iff it is qc and separated (not just qs) with finite fibres and locally constant rank (sum of
`κ(y)`-dimensions of local fibre algebras); via `r` likewise for qs adic spaces lft over
`Spa(K, O_K)` (Conrad-MR App. A.1, Thm A.1.2, Rem. A.1.3, p. 37, proof p. 38, applied in Thm 4.1.3;
[AM], Lemme A.1, corrected to "separated", for discretely valued `K`).

**Affinoidness is topological.** (*topological-invariance-of-affinoid*) A rigid `K`-space `X` is
affinoid iff `X_red` is, so `Y → Z` is finite iff `Y_red → Z_red` is; via `r` (Huber96 1.1.11)
likewise for qs adic spaces lft over `Spa(K, O_K)` (Conrad-MR App. A.1, Thm A.1.1 and after, p. 36,
via [BGR 6.1.1/4, 7.3.5/3, 9.5.3/5]; no Serre-type criterion, [Liu]).

### R2.7 The proof of flattening

After BL II §§1–4 and RG I (Première partie of RG), classical rigid case only. `K` is complete for a
nontrivial rank-one valuation, `ϖ` a pseudouniformiser; formal schemes are formal `O_K`-schemes
locally of tf presentation (*admissible-formal-scheme*); `R` is a complete height-one valuation ring
(`O_K`, or `O_L`, `L/K` finite). `h : Z → T` is *sgi of dimension `m`* if smooth and surjective with
all fibres `Z ⊗ k(t) = Z_0 ×_{T_0} Spec k(t)` geometrically irreducible of dimension `m`; in *(A)*,
`T = Spf A` is admissible and `h : Z = Spf B → T` affine and sgi of dimension `m`.

**Topological generation.** (*topological-generation-mod-definition-ideal*) For affine `f : X → Y`,
coherent `ℳ` and `E ⊆ Γ(X, ℳ)` generating `f_*(ℳ/ϖℳ)` over `O_{Y_0}`, the map
`Â^{(E)} → Γ(f⁻¹(Spf A), ℳ)` is onto for each `Spf A ⊆ Y` (BL II §1, Lem. 1.3(a), p. 405).

**Topological bases.** (*topological-basis-lifting*) If also `E` is a basis mod `ϖ` and `ℳ` is
`O_Y`-flat, this map is bijective (BL II §1, Lem. 1.3(b), p. 405).

**Smooth lifts.** (*smooth-lifting-from-level-zero*) After shrinking `Y_0`, any
`h_0 : (Y_0, y) → (T_0, t)` smooth of relative dimension `r` at `y` lifts to a smooth
`h : (Y, y) → (T, t)` of relative dimension `r`, `Y ⊗ O_K/ϖ = Y_0` (BL II §1, Lem. 1.4(a), p. 405).

**Factorisations.** (*smooth-lifting-of-diagrams*) If `f : (X, x) → (T, t)` reduces to `h_0 ∘ g_0`,
`h_0 : (Y_0, y) → (T_0, t)` smooth, then after shrinking `X`, `Y_0`, `T`, smooth `h` and `g` lift
`h_0`, `g_0` with `h ∘ g = f`; for étale, possibly non-affine `h_0` no shrinking is needed, `(Y, h)`
is unique up to unique isomorphism and `g` unique (BL II §1, Lem. 1.4(b), p. 405).

**Generisation.** (*formal-stalk-generization-flat*) For `y ⤳ x` in `X_0`, the map
`O_{X,x} → O_{X,y}` of (uncompleted) stalks is flat (BL I §1, Cor. 1.8(b), p. 297).

**Irreducibility.** (*rg-etale-neighbourhood-irreducible*) If `Z` is geometrically normal of finite
type over a field `k` and the closure of `z ∈ Z` is geometrically irreducible, so is every connected
elementary étale neighbourhood of `(Z, z)` (RG I §1.1, Lemme 1.1.2, pp. 4–5).

**Integral fibres.** (*rg-geometrically-integral-fibres-etale-locally*) If `T → S` is smooth and
`T ⊗ k(s)` geometrically integral of dimension `n`, then for some elementary étale
`(S', s') → (S, s)` an open `U' ⊆ T ×_S S'` containing `T ⊗ k(s')` has all fibres over `S'`
geometrically integral of dimension `n` (RG I §1.1, Lemme 1.1.3, p. 5).

**Local structure.** (*rg-zariski-local-structure*) For `f : (X, x) → (S, s)` locally of finite
type, `n = dim_x(X ⊗ k(s))`, there are affine `(Y, y) → (T, t) → (S', s')` over `f` with `Y → X`,
`S' → S` elementary étale, `T → S'` smooth with geometrically integral fibres of dimension `n` and
`Y → T` finite, `y` alone over `t` (RG I §1.1, Théorème 1.1.1, pp. 3–4).

**Formal local structure.** (*formal-zariski-local-structure*) For `f : (X, x) → (T, t)`, not
necessarily flat, `d = dim_x(X ⊗ k(t))`, there are affine `X ←u X' →g Z' →h T' →v T` with
`f u = v h g`, `u`, `v` elementary étale, `h` smooth with geometrically irreducible fibres of
dimension `d`, `g` finite with `x'` alone over `z'` (BL II §1, Thm 1.5, p. 406).

**Projectivity.** (*rg-smooth-geometrically-integral-projective*) A smooth `A`-algebra `B`, `A` any
ring, with all fibres `B ⊗_A k(p)` geometrically integral (so nonempty) is a projective `A`-module
(RG I §3.3, Prop. 3.3.1, p. 19; BL II §1, p. 406).

**Local bases.** (*smooth-geometrically-irreducible-topological-basis*) If `Spf B → Spf A` is affine
and sgi of dimension `m`, each point of `T_0` has a neighbourhood `Spf A⟨a⁻¹⟩` over which
`B ⊗̂_A A⟨a⁻¹⟩` has a topological basis (BL II §1, Prop. 1.8(b), pp. 406–407).

**Ideals of coefficients.** (*ideal-of-coefficients*) For `h : Z → T` and coherent `𝒥 ⊆ O_Z`, a
coherent `𝒞 ⊆ O_T` is an ideal of coefficients if `T' → T` factors through `V(𝒞)` exactly when
`Z ×_T T' → Z` factors through `V(𝒥)` (least with `𝒥 ⊆ 𝒞O_Z` after any base change). It is unique,
base-changes, restricts and glues; it is open if `𝒥` is and `h` is faithfully flat (BL II Rem. 2.2
omits flatness, which is needed). For `Spf B → Spf A` with a topological basis `(e_i)` and
generators `f_j = Σ a_{ij}e_i` of `b ↔ 𝒥`, `(a_{ij})` lies in every `c` with `b ⊆ cB`; if finitely
generated it is the ideal of coefficients, and `t ∈ V(𝒞)` iff `Z ⊗ k(t) ⊆ V(𝒥)`. The content `c(f)`
is that of `fB` (on `A[ξ]` the coefficient ideal); all this also for `B_K`, `A_K` and rig-points (BL
II §2, Def. 2.1, p. 407; Rem. 2.2, p. 407).

**Existence.** (*ideal-of-coefficients-existence*) If `h : Z → T` is quasi-compact and locally on
`T` affine and sgi of constant dimension, every open coherent `𝒥` has an open ideal of coefficients,
affinely the finitely generated `(a_{ij})` (BL II §2, Prop. 2.3(b), pp. 407–408); over `T = Spf R`
every finitely generated `b ⊆ B` has one, generated by coordinates of largest absolute value, so
contents are principal (cf. proof of Prop. 2.3(a), p. 408).

**Rigid ideals of coefficients.** (*rig-ideal-of-coefficients-existence*) In (A), with `B`
`ϖ`-torsion free and topologically free over `A`: each `b_K ⊆ B_K` has ideal of coefficients `aA_K`,
finitely generated, `a` the coordinate ideal of `b_K ∩ B`, also after base change to rig-points; a
finitely generated `b ⊆ B` of rigid ideal of coefficients `A_K` has an open one (BL II §2, proof of
Prop. 2.3(b), p. 408).

**Regular at all levels.** (*nonvanishing-on-fibres-nonzerodivisor-levels*) If `Spf B → Spf A` is
sgi of dimension `m` over `R` (`A` may have `ϖ`-torsion) and `f ∈ B` vanishes identically on no
fibre of `Z_0 → T_0`, `f` is regular in each `B/ϖ^{λ+1}B` (BL II §2, Lem. 2.5(a), p. 409).

**Regular on B.** (*nonvanishing-on-fibres-nonzerodivisor*) Then `f` is regular on `B`, as `B` is
`ϖ`-adically separated (BL II §2, proof of Lem. 2.5(b), p. 409).

**Hartogs.** (*smooth-geometrically-irreducible-extension*) There, if `A` is `ϖ`-torsion free and
`Y_0 ⊆ Z_0` is closed with fibres over `T_0` of dimension `< m`, `Γ(Spec B, O) → Γ(Spec B ∖ Y_0, O)`
is bijective (BL II §2, proof of Lem. 2.5(c), p. 409).

**Homogeneity.** (*content-ideal-smul*) There, with `A = R`, `c(af) = a·c(f)` for `a ∈ R`, `f ∈ B`
(BL II §2, Lem. 2.6(a), pp. 409–410).

**Nonvanishing factors.** (*content-ideal-nonvanishing-factor*) There `c(fg) = c(g)` if `f` is
nonzero on every fibre of `Z_0 → T_0` (BL II §2, proof of Lem. 2.6(b), p. 410).

**Gauss's lemma.** (*content-ideal-product*) There `c(f_1f_2) = c(f_1)c(f_2)`, as `c(f_1)` is
principal (BL II §2, proof of Lem. 2.6(c), p. 410).

**Generic fibres.** (*smooth-geometrically-irreducible-generic-fibres-integral*) In (A), for primes
`p ⊆ A` with `ϖ ∉ p`, `pB` is prime, the generic point of the fibre over `p`; all fibres of
`Spec B → Spec A` are irreducible and reduced (BL II §2, Prop. 2.4(a), pp. 408, 410).

**Associated primes.** (*smooth-geometrically-irreducible-associated-primes*) In (A), each
associated prime of `B`, in RG I's weak sense (Déf. 3.2.1), is `pB` with `p ∌ ϖ` associated in `A`;
so `B` is `ϖ`-torsion free (BL II §2, Prop. 2.4(b), pp. 408, 410).

**Dévissage steps.** (*formal-devissage-step*) For quasi-compact `f : X → T`, coherent `ℳ`,
`x ∈ X_0` over `t`, a `T`-dévissage in dimension `n` at `x`: a finitely presented closed
`(Y, y) ⊆ (X, x)` killing `ℳ`; `Y →g Z →h T`, `g` finite with `y` alone over `z`, `h` affine, smooth
with geometrically irreducible fibres of dimension `n`; `α : O_Z^ℓ → 𝒩 = g_*ℳ` (`ℓ ≥ 0`) with
`α ⊗ k(η)` bijective, `η` generic in `Z ⊗ k(t)`; `𝒫 = coker α`. Then `𝒫` lives on a finitely
presented closed `Y' ⊆ Z` of fibre dimension `< n`, `dim_x(ℳ ⊗ k(t)) ≤ n`, steps base-change and
reduce mod `ϖ^{λ+1}` to RG `S`-dévissages (BL II §3, Def. 3.1, p. 411; RG I §1.2, Déf. 1.2.1, p. 6).

**Dévissages.** (*formal-devissage*) One in dimensions `n¹ > … > n^r` is a chain of steps `D^i`,
`D¹` of `ℳ` at `x` in dimension `n¹`, `D^i` of `𝒫^{i−1}` at `z^{i−1}` in dimension `n^i`; complete
if `𝒫^r = 0`; chains truncate, base-change (keeping completeness) and reduce to RG `S`-dévissages
(BL II §3, Def. 3.2, p. 411; RG I §1.2, Déf. 1.2.2, p. 7).

**Existence of dévissages.** (*formal-devissage-existence*) For `f : (X, x) → (T, t)` and `ℳ_x ≠ 0`,
after elementary étale affine neighbourhoods `u : X' → X` of `x` and `v : T' → T` of `t`, `u*ℳ` has
a complete `T'`-dévissage at `x'` from `N = dim_x(ℳ ⊗ k(t))` down to some `n ≥ 0`, through any given
`m ∈ [0, N]` (BL II §3, Prop. 3.3, p. 412; RG I §1.2, Prop. 1.2.3, p. 8).

**Generic bijectivity.** (*devissage-generic-bijectivity-criterion*) For `h : (Z, z) → (T, t)`
affine and sgi, `η` generic in `Z ⊗ k(t)` and `α : O_Z^ℓ → 𝒩` coherent with `α ⊗ k(η)` bijective:
`α_z` universally injective over `O_{T,t}` ⟺ `α_z` injective ⟺ `α_η` bijective (BL II §3, proof of
Lem. 3.6, pp. 413–414; RG I §2, Lemme 2.2, p. 12).

**Flatness criterion.** (*devissage-flatness-criterion*) If `u*ℳ` (`u`, `v` as above) has a
`T'`-dévissage `(D^i)` at `x'`, not necessarily complete, `η^i` generic in `Z^i ⊗ k(t')`, equivalent
are: `ℳ_x` is `O_{T,t}`-flat; all `𝒩^i_{z^i}` are `O_{T',t'}`-flat; `𝒫^r_{z^r}` is `O_{T',t'}`-flat
and all `α^i` are bijective at `η^i` (or injective at `z^i`, or universally injective near `t'`) (BL
II §3, Prop. 3.5, pp. 413–414; RG I §2, Cor. 2.3, p. 13).

**Flatness in dimension ≥ n.** (*flat-in-dimension*) For `f : X → T` and coherent `ℳ`,
`F(ℳ/T) = {x ∈ X_0 : ℳ_x flat over O_{T,f(x)}}`; `ℳ` is `T`-flat in dimension `≥ n` at `x` if
`dim_x((X_0 ∖ F(ℳ/T)) ∩ (X ⊗ k(t))) < n` (fibre dimension, `−∞` off the closure), and so everywhere
or over an open of `T_0`; `f` is if `O_X` is. This passes to larger `n`, holds for `n > dim(X/T)`
and flat `ℳ`; `F` is étale local and, for finite `g`, `z ∈ F(g_*ℳ/T)` iff all points over `z` lie in
`F(ℳ/T)` (BL II §3, pp. 415–416; RG I §5.2, Déf. 5.2.1, p. 37).

**Open flat locus.** (*formal-flat-locus-open*) `F(ℳ/T)` is open in `X_0` (BL II §3, Cor. 3.7, p.
415; RG I §2, Cor. 2.6, p. 14).

**Dimension criterion.** (*devissage-flat-in-dimension-criterion*) If `0 ≤ n < N` and the dévissage
ends in dimension `n`, equivalent are: `ℳ` is `T`-flat in dimension `≥ n` at `x`; all `α^i` are
bijective at `η^i`; injective at `z^i`; universally injective near `t'` (BL II §3, Cor. 3.8, pp.
415–416; RG I §2, Cor. 2.9, p. 15).

**Rig-flatness.** (*rig-flat-in-dimension*) For `f : X → T`, `X`, `T` quasi-compact, `T` admissible,
and coherent `ℳ ↔ M` on charts `Spf C → Spf A`, `ℳ` is rig-flat at a rig-point `x` if `M_x` is
`A`-flat, independently of charts and admissible blow-ups of `X`, `T` (BL I §5, pp. 313–314);
`dim_x(X/T)` is the dimension at `x` of `C_K ⊗_{A_K} K(t)`, and `dim(Y/T)_rig` its supremum over
rig-points of `Y` (BL II §3, Def. 3.9, p. 416); `ℳ` is rig-flat in dimension `≥ n` (above `t`) if
rig-flat at all rig-points (over `t`) off a finitely presented closed `Y` with `dim(Y/T)_rig < n`
(BL II §4, p. 419; BL II Prop. 3.11 is not needed, §3, p. 417). This passes to larger `n`, holds if
`dim(X/T)_rig < n`, is shared by `ℳ`, finite `g_*ℳ` and `ℳ/(ϖ-torsion)`, survives étale and
admissible-blow-up base change, and for `ℳ = O_X` is flatness of `O_{d(T),f(x)} → O_{d(X),x}`.

**Freeness.** (*rig-flatness-generic-point-criterion*) In (A), let `ℳ` on `Y` (`Y ⊆ X` closed,
finitely presented) have a `T`-dévissage `α : ℒ → 𝒩 = g_*ℳ`, `g : Y → Z`, in dimension
`m = dim(Y/T)`; `η = tB`, `t` a rig-point. Equivalent: `ℳ` (or `𝒩`) is rig-flat in dimension `≥ m`
above `t`; `Γ(Z, 𝒩)_η` is `A_t`-flat; it is `B_η`-free (BL II §3, Prop. 3.12, p. 417).

**Fitting ideals.** (*formal-fitting-ideal*) For coherent `ℳ` and `r ∈ ℕ`, `F_r(ℳ) ⊆ O_X` is the
coherent ideal given on `Spf A` by the Fitting ideal of `Γ(Spf A, ℳ)` (`TauCeti.fittingIdeal`). It
commutes with restriction and pull-back, `F_r ⊆ F_{r+1}`, `F_r(ℳ)_x = O_{X,x}` iff `ℳ_x` is
generated by `r` elements, and `ℳ` locally free of rank `r` has `F_r = O_X` and, if `r > 0`,
`F_{r−1} = 0` (BL II §3, Def. 3.13, p. 418; RG I §5.4, 5.4.1, p. 39).

**Principal Fitting ideals.** (*rg-fitting-ideal-principal-generators*) For finitely presented `M`
over `A` with `F_r(M)` locally principal, `M/Ann_M(F_r(M))` is locally generated by `r` elements (RG
I §5.4, Lemme 5.4.2, p. 39).

**Invertible case.** (*fitting-ideal-invertible-locally-free*) If such `M` is free of rank `r` at
all (weakly) associated points of `A` and `F_r(M)` is invertible, `M/Ann_M(F_r(M))` is locally free
of rank `r` (BL II §3, Lem. 3.14, p. 418; RG I §5.4, Lemme 5.4.3, p. 40).

**Partitions.** (*partition-by-admissible-blow-up*) For admissible `T = Spf A`, orthogonal
idempotents `e_i ∈ A_K` with `Σ e_i = 1`, `ϖ^N e_i ∈ A`, `𝒥_i = Ann_A(ϖ^N(1 − e_i))`: `𝒥 = Σ 𝒥_i` is
coherent and open, its blow-up is `⊔ T'_i`, `T'_i = {𝒥_iO = 𝒥O}` of generic fibre `{e_i = 1}`, and
`t ∉ V(𝒥)` if `e_i = 1` in `A_K[a⁻¹]`, `a ∉ t` (RG I §5.1, Lemme 5.1.5, p. 36; BL II §4, p. 421).

**Smooth case.** (*flattening-smooth-special-case*) In (A), if coherent `ℳ` on `Z` is rig-flat in
dimension `≥ m`, an admissible blow-up `T' → T` makes its strict transform flat in dimension `≥ m`,
and can be an isomorphism near each `t ∈ T_0` with `ℳ` flat at the generic point of `Z ⊗ k(t)` (BL
II §4, Special case 4.4, pp. 420–421; BL II §3, p. 419).

**Torsion lemma.** (*devissage-torsion-lemma*) In (A), for exact `0 → ℒ → 𝒩 → 𝒫 → 0` coherent with
`ℒ` free and `dim(𝒫/T) < m`: `ℒ ∩ 𝒯(𝒩) = 0`, `𝒯(𝒩) ≅ 𝒯(𝒫)` and `0 → ℒ → 𝒩/𝒯(𝒩) → 𝒫/𝒯(𝒫) → 0` is
exact, `𝒯` the `ϖ`-power torsion (BL II §4, Lem. 4.5, p. 422).

**Injectivity.** (*devissage-injectivity-and-rig-flatness*) If `T` is quasi-compact admissible, `X`
quasi-compact, `ℳ` rig-flat in dimension `≥ n` and flat in dimension `≥ m + 1`, `m ≥ n`, for a
dévissage at `x` ending in dimension `m`, locally `α^i` is universally injective for `i < r` and all
`𝒩^i` are rig-flat in dimension `≥ n` (BL II §4, Lem. 4.6, pp. 422–423).

**Local step.** (*flattening-local-step*) There, if an admissible blow-up `T(1) → T` flattens the
strict transform in dimension `≥ m` over `U_0(1)`, `U_0 ⊊ T_0` open, an admissible blow-up
`T(2) → T(1)` centred off `U_0(1)` does so over `W_0(2)`, `W_0 ⊋ U_0` open (BL II §4, Lem. 4.7, pp.
423–424).

**Induction step.** (*flattening-induction-step*) There an admissible blow-up `T' → T` makes the
strict transform flat in dimension `≥ m`, centred off any open `U_0 ⊆ T_0` over which `ℳ` already is
so (BL II §4, Prop. 4.2, pp. 419, 423).

**Flattening.** (*module-flattening-by-blow-up*) If `T` is quasi-compact admissible (`K` possibly
non-discrete), `X → T` with `X` quasi-compact (`ϖ`-torsion allowed) and `ℳ` coherent, rig-flat over
`T` in dimension `≥ n`, an admissible blow-up `T' → T` makes the strict transform (not the
pull-back) on `X ×_T T'` flat in dimension `≥ n` (BL II §4, Thm 4.1, p. 419).

**Strict transform.** (*strict-transform-generically-torsion-quotient*) If there `T'` blows up a
coherent open `𝒥`, the strict transform is the pull-back modulo `ϖ`-torsion off a closed `C ⊆ X'_0`
with `dim(C/T'_0) ≤ n − 1` (BL II §4, Thm 4.1, pp. 419, 424–425).

### R2.8 Formal completions of schemes and the good-reduction locus

**Completion of a scheme; `σ` and `φ`.** (*formal-completion-and-algebraic-comparison*) `X̂` is the
completion of any scheme `X` along a quasi-coherent ideal locally of finite type
(*colimit-of-thickenings*, F0; *formal-completion*, F0, SF.4). If `X̂` is of type (S), a unique map
of locally ringed spaces `σ_X : d(X̂) → X` has `e⁻¹(U) ⊆ σ⁻¹(U)` and `e* = σ*` on `O_X(U)` (`U`
open, `e = (X̂ → X) ∘ λ`). For `f : X → Y` locally of finite type and `Y' ⊆ Y` closed with ideal of
finite type, `Ŷ` of type (S) makes `X̂` (along `X ×_Y Y'`) of type (S) and `f̂` adic, giving
`φ : d(X̂) → X ×_Y d(Ŷ)` over `d(Ŷ)` (AdicSpacesPartII R1, *scheme-fibre-product-analytification*);
`φ` is a local isomorphism, injective if `f` is separated, surjective if `f` is universally
specializing (e.g. proper) (Huber96 §1.9.4–1.9.5, Prop. 1.9.6, p. 98; Huber94 §4, Rem. 4.6(iv), p.
544, noetherian, `t` for `d`; [Hu4, 3.10.7]; Huber94 Prop. 3.8). Checks: `A¹_{O_K}` gives
`{|T| ≤ 1}`; doubling the special-fibre origin makes `φ` non-injective.

**Good-reduction locus.** (*good-reduction-locus*) For `K` complete of nontrivial rank one (not
necessarily discrete), `X` a separated `O_K`-scheme locally of finite type and `X̂` its `ϖ`-adic
completion, `φ_X : d(X̂) → X_K^ad = X ×_{Spec O_K} Spa(K, O_K)` (AdicSpacesPartII R1,
*analytification-functor*) is an open embedding onto the `x` with `Spec κ(x) → X` extending to
`Spec κ(x)⁺ → X`, `λ(x)` being the image of the closed point; it is an isomorphism for proper `X`; a
classical point with residue field `K'` is in the image iff it extends to an `O_{K'}`-point (Huber96
§1.9, Prop. 1.9.6, p. 98; Conrad-AWS §3.3, Ex. 3.3.9, pp. 32–33; Huber94 §4, Rem. 4.6(iv)(a), p.
544). Check: `G_{m,O_K}` gives `{|T| = 1}`.

**Properness converse.** (*good-reduction-locus-properness-converse*) For `O_K` complete rank-one
with pseudouniformiser `ϖ`, a flat quasi-projective `O_K`-scheme `X` (quasi-compactly immersed in
some `Pⁿ_{O_K}`, so separated, finitely presented) is proper iff `φ_X` is surjective; reducedness,
irreducibility are not needed (FK Ch. 0, §9.2(a), Cor. 9.2.3, p. 222; Huber Prop. 1.9.6, p. 98;
Conrad-AWS §3.3, Ex. 3.3.9, pp. 32–33). Checks: `Spec O_K ⊔ A¹_{O_K/ϖ}` (not flat) and the flat
`P¹_{O_K} ⊔ Spec K` are not proper; `φ_X` is onto only for the first.

### R2.9 Conrad's `FS_C`, smooth formal schemes, étale sites, Frobenius lifts and residue discs

**Conrad's functor `(·)^rig` on `FS_C`.** (*berthelot-type-rig-functor-nonnoetherian-base*) Let `C`
be adic noetherian with `C → R` continuous, `R` the valuation ring of a complete nonarchimedean `k`
(not necessarily discrete), and `FS_C` the locally noetherian formal schemes over `Spf C` with
reduced scheme locally of finite type over `C_red`. Thm 3.1.5: continuous `C`-maps from rigid
`k`-spaces to `X` (into locally power-bounded sections, preserving local topological nilpotence) are
represented by a quasi-separated rigid `X^rig`; `(·)^rig` keeps immersions and separatedness, makes
open covers admissible and tf type maps quasi-compact, commutes with fibre products, extension of
`k` and change of `C`, and `Spf(C[[q]])^rig = {|t| < 1}`. For discrete `k`, `C = R` and `X` of type
(S) locally of tf type, `r(X^rig) ≅ d(X)` with specialisation (`r` of AdicSpacesPartII R1), but not
for type (S) alone (Conrad-MR §3.1, Def. 3.1.1, Thm 3.1.5, p. 16, proof p. 17; [deJ, 7.2.4, 7.2.6];
Huber96 Ex. 1.9.2(ii), pp. 97–98). Check: `Spf O_{ℂ_p}⟨T⟩ ∉ FS_C`.

**Smooth and étale formal morphisms.** (*smooth-formal-scheme*) For `f : X → Y` between formal
`O_K`-schemes locally of tf presentation (`K` complete rank one, or noetherian), `f` is smooth of
relative dimension `d` at `x` if near `x` it embeds over `Y` in `D^n_Y = Spf O_Y⟨ζ_1, …, ζ_n⟩`, cut
out by `n − d` sections with independent differentials at `x`; étale means `d = 0`; equivalently `f`
is flat at `x` and smooth mod `ϖ` near `x`, or smooth of dimension `d` mod every `ϖ^{m+1}`. Then `f`
is locally étale over `D^d_Y`; `Ω¹_{X/Y} = lim_m Ω¹_{X_m/Y_m}` is coherent, free on the `dT_i`, and
over discrete `K` is AdicSpacesPartII R0's *continuous-differentials*; smooth formal `O_K`-schemes
are admissible; smoothness is stable under composition, base change and étale maps; `d(f)` is smooth
(étale) in AdicSpacesPartII R0's sense; étale maps lift uniquely along nilpotent thickenings (BL II
§1, Def. 1.1, p. 404, pp. 405–406; Conrad-MR §3.1, proof of Thm 3.1.6, p. 17; TT §2.2, p. 12).
Check: `Spf O_K⟨S, T⟩/(ST − ϖ)` has smooth generic fibre, is not smooth.

**Étale site of a formal scheme.** (*formal-etale-site-invariance*) For `𝔛` a formal `O_K`-scheme
locally of tf presentation (or adic noetherian), `𝔜 ↦ 𝔜_0` gives `𝔛_ét ≃ (𝔛_0)_ét ≃ (𝔛_{s,red})_ét`
(scheme steps in SF.0), `𝔜 ↦ d(𝔜)` is a continuous functor to the étale site of `d(𝔛)`
(AdicEtaleGeometry A1), and `𝔜 ↦ Γ(𝔜, O_𝔜)` is a sheaf (Stacks Tag 039R, Thm 41.15.2; EGA IV 18.1.2;
Stacks Tag 04DZ, Thm 59.45.2; Conrad-MR §3.1, proof of Thm 3.1.6, p. 17; TT §2.2, p. 12). Check:
`Spf W(𝔽_{p²}) → Spf ℤ_p` has finite étale generic fibre of degree `2`.

**Frobenius lifts.** (*frobenius-lift-etale-over-torus*) If `A → R` of `p`-adically complete rings
is étale modulo every `p^{m+1}`, a Frobenius lift of `A` extends uniquely to one of `R`; for
`𝔛 = Spf R` étale over `Spf W(κ)⟨T_1^{±1}, …, T_d^{±1}⟩` (`κ` perfect, `char κ = p`) this gives a
unique `σ`-semilinear `φ` with `φ(T_i) = T_i^p`, `φ(r) ≡ r^p mod p`; global lifts need not exist (TT
§2.3, Rem. 2.20, p. 19). Checks: `φ((T − 1)⁻¹) = (T^p − 1)⁻¹`; in characteristic `p` only `r ↦ r^p`.
Lean: `exists_unique_frobeniusLift_of_etale`.

**Residue discs.** (*residue-disc*) If `𝔛` over `O_K` (`K` complete rank-one) is smooth of relative
dimension `d` at a `k`-rational special-fibre point `x` with parameters `t_1, …, t_d`, the tube
`]x[` is the open polydisc `⋃_{m≥1} {|T_i|^m ≤ |ϖ|}` with `T_i ↦ t_i`; other parameters are `Φ(t)`,
`Φ_i ∈ O_K[[T]]`, `Φ(0) ∈ m_K^d`, with linear part invertible mod `m_K`; for `κ(x) = k' ⊋ k`
separable, `]x[` has no `K`-point and splits into `[k' : k]` polydiscs after finite unramified base
change to a residue field containing a normal closure of `k'/k` (GK02 §2, Lem. 2.6, p. 21; Conrad-MR
§3.1, proof of Thm 3.1.5, p. 17; Conrad-AWS §5.2, Ex. 5.2.5, p. 51). Check: for odd `p`, the tube of
`T² = 2`, `2` a non-square, has no `ℚ_p`-point.

### R2.10 Fractional bounds, section domains and Hasse domains

**Fractional valuation bounds.** (*fractional-valuation-bound*) For a ring `A`, `f, g ∈ A`,
`q = a/b ∈ ℚ_{≥0}` and `v ∈ Spv A`, `|f| ≤ |g|^q` means `v(f^b) ≤ v(g^a)` (`≥`, strict likewise),
independent of `(a, b)`, using no root of `g`. If `c^b = g^a u` with `u, u⁻¹ ∈ A⁺`, on `Spa(A, A⁺)`
it reads `v(f) ≤ v(c)`; for a unit `g` the loci meet `Spa(A, A⁺)` in `R({f^b, g^a}/g^a)` and
`R({g^a, f^b}/f^b)`; they are monotone in `q` on `{v(g) ≤ 1}`, pull back, ignore units of `A⁺`,
satisfy `{|f^n| ≤ |g|^{nq}} = {|f| ≤ |g|^q}` (`n > 0`) and multiply (BHW §2.1, p. 7; Scholze15
§III.2, Def. III.2.12, p. 38; Conrad-MR §4.1, Thm 4.1.1(1), p. 26). Checks: `g = 0`, `q > 0` gives
`{v(f) = 0}`; `{|T| ≤ |p|^{1/2}}` has `T = p`, not `T = 1`. Lean: `ValuationSpectrum.fracPowLE`,
`ValuationSpectrum.fracPowGE`, `mem_fracPowLE_iff`, `fracPow_inter_spa`; other clauses README.

**Section domains.** (*section-valuation-domain*) For an admissible `𝔛`, an invertible `ℒ`,
`s ∈ Γ(𝔛, ℒ)` and `q ∈ ℚ_{≥0}`, `𝔛_η(|s| ≥ |ϖ|^q)` glues `{|f_j| ≥ |ϖ|^q}` for local `s = f_j e_j`
(`≤` likewise): independent of choices, open, quasi-compact if `𝔛` is, pull-back stable, unchanged
by `s − s' ∈ ϖ^c ℒ` for rational `c > q`, increasing in `q`, the tube of `𝔛_s ∖ V(s̄)` at `q = 0`,
and dependent on `ℒ`, not `ℒ_η` (BHW §2.1, p. 7; Scholze15 §III.2, Def. III.2.12, p. 38; Conrad-MR
§4.1, proof of Thm 4.1.1, p. 27). Checks: `T`, `T + ϖ` agree for `q = 1/2`, not `1`; on `P̂¹`,
`T_0 ∈ O(1)` at `q = 1` gives the complement of `{|T_0/T_1| < |ϖ|}`.

**Formal model of a section domain.** (*section-domain-formal-model*) For `c ∈ O_K ∖ {0}`,
`𝔛(|s| ≥ |c|)` is the open of the admissible blow-up of `(f_j, c)` where `s` generates, locally
`Spf` of `A⟨u⟩/(fu − c)` mod `ϖ`-torsion; lifts of `ϖ`-torsion-free `Z → 𝔛` are the `u` with
`u·s = c`; generic fibre `{|s| ≥ |c|}`; unchanged by `s + c't`, `c' ∈ c·m_K`, or unit multiples of
`c`; flat if `f̄` is regular mod `ϖ` and `c ∈ m_K` or a unit; `c ∣ c'` gives a map (Scholze15
§III.2, Lem. III.2.13, Def. III.2.12, p. 38, Lem. III.2.10, p. 36; BHW §4, Def. 4.1, p. 15). Checks:
`s = T`, `c = ϖ`: `O_K⟨T, u⟩/(Tu − ϖ)`; `s = ϖT`: torsion `Tu − 1`.

**Hasse domains.** (*hasse-domain*) For `p` prime, `K/ℚ_p` complete (or any complete rank-one base
with pseudouniformiser `p`), `𝔛` admissible, `ω` invertible and `Ha ∈ Γ(𝔛 ⊗ O_K/p, ω^{⊗(p−1)})`,
`X(ε) = 𝔛_η(|Ha| ≥ |p|^ε)`, `ε ∈ ℚ ∩ [0, 1)`, is the section domain of any local lift. If
`p^ε ∈ O_K`, the glued model `𝔛(ε)` is lift-independent, has `d(𝔛(ε)) = X(ε)`, classifies `u` with
`u·Ha = p^ε` mod `p` up to `u(1 + p^{1−ε}h)`, and is flat if `Ha` is regular on `𝔛 ⊗ 𝔽_p`; `X(0)` is
the tube of the ordinary locus; `X(ε)` grows with `ε` and commutes with pullback and base change
(Scholze15 §III.2, Def. III.2.12, Lem. III.2.13, pp. 37–38, Lem. III.2.10, p. 36; BHW §2.1, p. 7).
Check: for `ε = 1` the lifts `T`, `T + p` give different domains (at `T = −p`).

**Transition maps.** (*hasse-domain-transition-maps*) For `ε' ≤ ε < 1`, `X(ε') ⊆ X(ε)` is an open
immersion, rational on charts, induced by the unique model map `u = (c_ε/c_{ε'})u'` (functorial);
`⋃_{ε'<ε} X(ε')` is the interior of `{|Ha| > |p|^ε}` (same classical points), Conrad's `{h > |p|^ε}`
under `r`; for `ε > 0` the closure of `X(0)` lies in `X(ε)` (Conrad-MR §4.1, Thm 4.1.1(1), p. 26;
BHW §2.1, p. 7). Check: for `Ha = T`, `ι_{1/4,1/2}` is `u = p^{1/4}u'`.

**Conrad's Hasse loci.** (*hasse-loci-admissible-opens*) For a generalized elliptic curve `E → S`
over a rigid space over `k` (complete, analytic over `ℚ_p`), `h(E_s) = max(|a|, 1/p)`, `a` lifting
the `X^p`-coefficient of `[p]` on a semistable formal group (Def. B.3.3), the loci `S^{>h}`,
`h ∈ [1/p, 1)`, and `S^{≥h}`, `h ∈ (1/p, 1]` (`h ∈ √|k^×|`), are admissible opens, compatible with
base change and (for quasi-separated or pseudo-separated `S`) extension of `k`; `S^{≥h} → S` is
quasi-compact; the `S^{≥h}`, `h > h_0`, cover `S^{>h_0}`; locally `S^{≥h} = {|a_{Γ_A}| ≥ h}`, and
`S^{≥|p|^ε} = X(ε)` (universal curve) (Conrad-MR §4.1, Thm 4.1.1, pp. 26–27, App. B.3, p. 50, Thm
3.2.3; Conrad-RA Lem. 4.2.4, Thm 4.2.7, pp. 32–35). Check: `{h ≥ 1/p} = S`.

**Adic local flatness criterion.** (*adic-local-flatness-criterion*) If `I ⊆ A`, `M` satisfy, for
all finitely generated `a ⊆ A`, `a ∩ I^m ⊆ I^n a` (some `m` per `n`) and `I`-adic separatedness of
`a ⊗ M` (`A` arbitrary), then `M/I^nM` flat over `A/I^n` for all `n` makes `M` flat, and faithfully
flat if `I ⊆ Jac(A)` and `M/IM` is (BL I §1, proof of Lem. 1.6, pp. 295–296; Bourbaki AC III §5 no.
2 Thm 1). Check: noetherian `A` (Artin–Rees, Krull).

**Properties preserved by `(·)^rig`.** (*berthelot-rig-functor-preserves-properties*) For `f` in
`FS_C` locally topologically of finite type (any `k`), (a) finite, (b) formally smooth (étale) of
pure dimension `d`, (c) finite flat of rank `d`, (d) proper, (e) (faithfully) flat, (f) fibre
dimension `≤ d`, (g) flat with geometrically reduced fibres of pure dimension `d` pass to `f^rig`
(Conrad-MR §3.1, Thm 3.1.6, Rem. 3.1.7, pp. 17–18; (d) via [Te, Cor. 4.4, 4.5, p. 18], (f), (g) via
Conrad-MR Thm A.2.1). Check: `F[T]/(T²)` is finite flat, not reduced.

**Coherent modules and rings.** (*coherent-modules*) A finitely generated `A`-module (`A` not
necessarily noetherian, e.g. `O_K⟨ξ⟩/a`) is coherent if its finitely generated submodules are
finitely presented; `A` is coherent if it is so over itself. Coherence is two-out-of-three in short
exact sequences, stable under kernels, cokernels, images, sums, intersections, and `⊗`, `Hom` over a
coherent ring, where it equals finite presentation; `A/a` is coherent for finitely generated `a`;
noetherian rings are coherent (BL I §1, before Prop. 1.3, p. 294; EGA I_new 0 5.3.2; Stacks, Def.
10.90.1, Lem. 10.90.3–10.90.5); pseudo-coherence (SF.0; Stacks Tag 064N) differs. Check:
`k[x, y_1, y_2, …]/(xy_i)` is not coherent, `(x)` not being finitely presented.

### R2.11 Notions stated for this roadmap's own use

**Compactified moduli and the formal group.** (*compactified-moduli-generalised-elliptic-curves*) A
generalised elliptic curve over `S` is proper, flat, finitely presented, with smooth locus a
commutative group acting on the curve, and geometric fibres elliptic curves or standard `n`-gons
(Conrad-GEC, Def. 2.1.4, p. 5). For `Γ(N)`, `N ≥ 3`, or `Γ₁(N)`, `N ≥ 5`, level structures are
labelled sections injective into the smooth group and meeting every fibre component (Defs.
2.4.1–2.4.2, p. 14, 2.4.7, p. 16); over `ℤ[1/N]` their fine moduli scheme is proper and finitely
presented (Thms 3.1.4, p. 19, 3.2.7, 3.3.1, p. 26, 4.2.1(2), pp. 35–36; Deligne–Rapoport IV §3). The
completion along the identity is a formal group, locally `Spf A[[X]]` (Stacks 10.139.4, 29.35.20;
EGA I, 10.9.1–3, pp. 198–199). Checks: `j : M_Γ ⊗ ℂ → P¹_ℂ` is finite onto (p. 36); the Tate curve
has formal group `𝔾̂_m` and Hasse invariant `1` (§2.5, p. 17).

### Examples

Worked examples of layer R2: `O_K⟨T⟩` (admissible) against `O_K⟨T⟩/(ϖT)` (not); `d(Spf O_K/ϖ) = ∅`
and the Gauss point specialising to the generic point of `A¹_k`; blowing up `(T, ϖ)` against the
non-open `(S, T)`; the annulus `ζξ = ϖ` through the whole flattening argument; completions of `A¹`,
`G_m`, `P¹` over `O_K` and the non-proper `P¹_{O_K} ⊔ Spec K`; `Spf(ℤ[[q]])^rig` as the open disc;
the formal torus with its Frobenius lift and the non-smooth `ST = ϖ`; residue discs of `P̂¹`;
`{|T| ≤ |p|^{1/2}}` over `ℚ_p`; the model `Tu = ϖ` of `{|T| ≥ |ϖ|}`; the toy Hasse domain of
`Ha = T` with model `Tu = √p` and Scholze's `X*(ε)`; the Tate curve with formal group `𝔾̂_m`.

### Dependencies

Layer F0 (adic rings, formal schemes, completion); AdicSpacesPartII R0 (morphism properties,
*smooth-morphism*, *continuous-differentials*) and R1 (*rigid-analytic-space*,
*rigid-adic-comparison-functor*, *analytification-functor*); AdicSpaces (rational subsets,
sheafiness); AdicEtaleGeometry A1 (étale sites); SchemeAndStackFoundations SF.0
(*universal-homeomorphism-etale-site*, *coherent-hartogs*, *flat-proper-fibre-loci*,
*pseudo-coherent-module*, flattening) and SF.4 (formal completion); ModularCurves (elliptic
schemes). Mathlib: adic completion, flatness, smooth and étale morphisms, Kähler differentials, Witt
vectors; Tau Ceti: valuation spectra, restricted power series, Fitting ideals, affine blow-ups.

## Layer R3: coherent sheaves and finite traces

Building on AdicSpacesPartII R0–R1 and layers F0 and R2, this layer proves acyclicity of the sheaf
`M̃` of a finite module, reduces Čech acyclicity to simple Laurent coverings, and proves Kiehl's
glueing theorems through glueing squares. It then develops `Coh(X)`, quasi-Stein spaces, vector
bundles, uniform rings, the sheaf `Ω¹_{X/Y}`, Kiehl's proper mapping theorem and proper GAGA, and
ends with finite locally free traces, pull–identify–trace operators and the Gel'fand spectrum
`M(A)`.

### R3.1 The associated sheaf and acyclicity for finite modules

**Associated sheaf.** (*associated-module-sheaf*) For `(A, A⁺)` with `A` complete Hausdorff of type
(I) (noetherian ring of definition) or (II) (strongly noetherian Tate), `A⁺` integral elements and
`M` finite, `M̃` is the presheaf of topological `𝒪_X`-modules with `M̃(U) = M ⊗_A 𝒪_X(U)`
(uncompleted) on rational `U` and limits elsewhere; it is functorial, `M̃(X) = M`, `Ã = 𝒪_X`,
compatible with restriction and `⊗`, complete on rational `U`, and exact in `M` in type (II)
(Huber94 Thm 2.5 and the definition before it, p. 525, (1.4), Lem. 2.3(iii), 2.4(ii); Kiehl-AB Def.
1.1, p. 259). Check: `ℚ_p⟨T⟩[1/T] ≠ ℚ_p⟨T, T⁻¹⟩`.

**Tate acyclicity.** (*tate-acyclicity-finite-modules*) For `A` complete Hausdorff strongly
noetherian Tate, `A⁺` integral elements and `M` finite, rational Čech complexes of `M̃` over
rational `U` are strict exact, `M̃` is a sheaf of complete Hausdorff modules, `Hⁱ(U, M̃) = 0` for
`i > 0` and `H⁰(U, M̃) = M ⊗_A 𝒪_X(U)` (Huber94 Thm 2.5, Case II, p. 525, proof p. 531; KL15 Rem.
2.5.23, pp. 52–53; Stacks 01EW). Lean: Laurent core `Huber.laurent_exact_of_finite`.

**Huber's Case I.** (*noetherian-rod-acyclicity-finite-modules*) For complete `(A, A⁺)` with a
noetherian ring of definition and `M` finite, `M̃` is a sheaf of complete groups with
`Hⁱ(U, M̃) = 0` for `i > 0`, `U` rational (Huber94 proof of Thm 2.5, Case I, pp. 525–529, (1.5),
Lem. 2.6, p. 531). Lean: Laurent core `Huber.laurent_exact_of_finite`.

**Rational-covering reduction.** (*rational-covering-reduction*) For a Tate Huber pair, a local,
transitive property of finite rational coverings of rational sets that holds for simple Laurent
coverings `{|f| ≤ 1}, {|f| ≥ 1}`, `f ∈ 𝒪_X(U)`, holds for all finite nonempty ones (KL15 Prop.
2.4.20, pp. 44–45, Lem. 2.4.19, p. 44; Kiehl-AB §1, after Hilfssatz 1.3, p. 260).

**Rational completions.** For a pair of definition of `A` and `T` generating an open ideal, `B`
models `A⟨T/s⟩` if a homeomorphic ring isomorphism from the completed localisation to `B`
intertwines the maps from `A` (Wedhorn, Prop. 8.2(2)). Checks: `A⟨1/1⟩ = A` for complete `A`;
`A⟨1/0⟩ = 0`. Lean: `Huber.IsRationalCompletion`.

**Double complexes.** (*cech-double-complex-comparison*) If a first-quadrant double complex `K` of
abelian groups has augmentations `C^• → K^{•,0}`, `R^• → K^{0,•}` with exact augmented columns,
resp. rows, both are natural quasi-isomorphisms into `Tot(K)` (Stacks 00M1, Lem. 10.75.3).

**Refinements.** (*cech-acyclicity-refinement*) For an abelian presheaf `F` on opens `ℬ` closed
under finite intersections and a finite covering `𝔚` refining `𝔙` with each `𝔚 ∩ V_{i₀…i_p}`
`F`-acyclic, `Ȟⁿ(U, F; 𝔙) ≅ Ȟⁿ(U, F; 𝔚)` (KL15 proof of Prop. 2.4.21, p. 46; Stacks 0G6S, 01FM).

**Laurent reduction.** (*cech-acyclicity-simple-laurent-reduction*) For a complete Hausdorff Tate
pair and an abelian presheaf `F` on rational subsets with `F(∅) = 0` and exact
`0 → F(U) → F(V₁) ⊕ F(V₂) → F(V₁ ∩ V₂) → 0` on simple Laurent coverings, every finite rational Čech
complex of `F` is exact (KL15 Prop. 2.4.21, pp. 45–46). Check: the constant presheaf `ℤ` shows
`F(∅) = 0` is needed.

**Laurent difference map.** (*simple-laurent-difference-surjective*) For any complete Hausdorff
Huber pair and `f ∈ A`, `(b₁, b₂) ↦ ρ₁(b₁) − ρ₂(b₂)` maps `B₁ ⊕ B₂` onto `B₁₂` (localisations at
`|f| ≤ 1`, `|f| ≥ 1`, `|f| = 1`) (KL15 Lem. 2.4.22, p. 46).

**Sheafy Čech acyclicity.** (*sheafy-cech-acyclicity*) For a complete Hausdorff sheafy Tate pair,
rational Čech complexes of `𝒪_X` over rational `U` are exact and `Hⁱ(U, 𝒪_X) = 0` for `i > 0`, with
no noetherian or uniformity hypothesis (KL15 Thm 2.4.23, pp. 46–47; Stacks 01EW).

### R3.2 Glueing squares and Kiehl's theorem

**Glueing squares.** (*glueing-square*) A glueing square is a commutative square `R → R₁, R₂ → R₁₂`
of complete Hausdorff Tate rings and continuous maps with (a) `0 → R → R₁ × R₂ → R₁₂ → 0`,
`(r₁, r₂) ↦ r₁ − r₂`, strict exact, (b) `R₂ → R₁₂` dense, (c) every maximal ideal of `R` contracted
from a prime of `R₁ × R₂`. A glueing datum is `(M₁, M₂, M₁₂)` with `ψ_i : M_i ⊗ R₁₂ ≅ M₁₂`; its
sections are `ker(ψ₁ − ψ₂)`; an `R`-module `N` gives `(N ⊗ R_i)`, with sections `N` if finite
projective; `R₁, R₂` may be swapped if `R₁ → R₁₂` is dense too (KL15 Def. 2.7.3, pp. 56–57, proof of
Prop. 2.7.5, p. 57, Def. 1.3.7, p. 17, Rem. 2.4.4). Checks: the identity square on `R` is a glueing
square; `R, R → R × R` with diagonal maps is not, since every `r₁ − r₂` is diagonal; `ℚ_p → ℚ_p⟨T⟩`
with identities meets (b), (c), not (a); for the trivial square on `R`, `(1 ⊗ x, 1 ⊗ y)` is a
section iff `x = y`. Lean: `Huber.GlueingSquare`, `Huber.GlueingDatum`, `GlueingDatum.sections`,
`GlueingDatum.ofModule`.

**Matrix factorisation.** (*matrix-factorisation-strict-surjection*) If `R₁ → S`, `R₂ → S` are
bounded maps of nonarchimedean Banach rings with `R₁ ⊕ R₂ → S`, `(x, y) ↦ x + y`, strictly
surjective, then for some `c > 0` every `U ∈ GLₙ(S)` with `|U − 1| < c` is `U₁U₂`, `U_i ∈ GLₙ(R_i)`,
with `c = d⁻²` if lifts obey `|y_i| ≤ d|x|` and the maps are submetric (KL15 Lem. 2.7.2, p. 56;
Kiehl-AB §1, proof of Hilfssatz 1.5, p. 261).

**Sections generate.** (*glueing-square-finite-surjectivity*) For a glueing square (only (a), (b)
used) and a finite glueing datum with sections `M`, `M ⊗_R R_i → M_i` and `ψ₁ − ψ₂` are onto, and a
finitely generated `M₀ ⊆ M` has `M₀ ⊗_R R_i ↠ M_i` (KL15 Lem. 2.7.4(a), p. 57, Lem. 1.3.8(c), p.
17).

**Simple Laurent squares.** (*simple-laurent-glueing-square*) For a complete sheafy Tate Huber pair
and `f ∈ A`, the rational localisations at `|f| ≤ 1`, `|f| ≥ 1`, `|f| = 1` form a glueing square
`A → B₁, B₂ → B₁₂`, with no noetherian hypothesis (KL15 Lem. 2.4.22, p. 46, proof of Thm 2.4.23, p.
47). Lean: `GlueingSquare.of_simpleLaurent`.

**Strongly noetherian Laurent glueing.** (*strongly-noetherian-laurent-gluing*) For `A` complete
Hausdorff strongly noetherian Tate, `A⁺` integral elements and the simple Laurent square of `f ∈ A`,
every finite glueing datum comes from a finite `A`-module (its sections), unique up to unique
isomorphism, without projectivity (Kiehl-AB §1, proof of Satz 1.4, p. 266; DLLZ-A Lem. A.3, pp.
95–96, Thm A.8, p. 97; KL15 Rem. 2.5.23, pp. 52–53). Lean:
`GlueingDatum.finite_sections_of_simpleLaurent` (uniqueness README only).

**Coherent sheaves.** (*coherent-sheaf*) On a locally noetherian adic space `X` (AdicSpacesPartII
R0) an `𝒪_X`-module `F` is coherent if `X` has an open affinoid covering `Spa(A_i, A_i⁺)`, `A_i`
complete of noetherian type, with `F|_{U_i} ≅ M̃_i`, `M_i` finite; `Coh(X)` is the full subcategory.
Coherence is local, gives finite type and finite stalks, and with strongly noetherian Tate charts is
`SheafOfModules.IsFinitePresentation` (Kiehl-E Def. 0.5, p. 195; Kiehl-AB Def. 2.1.2, p. 270;
Huber96 Rem. 1.3.17, p. 59). Check: `j_!𝒪_U`, `U = {|T| ≤ |ϖ|}`, is not coherent.

**Kiehl's theorem.** (*tate-kiehl-affinoid*) For `A` complete Hausdorff strongly noetherian Tate,
`A⁺` integral elements and `X = Spa(A, A⁺)`, `F` is coherent iff `F ≅ M̃` with `M` finite (then
`M ≅ F(X)`); `M ↦ M̃` is an exact tensor equivalence onto `Coh(X)` with inverse `F ↦ F(X)`, i.e.
finite modules satisfy effective descent along finite rational coverings (KL15 Thm 2.5.20(b), p. 52;
Kiehl-AB Thm 1.2, p. 259, Satz 2.2, p. 270).

### R3.3 Operations, coherent ideals and finite algebras

**Small perturbations.** (*surjection-small-perturbation*) For `B` complete Hausdorff Tate and a
continuous `B`-linear surjection `f : M → N` of complete Hausdorff modules topologised by open
bounded `B₀`-submodules, `f − ε` is onto for all continuous `ε` with `|ε| < c`, some `c > 0`
(Kiehl-E Lem. 1.3, p. 198).

**Operations on `Coh(X)`.** (*coherent-sheaf-operations*) For locally noetherian analytic adic
spaces `X`, `Y` with complete strongly noetherian Tate affinoid charts, `Coh(X)` is an exactly
embedded abelian subcategory closed under kernels, cokernels, extensions, `⊗` and `ℋom`;
`f* : Coh(X) → Coh(Y)` is right exact monoidal (exact for flat `f`) and functorial, with
`f*M̃ ≅ (M ⊗_A B)~` locally; base change is pullback and supports are closed (Kiehl-AB Def. 2.1.2,
p. 270; Kiehl-E §0, p. 197; Conrad-RA Ex. 2.2.11, p. 13).

**Coherent ideals.** (*coherent-ideal-closed-subspace*) For `X` as above, `I ↦ (Supp(𝒪_X/I), 𝒪_X/I)`
is a bijection from coherent ideals to closed adic subspaces (AdicSpacesPartII R0), inverse
`Z ↦ ker(𝒪_X → i_*𝒪_Z)`, with `V(J̃) = Spa(A/J, (A/J)⁺)` on strongly noetherian Tate affinoids,
`(A/J)⁺` the integral closure of `A⁺` (Kiehl-E §0, p. 197; Huber96 (1.4.1), p. 60). Check: `(T)`,
`(T²)` give `Spa(K)`, `Spa(K[T]/(T²))`.

**Finite morphisms.** (*finite-morphism-coherent-algebra-equivalence*) For `X` as above,
`f ↦ f_*𝒪_Y` is an anti-equivalence from finite morphisms `Y → X` (AdicSpacesPartII R0) to
`𝒪_X`-algebras coherent as modules, inverse `Spa_X(𝒜)` glued from `Spa(𝒜(U), 𝒜(U)⁺)`, `𝒜(U)⁺` the
integral closure of `A⁺`, compatible with base change where fibre products exist (Conrad-RA Cor.
2.2.8, p. 12, proof of Thm 3.1.5, p. 21).

### R3.4 Quasi-Stein spaces

**Quasi-Stein spaces.** (*quasi-stein-space*) For `X` locally of finite type over `Spa(K, K°)`, `K`
complete nonarchimedean and nontrivially valued, `X` is quasi-Stein if `X = ⋃ Uₙ` for increasing
affinoid opens with dense restrictions `𝒪(U_{n+1}) → 𝒪(Uₙ)`, and Stein if some increasing affinoid
exhaustion (density not imposed) has `Uₙ = {x ∈ U_{n+1} : |gᵢ(x)|^m ≤ |aₙ|}` for topological
generators `gᵢ` of `𝒪(U_{n+1})`, `m ≥ 1`, `0 < |aₙ| < 1`. Affinoids, open polydiscs, `A^{m,ad}_K`,
closed subspaces and fibre products over `K` are quasi-Stein, as are Stein spaces (Kiehl-AB Def.
2.3, pp. 270–271). Check: `P^{1,an}_K` is not (`H¹(𝒪(−2)) ≠ 0`).

**Dense restriction.** (*quasi-stein-dense-restriction*) For quasi-Stein `X = ⋃ Uₙ` and coherent
`F`, `F(U_{n+1})` and `F(X)` have dense image in `F(Uₙ)` (Kiehl-AB Hilfssatz 2.5, p. 271).

**Theorem B.** (*quasi-stein-theorems-a-b*) For quasi-Stein `X` and coherent `F`, `Hⁱ(X, F) = 0` for
`i > 0` (Kiehl-AB Satz 2.4, 2.4.2, p. 271, proof p. 272).

**Theorem A.** (*quasi-stein-theorem-a*) For quasi-Stein `X` and coherent `F`, the image of `F(X)`
generates every `F(Uₙ)` and every stalk `F_x` (Kiehl-AB Satz 2.4.3, p. 271).

**Open polydiscs.** (*open-polydisc-coherent-acyclicity*) For `K` nontrivially valued and
`r ∈ ℝ_{>0}^m`, the open polydisc (the union of closed polydiscs of radii `ρ_i < r_i` in `√|K^×|`,
not `{|T_i| < r_i}`) is quasi-Stein, so coherent cohomology vanishes in positive degrees and stalks
are globally generated (Kiehl-AB §2, after Def. 2.3, p. 271).

**Quasi-Stein direct images.** (*quasi-stein-direct-image-acyclicity*) For an open immersion
`j : U → X` of spaces locally of finite type over `K` with every `U ∩ V`, `V` affinoid, quasi-Stein,
`R^q j_*F = 0` for `q > 0` and `(j_*F)(V) = F(U ∩ V)`, `F` coherent (Kiehl-AB proof of Satz 2.4, p.
272).

### R3.5 Vector bundles on sheafy Tate affinoids and uniform rings

**Split injections.** (*split-injection-completed-base-change*) For complete Hausdorff Tate rings
`R`, `R̃`, `S` with continuous `R`-algebra maps and a continuous `R`-linear retraction `σ : R̃ → R`,
`x ⊗ s ↦ σ(x)s` retracts `S → R̃ ⊗̂_R S`, a closed embedding (HK Rem. 7.2, p. 25; Berkeley Prop.
6.3.3).

**Vector bundles.** (*locally-free-sheaf*) A vector bundle on an adic space `X` is an `𝒪_X`-module
locally isomorphic to `𝒪^{n_i}` (`SheafOfModules.isFiniteLocallyFree`); the rank is locally
constant, pullback preserves bundles, and on locally noetherian `X` they are coherent (KL15 Def.
2.7.6, p. 58, Def. 1.1.2(e), p. 12; Scholze13 Lem. 7.3(i), p. 42).

**Projective descent.** (*glueing-square-finite-projective-descent*) For a glueing square (with
(a)–(c)) and a finite projective glueing datum, the sections `M` are finite projective over `R` with
`M ⊗_R R_i ≅ M_i` (KL15 Prop. 2.7.5, p. 57, Lem. 1.3.9(a), p. 18). Lean:
`GlueingDatum.projective_sections`.

**Kiehl glueing, sheafy case.** (*sheafy-tate-acyclicity-and-kiehl-gluing*) For a complete sheafy
Tate Huber pair and rational `U = Spa(B, B⁺)`, `P ↦ P̃` is an equivalence from finite projective
`B`-modules to vector bundles on `U`, inverse `E ↦ E(U)`, compatible with `⊗`, duals and pullback,
without noetherian hypotheses (KL15 Thm 2.7.7, p. 58, Rem. 2.7.1, p. 56).

**Acyclicity of `P̃`.** (*finite-projective-module-acyclicity*) For a complete sheafy Tate pair and
finite projective `P`, `P̃` is a sheaf with exact rational Čech complexes, `P̃(U) = P ⊗_A 𝒪_X(U)`
and `Hⁱ(U, P̃) = 0` for `i > 0` (KL15 proof of Thm 2.7.7, p. 58).

**Global generation.** (*vector-bundle-global-generation*) On a sheafy Tate affinoid every vector
bundle is a split quotient of some `𝒪_Xⁿ` (KL15 Def. 2.7.6, p. 58).

**Finite étale descent.** (*finite-projective-etale-descent*) For complete sheafy Tate pairs
`(A, A⁺) → (B, B⁺)` with `B` finite étale and faithfully flat over `A`, `B⁺` the integral closure of
`A⁺`, finite projective `A`-modules are finite projective `B`-modules with descent data (Scholze13
proof of Lem. 7.3, p. 42; KL15 Thm 1.3.4, 1.3.5, p. 16).

**Uniform rings.** (*uniform-iff-power-bound*) For a complete Tate ring with a submultiplicative
norm defining its topology: (i) the norm is equivalent to a power-multiplicative norm iff to the
spectral seminorm iff `|x²| ≥ c|x|²` with `c > 0`; (ii) these imply `A°` bounded, which alone makes
the spectral seminorm a norm defining the topology; (iii) if some topologically nilpotent unit has
`|z|·|z⁻¹| = 1`, bounded `A°` (`TauCeti.Huber.IsUniform`) implies (i); (iv) not in general (KL15
Def. 2.8.1, p. 59; KL16 App. A, p. 189; HK Def. 2.10, p. 5). Lean: `Huber.isUniform_tfae` (part
(i)).

**Stable uniformity by splitting.** (*stably-uniform-sheafy*) If `(A, A⁺) → (B, B⁺)` is a morphism
of complete Tate pairs, `B` stably uniform and `A → B` split by a continuous `A`-linear map, `A` is
stably uniform, hence sheafy; in particular, for a complete Tate `K`-algebra `A` and complete `L/K`,
stable uniformity descends from `A ⊗̂_K L` to `A` when `L → K` has a continuous `K`-linear
retraction (KL15 Rem. 2.8.12, p. 63; Berkeley proof of Prop. 6.3.4, p. 48).

**Spectral norms.** (*uniform-spectral-seminorm*) A continuous map `φ : A → B` of uniform complete
Tate rings with compatible norm data is submetric for the spectral norms, and isometric iff the
image of `M(B) → M(A)` is a boundary for `A`, e.g. if it is onto, which is not necessary (KL15 Rem.
2.8.3(a), p. 59, Thm 2.3.10, p. 35; HK Prop. 3.5, p. 6).

### R3.6 The sheaf of continuous differentials and Kiehl's proper mapping theorem

**Continuous differentials.** (*sheaf-of-continuous-differentials*) For `f : X → Y` locally of
finite type between locally noetherian analytic adic spaces, a coherent `Ω¹_{X/Y}` with
`f⁻¹𝒪_Y`-linear `d` is `(Ωᶜ_{B/A})~` (AdicSpacesPartII R0) on affinoids. (a) It represents
continuous derivations into coherent `F`; (b) the first fundamental sequence of `X → Y → Z` and the
conormal sequence of a closed embedding are exact; (c) `Ω¹ = 0` iff `f` is unramified, it is a
bundle of rank `n` for `f` smooth of relative dimension `n`, and `f*Ω¹_{Y/Z} ≅ Ω¹_{X/Z}` for étale
`f`; (d) it satisfies base change; (e) `(Ω¹_{X/Y})^an ≅ Ω¹_{X^an/Y^an}` for schemes locally of
finite type over `K` (Stacks Def. 29.33.1); (f) `Ωⁱ = ⋀ⁱ Ω¹` is coherent, of rank `C(n, i)` for
smooth `f`, and forms the de Rham complex (Huber96 (1.6.2), Prop. 1.6.3, pp. 77–78; DLLZ-A §3.3, pp.
34–39; Scholze13 Def. 6.8(i), p. 37; GK02 1.1, p. 4; GK00 4.1, p. 19; Conrad-AWS Ex. 3.1.4, p. 23).

**Kiehl's proper mapping theorem.** (*kiehl-proper-mapping-theorem*) For `K` complete
nonarchimedean, nontrivially valued, and `f : X → Y` proper (AdicSpacesPartII R0) between spaces
locally of finite type over `Spa(K, K°)` that is Kiehl-proper over each affinoid `Spa(A, A°) ⊆ Y`
(finite affinoid coverings `V_i ⋐_A U_i`; automatic for discretely valued `K`), every `Rⁱf_*F`, `F`
coherent, is coherent with `(Rⁱf_*F)|_V ≅ Hⁱ(f⁻¹V, F)~` (Kiehl-E Thm 3.3, p. 206; Conrad-RA App.
A.1, pp. 38–39; Huber96 Rem. 1.3.17, p. 59). In the rest of R3.6, `A` is an affinoid `K`-algebra
with `A⁺ = A°`, spaces are locally of finite type over `Spa(K, K°)`, and proper maps to `Spa(A, A°)`
are assumed Kiehl-proper.

**Completely continuous maps.** (*completely-continuous-map*) For a ring of definition `A₀ ⊇ K°` of
`A` and Banach `A`-modules (topology from an open bounded `A₀`-submodule `M₀`), `f : M → N` is
completely continuous if it is an operator-norm limit of continuous `f_i` with finitely generated
image, and strictly so if one `a ∈ K° ∖ 0` puts each `a·f_i(M₀)` in a finitely generated
`A₀`-submodule of `N₀`; these form a closed submodule stable under composition, and `Σ vᵢ ⊗ nᵢ` with
bounded `vᵢ`, `nᵢ → 0` is strict (Kiehl-E Def. 1.1, p. 198). Check: `id` of `K⟨T⟩` over `K` is not.

**Schwartz finiteness.** (*completely-continuous-finite-cokernel*) For a continuous `A`-linear
surjection `f : M → N` of Banach modules and completely continuous `g`, `(f + g)(M)` is closed of
finitely generated cokernel (Kiehl-E Satz 1.2, p. 198).

**Closed targets.** (*strictly-completely-continuous-closed-target*) For `N ⊆ G` closed in a Banach
`A`-module (ultrametric norms, integral affinoid presentation of `A₀`) and `M` topologically free,
strict complete continuity of `M → G` passes to `M → N`; every Banach module is a quotient of a
topologically free one (Kiehl-E Satz 1.4, p. 199).

**Relative compactness.** (*relatively-compact-affinoid*) For `V = Spa(B, B°)`, `B` topologically of
finite type over `A`, an affinoid open `U` is `⋐_A V` if `U ⊆ {|X_i| ≤ ε}` for a closed immersion
`V ↪ Dⁿ_A` and `ε < 1` in `√|K^×|`; this is monotone, stable under intersection, products and base
change, and `Spa B ⋐_A Spa B` for finite `B` (Kiehl-E Def. 2.1, pp. 202–203; Huber96 Rem. 1.3.19,
pp. 59–60). Check: the closed disc is not `⋐_K` itself.

**Relatively compact covers.** (*proper-relatively-compact-covers*) A proper `f : X → Spa(A, A°)` is
quasi-compact and separated, and Kiehl-proper if `K` is discretely valued (in general granting
Temkin's comparison, AdicSpacesPartII R1); Kiehl-proper implies proper (Kiehl-E Def. 2.3, p. 202;
Conrad-RA App. A.1, p. 38).

**Strict restriction.** (*restriction-strictly-completely-continuous*) For affinoids `U ⋐_A V` and
coherent `F` on `V`, some topologically free `M′ ↠ F(V)` makes `M′ → F(U)` strictly completely
continuous over `A` (Kiehl-E §2, before Satz 2.5, p. 204).

**Finiteness over affinoids.** (*proper-affinoid-cohomology-finite*) For proper `f : X → Spa(A, A°)`
and coherent `F`, `Hⁱ(X, F)` is a finite `A`-module and affinoid Čech complexes are strict (Kiehl-E
Satz 2.6, p. 205; Conrad-RA proof of Thm A.1.2, p. 39).

**Adic completion.** (*proper-cohomology-adic-completion*) For proper `f : X → Spa(A, A°)`, coherent
`F` and an ideal `𝔞 ⊆ A`, `Hⁱ(X, F)^∧_𝔞 ≅ lim_k Hⁱ(X, F/𝔞ᵏF)` (`a`-good, with null systems, for
`𝔞 = (a)`) (Kiehl-E Thm 3.4, p. 206, Thm 3.7, p. 210; EGA III₁ (4.1.5), p. 125).

**Affinoid subdomains.** (*proper-cohomology-affinoid-subdomain*) For proper `f : X → Spa(A, A°)`,
coherent `F` and an affinoid subdomain `U = Spa(B, B°)`, `Hⁱ(X, F) ⊗_A B ≅ Hⁱ(f⁻¹U, F)` (Kiehl-E
Satz 3.5, p. 209; KL15 Lem. 2.5.17, p. 51).

**Countable type.** (*countable-type-closed-subspace-section*) A closed subspace of a `K`-Banach
space of countable type has a closed complement, so strict exact sequences of such spaces split and
stay strict exact under `K′ ⊗̂_K −` (Conrad-IC proof of Lem. 1.1.5, p. 7).

**Base-field extension.** (*affinoid-completed-field-extension*) For affinoid `A` and complete
`K′/K`, `A → K′ ⊗̂_K A` is faithfully flat and `(K′ ⊗̂_K A) ⊗_A M ≅ K′ ⊗̂_K M` for finite `M`
(Conrad-IC Lem. 1.1.5, p. 6).

**Field extension of cohomology.** (*proper-coherent-cohomology-field-extension*) For proper
`f : X → Spa(A, A°)`, coherent `F` and complete `K′/K`,
`(K′ ⊗̂_K A) ⊗_A Hⁱ(X, F) ≅ Hⁱ(X ⊗̂_K K′, F′)` (Conrad-RA Thm A.1.2, p. 39; Scholze13 proof of Lem.
7.13, p. 47).

**Finite flat base change.** (*proper-cohomology-finite-flat-base-change*) For finite flat
`T = Spa(B, B°) → S = Spa(A, A°)`, `f : X → S` proper and `F` coherent,
`Hⁱ(X, F) ⊗_A B ≅ Hⁱ(X ×_S T, F)` (Scholze13 proof of Prop. 9.2, p. 54).

**Étale base change.** (*proper-coherent-base-change*) For `g : T → S` étale between affinoids,
`f : X → S` proper and `F` coherent, `g*Rⁱf_*F ≅ Rⁱf_{T*}(F|_{X ×_S T})` (Scholze13 Prop. 9.2(ii),
p. 54).

**Almost noetherianity.** (*almost-noetherian-integral-affinoid-modules*) For rank-one `K`, `A`
affinoid, `A₀` a ring of definition that is a quotient of `K°⟨X₁,…,Xₙ⟩`, `N` a submodule of a finite
`A₀`-module and `0 < ε < 1`, some finitely generated `N′ ⊆ N` has `aN ⊆ N′` for `|a| ≤ ε`; `N` is
finitely generated if `K` is discretely valued (Kiehl-E Satz 5.1, p. 212).

### R3.7 Proper GAGA

**Analytification is coherent.** (*analytification-coherent*) Here, with `K` as in R3.6, `A` is
affinoid over `K` (`A = K` allowed), `X` is locally of finite type over `Spec A`,
`X^an = X ×_{Spec A} Spa(A, A°)` and `F^an = ι*F` (AdicSpacesPartII R1). For coherent `F`, `F^an` is
coherent, with `F^an|_{Spa C} ≅ (M ⊗_B C)~` for `F = M̃` on `Spec B` (Conrad-RA Ex. 2.2.11, p. 13;
Scholze13 Thm 9.1(ii), p. 53).

**GAGA comparison maps.** (*gaga-comparison-map*) For `f : X → Y`, `c_F : Hⁱ(X, F) → Hⁱ(X^an, F^an)`
(unit `F → ι_*ι*F`, then edge map) and the relative `(Rⁱf_*F)^an → Rⁱf^an_*(F^an)` are `A`-linear,
δ-functorial, compatible with composition and base change, and equal to `F(X) → F^an(X^an)` in
degree `0` (Conrad-RA App. A.1, pp. 38–39, Ex. 3.2.6, p. 24). Check: fails for `A¹_K`.

**Analytic projective space.** (*analytic-projective-space-cohomology*) For `n ≥ 0`, `m ∈ ℤ`,
`Hⁱ(Pⁿ_A, 𝒪(m)) ≅ Hⁱ((Pⁿ_A)^an, 𝒪(m)^an)` via `c`: zero for `0 < i < n`, `H⁰ = A[x₀,…,xₙ]_m` for
`n ≥ 1`, `Hⁿ` dual to `H⁰(𝒪(−m−n−1))`, `H⁰ = A` if `n = 0` (Conrad-RA App. A.1, p. 38, Rem. 3.1.3,
p. 19).

**Proper GAGA.** (*proper-gaga*) For `f : X → Y` proper over `Spec A` and coherent `F`, `f^an` is
proper and Kiehl-proper (Chow's lemma, rigid–adic comparison) and `(Rⁱf_*F)^an ≅ Rⁱf^an_*(F^an)`; so
`Hⁱ(X, F) ≅ Hⁱ(X^an, F^an)` for proper `X` (Conrad-RA §2.3, after (2.3.12), p. 17, App. A.1, p. 38,
Ex. 3.2.6, p. 24; Scholze13 Thm 9.1(ii), p. 53; Kiehl-E §4, p. 211).

**GAGA equivalence.** (*proper-gaga-coherent-equivalence*) For `X` proper over `Spec A`, `F ↦ F^an`
is an exact tensor equivalence `Coh(X) → Coh(X^an)`; bundles, ideals and closed subspaces correspond
(Scholze13 Thm 9.1(i), p. 53; Conrad-MR §1.3, p. 2).

**Finite covers.** (*gaga-finite-covers*) For `X` proper over `K`, finite `Y → X^an` are the `Y₀^an`
for finite `Y₀ → X`, uniquely, and `Y₀` is projective if `X` is (Conrad-RA proof of Thm 3.1.5, p.
21, Thm 2.2.5(3), p. 10).

### R3.8 Finite locally free traces and pull–identify–trace

**Projective trace.** (*projective-module-trace*) For finite projective `M` over a commutative ring
`R`, `tr_M = contractLeft ∘ dualTensorHomEquiv⁻¹ : End_R(M) → R`; Mathlib's trace equals it for free
`M` but is `0` without a basis; it is cyclic, commutes with base change, and `tr(id) = rank_𝔭 M` in
`R_𝔭` (Stacks 02DU, 0BVH; KL15 Def. 1.1.2, p. 11). Check: `tr(id) = (1, 0)` for `ℚ × 0` over
`ℚ × ℚ`. On `R²` the trace of `!![a, b; c, d]` is `a + d`. Lean: `LinearMap.projectiveTrace`,
`LinearMap.projectiveTrace_eq_trace`, `LinearMap.projectiveTrace_baseChange`.

**Algebra trace.** (*finite-locally-free-algebra-trace*) For a commutative `R`-algebra `B` finite
projective as a module, `Tr_{B/R}(b) = tr_B(m_b)`, with `Tr(1)` the locally constant degree and
unnormalised symmetric trace form `Tr(xy)` (Stacks 02DV, 0BVH; KL15 §1.2, p. 13). Check: `Tr(1) = 2`
on `k[x]/(x²)`. Lean: `Algebra.projectiveTrace`, `Algebra.projectiveTraceForm`.

**Trace base change.** (*algebra-trace-base-change*) For `R → R′`, finite projective `M` with
`f ∈ End_R(M)` and a finite projective algebra `B`, `tr_{R′ ⊗ M}(id ⊗ f)` and
`Tr_{R′ ⊗ B/R′}(1 ⊗ b)` are the images of `tr_M(f)` and `Tr_{B/R}(b)` (Stacks 02DV, 0BJF). Lean:
module half `LinearMap.projectiveTrace_baseChange`.

**Trace transitivity.** (*algebra-trace-transitivity*) For `B` finite projective over `R` and `C`
over `B`, `C` is finite projective over `R` and `Tr_{C/R} = Tr_{B/R} ∘ Tr_{C/B}`; likewise for
`tr_{M/R}` of finite projective `B`-modules (Stacks 02DU). Lean: `Algebra.projectiveTrace_trans`
(the algebra tower).

**Étale criterion.** (*etale-iff-trace-pairing-perfect*) A finite projective `R`-algebra `S` is
étale iff `x ↦ (y ↦ Tr_{S/R}(xy))` is an isomorphism `S → Hom_R(S, R)` (KL15 §1.2, p. 13; Stacks
0BJF, 0BIL). Checks: on `R[x]/(x² − d)`, `Tr(a + bx) = 2a` and the trace form has Gram matrix
`diag(2, 2d)` in the basis `1, x`; in characteristic `2`, `k[x]/(x² − 1) = k[x]/((x − 1)²)` is not
étale and its trace form vanishes. Lean: `Algebra.etale_iff_projectiveTraceForm_bijective`.

**Sum over embeddings.** (*trace-geometric-point-formula*) For `B` finite étale over a field `k` and
algebraically closed `Ω ⊇ k`, `|Hom_k(B, Ω)| = dim_k B` and `Tr_{B/k}(b) = Σ_σ σ(b)` (Stacks 03SH,
0BIL). Check: fails for `k[x]/(x²)`.

**Scheme trace.** (*scheme-trace-finite-locally-free*) For `π : X → Y` finite, flat, locally of
finite presentation, `Tr_π : π_*𝒪_X → 𝒪_Y` is `Tr_{B/A}` on affines; `Tr_π ∘ π^♯` is the degree, and
`Tr` commutes with base change and composition and detects étaleness, the finite case of
SchemeAndStackFoundations SF.2 (*trace*) (Stacks 0BVH).

**Finite locally free maps.** (*finite-locally-free-morphism*) A finite `f : Y → X` of adic spaces
(AdicSpacesPartII R0) is finite locally free if `f_*𝒪_Y` is a vector bundle; over complete Tate
affinoids with affinoid preimage (all if strongly noetherian) it is `Spa(B, B⁺)` with `B` finite
projective; the class is stable under composition, base change (where fibre products exist) and
analytification, and is proper (Zavyalov-Q Thm B.2.18, p. 47; KL15 Rem. 2.4.2, p. 38; BHW Def. 10.2,
p. 1789).

**Projection formula.** (*finite-locally-free-projection-formula*) For finite locally free `f` and a
vector bundle `E` (or `X` locally noetherian analytic, `f` finite, `E` coherent),
`f_*𝒪_Y ⊗ E ≅ f_*f*E` (BHW Def. 10.2, p. 1789).

**Analytic trace.** (*analytic-trace-finite-locally-free*) For finite locally free `f : Y → X`,
`Tr_f : f_*𝒪_Y → 𝒪_X` is the vector-bundle trace of multiplication on `f_*𝒪_Y`, equal to `Tr_{B/A}`
on sheafy Tate affinoids, with `Tr_f ∘ f^♯` the degree (BHW Def. 10.2, p. 1789; Stacks 0BVH, 03SH).
Check: `Tr(1)(0) = 2` for `z ↦ z²`.

**Trace base change and composition.** (*trace-base-change-composition*) For finite locally free
`f`, `g*Tr_f = Tr_{f′}` along `g : X′ → X` whenever the fibre product exists (AdicSpacesPartII R0),
and `Tr_{h∘f} = Tr_h ∘ h_*(Tr_f)` (Stacks 0BJF, 02DV).

**Finite étale traces.** (*finite-etale-trace-pairing*) A finite étale `f` (AdicSpacesPartII R0) is
finite locally free with perfect trace pairing, and `Tr_f(s)(x)` sums over the geometric points of
the fibre; a perfect pairing forces étaleness (KL15 §1.2, p. 13; Stacks 0BJF).

**Analytified traces.** (*analytic-algebraic-trace-compatibility*) For `π` finite locally free
between schemes locally of finite type over `Spec A`, `π^an` is finite locally free of the same
degree and `(Tr_π)^an = Tr_{π^an}` (Stacks 0BVH; Conrad-RA Thm 2.2.5(3), p. 10).

**Pull–identify–trace.** (*pull-identify-trace*) For `Y ← C → X` with any `q` and `p` finite locally
free, bundles (or coherent, noetherian case) `E_Y`, `E_X` and `φ : q*E_Y → p*E_X`,
`T(C, φ) : Hⁱ(Y, E_Y) → Hⁱ(X, E_X)` is `q*`, `φ`, the projection formula, then `Tr_p ⊗ id`,
unnormalised; additive, compatible with composition (when the fibre product exists), analytification
and restriction, and `T(1) = deg p` on `H⁰` (BHW Def. 10.2, p. 1789; Stacks 03SH).

### R3.9 The Gel'fand spectrum of a Banach ring

**Gel'fand spectrum.** (*gelfand-spectrum-banach-ring*) For a complete normed commutative ring `A`,
`M(A)` is the set of multiplicative seminorms bounded by a multiple of the norm, with the pointwise
topology; it is compact Hausdorff, nonempty if `A ≠ 0`, contravariant in bounded ring maps, and
`lim ‖xⁿ‖^{1/n} = max_{α ∈ M(A)} α(x)` (Berkovich Thm 1.2.1, 1.3.1; KL15 Thm 2.3.4, p. 34, Thm
2.3.10, p. 35). Checks: `M(ℚ_p)` is the `p`-adic norm alone; `M(0) = ∅`, the maximum then being read
as `0`; every point vanishes on nilpotents. Lean: `Huber.GelfandSpectrum`,
`GelfandSpectrum.compactSpace_nonempty`, `GelfandSpectrum.smoothingFun_eq_sSup` (functoriality
README only).

### Examples

For `A = K⟨T⟩`, `M = A/(T)` and the cover `|T| ≤ |ϖ|`, `|T| ≥ |ϖ|`, the Čech complex of `M̃` is
`0 → K → K ⊕ 0 → 0`, since `T` is a unit on the outer piece. For `B = R[x]/(x² − d)`,
`Tr(a + bx) = 2a` and the trace-pairing matrix is `diag(2, 2d)`, of determinant `8` over `ℚ` at
`d = 2` and zero in characteristic `2`. Restriction from the unit disc to `|T| ≤ |ϖ|` scales the
coefficient of `Tⁿ` by `ϖⁿ`, so truncation below degree `N` errs by at most `|ϖ|^N`; for the
identity no finite-rank truncation comes within `1`.

### Dependencies

AdicSpacesPartII R0 (*noetherian-rod-sheafy*, *tate-ring-norm*, *spectral-seminorm*,
*completed-tensor-product*, *locally-noetherian-adic-space*, *fibre-products-existence*,
*closed-adic-subspaces-and-embeddings*, *finite-morphism*, *continuous-differentials*, Banach
modules) and R1 (*analytification-of-modules*, *rigid-adic-comparison-functor*,
*analytic-affine-space*, *analytic-projective-space-proper*); layer F0 (formal functions, Chow's
lemma and dévissage, projective bundles) and the tubes of R2; AdicSpaces layers 0.2, 3.1, 3.4, 3.5,
4.1, 4.2, 5, 5.2; SchemeAndStackFoundations SF.2 (*ample-serre-vanishing*, the scheme trace);
AdicEtaleGeometry A1 (*etale-structure-sheaf*).

## Downstream consumers

[AdicSpacesPartIV](../AdicSpacesPartIV/README.md) uses formal models, coherent sheaves and
differentials for families and dagger geometry, and the completed tensor product of adic rings.
[AdicEtaleGeometry](../AdicEtaleGeometry/README.md) A2 uses the formal schemes and generic fibres
of F0 and R2 and the sheaf of continuous differentials of R3.
[PerfectoidSpaces](../PerfectoidSpaces/README.md) P1.12 uses the Gel'fand spectrum of R3.9, and
P0.12, P0.15 the classical traces of R3.8. [DiamondsAndVStacks](../DiamondsAndVStacks/README.md)
D5.13 uses the Gel'fand spectrum, and its formal interfaces use the formal spectrum of F0 and the
specialisation map of R2. The étale-cohomology, Shimura-variety, rigid-cohomology and `p`-adic
Hodge theory roadmaps use the coherent and differential sheaves of R3 and the formal models, Hasse
domains and residue discs of R2.

## References

- [Bourbaki] Nicolas Bourbaki, *Commutative Algebra*, Hermann, 1972, Ch. III, §2, no. 12.
- [Huber94] Roland Huber, *A generalization of formal schemes and rigid analytic varieties*, Math. Z. 217 (1994), 513–551. https://gdz.sub.uni-goettingen.de/id/PPN266833020_0217
- [Huber96] Roland Huber, *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces*, Aspects of Mathematics E30, Vieweg 1996 (not freely available). https://link.springer.com/book/10.1007/978-3-663-09991-8
- [Wedhorn] Torsten Wedhorn, *Adic Spaces*, arXiv:1910.05934v1 (14 Oct 2019). https://arxiv.org/abs/1910.05934v1
- [Hübner] Katharina Hübner, *Adic spaces*, arXiv:2405.06435v1 (10 May 2024). https://arxiv.org/abs/2405.06435
- [KL15] Kiran S. Kedlaya, Ruochuan Liu, *Relative p-adic Hodge theory: Foundations*, arXiv:1301.0792v5 (9 May 2015). https://arxiv.org/abs/1301.0792
- [Conrad-AWS] Brian Conrad, *Several approaches to non-archimedean geometry*, Arizona Winter School 2007 lecture notes. https://math.stanford.edu/~conrad/papers/aws.pdf
- [Berkeley] Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Annals of Mathematics Studies 207 (2020). https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf
- [EGA I] A. Grothendieck, J. Dieudonné, *Éléments de géométrie algébrique I*, Publ. Math. IHÉS 4 (1960). http://www.numdam.org/item/PMIHES_1960__4__5_0/
- [HK] David Hansen, Kiran S. Kedlaya, *Sheafiness criteria for Huber rings*, version dated August 6, 2026. https://kskedlaya.org/papers/criteria.pdf
- [EGA III₁] A. Grothendieck, J. Dieudonné, *Éléments de géométrie algébrique III (première partie)*, Publ. Math. IHÉS 11 (1961). http://www.numdam.org/item/PMIHES_1961__11__5_0/
- [Stacks] The Stacks Project Authors, *The Stacks Project*, cited by tag. https://stacks.math.columbia.edu
- [Zavyalov-Q] Bogdan Zavyalov, *Quotients of admissible formal schemes and adic spaces by finite groups*, arXiv:2102.02762v2 (7 June 2023); published in Algebra & Number Theory 18(3) (2024) 409–475. https://arxiv.org/abs/2102.02762
- [Scholze13] Peter Scholze, *p-adic Hodge theory for rigid-analytic varieties*, arXiv:1205.3463v2 (3 Nov 2012) (Forum Math. Pi 1 (2013)). https://arxiv.org/abs/1205.3463
- [FK] Kazuhiro Fujiwara, Fumiharu Kato, *Foundations of Rigid Geometry I*, arXiv:1308.4734v5 (28 Feb 2017). https://arxiv.org/abs/1308.4734
- [BHW] Christopher Birkbeck, Ben Heuer, Chris Williams, *Perfectoid Hilbert modular forms and overconvergent Hilbert modular forms*, Annales de l'Institut Fourier 2023. https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf
- [DLLZ-A] Hansheng Diao, Kai-Wen Lan, Ruochuan Liu, Xinwen Zhu, *Logarithmic adic spaces: some foundational results*, arXiv:1912.09836v2 (30 Oct 2022); PDF page = printed page. https://arxiv.org/abs/1912.09836
- [Conrad-IC] Brian Conrad, *Irreducible components of rigid spaces*, Ann. Inst. Fourier 49 (1999); author PDF irredpaper.pdf. https://math.stanford.edu/~conrad/papers/irredpaper.pdf
- [Conrad-RA] Brian Conrad, *Relative ampleness in rigid geometry*, Ann. Inst. Fourier 56 (2006) 1049–1126; author PDF amplepaperfinal.pdf (45 pp.). https://math.stanford.edu/~conrad/papers/amplepaperfinal.pdf
- [Conrad-MR] Brian Conrad, *Modular curves and rigid-analytic spaces*, Pure Appl. Math. Q. 2 (2006); author PDF genpaper.pdf. https://math.stanford.edu/~conrad/papers/genpaper.pdf
- [Conrad-GEC] Brian Conrad, *Arithmetic moduli of generalized elliptic curves*, J. Inst. Math. Jussieu 6 (2007) 209–278; author PDF. https://math.stanford.edu/~conrad/papers/kmpaper.pdf
- [BL I] Siegfried Bosch, Werner Lütkebohmert, *Formal and rigid geometry I. Rigid spaces*, Math. Ann. 295 (1993) 291–317. https://gdz.sub.uni-goettingen.de/id/PPN235181684_0295
- [GK00] Elmar Grosse-Klönne, *Rigid analytic spaces with overconvergent structure sheaf*, arXiv:1408.3329v1 (14 Aug 2014), author's version of J. reine angew. Math. 519 (2000) 73–95, with a footnote to Lemma 4.7 correcting the published hypotheses. https://arxiv.org/abs/1408.3329
- [BL II] Siegfried Bosch, Werner Lütkebohmert, *Formal and rigid geometry II. Flattening techniques*, Math. Ann. 296 (1993) 403–429. https://gdz.sub.uni-goettingen.de/id/PPN235181684_0296
- [GK02] Elmar Grosse-Klönne, *Finiteness of de Rham cohomology in rigid analysis*, arXiv:1408.3327v1 (author's version of Duke Math. J. 113 (2002)). https://arxiv.org/abs/1408.3327
- [TT] Fucheng Tan, Jilong Tong, *Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case*, arXiv:1510.05543v2. https://arxiv.org/abs/1510.05543v2
- [Scholze15] Peter Scholze, *On torsion in the cohomology of locally symmetric varieties*, arXiv:1306.2070v2; published Ann. of Math. 182 (2015) 945–1066. https://arxiv.org/abs/1306.2070v2
- [RG] Michel Raynaud, Laurent Gruson, *Critères de platitude et de projectivité. Techniques de « platification » d'un module*, Invent. Math. 13 (1971) 1–89. https://gdz.sub.uni-goettingen.de/id/PPN356556735_0013
- [Kiehl-AB] Reinhardt Kiehl, *Theorem A und Theorem B in der nichtarchimedischen Funktionentheorie*, Invent. Math. 2 (1967) 256–273. https://gdz.sub.uni-goettingen.de/id/PPN356556735_0002
- [Kiehl-E] Reinhardt Kiehl, *Der Endlichkeitssatz für eigentliche Abbildungen in der nichtarchimedischen Funktionentheorie*, Invent. Math. 2 (1967) 191–214. https://gdz.sub.uni-goettingen.de/id/PPN356556735_0002
- [KL16] Kiran S. Kedlaya, Ruochuan Liu, *Relative p-adic Hodge theory, II: Imperfect period rings*, arXiv:1602.06899v3 (21 Oct 2019); locators give the printed page numbers of the arXiv PDF. https://arxiv.org/abs/1602.06899
- [Berkovich] V. G. Berkovich, *Spectral theory and analytic geometry over non-Archimedean fields*, Math. Surveys Monogr. 33, AMS 1990.
- [EGA II] A. Grothendieck, J. Dieudonné, *Éléments de géométrie algébrique II*, Publ. Math. IHÉS 8 (1961). http://www.numdam.org/item/PMIHES_1961__8__5_0/
- [Deligne–Rapoport] P. Deligne, M. Rapoport, *Les schémas de modules de courbes elliptiques*, LNM 349 (1973).
- [BGR] S. Bosch, U. Güntzer, R. Remmert, *Non-Archimedean Analysis*, Grundlehren der mathematischen Wissenschaften 261, Springer 1984.
- [Hu4] Roland Huber, *Bewertungsspektrum und rigide Geometrie*, Regensburger Mathematische Schriften 23, 1993 (Huber96's reference [Hu4]; cited through Huber96; not available online).
- [deJ] A. J. de Jong, *Crystalline Dieudonné module theory via formal and rigid geometry*, Publ. Math. IHÉS 82 (1995) 5–96 (cited through Conrad-MR as [deJ]).
- [Te] Michael Temkin, *On local properties of non-Archimedean analytic spaces*, Math. Ann. 318 (2000) 585–607 (cited through Conrad-MR as [Te]).
- [L1] Werner Lütkebohmert, *Formal-algebraic and rigid-analytic geometry*, Math. Ann. 286 (1990) 341–371 (cited through Conrad-MR and Huber96 as [L1]).
- [Liu] Qing Liu, *Un contre-exemple au « critère cohomologique d'affinoïdicité »*, C. R. Acad. Sci. Paris Sér. I 307 (1988) 83–86 (cited through Conrad-MR as [Liu]).
- [EGA I_new] A. Grothendieck, J. Dieudonné, *Éléments de géométrie algébrique I*, Grundlehren der mathematischen Wissenschaften 166, Springer 1971.
- [AM] Ahmed Abbes, Abdellah Mokrane, *Sous-groupes canoniques et cycles évanescents p-adiques pour les variétés abéliennes*, Publ. Math. IHÉS 99 (2004) 117–162 (cited through Conrad-MR).
- [EGA IV] A. Grothendieck, J. Dieudonné, *Éléments de géométrie algébrique IV*, Publ. Math. IHÉS 20, 24, 28, 32 (1964–1967) (cited through Conrad-MR and the Stacks Project).

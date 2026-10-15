# Roadmap: the Fargues–Fontaine curve as a diamond

**Summary.** This roadmap connects the fixed-field adic Fargues–Fontaine curve with the
language of diamonds, using its specified adic construction. Starting from the
period domain and Frobenius quotient of [AdicSpaces, Layer 6][adic-anchor],
construct the product description `product_iso` of the period-domain diamond, identify the
curve diamond as an effective quotient, and transport its étale and finite
étale sites. A second geometric milestone identifies a marked mixed-characteristic
untilt with an analytic closed Cartier divisor, first on the period domain and
then on the curve. The coefficient layer compares the resulting enhanced étale
categories and their derived-complete adic systems.

The distinction between a comparison and a new construction matters throughout.
The period ring, its Huber-pair topology, annuli, wandering charts and quotient
are the objects of AdicSpaces. The diamond functor, tilting and primitive kernels
are taken from their general theories. This roadmap supplies the fixed-field
formulas and the analytic argument which makes the untilt equation a closed
Cartier divisor. Its site compatibilities are useful independently of any
classification of vector bundles.

## Scope and ownership

The coefficient field is **E = Q_p**. The tilt is **S = Spa(F, O_F)**, where F is
a complete rank-one perfectoid field of characteristic p. Algebraic closedness
is required only in the stated geometric examples and in the residue-field
reduction of the norm argument. All six layers are work in this scope.

| Material | Owner and interface used here |
| --- | --- |
| Witt period ring, interval Huber pairs, radius, wandering-chart isomorphisms, actual adic quotient | [AdicSpaces, Layer 6][adic-anchor] |
| Analytic adic spaces in the Yoneda category and their fibre products | [AdicEtaleGeometry][adic-etale], **A1** |
| Marked untilts, bounded Fontaine theta, primitive kernels, integral tilts | [PerfectoidSpaces][perfectoid], **P1** |
| Glued tilting, slice equivalence and rational perfectoid localizations | PerfectoidSpaces, **P2** |
| Effective quotients and descent, v-local finite étale criterion, diamond atlases | [DiamondsAndVStacks][diamonds], **D0, D3, D4** |
| Analytic adic-space diamond functor, Spd and étale-site comparison | DiamondsAndVStacks, **D6** |
| Integral perfectoid recognition before inversion | PerfectoidSpaces, **P1.24**; primitive untilting and inversion in **P1.20–P1.21** |
| Completed tensor products, split base change and closed subspaces | [AdicSpacesPartII][adic-part-ii], **R0.3, R0.5, R0.8**; the analytic Cartier criterion is F4 below |
| Enhanced étale categories, t-structures and left completion | [DiamondEtaleCohomology][cohomology], **C2** |
| Ringed-site enhancements, Postnikov and derived completion | EnhancedDerivedSheaves, **§§0.1–0.4, E2.3, E3.4, E4** |
| Derived-complete adic coefficient systems and finite-level limits | [AdicCoefficientsAndComparisons][coefficients], **L0** |

There is no reconstruction of a supplier's objects in a second namespace. In
particular, F2 proves the categorical Frobenius graph relation from the actual
wandering-chart maps; it does not replace those maps by topological quotient
data. F4 uses the primitive-kernel classification, establishes the analytic closed
Cartier criterion, and proves its applicability to these period annuli. F3 establishes effective descent for the étale-sheaf pseudofunctor along q
and identifies its data with the cyclic relation.

[RelativeFarguesFontaine][relative] consumes the fixed-field product seed in
RF0, target annuli, the quotient and site comparisons in RF1, and the analytic
divisor seed in RF3. No relative construction is a prerequisite here. Curves
for general coefficient fields, arbitrary perfectoid bases, ramified Witt
coefficients, vector-bundle classification, Bun_G and the general divisor moduli
problem belong to their own roadmaps. The fixed curve diamond is distinct from
the moduli quotient Div¹ = Spd(Q_p)/phi^Z. The coefficient and six-operation
theory is not a prerequisite for F0–F4.

## Conventions

Fix a prime p, the field F and its valuation ring O_F as above. Choose a nonzero
topologically nilpotent varpi in O_F. Use the unlocalized Witt ring
A_inf = W(O_F), with its **(p,[varpi])-adic topology**, and the complete Huber
pair of the adic construction. Write

\[
Y=D(p)\cap D([\varpi])=D(p[\varpi]),\qquad
q:Y\longrightarrow X=Y/\varphi_Y^{\mathbf Z}.
\]

Here D(a) is the locus where the valuation of a is nonzero. The generic domain
is the intersection displayed above. The union D(p) ∪ D([varpi]) contains a
characteristic-p boundary; the auxiliary chart in D([varpi]) used for F4's root
extension is not a replacement for Y. Localization of chart rings at p occurs
after this choice of the Witt pair and open domain.

All period annuli B^I carry their complete Hausdorff topology, plus subring
B^{I,+} and actual adic chart map. The plus subring is the prescribed integral
closure inside the power-bounded elements. Ring maps are continuous and carry
the specified plus subring into the target plus subring. A Tate-ring unit need
not be a unit in its plus subring. The sharp operation is multiplicative; the
construction never uses it as an additive ring homomorphism.

Use positive generators throughout. Absolute Frobenius phi_S on S is induced
contravariantly by x ↦ x^p on F. The automorphism phi_Y comes from precomposition
of valuations with Witt Frobenius. At rank-one generalizations the radius is

\[
\kappa(x)=\frac{\log|[\varpi](x)|}{\log|p(x)|},\qquad
\kappa(\varphi_Y x)=p\,\kappa(x).
\]

Higher-rank chart inequalities use order-theoretic power comparisons from
AdicSpaces; no logarithm is assigned directly to a higher-rank value group.
Equivariance is checked before taking orbit quotients, so replacing the
positive generator by its inverse cannot disappear into an equality of orbit
sets.

For a characteristic-p perfectoid test T, a point of Y^diamond(T) is an
isomorphism class of a marked untilt (T^sharp, iota) with an adic map
T^sharp → Y. That map induces a Q_p structure. Keep both the tilted map to S
and this marked Q_p-untilt. The comparison is an isomorphism of v-sheaves on
all perfectoid tests, obtained by affinoid restriction and gluing. A coproduct
indexed by Z admits **locally constant** integer labels on disconnected tests.
All quotients below are sheaf quotients, not just quotients of point sets.

Use the public site convention of **KL Definitions 8.2.16 and 8.2.19,
pp.162–163**, as in **ECD Definition 15.5 and Lemma 15.6, pp.91–92**. Finite
étale maps are locally finite étale ring extensions with plus subring equal to
the integral closure of the base plus subring. Étale maps locally factor as an
open immersion, a finite étale map and an open immersion. Covering families are
set-theoretically surjective. For preadic spaces, surjectivity means universal
surjectivity; on an actual adic space it agrees with surjectivity on the
underlying space. Preserve this convention under the D6 comparison. The
sheafiness warning in **KL Remark 8.2.18, p.162** prevents treating every finite
étale preadic cover as an adic space without the supplier hypotheses.

For F4, a Cartier ideal is an invertible ideal **embedded** in O_Y. Closedness
includes representability of the quotient locally valued ringed space as an
adic space. It requires closed image on all rational affinoid restrictions,
with quotient plus rings given by integral closure. Normalizing rank-one
residue norms by |[varpi]| = p^−1 fixes the lower-bound constant. A different
normalization must transport both tilt and untilt gauges consistently.

For F5, discrete coefficients are a commutative ring Lambda killed by an
ell-power, with ell a prime different from p. Ordinary enhanced derived
topos categories and their left completions are distinguished. Adic
coefficients use a ring complete for an ideal I generated by a finite regular
sequence and containing an integer prime to p. Adic objects are **derived
I-complete** and tensor means the completed derived tensor specified by L0.
No comparison for Z_p or rational ell-adic coefficients follows from these
hypotheses.

Declaration names are proposed in **TauCeti.FFDiamond**. The mathematical
specification here includes the topological, geometric and enhanced coherence
hypotheses and every Lean statement retains all hypotheses needed for its algebraic or normed-ring assertion.

## Exact supplier contracts

Use Mathlib's existing Witt-vector and categorical vocabulary. The following
interfaces are used with their hypotheses, rather than as evidence that the
fixed-field geometry has already been constructed:

- **[WittVector.map](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/WittVector/Basic.lean#L253)**: for commutative coefficient rings and prime p, a ring
  homomorphism induces the coefficientwise Witt-vector ring map.
- **[WittVector.fontaineTheta](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Perfectoid/FontaineTheta.lean#L165)** and **[WittVector.fontaineTheta_teichmuller](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Perfectoid/FontaineTheta.lean#L182)**:
  for a commutative ring R, prime p, `Fact (¬ IsUnit (p : R))` and
  `IsAdicComplete (Ideal.span {(p : R)}) R`, the algebraic theta map on
  W(PreTilt(R,p)) evaluates [x] as `PreTilt.untilt x`. Continuity, boundedness
  on the integral subring and the primitive kernel are additional P1 inputs.
- **[WittVector.frobeniusEquiv](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/WittVector/Frobenius.lean#L283)**: for `CharP R p` and `PerfectRing R p`, with
  prime p, Witt Frobenius is a ring equivalence. Transport it through the
  topological Huber pair before using an adic automorphism.
- **[CategoryTheory.Equivalence](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/CategoryTheory/Equivalence.lean#L82)**: functor, inverse, unit, counit and triangle
  identity. Enhanced categories require the coherent C2/L0 interfaces in
  addition to a bundled ordinary categorical equivalence.
- **[TauCeti.ValuationSpectrum](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AdicSpace/ValuationSpectrum/Basic.lean#L73)** and
  **[TauCeti.ValuationSpectrum.spaAnalytic_eq_spa_of_isTateRing](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Analytic.lean#L377)**: the existing
  valuative-relation spectrum and its Tate analyticity theorem. For a
  topological commutative Tate ring and specified plus subring, all Spa points
  are analytic. Apply this chartwise; Y and X come from AdicSpaces.

### Algebraic suppliers and fixed-curve specializations

Mathlib's `Ideal.IsPrime.mul_mem_iff_mem_or_mem` gives
D(p[varpi]) = D(p) ∩ D([varpi]) for a prime valuation support; there is no
second support-product theorem here. `WittVector.map_teichmuller`, followed by
`WittVector.fontaineTheta_teichmuller`, evaluates theta ∘ W(f) on [x] as
(f x).untilt under the completeness and nonunit hypotheses above. This is the
algebraic formula used in F1; the topological bijection remains F1's target.
`Ideal.span_singleton_mul_left_unit` identifies the ideals of xi and u xi
for a unit u, and `Ideal.span_singleton_eq_top` treats a unit generator.
These are used with the quotient-pair transport in F4. For the set-level
cover test, `Equiv.image_eq_iff_eq` and `Set.image_univ_of_surjective` identify
a subset with the whole source exactly when its image is the whole target;
`Set.image_union` transports the two-window union. They are supplied in
`Logic/Equiv/Set` and `Data/Set/Image`. For a complete normed ring, the norm consequence in
F4 uses `AntilipschitzWith.injective` and `AntilipschitzWith.isClosed_range`,
with the continuity of multiplication. These are Mathlib declarations in
`RingTheory/Ideal/Prime`, `RingTheory/Ideal/Span`,
`RingTheory/WittVector/Teichmuller` and `Topology/MetricSpace/Antilipschitz`.

AdicSpaces §§6.1–6.4 supply the actual Witt pair, interval charts and quotient,
including the canonical change-of-pseudouniformizer isomorphisms. The changes
intertwine q and Frobenius, preserve rational restrictions and satisfy identity
and composition. Uniqueness of the F0 Q_p factorization makes them Q_p-linear;
the diamond functor of DiamondsAndVStacks §D6.4 transports these diagrams.
For three choices, the direct comparison equals the composite comparison.

DiamondsAndVStacks §D6.5 supplies eta:X_et ≌ X^diamond_et and its finite étale
restriction eta_f, applied to the analytic X of F0. Its forward functor sends
Z→X to Z^diamond→X^diamond; the inverse, unit and counit are those of D6.5,
and eta_f commutes with the inclusion into the étale site. Covering families
are the surjective families in the public KL Definitions 8.2.16 and 8.2.19.
The identity object maps to the identity, the split cover X⊔X maps to the
split diamond cover with its sheet maps, and the two wandering-chart images
cover precisely when their diamond images cover. F3 builds the chart and
Frobenius-descent compatibilities around this supplied equivalence.

The external interfaces needed in stronger form are precise mathematical
prerequisites:

1. **AdicSpaces, Layer 6.** Import the (p,[varpi])-adic Witt pair, strongly
   noetherian complete interval pairs with their plus rings, actual wandering
   locally valued-ringed-space isomorphisms, valuation-precomposition
   Frobenius, radius scaling, quotient q, two-window cover and canonical
   varpi-change isomorphisms. A homeomorphism of chart spaces is insufficient.
2. **PerfectoidSpaces, §§P1.20–P1.24.** Use primitive untilting and the
   integral/Tate dictionary. For a regular parameter pi with pi^p dividing p,
   separated pi-adic completeness and bijective Frobenius A/(pi) → A/(pi^p)
   give the integral perfectoid recognition theorem of §P1.24. On the root chart
   use pi=v_1, so pi^p=[varpi]; [varpi]^p dividing p is not assumed.
   Establish completeness and regularity on this actual chart in F4.
3. **AdicSpacesPartII, §§R0.3, R0.5, R0.8.** Use the ordinary completed
   tensor product for adic scalar maps, the Banach-module completed tensor
   functor with its `BanachModule.CompletedTensor.exact_of_split` contract,
   and closed adic subspaces for admissible ideal sheaves. A continuous
   coefficient retraction produces the split annulus base change by §R0.5.
   The quotient plus ring in §R0.8 is the integral closure of the image.
   F4 proves the additional all-affinoids Cartier criterion of SW Proposition
   5.3.8; closed-subspace vocabulary alone does not assert it.
4. **DiamondsAndVStacks, §§D0.25–D0.26, D3, D4 and D6.5.** Use its
   v-site groupoid quotients, effective descent and finite étale descent,
   and the analytic étale-site comparison. F3's `sheaf_descent` establishes
   the specialization to U ↦ Sh(U_et, A), including objects, morphisms,
   pullback associators and restriction compatibility along the particular
   surjective étale cover q. The general quotient-stack construction is not
   by itself an assertion that this pseudofunctor is a stack.
5. **DiamondEtaleCohomology, §§C2.2–C2.5, C2.9–C2.12 and Layer C3.** Enhanced exact module-topos derived categories,
   t-structures, coherent truncations and pullbacks, the left-completion
   comparison for locally spatial diamonds, bounded-below agreement, the
   completed monoidal structure and the global-sections right adjoint preserving
   Postnikov limits. Apply these contracts separately to each primary factor of a ring killed
   by an integer prime to p; the finite product decomposition transports the
   sheaf categories and their enhanced operations to the L0 finite levels.
6. **AdicCoefficientsAndComparisons, Layer L0**, targets
   `L0/derived-I-complete-etale-category`, `L0/adic-coefficient-limit` and
   `L0/completed-tensor-and-colimits`, supplies derived I-complete étale
   systems on the diamond v-topos, their enhanced finite-coefficient limit,
   coherent reduction and completed tensors. F5 transports this description
   to the left-completed adic étale-site system via the finite-level
   comparisons; no reconstruction theorem for the uncompleted adic étale
   topos is assumed. Include Z_ell, I=(ell), ell≠p with its transitions.
7. **EnhancedDerivedSheaves, §§0.1–0.4, E2.3, E3.4 and Layer E4.** Use
   coherent ringed-site module enhancements, Postnikov completion, coefficient
   towers and mates, derived-complete sheaves and coefficient-system
   reconstruction on a replete topos. The ordinary adic étale topos need
   not be replete; the diamond v-topos and the finite-level left completions
   are the inputs to F5's completed comparison.

These contracts determine the mathematical prerequisites. The target prerequisites below name the
owning roadmap and layer and, where needed, the particular interface within
that layer. A local declaration name refers to the target in its indicated
layer, with all the conventions above.

## How to read the build

| Layer | Mathematical output | Prerequisite layers |
| --- | --- | --- |
| [F0](#layer-f0-adic-objects-and-comparison-category) | Analytic and scalar interfaces for the actual adic curve | AdicSpaces Layer 6; AdicEtaleGeometry A1; DiamondsAndVStacks D6 |
| [F1](#layer-f1-the-untilt-product-formula) | Y^diamond ≅ S × Spd(Q_p), with formulas and naturality | F0; PerfectoidSpaces P1/P2; DiamondsAndVStacks D6 |
| [F2](#layer-f2-frobenius-and-the-effective-quotient) | Chosen-generator equivariance and X^diamond ≅ (S × Spd(Q_p))/(phi_S^Z × id) | F0/F1; AdicEtaleGeometry A1; DiamondsAndVStacks D0/D4/D6 |
| [F3](#layer-f3-étale-sites-and-frobenius-descent) | Étale and finite étale equivalences, compatible sheaf descent | F2; DiamondsAndVStacks D0/D3/D6 |
| [F4](#layer-f4-marked-untilts-as-analytic-cartier-divisors) | Closed Cartier untilt immersions on Y and X | F0/F1/F2; PerfectoidSpaces P1/P2; PerfectoidSpaces P1.24; AdicSpacesPartII R0.3/R0.5/R0.8 |
| [F5](#layer-f5-enhanced-derived-and-adic-coefficients) | Left-completed and derived-complete coefficient comparisons | F3; DiamondEtaleCohomology C2; AdicCoefficientsAndComparisons L0 |

F3 is the first geometric endpoint: the existing curve is a specified locally
spatial diamond with the same étale and finite étale sites. F4 adds the analytic
divisor interpretation and can be developed without F3's coefficient
categories. F5 uses F3's actual site functors and their restriction coherence.

## Layer F0: Adic objects and comparison category

The objects remain those of the AdicSpaces construction. A rational annulus must be retained
as a complete topological ring with its integral subring and actual map to the
ambient adic space. A homeomorphism of underlying spaces does not provide the
D6 input. The first targets establish analyticity and scalar structure; the chart
comparison is compatible with the canonical choice transport of AdicSpaces §6.4. General products enter through A1's analytic Yoneda-adic category,
which contains the AdicSpaces construction's sheafy objects fully faithfully.

### The analytic fixed-field interface

Prove `analytic_interface`: Y and X are analytic adic spaces over Spa(Z_p,Z_p). Every supplied interval chart has its complete Hausdorff Tate ring B^I, plus subring B^{I,+} equal to the prescribed integral closure inside the power-bounded elements, and the structural ring maps from Z_p are continuous and bounded. The analytic open Y is D(p) ∩ D([varpi]) = D(p[varpi]), inside the unlocalized (p,[varpi])-adic Witt pair.

*Needs:* AdicSpaces, Layer 6; Tau Ceti `TauCeti.ValuationSpectrum.spaAnalytic_eq_spa_of_isTateRing`; Tau Ceti `TauCeti.ValuationSpectrum`.

Apply the AdicSpaces construction’s actual chart isomorphisms and plus-ring descriptions; on a chart a power of p or [varpi] is a topologically nilpotent unit. Apply the Tau Ceti Tate-ring analytic-point theorem on those charts, then glue the Z_p maps. X inherits the same maps on wandering charts.

Checks: A valuation with p=0 is outside Y even when [varpi]≠0. No initial replacement of W(O_F) by W(O_F)[1/p].

(FS II.1.1, pp.47–48; II.1.15–16, pp.54–55; SW Lecture 13, Proposition 13.1.1 and proof, pp.108–109; Definition 13.5.1, p.112.)

### The Q_p structural factorization

Prove `qp_factorisation`: The structural morphisms Y → Spa(Z_p,Z_p) and X → Spa(Z_p,Z_p) factor uniquely through Spa(Q_p,Z_p). On every rational chart p is invertible and the extended Q_p ring homomorphism is continuous, carries Z_p into B^{I,+}, and agrees on overlaps; q and Frobenius are over Spa(Q_p,Z_p).

*Needs:* F0, `analytic_interface`; AdicSpaces, Layer 6.

Extend the structural ring map by the localization universal property because p is invertible on Y. Check continuity using the chart topology and boundedness on Z_p. Glue and descend through the Z_p-linear Witt Frobenius and the AdicSpaces construction’s quotient chart maps; use uniqueness to prove the triangles.

Checks: p inverse maps to the actual inverse in each B^I. A characteristic-p untilt does not define a point of Spd Q_p.

(FS II.1.1, pp.47–48; II.1.15–16, pp.54–55.)

### Chart morphisms in the adic comparison category

Prove `chart_category_interface`: The imported maps U_n,V_n → Y, q:Y→X, and the isomorphisms U_n ≅ q(U_n), V_n ≅ q(V_n) are morphisms in the analytic adic category used by D6. The comparison with analytic Yoneda-adic spaces is fully faithful on these sheafy objects, preserves these open restrictions, and computes the analytic fibre products needed for q’s relation.

*Needs:* F0, `qp_factorisation`; AdicSpaces, Layer 6; AdicEtaleGeometry, Layer A1 (adic spaces in yoneda adic spaces); AdicEtaleGeometry, Layer A1 (yoneda adic fibre products).

Use the supplier’s fully faithful embedding on sheafy analytic adic spaces. Transport the AdicSpaces construction’s actual locally valued ringed-space isomorphisms, not just their topological homeomorphisms. Compute products in the sheaf category and retain comparison maps to sheafy local charts.

Checks: The chart maps preserve O^+ and residue valuations. The relation’s products are supplied even though the AdicSpaces construction does not build general fibre products.

(ECD Definition 15.5; Lemma 15.6 and proof, pp.91–92.)

### Examples

The open-locus test distinguishes a valuation killing p from a point of Y even when [varpi] survives. On each generic annulus, the Q_p map sends p⁻¹ to the inverse of p in its complete Tate ring.

### Dependencies

AdicSpaces §§6.1–6.4; AdicEtaleGeometry §A1.16; DiamondsAndVStacks §D6.4.

## Layer F1: The untilt product formula

The central calculation is on affinoid test spaces, where the universal
property of a perfect Witt ring and theta give both directions. To map to Y,
p and [varpi] must be invertible in the untilt Tate ring, while the plus-ring
map must remain bounded. These conditions explain both product factors.
Proving only an algebraic bijection of untopologized homomorphisms would miss
the analytic map. Naturality uses the marked-untilt slice equivalence; it is
proved before the affinoid calculation is glued into a v-sheaf isomorphism.

### The bounded Witt–theta correspondence

Prove `bounded_witt_theta`: Let T=Spa(A,A^+) be a characteristic-p affinoid perfectoid test space with marked Q_p-untilt T^sharp=Spa(A^sharp,A^{sharp,+}). Continuous bounded maps W(O_F)→A^{sharp,+} whose [varpi] image is a unit of A^sharp are naturally in bijection with continuous bounded maps O_F→A^+ whose varpi image is a unit of A. In the forward construction from f, the map is theta_Asharp ∘ W(f), using the marking A^+ ≅ (A^{sharp,+})^flat. Both sides require the specified (p,[varpi])-adic/source and untilt-plus topologies. The inverse uses compatible p-power roots and reduction modulo p; it is not an assertion about all algebraic ring homomorphisms.

*Needs:* F0, `qp_factorisation`; PerfectoidSpaces, Layer P1 (witt vectors of perfect plus ring); PerfectoidSpaces, Layer P1 (fontaine theta comparison with mathlib); PerfectoidSpaces, Layer P1 (rings of integral elements under tilting); Mathlib `WittVector.map`; Mathlib `WittVector.fontaineTheta`; Mathlib `WittVector.fontaineTheta_teichmuller`.

Use perfectness of O_F for the continuous Witt lifting property, and the supplier’s topological theta and integral-tilt identification. Check p and [varpi] are sent to topologically nilpotent elements of the plus ring, and that theta(W(f)([x]))=f(x)^sharp. Use preservation of units by sharp and the marking to translate the open-locus condition. Construct the inverse and verify equality on all Teichmuller expansions by separated completeness.

Checks: The map on [x] is f(x)^sharp, not an additive sharp map. Invertibility is tested in A^sharp, not in A^{sharp,+}.

(FS II.1.2, p.49; II.1.17, p.55.)

### The affinoid untilt-product bijection

Construct `affinoid_product`. For every affinoid characteristic-p perfectoid T, construct alpha_T:Y^diamond(T) ≃ Hom_Perf(T,S) × Spd(Q_p)(T). The forward map sends the isomorphism class of ((T^sharp,iota),h:T^sharp→Y) to (the tilted O_F-map recovered by the bounded Witt–theta correspondence, (T^sharp,iota) with its induced Q_p structure). The inverse composes W(f) with theta and factors through the actual open Y. This respects isomorphisms of marked untilts.

*Needs:* F1, `bounded_witt_theta`; DiamondsAndVStacks, Layer D6 (spd of a tate pair); DiamondsAndVStacks, Layer D6 (gluing and the diamond functor); PerfectoidSpaces, Layer P1 (marked untilt).

Construct the two functions from the preceding theorem; retain the untilt marking throughout. Use equality of bounded ring maps and the supplier’s morphism/affinoid dictionary to verify both composites.

Checks: The product keeps both factors, including the untilt’s Q_p structure.

(FS II.1.2, p.49; II.1.17, p.55.)

The API is used by FS II.1.2 and II.1.17 to build the fixed-field product formula; F4 sections to recover a divisor map from the identity base map and a marked untilt.

**API.**

- `affinoid_product_forward` (data): Evaluate alpha_T on a represented marked-untilt map by the formula in the statement.
- `affinoid_product_inverse` (constructor): Evaluate alpha_T inverse on (f,u) by theta_u ∘ W(f) and the open-locus factorization.
- `affinoid_product_inverse_formula` (characterisation): The inverse’s ring map sends [x] to f(x)^sharp for every x∈O_F.
- `affinoid_product_ext` (extensionality): For z,z′ in Y^diamond(T), z=z′ if and only if their alpha_T images have equal tilted base maps and equal marked Q_p-untilts. Both coordinates are required.

**Checks.**

- `affinoid_product_base` (computation): For T=S and any marked Q_p-untilt u of S, the theta-defined i_u maps to (id_S,u).
- `affinoid_product_excludes_char_p` (non-example): An untilt with p=0 does not occur in either side with Spd Q_p; its map factors only into the integral analytic locus.
- `affinoid_product_teichmuller` (computation): For the inverse of (f,u), [varpi] maps to f(varpi)^sharp, a unit in the untilt Tate ring; its plus-ring membership does not assert that it is a plus-ring unit.
- `affinoid_product_compatible_roots` (computation): For F=completion(F_p((t^{1/p^infty}))), choose the Q_p(p^{1/p^infty})-completion untilt with t^sharp=p and compatible roots. The inverse of (id_S,u) sends every [t^{1/p^m}] to p^{1/p^m}, with the p-power relations retained and both p and [t] invertible in the untilt Tate field. No algebraic-closedness assumption is used.

### Restriction and naturality of the point bijections

Prove `point_naturality`: For every morphism g:T′→T of characteristic-p perfectoid test spaces, alpha_T′(g^*z)=(f∘g,g^*u) when alpha_T(z)=(f,u). This includes rational restrictions and arbitrary test spaces after gluing. Untilts are pulled back in the perfectoid slice category, with the induced marking. The affinoid formulas agree on overlaps and are invariant under isomorphic presentations of the untilt.

*Needs:* F1, `affinoid_product`; PerfectoidSpaces, Layer P2 (tilting slice equivalence); PerfectoidSpaces, Layer P2 (perfectoid spaces and glued tilting); DiamondsAndVStacks, Layer D6 (untilt descent along v covers).

Use functoriality of Witt maps and theta in the plus-ring dictionary. Pull back the marked untilt via the supplier slice equivalence; do not assert arbitrary adic fibre products are perfectoid. Check on affinoid covers of both tests, then apply sheaf descent to equality of maps.

Checks: Restriction to a rational subspace commutes with both directions.

(FS II.1.2, p.49; II.1.17, p.55.)

### The fixed-field diamond product isomorphism

Construct `product_iso`. Glue the alpha_T into a natural isomorphism of v-sheaves alpha_F:Y^diamond ≅ S × Spd(Q_p), and regard it as an isomorphism of locally spatial diamonds. Its component on an arbitrary T is obtained by affinoid restriction and gluing of the bounded formulas. The locally spatial structures are those supplied by D6 and the representable/Spd factors.

*Needs:* F1, `point_naturality`; DiamondsAndVStacks, Layer D6 (etale site comparison); DiamondsAndVStacks, Layer D6 (spd is a spatial diamond).

Natural inverse point bijections give a natural isomorphism on an affinoid basis. Use the supplied v-sheaf property on both sides to extend the isomorphism; apply Yoneda, then retain the supplied local spatiality.

Checks: This is an isomorphism of sheaves, including all perfectoid tests.

(FS II.1.2, p.49; II.1.17, p.55.)

The API is used by FS II.1.17 to identify the generic period domain as the product; F2 quotient to conjugate Witt Frobenius to Frobenius on S; RelativeFarguesFontaine RF0:annuli to supply only the fixed-field product seed, without importing the relative construction backwards.

**API.**

- `product_iso_apply` (characterisation): On affinoid T, alpha_F has component alpha_T.
- `product_iso_inverse` (data): The inverse natural transformation is given by the inverse bounded-theta formula and gluing.
- `product_iso_over_qp` (compatibility): alpha_F followed by the second projection equals the diamond of the structural Q_p map.
- `product_iso_ext` (extensionality): For any v-sheaf Z and h,k:Z→Y^diamond, h=k if and only if h and k followed by alpha_F have equal first projections and equal second projections.

**Checks.**

- `product_iso_identity_section` (computation): For any marked untilt u:S→Spd Q_p, the diamond map of i_u is sent to the graph (id_S,u).
- `product_iso_rational_restriction` (compatibility): Restricting a test T to a rational open gives the restriction of alpha_T, with the same untilt and tilted base map.
- `product_iso_both_factors` (characterisation): For two points with the same Q_p-untilt, equality of their images under alpha_T holds exactly when their maps to S agree; forgetting the first factor is not injective in general.

### Structural projection and field-map naturality

Prove `projection_field_naturality`: The alpha_F diagram commutes over Spd Q_p. Let F′ also be a complete rank-one characteristic-p perfectoid field with valuation ring O_F′, using the same prime p. For a continuous isometric field embedding F→F′ carrying O_F into O_F′, the induced maps S′→S and Y_F′→Y_F satisfy alpha_F ∘ (Y_F′→Y_F)^diamond = ((S′→S)×id) ∘ alpha_F′. The same statement holds for continuous bounded field maps with the corresponding admissible topology and plus-ring hypotheses. Choice transport intertwines these diagrams.

*Needs:* F1, `product_iso`; AdicSpaces §6.4 (canonical choice transport); F1, `bounded_witt_theta`.

Prove the structural projection formula affinoid-locally by retaining the untilt structure in both directions. Use theta naturality and W(f′∘f)=W(f′)∘W(f), then glue.

Checks: For the identity field map, the comparison square is the identity.

(FS II.1.2, p.49; II.1.17, p.55.)

### Examples

For F=completion(F_p((t^{1/p^infty}))) and its Kummer untilt, choose the marking t^sharp=p. The point defined by theta then has coordinates (id_S,u), and [t^{1/p^m}] maps to p^{1/p^m}. A characteristic-p untilt cannot lie over Spd(Q_p).

### Dependencies

F0; PerfectoidSpaces §§P1.16–P1.22 and Layer P2; DiamondsAndVStacks §§D6.1–D6.5.

## Layer F2: Frobenius and the effective quotient

A quotient comparison needs its relation and its cover, not just its orbit
space. The AdicSpaces construction supplies locally isomorphic wandering charts and the positive
radius scaling. A1 supplies the actual fibre products. D6 transports the local
products and restrictions; the coproduct of graphs is recognized locally by its
component labels. The effective epimorphism property then gives the quotient
universal property. This order avoids any assertion that diamondification
preserves all colimits. The product action is Frobenius on S with identity on
Spd Q_p. Local spatiality comes from D6, and qcqs has its own finite-overlap
argument from bounded-radius windows.

### Equivariance for the chosen Frobenius generator

Prove `frobenius_equivariance`: With phi_Y induced contravariantly by Witt Frobenius and phi_S induced by x↦x^p, alpha_F ∘ phi_Y^diamond = (phi_S×id) ∘ alpha_F. On an affinoid point represented by theta_u ∘ W(f), postcomposition with phi_Y changes f to f∘Frob_O_F, while retaining u. The radius kappa=log|[varpi]|/log|p|, evaluated on the unique rank-one generalization of an analytic point, satisfies kappa(phi_Y x)=p·kappa(x).

*Needs:* F1, `product_iso`; F1, `bounded_witt_theta`; AdicSpaces, Layer 6; Mathlib `WittVector.frobeniusEquiv`.

Evaluate the composed ring map on [a], where Witt Frobenius sends [a] to [a^p] and fixes p. Use the marked-untilt formula to identify the first factor, and the AdicSpaces construction’s valuation precomposition convention to compute the radius. Check the positive generator before extending to its integer powers.

Checks: For varpi, the value is f(varpi^p)^sharp, not f(varpi^(1/p))^sharp. The Spd Q_p factor remains unchanged.

(FS II.1.16–17, pp.54–55.)

### The adic Frobenius graph relation

Prove `adic_graph_relation`: The map coprod_{n∈Z}Y → Y×_X Y, on the n-th component y↦(y,phi_Y^n(y)), is an isomorphism in the analytic Yoneda-adic category. Locally on both factors it is the coproduct of the actual graph isomorphisms between wandering charts. The cocycle composition is addition of integer exponents.

*Needs:* F0, `chart_category_interface`; AdicSpaces, Layer 6; AdicEtaleGeometry, Layer A1 (yoneda adic fibre products).

For U_n and V_n use the AdicSpaces construction’s disjoint translates and actual isomorphism onto q(U_n),q(V_n). Identify each pullback chart with the unique translate meeting it; on overlaps the integer labels coincide by freeness. Glue these identifications.

Checks: The n=0 summand is the diagonal. Composing the n and m graphs gives the n+m graph.

(FS II.1.16–17, pp.54–55; SW Lecture 13, Definition 13.5.1, p.112.)

### The diamond Frobenius graph relation

Prove `diamond_graph_relation`: The same graph maps give an isomorphism coprod_Z Y^diamond ≅ Y^diamond×_{X^diamond}Y^diamond of v-sheaves. Source and target are (y,n)↦y and (y,n)↦phi_Y^{diamond,n}(y); the diagonal, inverse and composition have labels 0,−n,n+m.

*Needs:* F2, `adic_graph_relation`; DiamondsAndVStacks, Layer D6 (gluing and the diamond functor).

Apply D6’s fibre-product and open-restriction comparisons on every wandering-chart pullback. Identify a disjoint union via the locally constant component label on tests, then glue. This argument proves this coproduct comparison locally; it uses no unrestricted colimit-preservation claim.

Checks: A nonconnected test may have a locally constant integer label, rather than a single global integer.

(FS II.1.16–17, pp.54–55.)

### The local-isomorphism cover of the curve diamond

Prove `diamond_quotient_cover`: q^diamond:Y^diamond→X^diamond is a surjective étale morphism and hence a cover for the v-topology. It restricts to isomorphisms U_n^diamond→q(U_n)^diamond and V_n^diamond→q(V_n)^diamond; q(U_0)^diamond and q(V_0)^diamond cover X^diamond.

*Needs:* F0, `chart_category_interface`; AdicSpaces, Layer 6; DiamondsAndVStacks, Layer D6 (etale site comparison); DiamondsAndVStacks, Layer D6 (gluing and the diamond functor).

Use the two wandering-window families and the local chart isomorphisms. Their images cover the adic X; D6 identifies the underlying spaces and open subdiamonds, and transports the covering family.

Checks: The cover proof does not require q to be quasicompact.

(FS II.1.16–17, pp.54–55.)

### Effectiveness of the fixed-field quotient sheaf

Prove `effective_quotient`: q^diamond is the effective quotient of the Frobenius graph relation: for every v-sheaf Z, composition with q^diamond identifies Hom(X^diamond,Z) with the morphisms h:Y^diamond→Z such that h∘phi_Y^diamond=h. The quotient is the sheaf quotient; an arbitrary pointwise orbit presheaf need not satisfy this universal property before sheafification.

*Needs:* F2, `diamond_graph_relation`; F2, `diamond_quotient_cover`; DiamondsAndVStacks, Layer D0 (groupoid quotients and two fibre products); DiamondsAndVStacks, Layer D4 (atlas characterisation of diamonds).

Use effective epimorphism descent in the v-sheaf topos for q^diamond. Its Cech relation is the preceding graph relation. Descent on all graph components is exactly invariance under the generator.

Checks: Invariant maps descend uniquely as morphisms of sheaves. Local integer labels on a disconnected test are admitted.

(FS II.1.16–17, pp.54–55.)

### The fixed-field quotient comparison

Construct `quotient_iso`. Construct beta_F:X^diamond ≅ (S×Spd(Q_p))/(phi_S^Z×id) as the unique isomorphism induced by alpha_F between the two effective quotient sheaves. If pi:S×Spd(Q_p)→Q_F is the quotient map, beta_F∘q^diamond=pi∘alpha_F. The action is on S; Q_F is an imported quotient sheaf, not a newly defined curve carrier.

*Needs:* F2, `frobenius_equivariance`; F2, `effective_quotient`; DiamondsAndVStacks, Layer D0 (groupoid quotients and two fibre products).

Use equivariance to descend pi∘alpha_F; descend alpha_F inverse in the reverse direction. Check both composites after the respective covers and use uniqueness of effective descent.

Checks: The defining commuting square determines beta_F uniquely.

(FS II.1.16–17, pp.54–55.)

The API is used by FS II.1.17 to describe the diamond of the existing curve; F3 chart comparison to give the quotient’s descent presentation; RelativeFarguesFontaine RF1 to supply the fixed-field quotient specialization.

**API.**

- `quotient_iso_square` (compatibility): beta_F∘q^diamond=pi∘alpha_F.
- `quotient_iso_over_qp` (compatibility): beta_F respects the maps to Spd Q_p induced by the second projection.
- `quotient_iso_unique` (universal-property): Any sheaf morphism X^diamond→Q_F satisfying the defining square equals beta_F.

**Checks.**

- `quotient_iso_zero_graph` (degenerate): The zero graph descends to the diagonal and beta_F agrees with alpha_F followed by pi on every wandering chart.
- `quotient_iso_positive_generator` (compatibility): Under beta_F, the q-relation for phi_Y maps to the phi_S graph, with the Q_p factor fixed.
- `quotient_iso_locally_constant_labels` (characterisation): A locally constant integer shift on a disjoint union of test spaces gives equal quotient sections; a construction quotienting only by a single global integer fails this test.

### Local spatiality, qcqs and independence of choices

Prove `quotient_spatiality_choices`: X^diamond and Q_F are locally spatial and qcqs. Their underlying spaces agree with the adic quotient. Prove qcqs from the finite affinoid cover q(U_0),q(V_0) and quasi-compact intersections computed by finitely many translates between bounded-radius intervals. beta_F is compatible with the AdicSpaces construction’s varpi-change isomorphisms and independent of wandering-window choices.

*Needs:* F2, `quotient_iso`; AdicSpaces §6.4 (canonical choice transport); F2, `adic_graph_relation`; DiamondsAndVStacks, Layer D6 (etale site comparison); AdicSpaces, Layer 6.

Use D6 for local spatiality and the topology comparison. For any two bounded-radius windows only finitely many phi-translates can meet; overlaps are finite unions of rational interval intersections and hence quasi-compact. Transfer the two-chart qcqs proof. Compare two beta maps after q, where the bounded point formula is choice independent, and use uniqueness.

Checks: No properness or smoothness of X^diamond→Spd Q_p is deduced.

(FS II.1.16–17, pp.54–55.)

### Examples

At a rank-one point with kappa=1, positive Witt Frobenius gives radius p, not 1/p. The graph labels 0, n and −n give respectively the diagonal, the n-th action graph and its inverse. On a disjoint union of two tests, labels 0 and 1 give a valid locally constant relation section.

### Dependencies

F0–F1; AdicSpaces §§6.2–6.4; AdicEtaleGeometry Layer A1; DiamondsAndVStacks Layers D0, D4 and D6.

## Layer F3: Étale sites and Frobenius descent

The general site theorem is not reconstructed here. Its specialization must
preserve the actual functors, topology and inclusion of finite étale covers.
Restriction squares are natural isomorphisms whose coherence matters on three
charts. The quotient presentation describes sheaves by Frobenius descent data,
with a transition isomorphism and a cocycle. An arbitrary family of invariant
sections is not the same data and cannot be used to define derived invariants.
This stage is the geometric endpoint of viewing the AdicSpaces construction's curve as a diamond.

### Restriction of the site equivalence to quotient charts

Prove `chart_site_compatibility`: For each wandering chart W⊂Y on which q is an isomorphism onto an open of X, the restriction/pullback functors on the two étale sites commute with eta through the D6 open comparison and alpha_F. The induced square is a natural isomorphism, coherent for nested charts and for overlaps. Under beta_F it is the restriction of the quotient presentation.

*Needs:* DiamondsAndVStacks §D6.5 (the étale-site comparison); F2, `quotient_iso`; DiamondsAndVStacks, Layer D6 (gluing and the diamond functor).

Compute on an étale object by the fibre-product comparison. Use D6 functoriality for inclusions and the defining beta square to identify restriction on all overlaps; coherence follows from the same canonical product comparison.

Checks: Restricting twice along nested rational charts agrees with direct restriction.

(ECD Definition 15.5; Lemma 15.6 and proof, pp.91–92.)

### Frobenius descent of étale sheaves

Construct `sheaf_descent`. For any coefficient category for which étale sheaf descent is defined (in particular sets and modules over a discrete commutative ring), construct the equivalence between sheaves on X^diamond_et and pairs (M,c) with M a sheaf on Y^diamond_et and c:phi_Y^{diamond,*}M≅M. The induced c_n:phi_Y^{diamond,n,*}M≅M satisfy c_0=id and c_{m+n}=c_n∘phi^{n,*}(c_m), with the chosen pullback associators. Morphisms intertwine c. Use D0’s graph-relation Cech descent category, specialized to the étale-sheaf pseudofunctor specified above. Its quotient-stack API alone does not establish that the étale-sheaf pseudofunctor is a stack.

*Needs:* F2, `diamond_graph_relation`; F2, `diamond_quotient_cover`; F3, `chart_site_compatibility`; DiamondsAndVStacks, Layer D0 (groupoid quotients and two fibre products); Mathlib `CategoryTheory.Equivalence`.

Establish étale sheaf descent along the surjective étale map q^diamond. Identify the Cech relation by its integer-indexed graphs, with composition n+m. Recover all c_n from the generator and inverse. Transport to the product description through alpha_F, where pullback is on the S factor.

Checks: Cocycle composition includes the pullback of the first isomorphism.

(ECD Definition 15.5; Lemma 15.6 and proof, pp.91–92.)

The API is used by F3 finite covers to describe descent of finite étale covers via the same relation; F5 to separate sheaf descent from enhanced derived descent; degreewise invariants are not a derived construction.

**API.**

- `sheaf_descent_pullback` (data): The forward equivalence sends N to q^{diamond,*}N with its canonical Cech Frobenius isomorphism.
- `sheaf_descent_inverse` (constructor): Compatible sheaf/cocycle data glue uniquely to an étale sheaf on X^diamond.
- `sheaf_descent_cocycle` (relation): c_{m+n}=c_n∘phi^{n,*}(c_m), with c_0=id and all pullback associators retained.

**Checks.**

- `sheaf_descent_constant` (computation): A constant sheaf pulled back from X^diamond has the canonical constant-sheaf Frobenius cocycle; its descent returns the original sheaf.
- `sheaf_descent_negative_generator` (compatibility): The −1 transition is the pulled-back inverse of the +1 transition, not an independent choice.
- `sheaf_descent_morphism` (characterisation): A morphism descends exactly when it commutes with the generator cocycle; maps of underlying sheaves alone do not suffice.

### Compatibility of Frobenius descent with finite étale covers

Prove `finite_cover_descent`: The analogous equivalence for finite étale covers identifies covers of X^diamond with finite étale covers Z→Y^diamond carrying a Frobenius isomorphism and its cocycle. Via eta_f this is the descent description of finite étale covers of the adic X. For a finite étale cover, its represented sheaf descends to the sheaf represented by the descended cover.

*Needs:* DiamondsAndVStacks §D6.5 (the étale-site comparison); F3, `sheaf_descent`; DiamondsAndVStacks, Layer D3 (v local nature of morphism classes); DiamondsAndVStacks, Layer D0 (groupoid quotients and two fibre products).

First descend the represented sheaf through the effective cover; the v-local finite étale criterion of ECD 10.11(iii) proves that its morphism is finite étale. Check the finite-cover comparison on wandering charts, where q is an isomorphism; glue through the graph relation.

Checks: A split two-sheeted cover descends with its sheet action retained.

(ECD Proposition 10.11(iii), pp.52–53, proof using Proposition 9.7, pp.47–48.)

### Examples

For the split two-sheeted cover, a generator cocycle can permute the sheets. Its negative generator is forced to be the pulled-back inverse; keeping only an invariant set of sections loses this cover datum. Restriction to each of the two wandering windows recovers the corresponding represented cover.

### Dependencies

F2; DiamondsAndVStacks §§D6.4–D6.5 and Layers D0, D3–D4.

## Layer F4: Marked untilts as analytic Cartier divisors

The product formula identifies sections with marked untilts. The primitive
kernel is imported from P1. The new work is analytic: prove a lower norm bound, closed
image after rational localization, the correct completed quotient, and an exact
sequence of analytic sheaves. A principal ideal in W(O_F) is not a closed
Cartier divisor until these conditions have been established.

The auxiliary root extension uses compatible roots of p and varpi. Their
quotients s_m=p_m/v_m obey s_m^p=s_(m−1). Use pi=v_1, so pi^p=[varpi]
divides p; [varpi]^p need not divide p. The disc chart coordinate satisfies
t_1^sharp=p/[varpi]; reversing this ratio reverses the chart inequality. The
integral recognition uses a small root pseudouniformizer before inversion,
not the Tate ring in which p is already a unit. PerfectoidSpaces §P1.24 supplies the integral criterion for the regular parameter
pi=v_1, with pi^p=[varpi] dividing p, and completeness for this same parameter.
The [varpi]-adic and pi-adic topologies agree. PerfectoidSpaces §P1.20 supplies
the primitive-untilting construction and its Tate-ring identification.

For U_n={|xi|≤|[varpi]|^n}, normalize |[varpi]|=p^−1. Boundary norm detection
then gives ||xi b||≥p^−n||b||. Completeness makes xi's image closed because its
inverse on the image sends Cauchy sequences to Cauchy sequences. The check is
repeated on rational affinoids. Berkeley 5.3.9 expressly warns that closedness
of the original global ideal need not survive such restriction. The boundary theorem, its finite-root approximation and its geometric-fiber
passage are the substantive input to the norm estimate below.

### Analytic Cartier ideals and their closedness criterion

Define `AnalyticCartierIdeal Z` for a uniform analytic adic space Z as an ideal
subsheaf of O_Z that is locally free of rank one; define `IsClosedCartier` by
requiring its supported quotient ringed space, with the induced valuations,
to be adic. Prove `analytic_cartier_closed_iff`: this holds exactly when the
section ideal has closed image on every open affinoid. Identify each quotient
plus ring with the integral closure of the image, and prove compatibility
with rational restriction, gluing and isomorphisms. The intended signature
is a Cartier ideal on Z as input and an equivalence between its closedness
and the all-affinoids closed-image condition. Use AdicSpacesPartII §R0.8 for
the closed-subspace construction. (SW Definitions 5.3.2, 5.3.7 and Proposition
5.3.8, pp.38–40.)

**API.**

- `AnalyticCartierIdeal.support`: the support of O_Z modulo the ideal.
- `AnalyticCartierIdeal.restrict` and `AnalyticCartierIdeal.transport`: restriction
  to an open subspace and transport by an adic isomorphism, with identity and
  composition laws.
- `AnalyticCartierIdeal.unit_change`: a unit multiple of a local generator gives
  the same embedded ideal, not merely the same support.
- `IsClosedCartier.restrict` and `IsClosedCartier.glue`: closedness on open
  restrictions and descent over an open cover.
- `IsClosedCartier.quotient_pair`: the complete quotient pair on each affinoid,
  naturally in rational restrictions.

**Checks.**

- A unit section gives the empty divisor and zero quotient.
- The coordinate ideal on a closed analytic disc gives its origin, with the
  base field as quotient.
- Closed image on one chart alone is insufficient: the criterion includes
  every rational restriction (SW Remark 5.3.9, p.40).

*Needs:* F0; AdicSpacesPartII §R0.8.

### Sections and marked Q_p-untilts

Construct `section_untilt_equiv`. Construct the natural bijection between sections of Y^diamond→S, morphisms S→Spd Q_p, and isomorphism classes of marked Q_p-untilts (S^sharp,iota). A section corresponding to u is alpha_F inverse composed with the graph (id_S,u). The projection Y^diamond→S is available here; no structural map X^diamond→S is asserted.

*Needs:* F1, `product_iso`; PerfectoidSpaces, Layer P1 (marked untilt); PerfectoidSpaces, Layer P1 (untilts classified by primitive ideals); PerfectoidSpaces, Layer P1 (primitive degree one ideals).

Use the product isomorphism and the ordinary graph/section universal property. Use the imported definition and classification of marked untilts to identify the second set. Do not re-prove the primitive-kernel classification here.

Checks: The marking is not forgotten before constructing the section.

(FS II.1.4, pp.49–50; II.1.18, p.55.)

The API is used by FS II.1.18 to provide the map of the untilt into the generic domain; F4 curve divisors to track exactly the marking on which Frobenius acts.

**API.**

- `section_untilt_equiv_graph` (constructor): The section for u is alpha_F inverse applied to (id_S,u).
- `section_untilt_equiv_projection` (characterisation): Its composite with Y^diamond→S is id_S.
- `section_untilt_equiv_recover` (data): The Q_p-untilt and its marking are recovered from the second projection through alpha_F.

**Checks.**

- `section_untilt_equiv_identity` (computation): For S=Spa(C^flat,O_Cflat) and u=Spa(C,O_C), C a complete algebraically closed extension of Q_p, the section is the theta_C graph with identity marking.
- `section_untilt_equiv_marking` (characterisation): Replacing the marking by precomposition with phi_S changes the first-factor graph before quotienting; the section bijection distinguishes the two marked data.
- `section_untilt_equiv_char_p` (non-example): The characteristic-p untilt S with p=0 gives no element of Spd Q_p and hence no section in this bijection.

### The primitive equation on the imported domain

Prove `primitive_equation_interface`: For a marked Q_p-untilt of S, import the surjective bounded theta:W(O_F)→O_{Fsharp} and principal primitive kernel. After choosing a suitable pseudouniformizer varpi with varpi^sharp dividing p, choose a∈W(O_F) with theta(a)=p/varpi^sharp and use a primitive generator xi=p−a[varpi], up to an allowed unit multiple. The theta map induces i:S^sharp→Y because p and theta([varpi]) are units in Fsharp. This statement specifies the equation and map, not yet a closed Cartier divisor.

*Needs:* F4, `section_untilt_equiv`; F1, `bounded_witt_theta`; PerfectoidSpaces, Layer P1 (fontaine theta and primitive kernel).

Use the imported primitive-kernel theorem and theta surjectivity to choose a; verify the prescribed primitive generator and equality of its ideal with ker theta. Apply the actual open-locus factorization. Transport to any original varpi by AdicSpaces §6.4 choice transport.

Checks: The kernel ideal is independent of unit rescaling of xi. Principality in W(O_F) alone is not the analytic closedness proof.

(FS II.1.4, pp.49–50; II.1.18, p.55.)

### The split root-extension frame on fixed-field annuli

Prove `root_extension_frame`: Let K_infty be the completion of Q_p(p^{1/p^infty}) with compatible roots p_m^p=p_{m−1}. For each imported rational period annulus B^I, form Btilde^I=B^I completed-tensor_{Q_p} K_infty with the R0.3 completed tensor topology and the integral closure of the base-changed plus ring. The inclusion B^I→Btilde^I has a continuous B^I-linear retraction induced by the coefficient retraction of K_infty onto Q_p. It is a closed topological embedding, compatible with rational restrictions. This is ordinary completed base extension; no uniform completion is inserted.

*Needs:* F0, `chart_category_interface`; AdicSpacesPartII §R0.3 (completed tensor product); AdicSpacesPartII §R0.5 (split injection completed base change).

Check first that both Q_p scalar maps are adic; bounded generic annuli have a cofinal p-power ring-of-definition topology. Choose the compatible root-basis coefficient projection; at each finite level it projects the coefficient of 1 and extends continuously to the completion. Apply the supplier’s split completed-base-change theorem, and rational-localization compatibility.

Checks: The retraction sends 1 to 1 and commutes with multiplication by xi. Closedness downstairs can be checked using this closed summand.

(FS Proof of II.1.1, p.48.)

### Perfectoid root annuli and their tilt coordinates

Prove `root_annulus_tilt`: On the n=1 integral chart of the auxiliary analytic domain D([varpi]), take compatible v_m=[varpi^{1/p^m}], s_m=p_m/v_m in the localized root extension, so s_m^p=s_{m−1}. Let A_0^+ be the [varpi]-adic completion of (W(O_F) completed-tensor_{Z_p}O_Kinfty)[s_m:m≥0], and A=A_0^+[1/[varpi]]. Establish [varpi]-torsion freeness and the integral perfectoid criterion, then A is perfectoid. Its tilt is the chart F⟨t_1^{1/p^infty}⟩ with t_1^sharp=p/[varpi]; the coordinate in the perfect open disc is t=varpi·t_1, so the chart is |t|≤|varpi|≠0. Rational subannuli covering Y inherit this perfectoid frame. The roots are quotients of compatible roots, not arbitrarily chosen roots with missing relations.

*Needs:* F4, `root_extension_frame`; PerfectoidSpaces, Layer P1 (perfectoid tate ring from integral perfectoid); PerfectoidSpaces, Layer P2 (rational localization of perfectoid affinoids); PerfectoidSpaces, Layer P2 (tilting homeomorphism and rational subsets); PerfectoidSpaces §P1.24 (integral Frobenius criterion).

Compute the quotients A_0^+/(pi) and A_0^+/(pi^p), with pi=v_1, using compatible relations p_m=v_m s_m as in FS II.1.1. Verify the nonzerodivisor and Frobenius quotient criterion using PerfectoidSpaces §P1.24 with pi=v_1 and its integral/Tate dictionary. Use the root pi=v_1 as pseudouniformizer: pi^p=[varpi] divides p by the s_0 relation; do not require [varpi]^p to divide p. Identify the tilt coordinate and its sharp image, then rationally localize to the generic annuli. Use only the auxiliary frame, not a reconstruction of the AdicSpaces construction’s sheafiness or the general relative curve.

Checks: On the relevant boundary |s_m|=1, while s_m^p=s_{m−1}. The reciprocal coordinate [varpi]/p is not t_1.

(FS Proof of II.1.1, p.48.)

The algebraic component of `root_annulus_tilt` has the following exact
hypotheses, independently of the geometric construction. In a commutative
ring B, take sequences pRoot, varpiRoot and ratioRoot indexed by natural
numbers, with ratioRoot(m)·varpiRoot(m)=pRoot(m), both numerator and denominator
satisfying the p-power transition equations, and each varpiRoot(m) a unit.
Then ratioRoot(m+1)^p=ratioRoot(m). This is the signature in Suggested.lean;
it does not identify an arbitrary ring with a perfectoid annulus.
For p=2 in Q, numerator roots constantly 1 and denominator roots constantly 1
give ratio roots constantly 1. Dropping denominator regularity fails: in
Z/4, take the numerator and denominator sequences constantly 0 and ratio roots
constantly 2; the displayed product and power equations for numerator and
denominator hold, but 2^2 ≠ 2. The actual period chart inverts its denominator.

### The boundary supremum on an untilt neighborhood

Prove `boundary_supremum`: For a sufficiently small affinoid neighborhood U_n={|xi|≤|[varpi]|^n} of the untilt locus, normalize rank-one residue norms by |[varpi]|=p^−1. For every b∈O(U_n), the spectral supremum norm equals its supremum over boundary points where |xi|=|[varpi]|^n. The same norm detection holds after the split root extension. Geometric-fiber reduction, tilting and approximation by finite root levels must preserve this equality. The required classical one-variable input is the maximum-modulus boundary theorem for affinoid subdomains of the open disc without isolated components. Proving that input and its approximation and fiber passages is part of this target.

*Needs:* F4, `root_annulus_tilt`; PerfectoidSpaces, Layer P1 (spectral norm under sharp); PerfectoidSpaces, Layer P2 (tilting homeomorphism and rational subsets).

Reduce rank-one points to complete algebraically closed residue-field fibers. After root extension pass to the perfect disc tilt; approximate functions and affinoid domains by finite root levels with compatible spectral norms. P1 uses |varpi|=1/2; raise both tilt and untilt gauges to log(p)/log(2) to obtain the present |varpi|=1/p normalization. Apply the classical boundary theorem and identify the boundary via specializations leaving U_n. Prove the classical boundary theorem for these affinoid domains and the finite-level norm passage as part of this target. Principality of the theta kernel does not establish either input.

Checks: For the perfected closed disc, the Gauss boundary detects the norm of its coordinate. The statement applies to all functions, not just xi.

(FS Proof of II.1.4, p.50.)

### The primitive-generator multiplication bound

Prove `multiplication_lower_bound`: Under the preceding neighborhood and normalization, every b∈O(U_n) satisfies ||xi·b||_sp ≥ p^−n ||b||_sp. The spectral norm induces the affinoid topology and is a genuine norm. For any rational affinoid U⊂Y, there is a positive constant c_U such that ||xi·b||_U ≥ c_U||b||_U, after an equivalent chart norm. Prove the analogous inequalities on every rational restriction needed for the closed-divisor criterion.

*Needs:* F4, `boundary_supremum`; F4, `primitive_equation_interface`; F4, `root_extension_frame`; AdicSpaces, Layer 6.

Evaluate |xi b|=p^−n|b| on the boundary and take suprema. Away from the zero locus xi is bounded below; use a rational cover by {|xi|≤|[varpi]|^n} and {|[varpi]|^n≤|xi|}. Use the FS/SW quasicompact-neighborhood argument and the split embedding to transfer the norm control; finite rational covers give a positive minimum of constants.

Checks: For b=1 on U_n the bound has the factor p^−n, not p^n. A zero xi cannot satisfy the bound in a nonzero ring.

(SW Lecture 11, Proposition 11.3.1 and proof, pp.94–95.)

### Closed image and quotient on rational affinoids

Prove `rational_strict_exactness`: For every rational affinoid U=Spa(B,B^+)⊂Y, multiplication by xi on B is injective and has closed image; B/xi B is its separated complete quotient. If V=U×_Y S^sharp is nonempty it is affinoid perfectoid and B/xi B ≅ O(V) as topological rings, with plus ring the integral closure of the image of B^+. If V is empty the quotient is zero. These identifications commute with further rational restrictions.

*Needs:* F4, `multiplication_lower_bound`; F4, `primitive_equation_interface`; PerfectoidSpaces, Layer P2 (rational localization of perfectoid affinoids); AdicSpacesPartII §R0.8 (closed adic subspaces and embeddings).

The normed-ring signature `rational_strict_exactness` assumes a complete
normed commutative ring B, xi∈B, a real c>0, and c·‖b‖≤‖xi b‖ for every b.
It concludes injectivity of multiplication by xi and closedness of its range.
The geometric quotient identification is the additional target above.
The lower bound implies injectivity and makes the preimages of a Cauchy sequence in xi B Cauchy. Completeness proves closed image. The theta presentation identifies the untilt algebra with the separated completion of the quotient; closedness removes further completion. Use the affinoid quotient-pair plus convention and rational universal properties; an empty intersection forces the completed quotient to vanish.

Checks: For xi=1 and c=1 in any complete normed commutative ring, the range is the whole ring. For xi=0 in a nonzero normed field, no c>0 satisfies the bound; c=0 would admit zero multiplication and cannot imply injectivity. The proof checks rational subsets as well as the original period annulus. The quotient topology, plus ring and restriction maps are all retained.

(FS II.1.4, pp.49–50; II.1.18, p.55.)

### The analytic untilt divisor on Y

Construct `untilt_closed_divisor`. Construct the actual closed immersion i_u:S^sharp→Y as the closed Cartier divisor with ideal sheaf xi O_Y. Cartier means this ideal embeds in O_Y and is locally free of rank one; closed means its quotient ringed space with inherited valuations is an adic space. Its affinoid quotient pairs are those of rational strict exactness. The construction is independent of the chosen primitive generator, auxiliary varpi and root-extension frame.

*Needs:* F4, `rational_strict_exactness`; AdicSpacesPartII §R0.8 (closed adic subspaces and embeddings); F4, `analytic_cartier_closed_iff`.

Apply the R0 general Cartier/closed-image criterion to the rational injectivity and closedness theorem. Glue the quotient pairs and identify their morphisms with the original theta map. Unit multiples give the same ideal sheaf, and F0 transports choices.

Checks: Both the closed immersion and its ideal sheaf are provided.

(SW Lecture 5, Definitions 5.3.2, 5.3.7; Proposition 5.3.8; Remark 5.3.9, pp.38–40.)

The API is used by FS II.1.4/II.1.18 to upgrade an untilt section to an actual analytic closed Cartier divisor; RelativeFarguesFontaine RF3 to supply this fixed-field analytic estimate as the seed for the relative owner.

**API.**

- `untilt_closed_divisor_equation` (data): On each rational chart the ideal is generated by the image of the chosen primitive generator xi of ker(theta).
- `untilt_closed_divisor_quotient` (compatibility): On U, the quotient topological pair is (O(U)/xi, integral closure of image O^+(U)), identified with U∩S^sharp.
- `untilt_closed_divisor_unit_change` (characterisation): Replacing xi by a unit multiple gives the same closed divisor and immersion.

**Checks.**

- `untilt_closed_divisor_geometric` (computation): For F=C^flat and the marked untilt C, the completed residue field of its divisor point on Y is C and its integral theta quotient is O_C.
- `untilt_closed_divisor_disjoint` (degenerate): On a rational chart disjoint from S^sharp, xi is a unit and the divisor quotient is zero.
- `untilt_closed_divisor_rational` (compatibility): Restricting the divisor to any rational U gives the closed quotient pair above; global principality alone would not pass this test.

### The exact analytic divisor sequence

Prove `untilt_sheaf_exactness`: The canonical sequence 0→O_Y --xi→ O_Y → i_{u,*}O_{S^sharp}→0 is exact as sheaves of modules on Y, with strict exact quotient sequences on rational affinoid charts. The last map is the actual untilt restriction map. With unit-rescaled generators, the two sequences are identified by the unit multiplication in the first term.

*Needs:* F4, `untilt_closed_divisor`; F4, `rational_strict_exactness`.

Check exactness on a rational basis via the topological quotient identifications. Sheafify/glue these maps; use the actual kernel ideal and retain the unit-change identification.

Checks: The sheaf quotient is i_*O_{S^sharp}, not merely a sheaf supported on the same point.

(FS II.1.4, pp.49–50; II.1.18, p.55.)

### The descended untilt divisor on X

Construct `curve_untilt_divisor`. The composite j_u=q∘i_u:S^sharp→X is a closed Cartier immersion. On each wandering chart of X its inverse image is obtained from the appropriate Frobenius translate of i_u; these local ideal sheaves glue to the Cartier ideal I_{D_u}. The pullback q^*I_{D_u} has support the locally finite union of all translates of the untilt locus. The ideal on X is not asserted globally principal and is not defined by a divergent product of all phi-translates of xi.

*Needs:* F4, `untilt_closed_divisor`; F4, `untilt_sheaf_exactness`; F2, `adic_graph_relation`; F2, `quotient_spatiality_choices`; F4, `analytic_cartier_closed_iff`.

For a fixed-field untilt the zero locus lies at its rank-one radius, so distinct phi-translates are disjoint. On any bounded-radius chart only finitely many translates occur. Use the actual quotient-chart isomorphisms to transport the local closed Cartier ideals, and compare them on overlap graphs. Apply ideal-sheaf and closed-immersion gluing; identify the descended space with S^sharp and its map with q∘i_u.

Checks: The divisor on X retains the untilt residue field.

(FS II.1.4, pp.49–50; II.1.18, p.55.)

The API is used by FS II.1.18 to descend the analytic untilt divisor to the existing fixed curve; RelativeFarguesFontaine RF3 to provide the fixed-field orbit-invariant divisor map; arbitrary base extension belongs there.

**API.**

- `curve_untilt_divisor_map` (data): The underlying immersion is exactly q∘i_u.
- `curve_untilt_divisor_chart` (characterisation): On a wandering chart it is the transported primitive equation of the appropriate Frobenius translate.
- `curve_untilt_divisor_pullback` (compatibility): Pullback to Y is the locally finite union of the translated Cartier divisors, with their ideal sheaves.

**Checks.**

- `curve_untilt_divisor_residue` (computation): For F=C^flat and untilt C, the closed point of X defined by this construction has completed residue field C.
- `curve_untilt_divisor_frobenius` (compatibility): Precomposing the marking by phi_S gives the same closed divisor on X, because its lifted graph is related by phi_Y.
- `curve_untilt_divisor_window_change` (compatibility): Two overlapping wandering windows yield the same Cartier ideal on their common quotient open, including the transition unit.

### Frobenius-orbit invariance of the marked-untilt divisor

Prove `untilt_orbit_invariance`: The assignment u↦D_u is invariant under integer Frobenius shifts of the marking, with canonical isomorphism of closed immersions over X. On the Y lift, the section (id,u∘phi_S) is related to (id,u) by reparametrization of S and the positive phi_Y action: (phi_S×id)∘(id,u)∘phi_S^−1=(id,u∘phi_S^−1). Thus positive phi_Y corresponds to inverse precomposition of the marking when one resets the first coordinate to id. Prove this convention explicitly. The resulting fixed-field map factors through maps S→Spd Q_p/phi^Z in the stated FS sense; this moduli quotient is distinct from X^diamond.

*Needs:* F4, `curve_untilt_divisor`; F4, `section_untilt_equiv`; F2, `frobenius_equivariance`; DiamondsAndVStacks, Layer D0 (groupoid quotients and two fibre products).

Compute the graph identity under alpha_F, retaining the reparametrization. Use q∘phi_Y=q and transport the theta kernel ideals contravariantly; identify the closed immersions over X. Use the marked-untilt quotient’s sheaf descent for the factorization, restricted to the fixed field. No classification of all closed points or identification of quotient functors is made.

Checks: The graph computation distinguishes the positive generator from its inverse before quotienting. The orbit relation does not produce a sheaf morphism X^diamond→S.

(FS II.1.4, pp.49–50; II.1.18, p.55.)

### Examples

For F=C^flat and the marked untilt C, theta gives the quotient O_C before inversion and C on the divisor chart. The divisor on X retains completed residue field C. On a chart disjoint from the divisor, xi is a unit and the quotient is zero. Positive Frobenius changes the graph to (id,u∘phi_S⁻¹) after reparametrization, while its quotient divisor is unchanged.

### Dependencies

F0–F2; PerfectoidSpaces §§P1.16–P1.24 and Layer P2; AdicSpacesPartII §§R0.3, R0.5 and R0.8; DiamondsAndVStacks Layer D0.

## Layer F5: Enhanced derived and adic coefficients

Fix first a discrete commutative coefficient ring Lambda killed by an
ell-power, ell≠p. There are two relevant categories: the ordinary enhanced
derived category of the étale topos and its left completion. An exact equivalence
of module topoi induces the former in all degrees. C2 identifies the diamond
D_et with the left-completed category; without additional completeness, this
identification is used directly only for bounded-below ordinary complexes.
For a completed object, global sections are compared using its compatible
Postnikov tower and the actual natural maps, not an abstract isomorphism of
cohomology groups.

For adic coefficients, Lambda is complete for I, a finite regular sequence ideal
containing an integer prime to p. L0 supplies derived I-completeness and the
inverse-limit equivalence for Lambda/I^n. Since these finite levels are killed
by a power of a prime-to-p integer, their finitely many primary pieces reduce to
the displayed torsion range by the finite product decomposition of the coefficient ring.
Transition natural transformations must be checked before taking the enhanced
limit. Tensor means completed tensor where L0 requires it. The constant Z_ell
system, I=(ell), ell≠p, is the principal test. This route supplies neither a
Z_p comparison nor a rational ell-adic theory without a separately specified
localization.

### The enhanced left-completed étale comparison

Construct `completed_derived_equiv`. For the stated discrete Lambda, enhance the exact sheaf equivalence induced by eta to an equivalence of ordinary enhanced derived categories of the two étale topoi, then left-complete in the standard t-structure. Compose with C2’s identification on the diamond side to obtain E_Lambda:hat D(X_et,Lambda) ≃ D_et(X^diamond,Lambda). Retain the inverse, unit, counit and t-exactness as coherent enhanced data, not only an equivalence of triangulated homotopy categories.

*Needs:* DiamondsAndVStacks §D6.5 (the étale-site comparison); DiamondEtaleCohomology, Layer C2 (enhanced left completion and coherent operations); Mathlib `CategoryTheory.Equivalence`.

Use the exact inverse equivalences of sheaves of Lambda-modules; they induce compatible functors on the supplied enhanced derived categories and truncation towers. Take the inverse limit of the truncation comparisons, and apply C2’s left-completion theorem for locally spatial diamonds.

Checks: No ordinary unbounded complex is silently identified with its left completion.

(ECD Definition 14.13; Remark 14.14; Proposition 14.15, p.88.)

The API implements the left-completion comparison of ECD Proposition 14.15 and bounded-below agreement of Remark 14.14. F5 uses it at every finite adic coefficient level.

**API.**

- `completed_derived_equiv_t_exact` (structure): E_Lambda preserves both halves of the standard t-structure and commutes with truncations.
- `completed_derived_equiv_heart` (compatibility): On degree-zero sheaves it is the equivalence induced by eta.
- `completed_derived_equiv_inverse` (data): The inverse and its coherent unit/counit are induced by the inverse site comparison and truncation limits.

**Checks.**

- `completed_derived_equiv_constant` (computation): The constant sheaf Lambda in degree zero maps to the constant sheaf Lambda on X^diamond.
- `completed_derived_equiv_bounded_below` (compatibility): For every bounded-below complex, E_Lambda agrees with the ordinary enhanced site comparison followed by C2’s inclusion.
- `completed_derived_equiv_tower` (characterisation): For an unbounded compatible Postnikov tower, E_Lambda is the limit of its finite-below truncation comparisons; the underlying uncompleted representative is not declared equal to this limit.

### The ordinary comparison in the bounded-below range

Prove `ordinary_bounded_below`: On D^+(X_et,Lambda), E_Lambda agrees with the ordinary site-derived comparison and gives D^+(X_et,Lambda) ≃ D_et^+(X^diamond,Lambda). Ordinary enhanced derived categories of the two étale sites are equivalent in all degrees because their module topoi are exactly equivalent; the comparison with diamond D_et in unbounded degrees is the separately stated left-completed comparison, without an extra left-completeness assumption.

*Needs:* F5, `completed_derived_equiv`; DiamondEtaleCohomology, Layer C2 (enhanced left completion and coherent operations).

Use t-exactness and C2’s bounded-below agreement. Keep the ordinary topos-derived equivalence separate from the identification with the enhanced v-derived subcategory.

Checks: A degree-zero module and any shift agree with the ordinary construction.

(ECD Definition 14.13; Remark 14.14; Proposition 14.15, p.88.)

### The actual global-sections comparison map

Prove `completed_global_sections`: Let eta^* be the exact module-sheaf equivalence. For bounded-below A the natural map RΓ(X_et,A)→RΓ(X^diamond_et,eta^*A) induced by the site functor is an equivalence. For a left-completed object represented by the compatible tower A_n=tau_{≥−n}A, the corresponding completed global sections are lim_n RΓ(X_et,A_n); compare them to RΓ_et(X^diamond,E_Lambda A) by the compatible actual finite-truncation comparison maps. The diamond right adjoint preserves this limit. Do not replace this map by a noncanonical equivalence of abstract cohomology groups.

*Needs:* F5, `ordinary_bounded_below`; F5, `completed_derived_equiv`; DiamondEtaleCohomology, Layer C2 (enhanced left completion and coherent operations).

Identify the underived section maps by the terminal object under the site equivalence. Derive via the supplied enhancements; use the exact inverse equivalence for bounded-below objects. For the tower, use right-adjoint preservation of limits and C2’s global-sections/truncation compatibility; take the coherent limit of the maps.

Checks: On constant Lambda in degree zero the degree-zero comparison sends a section to itself through eta. No invariant-sections formula omits derived Frobenius descent.

(ECD Definition 14.13; Remark 14.14; Proposition 14.15, p.88.)

### Pullback and tensor compatibility of the derived comparison

Prove `derived_pullback_tensor`: For inclusions of imported rational and wandering charts, the completed derived comparison commutes with pullback via the coherent square of F3. It is compatible with the enhanced derived tensor product of Lambda-modules in the chosen C2 category (using its completion if that monoidal convention requires it), and with the unit Lambda. These natural isomorphisms agree on nested restrictions, associativity and units; tensor compatibility does not assert that a general inverse limit commutes with ordinary tensor.

*Needs:* F5, `completed_derived_equiv`; F3, `chart_site_compatibility`; DiamondEtaleCohomology, Layer C2 (enhanced left completion and coherent operations).

Enhance the sheaf-level chart square and its associators. Use the exact monoidal site equivalence and the supplied completed monoidal structure, then compare truncation towers in that structure.

Checks: The tensor unit maps to Lambda and restriction of its unit isomorphism is the local unit isomorphism.

(ECD Definition 14.13; Remark 14.14; Proposition 14.15, p.88.)

### The derived-complete adic coefficient comparison

Construct `adic_derived_equiv`. Using L0 and EnhancedDerivedSheaves Layer E4, define the adic comparison E_{Lambda,I}:D_et,adic(X,Lambda) ≃ D_et(X^diamond,Lambda) by the coherent inverse limit of the completed comparisons E_{Lambda/I^n}. On the adic side, define `AdicEtaleCurve` as the enhanced inverse limit, for n≥1,
of the left-completed adic étale-site categories with coefficients Lambda/I^n,
with derived coefficient-reduction transitions. Write this category as
D_et,adic(X,Lambda). The finite-level site comparisons identify this limit
with L0's derived I-complete diamond category. This defines the derived-complete
left-completed coefficient system, without asserting reconstruction for the
uncompleted ordinary adic étale topos. The diamond side is L0’s derived I-complete subcategory, not the same ring viewed with the discrete topology.

*Needs:* F5, `completed_derived_equiv`; AdicCoefficientsAndComparisons, Layer L0 (derived-complete coefficient limits); EnhancedDerivedSheaves §E3.4 and Layer E4; Mathlib `CategoryTheory.Equivalence`.

Construct each finite-level functor, for the torsion coefficients allowed by C2 and the prime-to-p integer hypothesis; extend from the displayed ell-primary specialization by the finite product decomposition of the coefficient ring. Verify coefficient-reduction natural transformations before taking the enhanced inverse limit. Apply L0’s reconstruction on the diamond side and the defining enhanced limit on the adic side; retain the inverse, unit and counit.

Checks: The construction uses derived completion and compatible reduction data.

(ECD Definition 26.1; Proposition 26.2 and proof; Remark 26.3, pp.161–162.)

The API is used by ECD Proposition 26.2 to use the enhanced inverse-limit description; F5 adic global sections to take the limit of actual finite-level section maps.

**API.**

- `AdicEtaleCurve.reduce`: evaluate a compatible enhanced system at level n≥1.
- `AdicEtaleCurve.map_ext`: coherent mapping spaces are the limit of the
  finite-level mapping spaces; this includes the higher compatibility data.
- `AdicEtaleCurve.coefficient_limit`: identify the category with its defining
  enhanced inverse limit, compatibly with transitions and the completed unit.
- `adic_derived_equiv_reduce` (compatibility): Derived reduction of E_{Lambda,I}(A) modulo I^n equals E_{Lambda/I^n}(A tensor_Lambda^L Lambda/I^n), coherently in n.
- `adic_derived_equiv_complete_tensor` (structure): The comparison preserves the completed tensor product Lhat_{I}(A tensor_Lambda^L B), with its unit.
- `adic_derived_equiv_inverse_limit` (characterisation): The comparison is the L0 inverse limit of its finite-level comparisons, including transition equivalences.

**Checks.**

- `adic_derived_equiv_zell` (computation): For Lambda=Z_ell, I=(ell), ell≠p, the constant derived-complete Z_ell sheaf reduces to the constant Z/ell^n comparison at every n.
- `adic_derived_equiv_reduction` (compatibility): For I=(ell), the square for Z/ell^(n+1)→Z/ell^n commutes with derived coefficient reduction.
- `adic_derived_equiv_completed_unit` (characterisation): The tensor unit is the derived-complete Lambda object, and the tensor comparison is completed tensor; no ordinary tensor is declared complete by definition.

### Finite-level and global-sections compatibility for adic coefficients

Prove `adic_global_sections`: The adic comparison commutes with chart pullbacks, derived reduction modulo every I^n, and L0 completed tensor. For A in the adic category, the actual global-sections comparison is the coherent inverse limit of the finite-level maps RΓ(X_et,A_n)→RΓ_et(X^diamond,E_n A_n), using the completed interpretation for unbounded A_n. Both sides are derived I-complete; for Lambda=Z_ell the reductions recover the finite Z/ell^n comparisons. No statement for Z_p or rational ell-adic coefficients is obtained by this completion argument.

*Needs:* F5, `adic_derived_equiv`; F5, `completed_global_sections`; F5, `derived_pullback_tensor`; AdicCoefficientsAndComparisons, Layer L0 (derived-complete coefficient limits).

Use L0’s finite-level detection and completed tensor compatibility. The global-sections right adjoints commute with the enhanced limit; transport the actual compatible maps rather than only their values.

Checks: The Z_ell test is a coherent tower, not an isolated finite-level calculation.

(ECD Definition 26.1; Proposition 26.2 and proof; Remark 26.3, pp.161–162.)

### Examples

For Lambda=Z_ell with ell≠p, the comparison is a coherent tower: its n-th reduction sends the constant Z/ell^n sheaf to the same constant sheaf on X^diamond, and the transition to level n commutes with reduction from n+1. For a bounded-below complex, completion agrees with the ordinary site comparison. For an unbounded Postnikov tower, the limit includes its coherent maps rather than only separate isomorphisms of cohomology groups.

### Dependencies

F3; DiamondEtaleCohomology §§C2.2–C2.5, C2.9–C2.12 and Layer C3; EnhancedDerivedSheaves §§0.1–0.4, E2.3, E3.4 and Layer E4; AdicCoefficientsAndComparisons Layer L0.

## Suggested Lean forms

[Suggested.lean](Suggested.lean) records suggested forms, not an exhaustive
checklist. This README is definitive. Its two theorem signatures express the
compatible-root equation in F4 and the normed-ring consequence of the lower
bound. They use existing commutative rings and complete normed rings, with
all their algebraic hypotheses present. The product, quotient, sites, Cartier
objects and enhanced comparisons have their intended signatures in the
corresponding subsections above; their carriers are mathematical targets.

The reusable API should expose morphisms, their naturality and uniqueness,
not just existence of unstructured bijections. Keep both coordinates in the
product extensionality lemmas, the actual site functor in the site equivalence,
pullback associators in descent, the quotient topology and integral subring
in Cartier constructions, and the natural comparison map in global sections.
These are the interfaces used by the following layers and by the relative
curve roadmap.

## References

Numbered citations above use the following editions and their printed page
numbers. FS supplies the period-domain product, Frobenius quotient and untilt
Cartier statements. SW supplies the analytic closedness criterion and the
norm argument in the geometric example. ECD supplies the diamond functor,
site comparison and enhanced coefficient formalism. KL fixes the public
adic-site convention.

- **FS:** Laurent Fargues and Peter Scholze,
  [*Geometrization of the local Langlands correspondence*][fs], author-hosted
  edition with II.1.1–4 on pp.47–50 and II.1.15–18 on pp.54–55
  (SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`).
  Definition II.1.19, p.56, fixes the distinction from Div¹.
- **SW:** Peter Scholze and Jared Weinstein,
  [*Berkeley Lectures on p-adic Geometry*][sw], author draft of 27 March 2020.
  Definitions 5.3.2 and 5.3.7, Proposition 5.3.8 and Remark 5.3.9, pp.38–40;
  Proposition 11.3.1 and its proof, pp.94–95; Proposition 13.1.1 and its proof,
  pp.108–109, and Definition 13.5.1, p.112.
- **ECD:** Peter Scholze, [*Étale cohomology of diamonds*][ecd],
  arXiv:1709.07343v4, April 2026. Definition 15.5 and Lemma 15.6, pp.91–92;
  Proposition 10.11(iii), pp.52–53, using Proposition 9.7, pp.47–48;
  Definition 14.13, Remark 14.14 and Proposition 14.15, p.88;
  Definition 26.1, Proposition 26.2 and Remark 26.3, pp.161–162.
- **KL:** Kiran S. Kedlaya and Ruochuan Liu,
  [*Relative p-adic Hodge theory: Foundations*][kl], arXiv:1301.0792v5,
  manuscript of 2 May 2015. Definitions 8.2.16 and 8.2.19, Lemma 8.2.17 and
  Remark 8.2.18, pp.162–163.

The boundary norm equality in F4 includes an explicit one-variable theorem,
finite-root approximation and a geometric-fiber reduction. The reference to
FS's proof of II.1.4, p.50, locates that argument; it does not replace the
proof of these ingredients. Likewise, the coefficient citations are general
results specialized through C2 and L0, rather than separately asserted
Fargues–Fontaine global-sections formulas.

[adic-anchor]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdicSpaces/README.md#layer-6-the-adic-farguesfontaine-curve
[adic-etale]: ../AdicEtaleGeometry/README.md
[perfectoid]: ../PerfectoidSpaces/README.md
[diamonds]: ../DiamondsAndVStacks/README.md
[adic-part-ii]: ../AdicSpacesPartII/README.md
[cohomology]: ../DiamondEtaleCohomology/README.md
[coefficients]: ../AdicCoefficientsAndComparisons/README.md
[relative]: ../RelativeFarguesFontaine/README.md
[fs]: https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf
[sw]: https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf
[ecd]: https://arxiv.org/pdf/1709.07343v4
[kl]: https://arxiv.org/pdf/1301.0792v5

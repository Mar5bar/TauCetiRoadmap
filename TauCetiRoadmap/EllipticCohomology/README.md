# Elliptic cohomology and topological modular forms

Construct elliptic cohomology theories and the topological modular-form
spectra tmf, Tmf and TMF, with their sheaves, coefficients, orientations and
q-expansion comparisons. Include the algebraic and obstruction-theoretic
foundations of the realization theorem. A ring of modular forms is not a
spectrum, and a Landweber-exact theory does not automatically have an E∞
structure.

## Conventions and suppliers

HomotopySpheres section references use the [specification at
34167306e5a1726e2574b039dc1a27f913985f0f](https://github.com/TauCetiProject/TauCetiRoadmap/blob/34167306e5a1726e2574b039dc1a27f913985f0f/TauCetiRoadmap/HomotopySpheres/README.md)
in PR284.

Use GeneralizedCohomology's chosen spectral models, commutative spectral rings,
derived limits and Postnikov/connective-cover machinery. BordismFormalGroups
owns the native formal-group, MU/BP, exact-functor and algebraic Lubin–Tate
deformation theory and F6's Bousfield/chromatic localization. ModularCurves
owns elliptic schemes over arbitrary bases, their Weierstrass presentation,
effective descent, complete-local formal completions, p-divisible groups and
its specified Serre–Tate comparison. EllipticCurves Layer1(i) supplies the
formal group law over the coefficient ring; this roadmap owns its descent
under coordinate changes and the residue-field descent required below.
Consume SchemeAndStackFoundations §§1.18–1.22 for stacks, presentations,
quasi-coherent modules and descent, and §4.15's `StableCurves.Mbar 1 1`,
smooth locus, proper DM structure, node-smoothing coordinates and level
normalizations. Reuse Mathlib's schemes, étale
sites, `Pseudofunctor.IsStack`, `DescentData`,
`SheafOfModules.IsQuasicoherent`, `WeierstrassCurve` and `FormalGroup`.

ModularForms owns the analytic modular forms and q-expansions; this roadmap
owns their algebraic stack sections and the comparison with that analytic
theory. StringOrientation owns BString, the coherent MString Thom ring, its
primary Witten q-series genus and geometric Cayley-plane questions. This
roadmap owns the Ando–Hopkins–Rezk E∞ orientation and its comparison with
that genus. Neither orientation nor the String genus constructs the elliptic
sheaf or proves its existence.

Let M_ell be the stack of smooth elliptic curves and Mbar_ell its
proper compactification of stable one-pointed genus-one curves over ℤ:
its geometric fibres are smooth elliptic curves or the Néron 1-gon.
Generalized n-gons with level structure belong to E6, with contraction to
this level-one compactification.
Let ω be the Hodge line. Construct
TMF=RΓ(M_ell,O^top), Tmf=RΓ(Mbar_ell,O^top),
and tmf=τ_(≥0)Tmf, with the designated commutative-ring models and maps.
At level one use the ordinary étale site of Mbar_ell, including its nodal
curves, as in the chosen DFHH construction. E6 constructs the log-étale
level extensions and their comparison with this sheaf.
Weight k corresponds to spectral degree 2k. These spectra are distinct;
negative homotopy, torsion and periodic localization must be compared through
their actual maps.

## E1. Algebraic moduli and its formal neighbourhoods

Construct the equivalence of ModularCurves' elliptic-scheme moduli functor
with §4.15's smooth locus M_(1,1), preserving the marked identity,
group law and isomorphisms. Consume its fppf descent, representable
unramified diagonal and étale atlases on §1.18's stack carrier.
Consume its generic 2-fibre products, atlas-independent descent and
§1.22's quasi-coherent stack modules. Identify the elliptic instances and
their étale/fppf comparisons; retain the moduli groupoid over each test
scheme, its automorphisms and pullbacks.

Own the small étale site of these DM stacks: representable étale test
schemes, fibre products, jointly surjective covering families and atlas
refinements. Construct its sheaf/module categories, derived global
sections and hypercover descent, and the comparison of quasi-coherent
cohomology with the atlas nerve and its normalized cobar complex.
Prove independence of the étale atlas and comparison with the smooth
Weierstrass presentation, including derived base change with its stated
flatness hypotheses. Construct local cohomology with support, its
localization triangle and long exact sequence. These are stack targets
here; the scheme/algebraic-space site and cohomology suppliers do not
already give them. Construct the compactified stack's coherent trace
and derived duality comparisons needed in E4. After inverting6 identify
the dualizing line as ω^(−10) with cohomological shift1 and prove the
perfect pairing of finitely generated projective ℤ[1/6]-modules
`H⁰(ω^k)⊗H¹(ω^(−10−k))→H¹(ω^(−10))≃ℤ[1/6]`.
Integrally construct the
presentation resolutions and retain all higher stabilizer cohomology
and derived torsion terms in the trace/duality comparison; do not replace
them with a perfect H⁰/H¹ pairing or a cohomological-dimension-one claim.

Consume the Weierstrass change-of-variable group and discriminant-open
presentation. Prove this is a smooth atlas, its groupoid presentation and
comparison with the étale atlas, including local coordinates and their
line-bundle descent. Define ω, c₄∈H⁰(ω⁴), c₆∈H⁰(ω⁶), Δ∈H⁰(ω¹²),
with c₄³−c₆²=1728Δ, their coordinate weights and base-change laws.
Use native `WeierstrassCurve` on the atlas and its `IsElliptic` instance.

Consume the stable genus-one compactification and labelled nodal charts
from §4.15 and construct their comparison with one-component generalized
elliptic curves. Extend ω and Δ through these supplied curves and
coordinate transitions. E6 owns logarithmic structures and n-gon/level
comparisons on this same compactification; it does not reconstruct its
proper DM property. Construct the cubic stack
`M_cub=[Spec ℤ[a₁,a₂,a₃,a₄,a₆]/G]`. Define the coordinate-change
group scheme G=Spec ℤ[u,u⁻¹,r,s,t] by x=u²x′+r and
y=u³y′+su²x′+t. Identify its R-points with native
[`WeierstrassCurve.VariableChange`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean).
Use its group multiplication and left action on coefficients: the product is
`(u,r,s,t)(v,R,S,T)=(uv,rv²+R,vs+S,tv³+rSv²+T)`,
For the curve morphism φ_(C,W):C•W→W given by
`(x′,y′)↦(u²x′+r,u³y′+su²x′+t)`, prove
`φ_(CC′,W)=φ_(C′,W)∘φ_(C,C′•W)`: it is
an anti-homomorphism, giving the native left action C•W on coefficients.
An arrow has source W and target C•W; applying C′ first and then C
has composite CC′. Set A=ℤ[a₁,a₂,a₃,a₄,a₆] and
Γ=A[u,u⁻¹,r,s,t]. Pin η_L to the source coefficients and η_R to
native `WeierstrassCurve.variableChange_def`. In Γ⊗_AΓ, with the
left factor the first arrow and right factor the second, pin
`Δu=u₁u₂`, `Δr=r₁+u₁²r₂`, `Δs=s₁+u₁s₂` and
`Δt=t₁+u₁³t₂+s₁u₁²r₂`. Prove the unit, counit, inverse and
cobar/groupoid comparisons in this order.
For the invariant differential, prove φ_C*ω_W=u⁻¹ω_(C•W).
Thus the new trivialization is u times the pulled-back old one, and
a weight-k coefficient transforms by u⁻k. Consume native
`variableChange_c₄`, `variableChange_c₆`, `variableChange_Δ`,
`VariableChange.mapHom` and `map_variableChange` for R-point weights
and base change. Own the group-scheme representability and descent
comparison of these native laws. Give the explicit dictionary to Bauer's
Hopf-algebroid/cobar conventions, including this arrow/composition order,
right unit, invariant-differential character and c₆ normalization; use
E4's fixed native q-expansion to identify any reference sign change. The u=1
subgroup is the noncommutative central extension of 𝔾ₐ² by 𝔾ₐ
with t-cross-term rS; G is its
semidirect product with 𝔾ₘ, rather than with an additive 𝔾ₐ³. Own Riemann–Roch and cohomology/
base-change for O(2e) and O(3e) on the smooth and nodal stable genus-one
families used to construct this presentation. Prove the compactified
one-pointed stable elliptic stack identifies with the open locus where
(c₄,Δ) generates the unit ideal: its geometric fibres are smooth or
nodal, and the excluded locus V(c₄,Δ) is cuspidal. Construct the open
immersion and line-bundle comparison. Prove this excluded support has
codimension two in the smooth cubic atlas, with the depth-two extension
criterion equivariantly under the coordinate-change group, and deduce
the Hartogs comparison on H⁰(ω^k) before computing those sections.

Compute the Weierstrass Hopf-algebroid/cobar comparison with the supplied
stack cohomology. Prove the integral algebraic modular-form ring is
H⁰(Mbar_ell,ω^*)=ℤ[c₄,c₆,Δ]/(c₄³−c₆²−1728Δ), with weights 4,6,12, and its
ℤ[1/6] presentation. Compare over ℂ with ModularForms' level-one
analytic forms through the Tate q-expansions, the ring presentations and
q-expansion injectivity, including holomorphy at the cusp and the integral
lattice. This specifies the comparison without assuming an unnamed
complex uniformization theorem.

Construct the formal generalized Tate 1-gon over ℤ[[q]], its canonical
differential, and its smooth Tate curve after inverting q. Identify the
latter over ℤ[1/N]((q)) with ModularCurves' Tate curve and level maps.
Construct the formal cusp neighbourhood and transition maps; the formal
multiplicative group belongs to the smooth identity component, including
at q=0. Prove the ordinary height1 and supersingular height2 strata and
their formal deformation comparison, including p=2,3. Consume
ModularCurves' algebraically closed residue-field Serre–Tate theorem and
F5's algebraic Lubin–Tate deformation. Construct the Tate–Messing
equivalence between deformations of a connected p-divisible group and
its formal group, preserving the marked special fibre and the chosen
coordinate. Pass from the artinian comparison to complete local rings
by compatible inverse limits and effective formal deformation, and
prove the elliptic algebraization comparison. Then prove descent along separable
residue-field extensions and the resulting perfect-field comparison with
its automorphism data. This descent precedes the spectral realizations.
Separate the supersingular and ordinary cases. At supersingular points
C[p^∞] is connected, so Def(C)≃Def(Ĉ) by Serre–Tate and Tate–Messing.
At an ordinary point, Serre–Tate identifies Def(C) with deformations of
the full connected–étale p-divisible extension. The map to the height1
connected formal-group deformation is formally smooth of relative
dimension1, with the extension's Serre–Tate parameter; it is not an
equivalence. Prove these two statements with their marked special-fibre
and residue-field descent data. The nodal Tate chart uses its separately
constructed q-parameter and multiplicative identity component.

## E2. Elliptic theories and local spectral realization

For a generalized elliptic curve E with irreducible geometric fibres
(smooth elliptic curves or Néron 1-gons) over a ring R with a chosen Hodge-line
trivialization, construct its formal group on the native carrier and
the graded periodic coefficient ring R[u,u⁻¹], |u|=2. Prove the
Landweber condition when the classified map Spec R→Mbar_ell is flat,
using F5: for each prime p, p is injective on R, v₁ is injective on
R/p, and v₂ is a unit on the height2 quotient (higher quotients vanish).
Identify v₁ with the Hasse invariant in the chosen coordinate and
prove that it is a unit on the nodal multiplicative locus. Apply F6's
p-local height-bound theorem to the localized theory E_(p), obtaining
its E(2)-locality for each prime p.
Also give the direct regular-sequence criterion for a supplied curve
when the map is not flat;
construct the represented elliptic homology theory with its formal-group
comparison and dependence on the coordinate/differential. For families
without a global trivialization use the graded line powers, and glue after
trivializing ω. Include multiplicative K-theory at the Tate boundary.

Use the ordinary/supersingular/rational construction of
Douglas–Francis–Henriques–Hill, Chapters 6–8, 12 and 16. The following
construction targets precede the elliptic gluing.

1. Consume F6's K(1)- and K(2)-local categories, finite-group norm/Tate comparisons and fracture squares and
   G3's derived limits/completions. Construct continuous actions and
   homotopy fixed points for profinite groups by continuous cochains on
   finite quotients and derived limits, with their descent spectral
   sequences, products, naturality and convergence hypotheses.
   Consume native `PadicInt.mahler`, `hasSum_mahler` and `mahlerEquiv`
   for continuous functions on ℤ_p; use completed function/tensor modules,
   not uncompleted polynomial rings. Prove the translation-difference exact
   sequence on C(ℤ_p,ℤ_p) from the binomial basis and transport through a
   chosen generator ℤ_p×/μ≃ℤ_p. Construct completed KU cooperations as
   continuous functions on ℤ_p×, and the Adams-summand/KO comparisons by
   μ-homotopy fixed points. For K(1)-local X, establish the fibre sequence
   `X→L_K(1)(B smash X)→L_K(1)(B smash X)` with second map ψ_g−1,
   where B is the odd-prime Adams summand or KO at2. Retain the generator
   dependence and the distinction between the summand and the 2-primary case.
2. For h∈{1,2}, realize F5's Lubin–Tate deformation as the even-periodic
   Morava E spectrum of a specified height-h formal group over a perfect
   field k. Prove π₀=W(k)[[u₁,…,u_(h−1)]], π₂ an invertible module,
   the formal-group identification, and the Goerss–Hopkins–Miller E∞
   existence/uniqueness and coherent automorphism action. For the standard Honda height-h group over F_(p^h), prove the
   K(h)-local completed E_*E comparison with continuous functions on
   its extended stabilizer group, including its profinite topology,
   Galois action and completed tensor products. Compare other residue
   fields/groups by the specified scalar extension and descent;
   do not assert that unchanged cooperation formula for every perfect
   field. State each residue-field/Galois action explicitly.
3. Prove the required Adams condition for the realization theory:
   express the homology spectrum as a filtered homotopy colimit of
   finite cellular spectra with projective homology of their duals,
   and prove the module-map/homology-Hom comparison, cooperation
   flatness and Künneth spectral sequence. Own the realization/obstruction machinery: simplicial resolutions of
   commutative spectral algebras, cotangent complexes and André–Quillen
   cohomology, the Goerss–Hopkins obstruction tower for the supplied
   complete cooperation algebra, mapping-space classification, convergence
   and the vanishing calculations in the universal deformation case.
   Prove its homotopy-coherent functoriality on the elliptic deformation
   maps, including changes of coordinate and differential.
4. On the ordinary locus (including the nodal identity component)
   construct the Igusa stages classifying μ_(p^k)≃Ĉ[p^k], their
   étale torsor maps and the ℤ_p× tower action. Prove affine
   representability at k≥1 for odd p and k≥2 at2, including the
   Weierstrass jet/rigidity calculations at2 and3. Set
   `V∞hat=lim_m colim_k V_k/p^m`, with the completion/continuous-action
   comparisons. Construct Frobenius lift ψᵖ, θ with ψᵖ(a)=aᵖ+pθ(a),
   and continuous Adams operations, using the canonical subgroup quotient
   and proving its extension across the nodal fibres by q-expansions.
   Construct the K(1)-local θ-algebra realization and map obstruction
   theory. For p-complete K-homology A_*, realization obstructions have
   shifts−s+2 for s≥3, uniqueness shifts−s+1 for s≥2; map existence
   has shifts−s+1 for s≥2, uniqueness−s for s≥1. Pin these as
   θ-André–Quillen groups relative to (K_p)_*, and construct the
   mapping-space spectral sequence and continuous cotangent resolutions.
   Prove vanishing from formal smoothness of invariant mod-p functions,
   ind-étaleness and positive-degree continuous-cohomology vanishing.

   For odd p realize the finite p-level model and lift its (ℤ/p)×
   action coherently by the group-cohomology obstruction tower; prove
   vanishing using p-completeness and the prime-to-p group order.
   Take homotopy fixed points and use F6's K(1)-local norm comparison.
   At2 use the separate reduced-θ construction of DFHH12§7 and
   AppendixA: Γ=ℤ₂×/{±1}, graded algebra (KO₂)_*⊗_(ℤ₂)V_red,
   with Bott-periodic meaning this specified KO-module shape. Prove
   its ordinary instance has V_red=V∞hat; V_red is not the Igusa
   level-zero ring. For shrinking open subgroups G_j⊂Γ construct
   T_j=KO₂^{hG_j}, the restriction maps T_j→T_(j+1), and
   KO₂≃L_K(1) hocolim_j T_j. Prove the completed K-homology,
   continuous-function/coinduction and local-completion comparisons
   giving this equivalence and the projective resolution below.
   [-1] acts trivially on V∞hat, the level4 affine comparison and
   H_c^s(Γ,V∞hat/2)=0 for s>0. Build the KO-based simplicial free
   resolution, its finite-Galois dualizable projective spectra,
   spiral exact sequence and reduced-θ obstruction theory in this
   restricted category, verifying its continuous-cohomology hypotheses.
   Prove the KO/K completed-homology comparison and degreewise
   vanishing, including the modulo8 shifts, before constructing the
   2-primary ordinary model. The odd-prime finite-action argument
   is not used for a group whose order is divisible by2.

   For étale charts over the ordinary locus prove relative θ-cotangent
   complexes vanish, construct the local algebra spectra, and lift the
   diagram by contractible mapping-space components. Compare with
   completed K-theory on the Tate curve.
5. Form the supersingular model from the height-two realizations and
   continuous automorphism/Galois descent. Fix an auxiliary full ordered
   level N≥3 with p∤N. Consume ModularCurves' level-N representability
   and the supplied level covers directly here, before E6. Construct
   the étale GL₂(ℤ/N)-torsor forgetting its ordered basis, including the
   Weil-pairing action; no primitive Nth root is fixed unless the base
   and level problem specify it. Algebraize the universal formal
   supersingular curve with this level and construct its ordinary
   restriction and completed Igusa pullbacks. Prove DFHH8 Lemmas8.3–8.6:
   completed coinduction/descent identifies the homology rings, positive
   group cohomology vanishes for these torsor modules, and the resulting
   homotopy-fixed-point spectral sequences collapse. Prove the K(1)-local
   finite homotopy-fixed-point comparison for these supplied models;
   this comparison carries the torsor/coinduction hypotheses.
   Construct its K(1)-local
   restriction and the comparison to the ordinary model, proving that
   the algebraic maps lift with the stated derived mapping-space
   uniqueness. Construct the rational even-periodic model from algebraic
   modular forms and compare it with the rationalized p-adic models.
   Glue by F6's chromatic fracture squares and the arithmetic square,
   with all transition homotopies and completion/limit comparisons.
   On a p-complete étale chart with graded line-power ring R_*, prove
   (p,v₁) is regular and compare ordinary coefficients
   `(R_*[v₁⁻¹])^hat_p`, supersingular coefficients
   `(R_*)^hat_(p,v₁)` and their ordinary overlap. Prove the coefficient
   pullback square using the non-zero-divisor localization/completion
   lemma and completion exactness in this regular chart setting.
   Prove the general lemma that p-adic completion preserves a short
   exact sequence with p-torsion-free cokernel: reduction modulo p^m
   stays exact, and the left inverse system is surjective, so its
   Mittag–Leffler lim¹ vanishes. Verify this cokernel hypothesis for
   the localization/completion square from (p,v₁)-regularity before
   completing it; compare with G3's derived completion.
   Prove the spectral pullback has the original
   line-power coefficients and the specified formal group.
   At2 construct the chromatic transition with reduced-θ/KO obstruction
   groups and the level4 comparison; the odd-prime prime-to-p action proof
   does not replace it. For the rational model use the normalized formal
   logarithm and the Hℚ-algebra on the graded line powers. Cover rational
   moduli by c₄≠0 and Δ≠0, construct their compatible arithmetic maps
   into `(product_p O_p)^rational`, and prove the relative étale cotangent
   vanishing and coherent diagram-lifting on every chart. Keep
   rationalization outside the infinite product. Establish the presheaf
   hypercover model/descent and rectification comparisons on G's spectral
   category before identifying this gluing with O^top.

For each test étale chart prove the resulting formal group is that of its
elliptic curve and establish base change, coordinate independence and
the local E∞ uniqueness needed for sheaf descent. Treat the nodal cusp
by E2.4's ordinary Tate/K-theory model. Landweber
exactness supplies the represented theory comparison; these realization
and gluing theorems supply its commutative spectral refinement.

## E3. The elliptic sheaf and global spectra

Assemble O^top on the ordinary étale site of Mbar_ell from E2's
smooth and nodal charts, and restrict it to M_ell. Prove
hyperdescent, atlas independence, multiplicative transition maps and
compatibility with the local realizations. Prove the homotopy-sheaf
identifications π_(2k)O^top≃ω^k and π_(2k+1)O^top=0, with products.
The sheaf is locally even-periodic; its global sections need not be.

Construct the three spectra in the conventions, their comparison maps,
unit, products and represented theories on CW pairs. Construct the
descent spectral sequences H^s(M,ω^k)⇒π_(2k−s)RΓ(M,O^top),
with naturality, edge maps, products, filtration, all convergence and
lim¹ conditions. Prove the corresponding Tate q-expansion map into
KO[[q]] and its localization KO((q))=KO[[q]][q⁻¹]. Construct KO[[q]]
as the derived inverse limit of truncated polynomial KO-algebras and
prove its coefficient/product and completion comparisons; construct
localization on G's ring-spectrum model. Pin the connective/compactified
q-expansion to KO[[q]] and the periodic punctured-boundary map to
KO((q)), together with their KU complexification maps. Prove restriction to
the boundary and rational/algebraic modular-form comparisons.

## E4. Coefficients and connective/periodic comparisons

Separate the stack of Weierstrass cubic curves from the compactified
stable elliptic stack. Construct the restriction/localization comparison
between their Hopf-algebroid/cobar complexes and stack cohomology, pinning
the range supplying connective tmf and the additional compactified input
for Tmf. Compute H^s(Mbar_ell,ω^k) for all s≥0 and every negative
weight k. Use E1's local-cohomology triangle for the cuspidal support
removed from the cubic stack, its cobar/localization comparison and
derived coherent duality. Prove the cubic cobar complex has no negative-
weight terms, and derive the negative-weight groups from supported
cohomology, retaining the integral higher-filtration torsion at2 and3,
base change and product pairings. Consume E1's depth-two Hartogs
comparison for H⁰. Include these groups and their differentials/extensions in the compactified
descent calculation. Identify the connective cover through E3's actual map.

Construct the unit-induced map from the sphere's MU Adams–Novikov
resolution to the elliptic descent tower. On E₂ identify it with the
formal-group-classifying map Mbar_ell→M_FG and the MU/Weierstrass
Hopf-algebroid map, with its grading and filtration. Prove compatibility
with products, differentials and abutment detection. Instantiate F4's
ring/module-spectrum Toda and filtered-tower Moss comparisons in this
descent tower; verify the survival, nullhomotopy and no-crossing-
differential hypotheses for every bracket used in the2/3-primary
coefficient computation. The sphere comparison alone does not supply
these Tmf brackets or their convergence.

Compute the integral graded coefficient groups and products of tmf and
Tmf, using F4's sphere Adams–Novikov/cobar comparisons and their Toda
brackets and differentials, separate p=2 and p=3 descent calculations, the torsion-free
calculation away from 6 and the arithmetic square. Give complete
generators, relations, additive orders, differentials and hidden
additive/multiplicative extensions, with their detection maps; a table
of E₂ terms alone is not a homotopy-ring computation. Prove the rational
comparison and
π_*tmf[1/6]≅ℤ[1/6][c₄,c₆], in degrees 8 and12, with the designated
normalizations. Pin c₄(q)=E₄(q)=240G₄(q) and
c₆(q)=−E₆(q)=504G₆(q) for String's Bernoulli-normalized G_(2k).
These factors are not units over ℤ[1/6]; the coefficient-ring
polynomial generators are c₄,c₆, not the unscaled G₄,G₆.

Construct the integral permanent-cycle lift of Δ²⁴ in degree576 and
prove the corresponding localization tmf[(Δ²⁴)⁻¹]≃TMF and
Tmf[(Δ²⁴)⁻¹]≃TMF, with their ring and q-expansion maps. Include the
degree192 periodicity at2 from Δ⁸, degree72 periodicity at3 from Δ³ and the degree24 period
after inverting 6, verifying the actual powers/permanent cycles.
Do not treat Δ as an integral degree24 homotopy element without this
calculation. Construct tmf's connective-cover comparison with Tmf and
identify its effect on nonnegative and negative groups separately.
Build the edge map π_(2k)tmf→H⁰(Mbar_ell,ω^k) and determine its
integral image and kernel. Prove Hopkins–Mahowald's image basis
 a_(i,j,k)c₄^i c₆^j Δ^k, i,k≥0, j∈{0,1}, where a=1 for i>0,j=0,
 a=2 for j=1, and a=24/gcd(24,k) for i=j=0 (gcd(24,0)=24).
Compare the chosen native c₆ with the sign convention in each reference.
Compute the torsion kernel and its multiplicative extensions separately.
Construct the periodic edge map
`π_(2k)TMF→H⁰(M_ell,ω^k)=H⁰(Mbar_ell,ω^*)[Δ⁻¹]_k`,
with integral image, kernel and compatibility with the preceding
connective map and Δ²⁴ localization. Its target allows poles at the cusp;
the holomorphic target is the connective map's target.

## E5. Coherent String orientation and the Witten comparison

Consume StringOrientation S2's actual E∞ MString model. Construct the
Ando–Hopkins–Rezk orientation σ:MString→tmf as an E∞ map.
Consume E2's K(1)-local realization, Igusa tower, p-adic modular forms
and θ operations. Construct Katz's p-adic modular-form completion and
its comparison with the Igusa functions, including weight/Adams actions
and q-expansion injectivity. Build the units spectrum gl₁(R), the Thom-orientation mapping-space
description and its obstruction fibre sequence on G's commutative-ring
model. Construct p-adic measures and moments, Kummer congruences and
the Eisenstein-series integrality relations used in the orientation
criterion. Prove the height1/2 and arithmetic compatibility and the
obstruction vanishing, with the normalization selecting the Witten
orientation; rational characteristic-series equality is insufficient.
Prove comparison with the String S4 genus on the edge map and at the
Tate cusp, and with the specified KO/ABS orientation after the
appropriate constant-term map.

Give natural ring maps on geometric String bordism via S2's PT
isomorphism, pullback/product/forgetting laws and effects of changes
of String lift. Determine the image on π_* and its torsion information,
including the orientation's surjectivity theorem. Construct
Devalapurkar's loop-space Thom E1 ring B and its map to MString:
use the O(9)→O(10) fibre sequence and the specified clutching element
mapping to 2ν to construct BN, N=ΩBN and N→BString. Prove
BP_*B=BP_*[b₄,y₆], degrees8,12, its low-cell and Steenrod comparisons,
and the 2- and 3-local Adams–Novikov differentials and Toda relations
that lift all tmf generators. Build the auxiliary finite complexes and
level3 comparison used for those lifts, then perform arithmetic
reconstruction. The coherent Thom/quotient construction consumes S2;
the classical unstable homotopy calculations consume PR284's Bott/J
contracts and TB's Adams theory. Keep the edge-map image a separate
calculation: surjectivity onto tmf does not make every integral modular
form a Witten genus. StringOrientation owns the geometric I_OP inclusion
and equality questions; this roadmap supplies the spectrum, orientation
and the q-expansion/torsion comparisons they require.

## E6. Levels, boundary maps and reusable applications

Construct logarithmic structures on schemes and stacks, their pullbacks,
charts, fine saturated monoids, characteristic sheaves and the divisorial
log structure at the supplied nodal boundary. Construct Kato log-étale
morphisms, their chart criterion, base change, composition and descent,
the log-étale site and hypercovers. Compare the ordinary and log-étale
sites on the smooth locus and their boundary charts. These logarithmic
foundations and Hill–Lawson's spectral boundary extension use the existing
level-one compactification and its E3 ordinary-étale sheaf. Construct
their comparison on level one, preserving the Tate/K-theory model and
its transition maps, before identifying the level sheaf pullbacks.

Use ModularCurves' actual level structures to construct the elliptic
sheaf pullbacks and their global Tmf(Γ) spectra for the tame
Γ(N), Γ₁(N), Γ₀(N) problems, with the level inverted and the exact
stack/representability hypotheses. Construct the compactified level
stacks of generalized elliptic curves with the specified ample level
structure, including Néron n-gons, contraction/stabilization, properness,
log-étale transition maps and comparison with ModularCurves' coarse
compactifications. Prove their pullback/descent relation to the
level-one stable compactification. Prove forgetful and change-of-level
maps, descent under deck groups and boundary K-theory comparisons.
Define connective covers individually; a level theory is not obtained
by simply tensoring the level-one coefficient ring. Include level3
as an explicit worked computation and its homology comparison with
the level-one spectrum.

Construct the primary and secondary detection maps used by String
bordism: low-stem unit images, the q-expansion edge and the torsion
kernel, and the connective-to-periodic change. Supply the maps and coefficient comparisons consumed by
StringOrientation S6's positive-Ricci TMF vanishing question.
Do not deduce torsion-sensitive vanishing from zero rational or modular
q-expansion. General elliptic indices of field theories are not
assumed in this spectral construction.

## Order and references

E1 and F5's deformation and F6's localization lanes precede E2. E2 plus E1 descent supplies E3;
E4 computes its coefficients. E5 uses E3/E4 and String S2/S4, while the
String S4 genus uses F/G and index theory independently of E5;
E5 owns its identification with the spectral orientation and q-expansion,
and String S5/S6 consume that identification. E6 uses E1–E4 and the specified
ModularCurves level problems. All obstruction, convergence and descent
inputs are targets in these layers.

- Goerss, [*Topological modular forms (after Hopkins, Miller, and Lurie)*](https://arxiv.org/abs/0910.5130), for the realization and algebraic geometry.
- Hill–Lawson, [*Topological modular forms with level structure*](https://arxiv.org/abs/1312.7394), for the log-étale sheaf and boundary construction.
- Douglas–Francis–Henriques–Hill, [*Topological Modular Forms*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/TMF-DFHH.pdf), Chapters6–8,12,16, for the chosen realization, obstruction and fracture construction.
- Hopkins, [*Algebraic topology and modular forms*](https://arxiv.org/abs/math/0212397), Proposition4.6, for the integral edge-image basis (with the stated c₆ convention comparison).
- Bauer, *Computation of the homotopy of the spectrum tmf*, for integral coefficients and descent extensions.
- Ando–Hopkins–Rezk, [*Multiplicative orientations of KO-theory and of the spectrum of topological modular forms*](https://www-users.cse.umn.edu/~tlawson/tmf-mirror/koandtmf.pdf), for the orientation criterion.
- Ando–Blumberg–Gepner–Hopkins–Rezk, [*Units of ring spectra, orientations, and Thom spectra via rigid infinite loop space theory*](https://arxiv.org/abs/1403.4320), for the coherent Thom/units machinery.
- Devalapurkar, [*The Ando–Hopkins–Rezk orientation is surjective*](https://arxiv.org/abs/1911.10534), for the coefficient-image theorem and its additional proof constructions.

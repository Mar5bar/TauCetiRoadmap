# Bordism, formal groups and chromatic operations

Develop the coefficient and operation theory that connects complex bordism to
one-dimensional commutative formal groups. Include Lazard and Quillen
universality, p-typical coordinates, Brown–Peterson and Johnson–Wilson theories,
their cooperations and spectral sequences, and Landweber exactness. A chosen
complex orientation is data; its formal group does not by itself prove a
coefficient-ring universality theorem or supply an E∞ orientation.

## Carriers, conventions and owners

HomotopySpheres section references use the [§3C/§9 specification at
34167306e5a1726e2574b039dc1a27f913985f0f](https://github.com/TauCetiProject/TauCetiRoadmap/blob/34167306e5a1726e2574b039dc1a27f913985f0f/TauCetiRoadmap/HomotopySpheres/README.md)
in PR284.

Use Mathlib's `FormalGroup R`, `FormalGroup.IsComm` and
`MvPowerSeries (Fin 2) R`, with the existing substitution and coefficient APIs.
Follow the proposed `FormalGroupHom`, `FormalGroupIso` and `addInvX` designs in
Mathlib [#38213](https://github.com/leanprover-community/mathlib4/pull/38213)
and [#36167](https://github.com/leanprover-community/mathlib4/pull/36167),
including [#41710](https://github.com/leanprover-community/mathlib4/pull/41710)'s
topologically nilpotent point carrier. Construct the missing APIs in Tau Ceti
with these shapes; adopt Mathlib's resulting APIs when they arrive.

GeneralizedCohomology G2–G5 supplies spectral models, derived smash/function
objects, represented theories, projective/Thom orientations, MU and its
multiplicative model, connective K spectra and generic spectral Postnikov
covers. TangentialBordism supplies geometric cycles and the Pontryagin–Thom
comparison, and owns the integral unoriented/oriented/Spin coefficient
calculations. This roadmap owns MU's coefficient universality and generic
MU/BP operations and Adams–Novikov machinery. StringOrientation owns the
Hovey specialization to MString and its geometric Cayley-plane kernel.
EllipticCohomology owns elliptic realization, descent and tmf; it consumes
formal-group exactness and deformation theory here.

Use homological grading: |v_i|=2(p^i−1), |b_i|=2i and a complex
orientation in cohomological degree 2. A formal-group coefficient a_ij has
homological degree 2(i+j−1). For graded coefficients, retain the direct-sum
graded ring and the homogeneous-degree equations; do not replace a
completed projective-space cohomology ring by a direct sum. Formal-group
coordinates, p-typical generators and strict coordinate changes are specified
choices, with explicit comparison maps between choices.

## F1. Formal-group algebra and universality

Build the inverse series, integral n-series, base change, morphisms,
isomorphisms and strict isomorphisms on the native carriers. Prove substitution
exists under its actual zero/nilpotent-constant hypotheses, coefficient
recurrences, uniqueness, composition, identities and inverse laws. Generalize
points to complete Hausdorff linearly topologized algebras with topologically
nilpotent elements, using the cited native design;
prove convergence and continuous functoriality rather than assuming every
power series can be evaluated everywhere.

Construct the Lazard ring L as the quotient of the polynomial ring over ℤ
on a_ij, i,j≥1, by all coefficient relations for commutativity and
associativity of X+Y+Σa_ij X^iY^j. Construct its universal native commutative
formal group and prove the natural bijection
Hom_ring(L,R) ≃ {F : FormalGroup R // F.IsComm}. Prove the graded version
and Lazard's polynomial theorem L≅ℤ[x₁,x₂,…], |x_n|=2n, with an explicit
generator construction and integral independence argument. Build the
homogeneous symmetric additive 2-cocycle comparison first: for n≥2 let
C_n(X,Y)=((X+Y)^n−X^n−Y^n)/d_n, an integral polynomial,
where d_n=p if n is a power of a prime p and d_n=1 otherwise.
For every commutative ring R prove that the normalized degree-n symmetric
cocycles are uniquely R-multiples of C_n, with coefficient/base-change
comparison. Prove the integral coefficient and gcd equations, including
torsion coefficient rings; a characteristic-zero logarithm does not prove
this assertion. Use this single cocycle lemma in Lazard's polynomial
construction and in the exponent-two specialization below. Build strict
coordinate-change representability by L[b₁,b₂,…], including source, target,
counit, composition and inverse maps and all Hopf-algebroid equations.

For ℚ-algebras construct invariant differentials, logarithm and exponential,
with normalized linear coefficient one, uniqueness and change-of-coordinate
laws. Prove the additive and multiplicative examples and their logarithms.

For every commutative coefficient ring R with 2=0 and commutative native
formal group F with [2]_F=0, construct its normalized strict logarithm
g_F(X)=X+Σ_(i≥1) a_i X^(i+1), with
g_F(F(X,Y))=g_F(X)+g_F(Y) and a_(2^k−1)=0 for every k≥1.
Prove existence, uniqueness, base-change naturality and the inverse strict
exponential. Pin the direction: g_F maps F to the additive group; its
inverse f_F satisfies F(f_F(X),f_F(Y))=f_F(X+Y).
Bundle g_F and f_F as the forward/inverse `FormalGroupHom` maps in
the cited `FormalGroupIso` shape, prove both substitution inverses and
`FormalGroupIso.IsStrict`, and compare the normalized coefficient
existence/uniqueness prototype with that bundled isomorphism. The raw
power series and the formal-group isomorphism are linked by this target.
Prove the polynomial obstruction lemma used in the degree-by-degree
construction. A normalized homogeneous symmetric additive 2-cocycle of
degree n≥2 with zero diagonal is an R-multiple of
(X+Y)^n−X^n−Y^n for n not a power of two, and is zero when n is a
power of two. In the latter degree include the divided-binomial integral
cocycle reduced mod 2 and prove its nonzero diagonal excludes it here.
Derive this from the preceding any-ring cocycle lemma and binary binomial
identities: d_n is odd except at powers of two, and C_(2^k)(X,X)
has odd integral coefficient. Thus it applies to every R with 2=0; no coefficient field or
division by two is assumed. Apply the lemma to the first nonvanishing
homogeneous error g(F)−g(X)−g(Y), prove all compatible truncations and
pass to actual formal power series by coefficient completeness.
For arbitrary h∈R[[X]] prove h(X+Y)=h(X)+h(Y) precisely when
h=Σ_(j≥0) b_j X^(2^j), including zero constant term; strict additive
automorphisms have b₀=1. Use this to prove the logarithm normalization
and its uniqueness, and describe all other strict coordinates by composing
with those additive automorphisms. For the degree-one real-orientation
coordinate give the graded version with a_i in homological degree i,
and its coefficient-wise base-change laws. This algebraic lane
precedes F2's universal characteristic-two ring comparison.

Define the p-series and height over characteristic-p fields, including height
∞ for the additive group. Prove base extension invariance, the p-power form
of its first nonzero term and coordinate independence of height. Prove the
classification over separably closed characteristic-p fields: two
one-dimensional commutative formal groups are isomorphic precisely when
heights agree, including the infinite-height additive class. This supplies
ModularCurves' height-classification application. EllipticCurves Layer1 owns
the elliptic logarithm/exponential instances; it consumes this generic API.

## F2. Complex orientations and Quillen's theorem

Consume G4's chosen complex orientation and finite projective-bundle theorem.
Own the two-variable comparison: iterated finite CP^m×CP^n projective-bundle
isomorphisms, the surjective truncation restriction system, vanishing lim¹
and the skeletal Milnor comparison give E*(CP∞×CP∞)=E*[[x,y]], with
its degreewise completion and products. Use the even commutative coefficient
ring π_(2*)E for the native formal group; odd coefficients remain modules
over it. This comparison precedes the tensor-product definition. Prove that tensoring the two universal lines defines a
commutative native formal group F_E, with the orientation normalization,
inverse dual-line formula and base-change laws. Compare two orientations by
their strict coordinate change. Include K-theory's multiplicative law with its Bott grading: for TopK's
u=β=[O(−1)]−1 and the normalized coordinate on L=O(1), set
x_K(L)=u⁻¹([L⁻¹]−1), so its restriction is +1 and
F_K(x,y)=x+y+u xy. Compare u x with native 𝔾ₘ. Pin the Thom/orientation
adapter if another K orientation is used. Ordinary cohomology has the
additive law. For the right-complex restriction of a quaternionic line,
prove roots t and [−1]_F(t), the dual/inverse, tensor and Whitney Euler
laws with both of G4's specified quaternionic orientations:
e^c(γ_H)|CP∞=t[−1]_F(t), the restriction of x_H^E, and
e^std(γ_H)|CP∞=−t[−1]_F(t). The standard class differs from the
complex-induced class by (−1)^r in quaternionic rank r. State the
higher-rank splitting, Whitney and naturality laws separately for these
orientations and use the standard normalization for e_Sp.
Do not impose this normalization on an arbitrary independent E orientation.

Construct the map L→MU_* from MU's orientation and prove it is an
isomorphism. Supply the complete coefficient proof. Consume TB B4.2's
mod-2 Adams tower and, only at odd primes, B4.8's tower and exterior
change-of-rings machinery. Own their MU instances at every prime:
construct H_*(MU;F_p) with its Thom product and Steenrod-dual coaction,
prove the Milnor-primitive annihilation and freeness/change-of-rings
decomposition, including E(Q₀,Q₁,…) at2 with |Q_i|=2^(i+1)−1.
At2 construct the Milnor primitives Q₀=Sq¹ and
Q_(i+1)=[Sq^(2^(i+1)),Q_i], identify their pairing with ξ_(i+1),
prove their exterior sub-Hopf algebra and A's freeness over it, and
construct the mod-2 exterior change-of-rings comparison here. TB's
odd-prime exterior comparison is not a supplier for this mod-2 construction.
At odd p use |Q_i|=2p^i−1 and prove the corresponding MU decomposition,
rather than substituting TB's MSO computation. Prove the MU Adams
spectral-sequence differentials/extensions and integral arithmetic reconstruction to
prove evenness and torsion-freeness, characteristic-number detection, integral
generators with Newton-number divisibility, and the comparison between their
formal-group coefficients and Lazard's generators. Use TangentialBordism's
geometric MU comparison; no abstract claim that an arbitrary formal group
is MU's coefficient ring substitutes for this proof. Prove MU_* is polynomial
in degrees 2n and identify the coproduct/strict-coordinate interpretation of
MU_*MU≅MU_*[b₁,b₂,…], including grading and left/right units.

For a chosen real orientation use G4's RP∞ projective comparisons to
construct the real-line tensor Euler law F(x,y) in degree1. Own the
two-variable real projective comparison: on RP^m×RP^n identify
E^* with E^*[x,y]/(x^(m+1),y^(n+1)), compatibly with restriction
and both Euler classes. Pass to RP∞×RP∞ through the two finite-stage
towers, proving surjective transition maps, the required lim¹ vanishing
and the completed graded E^*[[x,y]] comparison before defining F. Prove 2·1=0
and F(x,x)=0 from the square-triviality of the universal real line.
Use F1's normalized exponent-two logarithm to construct the universal
graded characteristic2 formal-group ring with
[2]_F=0 and identify it with MO_*, using the geometric/Thom/Adams
coefficient theory owned by TB and Quillen's unoriented operation proof.
Prove the polynomial generators in degrees other than 2^k−1 and the
orientation/change-of-coordinate universal property. This owns the real
formal laws assigned here by TangentialBordism, without duplicating its
geometric coefficient-ring construction.

Specify the category of real-oriented multiplicative cohomology theories:
an object includes its unital homotopy-commutative ring-spectrum model and
chosen multiplicative real Thom orientation, and morphisms are stable
multiplicative natural transformations preserving that orientation. Define
the coefficient functor to graded characteristic-2 rings with normalized
degree-one exponent-two formal laws, with coordinate-preserving graded
ring homomorphisms. Construct the Thom transformation MO→h and prove its
universal property for these chosen multiplicative orientations, retaining
the specified Thom data and its homotopies rather than inferring an E∞
orientation from a homotopy-ring orientation. On the algebraic side prove
the equivalence between commutative graded MO_*-algebras and these normalized
exponent-two formal laws: a law over R determines the unique graded
classifying map MO_*→R, and morphisms commute with that map. Prove the
coefficient functor and Thom transformation induce this algebraic
classification, naturally under orientation-preserving transformations.
For every commutative graded MO_*-algebra R, first define the graded
functor on CW pairs `h_*(X,A)=MO_*(X,A)⊗_(MO_*)R`; the Conner–Floyd
comparison below proves it a multiplicative real-oriented homology theory.
Retain the appropriate cohomological regrading of its coefficient law.
Construct the graded Eilenberg–MacLane ring-spectrum model HR
in G2.4's symmetric spectral model, using G2.7's HF₂ and ordinary-module
spectra. Own the graded Eilenberg–MacLane functor from graded 𝔽₂
modules, viewed as complexes with zero differential, its shifts and
multiplicative lax-monoidal comparison; construct HR's strict ring model
and product from the specified associative graded multiplication on R.
Prove this product is homotopy commutative: maps from HR∧HR into
this graded EM model are detected by mod-2 homology, and μ and μ∘τ
agree there by commutativity of R and the dual Steenrod algebra.
Construct the ring comparison `H_*(HR;𝔽₂)≃A_*⊗_(𝔽₂)R`
and the Künneth comparison for HR∧HR, identifying H_*(μ) with
multiplication on both factors. Consume TB B4.2's commutative dual
Steenrod algebra `A_*=𝔽₂[ξ₁,ξ₂,…]`; the sphere-twist signs
(−1)^(ab) are trivial mod2.
No strict commutative DGA or E∞ structure is inferred. Prove the chosen
HR model semistable and compare its model homotopy groups with G2.6's
true π_* before applying the stable weak-equivalence criterion.
Identify its underlying module with the wedge, and the weakly equivalent
product, of Σ^dH(R_d), for d∈ℤ, and prove its represented homology is
H_*(−;𝔽₂)⊗_(𝔽₂)R. Construct the ordinary real Thom orientation and
its coordinate x_H; for the prescribed law use F1's normalized
exponential to define x_F=f_F(x_H). Build its multiplicative Thom
classes and MO→HR map, identify the coefficient map and law through
HR^*(RP∞)=R[[x_H]]. Construct the natural map h_*(X,A)→HR_*(X,A)
induced by MO→HR; prove it an isomorphism after the Conner–Floyd
comparison below. Prove the 𝔽₂-coefficient universal comparison
and vanishing of phantom maps into this graded EM model, using field
cochains and its product comparison. Prove functoriality under commutative graded
MO_*-algebra maps, with the specified orientation/coordinate retained. The algebraic
category equivalence does not assert that arbitrary ring-spectrum
theories or their stable operations are determined by their coefficient
formal law.


Own a chosen natural Conner–Floyd
MO_*-module comparison
`MO_*(X,A)≃MO_*⊗_(𝔽₂)H_*(X,A;𝔽₂)`, compatible with the actual
relative boundary, suspension, wedge and external-product maps.
Using the preceding graded EM ring/orientation, for R=MO_* and
its own real law, its Thom map MO→H(MO_*) induces the identity on
coefficients by the algebraic classification. Prove it an isomorphism on G2.6 true π_* and hence a stable weak
equivalence and derive the stated natural module/product/boundary
comparison, using TB B4's computed MO coefficients. An additive
splitting alone is not this multiplicative comparison.
Deduce freeness and identify h_* naturally with
`H_*(X,A;𝔽₂)⊗_(𝔽₂)R`. Exactness follows by tensoring over the field,
including the boundary maps; termwise freeness alone is not an exactness
argument. This works for every commutative graded MO_*-algebra R.

Construct the Landweber–Novikov operations from these cooperations, their
composition, Cartan, naturality and Thom/Gysin formulas, and their agreement
with coordinate changes. Supply duality/completion hypotheses for infinite
families; a graded dual is not an unqualified algebraic dual.

## F3. p-typical and Brown–Peterson theories

For each prime p, construct the p-typicalization idempotent on MU_(p),
prove its multiplicative comparison, and split it to obtain BP. Pin
BP_*≅ℤ_(p)[v₁,v₂,…] using specified Hazewinkel generators and prove the
logarithm recursion and conversion to other p-typical coordinates.
Construct BP_*BP≅BP_*[t₁,t₂,…] and the full Hopf-algebroid structure;
identify its strict p-typical coordinate-change functor.

Build BP⟨n⟩ and E(n) for n≥0, with the specified ordered spectral cofibres by v_(n+1),v_(n+2),… and localization at v_n for n≥1. Define E(0)=Hℚ.
Prove the homotopy groups, canonical maps, connective-cover comparisons
and the homotopy-associative products needed for the Hopf rings. Construct
and compare the products on the iterated cofibres, with their actual
p=2 noncommutativity/choice qualifications; no coherent BP-module
category is presumed before an A∞ model is constructed. Do not
assert an E∞ structure on BP or every BP⟨n⟩. Include BP⟨0⟩≃Hℤ_(p), and ku_(2)≃BP⟨1⟩. Construct Morava
K(n) for n≥1 from the specified p,v_i (i≠n) cofibres and v_n
localization, with coefficients F_p[v_n,v_n⁻¹], exact sequence and
homology/detection APIs; its homotopy product is not asserted E∞.
For odd p, construct the Adams summand BP⟨1⟩ comparison with connective
complex K-theory and the p−1 summands
ku_(p)≃∏_(i=0)^(p−2) Σ^(2i)BP⟨1⟩. Prove Bott's cyclic action between
the factors, including v₁ on the last return. Include the i=0 summand.
Construct ko_(p)≃⋁_(i=0)^((p−3)/2)Σ^(4i)BP⟨1⟩ for odd p by
real/complex K comparison and conjugation, preserving its Bott action
and actual connective-cover maps. String supplies the resulting BO⟨4k⟩
space splitting.

Construct the designated Ω-spectrum spaces BP⟨n⟩_k, their multiplication,
additive infinite-loop structure, suspension, coefficient elements and
homology orientations. Prove Wilson's torsion-free polynomial-space results
in their exact degree/range hypotheses. For BP⟨1⟩ and odd p, develop the
BP-homology Hopf ring with its star/circle products, units, coproducts,
distributivity and the b_(i), [v₁^j] elements. For positive even m<2p+2 prove
H_*(BP⟨1⟩_m;ℤ_(p)) is torsion-free and polynomial in even degrees;
for positive even m<2p prove the BP-homology polynomial generators occur
in positive even degrees congruent to m modulo 2p−2. Give the polynomial
presentations below space degree 2p and the generators/relations in degree
2p+2, including the [v₁] map and augmentation-ideal filtrations needed by
StringOrientation. Prove the AHSS collapse and extension identifications;
cellular ranks alone do not determine the ring. Within F4 construct the
BP-homology AHSS first from G's filtration, using only the F3 spectrum/
orientation construction; its collapse/presentation then completes this
F3 space-homology sublane before the F4 Adams–Novikov application.

## F4. Comodules and Adams–Novikov comparisons

Consume HomotopySpheres Stage3C's three-fold Toda brackets on pointed
spaces, with chosen adjacent-composite nullhomotopies and their two
composition-subgroup indeterminacy. Construct their passage through
suspension and G's sphere-spectrum comparison to stable spectral Toda
brackets, preserving composition, signs and indeterminacy. Construct
three-fold Toda brackets for composable maps of spectra and of right
modules over a supplied G2.4 strict associative ring spectrum R,
including its chosen strict commutative models. Consume G2.4's transferred
module model structure and construct its triangulated stable homotopy
category here, with suspension, cofiber triangles, hom groups [ΣX,V]_R,
exactness and the comparison to the underlying stable spectral category.
Build the brackets from their chosen cofiber triangles and nullhomotopies. The module version
requires this coherent structure; a homotopy-ring multiplication alone does
not supply it. Pin degrees, suspension signs, naturality under exact
functors, and module indeterminacy
`f∘[ΣX,V]_R+[ΣY,W]_R∘Σh` for a composable triple X→Y→V→W
(with f the final and h the first map). For the right regular R-module
identify left-multiplication maps with π_*R and state
`⟨a,b,c⟩⊆π_(|a|+|b|+|c|+1)R`, with indeterminacy
`a·π_(|b|+|c|+1)R+π_(|a|+|b|+1)R·c`, retaining the chosen
graded suspension/composition convention. The sphere case R=S gives
ordinary stable brackets.

Construct higher Toda operations for every finite arity r≥3 in these
same enriched stable spectral and right-module models, and in supplied
stable symmetric monoidal models with the corresponding derived mapping
spaces. Construct the operations before passage to the triangulated
homotopy category. For X_r→⋯→X_0 use coherent
iterated-cofiber defining systems with value in [Σ^(r−2)X_r,X_0],
comparing with Carrick–Davies–van Nigtevecht Definitions3.3/3.7 on Picard
objects. Extend their Picard-object construction to the general objects
specified here and determine the suspension signs from the chosen model;
the reference leaves these only up to units. Compare the r=3 normalization
with the convention above. The displayed ring
entries a₁,…,a_r run from the final map to the first map, matching
left-to-right multiplication. Construct the cubical comparison and
specify all maps, adjacent
nullhomotopies and their higher compatibility homotopies on proper
subintervals, with the final obstruction map as the value. Define the
bracket as the set of values of such systems; adjacent products vanishing
alone is not a defining system. Construct restriction, extension and
change-of-system maps, their obstruction criteria, equivalence invariance
and comparison of the cofiber and cubical definitions. For homogeneous
ring classes pin the value degree Σ_i|a_i|+r−2, and recover exactly the
preceding triple convention at r=3. Describe the full change-of-system
indeterminacy; higher brackets need not be cosets of the triple's two
composition subgroups. Prove suspension, naturality under derived exact
functors and extension of scalars, and the composition/shuffling inclusions
with their compatible defining-system hypotheses. On dualizable objects
construct reversal through duality and its suspension/sign comparisons;
specialize to Picard-graded E₂-ring classes. Construct nested-system
substitution and the resulting bracket-of-brackets juggling inclusions,
tracking the inner choices, proper-subinterval vanishing hypotheses and
full outer indeterminacy. Include the forms in Bauer Lemma8.6 and
Corollary8.7 as applications in EllipticCohomology, not additional generic
definitions. A ring map carries a
chosen system and its value to the image system and value; lifting a
bracket requires lifting its coherent system, not just its entries.

Consume DGAInfinity Layer8’s matric/higher Massey defining systems over
the coefficient rings in use. Its field-dependent transferred-operation
comparison is not used for integral or p-local MU/BP cobars. Own the
specialization of its Massey definitions to the normalized
multiplicative MU/BP cobar complexes, with the cohomological/internal-degree
and Koszul-sign dictionary and full variation under changes of
representatives. This is the cobar/filtration comparison, with a single
generic Massey-product owner. Construct the following distinct comparisons.

1. For every arity, start with a chosen coherent defining system in the
   filtered model: the actual lifts of its entries, a filtered form of
   C(a₂,…,a_(r−1)), and the extension and coextension maps. Exact realization
   carries its total value into the corresponding classical Toda bracket.
   For a central τ with E₂ quotient maps, reduction to R/τ^k carries this
   same system to its reduced Toda system. Construct the normalized-cobar
   associated-graded comparison on the proper faces and total obstruction;
   when these faces define a Massey system on a specified spectral-sequence
   page, its value is the image of this chosen system. Prove filtration,
   sign, indeterminacy and tower-map naturality. This assertion begins with
   a filtered defining system; it does not reconstruct one from arbitrary
   higher Massey membership.
2. Prove the threefold synthetic Moss theorem with explicit hypotheses:
   R is an E₂-ring, a₁,a₂,a₃ are actual bigraded classes, and r≥s≥0 are
   minimal with τ^r a₁a₂=τ^s a₂a₃=0. For r,s>0 construct H₀,H₁ with
   total differentials d_(r+1)H₀=a₁a₂ and d_(s+1)H₁=a₂a₃, and a value
   of ⟨a₁,τ^r a₂,a₃⟩ lifting τ^(r−s)a₁H₁±H₀a₃ modulo τ^s. For
   r>0=s construct H₀ modulo τ^r and a bracket value lifting H₀a₃.
   Pin the sign by the preceding cone convention and compare reduction
   modulo τ with the corresponding threefold page-Massey product.
   Include r=s=0 as the ordinary defined triple case. For classes initially
   given only after τ-inversion, obtaining lifts with these annihilation
   identities is an additional construction, not a consequence of page
   membership. Compare this theorem with the Adams–Novikov tower through
   its actual filtered realization.
3. EllipticCohomology E4/E5 constructs the proper faces, extension maps and
   total obstruction cell by cell for each of its higher applications,
   and computes the corresponding detection and full indeterminacy.
[Carrick–Davies–van Nigtevecht §3](https://arxiv.org/abs/2412.01640v2)
supplies the chosen higher-cone/naturality/shuffling convention; its
displayed Moss theorem3.16 is threefold. Lemma3.9 and Propositions3.14–15
give the forward exact-functor and truncation comparisons; they do not
assert a Massey-to-Toda converse for arbitrary arity.

Develop graded comodules over the flat MU and BP Hopf algebroids, cofree
comodules, the normalized cobar complex, Ext, change of rings and base
change. Construct their graded tensor category and internal Hom, and prove
that dualizable comodules are exactly those with finitely generated
projective underlying graded module. Build their evaluation/coevaluation,
dual coaction and tensor-Hom comparisons. Prove the Adams generation
hypotheses used in ELL's separately constructed Hovey stable model; this
comodule API does not itself identify that model with an ordinary derived
category. Construct the actual MU/BP resolution of a spectrum by iterated
unit/cofiber maps, its exact couple and Adams–Novikov spectral sequence.
For the BP version, prove E₂^(s,t)=Ext_(BP_*BP)^(s,t)(BP_*,BP_*X)
using BP_*BP's proved flatness and the comodule cobar comparison,
with the completion/convergence hypotheses below; do not add an
unnecessary flatness hypothesis on BP_*X.

Construct the filtration on the appropriate completion of π_(t−s)X,
edge/Hurewicz maps, multiplicative and naturality laws, lim¹ obstruction,
and conditional/strong-convergence criteria. Prove convergence to X_(p) for bounded-below X in the BP-based
p-local Adams tower: the augmentation fibre of S_(p)→BP is
positive-connective, so its iterated smash powers with X have connectivity
tending to infinity. Prove the resulting tower limit and strong
convergence criteria rather than merely labelling it a completion.
Construct the BP/p-based nilpotent tower separately and identify its
limit with derived p-completion for bounded-below finite-type X,
using G3's derived completion and Milnor exact sequence. For spectra
outside those hypotheses retain the actual nilpotent tower limit and
its conditional-convergence statement. Ordinary p-localization and
p-completion are distinct. Build the AHSS for
BP-homology from G's cellular filtration and prove its corresponding
convergence and extension criteria. Supply the free/even/comodule comparisons
used in the String Hovey calculation. TangentialBordism's mod-p Adams tower
remains its own construction and is not duplicated here.

## F5. Exact functors, deformations and elliptic inputs

Prove the invariant-prime-ideal classification I_n=(p,v₁,…,v_(n−1))
and the Landweber filtration theorem for finitely presented comodules,
with the descent/filtered-colimit extension to the exactness category.
Use these in the proof of Landweber's exact functor theorem for graded MU_* modules: for every
prime p, multiplication by p and successive v_i is injective on the
successive quotient modules. Show the induced tensor functor is exact on
the relevant comodules, then prove that MU_*(−)⊗_(MU_*)M is a homology
theory on CW pairs. Supply represented spectra through G's representation
theorem, their comparison maps and products when M is a graded algebra.
Distinguish this multiplicative represented theory from a specified
commutative spectral-ring realization. Prove the coordinate-independent
criterion and the height-stratum flatness formulation used for elliptic
curves, including the vanishing-quotient cases.

Develop finite-height formal-group deformations over complete local rings:
the universal Lubin–Tate deformation ring W(k)[[u₁,…,u_(h−1)]] for a
specified height-h formal group over a perfect field k, its universal
property, coordinate changes and automorphism action. Construct the
complete-local deformation prerequisites, using Mathlib's `WittVector`
carrier and its existing ring/Frobenius/Verschiebung APIs, including representability, inverse-limit and base-change proofs.
These algebraic targets supply EllipticCohomology's spectral realization
and Serre–Tate comparison; the Goerss–Hopkins–Miller E∞ realization is owned
there. Include height1 multiplicative and height2 elliptic examples.

## F6. Chromatic localization and fracture

Using G's spectral model and F3's actual E(n)/K(n) spectra, construct
Bousfield localization L_E for a supplied spectrum E: E-equivalences,
E-local objects, the universal map X→L_E X, functoriality, idempotence,
exactness and the derived mapping-space adjunction. Compare it with G3's
integer localization and p-completion under their actual hypotheses;
a homotopy class on one unshifted mapping space does not define a spectral
locality condition. Build the localized model/homotopy categories and
smash/function comparisons, stating exactly which localizations are smashing.

Prove the smallness/cardinal bound for testing E-locality and construct
the E-local model by transfinite homotopy pushouts along the bounded
family of E-equivalences, with the lifting and derived universal
properties. This owns existence, not an assumed localization functor.

Build the Devinatz–Hopkins–Smith nilpotence theorem on F2/F4's MU
homology and spectral towers: for a map from a finite spectrum,
MU-homology nilpotence detects smash nilpotence, with the corresponding
ring-element theorem and its hypotheses. Construct type-n finite
p-local spectra, the Adams v₁ self-maps (degree2p−2 for odd p and8
at2 on the Moore spectrum), and Hopkins–Smith periodicity for v_n
self-maps, including eventual uniqueness/commutation and detection in
K(n)-homology. Prove the thick-subcategory classification and construct
large-exponent generalized Moore spectra with their BP-homology and
regular-sequence comparisons. Carry those exponent conditions explicitly.
Use them to prove the K(m)/K(n) acyclicity needed by fracture for m<n.

For finite group actions on G's spectra construct homotopy orbits,
homotopy fixed points, the transfer/norm and the Tate cofiber, with
restriction, induction and multiplicative naturality. Prove the
Greenlees–Sadofsky/Kuhn theorem: for K(n)-local E and finite G,
E^{tG} is K(n)-acyclic, hence the norm E_(hG)→E^(hG) is a
K(n)-local equivalence. Build the transfer/chromatic proof and its
homology comparison; do not infer integral Tate vanishing.
Elliptic E2 consumes this finite-action API for its continuous towers.

For each prime p and n≥1, set L_n=L_(E(n)) and construct the natural
homotopy-cartesian chromatic fracture square with vertices L_n X,
L_(K(n)) X, L_(n−1)X and L_(n−1)L_(K(n))X; L_0 is rationalization.
Prove its mapping, homotopy-group, product and module comparisons.
For complex-oriented even MU-algebra models, prove
`L_(K(n))E≃holim_I v_n⁻¹E/(p^(i₀),…,v_(n−1)^(i_(n−1)))`,
using the constructed large-exponent Moore spectra, finite duality and
actual quotient products; identify coefficient completions only under
regularity/Milnor-limit hypotheses. For a fixed prime p and a Landweber-exact
p-local coefficient module M with M/I_(n+1)=0 prove the represented theory is E(n)-local,
and construct its p-completion Hasse square under the stated finiteness
and completion hypotheses. EllipticCohomology E2 supplies the height≤2
elliptic instance. Include the K(1)/K(2) comparisons and the arithmetic square for
all spectra using derived p-completion, with vertices X, ∏_p X_p^∧,
X_ℚ and (∏_p X_p^∧)_ℚ, proving its homotopy-cartesian comparison
and retaining rationalization outside the product until a separate
commutation theorem is proved. These are the inputs consumed by
EllipticCohomology, and convergence conditions for assembling them.
Morava E∞ realizations, completed stabilizer cooperations and θ-algebra
obstruction theory are Elliptic E2 targets; this layer supplies their
local categories and fracture functors, not an unexplained realization.

## Order and references

F1 precedes F2. F2 consumes TB B4's mod-p Adams/coefficient tools plus
G's MU model and supplies F3's spectra/cooperations. F4's initial AHSS
uses these construction targets; the F3 space-homology presentation then
precedes F4's Adams–Novikov/comodule applications. G3 owns integer
spectral localization, derived p-completion and π-holim/Milnor, with its
actual ring/module and convergence comparisons; consume it before MU_(p)
and keep F4's BP-nilpotent completion and its identification as new targets.
F6 constructs nilpotence using F3's spectra, F4's towers/completion,
F5's exactness and G's model/localization
infrastructure. F5 exactness uses F1–F4, while its algebraic
deformation lane begins with F1 independently of the spectral realization.
The String coefficient calculation and elliptic spectrum construction consume
these layers; neither is an input to Lazard, Quillen or BP construction.

- Quillen, [*Elementary proofs of some results of cobordism theory using Steenrod operations*](https://people.math.rochester.edu/faculty/doug/otherpapers/QuillenElem.pdf).
- Adams, *Stable Homotopy and Generalised Homology*, for orientations and cooperations.
- Ravenel, [*Complex Cobordism and Stable Homotopy Groups of Spheres*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mybooks/ravenel3rd.pdf), for p-typical cooperations and Adams–Novikov constructions.
- Landweber–Ravenel–Stong, [*Periodic cohomology theories defined by elliptic curves*](https://people.math.rochester.edu/faculty/doug/mypapers/lrs.pdf), for exactness and elliptic examples.
- Wilson, *The Ω-spectrum for Brown–Peterson cohomology II*, and Hovey, [*The homotopy of MString and MU⟨6⟩ at large primes*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Hovey-bpbp1.pdf), for the Hopf-ring interfaces.
- Lubin–Tate, *Formal moduli for one-parameter formal Lie groups*, for the algebraic deformation theorem.

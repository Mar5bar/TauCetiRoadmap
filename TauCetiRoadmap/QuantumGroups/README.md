# Compact quantum groups and Tannaka–Krein reconstruction

Build compact quantum groups from their C*-algebras and from their unitary
representation categories. Develop Haar integration, arbitrary-Hilbert-space
corepresentations, the dense Hopf *-algebra, weighted Peter–Weyl theory and
universal/reduced completions before reconstruction. Work out the deformation
SUq(2) and free orthogonal quantum groups, including their tensor categories,
dimensions, Haar laws and the full/reduced distinction.

## Scope, conventions and suppliers

Algebras and Hilbert spaces are complex. Compact quantum groups have a nonzero
unital C*-algebra A and a unital star homomorphism
`Δ:A→A⊗_min A`. Neither A nor the representation Hilbert space is assumed
separable. Finite-dimensional coefficient matrices use orthonormal bases and
column vectors: `δ(e_j)=Σ_i e_i⊗u_ij` and
`Δ(u_ij)=Σ_k u_ik⊗u_kj`. Matrix star is conjugate transpose;
`bar u=(u_ij*)` is entrywise star, and is a different operation.
Pin tensor corepresentations to `U_13 V_23`, with entries
`(u⊠v)_((i,k),(j,l))=u_ij v_kl`, as in Tau Ceti's native
`Comodule.TensorProduct`; thus `χ_(u⊠v)=χ_u χ_v`.
Algebraic tensors use Mathlib `TensorProduct` over ℂ; analytic tensors use the
minimal C*-tensor product. Insert associators and unit identifications in leg
notation. Scalar products are conjugate-linear in the first variable.

A morphism `(A,Δ_A)→(B,Δ_B)` is a unital star homomorphism f with
`Δ_B f=(f⊗f)Δ_A`. This is the direction of the function-algebra map; the
corresponding compact-group arrow has the reverse direction. Fiber functors
are faithful complex-linear dagger strong monoidal functors to finite Hilbert
spaces, with unitary tensor and unit constraints. Quantum dimension means the
intrinsic C*-tensor-category dimension, and Hilbert dimension means the rank of
the underlying vector space. These can differ.

| Supplier | Interface consumed here |
| --- | --- |
| [CStarAlgebras C1–C5](../CStarAlgebras/README.md) | Positive functionals/GNS through V0, matrix norms, minimal tensors, star-map extension, slice maps and CP positivity. Q5 owns the bounded universal presentations used here. |
| [VonNeumannAlgebras V0–V4](../VonNeumannAlgebras/README.md) | State-space weak-* compactness, Hilbert GNS representations, operator closures and preduals; V10–V11 for the Haar modular comparison. |
| [HilbertModules H1–H3](../HilbertModules/README.md) | Free modules H⊗A, adjointable/compact operators, multiplier realization and interior tensor identifications. |
| [CategoricalOperatorAlgebras CA1a,CA2](../CategoricalOperatorAlgebras/README.md) | Finite Hilbert dagger category, unitary rigid tensor categories, chosen conjugates, standard solutions and intrinsic dimension. Reconstruction here supplies the quantum-group realization. |
| [TemperleyLiebOperatorAlgebras A2–A4](../TemperleyLiebOperatorAlgebras/README.md) | Hermitian TL forms and positive C*-quotients, native diagram trace comparison. TemperleyLieb Layers 0–7 ([PR #58](https://github.com/TauCetiProject/TauCetiRoadmap/pull/58)) supplies the algebraic diagram/Jones–Wenzl targets for Q7. |
| [RepresentationTheory/CompactGroups](../RepresentationTheory/CompactGroups/README.md) | Classical Peter–Weyl, compact Haar integration and the SU(2) representation calculation used for comparisons. |
| [OperatorAlgebraDynamics D1–D2](../OperatorAlgebraDynamics/README.md) | Full/reduced discrete-group C*-algebras and their canonical quotient/expectation. |
| [FreeProbability F1,F3,F6](../FreeProbability/README.md) | Scalar moments, the free-group adjacency norm/full–reduced counterexample and the standard semicircular law; Q7 supplies the quantum-group character realization. |
| [AmenableGroups, Layers 1,7 (PR #821)](https://github.com/TauCetiProject/TauCetiRoadmap/pull/821) | Invariant means, Følner/Reiter criteria and group amenability; Q4 constructs the reduced-counit comparison. Adopt its interfaces and build missing prerequisites without waiting for a merge. |

Use native `Coalgebra`, `Bialgebra`, `HopfAlgebra`, `Coalgebra.counit` and
`HopfAlgebra.antipode`. Tau Ceti's `Algebra.Coalgebra.Comodule` already provides
comodules, comodule homomorphisms, categories, corestriction, duals and finite
matrix coefficients. Consume its `Subcomodule`, `IsCompletelyReducible`,
`fixedSubcomodule`, `Finite/Monoidal`, `Finite/Rigid` and
`Comodule.convolutionAction` interfaces for subobjects, duality and convolution.
Use Mathlib `WithConv` for convolution notation.
In particular consume `coefficientMatrix`, its counit,
comultiplication and inverse-antipode equations, and `matrixComodule` with its
coefficient reconstruction. Add Hilbert/star/unitary structure to these APIs;
do not replace the algebraic coaction with a private matrix-corepresentation
carrier. The analytic free-module coaction is compared with that algebraic API
on the coefficient core.

This roadmap concerns compact symmetry. General locally compact quantum
groups, unbounded Haar weights on those groups and general multiplicative-unitary
reconstruction are outside its scope. Q4 constructs the particular regular
multiplicative unitary needed for compact reduced completion. Quantum-group
actions on general C*-algebras and their crossed products are not targets here.

## Q1. C*-bialgebras, cancellation and Haar integration

Construct coassociative unital C*-bialgebras and their morphisms using the
native star homomorphisms and the C5 minimal tensor functor. Develop tensor
leg maps, their associativity/naturality, positive slice maps and compatibility
with Δ. A compact quantum group satisfies both cancellation conditions:

- The linear span of `Δ(A)(1⊗A)` is norm dense in A⊗_min A.
- The linear span of `Δ(A)(A⊗1)` is norm dense in A⊗_min A.

Develop equivalent cancellation-span formulations and transport by isomorphism,
opposite/co-opposite structures and tensor products. Cancellation is a density
condition on linear spans, not a pointwise surjectivity assertion. Give a
coassociative unital bialgebra failing cancellation, functions on
a finite monoid with an absorbing element that is not a group.

Define convolution of bounded functionals by `φ*ψ=(φ⊗ψ)Δ`. Prove boundedness,
associativity, positivity, preservation of states and separate weak-*
continuity. Define left invariance by `(id⊗h)Δ(a)=h(a)1` and right
invariance by `(h⊗id)Δ(a)=h(a)1`. Prove existence of a state h satisfying
both and uniqueness among even one-sided invariant states, without a
separability assumption. Build the proof's reusable pieces: Cesàro means of
convolution powers of a state, weak-* cluster points fixed by that state, and
the domination lemma saying `ω≤ρ` and `h*ρ=ρ*h=h` imply
`h*ω=ω*h=ω(1)h`. Prove the finite-intersection argument for all positive
functionals using both cancellation conditions. Supply the slice testing and
positive-functional separation that turn these equations into invariance.

Call h the Haar state. Construct its GNS Hilbert space, representation,
coefficient maps and null ideal. A compact quantum group is reduced when its
Haar state is faithful. Prove the tensor-product Haar formula and the
isomorphism transport law; do not assert Haar pullback along every morphism.
For C(G) recover ordinary compact-group Haar integration. For a discrete
group Γ construct `Δ(u_g)=u_g⊗u_g` on its full group C*-algebra by
the universal unitary-representation property. On the reduced algebra
construct the Fell-absorption unitary
`W(δ_g⊗δ_h)=δ_g⊗δ_(gh)` and prove
`W(λ_s⊗1)W*=λ_s⊗λ_s`; this supplies the reduced-norm extension
of Δ. Prove coassociativity and both cancellation conditions using
the dense span of group unitaries. Identify both Haar states with
coefficient at the identity. Q4 proves the concrete nonfaithful full-group-algebra example
after the reduced-counit comparison has been established.

## Q2. Unitary corepresentations and Peter–Weyl theory

For arbitrary Hilbert H define a unitary corepresentation as a coaction
`δ:H→H⊗A` on the free right Hilbert A-module satisfying
`⟨δξ,δη⟩=⟨ξ,η⟩1`, `[δ(H)A]=H⊗A`, and coassociativity.
Construct the equivalent unitary operator `U∈L_A(H⊗A)` with
`δξ=U(ξ⊗1)` and `(id⊗Δ)U=U_12 U_13`. Build the multiplier and
leg extensions on `H⊗A⊗A` needed to state this equation even when H is
infinite-dimensional. A general corepresentation operator is *invertible*
and satisfies the same equation; arbitrary noninvertible solutions are not
included in its unitarization theorem.
Construct the strictly continuous extension of positive slice maps from
`K(H)⊗_min A` to `M(K(H)⊗_min A)=L_A(H⊗A)` and its tensor-leg
and order laws; these are the slice maps used by Haar averaging below.

Intertwiners are bounded linear T with `(T⊗1)U=V(T⊗1)`.
Develop identities, composition, dagger for unitary objects, norm-closed
intertwiner spaces, invariant closed subspaces and projections, kernels,
closures of ranges, polar intertwiners and orthogonal complements. Construct
finite sums, arbitrary Hilbert sums, tensor products and their associators;
prove unitary change-of-basis formulas. For finite Hilbert H express analytic unitarity by its
coefficient matrix in an orthonormal basis, and prove independence of
that basis by unitary conjugation. Construct the coefficient-matrix description and the
finite Hilbert forgetful functor, proving it faithful, complex-linear and
dagger strong monoidal. Q3 compares it with native comodules after the
Hopf core has been constructed.

Prove every invertible corepresentation operator similar to a unitary one by
Haar averaging `T=(id⊗h)(U*U)` and its positive invertibility; derive the
identity `U*(T⊗1)U=T⊗1` and unitarize by
`(T^(1/2)⊗1)U(T^(-1/2)⊗1)`. Prove every nonzero
unitary corepresentation has a nonzero finite-dimensional invariant subspace.
Construct Haar averages of compact-operator compressions, their invariant
compact C*-algebra and a nonzero finite-rank spectral projection. Deduce
irreducibles finite-dimensional and, using a maximal orthogonal family,
every unitary corepresentation an arbitrary Hilbert direct sum of finite
irreducibles. State and prove Schur's lemma, uniqueness of multiplicities
and the unitary comparison of decompositions. No countable-sum restriction
is introduced.

Construct the regular corepresentation by
`δ_h(Λ_h(a))=(Λ_h⊗id)Δ(a)`, proving its isometry by right Haar
invariance and its dense module range by cancellation. Prove the
closed linear span of its slices is A and every finite irreducible occurs
in it. Give explicit coefficient projections and finite coefficient
approximants. This is density of the span of coefficients; it does not say
every element of A is one coefficient of one finite irreducible.

## Q3. The Hopf *-core, orthogonality and modular data

For each finite irreducible unitary u construct the conjugate matrix
bar u and prove its algebraic coaction irreducible by conjugating
invariant subspaces. For each row i construct the coefficient intertwiner
`e_j↦Λ_h(u_ij*)` into the regular corepresentation. It is nonzero
because `Σ_j h(u_ij u_ij*)=1`; invariance of its kernel and
irreducibility make it injective. Its finite-dimensional invariant image
gives the unitary regular restriction, and thereby invertibility of
bar u. Using Haar invariance and Schur's lemma,
construct the positive invertible unitarizing matrix F̃, normalized by
`Tr F̃=Tr F̃⁻¹`, with `bar u* F̃ bar u=F̃`. Prove this determines
F̃ uniquely. This construction precedes the antipode. Derive both
orthogonality formulas directly from these finite Haar forms:

`h(u_ij* u_kl)=δ_jl (F̃⁻¹)_ik/Tr(F̃⁻¹)`,

`h(u_ij u_kl*)=δ_ik F̃_jl/Tr(F̃)`.

Coefficients of inequivalent irreducibles are orthogonal in both forms.
Prove coefficient linear independence and the algebraic Peter–Weyl direct
sum. Now let Pol(G) be their linear span; prove it a dense unital
*-subalgebra, with Δ in its algebraic tensor square. Construct the native
coalgebra/bialgebra/Hopf structure with `ε(u_ij)=δ_ij` and
`S(u_ij)=u_ji*`, using the just-proved independence for well-definedness.
A Hopf *-algebra means a native complex Hopf algebra with compatible
star algebra structure and star-preserving Δ. Prove ε star-preserving,
S bijective and `S⁻¹(a)=S(a*)*` from these axioms; consume Mathlib's
`HopfAlgebra.antipode_mul_antidistrib` for `S(ab)=S(b)S(a)`.
Prove products, sums and basis-change compatibility, morphisms preserving
cores and the unitary finite-comodule comparison with Q2. The native
algebraic dual has coefficient matrix bar u in the dual basis; construct
its Hilbert structure using F̃.
Only now construct `F∈Hom(u,S²u)`, normalized positive with
`Tr F=Tr F⁻¹`, and prove `F̃=Fᵗ` as a theorem.
Complete the weighted coefficient spaces in L²(h), with norm squared
`Σ_(α,i,j,k) conjugate(c_ij^α)(F̃_α⁻¹)_ik c_kj^α/Tr(F̃_α⁻¹)`
for a coefficient sum Σ c_ij^α u_ij^α. Identify the regular
representation multiplicities and this Plancherel formula.
Construct duals and fusion multiplicities with their finite decomposition
and Frobenius reciprocity laws. Prove the intrinsic dimension
`d(u)=Tr F=Tr F⁻¹`, its additivity/multiplicativity, `d(u)≥dim_H(u)`
and equality precisely when the normalized F is the identity. Prove the
corresponding Kac equivalences: Haar traciality, S²=id on Pol(G), and
all these F matrices equal to one. In that case recover ordinary
dimension-normalized orthogonality and an involutive antipode on
the Hopf core. Q4 constructs its bounded extensions to A_u
and A_r.

Build algebraic convolution with functionals, pinning
`φ*a=(id⊗φ)Δ(a)` and `a*φ=(φ⊗id)Δ(a)`, and construct Woronowicz
characters `f_z(u_ij)=(F^z)_ij`, with complex powers of the positive F.
Prove basis independence, multiplicativity, `f_0=ε`,
`f_z*f_w=f_(z+w)`, `f_z∘S=f_(-z)` and
`f_z(a*)=conjugate(f_(-conjugate z)(a))`.
Derive `S²(a)=f_(-1)*a*f_1` and
`h(ab)=h(b(f_1*a*f_1))`, with convolution actions explicitly defined.
Construct `σ_t(a)=f_(it)*a*f_(it)` and
`τ_t(a)=f_(-it)*a*f_(it)`, their group laws and norm-continuous
actions on the core. Prove `S²=τ_(-i)` and the KMS crosswalk
`h(ab)=h(b σ_(-i)(a))` for analytic core elements.
Prove the core is a dense Tomita algebra in Haar GNS, construct its
commuting right action, and prove the GNS vector separating for the
left von Neumann closure. Thus the vector Haar state is faithful normal
there. Extend its modular group using V10–V11; derive its action from the KMS boundary equation rather
than treating all f_z as bounded states on a completion.

## Q4. Algebraic compact type and the two completions

Develop Hopf *-algebras of compact type over ℂ on the native Hopf API.
Prove the equivalence between a normalized positive Haar integral, all
finite comodules unitarizable, spanning by finite unitary coefficients,
and a basis of coefficients of pairwise inequivalent unitary irreducibles.
An algebraic finite unitary comodule is a native finite-dimensional
comodule with a Hilbert inner product whose coefficient matrix in an
orthonormal basis is unitary; prove independence of that basis.
In the positive-integral direction first prove algebraic faithfulness of
a nonzero invariant integral on the Hopf *-algebra: neither h(a·) nor
h(·a) vanishes identically for nonzero a. Under positivity use
Cauchy–Schwarz to deduce `h(a*a)>0`. For an initial finite Hilbert product
use the averaged form `⟨v,w⟩_h=h(⟨δv,δw⟩_A)`.
The counit makes δ injective, so its orthonormal coefficient expansion
gives a sum `Σ_i h(a_i*a_i)>0` for v≠0. Prove Haar invariance of
this form and algebraic unitarization; no C*-order lower bound
is assumed before completion. Develop Q3's conjugate/orthogonality API
algebraically. In the coefficient direction first prove independence of
simple coefficient coalgebras and the spanning-to-direct-sum decomposition.
Then define the invariant functional which is one on the trivial
coefficient and zero on the other irreducible blocks, and prove that
the conjugate of each finite unitary comodule is equivalent to a member
of the unitary family. Construct positive F̃ from that unitary comparison,
then derive orthogonality from invariance/Schur theory algebraically;
these steps do not assume an analytic positive Haar state. Use these matrices
and the displayed orthogonality forms to prove `h(a*a)>0` for a≠0.
This positivity is a theorem needed for completion and reconstruction;
coefficient spanning alone is not defined to mean existence of a positive
state. Prove the algebraic cancellation maps and their antipode inverses.

Construct the universal C*-norm as the supremum over star representations.
Prove finiteness on every coefficient sum using unitary entries, and
nondegeneracy using the faithful algebraic Haar GNS representation.
Construct A_u and its universal extension property, extended Δ and ε,
and prove both cancellation conditions. For Kac cores construct the bounded involutive antipode on A_u.
Construct A_r by the Haar GNS
representation, prove the core embeds faithfully and h_r is faithful,
and extend Δ with its cancellation conditions, and in the Kac case
extend its bounded involutive antipode. Compare the GNS
regular corepresentation with Q2's regular object on the original
completion. Build the regular unitary
on `L²(h)⊗L²(h)` from

`U(Λ(a)⊗Λ(b))=(Λ⊗Λ)(Δ(a)(1⊗b))`.

Prove this formula preserves inner products by right Haar invariance,
is onto by algebraic cancellation, satisfies the pentagon
`U_12 U_13 U_23=U_23 U_12`, and implements
`Δ_r(λ(a))=U(λ(a)⊗1)U*`. Prove the resulting tensor-norm estimates
and extension to A_r. These are statements for this regular construction.

Construct the canonical quotient A_u→A_r and, for every C*-completion
of this compact-type core with its quantum-group structure, the compatible
maps from the universal completion and to the reduced completion. Compare
all their finite unitary representation categories and dense cores.
A_u has bounded counit; A_r need not. The algebraic antipode need not
be bounded even on A_u. Prove extension/transport with the stated norm
bounds `‖f(a)‖_target≤C‖a‖_source` on the core, including
the contractive star-map case; an arbitrary Hopf *-map need not extend
between reduced norms.

Define coamenability as the universal-to-reduced quotient being an
isomorphism. Prove its isomorphism invariance and the bounded reduced
counit consequence. For group algebras prove coamenability equivalent to
amenability of Γ, including the reduced-counit criterion and the
nonamenable free-group counterexample. Identify `A_u(ℂΓ)=C*(Γ)` and
`A_r(ℂΓ)=C*_r(Γ)` compatibly with Q1's coproducts and canonical
quotient. Consume F3's Cayley-tree norm
calculation `‖λ(s)+λ(s)⁻¹+λ(t)+λ(t)⁻¹‖=2sqrt(3)<4`. The full counit
takes this sum to four, so it cannot extend to the reduced algebra.
Deduce nonamenability, noninjectivity of the full-to-reduced quotient
and the nonfaithful full Haar state. Build the reduced-counit/amenability
comparison via positive regular coefficients, almost invariant ℓ²
vectors and the invariant-mean/Følner interfaces of AmenableGroups. Do not confuse this compact-side
terminology with Haar traciality or with amenability of a compact group.
For classical compact groups identify Pol(G), A_r=C(G), and the
ordinary reduced counit and inversion using Haar's full support. Q6
proves the universal completion comparison. Reconstruction below determines the Hopf
*-core; Q4 specifies its chosen completions separately.

## Q5. Compact matrix presentations

A compact matrix quantum group has a finite unitary matrix u whose entries
generate A as a C*-algebra and whose entrywise conjugate matrix is invertible and `Δ(u_ij)=Σ_k u_ik⊗u_kj`.
Prove the coefficient criterion: a unital coassociative C*-bialgebra whose
finite unitary coefficients with invertible conjugates span a dense
subalgebra satisfies both cancellation conditions. Develop bounded
universal presentations, core generation and their matrix-coordinate
universal properties before using them in Q6.

For real q with `0<|q|≤1`, construct SUq(2), generated by a,c and

`u=[[a,−q c*],[c,a*]]`,

with u unitary. Equivalently impose `a*a+c*c=1`, `aa*+q²c*c=1`,
`c*c=cc*`, `ac=q ca` and `ac*=q c*a`. Prove equivalence of these
presentations, existence and nonzero representations. Construct
`Δ(a)=a⊗a−q c*⊗c` and `Δ(c)=c⊗a+a*⊗c`, prove coassociativity,
invertibility of the conjugate matrix and cancellation. On the core
prove `ε(a)=1`, `ε(c)=0`, `S(a)=a*`, `S(c)=−q c` and
`S(c*)=−q⁻¹c*`. Construct its ordered monomial basis, coefficient
core and concrete star representations. Prove `SU_1(2)≃C(SU(2))`
as compact matrix quantum groups; q=0 is not in this quantum-group family.

For a nonempty finite index set of cardinality n, take invertible complex
F with `F bar F=cI`, c real and nonzero. Construct the free orthogonal
quantum group O_F^+, with universal A_o(F) generated by a unitary matrix
u and relation `u=F bar u F⁻¹`. Prove the universal norm is finite,
the algebra nonzero, and Δ(u_ij)=Σ_k u_ik⊗u_kj defines a compact
matrix quantum group. Build its Hopf core and generator maps. Prove
presentation comparisons under nonzero scalar rescaling of F and unitary
basis changes, with the induced transformation of the fundamental matrix.
Construct the cup `E(1)=Σ_ij F_ji e_i⊗e_j` and verify
`(E*⊗1)(1⊗E)=cI`. Retain the sign of c. Normalize the two conjugate
solutions and derive `d(u)≤‖E(1)‖²/|c|`, with
`‖E(1)‖²/|c|≥n` by AM–GM. Prove equality in this latter inequality
iff F is proportional to a unitary. Q7 proves irreducibility and then
standardness of this solution and the intrinsic-dimension equality.
Symmetric self-duality
and negative Frobenius–Schur sign are distinct; positive symmetric TL
cups cannot silently replace the signed conjugate data.

## Q6. Tannaka–Krein reconstruction

Let C be an essentially small rigid C*-tensor category, closed under
finite sums and subobjects, with simple unit, and a unitary fiber functor
τ:C→Hilb_f. Use a skeleton in `Type u` and form the coefficient algebra
in the same controlled universe; prove independence of the skeleton.
Define its coefficient algebra by generators and relations imposed by all
intertwiners, multiplication, star, Δ, ε and S. Prove the Hopf *-laws
and that its coefficients are unitary. Apply Q4's *proved* compact-type
positivity and completion theorems. Construct a unitary monoidal
equivalence C≃Rep_f(G) and the natural unitary monoidal comparison of τ
with the forgetful functor. Prove full faithfulness by recovering exactly
the prescribed intertwiner spaces, and essential surjectivity through
finite sums, conjugates and subobjects.

Give the concrete finite-generator construction: spaces
`C(k,l)⊆B(H^⊗k,H^⊗l)` contain identities and are closed under
tensor product, composition and dagger; there is a cup
`R:ℂ→H⊗H` with `(R*⊗1)(1⊗R)=±1`. Construct the tensor algebra
of coefficient functionals, the increasing finite-level annihilator
bi-ideals from intertwiner commutants, and their union. Pass through
Q5's free orthogonal Hopf core to obtain the star and antipode;
prove the remaining ideal a Hopf *-ideal. Use finite-dimensional
bicommutants to show no extra intertwiners have been imposed. Construct
the generator reduction by adjoining conjugates and finite sums.

For an arbitrary generating set, use its finite subsets, their full rigid
C*-subcategories, the compatible coefficient embeddings and filtered
union of Hopf *-cores. Prove every object and intertwiner appears in
such a finite subcategory. Construct the canonical isomorphism from
this filtered union to the generators-and-relations algebra defined
above, preserving every coefficient, Hopf structure and the
fiber-compatible representation equivalence. The resulting equivalence
has the stated generality. Do not assert a single finite-dimensional
fundamental matrix for an infinitely generated C.

Prove uniqueness up to Hopf *-isomorphism with its fiber-compatible
representation data, and naturality under unitary equivalences of
fiber-functor pairs. Compare universal and reduced reconstructed compact
quantum groups using Q4; do not turn algebraic uniqueness into a claim
of a unique C*-norm. For symmetric fiber data preserving the usual Hilbert flip, prove
the reconstructed coefficient algebra commutative. Prove every
commutative compact quantum group is C(G): recover a compact Hausdorff
space by Gelfand duality and associative multiplication from Δ.
Cancellation spans separate pairs and imply both topological cancellation
laws. Prove a compact Hausdorff cancellative semigroup is a group:
construct an idempotent in each closed cyclic subsemigroup using a
minimal compact subsemigroup; cancellation makes it the global identity,
and compactness of powers supplies inverses. Construct the identity
and inverse without assuming boundedness of the core ε and S.
Prove the resulting counit/inversion agree with the core maps, and
that the representation equivalence recovers its original fiber data.
Ordinary compact-group Haar has full support, so every commutative
compact quantum group has faithful Haar. The universal completion of
Pol(G) for a classical compact group is commutative; apply this theorem
to identify its universal and reduced completions with C(G).

## Q7. SUq(2), free orthogonal fusion and Haar calculations

For SUq(2) construct exactly one irreducible r_k of Hilbert dimension
k+1 for every k≥0, the conjugate solutions, matrix coefficients and
Clebsch–Gordan intertwiners. Prove the SU(2) fusion rules and completeness,
including the classical endpoint and the negative-q signed duality.
For `0<|q|<1`, compute the Haar functional on the ordered monomial basis
and prove its functional-calculus consequence
`h(f(c*c))=(1−q²)Σ_(j≥0)q^(2j) f(q^(2j))` for continuous f.
Derive the normalized F matrices, quantum dimensions, modular character
values and modular group on generators. Treat q=1 by classical Haar integration. For q=−1 construct the
reduced matrix-function model `a=sqrt(1−t) z σ₃`,
`c=sqrt(t) w σ₁`, (t,z,w)∈[0,1]×𝕋², and prove the Haar
state is the integral of the normalized 2×2 trace with dt and Haar
dz,dw. Prove the core representation faithful and the invariant
monomial identities; in particular `h(f(c*c))=∫_0^1 f(t)dt`.
Neither endpoint is obtained by substituting into a divergent series.

For O_F^+ and n≥2 prove Banica's representation theorem. Construct the
concrete tensor category generated by its signed cup/cap maps and identify
it with the entire intertwiner category by Q6 and the universal
presentation. Prove End(u)=ℂ, hence the normalized conjugate solution
from Q5 is standard and `d(u)=‖E(1)‖²/|c|`. For cup-cap projections on adjacent tensor factors prove
`p_i²=p_i*=p_i`, distant commutation and
`β p_i p_(i±1) p_i=p_i`, with
`β=c⁻²‖E(1)‖⁴=d(u)²`. Compare with the TL positive quotient while
retaining the signed conjugate structure. Construct the Catalan dimension
upper bound. Choose real q with `0<|q|≤1` by `|q|+|q|⁻¹=d(u)` and
`sign(q)=−sign(c)`, and use the SUq(2) signed cup, Haar moment
calculation and faithful TL trace form to transfer the matching lower
bound. Prove the positive quotient comparison and the intertwiner
dimension equality, then build
the irreducibles/Jones–Wenzl ranges. Prove all irreducibles are r_k,
k≥0, r_0=1,r_1=u, with

`r_k⊗r_l ≃ r_|k−l| ⊕ r_|k−l|+2 ⊕ … ⊕ r_(k+l)`.

Separate the dimension recurrences: Hilbert dimensions have
`a_0=1,a_1=n,a_(k+1)=n a_k−a_(k−1)`; intrinsic dimensions
replace n by d(u). Prove equality of the two scales exactly when F
is proportional to a unitary, and work out a non-Kac admissible F.
Prove the Haar distribution of the self-adjoint fundamental character
χ=Σ_i u_ii is the centered variance-one semicircular law on [−2,2],
using its Catalan moments and compactly supported moment uniqueness.
For n>2 deduce failure of coamenability: ε(χ)=n whereas the reduced
Haar spectral support is [−2,2]. Supply the faithful-Haar spectral
support argument and the invertibility contradiction. For n=2 prove
that nonzero scalar rescaling and unitary congruence `F↦VFVᵗ`
reduce every admissible F to `[[0,1],[−q⁻¹,0]]` for a real
`0<|q|≤1`, and construct the induced compact-quantum-group
isomorphism `O_F^+≃SUq(2)`. At n=1 prove instead
`A_o(F)=C*(ℤ/2)`, with two irreducibles and two-point character law;
the infinite fusion and semicircular assertions do not hold there.

## Sources and API evidence

- Timmermann, *An Invitation to Quantum Groups and Duality* (EMS,2008),
  Proposition 2.2.4 and Remark 2.2.2(iv)(c), pp.50–51, for algebraic
  integral faithfulness and its strict-positivity consequence;
  Chapters 3 and 5: Definitions 5.1.1,5.1.4, Theorem 5.1.6;
  Theorem 5.3.3, Propositions 5.3.7–5.3.8; Theorems 5.4.1,5.4.3,5.4.5.
  Theorem 3.2.12 proves coefficient-based compact-type positivity;
  Propositions 3.2.9,3.2.17 and Theorem 3.2.19 give the two F conventions
  and modular characters. Chapter 6 §§2,4 supplies matrix examples.
- Malacarne, [*Woronowicz Tannaka–Krein duality and free orthogonal quantum
  groups*](https://doi.org/10.7146/math.scand.a-97320), Theorems 1.1,4.1,
  Lemmas 1.2,2.1,3.1–3.2, pp.152–159: reconstruction, intertwiner
  recovery and the filtered finite-generator argument.
- Banica, [*The representation theory of free orthogonal quantum
  groups*](https://arxiv.org/abs/math/9806063), Proposition 1, Lemma 1,
  Proposition 2 and Theorem 1, pp.1–4. The valid infinite-fusion range
  is n≥2, as in its abstract; the one-dimensional presentation gives
  the separate ℤ/2 boundary case.
- The explicit q=−1 matrix-function model and its monomial integration
  in Q7 are a direct derivation specified here. Verify its defining
  relations, linear independence and Haar invariance; the endpoint
  formula is not quoted from Timmermann's interior series.
- Mathlib `RingTheory/HopfAlgebra`, `RingTheory/Bialgebra`,
  `Algebra/Star/Unitary` and matrix star/tensor APIs fix the algebraic
  vocabulary. Tau Ceti's `Comodule/MatrixCoefficient/{Matrix,FromMatrix}`
  fixes the matrix orientation and inverse-antipode identities.
  Use these existing algebraic interfaces and CA1's analytic dagger
  structure for all required additions.

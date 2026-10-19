import Mathlib

/-!
# Reusable infrastructure for torsion in arithmetic cohomology: representative target signatures

The mathematical roadmap is `README.md`. This file records the definitions and theorem
signatures of the roadmap that can already be stated against the pinned Mathlib API. It is not an
exhaustive list of the targets of any layer. The geometric layers (formal models, perfectoid
compactifications, completed cohomology, Borel–Serre boundaries) and every statement about
determinants of Galois groups are stated in the README only, because their carriers are built by
the roadmaps the README names.

Design choices.
* The twisted product `weightedProduct P Q u = P(u⁻¹X) · Q(uX)` is ordinary substitution through
  `Polynomial.comp`; no new polynomial carrier is introduced.
* A series `F(T^m X)` with Laurent coefficients is `PowerSeries.rescale (T m)` applied to the
  coefficientwise image of `F` in `R[T;T⁻¹]`.
* The substitution `T ↦ T ^ a` on `R[T;T⁻¹]` is the map induced by multiplication by `a` on `ℤ`.
* Scholze's Levi polynomial is written with the standard double cosets `U i` (with `U 0 = 1`), so
  that its coefficients `(-1)^i q^(i(i+1)/2) U i` are integral. The normalised reciprocal of a
  polynomial of degree at most `n` uses `Polynomial.reflect n`, not the degree-dependent
  `Polynomial.reverse`.
* The classical Hecke topology is the initial topology of a family of ring maps into topological
  rings; it need not be Hausdorff.
-/

namespace TauCetiRoadmap.TorsionCohomologyInfrastructure

open Polynomial

/-! ## Layer 2: coherent, completed and torsion cohomology -/

section HeckeTopology

/-- The initial topology on `T` defined by a family of ring maps `ρ i : T →+* E i` into
topological rings: the weakest topology for which every `ρ i` is continuous. When the `E i` are the
endomorphism rings of the classical cusp spaces `H⁰(X*_K, ω^{ak} ⊗ I)` with their `p`-adic
topology, this is the classical Hecke topology `T_cl` of Layer 2 (Scholze, Theorem 4.3.1 and
footnote 18, p.1025). -/
abbrev heckeInitialTopology {T ι : Type*} [Ring T] {E : ι → Type*} [∀ i, Ring (E i)]
    [∀ i, TopologicalSpace (E i)] (ρ : ∀ i, T →+* E i) : TopologicalSpace T :=
  ⨅ i, TopologicalSpace.induced (ρ i) inferInstance

/-- A map into `T_cl` is continuous exactly when its composite with every defining action is. -/
theorem continuous_heckeInitialTopology_iff {T ι : Type*} [Ring T] {E : ι → Type*}
    [∀ i, Ring (E i)] [∀ i, TopologicalSpace (E i)] (ρ : ∀ i, T →+* E i) {B : Type*}
    [TopologicalSpace B] (f : B → T) :
    @Continuous B T _ (heckeInitialTopology ρ) f ↔ ∀ i, Continuous fun b => ρ i (f b) := by
  sorry

/-- Restriction of the defining ring actions gives a continuous map from their restricted initial
topology to the full initial topology. This restricts classical Hecke continuity to the
commutative unramified algebra used for ambient determinants. -/
theorem continuous_heckeInitialTopology_restrict {T T' ι : Type*} [Ring T] [Ring T']
    {E : ι → Type*} [∀ i, Ring (E i)] [∀ i, TopologicalSpace (E i)]
    (ρ : ∀ i, T →+* E i) (f : T' →+* T) :
    @Continuous T' T (heckeInitialTopology (fun i => (ρ i).comp f))
      (heckeInitialTopology ρ) f := by
  sorry

end HeckeTopology

/-! ## Layer 3a: weighted-determinant algebra -/

section WeightedProduct

variable {R S : Type*} [CommRing R] [CommRing S]

/-- The twisted product `P(u⁻¹X) · Q(uX)`, which records the opposite character weights by which a
Levi factor and its dual are separated (Scholze, proof of Lemma 5.3.4, pp.1048–1049). -/
noncomputable def weightedProduct (P Q : R[X]) (u : Rˣ) : R[X] :=
  P.comp (C (↑(u⁻¹) : R) * X) * Q.comp (C (↑u : R) * X)

/-- At the trivial twist the twisted product is the ordinary product. -/
theorem weightedProduct_one (P Q : R[X]) : weightedProduct P Q 1 = P * Q := by
  sorry

/-- The constant coefficient keeps both constant coefficients. -/
theorem weightedProduct_coeff_zero (P Q : R[X]) (u : Rˣ) :
    (weightedProduct P Q u).coeff 0 = P.coeff 0 * Q.coeff 0 := by
  sorry

/-- Coefficient change carries the twisted product to the twisted product of the mapped factors and
the mapped unit. -/
theorem weightedProduct_map (f : R →+* S) (P Q : R[X]) (u : Rˣ) :
    (weightedProduct P Q u).map f = weightedProduct (P.map f) (Q.map f) (Units.map f u) := by
  sorry

/-- Exchanging the factors inverts the weight. -/
theorem weightedProduct_swap (P Q : R[X]) (u : Rˣ) :
    weightedProduct P Q u = weightedProduct Q P u⁻¹ := by
  sorry

/-- **Twisted-product separation.** Over any commutative ring, two factorisations into polynomials
of degree at most `n` with constant term `1` that agree untwisted and twisted by `u` are equal,
provided every `1 - u ^ (2j)`, `1 ≤ j ≤ n`, is a unit (Scholze, proof of Lemma 5.3.4,
pp.1048–1049). -/
theorem twisted_product_separation (n : ℕ) (u : Rˣ) (P Q P' Q' : R[X])
    (hP : P.natDegree ≤ n) (hQ : Q.natDegree ≤ n) (hP' : P'.natDegree ≤ n)
    (hQ' : Q'.natDegree ≤ n) (hcP : P.coeff 0 = 1) (hcQ : Q.coeff 0 = 1)
    (hcP' : P'.coeff 0 = 1) (hcQ' : Q'.coeff 0 = 1) (hprod : P * Q = P' * Q')
    (htwist : weightedProduct P Q u = weightedProduct P' Q' u)
    (hsep : ∀ j : ℕ, 1 ≤ j → j ≤ n → IsUnit (1 - (↑u : R) ^ (2 * j))) :
    P = P' ∧ Q = Q' := by
  sorry

end WeightedProduct

section FiniteWeight

variable {S : Type*} [CommRing S]

/-- `weightSubst m F` is the series `F(T^m X)`, with coefficients in `S[T;T⁻¹]`. -/
noncomputable def weightSubst (m : ℤ) (F : PowerSeries S) : PowerSeries (LaurentPolynomial S) :=
  PowerSeries.rescale (LaurentPolynomial.T m) (PowerSeries.map LaurentPolynomial.C F)

/-- **Uniqueness of finite-weight factorisations** (Scholze, Lemma 5.3.10, pp.1053–1054): for a
finite set of distinct weights, the factors `Q m` with constant term `1` are determined by the
product of the `Q m (T^m X)`. -/
theorem finiteWeight_factorization_unique (M : Finset ℤ) (Q Q' : ℤ → PowerSeries S)
    (hQ : ∀ m ∈ M, PowerSeries.constantCoeff (Q m) = 1)
    (hQ' : ∀ m ∈ M, PowerSeries.constantCoeff (Q' m) = 1)
    (h : ∏ m ∈ M, weightSubst m (Q m) = ∏ m ∈ M, weightSubst m (Q' m)) :
    ∀ m ∈ M, Q m = Q' m := by
  sorry

/-- **Polynomiality** (Scholze, Lemma 5.3.10, pp.1053–1054): if the product is a polynomial in `X`
with Laurent coefficients, every factor is a polynomial. -/
theorem finiteWeight_factorization_polynomial (M : Finset ℤ) (Q : ℤ → PowerSeries S)
    (hQ : ∀ m ∈ M, PowerSeries.constantCoeff (Q m) = 1)
    (hpoly : ∃ F : Polynomial (LaurentPolynomial S),
      (F : PowerSeries (LaurentPolynomial S)) = ∏ m ∈ M, weightSubst m (Q m)) :
    ∀ m ∈ M, ∃ q : Polynomial S, (q : PowerSeries S) = Q m := by
  sorry

end FiniteWeight

section LaurentCoefficientIdeal

variable {R : Type*} [CommRing R]

/-- The substitution `T ↦ T ^ a` on Laurent polynomials. -/
noncomputable def laurentSubst (a : ℤ) : LaurentPolynomial R →+* LaurentPolynomial R :=
  AddMonoidAlgebra.mapDomainRingHom R (AddMonoidHom.mulLeft a)

/-- The largest ideal `I' = ⋂_a {f | f(T^a) ∈ I}` whose substitutions all lie in `I`. -/
noncomputable def substStableIdeal (I : Ideal (LaurentPolynomial R)) :
    Ideal (LaurentPolynomial R) :=
  ⨅ a : ℤ, I.comap (laurentSubst a)

/-- The ideal of `R` generated by the Laurent coefficients of the elements of `I'`. -/
def laurentCoeffIdeal (I : Ideal (LaurentPolynomial R)) : Ideal R :=
  Ideal.span {c | ∃ f ∈ substStableIdeal I, ∃ k : ℤ, f.coeff k = c}

/-- **Laurent coefficient-ideal bound** (Scholze, proof of Lemma 5.3.7, pp.1051–1052): the
coefficient ideal keeps the nilpotence exponent of `I`. -/
theorem laurentCoeffIdeal_pow_eq_bot (I : Ideal (LaurentPolynomial R)) {N : ℕ} (hN : 1 ≤ N)
    (hI : I ^ N = ⊥) : laurentCoeffIdeal I ^ N = ⊥ := by
  sorry

/-- The substitution-stable ideal is contained in the extension of its coefficient ideal, so characteristic identities
modulo `I'` descend to `(R ⧸ J)[T;T⁻¹]`. -/
theorem substStableIdeal_le_map (I : Ideal (LaurentPolynomial R)) :
    substStableIdeal I ≤ (laurentCoeffIdeal I).map LaurentPolynomial.C := by
  sorry

end LaurentCoefficientIdeal

/-! ## Layer 3b: arithmetic Levi realisation -/

section LeviPolynomial

variable {R : Type*} [CommRing R]

/-- Scholze's Levi polynomial `P_v(X) = Σ_{i ≤ n} (-1)^i q^(i(i+1)/2) U_i X^i` at an unramified
place with residue cardinality `q`, written with the standard double cosets `U i` (and `U 0 = 1`)
so that its coefficients are integral (Scholze, §5.4, p.1057; Lemma 5.2.5, pp.1042–1043). -/
noncomputable def scholzeLeviPolynomial (n : ℕ) (q : R) (U : ℕ → R) : R[X] :=
  ∑ i ∈ Finset.range (n + 1), C ((-1) ^ i * q ^ (i * (i + 1) / 2) * U i) * X ^ i

/-- The Levi polynomial is the reciprocal of the monic standard polynomial
`Σ (-1)^i q^(i(i-1)/2) U_i Y^(n-i)` evaluated at `qX`; the substitution adds the twist `ε⁻¹`. -/
theorem scholzeLeviPolynomial_eq_reverse_comp (n : ℕ) (q : R) (U : ℕ → R) (hU : U 0 = 1) :
    scholzeLeviPolynomial n q U =
      (∑ i ∈ Finset.range (n + 1),
        C ((-1) ^ i * q ^ (i * (i - 1) / 2) * U i) * X ^ (n - i)).reverse.comp (C q * X) := by
  sorry

/-- The normalised reciprocal `c⁻¹ · X^n P(1/X)` of a polynomial of degree at most `n` whose
coefficient of `X^n` is the unit `c`; for the Levi polynomial it is the dual polynomial `P_v^∨`. -/
noncomputable def normalizedReciprocal (n : ℕ) (P : R[X]) (c : Rˣ) : R[X] :=
  C (↑(c⁻¹) : R) * P.reflect n

/-- The normalised reciprocal has constant term `1`. -/
theorem normalizedReciprocal_coeff_zero (n : ℕ) (P : R[X]) (c : Rˣ) (hc : P.coeff n = c) :
    (normalizedReciprocal n P c).coeff 0 = 1 := by
  sorry

/-- Taking the normalised reciprocal twice returns the polynomial. -/
theorem normalizedReciprocal_normalizedReciprocal (n : ℕ) (P : R[X]) (c : Rˣ) :
    normalizedReciprocal n (normalizedReciprocal n P c) c⁻¹ = P := by
  sorry

/-- README §3b.1: coefficient change commutes with the normalised reciprocal, including
specialisation to a nonreduced coefficient ring or to a nilpotent quotient. -/
theorem normalizedReciprocal_map {S : Type*} [CommRing S] (f : R →+* S)
    (n : ℕ) (P : R[X]) (c : Rˣ) :
    (normalizedReciprocal n P c).map f =
      normalizedReciprocal n (P.map f) (Units.map f c) := by
  sorry

end LeviPolynomial

/-! ## Layer 4: assembly, compatibility and validation -/

/-- README §4.8, the group-cohomology part of `nonlifting_example`: the integral first
cohomology of the stabiliser `{±1}` vanishes, whereas its mod-2 first cohomology is a
one-dimensional vector space. Its nonzero class therefore has no integral lift. -/
theorem nonlifting_groupCohomology :
    Subsingleton (groupCohomology (Rep.trivial ℤ_[2] ℤˣ ℤ_[2]) 1) ∧
      Nonempty (groupCohomology (Rep.trivial ℤ ℤˣ (ZMod 2)) 1 ≃ₗ[ℤ] ZMod 2) := by
  sorry

/-!
## Targets stated in the README only

Layer 0 (integral section models, integral boundary ideals, the bounded lattice extension, the
closed-quotient sequence, the almost support comparison, trace integrality, reduced-boundary trace preservation, boundary traces),
Layer 2a (the ordinary colimit of quotients of bounded ideal sections and their separate almost
comparison with sections of the quotient sheaf), Layer 1 (period lattices, the approximation atlas, sections
over non-vanishing loci, Serre vanishing over an arbitrary base, integral cuspidal lifting, classical
section approximation), the constructible primitive comparison (`constructiblePrimitiveComparison`), amplitude, Iwasawa,
continuity and descent targets of
Layer 2 (including the classical cusp action over a finite extension), the homogeneous decomposition, weighted unit law and weighted determinant factors of
Layer 3a, the GU boundary and classical-action adapter (`unitarySimilitudeBoundaryAdapter`),
the cohomological trace input and unitary-similitude base change (`unitarySimilitudeBaseChange`),
the normalized prime-to-`p` level trace and inverse-character retraction of twisted pullback,
finite-coefficient descent for each character pair, and determinant targets of Layer 3b, and the compact-support product comparison (`compactSupportProductComparison`), boundary filtration, finite torsion,
integral, four-route, residual and normalisation targets of Layer 4.
-/

end TauCetiRoadmap.TorsionCohomologyInfrastructure

import Mathlib

/-!
# PadicFamilies: representative target signatures

The roadmap is README.md. This file records light definitions and theorem signatures
statable against the pinned APIs and is not exhaustive. Finite-set factorial powers
are distinguished from adic limits; local finiteness is an orbit condition modulo
all powers of an ideal. The raw congruence quotient uses both annihilated submodules,
and its cyclic quotient comparison retains the double-annihilator hypothesis.
-/

open scoped Nat

namespace TauCetiRoadmap.PadicFamilies

/-! ## Layer 0a: Ordinary projectors on modules and complexes -/

section FiniteOrdinary
variable {R : Type*} [Ring R]
variable {M : Type*} [AddCommGroup M] [Module R M] [Finite M]

/-- The factorial power on a finite underlying set. -/
noncomputable def ordinaryProjector (U : Module.End R M) : Module.End R M :=
  U ^ (Nat.card M)!

/-- The image of the ordinary projector. -/
noncomputable def ordinaryPart (U : Module.End R M) : Submodule R M :=
  LinearMap.range (ordinaryProjector U)

/-- Its complementary kernel. -/
noncomputable def nonOrdinaryPart (U : Module.End R M) : Submodule R M :=
  LinearMap.ker (ordinaryProjector U)

/-- Stabilisation, idempotence and the invertible/nilpotent decomposition. -/
theorem finite_ordinary_milestone (U : Module.End R M) :
    (∀ n : ℕ, Nat.card M ≤ n → ordinaryProjector U = U ^ n !) ∧
    IsIdempotentElem (ordinaryProjector U) ∧
    IsCompl (ordinaryPart U) (nonOrdinaryPart U) ∧
    Set.BijOn U (ordinaryPart U) (ordinaryPart U) ∧
    (∀ x ∈ nonOrdinaryPart U, (U ^ Nat.card M) x = 0) := sorry

/-- Compare the existing Fitting summands. -/
theorem finite_ordinary_fitting (U : Module.End R M) :
    ordinaryPart U = ⨅ n, LinearMap.range (U ^ n) ∧
    nonOrdinaryPart U = ⨆ n, LinearMap.ker (U ^ n) := sorry

/-- Intertwining preserves the stable projector. -/
theorem finite_ordinary_naturality
    {N : Type*} [AddCommGroup N] [Module R N] [Finite N]
    (U : Module.End R M) (V : Module.End R N)
    (f : M →ₗ[R] N) (h : f ∘ₗ U = V ∘ₗ f) :
    f ∘ₗ ordinaryProjector U = ordinaryProjector V ∘ₗ f := sorry

example : ordinaryProjector (2 • (1 : Module.End (ZMod 6) (ZMod 6))) =
    4 • (1 : Module.End (ZMod 6) (ZMod 6)) := sorry
example : ordinaryProjector (0 : Module.End (ZMod 8) (ZMod 8)) = 0 := sorry
example : ordinaryPart (1 : Module.End (ZMod 8) (ZMod 8)) = ⊤ := sorry
example : ordinaryPart (2 • (1 : Module.End (ZMod 8) (ZMod 8))) = ⊥ := sorry
example : nonOrdinaryPart (3 • (1 : Module.End (ZMod 8) (ZMod 8))) = ⊥ := sorry
example : nonOrdinaryPart (0 : Module.End (ZMod 8) (ZMod 8)) = ⊤ := sorry
end FiniteOrdinary

section LocallyFinite
variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- Every orbit is finitely generated modulo each adic power. -/
def IsLocallyFiniteEnd (I : Ideal R) (T : Module.End R M) : Prop :=
  ∀ n : ℕ, ∀ v : M, ∃ s : Finset M, ∀ k : ℕ,
    (T ^ k) v ∈ Submodule.span R (s : Set M) ⊔ (I ^ n) • (⊤ : Submodule R M)

/-- The locally finite ordinary milestone of §0a.22 (Pilloni Lemma 2.1.3):
the finite residue field and complete local coefficient ring are essential here. -/
theorem locally_finite_ordinary_milestone
    [IsNoetherianRing R] [IsLocalRing R]
    [Finite (IsLocalRing.ResidueField R)]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) M]
    (T : Module.End R M)
    (hT : IsLocallyFiniteEnd (IsLocalRing.maximalIdeal R) T) :
    ∃ e : Module.End R M, IsIdempotentElem e ∧ Commute T e ∧
      Set.BijOn T (LinearMap.range e) (LinearMap.range e) ∧
      (∀ x : M, ∀ n : ℕ, ∃ b : ℕ, ∀ k : ℕ, b ≤ k →
        (T ^ k !) x - e x ∈
          (IsLocalRing.maximalIdeal R ^ n) • (⊤ : Submodule R M)) ∧
      (∀ x ∈ LinearMap.ker e, ∀ n : ℕ, ∃ b : ℕ, ∀ k : ℕ, b ≤ k →
        (T ^ k) x ∈ (IsLocalRing.maximalIdeal R ^ n) • (⊤ : Submodule R M)) := sorry

example (I : Ideal R) : IsLocallyFiniteEnd I (0 : Module.End R M) := sorry
example (I : Ideal R) : IsLocallyFiniteEnd I (1 : Module.End R M) := sorry

/-- Multiplication by the variable has an infinite independent orbit at the zero ideal. -/
example : ¬ IsLocallyFiniteEnd (⊥ : Ideal (ZMod 2))
    (LinearMap.mulLeft (ZMod 2) (Polynomial.X : Polynomial (ZMod 2))) := sorry
example [Module.Finite R M] (I : Ideal R) (T : Module.End R M) :
    IsLocallyFiniteEnd I T := sorry
end LocallyFinite

/-! ## Layer 0: Ordinary Hecke algebras and Hida families
The Hecke and form carriers are described in README.md. -/

/-! ## Layer 1: Integral period modules and family measures -/

section Congruence
variable {A O : Type*} [CommRing A] [CommRing O]

/-- The annihilator `I_λ = A[ker λ]` of the augmentation ideal, as an ideal of `A`. -/
def augmentationAnnihilator (lam : A →+* O) : Ideal A :=
  Submodule.torsionBySet A A (RingHom.ker lam : Set A)

/-- The submodule `M[ker λ] + M[I_λ]`. -/
def congruenceSubmodule (lam : A →+* O) (M : Type*) [AddCommGroup M] [Module A M] :
    Submodule A M :=
  Submodule.torsionBySet A M (RingHom.ker lam : Set A) ⊔
    Submodule.torsionBySet A M (augmentationAnnihilator lam : Set A)

/-- `Ψ_λ(M) = M / (M[ker λ] + M[I_λ])`. -/
abbrev congruenceModule (lam : A →+* O) (M : Type*) [AddCommGroup M] [Module A M] : Type _ :=
  M ⧸ congruenceSubmodule lam M

/-- `η_λ = λ(I_λ)`. -/
def congruenceIdeal (lam : A →+* O) : Ideal O := Ideal.map lam (augmentationAnnihilator lam)

/-- The raw congruence module needs the double annihilator
hypothesis to identify it with the quotient by the congruence ideal. -/
theorem congruence_milestone (lam : A →+* O) (hsurj : Function.Surjective lam)
    (hann : Submodule.torsionBySet A A
      (augmentationAnnihilator lam : Set A) = RingHom.ker lam) :
    Nonempty (congruenceModule lam A ≃+ O ⧸ congruenceIdeal lam) := sorry

example : augmentationAnnihilator (RingHom.id ℤ) = ⊤ := sorry
example : augmentationAnnihilator (RingHom.fst ℤ ℤ) = Ideal.span {(1, 0)} := sorry
example : Nat.card (congruenceModule (RingHom.id ℤ) ℤ) = 1 := sorry
example : congruenceIdeal (RingHom.id ℤ) = ⊤ := sorry
example (M : Type*) [AddCommGroup M] [Module ℤ M] :
    congruenceSubmodule (RingHom.id ℤ) M = ⊤ := sorry
example : congruenceIdeal (RingHom.fst ℤ ℤ) = ⊤ := sorry
example : Nat.card (congruenceModule (RingHom.fst ℤ ℤ) (ℤ × ℤ)) = 1 := sorry

/-- Polynomial augmentation is a negative control for dropping the double annihilator. -/
example : congruenceIdeal (Polynomial.constantCoeff : Polynomial ℤ →+* ℤ) = ⊥ ∧
    Nat.card (congruenceModule (Polynomial.constantCoeff : Polynomial ℤ →+* ℤ) (Polynomial ℤ)) = 1 := sorry
/-- Reduction modulo two has a nonzero raw congruence quotient. -/
example :
    augmentationAnnihilator (ZMod.castHom (by decide : 2 ∣ 4) (ZMod 2)) =
      Ideal.span {(2 : ZMod 4)} ∧
    congruenceIdeal (ZMod.castHom (by decide : 2 ∣ 4) (ZMod 2)) = ⊥ ∧
    Nat.card (congruenceModule
      (ZMod.castHom (by decide : 2 ∣ 4) (ZMod 2)) (ZMod 4)) = 2 := sorry

/-- The dual-number augmentation has a nontorsion raw quotient isomorphic to the integers. -/
example :
    Nonempty (congruenceModule
      (TrivSqZeroExt.fstHom ℤ ℤ ℤ).toRingHom (DualNumber ℤ) ≃+ ℤ) ∧
    ¬ Module.IsTorsion ℤ (congruenceModule
      (TrivSqZeroExt.fstHom ℤ ℤ ℤ).toRingHom (DualNumber ℤ)) := sorry
end Congruence

/-! ## Layer 2a: The eigenvariety construction
The spectral and eigenmodule carriers are described in README.md. -/

/-! ## Layer 2: Families of distributions and the modular-symbol eigencurve
The Banach family and eigensymbol carriers are described in README.md. -/

/-! ## Layer 3: Critical refinements and critical p-adic L-functions
The refinement, eigencurve and Mellin carriers are described in README.md. -/

/-! ## Layer 4: Galois representations, Selmer conditions and family reciprocity
The Galois family, local comparison and regulator targets are described in README.md. -/

/-! ## Layer 5: Totally real ordinary families and quaternionic periods
The totally real coefficient and automorphic towers are described in README.md. -/

/-
The README also specifies the carriers and constructions for FiniteQuotientSystem,
ordinaryProjectorLF, IsLocallyFiniteChainEnd, IsLocallyFiniteDerivedEnd,
derivedOrdinaryPart, KatzPadicModular, padicHeckeT, universalHecke, hidaIdempotent,
arithmeticPoint, LambdaAdicForm, familySymbols, familyPeriod,
familyMeasure, reducedHidaAlgebra, branchAlgebra and familyCongruenceModule.

The README-only API for these definitions includes ordinaryProjector_eq_pow_factorial,
ordinaryProjector_of_isUnit, ordinaryProjector_of_isNilpotent,
isLocallyFiniteEnd_iff_directed_union, isLocallyFiniteEnd_of_finite,
isLocallyFiniteEnd_of_finiteQuotientSystem, congruenceModule_map,
congruenceModule_annihilated, congruenceModule_self, congruenceModule_isTorsion,
congruenceModule_compare_ikm, congruenceModule_mk, congruenceModule_lift,
congruenceModule_self_eq, congruenceIdeal_map and congruenceIdeal_ne_bot.

The complete-flat and compatible-minimal-model constructions are IsMinimal,
CompleteFlatComplex, completeFlatBasis and compatibleMinimalModel.
The odd-prime cuspidal input is ordinaryCuspidal_control_oddPrime.
The Eisenstein inputs are eisensteinConstantTerm and eisensteinCoefficientMeasure;
the modular Euler-system inputs are thetaUnit, modularZeta and their period comparisons.

Its analytic constructions are Eigenvariety.spectralVariety, slopePolynomial,
slopeSummand, heckeImage, eigenvarietyOverWeight, complexSpectralVariety,
eigenmoduleSheaf, distFamily, familySymb, familySymbSlope, symbolEigencurve,
eigensymbolSheaf, ellipticColemanForms, IsCriticalRefinement, IsThetaCritical,
IsDecent, criticalPadicL, the local two-variable Mellin construction and secondaryPadicL.

The critical-boundary prerequisites are eisensteinCharacterSelmer,
preferredEisensteinRepresentation, criticalBoundary_coleman,
criticalSplit_breuilEmerton, criticalEisenstein_bellaicheChenevier,
eigencurvePseudocharacter, refinedCrystallinePeriod,
refinedDeformationRepresentable and refinedTangent_selmer.
The classical Hilbert coefficient inputs are classicalHilbertQExpansion,
classicalHilbertQExpansion_injective, classicalHilbertQExpansion_baseChange
and classicalHilbertQExpansion_idealCoefficients.

The later layers specify hidaBigGaloisRep, nearlyOrdinaryDeformation, familySelmer,
familySelmerComplex, bigKatoClass, bigLogarithm, familyColemanMap,
colemanFamilyGaloisModule, colemanFamilyRobbaModule, colemanFamilyTriangulation,
colemanFamilyEichlerShimura, colemanFamilyRegulator, nearlyOrdinaryWeightAlgebra,
quaternionicOrdinaryProjector, hidaHeckeAlgebra, LambdaAdicHilbertForm and
quaternionicPeriodModule, together with the integral control and comparison maps.
-/

end TauCetiRoadmap.PadicFamilies

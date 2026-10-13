import Mathlib
import TauCeti.AlgebraicGeometry.AdicSpace.PreAdicSpace.Adic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Analytic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.StructurePresheaf.GlobalSections
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.StructurePresheaf.SheafyRing
import TauCeti.RingTheory.Huber.Padic.Field

/-!
# Foundations of adic spaces, Part II: representative target signatures

Huber rings, Huber pairs, pairs of definition, restricted power series, the adic spectrum and
the category `TauCeti.AdicSpace` are Tau Ceti's. Completeness includes the Hausdorff property.
This file states the ring-level noetherian and adicness conditions, Huber's standing class of
f-adic rings (Huber 1996, (1.1.1)), the morphism classes of adic spaces (adic, finite type,
separated, proper, finite, quasi-finite, flat, unramified, smooth, étale) with their main
theorems, and the inclusion of polynomials into Tau Ceti's Tate algebras. Classical `K`-affinoid
algebras, affinoid subdomains and rigid-analytic spaces are the RigidAnalyticGeometry roadmap's
(README, supplier contracts). The completed tensor product, continuous differentials, the spectral
seminorm and the analytification functor are README targets.
-/

set_option autoImplicit false

namespace TauCetiRoadmap.AdicSpacesPartII

open TauCeti

universe u w u₁ u₂

/-! ## Layer R0: Morphisms and admissible affinoid products -/

noncomputable section

open TensorProduct UniformSpace Topology Filter

namespace Huber

open TauCeti.Huber

/-! ### R0.1–R0.2 Rings of noetherian type and sheafiness
(*noetherian-type-huber-ring*, *noetherian-adic-completion*,
*topologically-finite-type-noetherian-type*, *noetherian-type-ideals-closed*,
*noetherian-rod-sheafy*, *noetherian-type-stably-sheafy*) -/

section NoetherianType

variable (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]

/-- A Huber ring is *of noetherian type* if it has a pair of definition whose ring of definition
is noetherian, or it is a strongly noetherian Tate ring (Huber 1994, §2, Theorem 2.2, p. 524). -/
@[mk_iff isNoetherianType_iff]
class IsNoetherianType : Prop where
  /-- A noetherian ring of definition, or a strongly noetherian Tate ring. -/
  out : (∃ P : PairOfDefinition A, IsNoetherianRing P.ringOfDefinition) ∨
    (IsTateRing A ∧ IsStronglyNoetherian A)

variable {A}

/-- A noetherian ring of definition gives noetherian type. -/
theorem IsNoetherianType.of_pairOfDefinition (P : PairOfDefinition A)
    (hP : IsNoetherianRing P.ringOfDefinition) : IsNoetherianType A :=
  ⟨Or.inl ⟨P, hP⟩⟩

end NoetherianType

section NoetherianTypeTate

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsTateRing A]

/-- A strongly noetherian Tate ring is of noetherian type. -/
theorem IsNoetherianType.of_isStronglyNoetherian [IsStronglyNoetherian A] : IsNoetherianType A :=
  ⟨Or.inr ⟨inferInstance, inferInstance⟩⟩

/-- For a Tate ring, noetherian type is strong noetherianness (Wedhorn, Remark 6.37(3)). -/
theorem IsNoetherianType.isStronglyNoetherian : IsNoetherianType A ↔ IsStronglyNoetherian A :=
  sorry

end NoetherianTypeTate

/-! ### R0.1 Huber's standing class (*huber-standing-class*) -/

section HuberStandard

variable (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]

/-- *Huber's standing class* (Huber 1996, (1.1.1), p. 37): `A` has a noetherian ring of
definition over which it is a finitely generated algebra, or `A` is a strongly noetherian Tate
ring, or `A` is discrete. Huber asks the first clause of the completion of `A`; for a complete
`A` the two readings agree. The unramified, smooth and étale theory of Huber 1996, §§1.6–1.7, is
developed for rings in this class. -/
@[mk_iff isHuberStandard_iff]
class IsHuberStandard : Prop where
  /-- A noetherian ring of definition over which `A` is of finite type, or a strongly noetherian
  Tate ring, or the discrete topology. -/
  out : (∃ P : PairOfDefinition A, IsNoetherianRing P.ringOfDefinition ∧
      Algebra.FiniteType P.ringOfDefinition A) ∨
    (IsTateRing A ∧ IsStronglyNoetherian A) ∨ DiscreteTopology A

variable {A}

/-- Rings in Huber's standing class are of noetherian type: in the first two clauses directly,
and a discrete ring has its prime subring, with ideal of definition `0`, as a noetherian ring of
definition. -/
theorem IsHuberStandard.isNoetherianType [IsHuberStandard A] : IsNoetherianType A := sorry

/-- Every discrete ring is in Huber's standing class (third clause), noetherian or not. -/
example [DiscreteTopology A] : IsHuberStandard A := ⟨Or.inr (Or.inr inferInstance)⟩

end HuberStandard

/-- `ℚ_p` is in Huber's standing class: it is a strongly noetherian Tate ring (BGR 5.2.6). -/
example (p : ℕ) [Fact p.Prime] : IsHuberStandard ℚ_[p] := sorry

/-- The discrete ring `ℤ[X₀, X₁, …]` is of noetherian type (its prime subring is an open
noetherian ring of definition) but is neither a noetherian ring nor strongly noetherian. -/
example :
    letI : TopologicalSpace (MvPolynomial ℕ ℤ) := ⊥
    haveI : DiscreteTopology (MvPolynomial ℕ ℤ) := ⟨rfl⟩
    ∃ _ : IsHuberRing (MvPolynomial ℕ ℤ),
      IsNoetherianType (MvPolynomial ℕ ℤ) ∧ ¬ IsNoetherianRing (MvPolynomial ℕ ℤ) ∧
        ¬ IsStronglyNoetherian (MvPolynomial ℕ ℤ) := sorry

/-- `ℂ_p` is of noetherian type (strongly noetherian, BGR 5.2.6) although no ring of definition
of `ℂ_p` is noetherian. -/
example (p : ℕ) [Fact p.Prime] :
    haveI : IsHuberRing ℂ_[p] := sorry
    IsNoetherianType ℂ_[p] ∧ ¬ ∃ P : PairOfDefinition ℂ_[p],
      IsNoetherianRing P.ringOfDefinition := sorry

section NoetherianTypeComplete

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsHuberRing A]

/-- The Hausdorff completion of a Huber ring of noetherian type is of noetherian type
(EGA I, Ch. 0, (7.3.1); Wedhorn, proof of Proposition 6.35). -/
theorem IsNoetherianType.completion [IsNoetherianType A] :
    IsNoetherianType (Completion A) := sorry

variable [CompleteSpace A] [T2Space A]
  {B : Type*} [CommRing B] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B]
  [IsHuberRing B] [CompleteSpace B] [T2Space B]

/-- A complete Huber ring topologically of finite type over a complete ring of noetherian type is
of noetherian type (Huber 1994, Corollary 3.4(ii),(iii); Wedhorn, Proposition 6.35). -/
theorem IsNoetherianType.of_isTopologicallyFiniteType [IsNoetherianType A] {φ : A →+* B}
    (h : IsTopologicallyFiniteType φ) : IsNoetherianType B := sorry

/-- Every ideal of a complete Hausdorff ring of noetherian type is closed (Huber 1994, §2,
Lemma 2.3(ii)). -/
theorem IsNoetherianType.isClosed_ideal [IsNoetherianType A] (J : Ideal A) :
    IsClosed (J : Set A) := sorry

/-- A complete Hausdorff Huber ring of noetherian type is stably sheafy (Huber 1994, Theorem 2.2;
Wedhorn, Theorem 8.28). -/
theorem IsNoetherianType.isStablySheafy {A : Type u} [CommRing A] [UniformSpace A]
    [IsUniformAddGroup A] [IsTopologicalRing A] [IsHuberRing A] [CompleteSpace A] [T2Space A]
    [IsNoetherianType A] : IsStablySheafyRing.{u, u} A := sorry

end NoetherianTypeComplete

/-- The Hausdorff hypothesis in `IsNoetherianType.isClosed_ideal` is needed: `ℤ` with the
indiscrete topology (pair of definition `(ℤ, (1))`) is complete, and `0` is not closed. -/
example :
    letI : TopologicalSpace ℤ := ⊤
    ¬ IsClosed ((⊥ : Ideal ℤ) : Set ℤ) := by
  let : TopologicalSpace ℤ := ⊤
  intro h
  have h1 := isClosed_iff_nhds.mp h 1 fun U hU ↦ by
    rw [_root_.nhds_top, Filter.mem_top] at hU
    exact ⟨0, by simp [hU]⟩
  simp at h1

/-- Huber's sheafiness theorem: a Huber ring with a noetherian ring of definition is sheafy
(Huber 1994, Theorem 2.2, case of a noetherian ring of definition). -/
theorem PairOfDefinition.isSheafyRing {A : Type*} [CommRing A] [UniformSpace A]
    [IsUniformAddGroup A] [IsTopologicalRing A] [IsHuberRing A]
    (P : PairOfDefinition A) [IsNoetherianRing P.ringOfDefinition] :
    IsSheafyRing A := sorry

/-! ### R0.1 Adic homomorphisms
(*adic-ring-homomorphism*, *topologically-finite-type-is-adic*, *spa-comap-analytic-locus*) -/

section AdicHom

variable {A B : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]

/-- `φ : A → B` is *adic* if there are pairs of definition `(A₀, I)` of `A` and `(B₀, J)` of `B`
with `φ(A₀) ⊆ B₀` and `J = φ(I)·B₀` (Huber 1994, §3; Wedhorn, Definition 6.23). -/
class IsAdicHom (φ : A →+* B) : Prop where
  /-- Pairs of definition `(A₀, I)`, `(B₀, J)` with `φ(A₀) ⊆ B₀` and `J = φ(I)·B₀`. -/
  exists_pairOfDefinition : ∃ (P : PairOfDefinition A) (Q : PairOfDefinition B)
    (h : ∀ a ∈ P.ringOfDefinition, φ a ∈ Q.ringOfDefinition),
    Q.idealOfDefinition = P.idealOfDefinition.map (φ.restrict _ _ h)

/-- Adic homomorphisms are continuous (Wedhorn, §6.5). -/
theorem IsAdicHom.continuous (φ : A →+* B) [IsAdicHom φ] : Continuous φ := sorry

/-- The identity of a Huber ring is adic. -/
theorem IsAdicHom.id [IsHuberRing A] : IsAdicHom (RingHom.id A) := sorry

/-- A continuous homomorphism out of a Tate ring is adic and its target is Tate
(Wedhorn, Proposition 6.25). -/
theorem IsAdicHom.of_isTateRing [IsTateRing A] [IsHuberRing B] {φ : A →+* B}
    (hφ : Continuous φ) : IsAdicHom φ ∧ IsTateRing B := sorry

end AdicHom

/-- A homomorphism topologically of finite type into a complete Hausdorff Huber ring is adic
(Huber 1994, Lemma 3.3(ii); Wedhorn, Remark 8.49(2)). -/
theorem IsTopologicallyFiniteType.isAdicHom {A B : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsHuberRing A] [CommRing B] [UniformSpace B] [IsUniformAddGroup B]
    [IsTopologicalRing B] [IsHuberRing B] [CompleteSpace B] [T2Space B] {φ : A →+* B}
    (h : IsTopologicallyFiniteType φ) : IsAdicHom φ := sorry

/-- `ℤ_p → ℚ_p` is adic. -/
example (p : ℕ) [Fact p.Prime] : IsAdicHom (algebraMap ℤ_[p] ℚ_[p]) := sorry

/-- `ℤ` is discrete and `ℤ_p` is not, so `ℤ → ℤ_p` is continuous and not adic. -/
example (p : ℕ) [Fact p.Prime] :
    Continuous (algebraMap ℤ ℤ_[p]) ∧ ¬ IsAdicHom (algebraMap ℤ ℤ_[p]) := sorry

section AnalyticPoints

open TauCeti.ValuationSpectrum

variable {A B : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]

/-- An adic homomorphism of Huber pairs maps analytic points to analytic points
(Wedhorn, Lemma 7.46(1)). -/
theorem IsAdicHom.spaComap_analytic [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
    [IsHuberRing B] {S : Pair A} {T : Pair B} (φ : Pair.Hom S T) [IsAdicHom φ.toRingHom]
    (x : spa T.plus) (hx : IsAnalyticPoint x.val) : IsAnalyticPoint (φ.spaComap x).val := sorry

/-- For a complete Hausdorff target, preservation of analytic points characterises adic
homomorphisms (Wedhorn, Lemma 7.46(2)). -/
theorem isAdicHom_of_spaComap_analytic [CommRing B] [UniformSpace B] [IsUniformAddGroup B]
    [IsTopologicalRing B] [IsHuberRing B] [CompleteSpace B] [T2Space B]
    {S : Pair A} {T : Pair B} (φ : Pair.Hom S T)
    (hφ : ∀ x : spa T.plus, IsAnalyticPoint x.val → IsAnalyticPoint (φ.spaComap x).val) :
    IsAdicHom φ.toRingHom := sorry

end AnalyticPoints

/-! ### R0.13 Finite morphisms of Huber pairs (*finite-huber-pair-hom*) -/

section FiniteHom

variable {A B : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A]
  [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [IsHuberRing B]

/-- A morphism `φ : (A, A⁺) → (B, B⁺)` of Huber pairs is *finite* if it is topologically of
finite type and both `A → B` and `A⁺ → B⁺` are integral (Huber 1996, (1.4.2)). -/
structure Pair.Hom.IsFinite {S : Pair A} {T : Pair B} (φ : Pair.Hom S T) : Prop where
  /-- `φ` is topologically of finite type. -/
  isTopologicallyFiniteType : IsTopologicallyFiniteType φ.toRingHom
  /-- The ring map `A → B` is integral. -/
  isIntegral : φ.toRingHom.IsIntegral
  /-- The ring map `A⁺ → B⁺` is integral. -/
  isIntegral_plus : (φ.toRingHom.restrict S.plus T.plus φ.map_mem_plus).IsIntegral

/-- `(A, A⁺) → (A, A'⁺)` with the identity ring map and `A⁺ ⊊ A'⁺` is not finite: `A'⁺` is not
integral over the integrally closed `A⁺`. -/
example {S S' : Pair A} (hSS' : S.plus < S'.plus) (φ : Pair.Hom S S')
    (hφ : φ.toRingHom = RingHom.id A) : ¬ Pair.Hom.IsFinite φ := sorry

end FiniteHom

/-! ### R0.9 The polynomial inclusion into Tate algebras

The theory of classical `K`-affinoid algebras is the RigidAnalyticGeometry roadmap's (README, R0.9);
the disc Checks of R0.16–R0.17 use this inclusion. -/

/-- The inclusion `A[X₁,…,Xₙ] → A⟨X₁,…,Xₙ⟩` into Tau Ceti's completed restricted power series. -/
def TateAlgebra.ofMvPolynomial (A : Type*) [CommRing A] [TopologicalSpace A]
    [NonarchimedeanRing A] (n : ℕ) :
    MvPolynomial (Fin n) A →+* restrictedMvPowerSeriesCompletion n A :=
  (UniformSpace.Completion.coeRingHom).comp
    (weightedPolynomialHom (fun _ : Fin n ↦ ({1} : Set A)) isWeightFamily_one_weight)

end Huber

/-! ### R0.7 Valuations on tensor products (*valuation-amalgamation*) -/

namespace ValuationSpectrum

open TauCeti.ValuationSpectrum

/-- Valuations on `B` and `C` with the same restriction to `A` are the restrictions of one
valuation on `B ⊗[A] C` (Huber 1994, proof of Lemma 3.9(i); Wedhorn, proof of Proposition 8.63). -/
theorem exists_amalgamation {A B C : Type*} [CommRing A] [CommRing B] [CommRing C] [Algebra A B]
    [Algebra A C] (y : ValuationSpectrum B) (x : ValuationSpectrum C)
    (h : comap (algebraMap A B) y = comap (algebraMap A C) x) :
    ∃ v : ValuationSpectrum (B ⊗[A] C),
      comap Algebra.TensorProduct.includeLeftRingHom v = y ∧
        comap (Algebra.TensorProduct.includeRight (R := A) (A := B)).toRingHom v = x := sorry

end ValuationSpectrum

/-! ### R0.6, R0.16 Affinoid-level cores of the morphism classes
(*plus-weakly-finite-type*, *unramified-morphism*, *smooth-morphism*,
*differentials-unramified-smooth-etale*, *lifting-test-agreement*) -/

namespace AdicSpace

open TauCeti.Huber

/-- `f : (A, A⁺) → (B, B⁺)` is of *+weakly finite type* if it is topologically of finite type
and `B⁺` is the integral closure of the subring generated by `f(A⁺)`, a finite set and `B°°`
(Huber 1996, Definition 1.2.1(ii)). -/
def LocallyOfPlusWeaklyFiniteType_affinoid {A B : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [IsHuberRing A] [CommRing B] [TopologicalSpace B] [IsTopologicalRing B]
    [IsHuberRing B] {S : Pair A} {T : Pair B} (f : Pair.Hom S T) : Prop :=
  IsTopologicallyFiniteType f.toRingHom ∧
    ∃ E : Finset B, T.plus = (integralClosure
      (Subring.closure (f.toRingHom '' S.plus ∪ ↑E ∪ {b : B | IsTopologicallyNilpotent b}))
        B).toSubring

section InfinitesimalLifting


variable {A : Type u₁} {B : Type u₂} [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
  [IsTopologicalRing A] [IsHuberRing A] [CompleteSpace A] [T2Space A] [CommRing B] [UniformSpace B]
  [IsUniformAddGroup B] [IsTopologicalRing B] [IsHuberRing B] [CompleteSpace B] [T2Space B]
  {S : Pair A} {T : Pair B}

/-- Uniqueness of lifts: two morphisms `(B, B⁺) → (C, C⁺)` under `(A, A⁺)` that agree modulo a
closed square-zero ideal of a complete Huber pair `(C, C⁺)` are equal. This is the
complete-pair, closed-ideal specialisation of the test of Huber 1996, Definition 1.6.5, which
ranges over all affinoid rings and all ideals of square zero: Tau Ceti's quotient pair by a
non-closed ideal is not Hausdorff, and maps into it are not morphisms to Huber's `Spa(C/I)`,
which is formed from the completion. The two tests are not identified here. -/
def Unramified_affinoid (φ : Pair.Hom S T) : Prop :=
  ∀ (C : Type w) [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C]
    [IsHuberRing C] [CompleteSpace C] [T2Space C] (U : Pair C) (I : Ideal C),
    IsClosed (I : Set C) → I ^ 2 = ⊥ → ∀ g₁ g₂ : Pair.Hom T U, g₁.comp φ = g₂.comp φ →
      (Pair.quotientHom U I).comp g₁ = (Pair.quotientHom U I).comp g₂ → g₁ = g₂

/-- Existence of lifts across closed square-zero ideals of complete Huber pairs: the
complete-pair, closed-ideal specialisation of the test of Huber 1996, Definition 1.6.5 (all
affinoid rings, all ideals of square zero); the two tests are not identified here. -/
def Smooth_affinoid (φ : Pair.Hom S T) : Prop :=
  ∀ (C : Type w) [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C]
    [IsHuberRing C] [CompleteSpace C] [T2Space C] (U : Pair C) (I : Ideal C),
    IsClosed (I : Set C) → I ^ 2 = ⊥ → ∀ (a : Pair.Hom S U) (b : Pair.Hom T (U.quotient I)),
      (Pair.quotientHom U I).comp a = b.comp φ →
        ∃ g : Pair.Hom T U, g.comp φ = a ∧ (Pair.quotientHom U I).comp g = b

/-- Existence and uniqueness of lifts across closed square-zero ideals of complete Huber pairs:
the complete-pair, closed-ideal specialisation of the test of Huber 1996, Definition 1.6.5 (all
affinoid rings, all ideals of square zero); the two tests are not identified here. -/
def Etale_affinoid (φ : Pair.Hom S T) : Prop :=
  ∀ (C : Type w) [CommRing C] [UniformSpace C] [IsUniformAddGroup C] [IsTopologicalRing C]
    [IsHuberRing C] [CompleteSpace C] [T2Space C] (U : Pair C) (I : Ideal C),
    IsClosed (I : Set C) → I ^ 2 = ⊥ → ∀ (a : Pair.Hom S U) (b : Pair.Hom T (U.quotient I)),
      (Pair.quotientHom U I).comp a = b.comp φ →
        ∃! g : Pair.Hom T U, g.comp φ = a ∧ (Pair.quotientHom U I).comp g = b

/-- The identity has all three lifting properties. -/
example : Unramified_affinoid (Pair.Hom.id S) ∧ Smooth_affinoid (Pair.Hom.id S) ∧
    Etale_affinoid (Pair.Hom.id S) := sorry

/-- The quotient by a nonzero closed square-zero ideal is unramified but neither smooth nor
étale: the identity of `A` does not factor through `A ⧸ I`. -/
example (I : Ideal A) (hI : IsClosed (I : Set A)) (hI2 : I ^ 2 = ⊥) (hne : I ≠ ⊥) :
    letI : UniformSpace (A ⧸ I) := IsTopologicalAddGroup.rightUniformSpace (A ⧸ I)
    haveI : IsUniformAddGroup (A ⧸ I) := isUniformAddGroup_of_addCommGroup
    haveI : CompleteSpace (A ⧸ I) := sorry
    haveI : T2Space (A ⧸ I) := sorry
    Unramified_affinoid.{u₁, u₁, u₁} (A := A) (B := A ⧸ I) (Pair.quotientHom S I) ∧
      ¬ Smooth_affinoid.{u₁, u₁, u₁} (A := A) (B := A ⧸ I) (Pair.quotientHom S I) ∧
      ¬ Etale_affinoid.{u₁, u₁, u₁} (A := A) (B := A ⧸ I) (Pair.quotientHom S I) := sorry

/-- The closed unit disc over `ℚ_p` is smooth and not unramified over the point. -/
example (p : ℕ) [Fact p.Prime]
    (f : Pair.Hom (Pair.powerBounded ℚ_[p])
      (Pair.powerBounded (restrictedMvPowerSeriesCompletion 1 ℚ_[p])))
    (hf : f.toRingHom = algebraMap ℚ_[p] (restrictedMvPowerSeriesCompletion 1 ℚ_[p])) :
    Smooth_affinoid f ∧ ¬ Unramified_affinoid f ∧ ¬ Etale_affinoid f := sorry

end InfinitesimalLifting

/-! ### R0.6 Affinoid charts, adic morphisms and the finite-type classes
(*adic-morphism*, *finite-type-morphism-classes*, *locally-finite-presentation*,
*locally-noetherian-adic-space*, *locally-huber-standard*) -/

open CategoryTheory Limits TopologicalSpace Opposite TauCeti.ValuationSpectrum


/-- A complete sheafy affinoid presentation `(A, A⁺)` with a pair of definition inside `A⁺`. -/
structure Affinoid where
  /-- The complete Huber ring `A`. -/
  ring : Type w
  [commRing : CommRing ring]
  [uniformSpace : UniformSpace ring]
  [uniformAdd : IsUniformAddGroup ring]
  [topologicalRing : IsTopologicalRing ring]
  [huberRing : IsHuberRing ring]
  [complete : CompleteSpace ring]
  [hausdorff : T2Space ring]
  /-- The Huber pair `(A, A⁺)`. -/
  pair : Pair ring
  /-- A pair of definition of `A`. -/
  basis : PairOfDefinition ring
  basis_le : basis.ringOfDefinition ≤ pair.plus
  /-- The structure presheaf of `Spa(A, A⁺)` is a sheaf. -/
  sheafy : TauCeti.PreAdicSpace.isSheafy
    (presentationLimitPreAdicSpace basis pair.plus
      pair.isRingOfIntegralElements.isPowerBounded_of_mem basis_le)

attribute [instance] Affinoid.commRing Affinoid.uniformSpace Affinoid.uniformAdd
  Affinoid.topologicalRing Affinoid.huberRing Affinoid.complete Affinoid.hausdorff

/-- The affinoid adic space `Spa(A, A⁺)`. -/
def Affinoid.spa (A : Affinoid.{w}) : TauCeti.AdicSpace.{w} :=
  ⟨presentationLimitPreAdicSpace A.basis A.pair.plus
      A.pair.isRingOfIntegralElements.isPowerBounded_of_mem A.basis_le,
    A.sheafy, (isPreAdic_presentationLimitPreAdicSpace _ _ _ _).isLocallyAffinoid⟩

/-- The canonical map from `A` to the global sections of `Spa(A, A⁺)`. -/
abbrev Affinoid.coeff (A : Affinoid.{w}) : A.ring →+*
    A.spa.obj.toRingPresheafedSpace.presheaf.obj (op ⊤) :=
  (toPresentationLimit (P := A.basis) A.pair.plus ⊤).hom.val

/-- `g : Spa(B, B⁺) → Spa(A, A⁺)` induces `φ : (A, A⁺) → (B, B⁺)` on global sections. -/
def Affinoid.IsInducedBy {A B : Affinoid.{w}} (g : B.spa ⟶ A.spa)
    (φ : Pair.Hom A.pair B.pair) : Prop :=
  ∀ a : A.ring, (TauCeti.PreAdicSpace.toRingPresheafedSpaceHom g.hom.toHom).c.app (op ⊤)
    (A.coeff a) = B.coeff (φ.toRingHom a)

/-- An affinoid chart: an open immersion of an affinoid adic space. -/
structure Chart (X : TauCeti.AdicSpace.{w}) where
  /-- The affinoid presentation. -/
  affinoid : Affinoid.{w}
  /-- The open immersion. -/
  ι : affinoid.spa ⟶ X
  isOpenImmersion : TauCeti.PreAdicSpace.IsOpenImmersion ι.hom

/-- A chart of a morphism: charts of source and target, a morphism between them that induces a
morphism of Huber pairs on global sections, and the commuting square. -/
structure HomChart {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) where
  /-- The source chart. -/
  source : Chart X
  /-- The target chart. -/
  target : Chart Y
  /-- The restriction of `f` to the charts. -/
  map : source.affinoid.spa ⟶ target.affinoid.spa
  /-- The coordinate homomorphism. -/
  ringHom : Pair.Hom target.affinoid.pair source.affinoid.pair
  isInducedBy : Affinoid.IsInducedBy map ringHom
  commutes : source.ι ≫ f = map ≫ target.ι

/-- `X` is *locally noetherian* if it is covered by charts of noetherian type
(Zavyalov24, Definition 5.1; Huber 1994, Proposition 3.7). -/
def IsLocallyNoetherian (X : TauCeti.AdicSpace.{w}) : Prop :=
  ∀ x : X.obj, ∃ c : Chart X, x ∈ Set.range c.ι.hom.base ∧
    Huber.IsNoetherianType c.affinoid.ring

/-- `X` is *locally Huber-standard* if it is covered by charts whose coordinate rings lie in
Huber's standing class `Huber.IsHuberStandard` (Huber 1996, (1.1.1)). -/
def IsLocallyHuberStandard (X : TauCeti.AdicSpace.{w}) : Prop :=
  ∀ x : X.obj, ∃ c : Chart X, x ∈ Set.range c.ι.hom.base ∧
    Huber.IsHuberStandard c.affinoid.ring

/-- `X` is *analytic* if every point has a Tate affinoid neighbourhood (Huber 1996, §1.1). -/
def IsAnalytic (X : TauCeti.AdicSpace.{w}) : Prop :=
  ∀ x : X.obj, ∃ c : Chart X, x ∈ Set.range c.ι.hom.base ∧ IsTateRing c.affinoid.ring

/-- `f` is *adic* if it is chart-locally given by adic homomorphisms (Huber 1994, §3, p. 532;
Huber 1996, §1.2). -/
def IsAdic {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  ∀ x : X.obj, ∃ c : HomChart f, x ∈ Set.range c.source.ι.hom.base ∧
    Huber.IsAdicHom c.ringHom.toRingHom

/-- `f` is *locally of weakly finite type* (Wedhorn, Definition 8.48(1); Huber 1996, Definition
1.2.1). -/
def LocallyOfWeaklyFiniteType {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  ∀ x : X.obj, ∃ c : HomChart f, x ∈ Set.range c.source.ι.hom.base ∧
    IsTopologicallyFiniteType c.ringHom.toRingHom

/-- `f` is *locally of +weakly finite type* (Huber 1996, Definition 1.2.1(ii)). -/
def LocallyOfPlusWeaklyFiniteType {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  ∀ x : X.obj, ∃ c : HomChart f, x ∈ Set.range c.source.ι.hom.base ∧
    LocallyOfPlusWeaklyFiniteType_affinoid c.ringHom

/-- Preimages of quasi-compact opens are quasi-compact. -/
def QuasiCompact {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  ∀ U : Opens Y.obj, IsCompact (U : Set Y.obj) → IsCompact (f.hom.base ⁻¹' (U : Set Y.obj))

/-- Topological finite type of complete pairs: a continuous open surjection from a completed
weighted restricted power series ring, with `B⁺` the integral closure of the closure of the
subring generated by `φ(A⁺)` and the weighted variables (Huber 1994, §3, p. 535;
AdicSpaces §5.2). -/
def IsTopologicallyFiniteTypePair {A B : Affinoid.{w}} (φ : Pair.Hom A.pair B.pair) : Prop :=
  ∃ (n : ℕ) (M : Fin n → Set A.ring) (hM : IsWeightFamily M),
    (∀ i, (M i).Finite) ∧
    ∃ θ : UniformSpace.Completion (weightedRestrictedSubring M hM) →+* B.ring,
      Continuous θ ∧ IsOpenQuotientMap θ ∧
      (∀ a, θ (UniformSpace.Completion.coeRingHom (weightedC M hM a)) = φ.toRingHom a) ∧
      B.pair.plus = (integralClosure
        (Subring.topologicalClosure (Subring.closure
          (φ.toRingHom '' (A.pair.plus : Set A.ring) ∪
            {b | ∃ (i : Fin n) (m : A.ring), m ∈ M i ∧ b =
              θ (UniformSpace.Completion.coeRingHom
                (weightedPolynomialHom M hM (MvPolynomial.C m * MvPolynomial.X i)))})))
        B.ring).toSubring

/-- `f` is *locally of finite type* (Huber 1994, §3, p. 535). -/
def LocallyOfFiniteType {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  ∀ x : X.obj, ∃ c : HomChart f, x ∈ Set.range c.source.ι.hom.base ∧
    IsTopologicallyFiniteTypePair c.ringHom

/-- `f` is *locally of finite presentation*: finite type, witnessed on a target chart in Huber's
standing class (1.1.1), and finitely presented over discrete target charts (Huber 1996, Definition
1.2.1(v)). Huber's definition quantifies over the affinoid charts of his adic spaces, all of which
are in the class; demanding the witness chart to be in the class keeps that reading. Without it the
discrete clause can be switched off by a non-discrete, non-standard chart such as the whole of
`Spa(ℤ_p × E)` for `E` the eventually constant `𝔽_p`-sequences. -/
def LocallyOfFinitePresentation {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  ∀ x : X.obj, ∃ c : HomChart f, x ∈ Set.range c.source.ι.hom.base ∧
    Huber.IsHuberStandard c.target.affinoid.ring ∧
    IsTopologicallyFiniteTypePair c.ringHom ∧
      (DiscreteTopology c.target.affinoid.ring → c.ringHom.toRingHom.FinitePresentation)

/-- The standing-class clause is a condition on the base: if the identity of `S` is locally of
finite presentation then `S` is locally Huber-standard, since the target chart of a witness for
the identity also contains the point (the chart square commutes). -/
example (S : TauCeti.AdicSpace.{w}) (h : LocallyOfFinitePresentation (𝟙 S)) :
    IsLocallyHuberStandard S := by
  intro s
  obtain ⟨c, ⟨t, rfl⟩, hstd, -, -⟩ := h s
  refine ⟨c.target, ⟨c.map.hom.base t, ?_⟩, hstd⟩
  have hc := congrArg (fun φ => φ.hom.base t) c.commutes
  simpa using hc.symm

/-- `X` is covered by charts with stably sheafy coordinate rings. -/
def HasStablySheafyCharts (X : TauCeti.AdicSpace.{w}) : Prop :=
  ∀ x : X.obj, ∃ c : Chart X, x ∈ Set.range c.ι.hom.base ∧
    IsStablySheafyRing.{w, w} c.affinoid.ring

/-- A morphism of affinoids induced by `φ` is adic exactly when `φ` is (Huber 1994, §3). -/
theorem IsAdic.iff_isAdicHom {A B : Affinoid.{w}} (g : B.spa ⟶ A.spa)
    (φ : Pair.Hom A.pair B.pair) (hg : Affinoid.IsInducedBy g φ) :
    IsAdic g ↔ Huber.IsAdicHom φ.toRingHom := sorry

/-- Every morphism into an analytic adic space is adic (Huber 1996, §1.2; Wedhorn,
Proposition 6.25). -/
theorem IsAdic.of_isAnalytic {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (hY : IsAnalytic Y) :
    IsAdic f := sorry

/-- Local weak finite type implies adic (Huber 1996, §1.2, after Definition 1.2.1). -/
theorem LocallyOfWeaklyFiniteType.isAdic {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    (hf : LocallyOfWeaklyFiniteType f) : IsAdic f := sorry

/-- Local finite type implies local +weakly finite type (Huber 1996, §1.2, after Definition
1.2.1). -/
theorem LocallyOfFiniteType.locallyOfPlusWeaklyFiniteType {X Y : TauCeti.AdicSpace.{w}}
    (f : X ⟶ Y) (hf : LocallyOfFiniteType f) : LocallyOfPlusWeaklyFiniteType f := sorry

/-- Over an analytic, locally Huber-standard base, finite presentation is finite type (Huber 1996,
Definition 1.2.1(v)); the standing-class clause is then witnessed on every chart. -/
theorem locallyOfFinitePresentation_iff_of_isAnalytic {X Y : TauCeti.AdicSpace.{w}}
    (f : X ⟶ Y) (hY : IsAnalytic Y) (hY' : IsLocallyHuberStandard Y) :
    LocallyOfFinitePresentation f ↔ LocallyOfFiniteType f :=
  sorry

/-- `Spa` of a complete pair of noetherian type is locally noetherian (Huber 1994, §3). -/
theorem IsLocallyNoetherian.spa (A : Affinoid.{w}) [Huber.IsNoetherianType A.ring] :
    IsLocallyNoetherian A.spa := sorry

/-- Noetherian type ascends along local weak finite type (Huber 1994, 3.4(ii)–(iii)). -/
theorem IsLocallyNoetherian.of_locallyOfWeaklyFiniteType {X Y : TauCeti.AdicSpace.{w}}
    (f : X ⟶ Y) (hf : LocallyOfWeaklyFiniteType f) (hY : IsLocallyNoetherian Y) :
    IsLocallyNoetherian X := sorry

/-- Locally noetherian adic spaces have stably sheafy charts (Huber 1994, Theorem 2.2; Wedhorn,
Definition 8.54). -/
theorem IsLocallyNoetherian.isStablySheafy {X : TauCeti.AdicSpace.{w}}
    (hX : IsLocallyNoetherian X) : HasStablySheafyCharts X := sorry

/-- Locally Huber-standard adic spaces are locally noetherian. -/
theorem IsLocallyHuberStandard.isLocallyNoetherian {X : TauCeti.AdicSpace.{w}}
    (hX : IsLocallyHuberStandard X) : IsLocallyNoetherian X :=
  fun x ↦ (hX x).imp fun _ hc ↦
    ⟨hc.1, @Huber.IsHuberStandard.isNoetherianType _ _ _ _ _ hc.2⟩

/-- `Spa` of a complete pair in Huber's standing class is locally Huber-standard. -/
theorem IsLocallyHuberStandard.spa (A : Affinoid.{w}) [Huber.IsHuberStandard A.ring] :
    IsLocallyHuberStandard A.spa := sorry

/-- Local finite presentation includes local finite type (Huber 1996, §1.2, after Definition
1.2.1). -/
theorem LocallyOfFinitePresentation.locallyOfFiniteType {X Y : TauCeti.AdicSpace.{w}}
    {f : X ⟶ Y} (hf : LocallyOfFinitePresentation f) : LocallyOfFiniteType f :=
  fun x ↦ (hf x).imp fun _ hc ↦ ⟨hc.1, hc.2.2.1⟩

/-! ### R0.7 Fibre products
(*fibre-products-existence*, *fibre-product-points*, *base-change-stability*) -/

/-- Fibre products exist when `f` is locally of finite type, or locally of weakly finite type and
`g` adic, and `Y` has stably sheafy charts (Huber 1994, Proposition 3.7; Huber 1996, Proposition
1.2.2). -/
theorem hasPullback_of_finiteType {X Y S : TauCeti.AdicSpace.{w}}
    (f : X ⟶ S) (g : Y ⟶ S) (hY : HasStablySheafyCharts Y)
    (hf : LocallyOfFiniteType f ∨ (LocallyOfWeaklyFiniteType f ∧ IsAdic g)) :
    HasPullback f g := sorry

/-- Compatible pairs of points lift to the fibre product; the lift need not be unique
(Huber 1996, Corollary 1.2.3(iii)(d)). -/
theorem exists_pullback_point {X Y S Z : TauCeti.AdicSpace.{w}} (f : X ⟶ S) (g : Y ⟶ S)
    (p : Z ⟶ X) (q : Z ⟶ Y) (hs : IsPullback p q f g) (hf : LocallyOfWeaklyFiniteType f)
    (hg : IsAdic g) (hY : HasStablySheafyCharts Y) (x : X.obj) (y : Y.obj)
    (hxy : f.hom.base x = g.hom.base y) :
    ∃ z : Z.obj, p.hom.base z = x ∧ q.hom.base z = y := sorry

/-- Adicness is stable under base change along a morphism locally of weakly finite type (Huber
1996, Corollary 1.2.3(iii)(a); Wedhorn, Remark 8.57(1), with the roles of `f` and `g` exchanged). -/
theorem IsAdic.baseChange {X Y Z W : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (g : Z ⟶ Y)
    (p : W ⟶ X) (q : W ⟶ Z) (hs : IsPullback p q f g) (hf : IsAdic f)
    (hg : LocallyOfWeaklyFiniteType g) (hX : HasStablySheafyCharts X) : IsAdic q := sorry

/-- Local weak finite type is stable under adic base change from a space with stably sheafy charts
(Huber 1996, Corollary 1.2.3(iii)(a); Wedhorn, Remark 8.57(1)). -/
theorem LocallyOfWeaklyFiniteType.baseChange {X Y Z W : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    (g : Z ⟶ Y) (p : W ⟶ X) (q : W ⟶ Z) (hs : IsPullback p q f g)
    (hf : LocallyOfWeaklyFiniteType f) (hg : IsAdic g) (hZ : HasStablySheafyCharts Z) :
    LocallyOfWeaklyFiniteType q := sorry

/-- Base change along the identity: the fibre product over the identity is the source. -/
example {X S Z : TauCeti.AdicSpace.{w}} (f : X ⟶ S)
    (p : Z ⟶ X) (q : Z ⟶ S) (hs : IsPullback p q f (𝟙 S)) (x : X.obj) :
    ∃! z : Z.obj, p.hom.base z = x ∧ q.hom.base z = f.hom.base x := sorry

/-! ### R0.8 Closed immersions and the diagonal
(*closed-adic-subspaces-and-embeddings*, *diagonal-locally-closed*) -/

/-- A closed immersion is affinoid-locally an open quotient map of Huber pairs, with the quotient
plus ring and the whole inverse image as source (AdicSpaces §5.1; Huber 1996, (1.4.1)). -/
def IsClosedImmersion {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  ∀ y : Y.obj, ∃ c : HomChart f, y ∈ Set.range c.target.ι.hom.base ∧
    Set.range c.source.ι.hom.base = f.hom.base ⁻¹' Set.range c.target.ι.hom.base ∧
    IsOpenQuotientMap c.ringHom.toRingHom ∧
    c.source.affinoid.pair.plus = (integralClosure
      (c.target.affinoid.pair.plus.map c.ringHom.toRingHom) c.source.affinoid.ring).toSubring

/-- A locally closed immersion is a closed immersion into an open subspace. -/
def IsLocallyClosedImmersion {T X : TauCeti.AdicSpace.{w}} (f : T ⟶ X) : Prop :=
  ∃ (U : TauCeti.AdicSpace.{w}) (i : T ⟶ U) (j : U ⟶ X),
    IsClosedImmersion i ∧ TauCeti.PreAdicSpace.IsOpenImmersion j.hom ∧ i ≫ j = f

/-- A locally closed immersion is injective on points. -/
example {T X : TauCeti.AdicSpace.{w}} (f : T ⟶ X) (a b : T.obj)
    (hne : a ≠ b) (heq : f.hom.base a = f.hom.base b) : ¬ IsLocallyClosedImmersion f := sorry

/-- The discrete square-zero extension `A = 𝔽_p ⊕ ⊕_ℕ 𝔽_p` is in Huber's standing class, but the
kernel of its projection to `𝔽_p` is not a finitely generated ideal. On the one-point space
`Spa(A, A)` this kernel is the only stalk of the admissible kernel sheaf of the closed immersion of
`Spa(𝔽_p, 𝔽_p)`, which is therefore not coherent. -/
example (p : ℕ) [Fact p.Prime] :
    letI : TopologicalSpace (TrivSqZeroExt (ZMod p) (ℕ →₀ ZMod p)) := ⊥
    haveI : DiscreteTopology (TrivSqZeroExt (ZMod p) (ℕ →₀ ZMod p)) := ⟨rfl⟩
    ∃ _ : IsHuberRing (TrivSqZeroExt (ZMod p) (ℕ →₀ ZMod p)),
      Huber.IsHuberStandard (TrivSqZeroExt (ZMod p) (ℕ →₀ ZMod p)) ∧
        ¬ (RingHom.ker (TrivSqZeroExt.fstHom (ZMod p) (ZMod p) (ℕ →₀ ZMod p))).FG := sorry

/-- The diagonal of a morphism locally of weakly finite type is a locally closed immersion
(Zavyalov-Q, Lemma B.7.3). -/
theorem diagonal_locallyClosed {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) [HasPullback f f]
    (hf : LocallyOfWeaklyFiniteType f) (hX : HasStablySheafyCharts X) :
    IsLocallyClosedImmersion (pullback.diagonal f) := sorry

/-! ### R0.10, R0.12 Separated, universally closed, partially proper and proper morphisms
(*separated-morphism*, *universally-closed-morphism*, *universally-specializing-morphism*,
*partially-proper-morphism*, *universally-closed-and-proper-morphism*,
*proper-iff-partially-proper-quasi-compact*, *separated-diagonal-closed-embedding*,
*proper-comp*, *proper-base-change*, *closed-embedding-proper*) -/

/-- `f` is *separated*: locally of weakly finite type, with `X` covered by stably sheafy affinoids
(so that `X ×_Y X` exists) and closed diagonal (Huber 1996, Definition 1.3.1, under (1.1.1)). -/
def IsSeparated {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  LocallyOfWeaklyFiniteType f ∧ HasStablySheafyCharts X ∧
    ∃ h : HasPullback f f, IsClosed (Set.range (@pullback.diagonal _ _ _ _ f h).hom.base)

/-- `f` is *universally closed*: locally of weakly finite type and closed after every adic base
change from a space with stably sheafy charts (Huber 1996, Definition 1.3.2(i), under (1.1.1); the
test spaces are stable in the sense of Wedhorn, Definition 8.54). -/
def UniversallyClosed {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  LocallyOfWeaklyFiniteType f ∧
    ∀ (Z W : TauCeti.AdicSpace.{w}) (g : Z ⟶ Y) (p : W ⟶ X) (q : W ⟶ Z),
      HasStablySheafyCharts Z → IsAdic g → IsPullback p q f g → IsClosedMap q.hom.base

/-- `f` is *universally specializing*: locally of weakly finite type and specializing after every
adic base change from a space with stably sheafy charts (Huber 1996, Definition 1.3.3(i), under
(1.1.1); the test spaces are stable in the sense of Wedhorn, Definition 8.54). -/
def UniversallySpecializing {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  LocallyOfWeaklyFiniteType f ∧
    ∀ (Z W : TauCeti.AdicSpace.{w}) (g : Z ⟶ Y) (p : W ⟶ X) (q : W ⟶ Z),
      HasStablySheafyCharts Z → IsAdic g → IsPullback p q f g → SpecializingMap q.hom.base

/-- `f` is *partially proper* (Huber 1996, Definition 1.3.3(ii)). -/
def IsPartiallyProper {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  LocallyOfPlusWeaklyFiniteType f ∧ IsSeparated f ∧ UniversallySpecializing f

/-- `f` is *proper* (Huber 1996, Definition 1.3.2(ii)). -/
def IsProper {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  QuasiCompact f ∧ LocallyOfPlusWeaklyFiniteType f ∧ IsSeparated f ∧ UniversallyClosed f

/-- Separatedness includes local weak finite type. -/
example {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    (hf : ¬ LocallyOfWeaklyFiniteType f) : ¬ IsSeparated f :=
  fun h ↦ hf h.1

/-- Proper is partially proper and quasi-compact (Huber 1996, Lemma 1.3.4). -/
theorem IsProper.iff_isPartiallyProper_and_quasiCompact {X Y : TauCeti.AdicSpace.{w}}
    (f : X ⟶ Y) : IsProper f ↔ IsPartiallyProper f ∧ QuasiCompact f := sorry

/-- The diagonal of a separated morphism is a closed immersion (Zavyalov-Q, Lemma B.6.14,
Corollary B.7.4). -/
theorem IsSeparated.iff_closedImmersion_diagonal {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    [HasPullback f f] (hf : LocallyOfWeaklyFiniteType f) (hX : HasStablySheafyCharts X) :
    IsSeparated f ↔ IsClosedImmersion (pullback.diagonal f) := sorry

/-- Composites of proper morphisms are proper (Stacks, Tag 01W3, for the scheme analogue). The
standing class of R0.12 is carried by the definitions, so no hypothesis on `Z` is needed:
`IsSeparated` gives `X` and `Y` stably sheafy charts, and `UniversallyClosed` tests only base
changes from spaces with stably sheafy charts. -/
theorem IsProper.comp {X Y Z : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (g : Y ⟶ Z)
    (hf : IsProper f) (hg : IsProper g) : IsProper (f ≫ g) := sorry

/-- Proper morphisms are stable under adic base change (Huber 1996, Proposition 1.2.2; Stacks,
Tag 01W4). -/
theorem IsProper.baseChange {X Y Z W : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (g : Z ⟶ Y)
    (p : W ⟶ X) (q : W ⟶ Z) (hs : IsPullback p q f g) (hf : IsProper f) (hg : IsAdic g)
    (hZ : HasStablySheafyCharts Z) : IsProper q := sorry

/-- Closed immersions are proper (Huber 1996, Lemma 1.4.5; Zavyalov-Q, Corollary B.6.10(1)). -/
theorem IsClosedImmersion.isProper {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    (hf : IsClosedImmersion f) (hY : HasStablySheafyCharts Y) : IsProper f := sorry

/-! ### R0.11 Valuation rings and the valuative criteria
(*adic-valuation-rings-and-centres*, *valuation-ring-space-spectral*,
*valuative-criterion-separated*, *valuative-criterion-specializing*,
*separated-proper-partially-proper*) -/

/-- A point `x` with a valuation ring of `k(x)` inside the valuation ring of `v_x`
(Huber 1996, Definition 1.3.5). -/
structure ValuationRing (X : TauCeti.AdicSpace.{w}) where
  /-- The point. -/
  pt : X.obj
  /-- The valuation ring of the residue field. -/
  ring : ValuationSubring (IsLocalRing.ResidueField
    (X.obj.toRingPresheafedSpace.presheaf.stalk pt))
  le_plus : ring ≤ (X.obj.valuation pt).valuation.valuationSubring

/-- Huber's subbasic set `{(x, V) : x ∈ U, h(x) ∈ V}`. -/
def ValuationRing.basicOpen (X : TauCeti.AdicSpace.{w}) (U : Opens X.obj)
    (h : X.obj.toRingPresheafedSpace.presheaf.obj (op U)) : Set (ValuationRing X) :=
  {r | ∃ hx : r.pt ∈ U, IsLocalRing.residue _
    (X.obj.toRingPresheafedSpace.presheaf.germ U r.pt hx h) ∈ r.ring}

instance ValuationRing.instTopologicalSpace (X : TauCeti.AdicSpace.{w}) :
    TopologicalSpace (ValuationRing X) := TopologicalSpace.generateFrom
      {V | ∃ (U : Opens X.obj) (h : X.obj.toRingPresheafedSpace.presheaf.obj (op U)),
        V = ValuationRing.basicOpen X U h}

/-- The section `0` cuts out the whole preimage of `U`. -/
example (X : TauCeti.AdicSpace.{w}) (U : Opens X.obj) :
    ValuationRing.basicOpen X U 0 = ValuationRing.pt ⁻¹' (U : Set X.obj) := by
  ext r
  simp only [ValuationRing.basicOpen, Set.mem_ofPred_eq, Set.mem_preimage, map_zero,
    zero_mem, exists_prop, and_true, SetLike.mem_coe]

/-- `(x, V)` has *centre* `y ∈ Y` under `f` if `f(x)` specialises to `y` and `V` dominates the
valuation ring of `v_y` (Huber 1996, Definition 1.3.5). -/
def ValuationRing.IsCentre {X Y : TauCeti.AdicSpace.{w}} (r : ValuationRing X)
    (f : X ⟶ Y) (y : Y.obj) : Prop :=
  ∃ h : f.hom.base r.pt ⤳ y,
    ∃ i : IsLocalRing.ResidueField (Y.obj.toRingPresheafedSpace.presheaf.stalk y) →+*
      IsLocalRing.ResidueField (X.obj.toRingPresheafedSpace.presheaf.stalk r.pt),
      i.comp (IsLocalRing.residue _) =
        (IsLocalRing.residue _).comp ((f.hom.stalkMap r.pt).hom.comp
          (Y.obj.toRingPresheafedSpace.presheaf.stalkSpecializes h).hom) ∧
      r.ring.comap i = (Y.obj.valuation y).valuation.valuationSubring

/-- The space of valuation rings of a quasi-compact quasi-separated analytic adic space is
spectral (Huber 1996, Lemma 1.3.12). -/
theorem ValuationRing.spectralSpace (X : TauCeti.AdicSpace.{w})
    [CompactSpace X.obj] [QuasiSeparatedSpace X.obj] (hX : IsAnalytic X) :
    SpectralSpace (ValuationRing X) := sorry

/-- Valuative criterion for separatedness (Huber 1996, Proposition 1.3.7). -/
theorem IsSeparated.iff_valuativeCriterion {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    [HasPullback f f] (hqs : QuasiCompact (pullback.diagonal f)) (hX : IsAnalytic X)
    (hY : IsAnalytic Y) (hc : HasStablySheafyCharts X) (hf : LocallyOfWeaklyFiniteType f) :
    IsSeparated f ↔ ∀ (r : ValuationRing X) (z z' : X.obj), r.IsCentre (𝟙 X) z →
      r.IsCentre (𝟙 X) z' → f.hom.base z = f.hom.base z' → z = z' := sorry

/-- Valuative criterion for universal specialization (Huber 1996, Proposition 1.3.8). -/
theorem UniversallySpecializing.iff_valuativeCriterion {X Y : TauCeti.AdicSpace.{w}}
    (f : X ⟶ Y) (hX : IsAnalytic X) (hY : IsAnalytic Y) (hf : LocallyOfWeaklyFiniteType f) :
    UniversallySpecializing f ↔ ∀ (r : ValuationRing X) (y : Y.obj), r.IsCentre f y →
      ∃ z : X.obj, r.IsCentre (𝟙 X) z ∧ f.hom.base z = y := sorry

/-- Valuative criterion for partial properness (Huber 1996, Corollary 1.3.9). -/
theorem IsPartiallyProper.iff_valuativeCriterion {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    [HasPullback f f] (hqs : QuasiCompact (pullback.diagonal f)) (hX : IsAnalytic X)
    (hY : IsAnalytic Y) (hc : HasStablySheafyCharts X) (hf : LocallyOfPlusWeaklyFiniteType f) :
    IsPartiallyProper f ↔ ∀ (r : ValuationRing X) (y : Y.obj), r.IsCentre f y →
      ∃! z : X.obj, r.IsCentre (𝟙 X) z ∧ f.hom.base z = y := sorry

/-! ### R0.13–R0.14 Finite and quasi-finite morphisms
(*finite-morphism*, *finite-morphisms*, *closed-embedding-finite*, *quasi-finite-morphism*,
*quasi-finite-fibre-criteria*, *quasi-finite-and-finiteness-criteria*) -/

/-- `f` is *finite*: over target charts covering `Y`, the whole inverse image is one affinoid
chart and the coordinate map is a finite morphism of Huber pairs (Huber 1996, (1.4.4)). -/
def IsFinite {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  ∀ y : Y.obj, ∃ c : HomChart f, y ∈ Set.range c.target.ι.hom.base ∧
    Set.range c.source.ι.hom.base = f.hom.base ⁻¹' Set.range c.target.ι.hom.base ∧
    Huber.Pair.Hom.IsFinite c.ringHom

/-- `f` is *locally quasi-finite*: locally of weakly finite type with discrete fibres
(Huber 1996, Definition 1.5.1). -/
def LocallyQuasiFinite {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  LocallyOfWeaklyFiniteType f ∧ ∀ y : Y.obj, DiscreteTopology (f.hom.base ⁻¹' {y})

/-- Closed immersions are finite (Huber 1996, Lemma 1.4.5(iii)). -/
theorem IsFinite.of_isClosedImmersion {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    (hf : IsClosedImmersion f) : IsFinite f := sorry

/-- Finite morphisms to analytic spaces are proper (Huber 1996, Lemma 1.4.5(ii)). -/
theorem IsFinite.isProper {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (hf : IsFinite f)
    (hY : IsAnalytic Y) (hc : HasStablySheafyCharts Y) : IsProper f := sorry

/-- Over a locally noetherian analytic base, finite is proper and locally quasi-finite
(Huber 1996, Proposition 1.5.5). -/
theorem IsFinite.iff_isProper_and_quasiFinite {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    (hX : IsAnalytic X) (hY : IsAnalytic Y) (hN : IsLocallyNoetherian Y)
    (hf : LocallyOfFiniteType f) : IsFinite f ↔ IsProper f ∧ LocallyQuasiFinite f := sorry

/-- Quasi-compact local quasi-finiteness is finiteness of the fibres (Huber 1996, Lemma 1.5.2). -/
theorem LocallyQuasiFinite.iff_finite_fibres {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    (hX : IsAnalytic X) (hY : IsAnalytic Y) (hf : LocallyOfWeaklyFiniteType f)
    (hq : QuasiCompact f) : LocallyQuasiFinite f ↔ ∀ y : Y.obj, (f.hom.base ⁻¹' {y}).Finite :=
  sorry

/-! ### R0.16–R0.17 Flat, unramified, smooth and étale morphisms
(*flat-morphism*, *open-embedding-etale*, *immersion-unramified*, *etale-smooth-composition*,
*smooth-etale-base-change*, *etale-flat-unramified*, *smooth-morphism-open*,
*etale-local-structure*, *finite-etale-algebra-comparison*, *etale-standing-class-control*) -/

/-- `f` is *flat* if every stalk map is flat (Zavyalov-Q, Definition B.4.1). -/
def Flat {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  ∀ x : X.obj, (f.hom.stalkMap x).hom.Flat

/-- `f` is *unramified*: locally of finite type with chart-local unique lifting
(Huber 1996, Definition 1.6.5). -/
def Unramified {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  LocallyOfFiniteType f ∧ ∀ x : X.obj, ∃ c : HomChart f,
    x ∈ Set.range c.source.ι.hom.base ∧ Unramified_affinoid.{w, w, w} c.ringHom

/-- `f` is *smooth*: locally of finite presentation with chart-local lifting
(Huber 1996, Definition 1.6.5). -/
def Smooth {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  LocallyOfFinitePresentation f ∧ ∀ x : X.obj, ∃ c : HomChart f,
    x ∈ Set.range c.source.ι.hom.base ∧ Smooth_affinoid.{w, w, w} c.ringHom

/-- `f` is *étale*: locally of finite presentation with chart-local unique lifting
(Huber 1996, Definition 1.6.5). -/
def Etale {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) : Prop :=
  LocallyOfFinitePresentation f ∧ ∀ x : X.obj, ∃ c : HomChart f,
    x ∈ Set.range c.source.ι.hom.base ∧ Etale_affinoid.{w, w, w} c.ringHom

/-- Open immersions between locally Huber-standard spaces are étale (Huber 1996, Proposition
1.6.7(i), under the standing assumption (1.1.1)). -/
theorem Etale.of_isOpenImmersion {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    [TauCeti.PreAdicSpace.IsOpenImmersion f.hom] (hX : IsLocallyHuberStandard X)
    (hY : IsLocallyHuberStandard Y) : Etale f := sorry

/-- Closed immersions between locally Huber-standard spaces are unramified (Huber 1996,
Proposition 1.6.7(i), under (1.1.1)). -/
theorem IsClosedImmersion.unramified {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    (hf : IsClosedImmersion f) (hX : IsLocallyHuberStandard X) (hY : IsLocallyHuberStandard Y) :
    Unramified f := sorry

/-- Composites of étale morphisms of locally Huber-standard spaces are étale (Huber 1996,
Proposition 1.6.7(ii), under (1.1.1)). -/
theorem Etale.comp {X Y Z : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (g : Y ⟶ Z)
    (hf : Etale f) (hg : Etale g) (hX : IsLocallyHuberStandard X)
    (hY : IsLocallyHuberStandard Y) (hZ : IsLocallyHuberStandard Z) : Etale (f ≫ g) := sorry

/-- Étale morphisms are stable under base change when all four spaces are locally
Huber-standard (Huber 1996, Proposition 1.6.7(iv), under (1.1.1)). Such a square exists by case
(a) of `hasPullback_of_finiteType`: `f` is locally of finite type and `Z`, being locally
noetherian, has stably sheafy charts. The class on `Y` makes the relation ideals of the charts
of `f` finitely generated, which is the condition under which finite presentation passes to
`q`. -/
theorem Etale.baseChange {X Y Z W : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (g : Z ⟶ Y)
    (p : W ⟶ X) (q : W ⟶ Z) (hs : IsPullback p q f g) (hf : Etale f)
    (hX : IsLocallyHuberStandard X) (hY : IsLocallyHuberStandard Y)
    (hZ : IsLocallyHuberStandard Z) (hW : IsLocallyHuberStandard W) : Etale q := sorry

/-- Under the hypotheses of `Etale.baseChange` the fibre product exists, by case (a) of
`hasPullback_of_finiteType`. -/
example {X Y Z : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (g : Z ⟶ Y) (hf : Etale f)
    (hZ : IsLocallyHuberStandard Z) : HasPullback f g :=
  hasPullback_of_finiteType f g hZ.isLocallyNoetherian.isStablySheafy
    (Or.inl hf.1.locallyOfFiniteType)

/-- For analytic, locally Huber-standard spaces, étale is flat and unramified (Huber 1996,
Proposition 1.7.5, under (1.1.1)). For analytic spaces the standing class is the same as being
locally noetherian. -/
theorem Etale.iff_flat_and_unramified {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y)
    (hX : IsAnalytic X) (hY : IsAnalytic Y) (hXs : IsLocallyHuberStandard X)
    (hYs : IsLocallyHuberStandard Y) (hf : LocallyOfFiniteType f) :
    Etale f ↔ Flat f ∧ Unramified f := sorry

/-- Smooth morphisms of locally Huber-standard spaces are open (Huber 1996, (1.7.7),
Proposition 1.7.8, Lemma 1.7.9, under (1.1.1)). -/
theorem Smooth.isOpenMap {X Y : TauCeti.AdicSpace.{w}} (f : X ⟶ Y) (hf : Smooth f)
    (hX : IsLocallyHuberStandard X) (hY : IsLocallyHuberStandard Y) : IsOpenMap f.hom.base :=
  sorry

/-- Local structure of étale morphisms: an étale morphism of affinoids whose coordinate rings lie
in Huber's standing class has a standard étale presentation, with as many equations as
variables and an invertible Jacobian determinant (Huber 1996, Proposition 1.7.1, stated for
affinoid rings under (1.1.1)). -/
theorem Etale.exists_standardPresentation (A B : Affinoid.{w})
    (hA : Huber.IsHuberStandard A.ring) (hB : Huber.IsHuberStandard B.ring)
    (φ : Pair.Hom A.pair B.pair) (g : B.spa ⟶ A.spa)
    (hg : Affinoid.IsInducedBy g φ) (hf : Etale g) :
    ∃ (n : ℕ) (M : Fin n → Set A.ring) (hM : IsWeightFamily M),
      (∀ i, (M i).Finite) ∧
      ∃ (p : Fin n → MvPolynomial (Fin n) A.ring)
        (θ : UniformSpace.Completion (weightedRestrictedSubring M hM) →+* B.ring),
        Continuous θ ∧ IsOpenQuotientMap θ ∧
        (∀ a, θ (UniformSpace.Completion.coeRingHom (weightedC M hM a)) = φ.toRingHom a) ∧
        B.pair.plus = (integralClosure (Subring.topologicalClosure (Subring.closure
          ((φ.toRingHom '' (A.pair.plus : Set A.ring)) ∪
            {b | ∃ i m, m ∈ M i ∧ b = θ (UniformSpace.Completion.coeRingHom
              (weightedPolynomialHom M hM (MvPolynomial.C m * MvPolynomial.X i)))})))
          B.ring).toSubring ∧
        (let e := θ.comp (UniformSpace.Completion.coeRingHom.comp (weightedPolynomialHom M hM))
         RingHom.ker θ = Ideal.span (Set.range fun i ↦
           UniformSpace.Completion.coeRingHom (weightedPolynomialHom M hM (p i))) ∧
         IsUnit (Matrix.det (fun i j : Fin n ↦ e (MvPolynomial.pderiv j (p i))))) := sorry

/-- For finite morphisms of affinoids over a complete pair whose ring is noetherian, adic and
algebraic étaleness agree (Huber 1996, Example 1.6.6(ii), stated for noetherian complete f-adic
rings). Complete strongly noetherian Tate rings are noetherian
(`TauCeti.Huber.isNoetherianRing_of_isStronglyNoetherian`), so they are a special case. -/
theorem Etale.iff_ringHom_etale_of_finite (A B : Affinoid.{w}) [IsNoetherianRing A.ring]
    [Huber.IsHuberStandard A.ring] (φ : Pair.Hom A.pair B.pair)
    (hφ : Huber.Pair.Hom.IsFinite φ) (g : B.spa ⟶ A.spa) (hg : Affinoid.IsInducedBy g φ) :
    Etale g ↔ φ.toRingHom.Etale := sorry

/-- The ring-level part of the control showing that the étale package needs Huber's standing
class: on the ring `E` of eventually constant sequences `ℕ → ℤ/p`, the eventual-value map
`ε : E → ℤ/p` has kernel the finitely supported sequences, which is not a finitely generated
ideal. Hence `ℤ_p ×_{𝔽_p} E` is not of finite type over its noetherian ring of definition
`ℤ_p`. -/
example (p : ℕ) [Fact p.Prime] :
    ∃ (E : Subring (ℕ → ZMod p)) (ε : E →+* ZMod p),
      (E : Set (ℕ → ZMod p)) = {a | ∃ N, ∀ n ≥ N, a n = a N} ∧
        (∀ a : E, ∃ N, ∀ n ≥ N, (a : ℕ → ZMod p) n = ε a) ∧ ¬ (RingHom.ker ε).FG := sorry

section DiscMorphisms

/-! Morphisms of the closed unit disc `D = Spa(K⟨T⟩, K°⟨T⟩)` given by `T ↦ q(T)`. -/

variable (K : Type w) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K] [IsHuberRing K]
  (A B : Affinoid.{w})
  (eA : A.ring ≃+* restrictedMvPowerSeriesCompletion 1 K)
  (eB : B.ring ≃+* restrictedMvPowerSeriesCompletion 1 K)
  (hcA : Continuous eA) (hiA : Continuous eA.symm)
  (hcB : Continuous eB) (hiB : Continuous eB.symm)
  (hpA : A.pair.plus.map eA.toRingHom = powerBoundedSubring _)
  (hpB : B.pair.plus.map eB.toRingHom = powerBoundedSubring _)
  (φ : Pair.Hom A.pair B.pair) (g : B.spa ⟶ A.spa) (hg : Affinoid.IsInducedBy g φ)

include hcA hiA hcB hiB hpA hpB hg

/-- `T ↦ T²` is finite, flat and locally quasi-finite. -/
example (hφ : ∀ p : MvPolynomial (Fin 1) K,
    eB (φ.toRingHom (eA.symm (Huber.TateAlgebra.ofMvPolynomial K 1 p))) =
      Huber.TateAlgebra.ofMvPolynomial K 1
        (MvPolynomial.aeval (fun _ : Fin 1 ↦ (MvPolynomial.X 0 : MvPolynomial (Fin 1) K) ^ 2) p)) :
    IsFinite g ∧ Flat g ∧ LocallyQuasiFinite g := sorry

/-- The inclusion of the smaller disc `|T| ≤ |ϖ|` (`T ↦ ϖT`) is étale but not finite, and the
ring map is not of finite type. -/
example (ϖ : K) (hϖ : 0 < ‖ϖ‖ ∧ ‖ϖ‖ < 1)
    (hφ : ∀ p : MvPolynomial (Fin 1) K,
      eB (φ.toRingHom (eA.symm (Huber.TateAlgebra.ofMvPolynomial K 1 p))) =
        Huber.TateAlgebra.ofMvPolynomial K 1
          (MvPolynomial.aeval (fun _ : Fin 1 ↦ MvPolynomial.C ϖ * MvPolynomial.X 0) p)) :
    Etale g ∧ ¬ IsFinite g ∧ ¬ φ.toRingHom.FiniteType := sorry

/-- In characteristic `p` the map `T ↦ T^p` is finite, flat and bijective on points, but neither
unramified nor étale. -/
example (p : ℕ) [Fact p.Prime] [CharP K p]
    (hφ : ∀ q : MvPolynomial (Fin 1) K,
      eB (φ.toRingHom (eA.symm (Huber.TateAlgebra.ofMvPolynomial K 1 q))) =
        Huber.TateAlgebra.ofMvPolynomial K 1
          (MvPolynomial.aeval (fun _ : Fin 1 ↦ (MvPolynomial.X 0 : MvPolynomial (Fin 1) K) ^ p)
            q)) :
    IsFinite g ∧ Flat g ∧ Function.Bijective g.hom.base ∧ ¬ Unramified g ∧ ¬ Etale g := sorry

end DiscMorphisms

section DiscProperness

variable (K : Type w) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K] [IsHuberRing K] (A D : Affinoid.{w})
  (eA : A.ring ≃+* K) (eD : D.ring ≃+* restrictedMvPowerSeriesCompletion 1 K)
  (hcA : Continuous eA) (hiA : Continuous eA.symm)
  (hcD : Continuous eD) (hiD : Continuous eD.symm)
  (hpA : A.pair.plus.map eA.toRingHom = powerBoundedSubring K)
  (hpD : D.pair.plus.map eD.toRingHom = powerBoundedSubring _)
  (φ : Pair.Hom A.pair D.pair)
  (hφ : ∀ a, eD (φ.toRingHom a) = algebraMap K _ (eA a))
  (g : D.spa ⟶ A.spa) (hg : Affinoid.IsInducedBy g φ)

include hcA hiA hcD hiD hpA hpD hφ hg

/-- The closed unit disc with plus ring `K°⟨T⟩` is quasi-compact and separated over `Spa K` but
neither partially proper nor universally closed. -/
example : QuasiCompact g ∧ IsSeparated g ∧ ¬ IsPartiallyProper g ∧ ¬ UniversallyClosed g :=
  sorry

/-- The open unit disc `{|T| < 1}` is partially proper over `Spa K` but not quasi-compact, hence
not proper. -/
example (ϖ : K) (hϖ : 0 < ‖ϖ‖ ∧ ‖ϖ‖ < 1)
    (U : TauCeti.AdicSpace.{w}) (j : U ⟶ D.spa)
    [TauCeti.PreAdicSpace.IsOpenImmersion j.hom]
    (hU : Set.range j.hom.base = {x : D.spa.obj |
      ∃ n : ℕ, 0 < n ∧
        x.val.valuation (eD.symm (Huber.TateAlgebra.ofMvPolynomial K 1 (MvPolynomial.X 0))) ^ n ≤
          x.val.valuation (eD.symm (algebraMap K _ ϖ))}) :
    IsPartiallyProper (j ≫ g) ∧ ¬ QuasiCompact (j ≫ g) ∧ ¬ IsProper (j ≫ g) := sorry

end DiscProperness

end AdicSpace

end

/-! ## Layer R1: Analytification and algebraic correspondences -/

noncomputable section

namespace Huber

open TauCeti.Huber

/-! ### R1.1 Plus rings of affinoid algebras (*tft-plus-ring-power-bounded*) -/

/-- On a `K`-affinoid algebra presented by an open surjection `K⟨T⟩ → A`, a ring of integral
elements makes `(K, K°) → (A, A⁺)` topologically of finite type exactly when `A⁺ = A°`
(Huber 1994, Lemma 4.4; Wedhorn, Definition 7.56). -/
theorem Pair.eq_powerBounded_iff_of_isTopologicallyFiniteType
    (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [NonarchimedeanRing K]
    {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsHuberRing A] {n : ℕ}
    (g : restrictedMvPowerSeriesCompletion n K →+* A) (hg : IsOpenQuotientMap g) (P : Pair A) :
    (∃ (m : ℕ) (g' : restrictedMvPowerSeriesCompletion m K →+* A), IsOpenQuotientMap g' ∧
        P.plus = (integralClosure
          ((powerBoundedSubring (restrictedMvPowerSeriesCompletion m K)).map g') A).toSubring) ↔
      P = Pair.powerBounded A := sorry

end Huber

end

end TauCetiRoadmap.AdicSpacesPartII

import Mathlib
import TauCeti.RingTheory.Kaehler.MapSemilinear

/-!
# DerivedDeRhamCohomology: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
What is recorded here are definitions and theorem signatures against the pinned Mathlib and Tau Ceti;
discharging all of them finishes neither a layer nor the roadmap. `sorry` is expected in this file:
these are goals, not results.

Design choices made explicit here:

* Ordinary differential forms are Mathlib's `exteriorPower B n (KaehlerDifferential A B)`, viewed as
  `A`-modules; the de Rham differential is `A`-linear and strictly alternating also in
  characteristic 2. The differential and the pullback of forms are constructions specified in the
  README (`DeRham.d`, `DeRham.pullback`); here they appear through the predicates
  `DeRham.IsDeRhamDifferential` and `DeRham.IsFormPullback` that characterize them on elementary
  forms, with existence and uniqueness stated as theorems.
* Affine derived statements live in Mathlib's `DerivedCategory (ModuleCat A)`. Global de Rham
  sheaf objects and finite Hodge quotients live in `DerivedCategory (SheafOfModules R)` for the
  base coefficient sheaf `R`, with the filtered diagram version of README 5.8 and the raw lci
  realization of README 5.8.1; cotangent powers
  and Hodge graded pieces also have quasi-coherent `O_X`-module structures. Derived completeness is the
  vanishing of all morphisms from shifted localizations, as supplied by DerivedModuleAlgebra §1.2.
  The cotangent complex, module completion and derived powers are supplied by DerivedModuleAlgebra;
  derived de Rham cohomology is specified in this README.
* DerivedModuleAlgebra §§0.2, 1.1–1.9 and 1.T.1 supplies K-flat tensor models, module limits,
  ideal completion and complete flatness. EnhancedDerivedSheaves §§E1.F3.H1 and E1.8.DMA.1
  supplies the point-site Hom and affine tensor comparisons. These signatures use module
  derived categories and the explicit localization-vanishing condition where needed.
* `Z_p(1)` is the kernel of Mathlib's untilt `PreTilt.untilt`, and `A_inf`, `θ` and `B_dR⁺` are
  Mathlib's `WittVector p (PreTilt O p)`, `WittVector.fontaineTheta` and `BDeRhamPlus`.
  README PD.7 and 5.13 identify the general envelope and derived period map with the ordinary
  carrier and map of PadicPeriodRings §§3–4.1. README 6.20 owns the shared free-prelog,
  Gabber log cotangent and log derived de Rham constructors. Its period objects and maps are
  their definitional specializations (`periodLogSpecialization`); README 6.21 identifies this
  public `logDeRhamDLog` with Fontaine's map, including p = 2 and arbitrary perfect residue field.
-/


namespace TauCetiRoadmap.DerivedDeRhamCohomology

open CategoryTheory CategoryTheory.Limits CategoryTheory.Pretriangulated ExteriorAlgebra
open scoped TensorProduct

noncomputable section

/-! ## Milestones on pinned carriers -/

namespace DerivedDeRham

/-- Faithful flatness of the reduction gives ordinary faithful flatness under the
Noetherian, torsion-free and completeness hypotheses of README 1.10. -/
theorem ordinaryFaithfulFlatnessFromCompleteFaithfulFlatness (A B : Type)
    [CommRing A] [CommRing B] [Algebra A B] [IsNoetherianRing A] (π : A)
    (hπA : IsSMulRegular A π) (hπB : IsSMulRegular B (algebraMap A B π))
    (hA : IsAdicComplete (Ideal.span {π}) A) (hB : IsAdicComplete (Ideal.span {π}) B)
    (hflat : Module.FaithfullyFlat (A ⧸ Ideal.span {π})
      (B ⧸ Ideal.map (algebraMap A B) (Ideal.span {π}))) :
    Module.FaithfullyFlat A B := by
  sorry

section ComplexHeartExt

attribute [local instance] HasExt.standard

/-- Ext in the abelian category of cochain complexes between `M[0]` and `N[c]` agrees
with module Ext in degree `i + c` when `c ≤ 0` and `i + c ≥ 0` (README 1.20,
`complexHeartExt`; BMS19, Proposition 5.6, proof). The second complex is supported in degree `−c`. -/
theorem complexHeartExt (A : Type) [CommRing A] (M N : ModuleCat.{0} A)
    (i : ℕ) (c : ℤ) (hc : c ≤ 0) (hi : 0 ≤ (i : ℤ) + c) :
    Nonempty (Abelian.Ext.{1} ((CochainComplex.singleFunctor (ModuleCat.{0} A) 0).obj M)
        ((CochainComplex.singleFunctor (ModuleCat.{0} A) (-c)).obj N) i ≃+
      Abelian.Ext.{1} M N (((i : ℤ) + c).toNat)) := by
  sorry

/-- A positive shift of the target makes all nonnegative Ext groups from `M[0]`
vanish in the abelian category of cochain complexes (README 1.20). -/
theorem complexHeartExt_positive_shift (A : Type) [CommRing A] (M N : ModuleCat.{0} A)
    (i : ℕ) (c : ℤ) (hc : 0 < c) :
    Subsingleton (Abelian.Ext.{1} ((CochainComplex.singleFunctor (ModuleCat.{0} A) 0).obj M)
      ((CochainComplex.singleFunctor (ModuleCat.{0} A) (-c)).obj N) i) := by
  sorry

/-- When `c ≤ 0` and `i + c < 0`, Ext between `M[0]` and `N[c]` vanishes in the
abelian category of cochain complexes (README 1.20). -/
theorem complexHeartExt_negative_total (A : Type) [CommRing A] (M N : ModuleCat.{0} A)
    (i : ℕ) (c : ℤ) (hc : c ≤ 0) (hi : (i : ℤ) + c < 0) :
    Subsingleton (Abelian.Ext.{1} ((CochainComplex.singleFunctor (ModuleCat.{0} A) 0).obj M)
      ((CochainComplex.singleFunctor (ModuleCat.{0} A) (-c)).obj N) i) := by
  sorry

end ComplexHeartExt

end DerivedDeRham

/-! ## Layer 0: André–Quillen criteria and local differential algebra -/

namespace DerivedDeRham

/-- A family `b : Fin r → k` is a **p-basis** of a field `k` of characteristic `p`: the p-monomials
`∏ i, b i ^ e i` with `0 ≤ e i < p` form a basis of `k` over the subfield `k^p` of `p`-th powers.
A transcendence basis is in general not a p-basis (README 0.23). -/
def IsPBasis (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p] {r : ℕ} (b : Fin r → k) :
    Prop :=
  LinearIndependent (frobenius k p).fieldRange
      (fun e : Fin r → Fin p => ∏ i, b i ^ (e i : ℕ)) ∧
    Submodule.span (frobenius k p).fieldRange
      (Set.range fun e : Fin r → Fin p => ∏ i, b i ^ (e i : ℕ)) = ⊤

/-- The differentials of a p-basis form a basis of `Ω¹_(k/F_p)`, so its dimension is
`log_p [k : k^p]` (Clausen–Mathew–Morrow, §5.1, Footnote 10, p.39;
Matsumura, Commutative ring theory, second edition, §26). This is `pBasis_kaehler_basis` of the
README (0.23). -/
theorem pBasis_kaehler_basis (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p]
    [Algebra (ZMod p) k] {r : ℕ} (b : Fin r → k) (hb : IsPBasis p k b) :
    LinearIndependent k (fun i => KaehlerDifferential.D (ZMod p) k (b i)) ∧
      Submodule.span k (Set.range fun i => KaehlerDifferential.D (ZMod p) k (b i)) = ⊤ := by
  sorry

/-- The transcendence basis `{t^p}` of `F_p(t)` fails the p-basis condition (README 0.23). -/
theorem test_pbasis_transcendence_not_enough (p : ℕ) [Fact p.Prime] :
    ¬ IsPBasis p (RatFunc (ZMod p)) (fun _ : Fin 1 => (RatFunc.X : RatFunc (ZMod p)) ^ p) := by
  sorry

end DerivedDeRham

/-! ## Layer 1: Completion and filtered modules -/

namespace DerivedDeRham

/-- The standard derived-category instance for modules over `R`, local to these signatures. -/
local instance moduleDerived (R : Type) [CommRing R] :
    HasDerivedCategory.{1} (ModuleCat.{0} R) :=
  HasDerivedCategory.standard _

/-- The derived category `D(R)` of `R`-modules. -/
abbrev D (R : Type) [CommRing R] := DerivedCategory (ModuleCat.{0} R)

/-- A module placed in cohomological degree zero. -/
abbrev mod0 (R : Type) [CommRing R] (M : ModuleCat.{0} R) : D R :=
  (DerivedCategory.singleFunctor (ModuleCat R) 0).obj M

/-- **Bhatt's ordinary flatness criterion** (Bhatt, *On the direct summand conjecture and its
derived variant*, Proposition 5.1): over a Noetherian base, `π`-torsion-free and classically
`π`-adically complete algebras with flat reduction are flat. README 1.10. -/
theorem ordinaryFlatnessFromCompleteFlatness (A B : Type) [CommRing A] [CommRing B] [Algebra A B]
    [IsNoetherianRing A] (π : A)
    (hπA : IsSMulRegular A π) (hπB : IsSMulRegular B (algebraMap A B π))
    (hA : IsAdicComplete (Ideal.span {π}) A) (hB : IsAdicComplete (Ideal.span {π}) B)
    (hflat : Module.Flat (A ⧸ Ideal.span {π})
      (B ⧸ Ideal.map (algebraMap A B) (Ideal.span {π}))) :
    Module.Flat A B := by
  sorry

/-- A quotient `N/gN` of a derived `f`-complete module is derived `f`-complete; the classical
statement is `quotientClassicalCompleteness`. README 1.11; DerivedModuleAlgebra §1.2 supplies
`derivedCompleteness`. Stacks, Lemma 15.93.1 (091P), applies to the cone of multiplication by `g`
and its degree-zero cohomology. The localization-vanishing condition is written directly here. -/
theorem quotientCompleteness (A : Type) [CommRing A] (N : ModuleCat.{0} A) (f g : A)
    (h : ∀ x ∈ Ideal.span {f}, ∀ n : ℤ,
      Subsingleton ((mod0 A (ModuleCat.of A (Localization.Away x)))⟦n⟧ ⟶ mod0 A N)) :
    ∀ x ∈ Ideal.span {f}, ∀ n : ℤ,
      Subsingleton ((mod0 A (ModuleCat.of A (Localization.Away x)))⟦n⟧ ⟶
        mod0 A (ModuleCat.of A (N ⧸ LinearMap.range (g • (LinearMap.id : N →ₗ[A] N))))) := by
  sorry

/-- If `N` is classically `f`-adically complete and `f` is a nonzerodivisor on `N/gN`, then `N/gN`
is classically `f`-adically complete (Bhatt–Ma–Patakfalvi–Schwede–Tucker–Waldron–Witaszek,
Lemma 2.8). Without the injectivity hypothesis the quotient need not be separated. -/
theorem quotientClassicalCompleteness (A : Type) [CommRing A] (N : Type) [AddCommGroup N]
    [Module A N] (f g : A) (hN : IsAdicComplete (Ideal.span {f}) N)
    (hreg : IsSMulRegular (N ⧸ LinearMap.range (g • (LinearMap.id : N →ₗ[A] N))) f) :
    IsAdicComplete (Ideal.span {f}) (N ⧸ LinearMap.range (g • (LinearMap.id : N →ₗ[A] N))) := by
  sorry

/-- The series with coefficients `p^(−n)` admits no common p-power denominator. It separates
inverting `p` after the limit of `ℤ_p[t]/(t^n)` from inverting it before that limit (README 1.15). -/
theorem test_bdr_p_inverted_inside (p : ℕ) [Fact p.Prime] :
    ¬ ∃ (N : ℕ) (g : PowerSeries (PadicInt p)), ∀ n : ℕ,
      (p : Padic p) ^ N *
          PowerSeries.coeff n (PowerSeries.mk fun k : ℕ => ((p : Padic p) ^ k)⁻¹) =
        (↑(PowerSeries.coeff (R := PadicInt p) n g) : Padic p) := by
  sorry


end DerivedDeRham

end

end TauCetiRoadmap.DerivedDeRhamCohomology

namespace TauCetiRoadmap.CrystallineCohomology

open Finset

universe u

/-! ## Layer PD: Divided powers and universal thickenings -/

namespace PD

variable {A : Type*} [CommRing A]

/-- An additive divided-power candidate on an ideal `I`: operations `δ_n : A → A` vanishing
outside `I`, with `δ₀ = 1`, `δ₁ = id` on `I`, `δ_n(I) ⊆ I` for `n > 0`, the addition formula and
homogeneity, but neither the multiplication nor the iteration identity (Stacks, Lemma 23.2.4,
hypothesis (a)). The generator layer is README PD.1. -/
structure AdditivePowers (I : Ideal A) where
  /-- The operations `δ_n`. -/
  dpow : ℕ → A → A
  dpow_null : ∀ {n x}, x ∉ I → dpow n x = 0
  dpow_zero : ∀ {x}, x ∈ I → dpow 0 x = 1
  dpow_one : ∀ {x}, x ∈ I → dpow 1 x = x
  dpow_mem : ∀ {n x}, n ≠ 0 → x ∈ I → dpow n x ∈ I
  dpow_add : ∀ {n x y}, x ∈ I → y ∈ I →
    dpow n (x + y) = (antidiagonal n).sum fun k ↦ dpow k.1 x * dpow k.2 y
  dpow_mul : ∀ {n} {a : A} {x}, x ∈ I → dpow n (a * x) = a ^ n * dpow n x

namespace AdditivePowers

variable {I : Ideal A}

/-- Every divided power structure is an additive candidate with the same operations. -/
def ofDividedPowers (γ : DividedPowers I) : AdditivePowers I where
  dpow := γ.dpow
  dpow_null := γ.dpow_null
  dpow_zero := γ.dpow_zero
  dpow_one := γ.dpow_one
  dpow_mem := γ.dpow_mem
  dpow_add := γ.dpow_add
  dpow_mul := γ.dpow_mul

@[simp]
theorem ofDividedPowers_dpow (γ : DividedPowers I) : (ofDividedPowers γ).dpow = γ.dpow := rfl

end AdditivePowers

/-- Divided powers from identities on generators (Stacks, Lemma 23.2.4): an additive candidate
whose multiplication and iteration identities hold on a generating set of `I` is a divided power
structure with the same operations. -/
theorem exists_dividedPowers_of_generators {I : Ideal A} (δ : AdditivePowers I) (S : Set A)
    (hS : I = Ideal.span S)
    (hmul : ∀ s ∈ S, ∀ m n : ℕ,
      δ.dpow m s * δ.dpow n s = (m + n).choose m * δ.dpow (m + n) s)
    (hcomp : ∀ s ∈ S, ∀ m n : ℕ, n ≠ 0 →
      δ.dpow m (δ.dpow n s) = Nat.uniformBell m n * δ.dpow (m * n) s) :
    ∃ γ : DividedPowers I, γ.dpow = δ.dpow := by
  sorry

/-- Divided powers on a sum of ideals (Stacks, Lemma 23.2.5): structures `γ` on `I` and `ε` on `J`
extend to a common structure on `I ⊔ J` exactly when they agree on `I ⊓ J`. -/
theorem exists_dividedPowers_sup_iff {I J : Ideal A} (γ : DividedPowers I)
    (ε : DividedPowers J) :
    (∃ θ : DividedPowers (I ⊔ J), (∀ n, ∀ x ∈ I, θ.dpow n x = γ.dpow n x) ∧
      ∀ n, ∀ x ∈ J, θ.dpow n x = ε.dpow n x) ↔
      ∀ n, ∀ x ∈ I ⊓ J, γ.dpow n x = ε.dpow n x := by
  sorry

/-- Flat extension of divided powers (Stacks, Lemma 23.4.2): along a flat ring map `A → B`, a
divided power structure on `I` extends uniquely to `IB` so that `A → B` is a divided power
morphism. -/
theorem existsUnique_dividedPowers_map_of_flat {B : Type*} [CommRing B] [Algebra A B]
    [Module.Flat A B] {I : Ideal A} (γ : DividedPowers I) :
    ∃! δ : DividedPowers (I.map (algebraMap A B)),
      DividedPowers.IsDPMorphism γ δ (algebraMap A B) := by
  sorry

/-- Divided powers after localization: `γᴮ_n(x/s) = γ_n(x)/sⁿ`. -/
theorem dpow_localization {B : Type*} [CommRing B] [Algebra A B] (S : Submonoid A)
    [IsLocalization S B] {I : Ideal A} (γ : DividedPowers I)
    (δ : DividedPowers (I.map (algebraMap A B)))
    (hδ : DividedPowers.IsDPMorphism γ δ (algebraMap A B)) (n : ℕ) {x : A} (hx : x ∈ I)
    (s : S) :
    δ.dpow n (IsLocalization.mk' B x s) = IsLocalization.mk' B (γ.dpow n x) (s ^ n) := by
  sorry

/-- The coefficient `c_n`, the image in `A` of `pⁿ/n! ∈ pℤ_(p)`: the factor `p^(n − v_p(n!))`
times the inverse of the prime-to-`p` part of `n!`. In a `ℤ_(p)`-algebra that inverse exists;
`Ring.inverse` returns `0` on non-units, so the formula is only used under that hypothesis. -/
noncomputable def canonicalCoeff (p : ℕ) (A : Type*) [CommRing A] (n : ℕ) : A :=
  (p : A) ^ (n - padicValNat p n.factorial) *
    Ring.inverse ((n.factorial / p ^ padicValNat p n.factorial : ℕ) : A)

/-- The canonical divided powers on `(p)` in a `ℤ_(p)`-algebra (Stacks, Example 23.2.3), `γ_n(pa) = c_n aⁿ`; the prime
`p = 2` is included and `A` may have `p`-torsion. -/
theorem exists_dividedPowers_span_p (p : ℕ) [Fact p.Prime] (A : Type*) [CommRing A]
    (hA : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A)) :
    ∃ γ : DividedPowers (Ideal.span {(p : A)}),
      ∀ (n : ℕ) (a : A), γ.dpow n (p * a) = canonicalCoeff p A n * a ^ n := by
  sorry

/-- Every ring map between `ℤ_(p)`-algebras is a divided power morphism for the canonical
structures on `(p)`. -/
theorem isDPMorphism_canonical (p : ℕ) [Fact p.Prime] {A B : Type*} [CommRing A] [CommRing B]
    (f : A →+* B) (γ : DividedPowers (Ideal.span {(p : A)}))
    (ε : DividedPowers (Ideal.span {(p : B)}))
    (hγ : ∀ (n : ℕ) (a : A), γ.dpow n (p * a) = canonicalCoeff p A n * a ^ n)
    (hε : ∀ (n : ℕ) (b : B), ε.dpow n (p * b) = canonicalCoeff p B n * b ^ n)
    (hA : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A)) :
    DividedPowers.IsDPMorphism γ ε f := by
  sorry

section CanonicalAugmentationPowers

variable (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M]

/-- The canonical divided powers on the augmentation ideal (Stacks, Lemma 23.5.1): the unique
structure with `δ_n(dp₁ m) = dp_n m`. -/
theorem existsUnique_dividedPowers_augmentationIdeal :
    ∃! δ : DividedPowers (RingHom.ker (DividedPowerAlgebra.lift (dividedPowersBot R)
      (0 : M →ₗ[R] R) (fun _ ↦ by simp))),
      ∀ (n : ℕ) (m : M), δ.dpow n (DividedPowerAlgebra.dp R 1 m) =
        DividedPowerAlgebra.dp R n m := by
  sorry

end CanonicalAugmentationPowers

/-! ### The divided power filtration -/

variable {I : Ideal A}

/-- The divided power filtration `Fⁿ_γ I = I^{[n]}`: the ideal generated by the products
`γ_{e₁}(x₁) ⋯ γ_{e_t}(x_t)` with `x_j ∈ I` and `∑ e_j ≥ n`, the empty product included. -/
def pdFiltration (γ : DividedPowers I) (n : ℕ) : Ideal A :=
  Ideal.span {y | ∃ (t : ℕ) (e : Fin t → ℕ) (x : Fin t → A),
    (∀ j, x j ∈ I) ∧ n ≤ ∑ j, e j ∧ y = ∏ j, γ.dpow (e j) (x j)}

/-- `I` is PD nilpotent if some step of its divided power filtration vanishes. -/
def IsPDNilpotent (γ : DividedPowers I) : Prop :=
  ∃ n, n ≠ 0 ∧ pdFiltration γ n = ⊥

/-- The empty product makes the zeroth divided power filtration step the whole ring (README PD.4). -/
theorem pdFiltration_zero (γ : DividedPowers I) : pdFiltration γ 0 = ⊤ := by
  rw [eq_top_iff, ← Ideal.span_singleton_one]
  refine Ideal.span_mono ?_
  rintro _ rfl
  exact ⟨0, Fin.elim0, Fin.elim0, fun j ↦ j.elim0, by simp, by simp⟩

/-- The first divided power filtration step is the given ideal (README PD.4). -/
theorem pdFiltration_one (γ : DividedPowers I) : pdFiltration γ 1 = I := by
  sorry

/-- Ordinary ideal powers lie in the corresponding divided power filtration steps (README PD.4). -/
theorem pow_le_pdFiltration (γ : DividedPowers I) (n : ℕ) : I ^ n ≤ pdFiltration γ n := by
  sorry

/-- Every positive step of the canonical 2-adic PD filtration is `(2)`
  (README PD.4). -/
theorem pd_filtration_two_adic_constant (n : ℕ) (hn : 0 < n) :
    pdFiltration (PadicInt.dividedPowers 2) n = Ideal.span ({(2 : ℤ_[2])} : Set ℤ_[2]) := by
  sorry

open scoped Classical in
/-- The square-zero ideal `(2)` of `ZMod 4` supports both PD-nilpotent square-zero powers
and non-PD-nilpotent canonical powers (README PD.4). -/
theorem test_nilpotent_two_structures :
    let J := Ideal.span {(2 : ZMod 4)}
    ∃ (hJ : J ^ 2 = 0) (γ : DividedPowers J),
      (∀ n a : ℕ, γ.dpow n (2 * (a : ZMod 4)) =
        canonicalCoeff 2 (ZMod 4) n * (a : ZMod 4) ^ n) ∧
      γ.dpow 2 2 = 2 ∧
      pdFiltration (DividedPowers.OfSquareZero.dividedPowers hJ) 2 = ⊥ ∧
      IsPDNilpotent (DividedPowers.OfSquareZero.dividedPowers hJ) ∧
      ¬ IsPDNilpotent γ := by
  classical
  sorry

/-- PD nilpotence implies nilpotence of the ideal; the converse fails for `(2) ⊂ ZMod 4`. -/
theorem IsPDNilpotent.isNilpotent {γ : DividedPowers I} (h : IsPDNilpotent γ) :
    IsNilpotent I := by
  sorry

/-! ### Compatibility with a base and divided power envelopes -/

/-- `δ` on `J ⊆ B` is compatible with `γ` on `I ⊆ A` along `φ` (Stacks, Definition 60.4.1): some
divided power structure on `J ⊔ IB` makes `φ` and the identity of `B` divided power morphisms. -/
def IsCompatibleWith {B : Type*} [CommRing B] (φ : A →+* B) (γ : DividedPowers I)
    {J : Ideal B} (δ : DividedPowers J) : Prop :=
  ∃ θ : DividedPowers (J ⊔ I.map φ),
    DividedPowers.IsDPMorphism γ θ φ ∧ DividedPowers.IsDPMorphism δ θ (RingHom.id B)

/-- `(D, J', δ)` with `ι : B → D` is a divided power envelope of `J ⊆ B` relative to `(A, I, γ)`:
`ι(J) ⊆ J'`, `A → D` is a divided power morphism, and every `A`-algebra map `B → C` sending `J` into
a divided power ideal `K` with a specified divided power morphism `(A, I, γ) → (C, K, ε)`
factors uniquely through a divided power morphism `D → C`. In particular, `K` contains the image
of the base ideal `I`. -/
structure IsPDEnvelope {B D : Type u} [CommRing B] [CommRing D] [Algebra A B] [Algebra A D]
    (γ : DividedPowers I) (J : Ideal B) {J' : Ideal D} (δ : DividedPowers J') (ι : B →ₐ[A] D) :
    Prop where
  map_le : J.map ι ≤ J'
  isDPMorphism : DividedPowers.IsDPMorphism γ δ (algebraMap A D)
  universal : ∀ (C : Type u) [CommRing C] [Algebra A C] (K : Ideal C) (ε : DividedPowers K),
    DividedPowers.IsDPMorphism γ ε (algebraMap A C) → ∀ g : B →ₐ[A] C, J.map g ≤ K →
      ∃! h : D →ₐ[A] C, DividedPowers.IsDPMorphism δ ε h.toRingHom ∧ h.comp ι = g

/-- Existence of the universal divided power envelope (Stacks, Lemma 60.2.1 and Definition 60.2.2). -/
theorem exists_isPDEnvelope {B : Type u} [CommRing B] [Algebra A B] (γ : DividedPowers I)
    (J : Ideal B) (hJ : I.map (algebraMap A B) ≤ J) :
    ∃ (D : Type u) (_ : CommRing D) (_ : Algebra A D) (J' : Ideal D) (δ : DividedPowers J')
      (ι : B →ₐ[A] D), IsPDEnvelope γ J δ ι := by
  sorry

/-- A compatible-base envelope keeps the quotient `B/J`: its PD ideal may exclude the
extended base ideal, but their powers have a common extension. Its universal property tests
PD ideals compatible with the base powers (README PD.6). -/
structure IsCompatiblePDEnvelope {B D : Type u} [CommRing B] [CommRing D]
    [Algebra A B] [Algebra A D] (γ : DividedPowers I) (J : Ideal B)
    {K : Ideal D} (δ : DividedPowers K) (ι : B →ₐ[A] D) : Prop where
  map_le : J ≤ K.comap ι.toRingHom
  compatible : IsCompatibleWith (algebraMap A D) γ δ
  quotient_bijective : Function.Bijective (Ideal.quotientMap K ι.toRingHom map_le)
  universal : ∀ (C : Type u) [CommRing C] [Algebra A C] (L : Ideal C) (ε : DividedPowers L),
    IsCompatibleWith (algebraMap A C) γ ε → ∀ g : B →ₐ[A] C, J ≤ L.comap g.toRingHom →
      ∃! h : D →ₐ[A] C, DividedPowers.IsDPMorphism δ ε h.toRingHom ∧ h.comp ι = g

/-- The compatible-base envelope exists with quotient `B/J` when the base powers extend
  to the image of `I` in `B/J` (Berthelot I.2.4.3(iii)). -/
theorem exists_isCompatiblePDEnvelope {B : Type u} [CommRing B] [Algebra A B]
    (γ : DividedPowers I) (J : Ideal B)
    (hquot : IsCompatibleWith (algebraMap A (B ⧸ J)) γ (dividedPowersBot (B ⧸ J))) :
    ∃ (D : Type u) (_ : CommRing D) (_ : Algebra A D) (K : Ideal D) (δ : DividedPowers K)
      (ι : B →ₐ[A] D), IsCompatiblePDEnvelope γ J δ ι := by
  sorry

end PD

/-
The following APIs are specified in the README on the carriers constructed there.
PD.1 Divided powers from identities on generators, and gluing on sums:
PD.AdditivePowers.toDividedPowers_dpow; PD.AdditivePowers.toDividedPowers_unique;
PD.AdditivePowers.toDividedPowers_generators; PD.convolution_eq; PD.convolution_swap;
PD.convolution_mem; PD.convolution_eq_coeff_exp_mul; PD.supCandidate_dpow_add; PD.supCandidate_left;
PD.supCandidate_right; PD.sup_dpow_add; PD.sup_left; PD.sup_right; PD.sup_isDPMorphism_iff.

PD.2 Extension along principal ideals, flat maps and localisation:
PD.extendPrincipal_dpow; PD.extendPrincipal_isDPMorphism; PD.extendPrincipal_generator_independent;
PD.extensionCoefficient_eq; PD.extensionCoefficient_one; PD.extensionCoefficient_mem;
PD.dpow_sum_mul_map_eq_extensionCoefficient; PD.flatCandidate_formula; PD.flatCandidate_base;
PD.flatCandidate_outside; PD.extendFlat_formula; PD.extendFlat_isDPMorphism; PD.extendFlat_unique;
PD.extendFlat_isDPMorphism_iff; PD.extendFlat_trans; PD.extendFlat_eq_ofRingEquiv.

PD.4 The divided power filtration and PD nilpotence:
PD.pdFiltration_le_iff; PD.prod_dpow_mem_pdFiltration; PD.dpow_mem_pdFiltration;
PD.pdFiltration_eq_span_of_span; Crystalline.pdNilpotent_iff; Crystalline.pdNilpotent_ordinary;
Crystalline.pdNilpotent_map; Crystalline.pdIdeal_le_nilradical_iff.

PD.5 Compatibility with a base, canonical divided powers and square-zero thickenings:
PD.canonicalP_dpow_mul; PD.pow_div_factorial_mem_span; PD.canonicalP_unique;
PD.canonicalP_isDPMorphism; PD.canonicalP_padicInt; Crystalline.isCompatibleWith_iff_isDPMorphism;
Crystalline.isCompatibleWith_iff_extends_agree; Crystalline.isCompatibleWith_of_inf_eq_mul;
Crystalline.isCompatibleWith_bot; Crystalline.gammaPD_generator; Crystalline.gammaPD_lift;
Crystalline.gammaPD_map; Crystalline.gammaPD_unique; Crystalline.gammaPD_dp;
Crystalline.pdPolynomial_basis; Crystalline.pdPolynomial_lift;
Crystalline.pdPolynomial_monomial_mul; Crystalline.pdPolynomial_algebraMap_isDPMorphism;
Crystalline.pdPolynomial_dpow_var; Crystalline.pdPolynomial_dpow_unique;
Crystalline.pdSqZeroExt_dpow; Crystalline.pdSqZeroExt_dpow_inr;
Crystalline.pdSqZeroExt_inl_isDPMorphism; Crystalline.pdSqZeroExt_fst_isDPMorphism;
Crystalline.pdSqZeroExt_map; Crystalline.pdSqZeroExt_derivation_iff.

PD.6 Divided power envelopes:
Crystalline.compatiblePDEnvelope.lift; Crystalline.compatiblePDEnvelope.quotient;
Crystalline.compatiblePDEnvelope.containing_base.
Crystalline.completedEnvelope_reduction; Crystalline.completedEnvelope_lift;
Crystalline.completedEnvelope_functorial; Crystalline.completedEnvelope_mod_pow;
Crystalline.completedEnvelope_eq_limit.

PD.7 The crystalline period ring:
Crystalline.fontaineEnvelope_initial; Crystalline.fontaineEnvelope_theta;
Crystalline.fontaineEnvelope_identify; Crystalline.fontaineEnvelope_eq_trivialBase;
Crystalline.fontaineEnvelope_wittResidue; Crystalline.fontaineEnvelope_map.
These are targets for general rings. Their O_C initial property, presentation, embedding,
p-adic completion and θ_cris use PadicPeriodRings §3's supplied objects and laws through
Crystalline.fontaineEnvelope_periodPDEnvelope.
Crystalline.fontaineEnvelope_periodPDEnvelope identifies the generic envelope on O_C and its
p-adic completion with PadicPeriodRings §3's periodPDEnvelope and completed carrier. Its
presentation sends x^[n] to the supplied ξⁿ/n! in A_inf[1/p], preserving A_inf, θ_cris, the full
base-compatible PD ideal and the separate small Hodge ideal, powers, completion, functorial maps
and logarithms. In the period setup it also intertwines Witt Frobenius and Galois actions.

PD.AdditivePowers.ext; PD.convolution_eq_coeff_exp_mul;
Crystalline.PDEnvelope.lift; Crystalline.PDEnvelope.quotient; Crystalline.PDEnvelope.map;
Crystalline.PDEnvelope.span_dpow_image; Crystalline.PDEnvelope.presentation;
Crystalline.PDEnvelope.compatible_lift; Crystalline.PDEnvelope.eq_of_isCompatible.
-/

end TauCetiRoadmap.CrystallineCohomology

namespace TauCetiRoadmap.DerivedDeRhamCohomology

open CategoryTheory CategoryTheory.Limits CategoryTheory.Pretriangulated ExteriorAlgebra
open scoped TensorProduct

noncomputable section

/-! ## Layer 2: Ordinary and derived de Rham cohomology -/

namespace DeRham

universe u

variable (A B : Type u) [CommRing A] [CommRing B] [Algebra A B]

/-- The existing exterior power `Ωⁿ_(B/A)` of the Kähler differentials, with scalars restricted
to `A` where needed. -/
abbrev Forms (n : ℕ) := exteriorPower B n (KaehlerDifferential A B)

/-- The free `A`-module `Sₙ` on coefficient and differential-generator tuples `[c; v]`. -/
abbrev Symbols (n : ℕ) := (B × (Fin n → B)) →₀ A

/-- The basis symbol `[c; v]`. -/
abbrev sym (n : ℕ) (c : B) (v : Fin n → B) : Symbols A B n :=
  Finsupp.single (c, v) 1

/-- The elementary form `c dv₁ ∧ … ∧ dvₙ` in the existing exterior-power carrier. -/
abbrev elementary (n : ℕ) (c : B) (v : Fin n → B) : Forms A B n :=
  c • exteriorPower.ιMulti B n (fun i => KaehlerDifferential.D A B (v i))

/-- Multiplication in the graded exterior algebra, without factorial normalization. -/
abbrev wedge {m n : ℕ} (x : Forms A B m) (y : Forms A B n) : Forms A B (m + n) :=
  ⟨x.val * y.val, SetLike.mul_mem_graded x.property y.property⟩

/-- A coefficient viewed as a degree-zero form through `Ω⁰ ≃ B`. -/
abbrev zeroForm (b : B) : Forms A B 0 :=
  (exteriorPower.zeroEquiv B (KaehlerDifferential A B)).symm b

/-- The six relation families: coefficient additivity, base scalars, slot additivity, slot Leibniz,
base constants in a slot, and strict alternation. Only additive and `A`-scalar closure in the
coefficient is imposed. -/
def relationSet (n : ℕ) : Set (Symbols A B n) :=
  {x | (∃ c e v, x = sym A B n (c + e) v - sym A B n c v - sym A B n e v) ∨
    (∃ (a : A) (c : B) (v : Fin n → B), x = sym A B n (a • c) v - a • sym A B n c v) ∨
    (∃ c v i b e, x = sym A B n c (Function.update v i (b + e)) -
      sym A B n c (Function.update v i b) - sym A B n c (Function.update v i e)) ∨
    (∃ c v i b e, x = sym A B n c (Function.update v i (b * e)) -
      sym A B n (c * b) (Function.update v i e) -
      sym A B n (c * e) (Function.update v i b)) ∨
    (∃ (c : B) (v : Fin n → B) (i : Fin n) (a : A),
      x = sym A B n c (Function.update v i (algebraMap A B a))) ∨
    (∃ c v i j, i ≠ j ∧ v i = v j ∧ x = sym A B n c v)}

/-- The relation submodule `Rₙ ⊂ Sₙ`, the `A`-span of the six relation families (README 2.1). -/
def symbolRelations (n : ℕ) : Submodule A (Symbols A B n) :=
  Submodule.span A (relationSet A B n)

/-- `Rₙ` is the `A`-span of the six displayed families. -/
theorem symbolRelations_eq_span (n : ℕ) :
    symbolRelations A B n = Submodule.span A (relationSet A B n) :=
  rfl

/-- Coefficient additivity belongs to `Rₙ`. -/
theorem symbolRelations_coeff_add (n : ℕ) (c e : B) (v : Fin n → B) :
    sym A B n (c + e) v - sym A B n c v - sym A B n e v ∈ symbolRelations A B n := by
  sorry

/-- The slot Leibniz relation belongs to `Rₙ` for every slot. -/
theorem symbolRelations_slot_mul (n : ℕ) (c x y : B) (v : Fin n → B) (i : Fin n) :
    sym A B n c (Function.update v i (x * y)) - sym A B n (c * x) (Function.update v i y) -
      sym A B n (c * y) (Function.update v i x) ∈ symbolRelations A B n := by
  sorry

-- Strict alternation includes diagonal symbols in characteristic two.
example (x : Polynomial (ZMod 2)) :
    sym (ZMod 2) (Polynomial (ZMod 2)) 2 1 (fun _ => x) ∈
      symbolRelations (ZMod 2) (Polynomial (ZMod 2)) 2 := by
  apply Submodule.subset_span
  exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr
    ⟨1, (fun _ => x), (0 : Fin 2), 1, by decide, rfl, rfl⟩))))

/-- The evaluation `qₙ : Sₙ → Ωⁿ`, `[c; v] ↦ c dv₁ ∧ … ∧ dvₙ` (README 2.2). -/
def symbolMap (n : ℕ) : Symbols A B n →ₗ[A] Forms A B n :=
  Finsupp.linearCombination A (fun cv : B × (Fin n → B) => elementary A B n cv.1 cv.2)

/-- `qₙ([c; v]) = c dv₁ ∧ … ∧ dvₙ`. -/
theorem symbolMap_single (n : ℕ) (c : B) (v : Fin n → B) :
    symbolMap A B n (sym A B n c v) = elementary A B n c v := by
  sorry

/-- `qₙ` is additive. -/
theorem symbolMap_add (n : ℕ) (x y : Symbols A B n) :
    symbolMap A B n (x + y) = symbolMap A B n x + symbolMap A B n y := by
  sorry

/-- `qₙ` is `A`-linear. -/
theorem symbolMap_smul (n : ℕ) (a : A) (s : Symbols A B n) :
    symbolMap A B n (a • s) = a • symbolMap A B n s := by
  sorry

/-- The symbol map is surjective: elementary forms span `Ωⁿ` over `A` (README 2.3). -/
theorem symbolMap_surjective (n : ℕ) : Function.Surjective (symbolMap A B n) := by
  sorry

/-- `ker qₙ = Rₙ`, including `n = 0` (README 2.4). -/
theorem symbolRelations_ker (n : ℕ) : LinearMap.ker (symbolMap A B n) = symbolRelations A B n := by
  sorry

/-- The free differential `δₙ : Sₙ → Ωⁿ⁺¹`, `[c; v] ↦ dc ∧ dv₁ ∧ … ∧ dvₙ`, with the coefficient in
the first slot (README 2.5). -/
def freeDifferential (n : ℕ) : Symbols A B n →ₗ[A] Forms A B (n + 1) :=
  Finsupp.linearCombination A (fun cv : B × (Fin n → B) =>
    exteriorPower.ιMulti B (n + 1)
      (Fin.cons (KaehlerDifferential.D A B cv.1) (fun i => KaehlerDifferential.D A B (cv.2 i))))

/-- `δₙ([c; v]) = dc ∧ dv₁ ∧ … ∧ dvₙ`. -/
theorem freeDifferential_single (n : ℕ) (c : B) (v : Fin n → B) :
    freeDifferential A B n (sym A B n c v) =
      exteriorPower.ιMulti B (n + 1)
        (Fin.cons (KaehlerDifferential.D A B c) (fun i => KaehlerDifferential.D A B (v i))) := by
  sorry

/-- `δₙ` is additive. -/
theorem freeDifferential_add (n : ℕ) (s t : Symbols A B n) :
    freeDifferential A B n (s + t) = freeDifferential A B n s + freeDifferential A B n t := by
  sorry

/-- `δₙ` is `A`-linear. -/
theorem freeDifferential_smul (n : ℕ) (a : A) (s : Symbols A B n) :
    freeDifferential A B n (a • s) = a • freeDifferential A B n s := by
  sorry

/-- The free differential kills every relation (README 2.6). -/
theorem freeDifferential_relations (n : ℕ) :
    symbolRelations A B n ≤ LinearMap.ker (freeDifferential A B n) := by
  sorry

/-- The characterizing property of the de Rham differential `DeRham.d A B n` of README 2.7:
`f (c dv₁ ∧ … ∧ dvₙ) = dc ∧ dv₁ ∧ … ∧ dvₙ` on elementary forms (`d_elementary`). -/
def IsDeRhamDifferential (n : ℕ) (f : Forms A B n →ₗ[A] Forms A B (n + 1)) : Prop :=
  ∀ (c : B) (v : Fin n → B), f (elementary A B n c v) =
    exteriorPower.ιMulti B (n + 1)
      (Fin.cons (KaehlerDifferential.D A B c) (fun i => KaehlerDifferential.D A B (v i)))

/-- There is exactly one `A`-linear map `Ωⁿ → Ωⁿ⁺¹` with the elementary-form rule: existence is the
descent of `δₙ` along `qₙ`, uniqueness is `d_unique` (README 2.7–2.9). -/
theorem existsUnique_isDeRhamDifferential (n : ℕ) :
    ∃! f : Forms A B n →ₗ[A] Forms A B (n + 1), IsDeRhamDifferential A B n f := by
  sorry

/-- Two maps with the elementary-form rule agree (`d_unique`, README 2.9). -/
theorem IsDeRhamDifferential.unique {n : ℕ} {f g : Forms A B n →ₗ[A] Forms A B (n + 1)}
    (hf : IsDeRhamDifferential A B n f) (hg : IsDeRhamDifferential A B n g) : f = g := by
  sorry

/-- The differential squares to zero (`d_squared`, README 2.10). -/
theorem IsDeRhamDifferential.comp_eq_zero {n : ℕ} {d₀ : Forms A B n →ₗ[A] Forms A B (n + 1)}
    {d₁ : Forms A B (n + 1) →ₗ[A] Forms A B (n + 1 + 1)}
    (h₀ : IsDeRhamDifferential A B n d₀) (h₁ : IsDeRhamDifferential A B (n + 1) d₁) :
    d₁.comp d₀ = 0 := by
  sorry

/-- The graded Leibniz identity `d(α ∧ β) = dα ∧ β + (−1)ᵐ α ∧ dβ` (`d_leibniz`, README 2.11). -/
theorem IsDeRhamDifferential.leibniz {m n : ℕ} {dm : Forms A B m →ₗ[A] Forms A B (m + 1)}
    {dn : Forms A B n →ₗ[A] Forms A B (n + 1)}
    {dmn : Forms A B (m + n) →ₗ[A] Forms A B (m + n + 1)}
    (hm : IsDeRhamDifferential A B m dm) (hn : IsDeRhamDifferential A B n dn)
    (hmn : IsDeRhamDifferential A B (m + n) dmn) (x : Forms A B m) (y : Forms A B n) :
    (dmn (wedge A B x y)).val = (dm x).val * y.val + (-1 : B) ^ m • (x.val * (dn y).val) := by
  sorry

/-- In degree zero the differential is the universal derivation (`d_zero_degree`). -/
theorem IsDeRhamDifferential.zero_degree {f : Forms A B 0 →ₗ[A] Forms A B (0 + 1)}
    (hf : IsDeRhamDifferential A B 0 f) (b : B) :
    (exteriorPower.oneEquiv B (KaehlerDifferential A B)) (f (zeroForm A B b)) =
      KaehlerDifferential.D A B b := by
  sorry

/-- Over a nonzero base, `d(t·1) ≠ t·d(1)` in the polynomial de Rham complex. This gives the
base-linearity obstruction for the finite Hodge quotient of README 5.8. -/
theorem IsDeRhamDifferential.polynomial_not_linear (R : Type u) [CommRing R] [Nontrivial R]
    {f : Forms R (Polynomial R) 0 →ₗ[R] Forms R (Polynomial R) (0 + 1)}
    (hf : IsDeRhamDifferential R (Polynomial R) 0 f) :
    f (zeroForm R (Polynomial R) Polynomial.X) ≠
      (Polynomial.X : Polynomial R) • f (zeroForm R (Polynomial R) 1) := by
  sorry

/-- The differential is linear for the Frobenius-twisted action: `d(bᵖ ω) = bᵖ dω` in
characteristic `p` (`d_frobenius_smul`, README 3.1). -/
theorem IsDeRhamDifferential.frobenius_smul (p : ℕ) [Fact p.Prime] [CharP A p] [CharP B p]
    {n : ℕ} {f : Forms A B n →ₗ[A] Forms A B (n + 1)} (hf : IsDeRhamDifferential A B n f)
    (b : B) (x : Forms A B n) : f (b ^ p • x) = b ^ p • f x := by
  sorry

variable {A B}
variable {C E : Type u} [CommRing C] [CommRing E] [Algebra A C] [Algebra A E]

/-- The characterizing property of the pullback `DeRham.pullback f n` of README 2.13: on elementary
forms, `c dv₁ ∧ … ∧ dvₙ ↦ f(c) d(f v₁) ∧ … ∧ d(f vₙ)` (`pullback_elementary`). -/
def IsFormPullback (f : B →ₐ[A] C) (n : ℕ) (g : Forms A B n →ₛₗ[f.toRingHom] Forms A C n) :
    Prop :=
  ∀ (c : B) (v : Fin n → B), g (elementary A B n c v) = elementary A C n (f c) (fun i => f (v i))

/-- The pullback exists and is unique (README 2.13–2.14). -/
theorem existsUnique_isFormPullback (f : B →ₐ[A] C) (n : ℕ) :
    ∃! g : Forms A B n →ₛₗ[f.toRingHom] Forms A C n, IsFormPullback f n g := by
  sorry

/-- In degree one the pullback is Tau Ceti's `KaehlerDifferential.mapSemilinear`. -/
theorem IsFormPullback.one_eq_mapSemilinear {f : B →ₐ[A] C}
    {g : Forms A B 1 →ₛₗ[f.toRingHom] Forms A C 1} (hg : IsFormPullback f 1 g)
    (x : Forms A B 1) :
    (exteriorPower.oneEquiv C (KaehlerDifferential A C)) (g x) =
      KaehlerDifferential.mapSemilinear f ((exteriorPower.oneEquiv B (KaehlerDifferential A B)) x) := by
  sorry

/-- Pullback commutes with the differential (`pullback_d`, README 2.15). -/
theorem IsFormPullback.comm_d {f : B →ₐ[A] C} {n : ℕ}
    {g : Forms A B n →ₛₗ[f.toRingHom] Forms A C n}
    {g' : Forms A B (n + 1) →ₛₗ[f.toRingHom] Forms A C (n + 1)}
    {dB : Forms A B n →ₗ[A] Forms A B (n + 1)} {dC : Forms A C n →ₗ[A] Forms A C (n + 1)}
    (hg : IsFormPullback f n g) (hg' : IsFormPullback f (n + 1) g')
    (hB : IsDeRhamDifferential A B n dB) (hC : IsDeRhamDifferential A C n dC) (x : Forms A B n) :
    g' (dB x) = dC (g x) := by
  sorry

/-- Pullback preserves wedge products (`pullback_wedge`, README 2.16). -/
theorem IsFormPullback.wedge {f : B →ₐ[A] C} {m n : ℕ}
    {gm : Forms A B m →ₛₗ[f.toRingHom] Forms A C m}
    {gn : Forms A B n →ₛₗ[f.toRingHom] Forms A C n}
    {gmn : Forms A B (m + n) →ₛₗ[f.toRingHom] Forms A C (m + n)}
    (hm : IsFormPullback f m gm) (hn : IsFormPullback f n gn) (hmn : IsFormPullback f (m + n) gmn)
    (x : Forms A B m) (y : Forms A B n) :
    gmn (DeRham.wedge A B x y) = DeRham.wedge A C (gm x) (gn y) := by
  sorry

/-- Pullback along the identity is the identity (`pullback_id`, README 2.17). -/
theorem IsFormPullback.id_apply {n : ℕ}
    {g : Forms A B n →ₛₗ[(AlgHom.id A B).toRingHom] Forms A B n}
    (hg : IsFormPullback (AlgHom.id A B) n g) (x : Forms A B n) : g x = x := by
  sorry

/-- Pullbacks compose (`pullback_comp`, README 2.18). -/
theorem IsFormPullback.comp_apply {f : B →ₐ[A] C} {f' : C →ₐ[A] E} {n : ℕ}
    {g : Forms A B n →ₛₗ[f.toRingHom] Forms A C n}
    {g' : Forms A C n →ₛₗ[f'.toRingHom] Forms A E n}
    {g'' : Forms A B n →ₛₗ[(f'.comp f).toRingHom] Forms A E n}
    (hg : IsFormPullback f n g) (hg' : IsFormPullback f' n g')
    (hg'' : IsFormPullback (f'.comp f) n g'') (x : Forms A B n) : g'' x = g' (g x) := by
  sorry

/-- Degree-zero pullback agrees with `f` under `Ω⁰ ≃ B` (README 2.13). -/
theorem IsFormPullback.zero_degree {f : B →ₐ[A] C} {g : Forms A B 0 →ₛₗ[f.toRingHom] Forms A C 0}
    (hg : IsFormPullback f 0 g) (b : B) : g (zeroForm A B b) = zeroForm A C (f b) := by
  sorry

end DeRham

namespace DerivedDeRham

/-- The degreewise part of ordinary base change: `C ⊗_A Ωⁿ_(B/A) ≃ Ωⁿ_(C ⊗_A B/C)`. The differential
compatibility and the polynomial Künneth equivalence of `ordinaryBaseChangeKunneth` (README 2.20) are
further requirements. -/
theorem ordinaryBaseChangeKunneth (A B C : Type) [CommRing A] [CommRing B] [CommRing C]
    [Algebra A B] [Algebra A C] (n : ℕ) :
    Nonempty ((C ⊗[A] DeRham.Forms A B n) ≃ₗ[C] DeRham.Forms C (C ⊗[A] B) n) := by
  sorry

end DerivedDeRham

/-! ## Layer 5: Quasisyntomic descent, periods and geometric control -/

namespace DerivedDeRham

/-- The derived category of sheaves of modules over the base coefficient ring sheaf. Global
de Rham objects, raw lci objects and finite Hodge quotients use this carrier; README 5.8–5.8.1
compares it with the operations of EnhancedDerivedSheaves §§0.1–0.4. -/
abbrev baseLinearSheafDerived {C : Type} [SmallCategory C] {J : GrothendieckTopology C}
    (R : Sheaf J RingCat.{0}) :=
  letI := HasDerivedCategory.standard (SheafOfModules.{0} R)
  DerivedCategory (SheafOfModules.{0} R)

/-- The filtered derived category of module sheaves over the base coefficient ring sheaf,
with decreasing filtrations indexed by `ℤᵒᵖ`. README 5.8 compares the supplied ringed-site operations
with this carrier and transports them to filtered diagrams. -/
abbrev baseLinearFilteredDerived {C : Type} [SmallCategory C] {J : GrothendieckTopology C}
    (R : Sheaf J RingCat.{0}) :=
  letI := HasDerivedCategory.standard (ℤᵒᵖ ⥤ SheafOfModules.{0} R)
  DerivedCategory (ℤᵒᵖ ⥤ SheafOfModules.{0} R)

/-- The finite-support inclusion from the raw divided-power vector space to its Hodge
completion is not surjective: the constant coefficient sequence `1` is outside its image.
These are the underlying carriers for `dR_(F_p/F_p[t])` and its Hodge completion, respectively
(README 5.8.1; Bhatt, Lemma 3.29 and Remark 3.33). -/
theorem test_raw_lci_hodge_completion (p : ℕ) [Fact p.Prime] :
    ¬ Function.Surjective (fun v : ℕ →₀ ZMod p => (v : ℕ → ZMod p)) := by
  sorry

/-- **`Z_p(1)`**, the compatible systems of p-power roots of unity of a p-adically complete ring
`O`: the kernel of Mathlib's untilt `PreTilt O p →* O`, written multiplicatively (README 5.11). -/
def compatibleRootsOfUnity (O : Type) [CommRing O] (p : ℕ) [Fact p.Prime]
    [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] : Submonoid (PreTilt O p) :=
  MonoidHom.mker PreTilt.untilt

/-- For `ε ∈ Z_p(1)`, `θ([ε]) = ε^♯ = 1`, so `[ε] − 1 ∈ ker θ` and `log [ε]` is defined in `A_cris`
(README 5.11, 6.21). -/
theorem teichmuller_sub_one_mem_ker_fontaineTheta (O : Type) [CommRing O] (p : ℕ) [Fact p.Prime]
    [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O]
    (ε : PreTilt O p) (hε : ε ∈ compatibleRootsOfUnity O p) :
    WittVector.teichmuller p ε - 1 ∈ RingHom.ker (WittVector.fontaineTheta O p) := by
  sorry

/-- An untilt different from `1` excludes membership in the compatible root systems
(test_period_roots_kernel). -/
example (O : Type) [CommRing O] (p : ℕ) [Fact p.Prime] [Fact ¬IsUnit (p : O)]
    [IsAdicComplete (Ideal.span {(p : O)}) O] (x : PreTilt O p) (hx : PreTilt.untilt x ≠ 1) :
    x ∉ compatibleRootsOfUnity O p := by
  change PreTilt.untilt x ≠ 1
  exact hx

-- `B_dR⁺` and `B_dR` of README 5.13–5.14 are Mathlib's.
#check @BDeRhamPlus
#check @BDeRham

end DerivedDeRham

/-
The README specifies constructions whose full interfaces use the supplied module APIs.
DerivedModuleAlgebra §§0.1–0.17, 0.25 and 1.1–1.9 owns the cotangent complex, tensor, powers,
module limits, completion and complete flatness. Its §1.T.1 supplies the Milnor sequence.
EnhancedDerivedSheaves §§E1.F3.H1 and E1.8.DMA.1 supplies the point-site Hom and affine tensor
comparisons. This roadmap constructs the filtered derived category, ordinary de Rham differential,
complex and pullback (`complex_d_apply`, `complex_d_nonadjacent`, `complex_X`, `complexMap_apply`,
`complexMap_id`, `complexMap_comp`, `pullback_smul`, `pullback_base_smul`, `pullback_add`, `d_add`,
`d_base_smul`), derived de Rham and its filtrations and completions, simplicial square-zero lifting
using PerfectoidSpaces §P4.15.1, the adic `perfectSystemEffective` adapter to DerivedModuleAlgebra
§1.E.1, raw and completed descent (`cotangentFlatDescent`, `hodgeQuotientFlatDescent`,
`hodgeCompletedFlatDescent`, `pCompletedHodgeDescent`), `relativeConjugateTransitivity`, Cartier theory,
PD conjugate filtrations, quasisyntomic sites, proper smooth control and period descriptions.
README 5.1's `quasisyntomicSite` constructs the big slice QSyn_R for an arbitrary ring R.
Its small-site construction qSyn_R and `qSynRelativeInclusion` take an explicit witness
hR : R ∈ QSyn. For a relative quasisyntomic R-algebra A, cotangent transitivity and complete
flatness give A ∈ QSyn (`test_qsyn_site_relative`). The identity of
S = F_p[x,y]/(x,y)² is a relative quasisyntomic cover for every prime p, including p = 2,
but S ∉ QSyn (`test_qsyn_site_nonlci`), so it cannot be the base of this small-site inclusion.
The small relative variants of README 5.4's `qrspRefinement` and 5.5's `qrspUnfolding` take
the same base witness and use the QRSP objects in qSyn_R under `qSynRelativeInclusion`;
their big-slice variants allow arbitrary R. README 5.17's `uncompletedPDeRhamDescent`
requires a witness R ∈ QSyn for the small relative site. README 5.16's
`relativeTorAmplitude` uses the same base hypothesis for its relative QRSP assertion.
The base-linear sheaf and filtration adapters compare EnhancedDerivedSheaves §§0.1–0.3 and E1.4;
`schemeDeRhamRealization` and `schemeDeRhamCup` supply realization and cup products.
README 5.8.1 constructs `rawLciDeRhamSheaves`, with `rawLciDeRhamAffine`,
`rawLciDeRhamLocalization`, `rawLciDeRhamRealization` and `rawLciDeRhamCup`, for lci maps of flat
Z/p^n-schemes, n ≥ 1, without relative flatness. These recover raw affine values and are compatible
with Zariski restriction and refinement, base-linear realization, products, Hodge stages and
the map to completion; `schemeDeRhamAffine` of README 5.8 recovers Hodge completion.
CrystallineCohomology §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.5, CR.DDR.5.8–CR.DDR.5.10,
CR.DDR.5.18, CR.DDR.5.20–CR.DDR.5.22 and CR.DDR.6.1–CR.DDR.6.20 owns crystalline comparisons,
derived de Rham–Witt and logarithmic applications of README 6.20's shared constructors.
README 5.12 constructs the principal derived period
`periodRegularEnvelopeComparison` and `acrisDerivedDescription` using PadicPeriodRings §3's
ordinary O_C envelope, presentation, p-adic completion and θ_cris under
`Crystalline.fontaineEnvelope_periodPDEnvelope`; its integral perfectoid
generalization retains the regular-envelope hypothesis. README 6.20 owns the public
`freePrelogResolutions`, `freePrelogUniversal`, `prelogResolutionAugmentation`,
`prelogResolutionComparison` and `prelogHomotopyPushout`, together with log differentials,
`gabberLogCotangent`, `logCotangentH0`, `logCotangentOrdinaryMap`, `logCotangentNaturality`
and `logCotangentFunctoriality`. The latter supplies transitivity, homotopy base change,
filtered colimits, integral cotangent logification invariance and the morphism from ordinary
transitivity triangles, including their connecting arrows. The same section owns
`logDerivedDeRham`, `logDeRhamDLog`, `logDeRhamOrdinaryMap`, `logDeRhamHodgeGraded`,
`logDeRhamStrict`, `logDeRhamCompletions`, `logCartier` and `logificationBoundaries`.
Raw objects use direct sums; Hodge and p-completion remain separate. Log de Rham logification
invariance assumes integral prelog monoids over Z/p^n, n ≥ 1, or compatible derived reductions
for the p-completed assertion. CrystallineCohomology §§CR.DDR.6.1–CR.DDR.6.2,
CR.DDR.6.4–CR.DDR.6.5, CR.DDR.6.7 and CR.DDR.6.9–CR.DDR.6.10 import these public
constructors and laws, and add their derivation classifiers, comparisons and descent results.
README 6.20's `periodLogSpecialization` makes its period objects and maps definitional
specializations of these constructors. It preserves the ordinary-to-log maps, d log, the
transitivity boundary ψ, products, Hodge filtrations, conjugate filtrations on reductions,
p-completion and Galois/valued-embedding functoriality. The period specialization supplies
`periodLogComparisonData`, `periodLogCotangentComparison`, `periodLogDeRhamComparison` and
`periodLogDLogFirstGraded`, including the canonical transitivity boundary and its nonzero Tate class.
README 6.21's conditional `logPeriodDlog`, `logPeriodOrdinaryComparison`, `periodDLogTate`,
`periodDLogFormula` and `periodDLogFirstGraded` apply to these constructed data to give
`periodDLogCanonical`, the unconditional identification of the public `logDeRhamDLog` on
the actual period prelog ring with log[ε]. Its first graded map is the specified transitivity
boundary ψ_n([ε] − 1) = ε_n⁻¹ dε_n. The range is README 5.11, including p = 2 and arbitrary
perfect residue fields, also together at p = 2, k = F₂(u)^perf.
README 5.13's `periodMapComparison` identifies the derived/Hodge period map with PadicPeriodRings
§4.1's ordinary map under `Crystalline.fontaineEnvelope_periodPDEnvelope`. It preserves θ,
Galois actions, filtrations and functorial maps; the source identification intertwines Witt
Frobenius, with no Frobenius on B_dR⁺ asserted.
The period interfaces `bdrPlusStructure` and `tateTwistInvariants` compare PadicPeriodRings
§§1.1–1.5's `padicComplexGaloisAction`, `padicComplex_fixed_eq`, `tate_H0_padicComplex_twist`
and period structures for finite local fields, and §§2, 4.1's `PadicFieldCompletion`, `tateSen_H0`
and `generalBasePeriodRings` for arbitrary perfect residue fields. The derived/PD-filtered
`A_cris` description and its `Fil²` vanishing consequence are in README 5.12–5.15, on the same
PadicPeriodRings §3 completed envelope and using its §4.1 equivariant period map.
-/

end

end TauCetiRoadmap.DerivedDeRhamCohomology

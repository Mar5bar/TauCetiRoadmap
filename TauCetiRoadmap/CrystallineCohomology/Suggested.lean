import Mathlib
import TauCeti.RingTheory.DividedPowers.Associative
import TauCeti.RingTheory.Henselian.Teichmuller
import TauCeti.RingTheory.Nilpotent.Exp
import TauCeti.RingTheory.WittVector.Complete
import TauCeti.RingTheory.WittVector.Frobenius

/-!
# CrystallineCohomology: representative target signatures

The roadmap is `README.md` in this directory; this file is not exhaustive. It records the
definitions that can be given real bodies against the pinned Mathlib and Tau Ceti, and the end
theorems and layer milestones whose carriers exist at the pins, proved by `sorry`. The heavy
objects of the roadmap (divided power envelopes as rings, crystalline and log crystalline sites,
crystals, de Rham–Witt complexes of rings, Hyodo–Kato complexes, Dieudonné crystals) are README
targets; the closing comment lists them.

Design choices made explicit here:
- Divided powers are Mathlib's `DividedPowers`: total operations that vanish outside the ideal,
  with integer coefficients `choose` and `uniformBell`. Divided power morphisms are Mathlib's
  `DividedPowers.IsDPMorphism`.
- The augmentation of the divided power algebra is Mathlib's `DividedPowerAlgebra.lift` into the
  zero ideal along the zero map, and the augmentation ideal is its kernel.
- A Dieudonné complex is a cochain complex of abelian groups (`ModuleCat ℤ`, indexed by `ℤ`) with
  a graded endomorphism `F` satisfying `d ∘ F = p • (F ∘ d)`; `F` is not a map of complexes.
- Monoids for log structures are written multiplicatively, as in rings; fine means cancellative
  and finitely generated, and saturation is tested in Mathlib's `Algebra.GrothendieckGroup`.
- `(φ, N)`-modules are built on Mathlib's `WittVector.Isocrystal`, with `N φ = p φ N`.
-/

namespace TauCetiRoadmap.CrystallineCohomology

open Finset

universe u v

#check Perfection.teichmuller₀
#check Perfection.mk_teichmuller₀
#check PerfectionMap.id
#check TauCeti.Associative.dividedPower_eq_dpow
#check TauCeti.teichmuller
#check TauCeti.nilpotentExpUnit
#check WittVector.isAdicComplete_span_p_teichmuller
#check WittVector.frobenius_teichmuller

/-! ## Layer CR.0: Divided powers and universal thickenings -/

namespace PD

variable {A : Type*} [CommRing A]

/-- An additive divided-power candidate on an ideal `I`: operations `δ_n : A → A` vanishing
outside `I`, with `δ₀ = 1`, `δ₁ = id` on `I`, `δ_n(I) ⊆ I` for `n > 0`, the addition formula and
homogeneity, but neither the multiplication nor the iteration identity (Stacks, Lemma 23.2.4,
hypothesis (a)). Belongs to Layer CR.0. -/
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

/-- The candidate vanishes outside the ideal in degree zero as well. -/
example (δ : AdditivePowers I) {x : A} (hx : x ∉ I) : δ.dpow 0 x = 0 := δ.dpow_null hx

/-- In positive degree the candidate vanishes at zero. -/
example (δ : AdditivePowers I) : δ.dpow 2 0 = 0 := by
  have h := δ.dpow_mul (n := 2) (a := 0) (x := 0) I.zero_mem
  simpa using h

/-- Over a rational algebra the candidate from divided powers has the factorial formula
on its ideal (test_candidate_rational). -/
example {R : Type*} [CommRing R] [Algebra ℚ R] {J : Ideal R}
    (γ : DividedPowers J) {x : R} (hx : x ∈ J) (n : ℕ) :
    (ofDividedPowers γ).dpow n x = TauCeti.Associative.dividedPower n x ∧
      (ofDividedPowers γ).dpow n x = Ring.inverse (n.factorial : R) * x ^ n := by
  sorry

open scoped Classical in
/-- On the dual numbers over `ZMod 2`, an additive candidate can fail the multiplication
identity in degrees one and two (test_candidate_not_pd). -/
example :
    let B := Polynomial (ZMod 2) ⧸ Ideal.span {(Polynomial.X : Polynomial (ZMod 2)) ^ 2}
    let ε : B := Ideal.Quotient.mk _ Polynomial.X
    let J := Ideal.span {ε}
    ∃ δ : AdditivePowers J,
      (∀ n x, δ.dpow n x = if x ∈ J then
        if n = 0 then 1 else if n = 1 ∨ n = 3 then x else 0 else 0) ∧
      δ.dpow 1 ε * δ.dpow 2 ε ≠ (3 : B) * δ.dpow 3 ε := by
  sorry

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

/-- The glued structure on `I ⊔ J` is unique. -/
theorem dividedPowers_sup_unique {I J : Ideal A} (γ : DividedPowers I) (ε : DividedPowers J)
    (θ θ' : DividedPowers (I ⊔ J))
    (hθ : (∀ n, ∀ x ∈ I, θ.dpow n x = γ.dpow n x) ∧ ∀ n, ∀ x ∈ J, θ.dpow n x = ε.dpow n x)
    (hθ' : (∀ n, ∀ x ∈ I, θ'.dpow n x = γ.dpow n x) ∧ ∀ n, ∀ x ∈ J, θ'.dpow n x = ε.dpow n x) :
    θ = θ' := by
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

example (p : ℕ) (A : Type*) [CommRing A] : canonicalCoeff p A 0 = 1 := by
  simp [canonicalCoeff]

/-- At `p = 2`, the degree-two coefficient is `2`, rather than `4`. -/
example : canonicalCoeff 2 ℚ 2 = 2 := by
  sorry

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

/-! ### The divided power algebra and its augmentation ideal -/

section Augmentation

variable (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M]

/-- The augmentation `ε : Γ_R(M) → R`, `dp₀(m) ↦ 1`, `dp_n(m) ↦ 0` for `n > 0`: the lift into the
zero ideal of `R` along the zero map. -/
noncomputable def augmentation : DividedPowerAlgebra R M →ₐ[R] R :=
  DividedPowerAlgebra.lift (dividedPowersBot R) (0 : M →ₗ[R] R) (fun _ ↦ by simp)

/-- The augmentation ideal `Γ_R(M)₊ = ker ε`. -/
noncomputable def augmentationIdeal : Ideal (DividedPowerAlgebra R M) :=
  RingHom.ker (augmentation R M)

/-- The augmentation sends `dp₀(m)` to `1` and `dp_n(m)` to `0` for `n > 0`. -/
example (m : M) : augmentation R M (DividedPowerAlgebra.dp R 0 m) = 1 := by
  sorry

example (n : ℕ) (hn : n ≠ 0) (m : M) : DividedPowerAlgebra.dp R n m ∈ augmentationIdeal R M := by
  sorry

/-- A scalar lies in the augmentation ideal only if it is zero. -/
example (r : R) (hr : algebraMap R (DividedPowerAlgebra R M) r ∈ augmentationIdeal R M) :
    r = 0 := by
  sorry

/-- The canonical divided powers on the augmentation ideal (Stacks, Lemma 23.5.1): the unique
structure with `δ_n(dp₁ m) = dp_n m`. -/
theorem existsUnique_dividedPowers_augmentationIdeal :
    ∃! δ : DividedPowers (augmentationIdeal R M),
      ∀ (n : ℕ) (m : M), δ.dpow n (DividedPowerAlgebra.dp R 1 m) =
        DividedPowerAlgebra.dp R n m := by
  sorry

/-- Degree one does not generate the augmentation ideal in characteristic two: for
`R = ZMod 2` and `M = R`, `dp₂(1)` is not in the ideal generated by the `dp₁(m)`. -/
theorem dp_two_not_mem_span_dp_one :
    DividedPowerAlgebra.dp (ZMod 2) 2 (1 : ZMod 2) ∉
      Ideal.span (Set.range fun m : ZMod 2 ↦ DividedPowerAlgebra.dp (ZMod 2) 1 m) := by
  sorry

open scoped Classical in
/-- Rational evaluation on `dp₂(1)` is distinct from augmentation
(augmentation_test_not_evaluation). -/
example :
    DividedPowerAlgebra.lift
      (DividedPowers.RatAlgebra.dividedPowers (⊤ : Ideal ℚ))
      (LinearMap.id : ℚ →ₗ[ℚ] ℚ) (fun _ ↦ by simp)
      (DividedPowerAlgebra.dp ℚ 2 (1 : ℚ)) = 1 / 2 ∧
    augmentation ℚ ℚ (DividedPowerAlgebra.dp ℚ 2 (1 : ℚ)) = 0 := by
  sorry

end Augmentation

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

/-- Positive steps of the zero ideal's PD filtration vanish. -/
example (n : ℕ) (hn : n ≠ 0) : pdFiltration (dividedPowersBot A) n = ⊥ := by
  sorry

theorem pdFiltration_zero (γ : DividedPowers I) : pdFiltration γ 0 = ⊤ := by
  rw [eq_top_iff, ← Ideal.span_singleton_one]
  refine Ideal.span_mono ?_
  rintro _ rfl
  exact ⟨0, Fin.elim0, Fin.elim0, fun j ↦ j.elim0, by simp, by simp⟩

theorem pdFiltration_one (γ : DividedPowers I) : pdFiltration γ 1 = I := by
  sorry

theorem pow_le_pdFiltration (γ : DividedPowers I) (n : ℕ) : I ^ n ≤ pdFiltration γ n := by
  sorry

/-- The zero ideal with its unique divided powers is PD nilpotent. -/
example : IsPDNilpotent (dividedPowersBot A) := by
  sorry

/-- The canonical 2-adic PD filtration differs from ordinary ideal powers: its second
step contains `2`, whereas the ordinary square does not. -/
example :
    (2 : ℤ_[2]) ∈ pdFiltration (PadicInt.dividedPowers 2) 2 ∧
      (2 : ℤ_[2]) ∉ (Ideal.span {(2 : ℤ_[2])}) ^ 2 := by
  sorry

open scoped Classical in
/-- The square-zero ideal `(2)` of `ZMod 4` supports both PD-nilpotent square-zero powers
and non-PD-nilpotent canonical powers (test_nilpotent_two_structures). -/
example :
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

/-- Coefficients of the nonsymmetric second-order thickening over `ZMod 2`: the diagonal
quadratic term is zero on each basis vector and nonzero on their sum, and the symmetric
cross-product equals `1` in the second-order summand. -/
example :
    let q : (ZMod 2 × ZMod 2) → (ZMod 2 × ZMod 2) → ZMod 2 := fun z z' ↦ z.1 * z'.2
    let e₁ : ZMod 2 × ZMod 2 := (1, 0)
    let e₂ : ZMod 2 × ZMod 2 := (0, 1)
    q e₁ e₁ = 0 ∧ q e₂ e₂ = 0 ∧ q (e₁ + e₂) (e₁ + e₂) = 1 ∧
      q e₁ e₂ + q e₂ e₁ = 1 := by
  decide

open scoped TensorProduct in
/-- The tensor-product ring in the identity-leg PD pushout Check has the original carrier. -/
example : Nonempty ((ZMod 4 ⊗[ℤ] ℤ) ≃ₐ[ℤ] ZMod 4) := by
  sorry

open scoped TensorProduct in
/-- The zero-ideal PD pushout of two copies of `ZMod 2` over `ℤ` has the ordinary tensor ring. -/
example : Nonempty ((ZMod 2 ⊗[ℤ] ZMod 2) ≃ₐ[ℤ] ZMod 2) := by
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

/-- A divided power structure is compatible with itself. -/
example (γ : DividedPowers I) : IsCompatibleWith (RingHom.id A) γ γ := by
  sorry

/-- The zero PD ideal is compatible with every divided power structure on the same ring. -/
example (γ : DividedPowers I) : IsCompatibleWith (RingHom.id A) (dividedPowersBot A) γ := by
  sorry

/-- `(D, J', δ)` with `ι : B → D` is a divided power envelope of `J ⊆ B` relative to `(A, I, γ)`:
`ι(J) ⊆ J'`, `A → D` is a divided power morphism, and every `A`-algebra map `B → C` sending `J` into
a divided power ideal `K` compatible with `γ` factors uniquely through a divided power morphism
`D → C`. -/
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

/-- The identity PD envelope has the original ring and ideal. -/
example (A : Type u) [CommRing A] (I : Ideal A) (γ : DividedPowers I) :
    IsPDEnvelope γ I γ (AlgHom.id A A) := by
  sorry

end PD

/-! ## Layer CR.1: Crystalline sites, structure sheaves and crystals -/

namespace Crystalline

open TensorProduct

/-- A connection on a `B`-module `M` relative to `A`: an additive map `∇ : M → M ⊗_B Ω¹_{B/A}`
with the Leibniz rule `∇(b m) = b ∇m + m ⊗ db`. Integrability and quasi-nilpotence are README
targets (Layer CR.1). -/
structure Connection (A B M : Type*) [CommRing A] [CommRing B] [Algebra A B] [AddCommGroup M]
    [Module B M] where
  /-- The map `∇`. -/
  toFun : M →+ M ⊗[B] Ω[B⁄A]
  leibniz : ∀ (b : B) (m : M),
    toFun (b • m) = b • toFun m + m ⊗ₜ KaehlerDifferential.D A B b

/-- The trivial connection `∇ = d` on `B` itself exists. -/
example (A B : Type*) [CommRing A] [CommRing B] [Algebra A B] :
    Nonempty (Connection A B B) := by
  sorry

end Crystalline

/-! ## Layer CR.4: Ordinary and relative de Rham–Witt complexes -/

namespace Crystalline

open CategoryTheory

/-- The first `r` ghost components jointly determine a truncated Witt vector over a
`p`-torsion-free ring, by cancellation in the triangular ghost equations. -/
theorem truncatedGhost_injective (p r : ℕ) [Fact p.Prime] (R : Type*) [CommRing R]
    (hR : Function.Injective (fun x : R ↦ (p : R) * x)) :
    Function.Injective (fun x : TruncatedWittVector p r R ↦
      fun i : Fin r ↦ WittVector.ghostComponent i.val x.out) := by
  sorry

/-- A Dieudonné complex (Bhatt–Lurie–Mathew, Definition 2.1.1): a cochain complex of abelian
groups with a graded endomorphism `F` satisfying `d(F x) = p F(d x)`. -/
structure DieudonneComplex (p : ℕ) where
  /-- The underlying cochain complex of abelian groups. -/
  complex : CochainComplex (ModuleCat.{u} ℤ) ℤ
  /-- The Frobenius, degree by degree. -/
  F : ∀ n, Module.End ℤ (complex.X n)
  comm : ∀ n x, (complex.d n (n + 1)).hom (F n x) = p • F (n + 1) ((complex.d n (n + 1)).hom x)

namespace DieudonneComplex

variable {p : ℕ} (M : DieudonneComplex.{u} p)

/-- Saturation (Bhatt–Lurie–Mathew, Definition 2.2.1): `M` is termwise `p`-torsion-free, `F` is
injective, and the image of `F` in degree `n` is `{x | d x ∈ p M^{n+1}}`. -/
def IsSaturated : Prop :=
  (∀ n, Function.Injective (fun x : M.complex.X n ↦ p • x)) ∧
  (∀ n, Function.Injective (M.F n)) ∧
  ∀ n, Set.range (M.F n) =
    {x | ∃ y : M.complex.X (n + 1), (M.complex.d n (n + 1)).hom x = p • y}

/-- The iterates of `F` on a saturated complex (Bhatt–Lurie–Mathew, Proposition 2.2.5). -/
theorem range_F_iterate {M : DieudonneComplex.{u} p} (hM : M.IsSaturated) (r : ℕ) (n : ℤ) :
    Set.range (M.F n)^[r] =
      {x | ∃ y : M.complex.X (n + 1), (M.complex.d n (n + 1)).hom x = (p ^ r) • y} := by
  sorry

end DieudonneComplex

/-- On a Dieudonné complex with zero differential and `p`-torsion-free terms, saturation is
bijectivity of `F`. -/
example {p : ℕ} (M : DieudonneComplex.{u} p)
    (hp : ∀ n, Function.Injective (fun x : M.complex.X n ↦ p • x))
    (hd : ∀ n, M.complex.d n (n + 1) = 0) :
    M.IsSaturated ↔ ∀ n, Function.Bijective (M.F n) := by
  sorry

end Crystalline

/-! ## Layer CR.3:duality: Trace and Poincaré duality -/

namespace Crystalline

/-- The trace-normalization sign for the Čech differential `δ + (−1)^r d` and cup
sign `(−1)^(s t)` on bidegrees `(r,s)` and `(t,u)`: `h^d = cechTraceSign d • [ω]`. -/
def cechTraceSign (d : ℕ) : ℤ := (-1) ^ (d * (d - 1) / 2)

example : cechTraceSign 0 = 1 := by norm_num [cechTraceSign]
example : cechTraceSign 1 = 1 := by norm_num [cechTraceSign]
example : cechTraceSign 2 = -1 := by norm_num [cechTraceSign]

end Crystalline

/-! ## Layer CR.5:log-algebra: Logarithmic structures -/

namespace LogCrystalline

open Algebra

/-- A commutative monoid is fine if it is integral (cancellative) and finitely generated. Fine does
not imply saturated. -/
def IsFineMonoid (P : Type*) [CommMonoid P] : Prop :=
  IsCancelMul P ∧ Monoid.FG P

/-- An integral monoid `P` is saturated if `gⁿ ∈ P` with `n > 0` implies `g ∈ P` for every `g` in
the Grothendieck group `P^gp`. -/
def IsSaturatedMonoid (P : Type*) [CommMonoid P] : Prop :=
  IsCancelMul P ∧ ∀ (g : GrothendieckGroup P) (n : ℕ), n ≠ 0 →
    g ^ n ∈ Set.range (GrothendieckGroup.of (M := P)) → g ∈ Set.range (GrothendieckGroup.of (M := P))

/-- A Kummer homomorphism of integral monoids: injective, and every element of the target has a
positive power in the image. -/
def IsKummerHom {P Q : Type*} [CommMonoid P] [CommMonoid Q] [IsCancelMul P] [IsCancelMul Q] (f : P →* Q) : Prop :=
  Function.Injective f ∧ ∀ q : Q, ∃ n : ℕ, n ≠ 0 ∧ q ^ n ∈ Set.range f

/-- A prelog ring: a commutative ring `A`, a commutative monoid `P` and a monoid homomorphism
`α : P → (A, ×)`; elements may map to zero. The monoid is bundled as Mathlib's `CommMonCat`. -/
structure PrelogRing (A : Type u) [CommRing A] where
  /-- The monoid. -/
  P : CommMonCat.{v}
  /-- The structure map. -/
  α : P →* A

/-- A prelog ring is a log ring if `α` restricts to a bijection from `α⁻¹(A^×)` onto `A^×`. -/
def PrelogRing.IsLog {A : Type u} [CommRing A] (L : PrelogRing.{u, v} A) : Prop :=
  Function.Bijective fun m : {m : L.P // IsUnit (L.α m)} ↦ (⟨L.α m, m.2⟩ : {a : A // IsUnit a})

/-- The trivial log structure `A^× → A` is a log ring. -/
example (A : Type u) [CommRing A] :
    (⟨CommMonCat.of Aˣ, Units.coeHom A⟩ : PrelogRing.{u, u} A).IsLog := by
  sorry

/-- The prelog chart `n ↦ (−1)ⁿ` is not a log ring, including in characteristic two:
`0` and `2` are distinct monoid elements with the same unit image `1`. -/
example (A : Type u) [CommRing A] :
    ¬ (⟨CommMonCat.of (Multiplicative ℕ), powersHom A (-1 : A)⟩ : PrelogRing.{u, 0} A).IsLog := by
  sorry

/-- The collision in the preceding negative control persists in characteristic two. -/
example : (-1 : ZMod 2) ^ 0 = (-1 : ZMod 2) ^ 2 := by decide

/-- The free monoid on one generator (written `Multiplicative ℕ`) is fine and saturated. -/
example : IsFineMonoid (Multiplicative ℕ) ∧ IsSaturatedMonoid (Multiplicative ℕ) := by
  sorry

/-- The numerical monoid generated by `2` and `3` is fine but not saturated: `t` is not in it
although `t²` is. -/
example : IsFineMonoid (Submonoid.closure
      ({Multiplicative.ofAdd 2, Multiplicative.ofAdd 3} : Set (Multiplicative ℕ))) ∧
    ¬ IsSaturatedMonoid (Submonoid.closure
      ({Multiplicative.ofAdd 2, Multiplicative.ofAdd 3} : Set (Multiplicative ℕ))) := by
  sorry

/-- The `n`-th power map of `ℕ` is Kummer for `n ≠ 0`; Kummer fails for the zero map. -/
example (n : ℕ) (hn : n ≠ 0) : IsKummerHom (powMonoidHom n : Multiplicative ℕ →* Multiplicative ℕ) := by
  sorry

/-- The zero power map fails injectivity on the free monoid, so it is not Kummer. -/
example : ¬ IsKummerHom (powMonoidHom 0 : Multiplicative ℕ →* Multiplicative ℕ) := by
  intro h
  have heq : Multiplicative.ofAdd 0 = Multiplicative.ofAdd 1 := h.1 (by simp)
  have hnat : (0 : ℕ) = 1 := congrArg Multiplicative.toAdd heq
  norm_num at hnat

end LogCrystalline

/-! ## Layer CR.6: Hyodo–Kato complexes and semistable structure -/

namespace LogCrystalline

/-- At lengths two to one, Witt restriction sends `[t]` to `t`, while Frobenius sends it
to `t^p` on the strict smooth chart over `ZMod p` (Layer CR.6.1). -/
theorem logWitt_polynomial_R_F (p : ℕ) [Fact p.Prime] :
    (TruncatedWittVector.truncate (show 1 ≤ 2 by decide)
      (WittVector.truncate 2 (WittVector.teichmuller p
        (Polynomial.X : Polynomial (ZMod p))))).coeff ⟨0, by decide⟩ = Polynomial.X ∧
    (WittVector.truncate 1 (WittVector.frobenius (WittVector.teichmuller p
      (Polynomial.X : Polynomial (ZMod p))))).coeff ⟨0, by decide⟩ = Polynomial.X ^ p := by
  constructor
  · simp
  · rw [WittVector.coeff_truncate, WittVector.coeff_frobenius_charP,
      WittVector.teichmuller_coeff_zero]

/-- On `F_p[t]`, `V(t)` lies in the kernel of length-two restriction and outside the image
of multiplication by `p`. This witnesses why the finite log Witt exact sequence ends in a
quotient complex (Layer CR.6.1). -/
theorem logWitt_polynomial_V_not_p (p : ℕ) [Fact p.Prime] :
    let v := WittVector.truncate 2 (WittVector.verschiebung (WittVector.teichmuller p
      (Polynomial.X : Polynomial (ZMod p))))
    TruncatedWittVector.truncate (show 1 ≤ 2 by decide) v = 0 ∧
      ¬ ∃ w : TruncatedWittVector p 2 (Polynomial (ZMod p)), v = (p : _) * w := by
  sorry

/-- The length-one log Witt differential on a strict smooth polynomial chart is the ordinary
nonzero differential of its coordinate (Layer CR.6.1). -/
theorem logWitt_smooth_chart_differential (p : ℕ) [Fact p.Prime] :
    KaehlerDifferential.D (ZMod p) (Polynomial (ZMod p)) Polynomial.X ≠ 0 := by
  sorry

open WittVector
open scoped Isocrystal

variable (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p] [PerfectRing k p]

set_option backward.isDefEq.respectTransparency.types false in
/-- A `(φ, N)`-module over `K₀ = W(k)[1/p]`: an isocrystal with a `K₀`-linear monodromy operator
satisfying `N φ = p φ N`, the relation of the Hyodo–Kato operators. -/
structure PhiNModule (V : Type*) [AddCommGroup V] [Isocrystal p k V] where
  /-- The monodromy operator. -/
  N : V →ₗ[K(p, k)] V
  N_frobenius : ∀ x : V, N (Isocrystal.frobenius p k (V := V) x) =
    (p : K(p, k)) • Isocrystal.frobenius p k (V := V) (N x)

set_option backward.isDefEq.respectTransparency.types false in
/-- Zero monodromy gives a `(φ, N)`-module (the good-reduction case). -/
example (V : Type*) [AddCommGroup V] [Isocrystal p k V] : Nonempty (PhiNModule p k V) :=
  ⟨⟨0, fun x ↦ by simp⟩⟩

/-- Nilpotence of the monodromy (Layer CR.6, *Nilpotence of Hyodo–Kato monodromy*): on a
finite-dimensional `(φ, N)`-module, `N ^ dim = 0`. -/
theorem PhiNModule.N_pow_finrank_eq_zero {V : Type*} [AddCommGroup V] [Isocrystal p k V]
    [FiniteDimensional K(p, k) V] (D : PhiNModule p k V) :
    D.N ^ Module.finrank K(p, k) V = 0 := by
  sorry

/-- Coefficients of the two-term witness `x ↦ dx` for the signed inclusion
`C[−1] → C̃`: the two negative signs cancel. Raw right wedge fails this equality. -/
example : (1 : ℚ) = (-1) * (-1) ∧ (1 : ℚ) ≠ 1 * (-1) := by norm_num

/-- A rational coefficient witness for the direction `N φ = p φ N` at `p=2`:
`φ(a,b)=(a,2b)`, `N(a,b)=(b,0)`. -/
example (a b : ℚ) :
    let φ : ℚ × ℚ → ℚ × ℚ := fun x ↦ (x.1, 2 * x.2)
    let N : ℚ × ℚ → ℚ × ℚ := fun x ↦ (x.2, 0)
    N (φ (a, b)) = 2 • φ (N (a, b)) := by
  simp

/-- The reversed relation fails on the vector `(0,1)` of the same block. -/
example :
    let φ : ℚ × ℚ → ℚ × ℚ := fun x ↦ (x.1, 2 * x.2)
    let N : ℚ × ℚ → ℚ × ℚ := fun x ↦ (x.2, 0)
    φ (N (0, 1)) ≠ 2 • N (φ (0, 1)) := by
  norm_num

end LogCrystalline

/-!
## Definitions and constructions stated in the README

The sites, coefficient categories, envelopes, completions and cohomology functors below have their
intended signatures and APIs in the README. Their carriers are supplied by the mathematical
constructions there; this file records only the light definitions statable at the pins.


Layer CR.0: Additive divided-power candidates; Divided powers from identities on generators;
Convolution of two divided-power systems; The candidate on the sum of compatible ideals; Divided
powers on a compatible sum of ideals; Extension of divided powers on a principal ideal; The
scalar-extension coefficient formula; The additive candidate on a flat extension; Flat extension
of divided powers; Augmentation of the divided power algebra; Augmentation ideal; Scalar and
augmentation splitting; Divided power filtration; PD-nilpotent divided power ideals and ordinary
nilpotence; Canonical divided powers on the ideal generated by p; Compatibility of divided powers
with a base; Canonical divided powers on the augmentation ideal; Relative divided power polynomial
algebras; Divided powers on a square-zero extension; Universal base-compatible divided power
envelope; Completed PD envelopes and the derived-completion comparison; The crystalline period
ring A_cris of a p-adically complete ring.

Layer CR.1: Schemes with a quasi-coherent PD ideal; Small and big crystalline sites; Morphisms and
comparisons of crystalline sites; The étale crystalline sites; Structure, quotient and PD-ideal
sheaves; Quasi-coherent and finite locally free crystals; Rational crystals and nondegenerate
F-crystals; Universal PD differentials and the PD de Rham complex; Modules with integrable
connection and their de Rham complexes; PD stratifications on a smooth lift; Integrable
topologically quasi-nilpotent connections.

Layer CR.2: Enhanced crystalline direct image and global sections; Crystalline linearization along
a smooth embedding; Linearization in a smooth ambient scheme.

Layer CR.3: The crystalline first Chern class and the hyperplane class; Crystalline cup products;
Semilinear crystalline Frobenius and linearization.

Layer CR.4: Principal p-décalage on torsion-free complexes; Dieudonné complexes; Saturated
Frobenius; Verschiebung and the differential; Morphisms of Dieudonné complexes; Bockstein
reduction of principal p-décalage; Derived p-décalage and completion; Saturation by iterated
décalage; The Verschiebung filtration; Finite Verschiebung quotient complex; Projection to the
finite quotient; Restriction between finite quotients; Frobenius on finite quotients; Verschiebung
on finite quotients; Functorial finite quotients; Completion of a saturated Dieudonné complex;
Strict Dieudonné complexes; Strict Dieudonné towers; Canonical divided powers on the Verschiebung
ideal of W_r(R); Dieudonné algebras and multiplicative quotients; Universal saturated de Rham–Witt
complex; Relative Frobenius–Verschiebung procomplexes; Initial relative de Rham–Witt complex;
Classical de Rham–Witt complex as the initial V-pro-complex; Continuous relative de Rham–Witt
complex; Nygaard filtration and divided Frobenius; Logarithmic Hodge–Witt sheaves.

Layer CR.3:duality: Proper smooth crystalline trace; Finite étale crystalline transfer and trace;
Proper smooth crystalline Gysin maps; Diagonal class and crystalline coevaluation.

Layer CR.5:log-algebra: Prelog rings; Étale log structures; Associated log structures; Inverse
image log structures; Characteristic monoids; Integral monoids; Fine monoids; Saturated monoids;
Log charts; Strict morphisms; Exact morphisms; Integral morphisms; Kummer morphisms; Log fiber
products; Log smooth morphisms; Divisorial log structures; Log regular schemes; Integral
quasi-coherent log schemes; Vertical logarithmic morphisms; Log smoothness by fine models;
Valuation log structures and tilt charts; Log structures on semistable formal charts.

Layer CR.5: Logarithmic differentials; Log de Rham complexes; Absolute semistable residue maps;
Morphisms of Cartier type; Exactification of log immersions; Fine log PD envelopes; Quasi-coherent
log PD envelopes; Exact log PD thickenings; PD smooth log thickenings; Log crystalline sites;
Logarithmic crystals; Log PD stratifications; Integrable logarithmic connections; Logarithmic
quasi-nilpotence; Filtered logarithmic PD de Rham complexes; Derived p-adic log crystalline
cohomology; The induced log structure on A_cris.

Layer CR.6: Standard log Witt bases; Integral Hyodo–Kato complexes; Rational Hyodo–Kato complexes;
Hyodo–Kato Frobenius; Hyodo–Kato monodromy; Logarithmic de Rham–Witt complexes (canonical
restriction through the Frobenius-twisted Cartier intermediary, and the length-one Bockstein
differential); Finite-level log Witt quotient complexes; PD differential factorisation for the
log Witt comparison; Normalized
logarithms of units; Uniformizer-dependent Hyodo–Kato maps; Convergent logarithmic embedding complexes; Proper support on open analytic
tubes; Semistable logarithmic Witt models; Witt comparison maps with proper support; Hyodo–Kato
cohomology of Stein curves; Hyodo–Kato cohomology of semistable curve towers.

Layer CR.7: Finite projective crystalline coefficients; Filtered Frobenius coefficients on
semistable models; The crystalline Dieudonné crystal of a Barsotti–Tate group; Relative
crystalline direct images; Relative Gauss–Manin connections.

Layer CR.1 also includes `Crystalline.CrisFppfSite`, `Crystalline.CrisCompatibleSite`,
`Crystalline.CrisCompatibleEtaleSite` and `Crystalline.CrisCompatibleFppfSite`.
Layer CR.6 includes log rigid Hyodo–Kato cohomology; Layer CR.5:log-algebra includes the classical
normalization and tame Kummer comparison used in the logarithmic Abhyankar lemma.
The following README subsections also specify these APIs; they are names of mathematical
targets in the README, rather than declarations in this file.

CR.0.1 Divided powers from identities on generators, and gluing on sums:
PD.AdditivePowers.toDividedPowers_dpow; PD.AdditivePowers.toDividedPowers_unique;
PD.AdditivePowers.toDividedPowers_generators; PD.convolution_eq; PD.convolution_swap;
PD.convolution_mem; PD.convolution_eq_coeff_exp_mul; PD.supCandidate_dpow_add; PD.supCandidate_left;
PD.supCandidate_right; PD.sup_dpow_add; PD.sup_left; PD.sup_right; PD.sup_isDPMorphism_iff.

CR.0.2 Extension along principal ideals, flat maps and localisation:
PD.extendPrincipal_dpow; PD.extendPrincipal_isDPMorphism; PD.extendPrincipal_generator_independent;
PD.extensionCoefficient_eq; PD.extensionCoefficient_one; PD.extensionCoefficient_mem;
PD.dpow_sum_mul_map_eq_extensionCoefficient; PD.flatCandidate_formula; PD.flatCandidate_base;
PD.flatCandidate_outside; PD.extendFlat_formula; PD.extendFlat_isDPMorphism; PD.extendFlat_unique;
PD.extendFlat_isDPMorphism_iff; PD.extendFlat_trans; PD.extendFlat_eq_ofRingEquiv.

CR.0.3 The divided power algebra and its augmentation ideal:
augmentation_test_positive_with_scalar; augmentation_test_degree_one;
augmentation_test_not_evaluation; augmentationIdeal_test_positive; augmentationIdeal_test_unit;
augmentationIdeal_test_degree_one_insufficient.

CR.0.4 The divided power filtration and PD nilpotence:
PD.pdFiltration_le_iff; PD.prod_dpow_mem_pdFiltration; PD.dpow_mem_pdFiltration;
PD.pdFiltration_eq_span_of_span; Crystalline.pdNilpotent_iff; Crystalline.pdNilpotent_ordinary;
Crystalline.pdNilpotent_map; Crystalline.pdIdeal_le_nilradical_iff.

CR.0.5 Compatibility with a base, canonical divided powers and square-zero thickenings:
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

CR.0.6 Divided power envelopes:
Crystalline.completedEnvelope_reduction; Crystalline.completedEnvelope_lift;
Crystalline.completedEnvelope_functorial; Crystalline.completedEnvelope_mod_pow;
Crystalline.completedEnvelope_eq_limit.

CR.0.7 The crystalline period ring:
Crystalline.fontaineEnvelope_initial; Crystalline.fontaineEnvelope_theta;
Crystalline.fontaineEnvelope_identify; Crystalline.fontaineEnvelope_eq_trivialBase;
Crystalline.fontaineEnvelope_wittResidue; Crystalline.fontaineEnvelope_map.

CR.1.1 PD schemes and crystalline sites:
Crystalline.crisSiteMap_comp; Crystalline.cris_u_sections; Crystalline.cris_small_big;
Crystalline.cris_u_inverse_eval; Crystalline.etale_crystalline_site_toX;
Crystalline.etale_crystalline_site_structure; Crystalline.etale_crystalline_site_change;
Crystalline.crisStructure_eval; Crystalline.crisPDideal_kernel; Crystalline.crisPDideal_restrict;
Crystalline.crisSheaf_ofRestrictions; Crystalline.crisPDideal_pdPower.

CR.1.3 Differentials, connections and stratifications:
Crystalline.pdDifferentials_lift; Crystalline.pdDifferentials_dpow; Crystalline.pdDifferentials_map;
Crystalline.pdDifferentials_adjoin; Crystalline.pdDifferentials_quotient;
Crystalline.pdDifferentials_diagonal; Crystalline.pdDifferentials_completion.

CR.2.1 Crystalline cohomology and linearization:
Crystalline.RΓcrys_comp; Crystalline.RΓcrys_map; Crystalline.RΓcrys_limit.

CR.2.2 The Poincaré lemma and computation by embeddings:
Crystalline.linearization_eval; Crystalline.linearization_map;
Crystalline.linearization_augmentation; Crystalline.linearization_cohomology;
Crystalline.linearization_resolution; Crystalline.smooth_linearization_eval;
Crystalline.smooth_linearization_map; Crystalline.smooth_linearization_acyclic;
Crystalline.smooth_linearization_resolution.

CR.3.2 Base change and perfectness:
Crystalline.crysBaseChange_id; Crystalline.crysBaseChange_comp; Crystalline.crysBaseChange_natural.

CR.3.3 Products, Chern classes and the Leray spectral sequence:
Crystalline.crysChern_log; Crystalline.crysChern_add; Crystalline.crysChern_pullback;
Crystalline.crysChern_fil; Crystalline.crysChern_deRham; Crystalline.crysChern_reduction;
Crystalline.crysChern_hyperplane; Crystalline.crysCup_unit; Crystalline.crysCup_graded_comm;
Crystalline.crysCup_reduction; Crystalline.crysCup_assoc; Crystalline.crysCup_pullback;
Crystalline.crysCup_deRham; Crystalline.crysCup_external.

CR.3.4 Frobenius:
Crystalline.crysFrobenius_semilinear; Crystalline.crysFrobenius_linearize;
Crystalline.crysFrobenius_lift; Crystalline.crysFrobenius_natural; Crystalline.crysFrobenius_cup;
Crystalline.crysFrobenius_chern; Crystalline.crysFrobenius_finite_field.

CR.4.1 Dieudonné complexes, saturation and décalage:
Crystalline.pDecalage_degree; Crystalline.pDecalage_d; Crystalline.pDecalage_map;
Crystalline.pDecalage_cohomology; Crystalline.pDecalage_filtered_colimit;
Crystalline.DieudonneComplex.F_zero; Crystalline.DieudonneComplex.F_add;
Crystalline.DieudonneComplex.d_F; Crystalline.DieudonneComplex.alphaF_ofAlpha;
Crystalline.DieudonneComplex.alphaF_natural; Crystalline.IsSaturated.p_injective;
Crystalline.IsSaturated.F_injective; Crystalline.IsSaturated.F_range;
Crystalline.DieudonneComplex.IsSaturated.smul_mem_range;
Crystalline.DieudonneComplex.F_verschiebung; Crystalline.DieudonneComplex.verschiebung_F;
Crystalline.DieudonneComplex.F_d_verschiebung; Crystalline.verschiebung_FV;
Crystalline.verschiebung_VF; Crystalline.verschiebung_d; Crystalline.verschiebung_FdV;
Crystalline.verschiebung_injective; Crystalline.pBockstein_lift; Crystalline.pBockstein_square;
Crystalline.pBockstein_decalage; Crystalline.derivedPDecalage_model;
Crystalline.derivedPDecalage_cohomology; Crystalline.derivedPDecalage_completion.

CR.4.2 The Verschiebung filtration and the finite quotients:
Crystalline.DieudonneComplex.vFiltration_zero; Crystalline.mem_vFiltration;
Crystalline.vFiltration_zero; Crystalline.vFiltration_antitone; Crystalline.vFiltration_d;
Crystalline.Wmk_surjective; Crystalline.Wmk_eq_zero; Crystalline.Wcomplex_d_mk;
Crystalline.Wprojection_apply; Crystalline.Wprojection_surjective; Crystalline.Wprojection_kernel;
Crystalline.Wrestriction_mk; Crystalline.Wrestriction_surjective;
Crystalline.Wprojection_restriction; Crystalline.WF_mk; Crystalline.WF_d;
Crystalline.WF_restriction; Crystalline.WV_mk; Crystalline.WV_d; Crystalline.WV_restriction.

CR.4.4 Inputs on Witt vectors:
Crystalline.truncatedFrobenius_truncate; Crystalline.truncatedVerschiebung_truncate;
Crystalline.truncatedVerschiebung_injective; Crystalline.truncatedFrobenius_V;
Crystalline.truncatedVerschiebung_projection; Crystalline.truncatedRestriction_kernel;
Crystalline.truncatedVerschiebung_F_charP; Crystalline.wittFrobenius_injective_of_reduced;
Crystalline.witt_p_torsionFree_of_reduced; Crystalline.wittVerschiebung_pow;
Crystalline.wittVerschiebungDividedPowers_dpow; Crystalline.wittVerschiebungDividedPowers_map;
Crystalline.wittVerschiebungDividedPowers_unique; Crystalline.wittVerschiebungDividedPowers_Fp.

CR.4.5 Dieudonné algebras and the saturated de Rham–Witt complex:
Crystalline.satDRW_lift; Crystalline.satDRW_degree0; Crystalline.satDRW_map;
Crystalline.satDRW_degree0_F; Crystalline.satDRW_unit; Crystalline.satDRW_residue_seminormal;
Crystalline.satDRW_red; Crystalline.satDRW_ofLift.

CR.4.6 The classical and the relative de Rham–Witt complex:
Structural properties of the classical complex on smooth F_p-algebras:
Crystalline.classicalDRW_injective; Crystalline.classicalDRW_saturated;
Crystalline.classicalDRW_restriction_kernel; Crystalline.classicalDRW_strict.
Crystalline.cuspSeminormalComparison;
Crystalline.relativeDRW_lift; Crystalline.relativeDRW_zero; Crystalline.relativeDRW_map;
Crystalline.relativeDRW_generated; Crystalline.relativeDRW_base_quotient;
Crystalline.relativeDRW_lift_noRestriction; Crystalline.classicalDRW_lift;
Crystalline.classicalDRW_zero; Crystalline.classicalDRW_one; Crystalline.classicalDRW_generated;
Crystalline.classicalDRW_map; Crystalline.classicalDRW_toRelative;
Crystalline.classicalDRW_lift_degreeZero; Crystalline.continuousWitt_eval;
Crystalline.continuousWitt_map; Crystalline.continuousWitt_operators;
Crystalline.continuousWitt_fromRelative.

CR.4.7 Integral cohomological control:
Crystalline.wittCohomology_bounded_torsion; Crystalline.wittCohomology_free_quotient;
Crystalline.wittCohomology_V_complete.

CR.6.4 Sato’s homological de Rham–Witt complex:
Crystalline.SatoWitt.residue; Crystalline.SatoWitt.ordered_gr;
Crystalline.SatoWitt.absolute_map; Crystalline.SatoWitt.rational_compare.
Rigid cohomology of smooth strata:
Crystalline.smoothStratumRigid.frame_independence; Crystalline.smoothStratumRigid.finiteDimensional;
Crystalline.smoothStratumRigid.frobenius; Crystalline.smoothStratumRigid.proper_comparison.

CR.3:duality.1 The trace, duality and Gysin maps:
cechTraceSign_add; Crystalline.crysTrace_projective; Crystalline.crysTrace_reduction;
Crystalline.crysTrace_etale_local; Crystalline.crysTrace_iso; Crystalline.crysTrace_ekedahl;
Crystalline.crysTrace_frobenius; Crystalline.crysTrace_product;
Crystalline.finiteEtaleTransfer_scalar; Crystalline.finiteEtaleTransfer_projection;
Crystalline.finiteEtaleTransfer_trace; Crystalline.crysGysin_comp; Crystalline.crysGysin_projection;
Crystalline.crysGysin_trace; Crystalline.crysGysin_adjoint; Crystalline.crysGysin_frobenius;
Crystalline.crysDiagonal_action; Crystalline.crysDiagonal_triangles;
Crystalline.crysDiagonal_projective.

CR.5:log-algebra.1 Prelog rings, log structures and charts:
LogCrystalline.PrelogRing.hom_ext; LogCrystalline.PrelogRing.map_comp;
LogCrystalline.IsFineMonoid.finite_generators; LogCrystalline.IsSaturatedMonoid.root_closed;
LogCrystalline.IsSaturatedMonoid.saturation_lift; LogCrystalline.IsSaturatedMonoid.fs_integral.

CR.6.1 Logarithmic de Rham–Witt complexes and their crystalline model:
LogCrystalline.logDeRhamWitt.restriction; LogCrystalline.logWittQuotient;
LogCrystalline.logWittPDDifferentials.

-/

end TauCetiRoadmap.CrystallineCohomology

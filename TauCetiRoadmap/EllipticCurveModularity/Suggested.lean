import Mathlib.AlgebraicGeometry.EllipticCurve.LFunction
import Mathlib.AlgebraicGeometry.Morphisms.UnderlyingMap
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Data.Fintype.Pigeonhole
import Mathlib.Data.Nat.Totient
import Mathlib.Data.Set.Finite.Basic
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.NumberTheory.Cyclotomic.CyclotomicCharacter
import Mathlib.NumberTheory.LegendreSymbol.ZModChar
import Mathlib.NumberTheory.ModularForms.DedekindEta
import Mathlib.NumberTheory.ModularForms.QExpansion
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.RingTheory.Ideal.Operations
import Mathlib.RingTheory.Norm.Basic
import TauCeti.NumberTheory.ModularForms.Newforms.Newform
import TauCeti.AlgebraicGeometry.EllipticCurve.TateModule.Determinant
import TauCeti.NumberTheory.ModularForms.Newforms.OrthogonalBasis

/-!
# EllipticCurveModularity: representative target signatures

The accompanying README.md is the definitive roadmap. This file records suggested forms
for light definitions and theorems statable against the pinned Mathlib and Tau Ceti APIs;
it is not an exhaustive checklist. The conventions are arithmetic Frobenius, geometric
points over the algebraic closure of ℚ, normalized weight-two newforms and trivial
nebentypus. Conductor-dependent choices and modular-curve constructions are specified
in the README. The declarations use the package's mathematical namespace.
-/

noncomputable section

open AlgebraicGeometry CategoryTheory NumberField Polynomial TensorProduct
open scoped MonoidAlgebra Classical

namespace TauCeti.EllipticCurve.Modularity

open HeckeRing.GL2 (Newform)

/-! ## Conventions and coefficient specializations -/

/-- `G_ℚ = Gal(ℚ̄/ℚ)`. -/
abbrev GQ : Type := Field.absoluteGaloisGroup ℚ

/-- `a_n(E)`: the `n`-th coefficient of Mathlib's `L`-function of `E`. At a prime `ℓ` of good reduction it is
`ℓ + 1 - #Ẽ(𝔽_ℓ)`; at a bad prime it is `1`, `-1`, `0` for split multiplicative, nonsplit multiplicative, additive
reduction. -/
def lCoeff (E : WeierstrassCurve ℚ) (n : ℕ) : ℤ := E.LFunction n

/-- Good reduction of `E` at `p`, in Mathlib's sense for the minimal model over `ℤ_[p]`. For the conductor `N` of
`E` this is `p ∤ N`. Mathlib's `LFunction` takes its local factors over the completions `v.adicCompletion ℚ`; the
comparison of those with `ℚ_[p]` is part of the arithmetic supplier contract. -/
def HasGoodReductionAt (E : WeierstrassCurve ℚ) (p : ℕ) [Fact p.Prime] : Prop :=
  ((E.baseChange ℚ_[p]).minimal ℤ_[p]).HasGoodReduction ℤ_[p]

/-- Multiplicative reduction of `E` at `ℓ` (Mathlib). For the conductor `N` of `E` this is `v_ℓ(N) = 1`. -/
def HasMultiplicativeReductionAt (E : WeierstrassCurve ℚ) (ℓ : ℕ) [Fact ℓ.Prime] : Prop :=
  ((E.baseChange ℚ_[ℓ]).minimal ℤ_[ℓ]).HasMultiplicativeReduction ℤ_[ℓ]

open scoped Classical in
/-- `E` has a ℚ-rational cyclic subgroup of order `p`: a finite cyclic subgroup of `E(ℚ̄)` of order `p` stable
under `G_ℚ` (the kernel of a ℚ-rational cyclic isogeny of degree `p`). -/
def HasRationalCyclicSubgroup (E : WeierstrassCurve ℚ) [E.IsElliptic] (p : ℕ) : Prop :=
  ∃ C : AddSubgroup (E.baseChange (AlgebraicClosure ℚ)).toAffine.Point,
    IsAddCyclic C ∧ Finite C ∧ Nat.card C = p ∧ ∀ σ : GQ, C.map ((Multiplicative.toAdd (E.pointGaloisAction σ)).toAddMonoidHom) = C

/-- The Fourier coefficient `a_n(f)` of a newform at the cusp `∞`. -/
def coeff {N : ℕ} [NeZero N] {k : ℤ} (f : Newform N k) (n : ℕ) : ℂ :=
  (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff n

/-! ## Layer R29.1: exceptional primes -/

/-- `EllipticCurveModularity:R29.1/exceptional-primes`: the primes `p` with `p ≤ 5`, or of bad reduction, or
dividing `v_ℓ(j_E)` at a prime `ℓ` of multiplicative reduction, or the order of a ℚ-rational cyclic subgroup. -/
def exceptionalPrimes (E : WeierstrassCurve ℚ) [E.IsElliptic] : Set ℕ :=
  {p | ∃ hp : p.Prime, haveI : Fact p.Prime := ⟨hp⟩
      p ≤ 5 ∨ ¬ HasGoodReductionAt E p ∨
        (∃ (ℓ : ℕ) (hℓ : ℓ.Prime), haveI : Fact ℓ.Prime := ⟨hℓ⟩
          HasMultiplicativeReductionAt E ℓ ∧ (p : ℤ) ∣ padicValRat ℓ E.j) ∨
        HasRationalCyclicSubgroup E p}

theorem exceptionalPrimes_finite (E : WeierstrassCurve ℚ) [E.IsElliptic] : (exceptionalPrimes E).Finite := sorry

/-- Outside the exceptional set, good reduction holds at the coefficient prime. -/
theorem goodReduction_of_not_mem (E : WeierstrassCurve ℚ) [E.IsElliptic]
    {p : ℕ} [Fact p.Prime] (h : p ∉ exceptionalPrimes E) : HasGoodReductionAt E p := sorry

/-- Irreducibility on the native torsion carrier: every Galois-stable subgroup is zero
or the whole p-torsion. For prime p these are exactly the invariant F_p-subspaces. -/
theorem irreducible_of_not_mem (E : WeierstrassCurve ℚ) [E.IsElliptic]
    {p : ℕ} [Fact p.Prime] (h : p ∉ exceptionalPrimes E)
    (C : AddSubgroup (AddSubgroup.torsionBy
      (E.baseChange (AlgebraicClosure ℚ)).toAffine.Point (p : ℤ)))
    (hC : ∀ σ : GQ, C.map
      (Multiplicative.toAdd (E.torsionGaloisAction (p : ℤ) σ)).toAddMonoidHom = C) :
    C = ⊥ ∨ C = ⊤ := sorry

/-- Outside the exceptional set, every scalar extension of the native p-torsion
has only the zero and full invariant subspaces. The ZMod-module structure is supplied
by Mathlib; additive Galois automorphisms are linear over the prime field. -/
theorem absolutelyIrreducible_of_not_mem (E : WeierstrassCurve ℚ) [E.IsElliptic]
    {p : ℕ} [Fact p.Prime] (h : p ∉ exceptionalPrimes E) (k : Type)
    [Field k] [Algebra (ZMod p) k] :
    letI := AddSubgroup.torsionBy.zmodModule
      (A := (E.baseChange (AlgebraicClosure ℚ)).toAffine.Point) (n := p)
    ∀ W : Submodule k (k ⊗[ZMod p]
      AddSubgroup.torsionBy (E.baseChange (AlgebraicClosure ℚ)).toAffine.Point (p : ℤ)),
      (∀ σ : GQ, W.map (LinearMap.baseChange k
        ((Multiplicative.toAdd (E.torsionGaloisAction (p : ℤ) σ)).toAddMonoidHom.toZModLinearMap p)) ≤ W) →
      W = ⊥ ∨ W = ⊤ := sorry

/-- 11a1 = `X₀(11)`: `y² + y = x³ - x² - 10x - 20`. -/
def curve11a1 : WeierstrassCurve ℚ := ⟨0, -1, 1, -10, -20⟩
/-- 11a2: `y² + y = x³ - x² - 7820x - 263580`. -/
def curve11a2 : WeierstrassCurve ℚ := ⟨0, -1, 1, -7820, -263580⟩
/-- 11a3 = `X₁(11)`: `y² + y = x³ - x²`. -/
def curve11a3 : WeierstrassCurve ℚ := ⟨0, -1, 1, 0, 0⟩
/-- 26b1: `y² + xy + y = x³ - x² - 3x + 3`, with the point `(1, 0)` of order 7. -/
def curve26b1 : WeierstrassCurve ℚ := ⟨1, -1, 1, -3, 3⟩
/-- 274a1: `y² + xy = x³ - 7x + 9`, with `v₂(j) = -7` and no rational 7-isogeny. -/
def curveValuationOnly : WeierstrassCurve ℚ := ⟨1, 0, 0, -7, 9⟩
/-- 162b1: `y² + xy + y = x³ - x² - 5x + 5`, with a rational 7-isogeny and `v₂(j) = -3`. -/
def curveIsogenyOnly : WeierstrassCurve ℚ := ⟨1, -1, 1, -5, 5⟩
/-- 32a2: `y² = x³ - x`, with complex multiplication by `ℤ[i]`. -/
def curveCM : WeierstrassCurve ℚ := ⟨0, 0, 0, -1, 0⟩
/-- 37a1: `y² + y = x³ - x`. -/
def curve37a1 : WeierstrassCurve ℚ := ⟨0, 0, 1, -1, 0⟩
/-- The quadratic twist of 11a1 by `-1`: `y² = x³ + 4x² - 160x + 1264`. -/
def curve11a1TwistNegOne : WeierstrassCurve ℚ := ⟨0, 4, 0, -160, 1264⟩

instance : curve11a1.IsElliptic :=
  ⟨by
    rw [isUnit_iff_ne_zero]
    norm_num [curve11a1, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
      WeierstrassCurve.b₈]⟩
instance : curve11a2.IsElliptic :=
  ⟨by
    rw [isUnit_iff_ne_zero]
    norm_num [curve11a2, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
      WeierstrassCurve.b₈]⟩
instance : curve11a3.IsElliptic :=
  ⟨by
    rw [isUnit_iff_ne_zero]
    norm_num [curve11a3, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
      WeierstrassCurve.b₈]⟩
instance : curve26b1.IsElliptic :=
  ⟨by
    rw [isUnit_iff_ne_zero]
    norm_num [curve26b1, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
      WeierstrassCurve.b₈]⟩
instance : curveValuationOnly.IsElliptic :=
  ⟨by
    rw [isUnit_iff_ne_zero]
    norm_num [curveValuationOnly, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
      WeierstrassCurve.b₈]⟩
instance : curveIsogenyOnly.IsElliptic :=
  ⟨by
    rw [isUnit_iff_ne_zero]
    norm_num [curveIsogenyOnly, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
      WeierstrassCurve.b₈]⟩
instance : curveCM.IsElliptic :=
  ⟨by
    rw [isUnit_iff_ne_zero]
    norm_num [curveCM, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
      WeierstrassCurve.b₈]⟩
instance : curve37a1.IsElliptic :=
  ⟨by
    rw [isUnit_iff_ne_zero]
    norm_num [curve37a1, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
      WeierstrassCurve.b₈]⟩
instance : curve11a1TwistNegOne.IsElliptic :=
  ⟨by
    rw [isUnit_iff_ne_zero]
    norm_num [curve11a1TwistNegOne, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
      WeierstrassCurve.b₈]⟩

variable (E : WeierstrassCurve ℚ) [E.IsElliptic]

example :
    5 ∈ exceptionalPrimes curve11a1 ∧ 11 ∈ exceptionalPrimes curve11a1 := by sorry

/-- The clause `p ≤ 5`; this one follows from the definition. -/
example :
    2 ∈ exceptionalPrimes E ∧ 3 ∈ exceptionalPrimes E ∧ 5 ∈ exceptionalPrimes E :=
  ⟨⟨Nat.prime_two, Or.inl (by norm_num)⟩, ⟨Nat.prime_three, Or.inl (by norm_num)⟩,
    ⟨Nat.prime_five, Or.inl (by norm_num)⟩⟩

example :
    (exceptionalPrimes curveCM).Finite ∧ 2 ∈ exceptionalPrimes curveCM := by sorry

/-- Non-membership: 11a1 is good at 7, `v₁₁(j) = -5`, and there is no rational cyclic subgroup of order 7. -/
example : 7 ∉ exceptionalPrimes curve11a1 := by sorry

/-- Both extra clauses at once: a rational point of order 7, and `v₂(j) = -7` at the multiplicative prime 2. -/
example :
    7 ∈ exceptionalPrimes curve26b1 ∧ HasRationalCyclicSubgroup curve26b1 7 ∧
      padicValRat 2 curve26b1.j = -7 := by sorry

/-- The valuation clause alone: `v₂(j) = -7`, good reduction at 7, no rational cyclic subgroup of order 7. -/
example :
    7 ∈ exceptionalPrimes curveValuationOnly ∧ ¬ HasRationalCyclicSubgroup curveValuationOnly 7 := by sorry

/-- The isogeny clause alone: a rational cyclic subgroup of order 7, good reduction at 7, and `7 ∤ v₂(j) = -3` at
the only multiplicative prime. -/
example :
    7 ∈ exceptionalPrimes curveIsogenyOnly ∧ HasRationalCyclicSubgroup curveIsogenyOnly 7 ∧
      padicValRat 2 curveIsogenyOnly.j = -3 := by sorry

/-! ## Layer R29.2: trivial character by reduction -/

/-- A weight-two form and a maximal coefficient ideal above p at a supplied positive level.
The README uses N equal to the elliptic conductor and specifies trace and residual comparison. -/
structure SerreWitness (N : ℕ) [NeZero N] (p : ℕ) where
  form : Newform N 2
  prime : Ideal (integralClosure ℤ ℂ)
  isMaximal : prime.IsMaximal
  natCast_mem : (p : integralClosure ℤ ℂ) ∈ prime

/-- At an exact-level witness the first Fourier coefficient is normalized to one. -/
example {N : ℕ} [NeZero N] {p : ℕ} (w : SerreWitness N p) : coeff w.form 1 = 1 := sorry

/-- A maximal coefficient ideal is proper, so it cannot contain one. -/
example {N : ℕ} [NeZero N] {p : ℕ} (w : SerreWitness N p) :
    (1 : integralClosure ℤ ℂ) ∉ w.prime := sorry

/-- `EllipticCurveModularity:R29.2/trivial-nebentypus-by-reduction`: a root of unity of order prime to `p` that is
`≡ 1` modulo a prime above `p` equals 1. Primality and prime-to-p order are essential. -/
theorem eq_one_of_pow_eq_one_of_sub_mem {K : Type*} [Field K] [NumberField K] (ζ : 𝓞 K) {m : ℕ} (hm : ζ ^ m = 1)
    (𝔭 : Ideal (𝓞 K)) [𝔭.IsPrime] {p : ℕ} (hp' : p.Prime) (hp : (p : 𝓞 K) ∈ 𝔭) (hpm : ¬ p ∣ m)
    (h : ζ - 1 ∈ 𝔭) : ζ = 1 := sorry

/-! ## Layer R29.3: norm vanishing and attachment -/

/-- `EllipticCurveModularity:R29.3/algebraic-integer-norm-vanishing`, integer form. -/
theorem int_eq_zero_of_forall_dvd {n : ℤ} {P : Set ℕ} (hP : P.Infinite) (h : ∀ p ∈ P, (p : ℤ) ∣ n) : n = 0 := sorry

/-- `EllipticCurveModularity:R29.3/algebraic-integer-norm-vanishing`. -/
theorem eq_zero_of_mem_primes {K : Type*} [Field K] [NumberField K] (α : 𝓞 K) {P : Set ℕ} (hP : P.Infinite)
    (hprime : ∀ p ∈ P, p.Prime)
    (h : ∀ p ∈ P, ∃ 𝔭 : Ideal (𝓞 K), 𝔭.IsPrime ∧ (p : 𝓞 K) ∈ 𝔭 ∧ α ∈ 𝔭) : α = 0 := sorry

example : ¬ ∃ P : Set ℕ, P.Infinite ∧ ∀ p ∈ P, (p : ℤ) ∣ 6 := sorry
/-- Color primes by congruence to 1 mod 4; one of the two fibers is infinite. -/
example : ∃ b : Bool, ({p : ℕ | p.Prime} ∩ (fun p => p % 4 == 1) ⁻¹' {b}).Infinite := sorry
example : ¬ (3 : ℤ) ∣ 2 := by decide

/-- `EllipticCurveModularity:R29.3/attached-newform`: a normalised newform `F` of weight 2 and any level is
attached to `E` when its character is trivial and `a_ℓ(F) = a_ℓ(E)` for all but finitely many primes `ℓ`. -/
def IsNewformOf (E : WeierstrassCurve ℚ) {M : ℕ} [NeZero M] (F : Newform M 2) : Prop :=
  F.χ = 1 ∧ ∀ᶠ ℓ : ℕ in Filter.cofinite, ℓ.Prime → coeff F ℓ = (lCoeff E ℓ : ℂ)

/-- Two newforms attached to `E`, of any levels, have the same level and the same coefficients (ModularForms Layer 5). -/
theorem IsNewformOf.unique {M M' : ℕ} [NeZero M] [NeZero M'] {F : Newform M 2} {G : Newform M' 2}
    (hF : IsNewformOf E F) (hG : IsNewformOf E G) : M = M' ∧ ∀ n, coeff F n = coeff G n := sorry

/-- The notion depends only on the coefficients `a_ℓ(E)` at almost all primes; so it is invariant under ℚ-isogeny
and under change of Weierstrass model.  -/
theorem IsNewformOf.congr {E E' : WeierstrassCurve ℚ} {M : ℕ} [NeZero M] {F : Newform M 2}
    (h : ∀ᶠ ℓ : ℕ in Filter.cofinite, ℓ.Prime → lCoeff E ℓ = lCoeff E' ℓ) :
    IsNewformOf E F ↔ IsNewformOf E' F := sorry

/-- Unit test: the newform `η(z)² η(11z)²` of level 11 is attached to 11a1 and to the isogenous curve 11a3. -/
example :
    ∃ F : Newform 11 2, (∀ τ : UpperHalfPlane,
        F.toCuspForm τ = ModularForm.eta τ ^ 2 * ModularForm.eta (11 * τ) ^ 2) ∧
      IsNewformOf curve11a1 F ∧ IsNewformOf curve11a3 F := by sorry

/-- Unit test: no newform of level 11 is attached to 37a1. -/
example (F : Newform 11 2) : ¬ IsNewformOf curve37a1 F := by sorry

omit [E.IsElliptic] in
/-- Unit test: a newform with nontrivial character is attached to no curve.  -/
theorem not_isNewformOf_of_char_ne_one {M : ℕ} [NeZero M] (F : Newform M 2) (hF : F.χ ≠ 1) :
    ¬ IsNewformOf E F := fun h => hF h.1

/-- Infinitely many congruent exact-level witnesses give one form with every good-prime
coefficient equal to that of E. The arithmetic production of the witnesses is in the README. -/
theorem exists_newform_coeff_eq (N : ℕ) [NeZero N] (P : Set ℕ)
    (hP : P.Infinite) (hprime : ∀ p ∈ P, p.Prime)
    (w : ∀ p ∈ P, SerreWitness N p)
    (hχ : ∀ p (hp : p ∈ P), (w p hp).form.χ = 1)
    (htrace : ∀ p (hp : p ∈ P) ℓ, ℓ.Prime → ¬ ℓ ∣ N → ℓ ≠ p →
      ∃ x ∈ (w p hp).prime, (x : ℂ) = coeff (w p hp).form ℓ - (lCoeff E ℓ : ℂ)) :
    ∃ F : Newform N 2, F.χ = 1 ∧
      ∀ ℓ : ℕ, ℓ.Prime → ¬ ℓ ∣ N → coeff F ℓ = (lCoeff E ℓ : ℂ) := sorry

/-- `EllipticCurveModularity:R29.3/rational-coefficient-field`: every coefficient of a newform attached to `E` is
a rational integer. -/
theorem IsNewformOf.coeff_int {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) (n : ℕ) :
    ∃ m : ℤ, coeff F n = m := sorry

/-! ## Layer R29.4: every Euler factor -/

/-- `EllipticCurveModularity:R29.4/bad-euler-factors`: every local factor of `E`, in Mathlib's convention, is the
Euler factor of a newform `F` attached to `E`. -/
theorem IsNewformOf.localPolynomial_eq {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) (ℓ : ℕ)
    [Fact ℓ.Prime] :
    ∃ a : ℤ, coeff F ℓ = a ∧ (E.baseChange ℚ_[ℓ]).localPolynomial ℤ_[ℓ] =
      1 - C a * X + (if ℓ ∣ M then 0 else C (ℓ : ℤ) * X ^ 2) := sorry

/-- All coefficients agree: `a_n(F) = a_n(E)` for every `n`, bad primes included. -/
theorem IsNewformOf.coeff_eq {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) (n : ℕ) :
    coeff F n = (lCoeff E n : ℂ) := sorry

/-! ## Layer R29.6: the rational Tate module and analytic output -/

/-- The rational Galois image spans every endomorphism, including for geometric CM.
The action is scalar extension of the supplied integral representation. -/
theorem span_range_rationalTateRep (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (r : ℕ) [Fact r.Prime] :
    Submodule.span ℚ_[r] (Set.range (fun σ : GQ => LinearMap.baseChange ℚ_[r]
      (E.tateModuleGaloisRepresentation (K := AlgebraicClosure ℚ) r σ))) = ⊤ := sorry

/-- An attached form supplies an entire completed L-series with its own level M.
The README identifies M with the conductor. -/
theorem IsNewformOf.exists_entire_completed_LSeries
    {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) :
    ∃ Λ : ℂ → ℂ, Differentiable ℂ Λ ∧
      (∀ s : ℂ, 3 / 2 < s.re →
        Λ s = (M : ℂ) ^ (s / 2) * (2 * Real.pi : ℂ) ^ (-s) * Complex.Gamma s * E.LSeries s) ∧
      ∃ w : ℤ, (w = 1 ∨ w = -1) ∧ ∀ s : ℂ, Λ s = w * Λ (2 - s) := sorry

/-! ## Checks for coefficient, reduction and model definitions -/

example : lCoeff E 0 = 0 := sorry
example : lCoeff E 1 = 1 := sorry
example {M : ℕ} [NeZero M] (F : Newform M 2) : coeff F 0 = 0 := sorry
example {M : ℕ} [NeZero M] (F : Newform M 2) : coeff F 1 = 1 := sorry

example :
    haveI : Fact (Nat.Prime 7) := ⟨by decide⟩
    HasGoodReductionAt curve11a1 7 := sorry
example :
    haveI : Fact (Nat.Prime 11) := ⟨by decide⟩
    ¬ HasGoodReductionAt curve11a1 11 := sorry
example :
    haveI : Fact (Nat.Prime 11) := ⟨by decide⟩
    HasMultiplicativeReductionAt curve11a1 11 := sorry
example : ¬ HasMultiplicativeReductionAt curveCM 2 := sorry
example : HasRationalCyclicSubgroup E 1 := sorry
example : ¬ HasRationalCyclicSubgroup E 0 := sorry

/-- Primality cannot be replaced by containment of a composite integer. -/
example : ¬ Nat.Prime 4 ∧ ¬ (4 : ℕ) ∣ 2 ∧ (-1 : ℤ) ^ 2 = 1 ∧
    (-1 : ZMod 2) = 1 ∧ (-1 : ℤ) ≠ 1 := by decide

/-- Without prime-to-p order, reduction of a root of unity need not be injective. -/
example : (-1 : ZMod 2) = 1 ∧ (-1 : ℤ) ≠ 1 := by decide

example : curve11a1.a₄ = -10 ∧ curve11a1.a₆ = -20 := by norm_num [curve11a1]
example : curve11a1.Δ = -161051 := by
  norm_num [curve11a1, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]

example : curve11a2.a₄ = -7820 ∧ curve11a2.a₆ = -263580 := by norm_num [curve11a2]
example : curve11a2.Δ = -11 := by
  norm_num [curve11a2, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]

example : curve11a3.a₄ = 0 ∧ curve11a3.a₆ = 0 := by norm_num [curve11a3]
example : curve11a3.Δ = -11 := by
  norm_num [curve11a3, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]

example : curve26b1.a₄ = -3 ∧ curve26b1.a₆ = 3 := by norm_num [curve26b1]
example : curve26b1.Δ = -1664 := by
  norm_num [curve26b1, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]

example : curveValuationOnly.a₄ = -7 ∧ curveValuationOnly.a₆ = 9 := by norm_num [curveValuationOnly]
example : curveValuationOnly.Δ = -17536 := by
  norm_num [curveValuationOnly, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]

example : curveIsogenyOnly.a₄ = -5 ∧ curveIsogenyOnly.a₆ = 5 := by norm_num [curveIsogenyOnly]
example : curveIsogenyOnly.Δ = -648 := by
  norm_num [curveIsogenyOnly, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]

example : curveCM.a₄ = -1 ∧ curveCM.a₆ = 0 := by norm_num [curveCM]
example : curveCM.Δ = 64 := by
  norm_num [curveCM, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]

example : curve37a1.a₄ = -1 ∧ curve37a1.a₆ = 0 := by norm_num [curve37a1]
example : curve37a1.Δ = 37 := by
  norm_num [curve37a1, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]

example : curve11a1TwistNegOne.a₄ = -160 ∧ curve11a1TwistNegOne.a₆ = 1264 := by norm_num [curve11a1TwistNegOne]
example : curve11a1TwistNegOne.Δ = -659664896 := by
  norm_num [curve11a1TwistNegOne, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]

/-
The README specifies the conductor-dependent forms and geometric constructions:
not_dvd_conductor_of_not_mem, absolutelyIrreducible_of_not_mem,
artinConductor_residualRep_of_not_mem, serreWeight_residualRep, SerreWitness,
serreWitness, serreWitness_level, serreWitness_trace, serreWitness_residual,
serreWitness_11a1, serreWitness_trace_2, serreWitness_not_at_exceptional,
exists_newform_coeff_eq, newformOf, isNewformOf_newformOf, newformOf_coeff_prime,
newformOf_unique, newformOf_coeff_int, newformOf_χ, newformOf_11a1,
newformOf_isogeny_invariant, newformOf_twist, IsNewformOf.nonempty_tateModule_equiv,
IsNewformOf.level_eq, QuotientIsogeny, IsNewformOf.nonempty_quotientIsogeny,
IsNewformOf.exists_hom_J0, IsNewformOf.exists_hom_X0, modularParametrisation,
modularParametrisation_cusp, modularParametrisation_nonconstant,
modularParametrisation_pullback, modularParametrisation_11a1,
modularParametrisation_11a3, modularParametrisation_37a, exists_isNewformOf_of_J0,
exists_isNewformOf_of_X0, conductor_dvd_of_J0, modularity, modularity_quotient,
modularity_parametrisation, LFunction_eq and exists_entire_completed_LSeries.
The exceptional-set Checks are exceptionalPrimes_11a1, exceptionalPrimes_contains_small,
exceptionalPrimes_CM, exceptionalPrimes_11a1_seven, exceptionalPrimes_26b1,
exceptionalPrimes_valuation_only and exceptionalPrimes_isogeny_only.
The attachment Checks are isNewformOf_11a1 and not_isNewformOf_37a1.
-/

end TauCeti.EllipticCurve.Modularity

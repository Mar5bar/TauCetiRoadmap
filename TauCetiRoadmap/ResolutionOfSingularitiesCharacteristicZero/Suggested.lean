import Mathlib
import TauCeti.RingTheory.MvPolynomial.OrderAt

/-!
# Resolution of singularities in characteristic zero: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. These are suggested forms for light definitions with real bodies and theorem
signatures statable against the pinned Mathlib and Tau Ceti APIs. `sorry` marks a target.

Orders are computed at prime localizations in `ℕ∞`; marks are positive; a marked sum raises
both ideals to the opposite mark. Multiplicativity of order requires regular localizations.
The global quasi-excellent resolution functor, formal algebraization, boundaries and their
compatibilities are README targets. The scheme quasi-excellence and regular-morphism carriers
of SchemeAndStackFoundations are specified in its README; the field theorem here is the Lean
milestone for the general non-embedded resolution theorem.
-/

universe u

open CategoryTheory

/-! ## Layer 1: local order and marked ideals -/

namespace ResolutionOfSingularities

variable {R : Type u} [CommRing R]

open scoped Classical in
/-- The order of an ideal at a prime: the largest `n` with `I R_𝔭 ⊆ 𝔭ⁿ R_𝔭`, in `ℕ∞`. Vanishing
implies order `⊤`; the converse needs Noetherianity (Krull intersection). -/
noncomputable def idealOrderAt (I : Ideal R) (p : PrimeSpectrum R) : ℕ∞ :=
  ⨆ n : ℕ, if I.map (algebraMap R (Localization.AtPrime p.asIdeal)) ≤
    (IsLocalRing.maximalIdeal (Localization.AtPrime p.asIdeal)) ^ n then (n : ℕ∞) else 0

/-- At a rational coordinate point, localized principal-ideal order equals the supplied
polynomial Taylor order, in every characteristic. -/
theorem idealOrderAt_span_eq_orderAt {k : Type u} [Field k] {σ : Type u} [Finite σ]
    (f : MvPolynomial σ k) (a : σ → k) :
    idealOrderAt (Ideal.span {f})
      (PrimeSpectrum.comap (MvPolynomial.eval a) ⟨⊥, inferInstance⟩) =
        MvPolynomial.orderAt f a := sorry

/-- At a rational coordinate point, the order of a finitely generated polynomial ideal is
the minimum of its generators' Taylor orders. An empty family gives order `⊤`. -/
theorem idealOrderAt_span_eq_iInf_orderAt {k : Type u} [Field k]
    {σ ι : Type u} [Finite σ] [Finite ι] (f : ι → MvPolynomial σ k) (a : σ → k) :
    idealOrderAt (Ideal.span (Set.range f))
      (PrimeSpectrum.comap (MvPolynomial.eval a) ⟨⊥, inferInstance⟩) =
        ⨅ i, MvPolynomial.orderAt (f i) a := sorry

/-- `IdealOrderChecks.unit`: the unit ideal has order zero at every prime. -/
example (p : PrimeSpectrum R) : idealOrderAt (⊤ : Ideal R) p = 0 := sorry

/-- `order_two_generators`: the ideal `(x³,y⁵)` has order three at the origin. -/
example (K : Type u) [Field K] :
    let x : MvPolynomial (Fin 2) K := MvPolynomial.X 0
    let y : MvPolynomial (Fin 2) K := MvPolynomial.X 1
    let p : PrimeSpectrum (MvPolynomial (Fin 2) K) :=
      PrimeSpectrum.comap (MvPolynomial.eval (fun _ => (0 : K))) ⟨⊥, inferInstance⟩
    idealOrderAt (Ideal.span {x ^ 3, y ^ 5}) p = 3 := sorry

/-- `OrderTests.dualNumbers`: on the dual numbers the maximal ideal has order one but its square,
which is zero, has order `⊤`; the order is not multiplicative off regular rings. -/
example (K : Type u) [Field K] :
    let m := IsLocalRing.maximalIdeal (DualNumber K)
    ∃ p : PrimeSpectrum (DualNumber K), idealOrderAt m p = 1 ∧ idealOrderAt (m ^ 2) p = ⊤ :=
  sorry

/-- A marked ideal `(I, d)`: an ideal with a strictly positive mark. -/
structure MarkedIdeal (R : Type u) [CommRing R] where
  /-- The ideal whose order is compared with the mark. -/
  ideal : Ideal R
  /-- The order threshold. -/
  mark : ℕ
  /-- The threshold is strictly positive. -/
  mark_pos : 0 < mark

/-- The cosupport of a marked ideal: the primes at which the order of `I` is at least `d`. -/
def MarkedIdeal.cosupport (J : MarkedIdeal R) : Set (PrimeSpectrum R) :=
  {p | (J.mark : ℕ∞) ≤ idealOrderAt J.ideal p}

/-- `IdealOrderChecks.zero` and `marked_zero_and_unit`: the zero ideal has infinite order
at every prime and full cosupport for every positive mark. -/
example (d : ℕ) (hd : 0 < d) :
    (∀ p : PrimeSpectrum R, idealOrderAt (⊥ : Ideal R) p = ⊤) ∧
      (MarkedIdeal.mk (⊥ : Ideal R) d hd).cosupport = Set.univ := sorry

/-- `mark_changes_cosupport`: the order-two zero of `x²` belongs to mark-two cosupport
and lies outside mark-three cosupport. -/
example :
    let I : Ideal (Polynomial ℚ) := Ideal.span {Polynomial.X ^ 2}
    let p : PrimeSpectrum (Polynomial ℚ) :=
      PrimeSpectrum.comap (Polynomial.evalRingHom (0 : ℚ)) ⟨⊥, inferInstance⟩
    p ∈ (MarkedIdeal.mk I 2 (by decide)).cosupport ∧
      p ∉ (MarkedIdeal.mk I 3 (by decide)).cosupport := sorry

/-- A residual factor of order zero along the cosupport is the unit ideal on its open
complement of vanishing. This open contains the cosupport, and the ideal equals its other
factor at every stalk there. -/
theorem MarkedIdeal.residualUnitOnOpen (J : MarkedIdeal R) (M N : Ideal R)
    (hfactor : J.ideal = M * N)
    (hresidual : ∀ p ∈ J.cosupport, idealOrderAt N p = 0) :
    ∃ U : TopologicalSpace.Opens (PrimeSpectrum R),
      J.cosupport ⊆ (U : Set (PrimeSpectrum R)) ∧
      (U : Set (PrimeSpectrum R)) = (PrimeSpectrum.zeroLocus (N : Set R))ᶜ ∧
      ∀ p : PrimeSpectrum R, p ∈ U →
        N.map (algebraMap R (Localization.AtPrime p.asIdeal)) = ⊤ ∧
        J.ideal.map (algebraMap R (Localization.AtPrime p.asIdeal)) =
          M.map (algebraMap R (Localization.AtPrime p.asIdeal)) := sorry

/-- `CompanionChecks.locallyMonomial`: for `(x²(x−1), 2)` with boundary `x = 0`, the cosupport
is `{0}` and the residual factor `(x−1)` has order zero there. The ideal equals `(x²)` on
`D(x−1)`, while at `1` its order is one and the residual factor is nonunit globally. -/
example :
    let I : Ideal (Polynomial ℚ) := Ideal.span {Polynomial.X ^ 2 * (Polynomial.X - 1)}
    let M : Ideal (Polynomial ℚ) := Ideal.span {Polynomial.X ^ 2}
    let N : Ideal (Polynomial ℚ) := Ideal.span {Polynomial.X - 1}
    let J := MarkedIdeal.mk I 2 (by decide)
    let p₀ : PrimeSpectrum (Polynomial ℚ) :=
      PrimeSpectrum.comap (Polynomial.evalRingHom (0 : ℚ)) ⟨⊥, inferInstance⟩
    let p₁ : PrimeSpectrum (Polynomial ℚ) :=
      PrimeSpectrum.comap (Polynomial.evalRingHom (1 : ℚ)) ⟨⊥, inferInstance⟩
    I = M * N ∧ J.cosupport = {p₀} ∧ idealOrderAt N p₀ = 0 ∧
      idealOrderAt I p₁ = 1 ∧ N ≠ ⊤ ∧ I ≠ M ∧
      ∀ p : PrimeSpectrum (Polynomial ℚ), p ∈ PrimeSpectrum.basicOpen (Polynomial.X - 1) →
        I.map (algebraMap (Polynomial ℚ) (Localization.AtPrime p.asIdeal)) =
          M.map (algebraMap (Polynomial ℚ) (Localization.AtPrime p.asIdeal)) := sorry

/-- On a ring with regular local rings, `(I, d)` and `(Iᵏ, k d)` have the same cosupport. This is
the affine shadow of the test equivalence `markedIdeal_rescale` of README Layer 1, which also asks for
equal cosupports after every permitted sequence of blowups and is a README target. -/
theorem MarkedIdeal.cosupport_pow (J : MarkedIdeal R) (k : ℕ) (hk : 0 < k)
    (hreg : ∀ p : PrimeSpectrum R, IsRegularLocalRing (Localization.AtPrime p.asIdeal)) :
    (MarkedIdeal.mk (J.ideal ^ k) (k * J.mark) (Nat.mul_pos hk J.mark_pos)).cosupport =
      J.cosupport := sorry

/-- `CompanionChecks.dualNumbers`: without regularity `cosupport_pow` fails: on the dual numbers
`(m, 2)` and `(m², 4)` have different cosupports. -/
example (K : Type u) [Field K] :
    let m := IsLocalRing.maximalIdeal (DualNumber K)
    (MarkedIdeal.mk (m ^ 2) 4 (by decide)).cosupport ≠
      (MarkedIdeal.mk m 2 (by decide)).cosupport := sorry

/-- The marked sum `(I, a) + (J, b) = (I^b + J^a, a b)`. -/
def MarkedIdeal.markedSum (J K : MarkedIdeal R) : MarkedIdeal R :=
  ⟨J.ideal ^ K.mark ⊔ K.ideal ^ J.mark, J.mark * K.mark,
    Nat.mul_pos J.mark_pos K.mark_pos⟩

/-- The mark of a marked sum is the product of the marks. -/
theorem MarkedIdeal.markedSum_mark (J K : MarkedIdeal R) :
    (J.markedSum K).mark = J.mark * K.mark := rfl

/-- Each summand is raised to the mark of the other. -/
theorem MarkedIdeal.markedSum_ideal (J K : MarkedIdeal R) :
    (J.markedSum K).ideal = J.ideal ^ K.mark ⊔ K.ideal ^ J.mark := rfl

/-- On a ring with regular local rings, the cosupport of a marked sum is the intersection of the
cosupports. -/
theorem MarkedIdeal.markedSum_cosupport
    (hreg : ∀ p : PrimeSpectrum R,
      IsRegularLocalRing (Localization.AtPrime p.asIdeal)) (J K : MarkedIdeal R) :
    (J.markedSum K).cosupport = J.cosupport ∩ K.cosupport := sorry

/-- `CompanionChecks.unit`: with positive marks on regular localizations, a unit summand gives
the unit ideal and empty cosupport. -/
example (J : MarkedIdeal R) (d : ℕ) (hd : 0 < d)
    (hreg : ∀ p : PrimeSpectrum R, IsRegularLocalRing (Localization.AtPrime p.asIdeal)) :
    let K := MarkedIdeal.mk (⊤ : Ideal R) d hd
    (K.markedSum J).ideal = ⊤ ∧ (K.markedSum J).cosupport = ∅ := sorry

/-- `CompanionChecks.zero`: with positive marks on regular localizations, two zero ideals give
the zero ideal and full cosupport with their positive product mark. -/
example (a b : ℕ) (ha : 0 < a) (hb : 0 < b)
    (hreg : ∀ p : PrimeSpectrum R, IsRegularLocalRing (Localization.AtPrime p.asIdeal)) :
    let J := MarkedIdeal.mk (⊥ : Ideal R) a ha
    let K := MarkedIdeal.mk (⊥ : Ideal R) b hb
    (J.markedSum K).ideal = ⊥ ∧ (J.markedSum K).cosupport = Set.univ ∧
      (J.markedSum K).mark = a * b := sorry

/-- `CompanionChecks.marks`: the marked sum of `(y², 2)` and `(x³, 2)` is `((y⁴, x⁶), 4)`, not the
unpowered sum. -/
example :
    let J := MarkedIdeal.mk
      (Ideal.span {MvPolynomial.X (1 : Fin 2) ^ 2} : Ideal (MvPolynomial (Fin 2) ℚ)) 2 (by decide)
    let K := MarkedIdeal.mk
      (Ideal.span {MvPolynomial.X (0 : Fin 2) ^ 3} : Ideal (MvPolynomial (Fin 2) ℚ)) 2 (by decide)
    (J.markedSum K).mark = 4 ∧
      (J.markedSum K).ideal =
        (Ideal.span {MvPolynomial.X (1 : Fin 2) ^ 4, MvPolynomial.X (0 : Fin 2) ^ 6} :
          Ideal (MvPolynomial (Fin 2) ℚ)) := sorry

/-- `weighted_common_mark`: summing `(x²,2)` and `(y³,3)` gives `((x⁶,y⁶),6)`. -/
example :
    let x : MvPolynomial (Fin 2) ℚ := MvPolynomial.X 0
    let y : MvPolynomial (Fin 2) ℚ := MvPolynomial.X 1
    let J := MarkedIdeal.mk (Ideal.span {x ^ 2}) 2 (by decide)
    let K := MarkedIdeal.mk (Ideal.span {y ^ 3}) 3 (by decide)
    (J.markedSum K).mark = 6 ∧
      (J.markedSum K).ideal = Ideal.span {x ^ 6, y ^ 6} := sorry

/-- `ResidualChecks.strictContainment`: the original mark-two cosupport of `(x³y)` is
`V(x)`, while the guarded residual marked sum has cosupport only the origin. -/
example :
    let x : MvPolynomial (Fin 2) ℚ := MvPolynomial.X 0
    let y : MvPolynomial (Fin 2) ℚ := MvPolynomial.X 1
    let p : PrimeSpectrum (MvPolynomial (Fin 2) ℚ) :=
      PrimeSpectrum.comap (MvPolynomial.eval (fun _ => (0 : ℚ))) ⟨⊥, inferInstance⟩
    let J := MarkedIdeal.mk (Ideal.span {x ^ 3 * y}) 2 (by decide)
    let A := MarkedIdeal.mk (Ideal.span {y}) 1 (by decide)
    let B := MarkedIdeal.mk (Ideal.span {x ^ 3}) 1 (by decide)
    J.cosupport = PrimeSpectrum.zeroLocus ({x} : Set (MvPolynomial (Fin 2) ℚ)) ∧
      (A.markedSum B).cosupport = {p} ∧
      (A.markedSum B).cosupport ⊂ J.cosupport := sorry

/-- `semicoherent_nonrational`: `(x²+1)³` has order three at the degree-two prime
`(x²+1)`, and this prime is its entire mark-two cosupport. -/
example :
    let q : Polynomial ℚ := Polynomial.X ^ 2 + 1
    let J := MarkedIdeal.mk (Ideal.span {q ^ 3}) 2 (by decide)
    ∃ p : PrimeSpectrum (Polynomial ℚ), p.asIdeal = Ideal.span {q} ∧
      idealOrderAt (Ideal.span {q}) p = 1 ∧ idealOrderAt J.ideal p = 3 ∧
      J.cosupport = {p} := sorry

/-- `cusp_controlled_chart`, `TransformTests.cuspChart` and `semicoherent_hypersurface`:
the cusp total equation factors by the square of the exceptional coordinate, and the
remaining equation has empty mark-two cosupport. -/
example :
    let x : MvPolynomial (Fin 2) ℚ := MvPolynomial.X 0
    let w : MvPolynomial (Fin 2) ℚ := MvPolynomial.X 1
    let ρ := MvPolynomial.eval₂Hom (MvPolynomial.C : ℚ →+* MvPolynomial (Fin 2) ℚ)
      (fun i : Fin 2 => if i = 0 then x else x * w)
    ρ (w ^ 2 - x ^ 3) = x ^ 2 * (w ^ 2 - x) ∧
      (MarkedIdeal.mk (Ideal.span {w ^ 2 - x}) 2 (by decide)).cosupport = ∅ := sorry

/-- `different_from_strict` and `cartier_identity_not_trivial`: division of `x³` by
the mark-two exceptional factor leaves `x`, whose mark-two cosupport is empty. -/
example :
    let x : Polynomial ℚ := Polynomial.X
    x ^ 3 = x ^ 2 * x ∧
      (MarkedIdeal.mk (Ideal.span {x}) 2 (by decide)).cosupport = ∅ := sorry

/-- `MonomialTests.exponent`: in the x-chart, `(x³y³,4)` has total equation
`x⁴(x²v³)`, so the controlled equation is `x²v³`. -/
example :
    let x : MvPolynomial (Fin 2) ℚ := MvPolynomial.X 0
    let v : MvPolynomial (Fin 2) ℚ := MvPolynomial.X 1
    let ρ := MvPolynomial.eval₂Hom (MvPolynomial.C : ℚ →+* MvPolynomial (Fin 2) ℚ)
      (fun i : Fin 2 => if i = 0 then x else x * v)
    ρ (x ^ 3 * v ^ 3) = x ^ 4 * (x ^ 2 * v ^ 3) := sorry

/-- `MaxContactTests.notAnyContaining`: the higher cusp has controlled equation
`v²−x³` in the x-chart, and its mark-two cosupport still contains the origin. -/
example :
    let x : MvPolynomial (Fin 2) ℚ := MvPolynomial.X 0
    let v : MvPolynomial (Fin 2) ℚ := MvPolynomial.X 1
    let ρ := MvPolynomial.eval₂Hom (MvPolynomial.C : ℚ →+* MvPolynomial (Fin 2) ℚ)
      (fun i : Fin 2 => if i = 0 then x else x * v)
    let p : PrimeSpectrum (MvPolynomial (Fin 2) ℚ) :=
      PrimeSpectrum.comap (MvPolynomial.eval (fun _ => (0 : ℚ))) ⟨⊥, inferInstance⟩
    ρ (v ^ 2 - x ^ 5) = x ^ 2 * (v ^ 2 - x ^ 3) ∧
      idealOrderAt (Ideal.span {v ^ 2 - x ^ 3}) p = 2 := sorry

/-- `semicoherent_common_open`: on `D(1−x)`, the reciprocal of `1−x` is a unit.
The pair `(x²/(1−x),2)` has cosupport `V(x)` and its Cartier-centre controlled
factor has empty cosupport. -/
example :
    let S := Localization.Away (1 - (Polynomial.X : Polynomial ℚ))
    let x : S := algebraMap (Polynomial ℚ) S Polynomial.X
    let v : S := IsLocalization.Away.invSelf (1 - (Polynomial.X : Polynomial ℚ))
    (1 - x) * v = 1 ∧ IsUnit v ∧
      (MarkedIdeal.mk (Ideal.span {x ^ 2 * v}) 2 (by decide)).cosupport =
        PrimeSpectrum.zeroLocus ({x} : Set S) ∧
      (MarkedIdeal.mk (Ideal.span {v}) 2 (by decide)).cosupport = ∅ := sorry

/-- Upper semicontinuity of the order on a regular ring of finite type over a field of
characteristic zero (an affine chart of a smooth variety): the cosupport of a marked ideal is
closed. -/
theorem MarkedIdeal.isClosed_cosupport (k : Type u) [Field k] [CharZero k] [Algebra k R]
    [Algebra.FiniteType k R]
    (hreg : ∀ p : PrimeSpectrum R, IsRegularLocalRing (Localization.AtPrime p.asIdeal))
    (J : MarkedIdeal R) : IsClosed J.cosupport := sorry

/-- The unit marked ideal has empty cosupport. -/
example (d : ℕ) (hd : 0 < d) : (MarkedIdeal.mk (⊤ : Ideal R) d hd).cosupport = ∅ := sorry

/-! ## Layer 2: derivative ideals and contact -/

variable {k : Type u} [Field k] {σ : Type u}

/-- `PolynomialOrderChecks.derivatives`: the localized principal-ideal order threshold at a
rational point is detected by the supplied iterated-partial-derivative criterion in
characteristic zero. -/
example [Finite σ] [CharZero k] (f : MvPolynomial σ k) (a : σ → k) (n : ℕ) :
    (n : ℕ∞) ≤ idealOrderAt (Ideal.span {f})
      (PrimeSpectrum.comap (MvPolynomial.eval a) ⟨⊥, inferInstance⟩) ↔
      ∀ l : List σ, l.length < n →
        MvPolynomial.eval a (l.foldl (fun q i ↦ MvPolynomial.pderiv i q) f) = 0 := by
  rw [idealOrderAt_span_eq_orderAt]
  exact MvPolynomial.le_orderAt_iff_eval_foldl_pderiv

/-- The derivative ideal `D(I) = I + (∂f/∂xᵢ : f ∈ I)` of an ideal of a polynomial ring. -/
noncomputable def derivativeIdeal (I : Ideal (MvPolynomial σ k)) : Ideal (MvPolynomial σ k) :=
  I ⊔ Ideal.span {g | ∃ f ∈ I, ∃ i : σ, g = MvPolynomial.pderiv i f}

/-- `DerivativeIdealChecks.zero`: differentiating the zero ideal gives the zero ideal. -/
example : derivativeIdeal (⊥ : Ideal (MvPolynomial σ k)) = ⊥ := sorry

/-- `DerivativeIdealChecks.unit`: the derivative ideal of the unit ideal is the unit ideal. -/
example : derivativeIdeal (⊤ : Ideal (MvPolynomial σ k)) = ⊤ := sorry

/-- `DerivTests.charP`: over a field of prime characteristic p, the derivative ideal
of `(x^p)` stays `(x^p)`. -/
example (p : ℕ) [Fact p.Prime] :
    let x : MvPolynomial Unit (ZMod p) := MvPolynomial.X ()
    derivativeIdeal (Ideal.span {x ^ p}) = Ideal.span {x ^ p} := sorry

/-- `DerivTests.charP` at p = 3: the derivative ideal of `(x³)` over `𝔽₃`
stays `(x³)`. -/
example :
    let x : MvPolynomial Unit (ZMod 3) := MvPolynomial.X ()
    derivativeIdeal (Ideal.span {x ^ 3}) = Ideal.span {x ^ 3} := sorry

/-- `jet_double_origin`: for `f=x²(x−1)` the first-jet equations generate `(x)`.
The zero-jet equation vanishes at 1 although f has order one there and order two at 0. -/
example :
    let x : Polynomial ℚ := Polynomial.X
    let f := x ^ 2 * (x - 1)
    let p₀ : PrimeSpectrum (Polynomial ℚ) :=
      PrimeSpectrum.comap (Polynomial.evalRingHom (0 : ℚ)) ⟨⊥, inferInstance⟩
    let p₁ : PrimeSpectrum (Polynomial ℚ) :=
      PrimeSpectrum.comap (Polynomial.evalRingHom (1 : ℚ)) ⟨⊥, inferInstance⟩
    Ideal.span {f, Polynomial.derivative f} = Ideal.span {x} ∧
      Polynomial.eval 1 f = 0 ∧ Polynomial.eval 1 (Polynomial.derivative f) = 1 ∧
      idealOrderAt (Ideal.span {f}) p₀ = 2 ∧
      idealOrderAt (Ideal.span {f}) p₁ = 1 := sorry

/-- Under the generic-fibre embedding of §7.1, the absolute derivative ideal pulls
back to an ideal containing `x²y²`, while the relative derivative ideal does not. -/
example :
    let t : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 0
    let x : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 1
    let y : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 2
    let f := x ^ 4 + y ^ 4 + t * x ^ 2 * y ^ 2
    let K := FractionRing (Polynomial ℚ)
    let ρ := MvPolynomial.eval₂Hom
      (MvPolynomial.C.comp (algebraMap ℚ K))
      (fun i : Fin 3 => if i = 0 then
        MvPolynomial.C (algebraMap (Polynomial ℚ) K Polynomial.X)
        else if i = 1 then (MvPolynomial.X (0 : Fin 2) : MvPolynomial (Fin 2) K)
        else MvPolynomial.X 1)
    ρ (x ^ 2 * y ^ 2) ∈ (derivativeIdeal (Ideal.span {f})).map ρ ∧
      ρ (x ^ 2 * y ^ 2) ∉ derivativeIdeal (Ideal.span {ρ f}) := sorry

/-- `MaxContactTests.characteristicTwoCusp`: over `𝔽₂`, the derivative ideal of
`(x²+y³)` is `(x²,y²)`. -/
example :
    let x : MvPolynomial (Fin 2) (ZMod 2) := MvPolynomial.X 0
    let y : MvPolynomial (Fin 2) (ZMod 2) := MvPolynomial.X 1
    derivativeIdeal (Ideal.span {x ^ 2 + y ^ 3}) = Ideal.span {x ^ 2, y ^ 2} := sorry

/-- `HomogenizationTests.cusp`: the cusp has derivative ideal `(y,x²)` and its
mark-two homogenization expression is `(y²,x³,x²y)`. -/
example :
    let x : MvPolynomial (Fin 2) ℚ := MvPolynomial.X 0
    let y : MvPolynomial (Fin 2) ℚ := MvPolynomial.X 1
    let I := Ideal.span {y ^ 2 - x ^ 3}
    derivativeIdeal I = Ideal.span {y, x ^ 2} ∧
      I ⊔ derivativeIdeal I ^ 2 = Ideal.span {y ^ 2, x ^ 3, x ^ 2 * y} := sorry

/-- `CoeffTests.notPlainRestriction`: for `(y³+x⁷+x³y,3)` on `y=0`, the first two
restricted derivative ideals are `(x³)` and `(x²)`. The differential coefficient expression
has ideal `(x⁹)` with mark six, while plain restriction has ideal `(x⁷)`. -/
example :
    let x : MvPolynomial (Fin 2) ℚ := MvPolynomial.X 0
    let y : MvPolynomial (Fin 2) ℚ := MvPolynomial.X 1
    let I := Ideal.span {y ^ 3 + x ^ 7 + x ^ 3 * y}
    let ρ := MvPolynomial.eval₂Hom (Polynomial.C : ℚ →+* Polynomial ℚ)
      (fun i : Fin 2 => if i = 0 then Polynomial.X else 0)
    (derivativeIdeal I).map ρ = Ideal.span {Polynomial.X ^ 3} ∧
      (derivativeIdeal (derivativeIdeal I)).map ρ = Ideal.span {Polynomial.X ^ 2} ∧
      (I ^ 2 ⊔ derivativeIdeal I ^ 3 ⊔ derivativeIdeal (derivativeIdeal I) ^ 6).map ρ =
        Ideal.span {Polynomial.X ^ 9} ∧
      I.map ρ = Ideal.span {Polynomial.X ^ 7} := sorry

/-- `DerivativeIdealChecks.cubic`: in characteristic zero the derivative ideal of `(x³)` is
`(x²)`. -/
example : derivativeIdeal (Ideal.span
    {((MvPolynomial.X () : MvPolynomial Unit ℚ) ^ 3)}) =
      Ideal.span {((MvPolynomial.X () : MvPolynomial Unit ℚ) ^ 2)} := sorry

/-- `MaxContactTests.characteristicTwoPower`: in characteristic two the derivative ideal of `(x²)`
is `(x²)` itself, so derivatives give no hypersurface of maximal contact. -/
example :
    derivativeIdeal (Ideal.span
      {((MvPolynomial.X () : MvPolynomial Unit (ZMod 2)) ^ 2)}) =
      Ideal.span {((MvPolynomial.X () : MvPolynomial Unit (ZMod 2)) ^ 2)} := sorry

/-- Maximal contact in characteristic zero: if `I` has order exactly `d ≥ 1` at a prime `𝔭` of the
polynomial ring, some element of the `(d − 1)`-st derivative ideal has order exactly `1` at `𝔭`.
This fails in positive characteristic (`x^p` over `𝔽_p`). -/
theorem exists_maximalContact [CharZero k] [Finite σ] (I : Ideal (MvPolynomial σ k))
    (p : PrimeSpectrum (MvPolynomial σ k)) (d : ℕ) (hd : 0 < d) (hI : idealOrderAt I p = d) :
    ∃ f ∈ derivativeIdeal^[d - 1] I, idealOrderAt (Ideal.span {f}) p = 1 := sorry

/-! ## Layer 5: the reduced field resolution milestone -/

open AlgebraicGeometry in
/-- Resolution of singularities in characteristic zero: a reduced separated scheme of finite type
over a field of characteristic zero admits a proper surjective morphism from a smooth scheme which
is an isomorphism over the entire smooth locus and over a dense open subscheme. The embedded,
functorial and boundary forms are README targets (Layers 5–7). -/
theorem exists_resolution [CharZero k] (X : Scheme.{u}) (s : X ⟶ Spec (CommRingCat.of k))
    [LocallyOfFiniteType s] [QuasiCompact s] [IsSeparated s] [IsReduced X] :
    ∃ (Y : Scheme.{u}) (π : Y ⟶ X), IsProper π ∧ Function.Surjective π.base ∧
      Smooth (π ≫ s) ∧ IsIso (π ∣_ s.smoothLocus) ∧
      ∃ U : X.Opens, Dense (U : Set X) ∧ IsIso (π ∣_ U) := sorry

end ResolutionOfSingularities

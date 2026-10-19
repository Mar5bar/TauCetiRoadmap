import Mathlib.LinearAlgebra.Vandermonde
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.Normed.Group.Basic
import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.Algebra.Order.Archimedean.Basic
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.Finite.Extension
import Mathlib.CategoryTheory.Groupoid
import Mathlib.CategoryTheory.IsomorphismClasses
import Mathlib.CategoryTheory.SingleObj
import Mathlib.CategoryTheory.Discrete.Basic
import Mathlib.CategoryTheory.Products.Basic
import Mathlib.CategoryTheory.Sums.Basic
import Mathlib.CategoryTheory.Action
import Mathlib.CategoryTheory.Equivalence
import Mathlib.GroupTheory.GroupAction.Defs
import Mathlib.Algebra.Group.Subgroup.ZPowers.Basic
import Mathlib.Algebra.IsPrimePow
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.PowerSeries.WellKnown
import Mathlib.LinearAlgebra.Matrix.Charpoly.Coeff
import Mathlib.FieldTheory.RatFunc.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Basic

/-!
# Weil conjectures: representative target signatures

This file is not the roadmap and is not exhaustive. README.md is definitive.
These statements suggest Lean forms so that contributors and reviewers converge
on names and signatures. Proofs are sorry; elaboration checks the signatures only.

The active declarations cover finite groupoid mass, signed configurations,
polynomial point counts and their APIs and examples; the finite-spectrum lemmas;
and algebraic forms of descent, integrality, duality, factor extraction and
recurrences. The final examples check Frobenius, Tate and zeta conventions on
existing matrices, rational functions and equations.

The geometric statements in README.md require the supplier's rational cohomology,
compact-support Frobenius, stack point groupoids, family comparison, duality and
cycle maps. Their full statements are README targets; this file records only signatures
statable against the pinned APIs.
-/

noncomputable section

open scoped BigOperators RatFunc
open Polynomial

universe u

namespace TauCeti.PointCounting

open CategoryTheory

/-! ### WC.1: finite groupoid mass -/

/-- finite-groupoid-mass: actual isomorphism classes and automorphism groups. -/
noncomputable def groupoidMass (C : Type*) [Category C] [IsGroupoid C]
    (hclasses : Finite (Quotient (isIsomorphicSetoid C)))
    (_hAut : ∀ x : C, Finite (Aut x)) : ℚ := by
  classical
  letI := hclasses
  letI := Fintype.ofFinite (Quotient (isIsomorphicSetoid C))
  exact ∑ x : Quotient (isIsomorphicSetoid C), (Nat.card (Aut x.out) : ℚ)⁻¹

theorem groupoidMass_aut_card_iso {C : Type*} [Groupoid C] {x y : C}
    (e : x ≅ y) : Nat.card (Aut x) = Nat.card (Aut y) := by
  sorry

theorem groupoidMass_equivalence {C D : Type*} [Groupoid C] [Groupoid D]
    (e : C ≌ D) (hC : Finite (Quotient (isIsomorphicSetoid C)))
    (hD : Finite (Quotient (isIsomorphicSetoid D)))
    (aC : ∀ x : C, Finite (Aut x)) (aD : ∀ x : D, Finite (Aut x)) :
    groupoidMass C hC aC = groupoidMass D hD aD := by
  sorry

theorem groupoidMass_discrete (A : Type*) [Finite A]
    (h : Finite (Quotient (isIsomorphicSetoid (Discrete A))))
    (a : ∀ x : Discrete A, Finite (Aut x)) :
    groupoidMass (Discrete A) h a = Nat.card A := by
  sorry

theorem groupoidMass_singleObj (G : Type*) [Group G] [Finite G]
    (h : Finite (Quotient (isIsomorphicSetoid (SingleObj G))))
    (a : ∀ x : SingleObj G, Finite (Aut x)) :
    groupoidMass (SingleObj G) h a = (Nat.card G : ℚ)⁻¹ := by
  sorry

theorem groupoidMass_product {C D : Type*} [Groupoid C] [Groupoid D]
    (hC : Finite (Quotient (isIsomorphicSetoid C)))
    (hD : Finite (Quotient (isIsomorphicSetoid D)))
    (hCD : Finite (Quotient (isIsomorphicSetoid (C × D))))
    (aC : ∀ x : C, Finite (Aut x)) (aD : ∀ x : D, Finite (Aut x))
    (aCD : ∀ x : C × D, Finite (Aut x)) :
    groupoidMass (C × D) hCD aCD = groupoidMass C hC aC * groupoidMass D hD aD := by
  sorry

/-- additivity over a disjoint union (stack stratifications).
Mathlib has no `IsGroupoid` instance for a sum of groupoids, so it is an argument here. -/
theorem groupoidMass_sum {C D : Type*} [Groupoid C] [Groupoid D] [IsGroupoid (C ⊕ D)]
    (hC : Finite (Quotient (isIsomorphicSetoid C)))
    (hD : Finite (Quotient (isIsomorphicSetoid D)))
    (hCD : Finite (Quotient (isIsomorphicSetoid (C ⊕ D))))
    (aC : ∀ x : C, Finite (Aut x)) (aD : ∀ x : D, Finite (Aut x))
    (aCD : ∀ x : C ⊕ D, Finite (Aut x)) :
    groupoidMass (C ⊕ D) hCD aCD = groupoidMass C hC aC + groupoidMass D hD aD := by
  sorry

/-- The action groupoid of a finite group on a finite set has mass `#Y / #G`
by orbit–stabilizer. For an algebraic quotient stack this is the trivial-torsor
stratum; its full point groupoid includes all torsor forms. The full mass formula
requires torsor triviality, as in README WC.1. Mathlib's
`Groupoid (ActionCategory G Y)` instance does not yield `IsGroupoid` by instance search at the
pin, so it is an argument here. -/
theorem groupoidMass_actionCategory (G Y : Type*) [Group G] [MulAction G Y] [Finite G] [Finite Y]
    [IsGroupoid (ActionCategory G Y)]
    (h : Finite (Quotient (isIsomorphicSetoid (ActionCategory G Y))))
    (a : ∀ x : ActionCategory G Y, Finite (Aut x)) :
    groupoidMass (ActionCategory G Y) h a = (Nat.card Y : ℚ) / Nat.card G := by
  sorry

-- groupoidMass_empty
example (h : Finite (Quotient (isIsomorphicSetoid (Discrete Empty))))
    (a : ∀ x : Discrete Empty, Finite (Aut x)) : groupoidMass (Discrete Empty) h a = 0 := by
  sorry

-- groupoidMass_three
example (h : Finite (Quotient (isIsomorphicSetoid (Discrete (Fin 3)))))
    (a : ∀ x : Discrete (Fin 3), Finite (Aut x)) :
    groupoidMass (Discrete (Fin 3)) h a = 3 := by
  sorry

-- groupoidMass_cyclic_two
example (h : Finite (Quotient (isIsomorphicSetoid (SingleObj (Multiplicative (ZMod 2))))))
    (a : ∀ x : SingleObj (Multiplicative (ZMod 2)), Finite (Aut x)) :
    groupoidMass (SingleObj (Multiplicative (ZMod 2))) h a = 1 / 2 := by
  sorry

-- groupoidMass_cyclic_two_not_one
example (h : Finite (Quotient (isIsomorphicSetoid (SingleObj (Multiplicative (ZMod 2))))))
    (a : ∀ x : SingleObj (Multiplicative (ZMod 2)), Finite (Aut x)) :
    groupoidMass (SingleObj (Multiplicative (ZMod 2))) h a ≠ 1 := by
  sorry

-- groupoidMass_regular_action: two objects, one class, mass 1
example [IsGroupoid (ActionCategory (Multiplicative (ZMod 2)) (Multiplicative (ZMod 2)))]
    (h : Finite (Quotient (isIsomorphicSetoid
      (ActionCategory (Multiplicative (ZMod 2)) (Multiplicative (ZMod 2))))))
    (a : ∀ x : ActionCategory (Multiplicative (ZMod 2)) (Multiplicative (ZMod 2)), Finite (Aut x)) :
    groupoidMass (ActionCategory (Multiplicative (ZMod 2)) (Multiplicative (ZMod 2))) h a = 1 := by
  sorry

/-! ### WC.1: signed Frobenius configurations -/

/-- signed-frobenius-configuration-coefficient: the exponent counts orbits. -/
noncomputable def signedConfigurationCoefficient {A : Type*} [DecidableEq A]
    (σ : Equiv.Perm A)
    (hf : ∀ n : ℕ, Finite {S : Finset A // S.card = n ∧ S.map σ.toEmbedding = S})
    (n : ℕ) : ℤ := by
  classical
  letI := hf n
  letI := Fintype.ofFinite {S : Finset A // S.card = n ∧ S.map σ.toEmbedding = S}
  exact ∑ S : {S : Finset A // S.card = n ∧ S.map σ.toEmbedding = S},
    (-1 : ℤ) ^ (S.val.image (Quotient.mk (MulAction.orbitRel (Subgroup.zpowers σ) A))).card

theorem signedConfigurationCoefficient_zero {A : Type*} [DecidableEq A]
    (σ : Equiv.Perm A)
    (hf : ∀ n : ℕ, Finite {S : Finset A // S.card = n ∧ S.map σ.toEmbedding = S}) :
    signedConfigurationCoefficient σ hf 0 = 1 := by
  sorry

theorem signedConfigurationCoefficient_one {A : Type*} [DecidableEq A]
    (σ : Equiv.Perm A)
    (hf : ∀ n : ℕ, Finite {S : Finset A // S.card = n ∧ S.map σ.toEmbedding = S}) :
    signedConfigurationCoefficient σ hf 1 = -(Nat.card {x : A // σ x = x} : ℤ) := by
  sorry

theorem signedConfigurationCoefficient_conjugate {A B : Type*} [DecidableEq A] [DecidableEq B]
    (σ : Equiv.Perm A) (e : A ≃ B)
    (hf : ∀ n : ℕ, Finite {S : Finset A // S.card = n ∧ S.map σ.toEmbedding = S})
    (hg : ∀ n : ℕ, Finite {S : Finset B // S.card = n ∧
      S.map (e.symm.trans (σ.trans e)).toEmbedding = S}) (n : ℕ) :
    signedConfigurationCoefficient (e.symm.trans (σ.trans e)) hg n =
      signedConfigurationCoefficient σ hf n := by
  sorry

theorem signedConfigurationCoefficient_above_card {A : Type*} [DecidableEq A] [Finite A]
    (σ : Equiv.Perm A)
    (hf : ∀ n : ℕ, Finite {S : Finset A // S.card = n ∧ S.map σ.toEmbedding = S})
    (n : ℕ) (hn : Nat.card A < n) : signedConfigurationCoefficient σ hf n = 0 := by
  sorry

/-- coefficients multiply under disjoint union, BFP (9). -/
theorem signedConfigurationCoefficient_sumCongr {A B : Type*} [DecidableEq A] [DecidableEq B]
    (σ : Equiv.Perm A) (τ : Equiv.Perm B)
    (hσ : ∀ n : ℕ, Finite {S : Finset A // S.card = n ∧ S.map σ.toEmbedding = S})
    (hτ : ∀ n : ℕ, Finite {S : Finset B // S.card = n ∧ S.map τ.toEmbedding = S})
    (hστ : ∀ n : ℕ, Finite {S : Finset (A ⊕ B) // S.card = n ∧
      S.map (Equiv.sumCongr σ τ).toEmbedding = S}) (n : ℕ) :
    signedConfigurationCoefficient (Equiv.sumCongr σ τ) hστ n =
      ∑ i ∈ Finset.range (n + 1),
        signedConfigurationCoefficient σ hσ i * signedConfigurationCoefficient τ hτ (n - i) := by
  sorry

open Classical in
/-- for finite `A` the generating polynomial is the product of
`1 - T ^ #O` over the orbits `O`, the finite form of the inverse-zeta Euler product. -/
theorem signedConfigurationCoefficient_generating {A : Type*} [DecidableEq A] [Fintype A]
    (σ : Equiv.Perm A)
    (hf : ∀ n : ℕ, Finite {S : Finset A // S.card = n ∧ S.map σ.toEmbedding = S}) :
    (∑ n ∈ Finset.range (Fintype.card A + 1),
        Polynomial.C (signedConfigurationCoefficient σ hf n) * Polynomial.X ^ n : Polynomial ℤ) =
      ∏ O : MulAction.orbitRel.Quotient (Subgroup.zpowers σ) A,
        (1 - Polynomial.X ^ Nat.card O.orbit) := by
  sorry

-- signedConfigurationCoefficient_empty
example (hf : ∀ n : ℕ, Finite {S : Finset Empty // S.card = n ∧
    S.map (Equiv.refl Empty).toEmbedding = S}) :
    signedConfigurationCoefficient (Equiv.refl Empty) hf 0 = 1 ∧
    signedConfigurationCoefficient (Equiv.refl Empty) hf 1 = 0 := by
  sorry

-- signedConfigurationCoefficient_fixed_two
example (hf : ∀ n : ℕ, Finite {S : Finset Bool // S.card = n ∧
    S.map (Equiv.refl Bool).toEmbedding = S}) :
    signedConfigurationCoefficient (Equiv.refl Bool) hf 0 = 1 ∧
    signedConfigurationCoefficient (Equiv.refl Bool) hf 1 = -2 ∧
    signedConfigurationCoefficient (Equiv.refl Bool) hf 2 = 1 := by
  sorry

-- signedConfigurationCoefficient_two_cycle
example (hf : ∀ n : ℕ, Finite {S : Finset Bool // S.card = n ∧
    S.map (Equiv.swap true false).toEmbedding = S}) :
    signedConfigurationCoefficient (Equiv.swap true false) hf 1 = 0 ∧
    signedConfigurationCoefficient (Equiv.swap true false) hf 2 = -1 := by
  sorry

-- signedConfigurationCoefficient_two_cycle_sign
example (hf : ∀ n : ℕ, Finite {S : Finset Bool // S.card = n ∧
    S.map (Equiv.swap true false).toEmbedding = S}) :
    signedConfigurationCoefficient (Equiv.swap true false) hf 2 ≠ 1 := by
  sorry

-- A fixed point disjoint from a two-cycle: (1-T)(1-T^2).
example (hf : ∀ n : ℕ, Finite {S : Finset (Unit ⊕ Bool) // S.card = n ∧
    S.map (Equiv.sumCongr (Equiv.refl Unit) (Equiv.swap true false)).toEmbedding = S}) :
    let σ := Equiv.sumCongr (Equiv.refl Unit) (Equiv.swap true false)
    signedConfigurationCoefficient σ hf 0 = 1 ∧
    signedConfigurationCoefficient σ hf 1 = -1 ∧
    signedConfigurationCoefficient σ hf 2 = -1 ∧
    signedConfigurationCoefficient σ hf 3 = 1 := by
  sorry

/-! ### WC.1: algebraic cores of rationality, Fatou and Möbius inversion -/

/-- WC.1 rational-series descent, algebraic core of the geometric comparison. -/
theorem rational_series_descent {K L : Type*} [Field K] [Field L] [Algebra K L]
    (f : PowerSeries K)
    (h : ∃ P Q : Polynomial L, Q.coeff 0 ≠ 0 ∧
      (Q : PowerSeries L) * f.map (algebraMap K L) = (P : PowerSeries L)) :
    ∃ P Q : Polynomial K, Q.coeff 0 ≠ 0 ∧ (Q : PowerSeries K) * f = (P : PowerSeries K) := by
  sorry

/-- Specialization of DeligneWeightsAndPurity §4.4's local Fatou helper to
`ℚ_ℓ`, at any prime including the geometric characteristic. -/
theorem local_fatou_normalization (ℓ : ℕ) [Fact ℓ.Prime]
    (f : PowerSeries (Padic ℓ)) (P Q : Polynomial (Padic ℓ))
    (hf : ∀ n : ℕ, ‖f.coeff n‖ ≤ 1) (hf0 : f.coeff 0 = 1)
    (hP : P.coeff 0 = 1) (hQ : Q.coeff 0 = 1) (hpq : IsCoprime P Q)
    (heq : (Q : PowerSeries (Padic ℓ)) * f = (P : PowerSeries (Padic ℓ))) :
    (∀ n : ℕ, ‖P.coeff n‖ ≤ 1) ∧ (∀ n : ℕ, ‖Q.coeff n‖ ≤ 1) := by
  sorry

/-- WC.1 integer Möbius core; actual nonnegative point counts give divisibility. -/
theorem closed_point_counts_mobius (a N : ℕ → ℤ)
    (h : ∀ r : ℕ, 0 < r → N r = ∑ m ∈ r.divisors, (m : ℤ) * a m)
    (r : ℕ) (hr : 0 < r) :
    (r : ℤ) * a r = ∑ m ∈ r.divisors, ArithmeticFunction.moebius m * N (r / m) := by
  sorry

/-! ### WC.2: algebraic cores of the functional equation -/

/-- WC.2 evaluated algebraic assembly. No power series is evaluated at T⁻¹. -/
theorem signed_zeta_functional_equation {K : Type*} [Field K]
    (d : ℕ) (b : Fin (2 * d + 1) → ℕ) (P : Fin (2 * d + 1) → Polynomial K)
    (δ : Fin (2 * d + 1) → K) (q t : K) (hq : q ≠ 0) (ht : t ≠ 0)
    (hδ : ∀ i, δ i ≠ 0) (hb : ∀ i, b i = b i.rev)
    (hP : ∀ i, (P i).eval t ≠ 0)
    (hrec : ∀ i, (P i).eval ((q ^ d * t)⁻¹) =
      (-1 : K) ^ b i * δ i * q ^ (-((d * b i : ℕ) : ℤ)) *
        t ^ (-(b i : ℤ)) * (P i.rev).eval t)
    (hdet : ∀ i, δ i * δ i.rev = q ^ (d * b i)) :
    let χ : ℤ := ∑ i : Fin (2 * d + 1), (-1 : ℤ) ^ i.val * b i
    let Δ : K := ∏ i : Fin (2 * d + 1), δ i ^ ((-1 : ℤ) ^ i.val)
    (∏ i : Fin (2 * d + 1), ((P i).eval ((q ^ d * t)⁻¹)) ^
      ((-1 : ℤ) ^ (i.val + 1))) =
      (-1 : K) ^ χ * Δ * t ^ χ *
        (∏ i : Fin (2 * d + 1), ((P i).eval t) ^ ((-1 : ℤ) ^ (i.val + 1))) ∧
    Δ ^ 2 = q ^ ((d : ℤ) * χ) := by
  sorry

/-- WC.2 integer parity core; alternating middle pairing supplies the last hypothesis. -/
theorem middle_degree_parity (d : ℕ) (b : Fin (2 * d + 1) → ℕ)
    (hdual : ∀ i : Fin (2 * d + 1), b i = b i.rev)
    (hmid : Odd d → Even (b ⟨d, by omega⟩)) :
    Even ((d : ℤ) * ∑ i : Fin (2 * d + 1), (-1 : ℤ) ^ i.val * b i) := by
  sorry

/-- WC.2 constant scalar descent and sign, without selecting square roots. -/
theorem functional_equation_multiplier_descent {K : Type*} [Field K] [Algebra ℚ K]
    (P Q : Polynomial ℚ) (hQ : Q ≠ 0) (A : K)
    (heq : P.map (algebraMap ℚ K) = C A * Q.map (algebraMap ℚ K))
    (q : ℚ) (hq : 0 < q) (m : ℤ) (hsquare : A ^ 2 = algebraMap ℚ K (q ^ (2 * m))) :
    ∃ a : ℚ, algebraMap ℚ K a = A ∧ (a / q ^ m = 1 ∨ a / q ^ m = -1) := by
  sorry

/-- WC.2 scalar sign identity after degree-r base extension. -/
theorem functional_equation_base_extension {K : Type*} [Field K]
    (χ : ℤ) (Δ q : K) (hq : q ≠ 0) (m : ℤ) (r : ℕ) :
    ((-1 : K) ^ χ * Δ ^ r) / (q ^ r) ^ m =
      (-1 : K) ^ (((r : ℤ) + 1) * χ) * (((-1 : K) ^ χ * Δ) / q ^ m) ^ r := by
  sorry

/-! ### WC.3: algebraic core of the degreewise extraction -/

/-- Finite-Galois adapter to DeligneWeightsAndPurity §4.4 degree-factor
extraction, retaining all embeddings and multiplicities. -/
theorem degreewise_pure_factor_extraction {K : Type*} [Field K] [Algebra ℚ K]
    [FiniteDimensional ℚ K] [IsGalois ℚ K] (hemb : Nonempty (K →ₐ[ℚ] ℂ))
    (q r : ℕ) (hq : 1 < q) (b : Fin r → ℕ)
    (α : (i : Fin r) → Fin (b i) → K)
    (hα : ∀ i j, α i j ≠ 0)
    (hw : ∀ σ : K →ₐ[ℚ] ℂ, ∀ i j, ‖σ (α i j)‖ = (q : ℝ) ^ ((i.val : ℝ) / 2))
    (U V : Polynomial ℤ) (hU : U.coeff 0 = 1) (hV : V.coeff 0 = 1)
    (hcop : IsCoprime (U.map (Int.castRingHom ℚ)) (V.map (Int.castRingHom ℚ)))
    (heq : U.map (Int.castRingHom K) *
        (∏ i ∈ Finset.univ.filter (fun i : Fin r => Even i.val),
          ∏ j : Fin (b i), (1 - C (α i j) * X)) =
      V.map (Int.castRingHom K) *
        (∏ i ∈ Finset.univ.filter (fun i : Fin r => Odd i.val),
          ∏ j : Fin (b i), (1 - C (α i j) * X))) :
    ∃! factors : Fin r → Polynomial ℤ,
      (∀ i,
        (factors i).map (Int.castRingHom K) = ∏ j : Fin (b i), (1 - C (α i j) * X) ∧
        (factors i).coeff 0 = 1 ∧ (factors i).natDegree = b i) ∧
      (∀ i j, i ≠ j → IsCoprime
        ((factors i).map (Int.castRingHom ℚ))
        ((factors j).map (Int.castRingHom ℚ))) := by
  sorry

/-! ### WC.5: algebraic cores of the bound and the recurrence -/

/-- WC.5 scalar triangle-bound core with interior degrees only. -/
theorem all_extension_point_count_bound (d : ℕ) (b : Fin (2 * d - 1) → ℕ)
    (α : (i : Fin (2 * d - 1)) → Fin (b i) → ℂ) (q : ℝ) (hq : 1 < q)
    (hroot : ∀ i j, ‖α i j‖ = q ^ (((i.val + 1 : ℕ) : ℝ) / 2)) (r : ℕ) :
    ‖∑ i : Fin (2 * d - 1), (-1 : ℂ) ^ (i.val + 1) * ∑ j : Fin (b i), α i j ^ r‖ ≤
      ∑ i : Fin (2 * d - 1), (b i : ℝ) * q ^ (((i.val + 1 : ℕ) : ℝ) * r / 2) := by
  sorry

/-- WC.5 recurrence core; S₀=b is an algebraic moment, never an F₁ count. -/
theorem extension_count_recurrence {K : Type*} [Field K] [CharZero K]
    {b : ℕ} (α : Fin b → K) :
    let P : Polynomial K := ∏ i : Fin b, (1 - C (α i) * X)
    let S : ℕ → K := fun n => ∑ i : Fin b, α i ^ n
    (∀ n : ℕ, b ≤ n → ∑ j : Fin (b + 1), P.coeff j.val * S (n - j.val) = 0) ∧
    (∀ n : ℕ, 1 ≤ n → n ≤ b → S n +
      (∑ j ∈ Finset.Ico 1 n, P.coeff j * S (n - j)) + (n : K) * P.coeff n = 0) := by
  sorry

/-! ### WC.5: polynomial point counts -/

/-- polynomial-point-count: a genuine predicate, with no admitted body. -/
def HasPolynomialPointCount (N : ℕ → ℚ) (P : Polynomial ℚ) : Prop :=
  ∀ q : ℕ, IsPrimePow q → N q = P.eval (q : ℚ)

theorem HasPolynomialPointCount_eval {N : ℕ → ℚ} {P : Polynomial ℚ}
    (h : HasPolynomialPointCount N P) {q : ℕ} (hq : IsPrimePow q) : N q = P.eval (q : ℚ) := by
  sorry

theorem HasPolynomialPointCount_unique {N : ℕ → ℚ} {P Q : Polynomial ℚ}
    (hP : HasPolynomialPointCount N P) (hQ : HasPolynomialPointCount N Q) : P = Q := by
  sorry

theorem HasPolynomialPointCount_zero : HasPolynomialPointCount (fun _ => 0) 0 := by
  sorry

theorem HasPolynomialPointCount_add {N M : ℕ → ℚ} {P Q : Polynomial ℚ}
    (hP : HasPolynomialPointCount N P) (hQ : HasPolynomialPointCount M Q) :
    HasPolynomialPointCount (fun q => N q + M q) (P + Q) := by
  sorry

theorem HasPolynomialPointCount_mul {N M : ℕ → ℚ} {P Q : Polynomial ℚ}
    (hP : HasPolynomialPointCount N P) (hQ : HasPolynomialPointCount M Q) :
    HasPolynomialPointCount (fun q => N q * M q) (P * Q) := by
  sorry

theorem HasPolynomialPointCount_congr {N M : ℕ → ℚ} {P : Polynomial ℚ}
    (h : ∀ q : ℕ, IsPrimePow q → N q = M q) :
    HasPolynomialPointCount N P ↔ HasPolynomialPointCount M P := by
  sorry

-- polynomialPointCount_projective_line
example : HasPolynomialPointCount (fun q => q + 1) (X + 1) := by
  sorry

-- polynomialPointCount_empty
example : HasPolynomialPointCount (fun _ => 0) 0 := by
  sorry

-- polynomialPointCount_multiplicative_group
example : HasPolynomialPointCount (fun q => (q : ℚ) - 1) (X - 1) := by
  sorry

-- polynomialPointCount_prime_fields_insufficient
example : ¬ HasPolynomialPointCount (fun q => if q = 4 then 0 else (q : ℚ) + 1) (X + 1) := by
  sorry

-- polynomialPointCount_one_field_insufficient
example : (X : Polynomial ℚ).eval 2 = (X + (X - C 2) : Polynomial ℚ).eval 2 ∧
    (X : Polynomial ℚ) ≠ X + (X - C 2) := by
  sorry

end TauCeti.PointCounting

namespace TauCeti.FiniteSpectrum

/-! ### WC.5:power-sum-converse: the finite-spectrum lemma -/

/-- recover-consecutive-moments. Rows of V are roots, columns are exponents. -/
theorem recover_consecutive_moments {K : Type u} [Field K] {d : ℕ}
    (β c : Fin d → K) (hβ : Function.Injective β) (n : ℕ) (k : Fin d) :
    c k * β k ^ n =
      ∑ j : Fin d, ((Matrix.vandermonde β)⁻¹) j k *
        (∑ i : Fin d, c i * β i ^ (n + (j : ℕ))) := by
  sorry

/-- consecutive-moment-bound; no division by R or a coefficient. -/
theorem consecutive_moment_bound {K : Type u} [NormedField K] {d : ℕ}
    (β c : Fin d → K) (hβ : Function.Injective β)
    (C R : ℝ) (hC : 0 ≤ C) (hR : 0 ≤ R) (N n : ℕ) (hn : N ≤ n)
    (hbound : ∀ m : ℕ, N ≤ m → ‖∑ i : Fin d, c i * β i ^ m‖ ≤ C * R ^ m)
    (k : Fin d) :
    ‖c k‖ * ‖β k‖ ^ n ≤
      C * R ^ n * ∑ j : Fin d, ‖((Matrix.vandermonde β)⁻¹) j k‖ * R ^ (j : ℕ) := by
  sorry

/-- distinct-spectrum-bound. -/
theorem norm_le_of_distinct_moment_bound {K : Type u} [NormedField K] {d : ℕ}
    (β c : Fin d → K) (hβ : Function.Injective β)
    (C R : ℝ) (hC : 0 ≤ C) (hR : 0 ≤ R) (N : ℕ)
    (hbound : ∀ n : ℕ, N ≤ n → ‖∑ i : Fin d, c i * β i ^ n‖ ≤ C * R ^ n)
    (k : Fin d) (hc : c k ≠ 0) : ‖β k‖ ≤ R := by
  sorry

/-- grouped-spectrum-bound. It is the whole fibre weight that must be nonzero. -/
theorem norm_le_of_grouped_moment_bound {K : Type u} [NormedField K]
    [DecidableEq K] {d : ℕ} (α w : Fin d → K)
    (C R : ℝ) (hC : 0 ≤ C) (hR : 0 ≤ R) (N : ℕ)
    (hbound : ∀ n : ℕ, N ≤ n → ‖∑ i : Fin d, w i * α i ^ n‖ ≤ C * R ^ n)
    (j : Fin d)
    (hw : (∑ i ∈ Finset.univ.filter (fun i : Fin d => α i = α j), w i) ≠ 0) :
    ‖α j‖ ≤ R := by
  sorry

/-- power-sum-converse. Characteristic zero prevents vanishing multiplicities. -/
theorem norm_le_of_power_sum_bound {K : Type u} [NormedField K] [CharZero K]
    {d : ℕ} (α : Fin d → K) (C R : ℝ) (hC : 0 ≤ C) (hR : 0 ≤ R) (N : ℕ)
    (hbound : ∀ n : ℕ, N ≤ n → ‖∑ i : Fin d, α i ^ n‖ ≤ C * R ^ n) :
    ∀ i : Fin d, ‖α i‖ ≤ R := by
  sorry

/-- power-sum-bound-iff. In the right-to-left direction take C=d. -/
theorem power_sum_bound_iff {K : Type u} [NormedField K] [CharZero K]
    {d : ℕ} (α : Fin d → K) (R : ℝ) (hR : 0 ≤ R) :
    (∃ C : ℝ, 0 ≤ C ∧ ∀ n : ℕ, 1 ≤ n → ‖∑ i : Fin d, α i ^ n‖ ≤ C * R ^ n) ↔
      (∀ i : Fin d, ‖α i‖ ≤ R) := by
  sorry

/-- reciprocal-moments-escape-unit-ball. No valuation-ring substitute is defined. -/
theorem reciprocal_moments_escape {K : Type u} [NormedField K] {d : ℕ}
    (hd : 0 < d) (γ c : Fin d → K) (hγ : Function.Injective γ)
    (hsmall : ∀ i : Fin d, 0 < ‖γ i‖ ∧ ‖γ i‖ < 1)
    (hc : ∀ i : Fin d, c i ≠ 0) (N : ℕ) :
    ∃ n : ℕ, max N 1 ≤ n ∧ 1 < ‖∑ i : Fin d, c i * (γ i)⁻¹ ^ n‖ := by
  sorry

/-- power-sum-generating-series. Index n represents the positive exponent n+1. -/
theorem hasSum_power_sum_generating {K : Type u} [NormedField K] {d : ℕ}
    (β c : Fin d → K) (z : K) (hz : ∀ i : Fin d, ‖β i * z‖ < 1) :
    HasSum (fun n : ℕ => (∑ i : Fin d, c i * β i ^ (n + 1)) * z ^ (n + 1))
      (∑ i : Fin d, c i * β i * z / (1 - β i * z)) := by
  sorry

/-- generating-numerator-denominator. Polynomial carriers are the existing ones. -/
theorem generating_common_denominator {K : Type u} [Field K] {d : ℕ}
    (β c : Fin d → K) :
    let D : Polynomial K := ∏ i : Fin d, (1 - C (β i) * X)
    let P : Polynomial K := ∑ i : Fin d, C (c i * β i) * X *
      ∏ j ∈ Finset.univ.erase i, (1 - C (β j) * X)
    D.eval 0 = 1 ∧ ∀ z : K, (∀ i : Fin d, 1 - β i * z ≠ 0) →
      P.eval z / D.eval z = ∑ i : Fin d, c i * β i * z / (1 - β i * z) := by
  sorry

/-- formal-power-sum-product. No norm, distinctness or characteristic restriction. -/
theorem formal_power_sum_product {K : Type u} [CommRing K] {d : ℕ}
    (β c : Fin d → K) :
    let D : Polynomial K := ∏ i : Fin d, (1 - C (β i) * X)
    let P : Polynomial K := ∑ i : Fin d, C (c i * β i) * X *
      ∏ j ∈ Finset.univ.erase i, (1 - C (β j) * X)
    let G : PowerSeries K := PowerSeries.mk
      (fun n : ℕ => if n = 0 then 0 else ∑ i : Fin d, c i * β i ^ n)
    (D : PowerSeries K) * G = (P : PowerSeries K) := by
  sorry

/-- formal-rational-comparison. Equality lives in the existing Laurent series field. -/
theorem formal_power_sum_eq_ratFunc {K : Type u} [Field K] {d : ℕ}
    (β c : Fin d → K) :
    let D : Polynomial K := ∏ i : Fin d, (1 - C (β i) * X)
    let P : Polynomial K := ∑ i : Fin d, C (c i * β i) * X *
      ∏ j ∈ Finset.univ.erase i, (1 - C (β j) * X)
    let G : PowerSeries K := PowerSeries.mk
      (fun n : ℕ => if n = 0 then 0 else ∑ i : Fin d, c i * β i ^ n)
    (G : LaurentSeries K) =
      algebraMap (RatFunc K) (LaurentSeries K)
        (algebraMap (Polynomial K) (RatFunc K) P /
          algebraMap (Polynomial K) (RatFunc K) D) := by
  sorry

/-- pole-cancellation-criterion. N and D cannot share this root when c_k is nonzero. -/
theorem generating_pole_cancellation_iff {K : Type u} [Field K] {d : ℕ}
    (β c : Fin d → K) (hβ : Function.Injective β) (k : Fin d) (hk : β k ≠ 0) :
    let P : Polynomial K := ∑ i : Fin d, C (c i * β i) * X *
      ∏ j ∈ Finset.univ.erase i, (1 - C (β j) * X)
    P.eval ((β k)⁻¹) = 0 ↔ c k = 0 := by
  sorry

/-- no-pole-in-bounded-disc. Retain nonzero grouped weights. -/
theorem no_pole_of_power_sum_bound {K : Type u} [NormedField K] {d : ℕ}
    (β c : Fin d → K) (hβ : Function.Injective β) (hc : ∀ i : Fin d, c i ≠ 0)
    (C R : ℝ) (hC : 0 ≤ C) (hR : 0 ≤ R) (N : ℕ)
    (hbound : ∀ n : ℕ, N ≤ n → ‖∑ i : Fin d, c i * β i ^ n‖ ≤ C * R ^ n)
    (z : K) (hz : R * ‖z‖ < 1) :
    (∀ i : Fin d, 1 - β i * z ≠ 0) ∧
      HasSum (fun n : ℕ => (∑ i : Fin d, c i * β i ^ (n + 1)) * z ^ (n + 1))
        (∑ i : Fin d, c i * β i * z / (1 - β i * z)) := by
  sorry

/-- reciprocal-pairing-forces-equality. Geometry must supply the actual pairing. -/
theorem norm_eq_of_reciprocal_pairing {d : ℕ}
    (α : Fin d → ℂ) (τ : Equiv.Perm (Fin d))
    (C R : ℝ) (hC : 0 ≤ C) (hR : 0 < R) (N : ℕ)
    (hpair : ∀ i : Fin d, α i * α (τ i) = ((R ^ 2 : ℝ) : ℂ))
    (hbound : ∀ n : ℕ, N ≤ n → ‖∑ i : Fin d, α i ^ n‖ ≤ C * R ^ n) :
    ∀ i : Fin d, ‖α i‖ = R := by
  sorry

-- test empty_family
example (n : ℕ) : (∑ i : Fin 0, (0 : ℂ) ^ n) = 0 := by
  sorry

-- test repeated_root_multiplicity
example (n : ℕ) : (∑ _i : Fin 2, (2 : ℂ) ^ n) = 2 * (2 : ℂ) ^ n := by
  sorry

-- test first_moment_cancellation
example : (2 : ℂ) + (-2) = 0 := by
  sorry

-- test second_moment_detection
example : (2 : ℂ) ^ 2 + (-2) ^ 2 = 8 := by
  sorry

-- test invisible_grouped_root
example (n : ℕ) : (100 : ℂ) ^ n - (100 : ℂ) ^ n = 0 := by
  sorry

-- test positive_characteristic_multiplicity
example (n : ℕ) : (∑ _i : Fin 2, (1 : ZMod 2) ^ n) = 0 := by
  sorry

-- test four_equal_modulus_roots
example : (1 : ℂ) + Complex.I + (-1) + (-Complex.I) = 0 ∧
    (1 : ℂ)^2 + Complex.I^2 + (-1)^2 + (-Complex.I)^2 = 0 ∧
    (1 : ℂ)^3 + Complex.I^3 + (-1)^3 + (-Complex.I)^3 = 0 ∧
    (1 : ℂ)^4 + Complex.I^4 + (-1)^4 + (-Complex.I)^4 = 4 := by
  sorry

-- test transpose_orientation
example (c₀ c₁ : ℂ) (n : ℕ) :
    c₀ * 2 ^ n = (c₀ * 2 ^ n + c₁ * (-2) ^ n) / 2 +
      (c₀ * 2 ^ (n+1) + c₁ * (-2) ^ (n+1)) / 4 := by
  sorry

-- test zero_radius_tail
example {d : ℕ} (α : Fin d → ℂ) (N : ℕ)
    (h : ∀ n : ℕ, max N 1 ≤ n → ‖∑ i : Fin d, α i ^ n‖ ≤ 0) :
    ∀ i : Fin d, α i = 0 := by
  sorry

-- test zero_at_origin
example {d : ℕ} (β c : Fin d → ℂ) :
    HasSum (fun n : ℕ => (∑ i : Fin d, c i * β i ^ (n+1)) * (0 : ℂ) ^ (n+1)) 0 := by
  sorry

-- test one_root_generating_function
example (b c z : ℂ) (h : ‖b * z‖ < 1) :
    HasSum (fun n : ℕ => c * b ^ (n+1) * z ^ (n+1)) (c * b * z / (1-b*z)) := by
  sorry

-- test repeated_denominator_requires_grouping
example (b : ℂ) (hb : b ≠ 0) :
    (2 * b * b⁻¹ * (1-b*b⁻¹) : ℂ) = 0 := by
  sorry

-- test zero_root_no_finite_pole
example (z c : ℂ) : c * 0 * z / (1 - 0 * z) = 0 := by
  sorry

-- test reciprocal_pair
example : (3 + 4 * Complex.I) * (3 - 4 * Complex.I) = (25 : ℂ) ∧
    ‖3 + 4 * Complex.I‖ = (5 : ℝ) ∧ ‖3 - 4 * Complex.I‖ = (5 : ℝ) := by
  sorry

-- test positive_exponents_only
example : ((2 : ℂ) * 0 / (1 - 2 * 0)) = 0 ∧ (1 : ℂ) / (1 - 2 * 0) = 1 := by
  sorry

-- test formal_positive_coefficients
example {K : Type u} [CommRing K] {d : ℕ} (β c : Fin d → K) (n : ℕ) :
    let G : PowerSeries K := PowerSeries.mk
      (fun m : ℕ => if m = 0 then 0 else ∑ i : Fin d, c i * β i ^ m)
    PowerSeries.coeff 0 G = 0 ∧
      PowerSeries.coeff (n + 1) G = ∑ i : Fin d, c i * β i ^ (n + 1) := by
  sorry

-- test formal_single_root_laurent
example (b c : ℚ) :
    ((PowerSeries.mk (fun n : ℕ => if n = 0 then 0 else c * b ^ n) :
      PowerSeries ℚ) : LaurentSeries ℚ) =
      algebraMap (RatFunc ℚ) (LaurentSeries ℚ)
        ((algebraMap (Polynomial ℚ) (RatFunc ℚ) (C (c * b) * X)) /
          algebraMap (Polynomial ℚ) (RatFunc ℚ) (1 - C b * X)) := by
  sorry

-- test formal_empty_spectrum
example :
    ((PowerSeries.mk (fun n : ℕ => if n = 0 then 0 else
      ∑ _i : Fin 0, (1 : ℚ) ^ n) : PowerSeries ℚ) : LaurentSeries ℚ) = 0 := by
  sorry

-- test formal_characteristic_two_cancellation
example :
    (PowerSeries.mk (fun n : ℕ => if n = 0 then 0 else
      ∑ _i : Fin 2, (1 : ZMod 2) ^ n) : PowerSeries (ZMod 2)) = 0 := by
  sorry

-- test formal_zero_root_zeroth_power
example :
    (PowerSeries.mk (fun n : ℕ => if n = 0 then 0 else (0 : ℚ) ^ n) :
      PowerSeries ℚ) = 0 := by
  sorry

/-- little-o-visible-root-vanishing. The boundary is strict. -/
theorem norm_lt_of_moments_little_o {K : Type*} [NormedField K] {d : ℕ}
    (β c : Fin d → K) (hβ : Function.Injective β) (R : ℝ) (hR : 0 < R)
    (hlimit : Filter.Tendsto (fun n : ℕ => ‖∑ i : Fin d, c i * β i ^ n‖ / R ^ n)
      Filter.atTop (nhds 0)) (k : Fin d) (hc : c k ≠ 0) : ‖β k‖ < R := by
  sorry

/-- graded-polynomial-approximation-lemma. Multiplicities, not eigenspaces. -/
theorem graded_polynomial_approximation (p : ℝ) (hp : 1 < p) (r s : ℕ)
    (b : Fin (r + 1) → ℕ) (α : (i : Fin (r + 1)) → Fin (b i) → ℂ)
    (P : Polynomial ℚ)
    (hweight : ∀ i j, ‖α i j‖ = p ^ ((i.val : ℝ) / 2))
    (hlimit : Filter.Tendsto (fun n : ℕ =>
      ‖(∑ i : Fin (r + 1), (-1 : ℂ) ^ i.val * ∑ j : Fin (b i), α i j ^ n) -
        P.eval₂ (algebraMap ℚ ℂ) ((p ^ n : ℝ) : ℂ)‖ / p ^ ((s : ℝ) * n / 2)) Filter.atTop (nhds 0)) :
    (∀ i : Fin (r + 1), s ≤ i.val → Odd i.val → b i = 0) ∧
    (∀ i : Fin (r + 1), s ≤ i.val → ∀ j : ℕ, i.val = 2 * j →
      P.coeff j = (b i : ℚ) ∧ ∀ k : Fin (b i), α i k = (p ^ j : ℝ)) ∧
    (∀ j : ℕ, s ≤ 2 * j → r < 2 * j → P.coeff j = 0) := by
  sorry

-- The approximate polynomial for P^2 differs from the exact count by one.
example (p : ℝ) (n : ℕ) :
    ((p ^ n) ^ 2 + p ^ n + 1) - ((p ^ n) ^ 2 + p ^ n) = 1 := by
  sorry

-- That error is little-o of p^n for p>1, rather than identically zero.
example (p : ℝ) (hp : 1 < p) :
    Filter.Tendsto (fun n : ℕ =>
      ‖((p ^ n) ^ 2 + p ^ n + 1) - ((p ^ n) ^ 2 + p ^ n)‖ / p ^ n)
      Filter.atTop (nhds 0) := by
  sorry

end TauCeti.FiniteSpectrum

namespace TauCeti.AlgebraicGeometry.WeilZeta

/-! ### WC.6 and WC.7: convention and equation examples on existing carriers -/

-- Every maximal cone of the specified nonprojective fan is regular.
-- Cone 123.
example : |(!![1, 0, 0; 0, 1, 0; 0, 0, 1] : Matrix (Fin 3) (Fin 3) ℤ).det| = 1 := by
  sorry

-- Cone 127.
example : |(!![1, 0, 0; 0, 1, 0; -1, 0, -1] : Matrix (Fin 3) (Fin 3) ℤ).det| = 1 := by
  sorry

-- Cone 136.
example : |(!![1, 0, 0; 0, 0, 1; 0, -1, -1] : Matrix (Fin 3) (Fin 3) ℤ).det| = 1 := by
  sorry

-- Cone 167.
example : |(!![1, 0, 0; 0, -1, -1; -1, 0, -1] : Matrix (Fin 3) (Fin 3) ℤ).det| = 1 := by
  sorry

-- Cone 235.
example : |(!![0, 1, 0; 0, 0, 1; -1, -1, 0] : Matrix (Fin 3) (Fin 3) ℤ).det| = 1 := by
  sorry

-- Cone 257.
example : |(!![0, 1, 0; -1, -1, 0; -1, 0, -1] : Matrix (Fin 3) (Fin 3) ℤ).det| = 1 := by
  sorry

-- Cone 356.
example : |(!![0, 0, 1; -1, -1, 0; 0, -1, -1] : Matrix (Fin 3) (Fin 3) ℤ).det| = 1 := by
  sorry

-- Cone 456.
example : |(!![-1, -1, -1; -1, -1, 0; 0, -1, -1] : Matrix (Fin 3) (Fin 3) ℤ).det| = 1 := by
  sorry

-- Cone 457.
example : |(!![-1, -1, -1; -1, -1, 0; -1, 0, -1] : Matrix (Fin 3) (Fin 3) ℤ).det| = 1 := by
  sorry

-- Cone 467.
example : |(!![-1, -1, -1; 0, -1, -1; -1, 0, -1] : Matrix (Fin 3) (Fin 3) ℤ).det| = 1 := by
  sorry

-- The three primitive relations obstruct an ample support function.
example :
    (![0, 1, 0] : Fin 3 → ℤ) + ![0, -1, -1] = ![1, 0, 0] + ![-1, 0, -1] ∧
    (![0, 0, 1] : Fin 3 → ℤ) + ![-1, 0, -1] = ![0, 1, 0] + ![-1, -1, 0] ∧
    (![1, 0, 0] : Fin 3 → ℤ) + ![-1, -1, 0] = ![0, 0, 1] + ![0, -1, -1] := by
  sorry

-- Empty cohomology: normalized factor is one.
example : (0 : Matrix (Fin 0) (Fin 0) ℚ).charpolyRev = 1 := by
  sorry

-- P^1 over F_4: the linear q-Frobenius on the Tate line is 4, not 2.
example : (Matrix.diagonal (fun _ : Fin 1 => (4 : ℚ))).charpolyRev =
    1 - C 4 * X := by
  sorry

-- A length-two Frobenius orbit has factor 1-T^2, not (1-T)^2.
example : (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℚ).charpolyRev =
    1 - X ^ 2 := by
  sorry

-- The rank-two unipotent Jordan block has the same factor as its semisimplification.
example : (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ).charpolyRev =
    (1 - X) ^ 2 := by
  sorry

-- The elliptic companion matrix tests det(1-TF), not det(T-F).
example (q a : ℚ) :
    (!![0, -q; 1, a] : Matrix (Fin 2) (Fin 2) ℚ).charpolyRev =
      1 - C a * X + C q * X ^ 2 := by
  sorry

-- Algebraic substitution in Z(P^2/F_2,T): the sign is negative.
-- Here t is the existing transcendental rational function, so no denominator vanishes.
example :
    let t : RatFunc ℚ := algebraMap ℚ[X] (RatFunc ℚ) X
    ((1 - (4 * t)⁻¹) * (1 - 2 * (4 * t)⁻¹) *
      (1 - 4 * (4 * t)⁻¹))⁻¹ =
        -8 * t ^ 3 * ((1 - t) * (1 - 2 * t) * (1 - 4 * t))⁻¹ := by
  sorry

-- Reciprocal genus-two numerator, q=2: chi=-2 needs integer powers.
-- The reader specifies the smooth projective model of y^2+y=x^5 over F_2.
-- Its supplier route uses AlgebraicCurves Layer 10 (Artin-Schreier),
-- Layer 7 (different/Hurwitz), and Layer 12 (actual projective model).
-- This algebraic test does not discharge that model, genus, or cohomology import.
example :
    let t : RatFunc ℚ := algebraMap ℚ[X] (RatFunc ℚ) X
    (1 + 4 * ((2 * t)⁻¹) ^ 4) /
        ((1 - (2 * t)⁻¹) * (1 - 2 * (2 * t)⁻¹)) =
      (2 : RatFunc ℚ)⁻¹ * t ^ (-2 : ℤ) *
        ((1 + 4 * t ^ 4) / ((1 - t) * (1 - 2 * t))) := by
  sorry

-- G_m: compact-support factorization, not the ordinary-cohomology quotient.
example :
    let t : RatFunc ℚ := algebraMap ℚ[X] (RatFunc ℚ) X
    (1 - t) / (1 - 2 * t) =
      (1 - 2 * t)⁻¹ / (1 - t)⁻¹ := by
  sorry

-- The genuine existing equation carrier for E/F_5 has nonzero discriminant.
example :
    (⟨0, 0, 0, -1, 0⟩ : WeierstrassCurve (ZMod 5)).Δ = 4 := by
  sorry

-- Its existing affine predicate has seven points; infinity makes eight.
example :
    let W : WeierstrassCurve (ZMod 5) := ⟨0, 0, 0, -1, 0⟩
    Nat.card {xy : ZMod 5 × ZMod 5 // W.toAffine.Equation xy.1 xy.2} = 7 := by
  sorry

-- The affine Artin-Schreier equation over F_2 has two points.
-- The unique point at infinity is a separate supplier theorem.
example :
    Fintype.card {xy : ZMod 2 × ZMod 2 // xy.2 ^ 2 + xy.2 = xy.1 ^ 5} = 2 := by
  sorry

-- Affine counts over the actual degree 2, 3 and 4 extensions; add infinity.
example :
    let K := FiniteField.Extension (ZMod 2) 2 2
    let N := Nat.card {xy : K × K // xy.2 ^ 2 + xy.2 = xy.1 ^ 5}
    N = 4 ∧ N + 1 = 5 := by
  sorry

example :
    let K := FiniteField.Extension (ZMod 2) 2 3
    let N := Nat.card {xy : K × K // xy.2 ^ 2 + xy.2 = xy.1 ^ 5}
    N = 8 ∧ N + 1 = 9 := by
  sorry

example :
    let K := FiniteField.Extension (ZMod 2) 2 4
    let N := Nat.card {xy : K × K // xy.2 ^ 2 + xy.2 = xy.1 ^ 5}
    N = 32 ∧ N + 1 = 33 := by
  sorry

-- A nonsplit quadric exchanges its rulings: eigenvalues 2,-2.
example : (!![0, 2; 2, 0] : Matrix (Fin 2) (Fin 2) ℚ).charpolyRev =
    1 - C 4 * X ^ 2 := by
  sorry

-- P^1 x P^1/F_2 has two middle classes of scalar 2, via tensor Kunneth.
example : (Matrix.diagonal (fun _ : Fin 2 => (2 : ℚ))).charpolyRev =
    (1 - C 2 * X) ^ 2 := by
  sorry

-- A positive Tate twist on a point has scalar 1/q, not q.
example : (Matrix.diagonal (fun _ : Fin 1 => ((2 : ℚ)⁻¹))).charpolyRev =
    1 - C ((2 : ℚ)⁻¹) * X := by
  sorry

-- The elliptic companion for E/F_5: trace -2, determinant 5.
example : (!![0, -5; 1, -2] : Matrix (Fin 2) (Fin 2) ℚ).charpolyRev =
    1 + C 2 * X + C 5 * X ^ 2 := by
  sorry

-- The same Frobenius squared has trace -6, giving 1+25-(-6)=32.
example : Matrix.trace ((!![0, -5; 1, -2] : Matrix (Fin 2) (Fin 2) ℚ) ^ 2) =
    (-6 : ℚ) := by
  sorry

-- Scalar middle Frobenius of the ten-class surface is tested separately
-- from the geometric invariant comparisons in WC.7.
example : (Matrix.diagonal (fun _ : Fin 10 => (2 : ℚ))).charpolyRev =
    (1 - C 2 * X) ^ 10 := by
  sorry

-- Constant rank-ten middle classes give 25 and 57 over F_2 and F_4.
example : (1 : ℤ) + 10 * 2 + 2 ^ 2 = 25 := by
  sorry
example : (1 : ℤ) + 10 * 2 ^ 2 + 2 ^ 4 = 57 := by
  sorry

end TauCeti.AlgebraicGeometry.WeilZeta

/-
Geometric and arithmetic targets whose full statements are in README.md:
TauCeti.AlgebraicGeometry.WeilZeta.constant_picard_iff_maximal_count_rational_surface
TauCeti.AlgebraicGeometry.WeilZeta.count_enriques_or_rational_genus_one
TauCeti.AlgebraicGeometry.WeilZeta.count_extension_of_surjective_base_cycles
TauCeti.AlgebraicGeometry.WeilZeta.count_surface_of_constant_num
TauCeti.AlgebraicGeometry.WeilZeta.degree_factor_finite_etale_orbits
TauCeti.AlgebraicGeometry.WeilZeta.degree_factors_product_of_smooth_proper
TauCeti.AlgebraicGeometry.WeilZeta.degree_factors_projective_space
TauCeti.AlgebraicGeometry.WeilZeta.degree_one_factor_curve
TauCeti.AlgebraicGeometry.WeilZeta.exists_unique_integral_degree_factors_of_smooth_proper
TauCeti.AlgebraicGeometry.WeilZeta.frobenius_scalar_of_surjective_base_cycle_map
TauCeti.AlgebraicGeometry.WeilZeta.functional_equation_of_smooth_proper
TauCeti.AlgebraicGeometry.WeilZeta.functional_equation_projective_plane
TauCeti.AlgebraicGeometry.WeilZeta.l_function_multiplicative_group
TauCeti.AlgebraicGeometry.WeilZeta.pure_cohomology_of_smooth_proper_dm_stack
TauCeti.AlgebraicGeometry.WeilZeta.reciprocal_divisor_weight_le
TauCeti.AlgebraicGeometry.WeilZeta.weil_conclusions_of_smooth_proper
TauCeti.AlgebraicGeometry.WeilZeta.weil_factors_of_dualizing_constant
TauCeti.AlgebraicGeometry.WeilZeta.zeta_artin_schreier_genus_two
TauCeti.AlgebraicGeometry.WeilZeta.zeta_of_surjective_base_cycles
TauCeti.AlgebraicGeometry.WeilZeta.zeta_weierstrass_five
TauCeti.PointCounting.approximate_counts_tate_semisimplification
TauCeti.PointCounting.betti_comparison_supplied_family
TauCeti.PointCounting.closed_point_degree_comparison
TauCeti.PointCounting.cohomological_zeta_comparison
TauCeti.PointCounting.complete_intersection_point_count
TauCeti.PointCounting.component_and_dimension_zero_counts
TauCeti.PointCounting.curve_elliptic_bound_comparison
TauCeti.PointCounting.curve_rh_from_surface_bound
TauCeti.PointCounting.curve_zeta_numerator_without_rh
TauCeti.PointCounting.equivariant_count_character_lattice
TauCeti.PointCounting.equivariant_polynomial_duality
TauCeti.PointCounting.equivariant_polynomial_point_counts
TauCeti.PointCounting.finite_extension_point_tower_comparison
TauCeti.PointCounting.geometric_frobenius_realization_comparison
TauCeti.PointCounting.hasse_weil_sieve
TauCeti.PointCounting.integral_projective_weil_factors
TauCeti.PointCounting.inverse_zeta_configuration_formula
TauCeti.PointCounting.inverse_zeta_even_termination
TauCeti.PointCounting.local_polynomial_count_cutoff
TauCeti.PointCounting.normalized_integral_zeta_presentation
TauCeti.PointCounting.polynomial_counts_over_z_tate_cohomology
TauCeti.PointCounting.stack_count_comparison
TauCeti.PointCounting.surface_all_extension_bound_comparison
TauCeti.PointCounting.twisted_frobenius_point_comparison
TauCeti.PointCounting.zeta_euler_comparison

Additional README constructions on the supplied geometric carriers:
stackPointGroupoid, stackCompactSupportCohomology, stackCompactSupportTrace,
stackPoincarePairing, arithmeticZetaEulerProduct, arithmeticZeta_openClosed,
arithmeticZeta_absoluteConvergence, arithmeticZeta_finiteFieldComparison,
tateExtension_unramified, numericalPicardLocalSystem,
numericalPicard_cycleInjection, numericalPicard_cycleIso_of_rank,
numericalPicard_baseDivisorDescent, numericalPicard_baseCycleSurjective,
IsEnriques, enriques_characterization, enriques_baseChange,
enriques_etaleInvariants,
genusOneFibration_baseChange, genusOneFibration_modelComparison,
rationalGenusOne_etaleInvariants, rationalSurface_picardEtaleComparison,
nonprojectiveToricModel, nonprojectiveToricThreefold,
nonprojectiveToric_smoothProper, nonprojectiveToric_notProjective,
nonprojectiveToric_chowPresentation, nonprojectiveToric_etaleComparison.
-/

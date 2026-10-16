import Mathlib

/-!
# Weights in étale cohomology: representative target signatures

This file records suggested forms and is not exhaustive. README.md is definitive.
The statements give forms statable against the pinned APIs for arithmetic cohomology
and eigenform applications, with geometric Frobenius and contragredient duals.

The representation, polynomial and matrix interfaces below use Mathlib directly.
Inertia groups, Frobenius lifts and residue cardinalities are supplied parameters;
they do not construct continuous Galois representations or arithmetic places.
The arithmetic and geometric comparisons require the supplier interfaces stated
in README.md. Full signatures whose carriers are unavailable are listed at the end;
no arbitrary proposition or mock cohomology carrier replaces them.
The declarations use the pinned Mathlib carriers and light definitions with real bodies.
-/
open Polynomial

namespace TauCeti.Weights

/-! ## Layer R34.1: exceptional-set weights and numerical checks -/

namespace GaloisRep
section Predicates
variable {E G V P : Type*} [Field E]
  [Group G] [AddCommGroup V] [Module E V] [FiniteDimensional E V]

/-- All-embeddings purity on a splitting coefficient field admitting a complex embedding.
The arithmetic adapter supplies continuity and actual local Galois data. -/
def IsPureOutside [CharZero E] [Algebra ℚ E] [IsAlgClosed E]
    [Nonempty (E →+* ℂ)] (ρ : Representation E G V) (I : P → Subgroup G)
    (F : P → G) (q : P → ℕ) (T : Set P) (w : ℤ) : Prop :=
  ∀ v ∉ T, (∀ g ∈ I v, ρ g = 1) ∧
    ∀ α : E, (ρ (F v)).charpoly.IsRoot α →
      IsIntegral ℚ α ∧ ∀ ι : E →+* ℂ,
        ‖ι α‖ = Real.rpow (q v : ℝ) ((w : ℝ) / 2)

/-- Rational integral coefficients are stronger than algebraic-integral roots. -/
def HasIntegralFrobOutside [CharZero E] [Algebra ℚ E] (ρ : Representation E G V) (I : P → Subgroup G)
    (F : P → G) (T : Set P) : Prop :=
  ∀ v ∉ T, (∀ g ∈ I v, ρ g = 1) ∧
    ∃ Q : ℤ[X], Q.map (Int.castRingHom E) = (ρ (F v)).charpoly

/-- The chosen-embedding predicate deliberately makes no algebraicity assertion. -/
def IsIotaPureOutside [CharZero E] [Algebra ℚ E] [IsAlgClosed E] (ρ : Representation E G V) (I : P → Subgroup G)
    (F : P → G) (q : P → ℕ) (T : Set P) (ι : E →+* ℂ) (w : ℝ) : Prop :=
  ∀ v ∉ T, (∀ g ∈ I v, ρ g = 1) ∧
    ∀ α : E, (ρ (F v)).charpoly.IsRoot α →
      ‖ι α‖ = Real.rpow (q v : ℝ) (w / 2)

/-- Positive rank and one nonexceptional place of size greater than one determine the weight. -/
theorem IsPureOutside.weight_unique [CharZero E] [Algebra ℚ E] [IsAlgClosed E]
    [Nonempty (E →+* ℂ)] (ρ : Representation E G V) (I : P → Subgroup G)
    (F : P → G) (q : P → ℕ) (T : Set P) (w w' : ℤ)
    (hv : 0 < Module.finrank E V) (v : P) (hout : v ∉ T) (hq : 1 < q v)
    (ι : E →+* ℂ) (h : IsPureOutside ρ I F q T w)
    (h' : IsPureOutside ρ I F q T w') : w = w' := by
  sorry
end Predicates
end GaloisRep
open GaloisRep

/-- The scalar representation on a complex line used in the convention checks. -/
noncomputable abbrev scalarRep : Representation ℂ ℂˣ ℂ :=
  Representation.ofDistribMulAction ℂ ℂˣ ℂ
/-- The nonzero scalar three, viewed as a complex unit. -/
noncomputable abbrev three : ℂˣ := Units.mk0 (3 : ℂ) (by norm_num)
/-- The nonzero scalar two, viewed as a complex unit. -/
noncomputable abbrev two : ℂˣ := Units.mk0 (2 : ℂ) (by norm_num)

-- Unit test: TauCeti.Weights.frobCharpoly_cyclotomic
-- Frobenius on Q_l(1) is q⁻¹ for the geometric convention.
example : (scalarRep three⁻¹).charpoly = X - C ((3 : ℂ)⁻¹) := by
  sorry

-- Unit test: TauCeti.Weights.frobCharpoly_trivial
example (d : ℕ) :
    ((Representation.trivial ℂ ℂˣ (Fin d → ℂ)) three).charpoly = (X - 1) ^ d := by
  sorry

-- Unit test: TauCeti.Weights.not_unramified_scalar_inertia
-- A nontrivial inertia action is rejected before any choice of Frobenius lift.
example : ¬ (∀ g ∈ (⊤ : Subgroup ℂˣ), scalarRep g = 1) ∧
    (scalarRep (two * three)).charpoly ≠ (scalarRep three).charpoly := by
  sorry

-- Unit test: TauCeti.Weights.frobCharpoly_arith_elliptic
-- The inverse companion matrix has roots inverse to T² - aT + q.
example (a q : ℚ) (hq : q ≠ 0) :
    (!![a / q, 1; -1 / q, 0]).charpoly = X ^ 2 - C (a / q) * X + C (1 / q) := by
  sorry

-- Unit test: TauCeti.Weights.isPureOutside_tate
example (n : ℤ) :
    IsPureOutside (scalarRep.comp (zpowGroupHom n)) (fun _ : Unit => ⊥)
      (fun _ => three⁻¹) (fun _ => 3) ∅ (-2 * n) := by
  sorry

-- Unit test: TauCeti.Weights.isPureOutside_trivial
example :
    IsPureOutside (Representation.trivial ℂ ℂˣ ℂ) (fun _ : Unit => ⊥)
      (fun _ => three) (fun _ => 3) ∅ 0 ∧
    HasIntegralFrobOutside (Representation.trivial ℂ ℂˣ ℂ) (fun _ : Unit => ⊥)
      (fun _ => three) ∅ := by
  sorry

-- Unit test: TauCeti.Weights.not_integral_tate_one
example : ¬ HasIntegralFrobOutside scalarRep (fun _ : Unit => ⊥)
    (fun _ => three⁻¹) ∅ := by
  sorry

-- Unit test: TauCeti.Weights.not_isPureOutside_sum
example : ¬ ∃ w : ℤ,
    IsPureOutside (Representation.prod (Representation.trivial ℂ ℂˣ ℂ) scalarRep)
      (fun _ : Unit => ⊥) (fun _ => three⁻¹) (fun _ => 3) ∅ w := by
  sorry

-- Unit test: TauCeti.Weights.isPureOutside_zero
example (w : ℤ) :
    IsPureOutside (Representation.trivial ℂ ℂˣ (Fin 0 → ℂ)) (fun _ : Unit => ⊥)
      (fun _ => three) (fun _ => 3) ∅ w ∧
    ((Representation.trivial ℂ ℂˣ (Fin 0 → ℂ)) three).charpoly = 1 ∧
    HasIntegralFrobOutside (Representation.trivial ℂ ℂˣ (Fin 0 → ℂ))
      (fun _ : Unit => ⊥) (fun _ => three) ∅ := by
  sorry

/-- A nonclosed coefficient field can hide every root of a nonconstant polynomial. -/
example : ¬ ∃ x : ℝ, (X ^ 2 + 1 : ℝ[X]).IsRoot x := by
  sorry

/-- The trivial line has chosen-embedding weight zero. -/
example : IsIotaPureOutside (Representation.trivial ℂ ℂˣ ℂ)
    (fun _ : Unit => ⊥) (fun _ => three) (fun _ => 3) ∅ (RingHom.id ℂ) 0 := by
  sorry

/-- The geometric Tate line has chosen-embedding weight minus two under every embedding. -/
example (ι : ℂ →+* ℂ) :
    IsIotaPureOutside scalarRep (fun _ : Unit => ⊥)
      (fun _ => three⁻¹) (fun _ => 3) ∅ ι (-2) := by
  sorry

/-- The rank-zero representation satisfies chosen-embedding purity at every real weight. -/
example (w : ℝ) (ι : ℂ →+* ℂ) :
    IsIotaPureOutside (Representation.trivial ℂ ℂˣ (Fin 0 → ℂ))
      (fun _ : Unit => ⊥) (fun _ => three) (fun _ => 3) ∅ ι w := by
  sorry

/-- A scalar of modulus three does not have chosen-embedding weight zero. -/
example : ¬ IsIotaPureOutside scalarRep (fun _ : Unit => ⊥)
    (fun _ => three) (fun _ => 3) ∅ (RingHom.id ℂ) 0 := by
  sorry

/-- Duality negates geometric weight, retaining the unramified condition. -/
theorem pureOutside_dual {G V P : Type*} [Group G] [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (ρ : Representation ℂ G V) (I : P → Subgroup G)
    (F : P → G) (q : P → ℕ) (T : Set P) (w : ℤ)
    (_hq : ∀ v ∉ T, 1 < q v) (h : IsPureOutside ρ I F q T w) :
    IsPureOutside (Representation.dual ρ) I F q T (-w) := by
  sorry

-- Rational-integrality is not stable under an arbitrary invariant summand.
/-- An invariant line of an integer-polynomial operator need not have a rational polynomial. -/
theorem integer_charpoly_factor_nonexample :
    ∃ α : ℂ, α ^ 2 = 2 ∧
      (X - C α) * (X + C α) = (X ^ 2 - C 2 : ℂ[X]) ∧
      ¬ ∃ Q : ℤ[X], Q.map (Int.castRingHom ℂ) = X - C α := by
  sorry

-- At an inert quadratic place, induction of the trivial character has roots ±1.
/-- The inert quadratic permutation block has characteristic roots one and minus one. -/
theorem charpoly_induced_inert_trivial :
    (!![(0 : ℚ), 1; 1, 0]).charpoly = X ^ 2 - 1 := by
  sorry

/-- Complex eigenvalues need not be algebraic over the rationals. -/
theorem transcendental_not_pure : ∃ α : ℂ, ¬ IsIntegral ℚ α := by
  sorry

-- The same irreducible rational polynomial has unit-circle and non-unit-circle
-- conjugates. Its algebraic-unit root gives the finite-field character in R34.1;
-- this numerical core does not assert a globally pure number-field character.
/-- An irreducible rational polynomial has both unit-circle and larger-modulus conjugates. -/
theorem chosen_embedding_integer_weight_nonexample :
    Irreducible (X ^ 4 - X ^ 3 - X ^ 2 - X + 1 : ℚ[X]) ∧
      ∃ α β : ℂ, (X ^ 4 - X ^ 3 - X ^ 2 - X + 1 : ℂ[X]).IsRoot α ∧
        (X ^ 4 - X ^ 3 - X ^ 2 - X + 1 : ℂ[X]).IsRoot β ∧
          ‖α‖ = 1 ∧ 1 < ‖β‖ := by
  sorry

/-- A quartic unit-circle root gives chosen-embedding purity but fails all-embeddings purity. -/
example : ∃ α : ℂˣ,
    (X ^ 4 - X ^ 3 - X ^ 2 - X + 1 : ℂ[X]).IsRoot (α : ℂ) ∧
    IsIotaPureOutside scalarRep (fun _ : Unit => ⊥)
      (fun _ => α) (fun _ => 3) ∅ (RingHom.id ℂ) 0 ∧
    ¬ IsPureOutside scalarRep (fun _ : Unit => ⊥)
      (fun _ => α) (fun _ => 3) ∅ 0 := by
  sorry

/-- All-embeddings purity specializes to any chosen complex embedding. -/
theorem pureOutside_implies_iota {G V P : Type*} [Group G] [AddCommGroup V]
    [Module ℂ V] [FiniteDimensional ℂ V] (ρ : Representation ℂ G V)
    (I : P → Subgroup G) (F : P → G) (q : P → ℕ) (T : Set P) (w : ℤ)
    (ι : ℂ →+* ℂ) (h : IsPureOutside ρ I F q T w) :
    IsIotaPureOutside ρ I F q T ι (w : ℝ) := by
  sorry

/-! ## Layer R34.2: Tate/H¹ variance and good-reduction traces -/

/-- The geometric action on the dual is the transpose of the arithmetic action. -/
theorem tate_h1_inverse_dual {G V : Type*} [Group G] [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (ρ : Representation ℂ G V) (F : G) :
    ((Representation.dual ρ) F⁻¹).charpoly = (ρ F).charpoly := by
  sorry

/-- The geometric Tate constant coefficient at positive dimension is not an integer. -/
theorem positive_dimension_tate_constant (q g : ℕ) (hq : 1 < q) (hg : 0 < g) :
    ¬ ∃ z : ℤ, (z : ℚ) = (q : ℚ) ^ (-(g : ℤ)) := by
  sorry

/-- The elliptic curve y²=x³−x over F₅ has seven affine points and one point at infinity. -/
theorem card_points_y2_eq_x3_sub_x_F5 :
    (Finset.univ.filter (fun p : ZMod 5 × ZMod 5 => p.2 ^ 2 = p.1 ^ 3 - p.1)).card + 1 = 8 := by
  decide

/-- Trace squared minus twice the determinant gives the trace of the second power. -/
theorem elliptic_second_power_trace (α β a q : ℂ) (ht : α + β = a)
    (hd : α * β = q) : α ^ 2 + β ^ 2 = a ^ 2 - 2 * q := by
  sorry

example : (25 : ℤ) + 1 - ((-2) ^ 2 - 2 * 5) = 32 := by
  norm_num

/-! ## Layer R34.3: geometric monodromy normalization -/

/-- A nodal rank-two monodromy operator scales by q⁻¹ under geometric Frobenius. -/
theorem nodal_monodromy_scaling (q : ℚ) (hq : q ≠ 0) :
    let F : Matrix (Fin 2) (Fin 2) ℚ := !![1, 0; 0, q]
    let Finv : Matrix (Fin 2) (Fin 2) ℚ := !![1, 0; 0, q⁻¹]
    let N : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 0, 0]
    F * N * Finv = q⁻¹ • N ∧ N * N = 0 := by
  sorry

/-! ## Layer R34.5: degree and Tate-twist checks -/

/-- Symmetric degree k−2 and curve degree one give weight k−1. -/
theorem parabolic_degree_weight (k : ℤ) : (k - 2) + 1 = k - 1 := by
  sorry

/-- The arithmetic Lefschetz twist makes the source and target weights equal. -/
theorem hard_lefschetz_target_weight (d a : ℤ) : d + a - 2 * a = d - a := by
  sorry

/-- The Hilbert projected degree and auxiliary Tate twist give weight w−1. -/
example (g w : ℤ) :
    (2 * g - 1) * (w - 2) + 1 - 2 * ((g - 1) * (w - 2)) = w - 1 := by
  ring

/-- At g=w=2 the Hilbert projected degree is one and the auxiliary twist is zero. -/
example : (2 * 2 - 1) * (2 - 2) + 1 - 2 * ((2 - 1) * (2 - 2)) = (1 : ℤ) := by
  norm_num

/-- Classical weight twelve occurs in total degree eleven with zero twist. -/
example : (12 - 2 : ℤ) + 1 = 11 := by
  norm_num

/-- Elliptic inversion projects onto the two degree-one directions. -/
example :
    let inv : Matrix (Fin 4) (Fin 4) ℚ := Matrix.diagonal ![1, -1, -1, 1]
    let p := (1 / 2 : ℚ) • (1 - inv)
    p * p = p ∧ p = Matrix.diagonal ![0, 1, 1, 0] ∧ p.rank = 2 := by
  sorry

/-- The sign-isotypic projector for graded interchange selects symmetric rank three. -/
example :
    let s : Matrix (Fin 4) (Fin 4) ℚ :=
      !![-1, 0, 0, 0; 0, 0, -1, 0; 0, -1, 0, 0; 0, 0, 0, -1]
    let p := (1 / 2 : ℚ) • (1 - s)
    p * p = p ∧ p.rank = 3 := by
  sorry

/-! ## Layer R34.6: trace bounds and the local twist -/

/-- Two roots of the same modulus give the rank-two Ramanujan trace bound. -/
theorem ramanujan_trace_bound (α β : ℂ) (R : ℝ) (hα : ‖α‖ = R) (hβ : ‖β‖ = R) :
    ‖α + β‖ ≤ 2 * R := by
  sorry

/-- Equal root moduli do not determine a characteristic polynomial. -/
theorem equal_root_norms_not_same_polynomial :
    ‖(1 : ℂ)‖ = ‖(-1 : ℂ)‖ ∧ (X - 1 : ℂ[X]) ≠ X + 1 := by
  sorry

/-- A Tate twist lowers the upper rank-two monodromy weight to the lower weight. -/
theorem local_monodromy_twist_weight (w : ℤ) : (w - 1 + 1) - 2 = w - 2 := by
  sorry

/-! README targets over arithmetic and geometric carriers:
R34.1/purity-under-restriction-and-induction: continuous Galois induction and local places.
R34.1/purity-under-linear-algebra-operations: full arithmetic subquotient/tensor/Tate interfaces.
R34.1/frobenius-eigenvalues-need-not-be-algebraic: continuous character of Gal(F_qbar/F_q).
R34.1/representation-sheaf-weight-comparison: actual lisse sheaf and π₁ correspondence.
R34.1/arithmetic-complex-weight-normalization: smooth finite-field scheme, ℓ invertible, lisse
cohomology of a bounded constructible adic complex and Verdier duality.
R34.2/frobenius-on-tate-modules-and-first-cohomology: actual Tate module and étale H¹ duality.
R34.2/purity-of-tate-modules-with-good-reduction: smooth proper specialization and exterior powers.
R34.2/good-reduction-point-counts-and-traces: Frobenius on the reduction of an abelian variety.
R34.2/curve-traces-over-all-residue-extensions: unpointed curve/Jacobian H¹ comparison,
translation invariance and Frobenius-equivariant cohomological trace.
R34.3/proper-trait-specialization-comparison: proper trait, finite-level nearby cycles and R lim.
R34.3/nodal-modular-curve-comparison: named integral curve, normalization and dual graph.
R34.3/arithmetic-picard-lefschetz-normalization: quadratic degeneration and tame inertia.
R34.3/saito-crystalline-weight-spectral-sequence: filtered log-crystalline complex, stratum maps and N.
R34.3/saito-stratum-correspondence-trace: crystalline cycle classes, duality and Weil-twisted traces.
R34.3/saito-semistable-comparison-model: Saito's model, projector and log-crystalline comparison.
R34.4/finite-field-pencil-descent: supplied finite-field pencil/incidence descent on the chosen axis.
R34.4/vanishing-quotient-parity-comparison: supplied odd-degree arithmetic radical quotient and
Tate pairing; comparison with the even-degree symmetric pairing.
R34.4/original-coefficient-monodromy-hypotheses: original Q_l geometric monodromy and local factors.
R34.5/parabolic-cohomology-weight-comparison: actual H_c¹→H¹ image of Sym^r R¹.
R34.5/kuga-sato-projector-weight-comparison: algebraic correspondence and étale comparison.
R34.5/weight-two-jacobian-weight-comparison: actual modular abelian quotient and coefficient action.
R34.5/arithmetic-hard-lefschetz-comparison: smooth projective finite-field scheme, ℓ invertible,
ample class and Frobenius-equivariant cup product.
R34.6/eigenform-purity-and-ramanujan-bound: existing newform eigensummand and Hecke polynomial.
R34.6/fixed-eigenform-good-prime-compatibility: common coefficient field and actual λ-realizations.
R34.6/arithmetic-realization-transport: actual comparison morphisms and commuting correspondences.
R34.6/hilbert-local-monodromy-weight-export: local WD carriers and Saito's coefficient conventions.
R34.6/common-good-prime-polynomials: HasCommonGoodPrimePolynomials on an arithmetic family.
R34.1/predicate-api: isPureOutside_iff, hasIntegralFrobOutside_iff,
isIotaPureOutside_iff, IsPureOutside.mono, HasIntegralFrobOutside.mono,
IsIotaPureOutside.mono and IsPureOutside.iota have their specifications in README.md.
See README.md for the required supplier interfaces and arithmetic hypotheses. -/

end TauCeti.Weights

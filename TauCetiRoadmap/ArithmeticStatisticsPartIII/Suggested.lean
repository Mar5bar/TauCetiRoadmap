import Mathlib

/-!
# Arithmetic statistics, Part III: representative target signatures

The accompanying README is the full specification, with source locators and exact
supplier contracts. This file gives suggested forms, not an exhaustive checklist: light definitions
and selected milestones on the pinned carriers. Counts retain the specified cutoffs and denominators; orbit,
moduli, covering and arithmetic probability constructions remain README targets.
-/

noncomputable section
open scoped BigOperators Topology
open Polynomial Filter

namespace TauCetiRoadmap.ArithmeticStatisticsPartIII

/-! ## Layer 2: Uniform orbit counts and sieves -/

namespace Counting
/-- The strict monic coefficient box uses descending coefficients and their degree weights. -/
def monicWeightedBox (n : ℕ) (X : ℝ) : Set ℤ[X] :=
  {f | f.Monic ∧ f.natDegree = n ∧
    ∀ i : Fin n, |(f.coeff (n - 1 - i.val) : ℝ)| < X ^ (i.val + 1)}

/-- Square-divisor tails exclude the singular discriminant-zero locus. -/
def squareDivisorTail {A : Type*} (Delta : A → ℤ) (H : A → ℝ)
    (M : ℕ) (X : ℝ) : Set A :=
  {a | H a < X ∧ Delta a ≠ 0 ∧
    ∃ m : ℕ, M < m ∧ 0 < m ∧ Squarefree m ∧ (m : ℤ) ^ 2 ∣ Delta a}

/-- Count the contributing squarefree moduli; zero discriminant has assigned count zero. -/
def squareDivisorMultiplicity {A : Type*} (Delta : A → ℤ)
    (M : ℕ) (a : A) : ℕ := by
  classical
  exact ((Delta a).natAbs.divisors.filter fun m =>
    M < m ∧ Squarefree m ∧ (m : ℤ) ^ 2 ∣ Delta a).card

/-! ### Milestones on the pinned carriers -/

/-- The Monic summed tail target bounds the full squarefree divisor multiplicity,
with the singular discriminant assigned zero multiplicity. -/
theorem monic_summed_tail (n : ℕ) (hn : 2 ≤ n) (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ X M : ℝ, 2 ≤ X → 1 ≤ M →
      (∑' f : ↥(monicWeightedBox n X),
        (squareDivisorMultiplicity Polynomial.discr ⌊M⌋₊ f.val : ℝ)) ≤
      C * (X ^ ((n * (n + 1) / 2 : ℕ) + ε) / Real.sqrt M +
        X ^ ((n * (n + 1) / 2 : ℕ) - (1 / 5 : ℝ) + ε)) := by sorry

/-- The Chebyshev bounds for prime sums target gives an all-range prime-counting bound. -/
theorem prime_count_bound :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ x : ℝ, 2 ≤ x →
      (Nat.primeCounting ⌊x⌋₊ : ℝ) ≤ C * x / Real.log x := by sorry

/-- The Chebyshev bounds for prime sums target gives the convergent weighted prime tail. -/
theorem prime_tail_bound (s : ℝ) (hs : 1 < s) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ N : ℝ, 2 ≤ N →
      Summable (fun p : Nat.Primes => if N < (p.val : ℝ) then (p.val : ℝ) ^ (-s) else 0) ∧
      (∑' p : Nat.Primes, if N < (p.val : ℝ) then (p.val : ℝ) ^ (-s) else 0) ≤
        C * N ^ (1 - s) / Real.log N := by sorry

/-- The Chebyshev bounds for prime sums target bounds truncated lattice sieve weights. -/
theorem prime_sieve_sum_bound (k : ℕ) (hk : 2 ≤ k) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (M r : ℝ) (n : ℕ), 2 ≤ M → M ≤ r →
      (∑ p ∈ (Nat.primesLE ⌊r⌋₊).filter (fun p : ℕ => M < (p : ℝ)),
        r ^ n / (p : ℝ) ^ k) ≤ C * r ^ n / (M ^ (k - 1) * Real.log M) := by sorry

/-- The Hyperbolic area of the modular fundamental domain target fixes its invariant volume. -/
theorem modular_fd_volume :
    MeasureTheory.volume ModularGroup.fd = ENNReal.ofReal (Real.pi / 3) := by sorry

/-- The strict monic boxes used in the Monic summed tail target are finite. -/
theorem monicWeightedBox_finite (n : ℕ) (X : ℝ) :
    (monicWeightedBox n X).Finite := by sorry

/-! ### Basic interfaces -/

/-- A square-divisor tail is detected by positive multiplicity on the nonsingular height box. -/
theorem tail_iff_multiplicity_pos {A : Type*} (Delta : A → ℤ) (H : A → ℝ)
    (M : ℕ) (X : ℝ) (a : A) (hH : H a < X) (hDelta : Delta a ≠ 0) :
    a ∈ squareDivisorTail Delta H M X ↔ 0 < squareDivisorMultiplicity Delta M a := by sorry

/-- The Square divisor tail target decreases both its set and its multiplicity with the cutoff. -/
theorem tail_antitone {A : Type*} (Delta : A → ℤ) (H : A → ℝ)
    (M M' : ℕ) (hM : M ≤ M') (X : ℝ) :
    squareDivisorTail Delta H M' X ⊆ squareDivisorTail Delta H M X ∧
      ∀ a, squareDivisorMultiplicity Delta M' a ≤ squareDivisorMultiplicity Delta M a := by sorry

example {A : Type*} (H : A → ℝ) (M : ℕ) (X : ℝ) :
    squareDivisorTail (fun _ : A => 0) H M X = ∅ ∧
      ∀ a, squareDivisorMultiplicity (fun _ : A => 0) M a = 0 := by
  constructor
  · ext a
    simp [squareDivisorTail]
  · intro a
    simp [squareDivisorMultiplicity]

/-- The cubic coefficient invariant I on the univariate monic cubic carrier. -/
def monicCubicI (g : ℤ[X]) : ℤ := g.coeff 2 ^ 2 - 3 * g.coeff 1

/-- The cubic coefficient invariant J uses the signed coefficient formula. -/
def monicCubicJ (g : ℤ[X]) : ℤ :=
  -2 * g.coeff 2 ^ 3 + 9 * g.coeff 2 * g.coeff 1 - 27 * g.coeff 0

/-- The invariant height of a monic cubic uses the real quotient J squared over four. -/
def monicCubicHeight (g : ℤ[X]) : ℝ :=
  max (|(monicCubicI g : ℝ)| ^ 3) ((monicCubicJ g : ℝ) ^ 2 / 4)

/-- Integral translations preserve both monic cubic invariants and their height. -/
theorem monicCubic_translation (g : ℤ[X]) (hg : g.Monic) (hd : g.natDegree = 3)
    (k : ℤ) :
    monicCubicI (g.comp (X + C k)) = monicCubicI g ∧
    monicCubicJ (g.comp (X + C k)) = monicCubicJ g ∧
    monicCubicHeight (g.comp (X + C k)) = monicCubicHeight g := by sorry

/-- The rational-root estimate uses the actual strict weighted coefficient box. -/
theorem monic_rational_root_bound (n : ℕ) (hn : 2 ≤ n) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ X : ℝ, 2 ≤ X →
      ({a : Fin n → ℤ | (∀ i, |(a i : ℝ)| < X ^ (i.val + 1)) ∧ ∃ t : ℚ,
        (Polynomial.X ^ n + ∑ i : Fin n,
          Polynomial.C (a i : ℚ) * Polynomial.X ^ (n - 1 - i.val)).eval t = 0}.ncard : ℝ) ≤
      C * X ^ (n * (n + 1) / 2 - n + 1) * Real.log X := by sorry

/-- Sum over the full transporter of the invariant section, retaining every stabilizer element. -/
def sectionKernel {G U I : Type*} [Group G] [MulAction G U]
    (inv : U → I) (kappa : I → U) (Theta : G → ℝ) (phi : I → ℝ) (u : U) : ℝ := by
  classical
  exact ∑' g : G, if g • kappa (inv u) = u then Theta g * phi (inv u) else 0

/-- Finite transporters retain stabilizer multiplicities when unfolding the kernel. -/
theorem sectionKernel_finite_fibre {G U I : Type*} [Group G] [MulAction G U]
    (inv : U → I) (kappa : I → U) (Theta : G → ℝ) (phi : I → ℝ) (u : U)
    (hf : {g : G | g • kappa (inv u) = u}.Finite) :
    sectionKernel inv kappa Theta phi u =
      ∑ g ∈ hf.toFinset, Theta g * phi (inv u) := by sorry

/-- The Section kernel target vanishes when the invariant weight vanishes. -/
theorem sectionKernel_zero {G U I : Type*} [Group G] [MulAction G U]
    (inv : U → I) (kappa : I → U) (Theta : G → ℝ) (u : U) :
    sectionKernel inv kappa Theta (fun _ => 0) u = 0 := by sorry

/-- The Section kernel target gives one summand when its transporter is a singleton. -/
theorem sectionKernel_unique {G U I : Type*} [Group G] [MulAction G U]
    (inv : U → I) (kappa : I → U) (Theta : G → ℝ) (phi : I → ℝ)
    (u : U) (g : G) (hg : ∀ h : G, h • kappa (inv u) = u ↔ h = g) :
    sectionKernel inv kappa Theta phi u = Theta g * phi (inv u) := by sorry

example {G : Type*} [Group G] [Fintype G] [MulAction G Unit] (w c : ℝ) :
    sectionKernel (fun _ : Unit => ()) (fun _ : Unit => ())
      (fun _ : G => w) (fun _ => c) () = (Fintype.card G : ℝ) * w * c := by
  classical
  have h (g : G) : g • () = () := Subsingleton.elim _ _
  simp [sectionKernel, h, tsum_fintype, mul_assoc]

/-- The cutoff dictated by the actual tail exponents, without assigning a numerical endpoint. -/
def sieveCutoff (δ η ξ : ℝ) : ℝ := max η ((η + ξ) / δ)

/-- Both strict cutoff inequalities are required for the even-degree fixed-modulus sieve. -/
def EvenTailParameters (n : ℕ) (δ η ξ : ℝ) : Prop :=
  4 ≤ n ∧ Even n ∧ 0 < δ ∧ 0 < η ∧ 0 ≤ ξ ∧
    sieveCutoff δ η ξ < 1 ∧ (2 * (n : ℝ) + 1) * sieveCutoff δ η ξ < n + 1

/-- Slack in all three sieve terms supplies a positive saving at fixed modulus. -/
theorem even_sieve_positive_saving (n : ℕ) (δ η ξ : ℝ)
    (h : EvenTailParameters n δ η ξ) :
    0 < min η (min (1 - sieveCutoff δ η ξ)
      ((n : ℝ) + 1 - (2 * n + 1) * sieveCutoff δ η ξ)) := by sorry

/-- The Quartic maximal-order suborders target includes split quartic suborders
cut out by a projective residue direction, of index p cubed. -/
theorem split_quartic_suborder (p : ℕ) (hp : p.Prime) (a b : ℤ)
    (hab : ¬ ((p : ℤ) ∣ a ∧ (p : ℤ) ∣ b)) :
    ∃ S : Subring (Fin 4 → ℤ),
      (∀ v, v ∈ S ↔ (p : ℤ) ∣ v 0 - v 2 ∧ (p : ℤ) ∣ v 1 - v 2 ∧
        (p : ℤ)^2 ∣ a * (v 0 - v 2) + b * (v 1 - v 2)) ∧
      S.toAddSubgroup.index = p^3 := by sorry

/-- The Quartic maximal-order suborders target has at least p plus one split
suborders of index p cubed, so their count has genuine prime dependence. -/
theorem split_quartic_suborders_lower_bound (p : ℕ) (hp : p.Prime) :
    {S : Subring (Fin 4 → ℤ) | S.toAddSubgroup.index = p^3}.Finite ∧
      p + 1 ≤ {S : Subring (Fin 4 → ℤ) | S.toAddSubgroup.index = p^3}.ncard := by sorry

end Counting

/-!
The README also specifies the arithmetic carriers and their APIs: real quartic
root types and fundamental sets; real cubic sign regions; Gauss/Iwasawa multiset regions and their orbit
multiplicities; quarticAveragedCount, quarticAveragedCount_weighted,
quarticRegionB and cubicAveragedCount; strong and weak discriminant divisibility;
the weighted extension of ArithmeticStatisticsPartI’s Kappa acceptable specifications,
Counting.IsKappaAcceptable, Counting.kappa_good_prime and
Counting.kappa_finite_product_residue; local congruence
selectors and densities; real invariant sections and their smoothed unfolding;
and the adelic class-chart lattices, integral orbit weights, balanced-unit
squareclass windows and local masses in C(F,φ,Σ). The normalized cubic
polynomial is supplied by Part II. Their arithmetic and geometric constructions
are specified in the README rather than declarations here.
-/

end TauCetiRoadmap.ArithmeticStatisticsPartIII

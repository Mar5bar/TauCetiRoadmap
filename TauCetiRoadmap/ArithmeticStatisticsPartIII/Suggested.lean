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

/-- A square-divisor tail is detected by positive multiplicity on the nonsingular height box. -/
theorem tail_iff_multiplicity_pos {A : Type*} (Delta : A → ℤ) (H : A → ℝ)
    (M : ℕ) (X : ℝ) (a : A) (hH : H a < X) (hDelta : Delta a ≠ 0) :
    a ∈ squareDivisorTail Delta H M X ↔ 0 < squareDivisorMultiplicity Delta M a := by sorry

example : () ∈ squareDivisorTail (fun _ : Unit => 36) (fun _ => 0) 5 1 ∧
    squareDivisorMultiplicity (fun _ : Unit => 36) 5 () = 1 := by sorry
example (M : ℕ) : squareDivisorTail (fun _ : Unit => 0) (fun _ => 0) M 1 = ∅ ∧
    squareDivisorMultiplicity (fun _ : Unit => 0) M () = 0 := by sorry
example (M : ℕ) (hM : 1 ≤ M) :
    squareDivisorTail (fun _ : Unit => 1) (fun _ => 0) M 1 = ∅ := by sorry

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

example : monicCubicI (X ^ 3) = 0 ∧ monicCubicJ (X ^ 3) = 0 ∧
    monicCubicHeight (X ^ 3) = 0 := by sorry
example : monicCubicI (X ^ 3 - X) = 3 ∧ monicCubicJ (X ^ 3 - X) = 0 ∧
    monicCubicHeight (X ^ 3 - X) = 27 := by sorry
example : Irreducible (X ^ 3 - C 2 : ℚ[X]) ∧
    monicCubicI (X ^ 3 - C 2) = 0 ∧ monicCubicJ (X ^ 3 - C 2) = 54 ∧
    monicCubicHeight (X ^ 3 - C 2) = 729 := by sorry

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

/-- The trivial two-permutation action keeps both transporter elements. -/
private instance permUnitAction : MulAction (Equiv.Perm (Fin 2)) Unit where
  smul _ u := u
  one_smul _ := rfl
  mul_smul _ _ _ := rfl

example : sectionKernel (fun _ : Unit => ()) (fun _ : Unit => ())
    (fun _ : Equiv.Perm (Fin 2) => (2 : ℝ)) (fun _ => 3) () = 12 := by sorry
example : sectionKernel (fun _ : Unit => ()) (fun _ : Unit => ())
    (fun _ : Equiv.Perm (Fin 2) => (2 : ℝ)) (fun _ => 0) () = 0 := by sorry

example : sectionKernel (fun _ : Unit => ()) (fun _ : Unit => ())
    (fun _ : Equiv.Perm Unit => (2 : ℝ)) (fun _ => 3) () = 6 := by sorry

example :
    letI : MulAction (Equiv.Perm Unit) Bool :=
      { smul := fun _ b => b, one_smul := fun _ => rfl, mul_smul := fun _ _ _ => rfl }
    sectionKernel (fun _ : Bool => ()) (fun _ : Unit => false)
      (fun _ : Equiv.Perm Unit => (2 : ℝ)) (fun _ => 3) true = 0 := by sorry

/-- A coupled CRT condition occupies two residues, rather than four marginal combinations. -/
example : ({x : ZMod 15 | x = 0 ∨ x = 1}.ncard : ℚ) / 15 = 2 / 15 ∧
    (2 : ℚ) / 15 ≠ (2 / 3) * (2 / 5) := by sorry

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

example : sieveCutoff (1/2) (1/100) 0 = (1/50 : ℝ) ∧
    EvenTailParameters 4 (1/2) (1/100) 0 := by sorry
example : ¬ EvenTailParameters 4 (1/2) (9/10) 0 := by sorry
example : sieveCutoff 1 (3/5) 0 < 1 ∧
    ¬ EvenTailParameters 4 1 (3/5) 0 := by sorry
example : ¬ EvenTailParameters 2 (1/2) (1/100) 0 ∧
    ¬ EvenTailParameters 3 (1/2) (1/100) 0 := by sorry
example : sieveCutoff 0 (1/100) 0 = (1/100 : ℝ) ∧
    ¬ EvenTailParameters 4 0 (1/100) 0 := by sorry

/-- These are local mass and integral-representative normalization checks. -/
example : (3 : ℚ) / 3 = 1 ∧ (1 : ℚ) / 3 = 1/3 ∧
    (1 / (1 * (1 + 1)) : ℚ) + 1 / (1 * (1 + 1)) = 1 := by sorry
example : ((1 : ℚ) / (3 * (1/3))) / 3 = 1/3 ∧
    1 + (1 : ℚ) = 2 := by sorry
example : (2 : ℚ) ^ (-4 : ℤ) = (2 : ℚ) ^ (-3 : ℤ) * (2 : ℚ) ^ (-1 : ℤ) ∧
    (2 : ℚ) ^ (-4 : ℤ) = 1/16 := by sorry

example : squareDivisorTail (fun _ : Unit => 36) (fun _ => 0) 6 1 = ∅ ∧
    squareDivisorMultiplicity (fun _ : Unit => 36) 6 () = 0 := by sorry
example : sectionKernel (fun _ : Unit => ()) (fun _ : Unit => ())
    (fun _ : Equiv.Perm (Fin 2) => (0 : ℝ)) (fun _ => 3) () = 0 := by sorry

/-- Cubic sign regions exclude the singular boundary; quartic sign uses the fixed degree. -/
example : (X ^ 3 - 3 * X : ℤ[X]).discr = 108 ∧
    (X ^ 3 + X : ℤ[X]).discr = -4 ∧ (X ^ 3 : ℤ[X]).discr = 0 ∧
    (X ^ 4 - 1 : ℤ[X]).discr = -256 := by sorry

/-- Negative discriminant is compatible with a nonidentity twisted stabilizer for a reducible cubic. -/
example (x y : ℤ) :
    (-1 : ℤ) * ((-x)^3 + (-x)*y^2) = x^3 + x*y^2 ∧
    Matrix.det (!![-1, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℤ) = -1 := by sorry

/-- The irreducible cubic X cubed minus two has negative discriminant. -/
example : Irreducible (X^3 - C 2 : ℚ[X]) ∧
    (X^3 - C 2 : ℤ[X]).discr = -108 := by sorry

/-- The ordered quartic tangent basis E11,E12,E21 fixes the Jacobian sign. -/
example (i j : ℚ) :
    Matrix.det (!![0, 1, 0, 0, 0; 1, 0, 0, 0, 0; 0, -i, 3, 0, 0;
      i/3, -4*j/27, 0, -1/3, 0; 2*j/27, 0, -i/3, 0, -1/27] :
      Matrix (Fin 5) (Fin 5) ℚ) = -1/27 := by sorry

/-- At x³−xy² the scalar, diagonal, unipotent and rotation tangent columns have determinant 8. -/
example : Matrix.det (!![1, -3, 0, 0; 0, 0, 3, 5; -1, -1, 0, 0; 0, 0, -1, -1] :
    Matrix (Fin 4) (Fin 4) ℚ) = 8 := by sorry

/-- Central minus identity fixes a quartic under ordinary substitution. -/
example (a b c d e x y : ℤ) :
    a * (-x)^4 + b * (-x)^3 * (-y) + c * (-x)^2 * (-y)^2 +
      d * (-x) * (-y)^3 + e * (-y)^4 =
    a * x^4 + b * x^3 * y + c * x^2 * y^2 + d * x * y^3 + e * y^4 := by sorry

/-- A lower triangular row substitution preserves the monic quadratic carrier. -/
example (a b t l x y : ℚ) :
    (x + t*y)^2 + a*(x + t*y)*(l*y) + b*(l*y)^2 =
      x^2 + (l*a + 2*t)*x*y + (l^2*b + l*t*a + t^2)*y^2 := by sorry

/-- The upper triangular substitution sends the leading coefficient of x squared plus y squared to two. -/
example :
    let w := Matrix.vecMul (![1, 0] : Fin 2 → ℚ) (!![1, 1; 0, 1])
    w 0 ^ 2 + w 1 ^ 2 = 2 := by sorry

/-- The degree-two tail includes a weak square divisor but excludes the unit and singular cases. -/
example : (X ^ 2 - C 25 : ℤ[X]).discr = 100 ∧
    (X ^ 2 + X : ℤ[X]).discr = 1 ∧ (X ^ 2 : ℤ[X]).discr = 0 ∧
    (5 : ℤ)^2 ∣ (X ^ 2 - C 25 : ℤ[X]).discr := by sorry

/-- Gram determinants detect both scaling a row and loss of row rank. -/
example :
    let R : Matrix (Fin 2) (Fin 3) ℝ := !![1, 0, 0; 0, 1, 0]
    Matrix.det (R * R.transpose) = 1 := by sorry
example (t : ℝ) :
    let R : Matrix (Fin 2) (Fin 3) ℝ := !![1, 0, 0; 0, t, 0]
    Matrix.det (R * R.transpose) = t^2 := by sorry
example :
    let R : Matrix (Fin 2) (Fin 3) ℝ := !![1, 0, 0; 2, 0, 0]
    Matrix.det (R * R.transpose) = 0 := by sorry

/-- The paired deep-block example has a nonzero degree-five discriminant. -/
example :
    let A : Matrix (Fin 5) (Fin 5) ℤ[X] :=
      !![0, 0, 0, 2, 1; 0, 0, 1, 1, -1; 0, 1, 0, 2, 1;
        2, 1, 2, -1, 1; 1, -1, 1, 1, 2]
    let B : Matrix (Fin 5) (Fin 5) ℤ[X] :=
      !![0, 0, 1, 0, 0; 0, 0, 0, 1, 0; 1, 0, 0, 0, 0;
        0, 1, 0, 0, 0; 0, 0, 0, 0, 0]
    Matrix.det ((X : ℤ[X]) • A - B) = X * (3*X^4 + 30*X^3 - 15*X^2 - 4*X + 2) ∧
      (Matrix.det ((X : ℤ[X]) • A - B)).discr = 2529792 := by sorry

/-- Constant local factors distinguish one exceptional prime from infinitely many factors. -/
example : (∏' _p : Nat.Primes, (1 : ℝ)) = 1 ∧
    (∏' p : Nat.Primes, if p.val = 2 then (1/2 : ℝ) else 1) = 1/2 ∧
    (∏' _p : Nat.Primes, (1/2 : ℝ)) = 0 := by sorry

/-- Normalized coefficient-residue averages of a constant factor retain that constant. -/
example (p : ℕ) [NeZero p] (hp : p.Prime) (r : ℕ) :
    (∑ _a : Fin r → ZMod p, (1/2 : ℝ)) / (p : ℝ)^r = 1/2 := by sorry

/-- The even main-body savings use their minimum at the quartic boundary. -/
example : min (1/(4*4) : ℝ) ((4-2)/(2*4^2+2*4+2)) = 1/21 ∧
    min (1/(4*6) : ℝ) ((6-2)/(2*6^2+2*6+2)) = 1/24 := by sorry

/-- Finite and infinite real roots distinguish the quartic root types with positive discriminant. -/
example : (X^3 - X : ℝ[X]).roots.card + 1 = 4 ∧
    (X^3 + X : ℝ[X]).roots.card + 1 = 2 ∧
    (X^4 + 1 : ℝ[X]).roots.card = 0 ∧
    (X^4 + 1 : ℤ[X]).discr = 256 := by sorry

/-- Perturbing the leading coefficient exhibits weak divisibility in the quartic carrier. -/
example : (25*X^4 + X^2 + 1 : ℤ[X]).discr = 3920400 ∧
    (25 : ℤ) ∣ (25*X^4 + X^2 + 1 : ℤ[X]).discr ∧
    ¬ (25 : ℤ) ∣ (30*X^4 + X^2 + 1 : ℤ[X]).discr := by sorry

/-- The cubic weak-divisibility witness uses the same leading-coordinate perturbation. -/
example : (25*X^3 + X + 1 : ℤ[X]).discr = -25*679 ∧
    ¬ (25 : ℤ) ∣ (30*X^3 + X + 1 : ℤ[X]).discr := by sorry

/-- The split local quartic algebra has six suborders of index five. -/
example : {S : Subring (Fin 4 → ZMod 5) | S.toAddSubgroup.index = 5}.ncard = 6 := by sorry

/-- A nonzero residue linear condition on two coordinate differences defines an index-p-cubed suborder. -/
example (p : ℕ) (hp : p.Prime) (a b : ℤ)
    (hab : ¬ ((p : ℤ) ∣ a ∧ (p : ℤ) ∣ b)) :
    ∃ S : Subring (Fin 4 → ℤ),
      (∀ v, v ∈ S ↔ (p : ℤ) ∣ v 0 - v 2 ∧ (p : ℤ) ∣ v 1 - v 2 ∧
        (p : ℤ)^2 ∣ a * (v 0 - v 2) + b * (v 1 - v 2)) ∧
      S.toAddSubgroup.index = p^3 := by sorry

/-- Projective residue directions give at least p plus one split quartic suborders of index p cubed. -/
example (p : ℕ) (hp : p.Prime) :
    p + 1 ≤ {S : Subring (Fin 4 → ℤ) | S.toAddSubgroup.index = p^3}.ncard := by sorry

/-- An Artin–Schreier quadratic over the rational function field has unit discriminant. -/
example :
    (X^2 + X + C (RatFunc.X : RatFunc (ZMod 2)) : (RatFunc (ZMod 2))[X]).discr = 1 := by sorry

/-- Polynomial coefficient boxes over a finite constant field have their Riemann–Roch cardinality. -/
example (q : ℕ) [NeZero q] (k : ℕ) :
    Fintype.card (Fin (k+1) → ZMod q) = q^(k+1) := by sorry

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
Counting.tail_antitone, Counting.sectionKernel_zero and Counting.sectionKernel_unique
are the basic API targets in the corresponding README lists;
and the adelic class-chart lattices, integral orbit weights, balanced-unit
squareclass windows and local masses in C(F,φ,Σ). The normalized cubic
polynomial is supplied by Part II. Their arithmetic and geometric constructions
are specified in the README rather than declarations here.
-/

end TauCetiRoadmap.ArithmeticStatisticsPartIII

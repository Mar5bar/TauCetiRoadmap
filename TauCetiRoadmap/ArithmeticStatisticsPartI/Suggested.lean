import Mathlib
import TauCeti.Order.Northcott.Basic

/-!
# Arithmetic statistics, Part I: representative target signatures

The accompanying README is the full specification, with source locators and exact
supplier contracts. This file gives suggested forms, not an exhaustive checklist: light definitions
and milestone statements on the pinned carriers. Counts retain the specified cutoffs and
denominators. Geometric orbit, moduli, covering and adelic constructions remain README targets.
-/

noncomputable section
open scoped BigOperators Topology
open Polynomial Filter

namespace TauCetiRoadmap.ArithmeticStatisticsPartI

/-! ## Layer 0: Families, heights and local specifications -/

/-- A height on an already chosen quotient or representative carrier, with finite sublevels. -/
structure ArithmeticFamily (A : Type*) where
  height : A → ℝ
  northcott : Northcott height

namespace ArithmeticFamily
variable {A : Type*} (F : ArithmeticFamily A)

/-- Inclusive, unweighted count; the Northcott field establishes finiteness. -/
def count (S : Set A) (X : ℝ) : ℕ := {a | a ∈ S ∧ F.height a ≤ X}.ncard

/-- Relative density keeps its ambient subfamily in the denominator. -/
def HasRelativeDensity (S T : Set A) (d : ℝ) : Prop :=
  Tendsto (fun X : ℝ => (F.count (S ∩ T) X : ℝ) / F.count T X) atTop (nhds d)

/-- Strict-cutoff count for comparison with the inclusive family count. -/
def countLT (S : Set A) (X : ℝ) : ℕ := {a | a ∈ S ∧ F.height a < X}.ncard

/-- Positive constant rescaling preserves the Northcott property. -/
def rescale (c : ℝ) (hc : 0 < c) : ArithmeticFamily A where
  height a := c * F.height a
  northcott := ⟨fun X => (F.northcott.finite_le (X / c)).subset
    (fun a ha => (le_div_iff₀ hc).mpr (by simpa only [Set.mem_ofPred_eq, mul_comm] using ha))⟩

/-- A natural Northcott height uses the real-cutoff carriers supplied by Tau Ceti. -/
def ofNat (N : A → ℕ) [Northcott N] : ArithmeticFamily A where
  height a := (N a : ℝ)
  northcott := ⟨TauCeti.finite_setOf_natCast_le N⟩

/-- The arithmetic-family target identifies natural-height sublevels with Tau Ceti's carriers. -/
theorem heightLE_ofNat (N : A → ℕ) [Northcott N] (X : ℝ) :
    {a | (ofNat N).height a ≤ X} = (TauCeti.normLE N X : Set A) := by sorry

/-- The arithmetic-family target gives finite inclusive sublevels. -/
theorem finite_height_le (X : ℝ) : {a | F.height a ≤ X}.Finite := by sorry

/-- The arithmetic-family target makes counts on infinite subfamilies tend to infinity. -/
theorem tendsto_count_atTop (S : Set A) (hS : S.Infinite) :
    Tendsto (F.count S) atTop atTop := by sorry

/-- The relative-density target gives self-density one for an infinite ambient family. -/
theorem hasDensity_self (S : Set A) (hS : S.Infinite) :
    F.HasRelativeDensity S S 1 := by sorry

/-- The relative-density target makes finite subfamilies negligible in infinite families. -/
theorem hasDensity_zero_of_finite (S T : Set A) (hS : S.Finite) (hT : T.Infinite) :
    F.HasRelativeDensity S T 0 := by sorry

/-- The relative-density target identifies the limits for strict and inclusive cutoffs. -/
theorem hasDensity_iff_tendsto_ratioLT (S T : Set A) (d : ℝ) :
    F.HasRelativeDensity S T d ↔
      Tendsto (fun X : ℝ => (F.countLT (S ∩ T) X : ℝ) / F.countLT T X)
        atTop (nhds d) := by sorry

/-- The tower-density target multiplies densities, including empty and finite families. -/
theorem relativeDensity_mul (U T S : Set A) (hUT : U ⊆ T) (hTS : T ⊆ S)
    (d e : ℝ) (hT : F.HasRelativeDensity T S d)
    (hU : F.HasRelativeDensity U T e) : F.HasRelativeDensity U S (e * d) := by
  sorry

/-- The positive-lower-density restriction target transfers density one to a subfamily. -/
theorem inter_of_lowerDensity_pos (B U T : Set A) (hUT : U ⊆ T)
    (hB : F.HasRelativeDensity B T 1)
    (hU : 0 < liminf (fun X : ℝ => (F.count (U ∩ T) X : ℝ) / F.count T X) atTop) :
    F.HasRelativeDensity (B ∩ U) U 1 := by sorry

/-- The constant-rescaling target identifies the two cutoff counts exactly. -/
theorem count_rescale (c : ℝ) (hc : 0 < c) (S : Set A) (X : ℝ) :
    (F.rescale c hc).count S X = F.count S (X / c) := by sorry

/-- The constant-rescaling target preserves relative density under positive rescaling. -/
theorem hasDensity_rescale_iff (c : ℝ) (hc : 0 < c) (S T : Set A) (d : ℝ) :
    (F.rescale c hc).HasRelativeDensity S T d ↔ F.HasRelativeDensity S T d := by sorry

/-- The constant-rescaling target changes a power-law count by the inverse height factor. -/
theorem tendsto_rescale_count_div_rpow (c : ℝ) (hc : 0 < c) (S : Set A) (κ C : ℝ)
    (h : Tendsto (fun X : ℝ => (F.count S X : ℝ) / X ^ κ) atTop (nhds C)) :
    Tendsto (fun X : ℝ => ((F.rescale c hc).count S X : ℝ) / X ^ κ)
      atTop (nhds (C * c ^ (-κ))) := by sorry

/-- The piecewise-rescaling target weights the component densities by their count constants. -/
theorem hasDensity_piecewise_rescale (G : ArithmeticFamily A) {k : ℕ} (hk : 1 ≤ k)
    (T : Fin k → Set A) (hT : Pairwise (fun i j => Disjoint (T i) (T j)))
    (c a d : Fin k → ℝ) (hc : ∀ j, 0 < c j) (ha : ∀ j, 0 < a j)
    (hheight : ∀ j, ∀ x ∈ T j, G.height x = c j * F.height x)
    (κ : ℝ) (hκ : 0 < κ) (B : Set A)
    (hcount : ∀ j, Tendsto (fun X : ℝ => (F.count (T j) X : ℝ) / X ^ κ)
      atTop (nhds (a j)))
    (hdensity : ∀ j, F.HasRelativeDensity B (T j) (d j)) :
    G.HasRelativeDensity B (⋃ j, T j)
      ((∑ j, c j ^ (-κ) * a j * d j) / ∑ j, c j ^ (-κ) * a j) := by sorry

/-- The empty-ambient Check has density zero and excludes density one. -/
theorem empty_ambient_density :
    F.HasRelativeDensity ∅ ∅ 0 ∧ ¬ F.HasRelativeDensity ∅ ∅ 1 := by sorry

end ArithmeticFamily

namespace SquarefreeFamily

/-- Natural height fixes the denominator for positive squarefree integer densities. -/
def natFamily : ArithmeticFamily ℕ where
  height n := (n : ℝ)
  northcott := ⟨fun X => (Set.finite_Iic ⌊X⌋₊).subset (fun _ hn => Nat.le_floor hn)⟩

/-- Positive squarefree integers represent the positive rational squareclasses. -/
def posSquarefree : Set ℕ := {n | 0 < n ∧ Squarefree n}

/-- The even-parity subfamily retains the three specified classes modulo eight. -/
def evenParityClasses : Set ℕ :=
  {n | n ∈ posSquarefree ∧ (n % 8 = 1 ∨ n % 8 = 2 ∨ n % 8 = 3)}

/-- The positive-squarefree-family target makes the parity denominator a genuine subfamily. -/
theorem evenParityClasses_subset : evenParityClasses ⊆ posSquarefree := by sorry

/-- The positive-squarefree-family target excludes residues divisible by four. -/
theorem posSquarefree_mod_eight (n : ℕ) (hn : n ∈ posSquarefree) :
    n % 8 ≠ 0 ∧ n % 8 ≠ 4 := by sorry

/-- The positive-squarefree-family target supplies an infinite ambient denominator. -/
theorem posSquarefree_infinite : posSquarefree.Infinite := by sorry

/-- The Möbius-indicator target detects squarefreeness by square divisors of a positive integer. -/
theorem sum_moebius_sq_dvd (n : ℕ) (hn : 0 < n) :
    (∑ d ∈ n.divisors with d ^ 2 ∣ n, ArithmeticFunction.moebius d) =
      if Squarefree n then 1 else 0 := by sorry

/-- The squarefree-residue-count target gives an error of order square root at fixed modulus. -/
theorem squarefree_residue_count (q : ℕ) (hq : 0 < q) :
    ∃ Cq : ℝ, 0 ≤ Cq ∧ ∀ a : ℕ, Nat.Coprime a q → ∀ X : ℝ, 1 ≤ X →
      |(natFamily.count {n | n ∈ posSquarefree ∧ n % q = a % q} X : ℝ) -
        ((6 / Real.pi ^ 2) / q *
          ∏ p ∈ q.primeFactors, (1 - 1 / (p : ℝ) ^ 2)⁻¹) * X| ≤
        Cq * Real.sqrt X := by sorry

/-- The even-parity-density target identifies half of the positive squarefree denominator. -/
theorem hasDensity_evenParityClasses :
    natFamily.HasRelativeDensity evenParityClasses posSquarefree (1 / 2) := by sorry

/-- The density-one-transfer target gives half density in the positive squarefree family. -/
theorem hasDensity_half_of_hasDensity_one (A : Set ℕ) (hA : A ⊆ evenParityClasses)
    (h : natFamily.HasRelativeDensity A evenParityClasses 1) :
    natFamily.HasRelativeDensity A posSquarefree (1 / 2) := by sorry

end SquarefreeFamily

namespace Coefficients
/-- Inclusive coefficient-cube height, including the empty vector. -/
def boxHeight {m : ℕ} (a : Fin m → ℤ) : ℕ := Finset.univ.sup (fun i => (a i).natAbs)

/-- The coefficient-box target gives the exact finite cardinality in every dimension. -/
theorem boxHeight_count (m B : ℕ) :
    Nat.card {a : Fin m → ℤ // boxHeight a ≤ B} = (2 * B + 1) ^ m := by sorry

/-- The coefficient-box target supplies a Northcott height on each coefficient lattice. -/
theorem boxHeight_northcott (m : ℕ) : Northcott (@boxHeight m) := by sorry

/-- Monic coefficients are ordered from `x^(n−1)` to the constant term. -/
def monicPolynomial {R : Type*} [CommRing R] (n : ℕ) (a : Fin n → R) : R[X] :=
  X ^ n + ∑ i : Fin n, C (a i) * X ^ (n - 1 - i.val)

/-- The monic-weighted-height target constructs monic polynomials of the specified degree. -/
theorem monicPolynomial_monic {R : Type*} [CommRing R] [Nontrivial R]
    (n : ℕ) (a : Fin n → R) :
    (monicPolynomial n a).Monic ∧ (monicPolynomial n a).natDegree = n := by sorry

/-- The strict weighted box used by the monic discriminant sieve. -/
def weightedBox (n : ℕ) (X : ℝ) : Set (Fin n → ℤ) :=
  {a | ∀ i, |(a i : ℝ)| < X ^ (i.val + 1)}

/-- The monic-weighted-height target counts strict coefficient boxes with their ceiling boundary. -/
theorem weightedBox_count (n : ℕ) (X : ℝ) (hX : 0 < X) :
    (weightedBox n X).Finite ∧
    (weightedBox n X).ncard = ∏ i : Fin n, (2 * ⌈X ^ (i.val + 1)⌉₊ - 1) := by sorry

/-- Evaluation of a homogeneous binary form; the point at infinity is retained. -/
def binaryValue {R : Type*} [CommRing R] (n : ℕ) (a : Fin (n + 1) → R) (x y : R) : R :=
  ∑ i, a i * x ^ (n - i.val) * y ^ i.val

/-- Strong divisibility is a condition on every coefficient perturbation. -/
def StrongSquareDivides {r : ℕ} (Delta : (Fin r → ℤ) → ℤ) (p : ℕ) (a : Fin r → ℤ) : Prop :=
  ∀ b : Fin r → ℤ, (p : ℤ) ^ 2 ∣ Delta (fun i => a i + (p : ℤ) * b i)

/-- Weak divisibility includes divisibility at the point and excludes the strong locus. -/
def WeakSquareDivides {r : ℕ} (Delta : (Fin r → ℤ) → ℤ) (p : ℕ) (a : Fin r → ℤ) : Prop :=
  (p : ℤ) ^ 2 ∣ Delta a ∧ ¬ StrongSquareDivides Delta p a

end Coefficients

/-- The strong/weak target partitions square divisibility into disjoint loci. -/
theorem squareDiv_partition {r : ℕ} (D : (Fin r → ℤ) → ℤ) (p : ℕ) (a : Fin r → ℤ) :
    ((p : ℤ) ^ 2 ∣ D a ↔
      Coefficients.StrongSquareDivides D p a ∨ Coefficients.WeakSquareDivides D p a) ∧
    ¬ (Coefficients.StrongSquareDivides D p a ∧ Coefficients.WeakSquareDivides D p a) :=
  by sorry

/-- The strong/weak target makes strong divisibility constant on coefficient residue classes. -/
theorem strongSquareDiv_residue {r : ℕ} (D : (Fin r → ℤ) → ℤ) (p : ℕ)
    (a b : Fin r → ℤ) :
    Coefficients.StrongSquareDivides D p (fun i => a i + (p : ℤ) * b i) ↔
      Coefficients.StrongSquareDivides D p a := by sorry

/-- Monic squarefree polynomials of fixed degree form the finite-field counting slice. -/
def monicSquarefreePolysOfDegree (k : Type*) [Field k] (n : ℕ) : Set k[X] :=
  {f | f.Monic ∧ Squarefree f ∧ f.natDegree = n}

/-- The finite-field squarefree-count target includes its degree-zero and degree-one boundaries. -/
theorem card_monicSquarefreePolysOfDegree (k : Type*) [Field k] [Fintype k] (n : ℕ) :
    (monicSquarefreePolysOfDegree k n).Finite ∧
    (monicSquarefreePolysOfDegree k n).ncard =
      if n = 0 then 1 else if n = 1 then Fintype.card k
      else Fintype.card k ^ n - Fintype.card k ^ (n - 1) := by sorry

/-- Monic local proportions count exact discriminant valuation on positive residue moduli. -/
def monicProportion (n : ℕ) (p : ℕ+) (j : ℕ) : ℝ :=
  (Nat.card {a : Fin n → ZMod ((p : ℕ) ^ (j + 1)) //
    (p : ℤ) ^ j ∣ (Coefficients.monicPolynomial n (fun i => ((a i).val : ℤ))).discr ∧
    ¬ (p : ℤ) ^ (j + 1) ∣
      (Coefficients.monicPolynomial n (fun i => ((a i).val : ℤ))).discr} : ℝ) /
    (p : ℝ) ^ ((j + 1) * n)

/-- The monic-local-proportions target makes discriminants independent of coefficient lifts. -/
theorem monicDisc_lift (n m : ℕ) (a b : Fin n → ℤ)
    (hab : ∀ i, a i ≡ b i [ZMOD (m : ℤ)]) :
    (Coefficients.monicPolynomial n a).discr ≡
      (Coefficients.monicPolynomial n b).discr [ZMOD (m : ℤ)] := by sorry

/-- The monic-density-formulas target gives the unit-discriminant probability in every degree. -/
theorem monic_nu_zero (n : ℕ) (p : ℕ+) (hp : Nat.Prime (p : ℕ)) :
    monicProportion n p 0 = if n ≤ 1 then 1 else 1 - 1 / (p : ℝ) := by sorry

/-- The valuation-one formula includes the prime-two and small-degree exceptions. -/
def nuOneFormula (n : ℕ) (p : ℕ+) : ℝ :=
  if (p : ℕ) = 2 ∨ n ≤ 1 then 0 else
  if n = 2 then (1 / (p : ℝ)) * (1 - 1 / (p : ℝ)) else
    (1 - 1 / (p : ℝ)) ^ 2 * (1 - (-(p : ℝ)) ^ (2 - (n : ℤ))) / ((p : ℝ) + 1)

/-- The monic-density-formulas target computes exact valuation-one residue proportions. -/
theorem monic_nu_one (n : ℕ) (p : ℕ+) (hp : Nat.Prime (p : ℕ)) :
    monicProportion n p 1 = nuOneFormula n p := by sorry

/-- The monic Euler product multiplies the valuation-zero and valuation-one local masses. -/
def monicEulerProduct (n : ℕ) : ℝ :=
  ∏' p : Nat.Primes, (monicProportion n ⟨p, p.property.pos⟩ 0 +
    monicProportion n ⟨p, p.property.pos⟩ 1)

/-- The monic-Euler-products target establishes convergence of the prime product. -/
theorem monicEulerProduct_converges (n : ℕ) (hn : 2 ≤ n) :
    Multipliable (fun p : Nat.Primes => monicProportion n ⟨p, p.property.pos⟩ 0 +
      monicProportion n ⟨p, p.property.pos⟩ 1) := by sorry

/-- The monic-Euler-products target gives a strictly positive constant for each degree. -/
theorem monicEulerProduct_pos (n : ℕ) (hn : 2 ≤ n) : 0 < monicEulerProduct n := by sorry

/-- The monic-Euler-products degree-two Check evaluates the quadratic constant. -/
theorem monicEulerProduct_two : monicEulerProduct 2 = 4 / Real.pi ^ 2 := by sorry

/-- The monic-Euler-products target interchanges the degree limit and the prime product. -/
theorem monicEulerProduct_limit :
    Tendsto monicEulerProduct atTop
      (nhds (∏' p : Nat.Primes, if (p : ℕ) = 2 then (1 / 2 : ℝ) else
        1 - (3 * (p : ℝ) - 1) / ((p : ℝ) ^ 2 * ((p : ℝ) + 1)))) := by sorry

/-- Binary quartics use ordinary monomial coefficients, with no binomial factors. -/
structure BinaryQuartic (R : Type*) where
  a : R
  b : R
  c : R
  d : R
  e : R

namespace BinaryQuartic
variable {R : Type*} [CommRing R]
/-- The invariant `I = 12ae − 3bd + c²`. -/
def invI (f : BinaryQuartic R) : R := 12 * f.a * f.e - 3 * f.b * f.d + f.c ^ 2

/-- The invariant `J = 72ace + 9bcd − 27ad² − 27eb² − 2c³`. -/
def invJ (f : BinaryQuartic R) : R :=
  72 * f.a * f.c * f.e + 9 * f.b * f.c * f.d - 27 * f.a * f.d ^ 2 - 27 * f.e * f.b ^ 2
    - 2 * f.c ^ 3

/-- The discriminant, the integral polynomial with `27 Δ = 4I³ − J²`. -/
def disc (f : BinaryQuartic R) : R :=
  let a := f.a; let b := f.b; let c := f.c; let d := f.d; let e := f.e
  256 * a ^ 3 * e ^ 3 - 192 * a ^ 2 * b * d * e ^ 2 - 128 * a ^ 2 * c ^ 2 * e ^ 2
    + 144 * a ^ 2 * c * d ^ 2 * e - 27 * a ^ 2 * d ^ 4 + 144 * a * b ^ 2 * c * e ^ 2
    - 6 * a * b ^ 2 * d ^ 2 * e - 80 * a * b * c ^ 2 * d * e + 18 * a * b * c * d ^ 3
    + 16 * a * c ^ 4 * e - 4 * a * c ^ 3 * d ^ 2 - 27 * b ^ 4 * e ^ 2 + 18 * b ^ 3 * c * d * e
    - 4 * b ^ 3 * d ^ 3 - 4 * b ^ 2 * c ^ 3 * e + b ^ 2 * c ^ 2 * d ^ 2

/-- Dehomogenization retains the ordinary quartic coefficient convention. -/
def dehomogenize (f : BinaryQuartic R) : R[X] :=
  C f.a * X ^ 4 + C f.b * X ^ 3 + C f.c * X ^ 2 + C f.d * X + C f.e

/-- Coefficient scaling is separate from a change of variables. -/
def scale (r : R) (f : BinaryQuartic R) : BinaryQuartic R :=
  ⟨r * f.a, r * f.b, r * f.c, r * f.d, r * f.e⟩

/-- Eligibility means that an integral form realizes the prescribed invariant pair. -/
def IsEligible (I J : ℤ) : Prop :=
  ∃ f : BinaryQuartic ℤ, invI f = I ∧ invJ f = J

/-- The four eligibility congruence cases use integer congruence modulo 3, 9 and 27. -/
def EligibilityCongruence (I J : ℤ) : Prop :=
  (I ≡ 0 [ZMOD 3] ∧ J ≡ 0 [ZMOD 27]) ∨
  (I ≡ 1 [ZMOD 9] ∧ (J ≡ 2 [ZMOD 27] ∨ J ≡ -2 [ZMOD 27])) ∨
  (I ≡ 4 [ZMOD 9] ∧ (J ≡ 16 [ZMOD 27] ∨ J ≡ -16 [ZMOD 27])) ∨
  (I ≡ 7 [ZMOD 9] ∧ (J ≡ 7 [ZMOD 27] ∨ J ≡ -7 [ZMOD 27]))

/-- The eligibility-criterion target characterizes all integral invariant pairs by congruences. -/
theorem isEligible_iff (I J : ℤ) : IsEligible I J ↔ EligibilityCongruence I J := by sorry

/-- The binary-quartic-invariants target gives the integral identity over every coefficient ring. -/
theorem twentySeven_mul_disc (f : BinaryQuartic R) : 27 * disc f = 4 * invI f ^ 3 - invJ f ^ 2 :=
  sorry

/-- The quartic-discriminant comparison target uses affine degree exactly four. -/
theorem disc_eq_discr (f : BinaryQuartic R) (hf : f.dehomogenize.degree = 4) :
    disc f = f.dehomogenize.discr := by sorry

/-- The binary-quartic-invariants target gives degree-two homogeneity of I. -/
theorem invI_scale (r : R) (f : BinaryQuartic R) : invI (scale r f) = r ^ 2 * invI f :=
  by sorry

/-- The binary-quartic-invariants target gives degree-three homogeneity of J. -/
theorem invJ_scale (r : R) (f : BinaryQuartic R) : invJ (scale r f) = r ^ 3 * invJ f :=
  by sorry

/-- Invariant height, before conversion to a minimal elliptic-curve height. -/
def pairHeight (I J : ℝ) : ℝ := max (|I| ^ 3) (J ^ 2 / 4)

/-- The binary-quartic-height target gives its weighted degree-six scaling. -/
theorem pairHeight_scale (t I J : ℝ) :
    pairHeight (t ^ 2 * I) (t ^ 3 * J) = t ^ 6 * pairHeight I J := by sorry

/-- The binary-quartic-height target gives finite sublevels on integer invariant pairs. -/
theorem northcott_pairHeight : Northcott (fun z : ℤ × ℤ => pairHeight z.1 z.2) := by sorry

/-- The binary-quartic-height target identifies the zero-height invariant pair. -/
theorem pairHeight_eq_zero_iff (I J : ℝ) : pairHeight I J = 0 ↔ I = 0 ∧ J = 0 := by sorry

/-- The quartic-to-curve normalization target compares the two coefficient heights. -/
theorem height_ofCurve (A B : ℝ) :
    27 * max (4 * |A| ^ 3) (27 * B ^ 2) = 4 * pairHeight (-3 * A) (-27 * B) := by sorry

/-- Equal I and J need not determine the discriminant in characteristic three. -/
example : invI (⟨0, 1, 0, -1, 0⟩ : BinaryQuartic (ZMod 3)) =
      invI (⟨0, 0, 0, 0, 0⟩ : BinaryQuartic (ZMod 3)) ∧
    invJ (⟨0, 1, 0, -1, 0⟩ : BinaryQuartic (ZMod 3)) =
      invJ (⟨0, 0, 0, 0, 0⟩ : BinaryQuartic (ZMod 3)) ∧
    disc (⟨0, 1, 0, -1, 0⟩ : BinaryQuartic (ZMod 3)) ≠
      disc (⟨0, 0, 0, 0, 0⟩ : BinaryQuartic (ZMod 3)) := by
  decide

end BinaryQuartic

/-- The natural bundle mass on splitting indices includes the exceptional balanced bundle. -/
def bundleMass (q : ℝ) (n : ℕ) : ℝ :=
  if n = 0 then (q - 1) / (2 * q) else (q ^ 2 - 1) / (2 * q ^ (n + 1))

/-- The natural-bundle-law target gives nonnegative probabilities at every splitting index. -/
theorem bundleMass_nonneg (q : ℝ) (hq : 1 < q) (n : ℕ) : 0 ≤ bundleMass q n := by sorry

/-- The natural-bundle-law target normalizes the inverse-automorphism masses to total one. -/
theorem bundleMass_sum (q : ℝ) (hq : 1 < q) : HasSum (bundleMass q) 1 := by sorry

/-- The natural-bundle-law target assigns half the probability to each parity sector. -/
theorem bundleMass_parity (q : ℝ) (hq : 1 < q) (r : ℕ) (hr : r < 2) :
    HasSum (fun n : ℕ => bundleMass q (2 * n + r)) (1 / 2) := by sorry

/-- The bundle-parity-tails target keeps the balanced-bundle exception at starting index zero. -/
theorem bundleMass_tail (q : ℝ) (hq : 1 < q) (d : ℕ) :
    HasSum (fun n : ℕ => bundleMass q (d + 2 * n))
      (if d = 0 then 1 / 2 else 1 / (2 * q ^ (d - 1))) := by sorry

/-- The parity-product candidate couples the two natural laws in the prescribed parity sector. -/
def parityProduct (q : ℝ) (δ : ZMod 2) (i j : ℕ) : ℝ :=
  if (i + j : ZMod 2) = δ then 2 * bundleMass q i * bundleMass q j else 0

/-- The parity-product target preserves both natural bundle marginals. -/
theorem parityProduct_marginal (q : ℝ) (hq : 1 < q) (δ : ZMod 2) (i : ℕ) :
    HasSum (fun j : ℕ => parityProduct q δ i j) (bundleMass q i) ∧
    HasSum (fun j : ℕ => parityProduct q δ j i) (bundleMass q i) := by sorry

/-- The parity-product target gives a joint law of total mass one. -/
theorem parityProduct_total (q : ℝ) (hq : 1 < q) (δ : ZMod 2) :
    HasSum (fun ij : ℕ × ℕ => parityProduct q δ ij.1 ij.2) 1 := by sorry

/-- The finite-Picard-quotient target counts the abstract degree-two quotient. -/
theorem picQuotient_card {P : Type*} [AddCommGroup P] (deg : P →+ ℤ)
    (hdeg : Function.Surjective deg) (κ : P) (hκ : deg κ = 2) [Finite deg.ker] :
    Finite (P ⧸ AddSubgroup.zmultiples κ) ∧
    Nat.card (P ⧸ AddSubgroup.zmultiples κ) = 2 * Nat.card deg.ker := by sorry

/-- Joint fiber mass is the pushforward of uniform counting on a finite source. -/
def jointFiberMass {Q : Type*} [Fintype Q] (f g : Q → ℕ) (i j : ℕ) : ℝ :=
  (Nat.card {x : Q // f x = i ∧ g x = j} : ℝ) / Fintype.card Q

/-- The finite-joint-bundle-mass target normalizes every nonempty finite-source pushforward. -/
theorem jointFiberMass_total {Q : Type*} [Fintype Q] [Nonempty Q] (f g : Q → ℕ) :
    HasSum (fun ij : ℕ × ℕ => jointFiberMass f g ij.1 ij.2) 1 := by sorry

/-!
The remaining README definitions are targets on their stated suppliers:
`ArithmeticFamily.heightLE`, `weightedCount`, `ofQuotient`, `comap`,
`ofMulHeight`, `ratio`, `ratioLT`, `upperDensity`, `lowerDensity`,
`stabilizerWeight`, `weightedOrbitCount`; `LocalConditions` with `FinitelyMany`,
`IsRegular`, `localDensity`, `IsLargeRel`; congruence-weight presentations,
`IsAcceptable` and `localMass`; quartic evaluation, substitution, twisted action,
the corresponding eligible-pair family; `EllipticFamily`, its invariant maps and
congruence subfamilies; `oddSupport`, `unitHeight`, `supportIdeal`, `squareclassHeight`,
`twistModel`, `twistClass`, `twistFamily`;
discriminant-ordered and embedded number-field families;
the imported cubic-action/algebra adapters and their maximality predicate;
hypersurface monomial coordinates, `FormDensity.minorGCD` and its saturation-index
comparison, primitive residue vectors, local-density moments
and projective equation families; odd quadratic function-field slices;
weighted monic heights, fixed-degree binary discriminants, squarefree intersections
of discriminant loci, binary local proportions and acceptable monic specifications;
hyperelliptic equation families, odd-root predicates and density transfers;
negative-Pell radicands; unpolarized, principally polarized and polarization-fiber
counts; the geometric interpretation of the bundle law and Picard quotient,
Picard representatives and carry, theta tails and Hecke pushforward;
`functionFieldAdeles`, `pgl2FunctionField_discrete`, `adelicBundleEquiv`,
`adelicBundleQuotientMeasure`, `adelicBundleQuotientMeasure_volume` and
`adelicBundleMeasure_map` for the function-field adelic bundle measure;
rank-two projective-line splitting, `p1BundleIndex`, finite double-cover pushforwards,
the hyperelliptic involution comparison and `thetaClasses`;
Wood outside involutions, admissible and good embedded types, type automorphisms,
continuous surjections, infinity adapters and exact imaginary/real slices,
rigid average normalizations and root-of-unity refinements; symmetric pencils,
binary-form orders and their ideal lattices; the local-maximality comparison.
Their full hypotheses, APIs and Checks are in README.md.

README-only API targets (their hypotheses and Checks are specified there):
`SquarefreeFamily.unitHeight_posSquarefree`;
`ArithmeticFamily.countLT_le_count`, `ArithmeticFamily.count_comap`;
`ArithmeticFamily.count_eq_weightedCount_indicator`, `ArithmeticFamily.count_eq_zero_of_lt`;
`ArithmeticFamily.count_mono`, `ArithmeticFamily.count_mono_set`;
`ArithmeticFamily.count_union_of_disjoint`;
`ArithmeticFamily.hasDensity_empty`;
`ArithmeticFamily.hasDensity_iff_lowerDensity_eq_upperDensity`;
`ArithmeticFamily.mem_heightLE`;
`ArithmeticFamily.ratio_le_one`, `ArithmeticFamily.ratio_nonneg`;
`ArithmeticFamily.weightedCount_ofNat`, `BinaryQuartic.abs_le_of_pairHeight_le`;
`BinaryQuartic.disc_smul`;
`BinaryQuartic.eligibilityCongruence_invariants`, `BinaryQuartic.eligibleFamily_height`;
`BinaryQuartic.eq_iff_coeff`, `BinaryQuartic.eval_smul`;
`BinaryQuartic.exists_eligible_residues`, `BinaryQuartic.four_mul_pairHeight_intCast`;
`BinaryQuartic.height_scale`;
`BinaryQuartic.height_smul`;
`BinaryQuartic.invI_twistedSMul`;
`BinaryQuartic.invJ_twistedSMul`, `BinaryQuartic.invariants_isEligible`;
`BinaryQuartic.invariants_smul`;
`BinaryQuartic.isEligible_of_eligibilityCongruence`, `BinaryQuartic.isEligible_selmer_scaling`;
`BinaryQuartic.isHomogeneous_toMvPolynomial`, `BinaryQuartic.map_invI`;
`BinaryQuartic.map_invJ`, `BinaryQuartic.map_smul`;
`BinaryQuartic.neg_one_smul`;
`BinaryQuartic.pairHeight_nonneg`;
`BinaryQuartic.twistedSMul_eq_smul_of_det_sq`;
`BinaryQuartic.twistedSMul_mul`, `BinaryQuartic.twistedSMul_scalar`;
`Coefficients.boxHeight_le`, `Coefficients.boxHeight_neg`;
`Coefficients.weightedHeight_le`, `Coefficients.weightedHeight_northcott`;
`count_sub_weightedOrbitCount_le`;
-/
end TauCetiRoadmap.ArithmeticStatisticsPartI

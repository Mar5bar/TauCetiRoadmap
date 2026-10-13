import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.PointCount

/-!
# NeronModelsAndSemistableAbelianVarietiesPartII: representative target signatures

**This file is not the roadmap and it is not exhaustive.** The definitive
specification is `README.md`. This file records light definitions and representative
milestones statable against the pinned APIs. Ring and
Weierstrass carriers are the native ones. Conductors retain nilpotents, quadratic
pinching allows inseparability, reversal uses a specified weight, and coefficient
bounds carry no minimality or rationality assertion. The geometric constructions and
the resolved-surface classification are specified in the README.
-/

namespace TauCetiRoadmap.NeronModelsAndSemistableAbelianVarietiesPartII

open CategoryTheory CategoryTheory.Limits Polynomial
open scoped Polynomial

universe u v
noncomputable section

/-! ## Layer 1: finite pinching and conductors -/

namespace AffinePinching

/-- The largest ambient ideal contained in an arbitrary subring. -/
def conductor {B : Type u} [CommRing B] (A : Subring B) : Ideal B where
  carrier := {b | ∀ x : B, b * x ∈ A}
  zero_mem' := fun x => by simp
  add_mem' := fun ha hb x => by
    rw [add_mul]
    exact A.add_mem (ha x) (hb x)
  smul_mem' := fun r b hb x => by
    change (r * b) * x ∈ A
    rw [show r * b * x = b * (r * x) by ring]
    exact hb (r * x)

/-- Membership requires multiplication by every ambient element. -/
theorem conductor_mem {B : Type u} [CommRing B] (A : Subring B) (b : B) :
    b ∈ conductor A ↔ ∀ x : B, b * x ∈ A := by sorry

/-- Containment in the subring characterizes the maximal ideal. -/
theorem conductor_greatest {B : Type u} [CommRing B] (A : Subring B) (I : Ideal B) :
    I ≤ conductor A ↔ (I : Set B) ⊆ A := by sorry

/-- The identity inclusion has the whole conductor, also for the zero ring. -/
example {B : Type u} [CommRing B] : conductor (⊤ : Subring B) = ⊤ := by sorry

/-- The cusp conductor remembers the double point in its normalization. -/
example (k : Type u) [Field k] :
    conductor (Algebra.adjoin k ({X ^ 2, X ^ 3} : Set k[X])).toSubring =
      Ideal.span ({X ^ 2} : Set k[X]) := by sorry

/-- A nonreduced diagonal has conductor zero, rather than its radical. -/
example :
    conductor ((RingHom.id (ZMod 4)).prod (RingHom.id (ZMod 4))).range = ⊥ ∧
    (2 : ZMod 4 × ZMod 4) ≠ 0 ∧ (2 : ZMod 4 × ZMod 4) ^ 2 = 0 := by sorry

/-- The actual comparison into Mathlib's constructed ring pullback. -/
def commonIdealComparison {A B : Type u} [CommRing A] [CommRing B]
    (f : A →+* B) (I : Ideal A) :
    CommRingCat.of A ⟶ (CommRingCat.pullbackCone
      (CommRingCat.ofHom (Ideal.Quotient.mk (I.map f)))
      (CommRingCat.ofHom (Ideal.quotientMap (I.map f) f Ideal.le_comap_map))).pt :=
  (CommRingCat.pullbackConeIsLimit _ _).lift
    (PullbackCone.mk (CommRingCat.ofHom f)
      (CommRingCat.ofHom (Ideal.Quotient.mk I)) (by ext a; rfl))

/-- The two-coordinate comparison kills exactly ker(f) intersected with I. -/
theorem commonIdealComparison_kernel {A B : Type u} [CommRing A] [CommRing B]
    (f : A →+* B) (I : Ideal A) :
    RingHom.ker (commonIdealComparison f I).hom = RingHom.ker f ⊓ I := by sorry

/-- Surjectivity asks that the image of the ideal already be an ideal. -/
theorem commonIdealComparison_surjective_iff {A B : Type u} [CommRing A] [CommRing B]
    (f : A →+* B) (I : Ideal A) :
    Function.Surjective (commonIdealComparison f I).hom ↔
      (I.map f : Set B) = f '' (I : Set A) := by sorry

/-- Ferrand's common-ideal reconstruction criterion, without domain assumptions. -/
theorem commonIdeal_isPullback_iff {A B : Type u} [CommRing A] [CommRing B]
    (f : A →+* B) (I : Ideal A)
    (himage : (I.map f : Set B) = f '' (I : Set A)) :
    IsPullback (CommRingCat.ofHom f) (CommRingCat.ofHom (Ideal.Quotient.mk I))
      (CommRingCat.ofHom (Ideal.Quotient.mk (I.map f)))
      (CommRingCat.ofHom (Ideal.quotientMap (I.map f) f Ideal.le_comap_map)) ↔
      RingHom.ker f ⊓ I = ⊥ := by sorry

/-- With I zero, even a noninjective original map is reconstructed. -/
example {A B : Type u} [CommRing A] [CommRing B] (f : A →+* B) :
    Function.Bijective (commonIdealComparison f ⊥).hom := by sorry

/-- An injective diagonal need not satisfy the image-ideal hypothesis. -/
example :
    let f := (RingHom.id (ZMod 2)).prod (RingHom.id (ZMod 2))
    ¬ Function.Surjective (commonIdealComparison f ⊤).hom := by sorry

/-- The additive difference has the sign b minus the image of the residue. -/
def commonIdealDifference {A B : Type u} [CommRing A] [CommRing B]
    (f : A →+* B) (I : Ideal A) : B × (A ⧸ I) →+ B ⧸ I.map f :=
  (Ideal.Quotient.mk (I.map f)).toAddMonoidHom.comp (AddMonoidHom.fst B (A ⧸ I)) -
    (Ideal.quotientMap (I.map f) f Ideal.le_comap_map).toAddMonoidHom.comp
      (AddMonoidHom.snd B (A ⧸ I))

/-- The common-ideal sequence is exact precisely under the literal image condition. -/
theorem commonIdeal_exact_iff {A B : Type u} [CommRing A] [CommRing B]
    (f : A →+* B) (I : Ideal A) :
    Function.Exact (fun a : A => (f a, Ideal.Quotient.mk I a))
      (commonIdealDifference f I) ↔ (I.map f : Set B) = f '' (I : Set A) := by sorry

/-- A two-term witness fixes the difference sign over the integers. -/
example : commonIdealDifference (RingHom.id ℤ) ⊥ (0, Ideal.Quotient.mk ⊥ 1) =
    -Ideal.Quotient.mk ((⊥ : Ideal ℤ).map (RingHom.id ℤ)) (1 : ℤ) := by sorry

/-- Surjectivity of the difference alone does not imply middle exactness. -/
example :
    let f := (RingHom.id (ZMod 2)).prod (RingHom.id (ZMod 2))
    Function.Surjective (commonIdealDifference f ⊤) ∧
    ¬ Function.Exact (fun a : ZMod 2 => (f a, Ideal.Quotient.mk ⊤ a))
      (commonIdealDifference f ⊤) := by sorry

end AffinePinching

/-! ## Layer 2: genus-one fibers and binary elliptic curves -/

namespace QuadraticPinch

variable {k : Type u} [Field k]

/-- Polynomials whose residue modulo q is constant. -/
def algebra (q : k[X]) : Subalgebra k k[X] :=
  (⊥ : Subalgebra k (AdjoinRoot q)).comap (AdjoinRoot.mkₐ q)

/-- The preimage description equals k plus q k[t], without separability. -/
theorem mem_algebra (q f : k[X]) :
    f ∈ algebra q ↔ ∃ c : k, ∃ h : k[X], f = C c + q * h := by sorry

/-- A quadratic pinch has the full ambient conductor (q). -/
theorem conductor (q : k[X]) (hq : q.natDegree = 2) :
    AffinePinching.conductor (algebra q).toSubring = Ideal.span {q} := by sorry

/-- Cusp and node equations are the same native five-coefficient carrier. -/
def curve (a b : k) : WeierstrassCurve k := ⟨a, -b, 0, 0, 0⟩

/-- The normalization parameter sends x to q(t), y to t q(t). -/
theorem curve_param (a b t : k) :
    (curve a b).toAffine.Equation (t ^ 2 + a * t + b)
      (t * (t ^ 2 + a * t + b)) := by sorry

/-- At q=t² the pinch contains t³ and excludes t. -/
example : X ^ 3 ∈ algebra (X ^ 2 : k[X]) ∧ X ∉ algebra (X ^ 2 : k[X]) := by sorry

/-- The split node condition requires distinct roots. -/
example (h : (2 : k) ≠ 0) (f : k[X]) :
    f ∈ algebra (X ^ 2 - 1) ↔ f.eval 1 = f.eval (-1) := by sorry

/-- The binary nonsplit node has three affine rational points. -/
example : (curve (1 : ZMod 2) 1).pointCount = 4 := by sorry

/-- A cusp is singular even though its equation has rational solutions. -/
example : (curve (0 : ZMod 2) 0).Δ = 0 ∧
    (curve (0 : ZMod 2) 0).pointCount = 3 := by sorry

/-- The rank-two polynomial normal form uses q as the new parameter. -/
theorem exists_normal_form (a b : k) (h : k[X]) :
    let q := X ^ 2 + C a * X + C b
    ∃ P Q : k[X], h = P.comp q + X * Q.comp q := by sorry

/-- The field-extension count alternates according to the quadratic branch action. -/
theorem nonsplit_pointCount {K : Type v} [Field K] [Fintype K] [Algebra (ZMod 2) K]
    (r : ℕ) (hr : 0 < r) (hcard : Fintype.card K = 2 ^ r) :
    ((curve (1 : ZMod 2) 1).map (algebraMap (ZMod 2) K)).pointCount =
      if Even r then 2 ^ r else 2 ^ r + 2 := by sorry

end QuadraticPinch

/-- The five smooth binary equation representatives, indexed by count minus one. -/
def F2Model : Fin 5 → WeierstrassCurve (ZMod 2) :=
  ![⟨0, 1, 1, 0, 1⟩, ⟨1, 1, 0, 1, 0⟩, ⟨0, 0, 1, 0, 0⟩,
    ⟨1, 0, 0, 1, 0⟩, ⟨0, 1, 1, 0, 0⟩]

/-- Smoothness is checked by the native discriminant. -/
theorem F2Model.discriminant (i : Fin 5) : (F2Model i).Δ = 1 := by sorry

/-- Point counts separate the five smooth classes. -/
theorem F2Model.pointCount (i : Fin 5) : (F2Model i).pointCount = i.val + 1 := by sorry

/-- All sixteen smooth tuples have an infinity-preserving native change to one model. -/
theorem F2Model.orbit_witnesses (W : WeierstrassCurve (ZMod 2)) (hW : W.Δ = 1) :
    ∃ i : Fin 5, ∃ V : WeierstrassCurve.VariableChange (ZMod 2), V • W = F2Model i := by sorry

/-- The five native equation orbits are disjoint. -/
theorem F2Model.orbits_disjoint (i j : Fin 5) :
    (∃ V : WeierstrassCurve.VariableChange (ZMod 2), V • F2Model i = F2Model j) ↔
      i = j := by sorry

/-- Every smooth binary equation is classified by its rational point count. -/
theorem F2Model.count_classifier (W : WeierstrassCurve (ZMod 2)) (hW : W.Δ = 1) :
    ∃! i : Fin 5, W.pointCount = i.val + 1 ∧
      ∃ V : WeierstrassCurve.VariableChange (ZMod 2), V • W = F2Model i := by sorry

/-- The one-point curve has no affine rational solution. -/
example : (¬ ∃ x y : ZMod 2, (F2Model 0).toAffine.Equation x y) ∧
    (F2Model 0).pointCount = 1 := by sorry

/-- Equal j does not identify the three supersingular binary classes. -/
example : (F2Model 0).c₄ = 0 ∧ (F2Model 4).c₄ = 0 ∧ F2Model 0 ≠ F2Model 4 := by sorry

/-- Smoothness cannot be omitted from the point-count classifier. -/
example :
    (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 2)).Δ = 0 ∧
    (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 2)).pointCount = (F2Model 2).pointCount :=
  by sorry

/-! ## Layer 4: canonical bundles, Picard lattices and global equations -/

/-- The native equation plus its five polynomial degree bounds. -/
structure BoundedWeierstrass (k : Type u) [CommRing k] where
  toCurve : WeierstrassCurve k[X]
  bound1 : toCurve.a₁.natDegree ≤ 1
  bound2 : toCurve.a₂.natDegree ≤ 2
  bound3 : toCurve.a₃.natDegree ≤ 3
  bound4 : toCurve.a₄.natDegree ≤ 4
  bound6 : toCurve.a₆.natDegree ≤ 6

/-- Reverse at the given weight, including zero coefficients above the actual degree. -/
def reverseWeight {k : Type u} [CommRing k] (i : ℕ) (p : k[X]) : k[X] :=
  ∑ n ∈ Finset.range (i + 1), C (p.coeff n) * X ^ (i - n)

/-- The inverse-chart raw equation; its degree bounds are a theorem. -/
def inverseChart {k : Type u} [CommRing k] (W : WeierstrassCurve k[X]) :
    WeierstrassCurve k[X] :=
  ⟨reverseWeight 1 W.a₁, reverseWeight 2 W.a₂, reverseWeight 3 W.a₃,
    reverseWeight 4 W.a₄, reverseWeight 6 W.a₆⟩

/-- Reversal remains bounded in its specified weight. -/
theorem reverseWeight_bound {k : Type u} [CommRing k] (i : ℕ) (p : k[X]) :
    (reverseWeight i p).natDegree ≤ i := by sorry

/-- Reversal is involutive only with the degree bound. -/
theorem reverseWeight_involutive {k : Type u} [CommRing k]
    (i : ℕ) (p : k[X]) (hp : p.natDegree ≤ i) :
    reverseWeight i (reverseWeight i p) = p := by sorry

/-- On polynomials of degree at most `i`, weight reversal is Mathlib's `Polynomial.reflect`;
above that weight `reflect` keeps a coefficient that `reverseWeight` drops. -/
theorem reverseWeight_eq_reflect {k : Type u} [CommRing k]
    (i : ℕ) (p : k[X]) (hp : p.natDegree ≤ i) :
    reverseWeight i p = Polynomial.reflect i p := by sorry

/-- The two reversals differ above the weight: `reflect` keeps `X ^ 7` at weight six. -/
example : reverseWeight 6 (X ^ 7 : ℤ[X]) ≠ Polynomial.reflect 6 (X ^ 7 : ℤ[X]) := by sorry

/-- The global discriminant transforms with weight twelve. -/
theorem inverseChart_discriminant {k : Type u} [CommRing k] (W : BoundedWeierstrass k) :
    (inverseChart W.toCurve).Δ = reverseWeight 12 W.toCurve.Δ := by sorry

/-- A bounded tuple may be singular. -/
example {k : Type u} [CommRing k] : ∃ W : BoundedWeierstrass k,
    W.toCurve = ⟨0, 0, 0, 0, 0⟩ ∧ W.toCurve.Δ = 0 := by sorry

/-- Zero has natDegree zero and obeys every nonnegative weight bound. -/
example {k : Type u} [CommRing k] : (0 : k[X]).natDegree ≤ 1 := by sorry

/-- Weight six retains the missing top coefficients of a constant. -/
example {k : Type u} [CommRing k] : reverseWeight 6 (1 : k[X]) = X ^ 6 := by sorry

/-- The highest-weight monomial becomes constant. -/
example {k : Type u} [CommRing k] : reverseWeight 6 (X ^ 6 : k[X]) = 1 := by sorry

/-- The highest-weight coefficient is the constant on the inverse chart. -/
example {k : Type u} [CommRing k] :
    (inverseChart (⟨X, 0, 0, 0, X ^ 6⟩ : WeierstrassCurve k[X])).a₆ = 1 := by sorry

/-- Weight reversal loses terms above its bound. -/
example : inverseChart (inverseChart (⟨0, 0, 0, 0, X ^ 7⟩ :
    WeierstrassCurve ℤ[X])) ≠ ⟨0, 0, 0, 0, X ^ 7⟩ := by sorry

/-- Fiber and zero-section intersections determine an integral unimodular plane. -/
def fiberSectionGram : Matrix (Fin 2) (Fin 2) ℤ := !![0, 1; 1, -1]

/-- Its determinant has the sign fixed by the section square minus one. -/
theorem fiberSectionGram_det : fiberSectionGram.det = -1 := by sorry

/-- A two-term vector witnesses the odd plane. -/
example : fiberSectionGram 1 1 = -1 := by sorry

/-- The fiber pairs positively with its section. -/
example : fiberSectionGram 0 1 = 1 ∧ fiberSectionGram 0 0 = 0 := by sorry

/-! ## Layer 5: Frobenius, graphs and Picard constancy -/

/-- The resolved rank-ten surface's maximal point-count expression. -/
def rationalSurfaceCount (q : ℕ) : ℕ := 1 + 10 * q + q ^ 2

/-- The binary point-count threshold is twenty-five. -/
example : rationalSurfaceCount 2 = 25 := by sorry

/-- The formula is only a numerical expression at zero, not a field-size assertion. -/
example : rationalSurfaceCount 0 = 1 := by sorry

/-- Three small fibers cannot achieve the binary threshold. -/
theorem small_fiber_bound : 10 + 7 + 7 < rationalSurfaceCount 2 := by sorry

/-! ## Layer 6: fourteen resolved-model certificates -/

/-- Raw native equations; indices zero through thirteen denote models one through fourteen. -/
def rawCandidates : Fin 14 → WeierstrassCurve (ZMod 2)[X] :=
  ![⟨X, X, X ^ 2, X ^ 4, X ^ 5 + X ^ 6⟩,
    ⟨X, 0, 0, X ^ 3, X ^ 5 + X ^ 6⟩,
    ⟨X, 0, 0, X ^ 3, 0⟩,
    ⟨X, X ^ 2, 0, X ^ 3, 0⟩,
    ⟨X, 0, 0, 0, X ^ 5⟩,
    ⟨X, X ^ 2, 0, 0, X ^ 5⟩,
    ⟨X, X, 0, X ^ 4, 0⟩,
    ⟨X, X, X, X, 0⟩,
    ⟨0, X, X ^ 2, 0, 0⟩,
    ⟨0, 0, X ^ 2, X ^ 3, 0⟩,
    ⟨0, 0, X ^ 2, 0, 0⟩,
    ⟨X, 1, X ^ 3, 0, 0⟩,
    ⟨X, X, X ^ 3, 0, 0⟩,
    ⟨X, X ^ 2, X ^ 2, 0, 0⟩]

/-- All fourteen raw tuples have the five promised bounds. -/
theorem rawCandidates_bounded (i : Fin 14) :
    (rawCandidates i).a₁.natDegree ≤ 1 ∧ (rawCandidates i).a₂.natDegree ≤ 2 ∧
    (rawCandidates i).a₃.natDegree ≤ 3 ∧ (rawCandidates i).a₄.natDegree ≤ 4 ∧
    (rawCandidates i).a₆.natDegree ≤ 6 := by sorry

/-- Raw tuple inequality is weaker than geometric nonequivalence. -/
theorem rawCandidates_injective : Function.Injective rawCandidates := by sorry

/-- The missing I₂* example is a definite native equation. -/
example : rawCandidates 11 = ⟨X, 1, X ^ 3, 0, 0⟩ ∧
    (rawCandidates 11).Δ = X ^ 10 := by sorry

/-- The I₃* example has discriminant exponent eleven. -/
example : (rawCandidates 12).Δ = X ^ 11 := by sorry

/-- The remaining IV* example also has a nonrational discriminant factor. -/
example : (rawCandidates 13).Δ = X ^ 8 * (X ^ 2 + X + 1) := by sorry

/-- The first model's binary invariant has c4=t4 and discriminant t8. -/
theorem model_one_invariants : (rawCandidates 0).c₄ = X ^ 4 ∧
    (rawCandidates 0).Δ = X ^ 8 := by sorry

/-- The three zero-j tuples have c4 zero and nonzero discriminant t8. -/
theorem zero_j_model_invariants (i : Fin 3) :
    let W := rawCandidates ⟨i.val + 8, by omega⟩
    W.c₄ = 0 ∧ W.Δ = X ^ 8 := by sorry

/-! ## Layer 7: finite equivalence and completeness -/

/-- A coefficient polynomial of prescribed weight, built from its complete vector. -/
def coefficientPolynomial {k : Type u} [CommRing k] (n : ℕ) (c : Fin (n + 1) → k) :
    k[X] := ∑ j : Fin (n + 1), C (c j) * X ^ j.val

/-- Coefficient-vector evaluation is injective. -/
theorem coefficientPolynomial_injective {k : Type u} [CommRing k] (n : ℕ) :
    Function.Injective (coefficientPolynomial (k := k) n) := by sorry

/-- These vectors parametrize exactly the polynomials obeying the bound. -/
theorem coefficientPolynomial_range {k : Type u} [CommRing k] (n : ℕ) (p : k[X]) :
    (∃ c, coefficientPolynomial n c = p) ↔ p.natDegree ≤ n := by sorry

/-- The zero vector gives the zero polynomial at every weight. -/
example (n : ℕ) : coefficientPolynomial (k := ZMod 2) n (fun _ => 0) = 0 := by sorry

/-- The vector (1,0) is constant; its weight-one reversal is t. -/
example : coefficientPolynomial 1 (![1, 0] : Fin 2 → ZMod 2) = 1 ∧
    reverseWeight 1 (coefficientPolynomial 1 (![1, 0] : Fin 2 → ZMod 2)) = X := by sorry

/-- The normalized binary coefficient space has a2 zero by construction. -/
abbrev NormalizedCoefficients :=
  (Fin 2 → ZMod 2) × (Fin 4 → ZMod 2) × (Fin 5 → ZMod 2) × (Fin 7 → ZMod 2)

/-- Real native equation attached to a complete normalized coefficient vector. -/
def normalizedEquation (c : NormalizedCoefficients) : WeierstrassCurve (ZMod 2)[X] :=
  ⟨coefficientPolynomial 1 c.1, 0, coefficientPolynomial 3 c.2.1,
    coefficientPolynomial 4 c.2.2.1, coefficientPolynomial 6 c.2.2.2⟩

/-- Normalization leaves exactly 2^18 raw tuples, including singular ones. -/
theorem normalizedCoefficients_card : Fintype.card NormalizedCoefficients = 2 ^ 18 := by sorry

/-- This is a coefficient space, not a space of elliptic surfaces. -/
example : (normalizedEquation (0, 0, 0, 0)).Δ = 0 := by sorry

/-- Every normalized equation has the prescribed absent coefficient. -/
example (c : NormalizedCoefficients) : (normalizedEquation c).a₂ = 0 := by sorry

/-- The vector count factors as 4 times 16 times 32 times 128. -/
example : Fintype.card NormalizedCoefficients = 4 * 16 * 32 * 128 := by sorry

/-- Translate x by a2 in characteristic two; no inverse or division is needed. -/
def normalizeA2 (W : WeierstrassCurve (ZMod 2)[X]) : WeierstrassCurve (ZMod 2)[X] :=
  ⟨W.a₁, 0, W.a₃ + W.a₁ * W.a₂, W.a₄ + W.a₂ ^ 2,
    W.a₆ + W.a₂ * W.a₄ + W.a₂ ^ 2 * W.a₂ + W.a₂ ^ 3⟩

/-- The normalization is an actual native admissible coordinate change. -/
theorem normalizeA2_variableChange (W : WeierstrassCurve (ZMod 2)[X]) :
    (⟨1, W.a₂, 0, 0⟩ : WeierstrassCurve.VariableChange (ZMod 2)[X]) • W =
      normalizeA2 W := by sorry

/-- Normalization preserves the global coefficient bounds. -/
theorem normalizeA2_bounded (W : BoundedWeierstrass (ZMod 2)) :
    (normalizeA2 W.toCurve).a₁.natDegree ≤ 1 ∧
    (normalizeA2 W.toCurve).a₂.natDegree ≤ 2 ∧
    (normalizeA2 W.toCurve).a₃.natDegree ≤ 3 ∧
    (normalizeA2 W.toCurve).a₄.natDegree ≤ 4 ∧
    (normalizeA2 W.toCurve).a₆.natDegree ≤ 6 := by sorry

/-- A2 vanishes after normalization and normalizing twice changes nothing. -/
example (W : WeierstrassCurve (ZMod 2)[X]) :
    (normalizeA2 W).a₂ = 0 ∧ normalizeA2 (normalizeA2 W) = normalizeA2 W := by sorry

/-- Nonzero a2 changes the other coefficients; dropping it alone is incorrect. -/
example : normalizeA2 (⟨X, X, 0, 0, 0⟩ : WeierstrassCurve (ZMod 2)[X]) =
    ⟨X, 0, X ^ 2, X ^ 2, 0⟩ := by sorry

/-- Global translation parameters have weights 1,2,3. -/
abbrev AdmissibleParameters :=
  (Fin 2 → ZMod 2) × (Fin 3 → ZMod 2) × (Fin 4 → ZMod 2)

/-- Construct the native variable change from s,r,q in their stated order. -/
def admissibleChange (c : AdmissibleParameters) :
    WeierstrassCurve.VariableChange (ZMod 2)[X] :=
  ⟨1, coefficientPolynomial 2 c.2.1,
    coefficientPolynomial 1 c.1, coefficientPolynomial 3 c.2.2⟩

/-- There are 512 translation triples, before six base automorphisms. -/
theorem admissibleParameters_card : Fintype.card AdmissibleParameters = 512 := by sorry

/-- Zero parameters give the identity native change. -/
example : admissibleChange (0, 0, 0) = 1 := by sorry

/-- The middle parameter is r, rather than the y-slope s. -/
example : (admissibleChange (0, (![0, 1, 0] : Fin 3 → ZMod 2), 0)).r = X ∧
    (admissibleChange (0, (![0, 1, 0] : Fin 3 → ZMod 2), 0)).s = 0 := by sorry

/-
The Layer 3 targets (multiple-fiber isogenies and the local LLR comparison) have no
carriers at the pins and live in the README. The README also defines the following
objects whose geometric or comparison constructions are not represented here:
GeometricPushout, FerrandPushout, GenusOneFibration, FiberTypeDivisor, HasGeometricKodairaFiber,
DegenerateFiber, CandidateEquation, conductorIdealSheaf, conductorMap,
QuadraticPinch.coordinates, QuadraticPinch.presentationEquiv,
QuadraticPinch.affineParamEquiv, AffinePinching.commonIdealAwayEquiv,
QuadraticPinch.residueCokernelEquiv_over_k, QuadraticPinch.InfinityChart.curve,
QuadraticPinch.Overlap.equiv, QuadraticPinch.Overlap.chartEquiv,
QuadraticPinch.Global.curve, QuadraticPinch.Global.normalizationChart,
QuadraticPinch.Global.normalizationSource, QuadraticPinch.Global.normalization,
QuadraticPinch.Global.structureMap, QuadraticPinch.Global.infinityTransition,
QuadraticPinch.Global.normalizationPartialIso, QuadraticPinch.polynomialBasis,
QuadraticPinch.polynomialHomEquivRoots, QuadraticPinch.Global.relativeNormalization,
QuadraticPinch.Global.relativeNormalizationSectionsIso,
QuadraticPinch.Global.relativeNormalizationDesc,
QuadraticPinch.Global.normalizationFunctionFieldMap,
QuadraticPinch.Global.absoluteNormalizationComparison,
QuadraticPinch.Global.normalizationSectionsClosureEquiv,
QuadraticPinch.Global.absoluteSectionsClosureEquiv,
QuadraticPinch.Global.absoluteNormalizationSourceSectionsEquiv,
QuadraticPinch.Global.absoluteNormalizationComparisonSectionsAlgEquiv,
AffinePinching.commonIdealEquiv, FerrandPushout.conductorSectionsIso,
FerrandPushout.conductorSectionDifference, FerrandPushout.conductorSheafComparison,
FerrandPushout.conductorOpenSectionsIso, FerrandPushout.conductorAdditiveShortComplex,
FerrandPushout.conductorSpecDesc, FerrandPushout.conductorGlobalDesc,
FerrandPushout.conductorSchemeDesc, FerrandPushout.conductorCokernelBaseChange,
FerrandPushout.conductorCokernelMap, FerrandPushout.conductorCokernelRightBaseChange,
FerrandPushout.conductorTargetBaseChangeIso, FerrandPushout.conductorSourceBaseChangeIso,
FerrandPushout.conductorTargetTowerIso, FerrandPushout.conductorSourceTowerIso,
ResolvedModelCertificate, FiniteRejectionCertificate and FibrationEquivalence.
Their full definitions, API, hypotheses and checks remain in the README.
-/

/-
Pinned suppliers cited in the README:
discriminant_typeE₆RootLattice, pointCount_eq_card_point.
Further API targets specified in the README, with their hypotheses and checks:
§1.2:
AffinePinching.conductor_adjoin, AffinePinching.conductor_away_bijective, AffinePinching.conductor_le,
AffinePinching.conductor_mono.
§1.12:
AffinePinching.commonIdealComparison_bijective_iff, commonIdealComparison_fst, commonIdealComparison_snd,
commonIdealComparison_surjective, commonIdealComparison_unique.
§1.13:
conductor_eq_annihilator.
§1.14:
conductor_flat_baseChange.
§1.15:
conductor_localization.
§1.17:
conductor_affine_quotients.
§1.18:
conductor_global_geometric.
§1.19:
conductor_global_isPushout.
§1.20:
conductor_global_flat_comparison.
§1.21:
AffinePinching.commonIdealAwayEquiv_algebraMap, AffinePinching.commonIdealAwayEquiv_apply,
AffinePinching.commonIdealAwayEquiv_symm_algebraMap, AffinePinching.commonIdealAwayEquiv_symm_of_mul,
AffinePinching.commonIdeal_away_bijective, AffinePinching.commonIdeal_kill_kernel.
§1.22:
AffinePinching.commonIdealEquiv_apply, AffinePinching.commonIdealEquiv_inverse_fst,
AffinePinching.commonIdealEquiv_inverse_snd, AffinePinching.commonIdealEquiv_inverse_unique,
AffinePinching.conductorRing_image_comap, AffinePinching.conductorRing_map_comap.
§1.23:
AffinePinching.commonIdealDiagonal_injective_iff, AffinePinching.commonIdealDifference_apply,
AffinePinching.commonIdealDifference_surjective, AffinePinching.commonIdeal_exact.
§2.25:
F2Model.point_group.
§2.26:
QuadraticPinch.finite_normalization, QuadraticPinch.moduleCoefficients_fst,
QuadraticPinch.moduleCoefficients_reconstruct, QuadraticPinch.moduleCoefficients_snd,
QuadraticPinch.module_generator_map_not_injective, QuadraticPinch.normalization_module_finite,
QuadraticPinch.normalization_remainder, QuadraticPinch.normalization_span,
QuadraticPinch.normalization_spec_finite, QuadraticPinch.pinch_spanning, QuadraticPinch.relation_eval,
QuadraticPinch.relation_origin, QuadraticPinch.relation_quadratic, QuadraticPinch.remainder_scalar,
QuadraticPinch.residue_kernel, QuadraticPinch.residue_normal_form, QuadraticPinch.residue_surjective,
QuadraticPinch.scalar_unique, QuadraticPinch.tangent_branches.
§2.27:
QuadraticPinch.proper_point_pushout.
§2.28:
QuadraticPinch.i1_genus.
§2.29:
QuadraticPinch.i2_genus.
§2.31:
QuadraticPinch.affine_card_balance, QuadraticPinch.extension_counts, QuadraticPinch.frobeniusTrace_branch,
QuadraticPinch.frobeniusTrace_extension_parity, QuadraticPinch.frobeniusTrace_roots,
QuadraticPinch.pointCount_balance, QuadraticPinch.pointCount_branch,
QuadraticPinch.pointCount_extension_parity, QuadraticPinch.pointCount_extension_power,
QuadraticPinch.pointCount_field_map, QuadraticPinch.quadraticRootCount_branch,
QuadraticPinch.quadraticRootCount_extension_parity, QuadraticPinch.quadratic_root_iff_even.
§2.32:
QuadraticPinch.constant_remainder, QuadraticPinch.linear_remainder, QuadraticPinch.normal_form_degrees,
QuadraticPinch.normal_form_injective.
§2.33:
QuadraticPinch.basis_degrees, QuadraticPinch.basis_inl, QuadraticPinch.basis_inr,
QuadraticPinch.basis_reconstruction, QuadraticPinch.basis_repr, QuadraticPinch.coordinateMap_bijective,
QuadraticPinch.coordinateMap_coe, QuadraticPinch.coordinates_coe,
QuadraticPinch.coordinates_symm_normal_form, QuadraticPinch.coordinates_unique,
QuadraticPinch.pinch_normal_form_injective, QuadraticPinch.quadratic_natDegree.
§2.34:
QuadraticPinch.inV_U, QuadraticPinch.inV_V, QuadraticPinch.inV_relation, QuadraticPinch.inV_relation_monic,
QuadraticPinch.inV_relation_natDegree, QuadraticPinch.inV_remainder_normal_form,
QuadraticPinch.presentationEquiv_generators, QuadraticPinch.presentationEquiv_mk,
QuadraticPinch.presentationEquiv_symm_substitution, QuadraticPinch.substitutionToAlgebra_coe,
QuadraticPinch.substitutionToAlgebra_ker, QuadraticPinch.substitutionToAlgebra_surjective,
QuadraticPinch.substitution_eq_zero_iff_dvd, QuadraticPinch.substitution_inV,
QuadraticPinch.substitution_ker, QuadraticPinch.substitution_range, QuadraticPinch.substitution_relation.
§2.35:
QuadraticPinch.affineParamEquiv_nonzero, QuadraticPinch.affineParamEquiv_origin,
QuadraticPinch.affineParamEquiv_symm_none, QuadraticPinch.affineParamEquiv_symm_some,
QuadraticPinch.affine_zero_x, QuadraticPinch.parameter_equation, QuadraticPinch.parameter_recovery.
§2.36:
QuadraticPinch.away_bijective.
§2.37:
QuadraticPinch.away_inverse_generator.
§2.38:
QuadraticPinch.fractionEquiv_algebraMap, QuadraticPinch.fractionEquiv_symm_X,
QuadraticPinch.fractionEquiv_symm_algebraMap, QuadraticPinch.fraction_ring, QuadraticPinch.integral_closure,
QuadraticPinch.integral_iff_polynomial.
§2.39:
QuadraticPinch.conductor_image_span, QuadraticPinch.conductor_span_restrictScalars,
QuadraticPinch.normalization_image_span, QuadraticPinch.normalization_quotient_annihilator,
QuadraticPinch.normalization_quotient_annihilator_mem, QuadraticPinch.normalization_quotient_finrank,
QuadraticPinch.normalization_quotient_generator_ne_zero,
QuadraticPinch.normalization_quotient_reconstruction, QuadraticPinch.normalization_quotient_scalar_action,
QuadraticPinch.normalization_span_restrictScalars, QuadraticPinch.residueCokernelEquiv_annihilator,
QuadraticPinch.residueCokernelEquiv_apply, QuadraticPinch.residueCokernelEquiv_over_k_apply,
QuadraticPinch.residueCokernelEquiv_over_k_symm_apply, QuadraticPinch.residueCokernelEquiv_scalar_action,
QuadraticPinch.residueCokernelEquiv_symm_apply, QuadraticPinch.residueCokernelMap_apply,
QuadraticPinch.residueCokernelMap_ker, QuadraticPinch.residueCokernelMap_surjective.
§2.52:
QuadraticPinch.parameterHom_coe, QuadraticPinch.parameterHom_coordinates,
QuadraticPinch.parameterHom_injective, QuadraticPinch.parameter_smul, QuadraticPinch.polynomialBasis_one,
QuadraticPinch.polynomialBasis_repr, QuadraticPinch.polynomialBasis_square,
QuadraticPinch.polynomialBasis_zero, QuadraticPinch.polynomialBasis_zero_eq_one,
QuadraticPinch.polynomialCoordinates_coe, QuadraticPinch.polynomialCoordinates_inverse,
QuadraticPinch.polynomialCoordinates_inverse_mul, QuadraticPinch.polynomialCoordinates_mul,
QuadraticPinch.polynomialCoordinates_reconstruction, QuadraticPinch.polynomialCoordinates_smul,
QuadraticPinch.polynomialModule_finite, QuadraticPinch.polynomialModule_finrank,
QuadraticPinch.polynomialModule_flat, QuadraticPinch.polynomialModule_free,
QuadraticPinch.polynomialProduct_unit.
§2.53:
QuadraticPinch.polynomialEvaluation_apply, QuadraticPinch.polynomialEvaluation_mul,
QuadraticPinch.polynomialEvaluation_parameter, QuadraticPinch.polynomialHomEquivRoots_apply,
QuadraticPinch.polynomialHomEquivRoots_parameter, QuadraticPinch.polynomialHomEquivRoots_symm_apply,
QuadraticPinch.polynomialHom_relation, QuadraticPinch.polynomialLift_apply,
QuadraticPinch.polynomialLift_basis, QuadraticPinch.polynomialLift_unique.
§2.54:
QuadraticPinch.quadratic_normalization_inclusion_not_surjective.
§3.11:
curve_picardRanks_euler.
§4.10:
inverseChart_inverseChart.
§7.1:
normalizedEquation_injective.
-/

end

end TauCetiRoadmap.NeronModelsAndSemistableAbelianVarietiesPartII

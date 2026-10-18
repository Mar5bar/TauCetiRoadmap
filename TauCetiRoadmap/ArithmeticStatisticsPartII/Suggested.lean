import Mathlib

/-!
# Arithmetic statistics, Part II: representative target signatures

The accompanying README is the full specification, with source locators and exact
supplier contracts. This file gives suggested forms, not an exhaustive checklist: light definitions
and selected milestones on the pinned carriers. Counts retain the specified cutoffs and denominators; orbit,
moduli, covering and arithmetic probability constructions remain README targets.
-/

noncomputable section
open scoped BigOperators Topology
open Polynomial Filter

namespace TauCetiRoadmap.ArithmeticStatisticsPartII

/-! ## Layer 1: Integral orbit dictionaries -/

namespace BinaryQuartic
/-- Monicization in the five descending ordinary coefficients of a binary quartic. -/
def monicize {R : Type*} [CommRing R] (f : Fin 5 → R) : Fin 5 → R :=
  ![1, f 1, f 0 * f 2, f 0 ^ 2 * f 3, f 0 ^ 3 * f 4]

example : monicize (![2,3,5,7,11] : Fin 5 → ℤ) = ![1,3,10,28,88] := by sorry
example : monicize (![0,3,5,7,11] : Fin 5 → ℤ) = ![1,3,0,0,0] := by sorry
example (b c d e : ℤ) : monicize (![1,b,c,d,e] : Fin 5 → ℤ) = ![1,b,c,d,e] := by sorry
end BinaryQuartic

namespace ArithmeticOrbitRefinement

/-- Plücker coordinates of the two rows in the quartic coefficient convention. -/
def quarticMinors (M : Matrix (Fin 2) (Fin 6) ℤ) : Matrix (Fin 6) (Fin 6) ℤ :=
  fun i j => M 0 i * M 1 j - M 0 j * M 1 i

/-- Changing the two row generators scales every minor by the determinant. -/
theorem quarticMinors_mul (h : Matrix (Fin 2) (Fin 2) ℤ)
    (M : Matrix (Fin 2) (Fin 6) ℤ) :
    quarticMinors (h * M) = fun i j => h.det * quarticMinors M i j := by sorry

example : quarticMinors (0 : Matrix (Fin 2) (Fin 6) ℤ) = 0 := by sorry
example (M : Matrix (Fin 2) (Fin 6) ℤ) (i j : Fin 6) :
    quarticMinors M j i = -quarticMinors M i j := by sorry

example : quarticMinors (fun i j => if i = 0 then (if j = 0 then 1 else 0)
    else (if j = 1 then 1 else 0)) 0 1 = 1 := by sorry

section Pencil
variable {R : Type*} [CommRing R]
/-- Signed characteristic polynomial of a pair, retaining its prescribed matrix size. -/
private def pencilPoly {n : ℕ} (A B : Matrix (Fin n) (Fin n) R) : R[X] :=
  (-1)^(n*(n-1)/2) * Matrix.det (fun i j => C (A i j) * X - C (B i j))
/-- BGW §2, p.6: descending x-degree, signed determinant of xA-yB. -/
def pencilInvariant {n : ℕ} (A B : Matrix (Fin n) (Fin n) R) : Fin (n+1) → R :=
  fun i => (pencilPoly A B).coeff (n-i.val)
/-- Simultaneous congruence scales the invariant by the square determinant. -/
theorem pencilInvariant_congr {n : ℕ} (A B g : Matrix (Fin n) (Fin n) R) :
    pencilInvariant (g * A * g.transpose) (g * B * g.transpose) =
      fun i => g.det^2 * pencilInvariant A B i := by sorry
/-- Scalar pencils recover the coefficients of the signed power of a linear form. -/
theorem pencilInvariant_scalar {n : ℕ} (a b : R) :
    pencilInvariant (a • (1 : Matrix (Fin n) (Fin n) R)) (b • 1) =
      fun i => ((-1 : R[X])^(n*(n-1)/2) * (C a * X - C b)^n).coeff (n-i.val) := by sorry
example (a b : R) : pencilInvariant (!![a]) (!![b]) = ![a,-b] := by sorry
example : pencilInvariant (1 : Matrix (Fin 3) (Fin 3) ℤ) 0 = ![-1,0,0,0] := by sorry
example {n : ℕ} (hn : 1 ≤ n) :
    pencilInvariant (0 : Matrix (Fin n) (Fin n) R) 0 = 0 := by sorry

/-- Empty determinants give the constant one, even for the zero pencil. -/
example : pencilInvariant (0 : Matrix (Fin 0) (Fin 0) ℤ) 0 = ![1] := by sorry

example : pencilPoly (1 : Matrix (Fin 1) (Fin 1) ℤ) 0 = X := by sorry

end Pencil

section Isotropic
variable {K : Type*} [Field K]
/-- Coordinate bilinear pairing; in characteristic two this is not a quadratic refinement. -/
private def pairing {n : ℕ} (A : Matrix (Fin n) (Fin n) K) (u v : Fin n → K) : K :=
  ∑ i, ∑ j, u i * A i j * v j
/-- BGW §4, p.12: rank r is vector dimension, not projective dimension. -/
def commonIsotropic {n : ℕ} (r : ℕ) (A B : Matrix (Fin n) (Fin n) K) :
    Set (Submodule K (Fin n → K)) :=
  {U | Module.finrank K U = r ∧
    ∀ u ∈ U, ∀ v ∈ U, pairing A u v = 0 ∧ pairing B u v = 0}

example (U : Submodule K (Fin 3 → K)) (h : Module.finrank K U = 1) :
    U ∈ commonIsotropic 1 (0 : Matrix (Fin 3) (Fin 3) K) 0 := by sorry
example : commonIsotropic 1 (1 : Matrix (Fin 3) (Fin 3) ℝ) 0 = ∅ := by sorry
example : pairing (1 : Matrix (Fin 1) (Fin 1) ℝ) (fun _ => 2) (fun _ => 3) = 6 := by sorry
example : (⊥ : Submodule K (Fin 0 → K)) ∈
    commonIsotropic 0 (0 : Matrix (Fin 0) (Fin 0) K) 0 := by sorry
example (u v : Fin 0 → K) : pairing (0 : Matrix (Fin 0) (Fin 0) K) u v = 0 := by sorry
example : pairing (!![2] : Matrix (Fin 1) (Fin 1) ℚ) ![3] ![5] = 30 := by sorry

/-- In characteristic two, diagonal quadratic vanishing misses mixed bilinear values. -/
example : (⊤ : Submodule (ZMod 2) (Fin 2 → ZMod 2)) ∉
    commonIsotropic 2 (!![0,1;1,0]) 0 := by sorry

/-- A rank larger than the ambient dimension is excluded, even for the zero pencil. -/
example : commonIsotropic 3 (0 : Matrix (Fin 2) (Fin 2) ℚ) 0 = ∅ := by sorry


end Isotropic
end ArithmeticOrbitRefinement

namespace Cubic
/-- Divided coefficients represent ax³+3bx²y+3cxy²+dy³; ordinary Δ is −27 times this. -/
def normalizedDisc {R : Type*} [CommRing R] (v : Fin 4 → R) : R :=
  v 0 ^ 2 * v 3 ^ 2 - 6 * v 0 * v 1 * v 2 * v 3 - 3 * v 1 ^ 2 * v 2 ^ 2 +
    4 * v 0 * v 2 ^ 3 + 4 * v 1 ^ 3 * v 3

/-- Coefficient scaling has degree four, in every characteristic. -/
theorem normalizedDisc_smul {R : Type*} [CommRing R] (u : R) (v : Fin 4 → R) :
    normalizedDisc (fun i => u * v i) = u ^ 4 * normalizedDisc v := by sorry

/-- The ordinary coefficient convention gives the discriminant of the affine cubic. -/
theorem ordinaryDisc_eq {K : Type*} [Field K] (v : Fin 4 → K) (ha : v 0 ≠ 0) :
    (C (v 0) * X ^ 3 + C (3 * v 1) * X ^ 2 + C (3 * v 2) * X + C (v 3)).discr =
      -27 * normalizedDisc v := by sorry

example (s : ℚ) : normalizedDisc ![0,1,0,s/4] = s := by sorry
example : normalizedDisc (![1,0,0,1] : Fin 4 → ℤ) = 1 ∧
    (X ^ 3 + 1 : ℤ[X]).discr = -27 := by sorry
example : normalizedDisc (![1,0,0,0] : Fin 4 → ℤ) = 0 := by sorry
example : normalizedDisc (![0,1,0,1] : Fin 4 → ℚ) = 4 ∧
    (C 3 * X ^ 2 + 1 : ℚ[X]).discr = -12 := by sorry
example : normalizedDisc (![1,0,0,1] : Fin 4 → ZMod 3) = 1 ∧
    (X ^ 3 + 1 : (ZMod 3)[X]).discr = 0 := by sorry
example : normalizedDisc (![1,0,0,1] : Fin 4 → ZMod 2) = 1 ∧
    (X ^ 3 + 1 : (ZMod 2)[X]).discr = 1 := by sorry
end Cubic

namespace BinaryQuartic
/-- The resolvent discriminant uses 729 times the ordinary quartic discriminant. -/
example : (X ^ 3 - C 9 * X : ℚ[X]).discr = 2916 ∧
    (X ^ 3 - C 9 * X : ℚ[X]).discr ≠ 27 * 4 := by sorry

/-- For x⁴−y⁴, the quartic covariant resultant is 81Δ². -/
example : (X ^ 4 - 1 : ℚ[X]).resultant (C 48 * X ^ 2) = 5308416 := by sorry

/-- For x⁴−y⁴, the sextic covariant resultant is Δ³. -/
example : (X ^ 4 - 1 : ℚ[X]).resultant (-C 32 * X * (X ^ 4 + 1)) =
    -16777216 := by sorry

/-- Trace-zero representatives describe nonidentity quartic self-equivalences. -/
example : (1 : Matrix (Fin 2) (Fin 2) ℚ).trace = 2 ∧
    ( !![1,0;0,-1] : Matrix (Fin 2) (Fin 2) ℚ).trace = 0 ∧
    ( !![1,0;0,-1] : Matrix (Fin 2) (Fin 2) ℚ) ^ 2 = 1 := by sorry
end BinaryQuartic

/-! For g=1 the signed-minor coefficient determinant is Q. These matrices record
its values for the standard blocks and the two adapted completions in the README. -/
example : ( !![0,-1;-1,0] : Matrix (Fin 2) (Fin 2) ℤ).det = -1 ∧
    ( !![0,1;1,0] : Matrix (Fin 2) (Fin 2) ℤ).det = -1 ∧
    ( !![0,1;-1,0] : Matrix (Fin 2) (Fin 2) ℤ).det = 1 := by sorry

/-!
The README also specifies the arithmetic and geometric constructions whose
carriers are not assumed here: based cubic index forms and normal bases;
Davenport–Heilbronn selectors; integer-valued ternary quadratic forms and their
pairs; quartic rings and quadratic cubic-resolvent maps; alternating quintuples
and quadruples, Pfaffian covariants, quintic multiplication and based sextic
resolvents, quinticComplexRealization and quinticRationalRealization;
monogenized cubic resolvents; binary-quartic orbit actions, solubility,
covariants, the cubic invariant, point quartics and projected ternary cubics;
ternary cubic invariants; Veronese orbit embedding; oriented ideal triples and
norm pairs; the regular-pencil Fano and generalized Picard constructions;
weak-discriminant loci, Q and marked Q; genus-one degree-three, four and five
covering dictionaries; three-isogeny mirror algebras and integral multiplicities.
Their APIs, hypotheses and Checks remain in the README. The signed polynomial
pencil invariant above specializes the earlier-part symmetric-pencil interface.

README-only API targets, grouped by their mathematical namespace:
ArithmeticOrbitRefinement:
  basedSexticResolvent_disc, basedSexticResolvent_self, commonIsotropic_congr.
  commonIsotropic_zero, markedQ_equivariant, markedQ_independent.
  monogenizing_adjoin, monogenizing_translate, normPair_sign_iff.
  orbitTriple_rescale, qHyperdeterminant_scale, qHyperdeterminant_sl2.
  qHyperdeterminant_transform, quarticMinors_plucker, quarticMinors_swap.
  quinticCoeff_scale, quinticRing_add, sexticRing_add.
  sextic_discriminant, weak_strong_exclusive.
BinaryQuartic:
  cubicInvariant_eq_mk, cubicInvariant_map, cubicInvariant_quarticOfPoint_eq_mu.
  disc_embed, embed_injective, embed_smul.
  exists_sextic_ne_zero, exists_unique_normalized, hessian_eq_neg_third_hessianDet.
  hessian_twistedSMul, invI_pgl_smul, invI_quarticOfPoint.
  invJ_pgl_smul, invJ_quarticOfPoint, isLocallySolubleQ_iff.
  isLocallySoluble_iff, isSoluble_of_eval_eq_zero, isSoluble_of_isSquare_a.
  isSoluble_pgl_smul, isSoluble_quarticOfPoint, isUnit_irrationalCovariant.
  mem_range_embed_iff, mem_selmerGroup₂_iff, monicize_a.
  monicize_eq_self, monicize_invariants, monicize_twist.
  norm_irrationalCovariant, pgl_orbits_eq_gl_orbits_int, pgl_smul_mk.
  quarticOfPoint_neg, resolventForm_embed, rho_det.
  sextic_twistedSMul, veroneseForm_comp_rho.
-/

end TauCetiRoadmap.ArithmeticStatisticsPartII

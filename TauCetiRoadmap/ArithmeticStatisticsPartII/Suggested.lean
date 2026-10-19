import Mathlib

/-!
# Arithmetic statistics, Part II: representative target signatures

The accompanying README is the full specification, with source locators and exact
supplier contracts. This file gives suggested forms, not an exhaustive checklist:
light coordinate definitions and milestones on the pinned carriers. Ring-resolvent,
moduli, covering and Selmer orbit constructions are specified in the README.
-/

noncomputable section
open scoped BigOperators Topology
open Polynomial Filter

namespace TauCetiRoadmap.ArithmeticStatisticsPartII

/-! ## Coordinate conventions -/

namespace BinaryQuartic
/-- Monicization in the five descending ordinary coefficients of a binary quartic. -/
def monicize {R : Type*} [CommRing R] (f : Fin 5 → R) : Fin 5 → R :=
  ![1, f 1, f 0 * f 2, f 0 ^ 2 * f 3, f 0 ^ 3 * f 4]

end BinaryQuartic

namespace ArithmeticOrbitRefinement
/-- Plücker coordinates of the two rows in the quartic coefficient convention. -/
def quarticMinors (M : Matrix (Fin 2) (Fin 6) ℤ) : Matrix (Fin 6) (Fin 6) ℤ :=
  fun i j => M 0 i * M 1 j - M 0 j * M 1 i


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

end Isotropic
end ArithmeticOrbitRefinement

namespace Cubic
/-- Integral symmetric-trilinear substitution, with row-vector changes of variables. -/
def dividedSubst {R : Type*} [CommRing R]
    (g : Matrix (Fin 2) (Fin 2) R) (v : Fin 4 → R) : Fin 4 → R :=
  let r := g 0 0; let s := g 0 1; let t := g 1 0; let u := g 1 1
  let a := v 0; let b := v 1; let c := v 2; let d := v 3
  ![a*r^3 + 3*b*r^2*s + 3*c*r*s^2 + d*s^3,
    a*r^2*t + b*(r^2*u + 2*r*t*s) + c*(2*r*s*u + t*s^2) + d*s^2*u,
    a*r*t^2 + b*(2*r*t*u + t^2*s) + c*(r*u^2 + 2*t*s*u) + d*s*u^2,
    a*t^3 + 3*b*t^2*u + 3*c*t*u^2 + d*u^3]


/-- Divided coefficients represent ax³+3bx²y+3cxy²+dy³; ordinary Δ is −27 times this. -/
def normalizedDisc {R : Type*} [CommRing R] (v : Fin 4 → R) : R :=
  v 0 ^ 2 * v 3 ^ 2 - 6 * v 0 * v 1 * v 2 * v 3 - 3 * v 1 ^ 2 * v 2 ^ 2 +
    4 * v 0 * v 2 ^ 3 + 4 * v 1 ^ 3 * v 3

end Cubic

/-! ## Milestones on existing carriers -/

namespace ArithmeticOrbitRefinement

/-- Integral minor fibres: nonzero integral Plücker data have an integral two-row realization. -/
theorem quarticMinors_exists (L : Matrix (Fin 6) (Fin 6) ℤ)
    (hne : L ≠ 0) (hskew : ∀ i j, L j i = -L i j)
    (hplucker : ∀ i j k l, L i k * L j l = L i j * L k l + L i l * L j k) :
    ∃ M : Matrix (Fin 2) (Fin 6) ℤ, quarticMinors M = L := by sorry

end ArithmeticOrbitRefinement

/-- Quotient by scalars is free: a positive-rank free algebra over a PID or local ring
has a scalar-first basis and a free quotient of rank one less. -/
theorem quotientByScalars_free {R A : Type*} [CommRing R] [Nontrivial R]
    [Ring A] [Algebra R A] [Module.Free R A] [Module.Finite R A]
    (hR : (IsDomain R ∧ IsPrincipalIdealRing R) ∨ IsLocalRing R)
    (n : ℕ) (hrank : Module.finrank R A = n + 1) :
    Function.Injective (algebraMap R A) ∧
    Module.Free R (A ⧸ Submodule.span R ({1} : Set A)) ∧
    Module.finrank R (A ⧸ Submodule.span R ({1} : Set A)) = n ∧
    ∃ b : Module.Basis (Fin (n + 1)) R A, b 0 = 1 := by sorry

/-- Primitive vectors extend to special linear matrices: every primitive vector over a PID
is any prescribed column of a determinant-one matrix. -/
theorem primitiveVector_exists_SL3 {O : Type*} [CommRing O] [IsDomain O]
    [IsPrincipalIdealRing O] (v : Fin 3 → O) (hv : Ideal.span (Set.range v) = ⊤)
    (j : Fin 3) :
    ∃ M : Matrix.SpecialLinearGroup (Fin 3) O, ∀ i, M i j = v i := by sorry

namespace BinaryQuartic

/-- Quartic monicization has leading coefficient one over every commutative ring. -/
theorem monicize_a {R : Type*} [CommRing R] (f : Fin 5 → R) :
    monicize f 0 = 1 := by sorry

/-- Quartic monicization fixes every form whose leading coefficient is one. -/
theorem monicize_eq_self {R : Type*} [CommRing R] (f : Fin 5 → R) (hf : f 0 = 1) :
    monicize f = f := by sorry

end BinaryQuartic

namespace ArithmeticOrbitRefinement

/-- Quartic minors reverse sign when the two coefficient labels are exchanged. -/
theorem quarticMinors_swap (M : Matrix (Fin 2) (Fin 6) ℤ) (i j : Fin 6) :
    quarticMinors M j i = -quarticMinors M i j := by sorry

/-- Quartic minors satisfy the Plücker relations in the fixed coefficient order. -/
theorem quarticMinors_plucker (M : Matrix (Fin 2) (Fin 6) ℤ) (i j k l : Fin 6) :
    quarticMinors M i k * quarticMinors M j l =
      quarticMinors M i j * quarticMinors M k l +
      quarticMinors M i l * quarticMinors M j k := by sorry

/-- Changing the two row generators scales every minor by the determinant. -/
theorem quarticMinors_mul (h : Matrix (Fin 2) (Fin 2) ℤ)
    (M : Matrix (Fin 2) (Fin 6) ℤ) :
    quarticMinors (h * M) = fun i j => h.det * quarticMinors M i j := by sorry

section Isotropic
variable {K : Type*} [Field K]

/-- Common isotropic subspaces transport by the inverse transpose under congruence. -/
theorem commonIsotropic_congr {n : ℕ} (r : ℕ) (A B : Matrix (Fin n) (Fin n) K)
    (P : Matrix.GeneralLinearGroup (Fin n) K) (U : Submodule K (Fin n → K)) :
    U.map (Matrix.toLin' (P⁻¹).val.transpose) ∈
        commonIsotropic r (P.val * A * P.val.transpose) (P.val * B * P.val.transpose) ↔
      U ∈ commonIsotropic r A B := by sorry

/-- The zero pencil has every subspace of the specified vector dimension as a common isotropic. -/
theorem commonIsotropic_zero {n : ℕ} (r : ℕ) :
    commonIsotropic r (0 : Matrix (Fin n) (Fin n) K) 0 =
      {U : Submodule K (Fin n → K) | Module.finrank K U = r} := by sorry

end Isotropic
end ArithmeticOrbitRefinement

namespace Cubic
/-- The identity matrix fixes every divided cubic vector. -/
theorem dividedSubst_one {R : Type*} [CommRing R] (v : Fin 4 → R) :
    dividedSubst 1 v = v := by sorry

/-- Matrix multiplication gives left-action composition on divided coefficients. -/
theorem dividedSubst_mul {R : Type*} [CommRing R]
    (g h : Matrix (Fin 2) (Fin 2) R) (v : Fin 4 → R) :
    dividedSubst (g * h) v = dividedSubst g (dividedSubst h v) := by sorry

/-- Base change commutes with divided-coefficient substitution. -/
theorem dividedSubst_map {R S : Type*} [CommRing R] [CommRing S] (f : R →+* S)
    (g : Matrix (Fin 2) (Fin 2) R) (v : Fin 4 → R) :
    (fun i => f (dividedSubst g v i)) =
      dividedSubst (g.map f) (fun i => f (v i)) := by sorry

/-- Divided substitution has determinant-six discriminant covariance over every ring. -/
theorem normalizedDisc_dividedSubst {R : Type*} [CommRing R]
    (g : Matrix (Fin 2) (Fin 2) R) (v : Fin 4 → R) :
    normalizedDisc (dividedSubst g v) = g.det^6 * normalizedDisc v := by sorry

/-- Coefficient scaling has degree four, in every characteristic. -/
theorem normalizedDisc_smul {R : Type*} [CommRing R] (u : R) (v : Fin 4 → R) :
    normalizedDisc (fun i => u * v i) = u ^ 4 * normalizedDisc v := by sorry

/-- The ordinary coefficient convention gives the discriminant of the affine cubic. -/
theorem ordinaryDisc_eq {K : Type*} [Field K] (v : Fin 4 → K) (ha : v 0 ≠ 0) :
    (C (v 0) * X ^ 3 + C (3 * v 1) * X ^ 2 + C (3 * v 2) * X + C (v 3)).discr =
      -27 * normalizedDisc v := by sorry

end Cubic

/-! ## Structural checks -/

namespace ArithmeticOrbitRefinement

/-- Dependent coefficient rows have zero wedge, even when neither row is zero. -/
example (a : Fin 6 → ℤ) (c : ℤ) :
    quarticMinors (fun i j => if i = 0 then a j else c * a j) = 0 := by
  ext i j
  simp [quarticMinors]
  ring

/-- In characteristic two, vanishing on the diagonal does not give bilinear isotropy. -/
example : (⊤ : Submodule (ZMod 2) (Fin 2 → ZMod 2)) ∉
    commonIsotropic 2 (!![0,1;1,0]) 0 := by
  intro h
  have h01 := h.2 (![1,0]) (by trivial) (![0,1]) (by trivial)
  norm_num [pairing, Fin.sum_univ_two] at h01

end ArithmeticOrbitRefinement

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
norm pairs; the regular-pencil Fano construction and supplied generalized Picard comparisons;
weak-discriminant loci, Q and marked Q; genus-one degree-three, four and five
covering dictionaries; three-isogeny mirror algebras and integral multiplicities.
Their APIs, hypotheses and Checks remain in the README. The signed polynomial
pencil invariant and its determinant identities are supplied by Part I §0.22.

README-only API targets, grouped by their mathematical namespace:
ArithmeticOrbitRefinement:
  basedSexticResolvent_disc, basedSexticResolvent_self.
  idealNorm, IsMaximalAtUniformizer, quinticSymmetricClosure, pencilFanoGeometry.
  markedQ_equivariant, markedQ_independent.
  monogenizing_adjoin, monogenizing_translate, normPair_sign_iff.
  orbitTriple_rescale, qHyperdeterminant_scale, qHyperdeterminant_sl2.
  qHyperdeterminant_transform.
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
  mem_range_embed_iff, mem_selmerGroup₂_iff.
  monicize_invariants, monicize_twist.
  norm_irrationalCovariant, pgl_orbits_eq_gl_orbits_int, pgl_smul_mk.
  quarticOfPoint_neg, resolventForm_embed, rho_det.
  sextic_twistedSMul, veroneseForm_comp_rho.
-/

end TauCetiRoadmap.ArithmeticStatisticsPartII

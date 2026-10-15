import Mathlib
import TauCeti.LinearAlgebra.Matrix.SymplecticMultiplier
import TauCeti.Geometry.Symplectic.AlmostComplex

/-!
# PELModuli: representative target signatures

The roadmap is `README.md`; these are suggested forms, not an exhaustive checklist. This file records
definitions and theorem signatures of the Siegel and PEL moduli roadmap that can be stated against
the pinned Mathlib and Tau Ceti APIs, fixing their hypotheses and conventions. The
moduli problems themselves, their stacks, universal families, uniformization, canonical models and
arithmetic interface need carriers (abelian schemes over a base, algebraic stacks, analytic spaces,
Shimura varieties) that are not at the pins; they are README targets only and are listed at the end.

Design choices made explicit here:
* Pairings with values in `ℤ(1)` are written `ℤ`-valued after choosing `√−1`; the principal Siegel Gram
  matrix is `−Matrix.J`, so `ψ(e_i, f_i) = 1`, and the complex structure satisfies `J e_i = f_i`,
  `J f_i = −e_i`, making `ψ(x, J x) > 0` for `x ≠ 0`.
* Positivity of an involution is stated with the unreduced trace `Algebra.trace ℚ B`; the README proves
  it equivalent to positivity for the reduced trace (M0.1, `iff_trace_pos`).
* Similitudes carry their multiplier as data; uniqueness of the multiplier needs flatness and a
  nonzero lattice and is a theorem, not part of the definition (M0.7).
* The determinant polynomial is built from Mathlib's `LinearMap.polyCharpoly`; the determinant
  condition is an equality of polynomials, never of traces (M0.14, M0.18).
* Hecke operators act on the right by precomposition of level markings (M1.13).
-/

namespace TauCetiRoadmap.PELModuli

open scoped TensorProduct

/-! ## Layer M0: Linear algebra and reflex fields -/

section PositiveInvolution

variable (B : Type*) [Ring B] [Algebra ℚ B] [StarRing B] [FiniteDimensional ℚ B]

/-- **Positive involution** (M0.1). A star structure on a finite-dimensional `ℚ`-algebra is positive
when `Tr_{B/ℚ}(x x*) > 0` for every nonzero `x`. Lan, thesis, §1.2.1, p. 45; Milne, *Introduction to
Shimura varieties*, Proposition 8.10 and Definition 8.11, pp. 84–85. The trace is the trace of left
multiplication; positivity for it is equivalent to positivity for the reduced trace. -/
def IsPositiveInvolution : Prop :=
  (∀ (q : ℚ) (x : B), star (q • x) = q • star x) ∧
    ∀ x : B, x ≠ 0 → 0 < LinearMap.trace ℚ B (LinearMap.mulLeft ℚ (x * star x))

/-- **Star-order** (M0.1). A subring of `B` that is stable under the involution, finitely generated
as an abelian group and spans `B` over `ℚ`. -/
structure StarOrder where
  /-- The underlying subring. -/
  toSubring : Subring B
  /-- Stability under the involution. -/
  star_mem : ∀ x ∈ toSubring, star x ∈ toSubring
  /-- Finite generation over `ℤ`. -/
  fg : (Submodule.span ℤ (toSubring : Set B)).FG
  /-- The order spans `B` over `ℚ`. -/
  span_eq_top : Submodule.span ℚ (toSubring : Set B) = ⊤

/-- The integer order contains `2` and excludes `1/2`; spanning over `ℚ` is not equality with `ℚ`
(Check `starOrder_integer`). -/
example : ∃ O : StarOrder ℚ, (2 : ℚ) ∈ O.toSubring ∧ (1 / 2 : ℚ) ∉ O.toSubring := by
  sorry

end PositiveInvolution

/-- The identity is a positive involution of `ℚ` (Check `positiveInvolution_rat`). -/
example : IsPositiveInvolution ℚ := by
  sorry

/-- Transposition is a positive involution of `M_n(ℚ)` (Check `positiveInvolution_transpose`); the
star of `Matrix (Fin n) (Fin n) ℚ` is the conjugate transpose, which is the transpose over `ℚ`. -/
example (n : ℕ) : IsPositiveInvolution (Matrix (Fin n) (Fin n) ℚ) := by
  sorry

/-- The adjugate involution of `M_2(ℚ)` is not positive (Check `not_positiveInvolution_adjugate`):
`x · adj x = det x`, whose reduced trace is `−2` at `x = diag(1, −1)`;
the unreduced trace on the matrix algebra is `−4`. -/
example : (Matrix.diagonal ![(1 : ℚ), -1]) * (Matrix.diagonal ![(1 : ℚ), -1]).adjugate =
    (-1 : ℚ) • (1 : Matrix (Fin 2) (Fin 2) ℚ) := by
  sorry

section SymplecticLattice

variable (O : Type*) [Ring O] [StarRing O]
variable (L : Type*) [AddCommGroup L] [Module O L] [Module.Free ℤ L] [Module.Finite ℤ L]

/-- **Symplectic `O`-lattice** (M0.4). A finite free `ℤ`-module with an `O`-action and an alternating
nondegenerate integral pairing for which `b` and `b*` are adjoint. Lan, §1.2.1, p. 46; Kottwitz, §1,
p. 374. -/
structure SymplecticOLattice where
  /-- The pairing, `ℤ(1)`-valued after the choice of `√−1`. -/
  form : LinearMap.BilinForm ℤ L
  /-- The pairing is alternating. -/
  isAlt : form.IsAlt
  /-- The pairing is nondegenerate (equivalently, nondegenerate after `⊗ ℚ`). -/
  nondegenerate : form.Nondegenerate
  /-- `⟨b x, y⟩ = ⟨x, b* y⟩`. -/
  adjoint : ∀ (b : O) (x y : L), form (b • x) y = form x (star b • y)

namespace SymplecticOLattice

variable {O L}

/-- The **dual index** `[L^# : L]` (M0.4), computed as the absolute value of the Gram determinant in a
chosen `ℤ`-basis; the README proves it is the index of `L` in its dual lattice and independent of the
basis. -/
noncomputable def dualIndex (S : SymplecticOLattice O L) : ℕ :=
  (LinearMap.BilinForm.toMatrix (Module.Free.chooseBasis ℤ L) S.form).det.natAbs

/-- The dual index is positive (nondegeneracy over `ℚ`). -/
theorem dualIndex_pos (S : SymplecticOLattice O L) : 0 < S.dualIndex := by
  sorry

/-- The `ℝ`-bilinear extension of the pairing to `ℝ ⊗ L`. -/
noncomputable def realForm (S : SymplecticOLattice O L) : LinearMap.BilinForm ℝ (ℝ ⊗[ℤ] L) :=
  LinearMap.BilinForm.baseChange ℝ S.form

/-- Zero rank has Gram determinant one, rather than zero. -/
example : ∃ S : SymplecticOLattice ℤ (Fin 0 → ℤ), S.dualIndex = 1 := by
  sorry

/-- Scalar extension retains the integral pairing on pure tensors. -/
example (S : SymplecticOLattice O L) (x y : L) :
    S.realForm (1 ⊗ₜ[ℤ] x) (1 ⊗ₜ[ℤ] y) = (S.form x y : ℝ) := by
  sorry

end SymplecticOLattice

/-- The action of `b ∈ O` on `ℝ ⊗ L`. -/
noncomputable def realAction (b : O) : Module.End ℝ (ℝ ⊗[ℤ] L) :=
  ((DistribSMul.toAddMonoidHom L b).toIntLinearMap).baseChange ℝ

/-- The scalar `−1` acts by negation after extension to `ℝ`, fixing the action convention. -/
example : realAction O L (-1) = -1 := by
  sorry

/-- **Linear part of an integral PEL datum** (M0.5). A symplectic `O`-lattice with an `O ⊗ ℝ`-linear complex structure
`J = h(√−1)` with `J² = −1`, preserving the real pairing, and with `ψ(x, J x) > 0` for `x ≠ 0` (Lan's
Condition 1.2.1.2, pp. 46–47; Definition 1.2.1.3, p. 47). The positive involution on `O ⊗ ℚ` and the
faithfulness used for rationalization are hypotheses of the README targets that use them. -/
structure IntegralPELLinearDatum where
  /-- The symplectic `O`-lattice. -/
  lattice : SymplecticOLattice O L
  /-- The complex structure `h(√−1)` on `ℝ ⊗ L`. -/
  J : TauCeti.AlmostComplexStructure (ℝ ⊗[ℤ] L)
  /-- `J` commutes with the action of `O`. -/
  J_comm : ∀ b : O,
    J.toLinearMap * realAction O L b = realAction O L b * J.toLinearMap
  /-- `J` preserves the real pairing (equivalently `⟨h(z)x, y⟩ = ⟨x, h(z̄)y⟩`). -/
  J_isometry : ∀ x y, lattice.realForm (J x) (J y) = lattice.realForm x y
  /-- Positivity: `ψ(x, J x) > 0` for `x ≠ 0`. -/
  pos : ∀ x, x ≠ 0 → 0 < lattice.realForm x (J x)

/-- The linear carrier admits rank zero, where positivity has no nonzero vector to test. -/
example : Nonempty (IntegralPELLinearDatum ℤ (Fin 0 → ℤ)) := by
  sorry

/-- Reversing `J` reverses the positivity sign on every nonzero vector. -/
example (D : IntegralPELLinearDatum O L) (x : ℝ ⊗[ℤ] L) (hx : x ≠ 0) :
    D.lattice.realForm x (-D.J x) < 0 := by
  sorry

/-- **Similitude with multiplier** (M0.7). Over a commutative ring `R`, a pair `(g, r)` of an
`O`-linear automorphism of `R ⊗ L` and a unit `r` with `⟨g x, g y⟩ = r ⟨x, y⟩`. The multiplier is data:
over nonflat `R` it is not determined by `g` (Lan's thesis errata, p. 4). -/
def IsSimilitude (S : SymplecticOLattice O L) (R : Type*) [CommRing R]
    (g : (R ⊗[ℤ] L) ≃ₗ[R] (R ⊗[ℤ] L)) (r : Rˣ) : Prop :=
  (∀ (b : O) (x : R ⊗[ℤ] L),
      g (((DistribSMul.toAddMonoidHom L b).toIntLinearMap.baseChange R) x) =
        ((DistribSMul.toAddMonoidHom L b).toIntLinearMap.baseChange R) (g x)) ∧
    ∀ x y, LinearMap.BilinForm.baseChange R S.form (g x) (g y) =
      (r : R) * LinearMap.BilinForm.baseChange R S.form x y

/-- The identity automorphism has multiplier one over every base ring. -/
example (S : SymplecticOLattice O L) (R : Type*) [CommRing R] :
    IsSimilitude O L S R (LinearEquiv.refl R _) 1 := by
  sorry

end SymplecticLattice

/-- The genus-one multiplier is the determinant (Check `similitudeGroup_siegel_one`): every
`A ∈ M_2(R)` scales the standard symplectic form by `det A`; this is `GL₂ = GSp₂`. -/
example {R : Type*} [CommRing R] (A : Matrix (Unit ⊕ Unit) (Unit ⊕ Unit) R) :
    A.transpose * Matrix.J Unit R * A = A.det • Matrix.J Unit R :=
  Matrix.transpose_mul_J_mul_eq_det_smul A

/-- Nonflat bases lose the multiplier (Check `similitudeGroup_multiplier_nonflat`): the form `5J`
vanishes over `𝔽₅`, so the identity scales it by both `1` and `2`. -/
example : (5 : ZMod 5) • Matrix.J (Fin 1) (ZMod 5) = 2 * ((5 : ZMod 5) • Matrix.J (Fin 1) (ZMod 5)) := by
  sorry

section BadPrimes

/-- **Bad-prime integer** (M0.10): `n · I_bad · Disc · [L^# : L]`. -/
def badPrimeInteger (n Ibad disc dualIndex : ℕ) : ℕ := n * Ibad * disc * dualIndex

/-- A prime is **good** (M0.10) when it does not divide the bad-prime integer. Each factor is a
separate condition; none follows from `p` being large. -/
def IsGoodPrime (n Ibad disc dualIndex p : ℕ) : Prop :=
  Nat.Prime p ∧ ¬ p ∣ badPrimeInteger n Ibad disc dualIndex

/-- The Siegel datum of type `(1 | 6)` at level one has bad primes `2` and `3`
(Check `goodPrime_type`). -/
example : ¬ IsGoodPrime 1 1 1 36 2 ∧ ¬ IsGoodPrime 1 1 1 36 3 ∧ IsGoodPrime 1 1 1 36 5 := by
  sorry

/-- In type D, `I_bad = 2` makes `2` bad (Check `goodPrime_typeD_two`). -/
example : ¬ IsGoodPrime 1 2 9 1 2 := by
  sorry

/-- A composite number is never a good prime, even if it is coprime to the bad-prime integer. -/
example : ¬ IsGoodPrime 1 1 1 1 4 := by
  sorry

/-- A zero factor makes every prime bad. -/
example : badPrimeInteger 3 1 0 4 = 0 := by
  rfl

end BadPrimes

section Determinant

variable {R : Type*} [CommRing R] {O : Type*} [AddCommGroup O] [Module R O]
variable {ι : Type*} [Fintype ι] [DecidableEq ι]
variable {M : Type*} [AddCommGroup M] [Module R M] [Module.Free R M] [Module.Finite R M]

/-- **Determinant polynomial** `Det_{O|M}` (M0.14). For a linear family `φ : O → End M` and a basis
of `O`, `(−1)^{rank M}` times the constant coefficient of the generic characteristic polynomial
`LinearMap.polyCharpoly`; its value at `x` is `det(φ x)` (Lan, Definition 1.1.2.17, p. 19). -/
noncomputable def detPoly (φ : O →ₗ[R] Module.End R M) (b : Module.Basis ι R O) :
    MvPolynomial ι R :=
  (-1) ^ Module.finrank R M * (LinearMap.polyCharpoly φ b).coeff 0

/-- Evaluating the determinant polynomial at the coordinates of `x` gives `det(φ x)` (`detPoly_eval`;
Check `detPoly_eval_charpoly`, which pins that no further sign appears). -/
theorem detPoly_eval (φ : O →ₗ[R] Module.End R M) (b : Module.Basis ι R O) (x : O) :
    MvPolynomial.eval (b.repr x) (detPoly φ b) = LinearMap.det (φ x) := by
  sorry

/-- **Determinant condition** (M0.18): equality of the determinant polynomials of arbitrary
linear families, including nonfaithful actions and zero modules. For families induced by unital
algebra actions this implies equality of characteristic polynomials and traces, by specializing the
generic element to `T·1 − x`; the converse fails in positive characteristic. -/
def SatisfiesDetCondition {M' : Type*} [AddCommGroup M'] [Module R M'] [Module.Free R M']
    [Module.Finite R M'] (φ : O →ₗ[R] Module.End R M) (ψ : O →ₗ[R] Module.End R M')
    (b : Module.Basis ι R O) : Prop :=
  detPoly φ b = detPoly ψ b

end Determinant

/-- A zero linear family has determinant zero in positive rank and one in rank zero.
Thus the determinant condition separates those two cases. -/
example {ι : Type*} [Fintype ι] [DecidableEq ι] (b : Module.Basis ι ℚ ℚ) :
    ¬ SatisfiesDetCondition (0 : ℚ →ₗ[ℚ] Module.End ℚ ℚ)
      (0 : ℚ →ₗ[ℚ] Module.End ℚ (Fin 0 → ℚ)) b := by
  sorry

/-- Traces do not detect the determinant in characteristic `3` (Check `detPoly_not_trace`): on `k³`
with `i` acting by `±τ(i)`, both trace maps vanish while the determinants of `i` differ. -/
example (k : Type*) [Field k] [CharP k 3] (t : k) (ht : t ^ 2 = -1) :
    (3 : k) * t = 3 * (-t) ∧ t ^ 3 ≠ (-t) ^ 3 := by
  sorry

section CMTypes

variable (K : Type*) [Field K] [NumberField K] [NumberField.IsCMField K]

/-- **Generalized CM type** of rank `N` (M0.25): a finitely supported `Ψ : (K →+* ℂ) →₀ ℕ` with
`Ψ(τ) + Ψ(τ̄) = N` for every complex embedding (Liu–Tian–Xiao–Zhang–Zhu, Definition 3.3.1, p. 147). -/
def IsGeneralizedCMType (N : ℕ) (Ψ : (K →+* ℂ) →₀ ℕ) : Prop :=
  ∀ τ : K →+* ℂ, Ψ τ + Ψ (NumberField.ComplexEmbedding.conjugate τ) = N

/-- A CM type is a generalized CM type of rank one. -/
def IsCMType (Φ : (K →+* ℂ) →₀ ℕ) : Prop := IsGeneralizedCMType K 1 Φ

/-- In rank one every coefficient is `0` or `1` (Check `gcmType_cm_rank1`). -/
theorem IsCMType.le_one {Φ : (K →+* ℂ) →₀ ℕ} (h : IsCMType K Φ) (τ : K →+* ℂ) : Φ τ ≤ 1 := by
  sorry

/-- The empty multiplicity function is the unique rank-zero generalized CM type. -/
example : IsGeneralizedCMType K 0 0 := by
  sorry

/-- In rank one, selecting no embedding fails the conjugate-pair condition. -/
example (τ : K →+* ℂ) : ¬ IsCMType K 0 := by
  sorry

end CMTypes

/-! ## Layer M2: Representability and smooth good models -/

/-- The ratio of two infinite-order rational eigenvalues can be torsion;
AdelicAlgebraicGroups §4.3's rational neatness predicate tests the generated subgroup.
The adelic Pink condition is a README target. -/
example : (2 : ℂ)⁻¹ * (-2) = -1 := by
  norm_num


/-! ## Layer M5: Siegel, Hilbert and unitary examples -/

section Siegel

open Matrix

variable {g : ℕ}

/-- The **Siegel Gram matrix of type `d`** (M5.1): `⟨e_i, f_j⟩ = d_i δ_{ij}`, `⟨e_i, e_j⟩ = ⟨f_i, f_j⟩ = 0`
on `ℤ^{2g}` with basis `e = inl`, `f = inr`. For `d = 1` it is `−Matrix.J`. -/
def siegelGram (d : Fin g → ℤ) : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℤ :=
  Matrix.fromBlocks 0 (Matrix.diagonal d) (-Matrix.diagonal d) 0

-- M5.1 uses Mathlib's complex-structure matrix and its square identity.
#check Matrix.J_squared

/-- For the principal type the Gram matrix is `−Matrix.J` (the sign convention of the roadmap). -/
theorem siegelGram_one : siegelGram (fun _ : Fin g => (1 : ℤ)) = -Matrix.J (Fin g) ℤ := by
  sorry

/-- **Dual index of the Siegel datum** (`siegelDatum_dualIndex`): `[L_D^# : L_D] = (d₁⋯d_g)²`. -/
theorem siegelGram_det (d : Fin g → ℤ) : (siegelGram d).det = (∏ i, d i) ^ 2 := by
  sorry

/-- For `g = 2`, `D = (1, 2)` the dual index is `4` (Check `siegelDatum_index_12`). -/
example : (siegelGram ![(1 : ℤ), 2]).det = 4 := by
  sorry

/-- The determinant of the genus-zero alternating form is one. -/
example : (siegelGram (g := 0) (fun _ => (1 : ℤ))).det = 1 := by
  sorry

/-- Positivity in the Siegel convention (Check `IntegralPELDatum.siegel`): with
`ψ = siegelGram 1` and `J = Matrix.J (Fin g) ℝ`, `ψ(x, J x) = Σ x_i²` is positive for `x ≠ 0`. -/
theorem siegel_pos (x : Fin g ⊕ Fin g → ℝ) (hx : x ≠ 0) :
    0 < x ⬝ᵥ ((siegelGram (fun _ : Fin g => (1 : ℤ))).map (Int.cast : ℤ → ℝ) *ᵥ
      (Matrix.J (Fin g) ℝ *ᵥ x)) := by
  sorry

/-- With `J` replaced by `−J` the form is negative definite (Check `IntegralPELDatum.wrong_sign`). -/
theorem siegel_neg (x : Fin g ⊕ Fin g → ℝ) (hx : x ≠ 0) :
    x ⬝ᵥ ((siegelGram (fun _ : Fin g => (1 : ℤ))).map (Int.cast : ℤ → ℝ) *ᵥ
      ((-Matrix.J (Fin g) ℝ) *ᵥ x)) < 0 := by
  sorry

/-- The two-term witness fixes `J e = f`, rather than `−f`. -/
example : Matrix.J (Fin 1) ℝ *ᵥ (Pi.single (Sum.inl 0) 1) = Pi.single (Sum.inr 0) 1 := by
  sorry

end Siegel

section Hilbert

variable (F : Type*) [Field F] [NumberField F]

/-- The **Hilbert trace pairing** (M5.4): `ψ((x₁, x₂), (y₁, y₂)) = Tr_{F/ℚ}(x₁ y₂ − x₂ y₁)` on `F²`; on
`L = O_F ⊕ 𝔡⁻¹` it is integral and perfect. -/
noncomputable def hilbertPairing (x y : F × F) : ℚ :=
  Algebra.trace ℚ F (x.1 * y.2 - x.2 * y.1)

/-- The Hilbert pairing is alternating. -/
theorem hilbertPairing_self (x : F × F) : hilbertPairing F x x = 0 := by
  sorry

/-- The order acts by self-adjoint maps (`* = id`): `ψ(bx, y) = ψ(x, by)`. -/
theorem hilbertPairing_smul (b : F) (x y : F × F) :
    hilbertPairing F (b • x) y = hilbertPairing F x (b • y) := by
  sorry

/-- **Self-duality of the principal Hilbert lattice** (`hilbertExample`): the trace dual of the inverse
different `𝔡⁻¹ = dual(O_F)` is `O_F`, which makes `O_F ⊕ 𝔡⁻¹` self-dual for the trace pairing. -/
example :
    FractionalIdeal.dual ℤ ℚ (FractionalIdeal.dual ℤ ℚ (1 : FractionalIdeal (nonZeroDivisors
      (NumberField.RingOfIntegers F)) F)) = 1 := by
  sorry

/-- In the degree-one case the trace pairing has `ψ(e,f) = 1`. -/
example : hilbertPairing ℚ (1, 0) (0, 1) = 1 := by
  sorry

end Hilbert

section Unitary

variable (K : Type*) [Field K] [NumberField K] [NumberField.IsCMField K]

/-- The **unitary trace form** (M5.5): `⟨x, y⟩ = Tr_{K/ℚ}(δ H(x, y))` for a hermitian form `H` on `K`
and an anti-invariant `δ`; it is alternating and `⟨a x, y⟩ = ⟨x, ā y⟩`. This signature is the rank-one
specialization; the full finite-dimensional version is in the README. -/
noncomputable def unitaryTraceForm (H : K → K → K) (δ : K) (x y : K) : ℚ :=
  Algebra.trace ℚ K (δ * H x y)

/-- With `δ = 1`, which is not anti-invariant, the trace form of the standard hermitian form on `K` is
not alternating (Check `unitaryDatum_wrong_delta`). -/
theorem unitaryTraceForm_one_not_alternating :
    ∃ x : K, unitaryTraceForm K
      (fun a b => a * NumberField.IsCMField.complexConj K b) 1 x x ≠ 0 := by
  sorry

/-- An anti-invariant scalar gives an alternating rank-one trace form. -/
example (δ : K) (hδ : NumberField.IsCMField.complexConj K δ = -δ) (x : K) :
    unitaryTraceForm K (fun a b => a * NumberField.IsCMField.complexConj K b) δ x x = 0 := by
  sorry

end Unitary

/-! ## Linear Checks -/

/-- The nonmaximal order `ℤ[2i]` is a star-order in `ℚ(i)` and excludes `i`
(Check `starOrder_nonmaximal`); the coordinates describe its underlying subring. -/
example : ∃ O : StarOrder (QuadraticAlgebra ℚ (-1) 0),
    (∀ x, x ∈ O.toSubring ↔ ∃ a b : ℤ,
      x = (⟨(a : ℚ), 2 * (b : ℚ)⟩ : QuadraticAlgebra ℚ (-1) 0)) ∧
    (⟨0, 1⟩ : QuadraticAlgebra ℚ (-1) 0) ∉ O.toSubring := by
  sorry

/-- The entire rational field is not an integral star-order (Check `starOrder_not_field`). -/
example : ¬ ∃ O : StarOrder ℚ, O.toSubring = ⊤ := by
  sorry

/-- The identity on `ℚ(i)` violates the positive-trace inequality at `i`
(Check `not_positiveInvolution_id_imaginary`). -/
example : Algebra.trace ℚ (QuadraticAlgebra ℚ (-1) 0)
    ((⟨0, 1⟩ : QuadraticAlgebra ℚ (-1) 0) * ⟨0, 1⟩) = -2 := by
  sorry

/-- Conjugation satisfies the positive-trace inequality on the same quadratic algebra. -/
example : IsPositiveInvolution (QuadraticAlgebra ℚ (-1) 0) := by
  sorry

/-- Left multiplication on the four-dimensional matrix algebra has unreduced trace `−4`
at the adjugate witness (Check `not_positiveInvolution_adjugate`); its reduced trace is `−2`. -/
example : LinearMap.trace ℚ (Matrix (Fin 2) (Fin 2) ℚ)
    (LinearMap.mulLeft ℚ
      ((Matrix.diagonal ![(1 : ℚ), -1]) *
        (Matrix.diagonal ![(1 : ℚ), -1]).adjugate)) = -4 := by
  sorry

/-- The standard integral alternating plane is self-dual and has index one
(Check `SymplecticOLattice.dual_standard`). -/
example : (∃ S : SymplecticOLattice ℤ (Fin 2 → ℤ),
    S.form = Matrix.toBilin' !![0, 1; -1, 0] ∧ S.dualIndex = 1) ∧
    (Matrix.toBilin' !![(0 : ℚ), 1; -1, 0]).dualSubmodule
      (Submodule.span ℤ (Set.range (Pi.basisFun ℚ (Fin 2)))) =
      Submodule.span ℤ (Set.range (Pi.basisFun ℚ (Fin 2))) := by
  sorry

/-- Weights `1,d` give dual index `d²`, with `d ≠ 0` ensuring nondegeneracy
(Check `SymplecticOLattice.index_type`). -/
example (d : ℤ) (hd : d ≠ 0) : ∃ S : SymplecticOLattice ℤ (Fin 2 ⊕ Fin 2 → ℤ),
    S.form = Matrix.toBilin' (siegelGram ![1, d]) ∧
    S.dualIndex = d.natAbs ^ 2 := by
  sorry

/-- The symmetric product form on `ℤ` fails alternation
(Check `SymplecticOLattice.not_symmetric`). -/
example : ¬ (LinearMap.mul ℤ ℤ).IsAlt := by
  sorry

/-- The principal plane retains its pairing and its order action under real extension (M0.5). -/
example (S : SymplecticOLattice ℤ (Fin 2 → ℤ))
    (hS : S.form = Matrix.toBilin' !![0, 1; -1, 0]) :
    let e : ℝ ⊗[ℤ] (Fin 2 → ℤ) := 1 ⊗ₜ[ℤ] ![1, 0]
    let f : ℝ ⊗[ℤ] (Fin 2 → ℤ) := 1 ⊗ₜ[ℤ] ![0, 1]
    S.realForm e f = 1 ∧ S.realForm (2 • e) f = 2 ∧
    S.realForm f (2 • e) = -2 ∧
    realAction ℤ (Fin 2 → ℤ) 2 e = 2 • e ∧
    realAction ℤ (Fin 2 → ℤ) 2 (realAction ℤ (Fin 2 → ℤ) 3 e) = 6 • e := by
  sorry

/-- On the zero lattice every extended form and order action is zero (M0.5). -/
example (S : SymplecticOLattice ℤ (Fin 0 → ℤ)) (b : ℤ) :
    S.realForm = 0 ∧ realAction ℤ (Fin 0 → ℤ) b = 0 := by
  sorry

/-- At level `3`, the only bad prime of a principal Siegel datum is `3`
(Check `goodPrime_siegel`). -/
example (p : ℕ) : IsGoodPrime 3 1 1 1 p ↔ Nat.Prime p ∧ p ≠ 3 := by
  sorry

/-- The determinant of scalar multiplication on a rank-`r` integer module is `X^r`
(Check `detPoly_int`). -/
example (r : ℕ) :
    detPoly (Algebra.lsmul ℤ ℤ (Fin r → ℤ)).toLinearMap (Module.Basis.singleton Unit ℤ) =
      MvPolynomial.X () ^ r := by
  sorry

/-- In Gaussian coordinates `(1,i)`, the two rank-one actions have determinant
`X₁ ± i X₂` (Check `detPoly_gaussian`). -/
example (u : ℂ) (hu : u = Complex.I ∨ u = -Complex.I) :
    detPoly ((Algebra.lsmul ℂ ℂ ℂ).toLinearMap.comp
      (LinearMap.proj (0 : Fin 2) + u • LinearMap.proj (1 : Fin 2)))
      (Pi.basisFun ℂ (Fin 2)) = MvPolynomial.X 0 + MvPolynomial.C u * MvPolynomial.X 1 := by
  sorry

/-- Negative evaluation gives the characteristic polynomial's constant term, without an
extra sign (Check `detPoly_eval_charpoly`). -/
example {R : Type*} [CommRing R] {O : Type*} [AddCommGroup O] [Module R O]
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    {M : Type*} [AddCommGroup M] [Module R M] [Module.Free R M] [Module.Finite R M]
    (φ : O →ₗ[R] Module.End R M) (b : Module.Basis ι R O) (x : O) :
    MvPolynomial.eval (b.repr (-x)) (detPoly φ b) = (LinearMap.charpoly (φ x)).eval 0 := by
  sorry

/-- In rank one negative evaluation at `1` is `−1` (Check `detPoly_eval_charpoly`). -/
example : MvPolynomial.eval (fun _ : Unit => (-1 : ℤ))
    (detPoly (Algebra.lsmul ℤ ℤ ℤ).toLinearMap (Module.Basis.singleton Unit ℤ)) = -1 := by
  sorry

/-- Two arbitrary linear families can have zero determinant polynomials and unequal traces (M0.18). -/
example (k : Type*) [Field k] [CharP k 3] (b : Module.Basis Unit k k) :
    let φ : k →ₗ[k] Module.End k (Fin 2 → k) :=
      (LinearMap.id : k →ₗ[k] k).smulRight (Matrix.toLin' !![1, 0; 0, 0])
    SatisfiesDetCondition (R := k) (O := k) φ
      (0 : k →ₗ[k] Module.End k (Fin 2 → k)) b ∧
      LinearMap.trace k (Fin 2 → k) (φ 1) ≠ 0 := by
  sorry

/-- Selecting both members of a conjugate pair violates rank-one CM type (M0.25). -/
example (K : Type*) [Field K] [NumberField K] [NumberField.IsCMField K] (τ : K →+* ℂ) :
    ¬ IsCMType K (Finsupp.single τ 1 +
      Finsupp.single (NumberField.ComplexEmbedding.conjugate τ) 1) := by
  sorry

/-- Reversing the Hilbert basis pair gives `−1`, fixing the argument order (M5.4). -/
example : hilbertPairing ℚ (0, 1) (1, 0) = -1 := by
  sorry

/-- In the imaginary quadratic case, `δ = i` gives a positive value at `(1,i)` and
`δ = −i` gives the negative value (Check `unitary_sign_witness`). -/
example (K : Type*) [Field K] [NumberField K] [NumberField.IsCMField K]
    (i : K) (hi : i ^ 2 = -1) (hc : NumberField.IsCMField.complexConj K i = -i)
    (hdeg : Module.finrank ℚ K = 2) :
    unitaryTraceForm K (fun x y => x * NumberField.IsCMField.complexConj K y) i 1 i = 2 ∧
    unitaryTraceForm K (fun x y => x * NumberField.IsCMField.complexConj K y) (-i) 1 i = -2 := by
  sorry

/-!
## Targets stated in the README only

The following targets need carriers that are not at the pins (abelian schemes over a base and their
duals, polarizations over a base, algebraic stacks and spaces, complex analytic spaces, Shimura data
and Shimura varieties, crystalline and étale cohomology, displays) and are specified in `README.md`:
the full `PositiveInvolution`, `IntegralPELDatum`, `RationalPELDatum`, and `PIntegralPELDatum`;
`IntegralPELDatum.coordinate`, `IntegralPELDatum.coordinatePoints`,
`IntegralPELDatum.isometryCoordinate`, `IntegralPELDatum.similitudePoints`;
`PELDatum.multiplier`, `PELDatum.isometryGroup`, `PELDatum.similitudeGroup`;
`RationalPELDatum.coordinate`, `RationalPELDatum.coordinatePoints`;
`SymplecticOLattice.dual`, `IsSelfDualAt`, `multiRank`, `polarizationType`, `baseChange`;
`Order.inverseDifferent`; `PELDatum.IsGoodSet`, `goodBase`, `principalCongruence`;
`RationalPELDatum.domain`, `signature`, `reflexField`;
`IntegralPELDatum.hodgeStructure`, `IntegralPELDatum.signature`,
`IntegralPELDatum.reflexField`, `IntegralPELDatum.detPoly_integral`; `GeneralizedCMType` and its
`reflexField`, `positiveImaginaryCone`; `HermitianSpace`, `HermitianSpace.unitaryGroup`,
`HermitianSpace.sharp`, `HermitianSpace.toSkewHermitian`; `SkewHermitianSpace`, `Similitude`, `Similar`, `GU`, `HasCMType`;
`tauField`, `diamondField`, `psiField`, `tauPart`, `tauSubmodule`, `frobeniusOnEmbeddings`;
the Albert classification `albertTypes`; `Order.disc` and its maximality theorems; the similitude group
scheme and its structure `similitudeGroupStructure`; Galois cohomology `galoisH1`, `ker1` and their
finiteness and Hasse statements; `hodgeStructureOfDatum`; the Shimura datum `toShimuraDatum`;
signatures; `detPoly_classifies`; the reflex field and `reflexField_eq_shimura`;
`detCondition_splitting`; `selfDualLattice_unique`; `bpsSignatureConstancy`; hermitian and
skew-hermitian spaces, `cmTorus`, `rankOneSkewHermitian_classification`; `CMField.reflexiveClosure`;
`τ`-parts. Layer M1: `HasSignatureType`, `PELDatum.Hom`, `PELModuli.forgetLevel`,
`heckeCorrespondence`, `mapOfDatumFunctor`, `toSiegelFunctor`; `QuasiIsogeny`, `BoxPolarization`, `PELTriple`, unitary `O_F`-abelian schemes,
`symplecticIsomSheaf`, `PrincipalLevel`, `IntegralLevel`, `RelativeRationalLevel`, `moduliProblem`,
`ratModuliProblem`, `adelicModuli`, `isoIsogenyComparison`, `changeOfLatticeAndPrimes`,
`effectiveDescent`, `heckeTranslate`, `toSiegel_finite`. Layer M2: `rigidity`, `IsPinkNeatElement`, `IsNeat`,
`noAutomorphisms_of_neat`, `isomScheme_finite`, `deformation_prorepresentable`, `formalSmoothness`,
`effectivity`, `representability`, `universal`, `kodairaSpencer`, `properOfDivision`,
`unitaryDeformation`, `isogenyDieudonne_coker_length`, `isogenyKernelRanks`, `Display`, `Display.deformationEndomorphism`, `polarizedDisplay_lifting`, `wedhornOrdinary`.
Layer M3: `PELModuli.analyticFamily`, `ker1Classification`, `hasseCases`, `arithmeticQuotient_structure`, `complexPoints`,
`uniformization`, `algebraization`, `typeDComparison`, `hermitianHomOfAbelianSchemes`,
`siegelFineUniformization`. Layer M4: `cmReciprocity`, `twist`, `adelicTwist`, `canonicalModel`,
`canonicalModel_functorial`, `normalizedModel`, `normalizedModel_finite_normal_flat`, `cmModuli`,
`cmModuli1`, `cmModuliAct`, `torusGroupoid`, `cmModuli_galois`,
`torusInvariantCohomology`, `torusTrace`. Layer M5: `siegelIntegralDatum`,
`siegelRationalDatum`, `hilbertIntegralDatum`, `unitaryRationalDatum`; `siegelModuli`, `genusOneComparison`, `hilbertExample`,
`unitaryExamples`, `nonprincipalExample`. Layer M6: `levelForgetting_finiteEtale`,
`arbitraryLevelStack`, `siegelStack`, `polarizedStackFiniteType`, `coarseModuli`, `fieldOfModuli`,
`PELModuli.fieldOfModuliPEL`,
the residual gerbe `𝒢_x`, `descentObstruction`, `boundedFieldOfDefinition`, `PELModuli.hodgeBundle`, `PELModuli.hodgeLine`, `classifyingMap`,
`finiteFieldFiniteness`, `nonemptyExamples`.

The following APIs and discriminating Checks are also specified in the README:
* M0.4: `SymplecticOLattice.le_dual` and double duality using the Tau Ceti supplier
  recorded in the README.
* M0.10: `PELDatum.IsGoodPrime.not_dvd_dualIndex`,
  `PELDatum.IsGoodPrime.not_two_of_typeD`.
* M0.14: `detPoly_sheaf`, `detPoly_sheaf_restrict`, `detPoly_basis_indep`,
  `detPoly_baseChange`, `detPoly_exact`, `detPoly_homogeneous`,
  `detPoly_eq_polyCharpoly`.
* M0.15: `detPoly_classifies_charP`, `detPoly_classifies_charZero`.
* M0.18: `SatisfiesDetCondition.iff_eval`.
* M5.4: `hilbertRationalDatum`, `hilbertTraceEmbedding`,
  `hilbertTraceEmbedding_injective`, `hilbertTraceEmbedding_multiplier`,
  `hilbertTraceEmbedding_h`.

The affine determinant polynomial is stated above. Its sheaf construction and classification,
the order and dual-lattice APIs, and their remaining Checks are README targets; this list does
not introduce additional Lean declarations.
-/

end TauCetiRoadmap.PELModuli

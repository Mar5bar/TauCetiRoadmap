import Mathlib
import TauCeti.NumberTheory.HeckeRing.Associativity
import TauCeti.NumberTheory.HeckeRing.Representation
import TauCeti.RepresentationTheory.CharacterTwist
import TauCeti.RepresentationTheory.PGroupInvariants
import TauCeti.RepresentationTheory.Homological.GroupCohomology.Corestriction
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.UpperTriangular.Basic
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.UpperUnitriangular.Basic
import TauCeti.LinearAlgebra.Matrix.SpecialLinearGroup.Dilation
import TauCeti.AlgebraicTopology.LocalCoefficient
import TauCeti.AlgebraicTopology.Singular.Relative
import TauCeti.AlgebraicTopology.Cohomology.Twisted.Basic
import TauCeti.AlgebraicTopology.EilenbergMacLane.TopologicalVectorSpace

/-!
# ArithmeticLocallySymmetricSpaces: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular targets, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the roadmap.
`sorry` is expected in this file — these are goals, not results.

The roadmap builds the arithmetic locally symmetric spaces `X_K = G(F)\(X^G × G(𝔸^∞)/K)` and their
integral cohomology: symmetric spaces and adelic quotients (Layer ALS.0), arithmetic local systems
and Betti complexes (ALS.1), the Borel–Serre compactification and its boundary strata (ALS.2),
Hecke actions in the derived category (ALS.3), boundary complexes and Eisenstein localization
(ALS.4), finite-level duality (ALS.5a), characteristic-zero comparisons (ALS.5b) and descent along
finite covers (ALS.6).

Most carriers of the roadmap are not in Mathlib or Tau Ceti at the pinned commits: algebraic Cartan
involutions and twisted real forms, the adelic level quotients (AdelicAlgebraicGroups §4.4),
equivariant sheaves and their derived functors, manifolds with corners carrying the Borel–Serre
structure, singular cohomology with supports, and automorphic forms. Statements about them live in
`README.md` only; the closing comment of this file lists them. What is recorded here:

* the library declarations the roadmap consumes, pinned by `#check` in the layer that uses them;
* light definitions with real bodies over pinned carriers: the split-centre-corrected stabilizer
  `ℝ_{>0}·O(2)` of `i ∈ ℍ` (ALS.0.4), congruence and Iwahori level subgroups of `GL_n` over a
  commutative ring as preimages of Tau Ceti's upper-triangular and upper-unitriangular groups
  (ALS.0.10), the orientation character `sign(N(det))^{m−1}` of `GL_m` over a number field
  (ALS.0.12), the slice representation and the whole-inverse monodromy convention (ALS.1.1), the
  geodesic action of the diagonal torus on `ℍ` (ALS.2.1), basis elements of the Hecke ring and the
  operator of a double coset on a representation (ALS.3);
* milestones whose carriers exist at the pins: the stabilizer of `i` under `GL(2, ℝ)`, the index
  `p + 1` of the Iwahori subgroup of `GL_2(ℤ_p)`, the group cohomology of `SL_2(ℤ)` in degrees `1`
  and `2`, the Hecke ring of a normal subgroup, the invariance and representative-independence of
  the double-coset operator on invariants, and the existence of the character twist of a Hecke ring;
* `example`s fixing the conventions the README pins with a witness: the negative-determinant
  orientation sign, the order-three element of the pro-`3` Iwahori subgroup, the `2`-adic failure
  of `±Γ₁`, the strict inclusion `Γ₁ ⊊ Γ_p` at `q = 7`, the noncommuting monodromy test, and the
  vertical geodesic action against the radial left action of Tau Ceti's `dilation`.

Design choices made explicit: Hecke rings are Mathlib's `HeckeRing` with Tau Ceti's convolution
ring structure, and a double coset `UgU = ⊔ g_iU` acts on invariants by `Σ g_i·m`, with degree
`[U : U ∩ gUg⁻¹] = (gUg⁻¹).relIndex U`; Tau Ceti's `HeckeCoset.heckeSum` is the transposed
(coinvariant, right-coset) form of the same sum. Level subgroups are preimages, under reduction
modulo an ideal, of Tau Ceti's `upperTriangularGroup` and `upperUnitriangularGroup`, and the
projective `Γ₁` asks the diagonal entries to agree rather than to be `1`. The monodromy of a lifted
loop ending at `δ(ℓ)x₀` inverts the whole slice action through Mathlib's `MulEquiv.inv'`, because
Tau Ceti's loop product `g * h` means `h` followed by `g`. Twisting coefficients by a character is
Tau Ceti's `Representation.charTwist`, applied to the inverse character.
-/

namespace TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

open Matrix
open scoped HeckeCosetModule Pointwise MatrixGroups

noncomputable section

/-! ## Layer ALS.0: Symmetric spaces, arithmetic quotients and local geometry -/

-- Proper discontinuity, quotient topology and covering maps.
#check @ProperlyDiscontinuousSMul
#check @IsCoveringMap
-- The action of all of `GL(2, ℝ)` on `ℍ`, antiholomorphic for negative determinant, and the
-- fixed-point criteria for `i` in the two determinant signs.
#check @UpperHalfPlane.glAction
#check @UpperHalfPlane.σ
#check @UpperHalfPlane.gl_smul_I_eq_I_iff_of_pos
#check @UpperHalfPlane.gl_smul_I_eq_I_iff_of_neg
-- `ℍ` is contractible and discrete subgroups of `SL(2, ℝ)` act properly discontinuously.
#check (inferInstance : ContractibleSpace UpperHalfPlane)
#check @UpperHalfPlane.instProperlyDiscontinuousSL2RSubgroup
-- A free properly discontinuous action on a real vector space has a `K(Γ, 1)` quotient (ALS.0.9).
#check @IsQuotientCoveringMap.isEilenbergMacLaneSpaceOne_realTopologicalVectorSpace
-- Classical congruence subgroups of `SL_2(ℤ)` (ALS.0.10, ALS.6.4).
#check @CongruenceSubgroup.Gamma0
#check @CongruenceSubgroup.Gamma1

section SymmetricSpace

/-- **ALS.0.4, `symmetricSpace_GL2_Q`.** The subgroup `ℝ_{>0}·O(2)` of `GL(2, ℝ)`: the matrices
`g` with `gᵀg` a positive scalar. It is `K_∞A_∞` for `GL_{2,ℚ}`, the maximal compact subgroup
together with the identity component of the real points of the split centre. -/
def orthogonalTimesScalars : Subgroup (GL (Fin 2) ℝ) where
  carrier := {g | ∃ c : ℝ, 0 < c ∧ (g : Matrix (Fin 2) (Fin 2) ℝ).transpose * g = c • 1}
  one_mem' := ⟨1, one_pos, by simp⟩
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- **ALS.0.4.** The stabilizer of `i` for the action of all of `GL(2, ℝ)` on `ℍ` (positive
determinant holomorphically, negative determinant through complex conjugation) is
`ℝ_{>0}·O(2)`, so `GL(2, ℝ)/ℝ_{>0}O(2) ≅ ℍ` is the symmetric space of `GL_{2,ℚ}` with the split
centre removed. Without the scalars the quotient would be three-dimensional. The pointwise
criteria are Mathlib's `UpperHalfPlane.gl_smul_I_eq_I_iff_of_pos` and `_of_neg`. -/
theorem stabilizer_I_eq_orthogonalTimesScalars :
    MulAction.stabilizer (GL (Fin 2) ℝ) UpperHalfPlane.I = orthogonalTimesScalars := by
  sorry

/-- `diag(−1, 1)` fixes `i` (it acts by `z ↦ −z̄`) although it has negative determinant: the
stabilizer meets both components of `GL(2, ℝ)`. -/
example (g : GL (Fin 2) ℝ) (hg : (g : Matrix (Fin 2) (Fin 2) ℝ) = !![-1, 0; 0, 1]) :
    g ∈ orthogonalTimesScalars := by
  sorry

/-- `diag(2, 1)` is not in `ℝ_{>0}·O(2)`: it moves `i` to `2i`. -/
example (g : GL (Fin 2) ℝ) (hg : (g : Matrix (Fin 2) (Fin 2) ℝ) = !![2, 0; 0, 1]) :
    g ∉ orthogonalTimesScalars := by
  sorry

/-- **ALS.0.1, `cartanInvolution_GL_transposeInverse`.** The fixed points of the Cartan
involution `g ↦ (gᵀ)⁻¹` of `GL_n(ℝ)` are the orthogonal group `O(n)`. -/
theorem transposeInverse_fixed_iff_orthogonal {n : ℕ} (g : GL (Fin n) ℝ) :
    ((g⁻¹ : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ).transpose = g ↔
      (g : Matrix (Fin n) (Fin n) ℝ) ∈ Matrix.orthogonalGroup (Fin n) ℝ := by
  sorry

end SymmetricSpace

section Levels

variable {R : Type*} [CommRing R] {n : Type*} [Fintype n] [LinearOrder n]

/-- **ALS.0.10.** The matrices in `GL_n(R)` that are upper triangular modulo an ideal `I`: the
preimage of Tau Ceti's `upperTriangularGroup` of `GL_n(R/I)` under reduction modulo `I`. For `I`
the maximal ideal of a local ring this is the Iwahori subgroup; for `n = 2` and `I = (p^c)` it is
the `GL_2`-preimage of `Γ₀(p^c)`. -/
def upperTriangularMod (I : Ideal R) : Subgroup (GL n R) :=
  (TauCeti.upperTriangularGroup n (R ⧸ I)).comap (GeneralLinearGroup.map (Ideal.Quotient.mk I))

/-- Membership in `upperTriangularMod I`: every entry below the diagonal lies in `I`. -/
example (I : Ideal R) (g : GL n R) :
    g ∈ upperTriangularMod I ↔ ∀ i j, j < i → (g : Matrix n n R) i j ∈ I := by
  sorry

/-- **ALS.0.10.** The matrices that are unipotent upper triangular modulo `I`: the preimage of Tau
Ceti's `upperUnitriangularGroup` of `GL_n(R/I)` under reduction modulo `I`. -/
def unipotentMod (I : Ideal R) : Subgroup (GL n R) :=
  (TauCeti.upperUnitriangularGroup n (R ⧸ I)).comap (GeneralLinearGroup.map (Ideal.Quotient.mk I))

/-- Membership in `unipotentMod I`: upper triangular modulo `I` with diagonal entries `≡ 1`. -/
example (I : Ideal R) (g : GL n R) :
    g ∈ unipotentMod I ↔
      (∀ i j, j < i → (g : Matrix n n R) i j ∈ I) ∧ ∀ i, (g : Matrix n n R) i i - 1 ∈ I := by
  sorry

/-- **ALS.0.10, `LocallySymmetric.iwahori`.** The Iwahori subgroup of `GL_n` over a local ring: the
group that ReductiveGroupsPartII's `LevelSubgroups.iwahori` describes inside `GL_n(K)`, here inside
`GL_n(O)` as the case `I = 𝔪` of `upperTriangularMod`. -/
def iwahori (R : Type*) [CommRing R] [IsLocalRing R] (n : Type*) [Fintype n]
    [LinearOrder n] : Subgroup (GL n R) :=
  upperTriangularMod (IsLocalRing.maximalIdeal R)

/-- **ALS.0.10, `LocallySymmetric.iwahoriOne`.** The pro-`v` Iwahori subgroup, ReductiveGroupsPartII's
`LevelSubgroups.proPIwahori` inside `GL_n(O)`. -/
def iwahoriOne (R : Type*) [CommRing R] [IsLocalRing R] (n : Type*) [Fintype n]
    [LinearOrder n] : Subgroup (GL n R) :=
  unipotentMod (IsLocalRing.maximalIdeal R)

/-- **ALS.0.10, `LocallySymmetric.gamma1`.** The `GL_2`-preimage of the projective `Γ₁(I)`: upper
triangular modulo `I` with equal diagonal entries modulo `I` (not diagonal entries `1`). -/
def gamma1Mod (I : Ideal R) : Subgroup (GL (Fin 2) R) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) R) 1 0 ∈ I ∧
    (g : Matrix (Fin 2) (Fin 2) R) 1 1 - (g : Matrix (Fin 2) (Fin 2) R) 0 0 ∈ I}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- **ALS.0.10, `LocallySymmetric.gammaP`.** The `GL_2`-preimage of the projective `Γ_p(I)`: upper
triangular modulo `I` with ratio of diagonal entries of `p`-power order modulo `I`, written without
division as `d^{p^m} ≡ a^{p^m}`. -/
def gammaPMod (I : Ideal R) (p : ℕ) : Subgroup (GL (Fin 2) R) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) R) 1 0 ∈ I ∧ ∃ m : ℕ,
    (g : Matrix (Fin 2) (Fin 2) R) 1 1 ^ p ^ m - (g : Matrix (Fin 2) (Fin 2) R) 0 0 ^ p ^ m ∈ I}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- **ALS.0.10, `iwahori_index_GL2`.** `[GL_2(ℤ_p) : Iw_p] = p + 1`, the number of lines in
`F_p²`; the `ℤ_p` case of ReductiveGroupsPartII's check `iwahori_relIndex_two`. -/
theorem iwahori_index_GL2 (p : ℕ) [Fact p.Prime] : (iwahori ℤ_[p] (Fin 2)).index = p + 1 := by
  sorry

/-- **ALS.0.10, `LocallySymmetric.iwahori.index`.** `[Iw : Iw₁] = (q − 1)^n` for a residue field
with `q` elements. -/
theorem iwahoriOne_relIndex (R : Type*) [CommRing R] [IsLocalRing R] [Finite (IsLocalRing.ResidueField R)]
    (n : Type*) [Fintype n] [LinearOrder n] :
    (iwahoriOne R n).relIndex (iwahori R n) =
      (Nat.card (IsLocalRing.ResidueField R) - 1) ^ Fintype.card n := by
  sorry

/-- **`gamma0_eq_congruenceSubgroup`, the `2`-adic clause.** Over `ZMod 8` the scalar `3` lies in
the projective `Γ₁` although `3 ≠ ±1`: the unqualified `±Γ₁` description fails at `2^c`, `c ≥ 3`. -/
example (g : GL (Fin 2) (ZMod 8)) (hg : (g : Matrix (Fin 2) (Fin 2) (ZMod 8)) = !![3, 0; 0, 3]) :
    g ∈ gamma1Mod (⊥ : Ideal (ZMod 8)) ∧ (3 : ZMod 8) ≠ 1 ∧ (3 : ZMod 8) ≠ -1 := by
  sorry

/-- **`gammaP_ne_gamma1`.** For `p = 3` and `q = 7`, `diag(1, 2)` has diagonal ratio of order `3`,
so it lies in `Γ_3` but not in `Γ₁`: the inclusion `Γ₁ ⊂ Γ_p` is strict when `p ∣ q − 1`. -/
example (g : GL (Fin 2) (ZMod 7)) (hg : (g : Matrix (Fin 2) (Fin 2) (ZMod 7)) = !![1, 0; 0, 2]) :
    g ∈ gammaPMod (⊥ : Ideal (ZMod 7)) 3 ∧ g ∉ gamma1Mod (⊥ : Ideal (ZMod 7)) := by
  sorry

/-- **ALS.0.11, one pro-`v` factor does not suffice.** `(1, 1; −3, −2)` lies in the pro-`3`
Iwahori subgroup of `GL_2(ℤ_3)` and has order `3`, so a level whose only small factor is a single
pro-`v` Iwahori subgroup need not be neat. -/
example (g : GL (Fin 2) ℤ_[3]) (hg : (g : Matrix (Fin 2) (Fin 2) ℤ_[3]) = !![1, 1; -3, -2]) :
    g ∈ iwahoriOne ℤ_[3] (Fin 2) ∧ g ^ 3 = 1 ∧ g ≠ 1 := by
  sorry

end Levels

section Orientation

variable (F : Type*) [Field F] [NumberField F]

/-- **ALS.0.12, `LocallySymmetric.orientationCharacter_GL`.** The orientation character of
`Res_{F/ℚ} GL_m` on rational points: `ε(γ) = sign(N_{F/ℚ}(det γ))^{m−1}`. It is trivial for odd
`m`, and neatness does not force it to be trivial. -/
def glOrientationSign (m : ℕ) : GL (Fin m) F →* ℤˣ where
  toFun γ := if 0 < Algebra.norm ℚ ((γ : Matrix (Fin m) (Fin m) F).det) then 1 else (-1) ^ (m - 1)
  map_one' := by sorry
  map_mul' := by sorry

/-- **`orientationCharacter_GL2_Q`.** `diag(−1, 1)` reverses the orientation of `ℍ`. -/
example (γ : GL (Fin 2) ℚ) (hγ : (γ : Matrix (Fin 2) (Fin 2) ℚ) = !![-1, 0; 0, 1]) :
    glOrientationSign ℚ 2 γ = -1 := by
  sorry

/-- **`orientationSystem_GL_formula`, odd rank.** For `m = 3` the character is trivial. -/
example (γ : GL (Fin 3) ℚ) : glOrientationSign ℚ 3 γ = 1 := by
  sorry

/-- **ALS.0.13.** The element `(57, 455; 455, 3632)` of determinant `−1`, congruent to the scalar
`57` modulo `65`, reverses orientation; in `PGL_2` it lies in the neat level `K(5)K(13)`. -/
example (γ : GL (Fin 2) ℚ) (hγ : (γ : Matrix (Fin 2) (Fin 2) ℚ) = !![57, 455; 455, 3632]) :
    glOrientationSign ℚ 2 γ = -1 := by
  sorry

end Orientation

/-! ## Layer ALS.1: Arithmetic coefficients and Betti complexes -/

-- Local coefficient systems, their monodromy, relative singular chains and twisted cochains.
#check @TauCeti.LocalCoefficientSystem
#check @TauCeti.LocalCoefficientSystem.monodromyRepresentation
#check @TopPair.singularChainComplexFunctor
#check @TauCeti.LocalCoefficientSystem.twistedCochainComplex
-- Inversion from the opposite group, the endpoint convention of the monodromy (ALS.1.1).
#check @MulEquiv.inv'
-- Group cohomology, the comparison target at non-neat level (ALS.1.5), and its corestriction
-- (the trace at non-neat level, ALS.3.6).
#check @groupCohomology
#check @Rep.trivial
#check @TauCeti.groupCohomology.corestriction
-- Derived categories and idempotent completeness (ALS.1, ALS.4.9).
#check @DerivedCategory
#check @CategoryTheory.IsIdempotentComplete

section Slice

variable {R : Type*} [CommRing R] {V : Type*} [AddCommGroup V] [Module R V]
  {Γ Q : Type*} [Group Γ] [Group Q]

/-- **ALS.1.1.** The slice representation `γ ↦ ρ_{G(F)}(γ) ρ_{K_S}((g⁻¹γg)_S)` of an arithmetic
group, from two commuting actions on the coefficient module and the homomorphism `φ : Γ → K_S`.
There is no inverse on the second factor alone. -/
def sliceRepresentation (ρG : Representation R Γ V) (ρK : Representation R Q V) (φ : Γ →* Q)
    (hcomm : ∀ γ q, ρG γ * ρK q = ρK q * ρG γ) : Representation R Γ V where
  toFun γ := ρG γ * ρK (φ γ)
  map_one' := by simp
  map_mul' := by sorry

/-- **ALS.1.1, `LocallySymmetric.localSystem.monodromy`.** The monodromy of the associated local
system: a lifted loop ending at `δ(ℓ)x₀` defines `δ(ℓ) ∈ Γᵐᵒᵖ`, because Tau Ceti's loop product
`g * h` is `h` followed by `g`, and the monodromy is `ℓ ↦ ρ_Γ(δ(ℓ)⁻¹)`, inverting the whole slice
action through Mathlib's `MulEquiv.inv' : Γ ≃* Γᵐᵒᵖ`. -/
def endpointMonodromy {π : Type*} [Group π] (ρ : Representation R Γ V) (δ : π →* Γᵐᵒᵖ) :
    Representation R π V :=
  ρ.comp ((MulEquiv.inv' Γ).symm.toMonoidHom.comp δ)

/-- **`localSystem_eq_LocalCoefficientSystem`.** For the noncommuting `A = (1, 1; 0, 1)` and
`B = (1, 0; 1, 1)`, inverting the opposite product gives `A⁻¹B⁻¹`, which is not `(AB)⁻¹`: the
whole-inverse convention is a homomorphism for Tau Ceti's loop product, while inverting the
ordinary product is not. -/
example (A B : GL (Fin 2) ℚ) (hA : (A : Matrix (Fin 2) (Fin 2) ℚ) = !![1, 1; 0, 1])
    (hB : (B : Matrix (Fin 2) (Fin 2) ℚ) = !![1, 0; 1, 1]) :
    (MulEquiv.inv' _).symm (MulOpposite.op A * MulOpposite.op B) = A⁻¹ * B⁻¹ ∧
      A⁻¹ * B⁻¹ ≠ (A * B)⁻¹ := by
  sorry

end Slice

/-- **ALS.1.5, `RΓ_eq_groupCohomology_levelOne`.** At level `SL_2(Ẑ)` the Betti cohomology of
`SL_{2,ℚ}` is the group cohomology of `SL_2(ℤ)`, which has `H² = ℤ/12`, while the coarse quotient
`SL_2(ℤ)\ℍ ≅ ℂ` has vanishing `H²`. -/
theorem groupCohomology_SL2Z_two :
    Nonempty (groupCohomology (Rep.trivial ℤ SL(2, ℤ) ℤ) 2 ≃ₗ[ℤ] ZMod 12) := by
  sorry

/-- **ALS.1.5.** `H¹(SL_2(ℤ), ℤ) = 0`, since the abelianization of `SL_2(ℤ)` is finite. -/
theorem groupCohomology_SL2Z_one :
    Subsingleton (groupCohomology (Rep.trivial ℤ SL(2, ℤ) ℤ) 1) := by
  sorry

/-- **`RΓ_ne_coarse`, unboundedness.** The orbifold cohomology does not stop at the dimension `2` of
`ℍ`: `H⁴(SL_2(ℤ), ℤ) = ℤ/12` as well. -/
example : Nonempty (groupCohomology (Rep.trivial ℤ SL(2, ℤ) ℤ) 4 ≃ₗ[ℤ] ZMod 12) := by
  sorry

/-! ## Layer ALS.2: Borel–Serre corners and boundary strata -/

section Geodesic

open UpperHalfPlane

/-- **ALS.2.1, `LocallySymmetric.BorelSerre.geodesicAction`, for `SL_2` and the upper Borel.** The
geodesic action of `A_B ≅ ℝ` on `ℍ`: `t • (x + iy) = x + i e^{2t} y`. It moves every point
vertically, along the geodesics ending at the cusp `∞`. -/
def geodesicActionSL2 (t : ℝ) (z : ℍ) : ℍ :=
  ⟨z.re + (Real.exp (2 * t) * z.im : ℝ) * Complex.I, by
    have h := mul_pos (Real.exp_pos (2 * t)) z.im_pos
    simp only [Complex.add_im, Complex.ofReal_im, Complex.mul_im, Complex.ofReal_re,
      Complex.I_re, Complex.I_im, mul_zero, mul_one, zero_add, add_zero]
    exact h⟩

/-- **ALS.2.1, `LocallySymmetric.BorelSerre.geodesicAction_free`.** The geodesic action is an
action of the additive group `ℝ`. -/
theorem geodesicActionSL2_add (s t : ℝ) (z : ℍ) :
    geodesicActionSL2 (s + t) z = geodesicActionSL2 s (geodesicActionSL2 t z) := by
  sorry

/-- **ALS.2.1.** The geodesic action commutes with the unipotent radical `N_B(ℝ)` of the upper
Borel, acting by the translations `z ↦ b + z`. -/
theorem geodesicActionSL2_vadd (t b : ℝ) (z : ℍ) :
    geodesicActionSL2 t (b +ᵥ z) = b +ᵥ geodesicActionSL2 t z := by
  sorry

/-- The geodesic action fixes real parts. -/
theorem geodesicActionSL2_re (t : ℝ) (z : ℍ) : (geodesicActionSL2 t z).re = z.re := by
  sorry

/-- **`geodesicAction_ne_leftAction`.** The left action of Tau Ceti's
`dilation (2t) = diag(e^t, e^{−t}) ∈ SL(2, ℝ)` sends `z` to `e^{2t}z`, moving `1 + i` off the
vertical line `Re z = 1`, while the geodesic action keeps it there. -/
example (t : ℝ) (ht : t ≠ 0) (z : ℍ) (hz : (z : ℂ) = 1 + Complex.I) :
    (Matrix.SpecialLinearGroup.dilation (2 * t) • z).re ≠ (geodesicActionSL2 t z).re := by
  sorry

end Geodesic

/-! ## Layer ALS.3: Finite-level Hecke actions and correspondences -/

-- Hecke rings: double cosets, the coset module and Tau Ceti's convolution ring and degrees.
#check @IsHeckeTriple
#check @HeckeCoset.mk
#check @HeckeCosetModule.single
#check @HeckeCosetModule.instRingHeckeRing
#check @HeckeCoset.degree_eq_relIndex
-- The coinvariant (right-coset) form of the double-coset sum on a representation.
#check @HeckeCoset.heckeSum
#check @HeckeCoset.heckeSum_eq_sum_of_rightCosets
-- Twisting a representation by a character (ALS.3.12) and fixed vectors of `p`-groups (ALS.6.3).
#check @Representation.charTwist
#check @Representation.invariants_ne_bot_of_forall_pow_eq_one

section Hecke

variable {G : Type*} [Group G] (U : Subgroup G)

/-- **ALS.3.1.** The basis element `r·[UgU]` of the Hecke ring of `(G, U)` with coefficients in
`R`. -/
def heckeBasis (R : Type*) [Zero R] (g : G) (r : R) : 𝕋 (⊤ : Submonoid G) U R :=
  HeckeCosetModule.single R (HeckeCoset.mk U U ⟨g, Submonoid.mem_top g⟩) r

/-- **ALS.3.2, `LocallySymmetric.Hecke.heckeRing_normal`.** For a normal subgroup the Hecke ring
is the group ring of the quotient: double cosets are cosets and the structure constants of the
convolution product are `1` exactly when `γU = αβU`. -/
theorem heckeRing_normal [U.Normal] [IsHeckeTriple (⊤ : Submonoid G) U U] :
    Nonempty (𝕋 (⊤ : Submonoid G) U ℤ ≃+* MonoidAlgebra ℤ (G ⧸ U)) := by
  sorry

variable {M : Type*} [AddCommGroup M]

/-- **ALS.3.1, `LocallySymmetric.Hecke.smul_eq_trace`.** The operator `m ↦ Σ_i g_i·m` of a finite
family of representatives `g_i`; on `U`-invariants, for representatives of `UgU/U`, it is the
action of `[UgU]`. Tau Ceti's `HeckeCoset.heckeSum` is the coinvariant (right-coset) form of the
same sum; the two are exchanged by the contragredient with `g` replaced by `g⁻¹`. -/
def doubleCosetOperator (ρ : Representation ℤ G M) (reps : Finset G) : M →ₗ[ℤ] M :=
  ∑ r ∈ reps, ρ r

/-- `reps` is a set of representatives of the left cosets `g_iU` contained in `UgU`. -/
def IsDoubleCosetReps (g : G) (reps : Finset G) : Prop :=
  (∀ x : G, x ∈ DoubleCoset.doubleCoset g (U : Set G) (U : Set G) ↔
      ∃ r ∈ reps, (x : G ⧸ U) = (r : G ⧸ U)) ∧
    (reps : Set G).Pairwise fun r s => (r : G ⧸ U) ≠ (s : G ⧸ U)

/-- **ALS.3.1, `LocallySymmetric.Hecke.invariantsModule`.** For representatives of `UgU/U` the
double-coset operator preserves `U`-invariants. -/
theorem doubleCosetOperator_mem_invariants (ρ : Representation ℤ G M) (g : G) (reps : Finset G)
    (hreps : IsDoubleCosetReps U g reps) (m : M) (hm : ∀ u ∈ U, ρ u m = m) :
    ∀ u ∈ U, ρ u (doubleCosetOperator ρ reps m) = doubleCosetOperator ρ reps m := by
  sorry

/-- **ALS.3.1.** On `U`-invariants the operator does not depend on the representatives. -/
theorem doubleCosetOperator_indep (ρ : Representation ℤ G M) (g : G) (reps reps' : Finset G)
    (hreps : IsDoubleCosetReps U g reps) (hreps' : IsDoubleCosetReps U g reps') (m : M)
    (hm : ∀ u ∈ U, ρ u m = m) :
    doubleCosetOperator ρ reps m = doubleCosetOperator ρ reps' m := by
  sorry

/-- **`hecke_degree_eq_index`.** On the trivial module `ℤ` the operator of `UgU` is multiplication
by the degree `[U : U ∩ gUg⁻¹]`, Tau Ceti's `(gUg⁻¹).relIndex U`. -/
example (g : G) (reps : Finset G) (hreps : IsDoubleCosetReps U g reps) (z : ℤ) :
    doubleCosetOperator (1 : Representation ℤ G ℤ) reps z =
      ((ConjAct.toConjAct g • U).relIndex U : ℤ) * z := by
  sorry

/-- **`hecke_one_smul`.** The double coset `U1U = U` acts as the identity on invariants. -/
example (ρ : Representation ℤ G M) (m : M) (hm : ∀ u ∈ U, ρ u m = m) :
    doubleCosetOperator ρ {1} m = m := by
  sorry

variable (R : Type*) [CommRing R]

/-- **ALS.3.12, `LocallySymmetric.twistHecke`.** Twisting by a character `χ` trivial on `U`:
there is a ring automorphism of the Hecke ring sending `r·[UgU]` to `χ(g)⁻¹r·[UgU]`. On
coefficients the matching twist is Tau Ceti's `Representation.charTwist` at `χ⁻¹`. -/
theorem twistHecke_exists [IsHeckeTriple (⊤ : Submonoid G) U U] (χ : G →* Rˣ)
    (hχ : ∀ u ∈ U, χ u = 1) :
    ∃ f : 𝕋 (⊤ : Submonoid G) U R ≃+* 𝕋 (⊤ : Submonoid G) U R,
      ∀ (g : G) (r : R), f (heckeBasis U R g r) = heckeBasis U R g ((((χ g)⁻¹ : Rˣ) : R) * r) := by
  sorry

end Hecke

/-!
## Statements not typed at the pins

The following README targets need carriers that Mathlib and Tau Ceti do not provide at the pinned
commits; they are stated in `README.md` with their exact hypotheses and are not Lean declarations
here.

* Algebraic groups over number fields, their real points as Lie groups and algebraic Cartan
  involutions (twisted real forms): `IsCartanInvolution` and its API, `realPoints_cartanDatum`,
  `isMaximalCompact_fixedPoints`, `symmetricSpace` and its API, `symmetricSpace.contractible`.
* Adelic level quotients (AdelicAlgebraicGroups §4.4) and neat levels (§4.3): `X` and its API,
  `X.componentDecomposition`, `X.properlyDiscontinuous`, `X.manifold_of_neat`, `taylorWilesLevel`,
  `isNeat_of_two_proUnipotent`, `orientationSystem`, `nonorientable_neat_PGL2`.
* Parahoric group schemes (ReductiveGroupsPartII, Layer RG2.3): `iwahori.eq_parahoric`.
* Equivariant sheaves, their derived functors and supports, and singular cochains with supports:
  `localSystem`, `RΓ`, `RΓc`, `RΓrel`, `RΓ.refinementIndependence`, `RΓ.isoSingular`,
  `RΓ.isoGroupCohomology`, `RΓrel.perfect_of_freeCellModel`, `RΓ.baseChange`, `RΓ.pullback`,
  `RΓ.translate`.
* The Borel–Serre bordification as a manifold with corners and its strata:
  `BorelSerre.face`, `BorelSerre.bordification`, `BorelSerre.compact_quotient`,
  `BorelSerre.finiteTriangulation`, `BorelSerre.stratum`, `BorelSerre.unipotentLattice_cocompact`,
  `BorelSerre.parabolicArithmeticExtension`, `BorelSerre.stratum_fibration`,
  `BorelSerre.stratSpectralSequence`, `BorelSerre.mayerVietorisSpectralSequence`.
* Hecke operators on Betti complexes and their strict lifts: `Hecke.invariantsFunctor`,
  `Hecke.derivedInvariants`, `Hecke.heckeRing_prod`, `heckeAction`, `heckeComplex` and its API,
  `heckeAction_eq_correspondence`, `RΓ.trace`, `RΓ.mackey`, `heckeAction_mul`,
  `heckeAction_compatible`, `heckeAction_discrete_eq_topological`, `derivedHeckeAlgebra` (the
  derived Hecke image of IntegralHeckeAndGaloisDeterminants, Layer 2, applied to `RΓ(X_K, V)`),
  `twistMaximalIdeal`, `twistIso`, `oldformSplitting`.
* Boundary complexes and localization: `boundaryTriangle`, `Hecke.restrictParabolic`,
  `Hecke.integrateUnipotent`, `Hecke.satakeUnnormalized`, `BorelSerre.stratum_hecke_restrict`,
  `nomizu`, `kostant_splittingField`, `BorelSerre.stratum_kostant`,
  `BorelSerre.stratum_hochschildSerre`, `BorelSerre.boundary_localized_vanishing`, `heckeLocalize`,
  `IsGaloisType`, `IsEisenstein`, `IsEisensteinCG`, `boundary_vanishing_of_eigenvalues`,
  `boundary_isEisenstein_GL`, `boundary_localized_eq_siegel`.
* Topological manifolds with boundary carrying orientation local systems and Verdier duality:
  `BorelSerre.manifoldWithBoundary`, `verdierDuality`, `dualityPairing` and its API,
  `verdierDuality_hecke`, `verdierDuality_triangle`, `verdierDuality_of_invertibleOrder`.
* Flat bundles, automorphic forms and Galois representations: `deRhamIso`, `deRham_pairing`,
  `moderateGrowthIso`, `automorphicComparisonMap`, `FrankeInput`, `automorphicComparison`,
  `cuspidalCohomology` and its API, `cuspidal_contributes_GL`, `GaloisInput.GL`,
  `GaloisInput.unitary`, `GaloisInput.induced_charpoly`, `GaloisInput.unitary_constituents`,
  `nonEisenstein_cuspidal_range`, `unitary_middleDegree_cuspidal`.
* Finite covers of level quotients: `RΓrel.descent`, `hochschildSerre`, `lowestDegree_descent`,
  `towerChecks`.
-/

end

end TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

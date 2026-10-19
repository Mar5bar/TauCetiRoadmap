import Mathlib
import TauCeti.Algebra.Group.ElementaryTwoQuotient.Basic
import TauCeti.GroupTheory.GroupExtension.Character
import TauCeti.InformationTheory.Coding.Weight.Enumerator
import TauCeti.RepresentationTheory.Homological.GroupHomology.Transfer.Basic

/-!
# Fixed fibers, parity obstructions and finite reduced-multiplier calculations: representative target signatures

`README.md` is the roadmap. This file states the targets that can be expressed using the pinned
libraries and gives light definitions over their native carriers. These are suggested forms,
not an exhaustive checklist. The supplied reduced covers, marked extensions and unit actions are
prerequisites from InverseGaloisAndArithmeticFundamentalGroups IG.3.4–IG.3.5; they are not
redeclared here. Targets requiring these carriers are stated in the README.

RS.0.1 uses only IG.3.4's section-cocycle class map and universal coefficients. Its full
five-term exactness and stem-surjectivity targets apply without finiteness. IG.3.4's finite
oriented Schur-cover comparison follows independently from universal coefficients and the
pinned injective character transgression for stem extensions. The reduced-cover homology
applications in RS.1 use both comparisons.

`Multiplier G` abbreviates integral `H₂(G, ℤ)`, written additively. Commutators use
`XYX⁻¹Y⁻¹`. Degree coordinates are integers. Finite parity calculations use Tau Ceti's existing
elementary-2 quotient. The marked finite models use the native swap semidirect product.
-/

noncomputable section

open CategoryTheory
open scoped commutatorElement TensorProduct

namespace TauCetiRoadmap.InductionRestrictionPartII

open TauCeti

/-! ## Native conventions -/

/-- Native integral second group homology, used as an abbreviation throughout the README. -/
abbrev Multiplier (G : Type) [Group G] : Type :=
  groupHomology.H2 (Rep.trivial ℤ G ℤ)

/-- **The torsion-image filtration** `B_t` (RS.4.8): the image of the `2^t`-torsion of `A` in
`B = A / A²`. -/
def torsionImageFiltration (A : Type) [CommGroup A] (t : ℕ) :
    Submodule (ZMod 2) (ElementaryTwoQuotient A) :=
  Submodule.span (ZMod 2) (elementaryTwoQuotientMk '' {a : A | a ^ (2 ^ t) = 1})

/-- **The two-primary obstruction threshold** `t_A(b)` (RS.4.9): the least `t` at which
the square class of `b` belongs to `B_t`. -/
def obstructionThreshold {A : Type} [CommGroup A] [Finite A] (b : A) : ℕ :=
  sInf {t : ℕ | elementaryTwoQuotientMk b ∈ torsionImageFiltration A t}

/-- **The joint parity map** `L_t(v) = (a v, s v mod B_t)` (RS.4.15). -/
def jointParityMap {V U B : Type} [AddCommGroup V] [Module (ZMod 2) V] [AddCommGroup U]
    [Module (ZMod 2) U] [AddCommGroup B] [Module (ZMod 2) B]
    (a : V →ₗ[ZMod 2] U) (s : V →ₗ[ZMod 2] B) (W : Submodule (ZMod 2) B) :
    V →ₗ[ZMod 2] U × (B ⧸ W) :=
  a.prod (W.mkQ ∘ₗ s)

/-- The cyclic group of order two. -/
abbrev C₂ : Type := Multiplicative (ZMod 2)

/-- The swap action of `C₂` on `G × G`. -/
def swapAction (G : Type) [Group G] : C₂ →* MulAut (G × G) where
  toFun g := if g.toAdd.val = 0 then 1 else MulEquiv.prodComm
  map_one' := rfl
  map_mul' := by
    intro g h
    obtain ⟨g, rfl⟩ := Multiplicative.ofAdd.surjective g
    obtain ⟨h, rfl⟩ := Multiplicative.ofAdd.surjective h
    fin_cases g <;> fin_cases h <;> ext x <;> rfl

/-- The **swap wreath product** `W(G) = (G × G) ⋊ C₂`. -/
abbrev SwapWreath (G : Type) [Group G] : Type :=
  (G × G) ⋊[swapAction G] C₂

/-- The product map `G × G → Gᵃᵇ`, `(a, b) ↦ [a][b]`. -/
def abelianizedSum (G : Type) [Group G] : G × G →* Abelianization G :=
  Abelianization.of.comp (MonoidHom.fst G G) * Abelianization.of.comp (MonoidHom.snd G G)

/-- The **sum-kernel model** (RS.6.9): the kernel of `W(G) → Gᵃᵇ`, `((a, b), t) ↦ [a][b]`. For
abelian `G` it is the anti-diagonal model `F(G)` of RS.6.8, and for perfect `G` it is all of
`W(G)`. -/
def sumKernelModel (G : Type) [Group G] : Subgroup (SwapWreath G) :=
  (SemidirectProduct.lift (φ := swapAction G) (abelianizedSum G)
    (1 : C₂ →* Abelianization G) (by
    intro g
    ext x
    change abelianizedSum G ((swapAction G g) x) =
      (1 : Abelianization G) * abelianizedSum G x * 1⁻¹
    rw [one_mul, inv_one, mul_one]
    by_cases hg : g.toAdd.val = 0
    · rw [show swapAction G g = 1 from ite_eq_left hg]
      rfl
    · rw [show swapAction G g = MulEquiv.prodComm from ite_eq_right hg]
      change Abelianization.of x.2 * Abelianization.of x.1 =
        Abelianization.of x.1 * Abelianization.of x.2
      exact mul_comm _ _)).ker

/-- The **outside involutions** of a subgroup of `W(G)`: elements with nontrivial `C₂`
coordinate and square `1`. -/
def outsideInvolutions {G : Type} [Group G] (F : Subgroup (SwapWreath G)) : Set F :=
  {x | (x : SwapWreath G).right ≠ 1 ∧ x ^ 2 = 1}

/-! ## Headline theorems -/

/-- **The two-adic survival criterion** (RS.4.10), in the form used fiber by fiber: for finite
`A`, odd `q > 1` and `r = (q - 1) / 2`, the equation `h ^ (q - 1) = b ^ r` (equivalently
`= b ^ (-r)`) has a solution iff `v₂(q - 1) ≥ t_A(b) + 1`. -/
theorem two_adic_survival {A : Type} [CommGroup A] [Finite A] (b : A) (q : ℕ) (hq : Odd q)
    (hq1 : 1 < q) :
    (∃ h : A, h ^ (q - 1) = b ^ ((q - 1) / 2)) ↔
      obstructionThreshold b + 1 ≤ padicValNat 2 (q - 1) := by
  sorry

/-- **Ranks count surviving parities** (RS.4.17): a translate of the kernel of a linear map on a
finite `F₂`-space has `2 ^ (dim V - rank L)` elements. -/
theorem rank_parity_count {V W : Type} [AddCommGroup V] [Module (ZMod 2) V] [Finite V]
    [AddCommGroup W] [Module (ZMod 2) W] (L : V →ₗ[ZMod 2] W) (v₀ : V) :
    Nat.card {v : V // v - v₀ ∈ LinearMap.ker L} =
      2 ^ (Module.finrank (ZMod 2) V - Module.finrank (ZMod 2) (LinearMap.range L)) := by
  sorry

/-- **The ordinary multiplier of the anti-diagonal model** (RS.6.8). The README identifies
it with the reduced multiplier and then with the exterior square. -/
theorem antidiagonal_multiplier (G : Type) [CommGroup G] [Finite G]
    (hodd : Odd (Nat.card G)) : Nonempty (Multiplier (sumKernelModel G) ≃+ Multiplier G) := by
  sorry

-- The homological transfer and its index identity are supplied at the pin.
#check TauCeti.groupHomology.transfer
#check TauCeti.groupHomology.transfer_comp_map_subtype_id

-- The finite oriented cover comparison uses the supplied character transgression.
#check TauCeti.FactorSet.characterTransgression_injective_of_range_inl_le_commutator

/-! ## Layer RS.0: exactness and Hall-coinvariant homology comparisons -/

section RS0

variable {A E G : Type} [Group A] [Group E] [Group G]

/-- **The tail of the five-term sequence** (RS.0.1): for any extension, `Eᵃᵇ → Gᵃᵇ` is onto. -/
theorem abelianization_map_surjective (S : GroupExtension A E G) :
    Function.Surjective (Abelianization.map S.rightHom) := by
  sorry

/-- **Exactness at `Eᵃᵇ`** (RS.0.1): the kernel of `Eᵃᵇ → Gᵃᵇ` is the image of the kernel. -/
theorem abelianization_exact_of_extension (S : GroupExtension A E G) :
    (Abelianization.map S.rightHom).ker = (Abelianization.of.comp S.inl).range := by
  sorry

/-- **Stem extensions do not change the abelianization** (RS.0.1): `Eᵃᵇ → Gᵃᵇ` is bijective. -/
theorem abelianization_map_bijective_of_stem (S : GroupExtension A E G) (hcentral : S.inl.range ≤ Subgroup.center E)
    (hstem : S.inl.range ≤ commutator E) :
    Function.Bijective (Abelianization.map S.rightHom) := by
  sorry

/-- **Positive-degree integral homology of a finite group is killed by its order** (RS.0.2). -/
theorem integralHomology_card_smul (G : Type) [Group G] [Finite G] (n : ℕ)
    (z : groupHomology (Rep.trivial ℤ G ℤ) (n + 1)) : Nat.card G • z = 0 := by
  sorry

/-- **Positive-degree integral homology of a finite group is finite** (RS.0.2). -/
theorem integralHomology_finite (G : Type) [Group G] [Finite G] (n : ℕ) :
    Finite (groupHomology (Rep.trivial ℤ G ℤ) (n + 1)) := by
  sorry

/-- Hall-subgroup corestriction identifies multiplier coinvariants with the Hall-primary image,
and sends each coinvariant class to its inclusion-induced homology class. -/
theorem multiplier_hallPart (G : Type) [Group G] [Finite G]
    (H : Subgroup G) [H.Normal] (hcoprime : Nat.Coprime (Nat.card H) H.index)
    (ρ : Representation ℤ G (Multiplier H))
    (hρ : ∀ g z, ρ g z = groupHomology.map
      (A := Rep.trivial ℤ H ℤ) (B := Rep.trivial ℤ H ℤ)
      (MulAut.conjNormal g).toMonoidHom (Rep.ofHom ⟨LinearMap.id, by intro h; rfl⟩) 2 z) :
    let ι := groupHomology.map (A := Rep.trivial ℤ H ℤ) (B := Rep.trivial ℤ G ℤ)
      H.subtype (Rep.ofHom ⟨LinearMap.id, by intro h; rfl⟩) 2
    (∃ e : Representation.Coinvariants ρ ≃+ LinearMap.range ι.hom,
      ∀ z, (e (Representation.Coinvariants.mk ρ z) : Multiplier G) = ι z) ∧
    (∀ z : Multiplier G, z ∈ LinearMap.range ι.hom ↔
      ∃ k : ℕ, (Nat.card H) ^ k • z = 0) := by
  sorry

end RS0

/-! ## Layer RS.1: power laws and local normalization -/

section RS1

/-- **Commuting-pair power law**, at the chain level (RS.1.1). This states the new theorem
without redeclaring IG's oriented homological commutator. -/
theorem commutator_order_boundary {G : Type} [Group G] {x y : G} (h : Commute x y) (n : ℕ) :
    n • (Finsupp.single (x, y) (1 : ℤ) - Finsupp.single (y, x) 1) -
      (Finsupp.single (x ^ n, y) 1 - Finsupp.single (y, x ^ n) 1) ∈
        groupHomology.boundaries₂ (Rep.trivial ℤ G ℤ) := by
  sorry

/-- **Local normalized factors commute** (RS.1.3): in any central extension, two elements
above `1` or one fixed `c₀` commute. -/
theorem local_factors_commute {A E G : Type} [Group A] [Group E] [Group G]
    (S : GroupExtension A E G) (hcentral : S.inl.range ≤ Subgroup.center E)
    (c₀ : G) (X Y : E) (hX : S.rightHom X = 1 ∨ S.rightHom X = c₀)
    (hY : S.rightHom Y = 1 ∨ S.rightHom Y = c₀) : Commute X Y := by
  sorry

/-- A class-injective extension projection gives a unique conjugate over the chosen representative. -/
theorem localClassNormalization_unique {A E G : Type} [Group A] [Group E] [Group G]
    (S : GroupExtension A E G) (e : E)
    (hclass : ∀ u v : E, IsConj e u → IsConj e v → S.rightHom u = S.rightHom v → u = v)
    (c₀ : G) (he : IsConj (S.rightHom e) c₀) :
    ∃! z : E, IsConj e z ∧ S.rightHom z = c₀ := by
  sorry

end RS1

/-! ## Layer RS.3: degree restrictions -/

section RS3

/-- **The bounded total-degree slice** `L_{n, ≥ M}` (RS.3.3): degrees with every coordinate at
least `M` and total degree `n`. A subset, not a subgroup. -/
def boundedDegreeSlice (D : Type) [Fintype D] (n M : ℤ) : Set (D → ℤ) :=
  {m | (∀ d, M ≤ m d) ∧ ∑ d, m d = n}

/-- Membership in a bounded degree slice records both the lower bound and the total degree. -/
theorem boundedDegreeSlice_mem {D : Type} [Fintype D] (n M : ℤ) (m : D → ℤ) :
    m ∈ boundedDegreeSlice D n M ↔ (∀ d, M ≤ m d) ∧ ∑ d, m d = n := by
  sorry

/-- Permuting class coordinates preserves the bounded total-degree slice. -/
theorem boundedDegreeSlice_invariant {D : Type} [Fintype D] (σ : D ≃ D)
    (n M : ℤ) (m : D → ℤ) :
    m ∘ σ ∈ boundedDegreeSlice D n M ↔ m ∈ boundedDegreeSlice D n M := by
  sorry

/-- **The power-fixed degree lattice** `L_{≡ q}` (RS.3.4): degree vectors fixed by the class
permutation of `q`. -/
def powerFixedDegree {D : Type} (σ : D ≃ D) : AddSubgroup (D →₀ ℤ) :=
  AddMonoidHom.eqLocus (Finsupp.domCongr σ).toAddMonoidHom (AddMonoidHom.id _)

/-- Power-fixed degrees are exactly the vectors constant along the class permutation. -/
theorem powerFixedDegree_fixed {D : Type} (σ : D ≃ D) (m : D →₀ ℤ) :
    m ∈ powerFixedDegree σ ↔ ∀ d, m (σ d) = m d := by
  sorry

/-- Fixed degrees on a finite class set are integer functions on its permutation orbits. -/
theorem powerFixedDegree_orbits {D : Type} [Fintype D] (σ : Equiv.Perm D) :
    ∃ e : powerFixedDegree σ ≃+
        (Quotient (MulAction.orbitRel (Subgroup.zpowers σ) D) → ℤ),
      ∀ m d, e m (Quotient.mk _ d) = (m : D →₀ ℤ) d := by
  sorry

/-- Total degree weights each constant orbit coordinate by the size of its orbit. -/
theorem powerFixedDegree_weighted_sum {D : Type} [Fintype D] (σ : Equiv.Perm D)
    [Fintype (Quotient (MulAction.orbitRel (Subgroup.zpowers σ) D))]
    (m : powerFixedDegree σ)
    (u : Quotient (MulAction.orbitRel (Subgroup.zpowers σ) D) → ℤ)
    (hu : ∀ d, u (Quotient.mk _ d) = (m : D →₀ ℤ) d) :
    ∑ d, (m : D →₀ ℤ) d = ∑ O,
      (Nat.card {d : D // Quotient.mk (MulAction.orbitRel (Subgroup.zpowers σ) D) d = O} : ℤ) *
        u O := by
  sorry

end RS3

/-! ## Layer RS.4: fixed fibers, square obstructions and parity -/

section RS4

/-- A lift of an element whose square is one has central square in a central extension. -/
theorem involution_square_central {A E G : Type} [Group A] [Group E] [Group G]
    (S : GroupExtension A E G) (hcentral : S.inl.range ≤ Subgroup.center E)
    (X : E) (hX : (S.rightHom X) ^ 2 = 1) :
    X ^ 2 ∈ S.inl.range ∧ X ^ 2 ∈ Subgroup.center E := by
  sorry

/-- **Square-times-torsion solvability** (RS.4.4): in a commutative group, `b ^ r` is a
`2r`-th power exactly when `b` is a square times an `r`-torsion element. -/
theorem square_torsion_solvability {A : Type} [CommGroup A] (b : A) (r : ℕ) :
    (∃ h : A, b ^ r = h ^ (2 * r)) ↔ ∃ a t : A, t ^ r = 1 ∧ b = a ^ 2 * t := by
  sorry

/-- A power-equation fiber has the torsion cardinality when the obstruction is solvable,
and is empty otherwise. -/
theorem all_fixed_fibers_power_count {A : Type} [CommGroup A] [Finite A]
    (b : A) (r : ℕ) :
    ((∃ a t : A, t ^ r = 1 ∧ b = a ^ 2 * t) →
      Nat.card {h : A // h ^ (2 * r) = b ^ (- (r : ℤ))} =
        Nat.card {h : A // h ^ (2 * r) = 1}) ∧
    ((¬ ∃ a t : A, t ^ r = 1 ∧ b = a ^ 2 * t) →
      Nat.card {h : A // h ^ (2 * r) = b ^ (- (r : ℤ))} = 0) := by
  sorry

/-- The first torsion-image space is zero, since the one-torsion subgroup is trivial. -/
theorem torsionImageFiltration_zero (A : Type) [CommGroup A] :
    torsionImageFiltration A 0 = ⊥ := by
  sorry

/-- Increasing the two-power torsion bound increases its image in the square quotient. -/
theorem torsionImageFiltration_mono (A : Type) [CommGroup A] {t u : ℕ} (htu : t ≤ u) :
    torsionImageFiltration A t ≤ torsionImageFiltration A u := by
  sorry

/-- `torsionImageFiltration_exhaustive`: for finite `A`, `B_t = B` once `2^t` kills the
`2`-primary part. -/
theorem torsionImageFiltration_exhaustive (A : Type) [CommGroup A] [Finite A]
    (e : ℕ) (hkill : ∀ a : A, (∃ k : ℕ, a ^ (2 ^ k) = 1) → a ^ (2 ^ e) = 1) :
    torsionImageFiltration A e = ⊤ := by
  sorry

/-- In a cyclic two-group the torsion image reaches the square quotient at its exponent. -/
theorem torsionImageFiltration_cyclic (e t : ℕ) :
    torsionImageFiltration (Multiplicative (ZMod (2 ^ e))) t =
      if t < e then ⊥ else ⊤ := by
  sorry

/-- `obstructionThreshold_zero`: `t_A(b) = 0` iff `b` is a square (for finite `A`). -/
theorem obstructionThreshold_zero {A : Type} [CommGroup A] [Finite A] (b : A) :
    obstructionThreshold b = 0 ↔ IsSquare b := by
  sorry

/-- The obstruction threshold depends only on the square class. -/
theorem obstructionThreshold_class {A : Type} [CommGroup A] [Finite A] (b c : A)
    (h : elementaryTwoQuotientMk b = elementaryTwoQuotientMk c) :
    obstructionThreshold b = obstructionThreshold c := by
  sorry

/-- An exponent bound for the two-primary subgroup bounds every obstruction threshold. -/
theorem obstructionThreshold_bound {A : Type} [CommGroup A] [Finite A] (b : A)
    (e : ℕ) (hkill : ∀ a : A, (∃ k : ℕ, a ^ (2 ^ k) = 1) → a ^ (2 ^ e) = 1) :
    obstructionThreshold b ≤ e := by
  sorry

/-- A generator of a nontrivial cyclic two-group has threshold equal to its exponent. -/
theorem obstructionThreshold_cyclic (e : ℕ) (he : 0 < e) :
    obstructionThreshold (Multiplicative.ofAdd (1 : ZMod (2 ^ e))) = e := by
  sorry

/-- **Involution classes span an elementary abelian abelianization** (RS.4.11). -/
theorem involution_abelianization {G : Type} [Group G] (c : Set G) (hgen : Subgroup.closure c = ⊤)
    (hinv : ∀ x ∈ c, x ^ 2 = 1) (u : Abelianization G) : u ^ 2 = 1 := by
  sorry

/-- Lift-square columns in the native square quotient are unchanged by conjugacy or lift choice. -/
theorem lift_square_columns {A E G : Type} [CommGroup A] [Group E] [Group G]
    (S : GroupExtension A E G) (hcentral : S.inl.range ≤ Subgroup.center E)
    (X Y : E) (a b : A) (ha : S.inl a = X ^ 2) (hb : S.inl b = Y ^ 2)
    (hconj : IsConj (S.rightHom X) (S.rightHom Y)) :
    elementaryTwoQuotientMk a = elementaryTwoQuotientMk b := by
  sorry

/-- The joint parity map records compatibility and the quotient of the square obstruction. -/
theorem jointParityMap_apply {V U B : Type} [AddCommGroup V] [Module (ZMod 2) V]
    [AddCommGroup U] [Module (ZMod 2) U] [AddCommGroup B] [Module (ZMod 2) B]
    (a : V →ₗ[ZMod 2] U) (s : V →ₗ[ZMod 2] B) (W : Submodule (ZMod 2) B) (v : V) :
    jointParityMap a s W v = (a v, W.mkQ (s v)) := by
  sorry

/-- The joint constraint vanishes exactly when compatibility and the square obstruction vanish. -/
theorem jointParityMap_kernel {V U B : Type} [AddCommGroup V] [Module (ZMod 2) V] [AddCommGroup U]
    [Module (ZMod 2) U] [AddCommGroup B] [Module (ZMod 2) B]
    (a : V →ₗ[ZMod 2] U) (s : V →ₗ[ZMod 2] B) (W : Submodule (ZMod 2) B) (v : V) :
    v ∈ LinearMap.ker (jointParityMap a s W) ↔ a v = 0 ∧ s v ∈ W := by
  sorry

/-- Enlarging the allowed obstruction space enlarges the joint kernel. -/
theorem jointParityMap_mono_kernel {V U B : Type} [AddCommGroup V] [Module (ZMod 2) V]
    [AddCommGroup U] [Module (ZMod 2) U] [AddCommGroup B] [Module (ZMod 2) B]
    (a : V →ₗ[ZMod 2] U) (s : V →ₗ[ZMod 2] B) (W W' : Submodule (ZMod 2) B)
    (h : W ≤ W') :
    LinearMap.ker (jointParityMap a s W) ≤ LinearMap.ker (jointParityMap a s W') := by
  sorry

/-- At the exhaustive obstruction space only the abelianization constraint remains. -/
theorem jointParityMap_last {V U B : Type} [AddCommGroup V] [Module (ZMod 2) V]
    [AddCommGroup U] [Module (ZMod 2) U] [AddCommGroup B] [Module (ZMod 2) B]
    (a : V →ₗ[ZMod 2] U) (s : V →ₗ[ZMod 2] B) :
    LinearMap.ker (jointParityMap a s ⊤) = LinearMap.ker a := by
  sorry

/-- Translating the compatibility and square constraints gives one affine joint-kernel coset. -/
theorem surviving_parities_linear {V U B : Type} [AddCommGroup V] [Module (ZMod 2) V]
    [AddCommGroup U] [Module (ZMod 2) U] [AddCommGroup B] [Module (ZMod 2) B]
    (a : V →ₗ[ZMod 2] U) (s : V →ₗ[ZMod 2] B) (W : Submodule (ZMod 2) B) (v₀ : V) :
    {v : V | a v = a v₀ ∧ s (v - v₀) ∈ W} =
      {v : V | v - v₀ ∈ LinearMap.ker (jointParityMap a s W)} := by
  sorry

/-- Nested joint kernels give the exact-threshold histogram as a difference of rank counts. -/
theorem rank_parity_threshold_count {V U B : Type} [AddCommGroup V] [Module (ZMod 2) V]
    [Finite V] [AddCommGroup U] [Module (ZMod 2) U] [AddCommGroup B] [Module (ZMod 2) B]
    (a : V →ₗ[ZMod 2] U) (s : V →ₗ[ZMod 2] B) (W W' : Submodule (ZMod 2) B)
    (h : W ≤ W') (v₀ : V) :
    Nat.card {v : V // v - v₀ ∈ LinearMap.ker (jointParityMap a s W') ∧
      v - v₀ ∉ LinearMap.ker (jointParityMap a s W)} =
      2 ^ (Module.finrank (ZMod 2) V -
        Module.finrank (ZMod 2) (LinearMap.range (jointParityMap a s W'))) -
      2 ^ (Module.finrank (ZMod 2) V -
        Module.finrank (ZMod 2) (LinearMap.range (jointParityMap a s W))) := by
  sorry

/-- A bijective abelianization constraint leaves the signature parity alone, with zero obstruction. -/
theorem independent_classes_linear {V U B : Type} [AddCommGroup V] [Module (ZMod 2) V]
    [AddCommGroup U] [Module (ZMod 2) U] [AddCommGroup B] [Module (ZMod 2) B]
    (a : V →ₗ[ZMod 2] U) (s : V →ₗ[ZMod 2] B) (ha : Function.Bijective a) (v₀ : V) :
    {v : V | a v = a v₀} = {v₀} ∧ s (v₀ - v₀) = 0 := by
  sorry

/-- **The lower-bound coordinate decomposition** (RS.4.18). Each degree with a prescribed
binary parity has a unique nonnegative excess vector above its least allowed representative. -/
theorem parity_lowerBound_translation (N N₀ : ℕ) (ε : Fin N → ZMod 2) (m : Fin N → ℤ) :
    ((∀ i, (N₀ : ℤ) ≤ m i) ∧ ∀ i, (m i : ZMod 2) = ε i) ↔
      ∃! k : Fin N → ℕ, ∀ i,
        m i = (N₀ : ℤ) + ((ε i + (N₀ : ZMod 2)).val : ℤ) + 2 * (k i : ℤ) := by
  sorry

/-- **The integer-degree generating series** (RS.4.18). The translated native weight
polynomial accounts for the parity of the coordinate lower bound. -/
theorem parity_degree_generatingSeries (N N₀ : ℕ) (C : Set (Fin N → ZMod 2)) :
    PowerSeries.mk (fun n : ℕ ↦ (Nat.card {m : Fin N → ℤ //
      (∀ i, (N₀ : ℤ) ≤ m i) ∧ (fun i ↦ (m i : ZMod 2)) ∈ C ∧
        ∑ i, m i = (n : ℤ)} : ℤ)) =
      (PowerSeries.X : PowerSeries ℤ) ^ (N * N₀) *
        (Set.weightPolynomial ((fun ε : Fin N → ZMod 2 ↦
          fun i ↦ ε i + (N₀ : ZMod 2)) '' C)).toPowerSeries *
        (PowerSeries.invOfUnit (1 - PowerSeries.X ^ 2 : PowerSeries ℤ) 1) ^ N := by
  sorry

end RS4

/-! ## Layer RS.6: finite marked-group comparisons and applications -/

section RS6

variable {G : Type} [Group G]

/-- **Odd-index-two homology reduction** (RS.6.1), its part expressed on native homology.
The reduced-multiplier consequence requires IG's quotient carrier and stays in the README. -/
theorem odd_index_two_reduction [Finite G] (H : Subgroup G) [H.Normal] (hodd : Odd (Nat.card H))
    (hidx : H.index = 2) : Odd (Nat.card (Multiplier G)) := by
  sorry

/-- **Centralizer commutator multiplicativity** (RS.6.2), before reading commutators through
the kernel inclusion. Both projected commutators must vanish. -/
theorem centralizer_commutator_hom {A E : Type} [Group A] [Group E] (S : GroupExtension A E G)
    (hcentral : S.inl.range ≤ Subgroup.center E) (X Y Z : E)
    (hy : Commute (S.rightHom X) (S.rightHom Y))
    (hz : Commute (S.rightHom X) (S.rightHom Z)) :
    ⁅X, Y * Z⁆ = ⁅X, Y⁆ * ⁅X, Z⁆ := by
  sorry

/-- Centralizer generators and one lift per marked class generate all lift-commutator relations. -/
theorem centralizer_generator_relations {A E D : Type} [Group A] [Group E]
    (S : GroupExtension A E G) (hcentral : S.inl.range ≤ Subgroup.center E)
    (c : Set G) (x : D → G) (hx : ∀ d, x d ∈ c)
    (hc : ∀ g ∈ c, ∃ d, IsConj g (x d))
    (T : D → Set G) (hT : ∀ d, Subgroup.closure (T d) = Subgroup.centralizer {x d})
    (X : D → E) (hX : ∀ d, S.rightHom (X d) = x d)
    (Y : ∀ d, T d → E) (hY : ∀ d t, S.rightHom (Y d t) = t) :
    Subgroup.closure {w : E | ∃ u v : E, S.rightHom u ∈ c ∧
      Commute (S.rightHom u) (S.rightHom v) ∧ w = ⁅u, v⁆} =
    Subgroup.closure {w : E | ∃ d t, w = ⁅X d, Y d t⁆} := by
  sorry

/-- Sum-kernel membership retains the product of the two abelianized base coordinates. -/
theorem sumKernelModel_mem (x : SwapWreath G) :
    x ∈ sumKernelModel G ↔ Abelianization.of x.left.1 * Abelianization.of x.left.2 = 1 := by
  sorry

/-- Outside involutions in the sum kernel have inverse base coordinates in the original group. -/
theorem sumKernelModel_outside (x : sumKernelModel G) :
    x ∈ outsideInvolutions (sumKernelModel G) ↔
      (x : SwapWreath G).right ≠ 1 ∧
        (x : SwapWreath G).left.2 = ((x : SwapWreath G).left.1)⁻¹ := by
  sorry

/-- `sumKernelModel_card`: `|sumKernelModel G| = 2 |G| |[G, G]|`. -/
theorem sumKernelModel_card [Finite G] :
    Nat.card (sumKernelModel G) = 2 * Nat.card G * Nat.card (commutator G) := by
  sorry

/-- `sumKernelModel_eq_top_of_perfect`: for a perfect group the sum kernel is all of `W(G)`, the
full wreath model of RS.6.9. -/
theorem sumKernelModel_eq_top_of_perfect (h : commutator G = ⊤) : sumKernelModel G = ⊤ := by
  sorry

/-- An involutive action embeds its semidirect product as the graph model, with its outside marking. -/
theorem graphModel_embedding (φ : C₂ →* MulAut G) :
    ∃ e : (G ⋊[φ] C₂) →* SwapWreath G, Function.Injective e ∧
      (∀ x, (e x).left = (x.left, φ (Multiplicative.ofAdd 1) x.left) ∧
        (e x).right = x.right) ∧
      (∀ x : G ⋊[φ] C₂, (x.right ≠ 1 ∧ x ^ 2 = 1) ↔
        x.right ≠ 1 ∧ φ (Multiplicative.ofAdd 1) x.left = x.left⁻¹) := by
  sorry

/-- **The anti-diagonal marking** (RS.6.8): for every abelian `G` the outside involutions generate
`F(G)`, and for finite `G` of odd order they form one conjugacy class. -/
theorem antidiagonal_marking (G : Type) [CommGroup G] :
    Subgroup.closure (outsideInvolutions (sumKernelModel G)) = ⊤ ∧
      (Finite G → Odd (Nat.card G) →
        ∀ x ∈ outsideInvolutions (sumKernelModel G), ∀ y ∈ outsideInvolutions (sumKernelModel G),
          IsConj x y) := by
  sorry

/-- The abelian sum kernel is the anti-diagonal subgroup in both swap coordinates. -/
theorem antidiagonalModel_mem (G : Type) [CommGroup G] (x : SwapWreath G) :
    x ∈ sumKernelModel G ↔ x.left.2 = x.left.1⁻¹ := by
  sorry

/-- The cyclic anti-diagonal model is dihedral, with outside involutions corresponding to reflections. -/
theorem antidiagonalModel_dihedral (n : ℕ) :
    ∃ e : sumKernelModel (Multiplicative (ZMod n)) ≃* DihedralGroup n,
      ∀ x, x ∈ outsideInvolutions (sumKernelModel (Multiplicative (ZMod n))) ↔
        ∃ i : ZMod n, e x = DihedralGroup.sr i := by
  sorry

/-- **The degree-two Künneth comparison for abelian groups** (RS.6.8). The README fixes
its tensor summand by the oriented cross-factor commuting-pair cycles. -/
theorem multiplier_prod_abelian (A B : Type) [CommGroup A] [CommGroup B] :
    ∃ e : Multiplier (A × B) ≃+
        Multiplier A × Multiplier B × (Additive A ⊗[ℤ] Additive B),
      (∀ z : Multiplier A, e (groupHomology.map
        (A := Rep.trivial ℤ A ℤ) (B := Rep.trivial ℤ (A × B) ℤ)
        (MonoidHom.inl A B) (Rep.ofHom ⟨LinearMap.id, by intro g; rfl⟩) 2 z) = (z, 0, 0)) ∧
      (∀ z : Multiplier B, e (groupHomology.map
        (A := Rep.trivial ℤ B ℤ) (B := Rep.trivial ℤ (A × B) ℤ)
        (MonoidHom.inr A B) (Rep.ofHom ⟨LinearMap.id, by intro g; rfl⟩) 2 z) = (0, z, 0)) ∧
      (∀ (a : A) (b : B) (z : groupHomology.cycles₂ (Rep.trivial ℤ (A × B) ℤ)),
        (z : (A × B) × (A × B) →₀ ℤ) =
          Finsupp.single ((a, 1), (1, b)) 1 - Finsupp.single ((1, b), (a, 1)) 1 →
        e (groupHomology.H2π (Rep.trivial ℤ (A × B) ℤ) z) =
          (0, 0, Additive.ofMul a ⊗ₜ[ℤ] Additive.ofMul b)) := by
  sorry

/-- **The exterior square of a finite abelian group** (RS.6.8). The README specifies the
comparison by sending an exterior product to its oriented commuting-pair class. -/
theorem abelian_multiplier_exteriorSquare (A : Type) [CommGroup A] [Finite A] :
    ∃ e : (⋀[ℤ]^2 (Additive A)) ≃+ Multiplier A,
      ∀ (a b : A) (z : groupHomology.cycles₂ (Rep.trivial ℤ A ℤ)),
        (z : A × A →₀ ℤ) = Finsupp.single (a, b) 1 - Finsupp.single (b, a) 1 →
        e (exteriorPower.ιMulti ℤ 2 ![Additive.ofMul a, Additive.ofMul b]) =
          groupHomology.H2π (Rep.trivial ℤ A ℤ) z := by
  sorry

end RS6

/-!
## README targets requiring carriers absent at the pins

* RS.0: the supplied class map's `extensionClassMap_exact_left`, `extensionClassMap_exact_mid`,
  and `extensionClassMap_surjective_of_stem`.
* RS.1: `localClassNormalization` on the supplied reduced cover with its remaining API,
  and `homology_image`.
* RS.3: `kernel_action_aut`, `finite_level_action`, `DegreeOrbitSet`, the actual marked-kernel
  and twisted restrictions of `boundedDegreeSlice` and `powerFixedDegree`.
* RS.4: `squareObstruction`, `fixed_fiber_equation`,
  `odd_parity_fiber`, `even_parity_fiber`,
  `paritySquareMap`, `affine_compatible_parities`, `independent_classes`, the fixed-fiber count
  for the marked unit action, and its affine-coset description of surviving parities.

* RS.6: `centralizer_generator_quotient`,
  `finite_parity_comparison`,
  `order96_fixed_fibers` and `table_fixed_fiber_application`. The table's individual multiplier
  values are explicit input hypotheses of the conditional applications. The light `sumKernelModel` specializes to `order96Type`
  at `A₄` and to `antidiagonalModel` for abelian groups; `outsideInvolutions` retains their marking.
  The reduced-multiplier comparison for the odd abelian anti-diagonal model uses IG.3.4's
  relation subgroup and quotient.

The twisted preimage theorem `boundedDegreeSlice_preimage` uses the supplied twist carrier.
`graphModel_embedding` states the graph construction and its marking on native semidirect products;
`graphModel_embedding_apply`, `graphModel_embedding_injective`, `graphModel_card` and
`graphModel_outside` are its README API. `order96Type_kernel`, `order96Type_swap`,
`order96Type_outside`, `antidiagonalModel_card` and
`antidiagonalModel_outside` specialize the native models.

Every theorem and every API and Check for these targets is specified in the README. None of the
supplied IG constructions is an additional target of this file.
-/

end TauCetiRoadmap.InductionRestrictionPartII

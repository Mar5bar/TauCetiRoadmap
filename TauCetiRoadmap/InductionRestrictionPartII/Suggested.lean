import Mathlib
import TauCeti.Algebra.Group.ElementaryTwoQuotient.Basic
import TauCeti.GroupTheory.GroupExtension.Character
import TauCeti.InformationTheory.Coding.Weight.Enumerator
import TauCeti.RepresentationTheory.Homological.GroupHomology.Transfer.Basic

/-!
# Fixed fibers, parity obstructions and finite reduced-multiplier calculations: representative target signatures

`README.md` is the roadmap. This file states the targets that can be expressed using the pinned
libraries and gives light definitions over their native carriers. These are suggested forms,
not an exhaustive checklist. The supplied reduced covers,
marked extensions and unit actions are prerequisites from InverseGaloisAndArithmeticFundamentalGroups
IG.3.4–IG.3.5; they are not redeclared here. Targets requiring those carriers not provided by the pins are listed
at the end and stated fully in the README.

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

-- The homological transfer and its index identity are supplied at the pin.
#check TauCeti.groupHomology.transfer
#check TauCeti.groupHomology.transfer_comp_map_subtype_id

-- The finite oriented cover comparison uses the supplied character transgression.
#check TauCeti.FactorSet.characterTransgression_injective_of_range_inl_le_commutator

/-! ## Layer RS.0: exactness and Hall-coinvariant homology comparisons -/

section RS0

/-- Native integral second group homology, used as an abbreviation throughout the README. -/
abbrev Multiplier (G : Type) [Group G] : Type :=
  groupHomology.H2 (Rep.trivial ℤ G ℤ)

/-- The integral multiplier of the cyclic group of order three vanishes. -/
example : Subsingleton (Multiplier (Multiplicative (ZMod 3))) := by
  sorry

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

/-- `extensionFiveTerm_test_4`: centrality is not needed for the tail; for `S₃ → C₂` the kernel
`A₃` dies in the abelianization. -/
example : (Abelianization.of.comp (alternatingGroup (Fin 3)).subtype).range = ⊥ := by
  sorry

/-- **Positive-degree integral homology of a finite group is killed by its order** (RS.0.2). -/
theorem integralHomology_card_smul (G : Type) [Group G] [Finite G] (n : ℕ)
    (z : groupHomology (Rep.trivial ℤ G ℤ) (n + 1)) : Nat.card G • z = 0 := by
  sorry

/-- **Positive-degree integral homology of a finite group is finite** (RS.0.2). -/
theorem integralHomology_finite (G : Type) [Group G] [Finite G] (n : ℕ) :
    Finite (groupHomology (Rep.trivial ℤ G ℤ) (n + 1)) := by
  sorry

/-- `integralHomology_test_3`: degree zero is excluded; `H₀(C₂, ℤ) ≅ ℤ` is infinite. -/
example : Infinite (groupHomology (Rep.trivial ℤ (Multiplicative (ZMod 2)) ℤ) 0) := by
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

end RS1

/-! ## Layer RS.3: degree restrictions -/

section RS3

/-- **The bounded total-degree slice** `L_{n, ≥ M}` (RS.3.3): degrees with every coordinate at
least `M` and total degree `n`. A subset, not a subgroup. -/
def boundedDegreeSlice (D : Type) [Fintype D] (n M : ℤ) : Set (D → ℤ) :=
  {m | (∀ d, M ≤ m d) ∧ ∑ d, m d = n}

/-- `boundedDegreeSlice_test_2`: for two classes, `n = 3` and `M = 1`, the slice is
`{(1, 2), (2, 1)}`. -/
example : boundedDegreeSlice (Fin 2) 3 1 = {![1, 2], ![2, 1]} := by
  sorry

/-- `boundedDegreeSlice_test_3`: for nonempty `D`, `n = 0` and `M = 1` the slice is empty. -/
example : boundedDegreeSlice (Fin 1) 0 1 = ∅ := by
  sorry

/-- **The power-fixed degree lattice** `L_{≡ q}` (RS.3.4): degree vectors fixed by the class
permutation of `q`. -/
def powerFixedDegree {D : Type} (σ : D ≃ D) : AddSubgroup (D →₀ ℤ) :=
  AddMonoidHom.eqLocus (Finsupp.domCongr σ).toAddMonoidHom (AddMonoidHom.id _)

/-- `powerFixedDegree_test_2`: for the swap of two classes the fixed vectors are `(a, a)`. -/
example (m : Fin 2 →₀ ℤ) : m ∈ powerFixedDegree (Equiv.swap (0 : Fin 2) 1) ↔ m 0 = m 1 := by
  sorry

/-- `powerFixedDegree_test_1`: the identity permutation fixes every integer degree vector. -/
example (D : Type) : powerFixedDegree (Equiv.refl D) = ⊤ := by
  sorry

end RS3

/-! ## Layer RS.4: fixed fibers, square obstructions and parity -/

section RS4

open TauCeti

/-- **Square-times-torsion solvability** (RS.4.4): in a commutative group, `b ^ r` is a
`2r`-th power exactly when `b` is a square times an `r`-torsion element. -/
theorem square_torsion_solvability {A : Type} [CommGroup A] (b : A) (r : ℕ) :
    (∃ h : A, b ^ r = h ^ (2 * r)) ↔ ∃ a t : A, t ^ r = 1 ∧ b = a ^ 2 * t := by
  sorry

/-- **The torsion-image filtration** `B_t` (RS.4.8): the image of the `2^t`-torsion of `A` in
`B = A / A²`. -/
def torsionImageFiltration (A : Type) [CommGroup A] (t : ℕ) :
    Submodule (ZMod 2) (ElementaryTwoQuotient A) :=
  Submodule.span (ZMod 2) (elementaryTwoQuotientMk '' {a : A | a ^ (2 ^ t) = 1})

/-- `torsionImageFiltration_mono`. -/
theorem torsionImageFiltration_mono (A : Type) [CommGroup A] {t u : ℕ} (htu : t ≤ u) :
    torsionImageFiltration A t ≤ torsionImageFiltration A u := by
  sorry

/-- `torsionImageFiltration_exhaustive`: for finite `A`, `B_t = B` once `2^t` kills the
`2`-primary part. -/
theorem torsionImageFiltration_exhaustive (A : Type) [CommGroup A] [Finite A]
    (e : ℕ) (hkill : ∀ a : A, (∃ k : ℕ, a ^ (2 ^ k) = 1) → a ^ (2 ^ e) = 1) :
    torsionImageFiltration A e = ⊤ := by
  sorry

/-- `torsionImageFiltration_test_2`: for `A = C₈` the filtration vanishes at `t = 2`; a
definition by the torsion subgroup itself (without passing to `A / A²`) would not. -/
example : torsionImageFiltration (Multiplicative (ZMod 8)) 2 = ⊥ := by
  sorry

/-- **The two-primary obstruction threshold** `t_A(b)` (RS.4.9): the least `t` with the square
class of `b` in `B_t`. -/
def obstructionThreshold {A : Type} [CommGroup A] [Finite A] (b : A) : ℕ :=
  sInf {t : ℕ | elementaryTwoQuotientMk b ∈ torsionImageFiltration A t}

/-- `obstructionThreshold_zero`: `t_A(b) = 0` iff `b` is a square (for finite `A`). -/
theorem obstructionThreshold_zero {A : Type} [CommGroup A] [Finite A] (b : A) :
    obstructionThreshold b = 0 ↔ IsSquare b := by
  sorry

/-- `obstructionThreshold_test_3`: a generator of `C₈` has threshold `3`. -/
example : obstructionThreshold (Multiplicative.ofAdd (1 : ZMod 8)) = 3 := by
  sorry

/-- **The two-adic survival criterion** (RS.4.10), in the form used fiber by fiber: for finite
`A`, odd `q > 1` and `r = (q - 1) / 2`, the equation `h ^ (q - 1) = b ^ r` (equivalently
`= b ^ (-r)`) has a solution iff `v₂(q - 1) ≥ t_A(b) + 1`. -/
theorem two_adic_survival {A : Type} [CommGroup A] [Finite A] (b : A) (q : ℕ) (hq : Odd q)
    (hq1 : 1 < q) :
    (∃ h : A, h ^ (q - 1) = b ^ ((q - 1) / 2)) ↔
      obstructionThreshold b + 1 ≤ padicValNat 2 (q - 1) := by
  sorry

/-- `allFixedFibers_test`, a negative control for the count: in `C₄` with `b` a generator and
`q = 3`, the equation `h ^ 2 = b` has no solution although `A[2]` has two elements. -/
example : ¬ ∃ h : Multiplicative (ZMod 4), h ^ 2 = Multiplicative.ofAdd 1 := by
  sorry

/-- At `q = 1`, every element solves the fixed-fiber equation. The valuation criterion
requires `q > 1`, since `padicValNat 2 0 = 0`. -/
example {A : Type} [CommGroup A] (b : A) (h : A) : h ^ (1 - 1 : ℕ) = b ^ ((1 - 1) / 2 : ℕ) := by
  sorry

/-- **Involution classes span an elementary abelian abelianization** (RS.4.11). -/
theorem involution_abelianization {G : Type} [Group G] (c : Set G) (hgen : Subgroup.closure c = ⊤)
    (hinv : ∀ x ∈ c, x ^ 2 = 1) (u : Abelianization G) : u ^ 2 = 1 := by
  sorry

/-- **The joint parity map** `L_t(v) = (a v, s v mod B_t)` (RS.4.15). -/
def jointParityMap {V U B : Type} [AddCommGroup V] [Module (ZMod 2) V] [AddCommGroup U]
    [Module (ZMod 2) U] [AddCommGroup B] [Module (ZMod 2) B]
    (a : V →ₗ[ZMod 2] U) (s : V →ₗ[ZMod 2] B) (W : Submodule (ZMod 2) B) :
    V →ₗ[ZMod 2] U × (B ⧸ W) :=
  a.prod (W.mkQ ∘ₗ s)

/-- `jointParityMap_kernel`. -/
theorem jointParityMap_kernel {V U B : Type} [AddCommGroup V] [Module (ZMod 2) V] [AddCommGroup U]
    [Module (ZMod 2) U] [AddCommGroup B] [Module (ZMod 2) B]
    (a : V →ₗ[ZMod 2] U) (s : V →ₗ[ZMod 2] B) (W : Submodule (ZMod 2) B) (v : V) :
    v ∈ LinearMap.ker (jointParityMap a s W) ↔ a v = 0 ∧ s v ∈ W := by
  sorry

/-- `jointParityMap_test_2`: with `a = 0`, `s = id` and `W = 0`, the kernel is `0`.
This includes `F₂`, where using `a` alone would give the whole one-dimensional space. -/
example {V : Type} [AddCommGroup V] [Module (ZMod 2) V] :
    LinearMap.ker (jointParityMap (0 : V →ₗ[ZMod 2] V) LinearMap.id ⊥) = ⊥ := by
  sorry

/-- **Ranks count surviving parities** (RS.4.17): a translate of the kernel of a linear map on a
finite `F₂`-space has `2 ^ (dim V - rank L)` elements. -/
theorem rank_parity_count {V W : Type} [AddCommGroup V] [Module (ZMod 2) V] [Finite V]
    [AddCommGroup W] [Module (ZMod 2) W] (L : V →ₗ[ZMod 2] W) (v₀ : V) :
    Nat.card {v : V // v - v₀ ∈ LinearMap.ker L} =
      2 ^ (Module.finrank (ZMod 2) V - Module.finrank (ZMod 2) (LinearMap.range L)) := by
  sorry

/-- The fixed-fiber sign (RS.4.3), in the central marked model `C₁₄ → C₂`:
`b = a⁻²` in the kernel `C₇` gives `h² = a²`, solved by `a`, not `a⁻¹`. -/
example :
    (Multiplicative.ofAdd (1 : ZMod 7)) ^ 2 =
        (Multiplicative.ofAdd (-2 : ZMod 7))⁻¹ ∧
      (Multiplicative.ofAdd (-1 : ZMod 7)) ^ 2 ≠
        (Multiplicative.ofAdd (-2 : ZMod 7))⁻¹ := by
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

/-- The cyclic group of order two. -/
abbrev C₂ : Type := Multiplicative (ZMod 2)

/-- The native cyclic group `C₂` has exactly two elements. -/
example : Nat.card C₂ = 2 := by
  sorry

/-- The swap action of `C₂` on `G × G`. -/
def swapAction (G : Type) [Group G] : C₂ →* MulAut (G × G) where
  toFun g := if g.toAdd.val = 0 then 1 else MulEquiv.prodComm
  map_one' := rfl
  map_mul' := by
    intro g h
    obtain ⟨g, rfl⟩ := Multiplicative.ofAdd.surjective g
    obtain ⟨h, rfl⟩ := Multiplicative.ofAdd.surjective h
    fin_cases g <;> fin_cases h <;> ext x <;> rfl

/-- The nontrivial swap exchanges unequal coordinates; the identity fixes them. -/
example : swapAction (Multiplicative (ZMod 3)) (Multiplicative.ofAdd 1)
    (Multiplicative.ofAdd 1, Multiplicative.ofAdd 2) =
      (Multiplicative.ofAdd 2, Multiplicative.ofAdd 1) ∧
    swapAction (Multiplicative (ZMod 3)) 1
      (Multiplicative.ofAdd 1, Multiplicative.ofAdd 2) =
        (Multiplicative.ofAdd 1, Multiplicative.ofAdd 2) := by
  sorry

/-- The **swap wreath product** `W(G) = (G × G) ⋊ C₂`. -/
abbrev SwapWreath (G : Type) [Group G] : Type :=
  (G × G) ⋊[swapAction G] C₂

/-- The swap wreath product of `C₃` has eighteen elements. -/
example : Nat.card (SwapWreath (Multiplicative (ZMod 3))) = 18 := by
  sorry

/-- The product map `G × G → Gᵃᵇ`, `(a, b) ↦ [a][b]`. -/
def abelianizedSum (G : Type) [Group G] : G × G →* Abelianization G :=
  Abelianization.of.comp (MonoidHom.fst G G) * Abelianization.of.comp (MonoidHom.snd G G)

/-- In `C₃`, addition of the two abelianized coordinates accepts `(1,2)` and rejects `(1,1)`. -/
example :
    abelianizedSum (Multiplicative (ZMod 3))
      (Multiplicative.ofAdd 1, Multiplicative.ofAdd 2) = 1 ∧
    abelianizedSum (Multiplicative (ZMod 3))
      (Multiplicative.ofAdd 1, Multiplicative.ofAdd 1) ≠ 1 := by
  sorry

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
def outsideInvolutions (F : Subgroup (SwapWreath G)) : Set F :=
  {x | (x : SwapWreath G).right ≠ 1 ∧ x ^ 2 = 1}

/-- The identity squares to one but is excluded from the outside marking. -/
example : (1 : (⊤ : Subgroup (SwapWreath C₂))) ∉
    outsideInvolutions (⊤ : Subgroup (SwapWreath C₂)) := by
  sorry

/-- `sumKernelModel_card`: `|sumKernelModel G| = 2 |G| |[G, G]|`. -/
theorem sumKernelModel_card [Finite G] :
    Nat.card (sumKernelModel G) = 2 * Nat.card G * Nat.card (commutator G) := by
  sorry

/-- `sumKernelModel_eq_top_of_perfect`: for a perfect group the sum kernel is all of `W(G)`, the
full wreath model of RS.6.9. -/
theorem sumKernelModel_eq_top_of_perfect (h : commutator G = ⊤) : sumKernelModel G = ⊤ := by
  sorry

/-- `sumKernelModel_test_2`: the sum-kernel model of `A₄` has order `96` (the order-96 type of
RS.6.6, Table 2 row 8). -/
example : Nat.card (sumKernelModel (alternatingGroup (Fin 4))) = 96 := by
  sorry

/-- `sumKernelModel_test_1`, sum not difference: in `W(C₃)` the pair `((1, 2), 1)` (additive
residues) lies in the sum kernel and `((1, 1), 1)` does not. -/
example :
    (⟨(Multiplicative.ofAdd (1 : ZMod 3), Multiplicative.ofAdd 2), 1⟩ :
        SwapWreath (Multiplicative (ZMod 3))) ∈ sumKernelModel _ ∧
      (⟨(Multiplicative.ofAdd (1 : ZMod 3), Multiplicative.ofAdd 1), 1⟩ :
        SwapWreath (Multiplicative (ZMod 3))) ∉ sumKernelModel _ := by
  sorry

/-- **The anti-diagonal marking** (RS.6.8): for every abelian `G` the outside involutions generate
`F(G)`, and for finite `G` of odd order they form one conjugacy class. -/
theorem antidiagonal_marking (G : Type) [CommGroup G] :
    Subgroup.closure (outsideInvolutions (sumKernelModel G)) = ⊤ ∧
      (Finite G → Odd (Nat.card G) →
        ∀ x ∈ outsideInvolutions (sumKernelModel G), ∀ y ∈ outsideInvolutions (sumKernelModel G),
          IsConj x y) := by
  sorry

/-- **The ordinary multiplier of the anti-diagonal model** (RS.6.8). The README identifies
it with the reduced multiplier and then with the exterior square. -/
theorem antidiagonal_multiplier (G : Type) [CommGroup G] [Finite G]
    (hodd : Odd (Nat.card G)) : Nonempty (Multiplier (sumKernelModel G) ≃+ Multiplier G) := by
  sorry

/-- **The degree-two Künneth comparison for abelian groups** (RS.6.8). The README fixes
its tensor summand by the oriented cross-factor commuting-pair cycles. -/
theorem multiplier_prod_abelian (A B : Type) [CommGroup A] [CommGroup B] :
    Nonempty (Multiplier (A × B) ≃+
      Multiplier A × Multiplier B × (Additive A ⊗[ℤ] Additive B)) := by
  sorry

/-- **The exterior square of a finite abelian group** (RS.6.8). The README specifies the
comparison by sending an exterior product to its oriented commuting-pair class. -/
theorem abelian_multiplier_exteriorSquare (A : Type) [CommGroup A] [Finite A] :
    Nonempty ((⋀[ℤ]^2 (Additive A)) ≃+ Multiplier A) := by
  sorry

end RS6

/-! ## Native-carrier Checks -/

section NativeChecks

open TauCeti

local notation "C₃" => Multiplicative (ZMod 3)
local notation "C₄" => Multiplicative (ZMod 4)
local notation "C₈" => Multiplicative (ZMod 8)
local notation "V₂" => Fin 2 → ZMod 2

/-- The trivial group has zero integral multiplier. -/
example : Subsingleton (Multiplier (PUnit : Type)) := by
  sorry

/-- The multiplier of the Klein four group is cyclic of order two. -/
example : Nonempty (Multiplier (C₂ × C₂) ≃+ ZMod 2) := by
  sorry

/-- The split-central inclusion remains injective on abelianization, including infinite kernels. -/
example (A G : Type) [CommGroup A] [Group G] :
    Function.Injective (Abelianization.map (MonoidHom.inl A G)) ∧
      Function.Surjective (Abelianization.map (MonoidHom.snd A G)) := by
  sorry

/-- The nonsplit cyclic extension has an injective abelianized kernel of order two. -/
example : ∃ S : GroupExtension C₂ C₄ C₂,
    S.inl (Multiplicative.ofAdd 1) = Multiplicative.ofAdd 2 ∧
    S.rightHom (Multiplicative.ofAdd 1) = Multiplicative.ofAdd 1 ∧
    Function.Injective (Abelianization.of.comp S.inl) ∧
    Nat.card (Abelianization.map S.rightHom).ker = 2 ∧ IsEmpty S.Splitting := by
  sorry

/-- In the dihedral stem extension, the central kernel dies on abelianization. -/
example : ∃ S : GroupExtension C₂ (DihedralGroup 4) (C₂ × C₂),
    S.inl (Multiplicative.ofAdd 1) = DihedralGroup.r 2 ∧
    S.inl.range ≤ Subgroup.center (DihedralGroup 4) ∧
    S.inl.range ≤ commutator (DihedralGroup 4) ∧
    (Abelianization.of.comp S.inl).range = ⊥ ∧
    Function.Bijective (Abelianization.map S.rightHom) := by
  sorry

/-- Positive-degree integral homology of the trivial group vanishes. -/
example (n : ℕ) : Subsingleton (groupHomology (Rep.trivial ℤ (PUnit : Type) ℤ) (n + 1)) := by
  sorry

/-- Odd positive degrees of cyclic order-two homology are cyclic of order two. -/
example (k : ℕ) : Nonempty (groupHomology (Rep.trivial ℤ C₂ ℤ) (2 * k + 1) ≃+ ZMod 2) := by
  sorry

/-- Even positive degrees of cyclic order-two homology vanish. -/
example (k : ℕ) : Subsingleton (groupHomology (Rep.trivial ℤ C₂ ℤ) (2 * k + 2)) := by
  sorry

/-- The order of the group does not annihilate the degree-zero class of one. -/
example : 2 • groupHomology.H0π (Rep.trivial ℤ C₂ ℤ) (1 : ℤ) ≠ 0 := by
  sorry

/-- `multiplier_hallPart_test_1`: with trivial complement, the inclusion induces a bijection on multipliers. -/
example (H : Type) [Group H] [Finite H] :
    Function.Bijective (groupHomology.map (A := Rep.trivial ℤ H ℤ)
      (B := Rep.trivial ℤ (H ⋊[(1 : (PUnit : Type) →* MulAut H)] (PUnit : Type)) ℤ)
      (SemidirectProduct.inl (φ := (1 : (PUnit : Type) →* MulAut H)))
      (Rep.ofHom ⟨LinearMap.id, by intro g; rfl⟩) 2) := by
  sorry

/-- `multiplier_hallPart_test_2`: inversion on the rank-two odd group preserves its nonzero multiplier. -/
example : Nonempty (Multiplier (sumKernelModel (C₃ × C₃)) ≃+ ZMod 3) := by
  sorry

/-- `multiplier_hallPart_test_3`: without coprimality, vanishing factor multipliers do not give a vanishing product multiplier. -/
example : Subsingleton (Multiplier C₂) ∧ Nonempty (Multiplier (C₂ × C₂) ≃+ ZMod 2) ∧
    ¬ Function.Surjective (groupHomology.map (A := Rep.trivial ℤ C₂ ℤ)
      (B := Rep.trivial ℤ (C₂ × C₂) ℤ) (MonoidHom.inl C₂ C₂)
      (Rep.ofHom ⟨LinearMap.id, by intro g; rfl⟩) 2) := by
  sorry

/-- The zero-power boundary is the negative unit cycle. -/
example {G : Type} [Group G] (y : G) :
    groupHomology.d₃₂ (Rep.trivial ℤ G ℤ)
      (-(Finsupp.single (1, 1, y) (1 : ℤ) - Finsupp.single (1, y, 1) 1 +
        Finsupp.single (y, 1, 1) 1)) =
      -(Finsupp.single (1, y) 1 - Finsupp.single (y, 1) 1) := by
  sorry

/-- The first-power boundary difference is zero. -/
example {G : Type} [Group G] (x y : G) :
    (1 : ℕ) • (Finsupp.single (x, y) (1 : ℤ) - Finsupp.single (y, x) 1) -
      (Finsupp.single (x ^ 1, y) 1 - Finsupp.single (y, x ^ 1) 1) = 0 := by
  sorry

/-- A commuting involution gives a twice-cycle boundary without forcing its class to vanish. -/
example {G : Type} [Group G] (x y : G) (h : Commute x y) (hx : x ^ 2 = 1) :
    2 • (Finsupp.single (x, y) (1 : ℤ) - Finsupp.single (y, x) 1) ∈
      groupHomology.boundaries₂ (Rep.trivial ℤ G ℤ) := by
  sorry

/-- Pair reversal negates the oriented cycle. -/
example {G : Type} [Group G] (x y : G) :
    Finsupp.single (y, x) (1 : ℤ) - Finsupp.single (x, y) 1 =
      -(Finsupp.single (x, y) 1 - Finsupp.single (y, x) 1) := by
  sorry

/-- `boundedDegreeSlice_test_1`: the unique empty degree has total zero. -/
example : boundedDegreeSlice (Fin 0) 0 1 = Set.univ := by
  sorry

/-- No empty degree has negative total. -/
example : boundedDegreeSlice (Fin 0) (-1) 1 = ∅ := by
  sorry

/-- `powerFixedDegree_test_3`: swap-fixed degrees cannot have odd total; the unrestricted slice contains both basis vectors. -/
example :
    {m : Fin 2 →₀ ℤ | m ∈ powerFixedDegree (Equiv.swap 0 1) ∧
      (fun i ↦ m i) ∈ boundedDegreeSlice (Fin 2) 1 0} = ∅ ∧
    ![1, 0] ∈ boundedDegreeSlice (Fin 2) 1 0 ∧
    ![0, 1] ∈ boundedDegreeSlice (Fin 2) 1 0 := by
  sorry

/-- Odd powers of a cyclic order-eight generator have the same nonzero square class. -/
example :
    elementaryTwoQuotientMk (Multiplicative.ofAdd (1 : ZMod 8)) =
      elementaryTwoQuotientMk (Multiplicative.ofAdd (3 : ZMod 8)) ∧
    elementaryTwoQuotientMk (Multiplicative.ofAdd (1 : ZMod 8)) ≠ 0 ∧
    elementaryTwoQuotientMk (Multiplicative.ofAdd (2 : ZMod 8)) = 0 := by
  sorry

/-- The square-times-torsion equation fails at two and succeeds at eight for this generator. -/
example : (¬ ∃ h : C₈, (Multiplicative.ofAdd 1 : C₈) ^ 2 = h ^ (2 * 2)) ∧
    (∃ h : C₈, (Multiplicative.ofAdd 1 : C₈) ^ 8 = h ^ (2 * 8)) := by
  sorry

/-- `torsionImageFiltration_test_1`: an odd-order group has zero square quotient and zero torsion-image filtration. -/
example (A : Type) [CommGroup A] [Finite A] (hodd : Odd (Nat.card A)) (t : ℕ) :
    torsionImageFiltration A t = ⊥ ∧ torsionImageFiltration A t = ⊤ := by
  sorry

/-- The cyclic order-eight filtration reaches the full quotient exactly at stage three. -/
example : torsionImageFiltration C₈ 0 = ⊥ ∧ torsionImageFiltration C₈ 1 = ⊥ ∧
    torsionImageFiltration C₈ 3 = ⊤ := by
  sorry

/-- `torsionImageFiltration_test_3`: the order-two element of the cyclic order-eight group has zero square class. -/
example : elementaryTwoQuotientMk (Multiplicative.ofAdd (4 : ZMod 8)) = 0 := by
  sorry

/-- `obstructionThreshold_test_1`: the identity has threshold zero in every finite abelian group. -/
example (A : Type) [CommGroup A] [Finite A] : obstructionThreshold (1 : A) = 0 := by
  sorry

/-- `obstructionThreshold_test_2`: the two cyclic coordinates retain their different threshold exponents. -/
example : obstructionThreshold ((Multiplicative.ofAdd 1 : C₄), (1 : C₈)) = 2 ∧
    obstructionThreshold ((1 : C₄), (Multiplicative.ofAdd 1 : C₈)) = 3 := by
  sorry

/-- The generator survives at seventeen and fails at nine, whose valuation is too small. -/
example : (∃ h : C₈, h ^ 16 = (Multiplicative.ofAdd 1 : C₈) ^ 8) ∧
    (¬ ∃ h : C₈, h ^ 8 = (Multiplicative.ofAdd 1 : C₈) ^ 4) := by
  sorry

/-- `paritySquareMap_test_1`: independent prescribed columns retain both coordinates in their free linear extension. -/
example :
    Finsupp.linearCombination (ZMod 2) (fun i : Fin 2 ↦ Finsupp.single i (1 : ZMod 2))
      (Finsupp.single 0 1 + Finsupp.single 1 1) =
        Finsupp.single 0 1 + Finsupp.single 1 1 := by
  sorry

/-- Equal nonzero binary columns cancel on the sum of the two basis vectors. -/
example : let s := Finsupp.linearCombination (ZMod 2) (fun _ : Fin 2 ↦ (1 : ZMod 2))
    s (Finsupp.single 0 1) = 1 ∧ s (Finsupp.single 1 1) = 1 ∧
      s (Finsupp.single 0 1 + Finsupp.single 1 1) = 0 := by
  sorry

/-- `jointParityMap_test_1`: the joint map retains the first coordinate and the second coordinate modulo zero. -/
example :
    letI : AddCommGroup (ZMod 2) := (ZMod.commRing 2).toAddCommGroup
    let W : Submodule (ZMod 2) (ZMod 2) := ⊥
    let L := @jointParityMap V₂ (ZMod 2) (ZMod 2)
      inferInstance inferInstance inferInstance inferInstance inferInstance inferInstance
      (LinearMap.proj (R := ZMod 2) (φ := fun _ : Fin 2 ↦ ZMod 2) 0)
      (LinearMap.proj (R := ZMod 2) (φ := fun _ : Fin 2 ↦ ZMod 2) 1) W
    L ![1, 0] = (1, W.mkQ 0) ∧ L ![0, 1] = (0, W.mkQ 1) := by
  sorry

/-- Quotienting by the whole obstruction space removes the second constraint. -/
example :
    letI : AddCommGroup (ZMod 2) := (ZMod.commRing 2).toAddCommGroup
    LinearMap.ker (@jointParityMap (ZMod 2) (ZMod 2) (ZMod 2)
      inferInstance inferInstance inferInstance inferInstance inferInstance inferInstance
      (0 : ZMod 2 →ₗ[ZMod 2] ZMod 2) (LinearMap.id : ZMod 2 →ₗ[ZMod 2] ZMod 2) ⊤) = ⊤ := by
  sorry

/-- `jointParityMap_test_3`: the abelianization constraint remains when the square map is zero. -/
example :
    letI : AddCommGroup (ZMod 2) := (ZMod.commRing 2).toAddCommGroup
    ∀ W : Submodule (ZMod 2) (ZMod 2),
    LinearMap.ker (@jointParityMap (ZMod 2) (ZMod 2) (ZMod 2)
      inferInstance inferInstance inferInstance inferInstance inferInstance inferInstance
      (LinearMap.id : ZMod 2 →ₗ[ZMod 2] ZMod 2) 0 W) = ⊥ := by
  sorry

/-- The two one-dimensional surviving parity sets differ at the two filtration stages. -/
example :
    letI : AddCommGroup (ZMod 2) := (ZMod.commRing 2).toAddCommGroup
    (LinearMap.ker (@jointParityMap (ZMod 2) (ZMod 2) (ZMod 2)
      inferInstance inferInstance inferInstance inferInstance inferInstance inferInstance
      (0 : ZMod 2 →ₗ[ZMod 2] ZMod 2) (LinearMap.id : ZMod 2 →ₗ[ZMod 2] ZMod 2) ⊥) :
      Set (ZMod 2)) = {0} ∧
    (LinearMap.ker (@jointParityMap (ZMod 2) (ZMod 2) (ZMod 2)
      inferInstance inferInstance inferInstance inferInstance inferInstance inferInstance
      (0 : ZMod 2 →ₗ[ZMod 2] ZMod 2) (LinearMap.id : ZMod 2 →ₗ[ZMod 2] ZMod 2) ⊤) :
      Set (ZMod 2)) = Set.univ := by
  sorry

/-- Equal cardinalities of binary cosets do not determine their weight polynomials. -/
example :
    Nat.card ({![0, 0], ![1, 1]} : Set V₂) = 2 ∧
    Nat.card ({![1, 0], ![0, 1]} : Set V₂) = 2 ∧
    Set.weightPolynomial ({![0, 0], ![1, 1]} : Set V₂) = 1 + Polynomial.X ^ 2 ∧
    Set.weightPolynomial ({![1, 0], ![0, 1]} : Set V₂) = 2 * Polynomial.X := by
  sorry

/-- The empty coordinate space with its singleton parity has series one. -/
example : PowerSeries.mk (fun n : ℕ ↦ (Nat.card {m : Fin 0 → ℤ //
      (∀ i, (0 : ℤ) ≤ m i) ∧ (fun i ↦ (m i : ZMod 2)) ∈ (Set.univ : Set (Fin 0 → ZMod 2)) ∧
        ∑ i, m i = (n : ℤ)} : ℤ)) =
    1 := by
  sorry

/-- The empty parity set has series zero. -/
example : PowerSeries.mk (fun n : ℕ ↦ (Nat.card {m : Fin 0 → ℤ //
      (∀ i, (0 : ℤ) ≤ m i) ∧ (fun i ↦ (m i : ZMod 2)) ∈ (∅ : Set (Fin 0 → ZMod 2)) ∧
        ∑ i, m i = (n : ℤ)} : ℤ)) =
    0 := by
  sorry

/-- Nonnegative even degrees form the even geometric series. -/
example : PowerSeries.mk (fun n : ℕ ↦ (Nat.card {m : Fin 1 → ℤ //
      (∀ i, (0 : ℤ) ≤ m i) ∧ (fun i ↦ (m i : ZMod 2)) ∈ ({0} : Set (Fin 1 → ZMod 2)) ∧
        ∑ i, m i = (n : ℤ)} : ℤ)) =
    (PowerSeries.invOfUnit (1 - PowerSeries.X ^ 2 : PowerSeries ℤ) 1) := by
  sorry

/-- Nonnegative odd degrees form the odd geometric series. -/
example : PowerSeries.mk (fun n : ℕ ↦ (Nat.card {m : Fin 1 → ℤ //
      (∀ i, (0 : ℤ) ≤ m i) ∧ (fun i ↦ (m i : ZMod 2)) ∈ ({1} : Set (Fin 1 → ZMod 2)) ∧
        ∑ i, m i = (n : ℤ)} : ℤ)) =
    (PowerSeries.X : PowerSeries ℤ) * (PowerSeries.invOfUnit (1 - PowerSeries.X ^ 2 : PowerSeries ℤ) 1) := by
  sorry

/-- With lower bound one, even degrees start at two. -/
example : PowerSeries.mk (fun n : ℕ ↦ (Nat.card {m : Fin 1 → ℤ //
      (∀ i, (1 : ℤ) ≤ m i) ∧ (fun i ↦ (m i : ZMod 2)) ∈ ({0} : Set (Fin 1 → ZMod 2)) ∧
        ∑ i, m i = (n : ℤ)} : ℤ)) =
    (PowerSeries.X : PowerSeries ℤ) ^ 2 * (PowerSeries.invOfUnit (1 - PowerSeries.X ^ 2 : PowerSeries ℤ) 1) := by
  sorry

/-- With lower bound one, odd degrees start at one. -/
example : PowerSeries.mk (fun n : ℕ ↦ (Nat.card {m : Fin 1 → ℤ //
      (∀ i, (1 : ℤ) ≤ m i) ∧ (fun i ↦ (m i : ZMod 2)) ∈ ({1} : Set (Fin 1 → ZMod 2)) ∧
        ∑ i, m i = (n : ℤ)} : ℤ)) =
    (PowerSeries.X : PowerSeries ℤ) * (PowerSeries.invOfUnit (1 - PowerSeries.X ^ 2 : PowerSeries ℤ) 1) := by
  sorry

/-- The two-variable shifted parity series retains both minimal degrees. -/
example : PowerSeries.mk (fun n : ℕ ↦ (Nat.card {m : Fin 2 → ℤ //
      (∀ i, (1 : ℤ) ≤ m i) ∧ (fun i ↦ (m i : ZMod 2)) ∈ ({![0, 0], ![1, 1]} : Set (Fin 2 → ZMod 2)) ∧
        ∑ i, m i = (n : ℤ)} : ℤ)) =
    ((PowerSeries.X : PowerSeries ℤ) ^ 2 + (PowerSeries.X : PowerSeries ℤ) ^ 4) * (PowerSeries.invOfUnit (1 - PowerSeries.X ^ 2 : PowerSeries ℤ) 1) ^ 2 := by
  sorry

/-- The coefficient at degree four counts exactly the three allowed degree vectors. -/
example : {m : Fin 2 → ℤ | (∀ i, (1 : ℤ) ≤ m i) ∧
      (fun i ↦ (m i : ZMod 2)) ∈ ({![0, 0], ![1, 1]} : Set V₂) ∧ ∑ i, m i = 4} =
      {![1, 3], ![3, 1], ![2, 2]} ∧
    PowerSeries.coeff 4 (((PowerSeries.X : PowerSeries ℤ) ^ 2 + PowerSeries.X ^ 4) *
      (PowerSeries.invOfUnit (1 - PowerSeries.X ^ 2 : PowerSeries ℤ) 1) ^ 2) = 3 := by
  sorry

/-- The abelianized sum kernel on the alternating base has order forty-eight. -/
example : Nat.card (abelianizedSum (alternatingGroup (Fin 4))).ker = 48 := by
  sorry

/-- A three-cycle and its inverse pass the sum condition; two equal three-cycles fail it. -/
example : let a : alternatingGroup (Fin 4) :=
      ⟨Equiv.swap 0 1 * Equiv.swap 1 2, by sorry⟩
    (a, a⁻¹) ∈ (abelianizedSum (alternatingGroup (Fin 4))).ker ∧
      (a, a) ∉ (abelianizedSum (alternatingGroup (Fin 4))).ker := by
  sorry

/-- The order-ninety-six model contains the pure swap as an outside involution. -/
example : (⟨⟨(1, 1), Multiplicative.ofAdd 1⟩, by sorry⟩ :
      sumKernelModel (alternatingGroup (Fin 4))) ∈ outsideInvolutions _ := by
  sorry

/-- The anti-diagonal membership condition accepts the nontrivial swap coordinate as well. -/
example : (⟨(Multiplicative.ofAdd 1, Multiplicative.ofAdd 2), Multiplicative.ofAdd 1⟩ :
      SwapWreath C₃) ∈ sumKernelModel C₃ := by
  sorry

/-- The anti-diagonal marking contains the pure swap. -/
example : (⟨⟨(1, 1), Multiplicative.ofAdd 1⟩, by sorry⟩ :
      sumKernelModel C₃) ∈ outsideInvolutions _ := by
  sorry

/-- The cyclic order-three anti-diagonal model is dihedral, with precisely three reflections. -/
example : (∃ e : sumKernelModel C₃ ≃* DihedralGroup 3,
      ∀ x, x ∈ outsideInvolutions (sumKernelModel C₃) ↔ ∃ i : ZMod 3, e x = DihedralGroup.sr i) ∧
    Nat.card (outsideInvolutions (sumKernelModel C₃)) = 3 := by
  sorry

/-- The nonidentity cyclic order-two element squares to one and differs from one. -/
example : (Multiplicative.ofAdd (1 : ZMod 2) : C₂) ^ 2 = 1 ∧
    (Multiplicative.ofAdd (1 : ZMod 2) : C₂) ≠ 1 := by
  sorry

/-- Applying the nontrivial swap twice restores the unequal pair. -/
example : swapAction C₃ (Multiplicative.ofAdd 1)
      (swapAction C₃ (Multiplicative.ofAdd 1) (Multiplicative.ofAdd 1, Multiplicative.ofAdd 2)) =
        (Multiplicative.ofAdd 1, Multiplicative.ofAdd 2) := by
  sorry

/-- The swap wreath product of the trivial group has two elements. -/
example : Nat.card (SwapWreath (PUnit : Type)) = 2 := by
  sorry

/-- Conjugation by the pure swap exchanges the unequal base coordinates. -/
example : let t : SwapWreath C₃ := ⟨(1, 1), Multiplicative.ofAdd 1⟩
    let x : SwapWreath C₃ := ⟨(Multiplicative.ofAdd 1, 1), 1⟩
    t * x * t⁻¹ = ⟨(1, Multiplicative.ofAdd 1), 1⟩ := by
  sorry

/-- Two cyclic generators have abelianized sum two. -/
example : abelianizedSum C₃ (Multiplicative.ofAdd 1, Multiplicative.ofAdd 1) =
      Abelianization.of (Multiplicative.ofAdd (2 : ZMod 3)) := by
  sorry

/-- Two transpositions have trivial total abelianization. -/
example : abelianizedSum (Equiv.Perm (Fin 3)) (Equiv.swap 0 1, Equiv.swap 1 2) = 1 := by
  sorry

/-- An outside element with incorrect base coordinates is excluded by its nontrivial square. -/
example : let x : SwapWreath C₃ := ⟨(Multiplicative.ofAdd 1, 1), Multiplicative.ofAdd 1⟩
    x ^ 2 = ⟨(Multiplicative.ofAdd 1, Multiplicative.ofAdd 1), 1⟩ ∧ x ^ 2 ≠ 1 ∧
      (⟨x, Subgroup.mem_top x⟩ : (⊤ : Subgroup (SwapWreath C₃))) ∉ outsideInvolutions ⊤ := by
  sorry

/-- Every finite odd cyclic anti-diagonal model has vanishing ordinary multiplier. -/
example (n : ℕ) [NeZero n] (hodd : Odd n) :
    Subsingleton (Multiplier (sumKernelModel (Multiplicative (ZMod n)))) := by
  sorry

/-- The ordinary multiplier retains the exterior-square value of this odd abelian base. -/
example : Nonempty (Multiplier (sumKernelModel (C₃ × C₃)) ≃+ (ZMod 3)) := by
  sorry

/-- The ordinary multiplier retains the exterior-square value of this odd abelian base. -/
example : Nonempty (Multiplier (sumKernelModel (Multiplicative (ZMod 5) × Multiplicative (ZMod 5))) ≃+ (ZMod 5)) := by
  sorry

/-- The ordinary multiplier retains the exterior-square value of this odd abelian base. -/
example : Nonempty (Multiplier (sumKernelModel (Multiplicative (ZMod 9) × C₃)) ≃+ (ZMod 3)) := by
  sorry

/-- The ordinary multiplier retains the exterior-square value of this odd abelian base. -/
example : Nonempty (Multiplier (sumKernelModel (C₃ × C₃ × C₃)) ≃+ (ZMod 3 × ZMod 3 × ZMod 3)) := by
  sorry

/-- The special-linear sum-kernel model has order three hundred eighty-four. -/
example : Nat.card (sumKernelModel (Matrix.SpecialLinearGroup (Fin 2) (ZMod 3))) = 384 := by
  sorry

/-- The affine group generated by translation and multiplication by two gives the order-two-hundred-ninety-four model. -/
example : let G := Subgroup.closure ({Equiv.addRight (1 : ZMod 7),
      (⟨(2 * ·), (4 * ·), by decide, by decide⟩ : Equiv.Perm (ZMod 7))} : Set (Equiv.Perm (ZMod 7)))
    Nat.card G = 21 ∧ Nat.card (sumKernelModel G) = 294 := by
  sorry

/-- `sumKernelModel_test_3`: the perfect alternating base gives the full wreath product of order 7200. -/
example : sumKernelModel (alternatingGroup (Fin 5)) = ⊤ ∧
    Nat.card (sumKernelModel (alternatingGroup (Fin 5))) = 7200 := by
  sorry

/-- Distinct involution classes in the symmetric group can have the same abelianized image. -/
example : let x : Equiv.Perm (Fin 6) := Equiv.swap 0 1
    let y : Equiv.Perm (Fin 6) := Equiv.swap 0 1 * Equiv.swap 2 3 * Equiv.swap 4 5
    ¬ IsConj x y ∧ Abelianization.of x = Abelianization.of y := by
  sorry

/-- The obstructed cyclic order-four equation has no solutions despite its two-element torsion kernel. -/
example : Nat.card {h : C₄ // h ^ 2 = 1} = 2 := by
  sorry

/-- Singleton one-variable parity sets have equal sizes and different weight polynomials. -/
example : Nat.card ({0} : Set (Fin 1 → ZMod 2)) = 1 ∧
    Nat.card ({1} : Set (Fin 1 → ZMod 2)) = 1 ∧
    Set.weightPolynomial ({0} : Set (Fin 1 → ZMod 2)) = 1 ∧
    Set.weightPolynomial ({1} : Set (Fin 1 → ZMod 2)) = Polynomial.X := by
  sorry

/-- Lifts of one quotient element commute; lifts of two independent elements need not. -/
example :
    Commute (DihedralGroup.r (1 : ZMod 4)) (DihedralGroup.r 3) ∧
      ¬ Commute (DihedralGroup.r (1 : ZMod 4)) (DihedralGroup.sr 0) := by
  sorry

/-- The dihedral Schur-cover projection has zero image in degree two. -/
example : ∃ S : GroupExtension C₂ (DihedralGroup 4) (C₂ × C₂),
    S.inl (Multiplicative.ofAdd 1) = DihedralGroup.r 2 ∧
    S.rightHom (DihedralGroup.r 1) = (Multiplicative.ofAdd 1, 1) ∧
    S.rightHom (DihedralGroup.sr 0) = (1, Multiplicative.ofAdd 1) ∧
    S.inl.range ≤ Subgroup.center (DihedralGroup 4) ∧
    groupHomology.map (A := Rep.trivial ℤ (DihedralGroup 4) ℤ)
      (B := Rep.trivial ℤ (C₂ × C₂) ℤ) S.rightHom
      (Rep.ofHom ⟨LinearMap.id, by intro g; rfl⟩) 2 = 0 := by
  sorry

/-- The identity reduced cover of the Klein four group has surjective degree-two map. -/
example : Function.Surjective (groupHomology.map
    (A := Rep.trivial ℤ (C₂ × C₂) ℤ) (B := Rep.trivial ℤ (C₂ × C₂) ℤ)
    (MonoidHom.id (C₂ × C₂)) (Rep.ofHom ⟨LinearMap.id, by intro g; rfl⟩) 2) := by
  sorry

/-- Dihedral rotation lifts and reflection lifts have different squares. -/
example :
    (DihedralGroup.r (1 : ZMod 4)) ^ 2 = DihedralGroup.r 2 ∧
      (DihedralGroup.r (2 : ZMod 4)) ≠ 1 ∧
      (∀ i : ZMod 4, (DihedralGroup.sr i) ^ 2 = 1) := by
  sorry

/-- Two independent quaternion lifts square to the same nonidentity central element. -/
example :
    (QuaternionGroup.a (1 : ZMod 4) : QuaternionGroup 2) ^ 2 = QuaternionGroup.a 2 ∧
      (QuaternionGroup.xa (0 : ZMod 4) : QuaternionGroup 2) ^ 2 = QuaternionGroup.a 2 ∧
      (QuaternionGroup.a (2 : ZMod 4) : QuaternionGroup 2) ≠ 1 ∧
      (QuaternionGroup.a (2 : ZMod 4) : QuaternionGroup 2) ∈
        Subgroup.center (QuaternionGroup 2) := by
  sorry

/-- The actual marked cyclic coordinate action selects the inverse-sign solution. -/
example :
    let X : Multiplicative (ZMod 14) := Multiplicative.ofAdd 1
    let a := X ^ 2
    (X * a) ^ 3 * a ^ (-3 : ℤ) = X * a ∧
      (X * a⁻¹) ^ 3 * a ^ (-3 : ℤ) ≠ X * a⁻¹ := by
  sorry

/-- The rotation centralizer map kills its own class and detects both reflection classes. -/
example :
    ⁅DihedralGroup.r (1 : ZMod 4), DihedralGroup.r (1 : ZMod 4)⁆ = 1 ∧
      ⁅DihedralGroup.r (1 : ZMod 4), DihedralGroup.sr (0 : ZMod 4)⁆ = DihedralGroup.r 2 ∧
      ⁅DihedralGroup.r (1 : ZMod 4), DihedralGroup.r (1 : ZMod 4) * DihedralGroup.sr 0⁆ =
        DihedralGroup.r 2 := by
  sorry

/-- A centralizer generator absent from the ambient generating set supplies a nontrivial relation. -/
example :
    Commute (DihedralGroup.sr (0 : ZMod 4)) (DihedralGroup.r 2) ∧
      ¬ Commute (DihedralGroup.sr (0 : ZMod 4)) (DihedralGroup.r 1) ∧
      ⁅DihedralGroup.sr (0 : ZMod 8), DihedralGroup.r (2 : ZMod 8)⁆ = DihedralGroup.r 4 ∧
      (DihedralGroup.r (4 : ZMod 8)) ≠ 1 ∧
      ⁅DihedralGroup.sr (0 : ZMod 8), DihedralGroup.sr (0 : ZMod 8)⁆ = 1 := by
  sorry

/-- The transposition graph actions on the two alternating groups give the marked symmetric groups. -/
example (n : ℕ) [NeZero n] (hn : n = 4 ∨ n = 5) :
    let τ := Equiv.swap (0 : Fin n) 1
    ∃ (φ : C₂ →* MulAut (alternatingGroup (Fin n)))
      (e : (alternatingGroup (Fin n) ⋊[φ] C₂) ≃* Equiv.Perm (Fin n)),
      (∀ a, (φ (Multiplicative.ofAdd 1) a : Equiv.Perm (Fin n)) =
        τ * (a : Equiv.Perm (Fin n)) * τ⁻¹) ∧
      (∀ x, e x = (x.left : Equiv.Perm (Fin n)) * τ ^ x.right.toAdd.val) ∧
      (∀ x, (x.right ≠ 1 ∧ x ^ 2 = 1) ↔ (e x).IsSwap) := by
  sorry

/-- The determinant-minus-one involutions in the general linear group have the required count. -/
example :
    Nat.card (Matrix.GeneralLinearGroup (Fin 2) (ZMod 3)) = 48 ∧
      Nat.card {x : Matrix.GeneralLinearGroup (Fin 2) (ZMod 3) //
        (Matrix.GeneralLinearGroup.det x : ZMod 3) = -1 ∧ x ^ 2 = 1} = 12 := by
  sorry

/-- The diagonal conjugation graph identifies its outside marking with one general-linear conjugacy class. -/
example : ∃ (d : Matrix.GeneralLinearGroup (Fin 2) (ZMod 3))
    (φ : C₂ →* MulAut (Matrix.SpecialLinearGroup (Fin 2) (ZMod 3)))
    (e : (Matrix.SpecialLinearGroup (Fin 2) (ZMod 3) ⋊[φ] C₂) ≃*
      Matrix.GeneralLinearGroup (Fin 2) (ZMod 3)),
    (d : Matrix (Fin 2) (Fin 2) (ZMod 3)) = !![-1, 0; 0, 1] ∧
    (∀ a, Matrix.SpecialLinearGroup.toGL (φ (Multiplicative.ofAdd 1) a) =
      d * Matrix.SpecialLinearGroup.toGL a * d⁻¹) ∧
    (∀ x, e x = Matrix.SpecialLinearGroup.toGL x.left * d ^ x.right.toAdd.val) ∧
    (∀ x, (x.right ≠ 1 ∧ x ^ 2 = 1) ↔ IsConj (e x) d) := by
  sorry

/-- The inverse-transpose graph has twice the order of the special linear group. -/
example : Nat.card (Matrix.SpecialLinearGroup (Fin 3) (ZMod 2)) = 168 ∧
    ∃ φ : C₂ →* MulAut (Matrix.SpecialLinearGroup (Fin 3) (ZMod 2)),
      (∀ g, φ (Multiplicative.ofAdd 1) g = Matrix.SpecialLinearGroup.transpose g⁻¹) ∧
      Nat.card (Matrix.SpecialLinearGroup (Fin 3) (ZMod 2) ⋊[φ] C₂) = 336 := by
  sorry

/-- Two elementary special-linear matrices show that transpose fails multiplicativity. -/
example :
    let u : Matrix (Fin 3) (Fin 3) (ZMod 2) := !![1, 1, 0; 0, 1, 0; 0, 0, 1]
    let v : Matrix (Fin 3) (Fin 3) (ZMod 2) := !![1, 0, 0; 0, 1, 1; 0, 0, 1]
    u.det = 1 ∧ v.det = 1 ∧ (u * v).transpose ≠ u.transpose * v.transpose := by
  sorry

end NativeChecks

/-!
## README targets requiring carriers absent at the pins

* RS.0: the supplied class map's `extensionClassMap_exact_left`, `extensionClassMap_exact_mid`,
  `extensionClassMap_surjective_of_stem`, and the
  Hall-coinvariant equivalence `multiplier_hallPart`.
* RS.1: `localClassNormalization` with its API and `homology_image` for the supplied reduced cover.
* RS.3: `kernel_action_aut`, `finite_level_action`, `DegreeOrbitSet`, the actual marked-kernel
  and twisted restrictions of `boundedDegreeSlice` and `powerFixedDegree`.
* RS.4: `squareObstruction`, `involution_square_central`, `fixed_fiber_equation`,
  `all_fixed_fibers`, `odd_parity_fiber`, `even_parity_fiber`, `lift_square_columns`,
  `paritySquareMap`, `affine_compatible_parities`, `surviving_parities`, `independent_classes`.

* RS.6: `centralizer_generator_relations`, `centralizer_generator_quotient`,
  `finite_parity_comparison`, `graphModel` with its embedding API, `antidiagonal_reduced_multiplier`,
  `order96_fixed_fibers` and `table_fixed_fiber_application`. The table's individual multiplier
  values are explicit input hypotheses of the conditional applications. The light `sumKernelModel` specializes to `order96Type`
  at `A₄` and to `antidiagonalModel` for abelian groups; `outsideInvolutions` retains their marking.

The README also specifies the following API for the light definitions:
* Degree slices: `boundedDegreeSlice_mem`, `boundedDegreeSlice_invariant`,
  `boundedDegreeSlice_preimage`.
* Fixed degrees: `powerFixedDegree_fixed`, `powerFixedDegree_orbits`,
  `powerFixedDegree_weighted_sum`.
* Torsion images: `torsionImageFiltration_zero`, `torsionImageFiltration_cyclic`.
* Thresholds: `obstructionThreshold_class`, `obstructionThreshold_bound`,
  `obstructionThreshold_cyclic`.
* Joint maps: `jointParityMap_apply`, `jointParityMap_mono_kernel`, `jointParityMap_last`.
* Sum kernels: `sumKernelModel_mem`, `sumKernelModel_outside`.

Every theorem and every API and Check for these targets is specified in the README. None of the
supplied IG constructions is an additional target of this file.
-/

end TauCetiRoadmap.InductionRestrictionPartII

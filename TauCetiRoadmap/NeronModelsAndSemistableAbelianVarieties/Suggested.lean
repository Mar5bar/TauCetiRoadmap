import Mathlib
import TauCeti.AlgebraicGeometry.Curves.StableReduction.Picard.Basic

/-!
# Néron models and semistable abelian varieties: representative target signatures

The mathematical roadmap is `README.md`. This file records suggested forms, not an exhaustive
checklist: definitions and theorem signatures statable against the pinned Mathlib and Tau Ceti
APIs. The README specifies every target in each layer.

The file makes the following design choices explicit.

* The Néron mapping property is a predicate on an object of `Over S` relative to a fixed morphism
  `j : η ⟶ S`, quantified over **all** smooth test objects of `Over S`; the restriction map is the
  action of Mathlib's `Over.pullback j` on morphisms. Testing only étale objects is the weak-model
  condition, which is a separate structure.
* A Néron model is *marked*: the isomorphism of its generic fibre with the given variety is data,
  and every uniqueness statement is a statement about marked models.
* Finite type is enforced by `QuasiCompact` on top of `Smooth` (which already gives locally finite
  presentation); a locally-finite-type model is not a model in the sense of this file.
* The lattice-level part of the monodromy theory (the integral pairing, its cokernel and
  cycle lattice of a dual multigraph) is stated over `ℤ` with no geometric carrier, so that the
  arithmetic computations of the roadmap's checks are already meaningful.
* README §4.2 uses GraphConnectivityAndFlows §§1.3 and 8.1 (an open TauCetiRoadmap pull request
  by fzaiser) for incidence and signed circulations, and SurfaceTopology Layer 10 (an open
  TauCetiRoadmap pull request by mccorvie) for the binary cycle-space dimension formula;
  GraphConnectivityAndFlows §1.1 supplies component counts. Local carriers support the retained
  integral/F₂ coefficient comparison, character-lattice realization and monodromy pairing.
* The intersection-matrix comparison of the component group of a Jacobian uses Tau
  Ceti's numerical Picard group `TauCeti.NumericalType.Pic` and its degree map, which are pinned
  and not redefined.
-/

namespace TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry

universe u

/-! ## Layer 1: Néron models and their uniqueness -/

section Models

variable {S η : Scheme.{u}} (j : η ⟶ S)

/-- The Néron mapping property of `X` over `S` relative to `j : η ⟶ S`: for every smooth `Y` over
`S` the generic restriction `Hom_S(Y, X) → Hom_η(Y_η, X_η)` is bijective
(Bosch–Lütkebohmert–Raynaud, §1.2 Definition 1). -/
def NeronMappingProperty (X : Over S) : Prop :=
  ∀ Y : Over S, Smooth Y.hom →
    Function.Bijective (fun f : Y ⟶ X => (Over.pullback j).map f)

namespace NeronMappingProperty

variable {j} {X Y : Over S}

/-- Morphisms from a permitted test object are equal when their generic restrictions agree. -/
theorem hom_ext (h : NeronMappingProperty j X) (hY : Smooth Y.hom)
    (f g : Y ⟶ X) (e : (Over.pullback j).map f = (Over.pullback j).map g) :
    f = g := by sorry

/-- The mapping property is equivalent to unique extension for every smooth test object. -/
theorem iff_existsUnique : NeronMappingProperty j X ↔
    ∀ Y : Over S, Smooth Y.hom →
      ∀ f : (Over.pullback j).obj Y ⟶ (Over.pullback j).obj X,
        ∃! g : Y ⟶ X, (Over.pullback j).map g = f := by sorry

/-- One non-extendible map from a smooth test object refutes the mapping property. -/
example (hY : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ (Over.pullback j).obj X)
    (h : ∀ g : Y ⟶ X, (Over.pullback j).map g ≠ f) :
    ¬ NeronMappingProperty j X := by sorry

/-- For `j = 𝟙 S` every object has the mapping property: the degenerate case carries no
arithmetic content. -/
example (X : Over S) : NeronMappingProperty (𝟙 S) X := by sorry

end NeronMappingProperty

/-- A marked finite-type Néron model of `A` over `η`: a smooth, separated, quasi-compact object of
`Over S` with the Néron mapping property and a chosen isomorphism of its generic fibre with `A`.
Smoothness gives locally finite presentation; quasi-compactness enforces finite type
(Bosch–Lütkebohmert–Raynaud, §1.2 Definition 1 and Proposition 2). -/
structure NeronModel (A : Over η) where
  /-- The model, an object of `Over S`. -/
  model : Over S
  /-- The marking: the generic fibre of the model is `A`. -/
  genericIso : (Over.pullback j).obj model ≅ A
  smooth : Smooth model.hom
  separated : IsSeparated model.hom
  quasiCompact : QuasiCompact model.hom
  mapping : NeronMappingProperty j model

namespace NeronModel

variable {j} {A : Over η} (M : NeronModel j A)

/-- Morphisms from a permitted test object are equal when their generic restrictions agree. -/
theorem hom_ext (Y : Over S) (hY : Smooth Y.hom) (f g : Y ⟶ M.model)
    (e : (Over.pullback j).map f ≫ M.genericIso.hom =
      (Over.pullback j).map g ≫ M.genericIso.hom) : f = g := by sorry

/-- A map to the marked generic object extends uniquely from any smooth test object. -/
theorem extension_existsUnique (Y : Over S) (hY : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) :
    ∃! g : Y ⟶ M.model, (Over.pullback j).map g ≫ M.genericIso.hom = f := by sorry

/-- The model is smooth, separated and quasi-compact at once. -/
example : Smooth M.model.hom ∧ IsSeparated M.model.hom ∧
    QuasiCompact M.model.hom := by sorry

/-- Two endomorphisms of the model with equal generic restrictions are equal. -/
example (f g : M.model ⟶ M.model)
    (e : (Over.pullback j).map f = (Over.pullback j).map g) : f = g := by sorry

/-- Uniqueness of marked Néron models: between two marked models of the same `A` there is exactly
one isomorphism compatible with the markings (Bosch–Lütkebohmert–Raynaud, §1.2 Proposition 2(a)). -/
theorem unique_iso (N : NeronModel j A) :
    ∃! e : M.model ≅ N.model,
      (Over.pullback j).map e.hom ≫ N.genericIso.hom = M.genericIso.hom := by sorry

end NeronModel

/-- A marked weak Néron model: the same carrier, but the extension property is only required for
étale test objects. Weak models need not be unique (Bosch–Lütkebohmert–Raynaud, §1.2
Definition 1 and §1.3). -/
structure WeakNeronModel (A : Over η) where
  model : Over S
  genericIso : (Over.pullback j).obj model ≅ A
  smooth : Smooth model.hom
  separated : IsSeparated model.hom
  quasiCompact : QuasiCompact model.hom
  mapping : ∀ Y : Over S, Etale Y.hom →
    Function.Bijective (fun f : Y ⟶ model => (Over.pullback j).map f)

namespace WeakNeronModel

variable {j} {A : Over η} (W : WeakNeronModel j A)

/-- A generic morphism from a permitted test object has exactly one extension. -/
theorem existsUnique (Y : Over S) (hY : Etale Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) :
    ∃! g : Y ⟶ W.model, (Over.pullback j).map g ≫ W.genericIso.hom = f := by sorry

/-- A Néron model is in particular a weak Néron model. -/
noncomputable def ofNeronModel (M : NeronModel j A) : WeakNeronModel j A where
  model := M.model
  genericIso := M.genericIso
  smooth := M.smooth
  separated := M.separated
  quasiCompact := M.quasiCompact
  mapping := fun Y hY => by
    have : Etale Y.hom := hY
    exact M.mapping Y inferInstance

/-- The weak specialisation keeps the entire model, including all components. -/
example (M : NeronModel j A) : (ofNeronModel M).model = M.model := rfl

/-- The weak specialisation preserves the chosen marking, rather than normalising it. -/
example (M : NeronModel j A) : (ofNeronModel M).genericIso = M.genericIso := rfl

/-- A map from an étale generic test object has exactly one marked extension. -/
example (Y : Over S) (hY : Etale Y.hom) (f : (Over.pullback j).obj Y ⟶ A) :
    ∃! g : Y ⟶ W.model, (Over.pullback j).map g ≫ W.genericIso.hom = f := by sorry

/-- For `j = 𝟙 S` every smooth separated quasi-compact object is its own weak model; the degenerate
case says nothing about arithmetic existence. -/
example (X : Over S) (hX : Smooth X.hom) (hsep : IsSeparated X.hom)
    (hqc : QuasiCompact X.hom) : Nonempty (WeakNeronModel (𝟙 S) X) := by sorry

end WeakNeronModel

end Models

/-! ## Layer 2: special fibres and component groups -/

namespace ComponentGroup

/-- The rational component group of a nonsplit multiplicative elliptic curve over a finite residue
field is the fixed subgroup of `−1` on the geometric group `ℤ/n`: it has order `2` for even `n` and
order `1` for odd `n`, which differs from `n` exactly when `n ≥ 3` (Tate, §6). This is the
group-theoretic core of that computation. -/
theorem card_fixedPoints_neg (n : ℕ) (hn : 0 < n) :
    Nat.card {x : ZMod n // -x = x} = if Even n then 2 else 1 := by sorry

/-- The fixed subgroup of negation on `ℤ/4` has order `2`. -/
example : Nat.card {x : ZMod 4 // -x = x} = 2 := by sorry

/-- The fixed subgroup of negation on `ℤ/5` is trivial. -/
example : Nat.card {x : ZMod 5 // -x = x} = 1 := by sorry

/-- Negative control for `0 < n`: `ℤ/0 = ℤ` has one fixed point of negation, while the formula
would give `2` since `0` is even. -/
example : Nat.card {x : ZMod 0 // -x = x} = 1 ∧
    Nat.card {x : ZMod 0 // -x = x} ≠ if Even 0 then 2 else 1 := by sorry

end ComponentGroup

/-! ## Layer 3: semistable reduction and uniformisation -/

namespace RamifiedTate

/-- The canonical map of geometric component groups of a split Tate curve under a base change of
ramification index `e`: on `ℤ/n → ℤ/(e·n)` it is multiplication by `e` (Conrad, Example 4.6). -/
noncomputable def componentMap (n e : ℕ) : ZMod n →+ ZMod (e * n) :=
  ZMod.lift n ⟨zmultiplesHom _ (e : ZMod (e * n)), by
    change (n : ℤ) • (e : ZMod (e * n)) = 0
    simpa only [Nat.cast_mul, Int.cast_natCast, zsmul_eq_mul, mul_comm] using ZMod.natCast_self (e * n)⟩

/-- Ramified Tate base change sends the residue class of `r` to that of `e*r`. -/
theorem componentMap_apply (n e : ℕ) (r : ℤ) :
    componentMap n e (r : ZMod n) = ((e * r : ℤ) : ZMod (e * n)) := by sorry

/-- Positive ramification index makes the Tate component map injective, including `n = 0` algebraically. -/
theorem componentMap_injective (n e : ℕ) (he : 0 < e) :
    Function.Injective (componentMap n e) := by sorry

/-- For `n = 1` and `e = 2` the component group grows from the trivial group to `ℤ/2` while the
identity torus is unchanged: full Néron models do not commute with ramified base change. -/
example : Nat.card (ZMod 1) = 1 ∧ Nat.card (ZMod (2 * 1)) = 2 := by sorry

/-- The component map is never surjective for `e > 1` and `n > 0`. -/
example (n e : ℕ) (hn : 0 < n) (he : 1 < e) : ¬ Function.Surjective (componentMap n e) := by sorry

/-- Negative control for `0 < e`: for `e = 0` the map `ℤ/2 → ℤ/0 = ℤ` is zero, not injective. -/
example : ¬ Function.Injective (componentMap 2 0) := by sorry

end RamifiedTate

namespace TateMonodromy

/-- In the ordered toric/period basis, the positive valuation form `[n]` gives
`N(a,b) = (n*b,0)` for the Kummer direction `σ(root)/root`
(Raynaud 1994, §4.6 equation (7) and Proposition 4.6.1).
The arithmetic operator is separate from its geometric comparison. -/
def operator (n : ℕ) : (ℤ × ℤ) →ₗ[ℤ] (ℤ × ℤ) where
  toFun v := (n * v.2, 0)
  map_add' := by intros; ext <;> simp [mul_add]
  map_smul' := by intros; ext <;> simp [mul_left_comm]

/-- The image is toric and the operator kills the toric term. -/
theorem operator_square_zero (n : ℕ) : (operator n).comp (operator n) = 0 := by sorry

/-- At valuation `5`, the period vector has positive toric image. -/
example : operator 5 (0, 1) = (5, 0) ∧ operator 5 (1, 0) = 0 := by sorry

/-- The valuation-`5` operator is nonzero but square zero. -/
example : operator 5 ≠ 0 ∧ (operator 5).comp (operator 5) = 0 := by sorry

/-- The positive period projection in the ordered toric/period basis of a Tate motive
(Raynaud 1994, §3.1, p. 299). -/
def periodProjection : (ℤ × ℤ) →ₗ[ℤ] ℤ where
  toFun v := v.2
  map_add' := by intros; rfl
  map_smul' := by intros; rfl

/-- The alternating Weil form in the toric/period basis, with toric vector first.
This is the coordinate witness for the duality comparison in README 4.3. -/
def weilForm (v w : ℤ × ℤ) : ℤ := v.1 * w.2 - v.2 * w.1

/-- The Weil quotient evaluates against the dual toric vector in the second argument. -/
def weilQuotient : (ℤ × ℤ) →ₗ[ℤ] ℤ where
  toFun v := weilForm v (1, 0)
  map_add' := by intros; simp [weilForm, add_comm]
  map_smul' := by intros; simp [weilForm]

/-- The Weil quotient is the negative of the positive period quotient. -/
theorem weilQuotient_eq_neg_periodProjection : weilQuotient = -periodProjection := by sorry

/-- In Weil coordinates the same positive Kummer operator has coefficient `-n`. -/
theorem operator_eq_weil_coordinates (n : ℕ) (v : ℤ × ℤ) :
    operator n v = (-(n : ℤ) * weilQuotient v, 0) := by sorry

/-- The period and toric generators distinguish the two quotient orientations. -/
example : periodProjection (0, 1) = 1 ∧ weilQuotient (0, 1) = -1 ∧
    periodProjection (1, 0) = 0 ∧ weilQuotient (1, 0) = 0 := by
  norm_num [periodProjection, weilQuotient, weilForm]

/-- Nonbasis and zero inputs distinguish the quotient maps from either coordinate or a constant. -/
example : periodProjection (2, 3) = 3 ∧ weilQuotient (2, 3) = -3 ∧
    periodProjection 0 = 0 ∧ weilQuotient 0 = 0 := by
  norm_num [periodProjection, weilQuotient, weilForm]

/-- Swapping the two generators reverses the Weil value. -/
example : weilForm (1, 0) (0, 1) = 1 ∧ weilForm (0, 1) (1, 0) = -1 := by
  norm_num [weilForm]

/-- A two-term evaluation also distinguishes the determinant direction away from basis vectors. -/
example : weilForm (2, 3) (5, -7) = -29 ∧ weilForm (5, -7) (2, 3) = 29 := by
  norm_num [weilForm]

/-- At the residue prime two, level four distinguishes the signed valuation classes;
level two alone cannot. These are arithmetic classes, not geometric points of `μ₄`. -/
example : (5 : ZMod 4) = 1 ∧ (-5 : ZMod 4) = 3 ∧
    (5 : ZMod 2) = 1 ∧ (-5 : ZMod 2) = 1 := by decide

/-- Level one has no obstruction class. -/
example : (5 : ZMod 1) = 0 ∧ (-5 : ZMod 1) = 0 := by decide

end TateMonodromy

/-! ## Layer 4: Picard schemes of semistable curves, character lattices and monodromy -/

namespace DualGraph

variable {V E : Type*} [Fintype V] [Fintype E] [DecidableEq V] [DecidableEq E]

/-- Local restatement of GraphConnectivityAndFlows §1.3, to be replaced by the import once that
roadmap is merged. Its `excessAt` (an open TauCetiRoadmap pull request by fzaiser) is transported
along `Q v w := {e : E // src e = v ∧ tgt e = w}` and finite function/Finsupp equivalences.
The ℤ-linear carrier is needed by `cycleLattice`, the character lattice and monodromy;
incoming-minus-outgoing excess is `tgt − src`, with loops and parallel edges retained.
README label: boundary. SurfaceTopology Layer 7 states the surface-cell special case. -/
noncomputable def boundary (src tgt : E → V) : (E →₀ ℤ) →ₗ[ℤ] (V →₀ ℤ) :=
  Finsupp.linearCombination ℤ fun e => Finsupp.single (tgt e) 1 - Finsupp.single (src e) 1

/-- A loop has zero transported boundary, testing the endpoint-indexed/Finsupp adapter. -/
example : boundary (fun _ : Unit => ()) (fun _ : Unit => ()) (Finsupp.single () 1) = 0 := by
  sorry

/-- The transported incidence has sign `target - source` on a directed edge. -/
example : boundary (fun _ : Unit => (0 : Fin 2)) (fun _ => 1) (Finsupp.single () 1) =
    Finsupp.single 1 1 - Finsupp.single 0 1 := by sorry

/-- Local restatement of GraphConnectivityAndFlows §8.1, to be replaced by the import once that
roadmap is merged. The additive group is identified with its `signedCirculations Q ℤ`
(an open TauCetiRoadmap pull request by fzaiser); ℤ satisfies the ordered-group prototype
hypotheses. This integral-module carrier is needed by `CharactersGraphHomology`, the monodromy
pairing and the coefficient comparison. README label: cycle-lattice. -/
noncomputable def cycleLattice (src tgt : E → V) : Submodule ℤ (E →₀ ℤ) :=
  LinearMap.ker (boundary src tgt)

/-- Local restatement of SurfaceTopology §Layer 10, to be replaced by the import once that
roadmap is merged. Its `Graph.cycleSpace` (an open TauCetiRoadmap pull request by mccorvie)
is transported to finite Finsupp coordinates on the same multigraph. This carrier is needed
by the integral/F₂ coefficient comparison; modulo two the incidence is orientation-independent.
README supplier label: cycle-rank (`finrank_cycleLattice`). -/
noncomputable def modTwoCycleSpace (src tgt : E → V) : Submodule (ZMod 2) (E →₀ ZMod 2) :=
  LinearMap.ker (Finsupp.linearCombination (ZMod 2)
    fun e => Finsupp.single (tgt e) (1 : ZMod 2) - Finsupp.single (src e) (1 : ZMod 2))

/-- Integral/F₂ coefficient comparison retained for the character-lattice rank consumer;
SurfaceTopology Layer 10 `cycleSpace_finrank` (an open TauCetiRoadmap pull request by mccorvie)
supplies the component-count combinatorial formula. The finite function/Finsupp adapter
identifies `modTwoCycleSpace` with the supplied binary cycle space, preserving edge identities;
the integral incidence cokernel is torsion-free, so base change identifies the kernels.
README label: integral-graph-adapter. Connectedness is needed only when specializing the
supplied formula to component count one, not for this coefficient comparison. -/
theorem cycleLattice_rank_eq_cycleSpace_finrank (src tgt : E → V) :
    Module.finrank ℤ (cycleLattice src tgt) =
      Module.finrank (ZMod 2) (modTwoCycleSpace src tgt) := by sorry

/-- The edge-length form `(c, d) ↦ ∑_e ℓ(e) c_e d_e` on `ℤ^E`; with all lengths `1` it is the
monodromy pairing of the Jacobian of a regular semistable curve (SGA 7 I, Exposé IX, 12.5). -/
noncomputable def edgeForm (len : E → ℕ) : (E →₀ ℤ) →ₗ[ℤ] (E →₀ ℤ) →ₗ[ℤ] ℤ :=
  LinearMap.mk₂ ℤ (fun c d => ∑ e, (len e : ℤ) * c e * d e)
    (by intros; simp [mul_add, add_mul, Finset.sum_add_distrib])
    (by intros; simp [Finset.mul_sum, mul_assoc, mul_left_comm])
    (by intros; simp [mul_add, Finset.sum_add_distrib])
    (by intros; simp [Finset.mul_sum, mul_assoc, mul_left_comm])

/-- The weighted edge form is symmetric on the edge module. -/
theorem edgeForm_symm (len : E → ℕ) (c d : E →₀ ℤ) :
    edgeForm len c d = edgeForm len d c := by sorry

/-- Reversing the orientation of an edge negates the corresponding coordinate and preserves the
form: the cycle lattice and the pairing do not depend on the chosen orientation. -/
theorem edgeForm_neg_coord (len : E → ℕ) (e₀ : E) (c d : E →₀ ℤ) :
    edgeForm len (c - 2 • Finsupp.single e₀ (c e₀)) (d - 2 • Finsupp.single e₀ (d e₀)) =
      edgeForm len c d := by sorry

/-- The coefficient bridge transports the single-loop binary dimension to integral rank one. -/
example : Module.finrank ℤ (cycleLattice (fun _ : Unit => ()) (fun _ : Unit => ())) = 1 := by
  rw [cycleLattice_rank_eq_cycleSpace_finrank]
  sorry

/-- The coefficient bridge transports the two-vertex tree's binary dimension to integral rank zero. -/
example : Module.finrank ℤ (cycleLattice (fun _ : Unit => (0 : Fin 2)) (fun _ => 1)) = 0 := by
  rw [cycleLattice_rank_eq_cycleSpace_finrank]
  sorry

/-- A loop of length `5` gives `5` on its unit cycle and `10` on coefficients `1,2`. -/
example : edgeForm (fun _ : Unit => 5) (Finsupp.single () 1) (Finsupp.single () 1) = 5 ∧
    edgeForm (fun _ : Unit => 5) (Finsupp.single () 1) (Finsupp.single () 2) = 10 := by sorry

/-- A length-five coordinate gives `−5` on coefficients `1,−1`; reversing both preserves
the value, while reversing only the first gives `5`. -/
example : edgeForm (fun _ : Unit => 5) (Finsupp.single () 1) (Finsupp.single () (-1)) = -5 ∧
    edgeForm (fun _ : Unit => 5) (Finsupp.single () (-1)) (Finsupp.single () 1) = -5 ∧
    edgeForm (fun _ : Unit => 5) (Finsupp.single () (-1)) (Finsupp.single () (-1)) = 5 := by
  norm_num [edgeForm]

/-- A zero edge length makes the form zero, even on a nonzero cycle. -/
example : edgeForm (fun _ : Unit => 0) (Finsupp.single () 1) (Finsupp.single () 1) = 0 := by
  sorry

/-- Negative control for connectedness: two vertices and no edge have cycle lattice `0`, and
`0 + 2 ≠ 0 + 1`. Apply the coefficient bridge and the supplied component count two. -/
example : Module.finrank ℤ (cycleLattice (fun _ : Fin 0 => (0 : Fin 2)) (fun _ => 0)) +
    Fintype.card (Fin 2) ≠ Fintype.card (Fin 0) + 1 := by
  rw [cycleLattice_rank_eq_cycleSpace_finrank]
  sorry

end DualGraph

namespace LatticePairing

variable {X Y : Type*} [AddCommGroup X] [AddCommGroup Y] [Module ℤ X] [Module ℤ Y]

/-- The adjoint `u♯ : Y → Hom(X, ℤ)` of an integral pairing `u : Y × X → ℤ`. Here `Y = X_{A^∨}` and `X = X_A`. -/
def adjoint (u : Y →ₗ[ℤ] X →ₗ[ℤ] ℤ) : Y →ₗ[ℤ] Module.Dual ℤ X := u

/-- The component group attached to an integral pairing: the cokernel of its adjoint. For the
monodromy pairing of a semistable abelian variety over a henselian discrete valuation ring this is
the geometric component group of the Néron model (SGA 7 I, Exposé IX, Theorem 11.5). -/
abbrev componentGroup (u : Y →ₗ[ℤ] X →ₗ[ℤ] ℤ) :=
  Module.Dual ℤ X ⧸ LinearMap.range (adjoint u)

variable [Module.Free ℤ X] [Module.Finite ℤ X] [Module.Free ℤ Y] [Module.Finite ℤ Y]

/-- The rank-one pairing `(y, x) ↦ n·x·y` on `ℤ × ℤ`. -/
noncomputable def rankOne (n : ℕ) : ℤ →ₗ[ℤ] ℤ →ₗ[ℤ] ℤ := (n : ℤ) • LinearMap.mul ℤ ℤ

/-- Rank-one evaluation specifies the adjoint: at `n = 5`, `y = 1`, `x = 2` its value is `10`. -/
example : adjoint (rankOne 5) 1 2 = 10 := by sorry

/-- At modulus `1` the adjoint is the identity functional; at modulus `0` it is zero. -/
example (y x : ℤ) : adjoint (rankOne 1) y x = y * x ∧
    adjoint (rankOne 0) y x = 0 := by sorry

/-- For the split Tate curve with `ord(q) = n` the pairing is multiplication by `n` and the
component group is `ℤ/n`. -/
example (n : ℕ) : Nonempty (componentGroup (rankOne n) ≃+ ZMod n) := by sorry

/-- Zero lattices (good reduction) give a zero component group, not a group of positive rank. -/
example : Subsingleton (componentGroup (0 : PUnit →ₗ[ℤ] PUnit →ₗ[ℤ] ℤ)) := by sorry

/-- Negative control for nondegeneracy: the zero pairing on `ℤ × ℤ` has cokernel `ℤ`, which is
infinite, so the discriminant pairing needs the finiteness hypothesis. -/
example : ¬ Finite (componentGroup (rankOne 0)) := by sorry

/-- The class of the dual functional `x ↦ r*x` in the first rank-one cokernel. -/
noncomputable def rankOneClass (n : ℕ) (r : ℤ) : componentGroup (rankOne n) :=
  Submodule.Quotient.mk (r • (LinearMap.id : Module.Dual ℤ ℤ))

/-- The same specified functional in the transposed rank-one cokernel. -/
noncomputable def rankOneDualClass (n : ℕ) (s : ℤ) : componentGroup (rankOne n).flip :=
  Submodule.Quotient.mk (s • (LinearMap.id : Module.Dual ℤ ℤ))

/-- The classes are the zero classes at residue `0`. -/
example (n : ℕ) : rankOneClass n 0 = 0 ∧ rankOneDualClass n 0 = 0 := by sorry

/-- Adding the modulus to a representative preserves each class. -/
example (n : ℕ) (r : ℤ) : rankOneClass n (r + n) = rankOneClass n r ∧
    rankOneDualClass n (r + n) = rankOneDualClass n r := by sorry

/-- Replacing `r` by `r + n` changes `r·s/n` by the integer `s`, so the value in `ℚ/ℤ` is
unchanged. -/
example (n : ℕ) (hn : 0 < n) (r s : ℤ) :
    ((((r + n) * s : ℚ) / n : ℚ) : AddCircle (1 : ℚ)) = (((r * s : ℚ) / n : ℚ) : AddCircle (1 : ℚ)) := by
  sorry

end LatticePairing

-- Tau Ceti's numerical Picard group of a numerical type (components with multiplicities, weights
-- and intersection matrix) and its degree map; the roadmap compares the component group of the
-- Jacobian with the kernel of this degree map and does not redefine the numerical side.
#check @TauCeti.NumericalType.Pic
#check @TauCeti.NumericalType.degree

/-! ## Layer 5: Tate modules, conductors and local factors -/

/-- At ramification index `2`, the monodromy for `ord(π)=1` is twice the
monodromy for `ord(p)=1` (Fontaine, Exposé III, §5.2.1, p. 158). -/
example : (2 : ℚ) * (5 / 2) = 5 ∧ (5 / 2 : ℚ) ≠ 5 := by sorry

/-- The unit `2` is not a cube modulo `7`, hence not a cube in `ℚ₇`; the Tate curve with
`q = 2·7³` nevertheless has unramified `3`-torsion, because `X³ − 2` has its roots in the
unramified cubic extension (README 5.1). -/
example : ∀ x : ZMod 7, x ^ 3 ≠ 2 := by decide

/-! ## Layer 6: interfaces for modularity and finiteness -/

namespace SemistableTrace

/-- Frobenius on the two graded pieces of a multiplicative elliptic motive in
cohomological period/torus order. In geometric instances `delta = ±1` is the action
of the chosen Weil element, and `q^d` is the geometric cyclotomic inverse
(Coleman–Iovita, Chapter I §2, pp. 9–12; Raynaud 1994, §4.7.4, p. 317). -/
def toricFrobenius (q delta : ℚ) (d : ℕ) : Matrix (Fin 2) (Fin 2) ℚ :=
  !![delta, 0; 0, q ^ d * delta]

/-- The full trace contains both lattice contributions. -/
theorem toricFrobenius_trace (q delta : ℚ) (d : ℕ) :
    Matrix.trace (toricFrobenius q delta d) = delta + q ^ d * delta := by sorry

/-- The determinant includes the square of the lattice action. -/
theorem toricFrobenius_det (q delta : ℚ) (d : ℕ) :
    Matrix.det (toricFrobenius q delta d) = q ^ d * delta ^ 2 := by sorry

/-- Geometric Frobenius has the inverse arithmetic monodromy factor:
`NF = q^d FN`. The arithmetic identity is valid also at degenerate scalar values. -/
theorem frobenius_monodromy_relation (q delta n : ℚ) (d : ℕ) :
    (!![0, n; 0, 0] : Matrix (Fin 2) (Fin 2) ℚ) * toricFrobenius q delta d =
      q ^ d • (toricFrobenius q delta d * !![0, n; 0, 0]) := by sorry

/-- At residue size two the geometric monodromy factor is one half;
reversing multiplication gives ten instead of five. -/
example :
    ((!![0, 5; 0, 0] : Matrix (Fin 2) (Fin 2) ℚ) * toricFrobenius 2 1 1) 0 1 = 10 ∧
    (toricFrobenius 2 1 1 * (!![0, 5; 0, 0] : Matrix (Fin 2) (Fin 2) ℚ)) 0 1 = 5 := by
  norm_num [toricFrobenius, Matrix.mul_apply, Fin.sum_univ_two]

/-- A nonsplit lattice action changes both signs and preserves the geometric factor. -/
example :
    ((!![0, 5; 0, 0] : Matrix (Fin 2) (Fin 2) ℚ) * toricFrobenius 2 (-1) 1) 0 1 = -10 ∧
    (toricFrobenius 2 (-1) 1 * (!![0, 5; 0, 0] : Matrix (Fin 2) (Fin 2) ℚ)) 0 1 = -5 := by
  norm_num [toricFrobenius, Matrix.mul_apply, Fin.sum_univ_two]

/-- Split multiplicative reduction over a residue field of size two has full trace
three and determinant two, rather than invariant trace one. -/
example : Matrix.trace (toricFrobenius 2 1 1) = 3 ∧
    Matrix.det (toricFrobenius 2 1 1) = 2 ∧
    Matrix.trace (toricFrobenius 2 1 1) ≠ 1 := by
  norm_num [toricFrobenius, Matrix.trace, Matrix.det_fin_two, Fin.sum_univ_two]

/-- The nonsplit action reverses both trace contributions but preserves the determinant. -/
example : Matrix.trace (toricFrobenius 2 (-1) 1) = -3 ∧
    Matrix.det (toricFrobenius 2 (-1) 1) = 2 ∧
    Matrix.trace (toricFrobenius 2 (-1) 1) ≠ -1 := by
  norm_num [toricFrobenius, Matrix.trace, Matrix.det_fin_two, Fin.sum_univ_two]

end SemistableTrace

namespace Interfaces

/-- A `2`-group acting linearly on a nonzero `𝔽₂`-vector space fixes a nonzero vector: the
group-theoretic step of the residual-point export (Boxer–Calegari–Gee–Pilloni 2025, Lemma 9.1.8).
It is the linear specialisation of Mathlib's
`IsPGroup.exists_fixed_point_of_prime_dvd_card_of_fixed_point` at `p = 2`, for the action of `G`
on `M` through `ρ`, the fixed point `0` and `Nat.card M = 2 ^ d` with `d > 0`; `IsPGroup.of_card`
turns the cardinality hypothesis into `IsPGroup 2 G`. -/
theorem exists_ne_zero_fixed_of_two_group {G : Type*} [Group G] [Finite G]
    (hG : ∃ k : ℕ, Nat.card G = 2 ^ k) {M : Type*} [AddCommGroup M] [Module (ZMod 2) M]
    [Module.Finite (ZMod 2) M] [Nontrivial M] (ρ : G →* (M →ₗ[ZMod 2] M)) :
    ∃ v : M, v ≠ 0 ∧ ∀ g, ρ g v = v := by sorry

/-- Negative control for the `2`-group hypothesis: a group of order `3` can permute the three
nonzero vectors of `𝔽₂²` cyclically and fix none of them. -/
example : ∃ ρ : Multiplicative (ZMod 3) →* ((Fin 2 → ZMod 2) →ₗ[ZMod 2] (Fin 2 → ZMod 2)),
    ∀ v : Fin 2 → ZMod 2, v ≠ 0 → ∃ g, ρ g v ≠ v := by sorry

/-- The image of `Gal(K(J[N])/K)` in `GSp_{2g}(ℤ/N)` has order less than `N^{4g²}`: the crude bound
used for the degree of a full-level extension (Yuan, Lemma 4.9). -/
theorem card_lt_of_subgroup_matrix (N g : ℕ) (hN : 1 < N) (hg : 0 < g)
    (H : Subgroup (Matrix (Fin (2 * g)) (Fin (2 * g)) (ZMod N))ˣ) :
    Nat.card H < N ^ (4 * g ^ 2) := by sorry

/-- Dimension zero refutes the strict bound: the group of units of `0×0` matrices has
order `1`, and `N^0 = 1`. -/
example : Nat.card (Matrix (Fin 0) (Fin 0) (ZMod 3))ˣ = 1 ∧
    ¬ Nat.card (Matrix (Fin 0) (Fin 0) (ZMod 3))ˣ < 3 ^ (4 * 0 ^ 2) := by sorry

/-- The finite-group intersection used in the ordinary residual-point theorem: the
centraliser of three disjoint transpositions has order `48`, while its point stabiliser
has order `8` (BCGP 2025, Lemma 9.1.8). -/
example (τ : Equiv.Perm (Fin 6))
    (hτ : τ = Equiv.swap 0 1 * Equiv.swap 2 3 * Equiv.swap 4 5) :
    Nat.card {σ : Equiv.Perm (Fin 6) // σ * τ = τ * σ} = 48 ∧
    Nat.card {σ : Equiv.Perm (Fin 6) // σ * τ = τ * σ ∧ σ 0 = 0} = 8 := by sorry

/-- Coordinate scaling `x = u²x'`, `y = u³y'` multiplies `dx/(2y)` by `u⁻¹`. -/
example (u : ℚ) (hu : u ≠ 0) : u ^ 2 / u ^ 3 = u⁻¹ := by sorry

/-- The two directions at `u = 5` have reciprocal factors, not the same factor. -/
example : (5 : ℚ) ^ 2 / 5 ^ 3 = 1 / 5 ∧ (5 : ℚ) ^ 3 / 5 ^ 2 = 5 := by sorry

/-- The split nodal tangent polynomial in characteristic `2` has two rational roots. -/
example : (Polynomial.X ^ 2 + Polynomial.X : Polynomial (ZMod 2)).Splits := by sorry

/-- The nonsplit nodal tangent polynomial in characteristic `2` is irreducible. -/
example : ¬ (Polynomial.X ^ 2 + Polynomial.X + 1 : Polynomial (ZMod 2)).Splits := by sorry

/-- Square discriminants do not detect this distinction in characteristic `2`:
the nonsplit polynomial takes the value `1` at each element of `𝔽₂`. -/
example (a : ZMod 2) :
    (Polynomial.X ^ 2 + Polynomial.X + 1 : Polynomial (ZMod 2)).eval a = 1 := by sorry

end Interfaces

/-!
## Further targets in README.md

Geometric definitions and comparisons are recorded there rather than typed here:
`GoodReduction`, `WeakNeronBlowup`, `DifferentialLattice`, `IdentityComponent`,
the geometric `ComponentGroup`, `Chevalley`, `ToricCharacter`,
`SemistableReduction` and `henselization_iff`, `FiniteFlatToricFiltration`,
`FiniteFlatOrthogonality`, `RaynaudExtensionComparison`,
`RigidUniformisation`, `RaynaudOneMotive`, `PicardZero`,
`IntegralMonodromyPairing`, `ComponentPairing`, `RegularPicardNeronQuotient`,
`BgwNodalPinch`, `BgwGeneralizedJacobian`, `BgwOddFactorTorsors`, `StableFamilyPicard`,
`B_st`, `D_st`, the semistable predicate, the `PeriodRealization` API on the shared
period functors, `D_pst`, `PadicWeilDeligneRealization`,
`AbelianVariety.deRham`, and `SemistableOrdinaryAdapter`.
Their geometric Checks are likewise in README.md.

`SemistableIdentityBasechange` in README 3.3 provides identity-model base change and
the open-immersion helper for a smooth separated finite-type group scheme over a DVR,
with a generic-fibre marking and semi-abelian open identity component. Both the
base-changed Néron identity model and `PicardZero` satisfy whole-group smoothness;
no residue-field restriction is imposed.

SelmerIwasawaCohomology 4.1–4.5 supplies `B_cris`, `D_cris`, `D_dR` and their
crystalline and de Rham predicates: these denote its `bCris`, `dCris`, `dDeRham`,
`IsCrystalline` and `IsDeRham`. README 5.3 extends that core by `B_st` and `D_st`,
retaining the logarithm branch, `N = e * N_p` and the `K₀` versus `K` scalar fields.
`PeriodRealization` supplies functoriality, `dim_le` (using the supplied crystalline
and de Rham bounds), tensor/dual compatibility on the admissible subcategories and
finite-extension de Rham descent for those same carriers. Its weights are filtration
indices, so `ℚ_p(1)` has weight `-1`; R01.7's numeric labels have the opposite sign.
`PadicComparison` uses these supplied predicates and identifies their `D_dR(V_p(A))`
with the dual degree-one de Rham cohomology and its dual Hodge filtration, naturally
under finite extensions. The elliptic Bloch–Kato diagram of the supplier's 4.26 uses
that same `dDeRham(V_p(E))/Fil⁰`.

The construction `NeronModel.extend` and its API (`extend_restrict`, `extend_unique`,
`extend_map`, `extend_identity`, `extend_precomp`, `extend_proof_irrel`, `extend_to_model`,
`extend_comp_model`, `extend_inverse_model`, `extend_isIso`) are README 1.3 targets.
README 1.1, 1.2 and 1.6 specify the projection and restriction APIs, including
`NeronMappingProperty.identityRestriction`, `NeronModel.smooth_model`, `separated_model`,
`quasiCompact_model`, `mappingProperty`, `generic_hom_inv`, `generic_inv_hom`,
`genericIso_isIso` and `identity_unique`, and `WeakNeronModel.smooth_model`.
README 4.3 specifies `operator_apply`, `periodProjection_apply`, `weilForm_add_left`,
`weilForm_add_right` and `weilForm_skew`; README 6.10 specifies `degree_zero` and `zero_action`.
The two-lattice construction in README 4.6 has intended signature
`LatticePairing.discriminantPairing (u : Y →ₗ[ℤ] X →ₗ[ℤ] ℤ)
  (hinj : Function.Injective (LatticePairing.adjoint u))
  (hfin : Finite (LatticePairing.componentGroup u)) :
  LatticePairing.componentGroup u →+ (LatticePairing.componentGroup u.flip →+ AddCircle (1 : ℚ))`.
Its API targets are `discriminantPairing_zero_left`, `discriminantPairing_mk` and
`discriminantPairing_rankOne` in README 4.6. These are mathematical targets, not Lean declarations.

The corresponding untyped theorems include `GroupLaw`, `Smoothening`, `LocalExistence`,
`AbelianSchemeModel`, `SpreadAbelian`, `DedekindGluing`, `EtaleBasechange`,
`JacobianIsogenyFactor`, `FiniteSeparableSemistableExtension`, `MonodromyCriterion`,
`GraphMonodromy`, `ComponentCokernel`, `IntersectionComponentQuotient`, the Picard–Néron
comparison, Néron–Ogg–Shafarevich, `PadicComparison`, conductor and local-factor comparisons,
and the geometric exports of Layer 6. The signed `prime_adic`, `prime_adic_finite_flat`,
`prime_adic_transition` and `henselian_valuation_descent` comparisons, together with
`good_abelian_frobenius_polynomial`, `semistable_trace_comparison`,
`semistable_trace_descent` and `pure_WD_export`, are stated
in README 4.3, 5.3 and 6.10. Their coordinate witnesses above do not construct the geometric
or cohomological carriers.
-/

end TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

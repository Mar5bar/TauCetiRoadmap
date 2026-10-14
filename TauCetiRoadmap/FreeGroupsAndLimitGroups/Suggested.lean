import Mathlib
import TauCeti.GroupTheory.TrivialIntersection
import TauCeti.GroupTheory.FreeGroup.ResiduallyP
import TauCeti.GroupTheory.Schreier

/-!
# FreeGroupsAndLimitGroups: representative target signatures

This file is not the roadmap. The roadmap is `README.md`,
which is definitive; this file is not exhaustive. It records light definitions with real bodies
over carriers that exist in Mathlib, and theorem signatures statable against the pinned APIs, so
that the conventions and signatures are explicit. Every proof is `sorry`.

Design choices made explicit here:
* word and conjugacy statements use Mathlib's words `List (α × Bool)` and `FreeGroup α`;
* roots are specified by existence and uniqueness, with the identity excluded;
* no executable procedure or algorithm implementation is a declaration here;
* equations over a group `G` are elements of `G[X] := Monoid.Coprod G (FreeGroup X)`;
* coordinate groups are quotients by kernels of evaluation maps, so normality is automatic;
* malnormality is Tau Ceti's `TauCeti.IsTISubgroup` and abelian subgroups use Mathlib's
  `IsMulCommutative`; neither is defined again here;
* heavy constructions (graphs of groups and their fundamental groups, Bass–Serre trees,
  generalised equations, JSJ decompositions, Makanin–Razborov diagrams, infinite words) are
  README targets and do not appear here.
-/

namespace TauCetiRoadmap.FreeGroupsAndLimitGroups

open FreeGroup
open scoped commutatorElement

/-! ## Layer 1: free-group conjugacy, roots and centralizers -/

section layer1

variable {α : Type*} [DecidableEq α]

/-- Conjugacy criterion (§1.1): two elements are conjugate iff their cyclic reductions are
rotations of each other. -/
theorem isConj_iff_isRotated (x y : FreeGroup α) :
    IsConj x y ↔ (FreeGroup.reduceCyclically x.toWord).IsRotated
      (FreeGroup.reduceCyclically y.toWord) := by
  sorry

example (a b : α) (h : a ≠ b) :
    ¬ IsConj (FreeGroup.of a * FreeGroup.of b) (FreeGroup.of a * FreeGroup.of b)⁻¹ := by
  sorry

end layer1

/-- A proper power: `x = y ^ n` with `n ≥ 2` (§1.2). The identity is a proper power, so
‘not a proper power’ is used for nontrivial elements only. -/
def IsProperPower {G : Type*} [Group G] (x : G) : Prop :=
  ∃ y : G, ∃ n : ℕ, 2 ≤ n ∧ x = y ^ n

/-- A primitive element of a free group: a member of some free basis (§1.3). Being primitive is
not the negation of being a proper power. The README API includes
`FreeGroup.IsPrimitive.map_mulEquiv` (invariance under isomorphisms) and
`FreeGroup.IsPrimitive.not_isProperPower` (basis elements are not proper powers). -/
def IsPrimitive {G : Type u} [Group G] (x : G) : Prop :=
  ∃ (ι : Type u) (b : FreeGroupBasis ι G) (i : ι), b i = x

/-- CSA groups: every maximal abelian subgroup is malnormal, malnormality being Tau Ceti's
`TauCeti.IsTISubgroup` (§1.7). The README additionally asks for
`Group.IsCSA.centralizer_isMaximalAbelian`, identifying the centralizer of a nontrivial
member with its unique maximal abelian subgroup; `Group.IsCSA.of_injective` and
`Group.IsCSA.of_commGroup`, for subgroup inheritance and abelian groups; and
`Group.IsCSA.center_eq_bot`, with the explicit nonabelian hypothesis. -/
def IsCSA (G : Type*) [Group G] : Prop :=
  ∀ M : Subgroup G, IsMulCommutative M →
    (∀ N : Subgroup G, M ≤ N → IsMulCommutative N → N = M) → TauCeti.IsTISubgroup M

/-- Commutation is transitive on nontrivial elements (§1.7). -/
def IsCommTransitive (G : Type*) [Group G] : Prop :=
  ∀ x y z : G, y ≠ 1 → Commute x y → Commute y z → Commute x z

/-- CSA groups are commutative transitive (§1.7). -/
theorem IsCSA.isCommTransitive {G : Type*} [Group G] (hG : IsCSA G) : IsCommTransitive G := by
  sorry

example : IsCSA (Multiplicative ℤ) := by
  sorry

example : ¬ IsCommTransitive (FreeGroup (Fin 2) × Multiplicative ℤ) := by
  sorry

example {α : Type u} (a : α) : IsPrimitive (FreeGroup.of a) := by
  sorry

example (a : Fin 2) : ¬ TauCeti.IsTISubgroup (Subgroup.zpowers (FreeGroup.of a ^ 2)) := by
  sorry

example : TauCeti.IsTISubgroup (⊥ : Subgroup (FreeGroup (Fin 2))) := by
  sorry

example : ¬ IsCSA (FreeGroup (Fin 2) × Multiplicative ℤ) := by
  sorry

example : IsCommTransitive (FreeGroup (Fin 2)) := by
  sorry

section roots

variable {α : Type*} [DecidableEq α]

example (a : α) : IsProperPower (FreeGroup.of a ^ 2) := by
  sorry

example (a : α) : ¬ IsProperPower (FreeGroup.of a) := by
  sorry

example (a b : α) (h : a ≠ b) :
    ¬ IsProperPower (FreeGroup.of a * FreeGroup.of b * (FreeGroup.of a)⁻¹ * (FreeGroup.of b)⁻¹) := by
  sorry

example (a b : α) (h : a ≠ b) :
    ¬ IsPrimitive (FreeGroup.of a * FreeGroup.of b * (FreeGroup.of a)⁻¹ * (FreeGroup.of b)⁻¹) := by
  sorry

/-- Every nontrivial element has a unique non-proper-power root with positive exponent;
all its positive-exponent roots are powers of that root. -/
theorem exists_maximalRoot (x : FreeGroup α) (hx : x ≠ 1) :
    ∃ (r : FreeGroup α) (k : ℕ), 1 ≤ k ∧ r ^ k = x ∧ ¬ IsProperPower r ∧
      (∀ (s : FreeGroup α) (m : ℕ), 1 ≤ m → s ^ m = x → ¬ IsProperPower s →
        s = r ∧ m = k) ∧
      ∀ (y : FreeGroup α) (n : ℕ), 1 ≤ n → y ^ n = x → n ∣ k ∧ y = r ^ (k / n) := by
  sorry

/-- Commuting elements are powers of a common element (§1.5). -/
theorem commute_iff_exists_zpow (x y : FreeGroup α) :
    Commute x y ↔ ∃ r : FreeGroup α, ∃ m n : ℤ, x = r ^ m ∧ y = r ^ n := by
  sorry

/-- Centralizers of nontrivial elements are cyclic, generated by the maximal root (§1.6). -/
theorem centralizer_eq_zpowers (x : FreeGroup α) (hx : x ≠ 1) :
    ∃ r : FreeGroup α, ¬ IsProperPower r ∧
      Subgroup.centralizer {x} = Subgroup.zpowers r := by
  sorry

/-- Maximal cyclic subgroups are malnormal (§1.8). -/
theorem zpowers_malnormal (u : FreeGroup α) (hu : u ≠ 1) (hu' : ¬ IsProperPower u) :
    TauCeti.IsTISubgroup (Subgroup.zpowers u) := by
  sorry

/-- Free groups are CSA (§1.8). -/
theorem isCSA_freeGroup : IsCSA (FreeGroup α) := by
  sorry

end roots

/-! ## Layer 2: Stallings graphs and finitely generated free subgroups -/

/-- Serre graphs: an origin map and a fixed-point-free involution on edges; loops and multiple
edges are allowed (§2.1). The README's `SerreGraph.toQuiver_reverse` identifies reversal
with that of the associated quiver, and `SerreGraph.IsTree.unique_reduced_path` fixes the
path characterization of trees. -/
structure SerreGraph (V : Type*) (E : Type*) where
  /-- The origin of an edge. -/
  src : E → V
  /-- Edge reversal. -/
  rev : E → E
  rev_rev : ∀ e, rev (rev e) = e
  rev_ne : ∀ e, rev e ≠ e

namespace SerreGraph

variable {V E : Type*} (Γ : SerreGraph V E)

/-- The terminus of an edge. -/
def tgt (e : E) : V := Γ.src (Γ.rev e)

/-- `IsPath u es w`: the list of edges `es` is a path from `u` to `w`. -/
def IsPath : V → List E → V → Prop
  | u, [], w => u = w
  | u, e :: es, w => Γ.src e = u ∧ IsPath (Γ.tgt e) es w

/-- Reduced paths: no edge is followed by its reverse. -/
def IsReducedPath (es : List E) : Prop :=
  es.IsChain fun e f => f ≠ Γ.rev e

/-- Trees: nonempty, connected, and without reduced closed paths of positive length. -/
def IsTree : Prop :=
  Nonempty V ∧ (∀ u w : V, ∃ es, Γ.IsPath u es w) ∧
    ∀ (v : V) (es : List E), Γ.IsPath v es v → Γ.IsReducedPath es → es = []

example (e : E) : Γ.tgt (Γ.rev e) = Γ.src e := by
  sorry

example (v : V) : Γ.IsPath v [] v := by
  sorry

example (e : E) : Γ.IsPath (Γ.src e) [e] (Γ.tgt e) := by
  sorry

example (e : E) : Γ.IsReducedPath [e] := by
  sorry

example (e : E) : ¬ Γ.IsReducedPath [e, Γ.rev e] := by
  sorry

-- README `SerreGraph.rose_one_not_tree`: a loop is a reduced closed path.
example (e : E) (he : Γ.tgt e = Γ.src e) : ¬ Γ.IsTree := by
  sorry

example : ¬ Nonempty (SerreGraph Unit Unit) := by
  sorry

-- README `SerreGraph.single_vertex_isTree`: nonempty trees may have no edges.
example : ∃ T : SerreGraph Unit Empty, T.IsTree := by
  sorry

-- README `SerreGraph.segment_isTree` and `SerreGraph.double_edge_not_tree` distinguish
-- a segment from parallel edge pairs: the latter give the closed path [e, rev f].
end SerreGraph

/-- `α`-labelled graphs with labels compatible with reversal: the README's `StallingsGraph`
(§2.3), with the base vertex passed as an argument. -/
structure LabelledGraph (α : Type*) (V : Type*) (E : Type*) extends SerreGraph V E where
  /-- The label of an edge: a letter and an exponent sign. -/
  label : E → α × Bool
  label_rev : ∀ e, label (rev e) = ((label e).1, !(label e).2)

namespace LabelledGraph

variable {α V E : Type*} (Γ : LabelledGraph α V E)

/-- The subgroup of `FreeGroup α` accepted at a vertex: generated by the labels of closed paths
(the README's `StallingsGraph.subgroup`, §2.3). -/
def accepted (v : V) : Subgroup (FreeGroup α) :=
  Subgroup.closure
    {g | ∃ es : List E, Γ.toSerreGraph.IsPath v es v ∧ g = FreeGroup.mk (es.map Γ.label)}

/-- Folded graphs: at each vertex at most one edge with each label. -/
def IsFolded : Prop :=
  ∀ e f : E, Γ.src e = Γ.src f → Γ.label e = Γ.label f → e = f

/-- The labels of closed paths at `v` already form a subgroup, so the closure adds nothing. -/
theorem mem_accepted_iff (v : V) (g : FreeGroup α) :
    g ∈ Γ.accepted v ↔
      ∃ es : List E, Γ.toSerreGraph.IsPath v es v ∧ g = FreeGroup.mk (es.map Γ.label) := by
  sorry

/-- For folded graphs, a reduced word lies in the accepted subgroup iff it is the label of a
reduced closed path at `v` (§2.3; KM02 Lemma 3.2). -/
theorem mem_accepted_iff_of_isFolded (hΓ : Γ.IsFolded) (v : V) (w : List (α × Bool))
    (hw : FreeGroup.IsReduced w) :
    FreeGroup.mk w ∈ Γ.accepted v ↔
      ∃ es : List E, Γ.toSerreGraph.IsPath v es v ∧ Γ.toSerreGraph.IsReducedPath es ∧
        es.map Γ.label = w := by
  sorry

example (v : V) : (1 : FreeGroup α) ∈ Γ.accepted v := by
  sorry

example (e : E) (he : Γ.tgt e = Γ.src e) :
    FreeGroup.mk [Γ.label e] ∈ Γ.accepted (Γ.src e) := by
  sorry

example (e f : E) (hsrc : Γ.src e = Γ.src f) (hlab : Γ.label e = Γ.label f)
    (hne : e ≠ f) : ¬ Γ.IsFolded := by
  sorry

example (e : E) : Γ.label (Γ.rev e) = ((Γ.label e).1, !(Γ.label e).2) := by
  sorry

/-- The labelled-graph product over the rose (§2.9). -/
def prod {W D : Type*} (Δ : LabelledGraph α W D) :
    LabelledGraph α (V × W) {p : E × D // Γ.label p.1 = Δ.label p.2} where
  src e := (Γ.src e.1.1, Δ.src e.1.2)
  rev e := ⟨(Γ.rev e.1.1, Δ.rev e.1.2), by sorry⟩
  rev_rev := by sorry
  rev_ne := by sorry
  label e := Γ.label e.1.1
  label_rev := by sorry

/-- Product labels belong to both accepted subgroups, with no foldedness hypothesis. -/
theorem prod_accepted_le {W D : Type*} (Δ : LabelledGraph α W D) (v : V) (w : W) :
    (Γ.prod Δ).accepted (v, w) ≤ Γ.accepted v ⊓ Δ.accepted w := by
  sorry

/-- Folded factors give the intersection equality (§2.9). -/
theorem prod_accepted {W D : Type*} (Δ : LabelledGraph α W D)
    (hΓ : Γ.IsFolded) (hΔ : Δ.IsFolded) (v : V) (w : W) :
    (Γ.prod Δ).accepted (v, w) = Γ.accepted v ⊓ Δ.accepted w := by
  sorry

end LabelledGraph

section layer2

variable {α : Type*} [DecidableEq α]

/-- Howson property (§2.10). -/
theorem fg_inf (H K : Subgroup (FreeGroup α)) (hH : H.FG) (hK : K.FG) : (H ⊓ K).FG := by
  sorry

/-- The exact Schreier formula (§2.11); this is the equality for free groups. -/
theorem rank_sub_one_eq_index_mul (n : ℕ) (H : Subgroup (FreeGroup (Fin n)))
    [H.FiniteIndex] [Group.FG H] :
    (Group.rank H : ℤ) - 1 = H.index * ((n : ℤ) - 1) := by
  sorry

example (a b : α) (h : a ≠ b) :
    FreeGroup.of b ∉ Subgroup.closure {FreeGroup.of a, FreeGroup.of b * FreeGroup.of a * (FreeGroup.of b)⁻¹} := by
  sorry

end layer2

/-! ## Layer 3: first-order group syntax and solution statements -/

/-- Function symbols of the language of groups. -/
inductive GroupFunc : ℕ → Type
  | one : GroupFunc 0
  | inv : GroupFunc 1
  | mul : GroupFunc 2

/-- The first-order language of groups (§3.1; the README's `FirstOrder.Language.group`). Coefficients are carried by free variables
interpreted through a map `c : A → G`, as in the term–word correspondence. -/
def groupLang : FirstOrder.Language where
  Functions := GroupFunc
  Relations := fun _ => Empty

/-- Interpretation of a group symbol in a group. -/
def GroupFunc.eval {G : Type*} [Group G] : {n : ℕ} → GroupFunc n → (Fin n → G) → G
  | _, .one, _ => 1
  | _, .inv, x => (x 0)⁻¹
  | _, .mul, x => x 0 * x 1

/-- Every group is a structure for the language of groups (§3.1). -/
instance groupStructure (G : Type*) [Group G] : groupLang.Structure G where
  funMap f x := GroupFunc.eval f x
  RelMap r _ := Empty.elim r

example : groupLang.Relations 2 = Empty := by
  sorry

example {G : Type*} [Group G] (x : Fin 2 → G) : GroupFunc.eval .mul x = x 0 * x 1 := by
  sorry

example {G : Type*} [Group G] :
    (FirstOrder.Language.Term.func (L := groupLang) GroupFunc.one
      (fun i => Fin.elim0 i) : groupLang.Term Empty).realize (fun i => Empty.elim i) = (1 : G) := by
  sorry

/-- The three universally quantified group axioms (§3.1). -/
noncomputable def groupTheory : groupLang.Theory :=
  let x : groupLang.Term (Empty ⊕ Fin 3) := .var (.inr 0)
  let y : groupLang.Term (Empty ⊕ Fin 3) := .var (.inr 1)
  let z : groupLang.Term (Empty ⊕ Fin 3) := .var (.inr 2)
  let one : groupLang.Term (Empty ⊕ Fin 3) := .func .one ![]
  let mul := fun a b : groupLang.Term (Empty ⊕ Fin 3) =>
    FirstOrder.Language.Term.func GroupFunc.mul ![a,b]
  let inv := fun a : groupLang.Term (Empty ⊕ Fin 3) =>
    FirstOrder.Language.Term.func GroupFunc.inv ![a]
  {((mul (mul x y) z).equal (mul x (mul y z))).iAlls (Fin 3),
    ((mul one x).equal x ⊓ (mul x one).equal x).iAlls (Fin 3),
    ((mul (inv x) x).equal one ⊓ (mul x (inv x)).equal one).iAlls (Fin 3)}

/-- The term–word correspondence (§3.2; the README's `Term.toWord` with no coefficient letters): the
word of a term is its value in the free group. -/
def termToWord {X : Type*} (t : groupLang.Term X) : FreeGroup X :=
  t.realize FreeGroup.of

example {X : Type*} (x : X) : termToWord (FirstOrder.Language.Term.var x) = FreeGroup.of x := by
  sorry

example {X : Type*} :
    termToWord (FirstOrder.Language.Term.func GroupFunc.one (fun i => Fin.elim0 i) :
      groupLang.Term X) = 1 := by
  sorry

/-- A reduced word gives a left-nested product term (§3.2). -/
noncomputable def wordToTerm {X : Type*} (w : FreeGroup X) : groupLang.Term X := by
  classical
  exact w.toWord.foldl (fun t a =>
    .func .mul ![t, if a.2 then .var a.1 else .func .inv ![.var a.1]])
      (.func .one ![])

/-- Terms evaluate through their words in every group (§3.2). -/
theorem realize_eq_lift {X G : Type*} [Group G] (v : X → G) (t : groupLang.Term X) :
    t.realize v = FreeGroup.lift v (termToWord t) := by
  sorry

/-- Finite systems of equations and inequations with variables `X` and coefficient letters `A`
(§3.3). The README's `FreeGroup.EqIneqSystem.isSolution_map` requires an injective
coefficient-preserving homomorphism to transfer inequations, and
`FreeGroup.EqIneqSystem.isSolution_iff_formula` matches the conjunction of its atoms.
`FreeGroup.EqIneqSystem.isSolution_iff_reduced` specializes this predicate to the
empty/nonempty reduced-word criteria over a free group. -/
structure EqIneqSystem (X A : Type*) where
  /-- Equations `w = 1`. -/
  eqs : List (FreeGroup (X ⊕ A))
  /-- Inequations `w ≠ 1`. -/
  ineqs : List (FreeGroup (X ⊕ A))

/-- Solutions of a system in a group `G` with coefficient map `c` (§3.3). -/
def EqIneqSystem.IsSolution {X A G : Type*} [Group G] (s : EqIneqSystem X A) (c : A → G)
    (v : X → G) : Prop :=
  (∀ w ∈ s.eqs, FreeGroup.lift (Sum.elim v c) w = 1) ∧
    ∀ w ∈ s.ineqs, FreeGroup.lift (Sum.elim v c) w ≠ 1

-- README `FreeGroup.EqIneqSystem.ineq_not_eq`: a nontrivial generator satisfies x ≠ 1.
example {A : Type*} (a : A) :
    (⟨[], [FreeGroup.of (Sum.inl ())]⟩ : EqIneqSystem Unit A).IsSolution FreeGroup.of
      (fun _ => FreeGroup.of a) := by
  sorry

example {A : Type*} :
    ¬ (⟨[], [FreeGroup.of (Sum.inl ())]⟩ : EqIneqSystem Unit A).IsSolution FreeGroup.of
      (fun _ => 1) := by
  sorry

-- README `FreeGroup.EqIneqSystem.empty_system`: all assignments solve no constraints.
example {X A G : Type*} [Group G] (c : A → G) (v : X → G) :
    (⟨[], []⟩ : EqIneqSystem X A).IsSolution c v := by
  sorry

-- README `FreeGroup.EqIneqSystem.solution_commuting`: equations and inequations coexist.
example (a : Fin 2) :
    (⟨[FreeGroup.of (Sum.inl false) * FreeGroup.of (Sum.inl true) *
      (FreeGroup.of (Sum.inl false))⁻¹ * (FreeGroup.of (Sum.inl true))⁻¹],
      [FreeGroup.of (Sum.inl false)]⟩ : EqIneqSystem Bool (Fin 2)).IsSolution FreeGroup.of
        (fun b => if b then FreeGroup.of a ^ 2 else FreeGroup.of a) := by
  sorry

/-! ## Layer 4: Bass–Serre theory and relative splittings -/

section layer4

/-- Dehn twists of HNN extensions (§4.13): for `z` centralizing the associated subgroup `A`,
there is an automorphism fixing the base group and sending `t` to `t * z`. -/
theorem exists_dehnTwist_hnn {G : Type*} [Group G] (A B : Subgroup G) (φ : A ≃* B) (z : G)
    (hz : ∀ a : A, Commute z a) :
    ∃ τ : HNNExtension G A B φ ≃* HNNExtension G A B φ,
      (∀ g : G, τ (HNNExtension.of g) = HNNExtension.of g) ∧
        τ HNNExtension.t = HNNExtension.t * HNNExtension.of z := by
  sorry

/-- An HNN twist with the prescribed base and stable-letter values is the identity exactly
when its parameter is the identity (§4.13). -/
theorem dehnTwistHNN_eq_refl_iff {G : Type*} [Group G] (A B : Subgroup G) (φ : A ≃* B)
    (z : G) (τ : HNNExtension G A B φ ≃* HNNExtension G A B φ)
    (hbase : ∀ g : G, τ (HNNExtension.of g) = HNNExtension.of g)
    (ht : τ HNNExtension.t = HNNExtension.t * HNNExtension.of z) :
    τ = MulEquiv.refl _ ↔ z = 1 := by
  sorry

/-- The identity HNN extension of `ℤ` has a nonidentity twist with a central parameter. -/
example :
    let A : Subgroup (Multiplicative ℤ) := ⊤
    let K := HNNExtension (Multiplicative ℤ) A A (MulEquiv.refl A)
    ∃ τ : K ≃* K,
      (∀ g : Multiplicative ℤ, τ (HNNExtension.of g) = HNNExtension.of g) ∧
      τ HNNExtension.t = HNNExtension.t * HNNExtension.of (Multiplicative.ofAdd 1) ∧
      τ ≠ MulEquiv.refl K := by
  sorry

/-- Grushko–Neumann theorem (§4.11). -/
theorem rank_coprod {G H : Type*} [Group G] [Group H] [Group.FG G] [Group.FG H]
    [Group.FG (Monoid.Coprod G H)] [Nontrivial G] [Nontrivial H] :
    Group.rank (Monoid.Coprod G H) = Group.rank G + Group.rank H := by
  sorry

end layer4

/-! ## Layer 5: equations, radicals, and algebraic geometry over groups -/

section layer5

variable {G : Type*} [Group G]

/-- The free `G`-group `G[X] = G ∗ F(X)` (§5.1). -/
abbrev GX (G : Type*) [Group G] (X : Type*) := Monoid.Coprod G (FreeGroup X)

/-- Evaluation of `G[X]` at a point of a `G`-group (§5.1; the README's `GroupAlgGeom.eval`). -/
def evalAt {X H : Type*} [Group H] (ι : G →* H) (v : X → H) : GX G X →* H :=
  Monoid.Coprod.lift ι (FreeGroup.lift v)

/-- Algebraic sets `V_H(S)` (§5.2; the README's `GroupAlgGeom.V`). -/
def algSet {X H : Type*} [Group H] (ι : G →* H) (S : Set (GX G X)) : Set (X → H) :=
  {v | ∀ s ∈ S, evalAt ι v s = 1}

/-- The ideal `I_H(Y)` of a set of points, as the kernel of the joint evaluation (§5.2; the README's
`GroupAlgGeom.I`). -/
abbrev idealOf {X H : Type*} [Group H] (ι : G →* H) (Y : Set (X → H)) : Subgroup (GX G X) :=
  (MonoidHom.pi fun v : Y => evalAt ι v.1).ker

/-- The radical `Rad_H(S) = I_H(V_H(S))` of a system over `H` (§5.2; the README's `GroupAlgGeom.Rad`). -/
abbrev radical {X H : Type*} [Group H] (ι : G →* H) (S : Set (GX G X)) : Subgroup (GX G X) :=
  idealOf ι (algSet ι S)

/-- The coordinate group `G[X] ⧸ Rad(S)` (§5.2; the README's `GroupAlgGeom.coordGroup`). -/
abbrev CoordGroup {X H : Type*} [Group H] (ι : G →* H) (S : Set (GX G X)) : Type _ :=
  GX G X ⧸ radical ι S

/-- Separation by coefficient-preserving maps (§§5.3, 5.11), with arbitrary coefficient
homomorphisms; injective maps give the bundled `G`-group specialization. -/
def IsSeparatedBy (K H : Type*) [Group K] [Group H] (ιK : G →* K) (ιH : G →* H) : Prop :=
  ∀ k : K, k ≠ 1 → ∃ φ : K →* H, φ.comp ιK = ιH ∧ φ k ≠ 1

/-- `K` is `G`-discriminated by `H` (fully residually `H`) (§5.3). -/
def IsDiscriminatedBy (K H : Type*) [Group K] [Group H] (ιK : G →* K) (ιH : G →* H) : Prop :=
  ∀ s : Finset K, (1 : K) ∉ s → ∃ φ : K →* H, φ.comp ιK = ιH ∧ ∀ k ∈ s, φ k ≠ 1

/-- `G`-domains: no `G`-zero divisors (§5.4). The README's
`GroupAlgGeom.IsGDomain.of_CSA` requires a CSA target and an injective map from a
nonabelian coefficient group. -/
def IsGDomain (H : Type*) [Group H] (ι : G →* H) : Prop :=
  ∀ x y : H, x ≠ 1 → y ≠ 1 → ∃ g : G,
    x * (ι g * y * (ι g)⁻¹) * x⁻¹ * (ι g * y * (ι g)⁻¹)⁻¹ ≠ 1

/-- Equationally Noetherian groups (§5.7). The README API
`GroupAlgGeom.IsEquationallyNoetherian.exists_finite` gives the finite subsystem and
`GroupAlgGeom.IsEquationallyNoetherian.rad_finite` identifies its radical with the original. -/
def IsEquationallyNoetherian (H : Type*) [Group H] : Prop :=
  ∀ (X : Type) [Finite X] (S : Set (GX H X)),
    ∃ S₀ ⊆ S, S₀.Finite ∧ algSet (MonoidHom.id H) S₀ = algSet (MonoidHom.id H) S

/-- The Zariski topology: generated by complements of algebraic sets (§5.6). -/
abbrev zariski {X H : Type*} [Group H] (ι : G →* H) : TopologicalSpace (X → H) :=
  TopologicalSpace.generateFrom {U | ∃ S : Set (GX G X), U = (algSet ι S)ᶜ}

/-- Closed sets over a `G`-domain with an injective, nontrivial coefficient group are algebraic
(§5.6); the nontrivial coefficient provides an inconsistent equation for the empty set. -/
theorem isClosed_iff_algebraic {X H : Type*} [Group H] [Nontrivial G]
    (ι : G →* H) (hι : Function.Injective ι) (hD : IsGDomain H ι) (Y : Set (X → H)) :
    @IsClosed _ (zariski ι) Y ↔ ∃ S : Set (GX G X), algSet ι S = Y := by
  sorry

/-- Closure is the zero set of the vanishing ideal for a `G`-domain with injective,
nontrivial coefficients (§5.6). -/
theorem closure_eq_V_I {X H : Type*} [Group H] [Nontrivial G]
    (ι : G →* H) (hι : Function.Injective ι) (hD : IsGDomain H ι) (Y : Set (X → H)) :
    @closure _ (zariski ι) Y = algSet ι (idealOf ι Y : Set (GX G X)) := by
  sorry

/-- The radical equals the defining normal closure exactly when the quotient is separated
by coefficient-preserving maps (§5.11). Here the coefficient homomorphisms are arbitrary;
an injective target coefficient map and a nonempty solution set make the quotient a
bundled `G`-group. -/
theorem radical_eq_normalClosure_iff_separated {X H : Type*} [Group H]
    (ι : G →* H) (S : Set (GX G X)) :
    radical ι S = Subgroup.normalClosure S ↔
      IsSeparatedBy (GX G X ⧸ Subgroup.normalClosure S) H
        ((QuotientGroup.mk' _).comp Monoid.Coprod.inl) ι := by
  sorry

example {X H : Type*} [Group H] (ι : G →* H) (v : X → H) (g : G) :
    evalAt ι v (Monoid.Coprod.inl g) = ι g := by
  sorry

example {X H : Type*} [Group H] (ι : G →* H) (v : X → H) (x : X) :
    evalAt ι v (Monoid.Coprod.inr (FreeGroup.of x)) = v x := by
  sorry

example {X : Type*} : algSet (MonoidHom.id G) (∅ : Set (GX G X)) = Set.univ := by
  sorry

example {X : Type*} :
    idealOf (MonoidHom.id G) (∅ : Set (X → G)) = ⊤ := by
  sorry

example {X : Type*} (x : X) :
    radical (MonoidHom.id (FreeGroup (Fin 2))) {Monoid.Coprod.inr (FreeGroup.of x)} =
      Subgroup.normalClosure {(Monoid.Coprod.inr (FreeGroup.of x) : GX (FreeGroup (Fin 2)) X)} := by
  sorry

example : Nonempty (CoordGroup (MonoidHom.id G)
    (∅ : Set (GX G Empty)) ≃* G) := by
  sorry

example : IsSeparatedBy G G (MonoidHom.id G) (MonoidHom.id G) := by
  sorry

example : IsDiscriminatedBy G G (MonoidHom.id G) (MonoidHom.id G) := by
  sorry

example {X : Type*} (v : X → G) : @IsClosed _ (zariski (MonoidHom.id G)) {v} := by
  sorry

example : IsEquationallyNoetherian (Multiplicative ℤ) := by
  sorry

example : ¬ IsGDomain (Multiplicative ℤ)
    (1 : FreeGroup (Fin 2) →* Multiplicative ℤ) := by
  sorry

/-- Free groups of rank two are linear over `ℤ` (§5.8). -/
theorem exists_injective_freeGroup_SL :
    ∃ f : FreeGroup (Fin 2) →* Matrix.SpecialLinearGroup (Fin 2) ℤ, Function.Injective f := by
  sorry

/-- Free groups of finite rank are equationally Noetherian (§5.9). -/
theorem isEquationallyNoetherian_freeGroup (n : ℕ) :
    IsEquationallyNoetherian (FreeGroup (Fin n)) := by
  sorry

/-- Irreducibility is discrimination of the coordinate group (§5.11), for a `G`-equationally
Noetherian `G`-domain `H` (stated here with `H = G`). -/
theorem isIrreducible_iff_discriminated {X : Type*} [Finite X]
    (hG : IsEquationallyNoetherian G) (hD : IsGDomain G (MonoidHom.id G))
    (S : Set (GX G X)) (hS : (algSet (MonoidHom.id G) S).Nonempty) :
    @IsIrreducible _ (zariski (MonoidHom.id G)) (algSet (MonoidHom.id G) S) ↔
      IsDiscriminatedBy (CoordGroup (MonoidHom.id G) S) G
        ((QuotientGroup.mk' _).comp Monoid.Coprod.inl) (MonoidHom.id G) := by
  sorry

/-- The radical of `x²` over a free group is the normal closure of `x`, not of `x²` (§5.2). -/
example :
    radical (MonoidHom.id (FreeGroup (Fin 2))) {Monoid.Coprod.inr (FreeGroup.of ()) ^ 2} =
      Subgroup.normalClosure {(Monoid.Coprod.inr (FreeGroup.of ()) : GX (FreeGroup (Fin 2)) Unit)} := by
  sorry

example : IsGDomain (FreeGroup (Fin 2)) (MonoidHom.id _) := by
  sorry

example : ¬ IsGDomain (Multiplicative (Fin 2 → ℤ)) (MonoidHom.id _) := by
  sorry

end layer5

/-! ## Layer 6: surface groups and quadratic equations -/

section layer6

/-- The source commutator `x⁻¹ y⁻¹ x y`, equal to Mathlib's `⁅x⁻¹, y⁻¹⁆`. -/
def comm {G : Type*} [Group G] (x y : G) : G := x⁻¹ * y⁻¹ * x * y

/-- The orientable surface relator of genus `g` with `m` boundary elements (§6.1), with the
source commutator convention of `comm`. -/
def orientableRelator (g m : ℕ) : FreeGroup ((Fin g × Bool) ⊕ Fin m) :=
  ((List.finRange g).map fun i : Fin g =>
      comm (FreeGroup.of (Sum.inl (i, false) : (Fin g × Bool) ⊕ Fin m))
        (FreeGroup.of (Sum.inl (i, true)))).prod *
    ((List.finRange m).map fun j : Fin m =>
      FreeGroup.of (Sum.inr j : (Fin g × Bool) ⊕ Fin m)).prod

/-- The orientable surface group `S⁺(g, m)` (§6.1; the README's `SurfaceGroup.orientable`). -/
abbrev OrientableSurfaceGroup (g m : ℕ) : Type :=
  PresentedGroup {orientableRelator g m}

/-- The non-orientable surface relator `c₁² ⋯ c_g² p₁ ⋯ p_m` (§6.1). -/
def nonorientableRelator (g m : ℕ) : FreeGroup (Fin g ⊕ Fin m) :=
  ((List.finRange g).map fun i : Fin g => FreeGroup.of (Sum.inl i : Fin g ⊕ Fin m) ^ 2).prod *
    ((List.finRange m).map fun j : Fin m => FreeGroup.of (Sum.inr j : Fin g ⊕ Fin m)).prod

/-- The non-orientable surface group `S⁻(g, m)` (§6.1; the README's `SurfaceGroup.nonorientable`). -/
abbrev NonorientableSurfaceGroup (g m : ℕ) : Type :=
  PresentedGroup {nonorientableRelator g m}

/-- Euler characteristic of `S⁺(g, m)`. -/
def orientableEulerChar (g m : ℕ) : ℤ := 2 - 2 * g - m

example {G : Type*} [Group G] (x y : G) : comm x y = ⁅x⁻¹, y⁻¹⁆ := by
  sorry

example : orientableRelator 0 1 = FreeGroup.of (Sum.inr (0 : Fin 1)) := by
  sorry

example : nonorientableRelator 1 0 = FreeGroup.of (Sum.inl (0 : Fin 1)) ^ 2 := by
  sorry

example : Subsingleton (OrientableSurfaceGroup 0 1) := by
  sorry

/-- Surface groups with boundary are free (§6.2). -/
theorem isFreeGroup_orientable (g m : ℕ) (hm : 1 ≤ m) :
    IsFreeGroup (OrientableSurfaceGroup g m) := by
  sorry

/-- Closed orientable surface groups of positive genus are not free (§6.2). -/
theorem not_isFreeGroup_orientable_closed (g : ℕ) (hg : 1 ≤ g) :
    ¬ IsFreeGroup (OrientableSurfaceGroup g 0) := by
  sorry

example : Nonempty (OrientableSurfaceGroup 1 0 ≃* Multiplicative (Fin 2 → ℤ)) := by
  sorry

example : Nat.card (NonorientableSurfaceGroup 1 0) = 2 := by
  sorry

example : orientableEulerChar 2 0 = -2 := by
  sorry

/-- A conjugate of a nonidentity coefficient has no solutions (§6.5, the README's
`GroupAlgGeom.Quadratic.strict_conjugate_inconsistent`); its quadratic normalization is the
coefficient-only branch of `GroupAlgGeom.Quadratic.exists_standardForm`. -/
theorem conjugate_coeff_algSet_eq_empty {G : Type*} [Group G] (c : G) (hc : c ≠ 1) :
    algSet (MonoidHom.id G)
      {(Monoid.Coprod.inr (FreeGroup.of ()) : GX G Unit)⁻¹ * Monoid.Coprod.inl c *
        Monoid.Coprod.inr (FreeGroup.of ())} = ∅ := by
  sorry

example :
    radical (MonoidHom.id (FreeGroup (Fin 2)))
      {Monoid.Coprod.inr (FreeGroup.of false ^ 2 * FreeGroup.of true ^ 2)} =
    Subgroup.normalClosure
      {(Monoid.Coprod.inr (FreeGroup.of false * FreeGroup.of true) : GX (FreeGroup (Fin 2)) Bool)} := by
  sorry

/-- The nonabelian coefficient hypothesis in the quadratic radical theorem is necessary. -/
example :
    let r : GX (Multiplicative ℤ) (Fin 4) :=
      Monoid.Coprod.inr (comm (FreeGroup.of 0) (FreeGroup.of 1) *
        comm (FreeGroup.of 2) (FreeGroup.of 3))
    let w : GX (Multiplicative ℤ) (Fin 4) :=
      Monoid.Coprod.inr (comm (FreeGroup.of 0) (FreeGroup.of 1))
    w ∈ radical (MonoidHom.id _) {r} ∧ w ∉ Subgroup.normalClosure {r} := by
  sorry

end layer6

/-! ## Layer 7: generalised equations, equation solving, and positive formal solutions -/

section layer7

/-- Merzljakov's theorem (§7.10): if the positive `∀∃` sentence holds in `F`, witnessed by Skolem
functions in which `yᵢ` depends only on `x₁, …, xᵢ`, then it has a formal solution in `F[X]` with
the same dependence. -/
theorem merzljakov (k n : ℕ) (hn : 2 ≤ n) (S : FreeGroup ((Fin k ⊕ Fin k) ⊕ Fin n))
    (h : ∃ f : (Fin k → FreeGroup (Fin n)) → Fin k → FreeGroup (Fin n),
      (∀ (i : Fin k) (x x' : Fin k → FreeGroup (Fin n)),
          (∀ j ≤ i, x j = x' j) → f x i = f x' i) ∧
        ∀ x, FreeGroup.lift (Sum.elim (Sum.elim x (f x)) FreeGroup.of) S = 1) :
    ∃ q : Fin k → FreeGroup (Fin k ⊕ Fin n),
      (∀ i, q i ∈ Subgroup.closure
          (Set.range (fun a => FreeGroup.of (Sum.inr a)) ∪
            (fun j => FreeGroup.of (Sum.inl j)) '' {j | j ≤ i})) ∧
        FreeGroup.lift (Sum.elim (Sum.elim (fun j => FreeGroup.of (Sum.inl j)) q)
          (fun a => FreeGroup.of (Sum.inr a))) S = 1 := by
  sorry

end layer7

/-! ## Layer 8: fully residually free groups, limit groups, and NTQ towers -/

section layer8

/-- Residually free groups (§8.1). -/
def IsResiduallyFree (G : Type u) [Group G] : Prop :=
  ∀ g : G, g ≠ 1 → ∃ (F : Type u) (_ : Group F), IsFreeGroup F ∧ ∃ φ : G →* F, φ g ≠ 1

/-- Fully residually free (freely discriminated) groups (§8.1).
`LimitGroup.IsFullyResiduallyFree.of_injective` in the README transfers the finite-set
condition along an injective homomorphism. -/
def IsFullyResiduallyFree (G : Type u) [Group G] : Prop :=
  ∀ s : Finset G, (1 : G) ∉ s →
    ∃ (F : Type u) (_ : Group F), IsFreeGroup F ∧ ∃ φ : G →* F, ∀ g ∈ s, φ g ≠ 1

/-- Big powers for nonidentity tuples with noncommuting consecutive entries (§8.5a). -/
def IsBP (G : Type*) [Group G] : Prop :=
  ∀ (k : ℕ), 0 < k → ∀ u : Fin k → G,
    (∀ i, u i ≠ 1) →
    (∀ i j : Fin k, i.val + 1 = j.val → ¬ Commute (u i) (u j)) →
    ∃ N : ℕ, 1 ≤ N ∧ ∀ e : Fin k → ℕ,
      (∀ i, N ≤ e i) → ((List.finRange k).map fun i => u i ^ e i).prod ≠ 1

/-- Reduced-word cancellation bounds give big powers in free groups (§8.5a). -/
theorem isBP_freeGroup (α : Type*) : IsBP (FreeGroup α) := by
  sorry

/-- Big powers pass to a subgroup through its injective inclusion (§8.5a). -/
theorem IsBP.of_injective {K H : Type*} [Group K] [Group H]
    (hH : IsBP H) (f : K →* H) (hf : Function.Injective f) : IsBP K := by
  sorry

/-- One discriminating map preserves the tuple and its adjacent commutators (§8.5a). -/
theorem IsBP.of_discriminated {K H : Type*} [Group K] [Group H]
    (hH : IsBP H) (hKH : IsDiscriminatedBy K H (1 : Unit →* K) (1 : Unit →* H)) :
    IsBP K := by
  sorry

/-- Fully residually free groups have big powers (§8.5a). -/
theorem IsFullyResiduallyFree.isBP {G : Type*} [Group G]
    (hG : IsFullyResiduallyFree G) : IsBP G := by
  sorry

example : IsResiduallyFree (FreeGroup (Fin 2) × Multiplicative ℤ) := by
  sorry

example : ¬ IsFullyResiduallyFree (FreeGroup (Fin 2) × Multiplicative ℤ) := by
  sorry

example : IsFullyResiduallyFree (Multiplicative (Fin 3 → ℤ)) := by
  sorry

/-- The point of the Cantor space `FreeGroup (Fin n) → Bool` given by a subgroup. -/
noncomputable def markedPoint {n : ℕ} (N : Subgroup (FreeGroup (Fin n))) :
    FreeGroup (Fin n) → Bool := by
  classical
  exact fun w => decide (w ∈ N)

/-- Limit groups: some marking is a limit of markings of free groups (§8.3).
The README's `LimitGroup.IsLimitGroup.marking_independent` makes this independent of the
chosen finite generating tuple. -/
def IsLimitGroup (G : Type*) [Group G] : Prop :=
  ∃ (n : ℕ) (f : FreeGroup (Fin n) →* G), Function.Surjective f ∧
    markedPoint f.ker ∈
      closure (Set.range fun ψ : FreeGroup (Fin n) →* FreeGroup (Fin 2) => markedPoint ψ.ker)

example : IsLimitGroup (Multiplicative (Fin 2 → ℤ)) := by
  sorry

example : ¬ IsLimitGroup (Multiplicative (ZMod 2)) := by
  sorry

example (w : FreeGroup (Fin 2)) : markedPoint (⊤ : Subgroup (FreeGroup (Fin 2))) w = true := by
  sorry

example (w : FreeGroup (Fin 2)) (hw : w ≠ 1) :
    markedPoint (⊥ : Subgroup (FreeGroup (Fin 2))) w = false := by
  sorry

/-- Limit groups are the finitely generated fully residually free groups (§8.4). -/
theorem isLimitGroup_iff (G : Type) [Group G] [Group.FG G] :
    IsLimitGroup G ↔ IsFullyResiduallyFree G := by
  sorry

/-- Fully residually free groups are commutative transitive (§8.2). -/
theorem IsFullyResiduallyFree.commute_trans {G : Type u} [Group G] (hG : IsFullyResiduallyFree G)
    {a b c : G} (hb : b ≠ 1) (hab : Commute a b) (hbc : Commute b c) : Commute a c := by
  sorry

/-- The extension of the centralizer of `u` by `ℤ` (§8.5; the case `n = 1` of the README's
`LimitGroup.centralizerExt`), as an HNN extension along the identity of the centralizer. -/
abbrev CentralizerExt (G : Type*) [Group G] (u : G) : Type _ :=
  HNNExtension G (Subgroup.centralizer {u}) (Subgroup.centralizer {u}) (MulEquiv.refl _)

/-- Admissible ICE steps use a nonidentity non-proper-power and positive added rank (§8.5;
the README's `LimitGroup.IsAdmissibleCentralizerStep`). The extension uses the full centralizer. -/
def IsAdmissibleCentralizerStep {G : Type*} [Group G] (u : G) (n : ℕ) : Prop :=
  u ≠ 1 ∧ ¬ IsProperPower u ∧ 0 < n

/-- An admissible NTQ centralizer level has a finite generating set of the full abelian
centralizer and positive added rank (§8.8; `LimitGroup.NTQ.IsAdmissibleCentralizerLevel`). -/
def IsAdmissibleCentralizerLevel {G : Type*} [Group G] (u : G) (U : Finset G) (n : ℕ) : Prop :=
  IsAdmissibleCentralizerStep u n ∧
    Subgroup.closure (U : Set G) = Subgroup.centralizer {u} ∧
    IsMulCommutative (Subgroup.centralizer {u})

example : Nonempty
    (CentralizerExt (Multiplicative ℤ) (Multiplicative.ofAdd 1) ≃*
      Multiplicative (Fin 2 → ℤ)) := by
  sorry

/-- An admissible rank-one centralizer extension of a nonabelian fully residually free group
is fully residually free (§8.6). -/
theorem isFullyResiduallyFree_centralizerExt {G : Type} [Group G] (hG : IsFullyResiduallyFree G)
    (hnonabelian : ∃ a b : G, ¬ Commute a b) (u : G)
    (hadmissible : IsAdmissibleCentralizerStep u 1) :
    IsFullyResiduallyFree (CentralizerExt G u) := by
  sorry

example {G : Type*} [Group G] (n : ℕ) : ¬ IsAdmissibleCentralizerStep (1 : G) n := by
  sorry

example {G : Type*} [Group G] (u : G) : ¬ IsAdmissibleCentralizerStep u 0 := by
  sorry

example (a : Fin 2) : IsAdmissibleCentralizerStep (FreeGroup.of a) 1 := by
  sorry

/-- The unrestricted identity-centralizer extension is the direct product rejected by ICE. -/
example : Nonempty
    (CentralizerExt (FreeGroup (Fin 2)) 1 ≃* (FreeGroup (Fin 2) × Multiplicative ℤ)) := by
  sorry

example : ¬ IsFullyResiduallyFree (CentralizerExt (FreeGroup (Fin 2)) 1) := by
  sorry

/-- The consistent equations centralizing both basis letters fail NTQ admissibility. -/
example :
    ¬ IsAdmissibleCentralizerLevel (1 : FreeGroup (Fin 2))
      {FreeGroup.of 0, FreeGroup.of 1} 1 := by
  sorry

/-- For the inadmissible level, the variable belongs to the radical but not the relator
normal closure (§8.8). -/
example :
    let x : GX (FreeGroup (Fin 2)) Unit := Monoid.Coprod.inr (FreeGroup.of ())
    let a : GX (FreeGroup (Fin 2)) Unit := Monoid.Coprod.inl (FreeGroup.of 0)
    let b : GX (FreeGroup (Fin 2)) Unit := Monoid.Coprod.inl (FreeGroup.of 1)
    let S : Set (GX (FreeGroup (Fin 2)) Unit) := {comm x a, comm x b}
    x ∈ radical (MonoidHom.id (FreeGroup (Fin 2))) S ∧ x ∉ Subgroup.normalClosure S := by
  sorry

/-- Finitely generated fully residually free groups are finitely presented (§8.7). -/
theorem isFinitelyPresented_of_fullyResiduallyFree (G : Type) [Group G] [Group.FG G]
    (hG : IsFullyResiduallyFree G) : Group.IsFinitelyPresented G := by
  sorry

end layer8

/-! ## Layer 9: length functions and infinite-word representations -/

section layer9

/-- Lyndon length functions with values in an ordered abelian group `Λ` (§9.1). The Gromov
product is used doubled, `2 c(g, f) = l g + l f - l (g⁻¹ f)`, to stay inside `Λ`. The README's `LyndonLength.le_add` supplies the triangle inequality
and bounds for Gromov products; `LyndonLength.torsion_not_free` uses the nonidentity
in ℤ/2 to distinguish Lyndon length from free length, and `LyndonLength.Z2_lex`
uses ordered absolute value on lexicographically ordered ℤ². -/
structure LyndonLength (G : Type*) [Group G] (Λ : Type*) [AddCommGroup Λ] [LinearOrder Λ]
    [IsOrderedAddMonoid Λ] where
  /-- The length. -/
  l : G → Λ
  l_nonneg : ∀ g, 0 ≤ l g
  l_one : l 1 = 0
  l_inv : ∀ g, l g⁻¹ = l g
  gromov : ∀ g f h : G,
    l g + l h - l (g⁻¹ * h) < l g + l f - l (g⁻¹ * f) →
      l g + l h - l (g⁻¹ * h) = l f + l h - l (f⁻¹ * h)

namespace LyndonLength

variable {G Λ : Type*} [Group G] [AddCommGroup Λ] [LinearOrder Λ] [IsOrderedAddMonoid Λ]

/-- Free length functions: (L4) and (L5). -/
def IsFree (L : LyndonLength G Λ) : Prop :=
  (∀ g f : G, ∃ c : Λ, 2 • c = L.l g + L.l f - L.l (g⁻¹ * f)) ∧
    ∀ g : G, g ≠ 1 → L.l g < L.l (g ^ 2)

/-- Regular length functions: (L6). -/
def IsRegular (L : LyndonLength G Λ) : Prop :=
  ∀ g f : G, ∃ u g₁ f₁ : G, g = u * g₁ ∧ f = u * f₁ ∧ L.l g = L.l u + L.l g₁ ∧
    L.l f = L.l u + L.l f₁ ∧ 2 • L.l u = L.l g + L.l f - L.l (g⁻¹ * f)

example (L : LyndonLength G Λ) (hG : Subsingleton G) : L.IsFree := by
  sorry

example (L : LyndonLength G Λ) (hz : ∀ g, L.l g = 0) : L.IsRegular := by
  sorry

example (L : LyndonLength G Λ) (hz : ∀ g, L.l g = 0) (hg : ∃ g : G, g ≠ 1) :
    ¬ L.IsFree := by
  sorry

end LyndonLength

-- README `LyndonLength.freeGroup_norm`: the word-length normalization.
/-- The word length of a free group is a free regular Lyndon length function (§9.1). -/
theorem exists_lyndonLength_norm (α : Type*) [DecidableEq α] :
    ∃ L : LyndonLength (FreeGroup α) ℤ, (∀ g, L.l g = (FreeGroup.norm g : ℤ)) ∧
      L.IsFree ∧ L.IsRegular := by
  sorry

/-- Finitely generated fully residually free groups have free `ℤⁿ`-valued length functions for
the lexicographic order (§9.5). -/
theorem exists_free_lyndonLength (G : Type) [Group G] [Group.FG G]
    (hG : IsFullyResiduallyFree G) :
    ∃ (n : ℕ) (L : LyndonLength G (Lex (Fin n → ℤ))), L.IsFree := by
  sorry

example : ∃ L : LyndonLength (Multiplicative ℤ) ℤ,
    (∀ g, L.l g = 0) ∧ ¬ L.IsFree := by
  sorry

end layer9

/-! ## Layer 10: JSJ structure and finite solution diagrams

The JSJ and finite-diagram carriers are specified in README.md.
-/

/-! ## Layer 11: regular implicit-function theorems over free groups -/

section layer11

variable {G : Type*} [Group G]

/-- Compatibility of `T(X, Y) = 1` with `S(X) = 1` over `G` (§11.1). -/
def IsCompatible {X Y : Type*} (S : Set (GX G X)) (T : Set (GX G (X ⊕ Y))) : Prop :=
  ∀ v ∈ algSet (MonoidHom.id G) S, ∃ w : Y → G,
    ∀ t ∈ T, evalAt (MonoidHom.id G) (Sum.elim v w) t = 1

/-- `T` admits an `S`-lift: it has a solution in the coordinate group `G_{R(S)}` with `X`
interpreted as the generic point (§11.1). -/
def HasLift {X Y : Type*} (S : Set (GX G X)) (T : Set (GX G (X ⊕ Y))) : Prop :=
  ∃ w : Y → CoordGroup (MonoidHom.id G) S,
    ∀ t ∈ T, evalAt ((QuotientGroup.mk' _).comp Monoid.Coprod.inl)
      (Sum.elim (fun x => QuotientGroup.mk' _ (Monoid.Coprod.inr (FreeGroup.of x))) w) t = 1

/-- The genus-two surface equation `[x₁, y₁][x₂, y₂] = 1` over `F(a, b)`, a regular standard
quadratic equation. -/
def genusTwoEquation : GX (FreeGroup (Fin 2)) (Fin 4) :=
  Monoid.Coprod.inr (comm (FreeGroup.of (0 : Fin 4)) (FreeGroup.of 1) *
    comm (FreeGroup.of (2 : Fin 4)) (FreeGroup.of 3))

/-- The implicit function theorem for regular quadratic equations (§11.5), in the instance of the
genus-two equation: every compatible equation lifts to the generic point, using the
coefficient-enlargement and return to free-group specializations of §11.4. -/
theorem hasLift_genusTwo {Y : Type*} [Finite Y]
    (T : Set (GX (FreeGroup (Fin 2)) (Fin 4 ⊕ Y))) (hfinite : T.Finite)
    (hT : IsCompatible {genusTwoEquation} T) : HasLift {genusTwoEquation} T := by
  sorry

example : IsCompatible (∅ : Set (GX (FreeGroup (Fin 2)) Unit))
    {Monoid.Coprod.inr (FreeGroup.of (Sum.inr ()) * (FreeGroup.of (Sum.inl ()))⁻¹)} := by
  sorry

example : HasLift (∅ : Set (GX (FreeGroup (Fin 2)) Unit))
    {Monoid.Coprod.inr (FreeGroup.of (Sum.inr ()) * (FreeGroup.of (Sum.inl ()))⁻¹)} := by
  sorry

example : ¬ IsCompatible (∅ : Set (GX (FreeGroup (Fin 2)) Unit))
    {Monoid.Coprod.inr (FreeGroup.of (Sum.inr ()) ^ 2 * (FreeGroup.of (Sum.inl ()))⁻¹)} := by
  sorry

example : genusTwoEquation ∈ radical (MonoidHom.id (FreeGroup (Fin 2)))
    {genusTwoEquation} := by
  sorry

example : ∃ v : Fin 4 → FreeGroup (Fin 2),
    evalAt (MonoidHom.id _) v genusTwoEquation = 1 ∧ v 0 ≠ 1 := by
  sorry

end layer11

/-! ## Boundary examples on the existing carriers -/

section checks

example : IsProperPower (1 : FreeGroup (Fin 2)) := by sorry
example : IsPrimitive (FreeGroup.of (0 : Fin 2) * FreeGroup.of 1) := by sorry
example : ¬ IsPrimitive (1 : FreeGroup (Fin 2)) := by sorry
example (a : Fin 2) : ¬ IsPrimitive (FreeGroup.of a ^ 2) := by sorry
example : IsCSA Unit := by sorry
example {G : Type*} [Group G] (hG : IsCSA G) (h : ∃ a b : G, ¬ Commute a b) :
    Subgroup.center G = ⊥ := by sorry

-- Maximal-root pairs and the identity boundary (§1.4).
example :
    let r : FreeGroup (Fin 2) := FreeGroup.of 0 * FreeGroup.of 1
    r ^ 2 ≠ 1 ∧ ¬ IsProperPower r ∧
      ∀ s : FreeGroup (Fin 2), ∀ k : ℕ, 1 ≤ k → s ^ k = r ^ 2 →
        ¬ IsProperPower s → s = r ∧ k = 2 := by sorry
example :
    let a : FreeGroup (Fin 2) := FreeGroup.of 0
    let b : FreeGroup (Fin 2) := FreeGroup.of 1
    ¬ IsProperPower (b * a * b⁻¹) ∧ (b * a * b⁻¹) ^ 2 = b * a ^ 2 * b⁻¹ := by sorry
example :
    let r : FreeGroup (Fin 2) := comm (FreeGroup.of 0) (FreeGroup.of 1)
    r ≠ 1 ∧ ¬ IsProperPower r ∧
      ∀ s : FreeGroup (Fin 2), ∀ k : ℕ, 1 ≤ k → s ^ k = r →
        ¬ IsProperPower s → s = r ∧ k = 1 := by sorry
example (y : FreeGroup (Fin 2)) (n : ℕ) (hn : 1 ≤ n) :
    let r : FreeGroup (Fin 2) := FreeGroup.of 0 * FreeGroup.of 1
    y ^ n = r ^ 6 ↔ n ∣ 6 ∧ y = r ^ (6 / n) := by sorry
example : ¬ ∃ r : FreeGroup (Fin 2), ∃ k : ℕ,
    1 ≤ k ∧ r ^ k = 1 ∧ ¬ IsProperPower r := by sorry

-- Actual finite Serre graphs (§2.1).
example :
    let Γ : SerreGraph Bool Bool :=
      { src := id, rev := Bool.not, rev_rev := by sorry, rev_ne := by sorry }
    Γ.IsTree := by sorry
example :
    let Γ : SerreGraph Bool (Bool × Bool) :=
      { src := fun e => e.2, rev := fun e => (e.1, !e.2),
        rev_rev := by sorry, rev_ne := by sorry }
    ¬ Γ.IsTree := by sorry
example :
    let Γ : SerreGraph Empty Empty :=
      { src := id, rev := id, rev_rev := by sorry, rev_ne := by sorry }
    ¬ Γ.IsTree := by sorry

-- Labelled roses, trees, unfolded paths and distinct cycle basepoints (§2.3).
example :
    let Γ : LabelledGraph (Fin 2) Unit (Fin 2 × Bool) :=
      { src := fun _ => (), rev := fun e => (e.1, !e.2),
        rev_rev := by sorry, rev_ne := by sorry, label := id, label_rev := by sorry }
    Γ.IsFolded ∧ Γ.accepted () = ⊤ := by sorry
example :
    let Γ : LabelledGraph (Fin 2) Bool Bool :=
      { src := id, rev := Bool.not, rev_rev := by sorry, rev_ne := by sorry,
        label := fun e => (0, e), label_rev := by sorry }
    Γ.accepted false = ⊥ ∧ Γ.accepted true = ⊥ := by sorry
example :
    let Γ : LabelledGraph (Fin 2) Unit (Bool × Bool) :=
      { src := fun _ => (), rev := fun e => (e.1, !e.2),
        rev_rev := by sorry, rev_ne := by sorry,
        label := fun e => (0, e.2), label_rev := by sorry }
    Γ.toSerreGraph.IsPath () [(false, true), (true, false)] () ∧
      Γ.toSerreGraph.IsReducedPath [(false, true), (true, false)] ∧
      ¬ FreeGroup.IsReduced ([(false, true), (true, false)].map Γ.label) := by sorry
example :
    let Γ : LabelledGraph (Fin 2) Bool (Bool × Bool) :=
      { src := fun e => if e.2 then e.1 else !e.1,
        rev := fun e => (e.1, !e.2), rev_rev := by sorry, rev_ne := by sorry,
        label := fun e => (if e.1 then 1 else 0, e.2), label_rev := by sorry }
    Γ.accepted false = Subgroup.zpowers (FreeGroup.of 0 * FreeGroup.of 1) ∧
      Γ.accepted true = Subgroup.zpowers (FreeGroup.of 1 * FreeGroup.of 0) ∧
      Γ.accepted false ≠ Γ.accepted true := by sorry

-- The unfolded product fails the equality of §2.9.
example :
    let Γ : LabelledGraph (Fin 2) Unit Bool :=
      { src := fun _ => (), rev := Bool.not, rev_rev := by sorry, rev_ne := by sorry,
        label := fun e => (0, e), label_rev := by sorry }
    let Δ : LabelledGraph (Fin 2) (Fin 3) (Fin 3 × Bool) :=
      { src := fun e => if e.2 then e.1 else e.1 + 1,
        rev := fun e => (e.1, !e.2), rev_rev := by sorry, rev_ne := by sorry,
        label := fun e => (if e.1 = 0 then 0 else 1, if e.1 = 2 then !e.2 else e.2),
        label_rev := by sorry }
    Γ.accepted () = Subgroup.zpowers (FreeGroup.of 0) ∧
      Δ.accepted 0 = Subgroup.zpowers (FreeGroup.of 0) ∧
      (Γ.prod Δ).accepted ((), 0) = ⊥ ∧ ¬ Δ.IsFolded := by sorry

-- Subgroup ranks, membership, intersection and index (§§2.8–2.9).
example :
    let a : FreeGroup (Fin 3) := FreeGroup.of 0
    let b : FreeGroup (Fin 3) := FreeGroup.of 1
    let c : FreeGroup (Fin 3) := FreeGroup.of 2
    let generators : Finset (FreeGroup (Fin 3)) := {a * b, a * c}
    let H := Subgroup.closure (generators : Set (FreeGroup (Fin 3)))
    letI : Group.FG H := Group.closure_finset_fg generators
    Group.rank H = 2 := by sorry
example :
    let H := Subgroup.closure (↑(∅ : Finset (FreeGroup (Fin 2))) : Set (FreeGroup (Fin 2)))
    letI : Group.FG H := Group.closure_finset_fg ∅
    H = ⊥ ∧ Group.rank H = 0 := by sorry
example :
    let a : FreeGroup (Fin 2) := FreeGroup.of 0
    let generators : Finset (FreeGroup (Fin 2)) := {a ^ 2, a ^ 3}
    let H := Subgroup.closure (generators : Set (FreeGroup (Fin 2)))
    letI : Group.FG H := Group.closure_finset_fg generators
    Group.rank H = 1 := by sorry
example :
    let a : FreeGroup (Fin 3) := FreeGroup.of 0
    let b : FreeGroup (Fin 3) := FreeGroup.of 1
    let c : FreeGroup (Fin 3) := FreeGroup.of 2
    b⁻¹ * c ∈ Subgroup.closure {a * b, a * c} := by sorry
example {α : Type*} (a b : α) (hab : a ≠ b) :
    FreeGroup.of b * FreeGroup.of a ∉ Subgroup.zpowers (FreeGroup.of a * FreeGroup.of b) := by sorry
example :
    let a : FreeGroup (Fin 2) := FreeGroup.of 0
    Subgroup.zpowers (a ^ 2) ⊓ Subgroup.zpowers (a ^ 3) = Subgroup.zpowers (a ^ 6) := by sorry
example :
    let a : FreeGroup (Fin 2) := FreeGroup.of 0
    let b : FreeGroup (Fin 2) := FreeGroup.of 1
    let H := Subgroup.closure {a, b * a * b⁻¹}
    ¬ H.FiniteIndex ∧ H.index = 0 := by sorry

-- Formula semantics and term syntax (§§3.1–3.2).
example :
    let t : groupLang.Term (Fin 2) := .func .mul ![.var 0, .var 1]
    let u : groupLang.Term (Fin 2) := .func .mul ![.var 1, .var 0]
    ¬ (t.equal u).Realize (FreeGroup.of : Fin 2 → FreeGroup (Fin 2)) := by sorry
example :
    let t : groupLang.Term (Fin 2) := .func .mul ![.var 0, .var 1]
    let u : groupLang.Term (Fin 2) := .func .mul ![.var 1, .var 0]
    (t.equal u).Realize (fun i => Multiplicative.ofAdd (Pi.single i (1 : ℤ))) := by sorry
example (t u : groupLang.Term Empty) :
    (t.equal u).Realize (fun e => (Empty.elim e : Unit)) := by sorry
example {G : Type*} [Group G] (x y z : G) :
    GroupFunc.eval .mul ![GroupFunc.eval .mul ![x,y],z] =
      GroupFunc.eval .mul ![x,GroupFunc.eval .mul ![y,z]] ∧
    GroupFunc.eval .mul ![GroupFunc.eval .one ![],x] = x ∧
    GroupFunc.eval .mul ![x,GroupFunc.eval .one ![]] = x ∧
    GroupFunc.eval .mul ![GroupFunc.eval .inv ![x],x] = GroupFunc.eval .one ![] := by sorry
example :
    let t : groupLang.Term (Unit ⊕ Unit) :=
      .func .mul ![.func .inv ![.var (.inr ())],
        .func .mul ![.var (.inl ()), .var (.inr ())]]
    termToWord t = (FreeGroup.of (Sum.inr ()))⁻¹ * FreeGroup.of (Sum.inl ()) *
      FreeGroup.of (Sum.inr ()) := by sorry
example :
    let t : groupLang.Term Unit := .func .mul ![.var (), .func .inv ![.var ()]]
    let one : groupLang.Term Unit := .func .one ![]
    termToWord t = termToWord one ∧ t ≠ one := by sorry

example {G : Type*} [Group G] : FirstOrder.Language.Theory.Model G groupTheory := by sorry
example :
    let t : groupLang.Term Unit := .func .mul ![.var (), .func .inv ![.var ()]]
    let one : groupLang.Term Unit := .func .one ![]
    wordToTerm (termToWord t) = one ∧ one ≠ t := by sorry
example :
    letI := FirstOrder.Language.constantsOn.structure
      (FreeGroup.of : Fin 2 → FreeGroup (Fin 2))
    let a : (groupLang.withConstants (Fin 2)).Term Empty := (groupLang.con (0 : Fin 2)).term
    let b : (groupLang.withConstants (Fin 2)).Term Empty := (groupLang.con (1 : Fin 2)).term
    let t := FirstOrder.Language.Term.func (Sum.inl GroupFunc.mul) ![a,b]
    let u := FirstOrder.Language.Term.func (Sum.inl GroupFunc.mul) ![b,a]
    ¬ FirstOrder.Language.Sentence.Realize (FreeGroup (Fin 2)) (t.equal u) := by sorry
example :
    letI := FirstOrder.Language.constantsOn.structure
      (fun i : Fin 2 => Multiplicative.ofAdd (Pi.single i (1 : ℤ)))
    let a : (groupLang.withConstants (Fin 2)).Term Empty := (groupLang.con (0 : Fin 2)).term
    let b : (groupLang.withConstants (Fin 2)).Term Empty := (groupLang.con (1 : Fin 2)).term
    let t := FirstOrder.Language.Term.func (Sum.inl GroupFunc.mul) ![a,b]
    let u := FirstOrder.Language.Term.func (Sum.inl GroupFunc.mul) ![b,a]
    FirstOrder.Language.Sentence.Realize (Multiplicative (Fin 2 → ℤ)) (t.equal u) := by sorry

-- Evaluation, coefficient-free products, radicals and changes of target (§§5.1–5.2).
example :
    let x : GX (FreeGroup (Fin 2)) Unit := Monoid.Coprod.inr (FreeGroup.of ())
    let a : GX (FreeGroup (Fin 2)) Unit := Monoid.Coprod.inl (FreeGroup.of 0)
    let b : GX (FreeGroup (Fin 2)) Unit := Monoid.Coprod.inl (FreeGroup.of 1)
    evalAt (MonoidHom.id _) (fun _ => FreeGroup.of 0 ^ 2) (comm x a) = 1 ∧
      evalAt (MonoidHom.id _) (fun _ => FreeGroup.of 0 ^ 2) (comm x b) ≠ 1 := by sorry
example : Nonempty (GX Unit (Fin 2) ≃* FreeGroup (Fin 2)) := by sorry
example :
    ¬ Commute (Monoid.Coprod.inl (FreeGroup.of (0 : Fin 2)) : GX (FreeGroup (Fin 2)) Unit)
      (Monoid.Coprod.inr (FreeGroup.of ())) := by sorry
example : radical (MonoidHom.id (FreeGroup (Fin 2)))
    (∅ : Set (GX (FreeGroup (Fin 2)) Unit)) = ⊥ := by sorry
example :
    let x : GX (FreeGroup (Fin 2)) Unit := Monoid.Coprod.inr (FreeGroup.of ())
    let a : GX (FreeGroup (Fin 2)) Unit := Monoid.Coprod.inl (FreeGroup.of 0)
    algSet (MonoidHom.id _) {comm x a} =
      {v | v () ∈ Subgroup.zpowers (FreeGroup.of 0)} := by sorry
example : radical (MonoidHom.id (Multiplicative ℤ))
    {(Monoid.Coprod.inr (FreeGroup.of ()) : GX (Multiplicative ℤ) Unit) ^ 2} =
      Subgroup.normalClosure {(Monoid.Coprod.inr (FreeGroup.of ()) : GX (Multiplicative ℤ) Unit)} := by sorry
example :
    let x : GX (Multiplicative (ZMod 2)) Unit := Monoid.Coprod.inr (FreeGroup.of ())
    algSet (MonoidHom.id _) {x ^ 2} = Set.univ ∧
      radical (MonoidHom.id _) {x ^ 2} = idealOf (MonoidHom.id _) Set.univ := by sorry
example :
    let ι : FreeGroup (Fin 2) →* FreeGroup (Fin 2) × Multiplicative (ZMod 2) :=
      (MonoidHom.id _).prod (1 : FreeGroup (Fin 2) →* Multiplicative (ZMod 2))
    let x : GX (FreeGroup (Fin 2)) Unit := Monoid.Coprod.inr (FreeGroup.of ())
    x ∉ radical ι {x ^ 2} ∧ x ∈ radical (MonoidHom.id _) {x ^ 2} := by sorry

-- Reducible kernel radicals acquire mixed relations on adjoining a free item (§7.4).
example :
    let F := FreeGroup (Fin 2)
    let a : GX F (Fin 3) := Monoid.Coprod.inl (FreeGroup.of 0)
    let b : GX F (Fin 3) := Monoid.Coprod.inl (FreeGroup.of 1)
    let x : GX F (Fin 3) := Monoid.Coprod.inr (FreeGroup.of 0)
    let y : GX F (Fin 3) := Monoid.Coprod.inr (FreeGroup.of 1)
    let z : GX F (Fin 3) := Monoid.Coprod.inr (FreeGroup.of 2)
    let S : Set (GX F (Fin 3)) := {comm x a, comm y b, comm x y}
    comm x (z * y * z⁻¹) ∈ radical (MonoidHom.id F) S ∧
      comm x (z * y * z⁻¹) ∉ Subgroup.normalClosure S := by sorry
example :
    let F := FreeGroup (Fin 2)
    let a : GX F Bool := Monoid.Coprod.inl (FreeGroup.of 0)
    let b : GX F Bool := Monoid.Coprod.inl (FreeGroup.of 1)
    let x : GX F Bool := Monoid.Coprod.inr (FreeGroup.of false)
    let y : GX F Bool := Monoid.Coprod.inr (FreeGroup.of true)
    let S : Set (GX F Bool) := {comm x a, comm y b, comm x y}
    let K := CoordGroup (MonoidHom.id F) S
    let q : GX F Bool →* K := QuotientGroup.mk' _
    let xK : Monoid.Coprod K (FreeGroup Unit) := Monoid.Coprod.inl (q x)
    let yK : Monoid.Coprod K (FreeGroup Unit) := Monoid.Coprod.inl (q y)
    let z : Monoid.Coprod K (FreeGroup Unit) := Monoid.Coprod.inr (FreeGroup.of ())
    q x ≠ 1 ∧ q y ≠ 1 ∧ comm xK (z * yK * z⁻¹) ≠ 1 := by sorry

-- Separation differs from discrimination (§5.3).
example : IsSeparatedBy (FreeGroup (Fin 2) × FreeGroup (Fin 2)) (FreeGroup (Fin 2))
    (1 : Unit →* _) (1 : Unit →* _) ∧
    ¬ IsDiscriminatedBy (FreeGroup (Fin 2) × FreeGroup (Fin 2)) (FreeGroup (Fin 2))
      (1 : Unit →* _) (1 : Unit →* _) := by sorry
example : ¬ IsSeparatedBy (Multiplicative (ZMod 2)) (Multiplicative ℤ)
    (1 : Unit →* _) (1 : Unit →* _) := by sorry
example {G : Type} [Group G] : IsFullyResiduallyFree G ↔
    IsDiscriminatedBy G (FreeGroup (Fin 2)) (1 : Unit →* _) (1 : Unit →* _) := by sorry
example : IsGDomain (Multiplicative (Fin 0 → ℤ)) (MonoidHom.id _) := by sorry
example : ¬ IsGDomain (FreeGroup (Fin 2) × FreeGroup (Fin 2)) (MonoidHom.id _) := by sorry

-- Zariski boundaries and zero-variable systems (§§5.6–5.7).
example :
    let Y : Set (Unit → FreeGroup (Fin 2)) :=
      {v | v () ∈ Subgroup.zpowers (FreeGroup.of 0) ∨
        v () ∈ Subgroup.zpowers (FreeGroup.of 1)}
    ∃ S : Set (GX (FreeGroup (Fin 2)) Unit), algSet (MonoidHom.id _) S = Y := by sorry
example : @DiscreteTopology (Unit → Multiplicative (ZMod 2))
    (zariski (MonoidHom.id (Multiplicative (ZMod 2)))) := by sorry
example :
    let Y : Set (Unit → Multiplicative ℤ) := {fun _ => Multiplicative.ofAdd 0,
      fun _ => Multiplicative.ofAdd 1}
    @IsClosed _ (zariski (MonoidHom.id (Multiplicative ℤ))) Y ∧
      ¬ ∃ S : Set (GX (Multiplicative ℤ) Unit), algSet (MonoidHom.id _) S = Y := by sorry
example : @closure _ (zariski (1 : Unit →* FreeGroup (Fin 2)))
    {fun _ : Unit => FreeGroup.of (0 : Fin 2)} = Set.univ := by sorry
example :
    IsGDomain Unit (MonoidHom.id Unit) ∧
      (∀ S : Set (GX Unit Unit), algSet (MonoidHom.id Unit) S = Set.univ) ∧
      @closure _ (zariski (MonoidHom.id Unit)) (∅ : Set (Unit → Unit)) = ∅ ∧
      algSet (MonoidHom.id Unit)
        (idealOf (MonoidHom.id Unit) (∅ : Set (Unit → Unit)) : Set (GX Unit Unit)) = Set.univ ∧
      @closure _ (zariski (MonoidHom.id Unit)) (∅ : Set (Unit → Unit)) ≠
        algSet (MonoidHom.id Unit)
          (idealOf (MonoidHom.id Unit) (∅ : Set (Unit → Unit)) : Set (GX Unit Unit)) := by sorry
example :
    let a : GX (FreeGroup (Fin 2)) Unit := Monoid.Coprod.inl (FreeGroup.of 0)
    let b : GX (FreeGroup (Fin 2)) Unit := Monoid.Coprod.inl (FreeGroup.of 1)
    let x : GX (FreeGroup (Fin 2)) Unit := Monoid.Coprod.inr (FreeGroup.of ())
    let S : Set (GX (FreeGroup (Fin 2)) Unit) := {a, b, x}
    algSet (MonoidHom.id _) S = ∅ ∧ radical (MonoidHom.id _) S = ⊤ ∧
      Subgroup.normalClosure S = ⊤ ∧
      ¬ Function.Injective ((QuotientGroup.mk' (Subgroup.normalClosure S)).comp
        (Monoid.Coprod.inl : FreeGroup (Fin 2) →* GX (FreeGroup (Fin 2)) Unit)) := by sorry

example : IsEquationallyNoetherian (Multiplicative (ZMod 2)) := by sorry
example {G : Type*} [Group G] (S : Set (GX G Empty))
    (hS : (algSet (MonoidHom.id G) S).Nonempty) :
    algSet (MonoidHom.id G) S = algSet (MonoidHom.id G) (∅ : Set (GX G Empty)) := by sorry
example {G : Type*} [Group G] (S : Set (GX G Empty))
    (hS : algSet (MonoidHom.id G) S = ∅) :
    ∃ s ∈ S, algSet (MonoidHom.id G) {s} = ∅ := by sorry
example :
    let R : Subgroup (ℕ → FreeGroup (Fin 2)) :=
      { carrier := {f | {n | f n ≠ 1}.Finite}, one_mem' := by sorry,
        mul_mem' := by sorry, inv_mem' := by sorry }
    let a : ℕ → R := fun n => ⟨fun k => if k = n then FreeGroup.of 0 else 1, by sorry⟩
    let S : Set (GX R Unit) := Set.range fun n =>
      comm (Monoid.Coprod.inr (FreeGroup.of ())) (Monoid.Coprod.inl (a n))
    ¬ IsEquationallyNoetherian R ∧ ∀ S₀ ⊆ S, S₀.Finite →
      algSet (MonoidHom.id R) S₀ ≠ algSet (MonoidHom.id R) S := by sorry

-- Surface presentations and fully residual freeness (§§6.1,8.1).
example : Subsingleton (OrientableSurfaceGroup 0 0) := by sorry
example : Nonempty (OrientableSurfaceGroup 0 3 ≃* FreeGroup (Fin 2)) := by sorry
example : Nonempty (Abelianization (NonorientableSurfaceGroup 2 0) ≃*
    (Multiplicative ℤ × Multiplicative (ZMod 2))) ∧
    ¬ Nonempty (NonorientableSurfaceGroup 2 0 ≃* OrientableSurfaceGroup 1 0) := by sorry
example : IsFullyResiduallyFree (Multiplicative (Fin 0 → ℤ)) := by sorry
example : ¬ IsResiduallyFree (Multiplicative (ZMod 2)) := by sorry
example : IsFullyResiduallyFree (OrientableSurfaceGroup 2 0) := by sorry
example : ¬ IsResiduallyFree (NonorientableSurfaceGroup 3 0) := by sorry
example (n : ℕ) : IsLimitGroup (FreeGroup (Fin n)) := by sorry

-- Actual cyclic markings converge to the abelian rank-two marking (§8.3).
example :
    let ψ : ℕ → FreeGroup (Fin 2) →* Multiplicative ℤ := fun k =>
      FreeGroup.lift (fun i => Multiplicative.ofAdd (if i = 0 then 1 else (k : ℤ)))
    let π : FreeGroup (Fin 2) →* Multiplicative (Fin 2 → ℤ) :=
      FreeGroup.lift (fun i => Multiplicative.ofAdd (Pi.single i 1))
    Filter.Tendsto (fun k => markedPoint (ψ k).ker) Filter.atTop
      (nhds (markedPoint π.ker)) := by sorry

-- Big-power premises and their boundary cases (§8.5a).
example : IsBP Unit := by sorry
example : ¬ IsBP (Multiplicative (ZMod 2)) := by sorry
example (p q : ℕ) (hp : 1 ≤ p) (hq : 1 ≤ q) :
    FreeGroup.of (0 : Fin 2) ^ p * FreeGroup.of 1 ^ q ≠ 1 := by sorry
example :
    let u : Fin 2 → FreeGroup (Fin 2) := fun i => FreeGroup.of i
    (∀ i, u i ≠ 1) ∧
      (∀ i j : Fin 2, i.val + 1 = j.val → ¬ Commute (u i) (u j)) := by sorry
example (p : ℕ) :
    let a : FreeGroup (Fin 2) := FreeGroup.of 0
    let u : Fin 2 → FreeGroup (Fin 2) := ![a, a⁻¹]
    (∀ i, u i ≠ 1) ∧
      (∀ i j : Fin 2, i.val + 1 = j.val → Commute (u i) (u j)) ∧
      ((List.finRange 2).map fun i => u i ^ p).prod = 1 := by sorry
example :
    let u : Fin 1 → FreeGroup (Fin 2) := fun _ => 1
    ¬ (∀ i, u i ≠ 1) := by sorry

-- The proper-power subgroup extension is not the full-centralizer extension (§§1.7,8.5).
example :
    let a : FreeGroup (Fin 2) := FreeGroup.of 0
    let A := Subgroup.zpowers (a ^ 2)
    let K := HNNExtension (FreeGroup (Fin 2)) A A (MulEquiv.refl A)
    Commute (HNNExtension.of (a ^ 2) : K) HNNExtension.t ∧
      ¬ Commute (HNNExtension.of a : K) HNNExtension.t ∧ ¬ IsCSA K := by sorry
example : Nonempty (CentralizerExt (FreeGroup (Fin 2)) (FreeGroup.of 0) ≃*
    PresentedGroup {comm (FreeGroup.of (0 : Fin 3)) (FreeGroup.of 2)}) := by sorry

/-- The conjugacy radical uses all elements of the coefficient centralizer (§6.8). -/
theorem radical_conjugacy_eq {G : Type} [Group G] (hG : IsFullyResiduallyFree G)
    (hNA : ∃ a b : G, ¬ Commute a b) (c d b : G) (hc : c ≠ 1) (hd : d ≠ 1)
    (hb : d⁻¹ = b⁻¹ * c * b) :
    let z : GX G Unit := Monoid.Coprod.inr (FreeGroup.of ())
    radical (MonoidHom.id G) {z⁻¹ * Monoid.Coprod.inl c * z * Monoid.Coprod.inl d} =
      Subgroup.normalClosure {w | ∃ h : G, h ∈ Subgroup.centralizer {c} ∧
        w = comm (z * Monoid.Coprod.inl b⁻¹) (Monoid.Coprod.inl h)} := by sorry
example :
    let z : GX (FreeGroup (Fin 2)) Unit := Monoid.Coprod.inr (FreeGroup.of ())
    let a : GX (FreeGroup (Fin 2)) Unit := Monoid.Coprod.inl (FreeGroup.of 0)
    comm z a ∈ radical (MonoidHom.id _) {z⁻¹ * a ^ 2 * z * a ^ (-2 : ℤ)} ∧
      comm z a ∉ Subgroup.normalClosure {comm z (a ^ 2)} := by sorry

-- Actual length fields distinguish torsion and ordered abelian examples (§9.1).
example :
    let L : LyndonLength (Multiplicative (ZMod 2)) ℤ :=
      { l := fun g => if g = 1 then 0 else 1,
        l_nonneg := by sorry, l_one := by sorry, l_inv := by sorry, gromov := by sorry }
    ¬ L.IsFree := by sorry
example :
    let L : LyndonLength (Multiplicative (Lex (Fin 2 → ℤ))) (Lex (Fin 2 → ℤ)) :=
      { l := fun g => |g.toAdd|,
        l_nonneg := by sorry, l_one := by sorry, l_inv := by sorry, gromov := by sorry }
    L.IsFree ∧ L.IsRegular := by sorry
example :
    let L : LyndonLength (Multiplicative ℤ) (Lex (Fin 3 → ℤ)) :=
      { l := fun g => toLex ![0, 0, |g.toAdd|],
        l_nonneg := by sorry, l_one := by sorry, l_inv := by sorry, gromov := by sorry }
    L.IsFree ∧ L.IsRegular := by sorry

-- The square lift and the compatible disjunction without a lift (§11.1).
example : IsCompatible (∅ : Set (GX (FreeGroup (Fin 2)) Unit))
    {Monoid.Coprod.inr (FreeGroup.of (Sum.inr ()) ^ 2 * (FreeGroup.of (Sum.inl ())) ^ (-2 : ℤ))} := by sorry
example : HasLift (∅ : Set (GX (FreeGroup (Fin 2)) Unit))
    {Monoid.Coprod.inr (FreeGroup.of (Sum.inr ()) ^ 2 * (FreeGroup.of (Sum.inl ())) ^ (-2 : ℤ))} := by sorry
example :
    let F := FreeGroup (Fin 2)
    let x : GX F Bool := Monoid.Coprod.inr (FreeGroup.of false)
    let y : GX F Bool := Monoid.Coprod.inr (FreeGroup.of true)
    let S : Set (GX F Bool) := {comm x y}
    (∀ v ∈ algSet (MonoidHom.id F) S, ∃ z : F,
      v false = z ^ 2 ∨ v true = z ^ 2 ∨ v false * v true = z ^ 2) ∧
    ¬ (∃ z : CoordGroup (MonoidHom.id F) S,
      QuotientGroup.mk' _ x = z ^ 2 ∨ QuotientGroup.mk' _ y = z ^ 2 ∨
        QuotientGroup.mk' _ (x * y) = z ^ 2) := by sorry

end checks

/-
Further README targets: `GGroup` and `GHom` with injective coefficient embeddings; the
Stallings folds, cores, `basisWords` and the Stallings
correspondence; `Term.ofWord`; `GraphOfGroups`, its paths,
fundamental groups, Bass–Serre trees, `GTree`, the structure theorem,
induced splittings, Kurosh's theorem and Dehn twists of amalgams; surface QH vertices with
trivial fiber; `SurfaceModel`, `vertexLink`, `boundary`, `Move`, `faceGroup`,
`EssentialCurve` and `ProperArc`, with the combinatorial contracts of §§6.0a–6.0d; `SurfaceGroup.modelEquiv` with peripheral comparison; generalised
equations, finite cancellation families, elementary transformation relations with separate
presentation-group kernel reconstruction and full radical transport, parameter solution trees, cut equations and Makanin's
finiteness theorem; recursive truth sets for the existential, universal and positive fragments; quadratic and strictly quadratic words, standard quadratic forms, atoms, degeneracy,
general position, `kappa` and quadratic regularity. In particular the README's
`GroupAlgGeom.Quadratic.IsRegular.of_genus` concerns consistent orientable equations of
positive genus other than [x,y]=1; `MarkedGroup` and its compactness;
`NTQ.System`, its level groups, nondegeneracy and regularity;
`LimitGroup.centralizerExt_root_reduction`; infinite words, `F^{ℤ[t]}` as
`LimitGroup.lyndonCompletion` with its ICE comparison, and
graphs labelled by infinite words; Λ-metric spaces, Λ-trees and free actions on them; JSJ trees and their existence, finite marked Grushko and JSJ graphs, Makanin–Razborov
factorization diagrams and finite component systems, equations over limit groups; `HasCompleteLift`,
`IsGenericFamily`, `basicSeq` and its powers; the implicit function theorem for regular NTQ
systems.

The Serre/underlying-graph comparison includes `SerreGraph.toGraph`, `SerreGraph.ofGraph`
and `SerreGraph.reachable_toGraph`, using §2.1a's `Graph.Walk`, `Graph.Reachable`,
`Graph.Connected` and `Graph.component`; the Bass–Serre quotient is the base component.
`GraphOfGroups.dehnTwistAmalgam_eq_refl_iff` is the central-in-the-right-factor identity
criterion, alongside the HNN criterion above.
-/

end TauCetiRoadmap.FreeGroupsAndLimitGroups

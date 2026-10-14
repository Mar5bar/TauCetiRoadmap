import Mathlib
import TauCeti.Topology.Algebra.Group.Generation
import TauCeti.Algebra.Lie.GeneralLinear.Basic

/-!
# GlobalGaloisDeformations: representative target signatures

The roadmap is `README.md`. This file records the light definitions whose carriers exist at the
pinned Mathlib and Tau Ceti, a few theorem signatures statable against them, and discriminating
`example`s; it is not exhaustive. Universal rings, local deformation problems, global deformation
types, Taylor–Wiles data and the finite-level patching systems need the coefficient categories and
arithmetic suppliers named in the README, and are specified there only.

Design choices made explicit here:
* a lift is unbundled: a commutative topological ring `A` with a ring map `π : A →+* k`; theorems
  that need an actual coefficient object add locality and `RingHom.ker π = maximalIdeal A`;
* continuity of a lift means continuity of its matrix entries;
* strict equivalence is the orbit relation of the kernel `strictKernel` of reduction, acting by
  conjugation;
* fixed determinant is the pointwise equation `det ρ(g) = χ(g)`, never a residual congruence;
* the framed quotient `UnrestrictedTFramedDef` imposes neither local conditions, nor ramification,
  nor determinant: it is the quotient on which a global type is imposed, not the type-`𝒮` functor.
-/

namespace TauCetiRoadmap.GlobalGaloisDeformations

open Matrix

/-! ## Layer R04.1: Deformation functors -/

section Lifts

variable {G : Type*} [Group G] [TopologicalSpace G]
variable {k : Type*} [Field k]
variable (n : ℕ) (ρbar : G →* GL (Fin n) k)
variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* k)

/-- `Γ̂ₙ(A)`: invertible matrices reducing to the identity under `π`. -/
def strictKernel : Subgroup (GL (Fin n) A) :=
  (Matrix.GeneralLinearGroup.map (n := Fin n) π).ker

/-- A lift of `ρ̄` to `(A, π)`: a homomorphism `G → GLₙ(A)` with continuous matrix entries whose
reduction is `ρ̄` (README 1.1). -/
@[ext]
structure Lift where
  /-- The underlying homomorphism. -/
  toHom : G →* GL (Fin n) A
  /-- Continuity of the matrix entries. -/
  continuous : Continuous fun g ↦ (toHom g : Matrix (Fin n) (Fin n) A)
  /-- The reduction is `ρ̄`. -/
  reduce : (Matrix.GeneralLinearGroup.map π).comp toHom = ρbar

/-- Strict conjugation of a lift by an element of `Γ̂ₙ(A)`. -/
def Lift.conj (a : strictKernel n π) (ρ : Lift n ρbar π) : Lift n ρbar π where
  toHom := (MulAut.conj (a : GL (Fin n) A)).toMonoidHom.comp ρ.toHom
  continuous := by
    have h : (fun g ↦ (((MulAut.conj (a : GL (Fin n) A)).toMonoidHom.comp ρ.toHom g :
        GL (Fin n) A) : Matrix (Fin n) (Fin n) A)) = fun g ↦
        ((a : GL (Fin n) A) : Matrix (Fin n) (Fin n) A) * (ρ.toHom g : Matrix (Fin n) (Fin n) A) *
          (((a : GL (Fin n) A)⁻¹ : GL (Fin n) A) : Matrix (Fin n) (Fin n) A) := by
      funext g
      simp [MulAut.conj_apply]
    rw [h]
    exact (continuous_const.matrix_mul ρ.continuous).matrix_mul continuous_const
  reduce := by
    have ha : Matrix.GeneralLinearGroup.map π (a : GL (Fin n) A) = 1 := a.2
    refine Eq.trans ?_ ρ.reduce
    ext g : 1
    simp [MulAut.conj_apply, ha]

/-- Strict conjugation acts by the stated matrix conjugation. -/
theorem Lift.conj_apply (a : strictKernel n π) (ρ : Lift n ρbar π) (g : G) :
    (ρ.conj n ρbar π a).toHom g = (a : GL (Fin n) A) * ρ.toHom g * (a : GL (Fin n) A)⁻¹ := by
  simp [Lift.conj, MulAut.conj_apply]

/-- `Γ̂ₙ(A)` acts on lifts by conjugation. -/
instance : MulAction (strictKernel n π) (Lift n ρbar π) where
  smul := Lift.conj n ρbar π
  one_smul ρ := Lift.ext <| MonoidHom.ext fun g ↦ by
    show (ρ.conj n ρbar π 1).toHom g = ρ.toHom g
    simp [Lift.conj_apply]
  mul_smul a b ρ := Lift.ext <| MonoidHom.ext fun g ↦ by
    show (ρ.conj n ρbar π (a * b)).toHom g = ((ρ.conj n ρbar π b).conj n ρbar π a).toHom g
    simp only [Lift.conj_apply, Subgroup.coe_mul]
    group

/-- Deformations: lifts modulo strict conjugation (README 1.3). -/
def Def : Type _ := MulAction.orbitRel.Quotient (strictKernel n π) (Lift n ρbar π)

/-- The strict class of a lift. -/
def Def.mk (ρ : Lift n ρbar π) : Def n ρbar π := Quotient.mk (MulAction.orbitRel _ _) ρ

/-- Two lifts have the same class iff they are conjugate by an element of `Γ̂ₙ(A)`. -/
theorem Def.mk_eq_mk_iff (ρ ρ' : Lift n ρbar π) :
    Def.mk n ρbar π ρ = Def.mk n ρbar π ρ' ↔
      ∃ a ∈ strictKernel n π, ∀ g, ρ'.toHom g = a * ρ.toHom g * a⁻¹ := by
  sorry

/-- Lifts with determinant `χ` (README 1.7). -/
def LiftDet (χ : G →* Aˣ) : Set (Lift n ρbar π) :=
  {ρ | ∀ g, Matrix.GeneralLinearGroup.det (ρ.toHom g) = χ g}

omit [IsTopologicalRing A] in
/-- Membership in the fixed-determinant subfunctor is the pointwise determinant equation. -/
theorem mem_LiftDet_iff (χ : G →* Aˣ) (ρ : Lift n ρbar π) :
    ρ ∈ LiftDet n ρbar π χ ↔ ∀ g, Matrix.GeneralLinearGroup.det (ρ.toHom g) = χ g :=
  Iff.rfl

/-- Strict conjugation preserves the determinant. -/
theorem LiftDet.conj (χ : G →* Aˣ) (a : strictKernel n π) {ρ : Lift n ρbar π}
    (hρ : ρ ∈ LiftDet n ρbar π χ) : ρ.conj n ρbar π a ∈ LiftDet n ρbar π χ := by
  intro g
  rw [Lift.conj_apply, map_mul, map_mul, map_inv, hρ g, mul_inv_cancel_comm]

/-- Fixed-determinant lifts as a sub-action of the strict action. -/
def liftDetSubMulAction (χ : G →* Aˣ) : SubMulAction (strictKernel n π) (Lift n ρbar π) where
  carrier := LiftDet n ρbar π χ
  smul_mem' a _ hρ := LiftDet.conj n ρbar π χ a hρ

/-- Fixed-determinant deformations: the orbit quotient of the fixed-determinant lifts. -/
def DefDet (χ : G →* Aˣ) : Type _ :=
  MulAction.orbitRel.Quotient (strictKernel n π) (liftDetSubMulAction n ρbar π χ)

/-- `ρ̄` is Schur: its `k[G]`-endomorphisms are scalars (README 1.5). -/
def IsSchur : Prop :=
  ∀ M : Matrix (Fin n) (Fin n) k, (∀ g, M * (ρbar g : Matrix (Fin n) (Fin n) k) =
    (ρbar g : Matrix (Fin n) (Fin n) k) * M) → ∃ c : k, M = c • (1 : Matrix (Fin n) (Fin n) k)

/-- For Schur `ρ̄`, lifts conjugate by `GLₙ(A)` are strictly conjugate, over a local ring whose
residue map `π` is surjective with kernel the maximal ideal (README 1.5). -/
theorem strict_of_full [IsLocalRing A] (hres : RingHom.ker π = IsLocalRing.maximalIdeal A)
    (hπ : Function.Surjective π) (hS : IsSchur n ρbar) (ρ ρ' : Lift n ρbar π)
    (a : GL (Fin n) A) (h : ∀ g, ρ'.toHom g = a * ρ.toHom g * a⁻¹) :
    ∃ b ∈ strictKernel n π, ∀ g, ρ'.toHom g = b * ρ.toHom g * b⁻¹ := by
  sorry

end Lifts

section CoefficientMaps

variable {G : Type*} [Group G] [TopologicalSpace G]
variable {k : Type*} [Field k]
variable (n : ℕ) (ρbar : G →* GL (Fin n) k)
variable {A B C : Type*} [CommRing A] [CommRing B] [CommRing C]
  [TopologicalSpace A] [TopologicalSpace B] [TopologicalSpace C]
  [IsTopologicalRing A] [IsTopologicalRing B] [IsTopologicalRing C]
  (πA : A →+* k) (πB : B →+* k) (πC : C →+* k)

/-- Pushforward of a lift along a continuous coefficient map respecting the residue maps. -/
def Lift.map (f : A →+* B) (hf : Continuous f) (hπ : πB.comp f = πA) (ρ : Lift n ρbar πA) :
    Lift n ρbar πB where
  toHom := (Matrix.GeneralLinearGroup.map f).comp ρ.toHom
  continuous := ρ.continuous.matrix_map hf
  reduce := by
    subst hπ
    exact ρ.reduce

omit [IsTopologicalRing A] [IsTopologicalRing B] in
/-- Coefficient pushforward applies the ring map to every matrix entry. -/
theorem Lift.map_apply (f : A →+* B) (hf : Continuous f) (hπ : πB.comp f = πA)
    (ρ : Lift n ρbar πA) (g : G) :
    (ρ.map n ρbar πA πB f hf hπ).toHom g = Matrix.GeneralLinearGroup.map f (ρ.toHom g) :=
  rfl

omit [IsTopologicalRing A] in
/-- Pushforward along the identity coefficient map fixes a lift. -/
theorem Lift.map_id (ρ : Lift n ρbar πA) :
    ρ.map n ρbar πA πA (RingHom.id A) continuous_id (RingHom.comp_id πA) = ρ :=
  Lift.ext <| by simp [Lift.map, Matrix.GeneralLinearGroup.map_id]

omit [IsTopologicalRing A] [IsTopologicalRing B] [IsTopologicalRing C] in
/-- Successive coefficient pushforwards agree with pushforward along the composite. -/
theorem Lift.map_comp (f : A →+* B) (hf : Continuous f) (hπf : πB.comp f = πA)
    (g : B →+* C) (hg : Continuous g) (hπg : πC.comp g = πB) (ρ : Lift n ρbar πA) :
    (ρ.map n ρbar πA πB f hf hπf).map n ρbar πB πC g hg hπg =
      ρ.map n ρbar πA πC (g.comp f) (hg.comp hf)
        (by rw [← RingHom.comp_assoc, hπg, hπf]) :=
  Lift.ext rfl

/-- Pushforward descends to strict classes. -/
def Def.map (f : A →+* B) (hf : Continuous f) (hπ : πB.comp f = πA) :
    Def n ρbar πA → Def n ρbar πB :=
  Quotient.map' (Lift.map n ρbar πA πB f hf hπ) fun ρ ρ' h ↦ by
    obtain ⟨a, rfl⟩ := h
    refine ⟨⟨Matrix.GeneralLinearGroup.map f (a : GL (Fin n) A), ?_⟩, ?_⟩
    · change Matrix.GeneralLinearGroup.map πB (Matrix.GeneralLinearGroup.map f _) = 1
      rw [← MonoidHom.comp_apply, ← Matrix.GeneralLinearGroup.map_comp, hπ]
      exact a.2
    · refine Lift.ext <| MonoidHom.ext fun g ↦ ?_
      show ((ρ'.map n ρbar πA πB f hf hπ).conj n ρbar πB _).toHom g =
        ((ρ'.conj n ρbar πA a).map n ρbar πA πB f hf hπ).toHom g
      rw [Lift.conj_apply, Lift.map_apply, Lift.map_apply, Lift.conj_apply]
      simp [map_mul, map_inv]

/-- Pushforward of a strict class is the class of the pushed-forward lift. -/
theorem Def.map_mk (f : A →+* B) (hf : Continuous f) (hπ : πB.comp f = πA)
    (ρ : Lift n ρbar πA) :
    Def.map n ρbar πA πB f hf hπ (Def.mk n ρbar πA ρ) =
      Def.mk n ρbar πB (ρ.map n ρbar πA πB f hf hπ) :=
  rfl

end CoefficientMaps

section Restriction

variable {G H : Type*} [Group G] [TopologicalSpace G] [Group H] [TopologicalSpace H]
variable {k : Type*} [Field k]
variable (n : ℕ) (ρbar : G →* GL (Fin n) k)
variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* k)

/-- Restriction of a lift along a continuous homomorphism `ι : H → G` (README 1.6). -/
def Lift.restrict (ι : H →* G) (hι : Continuous ι) (ρ : Lift n ρbar π) :
    Lift n (ρbar.comp ι) π where
  toHom := ρ.toHom.comp ι
  continuous := ρ.continuous.comp hι
  reduce := by rw [← MonoidHom.comp_assoc, ρ.reduce]

omit [IsTopologicalRing A] in
/-- Restriction evaluates a lift on the image of the group element. -/
theorem Lift.restrict_apply (ι : H →* G) (hι : Continuous ι) (ρ : Lift n ρbar π) (h : H) :
    (ρ.restrict n ρbar π ι hι).toHom h = ρ.toHom (ι h) :=
  rfl

omit [TopologicalSpace G] [TopologicalSpace H] [TopologicalSpace A] [IsTopologicalRing A] in
/-- The framed restriction `α⁻¹ (ρ ∘ ι) α` is invariant under `(ρ, α) ↦ (βρβ⁻¹, βα)`. -/
theorem framed_restrict_invariant (ι : H →* G) (ρ : G →* GL (Fin n) A)
    (α β : GL (Fin n) A) (h : H) :
    (β * α)⁻¹ * (β * ρ (ι h) * β⁻¹) * (β * α) = α⁻¹ * ρ (ι h) * α := by
  group

end Restriction

section Framed

variable {G : Type*} [Group G] [TopologicalSpace G]
variable {k : Type*} [Field k]
variable (n : ℕ) (ρbar : G →* GL (Fin n) k)
variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* k)
variable (T : Type*)

/-- A `T`-framed lift: a lift with frames `α_v ∈ Γ̂ₙ(A)` for `v ∈ T` (README 2.6, 3.3). Local problems,
ramification and determinant are imposed on top of this. -/
structure TFramedLift where
  /-- The lift. -/
  lift : Lift n ρbar π
  /-- The frames. -/
  frame : T → strictKernel n π

/-- The simultaneous action `(ρ, α) ↦ (βρβ⁻¹, βα)`. -/
instance : MulAction (strictKernel n π) (TFramedLift n ρbar π T) where
  smul b x := ⟨b • x.lift, fun v ↦ b * x.frame v⟩
  one_smul x := by
    obtain ⟨ρ, α⟩ := x
    show (⟨(1 : strictKernel n π) • ρ, fun v ↦ 1 * α v⟩ : TFramedLift n ρbar π T) = ⟨ρ, α⟩
    simp only [one_smul, one_mul]
  mul_smul a b x := by
    obtain ⟨ρ, α⟩ := x
    show (⟨(a * b) • ρ, fun v ↦ a * b * α v⟩ : TFramedLift n ρbar π T) =
      ⟨a • b • ρ, fun v ↦ a * (b * α v)⟩
    simp only [mul_smul, mul_assoc]

/-- The framed local lift `α_v⁻¹ ρ α_v`. -/
def TFramedLift.localLift (x : TFramedLift n ρbar π T) (v : T) (g : G) : GL (Fin n) A :=
  (x.frame v : GL (Fin n) A)⁻¹ * x.lift.toHom g * x.frame v

/-- The framed local lift is constant on classes. -/
theorem TFramedLift.localLift_smul (x : TFramedLift n ρbar π T) (b : strictKernel n π) (v : T)
    (g : G) : (b • x).localLift n ρbar π T v g = x.localLift n ρbar π T v g := by
  show ((b * x.frame v : strictKernel n π) : GL (Fin n) A)⁻¹ *
      (x.lift.conj n ρbar π b).toHom g * ((b * x.frame v : strictKernel n π) : GL (Fin n) A) =
    (x.frame v : GL (Fin n) A)⁻¹ * x.lift.toHom g * x.frame v
  rw [Lift.conj_apply, Subgroup.coe_mul]
  group

/-- Unrestricted simultaneous `T`-framed classes (README 2.6); type conditions are imposed
on this quotient in README 3.3. -/
def UnrestrictedTFramedDef : Type _ :=
  MulAction.orbitRel.Quotient (strictKernel n π) (TFramedLift n ρbar π T)

end Framed

/-! ## Layer R04.2: Representability and universal lifts -/

section PhiP

/-- Mazur's condition `Φ_p`: every open subgroup has finitely many homomorphisms with open kernel
to `ℤ/p` (README 2.1). -/
def PhiP (p : ℕ) (G : Type*) [Group G] [TopologicalSpace G] : Prop :=
  ∀ Δ : Subgroup G, IsOpen (Δ : Set G) →
    Finite {f : Δ →* Multiplicative (ZMod p) // IsOpen (f.ker : Set Δ)}

variable {p : ℕ} {G : Type*} [Group G] [TopologicalSpace G]

/-- `Φ_p` passes to open subgroups. -/
theorem PhiP.«open» (h : PhiP p G) (Δ : Subgroup G) (hΔ : IsOpen (Δ : Set G)) : PhiP p Δ := by
  sorry

/-- Topologically finitely generated profinite groups satisfy `Φ_p`. -/
theorem phiP_of_fg [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : TauCeti.IsTopologicallyFinitelyGenerated G) : PhiP p G := by
  sorry

/-- Every finite topological group satisfies `Φ_p`. -/
example [NeZero p] [IsTopologicalGroup G] [Finite G] : PhiP p G := by
  intro Δ _
  have : Finite (Multiplicative (ZMod p)) := inferInstanceAs (Finite (ZMod p))
  exact (TauCeti.isTopologicallyFinitelyGenerated_of_fg (G := Δ)).finite_monoidHom_isOpen_ker _

end PhiP

section NthRoot

/-- The `n`-th root used to split off the determinant when `p ∤ n` (README 2.9): over an Artinian
local ring with residue characteristic `p`, a unit with residue `1` has a unique `n`-th root with
residue `1`. -/
theorem exists_unique_nthRoot_of_residue_eq_one {A : Type*} [CommRing A] [IsLocalRing A]
    [IsArtinianRing A] (p : ℕ) [Fact p.Prime] [CharP (IsLocalRing.ResidueField A) p] {n : ℕ}
    (hn : ¬ p ∣ n) (u : Aˣ) (hu : IsLocalRing.residue A (u : A) = 1) :
    ∃! v : Aˣ, IsLocalRing.residue A (v : A) = 1 ∧ v ^ n = u := by
  sorry

/-- In characteristic three with `ε² = 0`, every expression `1 + aε` has cube one. -/
example {R : Type*} [CommRing R] (a e : R) (h3 : (3 : R) = 0) (he : e ^ 2 = 0) :
    (1 + a * e) ^ 3 = 1 := by
  linear_combination (a * e) * h3 + (3 * a ^ 2 + a ^ 3 * e) * he

end NthRoot

/-! ## Layer R04.3: Local conditions and global presentations -/


/-- Full-adjoint coboundaries take values in the supplied trace-zero ideal, even when the rank
is divisible by the residue characteristic (README 3.2). Strict-conjugacy stability then places
these cocycles in the pulled-back local tangent condition. -/
theorem adjoint_coboundary_mem_slIdeal {k : Type*} [Field k] {n : ℕ}
    (a : GL (Fin n) k) (X : Matrix (Fin n) (Fin n) k) :
    (a : Matrix (Fin n) (Fin n) k) * X * (a⁻¹ : GL (Fin n) k) - X ∈
      TauCeti.slIdeal k (Fin n) := by
  rw [TauCeti.mem_slIdeal_iff, Matrix.trace_sub, Matrix.trace_units_conj, sub_self]

/-- The cokernel of the diagonal scalar map `k → k^m`: the degree-zero frame directions of the
framed complex in rank one (README 3.6). -/
abbrev scalarFrameCokernel (k : Type*) [Field k] (m : ℕ) : Type _ :=
  (Fin m → k) ⧸ LinearMap.range (LinearMap.pi fun _ : Fin m ↦ (LinearMap.id : k →ₗ[k] k))

/-! ## Layer R04.4: Restriction, twists and changes of problem -/

section Twist

variable {G : Type*} [Group G] [TopologicalSpace G]
variable {k : Type*} [Field k]
variable (n : ℕ) (ρbar : G →* GL (Fin n) k)
variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* k)

/-- The twist `χ ⊗ ρ` by a continuous, residually trivial character (README 4.4, 4.9). -/
def Lift.twist (χ : G →* Aˣ) (hχ : ∀ g, π (χ g) = 1)
    (hc : Continuous fun g ↦ ((χ g : Aˣ) : A)) (ρ : Lift n ρbar π) : Lift n ρbar π where
  toHom := ((Matrix.GeneralLinearGroup.scalar (Fin n)).noncommCoprod (MonoidHom.id _)
    fun u M ↦ Matrix.GeneralLinearGroup.scalar_commute u M).comp (χ.prod ρ.toHom)
  continuous := by
    have h : (fun g ↦ ((((Matrix.GeneralLinearGroup.scalar (Fin n)).noncommCoprod
        (MonoidHom.id _) fun u M ↦ Matrix.GeneralLinearGroup.scalar_commute u M).comp
        (χ.prod ρ.toHom) g : GL (Fin n) A) : Matrix (Fin n) (Fin n) A)) = fun g ↦
        Matrix.diagonal (fun _ ↦ ((χ g : Aˣ) : A)) * (ρ.toHom g : Matrix (Fin n) (Fin n) A) := by
      funext g
      show ((Matrix.GeneralLinearGroup.scalar (Fin n) (χ g) * ρ.toHom g : GL (Fin n) A) :
        Matrix (Fin n) (Fin n) A) = _
      simp [Matrix.GeneralLinearGroup.coe_scalar, Matrix.scalar_apply]
    rw [h]
    exact (Continuous.matrix_diagonal (continuous_pi fun _ ↦ hc)).matrix_mul ρ.continuous
  reduce := by
    refine Eq.trans ?_ ρ.reduce
    ext g : 1
    show Matrix.GeneralLinearGroup.map π (Matrix.GeneralLinearGroup.scalar (Fin n) (χ g) *
      ρ.toHom g) = Matrix.GeneralLinearGroup.map π (ρ.toHom g)
    have h1 : Units.map (π : A →* k) (χ g) = 1 := Units.ext (by simp [hχ g])
    rw [map_mul, Matrix.GeneralLinearGroup.map_scalar]
    simp [h1]

/-- The twist has matrices `χ(g) • ρ(g)`. -/
theorem Lift.twist_apply (χ : G →* Aˣ) (hχ : ∀ g, π (χ g) = 1)
    (hc : Continuous fun g ↦ ((χ g : Aˣ) : A)) (ρ : Lift n ρbar π) (g : G) :
    ((ρ.twist n ρbar π χ hχ hc).toHom g : Matrix (Fin n) (Fin n) A) =
      ((χ g : Aˣ) : A) • (ρ.toHom g : Matrix (Fin n) (Fin n) A) := by
  show ((Matrix.GeneralLinearGroup.scalar (Fin n) (χ g) * ρ.toHom g : GL (Fin n) A) :
    Matrix (Fin n) (Fin n) A) = _
  simp [Matrix.GeneralLinearGroup.coe_scalar, Matrix.scalar_apply, Matrix.smul_eq_diagonal_mul]

/-- The trace step of the freeness argument: `tr (χ ⊗ ρ)(g) = χ(g) · tr ρ(g)`. -/
theorem Lift.trace_twist (χ : G →* Aˣ) (hχ : ∀ g, π (χ g) = 1)
    (hc : Continuous fun g ↦ ((χ g : Aˣ) : A)) (ρ : Lift n ρbar π) (g : G) :
    ((ρ.twist n ρbar π χ hχ hc).toHom g : Matrix (Fin n) (Fin n) A).trace =
      ((χ g : Aˣ) : A) * (ρ.toHom g : Matrix (Fin n) (Fin n) A).trace := by
  rw [Lift.twist_apply, Matrix.trace_smul, smul_eq_mul]

end Twist

/-! ## Convention examples -/

section Examples

variable {G : Type*} [Group G] [TopologicalSpace G] {k : Type*} [Field k]

/-- `restrict_id`: precomposition by the identity fixes the underlying lift (README 1.6). -/
example [TopologicalSpace k] [IsTopologicalRing k] (n : ℕ)
    (ρbar : G →* GL (Fin n) k) {A : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] (π : A →+* k) (ρ : Lift n ρbar π) :
    ρ.restrict n ρbar π (MonoidHom.id G) continuous_id = ρ := by
  apply Lift.ext
  rfl

/-- `def_residue`: a continuous residual lift gives the unique strict class over `k` (README 1.3). -/
example [TopologicalSpace k] [IsTopologicalRing k] (n : ℕ)
    (ρbar : G →* GL (Fin n) k) (ρ : Lift n ρbar (RingHom.id k)) :
    Subsingleton (Def n ρbar (RingHom.id k)) ∧ Nonempty (Def n ρbar (RingHom.id k)) := by
  sorry

/-- `def_rank_one_eq_lift`: scalar conjugation removes no rank-one lifts (README 1.3). -/
example (ρbar : G →* GL (Fin 1) k) {A : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] (π : A →+* k) :
    ∃ e : Def 1 ρbar π ≃ Lift 1 ρbar π, ∀ ρ, e (Def.mk 1 ρbar π ρ) = ρ := by
  sorry

/-- `liftDet_rank_one`: the determinant equation fixes the entire rank-one homomorphism
(README 1.7). -/
example (ρbar : G →* GL (Fin 1) k) {A : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] (π : A →+* k) (χ : G →* Aˣ) (ρ : Lift 1 ρbar π) :
    ρ ∈ LiftDet 1 ρbar π χ ↔
      ρ.toHom = (Matrix.GeneralLinearGroup.scalar (Fin 1)).comp χ := by
  sorry

/-- `liftDet_residue`: with compatible determinant, every residual lift is the same
fixed-determinant lift (README 1.7). -/
example [TopologicalSpace k] [IsTopologicalRing k] (n : ℕ)
    (ρbar : G →* GL (Fin n) k) (ρ : Lift n ρbar (RingHom.id k)) :
    ρ ∈ LiftDet n ρbar (RingHom.id k) (Matrix.GeneralLinearGroup.det.comp ρbar) ∧
      Set.Subsingleton (LiftDet n ρbar (RingHom.id k) (Matrix.GeneralLinearGroup.det.comp ρbar)) := by
  sorry

/-- `liftDet_wrong_char`: a determinant with incompatible reduction admits no lift
(README 1.7). -/
example (n : ℕ) (ρbar : G →* GL (Fin n) k) {A : Type*} [CommRing A]
    [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* k) (χ : G →* Aˣ)
    (hχ : (Units.map (π : A →* k)).comp χ ≠ Matrix.GeneralLinearGroup.det.comp ρbar) :
    LiftDet n ρbar π χ = ∅ := by
  sorry

/-- `twist_trivial`: the trivial character fixes each lift (README 4.4). -/
example (n : ℕ) (ρbar : G →* GL (Fin n) k) {A : Type*} [CommRing A]
    [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* k) (ρ : Lift n ρbar π) :
    ρ.twist n ρbar π (1 : G →* Aˣ) (by intro g; simp) (by simpa using
      (continuous_const : Continuous fun _ : G ↦ (1 : A))) = ρ := by
  apply Lift.ext
  apply MonoidHom.ext
  intro g
  apply Matrix.GeneralLinearGroup.ext
  intro i j
  simpa using congrFun (congrFun
    (Lift.twist_apply n ρbar π (1 : G →* Aˣ) (by intro g; simp)
      (by simpa using (continuous_const : Continuous fun _ : G ↦ (1 : A))) ρ g) i) j

/-- `tframed_empty_T`: forgetting the unique empty frame tuple identifies the unrestricted
framed quotient with strict classes (README 2.6, 3.3). -/
example (n : ℕ) (ρbar : G →* GL (Fin n) k) {A : Type*} [CommRing A]
    [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* k) :
    ∃ e : UnrestrictedTFramedDef n ρbar π Empty ≃ Def n ρbar π,
      ∀ x : TFramedLift n ρbar π Empty,
        e (Quotient.mk (MulAction.orbitRel _ _) x) = Def.mk n ρbar π x.lift := by
  sorry

/-- `tframed_residue`: all strict frames and residual lifts give a single quotient point
(README 3.3). -/
example [TopologicalSpace k] [IsTopologicalRing k] (n : ℕ)
    (ρbar : G →* GL (Fin n) k) (T : Type*) (ρ : Lift n ρbar (RingHom.id k)) :
    Subsingleton (UnrestrictedTFramedDef n ρbar (RingHom.id k) T) ∧
      Nonempty (UnrestrictedTFramedDef n ρbar (RingHom.id k) T) := by
  sorry

/-- `nthRoot_fails_p_dvd_n`: the nonzero dual-number direction has no residue-one cube root,
even among arbitrary elements (README 2.9). -/
example :
    let ε : DualNumber (ZMod 3) := TrivSqZeroExt.inr 1
    ε ≠ 0 ∧ ¬ ∃ v : DualNumber (ZMod 3), v.fst = 1 ∧ v ^ 3 = 1 + ε := by
  constructor
  · intro h
    have hs := congrArg TrivSqZeroExt.snd h
    exact one_ne_zero hs
  · rintro ⟨v, hv, he⟩
    have hs := congrArg TrivSqZeroExt.snd he
    norm_num [TrivSqZeroExt.snd_pow, hv] at hs
    have h3 : (3 : ZMod 3) = 0 := by decide
    rw [h3, zero_mul] at hs
    exact zero_ne_one hs

/-- `nthRoot_unique`: prime-to-residue-characteristic powers are injective on residue-one units
(README 2.9). -/
example {A : Type*} [CommRing A] [IsLocalRing A] [IsArtinianRing A]
    (p : ℕ) [Fact p.Prime] [CharP (IsLocalRing.ResidueField A) p] {n : ℕ}
    (hn : ¬ p ∣ n) (u v : Aˣ)
    (hu : IsLocalRing.residue A (u : A) = 1) (hv : IsLocalRing.residue A (v : A) = 1)
    (h : u ^ n = v ^ n) : u = v := by
  obtain ⟨_, _, huniq⟩ := exists_unique_nthRoot_of_residue_eq_one p hn (u ^ n) (by simp [hu])
  exact (huniq u ⟨hu, rfl⟩).trans (huniq v ⟨hv, h.symm⟩).symm

/-- `twDatum_residue_extension`: distinct nonzero eigenvalues over `𝔽₃` cannot have product one;
`X²+1` has no root in that field (README 5.1). -/
example : (∀ a b : ZMod 3, a ≠ 0 → b ≠ 0 → a ≠ b → a * b ≠ 1) ∧
    (∀ a : ZMod 3, a ^ 2 + 1 ≠ 0) ∧
    (1 : Matrix (Fin 2) (Fin 2) (ZMod 3)).det =
      (!![(0 : ZMod 3), -1; 1, 0]).det := by
  decide

/-- `isOfType_unramified_conjugate`: the strict conjugator changes Frobenius but keeps the
inertia matrix equal to one (README 7.1). -/
example :
    let ε : DualNumber (ZMod 3) := TrivSqZeroExt.inr 1
    let b : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)) := !![1, 0; ε, 1]
    let bi : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)) := !![1, 0; -ε, 1]
    b * !![1, 0; 0, -1] * bi = !![1, 0; 2 * ε, -1] ∧ b * 1 * bi = 1 := by
  let : DecidableEq (DualNumber (ZMod 3)) := inferInstanceAs (DecidableEq (ZMod 3 × ZMod 3))
  decide

/-- `polarized_symplectic_triple`: the standard `S₃` matrices preserve the symplectic pairing
with sign multiplier; its transpose forces multiplier `+1` at the central involution
(README 8.1). -/
example :
    let J : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![0, 1; -1, 0]
    let C : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![0, -1; 1, -1]
    let S : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![0, 1; 1, 0]
    J.det = 1 ∧ J.transpose = -J ∧ C.transpose * J * C = J ∧
      S.transpose * J * S = -J ∧ J ≠ J.transpose ∧
      (-J) * J = 1 := by
  decide

/-- `polarized_not_schur`: the distinct reciprocal characters and alternating pairing admit a
nonzero diagonal infinitesimal centralizer (README 8.1). -/
example :
    let J : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![0, 1; -1, 0]
    let D : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![2, 0; 0, 3]
    let X : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![1, 0; 0, -1]
    D ^ 4 = 1 ∧ D.transpose * J * D = J ∧ X * D = D * X ∧
      X.transpose * J + J * X = 0 ∧ X ≠ 0 := by
  decide

/-- `twSystem_cyclic_augmentation` and `presentation_obstruction_square`: the order-three
character relation has linear term `3z` and becomes a nonzero cube in characteristic three
(README 6.4, 3.7). -/
example :
    ((1 + Polynomial.X) ^ 3 - 1 : Polynomial ℤ) =
      3 * Polynomial.X + Polynomial.X ^ 2 * (3 + Polynomial.X) ∧
    ((1 + Polynomial.X) ^ 3 - 1 : Polynomial (ZMod 3)) = Polynomial.X ^ 3 := by
  constructor
  · ring
  · have h3 : (3 : Polynomial (ZMod 3)) = 0 := CharP.cast_eq_zero _ 3
    linear_combination (Polynomial.X + Polynomial.X ^ 2) * h3

/-- `dyadic_cyclic_four_fibre`: the order-two determinant fibre is a proper quotient of the
order-four character ring (README 6.6). -/
example :
    ((1 + Polynomial.X) ^ 4 - 1 : Polynomial ℤ) =
      ((1 + Polynomial.X) ^ 2 - 1) * ((1 + Polynomial.X) ^ 2 + 1) ∧
    ((1 + Polynomial.X) ^ 2 - 1 : Polynomial ℤ) = Polynomial.X * (2 + Polynomial.X) := by
  constructor <;> ring

/-- `dyadic_chunk_level`: order-four characters and the formal torus agree modulo the third
power of the maximal ideal (README 6.6). -/
example : ((1 + Polynomial.X) ^ 4 - 1 : Polynomial ℤ) ∈
    (Ideal.span {(2 : Polynomial ℤ), Polynomial.X}) ^ 3 := by
  sorry

/-- `def_not_full_conj` and `strict_of_full_not_schur`: two rank-two dual-number matrices are
conjugate by the swap, but no matrix reducing to one intertwines them (README 1.3, 1.5). -/
example :
    let ε : DualNumber (ZMod 3) := TrivSqZeroExt.inr 1
    let D : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)) := !![1 + ε, 0; 0, 1]
    let D' : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)) := !![1, 0; 0, 1 + ε]
    let P : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)) := !![0, 1; 1, 0]
    P * D * P = D' ∧ D ≠ D' ∧
      ¬ ∃ b : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)),
        b.map (TrivSqZeroExt.fstHom (ZMod 3) (ZMod 3) (ZMod 3)).toRingHom = 1 ∧
        b * D = D' * b := by
  sorry

/-- `restrict_not_injective`: distinct lifts restrict to the same lift on the trivial subgroup
(README 1.6). -/
example (n : ℕ) (ρbar : G →* GL (Fin n) k) {A : Type*} [CommRing A]
    [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* k)
    (ρ ρ' : Lift n ρbar π) (h : ρ ≠ ρ') :
    ρ ≠ ρ' ∧
      ρ.restrict n ρbar π (1 : PUnit →* G) continuous_const =
        ρ'.restrict n ρbar π (1 : PUnit →* G) continuous_const := by
  constructor
  · exact h
  · apply Lift.ext
    apply MonoidHom.ext
    intro g
    simp [Lift.restrict]

/-- `changeCoeff_schur`: extending the residue field preserves the scalar-centralizer condition
(README 1.8). -/
example (n : ℕ) (ρbar : G →* GL (Fin n) k) {k' : Type*} [Field k'] (f : k →+* k') :
    IsSchur n ρbar ↔ IsSchur n ((Matrix.GeneralLinearGroup.map f).comp ρbar) := by
  sorry

/-- `framed_normalisation_unique`: a distinguished unit frame entry admits exactly one scalar
normalization (README 2.6). -/
example {A : Type*} [CommRing A] (u : Aˣ) : ∃! c : Aˣ, c * u = 1 := by
  refine ⟨u⁻¹, inv_mul_cancel u, ?_⟩
  intro c hc
  exact mul_right_cancel (hc.trans (inv_mul_cancel u).symm)

/-- `twistFree_trace_unit`: an upper/lower unipotent product has nonzero trace, detecting a
nontrivial scalar twist in residue characteristic two (README 4.10). -/
example {K : Type*} [Field K] [CharP K 2] (ω : K) (hω : ω ≠ 0) (a : K) :
    let ωA : DualNumber K := TrivSqZeroExt.inl ω
    let M : Matrix (Fin 2) (Fin 2) (DualNumber K) :=
      !![1, 1; 0, 1] * !![1, 0; ωA, 1]
    M.trace = ωA ∧
      (((1 + TrivSqZeroExt.inr a : DualNumber K) • M).trace = M.trace ↔ a = 0) := by
  sorry

/-- `twistFree_A5`: a scalar twist of the identity matrix is conjugate to the identity only
when its first-order character value is trivial (README 4.10). -/
example (a : k) :
    (1 + TrivSqZeroExt.inr a : DualNumber k) •
      (1 : Matrix (Fin 2) (Fin 2) (DualNumber k)) = 1 ↔ a = 0 := by
  constructor
  · intro h
    have hs := congrArg (fun M : Matrix (Fin 2) (Fin 2) (DualNumber k) ↦
      TrivSqZeroExt.snd (M 0 0)) h
    simpa using hs
  · intro h
    subst h
    simp

/-- `trace_subring_S3`: strict first-order conjugation changes the three-cycle matrix while
preserving its trace (README 6.2). -/
example :
    let ε : DualNumber (ZMod 5) := TrivSqZeroExt.inr 1
    let C : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 5)) := !![0, -1; 1, -1]
    let b : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 5)) := !![1, ε; 0, 1]
    let bi : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 5)) := !![1, -ε; 0, 1]
    b * bi = 1 ∧ b * C * bi ≠ C ∧ (b * C * bi).trace = C.trace ∧ C.trace = -1 := by
  let : DecidableEq (DualNumber (ZMod 5)) := inferInstanceAs (DecidableEq (ZMod 5 × ZMod 5))
  decide

/-- `fixedDet_cyclic_four`: the scalar character coordinates have determinant-one equation
`x+y+xy=0`, allowing distinct reciprocal eigencharacters (README 4.8). -/
example {R : Type*} [CommRing R] (x y : R) :
    (!![1 + x, 0; 0, 1 + y]).det - 1 = x + y + x * y := by
  simp [Matrix.det_fin_two]
  ring

/-- `phiP_Zp`: the additive p-adic integers satisfy Mazur's finiteness condition (README 2.1). -/
example (p : ℕ) [Fact p.Prime] : PhiP p (Multiplicative ℤ_[p]) := by
  sorry

/-- `phiP_open`: the finiteness condition persists on each open subgroup (README 2.1). -/
example (p : ℕ) (h : PhiP p G) (Δ : Subgroup G) (hΔ : IsOpen (Δ : Set G)) :
    PhiP p Δ :=
  h.«open» Δ hΔ

/-- `twist_no_root_p2`: even modulo four no element squares to the nontrivial quadratic unit;
a square root over the 2-adic integers would reduce to one here (README 4.4). -/
example : ∀ v : ZMod 4, v ^ 2 ≠ -1 := by
  decide

/-- `twist_not_fixed_det_odd`: a nontrivial residue-one scalar over the characteristic-three
dual numbers has nontrivial square (README 4.9). -/
example :
    let ε : DualNumber (ZMod 3) := TrivSqZeroExt.inr 1
    1 + ε ≠ 1 ∧ (1 + ε) ^ 2 ≠ 1 := by
  let : DecidableEq (DualNumber (ZMod 3)) := inferInstanceAs (DecidableEq (ZMod 3 × ZMod 3))
  decide

/-- `twist_map_not_injective_p2`: a nontrivial residue-one character value has square one over
the characteristic-two dual numbers (README 4.8). -/
example :
    let ε : DualNumber (ZMod 2) := TrivSqZeroExt.inr 1
    1 + ε ≠ 1 ∧ (1 + ε) ^ 2 = 1 := by
  let : DecidableEq (DualNumber (ZMod 2)) := inferInstanceAs (DecidableEq (ZMod 2 × ZMod 2))
  decide

/-- A lift to the residue field itself is `ρ̄` (README 1.1, `lift_residue`). -/
example [TopologicalSpace k] [IsTopologicalRing k] (n : ℕ) (ρbar : G →* GL (Fin n) k)
    (ρ : Lift n ρbar (RingHom.id k)) : ρ.toHom = ρbar := by
  simpa [Matrix.GeneralLinearGroup.map_id] using ρ.reduce

/-- Every rank-one residual representation is Schur. -/
example (ρbar : G →* GL (Fin 1) k) : IsSchur 1 ρbar := by
  intro M _
  refine ⟨M 0 0, ?_⟩
  ext i j
  fin_cases i
  fin_cases j
  simp

/-- `1 ⊕ 1` is not Schur: `diag(1, 0)` commutes with it (README 1.5, `isSchur_absIrred`). -/
example : ¬ IsSchur 2 (1 : G →* GL (Fin 2) k) := by
  intro h
  obtain ⟨c, hc⟩ := h (Matrix.diagonal ![1, 0]) (fun g ↦ by simp)
  have h0 := congrFun (congrFun hc 0) 0
  have h1 := congrFun (congrFun hc 1) 1
  simp at h0 h1
  exact one_ne_zero (h0.trans h1.symm)

/-- `R04.3/local-deformation-problem`, `defProblem_not_conj_stable`: an actual strict conjugator
over the dual numbers `𝔽₃[ε]` moves `diag(1, −1)` off the upper-triangular matrices. -/
example :
    let ε₃ : DualNumber (ZMod 3) := TrivSqZeroExt.inr 1
    let D₃ : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)) := !![1, 0; 0, -1]
    let b₃ : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)) := !![1, 0; ε₃, 1]
    let b₃inv : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)) := !![1, 0; -ε₃, 1]
    D₃ ^ 2 = 1 ∧ b₃ * b₃inv = 1 ∧ b₃inv * b₃ = 1 ∧
      b₃.map (TrivSqZeroExt.fstHom (ZMod 3) (ZMod 3) (ZMod 3)).toRingHom = 1 ∧
      b₃ * D₃ * b₃inv = !![1, 0; 2 * ε₃, -1] ∧ (b₃ * D₃ * b₃inv) 1 0 ≠ 0 := by
  let : DecidableEq (DualNumber (ZMod 3)) := inferInstanceAs (DecidableEq (ZMod 3 × ZMod 3))
  decide

/-- `strict_of_full_nonlocal`: the integral `S₃` generators, and an integral unit matrix reducing
to the scalar `2` modulo `5`; only `±1` are integral scalar units. -/
example :
    let C : Matrix (Fin 2) (Fin 2) ℤ := !![0, -1; 1, -1]
    let S : Matrix (Fin 2) (Fin 2) ℤ := !![0, 1; 1, 0]
    let a : Matrix (Fin 2) (Fin 2) ℤ := !![2, 5; 5, 12]
    let ainv : Matrix (Fin 2) (Fin 2) ℤ := !![-12, 5; 5, -2]
    C ^ 3 = 1 ∧ S ^ 2 = 1 ∧ S * C * S = C ^ 2 ∧ a * ainv = 1 ∧ ainv * a = 1 ∧
      a.map (Int.castRingHom (ZMod 5)) = (2 : ZMod 5) • (1 : Matrix (Fin 2) (Fin 2) (ZMod 5)) ∧
      a.map (Int.castRingHom (ZMod 5)) ≠ 1 ∧ (-a).map (Int.castRingHom (ZMod 5)) ≠ 1 := by
  decide

/-- The integral common centralizer of the `S₃` generators consists of scalar matrices. -/
example (x y z w : ℤ)
    (hC : !![x, y; z, w] * !![0, -1; 1, -1] = !![0, -1; 1, -1] * !![x, y; z, w])
    (hS : !![x, y; z, w] * !![0, 1; 1, 0] = !![0, 1; 1, 0] * !![x, y; z, w]) :
    y = 0 ∧ z = 0 ∧ x = w := by
  have hc00 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℤ ↦ M 0 0) hC
  have hc01 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℤ ↦ M 0 1) hC
  have hs00 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℤ ↦ M 0 0) hS
  simp [Matrix.mul_apply, Fin.sum_univ_two] at hc00 hc01 hs00
  omega

/-- Over the local ring `ℤ/25` the unit `13 = 2⁻¹` normalises the same conjugator into the strict
kernel. -/
example : (2 * 13 : ZMod 25) = 1 ∧
    ((13 : ZMod 25) • ((!![2, 5; 5, 12] : Matrix (Fin 2) (Fin 2) ℤ).map
      (Int.castRingHom (ZMod 25)))).map (ZMod.castHom (by norm_num : 5 ∣ 25) (ZMod 5)) = 1 := by
  decide

/-- Rank one has no trace-zero matrix directions, so its pulled-back fixed-determinant local
condition is zero even when the unrestricted local condition contains characters (README 3.2). -/
example (X : Matrix (Fin 1) (Fin 1) k) (hX : X.trace = 0) : X = 0 := by
  ext i j
  fin_cases i
  fin_cases j
  simpa [Matrix.trace, Fin.sum_univ_one] using hX

/-- Rank three in residue characteristic two is trace split, but is excluded from the odd-prime
arithmetic comparison (README 3.6). -/
example : ¬ (2 : ℕ) ∣ 3 ∧ ¬ (2 : ℕ) > 2 := by
  decide

/-- Rank-one framed complex: two frames leave one scalar frame direction, `k²/diag(k)`. -/
example : Module.finrank k (scalarFrameCokernel k 2) = 1 := by
  unfold scalarFrameCokernel
  have hi : Function.Injective
      (LinearMap.pi fun _ : Fin 2 ↦ (LinearMap.id : k →ₗ[k] k)) :=
    fun _ _ h ↦ congrFun h 0
  have hr := LinearMap.finrank_range_of_inj hi
  have hd := (LinearMap.range
    (LinearMap.pi fun _ : Fin 2 ↦ (LinearMap.id : k →ₗ[k] k))).finrank_quotient_add_finrank
  simp only [Module.finrank_self] at hr
  rw [hr, Module.finrank_fin_fun] at hd
  omega

/-- One frame is killed by the scalar change. -/
example : Module.finrank k (scalarFrameCokernel k 1) = 0 := by
  unfold scalarFrameCokernel
  have hi : Function.Injective
      (LinearMap.pi fun _ : Fin 1 ↦ (LinearMap.id : k →ₗ[k] k)) :=
    fun _ _ h ↦ congrFun h 0
  have hr := LinearMap.finrank_range_of_inj hi
  have hd := (LinearMap.range
    (LinearMap.pi fun _ : Fin 1 ↦ (LinearMap.id : k →ₗ[k] k))).finrank_quotient_add_finrank
  simp only [Module.finrank_self] at hr
  rw [hr, Module.finrank_fin_fun] at hd
  omega

/-- No frames: no frame directions, while every scalar stays in the kernel of the boundary. -/
example : Module.finrank k (scalarFrameCokernel k 0) = 0 := by
  unfold scalarFrameCokernel
  have hd := (LinearMap.range
    (LinearMap.pi fun _ : Fin 0 ↦ (LinearMap.id : k →ₗ[k] k))).finrank_quotient_add_finrank
  rw [Module.finrank_fin_fun] at hd
  omega

/-- For the mapping fibre of the identity between two-term identity complexes,
`d⁰(x) = (x,x)` and `d¹(a,b) = a-b`; replacing the minus by a plus fails in characteristic three. -/
example :
    let d₀ : ZMod 3 → ZMod 3 × ZMod 3 := fun x ↦ (x, x)
    let d₁ : ZMod 3 × ZMod 3 → ZMod 3 := fun x ↦ x.1 - x.2
    d₁ (d₀ 1) = 0 ∧ (d₀ 1).1 + (d₀ 1).2 = 2 := by
  decide

/-- A nonzero nilpotent direction survives in the coefficient algebra, while every map to a
reduced coefficient ring kills it (README 6.3). -/
example :
    let ε : DualNumber (ZMod 3) := ⟨0, 1⟩
    ε ≠ 0 ∧ ε ^ 2 = 0 := by
  change (TrivSqZeroExt.inr (1 : ZMod 3) : DualNumber (ZMod 3)) ≠ 0 ∧
    (TrivSqZeroExt.inr (1 : ZMod 3) : DualNumber (ZMod 3)) ^ 2 = 0
  constructor
  · intro h
    have hs := congrArg TrivSqZeroExt.snd h
    exact one_ne_zero hs
  · rw [pow_two, TrivSqZeroExt.inr_mul_inr]

/-- `R04.4/diagonalizable-groups`, the case `p = 2`, `m = 1`: `(1 + X)² − 1 ∈ (2, X)²`. -/
example : ((1 + Polynomial.X) ^ 2 - 1 : Polynomial ℤ) ∈
    (Ideal.span {(2 : Polynomial ℤ), Polynomial.X}) ^ 2 := by
  have h2 : (2 : Polynomial ℤ) ∈ Ideal.span {(2 : Polynomial ℤ), Polynomial.X} :=
    Ideal.subset_span (by simp)
  have hX : (Polynomial.X : Polynomial ℤ) ∈ Ideal.span {(2 : Polynomial ℤ), Polynomial.X} :=
    Ideal.subset_span (by simp)
  have : ((1 + Polynomial.X) ^ 2 - 1 : Polynomial ℤ) =
      2 * Polynomial.X + Polynomial.X * Polynomial.X := by ring
  rw [this, pow_two]
  exact Ideal.add_mem _ (Ideal.mul_mem_mul h2 hX) (Ideal.mul_mem_mul hX hX)

/-- `R04.4/twisting-action`: twisting a rank-two lift by `c` multiplies determinants by `c²`. -/
example {R : Type*} [CommRing R] (c : R) (M : Matrix (Fin 2) (Fin 2) R) :
    (c • M).det = c ^ 2 * M.det := by
  simp

/-- `R04.4/twist-action-free`, the dihedral self-twist: in the induced basis, conjugation by
`diag(1, −1)` negates the image of an element outside the index-two subgroup ... -/
example {R : Type*} [CommRing R] (a : R) :
    !![1, 0; 0, -1] * !![0, a; 1, 0] * !![1, 0; 0, -1] = -!![(0 : R), a; 1, 0] := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- ... and fixes the diagonal image of an element of the index-two subgroup. -/
example {R : Type*} [CommRing R] (x y : R) :
    !![1, 0; 0, -1] * !![x, 0; 0, y] * !![1, 0; 0, -1] = !![x, 0; 0, y] := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- The induced self-twist conjugator reduces to the identity modulo two, but is nontrivial
modulo four; residue characteristic two is essential for a strict self-twist. -/
example :
    !![(1 : ZMod 2), 0; 0, -1] = 1 ∧
    !![(1 : ZMod 4), 0; 0, -1] ≠ 1 := by
  decide

/-- `R04.5/image-hypotheses`: the `S₃` representation over `𝔽₅` has a nonzero trace-zero sign line
`k·J` in its adjoint (`J = C − C²`): the three-cycle fixes `J` and the transposition negates it. -/
example :
    let C : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![0, -1; 1, -1]
    let S : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![0, 1; 1, 0]
    let J := C - C ^ 2
    J.trace = 0 ∧ J ≠ 0 ∧ C * J * C ^ 2 = J ∧ S * J * S = -J := by
  decide

/-- The sign line is proper in `ad⁰`: `diag(1, −1)` is not a multiple of `J`. -/
example :
    let C : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![0, -1; 1, -1]
    !![(1 : ZMod 5), 0; 0, -1] ∉ Submodule.span (ZMod 5) {C - C ^ 2} := by
  intro C
  rw [Submodule.mem_span_singleton]
  decide

/-- `1, C, S, CS` span `M₂(𝔽₅)`: the residual representation is absolutely irreducible. -/
example : (!![(1 : ZMod 5), 0, 0, 1; 0, -1, 1, -1; 0, 1, 1, 0; -1, 0, -1, 1]).det ≠ 0 := by
  decide

/-- `R04.5/dyadic-linear-disjointness`: `R₄(X) = R₃(2X² − 1)` with `R₃ = 2X² − 1` is `T₄`. -/
example : (2 * (2 * Polynomial.X ^ 2 - 1) ^ 2 - 1 : Polynomial ℤ) =
    8 * Polynomial.X ^ 4 - 8 * Polynomial.X ^ 2 + 1 := by
  ring

/-- `R04.5/dyadic-taylor-wiles-primes`: scalars are trace-free in characteristic two. -/
example : (1 : Matrix (Fin 2) (Fin 2) (ZMod 2)).trace = 0 := by
  decide

/-- `R04.5/taylor-wiles-inertia-action`: `Frob_v = diag(α, β)` acts on `E₁₂` by `α/β`. -/
example {K : Type*} [Field K] (α β : K) :
    !![α, 0; 0, β] * !![0, 1; 0, 0] * !![α⁻¹, 0; 0, β⁻¹] = (α * β⁻¹) • !![(0 : K), 1; 0, 0] := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- `R04.5/chebotarev-selmer-selection`: independent coordinate localizations have zero joint
kernel ... -/
example : Function.Injective (fun x : Fin 2 → ZMod 3 ↦ (x 0, x 1)) := by
  intro x y h
  funext i
  fin_cases i
  · exact congrArg Prod.fst h
  · exact congrArg Prod.snd h

/-- ... while repeating one localization cannot kill a two-dimensional space. -/
example : ¬ Function.Injective (fun x : Fin 2 → ZMod 3 ↦ (x 0, x 0)) := by
  intro h
  have he := h (a₁ := fun _ ↦ 0) (a₂ := fun i ↦ if i = 0 then 0 else 1) (by simp)
  have bad := congrFun he 1
  norm_num at bad

/-- `R04.5/taylor-wiles-generator-count` and `R04.6/patching-numerology`, odd `p`:
`h + (4|S| − 1) − 3|S| = h + |S| − 1`. -/
example (h S : ℤ) : h + (4 * S - 1) - 3 * S = h + S - 1 := by
  ring

/-- `p = 2`: with `t = 2 − |S| + h`, `h + j + t − d = 2h + 1`. -/
example (h S : ℤ) : h + (4 * S - 1) + (2 - S + h) - 3 * S = 2 * h + 1 := by
  ring

/-- `R04.6/kw-deformation-data`: `3|S_f| + [F : ℚ] + 2[F : ℚ] = 3(|S_f| + [F : ℚ])`. -/
example (Sf d : ℕ) : 3 * Sf + d + 2 * d = 3 * (Sf + d) := by
  ring

/-- The CM example `ℚ(i)/ℚ`: `X² + 1` splits with distinct roots modulo five and has a repeated
root modulo two, exhibiting the primes used in README 8.1. -/
example :
    (Polynomial.X ^ 2 + 1 : Polynomial (ZMod 5)) =
      (Polynomial.X - 2) * (Polynomial.X + 2) ∧
    (Polynomial.X ^ 2 + 1 : Polynomial (ZMod 2)) = (Polynomial.X + 1) ^ 2 := by
  constructor
  · have h5 : (5 : Polynomial (ZMod 5)) = 0 := CharP.cast_eq_zero _ 5
    linear_combination h5
  · have h2 : (2 : Polynomial (ZMod 2)) = 0 := CharP.cast_eq_zero _ 2
    linear_combination -Polynomial.X * h2

/-- `G7/polarized-tangent-obstruction`: for `p = n = 3` the identity has trace `0`. -/
example : Matrix.trace (1 : Matrix (Fin 3) (Fin 3) (ZMod 3)) = 0 := by
  rw [Matrix.trace_one, Fintype.card_fin]
  decide

/-- `G7/enormous-taylor-wiles-presentation`: the count `qn − n²[F⁺ : ℚ]` is formed in `ℤ`. -/
example (q n f : ℤ) : -(n ^ 2 * f) + q * n = q * n - n ^ 2 * f := by
  ring

/-- `lift_trivial_char_Zp`: evaluation at one classifies rank-one residue-one lifts over
finite discrete local coefficients with residue field `𝔽_p` (README 1.1). -/
example (p : ℕ) [Fact p.Prime] {A : Type*} [CommRing A] [IsLocalRing A]
    [Finite A] [TopologicalSpace A] [DiscreteTopology A] [IsTopologicalRing A]
    (π : A →+* ZMod p) (hπ : Function.Surjective π)
    (hres : RingHom.ker π = IsLocalRing.maximalIdeal A) :
    ∃ e : Lift 1 (1 : Multiplicative ℤ_[p] →* GL (Fin 1) (ZMod p)) π ≃
        {u : Aˣ // π (u : A) = 1},
      ∀ ρ, (e ρ).val = Matrix.GeneralLinearGroup.det
        (ρ.toHom (Multiplicative.ofAdd (1 : ℤ_[p]))) := by
  sorry

/-- `lift_not_continuous`: a discontinuous linear character on a countable product gives
rank-one dual-number matrices with the required reduction but no continuous lift (README 1.1). -/
example (p : ℕ) [Fact p.Prime] :
    ∃ f : (ℕ → ZMod p) →ₗ[ZMod p] ZMod p,
      ¬ Continuous f ∧
      ∃ ρ : Multiplicative (ℕ → ZMod p) →* GL (Fin 1) (DualNumber (ZMod p)),
        (∀ g, TrivSqZeroExt.fst
          ((ρ g : Matrix (Fin 1) (Fin 1) (DualNumber (ZMod p))) 0 0) = 1) ∧
        (∀ g, (ρ g : Matrix (Fin 1) (Fin 1) (DualNumber (ZMod p))) 0 0 =
          1 + TrivSqZeroExt.inr (f (Multiplicative.toAdd g))) ∧
        ¬ Continuous (fun g ↦ (ρ g : Matrix (Fin 1) (Fin 1) (DualNumber (ZMod p)))) := by
  sorry

/-- `phiP_not_of_Hom`: inversion kills every character of the whole semidirect product,
while its open product subgroup has infinitely many coordinate characters (README 2.1).
The induced topology is the product topology under the canonical pair coordinates. -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    ∃ φ : Multiplicative (ZMod 2) →* MulAut (Multiplicative (ℕ → ZMod p)),
      (∀ t x, φ t x = if t = 1 then x else x⁻¹) ∧
      (letI : TopologicalSpace
          (SemidirectProduct (Multiplicative (ℕ → ZMod p)) (Multiplicative (ZMod 2)) φ) :=
        TopologicalSpace.induced (fun x ↦ (x.left, x.right)) inferInstance
       ¬ PhiP p
          (SemidirectProduct (Multiplicative (ℕ → ZMod p)) (Multiplicative (ZMod 2)) φ) ∧
       ∀ f : SemidirectProduct (Multiplicative (ℕ → ZMod p)) (Multiplicative (ZMod 2)) φ →*
           Multiplicative (ZMod p),
         IsOpen (f.ker : Set
           (SemidirectProduct (Multiplicative (ℕ → ZMod p)) (Multiplicative (ZMod 2)) φ)) →
         f = 1) := by
  sorry

/-- `bigImage_GL2_F5`: the full general linear group contains the determinant-one subgroup
(README 5.2). -/
example : (Matrix.GeneralLinearGroup.det : GL (Fin 2) (ZMod 5) →* (ZMod 5)ˣ).ker ≤
    (⊤ : Subgroup (GL (Fin 2) (ZMod 5))) := le_top

/-- `bigImage_Borel_fails`: a lower transvection of determinant one witnesses failure of
containment in the upper triangular subgroup (README 5.2). -/
example :
    ∃ g : GL (Fin 2) (ZMod 5),
      Matrix.GeneralLinearGroup.det g = 1 ∧
      (g : Matrix (Fin 2) (Fin 2) (ZMod 5)) = !![1, 0; 1, 1] ∧
      (g : Matrix (Fin 2) (Fin 2) (ZMod 5)) 1 0 ≠ 0 := by
  sorry

/-- `bigImage_S3_fails`: the six-element subgroup generated by the standard `S₃` matrices
cannot contain the 120-element determinant-one subgroup (README 5.2). -/
example :
    let C : GL (Fin 2) (ZMod 5) :=
      ⟨!![0, -1; 1, -1], !![-1, 1; -1, 0], by decide, by decide⟩
    let S : GL (Fin 2) (ZMod 5) :=
      ⟨!![0, 1; 1, 0], !![0, 1; 1, 0], by decide, by decide⟩
    let H := Subgroup.closure ({C, S} : Set (GL (Fin 2) (ZMod 5)))
    let SL := (Matrix.GeneralLinearGroup.det : GL (Fin 2) (ZMod 5) →* (ZMod 5)ˣ).ker
    Nat.card H = 6 ∧ Nat.card SL = 120 ∧ ¬ SL ≤ H := by
  sorry

/-- `framingVars_rational`: the two KW frames over `ℚ` leave seven coordinates after the
single common scalar normalization (README 6.2). -/
example : (4 * 2 - 1 : ℤ) = 7 ∧ (3 + 4 : ℤ) = 7 := by
  decide

/-- `local_TW_odd`: reciprocal inertia characters both ramify and satisfy the tame relation
at residue cardinality eleven (README preliminary rank-two construction). -/
example :
    let ε : DualNumber (ZMod 5) := TrivSqZeroExt.inr 1
    let Φ : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 5)) := !![1, 0; 0, -1]
    let T : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 5)) := !![1 + ε, 0; 0, 1 - ε]
    Φ * T * Φ = T ^ 11 ∧ T.det = 1 ∧ T 0 0 ≠ 1 ∧ T 1 1 ≠ 1 := by
  sorry

/-- `local_TW_dyadic`: distinct cubic residual eigenvalues allow equal reciprocal,
nontrivial inertia characters in characteristic two (README preliminary local construction). -/
example {K : Type*} [Field K] [CharP K 2] (ω : K) (hω : ω ^ 3 = 1) (hne : ω ≠ 1) :
    let w : DualNumber K := TrivSqZeroExt.inl ω
    let ε : DualNumber K := TrivSqZeroExt.inr 1
    let Φ : Matrix (Fin 2) (Fin 2) (DualNumber K) := !![w, 0; 0, w ^ 2]
    let T := (1 + ε) • (1 : Matrix (Fin 2) (Fin 2) (DualNumber K))
    ω ≠ ω ^ 2 ∧ Φ * T = T ^ 7 * Φ ∧ T.det = 1 ∧ T ≠ 1 := by
  sorry

/-- `local_TW_repeated_fails`: repeated Frobenius eigenvalues admit non-diagonalizable
first-order nilpotent inertia (README preliminary local construction). -/
example :
    let ε : DualNumber (ZMod 5) := TrivSqZeroExt.inr 1
    let T : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 5)) := !![1, ε; 0, 1]
    T ^ 11 = T ∧
      ¬ ∃ b : GL (Fin 2) (DualNumber (ZMod 5)), ∃ d : Fin 2 → DualNumber (ZMod 5),
        (b : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 5))) * T *
          (b⁻¹ : GL (Fin 2) (DualNumber (ZMod 5))) = Matrix.diagonal d := by
  sorry

/-- `rankn_TW_independent_inertia`: unrestricted ACC lifts permit two ramified characters
with ramified determinant, excluded by either restrictive local condition (README 8.5). -/
example :
    let ε : DualNumber (ZMod 5) := TrivSqZeroExt.inr 1
    let Φ : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 5)) := !![1, 0; 0, -1]
    let T := (1 + ε) • (1 : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 5)))
    Φ * T * Φ = T ^ 11 ∧ T.det = 1 + 2 * ε ∧ T.det ≠ 1 ∧
      T 0 0 ≠ 1 ∧ T 1 1 ≠ 1 := by
  sorry

/-- `rankn_TW_reciprocity`: order-five character values differ from their inverses,
so changing reciprocity requires factorwise inversion (README 8.5). -/
example {K : Type*} [Field K] (ζ : K) (hζ : orderOf ζ = 5) : ζ ≠ ζ⁻¹ := by
  sorry

end Examples

/-!
Definitions specified in the README using the arithmetic and coefficient-category suppliers:
`ModDef`, `ModDefFramed`, `DetDef`, `PseudoDefRing`, `univLift`, `DeformationProblem`,
`DeformationType`, `TFramedDef`, `Rloc`, `locToGlobal`, `resRing`, `DiagGroup`, `RdetOnS`,
`detMap`, `twistAction`, inertia-rigid deformation rings, `TaylorWilesDatum`,
`IsCyclotomicAbsIrred`, `HasBigImage`, `HasNonsolvableImage`, `KWDeformationData`, `TWSystem`,
`DyadicPatchingDatum`, `GlobalDeformationProblem`, `PolarizedDeformationProblem`.
Their APIs also include `isSchur_baseChange` (§1.8) and `phiP_iff_fg` (§2.1).
-/

end TauCetiRoadmap.GlobalGaloisDeformations

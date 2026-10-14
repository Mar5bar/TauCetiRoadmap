import Mathlib
import TauCeti.RingTheory.DedekindDomain.SInteger.Unit
import TauCeti.Geometry.Hodge.Dimension
import TauCeti.Geometry.Hodge.Dual
import TauCeti.Geometry.Hodge.Prod
import TauCeti.Geometry.Hodge.Tate.Basic
import TauCeti.Geometry.Hodge.Tate.Twist
import TauCeti.RepresentationTheory.Homological.ContCohomology.Inflation.Basic

/-!
# Selmer groups and Iwasawa cohomology: suggested Lean forms

**This file is not the roadmap and it is not exhaustive.** `README.md` is definitive, and §k.n
below refers to its subsections. The file records light definitions with real bodies over
carriers that exist in the pinned Mathlib and Tau Ceti, the end theorems and layer milestones
that can be stated against them, and checks that fix the conventions. Theorems are stated with
`sorry` proofs; nothing here is claimed formalised, and proving every item does not by itself
complete a layer.

Design choices made explicit here:

* p-adic completion of an abelian group is Mathlib's `AdicCompletion` at the ideal `(p) ⊆ ℤ`
  (`pCompletion`); no second completion is defined.
* This roadmap owns S-unit rank and fundamental systems against Mathlib's `Set.unit` carrier,
  with `Nat.card S` and index type `Fin (NumberField.Units.rank K + Nat.card S)`.
  Finite generation is supplied by Tau Ceti's `Set.unit_fg` and `Set.unit_fg_of_units`;
  its multiplicative `Set.unitValuation`, `Set.unitValuation_ker` and `Set.unitEmptyEquivUnits`
  supply the valuation map and kernel. Coordinatewise `Multiplicative.toAdd` gives negative
  orders. Cardinality conversion and finite-type reindexing are adapters; completion and
  Kummer applications are the adapters of README §§0.3 and 0.9.
* Perfect pairings are Mathlib's `LinearMap.IsPerfPair`; annihilators are Mathlib's
  `Submodule.orthogonalBilin`. Double annihilators are stated for finite `ZMod n`-modules.
* The algebraic Selmer diagram `SelmerData` takes actual global and local modules and maps; its
  identification with continuous Galois cohomology is a README target.
* The Selmer-complex carrier takes an explicitly supplied local diagram. Its ordinary instance
  uses continuous cochains at every place; its modified instance uses finite-place cochains,
  complete Tate cochains at real places and zero at complex places, with localization composed
  with the ordinary-to-Tate maps. Arithmetic compact support and derived duality use the
  modified instance. The H⁰ correction uses the chosen diagram, and the archimedean comparison
  retains the difference between the two fibres even at odd p.
* ℤ_p-corank is computed on a compact dual (`corankFromDual`); Iwasawa corank is computed on
  each finite compact component dual (`iwasawaCorankFromComponentDual`).
* ℂ_p is Mathlib's `PadicComplex`; the Galois action is the continuous extension of the action on
  `PadicAlgCl` (`padicComplexGaloisAction`).
* Fontaine–Laffaille data are stated over a general ring with an automorphism; archimedean
  realizations extend Tau Ceti's opposed Hodge filtrations by a complex-linear Betti involution,
  and the L-function Tate line has Tau Ceti Hodge–Tate index `-n` and Gamma factor `Γℝ(s - n)`.

Selmer complexes, Iwasawa cohomology, determinant lines, étale cohomology of `Spec 𝒪_{F,S}`,
period rings beyond Mathlib's `BDeRham`, Selmer groups of elliptic curves and Hida families are
not available at the pins; their targets are stated in the README only (closing comment).
-/

noncomputable section

open scoped TensorProduct NumberField

namespace TauCetiRoadmap.SelmerIwasawaCohomology

/-! ## Layer 0: Completions and coefficient limits -/

section Completion

variable (p : ℕ) [Fact p.Prime]

/-- §0.1: the `p`-adic completion `Â = lim_m A/p^m A` of an abelian group (written additively), as
Mathlib's `AdicCompletion` for the ideal `(p) ⊆ ℤ`. For `A = Fˣ` (through `Additive`) this is
`lim_m Fˣ/(Fˣ)^{p^m}`. -/
abbrev pCompletion (A : Type*) [AddCommGroup A] : Type _ :=
  AdicCompletion (Ideal.span {(p : ℤ)}) A

/-- §0.1: the kernel of `A → Â` is `⋂_m p^m A`. -/
theorem ker_adicCompletion_of_span (A : Type*) [AddCommGroup A] :
    LinearMap.ker (AdicCompletion.of (Ideal.span {(p : ℤ)}) A) =
      ⨅ m : ℕ, (Ideal.span {(p : ℤ)} ^ m) • (⊤ : Submodule ℤ A) := sorry

/-- §0.1: `AdicCompletion (p) ℤ ≅ ℤ_p`, so that `Â` is a `ℤ_p`-module. -/
theorem adicCompletion_int_equiv_padicInt :
    Nonempty (AdicCompletion (Ideal.span {(p : ℤ)}) ℤ ≃+* ℤ_[p]) := sorry

/-- §0.2: for a number field `F`, `Ê_F → F̂ˣ` is injective, because a unit that is a `p^m`-th power
in `F` is the `p^m`-th power of a unit. -/
theorem units_pCompletion_injective (F : Type*) [Field F] [NumberField F] :
    Function.Injective (AdicCompletion.map (Ideal.span {(p : ℤ)})
      (MonoidHom.toAdditive (Units.map (algebraMap (𝓞 F) F).toMonoidHom) :
        Additive (𝓞 F)ˣ →+ Additive Fˣ).toIntLinearMap) :=
  sorry

/-- §0.2: a `p^m`-th root in the field of an integral unit is an integral unit. -/
theorem units_pow_of_pow_eq (F : Type*) [Field F] [NumberField F] (m : ℕ)
    (u : (𝓞 F)ˣ) (x : Fˣ)
    (hx : x ^ p ^ m = Units.map (algebraMap (𝓞 F) F).toMonoidHom u) :
    ∃ v : (𝓞 F)ˣ, Units.map (algebraMap (𝓞 F) F).toMonoidHom v = x := sorry

end Completion

section SUnits

variable {K : Type*} [Field K] [NumberField K]
    (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K)))

/-- §0.3: the module form of the pinned finite-generation theorem for `S.unit K`,
for a finite set `S` of finite places of a number field `K`. -/
theorem Set.unit_moduleFinite (hS : S.Finite) :
    Module.Finite ℤ (Additive (S.unit K)) := by
  have : Finite S := hS.to_subtype
  exact Module.Finite.iff_addGroup_fg.mpr
    (GroupFG.iff_add_fg.mp (_root_.Set.unit_fg_of_units S K))

/-- §0.3: for finite `S`, the free rank of Mathlib's `S.unit K` is the global unit rank plus
`Nat.card S`. The rank argument uses the additive transport of the pinned multiplicative
`Set.unitValuation` and its kernel, the global units. -/
theorem Set.unit_finrank_numberField (hS : S.Finite) :
    Module.finrank ℤ (Additive (S.unit K)) = NumberField.Units.rank K + Nat.card S := sorry

/-- §0.3: for finite `S`, a fundamental system of Mathlib's `S.unit K` indexed by
`Fin (NumberField.Units.rank K + Nat.card S)` gives unique integer exponents and a torsion factor
for every S-unit. -/
theorem Set.exists_unit_fundSystem (hS : S.Finite) :
    ∃ ε : Fin (NumberField.Units.rank K + Nat.card S) → S.unit K,
      ∀ x : S.unit K, ∃! e : Fin (NumberField.Units.rank K + Nat.card S) → ℤ,
        ∃ ζ ∈ CommGroup.torsion (S.unit K), x = ζ * ∏ i, ε i ^ e i := sorry

/-- §0.3: for finite `S`, a fundamental system gives each element of Mathlib's `S.unit K` a
unique pair of torsion factor and integer exponent vector on
`Fin (NumberField.Units.rank K + Nat.card S)`. -/
theorem Set.exists_unit_fundSystem' (hS : S.Finite) :
    ∃ ε : Fin (NumberField.Units.rank K + Nat.card S) → S.unit K,
      ∀ x : S.unit K, ∃! ζe : CommGroup.torsion (S.unit K) ×
          (Fin (NumberField.Units.rank K + Nat.card S) → ℤ),
        x = (ζe.1 : S.unit K) * ∏ i, ε i ^ ζe.2 i := sorry

/-- §0.3: the cardinality adapter expresses the canonical S-unit rank using `Set.ncard`. -/
theorem sUnits_finrank_ncard (hS : S.Finite) :
    Module.finrank ℤ (Additive (S.unit K)) = NumberField.Units.rank K + S.ncard := by
  simpa only [Nat.card_coe_set_eq] using Set.unit_finrank_numberField S hS

/-- §0.3: the reindexing adapter gives unique torsion factors and integer exponent vectors
on any finite type of the required cardinality. -/
theorem sUnits_fundSystem_reindex (hS : S.Finite) (I : Type*) [Fintype I]
    (hI : Fintype.card I = NumberField.Units.rank K + Nat.card S) :
    ∃ ε : I → S.unit K,
      ∀ x : S.unit K, ∃! ζe : CommGroup.torsion (S.unit K) × (I → ℤ),
        x = (ζe.1 : S.unit K) * ∏ i, ε i ^ ζe.2 i := sorry

end SUnits

section WeakSemisimplicity

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- §0.12: the natural map from fixed vectors to coinvariants of an endomorphism. -/
def invariantCoinvariantMap (σ : M →ₗ[R] M) :
    LinearMap.ker (σ - LinearMap.id) →ₗ[R] M ⧸ LinearMap.range (σ - LinearMap.id) :=
  (LinearMap.range (σ - LinearMap.id)).mkQ.comp (LinearMap.ker (σ - LinearMap.id)).subtype

/-- §0.12: weak semisimplicity at eigenvalue one means bijectivity of invariants to
coinvariants. -/
def IsWeaklySemisimple (σ : M →ₗ[R] M) : Prop := Function.Bijective (invariantCoinvariantMap σ)

/-- §0.12: the invariant and image submodules are complementary exactly when the natural map is
bijective. -/
theorem weaklySemisimple_iff_split (σ : M →ₗ[R] M) :
    IsWeaklySemisimple σ ↔ IsCompl (LinearMap.ker (σ - LinearMap.id))
      (LinearMap.range (σ - LinearMap.id)) := sorry

/-- §0.12: equivariant linear equivalences preserve weak semisimplicity. -/
theorem weaklySemisimple_congr {N : Type*} [AddCommGroup N] [Module R N]
    (σ : M →ₗ[R] M) (τ : N →ₗ[R] N) (e : M ≃ₗ[R] N)
    (h : e.toLinearMap.comp σ = τ.comp e.toLinearMap) :
    IsWeaklySemisimple σ ↔ IsWeaklySemisimple τ := sorry

/-- §0.12: weak semisimplicity holds on a product exactly when it holds on each factor. -/
theorem weaklySemisimple_sum {N : Type*} [AddCommGroup N] [Module R N]
    (σ : M →ₗ[R] M) (τ : N →ₗ[R] N) :
    IsWeaklySemisimple (σ.prodMap τ) ↔ IsWeaklySemisimple σ ∧ IsWeaklySemisimple τ := sorry

end WeakSemisimplicity

namespace Tests

/-- The size-two Jordan operator with a given rational eigenvalue. -/
def jordan (a : ℚ) : (ℚ × ℚ) →ₗ[ℚ] (ℚ × ℚ) where
  toFun x := (a * x.1 + x.2, a * x.2)
  map_add' := by intros; ext <;> simp <;> ring
  map_smul' := by intros; ext <;> simp <;> ring

/-- The trivial action is weakly semisimple. -/
example {M : Type*} [AddCommGroup M] [Module ℚ M] :
    IsWeaklySemisimple (LinearMap.id : M →ₗ[ℚ] M) := sorry

/-- The unipotent Jordan block sends its invariant line to zero in coinvariants. -/
example : ¬ IsWeaklySemisimple (jordan 1) := sorry

/-- A Jordan block away from eigenvalue one is weakly semisimple, though not semisimple. -/
example : IsWeaklySemisimple (jordan 2) := sorry

end Tests

namespace CompletionChecks

variable (p : ℕ) [Fact p.Prime]

/-- Completion kills a `p`-divisible group. -/
example : Subsingleton (pCompletion p ℚ) := sorry

/-- Prime-to-three finite torsion disappears in the quotient-tower completion. -/
example : Subsingleton (pCompletion 3 (ZMod 2)) := sorry

/-- An infinite free lattice has completed elements with infinite support. -/
example : ¬ Function.Surjective
    (AdicCompletion.ofTensorProduct (Ideal.span {(p : ℤ)}) (ℕ →₀ ℤ)) := sorry

/-- The integer completion map is injective, while every rational maps to zero. -/
example : Function.Injective (AdicCompletion.of (Ideal.span {(p : ℤ)}) ℤ) ∧
    ∀ x : ℚ, AdicCompletion.of (Ideal.span {(p : ℤ)}) ℚ x = 0 := sorry

/-- The identity operator sends each invariant to its unchanged quotient class. -/
example (x : LinearMap.ker ((LinearMap.id : ℚ →ₗ[ℚ] ℚ) - LinearMap.id)) :
    invariantCoinvariantMap (LinearMap.id : ℚ →ₗ[ℚ] ℚ) x =
      (LinearMap.range ((LinearMap.id : ℚ →ₗ[ℚ] ℚ) - LinearMap.id)).mkQ (x : ℚ) := rfl

/-- `ℚ` with no finite place in `S_f` has S-unit rank zero. -/
example : Module.finrank ℤ (Additive ((∅ : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ))).unit ℚ))
    = 0 := sorry

end CompletionChecks

/-! ## Layer 1: Orthogonal conditions and duality -/

section Orthogonal

variable {R : Type*} [CommRing R] {X X' Y : Type*} [AddCommGroup X] [Module R X]
  [AddCommGroup X'] [Module R X'] [AddCommGroup Y] [Module R Y]

/-- §1.1: the image rule for adjoint maps, `(π F)^⊥ = ι^{-1}(F^⊥)`. -/
theorem orthogonal_map_eq_comap {Z Z' : Type*} [AddCommGroup Z] [Module R Z] [AddCommGroup Z']
    [Module R Z'] (b : X →ₗ[R] X' →ₗ[R] Y) (bZ : Z →ₗ[R] Z' →ₗ[R] Y) (π : X →ₗ[R] Z)
    (ι : Z' →ₗ[R] X') (hadj : ∀ x z', bZ (π x) z' = b x (ι z')) (F : Submodule R X) :
    Submodule.orthogonalBilin bZ (F.map π) = (Submodule.orthogonalBilin b F).comap ι := by
  ext z'
  simp [Submodule.mem_orthogonalBilin, hadj]

end Orthogonal

section FiniteDuality

variable {n : ℕ} [NeZero n] {A B : Type*} [AddCommGroup A] [Module (ZMod n) A]
  [AddCommGroup B] [Module (ZMod n) B] [Finite A] [Finite B]

/-- §1.1: double annihilators recover a submodule for a perfect pairing of finite modules. -/
theorem orthogonal_orthogonal (b : A →ₗ[ZMod n] B →ₗ[ZMod n] ZMod n) (hb : b.IsPerfPair)
    (F : Submodule (ZMod n) A) :
    Submodule.orthogonalBilin b.flip (Submodule.orthogonalBilin b F) = F := sorry

/-- §1.1: the character-dual quotient pairing `(A/F) × F^⊥ → ℤ/n` is perfect. -/
theorem quotientPairing_perfect (b : A →ₗ[ZMod n] B →ₗ[ZMod n] ZMod n) (hb : b.IsPerfPair)
    (F : Submodule (ZMod n) A) :
    ∃ c : (A ⧸ F) →ₗ[ZMod n] (Submodule.orthogonalBilin b F) →ₗ[ZMod n] ZMod n,
      c.IsPerfPair ∧ ∀ x (y : Submodule.orthogonalBilin b F), c (F.mkQ x) y = b x y := sorry

/-- §1.1: for a perfect pairing of finite `ℤ/n`-modules, `#F · #F^⊥ = #A`. -/
theorem card_mul_card_orthogonal (b : A →ₗ[ZMod n] B →ₗ[ZMod n] ZMod n) (hb : b.IsPerfPair)
    (F : Submodule (ZMod n) A) :
    Nat.card F * Nat.card (Submodule.orthogonalBilin b F) = Nat.card A := sorry

end FiniteDuality

namespace PairingChecks

/-- A zero pairing on a nonzero space fails perfectness. -/
example : ¬ (0 : ℚ →ₗ[ℚ] ℚ →ₗ[ℚ] ℚ).IsPerfPair := sorry

/-- Nondegeneracy without surjectivity: `3xy` on `ℤ` is not perfect. -/
example : ¬ ((3 : ℤ) • LinearMap.mul ℤ ℤ).IsPerfPair := sorry

/-- A zero pairing has full annihilator for every condition. -/
example {R X X' Y : Type*} [CommRing R] [AddCommGroup X] [Module R X]
    [AddCommGroup X'] [Module R X'] [AddCommGroup Y] [Module R Y]
    (F : Submodule R X) : Submodule.orthogonalBilin (0 : X →ₗ[R] X' →ₗ[R] Y) F = ⊤ := sorry

end PairingChecks

/-! ## Layer 2: Selmer structures and complexes -/

section SelmerKernel

variable {R : Type*} [CommRing R] {ι : Type*}

/-- §2.1: global and local modules with localisation maps and local conditions
(Mazur–Rubin, Definitions 1.1 and 2.1). -/
structure SelmerData (R : Type*) [CommRing R] (ι : Type*) where
  /-- The global cohomology module, e.g. `H¹(G_{K,Σ}, M)`. -/
  glob : Type*
  [instAdd : AddCommGroup glob]
  [instMod : Module R glob]
  /-- The local cohomology modules, e.g. `H¹(K_v, M)`. -/
  loc : ι → Type*
  [instAddLoc : ∀ v, AddCommGroup (loc v)]
  [instModLoc : ∀ v, Module R (loc v)]
  /-- The localisation maps. -/
  res : ∀ v, glob →ₗ[R] loc v
  /-- The local conditions. -/
  cond : ∀ v, Submodule R (loc v)

attribute [instance] SelmerData.instAdd SelmerData.instMod SelmerData.instAddLoc
  SelmerData.instModLoc

namespace SelmerData

variable (D : SelmerData R ι)

/-- §2.2: the Selmer module `{c | res_v c ∈ L_v for all v}`. -/
def selmer : Submodule R D.glob := ⨅ v, (D.cond v).comap (D.res v)

/-- §2.2: membership in the Selmer module. -/
theorem mem_selmer (c : D.glob) : c ∈ D.selmer ↔ ∀ v, D.res v c ∈ D.cond v := by
  simp [selmer, Submodule.mem_iInf]

/-- §2.2: the Selmer module is the kernel of the product of the maps to `H¹(K_v)/L_v`. -/
theorem selmer_eq_ker :
    D.selmer = LinearMap.ker (LinearMap.pi fun v => (D.cond v).mkQ ∘ₗ D.res v) := sorry

/-- §2.1: the Selmer data with the conditions replaced. -/
def withCond (L : ∀ v, Submodule R (D.loc v)) : SelmerData R ι :=
  { D with cond := L }

/-- §2.2: monotonicity in the local conditions. -/
theorem selmer_mono {L L' : ∀ v, Submodule R (D.loc v)} (h : ∀ v, L v ≤ L' v) :
    (D.withCond L).selmer ≤ (D.withCond L').selmer := sorry

/-- §2.1: the relaxed condition at a set `B` of places. -/
def relax (B : Set ι) [DecidablePred (· ∈ B)] : SelmerData R ι :=
  D.withCond fun v => if v ∈ B then ⊤ else D.cond v

/-- §2.1: the strict condition at a set `A` of places. -/
def strict (A : Set ι) [DecidablePred (· ∈ A)] : SelmerData R ι :=
  D.withCond fun v => if v ∈ A then ⊥ else D.cond v

/-- §2.1: strict ≤ given ≤ relaxed. -/
theorem selmer_strict_le_le_relax (S : Set ι) [DecidablePred (· ∈ S)] :
    (D.strict S).selmer ≤ D.selmer ∧ D.selmer ≤ (D.relax S).selmer := sorry

/-- §2.3: the local quotient map from the larger Selmer module to `∏ L'_v/L_v`. -/
def changeConditionMap {L L' : ∀ v, Submodule R (D.loc v)} (_h : ∀ v, L v ≤ L' v) :
    (D.withCond L').selmer →ₗ[R]
      (∀ v, (L' v) ⧸ (L v).comap (L' v).subtype) :=
  LinearMap.pi fun v => ((L v).comap (L' v).subtype).mkQ.comp
    (LinearMap.codRestrict (L' v) ((D.res v).domRestrict (D.withCond L').selmer)
      (fun c => ((D.withCond L').mem_selmer c.val).mp c.property v))

/-- §2.3: exactness at the larger Selmer module; no surjectivity onto the local quotient is
claimed. -/
theorem exact_change_of_conditions {L L' : ∀ v, Submodule R (D.loc v)}
    (h : ∀ v, L v ≤ L' v) :
    LinearMap.ker (D.changeConditionMap h) =
      ((D.withCond L).selmer).comap ((D.withCond L').selmer).subtype := sorry

/-- §2.4: a map of Selmer data (compatible global and local maps sending conditions into
conditions) maps Selmer modules into Selmer modules. -/
theorem map_selmer_le (D' : SelmerData R ι) (f : D.glob →ₗ[R] D'.glob)
    (fv : ∀ v, D.loc v →ₗ[R] D'.loc v) (hcomm : ∀ v c, fv v (D.res v c) = D'.res v (f c))
    (hcond : ∀ v, (D.cond v).map (fv v) ≤ D'.cond v) :
    D.selmer.map f ≤ D'.selmer := sorry

end SelmerData

/-- §2.5: forward propagation of a local condition along a coefficient map, by image
(quotients `T ↠ T/IT`, `V → W`). -/
def propagateImage {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y] [Module R Y]
    (g : X →ₗ[R] Y) (L : Submodule R X) : Submodule R Y := L.map g

/-- §2.5: backward propagation by inverse image (submodules `T[I] ↪ T`, `T → V`). -/
def propagatePreimage {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y] [Module R Y]
    (g : X →ₗ[R] Y) (L : Submodule R Y) : Submodule R X := L.comap g

/-- §2.5: the relaxed condition propagates forwards along a surjection to the relaxed one. -/
theorem propagateImage_top {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y]
    [Module R Y] (g : X →ₗ[R] Y) (hg : Function.Surjective g) :
    propagateImage g (⊤ : Submodule R X) = ⊤ := sorry

/-- §2.5: the strict condition propagates backwards to the kernel. -/
theorem propagatePreimage_bot {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y]
    [Module R Y] (g : X →ₗ[R] Y) :
    propagatePreimage g (⊥ : Submodule R Y) = LinearMap.ker g := sorry

/-- §2.5: image and preimage form a Galois connection. -/
theorem propagate_gc {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y] [Module R Y]
    (g : X →ₗ[R] Y) (L₀ : Submodule R X) (L : Submodule R Y) :
    propagateImage g L₀ ≤ L ↔ L₀ ≤ propagatePreimage g L := Submodule.map_le_iff_le_comap

/-- §2.6: the preimage of a condition saturated for a nonzero integer is saturated for that
integer; the arithmetic statement uses an `E`-subspace `L_V` and every nonzero element of `O`. -/
theorem saturated_preimage {X Y : Type*} [AddCommGroup X] [Module ℤ X] [AddCommGroup Y]
    [Module ℚ Y] [Module ℤ Y] (g : X →ₗ[ℤ] Y) (LV : Submodule ℤ Y) (n : ℤ) (hn : n ≠ 0) (x : X)
    (hx : n • x ∈ propagatePreimage g LV) (hLV : ∀ y : Y, n • y ∈ LV → y ∈ LV) :
    x ∈ propagatePreimage g LV := sorry

end SelmerKernel

section Conditions

variable {R : Type*} [CommRing R] {H HI HQ : Type*} [AddCommGroup H] [Module R H]
  [AddCommGroup HI] [Module R HI] [AddCommGroup HQ] [Module R HQ]

/-- §2.7: `H¹_ur = ker(H¹(G, M) → H¹(I, M))` (Rubin Definition I.3.1). -/
def unramified (resI : H →ₗ[R] HI) : Submodule R H := LinearMap.ker resI

/-- §2.7: for a profinite group and closed normal inertia subgroup, the kernel of the actual
restriction map is the range of inflation from the quotient with invariant coefficients. -/
theorem unramified_eq_range_inflation (G : Type*) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (M : Type*) [AddCommGroup M] [TopologicalSpace M] [DiscreteTopology M]
    [IsTopologicalAddGroup M] [DistribMulAction G M] [ContinuousSMul G M]
    (I : Subgroup G) [I.Normal] (hI : IsClosed (I : Set G))
    [ContinuousSMul (G ⧸ I) (FixedPoints.addSubgroup I M)] :
    unramified (TauCeti.ContCohomology.explicitRes1 G M I).toIntLinearMap =
      LinearMap.range (TauCeti.ContCohomology.explicitInfl1 G M I).toIntLinearMap := sorry

/-- §2.7: with injective inflation from the Frobenius coinvariants `B/(σ - 1)B` of the inertia
invariants (the procyclic calculation), the unramified condition is these coinvariants. -/
theorem unramified_equiv_coinvariants {B : Type*} [AddCommGroup B] [Module R B]
    (σ : B →ₗ[R] B) (inf : (B ⧸ LinearMap.range (σ - LinearMap.id)) →ₗ[R] H)
    (hinf : Function.Injective inf) (resI : H →ₗ[R] HI) (hexact : Function.Exact inf resI) :
    Nonempty (unramified resI ≃ₗ[R] B ⧸ LinearMap.range (σ - LinearMap.id)) := sorry

/-- §2.8: `ker(H¹(G, M) → H¹(I, M/F⁺M))` for a `G`-stable `F⁺M`; stability is required under the
decomposition group only. -/
def greenberg (resQ : H →ₗ[R] HQ) : Submodule R H := LinearMap.ker resQ

/-- §2.8: with `F⁺M = 0` the Greenberg condition is the unramified one. -/
theorem greenberg_zero (resI : H →ₗ[R] HI) : greenberg resI = unramified resI := rfl

/-- §2.8: with `F⁺M = M` (so `H¹(I, M/F⁺M) = 0`) the Greenberg condition is relaxed. -/
theorem greenberg_top (resQ : H →ₗ[R] HQ) [Subsingleton HQ] : greenberg resQ = ⊤ := sorry

/-- §2.8: `H¹_ur ⊆ H¹_Gr` when `resQ` factors through `resI`. -/
theorem unramified_le_greenberg (resI : H →ₗ[R] HI) (resQ : H →ₗ[R] HQ) (π : HI →ₗ[R] HQ)
    (hπ : π ∘ₗ resI = resQ) : unramified resI ≤ greenberg resQ := sorry

end Conditions

section Ordinary

variable {E G V : Type*} [Field E] [Group G] [AddCommGroup V] [Module E V]
    [FiniteDimensional E V]

/-- §2.8a: a finite decreasing stable filtration whose inertia graded actions are the indexed
powers of the supplied cyclotomic character. -/
structure OrdinaryFiltration (ρ : Representation E G V) (I : Subgroup G) (χ : G →* Eˣ) where
  F : ℤ → Submodule E V
  antitone : Antitone F
  exhaustive : ∃ a, F a = ⊤
  separated : ∃ b, F b = ⊥
  stable : ∀ i g, (F i).map (ρ g) ≤ F i
  inertia : ∀ i (g : I) (x : F i),
    ρ (g : G) (x : V) - ((χ (g : G) ^ i : Eˣ) : E) • (x : V) ∈ F (i + 1)

/-- §2.8a: existence of an ordinary filtration on the given representation. -/
def IsOrdinary (ρ : Representation E G V) (I : Subgroup G) (χ : G →* Eˣ) : Prop :=
  Nonempty (OrdinaryFiltration ρ I χ)

/-- §2.8a: the positive ordinary subspace is the first filtration step. -/
def OrdinaryFiltration.plus {ρ : Representation E G V} {I : Subgroup G} {χ : G →* Eˣ}
    (D : OrdinaryFiltration ρ I χ) : Submodule E V := D.F 1

/-- The zero representation is ordinary. -/
example [Subsingleton V] (ρ : Representation E G V) (I : Subgroup G) (χ : G →* Eˣ) :
    IsOrdinary ρ I χ := sorry

/-- The line of character `χ^n` has its filtration jump at `n`. -/
example (ρ : Representation E G E) (I : Subgroup G) (χ : G →* Eˣ) (n : ℤ)
    (hρ : ∀ g x, ρ g x = ((χ g ^ n : Eˣ) : E) * x) :
    ∃ D : OrdinaryFiltration ρ I χ, ∀ i, D.F i = if i ≤ n then ⊤ else ⊥ := sorry

end Ordinary

/-! Pontryagin characters and coranks (§§2.10–2.11). -/

section Dual

/-- §2.10: the contragredient action `(g • f)(x) = f(g⁻¹ • x)`. -/
def contragredient {G M : Type*} [Group G] [TopologicalSpace M] [CommGroup M]
    [MulDistribMulAction G M] (hcont : ∀ g : G, Continuous fun x : M => g • x) (g : G)
    (f : PontryaginDual M) : PontryaginDual M :=
  ContinuousMonoidHom.comp f ⟨MulDistribMulAction.toMonoidHom M g⁻¹, hcont g⁻¹⟩

/-- §2.10: the contragredient action is a left action. -/
theorem contragredient_mul {G M : Type*} [Group G] [TopologicalSpace M] [CommGroup M]
    [MulDistribMulAction G M] (hcont : ∀ g : G, Continuous fun x : M => g • x) (g h : G)
    (f : PontryaginDual M) :
    contragredient hcont (g * h) f = contragredient hcont g (contragredient hcont h f) := sorry

/-- §2.11: the `ℤ_p`-corank `dim_{ℚ_p}(M^∨ ⊗ ℚ_p)` of a cofinitely generated discrete
`ℤ_p`-module, computed on its compact dual `N = M^∨`. -/
def corankFromDual (p : ℕ) [Fact p.Prime] (N : Type*) [AddCommGroup N] [Module ℤ_[p] N] : ℕ :=
  Module.finrank ℚ_[p] (ℚ_[p] ⊗[ℤ_[p]] N)

/-- §2.11: finite modules have corank zero. -/
theorem corankFromDual_finite (p : ℕ) [Fact p.Prime] (N : Type*) [AddCommGroup N]
    [Module ℤ_[p] N] [Finite N] : corankFromDual p N = 0 := sorry

/-- §2.11: additivity in short exact sequences of finitely generated modules. -/
theorem corankFromDual_add (p : ℕ) [Fact p.Prime] {N N' N'' : Type*} [AddCommGroup N]
    [Module ℤ_[p] N] [AddCommGroup N'] [Module ℤ_[p] N'] [AddCommGroup N''] [Module ℤ_[p] N'']
    [Module.Finite ℤ_[p] N'] (f : N →ₗ[ℤ_[p]] N') (g : N' →ₗ[ℤ_[p]] N'')
    (hf : Function.Injective f) (hg : Function.Surjective g) (hfg : Function.Exact f g) :
    corankFromDual p N' = corankFromDual p N + corankFromDual p N'' := sorry

/-- §2.11: the compact dual `ℤ_p^r` computes the corank `r` of `(ℚ_p/ℤ_p)^r`. -/
theorem corankFromDual_pi_padicInt (p : ℕ) [Fact p.Prime] (r : ℕ) :
    corankFromDual p (Fin r → ℤ_[p]) = r := sorry

end Dual

section DualStructure

variable {R : Type*} [CommRing R] {ι : Type*} {Y : Type*} [AddCommGroup Y] [Module R Y]

namespace SelmerData

/-- §2.13: the dual local conditions on `D'` (e.g. the data for `T^*`) under local pairings
`b v : H¹(K_v, T) × H¹(K_v, T^*) → Y`. -/
def dualCond (D D' : SelmerData R ι) (b : ∀ v, D.loc v →ₗ[R] D'.loc v →ₗ[R] Y) :
    ∀ v, Submodule R (D'.loc v) :=
  fun v => Submodule.orthogonalBilin (b v) (D.cond v)

/-- §2.13: the dual Selmer data: the global module and localisations of `D'` with the dual
conditions. -/
def dualOf (D D' : SelmerData R ι) (b : ∀ v, D.loc v →ₗ[R] D'.loc v →ₗ[R] Y) :
    SelmerData R ι :=
  D'.withCond (dualCond D D' b)

/-- §2.13: relaxing at `B` dualises to the strict condition at `B`, for perfect pairings into the
base ring. -/
theorem dualCond_relax (D D' : SelmerData R ι) (b : ∀ v, D.loc v →ₗ[R] D'.loc v →ₗ[R] R)
    (hb : ∀ v, (b v).IsPerfPair) (B : Set ι) [DecidablePred (· ∈ B)] (v : ι) (hv : v ∈ B) :
    dualCond (D.relax B) D' b v = ⊥ := sorry

/-- §2.13: dualising twice returns the conditions, for finite local modules. -/
theorem dualCond_dualCond {n : ℕ} [NeZero n] (D D' : SelmerData (ZMod n) ι)
    (b : ∀ v, D.loc v →ₗ[ZMod n] D'.loc v →ₗ[ZMod n] ZMod n)
    (hb : ∀ v, (b v).IsPerfPair) [∀ v, Finite (D.loc v)] [∀ v, Finite (D'.loc v)] (v : ι) :
    Submodule.orthogonalBilin (b v).flip (dualCond D D' b v) = D.cond v := sorry

end SelmerData

end DualStructure

namespace SelmerChecks

variable {R ι : Type*} [CommRing R]

/-- All relaxed conditions give the full global module. -/
example (D : SelmerData R ι) : (D.withCond fun _ => ⊤).selmer = ⊤ := sorry

/-- All strict conditions give the intersection of localization kernels. -/
example (D : SelmerData R ι) :
    (D.withCond fun _ => ⊥).selmer = ⨅ v, LinearMap.ker (D.res v) := sorry

/-- An empty index imposes no constraint. -/
example (D : SelmerData R Empty) : D.selmer = ⊤ := sorry

/-- Inverse image of zero under a zero map is everything; image of everything is zero. -/
example : propagatePreimage (0 : ℚ →ₗ[ℚ] ℚ) ⊥ = ⊤ ∧ propagateImage (0 : ℚ →ₗ[ℚ] ℚ) ⊤ = ⊥ :=
  sorry

/-- Forward propagation along a composite is the iterated image. -/
example {X Y Z : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y] [Module R Y]
    [AddCommGroup Z] [Module R Z] (h : X →ₗ[R] Y) (g : Y →ₗ[R] Z) (L : Submodule R X) :
    propagateImage (g ∘ₗ h) L = propagateImage g (propagateImage h L) := sorry

/-- Backward propagation along a composite reverses the order of preimages. -/
example {X Y Z : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y] [Module R Y]
    [AddCommGroup Z] [Module R Z] (h : X →ₗ[R] Y) (g : Y →ₗ[R] Z) (L : Submodule R Z) :
    propagatePreimage (g ∘ₗ h) L = propagatePreimage h (propagatePreimage g L) := sorry

/-- Identity inertia restriction gives the strict condition; a zero quotient restriction gives
the relaxed Greenberg condition. -/
example : unramified (LinearMap.id : ℚ →ₗ[ℚ] ℚ) = ⊥ ∧ greenberg (0 : ℚ →ₗ[ℚ] ℚ) = ⊤ := sorry

/-- Corank one uses the compact dual of the discrete divisible module; rank two distinguishes
corank from torsion length. -/
example (p : ℕ) [Fact p.Prime] :
    corankFromDual p ℤ_[p] = 1 ∧ corankFromDual p (Fin 2 → ℤ_[p]) = 2 := sorry

/-- The nonzero finite compact dual has corank zero under its natural residue action. -/
example (p : ℕ) [Fact p.Prime] :
    @corankFromDual p _ (ZMod p) _
      (Module.compHom (ZMod p) (PadicInt.toZMod : ℤ_[p] →+* ZMod p)) = 0 := sorry

/-- The contragredient pullback evaluates at the inverse group element. -/
example {G M : Type*} [Group G] [TopologicalSpace M] [CommGroup M]
    [MulDistribMulAction G M] (hc : ∀ g : G, Continuous fun x : M => g • x)
    (g : G) (f : PontryaginDual M) (x : M) : contragredient hc g f x = f (g⁻¹ • x) := rfl

/-- Identical local conditions give a zero change map. -/
example (D : SelmerData R ι) :
    D.changeConditionMap (L := D.cond) (L' := D.cond) (fun _ => le_rfl) = 0 := sorry

/-- A zero global module cannot surject onto a nonzero local-condition quotient. -/
example (D : SelmerData ℚ Unit) [Subsingleton D.glob] (h : ∃ x : D.loc (), x ≠ 0) :
    ¬ Function.Surjective
      (D.changeConditionMap (L := fun _ => ⊥) (L' := fun _ => ⊤) (fun _ => bot_le)) := sorry

/-- Dualizing strict conditions gives relaxed conditions even for a zero pairing. -/
example {Y : Type*} [AddCommGroup Y] [Module R Y] (D D' : SelmerData R ι)
    (b : ∀ v, D.loc v →ₗ[R] D'.loc v →ₗ[R] Y) (v : ι) :
    SelmerData.dualCond (D.withCond fun _ => ⊥) D' b v = ⊤ := sorry

end SelmerChecks

/-! ## Layer 3: Iwasawa cohomology, control and determinants

The Iwasawa carriers are README targets; the checks below fix the conventions of §§3.1, 3.7 and
3.14 numerically. -/

/-- §3.1: norm-compatible integer invariants cannot be divisible by every power of three, so the
corestriction limit of lattice `H⁰` vanishes. -/
example (x : ℤ) (h : ∀ n : ℕ, ∃ y : ℤ, x = 3 ^ n * y) : x = 0 := by
  obtain ⟨y, hy⟩ := h x.natAbs
  refine Int.eq_zero_of_dvd_of_natAbs_lt_natAbs ⟨y, hy⟩ ?_
  rw [Int.natAbs_pow]
  exact Nat.lt_pow_self (by norm_num)

/-- §3.7: at `k = 1` and `χ(γ) = 4`, the cup twist has inverse scalar `1/4`, not `4`. -/
example : ((4 : ℚ) ^ (-1 : ℤ)) * 4 = 1 ∧ (4 : ℚ) * 4 ≠ 1 := by norm_num

/-- §3.14: degree two contributes positively and degree one negatively to the
inverse-determinant divisor. -/
example (length : ℤ) : (-1 : ℤ) ^ 2 * length = length ∧ (-1 : ℤ) ^ 1 * length = -length := by
  constructor <;> ring

/-! ## Layer 4: Finite conditions and arithmetic applications -/

section PadicComplex

variable (p : ℕ) [Fact p.Prime]

/-- §4.1: every `ℚ_p`-automorphism of `PadicAlgCl p` is an isometry for the spectral norm. -/
theorem PadicAlgCl.norm_algEquiv_apply (σ : PadicAlgCl p ≃ₐ[ℚ_[p]] PadicAlgCl p)
    (x : PadicAlgCl p) : ‖σ x‖ = ‖x‖ := sorry

/-- §4.1: the action of a Galois automorphism on `ℂ_p`, by continuous extension from
`PadicAlgCl p`. -/
def padicComplexGaloisAction (σ : PadicAlgCl p ≃ₐ[ℚ_[p]] PadicAlgCl p) : ℂ_[p] → ℂ_[p] :=
  UniformSpace.Completion.map σ

/-- §4.1: the extension is an isometric `ℚ_p`-algebra automorphism of `ℂ_p` extending `σ`. -/
theorem padicComplexGaloisAction_spec (σ : PadicAlgCl p ≃ₐ[ℚ_[p]] PadicAlgCl p) :
    ∃ τ : ℂ_[p] ≃ₐ[ℚ_[p]] ℂ_[p], ⇑τ = padicComplexGaloisAction p σ ∧ Isometry τ ∧
      ∀ x : PadicAlgCl p, τ x = σ x := sorry

/-- The identity Galois automorphism extends to the identity of the completed carrier. -/
example (x : ℂ_[p]) :
    padicComplexGaloisAction p (AlgEquiv.refl : PadicAlgCl p ≃ₐ[ℚ_[p]] PadicAlgCl p) x = x := sorry

/-- Every extended Galois action fixes the base field. -/
example (σ : PadicAlgCl p ≃ₐ[ℚ_[p]] PadicAlgCl p) (x : ℚ_[p]) :
    padicComplexGaloisAction p σ (algebraMap ℚ_[p] ℂ_[p] x) =
      algebraMap ℚ_[p] ℂ_[p] x := sorry

/-- An automorphism changing a square root of `p` has a nonidentity completed action. -/
example (hp : p ≠ 2) (σ : PadicAlgCl p ≃ₐ[ℚ_[p]] PadicAlgCl p) (x : PadicAlgCl p)
    (hx : x ^ 2 = (p : PadicAlgCl p)) (hσ : σ x = -x) :
    padicComplexGaloisAction p σ (x : ℂ_[p]) = (-x : PadicAlgCl p) ∧
      padicComplexGaloisAction p σ (x : ℂ_[p]) ≠ (x : ℂ_[p]) := sorry

/-- §4.1, Ax–Sen–Tate: for `K/ℚ_p` finite inside `PadicAlgCl p`, the `G_K`-invariants of `ℂ_p`
are `K`. -/
theorem padicComplex_fixed_eq (K : IntermediateField ℚ_[p] (PadicAlgCl p))
    [FiniteDimensional ℚ_[p] K] (x : ℂ_[p]) :
    (∀ σ : PadicAlgCl p ≃ₐ[K] PadicAlgCl p,
        padicComplexGaloisAction p (σ.restrictScalars ℚ_[p]) x = x) ↔
      ∃ k : K, x = ((k : PadicAlgCl p) : ℂ_[p]) := sorry

/-- §4.1, Tate: `H⁰(G_K, ℂ_p(i)) = 0` for `i ≠ 0`: no nonzero `x` satisfies
`σ(x) = χ(σ)^{-i} x` for every `σ ∈ G_K`. -/
theorem tate_H0_padicComplex_twist (K : IntermediateField ℚ_[p] (PadicAlgCl p))
    [FiniteDimensional ℚ_[p] K] (i : ℤ) (hi : i ≠ 0) (x : ℂ_[p])
    (hx : ∀ σ : PadicAlgCl p ≃ₐ[K] PadicAlgCl p,
      padicComplexGaloisAction p (σ.restrictScalars ℚ_[p]) x =
        (((cyclotomicCharacter (PadicAlgCl p) p σ.toRingEquiv ^ (-i) : ℤ_[p]ˣ) : ℤ_[p]) :
          ℚ_[p]) • x) :
    x = 0 := sorry

end PadicComplex

section FontaineLaffaille

/-- §4.6: filtered Frobenius data with semilinear divided maps and generation. The arithmetic
statements take `W = W(k)` with `σ` the Witt Frobenius, `p > 2` and small weights. -/
structure FontaineLaffailleModule (W : Type*) [CommRing W] (p : ℕ) (σ : W ≃+* W)
    (M : Type*) [AddCommGroup M] [Module W M] [Module.Finite W M] where
  /-- The decreasing filtration `Fil^i M`. -/
  F : ℤ → Submodule W M
  antitone : Antitone F
  exhaustive : ∃ a, F a = ⊤
  separated : ∃ b, F b = ⊥
  /-- The divided Frobenius maps `φ_i : Fil^i M → M`. -/
  φ : ∀ i, F i →ₛₗ[σ.toRingHom] M
  divided : ∀ (i : ℤ) (x : F (i + 1)),
    φ i ⟨x, antitone (by omega) x.property⟩ = p • φ (i + 1) x
  generation : Submodule.span W (⋃ i, Set.range (φ i)) = ⊤

/-- §4.6: free objects have split filtration steps. -/
def IsFreeFontaineLaffaille {W M : Type*} [CommRing W] [AddCommGroup M] [Module W M]
    [Module.Finite W M] {p : ℕ} {σ : W ≃+* W} (D : FontaineLaffailleModule W p σ M) : Prop :=
  Module.Free W M ∧ ∀ i : ℤ, ∃ N : Submodule W M, IsCompl (D.F i) N

/-- §4.6: support in the closed filtration interval `[a, b]`. -/
def fontaineLaffaille_interval {W M : Type*} [CommRing W] [AddCommGroup M] [Module W M]
    [Module.Finite W M] {p : ℕ} {σ : W ≃+* W} (D : FontaineLaffailleModule W p σ M) (a b : ℤ) :
    Prop :=
  D.F a = ⊤ ∧ D.F (b + 1) = ⊥

/-- §4.6: a linear map preserving the filtration and the divided semilinear Frobenius maps. -/
structure FontaineLaffailleHom {W M N : Type*} [CommRing W]
    [AddCommGroup M] [Module W M] [AddCommGroup N] [Module W N]
    [Module.Finite W M] [Module.Finite W N] {p : ℕ} {σ : W ≃+* W}
    (D : FontaineLaffailleModule W p σ M) (D' : FontaineLaffailleModule W p σ N) where
  /-- The underlying linear map. -/
  map : M →ₗ[W] N
  filtration : ∀ i, (D.F i).map map ≤ D'.F i
  frobenius : ∀ i (x : D.F i),
    map (D.φ i x) = D'.φ i ⟨map x, filtration i (Submodule.mem_map_of_mem x.property)⟩

end FontaineLaffaille

namespace Tests

/-- The zero module admits the zero filtration in every interval. -/
example (a b : ℤ) : ∃ D : FontaineLaffailleModule ℤ 3 (RingEquiv.refl ℤ) (Fin 0 → ℤ),
    fontaineLaffaille_interval D a b := sorry

/-- The proper step `3ℤ` cannot occur in a free split-filtration object. -/
example (D : FontaineLaffailleModule ℤ 3 (RingEquiv.refl ℤ) ℤ)
    (hD : IsFreeFontaineLaffaille D) : D.F 1 ≠ Ideal.span {(3 : ℤ)} := sorry

/-- The unit weight-zero object; generation excludes `φ₀ = 0` on a nonzero module. -/
example : (∃ D : FontaineLaffailleModule ℤ 3 (RingEquiv.refl ℤ) ℤ,
    fontaineLaffaille_interval D 0 0 ∧ ∀ x : D.F 0, D.φ 0 x = x) ∧
    ∀ D : FontaineLaffailleModule ℤ 3 (RingEquiv.refl ℤ) ℤ, ¬ (∀ i (x : D.F i), D.φ i x = 0) :=
  sorry

/-- A nonzero object has no support in a reversed interval. -/
example (D : FontaineLaffailleModule ℤ 3 (RingEquiv.refl ℤ) ℤ) :
    ¬ fontaineLaffaille_interval D 1 0 := sorry

/-- The same filtration with Frobenius `1` and `2` over `ℤ₃`: the underlying identity is not a
morphism. -/
example : ∃ D D' : FontaineLaffailleModule ℤ_[3] 3 (RingEquiv.refl ℤ_[3]) ℤ_[3],
    fontaineLaffaille_interval D 0 0 ∧ fontaineLaffaille_interval D' 0 0 ∧
    (∀ x : D.F 0, D.φ 0 x = x) ∧ (∀ x : D'.F 0, D'.φ 0 x = 2 * (x : ℤ_[3])) ∧
    ¬ (∃ f : FontaineLaffailleHom D D', f.map = LinearMap.id) := sorry

/-- Identity and zero maps are morphisms on every object. -/
example {W M : Type*} [CommRing W] [AddCommGroup M] [Module W M]
    [Module.Finite W M] {p : ℕ} {σ : W ≃+* W} (D : FontaineLaffailleModule W p σ M) :
    (∃ f : FontaineLaffailleHom D D, f.map = LinearMap.id) ∧
      ∃ f : FontaineLaffailleHom D D, f.map = 0 := sorry

end Tests

section Archimedean

/-- §4.13: Tau Ceti's opposed Hodge structure together with a complex-linear real Betti involution
commuting with the coefficient conjugation and exchanging the Hodge pieces. -/
structure ArchimedeanRealization (W : Type*) [AddCommGroup W] [Module ℂ W]
    [FiniteDimensional ℂ W] (ω : TauCeti.Hodge.Conjugation W) (w : ℤ) where
  /-- The Hodge structure. -/
  hodge : TauCeti.Hodge.HodgeStructureOn W ω w
  /-- The Betti involution `F∞`. -/
  FInfty : W ≃ₗ[ℂ] W
  involutive : Function.Involutive FInfty
  commute : ∀ x, FInfty (ω.toEquiv x) = ω.toEquiv (FInfty x)
  exchange : ∀ a, (hodge.piece a).map FInfty.toLinearMap = hodge.piece (w - a)

variable {W : Type*} [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ W]
  {ω : TauCeti.Hodge.Conjugation W} {w : ℤ}

/-- §4.13: the factorwise conjugation of a product, as required by Tau Ceti's
`TauCeti.Hodge.HodgeStructureOn.prod`. -/
def productConjugation {U : Type*} [AddCommGroup U] [Module ℂ U]
    (ω : TauCeti.Hodge.Conjugation W) (ω' : TauCeti.Hodge.Conjugation U) :
    TauCeti.Hodge.Conjugation (W × U) where
  toEquiv := {
    toFun := fun x => (ω.toEquiv x.1, ω'.toEquiv x.2)
    invFun := fun x => (ω.toEquiv.symm x.1, ω'.toEquiv.symm x.2)
    left_inv := by intro x; ext <;> simp
    right_inv := by intro x; ext <;> simp
    map_add' := by intro x y; ext <;> simp
    map_smul' := by
      intro r x
      exact Prod.ext (LinearMap.map_smulₛₗ ω.toEquiv.toLinearMap r x.1)
        (LinearMap.map_smulₛₗ ω'.toEquiv.toLinearMap r x.2) }
  involutive := by intro x; ext <;> simp

/-- §4.13: the direct sum carries Tau Ceti's product Hodge structure and the product of the two
Betti involutions. -/
theorem archRealization_sum {U : Type*} [AddCommGroup U] [Module ℂ U] [FiniteDimensional ℂ U]
    {ω' : TauCeti.Hodge.Conjugation U} (A : ArchimedeanRealization W ω w)
    (B : ArchimedeanRealization U ω' w) :
    ∃ C : ArchimedeanRealization (W × U) (productConjugation ω ω') w,
      C.hodge = A.hodge.prod B.hodge (fun _ => rfl) ∧
      C.FInfty = A.FInfty.prodCongr B.FInfty := sorry

/-- §4.13: the Tate dual uses Tau Ceti's Hodge dual and Tate twist and the negative transpose of
the Betti involution. -/
theorem archRealization_tateDual (A : ArchimedeanRealization W ω w) :
    ∃ D : ArchimedeanRealization (Module.Dual ℂ W) ω.dual (2 - w),
      HEq D.hodge (A.hodge.dual.tateTwist (-1)) ∧
      D.FInfty.toLinearMap = -A.FInfty.dualMap.toLinearMap := sorry

/-- §4.13: forget the Betti involution. -/
def archRealization_hodgeCarrier (A : ArchimedeanRealization W ω w) :
    TauCeti.Hodge.HodgeStructureOn W ω w :=
  A.hodge

/-- §4.13: multiplicity of the eigenvalue `(-1)^(a+ε)` on the diagonal Hodge piece. -/
def archRealization_diagonalMultiplicity (A : ArchimedeanRealization W ω w) (a : ℤ)
    (ε : Fin 2) : ℕ :=
  Module.finrank ℂ ((A.hodge.piece a ⊓ LinearMap.ker
    (A.FInfty.toLinearMap - ((-1 : ℂ) ^ (a + ε.val)) • LinearMap.id)) : Submodule ℂ W)

/-- §4.14: a real or complex Deligne Gamma factor with its integral shift. -/
inductive ShiftedGamma where
  | real (shift : ℤ)
  | complex (shift : ℤ)
  deriving DecidableEq

/-- §4.14: the real-place factors from paired off-diagonal pieces and the two diagonal Betti
eigenspaces. -/
def hodgeGammaFactors (A : ArchimedeanRealization W ω w) : List (ShiftedGamma × ℕ) := by
  classical
  exact A.hodge.finite_setOf_hodgeNumber_ne_zero.toFinset.toList.flatMap fun a =>
    if a < w - a then [(.complex (-a), A.hodge.hodgeNumber a)]
    else if 2 * a = w then
      [(.real (-a), archRealization_diagonalMultiplicity A a 0),
       (.real (1 - a), archRealization_diagonalMultiplicity A a 1)]
    else []

/-- §4.14: the complex-place factors, one per Hodge type with shift minus its smaller index. -/
def complexHodgeGammaFactors (H : TauCeti.Hodge.HodgeStructureOn W ω w) :
    List (ShiftedGamma × ℕ) := by
  classical
  exact H.finite_setOf_hodgeNumber_ne_zero.toFinset.toList.map fun a =>
    (.complex (-min a (w - a)), H.hodgeNumber a)

/-- §4.14: the factor-only product on separate multisets of complex shifts. -/
def gammaShiftProduct (gammaR gammaC : Multiset ℂ) (s : ℂ) : ℂ :=
  (gammaR.map fun μ => Complex.Gammaℝ (s + μ)).prod *
    (gammaC.map fun ν => Complex.Gammaℂ (s + ν)).prod

/-- §4.14: the finite number of real and complex Gamma poles, counting multiset multiplicity. -/
def gammaShiftPoleCount (gammaR gammaC : Multiset ℂ) (s : ℂ) : ℕ := by
  classical
  exact (gammaR.filter fun μ => ∃ n : ℕ, s + μ = -(2 * (n : ℂ))).card +
    (gammaC.filter fun ν => ∃ n : ℕ, s + ν = -(n : ℂ)).card

/-- §4.14: every finite shifted Gamma product is meromorphic. -/
theorem gammaShiftProduct_meromorphic (gammaR gammaC : Multiset ℂ) :
    Meromorphic (gammaShiftProduct gammaR gammaC) := sorry

/-- §4.14: the meromorphic germ is nonzero, even at a totalized zero value. -/
theorem gammaShiftProduct_nonzero_germ (gammaR gammaC : Multiset ℂ) (s : ℂ) :
    meromorphicOrderAt (gammaShiftProduct gammaR gammaC) s ≠ ⊤ := sorry

/-- §4.14: the analytic order of the factor-only product is the negative finite pole count. -/
theorem gammaPoleOrder_analytic (gammaR gammaC : Multiset ℂ) (s : ℂ) :
    meromorphicOrderAt (gammaShiftProduct gammaR gammaC) s =
      (-(gammaShiftPoleCount gammaR gammaC s : ℤ) : WithTop ℤ) := sorry

/-- §4.14: expand weighted integral shifts into separate complex-shift multisets,
retaining the `s + shift` sign. -/
def hodgeGammaShifts (factors : List (ShiftedGamma × ℕ)) : Multiset ℂ × Multiset ℂ :=
  factors.foldr (fun f shifts =>
    match f.1 with
    | .real a => (Multiset.replicate f.2 (a : ℂ) + shifts.1, shifts.2)
    | .complex a => (shifts.1, Multiset.replicate f.2 (a : ℂ) + shifts.2)) (0, 0)

/-- §4.14: the product of weighted real and complex Gamma factors with integral shifts. -/
def hodgeGammaFactor (factors : List (ShiftedGamma × ℕ)) (s : ℂ) : ℂ :=
  (factors.map fun f =>
    (match f.1 with
     | .real a => Complex.Gammaℝ (s + (a : ℂ))
     | .complex a => Complex.Gammaℂ (s + (a : ℂ))) ^ f.2).prod

/-- §4.14: expansion of multiplicities identifies the weighted product with the factor-only
shift product, including totalized values. -/
theorem hodgeGammaFactor_eq_shiftProduct (f : List (ShiftedGamma × ℕ)) (s : ℂ) :
    hodgeGammaFactor f s = gammaShiftProduct (hodgeGammaShifts f).1 (hodgeGammaShifts f).2 s :=
  sorry

/-- §4.14: the integer pole count for a weighted factor list, interpreted through the analytic
order theorem for the shift product. -/
def gammaPoleOrder (factors : List (ShiftedGamma × ℕ)) (m : ℤ) : ℕ :=
  (factors.map fun f =>
    match f.1 with
    | .real a => if m + a ≤ 0 ∧ (m + a) % 2 = 0 then f.2 else 0
    | .complex a => if m + a ≤ 0 then f.2 else 0).sum

/-- §4.14: concatenating weighted lists multiplies their Gamma products. -/
theorem gammaFactor_sum (f g : List (ShiftedGamma × ℕ)) (s : ℂ) :
    hodgeGammaFactor (f ++ g) s = hodgeGammaFactor f s * hodgeGammaFactor g s := sorry

/-- §4.14: concatenating weighted lists adds their integer pole counts. -/
theorem gammaPoleOrder_sum (f g : List (ShiftedGamma × ℕ)) (m : ℤ) :
    gammaPoleOrder (f ++ g) m = gammaPoleOrder f m + gammaPoleOrder g m := sorry

/-- §4.14: the analytic order of the real-place Hodge product is the negative integer pole
count, obtained from the factor-only Gamma theorem. -/
theorem gammaPoleOrder_hodge_analytic (A : ArchimedeanRealization W ω w) (m : ℤ) :
    meromorphicOrderAt (hodgeGammaFactor (hodgeGammaFactors A)) (m : ℂ) =
      (-(gammaPoleOrder (hodgeGammaFactors A) m : ℤ) : WithTop ℤ) := sorry

/-- §4.13: Tau Ceti's lattice conjugation on the Tate line. -/
abbrev standardConjugation : TauCeti.Hodge.Conjugation ℂ :=
  TauCeti.Hodge.latticeConjugation TauCeti.Hodge.isBaseChange_tateLatticeMap

/-- §4.13: RJW's L-function convention uses Tau Ceti's Hodge Tate object with index `-n`; only
the weight transport is new. -/
def tateHodge (n : ℤ) : TauCeti.Hodge.HodgeStructureOn ℂ standardConjugation (2 * n) := by
  have h : -2 * (-n) = 2 * n := by ring
  exact h ▸ (TauCeti.Hodge.tate (-n))

/-- §4.13: the transported Tate object has its sole Hodge type `(n, n)`. -/
theorem tateHodge_number (n a : ℤ) :
    (tateHodge n).hodgeNumber a = if a = n then 1 else 0 := sorry

/-- §4.13: complex-linear multiplication by `(-1)^n` is the real Betti involution of the Tate
line. -/
def tateArchimedean (n : ℤ) : ArchimedeanRealization ℂ standardConjugation (2 * n) where
  hodge := tateHodge n
  FInfty := LinearEquiv.ofInvolutive
    (((-1 : ℂ) ^ n) • (LinearMap.id : ℂ →ₗ[ℂ] ℂ)) (by
      intro x
      simp [neg_one_zpow_eq_ite]
      split <;> simp)
  involutive := by
    intro x
    change (-1 : ℂ) ^ n • ((-1 : ℂ) ^ n • x) = x
    simp [neg_one_zpow_eq_ite]
    split <;> simp
  commute := by
    intro x
    change (-1 : ℂ) ^ n • standardConjugation.toEquiv x =
      standardConjugation.toEquiv ((-1 : ℂ) ^ n • x)
    by_cases h : Even n <;> simp [neg_one_zpow_eq_ite, h]
  exchange := by
    intro a
    change ((tateHodge n).piece a).map
      (((-1 : ℂ) ^ n) • (LinearMap.id : ℂ →ₗ[ℂ] ℂ)) = (tateHodge n).piece (2 * n - a)
    rw [Submodule.map_smul _ _ _ (zpow_ne_zero n (by norm_num)), Submodule.map_id]
    by_cases h : a = n
    · subst a
      congr 1
      omega
    · have h' : 2 * n - a ≠ n := by omega
      have ha : (tateHodge n).piece a = ⊥ := Submodule.finrank_eq_zero.mp (by
        simpa [TauCeti.Hodge.HodgeStructureOn.hodgeNumber_def, h] using tateHodge_number n a)
      have hb : (tateHodge n).piece (2 * n - a) = ⊥ := Submodule.finrank_eq_zero.mp (by
        simpa [TauCeti.Hodge.HodgeStructureOn.hodgeNumber_def, h'] using
          tateHodge_number n (2 * n - a))
      rw [ha, hb]

/-- §4.14: the real-place Hodge product of the Tate line is `Γℝ(s - n)`. -/
theorem gamma_tate_factor (n : ℤ) (s : ℂ) :
    hodgeGammaFactor (hodgeGammaFactors (tateArchimedean n)) s = Complex.Gammaℝ (s - n) := sorry

/-- §4.15: the pole count at one for the real-place Hodge realization. -/
def poleOrderAtOne (A : ArchimedeanRealization W ω w) : ℕ :=
  gammaPoleOrder (hodgeGammaFactors A) 1

/-- §4.14: the Tate-dual factors computed from the primal Hodge pieces and signs: an off-diagonal
`(a, b)` with `a < b` dualizes to `(1 - b, 1 - a)`, and a diagonal sign `ε` stays `ε`. -/
def tateDualHodgeGammaFactors (A : ArchimedeanRealization W ω w) :
    List (ShiftedGamma × ℕ) := by
  classical
  exact A.hodge.finite_setOf_hodgeNumber_ne_zero.toFinset.toList.flatMap fun a =>
    if a < w - a then [(.complex (w - a - 1), A.hodge.hodgeNumber a)]
    else if 2 * a = w then
      [(.real (a - 1), archRealization_diagonalMultiplicity A a 0),
       (.real a, archRealization_diagonalMultiplicity A a 1)]
    else []

/-- §4.14: the computed dual factors agree, up to order, with the actual Tate-dual realization. -/
theorem tateDualHodgeGammaFactors_eq (A : ArchimedeanRealization W ω w)
    (D : ArchimedeanRealization (Module.Dual ℂ W) ω.dual (2 - w))
    (hH : HEq D.hodge (A.hodge.dual.tateTwist (-1)))
    (hF : D.FInfty.toLinearMap = -A.FInfty.dualMap.toLinearMap) :
    (hodgeGammaFactors D).Perm (tateDualHodgeGammaFactors A) := sorry

/-- §4.15: Greenberg criticality: no pole at `s = 1` for the realization and its Tate dual. -/
def IsGreenbergCritical (A : ArchimedeanRealization W ω w) : Prop :=
  poleOrderAtOne A = 0 ∧ gammaPoleOrder (tateDualHodgeGammaFactors A) 1 = 0

/-- §4.15: the Gamma factor computed from the explicit Hodge and Betti realization. -/
def gammaFactor (A : ArchimedeanRealization W ω w) (s : ℂ) : ℂ :=
  hodgeGammaFactor (hodgeGammaFactors A) s

/-- §4.15: the Tate line has a pole at one exactly for positive odd twists. -/
theorem poleOrderAtOne_tateTwist (n : ℤ) :
    poleOrderAtOne (tateArchimedean n) = if n % 2 = 1 ∧ 1 ≤ n then 1 else 0 := sorry

/-- §4.15: Tate criticality is positive even or negative odd, excluding the trivial twist. -/
theorem isGreenbergCritical_tateTwist_iff (n : ℤ) :
    IsGreenbergCritical (tateArchimedean n) ↔
      ((n % 2 = 0 ∧ 2 ≤ n) ∨ (n % 2 = 1 ∧ n ≤ -1)) := sorry

/-- §4.13: negate the Betti involution on the same Hodge filtration. -/
def oppositeRealSign (A : ArchimedeanRealization W ω w) :
    ArchimedeanRealization W ω w where
  hodge := A.hodge
  FInfty := LinearEquiv.ofInvolutive (-A.FInfty.toLinearMap) (by
    intro x
    simp only [LinearMap.neg_apply, LinearEquiv.coe_coe, map_neg, neg_neg]
    exact A.involutive x)
  involutive := by
    intro x
    change -A.FInfty (-A.FInfty x) = x
    simp only [map_neg, neg_neg]
    exact A.involutive x
  commute := by
    intro x
    change -A.FInfty (ω.toEquiv x) = ω.toEquiv (-A.FInfty x)
    rw [map_neg, A.commute]
  exchange := by
    intro a
    change (A.hodge.piece a).map (-A.FInfty.toLinearMap) = _
    rw [Submodule.map_neg, A.exchange]

end Archimedean

namespace Tests

/-- §4.15: twists `2` and `-1` are critical, the trivial twist is not, and twist `1` has a pole at
one. -/
example : IsGreenbergCritical (tateArchimedean 2) ∧ IsGreenbergCritical (tateArchimedean (-1)) ∧
    ¬ IsGreenbergCritical (tateArchimedean 0) ∧ poleOrderAtOne (tateArchimedean 1) = 1 := sorry

/-- §4.14: the empty-list adapter gives two empty shift multisets, unit product and
zero integer count. -/
example (s : ℂ) : hodgeGammaShifts [] = (0, 0) ∧
    hodgeGammaFactor [] s = 1 ∧ gammaPoleOrder [] 0 = 0 := by
  simp [hodgeGammaShifts, hodgeGammaFactor, gammaPoleOrder]

/-- §4.14: the adapter preserves negative shifts, repeats multiplicities, separates factor
kinds and discards zero multiplicities. -/
example : hodgeGammaShifts [(.real (-2), 2), (.complex 1, 1), (.real 4, 0)] =
    (Multiset.replicate 2 (-2 : ℂ), {1}) := by
  simp [hodgeGammaShifts]

/-- §4.14: the empty generic product has unit value and analytic order zero. -/
example (s : ℂ) : gammaShiftProduct 0 0 s = 1 ∧
    meromorphicOrderAt (gammaShiftProduct 0 0) s = 0 := sorry

/-- §4.14: coincident real and complex poles add their multiplicities. -/
example : meromorphicOrderAt (gammaShiftProduct {0, 0} {0}) 0 = (-3 : WithTop ℤ) := sorry

/-- §4.14: minus one is a complex Gamma pole but is not a real Gamma pole. -/
example : meromorphicOrderAt (gammaShiftProduct {0} 0) (-1) = 0 ∧
    meromorphicOrderAt (gammaShiftProduct 0 {0}) (-1) = (-1 : WithTop ℤ) := sorry

/-- §4.14: changing the real sign moves the pole at zero; odd negative arguments are not real
Gamma poles, while complex Gamma has a pole at every nonpositive integer. -/
example : gammaPoleOrder [(.real 0, 1)] 0 = 1 ∧ gammaPoleOrder [(.real 1, 1)] 0 = 0 ∧
    gammaPoleOrder [(.real 0, 1)] (-1) = 0 ∧ gammaPoleOrder [(.complex 0, 1)] (-1) = 1 := by
  decide

/-- §4.14: the Hodge Tate-line adapter has totalized product value zero at a pole but integer
count one and analytic order minus one. -/
example : hodgeGammaFactor (hodgeGammaFactors (tateArchimedean 0)) 0 = 0 ∧
    gammaPoleOrder (hodgeGammaFactors (tateArchimedean 0)) 0 = 1 ∧
    meromorphicOrderAt (hodgeGammaFactor (hodgeGammaFactors (tateArchimedean 0))) 0 =
      (-1 : WithTop ℤ) := sorry

/-- §4.14: a conjugate off-diagonal pair is counted once at a real place. -/
example {W : Type*} [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ W]
    {ω : TauCeti.Hodge.Conjugation W} (A : ArchimedeanRealization W ω 1)
    (h : ∀ a, A.hodge.hodgeNumber a = if a = 0 ∨ a = 1 then 1 else 0) (s : ℂ) :
    hodgeGammaFactor (hodgeGammaFactors A) s = Complex.Gammaℂ s := sorry

/-- §4.13: identical Hodge filtrations with opposite Betti involutions have different pole
orders at zero. -/
example : (oppositeRealSign (tateArchimedean 0)).hodge = (tateArchimedean 0).hodge ∧
    gammaPoleOrder (hodgeGammaFactors (tateArchimedean 0)) 0 = 1 ∧
    gammaPoleOrder (hodgeGammaFactors (oppositeRealSign (tateArchimedean 0))) 0 = 0 := sorry

/-- §4.13: the zero carrier has no Hodge or diagonal multiplicities and no Gamma factors. -/
example {W : Type*} [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ W]
    {ω : TauCeti.Hodge.Conjugation W} {w : ℤ} [Subsingleton W] (A : ArchimedeanRealization W ω w)
    (a : ℤ) (ε : Fin 2) (s : ℂ) :
    A.hodge.hodgeNumber a = 0 ∧ archRealization_diagonalMultiplicity A a ε = 0 ∧
      hodgeGammaFactor (hodgeGammaFactors A) s = 1 := sorry

/-- §4.13: the Betti involution of the Tate line with `n = 1` is `-1`, also at `p = 2`. -/
example : (tateArchimedean 1).FInfty (1 : ℂ) = -1 := sorry

/-- §4.13: product conjugation conjugates both factors. -/
example : (productConjugation standardConjugation standardConjugation).toEquiv
    (Complex.I, 1) = (-Complex.I, 1) := sorry

/-- §4.13: Tau Ceti's product of two weight-zero Tate lines has Hodge number two at `0`. -/
example : ((tateHodge 0).prod (tateHodge 0)
    (Ω := productConjugation standardConjugation standardConjugation) (fun _ => rfl)).hodgeNumber 0
      = 2 := sorry

/-- §4.14: the canonical dual factors of twists two and zero fix both shift and real sign. -/
example : gammaPoleOrder (tateDualHodgeGammaFactors (tateArchimedean 2)) 1 = 0 ∧
    gammaPoleOrder (tateDualHodgeGammaFactors (tateArchimedean 0)) 1 = 1 := sorry

/-- §4.14: the complex-place factor of a real Tate line is a complex Gamma factor. -/
example (s : ℂ) : hodgeGammaFactor (complexHodgeGammaFactors (tateHodge 0)) s =
    Complex.Gammaℂ s := sorry

/-- §4.14: the zero complex-place realization has unit product. -/
example {W : Type*} [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ W]
    {ω : TauCeti.Hodge.Conjugation W} {w : ℤ} [Subsingleton W]
    (H : TauCeti.Hodge.HodgeStructureOn W ω w) (s : ℂ) :
    hodgeGammaFactor (complexHodgeGammaFactors H) s = 1 := sorry

/-- §4.14: a complex-place type `(2,2)` shifts the complex factor by minus two. -/
example (s : ℂ) : hodgeGammaFactor (complexHodgeGammaFactors (tateHodge 2)) s =
    Complex.Gammaℂ (s - 2) := sorry

/-- §4.14: complex places count both conjugate weight-one types with the same zero shift. -/
example {W : Type*} [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ W]
    {ω : TauCeti.Hodge.Conjugation W} (H : TauCeti.Hodge.HodgeStructureOn W ω 1)
    (h : ∀ a, H.hodgeNumber a = if a = 0 ∨ a = 1 then 1 else 0) (s : ℂ) :
    hodgeGammaFactor (complexHodgeGammaFactors H) s = Complex.Gammaℂ s ^ 2 := sorry

/-- §4.13: switching the real sign twice recovers the original involution. -/
example {W : Type*} [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ W]
    {ω : TauCeti.Hodge.Conjugation W} {w : ℤ} (A : ArchimedeanRealization W ω w) :
    (oppositeRealSign (oppositeRealSign A)).FInfty = A.FInfty := sorry

end Tests

section IwasawaCorank

variable (Λ Q : Type*) [CommRing Λ] [IsDomain Λ] [Field Q] [Algebra Λ Q]
    [IsFractionRing Λ Q]

/-- §4.21: the Iwasawa corank of a discrete module on one domain component, computed from its
finitely generated compact dual `N` by extension to that component's fraction field. -/
def iwasawaCorankFromComponentDual (N : Type*) [AddCommGroup N] [Module Λ N]
    [Module.Finite Λ N] : ℕ :=
  Module.finrank Q (Q ⊗[Λ] N)

/-- §4.21: the compact dual equal to its Iwasawa component has corank one. -/
theorem iwasawaCorankFromComponentDual_self :
    iwasawaCorankFromComponentDual Λ Q Λ = 1 := sorry

/-- §4.21: a finitely generated torsion compact dual has Iwasawa corank zero on its component. -/
theorem iwasawaCorankFromComponentDual_torsion (N : Type*) [AddCommGroup N] [Module Λ N]
    [Module.Finite Λ N] (hN : ∀ x : N, ∃ a : Λ, a ≠ 0 ∧ a • x = 0) :
    iwasawaCorankFromComponentDual Λ Q N = 0 := sorry

/-- §4.21: on two split components a dual supported freely on the first has rank tuple `(1, 0)`.
The zero component is the zero module, rather than a second copy of the free dual. -/
example : (iwasawaCorankFromComponentDual Λ Q Λ,
    iwasawaCorankFromComponentDual Λ Q (Fin 0 → Λ)) = (1, 0) := sorry

end IwasawaCorank

section CongruentNumber

variable (p : ℕ) [Fact p.Prime]

/-- §4.29: the image of `E′_n(ℚ_p)` under the coboundary of the 2-isogeny
`E_n : y² = x³ - n²x → E′_n : Y² = X³ + 4n²X` in `ℚ_p^×/ℚ_p^{×2}`: `(X, Y) ↦ X` for `X ≠ 0`, and
the classes of `O` and `(0, 0)` (which is `4n² ≡ 1`). -/
def congruentLocalKummerImage (n : ℤ) :
    Set (ℚ_[p]ˣ ⧸ (powMonoidHom 2 : ℚ_[p]ˣ →* ℚ_[p]ˣ).range) :=
  {1} ∪ {c | ∃ (X : ℚ_[p]ˣ) (Y : ℚ_[p]), Y ^ 2 = (X : ℚ_[p]) ^ 3 + 4 * (n : ℚ_[p]) ^ 2 * X ∧
    c = QuotientGroup.mk X}

/-- §4.29: at an odd prime of good reduction the image has order `2 = #ker φ`. -/
theorem congruentLocalKummerImage_ncard_of_not_dvd (hp : p ≠ 2) (n : ℤ) (hn : Squarefree n)
    (hpn : ¬ (p : ℤ) ∣ n) :
    (congruentLocalKummerImage p n).ncard = 2 := sorry

/-- §4.29: at an odd prime dividing `n` the image has order `2` or `1` as `p ≡ 1` or `3 (mod 4)`,
so the local sign is the Legendre symbol `(-1/p)`. -/
theorem congruentLocalKummerImage_ncard_of_dvd (hp : p ≠ 2) (n : ℤ) (hn : Squarefree n)
    (hpn : (p : ℤ) ∣ n) :
    (congruentLocalKummerImage p n).ncard = if p % 4 = 1 then 2 else 1 := sorry

/-- §4.29: at `2` the image has order `4`, `2` or `1` as `n ≡ ±1`, `n ≡ ±3 (mod 8)` or `n` even. -/
theorem congruentLocalKummerImage_two_ncard (n : ℤ) (hn : Squarefree n) :
    (congruentLocalKummerImage 2 n).ncard =
      if 2 ∣ n then 1 else if n % 8 = 1 ∨ n % 8 = 7 then 4 else 2 := sorry

end CongruentNumber

/-- §4.29: the odd parts `c₄′ = 3` and `75` of the two root-number witnesses `n = 1, 5` differ
modulo `16`. -/
example : (3 : ZMod 16) * 1 ^ 2 = 3 ∧ (3 : ZMod 16) * 5 ^ 2 = 11 := by decide

end TauCetiRoadmap.SelmerIwasawaCohomology

/-
Targets stated in `README.md` only, because their carriers are not at the pins: the limit Kummer
map `kummerLimit` and its API (§0.6); Galois Selmer groups on continuous cochains, `corank` on a
discrete p-primary module, `SelmerStructure` and its dual (§§2.9–2.13); `procyclic_H1_equiv_coinvariants`
(§2.7); `LocalConditionMorphism`, `localMinus`, `localDualError` (§1.3, with arithmetic local
duality on the modified diagram); `selmerComplex` (parametric in the supplied local complexes),
`selmerComplexOrd`, `selmerComplexMod`, `selmerComplex_globalTriangle`,
`selmerComplex_compactTriangle` (the strict fibre for the same diagram, arithmetic compact
support for the modified instance), `selmerComplex_map`, `selmerComplex_quasiIso`,
`selmerArchimedeanCone` and `selmerComplex_archimedeanTriangle` (§2.21). The latter compares the
ordinary fibre with its modified fibre using the same condition complexes and maps composed
with the local comparison. Its third vertex is the sum of the archimedean cones shifted by −1;
for a module it has H⁰ equal to the archimedean coinvariants and no positive cohomology, but at
dyadic real places it can have lower negative Tate cohomology. Section 2.22 uses the local H⁰
groups of the specified diagram: ordinary invariants, or modified real Tate groups and zero
complex-place groups. For trivial `𝔽_p` over `ℚ`, `S = {p, ∞}` and odd p, the strict ordinary
H⁰ map has cokernel `𝔽_p`, while the modified map has zero cokernel;
`ellipticSelmerInfinity` (§2.12); Iwasawa algebras of `ℤ_p^d × Δ` with their
coordinates, involution and twists (§3.0); `iwasawaComplex`, `iwasawaCohomology`,
`iwasawaSelmerComplex`, `discreteInfiniteSelmerComplex`, `localSpecializationError`,
`selmerDeterminant` (§§3.1–3.14, with Iwasawa fibres for the chosen diagram and arithmetic
duality on the modified instance); the étale comparison `restrictedRamification_finiteEtale_equiv`,
`etaleCohomology_Gm_restrictedRamification`, `etaleGalois_comparison_restrictedRamification`,
`etaleGalois_comparison_lattice` (including the finite-S ordinary-limit simplification),
`etale_jStar_stalk`, `etale_jStar_degreeOne` (injection with image unramified at every removed
place), `etale_jStar_iwasawa` (infinite decomposition groups at every removed place, §3.15);
`semilocalCoind_restriction` (§3.6); `GreenbergStructureHypotheses` (§3.18); Tate's normalized traces,
`tate_almostEtale`, `tate_cyclotomicBanachH1` and `tate_H1_padicComplex_twist`, the canonical
CR.0.7 specialization `aCris`, its explicit comparison `aCris_model_equiv`, and `bCris`, `dCris`,
`dDeRham`, `IsCrystalline`, `IsDeRham` (§§4.1–4.5); `fontaineLaffaille_sum`,
`fontaineLaffaille_dual` (§§4.6–4.7), `IsTorsionCrystalline`, `IsIntegralCrystalline`
(§4.5a), `crystallineNonsingular` (§4.8); `blochKatoCondition`, `blochKatoCondition_T`,
`blochKatoStructure` (§4.9); `pRamifiedModule`, `unramifiedModule`, `closedGlobalUnitTower`,
`arithmeticPlusMinus` (§4.16); `PadicLFunctionDatum` and the main-conjecture propositions
(§§4.21–4.23), with `iwasawaCorank` the tuple of the component coranks above;
`localAnnihilation_uniform` (§4.25); `elliptic_dDeRham_tangent`, `elliptic_exponential_kummer`,
`elliptic_local_comparison_descent` (§4.26); the parity theorems
`selmerComplex_skewPairing` (the untwisted degree-three O-module adjoint for the modified fibre),
`skewSymmetric_filtration_parity` (O-bilinear, with 2 invertible), `selmerParity_perfectComplex`,
`selmerFamily_baseChange` (the common modified arithmetic diagram with strict ordinary
conditions at p, unramified conditions at other finite places, zero archimedean conditions and
its localized coefficient contract), `selmerParity_family`, `selmerParity_quadraticTwist` (exponent two),
`selmerParity_oddAbelian` (odd degree, with `H⁰(E′, V) = 0`),
`ordinaryModular_selmerParity_family` (§4.28) and
`casselsTate_pairing`, `selmerParity_twoIsogeny`, `congruentNumber_selmerParity` (§4.29).
-/

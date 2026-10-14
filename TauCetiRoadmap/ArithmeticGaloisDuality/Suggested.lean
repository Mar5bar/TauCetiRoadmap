import Mathlib
import TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete.Basic
import TauCeti.Algebra.Lie.GeneralLinear.Basic
import TauCeti.Algebra.Lie.GeneralLinear.TraceForm
import TauCeti.FieldTheory.GaloisCohomology.Coefficients

/-!
# Compact coefficients and arithmetic duality: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The declarations below are suggested Lean forms for the light definitions and the milestones that
can be stated against the pinned Mathlib and Tau Ceti, so that contributors and reviewers converge
on names and signatures; proving all of them finishes neither a layer nor the roadmap. The heavy
constructions (the Hochschild–Serre spectral sequence, the `S`-idele class formation, the
restricted products of local cohomology with their topology, Poitou–Tate duality, continuous
cochains in the derived category, arithmetic Selmer comparisons and the dualizing complex) are README targets
with their intended signatures.

Design choices made explicit here:

* Continuous cohomology is Mathlib's `continuousCohomology n X` for `X : TopRep ℤ G`, and a
  discrete module enters through Tau Ceti's `TauCeti.ofDiscreteModule`. No second cohomology
  theory is introduced; towers and inverse limits are stated on coefficient groups.
* `lim` and `lim¹` of an `ℕ`-indexed tower are the kernel and cokernel of the shift map
  `(a_n) ↦ (a_n - φ_n(a_{n+1}))`; the Mittag-Leffler condition is Mathlib's
  `CategoryTheory.Functor.IsMittagLeffler` on the underlying functor `ℕᵒᵖ ⥤ Type`.
* The pointwise `Hom` of discrete modules carries the topology induced from the product `A^C`,
  never the discrete topology: for infinitely generated `C` the two differ. Continuous
  homomorphisms from a profinite source are Mathlib's `ContinuousAddMonoidHom` with the
  compact-open topology, which is discrete for a discrete target, not the pointwise one.
* `S` is a set of finite places (height-one primes of the ring of integers); the archimedean places
  are always allowed to ramify. `G_{K,S}` is the Galois group of the compositum, inside a fixed
  field `Ω`, of the finite subextensions unramified outside `S`. Unramifiedness at a finite place
  `v` is Mathlib's `Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal`, quantified explicitly over the places
  outside `S` as in NumberFieldArithmetic §1.2; no wrapper predicate is introduced.
* Compact support is the mapping fibre `Cone(res)[-1]` of Mathlib's `CochainComplex.mappingCone`.
  Arithmetic localization uses ordinary cochains at finite places, complete Tate cochains at
  real places and zero at complex places. For coefficients of residue characteristic `p`,
  under `(P)` this is the finite-place fibre. The
  ordinary deformation-local diagram uses ordinary cochains at every place.
  SelmerIwasawaCohomology §§2.21–2.22 supply the parametric Selmer fibre, both instances,
  functoriality, triangles, the archimedean comparison and the abstract H⁰ correction. R02.3 and
  D7 supply the arithmetic local complexes, ordinary-to-Tate maps and duality; R02.5.2 identifies
  the strict modified fibre with arithmetic compact support and specializes the supplied
  archimedean cohomology and H⁰ corrections. These arithmetic constructions are README targets.
* Localization kernels and restricted products are stated generically, for given localization
  maps; the arithmetic local Galois groups are supplied by the caller.
* The adjoint coefficients of the first-order calculations are Tau Ceti's trace pairing
  `TauCeti.traceBilinForm` on `Matrix n n k` and its trace-zero ideal `TauCeti.slIdeal k n`;
  nothing divides by `n`.
-/

noncomputable section

open CategoryTheory

namespace TauCetiRoadmap.ArithmeticGaloisDuality

universe u

/-! ## Layer R02.1: compact coefficients, limits and continuous extensions -/

namespace CompactCoefficients

/-- An `ℕ`-indexed inverse system of abelian groups `⋯ → A₂ → A₁ → A₀`. -/
structure Tower where
  /-- The terms. -/
  obj : ℕ → Type u
  [inst : ∀ n, AddCommGroup (obj n)]
  /-- The transition maps `A_{n+1} → A_n`. -/
  map : ∀ n, obj (n + 1) →+ obj n

attribute [instance] Tower.inst

namespace Tower

variable (A : Tower.{u})

/-- The composite transition `A_{n+k} → A_n`. -/
def mapIter : ∀ (n k : ℕ), A.obj (n + k) →+ A.obj n
  | _, 0 => AddMonoidHom.id _
  | n, k + 1 => (mapIter n k).comp (A.map (n + k))

/-- The shift map `∏ A_n → ∏ A_n`, `(a_n) ↦ (a_n - φ_n(a_{n+1}))`. -/
def shift : (∀ n, A.obj n) →+ (∀ n, A.obj n) where
  toFun a n := a n - A.map n (a (n + 1))
  map_zero' := by ext n; simp
  map_add' a b := by ext n; simp only [Pi.add_apply, map_add]; abel

/-- `lim A`: the kernel of the shift, the compatible families. -/
def lim : AddSubgroup (∀ n, A.obj n) := A.shift.ker

/-- `lim¹ A`: the cokernel of the shift. For an `ℕ`-indexed tower this is `R¹lim`, and
`Rⁱlim = 0` for `i ≥ 2` (Stacks, Tag 07KW). -/
abbrev limOne : Type u := (∀ n, A.obj n) ⧸ A.shift.range

/-- The tower as a functor `ℕᵒᵖ ⥤ AddCommGrpCat`. -/
def toFunctor : ℕᵒᵖ ⥤ AddCommGrpCat.{u} :=
  Functor.ofOpSequence (X := fun n => AddCommGrpCat.of (A.obj n))
    (fun n => AddCommGrpCat.ofHom (A.map n))

/-- The Mittag-Leffler condition: Mathlib's condition on the underlying functor to types. -/
abbrev IsMittagLeffler : Prop :=
  (A.toFunctor ⋙ CategoryTheory.forget AddCommGrpCat).IsMittagLeffler

theorem mem_lim (a : ∀ n, A.obj n) : a ∈ A.lim ↔ ∀ n, A.map n (a (n + 1)) = a n := by
  simp only [lim, AddMonoidHom.mem_ker, shift, AddMonoidHom.coe_mk, ZeroHom.coe_mk]
  constructor
  · intro h n
    have := congrFun h n
    simp only [Pi.zero_apply] at this
    exact (sub_eq_zero.mp this).symm
  · intro h
    ext n
    simp [h n]

/-- The images of the iterated transitions stabilise. -/
theorem isMittagLeffler_iff_ranges : A.IsMittagLeffler ↔
    ∀ n, ∃ m, ∀ k ≥ m, (A.mapIter n k).range = (A.mapIter n m).range := sorry

theorem isMittagLeffler_of_surjective (h : ∀ n, Function.Surjective (A.map n)) :
    A.IsMittagLeffler := sorry

theorem isMittagLeffler_of_finite [∀ n, Finite (A.obj n)] : A.IsMittagLeffler := sorry

theorem limOne_subsingleton_of_surjective (h : ∀ n, Function.Surjective (A.map n)) :
    Subsingleton A.limOne := sorry

/-- **Mittag-Leffler towers have vanishing `lim¹`** (Stacks, Lemma 15.88.1, Tag 07KW). -/
theorem limOne_subsingleton_of_isMittagLeffler (h : A.IsMittagLeffler) :
    Subsingleton A.limOne := sorry

/-- A morphism of towers: levelwise homomorphisms commuting with the transitions. -/
structure Hom (A B : Tower.{u}) where
  /-- The levelwise maps. -/
  app : ∀ n, A.obj n →+ B.obj n
  comm : ∀ n, (app n).comp (A.map n) = (B.map n).comp (app (n + 1))

variable {A} {B : Tower.{u}}

/-- The map on `∏ A_n` induced by a morphism of towers. -/
def Hom.onProduct (f : Hom A B) : (∀ n, A.obj n) →+ (∀ n, B.obj n) where
  toFun a n := f.app n (a n)
  map_zero' := by ext; simp
  map_add' a b := by ext; simp

/-- The induced map on `lim¹`. -/
def Hom.limOneMap (f : Hom A B) : A.limOne →+ B.limOne :=
  QuotientAddGroup.map _ _ f.onProduct (by
    rintro _ ⟨a, rfl⟩
    refine ⟨f.onProduct a, ?_⟩
    ext n
    have h := congrArg (fun φ => φ (a (n + 1))) (f.comm n)
    simp only [AddMonoidHom.coe_comp, Function.comp_apply] at h
    simp only [shift, Hom.onProduct, AddMonoidHom.coe_mk, ZeroHom.coe_mk, map_sub]
    rw [h])

/-- **The six-term sequence of `lim` and `lim¹`**: for a levelwise short exact sequence of
towers `0 → A → B → C → 0`, the maps `lim¹ A → lim¹ B → lim¹ C → 0` are exact (the left half of
the sequence, `0 → lim A → lim B → lim C → lim¹ A`, is the companion statement). -/
theorem limOne_exact {C : Tower.{u}} (f : Hom A B) (g : Hom B C)
    (hexact : ∀ n, Function.Exact (f.app n) (g.app n))
    (hinj : ∀ n, Function.Injective (f.app n)) (hsurj : ∀ n, Function.Surjective (g.app n)) :
    Function.Exact f.limOneMap g.limOneMap ∧ Function.Surjective g.limOneMap := sorry

end Tower

/-- The constant tower with identity transitions. -/
def constantTower (A : Type u) [AddCommGroup A] : Tower.{u} where
  obj _ := A
  map _ := AddMonoidHom.id A

/-- Check `lim_constant`: evaluation at level zero identifies the limit with `A`, with
inverse the diagonal family. -/
example (A : Type u) [AddCommGroup A] :
    ∃ e : (constantTower A).lim ≃+ A,
      (∀ x, e x = x.1 0) ∧ (∀ a n, (e.symm a).1 n = a) := sorry

/-- Check `lim_constant`: the constant identity tower has vanishing `lim¹`. -/
example (A : Type u) [AddCommGroup A] : Subsingleton (constantTower A).limOne := sorry

/-- The reduction tower `ℤ/p^{n+1} → ℤ/p^n`. -/
def reductionTower (p : ℕ) : Tower.{0} where
  obj n := ZMod (p ^ n)
  map n := (ZMod.castHom (pow_dvd_pow p (Nat.le_succ n)) (ZMod (p ^ n))).toAddMonoidHom

/-- Check `limOne_surjective_tower`: reduction transitions give vanishing `lim¹`. -/
example (p : ℕ) (hp : p.Prime) : Subsingleton (reductionTower p).limOne := sorry

/-- Check `ml_finite`: identity transitions have full stable image. -/
example : (constantTower (ZMod 2)).IsMittagLeffler := sorry

/-- Check `ml_surjective`: zero transitions have zero stable image. -/
example : (show Tower from
    { obj := fun _ => ZMod 2, map := fun _ => (0 : ZMod 2 →+ ZMod 2) }).IsMittagLeffler := sorry

/-- The tower `⋯ → ℤ → ℤ` with every transition multiplication by `p`. -/
def mulTower (p : ℕ) : Tower.{0} where
  obj _ := ℤ
  map _ := (p : ℤ) • AddMonoidHom.id ℤ

/-- Check `ml_mul_p_fails`: the tower `ℤ ←p ℤ ←p ⋯` is not Mittag-Leffler, since the images `pᵏℤ`
never stabilise. -/
example (p : ℕ) (hp : p.Prime) : ¬ (mulTower p).IsMittagLeffler := sorry

/-- Check `limOne_mul_p`: its `lim¹` is `ℤ_p/ℤ`, in particular nonzero. -/
example (p : ℕ) (hp : p.Prime) : Nontrivial (mulTower p).limOne := sorry

/-- **Lifting continuous cochains along surjections of discrete spaces.** Composing with a
set-theoretic section of `π` is continuous because `Z` is discrete. -/
theorem exists_continuous_lift {X Y Z : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    [DiscreteTopology Y] [TopologicalSpace Z] [DiscreteTopology Z] (π : Y → Z)
    (hπ : Function.Surjective π) (f : C(X, Z)) : ∃ g : C(X, Y), π ∘ g = f :=
  ⟨⟨Function.surjInv hπ ∘ f, continuous_of_discreteTopology.comp f.continuous⟩, by
    ext x
    simp [Function.surjInv_eq hπ]⟩

/-- **Continuous cochains into `V = T ⊗ ℚ_p` land in a lattice**: on a compact space a
continuous map to `ℚ_pᵈ` is bounded, so some `pⁿ f` takes values in `ℤ_pᵈ`. -/
theorem exists_pow_smul_mem_lattice (p : ℕ) [Fact p.Prime] {X : Type*} [TopologicalSpace X]
    [CompactSpace X] (d : ℕ) (f : C(X, Fin d → ℚ_[p])) :
    ∃ n : ℕ, ∀ x i, ‖(p : ℚ_[p]) ^ n * f x i‖ ≤ 1 := sorry

section PointwiseHom

variable (C A : Type*) [AddCommGroup C] [AddCommGroup A] [TopologicalSpace A]

/-- `Hom_pt(C, A)`: the additive maps `C → A`, with the topology of pointwise convergence
(induced from the product `A^C`). -/
def HomPt : Type _ := C →+ A

instance : AddCommGroup (HomPt C A) := inferInstanceAs (AddCommGroup (C →+ A))

instance : FunLike (HomPt C A) C A := inferInstanceAs (FunLike (C →+ A) C A)

instance : TopologicalSpace (HomPt C A) :=
  TopologicalSpace.induced (fun (f : C →+ A) (c : C) => f c) Pi.topologicalSpace

variable {C A}

/-- Evaluation `Hom_pt(C, A) × C → A` is continuous for discrete `C`. -/
theorem continuous_eval [TopologicalSpace C] [DiscreteTopology C] :
    Continuous fun x : HomPt C A × C => x.1 x.2 := sorry

/-- For finitely generated `C` and discrete `A`, `Hom_pt(C, A)` is discrete (Check
`homPt_fg_discrete`). -/
theorem discreteTopology_of_fg [DiscreteTopology A] (hC : AddGroup.FG C) :
    DiscreteTopology (HomPt C A) := sorry

/-- Check `homPt_int`: evaluation at `1` is a topological additive equivalence. -/
example [DiscreteTopology A] :
    ∃ e : HomPt ℤ A ≃ₜ+ A, ∀ f, e f = f 1 := sorry

/-- Check `homPt_fg_discrete`: two basis evaluations give the product topology on `A²`. -/
example [DiscreteTopology A] :
    ∃ e : HomPt (Fin 2 → ℤ) A ≃ₜ+ (Fin 2 → A),
      ∀ f i, e f i = f (Pi.single i 1) := sorry

/-- The zero source has only the zero additive map. -/
example : Subsingleton (HomPt (Fin 0 → ℤ) A) := sorry

/-- Check `homPt_not_discrete`: for `C = ⊕_ℕ 𝔽₂` the pointwise topology on `Hom(C, 𝔽₂) = 𝔽₂^ℕ`
is not discrete. -/
example : letI : TopologicalSpace (ZMod 2) := ⊥
    ¬ DiscreteTopology (HomPt (ℕ →₀ ZMod 2) (ZMod 2)) := sorry

end PointwiseHom

section SplittingTorsor

variable {B C : Type*} [AddCommGroup B] [AddCommGroup C]

/-- The additive sections of `κ : B → C`; for `A = ker κ` they form a torsor under `Hom(C, A)`. -/
def Sections (κ : B →+ C) : Type _ := {s : C →+ B // κ.comp s = AddMonoidHom.id C}

/-- Two sections differ by a homomorphism `C → ker κ`. -/
theorem sections_sub_mem_ker (κ : B →+ C) (s t : Sections κ) (c : C) :
    s.1 c - t.1 c ∈ κ.ker := by
  have hs := congrArg (fun φ => φ c) s.2
  have ht := congrArg (fun φ => φ c) t.2
  simp only [AddMonoidHom.coe_comp, Function.comp_apply, AddMonoidHom.id_apply] at hs ht
  simp [AddMonoidHom.mem_ker, hs, ht]

/-- The identity of `C` has exactly one section. -/
example : Subsingleton (Sections (AddMonoidHom.id C)) := sorry

end SplittingTorsor

section ContinuousHom

/-- **Continuous homomorphisms from a compact source to a discrete target form a discrete group**:
Mathlib's compact-open topology on `P →ₜ+ A` is discrete when `P` is compact and `A` is discrete,
since each continuous map takes finitely many values on clopen fibres. This is the topology of the
coefficient module `Hom_cts(H^ab, A)` in the transgression formula, not the pointwise one. -/
theorem discreteTopology_continuousAddMonoidHom (P A : Type*) [AddMonoid P] [TopologicalSpace P]
    [CompactSpace P] [AddMonoid A] [TopologicalSpace A] [DiscreteTopology A] :
    DiscreteTopology (P →ₜ+ A) := sorry

end ContinuousHom

end CompactCoefficients

/-! ## Layer R02.3: restricted ramification and the `S`-idele class formation -/

namespace RestrictedRamification

open IsDedekindDomain NumberField
open scoped NumberField

variable (K Ω : Type) [Field K] [NumberField K] [Field Ω] [Algebra K Ω]

/-- `K_S`: the compositum in `Ω` of the finite subextensions `L/K` that are unramified at every
finite place `v ∉ S`, in the sense of Mathlib's `Algebra.IsUnramifiedIn`: every prime of `𝓞 L`
over `v` is unramified. Infinite places impose nothing. -/
def maxUnramifiedOutside (S : Set (HeightOneSpectrum (𝓞 K))) : IntermediateField K Ω :=
  ⨆ (L : IntermediateField K Ω) (_ : FiniteDimensional K L)
    (_ : ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal), L

/-- `G_{K,S} = Gal(K_S/K)`, with its Krull topology. -/
abbrev galoisGroupS (S : Set (HeightOneSpectrum (𝓞 K))) :=
  maxUnramifiedOutside K Ω S ≃ₐ[K] maxUnramifiedOutside K Ω S

/-- A finite subextension lies in `K_S` exactly when it is unramified at every finite place
outside `S`. -/
theorem mem_maxUnramifiedOutside_iff (S : Set (HeightOneSpectrum (𝓞 K)))
    (L : IntermediateField K Ω) [FiniteDimensional K L] :
    L ≤ maxUnramifiedOutside K Ω S ↔ ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal := sorry

theorem isGalois_maxUnramifiedOutside [IsSepClosed Ω] [Algebra.IsAlgebraic K Ω]
    (S : Set (HeightOneSpectrum (𝓞 K))) : IsGalois K (maxUnramifiedOutside K Ω S) := sorry

theorem maxUnramifiedOutside_mono (S T : Set (HeightOneSpectrum (𝓞 K))) (h : S ⊆ T) :
    maxUnramifiedOutside K Ω S ≤ maxUnramifiedOutside K Ω T := sorry

/-- If `S` contains every place above `p`, all `pⁿ`-th roots of unity of `Ω` lie in `K_S`. -/
theorem cyclotomic_le_maxUnramifiedOutside (S : Set (HeightOneSpectrum (𝓞 K)))
    (p : ℕ) [Fact p.Prime] (hS : ∀ v : HeightOneSpectrum (𝓞 K),
      (p : 𝓞 K) ∈ v.asIdeal → v ∈ S) (n : ℕ) (x : Ω)
    (hx : x ^ (p ^ n) = 1) : x ∈ maxUnramifiedOutside K Ω S := sorry

/-- The pinned Kummer action descends to `G_{K,S}` when all places dividing `m` are in `S`,
with its discrete topology and joint continuity. -/
theorem kummerCoeffS_exists (S : Set (HeightOneSpectrum (𝓞 K))) (m : ℕ) (hm : 0 < m)
    (hS : ∀ v : HeightOneSpectrum (𝓞 K), (m : 𝓞 K) ∈ v.asIdeal → v ∈ S) :
    let L := maxUnramifiedOutside K (SeparableClosure K) S
    letI : IsGalois K L := isGalois_maxUnramifiedOutside K (SeparableClosure K) S
    ∃ ρ : ContRepresentation ℤ (galoisGroupS K (SeparableClosure K) S) (TauCeti.KummerCoeff K m),
      (∀ (σ : TauCeti.AbsoluteGaloisGroup K) (x : TauCeti.KummerCoeff K m),
        ρ (AlgEquiv.restrictNormalHom L σ) x = σ • x) ∧
      Continuous (fun gx : galoisGroupS K (SeparableClosure K) S × TauCeti.KummerCoeff K m =>
        ρ gx.1 gx.2) := sorry

/-- Check `restricted_rat_infty`: with no finite place allowed, `ℚ` has no nontrivial extension
(Minkowski). -/
example (Ω : Type) [Field Ω] [Algebra ℚ Ω] : maxUnramifiedOutside ℚ Ω ∅ = ⊥ := sorry

/-- Check `restricted_rat_two_nonexample`: `√3` is ramified at `3`, so it does not lie in
`ℚ_{{2}}`. -/
example (Ω : Type) [Field Ω] [Algebra ℚ Ω] (x : Ω) (hx : x * x = 3) :
    x ∉ maxUnramifiedOutside ℚ Ω {v | (2 : 𝓞 ℚ) ∈ v.asIdeal} := sorry

/-- **Hermite's finiteness theorem**: for finite `S` and `n ≥ 1`, only finitely many subextensions
of `Ω/K` of degree at most `n` are unramified outside `S`. -/
theorem finite_unramifiedOutside_of_finrank_le (S : Set (HeightOneSpectrum (𝓞 K)))
    (hS : S.Finite) (n : ℕ) :
    {L : IntermediateField K Ω | FiniteDimensional K L ∧ Module.finrank K L ≤ n ∧
      ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal}.Finite :=
  sorry

/-- **Finiteness of `H¹(G_{K,S}, M)`** for finite `S` and every finite discrete `G_{K,S}`-module
`M`, of any order (Milne, *ADT*, I, Lemma 4.9). -/
theorem finite_H1_galoisGroupS [IsSepClosed Ω] [Algebra.IsAlgebraic K Ω]
    (S : Set (HeightOneSpectrum (𝓞 K))) (hS : S.Finite)
    (M : Type) [AddCommGroup M] [Finite M] [TopologicalSpace M] [DiscreteTopology M]
    [DistribMulAction (galoisGroupS K Ω S) M] [ContinuousSMul (galoisGroupS K Ω S) M] :
    Finite (continuousCohomology 1 (TauCeti.ofDiscreteModule ℤ (galoisGroupS K Ω S) M)) := sorry

end RestrictedRamification

namespace ArithmeticDuality

open IsDedekindDomain NumberField RestrictedRamification
open scoped NumberField

variable (K Ω : Type) [Field K] [NumberField K] [Field Ω] [Algebra K Ω]

/-- The exponent-two ramification field: the compositum of the finite Galois subextensions of
exponent two that are unramified outside `S`. -/
def exponentTwoField (S : Set (HeightOneSpectrum (𝓞 K))) : IntermediateField K Ω :=
  ⨆ (L : IntermediateField K Ω) (_ : FiniteDimensional K L) (_ : IsGalois K L)
    (_ : ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal) (_ : ∀ σ : L ≃ₐ[K] L, σ * σ = 1), L

theorem exponentTwoField_le (S : Set (HeightOneSpectrum (𝓞 K))) :
    exponentTwoField K Ω S ≤ maxUnramifiedOutside K Ω S := sorry

theorem exponentTwoField_mono (S T : Set (HeightOneSpectrum (𝓞 K))) (h : S ⊆ T) :
    exponentTwoField K Ω S ≤ exponentTwoField K Ω T := sorry

/-- Every quadratic subextension unramified outside `S` lies in the exponent-two field. -/
theorem exponentTwoField_contains (S : Set (HeightOneSpectrum (𝓞 K)))
    (L : IntermediateField K Ω) [FiniteDimensional K L] (hdeg : Module.finrank K L = 2)
    (hur : ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal) : L ≤ exponentTwoField K Ω S := sorry

/-- For finite `S` the exponent-two field is a finite extension (Hermite). -/
theorem exponentTwoField_finite (S : Set (HeightOneSpectrum (𝓞 K))) (hS : S.Finite) :
    FiniteDimensional K (exponentTwoField K Ω S) := sorry

/-- Check `exponent_two_imaginary`: `ℚ(i) = ℚ(√-1)` is unramified outside `2`, so it lies in the
exponent-two field of `{2}`. -/
example (Ω : Type) [Field Ω] [Algebra ℚ Ω] (x : Ω) (hx : x * x = -1) :
    x ∈ exponentTwoField ℚ Ω {v | (2 : 𝓞 ℚ) ∈ v.asIdeal} := sorry

/-- Check `exponent_two_empty_Q`: no quadratic field is unramified at every finite prime. -/
example (Ω : Type) [Field Ω] [Algebra ℚ Ω] : exponentTwoField ℚ Ω ∅ = ⊥ := sorry

section LocalizationKernel

variable {ι A : Type*} [AddCommGroup A] {H : ι → Type*} [∀ v, AddCommGroup (H v)]

/-- The localization kernel `Ш` of a family of localization maps: the classes that vanish at
every place of the family. With the restrictions to every place of a global field it is
`Шⁱ(F, M)`; with the restrictions of a finite Galois quotient to its decomposition groups it is the
relative kernel. -/
def absoluteSha (loc : ∀ v, A →+ H v) : AddSubgroup A := ⨅ v, (loc v).ker

theorem mem_absoluteSha (loc : ∀ v, A →+ H v) (a : A) :
    a ∈ absoluteSha loc ↔ ∀ v, loc v a = 0 := by
  simp [absoluteSha, AddSubgroup.mem_iInf, AddMonoidHom.mem_ker]

/-- Restriction, corestriction and coefficient maps preserve localization kernels as soon as they
commute with the localization maps. -/
theorem sha_res_cor {B : Type*} [AddCommGroup B] {J : ι → Type*}
    [∀ v, AddCommGroup (J v)] (loc : ∀ v, A →+ H v) (loc' : ∀ v, B →+ J v)
    (f : A →+ B) (fv : ∀ v, H v →+ J v)
    (h : ∀ v, (loc' v).comp f = (fv v).comp (loc v)) :
    (absoluteSha loc).map f ≤ absoluteSha loc' := by
  rintro _ ⟨a, ha, rfl⟩
  rw [SetLike.mem_coe, mem_absoluteSha] at ha
  rw [mem_absoluteSha]
  intro v
  have := congrArg (fun φ => φ a) (h v)
  simp only [AddMonoidHom.coe_comp, Function.comp_apply] at this
  rw [this, ha v, map_zero]

end LocalizationKernel

end ArithmeticDuality

/-! ## Layer R02.4: arithmetic duality and local–global obstruction groups -/

namespace PoitouTate

open Filter RestrictedProduct ArithmeticDuality

variable {ι : Type*} (H : ι → Type*) [∀ v, AddCommGroup (H v)] (Hun : ∀ v, AddSubgroup (H v))

/-- `P_S^r`: the restricted product of the local groups with respect to the unramified
subgroups. -/
abbrev restrictedProductCohomology : Type _ := Πʳ v, [H v, Hun v]_[cofinite]

variable {H Hun} {A : Type*} [AddCommGroup A]

/-- `βʳ : Hʳ(G_S, M) → P_S^r`, the product of the localization maps; a global class is unramified
at almost every place. -/
def beta (loc : ∀ v, A →+ H v) (hloc : ∀ a, ∀ᶠ v in cofinite, loc v a ∈ Hun v) :
    A →+ restrictedProductCohomology H Hun where
  toFun a := ⟨fun v => loc v a, hloc a⟩
  map_zero' := by ext v; exact map_zero (loc v)
  map_add' a b := by ext v; exact map_add (loc v) a b

@[simp] theorem beta_apply (loc : ∀ v, A →+ H v)
    (hloc : ∀ a, ∀ᶠ v in cofinite, loc v a ∈ Hun v) (a : A) (v : ι) :
    beta loc hloc a v = loc v a := rfl

/-- `Шʳ_S`: the kernel of `βʳ`. -/
def sha (loc : ∀ v, A →+ H v) (hloc : ∀ a, ∀ᶠ v in cofinite, loc v a ∈ Hun v) :
    AddSubgroup A := (beta loc hloc).ker

theorem sha_eq_absoluteSha (loc : ∀ v, A →+ H v)
    (hloc : ∀ a, ∀ᶠ v in cofinite, loc v a ∈ Hun v) :
    sha loc hloc = absoluteSha loc := by
  ext a
  rw [mem_absoluteSha, sha, AddMonoidHom.mem_ker]
  constructor
  · intro h v
    have := congrArg (fun x : restrictedProductCohomology H Hun => x v) h
    simpa [RestrictedProduct.zero_apply] using this
  · intro h
    ext v
    exact h v

variable (H Hun)

theorem finite_restrictedProductCohomology [Finite ι] [∀ v, Finite (H v)] :
    Finite (restrictedProductCohomology H Hun) := sorry

end PoitouTate

namespace EulerCharacteristic

local instance : TopologicalSpace (ZMod 3) := ⊥
local instance : DiscreteTopology (ZMod 3) := ⟨rfl⟩

/-- The Euler characteristic `χ = #H⁰ · #H² / #H¹`, with ordinary `H⁰`. -/
def eulerChar (h0 h1 h2 : ℕ) : ℚ := (h0 * h2 : ℚ) / h1

/-- The archimedean factor `#H⁰(G_v, M)/|#M|_v`; the normalised absolute value squares at a
complex place. -/
def archFactor (isComplex : Bool) (h0 m : ℕ) : ℚ :=
  (h0 : ℚ) / (if isComplex then (m : ℚ) ^ 2 else m)

/-- The arithmetic function gives factor `1` on real-place input cardinalities `2, 2`. -/
example : archFactor false 2 2 = 1 := by norm_num [archFactor]

/-- The arithmetic function squares the coefficient cardinality at a complex place. -/
example : archFactor true 2 2 = 1 / 2 := by norm_num [archFactor]

/-- Unit values of the Euler quotient and archimedean-factor functions. -/
example :
    (eulerChar 3 3 1, archFactor false 3 3, eulerChar 1 3 1, archFactor false 1 3) =
      (1, 1, 1 / 3, 1 / 3) := by
  norm_num [eulerChar, archFactor]

/-- In the additive `𝔽₃` models of the real actions on `ℤ/3` and `μ₃`, complex conjugation
acts by `+1` and `−1`; the ordinary invariant groups have orders `3` and `1`. -/
example :
    Fintype.card {x : ZMod 3 // (1 : ZMod 3) * x = x} = 3 ∧
      Fintype.card {x : ZMod 3 // (-1 : ZMod 3) * x = x} = 1 := by
  decide

open RestrictedRamification IsDedekindDomain in
/-- Over `ℚ`, unramified outside `3`, the trivial coefficient `ℤ/3` has cohomology orders
`3, 3, 1` in degrees `0, 1, 2`. -/
example (Ω : Type) [Field Ω] [Algebra ℚ Ω] [IsSepClosed Ω] [Algebra.IsAlgebraic ℚ Ω] :
    let X : TopRep ℤ
        (galoisGroupS ℚ Ω {v | (3 : NumberField.RingOfIntegers ℚ) ∈ v.asIdeal}) :=
      { V := ZMod 3, hV5 := ⟨continuous_of_discreteTopology⟩,
        ρ := ContRepresentation.trivial ℤ _ (ZMod 3) }
    (Nat.card (continuousCohomology 0 X), Nat.card (continuousCohomology 1 X),
      Nat.card (continuousCohomology 2 X)) = (3, 3, 1) := sorry

open RestrictedRamification IsDedekindDomain in
/-- Over `ℚ`, unramified outside `3`, the descended pinned Kummer coefficient `μ₃` has
cohomology orders `1, 3, 1`. The compatibility pins its nontrivial Galois action. -/
example :
    let S : Set (HeightOneSpectrum (NumberField.RingOfIntegers ℚ)) :=
      {v | (3 : NumberField.RingOfIntegers ℚ) ∈ v.asIdeal}
    let L := maxUnramifiedOutside ℚ (SeparableClosure ℚ) S
    letI : IsGalois ℚ L := isGalois_maxUnramifiedOutside ℚ (SeparableClosure ℚ) S
    ∀ ρ : ContRepresentation ℤ (galoisGroupS ℚ (SeparableClosure ℚ) S) (TauCeti.KummerCoeff ℚ 3),
      (∀ (σ : TauCeti.AbsoluteGaloisGroup ℚ) (x : TauCeti.KummerCoeff ℚ 3),
        ρ (AlgEquiv.restrictNormalHom L σ) x = σ • x) →
      (Nat.card (continuousCohomology 0 (TopRep.of ρ)),
        Nat.card (continuousCohomology 1 (TopRep.of ρ)),
        Nat.card (continuousCohomology 2 (TopRep.of ρ))) = (1, 3, 1) := sorry

/-- Real ordinary invariants of the trivial `ℤ/3` action have order three. -/
example :
    let X : TopRep ℤ (TauCeti.AbsoluteGaloisGroup ℝ) :=
      { V := ZMod 3, hV5 := ⟨continuous_of_discreteTopology⟩,
        ρ := ContRepresentation.trivial ℤ _ (ZMod 3) }
    Nat.card (continuousCohomology 0 X) = 3 := sorry

/-- Real ordinary invariants of `μ₃` use its Galois action and have order one. -/
example : Nat.card (continuousCohomology 0
    (TauCeti.ofDiscreteModule ℤ (TauCeti.AbsoluteGaloisGroup ℝ) (TauCeti.KummerCoeff ℝ 3))) = 1 := sorry

end EulerCharacteristic

open RestrictedRamification IsDedekindDomain in
/-- **Tate's global Euler characteristic formula**, for a totally complex number field: if `S` is
finite and every prime dividing `#M` lies below a place of `S`, then
`#H⁰(G_S, M) · #H²(G_S, M) / #H¹(G_S, M) = (#M)^{-[K:ℚ]/2}` (Milne, *ADT*, I, Theorem 5.1).
The general formula, with the real places, is a README target. -/
theorem eulerChar_galoisGroupS_of_isTotallyComplex (K Ω : Type) [Field K] [NumberField K]
    [NumberField.IsTotallyComplex K] [Field Ω] [Algebra K Ω] [IsSepClosed Ω]
    [Algebra.IsAlgebraic K Ω] (S : Set (HeightOneSpectrum (NumberField.RingOfIntegers K)))
    (hS : S.Finite) (M : Type) [AddCommGroup M] [Finite M] [TopologicalSpace M]
    [DiscreteTopology M] [DistribMulAction (galoisGroupS K Ω S) M]
    [ContinuousSMul (galoisGroupS K Ω S) M]
    (hunit : ∀ v : HeightOneSpectrum (NumberField.RingOfIntegers K),
      ((Nat.card M : ℕ) : NumberField.RingOfIntegers K) ∈ v.asIdeal → v ∈ S) :
    EulerCharacteristic.eulerChar
        (Nat.card (continuousCohomology 0 (TauCeti.ofDiscreteModule ℤ (galoisGroupS K Ω S) M)))
        (Nat.card (continuousCohomology 1 (TauCeti.ofDiscreteModule ℤ (galoisGroupS K Ω S) M)))
        (Nat.card (continuousCohomology 2 (TauCeti.ofDiscreteModule ℤ (galoisGroupS K Ω S) M))) *
      (Nat.card M : ℚ) ^ (Module.finrank ℚ K / 2) = 1 := sorry

/-! ## Layer D7: derived continuous cohomology and compact arithmetic duality -/

namespace ArithmeticDuality

variable {R G M : Type*} [CommRing R] [Group G] [AddCommGroup M] [Module R M]

/-- The image of the group algebra `R[G]` in `End_R(M)`. -/
def actionSpan (ρ : Representation R G M) : Submodule R (Module.End R M) :=
  Submodule.span R (Set.range ρ)

variable [TopologicalSpace G]

/-- `M` is admissible (for the ideal `I`, in practice the maximal ideal) when the image of
`R[G]` is finite over `R` and `G` acts continuously on it for its `I`-adic topology. -/
def IsAdmissible (I : Ideal R) (ρ : Representation R G M) : Prop :=
  Module.Finite R (actionSpan ρ) ∧
    letI : TopologicalSpace (actionSpan ρ) := I.adicModuleTopology (actionSpan ρ)
    Continuous fun g : G => (⟨ρ g, Submodule.subset_span ⟨g, rfl⟩⟩ : actionSpan ρ)

/-- `M` is ind-admissible when every element lies in a `G`-stable finite-type submodule that is
admissible. No topology on `M` itself is chosen. -/
def IsIndAdmissible (I : Ideal R) (ρ : Representation R G M) : Prop :=
  ∀ m : M, ∃ N : Subrepresentation ρ, m ∈ N ∧
    Module.Finite R N.toSubmodule ∧ IsAdmissible I N.toRepresentation

/-- An admissible module is ind-admissible: each element lies in the stable submodule `A_M · m`,
which is finitely generated, with image algebra a quotient of `A_M`. -/
theorem isIndAdmissible_of_isAdmissible (I : Ideal R) (ρ : Representation R G M)
    (h : IsAdmissible I ρ) : IsIndAdmissible I ρ := sorry

/-- Check `admissible_trivial`: the trivial representation acts through the `R`-span of the
identity. -/
example : actionSpan (Representation.trivial R G M) = Submodule.span R {1} := by
  have : Set.range (Representation.trivial R G M) = {1} := by
    ext x
    simp [Representation.trivial, eq_comm]
  rw [actionSpan, this]

/-- Check `ind_admissible_trivial`: every trivial representation is ind-admissible, even when `M`
is not finite over `R`. -/
example (I : Ideal R) : IsIndAdmissible I (Representation.trivial R G M) := sorry

end ArithmeticDuality

namespace GaloisCohomology

open CategoryTheory.Pretriangulated

variable {R : Type u} [CommRing R] {A B A' B' : CochainComplex (ModuleCat.{u} R) ℤ}

/-- The mapping fibre `Cone(res)[-1]`. For arithmetic compact support, `res` has target the
modified local diagram: ordinary finite-place cochains, real Tate cochains and zero complex-place
terms, or the quasi-isomorphic finite-place model under `(P)` for coefficients of residue
characteristic `p`. The fibre of ordinary cochains at
every place has the separate archimedean comparison specified in R02.5.2. -/
abbrev compactCochains (res : A ⟶ B) : CochainComplex (ModuleCat.{u} R) ℤ :=
  (CochainComplex.mappingCone res)⟦(-1 : ℤ)⟧

/-- `Hⁿ_c`. -/
abbrev compactCohomology (res : A ⟶ B) (n : ℤ) : ModuleCat.{u} R :=
  (compactCochains res).homology n

/-- The fibre triangle `C_c → A → B → C_c[1]`, the inverse rotation of the cone triangle. -/
def compactTriangle (res : A ⟶ B) : Triangle (CochainComplex (ModuleCat.{u} R) ℤ) :=
  Triangle.invRotate (CochainComplex.mappingCone.triangle res)

/-- A commutative square of localization maps induces a map of compactly supported cochains. -/
def compactMap (res : A ⟶ B) (res' : A' ⟶ B') (a : A ⟶ A') (b : B ⟶ B')
    (comm : res ≫ b = a ≫ res') : compactCochains res ⟶ compactCochains res' :=
  (CochainComplex.mappingCone.map res res' a b comm)⟦(-1 : ℤ)⟧'

/-- **The compact-support long exact sequence**
`⋯ → Hⁿ(A) → Hⁿ(B) → Hⁿ⁺¹_c → Hⁿ⁺¹(A) → Hⁿ⁺¹(B) → ⋯`. -/
theorem compactCohomology_exact (res : A ⟶ B) (n : ℤ) :
    ∃ (δ : B.homology n ⟶ compactCohomology res (n + 1))
      (ι : compactCohomology res (n + 1) ⟶ A.homology (n + 1)),
      Function.Exact (HomologicalComplex.homologyMap res n).hom δ.hom ∧
      Function.Exact δ.hom ι.hom ∧
      Function.Exact ι.hom (HomologicalComplex.homologyMap res (n + 1)).hom := sorry

/-- Check `compact_no_local`: with no local terms the compactly supported cohomology is the
global cohomology. -/
example (res : A ⟶ B) (hB : Limits.IsZero B) (n : ℤ) :
    Nonempty (compactCohomology res n ≅ A.homology n) := sorry

/-- Check `finite_support_identity`: the fibre of the identity is acyclic. -/
example (n : ℤ) : Limits.IsZero (compactCohomology (𝟙 A) n) := sorry

end GaloisCohomology

/-! ## Layer D8: cohomological fibres for determinant and coefficient change -/

namespace Adjoint

-- As in Tau Ceti and Mathlib, the commutator Lie ring on matrices is a local instance; it is what
-- `TauCeti.slIdeal` is an ideal of.
attribute [local instance 100] LieRing.ofAssociativeRing

variable (k : Type*) [Field k] (n : Type*) [Fintype n] [DecidableEq n]

/-- The trace pairing on `ad` is Tau Ceti's `TauCeti.traceBilinForm`, perfect in every
characteristic (`TauCeti.traceBilinForm_nondegenerate`). -/
example : (TauCeti.traceBilinForm k n).Nondegenerate := TauCeti.traceBilinForm_nondegenerate k n

/-- **Trace-zero adjoint duality**: the trace pairing restricted to `ad⁰`, the underlying submodule
of Tau Ceti's trace-zero ideal `TauCeti.slIdeal k n`, is perfect exactly when `n` is invertible in
`k`. Nothing divides by `n`: when `char k ∣ n`, the scalars lie in `ad⁰` and span its radical, and
`(ad⁰)^∨ ≅ ad/k·1` is the dual used instead. -/
theorem traceBilinForm_restrict_slIdeal_nondegenerate_iff [Nonempty n] :
    ((TauCeti.traceBilinForm k n).restrict (TauCeti.slIdeal k n).toSubmodule).Nondegenerate ↔
      (Fintype.card n : k) ≠ 0 := sorry

/-- In characteristic two the identity of `M₂` has trace zero, so `ad⁰` contains the scalars. -/
example : (1 : Matrix (Fin 2) (Fin 2) (ZMod 2)) ∈ TauCeti.slIdeal (ZMod 2) (Fin 2) := by
  rw [TauCeti.mem_slIdeal_iff]
  decide

/-- For the unipotent real involution over `𝔽₂`, the invariant groups on `ad` and `ad⁰` both
have order four, while the norm images have orders four and two. Thus their Tate `H⁰` groups
have orders one and two, and the trace sequence retains its preceding Tate term. -/
example :
    let u : Matrix (Fin 2) (Fin 2) (ZMod 2) := !![1, 1; 0, 1]
    (Fintype.card {X : Matrix (Fin 2) (Fin 2) (ZMod 2) // u * X * u = X},
      Fintype.card {X : Matrix (Fin 2) (Fin 2) (ZMod 2) //
        X.trace = 0 ∧ u * X * u = X},
      Fintype.card {Y : Matrix (Fin 2) (Fin 2) (ZMod 2) //
        ∃ X : Matrix (Fin 2) (Fin 2) (ZMod 2), Y = X + u * X * u},
      Fintype.card {Y : Matrix (Fin 2) (Fin 2) (ZMod 2) //
        ∃ X : Matrix (Fin 2) (Fin 2) (ZMod 2), X.trace = 0 ∧ Y = X + u * X * u}) =
      (4, 4, 4, 2) := by
  decide

/-- **The determinant derivative is the trace**: `det(1 + εX) = 1 + ε tr X` over `k[ε]`. -/
theorem det_one_add_eps (X : Matrix n n k) :
    ((1 : Matrix n n (DualNumber k)) +
        (DualNumber.eps : DualNumber k) • X.map (algebraMap k (DualNumber k))).det =
      1 + DualNumber.eps * algebraMap k (DualNumber k) X.trace := by
  rw [Matrix.det_one_add_smul]
  simp [pow_two, DualNumber.eps_mul_eps, mul_comm, Matrix.trace]

variable {k n} {G : Type*} [Group G]

/-- The first-order lift `g ↦ (1 + ε c(g)) ρ(g)` of `ρ` with matrix-valued cochain `c`. -/
def firstOrderLift (ρ : G →* (Matrix n n k)ˣ) (c : G → Matrix n n k) :
    G → Matrix n n (DualNumber k) :=
  fun g => (1 + (DualNumber.eps : DualNumber k) • (c g).map (algebraMap k (DualNumber k))) *
    (ρ g : Matrix n n k).map (algebraMap k (DualNumber k))

/-- **First-order cocycle comparison**: the first-order lift is multiplicative exactly when `c`
is a `1`-cocycle for the conjugation action on `ad ρ`. -/
theorem firstOrderLift_mul_iff (ρ : G →* (Matrix n n k)ˣ) (c : G → Matrix n n k) :
    (∀ g h, firstOrderLift ρ c (g * h) = firstOrderLift ρ c g * firstOrderLift ρ c h) ↔
      ∀ g h, c (g * h) = c g + (ρ g : Matrix n n k) * c h * ((ρ g)⁻¹ : (Matrix n n k)ˣ) :=
  sorry

/-- The zero cochain gives the trivial lift. -/
example (ρ : G →* (Matrix n n k)ˣ) (g : G) :
    firstOrderLift ρ 0 g = (ρ g : Matrix n n k).map (algebraMap k (DualNumber k)) := by
  simp only [firstOrderLift, Pi.zero_apply]
  rw [Matrix.map_zero _ (map_zero _), smul_zero, add_zero, one_mul]

/-! ## Layer R02.6: auxiliary primes and patching numerics -/

variable (k n)

/-- **Archimedean adjoint dimensions**: for an involution `c` with eigenspace dimensions `a`
(for `+1`) and `b` (for `-1`), in characteristic not two, the trace-zero matrices commuting with
`c` have dimension `a² + b² - 1`. -/
theorem finrank_slIdeal_centralizer_involution [Nonempty n] (hk : ringChar k ≠ 2)
    (c : Matrix n n k) (hc : c * c = 1) (a b : ℕ)
    (ha : Module.finrank k (LinearMap.ker (Matrix.toLin' c - 1)) = a)
    (hb : Module.finrank k (LinearMap.ker (Matrix.toLin' c + 1)) = b) :
    Module.finrank k ↥((TauCeti.slIdeal k n).toSubmodule ⊓
      LinearMap.ker (LinearMap.mulLeft k c - LinearMap.mulRight k c)) = a ^ 2 + b ^ 2 - 1 := sorry

end Adjoint

/-!
## Targets stated only in README.md

The following targets need carriers that the pinned libraries do not have, and are stated only in
the README: the Milnor sequence, the comparison of module-derived limits with the explicit tower
API, and Tate's inverse-limit theorem; rationalisation and the
discrete quotient `V/T`; the splitting class and its cup-product formula; the conjugation action,
evaluation cup product and `H¹` comparison of the continuous `Hom` from a profinite source (its
discreteness is `discreteTopology_continuousAddMonoidHom` above); continuous factor-set
extensions and the continuous Schreier classification; unbalanced cochain products; the
first-quadrant and Hochschild–Serre spectral sequences, the transgression and its cup-product
formula, finite-index descent, the compact Hochschild–Serre and five-term sequences; the Laurent
residue sequence and the cyclotomic power kernel; the localization maps with their modified
archimedean groups; the `S`-ideles, `S`-units and `S`-idele classes, `P`-class formations, the
`S`-class formation, its reciprocity and the `S`-unit Kummer sequence; the global function-field
class-field inputs (Chebotarev density for global function fields is cited from
ArithmeticGaloisRepresentations §5.13 / **Chebotarev for function fields**); the one-new-prime
Kummer fields, the antiunit class-field rank with its lower-field tower and all-primes splitting
sets, and the absence of `ℤ_p`-extensions unramified at `p`;
Ext of discrete modules, Tate's duality for a class formation and for the `S`-idele classes, the finite dual `M^D`, archimedean local duality, the
exact annihilators of unramified classes, the restricted-product self-duality, Poitou–Tate duality
and the nine-term sequence, global finiteness, cohomological dimension, `H²` surjectivity,
high-degree cohomology of the units, the equivariant Kummer Euler class (including its S-unit character, class-group cancellation
and p-primary idele comparison), the Euler characteristic with real places, the decomposition
map, all-place `Ш` duality, Grunwald–Wang with its dyadic obstruction, character roots, Tate's
vanishing of `H²(G_K, ℚ/ℤ)`, torus local evaluation with integral annihilators and modified
archimedean points, the completed all-place torus sequence, compactness of the modified torus
quotient and realization of the completed image by actual adelic points, torus Sha duality,
the function-field Poitou–Tate theorem and central
obstructions, and totally real local base change; perfect amplitude and Tor for the module-derived
tensor supplied by DerivedDeRhamCohomology §0.2, Matlis duality, the derived
composite spectral sequence, adic continuous-map flatness, the Hilbert–Samuel Euler function,
the residual criterion for perfect amplitude, the dualizing complex and local duality for complete
local rings, continuous cochains in the
derived category, the local and global invariant trivialisations, derived local and global
duality, compactly supported cup products and Euler characteristics, the lattice and rational
Poitou–Tate sequences, `Ext` of abelian varieties by `G_m` on the big étale site of a field,
abelian-variety local duality and the isogeny sequence; the arithmetic compact-support
identification and specialization of the archimedean cohomology and H⁰ corrections for the
Selmer fibres and comparison triangle supplied by SelmerIwasawaCohomology §§2.21–2.22, and the
Greenberg–Wiles formula;
the Selmer tangent comparison,
the full real Tate trace sequence, and derived coefficient
change; and the Taylor–Wiles local count, dual-Selmer killing, the `Σ`-criterion, the
Khare–Wintenberger relation bounds, odd and dyadic Taylor–Wiles primes and finite-order determinant
twists.

The torus completion is the inverse limit over open subgroups of finite index of the entire
modified adelic restricted product. Local completed point groups enter local duality; the
global image realization uses the finite torus class sets supplied by AdelicAlgebraicGroups
§3.4 and compactness modulo the closure of rational points. The README specifies these targets
with their integral subgroups, evaluation maps and completion comparisons.

The Nakamura cochain tensor comparisons retain perfectness as an explicit hypothesis in the
dyadic global case. Real places can produce unbounded cohomology for the trivial `ℤ₂`
representation; induction from `G_{ℚ(i),Σ_F}` gives a rank-two finite-free representation
whose cohomology is perfect by compact Shapiro and the totally imaginary amplitude theorem.

The README names the following definitions and API of those targets, which are therefore not
declared here.

* `CompactCoefficients`: `moduleDerivedLimit_compare`, `homPt_equiv_internalHom`,
  `sections_nonempty_iff`, `splittingClass`,
  `splittingClass_eq_zero_iff`, `pointwiseHomRepresentation`, `pointwiseHomRepresentation_apply`,
  `continuousHomRepresentation`, `continuousHomCup`, `h1Equiv_continuousHom`, `factorSetClass`,
  `factorSetClass_rescale`, `factorSetClass_eq_extensionClass`, `factorSetClass_eq_zero_iff`.
* `DoubleComplex`: `spectralSequence`, `e2Iso`, `abutmentFiltration`, `eInftyIsoGr`,
  `page_eq_eInfty`, `edgeBottom`, `edgeLeft`, `fiveTerm_exact`, `exact_of_rows_vanish`,
  `totalCohomology_of_exact_rows`, `spectralSequence_map`.
* `HochschildSerre`: `spectralSequence`, `abutmentIso`, `edgeBottom_eq_inflation`,
  `edgeLeft_eq_restriction`, `map`, `res`, `cor`, `cup`.
* `RestrictedRamification`: `toGaloisGroupS_surjective`, `maxUnramifiedOutside_of_le`,
  `localCohomology`, `locMap`, `locMap_indep`, `locMap_delta`, `locMap_eq_restriction`,
  `unramifiedSubgroup`, `unramifiedH1Equiv`, `unramifiedSubgroup_two_eq_bot`, `sIdeles`, `sUnits`,
  `sIdeleClasses`, `limitModules`, `sIdeleClasses_exact`, `pic_eq_bot_of_cofinite`,
  `sIdeles_all`.
* `GlobalFunctionField`: `ideles`, `ideleClassGroup`, `ideleDegree`, `sUnits`, `sClassGroup`,
  `maxUnramifiedOutside`, `galoisGroupS`, `classFormation`.
* `ClassFormation.PClassFormation` with `ofClassFormation`, `quotient`, `restrict`,
  `invPrimaryEquiv` and `fundamentalClass`.
* `DiscreteExt`: `isGrothendieckAbelian`, `Ext`, `extZeroEquiv`, `extIntEquivCohomology`,
  `yonedaPairing`, `extEquivCohomologyHom`, `ext_colimit`, `extShapiro`, `ext_isTorsion`.
* `PoitouTate`: `compactSpace_P0`, `locallyCompactSpace_P1`, `restrictedProductCohomology_eq_sum`,
  `sha_map`.
* `ArithmeticDuality`: `quotientFactoringCochains`, `unbalancedProduct`,
  `unbalancedProduct_leibniz`, `unbalancedProduct_zeroDegree`, `factoringDifferential`,
  `productTensorIso`, `unbalancedProduct_one`, `relativeSha`, `finiteCompactCochains`,
  `finiteCompactCohomology`, `finiteCompact_exact`, `finiteCompact_map`, `hilbertSamuelPolynomial`,
  `hilbertSamuelPolynomial_eventual`, `hilbertSamuelEuler`, `hilbertSamuelEuler_coefficient`,
  `hilbertSamuelEuler_exact`, `admissible_of_finite`, `admissible_of_finiteType`,
  `algebraicContinuousCochains`, `algebraicContinuousCohomology`, `algebraicCohomology_compare`,
  `continuousCochains_d_squared`.
* `GaloisCohomology`: `dualizingHom`, `localDualityMap`, `localDualityMap'`, `localDualityPairing`,
  `localDualityMap_indep`, `compactCochains_embedding`, `compactCochains_finite`,
  `compactCochains_diff`, `compactCupLeft`, `compactCupRight`, `compactCupLeft_leibniz`,
  `compactCupRight_leibniz`, `compactCup_forget`, `compactCupLeft_coordinates`,
  `compactCupRight_coordinates`.

-/

end TauCetiRoadmap.ArithmeticGaloisDuality

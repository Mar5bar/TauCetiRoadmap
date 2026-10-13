import Mathlib
import TauCeti.Topology.Spectral.ProConstructible
import TauCeti.RingTheory.Huber.Basic
import TauCeti.RingTheory.Huber.Pair
import TauCeti.AlgebraicGeometry.AdicSpace.ValuationSpectrum.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.PreAdicSpace.Hom
import TauCetiRoadmap.PerfectoidSpaces.Suggested

/-!
# Diamonds and v-stacks: representative target signatures

The README is the definitive specification. These are suggested forms for the targets that can be
stated against Mathlib, Tau Ceti and the PerfectoidSpaces roadmap as they stand: the spectral
topology of D0, the topological part of the disconnected perfectoid spaces of D1, the v-topology
on Tau Ceti's perfectoid spaces with its descent theorems (D2–D3), and the Berkovich spectrum and
the component formula of D5. Constructions that are themselves formalisation targets (pro-étale
morphisms and sites, stackification, diamonds, their underlying spaces, spatial diamonds, marked
untilts and `Spd`) are specified in the README only.
-/

noncomputable section

namespace TauCetiRoadmap.DiamondsAndVStacks

open CategoryTheory Topology TauCeti TauCeti.Huber TauCeti.ValuationSpectrum
open TauCetiRoadmap.PerfectoidSpaces.Perfectoid TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace

universe u

/-! ## Layer D0: spectral, categorical and size foundations -/

/-- A topological space is *locally spectral* if it has an open cover by spectral subspaces
(ECD Definition 2.1, p. 10). -/
def IsLocallySpectralSpace (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ x : X, ∃ U : Set X, IsOpen U ∧ x ∈ U ∧ SpectralSpace U

-- Check: discrete `ℕ` is locally spectral and not quasicompact, so not spectral.
example : IsLocallySpectralSpace ℕ ∧ ¬ CompactSpace ℕ := sorry

-- Negative control: `ℝ` is not locally spectral (no nonempty open is quasicompact).
example : ¬ IsLocallySpectralSpace ℝ := sorry

/-- A space is spectral iff it is locally spectral, quasicompact and quasiseparated (KL15
§8.1, text after Definition 8.1.1, p. 157). -/
theorem spectralSpace_iff_isLocallySpectralSpace (X : Type u) [TopologicalSpace X] :
    SpectralSpace X ↔ IsLocallySpectralSpace X ∧ CompactSpace X ∧ QuasiSeparatedSpace X := sorry

/-- A map is *locally spectral* if it is continuous and, whenever open subspaces `U ⊆ X` and
`V ⊆ Y` are spectral and `f(U) ⊆ V`, the restriction `U → V` is a spectral map (ECD Definition 2.1,
p. 10, where this is the notion of a spectral map of locally spectral spaces). Unlike Mathlib's
global `IsSpectralMap`, it does not ask that preimages of quasicompact opens of `Y` be
quasicompact. -/
def IsLocallySpectralMap {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) :
    Prop :=
  Continuous f ∧ ∀ (U : Set X) (V : Set Y) (hUV : Set.MapsTo f U V), IsOpen U → IsOpen V →
    SpectralSpace U → SpectralSpace V → IsSpectralMap (Set.MapsTo.restrict f U V hUV)

/-- Between spectral spaces the local condition is Mathlib's global `IsSpectralMap` (ECD
Definition 2.1, p. 10). -/
theorem isLocallySpectralMap_iff_isSpectralMap {X Y : Type u} [TopologicalSpace X]
    [TopologicalSpace Y] [SpectralSpace X] [SpectralSpace Y] {f : X → Y} :
    IsLocallySpectralMap f ↔ IsSpectralMap f := sorry

-- Negative control: the agreement needs a spectral source. The inclusion of discrete `ℕ` into its
-- one-point compactification is locally spectral (the spectral opens of `ℕ` are finite) but not
-- `IsSpectralMap`, since the preimage of the whole space is `ℕ`.
example : IsLocallySpectralMap ((↑) : ℕ → OnePoint ℕ) ∧ ¬ IsSpectralMap ((↑) : ℕ → OnePoint ℕ) :=
  sorry

-- Check: the projection `ℕ × ℕ → ℕ` of discrete spaces is locally spectral and not
-- `IsSpectralMap`, since the preimage of `{0}` is infinite.
example : IsLocallySpectralMap (Prod.fst : ℕ × ℕ → ℕ) ∧ ¬ IsSpectralMap (Prod.fst : ℕ × ℕ → ℕ) :=
  sorry

-- Negative control: `x ↦ (x ≠ ∞)` from the one-point compactification of `ℕ` to the Sierpiński
-- space is continuous between spectral spaces but not locally spectral, as the preimage of the
-- quasicompact open `{True}` is `ℕ`. It is the composite of `n ↦ 1/(n+1)`, `∞ ↦ 0` with positivity
-- `ℝ → Prop`, both locally spectral because `ℝ` has no nonempty spectral open.
example : Continuous (fun x : OnePoint ℕ ↦ x ≠ OnePoint.infty) ∧
    ¬ IsLocallySpectralMap (fun x : OnePoint ℕ ↦ x ≠ OnePoint.infty) := sorry

/-- The constructible topology of a spectral space is Hausdorff and totally disconnected (ECD §2,
paragraph after Theorem 2.2, p. 10); with Mathlib's `compactSpace_withConstructibleTopology` it is
profinite. -/
theorem WithConstructibleTopology.t2Space_totallyDisconnectedSpace (X : Type u)
    [TopologicalSpace X] [SpectralSpace X] :
    T2Space (WithConstructibleTopology X) ∧
      TotallyDisconnectedSpace (WithConstructibleTopology X) := sorry

-- Check: on the Sierpiński space `Prop` (open point `True`) the constructible topology is
-- discrete.
example : constructibleTopology Prop = ⊥ := sorry

/-- The image of a pro-constructible subset under a spectral map of spectral spaces is
pro-constructible (ECD Lemma 2.3, p. 10). -/
theorem isProConstructible_image {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    [SpectralSpace X] [SpectralSpace Y] {f : X → Y} (hf : IsSpectralMap f) {S : Set X}
    (hS : IsProConstructible S) : IsProConstructible (f '' S) := sorry

/-- The closure of a pro-constructible subset of a spectral space is its set of specializations
(ECD Lemma 2.4, pp. 10–11). -/
theorem closure_eq_setOf_specializes_of_isProConstructible {X : Type u} [TopologicalSpace X]
    [SpectralSpace X] {S : Set X} (hS : IsProConstructible S) :
    closure S = {y | ∃ x ∈ S, x ⤳ y} := sorry

-- Check: in the Sierpiński space `True` specializes to `False` and not conversely.
example : (True ⤳ False) ∧ ¬ (False ⤳ True) := sorry

/-- Dually, a pro-constructible subset of a spectral space that is stable under generalization is
the intersection of the quasicompact opens containing it (ECD proof of Lemma 2.7, p. 12). -/
theorem eq_sInter_of_isProConstructible_of_stableUnderGeneralization {X : Type u}
    [TopologicalSpace X] [SpectralSpace X] {S : Set X} (hS : IsProConstructible S)
    (hg : StableUnderGeneralization S) : S = ⋂₀ {U | IsOpen U ∧ IsCompact U ∧ S ⊆ U} := sorry

/-- A surjective generalizing spectral map of spectral spaces is a quotient map (ECD Lemma 2.5,
p. 11). -/
theorem isQuotientMap_of_generalizingMap {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    [SpectralSpace X] [SpectralSpace Y] {f : X → Y} (hf : IsSpectralMap f)
    (hg : GeneralizingMap f) (hs : Function.Surjective f) : IsQuotientMap f := sorry

-- Negative control: the identity from the constructible topology of the Sierpiński space is a
-- continuous bijection that is not a quotient map; it is not generalizing.
example : ¬ IsQuotientMap (WithTopology.equiv Prop (constructibleTopology Prop)) := sorry

/-- **The spectral quotient criterion** (ECD Lemma 2.9, pp. 12–13). For a spectral space `X` and an
equivalence relation whose graph is pro-constructible in `X × X` and whose two projections are
generalizing, if the quotient topology has a basis of opens with quasicompact preimages then the
quotient is spectral and the projection is spectral and generalizing. -/
theorem spectralSpace_quotient {X : Type u} [TopologicalSpace X] [SpectralSpace X] (r : Setoid X)
    (hR : IsProConstructible {q : X × X | r q.1 q.2})
    (hs : GeneralizingMap fun q : {q : X × X // r q.1 q.2} ↦ q.1.1)
    (ht : GeneralizingMap fun q : {q : X × X // r q.1 q.2} ↦ q.1.2)
    (hB : ∃ B : Set (Set (Quotient r)), TopologicalSpace.IsTopologicalBasis B ∧
      ∀ V ∈ B, IsCompact (Quotient.mk r ⁻¹' V)) :
    SpectralSpace (Quotient r) ∧ IsSpectralMap (Quotient.mk r) ∧
      GeneralizingMap (Quotient.mk r) := sorry

/-- A cofiltered limit of spectral spaces along spectral maps is spectral, with spectral
projections (ECD Lemma 2.11, pp. 13–14). -/
theorem spectralSpace_limit {I : Type u} [Category.{u} I] [IsCofiltered I] (F : I ⥤ TopCat.{u})
    [∀ i, SpectralSpace (F.obj i)] (hF : ∀ ⦃i j : I⦄ (a : i ⟶ j), IsSpectralMap (F.map a)) :
    SpectralSpace (Limits.limit F : TopCat.{u}) ∧
      ∀ i, IsSpectralMap (Limits.limit.π F i).hom := sorry

/-- **Hochster's theorem**: a topological space is spectral exactly when it is homeomorphic to the
prime spectrum of a commutative ring (ECD Theorem 2.2 (i)⇔(ii), p. 10). -/
theorem spectralSpace_iff_nonempty_homeomorph_primeSpectrum (X : Type u) [TopologicalSpace X] :
    SpectralSpace X ↔ ∃ (A : Type u) (_ : CommRing A), Nonempty (X ≃ₜ PrimeSpectrum A) := sorry

-- Check: the Sierpiński space is the spectrum of `ℤ_p`, with `True` the generic point.
example (p : ℕ) [Fact p.Prime] : Nonempty (Prop ≃ₜ PrimeSpectrum ℤ_[p]) := sorry

-- Negative control: no finite ring realizes the Sierpiński space (finite rings have discrete
-- spectra).
example (A : Type) [CommRing A] [Finite A] : IsEmpty (Prop ≃ₜ PrimeSpectrum A) := sorry

/-- The *inverse* (Hochster dual) topology, generated by the complements of the quasicompact opens
(KL15 remark in Definition 8.1.4, p. 157, after Hochster). -/
@[instance_reducible]
def inverseTopology (X : Type u) [TopologicalSpace X] : TopologicalSpace X :=
  TopologicalSpace.generateFrom {U | ∃ V : Set X, IsOpen V ∧ IsCompact V ∧ U = Vᶜ}

/-- The inverse topology of a spectral space is spectral, and it reverses specialization
(KL15 Definition 8.1.4, p. 157). -/
theorem spectralSpace_inverseTopology (X : Type u) [t : TopologicalSpace X] [SpectralSpace X] :
    @SpectralSpace X (inverseTopology X) ∧
      ∀ x y : X, @Specializes X (inverseTopology X) x y ↔ @Specializes X t y x := sorry

-- Check: in the inverse Sierpiński topology the closed point `False` becomes open.
example : IsOpen[inverseTopology Prop] {False} ∧ ¬ IsOpen {False} := sorry

-- Negative control: on discrete `ℕ` the inverse topology is cofinite and not quasi-sober.
example : ¬ @QuasiSober ℕ (inverseTopology ℕ) := sorry

/-- The space of connected components of a spectral space is Hausdorff, hence profinite with
Mathlib's `Quotient.compactSpace` and `ConnectedComponents.totallyDisconnectedSpace` (ECD proof of
Lemma 7.3(i), p. 31). -/
theorem t2Space_connectedComponents (X : Type u) [TopologicalSpace X] [SpectralSpace X] :
    T2Space (ConnectedComponents X) := sorry

/-- The quotient of a compact Hausdorff space by a closed equivalence relation is Hausdorff
(ECD Remark 2.8, p. 12, where compact Hausdorff spaces arise this way from profinite sets). -/
theorem t2Space_quotient_of_isClosed {S : Type u} [TopologicalSpace S] [CompactSpace S]
    [T2Space S] (r : Setoid S) (hr : IsClosed {q : S × S | r q.1 q.2}) :
    T2Space (Quotient r) := sorry

-- Negative control: the relation `x - y ∈ ℤ` on `ℤ_p` is not closed and the quotient is not
-- Hausdorff.
example (p : ℕ) [Fact p.Prime] : ¬ T2Space (ℤ_[p] ⧸ (Int.castAddHom ℤ_[p]).range) := sorry

/-- On an irreducible space the constant sheaf is flasque (proof of Stacks Tag 02UW); its
positive-degree cohomology then vanishes by Tau Ceti's
`TauCeti.Topology.subsingleton_H_succ_of_isFlasque`. -/
theorem isFlasque_constantSheaf (X : TopCat.{u}) [IrreducibleSpace X]
    [HasSheafify (Opens.grothendieckTopology X) AddCommGrpCat.{u}] (A : AddCommGrpCat.{u}) :
    TopCat.Presheaf.IsFlasque
      ((constantSheaf (Opens.grothendieckTopology X) AddCommGrpCat.{u}).obj A).obj := sorry

/-- A *cutoff cardinal* (ECD Lemma 4.1, p. 19): an uncountable strong limit of uncountable
cofinality below which there are strong limits of arbitrarily large cofinality. -/
def IsCutoffCardinal (κ : Cardinal.{u}) : Prop :=
  Cardinal.aleph0 < κ ∧ κ.IsStrongLimit ∧ Cardinal.aleph0 < κ.ord.cof ∧
    ∀ lam < κ, ∃ μ < κ, μ.IsStrongLimit ∧ lam < μ.ord.cof

/-- Cutoff cardinals are cofinal (ECD Lemma 4.1, pp. 19–20). -/
theorem exists_isCutoffCardinal_gt (lam : Cardinal.{u}) : ∃ κ, lam < κ ∧ IsCutoffCardinal κ :=
  sorry

-- Negative control: `ℵ₀` is a strong limit but not a cutoff cardinal.
example : ¬ IsCutoffCardinal Cardinal.aleph0.{u} :=
  fun h ↦ lt_irrefl _ h.1

-- Negative control: `ℶ_ω` is an uncountable strong limit of countable cofinality.
example : ¬ IsCutoffCardinal (Cardinal.beth.{u} Ordinal.omega0) := sorry

/-! ## Layer D1: disconnected perfectoid spaces -/

/-- *Every open cover splits*: for every open cover there is a locally constant choice of a member
containing each point, i.e. a section of `⨆ Uᵢ → X` (ECD Definition 7.1, p. 29). -/
def OpenCoversSplit (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ 𝒰 : Set (Set X), (∀ U ∈ 𝒰, IsOpen U) → ⋃₀ 𝒰 = Set.univ →
    ∃ s : X → Set X, (∀ x, s x ∈ 𝒰 ∧ x ∈ s x) ∧ ∀ U, IsOpen (s ⁻¹' {U})

-- Check: open covers of the connected Sierpiński space split (the closed point forces the member
-- `univ`); negative control: the cover of `ℝ` by `(-∞, 1)` and `(0, ∞)` does not split.
example : OpenCoversSplit Prop ∧ ¬ OpenCoversSplit ℝ := sorry

/-- **Fargues' characterisation** (ECD Lemma 7.2 (i)⇔(ii), pp. 29–30): every open cover of a
spectral space splits iff every connected component has a unique closed point. -/
theorem openCoversSplit_iff (X : Type u) [TopologicalSpace X] [SpectralSpace X] :
    OpenCoversSplit X ↔ ∀ x : X, ∃! y : X, y ∈ connectedComponent x ∧ IsClosed {y} := sorry

/-- A pre-adic space is *totally disconnected* if it is quasicompact, quasiseparated and every open
cover splits (ECD Definition 7.1, p. 29, for perfectoid spaces). -/
def isTotallyDisconnected : ObjectProperty PreAdicSpace.{u} := fun X ↦
  CompactSpace X ∧ QuasiSeparatedSpace X ∧ OpenCoversSplit X

-- Negative control: splitting alone does not give quasicompactness (discrete `ℕ`).
example : OpenCoversSplit ℕ ∧ ¬ CompactSpace ℕ := sorry

-- Check: an empty pre-adic space is totally disconnected.
example (X : PreAdicSpace.{u}) [IsEmpty X] : isTotallyDisconnected X := sorry

/-- A *w-local* space (BS15 Definition 2.1.1, p. 6; ECD Definition 7.4, p. 31): a spectral space
all of whose open covers split and whose closed points form a closed subset. -/
def IsWLocalSpace (X : Type u) [TopologicalSpace X] : Prop :=
  SpectralSpace X ∧ OpenCoversSplit X ∧ IsClosed {x : X | IsClosed ({x} : Set X)}

/-- In a w-local space the closed points map homeomorphically onto the space of connected
components (BS15 Lemma 2.1.4, p. 6). -/
theorem IsWLocalSpace.isHomeomorph_connectedComponentsMk {X : Type u} [TopologicalSpace X]
    (hX : IsWLocalSpace X) :
    IsHomeomorph fun x : {x : X | IsClosed ({x} : Set X)} ↦ ConnectedComponents.mk (x : X) := sorry

-- Check: the Sierpiński space is w-local; discrete `ℕ` is not (it is not spectral).
example : IsWLocalSpace Prop ∧ ¬ IsWLocalSpace ℕ := sorry

variable (p : ℕ) [Fact p.Prime]

/-- **Totally disconnected perfectoid spaces are affinoid** (ECD Lemma 7.5, p. 31). -/
theorem isAffinoidPerfectoid_of_isTotallyDisconnected (X : Perfd.{u} p)
    (hX : isTotallyDisconnected X.obj) : isAffinoidPerfectoid p X.obj := sorry

section Flatness

variable {R S : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
  [IsTateRing R] [CompleteSpace R] [T2Space R]
  [CommRing S] [UniformSpace S] [IsUniformAddGroup S] [IsTopologicalRing S] [IsTateRing S]
  [CompleteSpace S] [T2Space S]

/-- **Automatic flatness** (ECD Proposition 7.23, pp. 38–39). Let `Spa(R, R⁺)` be totally
disconnected (its underlying space is spectral, so this is the splitting of open covers) and
`φ : (R, R⁺) → (S, S⁺)` a continuous map of perfectoid Tate pairs. For every pseudouniformiser
`ϖ ∈ R⁺`, the map `R⁺/ϖ → S⁺/ϖ` is flat. -/
theorem flat_quotientMap_of_openCoversSplit [IsPerfectoidTateRing p R]
    [IsPerfectoidTateRing p S] (PR : Pair R) (PS : Pair S)
    (hX : OpenCoversSplit (spa PR.plus)) (φ : R →+* S) (hφ : Continuous φ)
    (hplus : ∀ x ∈ PR.plus, φ x ∈ PS.plus) (ϖ : PR.plus) (hϖ : IsPseudoUniformizer (ϖ : R)) :
    (Ideal.quotientMap ((Ideal.span {ϖ}).map (φ.restrict PR.plus PS.plus hplus))
      (φ.restrict PR.plus PS.plus hplus) Ideal.le_comap_map).Flat := sorry

/-- The faithfully flat case of ECD Proposition 7.23: if moreover `Spa(S, S⁺) → Spa(R, R⁺)` is
surjective, then `R⁺/ϖ → S⁺/ϖ` is faithfully flat. -/
theorem faithfullyFlat_quotientMap_of_openCoversSplit [IsPerfectoidTateRing p R]
    [IsPerfectoidTateRing p S] (PR : Pair R) (PS : Pair S)
    (hX : OpenCoversSplit (spa PR.plus)) (φ : R →+* S) (hφ : Continuous φ)
    (hplus : ∀ x ∈ PR.plus, φ x ∈ PS.plus)
    (hsurj : ∀ x ∈ spa PR.plus, ∃ y ∈ spa PS.plus, comap φ y = x)
    (ϖ : PR.plus) (hϖ : IsPseudoUniformizer (ϖ : R)) :
    (Ideal.quotientMap ((Ideal.span {ϖ}).map (φ.restrict PR.plus PS.plus hplus))
      (φ.restrict PR.plus PS.plus hplus) Ideal.le_comap_map).FaithfullyFlat := sorry

end Flatness

/-! ## Layer D2: the pro-étale and v-topologies -/

/-- The *v-precoverage* on a category with an underlying-space functor `F`: a presieve on `X`
covers if every quasicompact open `U` of `F X` is a finite union of images of quasicompact opens
of members of the presieve (ECD Definition 8.1(iii), p. 39). -/
def vPrecoverage {C : Type*} [Category C] (F : C ⥤ TopCat.{u}) : Precoverage C where
  coverings X := {R | ∀ U : Set (F.obj X), IsOpen U → IsCompact U →
    IsCompactOpenCovered (fun i : R.uncurry ↦ ((F.map i.1.2).hom : F.obj i.1.1 → F.obj X)) U}

/-- The underlying topological space of a perfectoid space. -/
abbrev perfdToTop : Perfd.{u} p ⥤ TopCat.{u} :=
  ObjectProperty.ι _ ⋙ PreAdicSpace.forgetToTop

/-- The *v-topology* on the category of perfectoid spaces (ECD Definition 8.1(iii)). -/
def vTopology : GrothendieckTopology (Perfd.{u} p) :=
  (vPrecoverage (perfdToTop p)).toGrothendieck

-- Negative control: the point inclusions of an infinite profinite set are jointly surjective but
-- no finite subfamily covers by images of quasicompact opens.
example (T : Type) [TopologicalSpace T] [CompactSpace T] [T2Space T] [TotallyDisconnectedSpace T]
    [Infinite T] : ¬ IsCompactOpenCovered (fun (t : T) (_ : PUnit.{1}) ↦ t) Set.univ := sorry

-- Check: the empty presieve covers a perfectoid space exactly when the space is empty.
example (X : Perfd.{u} p) :
    (⊥ : Presieve X) ∈ vPrecoverage (perfdToTop p) X ↔ IsEmpty X.obj := sorry

/-- A map from a quasicompact perfectoid space to a quasiseparated one is a v-cover iff it is
surjective (ECD Definition 8.1(iii), p. 39, as used in the proof of Theorem 8.7, p. 43). -/
theorem singleton_mem_vPrecoverage_iff_surjective {X Y : Perfd.{u} p} (f : Y ⟶ X)
    [CompactSpace Y.obj] [QuasiSeparatedSpace X.obj] :
    Presieve.singleton f ∈ vPrecoverage (perfdToTop p) X ↔
      Function.Surjective ((perfdToTop p).map f).hom := sorry

/-- The structure presheaf `X ↦ O_X(X)` on perfectoid spaces. -/
def structurePresheaf : (Perfd.{u} p)ᵒᵖ ⥤ CommRingCat.{u} :=
  (ObjectProperty.ι _ ⋙ PreAdicSpace.forgetToPresheafedSpace).op ⋙
    AlgebraicGeometry.PresheafedSpace.Γ ⋙ TopCommRingCat.isCompleteSeparated.ι ⋙
      forget₂ TopCommRingCat CommRingCat

-- Check: the value at `X` is the ring of global sections `O_X(X)`, not a stalk.
example (X : Perfd.{u} p) :
    ((structurePresheaf p).obj (Opposite.op X) : Type u) =
      X.obj.toRingPresheafedSpace.presheaf.obj (Opposite.op ⊤) := rfl

-- Check `structurePresheaf_empty`: on an empty perfectoid space the value is a subsingleton ring,
-- by the sheaf condition for the empty cover (the zero ring maps to the terminal value `O_X(∅)`).
example (X : Perfd.{u} p) [IsEmpty X.obj] :
    Subsingleton ((structurePresheaf p).obj (Opposite.op X)) := by
  have hX : PreAdicSpace.isSheafy X.obj := X.property.1
  let Z : CompleteSeparatedTopCommRingCat.{u} :=
    ⟨TopCommRingCat.of PUnit, TopCommRingCat.isCompleteSeparated_of_completeSpace_of_t0Space _⟩
  have hT := TopCat.Sheaf.isTerminalOfEqEmpty ⟨_, hX⟩ (U := ⊤) (Subsingleton.elim _ _)
  let f := (hT.from Z).hom.1
  exact subsingleton_of_zero_eq_one
    ((map_zero f).symm.trans ((congrArg f (Subsingleton.elim 0 1)).trans (map_one f)))

-- Check `structurePresheaf_map`: the map along `f : Y ⟶ X` is the pullback of global sections
-- `O_X(X) → O_Y(Y)`, the component of `f` at the top open, so the presheaf is not constant in `X`.
example {X Y : Perfd.{u} p} (f : Y ⟶ X) :
    (structurePresheaf p).map f.op = (forget₂ TopCommRingCat CommRingCat).map
      (TopCommRingCat.isCompleteSeparated.ι.map (f.hom.c.app (Opposite.op ⊤))) := rfl

/-- **`O` is a v-sheaf** (ECD Theorem 8.7, p. 43). -/
theorem isSheaf_structurePresheaf : Presheaf.IsSheaf (vTopology p) (structurePresheaf p) := sorry

/-- **The v-topology is subcanonical** (ECD Theorem 8.7, p. 43). -/
theorem vTopology_subcanonical : (vTopology.{u} p).Subcanonical := sorry

/-! ## Layer D3: effective descent and morphisms of stacks -/

/-- For every topological space `T`, the presheaf `T̲ : X ↦ C(|X|, T)` is a v-sheaf (ECD §10,
before Definition 10.12, p. 53). -/
theorem isSheaf_yonedaPresheaf (T : Type u) [TopologicalSpace T] :
    Presieve.IsSheaf (vTopology p) (ContinuousMap.yonedaPresheaf (perfdToTop p) T) := sorry

/-! ## Layer D5: spatial geometry and Hausdorff reduction -/

/-- The normalised *Berkovich spectrum* of a topological ring `R` at `ϖ`: continuous
nonarchimedean multiplicative seminorms `α` with `α ϖ = 1/2`, with the topology of pointwise
convergence (ECD Definition 13.7, p. 79; for a Tate ring continuity is boundedness). -/
def BerkovichSpectrum (R : Type u) [CommRing R] [TopologicalSpace R] (ϖ : R) : Type u :=
  {α : MulRingSeminorm R // Continuous α ∧ IsNonarchimedean (α : R → ℝ) ∧ α ϖ = 1 / 2}

instance (R : Type u) [CommRing R] [TopologicalSpace R] (ϖ : R) :
    TopologicalSpace (BerkovichSpectrum R ϖ) :=
  TopologicalSpace.induced (fun α : BerkovichSpectrum R ϖ ↦ (α.1 : R → ℝ)) inferInstance

-- Negative control: the normaliser `ϖ = 0` gives the empty spectrum.
example (R : Type u) [CommRing R] [TopologicalSpace R] : IsEmpty (BerkovichSpectrum R 0) :=
  ⟨fun α ↦ by have := α.2.2.2; rw [map_zero] at this; norm_num at this⟩

-- Check: for `ℚ_p` at `ϖ = p` the spectrum is one point, the `p`-adic norm raised to
-- `log 2 / log p`.
example (p : ℕ) [Fact p.Prime] :
    Nonempty (BerkovichSpectrum ℚ_[p] p) ∧ Subsingleton (BerkovichSpectrum ℚ_[p] p) := sorry

/-- **The Berkovich spectrum is the maximal Hausdorff quotient of `Spa`** (ECD Proposition 13.9,
p. 79). For a complete Hausdorff Tate ring `R` with a ring of integral elements `R⁺` and a
pseudouniformiser `ϖ`, the maximal Hausdorff quotient of `Spa(R, R⁺)` is the normalised Berkovich
spectrum, which is compact Hausdorff. -/
theorem nonempty_t2Quotient_spa_homeomorph {R : Type u} [CommRing R] [UniformSpace R]
    [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R]
    (P : Pair R) {ϖ : R} (hϖ : IsPseudoUniformizer ϖ) :
    CompactSpace (BerkovichSpectrum R ϖ) ∧ T2Space (BerkovichSpectrum R ϖ) ∧
      Nonempty (T2Quotient (spa P.plus) ≃ₜ BerkovichSpectrum R ϖ) := sorry

/-- **Components of a quotient by a compact group** (GLX Lemma 3.2, corrected; the spectral case of
README §D5.16). For a compact group acting continuously on a spectral space, two points have the
same component in the orbit space iff one lies in the component of a translate of the other. -/
theorem connectedComponents_mk_quotient_eq_iff {G X : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TopologicalSpace X] [SpectralSpace X]
    [MulAction G X] [ContinuousSMul G X] (x y : X) :
    ConnectedComponents.mk (Quotient.mk (MulAction.orbitRel G X) x) =
        ConnectedComponents.mk (Quotient.mk (MulAction.orbitRel G X) y) ↔
      ∃ g : G, ConnectedComponents.mk (g • x) = ConnectedComponents.mk y := sorry

-- Negative control: compactness cannot be dropped. The translation orbits of the discrete group
-- `ℤ` on the totally disconnected `ℤ_p` are dense, so the orbit space `ℤ_p/ℤ` (uncountably many
-- orbits) is connected.
example (p : ℕ) [Fact p.Prime] :
    TotallyDisconnectedSpace ℤ_[p] ∧ PreconnectedSpace (ℤ_[p] ⧸ (Int.castAddHom ℤ_[p]).range) :=
  sorry

end TauCetiRoadmap.DiamondsAndVStacks

import Mathlib
import TauCetiRoadmap.SchemeAndStackFoundations.Suggested

/-!
# EnhancedDerivedSheaves: representative target signatures

The roadmap is `README.md`. This file records the definitions and theorem signatures of the
roadmap that can be stated against the pinned Mathlib and Tau Ceti; it is not exhaustive.
The enhancement itself (the dg nerve, D∞(O), coherent towers, sheaves of spaces, Cat∞, operads,
presentable categories, animated rings and the cotangent complex) is not available at the pins,
so their comparisons and extensions are specified in the README. What is stated here are the parts that
live on carriers the pinned libraries already have, with the conventions they fix:

* categorical equivalences of quasicategories, as equivalences in Mathlib's homotopy bicategory
  `SSet.QCat.bicategory` (not equivalences of homotopy categories);
* the point-site K-flat condition supplied by ClassicalAdicEtaleCohomology §0.2;
* the global dimension of regular rings and Kunz's theorem, on Mathlib's `IsRegularRing`;
* Frobenius-root ideals and Tor independence of perfect `𝔽_p`-algebras;
* `𝔪`-saturation of modules over a valuation ring;
* pro-zero towers, which are a condition on transition maps and not on the limit;
* repleteness from `TauCetiRoadmap.SchemeAndStackFoundations` §2.17, with its countable-product
  consequence; weak contractibility of topos objects uses Mathlib's `CategoryTheory.Projective`;
* derived completeness of a module, through the elementary criterion that
  `(x_n) ↦ (x_n - f • x_{n+1})` is bijective on `ℕ → M` for every `f ∈ I`, and its comparison
  with Mathlib's classical `IsAdicComplete`.
-/

namespace TauCetiRoadmap.EnhancedDerivedSheaves

open CategoryTheory CategoryTheory.Limits Opposite
open scoped ZeroObject
open TauCetiRoadmap.SchemeAndStackFoundations.Proetale (IsReplete)

universe u v w z

/-! ## Layer E0: A concrete enhancement and higher-category operations -/

section CategoricalEquivalence

/-- **Categorical equivalences** (Section E0.2). A map of quasicategories is a categorical
equivalence when it has a quasi-inverse up to invertible 2-morphisms in Mathlib's homotopy
bicategory of quasicategories. This is stronger than an equivalence of homotopy categories:
the one-object dg algebra `ℤ ⊕ ℤε` (`ε` in degree `-1`) and `ℤ` have equivalent homotopy
categories but non-equivalent dg nerves (README, Section E0.2). -/
def IsCategoricalEquivalence {C D : SSet.QCat.{u}} (f : C ⟶ D) : Prop :=
  ∃ g : D ⟶ C, Nonempty (f ≫ g ≅ 𝟙 C) ∧ Nonempty (g ≫ f ≅ 𝟙 D)

/-- The identity of a quasicategory is a categorical equivalence. -/
example (C : SSet.QCat.{u}) : IsCategoricalEquivalence (𝟙 C) :=
  ⟨𝟙 C, ⟨Bicategory.leftUnitor _⟩, ⟨Bicategory.leftUnitor _⟩⟩

/-- Categorical equivalences compose (`categoricalEquivalence_comp`, Section E0.2). -/
theorem categoricalEquivalence_comp {C D E : SSet.QCat.{u}} {f : C ⟶ D} {g : D ⟶ E}
    (hf : IsCategoricalEquivalence f) (hg : IsCategoricalEquivalence g) :
    IsCategoricalEquivalence (f ≫ g) := by
  sorry

/-- Two-out-of-three for categorical equivalences (`categoricalEquivalence_of_comp_left`). -/
theorem categoricalEquivalence_of_comp_left {C D E : SSet.QCat.{u}} {f : C ⟶ D}
    {g : D ⟶ E} (hf : IsCategoricalEquivalence f) (hfg : IsCategoricalEquivalence (f ≫ g)) :
    IsCategoricalEquivalence g := by
  sorry

end CategoricalEquivalence

/-! ## Layer E1: Unbounded derived sheaves and presentability -/

section KFlat

open MonoidalCategory

/-- The point-site K-flat condition of ClassicalAdicEtaleCohomology §0.2 (Section E1.2): a complex
`P` of `R`-modules is K-flat when tensoring with it preserves acyclicity of every unbounded
complex. Termwise flatness is not the definition. The sheaf version replaces `ModuleCat R` by
`SheafOfModules O` with the sheafified tensor product. -/
def IsKFlat (R : Type u) [CommRing R] (P : CochainComplex (ModuleCat.{u} R) ℤ) : Prop :=
  ∀ A : CochainComplex (ModuleCat.{u} R) ℤ, A.Acyclic → (A ⊗ P).Acyclic

/-- The unit complex `R[0]` is K-flat. -/
example (R : Type u) [CommRing R] :
    IsKFlat R ((HomologicalComplex.single (ModuleCat.{u} R) (ComplexShape.up ℤ) 0).obj
      (ModuleCat.of R R)) := by
  sorry

/-- `(ℤ/p)[0]` is not K-flat over `ℤ` (Section E1.2, Checks). -/
example (p : ℕ) (hp : p.Prime) :
    ¬ IsKFlat ℤ ((HomologicalComplex.single (ModuleCat.{0} ℤ) (ComplexShape.up ℤ) 0).obj
      (ModuleCat.of ℤ (ZMod p))) := by
  sorry

/-- A flat module concentrated in any integer degree is K-flat. -/
example (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Flat R M] (n : ℤ) :
    IsKFlat R ((HomologicalComplex.single (ModuleCat.{u} R) (ComplexShape.up ℤ) n).obj
      (ModuleCat.of R M)) := by
  sorry

end KFlat

section RegularRings

open IsLocalRing

/-- **Global dimension of regular rings** (`isRegularRing_projectiveDimension_le`, Section E1.6;
Stacks 00OE and 065T): over a regular ring of Krull dimension at most `d`, every module, finitely
generated or not, has projective dimension at most `d`. -/
theorem isRegularRing_projectiveDimension_le (R : Type u) [CommRing R] [IsRegularRing R] (d : ℕ)
    (hd : ringKrullDim R ≤ d) (M : ModuleCat.{u} R) : HasProjectiveDimensionLE M d := by
  sorry

/-- **The homological criterion for regularity** (Section E1.6; Stacks 00OC): a Noetherian local
ring whose residue field has finite projective dimension is a regular local ring. -/
theorem isRegularLocalRing_of_projectiveDimension_residueField (R : Type u) [CommRing R]
    [IsLocalRing R] [IsNoetherianRing R] (n : ℕ)
    (h : HasProjectiveDimensionLE (ModuleCat.of R (ResidueField R)) n) :
    IsRegularLocalRing R := by
  sorry

/-- **Kunz's theorem, forward direction** (`frobenius_flat_of_isRegular`, Section E1.6; Stacks
0EC0): the absolute Frobenius of a regular ring of characteristic `p` is flat. -/
theorem frobenius_flat_of_isRegular (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime]
    [CharP R p] [IsRegularRing R] : (frobenius R p).Flat := by
  sorry

/-- **Kunz's theorem, converse** (`isRegular_of_frobenius_flat`, Section E1.6; BS17 Corollary
11.35): a Noetherian ring of characteristic `p` with flat Frobenius is regular. -/
theorem isRegular_of_frobenius_flat (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime]
    [CharP R p] [IsNoetherianRing R] (h : (frobenius R p).Flat) : IsRegularRing R := by
  sorry

/-- Every vector space has projective dimension zero. -/
example (k : Type u) [Field k] (M : ModuleCat.{u} k) : HasProjectiveDimensionLE M 0 := by
  sorry

/-- Every abelian group has projective dimension at most one. -/
example (M : ModuleCat.{0} ℤ) : HasProjectiveDimensionLE M 1 := by
  sorry

/-- A prime residue module over the integers is not projective. -/
example (p : ℕ) (hp : p.Prime) :
    ¬ HasProjectiveDimensionLE (ModuleCat.of ℤ (ZMod p)) 0 := by
  sorry

/-- The residue field at the polynomial origin has projective dimension exactly the
number of variables, including the zero-variable case. -/
example (k : Type u) [Field k] (d : ℕ) :
    letI : Algebra (MvPolynomial (Fin d) k) k :=
      (MvPolynomial.constantCoeff : MvPolynomial (Fin d) k →+* k).toAlgebra
    ∀ n : ℕ, HasProjectiveDimensionLE (ModuleCat.of (MvPolynomial (Fin d) k) k) n ↔ d ≤ n := by
  sorry

/-- The residue field of the dual numbers has infinite projective dimension. -/
example (k : Type u) [Field k] (n : ℕ) :
    ¬ HasProjectiveDimensionLE
      (ModuleCat.of (DualNumber k) (ResidueField (DualNumber k))) n := by
  sorry

/-- Dual numbers over a field are not regular, despite their zero Krull dimension. -/
example (k : Type u) [Field k] : ¬ IsRegularRing (DualNumber k) := by
  sorry

/-- Frobenius on a perfect field is flat. -/
example (k : Type u) [Field k] (p : ℕ) [Fact p.Prime] [CharP k p] [PerfectRing k p] :
    (frobenius k p).Flat := by
  sorry

/-- Frobenius on the prime field is flat. -/
example (p : ℕ) [Fact p.Prime] : (frobenius (ZMod p) p).Flat := by
  sorry

/-- Frobenius on the dual numbers over the prime field is not flat. -/
example (p : ℕ) [Fact p.Prime] (B : Type u) [CommRing B] [CharP B p]
    (e : B ≃+* DualNumber (ZMod p)) : ¬ (frobenius B p).Flat := by
  sorry

end RegularRings

section PerfectRings

/-- **Frobenius-root ideals** (`frobeniusRootIdeal`, Section E1.6). In a perfect `𝔽_p`-algebra
this is the union of the ideals generated by the `p^n`-th roots of `f`. -/
def frobeniusRootIdeal (R : Type u) [CommRing R] (f : R) : Ideal R :=
  (Ideal.span {f}).radical

/-- `J_1 = R`. -/
example (R : Type u) [CommRing R] : frobeniusRootIdeal R 1 = ⊤ := by
  simp [frobeniusRootIdeal]

/-- `J_0 = 0` in a perfect ring, which is reduced. -/
example (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime] [CharP R p] [PerfectRing R p] :
    frobeniusRootIdeal R 0 = ⊥ := by
  sorry

/-- The `p^n`-th roots of `f` lie in `J_f` (`frobeniusRootIdeal_root_mem`). -/
theorem frobeniusRootIdeal_root_mem (R : Type u) [CommRing R] (p : ℕ)
    [Fact p.Prime] [CharP R p] [PerfectRing R p] (f : R) (n : ℕ) :
    (iterateFrobeniusEquiv R p n).symm f ∈ frobeniusRootIdeal R f := by
  sorry

/-- **Flatness and idempotence of Frobenius-root ideals** (`frobeniusRootIdeal_flat`,
BS17 proof of Lemma 3.16). -/
theorem frobeniusRootIdeal_flat (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime] [CharP R p]
    [PerfectRing R p] (f : R) :
    Module.Flat R (frobeniusRootIdeal R f) ∧
      frobeniusRootIdeal R f * frobeniusRootIdeal R f = frobeniusRootIdeal R f := by
  sorry

/-- **Tor independence of perfect algebras** (`perfectRing_tor_eq_zero`, BS17 Lemma 3.16).
All three rings are perfect; the statement is false for arbitrary modules over a perfect ring
(README, `perfectRing_tor_dimension_counterexample`). -/
theorem perfectRing_tor_eq_zero (A B C : Type u) [CommRing A] [CommRing B] [CommRing C]
    [Algebra A B] [Algebra A C] (p : ℕ) [Fact p.Prime]
    [CharP A p] [CharP B p] [CharP C p]
    [PerfectRing A p] [PerfectRing B p] [PerfectRing C p] (i : ℕ) :
    IsZero (((CategoryTheory.Tor (ModuleCat.{u} A) (i + 1)).obj (ModuleCat.of A B)).obj
      (ModuleCat.of A C)) := by
  sorry

/-- In the perfect polynomial ring, the first root of the variable lies in its root
ideal and does not lie in its principal ideal. -/
example (p : ℕ) [Fact p.Prime] :
    let R := PerfectClosure (MvPolynomial (Fin 1) (ZMod p)) p
    let t : R := PerfectClosure.of (MvPolynomial (Fin 1) (ZMod p)) p (MvPolynomial.X 0)
    (iterateFrobeniusEquiv R p 1).symm t ∈ frobeniusRootIdeal R t ∧
      (iterateFrobeniusEquiv R p 1).symm t ∉ Ideal.span {t} := by
  sorry

end PerfectRings

section ValuationModules

/-- The multiplication map `M → Hom_V(𝔪, M)`, `x ↦ (a ↦ a • x)` (`valuationSaturationMap`,
Section E1.7). -/
def valuationSaturationMap (V : Type u) [CommRing V] (m : Ideal V)
    (M : Type v) [AddCommGroup M] [Module V M] : M →ₗ[V] (m →ₗ[V] M) where
  toFun x :=
    { toFun := fun a => (a : V) • x
      map_add' := fun a b => by simp [add_smul]
      map_smul' := fun c a => by simp [mul_smul] }
  map_add' x y := by ext a; simp [smul_add]
  map_smul' c x := by ext a; simp [smul_comm (a : V) c x]

/-- **`𝔪`-saturated modules** (`IsValuationSaturated`, Section E1.7, BS17 Lemma 6.14): the
multiplication map `M → Hom_V(𝔪, M)` is bijective. For a nonarchimedean field with
`|K×| = ℝ_{>0}`, a nonzero open ball of finite positive radius fails this, while a closed
ball satisfies it. An open ball with radius outside the value group can be saturated. -/
def IsValuationSaturated (V : Type u) [CommRing V] (m : Ideal V)
    (M : Type v) [AddCommGroup M] [Module V M] : Prop :=
  Function.Bijective (valuationSaturationMap V m M)

/-- The zero module is saturated. -/
example (V : Type u) [CommRing V] (m : Ideal V) : IsValuationSaturated V m PUnit.{v + 1} := by
  sorry

/-- Saturation with respect to the unit ideal holds for every module. -/
example (V : Type u) [CommRing V] (M : Type v) [AddCommGroup M] [Module V M] :
    IsValuationSaturated V ⊤ M := by
  sorry

/-- Saturation with respect to the zero ideal characterizes zero modules. -/
example (V : Type u) [CommRing V] (M : Type v) [AddCommGroup M] [Module V M] :
    IsValuationSaturated V ⊥ M ↔ Subsingleton M := by
  sorry

/-- The valuation ring of a discretely valued p-adic field is not saturated for its
maximal ideal. -/
example (p : ℕ) [Fact p.Prime] :
    ¬ IsValuationSaturated ℤ_[p] (Ideal.span {(p : ℤ_[p])}) ℤ_[p] := by
  sorry

/-- Principal lattices for a valuation with full real value group are saturated,
including the zero lattice. -/
example (K : Type u) [Field K] (val : Valuation K NNReal) (hval : Function.Surjective val)
    (a : K) :
    IsValuationSaturated val.valuationSubring
      (IsLocalRing.maximalIdeal val.valuationSubring)
      (Submodule.span val.valuationSubring {a}) := by
  sorry

end ValuationModules

/-! ## Layer E2:towers: Coherent towers and pro-towers -/

section ProTowers

/-- **Pro-zero towers** (`IsProZero`, Section E2:towers.2): every stage is killed by a later
transition map. This is a condition on transitions, not on the limit. -/
def IsProZero {A : Type u} [Category.{v} A] [HasZeroMorphisms A] (F : ℕᵒᵖ ⥤ A) : Prop :=
  ∀ n : ℕ, ∃ m : ℕ, ∃ h : n ≤ m, F.map (homOfLE h).op = 0

/-- Ordinary abelian pro-isomorphisms have pro-zero kernel and cokernel towers. This
predicate is distinct from the stable null-transition condition used for descendability. -/
def IsProIsomorphism {A : Type u} [Category.{v} A] [Abelian A]
    {F G : ℕᵒᵖ ⥤ A} (f : F ⟶ G) : Prop :=
  IsProZero (kernel f) ∧ IsProZero (cokernel f)

/-- Pro-isomorphisms compose (`proIso_comp`). -/
theorem proIso_comp {A : Type u} [Category.{v} A] [Abelian A]
    {F G H : ℕᵒᵖ ⥤ A} {f : F ⟶ G} {g : G ⟶ H}
    (hf : IsProIsomorphism f) (hg : IsProIsomorphism g) : IsProIsomorphism (f ≫ g) := by
  sorry

/-- The tower `ℤ ← ℤ ← ⋯` whose transitions are multiplication by `p`. -/
noncomputable def pMultiplicationTower (p : ℕ) : ℕᵒᵖ ⥤ ModuleCat.{0} ℤ :=
  Functor.ofOpSequence (X := fun _ => ModuleCat.of ℤ ℤ)
    (fun _ => ModuleCat.ofHom ((p : ℤ) • LinearMap.id))

/-- A tower whose successive transitions are zero is pro-zero, whatever its terms. -/
example (A : Type u) [Category.{v} A] [Abelian A] (F : ℕᵒᵖ ⥤ A)
    (hF : ∀ n, F.map (homOfLE (Nat.le_succ n)).op = 0) : IsProZero F :=
  fun n => ⟨n + 1, Nat.le_succ n, hF n⟩

/-- Multiplication by a prime `p` on `ℤ` is not pro-zero, although its limit is zero. -/
example (p : ℕ) (hp : p.Prime) : ¬ IsProZero (pMultiplicationTower p) := by
  sorry

/-- The zero tower is pro-zero. -/
example (A : Type u) [Category.{v} A] [Abelian A] :
    IsProZero (0 : ℕᵒᵖ ⥤ A) := by
  sorry

/-- Multiplication by zero gives a pro-zero tower with nonzero terms. -/
example : IsProZero (pMultiplicationTower 0) := by
  sorry

/-- Multiplication by one gives the constant identity tower. -/
example : Nonempty (pMultiplicationTower 1 ≅
    (Functor.const ℕᵒᵖ).obj (ModuleCat.of ℤ ℤ)) := by
  sorry

/-- The identity morphism of a tower is a pro-isomorphism. -/
example (A : Type u) [Category.{v} A] [Abelian A] (F : ℕᵒᵖ ⥤ A) :
    IsProIsomorphism (𝟙 F) := by
  sorry

/-- A zero-transition error gives a pro-isomorphism that is not a levelwise isomorphism. -/
example : IsProIsomorphism
    (0 : (0 : ℕᵒᵖ ⥤ ModuleCat.{0} ℤ) ⟶ pMultiplicationTower 0) := by
  sorry

/-- A finite-prefix error is invisible to pro-isomorphism. -/
example (F : ℕᵒᵖ ⥤ ModuleCat.{0} ℤ) (N : ℕ)
    (hF : ∀ n ≥ N, IsZero (F.obj (op n))) :
    IsProIsomorphism (0 : (0 : ℕᵒᵖ ⥤ ModuleCat.{0} ℤ) ⟶ F) := by
  sorry

/-- The constant identity tower on the integers is not pro-zero. -/
example : ¬ IsProIsomorphism
    (0 : (0 : ℕᵒᵖ ⥤ ModuleCat.{0} ℤ) ⟶ pMultiplicationTower 1) := by
  sorry

/-- Prime-multiplication errors are not pro-isomorphisms, although their limits vanish. -/
example (p : ℕ) (hp : p.Prime) : ¬ IsProIsomorphism
    (0 : pMultiplicationTower p ⟶ (0 : ℕᵒᵖ ⥤ ModuleCat.{0} ℤ)) := by
  sorry

end ProTowers

/-! ## Layer E2: Repleteness, inverse limits, Postnikov convergence and descent -/

section Replete

#check TauCetiRoadmap.SchemeAndStackFoundations.Proetale.IsReplete

/-- Repleteness is invariant under equivalence (`IsReplete.of_equivalence`, Section E2.1). -/
theorem IsReplete.of_equivalence {C : Type u} [Category.{v} C]
    {D : Type w} [Category.{z} D] (e : C ≌ D) (hC : IsReplete C) : IsReplete D := by
  sorry

/-- **Countable products in a replete topos** (`IsReplete.countableProduct_epi`,
BS-proet Proposition 3.1.9): a countable product of epimorphisms of sheaves of sets is an
epimorphism. -/
theorem IsReplete.countableProduct_epi {C : Type u} [SmallCategory C]
    (J : GrothendieckTopology C) (hJ : IsReplete (Sheaf J (Type u)))
    {X Y : ℕ → Sheaf J (Type u)} (f : ∀ n, X n ⟶ Y n) (hf : ∀ n, Epi (f n)) :
    Epi (Limits.Pi.map f) := by
  sorry

#check CategoryTheory.Projective
#check CategoryTheory.Projective.factors

end Replete

/-! ## Layer E4: Derived completion of sheaves and coefficient reconstruction -/

section DerivedComplete

/-- The point-site telescope criterion of DerivedDeRhamCohomology §1.2 (`DerivedCompleteSheaves`,
Section E4.1). For `f ∈ I` the derived limit of `M ←f M ←f ⋯` is the fibre of
`(x_n) ↦ (x_n - f • x_{n+1})` on `ℕ → M`; `M` is derived `I`-complete when this map is
bijective for every `f ∈ I`. -/
def IsDerivedComplete {R : Type u} [CommRing R] (I : Ideal R) (M : Type v) [AddCommGroup M]
    [Module R M] : Prop :=
  ∀ f ∈ I, Function.Bijective (fun x : ℕ → M => fun n => x n - f • x (n + 1))

/-- For the zero ideal every module is derived complete. -/
example {R : Type u} [CommRing R] (M : Type v) [AddCommGroup M] [Module R M] :
    IsDerivedComplete (⊥ : Ideal R) M := by
  intro f hf
  rw [Submodule.mem_bot] at hf
  subst hf
  simp only [zero_smul, sub_zero]
  exact Function.bijective_id

/-- `ℤ` is not derived `p`-complete. -/
example (p : ℕ) (hp : p.Prime) : ¬ IsDerivedComplete (Ideal.span {(p : ℤ)}) ℤ := by
  sorry

/-- `ℤ_[p]` is derived `p`-complete. -/
example (p : ℕ) [Fact p.Prime] : IsDerivedComplete (Ideal.span {(p : ℤ_[p])}) ℤ_[p] := by
  sorry

/-- A countable direct sum of p-adic integers is not derived p-complete. -/
example (p : ℕ) [Fact p.Prime] :
    ¬ IsDerivedComplete (Ideal.span {(p : ℤ_[p])}) (ℕ →₀ ℤ_[p]) := by
  sorry

/-- A module killed by `p` is derived `p`-complete. -/
example (p : ℕ) [Fact p.Prime] : IsDerivedComplete (Ideal.span {(p : ℤ)}) (ZMod p) := by
  sorry

/-- **Classical and derived completeness** (`isAdicComplete_iff_derivedComplete_separated`,
BS-proet Proposition 3.4.2, point case): for a finitely generated ideal, a module is classically
`I`-adically complete exactly when it is derived `I`-complete and `I`-adically separated. -/
theorem isAdicComplete_iff_derivedComplete_separated {R : Type u} [CommRing R]
    (I : Ideal R) (hI : I.FG) (M : Type v) [AddCommGroup M] [Module R M] :
    IsAdicComplete I M ↔ IsDerivedComplete I M ∧ IsHausdorff I M := by
  sorry

/-- **Weak Serre closure** (`derivedCompleteModules_weakSerre`, point case): derived complete
modules are closed under kernels and cokernels of maps between derived complete modules. They
are not closed under submodules: `ℤ ⊆ ℤ_[p]`. -/
theorem derivedCompleteModules_weakSerre {R : Type u} [CommRing R] (I : Ideal R)
    {M N : Type v} [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
    (hM : IsDerivedComplete I M) (hN : IsDerivedComplete I N) (g : M →ₗ[R] N) :
    IsDerivedComplete I (LinearMap.ker g) ∧ IsDerivedComplete I (N ⧸ LinearMap.range g) := by
  sorry

end DerivedComplete

/-
The README also specifies API beyond the representative statements above:
* E0.2: `isCategoricalEquivalence_iff` uses right mapping spaces.
* E1.2: `replacementDGComparison` compares the replacements supplied by
  ClassicalAdicEtaleCohomology §0.2 with the dg realization; `IsKFlat` spells its point-site
  acyclicity condition. E1.5 `koszulEnhancedComparison` reindexes the Koszul complex supplied
  by IntegralHeckeAndGaloisDeterminants §6.4.
* E1.6: `frobeniusRootIdeal_radical` and `frobeniusRootIdeal_colimit` identify the root ideal
  with the radical and its sequential colimit presentation.
* E2.1–E2.3: `IsReplete.of_over_epi`, `IsReplete.lim_map_epi`, `IsReplete.rlim_amplitude`,
  `IsReplete.rlim_eq_zero_of_proZero` and `IsReplete.postnikov_counit` are the cover,
  derived-limit and enhanced Postnikov targets.
* E2.5: `projective_sections_exact` gives exact sections on abelian sheaves over projective objects.
SchemeAndStackFoundations §2.17 supplies `IsReplete.lim_epi`, `IsReplete.derived_limits`
and `IsReplete.derivedCategory_leftComplete`; its predicate is imported above.

The remaining constructions use carriers that are not at the pins: the join, slices and right
mapping spaces, the dg nerve, Cat∞ and Spaces, coCartesian
fibrations and straightening, presentable quasicategories (Layer E0); D∞(O), the derived tensor
product and internal Hom, ringed pullback and pushforward, the supplied Koszul comparison, Dqc and base change
on perfect schemes (Layer E1); Kan extensions, adjoints, localizations and mates (Layer E3);
coherent towers and derived-limit filtrations (Layer E2:towers); operads, algebras, modules,
monoidal localizations, Verdier quotients and Barr–Beck–Lurie (Layer E5:abstract); Ind,
PrL, spectra, dualizable and rigid categories (Layer E5:presentability); descendable algebras
(Layer E5:descent); animated rings (Layer E5:animation); Postnikov completion, hypercover
descent, sheaves of spaces and h-descent (Layer E2); sheaf completion and coefficient
reconstruction (Layer E4); the animated cotangent and power comparisons (Layer E5:cotangent-export); and the
Eilenberg–Mac Lane comparison (Layer E5:spectra-comparison).
-/

end TauCetiRoadmap.EnhancedDerivedSheaves

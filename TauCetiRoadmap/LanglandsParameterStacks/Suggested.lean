import Mathlib

/-!
# Parameter stacks, invariant theory and spectral coefficients: representative target signatures

The mathematical roadmap is `README.md`. These are suggested forms: the light definitions and theorem
signatures that can be stated against the pinned Mathlib and Tau Ceti APIs. They are not an
exhaustive list of the targets of any layer: the parameter stacks, their perfect complexes, the
excursion algebra, the good-filtration t-structure and the gerbe comparisons are README targets,
because their carriers do not exist at the pins.

Design choices.
* A parameter with prescribed finite projection `η : Γ →* Q` is a homomorphism into Mathlib's
  `SemidirectProduct` `H ⋊[β] Q` lifting `η` (`ParameterLift`). Its first coordinate is the crossed
  cocycle for the action `β ∘ η`; gauge by `h` is conjugation by `SemidirectProduct.inl h`. This is
  the section form of the crossed cocycles constructed in LP0.1.
* LP0.4 constructs finite-wild discretization and continuous extension, LP1.1 the representing
  scheme, LP2e.9 its excursion comparison, and LP2i.1 the integral comparison at good primes.
* Degrees are homomorphisms to `Multiplicative ℤ`. The arithmetic degree of `ClassFieldTheory`
  sends arithmetic Frobenius to `1`; the geometric degree used here is its inverse.
* Weil–Deligne parameters are prototyped for `GL_n`, with the scaling `r(w) N r(w)⁻¹ = q^{-deg w} N`
  for the geometric degree, so that geometric Frobenius scales `N` by `q⁻¹`.
* Coaction invariants are Mathlib's `AlgHom.equalizer` of the coaction and `a ↦ 1 ⊗ a`; no second
  equalizer is introduced.
* Excursion coefficients are matrix coefficients `g ↦ β (ρ g α)` of an abstract representation; the
  algebraic group structure and the categorical operators are README targets.
-/

namespace TauCetiRoadmap.LanglandsParameterStacks

noncomputable section

open scoped TensorProduct

/-! ## Layer LP0: cocycles, coefficients and wild enhancements -/

section ParameterLifts

variable {Γ H Q : Type*} [Group Γ] [Group H] [Group Q]

/-- Parameters of `Γ` with values in `H ⋊[β] Q` and prescribed projection `η` (LP0.1): homomorphisms
lifting `η`. The first coordinate is the crossed cocycle of LP0.1 for the action `β ∘ η`
(Fargues–Scholze, Definition VIII.1.1, p.278). -/
def ParameterLift (β : Q →* MulAut H) (η : Γ →* Q) : Type _ :=
  {φ : Γ →* H ⋊[β] Q // SemidirectProduct.rightHom.comp φ = η}

namespace ParameterLift

variable {β : Q →* MulAut H} {η : Γ →* Q}

/-- The crossed cocycle underlying a parameter: its first coordinate. -/
def cocycleValue (φ : ParameterLift β η) (γ : Γ) : H := (φ.1 γ).left

/-- The first coordinate satisfies the crossed cocycle law for the action `β ∘ η` (LP0.1). -/
theorem cocycleValue_mul (φ : ParameterLift β η) (γ δ : Γ) :
    φ.cocycleValue (γ * δ) = φ.cocycleValue γ * β (η γ) (φ.cocycleValue δ) := sorry

/-- The second coordinate of a parameter is the prescribed projection. -/
theorem right_apply (φ : ParameterLift β η) (γ : Γ) : (φ.1 γ).right = η γ := by
  have h := DFunLike.congr_fun φ.2 γ
  simpa [SemidirectProduct.rightHom] using h

/-- Gauge by `h ∈ H`: conjugation of the parameter by `inl h` (LP0.1). -/
def gauge (h : H) (φ : ParameterLift β η) : ParameterLift β η :=
  ⟨(MulAut.conj (SemidirectProduct.inl h : H ⋊[β] Q)).toMonoidHom.comp φ.1, by
    ext γ
    simpa using DFunLike.congr_fun φ.2 γ⟩

/-- Gauge acts on the cocycle by `c(γ) ↦ h c(γ) β(η γ)(h)⁻¹` (LP0.1). -/
theorem gauge_cocycleValue (h : H) (φ : ParameterLift β η) (γ : Γ) :
    (φ.gauge h).cocycleValue γ = h * φ.cocycleValue γ * (β (η γ) h)⁻¹ := sorry

/-- Gauge is an action of `H`. -/
theorem gauge_one (φ : ParameterLift β η) : φ.gauge 1 = φ := sorry

/-- Gauge is an action of `H`. -/
theorem gauge_mul (h k : H) (φ : ParameterLift β η) :
    φ.gauge (h * k) = (φ.gauge k).gauge h := sorry

/-- The unit parameter `inr ∘ η`, whose cocycle is identically `1`. -/
def unit (β : Q →* MulAut H) (η : Γ →* Q) : ParameterLift β η :=
  ⟨SemidirectProduct.inr.comp η, by ext γ; simp⟩

-- The standard lift has the prescribed projection and a trivial first coordinate.
example (β : Q →* MulAut H) (η : Γ →* Q) (γ : Γ) :
    (unit β η).cocycleValue γ = 1 ∧ ((unit β η).1 γ).right = η γ := by
  simp [unit, cocycleValue]

end ParameterLift

end ParameterLifts

-- Gauge of the unit parameter of `ℤ`, acting on `ℚˣ` by inversion, by `2` has first coordinate
-- `2 · (2⁻¹)⁻¹ = 4` at the generator: this pins the side and the inverse of the gauge formula.
example :
    let β : Multiplicative ℤ →* MulAut ℚˣ := zpowersHom (MulAut ℚˣ) (MulEquiv.inv ℚˣ)
    (((ParameterLift.unit β (MonoidHom.id _)).gauge (Units.mk0 2 two_ne_zero)).cocycleValue
      (Multiplicative.ofAdd 1) : ℚ) = 4 := by
  intro β
  simp [ParameterLift.cocycleValue, ParameterLift.gauge, ParameterLift.unit, β]
  norm_num

-- Negation gives a crossed cocycle on C₂ with value 1 at the involution; it is not multiplicative.
example :
    let s : MulAut (Multiplicative ℤ) := MulEquiv.inv _
    let C := Subgroup.zpowers s
    let a : C := ⟨s, Subgroup.mem_zpowers s⟩
    ∃ φ : ParameterLift C.subtype (MonoidHom.id C),
      φ.cocycleValue a = Multiplicative.ofAdd 1 ∧
      φ.cocycleValue (a * a) ≠ φ.cocycleValue a * φ.cocycleValue a := by
  sorry

-- The same C₂ action has precisely two gauge classes, distinguished by parity.
example :
    let s : MulAut (Multiplicative ℤ) := MulEquiv.inv _
    let C := Subgroup.zpowers s
    let a : C := ⟨s, Subgroup.mem_zpowers s⟩
    (∀ n : ℤ, ∃ φ : ParameterLift C.subtype (MonoidHom.id C),
      φ.cocycleValue a = Multiplicative.ofAdd n) ∧
    ∀ φ ψ : ParameterLift C.subtype (MonoidHom.id C),
      (∃ h : Multiplicative ℤ, φ.gauge h = ψ) ↔
        Even (Multiplicative.toAdd (ψ.cocycleValue a) -
          Multiplicative.toAdd (φ.cocycleValue a)) := by
  sorry

-- H¹ of the trivial group is a singleton; the unit lift supplies a representative.
example (H : Type*) [Group H]
    (φ : ParameterLift (1 : Unit →* MulAut H) (MonoidHom.id Unit)) :
    φ = ParameterLift.unit 1 (MonoidHom.id Unit) := by
  sorry

-- For trivial action, evaluation at 1 identifies H¹(ℤ,H) with conjugacy classes in H.
example (H : Type*) [Group H] :
    (∀ h : H, ∃ φ : ParameterLift (1 : Unit →* MulAut H)
      (1 : Multiplicative ℤ →* Unit), φ.cocycleValue (Multiplicative.ofAdd 1) = h) ∧
    ∀ φ ψ : ParameterLift (1 : Unit →* MulAut H) (1 : Multiplicative ℤ →* Unit),
      (∃ h : H, φ.gauge h = ψ) ↔
        ∃ h : H, h * φ.cocycleValue (Multiplicative.ofAdd 1) * h⁻¹ =
          ψ.cocycleValue (Multiplicative.ofAdd 1) := by
  sorry

section Degree

variable {W : Type*} [Group W]

/-- The geometric degree attached to an arithmetic degree (LP0.4): its pointwise inverse, so that
geometric Frobenius `σ = Fr⁻¹` has degree `1`. -/
def geometricDegree (d : W →* Multiplicative ℤ) : W →* Multiplicative ℤ := d⁻¹

theorem geometricDegree_apply (d : W →* Multiplicative ℤ) (w : W) :
    geometricDegree d w = (d w)⁻¹ := rfl

/-- Converting twice returns the arithmetic degree. -/
theorem geometricDegree_geometricDegree (d : W →* Multiplicative ℤ) :
    geometricDegree (geometricDegree d) = d := by
  simp [geometricDegree]

/-- The arithmetic and geometric degrees have the same kernel (inertia). -/
theorem geometricDegree_ker (d : W →* Multiplicative ℤ) :
    (geometricDegree d).ker = d.ker := sorry

/-- The Tate character `w ↦ q^{-d(w)}` for a geometric degree map (LP0.4). It takes
arithmetic Frobenius to `q` and geometric Frobenius to `q⁻¹`. -/
def tateCharacter {Λ : Type*} [Monoid Λ] (q : Λˣ) (d : W →* Multiplicative ℤ) : W →* Λˣ :=
  (zpowersHom Λˣ q⁻¹).comp d

/-- The Tate character of the geometric degree is the inverse of that of the arithmetic one. -/
theorem tateCharacter_geometricDegree {Λ : Type*} [Monoid Λ] (q : Λˣ)
    (d : W →* Multiplicative ℤ) (w : W) :
    tateCharacter q (geometricDegree d) w = (tateCharacter q d w)⁻¹ := sorry

end Degree

-- With `q = 3` and arithmetic Frobenius of arithmetic degree `1` (here the generator of
-- `Multiplicative ℤ` with the identity degree), the Tate character of the geometric degree takes
-- the value `3` at arithmetic Frobenius and `1/3` at geometric Frobenius `Fr⁻¹`.
example :
    ((tateCharacter (Units.mk0 (3 : ℚ) three_ne_zero)
      (geometricDegree (MonoidHom.id (Multiplicative ℤ))) (Multiplicative.ofAdd 1) : ℚˣ) : ℚ)
      = 3 := by
  simp [tateCharacter, geometricDegree]

-- Geometric Frobenius is the inverse generator and has Tate value `1/3`.
example :
    ((tateCharacter (Units.mk0 (3 : ℚ) three_ne_zero)
      (geometricDegree (MonoidHom.id (Multiplicative ℤ))) (Multiplicative.ofAdd (-1)) : ℚˣ) : ℚ)
      = 1 / 3 := by
  norm_num [tateCharacter, geometricDegree]

-- The geometric degree of arithmetic Frobenius is `-1`.
example : geometricDegree (MonoidHom.id (Multiplicative ℤ)) (Multiplicative.ofAdd 1)
    = Multiplicative.ofAdd (-1) := rfl

section FiniteWild

variable {Γ G : Type*} [Group Γ] [Group G] [TopologicalSpace Γ]

/-- Finite wild ramification of a homomorphism with respect to a wild subgroup `P` (LP0.3): it is
trivial on a relatively open subgroup of `P` (Fargues–Scholze, §VIII.1.1, p.278). -/
def HasFiniteWildRamification (P : Subgroup Γ) (φ : Γ →* G) : Prop :=
  ∃ U : Subgroup P, IsOpen (U : Set P) ∧ ∀ u ∈ U, φ (u : Γ) = 1

/-- A homomorphism that is trivial on `P` has finite wild ramification. -/
theorem HasFiniteWildRamification.of_le_ker (P : Subgroup Γ) (φ : Γ →* G) (h : P ≤ φ.ker) :
    HasFiniteWildRamification P φ :=
  ⟨⊤, isOpen_univ, fun u _ => h u.2⟩

/-- Every L-parameter has finite wild ramification when `P` is compact and `φ` is continuous with
finite image on `P` into a `T₁` target (the topological half of LP0.3). -/
theorem HasFiniteWildRamification.of_finite_image [TopologicalSpace G] [T1Space G]
    (P : Subgroup Γ) [CompactSpace P] (φ : Γ →* G) (hφ : Continuous φ)
    (hfin : (φ '' (P : Set Γ)).Finite) :
    HasFiniteWildRamification P φ := sorry

-- The trivial homomorphism kills every wild subgroup, even when that subgroup is infinite.
example (P : Subgroup Γ) : HasFiniteWildRamification P (1 : Γ →* G) :=
  HasFiniteWildRamification.of_le_ker P 1 (by simp)

-- An open kernel need not have finite index in a noncompact source.
example :
    letI : TopologicalSpace (Multiplicative ℤ) := ⊥
    HasFiniteWildRamification (⊤ : Subgroup (Multiplicative ℤ)) (MonoidHom.id _) ∧
      (Set.range (MonoidHom.id (Multiplicative ℤ))).Infinite := by
  sorry

-- A finite image in an indiscrete target need not have open kernel, even for a compact source.
example :
    let C := Equiv.Perm (Fin 2)
    letI : TopologicalSpace C := ⊤
    Continuous (MonoidHom.id C) ∧ (Set.range (MonoidHom.id C)).Finite ∧
      ¬ HasFiniteWildRamification (⊤ : Subgroup C) (MonoidHom.id C) := by
  sorry

end FiniteWild

section WildInertial

variable {L W P : Type*} [Group L] [Group W] [Group P]

/-- The abstract extension predicate underlying a wild inertial parameter (LP0.5): a homomorphism `ρ : P →* L` that extends to a section `φ` of
`π : L →* W` along `i : P →* W`. The extension is a condition, not data (Kurinczuk–Skodlerack–Stevens,
§1.20–1.21, pp.8–9). The classical subtype `ClassicalAdmissibleParameter` of LP0.5 additionally imposes finite inertia,
Frobenius semisimplicity, continuity and an algebraic `SL₂` factor; this predicate asserts only
section extension. -/
def IsWildInertialParameter (π : L →* W) (i : P →* W) (ρ : P →* L) : Prop :=
  ∃ φ : W →* L, π.comp φ = MonoidHom.id W ∧ φ.comp i = ρ

/-- A wild inertial parameter has the prescribed projection `π ∘ ρ = i`. -/
theorem IsWildInertialParameter.projection {π : L →* W} {i : P →* W} {ρ : P →* L}
    (h : IsWildInertialParameter π i ρ) : π.comp ρ = i := by
  obtain ⟨φ, hπ, hρ⟩ := h
  rw [← hρ, ← MonoidHom.comp_assoc, hπ, MonoidHom.id_comp]

/-- Conjugation by an element of `ker π` preserves wild inertial parameters. -/
theorem IsWildInertialParameter.conj {π : L →* W} {i : P →* W} {ρ : P →* L}
    (h : IsWildInertialParameter π i ρ) (g : L) (hg : π g = 1) :
    IsWildInertialParameter π i ((MulAut.conj g).toMonoidHom.comp ρ) := sorry

-- The identity section extends its restriction.
example (i : P →* W) : IsWildInertialParameter (MonoidHom.id W) i i :=
  ⟨MonoidHom.id W, rfl, rfl⟩

-- Losing the prescribed projection admits a false wild parameter.
example [Nontrivial W] :
    ¬ IsWildInertialParameter (MonoidHom.id W) (MonoidHom.id W) (1 : W →* W) := by
  intro h
  obtain ⟨w, hw⟩ := exists_ne (1 : W)
  have hp := DFunLike.congr_fun h.projection w
  simp at hp
  exact hw hp.symm

-- Conjugation outside the projection kernel changes the prescribed section in S₃.
example :
    let a : Equiv.Perm (Fin 3) := Equiv.swap 0 1
    let b : Equiv.Perm (Fin 3) := Equiv.swap 1 2
    ¬ IsWildInertialParameter (MonoidHom.id _) (MonoidHom.id _)
      (MulAut.conj a).toMonoidHom ∧ a * b * a⁻¹ = Equiv.swap 0 2 := by
  sorry

end WildInertial

section TwistedCentralizer

variable {H W : Type*} [Group H] [Group W] {α : W →* MulAut H}

/-- The twisted wild centralizer (LP0.6): elements `x = (g, w)` of the L-group with
`x ρ(w⁻¹ p w) x⁻¹ = ρ(p)` for all `p ∈ P` (Kurinczuk–Skodlerack–Stevens, §1.21, p.8). -/
def twistedWildCentralizer (P : Subgroup W) [P.Normal] (ρ : P →* H ⋊[α] W) :
    Set (H ⋊[α] W) :=
  {x | ∀ p : P, x * ρ ⟨x.right⁻¹ * (p : W) * x.right⁻¹⁻¹,
      Subgroup.Normal.conj_mem inferInstance (p : W) p.2 x.right⁻¹⟩ * x⁻¹ = ρ p}

theorem one_mem_twistedWildCentralizer (P : Subgroup W) [P.Normal] (ρ : P →* H ⋊[α] W) :
    (1 : H ⋊[α] W) ∈ twistedWildCentralizer P ρ := sorry

theorem mul_mem_twistedWildCentralizer (P : Subgroup W) [P.Normal] (ρ : P →* H ⋊[α] W)
    {x y : H ⋊[α] W} (hx : x ∈ twistedWildCentralizer P ρ) (hy : y ∈ twistedWildCentralizer P ρ) :
    x * y ∈ twistedWildCentralizer P ρ := sorry

theorem inv_mem_twistedWildCentralizer (P : Subgroup W) [P.Normal] (ρ : P →* H ⋊[α] W)
    {x : H ⋊[α] W} (hx : x ∈ twistedWildCentralizer P ρ) :
    x⁻¹ ∈ twistedWildCentralizer P ρ := sorry

/-- Above `w = 1` the twisted centralizer is the ordinary centralizer of the image of `ρ`. -/
theorem inl_mem_twistedWildCentralizer_iff (P : Subgroup W) [P.Normal] (ρ : P →* H ⋊[α] W)
    (h : H) :
    SemidirectProduct.inl h ∈ twistedWildCentralizer P ρ ↔
      ∀ p : P, SemidirectProduct.inl h * ρ p = ρ p * SemidirectProduct.inl h := sorry

/-- The values of an extending section lie in the twisted centralizer of its restriction. -/
theorem section_mem_twistedWildCentralizer (P : Subgroup W) [P.Normal] (φ : W →* H ⋊[α] W)
    (hφ : SemidirectProduct.rightHom.comp φ = MonoidHom.id W) (w : W) :
    φ w ∈ twistedWildCentralizer P (φ.comp P.subtype) := sorry

-- A noncentral section value is twisted-centralizing but fails ordinary centralization.
example :
    let W := Equiv.Perm (Fin 3)
    let α : W →* MulAut Unit := 1
    let P : Subgroup W := ⊤
    let ρ : P →* Unit ⋊[α] W := SemidirectProduct.inr.comp P.subtype
    let x : Unit ⋊[α] W := SemidirectProduct.inr (Equiv.swap 0 1)
    x ∈ twistedWildCentralizer P ρ ∧
      x * ρ ⟨Equiv.swap 1 2, Subgroup.mem_top _⟩ ≠
        ρ ⟨Equiv.swap 1 2, Subgroup.mem_top _⟩ * x := by
  sorry

end TwistedCentralizer

/-! ## Layer LP1: integral parameter spaces and deformation theory -/

section WeilDeligne

variable {W Λ : Type*} [Group W] [CommRing Λ] {n : Type*} [Fintype n] [DecidableEq n]

/-- The `GL_n` prototype of a Weil–Deligne parameter (LP1.11): `N` is nilpotent and
`r(w) N r(w)⁻¹ = q^{-deg w} N` for the geometric degree `d` (Fargues–Scholze, Definition VIII.2.4,
p.282). Discrete inertia and the actual local Weil degree are README hypotheses.
Over a nonreduced ring, matrix nilpotence is weaker than the scheme-theoretic nilpotent-cone
condition imposed by `WeilDeligneParameter`. -/
def IsWeilDelignePair (q : Λˣ) (d : W →* Multiplicative ℤ) (r : W →* GL n Λ)
    (N : Matrix n n Λ) : Prop :=
  IsNilpotent N ∧ ∀ w, (r w : Matrix n n Λ) * N * ((r w)⁻¹ : GL n Λ) =
    ((q ^ (-(Multiplicative.toAdd (d w))) : Λˣ) : Λ) • N

/-- Every homomorphism with `N = 0` is a Weil–Deligne parameter. -/
theorem IsWeilDelignePair.zero (q : Λˣ) (d : W →* Multiplicative ℤ) (r : W →* GL n Λ) :
    IsWeilDelignePair q d r 0 := by
  refine ⟨IsNilpotent.zero, fun w => ?_⟩
  simp

/-- Gauge by `g` conjugates both `r` and `N` and preserves the conditions. -/
theorem IsWeilDelignePair.conj {q : Λˣ} {d : W →* Multiplicative ℤ} {r : W →* GL n Λ}
    {N : Matrix n n Λ} (h : IsWeilDelignePair q d r N) (g : GL n Λ) :
    IsWeilDelignePair q d ((MulAut.conj g).toMonoidHom.comp r)
      ((g : Matrix n n Λ) * N * ((g⁻¹ : GL n Λ) : Matrix n n Λ)) := sorry

/-- For a torus over a reduced ring the monodromy vanishes. -/
theorem IsWeilDelignePair.eq_zero_of_isReduced [IsReduced Λ] {q : Λˣ}
    {d : W →* Multiplicative ℤ} {r : W →* GL (Fin 1) Λ} {N : Matrix (Fin 1) (Fin 1) Λ}
    (h : IsWeilDelignePair q d r N) : N = 0 := sorry

-- The zero monodromy condition imposes no additional restriction on the homomorphism.
example (q : Λˣ) (d : W →* Multiplicative ℤ) (r : W →* GL n Λ) :
    IsWeilDelignePair q d r 0 := IsWeilDelignePair.zero q d r

end WeilDeligne

-- Over dual numbers, nilpotent rank-one matrix monodromy need not vanish.
example :
    let N : Matrix (Fin 1) (Fin 1) (DualNumber ℚ) := fun _ _ => DualNumber.eps
    IsWeilDelignePair (1 : (DualNumber ℚ)ˣ) (1 : Unit →* Multiplicative ℤ)
      (1 : Unit →* GL (Fin 1) (DualNumber ℚ)) N ∧ N ≠ 0 := by
  sorry

-- In `GL₂(ℚ)` with `q = 3`, geometric Frobenius `diag(1/3, 1)` scales `N = E₁₂` by `q⁻¹ = 1/3`:
-- this is the sign convention of `IsWeilDelignePair`.
example : !![(1 : ℚ) / 3, 0; 0, 1] * !![0, 1; 0, 0] * !![3, 0; 0, 1] = (3 : ℚ)⁻¹ • !![0, 1; 0, 0] := by
  ext i j
  fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_two]

-- The reciprocal convention fails: `diag(3, 1)` scales `E₁₂` by `3`, not by `1/3`.
example : !![(3 : ℚ), 0; 0, 1] * !![0, 1; 0, 0] * !![1 / 3, 0; 0, 1] ≠ (3 : ℚ)⁻¹ • !![0, 1; 0, 0] := by
  intro h
  have := congrFun (congrFun h 0) 1
  norm_num [Matrix.mul_apply, Fin.sum_univ_two] at this

/-! ## Layer LP2e: coarse quotients, the excursion presentation and excursion operators -/

section Coaction

variable {R A C : Type*} [CommRing R] [CommRing A] [Algebra R A] [CommRing C] [Algebra R C]

-- Zariski's main theorem used in the quotient-slice argument.
#check AlgebraicGeometry.Scheme.Hom.exists_isIso_morphismRestrict_toNormalization

-- Pin the existing equalizer and its membership and trivial-coaction API.
#check AlgHom.equalizer
#check AlgHom.mem_equalizer
#check AlgHom.equalizer_same

/-- The coarse quotient `Spec Aᴴ` of an affine scheme with a coaction (LP2e.1). -/
def coarseQuotient (δ : A →ₐ[R] C ⊗[R] A) : AlgebraicGeometry.Scheme :=
  AlgebraicGeometry.Spec (CommRingCat.of (AlgHom.equalizer δ Algebra.TensorProduct.includeRight))

-- A trivial coaction fixes every element, with invariance expressed in the tensor algebra.
example (a : A) :
    a ∈ AlgHom.equalizer (Algebra.TensorProduct.includeRight : A →ₐ[R] C ⊗[R] A)
      Algebra.TensorProduct.includeRight := by
  simp [AlgHom.equalizer_same]

-- Coarse quotients are affine schemes, as opposed to the quotient stack.
example (δ : A →ₐ[R] C ⊗[R] A) : AlgebraicGeometry.IsAffine (coarseQuotient δ) := by
  dsimp [coarseQuotient]
  infer_instance

end Coaction

section FreeIndex

variable (Γ : Type*) [Group Γ]

/-- Objects of the finite free-group index category of LP2e.7: a finite free group with a map
to `Γ` (Fargues–Scholze, §VIII.3.2, p.287). -/
structure FreeCocycleIndex where
  /-- The number of free generators. -/
  rank : ℕ
  /-- The map from the free group. -/
  map : FreeGroup (Fin rank) →* Γ

variable {Γ}

/-- Morphisms of the index category: word maps over `Γ`. -/
def FreeCocycleIndex.Hom (a b : FreeCocycleIndex Γ) : Type _ :=
  {v : FreeGroup (Fin a.rank) →* FreeGroup (Fin b.rank) // b.map.comp v = a.map}

/-- The index object of a finite tuple in `Γ`. -/
def FreeCocycleIndex.ofTuple {n : ℕ} (γ : Fin n → Γ) : FreeCocycleIndex Γ :=
  ⟨n, FreeGroup.lift γ⟩

/-- The index object of a tuple evaluates to the tuple on the free generators. -/
theorem FreeCocycleIndex.ofTuple_map_of {n : ℕ} (γ : Fin n → Γ) (i : Fin n) :
    (FreeCocycleIndex.ofTuple γ).map (FreeGroup.of i) = γ i :=
  FreeGroup.lift_apply_of

/-- There is at most one word map from the zero-generator object. -/
theorem FreeCocycleIndex.subsingleton_hom_zero (b : FreeCocycleIndex Γ) :
    Subsingleton (FreeCocycleIndex.Hom (FreeCocycleIndex.ofTuple (Fin.elim0 : Fin 0 → Γ)) b) :=
  sorry

/-- A word map from the zero-generator object exists (LP2e.7). -/
theorem FreeCocycleIndex.nonempty_hom_zero (b : FreeCocycleIndex Γ) :
    Nonempty (FreeCocycleIndex.Hom (FreeCocycleIndex.ofTuple (Fin.elim0 : Fin 0 → Γ)) b) :=
  sorry

-- Initiality includes both existence and uniqueness, even for the empty tuple.
example (b : FreeCocycleIndex Γ) :
    Nonempty (FreeCocycleIndex.Hom (FreeCocycleIndex.ofTuple (Fin.elim0 : Fin 0 → Γ)) b) ∧
    Subsingleton (FreeCocycleIndex.Hom (FreeCocycleIndex.ofTuple (Fin.elim0 : Fin 0 → Γ)) b) :=
  ⟨FreeCocycleIndex.nonempty_hom_zero b, FreeCocycleIndex.subsingleton_hom_zero b⟩

-- Two generators retain their order under evaluation.
example (a b : Γ) :
    (FreeCocycleIndex.ofTuple ![a, b]).rank = 2 ∧
    (FreeCocycleIndex.ofTuple ![a, b]).map (FreeGroup.of (0 : Fin 2) * FreeGroup.of (1 : Fin 2)) = a * b := by
  constructor
  · rfl
  · change (FreeGroup.lift ![a, b]) (FreeGroup.of (0 : Fin 2) * FreeGroup.of (1 : Fin 2)) = a * b
    rw [map_mul, FreeGroup.lift_apply_of, FreeGroup.lift_apply_of]
    simp

-- Word maps are over Γ: the identity word map is an endomorphism of each index object.
example (a : FreeCocycleIndex Γ) : Nonempty (FreeCocycleIndex.Hom a a) :=
  ⟨⟨MonoidHom.id _, by simp⟩⟩

end FreeIndex

section Excursion

variable {R G V W : Type*} [CommRing R] [Group G] [AddCommGroup V] [Module R V]
  [AddCommGroup W] [Module R W]

/-- The excursion matrix coefficient `g ↦ β(ρ(g) α)` of a representation with creation vector `α`
and annihilation functional `β` (LP2e.14; Fargues–Scholze, proof of Theorem VIII.4.1, pp.291–292). -/
def excursionCoefficient (ρ : Representation R G V) (α : V) (β : Module.Dual R V) (g : G) : R :=
  β (ρ g α)

theorem excursionCoefficient_zero_left (ρ : Representation R G V) (β : Module.Dual R V) (g : G) :
    excursionCoefficient ρ 0 β g = 0 := by
  simp [excursionCoefficient]

/-- Tensor products multiply excursion coefficients (LP2e.14). -/
theorem excursionCoefficient_tprod (ρ : Representation R G V) (σ : Representation R G W)
    (α : V) (α' : W) (β : Module.Dual R V) (β' : Module.Dual R W) (g : G) :
    excursionCoefficient (ρ.tprod σ) (α ⊗ₜ α') (TensorProduct.dualDistrib R V W (β ⊗ₜ β')) g =
      excursionCoefficient ρ α β g * excursionCoefficient σ α' β' g := sorry

/-- Bi-invariance: if `α` is fixed by `a` and `β` by `b`, the coefficient is unchanged by
`g ↦ b g a`. -/
theorem excursionCoefficient_mul_mul (ρ : Representation R G V) (α : V) (β : Module.Dual R V)
    (a b g : G) (ha : ρ a α = α) (hb : β ∘ₗ ρ b = β) :
    excursionCoefficient ρ α β (b * g * a) = excursionCoefficient ρ α β g := sorry

end Excursion

-- For the trivial representation on `ℚ` with `α = 1` and `β = id`, the coefficient is `1`.
example (G : Type*) [Group G] (g : G) :
    excursionCoefficient (Representation.trivial ℚ G ℚ) 1 LinearMap.id g = 1 := by
  simp [excursionCoefficient]

-- Scalar tensor coefficients retain their actual values: 2 times 3 is 6.
example :
    let ρ := Representation.trivial ℚ Unit ℚ
    excursionCoefficient (ρ.tprod ρ) ((2 : ℚ) ⊗ₜ (3 : ℚ))
      (TensorProduct.dualDistrib ℚ ℚ ℚ
        ((LinearMap.id : Module.Dual ℚ ℚ) ⊗ₜ (LinearMap.id : Module.Dual ℚ ℚ))) () = 6 := by
  sorry

-- Multiplication by 2 changes the scalar coefficient when the creation vector is not fixed.
example :
    let ρ := Representation.ofDistribMulAction ℚ ℚˣ ℚ
    let a : ℚˣ := Units.mk0 2 two_ne_zero
    ρ a (1 : ℚ) ≠ 1 ∧
      excursionCoefficient ρ 1 LinearMap.id (1 * 1 * a) ≠
        excursionCoefficient ρ 1 LinearMap.id 1 := by
  sorry

/-! ## Layer LP2c: pseudocharacters with prescribed projection and local continuity -/

section TraceAdapter

variable {Γ A : Type*} [Group Γ] [CommRing A]

/-- The `A`-linear extension of a function on `Γ` to the group algebra (LP2c.6):
`∑ a_γ [γ] ↦ ∑ a_γ τ(γ)` (Lafforgue, Remark 11.8, pp.143–144). -/
def traceExtension (τ : Γ → A) : MonoidAlgebra A Γ →ₗ[A] A :=
  (Finsupp.linearCombination A τ).comp (MonoidAlgebra.coeffLinearEquiv A).toLinearMap

theorem traceExtension_of (τ : Γ → A) (γ : Γ) :
    traceExtension τ (MonoidAlgebra.of A Γ γ) = τ γ := by
  simp [traceExtension, MonoidAlgebra.of_apply, MonoidAlgebra.coeff_single]

-- Linearity on two distinct basis elements preserves both coefficients and the minus sign.
example (τ : Multiplicative ℤ → ℚ) :
    traceExtension τ
      ((2 : ℚ) • MonoidAlgebra.of ℚ (Multiplicative ℤ) (Multiplicative.ofAdd 0) -
        MonoidAlgebra.of ℚ (Multiplicative ℤ) (Multiplicative.ofAdd 1)) =
      2 * τ (Multiplicative.ofAdd 0) - τ (Multiplicative.ofAdd 1) := by
  simp only [map_sub, map_smul, traceExtension_of, smul_eq_mul]

-- Pin the supplied character, its value at the identity, and the trace over general rings.
#check Representation.character
#check Representation.char_one
#check LinearMap.trace_one

-- The trace of the trivial two-dimensional representation is its rank, not one.
example (G : Type*) [Group G] :
    (Representation.trivial ℚ G (Fin 2 → ℚ)).character 1 = 2 := by
  norm_num [Representation.character]

end TraceAdapter

-- The linear extension is not multiplicative: for `Γ = 1` and `τ = 2` over `ℚ`,
-- `T(1 · 1) = 2` while `T(1) T(1) = 4`.
example :
    traceExtension (fun _ : Unit => (2 : ℚ)) (1 * 1) ≠
      traceExtension (fun _ : Unit => (2 : ℚ)) 1 * traceExtension (fun _ : Unit => (2 : ℚ)) 1 := by
  rw [mul_one]
  simp [traceExtension, MonoidAlgebra.one_def, MonoidAlgebra.coeff_single]

/-! ## Layer LP3: good filtrations, fixed groups and wild reduction

The objects of this layer (the induced modules `∇_λ`, good filtrations, the good-filtration
t-structure on `Ind Perf(BG)`, induced perfect complexes, fixed groups of finite automorphism groups
and the mapping approximations) need reductive group schemes over a field with their highest-weight
theory and stable ∞-categories of perfect complexes on quotient stacks. They are README targets. -/

/-! ## Layers LP2i and LP4: the integral comparison and representation bundles

The integral comparison in `Ind Perf(BĤ)`, the universal representation bundles on
`[Z¹(W, Ĥ)/Ĥ]`, perfect generation and the module comparison are README targets: their carriers are
stacks and stable categories that do not exist at the pins. -/

/-! The remaining named definitions in the roadmap are README targets:
`CrossedCocycle.restrict`, `CrossedCocycle.sectionEquiv`, `CrossedCocycle.descend`,
`CrossedCocycle.quotientEquiv`, `H¹(Γ, H)`, continuous crossed cocycles,
`condensedCoefficients`, `LParameter`, `FiniteWildPiece`, `NormalWildCutoff`,
`ClassicalAdmissibleParameter`, `WeilGroup.center_eq_bot`,
`WildInertialParameter`, `wildEnhancementGroup`, `ExtendedWildParameter`, `WildParameterClasses`,
`IntegralCocycleScheme`, `DerivedParameterStack`, `WeilDeligneParameter`, `ParameterSingularities`,
`QCoh` and `Perf` of animated quotient stacks, `cotangentToHochschild`,
`hochschildSelfExtAction`, `dualNilpotentCone`, `NilpotentSingularSupport`, `ParameterCoarseQuotient`,
`IsGIrreducible`, `IsStronglyReductive`, `IsStronglyGIrreducible`, `IsSemisimpleParameter`,
`coordinateDiagram`, `ExcursionAlgebra`, `CategoricalHeckeDatum`, `ExcursionDatum`,
`excursionMatrixCoefficient`, `ProjectedPseudocharacter`, `GroupTraceAdapter`,
the induced modules `∇_λ` and Weyl modules `Δ_λ`, `HasGoodFiltration`, good filtration dimension, `goodFiltrationTStructure`, `InducedPerfectComplexes`,
`IndProPerf`, equivariant ideal-adic completion, `IndCoh` of the derived unit self-intersection,
`ParameterMappingApproximation`, `restrictEnhancedParameter`, and `UniversalRepresentationBundle`.
Their enhanced, topological or algebraic-group carriers and constructions remain in the README.
The connected predicates `IsGCompletelyReducible` and `IsAbsolutelyGCompletelyReducible`, their
conjugacy invariance and `GL(V)` comparison, connected closed tuples and Levi semisimplification
are supplied by ArithmeticGaloisRepresentations §1.11, `Complete reducibility and closed tuples`.
Its `Reductive quotients over fields and DVRs` target supplies the connected integral quotient
package. LP2e.2–LP2e.4 supply the additional quotient, strong-reductivity, irreducibility and
nonconnected results. -/

end

end TauCetiRoadmap.LanglandsParameterStacks

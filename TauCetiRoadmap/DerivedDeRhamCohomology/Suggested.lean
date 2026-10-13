import Mathlib
import TauCeti.RingTheory.Kaehler.MapSemilinear

/-!
# DerivedDeRhamCohomology: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
What is recorded here are definitions and theorem signatures against the pinned Mathlib and Tau Ceti;
discharging all of them finishes neither a layer nor the roadmap. `sorry` is expected in this file:
these are goals, not results.

Design choices made explicit here:

* Ordinary differential forms are Mathlib's `exteriorPower B n (KaehlerDifferential A B)`, viewed as
  `A`-modules; the de Rham differential is `A`-linear and strictly alternating also in
  characteristic 2. The differential and the pullback of forms are constructions specified in the
  README (`DeRham.d`, `DeRham.pullback`); here they appear through the predicates
  `DeRham.IsDeRhamDifferential` and `DeRham.IsFormPullback` that characterize them on elementary
  forms, with existence and uniqueness stated as theorems.
* Affine derived statements live in Mathlib's `DerivedCategory (ModuleCat A)`. Global de Rham
  sheaf objects and finite Hodge quotients live in `DerivedCategory (SheafOfModules R)` for the
  base coefficient sheaf `R`, with the filtered diagram version of README 5.8; cotangent powers
  and Hodge graded pieces also have quasi-coherent `O_X`-module structures. Derived completeness is the
  vanishing of all morphisms from shifted localizations; complete flatness of a module is stated with
  Mathlib's `CategoryTheory.Tor`. The cotangent complex, derived completion, derived powers and
  derived de Rham cohomology are constructions specified in the README.
* The K-flat models of README 0.2 cover arbitrary complexes of modules; ArithmeticGaloisDuality
  §D7.1 / Derived tensor, perfect amplitude and Tor consumes them for bounded perfect complexes.
  The module derived limit of README 1.1 uses the tower kernels, cokernels and Milnor sequence
  supplied by ArithmeticGaloisDuality §R02.1.1 / lim and lim¹ of a tower and ArithmeticGaloisDuality
  §R02.1.1 / The Milnor sequence for towers of complexes. Towers have transitions `K_(n+1) → K_n`
  for `n : ℕ`; forgetting scalars identifies their additive carriers with the supplier's, and the
  induced module action is retained.
  Vanishing of `lim¹` under eventual stabilization of cohomology transition images is supplied by
  ArithmeticGaloisDuality §R02.1.1 / Mittag-Leffler towers have vanishing lim¹.
* `Z_p(1)` is the kernel of Mathlib's untilt `PreTilt.untilt`, and `A_inf`, `θ` and `B_dR⁺` are
  Mathlib's `WittVector p (PreTilt O p)`, `WittVector.fontaineTheta` and `BDeRhamPlus`.
-/

namespace TauCetiRoadmap.DerivedDeRhamCohomology

open CategoryTheory CategoryTheory.Limits CategoryTheory.Pretriangulated ExteriorAlgebra
open scoped TensorProduct

noncomputable section

/-! ## Layer 0: Cotangent complexes and integral derived powers -/

namespace DerivedDeRham

/-- A family `b : Fin r → k` is a **p-basis** of a field `k` of characteristic `p`: the p-monomials
`∏ i, b i ^ e i` with `0 ≤ e i < p` form a basis of `k` over the subfield `k^p` of `p`-th powers.
A transcendence basis is in general not a p-basis (README 0.23). -/
def IsPBasis (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p] {r : ℕ} (b : Fin r → k) :
    Prop :=
  LinearIndependent (frobenius k p).fieldRange
      (fun e : Fin r → Fin p => ∏ i, b i ^ (e i : ℕ)) ∧
    Submodule.span (frobenius k p).fieldRange
      (Set.range fun e : Fin r → Fin p => ∏ i, b i ^ (e i : ℕ)) = ⊤

/-- The differentials of a p-basis form a basis of `Ω¹_(k/F_p)`, so its dimension is
`log_p [k : k^p]` (Clausen–Mathew–Morrow, Theorem 5.7). This is `pBasis_kaehler_basis` of the
README (0.23). -/
theorem pBasis_kaehler_basis (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p]
    [Algebra (ZMod p) k] {r : ℕ} (b : Fin r → k) (hb : IsPBasis p k b) :
    LinearIndependent k (fun i => KaehlerDifferential.D (ZMod p) k (b i)) ∧
      Submodule.span k (Set.range fun i => KaehlerDifferential.D (ZMod p) k (b i)) = ⊤ := by
  sorry

-- For a perfect field the empty family is a p-basis.
example (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p] [PerfectRing k p] :
    IsPBasis p k (Fin.elim0 : Fin 0 → k) := by
  sorry

-- For `F_p(t)` the variable `t` is a p-basis, including `p = 2`.
example (p : ℕ) [Fact p.Prime] :
    IsPBasis p (RatFunc (ZMod p)) (fun _ : Fin 1 => RatFunc.X) := by
  sorry

-- The transcendence basis `{t^p}` of `F_p(t)` is not a p-basis.
example (p : ℕ) [Fact p.Prime] :
    ¬ IsPBasis p (RatFunc (ZMod p)) (fun _ : Fin 1 => (RatFunc.X : RatFunc (ZMod p)) ^ p) := by
  sorry

end DerivedDeRham

/-! ## Layer 1: Completion and filtered modules -/

namespace DerivedDeRham

/-- The standard derived-category instance for modules over `R`, local to these signatures. -/
local instance moduleDerived (R : Type) [CommRing R] :
    HasDerivedCategory.{1} (ModuleCat.{0} R) :=
  HasDerivedCategory.standard _

/-- The derived category `D(R)` of `R`-modules. -/
abbrev D (R : Type) [CommRing R] := DerivedCategory (ModuleCat.{0} R)

/-- A module placed in cohomological degree zero. -/
abbrev mod0 (R : Type) [CommRing R] (M : ModuleCat.{0} R) : D R :=
  (DerivedCategory.singleFunctor (ModuleCat R) 0).obj M

/-- Cohomology in the indicated cohomological degree. -/
abbrev H (R : Type) [CommRing R] (n : ℤ) (M : D R) : ModuleCat R :=
  (DerivedCategory.homologyFunctor (ModuleCat R) n).obj M

/-- **Derived `I`-completeness** of `M ∈ D(A)`: every morphism from a shifted localization
`A[1/f][n]`, `f ∈ I`, to `M` is zero (Stacks, Tags 091P, 091S). This is a homotopical condition, not
classical separatedness. -/
def derivedCompleteness (A : Type) [CommRing A] (I : Ideal A) (M : D A) : Prop :=
  ∀ f ∈ I, ∀ n : ℤ,
    Subsingleton ((mod0 A (ModuleCat.of A (Localization.Away f)))⟦n⟧ ⟶ M)

/-- The condition can be tested on any finite generating set of `I` (Stacks, Lemma 15.93.1). -/
theorem isDerivedCompleteGenerators (A : Type) [CommRing A] (I : Ideal A) (M : D A)
    (s : Finset A) (hs : Ideal.span (s : Set A) = I) :
    derivedCompleteness A I M ↔ ∀ f ∈ s, ∀ n : ℤ,
      Subsingleton ((mod0 A (ModuleCat.of A (Localization.Away f)))⟦n⟧ ⟶ M) := by
  sorry

/-- Derived completeness depends only on the radical (Stacks, Lemma 15.93.2). -/
theorem isDerivedCompleteRadical (A : Type) [CommRing A] (I J : Ideal A)
    (hI : I.FG) (hJ : J.FG) (h : I.radical = J.radical) (M : D A) :
    derivedCompleteness A I M ↔ derivedCompleteness A J M := by
  sorry

/-- `M` is derived complete iff every cohomology module is (Stacks, Proposition 15.93.5). -/
theorem isDerivedCompleteCohomology (A : Type) [CommRing A] (I : Ideal A) (hI : I.FG) (M : D A) :
    derivedCompleteness A I M ↔ ∀ j : ℤ, derivedCompleteness A I (mod0 A (H A j M)) := by
  sorry

/-- Derived complete objects are closed under shifts and under the third vertex of a distinguished
triangle: the triangulated part of `isDerivedCompleteLimits` (README 1.2), which also asks for
products and derived limits. -/
theorem isDerivedComplete_triangle (A : Type) [CommRing A] (I : Ideal A)
    (T : Pretriangulated.Triangle (D A)) (hT : T ∈ distTriang (D A))
    (h₁ : derivedCompleteness A I T.obj₁) (h₂ : derivedCompleteness A I T.obj₂) :
    derivedCompleteness A I T.obj₃ ∧ ∀ n : ℤ, derivedCompleteness A I (T.obj₁⟦n⟧) := by
  sorry

-- For `I = 0` every complex is derived complete.
example (A : Type) [CommRing A] (M : D A) : derivedCompleteness A ⊥ M := by
  sorry

-- For `I = A` only the zero object is derived complete.
example (A : Type) [CommRing A] (M : D A) : derivedCompleteness A ⊤ M ↔ IsZero M := by
  sorry

-- `ℤ_p` is derived p-complete over `ℤ`, while `ℚ_p` is not.
example (p : ℕ) [Fact p.Prime] :
    derivedCompleteness ℤ (Ideal.span {(p : ℤ)}) (mod0 ℤ (ModuleCat.of ℤ (PadicInt p))) ∧
      ¬ derivedCompleteness ℤ (Ideal.span {(p : ℤ)}) (mod0 ℤ (ModuleCat.of ℤ (Padic p))) := by
  sorry

/-- **Complete flatness of a module.** A module `M` is `I`-completely flat when its derived reduction
`M ⊗^L_A A/I` is a flat `A/I`-module in degree zero: the higher `Tor_n^A(M, A/I)` vanish and
`A/I ⊗_A M` is flat over `A/I`. This is the discrete case of `completeFlatness` (README 1.7); the
predicate does not require `M` to be complete. -/
def IsCompletelyFlatModule (A : Type) [CommRing A] (I : Ideal A) (M : ModuleCat.{0} A) : Prop :=
  (∀ n : ℕ, 0 < n →
      IsZero (((CategoryTheory.Tor (ModuleCat.{0} A) n).obj M).obj (ModuleCat.of A (A ⧸ I)))) ∧
    Module.Flat (A ⧸ I) ((A ⧸ I) ⊗[A] M)

/-- A flat module is `I`-completely flat (the discrete part of `completeFlatCompletion`). -/
theorem isCompletelyFlatModule_of_flat (A : Type) [CommRing A] (I : Ideal A) (M : ModuleCat.{0} A)
    [Module.Flat A M] : IsCompletelyFlatModule A I M := by
  sorry

-- `ℤ` is p-completely flat over itself but not derived p-complete.
example (p : ℕ) [Fact p.Prime] :
    IsCompletelyFlatModule ℤ (Ideal.span {(p : ℤ)}) (ModuleCat.of ℤ ℤ) ∧
      ¬ derivedCompleteness ℤ (Ideal.span {(p : ℤ)}) (mod0 ℤ (ModuleCat.of ℤ ℤ)) := by
  sorry

-- `ℤ_p` is p-completely faithfully flat over `ℤ`.
example (p : ℕ) [Fact p.Prime] :
    IsCompletelyFlatModule ℤ (Ideal.span {(p : ℤ)}) (ModuleCat.of ℤ (PadicInt p)) ∧
      Module.FaithfullyFlat (ℤ ⧸ Ideal.span {(p : ℤ)})
        ((ℤ ⧸ Ideal.span {(p : ℤ)}) ⊗[ℤ] PadicInt p) := by
  sorry

-- `F_p` is not p-completely flat over `ℤ`: `Tor₁^ℤ(F_p, F_p) = F_p` is nonzero.
example (p : ℕ) [Fact p.Prime] :
    ¬ IsCompletelyFlatModule ℤ (Ideal.span {(p : ℤ)}) (ModuleCat.of ℤ (ZMod p)) := by
  sorry

/-- **Bhatt's ordinary flatness criterion** (Bhatt, *On the direct summand conjecture and its
derived variant*, Proposition 5.1): over a Noetherian base, `π`-torsion-free and classically
`π`-adically complete algebras with flat reduction are flat. README 1.10. -/
theorem ordinaryFlatnessFromCompleteFlatness (A B : Type) [CommRing A] [CommRing B] [Algebra A B]
    [IsNoetherianRing A] (π : A)
    (hπA : IsSMulRegular A π) (hπB : IsSMulRegular B (algebraMap A B π))
    (hA : IsAdicComplete (Ideal.span {π}) A) (hB : IsAdicComplete (Ideal.span {π}) B)
    (hflat : Module.Flat (A ⧸ Ideal.span {π})
      (B ⧸ Ideal.map (algebraMap A B) (Ideal.span {π}))) :
    Module.Flat A B := by
  sorry

/-- A quotient `N/gN` of a derived `f`-complete module is derived `f`-complete; the classical
statement is `quotientClassicalCompleteness`. README 1.11. -/
theorem quotientCompleteness (A : Type) [CommRing A] (N : ModuleCat.{0} A) (f g : A)
    (h : derivedCompleteness A (Ideal.span {f}) (mod0 A N)) :
    derivedCompleteness A (Ideal.span {f})
      (mod0 A (ModuleCat.of A (N ⧸ LinearMap.range (g • (LinearMap.id : N →ₗ[A] N))))) := by
  sorry

/-- If `N` is classically `f`-adically complete and `f` is a nonzerodivisor on `N/gN`, then `N/gN`
is classically `f`-adically complete (Bhatt–Ma–Patakfalvi–Schwede–Tucker–Waldron–Witaszek,
Lemmas 2.7–2.8). Without the injectivity hypothesis the quotient need not be separated. -/
theorem quotientClassicalCompleteness (A : Type) [CommRing A] (N : Type) [AddCommGroup N]
    [Module A N] (f g : A) (hN : IsAdicComplete (Ideal.span {f}) N)
    (hreg : IsSMulRegular (N ⧸ LinearMap.range (g • (LinearMap.id : N →ₗ[A] N))) f) :
    IsAdicComplete (Ideal.span {f}) (N ⧸ LinearMap.range (g • (LinearMap.id : N →ₗ[A] N))) := by
  sorry

/-- The series with coefficients `p^(−n)` admits no common p-power denominator. It separates
inverting `p` after the limit of `ℤ_p[t]/(t^n)` from inverting it before that limit (README 1.15). -/
theorem test_bdr_p_inverted_inside (p : ℕ) [Fact p.Prime] :
    ¬ ∃ (N : ℕ) (g : PowerSeries (PadicInt p)), ∀ n : ℕ,
      (p : Padic p) ^ N *
          PowerSeries.coeff n (PowerSeries.mk fun k : ℕ => ((p : Padic p) ^ k)⁻¹) =
        (↑(PowerSeries.coeff (R := PadicInt p) n g) : Padic p) := by
  sorry

end DerivedDeRham

/-! ## Layer 2: Ordinary and derived de Rham cohomology -/

namespace DeRham

universe u

variable (A B : Type u) [CommRing A] [CommRing B] [Algebra A B]

/-- The existing exterior power `Ωⁿ_(B/A)` of the Kähler differentials, with scalars restricted
to `A` where needed. -/
abbrev Forms (n : ℕ) := exteriorPower B n (KaehlerDifferential A B)

/-- The free `A`-module `Sₙ` on coefficient and differential-generator tuples `[c; v]`. -/
abbrev Symbols (n : ℕ) := (B × (Fin n → B)) →₀ A

/-- The basis symbol `[c; v]`. -/
abbrev sym (n : ℕ) (c : B) (v : Fin n → B) : Symbols A B n :=
  Finsupp.single (c, v) 1

/-- The elementary form `c dv₁ ∧ … ∧ dvₙ` in the existing exterior-power carrier. -/
abbrev elementary (n : ℕ) (c : B) (v : Fin n → B) : Forms A B n :=
  c • exteriorPower.ιMulti B n (fun i => KaehlerDifferential.D A B (v i))

/-- Multiplication in the graded exterior algebra, without factorial normalization. -/
abbrev wedge {m n : ℕ} (x : Forms A B m) (y : Forms A B n) : Forms A B (m + n) :=
  ⟨x.val * y.val, SetLike.mul_mem_graded x.property y.property⟩

/-- A coefficient viewed as a degree-zero form through `Ω⁰ ≃ B`. -/
abbrev zeroForm (b : B) : Forms A B 0 :=
  (exteriorPower.zeroEquiv B (KaehlerDifferential A B)).symm b

/-- The six relation families: coefficient additivity, base scalars, slot additivity, slot Leibniz,
base constants in a slot, and strict alternation. Only additive and `A`-scalar closure in the
coefficient is imposed. -/
def relationSet (n : ℕ) : Set (Symbols A B n) :=
  {x | (∃ c e v, x = sym A B n (c + e) v - sym A B n c v - sym A B n e v) ∨
    (∃ (a : A) (c : B) (v : Fin n → B), x = sym A B n (a • c) v - a • sym A B n c v) ∨
    (∃ c v i b e, x = sym A B n c (Function.update v i (b + e)) -
      sym A B n c (Function.update v i b) - sym A B n c (Function.update v i e)) ∨
    (∃ c v i b e, x = sym A B n c (Function.update v i (b * e)) -
      sym A B n (c * b) (Function.update v i e) -
      sym A B n (c * e) (Function.update v i b)) ∨
    (∃ (c : B) (v : Fin n → B) (i : Fin n) (a : A),
      x = sym A B n c (Function.update v i (algebraMap A B a))) ∨
    (∃ c v i j, i ≠ j ∧ v i = v j ∧ x = sym A B n c v)}

/-- The relation submodule `Rₙ ⊂ Sₙ`, the `A`-span of the six relation families (README 2.1). -/
def symbolRelations (n : ℕ) : Submodule A (Symbols A B n) :=
  Submodule.span A (relationSet A B n)

/-- `Rₙ` is the `A`-span of the six displayed families. -/
theorem symbolRelations_eq_span (n : ℕ) :
    symbolRelations A B n = Submodule.span A (relationSet A B n) :=
  rfl

/-- Coefficient additivity belongs to `Rₙ`. -/
theorem symbolRelations_coeff_add (n : ℕ) (c e : B) (v : Fin n → B) :
    sym A B n (c + e) v - sym A B n c v - sym A B n e v ∈ symbolRelations A B n := by
  sorry

/-- The slot Leibniz relation belongs to `Rₙ` for every slot. -/
theorem symbolRelations_slot_mul (n : ℕ) (c x y : B) (v : Fin n → B) (i : Fin n) :
    sym A B n c (Function.update v i (x * y)) - sym A B n (c * x) (Function.update v i y) -
      sym A B n (c * y) (Function.update v i x) ∈ symbolRelations A B n := by
  sorry

-- `[0; ()]` is a relation, whereas the unit `[1; ()]` is not.
example : sym A B 0 0 Fin.elim0 ∈ symbolRelations A B 0 := by
  sorry

example : sym ℤ ℤ 0 1 Fin.elim0 ∉ symbolRelations ℤ ℤ 0 := by
  sorry

-- A differential slot filled with an element of `A` is a relation.
example (c : B) (a : A) : sym A B 1 c (fun _ => algebraMap A B a) ∈ symbolRelations A B 1 := by
  sorry

-- `[1; X]` over `ℤ[X]` is not a relation, since `dX ≠ 0`.
example : sym ℤ (Polynomial ℤ) 1 1 (fun _ => Polynomial.X) ∉ symbolRelations ℤ (Polynomial ℤ) 1 := by
  sorry

-- Over `F₂` the diagonal degree-two symbol is itself a relation.
example (x : Polynomial (ZMod 2)) :
    sym (ZMod 2) (Polynomial (ZMod 2)) 2 1 (fun _ => x) ∈
      symbolRelations (ZMod 2) (Polynomial (ZMod 2)) 2 := by
  sorry

/-- The evaluation `qₙ : Sₙ → Ωⁿ`, `[c; v] ↦ c dv₁ ∧ … ∧ dvₙ` (README 2.2). -/
def symbolMap (n : ℕ) : Symbols A B n →ₗ[A] Forms A B n :=
  Finsupp.linearCombination A (fun cv : B × (Fin n → B) => elementary A B n cv.1 cv.2)

/-- `qₙ([c; v]) = c dv₁ ∧ … ∧ dvₙ`. -/
theorem symbolMap_single (n : ℕ) (c : B) (v : Fin n → B) :
    symbolMap A B n (sym A B n c v) = elementary A B n c v := by
  sorry

/-- `qₙ` is additive. -/
theorem symbolMap_add (n : ℕ) (x y : Symbols A B n) :
    symbolMap A B n (x + y) = symbolMap A B n x + symbolMap A B n y := by
  sorry

/-- `qₙ` is `A`-linear. -/
theorem symbolMap_smul (n : ℕ) (a : A) (s : Symbols A B n) :
    symbolMap A B n (a • s) = a • symbolMap A B n s := by
  sorry

-- In weight zero evaluation agrees with `zeroEquiv`.
example (c : B) :
    (exteriorPower.zeroEquiv B (KaehlerDifferential A B)) (symbolMap A B 0 (sym A B 0 c Fin.elim0)) =
      c := by
  sorry

-- In weight one evaluation is `c` times the universal derivation.
example (c x : B) :
    (exteriorPower.oneEquiv B (KaehlerDifferential A B)) (symbolMap A B 1 (sym A B 1 c (fun _ => x))) =
      c • KaehlerDifferential.D A B x := by
  sorry

-- The image of `[c; x, x]` is zero in every characteristic.
example (c x : B) : symbolMap A B 2 (sym A B 2 c (fun _ => x)) = 0 := by
  sorry

/-- The symbol map is surjective: elementary forms span `Ωⁿ` over `A` (README 2.3). -/
theorem symbolMap_surjective (n : ℕ) : Function.Surjective (symbolMap A B n) := by
  sorry

/-- `ker qₙ = Rₙ`, including `n = 0` (README 2.4). -/
theorem symbolRelations_ker (n : ℕ) : LinearMap.ker (symbolMap A B n) = symbolRelations A B n := by
  sorry

/-- The free differential `δₙ : Sₙ → Ωⁿ⁺¹`, `[c; v] ↦ dc ∧ dv₁ ∧ … ∧ dvₙ`, with the coefficient in
the first slot (README 2.5). -/
def freeDifferential (n : ℕ) : Symbols A B n →ₗ[A] Forms A B (n + 1) :=
  Finsupp.linearCombination A (fun cv : B × (Fin n → B) =>
    exteriorPower.ιMulti B (n + 1)
      (Fin.cons (KaehlerDifferential.D A B cv.1) (fun i => KaehlerDifferential.D A B (cv.2 i))))

/-- `δₙ([c; v]) = dc ∧ dv₁ ∧ … ∧ dvₙ`. -/
theorem freeDifferential_single (n : ℕ) (c : B) (v : Fin n → B) :
    freeDifferential A B n (sym A B n c v) =
      exteriorPower.ιMulti B (n + 1)
        (Fin.cons (KaehlerDifferential.D A B c) (fun i => KaehlerDifferential.D A B (v i))) := by
  sorry

/-- `δₙ` is additive. -/
theorem freeDifferential_add (n : ℕ) (s t : Symbols A B n) :
    freeDifferential A B n (s + t) = freeDifferential A B n s + freeDifferential A B n t := by
  sorry

/-- `δₙ` is `A`-linear. -/
theorem freeDifferential_smul (n : ℕ) (a : A) (s : Symbols A B n) :
    freeDifferential A B n (a • s) = a • freeDifferential A B n s := by
  sorry

-- Symbols with coefficient one have zero differential.
example (n : ℕ) (v : Fin n → B) : freeDifferential A B n (sym A B n 1 v) = 0 := by
  sorry

-- In weight zero the free differential is `D` after `oneEquiv`.
example (c : B) :
    (exteriorPower.oneEquiv B (KaehlerDifferential A B))
        (freeDifferential A B 0 (sym A B 0 c Fin.elim0)) = KaehlerDifferential.D A B c := by
  sorry

-- `δ₁([x; x]) = 0`, while over `ℤ[X, Y]` the oriented form `dX ∧ dY` is nonzero.
example (x : B) : freeDifferential A B 1 (sym A B 1 x (fun _ => x)) = 0 := by
  sorry

example :
    let B := MvPolynomial (Fin 2) ℤ
    let dx := KaehlerDifferential.D ℤ B (MvPolynomial.X 0)
    let dy := KaehlerDifferential.D ℤ B (MvPolynomial.X 1)
    freeDifferential ℤ B 1 (sym ℤ B 1 (MvPolynomial.X 0) (fun _ => MvPolynomial.X 1)) =
        exteriorPower.ιMulti B 2 (Fin.cons dx (fun _ => dy)) ∧
      exteriorPower.ιMulti B 2 (Fin.cons dx (fun _ => dy)) ≠ 0 := by
  sorry

/-- The free differential kills every relation (README 2.6). -/
theorem freeDifferential_relations (n : ℕ) :
    symbolRelations A B n ≤ LinearMap.ker (freeDifferential A B n) := by
  sorry

/-- The characterizing property of the de Rham differential `DeRham.d A B n` of README 2.7:
`f (c dv₁ ∧ … ∧ dvₙ) = dc ∧ dv₁ ∧ … ∧ dvₙ` on elementary forms (`d_elementary`). -/
def IsDeRhamDifferential (n : ℕ) (f : Forms A B n →ₗ[A] Forms A B (n + 1)) : Prop :=
  ∀ (c : B) (v : Fin n → B), f (elementary A B n c v) =
    exteriorPower.ιMulti B (n + 1)
      (Fin.cons (KaehlerDifferential.D A B c) (fun i => KaehlerDifferential.D A B (v i)))

/-- There is exactly one `A`-linear map `Ωⁿ → Ωⁿ⁺¹` with the elementary-form rule: existence is the
descent of `δₙ` along `qₙ`, uniqueness is `d_unique` (README 2.7–2.9). -/
theorem existsUnique_isDeRhamDifferential (n : ℕ) :
    ∃! f : Forms A B n →ₗ[A] Forms A B (n + 1), IsDeRhamDifferential A B n f := by
  sorry

/-- Two maps with the elementary-form rule agree (`d_unique`, README 2.9). -/
theorem IsDeRhamDifferential.unique {n : ℕ} {f g : Forms A B n →ₗ[A] Forms A B (n + 1)}
    (hf : IsDeRhamDifferential A B n f) (hg : IsDeRhamDifferential A B n g) : f = g := by
  sorry

/-- The differential squares to zero (`d_squared`, README 2.10). -/
theorem IsDeRhamDifferential.comp_eq_zero {n : ℕ} {d₀ : Forms A B n →ₗ[A] Forms A B (n + 1)}
    {d₁ : Forms A B (n + 1) →ₗ[A] Forms A B (n + 1 + 1)}
    (h₀ : IsDeRhamDifferential A B n d₀) (h₁ : IsDeRhamDifferential A B (n + 1) d₁) :
    d₁.comp d₀ = 0 := by
  sorry

/-- The graded Leibniz identity `d(α ∧ β) = dα ∧ β + (−1)ᵐ α ∧ dβ` (`d_leibniz`, README 2.11). -/
theorem IsDeRhamDifferential.leibniz {m n : ℕ} {dm : Forms A B m →ₗ[A] Forms A B (m + 1)}
    {dn : Forms A B n →ₗ[A] Forms A B (n + 1)}
    {dmn : Forms A B (m + n) →ₗ[A] Forms A B (m + n + 1)}
    (hm : IsDeRhamDifferential A B m dm) (hn : IsDeRhamDifferential A B n dn)
    (hmn : IsDeRhamDifferential A B (m + n) dmn) (x : Forms A B m) (y : Forms A B n) :
    (dmn (wedge A B x y)).val = (dm x).val * y.val + (-1 : B) ^ m • (x.val * (dn y).val) := by
  sorry

/-- In degree zero the differential is the universal derivation (`d_zero_degree`). -/
theorem IsDeRhamDifferential.zero_degree {f : Forms A B 0 →ₗ[A] Forms A B (0 + 1)}
    (hf : IsDeRhamDifferential A B 0 f) (b : B) :
    (exteriorPower.oneEquiv B (KaehlerDifferential A B)) (f (zeroForm A B b)) =
      KaehlerDifferential.D A B b := by
  sorry

/-- Over a nonzero base, `d(t·1) ≠ t·d(1)` in the polynomial de Rham complex. This gives the
base-linearity obstruction for the finite Hodge quotient of README 5.8. -/
theorem IsDeRhamDifferential.polynomial_not_linear (R : Type u) [CommRing R] [Nontrivial R]
    {f : Forms R (Polynomial R) 0 →ₗ[R] Forms R (Polynomial R) (0 + 1)}
    (hf : IsDeRhamDifferential R (Polynomial R) 0 f) :
    f (zeroForm R (Polynomial R) Polynomial.X) ≠
      (Polynomial.X : Polynomial R) • f (zeroForm R (Polynomial R) 1) := by
  sorry

-- The differential of a base constant is zero.
example {f : Forms A B 0 →ₗ[A] Forms A B (0 + 1)} (hf : IsDeRhamDifferential A B 0 f) (a : A) :
    f (zeroForm A B (algebraMap A B a)) = 0 := by
  sorry

-- The differential of `X` in `ℤ[X]` is nonzero, so the zero operator fails.
example {f : Forms ℤ (Polynomial ℤ) 0 →ₗ[ℤ] Forms ℤ (Polynomial ℤ) (0 + 1)}
    (hf : IsDeRhamDifferential ℤ (Polynomial ℤ) 0 f) :
    f (zeroForm ℤ (Polynomial ℤ) Polynomial.X) ≠ 0 := by
  sorry

-- The differential of `X` in `F₂[X]` over `F₂` is still nonzero.
example {f : Forms (ZMod 2) (Polynomial (ZMod 2)) 0 →ₗ[ZMod 2]
      Forms (ZMod 2) (Polynomial (ZMod 2)) (0 + 1)}
    (hf : IsDeRhamDifferential (ZMod 2) (Polynomial (ZMod 2)) 0 f) :
    f (zeroForm (ZMod 2) (Polynomial (ZMod 2)) Polynomial.X) ≠ 0 := by
  sorry

-- In `ℤ[X, Y]`, `d(X dY) = dX ∧ dY`, and this two-form is nonzero.
example {f : Forms ℤ (MvPolynomial (Fin 2) ℤ) 1 →ₗ[ℤ] Forms ℤ (MvPolynomial (Fin 2) ℤ) (1 + 1)}
    (hf : IsDeRhamDifferential ℤ (MvPolynomial (Fin 2) ℤ) 1 f) :
    let B := MvPolynomial (Fin 2) ℤ
    let dx := KaehlerDifferential.D ℤ B (MvPolynomial.X 0)
    let dy := KaehlerDifferential.D ℤ B (MvPolynomial.X 1)
    f (elementary ℤ B 1 (MvPolynomial.X 0) (fun _ => MvPolynomial.X 1)) ≠ 0 ∧
      f (elementary ℤ B 1 (MvPolynomial.X 0) (fun _ => MvPolynomial.X 1)) =
        exteriorPower.ιMulti B 2 (Fin.cons dx (fun _ => dy)) := by
  sorry

/-- The differential is linear for the Frobenius-twisted action: `d(bᵖ ω) = bᵖ dω` in
characteristic `p` (`d_frobenius_smul`, README 3.1). -/
theorem IsDeRhamDifferential.frobenius_smul (p : ℕ) [Fact p.Prime] [CharP A p] [CharP B p]
    {n : ℕ} {f : Forms A B n →ₗ[A] Forms A B (n + 1)} (hf : IsDeRhamDifferential A B n f)
    (b : B) (x : Forms A B n) : f (b ^ p • x) = b ^ p • f x := by
  sorry

variable {A B}
variable {C E : Type u} [CommRing C] [CommRing E] [Algebra A C] [Algebra A E]

/-- The characterizing property of the pullback `DeRham.pullback f n` of README 2.13: on elementary
forms, `c dv₁ ∧ … ∧ dvₙ ↦ f(c) d(f v₁) ∧ … ∧ d(f vₙ)` (`pullback_elementary`). -/
def IsFormPullback (f : B →ₐ[A] C) (n : ℕ) (g : Forms A B n →ₛₗ[f.toRingHom] Forms A C n) :
    Prop :=
  ∀ (c : B) (v : Fin n → B), g (elementary A B n c v) = elementary A C n (f c) (fun i => f (v i))

/-- The pullback exists and is unique (README 2.13–2.14). -/
theorem existsUnique_isFormPullback (f : B →ₐ[A] C) (n : ℕ) :
    ∃! g : Forms A B n →ₛₗ[f.toRingHom] Forms A C n, IsFormPullback f n g := by
  sorry

/-- In degree one the pullback is Tau Ceti's `KaehlerDifferential.mapSemilinear`. -/
theorem IsFormPullback.one_eq_mapSemilinear {f : B →ₐ[A] C}
    {g : Forms A B 1 →ₛₗ[f.toRingHom] Forms A C 1} (hg : IsFormPullback f 1 g)
    (x : Forms A B 1) :
    (exteriorPower.oneEquiv C (KaehlerDifferential A C)) (g x) =
      KaehlerDifferential.mapSemilinear f ((exteriorPower.oneEquiv B (KaehlerDifferential A B)) x) := by
  sorry

/-- Pullback commutes with the differential (`pullback_d`, README 2.15). -/
theorem IsFormPullback.comm_d {f : B →ₐ[A] C} {n : ℕ}
    {g : Forms A B n →ₛₗ[f.toRingHom] Forms A C n}
    {g' : Forms A B (n + 1) →ₛₗ[f.toRingHom] Forms A C (n + 1)}
    {dB : Forms A B n →ₗ[A] Forms A B (n + 1)} {dC : Forms A C n →ₗ[A] Forms A C (n + 1)}
    (hg : IsFormPullback f n g) (hg' : IsFormPullback f (n + 1) g')
    (hB : IsDeRhamDifferential A B n dB) (hC : IsDeRhamDifferential A C n dC) (x : Forms A B n) :
    g' (dB x) = dC (g x) := by
  sorry

/-- Pullback preserves wedge products (`pullback_wedge`, README 2.16). -/
theorem IsFormPullback.wedge {f : B →ₐ[A] C} {m n : ℕ}
    {gm : Forms A B m →ₛₗ[f.toRingHom] Forms A C m}
    {gn : Forms A B n →ₛₗ[f.toRingHom] Forms A C n}
    {gmn : Forms A B (m + n) →ₛₗ[f.toRingHom] Forms A C (m + n)}
    (hm : IsFormPullback f m gm) (hn : IsFormPullback f n gn) (hmn : IsFormPullback f (m + n) gmn)
    (x : Forms A B m) (y : Forms A B n) :
    gmn (DeRham.wedge A B x y) = DeRham.wedge A C (gm x) (gn y) := by
  sorry

/-- Pullback along the identity is the identity (`pullback_id`, README 2.17). -/
theorem IsFormPullback.id_apply {n : ℕ}
    {g : Forms A B n →ₛₗ[(AlgHom.id A B).toRingHom] Forms A B n}
    (hg : IsFormPullback (AlgHom.id A B) n g) (x : Forms A B n) : g x = x := by
  sorry

/-- Pullbacks compose (`pullback_comp`, README 2.18). -/
theorem IsFormPullback.comp_apply {f : B →ₐ[A] C} {f' : C →ₐ[A] E} {n : ℕ}
    {g : Forms A B n →ₛₗ[f.toRingHom] Forms A C n}
    {g' : Forms A C n →ₛₗ[f'.toRingHom] Forms A E n}
    {g'' : Forms A B n →ₛₗ[(f'.comp f).toRingHom] Forms A E n}
    (hg : IsFormPullback f n g) (hg' : IsFormPullback f' n g')
    (hg'' : IsFormPullback (f'.comp f) n g'') (x : Forms A B n) : g'' x = g' (g x) := by
  sorry

-- Degree-zero pullback is `f` under `Ω⁰ ≃ B`.
example {f : B →ₐ[A] C} {g : Forms A B 0 →ₛₗ[f.toRingHom] Forms A C 0}
    (hg : IsFormPullback f 0 g) (b : B) : g (zeroForm A B b) = zeroForm A C (f b) := by
  sorry

end DeRham

namespace DerivedDeRham

/-- The degreewise part of ordinary base change: `C ⊗_A Ωⁿ_(B/A) ≃ Ωⁿ_(C ⊗_A B/C)`. The differential
compatibility and the polynomial Künneth equivalence of `ordinaryBaseChangeKunneth` (README 2.20) are
further requirements. -/
theorem ordinaryBaseChangeKunneth (A B C : Type) [CommRing A] [CommRing B] [CommRing C]
    [Algebra A B] [Algebra A C] (n : ℕ) :
    Nonempty ((C ⊗[A] DeRham.Forms A B n) ≃ₗ[C] DeRham.Forms C (C ⊗[A] B) n) := by
  sorry

end DerivedDeRham

/-! ## Layer 5: Quasisyntomic descent, crystalline applications and geometric control -/

namespace DerivedDeRham

/-- The derived category of sheaves of modules over the base coefficient ring sheaf. Global
de Rham objects and finite Hodge quotients use this carrier (README 5.8). -/
abbrev baseLinearSheafDerived {C : Type} [SmallCategory C] {J : GrothendieckTopology C}
    (R : Sheaf J RingCat.{0}) :=
  letI := HasDerivedCategory.standard (SheafOfModules.{0} R)
  DerivedCategory (SheafOfModules.{0} R)

/-- The filtered derived category of module sheaves over the base coefficient ring sheaf,
with decreasing filtrations indexed by `ℤᵒᵖ` (README 5.8). -/
abbrev baseLinearFilteredDerived {C : Type} [SmallCategory C] {J : GrothendieckTopology C}
    (R : Sheaf J RingCat.{0}) :=
  letI := HasDerivedCategory.standard (ℤᵒᵖ ⥤ SheafOfModules.{0} R)
  DerivedCategory (ℤᵒᵖ ⥤ SheafOfModules.{0} R)

/-- **`Z_p(1)`**, the compatible systems of p-power roots of unity of a p-adically complete ring
`O`: the kernel of Mathlib's untilt `PreTilt O p →* O`, written multiplicatively (README 5.11). -/
def compatibleRootsOfUnity (O : Type) [CommRing O] (p : ℕ) [Fact p.Prime]
    [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O] : Submonoid (PreTilt O p) :=
  MonoidHom.mker PreTilt.untilt

/-- For `ε ∈ Z_p(1)`, `θ([ε]) = ε^♯ = 1`, so `[ε] − 1 ∈ ker θ` and `log [ε]` is defined in `A_cris`
(README 5.11, 6.21). -/
theorem teichmuller_sub_one_mem_ker_fontaineTheta (O : Type) [CommRing O] (p : ℕ) [Fact p.Prime]
    [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O]
    (ε : PreTilt O p) (hε : ε ∈ compatibleRootsOfUnity O p) :
    WittVector.teichmuller p ε - 1 ∈ RingHom.ker (WittVector.fontaineTheta O p) := by
  sorry

-- The identity system lies in `Z_p(1)`.
example (O : Type) [CommRing O] (p : ℕ) [Fact p.Prime] [Fact ¬IsUnit (p : O)]
    [IsAdicComplete (Ideal.span {(p : O)}) O] : (1 : PreTilt O p) ∈ compatibleRootsOfUnity O p := by
  sorry

-- An element with untilt different from `1` gives `[x] − 1 ∉ ker θ`.
example (O : Type) [CommRing O] (p : ℕ) [Fact p.Prime] [Fact ¬IsUnit (p : O)]
    [IsAdicComplete (Ideal.span {(p : O)}) O] (x : PreTilt O p) (hx : PreTilt.untilt x ≠ 1) :
    WittVector.teichmuller p x - 1 ∉ RingHom.ker (WittVector.fontaineTheta O p) := by
  sorry

-- `B_dR⁺` and `B_dR` of README 5.13–5.14 are Mathlib's.
#check @BDeRhamPlus
#check @BDeRham

end DerivedDeRham

/-
The constructions of the README are specified there with their intended signatures: the cotangent
complex `Algebra.CotangentComplex` and its API, derived tensor products and derived powers, derived
limits (`derivedLimit_surjective`, `derivedLimit_milnor` are the module adapters of
ArithmeticGaloisDuality §R02.1.1 / The Milnor sequence for towers of complexes; the derived-limit
functor and `derivedLimit_triangle` are constructed in README 1.1) and completion
(`derivedCompletion`, `completionUnit`, `completionAdjunction`,
`completionIdempotent`, `completeNakayama`, `completionComplete`, `completedColimit`), the filtered
derived category, the ordinary de Rham differential, complex and pullback (`complex_d_apply`,
`complex_d_nonadjacent`, `complex_X`, `complexMap_apply`, `complexMap_id`, `complexMap_comp`,
`pullback_smul`, `pullback_base_smul`, `pullback_add`, `d_add`, `d_base_smul`), derived de Rham
cohomology with its filtrations and completions, Cartier theory, crystalline comparisons, derived
de Rham–Witt theory, quasisyntomic sites and descent, period comparisons and the logarithmic theory.
-/

end

end TauCetiRoadmap.DerivedDeRhamCohomology

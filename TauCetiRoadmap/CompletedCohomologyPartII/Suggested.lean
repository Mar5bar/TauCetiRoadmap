import Mathlib
import TauCeti.Algebra.Homology.ShortComplex.Colimit
import TauCeti.RepresentationTheory.Invariants

/-!
# CompletedCohomologyPartII: representative target signatures

The roadmap is README.md. These are suggested forms, not an exhaustive checklist.
This file records light definitions and theorem signatures statable against the pinned
Mathlib and Tau Ceti APIs. It fixes the order of limits, inverse-precomposition convention
and residual-projector range topology. The arithmetic diagrams, comparison morphisms
and heavy constructions are targets of the README.
-/

noncomputable section
open CategoryTheory CategoryTheory.Limits Opposite
open scoped TensorProduct

namespace TauCetiRoadmap.CompletedCohomologyPartII

/-! ## Layer 0: arithmetic levels and coherent support diagrams

The arithmetic level category and coherent support diagram are README targets. -/

/-! ## Layer 1: the fixed-exponent colimit -/

section Diagrams
variable {R : Type} [Ring R]

/-- The fixed-exponent level colimit, as the native colimit of the supplied diagram of
modules (roadmap 1.1). The arithmetic diagram is a roadmap target; this is its colimit. -/
abbrev torsionColimit (F : ℕ ⥤ ModuleCat R) : ModuleCat R := colimit F

/-- Cofinal restriction is the native final-functor comparison (`torsionColimit_cofinal`). -/
example {J : Type} [Category J] (u : J ⥤ ℕ) [u.Final]
    (F : ℕ ⥤ ModuleCat R) : colimit (u ⋙ F) ≅ torsionColimit F :=
  Functor.Final.colimitIso u F

/-- A constant scalar diagram gives the scalar module, rather than its product over levels. -/
example : Nonempty (torsionColimit
    ((Functor.const ℕ).obj (ModuleCat.of R R)) ≃ₗ[R] R) := by
  sorry

-- The exact-colimit input is already provided by Tau Ceti.
#check TauCeti.moduleCat_ab5OfSize

end Diagrams

/-- A trivial C₂ action on a point has geometric degree one. At p = 3, normalizing that trace
by the raw index two changes its value; at p = 2 the raw index is not invertible (README 1.4). -/
example : (2 : ZMod 3)⁻¹ * 1 = 2 ∧ (2 : ZMod 3)⁻¹ * 1 ≠ 1 ∧
    (2 : ZMod 2) = 0 := by
  have hi : (2 : ZMod 3)⁻¹ = 2 := inv_eq_of_mul_eq_one_right (by decide)
  rw [hi]
  decide

/-! ## Layer 2: coefficient limits and complete torsion-free complexes -/

section CoefficientLimit
variable {R : Type} [CommRing R] [TopologicalSpace R]

/-- The native topological-module limit, specialized to a coefficient diagram (README 2.1). -/
abbrev coefficientLimit (F : ℕᵒᵖ ⥤ TopModuleCat R) : TopModuleCat R := limit F

/-- Projection equality detects equality, including the zero diagram. -/
example (F : ℕᵒᵖ ⥤ TopModuleCat R) (x y : ↥(coefficientLimit F))
    (h : ∀ j, (limit.π F j).hom x = (limit.π F j).hom y) : x = y := by
  sorry

/-- The constant zero coefficient diagram has zero limit. -/
example : Subsingleton (coefficientLimit
    ((Functor.const ℕᵒᵖ).obj (TopModuleCat.of R (Fin 0 → R)))) := by
  sorry

end CoefficientLimit

/-- Clause (1) of roadmap 2.5 (Pan 2022, Lemma 4.4.4 and its proof). For a bounded-above cochain
complex of `ϖ`-adically complete, `ϖ`-torsion-free modules, no cohomology module receives a
nonzero `O`-linear map from `O[1/ϖ]`: no nonzero class has a compatible system of `ϖ`-power
roots, so the `ϖ`-adic Tate module of the cohomology vanishes. A class lying in every
`ϖ ^ n • H^i` need not vanish without the bounded-torsion hypothesis of clause (4). Clauses
(2)–(4) need the reductions of the complex modulo every power of `ϖ` and their limits, and are
roadmap targets. -/
theorem homology_hom_away_eq_zero {O : Type} [CommRing O] (ϖ : O)
    (M : CochainComplex (ModuleCat.{0} O) ℤ) (n : ℤ) [M.IsStrictlyLE n]
    (hcomplete : ∀ i, IsAdicComplete (Ideal.span {ϖ}) (M.X i))
    (htorsionFree : ∀ i, IsSMulRegular (M.X i) ϖ) (i : ℤ)
    (f : Localization.Away ϖ →ₗ[O] M.homology i) : f = 0 := by
  sorry

/-- Check of roadmap 2.5 for `[O → O]` with differential `p`: the image of `p ^ n` in
`ZMod (p ^ n)` is zero, so the transitions of `H^0(M / p^(n+1)) = p^n O / p^(n+1)` vanish and
their limit is `0 = H^0(M)`. -/
example (p n : ℕ) : ((p : ZMod (p ^ n)) ^ n) = 0 := by
  rw [← Nat.cast_pow, ZMod.natCast_self]

/-! ## Layer 3: continuous duals and contragredients -/

section ContinuousDual
variable {O M N : Type} [CommRing O]
variable [AddCommGroup M] [Module O M] [TopologicalSpace M]
variable [AddCommGroup N] [Module O N] [TopologicalSpace N]
variable [TopologicalSpace O]

-- Continuous duals and their precomposition use the library carriers and maps.
#check ContinuousLinearMap.comp

example (f : M →L[O] N) (φ : N →L[O] O) (x : M) :
    φ.comp f x = φ (f x) := rfl

example (φ : M →L[O] O) : φ.comp (ContinuousLinearMap.id O M) = φ := by
  ext x
  rfl

end ContinuousDual

section Contragredient
variable {O Γ M : Type} [CommRing O] [Group Γ]
variable [AddCommGroup M] [Module O M]

/-- The left contragredient uses the inverse, as Mathlib's `Representation.dual` does. -/
example (ρ : Representation O Γ M) (g : Γ) (φ : Module.Dual O M) (x : M) :
    (ρ.dual g φ) x = φ (ρ g⁻¹ x) := rfl

/-- An `O`-valued functional kills a class annihilated by a nonzero scalar, which is why
`O`-linear duals cannot replace `E/O`-duals of torsion. -/
example [IsDomain O] (π : O) (hπ : π ≠ 0) (φ : M →ₗ[O] O)
    (x : M) (hx : π • x = 0) : φ x = 0 := by
  have h : π * φ x = 0 := by
    simpa only [map_smul, smul_eq_mul, map_zero] using congrArg φ hx
  exact (mul_eq_zero.mp h).resolve_left hπ

/-- The integral algebraic dual of a torsion module vanishes. -/
example (φ : ZMod 2 →ₗ[ℤ] ℤ) : φ = 0 := by
  sorry

end Contragredient

/-- README 3.1: the inverse of a product reverses order. These integral shears distinguish
the correct inverse-precomposition value one from the reversed value two. -/
example :
    let Ainv : Matrix (Fin 2) (Fin 2) ℤ := !![1, -1; 0, 1]
    let Binv : Matrix (Fin 2) (Fin 2) ℤ := !![1, 0; -1, 1]
    let x : Fin 2 → ℤ := ![1, 0]
    ((Binv * Ainv).mulVec x) 0 = 1 ∧ ((Ainv * Binv).mulVec x) 0 = 2 := by
  decide

/-! ## Layer 4: completed finite-cell models

The arithmetic finite-cell milestones require carriers supplied by the README. -/

/-- README 4.4 and 6.3: a coefficient twist starts with the scalar model. Twisting an already
rank-two coefficient space again gives the wrong rank. -/
example :
    Module.finrank ℚ ((Fin 1 → ℚ) ⊗[ℚ] (Fin 2 → ℚ)) = 2 ∧
    Module.finrank ℚ ((Fin 2 → ℚ) ⊗[ℚ] (Fin 2 → ℚ)) = 4 := by
  simp [Module.finrank_tensorProduct]

/-! ## Layer 5: finiteness and admissibility

The arithmetic completed modules are README targets. -/

/-! ## Layer 6: descent

Completed continuous Tor and the arithmetic descent morphisms are README targets. -/

/-! ## Layer 7: completed interior cohomology as an image -/

section Interior
variable {R M N : Type} [Ring R]
variable [AddCommGroup M] [Module R M]
variable [AddCommGroup N] [Module R N]

-- The image of the arithmetic support map uses the native range (README 7.4).
#check LinearMap.range

example : LinearMap.range (0 : M →ₗ[R] N) = ⊥ := by simp

example : LinearMap.range (LinearMap.id : M →ₗ[R] M) = ⊤ := by simp

/-- The closed-image milestone of roadmap 7.5 uses compactness and the Hausdorff property. -/
theorem interiorSubmodule_closed [TopologicalSpace M] [CompactSpace M]
    [TopologicalSpace N] [T2Space N] (f : M →L[R] N) :
    IsClosed (f.range : Set N) := by
  sorry

end Interior

/-! ## Layer 8: transported actions and residual localisation -/

section TopologicalDiagrams
variable {R : Type} [CommRing R] [TopologicalSpace R]
variable (F : ℕᵒᵖ ⥤ TopModuleCat R)
variable {Γ : Type} [Monoid Γ]

/-- The action on the coefficient limit induced by a natural action on the diagram: Mathlib's
limit functor applied to endomorphisms (roadmap 8.7). The arithmetic finite actions are
transported to the diagram first. -/
abbrev transportedAction (ρ : Γ →* End F) : Γ →* End (coefficientLimit F) :=
  ((lim : (ℕᵒᵖ ⥤ TopModuleCat R) ⥤ TopModuleCat R).mapEnd F).comp ρ

/-- Each limit projection intertwines the induced operator with the diagram component. -/
theorem transportedAction_projection (ρ : Γ →* End F) (g : Γ) (j : ℕᵒᵖ) :
    transportedAction F ρ g ≫ limit.π F j = limit.π F j ≫ (ρ g).app j := by
  sorry

/-- An action agreeing with the diagram action under every projection is the induced one. -/
theorem transportedAction_unique (ρ : Γ →* End F) (σ : Γ →* End (coefficientLimit F))
    (hσ : ∀ g j, σ g ≫ limit.π F j = limit.π F j ≫ (ρ g).app j) :
    σ = transportedAction F ρ := by
  sorry

/-- Commuting natural actions induce commuting operators on the limit. -/
theorem transportedAction_commute {Δ : Type} [Monoid Δ]
    (ρ : Γ →* End F) (σ : Δ →* End F)
    (h : ∀ g d, Commute (ρ g) (σ d)) (g : Γ) (d : Δ) :
    Commute (transportedAction F ρ g) (transportedAction F σ d) := by
  sorry

/-- Milestone of roadmap 2.6 and 8.7: coordinatewise joint continuity gives joint continuity
on the limit topology. -/
theorem transportedAction_jointlyContinuous [TopologicalSpace Γ]
    (ρ : Γ →* End F)
    (h : ∀ j, Continuous (fun z : Γ × F.obj j => ((ρ z.1).app j).hom z.2)) :
    Continuous (fun z : Γ × ↥(coefficientLimit F) => (transportedAction F ρ z.1).hom z.2) := by
  sorry

/-- A continuous idempotent commuting with the action has an invariant range. -/
theorem transportedAction_localized (ρ : Γ →* End F)
    (P : ↥(coefficientLimit F) →L[R] ↥(coefficientLimit F)) (hP : IsIdempotentElem P)
    (h : ∀ g, Commute P (transportedAction F ρ g).hom)
    (g : Γ) (x : P.range) :
    (transportedAction F ρ g).hom x ∈ P.range := by
  sorry

/- Test `transportedAction_identity`: the trivial natural action stays trivial. -/
example (ρ : Γ →* End F) (h : ∀ g, ρ g = 1) (g : Γ) :
    transportedAction F ρ g = 1 := by
  sorry

/- Test `transportedAction_sign`: for the constant O diagram and the nontrivial element of
C₂, including O = Z₂, the action is −1 and not 1. -/
example (ρ : Γ →* End F) (g : Γ)
    (h : ∀ j, (ρ g).app j = -(𝟙 (F.obj j))) :
    transportedAction F ρ g = -(𝟙 (coefficientLimit F)) := by
  sorry

end TopologicalDiagrams

/- Test `transportedAction_noncommuting`: two integral shears do not commute, so commutation on
the limit needs the commuting finite actions as a hypothesis. -/
example :
    let A : Matrix (Fin 2) (Fin 2) ℤ := !![1, 1; 0, 1]
    let B : Matrix (Fin 2) (Fin 2) ℤ := !![1, 0; 1, 1]
    A * B ≠ B * A := by
  sorry

/-- Integral sign remains nontrivial at p = 2 even though its mod-2 reduction is trivial. -/
example : (-1 : ℤ_[2]) ≠ 1 ∧ (-1 : ZMod 2) = 1 := by
  sorry

/- Layer 8. The algebraic inverse-limit and residual factor milestones.
The topology and the arithmetic derived-image diagram remain README targets. -/

/-- The native commutative-ring limit of supplied finite Hecke images (README 8.10). -/
abbrev completedHecke (F : ℕᵒᵖ ⥤ CommRingCat) : CommRingCat := limit F

/-- Evaluation is the existing ring-limit projection. -/
abbrev completedHecke_eval (F : ℕᵒᵖ ⥤ CommRingCat) (j : ℕᵒᵖ) :
    completedHecke F →+* F.obj j := (limit.π F j).hom

/-- The constant scalar diagram recovers its scalar ring, including its ring structure. -/
example (O : Type) [CommRing O] :
    Nonempty (completedHecke ((Functor.const ℕᵒᵖ).obj (CommRingCat.of O)) ≃+* O) := by
  sorry

/-- The zero image algebra is the one-element ring, with no residual maximal ideals. -/
example :
    Subsingleton (completedHecke ((Functor.const ℕᵒᵖ).obj (CommRingCat.of (ZMod 1)))) ∧
    IsEmpty (MaximalSpectrum
      (completedHecke ((Functor.const ℕᵒᵖ).obj (CommRingCat.of (ZMod 1))))) := by
  sorry

/-- Equality in the Hecke limit is detected by every finite projection. -/
example (F : ℕᵒᵖ ⥤ CommRingCat) (x y : completedHecke F)
    (h : ∀ j, completedHecke_eval F j x = completedHecke_eval F j y) : x = y := by
  sorry

/-- Evaluation preserves the unit; in the zero ring the unit is also zero. -/
example (F : ℕᵒᵖ ⥤ CommRingCat) (j : ℕᵒᵖ) : completedHecke_eval F j 1 = 1 :=
  map_one _

/-- Milestone of roadmap 8.11: under surjective transitions with radical kernels the completed
Hecke algebra has finitely many maximal ideals. The radical condition concerns algebraic maximal
ideals; continuity alone would not give it. -/
theorem completedHecke_semilocal (F : ℕᵒᵖ ⥤ CommRingCat)
    [∀ j, Finite (F.obj j)]
    (hs : ∀ {i j} (g : i ⟶ j), Function.Surjective (F.map g).hom)
    (hr : ∀ (j : ℕᵒᵖ),
      RingHom.ker ((F.map ((homOfLE (Nat.zero_le (unop j))).op)).hom) ≤
        Ideal.jacobson (⊥ : Ideal (F.obj j))) :
    Finite (MaximalSpectrum (completedHecke F)) := by
  sorry

/-- The algebraic product decomposition into local factors (roadmap 8.11); the inverse-limit
topology of the factors is a further roadmap statement. -/
theorem completedHecke_decomposition (F : ℕᵒᵖ ⥤ CommRingCat)
    [∀ j, Finite (F.obj j)]
    (hs : ∀ {i j} (g : i ⟶ j), Function.Surjective (F.map g).hom)
    (hr : ∀ (j : ℕᵒᵖ),
      RingHom.ker ((F.map ((homOfLE (Nat.zero_le (unop j))).op)).hom) ≤
        Ideal.jacobson (⊥ : Ideal (F.obj j))) :
    Nonempty (completedHecke F ≃+*
      ∀ m : MaximalSpectrum (completedHecke F), Localization.AtPrime m.asIdeal) := by
  sorry

/-- A compatible family of finite idempotents gives a unique idempotent of the native limit.
Its arithmetic residual label is supplied by README 8.9 and 8.12. -/
theorem residualProjector_existsUnique (F : ℕᵒᵖ ⥤ CommRingCat) (e : ∀ j, F.obj j)
    (he : ∀ {i j} (g : i ⟶ j), (F.map g).hom (e i) = e j)
    (hi : ∀ j, IsIdempotentElem (e j)) :
    ∃! x : completedHecke F,
      IsIdempotentElem x ∧ ∀ j, completedHecke_eval F j x = e j := by
  sorry

/-- The factor cut out by an idempotent supported at exactly one maximal ideal is the
localisation there. -/
theorem residualProjector_factor {T : Type} [CommRing T] (e : T)
    (he : IsIdempotentElem e) (m : MaximalSpectrum T)
    (hsupport : ∀ n : MaximalSpectrum T, e ∈ n.asIdeal ↔ n ≠ m) :
    Nonempty ((T ⧸ Ideal.span ({1 - e} : Set T)) ≃+* Localization.AtPrime m.asIdeal) := by
  sorry

/- Layer 8: residual localisation as the range of a continuous idempotent

`P` is meant to be the action of an actual residual projector; this is not an abstract
localisation at an arbitrary ideal. -/

section Localization
variable {R M N : Type} [CommRing R]
variable [AddCommGroup M] [Module R M] [TopologicalSpace M] [IsTopologicalAddGroup M]
variable [AddCommGroup N] [Module R N] [TopologicalSpace N] [IsTopologicalAddGroup N]

/-- The residual localisation of roadmap 8.13: the range of a continuous idempotent. -/
abbrev completedLocalization (P : M →L[R] M) := ↥P.range

/-- The native continuous subtype inclusion of the residual range. -/
abbrev completedLocalization_inclusion (P : M →L[R] M) :
    completedLocalization P →L[R] M := P.range.subtypeL

/-- Corestriction of the native continuous operator to its range. -/
abbrev completedLocalization_projection (P : M →L[R] M) :
    M →L[R] completedLocalization P := P.rangeRestrict

/-- An idempotent range is a continuous direct summand (README 8.13). -/
theorem completedLocalization_split (P : M →L[R] M) (hP : IsIdempotentElem P) :
    (completedLocalization_projection P).comp (completedLocalization_inclusion P) =
      ContinuousLinearMap.id R (completedLocalization P) ∧
    (completedLocalization_inclusion P).comp (completedLocalization_projection P) = P := by
  sorry

-- Idempotent fixed points and closedness are supplied by Mathlib.
#check LinearMap.IsIdempotentElem.mem_range_iff
#check ContinuousLinearMap.IsIdempotentElem.isClosed_range

/- Test `completedLocalization_zero`. -/
example : Subsingleton (completedLocalization (0 : M →L[R] M)) := by
  sorry

/- Test `completedLocalization_one`. -/
example : Nonempty (completedLocalization (ContinuousLinearMap.id R M) ≃L[R] M) := by
  sorry

end Localization

/-- The closed residual range of a complete Hausdorff module is complete. -/
theorem completedLocalization_complete {R M : Type} [CommRing R]
    [AddCommGroup M] [Module R M] [UniformSpace M] [IsUniformAddGroup M]
    [T2Space M] [CompleteSpace M] (P : M →L[R] M) (hP : IsIdempotentElem P) :
    CompleteSpace (completedLocalization P) := by
  sorry

/-- The inclusion of a residual range evaluates to its underlying element. -/
example {R M : Type} [CommRing R] [AddCommGroup M] [Module R M]
    [TopologicalSpace M] [IsTopologicalAddGroup M]
    (P : M →L[R] M) (x : completedLocalization P) :
    completedLocalization_inclusion P x = (x : M) := rfl

/-- The projection applied to zero is zero, for both zero and identity idempotents. -/
example {R M : Type} [CommRing R] [AddCommGroup M] [Module R M]
    [TopologicalSpace M] [IsTopologicalAddGroup M] (P : M →L[R] M) :
    completedLocalization_projection P 0 = 0 := map_zero _

/-- Under the supported-label hypothesis, algebraic localization is the selected image.
Its topology is separately fixed by the continuous range, not by this algebraic equivalence. -/
theorem completedLocalization_algebraic {T M : Type} [CommRing T]
    [AddCommGroup M] [Module T M] [TopologicalSpace M] [IsTopologicalAddGroup M]
    [ContinuousConstSMul T M] (e : T) (he : IsIdempotentElem e)
    (m : MaximalSpectrum T)
    (hsupport : ∀ n : MaximalSpectrum T, e ∈ n.asIdeal ↔ n ≠ m) :
    Nonempty (LocalizedModule m.asIdeal.primeCompl M ≃ₗ[T]
      LinearMap.range (e • LinearMap.id : M →ₗ[T] M)) := by
  sorry

/- README-only definitions and milestones, in layer order.

Native colimit specialization, README 1.1: torsionColimit_of, torsionColimit_eq,
torsionColimit_homology use the arithmetic diagram; torsionColimit_cofinal uses finality.
Arithmetic Hecke diagram, README 8.8: derivedHeckeDiagram_class,
derivedHeckeDiagram_surjective, derivedHeckeDiagram_coherence; its Checks are
 derivedHeckeDiagram_zero, derivedHeckeDiagram_scalar,
 derivedHeckeDiagram_intertwiner_insufficient.
Topological arithmetic Hecke limit, README 8.10: completedHecke_ext,
completedHecke_lift, completedHecke_cofinal, completedHecke_dense,
completedHecke_action, completedHecke_action_continuous, completedHecke_scalar;
its Checks are completedHecke_constant and completedHecke_zero.
Residual arithmetic factors, README 8.12: residualProjector_eval,
residualProjector_unique, residualProjector_relations, residualProjector_product;
its Checks are residualProjector_local and residualProjector_congruent_characters.
Topological finite-product comparison, README 8.13: completedLocalization_product.


Layer 0: arithmetic level index; uniform pro-p subgroup and normal basis; coherent arithmetic
support tower; conjugation and tame coherence; non-neat derived realization; arithmetic test
towers; finite étale–Betti support comparison and oriented trace comparison.
Layer 1: the arithmetic torsionColimit diagram and smooth full-local-group action; tame Hecke
operators, trace normalization and tame-level variation.
Layer 2: derivedCompletedTower; Milnor and Mittag–Leffler control; strict integral admissible
complex control; the arithmetic completed topology; completion and Tate module; the four
completed modules; integral Bockstein; rational unitary Banach completion. Clauses (2)–(4) of
homology_equiv_limit_of_complete_torsionFree require reductions of the actual complex.
Layer 3: the topologies on native continuous integral duals and the E/O-dual; qualified biduality;
completed homology and Borel–Moore homology; arithmetic completed-group-algebra action and
two-index comparison; finite-coefficient and integral duality; completedHomology_equiv_limit_finite;
TameCompleted; tameBorelMooreDuality; dual completion–Tate sequence; admissibleComplex and
its local-ring criterion; admissible–perfect anti-equivalence and right/opposite tensor action;
orthonormalizable, pro-free and cofinitely generated coefficient modules; mixedCompletedTensor;
coefficient duality and mixed tensor-dual comparison; definite degree-zero Pontryagin pairing.
Layer 4: liftedCells; completedChain; perfectness and cochain comparison; derived finite-level
coinvariants; integralCochainModel; completedCohomology_coeff_equiv; derived stabilizer and
boundary replacements; the compact group-ring patched model.
Layer 5: analytic Iwasawa noetherianity; arithmetic finite generation and canonical topology;
bounded torsion; smooth and Banach admissibility; Auslander grade, coefficient shift and
canonical dimension; normalized classical growth; semisimple homology torsion; uniform-power
Hilbert growth; middle-degree classical rank and Tate torsion.
Layer 6: completed Hochschild–Serre and fixed-exponent descent; completed hyper-Tor descent;
algebraic coefficient untwisting; classical evaluation; lowest-degree edge comparison;
derived analytic comparison.
Layer 7: derived completed support triangle; ordinary and compact-support sequence;
homological support sequence; arithmetic interior cohomology and image-limit obstruction;
completed Iwasawa–Poincaré duality; boundary Levi induction; boundary-vanishing comparison.
Layer 8: effective central quotient; canonical selected-family towers; Hilbert/quaternionic
local-system input; modularCompletedComparison, siegelCompletedComparison,
unitaryCompletedComparison, hilbertCompletedComparison; definiteUnitaryDegreeZeroComparison;
scholzeFixedExponentComparison; arithmetic transportedAction; derivedHeckeDiagram;
residual support stability over noncommutative finite p-group rings; the topology, density and
cofinality of completedHecke; topological semilocal factors and compatible residual labels;
residualProjector relations; completedLocalization_map and completedLocalization_limit;
completedLocalization_levelColimit, completedLocalization_supportTriangle,
completedLocalization_dual and derivedCohomologicalResidualComparison.
-/

end TauCetiRoadmap.CompletedCohomologyPartII

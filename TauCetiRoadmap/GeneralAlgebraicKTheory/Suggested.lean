import Mathlib

/-!
# GeneralAlgebraicKTheory: representative target signatures

The roadmap is README.md. This file records light definitions and theorem signatures
statable against the pinned APIs and is not exhaustive. Classifying spaces use the
existing nerve and realization. The other definitions record the arithmetic conventions
for sphere interchange, relative differences, boundaries, projective-line twists and
finite Euler classes. The categorical K-theory constructions and their full interfaces
are targets in the README and are named in the closing comment.
-/

noncomputable section

universe u v

namespace TauCetiRoadmap.GeneralAlgebraicKTheory

open CategoryTheory
open scoped ContinuousMap

/- ## Layer 1: Categorical homotopy tools -/

/-- The classifying space is the realization of Mathlib's category nerve (§1.1). -/
abbrev classifyingSpace (C : Type u) [Category.{v} C] : TopCat.{max u v} :=
  SSet.toTop.obj (CategoryTheory.nerve C)

/-- The continuous map obtained by realizing the existing nerve map (§1.1). -/
abbrev classifyingSpaceMap {C D : Type u} [Category.{v} C] [Category.{v} D]
    (F : C ⥤ D) : C(classifyingSpace C, classifyingSpace D) :=
  (SSet.toTop.map (CategoryTheory.nerveMap F)).hom

/-- A natural transformation gives a homotopy, including when it is not invertible (§1.1). -/
theorem classifyingSpace_natTrans {C D : Type u} [Category.{u} C] [Category.{u} D]
    {F G : C ⥤ D} (α : F ⟶ G) :
    Nonempty (ContinuousMap.Homotopy (classifyingSpaceMap F) (classifyingSpaceMap G)) := sorry

/-- An equivalence realizes to a homotopy equivalence (§1.1). -/
theorem classifyingSpace_equivalence {C D : Type u} [Category.{u} C] [Category.{u} D]
    (e : C ≌ D) : Nonempty (classifyingSpace C ≃ₕ classifyingSpace D) := sorry

/-- Filteredness includes nonemptiness; the empty category is excluded (§1.1). -/
theorem classifyingSpace_filtered (C : Type u) [Category.{u} C] [IsFiltered C] :
    ContractibleSpace (classifyingSpace C) := sorry

/-- Finite-poset detection requires a nonempty target category (§1.1; Schlichting A.10). -/
theorem classifyingSpace_finitePosetDetection (C : Type u) [Category.{u} C] [Nonempty C]
    (h : ∀ (P : Type u) [PartialOrder P] [Finite P] (F : P ⥤ C),
      (classifyingSpaceMap F).Nullhomotopic) :
    ContractibleSpace (classifyingSpace C) := sorry

example : ContractibleSpace (classifyingSpace (Discrete PUnit)) := sorry
example : ¬ ContractibleSpace (classifyingSpace (Discrete Bool)) := sorry
example : ¬ ContractibleSpace (classifyingSpace (Discrete PEmpty)) := sorry

/-- The initial endpoint of the interval category realizes as a homotopy equivalence (§1.1). -/
example : ∃ e : classifyingSpace (Discrete PUnit) ≃ₕ classifyingSpace (Fin 2),
    e.toFun = classifyingSpaceMap ((Functor.const (Discrete PUnit)).obj (0 : Fin 2)) := sorry

/-- The terminal endpoint of the interval category realizes as a homotopy equivalence (§1.1). -/
example : ∃ e : classifyingSpace (Discrete PUnit) ≃ₕ classifyingSpace (Fin 2),
    e.toFun = classifyingSpaceMap ((Functor.const (Discrete PUnit)).obj (1 : Fin 2)) := sorry

/-- Realization preserves identity maps (§1.1). -/
example (C : Type u) [Category.{u} C] :
    classifyingSpaceMap (𝟭 C) = ContinuousMap.id (classifyingSpace C) := sorry

/-- Realization preserves composition of functors (§1.1). -/
example {C D E : Type u} [Category.{u} C] [Category.{u} D] [Category.{u} E]
    (F : C ⥤ D) (G : D ⥤ E) :
    classifyingSpaceMap (F ⋙ G) =
      (classifyingSpaceMap G).comp (classifyingSpaceMap F) := sorry

/- ## Layer 1: The sphere interchange convention -/

/-- Interchanging spheres in integer degrees contributes this unit (§1.8). -/
def sphereInterchangeSign (i j : ℤ) : ℤˣ := (-1) ^ (i * j)

example : sphereInterchangeSign 1 1 = -1 := by decide
example : sphereInterchangeSign 1 2 = 1 := by decide
example : sphereInterchangeSign (-1) 1 = -1 := by decide
example : (-1 : ZMod 2) = 1 := by decide

/- ## Layer 3: Finite elementary matrices and the unit class -/

/-- The two choices of representative for the first block give distinct stable matrices (§3.3). -/
example : (!![1,0,0;0,-1,0;0,0,1] : Matrix (Fin 3) (Fin 3) ℤ) ≠
    !![1,0,0;0,1,0;0,0,-1] := by decide

/-- The inverse elementary parameter is negative (§3.3). -/
example : (!![1,1;0,1] : Matrix (Fin 2) (Fin 2) ℤ) * !![1,-1;0,1] = 1 := by decide

/-- The ordered commutator e₁₂e₂₃e₁₂⁻¹e₂₃⁻¹ is e₁₃ (§3.3). -/
example : (!![1,1,0;0,1,0;0,0,1] : Matrix (Fin 3) (Fin 3) ℤ) *
    !![1,0,0;0,1,1;0,0,1] * !![1,-1,0;0,1,0;0,0,1] *
    !![1,0,0;0,1,-1;0,0,1] = !![1,0,1;0,1,0;0,0,1] := by decide

/-- The determinant representative of the integer K₁ unit has order two (§3.4). -/
example : (-1 : ℤˣ) ≠ 1 ∧ (-1 : ℤˣ) * (-1) = 1 := by decide

/- ## Layer 4: The relative-triple difference -/

/-- A relative triple has difference [P] − [Q], in that order (§4.15). -/
def relativeDifference {A : Type*} [AddCommGroup A] (source target : A) : A :=
  source - target

example : relativeDifference (2 : ℤ) 1 = 1 := rfl
example : relativeDifference (1 : ℤ) 2 = -1 := rfl
example : relativeDifference (1 : ℤ) 1 = 0 := rfl

/- ## Layer 8: Boundary and clutching conventions -/

/-- Localization index is cokernel minus kernel (§8.11), opposite to a two-term Euler class. -/
def indexClass {A : Type*} [AddCommGroup A] (ker coker : A) : A := coker - ker

example : indexClass (0 : ℤ) 1 = 1 := rfl
example : indexClass (1 : ℤ) 0 = -1 := rfl
example : indexClass (1 : ℤ) 1 = 0 := rfl

/-- Second-to-first clutching uses x = αy; the inverse shear gives a different x (§8.4). -/
example : (!![1,1;0,1] : Matrix (Fin 2) (Fin 2) ℤ).mulVec ![0,1] = ![1,1] := by
  ext i
  fin_cases i <;> simp [Matrix.mulVec, dotProduct, Fin.sum_univ_two]

example : (!![1,-1;0,1] : Matrix (Fin 2) (Fin 2) ℤ).mulVec ![0,1] = ![-1,1] := by
  ext i
  fin_cases i <;> simp [Matrix.mulVec, dotProduct, Fin.sum_univ_two]

/-- The uniformizer-last boundary has this sign in positive degree n (§8.13). -/
def uniformizerLastSign (n : ℕ) : ℤˣ := (-1) ^ (n - 1)

example : uniformizerLastSign 1 = 1 := by decide
example : uniformizerLastSign 2 = -1 := by decide
example : uniformizerLastSign 3 = 1 := by decide

/- ## Layer 9: Two-chart formulas -/

/-- Twisting uᵢ by n changes the gluing exponent to i − n (§9.1). -/
def twistExponent (i n : ℤ) : ℤ := i - n

example : twistExponent 0 1 = -1 := rfl
example : twistExponent 1 1 = 0 := rfl
example : twistExponent 2 (-1) = 3 := rfl

/-- Plus-chart first Koszul map, x ↦ (tx,−x), for the pair (X₁,−X₀) (§9.2). -/
def koszulLeft {R : Type*} [Ring R] (t x : R) : R × R := (t * x, -x)

/-- Plus-chart second Koszul map, (a,b) ↦ a+tb, for (X₀,X₁) (§9.2). -/
def koszulRight {R : Type*} [Ring R] (t : R) (xy : R × R) : R := xy.1 + t * xy.2

example : koszulLeft (2 : ℤ) 1 = (2, -1) := rfl
example : koszulLeft (0 : ℤ) 1 = (0, -1) := rfl
example : koszulLeft (2 : ℤ) 0 = (0, 0) := rfl
example : koszulRight (2 : ℤ) (2, 1) = 4 := rfl
example : koszulRight (0 : ℤ) (2, 3) = 2 := rfl
example : koszulRight (2 : ℤ) (0, 1) = 2 := rfl
example {R : Type*} [Ring R] (t x : R) : koszulRight t (koszulLeft t x) = 0 := by
  simp [koszulRight, koszulLeft]

/- ## Layer 10: Diagonal and chart difference -/

/-- The two-chart map is a difference, so the diagonal lies in its kernel (§10.2). -/
def chartDifference {A : Type*} [AddCommGroup A] : (A × A) →+ A where
  toFun xy := xy.1 - xy.2
  map_zero' := by simp
  map_add' x y := by simp only [Prod.fst_add, Prod.snd_add]; abel

example : chartDifference ((1 : ℤ), 1) = 0 := rfl
example : chartDifference ((1 : ℤ), 0) = 1 := rfl
example : chartDifference ((0 : ℤ), 1) = -1 := rfl

/- ## Layer 12: Completion and finite Euler conventions -/

/-- At an odd top support degree use the complementary idempotent (§12.6). -/
def topProjector {R : Type*} [Ring R] (n : ℕ) (p : R) : R :=
  if Even n then p else 1 - p

example : topProjector 0 (1 : ℤ) = 1 := by norm_num [topProjector]
example : topProjector 1 (1 : ℤ) = 0 := by norm_num [topProjector]
example : topProjector 2 (0 : ℤ) = 0 := by norm_num [topProjector]

/-- Degree zero is positive in the two-term Euler convention (§12.6). -/
def twoTermEuler {A : Type*} [AddCommGroup A] (degreeZero degreeOne : A) : A :=
  degreeZero - degreeOne

example : twoTermEuler (2 : ℤ) 3 = -1 := rfl
example : twoTermEuler (0 : ℤ) 1 = -1 := rfl
example : twoTermEuler (1 : ℤ) 0 = 1 := rfl

/-- Finite free modules over k × k give diagonal ranks; completion adds (1,0) (§12.2). -/
example : ¬ ∃ n : ℤ, (n, n) = ((1 : ℤ), 0) := by
  rintro ⟨n, h⟩
  have h₁ := congrArg Prod.fst h
  have h₂ := congrArg Prod.snd h
  simp only at h₁ h₂
  omega

/- ## Layer 13: Unitization and the Artin counterexample -/

/-- In unitization product coordinates the second component is diag(c,z), for R=ℤ (§13.3). -/
def cornerUnitizationSecond (z c : ℤ) : Matrix (Fin 2) (Fin 2) ℤ := !![c,0;0,z]

example : cornerUnitizationSecond 1 1 = (1 : Matrix (Fin 2) (Fin 2) ℤ) := by decide
example : cornerUnitizationSecond 1 0 = !![0,0;0,1] := rfl
example : cornerUnitizationSecond 0 1 = !![1,0;0,0] := rfl

/-- The cyclic order-25 group has an element not killed by five (§13.10, p=5). -/
example : ∃ x : ZMod 25, 5 • x ≠ 0 := by exact ⟨1, by decide⟩
/-- The elementary abelian order-25 group is killed by five (§13.10, p=5). -/
example : ∀ x : ZMod 5 × ZMod 5, 5 • x = 0 := by decide

/-
Full interfaces specified in README.md, using constructions developed there:
Layer 1: classifyingSpaceMap_id, classifyingSpaceMap_comp,
classifyingSpace_product, classifyingSpace_op, classifyingSpace_filteredColimit_pi;
HomotopyFibre/map/boundary/exact, bisimplicialRealization,
edgewiseSubdivision/homeomorph, isomorphismDoubleNerve, QuillenA/B,
PlusConstruction/pi1/localHomology/map, MonoidalLocalization/action/pi0/cofinality,
MonoidalLocalization.actionFibration with its chosen object and pointed-action naturality,
kTheorySequentialComparison and kTheoryPairingComparison in the supplied stable category.
Layer 2: QSpan, qSpanSetoid, QCat/lift/op, qCategory, SmallExactModel,
qConstruction, kSpace, kGroup, kGroupAddCommGroup, twoEdgeLoop, pi1QEquivExactK0.
Layer 3: projBaseChange/idIso/compIso, RingKSpace/ringKMap, ringKGroup/map,
StableGL/stabilizeMatrix/stableElementaryMatrix/map, finiteGLBlockSum, stableE,
idempotentBaseChange, ExtQ/ExtCat/ExtFibre with actions and cartesian lifts,
plusEqualsQ, cofinalFreeComparison, k0Equiv/k1Equiv.
Layer 4: conflationExactStructure and its evaluation exactness,
additivity, resolutionSubcategory, resolution, devissage, LocalizationModel and serreLocalization,
RelativeTriple, ClassicalRelativeK0/difference/naturality,
ClassicalAdditiveK1/map/quillenEquiv/boundary, the relative five-term sequence.
Layers 5–6: WaldhausenCategory/ofExact, SConstruction/restrict/simplicial,
standardTwoStepFlag, KSpace/KGroup, iteratedS, AdditivityFibre, edgewiseQ,
relative S, CylinderFunctor, CofibrantPosetDiagram, IteratedCylinder,
classWeak and the approximation/fibration/cofinality comparisons;
ExactStructure.yonedaExactEmbedding, ExactStructure.k0CofinalCompletion,
gilletWaldhausen_general with intrinsic homotopy-acyclic weak maps and both cofibration classes.
Layer 7: BiexactSGrid, stable biexact pairings and coherence,
transfer and its Artin base-change formula.
Layer 8: relativeK/group/les/ofPair/waldhausen, nonunitalK/map/compare,
MilnorPatch/baseChange/clutching, ideal K0 excision, AbsoluteExcision, TorUnital and the Tor criterion.
Layer 9: ProjectiveLine.Module/VectorBundle/KSpace/twist/u/koszul/map/directImage,
koszulRight_left, koszulLeft_zero, koszulRight_zero;
ProjectiveLine.IsRegular, P1.T0/Z0/T1/canonicalResolution/localisationModels/bundleLattices,
laurentTSection, NilCat/forget/zero,
nilGroup, torsion comparison and the positive Fundamental Theorem.
Layer 10: IsFlasqueRing, IsInfiniteSumRing, coneRing, contraction, IsAcyclic,
IsContracted, negativeK, NegativeKTheory, bassTheory, deloop, bassSpectrum;
noetherianRing_G0_polynomial and regularRing_K0_polynomial with iterated regularity.
Layer 11: FrobeniusPair/derived/map/ofExact/waldhausen, DenseClasses,
countableEnvelope, enlarge/suspension/setup/IK, IsExactSequence,
NegativeKSetup, IK0/negativeIK, FrobeniusReplacement and spectrum localization.
Layer 12: KaroubiFiltration/finiteIdeal/quotient, KaroubiCone/Suspension/Negative,
FiniteChainDomination, FiniteDomination.idempotent/finiteModel/modelEquivalence/euler,
restricted completion and cone–Frobenius comparison;
ExactStructure.unboundedDerivedCategory with its boundedness and Frobenius comparisons.
Layer 13: NonunitalBass/map/unitalEquiv, ArtinStableModel and its Cartan K-fibration,
enhanced derived invariance and integer-graded relative/transfer products;
finiteField_adamsInput, finiteGroup_KU_completion, finiteField_brauerLift,
finiteFieldKGroups, finiteField_K4_vanishing, ArtinStableModel.k3_pPrimary (p > 3).
-/

end TauCetiRoadmap.GeneralAlgebraicKTheory

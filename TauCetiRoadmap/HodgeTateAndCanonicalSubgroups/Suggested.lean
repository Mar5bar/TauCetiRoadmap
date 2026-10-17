import Mathlib

/-!
# HodgeTateAndCanonicalSubgroups: representative target signatures

The roadmap is README.md. This file records light definitions and theorem signatures
statable against the pinned APIs and is not exhaustive. It fixes the compact-open
level order, distinguishes the weak, strong and geometric canonical-subgroup ranges,
and records the left coordinate action and its automorphy factor. Log structures on
adic spaces and the logarithmic layers are README targets in Layer 6 and Layer 7.
Quantitative guards below use rational heights for exact numerical examples; the
geometric statements use real rank-one valuations with v(p) = 1 and positive levels.
-/

namespace TauCetiRoadmap.HodgeTateAndCanonicalSubgroups

noncomputable section

universe u v

namespace HodgeTate

/-! ## Layer 2: Hodge–Tate exact sequence and torsors

The p-level tower `ShimuraTower.pLevel` is indexed by the compact open subgroups of
G(ℚ_p), ordered by inclusion. The index poset and its cofilteredness are statable at
the pins; the tower, its action and its limit diamond are README targets. A level is a
Mathlib `OpenSubgroup` that is compact, so the order is the one of `OpenSubgroup`. -/

/-- Compact open subgroups of a topological group, the index of the p-level tower: the
compact members of Mathlib's `OpenSubgroup G`. -/
def CompactOpenSubgroup (G : Type u) [Group G] [TopologicalSpace G] : Type u :=
  {K : OpenSubgroup G // IsCompact (K : Set G)}

namespace CompactOpenSubgroup

variable {G : Type u} [Group G] [TopologicalSpace G]

instance : PartialOrder (CompactOpenSubgroup G) :=
  inferInstanceAs (PartialOrder {K : OpenSubgroup G // IsCompact (K : Set G)})

/-- The level poset is cofiltered (milestone of Layer 2). -/
theorem isCofiltered [IsTopologicalGroup G] [T2Space G] [Nonempty (CompactOpenSubgroup G)] :
    CategoryTheory.IsCofiltered (CompactOpenSubgroup G) := by
  sorry

example [CompactSpace G] : Nonempty (CompactOpenSubgroup G) :=
  ⟨⟨⊤, by simpa using isCompact_univ⟩⟩

example (H K : CompactOpenSubgroup G) : H ≤ K ↔ (H.1 : Set G) ⊆ K.1 := Iff.rfl

end CompactOpenSubgroup

/-! ## Layer 3: Canonical subgroups with quantitative bounds

With v(p) = 1, the Hasse height of a point is w = min(v(Ha), 1). The weak and strong
canonical conditions at level n are S_n·w < 1/2 and p^n·w < 1/2, with
S_n = (p^n − 1)/(p − 1); the BHW position range is w < 1/(c_p p^{n−1}) with
c_p = 2 for p ≥ 5 and c_p = 3 for p = 3 (strict, as in Fargues's theorem), and
w ≤ 1/(4·2^{n−1}) for p = 2 (inclusive, the all-prime range). These are the ranges on
which the Layers 3 and 4 theorems are stated; they are kept distinct. -/

/-- The truncated Hasse valuation min(v(Ha), 1) (Layer 3). -/
def hasseValuation {O : Type u} [CommRing O] (v : AddValuation O (WithTop ℝ)) (Ha : O) : ℝ :=
  min ((v Ha).untopD 1) 1

example {O : Type u} [CommRing O] (v : AddValuation O (WithTop ℝ)) :
    hasseValuation v 0 = 1 := by simp [hasseValuation]

example {O : Type u} [CommRing O] (v : AddValuation O (WithTop ℝ)) :
    hasseValuation v 1 = 0 := by simp [hasseValuation]

/-- For p ≥ 2, S_n = 1 + p + ⋯ + p^{n−1} = (p^n − 1)/(p − 1). -/
def canonicalSum (p n : ℕ) : ℚ := ((p : ℚ) ^ n - 1) / ((p : ℚ) - 1)

/-- The weak formal condition S_n·w < 1/2 for a level-n canonical subgroup. -/
def WeakCanonicalRange (p n : ℕ) (w : ℚ) : Prop := canonicalSum p n * w < 1 / 2

/-- The strong sufficient condition p^n·w < 1/2. -/
def StrongCanonicalRange (p n : ℕ) (w : ℚ) : Prop := (p : ℚ) ^ n * w < 1 / 2

/-- The BHW constant c_p: 4 for p = 2, 3 for p = 3, 2 for p ≥ 5. -/
def bhwConstant (p : ℕ) : ℕ := if p = 2 then 4 else if p = 3 then 3 else 2

/-- The BHW geometric position range of Layer 4: w ≤ 1/(4·2^{n−1}) for p = 2, and the strict
range w < 1/(c_p p^{n−1}) for p ≥ 3. -/
def BHWPositionRange (p n : ℕ) (w : ℚ) : Prop :=
  if p = 2 then w ≤ 1 / ((bhwConstant p : ℚ) * (p : ℚ) ^ (n - 1))
  else w < 1 / ((bhwConstant p : ℚ) * (p : ℚ) ^ (n - 1))

example : bhwConstant 2 = 4 ∧ bhwConstant 3 = 3 := ⟨rfl, rfl⟩
example : bhwConstant 7 = 2 := rfl

example : canonicalSum 3 2 = 4 := by norm_num [canonicalSum]
example : canonicalSum 2 0 = 0 := by norm_num [canonicalSum]

example : WeakCanonicalRange 2 2 (1 / 8) := by
  norm_num [WeakCanonicalRange, canonicalSum]

example : ¬ StrongCanonicalRange 2 2 (1 / 8) := by
  norm_num [StrongCanonicalRange]

example : BHWPositionRange 2 1 (1 / 4) ∧ ¬ BHWPositionRange 2 1 (1 / 3) := by
  norm_num [BHWPositionRange, bhwConstant]

/-- For p ≥ 3 the endpoint is excluded: at p = 5, n = 1 the bound is 1/2. -/
example : BHWPositionRange 5 1 (1 / 3) ∧ ¬ BHWPositionRange 5 1 (1 / 2) := by
  norm_num [BHWPositionRange, bhwConstant]

/-- The strong condition implies the weak one for nonnegative heights, since S_n ≤ p^n. -/
theorem weakCanonicalRange_of_strong {p n : ℕ} (hp : 2 ≤ p) {w : ℚ} (hw : 0 ≤ w)
    (h : StrongCanonicalRange p n w) : WeakCanonicalRange p n w := by
  sorry

/-- The weak condition does not imply the strong one: at p = 2, n = 2 and w = 1/7 the weak
condition 3/7 < 1/2 holds and the strong condition 4/7 < 1/2 fails. -/
example : WeakCanonicalRange 2 2 (1 / 7) ∧ ¬ StrongCanonicalRange 2 2 (1 / 7) := by
  norm_num [WeakCanonicalRange, StrongCanonicalRange, canonicalSum]

/-! ## Layer 4: Canonical/anticanonical geometry and period estimates

The Hodge–Tate coordinate z of Layer 4 transforms by the left
fractional-linear action z ↦ (az + b)/(cz + d) on its invertible-denominator domain, and
j(γ, z) = cz + d is the factor of the AIP comparison. The algebraic identities are
statable over any field. -/

variable {K : Type u} [Field K]

/-- The factor j(γ, z) = c z + d. -/
def autFactor (γ : GL (Fin 2) K) (z : K) : K :=
  (γ : Matrix (Fin 2) (Fin 2) K) 1 0 * z + (γ : Matrix (Fin 2) (Fin 2) K) 1 1

/-- The fractional-linear action z ↦ (a z + b)/(c z + d). -/
def coordAction (γ : GL (Fin 2) K) (z : K) : K :=
  ((γ : Matrix (Fin 2) (Fin 2) K) 0 0 * z + (γ : Matrix (Fin 2) (Fin 2) K) 0 1) / autFactor γ z

/-- The cocycle relation j(γδ, z) = j(γ, δz)·j(δ, z), which makes c z + d a section of the AIP
structure group compatible with composition (Layer 5). -/
theorem autFactor_mul (γ δ : GL (Fin 2) K) (z : K) (hδ : autFactor δ z ≠ 0) :
    autFactor (γ * δ) z = autFactor γ (coordAction δ z) * autFactor δ z := by
  sorry

/-- On the invertible-denominator domain `coordAction` is Mathlib's action of `GL (Fin 2) K` on
the projective line `OnePoint K` (`OnePoint.smul_some_eq_ite`); the chart value ∞ is the
excluded point cz + d = 0. -/
theorem coordAction_eq_smul [DecidableEq K] (γ : GL (Fin 2) K) (z : K) (h : autFactor γ z ≠ 0) :
    γ • (z : OnePoint K) = ((coordAction γ z : K) : OnePoint K) := by
  rw [OnePoint.smul_some_eq_ite]
  split_ifs with h'
  · exact absurd h' h
  · rfl

/-- The action is a left action on the invertible-denominator domain. -/
theorem coordAction_mul (γ δ : GL (Fin 2) K) (z : K) (hδ : autFactor δ z ≠ 0)
    (hγδ : autFactor (γ * δ) z ≠ 0) :
    coordAction (γ * δ) z = coordAction γ (coordAction δ z) := by
  sorry

/-- Translation fixes the factor and adds 3 to the coordinate. -/
example :
    let γ : GL (Fin 2) ℚ := Matrix.GeneralLinearGroup.mkOfDetNeZero !![1, 3; 0, 1] (by norm_num)
    autFactor γ 2 = 1 ∧ coordAction γ 2 = 5 := by
  norm_num [autFactor, coordAction, Matrix.GeneralLinearGroup.mkOfDetNeZero,
    Matrix.GeneralLinearGroup.mk', Matrix.unitOfDetInvertible]

/-- The Weyl matrix gives −1/z and factor z; its denominator vanishes at zero. -/
example :
    let γ : GL (Fin 2) ℚ := Matrix.GeneralLinearGroup.mkOfDetNeZero !![0, -1; 1, 0] (by norm_num)
    autFactor γ 2 = 2 ∧ coordAction γ 2 = -(1 / 2) ∧ autFactor γ 0 = 0 := by
  norm_num [autFactor, coordAction, Matrix.GeneralLinearGroup.mkOfDetNeZero,
    Matrix.GeneralLinearGroup.mk', Matrix.unitOfDetInvertible]

/-! ## Layer 5: Igusa trivializations and the modified integral lattice

On the Hasse neighbourhood of radius ε the AIP structure group B_m is contained in
𝒪_p^×(1 + p^x Res 𝔾̂_a), where x = m − ε p^m/(p − 1). This is the corrected direction
of BHW (7.1), recorded in 5.8. Membership of cz + d in B_m follows
from the ratio of two lifts in the actual torsor (5.11). -/

/-- x = m − ε p^m/(p − 1). -/
def aipExponent (p m : ℕ) (ε : ℚ) : ℚ := m - ε * (p : ℚ) ^ m / ((p : ℚ) - 1)

example : aipExponent 3 1 0 = 1 := by norm_num [aipExponent]
example : aipExponent 3 1 (1 / 9) = 5 / 6 := by norm_num [aipExponent]

end HodgeTate

/-! The definitions and constructions of the README that need group schemes, sheaves of
modules, adic spaces, sites, diamonds or geometric torsors are README targets and are not
declared here:

Layer 0: `TauCeti.HodgeTate.conormal`, `TauCeti.HodgeTate.hodgeTateMap`,
`TauCeti.HodgeTate.pDivisibleHodgeTateMap`, `TauCeti.HodgeTate.farguesDegree`,
`TauCeti.HodgeTate.farguesDivisor`, `TauCeti.HodgeTate.isogenyDivisor`,
`TauCeti.HodgeTate.semiAbelianTorsion`, `TauCeti.HodgeTate.semiAbelianHasse`,
`TauCeti.HodgeTate.harderNarasimhanFiltration`, `TauCeti.HodgeTate.torsionDegree`,
`TauCeti.HodgeTate.coLieComplex`, `TauCeti.HodgeTate.abelianVerschiebung`.
Layer 2: `ShimuraTower.pLevel`, `ShimuraTower.translate`, `ShimuraTower.infiniteLevel`,
`TauCeti.HodgeTate.hodgeTateFlagPoint`, `TauCeti.HodgeTate.hodgeTateParabolicReduction`,
`TauCeti.HodgeTate.ExactTensorFiltration`, `TauCeti.HodgeTate.openTowerHodgeTateMap`.
Layer 3: `TauCeti.HodgeTate.hasseNeighbourhood`, `TauCeti.HodgeTate.canonicalSubgroup`.
Layer 4: `TauCeti.HodgeTate.canonicalLocus`, `TauCeti.HodgeTate.hodgeTateCoordinate`,
`TauCeti.HodgeTate.flagBall`.
Layer 5: `TauCeti.HodgeTate.igusaTorsor`, `TauCeti.HodgeTate.integralDifferentialLattice`,
`TauCeti.HodgeTate.modifiedHodgeBundle`, `TauCeti.HodgeTate.modifiedMinimalModel`,
`TauCeti.HodgeTate.modifiedPlusSheaf`, `TauCeti.HodgeTate.aipTorsor`.
Layer 6 (log adic spaces and their Kummer étale sites):
`TauCeti.LogAdic.LogStructure`, `TauCeti.LogAdic.logification`,
`TauCeti.LogAdic.logPullback`, `TauCeti.LogAdic.IntegralChart`,
`TauCeti.LogAdic.IsKummer`, `TauCeti.LogAdic.IsKummerEtale`,
`TauCeti.LogAdic.KummerEtaleSite`, `TauCeti.LogAdic.KummerLocalSystem`,
`TauCeti.LogAdic.MonoidAlgebraLog`, `TauCeti.LogAdic.DivisorialLog`,
`TauCeti.LogAdic.FsAdicPullback`, `TauCeti.LogAdic.ContinuousLogDerivation`,
`TauCeti.LogAdic.ContinuousLogDifferentials`, `TauCeti.LogAdic.AnalyticLogDR`,
`TauCeti.LogAdic.RootCover`, `TauCeti.LogAdic.RamificationIndex`,
`TauCeti.LogAdic.ProKummerPresentation`, `TauCeti.LogAdic.CorrectedProKummerCover`,
`TauCeti.LogAdic.ProKummerEtaleSite`, `TauCeti.LogAdic.AllRootTower`,
`TauCeti.LogAdic.LogAffinoidPerfectoid`, `TauCeti.LogAdic.CompletedLogStructure`,
`TauCeti.LogAdic.KummerLisse`, `TauCeti.LogAdic.CompletedKummerLisse`,
`TauCeti.LogAdic.BoundaryMonodromy`.
Layer 7: `TauCeti.LogAdic.LogConstantPeriods`, `TauCeti.LogAdic.StructuralLogPeriodPlus`,
`TauCeti.LogAdic.StructuralLogPeriod`, `TauCeti.LogAdic.StructuralLogConnection`,
`TauCeti.LogAdic.BdRCoefficientSheaf`, `TauCeti.LogAdic.FilteredLogConnection`,
`TauCeti.LogAdic.LogRH`, `TauCeti.LogAdic.LogHiggs`, `TauCeti.LogAdic.ArithmeticLogDR`,
`TauCeti.LogAdic.CanonicalLogRealizations`, `TauCeti.LogAdic.TwoDeRhamLattices`,
`TauCeti.LogAdic.LatticeHTFiltration`, `TauCeti.LogAdic.HodgeTateReduction`,
`TauCeti.LogAdic.FiniteLeviComparison`. -/

end

end TauCetiRoadmap.HodgeTateAndCanonicalSubgroups

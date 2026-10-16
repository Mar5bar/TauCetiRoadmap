import Mathlib

/-!
# EndoscopicTransferAndUnitaryTraceComparison: representative target signatures

The roadmap is README.md. This file records light definitions and representative theorem
signatures statable against the pinned Mathlib APIs; it is not exhaustive. Reductive groups,
transfer, Hitchin stacks, automorphic representations, Igusa varieties and local towers are
README targets. The finite sums and matrices below fix numerical conventions, without
constructing those objects. The special block uses geometric Frobenius of absolute value q⁻¹,
subdiagonal monodromy, and left actions. Endoscopic coefficients retain both denominators.
-/

namespace TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

open scoped BigOperators

/-! ## Layer 1: stable conjugacy and arithmetic invariants -/

/-- The nonarchimedean parity sign from quasi-split and inner derived ranks. Real groups
use symmetric-space half-dimensions instead. The integer exponent retains
its meaning even before imposing the rank inequality of an actual inner form. -/
def kottwitzSign (rankQuasiSplit rankInner : ℕ) : ℤˣ :=
  (-1 : ℤˣ) ^ ((rankQuasiSplit : ℤ) - rankInner)

/-- For GL_r(D), with n=r·deg(D), the rank difference is n-r. -/
theorem kottwitzSign_gl (n r : ℕ) (hr : 1 ≤ r) (hrn : r ≤ n) :
    kottwitzSign (n - 1) (r - 1) = (-1 : ℤˣ) ^ ((n : ℤ) - r) := by
  sorry

/-- The quaternion inner form of GL₂ has sign -1. -/
example : kottwitzSign 1 0 = -1 := by
  norm_num [kottwitzSign]

/-- A quasi-split form has sign +1, including the rank-zero numerical case. -/
example (r : ℕ) : kottwitzSign r r = 1 := by
  simp [kottwitzSign]

section GLn
variable {ι : Type*} [Fintype ι] [DecidableEq ι] {K : Type*} [Field K]

/-- In GL_n a separable characteristic polynomial determines a rational conjugacy class.
The separability assumption excludes nonsemisimple Jordan blocks. -/
theorem isConj_iff_charpoly_eq_of_separable (γ γ' : Matrix.GeneralLinearGroup ι K)
    (hsep : (γ : Matrix ι ι K).charpoly.Separable) :
    IsConj γ γ' ↔ (γ : Matrix ι ι K).charpoly = (γ' : Matrix ι ι K).charpoly := by
  sorry

/-- Equal characteristic polynomials do not suffice without semisimplicity. -/
example : ¬ IsConj (1 : Matrix.GeneralLinearGroup (Fin 2) ℚ)
    (Matrix.GeneralLinearGroup.mkOfDetNeZero !![1, 1; 0, 1]
      (by simp [Matrix.det_fin_two_of])) := by
  sorry
end GLn

/-! ## Layer 2: orbital integrals and transfer factors -/

section KappaSum
variable {D : Type*} [CommGroup D] [Fintype D]

/-- The character-weighted sum over a finite group of stable-class invariants. -/
def kappaSum (κ : D →* ℂˣ) (O : D → ℂ) : ℂ := ∑ d, (κ d : ℂ) * O d

/-- Rebasing by d₀ gives the inverse character multiplier. -/
theorem kappaSum_rebase (κ : D →* ℂˣ) (O : D → ℂ) (d₀ : D) :
    kappaSum κ (fun d => O (d₀ * d)) = ((κ d₀)⁻¹ : ℂ) * kappaSum κ O := by
  sorry

/-- A two-class stable sum with nontrivial character is a difference. -/
example (κ : Multiplicative (ZMod 2) →* ℂˣ)
    (hκ : κ (Multiplicative.ofAdd 1) = -1) (O : Multiplicative (ZMod 2) → ℂ) :
    kappaSum κ O = O 1 - O (Multiplicative.ofAdd 1) := by
  sorry

/-- An order-three class distinguishes the positive character weight from its inverse. -/
example (κ : Multiplicative (ZMod 3) →* ℂˣ) :
    kappaSum κ (fun d => if d = Multiplicative.ofAdd 1 then 1 else 0) =
      (κ (Multiplicative.ofAdd 1) : ℂ) := by
  classical
  simp [kappaSum]
  rfl

/-- With one class and trivial character the sum is evaluation. -/
example (O : Unit → ℂ) : kappaSum (1 : Unit →* ℂˣ) O = O () := by
  simp [kappaSum]
end KappaSum

/-! ## Layer 3: Hitchin geometry and support -/

section ChevalleyGL
variable {K : Type*} [Field K] {n : ℕ}

/-- Non-leading characteristic coefficients, ordered from the constant coefficient upward. -/
noncomputable def chevalleyMap (X : Matrix (Fin n) (Fin n) K) : Fin n → K :=
  fun i => X.charpoly.coeff i

/-- The companion matrix: ones on the subdiagonal and minus the coefficients in the last column.
This is a matrix formula, rather than a construction of the general Kostant section. -/
def kostantSectionGL (a : Fin n → K) : Matrix (Fin n) (Fin n) K := fun i j =>
  (if (i : ℕ) = (j : ℕ) + 1 then 1 else 0) - (if (j : ℕ) + 1 = n then a i else 0)

/-- The companion characteristic polynomial has the specified lower coefficients. -/
theorem charpoly_kostantSectionGL (a : Fin n → K) :
    (kostantSectionGL a).charpoly =
      Polynomial.X ^ n + ∑ i : Fin n, Polynomial.C (a i) * Polynomial.X ^ (i : ℕ) := by
  sorry

/-- The companion formula is a section of the GL_n characteristic map. -/
theorem chevalleyMap_kostantSectionGL (a : Fin n → K) :
    chevalleyMap (kostantSectionGL a) = a := by
  sorry

/-- Characteristic coefficients are unchanged by conjugation. -/
theorem chevalleyMap_conj (X : Matrix (Fin n) (Fin n) K)
    (g : Matrix.GeneralLinearGroup (Fin n) K) :
    chevalleyMap ((g : Matrix (Fin n) (Fin n) K) * X *
      ((g⁻¹ : Matrix.GeneralLinearGroup (Fin n) K) : Matrix (Fin n) (Fin n) K)) =
      chevalleyMap X := by
  sorry

/-- The lower characteristic coefficient of a one-by-one matrix is minus its entry. -/
example (c : K) : chevalleyMap (fun _ _ : Fin 1 => c) 0 = -c := by
  sorry

/-- The zero-dimensional characteristic map has an empty coefficient vector. -/
example (X : Matrix (Fin 0) (Fin 0) K) : chevalleyMap X = Fin.elim0 := by
  funext i
  exact Fin.elim0 i

/-- In rank one the companion entry is minus the prescribed constant coefficient. -/
example (a : Fin 1 → K) : kostantSectionGL a = fun _ _ => -a 0 := by
  sorry

/-- For X² the companion is nonzero nilpotent, fixing the subdiagonal orientation. -/
example : kostantSectionGL (0 : Fin 2 → K) = !![0, 0; 1, 0] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [kostantSectionGL]
end ChevalleyGL

/-! ## Layer 4: the fundamental lemma and smooth transfer
The reductive and harmonic carriers required for these statements are described in README.md. -/

/-! ## Layer 5: number-field discrete general linear spectrum
The residual Speh classification uses the supplied automorphic representation category. -/

/-! ## Layer 6: stable and twisted unitary trace comparison -/

/-- The numerical component count for d=[F⁺:ℚ] and the block sizes.
Its group interpretation requires d>0 and a nonempty list of positive sizes. -/
def unitaryComponentCount (d : ℕ) (blocks : List ℕ) : ℕ :=
  if Even d ∨ ∀ i ∈ blocks, Even i then 2 ^ blocks.length else 2 ^ (blocks.length - 1)

/-- Even degree, one block: two components. -/
example : unitaryComponentCount 2 [1] = 2 := by
  norm_num [unitaryComponentCount, even_iff_two_dvd]

/-- Odd degree and an odd block: one exponent is removed. -/
example : unitaryComponentCount 3 [3, 2] = 2 := by
  norm_num [unitaryComponentCount, even_iff_two_dvd]

/-- The endoscopic coefficient from Tamagawa numbers and the outer automorphism order.
In its group application τH and outH are nonzero. -/
def endoscopicCoefficient (τG τH : ℚ) (outH : ℕ) : ℚ := τG / τH / outH

/-- The trivial datum has coefficient one when its Tamagawa number is nonzero. -/
example (τ : ℚ) (hτ : τ ≠ 0) : endoscopicCoefficient τ τ 1 = 1 := by
  simp [endoscopicCoefficient, hτ]

/-- The balanced proper datum retains its outer automorphism denominator. -/
example : endoscopicCoefficient 2 2 2 = 1 / 2 := by
  norm_num [endoscopicCoefficient]

/-! ## Layer 7: algebraic isocrystals and rational Igusa geometry
The structured isocrystal and moduli targets are stated in README.md. -/

/-! ## Layer 8: Igusa counting and stabilization -/

/-- Across decreasing slope blocks, every eigenvalue valuation in an earlier block is smaller
than every valuation in a later block. This checks only the numerical acceptability inequality. -/
def AcceptableValuations {r : ℕ} (vals : Fin r → Finset ℚ) : Prop :=
  ∀ i j : Fin r, i < j → ∀ x ∈ vals i, ∀ y ∈ vals j, x < y

/-- Valuations (0,1) satisfy the decreasing-slope convention. -/
example : AcceptableValuations (r := 2) ![{0}, {1}] := by
  sorry

/-- Equal cross-block valuations fail strict acceptability. -/
example : ¬ AcceptableValuations (r := 2) ![{0}, {0}] := by
  sorry

/-- At residue cardinality four, the relative Weyl factor and half-modulus orbital factor
agree with the normalized opposite Jacquet character of the trivial representation. -/
example : (4 : ℚ) * (1 / 2) = 2 ∧ (4 : ℚ) * (1 / 4) ≠ 2 := by
  norm_num

/-! ## Layer 9: raw compact-unitary cohomology
The geometric complex, its graded pieces and its commuting actions are README targets. -/

/-! ## Layer 10: trace parameters and classical comparison -/

/-- Subdiagonal monodromy of the raw special block: N e_j=e_(j+1). -/
def specialMonodromy (k : ℕ) : Matrix (Fin k) (Fin k) ℚ :=
  fun i j => if (i : ℕ) = (j : ℕ) + 1 then 1 else 0

/-- Geometric Frobenius of the raw special block: e_i has eigenvalue q⁻ⁱ.
The actual Frobenius application requires q>0. -/
def specialFrobenius (q : ℚ) (k : ℕ) : Matrix (Fin k) (Fin k) ℚ :=
  Matrix.diagonal fun i => q⁻¹ ^ (i : ℕ)

/-- The required Weil–Deligne covariance, with geometric absolute value q⁻¹. -/
theorem specialFrobenius_mul_monodromy (q : ℚ) (k : ℕ) :
    specialFrobenius q k * specialMonodromy k =
      q⁻¹ • (specialMonodromy k * specialFrobenius q k) := by
  sorry

/-- The raw special monodromy is nilpotent with exponent equal to the block length. -/
theorem specialMonodromy_pow_length (k : ℕ) : specialMonodromy k ^ k = 0 := by
  sorry

/-- A nonempty block has precisely that nilpotence index. -/
theorem specialMonodromy_pow_ne_zero {k : ℕ} (hk : 0 < k) :
    specialMonodromy k ^ (k - 1) ≠ 0 := by
  sorry

/-- The two-dimensional monodromy fixes its orientation. -/
example : specialMonodromy 2 = !![0, 0; 1, 0] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [specialMonodromy]

/-- A one-dimensional block has no monodromy. -/
example : specialMonodromy 1 = 0 := by
  ext i j
  fin_cases i; fin_cases j; simp [specialMonodromy]

/-- The raw two-dimensional Frobenius is diag(1,q⁻¹). -/
example (q : ℚ) : specialFrobenius q 2 = !![1, 0; 0, q⁻¹] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [specialFrobenius, Matrix.diagonal]

/-- q=1 gives the identity matrix; this numerical specialization is not a residue field. -/
example : specialFrobenius 1 2 = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [specialFrobenius, Matrix.diagonal]

/-! ## Layer 11: local unitary packets and global classification
The bounded and extended packets use the representation and parameter suppliers. -/

/-! ## Layer 12: local towers and their cohomology
The marked relative chart and the actual cohomological realizations are README targets. -/

/-! ## Layer 13: pure automorphic transfer and level comparison
These statements require the automorphic carriers of the supplier contracts. -/

/-! ## Layer 14: rational Igusa spectral comparison
Virtual spectral factorization is separate from degree-wise concentration. -/

/-! ## Layer 15: normalization calculations and coherent outputs -/

/-- A finite sum of signed multiplicities and the four remaining trace factors. -/
def comparisonTrace {ι : Type*} (s : Finset ι)
    (multiplicity coefficient localTrace auxiliaryTrace sphericalTrace : ι → ℚ) : ℚ :=
  ∑ i ∈ s, multiplicity i * coefficient i * localTrace i * auxiliaryTrace i * sphericalTrace i

/-- The finite convention agrees with the trace of the diagonal matrix of summands. -/
theorem comparisonTrace_eq_trace_diagonal {ι : Type*} [Fintype ι] [DecidableEq ι]
    (multiplicity coefficient localTrace auxiliaryTrace sphericalTrace : ι → ℚ) :
    comparisonTrace Finset.univ multiplicity coefficient localTrace auxiliaryTrace sphericalTrace =
      Matrix.trace (Matrix.diagonal fun i =>
        multiplicity i * coefficient i * localTrace i * auxiliaryTrace i * sphericalTrace i) := by
  sorry

/-- Balanced proper endoscopy contributes one half. -/
example : comparisonTrace ({()} : Finset Unit) (fun _ => 1) (fun _ => 1 / 2)
    (fun _ => 1) (fun _ => 1) (fun _ => 1) = 1 / 2 := by
  norm_num [comparisonTrace]

/-- Opposite virtual multiplicities cancel even though both graded pieces may be nonzero. -/
example : comparisonTrace ({false, true} : Finset Bool)
    (fun i => if i then 1 else -1) (fun _ => 1) (fun _ => 1) (fun _ => 1) (fun _ => 1) = 0 := by
  norm_num [comparisonTrace]

/-
Further objects and constructions are specified in README.md:
The full inner-form sign API of §1.13 includes kottwitzSign_quasiSplit,
kottwitzSign_quaternion, kottwitzSign_compact_real, kottwitzSign_product and
kottwitzSign_not_rank_parity. Section 6.7 specifies endoscopicCoefficient_iso,
endoscopicCoefficient_self, endoscopicCoefficient_equal_blocks and
endoscopicCoefficient_self_test. Section 15.1 specifies comparisonTrace_addMultiplicity,
comparisonTrace_merge and comparisonTrace_zeroLocal. The classical-llc-normalization
contract is supplied by SmoothRepresentationsOfLocalGroups §SR.5.2.

pureSchemeDecomposition, relativePerverseLefschetz, CohomologicalCorrespondence,
frobeniusTwistedTrace, NonabelianH1, CrossedModuleCohomology, AbelianizedCohomology, InnerTwist,
IntegralZExtension, IsStronglyRegular, stableCentralizer, StablyConj, EndoscopicDatum and its ZPair/classMap,
kappaOrbitalIntegral, stableOrbitalIntegral, globalStableObstruction, UnitaryLieCentralizer,
AData, ChiData, TransferFactor, TwistedTransferFactor, LieTransferFactor, IsTransfer,
eulerPoincareFunction, CurveBundles, LocalLoopGrassmannian,
ChevalleyQuotient, kostantSection, RegularCentralizer, HitchinStack, HitchinBase,
cameralCover, spectralCurve, HitchinPicard, AffineSpringerFibre, WeakAbelianFibration,
Speh, StableEllipticDistribution, BaseChangeGroup, BCLMorphism, zetaLMorphism,
twistedLefschetzFunction, endoscopicInfinityFunction, IsCuspidalGroup, IsCuspidalSubset,
CMQuadraticCharacterExtension, TwistedInvariantDistributions, IgusaPELModel,
GIsocrystal, NewtonMap, KottwitzMap, AdmissibleClass, Jb, DecentRepresentative,
NewtonLevi, CentralLeaf, SlopeFiltration, FiniteIgusa, IgusaMonoid, IgusaCohomology,
IgusaRational, AcceptableElement, AcceptableFunction, IgusaCorrespondence, PIC,
NearEquivalence, FPAV, PadicType, CMIsogenyLift, IgusaTriple, EffectiveLevi, IgusaPFunction,
IgusaGlobalFunction, CompactUnitaryRaw, ClassicalNormalization,
DrinfeldDeformationInstance, NearbyTraceFunction, DieudonneNorm, LanglandsJacquet,
ClassicalWeilParameter, PotentiallyAbelianPair, SegmentWDAdapter, RawSpecialBlock2,
ClassicalWDParameter, InnerFormWDParameter, ExtendedUnitaryPacket, TowerDatum,
TowerUntiltChart, LubinTate, Drinfeld, TowerPeriod, TowerInfinity,
TowerCohomology, TowerSector, BasicTowerFibre, UnitaryWeakBC, TransferableLevel,
IgusaTests, NewtonRed, HiggsSections, RegularCentralizerPicard,
SemisimpleCentralizer, TowerLocallyAnalytic, StandardPair, AdmissibleTrace,
AuxiliaryDivisionPEL, FiniteLengthClass, GLIntertwiner, GlobalWeil, InnerGL,
Invariants, IsAssociated, IsStableDistribution, NearbyCycles, Newvector, PairFactors,
ParabolicInduction, QuasiEL, SpehType, StrictDieudonne and StrictNearbyCycles. Their geometry and representation categories are needed
before their signatures can be stated in Lean.
-/

end TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

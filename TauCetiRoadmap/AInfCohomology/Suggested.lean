import Mathlib

/-!
# AInfCohomology: representative target signatures

These signatures are suggested forms, not an exhaustive checklist. `README.md` is the definitive
specification. This file records definitions with real bodies against the pinned Mathlib and
Tau Ceti, and the layer milestones whose carriers exist at the pins, proved by `sorry`. The heavy objects of the roadmap
(the décalage functor on derived categories of ringed topoi, Breuil–Kisin–Fargues modules, the
pro-étale period sheaves, `AΩ`, semistable charts and their log structures, the canonical
`B_dR⁺`-deformation, relative topological Hochschild homology and Breuil–Kisin cohomology) are
README targets; the closing comment lists their names.

Design choices made explicit here:
- `A_inf` is Mathlib's `WittVector p (PreTilt O p)` and `θ` is `WittVector.fontaineTheta`; the
  Frobenius `φ` is `WittVector.frobeniusEquiv`, an automorphism because the tilt is perfect.
- The cyclotomic elements `μ`, `ξ`, `ξ̃`, `ξ_r`, `ξ̃_r` are defined by polynomial formulas in the
  Witt vectors of any perfect ring of characteristic `p`; no division is used, and the
  factorization `μ = ξ · φ⁻¹(μ)` is a theorem. The generic finite-Witt kernels, regularity
  and Tor independence are imported from CrystallineCohomology CR.4.4; these polynomial
  formulas fix their cyclotomic generators.
- `θ̃ = θ ∘ φ⁻¹` is defined for any ring map and any automorphism, so that its kernel statement
  transports an existing principal kernel and assumes nothing else.
- The divisibility submodule of décalage lives inside a term of Mathlib's
  `CochainComplex (ModuleCat R) ℤ`; all integer degrees are allowed. The principal-`p`
  specialization uses the normalized module core owned by CrystallineCohomology CR.4;
  AI.1 extends it to general regular scalars and ringed topoi.
- The Breuil–Kisin Frobenius on `𝔖 = W(k)[[u]]` is coefficientwise `F` followed by Mathlib's
  substitution `u ↦ u^p`; the crystalline coefficient map is `F ∘ constantCoeff`. These generic
  formulas model the coefficient objects supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory
  R07.4.1 and R07.4.16; the arithmetic maps are transported aliases of that interface.
- Arithmetic period-ring inputs come from PadicPeriodRings. AI.7 defines Breuil–Kisin cohomology
  by Bott-inverted relative trace descent; its comparison with prismatic cohomology is a
  downstream target, not an input to these coefficient formulas.
-/

noncomputable section

namespace TauCetiRoadmap.AInfCohomology

open scoped BigOperators

/-! ## Milestones on existing coefficient and module carriers -/

/-- The valuation ring `O_C` of `C`. -/
abbrev integers (C : Type*) [NontriviallyNormedField C] [IsUltrametricDist C] : Subring C :=
  (NormedField.valuation (K := C)).integer

section CoefficientMilestones

variable (p : ℕ) [Fact p.Prime]
variable (C : Type*) [NontriviallyNormedField C] [IsUltrametricDist C] [hcomplete : CompleteSpace C]
  [halgclosed : IsAlgClosed C] [hcharzero : CharZero C]
variable [hpnonunit : Fact (¬IsUnit (p : integers C))]
  [hadic : IsAdicComplete (Ideal.span {(p : integers C)}) (integers C)]

include hcomplete halgclosed hcharzero hpnonunit hadic

/-- Finite-Witt coherence (AI.0.3, `AInf.witt_coherence`): relation modules of maps between
finite free modules are finitely generated, over both `W_r(O_C)` and `W_r(O_C^♭)`
(BMS1, Proposition 3.24). -/
theorem finite_witt_coherence (r : ℕ) (hr : 1 ≤ r) :
    (∀ (m n : ℕ) (f : (Fin m → TruncatedWittVector p r (integers C)) →ₗ[
        TruncatedWittVector p r (integers C)] (Fin n → TruncatedWittVector p r (integers C))),
      (LinearMap.ker f).FG) ∧
    (∀ (m n : ℕ) (f : (Fin m → TruncatedWittVector p r (PreTilt (integers C) p)) →ₗ[
        TruncatedWittVector p r (PreTilt (integers C) p)]
        (Fin n → TruncatedWittVector p r (PreTilt (integers C) p))),
      (LinearMap.ker f).FG) := by sorry

/-- The p-local freeness conclusion of AI.2.1, `AInf.punctured_vector_bundle_criterion`:
every finite projective `A_inf[1/p]`-module is free (BMS1, Corollary 4.12). -/
theorem ainf_invert_p_projective_free (M : Type*) [AddCommGroup M]
    [Module (Localization.Away (p : WittVector p (PreTilt (integers C) p))) M]
    [Module.Finite (Localization.Away (p : WittVector p (PreTilt (integers C) p))) M]
    [Module.Projective (Localization.Away (p : WittVector p (PreTilt (integers C) p))) M] :
    Module.Free (Localization.Away (p : WittVector p (PreTilt (integers C) p))) M := by sorry

end CoefficientMilestones

/-! ## Layer AI.0: Cyclotomic periods and finite Witt coefficients -/

section Cyclotomic

variable (p : ℕ) [Fact p.Prime]
variable {S : Type*} [CommRing S] [CharP S p] [PerfectRing S p]

/-- The element `μ = [ε] − 1` of `W(S)`. For `S = O_C^♭` and a compatible system `ε` of primitive
`p`-power roots of unity this is the cyclotomic period of BMS1, Example 3.16 (Layer AI.0). -/
def mu (ε : S) : WittVector p S :=
  WittVector.teichmuller p ε - 1

/-- The element `ξ = Σ_{j<p} [ε^{1/p}]^j`; it is defined without division in the Witt ring. -/
def xi (ε : S) : WittVector p S :=
  ∑ j ∈ Finset.range p, (WittVector.teichmuller p ((_root_.frobeniusEquiv S p).symm ε)) ^ j

/-- The Frobenius-shifted element `ξ̃ = φ(ξ)`. For `S=O_C^♭` and the fixed compatible
primitive cyclotomic system, it generates the kernel of `θ̃ = θ ∘ φ⁻¹`. -/
def tildeXi (ε : S) : WittVector p S :=
  WittVector.frobenius (xi p ε)

/-- The product `ξ_r = ∏_{j<r} φ^{−j}(ξ)`. For `S=O_C^♭` and the fixed compatible
primitive cyclotomic system, it generates `ker θ_r`. -/
def xiLevel (ε : S) (r : ℕ) : WittVector p S :=
  ∏ j ∈ Finset.range r, ((WittVector.frobeniusEquiv p S).symm^[j]) (xi p ε)

/-- The shifted product `ξ̃_r = ∏_{1 ≤ j ≤ r} φ^{j}(ξ)`. For `S=O_C^♭` and the fixed
compatible primitive cyclotomic system, it generates `ker θ̃_r`. -/
def tildeXiLevel (ε : S) (r : ℕ) : WittVector p S :=
  ∏ j ∈ Finset.range r, ((WittVector.frobeniusEquiv p S)^[j + 1]) (xi p ε)

/-- The cyclotomic factorization `μ = ξ · φ⁻¹(μ)`, valid in `W(S)` for every perfect `S`. -/
theorem mu_factorization (ε : S) :
    mu p ε = xi p ε * (WittVector.frobeniusEquiv p S).symm (mu p ε) := by sorry

/-- The Frobenius of `μ` is `ξ̃ · μ`. -/
theorem frobenius_mu (ε : S) :
    WittVector.frobenius (mu p ε) = tildeXi p ε * mu p ε := by sorry

/-- The recursion `ξ_{r+1} = ξ_r · φ^{−r}(ξ)`. -/
theorem xiLevel_succ (ε : S) (r : ℕ) :
    xiLevel p ε (r + 1) =
      xiLevel p ε r * ((WittVector.frobeniusEquiv p S).symm^[r]) (xi p ε) := by sorry

/-- The recursion `ξ̃_{r+1} = ξ̃_r · φ^{r+1}(ξ)`. -/
theorem tildeXiLevel_succ (ε : S) (r : ℕ) :
    tildeXiLevel p ε (r + 1) =
      tildeXiLevel p ε r * ((WittVector.frobeniusEquiv p S)^[r + 1]) (xi p ε) := by sorry

/-- Residue specialization of the periods (Layer AI.0:integral): a ring map `ρ : S → k` to a
perfect ring of characteristic `p` with `ρ ε = 1` sends `μ` to `0` and `ξ` to `p`. -/
theorem map_mu_xi_of_eq_one {k : Type*} [CommRing k] [CharP k p] [PerfectRing k p]
    (ρ : S →+* k) (ε : S) (hρ : ρ ε = 1) :
    WittVector.map ρ (mu p ε) = 0 ∧ WittVector.map ρ (xi p ε) = p := by sorry

end Cyclotomic

section ShiftedTheta

variable {A O : Type*} [CommRing A] [CommRing O]

/-- `θ̃ = θ ∘ φ⁻¹` for a ring map `θ` and a ring automorphism `φ` (BMS1, §3, after Lemma 3.2). -/
def shiftedTheta (θ : A →+* O) (φ : A ≃+* A) : A →+* O :=
  θ.comp φ.symm.toRingHom

/-- Surjectivity of the Fontaine map is preserved by the Frobenius shift (AI.0.1). -/
theorem shiftedTheta_surjective (θ : A →+* O) (φ : A ≃+* A) (h : Function.Surjective θ) :
    Function.Surjective (shiftedTheta θ φ) := by sorry

/-- The kernel of `θ̃` is the transport of the kernel of `θ`: if `ker θ = (x)` then
`ker θ̃ = (φ x)`. Principality is a hypothesis, not a conclusion. -/
theorem shiftedTheta_ker (θ : A →+* O) (φ : A ≃+* A) (x : A)
    (hx : RingHom.ker θ = Ideal.span {x}) :
    RingHom.ker (shiftedTheta θ φ) = Ideal.span {φ x} := by sorry

end ShiftedTheta

section Fontaine

variable (p : ℕ) [Fact p.Prime]
variable (O : Type*) [CommRing O] [Fact (¬IsUnit (p : O))]
variable [IsAdicComplete (Ideal.span {(p : O)}) O]

/-- `θ̃` on Mathlib's `A_inf(O) = W(O^♭)`, built from the pinned Fontaine map. -/
def thetaTilde : WittVector p (PreTilt O p) →+* O :=
  shiftedTheta (WittVector.fontaineTheta O p) (WittVector.frobeniusEquiv p (PreTilt O p))

/-- `θ̃([a]) = (a^{1/p})^♯`. -/
theorem thetaTilde_teichmuller (a : PreTilt O p) :
    thetaTilde p O (WittVector.teichmuller p a) =
      PreTilt.untilt ((_root_.frobeniusEquiv (PreTilt O p) p).symm a) := by sorry

/-- `θ̃([a]^p) = a^♯`. -/
theorem thetaTilde_teichmuller_pow (a : PreTilt O p) :
    thetaTilde p O (WittVector.teichmuller p a ^ p) = PreTilt.untilt a := by sorry

end Fontaine

section CyclotomicKernel

variable (p : ℕ) [Fact p.Prime]
variable {C : Type*} [NontriviallyNormedField C] [IsUltrametricDist C] [hcomplete : CompleteSpace C]
  [halgclosed : IsAlgClosed C] [hcharzero : CharZero C]
variable [hpnonunit : Fact (¬IsUnit (p : integers C))]
  [hadic : IsAdicComplete (Ideal.span {(p : integers C)}) (integers C)]

include hcomplete halgclosed hcharzero hpnonunit hadic

/-- Milestone of Layer AI.0: for a compatible system `ε` whose first root `(ε^{1/p})^♯` is a
primitive `p`-th root of unity, `ker θ = (ξ)` and `ker θ̃ = (ξ̃)` in `A_inf = W(O_C^♭)`
(BMS1, Example 3.16 and Proposition 3.17). -/
theorem ker_fontaineTheta_eq_span_xi (ε : PreTilt (integers C) p)
    (hε : IsPrimitiveRoot
      (PreTilt.untilt ((_root_.frobeniusEquiv (PreTilt (integers C) p) p).symm ε)) p) :
    RingHom.ker (WittVector.fontaineTheta (integers C) p) = Ideal.span {xi p ε} ∧
      RingHom.ker (thetaTilde p (integers C)) = Ideal.span {tildeXi p ε} := by sorry

/-- Milestone of Layer AI.0: `p, μ` is a regular sequence on `A_inf` (BMS1, Proposition 3.17). -/
theorem isRegular_p_mu (ε : PreTilt (integers C) p)
    (hε : IsPrimitiveRoot
      (PreTilt.untilt ((_root_.frobeniusEquiv (PreTilt (integers C) p) p).symm ε)) p) :
    RingTheory.Sequence.IsRegular (WittVector p (PreTilt (integers C) p))
      [(p : WittVector p (PreTilt (integers C) p)), mu p ε] := by sorry

/-- The cyclotomic normalizations in AI.0.1, `AInf.cyclotomic_test_theta`:
`θ(μ) = 0`, `θ(ξ̃) = p`, and `θ̃(ξ̃) = 0` (BMS1, Example 3.16). -/
theorem cyclotomic_period_evaluations (ε : PreTilt (integers C) p)
    (hε : IsPrimitiveRoot
      (PreTilt.untilt ((_root_.frobeniusEquiv (PreTilt (integers C) p) p).symm ε)) p) :
    WittVector.fontaineTheta (integers C) p (mu p ε) = 0 ∧
      WittVector.fontaineTheta (integers C) p (tildeXi p ε) = p ∧
      thetaTilde p (integers C) (tildeXi p ε) = 0 := by sorry

/-- The mixed-characteristic freeness criterion in AI.2.1, `AInf.ainf_module_structure`:
a finitely presented module with projective p-inversion is free when its `θ` reduction
is p-torsion-free. Reduction is expressed as `M/ξM` (BMS1, Proposition 4.13). -/
theorem ainf_free_of_torsionFree_reduction (ε : PreTilt (integers C) p)
    (hε : IsPrimitiveRoot
      (PreTilt.untilt ((_root_.frobeniusEquiv (PreTilt (integers C) p) p).symm ε)) p)
    (M : Type*) [AddCommGroup M] [Module (WittVector p (PreTilt (integers C) p)) M]
    [Module.FinitePresentation (WittVector p (PreTilt (integers C) p)) M]
    (hproj : Module.Projective (Localization.Away (p : WittVector p (PreTilt (integers C) p)))
      (LocalizedModule (Submonoid.powers (p : WittVector p (PreTilt (integers C) p))) M))
    (hred : Function.Injective (fun x : M ⧸
        LinearMap.range (LinearMap.lsmul (WittVector p (PreTilt (integers C) p)) M (xi p ε)) =>
      (p : WittVector p (PreTilt (integers C) p)) • x)) :
    Module.Free (WittVector p (PreTilt (integers C) p)) M := by sorry


end CyclotomicKernel

/-! ## Layer AI.1: The décalage operator Lη -/

section Decalage

open CategoryTheory

universe u

variable {R : Type u} [CommRing R]

/-- The divisibility submodule `E_f(C)^i = {x ∈ C^i : d x ∈ f · C^{i+1}}` of a cochain complex of
`R`-modules indexed by `ℤ` (BMS1, §6.1). Multiplication by `f^i` identifies it with `(η_f C)^i`
when `f` is a nonzerodivisor on every term; no torsion-freeness is needed to define it. For
`R = ℤ`, `f = p` prime, this submodule is the kernel defining the normalized principal-`p`
core of CrystallineCohomology CR.4; its torsion-free complex and derived interfaces use that core. -/
def etaTerm (C : CochainComplex (ModuleCat.{u} R) ℤ) (f : R) (i : ℤ) : Submodule R (C.X i) :=
  Submodule.comap (C.d i (i + 1)).hom (LinearMap.range (LinearMap.lsmul R (C.X (i + 1)) f))

/-- Membership in the divisibility submodule is witnessed by a quotient of the differential. -/
theorem mem_etaTerm (C : CochainComplex (ModuleCat.{u} R) ℤ) (f : R) (i : ℤ) (x : C.X i) :
    x ∈ etaTerm C f i ↔ ∃ y : C.X (i + 1), f • y = (C.d i (i + 1)).hom x := by sorry

-- A unit gives the ambient module; zero gives precisely the cocycles.
example (C : CochainComplex (ModuleCat.{u} R) ℤ) (i : ℤ) : etaTerm C 1 i = ⊤ := by
  ext x
  simp [etaTerm, LinearMap.mem_range]

example (C : CochainComplex (ModuleCat.{u} R) ℤ) (i : ℤ) :
    etaTerm C 0 i = LinearMap.ker (C.d i (i + 1)).hom := by
  ext x
  simp [etaTerm]

/-- The integer complex `[ℤ --a→ ℤ]` in degrees zero and one, zero elsewhere. -/
def integerTwoTerm (a : ℤ) : CochainComplex (ModuleCat ℤ) ℤ :=
  CochainComplex.of
    (fun i : ℤ => if i = 0 ∨ i = 1 then ModuleCat.of ℤ ℤ else ModuleCat.of ℤ (Fin 0 → ℤ))
    (fun i => if h : i = 0 then by
      subst i
      exact ModuleCat.ofHom (LinearMap.lsmul ℤ ℤ a)
    else 0)
    (by
      intro i
      by_cases hi : i = 0
      · subst i
        simp
      · simp [hi])

end Decalage

/-! ## Layer AI.3: Integral pro-étale period sheaves and AΩ -/

section QInteger

variable {R : Type*} [CommRing R]

/-- The `q`-integer `[n]_q = Σ_{j<n} q^j`, the coefficient of the divided torus differential
`d(T^n) = [n]_q T^n dlog_q T` of the `q`-de Rham model (BMS1, Example 7.7). -/
def qInteger (q : R) (n : ℕ) : R := ∑ j ∈ Finset.range n, q ^ j

/-- Multiplying the divided torus coefficient by `q − 1` recovers the undivided coefficient. -/
theorem qInteger_mul_sub_one (q : R) (n : ℕ) : (q - 1) * qInteger q n = q ^ n - 1 := by sorry

-- At the classical specialization, every torus weight has its ordinary de Rham coefficient.
example (n : ℕ) : qInteger (1 : R) n = n := by
  simp [qInteger]

/-- The Laurent q-integer for an integer exponent and a unit q (BMS1, Example 7.7). -/
def laurentQInteger (q : Rˣ) (n : ℤ) : R :=
  if 0 ≤ n then qInteger (q : R) n.toNat
  else -((q ^ n : Rˣ) : R) * qInteger (q : R) (-n).toNat

-- The classical specialization also preserves all negative Laurent weights.
example (n : ℤ) : laurentQInteger (1 : Rˣ) n = n := by
  cases n with
  | ofNat n => simp [laurentQInteger, qInteger]
  | negSucc n => simp [laurentQInteger, qInteger]

end QInteger

/-- A finite torsion-free module over a valuation ring is free, by the pinned
Bézout flatness criterion and finite-flat freeness over a local ring (AI.1.3). -/
theorem valuation_finite_torsionFree_free (V M : Type*) [CommRing V] [IsDomain V]
    [ValuationRing V] [AddCommGroup M] [Module V M] [Module.Finite V M]
    [Module.IsTorsionFree V M] : Module.Free V M := by
  have : Module.Flat V M :=
    Module.Flat.flat_iff_torsion_eq_bot_of_isBezout.mpr
      (Submodule.isTorsionFree_iff_torsion_eq_bot.mp inferInstance)
  exact Module.free_of_flat_of_isLocalRing

/-! ## Layer AI.7: Breuil–Kisin cohomology and relative traces -/

section BreuilKisinCoefficient

variable {R : Type*} [CommRing R]

/-- The generic power-series formula for the supplied Breuil–Kisin Frobenius:
`F` on coefficients and `u ↦ u^p`. Its arithmetic specialization uses R07.4.1's map. -/
def coefficientFrobenius (p : ℕ) (hp : p ≠ 0) (F : R →+* R) : PowerSeries R →+* PowerSeries R :=
  (PowerSeries.substAlgHom (PowerSeries.HasSubst.X_pow hp)).toRingHom.comp (PowerSeries.map F)

/-- The generic power-series expression `F ∘ constantCoeff : R[[u]] → R`.
For `R = W(k₀)` and `F = φ_W`, this models the transported alias `c = ε₁` of
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.16's `kisinPeriodScalarMaps`. -/
abbrev crystallineCoefficient (F : R →+* R) : PowerSeries R →+* R :=
  F.comp (PowerSeries.constantCoeff (R := R))

/-- The coefficient formula of the Breuil–Kisin Frobenius. -/
theorem coefficientFrobenius_formula (p : ℕ) (hp : p ≠ 0) (F : R →+* R)
    (a : R) (f : PowerSeries R) (n : ℕ) :
    coefficientFrobenius p hp F (PowerSeries.C a) = PowerSeries.C (F a) ∧
    coefficientFrobenius p hp F PowerSeries.X = PowerSeries.X ^ p ∧
    PowerSeries.coeff n (coefficientFrobenius p hp F f) =
      if p ∣ n then F (PowerSeries.coeff (n / p) f) else 0 := by sorry

/-- The basis property of Breuil–Kisin Frobenius (AI.7.1, *Finite freeness of the
Breuil–Kisin Frobenius*): each series has a unique expansion in `1,u,…,u^(p−1)`
over the coefficient-twisted Frobenius image. -/
theorem coefficientFrobenius_basis (p : ℕ) (hp : p ≠ 0) (F : R ≃+* R)
    (f : PowerSeries R) :
    ∃! a : Fin p → PowerSeries R,
      f = ∑ j : Fin p, PowerSeries.X ^ (j : ℕ) * coefficientFrobenius p hp F.toRingHom (a j) := by
  sorry

/-- The generic residue formula intertwines the supplied Breuil–Kisin Frobenius with `F`;
at `R = W(k₀)` this gives the cohomological compatibility of the imported `ε₁`. -/
theorem crystallineCoefficient_comp (p : ℕ) (hp : p ≠ 0) (F : R →+* R) :
    (crystallineCoefficient F).comp (coefficientFrobenius p hp F) =
      F.comp (crystallineCoefficient F) := by sorry

end BreuilKisinCoefficient

/-! ## Targets stated in README.md only

The following definitions and constructions are README targets: their carriers (derived categories of
ringed topoi with décalage, Breuil–Kisin–Fargues modules, pro-étale period sheaves, semistable charts
and log structures, B_dR⁺-envelopes, spectra with circle actions) are not available at the pins.

Layer AI.0: `AInf.thetaWitt`. The generic kernel and regularity API of `AInf.xiWitt` and
`AInf.witt_base_change` are transported aliases of CrystallineCohomology CR.4.4's
finite-Witt perfectoid package, for all integral perfectoid maps and either restriction or
Frobenius module structures. The `xiLevel` formulas above fix the cyclotomic generators;
`AInf.witt_almost_ideal` adds the cyclotomic q-generators and almost-ideal assertions. The local name `AInf.witt_etale_base_change` is an alias of
CrystallineCohomology CR.4's coefficient theorem in *Witt localization and étale descent*:
for a prime `p`, `r ≥ 1` and an étale map `A → B` of arbitrary commutative rings,
`W_r(A) → W_r(B)` is étale and `W_r(A′) ⊗_{W_r(A)} W_r(B) ≅ W_r(B ⊗_A A′)` for every `A → A′`.

Layer AI.0:integral: `AInf.bkTwist`; `AInf.residue` is Mathlib's Witt map specialized to the
residue homomorphism, with its period calculation recorded above.

Layer AI.1: `Decalage.etaDifferential`, `Decalage.etaComplex`, `Decalage.etaMap`,
`Decalage.idealPow`, `Decalage.idealEta`, `Decalage.derivedEta`, `Decalage.etaTensor`,
`Decalage.bockstein`, `Decalage.bocksteinMap`, `Decalage.completedTensor`, `Decalage.pCompletion`,
`Decalage.koszulComplex`, `Decalage.contCochains`.

Layer AI.2: `BKF.Module`, `BKF.Rigidified`, `BKF.LatticePair`, `BKF.etale`, `AInf.Yan`, `BKF.reconstruct`,
`AInf.MinusculeBKF`. The period criterion `AInf.p_local_freeness_from_periods` is in AI.2.1,
before closure of crystalline-rigidified BKF modules; `BKF.Rigidified` includes the Frobenius-compatible
crystalline isomorphism, identity residue reduction and comparison-preserving morphisms.

Layer AI.3: `AInfSheaf.completedIntegral`, `AInfSheaf.tilt`, `AInf.classical_ainf_sheaf`,
`AInfSheaf.ainf`, `AInfSheaf.deRhamPeriods`, `AInfSheaf.structuralDeRhamPeriods`,
`AInf.nu`, `AOmega.local`, `AOmega.toricCover`, `AOmega.qModel`, `AInf.sqZero`.
For `AInfSheaf.structuralDeRhamPeriods`, the affinoid perfectoid presentation
`U = lim_i Spa(R_i,R_i⁺)` with completed limit `(R,R⁺)` gives the sheafification of
`colim_i (((R_i⁺ ⊗_{W(k₀)} A_inf(R,R⁺))^∧_p)[1/p])^∧_{ker θ_i}`.
The completions are classical and ordered as written (Sch13-corr, item (3)); the stabilized
toric power-series computation supplies its connection and strict Poincaré lemma.

Layer AI.4: `AInf.hodge_tate_local` provides the θ̃ reduction and framed exterior-power
calculation. `AInf.eta_factorization_criterion` and `AInf.hodge_tate_cotangent` then construct
the canonical first-truncation map with its torus dlog normalization. `AInf.hodge_tate` is
the canonical multiplicative differential-form identification deduced from these inputs.
`AInf.finite_witt_de_rham` is the multiplicative complex equivalence
`AΩ ⊗^L_(A_inf,θ_r) W_r(O_C) ≃ W_rΩ^•_(𝔛/O_C),cont` for a smooth p-adic formal
`O_C`-scheme and `r ≥ 1`, with its actual Witt differential. It is obtained from
`φ^{r*}AΩ ≃ Lη_ξ̃_r AΩ` and Bockstein reduction, and preserves the finite-Witt
F-V-procomplex maps; at `r = 1` it is the de Rham specialization.
`AOmega.wittPre`, `AOmega.wittImproved`, `AInf.boundedPD`
(`AInf.bounded_pd_coefficients`).

Layer AI.5: `AOmega.proper`. In `AInf.crystalline_frobenius_bijective`, the ordinary
Frobenius base-change formula has `Y = 𝔛_(O_C/p)` for a proper smooth p-adic formal
`O_C`-scheme. The rational Frobenius-isogeny clause retains arbitrary qcqs smooth `Z`. Its affine
constant-coefficient input over the perfect residue field comes from CR.3’s
`p-power control for purely inseparable pullback`, with kernel and cokernel bound
`p^(d(i+1))` in degree `i` for relative dimension `d`, and bijective Witt Frobenius.

Layer AI.6: `Semistable.chartRing`, `Semistable.divisorialLog`, `Semistable.monomialExponents`,
`Semistable.rootTower`, `Semistable.ainfChartLift`, `Semistable.aOmega`,
`Semistable.finiteLevelAcris`, `Semistable.logDerivations`, `Semistable.allCoordinates`,
`Semistable.allCoordinates.rootCovers`, `Semistable.logExactification`,
`Semistable.allCoordinatesPD`, `Semistable.allCoordinatesAOmega`,
`Semistable.allCoordinatesLogCrystalline`, `Semistable.allCoordinatesComparisonMap`,
`AInf.bdr_infinitesimal_envelope`, `AInf.canonical_bdr_deformation`, `AInf.canonical_bdr_etale_map`,
`Semistable.bdrComparisonMap`, `AInf.normalized_valuation_length`,
`Semistable.deRhamLatticeFunctor`, `AInf.pure_integral_model_freeness`. The latter supplies
purity/projectivity and local-ring freeness of algebraic integral models before completion.
`Semistable.pNormalizedMonodromy` uses the rationalization of CR.6’s existing
Hyodo–Kato complex over the uniformizer log point, for a proper fine log smooth
Cartier-type model over `O_K/p`. With `e_K = ord_(π_K)(p)`, it is `N_HK,p = N_raw/e_K`;
the integral operator remains `N_raw`. Both
`Semistable.rational_log_crystalline_finiteness` and `Semistable.hyodoKatoInterface` (iv)
intertwine `(N_raw/e_K)⊗1 + 1⊗N_p` on the Hyodo–Kato tensor with `1⊗N_p` on the
`A_cris` tensor, where the period operator is CK’s `N_p = −d/dT`. The finite-extension
base `O` in the former statement uses `e_O` in place of `e_K`.
The local ring map of `Semistable.bdrComparisonMap` induces the map on log differentials
`dlog X_τ ↦ dlog X_{v(τ)}` and its exterior powers, where `τ` indexes source occurrences and
`v(τ)` is their coordinate value. Its operator identity is
`D′_a ∘ f = Σ_{v(τ)=a} f ∘ D_τ`, compatible with refinement; repeated values contribute a sum.

Layer AI.7: `CohomologicalBK.coefficientNormalization`, `AInf.Trace.tate`,
`AInf.Trace.tateDiagonal`, `AInf.Trace.THH`,
`AInf.Trace.bokstedtSpectralSequence`, `AInf.Trace.dyerLashofInput`,
`AInf.relative_cyclotomic_traces`,
`AInf.qrsp_trace_unfolding`, `CohomologicalBK.cohomology`, `CohomologicalBK.twistedTrace`,
`CohomologicalBK.traceDescent`, `CohomologicalBK.twistCompatibility`,
`CohomologicalBK.choiceTransport`.
`CohomologicalBK.coefficientNormalization` uses transported aliases of R07.4.16's
`kisinPeriodScalarMaps`: `g = ι₀`, `f = ι₁`, `constantCoeff = ε₀`, `c = ε₁`, including
the supplied Eisenstein-kernel identities. `CohomologicalBK.twistCompatibility` extends
R07.4.15's imported `𝔖{1}` and conormal/Frobenius data to the intrinsic `A_inf{1}`.
`AInf.relative_cyclotomic_traces` uses loop precomposition: `(s,n) ↦ (s,pn)` with the
target action transported through `𝕋/C_p ≃ 𝕋`, `[λ] ↦ λ^p`; weight zero stays a point.
`AInf.Trace.bokstedtSpectralSequence` imports DGAInfinity Layer 8's normalized chains.
Internal homological degree `t` corresponds to cohomological degree `−t`, and
Hochschild length `s` contributes `−s`, so total degree is `−(s+t)`; its boundary
lowers length and preserves `t`. AI.7 supplies the skeletal identification and spectral structures.
`AInf.Trace.tateFinite` is BordismFormalGroups F6.5's finite-group Tate functor transported
through EnhancedDerivedSheaves E5:spectra-comparison. `AInf.Trace.tateOrbit` and
`AInf.Trace.completedTateComparison` give the bounded-below Tate-orbit vanishing and the
natural multiplicative equivalence `(X^{t𝕋})^∧_p ≃ (X^{tC_p})^{h(𝕋/C_p)}`, compatible with
`can`. This comparison turns residual-circle fixed points of the absolute or relative
cyclotomic map into Frobenius on p-completed `TC⁻ → TP`.
`AInf.Trace.dyerLashofInput` uses TangentialBordism B4's computed dual Steenrod Hopf algebras
and conjugate generators; it supplies their Dyer–Lashof values and Bökstedt differentials.
For monic E the relative trace coefficients retain a unit α:
`bv=E`, `can(b)=Eσ`, `can(v)=σ⁻¹`, `φ(b)=ασ`, `φ(v)=φ(E)α⁻¹σ⁻¹`.
The finite-Tate specialization sends `b` to `θ̃^(−1)(α)σ`; Bott inversion uses the unit ασ,
and `can⁻¹φ` acts on the localized degree-two line by α/E. A basis rescaling by c changes
α to φ(c)α/c. These same factors are retained in `CohomologicalBK.twistedTrace`,
`CohomologicalBK.traceDescent` and `CohomologicalBK.twistCompatibility`.

-/

end TauCetiRoadmap.AInfCohomology

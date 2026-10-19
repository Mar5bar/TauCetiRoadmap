import Mathlib

/-!
# PerfectoidQuotients: representative target signatures

The mathematical roadmap is README.md. This file records definitions and theorem
signatures statable against the pinned Mathlib APIs and is not exhaustive.
Ambient root closure keeps its actual subring and localization. Characteristic-p
quotients use the actual perfect-ring, radical and inverse-Frobenius interfaces.
The integral-perfectoid predicate and universal perfectoidization have a single
owner, PerfectoidSpaces; targets on those unavailable supplier carriers remain
in the README, as do the finite Witt maps and the derived and almost constructions.
-/

namespace TauCetiRoadmap.PerfectoidQuotients
noncomputable section
universe u v

/-! ## Layer 0: integral perfectoid algebra -/

section IntegralAlgebra
variable (p : ℕ) [Fact p.Prime]
variable (R : Type u) [CommRing R]

section Units
variable [hchar : CharP R p]
include hchar

-- BMS1 Lemma 3.10: detection in the inverse perfection, not direct perfection.
/-- A unit in inverse perfection is detected by its zeroth coordinate, without surjective Frobenius on R. -/
theorem perfection_isUnit_iff (x : Perfection R p) :
    IsUnit x ↔ IsUnit (Perfection.coeff R p 0 x) := by sorry

-- General-ring replacement for the pinned field-only Witt unit criterion.
/-- A Witt vector over a perfect characteristic-p ring is a unit exactly when its constant coordinate is. -/
theorem witt_isUnit_iff [PerfectRing R p] (x : WittVector p R) :
    IsUnit x ↔ IsUnit (x.coeff 0) := by sorry

/-- In characteristic p, Witt coordinate one of a product is x₀^p y₁ + x₁ y₀^p. -/
theorem witt_mul_coeff_one (x y : WittVector p R) :
    (x * y).coeff 1 = x.coeff 0 ^ p * y.coeff 1 +
      x.coeff 1 * y.coeff 0 ^ p := by sorry

end Units

section CharacteristicP
variable [hchar : CharP R p] [Fact (¬ IsUnit (p : R))]
variable [IsAdicComplete (Ideal.span {(p : R)}) R]
include hchar

-- The theta modulo p formula is the existing WittVector.mk_fontaineTheta.

/-- In characteristic p, a principal Fontaine kernel is (p), without an extra Frobenius-surjectivity premise. -/
theorem theta_kernel_charP
    (h : ∃ ξ : WittVector p (PreTilt R p),
      RingHom.ker (WittVector.fontaineTheta R p) = Ideal.span {ξ}) :
    RingHom.ker (WittVector.fontaineTheta R p) =
      Ideal.span {(p : WittVector p (PreTilt R p))} := by sorry

/-- A principal Fontaine kernel in characteristic p makes the zeroth tilt projection injective. -/
theorem tilt_projection_injective_charP
    (h : ∃ ξ : WittVector p (PreTilt R p),
      RingHom.ker (WittVector.fontaineTheta R p) = Ideal.span {ξ}) :
    Function.Injective (PreTilt.coeff (O := R) (p := p) 0) := by sorry

end CharacteristicP

section Naturality
variable [Fact (¬ IsUnit (p : R))]
variable [IsAdicComplete (Ideal.span {(p : R)}) R]
variable (S : Type v) [CommRing S] [Fact (¬ IsUnit (p : S))]
variable [IsAdicComplete (Ideal.span {(p : S)}) S]
variable (f : R →+* S) (g : ModP R p →+* ModP S p)
variable (hg : g.comp (Ideal.Quotient.mk (Ideal.span {(p : R)})) =
  (Ideal.Quotient.mk (Ideal.span {(p : S)})).comp f)
include hg

/-- Sharp commutes with a ring map and its explicitly compatible reduction modulo p. -/
theorem untilt_natural (x : PreTilt R p) :
    f x.untilt = PreTilt.untilt (O := S) (p := p) (Perfection.map p g x) := by sorry

/-- Fontaine’s map commutes with the induced Witt map of tilts. -/
theorem theta_natural (x : WittVector p (PreTilt R p)) :
    f (WittVector.fontaineTheta R p x) =
      WittVector.fontaineTheta S p (WittVector.map (Perfection.map p g) x) := by sorry
end Naturality

end IntegralAlgebra

namespace Witt
variable (p : ℕ) [Fact p.Prime]
variable {k : Type*} [CommRing k] [CharP k p] [PerfectRing k p]

/-- The §0.3 Witt quotient torsion bound: a unit coordinate one forces all p-power torsion to be killed by p. -/
theorem witt_principal_quotient_p_torsion (xi : WittVector p k)
    (hxi : IsUnit (xi.coeff 1)) (n : ℕ)
    (x : WittVector p k ⧸ Ideal.span {xi})
    (hx : (p : WittVector p k ⧸ Ideal.span {xi}) ^ n * x = 0) :
    (p : WittVector p k ⧸ Ideal.span {xi}) * x = 0 := by sorry

/-- The §0.3 divisibility criterion detects a factor of p from a product divisible by p². -/
theorem witt_p_sq_dvd_mul_detects_p (xi g : WittVector p k)
    (hxi : IsUnit (xi.coeff 1))
    (h : (p : WittVector p k) ^ 2 ∣ xi * g) :
    (p : WittVector p k) ∣ g := by sorry

/-- The §0.3 principal ideal saturation lowers p²-divisibility to p-divisibility. -/
theorem witt_principal_p_saturation (xi f : WittVector p k)
    (hxi : IsUnit (xi.coeff 1))
    (h : (p : WittVector p k) ^ 2 * f ∈ Ideal.span {xi}) :
    (p : WittVector p k) * f ∈ Ideal.span {xi} := by sorry

/-- The §0.3 boundary witt_torsion_hypothesis_required: without a unit coordinate one, the torsion bound fails in W(F₂)/(4). -/
theorem witt_torsion_hypothesis_required :
    let A := WittVector 2 (ZMod 2)
    let I : Ideal A := Ideal.span {(2 : A) ^ 2}
    (2 : A ⧸ I) ^ 2 * (1 : A ⧸ I) = 0 ∧
      (2 : A ⧸ I) * (1 : A ⧸ I) ≠ 0 := by sorry

end Witt

section Annihilators
variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] [IsReduced R]

/-- The §0.4 compatible-root annihilators agree in every reduced ring. -/
theorem compatible_root_annihilator (a : ℕ → R)
    (ha : ∀ n, a (n + 1) ^ p = a n) (n : ℕ) (x : R) :
    a n * x = 0 ↔ a 0 * x = 0 := by sorry

/-- The §0.4 power-torsion identity: in a reduced ring all a-power torsion is killed by a. -/
theorem compatible_root_power_torsion (a x : R) :
    (∃ n : ℕ, a ^ n * x = 0) ↔ a * x = 0 := by sorry

end Annihilators

section ClosureAndOperations
variable (p : ℕ)
/-- The smallest ambient subring containing A and closed under pth roots. -/
def pIntegralClosure (B : Type u) [CommRing B] (A : Subring B) : Subring B :=
  sInf {C : Subring B | A ≤ C ∧ ∀ b : B, b ^ p ∈ C → b ∈ C}

variable (B : Type u) [CommRing B] (A : Subring B)
/-- The source subring lies in its ambient p-integral closure. -/
theorem pIntegralClosure.le : A ≤ pIntegralClosure p B A := by sorry

/-- The ambient p-integral closure is closed under pth roots inside B. -/
theorem pIntegralClosure.isClosed (b : B) (h : b ^ p ∈ pIntegralClosure p B A) :
    b ∈ pIntegralClosure p B A := by sorry

/-- Root closure is contained in every root-closed intermediate subring containing A. -/
theorem pIntegralClosure.minimal (C : Subring B) (hAC : A ≤ C)
    (hC : ∀ b : B, b ^ p ∈ C → b ∈ C) : pIntegralClosure p B A ≤ C := by sorry

/-- Taking the §0.5 ambient root closure twice gives the same subring. -/
theorem pIntegralClosure.idempotent :
    pIntegralClosure p B (pIntegralClosure p B A) = pIntegralClosure p B A := by sorry

/-- The §0.5 ambient root closure preserves inclusions of source subrings. -/
theorem pIntegralClosure.mono (C : Subring B) (hAC : A ≤ C) :
    pIntegralClosure p B A ≤ pIntegralClosure p B C := by sorry

/-- For a positive exponent, the §0.5 ambient root closure lies in the ordinary integral closure. -/
theorem pIntegralClosure.le_integralClosure (hp : 0 < p) :
    pIntegralClosure p B A ≤ (integralClosure A B).toSubring := by sorry

-- The fixed-point Check pClosureIdentity for ambient root closure.
example (h : ∀ b : B, b ^ p ∈ A → b ∈ A) : pIntegralClosure p B A = A := by
  apply le_antisymm
  · exact sInf_le ⟨le_rfl, h⟩
  · exact le_sInf fun C hC => hC.1

end ClosureAndOperations

section RootClosure
variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R]

/-- For regular π, the representative divisibility criterion is ambient p-root closedness in R[1/π]. -/
theorem perfectoid_p_integral_closedness (π : R)
    (hreg : ∀ x : R, π * x = 0 → x = 0) :
    (∀ x : R, π ^ p ∣ x ^ p → π ∣ x) ↔
      ∀ b : Localization.Away π,
        b ^ p ∈ (algebraMap R (Localization.Away π)).range →
        b ∈ (algebraMap R (Localization.Away π)).range := by sorry

end RootClosure

/-! ## Layer 2: characteristic-p quotients and radicals -/

section CharacteristicPQuotients
variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R]
section Quotients
variable [hchar : CharP R p]
include hchar

omit hchar in
/-- A surjective power function remains surjective on every ring quotient. -/
theorem quotient_pow_surjective (h : Function.Surjective (fun x : R => x ^ p))
    (I : Ideal R) : Function.Surjective (fun x : R ⧸ I => x ^ p) := by sorry

/-- The §2.1 radical criterion: a quotient of a perfect characteristic-p ring is perfect exactly for radical ideals, including the unit ideal. -/
theorem quotient_perfect_iff_radical [PerfectRing R p] (I : Ideal R) :
    PerfectRing (R ⧸ I) p ↔ I.IsRadical := by sorry

omit hchar in
/-- Every map killing I into a reduced target factors uniquely through the radical quotient. -/
theorem radical_quotient_universal (I : Ideal R)
    (T : Type v) [CommRing T] [IsReduced T]
    (f : R →+* T) (hf : I ≤ RingHom.ker f) :
    ∃! g : R ⧸ I.radical →+* T, g.comp (Ideal.Quotient.mk I.radical) = f := by sorry

end Quotients

/-- The §2.1 boundary nonradicalRootClass: the quotient by T retains a nonzero square-zero root of T. -/
theorem nonradicalRootClass :
    let A := PerfectClosure (Polynomial (ZMod 2)) 2
    let t : A := PerfectClosure.of (Polynomial (ZMod 2)) 2 Polynomial.X
    let I := Ideal.span {t}
    Ideal.Quotient.mk I t = 0 ∧
      Ideal.Quotient.mk I ((frobeniusEquiv A 2).symm t) ≠ 0 ∧
      (Ideal.Quotient.mk I ((frobeniusEquiv A 2).symm t)) ^ 2 = 0 := by sorry

end CharacteristicPQuotients

/- The further README targets are:
§0.0 perfectoid_tor_independence, fontaine_tor_independence,
delta_etale_extension, delta_derivedCompletion for discrete derived completion,
completeEtale_algebraization,
delta_witt2_etale,
perfectPrism_completeEtale_lift, with their hypotheses, proof routes and Checks;
§0.2 finiteFontaineTheta with its API and Checks, using
CrystallineCohomology §CR.4.4's truncatedFrobenius,
frobenius_surjectivity_equivalences, theta_generator_iff_unit_coeff_one,
theta_generator_nonzerodivisor, theta_generator_normal_form,
theta_map_preserves_generator;
§0.3 perfectoid_p_torsion_killed_by_p, perfectoid_cotangent_mod_p_vanishes,
perfectoid_absolute_cotangent;
§0.4 perfectoid_torsion_free_quotient with tilt and fibre-product comparisons,
perfectoid_compatible_roots_iterated_frobenius;
§0.5 quotientPowerMap with its representative
formula and Checks, completion_pIntegralClosure_perfectoid, and the ordinary
integral-closure completion criterion completion_integrally_closed_perfectoid;
§0.6 perfectoid_completely_etale_henselization,
perfectoid_completed_root_polynomial, perfectoid_completed_tensor,
perfectoid_completed_root_quotient with the tilt ideal lim_F J₁ for the generated
ideal J₁ in A/(ϖ), integralPerfectoid_pi_iff,
perfectoid_sharp_ideal_completion, including their tilt comparisons;
§0.7 bhatt_integral_model_comparison;
§1.1 relative_perfectoid_cover_smooth_site, frobenius_flat_prism_perfection_cover;
§1.2 andre_ind_syntomic_mod_p;
§1.3 bhatt_root_neighborhoods and bhattRootExtension with its API and Checks;
§1.4 bhatt_root_extension_almost_faithfully_flat, monicRootPair with its API and Checks and functorial_almost_aic_extension;
§2.1 radical_quotient_integralPerfectoid, quotient_perfectoid_iff_radical,
and the comparison of the explicit radical quotient with the supplied universal ring. -/

end
end TauCetiRoadmap.PerfectoidQuotients

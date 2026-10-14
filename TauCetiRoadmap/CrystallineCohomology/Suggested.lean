import Mathlib
import TauCeti.RingTheory.DividedPowers.Associative
import TauCeti.RingTheory.Henselian.Teichmuller
import TauCeti.RingTheory.Nilpotent.Exp
import TauCeti.RingTheory.WittVector.Complete
import TauCeti.RingTheory.WittVector.Frobenius

/-!
# CrystallineCohomology: representative target signatures

The roadmap is `README.md` in this directory; this file is not exhaustive. It records the
definitions that can be given real bodies against the pinned Mathlib and Tau Ceti, and the end
theorems and layer milestones whose carriers exist at the pins, proved by `sorry`. The heavy
objects of the roadmap (crystalline and log crystalline sites, crystals, de Rham–Witt complexes
of rings, Hyodo–Kato complexes) are README targets; the closing comment lists them.

Design choices made explicit here:
- Divided powers are Mathlib's `DividedPowers`: total operations that vanish outside the ideal,
  with integer coefficients `choose` and `uniformBell`. Divided power morphisms are Mathlib's
  `DividedPowers.IsDPMorphism`.
- A Dieudonné complex is a cochain complex of abelian groups (`ModuleCat ℤ`, indexed by `ℤ`) with
  a graded endomorphism `F` satisfying `d ∘ F = p • (F ∘ d)`; `F` is not a map of complexes.
- Monoids for log structures are written multiplicatively, as in rings; fine means cancellative
  and finitely generated, and saturation is tested in Mathlib's `Algebra.GrothendieckGroup`.
- `(φ, N)`-modules are built on Mathlib's `WittVector.Isocrystal`, with `N φ = p φ N`.
-/

namespace TauCetiRoadmap.CrystallineCohomology

open Finset

universe u v

#check Perfection.teichmuller₀
#check Perfection.mk_teichmuller₀
#check PerfectionMap.id
#check TauCeti.Associative.dividedPower_eq_dpow
#check TauCeti.teichmuller
#check TauCeti.nilpotentExpUnit
#check WittVector.isAdicComplete_span_p_teichmuller
#check WittVector.frobenius_teichmuller

/-! ## Layer CR.1: Crystalline sites, structure sheaves and crystals -/

namespace Crystalline

open TensorProduct

/-- A connection on a `B`-module `M` relative to `A`: an additive map `∇ : M → M ⊗_B Ω¹_{B/A}`
with the Leibniz rule `∇(b m) = b ∇m + m ⊗ db`. Integrability and quasi-nilpotence are README
targets (Layer CR.1). -/
structure Connection (A B M : Type*) [CommRing A] [CommRing B] [Algebra A B] [AddCommGroup M]
    [Module B M] where
  /-- The map `∇`. -/
  toFun : M →+ M ⊗[B] Ω[B⁄A]
  leibniz : ∀ (b : B) (m : M),
    toFun (b • m) = b • toFun m + m ⊗ₜ KaehlerDifferential.D A B b

/-- The trivial connection `∇ = d` on `B` itself exists. -/
example (A B : Type*) [CommRing A] [CommRing B] [Algebra A B] :
    Nonempty (Connection A B B) := by
  sorry

end Crystalline

/-! ## Layer CR.4: Ordinary and relative de Rham–Witt complexes -/

namespace Crystalline

open CategoryTheory

/-- The first `r` ghost components jointly determine a truncated Witt vector over a
`p`-torsion-free ring, by cancellation in the triangular ghost equations. -/
theorem truncatedGhost_injective (p r : ℕ) [Fact p.Prime] (R : Type*) [CommRing R]
    (hR : Function.Injective (fun x : R ↦ (p : R) * x)) :
    Function.Injective (fun x : TruncatedWittVector p r R ↦
      fun i : Fin r ↦ WittVector.ghostComponent i.val x.out) := by
  sorry

/-- A Dieudonné complex (Bhatt–Lurie–Mathew, Definition 2.1.1): a cochain complex of abelian
groups with a graded endomorphism `F` satisfying `d(F x) = p F(d x)`. -/
structure DieudonneComplex (p : ℕ) where
  /-- The underlying cochain complex of abelian groups. -/
  complex : CochainComplex (ModuleCat.{u} ℤ) ℤ
  /-- The Frobenius, degree by degree. -/
  F : ∀ n, Module.End ℤ (complex.X n)
  comm : ∀ n x, (complex.d n (n + 1)).hom (F n x) = p • F (n + 1) ((complex.d n (n + 1)).hom x)

namespace DieudonneComplex

variable {p : ℕ} (M : DieudonneComplex.{u} p)

/-- Saturation (Bhatt–Lurie–Mathew, Definition 2.2.1): `M` is termwise `p`-torsion-free, `F` is
injective, and the image of `F` in degree `n` is `{x | d x ∈ p M^{n+1}}`. -/
def IsSaturated : Prop :=
  (∀ n, Function.Injective (fun x : M.complex.X n ↦ p • x)) ∧
  (∀ n, Function.Injective (M.F n)) ∧
  ∀ n, Set.range (M.F n) =
    {x | ∃ y : M.complex.X (n + 1), (M.complex.d n (n + 1)).hom x = p • y}

/-- The iterates of `F` on a saturated complex (Bhatt–Lurie–Mathew, Proposition 2.2.5). -/
theorem range_F_iterate {M : DieudonneComplex.{u} p} (hM : M.IsSaturated) (r : ℕ) (n : ℤ) :
    Set.range (M.F n)^[r] =
      {x | ∃ y : M.complex.X (n + 1), (M.complex.d n (n + 1)).hom x = (p ^ r) • y} := by
  sorry

end DieudonneComplex

/-- On a Dieudonné complex with zero differential and `p`-torsion-free terms, saturation is
bijectivity of `F`. -/
example {p : ℕ} (M : DieudonneComplex.{u} p)
    (hp : ∀ n, Function.Injective (fun x : M.complex.X n ↦ p • x))
    (hd : ∀ n, M.complex.d n (n + 1) = 0) :
    M.IsSaturated ↔ ∀ n, Function.Bijective (M.F n) := by
  sorry

end Crystalline

/-! ## Layer CR.3:duality: Trace and Poincaré duality -/

namespace Crystalline

/-- The trace-normalization sign for the Čech differential `δ + (−1)^r d` and cup
sign `(−1)^(s t)` on bidegrees `(r,s)` and `(t,u)`: `h^d = cechTraceSign d • [ω]`. -/
def cechTraceSign (d : ℕ) : ℤ := (-1) ^ (d * (d - 1) / 2)

example : cechTraceSign 0 = 1 := by norm_num [cechTraceSign]
example : cechTraceSign 1 = 1 := by norm_num [cechTraceSign]
example : cechTraceSign 2 = -1 := by norm_num [cechTraceSign]

end Crystalline

/-! ## Layer CR.5:log-algebra: Logarithmic structures -/

namespace LogCrystalline

open Algebra

/-- A commutative monoid is fine if it is integral (cancellative) and finitely generated. Fine does
not imply saturated. -/
def IsFineMonoid (P : Type*) [CommMonoid P] : Prop :=
  IsCancelMul P ∧ Monoid.FG P

/-- An integral monoid `P` is saturated if `gⁿ ∈ P` with `n > 0` implies `g ∈ P` for every `g` in
the Grothendieck group `P^gp`. -/
def IsSaturatedMonoid (P : Type*) [CommMonoid P] : Prop :=
  IsCancelMul P ∧ ∀ (g : GrothendieckGroup P) (n : ℕ), n ≠ 0 →
    g ^ n ∈ Set.range (GrothendieckGroup.of (M := P)) → g ∈ Set.range (GrothendieckGroup.of (M := P))

/-- A Kummer homomorphism of integral monoids: injective, and every element of the target has a
positive power in the image. -/
def IsKummerHom {P Q : Type*} [CommMonoid P] [CommMonoid Q] [IsCancelMul P] [IsCancelMul Q] (f : P →* Q) : Prop :=
  Function.Injective f ∧ ∀ q : Q, ∃ n : ℕ, n ≠ 0 ∧ q ^ n ∈ Set.range f

/-- A prelog ring: a commutative ring `A`, a commutative monoid `P` and a monoid homomorphism
`α : P → (A, ×)`; elements may map to zero. The monoid is bundled as Mathlib's `CommMonCat`. -/
structure PrelogRing (A : Type u) [CommRing A] where
  /-- The monoid. -/
  P : CommMonCat.{v}
  /-- The structure map. -/
  α : P →* A

/-- A prelog ring is a log ring if `α` restricts to a bijection from `α⁻¹(A^×)` onto `A^×`. -/
def PrelogRing.IsLog {A : Type u} [CommRing A] (L : PrelogRing.{u, v} A) : Prop :=
  Function.Bijective fun m : {m : L.P // IsUnit (L.α m)} ↦ (⟨L.α m, m.2⟩ : {a : A // IsUnit a})

/-- The trivial log structure `A^× → A` is a log ring. -/
example (A : Type u) [CommRing A] :
    (⟨CommMonCat.of Aˣ, Units.coeHom A⟩ : PrelogRing.{u, u} A).IsLog := by
  sorry

/-- The prelog chart `n ↦ (−1)ⁿ` is not a log ring, including in characteristic two:
`0` and `2` are distinct monoid elements with the same unit image `1`. -/
example (A : Type u) [CommRing A] :
    ¬ (⟨CommMonCat.of (Multiplicative ℕ), powersHom A (-1 : A)⟩ : PrelogRing.{u, 0} A).IsLog := by
  sorry

/-- The collision in the preceding negative control persists in characteristic two. -/
example : (-1 : ZMod 2) ^ 0 = (-1 : ZMod 2) ^ 2 := by decide

/-- The free monoid on one generator (written `Multiplicative ℕ`) is fine and saturated. -/
example : IsFineMonoid (Multiplicative ℕ) ∧ IsSaturatedMonoid (Multiplicative ℕ) := by
  sorry

/-- The numerical monoid generated by `2` and `3` is fine but not saturated: `t` is not in it
although `t²` is. -/
example : IsFineMonoid (Submonoid.closure
      ({Multiplicative.ofAdd 2, Multiplicative.ofAdd 3} : Set (Multiplicative ℕ))) ∧
    ¬ IsSaturatedMonoid (Submonoid.closure
      ({Multiplicative.ofAdd 2, Multiplicative.ofAdd 3} : Set (Multiplicative ℕ))) := by
  sorry

/-- The nonnegative rationals form a saturated integral monoid that is not fine
  (rational_not_fine and rational, Layer CR.5:log-algebra.1). -/
example : IsSaturatedMonoid (Multiplicative ℚ≥0) ∧ ¬ IsFineMonoid (Multiplicative ℚ≥0) := by
  sorry

/-- The `n`-th power map of `ℕ` is Kummer for `n ≠ 0`; Kummer fails for the zero map. -/
example (n : ℕ) (hn : n ≠ 0) : IsKummerHom (powMonoidHom n : Multiplicative ℕ →* Multiplicative ℕ) := by
  sorry

/-- The zero power map fails injectivity on the free monoid, so it is not Kummer. -/
example : ¬ IsKummerHom (powMonoidHom 0 : Multiplicative ℕ →* Multiplicative ℕ) := by
  intro h
  have heq : Multiplicative.ofAdd 0 = Multiplicative.ofAdd 1 := h.1 (by simp)
  have hnat : (0 : ℕ) = 1 := congrArg Multiplicative.toAdd heq
  norm_num at hnat

end LogCrystalline

/-! ## Layer CR.6: Hyodo–Kato complexes and semistable structure -/

namespace LogCrystalline

/-- At lengths two to one, Witt restriction sends `[t]` to `t`, while Frobenius sends it
to `t^p` on the strict smooth chart over `ZMod p` (Layer CR.6.1). -/
theorem logWitt_polynomial_R_F (p : ℕ) [Fact p.Prime] :
    (TruncatedWittVector.truncate (show 1 ≤ 2 by decide)
      (WittVector.truncate 2 (WittVector.teichmuller p
        (Polynomial.X : Polynomial (ZMod p))))).coeff ⟨0, by decide⟩ = Polynomial.X ∧
    (WittVector.truncate 1 (WittVector.frobenius (WittVector.teichmuller p
      (Polynomial.X : Polynomial (ZMod p))))).coeff ⟨0, by decide⟩ = Polynomial.X ^ p := by
  constructor
  · simp
  · rw [WittVector.coeff_truncate, WittVector.coeff_frobenius_charP,
      WittVector.teichmuller_coeff_zero]

/-- On `F_p[t]`, `V(t)` lies in the kernel of length-two restriction and outside the image
of multiplication by `p`. This witnesses why the finite log Witt exact sequence ends in a
quotient complex (Layer CR.6.1). -/
theorem logWitt_polynomial_V_not_p (p : ℕ) [Fact p.Prime] :
    let v := WittVector.truncate 2 (WittVector.verschiebung (WittVector.teichmuller p
      (Polynomial.X : Polynomial (ZMod p))))
    TruncatedWittVector.truncate (show 1 ≤ 2 by decide) v = 0 ∧
      ¬ ∃ w : TruncatedWittVector p 2 (Polynomial (ZMod p)), v = (p : _) * w := by
  sorry

/-- The length-one log Witt differential on a strict smooth polynomial chart is the ordinary
nonzero differential of its coordinate (Layer CR.6.1). -/
theorem logWitt_smooth_chart_differential (p : ℕ) [Fact p.Prime] :
    KaehlerDifferential.D (ZMod p) (Polynomial (ZMod p)) Polynomial.X ≠ 0 := by
  sorry

open WittVector
open scoped Isocrystal

variable (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p] [PerfectRing k p]

/-- A `(φ, N)`-module over `K₀ = W(k)[1/p]`: an isocrystal with a `K₀`-linear monodromy operator
satisfying `N φ = p φ N`, the relation of the Hyodo–Kato operators. -/
structure PhiNModule (V : Type*) [AddCommGroup V] [Isocrystal p k V] where
  /-- The monodromy operator. -/
  N : V →ₗ[K(p, k)] V
  N_frobenius : ∀ x : V, N (Isocrystal.frobenius p k (V := V) x) =
    (p : K(p, k)) • Isocrystal.frobenius p k (V := V) (N x)

/-- Zero monodromy gives a `(φ, N)`-module (the good-reduction case). -/
example (V : Type*) [AddCommGroup V] [Isocrystal p k V] : Nonempty (PhiNModule p k V) :=
  ⟨⟨0, fun x ↦ by simp⟩⟩

/-- Nilpotence of the monodromy (Layer CR.6, *Nilpotence of Hyodo–Kato monodromy*): on a
finite-dimensional `(φ, N)`-module, `N ^ dim = 0`. -/
theorem PhiNModule.N_pow_finrank_eq_zero {V : Type*} [AddCommGroup V] [Isocrystal p k V]
    [FiniteDimensional K(p, k) V] (D : PhiNModule p k V) :
    D.N ^ Module.finrank K(p, k) V = 0 := by
  sorry

/-- Coefficients of the two-term witness `x ↦ dx` for the signed inclusion
`C[−1] → C̃`: the two negative signs cancel. Raw right wedge fails this equality. -/
example : (1 : ℚ) = (-1) * (-1) ∧ (1 : ℚ) ≠ 1 * (-1) := by norm_num

/-- A rational coefficient witness for the direction `N φ = p φ N` at `p=2`:
`φ(a,b)=(a,2b)`, `N(a,b)=(b,0)`. -/
example (a b : ℚ) :
    let φ : ℚ × ℚ → ℚ × ℚ := fun x ↦ (x.1, 2 * x.2)
    let N : ℚ × ℚ → ℚ × ℚ := fun x ↦ (x.2, 0)
    N (φ (a, b)) = 2 • φ (N (a, b)) := by
  simp

/-- The reversed relation fails on the vector `(0,1)` of the same block. -/
example :
    let φ : ℚ × ℚ → ℚ × ℚ := fun x ↦ (x.1, 2 * x.2)
    let N : ℚ × ℚ → ℚ × ℚ := fun x ↦ (x.2, 0)
    φ (N (0, 1)) ≠ 2 • N (φ (0, 1)) := by
  norm_num

end LogCrystalline

/-!
## Definitions and constructions stated in the README

The sites, coefficient categories, envelopes, completions and cohomology functors below have their
intended signatures and APIs in the README. Their carriers are supplied by the mathematical
constructions there; this file records only the light definitions statable at the pins.


Layer CR.1: Schemes with a quasi-coherent PD ideal; Small and big crystalline sites; Morphisms and
comparisons of crystalline sites; The étale crystalline sites; Structure, quotient and PD-ideal
sheaves; Quasi-coherent and finite locally free crystals; Rational crystals and nondegenerate
F-crystals; Universal PD differentials and the PD de Rham complex; Modules with integrable
connection and their de Rham complexes; PD stratifications on a smooth lift; Integrable
topologically quasi-nilpotent connections.

Layer CR.2: Enhanced crystalline direct image and global sections; Crystalline linearization along
a smooth embedding; Linearization in a smooth ambient scheme.

Layer CR.3: The crystalline first Chern class and the hyperplane class; Crystalline cup products;
Semilinear crystalline Frobenius and linearization.

Layer CR.4: Principal p-décalage on torsion-free complexes; Dieudonné complexes; Saturated
Frobenius; Verschiebung and the differential; Morphisms of Dieudonné complexes; Bockstein
reduction of principal p-décalage; Derived p-décalage and completion; Saturation by iterated
décalage; The Verschiebung filtration; Finite Verschiebung quotient complex; Projection to the
finite quotient; Restriction between finite quotients; Frobenius on finite quotients; Verschiebung
on finite quotients; Functorial finite quotients; Completion of a saturated Dieudonné complex;
Strict Dieudonné complexes; Strict Dieudonné towers; Canonical divided powers on the Verschiebung
ideal of W_r(R); Dieudonné algebras and multiplicative quotients; Universal saturated de Rham–Witt
complex; Relative Frobenius–Verschiebung procomplexes; Initial relative de Rham–Witt complex;
Classical de Rham–Witt complex as the initial V-pro-complex; Continuous relative de Rham–Witt
complex; Nygaard filtration and divided Frobenius; Logarithmic Hodge–Witt sheaves.

Layer CR.3:duality: Proper smooth crystalline trace; Finite étale crystalline transfer and trace;
Proper smooth crystalline Gysin maps; Diagonal class and crystalline coevaluation.

Layer CR.5:log-algebra: Prelog rings; Étale log structures; Associated log structures; Inverse
image log structures; Characteristic monoids; Integral monoids; Fine monoids; Saturated monoids;
Log charts; Strict morphisms; Exact morphisms; Integral morphisms; Kummer morphisms; Kummer étale
morphisms; Log fiber products; Log smooth morphisms; Divisorial log structures; Log regular schemes; Integral
quasi-coherent log schemes; Vertical logarithmic morphisms; Log smoothness by fine models;
Valuation log structures and tilt charts; Log structures on semistable formal charts.

Layer CR.5: Logarithmic differentials; Log de Rham complexes; Absolute semistable residue maps;
Morphisms of Cartier type; Exactification of log immersions; Fine log PD envelopes; Quasi-coherent
log PD envelopes; Exact log PD thickenings; PD smooth log thickenings; Log crystalline sites;
Logarithmic crystals; Log PD stratifications; Integrable logarithmic connections; Logarithmic
quasi-nilpotence; Filtered logarithmic PD de Rham complexes; Derived p-adic log crystalline
cohomology; The induced log structure on A_cris.

Layer CR.6: Standard log Witt bases; Integral Hyodo–Kato complexes; Rational Hyodo–Kato complexes;
Hyodo–Kato Frobenius; Hyodo–Kato monodromy; Logarithmic de Rham–Witt complexes (canonical
restriction through the Frobenius-twisted Cartier intermediary, and the length-one Bockstein
differential); Finite-level log Witt quotient complexes; PD differential factorisation for the
log Witt comparison; Normalized
logarithms of units; Uniformizer-dependent Hyodo–Kato maps; Convergent logarithmic embedding complexes; Proper support on open analytic
tubes; Semistable logarithmic Witt models; Witt comparison maps with proper support.

Layer CR.7: Finite projective crystalline coefficients; Filtered Frobenius coefficients on
semistable models; Relative
crystalline direct images; Relative Gauss–Manin connections.

Layer CR.1 also includes `Crystalline.CrisFppfSite`, `Crystalline.CrisCompatibleSite`,
`Crystalline.CrisCompatibleEtaleSite` and `Crystalline.CrisCompatibleFppfSite`.
Layer CR.6 includes log rigid Hyodo–Kato cohomology; Layer CR.5:log-algebra includes the classical
normalization and tame Kummer comparison used in the logarithmic Abhyankar lemma.
The following README subsections also specify these APIs; they are names of mathematical
targets in the README, rather than declarations in this file.

CR.1.1 PD schemes and crystalline sites:
Crystalline.crisSiteMap_comp; Crystalline.cris_u_sections; Crystalline.cris_small_big;
Crystalline.cris_u_inverse_eval; Crystalline.etale_crystalline_site_toX;
Crystalline.etale_crystalline_site_structure; Crystalline.etale_crystalline_site_change;
Crystalline.crisStructure_eval; Crystalline.crisPDideal_kernel; Crystalline.crisPDideal_restrict;
Crystalline.crisSheaf_ofRestrictions; Crystalline.crisPDideal_pdPower.

CR.1.3 Differentials, connections and stratifications:
Crystalline.pdDifferentials_lift; Crystalline.pdDifferentials_dpow; Crystalline.pdDifferentials_map;
Crystalline.pdDifferentials_adjoin; Crystalline.pdDifferentials_quotient;
Crystalline.pdDifferentials_diagonal; Crystalline.pdDifferentials_completion.

CR.2.1 Crystalline cohomology and linearization:
Crystalline.RΓcrys_comp; Crystalline.RΓcrys_map; Crystalline.RΓcrys_limit.

CR.2.2 The Poincaré lemma and computation by embeddings:
Crystalline.linearization_eval; Crystalline.linearization_map;
Crystalline.linearization_augmentation; Crystalline.linearization_cohomology;
Crystalline.linearization_resolution; Crystalline.smooth_linearization_eval;
Crystalline.smooth_linearization_map; Crystalline.smooth_linearization_acyclic;
Crystalline.smooth_linearization_resolution.

CR.3.2 Base change and perfectness:
Crystalline.crysBaseChange_id; Crystalline.crysBaseChange_comp; Crystalline.crysBaseChange_natural.

CR.3.3 Products, Chern classes and the Leray spectral sequence:
Crystalline.crysChern_log; Crystalline.crysChern_add; Crystalline.crysChern_pullback;
Crystalline.crysChern_fil; Crystalline.crysChern_deRham; Crystalline.crysChern_reduction;
Crystalline.crysChern_hyperplane; Crystalline.crysCup_unit; Crystalline.crysCup_graded_comm;
Crystalline.crysCup_reduction; Crystalline.crysCup_assoc; Crystalline.crysCup_pullback;
Crystalline.crysCup_deRham; Crystalline.crysCup_external.

CR.3.4 Frobenius:
Crystalline.crysFrobenius_semilinear; Crystalline.crysFrobenius_linearize;
Crystalline.crysFrobenius_lift; Crystalline.crysFrobenius_natural; Crystalline.crysFrobenius_cup;
Crystalline.crysFrobenius_chern; Crystalline.crysFrobenius_finite_field.

CR.4.1 Dieudonné complexes, saturation and décalage:
Crystalline.pDecalage_degree; Crystalline.pDecalage_d; Crystalline.pDecalage_map;
Crystalline.pDecalage_cohomology; Crystalline.pDecalage_filtered_colimit;
Crystalline.DieudonneComplex.F_zero; Crystalline.DieudonneComplex.F_add;
Crystalline.DieudonneComplex.d_F; Crystalline.DieudonneComplex.alphaF_ofAlpha;
Crystalline.DieudonneComplex.alphaF_natural; Crystalline.IsSaturated.p_injective;
Crystalline.IsSaturated.F_injective; Crystalline.IsSaturated.F_range;
Crystalline.DieudonneComplex.IsSaturated.smul_mem_range;
Crystalline.DieudonneComplex.F_verschiebung; Crystalline.DieudonneComplex.verschiebung_F;
Crystalline.DieudonneComplex.F_d_verschiebung; Crystalline.verschiebung_FV;
Crystalline.verschiebung_VF; Crystalline.verschiebung_d; Crystalline.verschiebung_FdV;
Crystalline.verschiebung_injective; Crystalline.pBockstein_lift; Crystalline.pBockstein_square;
Crystalline.pBockstein_decalage; Crystalline.derivedPDecalage_model;
Crystalline.derivedPDecalage_cohomology; Crystalline.derivedPDecalage_completion.

CR.4.2 The Verschiebung filtration and the finite quotients:
Crystalline.DieudonneComplex.vFiltration_zero; Crystalline.mem_vFiltration;
Crystalline.vFiltration_zero; Crystalline.vFiltration_antitone; Crystalline.vFiltration_d;
Crystalline.Wmk_surjective; Crystalline.Wmk_eq_zero; Crystalline.Wcomplex_d_mk;
Crystalline.Wprojection_apply; Crystalline.Wprojection_surjective; Crystalline.Wprojection_kernel;
Crystalline.Wrestriction_mk; Crystalline.Wrestriction_surjective;
Crystalline.Wprojection_restriction; Crystalline.WF_mk; Crystalline.WF_d;
Crystalline.WF_restriction; Crystalline.WV_mk; Crystalline.WV_d; Crystalline.WV_restriction.

CR.4.4 Inputs on Witt vectors:
Crystalline.truncatedFrobenius_truncate; Crystalline.truncatedVerschiebung_truncate;
Crystalline.truncatedVerschiebung_injective; Crystalline.truncatedFrobenius_V;
Crystalline.truncatedVerschiebung_projection; Crystalline.truncatedRestriction_kernel;
Crystalline.truncatedVerschiebung_F_charP; Crystalline.wittFrobenius_injective_of_reduced;
Crystalline.witt_p_torsionFree_of_reduced; Crystalline.wittVerschiebung_pow;
Crystalline.wittVerschiebungDividedPowers_dpow; Crystalline.wittVerschiebungDividedPowers_map;
Crystalline.wittVerschiebungDividedPowers_unique; Crystalline.wittVerschiebungDividedPowers_Fp.

CR.4.5 Dieudonné algebras and the saturated de Rham–Witt complex:
Crystalline.satDRW_lift; Crystalline.satDRW_degree0; Crystalline.satDRW_map;
Crystalline.satDRW_degree0_F; Crystalline.satDRW_unit; Crystalline.satDRW_residue_seminormal;
Crystalline.satDRW_red; Crystalline.satDRW_ofLift.

CR.4.6 The classical and the relative de Rham–Witt complex:
Structural properties of the classical complex on smooth F_p-algebras:
Crystalline.classicalDRW_injective; Crystalline.classicalDRW_saturated;
Crystalline.classicalDRW_restriction_kernel; Crystalline.classicalDRW_strict;
Crystalline.classicalDRW_derived_limit.
Crystalline.cuspSeminormalComparison;
Crystalline.relativeDRW_lift; Crystalline.relativeDRW_zero; Crystalline.relativeDRW_map;
Crystalline.relativeDRW_generated; Crystalline.relativeDRW_base_quotient;
Crystalline.relativeDRW_lift_noRestriction; Crystalline.classicalDRW_lift;
Crystalline.classicalDRW_zero; Crystalline.classicalDRW_one; Crystalline.classicalDRW_generated;
Crystalline.classicalDRW_map; Crystalline.classicalDRW_toRelative;
Crystalline.classicalDRW_lift_degreeZero; Crystalline.continuousWitt_eval;
Crystalline.continuousWitt_map; Crystalline.continuousWitt_operators;
Crystalline.continuousWitt_fromRelative.

CR.4.7 Integral cohomological control:
Crystalline.wittCohomology_bounded_torsion; Crystalline.wittCohomology_free_quotient;
Crystalline.wittCohomology_V_complete.

CR.6.4 Sato’s homological de Rham–Witt complex:
Crystalline.SatoWitt.residue; Crystalline.SatoWitt.ordered_gr;
Crystalline.SatoWitt.absolute_map; Crystalline.SatoWitt.rational_compare.
Rigid cohomology of smooth strata:
Crystalline.smoothStratumRigid.frame_independence; Crystalline.smoothStratumRigid.finiteDimensional;
Crystalline.smoothStratumRigid.frobenius; Crystalline.smoothStratumRigid.proper_comparison.

CR.3:duality.1 The trace, duality and Gysin maps:
cechTraceSign_add; Crystalline.crysTrace_projective; Crystalline.crysTrace_reduction;
Crystalline.crysTrace_etale_local; Crystalline.crysTrace_iso; Crystalline.crysTrace_ekedahl;
Crystalline.crysTrace_frobenius; Crystalline.crysTrace_product;
Crystalline.finiteEtaleTransfer_scalar; Crystalline.finiteEtaleTransfer_projection;
Crystalline.finiteEtaleTransfer_trace; Crystalline.crysGysin_comp; Crystalline.crysGysin_projection;
Crystalline.crysGysin_trace; Crystalline.crysGysin_adjoint; Crystalline.crysGysin_frobenius;
Crystalline.crysDiagonal_action; Crystalline.crysDiagonal_triangles;
Crystalline.crysDiagonal_projective.

CR.5:log-algebra.1 Prelog rings, log structures and charts:
LogCrystalline.PrelogRing.hom_ext; LogCrystalline.PrelogRing.map_comp;
LogCrystalline.IsFineMonoid.finite_generators; LogCrystalline.IsSaturatedMonoid.root_closed;
LogCrystalline.IsSaturatedMonoid.saturation_lift; LogCrystalline.IsSaturatedMonoid.fs_integral.
CR.5:log-algebra.2–3 Kummer morphisms and Kummer étale morphisms:
LogCrystalline.IsKummer.identity; LogCrystalline.IsKummerEtale.kummer;
LogCrystalline.IsKummerEtale.logEtale; LogCrystalline.IsKummerEtale.root_chart.
SchemeAndStackFoundations §0.29 supplies absoluteFrobenius, schemeFrobeniusTwist and
relativeFrobenius. EnhancedDerivedSheaves §E2:towers.1 supplies derivedTowerLimit;
§E2.2 supplies IsReplete.derived_limits and IsReplete.milnor.

CR.6.1 Logarithmic de Rham–Witt complexes and their crystalline model:
LogCrystalline.logDeRhamWitt.restriction; LogCrystalline.logWittQuotient;
LogCrystalline.logWittPDDifferentials.

-/

end TauCetiRoadmap.CrystallineCohomology

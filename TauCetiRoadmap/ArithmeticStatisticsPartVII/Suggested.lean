import Mathlib

/-!
# Arithmetic statistics, Part VII: representative target signatures

The accompanying README is the full specification, with source locators and exact
supplier contracts. These suggested forms are not an exhaustive checklist.
This file gives light definitions and selected milestones on the pinned carriers. Counts retain the specified cutoffs and denominators; orbit,
moduli, covering and arithmetic probability constructions remain README targets.
-/

noncomputable section
open scoped BigOperators Topology
open Polynomial Filter

namespace TauCetiRoadmap.ArithmeticStatisticsPartVII

/-! ## Layer 5: Quadratic probability models and twist applications -/

namespace Distributions

/-- The dyadic zero-cokernel probability of §5.3 is the finite general-linear proportion. -/
theorem dyadic_zero_cokernel_probability (g : ℕ) :
    (Nat.card {F : Matrix (Fin g) (Fin g) (ZMod 2) // IsUnit (1 - F ^ 2).det} : ℝ) /
      (2 : ℝ) ^ (g * g) =
        ∏ i ∈ Finset.range g, (1 - (2 : ℝ) ^ (-((i + 1 : ℕ) : ℤ))) := by sorry

/-- The odd-prime zero-cokernel bound of §5.3 is uniform in the matrix size. -/
theorem odd_zero_cokernel_probability_lower_bound (p : ℕ) [Fact p.Prime]
    (hp : p ≠ 2) (g : ℕ) :
    let c := 2 * (∏' i : ℕ, (1 - (3 : ℝ) ^ (-((i + 1 : ℕ) : ℤ)))) - 1
    0 < c ∧ c ≤
      (Nat.card {F : Matrix (Fin g) (Fin g) (ZMod p) // IsUnit (1 - F ^ 2).det} : ℝ) /
        (p : ℝ) ^ (g * g) := by sorry

/-- The quadratic-isotropic, polar-self-orthogonal subspaces of §5.4. -/
def IsMaxIsotropic {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    (Q : QuadraticForm K V) (W : Submodule K V) : Prop :=
  (∀ v ∈ W, Q v = 0) ∧ LinearMap.BilinForm.orthogonal Q.polarBilin W = W

/-- The parameter set of maximal quadratic-isotropic subspaces in §5.4. -/
def maxIsotropicSubspaces {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    (Q : QuadraticForm K V) : Set (Submodule K V) :=
  {W | IsMaxIsotropic Q W}

/-- Weak metabolicity in §5.4 combines polar nondegeneracy with a maximal isotropic. -/
def IsWeaklyMetabolic {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    (Q : QuadraticForm K V) : Prop :=
  Q.polarBilin.Nondegenerate ∧ (maxIsotropicSubspaces Q).Nonempty

/-- Maximal isotropics have half the ambient dimension (§5.4). -/
theorem IsMaxIsotropic.finrank_eq {K V : Type*} [Field K] [AddCommGroup V]
    [Module K V] [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.polarBilin.Nondegenerate) (W : Submodule K V) (hW : IsMaxIsotropic Q W)
    (n : ℕ) (hdim : Module.finrank K V = 2 * n) : Module.finrank K W = n := by sorry

/-- Half-dimensional quadratic-isotropic subspaces are maximal (§5.4). -/
theorem isMaxIsotropic_iff_finrank {K V : Type*} [Field K] [AddCommGroup V]
    [Module K V] [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.polarBilin.Nondegenerate) (W : Submodule K V) (n : ℕ)
    (hdim : Module.finrank K V = 2 * n) :
    IsMaxIsotropic Q W ↔ (∀ w ∈ W, Q w = 0) ∧ Module.finrank K W = n := by sorry

/-- A quadratic isometry transports maximal isotropic subspaces (§5.4). -/
theorem IsMaxIsotropic.map_isometryEquiv {K V V' : Type*} [Field K]
    [AddCommGroup V] [Module K V] [AddCommGroup V'] [Module K V']
    (Q : QuadraticForm K V) (Q' : QuadraticForm K V') (f : Q.IsometryEquiv Q')
    (W : Submodule K V) (hW : IsMaxIsotropic Q W) :
    IsMaxIsotropic Q' (W.map f.toLinearEquiv.toLinearMap) := by sorry

/-- The hyperbolic plane has precisely its two coordinate axes as maximal isotropics (§5.4). -/
theorem maxIsotropicSubspaces_hyperbolicPlane (K : Type*) [Field K] :
    maxIsotropicSubspaces (QuadraticMap.proj 0 1 : QuadraticForm K (Fin 2 → K)) =
      {Submodule.span K {Pi.single (0 : Fin 2) (1 : K)},
       Submodule.span K {Pi.single (1 : Fin 2) (1 : K)}} := by sorry

/-- The number of maximal isotropic subspaces (§5.4), including characteristic two. -/
theorem card_maxIsotropicSubspaces {K V : Type*} [Field K] [Fintype K]
    [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    (Q : QuadraticForm K V) (hQ : IsWeaklyMetabolic Q) (n : ℕ)
    (hdim : Module.finrank K V = 2 * n) :
    Nat.card {W : Submodule K V // W ∈ maxIsotropicSubspaces Q} =
      ∏ i ∈ Finset.range n, (Fintype.card K ^ i + 1) := by sorry

/-- The intersection dimension generating function of §5.4 counts actual isotropic subspaces. -/
theorem maxIsotropic_intersection_generating_function {K V : Type*}
    [Field K] [Fintype K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    (Q : QuadraticForm K V) (hQ : IsWeaklyMetabolic Q) (n : ℕ)
    (hdim : Module.finrank K V = 2 * n) (W : Submodule K V)
    (hW : IsMaxIsotropic Q W) (z : ℝ) :
    (∑' Z : {Z : Submodule K V // Z ∈ maxIsotropicSubspaces Q},
      z ^ Module.finrank K ↥(Z.val ⊓ W)) =
      ∏ i ∈ Finset.range n, (z + (Fintype.card K : ℝ) ^ i) := by sorry

/-- The normalizing infinite product in the Poonen–Rains distribution (§5.5). -/
def poonenRainsConstant (p : ℕ) : ℝ :=
  ∏' i : ℕ, (1 + (p : ℝ) ^ (-(i : ℤ)))⁻¹

/-- The dimension weights of the Poonen–Rains distribution (§5.5). -/
def poonenRainsWeight (p d : ℕ) : ℝ :=
  poonenRainsConstant p * ∏ i ∈ Finset.range d, (p : ℝ) / ((p : ℝ) ^ (i + 1) - 1)

/-- The alternate product for the Poonen–Rains normalizing constant (§5.5). -/
theorem poonenRainsConstant_eq_half_prod (p : ℕ) (hp : p.Prime) :
    poonenRainsConstant p = (1 / 2 : ℝ) *
      ∏' i : ℕ, (1 - (p : ℝ) ^ (-(2 * (i : ℤ) + 1))) := by sorry

/-- Consecutive Poonen–Rains weights have the specified ratio (§5.5). -/
theorem poonenRainsWeight_succ (p d : ℕ) :
    poonenRainsWeight p (d + 1) = poonenRainsWeight p d *
      ((p : ℝ) / ((p : ℝ) ^ (d + 1) - 1)) := by sorry

/-- Every nonnegative dimension has positive Poonen–Rains weight (§5.5). -/
theorem poonenRainsWeight_pos (p : ℕ) (hp : p.Prime) (d : ℕ) :
    0 < poonenRainsWeight p d := by sorry

/-- The limiting weights in “Intersection law converges to Poonen Rains” have total mass one. -/
theorem poonenRainsWeight_total (p : ℕ) (hp : p.Prime) :
    Summable (poonenRainsWeight p) ∧ ∑' d, poonenRainsWeight p d = 1 := by sorry

/-- Poonen–Rains moments (§5.5) give every cardinality moment with its summability. -/
theorem poonenRainsWeight_moments (p : ℕ) (hp : p.Prime) (m : ℕ) :
    Summable (fun d => poonenRainsWeight p d * (p : ℝ) ^ (m * d)) ∧
      (∑' d, poonenRainsWeight p d * (p : ℝ) ^ (m * d)) =
        ∏ i ∈ Finset.range m, ((p : ℝ) ^ (i + 1) + 1) := by sorry

/-- Poonen–Rains parity (§5.5) assigns mass one half to each parity. -/
theorem poonenRainsWeight_parity (p : ℕ) (hp : p.Prime) (ε : ℕ) (hε : ε < 2) :
    (∑' d, poonenRainsWeight p (2 * d + ε)) = 1 / 2 := by sorry

/-- The corrected Delaunay law of §5.5 assigns this weight to Sha dimension `2n`. -/
def delaunayWeight (p r n : ℕ) : ℝ :=
  (p : ℝ) ^ (-((n * (2 * r + 2 * n - 1) : ℕ) : ℤ)) *
    (∏' i : ℕ, (1 - (p : ℝ) ^ (-(2 * ((r + n + i : ℕ) : ℤ) + 1)))) /
    ∏ i ∈ Finset.range n, (1 - (p : ℝ) ^ (-(2 * ((i + 1 : ℕ) : ℤ))))

/-- The zero-dimensional mass of the Delaunay law (§5.5). -/
theorem delaunayWeight_zero (p r : ℕ) :
    delaunayWeight p r 0 =
      ∏' i : ℕ, (1 - (p : ℝ) ^ (-(2 * ((r + i : ℕ) : ℤ) + 1))) := by sorry

/-- Every even Sha dimension has positive Delaunay weight (§5.5). -/
theorem delaunayWeight_pos (p : ℕ) (hp : p.Prime) (r n : ℕ) :
    0 < delaunayWeight p r n := by sorry

/-- Delaunay weights at every fixed rank form a probability law (§5.5). -/
theorem hasSum_delaunayWeight (p : ℕ) (hp : p.Prime) (r : ℕ) :
    HasSum (delaunayWeight p r) 1 := by sorry

/-- Delaunay compatibility of the Selmer model (§5.5) uniquely recovers the half-rank prior. -/
theorem delaunay_compatibility (p : ℕ) (hp : p.Prime) (ν : ℕ → ℝ)
    (hν : ∀ r, 0 ≤ ν r) (hsum : HasSum ν 1) :
    (∀ d, (∑ r ∈ Finset.range (d + 1),
      if (d - r) % 2 = 0 then ν r * delaunayWeight p r ((d - r) / 2) else 0) =
        poonenRainsWeight p d) ↔
      ∀ r, ν r = if r ≤ 1 then 1 / 2 else 0 := by sorry

/-- The rational finite alternating-kernel law of §5.6 retains zero diagonal at two. -/
def alternatingKernelLaw (p j n : ℕ) [Fact p.Prime] : ℚ :=
  (Nat.card {A : Matrix (Fin n) (Fin n) (ZMod p) //
    (∀ i, A i i = 0) ∧ A.transpose = -A ∧
      Module.finrank (ZMod p) (LinearMap.ker (Matrix.toLin' A)) = j} : ℚ) /
    (p : ℚ) ^ (n * (n - 1) / 2)

/-- The nondegenerate alternating matrix count of §5.6 applies in every characteristic. -/
theorem alternating_nondegenerate_proportion (p : ℕ) [Fact p.Prime] (m : ℕ)
    (hm : Even m) :
    (Nat.card {A : Matrix (Fin m) (Fin m) (ZMod p) //
      (∀ i, A i i = 0) ∧ A.transpose = -A ∧ IsUnit A.det} : ℚ) /
        (p : ℚ) ^ (m * (m - 1) / 2) =
      ∏ i ∈ Finset.range (m / 2), (1 - (p : ℚ) ^ (-(2 * (i : ℤ) + 1))) := by sorry

/-- Alternating kernel laws (§5.6) are supported on the parity of the matrix size. -/
theorem alternatingKernelLaw_eq_zero_of_parity (p : ℕ) [Fact p.Prime] (j n : ℕ)
    (h : j % 2 ≠ n % 2) : alternatingKernelLaw p j n = 0 := by sorry

/-- The finite alternating-kernel probabilities in §5.6 sum to one. -/
theorem sum_alternatingKernelLaw (p : ℕ) [Fact p.Prime] (n : ℕ) :
    ∑ j ∈ Finset.range (n + 1), alternatingKernelLaw p j n = 1 := by sorry

/-- Only the zero alternating matrix has full nullity (§5.6). -/
theorem alternatingKernelLaw_self (p : ℕ) [Fact p.Prime] (n : ℕ) :
    alternatingKernelLaw p n n = ((p : ℚ) ^ (n * (n - 1) / 2))⁻¹ := by sorry

/-- The closed alternating-kernel formula of §5.6 counts by the prescribed kernel. -/
theorem alternatingKernelLaw_eq_formula (p : ℕ) [Fact p.Prime] (j n : ℕ)
    (hjn : j ≤ n) (hparity : n % 2 = j % 2) :
    alternatingKernelLaw p j n =
      (p : ℚ) ^ (-((j * (j - 1) / 2 : ℕ) : ℤ)) *
      (∏ k ∈ Finset.range j,
        (1 - (p : ℚ) ^ (-((n - j + k + 1 : ℕ) : ℤ))) /
          (1 - (p : ℚ) ^ (-((k + 1 : ℕ) : ℤ)))) *
      ∏ k ∈ Finset.range ((n - j) / 2),
        (1 - (p : ℚ) ^ (-(2 * (k : ℤ) + 1))) := by sorry

/-- The parity-averaged alternating kernel law converges to Poonen–Rains (§5.6). -/
theorem alternatingKernelLimit_eq_poonenRains (p : ℕ) [Fact p.Prime] (j : ℕ) :
    Tendsto (fun n => ((alternatingKernelLaw p j (2 * n) : ℝ) +
      (alternatingKernelLaw p j (2 * n + 1) : ℝ)) / 2) atTop
      (𝓝 (poonenRainsWeight p j)) := by sorry

/-- The rank-zero Delaunay law is the even-size alternating kernel limit (§5.5). -/
theorem delaunayWeight_eq_alternatingCokernel (p : ℕ) [Fact p.Prime] (n : ℕ) :
    Tendsto (fun m => (alternatingKernelLaw p (2 * n) (2 * m) : ℝ)) atTop
      (𝓝 (delaunayWeight p 0 n)) := by sorry

/-- A continuous quadratic form whose polar adjoint is a topological group isomorphism. -/
structure LCQuadraticData (V : Type*) [AddCommGroup V] [TopologicalSpace V]
    [IsTopologicalAddGroup V] [T2Space V] [LocallyCompactSpace V] where
  quadratic : QuadraticMap ℤ V (AddCircle (1 : ℝ))
  continuous_quadratic : Continuous quadratic
  adjoint : V ≃ₜ+ (V →ₜ+ AddCircle (1 : ℝ))
  adjoint_apply : ∀ x y, adjoint x y = QuadraticMap.polar quadratic x y


namespace LCQuadraticData
variable {V : Type*} [AddCommGroup V] [TopologicalSpace V]
  [IsTopologicalAddGroup V] [T2Space V] [LocallyCompactSpace V]

/-- The polar diagonal is 2q(x), also in the dyadic case. -/
theorem polar_self (D : LCQuadraticData V) (x : V) :
    D.adjoint x x = (2 : ℤ) • D.quadratic x := by sorry

end LCQuadraticData

/-- Prime Selmer laws share one parity; the empty prime set has weight one. -/
def parityCoupledWeight (k : ℕ) (w : Fin k → ℕ → ℝ) (d : Fin k → ℕ) : ℝ :=
  if k = 0 then 1 else
    if ∀ i j, d i % 2 = d j % 2 then
      (2 : ℝ) ^ (k - 1) * ∏ i, w i (d i)
    else 0

/-- Half-mass in each parity normalizes the coupled finite-prime law. -/
theorem parityCoupledWeight_total {k : ℕ} (w : Fin k → ℕ → ℝ)
    (hw : ∀ i n, 0 ≤ w i n) (hs : ∀ i, Summable (w i))
    (he : ∀ i, (∑' n : ℕ, w i (2 * n)) = 1 / 2)
    (ho : ∀ i, (∑' n : ℕ, w i (2 * n + 1)) = 1 / 2) :
    Summable (parityCoupledWeight k w) ∧ ∑' d, parityCoupledWeight k w d = 1 := by sorry

/-- The split binary quadratic form retains quadratic vanishing in characteristic two. -/
def binaryHyperbolic : QuadraticForm (ZMod 2) (Fin 2 → ZMod 2) :=
  QuadraticMap.proj 0 1

/-- The anisotropic binary quadratic form over the field with two elements. -/
def binaryAnisotropic : QuadraticForm (ZMod 2) (Fin 2 → ZMod 2) :=
  QuadraticMap.proj 0 0 + QuadraticMap.proj 0 1 + QuadraticMap.proj 1 1

/-- The split quadratic form on four coordinates over the field with two elements. -/
def quaternaryHyperbolic : QuadraticForm (ZMod 2) (Fin 4 → ZMod 2) :=
  QuadraticMap.proj 0 1 + QuadraticMap.proj 2 3

/-- The dyadic value-group boundary of §5.26: exponent two need not force quadratic values
of order at most two, even when the diagonal is quadratic-isotropic. -/
theorem dyadic_quadratic_value_boundary :
    ∃ Q : QuadraticMap ℤ (Fin 2 → ZMod 2) (AddCircle (1 : ℝ)),
      (∀ v, Q v = (((((v 0).val : ℝ) ^ 2 - ((v 1).val : ℝ) ^ 2) / 4 : ℝ) :
        AddCircle (1 : ℝ))) ∧
      (∀ v, Q v = 0 ↔ v 0 = v 1) ∧
      (∃ v, (2 : ℤ) • Q v ≠ 0) := by sorry

/-- Uniform cardinality moments and parity recover every reduced dimension frequency. -/
theorem parity_sensitive_twist_moment_determinacy (ν : ℕ → ℕ → ℝ)
    (a : ℕ → ℝ)
    (ha : ∀ r, a r = (∏' i : ℕ, (1 + (2 : ℝ) ^ (-(i : ℤ)))⁻¹) *
      ∏ i ∈ Finset.range r, (2 : ℝ) / ((2 : ℝ) ^ (i + 1) - 1))
    (hnonneg : ∀ N r, 0 ≤ ν N r)
    (hprob : ∀ N, ∑' r, ν N r = 1)
    (hsum : ∀ N k : ℕ, Summable (fun r => ν N r * (2 : ℝ) ^ (k * r)))
    (hbound : ∀ k : ℕ, ∃ R : ℝ, ∀ N,
      ∑' r, ν N r * (2 : ℝ) ^ (k * r) ≤ R)
    (hmom : ∀ k : ℕ, Tendsto (fun N => ∑' r, ν N r * (2 : ℝ) ^ (k * r))
      atTop (𝓝 (∏ i ∈ Finset.range k, ((2 : ℝ) ^ (i + 1) + 1))))
    (hparity : Tendsto (fun N => ∑' r, (-1 : ℝ) ^ r * ν N r) atTop (𝓝 0)) :
    ∀ r, Tendsto (fun N => ν N r) atTop (𝓝 (a r)) := by sorry

end Distributions

/-- Finite subsets have density zero in any family with a growing finite denominator. -/
theorem finite_set_twist_density_zero {α : Type*} [DecidableEq α]
    (F : ℝ → Finset α) (B : Finset α)
    (hF : Tendsto (fun X => ((F X).card : ℝ)) atTop atTop) :
    Tendsto (fun X => (((F X) ∩ B).card : ℝ) / (F X).card) atTop (𝓝 0) := by sorry

universe u
open scoped DirectSum

/-- A bounded abelian group is a possibly infinite direct sum of finite cyclic groups. -/
theorem bounded_exponent_decomposition (n : ℕ) (hn : 0 < n)
    (A : Type u) [AddCommGroup A] (hA : ∀ a : A, n • a = 0) :
    ∃ (ι : Type u) (d : ι → ℕ), (∀ i, 0 < d i ∧ d i ∣ n) ∧
      Nonempty (A ≃+ ⨁ i, ZMod (d i)) := by sorry

/-- Injectivity modulo every divisor gives a retraction for groups of bounded exponent. -/
theorem bounded_exponent_splitting (n : ℕ) (hn : 0 < n)
    {A B : Type*} [AddCommGroup A] [AddCommGroup B]
    (hA : ∀ a : A, n • a = 0) (hB : ∀ b : B, n • b = 0) (f : A →+ B)
    (hpure : ∀ m : ℕ, m ∣ n → ∀ a : A, ∀ b : B,
      f a = m • b → ∃ a' : A, a = m • a') :
    ∃ r : B →+ A, r.comp f = AddMonoidHom.id A := by sorry

/-
The README also specifies CohenLenstraHeuristic, CohenLenstraMomentConjecture,
cohenMartinetPredictedMoment, CohenLenstraMartinetAverage,
CohenMartinetMomentConjecture, enhancedCokernelLaw,
EnhancedCohenLenstraConjecture, isotropicQuotientForm,
poonenRainsDistribution, IsSymplecticClass, alternatingCokernelLaw, bklprModel,
PoonenRainsSelmerConjecture, SelmerAverageConjecture, BKLPRSelmerConjecture,
signedTwistCorankCount, SmithTwistHypothesis, localSelmerRatio and its global
and twist variants, LCQuadraticData.orthogonal, weaklyMetabolic,
maximalIsotropics, squarefree_selmer_conjecture,
odd_degree_jacobian_conjecture, even_genus_two_selmer_conjecture,
injection_moment_conjecture and global_image_splitting_conjecture.

The API targets of README §§5.23–5.24 also include LCQuadraticData.mem_orthogonal,
LCQuadraticData.polar_formula, LCQuadraticData.adjoint_bijective,
LCQuadraticData.orthogonal_antitone, LCQuadraticData.weaklyMetabolic_iff,
LCQuadraticData.weaklyMetabolic_isotropic, LCQuadraticData.weaklyMetabolic_self_orthogonal,
LCQuadraticData.weaklyMetabolic_intersection_open, LCQuadraticData.maximalIsotropics_injective,
LCQuadraticData.maximalIsotropics_closed, LCQuadraticData.maximalIsotropics_isotropic,
LCQuadraticData.maximalIsotropics_self_orthogonal. The remaining elementary API of §5.25 is
parityCoupledWeight_empty, parityCoupledWeight_single, parityCoupledWeight_mixed and
parityCoupledWeight_nonneg.
-/

end TauCetiRoadmap.ArithmeticStatisticsPartVII

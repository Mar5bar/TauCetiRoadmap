/-
Suggested target forms, not an exhaustive checklist. The README is definitive.
New constructions and unproved targets use `sorry` honestly; native weights,
GT patterns, tableaux, Schur polynomials and polyhedral predicates are imported.
-/
import TauCeti.RepresentationTheory.ClassicalGroups.GelfandTsetlin.Tableau
import TauCeti.RepresentationTheory.ClassicalGroups.GelfandTsetlin.Count
import TauCeti.RingTheory.MvPolynomial.Symmetric.Schur.Basic
import TauCeti.Topology.PL.Map
import TauCeti.Geometry.Convex.Cone.Alternative
import Mathlib.Analysis.InnerProductSpace.Spectrum
import Mathlib.Analysis.Matrix.Spectrum
import Mathlib.LinearAlgebra.Matrix.Hermitian
import Mathlib.Topology.Instances.Int
import Mathlib.Tactic

noncomputable section
open scoped BigOperators
namespace TensorProductCombinatorics

/-- Finite barycentric lattice, with all three coordinates retained. -/
abbrev Vertex (n : ℕ) := {v : Fin 3 → Fin (n + 1) // ∑ i, (v i).val = n}

def origin (n : ℕ) : Vertex n :=
  ⟨![⟨n, by omega⟩, 0, 0], by simp [Fin.sum_univ_succ]⟩

def sqDist {n : ℕ} (a b : Vertex n) : ℤ :=
  ∑ i, (((a.1 i).val : ℤ) - ((b.1 i).val : ℤ))^2

/-- Corners0/2 lie on the short diagonal; corners1/3 on the long diagonal. -/
def IsRhombus {n : ℕ} (q : Fin 4 → Vertex n) : Prop :=
  sqDist (q 0) (q 1) = 2 ∧ sqDist (q 1) (q 2) = 2 ∧
  sqDist (q 2) (q 3) = 2 ∧ sqDist (q 3) (q 0) = 2 ∧
  sqDist (q 0) (q 2) = 2 ∧ sqDist (q 1) (q 3) = 6

structure Hive (n : ℕ) (R : Type*) [AddCommGroup R] [PartialOrder R] where
  value : Vertex n → R
  normalized : value (origin n) = 0
  rhombus : ∀ q : Fin 4 → Vertex n, IsRhombus q →
    value (q 1) + value (q 3) ≤ value (q 0) + value (q 2)

abbrev IntegerHive (n : ℕ) := Hive n ℤ
abbrev RealHive (n : ℕ) := Hive n ℝ

/-- Three cyclic edge paths A→B→C→A. -/
def edgePoint (n : ℕ) (s : Fin 3) (k : Fin (n + 1)) : Vertex n := by
  by_cases hs : s.val = 0
  · exact ⟨![⟨n-k.val, by omega⟩, k, 0], by simp [Fin.sum_univ_succ]; omega⟩
  by_cases hs₁ : s.val = 1
  · exact ⟨![0, ⟨n-k.val, by omega⟩, k], by simp [Fin.sum_univ_succ]; omega⟩
  · exact ⟨![k, 0, ⟨n-k.val, by omega⟩], by simp [Fin.sum_univ_succ]; omega⟩

def boundary {n : ℕ} {R : Type*} [AddCommGroup R] [PartialOrder R]
    (h : Hive n R) : Fin 3 → Fin n → R := fun s i =>
  h.value (edgePoint n s ⟨i.val+1, by omega⟩) -
    h.value (edgePoint n s ⟨i.val, by omega⟩)

theorem boundary_antitone {n : ℕ} (h : IntegerHive n) (s : Fin 3) :
    Antitone (boundary h s) := by sorry

theorem boundary_antitone_real {n : ℕ} (h : RealHive n) (s : Fin 3) :
    Antitone (boundary h s) := by sorry

theorem boundary_trace {n : ℕ} (h : IntegerHive n) :
    ∑ s, ∑ i, boundary h s i = 0 := by sorry

abbrev FixedIntegerHive {n : ℕ} (B : Fin 3 → Fin n → ℤ) :=
  {h : IntegerHive n // boundary h = B}

noncomputable instance {n : ℕ} (B : Fin 3 → Fin n → ℤ) :
    Finite (FixedIntegerHive B) := by sorry

def hiveCount {n : ℕ} (B : Fin 3 → Fin n → ℤ) : ℕ :=
  Nat.card (FixedIntegerHive B)

/-- The actual cast comparison, including the inequality proof. -/
def castReal {n : ℕ} : IntegerHive n → RealHive n := by sorry

theorem boundary_castReal {n : ℕ} (h : IntegerHive n) (s : Fin 3) (i : Fin n) :
    boundary (castReal h) s i = ((boundary (R := ℤ) h s i : ℤ) : ℝ) := by sorry

/-- Saturation requires the entire boundary to be integral. -/
theorem integral_witness_iff_real_witness {n : ℕ} (B : Fin 3 → Fin n → ℤ) :
    Nonempty (FixedIntegerHive B) ↔
      ∃ h : RealHive n, boundary h = fun s i => (B s i : ℝ) := by sorry

/-- Ambient real fibre predicate, using native polyhedron vocabulary. -/
def realFibre {n : ℕ} (B : Fin 3 → Fin n → ℝ) : Set (Vertex n → ℝ) :=
  {v | ∃ h : RealHive n, h.value = v ∧ boundary h = B}

theorem realFibre_polyhedron {n : ℕ} (B : Fin 3 → Fin n → ℝ) :
    TauCeti.IsConvexPolyhedron (realFibre B) := by sorry

theorem realFibre_compact {n : ℕ} (B : Fin 3 → Fin n → ℝ) :
    IsCompact (realFibre B) := by sorry

/-- Local octahedron move; all five input labels are visible. -/
def octahedronMove (a b c d e : ℤ) : ℤ := max (a+c) (b+d) - e

theorem octahedronMove_involutive (a b c d e : ℤ) :
    octahedronMove a b c d (octahedronMove a b c d e) = e := by
  unfold octahedronMove
  omega

/-- Native GT carrier: the image constraints and boundary formulas belong in the README. -/
def hiveToGT {n : ℕ} : IntegerHive n → TauCeti.GTPattern n := by sorry

theorem hiveToGT_injective_on_boundary {n : ℕ} (h k : IntegerHive n)
    (hB : boundary h = boundary k) (hP : hiveToGT h = hiveToGT k) : h = k := by sorry

def dualWeight {n : ℕ} (lam : TauCeti.DominantWeight n) : TauCeti.DominantWeight n := by
  refine ⟨fun i => -lam.1 i.rev, ?_⟩
  intro i j hij
  apply neg_le_neg
  exact lam.2 (by simpa using hij)

def productBoundary {n : ℕ} (lam μ γ : TauCeti.DominantWeight n) :
    Fin 3 → Fin n → ℤ := ![lam.1, μ.1, (dualWeight γ).1]

def LeftPair {n : ℕ} (lam μ ν π : TauCeti.DominantWeight n) :=
  Σ σ : TauCeti.DominantWeight n,
    FixedIntegerHive (productBoundary lam μ σ) ×
    FixedIntegerHive (productBoundary σ ν π)

def RightPair {n : ℕ} (lam μ ν π : TauCeti.DominantWeight n) :=
  Σ τ : TauCeti.DominantWeight n,
    FixedIntegerHive (productBoundary μ ν τ) ×
    FixedIntegerHive (productBoundary lam τ π)

/-- Must be built by the complete excavation, not selected from equal cardinalities. -/
def excavationAssociator {n : ℕ} (lam μ ν π : TauCeti.DominantWeight n) :
    LeftPair lam μ ν π ≃ RightPair lam μ ν π := by sorry

/-- The bounded-recurrence map, after the tableau comparison in H9. -/
def hiveCommutor {n : ℕ} (l m p : TauCeti.DominantWeight n) :
    FixedIntegerHive (productBoundary l m p) ≃
    FixedIntegerHive (productBoundary m l p) := by sorry

theorem hiveCommutor_twice {n : ℕ} (l m p : TauCeti.DominantWeight n)
    (h : FixedIntegerHive (productBoundary l m p)) :
    hiveCommutor m l p (hiveCommutor l m p h) = h := by sorry

/-- Finite binary-word index; positions are the Grassmannian subspace convention. -/
abbrev BinaryWord (N k : ℕ) :=
  {w : Fin N → Bool // (Finset.univ.filter fun i => w i = true).card = k}

/-- Native finite module underlying the puzzle ring. -/
abbrev PuzzleModule (N k : ℕ) := BinaryWord N k →₀ ℤ

/-- Reindex the native sorted matrix spectrum to Fin n; no private spectral construction. -/
def nativeMatrixSpectrum {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ)
    (hA : A.IsHermitian) : Fin n → ℝ := fun i =>
  hA.eigenvalues₀ (Fin.cast (by simp) i)

def HasSpectrum {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ) (α : Fin n → ℝ) : Prop :=
  ∃ hA : A.IsHermitian, α = nativeMatrixSpectrum A hA

theorem hasSpectrum_iff_charpoly {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ)
    (α : Fin n → ℝ) :
    HasSpectrum A α ↔ A.IsHermitian ∧ Antitone α ∧
      A.charpoly = ∏ i, (Polynomial.X - Polynomial.C (α i : ℂ)) := by sorry

/-- Native matrix objects, sorted real spectra and a genuine zero-sum condition. -/
def HermitianTripleFeasible {n : ℕ} (B : Fin 3 → Fin n → ℝ) : Prop :=
  ∃ A : Fin 3 → Matrix (Fin n) (Fin n) ℂ,
    (∀ s, HasSpectrum (A s) (B s)) ∧ ∑ s, A s = 0

theorem hermitian_iff_hive {n : ℕ} (B : Fin 3 → Fin n → ℝ) :
    HermitianTripleFeasible B ↔ ∃ h : RealHive n, boundary h = B := by sorry


/-- An unordered unit triangle in the same finite lattice. -/
abbrev UnitTriangle (n : ℕ) := {t : Finset (Vertex n) //
  t.card = 3 ∧ ∀ a ∈ t, ∀ b ∈ t, a ≠ b → sqDist a b = 2}

/-- Signed dual-edge normal in the integral coordinate-direction plane.
The construction assigns zero to non-adjacent triangles. -/
def finiteEdgeDirection {n : ℕ} : UnitTriangle n → UnitTriangle n → Fin 3 → ℤ := by sorry

structure HoneycombConfiguration (n : ℕ) where
  position : UnitTriangle n → Fin 3 → ℝ
  sum_zero : ∀ t, ∑ k, position t k = 0
  oriented_edge : ∀ t u, (t.1 ∩ u.1).card = 2 →
    ∃ r : ℝ, 0 ≤ r ∧ ∀ k,
      position u k - position t k = r * (finiteEdgeDirection t u k : ℝ)

/-- Fixed dual graph, before contractions and coincident-edge diagram quotient. -/
def hiveHoneycombEquiv (n : ℕ) : RealHive n ≃ HoneycombConfiguration n := by sorry

/-- A finite rational path presentation; H8 constructs the reparametrization quotient. -/
structure RationalPath (n : ℕ) where
  segments : ℕ
  time : Fin (segments+1) → ℚ
  vertex : Fin (segments+1) → Fin n → ℚ
  time_strict : StrictMono time
  time_start : time 0 = 0
  time_end : time (Fin.last segments) = 1
  vertex_start : vertex 0 = 0
  end_integral : ∀ i, ∃ z : ℤ, vertex (Fin.last segments) i = (z : ℚ)

def pathEndpoint {n : ℕ} (p : RationalPath n) : Fin n → ℚ :=
  p.vertex (Fin.last p.segments)

/-- Ambient running-extremum operator on the canonical representative. -/
def pathRaise {n : ℕ} : Fin (n-1) → RationalPath n →
    Option (RationalPath n) := by sorry

def simpleRoot {n : ℕ} (i : Fin (n-1)) : Fin n → ℚ := fun j =>
  (if j.val = i.val then 1 else 0) - (if j.val = i.val+1 then 1 else 0)

theorem pathRaise_endpoint {n : ℕ} (i : Fin (n-1)) (p q : RationalPath n)
    (h : pathRaise i p = some q) :
    pathEndpoint q = pathEndpoint p + simpleRoot i := by sorry

abbrev FixedRealHive {n : ℕ} (B : Fin 3 → Fin n → ℝ) :=
  {h : RealHive n // boundary h = B}

/-- Antitone real boundary weights retain all continuous intermediate labels. -/
abbrev RealDominantWeight (n : ℕ) := {w : Fin n → ℝ // Antitone w}

def dualRealWeight {n : ℕ} (l : RealDominantWeight n) : RealDominantWeight n := by
  refine ⟨fun i => -l.1 i.rev, ?_⟩
  intro i j hij
  apply neg_le_neg
  exact l.2 (by simpa using hij)

def realProductBoundary {n : ℕ} (l m p : RealDominantWeight n) :
    Fin 3 → Fin n → ℝ := ![l.1, m.1, (dualRealWeight p).1]

/-- The real associator includes real intermediate weights, even at integral outer boundary. -/
def realExcavationAssociator {n : ℕ} (l m v p : RealDominantWeight n) :
    (Σ s : RealDominantWeight n,
      FixedRealHive (realProductBoundary l m s) ×
      FixedRealHive (realProductBoundary s v p)) ≃
    (Σ t : RealDominantWeight n,
      FixedRealHive (realProductBoundary m v t) ×
      FixedRealHive (realProductBoundary l t p)) := by sorry

/-- Orientation determinant in coordinates (z,y); negative is clockwise. -/
def orientation {n : ℕ} (a b c : Vertex n) : ℤ :=
  (((b.1 2).val : ℤ)-((a.1 2).val : ℤ))*(((c.1 1).val : ℤ)-((a.1 1).val : ℤ)) -
  (((b.1 1).val : ℤ)-((a.1 1).val : ℤ))*(((c.1 2).val : ℤ)-((a.1 2).val : ℤ))

def vertexCode {n : ℕ} (a : Vertex n) : ℕ :=
  (a.1 0).val + (n+1)*(a.1 1).val + (n+1)^2*(a.1 2).val

/-- Choose the smaller obtuse corner as corner0, eliminating rotational duplicates. -/
abbrev PuzzleRhombus (n : ℕ) := {q : Fin 4 → Vertex n //
  IsRhombus q ∧ orientation (q 0) (q 1) (q 2) < 0 ∧
    vertexCode (q 0) < vertexCode (q 2)}

abbrev PuzzlePiece (n : ℕ) := (UnitTriangle n × Bool) ⊕ PuzzleRhombus n

/-- One monochromatic triangle or the two triangles on a rhombus's short diagonal. -/
def pieceCells {n : ℕ} : PuzzlePiece n → Finset (UnitTriangle n) := by sorry

/-- Some0/1 only on outer edges of the piece; every other edge returns none.
Rhombus labels alternate true,false,true,false clockwise from its corner0. -/
def pieceLabel {n : ℕ} : PuzzlePiece n → Finset (Vertex n) → Option Bool := by sorry

structure Puzzle (n : ℕ) where
  tiles : Finset (PuzzlePiece n)
  covers_once : ∀ t : UnitTriangle n, ∃! p,
    p ∈ tiles ∧ t ∈ pieceCells p
  edge_matches : ∀ p ∈ tiles, ∀ q ∈ tiles, ∀ e, ∀ a b : Bool,
    pieceLabel p e = some a → pieceLabel q e = some b → a = b

/-- Reads each outer edge along the cyclic edgePoint s path. -/
def puzzleBoundary {n : ℕ} : Puzzle n → Fin 3 → Fin n → Bool := by sorry

theorem puzzle_boundary_balance {n : ℕ} (p : Puzzle n) (s t : Fin 3) :
    (Finset.univ.filter fun i => puzzleBoundary p s i = true).card =
    (Finset.univ.filter fun i => puzzleBoundary p t i = true).card := by sorry

end TensorProductCombinatorics

import Mathlib
import TauCeti.AlgebraicTopology.Singular.Twisted.Relative
import TauCeti.AlgebraicTopology.Cohomology.Kronecker
import TauCeti.AlgebraicTopology.Cohomology.HomotopyInvariance
import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic
import TauCeti.AlgebraicTopology.Cohomology.Basic
import TauCeti.AlgebraicTopology.Cohomology.Twisted.Relative
import TauCeti.AlgebraicTopology.Cohomology.Cap.Basic
import TauCeti.AlgebraicTopology.Cohomology.Cup
import TauCeti.AlgebraicTopology.Cellular.Comparison
import TauCeti.AlgebraicTopology.Cellular.Coproduct
import TauCeti.AlgebraicTopology.FundamentalGroupoid.Cech.Colimit
import TauCeti.AlgebraicTopology.Singular.Excision
import TauCeti.AlgebraicTopology.Singular.MayerVietoris.Basic
import TauCeti.AlgebraicTopology.Singular.Twisted.Functoriality
import TauCeti.AlgebraicTopology.Singular.EilenbergZilber
import TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.Singular

/-!
# Algebraic topology of spaces and manifolds: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The declarations below suggest Lean forms for load-bearing interfaces in Mathlib's
vocabulary; proving them does not by itself finish a stage or the roadmap.
-/

namespace TauCetiRoadmap.AlgebraicTopology

open CategoryTheory ContinuousMap Topology
open CategoryTheory.Limits
open scoped ContDiff Manifold Topology TensorProduct Simplicial

noncomputable section

universe u

private abbrev SingularChains (R : Type u) [CommRing R] (M : ModuleCat.{u} R)
    (X : TopCat.{u}) : ChainComplex (ModuleCat.{u} R) ℕ :=
  ((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).obj X

private abbrev SingularHomology (R : Type u) [CommRing R] (M : ModuleCat.{u} R)
    (X : TopCat.{u}) (n : ℕ) : ModuleCat.{u} R :=
  ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} R) n).obj M).obj X

/-! ## Existing anchors -/

/-- Relative topology uses Mathlib's category of embedded topological pairs. -/
example {X : TopCat} (A : Set X) : TopPair :=
  TopPair.ofSubset A

/-- Ordinary singular chains remain the absolute chain functor used by the relative theory. -/
noncomputable example (R : Type u) [CommRing R] :
    ModuleCat.{u} R ⥤ TopCat.{u} ⥤ ChainComplex (ModuleCat.{u} R) ℕ :=
  AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)

/-- Cellular chains are built from Mathlib's actual cells, not from a record of cell counts. -/
example {X : Type*} [TopologicalSpace X] (C : Set X) [CWComplex C] (n : ℕ) : Type _ :=
  Topology.CWComplex.cell C n

/-! ## Relative chains and homology -/

/-- The relative singular-chain functor. The implementation factors through `SSetPair`. -/
noncomputable abbrev relativeSingularChainComplex (R : Type*) [CommRing R] :
    ModuleCat.{u} R ⥤ TopPair.{u} ⥤ ChainComplex (ModuleCat.{u} R) ℕ :=
  TopPair.singularChainComplexFunctor (ModuleCat.{u} R)

/-- Relative singular homology, functorial in its coefficient module and in maps of pairs. -/
noncomputable def relativeSingularHomology (R : Type*) [CommRing R] (n : ℕ) :
    ModuleCat.{u} R ⥤ TopPair.{u} ⥤ ModuleCat.{u} R :=
  relativeSingularChainComplex R ⋙
    (Functor.whiskeringRight _ _ _).obj
      (HomologicalComplex.homologyFunctor (ModuleCat.{u} R) (ComplexShape.down ℕ) n)

/-- The quotient of absolute chains on `X` by absolute chains on `A`. -/
noncomputable def relativeChainQuotient (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) (X : TopPair.{u}) : ChainComplex (ModuleCat.{u} R) ℕ :=
  cokernel (((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).map X.map)

/-- The `SSetPair` construction is naturally the quotient `C_*(X) / C_*(A)`. -/
noncomputable def relativeSingularChainComplexIsoQuotient (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) (X : TopPair.{u}) :
    (((relativeSingularChainComplex R).obj M).obj X) ≅ relativeChainQuotient R M X :=
  (X.isColimitCokernelCoforkSingularChainComplex M).coconePointUniqueUpToIso
    (colimit.isColimit _)

/-- The native chain-level sequence retains the actual relative-chain quotient map. -/
noncomputable abbrev relativeChainShortComplex (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) (X : TopPair.{u}) :
    ShortComplex (ChainComplex (ModuleCat.{u} R) ℕ) :=
  X.singularChainComplexShortComplex M

/-- Exactness is already proved by the native relative-chain construction. -/
theorem relativeChainShortComplex_shortExact (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) (X : TopPair.{u}) :
    (relativeChainShortComplex R M X).ShortExact :=
  X.shortExact_singularChainComplexShortComplex M

/-! ## Groupoid van Kampen -/

/-- The native Čech diagram uses nonempty finite intersections in `Grpd`. -/
noncomputable abbrev cechFundamentalGroupoidDiagram {X : TopCat.{u}} {ι : Type u}
    (U : ι → TopologicalSpace.Opens X) :=
  TauCeti.FundamentalGroupoid.cechDiagram U

noncomputable abbrev cechFundamentalGroupoidCocone {X : TopCat.{u}} {ι : Type u}
    (U : ι → TopologicalSpace.Opens X) :=
  TauCeti.FundamentalGroupoid.cechCocone U

/-- Van Kampen is already implemented; further targets consume this colimit. -/
noncomputable def fundamentalGroupoid_openCover_isColimit {X : TopCat.{u}} {ι : Type u}
    (U : ι → TopologicalSpace.Opens X) (hU : TopologicalSpace.IsOpenCover U) :
    IsColimit (cechFundamentalGroupoidCocone U) :=
  TauCeti.FundamentalGroupoid.isColimitCechCocone (U := U) hU

/-! ## Excision and Mayer--Vietoris -/

/-- Native excision supplies the actual pair inclusion and its homology isomorphism. -/
example (R : Type u) [CommRing R] (N : ModuleCat.{u} R) {X : TopCat.{u}}
    (A Z : Set X) (h : closure Z ⊆ interior A) (n : ℕ) :
    IsIso (TopPair.singularHomologyMap (TopPair.excisionMap Zᶜ A) N n) :=
  TopPair.isIso_singularHomologyMap_excisionMap_compl N A Z h n

/-- The native connecting morphism includes the small-chain comparison. -/
noncomputable abbrev mayerVietorisConnecting (R : Type u) [CommRing R]
    (N : ModuleCat.{u} R) {X : TopCat.{u}} (U V : Set X)
    (hU : IsOpen U) (hV : IsOpen V) (hUV : U ∪ V = Set.univ)
    (n m : ℕ) (h : m + 1 = n) :=
  TopCat.mayerVietorisδ N hU hV hUV n m h

/-! ## Cellular comparison -/

/-- The existing cellular carrier includes relative skeleta and triple differentials. -/
noncomputable abbrev cellularChainComplex (R : Type u) [CommRing R]
    (X : Type u) [TopologicalSpace X] [T2Space X] [CWComplex (Set.univ : Set X)] :
    ChainComplex (ModuleCat.{u} R) ℕ :=
  TauCeti.cellularChainComplex (Set.univ : Set X) (ModuleCat.of R R)

/-- The finite-dimensional comparison is native, with exact module coproducts. -/
noncomputable example (R : Type u) [CommRing R] (X : Type u)
    [TopologicalSpace X] [T2Space X] [CWComplex (Set.univ : Set X)]
    [Topology.RelCWComplex.FiniteDimensional (Set.univ : Set X)] (n : ℕ) :
    (cellularChainComplex R X).homology n ≅
      (TauCeti.complexBasePair (Set.univ : Set X)).singularHomology (ModuleCat.of R R) n :=
  TauCeti.cellularSingularHomologyIso (Set.univ : Set X) (ModuleCat.of R R) n

/-- A chosen representative on the native complex; naturality is only up to chain homotopy. -/
noncomputable def cellularToSingular (R : Type u) [CommRing R]
    (X : Type u) [TopologicalSpace X] [T2Space X] [CWComplex (Set.univ : Set X)] :
    cellularChainComplex R X ⟶ SingularChains R (ModuleCat.of R R) (TopCat.of X) := by
  sorry

theorem cellularToSingular_quasiIso (R : Type u) [CommRing R]
    (X : Type u) [TopologicalSpace X] [T2Space X] [CWComplex (Set.univ : Set X)] :
    QuasiIso (cellularToSingular R X) := by
  sorry

/-! ## Finite covers, transfer, and Cartan--Leray -/

/-- A finite cover of constant degree. General finite covers are handled componentwise. -/
structure FiniteCover (E B : TopCat.{u}) where
  p : E ⟶ B
  isCoveringMap : IsCoveringMap p
  degree : ℕ
  finite_fiber : ∀ b : B, Finite {e : E // p e = b}
  fiber_card : ∀ b : B, Nat.card {e : E // p e = b} = degree

noncomputable def finiteCoverTransfer (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) {E B : TopCat.{u}} (D : FiniteCover E B) :
    SingularChains R M B ⟶ SingularChains R M E := by
  sorry

theorem finiteCover_transfer_push (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) {E B : TopCat.{u}} (D : FiniteCover E B) :
    finiteCoverTransfer R M D ≫
      ((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).map D.p =
        D.degree • 𝟙 _ := by
  sorry

/-- A regular deck action; simple transitivity is stated on each fibre. -/
structure RegularDeckAction {E B : TopCat.{u}} (D : FiniteCover E B)
    (G : Type u) [Group G] where
  deck : G →* Homeomorph E E
  commutes : ∀ g x, D.p (deck g x) = D.p x
  simplyTransitive : ∀ {x y : E}, D.p x = D.p y → ∃! g, deck g x = y

theorem finiteCover_push_transfer_regular (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) {E B : TopCat.{u}} (D : FiniteCover E B)
    (G : Type u) [Group G] [Fintype G] (A : RegularDeckAction D G) :
    ((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).map D.p ≫
      finiteCoverTransfer R M D =
        ∑ g : G,
            ((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).map
            (TopCat.ofHom ⟨A.deck g, (A.deck g).continuous_toFun⟩) := by
  sorry

/-- An `R[G]`-module expressed without introducing a second module category. -/
structure GroupModule (R : Type u) [CommRing R] (G : Type u) [Group G] where
  M : ModuleCat.{u} R
  action : Representation R G M

/-- Group homology, implemented from the bar resolution. -/
noncomputable def groupHomology (R : Type u) [CommRing R] (G : Type u) [Group G]
    (M : GroupModule R G) (n : ℕ) : ModuleCat.{u} R := by
  sorry

noncomputable def coverHomologyGroupModule (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) {E B : TopCat.{u}} (D : FiniteCover E B)
    (G : Type u) [Group G] (A : RegularDeckAction D G) (q : ℕ) : GroupModule R G := by
  sorry

noncomputable def cartanLeraySpectralSequence (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) {E B : TopCat.{u}} (D : FiniteCover E B)
    (G : Type u) [Group G] [Fintype G] (A : RegularDeckAction D G) :
    SpectralSequence (ModuleCat.{u} R)
      (fun r ↦ ComplexShape.spectralSequenceNat ⟨-r, r - 1⟩) 2 := by
  sorry

noncomputable def cartanLerayE2Iso (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) {E B : TopCat.{u}} (D : FiniteCover E B)
    (G : Type u) [Group G] [Fintype G] (A : RegularDeckAction D G) (p q : ℕ) :
    ((cartanLeraySpectralSequence R M D G A).page 2).X ⟨p, q⟩ ≅
      groupHomology R G (coverHomologyGroupModule R M D G A q) p := by
  sorry

/-- The native Alexander–Whitney/shuffle equivalence supplies the constant-coefficient
product maps; local coefficients and Kunneth are extensions of this interface. -/
noncomputable abbrev nativeEilenbergZilber (R : Type u) [CommRing R]
    (X Y : TopCat.{u}) :=
  TopCat.eilenbergZilberHomotopyEquiv X Y (ModuleCat.of R R) (ModuleCat.of R R)

/-! ## Local coefficients, cap products, and duality -/

abbrev LocalCoefficientSystem (R : Type u) [CommRing R] (X : TopCat.{u}) :=
  TauCeti.LocalCoefficientSystem.{u, u, u} R X

noncomputable abbrev twistedSingularChainComplex (R : Type u) [CommRing R]
    (X : TopCat.{u}) (L : LocalCoefficientSystem R X) :
    ChainComplex (ModuleCat.{u} R) ℕ := L.twistedChainComplex

/-- Native Hom-of-twisted-chains cochains compute the dual-system convention. -/
noncomputable abbrev dualSystemRelativeCochainComplex (R : Type u) [CommRing R]
    (P : TopPair.{u}) (L : LocalCoefficientSystem R P.fst) :
    CochainComplex (ModuleCat.{u} R) ℕ :=
  P.twistedCochainComplex L R (ModuleCat.of R R)

noncomputable abbrev singularCohomology (R : Type u) [CommRing R]
    (X : TopCat.{u}) (n : ℕ) : ModuleCat.{u} R :=
  X.singularCohomology (ModuleCat.of R R) R (ModuleCat.of R R) n

/-- Cap product with the Alexander--Whitney sign convention.  With natural-number grading the
complementary-degree hypothesis prevents truncated subtraction from pretending that a negative
target degree is degree zero. -/
noncomputable def capProduct (R : Type u) [CommRing R] (X : TopCat.{u}) (p q : ℕ)
    (hpq : p ≤ q) :
    singularCohomology R X p ⟶
      ModuleCat.of R (SingularHomology R (ModuleCat.of R R) X q →ₗ[R]
        SingularHomology R (ModuleCat.of R R) X (q - p)) :=
  ModuleCat.ofHom ((ModuleCat.homLinearEquiv (S := R)).toLinearMap.comp
    (X.singularCap R (MonoidalCategory.leftUnitor (ModuleCat.of R R)).inv (MonoidalCategory.leftUnitor (ModuleCat.of R R)).hom
      p (q - p) q (Nat.add_sub_of_le hpq)))

/-- Native cup product with the same Alexander–Whitney pairing and degree pin. -/
noncomputable def cupProduct (R : Type u) [CommRing R] (X : TopCat.{u}) (p q : ℕ) :
    singularCohomology R X p →ₗ[R] singularCohomology R X q →ₗ[R]
      singularCohomology R X (p + q) :=
  X.singularCup R (MonoidalCategory.leftUnitor (ModuleCat.of R R)).inv
    (MonoidalCategory.leftUnitor (ModuleCat.of R R)).hom p q (p + q) rfl

/-- The pair `(X, X \ {x})` used to define local homology. -/
noncomputable def puncturedPair (X : TopCat.{u}) (x : X) : TopPair.{u} :=
  TopPair.ofSubset ({x}ᶜ : Set X)

/-- Relative twisted chains use the coefficient system on the ambient space.
Coefficients are at the first vertex; the zeroth face transports along its first edge. -/
noncomputable abbrev twistedRelativeSingularChainComplex (R : Type u) [CommRing R]
    (P : TopPair.{u}) (L : LocalCoefficientSystem R P.fst) :
    ChainComplex (ModuleCat.{u} R) ℕ := P.twistedChainComplex L

noncomputable abbrev twistedRelativeHomology (R : Type u) [CommRing R]
    (P : TopPair.{u}) (L : LocalCoefficientSystem R P.fst) (n : ℕ) : ModuleCat.{u} R :=
  (twistedRelativeSingularChainComplex R P L).homology n

/-- Forget the coefficient ring through the native exact restriction-of-scalars functor. -/
noncomputable abbrev restrictCoefficientSystem (R : Type) [CommRing R] (X : TopCat)
    (L : LocalCoefficientSystem R X) : LocalCoefficientSystem ℤ X :=
  L ⋙ ModuleCat.restrictScalars (Int.castRingHom R)

/-- Scalar restriction commutes with relative twisted chains, sending every relative
simplex with coefficient ℓ to that same simplex with coefficient ℓ. -/
noncomputable def twistedRestrictScalarsChainIso (R : Type) [CommRing R]
    (P : TopPair) (L : LocalCoefficientSystem R P.fst) :
    P.twistedChainComplex (restrictCoefficientSystem R P.fst L) ≅
      ((ModuleCat.restrictScalars (Int.castRingHom R)).mapHomologicalComplex
        (ComplexShape.down ℕ)).obj (P.twistedChainComplex L) := by
  sorry

/-- This generator identity fixes the scalar-comparison map, including its sign. -/
theorem twistedRestrictScalarsChainIso_simplex (R : Type) [CommRing R]
    (P : TopPair) (L : LocalCoefficientSystem R P.fst) (k : ℕ)
    (σ : (TopCat.toSSet.obj P.fst).obj (Opposite.op (SimplexCategory.mk k)))
    (ℓ : L.obj (TauCeti.LocalCoefficientSystem.initialVertex σ)) :
    (twistedRestrictScalarsChainIso R P L).hom.f k
      ((P.twistedChainComplexπ (restrictCoefficientSystem R P.fst L)).f k
        ((restrictCoefficientSystem R P.fst L).ιTwistedChainComplex k σ ℓ)) =
      (P.twistedChainComplexπ L).f k (L.ιTwistedChainComplex k σ ℓ) := by
  sorry

/-- Homology comparison is induced by the normalized chain isomorphism and the native
exact-functor homology comparison, rather than a separately chosen fibre isomorphism. -/
noncomputable def twistedRestrictScalarsHomologyIso (R : Type) [CommRing R]
    (P : TopPair) (L : LocalCoefficientSystem R P.fst) (n : ℕ) :
    twistedRelativeHomology ℤ P (restrictCoefficientSystem R P.fst L) n ≅
      (ModuleCat.restrictScalars (Int.castRingHom R)).obj
        (twistedRelativeHomology R P L n) :=
  HomologicalComplex.homologyMapIso (twistedRestrictScalarsChainIso R P L) n ≪≫
    ((P.twistedChainComplex L).sc n).mapHomologyIso
      (ModuleCat.restrictScalars (Int.castRingHom R))

/-- Actual inclusion from a pair to the pair punctured at a point outside its subspace. -/
noncomputable def relativeLocalPairMap (P : TopPair.{u}) (x : P.fst)
    (hx : x ∉ Set.range (P.map : P.snd → P.fst)) : P ⟶ puncturedPair P.fst x :=
  TopPair.ofHom (𝟙 P.fst)
    (TopCat.ofHom ⟨fun a => ⟨P.map a, by
      change P.map a ≠ x
      intro h
      exact hx ⟨a, h⟩⟩,
      P.map.hom.continuous.subtype_mk _⟩)

/-- The local image is native homology functoriality, with the identity-pullback comparison. -/
noncomputable def twistedRelativeLocalMap (R : Type u) [CommRing R]
    (P : TopPair.{u}) (L : LocalCoefficientSystem R P.fst) (n : ℕ) (x : P.fst)
    (hx : x ∉ Set.range (P.map : P.snd → P.fst)) :
    twistedRelativeHomology R P L n ⟶
      twistedRelativeHomology R (puncturedPair P.fst x) L n :=
  P.twistedHomologyCoefficientMap
    ((TauCeti.LocalCoefficientSystem.pullbackIdIso P.fst).app L).inv n ≫
    TopPair.twistedHomologyMap (relativeLocalPairMap P x hx) L n

/-- A relative class with specified local normalization. AT6.3 constructs the canonical
local generators for the orientation system; no arbitrary pair receives an existence theorem. -/
structure RelativeTwistedClassDatum (R : Type u) [CommRing R]
    (P : TopPair.{u}) (L : LocalCoefficientSystem R P.fst) (n : ℕ)
    (localGenerator : ∀ x : P.fst, x ∉ Set.range (P.map : P.snd → P.fst) →
      twistedRelativeHomology R (puncturedPair P.fst x) L n) where
  fundamentalClass : twistedRelativeHomology R P L n
  local_eq : ∀ x hx, twistedRelativeLocalMap R P L n x hx fundamentalClass =
    localGenerator x hx

/-- The interior set and its openness are native Mathlib declarations. -/
example (m : ℕ) {H M : Type} [TopologicalSpace H] [TopologicalSpace M]
    (I : ModelWithCorners ℝ (EuclideanSpace ℝ (Fin m)) H)
    [ChartedSpace H M] [IsManifold I ∞ M] : IsOpen (I.interior M) :=
  I.isOpen_interior (M := M) (n := ∞) (by simp)

/-- Rechart the native interior subtype in the boundaryless model using interior chart targets. -/
@[instance_reducible]
noncomputable def boundarylessInteriorAtlas (m : ℕ) {H M : Type}
    [TopologicalSpace H] [TopologicalSpace M]
    (I : ModelWithCorners ℝ (EuclideanSpace ℝ (Fin m)) H)
    [ChartedSpace H M] [IsManifold I ∞ M] :
    ChartedSpace (EuclideanSpace ℝ (Fin m)) (I.interior M) := by
  sorry

/-- The interior inherits the smoothness of the original atlas. -/
theorem boundarylessInterior_isManifold (m : ℕ) {H M : Type}
    [TopologicalSpace H] [TopologicalSpace M]
    (I : ModelWithCorners ℝ (EuclideanSpace ℝ (Fin m)) H)
    [ChartedSpace H M] [IsManifold I ∞ M] :
    letI := boundarylessInteriorAtlas m (M := M) I
    IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ (I.interior M) := by
  sorry

/-- Boundaryless orientation system; the README additionally specifies the collar extension
for half-space models and comparison with the smooth tangent orientation. -/
noncomputable def orientationLocalSystem (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M] :
    LocalCoefficientSystem ℤ (TopCat.of M) where
  obj := fun x => twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x.as)
    ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
      (ModuleCat.of ℤ ℤ)) m
  map := by sorry
  map_id := by sorry
  map_comp := by sorry

/-- The orientation fibre is integral local top homology, not a separately chosen sign module. -/
noncomputable def orientationLocalSystemFiberIso (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M] (x : M) :
    (orientationLocalSystem m M).obj ⟨x⟩ ≅
      twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)
        ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
          (ModuleCat.of ℤ ℤ)) m := Iso.refl _

/-- The square orientation pairing is natural in paths, not merely a fibrewise choice.
`orientationFiberSquareIso_self` pins its o⊗o normalization. Since each fibre
is free of rank one over ℤ, this normalization makes the pairing unique and
compatible with orientation transport. -/
noncomputable def orientationFiberSquareIso (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M] (x : M) :
    ((orientationLocalSystem m M).obj ⟨x⟩) ⊗[ℤ]
      ((orientationLocalSystem m M).obj ⟨x⟩) ≃ₗ[ℤ] ℤ := by
  sorry

/-- Canonical normalization: any integral orientation generator paired with itself is 1. -/
theorem orientationFiberSquareIso_self (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (x : M) (o : (orientationLocalSystem m M).obj ⟨x⟩)
    (_ho : Submodule.span ℤ {o} = ⊤) :
    orientationFiberSquareIso m M x (o ⊗ₜ[ℤ] o) = 1 := by
  sorry

/-- Actual pair inclusion from support on B to support at x∈B. -/
noncomputable def supportLocalPairMap (X : TopCat.{u}) (B : Set X) (x : X) (hx : x ∈ B) :
    TopPair.ofSubset Bᶜ ⟶ puncturedPair X x :=
  TopPair.ofSubsetMap (𝟙 X) (fun y hy => by
    change y ≠ x
    intro h
    exact hy (h.symm ▸ hx))

/-- The supported class maps locally by native pair functoriality. -/
noncomputable def twistedSupportLocalMap (R : Type u) [CommRing R]
    (X : TopCat.{u}) (L : LocalCoefficientSystem R X) (n : ℕ)
    (B : Set X) (x : X) (hx : x ∈ B) :
    twistedRelativeHomology R (TopPair.ofSubset Bᶜ) L n ⟶
      twistedRelativeHomology R (puncturedPair X x) L n :=
  (TopPair.ofSubset Bᶜ).twistedHomologyCoefficientMap
    ((TauCeti.LocalCoefficientSystem.pullbackIdIso X).app L).inv n ≫
    TopPair.twistedHomologyMap (supportLocalPairMap X B x hx) L n

/-- The ball-local section condition has content in the functor encoding: local point
classes must be induced by one supported relative class on each neighborhood. On a manifold
these open neighborhoods may be refined to coordinate balls. -/
structure LocallyRepresentedTopSection (R : Type u) [CommRing R]
    (X : TopCat.{u}) (L : LocalCoefficientSystem R X) (n : ℕ) (V : Set X) where
  localValue : ∀ x : X, x ∈ V →
    twistedRelativeHomology R (puncturedPair X x) L n
  locally_represented : ∀ x : X, ∀ hx : x ∈ V,
    ∃ B : Set X, ∃ hBV : B ⊆ V, IsOpen B ∧ x ∈ B ∧
      ∃ c : twistedRelativeHomology R (TopPair.ofSubset Bᶜ) L n,
        ∀ y : X, ∀ hy : y ∈ B,
          twistedSupportLocalMap R X L n B y hy c = localValue y (hBV hy)

/-- Top local homology is a path-transport functor on a boundaryless manifold.
The construction uses excision on coordinate balls, not arbitrary spaces. -/
noncomputable def localTopHomologySystem (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) :
    LocalCoefficientSystem R (TopCat.of M) where
  obj := fun x => twistedRelativeHomology R (puncturedPair (TopCat.of M) x.as) L m
  map := by sorry
  map_id := by sorry
  map_comp := by sorry

/-- The transport functor's fibre is actual twisted local homology. -/
noncomputable def localTopHomologyFiberIso (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (x : M) :
    (localTopHomologySystem R m M L).obj ⟨x⟩ ≅
      twistedRelativeHomology R (puncturedPair (TopCat.of M) x) L m := Iso.refl _

/-- The orientation twist puts the coefficient factor first, so R acts on it.
Its path maps are tensor products of coefficient and orientation transport. -/
noncomputable def orientationTensorLocalSystem (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) :
    LocalCoefficientSystem R (TopCat.of M) where
  obj := fun x => ModuleCat.of R ((L.obj x) ⊗[ℤ] ((orientationLocalSystem m M).obj x))
  map := fun p => ModuleCat.ofHom
    (TensorProduct.AlgebraTensorModule.map (L.map p).hom
      ((orientationLocalSystem m M).map p).hom)
  map_id := by sorry
  map_comp := by sorry

noncomputable def orientationTensorFiberIso (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (x : M) :
    (orientationTensorLocalSystem R m M L).obj ⟨x⟩ ≅
      ModuleCat.of R ((L.obj ⟨x⟩) ⊗[ℤ] ((orientationLocalSystem m M).obj ⟨x⟩)) := Iso.refl _

/-- Natural comparison of functors, with the normalization theorem below fixing its sign. -/
noncomputable def localTopOrientationTensorNatIso (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) :
    localTopHomologySystem R m M L ≅ orientationTensorLocalSystem R m M L := by
  sorry

/-- Excision transport inside an open B preserves the local images of one class supported
on B. This ties path transport directly to the actual supported-relative homology maps. -/
theorem localTopHomologySystem_transport_supported (R : Type) [CommRing R]
    (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (B : TopologicalSpace.Opens (TopCat.of M)) (x y : B)
    (p : (⟨x⟩ : FundamentalGroupoid B) ⟶ ⟨y⟩)
    (c : twistedRelativeHomology R (TopPair.ofSubset ((B : Set (TopCat.of M))ᶜ)) L m) :
    (localTopHomologySystem R m M L).map
      ((FundamentalGroupoid.map
        (⟨Subtype.val, continuous_subtype_val⟩ : C(B, TopCat.of M))).map p)
      (twistedSupportLocalMap R (TopCat.of M) L m (B : Set (TopCat.of M)) x.val x.property c) =
      twistedSupportLocalMap R (TopCat.of M) L m (B : Set (TopCat.of M)) y.val y.property c := by
  sorry

/-- Multiply an integral relative cycle by a fibre coefficient, using transport from x
on a coordinate ball and excision. This is the coefficient-extension construction [c·ℓ]. -/
noncomputable def localCoefficientExtensionClass (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (x : M)
    (c : twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)
      ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
        (ModuleCat.of ℤ ℤ)) m) (ℓ : L.obj ⟨x⟩) :
    twistedRelativeHomology R (puncturedPair (TopCat.of M) x) L m := by
  sorry

/-- Actual pair inclusion induced by an embedding at a puncture. -/
noncomputable def embeddingLocalPairMap {U M : TopCat} (f : U ⟶ M)
    (hf : Function.Injective f) (x : U) : puncturedPair U x ⟶ puncturedPair M (f x) :=
  TopPair.ofSubsetMap (B := ({x}ᶜ : Set U)) (B' := ({f x}ᶜ : Set M)) f
    (fun y hy h => hy (hf h))

/-- Integral local excision map for an open embedding, with the native constant pullback. -/
noncomputable def embeddingIntegralLocalMap {U M : TopCat} (f : U ⟶ M)
    (hf : Function.Injective f) (x : U) (n : ℕ) :
    twistedRelativeHomology ℤ (puncturedPair U x)
      ((TauCeti.LocalCoefficientSystem.constantFunctor U).obj (ModuleCat.of ℤ ℤ)) n ⟶
    twistedRelativeHomology ℤ (puncturedPair M (f x))
      ((TauCeti.LocalCoefficientSystem.constantFunctor M).obj (ModuleCat.of ℤ ℤ)) n :=
  (puncturedPair U x).twistedHomologyCoefficientMap
    (TauCeti.LocalCoefficientSystem.pullbackConstantIso f.hom (ModuleCat.of ℤ ℤ)).inv n ≫
    TopPair.twistedHomologyMap (embeddingLocalPairMap f hf x)
      ((TauCeti.LocalCoefficientSystem.constantFunctor M).obj (ModuleCat.of ℤ ℤ)) n

/-- The open-excision restriction pin applies to every coordinate ball with its boundaryless
atlas, viewed as an open embedding U→M; both carriers use explicit manifold instances. -/
theorem localCoefficientExtensionClass_open (R : Type) [CommRing R] (m : ℕ) (U M : Type)
    [TopologicalSpace U] [T2Space U] [SecondCountableTopology U]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) U]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ U]
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (f : TopCat.of U ⟶ TopCat.of M) (hf : Function.Injective f) (_ho : IsOpenMap f)
    (L : LocalCoefficientSystem R (TopCat.of M)) (x : U)
    (c : twistedRelativeHomology ℤ (puncturedPair (TopCat.of U) x)
      ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of U)).obj
        (ModuleCat.of ℤ ℤ)) m) (ℓ : L.obj ⟨f x⟩) :
    localCoefficientExtensionClass R m M L (f x)
      (embeddingIntegralLocalMap f hf x m c) ℓ =
      TopPair.twistedHomologyMap (embeddingLocalPairMap f hf x) L m
        (localCoefficientExtensionClass R m U
          ((TauCeti.LocalCoefficientSystem.pullback f.hom).obj L) x c ℓ) := by
  sorry

/-- For every R, a trivialization after scalar restriction pins extension by the actual
integral coefficient homology map. The scalar comparison is fixed on chain generators. -/
theorem localCoefficientExtensionClass_trivialized_R (R : Type) [CommRing R]
    (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (N : ModuleCat ℤ)
    (τ : ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj N) ≅
      restrictCoefficientSystem R (TopCat.of M) L)
    (x : M) (ℓ : N)
    (c : twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)
      ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
        (ModuleCat.of ℤ ℤ)) m) :
    (twistedRestrictScalarsHomologyIso R (puncturedPair (TopCat.of M) x) L m).inv
      (localCoefficientExtensionClass R m M L x c (τ.hom.app ⟨x⟩ ℓ)) =
      (puncturedPair (TopCat.of M) x).twistedHomologyCoefficientMap
        (((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).map
          (ModuleCat.ofHom (LinearMap.toSpanSingleton ℤ N ℓ))) ≫ τ.hom) m c := by
  sorry

/-- Coefficient multiplication is R-linear in the fibre coefficient. -/
theorem localCoefficientExtensionClass_smul (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (x : M)
    (c : twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)
      ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
        (ModuleCat.of ℤ ℤ)) m) (r : R) (ℓ : L.obj ⟨x⟩) :
    localCoefficientExtensionClass R m M L x c (r • ℓ) =
      r • localCoefficientExtensionClass R m M L x c ℓ := by
  sorry

/-- Orientation and coefficient transport determine the transport of extension classes. -/
theorem localCoefficientExtensionClass_transport (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (x y : M)
    (p : (⟨x⟩ : FundamentalGroupoid M) ⟶ ⟨y⟩)
    (o : (orientationLocalSystem m M).obj ⟨x⟩) (ℓ : L.obj ⟨x⟩) :
    (localTopHomologySystem R m M L).map p
      (localCoefficientExtensionClass R m M L x o ℓ) =
      localCoefficientExtensionClass R m M L y
        ((orientationLocalSystem m M).map p o) (L.map p ℓ) := by
  sorry

/-- On a trivialized ball, extension is the native coefficient homology map for
z ↦ z·ℓ. Taking M to be that ball expresses the transport-trivialization pin. -/
theorem localCoefficientExtensionClass_trivialized (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem ℤ (TopCat.of M)) (N : ModuleCat ℤ)
    (τ : ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj N) ≅ L)
    (x : M) (ℓ : N)
    (c : twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)
      ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
        (ModuleCat.of ℤ ℤ)) m) :
    localCoefficientExtensionClass ℤ m M L x c (τ.hom.app ⟨x⟩ ℓ) =
      (puncturedPair (TopCat.of M) x).twistedHomologyCoefficientMap
        (((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).map
          (ModuleCat.ofHom (LinearMap.toSpanSingleton ℤ N ℓ))) ≫ τ.hom) m c := by
  sorry

/-- The unit pin excludes a sign change in the integral coefficient-extension map. -/
theorem localCoefficientExtensionClass_constant_one (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (x : M)
    (c : twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)
      ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
        (ModuleCat.of ℤ ℤ)) m) :
    localCoefficientExtensionClass ℤ m M
      ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
        (ModuleCat.of ℤ ℤ)) x c (1 : ℤ) = c := by
  sorry

/-- Extension is bilinear over ℤ in the integral class and the coefficient. -/
theorem localCoefficientExtensionClass_add (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (x : M)
    (c c' : twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)
      ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
        (ModuleCat.of ℤ ℤ)) m) (ℓ ℓ' : L.obj ⟨x⟩) :
    (localCoefficientExtensionClass R m M L x (c + c') ℓ =
      localCoefficientExtensionClass R m M L x c ℓ +
        localCoefficientExtensionClass R m M L x c' ℓ) ∧
    (localCoefficientExtensionClass R m M L x c (ℓ + ℓ') =
      localCoefficientExtensionClass R m M L x c ℓ +
        localCoefficientExtensionClass R m M L x c ℓ') := by
  sorry

/-- The comparison sends the actual coefficient-extension class to its elementary tensor.
Negating the natural comparison violates this normalization. -/
theorem localTopOrientationTensorNatIso_coefficientExtension (R : Type) [CommRing R]
    (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (x : M)
    (o : (orientationLocalSystem m M).obj ⟨x⟩) (ℓ : L.obj ⟨x⟩) :
    (orientationTensorFiberIso R m M L x).hom
      ((localTopOrientationTensorNatIso R m M L).hom.app ⟨x⟩
        ((localTopHomologyFiberIso R m M L x).inv
          (localCoefficientExtensionClass R m M L x
            ((orientationLocalSystemFiberIso m M x).hom o) ℓ))) = ℓ ⊗ₜ[ℤ] o := by
  sorry

/-- Integral fibre form of the same normalized comparison, with coefficients first. -/
noncomputable def localTopOrientationTensorIso (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem ℤ (TopCat.of M)) (x : M) :
    twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x) L m ≃ₗ[ℤ]
      (L.obj ⟨x⟩) ⊗[ℤ] ((orientationLocalSystem m M).obj ⟨x⟩) :=
  by sorry

/-- The integral fibre equivalence has the same coefficient-extension normalization as
its natural functor form, with the coefficient factor first. -/
theorem localTopOrientationTensorIso_coefficientExtension (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem ℤ (TopCat.of M)) (x : M)
    (o : (orientationLocalSystem m M).obj ⟨x⟩) (ℓ : L.obj ⟨x⟩) :
    localTopOrientationTensorIso m M L x
      (localCoefficientExtensionClass ℤ m M L x
        ((orientationLocalSystemFiberIso m M x).hom o) ℓ) = ℓ ⊗ₜ[ℤ] o := by
  sorry

set_option maxHeartbeats 800000 in
/-- The compact-support existence and uniqueness theorem consumes the actual local section. -/
theorem compactSupportTopClass_existsUnique (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (K V : Set (TopCat.of M))
    (_hK : IsCompact K) (_hV : IsOpen V) (hKV : K ⊆ V)
    (s : LocallyRepresentedTopSection R (TopCat.of M) L m V) :
    ∃! c : twistedRelativeHomology R (TopPair.ofSubset Kᶜ) L m,
      ∀ x : TopCat.of M, ∀ hx : x ∈ K,
        twistedSupportLocalMap R (TopCat.of M) L m K x hx c =
          s.localValue x (hKV hx) := by
  sorry

/-- Canonical square-normalized local image, defined as the preimage of 1.
No orientation generator is selected. -/
noncomputable def canonicalTwistedLocalGenerator (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M] (x : M) :
    twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)
      (orientationLocalSystem m M) m :=
  (localTopOrientationTensorIso m M (orientationLocalSystem m M) x).symm
    ((orientationFiberSquareIso m M x).symm 1)

/-- The canonical local images satisfy the actual neighborhood-section condition. -/
noncomputable def canonicalTwistedTopSection (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M] :
    LocallyRepresentedTopSection ℤ (TopCat.of M) (orientationLocalSystem m M) m Set.univ where
  localValue := fun x _ => canonicalTwistedLocalGenerator m M x
  locally_represented := by sorry

/-- Local orientation data: a global class whose image generates every local top homology
module. The maps are induced by `(X, ∅) ⟶ (X, X \ {x})`. -/
structure FundamentalClassDatum (R : Type u) [CommRing R] (X : TopCat.{u}) (n : ℕ) where
  fundamentalClass : ((relativeSingularHomology R n).obj (ModuleCat.of R R)).obj
    (TopPair.incl.obj X)
  spans : ∀ x : X,
    Submodule.span R
      {((relativeSingularHomology R n).obj (ModuleCat.of R R)).map
        (TopPair.j (puncturedPair X x)) fundamentalClass} = ⊤

noncomputable def poincareDualityMap (R : Type u) [CommRing R]
    (X : TopCat.{u}) (n p : ℕ) (_hp : p ≤ n) (c : FundamentalClassDatum R X n) :
    singularCohomology R X p ⟶ SingularHomology R (ModuleCat.of R R) X (n - p) := by
  sorry

/-- Compact Hausdorff second-countable manifolds with a fundamental class satisfy duality. The
orientation-local-system version precedes this constant-coefficient corollary in the roadmap. -/
theorem poincareDualityMap_isIso (R : Type u) [CommRing R] (n : ℕ)
    (M : Type u) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [CompactSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n))) ∞ M]
    (p : ℕ) (hp : p ≤ n) (c : FundamentalClassDatum R (TopCat.of M) n) :
    IsIso (poincareDualityMap R (TopCat.of M) n p hp c) := by
  sorry

/-! ## Relative Hurewicz -/

/-- A topological pair with the point in the subspace required by relative homotopy. Relative
homology continues to use the unbased `TopPair` above. -/
structure BasedTopPair where
  pair : TopPair.{u}
  basepoint : pair.snd

namespace BasedTopPair

/-- A map of based pairs is a map of the underlying pairs whose subspace component preserves the
chosen point. This is the map carrier for relative homotopy functoriality. -/
structure Hom (X Y : BasedTopPair.{u}) where
  toTopPairHom : X.pair ⟶ Y.pair
  map_basepoint : TopPair.Hom.snd toTopPairHom X.basepoint = Y.basepoint

end BasedTopPair

/-- Explicit NDR data for an embedded pair. -/
structure NDRPairData (X : TopPair.{u}) where
  u : C(X.fst, unitInterval)
  H : C(unitInterval × X.fst, X.fst)
  zero_set : ∀ x, u x = 0 ↔ x ∈ Set.range X.map
  at_zero : ∀ x, H (0, x) = x
  fixed : ∀ (t : unitInterval) (a : X.snd), H (t, X.map a) = X.map a
  at_one : ∀ x, u x < 1 → H (1, x) ∈ Set.range X.map

/-- Relative homotopy in degrees at least two is group-valued. In particular, the degree-two
group is not assumed commutative. The implementation uses the same based-cube model as Mathlib's
`HomotopyGroup`. -/
noncomputable def relativeHomotopyGroup (n : ℕ) (_hn : 2 ≤ n)
    (X : BasedTopPair.{u}) : GrpCat.{u} := by
  sorry

/-- A basepoint-preserving map of pairs induces the relative homotopy homomorphism. -/
noncomputable def BasedTopPair.Hom.relativeHomotopyMap {X Y : BasedTopPair.{u}}
    (f : X.Hom Y) (n : ℕ) (hn : 2 ≤ n) :
    relativeHomotopyGroup n hn X ⟶ relativeHomotopyGroup n hn Y := by
  sorry

/-- The based homotopy group of the subspace, used as the target of the relative boundary map. -/
noncomputable def basedSubspaceHomotopyGroup (n : ℕ) (_hn : 1 ≤ n)
    (X : BasedTopPair.{u}) : GrpCat.{u} := by
  sorry

/-- The boundary of a relative cube lands in the subspace at its stored basepoint. -/
noncomputable def relativeHomotopyBoundary (n : ℕ) (hn : 2 ≤ n)
    (X : BasedTopPair.{u}) :
    relativeHomotopyGroup n hn X ⟶ basedSubspaceHomotopyGroup (n - 1) (by omega) X := by
  sorry

/-- Changing the chosen subspace point along a path gives the standard relative-homotopy
basepoint-change isomorphism. -/
noncomputable def relativeHomotopyChangeBasepoint (n : ℕ) (hn : 2 ≤ n)
    (X : BasedTopPair.{u}) (a : X.pair.snd) (_path : Path X.basepoint a) :
    relativeHomotopyGroup n hn X ≅
      relativeHomotopyGroup n hn { pair := X.pair, basepoint := a } := by
  sorry

/-- The integral module attached to the abelianization of the relative homotopy group. This is
the natural source of Hurewicz before any commutativity theorem. -/
noncomputable def relativeHomotopyAbelianization (n : ℕ) (hn : 2 ≤ n)
    (X : BasedTopPair.{u}) : ModuleCat.{u} ℤ := by
  sorry

/-- The quotient map from relative homotopy to its abelianization, displayed on underlying
carriers so that the general group-valued source is not silently strengthened. -/
noncomputable def relativeHomotopyToAbelianization (n : ℕ) (hn : 2 ≤ n)
    (X : BasedTopPair.{u}) :
    relativeHomotopyGroup n hn X → relativeHomotopyAbelianization n hn X := by
  sorry

/-- From degree three onward, relative homotopy itself has its canonical integral-module
structure. -/
noncomputable def relativeHomotopyModule (n : ℕ) (_hn : 3 ≤ n)
    (X : BasedTopPair.{u}) : ModuleCat.{u} ℤ := by
  sorry

/-- In the stable relative range, the module carrier agrees with the abelianization carrier. -/
noncomputable def relativeHomotopyModuleIsoAbelianization (n : ℕ) (hn : 3 ≤ n)
    (X : BasedTopPair.{u}) :
    relativeHomotopyModule n hn X ≅ relativeHomotopyAbelianization n (by omega) X := by
  sorry

/-- Relative Hurewicz is defined on the abelianization of a based pair in every degree at least
two. Its homology target forgets only the basepoint, not the underlying pair. -/
noncomputable def relativeHurewicz (n : ℕ) (hn : 2 ≤ n) (X : BasedTopPair.{u}) :
    relativeHomotopyAbelianization n hn X ⟶
      (relativeSingularHomology ℤ n).obj (ModuleCat.of ℤ (ULift.{u} ℤ)) |>.obj X.pair := by
  sorry

/-- At degree two, simple connectivity and relative one-connectivity force the generally
nonabelian relative group to be abelian. -/
theorem relativeHomotopyGroup_two_commutative (X : BasedTopPair.{u})
    (_hNDR : NDRPairData X.pair)
    [SimplyConnectedSpace X.pair.fst] [SimplyConnectedSpace X.pair.snd] :
    ∀ a b : relativeHomotopyGroup 2 (Nat.le_refl 2) X, a * b = b * a := by
  sorry

/-- Consequently the quotient to the degree-two abelianization is bijective; commutativity is a
theorem under the Hurewicz hypotheses, not part of the general carrier. -/
theorem relativeHomotopyToAbelianization_two_bijective (X : BasedTopPair.{u})
    (_hNDR : NDRPairData X.pair)
    [SimplyConnectedSpace X.pair.fst] [SimplyConnectedSpace X.pair.snd] :
    Function.Bijective (relativeHomotopyToAbelianization 2 (by omega) X) := by
  sorry

theorem relativeHurewicz_isIso (n : ℕ) (hn : 2 ≤ n) (X : BasedTopPair.{u})
    (_hNDR : NDRPairData X.pair)
    [SimplyConnectedSpace X.pair.fst] [SimplyConnectedSpace X.pair.snd]
    (_hvanish : ∀ i (hi : 2 ≤ i), i < n →
      Subsingleton (relativeHomotopyGroup i hi X)) :
    IsIso (relativeHurewicz n hn X) := by
  sorry

/-! ## Finite CW Euler characteristic -/

/-- A concrete finite CW model for a space. The topology and CW witnesses belong to the model
carrier, and the original space is connected to it by an actual homotopy equivalence. -/
structure FiniteCWTypeModel (M : Type u) [TopologicalSpace M] where
  X : Type u
  topology : TopologicalSpace X
  cw : letI := topology; CWComplex (Set.univ : Set X)
  finite : letI := topology; letI := cw; CWComplex.Finite (Set.univ : Set X)
  homotopyEquiv : letI := topology; M ≃ₕ X

/-- A compact Hausdorff second-countable smooth manifold has a concrete finite CW model. -/
noncomputable def compactManifoldFiniteCWType (n : ℕ)
    (M : Type u) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [CompactSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n))) ∞ M] :
    FiniteCWTypeModel M := by
  sorry

/-- Euler characteristic of a chosen finite CW structure. The roadmap proves that this agrees
with alternating homology rank and is invariant under homotopy equivalence. -/
noncomputable def finiteCWEulerCharacteristic (X : Type*) [TopologicalSpace X]
    [CWComplex (Set.univ : Set X)] [CWComplex.Finite (Set.univ : Set X)] : ℤ :=
  ∑ᶠ i : ℕ, (-1 : ℤ) ^ i * Nat.card (Topology.RelCWComplex.cell (Set.univ : Set X) i)

/-- The space-level cell count is the native cellular-complex Euler characteristic. -/
example (k : Type u) [Field k] (X : Type u) [TopologicalSpace X] [T2Space X]
    [CWComplex (Set.univ : Set X)] [CWComplex.Finite (Set.univ : Set X)] :
    (cellularChainComplex k X).eulerChar = finiteCWEulerCharacteristic X := by
  simpa [cellularChainComplex, finiteCWEulerCharacteristic] using
    (TauCeti.eulerChar_cellularChainComplex (Set.univ : Set X) (ModuleCat.of k k))

theorem finiteCWEulerCharacteristic_eq_of_homotopyEquiv
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    [CWComplex (Set.univ : Set X)] [CWComplex.Finite (Set.univ : Set X)]
    [CWComplex (Set.univ : Set Y)] [CWComplex.Finite (Set.univ : Set Y)]
    (_e : X ≃ₕ Y) :
    finiteCWEulerCharacteristic X = finiteCWEulerCharacteristic Y := by
  sorry

/-! ## Homological Whitehead -/

/-- A map between simply connected CW complexes which induces isomorphisms on integral singular
homology is itself the forward map of a homotopy equivalence. -/
theorem homologicalWhitehead
    {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    [SimplyConnectedSpace X] [SimplyConnectedSpace Y]
    [CWComplex (Set.univ : Set X)] [CWComplex (Set.univ : Set Y)]
    (f : C(X, Y))
    (_hf : ∀ n : ℕ,
      IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) n).obj
        (ModuleCat.of ℤ ℤ)).map (TopCat.ofHom f))) :
    ∃ e : X ≃ₕ Y, e.toFun = f := by
  sorry

/-! ## Stage 6.0: countable inverse-system algebra -/

section CountableTowers

variable {R : Type u} [CommRing R]

/-- The canonical product difference; inverse limits are its kernel. -/
def towerDifference (T : ℕᵒᵖ ⥤ ModuleCat.{u} R) :
    ((n : ℕ) → T.obj (Opposite.op n)) →ₗ[R] ((n : ℕ) → T.obj (Opposite.op n)) where
  toFun x n := x n -
    (T.map (homOfLE (Nat.le_succ n)).op).hom (x (n + 1))
  map_add' x y := by
    ext n
    simp only [Pi.add_apply, map_add]
    abel
  map_smul' r x := by
    ext n
    simp only [Pi.smul_apply, map_smul, smul_sub, RingHom.id_apply]

/-- First derived inverse limit for a countable module tower, as an actual quotient module. -/
abbrev countableLimOne (T : ℕᵒᵖ ⥤ ModuleCat.{u} R) :=
  ((n : ℕ) → T.obj (Opposite.op n)) ⧸ LinearMap.range (towerDifference T)

theorem towerDifference_surjective (T : ℕᵒᵖ ⥤ ModuleCat.{u} R)
    (hT : ∀ n : ℕ, Function.Surjective
      (T.map (homOfLE (Nat.le_succ n)).op).hom) :
    Function.Surjective (towerDifference T) := by
  sorry

end CountableTowers

/-! ## Selected Stage 8: ordinary classifying spaces and obstruction maps

The abelian model is supplied by DGFloer; `OrdinaryEMModel` records the input to the
comparison theorems, and is not another constructor. The simply connected obstruction
signatures below are an advisory specialization of the definitive local-system scope.
-/

/-- Stage 4.7 supplies the single CW structure for geometric realizations. -/
@[instance_reducible] noncomputable def simplicialRealizationCW (K : SSet.{u}) :
    CWComplex (Set.univ : Set (SSet.toTop.obj K)) := by
  sorry

theorem simplicialRealizationT2 (K : SSet.{u}) : T2Space (SSet.toTop.obj K) := by
  sorry

/-- The cell indices are the actual nondegenerate simplices. -/
noncomputable def simplicialRealizationCellEquiv (K : SSet.{u}) (n : ℕ) :
    letI := simplicialRealizationCW K
    Topology.RelCWComplex.cell (Set.univ : Set (SSet.toTop.obj K)) n ≃
      {x : K _⦋n⦌ // x ∈ K.nonDegenerate n} := by
  sorry

/-- The single generic bar/nerve realization for discrete groups. -/
abbrev groupClassifyingSpace (G : Type u) [Group G] : TopCat.{u} :=
  SSet.toTop.obj (CategoryTheory.nerve (SingleObj G))

/-- The unique bar vertex, with its realization inclusion. -/
noncomputable def groupClassifyingSpaceBasepoint (G : Type u) [Group G] :
    groupClassifyingSpace G :=
  (SSet.toTop.map (SSet.const (X := SSet.stdSimplex.obj ⦋0⦌)
    (CategoryTheory.nerveEquiv.symm (SingleObj.star G))))
      ((SSet.toTopSimplex.app ⦋0⦌).inv
        (default : SimplexCategory.toTop.obj ⦋0⦌))

theorem groupClassifyingSpace_isEMOne (G : Type u) [Group G] :
    TauCeti.IsEilenbergMacLaneSpaceOne G (groupClassifyingSpace G)
      (groupClassifyingSpaceBasepoint G) := by
  sorry

/-- The realized nerve edge has a concrete underlying map, using the native
Δ[1]≅I with weights (1-t,t); only its endpoint proofs are proposed targets. -/
noncomputable def groupClassifyingSpaceEdge (G : Type u) [Group G] (g : G) :
    Path (groupClassifyingSpaceBasepoint G) (groupClassifyingSpaceBasepoint G) where
  toFun t :=
    SSet.toTop.map (SSet.yonedaEquiv.symm
      (CategoryTheory.ComposableArrows.mk₁
        (show SingleObj.star G ⟶ SingleObj.star G from g)))
      (SSet.stdSimplex.toTopObjIsoI.inv (ULift.up t))
  continuous_toFun := by fun_prop
  source' := by sorry
  target' := by sorry

noncomputable def groupClassifyingSpaceFundamentalGroup (G : Type u) [Group G] :
    FundamentalGroup (groupClassifyingSpace G) (groupClassifyingSpaceBasepoint G) ≃* G := by
  sorry

theorem groupClassifyingSpaceFundamentalGroup_edge (G : Type u) [Group G] (g : G) :
    groupClassifyingSpaceFundamentalGroup G ⟦groupClassifyingSpaceEdge G g⟧ = g := by
  sorry

/-- Input supplied by the shared abelian constructors, with a chosen normalized identification.
Vanishing is for every other positive degree, with no finite-dimension condition. -/
structure OrdinaryEMModel (A : Type u) [AddCommGroup A] (n : ℕ) [NeZero n] where
  space : TopCat.{u}
  point : space
  hausdorff : T2Space space
  cw : CWComplex (Set.univ : Set space)
  connected : PathConnectedSpace space
  homotopyIdentification : HomotopyGroup (Fin n) space point ≃* Multiplicative A
  vanishing : ∀ j : ℕ, 0 < j → j ≠ n →
    Subsingleton (HomotopyGroup (Fin j) space point)

/-- Coefficient-functorial supplier input. The definitive DGFloer constructor pins its
spaces to bar in degree one and Dold–Kan in higher degree; this interface records its
normalized maps without adding a constructor in AT. -/
structure NormalizedAbelianEMFamily where
  model : ∀ (A : AddCommGrpCat.{u}) (n : ℕ) [NeZero n], OrdinaryEMModel A n
  map : ∀ {A A' : AddCommGrpCat.{u}} (_f : A ⟶ A') (n : ℕ) [NeZero n],
    (model A n).space ⟶ (model A' n).space
  map_point : ∀ {A A' : AddCommGrpCat.{u}} (f : A ⟶ A') (n : ℕ) [NeZero n],
    map f n (model A n).point = (model A' n).point
  map_id : ∀ (A : AddCommGrpCat.{u}) (n : ℕ) [NeZero n], map (𝟙 A) n = 𝟙 _
  map_comp : ∀ {A A' A'' : AddCommGrpCat.{u}} (f : A ⟶ A') (g : A' ⟶ A'')
    (n : ℕ) [NeZero n], map (f ≫ g) n = map f n ≫ map g n
  normalized_naturality : ∀ {A A' : AddCommGrpCat.{u}} (f : A ⟶ A') (n : ℕ) [NeZero n]
    (p : HomotopyGroup (Fin n) (model A n).space (model A n).point),
    (model A' n).homotopyIdentification
      (HomotopyGroup.map (map f n).hom (map_point f n) p) =
      Multiplicative.ofAdd (f.hom (Multiplicative.toAdd ((model A n).homotopyIdentification p)))

/-- Consume the model and normalized maps from the shared family. -/
abbrev ordinaryEMModelFromFamily (F : NormalizedAbelianEMFamily.{u})
    (A : AddCommGrpCat.{u}) (n : ℕ) [NeZero n] : OrdinaryEMModel A n := F.model A n

/-- The single family supplied by the degree-one bar and higher Dold–Kan constructors. -/
noncomputable def ordinaryEilenbergMacLaneFamily : NormalizedAbelianEMFamily.{u} := by
  sorry

/-- The actual higher simplicial model, using the native single-degree complex and Γ. -/
abbrev ordinaryDoldKanSimplicialModel (A : AddCommGrpCat.{u}) (n : ℕ) : SSet.{u} :=
  (CategoryTheory.Abelian.DoldKan.Γ.obj
    ((HomologicalComplex.single AddCommGrpCat (ComplexShape.down ℕ) n).obj A)) ⋙
      forget AddCommGrpCat

/-- The actual normalized n-simplex labelled a: inverse native counit, then
inclusion of the normalized Moore subobject into the simplicial n-chains. -/
noncomputable def ordinaryDoldKanLabeledSimplex (A : AddCommGrpCat.{u})
    (n : ℕ) (a : A) : (ordinaryDoldKanSimplicialModel A n) _⦋n⦌ :=
  let L := (HomologicalComplex.single AddCommGrpCat (ComplexShape.down ℕ) n).obj A
  let G := CategoryTheory.Abelian.DoldKan.Γ.obj L
  let a' := (HomologicalComplex.singleObjXSelf (ComplexShape.down ℕ) n A).inv.hom a
  let z := ((CategoryTheory.Abelian.DoldKan.equivalence.counitIso.app L).inv.f n).hom a'
  (AlgebraicTopology.NormalizedMooreComplex.objX G n).arrow.hom z

/-- Actual realized zero vertex of the simplicial abelian model. -/
noncomputable def ordinaryDoldKanBasepoint (A : AddCommGrpCat.{u}) (n : ℕ) :
    SSet.toTop.obj (ordinaryDoldKanSimplicialModel A n) :=
  SSet.toTop.map (SSet.const (X := SSet.stdSimplex.obj ⦋0⦌)
    (0 : (ordinaryDoldKanSimplicialModel A n) _⦋0⦌))
      ((SSet.toTopSimplex.app ⦋0⦌).inv
        (default : SimplexCategory.toTop.obj ⦋0⦌))

theorem ordinaryEilenbergMacLaneFamily_one_space (A : AddCommGrpCat.{u}) :
    (ordinaryEilenbergMacLaneFamily.model A 1).space =
      groupClassifyingSpace (Multiplicative A) := by
  sorry

theorem ordinaryEilenbergMacLaneFamily_one_point (A : AddCommGrpCat.{u}) :
    eqToHom (ordinaryEilenbergMacLaneFamily_one_space A)
      (ordinaryEilenbergMacLaneFamily.model A 1).point =
        groupClassifyingSpaceBasepoint (Multiplicative A) := by
  sorry

theorem ordinaryEilenbergMacLaneFamily_one_identification (A : AddCommGrpCat.{u})
    (p : HomotopyGroup (Fin 1) (ordinaryEilenbergMacLaneFamily.model A 1).space
      (ordinaryEilenbergMacLaneFamily.model A 1).point) :
    groupClassifyingSpaceFundamentalGroup (Multiplicative A)
      (HomotopyGroup.pi1MulEquivFundamentalGroup
        (HomotopyGroup.map (eqToHom (ordinaryEilenbergMacLaneFamily_one_space A)).hom
          (ordinaryEilenbergMacLaneFamily_one_point A) p)) =
      (ordinaryEilenbergMacLaneFamily.model A 1).homotopyIdentification p := by
  sorry

theorem ordinaryEilenbergMacLaneFamily_higher_space (A : AddCommGrpCat.{u})
    (n : ℕ) [NeZero n] (hn : 2 ≤ n) :
    (ordinaryEilenbergMacLaneFamily.model A n).space =
      SSet.toTop.obj (ordinaryDoldKanSimplicialModel A n) := by
  sorry

theorem ordinaryEilenbergMacLaneFamily_higher_point (A : AddCommGrpCat.{u})
    (n : ℕ) [NeZero n] (hn : 2 ≤ n) :
    eqToHom (ordinaryEilenbergMacLaneFamily_higher_space A n hn).symm
      (ordinaryDoldKanBasepoint A n) = (ordinaryEilenbergMacLaneFamily.model A n).point := by
  sorry

/-- Integral singular homology in the universe of the model's carrier. -/
abbrev ordinaryIntegralHomology (X : TopCat.{u}) (n : ℕ) :=
  ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} ℤ) n).obj
    (ModuleCat.of ℤ (ULift.{u} ℤ))).obj X

/-- The sphere carrier used by the normalized cubical representative comparison. -/
abbrev homotopySphere (n : ℕ) : TopCat.{u} :=
  TopCat.of (ULift.{u} (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1))

/-- The positive first-coordinate pole. -/
noncomputable def homotopySpherePole (n : ℕ) :
    Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1 :=
  ⟨PiLp.single 2 0 (1 : ℝ), by simp⟩

/-- Stage 8.6's quotient map followed by its orientation-normalized homeomorphism. -/
noncomputable def cubicalSphereQuotient (n : ℕ) [NeZero n] :
    C((Fin n → unitInterval), Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1) := by
  sorry

theorem cubicalSphereQuotient_boundary (n : ℕ) [NeZero n]
    (t : Fin n → unitInterval) (ht : t ∈ Cube.boundary (Fin n)) :
    cubicalSphereQuotient n t = homotopySpherePole n := by
  sorry

theorem cubicalSphereQuotient_isQuotientMap (n : ℕ) [NeZero n] :
    Topology.IsQuotientMap (cubicalSphereQuotient n) := by
  sorry

theorem cubicalSphereQuotient_eq_iff (n : ℕ) [NeZero n]
    (t s : Fin n → unitInterval) :
    cubicalSphereQuotient n t = cubicalSphereQuotient n s ↔
      t = s ∨ (t ∈ Cube.boundary (Fin n) ∧ s ∈ Cube.boundary (Fin n)) := by
  sorry

/-- The actual cube/boundary pair, lifted to the coefficient universe. -/
abbrev coordinateCubePair (n : ℕ) : TopPair.{u} :=
  TopPair.ofSubset (X := TopCat.of (ULift.{u} (Fin n → unitInterval)))
    {t | t.down ∈ Cube.boundary (Fin n)}

/-- The monotone simplex with vertices 0, e_(p0), e_(p0)+e_(p1), …, 1. -/
noncomputable def coordinateCubeSimplex (n : ℕ) (_p : Equiv.Perm (Fin n)) :
    C(Convexity.StdSimplex ℝ (Fin (n + 1)), (coordinateCubePair.{u} n).fst) := by
  sorry

/-- Barycentric coordinates determine the simplex, so its orientation cannot be reversed. -/
theorem coordinateCubeSimplex_coordinate (n : ℕ) (p : Equiv.Perm (Fin n))
    (t : Convexity.StdSimplex ℝ (Fin (n + 1))) (j : Fin n) :
    (((coordinateCubeSimplex.{u} n p t).down j) : ℝ) =
      ∑ k : Fin (n + 1), if (p⁻¹ j).val < k.val then t.weights k else 0 := by
  sorry

/-- The signed canonical triangulation, equivalently the ordered shuffle of n interval chains.
For n=1 this is t↦t with coefficient +1, whose boundary is [1]-[0]. -/
noncomputable def coordinateCubeReferenceChain (n : ℕ) :
    ((coordinateCubePair.{u} n).singularChainComplex
      (ModuleCat.of ℤ (ULift.{u} ℤ))).X n :=
  ((coordinateCubePair n).singularChainComplexπ (ModuleCat.of ℤ (ULift.{u} ℤ))).f n
    (∑ p : Equiv.Perm (Fin n),
      ((TopCat.toSSet.obj (coordinateCubePair n).fst).ιChainComplex
        (R := ModuleCat.of ℤ (ULift.{u} ℤ))
        (((coordinateCubePair n).fst.toSSetObjEquiv (Opposite.op ⦋n⦌)).symm
          (coordinateCubeSimplex n p))).hom (ULift.up (Equiv.Perm.sign p : ℤ)))

theorem coordinateCubeReferenceChain_cycle (n : ℕ) :
    (((coordinateCubePair.{u} n).singularChainComplex
      (ModuleCat.of ℤ (ULift.{u} ℤ))).d n ((ComplexShape.down ℕ).next n)).hom
      (coordinateCubeReferenceChain n) = 0 := by
  sorry

/-- The reference class is the homology class of the actual signed chain above. -/
noncomputable def coordinateCubeReferenceClass (n : ℕ) :
    (coordinateCubePair.{u} n).singularHomology (C := ModuleCat.{u} ℤ) (ModuleCat.of ℤ (ULift.{u} ℤ)) n :=
  let K := (coordinateCubePair.{u} n).singularChainComplex
    (ModuleCat.of ℤ (ULift.{u} ℤ))
  K.homologyπ n (K.cyclesMk (coordinateCubeReferenceChain n) ((ComplexShape.down ℕ).next n)
    (by rfl) (coordinateCubeReferenceChain_cycle n))

/-- The ordered standard simplex relative to its actual boundary faces. -/
abbrev coordinateSimplexPair (n : ℕ) : TopPair.{u} :=
  TopPair.ofSubset (X := TopCat.of (ULift.{u} (Convexity.StdSimplex ℝ (Fin (n + 1)))))
    {t | ∃ i, t.down.weights i = 0}

noncomputable def coordinateSimplexIdentityChain (n : ℕ) :
    ((coordinateSimplexPair.{u} n).singularChainComplex
      (ModuleCat.of ℤ (ULift.{u} ℤ))).X n :=
  ((coordinateSimplexPair n).singularChainComplexπ (ModuleCat.of ℤ (ULift.{u} ℤ))).f n
    (((TopCat.toSSet.obj (coordinateSimplexPair n).fst).ιChainComplex
      (R := ModuleCat.of ℤ (ULift.{u} ℤ))
      (((coordinateSimplexPair n).fst.toSSetObjEquiv (Opposite.op ⦋n⦌)).symm
        ⟨ULift.up, by fun_prop⟩)).hom (ULift.up 1))

theorem coordinateSimplexIdentityChain_cycle (n : ℕ) :
    (((coordinateSimplexPair.{u} n).singularChainComplex
      (ModuleCat.of ℤ (ULift.{u} ℤ))).d n ((ComplexShape.down ℕ).next n)).hom
      (coordinateSimplexIdentityChain n) = 0 := by sorry

noncomputable def coordinateSimplexIdentityClass (n : ℕ) :
    (coordinateSimplexPair.{u} n).singularHomology (C := ModuleCat.{u} ℤ)
      (ModuleCat.of ℤ (ULift.{u} ℤ)) n :=
  let K := (coordinateSimplexPair.{u} n).singularChainComplex (ModuleCat.of ℤ (ULift.{u} ℤ))
  K.homologyπ n (K.cyclesMk (coordinateSimplexIdentityChain n) ((ComplexShape.down ℕ).next n)
    (by rfl) (coordinateSimplexIdentityChain_cycle n))

/-- Honest orientation-preserving pair comparison; its homology value below fixes +1. -/
noncomputable def coordinateCubeSimplexOrientationComparison (n : ℕ) :
    coordinateCubePair.{u} n ⟶ coordinateSimplexPair.{u} n := by sorry

theorem coordinateCubeSimplexOrientationComparison_reference (n : ℕ) :
    (TopPair.singularHomologyMap (C := ModuleCat.{u} ℤ)
      (coordinateCubeSimplexOrientationComparison n)
      (ModuleCat.of ℤ (ULift.{u} ℤ)) n).hom (coordinateCubeReferenceClass n) =
      coordinateSimplexIdentityClass n := by sorry

/-- Actual realization of the counit-labelled simplex, precomposed with the
+1 cube-to-ordered-simplex comparison; only the boundary proof is a target. -/
noncomputable def ordinaryDoldKanLabeledCubicalLoop (A : AddCommGrpCat.{u})
    (n : ℕ) [NeZero n] (a : A) :
    GenLoop (Fin n) (SSet.toTop.obj (ordinaryDoldKanSimplicialModel A n))
      (ordinaryDoldKanBasepoint A n) :=
  ⟨⟨fun t =>
      SSet.toTop.map (SSet.yonedaEquiv.symm (ordinaryDoldKanLabeledSimplex A n a))
        ((SSet.toTopSimplex.app ⦋n⦌).inv
          (TopPair.Hom.fst (coordinateCubeSimplexOrientationComparison.{u} n) (ULift.up t))),
      by
        exact (SSet.toTop.map (SSet.yonedaEquiv.symm
          (ordinaryDoldKanLabeledSimplex A n a))).hom.continuous.comp
          ((SSet.toTopSimplex.app ⦋n⦌).inv.hom.continuous.comp
            ((TopPair.Hom.fst (coordinateCubeSimplexOrientationComparison.{u} n)).hom.continuous.comp
              continuous_uliftUp))⟩, by sorry⟩

/-- The family identification is fixed on actual generators, not merely on its space. -/
theorem ordinaryEilenbergMacLaneFamily_higher_identification (A : AddCommGrpCat.{u})
    (n : ℕ) [NeZero n] (hn : 2 ≤ n) (a : A) :
    (ordinaryEilenbergMacLaneFamily.model A n).homotopyIdentification
      (HomotopyGroup.map (eqToHom (ordinaryEilenbergMacLaneFamily_higher_space A n hn).symm).hom
        (ordinaryEilenbergMacLaneFamily_higher_point A n hn)
        ⟦ordinaryDoldKanLabeledCubicalLoop A n a⟧) = Multiplicative.ofAdd a := by sorry

abbrev homotopySpherePolePair (n : ℕ) : TopPair.{u} :=
  TopPair.ofSubset (X := homotopySphere.{u} n) {ULift.up (homotopySpherePole n)}

/-- Actual pair collapse map to the sphere relative to the collapsed pole. -/
noncomputable def cubicalSpherePairMap (n : ℕ) [NeZero n] :
    coordinateCubePair.{u} n ⟶ homotopySpherePolePair.{u} n :=
  TopPair.ofSubsetMap
    (TopCat.ofHom ⟨fun t => ULift.up (cubicalSphereQuotient n t.down), by fun_prop⟩)
    (by
      intro t ht
      change ULift.up (cubicalSphereQuotient n t.down) = ULift.up (homotopySpherePole n)
      exact congrArg ULift.up (cubicalSphereQuotient_boundary n t.down ht))

/-- Native absolute-to-relative map for the standard sphere and its pole. -/
noncomputable def homotopySphereAbsoluteToRelative (n : ℕ) :
    ordinaryIntegralHomology (homotopySphere.{u} n) n ⟶
      (homotopySpherePolePair.{u} n).singularHomology (C := ModuleCat.{u} ℤ) (ModuleCat.of ℤ (ULift.{u} ℤ)) n :=
  (TopPair.singularHomologyInclIso (ModuleCat.{u} ℤ)
    (ModuleCat.of ℤ (ULift.{u} ℤ)) n).hom.app (homotopySphere n) ≫
      TopPair.singularHomologyMap
        (TopPair.j (homotopySpherePolePair n)) (ModuleCat.of ℤ (ULift.{u} ℤ)) n

/-- Descend the actual native generalized loop through the pinned cube quotient. -/
noncomputable def cubicalSphereRepresentative (n : ℕ) [NeZero n]
    (X : Type u) [TopologicalSpace X] (x : X) (_g : GenLoop (Fin n) X x) :
    homotopySphere n ⟶ TopCat.of X := by
  sorry

theorem cubicalSphereRepresentative_quotient (n : ℕ) [NeZero n]
    (X : Type u) [TopologicalSpace X] (x : X) (g : GenLoop (Fin n) X x)
    (t : Fin n → unitInterval) :
    cubicalSphereRepresentative n X x g (ULift.up (cubicalSphereQuotient n t)) = g.1 t := by
  sorry

/-- The outward-first sphere class fixed by the actual positive local chart below.
Stage 6 compares its canonical fundamental class with this earlier reference. -/
noncomputable def sphereFundamentalGenerator (n : ℕ) [NeZero n] :
    ordinaryIntegralHomology (homotopySphere n) n := by
  sorry

/-- A fixed positively oriented chart cube in the positive hemisphere. Its coordinates
are pinned below, so it independently fixes the outward-first local orientation. -/
noncomputable def spherePositiveCubeMap (n : ℕ) :
    (coordinateCubePair.{u} n).fst ⟶ homotopySphere.{u} n := by
  sorry

theorem spherePositiveCubeMap_tail (n : ℕ) (t : (coordinateCubePair.{u} n).fst)
    (j : Fin n) :
    (spherePositiveCubeMap n t).down.1 j.succ =
      ((t.down j : ℝ) - 1 / 2) / (n + 1) := by
  sorry

theorem spherePositiveCubeMap_head (n : ℕ) (t : (coordinateCubePair.{u} n).fst) :
    (spherePositiveCubeMap n t).down.1 0 =
      Real.sqrt (1 - ∑ j : Fin n, (((t.down j : ℝ) - 1 / 2) / (n + 1)) ^ 2) := by
  sorry

theorem spherePositiveCubeMap_boundary (n : ℕ) (t : (coordinateCubePair.{u} n).fst)
    (ht : t.down ∈ Cube.boundary (Fin n)) :
    spherePositiveCubeMap n t ≠ ULift.up (homotopySpherePole n) := by
  sorry

/-- The actual map of pairs induced by that positive chart cube. -/
noncomputable def spherePositiveCubePairMap (n : ℕ) :
    coordinateCubePair.{u} n ⟶
      puncturedPair (homotopySphere.{u} n) (ULift.up (homotopySpherePole n)) :=
  TopPair.ofSubsetMap (spherePositiveCubeMap n) (by
    intro t ht
    exact spherePositiveCubeMap_boundary n t ht)

noncomputable def homotopySphereAbsoluteToLocal (n : ℕ) :
    ordinaryIntegralHomology (homotopySphere.{u} n) n ⟶
      (puncturedPair (homotopySphere.{u} n) (ULift.up (homotopySpherePole n))).singularHomology
        (C := ModuleCat.{u} ℤ) (ModuleCat.of ℤ (ULift.{u} ℤ)) n :=
  (TopPair.singularHomologyInclIso (ModuleCat.{u} ℤ)
    (ModuleCat.of ℤ (ULift.{u} ℤ)) n).hom.app (homotopySphere n) ≫
      TopPair.singularHomologyMap
        (TopPair.j (puncturedPair (homotopySphere n) (ULift.up (homotopySpherePole n))))
        (ModuleCat.of ℤ (ULift.{u} ℤ)) n

/-- Local value +1 in the fixed positive chart independently pins the sphere class. -/
theorem sphereFundamentalGenerator_positiveLocal (n : ℕ) [NeZero n] :
    homotopySphereAbsoluteToLocal n (sphereFundamentalGenerator n) =
      ((coordinateCubePair.{u} n).singularHomologyMap (spherePositiveCubePairMap n)
        (ModuleCat.of ℤ (ULift.{u} ℤ)) n) (coordinateCubeReferenceClass n) := by
  sorry

/-- The quotient has degree +1 on the fixed coordinate-order reference class. -/
theorem cubicalSphereQuotient_referenceClass (n : ℕ) [NeZero n] :
    ((coordinateCubePair.{u} n).singularHomologyMap (cubicalSpherePairMap n)
      (ModuleCat.of ℤ (ULift.{u} ℤ)) n) (coordinateCubeReferenceClass n) =
        homotopySphereAbsoluteToRelative n (sphereFundamentalGenerator n) := by
  sorry

/-- The general Stage 8.3 Hurewicz map, including the abelianization map in degree one. -/
noncomputable def absoluteHurewicz (n : ℕ) [NeZero n]
    (X : Type u) [TopologicalSpace X] (x : X) :
    HomotopyGroup (Fin n) X x →* Multiplicative (ordinaryIntegralHomology (TopCat.of X) n) := by
  sorry

/-- The defining formula uses the actual sphere map induced by a native cubical representative. -/
theorem absoluteHurewicz_genLoop (n : ℕ) [NeZero n]
    (X : Type u) [TopologicalSpace X] (x : X) (g : GenLoop (Fin n) X x) :
    Multiplicative.toAdd (absoluteHurewicz n X x ⟦g⟧) =
      (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} ℤ) n).obj
        (ModuleCat.of ℤ (ULift.{u} ℤ))).map (cubicalSphereRepresentative n X x g))
          (sphereFundamentalGenerator n) := by
  sorry

/-- Specialization of the general normalized Hurewicz map; no second EM-specific map. -/
abbrev ordinaryEMHurewiczMap (A : Type u) [AddCommGroup A]
    (n : ℕ) [NeZero n] (K : OrdinaryEMModel A n) :=
  absoluteHurewicz n K.space K.point

/-- Hurewicz identification, normalized by the model's distinguished homotopy group. -/
noncomputable def ordinaryEMHurewiczIdentification (A : Type u) [AddCommGroup A]
    (n : ℕ) [NeZero n] (K : OrdinaryEMModel A n) :
    ordinaryIntegralHomology K.space n ≅ ModuleCat.of ℤ A := by
  sorry

theorem ordinaryEMHurewiczIdentification_onHomotopy (A : Type u) [AddCommGroup A]
    (n : ℕ) [NeZero n] (K : OrdinaryEMModel A n)
    (p : HomotopyGroup (Fin n) K.space K.point) :
    (ordinaryEMHurewiczIdentification A n K).hom
      (Multiplicative.toAdd (ordinaryEMHurewiczMap A n K p)) =
        Multiplicative.toAdd (K.homotopyIdentification p) := by
  sorry

/-- The identity universal class, with normalization fixed by the actual Hurewicz map. -/
noncomputable def ordinaryEMUniversalClass (A : Type u) [AddCommGroup A]
    (n : ℕ) [NeZero n] (K : OrdinaryEMModel A n) :
    K.space.singularCohomology (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ
      (ModuleCat.of ℤ A) n := by
  sorry

theorem ordinaryEMUniversalClass_kronecker (A : Type u) [AddCommGroup A]
    (n : ℕ) [NeZero n] (K : OrdinaryEMModel A n) :
    K.space.singularKronecker ℤ n (ordinaryEMUniversalClass A n K) =
      (ordinaryEMHurewiczIdentification A n K).hom := by
  sorry

/-- Homotopy classes use the native continuous-map homotopy equivalence relation. -/
def continuousHomotopySetoid (X Y : TopCat.{u}) : Setoid C(X, Y) where
  r := ContinuousMap.Homotopic
  iseqv := ContinuousMap.Homotopic.equivalence

abbrev continuousHomotopyClasses (X Y : TopCat.{u}) :=
  Quotient (continuousHomotopySetoid X Y)

/-- The representing map is actual native cohomological pullback, descended along homotopy. -/
noncomputable def ordinaryEMPullback (A : Type u) [AddCommGroup A]
    (n : ℕ) [NeZero n] (K : OrdinaryEMModel A n) (X : TopCat.{u}) :
    continuousHomotopyClasses X K.space →
      X.singularCohomology (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) n :=
  Quotient.lift (fun f => TopCat.singularCohomologyMap (TopCat.ofHom f) n
    (ordinaryEMUniversalClass A n K)) (by
      intro f g h
      obtain ⟨H⟩ := h
      have heq := TopCat.Homotopy.congr_singularCohomologyMap
        (f := TopCat.ofHom f) (g := TopCat.ofHom g) H
        (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) n
      exact congrArg (fun q => q.hom (ordinaryEMUniversalClass A n K)) heq)

/-- Arbitrary CW complexes, with arbitrary components and dimensions. This theorem is
proved by cellular cocycle realization and the relative-cylinder weak topology. -/
theorem ordinaryEMRepresentability (A : Type u) [AddCommGroup A]
    (n : ℕ) [NeZero n] (K : OrdinaryEMModel A n)
    (X : TopCat.{u}) [T2Space X] [CWComplex (Set.univ : Set X)] :
    Function.Bijective (ordinaryEMPullback A n K X) := by
  sorry

/-- Relative cylinder with the actual product topology; interval coordinate is last. -/
@[instance_reducible] noncomputable def relativeCylinderCW (X : Type u) [TopologicalSpace X] [T2Space X]
    (B : Set X) [RelCWComplex (Set.univ : Set X) B] :
    RelCWComplex (Set.univ : Set (X × unitInterval))
      {p | p.1 ∈ B ∨ p.2 = 0 ∨ p.2 = 1} := by
  sorry

/-! ### Stage 4.5: ordinary pair quotient/cofiber comparisons -/

/-- Collapse the given subspace together with a separately added basepoint. -/
def ordinaryCofiberSupport {X : Type u} (B : Set X) : Set (X ⊕ PUnit) :=
  {p | p.elim (fun x => x ∈ B) (fun _ => True)}

def ordinaryCofiberSetoid {X : Type u} (B : Set X) : Setoid (X ⊕ PUnit) where
  r x y := x = y ∨ (x ∈ ordinaryCofiberSupport B ∧ y ∈ ordinaryCofiberSupport B)
  iseqv := by
    constructor
    · intro x
      exact Or.inl rfl
    · intro x y h
      rcases h with h | ⟨hx, hy⟩
      · exact Or.inl h.symm
      · exact Or.inr ⟨hy, hx⟩
    · intro x y z hxy hyz
      rcases hxy with rfl | ⟨hx, hy⟩
      · exact hyz
      · rcases hyz with rfl | ⟨_, hz⟩
        · exact Or.inr ⟨hx, hy⟩
        · exact Or.inr ⟨hx, hz⟩

/-- Native pointed pushout carrier, including X₊ when B is empty. -/
def ordinaryPairQuotient (X : Type u) [TopologicalSpace X] (B : Set X) : TopCat.{u} :=
  TopCat.of (Quotient (ordinaryCofiberSetoid B))

def ordinaryPairQuotientPoint (X : Type u) [TopologicalSpace X] (B : Set X) :
    ordinaryPairQuotient X B := Quotient.mk (ordinaryCofiberSetoid B) (Sum.inr PUnit.unit)

/-- The actual collapse from X. -/
def ordinaryPairQuotientMap (X : Type u) [TopologicalSpace X] (B : Set X) :
    TopCat.of X ⟶ ordinaryPairQuotient X B :=
  TopCat.ofHom ⟨fun x => Quotient.mk (ordinaryCofiberSetoid B) (Sum.inl x), by
    letI : Setoid (X ⊕ PUnit) := ordinaryCofiberSetoid B
    exact continuous_quotient_mk'.comp continuous_inl⟩

/-- The reduced pair uses the same collapse and its added point. -/
def ordinaryPairQuotientPairMap (X : Type u) [TopologicalSpace X] (B : Set X) :
    TopPair.ofSubset (X := TopCat.of X) B ⟶
      TopPair.ofSubset (X := ordinaryPairQuotient X B) {ordinaryPairQuotientPoint X B} :=
  TopPair.ofSubsetMap (ordinaryPairQuotientMap X B) (by
    intro x hx
    change Quotient.mk (ordinaryCofiberSetoid B) (Sum.inl x) = Quotient.mk (ordinaryCofiberSetoid B) (Sum.inr PUnit.unit)
    exact Quotient.sound (Or.inr ⟨hx, trivial⟩))

/-- CW-pair specialization of the definitive closed cofibration/NDR quotient comparison.
The target is reduced homology, realized natively as the pair relative to its basepoint. -/
theorem ordinaryPairQuotientComparison (R : Type u) [CommRing R] (M : ModuleCat.{u} R)
    (X : Type u) [TopologicalSpace X] [T2Space X] (B : Set X)
    [RelCWComplex (Set.univ : Set X) B] (n : ℕ) :
    IsIso (TopPair.singularHomologyMap (ordinaryPairQuotientPairMap X B) M n) := by
  sorry

/-- Cohomology uses the actual contravariant native pair map. -/
theorem ordinaryPairQuotientCohomologyComparison (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) (X : Type u) [TopologicalSpace X] [T2Space X] (B : Set X)
    [RelCWComplex (Set.univ : Set X) B] (n : ℕ) :
    IsIso (TopPair.singularCohomologyMap (R := ModuleCat.of R R) (k := R) (M := M)
      (ordinaryPairQuotientPairMap X B) n) := by
  sorry

section SimplyConnectedObstructions

variable (X : Type u) [TopologicalSpace X] [T2Space X] (B : Set X)
  [RelCWComplex (Set.univ : Set X) B]
  (Y : Type u) [TopologicalSpace Y] [SimplyConnectedSpace Y] (y : Y)
  (n : ℕ) [Nontrivial (Fin n)]

/-- Constant-coefficient specialization: cochains are Hom of integral cellular chains into
πₙ(Y), not the dual of πₙ(Y)-valued cellular chains. -/
abbrev relativeObstructionCochainComplex :=
  (TauCeti.cellularChainComplex (D := B) (Set.univ : Set X)
    (ModuleCat.of ℤ (ULift.{u} ℤ))).linearYonedaObj ℤ
      (ModuleCat.of ℤ (Additive (HomotopyGroup (Fin n) Y y)))

/-- The cochain evaluates a characteristic-map boundary after its basepoint transport. -/
noncomputable def relativeObstructionCochain
    (_f : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) n).fst ⟶ TopCat.of Y) :
    (relativeObstructionCochainComplex X B Y y n).X (n + 1) := by
  sorry

theorem relativeObstructionCochain_isCocycle
    (f : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) n).fst ⟶ TopCat.of Y) :
    (relativeObstructionCochainComplex X B Y y n).d (n + 1) (n + 2)
      (relativeObstructionCochain X B Y y n f) = 0 := by
  sorry

/-- Extension of the fixed map is controlled by the zero cochain, rather than zero class. -/
theorem relativeObstructionCochain_zero_iff_extension
    (f : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) n).fst ⟶ TopCat.of Y) :
    relativeObstructionCochain X B Y y n f = 0 ↔
      ∃ g : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) (n + 1)).fst ⟶
        TopCat.of Y,
        TopPair.Hom.fst (TauCeti.skeletonBasePairToSucc (D := B) (Set.univ : Set X) n) ≫
          g = f := by
  sorry

/-- The actual disk-gluing difference cochain of two maps agreeing on the preceding
skeleton, with the orientation used by the subsequent coboundary theorem. -/
noncomputable def relativeDifferenceCochain
    (f₀ f₁ : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) n).fst ⟶ TopCat.of Y)
    (_agree :
      TopPair.Hom.fst (TauCeti.skeletonBasePairInclusion (D := B) (Set.univ : Set X)
        (Nat.sub_le n 1)) ≫ f₁ =
      TopPair.Hom.fst (TauCeti.skeletonBasePairInclusion (D := B) (Set.univ : Set X)
        (Nat.sub_le n 1)) ≫ f₀) :
    (relativeObstructionCochainComplex X B Y y n).X n := by
  sorry

/-- The difference sign is pinned at the cochain level. -/
theorem relativeDifferenceCochain_coboundary
    (f₀ f₁ : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) n).fst ⟶ TopCat.of Y)
    (agree :
      TopPair.Hom.fst (TauCeti.skeletonBasePairInclusion (D := B) (Set.univ : Set X)
        (Nat.sub_le n 1)) ≫ f₁ =
      TopPair.Hom.fst (TauCeti.skeletonBasePairInclusion (D := B) (Set.univ : Set X)
        (Nat.sub_le n 1)) ≫ f₀) :
    (relativeObstructionCochainComplex X B Y y n).d n (n + 1)
      (relativeDifferenceCochain X B Y y n f₀ f₁ agree) =
        relativeObstructionCochain X B Y y n f₁ -
          relativeObstructionCochain X B Y y n f₀ := by
  sorry

/-- Realize the prescribed cochain itself, including cocycles with zero coboundary,
while fixing the preceding skeleton and base. -/
theorem relativeDifferenceCochain_realize
    (f₀ : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) n).fst ⟶ TopCat.of Y)
    (d : (relativeObstructionCochainComplex X B Y y n).X n) :
    ∃ f₁ : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) n).fst ⟶ TopCat.of Y,
      ∃ agree :
        TopPair.Hom.fst (TauCeti.skeletonBasePairInclusion (D := B) (Set.univ : Set X)
          (Nat.sub_le n 1)) ≫ f₁ =
        TopPair.Hom.fst (TauCeti.skeletonBasePairInclusion (D := B) (Set.univ : Set X)
          (Nat.sub_le n 1)) ≫ f₀,
        relativeDifferenceCochain X B Y y n f₀ f₁ agree = d := by
  sorry

/-- A cocycle represents zero exactly when it is a coboundary. This criterion permits
changing the n-skeleton, and the agreement retains the base and preceding skeleton. -/
theorem relativeObstructionClass_zero_iff_adjusted_extension
    (f₀ : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) n).fst ⟶ TopCat.of Y) :
    (∃ d : (relativeObstructionCochainComplex X B Y y n).X n,
      (relativeObstructionCochainComplex X B Y y n).d n (n + 1) d =
        relativeObstructionCochain X B Y y n f₀) ↔
    ∃ f₁ : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) n).fst ⟶ TopCat.of Y,
      TopPair.Hom.fst (TauCeti.skeletonBasePairInclusion (D := B) (Set.univ : Set X)
        (Nat.sub_le n 1)) ≫ f₁ =
      TopPair.Hom.fst (TauCeti.skeletonBasePairInclusion (D := B) (Set.univ : Set X)
        (Nat.sub_le n 1)) ≫ f₀ ∧
      ∃ g : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) (n + 1)).fst ⟶
        TopCat.of Y,
        TopPair.Hom.fst (TauCeti.skeletonBasePairToSucc (D := B) (Set.univ : Set X) n) ≫
          g = f₁ := by
  sorry

end SimplyConnectedObstructions

end

end TauCetiRoadmap.AlgebraicTopology

module
public import Mathlib

/-! Literal smooth-cutoff capacity. Extended-real codomain retains infinite infima.
The differential norm is the Euclidean covector norm. No spectrum or quasi-continuous
representative is defined by an unproved existence statement. -/
@[expose] public noncomputable section
namespace DirichletReciprocalGap
open MeasureTheory
open scoped ENNReal

/-- The actual compactly supported smooth tests dominating one near E. -/
def CapacityAdmissible {N : ℕ} (E : Set (EuclideanSpace ℝ (Fin N)))
    (f : EuclideanSpace ℝ (Fin N) → ℝ) : Prop :=
  ContDiff ℝ (⊤ : ℕ∞) f ∧ HasCompactSupport f ∧
    ∃ U, IsOpen U ∧ E ⊆ U ∧ ∀ x ∈ U, 1 ≤ f x

/-- Inhomogeneous H¹ cutoff energy, using the Euclidean differential norm. -/
def cutoffEnergy {N : ℕ} (f : EuclideanSpace ℝ (Fin N) → ℝ) : ℝ≥0∞ :=
  ∫⁻ x, ENNReal.ofReal (‖fderiv ℝ f x‖^2 + (f x)^2)

/-- Source's literal infimum over smooth cutoffs ≥1 on a neighborhood. -/
def cutoffCapacity {N : ℕ} (E : Set (EuclideanSpace ℝ (Fin N))) : ℝ≥0∞ :=
  ⨅ (f : EuclideanSpace ℝ (Fin N) → ℝ) (_h : CapacityAdmissible E f), cutoffEnergy f

/-- Tests for a larger set also work for each smaller subset. -/
theorem admissible_mono {N : ℕ} {E F : Set (EuclideanSpace ℝ (Fin N))}
    (hEF : E ⊆ F) {f : EuclideanSpace ℝ (Fin N) → ℝ}
    (hf : CapacityAdmissible F f) : CapacityAdmissible E f := by
  rcases hf with ⟨hs,hc,U,hU,hFU,hfU⟩
  exact ⟨hs,hc,U,hU,hEF.trans hFU,hfU⟩

/-- Monotonicity of the literal capacity definition. -/
theorem cutoffCapacity_mono {N : ℕ} {E F : Set (EuclideanSpace ℝ (Fin N))}
    (hEF : E ⊆ F) : cutoffCapacity E ≤ cutoffCapacity F := by
  refine le_iInf fun f => le_iInf fun hf => ?_
  exact iInf_le_of_le f (iInf_le_of_le (admissible_mono hEF hf) le_rfl)

/-- The empty set has exactly zero cutoff capacity. -/
theorem cutoffCapacity_empty (N : ℕ) :
    cutoffCapacity (∅ : Set (EuclideanSpace ℝ (Fin N))) = 0 := by
  apply le_antisymm
  · have hz : CapacityAdmissible (∅ : Set (EuclideanSpace ℝ (Fin N))) (fun _ => 0) := by
      refine ⟨contDiff_const, HasCompactSupport.zero, ∅, isOpen_empty, Set.Subset.rfl, ?_⟩
      intro x hx
      exact False.elim hx
    calc
      cutoffCapacity (∅ : Set (EuclideanSpace ℝ (Fin N))) ≤ cutoffEnergy (fun _ => 0) :=
        iInf_le_of_le _ (iInf_le_of_le hz le_rfl)
      _ = 0 := by simp only [cutoffEnergy, fderiv_const_apply, norm_zero, zero_pow,
        ne_eq, OfNat.ofNat_ne_zero, not_false_eq_true, add_zero, ENNReal.ofReal_zero,
        lintegral_zero]
  · exact bot_le

/-- Nullity passes to subsets, without replacing capacity by measure. -/
theorem cutoffCapacity_subset_zero {N : ℕ} {E F : Set (EuclideanSpace ℝ (Fin N))}
    (hEF : E ⊆ F) (hF : cutoffCapacity F = 0) : cutoffCapacity E = 0 := by
  apply le_antisymm
  · exact hF ▸ cutoffCapacity_mono hEF
  · exact bot_le
/-- Every admissible test has energy at least the outer Lebesgue measure of E. -/
theorem measure_le_cutoffEnergy {N : ℕ} {E : Set (EuclideanSpace ℝ (Fin N))}
    {f : EuclideanSpace ℝ (Fin N) → ℝ} (hf : CapacityAdmissible E f) :
    volume E ≤ cutoffEnergy f := by
  rcases hf with ⟨hs, hc, U, hU, hEU, hfU⟩
  calc
    volume E ≤ volume U := measure_mono hEU
    _ = ∫⁻ x in U, (1 : ℝ≥0∞) := (setLIntegral_one U).symm
    _ ≤ ∫⁻ x in U, ENNReal.ofReal (‖fderiv ℝ f x‖^2 + (f x)^2) := by
      apply setLIntegral_mono' hU.measurableSet
      intro x hx
      have hsq : (1 : ℝ) ≤ ‖fderiv ℝ f x‖^2 + (f x)^2 := by
        nlinarith only [hfU x hx, sq_nonneg (‖fderiv ℝ f x‖)]
      exact (ENNReal.ofReal_one ▸ ENNReal.ofReal_le_ofReal hsq)
    _ ≤ cutoffEnergy f := setLIntegral_le_lintegral _ _

/-- Measure domination for the actual cutoff capacity, not an assumed bridge. -/
theorem measure_le_cutoffCapacity {N : ℕ} (E : Set (EuclideanSpace ℝ (Fin N))) :
    volume E ≤ cutoffCapacity E := by
  exact le_iInf fun f => le_iInf fun hf => measure_le_cutoffEnergy hf

/-- In particular, capacity-null sets are Lebesgue-null. The converse is not asserted. -/
theorem measure_zero_of_cutoffCapacity_zero {N : ℕ}
    {E : Set (EuclideanSpace ℝ (Fin N))} (hE : cutoffCapacity E = 0) : volume E = 0 := by
  exact le_antisymm (hE ▸ measure_le_cutoffCapacity E) bot_le

/-- The differential energy is exactly the sum of squared Euclidean partials. -/
theorem differential_norm_sq {N : ℕ} (f : EuclideanSpace ℝ (Fin N) → ℝ)
    (x : EuclideanSpace ℝ (Fin N)) :
    ‖fderiv ℝ f x‖^2 = ∑ i : Fin N,
      (fderiv ℝ f x ((EuclideanSpace.basisFun (Fin N) ℝ) i))^2 :=
  (EuclideanSpace.basisFun (Fin N) ℝ).norm_dual (fderiv ℝ f x)

end DirichletReciprocalGap

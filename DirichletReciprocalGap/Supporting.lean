module
public import Mathlib

/-! Actual algebra of the Riccati appendix and scalar completion, arXiv:2607.01135v1.
Not a proof of the Dirichlet theorem, Bessel comparison or capacity rigidity. -/
@[expose] public section
namespace DirichletReciprocalGap

/-- Exact lower-barrier residual collection, Appendix A.1. -/
theorem lower_residual (x N C T : ℝ) :
    -2*(1-x^2)+x^4+(N-2)*x^2-4*(1-x^2)-4*(1-x^2)*x^2*T+
      C*(1-x^2)-(N-1) = (1-x^2)*(C-N-5-x^2-4*x^2*T) := by
  ring

/-- Exact coefficient collection of the upper-barrier derivative, Appendix A.1. -/
theorem upper_derivative_coefficients (k N x : ℝ) :
    (-4*k^2-k*N+4*k+N-1)*(1+(k-1)*x^2)-
      2*(k-1)*((-6*k-N+1)+(-4*k^2-k*N+4*k+N-1)*x^2) =
      (8*k^2-10*k-N+1)+(4*k^3-8*k^2-k*N+5*k+N-1)*x^2+
        N*k*(1+(k-1)*x^2) := by
  ring

/-- The polynomial identity for A0+A1 when 16k²=4N+21. -/
theorem upper_endpoint_sum (k N : ℝ) (hk : 16*k^2=4*N+21) :
    (8*k^2-10*k-N+1)+(4*k^3-8*k^2-k*N+5*k+N-1)=k/4 := by
  have hm := congrArg (fun z : ℝ => k*z) hk
  nlinarith only [hm]

/-- Nonnegative affine interpolation of the endpoint residual coefficients. -/
theorem affine_coefficient_nonneg (A0 A1 x : ℝ) (h0 : 0 ≤ A0)
    (h1 : 0 ≤ A0+A1) (hx : 0 ≤ x) (hx1 : x ≤ 1) : 0 ≤ A0+A1*x := by
  have h := add_nonneg (mul_nonneg h0 (sub_nonneg.mpr hx1)) (mul_nonneg h1 hx)
  nlinarith only [h]

/-- Elementary maximum bound used for the upper Riccati barrier. -/
theorem barrier_max_bound (k x : ℝ) (hk : 1 < k) :
    4*(k-1)*x^2 ≤ (1+(k-1)*x^2)^2 := by
  nlinarith only [sq_nonneg ((k-1)*x^2-1)]

/-- Exterior scalar inequality in the paper, stated without inventing Bessel constants. -/
theorem exterior_scalar_bound (N C t : ℝ) (hN : 1 ≤ N) (hC : N-1 < C)
    (ht : 0 ≤ t) (ht1 : t ≤ 1) : (1-t)^2/(C-(N-1)*t) ≤ 1/C := by
  have hCp : 0 < C := by linarith only [hN,hC]
  have hden : 0 < C-(N-1)*t := by nlinarith only [hN,hC,ht,ht1]
  apply (div_le_div_iff₀ hden hCp).mpr
  have hprod := mul_nonneg ht (by linarith only [ht1] : 0 ≤ 1-t)
  nlinarith only [hN,hC,hCp,hprod,ht]

/-- Homogeneous completion-of-squares step. -/
theorem square_completion (x r : ℝ) : -(x+r)*x = -(x+r/2)^2+r^2/4 := by
  ring

/-- Scalar normalization identity for the sharp ball constant, given nonzero inputs. -/
theorem normalization_identity (N a b : ℝ) (ha : a ≠ 0) (hgap : b^2-a^2 ≠ 0) :
    N*a^2/(b^2-a^2) = N/(b^2/a^2-1) := by
  field_simp

/-- Scaling preserves the literal reciprocal-gap ratio.
No theorem about the actual operator scaling is asserted here. -/
theorem gap_scaling (l k s : ℝ) (hs : s ≠ 0) :
    (s*l)/(s*k-s*l) = l/(k-l) := by
  rw [← mul_sub, mul_div_mul_left _ _ hs]
end DirichletReciprocalGap

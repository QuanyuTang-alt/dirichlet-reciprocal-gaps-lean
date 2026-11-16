# P28 full target, definitions and remaining proof chain

Pinned latest source: **arXiv:2607.01135v1**, live history and unversioned PDF checked. Full 31-page paper, 2,966-line source and Riccati algebra appendix read. Authors in order: **Yanyang Li, Quanyu Tang, Haiqi Zhang**.

## Theorem 1.2 in full
For every N≥2 and every nonempty bounded connected open Ω⊂ℝ^N (NO boundary regularity hypothesis), let λ₁<λ₂≤λ₃≤… be the actual weak Dirichlet Laplacian eigenvalues counted with multiplicities. Put ν=(N−2)/2 and let j_{ν,1},j_{ν+1,1} be the genuine first positive zeros of the genuine Bessel J functions. Then

 ∑_{i=1}^N λ₁/(λ_{i+1}−λ₁) ≥ N/(j_{ν+1,1}²/j_{ν,1}²−1).

Equality iff ∃a∈ℝ^N, ∃R>0, Cap_H¹(Ω△B_R(a))=0. For bounded Lipschitz domains, equality iff Ω is literally a ball. Both implications of capacity rigidity and the Lipschitz corollary are required. Capacity-zero is NOT measure-zero.

The source defines inhomogeneous capacity using compactly supported smooth cutoff tests ≥1 on an open neighborhood, with gradient plus L² energy. Its quasi-continuity, H¹₀ characterization, and zero-capacity invariance are necessary formal proofs, not imported literature hypotheses.

The disconnected extension (source label `rem:disconnected`) is additionally recorded as an outstanding claim, not silently called solved: zero gaps mean +∞; equality is a ball plus a separated (possibly empty) remainder D with λ₁(D)≥λ₂(ball), modulo zero capacity. The primary main theorem remains the connected statement.

## Binder classification
N with N≥2, Ω nonempty/open/bounded/connected — SOURCE/STANDING/TYPING. Dirichlet spectrum and Bessel first zero are genuine characterized objects: must prove well-definedness and all defining properties before using them. Capacity instead has a literal smooth-cutoff definition; its basic properties must be proved. The following are EXCESS final premises: ground state witness, spectral min-max, ball spectral values, Bessel-zero product/sum/order, Riccati barrier, weak polar slicing/remainder, trace Ritz, matrix mismatch or rigidity. These must be proved internally. No main export is fabricated.

## Full proof chain and attempted routes
- Genuine H¹₀/L² operator, compact resolvent, simple positive ground state on connected arbitrary domains, spectrum ordering/multiplicities and scaling.
- Ball Bessel quotient, actual first positive zeros and separation sector; endpoint expansions and Hadamard product, logarithmic derivative and Calogero zero sum.
- One-crossing integrating-factor Riccati lemma, lower and upper barriers with uniform-convergence/termwise derivative proofs, dimension split in mismatch and strict C>N−1.
- Zero extension ground-state square distribution identity, Sobolev polar slicing, regularized sqrt, weighted Wronskian origin limit, Tonelli and radial remainder.
- Sphere H¹ angular tensor estimate via genuine degree-two spherical harmonics and integration by parts.
- Weighted Weinberger center, Lipschitz trial map/Jacobian, actual ground-state transform and N-dimensional trace Ritz.
- Interior/exterior matrix mismatch, Hilbert–Schmidt completion and inverse/trace Cauchy–Schwarz, undo scaling.
- Full equality chain: scalar K, zero deficit, supported ground state, unit-ball minimizer profile, quasi-continuous uniqueness/H¹₀ characterization, no sphere-crossing, connectivity and inverse dilation of capacity-null sets. Lipschitz exterior-cone upgrade.

Local mathlib Bessel.lean was read in full: it defines complex Bessel J and gives analytic/recurrence results; differential equations are TODO and the required first-zero/ordering/product/Calogero infrastructure was not established by this module. This is a discovered partial library, not proof of the missing zero theorem.
External capacity source CKMA CapacityAndBBM @e7817714dfb6682f545e83252f890f94e16154ca was fully inspected. Its quasi-continuous existence and uniqueness proofs literally contain unfinished proof holes; they cannot be reused under the user's standard and were NOT imported.

Nine appendix/scalar identities have passed Lean compilation and the standard-three-axiom audit. The endpoint cubic collection was repaired by multiplying the quadratic relation by k before the explicit arithmetic closure. Eight capacity helpers now also prove monotonicity, empty-set capacity, subset nullity, outer-measure domination and capacity-zero implying measure-zero from the literal smooth cutoff energy. The last implication is only one direction and does not redefine capacity as measure. Proving these scalar identities alone does NOT formalize the full spectral theorem. Remaining gaps include actual Bessel and capacity bases as well as weak spectral/polar/spherical machinery. None is promoted to an assumption.

## Current semantic boundary
The algebra takes scalar variables and proves the literal appendix identities, coefficient bounds, exterior scalar ratio and homogeneous normalization. Those are explicitly supporting results, not assertions that the true operator produces these scalars. No capacity or eigenvalue fallback function appears; the principal theorem remains absent. No paper erratum or independent review is claimed.

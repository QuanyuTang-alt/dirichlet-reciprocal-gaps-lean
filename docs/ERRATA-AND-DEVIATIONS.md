# Errata and deviations

Source: arXiv:2607.01135v1. Counts are entries, not occurrences. This snapshot asserts no source error. Project repairs and missing formal foundations are not paper errata. The same writer checked this record; no independent source verifier reviewed it.

## Counts
- Source errata asserted: **0**.
- Scope deviations: **1**.

## Errata
None asserted. The main theorem has not passed formal proof acceptance.

## Deviations
1. **Scope: Theorem 1.2 and its supporting appendix.** This repository presently supplies only separate scalar algebra and literal cutoff-capacity foundations, not the principal spectral inequality or its equality characterization. See [Supporting.lean](../DirichletReciprocalGap/Supporting.lean) and [Capacity.lean](../DirichletReciprocalGap/Capacity.lean). Conditional scalar helpers keep their own names and are not substituted for the source theorem. The capacity differential norm agrees with the coordinate-squared norm by `differential_norm_sq`. No altered eigenvalue, zero-capacity or Bessel-zero definition is used to claim completion.

## Proof route and remaining scope
`upper_endpoint_sum` uses the source quadratic relation multiplied by k. Capacity measure domination follows by comparing the neighborhood integral with each admissible test. These are elementary implementation choices, not alternative full proofs. Actual Bessel, weak spectral, polar/angular and capacity-rigidity bridges remain outstanding. See [next steps](NEXT-STEPS.md).

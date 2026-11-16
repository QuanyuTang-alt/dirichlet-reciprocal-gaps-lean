# P28 Dirichlet reciprocal-gap formalization

Original paper authors (in source order): **Yanyang Li, Quanyu Tang, Haiqi Zhang**.
**形式化进行中，尚未完成，未达到 Palomar 提交标准。**
Formalization project contributor and responsible maintainer: **Quanyu Tang**; Lean support implementation assisted by **Doubao Work**. Original authorship does not imply code review. No independent human review or source-author endorsement occurred.

Source: *The Ashbaugh–Benguria reciprocal-gap conjecture for Dirichlet eigenvalues*, latest checked release **arXiv:2607.01135v1**. The live submission history and unversioned PDF were compared; an internal source filename is not a version selector.

## Status B: checked supporting results, not the main theorem
Theorem 1.2 is **not formalized**. Its N-term inequality for actual weak Dirichlet eigenvalues, every-dimensional range N≥2, arbitrary bounded connected open domains, full capacity-zero equality iff, and literal-ball Lipschitz corollary all remain outstanding. No smooth-only replacement, arbitrary spectral sequence, fake capacity or extra spectral/Bessel hypotheses is advertised as the result. The disconnected extension is also recorded as outstanding.

- `DirichletReciprocalGap.Supporting`: 9 complete scalar lemmas for Appendix A residual algebra, endpoint coefficients, nonnegative interpolation, exterior scalar inequality, square completion, normalization and scalar scaling. Conditional scalar premises are **not** claimed to have been supplied by actual eigenvalues/Bessel zeros.
- `DirichletReciprocalGap.Capacity`: literal smooth-cutoff H¹ energy/capacity, 8 complete helpers for admissibility and capacity monotonicity, empty capacity, subset nullity, outer Lebesgue measure domination, capacity-null implies measure-null, and exact squared differential norm as a sum of squared Euclidean partials. Capacity is not redefined as measure, and the converse is not claimed.
- Dedicated audit covers every shipped theorem and the three definitions. Only `propext`, `Classical.choice`, `Quot.sound` occur. No actual proof uses unfinished holes, new unproved axioms or native evaluation certificates.
- Full principal Challenge/Solution/Comparator are deliberately **absent**, not fabricated around a scalar helper. Comparator and principal clean-checkout acceptance have **not** passed. No Palomar submission or registration has occurred.
- No GitHub Actions workflows ship; repository Actions are disabled and must stay disabled for this incomplete snapshot.

## Reproduce supporting checks
Lean `leanprover/lean4:v4.36.0-rc2`; mathlib `9d581dfff2e41de989072ea63abf3daf69311520`. All transitive Git revisions are in `lake-manifest.json`; no local path dependency is published.

```sh
lake exe cache get
lake build
lake env lean verification/Audit.lean
python3 scripts/check_progress.py
```

The committed `verification/build.txt` and `verification/axioms.txt` record development-checkout supporting validation with the pinned cached dependencies; they do **not** certify the main theorem or an isolated clean build. One source-preserving unused-premise warning remains in `barrier_max_bound`; checks were not disabled.

## Exact scope and continuation
See [source and semantics](docs/SOURCE-AND-SEMANTICS.md) and [next steps](docs/NEXT-STEPS.md). The major missing foundations are the actual H¹₀ compact-resolvent Dirichlet operator and ground state; genuine Bessel first zeros/ODE/product/Calogero comparison; polar weak ground-state and spherical harmonic machinery; actual trace Ritz and matrix estimate; quasi-continuity, H¹₀ capacity characterization and full rigidity. Necessary literature results are proof obligations, not final hypotheses. External incomplete capacity candidates were inspected and not imported.

## Errata and deviations
[Record](docs/ERRATA-AND-DEVIATIONS.md): 0 asserted source errata, 1 scope deviation (support only). The writer performed same-assistant checking; there was no independent verifier. Missing foundations and project proof repairs are not accusations of paper errors.

## Provenance and license
AI use: Doubao Work assisted source reading, library discovery, proof writing/repair and same-assistant semantic checking. Lean/Lake perform elaboration and kernel checking; mathlib supplies fixed formal dependencies; GitHub CLI handles publication. A verifiable model name is unavailable, so `models: []` is recorded in `formalization.yaml`; none is guessed. No independent human review is claimed. Code is Apache-2.0. Paper text, TeX, PDF, CV, credentials and unrelated private records are not distributed.

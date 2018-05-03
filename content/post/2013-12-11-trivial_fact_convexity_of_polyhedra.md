---
title: "Trivial fact: convexity of polyhedra"
date: "Wed, 11 Dec 2013 00:27:41 -0200"
tags: [debian, math, study]
---

Just a trivial fact: every polyhedron that is used in linear programming is
convex, that is $Ax \leq b$ is convex, for a matrix $A$ and a (column)
vector $b$.

**Proof:** Take any $x', x''$ that satisfy the system of inequalities $Ax \leq b$.
Then, for $0 \leq \lambda \leq 1$, we have that $\lambda Ax' \leq \lambda b$,
that is $A \lambda x' \leq \lambda b$.  Similarly, for $x''$, we have
that $A (1-\lambda) x' \leq (1-\lambda) b$. Summing the inequalities, we
get:
\[
 A[\lambda x' + (1-\lambda) x''] \leq [\lambda + (1-\lambda)] b = b,
\]
which means that $\hat{x} = \lambda x' + (1-\lambda) x''$ is again a
solution of the original set of inequalities, thus concluding the argument.


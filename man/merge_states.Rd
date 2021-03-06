\name{merge_states}
\alias{merge_states}
\title{Merge several states into one}
\usage{
merge_states(states, weight.matrix)
}
\arguments{
  \item{states}{vector of length \eqn{1 \leq j \leq K} with
  the states \eqn{i_1, \ldots, i_j \subset \lbrace 1,
  \ldots, K \rbrace} that should be merged; no repeating
  state labels allowed.}

  \item{weight.matrix}{\eqn{N \times K} weight matrix}
}
\description{
  This function merges states \eqn{i_1, \ldots, i_j} into a
  new, single state \eqn{i_1} by adding corresponding
  columns of the weight matrix (\eqn{\mathbf{W}_{i_1} =
  \mathbf{W}_{i_1} + \ldots + \mathbf{W}_{i_j}}) and
  removing columns \eqn{i_2, \ldots, i_j}.
}
\examples{
set.seed(10)
WW <- matrix(c(rexp(1000, 1/10), runif(1000)), ncol = 5, byrow = FALSE)
WW <- normalize(WW)
image2(WW, density = TRUE)
\dontrun{
merge_states(c(1, 1, 5), WW)  # error since states were repeated
}
WW_new <- merge_states(c(1, 3, 5), WW)

par(mfrow = c(1, 2), mar = c(1, 1, 2, 1))
image2(WW, main = paste(ncol(WW), "states"), legend = FALSE)
image2(WW_new, main = paste(ncol(WW_new), "states"), legend = FALSE)
}
\keyword{array}
\keyword{manip}

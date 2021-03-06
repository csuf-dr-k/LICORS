\name{data2LCs}
\alias{data2LCs}
\title{Iterate over (N+1)D field and get all LC configurations}
\usage{
data2LCs(field, LC.coordinates = list(PLC = NULL, FLC = NULL))
}
\arguments{
  \item{field}{spatio-temporal field; either a matrix or a
  3-dimensional array with time \eqn{t} as the first
  dimension, and the spatial coordinates as subsequent
  dimensions. Make sure to check
  \code{\link{compute_LC_coordinates}} for correct
  formatting.}

  \item{LC.coordinates}{coordinates for LC shape and
  dimension (usually the \code{$coordinates} value from the
  \code{"LC"} class; but also user-defined coordinates are
  possible here).}
}
\description{
  \code{data2LCs} gets all PLC or FLC configuration from a
  \eqn{(N+1)D} field given the LC template.  The shape and
  dimension of this LC template depends on coordinates
  passed on by \code{\link{setup_LC_geometry}}.

  \subsection{User-defined LC template}{

  Since \code{data2LCs} passes the \code{LC.coordinates}
  array to \code{\link{get_LC_config}} to iterate over the
  entire dataset, this functional programming approach
  allows user-defined light cone shapes (independent of the
  shapes implemented by \code{\link{setup_LC_geometry}}).

  Just replace the \code{$coordinates} from the \code{"LC"}
  class with a user-specified LC template. }
}
\examples{
set.seed(1)
AA <- matrix(rnorm(200), ncol = 10)
LC_geom <- setup_LC_geometry(speed = 1, horizon = list(PLC = 2, FLC = 0), shape = "cone")
bb <- data2LCs(t(AA), LC.coordinates = LC_geom$coordinates)
image2(bb$PLC)
plot(density(bb$FLC))

# a time series example
data(nottem)
xx <- nottem
LC_geom <- setup_LC_geometry(speed = 1, horizon = list(PLC = 24, FLC = 3), space.dim = 0)
bb <- data2LCs(xx, LC.coordinates = LC_geom$coordinates)
image2(bb$PLC)
plot(density(bb$FLC))
}
\seealso{
  \code{\link{compute_LC_coordinates}},
  \code{\link{setup_LC_geometry}}
}
\keyword{manip}

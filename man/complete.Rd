% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/complete.R
\name{complete}
\alias{complete}
\title{Complete a data frame with missing combinations of data.}
\usage{
complete(data, ..., fill = list())
}
\arguments{
\item{data}{A data frame}

\item{...}{Specification of columns to expand.

  To find all unique combinations of x, y and z, including those not
  found in the data, supply each variable as a separate argument.
  To find only the combinations that occur in the data, supply them
  as a single argument with \code{c()}: \code{expand(df, c(x, y, z))}.

  You can combine the two forms. For example,
  \code{expand(df, c(school_id, student_id), date)} would produce
  a row for every student for each date.}

\item{fill}{A named list that for each variable supplies a single value to
use instead of \code{NA} for missing combinations.}
}
\description{
This is a wrapper around \code{\link{expand}()},
\code{\link[dplyr]{left_join}()} and \code{\link{replace_na}} that's
useful for completing missing combinations of data. It turns implicitly
missing values into explicitly missing values.
}
\examples{
library(dplyr)
df <- data_frame(
  group = c(1:2, 1),
  item_id = c(1:2, 2),
  item_name = c("a", "b", "b"),
  value1 = 1:3,
  value2 = 4:6
)
df \%>\% complete(group, c(item_id, item_name))

# You can also choose to fill in missing values
df \%>\% complete(group, c(item_id, item_name), fill = list(value1 = 0))
}


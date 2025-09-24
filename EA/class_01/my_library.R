is_even <- function(x) {
  x %% 2 == 0
}

is_odd <- function(x) {
  !is_even(x)
}


#' Calculate the mean of a distribution
#'
#' @param arr A numeric vector os numbers
#' @return The mean
mean_ <- function(arr) {
  sum(arr) / length(arr)
}

#' Calculate the quartile of a distribution
#'
#' @param arr A numeric vector os numbers
#' @param q The quartile: 1, 2, 3
#' @return The mean
quartile_ <- function(arr, q) {
  x <- sort(arr)
  n <- length(x)
  p <- q * (n + 1) / 4
  if (!is.integer(p)) {
    i <- floor(p)
    i1 <- x[i]
    i2 <- x[i + 1]
    i1 + (i2 - i1) * (p - as.integer(p))
  } else {
    x[p]
  }
}

#' Calculate some percentile of a distribution
#'
#' @param arr A numeric vector os numbers
#' @param p The percentile [0, 1]
#' @return The mean
percentile_ <- function(arr, p) {
  x <- sort(arr)
  n <- length(x)
  p <- p * (n + 1)
  if (!is.integer(p)) {
    i <- floor(p)
    i1 <- x[i]
    i2 <- x[i + 1]
    i1 + (i2 - i1) * (p - as.integer(p))
  } else {
    x[p]
  }
}
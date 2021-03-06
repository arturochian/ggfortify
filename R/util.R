#' Backtransform \code{scale}-ed object
#' 
#' @param data Scaled data
#' @param center Centered vector
#' @param scale Scale vector
#' @return data.frame
#' @examples
#' df <- iris[-5]
#' ggfortify::unscale(base::scale(df))
#' @export
unscale <- function(data, center = NULL, scale = NULL) {
  if (is.null(scale)) {
    scale <- attr(data, 'scaled:scale')
  }
  if (is.null(center)) {
    center <- attr(data, 'scaled:center')
  }
  if (!is.null(scale) && !is.logical(scale)) {
    data <- base::scale(data, center = FALSE, scale = 1 / scale)
  }
  if (!is.null(center) && !is.logical(center)) {
    data <- base::scale(data, center = -center, scale = FALSE)
  }
  as.data.frame(data)
}


#' Expand \code{stats::formula} expression 
#' 
#' @param formula \code{stats::formula} instance
#' @return list
#' @examples
#' ggfortify:::parse.formula(y ~ x)
parse.formula <- function(formula) {
  
  # not to replace forecast::getResponse
  # library(nlme)
  
  vars <- terms(as.formula(formula))
  endog <- if(attr(vars, 'response'))
    nlme::getResponseFormula(formula)
  exog <- nlme::getCovariateFormula(formula)
  group <- nlme::getGroupsFormula(formula)
  
  result <- list(response = all.vars(endog),
                 covariates = all.vars(exog),
                 groups = all.vars(group))
  result
}


#' Wrapper for cbind 
#' 
#' @param data \code{data.frame} instance 
#' @param original Joined to data if provided.
#' cluster labels to the original
#' @return list
#' @examples
#' ggfortify:::cbind_wraps(iris[1:2], iris[3:5])
cbind_wraps <- function(df1, df2) {
  if (is.null(df1)) {
    return(df2)
  } else if (!is.data.frame(df1)) {
    df1 <- ggplot2::fortify(df1)
  }
  if (is.null(df2)) {
    return(df1)
  } else if (!is.data.frame(df2)) {
    df2 <- ggplot2::fortify(df2)
  }
  # prioritize df1 columns
  dots <- names(df2)[! colnames(df2) %in% colnames(df1)]
  if (length(dots) != length(colnames(df2))) {
    df2 <- dplyr::select_(df2, .dots = dots)
  }
  return(cbind(df1, df2))
}


#' Show deprecate warning
#' 
#' @param old.kw Keyword being deprecated
#' @param new.kw Keyword being replaced
#' @return NULL
#' @examples
#' ggfortify:::deprecate.warning('old', 'new')
deprecate.warning <- function(old.kw, new.kw) {
  message <- paste0("Argument `", old.kw, "` is being deprecated. Use `", new.kw, "` instead.")
  warning(message, call. = FALSE)
}

#' Raise error for unsupported type
#' 
#' @return NULL
stop.unsupported.type <- function() {
  stop(paste0('Unsupported class for autoplot: ', class(data)), call. = FALSE)
}


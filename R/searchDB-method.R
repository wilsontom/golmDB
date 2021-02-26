#' Search Database
#'
#' @include allClasses.R
#' @include allGenerics.R
#' @rdname searchDB
#' @param object a `GolmDB` S4 class
#' @param pattern a character string to search for
#' @return a `GolmDB` class containing on the accessions which matched the search pattern
#' @export

setMethod('searchDB', signature = 'GolmDB',
          function(object, pattern) {
            sidx <- stringr::str_detect(object@index$name, pattern) %>%
              which(isTRUE(.))

            object@accessions <- object@accessions[sidx]
            object@index <- object@index[sidx,]

            return(object)

          })

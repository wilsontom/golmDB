#' Find Compound Identifier
#'
#' @param object a `GolmAccession` object
#' @return a `GolmAccession` object
#' @export

findIdentifier <- function(object)
{
  inchi_find <-
    object@synon$value[stringr::str_detect(object@synon$value, 'InChI:')]

  if (length(inchi_find) > 0) {
    char_start <- stringr::str_locate(inchi_find, 'InChI=')[1]

    InChI <-
      paste(stringr::str_split(inchi_find, '')[[1]][char_start:nchar(inchi_find)[1]], collapse = '')

    object@compoundIdentifiers <- InChI
    names(object@compoundIdentifiers) <- 'InChI'

    return(object)

  }

  if (length(inchi_find) == 0) {
    inchikey_find <-
      object@synon$value[stringr::str_detect(object@synon$value, 'InChIKey:')]

    if (length(inchikey_find) > 0) {
      char_start <- stringr::str_locate(inchikey_find, 'InChIKey:')[2] + 1

      InChIKey <-
        paste(stringr::str_split(inchikey_find, '')[[1]][char_start:nchar(inchikey_find)[1]], collapse = '') %>%
        trimws()


      object@compoundIdentifiers <- InChIKey
      names(object@compoundIdentifiers) <- 'InChIKey'

    }

    return(object)

  }

  if (length(inchi_find) == 0 & length(inchikey_find) == 0) {
    object@compoundIdentifiers <- 'NA'

    return(object)

  }
}

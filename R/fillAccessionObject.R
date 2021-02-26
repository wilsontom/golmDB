#' Create Accession Object
#'
#' @param x a list element from a split Golm database
#' @return a `GolmAccession` object
#' @export

fillAccessionObject <- function(x)
{
  object <- methods::new('GolmAccession')

  object@name <-
    x[stringr::str_detect(x, 'Name:')] %>% stringr::str_remove(., 'Name: ')

  object@synon <-
    x[stringr::str_detect(x, 'Synon:')] %>% stringr::str_remove(., 'Synon: ') %>% tibble::as_tibble()

  object@peaks <-
    x[stringr::str_detect(x, 'Num Peaks: ')] %>% stringr::str_remove(., 'Num Peaks:') %>% as.numeric()

  SpecStart <-
    stringr::str_detect(x, 'Num Peaks: ') %>% which(isTRUE(.)) + 1
  Spec <- x[SpecStart:length(x)]

  SpecSplit <-
    purrr::map(Spec, ~ {
      stringr::str_split(., ' ')
    }) %>% unlist()

  SpecSplit <- SpecSplit[SpecSplit != ""]

  SpecSplit2 <- purrr::map(SpecSplit, ~ {
    stringr::str_split(., ':')
  })

  SpecMZ <- purrr::map(SpecSplit2, ~ {
    .[[1]][1]
  })

  SpecInt <- purrr::map(SpecSplit2, ~ {
    .[[1]][2]
  })

  object@spectra <-
    tibble::tibble(mz = unlist(SpecMZ), int = unlist(SpecInt))

  object <- findIdentifier(object)

  return(object)

}

#' Parse the Golm Database
#'
#' @param GolmInput a valid file path for a Golm database file in `MSP` format
#' @return a `GolmDatabase` object
#' @export

openGolmDB <- function(GolmInput)
{

  Golm <- readLines(GolmInput)

  spidx <- cumsum(Golm == '')
  gridx <-
    tibble::tibble(row = 1:length(Golm), gr = spidx) %>% dplyr::group_by(gr) %>%
    dplyr::group_split()

  GolmSplit <- list()
  for (i in seq_along(gridx)) {
    GolmSplit[[i]] <- Golm[gridx[[i]]$row]
  }
  GolmSplit <- GolmSplit[-length(GolmSplit)]

  object <- methods::new('GolmDB')

  object@source <- basename(GolmInput)

  object@accessions <- purrr::map(GolmSplit, fillAccessionObject)

  return(object)
}

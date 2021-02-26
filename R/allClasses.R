
setOldClass(c("spec_tbl_df","tbl_df", "tbl", "data.frame"))

#' Golm Database Class
#'
#' @slot dbInfo


setClass(
  Class = 'GolmDB',
  representation = representation(
    dbInfo = 'character',
    source = 'character',
    index = 'tbl_df',
    accessions = 'list'
  )
)




#' Golm Accession Class
#'
#' @slot dbInfo
#' @slot name
#' @slot synon
#' @slot compoundIdentifiers
#' @slot peaks
#' @slot spectra
#'


setClass(
  Class = 'GolmAccession',
  representation = representation(
    name = 'character',
    synon = 'tbl_df',
    compoundIdentifiers = 'character',
    peaks = 'numeric',
    spectra = 'tbl_df'
  )
)
















#' Clean Accession Names
#'
#' @include allClasses.R
#' @include allGenerics.R
#' @rdname cleanNames
#' @param object a `GolmDB` S4 class
#' @return a `GolmDB` class
#' @export

setMethod('cleanNames', signature = 'GolmDB',
          function(object) {

            if(stringr::str_detect(object@source, 'MDN35_FAME_') == TRUE){
              clean_index <- purrr::map(object@index$name, ~ {
                stringr::str_locate(., 'MDN35_FAME_')
              }) %>%
                purrr::map_dbl(., ~ {
                  .[[2]]
                })
            }

            if(stringr::str_detect(object@source, 'MDN35_ALK_') == TRUE){
              clean_index <- purrr::map(object@index$name, ~ {
                stringr::str_locate(., 'MDN35_ALK_')
              }) %>%
                purrr::map_dbl(., ~ {
                  .[[2]]
                })
            }


              clean_index <- clean_index + 1


              split_name <-
                purrr::map(object@index$name, ~ {
                  stringr::str_split(., '')
                }) %>% unlist(., recursive = FALSE)


              extract_name <- purrr::map2(split_name,
                                          clean_index, ~ {
                                            .x[c(.y:length(.x))]
                                          })

              clean_name <- purrr::map_chr(extract_name, ~ {
                paste(., collapse = '')
              })

              object@index$name <- clean_name

              return(object)
})

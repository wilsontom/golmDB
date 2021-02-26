#' show-GolmAccession
#' @rdname show
#' @param object a `GolmAccession` object
#' @importFrom methods show
#' @export

setMethod('show', signature = 'GolmAccession',
          function(object){


            cat(cli::rule(
              left = crayon::bold('GolmDB Accession Object'),
              right = paste0('golmDB v', utils::packageVersion('golmDB'))
            ), '\n')

            cat(crayon::red(
              'Object Size:',
              format(utils::object.size(object), units = 'Kb'),
              '\n',
              '\n'
            ))


            cat(crayon:::green(
              object@name, '\n'
            ))

            cat(crayon::green(
              '# of peaks:', object@peaks
            ))

          }
)



#' show-GolmDB
#' @rdname show
#' @param object a `GolmDB` object
#' @export

setMethod('show', signature = 'GolmDB',
          function(object){


            cat(cli::rule(
              left = crayon::bold('GolmDB Database Object'),
              right = paste0('golmDB v', utils::packageVersion('golmDB'))
            ), '\n')

            cat(crayon::red(
              'Object Size:',
              format(utils::object.size(object), units = 'Mb'),
              '\n',
              '\n'
            ))

            cat(crayon::green(
              'Database Source:', object@source, '\n')
            )

            cat(crayon::green(
              '# of Accessions:', length(object@accessions))
            )







          }
)











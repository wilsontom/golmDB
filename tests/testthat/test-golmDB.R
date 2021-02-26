test_that("parsing-works", {

  test_file <-
    list.files(system.file('extdata', package = 'golmDB'), full.names = TRUE)

  test_object <- openGolmDB(test_file)

  expect_true(isS4(test_object))

  expect_true(isS4(test_object@accessions[[1]]))

  expect_true(test_object@source == basename(test_file))


  })

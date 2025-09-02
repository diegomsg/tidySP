#' Convert SharePoint List Properties to Tibble
#'
#' @param list A list of SharePoint list properties, typically from `get_sharepoint_site("site_name")$get_lists()[[1]]$properties`
#'
#' @return A tibble with nested list column
#'
#' @importFrom tibble as_tibble
#' @importFrom tidyr nest
#'
list_prop_to_tibble <- function(list) {
  lapply(
    list, \(x)
    tibble::as_tibble(x, .name_repair = "check_unique")
  ) |>
    dplyr::bind_rows() |>
    tidyr::nest(list = list)
}

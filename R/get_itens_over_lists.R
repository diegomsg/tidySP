#' Get Items from Multiple SharePoint Lists
#'
#' @param site SharePoint site object from `get_sharepoint_site("site_name")`
#' @param lists_properties_tbl Tibble from `get_list_properties()`
#' @param .progress Logical, whether to show progress bar
#'
#' @return A tibble with one row per list and a nested column with items
#'
#' @importFrom purrr pmap
#' @importFrom tibble tibble_row as_tibble
#' @export
#'
#' @examples
#' \dontrun{
#' site <- get_sharepoint_site("site_name")
#' props <- get_list_properties(site)
#' get_itens_over_lists(site, props)
#' }
get_itens_over_lists <- function(site, lists_properties_tbl, .progress = FALSE) {
  purrr::pmap(lists_properties_tbl, \(id, name, ...) {
    tibble::tibble_row(
      id = id,
      name = name,
      data = list(site$get_list(id)$list_items() |>
                    tibble::as_tibble())
    )
  }, .progress = .progress) |>
    dplyr::bind_rows()
}

#' Get Items from All SharePoint Lists in a Site
#'
#' @param site SharePoint site object from `get_sharepoint_site("site_name")`
#' @param .progress Logical, whether to show progress bar
#'
#' @return A tibble with one row per list and a nested column with items
#' @export
#'
#' @examples
#' \dontrun{
#' site <- get_sharepoint_site("site_name")
#' get_site_itens(site)
#' }
get_site_itens <- function(site, .progress = FALSE) {
  list_prop_tbl <- get_list_properties(site)
  get_itens_over_lists(
    site = site,
    lists_properties_tbl = list_prop_tbl,
    .progress = .progress
  )
}

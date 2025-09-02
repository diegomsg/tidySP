#' Get Tibble from SharePoint List Items by ID
#'
#' @param site SharePoint site object from `get_sharepoint_site("site_name")`
#' @param id SharePoint list ID
#'
#' @return A tibble with the list items
#'
#' @importFrom tibble as_tibble
#' @export
#'
#' @examples
#' \dontrun{
#' site <- get_sharepoint_site("site_name")
#' get_list_itens_by_id(site, "list_id")
#' }
get_list_itens_by_id <- function(site, id) {
  site$get_list(id)$list_items() |>
    tibble::as_tibble()
}

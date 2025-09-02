#' Get Properties of All SharePoint Lists in a Site
#'
#' @param site SharePoint site object from `get_sharepoint_site("site_name")`
#'
#' @return A tidy tibble with list properties
#' @export
#'
#' @examples
#' \dontrun{
#' site <- get_sharepoint_site("site_name")
#' get_list_properties(site)
#' }
get_list_properties <- function(site) {
  site_lists <- site$get_lists()
  lists_properties <- lapply(site_lists, \(x) x$properties)
  list_prop_to_tibble(lists_properties) |>
    tidy_list_properties()
}

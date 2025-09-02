#' Tidy SharePoint List Properties Tibble
#'
#' @param tbl Tibble from `list_prop_to_tibble()`
#'
#' @return A tidy tibble with flattened and parsed datetime columns
#'
#' @importFrom tidyr unnest_wider
#'
tidy_list_properties <- function(tbl) {
  tbl |>
    tidyr::unnest_wider(col = dplyr::where(is.list), names_sep = "_") |>
    tidyr::unnest_wider(col = "list_list", names_sep = "_") |>
    dplyr::mutate(
      dplyr::across(
        dplyr::ends_with("DateTime"),
        ~ as.POSIXlt.character(.x, format = "%Y-%m-%dT%H:%M:%OSZ", tz = "UTC")
      )
    )
}

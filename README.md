
# tidySP

tidySP as in tidy sharepoint data, provide tools to extract, organize, and transform data from SharePoint site lists into tidy and rectangular formats. Designed for seamless integration with the tidyverse ecosystem, enabling efficient analysis and reporting.

If you or your business use sharepoint to store information, you can extract lists data from specified sharepoint site.

The package uses the underlying functionaly of `Azure/Microsoft365R`.

## Resources

- `Microsoft365R` authentication
- Metadata extraction
- Tibble outputs for tidy format
- Batch extraction using `purrr`

## Installation

You can install the development version of tidySP like so:

``` r
pak::pak("diegomsg/tidySP")
```

## Example

This is a basic example which shows you how to extract lists info from site:

### Connect to sharepoint site

``` r
library(tidySP)
## connect to site
## site name is case sensitive.
site <- Microsoft365R::get_sharepoint_site("site_name")
## first time using will ask for permissions and trust
```

### Get properties from lists in site

```r
lists_properties <- get_list_properties(site)
```

### Get itens iterating over lists

Uses `purrr` functions to iterate over tibble, returning a nested tibble with data column. So it's possible to show progress bar.

```r
lists_itens <- get_itens_over_lists(
  site = site, 
  lists_properties_tbl = lists_properties,
  .progress = TRUE
)
```

### If you want a single list

Specify list to get items with list id.

```r
single_list <- get_list_itens_by_id(
  site = site,
  id = lists_properties$id[1]
)
```

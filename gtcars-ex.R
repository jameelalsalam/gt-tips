
library("tidyverse")
library("gt")

source("tab_style.R")

calc_gtcars_stats <- function(grp_data) summarize(grp_data, across(c("hp", "trq", "mpg_c", "mpg_h"), ~mean(.x, na.rm = TRUE)), .groups = "drop")

# function to construct markdown display labels
# currently this approach could be used on data cells, but not in the stub
make_model_disp_labels <- function(x) str_replace(x, "M([456])", "M<b>\\1</b>")

# you can store md and html pretty labels in a list (not always a character vector)
col_disp_labels <- list(
  "mfr" = "Manufacturer",
  "model" = "Model",
  "bdy_style" = "Body",
  "hp" = "HP",
  "trq" = md("Torque<br />(lb-ft)"),
  "mpg_c" = "City",
  "mpg_h" = "Highway"
)

# Construct Table Data, including custom calcs based on data not included in the table (so gt row and grand summaries won't work)

bmw_info <- filter(gtcars, mfr == "BMW") %>% 
  group_by(mfr, model, bdy_style) %>% 
  calc_gtcars_stats() %>%
  mutate(grp = "BMW", row_label = str_c(model, " ", bdy_style), .before = "mfr")

prime_comps <- filter(gtcars, mfr %in% c("Audi", "Maserati", "Jaguar")) %>%
  group_by(mfr, model = NA, bdy_style = NA) %>%
  calc_gtcars_stats() %>%
  mutate(grp = "Prime Competitors", row_label = mfr, .before = "mfr")

bdy_style_avgs <- filter(gtcars, mfr != "BWM") %>%
  group_by(mfr = "All non-BMW", model = NA, bdy_style) %>%
  calc_gtcars_stats() %>%
  mutate(grp = "By Body Style", row_label = bdy_style, .before = "mfr")

comparison_data <- bind_rows(bmw_info, prime_comps, bdy_style_avgs)

gttbl <- comparison_data %>%
  gt(
    rowname_col = "row_label",
    groupname_col = "grp"
  ) %>%
  cols_hide(c(mfr, model, bdy_style)) %>%
  
  # labels
  tab_stubhead("Vehicle") %>%
  tab_spanner(label = "Power", columns = c(hp, trq)) %>%
  tab_spanner(label = "Miles-per-gallon", columns = c(mpg_c, mpg_h)) %>%
  cols_label(!!! col_disp_labels) %>%
  cols_label(trq = html("Torque<br>(lb-ft)")) %>%
  
  # cell formatting
  fmt_number(columns = where(is.numeric), n_sigfig = 2) %>%
  #fmt_markdown(columns = c(grp)) %>% # currently not possible to format stub as markdown: https://github.com/rstudio/gt/issues/694
  tab_style_blue()

gttbl



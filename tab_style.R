tab_style_blue <- function(data) {
  
  data %>%
    opt_table_font(
      font = c(
        google_font("Lato"),
        default_fonts()
      )
    )  %>%
    tab_options(
      #table.width = px(600),
      table.font.size = 12,
      data_row.padding = px(5),
      
      heading.title.font.weight = "bold",
      heading.title.font.size = 18,
      
      heading.subtitle.font.weight = "normal",
      
      table.font.color.light = "#FFFFFF",
      heading.background.color = "#FFFFFF",
      heading.border.bottom.width = 0,
      
      table_body.hlines.color = "#007BA7",
      table_body.hlines.width = 1.5,
      table_body.vlines.color = "#007BA7",
      table_body.vlines.width = 1.5,
      table_body.border.top.color = "#FFFFFF",
      table_body.border.bottom.color = "#007BA7",
      
      table.border.bottom.width = 1.5,
      table.border.top.width = 1.5,
      table.border.right.color = "#007BA7",
      table.border.left.color = "#007BA7",
      
      row_group.font.weight = "bolder",
      row_group.background.color = "#e6edfc",
      row_group.border.top.color = "#007BA7",
      row_group.border.bottom.color = "#007BA7",
      row_group.border.left.color = "#007BA7",
      row_group.border.right.color = "#007BA7",
      row_group.border.right.width = 2,
      row_group.border.bottom.width = 2,
      row_group.border.top.width = 2,
      
      column_labels.font.weight = "bold",
      column_labels.background.color = "#007BA7",
      column_labels.text_transform = "capitalize",
      column_labels.border.lr.color = "#FFFFFF",
      column_labels.border.lr.width = 3,
      column_labels.border.top.width = 0,
      column_labels.border.bottom.width = 1,
      column_labels.border.bottom.color = "#FFFFFF",
      column_labels.vlines.width = 1.5,
      column_labels.vlines.color = "#007BA7",
      
      stub.font.weight = "normal",
      stub.border.color = "#007BA7",
      
      summary_row.background.color = "#e6edfc",
      summary_row.border.color = "#007BA7",
      
      grand_summary_row.background.color = "#e6edfc",
      grand_summary_row.border.color = "#007BA7",
      grand_summary_row.border.style = "normal",
      grand_summary_row.border.width = 3,
      heading.align = "left")
}

##
# Source all ui files
##
ui_files <- c("skr_fu", "skr_gei", "skr_gri", "skr_das")
lapply(ui_files, function(f){
  source(paste0("./iUI/", f, ".R"), local = FALSE)
})

##
# Shiny ui
##
mainUI <- fluidPage(theme = shinythemes::shinytheme("simplex"),
  
  # css style
  tags$head(
    includeCSS("ds_style.css")
  ),
  
  navbarPage(
    "Data Sneaker",
    ##
    # Workers comp tab
    ##
    tabPanel(
      "High-Top",
      navlistPanel(
        ##
        # High-level inspection
        "Data Visualizer",
        widths = c(2, 10),
        tp_skr_fu,   # File uploader
        tp_skr_gei,  # General inspection
        tp_skr_gri,  # Graphical inspection
        tp_skr_das   # categorical data summary
      )
    )
    
  )
  # End of navbarpage
)

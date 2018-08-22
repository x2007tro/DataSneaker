##
# Data upload tabPanel
##
tp_skr_fu <- tabPanel(
  "Data Upload",
  
  fluidRow(
    column(
      width = 6,
      
      tags$div(
        class = "block_outter_frame",
        tags$h3(
          class = "block_title",
          "File Upload"
        ),
        tags$div(
          class = "block_inner_frame",
          
          ##
          # Real content starts here
          tags$div(
            class = "skr_fu_div", 
            
            # Input: Select a file ----
            fileInput("skr_f1", "Choose XLSX File",
                      multiple = FALSE,
                      accept = c(".xlsx"))
          )
        )
      )
    ),
    column(
      width = 6,
      
      tags$div(
        class = "block_outter_frame",
        tags$h3(
          class = "block_title",
          "File Upload"
        ),
        tags$div(
          class = "block_inner_frame",
          
          ##
          # Real content starts here
          tags$div(
            class = "skr_fu_div", 
            
            # Input: Select a file ----
            fileInput("skr_f2", "Choose XLSX File",
                      multiple = FALSE,
                      accept = c(".xlsx"))
          )
        )
      )
    )
  )
)

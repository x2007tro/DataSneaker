##
# Graphical inspection tabPanel
##
tp_skr_gri <- tabPanel(
  "Graphical Inspection",
  
  fluidRow(
    column(
      width = 6,
      
      tags$div(
        class = "block_outter_frame",
        tags$h3(
          class = "block_title",
          "Histogram"
        ),
        tags$div(
          class = "block_inner_frame",
          
          ##
          # Real content starts here
          tags$div(
            class = "skr_gri_div", 

            uiOutput("skr_gri1")
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
          "Histogram"
        ),
        tags$div(
          class = "block_inner_frame",
          
          ##
          # Real content starts here
          tags$div(
            class = "skr_gri_div", 
            
            uiOutput("skr_gri2")
          )
        )
      )
    )
  )
)

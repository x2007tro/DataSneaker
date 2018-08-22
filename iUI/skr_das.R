##
# Data summary tabPanel
##
tp_skr_das <- tabPanel(
  "Data Summary",
  
  fluidRow(
    column(
      width = 6,
      
      tags$div(
        class = "block_outter_frame",
        tags$h3(
          class = "block_title",
          "Summary Table"
        ),
        tags$div(
          class = "block_inner_frame",
          
          ##
          # Real content starts here
          tags$div(
            class = "skr_das_div", 

            uiOutput("skr_das1")
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
          "Summary Table"
        ),
        tags$div(
          class = "block_inner_frame",
          
          ##
          # Real content starts here
          tags$div(
            class = "skr_das_div", 
            
            uiOutput("skr_das2")
          )
        )
      )
    )
  )
)

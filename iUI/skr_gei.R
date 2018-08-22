##
# General inspection tabPanel
##
tp_skr_gei <- tabPanel(
  "General Inspection",
  
  fluidRow(
    column(
      width = 6,
      
      tags$div(
        class = "block_outter_frame",
        tags$h3(
          class = "block_title",
          "Information"
        ),
        tags$div(
          class = "block_inner_frame",
          
          ##
          # Real content starts here
          tags$div(
            class = "skr_gei_div", 

            uiOutput("skr_gei1")
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
          "Information"
        ),
        tags$div(
          class = "block_inner_frame",
          
          ##
          # Real content starts here
          tags$div(
            class = "skr_gei_div", 
            
            uiOutput("skr_gei2")
          )
        )
      )
    )
  )
)

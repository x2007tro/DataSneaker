##
# Source server and ui components
##
source("global.R", local = FALSE)
source("iUI/main.R")
source("iServer/main.R")
source("helper/vis.R")

##
# Launch shiny app
##
shinyApp(
  ui = mainUI,
  server = mainServer
)
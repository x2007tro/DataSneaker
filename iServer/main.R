#
# Shiny server
#
mainServer <- function(input, output, session) {

  ##
  # Data initialization
  ##
  source("./iServer/skr_fu.R", local = TRUE)

  ##
  # General inspection
  ##
  source("./iServer/skr_gei.R", local = TRUE)
  
  ##
  # Graphical inspection
  ##
  source("./iServer/skr_gri.R", local = TRUE)
  
  ##
  # Data summary
  ##
  source("./iServer/skr_das.R", local = TRUE)
}

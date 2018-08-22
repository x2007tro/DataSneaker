##
# Initalize instructions
##
dataset1 <- reactive({
  
  ##
  # wc wscc rset
  withProgress(
    message = 'Reading data',
    detail = 'This may take a while...', value = 0, 
    {
      ##
      # File input
      req(input$skr_f1)
      dataset <- readxl::read_excel(input$skr_f1$datapath, sheet = 1, col_names = TRUE)
      dataset <- as.data.frame(dataset)
      
      ##
      # Series of actions
      dataset_clean <- DataCleanup(dataset)
      gei <- GeneralInspection(dataset_clean)
      gri <- GraphicalInspection(dataset_clean)
      das <- CategoricalInspection(dataset_clean)
      
      ##
      # Bind results
      res <- list(
        coredata = list(Peek = gei, RawData = dataset),
        graph = gri,
        summ = das
      )
      
    }
  )
  
  return(res)
})

dataset2 <- reactive({
  
  ##
  # wc wscc rset
  withProgress(
    message = 'Reading data',
    detail = 'This may take a while...', value = 0, 
    {
      ##
      # File input
      req(input$skr_f2)
      dataset <- readxl::read_excel(input$skr_f2$datapath, sheet = 1, col_names = TRUE)
      dataset <- as.data.frame(dataset)
      
      ##
      # Series of actions
      dataset_clean <- DataCleanup(dataset)
      gei <- GeneralInspection(dataset_clean)
      gri <- GraphicalInspection(dataset_clean)
      das <- CategoricalInspection(dataset_clean)
      
      ##
      # Bind results
      res <- list(
        coredata = list(Peek = gei, RawData = dataset),
        graph = gri,
        summ = das
      )
      
    }
  )
  
  return(res)
})
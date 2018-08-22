##
# Handle data summary output
##

##
# First, render datatable output
output$skr_das1 <- renderUI({
  
  ##
  # create table output based on length
  lapply(1:length(dataset1()$summ), function(i){
    shiny::tagList(
      tags$h4(
        class = "small_block_title",
        names(dataset1()$summ)[i]
      ),
      DT::dataTableOutput(paste0("skr_das1_opt", i))
    )
    
  })
  
})

##
# render table
observe({
  
  lapply(1:length(dataset1()$summ), function(i){
    
    output[[paste0("skr_das1_opt", i)]] <- DT::renderDataTable({
      DT::datatable(
        dataset1()$summ[[i]], 
        options = list(
          pageLength = 10,
          orderClasses = TRUE,
          searching = TRUE,
          paging = TRUE,
          scrollX = 400,
          scrollY = 400,
          scrollCollapse = TRUE),
        rownames = FALSE
      )
    })
    
  })
  
})

##
# First, render datatable output
output$skr_das2 <- renderUI({
  
  ##
  # create table output based on length
  lapply(1:length(dataset2()$summ), function(i){
    shiny::tagList(
      tags$h4(
        class = "small_block_title",
        names(dataset2()$summ)[i]
      ),
      DT::dataTableOutput(paste0("skr_das2_opt", i))
    )
    
  })
  
})

##
# render table
observe({
  
  lapply(1:length(dataset2()$summ), function(i){
    
    output[[paste0("skr_das2_opt", i)]] <- DT::renderDataTable({
      DT::datatable(
        dataset2()$summ[[i]], 
        options = list(
          pageLength = 10,
          orderClasses = TRUE,
          searching = TRUE,
          paging = TRUE,
          scrollX = 400,
          scrollY = 400,
          scrollCollapse = TRUE),
        rownames = FALSE
      )
    })
    
  })
  
})
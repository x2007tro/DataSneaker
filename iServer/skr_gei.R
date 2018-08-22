##
# Handle data summary output
##

##
# First, render datatable output
output$skr_gei1 <- renderUI({
  
  ##
  # create table output based on length
  lapply(1:length(dataset1()$coredata), function(i){
    shiny::tagList(
      tags$h4(
        class = "small_block_title",
        names(dataset1()$coredata)[i]
      ),
      DT::dataTableOutput(paste0("skr_gei1_opt", i))
    )
    
  })
  
})

##
# render table
observe({
  
  lapply(1:length(dataset1()$coredata), function(i){
    
    output[[paste0("skr_gei1_opt", i)]] <- DT::renderDataTable({
      DT::datatable(
        dataset1()$coredata[[i]], 
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
output$skr_gei2 <- renderUI({
  
  ##
  # create table output based on length
  lapply(1:length(dataset2()$coredata), function(i){
    shiny::tagList(
      tags$h4(
        class = "small_block_title",
        names(dataset2()$coredata)[i]
      ),
      DT::dataTableOutput(paste0("skr_gei2_opt", i))
    )
  })
  
})

##
# render table
observe({
  
  lapply(1:length(dataset2()$coredata), function(i){
    
    output[[paste0("skr_gei2_opt", i)]] <- DT::renderDataTable({
      DT::datatable(
        dataset2()$coredata[[i]], 
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
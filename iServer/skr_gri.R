##
# Handle graphical data
##

##
# First, render ggplot
output$skr_gri1 <- renderUI({
  
  ##
  # create table output based on length
  lapply(1:length(dataset1()$graph), function(i){
    shiny::tagList(
      tags$h4(
        class = "small_block_title",
        names(dataset1()$graph)[i]
      ),
      plotOutput(paste0("skr_gri1_opt", i))
    )
    
  })
  
})

##
# render table
observe({
  
  lapply(1:length(dataset1()$graph), function(i){
    
    output[[paste0("skr_gri1_opt", i)]] <- renderPlot({
      dataset1()$graph[[i]] 
    })
    
  })
  
})

##
# First, render datatable output
output$skr_gri2 <- renderUI({
  
  ##
  # create table output based on length
  lapply(1:length(dataset2()$graph), function(i){
    shiny::tagList(
      tags$h4(
        class = "small_block_title",
        names(dataset2()$graph)[i]
      ),
      plotOutput(paste0("skr_gri2_opt", i))
    )
  })
  
})

##
# render table
observe({
  
  lapply(1:length(dataset2()$graph), function(i){
    
    output[[paste0("skr_gri2_opt", i)]] <- renderPlot({
      dataset2()$graph[[i]]
    })
    
  })
  
})
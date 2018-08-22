library(magrittr)
options(scipen=999)

##
# data cleanup
DataCleanup <- function(dataset){
  res <- lapply(1:ncol(dataset), function(i, ds){
    data <- ds[, i]
    type <- class(data)[1]
    
    if(type == "POSIXct" | type == "POSIXt"){
      data2 <- as.Date(data)
      years <- lubridate::year(data)
      
      res <- data.frame(
        #x1 = data2,
        x2 = years,
        stringsAsFactors = FALSE
      )
      
      colnames(res) <- c(colnames(ds)[i], paste0(colnames(ds)[i], "_year"))[2]
      
    } else {
      res <- ds[, i, drop = FALSE]
    }
    
    return(res)
  }, ds = dataset)
  
  fnl_res <- dplyr::bind_cols(res)
  return(fnl_res)
}

##
# overall inspection
GeneralInspection <- function(dataset){
  Mode <- function(x) {
    ux <- unique(x)
    ux[which.max(tabulate(match(x, ux)))]
  }
  
  res <- lapply(1:ncol(dataset), function(i){
    max_row <- nrow(dataset)
    subset <- dataset[,i]
    cls <- class(subset)[1]
    
    if(cls == "numeric"){ 
      subset <- round(subset, 2)
      minv <- min(subset, na.rm = TRUE)
      maxv <- max(subset, na.rm = TRUE)
      meanv <- mean(subset, na.rm = TRUE)
      mode <- paste0(Mode(subset))
    } else {
      minv <- -1
      maxv <- -1
      meanv <- -1
      mode <- Mode(subset)
    }
    
    has_val <- min(length(subset[subset!=""]),
                   length(subset[!is.na(subset)]))
    
    no_val <- max_row - has_val
    
    vals <- paste0(paste0(unique(subset)[1:min(length(unique(subset)), 10)], collapse = ","), "...")
    
    ##
    # aggregate result
    res <- data.frame(feature = colnames(dataset)[i],
                      class = cls,
                      has_value = has_val,
                      miss_value = no_val,
                      min_value = minv,
                      max_value = maxv,
                      mean_value = meanv,
                      mode_value = mode,
                      value_cnt = length(unique(subset)),
                      values = vals,
                      stringsAsFactors = FALSE)
    return(res)
    
  })
  fnl_res <- dplyr::bind_rows(res)
  return(fnl_res)
}

##
# graphical inspection
GraphicalInspection <- function(dataset){
  
  res <- lapply(1:ncol(dataset), function(i, ds){
    data <- ds[, i, drop = FALSE]
    type <- class(ds[, i])[1]
    if(type == "numeric"){
      x <- ggplot2::ggplot(data, ggplot2::aes(x = data[[1]])) +                    
        ggplot2::geom_histogram(col="red", ggplot2::aes(fill=..count..)) +
        ggplot2::scale_fill_gradient("Count", low = "green", high = "red") + 
        ggplot2::xlab(paste0(colnames(dataset)[i], " (", type,")")) + 
        ggplot2::ylab("Count") +
        ggplot2::ggtitle(paste0("Histogram for ", colnames(ds)[i])) +
        ggplot2::labs(caption = paste0("Plot produced on ", Sys.time()))
    } else {
      x <- ggplot2::ggplot(data, ggplot2::aes(x = data[[1]])) +                    
        ggplot2::geom_bar(col="red", ggplot2::aes(fill=..count..)) +
        ggplot2::scale_fill_gradient("Count", low = "green", high = "red") + 
        ggplot2::xlab(paste0(colnames(dataset)[i], " (", type,")")) + 
        ggplot2::ylab("Count") +
        ggplot2::ggtitle(paste0("Histogram for ", colnames(ds)[i])) +
        ggplot2::labs(caption = paste0("Plot produced on ", Sys.time()))
    }
   
    return(x)
  }, ds = dataset)
  
  names(res) <- colnames(dataset)
  return(res)
}

##
# graphical inspection
CategoricalInspection <- function(dataset, nthres = 50){
  
  res <- lapply(1:ncol(dataset), function(i, ds){
    data <- ds[, i, drop = FALSE]
    feature_name <- colnames(ds)[i]
    type <- class(ds[, i])[1]
    nuqi <- length(unique(data[,1]))
    
    if(nuqi <= nthres){
      x <- data %>% 
        dplyr::group_by_at(feature_name) %>% 
        dplyr::summarise(count = n())
    } else {
      x <- data.frame(def = as.numeric(), stringsAsFactors = FALSE)
    }
    
    return(x)
  }, ds = dataset)
  
  names(res) <- colnames(dataset)
  return(res)
}
# Coursera - Developing Data Products- final Project 


# server.R file for the shiny app 


# This app was developed to help decide which car to purchanse based on annual cost of gasoline, using mtcars dataset, from [R] 

# mtcars dataset



library(shiny) 
library(datasets) 
library(dplyr) 



shinyServer(function(input, output) { 
    
    
    # Show the cars that correspond to the filters 
    output$table <- renderDataTable({ 

        data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg,  
                          AnnualGasolinecost = format(input$dis*52/mpg*input$cost,digits=2,big.mark=","), 
                          Cylinders = cyl, Horsepower = hp,  
                          Transmission = am) 
        data <- filter(data, AnnualGasolinecost <= format(input$gas,digits=2,big.mark=","), Cylinders %in% input$cyl,  
                       Transmission %in% input$am) 
        data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual")) 
        data <- arrange(data, AnnualGasolinecost) 
        data 
    }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30)) 
}) 
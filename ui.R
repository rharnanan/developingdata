# Coursera - Developing Data Products- Final Project 


# ui.R file for the shiny app 


# This app was developed to help decide which car to purchanse based on annual cost of gasoline, using mtcars dataset, from [R]  


library(markdown) 


shinyUI(navbarPage("Select the best car for your trip", 
                   tabPanel("Table", 
                            
                            # Sidebar 
                            sidebarLayout( 
                                sidebarPanel( 
                                    helpText("Basic information about your driving habbits and car"), 
                                    numericInput('dis', 'Weekly Miles Driven:', 200, min = 1, max = 1000000), 
                                    numericInput('cost', 'Gasoline Price (per gallon):', 3.15, min = 1, max = 200, step=0.01), 
                                    numericInput('gas', 'Projected Annual Expense on gasoline:', 1500, min=1000, max=1000000), 
                                    checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)), 

                                    checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1)) 
                                ), 
                                
                                
                                mainPanel( 
                                    dataTableOutput('table') 
                                ) 
                            ) 
                   ), 
                   tabPanel("ReadMe",
                            mainPanel( 
                                includeMarkdown("readme.Rmd") 
                            ) 
                   ) 
) 
)  
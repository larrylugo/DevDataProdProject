# Program: ui.R
# Author: Larry Lugo
# Course: Developing Data Products, Johns Hopkins University-Coursera
# Date: September, 2015

# Define User Interface (UI) for the application 

shinyUI(fluidPage(
  
  # Set general Theme using an external .css file
  
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap_hero.css")
  ),

  # Application title and sub-title
  
  titlePanel("Crops Water Stress and Photosynthesis: Linear Regression and Report App"),
    # Sub-title
    tags$div(
    tags$h4("Developing Data Products Course, Johns Hopkins University-Coursera / by Larry Lugo. September, 2015") 
    ), 
    # Add a horizontal rule
    tags$hr(), 

  # Sidebar 

  sidebarLayout(
      sidebarPanel(      
      img(src='logo.png', align = "center"),
      # Help text: identifies data source
      helpText(h6("Data source: ORNL-DAAC, NASA and World Resource Institute")),  
      textInput("name", label = h5("Name on report"), value = "Name"),
      HTML('</br>'),
      selectInput("dataset", h5("Choose a dataset:"), choices = c("Crops","Photosynthesis")),        
      HTML('</br>'),
      uiOutput('dv'),    
      HTML('</br>'),
      uiOutput('iv'),
      HTML('</br>'),
      radioButtons('format', h5('Specify Document format and press Download'), c('PDF', 'HTML', 'Word'), inline = TRUE),
      downloadButton('downloadReport')),
        
  # Main panel 
    
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Data",
                           tags$hr(),
                           HTML("</br>Select a data set from the 'Choose a dataset' menu. Press 'Help' for more details.</br> </br>"),
                           numericInput("obs", label = h5("Number of observations to view"), 10),
                           tableOutput("view")),
                                                             
                  tabPanel("Summary Statistics",
                           tags$hr(),
                           HTML("</br>Dependent and Independent variables percentiles</br> </br>"),
                           verbatimTextOutput("summary"),
                           textInput("text_summary", label = h5("Analysis"), value = "Enter text...")),
                
                  tabPanel("Histograms",                   
                           tags$hr(), 
                           plotOutput("distPlot_dv"),
                           sliderInput("bins_dv", "Number of bins:", min = 1, max = 50, value = 7),  
                           textInput("text_hist_dv", label = h5("Analysis"), value = "Enter text..."),
                           
                           plotOutput("distPlot_iv"),
                           sliderInput("bins_iv", "Number of bins:", min = 1, max = 50, value = 7),
                           textInput("text_hist_iv", label = h5("Analysis"), value = "Enter text...")),                       
                           
                  tabPanel("Scatter Plot",                   
                           tags$hr(),
                           plotOutput("scatter"),
                           textInput("text_scatter", label = h5("Analysis"), value = "Enter text...")),  
                  
                  tabPanel("Correlations", 
                           tags$hr(),
                           HTML("</br>General Correlation Matrix</br> </br>"),
                           htmlOutput("corr"),
                           HTML('</br> </br>'),
                           textInput("text_correlation", label = h5("Analysis"), value = "Enter text...")),
                  
                  tabPanel("Model",                   
                           tags$hr(),
                           HTML("</br>Summary of model output</br> </br>"),
                           verbatimTextOutput("model"),
                           textInput("text_model", label = h5("Analysis"), value = "Enter text...")),
                  
                  tabPanel("Residuals",                   
                           tags$hr(),
                           plotOutput("residuals_hist"),
                           plotOutput("residuals_scatter"),
                           plotOutput("residuals_qqline"),
                           textInput("text_residuals", label = h5("Analysis"), value = "Enter text...")),
                  
                  tabPanel("Help",                   
                           tags$hr(),
                           includeHTML("./www/help.html"))
                           
                 )                         
          ))
))

# That's all folks!
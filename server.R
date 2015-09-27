# Program: server.R
# Author: Larry Lugo
# Course: Developing Data Products, Johns Hopkins University-Coursera
# Date: September, 2015

# Load required libraries

library(googleVis)
library(knitr)
library(shiny)

# Load data sets

crops <- read.csv(file="./data/crops.csv", header=TRUE, sep=",")
photo <- read.csv(file="./data/Leaf_Photosynthesis_Traits.csv", header=TRUE, sep=",")

shinyServer(function(input, output) {
  
# Select a data set
  datasetInput <- reactive({
    switch(input$dataset,
           "Crops" = crops,
           "Photosynthesis" = photo)
  })
  
# Select Dependent variable
  output$dv = renderUI({
    selectInput('dv', h5('Select Dependent Variable'), choices = names(datasetInput()))
  })
  
# Select Independent variable
  output$iv = renderUI({
    selectInput('iv', h5('Select Independent Variable'), choices = names(datasetInput()))
  })
  
# Define regression formula
  regFormula <- reactive({
    as.formula(paste(input$dv, '~', input$iv))
  })
  
# Define LinearRegression model
  model <- reactive({
     lm(regFormula(), data = datasetInput())
  })
  
  
# Exploratory data analysis and plotting results
  
  # Show data
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  
  # Show summary statistics
  output$summary <- renderPrint({
      summary(cbind(datasetInput()[input$dv], datasetInput()[input$iv]))
  })
  
  # Plot histograms   
  output$distPlot_dv <- renderPlot({
    x    <- datasetInput()[,input$dv]  
    bins <- seq(min(x), max(x), length.out = input$bins_dv + 1)
    hist(x, breaks = bins, col = 'lightblue', border = 'darkgray', main = 'Dependent Variable', xlab = input$dv)
  })

  
  output$distPlot_iv <- renderPlot({
    x    <- datasetInput()[,input$iv]  
    bins <- seq(min(x), max(x), length.out = input$bins_iv + 1)
    hist(x, breaks = bins, col = 'lightblue', border = 'darkgray', main = 'Independent Variable', xlab = input$iv)
  })
  
  # Scatter plot of Independent and Dependent Variables  
  output$scatter <- renderPlot({
     plot(datasetInput()[,input$iv], datasetInput()[,input$dv],
       xlab = input$iv, ylab = input$dv,  main = "Scatter Plot of Independent and Dependent Variables", pch = 16, 
       col = "lightblue", cex = 1) 
  
     abline(lm(datasetInput()[,input$dv]~datasetInput()[,input$iv]), col="grey", lwd = 2) 
  })

  # Correlation matrix
  output$corr <- renderGvis({
    d <- datasetInput()[,sapply(datasetInput(),is.integer)|sapply(datasetInput(),is.numeric)] 
    cor <- as.data.frame(round(cor(d), 2))
    cor <- cbind(Variables = rownames(cor), cor)
    gvisTable(cor) 
  })

  # Linear Regression model
  output$model <- renderPrint({
    summary(model())
  })

  # Plot residuals
  output$residuals_hist <- renderPlot({
    hist(model()$residuals, main = paste(input$dv, '~', input$iv), xlab = 'Residuals') 
  })

  output$residuals_scatter <- renderPlot({
    plot(model()$residuals ~ datasetInput()[,input$iv], xlab = input$iv, ylab = 'Residuals')
    abline(h = 0, lty = 3) 
  })

  output$residuals_qqline <- renderPlot({
    qqnorm(model()$residuals)
    qqline(model()$residuals) 
  })

# Select format and download report
  
  output$downloadReport <- downloadHandler(
    filename = function() {
    paste('my-report', sep = '.', switch(
    input$format, PDF = 'pdf', HTML = 'html', Word = 'docx'
    ))
  },
  
  content = function(file) {
    src <- normalizePath('report.Rmd')
    owd <- setwd(tempdir())
    on.exit(setwd(owd))
    file.copy(src, 'report.Rmd')
    
    library(rmarkdown)
    out <- render('report.Rmd', switch(
      input$format,
      PDF = pdf_document(), HTML = html_document(), Word = word_document()
    ))
    file.rename(out, file)
  })

})

# That's all folks!
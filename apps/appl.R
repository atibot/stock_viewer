# Define server logic 
library(shiny)
# Load libraries
library(tseries)
library(PerformanceAnalytics)


    #reactive function
    getPrices <- reactive({
      # Take a dependency on input$goButton
      input$goButton
      # Use isolate() to avoid dependency on input$symbol
      isolate(
        # Get adjusted closing price data from Yahoo!
        get.hist.quote(instrument=input$symbol, start="1998-01-01",
                       end="2014-10-31", quote="AdjClose",
                       provider="yahoo", origin="1970-01-01",
                       compression="m", retclass="zoo")
      )
    })
    
    
    # Display chart
    output$chart <- renderPlot({
      prices <- getPrices() #get price data
      # Use isolate() to avoid dependency on input$symbol
      names(prices) <- isolate(input$symbol) #set a column name for the symbol
      
      if(!input$checkbox){ #if checkbox is Off, display a price chart.
        
        chart.TimeSeries(prices, legend.loc="bottom",
                         main=paste("[", isolate(input$symbol), "]",
                                    "Adjusted Closing Prices"),
                         ylab="Prices ($)", xlab="Month Year",
                         date.format = "%Y", lwd=2, col="blue")
      }
      else{ #if checkbox is On, display a cc return chart.
        returns <-diff(log(prices)) #cc return = log(prices)[i] - log(prices)[i-1])
        chart.TimeSeries(returns, legend.loc="bottom",
                         main=paste("Monthly Continuously Compounded Returns \n",
                                    "[", isolate(input$symbol), "]", 
                                    "Expected anual return =",
                                    round(mean(returns)*12*100, 2),"%",
                                    "Volatility =",
                                    round(sd(returns)*sqrt(12)*100, 2),"%"),
                         ylab="Returns", xlab="Month Year",
                         date.format = "%Y", lwd=2, col="blue")
        abline(h=mean(returns), col="red") #expected monthly return in red line
      }
      
    })

server <- function(input, output) {
  histdata<-vendas_fato$montante
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
    
  })
  
  output$plot2 <- renderPlot({
    
    # Renderizar o barplot
    barplot(vendas_fato[,input$loc], 
            main=input$loc,
            ylab="Valor",
            xlab="Ano")
  })
  
}

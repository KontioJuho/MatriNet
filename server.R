################################################################################
# MatriNet 0.1 R-Server logic for plots

# 2022-01-19
##############################################################


##%######################################################%##
#                                                          #
####           Network-plot Window                       ###
#                                                          #
##%######################################################%##

server <- function(input, output, session) {
##%######################################################%##
#                                                          #
####           Neighborhood Window                       ###
#                                                          #
##%######################################################%##

 #Functions to render plots for the HTML template
 #Neighborhood curves: Top panel
  
  output$loxplot <- renderPlotly({
    
    suppressMessages(neighborhood_curves(cancers = input$cancer_types, 
                        cluster_gene = input$neigh , 
                        smoothing_span = input$smooth))
    })  
  
  # output$loxplot2 <- renderPlotly({
  #   
  #   suppressMessages(neighborhood_curves(cancers = input$cancer_types, 
  #                       cluster_gene = input$neigh_2, 
  #                       smoothing_span = input$smooth_2))
  #   
  # })  

  #shrtpath <- reactive(local_shortPath[[input$neigh_2]][which(alltumors %in% input$cancer_types),])
  output$loxplot2 <- renderPlotly({
    
    heatmaply(local_shortPath[[input$neigh_2]], PuBu(10), 
              hclust_method = "ward.D2", show_dendrogram = c(TRUE, FALSE),
              hide_colorbar = FALSE,
              #main = "Weighted distances from other neighborhood proteins",
              margins = c(50,50,30,0),
              colorbar_xanchor = "left", 
              heatmap_layers = dark_theme_gray())  
    
  })  
  
  
  ##%######################################################%##
  #                                                          #
  ####           Clustering and heatmaps                   ###
  #                                                          #
  ##%######################################################%##
  

  
}

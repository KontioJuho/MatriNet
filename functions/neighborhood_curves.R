##########################################################
#Function for creating neighborhood plots

#Version 0.1: 2022-01-21
#########################################################

neighborhood_curves <- function(cluster_gene = "SDC1",
  cancers = c("Breast cancer", "Endometrial cancer",
              "Ovarian cancer", "Cervical cancer", "Glioma"),
  smoothing = TRUE, smoothing_span = 0.4){


cc <- cc_list[[cluster_gene]]
names(cc)[1] <- "Strength"
names(cc)[2] <- "Association_with"
cc_0 <- aggregate(Strength ~ Association_with, data = cc, "sum")

if(cluster_gene != "SDC4"){
  
  smoothing_span_new <- smoothing_span
  }else{
  smoothing_span_new <- max(0.5, smoothing_span)
  }

if(smoothing == TRUE){
  
  cc <- cc[which(cc$cancertype %in% cancers),]
  gg <- cc %>% 
    filter(Association_with %in% cc_0[which(cc_0$Strength != 0), 
                                      "Association_with"]) %>% 
    ggplot(aes(x = Association_with, y = Strength,
               color = cancertype, group = cancertype)) + 
    
  # scale_color_brewer() +
    geom_smooth(se = FALSE, span = smoothing_span_new, na.rm = TRUE) + 
  dark_theme_gray() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 7)) + 
  xlab(paste(cluster_gene, "neighborhood proteins")) +
  ylab("Edge-weights")

return(ggplotly(gg))
}

}

#Function to create igraph or rD3plot network objects for selected tumor-types------------
#Defaults to all tumor types: Change tumors argument to subset tumor types
#Works without specifying any argument when P_list is loaded:

#load("P_list.RData")
#result_list <- neighborhood_networks()
# 
# neighborhood_networks <- function(tumor.network.list = P_list, tumors = names(P_list),
#                                   rd3 = TRUE, igraph = TRUE){
#   
#   #Define an empty list for the results
#   igraph_network_list <- vector(mode = "list", length = length(tumors))
#   names(igraph_network_list) <- tumors
#   
#   rd3_network_list <- vector(mode = "list", length = length(tumors))
#   names(rd3_network_list) <- tumors
#   
#   #Loop through all tumor types:
#   for(nams in tumors){
#     #Create an igraph object from the weighted adjacency matrices P_list
#     igraph_network_list[[nams]] <- graph_from_adjacency_matrix(tumor.network.list[[nams]],
#                                                                weighted=TRUE, mode="max")
#     #Add Syndecans, LOX and cluster groups
#    V(igraph_network_list[[nams]])$group <- g_d3$nodes$group
#   
#    rd3_network_list[[nams]] <- rd3_fromIgraph(igraph_network_list[[nams]],
#               background = "black", color = "group", lcolor = "steelblue2",
#               mode = "network", zoom = 0.8,lwidth = "weight", community = "lo", controls = c(1,2))
#   }
#   
#    if(rd3 == TRUE & igraph == FALSE){
#      return(rd3_network_list)
#    }
#    
#    if(igraph == TRUE & rd3 == FALSE){
#      
#      return(igraph_network_list)
#      
#    } 
#    
# return(network_list)
# }
# 
# 
# 
# 
# 
# 
# # Ovarian_network$nodes$hyperlink <- paste0(
# #   'https://www.proteinatlas.org/search/',
# #   Ovarian_network$nodes$name
# # )
# # 
# # Ovarian_network$options$clickAction = 'window.open(d.hyperlink)'
# # 
# # 
# # plot(Ovarian_network)
# # 
# # #Code click actions-----------
# # 
# # g3d$x$nodes$hyperlink <- paste0(
# #   'https://www.proteinatlas.org/search/',
# #   g3d$x$nodes$name
# # )
# # 
# # g3d$x$options$clickAction = 'window.open(d.hyperlink)'
# # 
# # g3d
# 
# 
# 
# 
# 
# 
# 

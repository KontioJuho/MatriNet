################################################################################
# MatriNet Global 0.1
#
# Created: 2021-01-19
################################################################################


library(shiny)
library(dplyr)
library(reactable)
library(shinydashboard) 
library(shinythemes)
library(shinyWidgets)
library(RCurl)
#library(d3heatmap)
library(heatmaply)
library(Rcpp)
library(ggplot2)


library(RColorBrewer)
library(stringr)
library(ggthemes)
library(ggdark)
library(htmltools)
#library(shinyHeatmaply)


#Tumor-specific networks--------
#load("data/P_list.RData") # A list of tumor-specific weighted adjacency-matrices
#load("data/g_d3.RData")
# Matrinet d3-network object defining groups of proteins

#Neighborhood curves window----------
load("data/cc_list.RData") #Neighborhood curves

#Make datalist for tumor_cluster server part
#load("data/min_shortest_paths_mats.RData")

load("data/local_shortPath.RData")
#REQUIRED for differential heatmap part

# Set up colors and themes-------------------------------------------------------

ECHARTS_THEME <- "auritus"

COLOR_BLUE <- "#00a2eb"
COLOR_GREEN <- "#adb514"
COLOR_ORANGE <- "#fd9f02"
COLOR_PINK <- "#ce2c78"
COLOR_RED <- "#d32d05"
COLOR_PURPLE <- "#7522b8"
COLOR_GREY <- "#ffffffaa"
COLOR_DARK_GREY <- "#888888aa"
COLOR_WHITE <- "#eee"


# Utilities ---------------------------------------------------------------

source("utils/ui-utils.R")
source("functions/neighborhood_curves.R")




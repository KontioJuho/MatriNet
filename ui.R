
# MatriNet User-Interface for R-parts
# Version 0.1: 2022-01-21


#Neighborhood ui-------

neighborhood_ui <- fluidRow(  
  
  style = "margin: 0; height: 100%; padding-bottom: 65px",
  

  column(
    width = 2,  material_card( box(title = "Tumor types", 
                                   solidHeader = TRUE, status = "warning",width=NULL,
  "Choose tumors types for the neighborhood model to compare local network behaviours." #ps://i.imgur.com/DGTFxIH.jpg
    )),
  
  material_card( 
                              
h4("Select cancer types"),
          prettyCheckboxGroup("cancer_types", "Choose cancer types", choices =
                                      c(
                           "Breast cancer"        = "Breast cancer",
                           "Carcinoid"            = "Carcinoid",
                           "Cervical cancer"      = "Cervical cancer",
                           "Colorectar cancer"    = "Colorectar cancer",
                           "Endometrial cancer"   = "Endometrial cancer",
                           "Glioma"               = "Glioma",
                           "Head and neck cancer" = "Head and neck cancer",
                           "Liver cancer"         = "Liver cancer",
                           "Lung cancer"          = "Lung cancer",
                           "Lymphoma"             = "Lymphoma",
                           "Melanoma"             = "Melanoma",
                           "Ovarian cancer"       = "Ovarian cancer",
                           "Pancreatic cancer"    = "Pancreatic cancer",
                           "Prostate cancer"      = "Prostate cancer",
                           "Renal cancer"         = "Renal cancer",
                           "Skin cancer"          = "Skin cancer",
                           "Stomach cancer"       = "Stomach cancer",
                           "Testis cancer"        = "Testis cancer",
                           "Thyroid cancer"       = "Thyroid cancer",
                           "Urothelial cancer"    = "Urothelial cancer"),
                              
                  inline = FALSE,
                    selected = c("Cervical cancer","Endometrial cancer",
                                                 "Glioma")))

),
    

           
          
  
  column(width = 8,
         

             plotlyOutput('loxplot',   height  = "50%"),
             plotlyOutput('loxplot2',  height = "50%")
 ),

column(width = 2, material_card( box(title = "Local ECM network patterns ", solidHeader = TRUE, 
                                     status = "warning",width=NULL,
             "Compare neighborhood-specific PPI-patterns between tumors." )),
       material_card(
         #---------------Neighborhood_specific_I_ui
         pickerInput("neigh", "Select the neighborhood by its center protein",
                     c("LOX", "SDC1", "SDC2", "SDC3", "SDC4"),
                     selected = "SDC1", multiple = FALSE) 
         
       ),
       
       
       setSliderColor(c("SteelBlue","SteelBlue"), c(1, 2)),
       chooseSliderSkin("Flat"),
       material_card(
                     
                     p("Customize the smoothness of edge-weight curves."),
                     
                     sliderInput("smooth", " ", 
                                 value = 0.3, step = 0.01,  min = 0.25, max = 0.8)
                     # material_card(
                     #   h5("Neighborhood 2"),
                     #   sliderInput("smooth_2", " ", 
                     #               value = 0.3, step = 0.01,  min = 0.25, max = 0.8)
                     #   
                     # ) 
       ),
       
       
       
       
       material_card(h4("Shortest distances between proteins"),
                     
                     p("Compare the weighted pathways from a given neighborhood center to all proteins excluding its own neighborhood."),
                     
         #---------------Neighborhood_specific_II_ui
         h6("Center protein"),
         
           pickerInput(
             "neigh_2", "Select neighborhood",
             c("LOX", "SDC1", "SDC2", "SDC3", "SDC4"),
                     selected = "LOX", multiple = FALSE) 
         
       ),
       
))


#Cluster ui---------






# Fetch html file and compile everything togetger as a template ---------------

htmlTemplate(
  filename = "www/index.html",
  
  neighborhood_explorer  = neighborhood_ui,

 )




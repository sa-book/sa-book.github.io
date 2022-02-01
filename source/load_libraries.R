# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Load required packages ----
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~

# list of required libraries 
pkgs <- c("Cairo", "cluster", "colorspace", "corrplot", "fontawesome", "glue", 
          "grDevices", "gt", "haven", "Hmisc", "htmltools", "icons",
          "knitr", "kableExtra", "magrittr", "metathis", "OpenMx", 
          "patchwork", "pdftools", "RColorBrewer", "sjPlot", "summarytools",
          "tidyverse", "TraMineR", "TraMineRextras", 
          "tufte", "reshape2", "WeightedCluster", "xaringanExtra") 


# Load all packages to library and adjust options
lapply(pkgs, library, character.only = TRUE)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

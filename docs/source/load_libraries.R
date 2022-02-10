# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Load required packages ----
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~

# list of required libraries 
pkgs <- c("broom", "Cairo", "cluster", "colorspace", "corrplot", "descr", "effects", 
          "factoextra", "fontawesome", "glue", 
          "grDevices", "gt", "haven", "Hmisc", "htmltools", "icons",
          "knitr", "kableExtra", "magrittr", "metathis", "nnet", "OpenMx", 
          "patchwork", "pdftools", "psych", "RColorBrewer", "seqquality", "sjPlot", 
          "stats", "summarytools", "tidyr", "tidyverse", "TraMineR", "TraMineRextras", 
          "tufte", "reshape2", "WeightedCluster", "xaringanExtra") 


# Load all packages to library and adjust options
lapply(pkgs, library, character.only = TRUE)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

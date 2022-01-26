# ******************************************************************************
# ******************************************************************************

# ===================================================
# Load and download (if necessary) required packages
# ===================================================

# use (and install if necessary) pacman package 
if (!require("pacman")) install.packages("pacman")
library(pacman)

# load and install (if necessary) required packages for this course
p_load(TraMineR, TraMineRextras, WeightedCluster, cluster, survival,
       haven, Hmisc, gganimate, rmarkdown,
       sjPlot, RColorBrewer, colorspace, knitr, kableExtra, reshape2, 
       SDMTools, summarytools, MCMCpack, corrplot, ade4, tidyverse)


# ******************************************************************************
# ******************************************************************************


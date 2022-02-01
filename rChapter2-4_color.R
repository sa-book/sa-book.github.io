# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~
# Setup ----
# ~~~~~~~~~~

# Load required packages
library(here)
source(here("source", "load_libraries.R"))

# Output options
knitr::opts_chunk$set(eval=TRUE, echo=TRUE)
options("kableExtra.html.bsTable" = T)

# load data for Chapter 2
load(here("data", "2-0_ChapterSetup.RData"))

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Choosing colors with RColorBrewer ----
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ------------------------------------------------------------------------------

# plot the pre-defined palettes

png(file = here("images", "Chapter2", "2-4-0_bonus_brewer_palettes.png"),
    width = 1000, height = 800, res = 90)

par(mar = c(0, 4, 0, 2) + 0.1)
display.brewer.all()

dev.off()


# ------------------------------------------------------------------------------

# extract colors for generating palette  
col1 <- brewer.pal(3, "Blues")[2:3]   # Single states
col2 <- brewer.pal(3, "Greens")[2:3]  # LAT states
col3 <- brewer.pal(3, "Oranges")[2:3] # Cohabitation states
col4 <- brewer.pal(7, "RdPu")[4:6] # Marriage states

# define complete color palette
colspace1 <- c(col1, col2, col3, col4)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Choosing colors with colorspace ----
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# plot the pre-defined palettes
png(file = here("images", "Chapter2", "2-4-0_bonus_hcl_palettes.png"),
    width = 1000, height = 800, res = 90)

hcl_palettes(plot = TRUE)

dev.off()

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Define & plot the full color palette

# extract colors for generating palette  
col1 <- sequential_hcl(5, palette = "Blues")[3:2]
col2 <- sequential_hcl(5, palette = "Greens")[2:1]
col3 <- sequential_hcl(5, palette = "Oranges")[3:2]
col4 <- sequential_hcl(5, palette = "magenta")[3:1]

# define complete color palette
colspace2 <- c(col1, col2, col3, col4)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Comparison of the two different color palettes ----
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# using the sequence data and rendering dplots

png(file = here("images", "Chapter2", "2-4-0_bonus_dplot_colorpalsMonthly.png"), 
    width = 800, height = 1000, res = 120)

layout.fig1 <- layout(matrix(seq(1:4), 2, 2, byrow = TRUE),
                      widths = c(.7, .3))
layout.show(layout.fig1)

par(mar = c(5, 4, 4, 0) + 0.1, las = 1, 
    mgp=c(2,.8,-.5))
seqdplot(partner.child.month.seq, ylab = "Relative frequency",
         with.legend = "FALSE", border = NA, axes = FALSE,
         cpal = colspace1, main = "RColorBrewer")
par(mgp=c(3,1,0.25))
axis(1, at=(seq(0,264, by = 24)), labels = seq(18,40, by = 2))
mtext(text = "Age", cex = .8,
      side = 1,#side 1 = bottom
      line = 2.5)

par(mar = c(5, 0, 4, 0) + 0.1)
seqlegend(partner.child.month.seq, 
          cpal = colspace1, cex = .95, position = "left")

par(mar = c(5, 4, 4, 0) + 0.1, las = 1, 
    mgp=c(2,.8,-.5))
seqdplot(partner.child.month.seq, ylab = "Relative frequency",
         with.legend = "FALSE", border = NA, axes = FALSE,
         cpal = colspace2, main = "colorspace")
par(mgp=c(3,1,0.25))
axis(1, at=(seq(0,264, by = 24)), labels = seq(18,40, by = 2))
mtext(text = "Age", cex = .8,
      side = 1,#side 1 = bottom
      line = 2.5)

par(mar = c(5, 0, 4, 0) + 0.1)
seqlegend(partner.child.month.seq, 
          cpal = colspace2, cex = .95, position = "left")

dev.off()

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

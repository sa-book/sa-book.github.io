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

# Load tweaked legend function
source(here("source", "legend_large_box.R"))

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Preparatory work required for rendering the plot ---- 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# Defining the palette of grays & shading lines

colgrey.partner.child <- c(rep("#FFFFFF",2),
                           rep(gray.colors(9)[8],2),
                           rep(gray.colors(9)[5],2), 
                           rep(gray.colors(9)[2],3))


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Optimizing the legend by... 

# ...adding empty labels below Single, LAT, and Cohabitation
longlab.partner.child2 <- append(longlab.partner.child, "", after=2)  
longlab.partner.child2 <- append(longlab.partner.child2, "", after=5) 
longlab.partner.child2 <- append(longlab.partner.child2, "", after=8) 

# ...adding white cells below Single, LAT, and Cohabitation
colgrey.partner.child2 <- append(colgrey.partner.child,"#FFFFFF",after=2)
colgrey.partner.child2 <- append(colgrey.partner.child2,"#FFFFFF",after=5)
colgrey.partner.child2 <- append(colgrey.partner.child2,"#FFFFFF",after=8)

# ... defining border colors for the boxes in legend:
#       regular color = black
#       color for empty cells = white
bordercol.partner.child <- c(rep(c("black","black","White"),3),
                             rep("black", 3))


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# Identify 10 representative sequences
partner.child.year.rep <- seqrep(partner.child.year.seq, 
                                 diss=partner.child.year.om, 
                                 criterion="dist", nrep = 10)

# Extract sequences to be plotted and save in object
plot.seq <- partner.child.year.seq[attributes(partner.child.year.rep)$Index,]

# extract same sequences from sequence data using reduced alphabet (partnership status only)
# this will be used for sorting the index plots by the 
# first occurrence of the partnership status "MAR" (marriage)
plot.aux <- partner.year.seq[attributes(partner.child.year.rep)$Index,]


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~
# Generate example plot ----
# ~~~~~~~~~~~~~~~~~~~~~~~~~~


# Save plot as png file
png(file = here("images", "Chapter2", "2-4-0_bonus_iplot_grayYearly.png"), 
    width = 900, height = 650, res = 90)


par(mar=c(13, 1, 1, 1))
seqiplot(plot.seq, 
         border = TRUE, 
         with.legend = FALSE, 
         axes = FALSE,
         yaxis = FALSE, ylab = NA,
         sortv = seqfpos(plot.aux, "MAR"),
         cpal = colgrey.partner.child)
par(new=TRUE)
seqiplot(plot.seq,  
         border = TRUE, 
         with.legend = FALSE, 
         axes = FALSE,
         yaxis = FALSE, ylab = NA,
         sortv = seqfpos(plot.aux, "MAR"),
         cpal=rep("black",9),
         density=c(0,20,0,20,0,20,0,20,20), 
         angle=c(0,45,0,45,0,45,0,45,0))

axis(1, at=(seq(0,22, by = 2)), labels = seq(18,40, by = 2))
mtext(text = "Age",
      side = 1,#side 1 = bottom
      line = 2)

par(mar=c(0, 1, 5, 1))
legend_large_box("bottom", legend = longlab.partner.child2,
                 ncol=4, fill =colgrey.partner.child2, 
                 border = bordercol.partner.child,
                 box.cex=c(4,1.5),  y.intersp=2,
                 inset=c(0,-.4), xpd=TRUE)
par(new=TRUE)
legend_large_box("bottom", legend = longlab.partner.child2,
                 ncol=4, bg = "transparent", 
                 border = bordercol.partner.child,
                 box.cex=c(4,1.5),  y.intersp=2,
                 inset=c(0,-.4), xpd=TRUE,
                 density=c(0,20,0,0,20,0,0,20,0,0,20,20), 
                 angle=c(0,45,0,0,45,0,0,45,0,0,45,0))

dev.off()


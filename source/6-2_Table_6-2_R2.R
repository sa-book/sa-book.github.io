# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Extract of "6-2_Table_6-2_R2.R" ----
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

R2discr <- function(rawdata,diss){
  group.idx <- list(Region = rawdata$east,
                    Gender = rawdata$sex,
                    "Highschool degree" = rawdata$highschool)
  discrepancies <- map(group.idx,~dissassoc(diss, group = .))
  R2p2 <- map_dfr(discrepancies,
                  ~.$stat[3,]) %>%
    as.data.frame() %>%
    mutate(t0 = round(t0,2)) %>%
    rename(R2 = t0) %>%
    set_rownames(names(group.idx))
  return(R2p2)
}

r2p.family <- R2discr(family,partner.child.year.om)
r2p.activity <- R2discr(activity,activity.year.om)

names(r2p.family) <- paste0("fam.",names(r2p.activity))
names(r2p.activity) <- paste0("act.",names(r2p.activity))

mfac <- dissmfacw(activity.year.om ~ east + sex + highschool,
                  data = activity)


mfac_r2 <- tail(mfac$mfac[,3:4],1)
mfac <- mfac$mfac[1:3, 3:4]
mfac[1] <- round(mfac[1],2)
mfac[2] <- round(mfac[2],3)

# generate dataset for kable
kbldata <- bind_cols(r2p.family, r2p.activity, mfac) %>%
  set_colnames(c("$R^2$", "p-value","$R^2$", "p-value",
                 "$\\Delta R^2$ ", "p-value")) 


digits <- function(x,y) trimws(format(round(x, y), nsmall=y))


kbldata <- bind_cols(r2p.family, r2p.activity, mfac) %>%
  mutate(across(contains("R2"), ~digits(.,2))) %>%
  mutate(across(contains("value"), ~digits(.,3))) %>%
  set_rownames(rownames(r2p.family)) %>%
  rbind(" " = c(rep("",4), "$R^2_{total}$", "" )) %>%
  rbind(Total = c(rep("",4),digits(mfac_r2[[1]],2),digits(mfac_r2[[2]],3))) 




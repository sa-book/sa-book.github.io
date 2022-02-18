# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Extract of "6-2_Table_6-3_Discrepancies-BIC.R" ----
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# Defining groups for comparison
group.idx <- list(region = NULL, gender = NULL)

group.idx$region <- list(total = rep(TRUE, nrow(activity)),
                         men = activity$sex==0,
                         women = activity$sex==1)

group.idx$gender <- list(total = rep(TRUE, nrow(activity)),
                         west = activity$east==0,
                         east = activity$east==1,
                         lowedu = activity$highschool == 0,
                         lowedu.w = (activity$highschool == 0 & 
                                       activity$east==0),
                         lowedu.e = (activity$highschool == 0 & 
                                       activity$east==1),
                         hiwedu = activity$highschool == 1,
                         hiedu.w = (activity$highschool == 1 & 
                                      activity$east==0),
                         hiedu.e = (activity$highschool == 1 & 
                                      activity$east==1))

# Run discrepancy analysis to test differences by region [group = activity$east]
discr.region <- map(group.idx$region,
                    ~dissassoc(activity.year.om[.,.], group = activity$east[.]))


# Run discrepancy analysis to test differences by gender [group = activity$sex]
discr.gender <- map(group.idx$gender,
                    ~dissassoc(activity.year.om[.,.], group = activity$sex[.]))


# Combine the resulting list
discr.complete <- c(discr.region, discr.gender)

# unique names for list elements
names(discr.complete) <- c(paste0("reg.",names(discr.region)),
                           paste0("sex.",names(discr.gender)))


# extract information from the "discrepancy list" named "levene.complete"
pseudoR2 <- bind_cols(bind_rows(map(discr.complete,~(.$stat[3,]))),
                      N = as.integer(map(discr.complete,~(.$groups[3,1])))) %>%
  set_rownames(c("Overall", "Men", "Women", "Overall ", "West", "East",
                 "No highschool degree", "West ", "East ", 
                 "Highschool degree", "West  ", "East  "))


# Calculate BICs and LRTs  to test differences by region [group = activity$east]
bic.region <- map(group.idx$region,
                  ~seqCompare(activity.year.seq[.,], group = activity$east[.],
                              method="OM", sm="CONSTANT"))

# Calculate BICs and LRTs to test differences by gender [group = activity$sex]
bic.gender <- map(group.idx$gender,
                  ~seqCompare(activity.year.seq[.,], group = activity$sex[.],
                              method="OM", sm="CONSTANT"))

# Combine the resulting list
bic.complete <- c(bic.region, bic.gender)

# Better row names
names(bic.complete) <- c(paste0("reg.",names(discr.region)),
                         paste0("sex.",names(discr.gender)))

# Extract the information required for the table into a data frame
bic <- t(bind_rows(map(bic.complete,~(.[c(3,1,2)])))) %>%
  as.data.frame() %>%
  rename(`BIC diff.` = 1, LRT = 2, `p-value` = 3) %>%
  bind_cols(N = as.integer(map(discr.complete,~(.$groups[3,1])))) %>%
  set_rownames(c("Overall", "Men", "Women", "Overall ", "West", "East",
                 "No highschool degree", "West ", "East ", 
                 "Highschool degree", "West  ", "East  "))


# Join tables and store them in new data frame
bic.pseudoR2 <- bic %>%
  select(!LRT) %>%
  mutate(`pseudo-R2 ` = pseudoR2[1],
         `p-value ` = pseudoR2[2], .before = N) %>%
  as.matrix() %>%
  set_rownames(c("Overall", "Men", "Women", "Overall", "West", "East",
                 "No highschool degree", "West", "East", 
                 "Highschool degree", "West", "East"))   



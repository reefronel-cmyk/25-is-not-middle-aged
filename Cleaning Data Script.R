## Cleaning Data Script - Reef

librarian::shelf(readxl)
librarian::shelf(tidyverse)

# Exploring the Data ------------------------------------------------------


A <- read_excel("A.xlsx")
B <- read_excel("B.xlsx")
P <- read_excel("P.xlsx")
Q <- read_excel("SouthEast.xlsx")

check_levels <- function(X) {for (x in colnames(X)) {
  cat("\nColumn:", x, "\n")
  print(levels(factor(A[[x]])))
}}

colnames(A)
colnames(B)
colnames(P)
colnames(Q)
check_levels(A) # no inconsistencies
check_levels(B) # no inconsistencies
check_levels(P)
check_levels(Q)
Q <- Q %>%
  select("Age" = "Age","Region" = "Region",
    "PH" = "Phusical",
    "MH" = "Mental",
    "Smoker" = "Smoker", "Belief" = "Belief",
    "SES5" = "SES5", "Gender" = "Gender" )


P$PH[which(P$PH == "Yes")]<- "Y"
P$PH[which(P$PH == "No")]<- "N"

Q$PH[which(Q$PH == "YES")]<- "Y"
Q$PH[which(Q$PH == "NO")]<- "N"

head(Q)

A_B <- rbind(A,B)
levels(A_B$Region)
P_Q <- rbind(P,Q)

DATA <- rbind(A_B, P_Q)
write.csv(DATA, "DATA.csv")

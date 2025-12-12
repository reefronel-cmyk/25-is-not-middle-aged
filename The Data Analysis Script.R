## This is the Data Analysis Script


# Precleaned Data -----------------------------------------------------------
##Physical Health
#1 is belief, 0 is no

#Model
DATA$PHBio <-ifelse(DATA$PH=="Y",1,0)
DATA$PHBio <- as.factor(DATA$PHBio)
DATA$BeliefBio<- ifelse(DATA$Belief=="Y",1,0)
DATA$BeliefBio <- as.factor(DATA$BeliefBio)
PhysicalBelief <- glm(BeliefBio~PHBio, data=DATA, family="binomial")
summary(PhysicalBelief)
confint(PhysicalBelief)
#Table
prop.table(table(DATA$PH, DATA$Belief),margin = 2)

##Mental Health
#1 is belief, 0 is no
#Model
DATA$MHBio <-ifelse(DATA$MH=="Y",1,0)
DATA$MHBio <- as.factor(DATA$MHBio)
DATA$BeliefBio<- ifelse(DATA$Belief=="Y",1,0)
DATA$BeliefBio <- as.factor(DATA$BeliefBio)

MentalBelief <- glm(BeliefBio~MHBio, data=DATA, family="binomial")
summary(MentalBelief)
confint(MentalBelief)
#Table
prop.table(table(DATA$MH, DATA$Belief),margin = 2)

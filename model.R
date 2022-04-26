## import packages
library(readr)
library(dplyr)
library(tidyverse)
library(binaryLogic)
library(corrplot)
library(caTools)
library(car)
library(carData)
library(ROCR)
library(randomForest)

## import data
accepted_2007_to_2018Q4 <- read.csv("accepted_2007_to_2018Q4.csv")
accepted_2007_to_2018Q4
getwd()
read_csv
p2pdata <- accepted_2007_to_2018Q4
str(p2pdata)

## default rate of raw data
(length(which(p2pdata$loan_status=="Charged Off"))/length(p2pdata$loan_status))*100
(length(which(p2pdata$loan_status=="Default"))/length(p2pdata$loan_status))*100

## observe subset
str(p2psubset)
summary(p2psubset)
ncol(p2psubset)
## eliminate the last 36 columns

p2pelimination1 <- p2pdata[,1:112]

## columns names index-112 col
colnames(p2pelimination1, do.NULL = TRUE, prefix = "col")

## second elimination process
p2pelimination1$url <- NULL
p2pelimination1$desc <- NULL
p2pelimination1$verification_status <- NULL
p2pelimination1$zip_code <- NULL
p2pelimination1$addr_state <- NULL
p2pelimination1$next_pymnt_d <- NULL
p2pelimination1$mths_since_last_major_derog <- NULL
p2pelimination1$annual_inc_joint <- NULL
p2pelimination1$dti_joint <- NULL
p2pelimination1$verification_status_joint <- NULL

## observing the number of null values in columns
## if data has more than 150000 na values in a column we eliminate these and name the
dataframe a1
a1 <- ((colSums(is.na(p2pelimination1)))>150000)

## brings only columns that have more than 150k null values
which(a1, arr.ind = FALSE, useNames = TRUE)

## deleting the columns that have more than 150k null values
p2pelimination1$member_id <- NULL
p2pelimination1$mths_since_last_delinq <- NULL
p2pelimination1$mths_since_last_record <- NULL
p2pelimination1$open_acc_6m <- NULL
p2pelimination1$open_act_il <- NULL
p2pelimination1$open_il_12m <- NULL
p2pelimination1$open_il_24m <- NULL
p2pelimination1$mths_since_rcnt_il <- NULL
p2pelimination1$total_bal_il <- NULL
p2pelimination1$il_util <- NULL

p2pelimination1$open_rv_12m <- NULL
p2pelimination1$open_rv_24m <- NULL
p2pelimination1$max_bal_bc <- NULL
p2pelimination1$all_util <- NULL
p2pelimination1$inq_fi <- NULL
p2pelimination1$total_cu_tl <- NULL
p2pelimination1$inq_last_12m <- NULL
p2pelimination1$mths_since_recent_bc_dlq <- NULL
p2pelimination1$mths_since_recent_inq <- NULL
p2pelimination1$mths_since_recent_revol_delinq <- NULL
p2pelimination1$num_tl_120dpd_2m <- NULL

## observing column names
colnames(p2pelimination1, do.NULL = TRUE, prefix = "col")
str(p2pelimination1)

## deleting null rows
p2pelimination2 <- na.omit(p2pelimination1)

## reducing number of rows to 2 million from 2.2 million
nrow(p2pelimination2)

set.seed(5)
## partition into a subset of 385.234 row with 81 columns
p2psubset <- sample_frac(p2pelimination2, 0.20)
summary(p2psubset)
str(p2psubset)

## converting 'term' to binary value
unique(p2psubset$term)
p2psubset$term
p2psubset$term <- ifelse(p2psubset$term == " 36 months",1,0)
class(p2psubset$term)

## converting investment grade to categorical value
str(p2psubset)
p2psubset$grade <- as.factor(p2psubset$grade)
unique(p2psubset$grade)

## deleting sub_grade attribute since grade will be utilized
p2psubset$sub_grade <- NULL

## observing employment length categories
class(p2psubset$emp_length)
(length(which(p2psubset$emp_length=="< 1 year"))/length(p2psubset$emp_length))*100
(length(which(p2psubset$emp_length=="1 year"))/length(p2psubset$emp_length))*100
(length(which(p2psubset$emp_length=="2 years"))/length(p2psubset$emp_length))*100
(length(which(p2psubset$emp_length=="3 years"))/length(p2psubset$emp_length))*100
(length(which(p2psubset$emp_length=="4 years"))/length(p2psubset$emp_length))*100
(length(which(p2psubset$emp_length=="5 years"))/length(p2psubset$emp_length))*100
(length(which(p2psubset$emp_length=="6 years"))/length(p2psubset$emp_length))*100
(length(which(p2psubset$emp_length=="7 years"))/length(p2psubset$emp_length))*100
(length(which(p2psubset$emp_length=="8 years"))/length(p2psubset$emp_length))*100
(length(which(p2psubset$emp_length=="9 years"))/length(p2psubset$emp_length))*100
(length(which(p2psubset$emp_length=="10+ years"))/length(p2psubset$emp_length))*100
## Group 1: < 1 year - 3 years
## Group 2: 4 years - 9 years
## Group 3: 10+ years
p2psubset$emp_length <- ifelse(p2psubset$emp_length == "< 1 year"
                               |p2psubset$emp_length == "1 year"
                               |p2psubset$emp_length == "2 years"
                               |p2psubset$emp_length == "3 years",1,
                               ifelse(p2psubset$emp_length == "4 years"
                                      |p2psubset$emp_length == "5 years"
                                      |p2psubset$emp_length == "6 years"
                                      |p2psubset$emp_length == "7 years"
                                      |p2psubset$emp_length == "8 years"
                                      |p2psubset$emp_length == "9 years",2,3))

## observe final employment length
(length(which(p2psubset$emp_length=="1"))/length(p2psubset$emp_length))*100
(length(which(p2psubset$emp_length=="2"))/length(p2psubset$emp_length))*100
(length(which(p2psubset$emp_length=="3"))/length(p2psubset$emp_length))*100

## home ownership
str(p2psubset)
unique(p2psubset$home_ownership)
str(p2psubset$home_ownership)
summary(p2psubset$home_ownership)


(length(which(p2psubset$home_ownership=="MORTGAGE"))/length(p2psubset$home_ownership))*100
(length(which(p2psubset$home_ownership=="OWN"))/length(p2psubset$home_ownership))*100
(length(which(p2psubset$home_ownership=="RENT"))/length(p2psubset$home_ownership))*100
(length(which(p2psubset$home_ownership=="ANY"))/length(p2psubset$home_ownership))*100
(length(which(p2psubset$home_ownership=="OTHER"))/length(p2psubset$home_ownership))*100
(length(which(p2psubset$home_ownership=="NONE"))/length(p2psubset$home_ownership))*100

## removing small set
p2psubset2 <- p2psubset[- grep("ANY", p2psubset$home_ownership),]
p2psubset3 <- p2psubset2[- grep("OTHER", p2psubset2$home_ownership),]
p2psubset4 <- p2psubset3[- grep("NONE", p2psubset3$home_ownership),]
str(p2psubset4)

## removing payment plan, title, purpose, initial_list_status, last_credit_pull_d, emp_title
p2psubset4$pymnt_plan <- NULL
p2psubset4$title <- NULL
p2psubset4$purpose <- NULL

p2psubset4$initial_list_status <- NULL
p2psubset4$last_credit_pull_d <- NULL
p2psubset4$emp_title <- NULL
p2psubset4$issue_d <- NULL
p2psubset4$earliest_cr_line <- NULL
p2psubset4$last_pymnt_d <- NULL #71 variable left

## change application_type to binary
p2psubset4$application_type <- ifelse(p2psubset4$application_type=="Individual",0,1)
unique(p2psubset4$application_type)

## observe new dataset
str(p2psubset4)
str(p2psubset4$application_type)
colnames(p2psubset4, do.NULL = TRUE, prefix = "col")
summary(p2psubset4)
str(p2psubset4)
p2psubset4$policy_code <- NULL
numericsubset <- p2psubset4[,c(-1,-12,-10)]

numericsubset
first30 <- numericsubset[1:30]
first30
df3 = as.data.frame(sapply(first30, as.numeric))
str(df3)
cmat3 <- cor(df3)


## correlation plot
corrplot(cmat3, type="upper", order="hclust", insig = "p-value")
xbar <- colMeans(df3)
covmatrix <- cov(df3)
cov2cor(covmatrix)>0.6
first20 <- numericsubset[1:20]
str(first20)
str(numericsubset)
df2 = as.data.frame(sapply(first20, as.numeric))
str(df2)

cmat2 <- cor(df2)
corrplot(cmat2, type="upper", order="hclust",insig = "p-value")
xbar <- colMeans(df2)
covmatrix <- cov(df2)
cov2cor(covmatrix)
str(first20)
str(p2psubset4)

## numeric subset but includes the output var and first 30 variables
logitsubset<- p2psubset4[,c(-1,-10)][1:31]
unique(logitsubset$loan_status)

## charged off = default #Charge Off typically occurs when a loan is 120 days or more past due
and there is no reasonable expectation of sufficient payment to prevent the charge off.
(length(which(logitsubset$loan_status=="Charged Off"))/length(logitsubset$loan_status))*100
(length(which(logitsubset$loan_status=="Fully Paid"))/length(logitsubset$loan_status))*100
(length(which(logitsubset$loan_status=="Current"))/length(logitsubset$loan_status))*100
(length(which(logitsubset$loan_status=="In Grace Period"))/length(logitsubset$loan_status))*100
(length(which(logitsubset$loan_status=="Late (31-120 days)"))/length(logitsubset$loan_status))*100
(length(which(logitsubset$loan_status=="Late (16-30 days)"))/length(logitsubset$loan_status))*100
(length(which(logitsubset$loan_status=="Default"))/length(logitsubset$loan_status))*100

## group loan status into groups
logitsubset$loan_status <- ifelse(logitsubset$loan_status == "Default"
                                  |logitsubset$loan_status == "Charged Off"
                                  |logitsubset$loan_status == "Late (31-120 days)"
                                  |logitsubset$loan_status == "Late (16-30 days)",1,
                                  ifelse(logitsubset$loan_status == "Current"
                                         |logitsubset$loan_status == "In Grace Period",0,0))
(length(which(logitsubset$loan_status=="1"))/length(logitsubset$loan_status))*100
(length(which(logitsubset$loan_status=="0"))/length(logitsubset$loan_status))*100
unique(logitsubset$loan_status)
summary(logitsubset$term)

## change loan status to numeric variable
logitsubset$loan_status <- as.numeric(logitsubset$loan_status)

## remove unnecessary variables and create new variables
str(logitsubset)
logitsubset$fico_avg <-(logitsubset$fico_range_low + logitsubset$fico_range_high)/2
logitsubset$fico_range_low <- NULL
logitsubset$fico_range_high <- NULL
logitsubset$last_fico_range_high <- NULL
logitsubset$prncputil <- NULL
logitsubset$out_prncp_inv <- NULL
logitsubset$pymntutil <- NULL
logitsubset$total_pymnt_inv <- NULL
logitsubset$fndutil <- NULL
logitsubset$funded_amnt_inv <- NULL
logitsubset$loan_amnt <- NULL
logitsubset$collection_recovery_fee <- NULL
logitsubset$acc_ratio <- logitsubset$open_acc /logitsubset$total_acc
logitsubset$open_acc <- NULL
ogitsubset$total_acc <- NULL
logitsubset$total_pymnt <- NULL
logitsubset$grade <- NULL
logitsubset$installment <- NULL

## 23 variables left
str(logitsubset)
dfl = as.data.frame(sapply(logitsubset[,c(-5)], as.numeric))

## 22 variables left
str(dfl) 
cmatl <- cor(dfl)
corrplot(cmatl, type="upper", order="hclust",insig = "p-value")
str(logitsubset)

## partition into a subset of 38k rows
minisubset2 <- sample_frac(logitsubset, 0.1)
str(minisubset2)
set.seed(100)

split=sample.split(minisubset2$loan_status,SplitRatio=0.7)
## training ve test sets
minitrain=subset(minisubset2,split==TRUE)
minitest=subset(minisubset2,split==FALSE)

vif(lr1)
summary(lr1)
coef(lr1)
str(minitest)


# Logistic Regression
lr2=glm(minitrain$loan_status~.,data=minitrain,family=binomial(link = "logit"), maxit=100)
predlogit =predict(lr2, newdata =minitest, type = "response")
summary(predlogit)
## FALSE TRUE
## 0 23532 16
## 1 2532 876
OverallAccuracy = (23532 + 876) / nrow(minitrain)
OverallAccuracy
Sensitivity = 23532 / (23532+2532)
Sensitivity
Specificity = 876/ (876+16)
Specificity


# Linear Regression
lr3=lm(minitrain$loan_status~. ,data=minitrain)
lr_rev=lm(minitrain$loan_status~ term + int_rate + emp_length + inq_last_6mths + total_rec_int
          + total_rec_late_fee + recoveries + last_pymnt_amnt + fico_avg,data=minitrain)
summary(lr_rev)
pred1 =predict(lr_rev, newdata =minitest, type = "response")
summary(pred1)
table(minitest$loan_status,pred1>=0.5)
## FALSE TRUE
## 0 235276 170
## 1 24776 9335
OverallAccuracybig = (235276 + 9335) / nrow(bigtrain)
OverallAccuracybig
Sensitivitybig = 235276 / (235276+24776)
Sensitivitybig
Specificitybig = 9335/ (9335+170)
Specificitybig

## Prediction function
ROCRpred = prediction(pred1, minitest$loan_status)

## Performance function
ROCRperf = performance(ROCRpred, "tpr", "fpr", auc =0.5)
auc.tmp <- performance(ROCRpred,"auc"); auc <- as.numeric(auc.tmp@y.values)
auc
#[1] 0.8932395

## Plot ROC curve
plot(ROCRperf)

## Add threshold labels
plot(ROCRperf, colorize=TRUE, print.cutoffs.at=seq(0,1,by=0.1), text.adj=c(-0.2,1.7))


# Random Forest
set.seed(70)
str(minitrain)
mini.rf <- randomForest(minitrain$loan_status ~ ., data=minitrain, importance=TRUE)
print(mini.rf)

## Big data linear regression
str(logitsubset)
OverallAccuracy = (23531 + 1243) / nrow(minitrain)
OverallAccuracy
Sensitivity = 23536 / (23536+1243)
Sensitivity
Specificity = 2160/ (2160+17)
Specificity


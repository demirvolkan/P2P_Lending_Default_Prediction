### Predicting Peer-to-Peer Lending Systems Default Rate Prediction with Machine Learning

#### 1. Abstract
  
This project will investigate the P2P Lending Default predictions. The Project
examines the application of machine learning techniques for forecasting process. The topic was
chosen due to inevitable rise of fin-tech startups and industry being highlighted. Theoretical
information on the machine learning has been used to derive empirical results. The dissertation
will inform the reader on the literature review of the systematic work of the P2P Systems, the big
data cleaning and machine learning analysis

#### 2. Introduction
Peer to peer lending systems have become a huge phenomenon in the world. Although
the amount of credit available through peer-to-peer lending is minuscule in comparison to
traditional credit, the public attention given is significant. A lot of start -ups started to thrive in
the past years, as players in the industry hiked. People tend to break ties with the mainstream
financial industry and become acquainted with P2P Lending systems all around the world; but in
Turkey, P2P Lending phenomenon is a brand new term. The Turkish people familiarized with
crowdfunding but they haven’t met with crowd lending side of the scale. Peer to peer ecosystems
are complex by their nature because it lost its definition of “Exchange between individuals” as
the parties in the system grew by number with the developments in technology. The individuals
lost their places to hedge funds, banks and wealth management firms in the market nowadays.

Like peer-to-peer lending in its earlier form, crowdfunding (kickstarter or gofundme)
involves setting up an online profile where the person seeking funding can plead their
case/aims/background in a narrative form. The role of the crowdfunding site is to provide a
platform for connecting geographically dispersed funders to particular causes they care about.
The transparency of user information will lead to better scoring. Because many banks are
struggling with credit risk modeling due to missing data. P2P lending sites, Bondora and Lending
Club are revealing all their data sources to the public.

In this research, we decided to focus on data mining side of Peer to Peer Lending systems
aiming to establish machine learning models in order to estimate default probability of credits. R
program was used for data mining applications and data was obtained from Lending Club free
source. In this project report, we will first discuss the literature review and then default
forecasting processes. In order to forecast, data cleaning and data mining processes have been
accomplished. It will be further discussed in the following paragraphs.

#### 3. Literature Review

When it comes to credit defaults, risks are never been out of question. But in the P2P
lending and borrowing has more risk since there is no institutionalized part in the system. But it
also has positive sidesthat with diversification in both borrower/lender portfolio and credit types
diversifying risk can be achieved.

To achieve that, there should be careful data mining in order to select the eligible investor
and borrowers and diminish the possible fraud and other drawbacks. The risk categorization and
expected default analysis should be held carefully when accepting them to the platform and
managing the possible hurdles in the platform carefully.

After careful data mining process the possible risks that abnormal economic situations
and other possible losses should be forecasted and hedged carefully.

In pure P2P, the investor can choose a certain borrower and interest rate but this pure
P2P model has some obvious risks and is more likely to plunge down. Therefore, platforms came
up with new strategies and solutions to this.

Many platforms initially offer investors to invest a certain class ( A+,A,B,C,D,E) and then
spread their total invested amount into groups of loans in the platform in order to diversify their
risks.

Some platforms match the investor and borrower with auto-diversification system, where
the possible risks are diminished by risk spreading, since in the consumer lending the investor
choice of borrower does not make a lot of sense when it comes to consumer lending since the
data is available for investor is limited. Those platforms who engage with auto-diversification
runs a buffer funds that works as a buffer when defaults arise

As in the hedging, the buffer funds also have a small operational fee, will eventually save
the investor when there is a possible default loss at ‘normal’ economic times. But in the worst
case or severe scenarios the buffer fund may not fully cover the whole loss in the individual loan
case. Unless the fund runs out, the investor won’t engage with default risks for a single loan.

P2P lending attracts investors as they can earn higher yields compared to other financial
products and they can diversify their risk by investing different loans. In the meantime, borrowers
can borrow funds easier and at lower interest rates compared to credits offered by banks,
additionally, loans are unsecured. P2P lending sites generate revenue by charging an upfront fee
from the borrower and a service charge from the investor. However, in this structure, investors
are exposed to considerable risk of default of loans.

Prior studies regarding loan defaults of P2P lending based on data on Prosper which is
one of the two largest P2P lending sites in United States show that there is a positive correlation
between the credit rating of borrowers and the success rate of loans. Moreover, while lower
interest rate decreases the borrowers' success probability on their loans to be funded, smaller
loan amount and specific description of loan may create an advantage on funding success. Also,
borrowers’ financial strength and demographic attributes have an impact on getting funded.
(Freedman and Jin(2008), Puro et al.(2010), Herzenstein et al.(2008) ).

There is another study aimed to produce a data for investors to protect themselves from
loans with high probability to default. This study suggests a model that predicts probability of
default using loan application data and several macroeconomic data based on Lending Club
publicly available historic database.

The linear regression, logistic regression and random forest classifier models built a model
that can help investors to avoid loans that are more likely to default. On the other hand, it
appears that tree based classifiers are better at handling the skewness of data compared to
logistic regression and linear regression. A recent study on P2P lending revealed that random
forest classifier overcomes the over-fitting problem and increases the accuracy of the model. It
presents that the most crucial attribute is interest rate and the trees are split by this attribute
Kumar et al.(2016).

#### 4. Data Mining
##### 4.1. Data Overview

Our raw data includes 2,260,701 observations and 151 variables. Variables generally give 
information about customers’ economical profile and loans’ characteristics. 

Variables such as annual_inc, emp_lenght, emp_title, grade, home_ownership provide 
information about customers’s economical situation. Whereas, variables such as int_rate, 
installment, loan_amnt, loan_status, term provide details regarding loan characteristics.

Due to the detailed and massive amount of information raw data contains, data cleaning 
became the project’s main focus before applying data mining. 

Final variables that have been obtained after data cleaning process and their descriptions 
can be found in the table below. All variables that are included in raw data and their 
descriptions can also be found in the appendix.

<img src="https://user-images.githubusercontent.com/89068333/165317890-010fc8f9-7cf8-4998-82b1-97b46803c91a.PNG" width=50% height=50%>


##### 4.2. Data Wrangling
R Studio was used for data mining purposes in this project. At first, there were 24 
factor variables, 126 numerical variables and only 1 logical variable in raw data. Raw data does 
not include any characteristic variables because characteristic variables also were shown as 
factor variables.

In the first step of data cleaning process, the last 36 columns of raw data were eliminated 
by solely reviewing their description of columns on data set, which can be also found on the 
appendix. These variables were not explanatory enough and thus by eliminating them new data 
called “p2pelimination1” was obtained.

Secondly, variables url, desc, verification_status, zip_code, addr_state, next_pymnt_d, 
mths_since_last_major_derog, annual_inc_joint, dti_joint, verification_status_joint were 
eliminated as they are not numerical variables and useful in regression analysis.

The columns of member_id, mths_since_last_delinq, mths_since_last_record, 
open_acc_6m open_act_il, open_il_12m, open_il_24m, mths_since_rcnt_il, total_bal_il,
il_util, open_rv_12m, open_rv_24m, max_bal_bc, all_util, inq_fi, total_cu_tl,
inq_last_12m, mths_since_recent_bc_dlq, mths_since_recent_inq,
mths_since_recent_revol_delinq, num_tl_120dpd_2m which have more than 150,000 empty 
observations were detected in the first place, than these columns were removed from the 
dataframe of “p2pelimination1”.

After above processes, 81 columns are left but number of observations was still 2,260,701.
After careful data reduction, the NA values in the rows were removed and the new subset 
named “p2pelimination2” has 2,094,337 observations. 

As applying data mining tools to very big data sets can become time consuming and data 
mining process can result in misleading outcomes because of large complexity, it was decided 
to constitute a smaller subset of data. In accordance with this purpose, subset of 
“p2pelimination2” was created by taking 20% sample of it. This new subset was called 
“p2psubset” and includes 418,867 observations and 81 variables.

Next step was converting the term factor variable to binary variable. Term variable was 
consisted of 2 levels which are “36 months” and “60 months”. After conversion, levels has 
become “1” and “0” respectively. 

Investment grade variable had 7 levels of A, B, C, D, E, F, G. It was converted to factor 
variable which has 7 levels as 1, 2, 3, 4, 5, 6, 7 respectively.

Sub_grade variable was removed because grade variable has been already utilized and 
sub_grade variable has nothing to contribute to data mining process more.

Emp_lenght variable was factor variable with 11 levels which were < 1 year, 1 year, 2 years, 
3 years, 4 years, 5 years, 6 years, 7 years, 8 years, 9 years, 10 years and 10+ years. With the aim 
of decreasing the complexity by reducing the number of levels, grouping these 11 levels into 3 
sub groups was implemented by examining the percentage weights of all levels. Subgroups were constituted as Group 1, Group 2 and Group 3 which include 0 – 3 years, 4 years – 9 years, 
10+ years respectively.

<img src="https://user-images.githubusercontent.com/89068333/165324997-ef4018f0-6a11-424f-93e9-8c680c50a69e.PNG" width=40% height=40%>

Home_ownership variable was factor variable with 6 levels which were mortgage, own, 
rent, any, other and none. Any, other and none levels were found to be insignificant as there 
were very small number of data belonging these levels. Therefore, any, other and none levels 
were removed from the p2psubset and new subset was called “p2psubset4” including 418,661 
observations.

<img src="https://user-images.githubusercontent.com/89068333/165326413-e5c5955a-f66a-41b9-aa81-5115afae228d.PNG" width=40% height=40%>

At this point, pymnt_plan, title, purpose, initial_list_status, last_credit_pull_d, 
emp_title, issue_d, earliest_cr_line, last_pymnt_d were eliminated from p2psubset4 since 
these variables are characteristic factor variables and cannot be included in regression or 
random forest data mining methods. After this elimination, 71 variables are left.

Application_type was factor variable with 2 levels which are individual and joint app. It 
was converted to binary variable with 2 levels which are 0 and 1 respectively.

Policy_code, grade, home_ownership and loan_status are the factor variables, since 
only numerical variables can be included in correlation analysis, a numeric subset without these 
4 variables was created. In this numeric subset, from left to the right the explanatory power of 
variables was decreasing. Therefore, only first 30 variables were kept in this numeric dataset.

Since, the number of variables has been reduced to 30, the correlation analysis between 
the variables can now be performed to decide which variables to be eliminated. A correlation 
matrix shows the correlation coefficients between variables. In data mining, especially in 
regression analysis, using highly correlated variable may lead misleading results therefore, data 
elimination by correlation coefficients with the help of correlation matrix is very useful tool in 
data mining. These matrices presents the upper diagonal results, since the square matrix is 
symmetric. The blue dots represent positive correlation, while the red ones represents negative 
correlation. With the purpose of reducing complexity, first another correlation matrix with 20 
variables was created. 

![correlation_matrix](https://user-images.githubusercontent.com/89068333/165327449-5bb1a8e0-5735-4ec8-b354-8dda10ea403e.PNG)

Loan_status is a factor variable with 7 levels which are charged off, fully paid, current, in 
grace peridod, late(31-120 days), late(16-30 days) and default. Loan_status will be output 
variable in regression analysis therefore it was converted into binary variable where default, 
charged off, late(31-120 days) and late(16-30 days) correspond to 1 and current and in grace 
period correspond to 0.

Fico_range_low and fico_range_high variables were used to create a new variable called 
fico_avg by averaging these 2 variables. After creating this new variable, fico_range_low, 
fico_range_high, last_fico_range_high variables were removed as they can be seen highly 
correlated from the above correlation matrices.

Prncputil, out_prncp_inv, pymntutil, total_pymnt_inv, fndutil, funded_amnt_inv, 
loan_amnt, collection_recovery_fee variables were removed from dataset because of high 
correlation with other variables.

Open_acc and total_acc variables were used to create a new variable called acc_ratio by 
dividing open_acc to total_acc. After creating this new variable, open_acc and total_acc 
variables were removed as they can be seen highly correlated from the above correlation 
matrices.

Total_pymnt, grade and installment variables were also removed from the dataset 
because of high correlation with other variables.

After all of these eliminations, there are 23 variables left and the updated correlation matrix is 
as follows;

![correlation_matrix2](https://user-images.githubusercontent.com/89068333/165330458-ed6daf35-bc5f-43e2-b53c-cf86e9f42f78.PNG)

##### 4.3. Logistic Regression

Logistic regression models the relationship between independent variables and output 
variable by calculating probabilites using logistic function. We used logistic regression to 
estimate the probability of default on loan status.

“minisubset2” data has been integrated into logistic regression in this section. First, splitting the 
data to train and test with ratios 70% and 30% correspondingly. The seed set for obtaining the 
same result for every trial.

R uses glm function for logistic regression. It is first applied for all of train data. According to 
regression results last_pymnt_amnt, fico_avg, revol_util, annual_inc, installment, grade( B nad 
C factor levels) are the most important variables that affect loan status prediction.

In every research, there are four possible outcomes: True Positive, False Negative, True 
Negative and False Positive. True Positive and True Negative are correct conclusion where the 
False Negative and False Positive rejects the Null Hypothesis and they are aslo known as Type 1 
and Type 2. These type of errors ocur when a prediction incorrectly rejects a true null 
hypothesis and attains false value. Predicting correctly attained values are very important when 
it comes to models accuracy. The Sensitivity, Specifity, Accuracy, RoC curve are metrics using 
these informations from Null hyphotesis and they determine the models strength.
  - **Sensitivity** (True Positive rate) measures the proportion of positives that are 
correctly identified
  - **Specificity** (True Negative rate) measures the proportion of negatives that are 
correctly identified
  - **Accuracy** can be defined as the percentage of correctly classified instances.
  - **Area Under the Curve (AUC)** is the measure of the ability of a classifier to 
distinguish between classes and is used as a summary of the ROC curve.

According to logistic regression results, by analyzing predict function, our logistic regression 
result gives 98.90% accuracy rate. Although this accuracy is obviously perfect, it leads us to 
suspect about our data mining process. It may have been caused by too careful data cleaning or 
overfitting. Therefore, it has been decided to apply different methods of data mining. In 
addition sensitivity measure is calculated as 90.47% and specificity measure is calculated as 
98.21%.

##### 4.4. Linear Regression

Linear regression assumes a linear relationship between dependent variable and regressors. 
Linear regression predicts the dependent variable from regressors. On R studio, using the 
function lm enables us to test the predicting ability and the significance of independent 
variables both. And these results can be observed in the output. Significance can be increased 
with explanatory power of the regressor. Eliminating collinearity between the regressors also 
beneficial to improve predictive strength. As the significant regressors increased and 
insignificant ones are eliminated, the predictive ability of the regression would be improved. 
The function in mathematical terms can be written as 

  - Y = β1 + β2X + β3X2 +….+ βn+1Xn + ϵ
where β1 is intercept and βN is regression coefficient. 
ϵ is the error term, the part of Y the regression model is unable to explain.

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

![alt text](C:/Users/v.demir/Documents/GitHub/loan_status_descriptions.PNG)

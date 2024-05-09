CREATE database Bank_Loan_Analytics;
use Bank_Loan_Analytics;
SELECT * FROM finance_001;
SELECT * FROM Finance_02;


/*  1.Year Wise Loan Amount Status
    2.Grade and Sub grade Wise revol_bal
    3.Total Payment for verified status Vs Total payment for non-verified status
    4.State wise Loan Status
    5.Home ownership Vs last payment date stats
*/


/* KPI 1- Find Year Wise Loan Amount Status */

SELECT year(issue_d) as year_of_issue_d, sum(loan_amnt) as Total_loan_amnt 
FROM finance_001 
GROUP BY year_of_issue_d 
ORDER BY year_of_issue_d;


/* KPI 2- Find Grade and sub grade wise revol_bal */

SELECT grade, sub_grade, sum(revol_bal) as total_revol_bal 
FROM finance_001 
INNER JOIN finance_02 on(finance_001.id=finance_02.id) 
GROUP BY grade,sub_grade 
ORDER BY grade,sub_grade;


/* KPI 3- Find Total Payment for Verified Status Vs Total Payment for Non-Verified Status */

SELECT verification_status,concat("$",format(round(sum(total_pymnt)/1000000,2),2),"M") 
AS total_payment 
FROM finance_001 
INNER JOIN finance_02 on(finance_001.id=finance_02.id) 
GROUP BY verification_status;



/* KPI 4- Find State wise Loan Status */

SELECT addr_state, last_Credit_pull_D,loan_status 
FROM  finance_001 
INNER JOIN finance_02 on(finance_001.id=finance_02.id) 
GROUP BY addr_state,last_Credit_pull_D,loan_status 
ORDER BY last_Credit_pull_D ;



/* KPI 5- Find Home ownership Vs last payment date stats */

SELECT home_ownership, last_pymnt_d, sum(last_pymnt_d) 
AS total_amount 
FROM finance_001 
INNER JOIN finance_02 on(finance_001.id=finance_02.id) 
GROUP BY home_ownership, last_pymnt_d 
ORDER BY last_pymnt_d desc ,home_ownership desc;





create database Bank_Loan_Analytics;
use Bank_Loan_Analytics;
select * from finance_001;
select * from Finance_02;

/*  1.Year wise loan amount status
	2.Grade and sub grade wise revol_bal
    3.Total Payment for verified status Vs Total payment for non-verified status
    4.State wise laon status
    5.Home ownership Vs last payment date stats
*/
# KPI 1
SELECT 
	year(issue_d) as year_of_issue_d, sum(loan_amnt) as Total_loan_amnt 
FROM 
	finance_001 
GROUP BY 
	year_of_issue_d 
ORDER BY 
	year_of_issue_d;




# KPI 2
SELECT 
	grade, sub_grade, sum(revol_bal) as total_revol_bal 
FROM 
	finance_001 
INNER JOIN 
	finance_02 on(finance_001.id=finance_02.id) 
GROUP BY 
	grade,sub_grade 
ORDER BY 
	grade,sub_grade;


# KPI 3
SELECT 
	verification_status,concat("$",format(round(sum(total_pymnt)/1000000,2),2),"M") 
AS 
	total_payment 
FROM 
	finance_001 
INNER JOIN 
	finance_02 on(finance_001.id=finance_02.id) 
GROUP BY 
	verification_status;




# KPI 4
SELECT 
	addr_state, last_Credit_pull_D,loan_status 
FROM  
	finance_001 
INNER JOIN 
	finance_02 on(finance_001.id=finance_02.id) 
GROUP BY 
	addr_state,last_Credit_pull_D,loan_status 
ORDER BY 
	last_Credit_pull_D ;






# KPI 5
SELECT
	home_ownership, last_pymnt_d, sum(last_pymnt_d) 
AS
	total_amount 
FROM 
	finance_001 
INNER JOIN 
	finance_02 on(finance_001.id=finance_02.id) 
GROUP BY 
	home_ownership, last_pymnt_d 
ORDER BY 
	last_pymnt_d desc ,home_ownership desc;





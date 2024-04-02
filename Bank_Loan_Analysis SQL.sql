create database Bank_Loan_Analysis_Project;
use Bank_Loan_Analysis_Project;
select count(*) from Finance_1;
select count(*) from Finance_2;
select * from finance_1;
select * from finance_2;

/*
> KPI-
> 1.Year wise Loan Amount
> 2.Grade-Subgrade wise revol balance
> 3.Total payment for Verified Status vs Non-Verified Status
> 4.State wise and month wise loan status
> 5.Home Ownership vs Last payment Date Stats
*/


-- KPI- 1.Year wise Loan Amount--
SELECT year(ISSUE_D) AS YEAR_OF_ISSUE_D , SUM(LOAN_AMNT) AS TOTAL_LOAN_AMNT
FROM FINANCE_1
group by YEAR_OF_ISSUE_D
order by YEAR_OF_ISSUE_D;

-- KPI- 2.Grade-Subgrade wise revol balance--
select grade, sub_grade, sum(revol_bal) as Total_Revol_Bal
from finance_1 inner join finance_2
on (finance_1.id = finance_2.id)
group by grade , sub_grade
order by grade , sub_grade;

-- KPI- 3.Total payment for Verified Status vs Non-Verified Status--
select verification_status , sum(total_pymnt) as Total_Payment
from finance_1 inner join finance_2
on (finance_1.id = finance_2.id)
group by verification_status;

-- KPI- 4.State wise and month wise loan status
select addr_state, last_credit_pull_d ,loan_status
from finance_1 inner join finance_2
on (finance_1.id = finance_2.id)
group by addr_state, last_credit_pull_d ,loan_status
order by last_credit_pull_d;

-- KPI- 5.Home Ownership vs Last payment Date Stats --
select home_ownership, last_pymnt_d, 
concat(format(sum(loan_amnt)/10000,0),"K") as Total_amount
from finance_1 inner join finance_2
on (finance_1.id = finance_2.id)
group by home_ownership, last_pymnt_d
order by last_pymnt_d desc , home_ownership desc;


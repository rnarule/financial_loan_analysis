SELECT * FROM bank_loan_data

select count(id) as Total_Loan_Applications from bank_loan_data

select count(id) as MTD_Total_Loan_Applications from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

select count(id) as PMTD_Total_Loan_Applications from bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

SELECT SUM(loan_amount)as MTD_Total_Funded_Amount from bank_loan_data
where MONTH(issue_date) = 12 and Year(issue_date) = 2021

SELECT SUM(loan_amount)as PMTD_Total_Funded_Amount from bank_loan_data
where MONTH(issue_date) = 11 and Year(issue_date) = 2021

SELECT SUM(total_payment) as MTD_Total_Amount_received from bank_loan_data
where MONTH(issue_date) = 12 and Year(issue_date) = 2021

SELECT SUM(total_payment) as PMTD_Total_Amount_received from bank_loan_data
where MONTH(issue_date) = 11 and Year(issue_date) = 2021


SELECT AVG(int_rate) * 100 as Avg_Interest_Rate from bank_loan_data
SELECT ROUND(AVG(int_rate),4) * 100 as Avg_Interest_Rate from bank_loan_data


SELECT ROUND(AVG(int_rate),4) * 100 as MTD_Avg_Interest_Rate from bank_loan_data
where MONTH(issue_date) = 12 and Year(issue_date) = 2021


SELECT ROUND(AVG(int_rate),4) * 100 as PMTD_Avg_Interest_Rate from bank_loan_data
where MONTH(issue_date) = 11 and Year(issue_date) = 2021

SELECT AVG(dti) * 100 as Avg_DTI from bank_loan_data
SELECT round(AVG(dti),4) * 100 as Avg_DTI from bank_loan_data

SELECT round(AVG(dti),4) * 100 as Avg_DTI from bank_loan_data
where MONTH(issue_date) = 12 and Year(issue_date) = 2021


SELECT round(AVG(dti),4) * 100 as Avg_DTI from bank_loan_data
where MONTH(issue_date) = 11 and Year(issue_date) = 2021

select loan_status from bank_loan_data

select 
     (count(case when loan_status = 'Fully Paid' OR loan_status = 'Current' then id END)*100)
	 /
	 COUNT(ID) AS Good_loan_percentage
from bank_loan_data

select count(id) AS Good_loan_applications from bank_loan_data
where loan_status = 'Fully Paid' OR loan_status = 'Current'

select sum(loan_amount) AS Good_loan_funded_amount from bank_loan_data
where loan_status = 'Fully Paid' OR loan_status = 'Current'

select sum(total_payment) AS Good_loan_received_amount from bank_loan_data
where loan_status = 'Fully Paid' OR loan_status = 'Current'

select 
      (count(case when loan_status = 'Charged off' then id END) * 100.0) /
	  count(id) as Bad_loan_percentage
from bank_loan_data

select count(id) as Bad_Loan_Application from bank_loan_data
where loan_status = 'Charged off'

select sum(loan_amount) as Bad_Loan_funded_amount from bank_loan_data
where loan_status = 'Charged off'


select sum(total_payment) as Bad_Loan_recieved_amount from bank_loan_data
where loan_status = 'Charged off'


select 
       loan_status,
	   count(id) as Total_Loan_applications,
	   sum(total_payment) as Total_amount_received,
	   sum(loan_amount) as Total_funded_amount,
	   AVG(int_rate * 100) as Interest_rate,
	   avg(dti * 100) as DTI
	FROM
	   bank_loan_data
    group by
	   loan_status


select 
      loan_status,
	  sum(total_payment) as MTD_Total_Amount_Received,
	  SUM(loan_amount) as MTD_Total_Funded_Amount
from bank_loan_data
where month(issue_date) =12
group by loan_status

SELECT 
	MONTH(issue_date) AS Month_Number, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)


SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state


SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term

SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose

SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership


SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose

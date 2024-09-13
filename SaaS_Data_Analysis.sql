-- SaaS DATA ANALYSIS OF SERVICE BASED COMPANY




-- PROBLEM STATEMENT1 : Average Usage Time by Subscription Plan

SELECT 
    s.subscription_plan,
    CONCAT(ROUND(AVG(u.usage_duration_minutes)), ' minutes') AS average_usage_time
FROM 
    subscription_payments s
JOIN 
    usage u ON s.user_id = u.user_id
GROUP BY 
    s.subscription_plan;






-- PROBLEM STATEMENT2 : Top Features Used by Premium Users

SELECT 
    f.feature_name AS Top_Features,
    CONCAT(
        FLOOR((sum(u.usage_duration_minutes) % 1440) / 60), ' hours, ',
        (sum(u.usage_duration_minutes) % 1440) % 60, ' minutes'
    ) AS usage_count
FROM 
    subscription_payments s
JOIN 
    usage u ON u.user_id = s.user_id
JOIN 
    features f ON f.feature_id = u.feature_id
WHERE 
    s.subscription_plan = 'Premium'
GROUP BY 
    f.feature_name
ORDER BY 
    sum(u.usage_duration_minutes) DESC;


-- PROBLEM STATEMENT3: Churn Rate Analysis

select (u.first_name||' '||u.last_name) as user_name, status
from users u
where status = 'Cancelled';


-- PROBLEM STATEMENT4: Monthly Active Users

SELECT 
    TO_CHAR(usage_date, 'YYYY-MM') AS month,
    COUNT(DISTINCT user_id) AS active_users
FROM 
    usage
GROUP BY 
    month
ORDER BY 
    month;



-- PROBLEM STATEMENT5: User Retention Analysis


WITH initial_users AS (
    SELECT user_id
    FROM subscription_payments
    WHERE payment_date BETWEEN CURRENT_DATE - INTERVAL '3 months' AND CURRENT_DATE
)
SELECT 
    s.subscription_plan,
    (COUNT(DISTINCT u.user_id) / (SELECT COUNT(DISTINCT user_id) FROM initial_users)) * 100 AS retention_rate
FROM 
    initial_users i
JOIN 
    usage u ON i.user_id = u.user_id
JOIN 
    subscription_payments s ON u.user_id = s.user_id
GROUP BY 
    s.subscription_plan;


/*
PROBLEM STATEMENT6: 
Generate a report that lists each premium subscriber's usage details, 
including their full name, user ID, usage date, and formatted usage duration. 
Ensure that the report is sorted by the total usage duration in descending order to 
highlight the most frequent usage.
*/

	
SELECT 
	(uu.first_name||' '||uu.last_name) as user_name,
	u.user_id,
    u.usage_date AS day,
    CONCAT(ROUND(SUM(u.usage_duration_minutes)), ' minutes') AS usage_count
FROM 
    usage u
JOIN users uu ON u.user_id = uu.user_id
WHERE 
    u.user_id IN (SELECT s.user_id FROM subscription_payments s WHERE s.subscription_plan = 'Premium')
GROUP BY 
    u.usage_date,u.user_id,user_name
ORDER BY 
    usage_count DESC;


/* 
PROBLEM STATEMEN7:
analyze the adoption rate of various features based on user activity and recent signups.
*/

WITH new_features AS (
    SELECT f.feature_id,u.user_id
    FROM features f
	join usage u on u.feature_id = f.feature_id
	join users on users.user_id = u.user_id
	
    WHERE signup_date >= NOW() - INTERVAL '3 MONTHS'
)
SELECT 
    f.feature_name,
    (COUNT(DISTINCT u.user_id) / (SELECT COUNT(DISTINCT user_id) FROM users)) * 100 AS adoption_rate
FROM 
    usage u
JOIN 
    features f ON u.feature_id = f.feature_id
GROUP BY 
    f.feature_name;


/*
PROBLEM STATEMENT8: 
Determine the financial performance of different subscription plans offered by the service provider
*/


SELECT 
    subscription_plan,
    SUM(amount) AS total_revenue
FROM 
    subscription_payments
GROUP BY 
    subscription_plan
ORDER BY
	total_revenue DESC;



/* PROBLEM STATEMENT9:
Analyze feedback ratings to determine overall platform satisfaction. Calculate the average rating per subscription plan.
*/

SELECT
    u.subscription_plan,
    ROUND(AVG(f.rating),2) AS average_rating
FROM
    feedback f
JOIN
    users u ON f.user_id = u.user_id
GROUP BY
    u.subscription_plan;


/*
PROBLEM STATEMENT 10: Determine the number of users subscribed to each subscription plan.
*/

SELECT
    subscription_plan,
    COUNT(user_id) AS number_of_users
FROM
    users
GROUP BY
    subscription_plan
ORDER BY
    number_of_users DESC;

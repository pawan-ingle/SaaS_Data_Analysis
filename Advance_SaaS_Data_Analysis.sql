--PROBLEM STATEMENT1:  Generate a detailed report combining user feedback, usage, and payment information.

SELECT
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS full_name,
    u.subscription_plan,
    f.feedback_date,
    f.rating,
    us.usage_date,
    us.usage_duration_minutes,
    sp.payment_date,
    sp.amount
FROM
    users u
LEFT JOIN
    feedback f ON u.user_id = f.user_id
LEFT JOIN
    usage us ON u.user_id = us.user_id
LEFT JOIN
    subscription_payments sp ON u.user_id = sp.user_id
ORDER BY
    u.user_id, f.feedback_date, us.usage_date, sp.payment_date;




-- PROBLEM STATEMENT2: Rank users based on their total usage duration within each subscription plan.
SELECT
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS full_name,
    u.subscription_plan,
    SUM(us.usage_duration_minutes) AS total_usage_minutes,
    RANK() OVER (PARTITION BY u.subscription_plan ORDER BY SUM(us.usage_duration_minutes) DESC) AS usage_rank
FROM
    users u
JOIN
    usage us ON u.user_id = us.user_id
GROUP BY
    u.user_id, u.first_name, u.last_name, u.subscription_plan;




-- PROBLEM STATEMENT3: Find the hierarchy of users who have given feedback, based on their rating and the number of feedback entries.

WITH RECURSIVE UserHierarchy AS (
    -- Base case: Initial set of users with high ratings
    SELECT
        u.user_id,
        (u.first_name||' '||u.last_name) AS full_name,
        f.rating,
        1 AS level
    FROM
        users u
    JOIN
        feedback f ON u.user_id = f.user_id
    WHERE
        f.rating >= 8
    
    UNION ALL

    -- Recursive case: Extend the hierarchy based on additional feedback
    SELECT
        u.user_id,
        CONCAT(u.first_name, ' ', u.last_name) AS full_name,
        f.rating,
        uh.level + 1 AS level
    FROM
        feedback f
    JOIN
        users u ON f.user_id = u.user_id
    JOIN
        UserHierarchy uh ON u.user_id = uh.user_id
    WHERE
        f.rating >= 8
        AND uh.level < 10  -- Limit recursion depth to avoid performance issues
)
SELECT
    user_id,
    full_name,
    rating,
    level
FROM
    UserHierarchy
ORDER BY
    level, rating DESC;


--PROBLEM STATEMENT4: Create a view to simplify accessing aggregated feedback data.

CREATE OR REPLACE VIEW aggregated_feedback AS
SELECT
    u.subscription_plan,
    COUNT(f.feedback_id) AS feedback_count,
    ROUND(AVG(f.rating),2) AS avg_rating
FROM
    feedback f
JOIN
    users u ON f.user_id = u.user_id
GROUP BY
    u.subscription_plan;

SELECT * FROM aggregated_feedback;


-- PROBLEM STATEMENT5: Develop a stored procedure to handle subscription payments and update user details based on the provided information.


CREATE OR REPLACE PROCEDURE pr_process_subscription_payment(
    p_user_id INT,
	p_payment_id INT,
    p_payment_date DATE,
    p_amount DECIMAL(10, 2),
    p_subscription_plan VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_current_status VARCHAR(50);
    v_existing_plan VARCHAR(50);
BEGIN
    -- Check if the user exists and is active
    SELECT status, subscription_plan
    INTO v_current_status, v_existing_plan
    FROM users
    WHERE user_id = p_user_id;
    
    IF v_current_status IS NULL THEN
        RAISE NOTICE 'User ID % does not exist.', p_user_id;
    ELSIF v_current_status <> 'Active' THEN
        RAISE NOTICE 'User ID % is not active.', p_user_id;
    ELSE
        -- Insert payment details into subscription_payments table
        INSERT INTO subscription_payments (user_id, payment_id, payment_date, amount, subscription_plan)
        VALUES (p_user_id,p_payment_id, p_payment_date, p_amount, p_subscription_plan);
        
        -- Update user's subscription plan if it has changed
        IF v_existing_plan <> p_subscription_plan THEN
            UPDATE users
            SET subscription_plan = p_subscription_plan
            WHERE user_id = p_user_id;
            
            RAISE NOTICE 'Subscription plan updated for User ID % to %.', p_user_id, p_subscription_plan;
        END IF;
        
        -- Raise a notice about the successful payment
        RAISE NOTICE 'Payment of % for User ID % processed successfully on %.', p_amount, p_user_id, p_payment_date;
    END IF;
END;
$$;

-- CALL PROCDURE 

CALL pr_process_subscription_payment(1,106, '2024-09-10', 4999.00, 'Premium');



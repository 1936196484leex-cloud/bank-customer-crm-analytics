-- Q1.Overall Conversion Rate
SELECT
    count(*) AS total_customers,
    SUM(
        CASE
            WHEN y = 'yes' THEN 1
            ELSE 0
        END
    ) AS converted_customers,
    round(
        100.0 * SUM(
            CASE
                WHEN y = 'yes' THEN 1
                ELSE 0
            END
        ) / count(*),
        2
    ) AS conversion_rate
FROM
    bank;

-- Q2.Conversion Rate by Job 
SELECT
    job,
    COUNT(*) AS customer_count,
    SUM(
        CASE
            WHEN y = 'yes' THEN 1
            ELSE 0
        END
    ) AS conversion_count,
    ROUND(
        100.0 * sum(
            CASE
                WHEN y = 'yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS conversion_rate
FROM
    bank
GROUP BY
    Job
ORDER BY
    conversion_count DESC;

-- Q3. Financial Characteristics
-- Q3.1  Conversion Rate by housing loan 
SELECT
    housing,
    count(*) as customer_count,
    sum(
        CASE
            WHEN y = 'yes' THEN 1
            ELSE 0
        END
    ) AS conversion_count,
    round(
        100.0 * sum(
            CASE
                WHEN y = 'yes' THEN 1
                ELSE 0
            END
        ) / count(*),
        2
    ) AS conversion_rate
FROM
    bank
group by
    housing
order by
    conversion_count DESC;

--Q 3.2 Conversion Rate by personal loan 
SELECT
    loan,
    count(*) AS customer_count,
    sum(
        CASE
            when y = 'yes' THEN 1
            ELSE 0
        END
    ) AS conversion_count,
    round(
        100.0 * sum(
            CASE
                when y = 'yes' THEN 1
                ELSE 0
            END
        ) / count(*),
        2
    ) AS conversion_rate
FROM
    bank
group by
    loan
order by
    conversion_rate DESC;

--Q 3.3 Conversion_rate by Balance 
SELECT
    CASE
        WHEN balance < 0 THEN 'negative'
        WHEN balance < 1500 THEN '1-1499'
        WHEN balance < 3000 THEN '1500-2999'
        ELSE '3000+'
    END AS balance_group,
    count(*) AS customer_count,
    sum(
        CASE
            when y = 'yes' THEN 1
            ELSE 0
        END
    ) AS conversion_count,
    round(
        100.0 * sum(
            CASE
                when y = 'yes' THEN 1
                ELSE 0
            END
        ) / count(*),
        2
    ) AS conversion_rate
FROM
    bank
group by
    CASE
        WHEN balance < 0 THEN 'negative'
        WHEN balance < 1500 THEN '1-1499'
        WHEN balance < 3000 THEN '1500-2999'
        ELSE '3000+'
    END;

--Q 4 Campaign & Marketing Analysis
--Q 4.1 Campaign Contact Frequency
SELECT
    campaign,
    count(*) AS customer_count,
    sum(
        CASE
            when y = 'yes' then 1
            else 0
        END
    ) AS conversion_count,
    round(
        100.0 * sum(
            CASE
                when y = 'yes' then 1
                else 0
            END
        ) / count(*),
        2
    ) AS conversion_rate
FROM
    bank
GROUP by
    campaign
ORDER by
    conversion_count DESC;

--Q 4.2 previous
SELECT
    previous,
    count(*) AS customer_count,
    sum(
        CASE
            when y = 'yes' then 1
            else 0
        END
    ) AS conversion_count,
    round(
        100.0 * sum(
            CASE
                when y = 'yes' then 1
                else 0
            END
        ) / count(*),
        2
    ) AS conversion_rate
FROM
    bank
group by
    previous
order by
    conversion_count DESC;

-- Q 4.3 Poutcome
SELECT
    poutcome,
    count(*) AS customer_count,
    sum(
        CASE
            when y = 'yes' then 1
            else 0
        END
    ) AS conversion_count,
    round(
        100.0 * sum(
            CASE
                when y = 'yes' then 1
                else 0
            END
        ) / count(*),
        2
    ) AS conversion_rate
FROM
    bank
group by
    poutcome
order by
    conversion_count DESC;

-- previous and poutcome
SELECT
    previous,
    poutcome,
    count(*) AS customer_count,
    sum(
        CASE
            when y = 'yes' then 1
            else 0
        END
    ) AS conversion_count,
    round(
        100.0 * sum(
            CASE
                when y = 'yes' then 1
                else 0
            END
        ) / count(*),
        2
    ) AS conversion_rate
FROM
    bank
group by
    previous,
    poutcome
order by
    previous;

-- Q5 Target Customer Identification
-- Target criteria:
-- 1.balance >= 1500
-- 2.no housing loan 
-- 3.no personal loan
-- 4.previous campaign outcome = success
--Q5.1 identify the target customers
SELECT
    *
FROM
    bank
WHERE
    balance >= 1500
    AND housing = 'no'
    AND loan = 'no'
    AND poutcome = 'success';

--caculate target segment
SELECT
    count(*) as customer_count,
    sum(
        CASE
            when y = 'yes' then 1
            ELSE 0
        END
    ) as conversion_count,
    round(
        100.0*sum(
            CASE
                when y = 'yes' then 1
                ELSE 0
            END
        ) / count(*),
        2
    ) as conversion_rate
FROM
    bank
WHERE
    balance >= 1500
    AND housing = 'no'
    AND loan = 'no'
    AND poutcome = 'success';
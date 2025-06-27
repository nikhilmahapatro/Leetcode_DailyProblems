# Write your MySQL query statement below
WITH tiv_2015_counts AS (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
),

unique_location_policyholders AS (
    SELECT *
    FROM Insurance
    WHERE (lat, lon) NOT IN (
        SELECT lat, lon
        FROM Insurance
        GROUP BY lat, lon
        HAVING COUNT(*) > 1
    )
),

qualified_policyholders AS (
    SELECT i.*
    FROM unique_location_policyholders i
    JOIN tiv_2015_counts c ON i.tiv_2015 = c.tiv_2015
)

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM qualified_policyholders;

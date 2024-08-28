SELECT 
    DATE_TRUNC(date_date, MONTH) AS month,  
    ROUND(SUM(ads_margin),2) AS ads_margin,
    ROUND(SUM(average_basket),2) AS average_basket,
    ROUND(SUM(operational_margin),2) AS operational_margin,
    
FROM {{ ref('finance_campaigns_day') }} 
GROUP BY month
ORDER BY month DESC

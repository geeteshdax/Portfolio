--Overall revenue and profit
SELECT 
  SUM(revenue) as total_revenue,
  SUM(profit) as total_profit
FROM transactions;

--Profit contribution by category
SELECT category,
  SUM(profit) as total_profit
FROM transactions
GROUP BY category
ORDER BY SUM(profit) DESC;

--Average profit margin by category
SELECT category,
  AVG(profit_margin) * 100 as profit_margin
FROM transactions
GROUP BY category
ORDER BY AVG(profit_margin) DESC;

--Monthly revenue trend
SELECT 
  DATE_TRUNC('month', sales_date)::DATE as month,
  SUM(revenue) as monthly_revenue
FROM transactions
GROUP BY month
ORDER BY month;

--Monthly profit trend
SELECT 
  DATE_TRUNC('month', sales_date):: DATE as month,
  SUM(profit) as total_profit
FROM transactions
GROUP BY month
ORDER BY month;

--Categories with high sales volume but low profit
SELECT
    category,
    COUNT(revenue) AS transactions_,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit
FROM transactions
GROUP BY category
ORDER BY transactions_ DESC, total_profit ASC;

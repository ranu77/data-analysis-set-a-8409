-- SQL Dialect: MySQL 8.0
USE delivery_analysis;

-- S2a: Total delay_days by service type
SELECT 
    r.service_type,
    SUM(GREATEST(d.actual_days - d.promised_days, 0)) AS total_delay_days
FROM deliveries d
JOIN routes r ON d.route_id = r.route_id
GROUP BY r.service_type
ORDER BY total_delay_days DESC;

-- S2b: Routes with significant delay (total delay_days > 8)
SELECT 
    d.route_id,
    SUM(GREATEST(d.actual_days - d.promised_days, 0)) AS total_delay_days
FROM deliveries d
GROUP BY d.route_id
HAVING total_delay_days > 8;

-- S2c: Top two hubs by total delay_days
SELECT 
    hub,
    SUM(GREATEST(actual_days - promised_days, 0)) AS total_delay_days
FROM deliveries
GROUP BY hub
ORDER BY total_delay_days DESC, hub ASC
LIMIT 2;

-- Diagnostic: Check for unmatched route_id keys
SELECT 
    d.route_id,
    r.route_id AS matched_route
FROM deliveries d
LEFT JOIN routes r ON d.route_id = r.route_id
WHERE r.route_id IS NULL;
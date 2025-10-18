SELECT
  CASE
    WHEN p.status IN ('created', 'shipped', 'on hold') THEN 'active'
    WHEN p.status IN ('delivered', 'cancelled')         THEN 'inactive'
  END AS status_group,
  CASE
    WHEN p.status IN ('created', 'shipped', 'on hold') THEN 'created,on hold,shipped'
    ELSE 'cancelled,delivered'
  END AS statuses,
  COUNT(*) AS total_packages,
  CAST(ROUND(SUM(p.weight), 2) AS DECIMAL(10,2)) AS total_weight
FROM packages AS p
-- ignore any unexpected/empty statuses
WHERE p.status IN ('created','shipped','on hold','delivered','cancelled')
GROUP BY status_group, statuses
ORDER BY status_group;
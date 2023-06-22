SELECT p.ID, p.START_DATE, p.FINISH_DATE, DATEDIFF('MONTH', p.START_DATE, p.FINISH_DATE) AS duration
FROM project p
WHERE DATEDIFF('MONTH', p.START_DATE, p.FINISH_DATE) = (
  SELECT MAX(duration)
  FROM (
    SELECT DATEDIFF('MONTH', p.START_DATE, p.FINISH_DATE) AS duration
    FROM project p
  ) AS durations
);

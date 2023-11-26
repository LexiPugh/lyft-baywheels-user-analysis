SELECT
  *
FROM
  ford.gobike
WHERE
  date_part('year', start_time) = '2020';
  
SELECT
  started_at,
  ended_at,
  start_station_name,
  end_station_name,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
FROM
  lyft.baywheels
UNION
SELECT
  start_time,
  end_time,
  start_station_name,
  end_station_name,
  start_station_latitude,
  start_station_longitude,
  end_station_latitude,
  end_station_longitude,
  user_type
FROM
  ford.gobike
WHERE
  date_part('year', start_time) = '2020';
  
SELECT
  started_at,
  ended_at,
  start_station_name,
  end_station_name,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual,
  'Lyft' AS data_source
FROM
  lyft.baywheels
UNION
SELECT
  start_time,
  end_time,
  start_station_name,
  end_station_name,
  start_station_latitude,
  start_station_longitude,
  end_station_latitude,
  end_station_longitude,
  user_type,
  'Ford' AS data_source
FROM
  ford.gobike
WHERE
  date_part('year', start_time) = '2020';
  
SELECT
  *,
  CASE
    WHEN member_casual = 'Customer' THEN 'casual'
    WHEN member_casual = 'Subscriber' THEN 'member'
    ELSE member_casual
  END AS member_type
FROM
  project.ford_lyft_analysis;

SELECT
  date,
  temperature_avg,
  precipitation,
  f*,
  CASE
    WHEN member_casual = 'Customer' THEN 'casual'
    WHEN member_casual = 'Subscriber' THEN 'member'
    ELSE member_casual
  END AS member_type
FROM
  project.ford_lyft_analysis AS f
  INNER JOIN sf.weather ON sf.weather.date = f.started_date;
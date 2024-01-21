--- Create a view with daily ride counts

CREATE VIEW v_daily_ride_counts AS
SELECT d.date_key,
    d.full_date,
    d.month_name,
    d.day,
    d.day_name,
    d.weekend,
    count(t.id) AS ride_totals,
    count(rd.user_type) filter (where rd.user_type = 'Subscriber') as subscriber_rides,
    count(rd.user_type) filter (where rd.user_type = 'Customer') AS customer_rides,
    count(rd.user_type) filter (where rd.user_type = 'Unknown')  unknown_rides,
    count(t.valid_duration) filter (where not t.valid_duration) AS late_return
   FROM trip t
     RIGHT JOIN date d ON t.date_key = d.date_key
     LEFT JOIN rider_demographics rd ON t.rider_demo_id = rd.id
  GROUP BY d.date_key
  ORDER BY d.date_key;


--- Create a view with daily weather data

CREATE VIEW v_daily_weather AS
SELECT
    drc.date_key,
    drc.full_date,
    drc.month_name,
    drc.day,
    drc.day_name,
    drc.ride_totals,
    SUM(drc.ride_totals) OVER (PARTITION BY drc.month_name ORDER BY drc.date_key) AS month_running_total,
    drc.subscriber_rides,
    drc.customer_rides,
    drc.unknown_rides,
    drc.late_return,
    drc.weekend,
    w.tmin,
    w.tavg,
    w.tmax,
    w.avg_wind,
    w.prcp,
    w.snow_amt,
    w.rain,
    w.snow
FROM
    v_daily_ride_counts drc
JOIN
    weather w ON drc.date_key = w.date_key
ORDER BY
    drc.date_key;


--- Create a view with rides returned after the limit

CREATE VIEW v_late_returns AS
SELECT
    t.full_date,
    t.id AS trip_id,
    t.trip_minutes,
    t.trip_hours,
    t.bike_id,
    s_start.station_name AS start_location,
    s_end.station_name AS end_location,
    rd.user_type
FROM
    trip t
JOIN
    date d ON t.date_key = d.date_key
JOIN
    rider_demographics rd ON t.rider_demo_id = rd.id
JOIN
    station s_start ON t.start_station_id = s_start.id
JOIN
    station s_end ON t.end_station_id = s_end.id
WHERE
    t.valid_duration = false;
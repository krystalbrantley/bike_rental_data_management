CREATE TABLE "date" (
  "date_key" integer PRIMARY KEY,
  "full_date" date,
  "month" integer,
  "day" integer,
  "month_name" varchar(10),
  "day_name" varchar(10),
  "weekend" boolean,
  "financial_qtr" integer
);

CREATE TABLE "trip" (
  "id" integer PRIMARY KEY,
  "trip_duration" integer,
  "start_time" timestamp,
  "stop_time" timestamp,
  "start_station_id" integer,
  "end_station_id" integer,
  "bike_id" integer,
  "trip_minutes" real,
  "trip_hours" real,
  "valid_duration" boolean,
  "date_key" integer,
  "rider_demo_id" integer
);

CREATE TABLE "rider_demographics" (
  "id" integer PRIMARY KEY,
  "user_type" varchar(50),
  "birth_year" integer,
  "gender" integer,
  "age" integer
);

CREATE TABLE "station" (
  "id" integer PRIMARY KEY,
  "station_name" varchar(50),
  "latitude" real,
  "longitude" real
);

CREATE TABLE "weather" (
  "id" integer PRIMARY KEY,
  "rec_date" date,
  "avg_wind" real,
  "prcp" real,
  "snow_amt" real,
  "snow_depth" real,
  "tavg" integer,
  "tmax" integer,
  "tmin" integer,
  "rain" boolean,
  "snow" boolean,
  "date_key" integer
);

ALTER TABLE "trip" ADD FOREIGN KEY ("rider_demo_id") REFERENCES "rider_demographics" ("id");

ALTER TABLE "trip" ADD FOREIGN KEY ("date_key") REFERENCES "date" ("date_key");

ALTER TABLE "trip" ADD FOREIGN KEY ("start_station_id") REFERENCES "station" ("id");

ALTER TABLE "trip" ADD FOREIGN KEY ("end_station_id") REFERENCES "station" ("id");

ALTER TABLE "weather" ADD FOREIGN KEY ("date_key") REFERENCES "date" ("date_key");

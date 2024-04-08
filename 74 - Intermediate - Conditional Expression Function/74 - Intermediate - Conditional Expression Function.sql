USE DATABASE FROSTYFRIDAY;

-- Creating table -- 

create or replace table dates (
    birthdate varchar
)
as
select * from values
    ('22/09/1968')
  , ('1968-09-22')
  , ('1968-09-22')
  , ('1968-09-22')
  , ('1968-09-22')
  , ('1968-09-22')
  , ('1968-09-22')
  , ('1968-09-22')
  , ('22/09/1968')
  , ('27/08/1985')
  , ('30/07/1967')
  , ('1985-08-27')
;

-- Solution -- 

create or replace view dates_formatted
as
select
    COALESCE(
        TRY_TO_DATE(BIRTHDATE, 'YYYY-MM-DD')
      , TRY_TO_DATE(BIRTHDATE, 'DD/MM/YYYY')
    ) as BIRTHDATE
from dates;

-- check -- 
select * from dates_formatted;

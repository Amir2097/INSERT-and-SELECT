select title, realease from album
where realease >= '01/01/2018' and realease <= '31/12/2018';

select title, duration from track
where duration = (select max(duration) from track);

select title, duration from track
where duration >= 3.5;

select title from collection
where realease >= '01/01/2018' and realease <= '31/12/2020';

select name from executor
where LENGTH(name) - LENGTH(REPLACE(name, ' ', ''))+1 = 1;

select title from track
where title like '%my%' or title like '%My%';


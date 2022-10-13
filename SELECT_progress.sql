-- количество исполнителей в каждом жанре
select genre_id, count(executor_id) from genresexecutors
group by genre_id
order by count(executor_id) desc;

-- количество треков, вошедших в альбомы 2019-2020 годов
select count(track_id) from track t
join album a on t.album_id = a.album_id
where a.realease >= '01/01/2019' and realease <= '31/12/2020';

-- средняя продолжительность треков по каждому альбому
select avg(duration), album_id  from track t
GROUP BY album_id
order by avg(duration) desc;

-- все исполнители, которые не выпустили альбомы в 2020 году
select name from executor e
join executorsalbums e2 on e.executor_id  = e2.executor_id
join album a on e2.album_id = a.album_id
where a.realease >= '01/01/2021' or a.realease <= '31/12/2019';

-- названия сборников, в которых присутствует конкретный исполнитель (выберите сами)
select c.title  from collection c
join trackscollections t  on c.collection_id  = t.collection_id 
join track t2  on t.track_id  = t2.track_id
join album a on t2.album_id  = a.album_id
join executorsalbums e on a.album_id = e.album_id
join executor e2 on e.executor_id = e2.executor_id
where e2.executor_id = 1;

-- название альбомов, в которых присутствуют исполнители более 1 жанра
select a.title  from album a
join executorsalbums e on a.album_id = e.album_id
join executor e2 on e.executor_id = e2.executor_id 
join genresexecutors g on e2.executor_id = g.executor_id 
join genre g2 on g.genre_id = g2.genre_id
group by a.title 
having count(g2.genre_id) > 1;

-- наименование треков, которые не входят в сборники
select t.title  from track t
full outer join trackscollections t2 on t.track_id = t2.track_id 
full outer join collection c on t2.collection_id = c.collection_id
where t2.track_id is null;

-- исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)
select e."name", t.duration from executor e 
join executorsalbums e2 on e.executor_id = e2.executor_id 
join album a on e2.album_id = a.album_id 
join track t on a.album_id = t.album_id
where t.duration = (select min(duration) from track);


-- название альбомов, содержащих наименьшее количество треков
select a2.title, count(t2.track_id) from album a2 
join track t2 on a2.album_id = t2.album_id 
group by a2.title
having count(t2.track_id) = (select min(x.tack_c) from (select count(t.track_id) as tack_c from track t 
join album a on t.album_id = a.album_id group by a.title) x);


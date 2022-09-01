select *from athlete_events;
select count(distinct games) from athlete_events ;
select distinct games,city, season from athlete_events order by games;
select *from athlete_events;
select games,count(distinct noc)as no_of_countries from athlete_events group by games order by games;
select games,count(distinct noc)as total_countries from athlete_events group by games order by total_countries limit 1;
with t1 as
(select games,count(distinct noc)as total_countries from athlete_events group by games),
t2 as 
(select min(total_countries),games from t1)
select* from t2;
select games ,count(distinct noc)as total_countries from athlete_events group by games order by total_countries desc limit 1;
with t1 as
(select games,count(distinct noc)as noc_count from athlete_events group by games),

t2 as
(select games, max(noc_count) from t1)
select *from t2;
with t1 as
(select count(distinct games)as game_count from athlete_events),
t2 as
(select distinct noc as noc ,games from athlete_events order by games),
t3 as
(select noc ,count(games)as noc_count from t2 group by noc order by games)
select *from t3 join t1 on
t1.game_count=t3.noc_count;
select distinct sport as sport,count( distinct games) as count from athlete_events group by sport order by count desc; 
with t1 as
(select count(distinct games)as summer_games from athlete_events where season='summer'),
t2 as
(select distinct sport,games from athlete_events where season='summer'),
t3 as
(select sport,count(games)as count from t2 group by sport)
select *from t3 join t1 on 
t1.summer_games=t3.count;
select distinct sport as sport,count( distinct games) as count from athlete_events group by sport order by count ;
 with t1 as
(select distinct sport as sport,(games) from athlete_events order by games),
 t2 as
 (select sport ,count(games)as count from t1  group by sport)
 select * from t2 where count=1;
 select count(distinct sport ),games from athlete_events group by games order by games;
 select *from athlete_events where age=(select max(age)from athlete_events where medal='gold');
 select max(age) from athlete_events where medal='gold';
 select *from athlete_events where medal='gold'and age=64;
 select *from athlete_events where medal='gold' order by age desc;
 select*from athlete_events;
 with t1 as
 (select count(medal)as medaal,games,noc,name from athlete_events where medal='gold'group by name order by medaal desc),
 t2 as
 (select *,dense_rank()over(order by medaal desc)as rank_medal from t1)
 select*from t2 where rank_medal between 1 and 5;
select *from athlete_events; 
 with t1 as
(select distinct name as dis_name,medals,games from athlete_events),
 t2 as
(select distinct name as dis_name ,count(medal)as medal_count,games from athlete_events group by dis_name order by games ),
t3 as
(select dis_name,medal_count,games from t2 group by games order by medal_count desc)
select* from t3;
with t1 as
(select distinct noc as country,count(medal)medal_count from athlete_events where medal='gold'group by country order by medal_count desc),
 t2 as
 (select distinct noc as country,count(medal)as silver_count from athlete_events where medal='silver' group by country order by silver_count desc),
 t3 as
  (select distinct noc as country,count(medal)as bronze_count from athlete_events where medal='bronze' group by country order by bronze_count desc)
select *from t1,t2,t3 order by medal_count desc;
select name,count(medal)as total_medal from athlete_events where medal ='gold' group by name order by total_medal desc;
select *from athlete_events where medal='gold';
with t1 as
    (select distinct name ,count(medal)as total_medal from athlete_events
    where medal='gold'group by name
    order by total_medal desc),
t2 as
    (select *,dense_rank ()over (order by total_medal desc )as rnk from t1)
    select *from t2 where rnk<=5;

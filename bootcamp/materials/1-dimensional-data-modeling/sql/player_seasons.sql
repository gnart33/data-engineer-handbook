CREATE TABLE public.player_seasons (
    player_name text NOT NULL,
    age integer,
    height text,
    weight integer,
    college text,
    country text,
    draft_year text,
    draft_round text,
    draft_number text,
    gp real,
    pts real,
    reb real,
    ast real,
    netrtg real,
    oreb_pct real,
    dreb_pct real,
    usg_pct real,
    ts_pct real,
    ast_pct real,
    season integer NOT NULL
);

--select * from public.player_seasons
--limit 10

--create type season_stats as (
--	season integer,
--	gp integer,
--	pts real,
--	reb real,
--	ast real
--)

--create table players (
--	player_name text,
--	height text,
--	college text,
--	country text,
--	draft_year text,
--	draft_round text,
--	draft_number text,
--	season_stats season_stats[],
--	current_season integer,
--	PRIMARY KEY(player_name, current_season)
--	
--)

--drop table players

--select min(season) from player_seasons -- 1996

with yesterday as (
	select * from players
	where current_season  = 1996
),

	today as (
	select * from player_seasons
	where season = 1997
)

select 
	coalesce(t.player_name, y.player_name) as player_name,
--	coalesce(t.height, y.height) as height,
--	coalesce(t.college, y.college) as college,
--	coalesce(t.country, y.country) as country,
--	coalesce(t.draft_year, y.draft_year) as draft_year,
--	coalesce(t.draft_round, y.draft_round) as draft_round,
--	coalesce(t.draft_number, y.draft_number) as draft_number,
	
	case when y.season_stats is null
		then array[row(
			t.season,
			t.gp,
			t.pts,
			t.reb,
			t.ast
		)::season_stats]
	when t.season is not null then y.season_stats || array[row(
			t.season,
			t.gp,
			t.pts,
			t.reb,
			t.ast
	)::season_stats]
	else y.season_stats
	end as season_stats,
	coalesce(t.season, y.current_season + 1) as current_season
	
from today t full outer join yesterday y
	on t.player_name = y.player_name
	
	
	
	
	
	

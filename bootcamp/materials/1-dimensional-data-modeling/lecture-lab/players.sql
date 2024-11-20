

--  CREATE TYPE season_stats AS (
--                          season Integer,
--                          pts REAL,
--                          ast REAL,
--                          reb REAL,
--                          weight INTEGER
--                        );
--  CREATE TYPE scoring_class AS
--      ENUM ('bad', 'average', 'good', 'star');


--  CREATE TABLE players (
--      player_name TEXT,
--      height TEXT,
--      college TEXT,
--      country TEXT,
--      draft_year TEXT,
--      draft_round TEXT,
--      draft_number TEXT,
--      seasons season_stats[],
--      scorer_class scoring_class,
--      years_since_last_active INTEGER,
--      is_active BOOLEAN,
--      current_season INTEGER,
--      PRIMARY KEY (player_name, current_season)
--  );

--  with yesterday as (
-- 	select * from players
-- 	where current_season  = 1996
-- ),

-- 	today as (
-- 	select * from player_seasons
-- 	where season = 1997
-- )

-- select 
-- 	coalesce(t.player_name, y.player_name) as player_name,
-- 	coalesce(t.height, y.height) as height,
-- 	coalesce(t.college, y.college) as college,
-- 	coalesce(t.country, y.country) as country,
-- 	coalesce(t.draft_year, y.draft_year) as draft_year,
-- 	coalesce(t.draft_round, y.draft_round) as draft_round,
-- 	coalesce(t.draft_number, y.draft_number) as draft_number,
	
-- 	case when y.season_stats is null
-- 		then array[row(
-- 			t.season,
-- 			t.gp,
-- 			t.pts,      
-- 			t.reb,
-- 			t.ast
-- 		)::season_stats]
-- 	when t.season is not null then y.season_stats || array[row(
-- 			t.season,
-- 			t.gp,
-- 			t.pts,
-- 			t.reb,
-- 			t.ast
-- 	)::season_stats]
-- 	else y.season_stats
-- 	end as season_stats,
-- 	coalesce(t.season, y.current_season + 1) as current_season
	
-- from today t full outer join yesterday y
-- 	on t.player_name = y.player_name




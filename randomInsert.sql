WITH params AS (
    SELECT (COUNT(*) - 1) * 1 AS total
	--SELECT 7 AS total
    FROM teams_tournaments
    WHERE tournament_id = 295
),
rand AS (
    SELECT
        t.id,
        p.total,
        floor(random() * (p.total + 1))::int AS r1,
        floor(random() * (p.total + 1))::int AS r2,
        p.total * 6 AS goals_sum
    FROM teams_tournaments t, params p
    WHERE t.tournament_id = 295
),
rand2 AS (
    SELECT
        r.*,
        floor(random() * (r.goals_sum + 1))::int AS gf
    FROM rand r
)
UPDATE teams_tournaments t
SET
    games         = r.total,
    wins          = least(r.r1, r.r2),
    ties          = abs(r.r1 - r.r2),
    losts         = r.total - greatest(r.r1, r.r2),
    goals_for     = r.gf,
    goals_against = r.goals_sum - r.gf
FROM rand2 r
WHERE t.id = r.id;

UPDATE players_tournaments pt
SET
    games = COALESCE(tt.games, 0),
    goals = CASE
        WHEN p.player_order = 1 
            THEN floor(random() * (COALESCE(tt.games, 0) + 1))::int2
        ELSE 
            (floor(random() * (COALESCE(tt.games, 0) + 1)) * floor(random() * 4))::int2
    END
FROM teams_tournaments tt, players p
WHERE pt.teams_tournament_id = tt.id
  AND pt.player_id = p.id
  AND tt.tournament_id = 294;

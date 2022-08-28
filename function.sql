-- number of tournaments by player ID
CREATE FUNCTION number_of_tournaments_by_player_id(select_player_id INTEGER, 
OUT name VARCHAR, OUT number_of_tournaments BIGINT) AS
$$
SELECT first_name||' '||last_name AS player, COUNT(*) AS team FROM players_tournaments
	INNER JOIN players ON players_tournaments.player_id = players.id
GROUP BY (first_name, last_name, player_id)
HAVING player_id = select_player_id
$$
LANGUAGE SQL;

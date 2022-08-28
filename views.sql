-- defenders of all time by goals
CREATE VIEW defenders_of_all_time_by_goals AS
SELECT player_position, first_name, last_name, SUM(goals) 
FROM players_tournaments 
	INNER JOIN players ON players_tournaments.player_id = players.id
GROUP BY player_id, player_position, first_name, last_name HAVING players.player_position = 'D'
ORDER BY sum DESC;

-- forwards of all time by goals
CREATE VIEW forwards_of_all_time_by_goals AS
SELECT player_position, first_name, last_name, SUM(goals) 
FROM players_tournaments 
	INNER JOIN players ON players_tournaments.player_id = players.id
GROUP BY player_id, player_position, first_name, last_name 
HAVING players.player_position != 'G' AND players.player_position != 'D'
ORDER BY sum DESC;

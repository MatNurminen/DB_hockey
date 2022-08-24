-- Roster NHL 2012 year
SELECT players_tournaments.id, players.player_position, players.first_name, players.last_name, nations.name,
      teams.full_name, leagues.name
      FROM players_tournaments
      INNER JOIN players ON (players_tournaments.player_id = players.id)
      INNER JOIN teams_tournaments ON (players_tournaments.teams_tournament_id = teams_tournaments.id)
	  INNER JOIN tournaments ON (teams_tournaments.tournament_id = tournaments.id)
      INNER JOIN leagues ON (tournaments.league_id = leagues.id)
      INNER JOIN nations ON (players.nation_id = nations.id)
	  INNER JOIN teams ON (teams_tournaments.team_id = teams.id)
WHERE tournaments.season_id = 2012 AND tournaments.league_id = 14
ORDER BY full_name, player_order;

-- Top 10 scorers of all time
SELECT player_position, first_name, last_name, SUM(goals) 
FROM players_tournaments 
	INNER JOIN players ON players_tournaments.player_id = players.id
GROUP BY player_id, player_position, first_name, last_name HAVING players.player_position != 'G'
ORDER BY sum DESC LIMIT 10;

ALTER TABLE tournaments 
ADD CONSTRAINT unique_season_id_league_id UNIQUE(season_id, league_id);

ALTER TABLE teams_tournaments 
ADD CONSTRAINT unique_tournament_id_team_id UNIQUE(tournament_id, team_id);



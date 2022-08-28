-- Таблица league_logos
ALTER TABLE league_logos
ADD CONSTRAINT league_logos_league_id_fk
FOREIGN KEY (league_id)
REFERENCES leagues (id)
ON DELETE CASCADE;

-- Таблица team_logos
ALTER TABLE team_logos
ADD CONSTRAINT team_logos_team_id_fk
FOREIGN KEY (team_id)
REFERENCES teams (id)
ON DELETE CASCADE;

-- Таблица players
ALTER TABLE players
ADD CONSTRAINT players_draft_team_id_fk
FOREIGN KEY (draft_team_id)
REFERENCES teams (id)
ON DELETE SET NULL;
ALTER TABLE players
ADD CONSTRAINT players_nation_id_fk
FOREIGN KEY (nation_id)
REFERENCES nations (id)
ON DELETE RESTRICT;

-- Таблица tournaments
ALTER TABLE tournaments
ADD CONSTRAINT tournaments_league_id_fk
FOREIGN KEY (league_id)
REFERENCES leagues (id)
ON DELETE RESTRICT;
ALTER TABLE tournaments
ADD CONSTRAINT tournaments_season_id_fk
FOREIGN KEY (season_id)
REFERENCES seasons (id)
ON DELETE RESTRICT;

-- Таблица teams
ALTER TABLE teams
ADD CONSTRAINT teams_nation_id_fk
FOREIGN KEY (nation_id)
REFERENCES nations (id)
ON DELETE RESTRICT;

-- Таблица teams_tournaments
ALTER TABLE teams_tournaments
ADD CONSTRAINT teams_tournaments_tournament_id_fk
FOREIGN KEY (tournament_id)
REFERENCES tournaments (id)
ON DELETE CASCADE;
ALTER TABLE teams_tournaments
ADD CONSTRAINT teams_tournaments_team_id_fk
FOREIGN KEY (team_id)
REFERENCES teams (id)
ON DELETE RESTRICT;

-- Таблица players_tournaments
ALTER TABLE players_tournaments
ADD CONSTRAINT players_tournaments_teams_tournament_id_fk
FOREIGN KEY (teams_tournament_id)
REFERENCES teams_tournaments (id)
ON DELETE CASCADE;
ALTER TABLE players_tournaments
ADD CONSTRAINT players_tournaments_player_id_fk
FOREIGN KEY (player_id)
REFERENCES players (id)
ON DELETE RESTRICT;

CREATE INDEX leagues_type_id_fk ON leagues(type_id);
CREATE INDEX teams_nation_id_fk ON teams(nation_id);
CREATE INDEX players_draft_team_id_fk ON players(draft_team_id);
CREATE INDEX players_nation_id_fk ON players(nation_id);

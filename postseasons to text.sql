ALTER TABLE players_tournaments 
  ALTER COLUMN postseason TYPE text;

ALTER TABLE teams_tournaments 
    ALTER COLUMN postseason TYPE text;

ALTER TABLE teams_tournaments 
    ALTER COLUMN postseason DROP DEFAULT;

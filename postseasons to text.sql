ALTER TABLE public.players_tournaments 
  ALTER COLUMN postseason TYPE text;

ALTER TABLE public.teams_tournaments 
    ALTER COLUMN postseason TYPE text;

ALTER TABLE public.teams_tournaments 
    ALTER COLUMN postseason DROP DEFAULT;

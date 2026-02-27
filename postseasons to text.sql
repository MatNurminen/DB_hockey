BEGIN;
DROP VIEW public.players_all_tournaments;

ALTER TABLE public.players_tournaments 
    ALTER COLUMN postseason TYPE text;

ALTER TABLE public.teams_tournaments 
    ALTER COLUMN postseason TYPE text;

ALTER TABLE public.teams_tournaments 
    ALTER COLUMN postseason DROP DEFAULT;

CREATE VIEW public.players_all_tournaments AS
 SELECT players_tournaments.id,
    teams_tournaments.team_id,
    players_tournaments.player_id,
    players_tournaments.games,
    players_tournaments.goals,
    players_tournaments.postseason,
    seasons.id AS season,
    tournaments.league_id
   FROM ((((public.players_tournaments
     JOIN public.teams_tournaments ON ((players_tournaments.teams_tournament_id = teams_tournaments.id)))
     JOIN public.tournaments ON ((teams_tournaments.tournament_id = tournaments.id)))
     JOIN public.seasons ON ((tournaments.season_id = seasons.id)))
     JOIN public.leagues ON ((tournaments.league_id = leagues.id)));

COMMIT;

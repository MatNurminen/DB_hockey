--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: team_logos; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.team_logos (
    id integer NOT NULL,
    team_id integer NOT NULL,
    start_year smallint NOT NULL,
    end_year smallint,
    logo character varying(120) NOT NULL
);


ALTER TABLE public.team_logos OWNER TO gb_user;

--
-- Name: club_logos_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.club_logos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.club_logos_id_seq OWNER TO gb_user;

--
-- Name: club_logos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.club_logos_id_seq OWNED BY public.team_logos.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.teams (
    id integer NOT NULL,
    full_name character varying(120) NOT NULL,
    name character varying(50) NOT NULL,
    short_name character varying(5) NOT NULL,
    nation_id integer
);


ALTER TABLE public.teams OWNER TO gb_user;

--
-- Name: clubs_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.clubs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clubs_id_seq OWNER TO gb_user;

--
-- Name: clubs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.clubs_id_seq OWNED BY public.teams.id;


--
-- Name: nations; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.nations (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    short_name character varying(5) NOT NULL,
    flag character varying(120) NOT NULL,
    logo character varying(120) NOT NULL
);


ALTER TABLE public.nations OWNER TO gb_user;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO gb_user;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.nations.id;


--
-- Name: league_logos; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.league_logos (
    id integer NOT NULL,
    league_id integer NOT NULL,
    start_year smallint NOT NULL,
    end_year smallint,
    logo character varying(120) NOT NULL
);


ALTER TABLE public.league_logos OWNER TO gb_user;

--
-- Name: league_logos_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.league_logos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.league_logos_id_seq OWNER TO gb_user;

--
-- Name: league_logos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.league_logos_id_seq OWNED BY public.league_logos.id;


--
-- Name: leagues; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.leagues (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    short_name character varying(5) NOT NULL,
    start_year smallint NOT NULL,
    end_year smallint,
    color character varying(50),
    is_local boolean DEFAULT false
);


ALTER TABLE public.leagues OWNER TO gb_user;

--
-- Name: leagues_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.leagues_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leagues_id_seq OWNER TO gb_user;

--
-- Name: leagues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.leagues_id_seq OWNED BY public.leagues.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.players (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    jersey_number smallint NOT NULL,
    player_position character varying(5) NOT NULL,
    player_order smallint NOT NULL,
    nation_id integer NOT NULL,
    birth_year smallint NOT NULL,
    height smallint,
    weight smallint,
    draft_team_id integer,
    start_year smallint NOT NULL,
    end_year smallint
);


ALTER TABLE public.players OWNER TO gb_user;

--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_id_seq OWNER TO gb_user;

--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;


--
-- Name: players_tournaments; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.players_tournaments (
    teams_tournament_id integer NOT NULL,
    player_id integer NOT NULL,
    games smallint,
    goals smallint,
    postseason character varying(250)
);


ALTER TABLE public.players_tournaments OWNER TO gb_user;

--
-- Name: seasons; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.seasons (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    start_year smallint NOT NULL
);


ALTER TABLE public.seasons OWNER TO gb_user;

--
-- Name: seasons_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.seasons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seasons_id_seq OWNER TO gb_user;

--
-- Name: seasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.seasons_id_seq OWNED BY public.seasons.id;


--
-- Name: teams_tournaments; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.teams_tournaments (
    id integer NOT NULL,
    tournament_id integer NOT NULL,
    team_id integer NOT NULL,
    games smallint,
    wings smallint,
    ties smallint,
    losts smallint,
    goals_for smallint,
    goals_against smallint,
    postseason character varying(250)
);


ALTER TABLE public.teams_tournaments OWNER TO gb_user;

--
-- Name: teams_tournaments_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.teams_tournaments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_tournaments_id_seq OWNER TO gb_user;

--
-- Name: teams_tournaments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.teams_tournaments_id_seq OWNED BY public.teams_tournaments.id;


--
-- Name: tournaments; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.tournaments (
    id integer NOT NULL,
    season_id integer NOT NULL,
    league_id integer NOT NULL
);


ALTER TABLE public.tournaments OWNER TO gb_user;

--
-- Name: tournaments_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.tournaments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tournaments_id_seq OWNER TO gb_user;

--
-- Name: tournaments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.tournaments_id_seq OWNED BY public.tournaments.id;


--
-- Name: league_logos id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.league_logos ALTER COLUMN id SET DEFAULT nextval('public.league_logos_id_seq'::regclass);


--
-- Name: leagues id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.leagues ALTER COLUMN id SET DEFAULT nextval('public.leagues_id_seq'::regclass);


--
-- Name: nations id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.nations ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: players id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- Name: seasons id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.seasons ALTER COLUMN id SET DEFAULT nextval('public.seasons_id_seq'::regclass);


--
-- Name: team_logos id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.team_logos ALTER COLUMN id SET DEFAULT nextval('public.club_logos_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.clubs_id_seq'::regclass);


--
-- Name: teams_tournaments id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.teams_tournaments ALTER COLUMN id SET DEFAULT nextval('public.teams_tournaments_id_seq'::regclass);


--
-- Name: tournaments id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tournaments ALTER COLUMN id SET DEFAULT nextval('public.tournaments_id_seq'::regclass);


--
-- Data for Name: league_logos; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.league_logos (id, league_id, start_year, end_year, logo) FROM stdin;
\.


--
-- Data for Name: leagues; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.leagues (id, name, short_name, start_year, end_year, color, is_local) FROM stdin;
\.


--
-- Data for Name: nations; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.nations (id, name, short_name, flag, logo) FROM stdin;
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.players (id, first_name, last_name, jersey_number, player_position, player_order, nation_id, birth_year, height, weight, draft_team_id, start_year, end_year) FROM stdin;
\.


--
-- Data for Name: players_tournaments; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.players_tournaments (teams_tournament_id, player_id, games, goals, postseason) FROM stdin;
\.


--
-- Data for Name: seasons; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.seasons (id, name, start_year) FROM stdin;
\.


--
-- Data for Name: team_logos; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.team_logos (id, team_id, start_year, end_year, logo) FROM stdin;
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.teams (id, full_name, name, short_name, nation_id) FROM stdin;
\.


--
-- Data for Name: teams_tournaments; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.teams_tournaments (id, tournament_id, team_id, games, wings, ties, losts, goals_for, goals_against, postseason) FROM stdin;
\.


--
-- Data for Name: tournaments; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.tournaments (id, season_id, league_id) FROM stdin;
\.


--
-- Name: club_logos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.club_logos_id_seq', 1, false);


--
-- Name: clubs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.clubs_id_seq', 1, false);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.countries_id_seq', 1, false);


--
-- Name: league_logos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.league_logos_id_seq', 1, false);


--
-- Name: leagues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.leagues_id_seq', 1, false);


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.players_id_seq', 1, false);


--
-- Name: seasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.seasons_id_seq', 1, false);


--
-- Name: teams_tournaments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.teams_tournaments_id_seq', 1, false);


--
-- Name: tournaments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.tournaments_id_seq', 1, false);


--
-- Name: team_logos club_logos_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.team_logos
    ADD CONSTRAINT club_logos_pkey PRIMARY KEY (id);


--
-- Name: teams clubs_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT clubs_pkey PRIMARY KEY (id);


--
-- Name: nations countries_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.nations
    ADD CONSTRAINT countries_name_key UNIQUE (name);


--
-- Name: nations countries_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.nations
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: nations countries_short_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.nations
    ADD CONSTRAINT countries_short_name_key UNIQUE (short_name);


--
-- Name: league_logos league_logos_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.league_logos
    ADD CONSTRAINT league_logos_pkey PRIMARY KEY (id);


--
-- Name: leagues leagues_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.leagues
    ADD CONSTRAINT leagues_name_key UNIQUE (name);


--
-- Name: leagues leagues_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.leagues
    ADD CONSTRAINT leagues_pkey PRIMARY KEY (id);


--
-- Name: leagues leagues_short_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.leagues
    ADD CONSTRAINT leagues_short_name_key UNIQUE (short_name);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: seasons seasons_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.seasons
    ADD CONSTRAINT seasons_pkey PRIMARY KEY (id);


--
-- Name: teams_tournaments teams_tournaments_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.teams_tournaments
    ADD CONSTRAINT teams_tournaments_pkey PRIMARY KEY (id);


--
-- Name: tournaments tournaments_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tournaments
    ADD CONSTRAINT tournaments_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


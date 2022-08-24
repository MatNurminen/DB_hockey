--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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

--
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


--
-- Name: champ_champ_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.champ_champ_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.champ_champ_id_seq OWNER TO gb_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

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
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
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
    short_name character varying(10) NOT NULL,
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
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.leagues_id_seq OWNER TO gb_user;

--
-- Name: leagues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.leagues_id_seq OWNED BY public.leagues.id;


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
-- Name: nations_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.nations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.nations_id_seq OWNER TO gb_user;

--
-- Name: nations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.nations_id_seq OWNED BY public.nations.id;


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
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
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
    id integer NOT NULL,
    teams_tournament_id integer NOT NULL,
    player_id integer NOT NULL,
    games smallint,
    goals smallint,
    postseason character varying(250)
);


ALTER TABLE public.players_tournaments OWNER TO gb_user;

--
-- Name: players_tournaments_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.players_tournaments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.players_tournaments_id_seq OWNER TO gb_user;

--
-- Name: players_tournaments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.players_tournaments_id_seq OWNED BY public.players_tournaments.id;


--
-- Name: season_season_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.season_season_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.season_season_id_seq OWNER TO gb_user;

--
-- Name: seasons; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.seasons (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.seasons OWNER TO gb_user;

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
-- Name: team_logos_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.team_logos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.team_logos_id_seq OWNER TO gb_user;

--
-- Name: team_logos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.team_logos_id_seq OWNED BY public.team_logos.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.teams (
    id integer NOT NULL,
    nation_id integer NOT NULL,
    full_name character varying(120) NOT NULL,
    name character varying(50) NOT NULL,
    short_name character varying(5) NOT NULL,
    start_year smallint NOT NULL,
    end_year smallint
);


ALTER TABLE public.teams OWNER TO gb_user;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO gb_user;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- Name: teams_tournaments; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.teams_tournaments (
    id integer NOT NULL,
    tournament_id integer NOT NULL,
    team_id integer NOT NULL,
    games smallint,
    wins smallint,
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
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
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
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.tournaments_id_seq OWNER TO gb_user;

--
-- Name: tournaments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.tournaments_id_seq OWNED BY public.tournaments.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO gb_user;

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

ALTER TABLE ONLY public.nations ALTER COLUMN id SET DEFAULT nextval('public.nations_id_seq'::regclass);


--
-- Name: players id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- Name: players_tournaments id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.players_tournaments ALTER COLUMN id SET DEFAULT nextval('public.players_tournaments_id_seq'::regclass);


--
-- Name: team_logos id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.team_logos ALTER COLUMN id SET DEFAULT nextval('public.team_logos_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


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
2	2	2012	\N	/img/liiga/logo.png
4	4	2012	\N	/img/cze/LOGO.png
3	3	2012	\N	/img/shl/logo.png
16	16	2016	\N	/img/alp/LOGO.png
7	7	2012	\N	/img/ita/logo.png
6	6	2012	\N	/img/fra/logo.png
8	8	2012	\N	/img/ebel/LOGO.png
1	1	2012	2015	/img/khl/khl.png
17	1	2016	\N	/img/khl/khl16.png
15	15	2012	\N	/img/ahl/logo.png
13	13	2012	\N	/img/den/LOGO.png
10	10	2012	\N	/img/nor/LOGO.png
14	14	2012	\N	/img/nhl/logo.png
12	12	2012	\N	/img/ocb/LOGO.png
11	11	2012	\N	/img/svk/LOGO.gif
9	9	2012	\N	/img/nla/LOGO.png
5	5	2012	\N	/img/del/logo.png
\.


--
-- Data for Name: leagues; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.leagues (id, name, short_name, start_year, end_year, color, is_local) FROM stdin;
1	Kontinental Hockey League	KHL	2012	\N	\N	t
2	Liiga	Liiga	2012	\N	\N	t
3	Swedish Hockey League	SHL	2012	\N	\N	t
4	Tipsport Extraliga	CZE	2012	\N	\N	t
5	Deutsche Eishockey Liga	DEL	2012	\N	\N	t
6	Ligue Magnus	FRA	2012	\N	\N	t
9	National League	NLA	2012	\N	\N	t
10	Get Ligaen	NOR	2012	\N	\N	t
11	Tipsport Liga	SVK	2012	\N	\N	t
12	Open Championship Belarus	OCB	2012	\N	\N	t
13	Metal Ligaen	DEN	2012	\N	\N	t
14	National Hockey League	NHL	2012	\N	\N	t
15	American Hockey League	AHL	2012	\N	\N	t
16	Alps Hockey League	AlpsHL	2016	\N	\N	t
8	ICE Hockey League	ICEHL	2012	\N	\N	t
7	Serie A	ITA	2012	2015	\N	t
\.


--
-- Data for Name: nations; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.nations (id, name, short_name, flag, logo) FROM stdin;
2	Belarus	BLR	/img/flags/blr.svg	/img/jerseys/blr.png
1	Austria	AUT	/img/flags/aus.svg	/img/jerseys/aut.png
5	Canada	CAN	/img/flags/can.svg	/img/jerseys/can.png
4	Denmark	DEN	/img/flags/den.svg	/img/jerseys/den.png
7	Finland	FIN	/img/flags/fin.svg	/img/jerseys/fin.png
8	France	FRA	/img/flags/fra.svg	/img/jerseys/fra.png
3	Germany	GER	/img/flags/ger.svg	/img/jerseys/ger.png
11	Latvia	LAT	/img/flags/lat.svg	/img/jerseys/lat.png
12	Norway	NOR	/img/flags/nor.svg	/img/jerseys/nor.png
13	Russia	RUS	/img/flags/rus.svg	/img/jerseys/rus.png
10	Kazakhstan	KAZ	/img/flags/kaz.svg	/img/jerseys/kaz.png
14	Slovakia	SVK	/img/flags/svk.svg	/img/jerseys/slo.png
15	Sweden	SWE	/img/flags/swe.svg	/img/jerseys/swe.png
16	Switzerland	SUI	/img/flags/swi.svg	/img/jerseys/swi.png
17	Ukraine	UKR	/img/flags/ukr.svg	/img/jerseys/ukr.png
18	USA	USA	/img/flags/usa.svg	/img/jerseys/usa.png
9	Italy	ITA	/img/flags/ita.svg	/img/jerseys/ita.png
6	Czech Rep.	CZE	/img/flags/cze.svg	/img/jerseys/cze.png
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.players (id, first_name, last_name, jersey_number, player_position, player_order, nation_id, birth_year, height, weight, draft_team_id, start_year, end_year) FROM stdin;
4179	Bob	Essensa	30	G	1	5	1965	180	83	\N	2011	2011
4897	Alexei	Yashin	19	C	3	13	1973	190	98	\N	2011	2011
4404	Robert	Holik	18	C	3	6	1971	190	100	\N	2011	2011
5618	Ray	Emery	1	G	1	5	1982	188	89	\N	2011	2011
4178	Jason	Arnott	7	C	3	5	1974	190	90	\N	2011	2011
4177	Jason	Allison	41	C	3	5	1975	191	87	\N	2011	2011
4532	Jere	Lehtinen	26	R	3	7	1973	180	82	\N	2011	2011
5550	Mark	Parrish	27	R	3	18	1977	\N	\N	\N	2011	2011
4896	Vitali	Yachmenev	43	L	3	13	1975	177	81	\N	2011	2011
4894	Dmitry	Yushkevich	7	D	2	13	1971	180	85	\N	2011	2011
4429	Petr	Sykora	37	C	3	6	1978	192	88	\N	2011	2018
5127	Mats	Sundin	19	C	3	15	1971	193	93	\N	2011	2011
5649	Simon	Schütz	97	D	2	3	1997	179	83	\N	2019	\N
4564	Marko	Jantunen	14	R	3	7	1971	181	90	\N	2011	2011
4101	Eric	Lindros	88	C	3	5	1973	193	107	\N	2011	2011
4653	Francois	Rozenthal	11	C	3	8	1975	177	75	\N	2011	2011
5426	Tommy	Jakobsen	4	D	2	12	1970	173	83	\N	2011	2012
5142	Anders	Eriksson	5	D	2	15	1975	190	99	\N	2011	2011
5148	Kalle	Johansson	6	D	2	15	1967	180	93	\N	2011	2011
5395	Mathis	Olimb	46	C	3	12	1986	179	81	\N	2012	\N
4895	Andrei	Yakhanov	3	D	2	13	1973	183	83	\N	2011	2011
5146	Andreas	Johansson	20	L	3	15	1973	178	89	\N	2011	2011
5254	Pauli	Jaks	1	G	1	16	1972	184	84	\N	2011	2011
5128	Niklas	Sundström	24	C	3	15	1975	183	83	\N	2011	2012
4111	Dean	McAmmond	37	C	3	5	1973	179	83	\N	2011	2011
4563	Petri	Engman	1	G	1	7	1975	189	85	\N	2011	2011
4104	Daymond	Langkow	18	C	3	5	1976	178	77	\N	2011	2011
5132	Peter	Forsberg	21	C	3	15	1973	180	86	\N	2011	2011
4654	Jonathan	Zwikel	42	C	3	8	1975	183	88	\N	2011	2011
3842	Andrei	Stas	26	C	3	2	1988	187	83	\N	2012	\N
5361	Giovanni	Morini	23	C	3	9	1995	187	87	\N	2015	\N
4826	Alexei	Ivashkin	1	G	1	13	1969	178	87	\N	2011	2011
5125	Tommy	Söderström	30	G	1	15	1969	175	74	\N	2011	2011
5123	Tommy	Salo	35	G	1	15	1971	180	73	\N	2011	2011
4109	Jamie	McLennan	1	G	1	5	1971	183	86	\N	2011	2011
4310	Jakub	Stepanek	33	G	1	6	1986	187	71	\N	2012	\N
4438	Alexander	Salak	53	G	1	6	1987	188	86	\N	2012	\N
5201	Niclas	Bergfors	18	L	3	15	1987	179	88	84	2012	\N
5175	Andreas	Englund	39	D	2	15	1996	191	90	87	2016	\N
3760	Philippe	Horsky	16	C	3	1	1983	188	90	\N	2011	2011
4611	Mikko	Lehtonen	13	R	3	7	1987	193	93	79	2012	\N
5585	Phil	Kessel	81	R	3	18	1987	180	82	79	2012	\N
5214	Oliver	Ekman-Larsson	3	D	2	15	1991	188	82	133	2011	\N
4021	Max	Domi	16	L	3	5	1995	175	84	133	2015	\N
4282	Jake	Allen	34	G	1	5	1990	188	79	107	2012	\N
5562	T.J.	Oshie	74	R	3	18	1986	178	77	107	2012	\N
4493	Juhamatti	Aaltonen	71	L	3	7	1985	184	89	107	2011	\N
4492	Niko	Mikkola	7	D	2	7	1996	194	89	107	2016	\N
4315	Dmitrij	Jaskin	26	R	3	6	1993	190	90	107	2013	\N
4614	Jori	Lehterä	21	C	3	7	1987	188	91	107	2012	\N
5063	Jonas	Junland	44	D	2	15	1987	188	90	107	2012	\N
4333	Marek	Schwarz	40	G	1	6	1986	183	86	107	2012	\N
4619	Miro	Aaltonen	15	C	3	7	1993	179	78	94	2013	\N
5586	Bobby	Ryan	9	R	3	18	1987	188	96	94	2012	\N
5135	Michael	Holmqvist	24	C	3	15	1979	\N	\N	94	2011	2014
4601	Jesse	Puljujärvi	9	R	3	7	1998	190	89	101	2015	\N
4405	Roman	Horak	51	C	3	6	1991	182	78	86	2012	\N
5564	Alex	Tuch	89	R	3	18	1996	193	100	103	2017	\N
5582	Jimmy	Hayes	12	R	3	18	1989	198	100	91	2013	2018
4002	Luke	Schenn	22	D	2	5	1989	188	95	91	2012	\N
4627	Leo	Komarov	87	C	3	7	1987	180	92	91	2011	\N
4231	Stefan	Elliott	46	D	2	5	1991	185	86	97	2013	\N
5484	Kevin	Shattenkirk	22	D	2	18	1989	180	87	97	2012	\N
4595	Mikko	Rantanen	96	R	3	7	1996	192	98	97	2015	\N
4399	Petr	Franek	31	G	1	6	1975	187	88	97	2011	2013
4583	Eetu	Luostarinen	21	R	3	7	1998	190	81	81	2018	\N
3862	Maximilian	Englbrecht	25	G	1	3	1990	188	86	\N	2012	\N
3846	Sergei	Stepanov	71	G	1	2	1993	190	94	\N	2014	\N
5190	Albin	Eriksson	37	R	3	15	2000	193	94	85	2018	\N
4620	Niclas	Lucenius	63	C	3	7	1989	183	92	93	2014	\N
5156	Gabriel	Karlsson	23	C	3	15	1980	185	90	99	2011	2013
4609	Perttu	Lindgren	34	C	3	7	1987	184	85	99	2012	\N
5147	Daniel	Johansson	3	D	2	15	1974	188	88	102	2011	2011
4291	Brayden	Schenn	10	C	3	5	1991	185	86	102	2012	\N
4500	Joonas	Nättinen	29	C	3	7	1991	188	82	83	2013	\N
5431	Jarl Espen	Ygranes	14	D	2	12	1979	187	87	83	2011	2011
4041	Ryan	White	53	C	3	5	1988	180	90	83	2012	2019
5600	Craig	Smith	15	C	3	18	1989	183	89	104	2012	\N
4465	Marek	Mazanec	2	G	1	6	1991	192	81	104	2012	\N
5590	Colin	Wilson	33	C	3	18	1989	185	93	104	2012	2019
4336	Jan	Alinc	11	C	3	6	1972	182	80	89	2011	2017
5592	Derek	Stepan	21	C	3	18	1990	183	76	86	2012	\N
4958	Jaroslav	Janus	2	G	1	14	1989	183	83	90	2013	\N
5588	Patrick	Kane	88	R	3	18	1988	180	81	96	2012	\N
3755	Bernhard	Starkbaum	29	G	1	1	1986	178	85	\N	2012	\N
4700	Koba	Jass	25	L	3	11	1990	183	87	\N	2012	0
5389	Jørgen	Hanneborg	31	G	1	12	1999	186	80	\N	2018	\N
3898	Robert	Müller	80	G	1	3	1980	172	74	\N	2011	2011
4899	Yevgeni	Nabokov	35	G	1	13	1975	183	90	\N	2011	2014
5149	Patrik	Haltia	32	G	1	15	1973	\N	\N	\N	2011	2011
3805	David	Kickert	30	G	1	1	1994	188	76	\N	2014	\N
3841	Mikhail	Karnaukhov	69	G	1	2	1994	186	92	\N	2016	\N
3916	Mathias	Niederberger	35	G	1	3	1992	180	79	\N	2016	\N
3915	Mirko	Pantkowski	30	G	1	3	1998	183	75	\N	2017	\N
4441	Josef	Korenar	32	G	1	6	1998	186	84	\N	2018	\N
4857	Maxim	Mikhailovsky	30	G	1	13	1969	178	77	\N	2011	2011
4883	Andrei	Trefilov	20	G	1	13	1969	183	82	\N	2011	2011
4971	Jan	Varholik	6	D	2	14	1970	180	80	\N	2011	2011
4175	Corey	Schwab	30	G	1	5	1970	180	81	\N	2011	2011
4939	Branislav	Konrad	42	G	1	14	1987	188	77	\N	2012	\N
5620	Yaroslav	Askarov	30	G	1	13	2002	190	80	104	2019	0
4413	Jaromir	Jagr	11	R	3	6	1972	188	94	89	2011	0
4860	Ildar	Mukhometov	29	G	1	13	1972	181	85	\N	2011	2011
4869	Yegor	Podomatsky	31	G	1	13	1976	177	79	\N	2011	2011
4886	Nikolai	Khabibulin	35	G	1	13	1973	185	80	\N	2011	2013
5033	Marek	Ciliak	1	G	1	14	1990	189	87	\N	2015	\N
4174	Patrick	Charbonneau	1	G	1	5	1975	\N	\N	\N	2011	2011
4984	Stanislav	Petrik	1	G	1	14	1977	\N	\N	\N	2011	2011
4247	Josh	Harding	37	G	1	5	1984	185	83	\N	2011	2014
4644	Gaetan	Richard	38	G	1	8	1999	183	74	\N	2018	\N
5342	Günther	Hell	35	G	1	9	1978	177	76	\N	2011	2014
4621	Antti	Raanta	31	G	1	7	1989	183	85	\N	2014	\N
4575	Kari	Lehtonen	32	G	1	7	1983	191	84	\N	2011	2017
5368	Pavel	Poluektov	1	G	1	10	1992	181	82	\N	2015	\N
5239	Marcel	Jenni	9	L	3	16	1974	190	92	\N	2011	2014
3905	Timo	Pielmeier	51	G	1	3	1989	183	82	106	2014	\N
5184	Linus	Ullmark	30	G	1	15	1993	191	90	80	2013	\N
5472	Ryan	Miller	39	G	1	18	1980	189	72	\N	2011	2020
3951	Lasse	Jensen	91	G	1	4	1991	185	83	\N	2012	2012
5013	Peter	Hamerlik	2	G	1	14	1982	187	75	79	2011	\N
4215	Stuart	Skinner	34	G	1	5	1998	191	92	101	2018	\N
5480	Alex	Nedeljkovic	39	G	1	18	1996	183	90	81	2018	\N
3922	Lukas	Steinhauer	29	G	1	3	1992	182	84	\N	2012	\N
4434	Vlastimil	Lakosil	39	G	1	6	1979	178	77	\N	2011	\N
3919	Jimmy	Hertel	34	G	1	3	1992	183	84	\N	2014	\N
4943	Jozef	Racko	30	G	1	14	1984	184	98	\N	2011	2011
4953	Jakub	Kostelny	32	G	1	14	1999	178	74	\N	2018	\N
4694	Martins	Raitums	60	G	1	11	1985	180	80	\N	2011	\N
4911	Yevgeni	Konstantinov	39	G	1	13	1981	185	75	\N	2011	2015
5061	Jonas	Johansson	25	G	1	15	1995	193	90	80	2014	\N
4769	Ilya	Sorokin	90	G	1	13	1995	188	76	85	2014	\N
5211	Linus	Söderström	96	G	1	15	1996	194	90	85	2014	\N
3989	Calvin	de Haan	44	D	2	5	1991	185	89	85	2015	\N
5198	Anders	Nilsson	31	G	1	15	1990	195	100	85	2014	2019
5203	Stefan	Ridderwall	39	G	1	15	1988	188	90	85	2011	2019
4256	Braden	Holtby	70	G	1	5	1989	185	92	92	2013	\N
4452	Lukas	Mensator	51	G	1	6	1984	175	76	108	2011	2016
4418	Zdenek	Smid	1	G	1	6	1980	177	77	93	2011	2011
5195	Fredrik	Pettersson Wentzel	35	G	1	15	1991	185	77	93	2013	\N
4512	Jarkko	Varvio	28	F	3	7	1972	184	94	99	2011	2011
4458	Petr	Mrazek	34	G	1	6	1992	187	84	100	2012	\N
4004	Leland	Irving	37	G	1	5	1988	183	80	95	2012	\N
4624	Joni	Ortio	31	G	1	7	1991	186	83	95	2012	\N
3982	Steve	Mason	1	G	1	5	1988	191	84	98	2011	2017
4742	Elvis	Merzlikins	30	G	1	11	1994	191	85	98	2016	\N
4484	Joonas	Korpisalo	1	G	1	7	1994	190	82	98	2013	\N
4008	Matt	Hackett	31	G	1	5	1990	188	77	103	2014	\N
4501	Kaapo	Kähkönen	34	G	1	7	1996	187	101	103	2018	\N
4223	Carey	Price	31	G	1	5	1987	188	98	83	2012	\N
5079	Mika	Zibanejad	93	C	3	15	1993	188	89	87	2012	\N
5087	Magnus	Hellberg	45	G	1	15	1991	196	84	104	2012	\N
4497	Juuse	Saros	1	G	1	7	1995	179	82	104	2014	\N
5185	Anders	Lindbäck	35	G	1	15	1988	198	89	104	2011	\N
5049	Robin	Lehner	40	G	1	15	1991	191	100	87	2012	\N
4219	Matt	Murray	30	G	1	5	1994	193	80	89	2015	\N
4927	Igor	Shestyorkin	30	G	1	13	1995	185	85	86	2014	\N
5167	Henrik	Lundqvist	35	G	1	15	1982	185	82	86	2011	2019
4566	Antero	Niittymäki	1	G	1	7	1980	184	83	88	2011	2012
5073	Joacim	Eriksson	30	G	1	15	1990	186	86	88	2012	\N
5199	Jacob	Markström	25	G	1	15	1990	194	84	82	2012	\N
5579	Mac	Carruth	35	G	1	18	1992	188	86	96	2016	\N
3749	Rene	Swette	30	G	1	1	1988	183	79	\N	2012	\N
5029	Matej	Kristin	31	G	1	14	1990	182	84	\N	2012	\N
5025	Zdenko	Kotvan	60	G	1	14	1989	183	90	\N	2012	\N
4279	Matt	O'Connor	29	G	1	5	1992	198	102	\N	2015	\N
5000	Karol	Krizan	1	G	1	14	1980	179	84	\N	2011	2016
4676	Ronan	Quemener	33	G	1	8	1988	185	78	\N	2012	\N
4617	Eetu	Laurikainen	1	G	1	7	1993	183	83	\N	2015	\N
5386	Sergei	Kudryavtsev	20	G	1	10	1995	188	83	\N	2017	\N
5364	Alexei	Ivanov	20	G	1	10	1988	186	85	\N	2013	\N
4389	Adam	Svoboda	31	G	1	6	1978	\N	\N	\N	2011	2016
4561	Jani	Hurme	35	G	1	7	1975	\N	\N	\N	2011	2011
4524	Ilpo	Kauhanen	29	G	1	7	1973	184	89	\N	2011	2011
4558	Vesa	Toskala	1	G	1	7	1977	178	84	\N	2011	2011
5514	Jim	Carey	30	G	1	18	1974	183	92	\N	2011	2011
4527	Markus	Korhonen	30	G	1	7	1974	\N	\N	\N	2011	2011
4636	Clement	Fouquerel	20	G	1	8	1990	182	79	\N	2011	\N
4142	Bill	Ranford	30	G	1	5	1966	180	84	\N	2011	2011
4176	Tim	Cheveldae	32	G	1	5	1968	178	89	\N	2011	2011
5535	Chris	Terreri	40	G	1	18	1964	171	72	\N	2011	2011
5425	Robert	Schistad	1	G	1	12	1966	180	85	\N	2011	2011
4538	Jarmo	Myllys	20	G	1	7	1965	\N	\N	\N	2011	2011
5168	Roger	Nordström	1	G	1	15	1966	175	80	\N	2011	2011
5245	Reto	Pavoni	29	G	1	16	1968	178	78	\N	2011	2011
3939	Mads	Schaarup	25	D	2	4	1987	187	78	\N	2012	\N
3775	Martin	Ulrich	3	D	2	1	1969	188	95	\N	2011	2011
4525	Marko	Kiprusoff	23	D	2	7	1972	182	80	\N	2011	2011
4431	Vojtech	Kubincak	42	R	3	6	1979	179	80	\N	2011	\N
5333	Mike	Rosati	31	G	1	9	1968	\N	\N	\N	2011	2011
4553	Kari	Takko	30	G	1	7	1962	173	82	\N	2011	2011
4554	Jukka	Tammi	19	G	1	7	1962	173	76	\N	2011	2011
4471	Ilari	Melart	41	D	2	7	1989	192	95	\N	2012	\N
3779	Peter	Kasper	5	D	2	1	1974	182	85	\N	2011	2011
5547	Eldon	Reddick	27	G	1	18	1964	\N	\N	\N	2011	2011
3838	Sergei	Sheleg	22	D	2	2	1990	197	99	\N	2013	\N
3907	Marco	Nowak	8	D	2	3	1990	189	89	\N	2012	\N
3937	Rasmus	Nielsen	20	D	2	4	1990	176	84	\N	2012	\N
3811	Ilya	Shinkevich	8	D	2	2	1989	186	81	\N	2014	\N
5392	Daniel	Sørvik	90	D	2	12	1990	183	83	\N	2014	\N
3801	Dario	Winkler	38	CR	3	1	1997	179	77	\N	2018	\N
4384	Pavel	Rajnoha	8	D	2	6	1974	187	88	\N	2011	2011
4435	Daniel	Seman	9	D	2	6	1979	179	88	\N	2011	2016
4253	Mike	Smith	41	G	1	5	1982	195	100	99	2011	0
4610	Karri	Rämö	31	G	1	7	1986	187	85	90	2012	0
5009	Matus	Kostur	30	G	1	14	1980	183	85	84	2011	2016
4437	Tomas	Kloucek	22	D	2	6	1980	190	92	\N	2011	2016
4443	Zbynek	Michalek	4	D	2	6	1982	188	83	\N	2011	2018
3895	Patrick	Köppchen	55	D	2	3	1980	180	90	\N	2011	2018
4460	Jakub	Krejcik	33	D	2	6	1991	187	87	\N	2012	\N
3926	Jesper	Jensen	14	D	2	4	1991	182	80	\N	2012	\N
4326	Adam	Sedlak	5	D	2	6	1991	188	95	\N	2012	\N
3799	Martin	Schumnig	72	D	2	1	1989	181	76	\N	2012	\N
5015	Milan	Jurcina	68	D	2	14	1983	196	87	\N	2011	\N
4162	Brendan	Witt	19	D	2	5	1975	183	92	\N	2011	2011
4363	Filip	Kuba	17	D	2	6	1976	193	104	\N	2011	2012
5117	David	Petrasek	6	D	2	15	1976	\N	\N	\N	2011	2014
4164	Rhett	Warrener	7	D	2	5	1976	183	94	\N	2011	2011
4354	Frantisek	Kaberle	6	D	2	6	1973	184	84	\N	2011	2011
3810	Yevgeni	Dadonov	11	L	3	2	1992	186	95	\N	2014	\N
5437	Mats	Trygg	23	D	2	12	1976	179	80	\N	2011	\N
5439	Bård	Sørlie	38	D	2	12	1977	180	85	\N	2011	2011
5413	Johannes	Johannesen	4	D	2	12	1997	181	85	\N	2017	\N
3802	Erik	Kirchschläger	71	D	2	1	1996	177	80	\N	2018	\N
5144	Kenny	Jönsson	9	D	2	15	1974	191	89	\N	2011	2011
5016	Tomas	Malec	23	D	2	14	1982	188	86	\N	2011	\N
4330	David	Sklenicka	5	D	2	6	1996	180	82	\N	2018	\N
3821	Dmitri	Dudik	17	L	3	2	1977	178	75	\N	2011	2011
3800	Stefan	Ulmer	95	D	2	1	1990	176	72	\N	2011	\N
5145	Kim	Johnsson	2	D	2	15	1976	187	90	\N	2011	2011
4141	Patrick	Roy	33	G	1	5	1965	183	83	\N	2011	2011
5601	Peter	Mueller	88	C	3	18	1988	188	88	133	2012	\N
4880	Ilya	Stashenkov	28	D	2	13	1974	185	75	133	2011	2011
4001	Justin	Schultz	19	D	2	5	1990	185	73	94	2013	\N
4507	Markus	Niemeläinen	56	D	2	7	1998	197	86	101	2018	\N
3822	Alexander	Zhurik	7	D	2	2	1975	191	88	101	2011	2011
4309	Marek	Troncinsky	13	D	2	6	1988	186	94	\N	2012	\N
3912	Tim	Schüle	29	D	2	3	1990	184	86	\N	2012	\N
3777	Michael	Shea	6	D	2	1	1961	\N	\N	\N	2011	2011
3757	Robert	Lembacher	5	D	2	1	1989	177	80	\N	2012	2016
4000	Garnet	Exelby	2	D	2	5	1981	185	87	\N	2011	2015
4494	Ville	Pokka	2	D	2	7	1994	183	90	85	2013	\N
4225	Travis	Hamonic	3	D	2	5	1990	183	99	85	2012	\N
4498	Olli	Juolevi	4	D	2	7	1998	191	83	108	2017	\N
3948	Philip	Larsen	36	D	2	4	1989	182	84	99	2011	\N
3847	Sergei	Kolosov	28	D	2	2	1986	193	92	100	2011	2016
4459	Jakub	Kindl	4	D	2	6	1987	190	91	100	2012	\N
4221	Brendan	Smith	2	D	2	5	1989	187	77	100	2012	\N
4523	Veli-Pekka	Kautonen	6	D	2	7	1970	180	80	95	2011	2011
4874	Dmitri	Ryabykin	16	D	2	13	1976	187	80	95	2011	2014
4489	Niko	Hovinen	32	G	1	7	1988	196	90	103	2011	\N
4009	Justin	Falk	44	D	2	5	1988	196	97	103	2012	2018
4687	Kaspars	Daugavins	26	L	3	11	1988	178	84	87	2011	\N
4966	Christian	Jaros	15	D	2	14	1996	191	92	87	2016	\N
5036	Andrej	Meszaros	14	D	2	14	1985	187	86	87	2011	\N
4011	Marc	Staal	18	D	2	5	1987	192	89	86	2012	\N
5032	Peter	Ceresnak	26	D	2	14	1993	191	92	86	2013	\N
4879	Andrei	Skopintsev	3	D	2	13	1971	181	80	90	2011	2011
4951	Adam	Janosik	5	D	2	14	1992	179	80	90	2012	\N
4777	Ivan	Provorov	9	D	2	13	1997	185	91	88	2016	\N
4206	Brent	Seabrook	7	D	2	5	1985	188	103	96	2011	\N
3936	Markus	Lauridsen	7	D	2	4	1991	188	85	\N	2012	\N
3967	Matias	Lassen	12	D	2	4	1996	182	82	\N	2017	\N
5019	Peter	Trska	7	D	2	14	1992	183	92	\N	2012	\N
5163	Stefan	Liv	1	G	1	15	1980	183	78	\N	2011	2011
5352	Roland	Hofer	21	D	2	9	1990	185	89	\N	2014	\N
3955	Sebastian	Dahm	31	G	1	4	1987	186	82	\N	2012	\N
4637	Maxime	Moisand	22	D	2	8	1990	177	78	\N	2012	\N
4408	Jiri	Slegr	24	D	2	6	1971	180	78	\N	2011	2014
5317	Marco	Marzolini	26	D	2	9	1997	175	70	\N	2017	\N
5319	Armin	Hofer	9	D	2	9	1987	184	88	\N	2011	\N
4135	Jamie	Rivers	6	D	2	5	1975	180	81	\N	2011	2011
5376	Maxim	Kuznetsov	32	D	2	10	1977	197	108	\N	2011	2011
4131	Chris	Pronger	44	D	2	5	1974	195	86	\N	2011	2011
5375	Oleg	Kovalenko	8	D	2	10	1975	198	102	\N	2011	2011
5346	Carlo	Lorenzi	14	D	2	9	1974	176	75	\N	2011	\N
5349	Stefano	Marchetti	23	D	2	9	1986	181	80	\N	2011	\N
5140	Jonas	Elofsson	7	D	2	15	1979	\N	\N	\N	2011	2011
5372	Artemi	Lakiza	7	D	2	10	1987	179	80	\N	2011	\N
5388	Roman	Savchenko	2	D	2	10	1988	189	91	\N	2011	\N
4368	Marek	Malik	4	D	2	6	1975	187	90	\N	2011	2013
4353	Tomas	Kaberle	15	D	2	6	1978	185	96	\N	2011	2015
4391	Michal	Sykora	38	D	2	6	1973	193	95	\N	2011	2011
4400	Radek	Hamr	2	D	2	6	1974	187	86	\N	2011	2011
4401	Roman	Hamrlik	7	D	2	6	1974	188	92	\N	2011	2012
4409	Richard	Smehlik	42	D	2	6	1970	190	94	\N	2011	2011
4421	Angel	Krstev	29	D	2	6	1980	182	86	\N	2011	\N
4039	Nick	Schultz	55	D	2	5	1982	185	84	\N	2011	2016
4107	Bryan	McCabe	4	D	2	5	1975	183	92	\N	2011	2011
4108	Kyle	McLaren	46	D	2	5	1977	189	95	\N	2011	2011
4113	Richard	Matvichuk	24	D	2	5	1973	188	86	\N	2011	2011
4584	Kristian	Näkyvä	6	D	2	7	1990	183	88	\N	2015	\N
4736	Kristians	Rubins	44	D	2	11	1997	194	96	\N	2018	\N
4013	Chris	Tanev	8	D	2	5	1989	188	83	\N	2012	\N
5549	Tom	Poti	5	D	2	18	1977	190	95	\N	2011	2012
4695	Maksims	Ponomarenko	7	D	2	11	1997	187	88	\N	2015	\N
5040	Andrej	Hatala	33	D	2	14	1997	180	90	\N	2015	\N
3964	Søren	Nielsen	24	C	3	4	1996	183	80	\N	2015	\N
4704	Kriss	Lipsbergs	55	D	2	11	1993	182	83	\N	2016	\N
5308	Danil	Skripets	22	D	2	17	1994	180	82	\N	2016	\N
5639	Jacob	Olofsson	38	C	3	15	2000	189	89	\N	2019	\N
4987	Marian	Smerciak	7	D	2	14	1972	\N	\N	\N	2011	2011
5651	Yannic	Pilloni	41	C	3	1	1998	176	75	\N	2019	\N
5449	Erlend	Lesund	7	D	2	12	1994	187	85	\N	2017	\N
5043	Martin	Stajnoch	3	D	2	14	1990	180	85	\N	2011	\N
4559	Sami	Helenius	7	D	2	7	1974	196	100	\N	2011	2011
4842	Dmitri	Kokorev	4	D	2	13	1979	\N	\N	\N	2011	2011
5024	Andrej	Sekera	44	D	2	14	1986	183	84	80	2011	2021
5007	Zdeno	Chara	3	D	2	14	1977	207	109	85	2011	0
4311	Lukas	Krajicek	29	D	2	6	1983	185	85	82	2011	2019
4570	Jarno	Kultanen	45	D	2	7	1973	188	90	\N	2011	2011
4580	Marko	Kauppinen	28	D	2	7	1979	181	86	\N	2011	2016
5116	Ricard	Persson	27	D	2	15	1969	186	92	\N	2011	2011
4432	Milan	Michalek	18	R	3	6	1984	187	96	\N	2011	2016
5110	Mattias	Norström	6	D	2	15	1972	185	93	\N	2011	2011
5662	Nikita	Kovalenko	6	C	3	17	1998	182	85	\N	2019	\N
5515	Keith	Carney	3	D	2	18	1970	188	93	\N	2011	2011
5104	Nicklas	Lidström	4	D	2	15	1970	187	85	\N	2011	2011
5062	Oscar	Eklund	15	D	2	15	1988	183	86	\N	2012	\N
4286	Morgan	Rielly	44	D	2	5	1994	185	93	91	2013	\N
4386	Michal	Rozsival	28	D	2	6	1978	187	87	\N	2011	2017
4235	Jakob	Chychrun	6	D	2	5	1998	188	95	133	2018	\N
4042	Alex	Pietrangelo	27	D	2	5	1990	191	93	107	2012	\N
4032	Colton	Parayko	55	D	2	5	1993	196	102	107	2016	\N
4488	Jani	Hakanpää	58	D	2	7	1992	195	94	107	2015	\N
4329	Ladislav	Smid	17	D	2	6	1986	187	70	94	2011	\N
5044	Martin	Marincin	25	D	2	14	1992	194	85	101	2013	\N
5200	Oscar	Klefbom	7	D	2	15	1993	191	93	101	2012	\N
5459	Taylor	Chorney	41	D	2	18	1987	180	88	101	2012	2020
5068	Anton	Strålman	6	D	2	15	1986	180	82	91	2014	\N
5451	Jonas	Holøs	6	D	2	12	1987	180	91	97	2012	\N
4590	Tommi	Kivistö	6	D	2	7	1991	188	90	81	2013	\N
5496	Justin	Faulk	27	D	2	18	1992	183	88	81	2012	\N
4420	Zdenek	Kutlak	8	D	2	6	1980	190	95	\N	2011	\N
5039	Henrich	Jabornik	4	D	2	14	1991	187	88	\N	2012	\N
4582	Robin	Salo	42	D	2	7	1998	185	85	85	2018	\N
4588	Rasmus	Ristolainen	55	D	2	7	1994	192	94	80	2014	\N
4433	Jiri	Novotny	13	C	3	6	1983	189	86	80	2011	\N
4901	Igor	Shchadilov	3	D	2	13	1980	189	86	92	2011	2012
4234	Nicolas	Hague	2	D	2	5	1998	197	97	161	2018	\N
4257	Josh	Morrissey	44	D	2	5	1995	183	84	93	2017	\N
4359	Mario	Cartelli	32	D	2	6	1979	185	89	93	2011	2012
4740	Arturs	Kulda	6	D	2	11	1988	188	88	93	2011	\N
4262	Jamie	Oleksiak	43	D	2	5	1992	201	109	99	2012	\N
4486	Miro	Heiskanen	4	D	2	7	1999	184	79	99	2017	\N
5177	John	Klingberg	3	D	2	15	1992	185	78	99	2012	\N
4318	Filip	Hronek	17	D	2	6	1997	183	77	100	2018	\N
4030	Ryan	Murray	27	D	2	5	1993	184	90	98	2013	\N
5059	Gabriel	Carlsson	29	D	2	15	1997	193	83	98	2016	\N
4587	Markus	Nutivaara	65	D	2	7	1994	185	87	98	2016	\N
4016	P.K.	Subban	76	D	2	5	1989	181	92	83	2012	\N
4300	Victor	Mete	53	D	2	5	1998	178	82	83	2017	\N
4758	Mikhail	Sergachev	98	D	2	13	1998	190	98	83	2016	\N
4362	Vlastimil	Kroupa	44	D	2	6	1975	188	80	84	2011	2011
5462	Steven	Santini	34	D	2	18	1995	188	94	84	2016	\N
4266	Patrick	Wiercioch	46	D	2	5	1990	196	91	87	2015	\N
5056	Erik	Karlsson	65	D	2	15	1990	182	87	87	2012	\N
3976	Dylan	McIlrath	6	D	2	5	1992	196	99	86	2014	\N
4455	Michal	Jordan	47	D	2	6	1990	187	86	106	2014	\N
3992	Slater	Koekkoek	29	D	2	5	1994	188	90	90	2016	\N
5267	Denis	Malgin	62	C	3	16	1997	175	80	82	2017	\N
5387	Andrei	Korabeynikov	7	D	2	10	1987	187	76	\N	2011	2019
4447	Ales	Hemsky	83	R	3	6	1983	180	77	\N	2011	2017
5165	David	Ytfeldt	14	D	2	15	1979	184	90	\N	2011	2011
5518	Scott	Lachance	7	D	2	18	1972	188	90	\N	2011	2011
5659	Vadim	Mazur	10	C	3	17	1998	175	78	\N	2019	\N
5661	Vasili	Filyayev	10	C	3	2	1999	191	87	\N	2019	\N
4436	Jiri	Hudler	26	C	3	6	1984	178	82	\N	2011	2016
5130	Mattias	Timander	8	D	2	15	1974	189	95	\N	2011	2011
5482	John-Michael	Liles	26	D	2	18	1980	178	83	\N	2011	2016
4067	Christian	Laflamme	3	D	2	5	1976	183	91	\N	2011	2011
5401	Lars	Haugen	30	G	1	12	1987	183	82	\N	2012	\N
4541	Janne	Niinimaa	5	D	2	7	1975	183	99	\N	2011	2011
4102	Paul	Laus	3	D	2	5	1970	185	96	\N	2011	2011
4369	Radek	Matejovsky	71	L	3	6	1977	\N	\N	\N	2011	2011
5329	Leo	Insam	5	D	2	9	1975	190	100	\N	2011	2011
4337	Josef	Beranek	9	C	3	6	1969	183	83	\N	2011	2011
4365	Robert	Lang	11	C	3	6	1970	186	90	\N	2011	2011
4361	Ladislav	Kohn	46	C	3	6	1975	178	79	\N	2011	2011
5596	Torey	Krug	47	D	2	18	1991	175	81	\N	2014	\N
5583	Paul	Martin	7	D	2	18	1981	185	84	\N	2011	2017
4673	Thomas	Thiry	17	D	2	8	1997	191	98	\N	2018	\N
4338	Radek	Bonk	14	C	3	6	1976	190	98	\N	2011	2013
4057	Patrice	Brisebois	43	D	2	5	1971	188	83	\N	2011	2011
4668	Teddy	Trabichet	87	D	2	8	1987	184	85	\N	2011	\N
5541	Derian	Hatcher	2	D	2	18	1972	196	102	\N	2011	2011
4357	Jan	Caloun	12	C	3	6	1972	178	80	\N	2011	2011
4540	Antti-Jussi	Niemi	77	D	2	7	1977	184	85	\N	2011	2013
5143	Patrik	Juhlin	12	R	3	15	1970	183	88	\N	2011	2011
4680	Jeremie	Romand	17	R	3	8	1988	192	95	\N	2012	\N
5265	Dominik	Schlumpf	18	D	2	16	1991	181	81	\N	2012	\N
5224	Dave	Sutter	18	D	2	16	1992	194	92	\N	2012	\N
5517	Jamie	Langenbrunner	16	R	3	18	1975	179	81	\N	2011	2012
4411	Bedrich	Scerban	12	D	2	6	1964	175	77	\N	2011	2011
3754	Thomas	Raffl	41	R	3	1	1986	193	95	\N	2011	\N
5264	Christian	Marti	54	D	2	16	1993	190	95	\N	2013	\N
4670	Sacha	Treille	77	R	3	8	1987	196	98	\N	2011	\N
4666	Julien	Pihant	48	R	3	8	1978	175	74	\N	2011	2011
4406	Petr	Hrbek	18	F	3	6	1969	\N	\N	\N	2011	2011
4671	Jordann	Perret	94	R	3	8	1994	179	81	\N	2017	\N
5488	Charlie	McAvoy	73	D	2	18	1997	183	94	79	2017	\N
5102	Mattias	Karlin	26	R	3	15	1979	185	83	79	2011	2011
5202	David	Rundblad	7	D	2	15	1990	189	86	107	2012	\N
4775	Vladimir	Tarasenko	91	L	3	13	1991	184	84	107	2012	\N
5485	Kyle	Klubertanz	49	D	2	18	1985	183	80	94	2011	2017
5078	Hampus	Lindholm	47	D	2	15	1994	189	94	94	2017	\N
5569	Cam	Fowler	4	D	2	18	1991	188	90	94	2012	\N
5463	Kyle	Palmieri	23	R	3	18	1991	178	88	94	2012	\N
3923	Tobias	Rieder	8	R	3	3	1993	180	84	101	2014	\N
5052	Andreas	Johnsson	88	L	3	15	1994	178	80	91	2015	\N
5209	Tom	Nilsson	25	D	2	15	1993	184	83	91	2013	\N
4771	Yegor	Korshkov	96	R	3	13	1996	193	82	91	2018	\N
5577	Jamie	McBain	4	D	2	18	1988	185	84	81	2012	2017
5521	Jason	McBain	5	D	2	18	1974	183	89	81	2011	2011
4741	Eduards	Jansons	4	D	2	11	1997	190	85	\N	2016	\N
3920	Andy	Reiss	96	L	3	3	1986	185	86	\N	2012	\N
5345	Michele	Ciresa	19	R	3	9	1980	185	80	\N	2011	2011
4677	Guillaume	Karrer	7	D	2	8	1981	183	86	\N	2011	2011
5164	Johan	Halvardsson	29	D	2	15	1979	193	94	85	2011	2011
5570	Jake	McCabe	29	D	2	18	1993	183	96	80	2015	\N
4568	Markus	Kankaanperä	18	D	2	7	1980	186	86	108	2011	\N
4776	Vasili	Podkolzin	19	R	3	13	2001	185	86	108	2018	\N
5487	John	Carlson	74	D	2	18	1990	188	95	92	2012	\N
4598	Sami	Lepistö	18	D	2	7	1984	178	85	92	2011	\N
5226	Jonas	Siegenthaler	97	D	2	16	1997	189	99	92	2015	\N
5576	Jacob	Trouba	8	D	2	18	1994	188	88	93	2013	\N
5172	Johan	Fransson	10	D	2	15	1985	186	89	99	2011	\N
4639	Xavier	Ouellet	61	D	2	8	1993	185	90	100	2015	\N
5599	Mike	Reilly	4	D	2	18	1993	188	86	98	2015	\N
5045	Tim	Erixon	44	D	2	15	1991	190	90	95	2012	\N
5277	Tim	Ramholt	6	D	2	16	1984	186	93	95	2011	2017
5498	Derek	Forbort	24	D	2	18	1992	194	89	102	2016	\N
4341	Tomas	Vlasak	10	R	3	6	1975	187	88	102	2011	2014
5219	Roman	Josi	59	D	2	16	1990	186	88	104	2012	\N
5581	Jon	Merrill	7	D	2	18	1992	191	91	84	2014	\N
5504	Brady	Skjei	76	D	2	18	1994	191	93	86	2017	\N
5072	Jesper	Fast	18	R	3	15	1991	182	80	86	2012	\N
5519	Chris	LiPuma	40	D	2	18	1971	183	83	106	2011	2011
5275	Mirco	Mueller	41	D	2	16	1995	191	93	106	2016	\N
5186	Victor	Hedman	77	D	2	15	1990	198	100	90	2011	\N
4449	Michael	Frolik	67	L	3	6	1988	185	84	82	2012	\N
5573	Ian	McCoshen	12	D	2	18	1995	191	93	82	2017	\N
5502	Jack	Skille	12	R	3	18	1987	185	91	96	2012	\N
4451	Jakub	Culek	14	L	3	6	1992	193	85	\N	2014	\N
4773	Alexander	Syomin	10	L	3	13	1984	183	82	\N	2011	\N
5272	Cedric	Hächler	10	D	2	16	1993	184	80	\N	2014	\N
5355	Alex	Trivellato	5	D	2	9	1993	189	83	\N	2013	\N
5331	Roland	Ramoser	16	R	3	9	1972	191	93	\N	2011	2011
5252	Martin	Steinegger	2	D	2	16	1972	187	88	\N	2011	2011
5664	Lasse	Mortensen	4	D	2	4	2000	192	86	\N	2019	\N
5134	Jonas	Höglund	14	R	3	15	1972	189	97	\N	2011	2011
4662	Yven	Sadoun	19	R	3	8	1980	185	90	\N	2011	2011
5341	Stefano	Margoni	29	R	3	9	1975	182	80	\N	2011	2013
4998	Miroslav	Marcinko	6	D	2	14	1964	\N	\N	\N	2011	2011
4986	Lubomir	Sekeras	7	D	2	14	1968	184	80	\N	2011	2011
4550	Ville	Siren	8	D	2	7	1964	175	70	\N	2011	2011
4852	Vladimir	Malakhov	7	D	2	13	1968	190	90	\N	2011	2011
4846	Igor	Kravchuk	4	D	2	13	1966	185	91	\N	2011	2011
4881	Igor	Stelnov	40	D	2	13	1963	182	95	\N	2011	2011
4751	Anton	Krasotkin	20	G	1	13	1997	182	81	\N	2017	\N
3845	Nikolai	Stasenko	3	D	2	2	1987	195	101	\N	2012	\N
4123	Jean-Sebastien	Aubin	30	G	1	5	1977	\N	\N	\N	2011	2014
4129	Felix	Potvin	29	G	1	5	1971	183	82	\N	2011	2011
4125	Chris	Osgood	30	G	1	5	1972	177	73	\N	2011	2011
4155	Jocelyn	Thibault	35	G	1	5	1975	180	77	\N	2011	2011
4154	Jose	Theodore	1	G	1	5	1976	178	79	\N	2011	2011
5533	Garth	Snow	30	G	1	18	1969	190	91	\N	2011	2011
5455	Henrik	Holm	20	G	1	12	1990	186	76	\N	2011	\N
5537	David	Wilkie	8	D	2	18	1974	183	94	\N	2011	2011
5031	Julius	Hudacek	33	G	1	14	1988	183	83	\N	2012	\N
4893	Alexander	Yudin	3	D	2	13	1969	185	80	\N	2011	2011
4659	Eddy	Ferhi	1	G	1	8	1979	193	87	\N	2011	2011
4397	Roman	Turek	2	G	1	6	1970	189	86	\N	2011	2011
4891	Yevgeny	Shaldybin	12	D	2	13	1975	\N	\N	\N	2011	2011
4884	Igor	Ulanov	4	D	2	13	1969	188	93	\N	2011	2011
4105	Blaine	Lacher	31	G	1	5	1970	185	93	\N	2011	2011
4882	Oleg	Tverdovsky	10	D	2	13	1976	183	84	\N	2011	2012
5446	Alexander	Bonsaksen	47	D	2	12	1987	180	83	\N	2012	\N
5622	Amir	Miftakhov	1	G	1	13	2000	184	75	\N	2019	\N
4088	Trevor	Kidd	37	G	1	5	1972	188	86	\N	2011	2011
4182	Eric	Raymond	2	G	1	5	1972	180	85	\N	2011	2011
4579	Pasi	Kuivalainen	32	G	1	7	1972	180	76	\N	2011	2011
4118	Marty	Murray	28	C	3	5	1975	179	77	\N	2011	2011
5379	Roman	Krivomazov	30	G	1	10	1978	182	80	\N	2011	2011
5653	Jakob	Holzer	53	G	1	1	1998	180	76	\N	2019	\N
5289	Igor	Karpenko	20	G	1	17	1976	168	67	\N	2011	2012
5531	Mike	Richter	35	G	1	18	1966	180	82	\N	2011	2011
5332	Diego	Riva	30	G	1	9	1967	\N	\N	\N	2011	2011
5299	Vadim	Seliverstov	1	G	1	17	1981	172	75	\N	2011	2015
4171	Pat	Falloon	81	R	3	5	1972	180	86	\N	2011	2011
4165	Todd	Warriner	8	L	3	5	1974	186	83	\N	2011	2011
4166	Chris	Wells	12	C	3	5	1975	195	100	\N	2011	2011
4160	Jason	Wiemer	24	C	3	5	1976	183	97	\N	2011	2011
4169	Jeff	Friesen	19	L	3	5	1976	180	86	\N	2011	2011
4161	Ray	Whitney	11	L	3	5	1972	176	74	\N	2011	2013
4133	Wade	Redden	7	D	2	5	1977	185	87	\N	2011	2012
4251	Eric	Staal	12	C	3	5	1984	191	91	\N	2011	\N
4236	Mike	Matheson	19	D	2	5	1994	188	86	82	2016	\N
4506	Janne	Juvonen	41	G	1	7	1994	183	79	104	2013	\N
4720	Normunds	Sejejs	4	D	2	11	1968	178	80	\N	2011	2011
4873	Yevgeni	Ryabchikov	1	G	1	13	1974	185	81	79	2011	2011
4158	Mike	Torchia	30	G	1	5	1972	\N	\N	94	2011	2011
4890	Nikolai	Tsulygin	30	D	2	13	1975	\N	\N	94	2011	2011
4246	James	Reimer	50	G	1	5	1988	188	94	91	2012	\N
5571	Auston	Matthews	34	C	3	18	1997	188	88	91	2015	\N
4923	Pyotr	Kochetkov	74	G	1	13	1999	191	93	81	2018	\N
3795	Stefan	Horneber	36	G	1	1	1986	176	78	\N	2011	2015
4046	Brad	Boyes	26	R	3	5	1982	185	88	\N	2011	2015
4325	Jakub	Skarek	1	G	1	6	1999	191	89	85	2018	\N
4622	Ukko-Pekka	Luukkonen	1	G	1	7	1999	194	89	80	2017	\N
5090	Mattias	Ritola	18	R	3	15	1987	185	90	100	2012	2021
5206	Viktor	Ekbom	8	D	2	15	1989	188	88	89	2012	2021
5665	Cale	Makar	8	D	2	5	1998	180	85	97	2019	0
5385	Konstantin	Pushkaryov	81	R	3	10	1985	181	78	102	2011	0
4163	Corey	Hirsch	31	G	1	5	1972	178	83	108	2011	2011
4748	Ilya	Samsonov	30	G	1	13	1997	191	93	92	2016	\N
4461	Michal	Neuvirth	30	G	1	6	1988	180	81	92	2012	\N
5006	Rastislav	Stana	30	G	1	14	1980	188	78	92	2011	2014
4298	Paul	Postma	4	D	2	5	1989	188	78	93	2012	\N
5615	Connor	Hellebuyck	37	G	1	18	1993	193	91	93	2016	\N
5262	Tobias	Stephan	51	G	1	16	1984	192	85	99	2011	\N
4931	Alexey	Marchenko	47	D	2	13	1992	188	95	100	2015	\N
5194	Filip	Larsson	30	G	1	15	1998	188	84	100	2017	\N
4641	Alexandre	Texier	13	C	3	8	1999	182	79	98	2017	\N
5614	Jonathan	Quick	32	G	1	18	1986	185	101	102	2011	\N
4296	Marco	Scandella	6	D	2	5	1990	189	89	103	2012	\N
4274	Darcy	Kuemper	35	G	1	5	1990	196	92	103	2014	\N
5466	Steve	Michalek	34	G	1	18	1993	188	89	103	2017	2018
5121	Petter	Rönnqvist	1	G	1	15	1973	184	87	87	2011	2011
4920	Alexander	Pechursky	20	G	1	13	1990	183	84	89	2012	\N
4450	Jakub	Kovar	21	G	1	6	1988	184	91	88	2012	\N
4625	Saku	Salminen	68	C	3	7	1994	191	90	90	2013	2018
5208	Felix	Sandström	25	G	1	15	1997	188	87	88	2018	\N
4007	Carter	Hart	79	G	1	5	1998	188	82	88	2018	\N
5223	Luca	Sbisa	5	D	2	16	1990	188	86	88	2011	2020
4930	Andrei	Makarov	1	G	1	13	1993	188	68	\N	2016	\N
4307	Rostislav	Klesla	44	D	2	6	1982	191	91	\N	2011	\N
4467	Tomas	Knotek	15	C	3	6	1990	180	75	\N	2012	\N
5367	Ilya	Lobanov	69	D	2	10	1996	199	96	\N	2018	\N
4120	Scott	Niedermayer	27	D	2	5	1973	183	91	\N	2011	2011
4233	Willie	Mitchell	2	D	2	5	1977	191	95	\N	2011	2011
4301	Brad	Stuart	7	D	2	5	1979	190	97	\N	2011	2015
4856	Dmitri	Mironov	15	D	2	13	1965	188	97	\N	2011	2011
5597	Keith	Kinkaid	1	G	1	18	1989	188	88	\N	2014	\N
4533	Mika	Lehto	34	G	1	7	1979	\N	\N	\N	2011	2011
5580	Jean-Marc	Pelletier	41	G	1	18	1978	\N	\N	\N	2011	2011
5513	Jim	Campbell	12	R	3	18	1973	185	80	\N	2011	2011
4858	Alexander	Mogilny	14	R	3	13	1969	180	85	\N	2011	2011
5222	Dean	Kukan	2	D	2	16	1993	187	86	\N	2012	\N
5656	Christian	Kasastul	49	D	2	12	1997	178	90	\N	2019	\N
4546	Pasi	Petriläinen	3	D	2	7	1978	177	78	\N	2011	2011
5424	Petter	Salsten	2	D	2	12	1965	\N	\N	\N	2011	2011
4678	Yohann	Auvitu	18	D	2	8	1989	181	77	\N	2011	\N
4851	Sergei	Luchinkin	24	R	3	13	1976	\N	\N	\N	2011	2011
4847	Sergei	Krivokrasov	25	L	3	13	1974	180	79	\N	2011	2011
4854	Igor	Melyakov	9	R	3	13	1976	179	86	\N	2011	2011
5249	Jakub	Horak	5	D	2	16	1974	190	90	\N	2011	2011
5539	Steve	Heinze	23	R	3	18	1970	180	87	\N	2011	2011
3861	Christopher	Fischer	24	D	2	3	1988	180	85	\N	2012	\N
4667	Antonin	Manavian	13	D	2	8	1987	191	100	\N	2012	\N
5452	Magnus	Henriksen	16	C	3	12	1996	190	85	\N	2016	\N
5538	Doug	Weight	39	C	3	18	1971	180	87	\N	2011	2011
5536	Keith	Tkachuk	7	C	3	18	1972	188	95	\N	2011	2011
5418	Espen	Knutsen	41	C	3	12	1972	179	81	\N	2011	2011
5417	Martin	Knold	23	D	2	12	1976	178	77	\N	2011	2011
4416	Petr	Buzek	2	D	2	6	1977	186	92	\N	2011	2011
4789	Ruslan	Batyrshin	5	D	2	13	1975	\N	\N	\N	2011	2011
5243	Marco	Klöti	6	D	2	16	1975	190	90	\N	2011	2011
5114	Mattias	Öhlund	16	D	2	15	1976	186	93	\N	2011	2012
4693	Janis	Straupe	7	C	3	11	1989	183	76	\N	2013	\N
4457	Jakub	Nakladal	87	D	2	6	1987	187	83	\N	2012	\N
3978	Stephane	Robidas	56	D	2	5	1977	180	86	\N	2011	2014
4853	Andrei	Markov	25	D	2	13	1978	180	80	\N	2011	2019
4933	Maxim	Kondratyev	34	D	2	13	1983	183	80	\N	2011	\N
4334	Roman	Polak	46	D	2	6	1986	186	96	\N	2011	\N
4370	Jaroslav	Modry	23	D	2	6	1971	188	89	\N	2011	2011
4415	Pavel	Kubina	13	D	2	6	1977	191	97	\N	2011	2012
4993	Robert	Svehla	24	D	2	14	1969	183	86	\N	2011	2011
4556	Kimmo	Timonen	8	D	2	7	1975	189	83	\N	2011	2014
4692	Oskars	Cibulskis	23	D	2	11	1988	192	100	\N	2011	\N
4688	Kristaps	Sotnieks	11	D	2	11	1987	184	88	\N	2012	\N
4973	Lubomir	Visnovsky	21	D	2	14	1976	178	78	\N	2011	2015
4997	Rudolf	Vercik	17	L	3	14	1976	\N	\N	\N	2011	2011
4974	Pavol	Demitra	20	R	3	14	1974	183	83	\N	2011	2011
5461	Brian	Salcido	33	D	2	18	1985	188	85	94	2011	2017
5197	Christofer	Löfberg	44	R	3	15	1986	191	88	\N	2012	2012
4690	Martins	Karsums	15	L	3	11	1986	178	80	79	2011	\N
3974	Shane	O'Brien	55	D	2	5	1983	188	101	94	2011	2017
4044	Shea	Theodore	27	D	2	5	1995	188	88	94	2017	\N
4481	Sami	Vatanen	45	D	2	7	1991	178	80	94	2012	\N
5494	Noah	Hanifin	5	D	2	18	1997	191	93	81	2016	\N
4323	Jan	Latal	17	D	2	6	1990	182	82	\N	2012	\N
5021	Peter	Slimak	15	D	2	14	1990	198	96	\N	2012	2016
4542	Mika	Noronen	35	G	1	7	1979	187	92	\N	2011	2015
4010	Tyler	Myers	57	D	2	5	1990	201	92	80	2012	\N
3965	Nicklas	Jensen	17	R	3	4	1993	191	85	108	2012	\N
5053	Gustav	Forsling	42	D	2	15	1996	182	82	108	2016	\N
5060	Erik	Brännström	26	D	2	15	1999	179	82	161	2017	\N
4766	Alexander	Burmistrov	8	C	3	13	1991	185	82	93	2012	\N
4630	Julius	Honka	6	D	2	7	1995	180	84	99	2017	\N
4868	Yevgeni	Petrochinin	2	D	2	13	1976	182	85	99	2011	2011
4393	Vitezslav	Skuta	4	D	2	6	1974	187	83	100	2011	2011
5479	Kevin	Montgomery	23	D	2	18	1988	188	84	97	2012	2018
5608	Jake	Hansen	22	R	3	18	1989	185	87	98	2014	\N
3987	Kris	Russell	10	D	2	5	1987	178	74	98	2012	\N
5026	Marko	Dano	56	L	3	14	1994	182	90	98	2014	\N
4764	Vyacheslav	Voynov	26	D	2	13	1990	182	78	102	2012	\N
5212	Gustav	Olofsson	23	D	2	15	1994	191	89	103	2017	\N
5187	Adam	Larsson	5	D	2	15	1992	191	89	84	2013	\N
4763	Pavel	Valentenko	25	D	2	13	1987	188	91	83	2012	\N
4585	Olli	Määttä	3	D	2	7	1994	188	92	89	2013	\N
4255	Thomas	Chabot	72	D	2	5	1997	188	89	87	2018	\N
5081	Jakob	Silfverberg	33	R	3	15	1990	185	85	87	2013	\N
4018	Jared	Cowen	22	D	2	5	1991	197	103	87	2013	2015
4028	Marc-Edouard	Vlasic	44	D	2	5	1987	185	86	106	2012	\N
4917	Nikolay	Goldobin	77	L	3	13	1995	182	89	106	2014	\N
3924	Oliver	Lauridsen	4	D	2	4	1989	196	95	88	2012	\N
5069	Niklas	Hjalmarsson	4	D	2	15	1987	191	89	96	2012	2020
5037	Michal	Imrich	14	D	2	14	1991	192	100	\N	2012	\N
5285	Nikita	Butsenko	14	C	3	17	1990	180	75	\N	2013	\N
5300	Artyom	Bondaryev	15	L	3	17	1983	181	79	\N	2011	2016
4956	Marek	Zagrapan	61	C	3	14	1986	185	85	\N	2012	\N
4702	Kristers	Freibergs	27	D	2	11	1992	186	87	\N	2015	\N
4424	Josef	Vasicek	63	C	3	6	1980	195	93	\N	2011	2011
4744	Kristofers	Bindulis	33	D	2	11	1995	190	86	\N	2017	\N
4530	Janne	Laukkanen	12	D	2	7	1970	180	81	\N	2011	2011
4638	Jonathan	Janil	2	D	2	8	1987	187	87	\N	2012	\N
4600	Ville	Lajunen	47	D	2	7	1988	184	84	\N	2013	\N
4646	Kevin	Dusseau	28	D	2	8	1991	187	94	\N	2015	\N
5490	Matt	Greene	2	D	2	18	1983	191	101	\N	2011	2016
4528	Lasse	Kukkonen	3	D	2	7	1981	183	84	\N	2011	2019
5111	Markus	Naslund	21	L	3	15	1973	180	82	\N	2011	2011
5120	Mikael	Renberg	19	L	3	15	1972	188	83	\N	2011	2011
5126	Niklas	Sundblad	29	L	3	15	1973	184	93	\N	2011	2011
5112	Michael	Nylander	23	C	3	15	1972	182	82	\N	2011	2011
5322	Diego	Kostner	20	R	3	9	1992	184	84	\N	2012	\N
5313	Alex	Frei	8	L	3	9	1993	185	88	\N	2013	\N
5321	Matteo	Tessari	14	C	3	9	1989	182	85	\N	2013	\N
5325	Marco	Insam	8	L	3	9	1989	187	86	\N	2011	\N
4534	Juha	Lind	27	R	3	7	1974	187	76	\N	2011	2011
4545	Ville	Peltonen	37	R	3	7	1973	177	79	\N	2011	2013
4417	Patrik	Augusta	21	R	3	6	1969	\N	\N	\N	2011	2011
3857	Sinan	Akdag	64	D	2	3	1989	189	92	\N	2012	\N
4661	Baptiste	Amar	27	D	2	8	1979	183	80	\N	2011	2013
5091	Oscar	Ackeström	8	D	2	15	1972	\N	\N	\N	2011	2011
5433	Morten	Ask	28	C	3	12	1980	186	91	\N	2011	2018
4076	Matt	Johnson	17	L	3	5	1975	195	100	\N	2011	2011
3826	Alexei	Lozhkin	23	R	3	2	1974	\N	\N	\N	2011	2011
5650	Simon	Berger	21	C	3	9	1999	186	86	\N	2019	\N
4439	Jakub	Jerabek	5	D	2	6	1991	182	86	\N	2012	\N
3844	Dmitri	Korobov	5	D	2	2	1989	189	98	\N	2012	\N
3817	Pavel	Razvadovsky	10	L	3	2	1989	177	79	\N	2013	\N
3834	Sergei	Stas	6	D	2	2	1974	180	82	\N	2011	2014
4190	Mark	Bell	28	C	3	5	1980	191	90	\N	2011	2015
3830	Dmitri	Pankov	10	L	3	2	1974	184	85	\N	2011	2011
3873	Erich	Goldmann	5	D	2	3	1976	\N	\N	\N	2011	2011
4820	Alexei	Zhitnik	2	D	2	13	1972	178	82	\N	2011	2011
4976	Ivan	Droppa	2	D	2	14	1972	191	95	\N	2011	2011
4547	Toni	Porkka	10	F	3	7	1970	175	74	\N	2011	2011
5109	Fredrik	Nilsson	10	F	3	15	1971	\N	\N	\N	2011	2011
3963	Niklas	Andersen	48	CR	3	4	1997	180	76	\N	2018	\N
3925	Kristian	Jensen	26	LR	3	4	1996	186	98	\N	2018	\N
4788	Maxim	Afinogenov	61	R	3	13	1979	182	84	\N	2011	2019
5093	Daniel	Alfredsson	11	L	3	15	1972	179	84	\N	2011	2013
4767	Yuri	Alexandrov	23	D	2	13	1988	186	85	79	2012	\N
5382	Viktor	Alexandrov	23	C	3	10	1985	180	82	107	2011	2017
3968	Frederik	Andersen	30	G	1	4	1989	190	87	94	2011	\N
3979	Brandon	Davidson	88	D	2	5	1991	188	95	101	2015	\N
4573	Jarkko	Immonen	26	C	3	7	1982	182	86	91	2011	\N
4258	Matt	Duchene	95	C	3	5	1991	185	90	97	2012	\N
5489	Jack	Johnson	7	D	2	18	1987	183	98	81	2012	\N
3900	Peter	Abstreiter	10	R	3	3	1980	181	80	\N	2011	2011
3938	Stefan	Lassen	21	D	2	4	1985	190	83	\N	2011	2019
4642	Lou	Bogdanoff	15	F	3	8	1994	189	80	\N	2014	\N
5383	Ivan	Bazyleyev	31	G	1	10	1984	185	80	\N	2011	2013
5486	Jack	Eichel	9	C	3	18	1996	188	90	80	2015	\N
5258	Goran	Bezina	57	D	2	16	1980	190	100	133	2011	\N
5064	Jhonas	Enroth	35	G	1	15	1988	180	79	80	2012	\N
5221	Juraj	Simek	9	L	3	16	1987	183	89	108	2011	\N
4701	Rodrigo	Abols	21	C	3	11	1996	193	85	108	2017	\N
4472	Patrik	Laine	29	L	3	7	1998	194	94	93	2015	\N
4815	Yuri	Dobryshkin	14	R	3	13	1979	182	82	93	2011	2011
4475	Roope	Hintz	10	L	3	7	1996	191	93	99	2015	\N
4618	Jyrki	Jokipakka	2	D	2	7	1991	190	87	99	2014	\N
5565	Justin	Abdelkader	8	L	3	18	1987	185	88	100	2012	\N
4275	Sam	Bennett	93	C	3	5	1996	185	84	95	2015	\N
3814	Stepan	Falkovsky	33	D	2	2	1996	200	100	95	2017	\N
4280	Pierre-Luc	Dubois	18	CL	3	5	1998	189	91	98	2017	\N
5067	Niclas	Andersen	9	D	2	15	1988	185	93	102	2011	\N
4226	Jonathan	Bernier	45	G	1	5	1988	183	84	102	2012	\N
3914	Constantin	Braun	90	C	3	3	1988	190	89	102	2012	\N
4267	Matt	Dumba	55	D	2	5	1994	183	83	103	2014	\N
5270	Sven	 Andrighetto	42	L	3	16	1993	176	83	83	2015	\N
3848	Andrei	Kostitsyn	46	L	3	2	1985	183	85	83	2011	\N
4937	Alexei	Yemelin	74	D	2	13	1986	185	95	83	2012	\N
4208	Chris	Driedger	32	G	1	5	1994	193	93	87	2016	\N
4469	Jani	Lajunen	24	C	3	7	1990	185	78	104	2012	\N
5012	Martin	Bartek	12	R	3	14	1980	187	90	104	2011	2017
4476	Kasperi	Kapanen	24	R	3	7	1996	183	82	89	2014	\N
5169	Calle	Andersson	55	D	2	15	1994	188	94	86	2014	\N
5373	Vitali	Yeremeyev	31	G	1	10	1975	184	90	86	2011	2014
5220	Timo	Meier	28	R	3	16	1996	184	98	106	2018	\N
5084	Simon	Bertilsson	15	D	2	15	1991	182	79	88	2012	\N
4479	Sebastian	Repo	92	R	3	7	1996	188	86	82	2015	\N
4273	Aaron	Ekblad	5	D	2	5	1996	193	98	82	2014	\N
5048	Marcus	Kruger	16	C	3	15	1990	182	82	96	2012	\N
5475	Jason	Bacashihua	30	G	1	18	1982	180	80	\N	2011	\N
5306	Eduard	Zakharchenko	25	G	1	17	1995	190	82	\N	2014	\N
5326	Alex	Lambacher	63	CR	3	9	1996	186	85	\N	2017	\N
5408	Martin	Røymark	44	L	3	12	1986	184	86	\N	2011	\N
4928	Sergei	Bobrovski	35	G	1	13	1988	188	83	\N	2011	\N
5360	Christian	Willeit	14	D	2	9	1987	184	90	\N	2012	\N
3909	Frank	Mauer	28	R	3	3	1988	185	81	\N	2012	\N
4056	Rob	Blake	4	D	2	5	1969	191	98	\N	2011	2011
4705	Roberts	Bukarts	71	L	3	11	1990	184	82	\N	2012	\N
5603	Dustin	Brown	23	R	3	18	1984	183	90	\N	2011	2021
5641	Lias	Andersson	23	CL	3	15	1998	181	93	86	2019	0
4900	Denis	Arkhipov	26	C	3	13	1979	189	84	104	2011	2012
5548	Brian	Boucher	33	G	1	18	1977	188	91	\N	2011	2013
4905	Vitali	Vishnevsky	6	D	2	13	1980	188	86	\N	2011	2017
5444	Christian	Bull	28	D	2	12	1996	186	90	\N	2018	\N
4289	Landon	Bow	41	G	1	5	1995	195	95	\N	2018	\N
5658	Andrei	Buyalsky	99	C	3	10	2000	190	79	\N	2019	\N
4804	Vladimir	Vorobyov	11	L	3	13	1972	\N	\N	\N	2011	2011
4796	Valeri	Bure	18	L	3	13	1974	177	78	\N	2011	2011
4342	Tomas	Vokoun	1	G	1	6	1976	183	98	\N	2011	2013
4814	Pavel	Datsyuk	13	C	3	13	1978	180	80	\N	2011	\N
3753	Mario	Altmann	41	D	2	1	1986	191	86	\N	2011	\N
3759	Dominique	Heinrich	91	D	2	1	1990	175	76	\N	2012	\N
3793	Manuel	Latusa	15	L	3	1	1984	182	86	\N	2011	2017
3752	Stefan	Geier	19	RL	3	1	1988	180	78	\N	2012	\N
3758	Raphael	Herburger	89	C	3	1	1989	178	72	\N	2012	\N
3809	Artyom	Demkov	15	CL	3	2	1989	173	73	\N	2012	\N
5593	Tyler	Johnson	9	C	3	18	1990	175	79	\N	2013	\N
3751	Michael	Raffl	12	L	3	1	1988	185	87	\N	2013	\N
3874	Sascha	Goc	6	D	2	3	1979	187	99	\N	2011	2016
4696	Emils	Gegeris	49	L	3	11	1999	186	84	\N	2018	\N
5371	Dmitri	Grents	29	C	3	10	1996	185	85	\N	2018	\N
5286	Andri	Grygoryev	70	D	2	17	1998	182	91	\N	2018	\N
3896	Marcel	Goc	57	C	3	3	1983	184	87	\N	2011	2019
3768	Dieter	Kalt	16	L	3	1	1974	175	83	\N	2011	2011
5510	Byron	Dafoe	34	G	1	18	1971	180	80	\N	2011	2011
4344	Vladimir	Vujtek	23	L	3	6	1972	182	80	\N	2011	2011
4069	Aaron	Gavey	22	C	3	5	1974	183	79	\N	2011	2011
4419	Jiri	David	27	D	2	6	1980	190	91	\N	2011	2011
5407	Anders	Gjøse	12	D	2	12	1984	180	87	\N	2011	2011
4808	Yan	Golubovsky	2	D	2	13	1976	191	83	\N	2011	2011
3764	Daniel	Oberkofler	74	L	3	1	1988	183	74	\N	2011	\N
4514	Tuomas	Grönman	4	D	2	7	1974	\N	\N	\N	2011	2011
3931	Jannik	Christensen	3	D	2	4	1992	182	83	\N	2011	\N
3783	Thomas	Koch	18	C	3	1	1983	172	73	\N	2011	\N
3928	Mads	Eller	21	C	3	4	1995	186	93	\N	2016	\N
4510	Aki-Petteri	Berg	5	D	2	7	1977	189	90	\N	2011	2011
3971	Anders	Krogsgaard	3	D	2	4	1996	185	82	\N	2016	\N
3776	Herbert	Hohenberger	30	D	2	1	1969	182	88	\N	2011	2011
5660	Zakhar	Parkhomenko	99	F	3	10	1997	187	79	\N	2019	\N
3932	Nicolai	Weichel	8	D	2	4	1997	185	92	\N	2018	\N
3774	Gerald	Ressmann	10	L	3	1	1970	190	100	\N	2011	2011
3792	Michael	Schiechl	13	C	3	1	1989	181	81	\N	2012	\N
3748	Konstantin	Komarek	67	L	3	1	1992	179	84	\N	2016	\N
3986	T.J.	Brodie	7	D	2	5	1990	185	77	95	2012	\N
3877	Klaus	Kathan	49	L	3	3	1977	181	80	\N	2011	2017
3906	Denis	Reul	29	D	2	3	1989	193	97	79	2012	\N
4772	Alexander	Khokhlachev	13	C	3	13	1993	179	83	79	2013	\N
4463	Daniel	Vladar	30	G	1	6	1997	196	84	79	2018	\N
4516	Juha	Gustafsson	2	D	2	7	1979	194	90	133	2011	2011
3869	Dominik	Bokk	15	R	3	3	2000	187	82	107	2018	\N
5465	John	Gibson	36	G	1	18	1993	191	96	94	2012	\N
3849	Alexander	Yeronov	55	D	2	2	1989	181	83	\N	2013	\N
3929	Mark	Mieritz	18	R	3	4	1991	181	83	\N	2012	2015
4739	Zemgus	Girgensons	28	C	3	11	1994	185	82	80	2012	\N
3797	Thomas	Vanek	26	L	3	1	1984	185	90	80	2011	2018
5189	Nicklas	Bäckström	19	C	3	15	1987	184	83	92	2011	\N
5227	Tobias	Geisser	42	D	2	16	1999	193	91	92	2017	\N
5274	Peter	Guggisberg	91	L	3	16	1985	182	83	92	2011	2017
5416	Ole Eskild	Dahlstrøm	11	R	3	12	1970	185	92	99	2011	2011
5470	Troy	Vance	55	D	2	18	1993	199	105	99	2015	2017
4922	Ivan	Vishnevsky	55	D	2	13	1988	180	79	99	2012	2020
4629	Markus	Granlund	11	C	3	7	1993	180	82	95	2012	\N
3949	Oliver	Bjorkstrand	28	R	3	4	1995	183	79	98	2017	\N
5086	Oscar	Dansk	35	G	1	15	1994	189	86	98	2017	\N
4904	Alexei	Volkov	30	G	1	13	1980	190	89	102	2011	2014
4938	Alexander	Dergachyov	18	CR	3	13	1996	195	100	102	2018	\N
4483	Mikael	Granlund	64	C	3	7	1992	179	83	103	2012	\N
5266	Yannick	Weber	68	D	2	16	1988	179	89	83	2011	\N
4036	Brendan	Gallagher	11	R	3	5	1992	175	81	83	2012	\N
3994	Gabriel	Bourque	57	L	3	5	1990	175	85	104	2012	\N
3790	Oliver	Setzinger	9	R	3	1	1983	180	75	104	2011	\N
4272	Simon	Despres	47	D	2	5	1991	193	100	89	2012	\N
3930	Peter	Regin	43	C	3	4	1986	187	85	87	2011	\N
4425	Jan	Bohac	11	C	3	6	1982	189	85	87	2011	2011
4779	Pavel	Buchnevich	89	R	3	13	1995	188	80	86	2016	\N
4229	Michael	Del Zotto	4	D	2	5	1990	183	95	86	2012	\N
5495	Justin	Braun	61	D	2	18	1987	185	81	106	2012	\N
3815	Kirill	Gotovets	2	D	2	2	1991	180	88	90	2015	\N
4786	Yevgeni	Dadonov	63	L	3	13	1989	178	78	82	2012	\N
5236	Lars	Weibel	30	G	1	16	1974	188	96	96	2011	2011
5181	Klas	Dahlbeck	6	D	2	15	1991	189	92	96	2012	\N
4603	Henri	Jokiharju	28	D	2	7	1999	183	87	96	2018	\N
3816	Stepan	Goryachevskikh	33	G	1	2	1985	175	70	\N	2011	\N
5414	Adrian	Danielsen	42	D	2	12	1992	189	91	\N	2015	\N
4682	Hugo	Gallet	8	D	2	8	1997	192	95	\N	2018	\N
3935	Anders	Feddersen	18	C	3	4	1991	186	78	\N	2012	\N
3787	Martin	Hohenberger	20	R	3	1	1977	185	94	\N	2011	2011
3806	Mario	Huber	96	RC	3	1	1996	186	91	\N	2017	\N
3756	Philipp	Lindner	77	D	2	1	1995	185	97	\N	2018	\N
3803	Florian	Baltram	89	CL	3	1	1997	180	79	\N	2018	\N
3778	Mario	Schaden	26	L	3	1	1972	173	85	\N	2011	2011
3772	Andreas	Pusnik	12	R	3	1	1972	178	80	\N	2011	2011
3786	Christoph	König	5	L	3	1	1979	192	96	\N	2011	2011
3827	Alexander	Makritsky	2	D	2	2	1971	180	82	\N	2011	2011
3782	Roland	Kaspitz	8	C	3	1	1981	170	70	\N	2011	2016
3850	Vladimir	Denisov	77	D	2	2	1984	180	90	\N	2011	2018
3828	Andrei	Mezin	31	G	1	2	1974	180	76	\N	2011	2013
4615	Anssi	Salmela	29	D	2	7	1984	184	85	\N	2011	\N
5390	Tommy	Kristiansen	16	R	3	12	1989	189	91	\N	2012	\N
3831	Ruslan	Salei	5	D	2	2	1974	185	90	\N	2011	2011
5400	Fredrik	Jørgensen	33	CL	3	12	1997	170	72	\N	2017	\N
3843	Artyom	Kisly	18	R	3	2	1989	176	74	\N	2012	\N
3839	Andrei	Kolosov	52	C	3	2	1989	195	93	\N	2012	\N
5619	Matus	Sukel	19	C	3	14	1996	176	75	\N	2017	\N
3823	Alexei	Kalyuzhny	17	R	3	2	1977	178	76	\N	2011	2015
3763	Daniel	Jakubitzka	11	D	2	1	1996	176	76	\N	2018	\N
4691	Gints	Meija	87	R	3	11	1987	186	86	\N	2012	\N
5107	Marcus	Nilson	16	L	3	15	1978	\N	\N	\N	2011	2014
5398	Petter	Grønstad	33	L	3	12	1997	184	91	\N	2016	\N
3808	Alexander	Osipkov	33	G	1	2	1997	183	84	\N	2018	\N
3832	Andrei	Skabelka	15	L	3	2	1971	180	81	\N	2011	2011
3833	Dmitri	Starostenko	19	R	3	2	1973	184	77	\N	2011	2011
3829	Sergei	Olimpiyev	9	L	3	2	1975	\N	\N	\N	2011	2011
3807	Mikhail	Grabovski	84	C	3	2	1984	180	70	\N	2011	2015
5404	Eirik	Salsten	17	C	3	12	1994	184	90	\N	2016	\N
3946	Jannik	Hansen	36	R	3	4	1986	185	86	\N	2012	2018
5411	Mats	Olsen	51	L	3	12	1991	180	80	\N	2012	\N
5621	Dmitri	Buinitsky	53	CR	3	2	1997	185	85	\N	2019	\N
3853	Marcel	Müller	9	L	3	3	1988	193	103	\N	2011	\N
3892	Marco	Sturm	9	L	3	3	1978	180	86	\N	2011	2012
3875	Thomas	Dolak	9	L	3	3	1979	180	83	\N	2011	2012
3894	Alexander	Genze	5	D	2	3	1971	\N	\N	\N	2011	2011
3868	Thomas	Oppenheimer	17	R	3	3	1988	188	95	\N	2013	\N
3901	Bernhard	Ebner	67	D	2	3	1990	188	92	\N	2014	\N
3961	Simon	Grønvaldt	3	D	2	4	1991	188	85	\N	2014	\N
3856	David	Wolf	45	L	3	3	1989	191	99	\N	2014	\N
4347	Michal	Grosek	15	L	3	6	1975	187	83	\N	2011	2011
3884	Nikolaus	Mondt	17	C	3	3	1978	182	83	\N	2011	2015
5409	Lars Erik	Spets	40	L	3	12	1985	178	82	\N	2011	2018
4322	Michal	Gulasi	24	D	2	6	1986	183	84	\N	2011	\N
4445	Petr	Zamorsky	7	D	2	6	1992	180	86	\N	2014	\N
3942	Nichlas	Hardt	43	L	3	4	1988	177	80	\N	2012	\N
3947	Mads	Christensen	22	C	3	4	1987	179	80	\N	2012	\N
3960	Patrick	Bjorkstrand	62	C	3	4	1992	184	87	\N	2014	\N
5406	Andreas	Martinsen	71	CL	3	12	1990	190	93	\N	2011	\N
3944	Daniel	Nielsen	11	L	3	4	1998	170	80	\N	2018	\N
3780	Reinhard	Divis	1	G	1	1	1975	182	87	\N	2011	2011
3953	Mathias	Hansen	50	R	3	4	1993	200	108	\N	2015	\N
3911	Dominik	Kahun	21	C	3	3	1995	180	80	\N	2016	\N
3913	Sebastian	Uvira	93	L	3	3	1993	189	91	\N	2016	\N
4807	Maxim	Galanov	6	D	2	13	1974	185	76	\N	2011	2011
4657	Xavier	Daramy	17	C	3	8	1981	182	79	\N	2011	2011
3959	Mikkel	Bodker	89	L	3	4	1989	180	88	133	2012	\N
3945	Lars	Eller	16	C	3	4	1989	185	90	107	2011	\N
3864	Leon	Draisaitl	29	C	3	3	1995	186	97	101	2014	\N
3840	Mikhail	Stefanovich	16	C	3	2	1989	189	88	91	2011	\N
3825	Yevgeni	Kurilin	93	C	3	2	1979	181	80	81	2011	2014
3812	Sergei	Stas	23	C	3	2	1991	185	85	\N	2013	\N
5399	Mattias	Nørstebø	10	D	2	12	1995	179	80	\N	2015	\N
3762	Fabian	Weinhandl	31	G	1	1	1987	190	96	\N	2012	2016
3761	Thomas	Dechel	20	G	1	1	1992	180	70	\N	2013	2016
3918	Philip	Gogulla	87	L	3	3	1987	188	78	80	2011	\N
3899	Eduard	Lewandowski	34	R	3	3	1980	185	92	133	2011	\N
5174	Marcus	Johansson	90	L	3	15	1990	182	84	92	2012	\N
3921	Philipp	Grubauer	30	G	1	3	1991	183	75	92	2012	\N
4770	Yevgeni	Kuznetsov	92	C	3	13	1992	186	90	92	2012	\N
3969	Jonas	Røndbjerg	17	RL	3	4	1999	188	88	161	2018	\N
3943	Nikolaj	Ehlers	27	R	3	4	1996	182	78	93	2015	\N
5403	Markus	Soberg	93	RL	3	12	1995	184	80	98	2016	\N
4606	Aleksi	Mäkelä	5	D	2	7	1995	188	94	99	2015	\N
3813	Sergei	Kostitsyn	22	R	3	2	1987	179	78	83	2011	\N
4655	Cristobal	Huet	39	G	1	8	1975	183	88	102	2011	2017
3950	Morten	Madsen	17	L	3	4	1987	190	85	103	2012	\N
3818	Artur	Gavrus	91	CL	3	2	1994	182	80	84	2012	\N
3865	Frederik	Tiffels	46	L	3	3	1995	185	91	89	2017	\N
3863	Tom	Kühnhackl	94	R	3	3	1992	187	79	89	2012	\N
3956	Thomas	Spelling	12	R	3	4	1993	186	80	86	2012	\N
3902	Thomas	Greiss	1	G	1	3	1986	185	92	106	2012	\N
4321	Radko	Gudas	3	D	2	6	1990	182	86	90	2013	\N
3910	Marcel	Noebels	15	L	3	3	1992	189	87	88	2013	\N
3798	Lukas	Haudum	14	L	3	1	1997	183	83	\N	2016	\N
3958	Jannik	Karvinen	3	R	3	4	1986	182	81	\N	2012	\N
3941	Jeppe	Holmberg	23	C	3	4	1996	183	82	\N	2016	\N
3835	Vladimir	Tsyplakov	26	L	3	2	1969	186	87	\N	2011	2011
3767	Dominic	Divis	38	G	1	1	1997	187	83	\N	2018	\N
5623	Adam	Liska	23	L	3	14	1999	178	83	\N	2019	\N
4798	Vyacheslav	Butsayev	14	C	3	13	1970	180	77	\N	2011	2011
4828	Yan	Kaminsky	7	L	3	13	1971	180	84	\N	2011	2011
4375	Stanislav	Neckar	94	D	2	6	1975	183	95	\N	2011	2011
4792	Sergei	Berezin	94	R	3	13	1971	178	90	\N	2011	2011
4335	Jan	Kovar	43	L	3	6	1990	180	85	\N	2012	\N
4345	David	Vyborny	9	L	3	6	1975	179	78	\N	2011	2015
4374	Milan	Nedoma	3	D	2	6	1972	182	86	\N	2011	2011
4794	Sergei	Brylin	12	L	3	13	1974	177	79	\N	2011	2011
4381	Libor	Prochazka	5	D	2	6	1974	187	86	\N	2011	2013
4803	Mikhail	Volkov	18	R	3	13	1972	182	84	\N	2011	2011
4061	Drew	Bannister	7	D	2	5	1974	183	87	\N	2011	2011
4801	Andrei	Vasilyev	26	L	3	13	1972	175	82	\N	2011	2011
4791	Oleg	Belov	5	C	3	13	1973	184	92	\N	2011	2011
4781	Igor	Radulov	50	R	3	13	1982	185	84	\N	2011	2016
4074	Eric	Desjardins	37	D	2	5	1969	185	91	\N	2011	2011
4396	Petr	Tenkrat	62	L	3	6	1977	182	88	\N	2011	2016
4372	Zdenek	Nedved	20	R	3	6	1975	187	92	\N	2011	2011
4422	Milan	Kraft	14	C	3	6	1980	192	98	\N	2011	2013
4388	Martin	Rucinsky	26	L	3	6	1971	180	81	\N	2011	2014
4373	Petr	Nedved	93	C	3	6	1971	190	85	\N	2011	2013
4159	Mike	Wilson	3	D	2	5	1975	189	81	\N	2011	2011
4148	Jason	Smith	26	D	2	5	1973	191	84	\N	2011	2011
4152	Jamie	Storr	1	G	1	5	1975	183	77	\N	2011	2011
4072	Mathieu	Dandenault	11	D	2	5	1976	180	78	\N	2011	2011
4395	Martin	Straka	82	C	3	6	1972	178	81	\N	2011	2013
4377	Kamil	Piros	15	R	3	6	1978	186	88	\N	2011	2015
4382	Martin	Prochazka	21	R	3	6	1972	182	77	\N	2011	2011
4343	Roman	Vopat	37	C	3	6	1976	190	98	\N	2011	2011
4320	Pavel	Zacha	37	C	3	6	1997	191	92	84	2016	0
4782	Alexander	Ovechkin	8	L	3	13	1985	185	82	92	2011	0
4402	Kamil	Kastak	18	F	3	6	1966	\N	\N	\N	2011	2011
4810	Viktor	Gordiyuk	20	L	3	13	1970	178	77	\N	2011	2011
4380	Vaclav	Prospal	13	L	3	6	1975	186	75	\N	2011	2012
4385	Robert	Reichel	19	L	3	6	1971	178	84	\N	2011	2011
4812	Ravil	Gusmanov	15	R	3	13	1972	190	84	\N	2011	2011
4146	Darryl	Sydor	25	D	2	5	1972	183	93	\N	2011	2011
4075	Ed	Jovanovski	55	D	2	5	1976	188	95	\N	2011	2011
4184	Jean-Luc	Grand-Pierre	34	D	2	5	1977	\N	\N	\N	2011	2011
4195	Mathieu	Biron	34	D	2	5	1980	199	98	\N	2011	2011
4392	Petr	Sykora	17	R	3	6	1976	179	83	\N	2011	2011
4410	Patrik	Stefan	13	C	3	6	1980	\N	\N	\N	2011	2011
3983	Simon	Gagne	12	L	3	5	1980	185	81	\N	2011	2014
4348	Radek	Dvorak	9	L	3	6	1977	183	83	\N	2011	2013
4427	Ales	Kotalik	12	R	3	6	1978	186	96	\N	2011	2013
4346	Milan	Hnilicka	3	G	1	6	1973	183	86	\N	2011	2011
4817	Alexei	Yegorov	1	G	1	13	1976	180	79	\N	2011	2011
4095	Martin	Lapointe	20	R	3	5	1973	180	90	\N	2011	2011
4462	Simon	Hrubec	30	G	1	6	1991	186	83	\N	2015	\N
4100	Trevor	Linden	16	C	3	5	1970	192	93	\N	2011	2011
4078	Jason	Dawe	12	L	3	5	1973	178	89	\N	2011	2011
4379	Marek	Posmyk	44	D	2	6	1978	196	104	\N	2011	\N
4797	Pavel	Bure	10	L	3	13	1971	178	86	\N	2011	2011
4378	Ales	Pisa	24	D	2	6	1977	184	90	\N	2011	2017
4317	David	Krejci	46	C	3	6	1986	183	82	79	2011	\N
4454	David	Pastrnak	88	R	3	6	1996	182	82	79	2015	\N
4324	Martin	Hanzal	11	C	3	6	1987	196	90	133	2011	\N
4319	Vladimir	Ruzicka	23	C	3	6	1989	187	85	133	2012	\N
4780	Anton	Slepyshev	42	L	3	13	1994	188	84	101	2015	\N
3985	Nazem	Kadri	43	C	3	5	1990	183	86	91	2013	\N
4220	Tyson	Barrie	4	D	2	5	1991	178	86	97	2012	\N
5405	Robert	Hestmann	34	G	1	12	1988	185	95	\N	2011	\N
3966	Nicki	Kisum	78	RL	3	4	1993	185	84	\N	2014	\N
4222	Brendan	Bell	9	D	2	5	1983	185	94	\N	2011	2015
3973	Jarret	Stoll	36	C	3	5	1982	197	90	\N	2011	2015
3954	Frans	Nielsen	51	C	3	4	1984	184	80	85	2011	\N
4430	Martin	Chabada	15	R	3	6	1977	186	82	85	2011	2013
3796	Michael	Grabner	40	R	3	1	1987	185	85	108	2011	\N
4444	Jakub	Vrana	13	L	3	6	1996	183	89	92	2018	\N
4428	Viktor	Hubl	26	C	3	6	1978	183	83	92	2011	\N
4213	Mike	Green	52	D	2	5	1985	185	89	92	2011	2019
4328	Tomas	Vincour	81	C	3	6	1990	188	95	99	2014	\N
4802	Dmitri	Vlasenkov	25	R	3	13	1978	184	88	95	2011	2013
4823	Sergei	Zolotov	17	F	3	13	1971	180	78	95	2011	2011
4440	Jakub	Voracek	93	RL	3	6	1989	189	96	98	2012	\N
4466	Tomas	Kubalik	18	R	3	6	1990	190	93	98	2012	\N
4327	Dominik	Kubalik	18	L	3	6	1995	185	80	102	2014	\N
4287	Thomas	Hickey	14	D	2	5	1989	183	83	102	2013	\N
4468	Daniel	Pribyl	21	C	3	6	1992	190	86	83	2012	\N
4308	Karel	Vejmelka	50	G	1	6	1996	192	92	104	2016	\N
4805	Sergei	Vyshedkevich	3	D	2	13	1975	\N	\N	84	2011	2011
4210	Eric	Gelinas	22	D	2	5	1991	193	97	84	2014	\N
4293	Kris	Letang	58	D	2	5	1987	183	88	89	2011	\N
4426	Tomas	Duba	3	G	1	6	1981	180	75	89	2011	2019
4314	David	Kveton	57	L	3	6	1988	180	86	86	2011	\N
4787	Artyom	Anisimov	42	C	3	13	1988	190	80	86	2012	\N
4313	Tomas	Hertl	48	C	3	6	1993	190	89	106	2013	\N
4332	Ondrej	Palat	18	L	3	6	1991	181	79	90	2013	\N
4818	Vadim	Yepanchintsev	20	C	3	13	1976	\N	\N	90	2011	2011
4783	Andrei	Vasilevsky	88	G	1	13	1994	190	91	90	2013	\N
4784	Maxim	Shalunov	87	C	3	13	1993	193	96	96	2016	\N
3957	Patrick	Galbraith	1	G	1	4	1986	183	81	\N	2012	\N
3867	Dennis	Endras	44	G	1	3	1985	183	76	\N	2011	\N
4092	Rene	Corbet	7	L	3	5	1973	183	80	\N	2011	2011
4094	Ian	Laperriere	22	R	3	5	1974	185	89	\N	2011	2011
4086	Anson	Carter	33	R	3	5	1974	183	86	\N	2011	2011
4084	Stephane	Yelle	26	C	3	5	1974	183	73	\N	2011	2011
4091	Brandon	Convery	10	C	3	5	1974	183	82	\N	2011	2011
4085	Paul	Kariya	9	L	3	5	1974	180	80	\N	2011	2011
4079	Alexandre	Daigle	91	R	3	5	1975	183	84	\N	2011	2011
4089	Chad	Kilger	8	L	3	5	1976	189	97	\N	2011	2011
4064	Joaquin	Gage	1	G	1	5	1973	180	90	\N	2011	2011
4185	Marc	Denis	30	G	1	5	1977	\N	\N	\N	2011	2011
4831	Alexander	Karpovtsev	16	D	2	13	1970	185	93	\N	2011	2011
5527	Chris	O'Sullivan	6	D	2	18	1974	189	93	\N	2011	2011
4464	Michal	Hlinka	26	R	3	6	1991	190	90	\N	2012	\N
4005	Cory	Conacher	89	C	3	5	1989	173	81	\N	2012	\N
4058	Martin	Brodeur	30	G	1	5	1972	185	93	\N	2011	2011
4832	Darius	Kasparaitis	4	D	2	13	1972	180	86	\N	2011	2011
4765	Ilya	Yezhov	20	G	1	13	1987	187	81	\N	2012	\N
4065	Jean-Sebastien	Giguere	47	G	1	5	1977	185	92	\N	2011	2013
5617	Freddy	Meyer	34	D	2	18	1981	178	85	\N	2011	2011
5447	Jonas	Wikstøl	48	G	1	12	1999	174	78	\N	2018	\N
4070	Eric	Daze	55	R	3	5	1975	189	97	\N	2011	2011
4055	Todd	Bertuzzi	44	R	3	5	1975	189	100	\N	2011	2011
5421	Atle	Olsen	26	D	2	12	1972	\N	\N	\N	2011	2011
4112	Grant	Marshall	29	R	3	5	1973	183	83	\N	2011	2011
4068	Chris	Gratton	77	C	3	5	1975	190	92	\N	2011	2011
4077	Shean	Donovan	42	R	3	5	1975	186	90	\N	2011	2011
4017	Michael	Cammalleri	13	C	3	5	1982	175	84	\N	2011	2017
4140	Jean-Yves	Roy	26	R	3	5	1969	178	83	\N	2011	2011
4130	Keith	Primeau	55	C	3	5	1971	193	95	\N	2011	2011
5292	Alexander	Godynyuk	93	D	2	17	1970	183	94	\N	2011	2011
4935	Nikita	Zaitsev	22	D	2	13	1991	189	89	\N	2012	\N
4128	Denis	Pederson	10	C	3	5	1975	183	86	\N	2011	2012
4121	Owen	Nolan	11	R	3	5	1972	185	88	\N	2011	2011
4087	Frederic	Cassivi	30	G	1	5	1975	193	100	\N	2011	2011
4132	Tyler	Wright	12	R	3	5	1973	179	83	\N	2011	2011
4127	Michael	Peca	27	C	3	5	1974	180	82	\N	2011	2011
4119	Rob	Niedermayer	44	C	3	5	1974	188	91	\N	2011	2011
4139	Dave	Roche	51	C	3	5	1975	192	102	\N	2011	2011
5294	Sergei	Klimentyev	3	D	2	17	1975	182	93	\N	2011	2013
4903	Ilya	Bryzgalov	20	G	1	13	1980	191	89	\N	2011	2014
5305	Vsevolod	Tolstushko	4	D	2	17	1993	178	80	\N	2016	\N
5281	Bogdan	Dyachenko	30	G	1	17	1998	184	79	\N	2017	\N
5448	Lars	Volden	31	G	1	12	1992	190	83	79	2012	\N
3990	Kyle	Turris	7	C	3	5	1989	187	77	133	2014	\N
4022	Mark	Visentin	30	G	1	5	1992	188	91	133	2015	2016
5605	Connor	Murphy	5	D	2	18	1993	191	86	133	2013	\N
4456	Lukas	Dostal	1	G	1	6	2000	186	76	94	2018	\N
4019	Corey	Perry	61	R	3	5	1985	188	83	94	2011	\N
3996	Connor	McDavid	97	C	3	5	1997	185	89	101	2015	\N
4003	Taylor	Hall	9	L	3	5	1991	185	90	101	2012	\N
4006	Sam	Gagner	89	C	3	5	1989	179	86	101	2012	\N
3998	Mitch	Marner	16	C	3	5	1997	181	77	91	2017	\N
5523	Matt	Martin	3	D	2	18	1971	191	86	91	2011	2011
4756	Andrei	Mironov	94	D	2	13	1994	188	90	97	2015	\N
4038	Ryan	O'Reilly	90	C	3	5	1991	183	96	97	2012	\N
4037	Brandon	Sutter	16	C	3	5	1989	191	77	81	2012	\N
3851	Florian	Proske	1	G	1	3	1996	180	74	\N	2016	2019
3993	Jeff	Deslauriers	40	G	1	5	1984	193	81	\N	2011	2015
5288	Denis	Petrukhno	2	D	2	17	1989	189	88	\N	2012	\N
5428	Petter	Skolla	6	D	2	12	1982	187	85	\N	2011	2011
3991	Marcus	Foligno	82	L	3	5	1991	187	90	80	2012	\N
4033	Tyler	Ennis	63	L	3	5	1989	175	66	80	2012	\N
4752	Nikita	Zadorov	61	D	2	13	1995	195	103	80	2012	\N
4023	Bo	Horvat	53	C	3	5	1995	184	101	108	2016	\N
3876	Marc	Seliger	41	G	1	3	1974	185	81	92	2011	2011
4762	Semyon	Varlamov	1	G	1	13	1988	188	95	92	2012	\N
5604	Zach	Redmond	25	D	2	18	1988	188	89	93	2012	\N
3999	Bryan	Little	10	C	3	5	1987	179	91	93	2012	\N
4024	Evander	Kane	9	L	3	5	1991	188	86	93	2012	\N
4025	Mark	Scheifele	55	C	3	5	1993	188	89	93	2013	\N
3975	Anthony	Mantha	39	R	3	5	1994	196	93	100	2017	\N
3988	Chris	Stewart	42	R	3	5	1987	185	103	97	2012	2017
5612	John	Moore	2	D	2	18	1990	191	95	98	2015	\N
4012	Ryan	Johansen	19	C	3	5	1992	191	100	98	2013	\N
3995	Wayne	Simmonds	17	R	3	5	1988	187	79	102	2013	\N
4047	Cal	Clutterbuck	22	R	3	5	1987	180	96	103	2012	\N
4278	Noah	Juulsen	58	D	2	5	1997	188	79	83	2017	\N
4040	Mackenzie	Blackwood	29	G	1	5	1996	193	102	84	2018	\N
4026	Curtis	Lazar	27	C	3	5	1995	183	94	87	2015	\N
3997	Logan	Couture	39	C	3	5	1989	185	93	106	2012	\N
3977	Sidney	Crosby	87	C	3	5	1987	180	88	89	2011	\N
3984	Angelo	Esposito	7	C	3	5	1989	185	81	89	2012	2015
4746	Nikita	Nesterov	89	D	2	13	1993	180	86	90	2015	\N
4049	Jonathan	Drouin	27	L	3	5	1995	181	85	90	2016	\N
4703	Kristers	Gudlevskis	25	G	1	11	1992	190	86	90	2012	\N
4749	Dmitri	Kulikov	7	D	2	13	1990	184	84	82	2011	\N
4015	David	Labrecque	56	C	3	5	1990	179	77	88	2012	\N
4035	Jonathan	Toews	19	C	3	5	1988	188	92	96	2012	\N
4759	Ivan	Nalimov	1	G	1	13	1994	194	94	96	2016	\N
4230	Tyler	Beskorowany	39	G	1	5	1990	196	89	\N	2014	\N
5282	Kirill	Zhovnir	5	D	2	17	1997	193	101	\N	2018	\N
4124	Jeff	O'Neill	92	C	3	5	1976	185	83	\N	2011	2011
4932	Alexandar	Georgiev	40	G	1	13	1996	186	82	\N	2018	\N
5293	Vyacheslav	Zavalnyuk	30	D	2	17	1974	185	84	\N	2011	2011
5291	Alexander	Viyukhin	1	G	1	17	1973	182	87	\N	2011	2011
5295	Artyom	Ostroushko	12	D	2	17	1974	185	89	\N	2011	2011
4186	Shane	Willis	25	R	3	5	1977	\N	\N	\N	2011	2011
4172	Todd	Harvey	10	L	3	5	1975	180	88	\N	2011	2011
4200	Mike	Siklenka	23	R	3	5	1979	197	101	\N	2011	2014
4201	Kyle	Calder	22	L	3	5	1979	182	81	\N	2011	2011
4144	Joe	Sakic	22	C	3	5	1969	180	84	\N	2011	2011
4153	Pierre	Turgeon	17	C	3	5	1969	185	92	\N	2011	2011
4180	Marc	Savard	27	C	3	5	1977	178	78	\N	2011	2011
4147	Brad	Isbister	15	L	3	5	1977	189	100	\N	2011	2011
4145	Geoff	Sanderson	26	L	3	5	1972	183	84	\N	2011	2011
4959	Peter	Hrasko	91	D	2	14	1991	176	79	\N	2012	\N
4151	Cory	Stillman	16	L	3	5	1973	180	81	\N	2011	2011
4149	Ryan	Smyth	94	L	3	5	1976	185	84	\N	2011	2013
4143	Brian	Savage	49	L	3	5	1971	188	87	\N	2011	2011
4197	Gilbert	Dionne	9	R	3	5	1970	185	90	\N	2011	2011
5311	Pavlo	Taran	2	D	2	17	1992	190	87	\N	2013	\N
5160	Samuel	Påhlsson	26	C	3	15	1977	181	93	\N	2011	2014
4212	Maxime	Sauve	7	L	3	5	1990	183	77	\N	2011	2017
4205	Boyd	Gordon	15	C	3	5	1983	183	86	\N	2011	2016
4679	Henri-Corentin	Buysse	31	G	1	8	1988	185	88	\N	2011	\N
5261	Marco	Bührer	32	G	1	16	1979	179	83	\N	2011	2015
4548	Teemu	Selänne	8	L	3	7	1970	183	91	\N	2011	2013
4861	Andrei	Nazarov	23	L	3	13	1974	192	95	\N	2011	2011
5509	Mike	Dunham	31	G	1	18	1972	191	84	\N	2011	2011
4839	Andrei	Kovalenko	26	L	3	13	1970	178	84	\N	2011	2011
4840	Viktor	Kozlov	25	C	3	13	1975	195	95	\N	2011	2014
4841	Vyacheslav	Kozlov	9	L	3	13	1972	178	82	\N	2011	2014
4403	Milan	Hejduk	23	R	3	6	1976	183	87	\N	2011	2012
4830	Valeri	Karpov	11	L	3	13	1971	178	80	\N	2011	2011
4844	Igor	Korolyov	11	C	3	13	1970	185	82	\N	2011	2011
4604	Veini	Vehviläinen	35	G	1	7	1997	185	83	98	2018	\N
4248	Rick	Nash	61	L	3	5	1984	192	85	\N	2011	2017
4260	Tyler	Seguin	19	C	3	5	1992	183	77	79	2012	\N
4265	Milan	Lucic	17	L	3	5	1988	188	92	79	2013	\N
4270	Jaden	Schwartz	8	L	3	5	1992	178	81	107	2013	\N
4224	Peter	Holland	24	C	3	5	1991	188	89	94	2013	\N
4263	Ryan	Nugent-Hopkins	93	C	3	5	1993	183	84	101	2012	\N
4947	Juraj	Mikus	66	D	2	14	1988	193	85	91	2012	\N
4240	Nathan	MacKinnon	29	C	3	5	1995	183	93	97	2013	\N
4946	Branislav	Pavuk	8	D	2	14	1995	185	85	\N	2015	\N
5347	Andreas	Bernard	2	G	1	9	1990	184	80	\N	2013	\N
3794	Martin	Oraze	18	D	2	1	1984	191	82	\N	2011	2019
4189	Dany	Heatley	15	R	3	5	1981	191	89	\N	2011	2015
4241	Kris	Beech	24	C	3	5	1981	190	80	\N	2011	2015
5336	Mark	Demetz	30	G	1	9	1981	180	78	\N	2011	2015
5038	Michal	Valent	1	G	1	14	1986	188	79	80	2011	\N
4227	Ryan	Strome	18	C	3	5	1993	186	87	85	2016	\N
4268	John	Tavares	91	C	3	5	1990	183	90	85	2012	\N
4259	Patrice	Bergeron	37	C	3	5	1985	183	80	79	2011	0
4218	Mathew	Barzal	13	C	3	5	1997	183	86	85	2018	\N
4211	Ryan	O'Marra	42	C	3	5	1987	187	93	85	2012	2016
4216	Zack	Kassian	9	R	3	5	1991	191	102	80	2012	\N
4217	James	Neal	18	L	3	5	1987	188	84	99	2012	\N
4264	Jamie	Benn	14	L	3	5	1989	188	83	99	2012	\N
5478	Richard	Bachman	30	G	1	18	1987	180	72	99	2012	2019
5263	Joren	van Pottelberghe	30	G	1	16	1997	191	85	100	2017	\N
5467	Jon	Gillies	32	G	1	18	1994	197	101	95	2016	\N
4271	Sean	Monahan	23	C	3	5	1994	191	88	95	2013	\N
4835	Dmitri	Kirilenko	8	C	3	13	1979	181	78	95	2011	2011
4207	Kyle	Clifford	13	L	3	5	1991	185	91	102	2012	\N
4941	Erik	Cernak	81	D	2	14	1997	192	102	102	2018	\N
5058	Johan	Gustafsson	37	G	1	15	1992	188	90	103	2012	\N
4214	Adam	Henrique	14	C	3	5	1990	183	91	84	2012	\N
4602	Atte	Engren	35	G	1	7	1988	185	84	104	2013	\N
4281	Mark	Stone	61	R	3	5	1992	190	93	87	2015	\N
4276	Jordan	Staal	11	C	3	5	1988	191	93	89	2011	\N
4940	Vladimir	Mihalik	44	D	2	14	1987	202	110	90	2012	\N
4244	Steven	Stamkos	91	C	3	5	1990	183	83	90	2012	\N
4252	Brayden	Point	21	C	3	5	1996	180	75	90	2018	\N
4836	Dmitri	Klevakin	10	R	3	13	1976	183	78	90	2011	2011
5017	Lubos	Velebny	21	D	2	14	1982	188	97	91	2011	2011
4254	Claude	Giroux	28	C	3	5	1988	181	80	88	2012	\N
4261	Jeff	Carter	17	C	3	5	1985	191	92	88	2011	\N
4209	Jonathan	Huberdeau	11	L	3	5	1993	186	80	82	2012	\N
4837	Sergei	Klimovich	18	C	3	13	1974	188	86	96	2011	2011
3789	Philippe	Lakos	25	D	2	1	1980	185	75	\N	2011	\N
5598	Troy	Grosenick	34	G	1	18	1989	185	83	\N	2014	\N
4838	Alexei	Kovalev	15	R	3	13	1973	183	91	\N	2011	2011
5231	Leonardo	Genoni	30	G	1	16	1987	180	82	\N	2012	\N
4669	Antoine	Bonvalot	35	G	1	8	1994	180	73	\N	2015	\N
3804	Lucas	Birnbaum	76	D	2	1	1997	190	89	\N	2018	\N
5522	Marty	McInnis	18	L	3	18	1970	183	84	\N	2011	2011
4686	Kevin	Igier	8	D	2	8	1987	180	81	\N	2012	\N
5456	Mats	Zuccarello	36	L	3	12	1987	171	75	\N	2012	\N
5454	Steffen	Thoresen	21	R	3	12	1985	180	88	\N	2011	\N
5528	Pat	Peake	14	C	3	18	1973	183	89	\N	2011	2011
5420	Henrik	Aaby	15	L	3	12	1975	184	88	\N	2011	2011
4865	Roman	Oksiuta	28	R	3	13	1970	191	104	\N	2011	2011
5131	Christer	Olsson	35	D	2	15	1970	180	86	\N	2011	2011
5524	Todd	Marchant	26	C	3	18	1973	182	86	\N	2011	2011
5532	Brian	Rolston	11	R	3	18	1973	188	84	\N	2011	2011
5525	Mike	Modano	9	C	3	18	1970	191	86	\N	2011	2011
4825	Andrei	Zyuzin	30	D	2	13	1978	183	88	\N	2011	2013
4864	Andrei	Nikolishin	11	L	3	13	1973	188	94	\N	2011	2011
5529	Derek	Plante	26	C	3	18	1971	180	73	\N	2011	2011
5434	Mads	Hansen	8	C	3	12	1978	184	85	\N	2011	2014
4809	Sergei	Gonchar	55	D	2	13	1974	188	96	\N	2011	2014
5429	Patrick	Thoresen	11	L	3	12	1983	178	78	\N	2011	\N
4799	Dmitri	Bykov	5	D	2	13	1977	178	77	\N	2011	2014
4351	Tomas	Zizka	20	D	2	6	1979	188	91	\N	2011	\N
4870	Andrei	Potaichuk	20	L	3	13	1970	180	86	\N	2011	2011
4867	Oleg	Petrov	16	R	3	13	1971	180	82	\N	2011	2012
5438	Tore	Vikingstad	37	C	3	12	1975	191	93	\N	2011	2013
4020	Brenden	Dillon	4	D	2	5	1990	191	104	\N	2013	\N
5320	Ivan	Tauferer	12	D	2	9	1995	190	93	\N	2018	\N
5340	Armin	Helfer	5	D	2	9	1980	187	86	\N	2011	2019
4876	Alexander	Selivanov	29	L	3	13	1971	183	82	\N	2011	2011
5363	Valeri	Sevidov	60	G	1	10	1995	179	78	\N	2014	\N
5423	Marius	Rath	16	F	3	12	1970	\N	\N	\N	2011	2011
5442	Michael	Haga	58	C	3	12	1992	180	77	\N	2016	\N
5324	Daniel	Glira	21	D	2	9	1994	188	87	\N	2016	\N
5440	Andre	Manskow Hansen	26	L	3	12	1975	183	79	\N	2011	2011
5441	Per Olav	Skarpjordet	24	R	3	12	1978	185	94	\N	2011	2011
4888	Alexander	Kharlamov	17	L	3	13	1975	\N	\N	\N	2011	2011
4875	Sergei	Samsonov	14	L	3	13	1978	178	83	\N	2011	2011
4887	Alexander	Kharitonov	14	L	3	13	1976	172	68	\N	2011	2011
5337	Michele	Strazzabosco	6	D	2	9	1976	193	93	\N	2011	2014
4302	Brad	Marchand	63	L	3	5	1988	176	83	79	2013	\N
4778	Maxim	Chudinov	73	D	2	13	1990	180	92	79	2013	\N
4242	Dougie	Hamilton	27	D	2	5	1993	198	93	79	2012	\N
5610	Chris	Brown	10	RC	3	18	1991	188	88	133	2013	\N
5229	Reto	Berra	20	G	1	16	1987	193	86	107	2012	\N
4305	Curtis	Hamilton	16	L	3	5	1991	188	96	101	2015	\N
4288	Jordan	Eberle	7	R	3	5	1990	183	84	101	2012	\N
5453	Sondre	Olden	13	R	3	12	1992	194	84	91	2012	\N
3866	Korbinian	Holzer	5	D	2	3	1988	191	95	91	2011	\N
4689	Martins	Dzierkals	16	RL	3	11	1997	181	77	91	2018	\N
4750	Nikolai	Kulyomin	41	RL	3	13	1986	185	83	91	2012	\N
4283	Jeff	Skinner	53	L	3	5	1992	180	89	81	2012	\N
4755	Andrei	Svechnikov	37	R	3	13	2000	189	85	81	2018	\N
3858	Tobias	Draxinger	14	D	2	3	1985	191	89	\N	2011	\N
5457	Lie Espen	Olsen	7	L	3	12	1984	179	88	\N	2011	2017
3852	Florian	Ondruschka	87	D	2	3	1987	185	86	\N	2012	\N
5318	Thomas	Tragust	34	G	1	9	1986	187	83	\N	2012	\N
5616	Matt	Nieto	83	L	3	18	1992	183	82	106	2014	\N
4915	Fyodor	Fyodorov	81	L	3	13	1981	192	91	\N	2011	2014
4760	Mikhail	Grigorenko	25	C	3	13	1994	190	85	80	2012	\N
5611	Kyle	Okposo	21	R	3	18	1988	184	98	85	2012	\N
4757	Kirill	Kabanov	7	R	3	13	1992	191	84	85	2014	\N
4290	Alexandre	Grenier	28	R	3	5	1991	196	91	108	2012	\N
4238	Ben	Hutton	60	D	2	5	1993	188	83	108	2016	\N
4816	Mikhail	Donika	2	D	2	13	1979	178	80	99	2011	2014
3940	Malte	Setkov	3	D	2	4	1999	198	89	100	2017	\N
4237	Dion	Phaneuf	3	D	2	5	1985	188	92	95	2011	2018
4297	Boone	Jenner	38	C	3	5	1993	186	93	98	2015	\N
4747	Andrei	Loktionov	48	C	3	13	1990	180	84	102	2012	\N
4027	Drew	Doughty	8	D	2	5	1989	185	96	102	2012	\N
5607	Max	Pacioretty	67	L	3	18	1988	188	93	83	2012	\N
4859	Alexei	Morozov	24	R	3	13	1977	187	93	89	2011	2013
4834	Oleg	Kvasha	12	R	3	13	1978	195	109	82	2011	2014
3854	Alexander	Sulzer	52	D	2	3	1984	188	96	104	2011	2019
5609	Brady	Tkachuk	7	L	3	18	1999	191	87	87	2018	\N
5602	Jake	Guentzel	59	C	3	18	1994	180	82	89	2017	\N
4761	Yevgeni	Malkin	71	C	3	13	1986	191	87	89	2011	\N
4350	Marek	Zidlicky	3	D	2	6	1977	180	82	86	2011	2015
5136	Johan	Holmqvist	1	G	1	15	1978	187	86	86	2011	2017
4754	Vladislav	Namestnikov	90	C	3	13	1992	182	83	90	2012	\N
4285	Nolan	Patrick	19	C	3	5	1998	189	90	88	2017	\N
4294	Travis	Konecny	11	C	3	5	1997	178	79	88	2018	\N
5613	James	van Riemsdyk	21	L	3	18	1989	193	96	88	2012	\N
4795	Vladislav	Bulyin	4	D	2	13	1972	\N	\N	88	2011	2011
4822	Roman	Zolotov	4	D	2	13	1974	185	89	88	2011	2011
5436	Per-Åge	Skrøder	11	L	3	12	1978	181	88	\N	2011	2016
5296	Dmitri	Khristich	21	R	3	17	1969	188	89	\N	2011	2011
5307	Sergei	Kuzmik	17	C	3	17	1995	186	77	\N	2014	\N
4989	Michal	Handzus	26	C	3	14	1977	196	98	\N	2011	2016
4862	Yevgeni	Namestnikov	6	D	2	13	1971	179	86	\N	2011	2011
5287	Viktor	Zakharov	50	CL	3	17	1994	195	86	\N	2014	\N
4918	Artemi	Panarin	9	R	3	13	1991	180	77	\N	2015	\N
5290	Sergei	Varlamov	17	R	3	17	1978	181	85	\N	2011	2015
5298	Olexander	Matviychuk	24	R	3	17	1975	176	72	\N	2011	2012
5339	Ingemar	Gruber	69	D	2	9	1977	178	84	\N	2011	2019
5284	Maxym	Martyshko	19	R	3	17	1994	175	77	\N	2013	\N
4697	Ronalds	Kenins	15	L	3	11	1991	182	91	\N	2012	\N
4908	Ilya	Kovalchuk	17	L	3	13	1983	188	92	\N	2011	\N
5280	Pavel	Padakin	12	R	3	17	1994	185	90	\N	2016	\N
4910	Alexander	Svitov	15	C	3	13	1982	191	90	\N	2011	2019
5302	Artyom	Gnidenko	28	R	3	17	1980	177	77	\N	2011	2016
4912	Artyom	Chubarov	13	C	3	13	1979	187	86	\N	2011	2011
4855	Boris	Mironov	2	D	2	13	1972	191	100	\N	2011	2011
5303	Alexei	Ponikarovsky	22	L	3	17	1980	195	88	\N	2011	2017
4991	Zdeno	Ciger	8	L	3	14	1969	178	79	\N	2011	2011
4962	Libor	Hudacek	90	L	3	14	1990	175	80	\N	2015	\N
4994	Jozef	Stümpel	22	C	3	14	1972	183	94	\N	2011	2011
4957	Tomas	Bulik	81	C	3	14	1985	178	86	\N	2011	\N
4961	Boris	Sadecky	24	C	3	14	1997	184	84	\N	2018	\N
4992	Miroslav	Satan	32	R	3	14	1974	183	83	\N	2011	2013
4955	Marcel	Hascak	77	L	3	14	1987	183	87	\N	2012	\N
4569	Ari	Ahonen	30	G	1	7	1981	188	81	\N	2011	2017
4909	Fyodor	Tyutin	51	D	2	13	1983	187	84	\N	2011	2016
4945	Branislav	Rapac	81	R	3	14	1993	190	88	\N	2013	\N
5003	Marcel	Hossa	81	L	3	14	1981	183	86	\N	2011	2017
4999	Jan	Lipiansky	9	C	3	14	1974	185	84	\N	2011	2012
4965	Andrej	Kudrna	23	R	3	14	1991	190	92	\N	2014	\N
4902	Artyom	Maryams	4	D	2	13	1980	188	86	\N	2011	2011
4983	Zigmund	Palffy	68	L	3	14	1972	178	77	\N	2011	2012
5225	Luca	Boltshauser	99	G	1	16	1993	183	80	\N	2012	\N
5269	Lukas	Flüeler	30	G	1	16	1988	192	95	\N	2012	\N
5034	Tomas	Hrnka	10	C	3	14	1991	195	95	\N	2013	\N
4981	Richard	Lintner	41	D	2	14	1977	\N	\N	\N	2011	2014
4948	Pavol	Skalicky	28	CR	3	14	1995	195	94	\N	2016	\N
4995	Ladislav	Karabin	24	F	3	14	1970	\N	\N	\N	2011	2011
4892	Vadim	Sharifijanov	10	F	3	13	1975	\N	\N	\N	2011	2011
4996	Vladimir	Buril	4	D	2	14	1969	191	96	\N	2011	2011
5018	Samuel	Bucek	25	L	3	14	1998	190	87	\N	2018	\N
4977	Richard	Zednik	44	R	3	14	1976	178	77	\N	2011	2011
4738	Janis	Andersons	5	D	2	11	1986	187	88	\N	2011	\N
5098	Per	Gustafsson	4	D	2	15	1970	185	85	\N	2011	2011
5119	Marcus	Ragnarsson	33	D	2	15	1971	185	90	\N	2011	2011
4664	Vincent	Bachet	35	D	2	8	1978	179	85	\N	2011	2013
4985	Robert	Petrovicky	39	C	3	14	1973	180	78	\N	2011	2015
4594	Urho	Vaakanainen	5	D	2	7	1999	185	85	79	2018	\N
5028	Peter	Cehlarik	26	R	3	14	1995	188	91	79	2014	\N
4921	Enver	Lisin	81	R	3	13	1986	188	86	133	2011	\N
4477	Teemu	Eronen	21	D	2	7	1990	179	79	107	2012	\N
4929	Nail	Yakupov	10	L	3	13	1993	180	73	101	2012	\N
5005	Roman	Kukumberg	26	C	3	14	1980	184	86	91	2011	\N
4552	Mika	Strömberg	26	D	2	7	1970	\N	\N	97	2011	2011
4698	Roberts	Jekimovs	91	L	3	11	1989	180	90	\N	2012	\N
5279	Alexander	Toryanik	88	R	3	17	1990	195	105	\N	2012	2017
5283	Dmitri	Nimenko	21	F	3	17	1988	177	77	\N	2012	\N
4898	Oleg	Saprykin	19	C	3	13	1981	182	66	\N	2011	2015
4916	Kirill	Petrov	90	R	3	13	1990	191	100	85	2012	\N
4496	Hannu	Toivonen	54	G	1	7	1984	190	93	79	2011	2018
4470	Oskari	Laaksonen	5	D	2	7	1999	188	75	80	2018	\N
5011	Marek	Dubec	17	R	3	14	1982	183	83	80	2011	2017
4924	Dmitri	Orlov	9	D	2	13	1991	182	95	92	2012	\N
4970	Lubomir	Vaic	24	C	3	14	1977	172	82	108	2011	2016
5002	Rene	Vydareny	81	D	2	14	1981	186	88	108	2011	\N
4936	Valeri	Nichushkin	43	R	3	13	1995	192	89	99	2013	\N
4478	Esa	Lindell	6	D	2	7	1994	191	94	99	2014	\N
4949	Matej	Paulovic	13	L	3	14	1995	191	89	99	2016	\N
4934	Kirill	Kaprizov	7	L	3	13	1997	178	91	103	2016	\N
5027	Tomas	Tatar	21	L	3	14	1990	177	80	100	2012	\N
4954	Tomas	Jurco	13	RL	3	14	1992	188	85	100	2012	\N
4942	Vladimir	Kutny	49	L	3	14	1985	192	90	100	2011	\N
4967	Juraj	Mikus	71	C	3	14	1987	186	90	83	2011	\N
5020	Martin	Reway	87	L	3	14	1995	178	79	83	2015	\N
4299	Ryan	Ellis	4	D	2	5	1991	178	83	104	2012	\N
4485	Teemu	Laakso	45	D	2	7	1987	180	90	104	2012	2017
5501	Jonathon	Blum	7	D	2	18	1989	185	84	104	2012	\N
4473	Harri	Säteri	29	G	1	7	1989	185	86	106	2013	\N
5023	Marek	Viedensky	25	C	3	14	1990	193	95	106	2014	\N
4914	Nikita	Kucherov	86	R	3	13	1993	180	78	90	2013	\N
5030	Richard	Panik	71	R	3	14	1991	187	92	90	2012	\N
4699	Oskars	Bartulis	3	D	2	11	1987	186	87	88	2011	\N
5481	Shayne	Gostisbehere	53	D	2	18	1993	180	81	88	2015	\N
4919	Grigori	Denisenko	14	L	3	13	2000	181	80	82	2018	\N
4944	Radoslav	Illo	17	C	3	14	1990	183	87	94	2014	2017
5343	Alessio	Zandegiacomo	14	D	2	9	1980	186	82	\N	2011	2011
4907	Alexander	Frolov	24	R	3	13	1982	191	88	102	2011	2018
4925	Alexander	Perezhogin	42	R	3	13	1983	180	84	83	2011	2018
4990	Marian	Hossa	18	R	3	14	1979	189	90	\N	2011	2016
5022	Jan	Sykora	11	R	3	14	1990	189	80	\N	2012	\N
5008	Martin	Hujsa	19	L	3	14	1979	177	65	\N	2011	2016
5010	Michal	Hudec	12	C	3	14	1979	177	80	\N	2011	2017
5173	Andreas	Borgman	55	D	2	15	1995	183	92	\N	2017	\N
5097	Stefan	Bergqvist	33	D	2	15	1975	191	99	\N	2011	2011
5508	Bryan	Berard	3	D	2	18	1977	185	86	\N	2011	2011
5196	Johnny	Oduya	29	D	2	15	1981	182	89	\N	2011	2017
4536	Toni	Lydman	7	D	2	7	1977	186	90	\N	2011	2012
5242	Julien	Vauclair	79	D	2	16	1979	185	88	\N	2011	2019
5106	Mats	Lindgren	24	C	3	15	1974	186	90	\N	2011	2011
5237	Benjamin	Winkler	52	D	2	16	1977	179	74	\N	2011	2014
5055	Mattias	Sjögren	33	C	3	15	1987	187	95	\N	2012	\N
4567	Ossi	Väänänen	9	D	2	7	1980	191	92	\N	2011	2015
5042	Marek	Hecl	70	L	3	14	1997	176	76	\N	2018	\N
5137	Kristian	Huselius	11	L	3	15	1978	187	86	\N	2011	2012
5099	Johan	Davidsson	22	C	3	15	1976	\N	\N	\N	2011	2013
4745	Rihards	Bukarts	8	L	3	11	1995	179	84	\N	2018	\N
5100	Andreas	Dackell	10	R	3	15	1972	178	86	\N	2011	2011
5103	Andreas	Karlsson	15	C	3	15	1975	188	84	\N	2011	2011
5512	Steve	Konowalchuk	22	L	3	18	1972	182	82	\N	2011	2011
4632	Stephane	Da Costa	24	C	3	8	1989	180	80	\N	2012	\N
4633	Nicolas	Arrossamena	90	L	3	8	1990	181	79	\N	2011	\N
5359	Michele	Stevan	16	L	3	9	1993	182	85	\N	2014	\N
5348	Simon	Kostner	23	C	3	9	1990	173	74	\N	2014	\N
4743	Miks	Indrasis	70	RL	3	11	1990	190	72	\N	2012	\N
5356	Michele	Marchetti	68	L	3	9	1994	185	83	\N	2017	\N
5344	Fabrizio	Fontanive	27	C	3	9	1977	173	78	\N	2011	2011
4652	Maurice	Rozenthal	9	L	3	8	1975	177	77	\N	2011	2011
4663	Luc	Chauvel	20	L	3	8	1975	178	82	\N	2011	2011
5335	Armando	Chelodi	8	C	3	9	1973	179	82	\N	2011	2011
5159	Jimmie	Ölvestad	19	L	3	15	1980	185	85	\N	2011	2011
5085	Rasmus	Dahlin	26	D	2	15	2000	190	84	80	2017	\N
5046	Gabriel	Landeskog	92	L	3	15	1992	185	93	97	2012	\N
5257	David	Jobin	72	D	2	16	1981	177	75	\N	2011	2016
5458	Clayton	Keller	9	C	3	18	1998	178	79	133	2017	\N
5584	Erik	Johnson	6	D	2	18	1988	193	100	107	2012	\N
5071	Simon	Hjalmarsson	11	L	3	15	1989	184	78	107	2012	\N
5083	Patrik	Berglund	21	C	3	15	1988	192	90	107	2011	\N
5497	Philip	McRae	18	C	3	18	1990	188	85	107	2013	\N
5568	Jake	Gardiner	51	D	2	18	1990	188	88	94	2015	\N
5050	Isac	Lundeström	37	C	3	15	1999	184	84	94	2018	\N
5089	William	Karlsson	20	C	3	15	1993	184	81	94	2014	\N
5075	Rickard	Rakell	67	C	3	15	1993	188	91	94	2016	\N
5207	Linus	Omark	67	L	3	15	1987	180	82	101	2012	\N
5178	Magnus	Pääjärvi	91	L	3	15	1991	188	92	101	2012	\N
5182	Petter	Granberg	8	D	2	15	1992	191	90	91	2012	\N
5074	Daniel	Brodin	34	R	3	15	1990	186	82	91	2012	\N
5180	Carl	Grundström	3	L	3	15	1997	184	88	91	2016	\N
5170	William	Nylander	29	C	3	15	1996	181	86	91	2017	\N
5088	Alexander	Steen	10	L	3	15	1984	183	92	91	2011	2019
5460	Paul	Stastny	26	C	3	18	1985	186	96	97	2011	\N
5183	Elias	Lindholm	16	C	3	15	1994	184	87	81	2014	\N
5210	Victor	Rask	49	C	3	15	1993	188	90	81	2015	\N
4640	Guillaume	Leclerc	22	C	3	8	1996	173	82	\N	2018	\N
4731	Viktors	Blinovs	11	L	3	11	1981	176	80	\N	2011	2012
5076	Sebastian	Aho	63	D	2	15	1996	177	80	85	2016	\N
5047	Johan	Sundström	28	C	3	15	1992	189	91	85	2015	\N
5500	Brock	Nelson	29	C	3	18	1991	191	84	85	2014	\N
5080	John	Persson	27	L	3	15	1992	186	81	85	2015	2020
5193	Alexander	Edler	23	D	2	15	1986	192	96	108	2012	\N
5179	Filip	Forsberg	9	L	3	15	1994	187	82	92	2013	\N
5591	Zach	Bogosian	44	D	2	18	1990	188	89	93	2012	\N
5469	Johnny	Gaudreau	13	L	3	18	1993	174	71	95	2014	\N
5471	Matthew	Tkachuk	19	L	3	18	1997	188	92	95	2018	\N
5171	Mikael	Backlund	11	C	3	15	1989	184	90	95	2012	\N
5041	Ondrej	Otcenas	82	C	3	14	1987	188	84	81	2012	2013
5477	Louie	Belpedio	47	D	2	18	1996	180	88	103	2018	\N
5176	Jonas	Brodin	25	D	2	15	1993	185	78	103	2012	\N
5054	Joel	Eriksson	20	CL	3	15	1997	189	92	103	2016	\N
5483	Alex	Galchenyuk	27	C	3	18	1994	185	90	83	2012	\N
5066	Jacob	de la Rose	25	CL	3	15	1995	188	90	83	2014	\N
5082	Mattias	Tedenby	21	L	3	15	1990	178	79	84	2012	\N
5205	Jesper	Bratt	63	L	3	15	1998	179	79	84	2018	\N
5051	Patric	Hörnqvist	27	R	3	15	1987	180	84	104	2012	\N
5575	Seth	Jones	3	D	2	18	1994	193	94	104	2015	\N
4737	Lauris	Darzins	9	L	3	11	1985	189	90	104	2011	\N
5070	Marcus	Sörensen	66	L	3	15	1992	181	75	87	2015	\N
5503	Colin	White	36	C	3	18	1997	183	83	87	2018	\N
5035	David	Skokan	96	CL	3	14	1988	178	74	86	2011	\N
4734	Rudolfs	Balcers	92	L	3	11	1997	180	75	106	2015	\N
5506	Tommy	Wingels	57	C	3	18	1988	183	83	106	2012	2019
5188	Oskar	Lindblom	96	L	3	15	1996	187	89	88	2016	\N
4733	Janis	Sprukts	5	C	3	11	1982	190	108	82	2011	\N
5499	James	Wisniewski	20	D	2	18	1984	182	89	96	2011	2017
5077	Joakim	Nordström	13	L	3	15	1992	185	75	96	2012	\N
5464	Kevin	Hayes	13	C	3	18	1992	196	102	96	2015	\N
5476	Alex	DeBrincat	12	L	3	18	1997	171	75	96	2018	\N
4728	Aigars	Cipruss	29	R	3	11	1972	182	85	\N	2011	2011
5491	R.J.	Umberger	20	L	3	18	1982	188	98	\N	2011	2015
5511	Adam	Deadmarsh	18	C	3	18	1975	180	88	\N	2011	2011
5362	Max	Oberrauch	6	L	3	9	1984	185	88	\N	2011	\N
5354	Diego	Iori	4	L	3	9	1986	174	80	\N	2011	\N
4635	Antoine	Roussel	27	L	3	8	1989	182	77	\N	2011	\N
4645	Charles	Bertrand	33	L	3	8	1991	186	86	\N	2012	\N
4674	Nicolas	Ritz	10	C	3	8	1992	180	73	\N	2012	\N
5316	Anton	Bernard	23	C	3	9	1989	178	82	\N	2012	\N
5323	Markus	Gander	3	R	3	9	1989	187	85	\N	2012	\N
4681	Dimitri	Thillet	47	C	3	8	1993	186	89	\N	2013	\N
5384	Alikhan	Asetov	96	R	3	10	1996	186	96	\N	2018	\N
5353	Ivan	Deluca	46	F	3	9	1997	193	93	\N	2017	\N
4571	Juha	Hautamaa	20	C	3	7	1973	179	83	\N	2011	2011
5377	Andrei	Samokhvalov	19	L	3	10	1975	175	80	\N	2011	2011
4576	Tuomo	Ruutu	15	C	3	7	1983	185	92	\N	2011	2016
5374	Pyotr	Devyatkin	29	R	3	10	1977	180	80	\N	2011	2011
4526	Saku	Koivu	11	C	3	7	1974	177	80	\N	2011	2013
4537	Tommi	Miettinen	22	C	3	7	1975	180	82	\N	2011	2012
4513	Timo	Vertala	37	L	3	7	1978	183	83	\N	2011	2011
4683	Floran	Douay	72	L	3	8	1995	190	88	\N	2016	\N
4517	Juha	Ylönen	29	C	3	7	1972	184	96	\N	2011	2011
5545	Erik	Rasmussen	9	C	3	18	1977	186	92	\N	2011	2011
4684	Maurin	Bouvet	15	C	3	8	1995	182	82	\N	2018	\N
5560	Ryan	Kesler	20	C	3	18	1984	188	93	\N	2011	\N
4518	Olli	Jokinen	21	C	3	7	1978	186	95	\N	2011	2014
4675	Loic	Lamperier	9	CL	3	8	1989	186	89	\N	2012	\N
4623	Antti	Kalapudas	51	CL	3	7	1996	182	73	\N	2017	\N
4634	Bastien	Maia	15	RL	3	8	1997	187	77	\N	2017	\N
5378	Anatoli	Filatov	22	F	3	10	1975	179	78	\N	2011	2011
5543	Darby	Hendrickson	14	C	3	18	1972	182	84	\N	2011	2011
4521	Timo	Pärssinen	27	L	3	7	1977	178	81	\N	2011	2014
5216	Simon	Moser	89	C	3	16	1989	188	94	\N	2012	\N
5644	Radovan	Pavlik	98	L	3	6	1998	177	74	\N	2019	\N
5215	Damien	Brunner	24	RL	3	16	1986	180	83	\N	2012	\N
5250	Nicola	Celio	16	R	3	16	1972	184	87	\N	2011	2011
5233	Mattia	Baldi	45	L	3	16	1977	183	87	\N	2011	2011
4613	Teemu	Pulkkinen	6	L	3	7	1992	180	82	100	2012	\N
4581	Mikko	Koivu	9	C	3	7	1983	188	85	\N	2011	2019
4599	Eeli	Tolvanen	20	L	3	7	1999	179	82	104	2017	\N
4643	Nicolas	Antonoff	9	R	3	8	1981	189	85	\N	2011	2014
4608	Joel	 Armia	10	R	3	7	1993	193	90	80	2012	\N
4495	Lauri	Korpikoski	28	L	3	7	1986	185	82	86	2011	\N
5191	Martin	Samuelsson	43	R	3	15	1982	189	87	\N	2011	2011
4607	Sebastian	Aho	20	R	3	7	1997	181	78	81	2015	\N
4593	Alexander	Ruuttu	9	C	3	7	1992	183	78	133	2013	\N
5561	Christian	Dvorak	18	CL	3	18	1996	183	85	133	2017	\N
4491	Toni	Rajala	10	L	3	7	1991	178	74	101	2015	\N
4591	Teemu	Hartikainen	35	CL	3	7	1990	185	89	101	2012	\N
5567	T.J.	Galiardi	21	C	3	18	1988	188	77	97	2012	2017
4631	Erwan	Pain	81	L	3	8	1986	178	83	\N	2011	2017
5351	Patrick	Rizzo	98	CL	3	9	1988	176	70	\N	2014	\N
5312	Marcello	Borghi	23	R	3	9	1993	188	83	\N	2013	\N
5338	Manuel	De Toni	28	L	3	9	1979	181	80	\N	2011	2016
5366	Yevgeni	Rymarev	18	L	3	10	1988	176	72	\N	2011	\N
5365	Yesmukhan	Tolepbergen	21	F	3	10	1993	180	80	\N	2014	\N
4685	Brian	Henderson	20	C	3	8	1986	180	78	\N	2012	2018
5350	Jan	Waldner	18	F	3	9	1992	177	84	\N	2014	2014
5381	Dmitri	Upper	23	L	3	10	1978	178	80	85	2011	2015
4482	Jesse	Joensuu	11	L	3	7	1987	191	96	85	2012	\N
4597	Otto	Koivula	12	RL	3	7	1998	193	100	85	2016	\N
4626	Masi	Marjamäki	15	L	3	7	1985	188	93	85	2011	\N
5213	Elias	Pettersson	40	CR	3	15	1998	188	75	108	2017	\N
4596	Kristian	Vesalainen	93	LR	3	7	1999	190	92	93	2017	\N
4612	Max	Wärn	4	R	3	7	1988	189	88	99	2012	2018
4578	Jussi	Jokinen	8	L	3	7	1983	186	88	99	2011	2020
5563	Dylan	Larkin	71	C	3	18	1996	185	86	100	2015	\N
4508	Juuso	Puustinen	71	RL	3	7	1988	187	88	95	2014	\N
5268	Sven	Bärtschi	47	L	3	16	1992	178	83	95	2012	\N
4586	Rasmus	Kupari	19	C	3	7	2000	186	84	102	2018	\N
5566	Trevor	Lewis	22	C	3	18	1987	185	89	102	2012	\N
5256	Flavien	Conne	4	C	3	16	1980	177	81	102	2011	2013
5273	Julien	Sprunger	86	R	3	16	1986	194	90	103	2011	\N
4592	Artturi	Lehkonen	62	L	3	7	1995	181	74	83	2013	\N
5595	Zach	Parise	9	L	3	18	1984	181	86	84	2011	\N
5230	Mauro	Jörg	61	RL	3	16	1990	184	87	84	2012	\N
4504	Vili	Sopanen	15	R	3	7	1987	193	94	84	2011	2019
5271	Kevin	Fiala	18	L	3	16	1996	180	88	104	2014	\N
5587	Nick	Foligno	71	L	3	18	1987	183	85	87	2012	\N
5218	Roman	Wick	27	RL	3	16	1985	187	90	87	2011	2020
5589	Chris	Kreider	20	L	3	18	1991	188	93	86	2012	\N
4503	Kaapo	Kakko	24	R	3	7	2001	187	86	86	2018	\N
5574	Charlie	Coyle	3	CR	3	18	1992	191	98	106	2015	\N
4487	Aleksander	Barkov	16	C	3	7	1995	191	96	82	2012	\N
4505	Joonas	Donskoi	72	R	3	7	1992	183	83	82	2013	\N
5572	Nick	Bjugstad	27	C	3	18	1992	193	93	82	2013	\N
4499	Henrik	Borgström	95	C	3	7	1997	191	84	82	2018	\N
4589	Iiro	Pakarinen	18	RL	3	7	1991	185	88	82	2012	\N
4605	Teuvo	Teräväinen	86	L	3	7	1994	180	80	96	2015	\N
5578	Brandon	Saad	20	L	3	18	1992	188	96	96	2012	\N
5370	Konstantin	Savenkov	26	CL	3	10	1990	183	79	\N	2012	\N
5652	Benjamin	Lanzinger	42	L	3	1	2000	173	77	\N	2019	\N
5636	Radek	Koblizek	29	L	3	6	1997	175	73	\N	2019	\N
5238	Patric	Della Rossa	15	L	3	16	1975	186	92	\N	2011	2011
5632	Mario	Grman	7	D	2	14	1997	185	89	\N	2019	\N
5247	Patrick	Fischer	8	C	3	16	1975	181	86	\N	2011	2011
5647	Jan	Dufek	44	R	3	6	1997	183	83	\N	2019	\N
5645	Vojtech	Budik	49	D	2	6	1998	185	92	\N	2019	\N
5640	Jonas	Arntzen	31	G	1	12	1997	191	86	\N	2019	\N
5648	Colin	Ugbekile	79	D	2	3	1999	186	90	\N	2019	\N
5657	Marcel	Dlugos	55	D	2	14	2000	193	94	\N	2019	\N
5251	Thomas	Ziegler	43	R	3	16	1978	179	79	\N	2011	2011
5558	Ty	Jones	27	R	3	18	1978	192	98	\N	2011	2011
5551	Chris	Drury	37	C	3	18	1976	\N	\N	\N	2011	2011
5655	Tim	Berni	96	D	2	16	2000	183	83	98	2019	0
5646	Lukas	Rousek	10	L	3	6	1999	180	75	80	2019	0
5637	Daniil	Tarasov	40	G	1	13	1999	196	84	98	2019	0
5654	Janis	Moser	90	D	2	16	1997	184	74	133	2019	0
5642	Samuel	Fagemo	11	L	3	15	2000	182	88	102	2019	0
5633	Jakub	Galvas	79	D	2	6	1999	181	75	96	2019	0
5631	Matias	Maccelli	72	L	3	7	2000	180	75	133	2019	0
5669	Colton	White	2	D	2	5	1997	185	84	84	2019	0
5668	Gabriel	Vilardi	42	C	3	5	1999	191	91	102	2019	0
5672	Yegor	Sharangovich	17	C	3	2	1998	187	93	84	2019	0
5670	Jack	Hughes	86	C	3	18	2001	179	77	84	2019	0
5671	Noah	Dobson	8	D	2	5	2000	193	83	85	2019	0
5634	Ville	Heinola	14	D	2	7	2001	181	82	93	2019	0
5675	Joachim	Blichfeld	86	RL	3	4	1998	187	85	\N	2019	\N
3771	Michael	Puschacher	29	G	1	1	1968	\N	\N	\N	2011	2011
3770	Martin	Krainz	22	D	2	1	1967	\N	\N	\N	2011	2011
4136	Stephane	Richer	60	R	3	5	1966	188	98	\N	2011	2011
5096	Peter	Andersson	14	R	3	15	1965	176	68	\N	2011	2011
5234	Samuel	Balmer	4	D	2	16	1968	\N	\N	\N	2011	2011
4054	Ed	Belfour	20	G	1	5	1965	180	83	\N	2011	2011
4790	Sergei	Bautin	8	D	2	13	1967	177	84	\N	2011	2011
4969	Peter	Bondra	12	R	3	14	1968	183	92	\N	2011	2011
4183	Rob	Brown	44	R	3	5	1968	\N	\N	\N	2011	2011
4800	Ilya	Byakin	3	D	2	13	1963	174	70	\N	2011	2011
4340	Oldrich	Valek	26	F	3	6	1960	170	78	\N	2011	2011
4813	Yevgeni	Davydov	11	R	3	13	1967	177	77	\N	2011	2011
5101	Ulf	Dahlen	11	F	3	15	1967	189	88	\N	2011	2011
4511	Timo	Blomqvist	2	D	2	7	1961	172	81	\N	2011	2011
4515	Jari	Grönstrand	2	D	2	7	1962	173	73	\N	2011	2011
4656	Antoine	Mindjimba	31	G	1	8	1968	180	82	\N	2011	2011
4339	Petr	Briza	1	G	1	6	1964	\N	\N	\N	2011	2011
4448	Dominik	Hasek	30	G	1	6	1965	\N	\N	\N	2011	2011
4806	Igor	Vyazmikin	10	F	3	13	1966	176	69	\N	2011	2011
4081	Steve	Duchesne	28	D	2	5	1965	180	89	\N	2011	2011
4082	Zarley	Zalapski	25	D	2	5	1968	185	98	\N	2011	2011
4349	Libor	Dolana	22	F	3	6	1964	175	84	\N	2011	2011
4073	Ken	Daneyko	7	D	2	5	1964	183	95	\N	2011	2011
4821	Valeri	Zelepukin	22	L	3	13	1968	180	86	\N	2011	2011
4793	Oleg	Bratash	2	G	1	13	1966	176	77	\N	2011	2011
4080	Vincent	Damphousse	25	C	3	5	1967	185	90	\N	2011	2011
4364	Jiri	Kucera	20	R	3	6	1966	176	75	\N	2011	2011
4367	Ladislav	Lubina	18	R	3	6	1967	177	88	\N	2011	2011
4097	Claude	Lemieux	24	R	3	5	1965	185	98	\N	2011	2011
4134	Mark	Recchi	32	R	3	5	1968	178	84	\N	2011	2011
5643	Dominik	Lakatos	31	CL	3	6	1997	184	88	\N	2019	\N
5241	Vjieran	Ivankovic	12	F	3	16	1975	190	90	\N	2011	2011
5248	Patrick	Howald	10	F	3	16	1969	\N	\N	\N	2011	2011
4531	Tero	Lehterä	17	F	3	7	1972	184	75	\N	2011	2011
4407	Jiri	Sejba	28	F	3	6	1962	173	79	\N	2011	2011
3769	Werner	Kerth	9	F	3	1	1966	\N	\N	\N	2011	2011
4060	Sean	Burke	1	G	1	5	1967	192	95	\N	2011	2011
4062	Mike	Vernon	29	G	1	5	1963	175	77	\N	2011	2011
4376	Michal	Pivonka	20	C	3	6	1966	188	90	\N	2011	2011
4117	Kirk	Muller	27	C	3	5	1966	183	93	\N	2011	2011
4122	Joe	Nieuwendyk	29	C	3	5	1966	185	89	\N	2011	2011
4063	Claude	Vilgrain	18	F	3	5	1963	174	79	\N	2011	2011
4059	Mike	Bullard	60	F	3	5	1961	171	71	\N	2011	2011
4029	Wayne	Gretzky	99	C	3	5	1961	\N	\N	\N	2011	2011
4066	Doug	Gilmour	93	C	3	5	1963	180	78	\N	2011	2011
4071	Kevin	Dineen	16	R	3	5	1963	180	86	\N	2011	2011
4090	Wendel	Clark	14	L	3	5	1966	180	88	\N	2011	2011
4096	Grant	Ledyard	4	D	2	5	1961	188	89	\N	2011	2011
4371	Frantisek	Musil	6	D	2	6	1964	190	98	\N	2011	2011
4106	Al	MacInnis	2	D	2	5	1963	188	90	\N	2011	2011
4099	Doug	Lidster	3	D	2	5	1960	185	90	\N	2011	2011
4098	Sylvain	Lefebvre	3	D	2	5	1967	188	93	\N	2011	2011
5253	Rene	Stüssi	22	F	3	16	1978	\N	\N	94	2011	2011
4352	Richard	Zemlicka	13	R	3	6	1964	175	77	101	2011	2011
5278	Fabrice	Herzog	61	RL	3	16	1994	188	80	91	2016	\N
5217	Nino	Niederreiter	25	L	3	16	1992	184	94	85	2011	\N
5667	Tobias	Björnfot	33	D	2	15	2001	184	92	102	2019	\N
5276	Nico	Hischier	13	C	3	16	1999	186	81	84	2017	\N
4115	Sergio	Momesso	35	L	3	5	1965	190	98	\N	2011	2011
4093	Shayne	Corson	15	L	3	5	1966	185	91	\N	2011	2011
5526	Jeff	Norton	7	D	2	18	1965	188	86	\N	2011	2011
4150	Scott	Stevens	4	D	2	5	1964	188	95	\N	2011	2011
4360	Petr	Klima	25	R	3	6	1964	183	86	\N	2011	2011
4975	Jaromir	Dragan	31	G	1	14	1963	\N	\N	\N	2011	2011
4866	Sergei	Petrenko	10	L	3	13	1968	178	85	\N	2011	2011
4968	Mojmir	Bozik	28	D	2	14	1962	173	81	\N	2011	2011
4156	Rick	Tocchet	92	R	3	5	1964	183	93	\N	2011	2011
4138	Cliff	Ronning	19	C	3	5	1965	173	77	\N	2011	2011
5507	Tom	Barrasso	1	G	1	18	1966	190	95	\N	2011	2011
4978	Lubomir	Kolnik	10	R	3	14	1968	181	85	\N	2011	2011
4811	Alexei	Gusarov	5	D	2	13	1964	188	77	\N	2011	2011
4168	Theo	Fleury	14	R	3	5	1968	168	73	\N	2011	2011
5327	David	Delfino	33	G	1	9	1965	\N	\N	\N	2011	2011
4170	Ron	Francis	20	C	3	5	1963	183	91	\N	2011	2011
4878	Anatoli	Semyonov	44	C	3	13	1962	187	87	\N	2011	2011
4167	Ray	Ferraro	32	C	3	5	1964	178	84	\N	2011	2011
4126	James	Patrick	5	D	2	5	1963	188	91	\N	2011	2011
5534	Kevin	Stevens	26	L	3	18	1965	190	98	\N	2011	2011
4829	Vitali	Karamnov	12	L	3	13	1968	177	77	\N	2011	2011
4157	Steve	Thomas	22	L	3	5	1963	180	84	\N	2011	2011
4137	Luc	Robitaille	20	L	3	5	1966	185	86	\N	2011	2011
4979	Petr	Korinek	7	C	3	14	1966	185	94	\N	2011	2011
4863	Sergei	Nemchinov	27	C	3	13	1964	183	91	\N	2011	2011
4110	Marty	McSorley	33	D	2	5	1963	185	102	\N	2011	2011
4398	Eduard	Uvira	8	D	2	6	1961	\N	\N	\N	2011	2011
4394	Antonin	Stavjana	3	D	2	6	1963	175	75	\N	2011	2011
4390	Petr	Svoboda	23	D	2	6	1966	185	80	\N	2011	2011
4355	Drahomir	Kadlec	5	D	2	6	1965	176	83	\N	2011	2011
5138	Tommy	Sjödin	20	D	2	15	1965	176	76	\N	2011	2011
5105	Åke	Lilljebjörn	30	G	1	15	1962	173	75	\N	2011	2011
4889	Yuri	Khmylyov	13	L	3	13	1964	185	85	\N	2011	2011
4972	Peter	Veselovsky	17	F	3	14	1964	\N	\N	\N	2011	2011
4648	Steven	Woodburn	7	D	2	8	1963	175	78	\N	2011	2011
4665	Serge	Djelloul	16	D	2	8	1966	185	95	\N	2011	2011
5235	Sandro	Bertaggia	3	D	2	16	1964	\N	\N	\N	2011	2011
5673	Jordan	Greenway	18	RL	3	18	1997	197	103	103	2019	0
5676	Dante	Fabbro	57	D	2	5	1998	183	86	104	2019	0
5674	Adam	Fox	23	D	2	18	1998	180	82	95	2019	0
5678	Quinn	Hughes	43	D	2	18	1999	178	77	108	2019	0
4709	Harijs	Vitolins	10	R	3	11	1968	189	83	\N	2011	2011
4647	Philippe	Bozon	14	L	3	8	1966	176	80	\N	2011	2011
5328	Bruno	Zarrillo	10	R	3	9	1966	181	77	\N	2011	2011
5113	Fredrik	Olausson	6	D	2	15	1966	188	89	\N	2011	2011
5520	Brian	Leetch	6	D	2	18	1968	180	89	\N	2011	2011
5124	Ulf	Samuelsson	5	D	2	15	1964	185	89	\N	2011	2011
5122	Leif	Rohlin	27	D	2	15	1968	183	89	\N	2011	2011
5118	Peter	Popovic	34	D	2	15	1968	195	108	\N	2011	2011
5542	Kevin	Hatcher	4	D	2	18	1966	193	102	\N	2011	2011
4543	Teppo	Numminen	27	D	2	7	1968	185	86	\N	2011	2011
4535	Jyrki	Lumme	21	D	2	7	1966	185	94	\N	2011	2011
4529	Pekka	Laksola	3	D	2	7	1964	175	76	\N	2011	2011
4651	Denis	Perez	6	D	2	8	1965	184	94	\N	2011	2011
4649	Jean-Philippe	Lemoine	16	D	2	8	1964	\N	\N	\N	2011	2011
4551	Petri	Skriko	26	L	3	7	1962	173	74	\N	2011	2011
4544	Janne	Ojanen	16	L	3	7	1968	178	85	\N	2011	2011
5546	Gary	Roberts	10	L	3	18	1966	183	86	\N	2011	2011
4555	Esa	Tikkanen	11	L	3	7	1968	185	90	\N	2011	2011
5334	Lucio	Topatigh	7	L	3	9	1965	182	89	\N	2011	2011
4872	Sergei	Pryakhin	11	F	3	13	1963	174	74	\N	2011	2011
5606	Pat	LaFontaine	12	F	3	18	1965	\N	\N	\N	2011	2011
4850	Yuri	Leonov	22	F	3	13	1963	175	76	\N	2011	2011
4383	Radim	Radevic	17	F	3	6	1966	176	76	\N	2011	2011
4387	Petr	Rosol	10	F	3	6	1964	175	76	\N	2011	2011
4414	Otakar	Janecky	14	F	3	6	1960	\N	\N	\N	2011	2011
5115	Håkan	Åhlund	18	F	3	15	1967	\N	\N	\N	2011	2011
4539	Mikko	Mäkelä	26	F	3	7	1965	176	77	\N	2011	2011
5255	Peter	Jaks	20	F	3	16	1966	\N	\N	\N	2011	2011
4557	Jari	Torkki	16	F	3	7	1965	\N	\N	\N	2011	2011
5330	Martin	Pavlu	2	F	3	9	1962	\N	\N	\N	2011	2011
4650	Franck	Pajonkowski	9	F	3	8	1964	193	103	\N	2011	2011
4560	Raimo	Helminen	11	C	3	7	1964	175	75	\N	2011	2011
5244	Gil	Montandon	18	R	3	16	1965	\N	\N	\N	2011	2011
5133	Thomas	Forslund	27	R	3	15	1968	178	70	\N	2011	2011
5680	Daniil	Chayka	73	D	2	13	2002	190	84	\N	2020	\N
5688	Valeri	Orekhov	74	D	2	10	1999	186	88	\N	2020	\N
5690	Alexandre	Pascal	19	D	2	8	1998	188	95	\N	2020	\N
5691	Vincent	Melin	7	D	2	8	1998	182	84	\N	2020	\N
5692	Robin	Colomban	29	CL	3	8	1997	189	87	\N	2020	\N
5681	Dmitri	Samorukov	58	D	2	13	1999	189	90	101	2020	\N
5682	Artur	Akhtyamov	31	G	1	13	2001	185	71	91	2020	\N
5516	Jimmy	Carson	15	F	3	18	1968	185	91	81	2011	2011
4913	Ivan	Kasutin	37	G	1	13	1986	182	80	\N	2012	2018
4877	Alexander	Semak	22	C	3	13	1966	178	82	108	2011	2011
5683	Alexander	Alexeyev	56	D	2	13	1999	193	91	92	2020	\N
5693	Milos	Roman	40	C	3	14	1999	182	85	95	2020	\N
5684	Daniil	Misyul	93	D	2	13	2000	191	85	84	2020	\N
5686	Shakir	Mukhamadullin	85	D	2	13	2002	189	77	84	2020	\N
4628	Aleksi	Saarela	87	C	3	7	1997	180	90	86	2015	\N
5687	Sergei	Zborovsky	2	D	2	13	1997	193	95	86	2020	\N
4549	Jukka	Seppo	9	F	3	7	1968	178	78	88	2011	2011
5689	Matej	Tomek	33	G	1	14	1997	191	82	88	2020	\N
5685	Vladislav	Kolyachonok	18	D	2	2	2001	186	88	82	2020	\N
5703	Jakob	Rabanser	1	G	1	9	2000	205	85	\N	2020	\N
5704	Hannes	Stoll	33	G	1	9	1999	178	75	\N	2020	\N
5706	Tobias	Fohrler	5	D	2	3	1997	195	105	\N	2020	\N
5707	Julian	Payr	8	D	2	1	2000	193	85	\N	2020	\N
5708	Davide	Fadani	35	G	1	9	2001	182	76	\N	2020	\N
5709	Sandis	Smons	81	D	2	11	1999	180	86	\N	2020	\N
5710	Andrei	Pavlenko	70	R	3	2	2000	185	78	\N	2020	\N
5711	Pavel	Azhgirei	12	R	3	2	2000	197	87	\N	2020	\N
5713	Jakob	Jessen	5	D	2	4	1998	180	85	\N	2020	\N
5663	David	Madsen	23	CR	3	4	1999	187	98	\N	2019	\N
5630	Filip	Krivosik	27	CR	3	14	1999	193	94	\N	2019	0
3908	Maximilian	Kammerer	9	CL	3	3	1996	185	75	\N	2016	\N
3855	Matthias	Plachta	22	CL	3	3	1991	188	100	\N	2013	\N
3765	Thomas	Hundertpfund	27	CR	3	1	1989	188	84	\N	2012	\N
4442	Jakub	Orsava	27	RL	3	6	1991	182	82	\N	2012	\N
5139	Per-Erik	Eklund	9	F	3	15	1963	175	80	\N	2011	2011
4845	Alexander	Korolyuk	12	L	3	13	1976	175	85	\N	2011	2014
5715	Kevin	Lankinen	32	G	1	7	1995	187	84	\N	2019	\N
3750	Patrick	Peter	14	D	2	1	1994	185	90	\N	2014	2020
3836	Andrei	Korshunov	3	D	2	2	1983	177	73	\N	2011	2019
3972	Simon	Nielsen	31	G	1	4	1986	188	86	\N	2012	2020
5397	Joachim	Svendsen	30	G	1	12	1994	182	83	\N	2017	2020
4926	Alexei	Semyonov	5	D	2	13	1981	198	95	\N	2011	2020
4906	Anton	Volchenkov	3	D	2	13	1982	183	100	\N	2011	2019
4187	Jay	Bouwmeester	4	D	2	5	1983	191	89	\N	2011	2019
5004	Marian	Gaborik	10	R	3	14	1982	186	83	\N	2011	2017
5772	Libor	Zabransky	8	D	2	6	2000	185	86	\N	2021	\N
5705	Nico	Gross	66	D	2	16	2000	186	86	86	2020	\N
5719	Alexander	Romanov	27	D	2	13	2000	182	94	83	2020	\N
5784	Michal	Ivan	29	D	2	14	1999	185	90	\N	2021	0
4051	Chad	Allan	2	D	2	5	1976	185	87	\N	2011	2011
4245	Steve	Eminger	44	D	2	5	1983	188	89	\N	2011	2015
4565	Tomi	Kallio	17	R	3	7	1977	184	84	\N	2011	2017
5553	Adam	Hall	18	R	3	18	1980	192	91	\N	2011	2016
5260	Mark	Streit	7	D	2	16	1977	183	84	\N	2011	2017
4412	Patrik	Elias	10	L	3	6	1976	180	83	\N	2011	2015
5720	Barrett	Hayton	29	CL	3	5	2000	186	86	133	2020	\N
3933	Nikolaj Krag	Christensen	27	CL	3	4	1998	191	91	107	2018	\N
5771	Leo	Lööf	9	D	2	15	2002	186	81	107	2021	\N
5726	Jamie	Drysdale	34	D	2	5	2002	180	82	94	2020	\N
5065	Fredrik	Pettersson	10	C	3	15	1987	178	83	101	2012	2019
5698	Pontus	Holmberg	29	CL	3	15	1999	180	81	91	2020	\N
3917	Jerome	Flaake	90	RL	3	3	1990	190	96	91	2012	\N
5721	Bowen	Byram	4	D	2	5	2001	185	86	97	2020	\N
5696	Jack	Drury	13	C	3	18	2000	182	79	81	2020	\N
5783	Marco	Kasper	24	C	3	1	2004	185	85	100	2021	0
5776	Nick	Malik	31	G	1	6	2002	189	79	90	2021	0
3819	Kevin	Lalande	35	G	1	2	1987	182	86	95	2012	2016
5729	Martin	Necas	88	CR	3	6	1999	188	86	81	2020	\N
5774	Ville	Koivunen	41	CF	3	7	2003	183	78	81	2021	\N
4952	Tomas	Marcinko	16	CR	3	14	1988	194	94	85	2012	\N
5734	Oliver	Wahlstrom	26	R	3	18	2000	188	93	85	2020	\N
5443	Mats	Frøshaug	21	CL	3	12	1988	188	99	108	2014	\N
5722	Brock	Boeser	6	R	3	18	1997	185	94	108	2020	\N
4014	Mathieu	Perreault	85	CL	3	5	1988	178	68	92	2012	\N
4303	Cody	Eakin	20	CL	3	5	1991	183	84	92	2012	\N
5108	Stefan	Nilsson	4	F	3	15	1968	\N	\N	92	2011	2011
5723	Alexei	Protas	40	C	3	2	2001	198	97	92	2020	\N
5731	Leon	Gawanke	9	D	2	3	1999	186	90	93	2020	\N
5773	Santeri	Virtanen	15	C	3	7	1999	188	92	93	2021	\N
5717	Jason	Robertson	21	RL	3	18	1999	191	95	99	2020	\N
5718	Ty	Dellandrea	10	C	3	5	2000	185	86	99	2020	\N
5730	Denis	Guryanov	34	RL	3	13	1997	191	91	99	2020	\N
5699	Joe	Veleno	90	C	3	5	2000	186	88	100	2020	\N
5768	Kirill	Marchenko	86	RL	3	13	2000	189	82	98	2021	\N
5767	Kirill	Kirsanov	78	D	2	13	2002	185	90	102	2021	\N
5057	Johan	Larsson	10	CL	3	15	1992	182	90	103	2012	\N
5780	Jesper	Wallstedt	1	G	1	15	2002	191	97	103	2021	\N
5732	Jesperi	Kotkaniemi	15	C	3	7	2000	188	88	83	2020	\N
3981	Kyle	Chipchura	24	C	3	5	1986	188	89	83	2012	2019
5697	Alexander	Holtz	88	R	3	15	2002	184	88	84	2020	\N
5702	Nicolas	Daws	35	G	1	5	2000	193	92	84	2020	\N
5712	Mads	Sogaard	1	G	1	4	2000	200	91	87	2020	\N
5725	Tim	Stützle	18	CL	3	3	2002	184	89	87	2020	\N
5695	Filip	Hallander	51	LC	3	15	2000	186	89	89	2020	\N
5714	Tristan	Jarry	35	G	1	5	1995	188	88	89	2020	\N
5778	Joel	Blomqvist	32	G	1	7	2002	189	85	89	2021	\N
5782	Calle	Clang	70	G	1	15	2002	188	80	89	2021	\N
5727	Filip	Chytil	72	C	3	6	1999	187	92	86	2020	\N
5728	Alexis	Lafreniere	13	L	3	5	2001	186	87	86	2020	\N
4239	Tom	Pyatt	11	L	3	5	1987	181	81	86	2012	2018
5781	Karl	Henriksson	21	CL	3	15	2001	176	79	86	2021	\N
3859	Kai	Hospelt	18	C	3	3	1985	185	84	106	2011	2019
4043	Steve	Bernier	16	R	3	5	1985	190	105	106	2011	2019
5700	Hugo	Alnefelt	60	G	1	15	2001	191	85	90	2020	\N
5769	Alexei	Kolosov	35	G	1	2	2002	186	85	88	2021	\N
4502	Aleksi	Heponiemi	20	CR	3	7	1999	180	70	82	2018	\N
5770	Jakub	Kos	34	CL	3	6	2003	188	79	82	2021	\N
5701	Mathias	From	77	LR	3	4	1997	186	85	96	2020	\N
5716	Kirby	Dach	77	CR	3	5	2001	193	91	96	2020	\N
5733	Philipp	Kurashev	23	CL	3	16	1999	183	86	96	2020	\N
5396	Erik	Johansen	3	D	2	12	1989	188	84	\N	2013	2015
5158	Henrik	Sedin	20	C	3	15	1980	188	89	\N	2011	2017
4045	Krys	Kolanos	36	C	3	5	1981	190	88	\N	2011	2017
4331	Ondrej	Pavelec	31	G	1	6	1987	190	91	\N	2011	2017
3980	Cam	Ward	30	G	1	5	1984	197	79	\N	2011	2018
3879	Olaf	Kölzig	37	G	1	3	1970	190	93	\N	2011	2011
3927	Sebastian	Feuk	20	G	1	4	1993	186	78	\N	2013	2017
3904	Patrick	Ehelechner	25	G	1	3	1984	188	79	\N	2011	2014
5154	Henrik	Zetterberg	40	L	3	15	1980	181	81	\N	2011	2017
4199	Roberto	Luongo	1	G	1	5	1979	192	79	\N	2011	2018
5445	Ruben	Smith	30	G	1	12	1987	182	75	\N	2012	2016
4202	Andrew	Raycroft	1	G	1	5	1980	187	70	\N	2011	2012
5430	Tommy	Lund	31	G	1	12	1980	186	86	\N	2011	2011
5014	Imrich	Petrik	33	G	1	14	1983	184	68	\N	2011	2011
3883	Klaus	Merk	6	G	1	3	1967	176	78	\N	2011	2011
4574	Joni	Puurula	34	G	1	7	1982	180	79	\N	2011	2016
4658	Mathieu	Mille	29	D	2	8	1981	183	88	\N	2011	2011
3878	Torsten	Kienass	3	D	2	3	1971	182	80	\N	2011	2011
3882	Mirko	Lüdemann	7	D	2	3	1973	182	85	\N	2011	2015
3897	Christian	Ehrhoff	10	D	2	3	1982	188	85	\N	2011	2017
3903	Stefan	Schauer	15	D	2	3	1983	185	85	\N	2011	2011
3962	Anders	Thode	3	D	2	4	1993	185	81	\N	2014	2015
4181	Chris	Phillips	4	D	2	5	1978	186	90	\N	2011	2014
5432	Ole Fredrik	Kirkebye	7	D	2	12	1980	188	81	\N	2011	2011
5412	Henrik	Solberg	39	D	2	12	1987	189	90	\N	2011	2017
4729	Denis	Chervyakov	23	D	2	11	1970	178	77	\N	2011	2011
4723	Karlis	Skrastins	7	D	2	11	1974	188	75	\N	2011	2011
4562	Miika	Elomo	10	L	3	7	1977	\N	\N	\N	2011	2011
5492	Matt	Carle	4	D	2	18	1984	184	87	\N	2011	2016
5150	Herman	Hultgren	8	D	2	15	1980	184	93	\N	2011	2011
5204	Jonas	Lennartsson	6	D	2	15	1981	185	90	\N	2011	2011
5129	Henrik	Tallinder	25	D	2	15	1979	191	88	\N	2011	2017
4446	Martin	Erat	19	R	3	6	1981	182	79	\N	2011	2019
5552	Jordan	Leopold	4	D	2	18	1980	187	94	\N	2011	2014
5594	Ryan	Whitney	19	D	2	18	1983	194	91	\N	2011	2015
5557	David	Tanabe	45	D	2	18	1980	187	91	\N	2011	2011
5493	Ryan	Flynn	22	R	3	18	1988	191	95	\N	2012	2013
5505	Lee	Stempniak	12	R	3	18	1983	183	86	\N	2011	2018
5357	Thomas	Pichler	12	R	3	9	1985	180	80	\N	2011	2017
3880	Daniel	Kreutzer	23	R	3	3	1979	178	82	\N	2011	2016
5162	Mathias	Tjärnqvist	17	R	3	15	1979	185	86	\N	2011	2016
5427	Halvor	Hårstad-Evjen	81	G	1	12	1981	188	86	\N	2011	2011
4724	Peteris	Skudra	1	G	1	11	1973	184	84	\N	2011	2011
5161	Mikael	Tellqvist	32	G	1	15	1979	180	79	\N	2011	2016
4034	Stephen	Weiss	9	C	3	5	1983	182	80	\N	2011	2014
4204	Jamie	Hodson	1	G	1	5	1980	190	93	\N	2011	2011
4304	Mike	Murphy	35	G	1	5	1989	180	72	\N	2012	2014
4712	Arturs	Irbe	32	G	1	11	1967	170	82	\N	2011	2011
5314	Ruben	Rampazzo	20	D	2	9	1993	193	103	\N	2015	2018
5151	Niklas	Kronwall	55	D	2	15	1981	182	76	\N	2011	2018
3872	Markus	Wieland	6	D	2	3	1976	\N	\N	\N	2011	2011
5315	Rene	Baur	85	G	1	9	1985	180	74	\N	2011	2014
4722	Sergejs	Senins	26	R	3	11	1972	181	86	\N	2011	2011
4053	 Nolan	 Baumgartner	38	D	2	5	1976	183	84	\N	2011	2011
4250	Dennis	Wideman	6	D	2	5	1983	183	90	\N	2011	2016
4191	Steve	McCarthy	5	D	2	5	1981	183	93	\N	2011	2015
4228	Paul	Ranger	54	D	2	5	1984	191	89	\N	2011	2014
5380	Alexei	Litvinenko	7	D	2	10	1980	198	93	105	2011	2015
4577	Joni	Pitkänen	44	D	2	7	1983	190	90	\N	2011	2015
4726	Vjaceslavs	Fanduls	8	C	3	11	1969	179	79	\N	2011	2011
5152	Christian	Bäckman	8	D	2	15	1980	190	90	\N	2011	2014
5301	Igor	Andruschenko	21	R	3	17	1983	176	73	\N	2011	2011
4572	Kristian	Antila	31	G	1	7	1980	192	92	\N	2011	2011
5369	Nikolai	Antropov	9	C	3	10	1980	197	86	\N	2011	2014
3870	Frank	Appel	2	D	2	3	1976	\N	\N	\N	2011	2011
5232	David	Aebischer	32	G	1	16	1978	186	85	\N	2011	2014
5304	Mikhail	Balaban	30	G	1	17	1990	181	74	\N	2012	2013
5240	Mathias	Seger	15	D	2	16	1977	180	82	\N	2011	2017
5391	Martin	Ylven	35	R	3	12	1988	189	90	\N	2011	2018
3970	Lasse	Holgaard	25	R	3	4	1989	193	85	\N	2012	2013
4706	Sergejs	Boldavesko	25	F	3	11	1970	\N	\N	\N	2011	2011
3885	Markus	Pöttinger	7	D	2	3	1978	\N	\N	\N	2011	2011
3888	Stefan	Ustorf	17	L	3	3	1974	180	77	\N	2011	2012
3781	Rene	Wild	9	D	2	1	1981	175	77	\N	2011	2011
3785	Daniel	Welser	20	L	3	1	1983	180	82	\N	2011	2016
3766	Andreas	Nödl	15	R	3	1	1987	187	88	\N	2011	2018
3934	Søren B.	Pedersen	26	C	3	4	1991	188	90	\N	2012	2016
3890	Jochen	Hecht	29	CL	3	3	1978	185	87	\N	2011	2015
3887	Alexander	Serikow	26	F	3	3	1975	183	78	\N	2011	2011
4732	Edgars	Masalskis	72	G	1	11	1980	180	79	\N	2011	2016
3871	Jan	Benda	94	R	3	3	1972	181	74	\N	2011	2011
3886	Martin	Reichel	23	C	3	3	1973	182	75	\N	2011	2011
5393	Brede	Csiszar	55	D	2	12	1987	182	82	\N	2011	2018
5394	Ole-Kristian	Tollefsen	55	D	2	12	1984	188	91	\N	2011	2016
5402	Lars	Østli	37	D	2	12	1986	181	81	\N	2011	2018
5410	Teddy	Midttun	2	D	2	12	1984	196	105	\N	2011	2011
3891	Leo	Stefan	20	R	3	3	1970	178	85	\N	2011	2011
3952	Søren	Christiansen	29	L	3	4	1991	191	87	\N	2012	2013
3791	Patrick	Machreich	33	G	1	1	1980	182	70	\N	2011	2018
3784	Michael	Mayer	35	G	1	1	1981	180	75	\N	2011	2011
4312	Jakub	Sindel	40	C	3	6	1986	183	75	\N	2012	2015
4819	Alexei	Zhamnov	24	C	3	13	1970	185	89	\N	2011	2011
4203	Francois	Beauchemin	23	D	2	5	1980	185	90	\N	2011	2017
4423	Martin	Havlat	9	R	3	6	1981	187	80	\N	2011	2014
4083	Jarome	Iginla	12	R	3	5	1977	183	91	\N	2011	2016
4193	Barret	Jackman	5	D	2	5	1981	182	97	\N	2011	2015
4277	Colten	Teubert	33	D	2	5	1990	191	88	\N	2014	2018
4103	Daniel	Cleary	7	L	3	5	1978	180	91	\N	2011	2016
4031	Vincent	Lecavalier	4	C	3	5	1980	195	81	\N	2011	2015
4048	Steve	Downie	27	R	3	5	1987	179	90	\N	2012	2015
4753	Rustam	Sidikov	20	G	1	13	1985	185	71	\N	2011	2011
5419	Anders	Myrvold	55	D	2	12	1975	183	80	\N	2011	2011
5450	Vegar	Sagbakken	1	G	1	12	1984	183	78	\N	2011	2011
5309	Sergei	Gaiduchenko	1	G	1	17	1989	196	90	\N	2012	2016
4173	Brendan	Shanahan	18	R	3	5	1969	190	98	\N	2011	2011
4188	Brad	Richards	19	C	3	5	1980	183	82	\N	2011	2015
4194	Jamie	Lundmark	26	C	3	5	1981	183	84	\N	2011	2017
4232	Cody	Hodgson	19	C	3	5	1990	183	83	\N	2012	2015
4196	Rico	Fata	9	C	3	5	1980	181	92	\N	2011	2013
4269	Scott	Hartnell	17	L	3	5	1982	192	86	\N	2011	2017
4711	Viktors	Ignatjevs	33	D	2	11	1970	178	89	\N	2011	2012
4713	Arturs	Kupaks	2	D	2	11	1973	184	82	\N	2011	2011
4716	Ronalds	Ozolins	28	D	2	11	1973	\N	\N	\N	2011	2011
4727	Gatis	Ceplis	22	D	2	11	1971	180	88	\N	2011	2011
4714	Rodrigo	Lavins	3	D	2	11	1974	188	87	\N	2011	2015
3788	Robert	Lukas	28	D	2	1	1978	176	77	\N	2011	2017
5554	Rick	DiPietro	39	G	1	18	1981	184	80	\N	2011	2013
5259	Simon	Züger	47	G	1	16	1981	185	83	\N	2011	2011
4292	Patrick	O'Sullivan	29	C	3	5	1985	184	82	\N	2011	2012
4707	Igors	Bondarevs	5	D	2	11	1974	188	77	\N	2011	2011
5530	Jeremy	Roenick	20	C	3	18	1970	183	86	\N	2011	2011
3860	Dominik	Bielke	21	D	2	3	1990	188	81	\N	2012	2013
4824	Sergei	Zubov	5	D	2	13	1970	185	89	\N	2011	2011
4785	Anton	Babchuk	48	D	2	13	1984	195	90	\N	2011	2014
5435	Marius	Trygg	14	L	3	12	1976	177	79	\N	2011	2015
4356	Petr	Kadlec	7	D	2	6	1977	179	78	\N	2011	2017
4719	Grigorijs	Pantelejevs	30	R	3	11	1972	176	86	\N	2011	2011
4885	Sergei	Fedorov	91	C	3	13	1969	185	91	\N	2011	2011
4721	Aleksandrs	Semjonovs	8	L	3	11	1972	182	85	\N	2011	2011
4718	Juris	Opulskis	10	F	3	11	1969	178	80	\N	2011	2011
5297	Ruslan	Fedotenko	17	R	3	17	1979	190	86	\N	2011	2015
4480	Antti	Jokela	1	G	1	7	1981	\N	\N	\N	2011	2011
4982	Vladimir	Orszagh	33	R	3	14	1977	\N	\N	\N	2011	2011
5474	Andrew	Alberts	41	D	2	18	1981	193	98	\N	2011	2013
4730	Aleksandrs	Cuncukovs	16	R	3	11	1971	180	83	\N	2011	2011
5155	Daniel	Sedin	12	L	3	15	1980	186	89	\N	2011	2017
4710	Sergejs	Zoltoks	17	C	3	11	1972	180	86	\N	2011	2011
4708	Herberts	Vasiljevs	15	R	3	11	1976	180	82	\N	2011	2016
5473	Damian	Surma	5	L	3	18	1981	175	91	\N	2011	2013
5095	Niklas	Andersson	32	L	3	15	1971	177	79	\N	2011	2011
4715	Aleksandrs	Nizivijs	11	C	3	11	1976	177	77	\N	2011	2013
5310	Yuri	Petrangovsky	63	F	3	17	1994	187	87	\N	2013	2016
5153	Viktor	Wallin	9	D	2	15	1980	191	98	\N	2011	2011
5166	Mattias	Weinhandl	13	R	3	15	1980	182	85	\N	2011	2013
4660	Laurent	Meunier	10	L	3	8	1979	182	84	\N	2011	2018
5358	Nicola	Fontanive	87	C	3	9	1985	167	75	\N	2011	2016
5157	Christian	Berglund	12	C	3	15	1980	180	85	\N	2011	2016
4520	Sami	Kapanen	15	L	3	7	1973	177	76	\N	2011	2013
5559	Erik	Cole	26	L	3	18	1978	185	83	\N	2011	2014
5555	David	Legwand	11	C	3	18	1980	187	87	\N	2011	2015
5556	Tim	Connolly	18	C	3	18	1981	184	84	\N	2011	2012
4519	Niko	Kapanen	21	C	3	7	1978	175	80	\N	2011	2016
4509	Mika	Alatalo	9	R	3	7	1971	181	84	\N	2011	2011
5228	Kevin	Romy	88	C	3	16	1985	184	87	\N	2011	2018
5246	Martin	Plüss	28	L	3	16	1977	173	81	\N	2011	2016
3824	Andrei	Kovalev	11	C	3	2	1966	\N	\N	\N	2011	2011
3837	Konstantin	Koltsov	28	L	3	2	1981	185	87	89	2011	2015
4522	Jere	Karalahti	7	D	2	7	1975	188	95	102	2011	2015
4963	Mario	Bliznak	55	C	3	14	1987	185	90	108	2012	2018
4249	Greg	Adams	13	F	3	5	1963	\N	\N	\N	2011	2011
4050	Steve	Yzerman	19	C	3	5	1965	180	84	\N	2011	2011
4052	Dave	Andreychuk	25	L	3	5	1963	190	91	\N	2011	2011
5094	Mikael	Andersson	16	L	3	15	1966	180	84	\N	2011	2011
3820	Alexander	Andriyevsky	25	F	3	2	1968	177	81	\N	2011	2011
3773	Gerhard	Puschnik	7	F	3	1	1966	\N	\N	\N	2011	2011
4114	Mark	Messier	11	C	3	5	1961	185	93	\N	2011	2011
4827	Valeri	Kamensky	13	L	3	13	1966	188	90	\N	2011	2011
3881	Uwe	Krupp	8	D	2	3	1965	198	107	\N	2011	2011
4453	Karel	Lang	1	G	1	6	1958	\N	\N	\N	2011	2011
4198	Mario	Lemieux	66	C	3	5	1966	\N	\N	\N	2011	2011
4849	Igor	Larionov	11	C	3	13	1960	176	77	\N	2011	2011
4843	Vladimir	Konstantinov	16	D	2	13	1967	180	86	\N	2011	2011
4833	Dmitri	Kvartalnov	10	L	3	13	1966	176	82	\N	2011	2011
5092	Tommy	Albelin	3	D	2	15	1964	185	86	\N	2011	2011
4980	Igor	Liba	11	F	3	14	1960	170	72	\N	2011	2011
4725	Ilmars	Tomans	16	F	3	11	1968	\N	\N	\N	2011	2011
4871	Vitali	Prokhorov	24	F	3	13	1966	178	93	\N	2011	2011
4474	Jari	Kurri	10	F	3	7	1960	\N	\N	\N	2011	2011
5540	Brett	Hull	16	R	3	18	1964	178	92	\N	2011	2011
5544	Chris	Chelios	19	D	2	18	1962	185	87	\N	2011	2011
4988	Radoslav	Suchy	5	D	2	14	1976	188	93	\N	2011	2018
3889	Kai	Fischer	1	G	1	3	1977	\N	\N	\N	2011	2011
5775	Roni	Hirvonen	33	C	3	7	2002	176	78	91	2021	\N
5779	Topi	Niemelä	7	D	2	7	2002	181	77	91	2021	\N
4672	Aziz	Baazzi	15	D	2	8	1992	176	74	\N	2012	\N
4616	Oskar	Osala	62	L	3	7	1987	194	100	92	2012	2018
5468	Ryan	McDonagh	27	D	2	18	1989	185	90	83	2012	\N
4960	Marek	Svatos	40	L	3	14	1982	180	79	\N	2011	2013
5785	Thor	Baden	44	G	1	4	2002	192	96	\N	2021	\N
5786	Albert	Adamsen	33	G	1	4	1999	188	76	\N	2021	\N
5787	Sverre	Rønningen	55	D	2	12	2001	196	88	\N	2020	\N
5788	Håkon	Pedersen	13	D	2	12	1998	189	90	\N	2020	\N
5789	Max	Krogdahl	43	D	2	12	1998	188	95	\N	2020	\N
5790	Sander	Engebråten	7	D	2	12	2002	182	78	\N	2021	\N
5791	Sondre	Vaaler	23	D	2	12	2000	188	90	\N	2021	\N
5792	Jonas	Meisingset	82	D	2	12	1999	180	85	\N	2021	\N
5793	Enzo	Guebey	5	D	2	8	1999	188	90	\N	2021	\N
5794	Rocco	Pezzullo	86	D	2	16	2001	185	84	\N	2021	\N
5795	Davyd	Barandun	57	D	2	16	2000	181	89	\N	2021	\N
5796	David	Aebischer	26	D	2	16	2000	180	83	\N	2021	\N
5797	Eugen	Rabcan	1	G	1	14	2001	190	89	\N	2021	\N
5798	Maros	Jedlicka	88	LR	3	14	2002	186	82	\N	2021	\N
5799	Samuel	Hlavaj	30	G	1	14	2001	193	99	\N	2021	\N
5800	Alexander	Schmidt	25	G	1	1	2000	178	78	\N	2021	\N
5801	Florian	Bugl	31	G	1	3	2002	182	86	\N	2021	\N
5803	Hendrik	Hane	32	G	1	3	2000	178	74	\N	2021	\N
5802	Justin	Schütz	18	L	3	3	2000	181	80	82	2021	\N
5804	Artyom	Korolyov	31	D	2	10	2001	185	86	\N	2021	\N
5805	David	Muratov	90	D	2	10	2001	192	83	\N	2021	\N
5806	Trevor	Zegras	46	C	3	18	2001	183	83	94	2021	\N
5807	Mattias	Samuelsson	23	D	2	18	2000	193	103	80	2021	\N
5808	Adam	Boqvist	27	D	2	15	2000	182	86	98	2021	\N
5809	Filip	Zadina	11	RL	3	6	1999	183	89	100	2021	\N
5810	Dereck	Baribeau	30	G	1	5	1999	197	97	\N	2021	\N
5811	Justin	Barron	52	D	2	5	2001	188	88	83	2021	\N
5812	Kale	Clague	43	D	2	5	1998	183	80	83	2021	\N
5813	David	Farrance	22	D	2	18	1999	183	86	104	2021	\N
5814	Josh	Norris	9	C	3	18	1999	188	87	97	2021	\N
5815	 Joel	Farabee	86	L	3	18	2000	183	74	88	2021	\N
5816	Pierre-Olivier	Joseph	73	D	2	5	1999	188	84	89	2021	\N
5817	Mario	Ferraro	38	D	2	5	1998	180	84	106	2021	\N
5818	 Joel	Hofer	1	G	1	5	2000	196	78	107	2001	\N
5819	Rasmus	Sandin	38	D	2	15	2000	181	81	91	2021	\N
5820	Michael	DiPietro	65	G	1	5	1999	183	91	108	2021	\N
5821	Cale	Fleury	8	D	2	5	1998	185	96	83	2021	\N
5822	Morgan	Geekie	67	CR	3	5	1998	191	87	81	2021	\N
5823	Anton	Lundell	15	C	3	7	2001	185	84	82	2021	\N
5824	Seth	Jarvis	24	CR	3	5	2002	178	82	81	2021	\N
5825	Mathias Emilio	Pettersen	46	CL	3	12	2000	178	77	95	2021	\N
5826	Arthur	Kaliyev	34	RL	3	18	2001	188	88	102	2021	\N
5827	Yegor	Chinakhov	59	R	3	13	2001	182	81	98	2021	\N
5828	Lucas	Raymond	23	R	3	15	2002	179	83	100	2021	\N
5829	Cole	Caufield	22	R	3	18	2001	170	75	83	2021	\N
5830	Marco	Rossi	23	C	3	1	2001	176	83	103	2021	\N
4735	Nikita	Kolesnikovs	14	D	2	11	1992	192	92	\N	2012	2021
4192	Jason	Spezza	19	C	3	5	1983	191	88	\N	2011	2021
4295	Ryan	Getzlaf	15	C	3	5	1985	191	87	\N	2011	2021
4490	Tuukka	Rask	40	G	1	7	1987	190	82	91	2012	2020
5777	Juraj	Slafkovsky	60	L	3	14	2004	192	99	83	2021	0
4964	Marek	Bartanus	41	R	3	14	1987	190	99	90	2011	0
5192	Anton	Forsberg	1	G	1	15	1992	188	80	98	2013	0
5001	Branislav	Mezei	5	D	2	14	1980	195	105	85	2011	0
4774	Viktor	Tikhonov	41	R	3	13	1988	188	84	133	2012	2021
4243	Duncan	Keith	2	D	2	5	1983	185	76	96	2011	2021
5677	Moritz	Seider	53	D	2	3	2001	192	94	100	2019	0
5638	Jonatan	Berggren	48	L	3	15	2000	180	83	100	2019	0
4116	Joe	Thornton	19	C	3	5	1979	192	89	79	2011	0
4284	Laurent	Brossoit	1	G	1	5	1993	191	92	95	2016	0
5666	Dennis	Cholowski	21	D	2	5	1998	183	88	100	2019	0
5635	Julius	Nättinen	33	C	3	7	1997	188	93	94	2019	0
4717	Sandis	Ozolins	6	D	2	11	1972	185	89	106	2011	2013
4768	Nikolai	Zherdev	13	R	3	13	1984	184	81	98	2011	0
4316	Martin	Skoula	41	D	2	6	1979	190	88	97	2011	2014
5422	Erik	Paulsen	23	F	3	12	1970	\N	\N	\N	2011	2011
4366	Jiri	Latal	3	D	2	6	1967	177	79	\N	2011	2011
4358	Vladimir	Kames	12	F	3	6	1964	175	77	\N	2011	2011
5415	Knut	Walbye	3	F	3	12	1968	177	84	\N	2011	2011
5141	Anders	Eldebrink	2	D	2	15	1960	171	84	\N	2011	2011
3893	Harald	Kuhn	4	D	2	3	1962	\N	\N	\N	2011	2011
\.


--
-- Data for Name: players_tournaments; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.players_tournaments (id, teams_tournament_id, player_id, games, goals, postseason) FROM stdin;
1	6	4610	21	14	\N
2	6	4615	32	37	\N
3	6	4316	39	15	\N
4	6	4907	8	4	\N
5	6	4925	19	32	\N
6	6	4691	13	23	\N
7	7	3819	14	14	\N
8	7	4688	18	37	\N
9	7	5067	13	29	\N
10	7	4737	33	27	\N
11	7	4859	1	28	\N
12	7	4573	23	7	\N
13	8	4904	10	27	\N
14	8	4309	14	32	\N
15	8	4901	26	9	\N
16	8	4616	14	33	\N
17	8	4774	27	1	\N
18	8	4614	21	40	\N
19	1	5309	33	7	\N
20	1	4699	30	10	\N
21	1	5001	9	8	\N
22	1	4786	12	13	\N
23	1	5290	22	8	\N
24	1	5065	6	12	\N
25	9	4920	5	3	\N
26	9	4905	16	16	\N
27	9	4598	40	19	\N
28	9	4705	28	15	\N
29	9	4867	20	38	\N
30	9	4840	32	34	\N
31	10	4569	3	28	\N
32	10	5372	22	2	\N
33	10	4882	21	37	\N
34	10	4845	15	16	\N
35	10	5456	36	27	\N
36	10	4921	38	40	\N
37	11	3828	29	2	\N
38	11	4763	32	12	\N
39	11	4874	2	34	\N
40	11	3848	3	19	\N
41	11	4916	15	22	\N
42	11	4770	10	29	\N
43	18	4939	25	5	\N
44	18	4940	7	14	\N
45	18	5043	19	12	\N
46	18	4960	10	37	\N
47	18	4992	22	28	\N
48	18	5005	30	17	\N
49	12	3816	7	12	\N
50	12	4460	32	4	\N
51	12	4933	12	35	\N
52	12	4377	4	14	\N
53	12	4898	39	18	\N
54	12	4910	37	37	\N
55	4	4732	1	28	\N
56	4	4485	11	21	\N
57	4	3845	7	39	\N
58	4	5201	12	22	\N
59	4	4519	34	12	\N
60	4	4999	4	29	\N
61	13	4915	34	11	\N
62	13	4788	13	37	\N
63	13	4765	17	13	\N
64	13	4767	13	3	\N
65	13	4926	7	29	\N
66	13	5429	28	8	\N
67	5	4967	2	32	\N
68	5	4304	4	19	\N
69	5	4799	1	36	\N
70	5	4457	31	20	\N
71	5	4841	30	23	\N
72	5	3899	16	32	\N
73	3	4310	34	40	\N
74	3	4947	24	7	\N
75	3	3850	8	29	\N
76	3	5003	17	13	\N
77	3	4781	2	17	\N
78	3	4433	30	34	\N
79	14	5006	8	32	\N
80	14	4740	17	12	\N
81	14	4935	7	17	\N
82	14	4834	11	14	\N
83	14	4900	29	8	\N
84	14	4733	27	10	\N
85	2	4922	22	24	\N
86	2	3837	26	14	\N
87	2	4768	24	4	\N
88	2	4609	20	36	\N
89	2	4913	27	37	\N
90	2	4717	1	21	\N
91	15	5373	39	4	\N
92	15	5380	29	35	\N
93	15	5388	17	22	\N
94	15	5381	23	16	\N
95	15	5385	10	6	\N
96	15	5382	31	14	\N
97	16	5401	14	13	\N
98	16	4311	24	38	\N
99	16	4522	20	4	\N
100	16	3823	37	22	\N
101	16	4963	1	20	\N
102	16	3842	37	4	\N
103	17	5161	20	40	\N
104	17	4692	29	17	\N
105	17	4714	31	8	\N
106	17	4690	13	4	\N
107	17	4743	22	4	\N
108	17	4715	3	17	\N
109	20	4496	17	21	\N
110	20	4540	1	32	\N
111	20	4567	2	7	\N
112	20	3942	10	18	\N
113	20	4612	10	32	\N
114	20	4292	28	19	\N
115	21	4542	1	22	\N
116	21	5461	25	27	\N
117	21	4568	11	12	\N
118	21	4698	30	4	\N
119	21	4589	38	40	\N
120	21	4487	22	14	\N
121	22	4566	10	15	\N
122	22	5062	23	12	\N
123	22	5063	9	25	\N
124	22	4521	21	35	\N
125	22	4608	30	10	\N
126	22	4537	40	14	\N
127	19	4580	26	29	\N
128	19	4678	5	37	\N
129	19	4520	12	10	\N
130	19	5074	12	33	\N
131	19	4956	10	8	\N
132	19	5448	24	4	\N
133	23	4624	5	19	\N
134	23	4471	27	26	\N
135	23	5485	5	14	\N
136	23	4645	22	20	\N
137	23	4545	22	17	\N
138	23	4629	31	14	\N
139	24	4626	4	2	\N
140	24	3972	39	7	\N
141	24	5015	9	14	\N
142	24	4613	8	19	\N
143	24	4477	13	20	\N
144	24	4504	32	16	\N
145	31	5136	18	14	\N
146	31	5084	31	7	\N
147	31	5394	24	12	\N
148	31	5071	2	16	\N
149	31	5137	11	12	\N
150	31	5434	20	2	\N
151	32	5058	8	8	\N
152	32	3926	25	35	\N
153	32	5172	20	37	\N
154	32	5077	7	25	\N
155	32	5072	23	1	\N
156	32	3956	25	4	\N
157	29	3755	6	6	\N
158	29	4981	4	7	\N
159	29	4222	1	3	\N
160	29	3853	13	16	\N
161	29	5436	30	40	\N
162	29	5160	36	15	\N
163	25	4438	16	22	\N
164	25	5451	33	19	\N
165	25	5200	2	13	\N
166	25	5408	28	16	\N
167	25	5090	30	6	\N
168	25	5157	36	25	\N
169	26	5031	1	35	\N
170	26	5222	36	15	\N
171	26	5152	27	4	\N
172	26	5411	34	32	\N
173	26	4565	35	7	\N
174	26	5395	5	33	\N
175	27	5117	36	34	\N
176	27	5437	9	37	\N
177	27	5107	33	34	\N
178	27	5390	1	9	\N
179	27	5099	12	13	\N
180	27	3957	29	12	\N
181	28	5073	1	25	\N
182	28	4528	23	34	\N
183	28	5177	13	7	\N
184	28	3950	13	9	\N
185	28	5166	6	38	\N
186	28	5128	2	38	\N
187	30	5225	39	35	\N
188	30	5446	4	23	\N
189	30	5182	12	3	\N
190	30	4493	7	8	\N
191	30	5162	32	5	\N
192	30	4241	31	5	\N
193	37	4333	28	27	\N
194	37	4421	10	28	\N
195	37	4439	14	19	\N
196	37	4396	39	4	\N
197	37	4670	27	34	\N
198	37	4468	12	39	\N
199	35	4389	38	40	\N
200	35	4351	35	26	\N
201	35	4356	9	28	\N
202	35	4464	10	32	\N
203	35	4336	32	25	\N
204	35	5035	35	34	\N
205	33	4399	34	19	\N
206	33	4323	38	32	\N
207	33	4379	4	24	\N
208	33	4388	32	9	\N
209	33	4431	32	38	\N
210	33	4422	33	34	\N
211	39	5009	37	39	\N
212	39	4378	21	30	\N
213	39	4381	22	13	\N
214	39	5008	15	14	\N
215	39	4341	15	24	\N
216	39	4985	24	6	\N
217	36	5013	33	36	\N
218	36	4951	10	27	\N
219	36	4437	10	35	\N
220	36	4314	28	9	\N
221	36	4442	6	7	\N
222	36	4338	1	21	\N
223	34	4450	20	37	\N
224	34	4326	22	38	\N
225	34	4368	16	25	\N
226	34	4700	27	7	\N
227	34	4964	33	40	\N
228	34	4319	26	12	\N
229	38	5016	14	5	\N
230	38	4467	15	33	\N
231	38	4335	2	21	\N
232	38	5012	8	30	\N
233	38	4395	35	24	\N
234	38	4452	7	4	\N
235	40	4465	15	23	\N
236	40	4322	27	40	\N
237	40	5002	31	33	\N
238	40	4427	17	24	\N
239	40	4373	38	38	\N
240	40	4428	34	33	\N
241	41	3867	40	10	\N
242	41	3852	2	36	\N
243	41	3906	32	9	\N
244	41	3917	9	7	\N
245	41	3909	20	3	\N
246	41	3914	14	18	\N
247	43	3862	3	35	\N
248	43	3882	23	36	\N
249	43	5206	21	35	\N
250	43	3892	34	28	\N
251	43	3918	34	19	\N
252	43	4190	7	19	\N
253	44	3877	10	23	\N
254	44	3880	4	37	\N
255	44	5406	15	25	\N
256	44	5475	5	34	\N
257	44	3907	12	27	\N
258	44	3912	36	19	\N
259	42	4426	1	40	\N
260	42	3857	31	13	\N
261	42	3874	23	39	\N
262	42	4660	19	26	\N
263	42	4708	7	9	\N
264	42	3947	14	32	\N
265	45	3904	32	39	\N
266	45	3858	10	1	\N
267	45	3895	20	15	\N
268	45	3875	26	40	\N
269	45	3859	11	10	\N
270	45	3884	22	11	\N
271	46	3922	13	9	\N
272	46	3860	39	16	\N
273	46	3861	24	5	\N
274	46	3888	34	11	\N
275	46	3920	21	17	\N
276	46	4128	19	23	\N
277	47	4661	6	35	\N
278	47	4686	37	16	\N
279	47	4633	24	10	\N
280	47	4643	3	26	\N
281	47	4015	7	36	\N
282	47	4636	28	18	\N
283	48	4676	5	35	\N
284	48	4664	11	16	\N
285	48	4672	7	26	\N
286	48	5197	34	38	\N
287	48	4674	2	11	\N
288	48	4685	32	29	\N
289	49	4675	36	12	\N
290	49	4679	36	38	\N
291	49	4638	22	23	\N
292	49	4668	22	5	\N
293	49	4942	12	13	\N
294	49	4680	2	21	\N
295	50	5342	34	29	\N
296	50	5339	33	36	\N
297	50	5346	28	23	\N
298	50	5325	6	9	\N
299	50	5493	2	25	\N
300	50	5358	15	23	\N
301	53	5315	20	35	\N
302	53	5337	8	7	\N
303	53	5349	11	12	\N
304	53	5354	38	11	\N
305	53	5341	34	38	\N
306	53	5316	22	21	\N
307	52	4202	6	8	\N
308	52	4359	31	38	\N
309	52	5360	11	33	\N
310	52	5338	35	15	\N
311	52	5323	11	9	\N
312	52	4312	15	21	\N
313	51	4123	4	16	\N
314	51	5319	8	32	\N
315	51	5340	27	18	\N
316	51	5362	17	10	\N
317	51	5357	25	28	\N
318	51	3984	32	9	\N
319	54	3762	29	34	\N
320	54	3759	17	26	\N
321	54	3789	12	36	\N
322	54	3793	11	33	\N
323	54	3765	39	15	\N
324	54	3792	25	15	\N
325	55	5318	29	30	\N
326	55	3757	13	16	\N
327	55	3753	29	1	\N
328	55	3785	16	14	\N
329	55	4290	31	2	\N
330	55	3752	7	21	\N
331	56	3749	25	28	\N
332	56	4667	37	1	\N
333	56	3799	32	6	\N
334	56	4200	5	7	\N
335	56	3758	15	21	\N
336	56	3783	21	11	\N
337	57	3791	10	38	\N
338	57	3788	21	38	\N
339	57	3794	35	35	\N
340	57	3764	22	6	\N
341	57	3754	6	5	\N
342	57	4194	34	37	\N
343	58	5229	20	39	\N
344	58	5240	34	18	\N
345	58	5265	8	17	\N
346	58	4697	28	23	\N
347	58	5207	21	7	\N
348	58	5230	37	2	\N
349	59	5231	38	34	\N
350	59	5258	11	34	\N
351	59	5277	2	7	\N
352	59	4348	28	34	\N
353	59	5273	39	22	\N
354	59	4429	9	11	\N
355	60	5232	2	38	\N
356	60	5242	23	34	\N
357	60	3800	2	17	\N
358	60	5274	25	10	\N
359	60	5218	36	12	\N
360	60	5256	16	29	\N
361	61	5261	31	9	\N
362	61	4191	5	17	\N
363	61	5257	27	20	\N
364	61	5246	34	33	\N
365	61	5322	9	28	\N
366	61	4430	27	9	\N
367	63	5262	3	36	\N
368	63	5237	37	31	\N
369	63	4415	1	40	\N
370	63	5239	7	21	\N
371	63	4611	11	6	\N
372	63	4196	5	21	\N
373	62	5269	36	34	\N
374	62	5224	19	11	\N
375	62	4420	5	15	\N
376	62	5221	30	18	\N
377	62	5228	19	21	\N
378	62	5216	13	30	\N
379	64	5405	15	14	\N
380	64	5412	19	13	\N
381	64	5402	11	21	\N
382	64	5457	26	17	\N
383	64	5391	21	31	\N
384	64	4211	24	1	\N
385	65	5445	15	25	\N
386	65	5479	31	12	\N
387	65	4735	25	9	\N
388	65	5435	38	9	\N
389	65	5453	20	11	\N
390	65	5438	4	25	\N
391	66	5455	40	35	\N
392	66	5393	14	15	\N
393	66	5426	34	8	\N
394	66	5409	6	39	\N
395	66	5454	21	23	\N
396	66	5433	17	2	\N
397	67	5039	35	36	\N
398	67	4955	33	23	\N
399	67	4970	4	26	\N
400	67	4952	22	20	\N
401	67	5025	7	33	\N
402	67	5019	12	30	\N
403	68	5029	1	34	\N
404	68	4988	8	18	\N
405	68	5037	38	21	\N
406	68	4983	16	5	\N
407	68	4957	4	38	\N
408	68	5010	17	4	\N
409	69	5038	11	9	\N
410	69	4959	25	15	\N
411	69	5021	2	39	\N
412	69	5022	29	29	\N
413	69	4994	4	7	\N
414	69	5041	36	9	\N
415	71	4694	38	9	\N
416	71	4816	28	32	\N
417	71	5387	18	36	\N
418	71	5366	9	33	\N
419	71	5302	26	30	\N
420	71	5370	2	7	\N
421	73	5289	24	10	\N
422	73	5294	10	2	\N
423	73	4738	3	7	\N
424	73	5300	19	22	\N
425	73	5298	8	34	\N
426	73	3825	39	4	\N
427	72	3836	13	21	\N
428	72	3847	18	11	\N
429	72	5279	18	38	\N
430	72	3809	17	6	\N
431	72	5299	5	30	\N
432	72	3818	14	7	\N
433	74	5383	30	29	\N
434	74	3834	22	14	\N
435	74	4435	20	19	\N
436	74	5283	33	9	\N
437	74	3839	18	18	\N
438	74	3840	26	16	\N
439	70	5304	35	16	\N
440	70	5288	6	39	\N
441	70	4711	34	18	\N
442	70	4731	26	29	\N
443	70	4728	31	25	\N
444	70	3843	2	9	\N
445	75	3951	15	14	\N
446	75	3939	39	7	\N
447	75	3937	39	20	\N
448	75	3952	7	19	\N
449	75	3958	15	26	\N
450	75	3935	6	25	\N
451	76	3955	11	10	\N
452	76	4637	1	22	\N
453	76	4326	11	2	\N
454	76	3929	10	39	\N
455	76	3970	3	6	\N
456	76	3934	19	16	\N
457	85	4490	39	33	\N
458	85	4133	34	16	\N
459	85	5007	28	31	\N
460	85	4242	4	35	\N
461	85	4687	22	33	\N
462	85	4413	23	4	\N
463	85	4317	8	37	\N
464	85	4259	38	37	\N
465	85	4260	17	16	\N
466	86	5472	7	34	\N
467	86	4010	23	20	\N
468	86	3854	30	39	\N
469	86	3897	28	23	\N
470	86	3991	23	15	\N
471	86	4033	27	39	\N
472	86	3797	3	10	\N
473	86	4760	2	8	\N
474	86	4232	39	33	\N
475	87	3980	19	26	\N
476	87	5496	4	15	\N
477	87	4577	15	1	\N
478	87	5577	35	5	\N
479	87	4773	36	9	\N
480	87	4283	7	28	\N
481	87	4576	10	34	\N
482	87	4251	36	21	\N
483	87	4276	26	18	\N
484	88	4209	34	39	\N
485	88	5502	6	18	\N
486	88	4034	1	27	\N
487	88	3896	20	10	\N
488	88	5601	12	22	\N
489	88	4154	17	10	\N
490	88	4749	5	12	\N
491	88	4075	30	3	\N
492	88	4363	32	31	\N
493	77	4223	5	6	\N
494	77	4353	40	23	\N
495	77	4853	31	37	\N
496	77	4937	23	34	\N
497	77	5607	22	38	\N
498	77	4036	29	17	\N
499	77	5483	26	12	\N
500	77	4041	38	7	\N
501	77	3945	22	39	\N
502	89	4058	30	21	\N
503	89	4350	35	6	\N
504	89	5129	38	23	\N
505	89	4906	7	28	\N
506	89	4412	9	16	\N
507	89	4908	36	5	\N
508	89	5303	34	29	\N
509	89	4043	32	27	\N
510	89	4214	33	4	\N
511	78	4899	8	25	\N
512	78	4973	7	11	\N
513	78	5260	12	14	\N
514	78	4225	32	14	\N
515	78	4046	31	3	\N
516	78	3796	13	36	\N
517	78	5611	35	37	\N
518	78	3954	26	5	\N
519	78	4268	23	34	\N
520	90	5468	31	1	\N
521	90	4229	2	11	\N
522	90	4248	9	19	\N
523	90	5589	27	12	\N
524	90	5456	3	26	\N
525	90	4188	10	24	\N
526	90	5592	10	2	\N
527	90	5167	39	14	\N
528	90	4011	11	23	\N
529	91	5049	22	23	\N
530	91	5056	37	4	\N
531	91	4809	40	37	\N
532	91	4181	29	8	\N
533	91	5093	31	1	\N
534	91	4432	18	12	\N
535	91	5079	2	12	\N
536	91	3930	37	23	\N
537	91	4192	4	21	\N
538	79	4903	6	27	\N
539	79	4002	22	33	\N
540	79	4556	26	2	\N
541	79	5036	36	12	\N
542	79	3983	29	9	\N
543	79	4269	40	3	\N
544	79	5297	18	33	\N
545	79	4440	26	8	\N
546	79	4254	33	37	\N
547	92	4342	33	36	\N
548	92	5583	29	40	\N
549	92	4272	3	31	\N
550	92	4293	17	2	\N
551	92	4217	17	22	\N
552	92	4083	9	21	\N
553	92	3977	9	3	\N
554	92	4037	8	14	\N
555	92	4761	14	5	\N
556	93	5185	30	5	\N
557	93	5492	18	9	\N
558	93	5114	38	37	\N
559	93	5186	36	39	\N
560	93	4239	28	31	\N
561	93	5553	8	22	\N
562	93	5030	17	20	\N
563	93	4031	25	16	\N
564	93	4244	33	25	\N
565	80	5585	25	35	\N
566	80	4750	26	36	\N
567	80	3807	15	33	\N
568	80	4627	30	11	\N
569	80	4246	32	1	\N
570	80	3866	14	19	\N
571	80	5482	9	39	\N
572	80	4237	6	32	\N
573	80	5613	8	34	\N
574	94	4461	40	19	\N
575	94	5487	27	38	\N
576	94	5549	13	39	\N
577	94	4213	6	37	\N
578	94	4782	18	19	\N
579	94	5174	3	26	\N
580	94	4446	17	24	\N
581	94	5189	21	33	\N
582	94	4014	22	40	\N
583	95	4331	10	20	\N
584	95	5591	34	13	\N
585	95	5604	31	15	\N
586	95	4298	4	19	\N
587	95	4024	26	18	\N
588	95	3999	28	13	\N
589	95	5369	16	16	\N
590	95	4766	13	19	\N
591	95	4518	16	1	\N
592	96	5465	1	18	\N
593	96	5223	31	9	\N
594	96	4536	9	20	\N
595	96	4203	31	20	\N
596	96	4548	6	16	\N
597	96	4019	17	29	\N
598	96	5586	29	4	\N
599	96	4526	30	7	\N
600	96	4295	16	27	\N
601	81	4004	10	6	\N
602	81	4785	36	25	\N
603	81	3986	15	13	\N
604	81	4250	32	24	\N
605	81	5505	11	17	\N
606	81	4017	12	3	\N
607	81	4405	8	28	\N
608	81	4436	19	1	\N
609	81	5171	31	13	\N
610	97	5618	18	31	\N
611	97	4386	27	1	\N
612	97	4206	8	25	\N
613	97	4243	2	23	\N
614	97	4449	4	34	\N
615	97	4990	3	5	\N
616	97	5588	23	8	\N
617	97	4035	1	13	\N
618	97	4989	23	24	\N
619	98	4065	34	13	\N
620	98	3974	26	39	\N
621	98	4220	21	9	\N
622	98	5584	12	29	\N
623	98	5046	27	28	\N
624	98	4048	12	6	\N
625	98	4403	22	26	\N
626	98	5460	23	3	\N
627	98	4258	9	37	\N
628	82	4928	29	21	\N
629	82	5499	20	16	\N
630	82	5489	15	15	\N
631	82	4909	37	39	\N
632	82	5491	37	38	\N
633	82	4380	15	4	\N
634	82	5587	13	36	\N
635	82	5004	18	28	\N
636	82	4787	6	31	\N
637	99	4575	12	24	\N
638	99	3978	10	30	\N
639	99	3948	22	12	\N
640	99	4262	20	31	\N
641	99	4635	13	39	\N
642	99	4161	21	4	\N
643	99	5559	36	17	\N
644	99	4264	26	20	\N
645	99	4303	12	8	\N
646	83	4458	24	15	\N
647	83	5151	38	35	\N
648	83	4221	30	8	\N
649	83	4459	8	11	\N
650	83	4103	23	23	\N
651	83	5154	19	12	\N
652	83	4055	19	1	\N
653	83	5215	29	21	\N
654	83	4814	15	21	\N
655	100	4886	12	37	\N
656	100	4039	16	24	\N
657	100	4329	1	7	\N
658	100	5594	16	30	\N
659	100	4003	14	8	\N
660	100	4447	36	30	\N
661	100	4929	21	2	\N
662	100	4288	26	13	\N
663	100	4263	19	38	\N
664	101	5614	12	32	\N
665	101	4027	7	14	\N
666	101	4764	10	11	\N
667	101	5490	23	29	\N
668	101	4207	21	9	\N
669	101	5603	37	34	\N
670	101	3973	33	3	\N
671	101	5566	6	18	\N
672	101	4261	8	25	\N
673	84	4247	12	23	\N
674	84	4009	14	36	\N
675	84	5176	14	11	\N
676	84	4296	19	19	\N
677	84	5595	35	12	\N
678	84	4047	20	16	\N
679	84	4189	7	16	\N
680	84	4483	31	5	\N
681	84	4581	6	39	\N
682	102	5219	16	32	\N
683	102	4299	9	26	\N
684	102	3994	5	29	\N
685	102	3813	1	32	\N
686	102	5051	10	10	\N
687	102	5555	13	38	\N
688	102	5590	3	40	\N
689	102	5087	30	11	\N
690	102	5501	13	15	\N
691	106	4253	39	22	\N
692	106	4307	30	26	\N
693	106	4443	39	39	\N
694	106	5214	22	7	\N
695	106	4495	30	5	\N
696	106	3959	29	20	\N
697	106	4324	36	34	\N
698	106	3981	36	37	\N
699	106	4205	10	24	\N
700	103	3902	3	32	\N
701	103	5495	22	10	\N
702	103	4028	20	8	\N
703	103	4301	23	18	\N
704	103	4423	8	34	\N
705	103	3997	10	35	\N
706	103	5506	7	36	\N
707	103	4116	15	24	\N
708	103	5567	9	37	\N
709	104	4193	23	30	\N
710	104	5088	23	3	\N
711	104	4775	10	29	\N
712	104	5517	34	10	\N
713	104	5562	25	19	\N
714	104	4282	13	7	\N
715	104	4042	15	10	\N
716	104	4187	21	40	\N
717	104	5083	24	37	\N
718	105	4199	40	14	\N
719	105	4013	27	29	\N
720	105	5474	38	2	\N
721	105	5193	20	1	\N
722	105	5155	34	30	\N
723	105	5158	21	7	\N
724	105	3946	18	35	\N
725	105	4216	26	16	\N
726	105	5560	15	25	\N
727	117	3921	28	8	\N
728	117	4401	20	27	\N
729	117	4228	39	32	\N
730	117	4466	7	32	\N
731	117	4006	39	17	\N
732	117	3890	6	21	\N
733	118	3982	9	6	\N
734	118	4000	11	5	\N
735	118	5024	26	10	\N
736	118	5565	20	11	\N
737	118	4005	27	30	\N
738	118	4632	26	11	\N
739	114	4226	20	12	\N
740	114	3924	14	12	\N
741	114	3987	2	20	\N
742	114	4482	36	38	\N
743	114	5027	28	6	\N
744	114	4291	17	28	\N
745	107	5554	8	23	\N
746	107	5484	28	14	\N
747	107	4245	1	1	\N
748	107	5217	15	38	\N
749	107	5463	7	30	\N
750	107	4747	36	5	\N
751	115	3993	5	12	\N
752	115	5069	19	23	\N
753	115	5196	17	31	\N
754	115	4348	3	16	\N
755	115	5178	26	6	\N
756	115	4739	28	8	\N
757	108	4703	2	3	\N
758	108	4481	8	30	\N
759	108	5569	35	38	\N
760	108	4212	29	25	\N
761	108	3988	16	24	\N
762	108	4754	39	22	\N
763	109	5548	34	29	\N
764	109	5459	28	4	\N
765	109	4233	3	31	\N
766	109	4149	31	38	\N
767	109	3863	32	40	\N
768	109	5057	16	32	\N
769	113	3968	24	25	\N
770	113	4334	27	21	\N
771	113	5181	40	30	\N
772	113	5268	30	22	\N
773	113	4045	16	25	\N
774	113	4591	15	14	\N
775	110	5478	19	32	\N
776	110	5045	27	2	\N
777	110	5202	11	33	\N
778	110	5578	7	8	\N
779	110	3965	9	8	\N
780	110	5055	13	32	\N
787	116	4762	38	21	\N
788	116	4924	7	33	\N
789	116	3844	34	3	\N
790	116	4954	5	33	\N
791	116	4038	23	15	\N
792	116	5600	35	14	\N
793	111	5064	21	28	\N
794	111	4016	13	13	\N
795	111	4752	35	15	\N
796	111	5082	3	34	\N
797	111	3766	21	11	\N
798	111	5556	37	25	\N
805	112	5199	36	36	\N
806	112	3936	10	33	\N
807	112	5552	26	13	\N
808	112	4578	25	17	\N
809	112	4469	21	17	\N
810	112	5048	8	12	\N
811	237	3828	36	6	\N
812	237	4799	18	2	\N
813	237	3813	12	40	\N
814	237	4316	21	18	\N
815	237	4925	40	19	\N
816	237	4691	23	11	\N
817	238	4569	22	16	\N
818	238	4778	31	33	\N
819	238	4916	37	23	\N
820	238	4910	13	38	\N
821	238	4766	13	29	\N
822	238	5067	16	29	\N
823	239	4471	15	12	\N
824	239	4714	11	2	\N
825	239	4690	19	1	\N
826	239	4627	14	26	\N
827	239	4904	17	13	\N
828	239	4774	18	29	\N
829	250	5297	13	12	\N
830	250	5290	12	1	\N
831	250	5309	26	16	\N
832	250	4699	25	26	\N
833	250	5001	26	2	\N
834	250	4786	34	17	\N
835	240	4438	26	36	\N
836	240	5451	1	29	\N
837	240	4733	13	12	\N
838	240	4905	20	34	\N
839	240	4705	2	5	\N
840	240	4840	18	1	\N
841	241	4920	28	31	\N
842	241	5288	1	37	\N
843	241	4335	25	29	\N
844	241	5372	19	22	\N
845	241	4845	39	23	\N
846	241	4921	7	25	\N
847	242	4450	36	10	\N
848	242	4737	18	13	\N
849	242	4763	35	14	\N
850	242	4874	29	20	\N
851	242	3848	12	25	\N
852	242	4770	37	6	\N
853	249	4958	4	2	\N
854	249	4967	12	16	\N
855	249	4940	30	2	\N
856	249	5043	11	13	\N
857	249	4992	20	2	\N
858	249	5005	38	29	\N
859	243	4783	40	19	\N
860	243	4785	39	39	\N
861	243	4922	3	4	\N
862	243	4788	19	33	\N
863	243	4614	15	35	\N
864	243	4591	27	15	\N
865	253	4310	31	1	\N
866	253	4907	15	5	\N
867	253	4485	14	12	\N
868	253	3845	24	16	\N
869	253	5201	32	5	\N
870	253	4519	2	4	\N
871	244	4908	22	2	\N
872	244	5303	24	29	\N
873	244	4765	30	2	\N
874	244	4767	3	16	\N
875	244	4926	10	7	\N
876	244	5429	33	12	\N
877	254	4933	32	31	\N
878	254	5364	34	24	\N
879	254	4573	17	26	\N
880	254	4457	30	3	\N
881	254	4841	22	22	\N
882	254	3899	23	1	\N
883	252	4602	14	31	\N
884	252	4466	10	9	\N
885	252	4616	2	34	\N
886	252	4947	11	34	\N
887	252	3850	9	24	\N
888	252	4433	30	11	\N
889	245	4489	13	36	\N
890	245	4688	8	20	\N
891	245	4859	3	23	\N
892	245	4915	9	22	\N
893	245	4898	19	9	\N
894	245	4935	10	18	\N
895	251	4740	3	20	\N
896	251	5019	15	16	\N
897	251	4781	22	6	\N
898	251	4045	29	39	\N
899	251	3837	25	13	\N
900	251	4913	29	36	\N
901	246	5369	38	37	\N
902	246	5373	30	13	\N
903	246	5380	20	24	\N
904	246	5388	18	30	\N
905	246	5381	16	15	\N
906	246	5385	11	35	\N
907	247	4981	11	16	\N
908	247	4598	14	15	\N
909	247	3818	12	13	\N
910	247	5401	15	26	\N
911	247	3823	32	33	\N
912	247	3842	1	17	\N
913	248	4717	24	35	\N
914	248	5003	38	25	\N
915	248	5161	7	27	\N
916	248	4692	23	27	\N
917	248	4743	16	37	\N
918	248	4715	39	18	\N
919	255	3819	31	25	\N
920	255	4311	22	22	\N
921	255	5485	2	32	\N
922	255	4834	4	39	\N
923	255	4963	34	29	\N
924	255	4955	22	3	\N
925	261	4004	39	14	\N
926	261	4522	37	4	\N
927	261	4625	12	11	\N
928	261	4567	18	4	\N
929	261	3942	29	12	\N
930	261	4612	37	4	\N
931	256	5347	3	37	\N
932	256	5497	16	14	\N
933	256	4592	34	30	\N
934	256	5461	35	5	\N
935	256	4568	34	17	\N
936	256	4589	36	12	\N
937	257	4484	7	18	\N
938	257	4477	24	15	\N
939	257	4528	34	30	\N
940	257	4521	30	28	\N
941	257	4619	6	19	\N
942	257	4505	40	13	\N
943	260	4494	9	1	\N
944	260	4504	2	1	\N
945	260	4593	33	20	\N
946	260	4678	34	11	\N
947	260	4520	4	11	\N
948	260	5448	18	26	\N
949	258	4506	11	36	\N
950	258	4580	37	9	\N
951	258	5062	39	32	\N
952	258	4196	18	21	\N
953	258	4493	9	3	\N
954	258	4545	24	40	\N
955	259	4590	3	34	\N
956	259	4540	22	13	\N
957	259	5493	34	37	\N
958	259	4698	21	5	\N
959	259	4626	12	24	\N
960	259	3972	14	5	\N
961	262	5206	19	1	\N
962	262	5074	8	9	\N
963	262	4469	36	10	\N
964	262	4645	35	15	\N
965	262	5136	17	15	\N
966	262	5084	38	30	\N
967	263	3755	4	30	\N
968	263	5209	17	11	\N
969	263	5055	37	9	\N
970	263	5071	23	10	\N
971	263	5207	40	13	\N
972	263	5172	7	10	\N
973	267	5184	17	39	\N
974	267	5063	13	15	\N
975	267	4615	4	16	\N
976	267	5156	2	1	\N
977	267	5436	22	19	\N
978	267	5160	9	36	\N
979	264	5394	27	6	\N
980	264	4600	23	34	\N
981	264	5225	13	4	\N
982	264	5408	18	22	\N
983	264	5090	31	31	\N
984	264	5157	3	17	\N
985	265	5192	28	37	\N
986	265	5177	6	27	\N
987	265	5152	32	19	\N
988	265	5411	19	39	\N
989	265	4565	5	3	\N
990	265	5395	20	28	\N
991	266	5195	9	8	\N
992	266	5222	30	5	\N
993	266	5166	16	5	\N
994	266	5117	31	34	\N
995	266	5107	6	12	\N
996	266	5099	4	18	\N
997	275	4460	37	5	\N
998	275	4333	5	9	\N
999	275	4439	12	29	\N
1000	275	4396	35	13	\N
1001	275	4670	11	3	\N
1002	275	4468	39	5	\N
1003	273	4431	25	18	\N
1004	273	4319	31	32	\N
1005	273	4389	10	3	\N
1006	273	4351	4	27	\N
1007	273	4356	22	17	\N
1008	273	5035	13	3	\N
1009	271	4408	25	15	\N
1010	271	4353	14	7	\N
1011	271	4377	19	29	\N
1012	271	4399	17	6	\N
1013	271	4388	6	15	\N
1014	271	4422	4	40	\N
1015	269	4951	31	36	\N
1016	269	4429	2	7	\N
1017	269	4314	38	31	\N
1018	269	5009	9	14	\N
1019	269	4378	26	38	\N
1020	269	4341	24	11	\N
1021	274	4379	29	33	\N
1022	274	4309	4	28	\N
1023	274	5022	36	12	\N
1024	274	4956	3	3	\N
1025	274	5013	34	20	\N
1026	274	4338	24	19	\N
1027	272	5031	26	22	\N
1028	272	4435	21	20	\N
1029	272	4381	29	14	\N
1030	272	4464	4	10	\N
1031	272	4957	25	30	\N
1032	272	4700	17	19	\N
1033	268	4442	28	12	\N
1034	268	5016	25	8	\N
1035	268	4467	32	39	\N
1036	268	5012	22	35	\N
1037	268	4395	15	18	\N
1038	268	4452	28	18	\N
1039	270	4465	21	8	\N
1040	270	4322	38	4	\N
1041	270	5002	38	33	\N
1042	270	4427	27	29	\N
1043	270	4373	31	35	\N
1044	270	4428	18	12	\N
1045	278	3861	9	8	\N
1046	278	3890	6	18	\N
1047	278	3867	33	38	\N
1048	278	3906	14	26	\N
1049	278	3909	5	4	\N
1050	278	3914	38	25	\N
1051	280	3882	21	19	\N
1052	280	5475	14	31	\N
1053	280	3860	2	21	\N
1054	280	3868	33	15	\N
1055	280	3812	35	25	\N
1056	280	3853	3	3	\N
1057	281	3880	36	13	\N
1058	281	5406	13	9	\N
1059	281	5203	32	10	\N
1060	281	3884	13	26	\N
1061	281	3907	25	4	\N
1062	281	3912	28	5	\N
1063	279	3918	6	11	\N
1064	279	4426	3	14	\N
1065	279	3857	8	31	\N
1066	279	3874	30	11	\N
1067	279	4708	18	30	\N
1068	279	3947	17	29	\N
1069	276	3855	38	33	\N
1070	276	3950	17	3	\N
1071	276	3904	40	16	\N
1072	276	3858	28	27	\N
1073	276	3895	27	12	\N
1074	276	3859	15	21	\N
1075	277	4542	18	4	\N
1076	277	5355	20	13	\N
1077	277	3852	22	27	\N
1078	277	4190	13	31	\N
1079	277	3917	36	32	\N
1080	277	3920	30	33	\N
1081	282	4668	8	4	\N
1082	282	4661	39	6	\N
1083	282	4633	2	11	\N
1084	282	4643	16	34	\N
1085	282	4015	34	8	\N
1086	282	4636	15	1	\N
1087	283	4667	39	21	\N
1088	283	4680	22	8	\N
1089	283	4676	36	16	\N
1090	283	4664	18	3	\N
1091	283	4674	30	1	\N
1092	283	4685	6	21	\N
1093	284	4672	22	26	\N
1094	284	4681	30	8	\N
1095	284	4631	13	37	\N
1096	284	4675	30	23	\N
1097	284	4679	12	2	\N
1098	284	4638	13	35	\N
1099	287	5321	18	38	\N
1100	287	4211	35	7	\N
1101	287	5315	25	15	\N
1102	287	5337	38	5	\N
1103	287	5349	17	19	\N
1104	287	5354	10	23	\N
1105	286	5318	28	3	\N
1106	286	5319	35	36	\N
1107	286	5339	4	16	\N
1108	286	5312	29	36	\N
1109	286	5338	19	27	\N
1110	286	4312	22	8	\N
1111	285	4637	19	37	\N
1112	285	5313	31	22	\N
1113	285	5358	6	22	\N
1114	285	4123	18	26	\N
1115	285	5340	24	33	\N
1116	285	5362	17	23	\N
1117	288	3766	34	19	\N
1118	288	4241	20	4	\N
1119	288	3762	11	17	\N
1120	288	3759	40	13	\N
1121	288	3789	22	25	\N
1122	288	3793	21	5	\N
1123	289	3791	18	39	\N
1124	289	5325	16	10	\N
1125	289	3782	21	15	\N
1126	289	3757	13	6	\N
1127	289	3753	14	16	\N
1128	289	3785	15	25	\N
1129	290	4368	32	27	\N
1130	290	3752	33	20	\N
1131	290	3749	25	27	\N
1132	290	3799	34	22	\N
1133	290	4200	13	38	\N
1134	290	3783	31	15	\N
1135	291	3761	29	6	\N
1136	291	3788	31	24	\N
1137	291	3794	20	22	\N
1138	291	3764	14	11	\N
1139	291	3754	31	21	\N
1140	291	4194	14	18	\N
1141	292	5342	29	33	\N
1142	292	3938	31	21	\N
1143	292	5479	27	38	\N
1144	292	5323	30	15	\N
1145	292	3984	32	24	\N
1146	292	5316	10	3	\N
1147	293	5548	30	19	\N
1148	293	5277	2	1	\N
1149	293	5218	13	20	\N
1150	293	4660	15	10	\N
1151	293	5240	14	13	\N
1152	293	4697	34	29	\N
1153	294	4420	25	25	\N
1154	294	5015	26	4	\N
1155	294	4609	7	35	\N
1156	294	5274	33	20	\N
1157	294	5231	15	21	\N
1158	294	5273	18	12	\N
1159	295	4611	40	10	\N
1160	295	5322	25	19	\N
1161	295	5232	33	31	\N
1162	295	5242	39	10	\N
1163	295	3800	29	33	\N
1164	295	5256	28	8	\N
1165	296	5065	7	1	\N
1166	296	3758	30	14	\N
1167	296	5261	34	37	\N
1168	296	4191	8	11	\N
1169	296	5257	10	5	\N
1170	296	5246	17	20	\N
1171	298	5264	14	28	\N
1172	298	5265	2	7	\N
1173	298	3790	4	7	\N
1174	298	5601	2	8	\N
1175	298	5262	39	21	\N
1176	298	5239	30	40	\N
1177	297	4655	3	26	\N
1178	297	5258	22	17	\N
1179	297	4222	4	31	\N
1180	297	5230	30	7	\N
1181	297	4687	16	4	\N
1182	297	5228	36	2	\N
1183	299	5000	34	40	\N
1184	299	5437	8	21	\N
1185	299	5434	5	16	\N
1186	299	5454	15	2	\N
1187	299	5402	26	32	\N
1188	299	5391	5	26	\N
1189	300	5412	16	6	\N
1190	300	5446	29	19	\N
1191	300	5390	7	30	\N
1192	300	5445	8	30	\N
1193	300	5435	3	27	\N
1194	300	5438	30	9	\N
1195	301	5396	21	20	\N
1196	301	5453	15	16	\N
1197	301	5455	27	34	\N
1198	301	5393	17	8	\N
1199	301	5409	15	27	\N
1200	301	5433	38	9	\N
1201	302	5006	9	20	\N
1202	302	4437	35	11	\N
1203	302	4323	5	23	\N
1204	302	5034	34	18	\N
1205	302	4960	15	8	\N
1206	302	4952	35	23	\N
1207	303	4732	18	35	\N
1208	303	5032	2	23	\N
1209	303	4964	1	26	\N
1210	303	4985	31	14	\N
1211	303	4942	31	17	\N
1212	303	4988	27	15	\N
1213	304	4434	29	17	\N
1214	304	5037	10	27	\N
1215	304	4945	18	21	\N
1216	304	5010	27	38	\N
1217	304	4959	28	19	\N
1218	304	4994	23	8	\N
1219	305	5383	27	32	\N
1220	305	4802	28	31	\N
1221	305	4816	8	37	\N
1222	305	5387	19	19	\N
1223	305	5366	20	24	\N
1224	305	5370	4	35	\N
1225	307	4825	28	40	\N
1226	307	5285	39	36	\N
1227	307	5289	40	35	\N
1228	307	5294	4	26	\N
1229	307	5300	39	20	\N
1230	307	5298	28	10	\N
1231	306	5304	20	12	\N
1232	306	5302	10	13	\N
1233	306	3825	8	35	\N
1234	306	5284	5	16	\N
1235	306	3836	38	15	\N
1236	306	3847	8	30	\N
1237	308	4574	5	1	\N
1238	308	5311	27	25	\N
1239	308	3817	17	2	\N
1240	308	3834	26	23	\N
1241	308	5283	6	9	\N
1242	308	3839	39	28	\N
1243	309	4694	38	22	\N
1244	309	3838	26	37	\N
1245	309	3849	9	27	\N
1246	309	5310	32	25	\N
1247	309	4693	19	36	\N
1248	309	5008	8	13	\N
1249	310	3927	9	39	\N
1250	310	3939	16	7	\N
1251	310	3937	35	19	\N
1252	310	3952	37	21	\N
1253	310	3958	37	4	\N
1254	310	3935	4	12	\N
1255	311	4735	39	25	\N
1256	311	3931	19	29	\N
1257	311	3955	25	28	\N
1258	311	3929	28	20	\N
1259	311	3970	24	5	\N
1260	311	3934	9	34	\N
1261	320	5036	9	10	\N
1262	320	4083	3	12	\N
1263	320	4265	26	6	\N
1264	320	4302	27	36	\N
1265	320	4490	11	3	\N
1266	320	5007	28	8	\N
1267	320	4242	21	15	\N
1268	320	4317	3	24	\N
1269	320	4259	6	38	\N
1270	321	4461	7	34	\N
1271	321	3988	4	14	\N
1272	321	4739	35	10	\N
1273	321	4010	33	25	\N
1274	321	3854	3	29	\N
1275	321	3897	39	15	\N
1276	321	3991	2	37	\N
1277	321	4033	26	38	\N
1278	321	4232	3	30	\N
1279	322	5482	21	24	\N
1280	322	4747	17	31	\N
1281	322	3980	38	16	\N
1282	322	5496	29	36	\N
1283	322	4577	7	17	\N
1284	322	4773	24	39	\N
1285	322	4283	6	30	\N
1286	322	4251	14	12	\N
1287	322	4276	1	15	\N
1288	323	4199	29	28	\N
1289	323	5594	23	18	\N
1290	323	5582	34	30	\N
1291	323	4487	29	26	\N
1292	323	4046	39	4	\N
1293	323	5572	37	33	\N
1294	323	4209	5	39	\N
1295	323	4749	14	29	\N
1296	323	4075	12	26	\N
1297	312	4016	4	35	\N
1298	312	3797	5	40	\N
1299	312	4223	37	26	\N
1300	312	4853	30	4	\N
1301	312	4937	23	25	\N
1302	312	5607	4	34	\N
1303	312	4036	21	20	\N
1304	312	5483	37	23	\N
1305	312	3945	22	13	\N
1306	324	5187	5	28	\N
1307	324	4576	1	1	\N
1308	324	4413	1	31	\N
1309	324	5215	36	18	\N
1310	324	4058	38	38	\N
1311	324	4350	33	28	\N
1312	324	4906	26	30	\N
1313	324	4412	37	29	\N
1314	324	4214	1	27	\N
1315	313	4287	27	18	\N
1316	313	4047	20	12	\N
1317	313	4899	11	34	\N
1318	313	4973	11	32	\N
1319	313	4225	18	12	\N
1320	313	3796	18	13	\N
1321	313	5611	3	22	\N
1322	313	3954	4	29	\N
1323	313	4268	22	4	\N
1324	325	4009	30	2	\N
1325	325	5468	32	40	\N
1326	325	4248	6	27	\N
1327	325	5589	31	9	\N
1328	325	5456	34	35	\N
1329	325	4188	34	6	\N
1330	325	5592	20	35	\N
1331	325	5167	23	29	\N
1332	325	4011	22	19	\N
1333	326	4018	34	37	\N
1334	326	5586	13	32	\N
1335	326	4447	27	24	\N
1336	326	5049	20	30	\N
1337	326	5056	37	24	\N
1338	326	4181	16	40	\N
1339	326	4432	6	37	\N
1340	326	5079	38	20	\N
1341	326	4192	28	29	\N
1342	314	4031	0	0	\N
1343	314	4291	0	0	\N
1344	314	3982	17	28	\N
1345	314	5260	24	14	\N
1346	314	4002	35	12	\N
1347	314	4556	2	11	\N
1348	314	4269	14	32	\N
1349	314	4440	9	32	\N
1350	314	4254	33	6	\N
1351	327	4585	35	34	\N
1352	327	3896	6	27	\N
1353	327	4578	27	17	\N
1354	327	4342	5	20	\N
1355	327	5583	27	4	\N
1356	327	4293	3	2	\N
1357	327	4217	36	3	\N
1358	327	3977	38	8	\N
1359	327	4761	23	28	\N
1360	328	4321	37	38	\N
1361	328	4332	3	12	\N
1362	328	5593	18	3	\N
1363	328	5185	27	15	\N
1364	328	5492	18	40	\N
1365	328	5186	39	25	\N
1366	328	4239	18	15	\N
1367	328	5030	5	9	\N
1368	328	4244	7	1	\N
1369	315	4228	5	27	\N
1370	315	4286	32	23	\N
1371	315	3985	35	6	\N
1372	315	4224	2	31	\N
1373	315	5585	27	19	\N
1374	315	4750	27	10	\N
1375	315	4246	28	9	\N
1376	315	4237	24	25	\N
1377	315	5613	6	13	\N
1378	329	4256	32	14	\N
1379	329	4924	18	19	\N
1380	329	3807	9	26	\N
1381	329	5610	31	6	\N
1382	329	5487	27	22	\N
1383	329	4213	17	2	\N
1384	329	4782	27	37	\N
1385	329	5174	40	8	\N
1386	329	5189	7	12	\N
1387	330	5576	6	17	\N
1388	330	4025	31	19	\N
1389	330	4024	20	8	\N
1390	330	4449	9	21	\N
1391	330	4331	9	15	\N
1392	330	5591	34	8	\N
1393	330	4298	39	10	\N
1394	330	3999	25	34	\N
1395	330	4518	30	5	\N
1396	331	3968	25	39	\N
1397	331	5569	15	13	\N
1398	331	5463	36	13	\N
1399	331	5223	32	39	\N
1400	331	4203	10	23	\N
1401	331	4548	4	15	\N
1402	331	4019	29	12	\N
1403	331	4526	37	28	\N
1404	331	4295	8	18	\N
1405	316	4610	16	22	\N
1406	316	4329	29	3	\N
1407	316	5567	8	16	\N
1408	316	4271	20	4	\N
1409	316	3986	13	17	\N
1410	316	4250	16	22	\N
1411	316	4017	22	33	\N
1412	316	4436	7	17	\N
1413	316	5171	27	3	\N
1414	332	4886	35	16	\N
1415	332	5048	13	7	\N
1416	332	4386	2	19	\N
1417	332	4206	27	33	\N
1418	332	4243	22	3	\N
1419	332	4990	15	15	\N
1420	332	5588	25	34	\N
1421	332	4035	24	23	\N
1422	332	4989	17	40	\N
1423	333	4762	27	6	\N
1424	333	4231	39	33	\N
1425	333	4038	35	40	\N
1426	333	4240	28	21	\N
1427	333	4220	30	9	\N
1428	333	5584	15	29	\N
1429	333	5046	29	6	\N
1430	333	5460	18	24	\N
1431	333	4258	29	5	\N
1432	317	5502	26	38	\N
1433	317	4012	17	35	\N
1434	317	4928	37	20	\N
1435	317	5499	32	26	\N
1436	317	5489	8	23	\N
1437	317	4909	14	18	\N
1438	317	5491	16	3	\N
1439	317	5587	13	24	\N
1440	317	4787	33	9	\N
1441	334	4809	31	24	\N
1442	334	4020	6	1	\N
1443	334	4260	3	27	\N
1444	334	4936	1	19	\N
1445	334	4575	26	40	\N
1446	334	4262	5	39	\N
1447	334	4161	15	27	\N
1448	334	5559	31	12	\N
1449	334	4264	33	1	\N
1450	318	5093	27	32	\N
1451	318	5555	33	14	\N
1452	318	4458	13	37	\N
1453	318	5151	2	3	\N
1454	318	4221	26	1	\N
1455	318	4459	24	1	\N
1456	318	5154	1	28	\N
1457	318	4055	35	24	\N
1458	318	4814	37	39	\N
1459	335	5478	40	7	\N
1460	335	3948	9	28	\N
1461	335	4001	30	13	\N
1462	335	5044	38	15	\N
1463	335	4006	1	19	\N
1464	335	4003	37	2	\N
1465	335	4929	13	2	\N
1466	335	4288	32	11	\N
1467	335	4263	17	27	\N
1468	336	5004	1	6	\N
1469	336	5614	38	15	\N
1470	336	4027	27	14	\N
1471	336	4764	24	22	\N
1472	336	5490	11	2	\N
1473	336	5603	10	28	\N
1474	336	3973	16	29	\N
1475	336	5566	26	6	\N
1476	336	4261	32	4	\N
1477	319	5501	16	3	\N
1478	319	5217	7	28	\N
1479	319	4247	16	33	\N
1480	319	5176	39	33	\N
1481	319	4296	37	10	\N
1482	319	5595	14	22	\N
1483	319	4189	15	12	\N
1484	319	4483	3	13	\N
1485	319	4581	25	23	\N
1486	337	4465	18	8	\N
1487	337	4229	31	40	\N
1488	337	5600	38	30	\N
1489	337	5179	31	17	\N
1490	337	5219	10	39	\N
1491	337	4299	40	25	\N
1492	337	3994	20	32	\N
1493	337	5051	36	31	\N
1494	337	5590	39	18	\N
1495	341	5605	27	2	\N
1496	341	4446	40	22	\N
1497	341	4253	24	28	\N
1498	341	4443	11	2	\N
1499	341	5214	27	11	\N
1500	341	4495	22	2	\N
1501	341	3959	38	25	\N
1502	341	4324	3	38	\N
1503	341	3981	34	17	\N
1504	338	4473	9	39	\N
1505	338	4313	2	25	\N
1506	338	5495	27	9	\N
1507	338	4028	19	40	\N
1508	338	4301	33	39	\N
1509	338	4423	14	1	\N
1510	338	3997	30	9	\N
1511	338	5506	10	21	\N
1512	338	4116	9	12	\N
1513	339	5178	33	29	\N
1514	339	5472	13	5	\N
1515	339	4193	4	35	\N
1516	339	5088	11	3	\N
1517	339	4775	32	2	\N
1518	339	5562	23	38	\N
1519	339	4042	24	13	\N
1520	339	4187	24	32	\N
1521	339	5083	14	35	\N
1522	340	5199	10	5	\N
1523	340	5266	11	10	\N
1524	340	4013	3	8	\N
1525	340	5193	7	35	\N
1526	340	5155	4	15	\N
1527	340	5158	32	37	\N
1528	340	3946	33	17	\N
1529	340	4216	9	9	\N
1530	340	5560	29	31	\N
1531	352	5045	14	18	\N
1532	352	4030	9	33	\N
1533	352	3965	14	6	\N
1534	352	3930	24	11	\N
1535	352	4212	38	23	\N
1536	352	3921	2	31	\N
1537	353	5618	37	18	\N
1538	353	5069	35	34	\N
1539	353	5196	8	3	\N
1540	353	3995	5	27	\N
1541	353	5268	24	31	\N
1542	353	4632	30	33	\N
1543	349	3902	35	17	\N
1544	349	4754	34	16	\N
1545	349	4005	35	38	\N
1546	349	3924	11	35	\N
1547	349	3987	31	17	\N
1548	349	4482	35	30	\N
1549	342	5058	21	17	\N
1550	342	5129	19	35	\N
1551	342	5459	19	36	\N
1552	342	3910	15	27	\N
1553	342	4760	5	29	\N
1554	342	4207	6	3	\N
1555	350	4000	33	30	\N
1556	350	4481	32	3	\N
1557	350	4205	4	16	\N
1558	350	4014	33	21	\N
1559	350	3751	30	6	\N
1560	350	3993	32	19	\N
1561	343	4272	37	1	\N
1562	343	3974	3	20	\N
1563	343	5072	27	1	\N
1564	343	4041	11	36	\N
1565	343	4914	34	7	\N
1566	343	4703	16	38	\N
1567	344	4624	31	6	\N
1568	344	4334	38	20	\N
1569	344	5484	36	28	\N
1570	344	4315	26	29	\N
1571	344	4270	19	35	\N
1572	344	5057	20	37	\N
1573	348	5229	38	30	\N
1574	348	4233	18	35	\N
1575	348	4290	23	38	\N
1576	348	4037	24	17	\N
1577	348	4149	18	22	\N
1578	348	5181	26	40	\N
1579	345	5073	32	7	\N
1580	345	4245	39	11	\N
1581	345	4048	33	25	\N
1582	345	4303	29	24	\N
1583	345	4635	40	4	\N
1584	345	5202	8	12	\N
1585	351	4065	6	5	\N
1586	351	3936	25	8	\N
1587	351	4405	28	40	\N
1588	351	5578	33	17	\N
1589	351	3844	37	6	\N
1590	351	4954	28	24	\N
1591	346	4304	37	37	\N
1592	346	5474	29	6	\N
1593	346	5024	18	6	\N
1594	346	4608	39	18	\N
1595	346	5216	28	36	\N
1596	346	5082	15	8	\N
1597	347	4903	16	30	\N
1598	347	4039	17	33	\N
1599	347	5553	25	40	\N
1600	347	4629	12	13	\N
1601	347	4613	30	13	\N
1602	347	5552	19	24	\N
1603	354	5465	9	31	\N
1604	354	4752	40	9	\N
1605	354	5577	36	4	\N
1606	354	5565	1	35	\N
1607	354	4034	8	19	\N
1608	354	5027	38	40	\N
1609	357	4226	2	8	\N
1610	357	3866	8	26	\N
1611	357	5200	10	21	\N
1612	357	3863	29	30	\N
1613	357	4500	8	25	\N
1614	357	4348	6	24	\N
1615	356	4282	32	23	\N
1616	356	5604	35	15	\N
1617	356	3978	20	27	\N
1618	356	4043	1	22	\N
1619	356	5077	36	37	\N
1620	356	5081	7	21	\N
1621	355	5064	3	29	\N
1622	355	4307	22	10	\N
1623	355	5182	31	11	\N
1624	355	5505	7	3	\N
1625	355	4772	24	14	\N
1626	355	4103	25	18	\N
1628	358	4925	19	19	\N
1629	358	4691	27	33	\N
1630	358	3816	23	38	\N
1631	358	4688	32	15	\N
1632	358	4598	2	2	\N
1633	358	4840	16	17	\N
1634	359	4766	5	35	\N
1635	359	5198	7	22	\N
1636	359	4477	4	5	\N
1637	359	3850	17	35	\N
1638	359	3813	13	19	\N
1639	359	3837	6	16	\N
1640	360	4913	11	6	\N
1641	360	5594	19	40	\N
1642	360	4768	39	40	\N
1643	360	4687	14	37	\N
1644	360	4471	25	11	\N
1645	360	4690	14	29	\N
1646	361	4438	34	34	\N
1647	361	5451	36	15	\N
1648	361	4905	40	1	\N
1649	361	4612	4	2	\N
1650	361	4433	33	32	\N
1651	361	4747	40	17	\N
1652	362	4699	26	36	\N
1653	362	4834	29	27	\N
1654	362	4616	10	18	\N
1655	362	4920	36	20	\N
1656	362	4335	4	7	\N
1657	362	5372	2	39	\N
1658	363	4933	8	33	\N
1659	363	3899	6	2	\N
1660	363	4915	35	14	\N
1661	363	4450	22	11	\N
1662	363	4763	3	32	\N
1663	363	3848	36	29	\N
1664	370	4769	8	17	\N
1665	370	4921	4	3	\N
1666	370	4845	4	21	\N
1667	370	4698	33	7	\N
1668	370	4940	22	38	\N
1669	370	5043	10	10	\N
1670	364	4916	30	38	\N
1671	364	4004	40	23	\N
1672	364	4786	21	6	\N
1673	364	4740	29	7	\N
1674	364	4922	24	10	\N
1675	364	4591	5	14	\N
1676	372	4874	25	23	\N
1677	372	4788	22	40	\N
1678	372	3817	12	7	\N
1679	372	4310	39	32	\N
1680	372	3845	28	33	\N
1681	372	5201	2	34	\N
1682	365	4908	8	8	\N
1683	365	4765	10	32	\N
1684	365	4767	15	25	\N
1685	365	5429	6	15	\N
1686	365	4778	8	34	\N
1687	365	4774	24	12	\N
1688	366	4935	23	4	\N
1689	366	5071	38	23	\N
1690	366	4632	33	31	\N
1691	366	3842	10	5	\N
1692	366	3819	29	17	\N
1693	366	4926	36	13	\N
1694	371	4781	37	19	\N
1695	371	4841	35	38	\N
1696	371	4910	37	26	\N
1697	371	3948	15	10	\N
1698	371	3844	36	32	\N
1699	371	4602	32	35	\N
1700	367	5369	14	35	\N
1701	367	5373	23	6	\N
1702	367	5380	7	32	\N
1703	367	5388	16	7	\N
1704	367	5381	18	27	\N
1705	367	5385	37	12	\N
1706	368	3818	25	17	\N
1707	368	5401	36	17	\N
1708	368	3823	18	36	\N
1709	368	4405	35	13	\N
1710	368	4311	30	10	\N
1711	368	3811	36	28	\N
1712	369	4692	25	14	\N
1713	369	4743	37	8	\N
1714	369	4705	35	33	\N
1715	369	4737	10	29	\N
1716	369	3993	17	40	\N
1717	369	5015	9	8	\N
1718	374	4955	11	38	\N
1719	374	4573	10	37	\N
1720	374	5303	23	4	\N
1721	374	5001	27	12	\N
1722	374	4927	6	4	\N
1723	374	4785	32	38	\N
1724	373	4473	22	17	\N
1725	373	4567	39	39	\N
1726	373	4600	30	30	\N
1727	373	4519	15	10	\N
1728	373	4493	39	33	\N
1729	373	5207	38	15	\N
1730	375	4504	32	6	\N
1731	375	4619	17	18	\N
1732	375	4626	39	9	\N
1733	375	5347	36	27	\N
1734	375	5461	31	28	\N
1735	375	4568	6	4	\N
1736	376	4497	37	38	\N
1737	376	4457	38	15	\N
1738	376	4466	4	38	\N
1739	376	4620	29	1	\N
1740	376	4528	39	9	\N
1741	376	4476	2	24	\N
1742	379	4496	40	2	\N
1743	379	4478	2	5	\N
1744	379	4445	3	1	\N
1745	379	5608	6	30	\N
1746	379	3960	15	9	\N
1747	379	4505	26	17	\N
1748	377	4678	37	20	\N
1749	377	4508	31	21	\N
1750	377	4625	36	32	\N
1751	377	4917	18	31	\N
1752	377	4506	23	17	\N
1753	377	4580	30	1	\N
1754	378	4484	31	8	\N
1755	378	5446	20	30	\N
1756	378	5023	3	2	\N
1757	378	4593	21	37	\N
1758	378	4645	15	22	\N
1759	378	4590	8	37	\N
1760	380	5061	34	38	\N
1761	380	5067	22	7	\N
1762	380	5003	28	6	\N
1763	380	5074	14	2	\N
1764	380	4469	17	6	\N
1765	380	5084	28	32	\N
1766	381	5055	28	13	\N
1767	381	5211	39	7	\N
1768	381	5063	33	2	\N
1769	381	5062	2	28	\N
1770	381	5028	14	26	\N
1771	381	5411	12	20	\N
1772	385	5184	27	8	\N
1773	385	5206	3	6	\N
1774	385	4485	7	12	\N
1775	385	4500	19	7	\N
1776	385	5436	40	31	\N
1777	385	5160	27	17	\N
1778	382	5394	11	28	\N
1779	382	3926	15	24	\N
1780	382	3942	7	37	\N
1781	382	3755	15	16	\N
1782	382	5408	26	4	\N
1783	382	5090	17	24	\N
1784	383	5031	34	16	\N
1785	383	4460	26	23	\N
1786	383	4592	6	32	\N
1787	383	5152	5	16	\N
1788	383	4565	34	37	\N
1789	383	5395	26	33	\N
1790	384	5195	38	1	\N
1791	384	5222	32	34	\N
1792	384	5271	18	36	\N
1793	384	5082	10	12	\N
1794	384	4522	25	9	\N
1795	384	4611	27	19	\N
1796	386	5107	8	10	\N
1797	386	5135	28	13	\N
1798	386	4757	40	38	\N
1799	386	5117	27	34	\N
1800	386	5161	30	11	\N
1801	386	4615	39	30	\N
1802	392	5006	16	35	\N
1803	392	4947	14	7	\N
1804	392	4327	12	7	\N
1805	392	4345	27	33	\N
1806	392	4439	11	35	\N
1807	392	4468	9	22	\N
1808	391	4307	10	11	\N
1809	391	4341	4	23	\N
1810	391	4957	9	16	\N
1811	391	4389	16	25	\N
1812	391	4356	9	17	\N
1813	391	5035	12	10	\N
1814	389	4408	8	10	\N
1815	389	5038	3	1	\N
1816	389	4351	19	15	\N
1817	389	4442	33	15	\N
1818	389	4952	26	8	\N
1819	389	4388	16	10	\N
1820	388	4333	17	29	\N
1821	388	5016	35	8	\N
1822	388	5002	2	26	\N
1823	388	5022	30	17	\N
1824	388	4451	27	17	\N
1825	388	5005	1	5	\N
1826	390	4464	12	25	\N
1827	390	4958	34	25	\N
1828	390	5032	19	30	\N
1829	390	5019	33	26	\N
1830	390	4963	26	21	\N
1831	390	4700	13	7	\N
1832	387	5013	6	10	\N
1833	387	4316	23	1	\N
1834	387	4429	18	35	\N
1835	387	4428	36	6	\N
1836	387	4467	8	16	\N
1837	387	5012	30	33	\N
1838	395	3861	14	36	\N
1839	395	3890	2	25	\N
1840	395	3859	16	19	\N
1841	395	3867	9	19	\N
1842	395	3906	35	18	\N
1843	395	3909	20	32	\N
1844	397	3854	30	35	\N
1845	397	4670	25	20	\N
1846	397	3918	30	32	\N
1847	397	3905	31	26	\N
1848	397	4212	13	38	\N
1849	397	3882	15	26	\N
1850	398	4230	9	25	\N
1851	398	3901	40	31	\N
1852	398	3880	22	25	\N
1853	398	5406	11	34	\N
1854	398	3884	11	30	\N
1855	398	3907	18	36	\N
1856	396	3912	18	37	\N
1857	396	3920	12	4	\N
1858	396	3853	29	23	\N
1859	396	4426	25	2	\N
1860	396	3857	37	26	\N
1861	396	4708	11	30	\N
1862	393	3855	40	1	\N
1863	393	3947	24	12	\N
1864	393	5475	7	26	\N
1865	393	3874	3	19	\N
1866	393	4660	36	24	\N
1867	393	3895	30	32	\N
1868	394	5355	21	18	\N
1869	394	4190	29	6	\N
1870	394	3917	6	39	\N
1871	394	3922	38	21	\N
1872	394	5485	2	17	\N
1873	394	3914	14	6	\N
1874	399	3950	38	5	\N
1875	399	3812	3	23	\N
1876	399	3868	38	36	\N
1877	399	3852	27	2	\N
1878	399	3919	1	13	\N
1879	399	4277	16	26	\N
1880	400	4668	8	5	\N
1881	400	4633	3	20	\N
1882	400	4326	21	20	\N
1883	400	4642	19	17	\N
1884	400	4015	40	14	\N
1885	400	4636	37	26	\N
1886	401	4667	27	17	\N
1887	401	4680	34	24	\N
1888	401	4123	33	20	\N
1889	401	4686	33	12	\N
1890	401	4674	6	40	\N
1891	401	4685	20	9	\N
1892	402	4681	5	19	\N
1893	402	4631	28	26	\N
1894	402	4637	27	34	\N
1895	402	4675	17	34	\N
1896	402	4679	26	7	\N
1897	402	4638	5	12	\N
1898	405	5321	39	22	\N
1899	405	5351	23	5	\N
1900	405	5315	21	27	\N
1901	405	5337	2	13	\N
1902	405	5349	4	26	\N
1903	405	5354	31	37	\N
1904	404	5318	34	36	\N
1905	404	5312	13	28	\N
1906	404	5479	30	40	\N
1907	404	5346	24	18	\N
1908	404	5359	22	5	\N
1909	404	5313	14	26	\N
1910	403	5358	38	31	\N
1911	403	4574	5	25	\N
1912	403	5319	26	36	\N
1913	403	5357	13	28	\N
1914	403	5340	4	11	\N
1915	403	5362	13	18	\N
1916	406	4431	3	11	\N
1917	406	5350	35	17	\N
1918	406	5348	13	11	\N
1919	406	5336	24	40	\N
1920	406	4421	35	26	\N
1921	406	5339	9	25	\N
1922	407	3766	1	8	\N
1923	407	4241	14	20	\N
1924	407	3805	10	7	\N
1925	407	3750	16	1	\N
1926	407	3789	21	3	\N
1927	407	3793	8	11	\N
1928	408	3791	29	22	\N
1929	408	3765	18	27	\N
1930	408	3792	29	27	\N
1931	408	3757	24	6	\N
1932	408	3753	24	17	\N
1933	408	3785	1	16	\N
1934	409	3752	11	15	\N
1935	409	3759	18	16	\N
1936	409	3790	25	19	\N
1937	409	3749	14	23	\N
1938	409	4200	20	34	\N
1939	409	3783	17	1	\N
1940	410	3761	29	35	\N
1941	410	3788	27	5	\N
1942	410	3764	24	5	\N
1943	410	3754	12	23	\N
1944	410	4194	10	19	\N
1945	410	3938	1	28	\N
1946	411	5342	5	8	\N
1947	411	5323	18	22	\N
1948	411	5316	40	9	\N
1949	411	5325	16	23	\N
1950	411	5352	3	1	\N
1951	411	4420	4	40	\N
1952	412	5277	32	33	\N
1953	412	3758	38	29	\N
1954	412	5065	24	16	\N
1955	412	5228	16	15	\N
1956	412	5262	27	18	\N
1957	412	5129	13	11	\N
1958	413	4609	4	33	\N
1959	413	5274	17	36	\N
1960	413	5231	15	32	\N
1961	413	5230	21	1	\N
1962	413	4228	17	7	\N
1963	413	5169	4	18	\N
1964	414	5221	37	6	\N
1965	414	4655	40	16	\N
1966	414	5215	6	27	\N
1967	414	5273	39	39	\N
1968	414	5242	15	17	\N
1969	414	3800	14	33	\N
1970	415	5216	29	28	\N
1971	415	4482	5	2	\N
1972	415	5240	20	20	\N
1973	415	5261	20	35	\N
1974	415	5257	31	14	\N
1975	415	5246	18	25	\N
1976	417	5264	6	29	\N
1977	417	5265	38	16	\N
1978	417	5601	9	9	\N
1979	417	5218	22	8	\N
1980	417	5322	8	9	\N
1981	417	5225	18	7	\N
1982	416	5258	12	20	\N
1983	416	4239	22	23	\N
1984	416	4733	14	5	\N
1985	416	5553	27	23	\N
1986	416	4732	28	25	\N
1987	416	5272	25	7	\N
1988	418	5437	1	16	\N
1989	418	5434	23	10	\N
1990	418	5454	20	38	\N
1991	418	5455	35	21	\N
1992	418	5402	34	14	\N
1993	418	5391	13	22	\N
1994	419	5412	2	4	\N
1995	419	5390	38	28	\N
1996	419	5392	37	35	\N
1997	419	5443	18	33	\N
1998	419	5445	14	30	\N
1999	419	5435	25	22	\N
2000	420	5396	25	24	\N
2001	420	5453	27	17	\N
2002	420	3972	36	30	\N
2003	420	5393	12	20	\N
2004	420	5409	37	12	\N
2005	420	5433	33	4	\N
2006	421	5034	1	32	\N
2007	421	5009	20	33	\N
2008	421	5039	12	16	\N
2009	421	4988	33	22	\N
2010	421	4964	15	11	\N
2011	421	4989	34	23	\N
2012	422	4985	25	38	\N
2013	422	4939	19	13	\N
2014	422	4981	1	34	\N
2015	422	5001	18	8	\N
2016	422	4965	32	25	\N
2017	422	4944	9	34	\N
2018	423	4434	4	34	\N
2019	423	4945	26	1	\N
2020	423	5010	20	21	\N
2021	423	4738	33	10	\N
2022	423	4959	8	35	\N
2023	423	4994	24	37	\N
2024	424	5299	7	15	\N
2025	424	3849	9	30	\N
2026	424	5287	14	24	\N
2027	424	5365	1	12	\N
2028	424	5284	30	35	\N
2029	424	4816	31	18	\N
2030	425	5302	16	23	\N
2031	425	3825	10	28	\N
2032	425	5306	5	29	\N
2033	425	4435	37	12	\N
2034	425	3810	29	20	\N
2035	425	3836	4	7	\N
2036	426	3846	11	36	\N
2037	426	5288	1	40	\N
2038	426	5307	10	28	\N
2039	426	3809	30	23	\N
2040	426	3834	4	30	\N
2041	426	3839	29	38	\N
2042	427	3838	11	5	\N
2043	427	5310	21	3	\N
2044	427	4693	28	31	\N
2045	427	5008	17	35	\N
2046	427	5363	36	34	\N
2047	427	4714	27	39	\N
2048	428	3927	34	32	\N
2049	428	3966	18	27	\N
2050	428	3939	3	30	\N
2051	428	3937	36	36	\N
2052	428	3958	8	33	\N
2053	428	3935	2	13	\N
2054	429	3961	13	32	\N
2055	429	3962	19	29	\N
2056	429	3956	33	1	\N
2057	429	3955	15	34	\N
2058	429	3929	40	1	\N
2059	429	3934	30	21	\N
2060	438	4265	32	2	\N
2061	438	4302	24	32	\N
2062	438	5596	22	28	\N
2063	438	3983	5	36	\N
2064	438	4490	10	22	\N
2065	438	5007	31	34	\N
2066	438	4242	33	37	\N
2067	438	4317	7	19	\N
2068	438	4259	29	31	\N
2069	439	4739	32	2	\N
2070	439	5185	35	27	\N
2071	439	4752	23	16	\N
2072	439	4588	36	10	\N
2073	439	5591	24	5	\N
2074	439	4024	35	7	\N
2075	439	3991	23	30	\N
2076	439	4033	12	38	\N
2077	439	4232	14	5	\N
2078	440	5482	16	26	\N
2079	440	4455	24	13	\N
2080	440	5183	20	26	\N
2081	440	3980	25	3	\N
2082	440	5496	5	35	\N
2083	440	4773	32	40	\N
2084	440	4283	30	11	\N
2085	440	4251	27	7	\N
2086	440	4276	37	29	\N
2087	441	4199	18	32	\N
2088	441	4487	14	11	\N
2089	441	4046	35	14	\N
2090	441	5572	28	15	\N
2091	441	4273	30	19	\N
2092	441	3974	28	28	\N
2093	441	4413	11	8	\N
2094	441	4209	5	17	\N
2095	441	4749	40	6	\N
2096	430	4016	7	5	\N
2097	430	5066	13	13	\N
2098	430	4223	16	19	\N
2099	430	4853	32	32	\N
2100	430	4937	9	1	\N
2101	430	5607	7	37	\N
2102	430	4036	2	9	\N
2103	430	5483	3	11	\N
2104	430	3945	18	26	\N
2105	442	5187	7	39	\N
2106	442	4576	16	15	\N
2107	442	5597	19	17	\N
2108	442	4210	33	13	\N
2109	442	5581	11	33	\N
2110	442	4423	33	37	\N
2111	442	4017	27	29	\N
2112	442	4412	22	14	\N
2113	442	4214	18	19	\N
2114	431	4287	15	11	\N
2115	431	4461	27	22	\N
2116	431	4750	7	19	\N
2117	431	3807	6	29	\N
2118	431	4973	36	2	\N
2119	431	4225	40	34	\N
2120	431	5611	28	19	\N
2121	431	3954	24	36	\N
2122	431	4268	11	32	\N
2123	443	3976	33	6	\N
2124	443	5072	13	11	\N
2125	443	5468	1	39	\N
2126	443	4248	30	3	\N
2127	443	5589	7	34	\N
2128	443	5456	27	39	\N
2129	443	5592	18	34	\N
2130	443	5167	8	3	\N
2131	443	4011	31	11	\N
2132	444	4018	39	22	\N
2133	444	5586	34	14	\N
2134	444	5555	17	25	\N
2135	444	3990	7	25	\N
2136	444	5049	24	31	\N
2137	444	5056	38	1	\N
2138	444	4181	33	9	\N
2139	444	4432	4	23	\N
2140	444	5079	27	11	\N
2141	432	3982	15	40	\N
2142	432	4321	5	9	\N
2143	432	4229	27	37	\N
2144	432	4031	8	2	\N
2145	432	5491	33	8	\N
2146	432	4291	7	34	\N
2147	432	4002	24	4	\N
2148	432	4440	17	14	\N
2149	432	4254	6	29	\N
2150	445	4585	30	6	\N
2151	445	3902	33	17	\N
2152	445	3897	34	3	\N
2153	445	4048	7	18	\N
2154	445	5051	22	37	\N
2155	445	4037	15	24	\N
2156	445	4293	28	31	\N
2157	445	3977	22	21	\N
2158	445	4761	7	15	\N
2159	446	4332	1	30	\N
2160	446	5593	23	24	\N
2161	446	4783	22	2	\N
2162	446	5068	27	27	\N
2163	446	4754	40	19	\N
2164	446	4914	11	39	\N
2165	446	5492	2	3	\N
2166	446	5186	32	23	\N
2167	446	4244	9	20	\N
2168	433	3985	21	1	\N
2169	433	4224	18	16	\N
2170	433	4334	17	3	\N
2171	433	3978	37	25	\N
2172	433	4627	10	31	\N
2173	433	5585	38	27	\N
2174	433	4246	37	15	\N
2175	433	4237	1	10	\N
2176	433	5613	7	6	\N
2177	447	4256	16	27	\N
2178	447	4924	12	1	\N
2179	447	5610	24	23	\N
2180	447	4770	37	4	\N
2181	447	5487	9	40	\N
2182	447	4213	1	4	\N
2183	447	4782	13	12	\N
2184	447	5174	24	33	\N
2185	447	5189	11	36	\N
2186	448	5576	1	14	\N
2187	448	4025	7	37	\N
2188	448	4449	21	10	\N
2189	448	4010	30	17	\N
2190	448	5505	31	10	\N
2191	448	4014	39	26	\N
2192	448	4331	9	21	\N
2193	448	4298	40	29	\N
2194	448	3999	15	27	\N
2195	449	3968	31	35	\N
2196	449	5463	16	21	\N
2197	449	4481	17	38	\N
2198	449	5499	29	26	\N
2199	449	5081	32	21	\N
2200	449	5560	9	1	\N
2201	449	4203	22	15	\N
2202	449	4019	24	15	\N
2203	449	4295	25	10	\N
2204	434	4610	27	6	\N
2205	434	4329	34	15	\N
2206	434	4271	36	20	\N
2207	434	4629	18	39	\N
2208	434	5469	36	26	\N
2209	434	3986	8	33	\N
2210	434	4250	23	10	\N
2211	434	4436	13	17	\N
2212	434	5171	29	34	\N
2213	450	5048	32	4	\N
2214	450	4621	21	22	\N
2215	450	4188	13	20	\N
2216	450	4386	27	39	\N
2217	450	4206	15	21	\N
2218	450	4243	33	13	\N
2219	450	4990	25	34	\N
2220	450	5588	40	30	\N
2221	450	4035	30	14	\N
2222	451	4762	27	5	\N
2223	451	4038	26	40	\N
2224	451	4240	9	23	\N
2225	451	4301	31	8	\N
2226	451	4083	4	39	\N
2227	451	4220	15	29	\N
2228	451	5584	2	32	\N
2229	451	5046	6	39	\N
2230	451	4258	37	18	\N
2231	435	5502	15	14	\N
2232	435	4012	8	33	\N
2233	435	4030	20	25	\N
2234	435	4269	38	10	\N
2235	435	4928	19	9	\N
2236	435	5489	6	22	\N
2237	435	4909	14	13	\N
2238	435	5587	24	6	\N
2239	435	4787	11	30	\N
2240	452	4260	8	3	\N
2241	452	4936	26	36	\N
2242	452	5177	25	15	\N
2243	452	4618	34	28	\N
2244	452	4192	34	18	\N
2245	452	4303	20	27	\N
2246	452	4575	22	27	\N
2247	452	4262	2	25	\N
2248	452	4264	5	26	\N
2249	436	4350	12	12	\N
2250	436	5559	6	21	\N
2251	436	5027	17	35	\N
2252	436	5565	23	10	\N
2253	436	4458	12	16	\N
2254	436	5151	16	30	\N
2255	436	4459	33	6	\N
2256	436	5154	13	4	\N
2257	436	4814	2	20	\N
2258	453	5478	8	6	\N
2259	453	4001	22	40	\N
2260	453	5044	28	38	\N
2261	453	5200	24	2	\N
2262	453	4205	16	20	\N
2263	453	4003	25	5	\N
2264	453	4929	21	34	\N
2265	453	4288	19	37	\N
2266	453	4263	19	18	\N
2267	454	5004	1	22	\N
2268	454	5577	2	12	\N
2269	454	5614	9	14	\N
2270	454	4027	14	38	\N
2271	454	5490	22	18	\N
2272	454	5603	39	18	\N
2273	454	3973	29	29	\N
2274	454	5566	32	17	\N
2275	454	4261	34	8	\N
2276	437	4274	32	31	\N
2277	437	4267	39	12	\N
2278	437	3797	33	38	\N
2279	437	3988	29	1	\N
2280	437	5176	8	28	\N
2281	437	4296	10	30	\N
2282	437	5595	18	13	\N
2283	437	4483	12	34	\N
2284	437	4581	27	32	\N
2285	455	4465	39	38	\N
2286	455	5600	35	9	\N
2287	455	5179	33	13	\N
2288	455	4906	32	23	\N
2289	455	4217	37	9	\N
2290	455	5219	22	12	\N
2291	455	4299	6	18	\N
2292	455	3994	31	31	\N
2293	455	5590	8	23	\N
2294	456	4313	25	15	\N
2295	456	5598	16	15	\N
2296	456	4020	17	25	\N
2297	456	5616	17	28	\N
2298	456	5495	39	8	\N
2299	456	4028	34	6	\N
2300	456	3997	26	10	\N
2301	456	5506	11	10	\N
2302	456	4116	26	3	\N
2303	457	4282	16	39	\N
2304	457	4443	40	13	\N
2305	457	5460	28	24	\N
2306	457	4614	29	5	\N
2307	457	4193	16	38	\N
2308	457	5088	18	31	\N
2309	457	4775	25	32	\N
2310	457	4042	29	24	\N
2311	457	5083	25	35	\N
2312	458	5472	12	14	\N
2313	458	5223	32	24	\N
2314	458	4697	24	9	\N
2315	458	4013	40	2	\N
2316	458	5193	21	26	\N
2317	458	5155	24	29	\N
2318	458	5158	20	13	\N
2319	458	3946	12	21	\N
2320	458	4216	31	23	\N
2321	459	4253	31	26	\N
2322	459	5605	13	22	\N
2323	459	5181	11	24	\N
2324	459	5214	11	30	\N
2325	459	4006	1	36	\N
2326	459	3959	35	29	\N
2327	459	3981	3	16	\N
2328	459	4324	11	15	\N
2329	459	4495	11	6	\N
2330	469	5192	8	13	\N
2331	469	4009	34	4	\N
2332	469	3936	31	35	\N
2333	469	4290	12	20	\N
2334	469	5026	14	10	\N
2335	469	3856	1	3	\N
2336	470	5618	33	5	\N
2337	470	5069	40	33	\N
2338	470	5196	8	37	\N
2339	470	3995	29	32	\N
2340	470	5268	36	22	\N
2341	470	5497	31	37	\N
2342	466	4005	38	10	\N
2343	466	4247	24	40	\N
2344	466	5024	10	36	\N
2345	466	4589	14	35	\N
2346	466	4207	26	25	\N
2347	466	3924	10	33	\N
2348	460	5459	4	31	\N
2349	460	5073	37	1	\N
2350	460	4809	11	27	\N
2351	460	3796	25	3	\N
2352	460	3930	5	33	\N
2353	460	4047	29	34	\N
2354	467	3751	11	3	\N
2355	467	5465	14	15	\N
2356	467	4272	12	35	\N
2357	467	4556	27	3	\N
2358	467	4189	14	2	\N
2359	467	3923	8	9	\N
2360	461	4041	15	1	\N
2361	461	5182	37	15	\N
2362	461	5266	1	19	\N
2363	461	5217	10	3	\N
2364	461	5077	15	3	\N
2365	461	4703	23	26	\N
2366	462	4903	23	5	\N
2367	462	4187	23	7	\N
2368	462	5484	26	16	\N
2369	462	3896	7	1	\N
2370	462	4315	18	26	\N
2371	462	4270	1	14	\N
2372	463	5064	13	30	\N
2373	463	5036	35	22	\N
2374	463	5583	13	18	\N
2375	463	4447	21	32	\N
2376	463	5500	6	30	\N
2377	463	4635	6	17	\N
2378	468	4328	7	35	\N
2379	468	5229	15	11	\N
2380	468	5604	35	12	\N
2381	468	4231	37	1	\N
2382	468	5297	6	3	\N
2383	468	5578	4	2	\N
2384	464	5199	26	29	\N
2385	464	5569	7	24	\N
2386	464	5202	13	26	\N
2387	464	4760	32	25	\N
2388	464	4446	30	2	\N
2389	464	4608	21	23	\N
2390	465	5087	25	1	\N
2391	465	4494	25	4	\N
2392	465	3863	19	24	\N
2393	465	4518	16	14	\N
2394	465	4103	11	28	\N
2395	465	4039	17	20	\N
2396	474	4613	24	39	\N
2397	474	4954	19	37	\N
2398	474	5260	24	20	\N
2399	474	5058	21	32	\N
2400	474	4221	27	23	\N
2401	474	4034	6	2	\N
2402	475	5045	32	23	\N
2403	475	4286	9	40	\N
2404	475	5030	35	26	\N
2405	475	5089	39	5	\N
2406	475	5178	10	40	\N
2407	475	4226	24	39	\N
2408	473	4624	31	40	\N
2409	473	5552	4	23	\N
2410	473	5209	4	37	\N
2411	473	5567	32	22	\N
2412	473	3864	10	1	\N
2413	473	5562	23	34	\N
2414	472	4772	40	12	\N
2415	472	4008	21	10	\N
2416	472	3866	26	16	\N
2417	472	5501	20	10	\N
2418	472	4043	27	39	\N
2419	472	3965	2	2	\N
2420	471	4578	15	36	\N
2421	471	5057	36	11	\N
2422	471	5582	7	27	\N
2423	471	3987	30	6	\N
2424	471	3921	34	18	\N
2425	471	4233	38	13	\N
2426	476	4446	39	35	\N
2427	476	5382	23	31	\N
2428	476	4767	6	25	\N
2429	476	4450	19	12	\N
2430	476	4763	8	32	\N
2431	476	4925	6	11	\N
2432	477	5055	13	6	\N
2433	477	4910	15	11	\N
2434	477	4911	11	21	\N
2435	477	4933	15	12	\N
2436	477	4477	3	19	\N
2437	477	3813	11	18	\N
2438	478	3844	5	36	\N
2439	478	4756	26	15	\N
2440	478	4405	30	32	\N
2441	478	4913	11	35	\N
2442	478	4768	16	22	\N
2443	478	4690	37	21	\N
2444	479	4788	37	5	\N
2445	479	4600	40	7	\N
2446	479	3816	10	14	\N
2447	479	3845	11	14	\N
2448	479	4433	39	21	\N
2449	479	4747	24	28	\N
2450	480	4699	40	13	\N
2451	480	4616	4	23	\N
2452	480	5501	35	17	\N
2453	480	4907	17	39	\N
2454	480	4920	2	29	\N
2455	480	4335	39	26	\N
2456	481	4519	32	34	\N
2457	481	4781	17	16	\N
2458	481	3850	16	26	\N
2459	481	4732	22	19	\N
2460	481	4590	23	13	\N
2461	481	3848	5	14	\N
2462	488	4602	25	34	\N
2463	488	4973	23	38	\N
2464	488	3926	15	12	\N
2465	488	5023	22	25	\N
2466	488	4898	21	22	\N
2467	488	5035	27	34	\N
2468	482	5207	11	27	\N
2469	482	4921	30	35	\N
2470	482	5368	3	3	\N
2471	482	4598	15	21	\N
2472	482	4922	24	28	\N
2473	482	4591	33	26	\N
2474	483	4764	16	24	\N
2475	483	5303	32	12	\N
2476	483	4786	3	4	\N
2477	483	4908	15	29	\N
2478	483	4765	3	34	\N
2479	483	4778	10	39	\N
2480	484	4769	15	27	\N
2481	484	4916	38	4	\N
2482	484	4935	7	21	\N
2483	484	5071	40	5	\N
2484	484	4632	37	31	\N
2485	484	4926	22	29	\N
2486	485	5364	29	2	\N
2487	485	3842	36	13	\N
2488	485	4687	32	10	\N
2489	485	5380	38	6	\N
2490	485	5388	11	26	\N
2491	485	5385	30	1	\N
2492	486	3819	13	3	\N
2493	486	3837	29	24	\N
2494	486	3818	14	15	\N
2495	486	3823	20	13	\N
2496	486	4311	8	8	\N
2497	486	3811	4	28	\N
2498	487	4688	33	35	\N
2499	487	5073	6	27	\N
2500	487	4691	19	10	\N
2501	487	4692	28	7	\N
2502	487	4743	39	4	\N
2503	487	4737	40	16	\N
2504	491	4940	34	36	\N
2505	491	5015	31	8	\N
2506	491	4757	10	24	\N
2507	491	3960	22	21	\N
2508	491	5201	36	29	\N
2509	491	4927	31	23	\N
2510	489	3930	27	33	\N
2511	489	4740	9	17	\N
2512	489	4482	22	4	\N
2513	489	4473	12	31	\N
2514	489	4567	33	37	\N
2515	489	4493	33	8	\N
2516	490	4773	29	9	\N
2517	490	4328	33	9	\N
2518	490	4612	4	1	\N
2519	490	3948	36	12	\N
2520	490	4438	23	14	\N
2521	490	5036	12	35	\N
2522	492	4472	34	6	\N
2523	492	4469	3	36	\N
2524	492	4489	30	19	\N
2525	492	4488	9	17	\N
2526	492	4504	19	37	\N
2527	492	4568	31	13	\N
2528	493	4619	37	7	\N
2529	493	4565	20	25	\N
2530	493	5347	32	31	\N
2531	493	5129	28	2	\N
2532	493	4601	34	35	\N
2533	493	4528	9	1	\N
2534	496	4569	11	26	\N
2535	496	5470	8	13	\N
2536	496	5062	10	33	\N
2537	496	4628	14	17	\N
2538	496	4626	10	9	\N
2539	496	5608	4	15	\N
2540	494	4475	18	23	\N
2541	494	3938	38	39	\N
2542	494	4607	1	6	\N
2543	494	4678	35	19	\N
2544	494	4508	8	35	\N
2545	494	4506	17	19	\N
2546	495	4500	10	14	\N
2547	495	4479	5	20	\N
2548	495	4496	18	18	\N
2549	495	4606	40	37	\N
2550	495	5446	21	6	\N
2551	495	4645	21	33	\N
2552	497	4615	3	25	\N
2553	497	5162	17	25	\N
2554	497	5453	20	6	\N
2555	497	5080	28	13	\N
2556	497	5061	34	26	\N
2557	497	5084	37	37	\N
2558	498	5031	27	17	\N
2559	498	4471	5	29	\N
2560	498	4485	38	31	\N
2561	498	5567	30	24	\N
2562	498	4491	24	16	\N
2563	498	5028	17	24	\N
2564	502	5448	1	10	\N
2565	502	5399	7	4	\N
2566	502	5601	31	31	\N
2567	502	5052	38	38	\N
2568	502	5206	15	23	\N
2569	502	5436	11	32	\N
2570	499	5394	29	15	\N
2571	499	5401	9	8	\N
2572	499	5451	27	38	\N
2573	499	4962	11	22	\N
2574	499	5408	11	20	\N
2575	499	5090	33	13	\N
2576	500	5058	1	27	\N
2577	500	3924	10	40	\N
2578	500	5209	24	13	\N
2579	500	5047	29	33	\N
2580	500	5411	1	39	\N
2581	500	4592	27	8	\N
2582	501	5195	38	14	\N
2583	501	5063	14	22	\N
2584	501	3942	2	29	\N
2585	501	5082	7	31	\N
2586	501	4522	17	9	\N
2587	501	4611	32	8	\N
2588	503	4460	27	38	\N
2589	503	4445	6	16	\N
2590	503	5074	27	11	\N
2591	503	5429	14	1	\N
2592	503	5070	4	5	\N
2593	503	5161	17	35	\N
2594	507	4389	24	8	\N
2595	507	4965	18	33	\N
2596	507	4963	17	19	\N
2597	507	4314	15	35	\N
2598	507	4947	15	33	\N
2599	507	4439	16	39	\N
2600	505	4958	11	34	\N
2601	505	4322	14	25	\N
2602	505	4951	27	32	\N
2603	505	4377	8	21	\N
2604	505	4952	13	16	\N
2605	505	4428	34	2	\N
2606	504	4351	38	6	\N
2607	504	4305	5	35	\N
2608	504	4705	38	20	\N
2609	504	4333	15	29	\N
2610	504	5002	28	33	\N
2611	504	5005	24	11	\N
2612	506	4939	35	39	\N
2613	506	4323	24	18	\N
2614	506	4319	2	19	\N
2615	506	4955	3	13	\N
2616	506	4464	36	9	\N
2617	506	5032	1	10	\N
2618	508	5013	35	14	\N
2619	508	4307	26	34	\N
2620	508	5019	36	5	\N
2621	508	5012	2	17	\N
2622	508	4957	40	24	\N
2623	508	5003	29	10	\N
2624	509	4462	36	30	\N
2625	509	4309	13	4	\N
2626	509	5043	34	14	\N
2627	509	4442	11	15	\N
2628	509	4429	28	33	\N
2629	509	4345	25	2	\N
2630	510	5033	23	37	\N
2631	510	5016	25	27	\N
2632	510	4353	1	37	\N
2633	510	4468	14	15	\N
2634	510	4467	5	13	\N
2635	510	4327	15	21	\N
2636	513	3896	20	1	\N
2637	513	3861	35	7	\N
2638	513	3890	30	27	\N
2639	513	3859	5	31	\N
2640	513	3867	17	28	\N
2641	513	3906	34	6	\N
2642	515	4466	10	12	\N
2643	515	3812	25	8	\N
2644	515	3854	13	32	\N
2645	515	3918	26	39	\N
2646	515	3905	7	36	\N
2647	515	3882	36	8	\N
2648	516	3912	31	35	\N
2649	516	3899	11	36	\N
2650	516	3917	7	35	\N
2651	516	4230	30	30	\N
2652	516	3901	2	15	\N
2653	516	3880	1	26	\N
2654	514	5461	18	37	\N
2655	514	3895	8	23	\N
2656	514	3884	5	3	\N
2657	514	3950	16	13	\N
2658	514	4426	15	14	\N
2659	514	4708	25	14	\N
2660	511	5618	18	26	\N
2661	511	3907	38	13	\N
2662	511	4189	27	15	\N
2663	511	3909	3	40	\N
2664	511	3947	6	4	\N
2665	511	3874	10	24	\N
2666	512	3957	4	39	\N
2667	512	3910	9	4	\N
2668	512	5355	6	40	\N
2669	512	4190	30	36	\N
2670	512	5485	8	6	\N
2671	512	3914	22	39	\N
2672	517	3993	36	25	\N
2673	517	3856	22	28	\N
2674	517	3853	6	15	\N
2675	517	3868	24	16	\N
2676	517	3852	12	35	\N
2677	517	4277	7	22	\N
2678	518	4668	26	3	\N
2679	518	4669	4	1	\N
2680	518	4437	23	40	\N
2681	518	4312	20	40	\N
2682	518	4642	30	20	\N
2683	518	4015	6	17	\N
2684	519	4680	32	2	\N
2685	519	4636	35	29	\N
2686	519	4646	1	38	\N
2687	519	5008	31	4	\N
2688	519	4686	1	37	\N
2689	519	4685	9	28	\N
2690	520	4670	27	33	\N
2691	520	4633	8	27	\N
2692	520	4637	40	27	\N
2693	520	4675	9	30	\N
2694	520	4679	21	23	\N
2695	520	4638	16	7	\N
2696	522	5321	27	30	\N
2697	522	4574	13	7	\N
2698	522	5338	18	8	\N
2699	522	5359	22	8	\N
2700	522	5349	35	10	\N
2701	522	5354	27	30	\N
2702	521	5318	7	22	\N
2703	521	3984	7	2	\N
2704	521	5351	19	31	\N
2705	521	5319	20	23	\N
2706	521	5340	17	39	\N
2707	521	5362	16	31	\N
2708	523	5360	25	21	\N
2709	523	5346	34	15	\N
2710	523	5313	23	23	\N
2711	523	5358	14	35	\N
2712	523	5348	5	19	\N
2713	523	5336	30	36	\N
2714	524	3766	20	16	\N
2715	524	3759	28	38	\N
2716	524	3792	10	40	\N
2717	524	3805	33	29	\N
2718	524	3789	8	29	\N
2719	524	3793	13	28	\N
2720	525	3955	27	26	\N
2721	525	4667	4	15	\N
2722	525	3782	9	7	\N
2723	525	3765	5	32	\N
2724	525	3757	22	4	\N
2725	525	3785	5	27	\N
2726	526	3752	3	38	\N
2727	526	3750	22	25	\N
2728	526	3799	23	40	\N
2729	526	3790	8	7	\N
2730	526	3749	11	28	\N
2731	526	3783	40	14	\N
2732	527	3761	29	15	\N
2733	527	3753	22	36	\N
2734	527	4420	32	31	\N
2735	527	4956	20	29	\N
2736	527	3764	13	14	\N
2737	527	4194	37	3	\N
2738	528	5323	31	28	\N
2739	528	5316	20	27	\N
2740	528	3762	6	22	\N
2741	528	4222	12	6	\N
2742	528	5325	32	10	\N
2743	528	5352	29	2	\N
2744	529	5277	13	37	\N
2745	529	5265	1	19	\N
2746	529	5273	40	22	\N
2747	529	4573	12	20	\N
2748	529	3758	30	1	\N
2749	529	5262	7	23	\N
2750	530	4609	16	16	\N
2751	530	5314	3	4	\N
2752	530	5240	36	11	\N
2753	530	5228	38	12	\N
2754	530	5231	36	4	\N
2755	530	5230	24	15	\N
2756	531	5361	2	25	\N
2757	531	5322	35	22	\N
2758	531	4655	26	5	\N
2759	531	5215	7	39	\N
2760	531	5242	4	29	\N
2761	531	3800	26	35	\N
2762	532	4310	6	2	\N
2763	532	5392	35	7	\N
2764	532	4005	15	23	\N
2765	532	5216	39	35	\N
2766	532	5257	7	39	\N
2767	532	5246	21	19	\N
2768	534	5224	18	39	\N
2769	534	5172	4	35	\N
2770	534	5221	7	20	\N
2771	534	5395	37	5	\N
2772	534	5274	36	25	\N
2773	534	5225	15	15	\N
2774	533	5258	19	15	\N
2775	533	5261	29	22	\N
2776	533	5065	28	13	\N
2777	533	4239	25	15	\N
2778	533	5553	15	36	\N
2779	533	5272	36	22	\N
2780	535	5269	32	35	\N
2781	535	5226	23	31	\N
2782	535	5202	34	33	\N
2783	535	5218	16	23	\N
2784	535	5571	34	21	\N
2785	535	5020	31	37	\N
2786	536	5405	11	9	\N
2787	536	5435	14	35	\N
2788	536	4674	39	14	\N
2789	536	5437	21	33	\N
2790	536	5454	1	13	\N
2791	536	5402	16	28	\N
2792	537	4695	1	40	\N
2793	537	5409	26	31	\N
2794	537	5412	29	12	\N
2795	537	5390	1	11	\N
2796	537	5443	7	14	\N
2797	537	5445	2	7	\N
2798	538	5455	35	26	\N
2799	538	5391	4	9	\N
2800	538	4734	25	12	\N
2801	538	5396	27	10	\N
2802	538	5393	6	11	\N
2803	538	5433	28	38	\N
2804	539	4946	38	6	\N
2805	539	4620	8	19	\N
2806	539	5009	9	30	\N
2807	539	4988	19	5	\N
2808	539	4964	38	34	\N
2809	539	4989	32	35	\N
2810	540	4985	36	23	\N
2811	540	5475	18	6	\N
2812	540	5039	11	35	\N
2813	540	5040	22	8	\N
2814	540	4945	20	12	\N
2815	540	4994	31	40	\N
2816	541	5038	27	11	\N
2817	541	5001	9	15	\N
2818	541	5034	10	27	\N
2819	541	4733	26	13	\N
2820	541	4700	10	40	\N
2821	541	4738	14	3	\N
2822	542	3838	27	23	\N
2823	542	3849	28	31	\N
2824	542	3810	23	11	\N
2825	542	3846	11	30	\N
2826	542	3809	19	15	\N
2827	542	3839	29	4	\N
2828	543	5299	39	29	\N
2829	543	4702	37	25	\N
2830	543	5302	13	18	\N
2831	543	5310	15	25	\N
2832	543	4693	25	24	\N
2833	543	4714	20	13	\N
2834	544	5363	36	11	\N
2835	544	5288	28	37	\N
2836	544	4435	14	38	\N
2837	544	5290	6	9	\N
2838	544	5365	4	16	\N
2839	544	3817	35	3	\N
2840	545	5306	4	27	\N
2841	545	5311	19	32	\N
2842	545	3836	20	1	\N
2843	545	5287	39	29	\N
2844	545	5307	17	4	\N
2845	545	5285	7	22	\N
2846	546	3972	2	12	\N
2847	546	5414	25	23	\N
2848	546	3966	40	10	\N
2849	546	3937	16	20	\N
2850	546	3958	8	19	\N
2851	546	3935	15	12	\N
2852	547	5203	26	31	\N
2853	547	3953	26	14	\N
2854	547	4698	1	34	\N
2855	547	3961	12	39	\N
2856	547	3962	28	13	\N
2857	547	3934	3	20	\N
2858	548	3927	22	22	\N
2859	548	3939	36	35	\N
2860	548	3931	35	31	\N
2861	548	3956	33	14	\N
2862	548	3964	40	7	\N
2863	548	3929	24	8	\N
2864	557	5482	13	37	\N
2865	557	5505	29	22	\N
2866	557	5582	4	29	\N
2867	557	4302	7	8	\N
2868	557	5596	13	10	\N
2869	557	4490	3	17	\N
2870	557	5007	3	40	\N
2871	557	4317	40	3	\N
2872	557	4259	40	12	\N
2873	558	5049	24	20	\N
2874	558	5570	39	31	\N
2875	558	5486	6	32	\N
2876	558	4038	37	37	\N
2877	558	4739	16	34	\N
2878	558	4588	34	37	\N
2879	558	5591	27	11	\N
2880	558	4024	35	14	\N
2881	558	3991	7	15	\N
2882	559	5499	21	36	\N
2883	559	5210	22	15	\N
2884	559	5077	34	11	\N
2885	559	4455	12	32	\N
2886	559	5183	9	20	\N
2887	559	3980	6	37	\N
2888	559	5496	26	20	\N
2889	559	4283	3	27	\N
2890	559	4276	33	34	\N
2891	560	4459	22	11	\N
2892	560	4578	3	18	\N
2893	560	4199	9	11	\N
2894	560	4487	27	17	\N
2895	560	5572	23	18	\N
2896	560	4273	17	4	\N
2897	560	4413	32	3	\N
2898	560	4209	3	34	\N
2899	560	4749	7	32	\N
2900	549	5066	25	8	\N
2901	549	3945	4	6	\N
2902	549	4016	4	31	\N
2903	549	4223	22	12	\N
2904	549	4853	23	29	\N
2905	549	4937	33	8	\N
2906	549	5607	31	4	\N
2907	549	4036	37	20	\N
2908	549	5483	27	30	\N
2909	561	5597	15	36	\N
2910	561	5581	13	31	\N
2911	561	4017	7	18	\N
2912	561	5612	34	1	\N
2913	561	5463	30	3	\N
2914	561	5187	20	10	\N
2915	561	4576	37	40	\N
2916	561	4412	32	20	\N
2917	561	4214	6	24	\N
2918	550	4750	13	21	\N
2919	550	4350	37	30	\N
2920	550	3902	14	2	\N
2921	550	5500	30	7	\N
2922	550	4287	37	30	\N
2923	550	4225	28	34	\N
2924	550	5611	8	22	\N
2925	550	3954	27	32	\N
2926	550	4268	40	31	\N
2927	562	4251	33	34	\N
2928	562	3976	21	9	\N
2929	562	5468	24	3	\N
2930	562	4248	19	2	\N
2931	562	5589	33	23	\N
2932	562	5456	38	15	\N
2933	562	5592	5	13	\N
2934	562	5167	24	26	\N
2935	562	4011	19	4	\N
2936	563	4026	8	33	\N
2937	563	4281	22	39	\N
2938	563	4266	35	16	\N
2939	563	4279	14	2	\N
2940	563	4237	18	5	\N
2941	563	5586	23	16	\N
2942	563	3990	18	3	\N
2943	563	5056	10	10	\N
2944	563	5079	31	1	\N
2945	551	4039	24	18	\N
2946	551	3995	26	1	\N
2947	551	3982	32	17	\N
2948	551	4321	12	15	\N
2949	551	4229	39	24	\N
2950	551	5491	36	16	\N
2951	551	4291	37	1	\N
2952	551	4440	5	1	\N
2953	551	4254	1	2	\N
2954	564	3863	22	32	\N
2955	564	5585	31	23	\N
2956	564	4219	39	34	\N
2957	564	4001	37	23	\N
2958	564	4585	7	35	\N
2959	564	5051	7	4	\N
2960	564	4293	35	10	\N
2961	564	3977	26	18	\N
2962	564	4761	30	39	\N
2972	565	4332	19	24	\N
2973	565	5593	8	17	\N
2974	565	4783	31	5	\N
2975	565	5068	25	25	\N
2976	565	4754	19	16	\N
2977	565	4914	35	7	\N
2978	565	5492	33	32	\N
2979	565	5186	6	10	\N
2980	565	4244	27	24	\N
2981	552	4286	37	14	\N
2982	552	4226	25	15	\N
2983	552	5568	26	36	\N
2984	552	5044	35	4	\N
2985	552	4432	21	21	\N
2986	552	3985	16	28	\N
2987	552	4224	19	6	\N
2988	552	4627	7	25	\N
2989	552	5613	28	34	\N
2990	566	5459	32	17	\N
2991	566	5562	13	7	\N
2992	566	4256	22	17	\N
2993	566	4924	25	34	\N
2994	566	4770	11	14	\N
2995	566	5487	33	13	\N
2996	566	4782	5	25	\N
2997	566	5174	17	3	\N
2998	566	5189	2	11	\N
2999	567	4608	19	37	\N
3000	567	4766	39	2	\N
3001	567	5576	12	3	\N
3002	567	4025	31	4	\N
3003	567	4010	22	13	\N
3004	567	4014	18	14	\N
3005	567	4331	31	30	\N
3006	567	4298	33	7	\N
3007	567	3999	19	16	\N
3008	568	5569	29	17	\N
3009	568	3866	7	19	\N
3010	568	3988	4	2	\N
3011	568	3968	1	25	\N
3012	568	4481	13	39	\N
3013	568	5081	11	7	\N
3014	568	5560	10	26	\N
3015	568	4019	32	37	\N
3016	568	4295	3	11	\N
3017	553	4618	38	16	\N
3018	553	4449	31	22	\N
3019	553	4275	33	21	\N
3020	553	4610	23	33	\N
3021	553	4271	36	3	\N
3022	553	5469	19	15	\N
3023	553	3986	35	21	\N
3024	553	4250	17	30	\N
3025	553	5171	39	28	\N
3026	569	4022	9	24	\N
3027	569	4787	36	16	\N
3028	569	5048	30	2	\N
3029	569	4386	19	2	\N
3030	569	4206	39	33	\N
3031	569	4243	15	1	\N
3032	569	4990	13	37	\N
3033	569	5588	27	24	\N
3034	569	4035	36	37	\N
3035	570	4203	15	38	\N
3036	570	3959	15	23	\N
3037	570	4760	1	6	\N
3038	570	4762	30	4	\N
3039	570	4240	15	2	\N
3040	570	4220	26	10	\N
3041	570	5584	32	4	\N
3042	570	5046	7	28	\N
3043	570	4258	7	39	\N
3044	554	5578	3	12	\N
3045	554	5089	12	36	\N
3046	554	4297	15	8	\N
3047	554	4030	14	23	\N
3048	554	4269	23	6	\N
3049	554	4928	30	2	\N
3050	554	5489	8	23	\N
3051	554	4909	22	24	\N
3052	554	5587	26	13	\N
3053	571	5196	8	28	\N
3054	571	4260	9	4	\N
3055	571	4936	25	25	\N
3056	571	5177	12	27	\N
3057	571	4192	31	2	\N
3058	571	4303	20	11	\N
3059	571	4575	27	15	\N
3060	571	4262	30	20	\N
3061	571	4264	8	35	\N
3062	555	4221	20	26	\N
3063	555	4213	10	26	\N
3064	555	4188	16	19	\N
3065	555	5027	36	35	\N
3066	555	5565	11	19	\N
3067	555	4458	4	11	\N
3068	555	5151	32	10	\N
3069	555	5154	18	31	\N
3070	555	4814	19	19	\N
3071	572	4495	19	22	\N
3072	572	4617	9	39	\N
3073	572	5024	25	35	\N
3074	572	3979	5	15	\N
3075	572	3996	39	15	\N
3076	572	5200	22	10	\N
3077	572	4003	11	6	\N
3078	572	4288	14	37	\N
3079	572	4263	31	29	\N
3080	573	4002	23	20	\N
3081	573	4031	33	33	\N
3082	573	4265	39	36	\N
3083	573	5004	29	18	\N
3084	573	5577	27	28	\N
3085	573	5614	26	6	\N
3086	573	4027	27	19	\N
3087	573	5603	3	7	\N
3088	573	4261	5	37	\N
3089	556	3797	5	1	\N
3090	556	5217	31	7	\N
3091	556	3973	22	37	\N
3092	556	4274	39	23	\N
3093	556	4267	33	24	\N
3094	556	5176	9	38	\N
3095	556	4296	36	4	\N
3096	556	5595	1	6	\N
3097	556	4581	37	33	\N
3098	574	4217	11	22	\N
3099	574	4497	23	21	\N
3100	574	4193	2	28	\N
3101	574	4012	19	29	\N
3102	574	5600	38	30	\N
3103	574	5179	6	31	\N
3104	574	5219	32	15	\N
3105	574	4299	14	19	\N
3106	574	5590	24	17	\N
3107	575	4505	25	35	\N
3108	575	4246	40	13	\N
3109	575	4334	22	10	\N
3110	575	4313	16	35	\N
3111	575	5616	14	11	\N
3112	575	5495	6	36	\N
3113	575	4028	39	33	\N
3114	575	3997	28	6	\N
3115	575	4116	25	12	\N
3116	576	5484	40	3	\N
3117	576	4187	27	15	\N
3118	576	4282	17	30	\N
3119	576	5460	7	20	\N
3120	576	4614	27	23	\N
3121	576	5088	18	38	\N
3122	576	4775	34	21	\N
3123	576	4042	37	23	\N
3124	576	5083	34	14	\N
3125	577	5268	11	4	\N
3126	577	4037	27	22	\N
3127	577	5472	33	31	\N
3128	577	5223	20	9	\N
3129	577	4013	2	40	\N
3130	577	5193	4	23	\N
3131	577	5155	20	19	\N
3132	577	5158	17	7	\N
3133	577	3946	35	18	\N
3134	578	3923	39	18	\N
3135	578	4205	24	27	\N
3136	578	4443	25	33	\N
3137	578	4021	19	38	\N
3138	578	4253	32	3	\N
3139	578	5605	32	37	\N
3140	578	5214	15	36	\N
3141	578	3981	37	17	\N
3142	578	4324	22	21	\N
3143	586	3943	15	31	\N
3144	586	5497	31	39	\N
3145	586	4774	19	19	\N
3146	586	5181	22	32	\N
3147	586	5185	20	4	\N
3148	586	4020	18	28	\N
3149	587	3855	30	27	\N
3150	587	5026	24	26	\N
3151	587	4780	29	14	\N
3152	587	5067	3	16	\N
3153	587	4233	4	22	\N
3154	587	4004	29	10	\N
3155	579	4008	27	5	\N
3156	579	4210	19	37	\N
3157	579	3989	12	38	\N
3158	579	4043	2	39	\N
3159	579	3807	28	30	\N
3160	579	4047	11	25	\N
3161	580	5604	33	4	\N
3162	580	4746	33	24	\N
3163	580	5574	24	2	\N
3164	580	5555	6	6	\N
3165	580	4917	20	13	\N
3166	580	4703	6	34	\N
3167	581	5198	24	18	\N
3168	581	4494	20	20	\N
3169	581	4639	11	21	\N
3170	581	4483	2	14	\N
3171	581	4315	39	34	\N
3172	581	4270	7	24	\N
3173	582	4447	29	14	\N
3174	582	4635	21	13	\N
3175	582	4624	12	12	\N
3176	582	4478	23	31	\N
3177	582	3987	19	33	\N
3178	582	4006	29	4	\N
3179	585	4484	30	22	\N
3180	585	5575	15	35	\N
3181	585	4191	34	8	\N
3182	585	4216	35	1	\N
3183	585	4041	9	38	\N
3184	585	5271	40	8	\N
3185	583	5192	21	27	\N
3186	583	4245	38	39	\N
3187	583	5481	7	33	\N
3188	583	5502	27	7	\N
3189	583	5506	17	22	\N
3190	583	4103	30	12	\N
3191	584	4465	40	39	\N
3192	584	5182	35	40	\N
3193	584	4231	4	31	\N
3194	584	3754	4	18	\N
3195	584	4232	12	37	\N
3196	584	3994	12	11	\N
3197	598	4613	20	34	\N
3198	598	4954	7	9	\N
3199	598	4461	22	19	\N
3200	598	5222	5	9	\N
3201	598	4931	23	7	\N
3202	598	5563	8	17	\N
3203	593	5087	2	26	\N
3204	593	4018	40	36	\N
3205	593	4584	2	5	\N
3206	593	4046	23	37	\N
3207	593	4476	29	26	\N
3208	593	4929	19	9	\N
3209	595	5184	1	38	\N
3210	595	3897	38	24	\N
3211	595	4457	38	39	\N
3212	595	4048	6	30	\N
3213	595	5270	33	30	\N
3214	595	3864	25	15	\N
3215	596	5598	15	17	\N
3216	596	4009	31	13	\N
3217	596	5583	39	16	\N
3218	596	3796	6	23	\N
3219	596	4454	35	20	\N
3220	596	4772	30	8	\N
3221	597	5057	29	28	\N
3222	597	5229	35	9	\N
3223	597	4752	16	8	\N
3224	597	4301	36	30	\N
3225	597	4083	11	25	\N
3226	597	5406	14	13	\N
3227	588	5064	14	28	\N
3228	588	5490	10	10	\N
3229	588	5260	30	37	\N
3230	588	5464	22	32	\N
3231	588	5566	39	26	\N
3232	588	4207	20	33	\N
3233	594	5465	23	28	\N
3234	594	4272	32	8	\N
3235	594	3974	10	9	\N
3236	594	4595	22	29	\N
3237	594	4033	21	10	\N
3238	594	5178	30	24	\N
3239	589	4621	37	6	\N
3240	589	4329	26	40	\N
3241	589	5169	11	22	\N
3242	589	5072	18	28	\N
3243	589	5610	4	18	\N
3244	589	3965	26	10	\N
3245	590	3921	26	33	\N
3246	590	4242	39	29	\N
3247	590	5599	10	18	\N
3248	590	4589	16	7	\N
3249	590	4436	25	35	\N
3250	590	3751	40	26	\N
3251	591	5199	4	14	\N
3252	591	5264	33	15	\N
3253	591	5266	21	2	\N
3254	591	4290	5	7	\N
3255	591	4629	8	40	\N
3256	591	4697	38	31	\N
3257	592	5478	6	15	\N
3258	592	5069	12	9	\N
3259	592	3815	21	12	\N
3260	592	5030	28	22	\N
3261	592	4605	12	4	\N
3262	592	4918	14	22	\N
3263	599	4439	2	23	\N
3264	599	5207	13	34	\N
3265	599	4925	19	39	\N
3266	599	5382	36	20	\N
3267	599	4450	36	10	\N
3268	599	4763	25	4	\N
3269	600	4920	7	23	\N
3270	600	4231	2	37	\N
3271	600	4455	11	36	\N
3272	600	5303	21	37	\N
3273	600	4786	18	28	\N
3274	600	4910	35	26	\N
3275	601	4772	24	40	\N
3276	601	3844	14	8	\N
3277	601	4756	19	23	\N
3278	601	4913	16	9	\N
3279	601	4768	5	4	\N
3280	601	4690	37	20	\N
3281	602	4759	3	13	\N
3282	602	4457	21	3	\N
3283	602	4405	39	14	\N
3284	602	4788	7	35	\N
3285	602	3845	38	31	\N
3286	602	4747	21	11	\N
3287	603	4748	12	2	\N
3288	603	4699	18	3	\N
3289	603	4616	39	18	\N
3290	603	5501	29	37	\N
3291	603	4907	21	1	\N
3292	603	4335	32	5	\N
3293	604	4433	4	19	\N
3294	604	5280	40	4	\N
3295	604	3848	34	17	\N
3296	604	3850	33	15	\N
3297	604	4732	38	32	\N
3298	604	4590	13	22	\N
3299	611	4612	12	3	\N
3300	611	4765	16	40	\N
3301	611	5036	15	26	\N
3302	611	3981	26	10	\N
3303	611	3926	1	16	\N
3304	611	5023	31	18	\N
3305	605	4930	6	23	\N
3306	605	4934	31	10	\N
3307	605	4921	7	5	\N
3308	605	4598	19	38	\N
3309	605	4922	22	16	\N
3310	605	4591	10	15	\N
3311	606	4927	29	2	\N
3312	606	4774	15	7	\N
3313	606	4814	38	16	\N
3314	606	4778	25	22	\N
3315	606	4764	36	39	\N
3316	606	4908	3	22	\N
3317	607	4936	13	4	\N
3318	607	4687	26	17	\N
3319	607	4740	24	34	\N
3320	607	4632	23	5	\N
3321	607	4926	15	5	\N
3322	607	4769	2	23	\N
3323	608	5368	4	16	\N
3324	608	5372	35	31	\N
3325	608	5366	39	22	\N
3326	608	3842	15	8	\N
3327	608	5388	25	25	\N
3328	608	5385	38	27	\N
3329	609	5065	10	20	\N
3330	609	3815	10	29	\N
3331	609	3813	20	30	\N
3332	609	3811	18	30	\N
3333	609	3819	31	12	\N
3334	609	3818	2	5	\N
3335	610	3841	40	22	\N
3336	610	4692	1	16	\N
3337	610	4743	27	21	\N
3338	610	4737	33	31	\N
3339	610	4688	33	5	\N
3340	610	4691	15	25	\N
3341	614	5567	3	14	\N
3342	614	4619	37	40	\N
3343	614	5309	16	40	\N
3344	614	5067	2	8	\N
3345	614	4933	4	17	\N
3346	614	4916	28	32	\N
3347	612	4626	18	20	\N
3348	612	3924	11	5	\N
3349	612	4600	8	8	\N
3350	612	3930	31	2	\N
3351	612	4482	20	1	\N
3352	612	4473	40	20	\N
3353	613	4767	19	29	\N
3354	613	4906	27	27	\N
3355	613	4784	19	20	\N
3356	613	4952	30	11	\N
3357	613	4773	8	18	\N
3358	613	4438	33	29	\N
3359	615	5347	26	9	\N
3360	615	4492	35	19	\N
3361	615	5446	31	36	\N
3362	615	4479	2	36	\N
3363	615	5408	34	17	\N
3364	615	4469	38	30	\N
3365	616	4004	17	38	\N
3366	616	3974	17	30	\N
3367	616	4593	33	38	\N
3368	616	4305	22	12	\N
3369	616	4565	14	14	\N
3370	616	5129	7	11	\N
3371	619	4580	16	15	\N
3372	619	4606	20	13	\N
3373	619	4466	3	18	\N
3374	619	4645	14	20	\N
3375	619	4569	38	11	\N
3376	619	4628	6	1	\N
3377	617	4610	5	6	\N
3378	617	4477	29	5	\N
3379	617	5062	10	40	\N
3380	617	4625	15	14	\N
3381	617	4493	2	2	\N
3382	617	4508	25	38	\N
3383	618	3938	22	10	\N
3384	618	4568	26	32	\N
3385	618	4504	32	33	\N
3386	618	4597	17	1	\N
3387	618	4500	12	22	\N
3388	618	4496	9	17	\N
3389	620	4310	32	21	\N
3390	620	4488	27	10	\N
3391	620	4528	10	11	\N
3392	620	4611	20	15	\N
3393	620	4519	33	9	\N
3394	620	4475	5	10	\N
3395	621	4602	35	19	\N
3396	621	5395	17	35	\N
3397	621	5188	23	6	\N
3398	621	5084	18	1	\N
3399	621	4615	30	37	\N
3400	621	5162	3	11	\N
3401	622	5090	5	30	\N
3402	622	4962	39	11	\N
3403	622	3748	8	12	\N
3404	622	5031	3	9	\N
3405	622	4471	1	15	\N
3406	622	4485	10	34	\N
3407	626	5453	19	9	\N
3408	626	5442	32	29	\N
3409	626	3798	25	3	\N
3410	626	5185	29	17	\N
3411	626	4584	25	29	\N
3412	626	5206	35	9	\N
3413	623	5054	39	4	\N
3414	623	5411	27	40	\N
3415	623	5080	25	26	\N
3416	623	5394	30	20	\N
3417	623	5401	24	33	\N
3418	623	5451	18	32	\N
3419	624	4966	26	27	\N
3420	624	5399	7	20	\N
3421	624	5180	21	24	\N
3422	624	5071	26	24	\N
3423	624	5058	33	16	\N
3424	624	5047	20	16	\N
3425	625	3950	7	9	\N
3426	625	5211	7	13	\N
3427	625	5059	8	4	\N
3428	625	5076	14	27	\N
3429	625	5082	31	6	\N
3430	625	3942	21	1	\N
3431	627	4624	15	38	\N
3432	627	3936	32	31	\N
3433	627	3853	18	24	\N
3434	627	5201	2	40	\N
3435	627	4445	17	10	\N
3436	627	5074	11	16	\N
3437	631	5033	22	19	\N
3438	631	5019	40	28	\N
3439	631	4955	13	28	\N
3440	631	4947	1	36	\N
3441	631	4965	18	3	\N
3442	631	4963	29	32	\N
3443	629	5392	20	40	\N
3444	629	4446	8	40	\N
3445	629	4328	34	16	\N
3446	629	4958	14	25	\N
3447	629	4322	6	22	\N
3448	629	4428	17	15	\N
3449	628	4308	29	14	\N
3450	628	4442	40	5	\N
3451	628	5002	14	28	\N
3452	628	5005	21	23	\N
3453	628	4351	8	6	\N
3454	628	4705	28	3	\N
3455	630	4356	39	19	\N
3456	630	4467	19	6	\N
3457	630	4314	29	40	\N
3458	630	5032	18	11	\N
3459	630	4939	29	5	\N
3460	630	4319	31	32	\N
3461	632	5016	2	9	\N
3462	632	4951	3	3	\N
3463	632	4967	4	30	\N
3464	632	5034	10	19	\N
3465	632	4327	39	27	\N
3466	632	5013	28	39	\N
3467	633	5022	15	4	\N
3468	633	5035	9	18	\N
3469	633	4462	37	9	\N
3470	633	4309	22	26	\N
3471	633	5043	40	10	\N
3472	633	4429	9	31	\N
3473	636	3906	28	1	\N
3474	636	5015	12	31	\N
3475	636	3855	32	13	\N
3476	636	3856	15	18	\N
3477	636	3867	30	9	\N
3478	636	3896	40	15	\N
3479	638	3897	29	13	\N
3480	638	3868	22	40	\N
3481	638	3859	40	4	\N
3482	638	3854	9	29	\N
3483	638	3918	19	35	\N
3484	638	3905	11	14	\N
3485	639	3916	7	4	\N
3486	639	3908	13	18	\N
3487	639	3901	8	29	\N
3488	639	3880	17	17	\N
3489	639	3912	39	8	\N
3490	639	3899	9	6	\N
3491	637	4708	20	26	\N
3492	637	3851	19	25	\N
3493	637	3907	37	5	\N
3494	637	3911	9	2	\N
3495	637	3913	29	21	\N
3496	637	5461	6	21	\N
3497	634	3909	19	31	\N
3498	634	3762	6	10	\N
3499	634	4277	34	35	\N
3500	634	3917	10	6	\N
3501	634	3947	11	15	\N
3502	634	3874	40	37	\N
3503	635	3895	26	31	\N
3504	635	5608	10	17	\N
3505	635	5355	14	8	\N
3506	635	3914	21	7	\N
3507	635	3957	17	2	\N
3508	635	3910	4	32	\N
3509	640	4681	2	7	\N
3510	640	3782	33	20	\N
3511	640	4642	2	15	\N
3512	640	4668	6	33	\N
3513	640	4669	26	4	\N
3514	640	4437	26	8	\N
3515	641	4686	3	36	\N
3516	641	4685	39	9	\N
3517	641	4015	19	23	\N
3518	641	4680	19	28	\N
3519	641	4636	13	29	\N
3520	641	4646	26	31	\N
3521	642	4637	26	19	\N
3522	642	4675	13	3	\N
3523	642	4679	19	16	\N
3524	642	4638	33	12	\N
3525	642	4670	28	25	\N
3526	642	4633	38	40	\N
3527	643	3788	24	3	\N
3528	643	3758	9	30	\N
3529	643	3792	19	34	\N
3530	643	3805	33	20	\N
3531	643	3766	2	35	\N
3532	643	3789	9	33	\N
3533	644	4420	37	31	\N
3534	644	3793	13	6	\N
3535	644	3955	31	30	\N
3536	644	4667	13	25	\N
3537	644	3765	39	38	\N
3538	644	3785	38	29	\N
3539	645	4426	35	28	\N
3540	645	3750	16	24	\N
3541	645	3799	8	15	\N
3542	645	3790	28	10	\N
3543	645	3752	29	22	\N
3544	645	3783	35	26	\N
3545	646	3764	11	34	\N
3546	646	4194	33	2	\N
3547	646	3755	1	17	\N
3548	646	5485	14	38	\N
3549	646	3754	26	7	\N
3550	646	3753	16	17	\N
3551	647	3759	9	7	\N
3552	647	4333	16	22	\N
3553	647	5324	32	40	\N
3554	647	5325	34	26	\N
3555	647	5323	36	31	\N
3556	647	5316	21	29	\N
3557	648	5224	39	29	\N
3558	648	5228	31	33	\N
3559	648	5265	10	37	\N
3560	648	5273	2	27	\N
3561	648	4573	39	25	\N
3562	648	5262	23	21	\N
3563	649	4489	38	39	\N
3564	649	5172	2	4	\N
3565	649	4576	27	7	\N
3566	649	5314	33	14	\N
3567	649	5230	39	9	\N
3568	649	4609	25	40	\N
3569	650	4742	29	25	\N
3570	650	4491	36	3	\N
3571	650	5361	37	34	\N
3572	650	5215	10	31	\N
3573	650	5242	18	29	\N
3574	650	3800	21	10	\N
3575	651	4697	26	3	\N
3576	651	5169	25	38	\N
3577	651	5231	38	20	\N
3578	651	5258	12	19	\N
3579	651	5216	23	8	\N
3580	651	5246	28	12	\N
3581	653	5221	29	38	\N
3582	653	4683	32	22	\N
3583	653	5278	3	17	\N
3584	653	5226	36	14	\N
3585	653	5277	20	30	\N
3586	653	5225	35	4	\N
3587	652	5322	32	5	\N
3588	652	4655	28	4	\N
3589	652	5063	19	27	\N
3590	652	5274	30	14	\N
3591	652	5240	13	38	\N
3592	652	5553	30	13	\N
3593	654	5269	2	9	\N
3594	654	5202	12	20	\N
3595	654	5218	9	17	\N
3596	654	5264	33	15	\N
3597	654	5055	33	5	\N
3598	654	5429	1	38	\N
3599	655	5405	29	35	\N
3600	655	5412	39	39	\N
3601	655	5452	16	33	\N
3602	655	5403	13	2	\N
3603	655	5454	4	11	\N
3604	655	5402	35	30	\N
3605	656	5414	3	19	\N
3606	656	5404	4	37	\N
3607	656	4695	38	35	\N
3608	656	5409	29	19	\N
3609	656	5390	21	4	\N
3610	656	5445	36	15	\N
3611	657	5455	34	16	\N
3612	657	5391	31	31	\N
3613	657	5437	34	14	\N
3614	657	5398	14	21	\N
3615	657	5393	4	36	\N
3616	657	5433	28	25	\N
3617	658	5000	38	32	\N
3618	658	4940	31	4	\N
3619	658	4956	25	40	\N
3620	658	5008	12	30	\N
3621	658	4988	12	11	\N
3622	658	4964	5	37	\N
3623	659	5040	24	40	\N
3624	659	4945	40	38	\N
3625	659	5448	5	22	\N
3626	659	4326	19	16	\N
3627	659	4957	19	15	\N
3628	659	5003	10	3	\N
3629	660	5475	28	38	\N
3630	660	4959	20	23	\N
3631	660	5011	26	37	\N
3632	660	4994	31	39	\N
3633	660	5010	25	35	\N
3634	660	4738	29	5	\N
3635	661	5038	4	33	\N
3636	661	5001	17	19	\N
3637	661	4946	19	9	\N
3638	661	4948	3	13	\N
3639	661	4989	30	2	\N
3640	661	4949	10	27	\N
3641	662	3847	35	4	\N
3642	662	5302	26	31	\N
3643	662	3849	22	38	\N
3644	662	3810	11	16	\N
3645	662	3846	37	4	\N
3646	662	3839	29	30	\N
3647	663	4694	24	19	\N
3648	663	4741	33	25	\N
3649	663	4704	4	39	\N
3650	663	4700	15	31	\N
3651	663	5310	1	20	\N
3652	663	4693	21	22	\N
3653	664	5308	9	16	\N
3654	664	5283	37	28	\N
3655	664	5370	34	34	\N
3656	664	5363	36	29	\N
3657	664	5288	15	22	\N
3658	664	5365	37	15	\N
3659	665	5305	4	7	\N
3660	665	5306	2	35	\N
3661	665	5311	2	33	\N
3662	665	5287	9	39	\N
3663	665	5307	17	23	\N
3664	665	5285	9	26	\N
3665	666	4389	18	11	\N
3666	666	3838	37	2	\N
3667	666	3836	9	40	\N
3668	666	3843	34	10	\N
3669	666	3840	38	25	\N
3670	666	3817	3	38	\N
3671	667	3972	6	14	\N
3672	667	3966	40	31	\N
3673	667	3937	34	11	\N
3674	667	5479	22	1	\N
3675	667	3928	1	22	\N
3676	667	4674	26	3	\N
3677	668	3953	39	39	\N
3678	668	4698	16	34	\N
3679	668	3961	25	12	\N
3680	668	3934	36	37	\N
3681	668	4676	37	35	\N
3682	668	3971	28	36	\N
3683	669	3927	31	34	\N
3684	669	3939	8	25	\N
3685	669	3931	14	26	\N
3686	669	3956	29	5	\N
3687	669	3964	40	8	\N
3688	669	3941	18	3	\N
3689	678	5482	19	5	\N
3690	678	5582	32	35	\N
3691	678	4302	24	12	\N
3692	678	5596	23	37	\N
3693	678	4490	29	26	\N
3694	678	5007	21	28	\N
3695	678	4317	11	17	\N
3696	678	4259	40	14	\N
3697	678	4454	37	27	\N
3698	679	5049	21	25	\N
3699	679	5570	26	36	\N
3700	679	5486	39	8	\N
3701	679	4038	23	26	\N
3702	679	4588	9	17	\N
3703	679	4024	38	31	\N
3704	679	3991	10	4	\N
3705	679	4749	35	6	\N
3706	679	5611	34	5	\N
3707	680	5210	2	31	\N
3708	680	3980	24	32	\N
3709	680	5496	14	32	\N
3710	680	4283	29	32	\N
3711	680	4276	31	28	\N
3712	680	5181	37	14	\N
3713	680	5494	7	4	\N
3714	680	4605	38	34	\N
3715	680	4607	34	19	\N
3716	681	4236	4	31	\N
3717	681	3797	18	15	\N
3718	681	4459	15	13	\N
3719	681	4199	1	13	\N
3720	681	4487	26	24	\N
3721	681	5572	3	4	\N
3722	681	4273	23	33	\N
3723	681	4413	6	14	\N
3724	681	4209	15	32	\N
3725	670	4746	23	33	\N
3726	670	4592	21	30	\N
3727	670	5406	38	14	\N
3728	670	4223	33	11	\N
3729	670	4853	11	20	\N
3730	670	4937	21	16	\N
3731	670	5607	20	7	\N
3732	670	4036	31	20	\N
3733	670	5483	12	40	\N
3734	682	4678	15	10	\N
3735	682	4320	17	2	\N
3736	682	4003	23	6	\N
3737	682	5597	40	35	\N
3738	682	5612	28	3	\N
3739	682	5463	14	28	\N
3740	682	5581	11	30	\N
3741	682	4017	27	37	\N
3742	682	4214	36	31	\N
3743	671	3989	11	13	\N
3744	671	4047	26	36	\N
3745	671	4227	16	6	\N
3746	671	3902	38	8	\N
3747	671	5500	19	32	\N
3748	671	4287	34	9	\N
3749	671	4750	23	18	\N
3750	671	4225	22	7	\N
3751	671	4268	22	21	\N
3752	683	4221	26	21	\N
3753	683	5079	38	24	\N
3754	683	5468	27	39	\N
3755	683	4248	8	13	\N
3756	683	5589	4	6	\N
3757	683	5456	10	16	\N
3758	683	5592	6	23	\N
3759	683	5167	21	21	\N
3760	683	4011	22	6	\N
3761	684	4208	32	23	\N
3762	684	4618	27	19	\N
3763	684	4239	13	34	\N
3764	684	5506	16	10	\N
3765	684	4281	23	10	\N
3766	684	4237	39	2	\N
3767	684	5586	12	39	\N
3768	684	3990	21	34	\N
3769	684	5056	17	10	\N
3770	672	4777	3	5	\N
3771	672	4205	32	14	\N
3772	672	3995	24	28	\N
3773	672	3982	38	29	\N
3774	672	4321	27	40	\N
3775	672	4229	35	5	\N
3776	672	4291	11	18	\N
3777	672	4440	1	39	\N
3778	672	4254	3	16	\N
3779	685	3863	31	7	\N
3780	685	5585	37	37	\N
3781	685	4219	36	15	\N
3782	685	4001	15	18	\N
3783	685	4585	21	16	\N
3784	685	5051	16	11	\N
3785	685	4293	3	18	\N
3786	685	3977	29	12	\N
3787	685	4761	3	15	\N
3788	686	3992	12	25	\N
3789	686	4332	34	19	\N
3790	686	5593	35	10	\N
3791	686	4783	21	20	\N
3792	686	5068	6	37	\N
3793	686	4754	19	10	\N
3794	686	4914	18	35	\N
3795	686	5186	2	11	\N
3796	686	4244	34	28	\N
3797	673	3968	33	28	\N
3798	673	4935	21	13	\N
3799	673	4931	40	7	\N
3800	673	4627	14	7	\N
3801	673	5571	20	16	\N
3802	673	4286	20	2	\N
3803	673	4432	32	33	\N
3804	673	3985	31	21	\N
3805	673	5613	12	5	\N
3806	687	5484	11	13	\N
3807	687	3945	37	13	\N
3808	687	5562	6	5	\N
3809	687	4256	25	17	\N
3810	687	4924	23	1	\N
3811	687	4770	33	15	\N
3812	687	5487	1	16	\N
3813	687	4782	38	1	\N
3814	687	5189	12	37	\N
3815	688	5576	40	34	\N
3816	688	4025	2	25	\N
3817	688	4608	26	10	\N
3818	688	4010	3	10	\N
3819	688	4331	19	4	\N
3820	688	4298	6	3	\N
3821	688	3999	30	15	\N
3822	688	4472	15	24	\N
3823	688	3943	12	14	\N
3824	689	5569	27	23	\N
3825	689	3866	21	3	\N
3826	689	4481	5	19	\N
3827	689	5081	36	19	\N
3828	689	5560	8	31	\N
3829	689	4019	3	15	\N
3830	689	4295	38	38	\N
3831	689	5465	25	10	\N
3832	689	5075	14	6	\N
3833	674	4271	18	24	\N
3834	674	4449	29	26	\N
3835	674	4275	8	36	\N
3836	674	5469	15	1	\N
3837	674	3986	29	2	\N
3838	674	4250	28	20	\N
3839	674	5171	35	17	\N
3840	674	5467	1	17	\N
3841	674	4242	35	19	\N
3842	690	4918	17	28	\N
3843	690	5579	37	24	\N
3844	690	4787	13	25	\N
3845	690	4386	25	21	\N
3846	690	4206	25	6	\N
3847	690	4243	32	2	\N
3848	690	4990	4	38	\N
3849	690	5588	14	6	\N
3850	690	4035	28	35	\N
3851	691	4595	40	19	\N
3852	691	4760	35	35	\N
3853	691	4762	22	23	\N
3854	691	4203	18	3	\N
3855	691	4240	4	39	\N
3856	691	4220	33	24	\N
3857	691	5584	13	23	\N
3858	691	5046	6	11	\N
3859	691	4258	9	10	\N
3860	675	5575	22	27	\N
3861	675	5578	20	25	\N
3862	675	5089	20	28	\N
3863	675	4297	8	35	\N
3864	675	4030	19	18	\N
3865	675	4269	22	34	\N
3866	675	4928	32	11	\N
3867	675	5489	4	37	\N
3868	675	5587	1	39	\N
3869	692	4478	6	26	\N
3870	692	4635	14	6	\N
3871	692	4260	22	26	\N
3872	692	5177	11	8	\N
3873	692	4192	17	39	\N
3874	692	4303	27	18	\N
3875	692	4575	16	22	\N
3876	692	4262	28	35	\N
3877	692	4264	15	33	\N
3878	676	4639	20	6	\N
3879	676	5563	8	5	\N
3880	676	3954	25	10	\N
3881	676	4213	17	30	\N
3882	676	5027	15	28	\N
3883	676	5565	31	22	\N
3884	676	4458	24	4	\N
3885	676	5151	18	30	\N
3886	676	5154	30	4	\N
3887	693	4284	15	9	\N
3888	693	5187	39	39	\N
3889	693	4265	11	24	\N
3890	693	3864	32	35	\N
3891	693	3979	13	38	\N
3892	693	3996	9	34	\N
3893	693	5200	9	16	\N
3894	693	4288	4	10	\N
3895	693	4263	14	32	\N
3896	694	5490	14	32	\N
3897	694	5498	10	17	\N
3898	694	4207	22	7	\N
3899	694	5566	38	31	\N
3900	694	5004	11	38	\N
3901	694	5614	32	11	\N
3902	694	4027	16	7	\N
3903	694	5603	11	17	\N
3904	694	4261	9	18	\N
3905	677	4483	14	28	\N
3906	677	4324	35	16	\N
3907	677	4251	17	14	\N
3908	677	4274	10	18	\N
3909	677	4267	7	24	\N
3910	677	5176	6	40	\N
3911	677	4296	18	7	\N
3912	677	5595	29	16	\N
3913	677	4581	1	26	\N
3914	695	4465	19	33	\N
3915	695	4016	10	26	\N
3916	695	4012	33	2	\N
3917	695	4217	16	13	\N
3918	695	5600	5	5	\N
3919	695	5179	25	25	\N
3920	695	5219	40	13	\N
3921	695	4299	22	6	\N
3922	695	5590	10	29	\N
3923	696	3959	8	12	\N
3924	696	5583	33	36	\N
3925	696	5598	9	17	\N
3926	696	4505	25	9	\N
3927	696	4313	22	33	\N
3928	696	5495	3	27	\N
3929	696	4028	10	35	\N
3930	696	3997	16	4	\N
3931	696	4116	10	32	\N
3932	697	4032	29	13	\N
3933	697	4187	40	30	\N
3934	697	4282	17	12	\N
3935	697	5460	23	8	\N
3936	697	4614	5	21	\N
3937	697	5088	9	38	\N
3938	697	4775	33	2	\N
3939	697	4042	34	6	\N
3940	697	5083	20	26	\N
3941	698	4629	5	3	\N
3942	698	5268	31	7	\N
3943	698	4037	40	16	\N
3944	698	5472	36	7	\N
3945	698	5223	37	40	\N
3946	698	4013	17	8	\N
3947	698	5193	30	22	\N
3948	698	5155	30	24	\N
3949	698	5158	1	13	\N
3950	699	4002	37	16	\N
3951	699	4766	25	8	\N
3952	699	4613	33	38	\N
3953	699	4224	17	6	\N
3954	699	3923	10	17	\N
3955	699	4021	7	37	\N
3956	699	4253	4	1	\N
3957	699	5605	27	31	\N
3958	699	5214	5	13	\N
3959	706	4279	28	5	\N
3960	706	5175	28	29	\N
3961	706	5024	4	25	\N
3962	706	4468	36	5	\N
3963	706	4780	36	12	\N
3964	706	5026	24	1	\N
3965	700	4008	23	16	\N
3966	700	4210	22	19	\N
3967	700	4043	3	29	\N
3968	700	3987	40	27	\N
3969	700	4014	25	14	\N
3970	700	4929	33	9	\N
3971	701	5574	21	22	\N
3972	701	5568	2	33	\N
3973	701	5209	14	16	\N
3974	701	4005	37	8	\N
3975	701	4049	35	5	\N
3976	701	4703	3	21	\N
3977	702	5061	21	7	\N
3978	702	5599	24	30	\N
3979	702	5499	28	28	\N
3980	702	5178	10	29	\N
3981	702	4315	36	16	\N
3982	702	4270	2	35	\N
3983	703	5615	31	31	\N
3984	703	4009	4	17	\N
3985	703	4238	36	33	\N
3986	703	4436	9	14	\N
3987	703	5270	28	23	\N
3988	703	4447	39	10	\N
3989	704	5192	16	34	\N
3990	704	4266	26	39	\N
3991	704	5462	22	34	\N
3992	704	5505	3	2	\N
3993	704	5183	12	35	\N
3994	704	5077	5	15	\N
3995	705	5266	33	30	\N
3996	705	3988	20	20	\N
3997	705	4026	11	11	\N
3998	705	5271	30	31	\N
3999	705	4497	13	30	\N
4000	705	5492	38	33	\N
4001	717	4739	40	30	\N
4002	717	5217	34	36	\N
4003	717	3976	8	11	\N
4004	717	5053	14	2	\N
4005	717	4103	33	27	\N
4006	717	4461	12	5	\N
4007	716	4476	36	36	\N
4008	716	3751	3	13	\N
4009	716	3965	31	6	\N
4010	716	4334	8	22	\N
4011	716	5064	14	36	\N
4012	716	5044	2	8	\N
4013	710	5184	33	11	\N
4014	710	5604	18	29	\N
4015	710	4758	32	28	\N
4016	710	4216	31	15	\N
4017	710	5066	6	25	\N
4018	710	5070	29	28	\N
4019	711	5087	11	18	\N
4020	711	4020	14	28	\N
4021	711	5260	13	27	\N
4022	711	5028	4	4	\N
4023	711	5601	4	38	\N
4024	711	5052	36	23	\N
4025	714	5229	22	6	\N
4026	714	4752	10	9	\N
4027	714	4909	26	34	\N
4028	714	3946	20	10	\N
4029	714	5616	5	21	\N
4030	714	3994	33	19	\N
4031	708	4246	25	5	\N
4032	708	5275	6	22	\N
4033	708	5182	8	24	\N
4034	708	4083	3	5	\N
4035	708	3960	5	15	\N
4036	708	5057	13	21	\N
4037	709	4226	39	31	\N
4038	709	4039	5	40	\N
4039	709	5610	3	31	\N
4040	709	4578	6	34	\N
4041	709	4272	13	4	\N
4042	709	4033	21	27	\N
4043	712	4494	39	19	\N
4044	712	5481	7	36	\N
4045	712	3796	15	9	\N
4046	712	5464	6	19	\N
4047	712	4779	1	8	\N
4048	712	4621	13	5	\N
4049	713	4443	29	36	\N
4050	713	5459	11	21	\N
4051	713	5497	22	39	\N
4052	713	5174	3	18	\N
4053	713	3921	21	29	\N
4054	713	4589	17	32	\N
4055	718	5591	26	39	\N
4056	718	3948	22	27	\N
4057	718	5502	9	21	\N
4058	718	4023	31	16	\N
4059	718	4917	32	4	\N
4060	718	5199	29	20	\N
4061	719	5196	13	26	\N
4062	719	5048	32	9	\N
4063	719	4954	33	37	\N
4064	719	5030	29	29	\N
4065	719	5478	4	35	\N
4066	719	5069	36	19	\N
4067	707	5577	16	33	\N
4068	707	4290	30	12	\N
4069	707	4041	11	15	\N
4070	707	5072	15	9	\N
4071	707	5198	13	25	\N
4072	707	5045	33	23	\N
4073	715	4484	37	34	\N
4074	715	5222	22	9	\N
4075	715	4587	35	40	\N
4076	715	4495	21	6	\N
4077	715	4006	25	38	\N
4078	715	4601	25	28	\N
4079	720	5318	20	5	\N
4080	720	5340	6	29	\N
4081	720	5319	6	19	\N
4082	720	5362	33	37	\N
4083	720	5348	4	20	\N
4084	720	5351	35	34	\N
4085	721	5359	38	5	\N
4086	721	3761	22	34	\N
4087	721	5352	37	12	\N
4088	721	5349	31	26	\N
4089	721	5321	21	9	\N
4090	721	4733	21	22	\N
4091	722	5313	23	3	\N
4092	722	5358	20	10	\N
4093	722	5354	3	16	\N
4094	722	3791	10	17	\N
4095	722	3794	37	6	\N
4096	722	5360	30	8	\N
4097	723	4778	27	31	\N
4098	723	5047	37	40	\N
4099	723	3842	37	1	\N
4100	723	4925	3	40	\N
4101	723	4450	4	1	\N
4102	723	4763	24	27	\N
4103	724	3816	40	5	\N
4104	724	4853	25	14	\N
4105	724	3926	39	29	\N
4106	724	4788	33	3	\N
4107	724	4766	11	37	\N
4108	724	4910	24	25	\N
4109	725	5031	37	16	\N
4110	725	4455	24	7	\N
4111	725	4916	17	25	\N
4112	725	5067	8	24	\N
4113	725	4772	16	6	\N
4114	725	4690	6	8	\N
4115	726	4930	27	9	\N
4116	726	4600	17	13	\N
4117	726	3813	34	22	\N
4118	726	4457	29	27	\N
4119	726	4405	31	35	\N
4120	726	4747	14	1	\N
4121	727	4590	32	12	\N
4122	727	4748	35	5	\N
4123	727	4616	31	39	\N
4124	727	5501	3	35	\N
4125	727	4907	29	9	\N
4126	727	4335	18	25	\N
4127	728	4751	22	2	\N
4128	728	4618	3	26	\N
4129	728	4922	2	31	\N
4130	728	4687	20	13	\N
4131	728	4433	12	3	\N
4132	728	5280	13	35	\N
4133	735	5020	5	2	\N
4134	735	5034	25	12	\N
4135	735	4310	12	19	\N
4136	735	4272	14	15	\N
4137	735	5036	24	21	\N
4138	735	5023	4	17	\N
4139	729	4759	30	37	\N
4140	729	4699	21	12	\N
4141	729	3948	18	19	\N
4142	729	5207	6	21	\N
4143	729	4921	25	15	\N
4144	729	4591	19	36	\N
4145	730	5202	8	20	\N
4146	730	4927	16	33	\N
4147	730	4774	34	37	\N
4148	730	4814	39	13	\N
4149	730	4764	21	2	\N
4150	730	4908	2	35	\N
4151	731	4934	23	39	\N
4152	731	4931	34	20	\N
4153	731	4746	9	17	\N
4154	731	4760	12	38	\N
4155	731	4936	14	36	\N
4156	731	4769	25	14	\N
4157	732	5386	29	17	\N
4158	732	4688	16	5	\N
4159	732	4948	14	1	\N
4160	732	5429	8	25	\N
4161	732	5388	21	23	\N
4162	732	5385	12	2	\N
4163	733	3841	20	38	\N
4164	733	3844	7	4	\N
4165	733	5502	19	20	\N
4166	733	4482	22	32	\N
4167	733	3811	11	16	\N
4168	733	3818	4	19	\N
4169	734	5064	39	11	\N
4170	734	4615	30	32	\N
4171	734	4926	34	39	\N
4172	734	5567	32	13	\N
4173	734	4743	4	16	\N
4174	734	4691	26	27	\N
4175	737	4599	2	31	\N
4176	737	4610	29	16	\N
4177	737	4598	8	13	\N
4178	737	3965	17	18	\N
4179	737	3924	24	8	\N
4180	737	3930	25	34	\N
4181	736	4768	4	3	\N
4182	736	4626	7	35	\N
4183	736	4767	18	21	\N
4184	736	4906	38	11	\N
4185	736	4784	13	11	\N
4186	736	4438	15	20	\N
4187	738	5087	26	13	\N
4188	738	3845	37	39	\N
4189	738	4740	20	24	\N
4190	738	5303	25	39	\N
4191	738	3981	3	15	\N
4192	738	3848	34	14	\N
4193	739	4737	34	5	\N
4194	739	5382	30	10	\N
4195	739	4967	26	18	\N
4196	739	4933	12	20	\N
4197	739	4765	34	29	\N
4198	739	4905	27	13	\N
4199	740	4617	11	5	\N
4200	740	4486	26	6	\N
4201	740	4573	8	31	\N
4202	740	4305	30	7	\N
4203	740	4492	22	14	\N
4204	740	4479	34	23	\N
4205	741	3960	34	38	\N
4206	741	4641	5	19	\N
4207	741	3850	19	19	\N
4208	741	4506	15	24	\N
4209	741	4498	36	3	\N
4210	741	4565	20	21	\N
4211	744	5325	35	29	\N
4212	744	5497	33	4	\N
4213	744	4508	18	12	\N
4214	744	5347	3	3	\N
4215	744	5129	27	15	\N
4216	744	4606	38	32	\N
4217	742	4504	28	16	\N
4218	742	4634	11	21	\N
4219	742	4602	20	11	\N
4220	742	4568	15	10	\N
4221	742	4477	7	14	\N
4222	742	4625	15	12	\N
4223	743	4623	40	28	\N
4224	743	4489	2	26	\N
4225	743	4485	27	17	\N
4226	743	3938	19	16	\N
4227	743	4597	18	32	\N
4228	743	4500	14	3	\N
4229	745	4645	38	3	\N
4230	745	4593	22	11	\N
4231	745	4622	27	16	\N
4232	745	4596	9	29	\N
4233	745	4488	1	5	\N
4234	745	4528	18	22	\N
4235	746	4493	33	32	\N
4236	746	5213	3	38	\N
4237	746	4624	7	22	\N
4238	746	5449	6	19	\N
4239	746	5395	21	13	\N
4240	746	5084	27	14	\N
4241	747	4701	2	14	\N
4242	747	3967	1	4	\N
4243	747	5195	38	8	\N
4244	747	3940	4	5	\N
4245	747	4962	8	28	\N
4246	747	3748	7	30	\N
4247	748	4471	22	7	\N
4248	748	4584	9	5	\N
4249	748	5442	14	14	\N
4250	748	5411	32	40	\N
4251	748	5080	37	23	\N
4252	748	5401	14	33	\N
4253	749	5085	5	37	\N
4254	749	3950	5	37	\N
4255	749	5399	31	38	\N
4256	749	5180	17	33	\N
4257	749	5071	30	14	\N
4258	749	5058	36	35	\N
4259	750	4231	34	38	\N
4260	750	5060	13	19	\N
4261	750	4612	27	8	\N
4262	750	5082	39	3	\N
4263	750	3942	21	13	\N
4264	750	5211	17	35	\N
4265	751	5073	31	19	\N
4266	751	5206	24	27	\N
4267	751	5209	4	31	\N
4268	751	3798	14	15	\N
4269	751	5201	31	8	\N
4270	751	5074	4	6	\N
4271	755	4445	12	14	\N
4272	755	5033	13	22	\N
4273	755	4955	18	32	\N
4274	755	4947	39	7	\N
4275	755	4965	11	28	\N
4276	755	4963	7	40	\N
4277	753	5448	9	31	\N
4278	753	4459	25	27	\N
4279	753	4464	39	33	\N
4280	753	5392	38	37	\N
4281	753	4446	29	16	\N
4282	753	4428	8	10	\N
4283	752	4692	10	32	\N
4284	752	4944	36	33	\N
4285	752	4308	21	3	\N
4286	752	4442	16	27	\N
4287	752	5002	18	34	\N
4288	752	4705	31	38	\N
4289	754	4443	40	3	\N
4290	754	5019	4	18	\N
4291	754	5022	17	25	\N
4292	754	4314	20	10	\N
4293	754	4939	26	3	\N
4294	754	4319	25	28	\N
4295	756	4329	31	2	\N
4296	756	4952	38	24	\N
4297	756	4328	37	16	\N
4298	756	4467	19	6	\N
4299	756	4951	12	29	\N
4300	756	5013	24	16	\N
4301	757	4671	24	30	\N
4302	757	5016	6	21	\N
4303	757	4670	29	25	\N
4304	757	4462	31	1	\N
4305	757	4309	7	27	\N
4306	757	4429	6	14	\N
4307	758	5035	22	29	\N
4308	758	4958	34	16	\N
4309	758	5032	17	12	\N
4310	758	4356	34	20	\N
4311	758	4466	39	20	\N
4312	758	5005	31	13	\N
4313	761	3857	17	13	\N
4314	761	3906	35	8	\N
4315	761	3855	17	5	\N
4316	761	3856	33	10	\N
4317	761	3867	1	21	\N
4318	761	3896	26	13	\N
4319	763	3913	30	15	\N
4320	763	3897	22	16	\N
4321	763	3859	18	11	\N
4322	763	3854	39	27	\N
4323	763	3918	2	27	\N
4324	763	3905	22	35	\N
4325	764	3907	7	40	\N
4326	764	5610	35	30	\N
4327	764	3916	22	36	\N
4328	764	3908	17	32	\N
4329	764	3901	27	32	\N
4330	764	3899	18	6	\N
4331	762	3853	4	16	\N
4332	762	5326	18	26	\N
4333	762	3861	15	5	\N
4334	762	5446	34	2	\N
4335	762	3851	13	21	\N
4336	762	3911	4	38	\N
4337	759	3955	1	25	\N
4338	759	3936	8	21	\N
4339	759	3909	17	28	\N
4340	759	4277	24	30	\N
4341	759	3917	12	12	\N
4342	759	3947	36	19	\N
4343	760	3868	1	31	\N
4344	760	3915	6	2	\N
4345	760	5015	28	36	\N
4346	760	5355	19	21	\N
4347	760	3914	23	19	\N
4348	760	3910	39	10	\N
4349	765	4672	40	21	\N
4350	765	4212	12	24	\N
4351	765	4681	38	39	\N
4352	765	4642	23	20	\N
4353	765	4668	37	21	\N
4354	765	4669	24	35	\N
4355	766	4679	17	39	\N
4356	766	4638	33	15	\N
4357	766	4686	37	7	\N
4358	766	4685	34	3	\N
4359	766	4015	9	18	\N
4360	766	4680	23	27	\N
4361	767	4674	11	11	\N
4362	767	4636	37	18	\N
4363	767	4646	38	26	\N
4364	767	4637	40	28	\N
4365	767	4675	32	22	\N
4366	767	4633	11	33	\N
4367	768	5579	36	11	\N
4368	768	5485	6	23	\N
4369	768	3793	9	24	\N
4370	768	3792	4	31	\N
4371	768	3766	17	28	\N
4372	768	3789	13	37	\N
4373	769	3805	13	19	\N
4374	769	3750	23	9	\N
4375	769	3759	11	3	\N
4376	769	3790	10	3	\N
4377	769	5601	16	4	\N
4378	769	3758	17	35	\N
4379	770	4667	10	11	\N
4380	770	3765	14	14	\N
4381	770	4426	17	4	\N
4382	770	3799	13	31	\N
4383	770	3752	6	19	\N
4384	770	3783	22	3	\N
4385	771	3749	12	19	\N
4386	771	3788	13	27	\N
4387	771	3764	38	28	\N
4388	771	4194	30	2	\N
4389	771	3754	29	26	\N
4390	771	3753	40	20	\N
4391	772	5349	26	9	\N
4392	772	3806	14	1	\N
4393	772	4333	32	33	\N
4394	772	5324	29	18	\N
4395	772	5323	27	4	\N
4396	772	5316	13	16	\N
4397	773	3755	36	26	\N
4398	773	3974	21	5	\N
4399	773	5043	36	26	\N
4400	773	4611	10	21	\N
4401	773	5453	2	22	\N
4402	773	5356	14	28	\N
4403	774	5227	9	33	\N
4404	774	4632	9	11	\N
4405	774	4491	15	14	\N
4406	774	5265	36	30	\N
4407	774	5273	36	38	\N
4408	774	5262	20	28	\N
4409	775	5263	23	25	\N
4410	775	5272	5	5	\N
4411	775	4495	36	37	\N
4412	775	5172	2	14	\N
4413	775	5230	8	29	\N
4414	775	4609	30	39	\N
4415	776	4469	13	37	\N
4416	776	4742	1	37	\N
4417	776	5361	11	23	\N
4418	776	5215	23	38	\N
4419	776	5242	23	19	\N
4420	776	3800	5	35	\N
4421	777	5278	35	27	\N
4422	777	4660	18	32	\N
4423	777	5169	11	25	\N
4424	777	5231	17	36	\N
4425	777	5258	23	13	\N
4426	777	5216	39	23	\N
4427	779	5224	33	38	\N
4428	779	5065	37	28	\N
4429	779	5221	23	6	\N
4430	779	4683	10	30	\N
4431	779	5277	37	14	\N
4432	779	5225	30	8	\N
4433	778	5451	40	15	\N
4434	778	4327	35	7	\N
4435	778	5322	38	6	\N
4436	778	4655	40	39	\N
4437	778	5063	8	1	\N
4438	778	5274	22	12	\N
4439	780	5240	11	15	\N
4440	780	4697	16	4	\N
4441	780	5269	39	6	\N
4442	780	5218	37	19	\N
4443	780	5264	23	35	\N
4444	780	5055	21	40	\N
4445	781	5400	5	5	\N
4446	781	5405	22	23	\N
4447	781	5412	9	23	\N
4448	781	5452	38	36	\N
4449	781	5454	14	4	\N
4450	781	5402	4	28	\N
4451	782	5397	9	2	\N
4452	782	5413	10	26	\N
4453	782	5403	2	32	\N
4454	782	5404	16	3	\N
4455	782	4695	24	30	\N
4456	782	5390	28	31	\N
4457	783	5455	28	13	\N
4458	783	5391	40	37	\N
4459	783	5437	21	17	\N
4460	783	5398	30	2	\N
4461	783	5393	21	30	\N
4462	783	5433	15	11	\N
4463	784	5364	16	29	\N
4464	784	5619	17	33	\N
4465	784	5011	4	30	\N
4466	784	4940	34	16	\N
4467	784	4988	2	22	\N
4468	784	4964	34	16	\N
4469	785	5038	39	23	\N
4470	785	5040	26	29	\N
4471	785	4945	13	25	\N
4472	785	4326	19	24	\N
4473	785	4957	14	2	\N
4474	785	5003	30	31	\N
4475	786	4008	36	9	\N
4476	786	5001	20	25	\N
4477	786	5012	25	20	\N
4478	786	4949	12	24	\N
4479	786	5010	21	23	\N
4480	786	4738	3	24	\N
4481	787	3838	6	39	\N
4482	787	3840	32	16	\N
4483	787	3809	23	33	\N
4484	787	3849	34	39	\N
4485	787	3846	28	39	\N
4486	787	3839	13	30	\N
4487	788	5363	20	12	\N
4488	788	4702	21	6	\N
4489	788	3843	18	14	\N
4490	788	4704	24	22	\N
4491	788	5310	10	26	\N
4492	788	4693	32	11	\N
4493	790	3817	31	12	\N
4494	790	3810	8	40	\N
4495	790	5368	21	26	\N
4496	790	5387	27	35	\N
4497	790	5372	40	25	\N
4498	790	5370	39	18	\N
4499	789	5281	38	40	\N
4500	789	3836	38	24	\N
4501	789	5284	40	34	\N
4502	789	5305	13	38	\N
4503	789	5287	2	7	\N
4504	789	5307	33	40	\N
4505	791	3931	11	10	\N
4506	791	3956	13	37	\N
4507	791	3958	26	35	\N
4508	791	5479	36	31	\N
4509	791	3928	13	32	\N
4510	791	3972	12	31	\N
4511	792	3966	24	30	\N
4512	792	3941	35	29	\N
4513	792	4757	24	11	\N
4514	792	5203	23	16	\N
4515	792	3971	37	9	\N
4516	792	3961	22	22	\N
4517	793	3937	38	10	\N
4518	793	5608	20	12	\N
4519	793	4698	38	8	\N
4520	793	3927	22	19	\N
4521	793	3939	40	6	\N
4522	793	3964	32	30	\N
4523	802	4298	5	30	\N
4524	802	4248	2	22	\N
4525	802	4454	8	38	\N
4526	802	4302	6	20	\N
4527	802	5596	5	28	\N
4528	802	4490	34	5	\N
4529	802	5007	16	36	\N
4530	802	4317	15	2	\N
4531	802	4259	5	30	\N
4532	803	5057	3	15	\N
4533	803	4296	22	40	\N
4534	803	4739	12	26	\N
4535	803	5611	32	9	\N
4536	803	5049	37	38	\N
4537	803	5570	27	16	\N
4538	803	5486	6	15	\N
4539	803	4038	28	20	\N
4540	803	4588	33	1	\N
4541	804	5181	4	5	\N
4542	804	5494	7	39	\N
4543	804	4605	36	27	\N
4544	804	5210	11	20	\N
4545	804	3980	10	40	\N
4546	804	5496	7	3	\N
4547	804	4283	28	38	\N
4548	804	4276	9	10	\N
4549	804	4607	30	12	\N
4550	805	5573	26	22	\N
4551	805	4786	30	30	\N
4552	805	5267	18	11	\N
4553	805	4236	19	24	\N
4554	805	4199	33	39	\N
4555	805	4487	5	32	\N
4556	805	5572	38	33	\N
4557	805	4273	37	34	\N
4558	805	4209	29	39	\N
4559	794	5599	25	32	\N
4560	794	4049	2	19	\N
4561	794	4278	15	27	\N
4562	794	4300	26	35	\N
4563	794	4592	6	23	\N
4564	794	4223	12	3	\N
4565	794	5607	28	3	\N
4566	794	4036	33	32	\N
4567	794	5483	5	37	\N
4568	806	5462	4	26	\N
4569	806	4481	31	2	\N
4570	806	5276	33	23	\N
4571	806	5174	24	1	\N
4572	806	5582	9	2	\N
4573	806	4003	34	38	\N
4574	806	5597	12	13	\N
4575	806	5612	9	3	\N
4576	806	5463	24	30	\N
4577	795	5076	27	10	\N
4578	795	4288	18	4	\N
4579	795	3989	34	38	\N
4580	795	4047	20	7	\N
4581	795	3902	17	19	\N
4582	795	5500	38	14	\N
4583	795	4287	12	38	\N
4584	795	4750	38	21	\N
4585	795	4268	8	24	\N
4586	807	5504	28	37	\N
4587	807	5484	22	27	\N
4588	807	4779	24	39	\N
4589	807	4754	23	11	\N
4590	807	5079	40	37	\N
4591	807	5589	26	4	\N
4592	807	5456	22	19	\N
4593	807	5167	38	4	\N
4594	807	4011	12	32	\N
4595	808	5175	33	17	\N
4596	808	4966	22	27	\N
4597	808	4258	29	38	\N
4598	808	5004	21	36	\N
4599	808	4208	3	4	\N
4600	808	4239	8	22	\N
4601	808	4281	7	17	\N
4602	808	5586	3	9	\N
4603	808	5056	24	38	\N
4604	796	5481	3	8	\N
4605	796	3751	11	14	\N
4606	796	4614	1	19	\N
4607	796	4777	7	12	\N
4608	796	3995	18	10	\N
4609	796	4321	31	39	\N
4610	796	4440	29	7	\N
4611	796	4254	29	17	\N
4612	809	3863	40	14	\N
4613	809	5585	14	19	\N
4614	809	4219	10	19	\N
4615	809	4001	39	33	\N
4616	809	4585	27	8	\N
4617	809	5051	18	2	\N
4618	809	4293	32	6	\N
4619	809	3977	23	37	\N
4620	809	4761	13	17	\N
4621	810	5468	8	1	\N
4622	810	4758	38	36	\N
4623	810	4005	15	3	\N
4624	810	4332	34	20	\N
4625	810	5593	15	38	\N
4626	810	4783	7	24	\N
4627	810	4914	38	37	\N
4628	810	5186	13	38	\N
4629	810	4244	25	31	\N
4630	797	5568	28	25	\N
4631	797	5170	30	31	\N
4632	797	3968	28	19	\N
4633	797	4935	4	31	\N
4634	797	4627	38	31	\N
4635	797	5571	1	7	\N
4636	797	4286	16	12	\N
4637	797	3985	35	30	\N
4638	797	5613	30	9	\N
4639	811	4439	25	35	\N
4640	811	3945	6	12	\N
4641	811	5562	6	23	\N
4642	811	4256	1	30	\N
4643	811	4924	36	7	\N
4644	811	4770	19	9	\N
4645	811	5487	9	17	\N
4646	811	4782	6	12	\N
4647	811	5189	13	1	\N
4648	812	5615	31	25	\N
4649	812	4749	20	6	\N
4650	812	5460	35	13	\N
4651	812	4472	20	20	\N
4652	812	3943	33	37	\N
4653	812	5576	32	18	\N
4654	812	4025	40	21	\N
4655	812	4608	35	37	\N
4656	812	4010	19	15	\N
4657	813	4214	5	20	\N
4658	813	4203	36	33	\N
4659	813	5465	19	17	\N
4660	813	5075	23	7	\N
4661	813	5569	10	33	\N
4662	813	3866	14	33	\N
4663	813	5560	22	12	\N
4664	813	4019	11	10	\N
4665	813	4295	11	1	\N
4666	798	4253	17	22	\N
4667	798	4225	18	24	\N
4668	798	4242	34	19	\N
4669	798	4271	25	17	\N
4670	798	4449	18	20	\N
4671	798	4275	3	7	\N
4672	798	5469	20	36	\N
4673	798	3986	4	40	\N
4674	798	5171	30	36	\N
4675	814	5192	17	36	\N
4676	814	4954	32	37	\N
4677	814	5578	29	14	\N
4678	814	4787	28	11	\N
4679	814	4386	2	38	\N
4680	814	4206	30	10	\N
4681	814	4243	5	31	\N
4682	814	5588	3	20	\N
4683	814	4035	13	26	\N
4684	815	4752	17	7	\N
4685	815	5270	11	18	\N
4686	815	5590	9	3	\N
4687	815	4595	8	23	\N
4688	815	4762	21	5	\N
4689	815	4240	38	21	\N
4690	815	4220	24	32	\N
4691	815	5584	38	31	\N
4692	815	5046	30	11	\N
4693	799	4918	23	34	\N
4694	799	3797	18	34	\N
4695	799	4280	39	16	\N
4696	799	5575	23	32	\N
4697	799	4297	35	8	\N
4698	799	4030	9	17	\N
4699	799	4928	20	22	\N
4700	799	5489	22	28	\N
4701	799	5587	7	25	\N
4702	816	4630	33	28	\N
4703	816	4324	32	2	\N
4704	816	4478	35	20	\N
4705	816	4635	16	11	\N
4706	816	4260	19	5	\N
4707	816	5177	7	26	\N
4708	816	4192	17	38	\N
4709	816	4575	2	8	\N
4710	816	4264	40	22	\N
4711	800	5194	10	34	\N
4712	800	3975	6	17	\N
4713	800	4639	16	36	\N
4714	800	5563	22	3	\N
4715	800	3954	34	35	\N
4716	800	4213	20	12	\N
4717	800	5565	15	4	\N
4718	800	5151	32	12	\N
4719	800	5154	17	12	\N
4720	817	4678	32	14	\N
4721	817	4227	37	31	\N
4722	817	4284	2	28	\N
4723	817	5187	20	34	\N
4724	817	4265	37	7	\N
4725	817	3864	19	8	\N
4726	817	3996	12	26	\N
4727	817	5200	33	20	\N
4728	817	4263	10	14	\N
4729	818	4237	30	37	\N
4730	818	3923	13	29	\N
4731	818	5498	37	19	\N
4732	818	4207	13	21	\N
4733	818	5566	22	10	\N
4734	818	5614	24	36	\N
4735	818	4027	9	21	\N
4736	818	5603	18	14	\N
4737	818	4261	30	33	\N
4738	801	5212	34	27	\N
4739	801	3991	6	33	\N
4740	801	5466	14	23	\N
4741	801	4483	22	30	\N
4742	801	4251	37	20	\N
4743	801	4267	7	18	\N
4744	801	5176	26	11	\N
4745	801	5595	29	30	\N
4746	801	4581	32	25	\N
4747	819	4497	8	27	\N
4748	819	4937	2	25	\N
4749	819	4269	20	5	\N
4750	819	3990	25	38	\N
4751	819	4016	26	30	\N
4752	819	4012	19	29	\N
4753	819	5600	12	6	\N
4754	819	5179	1	10	\N
4755	819	5219	31	24	\N
4756	820	4024	24	12	\N
4757	820	5583	40	7	\N
4758	820	5598	37	9	\N
4759	820	4505	27	11	\N
4760	820	4313	35	19	\N
4761	820	5495	17	28	\N
4762	820	4028	14	15	\N
4763	820	3997	35	32	\N
4764	820	4116	16	1	\N
4765	821	4270	26	22	\N
4766	821	4291	21	22	\N
4767	821	4032	31	27	\N
4768	821	4187	35	24	\N
4769	821	4282	23	28	\N
4770	821	5088	17	9	\N
4771	821	4775	1	26	\N
4772	821	4042	7	13	\N
4773	821	5083	27	36	\N
4774	822	5199	30	19	\N
4775	822	4229	27	23	\N
4776	822	4578	10	35	\N
4777	822	5158	33	36	\N
4778	822	4629	17	23	\N
4779	822	5268	26	5	\N
4780	822	4013	2	15	\N
4781	822	5193	30	29	\N
4782	822	5155	14	10	\N
4783	823	5592	15	38	\N
4784	823	5030	34	14	\N
4785	823	5458	13	10	\N
4786	823	4274	12	7	\N
4787	823	5069	19	39	\N
4788	823	5561	2	35	\N
4789	823	4002	3	5	\N
4790	823	4021	27	29	\N
4791	823	5214	28	11	\N
4792	824	4703	11	32	\N
4793	824	5222	20	31	\N
4794	824	3979	32	33	\N
4795	824	4043	36	3	\N
4796	824	4014	4	29	\N
4797	824	4929	13	20	\N
4798	825	4468	18	13	\N
4799	825	5602	33	7	\N
4800	825	4226	26	10	\N
4801	825	3992	35	21	\N
4802	825	5068	18	20	\N
4803	825	5574	39	23	\N
4804	826	4004	27	6	\N
4805	826	5604	17	32	\N
4806	826	5024	29	37	\N
4807	826	4285	34	4	\N
4808	826	4613	1	27	\N
4809	826	4315	9	40	\N
4810	827	3982	33	35	\N
4811	827	5078	7	32	\N
4812	827	4589	26	40	\N
4813	827	4017	38	29	\N
4814	827	4475	34	22	\N
4815	827	4009	29	1	\N
4816	828	5467	39	11	\N
4817	828	5591	32	11	\N
4818	828	5266	17	35	\N
4819	828	5048	24	20	\N
4820	828	5505	37	18	\N
4821	828	5077	26	35	\N
4822	829	3988	23	3	\N
4823	829	4026	32	36	\N
4824	829	5271	1	5	\N
4825	829	5185	31	3	\N
4826	829	4262	30	25	\N
4827	829	4299	2	37	\N
4828	840	5217	32	23	\N
4829	840	3976	5	11	\N
4830	840	4257	21	23	\N
4831	840	4033	30	38	\N
4832	840	5188	31	39	\N
4833	840	4461	19	16	\N
4834	841	4476	8	34	\N
4835	841	4334	39	18	\N
4836	841	5044	21	21	\N
4837	841	5478	11	39	\N
4838	841	4619	25	32	\N
4839	841	3998	26	22	\N
4840	834	4246	37	24	\N
4841	834	5488	33	27	\N
4842	834	5506	13	32	\N
4843	834	5070	19	28	\N
4844	834	4020	39	33	\N
4845	834	5028	21	31	\N
4846	838	4473	34	5	\N
4847	838	3815	36	14	\N
4848	838	5173	26	6	\N
4849	838	4628	17	37	\N
4850	838	3946	22	10	\N
4851	838	3994	24	8	\N
4852	832	4621	6	5	\N
4853	832	3814	19	19	\N
4854	832	4601	38	10	\N
4855	832	3999	27	37	\N
4856	832	3959	17	37	\N
4857	832	5182	14	9	\N
4858	833	5229	23	24	\N
4859	833	5275	22	5	\N
4860	833	3987	15	26	\N
4861	833	4216	8	27	\N
4862	833	4041	24	35	\N
4863	833	5081	36	8	\N
4864	836	4331	14	38	\N
4865	836	4221	7	17	\N
4866	836	4756	34	19	\N
4867	836	4224	33	14	\N
4868	836	5072	19	24	\N
4869	836	5464	17	2	\N
4870	837	5226	6	7	\N
4871	837	3953	6	20	\N
4872	837	4320	31	29	\N
4873	837	4734	36	36	\N
4874	837	4744	37	38	\N
4875	837	3921	35	38	\N
4876	842	4023	36	12	\N
4877	842	4917	5	12	\N
4878	842	5198	12	11	\N
4879	842	4266	33	13	\N
4880	842	4238	16	27	\N
4881	842	4037	23	29	\N
4882	843	4465	21	14	\N
4883	843	5605	5	16	\N
4884	843	5053	28	28	\N
4885	843	3796	29	36	\N
4886	843	5406	7	8	\N
4887	843	5052	3	23	\N
4888	830	5472	8	20	\N
4889	830	5459	10	39	\N
4890	830	5183	39	13	\N
4891	830	3865	15	18	\N
4892	830	4290	17	13	\N
4893	830	5045	23	32	\N
4894	839	4484	29	4	\N
4895	839	4587	2	7	\N
4896	839	4006	24	8	\N
4897	839	5059	13	20	\N
4898	839	4780	27	26	\N
4899	839	3949	37	32	\N
4900	831	4279	29	33	\N
4901	831	4494	10	40	\N
4902	831	5577	28	29	\N
4903	831	5178	6	7	\N
4904	831	5026	36	11	\N
4905	831	5616	11	31	\N
4906	835	5184	36	16	\N
4907	835	4210	32	13	\N
4908	835	5196	23	38	\N
4909	835	4447	33	26	\N
4910	835	5054	2	27	\N
4911	835	5066	25	24	\N
4912	844	5318	12	31	\N
4913	844	5340	37	7	\N
4914	844	5319	36	6	\N
4915	844	5362	38	4	\N
4916	844	5348	1	20	\N
4917	844	5351	20	13	\N
4918	845	5317	17	26	\N
4919	845	5353	36	9	\N
4920	845	5359	15	2	\N
4921	845	3761	19	14	\N
4922	845	5352	32	3	\N
4923	845	5321	5	7	\N
4924	846	4045	26	31	\N
4925	846	5313	17	32	\N
4926	846	5354	39	10	\N
4927	846	3791	5	20	\N
4928	846	3794	38	10	\N
4929	846	5360	27	26	\N
4930	847	4610	38	6	\N
4931	847	4494	2	11	\N
4932	847	4937	30	22	\N
4933	847	4916	24	16	\N
4934	847	4690	36	35	\N
4935	847	3842	13	32	\N
4936	848	4930	13	17	\N
4937	848	4298	31	24	\N
4938	848	3965	14	26	\N
4939	848	4696	18	39	\N
4940	848	4853	16	1	\N
4941	848	4910	6	21	\N
4942	849	4756	1	7	\N
4943	849	4788	8	3	\N
4944	849	4743	35	4	\N
4945	849	5031	5	10	\N
4946	849	4772	36	21	\N
4947	849	4455	19	5	\N
4948	850	4438	19	38	\N
4949	850	4746	36	16	\N
4950	850	4771	31	16	\N
4951	850	4919	38	40	\N
4952	850	4457	15	23	\N
4953	850	4747	32	10	\N
4954	851	4450	6	34	\N
4955	851	4778	15	17	\N
4956	851	4750	19	30	\N
4957	851	4619	11	17	\N
4958	851	4589	26	14	\N
4959	851	4590	21	18	\N
4960	852	4612	9	10	\N
4961	852	4632	8	29	\N
4962	852	4751	6	19	\N
4963	852	4618	7	6	\N
4964	852	4922	16	24	\N
4965	852	4687	22	2	\N
4966	859	4951	2	26	\N
4967	859	3981	7	11	\N
4968	859	5619	20	31	\N
4969	859	5036	35	25	\N
4970	859	4310	26	14	\N
4971	859	5034	9	9	\N
4972	853	4927	11	29	\N
4973	853	4926	9	32	\N
4974	853	4766	38	37	\N
4975	853	3948	8	31	\N
4976	853	5207	14	29	\N
4977	853	4591	14	27	\N
4978	854	5087	24	10	\N
4979	854	3815	34	39	\N
4980	854	4929	18	20	\N
4981	854	4774	37	31	\N
4982	854	4814	32	18	\N
4983	854	5202	32	17	\N
4984	855	5181	27	9	\N
4985	855	4780	35	34	\N
4986	855	4934	29	4	\N
4987	855	4931	38	31	\N
4988	855	4760	39	27	\N
4989	855	4769	24	9	\N
4990	856	3926	25	25	\N
4991	856	4740	2	19	\N
4992	856	5384	14	39	\N
4993	856	4938	17	16	\N
4994	856	5371	2	11	\N
4995	856	5386	21	39	\N
4996	857	4266	26	15	\N
4997	857	5501	33	14	\N
4998	857	3813	19	28	\N
4999	857	4613	30	34	\N
5000	857	3848	17	37	\N
5001	857	3841	28	1	\N
5002	858	4703	32	13	\N
5003	858	3845	34	35	\N
5004	858	4688	32	7	\N
5005	858	4737	17	11	\N
5006	858	4689	8	11	\N
5007	858	4691	33	19	\N
5008	860	4624	22	30	\N
5009	860	4596	7	32	\N
5010	860	4482	27	28	\N
5011	860	3924	39	33	\N
5012	860	4598	25	10	\N
5013	860	3930	25	30	\N
5014	861	4923	15	20	\N
5015	861	5388	27	4	\N
5016	861	4921	11	28	\N
5017	861	4773	40	9	\N
5018	861	4906	8	30	\N
5019	861	4784	4	22	\N
5020	862	4759	37	31	\N
5021	862	4699	9	32	\N
5022	862	4600	23	7	\N
5023	862	3946	38	8	\N
5024	862	5047	2	19	\N
5025	862	4776	22	21	\N
5026	863	3844	12	23	\N
5027	863	3811	35	11	\N
5028	863	5280	15	1	\N
5029	863	4500	23	34	\N
5030	863	4508	9	20	\N
5031	863	4765	33	34	\N
5032	864	4460	33	4	\N
5033	864	5446	3	8	\N
5034	864	4583	13	18	\N
5035	864	4502	21	2	\N
5036	864	4617	33	26	\N
5037	864	4573	17	39	\N
5038	865	4325	7	39	\N
5039	865	4507	40	34	\N
5040	865	4495	1	31	\N
5041	865	4493	13	40	\N
5042	865	3960	15	8	\N
5043	865	3850	36	39	\N
5044	866	4620	17	3	\N
5045	866	4641	25	38	\N
5046	866	4477	40	39	\N
5047	866	4504	11	28	\N
5048	866	4602	8	3	\N
5049	866	4568	18	36	\N
5050	867	4456	33	27	\N
5051	867	4470	15	23	\N
5052	867	4582	2	4	\N
5053	867	4503	7	23	\N
5054	867	4593	7	25	\N
5055	867	4623	6	1	\N
5056	868	4604	13	6	\N
5057	868	4616	33	9	\N
5058	868	4586	13	38	\N
5059	868	4578	35	10	\N
5060	868	4488	3	7	\N
5061	868	4528	38	18	\N
5062	869	5395	17	23	\N
5063	869	5073	35	24	\N
5064	869	5067	4	9	\N
5065	869	5190	30	6	\N
5066	869	3748	10	32	\N
5067	869	5084	16	32	\N
5068	870	4506	28	11	\N
5069	870	5449	22	12	\N
5070	870	4405	34	2	\N
5071	870	5050	34	14	\N
5072	870	4701	29	17	\N
5073	870	3940	30	38	\N
5074	871	5064	35	4	\N
5075	871	3969	38	28	\N
5076	871	5080	24	22	\N
5077	871	4471	10	26	\N
5078	871	4584	16	27	\N
5079	871	5442	27	3	\N
5080	872	5206	16	1	\N
5081	872	5411	9	40	\N
5082	872	5399	14	26	\N
5083	872	5071	27	3	\N
5084	872	3950	15	38	\N
5085	872	5058	2	28	\N
5086	873	5208	16	35	\N
5087	873	4210	18	4	\N
5088	873	3936	13	38	\N
5089	873	3869	37	37	\N
5090	873	5082	31	36	\N
5091	873	3942	13	13	\N
5092	874	5448	10	36	\N
5093	874	5182	21	7	\N
5094	874	5055	39	4	\N
5095	874	5201	15	3	\N
5096	874	5209	2	21	\N
5097	874	5074	3	33	\N
5098	878	5016	12	31	\N
5099	878	4468	5	28	\N
5100	878	4333	28	17	\N
5101	878	4705	25	4	\N
5102	878	4445	14	15	\N
5103	878	4965	11	40	\N
5104	876	4967	30	23	\N
5105	876	5601	35	16	\N
5106	876	4958	16	1	\N
5107	876	4322	11	35	\N
5108	876	4309	40	22	\N
5109	876	4428	35	9	\N
5110	875	4962	10	22	\N
5111	875	4351	13	9	\N
5112	875	4328	14	15	\N
5113	875	4308	5	26	\N
5114	875	4442	13	24	\N
5115	875	4692	17	20	\N
5116	877	4949	10	35	\N
5117	877	4314	1	17	\N
5118	877	4443	38	15	\N
5119	877	5019	18	6	\N
5120	877	4939	15	8	\N
5121	877	4319	26	29	\N
5122	879	4311	30	26	\N
5123	879	5023	13	14	\N
5124	879	4446	5	14	\N
5125	879	4329	12	24	\N
5126	879	4952	23	23	\N
5127	879	5013	34	22	\N
5128	880	4947	25	31	\N
5129	880	5062	8	20	\N
5130	880	4626	4	8	\N
5131	880	4671	34	1	\N
5132	880	4462	29	2	\N
5133	880	4429	17	25	\N
5134	881	4335	1	22	\N
5135	881	4948	34	39	\N
5136	881	5033	38	10	\N
5137	881	4459	14	25	\N
5138	881	5032	36	21	\N
5139	881	5005	40	15	\N
5140	884	3867	24	22	\N
5141	884	3906	27	15	\N
5142	884	3855	14	2	\N
5143	884	3856	5	13	\N
5144	884	3857	28	1	\N
5145	884	3896	40	36	\N
5146	886	4272	27	37	\N
5147	886	3853	32	20	\N
5148	886	3854	10	27	\N
5149	886	3905	29	26	\N
5150	886	3859	35	11	\N
5151	886	3913	25	35	\N
5152	887	5195	13	27	\N
5153	887	3917	15	31	\N
5154	887	3918	8	40	\N
5155	887	3901	24	14	\N
5156	887	3907	6	37	\N
5157	887	5610	18	31	\N
5158	885	4489	17	25	\N
5159	885	5355	31	14	\N
5160	885	5015	3	3	\N
5161	885	4757	24	27	\N
5162	885	5497	24	3	\N
5163	885	3865	13	17	\N
5164	882	3895	39	29	\N
5165	882	4745	32	19	\N
5166	882	3947	24	6	\N
5167	882	3909	7	22	\N
5168	882	4277	20	35	\N
5169	882	3955	10	18	\N
5170	883	3861	29	37	\N
5171	883	5043	33	27	\N
5172	883	3914	31	23	\N
5173	883	3868	4	22	\N
5174	883	3915	6	2	\N
5175	883	3910	39	13	\N
5176	888	4667	27	10	\N
5177	888	4670	28	38	\N
5178	888	4640	11	5	\N
5179	888	4698	20	38	\N
5180	888	4668	29	20	\N
5181	888	4669	18	11	\N
5182	889	4634	13	25	\N
5183	889	4672	35	26	\N
5184	889	4681	35	36	\N
5185	889	4679	4	38	\N
5186	889	4638	19	8	\N
5187	889	4680	20	21	\N
5188	890	4644	18	4	\N
5189	890	4637	36	34	\N
5190	890	4684	32	3	\N
5191	890	4675	22	39	\N
5192	890	4674	8	3	\N
5193	890	4646	40	19	\N
5194	891	4636	31	37	\N
5195	891	4682	26	35	\N
5196	891	4686	1	30	\N
5197	891	4642	40	31	\N
5198	891	4685	7	17	\N
5199	891	4633	12	1	\N
5200	892	3803	40	17	\N
5201	892	5453	31	5	\N
5202	892	3804	19	8	\N
5203	892	3750	3	25	\N
5204	892	5579	18	3	\N
5205	892	3766	31	3	\N
5206	893	3763	6	29	\N
5207	893	5466	35	36	\N
5208	893	3756	2	5	\N
5209	893	3806	28	20	\N
5210	893	3790	30	23	\N
5211	893	3758	9	10	\N
5212	894	3799	22	35	\N
5213	894	4326	11	13	\N
5214	894	5401	25	39	\N
5215	894	3765	27	12	\N
5216	894	3752	13	26	\N
5217	894	3783	17	6	\N
5218	895	3753	18	23	\N
5219	895	3801	19	25	\N
5220	895	3805	33	28	\N
5221	895	3759	8	28	\N
5222	895	3764	21	40	\N
5223	895	3754	17	2	\N
5224	896	5325	7	18	\N
5225	896	4004	32	25	\N
5226	896	5353	35	31	\N
5227	896	5324	12	35	\N
5228	896	5349	22	14	\N
5229	896	5316	28	5	\N
5230	897	4305	11	39	\N
5231	897	3792	15	33	\N
5232	897	3802	22	11	\N
5233	897	3749	35	35	\N
5234	897	5320	36	40	\N
5235	897	4611	25	22	\N
5236	898	5265	26	30	\N
5237	898	5273	28	1	\N
5238	898	4673	8	15	\N
5239	898	5228	21	23	\N
5240	898	4491	39	24	\N
5241	898	5262	36	38	\N
5242	899	5185	5	22	\N
5243	899	5215	25	14	\N
5244	899	4697	33	20	\N
5245	899	5172	27	21	\N
5246	899	5272	39	39	\N
5247	899	4609	10	34	\N
5248	900	5361	35	19	\N
5249	900	5459	31	26	\N
5250	900	5230	7	10	\N
5251	900	4742	38	34	\N
5252	900	4469	16	25	\N
5253	900	5242	28	12	\N
5254	901	5502	1	1	\N
5255	901	5169	1	33	\N
5256	901	5231	7	39	\N
5257	901	5258	7	6	\N
5258	901	4660	26	8	\N
5259	901	5216	37	22	\N
5260	903	4615	36	4	\N
5261	903	3800	2	13	\N
5262	903	5506	37	14	\N
5263	903	5221	1	16	\N
5264	903	4683	37	17	\N
5265	903	5225	28	23	\N
5266	902	5229	37	18	\N
5267	902	4433	15	12	\N
5268	902	5322	4	30	\N
5269	902	5063	37	38	\N
5270	902	5451	11	21	\N
5271	902	4327	13	32	\N
5272	904	5224	11	16	\N
5273	904	5065	20	9	\N
5274	904	5278	23	39	\N
5275	904	5269	25	9	\N
5276	904	5218	7	6	\N
5277	904	5264	24	36	\N
5278	905	5454	19	28	\N
5279	905	5429	26	17	\N
5280	905	5404	33	10	\N
5281	905	5389	24	35	\N
5282	905	5444	39	8	\N
5283	905	5402	36	34	\N
5284	906	4695	13	17	\N
5285	906	5390	20	21	\N
5286	906	5398	7	35	\N
5287	906	5452	9	35	\N
5288	906	5447	39	11	\N
5289	906	5392	32	16	\N
5290	907	5397	5	16	\N
5291	907	5408	24	14	\N
5292	907	5391	32	17	\N
5293	907	5437	1	25	\N
5294	907	5393	40	11	\N
5295	907	5433	34	34	\N
5296	908	5403	10	31	\N
5297	908	5400	27	8	\N
5298	908	5443	4	27	\N
5299	908	5413	28	39	\N
5300	908	5455	39	37	\N
5301	908	5414	8	23	\N
5302	909	4956	31	36	\N
5303	909	5029	10	18	\N
5304	909	4940	32	30	\N
5305	909	4988	36	9	\N
5306	909	5022	23	12	\N
5307	909	4955	9	20	\N
5308	910	5042	29	30	\N
5309	910	5001	36	5	\N
5310	910	4963	10	15	\N
5311	910	5040	4	6	\N
5312	910	4945	23	35	\N
5313	910	5038	37	13	\N
5314	911	4953	15	29	\N
5315	911	4959	11	18	\N
5316	911	4964	19	31	\N
5317	911	4961	24	23	\N
5318	911	5018	39	38	\N
5319	911	4738	20	38	\N
5320	912	4920	3	10	\N
5321	912	3836	6	13	\N
5322	912	3818	38	14	\N
5323	912	3810	25	37	\N
5324	912	3838	20	23	\N
5325	912	3839	16	35	\N
5326	913	4693	5	18	\N
5327	913	5311	30	27	\N
5328	913	5385	37	17	\N
5329	913	4733	30	10	\N
5330	913	4704	24	10	\N
5331	913	5363	40	6	\N
5332	914	5367	34	34	\N
5333	914	3809	27	38	\N
5334	914	5366	27	33	\N
5335	914	5370	34	12	\N
5336	914	5368	25	34	\N
5337	914	5372	20	32	\N
5338	915	5305	13	29	\N
5339	915	5287	5	5	\N
5340	915	5307	17	13	\N
5341	915	5308	22	15	\N
5342	915	4700	8	2	\N
5343	915	5281	5	20	\N
5344	916	3843	15	6	\N
5345	916	3840	39	26	\N
5346	916	3817	2	39	\N
5347	916	3808	13	35	\N
5348	916	5282	39	3	\N
5349	916	5286	9	15	\N
5350	917	3972	7	35	\N
5351	917	3932	27	11	\N
5352	917	3925	9	36	\N
5353	917	3944	32	34	\N
5354	917	3928	34	22	\N
5355	917	3931	39	28	\N
5356	918	4676	1	29	\N
5357	918	3956	6	3	\N
5358	918	3963	16	31	\N
5359	918	3971	18	37	\N
5360	918	3941	7	6	\N
5361	918	3961	37	25	\N
5362	919	3939	38	36	\N
5363	919	3964	24	26	\N
5364	919	5203	3	16	\N
5365	919	3933	28	23	\N
5366	919	3958	27	3	\N
5367	919	3937	4	26	\N
5368	928	4302	17	6	\N
5369	928	5488	35	15	\N
5370	928	5574	5	30	\N
5371	928	4454	2	2	\N
5372	928	5596	23	34	\N
5373	928	4490	10	27	\N
5374	928	5007	22	4	\N
5375	928	4317	10	32	\N
5376	928	4259	24	17	\N
5377	929	5570	8	8	\N
5378	929	5486	4	19	\N
5379	929	5184	29	15	\N
5380	929	5085	37	29	\N
5381	929	4283	32	27	\N
5382	929	5083	21	28	\N
5383	929	5611	9	19	\N
5384	929	4739	13	29	\N
5385	929	4588	10	17	\N
5386	930	4458	33	34	\N
5387	930	4242	36	4	\N
5388	930	3989	36	11	\N
5389	930	4755	34	6	\N
5390	930	5217	7	33	\N
5391	930	4605	34	38	\N
5392	930	5496	13	7	\N
5393	930	4276	14	23	\N
5394	930	4607	32	18	\N
5395	931	4199	20	11	\N
5396	931	4487	13	9	\N
5397	931	4499	27	22	\N
5398	931	4236	22	30	\N
5399	931	5573	24	26	\N
5400	931	4786	1	12	\N
5401	931	5267	26	19	\N
5402	931	4273	39	32	\N
5403	931	4209	9	27	\N
5404	920	4639	29	4	\N
5405	920	4608	28	24	\N
5406	920	4021	23	15	\N
5407	920	5027	6	6	\N
5408	920	5599	17	27	\N
5409	920	4049	31	33	\N
5410	920	4300	40	21	\N
5411	920	4223	2	5	\N
5412	920	4036	11	25	\N
5413	932	4040	12	2	\N
5414	932	5275	39	9	\N
5415	932	4320	29	9	\N
5416	932	5205	17	7	\N
5417	932	4003	4	35	\N
5418	932	5463	15	22	\N
5419	932	5462	38	3	\N
5420	932	4481	8	4	\N
5421	932	5276	28	36	\N
5422	921	4288	16	30	\N
5423	921	4287	6	14	\N
5424	921	5049	15	15	\N
5425	921	5223	22	36	\N
5426	921	4627	11	17	\N
5427	921	4218	15	20	\N
5428	921	3863	39	11	\N
5429	921	5500	15	30	\N
5430	921	5076	22	11	\N
5431	933	5504	20	1	\N
5432	933	5484	21	13	\N
5433	933	4779	37	17	\N
5434	933	4754	37	24	\N
5435	933	4227	24	18	\N
5436	933	5079	37	17	\N
5437	933	5589	40	27	\N
5438	933	5167	6	37	\N
5439	933	4011	25	14	\N
5440	934	4966	7	14	\N
5441	934	5586	29	32	\N
5442	934	5198	11	34	\N
5443	934	4231	27	4	\N
5444	934	4255	8	20	\N
5445	934	3959	24	29	\N
5446	934	5503	19	28	\N
5447	934	5178	26	33	\N
5448	934	5609	26	39	\N
5449	922	5481	26	13	\N
5450	922	4007	18	29	\N
5451	922	5188	34	20	\N
5452	922	4285	38	31	\N
5453	922	5613	23	1	\N
5454	922	4777	36	30	\N
5455	922	4321	2	8	\N
5456	922	4440	18	3	\N
5457	922	4254	3	8	\N
5458	935	4585	5	20	\N
5459	935	5489	1	6	\N
5460	935	5572	16	17	\N
5461	935	5602	27	21	\N
5462	935	5585	4	30	\N
5463	935	4219	35	33	\N
5464	935	4293	30	40	\N
5465	935	3977	20	14	\N
5466	935	4761	19	15	\N
5467	936	5468	35	26	\N
5468	936	4758	16	14	\N
5469	936	4005	23	19	\N
5470	936	4332	3	8	\N
5471	936	5593	39	33	\N
5472	936	4783	27	21	\N
5473	936	4914	21	32	\N
5474	936	5186	27	34	\N
5475	936	4244	28	17	\N
5476	923	3968	38	31	\N
5477	923	3985	12	29	\N
5478	923	5568	28	8	\N
5479	923	4268	19	29	\N
5480	923	4476	38	29	\N
5481	923	3998	19	40	\N
5482	923	4935	16	17	\N
5483	923	5571	10	22	\N
5484	923	4286	29	5	\N
5485	937	4256	30	9	\N
5486	937	4924	33	23	\N
5487	937	5226	33	22	\N
5488	937	3945	12	12	\N
5489	937	5562	29	12	\N
5490	937	4770	39	25	\N
5491	937	5487	5	10	\N
5492	937	4782	10	6	\N
5493	937	5189	22	24	\N
5494	938	3999	23	26	\N
5495	938	5464	24	14	\N
5496	938	4472	1	38	\N
5497	938	3943	36	36	\N
5498	938	5576	16	29	\N
5499	938	4025	39	17	\N
5500	938	5615	25	38	\N
5501	938	4749	35	15	\N
5502	938	4010	1	16	\N
5503	939	5569	22	37	\N
5504	939	3866	1	25	\N
5505	939	5078	27	23	\N
5506	939	5465	19	10	\N
5507	939	5075	15	17	\N
5508	939	4214	2	37	\N
5509	939	5560	23	8	\N
5510	939	4019	36	7	\N
5511	939	4295	29	35	\N
5512	924	4271	17	11	\N
5513	924	5494	14	16	\N
5514	924	5471	5	4	\N
5515	924	5183	26	28	\N
5516	924	4253	24	39	\N
5517	924	4225	21	39	\N
5518	924	5469	34	37	\N
5519	924	3986	14	30	\N
5520	924	5171	14	37	\N
5521	940	4787	15	39	\N
5522	940	3980	23	6	\N
5523	940	5605	40	40	\N
5524	940	3911	30	14	\N
5525	940	5578	4	4	\N
5526	940	4206	20	38	\N
5527	940	4243	27	13	\N
5528	940	5588	5	6	\N
5529	940	4035	17	35	\N
5530	941	4762	38	12	\N
5531	941	5616	11	28	\N
5532	941	4595	38	23	\N
5533	941	4240	16	24	\N
5534	941	4752	18	12	\N
5535	941	5590	11	36	\N
5536	941	4220	22	32	\N
5537	941	5584	31	13	\N
5538	941	5046	4	33	\N
5539	925	4587	40	38	\N
5540	925	4258	39	32	\N
5541	925	5575	23	28	\N
5542	925	4297	24	1	\N
5543	925	4918	38	24	\N
5544	925	4280	1	11	\N
5545	925	4030	36	31	\N
5546	925	4928	37	3	\N
5547	925	5587	15	31	\N
5548	942	4289	13	39	\N
5549	942	4486	18	24	\N
5550	942	5456	32	14	\N
5551	942	4478	37	33	\N
5552	942	4260	22	18	\N
5553	942	4324	33	29	\N
5554	942	5177	15	5	\N
5555	942	4192	24	36	\N
5556	942	4264	24	22	\N
5557	926	4226	36	13	\N
5558	926	4318	39	32	\N
5559	926	3797	34	37	\N
5560	926	5563	26	40	\N
5561	926	3954	31	36	\N
5562	926	4213	27	7	\N
5563	926	3975	32	33	\N
5564	926	5565	5	22	\N
5565	926	5151	26	7	\N
5566	943	3996	30	39	\N
5567	943	4215	39	29	\N
5568	943	3987	9	26	\N
5569	943	4006	25	35	\N
5570	943	5187	39	7	\N
5571	943	4265	27	14	\N
5572	943	3864	29	35	\N
5573	943	5200	36	1	\N
5574	943	4263	40	15	\N
5575	944	4908	28	39	\N
5576	944	5498	37	34	\N
5577	944	4207	35	37	\N
5578	944	5566	27	10	\N
5579	944	4237	24	37	\N
5580	944	5614	24	26	\N
5581	944	4027	30	33	\N
5582	944	5603	10	40	\N
5583	944	4261	16	19	\N
5584	927	4501	19	21	\N
5585	927	5477	23	31	\N
5586	927	5054	28	33	\N
5587	927	4251	36	28	\N
5588	927	3991	5	16	\N
5589	927	4267	11	40	\N
5590	927	5176	25	37	\N
5591	927	5595	16	3	\N
5592	927	4581	30	32	\N
5593	945	4012	5	27	\N
5594	945	5600	26	30	\N
5595	945	5179	38	6	\N
5596	945	4299	21	2	\N
5597	945	4483	27	7	\N
5598	945	3995	34	7	\N
5599	945	4016	26	26	\N
5600	945	4497	40	33	\N
5601	945	5219	4	38	\N
5602	946	4024	31	3	\N
5603	946	4313	26	21	\N
5604	946	4441	34	12	\N
5605	946	4020	3	12	\N
5606	946	5056	29	24	\N
5607	946	4505	27	27	\N
5608	946	5495	27	37	\N
5609	946	3997	6	11	\N
5610	946	4116	34	23	\N
5611	947	4270	17	7	\N
5612	947	4291	2	6	\N
5613	947	4032	32	7	\N
5614	947	4038	26	3	\N
5615	947	4187	12	14	\N
5616	947	4282	20	1	\N
5617	947	5088	21	5	\N
5618	947	4775	3	31	\N
5619	947	4042	3	20	\N
5620	948	5213	40	40	\N
5621	948	4023	14	40	\N
5622	948	4917	31	17	\N
5623	948	5199	34	31	\N
5624	948	4238	30	35	\N
5625	948	4635	31	24	\N
5626	948	4629	21	39	\N
5627	948	4013	19	3	\N
5628	948	5193	1	9	\N
5629	949	4274	20	23	\N
5630	949	5069	7	30	\N
5631	949	5561	8	39	\N
5632	949	4235	25	40	\N
5633	949	5483	30	29	\N
5634	949	5592	28	19	\N
5635	949	5030	35	20	\N
5636	949	5458	22	40	\N
5637	949	5214	16	27	\N
5638	950	4234	21	16	\N
5639	950	5607	21	21	\N
5640	950	4281	2	3	\N
5641	950	5086	11	35	\N
5642	950	5581	19	29	\N
5643	950	4044	33	17	\N
5644	950	5089	23	3	\N
5645	950	4303	16	11	\N
5646	950	5564	28	39	\N
5647	951	3902	30	21	\N
5648	951	4028	17	31	\N
5649	951	4330	26	11	\N
5650	951	5210	10	15	\N
5651	951	4597	26	28	\N
5652	951	4043	11	32	\N
5653	952	5068	30	33	\N
5654	952	4284	30	33	\N
5655	952	4941	18	18	\N
5656	952	3751	40	4	\N
5657	952	4252	10	14	\N
5658	952	4033	14	11	\N
5659	953	5604	30	13	\N
5660	953	5024	18	31	\N
5661	953	4246	37	39	\N
5662	953	5051	34	2	\N
5663	953	5460	8	15	\N
5664	953	3923	34	14	\N
5665	954	4630	31	17	\N
5666	954	4936	37	33	\N
5667	954	4224	2	30	\N
5668	954	4475	33	29	\N
5669	954	4461	5	40	\N
5670	954	4262	4	29	\N
5671	955	5480	8	5	\N
5672	955	5059	28	28	\N
5673	955	4439	15	37	\N
5674	955	5582	30	18	\N
5675	955	4628	38	38	\N
5676	955	4954	1	35	\N
5677	956	3990	9	2	\N
5678	956	4599	10	12	\N
5679	956	5266	4	8	\N
5680	956	5598	21	12	\N
5681	956	5591	12	13	\N
5682	956	4479	8	20	\N
5683	968	3976	9	27	\N
5684	968	4449	34	22	\N
5685	968	4294	2	25	\N
5686	968	5066	19	23	\N
5687	968	4473	24	8	\N
5688	968	5175	40	23	\N
5689	967	5044	8	16	\N
5690	967	5052	31	21	\N
5691	967	5170	29	4	\N
5692	967	4216	16	18	\N
5693	967	5597	26	34	\N
5694	967	5173	33	5	\N
5695	961	4463	12	29	\N
5696	961	5612	2	11	\N
5697	961	4594	28	20	\N
5698	961	5505	13	27	\N
5699	961	5174	40	40	\N
5700	961	5077	25	26	\N
5701	965	5467	29	2	\N
5702	965	4492	33	1	\N
5703	965	4229	19	34	\N
5704	965	4601	25	37	\N
5705	965	4026	15	12	\N
5706	965	3994	4	38	\N
5707	959	4465	10	29	\N
5708	959	4736	16	32	\N
5709	959	4296	29	20	\N
5710	959	5028	12	40	\N
5711	959	4275	25	20	\N
5712	959	5180	16	36	\N
5713	960	5081	7	36	\N
5714	960	5472	10	35	\N
5715	960	4498	28	19	\N
5716	960	3979	14	3	\N
5717	960	4217	15	32	\N
5718	960	4614	23	39	\N
5719	963	4221	6	17	\N
5720	963	5072	37	19	\N
5721	963	4932	29	12	\N
5722	963	4334	32	5	\N
5723	963	5026	27	34	\N
5724	963	5271	20	23	\N
5725	964	4744	2	13	\N
5726	964	4748	26	37	\N
5727	964	5227	19	24	\N
5728	964	4315	26	20	\N
5729	964	3908	37	23	\N
5730	964	4444	13	22	\N
5731	970	5053	5	10	\N
5732	970	5406	19	38	\N
5733	970	5048	6	1	\N
5734	970	3992	22	21	\N
5735	970	5192	27	11	\N
5736	970	5476	22	1	\N
5737	957	4621	18	6	\N
5738	957	4257	2	31	\N
5739	957	3796	23	38	\N
5740	957	4014	4	23	\N
5741	957	5070	24	39	\N
5742	957	5045	33	26	\N
5743	966	4484	2	24	\N
5744	966	3949	32	28	\N
5745	966	5222	28	8	\N
5746	966	4001	38	2	\N
5747	966	4041	39	27	\N
5748	966	5270	12	31	\N
5749	958	4208	14	2	\N
5750	958	4009	17	6	\N
5751	958	5060	10	39	\N
5752	958	5220	33	6	\N
5753	958	5057	31	39	\N
5754	958	4734	5	19	\N
5755	962	3921	8	26	\N
5756	962	5212	2	2	\N
5757	962	4278	11	31	\N
5758	962	4290	18	7	\N
5759	962	4047	11	12	\N
5760	962	4592	27	30	\N
5761	969	4037	15	8	\N
5762	969	5268	9	7	\N
5763	969	4239	9	30	\N
5764	969	4603	1	18	\N
5765	969	5478	33	38	\N
5766	969	4002	6	30	\N
5767	971	5323	22	10	\N
5768	971	5318	8	36	\N
5769	971	5340	30	16	\N
5770	971	5319	17	35	\N
5771	971	5362	40	37	\N
5772	971	5348	4	23	\N
5773	972	3767	23	15	\N
5774	972	5312	20	15	\N
5775	972	5359	25	37	\N
5776	972	5352	10	15	\N
5777	972	5321	11	16	\N
5778	972	5317	1	26	\N
5779	973	3791	24	37	\N
5780	973	3794	1	22	\N
5781	973	5360	32	13	\N
5782	973	5356	38	4	\N
5783	973	5313	11	3	\N
5784	973	5354	12	23	\N
5785	974	3842	28	31	\N
5786	974	4494	3	26	\N
5787	974	4937	27	30	\N
5788	974	5620	11	22	\N
5789	974	5270	20	5	\N
5790	974	5621	6	18	\N
5791	975	4590	26	28	\N
5792	975	5084	10	39	\N
5793	975	4916	39	34	\N
5794	975	4774	2	28	\N
5795	975	4613	3	13	\N
5796	975	5622	37	15	\N
5797	976	4756	16	31	\N
5798	976	4455	7	33	\N
5799	976	4788	3	38	\N
5800	976	4743	19	38	\N
5801	976	4759	14	26	\N
5802	976	4315	38	23	\N
5803	977	4919	4	25	\N
5804	977	4457	28	15	\N
5805	977	4930	19	15	\N
5806	977	4853	21	20	\N
5807	977	5178	7	11	\N
5808	977	4910	8	37	\N
5809	978	4450	20	30	\N
5810	978	4778	40	30	\N
5811	978	4750	21	12	\N
5812	978	4740	13	20	\N
5813	978	4747	10	18	\N
5814	978	5623	29	36	\N
5815	979	4751	32	11	\N
5816	979	3845	20	20	\N
5817	979	4330	30	34	\N
5818	979	4921	38	27	\N
5819	979	4814	25	14	\N
5820	979	3809	19	11	\N
5821	980	3948	34	32	\N
5822	980	5207	38	1	\N
5823	980	4926	16	28	\N
5824	980	4766	24	1	\N
5825	980	4591	24	6	\N
5826	980	4923	36	26	\N
5827	981	5202	36	9	\N
5828	981	5087	20	37	\N
5829	981	4929	31	14	\N
5830	981	5181	27	11	\N
5831	981	4776	9	16	\N
5832	981	4614	20	2	\N
5833	986	4767	7	11	\N
5834	986	4922	14	31	\N
5835	986	4687	38	36	\N
5836	986	4772	31	21	\N
5837	986	4690	26	12	\N
5838	986	5031	14	4	\N
5839	982	4934	22	14	\N
5840	982	4931	4	14	\N
5841	982	4760	32	25	\N
5842	982	4780	4	6	\N
5843	982	4769	25	39	\N
5844	982	4746	24	33	\N
5845	983	5386	25	38	\N
5846	983	5384	24	12	\N
5847	983	4764	7	40	\N
5848	983	4439	25	9	\N
5849	983	3981	25	33	\N
5850	983	4589	1	8	\N
5851	984	3848	3	2	\N
5852	984	3808	27	22	\N
5853	984	3815	29	10	\N
5854	984	4231	1	14	\N
5855	984	3810	13	16	\N
5856	984	3840	29	1	\N
5857	985	4688	20	4	\N
5858	985	4737	24	33	\N
5859	985	4691	19	28	\N
5860	985	4438	26	5	\N
5861	985	4699	22	38	\N
5862	985	4696	25	6	\N
5863	989	3924	15	36	\N
5864	989	4598	23	16	\N
5865	989	4482	24	4	\N
5866	989	3930	26	22	\N
5867	989	5185	33	34	\N
5868	989	3965	20	16	\N
5869	990	4906	39	33	\N
5870	990	4784	25	3	\N
5871	990	4473	21	2	\N
5872	990	4618	2	9	\N
5873	990	4938	13	37	\N
5874	990	4508	24	3	\N
5875	987	4600	39	40	\N
5876	987	4462	31	17	\N
5877	987	4477	17	3	\N
5878	987	4632	5	7	\N
5879	987	4224	29	14	\N
5880	987	4619	32	3	\N
5881	988	4765	18	27	\N
5882	988	3844	25	37	\N
5883	988	3811	12	26	\N
5884	988	5280	24	6	\N
5885	988	4500	8	12	\N
5886	988	4773	31	3	\N
5887	991	4617	26	37	\N
5888	991	4573	8	21	\N
5889	991	5446	23	17	\N
5890	991	4682	40	20	\N
5891	991	5630	34	18	\N
5892	991	4645	9	40	\N
5893	992	4507	25	29	\N
5894	992	4495	10	40	\N
5895	992	4489	16	15	\N
5896	992	5634	18	7	\N
5897	992	5635	24	21	\N
5898	992	5636	33	11	\N
5899	993	4504	37	13	\N
5900	993	4602	3	21	\N
5901	993	4623	36	40	\N
5902	993	4689	29	32	\N
5903	993	5633	29	29	\N
5904	993	5632	34	7	\N
5905	994	4456	38	13	\N
5906	994	4470	13	27	\N
5907	994	4593	37	34	\N
5908	994	4479	29	5	\N
5909	994	5631	36	20	\N
5910	994	4630	26	18	\N
5911	995	4578	40	1	\N
5912	995	4528	36	32	\N
5913	995	4460	17	12	\N
5914	995	4601	12	23	\N
5915	995	4493	7	7	\N
5916	995	5637	20	32	\N
5917	996	5073	35	26	\N
5918	996	5067	29	36	\N
5919	996	5451	39	35	\N
5920	996	5080	26	39	\N
5921	996	4405	12	35	\N
5922	996	5638	28	33	\N
5923	997	4506	9	35	\N
5924	997	5449	5	40	\N
5925	997	4471	22	15	\N
5926	997	5090	27	19	\N
5927	997	5639	23	29	\N
5928	997	3748	38	33	\N
5929	998	5478	31	8	\N
5930	998	5172	12	6	\N
5931	998	5501	13	33	\N
5932	998	5190	36	22	\N
5933	998	5055	18	16	\N
5934	998	3942	28	16	\N
5935	999	5071	3	6	\N
5936	999	5206	18	28	\N
5937	999	5411	29	40	\N
5938	999	5640	34	36	\N
5939	999	4584	38	4	\N
5940	999	5047	6	34	\N
5941	1000	4210	12	26	\N
5942	1000	3936	12	26	\N
5943	1000	3869	28	33	\N
5944	1000	5448	14	39	\N
5945	1000	5641	16	33	\N
5946	1000	5642	13	33	\N
5947	1001	5201	29	8	\N
5948	1001	5209	23	28	\N
5949	1001	5182	33	17	\N
5950	1001	4610	23	7	\N
5951	1001	5083	2	35	\N
5952	1001	5442	6	5	\N
5953	1005	5016	19	4	\N
5954	1005	4468	33	29	\N
5955	1005	4461	22	3	\N
5956	1005	5015	30	1	\N
5957	1005	4965	39	20	\N
5958	1005	5619	10	10	\N
5959	1003	4958	27	29	\N
5960	1003	4428	39	16	\N
5961	1003	4329	40	36	\N
5962	1003	4445	20	31	\N
5963	1003	4442	10	7	\N
5964	1003	5644	2	19	\N
5965	1002	4308	1	15	\N
5966	1002	4692	28	24	\N
5967	1002	4962	35	21	\N
5968	1002	4351	11	9	\N
5969	1002	4328	15	17	\N
5970	1002	5647	3	15	\N
5971	1004	5019	18	17	\N
5972	1004	4939	1	36	\N
5973	1004	4322	5	15	\N
5974	1004	4466	15	35	\N
5975	1004	5643	38	20	\N
5976	1004	4705	34	28	\N
5977	1006	4952	18	28	\N
5978	1006	4311	38	13	\N
5979	1006	4446	2	16	\N
5980	1006	4310	32	26	\N
5981	1006	5645	28	9	\N
5982	1006	4413	10	37	\N
5983	1007	4947	24	28	\N
5984	1007	5062	29	30	\N
5985	1007	4465	37	37	\N
5986	1007	4949	14	20	\N
5987	1007	5601	16	18	\N
5988	1007	5646	34	6	\N
5989	1008	5032	14	4	\N
5990	1008	4948	1	27	\N
5991	1008	5033	29	3	\N
5992	1008	4951	16	12	\N
5993	1008	4319	16	39	\N
5994	1008	4671	4	17	\N
5995	1011	3906	19	13	\N
5996	1011	3855	34	6	\N
5997	1011	3856	18	37	\N
5998	1011	3857	20	40	\N
5999	1011	3896	10	14	\N
6000	1011	5058	27	19	\N
6001	1013	3905	39	15	\N
6002	1013	3913	23	14	\N
6003	1013	3853	35	24	\N
6004	1013	4459	21	12	\N
6005	1013	5648	6	39	\N
6006	1013	3865	15	3	\N
6007	1014	3917	22	36	\N
6008	1014	3916	26	32	\N
6009	1014	3854	22	13	\N
6010	1014	5413	13	22	\N
6011	1014	4620	3	19	\N
6012	1014	4745	22	23	\N
6013	1012	5355	1	4	\N
6014	1012	3867	29	28	\N
6015	1012	5649	39	34	\N
6016	1012	5326	29	22	\N
6017	1012	3859	36	10	\N
6018	1012	5395	30	38	\N
6019	1009	3947	40	30	\N
6020	1009	3909	11	37	\N
6021	1009	4703	34	12	\N
6022	1009	3861	5	40	\N
6023	1009	3901	7	36	\N
6024	1009	3918	7	2	\N
6025	1010	3910	38	7	\N
6026	1010	3955	30	19	\N
6027	1010	3914	31	3	\N
6028	1010	3907	1	17	\N
6029	1010	5502	25	40	\N
6030	1010	5610	2	17	\N
6031	1015	4667	21	34	\N
6032	1015	4670	27	33	\N
6033	1015	4668	3	3	\N
6034	1015	4636	30	24	\N
6035	1015	4675	2	38	\N
6036	1015	4633	18	1	\N
6037	1016	4679	38	37	\N
6038	1016	4638	8	40	\N
6039	1016	4634	37	21	\N
6040	1016	4681	38	21	\N
6041	1016	4680	6	26	\N
6042	1016	4686	15	21	\N
6043	1017	4644	19	36	\N
6044	1017	4637	8	23	\N
6045	1017	4684	27	1	\N
6046	1017	4674	16	25	\N
6047	1017	4646	18	35	\N
6048	1017	4611	25	26	\N
6049	1018	3803	40	7	\N
6050	1018	5453	16	24	\N
6051	1018	3804	24	15	\N
6052	1018	3750	32	10	\N
6053	1018	3755	9	38	\N
6054	1018	5497	20	10	\N
6055	1019	3758	40	36	\N
6056	1019	5064	6	35	\N
6057	1019	5320	25	11	\N
6058	1019	4326	16	35	\N
6059	1019	3953	17	11	\N
6060	1019	3960	23	9	\N
6061	1020	5401	35	9	\N
6062	1020	3765	33	13	\N
6063	1020	3799	33	5	\N
6064	1020	3752	36	9	\N
6065	1020	3783	35	21	\N
6066	1020	5324	14	35	\N
6067	1021	3805	31	10	\N
6068	1021	3759	32	12	\N
6069	1021	3754	20	5	\N
6070	1021	3753	13	25	\N
6071	1021	3806	25	5	\N
6072	1021	3798	22	38	\N
6073	1022	5325	40	21	\N
6074	1022	4004	16	15	\N
6075	1022	5353	23	27	\N
6076	1022	5349	4	14	\N
6077	1022	5316	25	32	\N
6078	1022	4266	13	13	\N
6079	1023	5653	30	28	\N
6080	1023	3756	6	2	\N
6081	1023	3802	6	5	\N
6082	1023	3790	7	24	\N
6083	1023	3792	10	1	\N
6084	1023	3764	7	14	\N
6085	1024	5265	16	25	\N
6086	1024	5273	33	20	\N
6087	1024	5231	25	5	\N
6088	1024	5227	18	21	\N
6089	1024	5406	24	26	\N
6090	1024	4335	40	4	\N
6091	1025	4609	16	17	\N
6092	1025	5278	10	32	\N
6093	1025	5082	20	3	\N
6094	1025	5263	19	9	\N
6095	1025	4673	11	18	\N
6096	1025	5655	26	3	\N
6097	1026	5459	14	26	\N
6098	1026	5230	22	15	\N
6099	1026	4469	8	40	\N
6100	1026	5361	28	1	\N
6101	1026	5242	11	3	\N
6102	1026	5269	11	24	\N
6103	1027	5169	8	5	\N
6104	1027	5216	9	4	\N
6105	1027	5262	7	2	\N
6106	1027	5654	36	21	\N
6107	1027	5074	26	27	\N
6108	1027	4491	24	26	\N
6109	1029	4615	26	7	\N
6110	1029	3800	2	21	\N
6111	1029	5506	9	14	\N
6112	1029	4683	2	8	\N
6113	1029	5225	31	21	\N
6114	1029	4697	1	34	\N
6115	1028	5229	37	1	\N
6116	1028	4433	28	14	\N
6117	1028	5322	6	33	\N
6118	1028	4298	31	29	\N
6119	1028	5272	4	28	\N
6120	1028	5215	9	26	\N
6121	1030	5224	9	7	\N
6122	1030	5065	16	27	\N
6123	1030	5218	1	26	\N
6124	1030	5264	14	10	\N
6125	1030	4624	2	39	\N
6126	1030	5048	16	31	\N
6127	1031	5454	33	11	\N
6128	1031	5429	29	14	\N
6129	1031	5404	22	11	\N
6130	1031	5389	10	34	\N
6131	1031	5444	28	12	\N
6132	1031	5656	38	33	\N
6133	1032	5390	18	14	\N
6134	1032	5398	10	25	\N
6135	1032	4695	39	29	\N
6136	1032	5455	36	22	\N
6137	1032	5414	1	14	\N
6138	1032	5400	38	33	\N
6139	1033	5397	5	28	\N
6140	1033	5408	3	11	\N
6141	1033	5437	16	12	\N
6142	1033	5392	14	22	\N
6143	1033	5452	13	6	\N
6144	1033	5443	3	21	\N
6145	1034	4955	32	5	\N
6146	1034	5029	1	9	\N
6147	1034	4940	27	36	\N
6148	1034	5001	12	21	\N
6149	1034	4945	32	28	\N
6150	1034	5035	38	25	\N
6151	1035	5042	6	3	\N
6152	1035	5040	33	9	\N
6153	1035	5038	8	24	\N
6154	1035	5657	5	33	\N
6155	1035	5022	30	2	\N
6156	1035	4961	36	31	\N
6157	1036	5018	24	19	\N
6158	1036	4738	12	1	\N
6159	1036	4314	21	39	\N
6160	1036	4230	10	18	\N
6161	1036	4946	19	25	\N
6162	1036	4967	34	14	\N
6163	1037	5347	35	6	\N
6164	1037	5036	10	27	\N
6165	1037	5043	21	7	\N
6166	1037	4964	9	17	\N
6167	1037	5023	10	35	\N
6168	1037	5005	40	26	\N
6169	1038	3838	15	29	\N
6170	1038	3839	38	25	\N
6171	1038	3816	18	19	\N
6172	1038	4959	33	26	\N
6173	1038	5658	18	27	\N
6174	1038	5659	3	9	\N
6175	1039	4693	38	25	\N
6176	1039	4733	9	1	\N
6177	1039	4704	6	11	\N
6178	1039	5363	4	20	\N
6179	1039	4702	16	22	\N
6180	1039	4700	31	37	\N
6181	1040	5367	7	17	\N
6182	1040	5370	2	40	\N
6183	1040	5368	18	23	\N
6184	1040	5372	31	29	\N
6185	1040	5660	22	11	\N
6186	1040	3817	38	28	\N
6187	1041	5287	25	6	\N
6188	1041	5307	3	17	\N
6189	1041	5281	23	5	\N
6190	1041	5282	25	8	\N
6191	1041	5286	18	2	\N
6192	1041	5285	20	10	\N
6193	1042	3843	10	29	\N
6194	1042	3841	28	31	\N
6195	1042	4735	14	28	\N
6196	1042	5305	18	17	\N
6197	1042	5661	32	17	\N
6198	1042	5662	14	15	\N
6199	1043	3972	8	17	\N
6200	1043	3932	13	40	\N
6201	1043	3925	22	38	\N
6202	1043	3944	27	10	\N
6203	1043	3928	26	38	\N
6204	1043	3931	11	9	\N
6205	1044	3956	6	26	\N
6206	1044	3971	36	26	\N
6207	1044	3961	12	27	\N
6208	1044	4279	12	36	\N
6209	1044	4757	23	11	\N
6210	1044	5663	1	13	\N
6211	1045	3957	12	36	\N
6212	1045	5664	5	22	\N
6213	1045	3963	6	27	\N
6214	1045	3964	18	10	\N
6215	1045	3933	22	2	\N
6216	1045	3937	8	2	\N
6217	1055	5570	14	33	\N
6218	1055	5486	37	5	\N
6219	1055	5184	40	6	\N
6220	1055	5085	31	10	\N
6221	1055	4283	4	25	\N
6222	1055	5611	15	14	\N
6223	1055	4739	36	23	\N
6224	1055	4588	34	35	\N
6225	1056	4458	36	20	\N
6226	1056	4242	25	28	\N
6227	1056	4755	30	8	\N
6228	1056	5217	32	16	\N
6229	1056	4605	13	23	\N
6230	1056	4276	32	28	\N
6231	1056	4607	10	11	\N
6232	1056	4481	33	38	\N
6233	1056	5504	2	19	\N
6234	1057	4499	10	24	\N
6235	1057	4487	10	31	\N
6236	1057	4236	1	18	\N
6237	1057	4786	19	26	\N
6238	1057	4273	2	10	\N
6239	1057	4209	9	24	\N
6240	1057	4928	11	20	\N
6241	1057	5068	28	38	\N
6242	1057	4628	4	17	\N
6243	1046	4639	11	31	\N
6244	1046	4608	7	9	\N
6245	1046	4021	20	36	\N
6246	1046	5027	10	4	\N
6247	1046	4049	6	1	\N
6248	1046	4300	23	28	\N
6249	1046	4223	8	27	\N
6250	1046	4036	17	4	\N
6251	1046	5212	21	1	\N
6252	1058	5463	31	36	\N
6253	1058	4040	5	14	\N
6254	1058	5275	4	27	\N
6255	1058	4320	1	14	\N
6256	1058	5205	16	1	\N
6257	1058	5276	3	22	\N
6258	1058	4016	12	5	\N
6259	1058	5669	11	28	\N
6260	1058	5670	24	4	\N
6261	1047	4762	31	16	\N
6262	1047	5671	6	11	\N
6263	1047	3863	3	6	\N
6264	1047	4287	20	38	\N
6265	1047	4627	3	17	\N
6266	1047	4218	28	18	\N
6267	1047	5500	3	11	\N
6268	1047	4288	36	1	\N
6269	1047	5076	24	3	\N
6270	1059	5079	2	10	\N
6271	1059	4779	8	25	\N
6272	1059	5589	16	4	\N
6273	1059	5167	15	22	\N
6274	1059	4011	19	10	\N
6275	1059	5576	1	34	\N
6276	1059	4221	23	16	\N
6277	1059	4918	2	32	\N
6278	1059	4503	14	4	\N
6279	1060	5198	33	39	\N
6280	1060	4255	39	33	\N
6281	1060	3959	13	35	\N
6282	1060	5503	31	40	\N
6283	1060	5609	26	32	\N
6284	1060	5586	2	1	\N
6285	1060	5060	21	40	\N
6286	1060	4935	10	10	\N
6287	1060	4787	6	24	\N
6288	1048	4007	34	31	\N
6289	1048	5613	10	40	\N
6290	1048	4777	25	22	\N
6291	1048	5481	13	26	\N
6292	1048	4440	23	8	\N
6293	1048	4254	40	1	\N
6294	1048	5495	13	29	\N
6295	1048	5464	3	13	\N
6296	1048	4294	6	17	\N
6297	1061	5489	15	18	\N
6298	1061	5572	11	37	\N
6299	1061	5602	34	25	\N
6300	1061	4219	11	15	\N
6301	1061	4293	32	19	\N
6302	1061	3977	28	22	\N
6303	1061	4761	36	34	\N
6304	1061	4001	40	18	\N
6305	1061	5051	8	37	\N
6306	1062	4332	26	9	\N
6307	1062	5593	12	27	\N
6308	1062	5468	24	16	\N
6309	1062	4758	40	27	\N
6310	1062	4005	37	29	\N
6311	1062	4783	31	30	\N
6312	1062	4914	21	31	\N
6313	1062	5186	29	17	\N
6314	1062	4244	27	24	\N
6315	1049	4268	8	2	\N
6316	1049	4476	23	11	\N
6317	1049	3998	26	11	\N
6318	1049	5571	6	28	\N
6319	1049	4286	38	29	\N
6320	1049	3968	12	6	\N
6321	1049	5044	20	28	\N
6322	1049	4220	27	21	\N
6323	1049	4192	8	2	\N
6324	1063	4256	10	4	\N
6325	1063	4924	40	40	\N
6326	1063	5562	13	16	\N
6327	1063	4770	33	16	\N
6328	1063	5487	18	34	\N
6329	1063	4782	33	8	\N
6330	1063	5189	36	4	\N
6331	1063	4321	26	10	\N
6332	1063	4908	12	24	\N
6333	1064	4257	6	20	\N
6334	1064	3999	10	39	\N
6335	1064	4472	6	14	\N
6336	1064	3943	6	33	\N
6337	1064	4025	8	21	\N
6338	1064	5615	8	21	\N
6339	1064	4749	1	18	\N
6340	1064	5223	4	35	\N
6341	1064	4014	18	1	\N
6342	1065	4229	0	0	\N
6343	1065	5569	27	5	\N
6344	1065	5078	40	28	\N
6345	1065	5465	15	4	\N
6346	1065	5075	4	9	\N
6347	1065	4214	39	19	\N
6348	1065	5560	21	26	\N
6349	1065	4295	40	19	\N
6350	1065	5081	15	15	\N
6351	1050	5494	24	10	\N
6352	1050	5471	26	31	\N
6353	1050	5183	20	26	\N
6354	1050	4225	38	23	\N
6355	1050	4271	12	27	\N
6356	1050	5469	3	40	\N
6357	1050	3986	7	20	\N
6358	1050	5171	1	34	\N
6359	1050	5467	29	13	\N
6360	1066	5715	0	0	\N
6361	1066	5605	40	30	\N
6362	1066	5578	27	12	\N
6363	1066	4206	7	24	\N
6364	1066	4243	6	28	\N
6365	1066	5588	37	7	\N
6366	1066	4035	31	17	\N
6367	1066	5476	6	11	\N
6368	1066	4327	16	40	\N
6369	1067	4595	5	5	\N
6370	1067	4240	7	6	\N
6371	1067	4752	13	23	\N
6372	1067	5584	12	31	\N
6373	1067	5046	11	3	\N
6374	1067	3921	2	39	\N
6375	1067	5665	7	25	\N
6376	1067	4505	30	11	\N
6377	1067	3985	11	16	\N
6378	1051	4587	32	7	\N
6379	1051	5575	4	36	\N
6380	1051	4297	12	2	\N
6381	1051	4280	9	17	\N
6382	1051	4030	29	19	\N
6383	1051	5587	27	28	\N
6384	1051	4484	33	34	\N
6385	1051	3949	22	9	\N
6386	1051	4641	36	40	\N
6387	1068	4289	14	28	\N
6388	1068	4486	10	8	\N
6389	1068	4478	24	3	\N
6390	1068	4260	29	9	\N
6391	1068	4324	26	15	\N
6392	1068	5177	36	2	\N
6393	1068	4264	10	15	\N
6394	1068	4019	22	21	\N
6395	1068	4475	38	33	\N
6396	1052	4226	16	15	\N
6397	1052	4318	30	39	\N
6398	1052	5563	15	8	\N
6399	1052	3954	22	31	\N
6400	1052	3975	8	23	\N
6401	1052	5565	8	2	\N
6402	1052	3976	30	32	\N
6403	1052	5666	30	16	\N
6404	1052	4006	10	40	\N
6405	1069	5187	1	15	\N
6406	1069	3864	17	22	\N
6407	1069	3996	21	4	\N
6408	1069	5200	13	13	\N
6409	1069	4263	32	17	\N
6410	1069	4253	9	13	\N
6411	1069	4213	4	10	\N
6412	1069	4629	32	24	\N
6413	1069	4216	10	30	\N
6414	1070	5566	6	5	\N
6415	1070	5614	26	3	\N
6416	1070	4027	19	31	\N
6417	1070	5603	31	18	\N
6418	1070	4261	33	32	\N
6419	1070	5180	23	30	\N
6420	1070	5668	32	22	\N
6421	1070	4238	8	21	\N
6422	1070	5667	7	33	\N
6423	1053	4501	18	26	\N
6424	1053	5477	38	29	\N
6425	1053	5054	30	40	\N
6426	1053	4251	4	3	\N
6427	1053	3991	12	36	\N
6428	1053	4267	39	4	\N
6429	1053	5176	37	6	\N
6430	1053	5595	1	28	\N
6431	1053	4581	14	15	\N
6432	1071	4299	3	40	\N
6433	1071	5600	37	26	\N
6434	1071	5179	16	12	\N
6435	1071	4483	20	34	\N
6436	1071	4012	13	37	\N
6437	1071	4497	15	28	\N
6438	1071	5219	7	20	\N
6439	1071	3866	17	2	\N
6440	1071	4258	28	10	\N
6441	1072	4313	3	2	\N
6442	1072	4441	31	30	\N
6443	1072	5056	1	13	\N
6444	1072	4024	36	13	\N
6445	1072	3997	27	39	\N
6446	1072	4116	3	28	\N
6447	1072	4028	4	28	\N
6448	1072	3979	27	30	\N
6449	1072	5220	35	38	\N
6450	1073	4038	36	39	\N
6451	1073	4270	9	8	\N
6452	1073	4291	20	19	\N
6453	1073	4032	5	39	\N
6454	1073	4282	25	10	\N
6455	1073	5088	40	1	\N
6456	1073	4775	28	13	\N
6457	1073	4042	39	1	\N
6458	1073	5496	20	9	\N
6459	1074	5213	15	33	\N
6460	1074	4023	24	24	\N
6461	1074	5199	27	7	\N
6462	1074	4635	12	11	\N
6463	1074	4013	8	31	\N
6464	1074	5193	2	29	\N
6465	1074	4010	5	6	\N
6466	1074	4037	12	33	\N
6467	1074	5268	34	7	\N
6468	1075	4003	0	0	\N
6469	1075	4235	22	4	\N
6470	1075	4274	10	12	\N
6471	1075	5069	23	17	\N
6472	1075	5561	8	8	\N
6473	1075	5592	12	20	\N
6474	1075	5458	16	39	\N
6475	1075	5214	16	39	\N
6476	1075	5585	16	36	\N
6477	1076	4234	8	1	\N
6478	1076	5607	21	1	\N
6479	1076	4281	19	2	\N
6480	1076	5581	28	27	\N
6481	1076	4044	1	6	\N
6482	1076	5089	33	25	\N
6483	1076	5564	29	14	\N
6484	1076	5049	16	27	\N
6485	1076	5460	13	37	\N
6495	1054	4302	17	36	\N
6496	1054	5488	35	9	\N
6497	1054	5574	38	14	\N
6498	1054	4454	18	5	\N
6499	1054	5596	13	28	\N
6500	1054	4490	28	24	\N
6501	1054	5007	23	24	\N
6502	1054	4317	38	17	\N
6503	1054	4259	36	29	\N
6504	1077	3902	4	6	\N
6505	1077	4597	39	12	\N
6506	1077	4002	18	35	\N
6507	1077	4603	39	19	\N
6508	1077	4701	25	3	\N
6509	1077	4047	37	28	\N
6510	1078	4941	20	22	\N
6511	1078	3751	27	22	\N
6512	1078	4622	14	6	\N
6513	1078	5484	37	2	\N
6514	1078	4754	1	25	\N
6515	1078	4303	9	34	\N
6516	1079	5604	11	2	\N
6517	1079	3923	32	7	\N
6518	1079	5086	7	32	\N
6519	1079	5591	6	22	\N
6520	1079	3969	40	9	\N
6521	1079	5267	18	32	\N
6522	1080	4262	37	29	\N
6523	1080	5061	3	33	\N
6524	1080	5024	16	31	\N
6525	1080	5675	5	26	\N
6526	1080	5210	19	21	\N
6527	1080	5456	20	37	\N
6528	1081	4246	11	29	\N
6529	1081	5568	8	19	\N
6530	1081	5053	9	37	\N
6531	1081	4583	34	38	\N
6532	1081	4502	5	11	\N
6533	1081	5271	37	36	\N
6534	1082	3990	25	35	\N
6535	1082	4599	34	21	\N
6536	1082	5598	9	14	\N
6537	1082	4492	10	11	\N
6538	1082	5462	10	24	\N
6539	1082	4043	19	14	\N
6540	1094	4449	10	14	\N
6541	1094	5480	34	20	\N
6542	1094	5677	13	24	\N
6543	1094	3992	12	32	\N
6544	1094	4217	32	23	\N
6545	1094	4285	40	24	\N
6546	1093	5052	18	12	\N
6547	1093	5170	2	4	\N
6548	1093	4215	30	34	\N
6549	1093	4736	9	4	\N
6550	1093	5266	33	11	\N
6551	1093	4771	31	24	\N
6552	1088	4463	39	25	\N
6553	1088	5612	38	5	\N
6554	1088	4594	7	7	\N
6555	1088	5077	23	19	\N
6556	1088	5028	24	12	\N
6557	1088	4275	40	20	\N
6558	1087	3994	14	36	\N
6559	1087	4187	30	23	\N
6560	1087	4927	8	4	\N
6561	1087	4296	12	26	\N
6562	1087	4596	27	37	\N
6563	1087	5066	3	29	\N
6564	1085	4284	11	20	\N
6565	1085	4966	18	12	\N
6566	1085	3987	32	5	\N
6567	1085	4265	4	21	\N
6568	1085	4586	35	35	\N
6569	1085	4207	37	4	\N
6570	1086	5472	2	32	\N
6571	1086	4488	18	8	\N
6572	1086	5173	5	4	\N
6573	1086	5672	9	27	\N
6574	1086	5050	8	37	\N
6575	1086	5188	38	15	\N
6576	1090	4932	20	37	\N
6577	1090	5072	38	5	\N
6578	1090	5498	32	14	\N
6579	1090	5674	12	8	\N
6580	1090	4227	23	6	\N
6581	1090	5174	23	31	\N
6582	1091	4748	31	2	\N
6583	1091	4444	13	28	\N
6584	1091	4020	25	9	\N
6585	1091	5226	33	17	\N
6586	1091	5030	19	2	\N
6587	1091	3945	13	17	\N
6588	1095	5211	22	24	\N
6589	1095	4498	31	36	\N
6590	1095	5678	33	36	\N
6591	1095	4936	8	6	\N
6592	1095	3911	32	26	\N
6593	1095	4917	19	14	\N
6594	1096	5192	12	8	\N
6595	1096	4585	7	38	\N
6596	1096	3989	1	39	\N
6597	1096	3988	5	6	\N
6598	1096	4026	2	2	\N
6599	1096	5616	25	30	\N
6600	1083	3796	25	26	\N
6601	1083	5070	26	25	\N
6602	1083	4621	12	35	\N
6603	1083	5573	22	6	\N
6604	1083	4334	17	8	\N
6605	1083	5057	15	13	\N
6606	1092	5222	20	26	\N
6607	1092	4041	37	31	\N
6608	1092	4742	5	7	\N
6609	1092	5676	18	21	\N
6610	1092	4954	17	5	\N
6611	1092	5026	3	13	\N
6612	1084	4208	1	5	\N
6613	1084	4734	22	9	\N
6614	1084	5599	17	27	\N
6615	1084	5175	40	11	\N
6616	1084	5590	10	29	\N
6617	1084	4033	12	1	\N
6618	1089	4278	21	11	\N
6619	1089	4592	15	34	\N
6620	1089	5673	26	9	\N
6621	1089	5483	9	5	\N
6622	1089	5597	21	38	\N
6623	1089	5059	10	32	\N
6624	1099	5362	1	39	\N
6625	1099	5340	30	33	\N
6626	1099	5319	25	11	\N
6627	1099	5203	31	25	\N
6628	1099	3801	34	4	\N
6629	1099	5354	19	27	\N
6630	1097	5359	23	38	\N
6631	1097	5352	40	12	\N
6632	1097	5321	13	37	\N
6633	1097	5306	5	6	\N
6634	1097	5360	35	25	\N
6635	1097	5650	34	5	\N
6636	1098	5356	24	14	\N
6637	1098	3794	38	14	\N
6638	1098	3749	29	22	\N
6639	1098	3763	2	8	\N
6640	1098	5651	32	4	\N
6641	1098	5652	35	1	\N
6642	1100	3767	23	5	\N
6643	1100	3789	14	27	\N
6644	1100	5317	30	1	\N
6645	1100	5323	40	26	\N
6646	1100	5348	28	15	\N
6647	1100	5313	15	8	\N
6648	1101	3842	4	5	\N
6649	1101	4494	38	30	\N
6650	1101	4937	37	2	\N
6651	1101	4908	18	34	\N
6652	1101	4462	9	28	\N
6653	1101	4772	25	5	\N
6654	1102	4774	29	12	\N
6655	1102	3866	26	32	\N
6656	1102	4632	35	7	\N
6657	1102	4766	20	11	\N
6658	1102	5622	26	10	\N
6659	1102	4598	30	21	\N
6660	1103	4756	36	6	\N
6661	1103	4455	23	32	\N
6662	1103	5178	2	35	\N
6663	1103	4315	21	20	\N
6664	1103	4500	37	23	\N
6665	1103	4765	10	12	\N
6666	1104	4923	33	20	\N
6667	1104	4931	16	26	\N
6668	1104	4962	20	9	\N
6669	1104	5388	16	7	\N
6670	1104	4771	10	9	\N
6671	1104	4613	11	2	\N
6672	1105	4450	29	18	\N
6673	1105	4778	34	25	\N
6674	1105	4750	5	20	\N
6675	1105	4917	9	3	\N
6676	1105	5623	1	29	\N
6677	1105	5684	14	5	\N
6678	1106	4751	13	30	\N
6679	1106	4916	40	25	\N
6680	1106	4814	32	36	\N
6681	1106	4460	6	30	\N
6682	1106	4773	9	3	\N
6683	1106	5685	21	31	\N
6684	1107	4591	34	39	\N
6685	1107	4926	13	26	\N
6686	1107	5637	11	36	\N
6687	1107	4629	26	13	\N
6688	1107	4689	24	25	\N
6689	1107	3844	37	17	\N
6690	1108	5202	19	17	\N
6691	1108	5087	15	1	\N
6692	1108	4929	12	3	\N
6693	1108	4776	40	30	\N
6694	1108	4619	37	39	\N
6695	1108	5680	40	31	\N
6696	1113	3948	30	17	\N
6697	1113	5082	2	17	\N
6698	1113	5031	1	29	\N
6699	1113	4767	28	40	\N
6700	1113	4687	17	25	\N
6701	1113	4614	29	15	\N
6702	1109	4780	29	23	\N
6703	1109	4784	10	37	\N
6704	1109	5181	6	6	\N
6705	1109	4747	31	25	\N
6706	1109	5681	40	36	\N
6707	1109	5682	32	38	\N
6708	1110	5384	4	20	\N
6709	1110	4624	14	4	\N
6710	1110	5371	11	28	\N
6711	1110	5660	12	9	\N
6712	1110	5687	15	5	\N
6713	1110	5688	26	7	\N
6714	1111	3814	31	13	\N
6715	1111	5621	9	27	\N
6716	1111	3808	30	7	\N
6717	1111	3811	6	16	\N
6718	1111	3965	27	22	\N
6719	1111	3809	15	13	\N
6720	1112	4688	5	6	\N
6721	1112	4737	37	9	\N
6722	1112	4705	10	21	\N
6723	1112	4759	39	19	\N
6724	1112	4743	28	27	\N
6725	1112	5683	16	20	\N
6726	1114	3930	6	5	\N
6727	1114	4330	6	18	\N
6728	1114	5185	14	26	\N
6729	1114	4590	21	19	\N
6730	1114	4482	24	3	\N
6731	1114	4589	10	22	\N
6732	1115	4473	32	37	\N
6733	1115	4618	33	17	\N
6734	1115	4938	30	33	\N
6735	1115	4508	37	24	\N
6736	1115	4745	6	26	\N
6737	1115	4439	11	29	\N
6738	1116	4224	35	10	\N
6739	1116	5620	23	18	\N
6740	1116	3815	4	22	\N
6741	1116	5280	1	18	\N
6742	1116	4696	36	14	\N
6743	1116	5686	6	23	\N
6744	1117	4573	27	25	\N
6745	1117	5446	17	34	\N
6746	1117	5630	21	3	\N
6747	1117	4645	31	12	\N
6748	1117	5211	28	28	\N
6749	1117	4682	11	13	\N
6750	1118	4495	16	35	\N
6751	1118	4600	21	37	\N
6752	1118	5636	26	34	\N
6753	1118	4610	2	36	\N
6754	1118	4568	39	11	\N
6755	1118	4620	31	38	\N
6756	1119	4628	11	26	\N
6757	1119	4948	31	17	\N
6758	1119	4499	39	36	\N
6759	1119	4489	13	2	\N
6760	1119	5632	5	9	\N
6761	1119	4678	28	9	\N
6762	1120	4479	4	38	\N
6763	1120	5631	1	30	\N
6764	1120	4617	25	27	\N
6765	1120	4615	6	11	\N
6766	1120	5633	31	1	\N
6767	1120	4623	22	28	\N
6768	1121	4578	12	2	\N
6769	1121	4528	37	15	\N
6770	1121	4606	15	2	\N
6771	1121	4593	6	25	\N
6772	1121	4493	7	6	\N
6773	1121	5689	8	9	\N
6774	1122	5448	25	12	\N
6775	1122	5083	5	33	\N
6776	1122	5080	23	24	\N
6777	1122	5638	32	6	\N
6778	1122	5084	27	3	\N
6779	1122	5182	40	15	\N
6780	1123	4506	29	12	\N
6781	1123	4471	19	8	\N
6782	1123	4584	40	32	\N
6783	1123	5695	6	9	\N
6784	1123	5696	29	1	\N
6785	1123	5697	36	40	\N
6786	1124	5058	39	22	\N
6787	1124	5501	6	22	\N
6788	1124	5190	27	33	\N
6789	1124	5055	39	12	\N
6790	1124	3940	5	33	\N
6791	1124	5698	9	35	\N
6792	1125	5071	3	19	\N
6793	1125	4231	33	15	\N
6794	1125	5640	40	24	\N
6795	1125	5047	34	11	\N
6796	1125	5275	21	5	\N
6797	1125	5699	26	2	\N
6798	1126	4210	6	10	\N
6799	1126	4701	36	21	\N
6800	1126	3936	13	36	\N
6801	1126	5090	14	8	\N
6802	1126	5411	34	13	\N
6803	1126	5700	6	21	\N
6804	1127	5201	31	4	\N
6805	1127	5442	37	32	\N
6806	1127	5064	31	34	\N
6807	1127	5028	35	32	\N
6808	1127	5677	15	5	\N
6809	1127	5449	9	33	\N
6810	1131	4468	34	7	\N
6811	1131	4438	10	35	\N
6812	1131	4405	31	38	\N
6813	1131	5015	20	27	\N
6814	1131	5619	39	34	\N
6815	1131	4322	12	20	\N
6816	1129	4428	35	9	\N
6817	1129	4692	21	10	\N
6818	1129	4445	3	12	\N
6819	1129	4442	28	24	\N
6820	1129	5644	9	20	\N
6821	1129	5033	34	10	\N
6822	1128	4308	16	37	\N
6823	1128	4351	17	9	\N
6824	1128	4328	29	22	\N
6825	1128	5647	6	35	\N
6826	1128	5019	38	26	\N
6827	1128	4671	11	6	\N
6828	1130	4939	7	31	\N
6829	1130	5643	22	27	\N
6830	1130	4334	37	31	\N
6831	1130	5032	10	21	\N
6832	1130	4965	10	2	\N
6833	1130	5646	11	3	\N
6834	1132	4952	38	37	\N
6835	1132	4310	27	14	\N
6836	1132	5645	18	22	\N
6837	1132	4329	18	10	\N
6838	1132	4319	31	17	\N
6839	1132	5693	19	14	\N
6840	1133	4947	35	20	\N
6841	1133	4457	18	27	\N
6842	1133	4465	23	19	\N
6843	1133	4949	40	10	\N
6844	1133	5601	38	10	\N
6845	1133	3848	22	39	\N
6846	1136	3855	16	13	\N
6847	1136	3856	19	16	\N
6848	1136	3857	19	5	\N
6849	1136	3867	27	14	\N
6850	1136	4290	36	34	\N
6851	1136	3906	31	33	\N
6852	1138	3913	19	37	\N
6853	1138	3853	12	3	\N
6854	1138	5648	19	12	\N
6855	1138	3865	8	34	\N
6856	1138	5073	29	33	\N
6857	1138	5444	9	19	\N
6858	1139	3917	23	16	\N
6859	1139	5413	35	7	\N
6860	1139	3915	35	36	\N
6861	1139	3907	24	4	\N
6862	1139	3908	17	15	\N
6863	1139	3963	39	13	\N
6864	1137	5355	25	19	\N
6865	1137	5395	33	6	\N
6866	1137	4744	36	22	\N
6867	1137	4690	8	17	\N
6868	1137	3805	27	26	\N
6869	1137	3914	17	39	\N
6870	1134	3909	10	2	\N
6871	1134	3901	3	18	\N
6872	1134	3918	22	21	\N
6873	1134	5604	2	23	\N
6874	1134	5326	9	38	\N
6875	1134	5702	7	32	\N
6876	1135	3910	28	27	\N
6877	1135	5610	29	8	\N
6878	1135	3916	36	16	\N
6879	1135	3971	38	22	\N
6880	1135	4272	38	40	\N
6881	1135	5701	35	29	\N
6882	1140	4670	4	4	\N
6883	1140	4636	35	24	\N
6884	1140	4675	28	30	\N
6885	1140	4633	30	27	\N
6886	1140	4637	9	7	\N
6887	1140	4686	24	40	\N
6888	1141	4680	8	4	\N
6889	1141	4679	29	9	\N
6890	1141	4681	39	17	\N
6891	1141	4672	3	37	\N
6892	1141	4467	1	33	\N
6893	1141	5690	25	14	\N
6894	1142	4644	13	8	\N
6895	1142	4684	39	5	\N
6896	1142	4674	14	15	\N
6897	1142	4646	26	20	\N
6898	1142	5691	9	27	\N
6899	1142	5692	29	33	\N
6900	1143	3803	22	5	\N
6901	1143	3750	27	3	\N
6902	1143	3755	23	34	\N
6903	1143	3789	33	21	\N
6904	1143	5502	35	2	\N
6905	1143	5651	15	40	\N
6906	1144	3960	16	1	\N
6907	1144	3749	20	38	\N
6908	1144	5414	40	27	\N
6909	1144	3813	36	23	\N
6910	1144	4691	31	39	\N
6911	1144	5459	30	39	\N
6912	1145	3752	33	1	\N
6913	1145	3765	18	37	\N
6914	1145	3799	32	19	\N
6915	1145	3783	4	7	\N
6916	1145	3955	34	31	\N
6917	1145	4298	11	18	\N
6918	1146	3759	13	17	\N
6919	1146	3754	13	17	\N
6920	1146	3806	28	36	\N
6921	1146	3798	39	36	\N
6922	1146	4958	11	21	\N
6923	1146	4699	31	37	\N
6924	1147	5353	23	32	\N
6925	1147	5316	23	5	\N
6926	1147	5325	11	9	\N
6927	1147	4004	5	20	\N
6928	1147	5320	28	9	\N
6929	1147	3763	2	23	\N
6930	1148	5653	16	15	\N
6931	1148	3802	31	5	\N
6932	1148	3790	24	26	\N
6933	1148	3753	34	4	\N
6934	1148	3764	1	34	\N
6935	1148	3792	35	11	\N
6936	1149	5265	39	38	\N
6937	1149	5273	36	24	\N
6938	1149	5231	34	29	\N
6939	1149	5227	5	25	\N
6940	1149	4335	17	2	\N
6941	1149	5565	11	8	\N
6942	1150	4609	3	3	\N
6943	1150	5278	3	28	\N
6944	1150	5263	5	1	\N
6945	1150	5654	16	35	\N
6946	1150	5207	6	21	\N
6947	1150	5707	38	36	\N
6948	1151	4469	4	16	\N
6949	1151	5361	38	29	\N
6950	1151	5224	36	28	\N
6951	1151	3959	10	32	\N
6952	1151	5708	24	31	\N
6953	1151	5709	23	25	\N
6954	1152	5169	16	18	\N
6955	1152	5216	25	32	\N
6956	1152	5262	2	24	\N
6957	1152	5074	19	7	\N
6958	1152	4673	33	29	\N
6959	1152	4005	40	12	\N
6960	1154	3800	25	5	\N
6961	1154	4683	27	21	\N
6962	1154	5225	9	23	\N
6963	1154	4697	33	15	\N
6964	1154	5267	21	32	\N
6965	1154	5705	17	40	\N
6966	1153	5229	18	31	\N
6967	1153	4433	16	19	\N
6968	1153	5322	5	26	\N
6969	1153	5272	9	22	\N
6970	1153	5635	19	22	\N
6971	1153	5706	37	19	\N
6972	1155	5218	8	38	\N
6973	1155	5264	7	12	\N
6974	1155	5048	37	5	\N
6975	1155	5269	18	38	\N
6976	1155	5655	14	20	\N
6977	1155	5270	6	40	\N
6978	1156	5454	19	3	\N
6979	1156	5429	16	35	\N
6980	1156	5404	39	17	\N
6981	1156	5401	4	29	\N
6982	1156	5788	0	0	\N
6983	1156	5789	0	0	\N
6984	1157	5390	11	36	\N
6985	1157	5398	5	28	\N
6986	1157	4695	31	7	\N
6987	1157	5389	17	7	\N
6988	1157	5443	34	17	\N
6989	1157	5787	0	0	\N
6990	1158	5397	21	21	\N
6991	1158	5408	22	23	\N
6992	1158	5437	16	21	\N
6993	1158	5392	39	25	\N
6994	1158	5452	20	2	\N
6995	1158	5453	23	27	\N
6996	1159	4940	8	14	\N
6997	1159	5001	19	25	\N
6998	1159	4930	1	27	\N
6999	1159	4964	5	35	\N
7000	1159	5034	14	1	\N
7001	1159	5020	39	26	\N
7002	1160	5022	20	15	\N
7003	1160	4961	38	34	\N
7004	1160	4279	16	13	\N
7005	1160	4946	39	16	\N
7006	1160	4922	33	13	\N
7007	1160	4955	13	39	\N
7008	1161	4967	20	22	\N
7009	1161	5013	27	18	\N
7010	1161	5040	15	36	\N
7011	1161	4959	33	38	\N
7012	1161	5023	30	24	\N
7013	1161	5035	37	35	\N
7014	1162	5036	33	34	\N
7015	1162	5043	38	37	\N
7016	1162	4703	3	16	\N
7017	1162	4945	13	23	\N
7018	1162	4956	8	18	\N
7019	1162	5018	32	36	\N
7020	1163	3841	20	25	\N
7021	1163	3845	23	32	\N
7022	1163	3849	15	4	\N
7023	1163	5283	27	17	\N
7024	1163	3840	12	10	\N
7025	1163	3810	34	15	\N
7026	1164	5367	30	38	\N
7027	1164	5370	36	4	\N
7028	1164	5368	26	18	\N
7029	1164	5372	15	11	\N
7030	1164	5662	5	30	\N
7031	1164	5711	10	9	\N
7032	1165	5286	22	30	\N
7033	1165	5285	34	25	\N
7034	1165	5287	10	27	\N
7035	1165	5281	10	34	\N
7036	1165	4735	20	23	\N
7037	1165	5659	18	20	\N
7038	1166	3843	22	3	\N
7039	1166	5305	10	17	\N
7040	1166	5661	37	36	\N
7041	1166	3846	40	24	\N
7042	1166	5311	24	21	\N
7043	1166	3817	9	1	\N
7044	1167	5363	17	8	\N
7045	1167	4702	20	22	\N
7046	1167	4704	35	39	\N
7047	1167	4693	11	19	\N
7048	1167	4698	7	39	\N
7049	1167	5710	26	16	\N
7050	1168	3972	11	38	\N
7051	1168	3932	7	2	\N
7052	1168	3937	35	11	\N
7053	1168	3953	19	30	\N
7054	1168	3947	12	1	\N
7055	1168	3925	38	7	\N
7062	1169	3961	16	15	\N
7063	1169	4757	18	23	\N
7064	1169	5663	31	36	\N
7065	1169	5194	6	7	\N
7066	1169	3941	12	15	\N
7067	1169	3964	11	7	\N
7068	1170	3933	22	34	\N
7069	1170	3957	38	17	\N
7070	1170	5664	25	29	\N
7071	1170	3931	5	16	\N
7072	1170	3928	40	11	\N
7073	1170	3944	12	32	\N
7074	1171	4667	10	17	\N
7075	1171	3956	10	20	\N
7076	1171	4640	40	25	\N
7077	1171	3942	31	20	\N
7078	1171	5712	4	36	\N
7079	1171	5713	20	18	\N
7080	1180	5599	0	0	\N
7081	1180	4003	0	0	\N
7082	1180	4302	29	14	\N
7083	1180	5488	15	21	\N
7084	1180	4454	22	24	\N
7085	1180	4490	38	36	\N
7086	1180	4317	4	33	\N
7087	1180	4259	9	3	\N
7088	1180	4594	36	37	\N
7089	1181	4603	0	0	\N
7090	1181	4739	0	0	\N
7091	1181	3923	0	0	\N
7092	1181	5486	27	8	\N
7093	1181	5184	1	32	\N
7094	1181	5085	39	12	\N
7095	1181	4283	24	12	\N
7096	1181	5611	29	22	\N
7097	1181	4588	8	15	\N
7098	1182	4246	0	0	\N
7099	1182	4242	20	28	\N
7100	1182	4755	4	32	\N
7101	1182	5217	22	19	\N
7102	1182	4605	12	18	\N
7103	1182	4276	30	9	\N
7104	1182	4607	17	18	\N
7105	1182	5504	12	20	\N
7106	1182	5568	22	11	\N
7107	1183	4275	0	0	\N
7108	1183	4487	36	34	\N
7109	1183	4273	19	2	\N
7110	1183	4209	3	17	\N
7111	1183	4928	34	1	\N
7112	1183	4321	21	28	\N
7113	1183	4587	35	37	\N
7114	1183	5051	1	29	\N
7115	1183	4583	12	8	\N
7116	1172	5581	0	0	\N
7117	1172	4639	0	0	\N
7118	1172	5719	0	0	\N
7119	1172	4251	0	0	\N
7120	1172	4608	38	6	\N
7121	1172	5027	15	16	\N
7122	1172	4049	33	29	\N
7123	1172	4223	39	33	\N
7124	1172	4019	32	11	\N
7125	1184	5226	0	0	\N
7126	1184	5672	0	0	\N
7127	1184	4016	8	32	\N
7128	1184	5670	16	38	\N
7129	1184	4040	30	35	\N
7130	1184	4320	23	28	\N
7131	1184	5205	7	15	\N
7132	1184	5276	3	25	\N
7133	1184	4030	22	7	\N
7134	1173	5463	0	0	\N
7135	1173	4762	0	0	\N
7136	1173	4287	11	22	\N
7137	1173	4627	10	22	\N
7138	1173	4218	2	3	\N
7139	1173	5500	34	16	\N
7140	1173	4288	25	21	\N
7141	1173	5076	38	6	\N
7142	1173	5671	5	21	\N
7143	1185	4927	0	0	\N
7144	1185	4227	0	0	\N
7145	1185	5079	37	4	\N
7146	1185	4779	18	37	\N
7147	1185	5589	37	25	\N
7148	1185	5576	1	20	\N
7149	1185	4221	31	37	\N
7150	1185	4918	16	32	\N
7151	1185	5489	12	23	\N
7152	1186	4300	0	0	\N
7153	1186	5503	0	0	\N
7154	1186	4255	12	19	\N
7155	1186	5609	20	17	\N
7156	1186	4935	32	9	\N
7157	1186	4787	19	36	\N
7158	1186	4219	40	13	\N
7159	1186	5592	26	28	\N
7160	1186	4786	11	16	\N
7161	1174	4007	20	5	\N
7162	1174	5613	25	7	\N
7163	1174	4777	39	1	\N
7164	1174	5481	14	30	\N
7165	1174	4440	29	18	\N
7166	1174	4254	37	38	\N
7167	1174	5495	21	27	\N
7168	1174	5464	30	35	\N
7169	1174	4294	19	29	\N
7170	1187	5714	0	0	\N
7171	1187	5266	0	0	\N
7172	1187	4261	0	0	\N
7173	1187	5602	17	10	\N
7174	1187	4293	1	24	\N
7175	1187	3977	2	16	\N
7176	1187	4761	8	32	\N
7177	1187	4236	26	27	\N
7178	1187	4476	37	27	\N
7179	1188	4252	32	24	\N
7180	1188	4332	5	12	\N
7181	1188	5593	24	22	\N
7182	1188	5468	9	16	\N
7183	1188	4758	11	22	\N
7184	1188	4783	15	15	\N
7185	1188	4914	11	25	\N
7186	1188	5186	40	5	\N
7187	1188	4244	18	39	\N
7188	1175	3986	0	0	\N
7189	1175	5591	33	7	\N
7190	1175	5587	0	0	\N
7191	1175	4268	37	34	\N
7192	1175	3998	40	10	\N
7193	1175	5571	23	22	\N
7194	1175	4286	38	34	\N
7195	1175	4116	15	17	\N
7196	1175	3968	26	4	\N
7197	1189	3975	0	0	\N
7198	1189	4924	23	26	\N
7199	1189	5562	30	19	\N
7200	1189	4770	30	13	\N
7201	1189	5007	27	29	\N
7202	1189	5487	19	17	\N
7203	1189	4782	36	27	\N
7204	1189	5189	22	31	\N
7205	1189	4748	5	39	\N
7206	1190	5634	0	0	\N
7207	1190	4014	0	0	\N
7208	1190	4280	0	0	\N
7209	1190	3943	26	16	\N
7210	1190	4025	7	4	\N
7211	1190	5615	20	22	\N
7212	1190	4257	1	21	\N
7213	1190	5498	22	3	\N
7214	1190	5460	14	11	\N
7215	1191	5050	0	0	\N
7216	1191	5465	0	0	\N
7217	1191	5569	40	10	\N
7218	1191	5078	2	38	\N
7219	1191	5075	27	9	\N
7220	1191	4214	31	9	\N
7221	1191	5484	6	30	\N
7222	1191	4295	38	20	\N
7223	1191	5081	22	7	\N
7224	1176	5494	21	13	\N
7225	1176	5471	3	35	\N
7226	1176	5183	23	37	\N
7227	1176	4271	8	36	\N
7228	1176	5469	1	34	\N
7229	1176	5171	33	33	\N
7230	1176	5199	32	38	\N
7231	1176	4746	37	21	\N
7232	1176	4013	27	29	\N
7233	1192	5715	0	0	\N
7234	1192	5716	0	0	\N
7235	1192	4243	17	28	\N
7236	1192	5588	27	3	\N
7237	1192	4035	3	30	\N
7238	1192	5476	34	38	\N
7239	1192	4327	13	40	\N
7240	1192	4752	39	19	\N
7241	1192	5605	9	11	\N
7242	1193	5721	0	0	\N
7243	1193	4595	22	29	\N
7244	1193	4240	28	9	\N
7245	1193	5584	13	22	\N
7246	1193	5046	33	22	\N
7247	1193	3921	7	20	\N
7248	1193	5665	37	31	\N
7249	1193	4505	14	38	\N
7250	1193	3985	11	4	\N
7251	1177	4229	0	0	\N
7252	1177	3949	0	0	\N
7253	1177	4472	0	0	\N
7254	1177	4641	0	0	\N
7255	1177	5575	27	36	\N
7256	1177	4297	31	17	\N
7257	1177	4484	9	2	\N
7258	1177	5222	16	1	\N
7259	1177	4021	32	18	\N
7260	1194	4289	0	0	\N
7261	1194	5717	0	0	\N
7262	1194	5718	0	0	\N
7263	1194	4486	11	34	\N
7264	1194	4478	28	29	\N
7265	1194	4260	21	37	\N
7266	1194	5177	28	25	\N
7267	1194	4264	7	14	\N
7268	1194	4475	1	36	\N
7269	1178	4444	0	0	\N
7270	1178	4006	0	0	\N
7271	1178	5563	23	28	\N
7272	1178	5666	31	23	\N
7273	1178	3902	40	14	\N
7274	1178	4011	21	11	\N
7275	1178	4318	10	26	\N
7276	1178	5586	26	3	\N
7277	1178	4754	26	27	\N
7278	1195	4601	0	0	\N
7279	1195	3911	0	0	\N
7280	1195	5187	23	32	\N
7281	1195	3864	9	11	\N
7282	1195	3996	9	17	\N
7283	1195	4263	13	31	\N
7284	1195	4253	4	4	\N
7285	1195	4220	35	14	\N
7286	1195	4749	0	0	\N
7287	1196	4586	0	0	\N
7288	1196	5668	19	31	\N
7289	1196	5614	21	35	\N
7290	1196	4027	15	40	\N
7291	1196	5603	21	25	\N
7292	1196	5180	8	22	\N
7293	1196	4585	15	15	\N
7294	1196	5667	4	17	\N
7295	1196	5641	11	21	\N
7296	1179	4501	2	37	\N
7297	1179	5477	12	31	\N
7298	1179	5054	11	6	\N
7299	1179	3991	35	2	\N
7300	1179	4267	23	7	\N
7301	1179	5176	14	38	\N
7302	1179	5595	19	39	\N
7303	1179	5572	22	23	\N
7304	1179	4934	37	37	\N
7305	1197	4258	11	16	\N
7306	1197	4299	13	39	\N
7307	1197	5179	33	16	\N
7308	1197	4483	32	11	\N
7309	1197	4012	4	3	\N
7310	1197	4497	37	36	\N
7311	1197	5219	3	39	\N
7312	1197	5223	18	35	\N
7313	1197	4599	34	8	\N
7314	1198	4441	0	0	\N
7315	1198	4966	0	0	\N
7316	1198	4734	0	0	\N
7317	1198	4313	10	36	\N
7318	1198	5056	22	3	\N
7319	1198	4024	1	21	\N
7320	1198	3997	3	9	\N
7321	1198	4028	28	7	\N
7322	1198	5220	33	7	\N
7323	1199	5467	0	0	\N
7324	1199	5496	38	40	\N
7325	1199	4207	12	25	\N
7326	1199	4038	27	16	\N
7327	1199	4270	6	5	\N
7328	1199	4291	40	1	\N
7329	1199	4032	9	3	\N
7330	1199	5596	2	14	\N
7331	1199	4775	8	10	\N
7332	1200	5722	0	0	\N
7333	1200	5213	21	9	\N
7334	1200	4023	20	26	\N
7335	1200	4635	13	39	\N
7336	1200	4010	13	39	\N
7337	1200	4037	13	34	\N
7338	1200	4256	1	11	\N
7339	1200	4225	17	10	\N
7340	1200	5678	22	4	\N
7341	1201	5720	0	0	\N
7342	1201	4235	23	31	\N
7343	1201	4274	11	14	\N
7344	1201	5069	23	28	\N
7345	1201	5561	9	4	\N
7346	1201	5458	30	2	\N
7347	1201	5214	1	17	\N
7348	1201	5585	4	23	\N
7349	1201	5057	36	12	\N
7350	1202	4234	9	39	\N
7351	1202	5607	9	11	\N
7352	1202	4281	18	3	\N
7353	1202	4044	24	10	\N
7354	1202	5089	26	13	\N
7355	1202	5564	5	15	\N
7356	1202	5049	26	28	\N
7357	1202	4042	33	31	\N
7358	1202	4954	35	2	\N
7359	1203	5570	0	0	\N
7360	1203	3863	0	0	\N
7361	1203	4047	0	0	\N
7362	1203	4597	16	27	\N
7363	1203	4769	39	17	\N
7364	1203	5193	38	21	\N
7365	1204	4208	0	0	\N
7366	1204	4941	0	0	\N
7367	1204	4216	0	0	\N
7368	1204	4502	0	0	\N
7369	1204	5173	27	30	\N
7370	1204	4919	26	15	\N
7371	1205	5480	0	0	\N
7372	1205	4488	0	0	\N
7373	1205	5729	0	0	\N
7374	1205	5024	31	10	\N
7375	1205	5072	26	32	\N
7376	1205	3990	15	9	\N
7377	1206	4481	0	0	\N
7378	1206	4033	0	0	\N
7379	1206	5070	0	0	\N
7380	1206	5730	0	0	\N
7381	1206	4262	1	8	\N
7382	1206	5061	1	8	\N
7383	1217	5030	0	0	\N
7384	1217	3954	0	0	\N
7385	1217	5731	0	0	\N
7386	1217	4226	6	10	\N
7387	1217	3976	24	12	\N
7388	1217	5026	3	33	\N
7389	1216	4238	0	0	\N
7390	1216	4192	0	0	\N
7391	1216	5170	27	40	\N
7392	1216	4215	34	14	\N
7393	1216	5044	27	20	\N
7394	1216	3995	26	9	\N
7395	1211	5612	0	0	\N
7396	1211	5462	0	0	\N
7397	1211	5574	0	0	\N
7398	1211	4026	0	0	\N
7399	1211	4463	25	3	\N
7400	1211	5600	4	3	\N
7401	1209	5598	0	0	\N
7402	1209	4498	0	0	\N
7403	1209	5053	0	0	\N
7404	1209	5174	0	0	\N
7405	1209	4265	11	2	\N
7406	1209	5642	6	2	\N
7407	1210	5200	0	0	\N
7408	1210	3999	0	0	\N
7409	1210	3869	0	0	\N
7410	1210	5726	0	0	\N
7411	1210	5472	31	8	\N
7412	1210	5675	5	11	\N
7413	1213	4932	0	0	\N
7414	1213	3992	0	0	\N
7415	1213	4503	0	0	\N
7416	1213	5727	0	0	\N
7417	1213	5728	0	0	\N
7418	1213	5674	32	13	\N
7419	1214	3751	0	0	\N
7420	1214	5456	0	0	\N
7421	1214	4020	13	36	\N
7422	1214	3945	37	25	\N
7423	1214	5597	34	12	\N
7424	1214	4001	38	28	\N
7425	1219	4622	0	0	\N
7426	1219	4492	0	0	\N
7427	1219	4296	0	0	\N
7428	1219	5066	0	0	\N
7429	1219	4303	0	0	\N
7430	1219	5268	6	5	\N
7431	1218	4284	0	0	\N
7432	1218	4002	0	0	\N
7433	1218	4936	0	0	\N
7434	1218	5732	0	0	\N
7435	1218	5733	0	0	\N
7436	1218	3989	26	14	\N
7437	1207	5723	0	0	\N
7438	1207	4621	20	37	\N
7439	1207	4507	16	31	\N
7440	1207	5068	27	33	\N
7441	1207	5578	7	40	\N
7442	1207	5566	4	28	\N
7443	1215	5059	0	0	\N
7444	1215	4470	0	0	\N
7445	1215	4217	0	0	\N
7446	1215	4760	0	0	\N
7447	1215	5077	0	0	\N
7448	1215	4742	12	37	\N
7449	1208	5192	0	0	\N
7450	1208	4736	0	0	\N
7451	1208	5060	0	0	\N
7452	1208	5616	0	0	\N
7453	1208	5725	0	0	\N
7454	1208	5734	0	0	\N
7455	1212	3979	0	0	\N
7456	1212	4592	35	25	\N
7457	1212	4282	28	27	\N
7458	1212	5212	3	23	\N
7459	1212	4449	23	28	\N
7460	1212	4036	32	2	\N
7461	1220	4604	0	0	\N
7462	1220	5673	0	0	\N
7463	1220	5271	0	0	\N
7464	1220	5573	8	31	\N
7465	1220	3987	13	15	\N
7466	1220	5210	26	39	\N
7467	1221	4458	0	0	\N
7468	1221	4630	0	0	\N
7469	1221	3969	0	0	\N
7470	1221	5483	0	0	\N
7471	1221	5669	38	6	\N
7472	1221	5052	31	3	\N
7473	1222	5086	0	0	\N
7474	1222	4278	0	0	\N
7475	1222	4596	0	0	\N
7476	1222	5676	18	13	\N
7477	1222	4285	9	31	\N
7478	1222	5188	22	2	\N
7479	1223	5362	24	7	\N
7480	1223	5319	1	38	\N
7481	1223	5354	20	24	\N
7482	1223	5324	14	28	\N
7483	1223	5650	37	40	\N
7484	1223	5703	15	25	\N
7485	1224	5359	14	31	\N
7486	1224	5321	20	7	\N
7487	1224	5360	14	33	\N
7488	1224	5349	33	40	\N
7489	1224	5356	3	32	\N
7490	1224	5704	24	13	\N
7491	1225	3767	7	1	\N
7492	1225	5317	12	19	\N
7493	1225	5323	31	24	\N
7494	1225	5348	19	4	\N
7495	1225	5313	26	4	\N
7496	1225	5352	17	24	\N
7497	1234	4462	0	0	\N
7498	1234	4494	0	0	\N
7499	1234	4937	0	0	\N
7500	1234	5028	0	0	\N
7501	1234	4938	0	0	\N
7502	1234	4929	0	0	\N
7503	1235	5682	0	0	\N
7504	1235	5687	0	0	\N
7505	1235	4916	0	0	\N
7506	1235	4766	0	0	\N
7507	1235	4455	0	0	\N
7508	1235	5623	0	0	\N
7509	1226	4765	0	0	\N
7510	1226	4764	0	0	\N
7511	1226	4756	0	0	\N
7512	1226	4500	0	0	\N
7513	1226	5661	0	0	\N
7514	1226	4772	0	0	\N
7515	1230	4506	0	0	\N
7516	1230	5684	0	0	\N
7517	1230	4931	0	0	\N
7518	1230	4784	0	0	\N
7519	1230	4787	0	0	\N
7520	1230	3809	0	0	\N
7521	1236	4460	0	0	\N
7522	1236	4750	0	0	\N
7523	1236	4917	0	0	\N
7524	1236	4759	0	0	\N
7525	1236	3815	0	0	\N
7526	1236	4619	0	0	\N
7527	1237	4751	0	0	\N
7528	1237	4767	0	0	\N
7529	1237	4743	0	0	\N
7530	1237	3842	0	0	\N
7531	1237	4613	0	0	\N
7532	1237	4439	0	0	\N
7533	1239	5087	0	0	\N
7534	1239	5686	0	0	\N
7535	1239	4774	0	0	\N
7536	1239	4591	0	0	\N
7537	1239	4629	0	0	\N
7538	1239	3948	0	0	\N
7539	1228	5620	0	0	\N
7540	1228	3814	0	0	\N
7541	1228	4627	0	0	\N
7542	1228	4745	0	0	\N
7543	1228	5767	0	0	\N
7544	1228	5768	0	0	\N
7545	1231	4923	0	0	\N
7546	1231	5181	0	0	\N
7547	1231	4746	0	0	\N
7548	1231	4780	0	0	\N
7549	1231	4760	0	0	\N
7550	1231	5077	0	0	\N
7551	1238	4624	0	0	\N
7552	1238	5388	0	0	\N
7553	1238	5384	0	0	\N
7554	1238	5688	0	0	\N
7555	1238	4954	0	0	\N
7556	1238	4614	0	0	\N
7557	1232	3844	0	0	\N
7558	1232	5082	0	0	\N
7559	1232	5621	0	0	\N
7560	1232	3811	0	0	\N
7561	1232	4962	0	0	\N
7562	1232	5769	0	0	\N
7563	1233	4692	0	0	\N
7564	1233	4688	0	0	\N
7565	1233	4691	0	0	\N
7566	1233	4737	0	0	\N
7567	1233	4690	0	0	\N
7568	1233	5086	0	0	\N
7569	1227	5185	0	0	\N
7570	1227	4590	0	0	\N
7571	1227	4330	0	0	\N
7572	1227	3965	0	0	\N
7573	1227	4482	0	0	\N
7574	1227	4589	0	0	\N
7575	1229	4473	0	0	\N
7576	1229	4618	0	0	\N
7577	1229	5202	0	0	\N
7578	1229	4632	0	0	\N
7579	1229	4747	0	0	\N
7580	1229	4771	0	0	\N
7581	1243	5211	0	0	\N
7582	1243	4682	0	0	\N
7583	1243	5446	0	0	\N
7584	1243	4573	0	0	\N
7585	1243	4645	0	0	\N
7586	1243	5770	0	0	\N
7587	1244	5632	0	0	\N
7588	1244	4479	0	0	\N
7589	1244	5442	0	0	\N
7590	1244	5776	0	0	\N
7591	1244	4600	0	0	\N
7592	1244	5777	0	0	\N
7593	1240	4489	0	0	\N
7594	1240	4678	0	0	\N
7595	1240	5636	0	0	\N
7596	1240	4477	0	0	\N
7597	1240	4948	0	0	\N
7598	1240	5775	0	0	\N
7599	1241	4617	0	0	\N
7600	1241	4593	0	0	\N
7601	1241	5771	0	0	\N
7602	1241	5772	0	0	\N
7603	1241	5773	0	0	\N
7604	1241	5774	0	0	\N
7605	1242	4606	0	0	\N
7606	1242	5190	0	0	\N
7607	1242	4493	0	0	\N
7608	1242	4623	0	0	\N
7609	1242	5778	0	0	\N
7610	1242	5779	0	0	\N
7611	1245	4604	0	0	\N
7612	1245	5084	0	0	\N
7613	1245	4508	0	0	\N
7614	1245	5698	0	0	\N
7615	1245	5172	0	0	\N
7616	1245	4469	0	0	\N
7617	1250	3924	0	0	\N
7618	1250	4630	0	0	\N
7619	1250	3748	0	0	\N
7620	1250	5207	0	0	\N
7621	1250	5178	0	0	\N
7622	1250	5780	0	0	\N
7623	1247	5063	0	0	\N
7624	1247	4584	0	0	\N
7625	1247	5066	0	0	\N
7626	1247	5055	0	0	\N
7627	1247	4703	0	0	\N
7628	1247	5781	0	0	\N
7629	1248	5640	0	0	\N
7630	1248	5206	0	0	\N
7631	1248	5047	0	0	\N
7632	1248	5411	0	0	\N
7633	1248	5173	0	0	\N
7634	1248	5635	0	0	\N
7635	1249	5045	0	0	\N
7636	1249	3936	0	0	\N
7637	1249	5090	0	0	\N
7638	1249	4701	0	0	\N
7639	1249	3923	0	0	\N
7640	1249	5782	0	0	\N
7641	1251	5064	0	0	\N
7642	1251	5182	0	0	\N
7643	1251	4445	0	0	\N
7644	1251	3863	0	0	\N
7645	1251	3950	0	0	\N
7646	1251	5783	0	0	\N
7647	1246	5209	0	0	\N
7648	1246	4224	0	0	\N
7649	1246	5201	0	0	\N
7650	1246	4438	0	0	\N
7651	1246	4210	0	0	\N
7652	1246	5070	0	0	\N
7653	1255	4329	0	0	\N
7654	1255	5015	0	0	\N
7655	1255	4442	0	0	\N
7656	1255	4405	0	0	\N
7657	1255	5031	0	0	\N
7658	1255	4468	0	0	\N
7659	1253	4333	0	0	\N
7660	1253	4459	0	0	\N
7661	1253	4951	0	0	\N
7662	1253	4965	0	0	\N
7663	1253	5619	0	0	\N
7664	1253	4428	0	0	\N
7665	1257	5689	0	0	\N
7666	1257	4351	0	0	\N
7667	1257	4328	0	0	\N
7668	1257	4671	0	0	\N
7669	1257	4413	0	0	\N
7670	1257	5784	0	0	\N
7671	1252	4939	0	0	\N
7672	1252	4334	0	0	\N
7673	1252	4317	0	0	\N
7674	1252	4705	0	0	\N
7675	1252	4744	0	0	\N
7676	1252	5643	0	0	\N
7677	1254	4465	0	0	\N
7678	1254	5044	0	0	\N
7679	1254	4952	0	0	\N
7680	1254	5693	0	0	\N
7681	1254	5026	0	0	\N
7682	1254	4322	0	0	\N
7683	1256	4289	0	0	\N
7684	1256	4947	0	0	\N
7685	1256	4457	0	0	\N
7686	1256	4949	0	0	\N
7687	1256	5601	0	0	\N
7688	1256	5042	0	0	\N
7689	1258	5033	0	0	\N
7690	1258	5032	0	0	\N
7691	1258	5645	0	0	\N
7692	1258	5647	0	0	\N
7693	1258	4433	0	0	\N
7694	1258	4689	0	0	\N
7695	1259	3867	0	0	\N
7696	1259	4471	0	0	\N
7697	1259	3866	0	0	\N
7698	1259	3855	0	0	\N
7699	1259	3856	0	0	\N
7700	1259	3914	0	0	\N
7701	1263	5073	0	0	\N
7702	1263	5648	0	0	\N
7703	1263	5451	0	0	\N
7704	1263	3913	0	0	\N
7705	1263	3908	0	0	\N
7706	1263	3853	0	0	\N
7707	1260	3915	0	0	\N
7708	1260	3907	0	0	\N
7709	1260	3901	0	0	\N
7710	1260	3917	0	0	\N
7711	1260	5610	0	0	\N
7712	1260	3963	0	0	\N
7713	1264	4610	0	0	\N
7714	1264	3906	0	0	\N
7715	1264	4740	0	0	\N
7716	1264	4620	0	0	\N
7717	1264	3899	0	0	\N
7718	1264	5802	0	0	\N
7719	1261	5604	0	0	\N
7720	1261	5501	0	0	\N
7721	1261	3909	0	0	\N
7722	1261	3918	0	0	\N
7723	1261	3865	0	0	\N
7724	1261	5803	0	0	\N
7725	1262	3916	0	0	\N
7726	1262	4272	0	0	\N
7727	1262	3971	0	0	\N
7728	1262	3954	0	0	\N
7729	1262	3910	0	0	\N
7730	1262	3869	0	0	\N
7731	1265	4310	0	0	\N
7732	1265	4686	0	0	\N
7733	1265	4670	0	0	\N
7734	1265	4675	0	0	\N
7735	1265	4633	0	0	\N
7736	1265	4667	0	0	\N
7737	1266	4679	0	0	\N
7738	1266	5690	0	0	\N
7739	1266	4672	0	0	\N
7740	1266	4680	0	0	\N
7741	1266	4681	0	0	\N
7742	1266	4696	0	0	\N
7743	1267	4644	0	0	\N
7744	1267	4646	0	0	\N
7745	1267	5691	0	0	\N
7746	1267	5692	0	0	\N
7747	1267	4684	0	0	\N
7748	1267	4674	0	0	\N
7749	1268	3805	0	0	\N
7750	1268	3789	0	0	\N
7751	1268	3763	0	0	\N
7752	1268	5650	0	0	\N
7753	1268	4640	0	0	\N
7754	1268	3801	0	0	\N
7755	1269	3756	0	0	\N
7756	1269	5280	0	0	\N
7757	1269	5651	0	0	\N
7758	1269	5652	0	0	\N
7759	1269	5320	0	0	\N
7760	1269	5703	0	0	\N
7761	1270	3955	0	0	\N
7762	1270	4298	0	0	\N
7763	1270	3799	0	0	\N
7764	1270	3765	0	0	\N
7765	1270	3783	0	0	\N
7766	1270	3752	0	0	\N
7767	1271	3755	0	0	\N
7768	1271	4326	0	0	\N
7769	1271	3798	0	0	\N
7770	1271	5043	0	0	\N
7771	1271	4634	0	0	\N
7772	1271	4319	0	0	\N
7773	1272	5355	0	0	\N
7774	1272	5353	0	0	\N
7775	1272	5316	0	0	\N
7776	1272	5325	0	0	\N
7777	1272	5347	0	0	\N
7778	1272	4568	0	0	\N
7779	1273	5653	0	0	\N
7780	1273	3753	0	0	\N
7781	1273	3802	0	0	\N
7782	1273	3764	0	0	\N
7783	1273	3792	0	0	\N
7784	1273	5071	0	0	\N
7785	1274	3749	0	0	\N
7786	1274	5324	0	0	\N
7787	1274	3759	0	0	\N
7788	1274	3754	0	0	\N
7789	1274	3806	0	0	\N
7790	1274	3803	0	0	\N
7791	1275	5231	0	0	\N
7792	1275	5705	0	0	\N
7793	1275	5265	0	0	\N
7794	1275	5273	0	0	\N
7795	1275	4335	0	0	\N
7796	1275	5278	0	0	\N
7797	1276	5263	0	0	\N
7798	1276	4290	0	0	\N
7799	1276	5215	0	0	\N
7800	1276	4491	0	0	\N
7801	1276	5794	0	0	\N
7802	1276	5795	0	0	\N
7803	1277	5708	0	0	\N
7804	1277	5275	0	0	\N
7805	1277	5709	0	0	\N
7806	1277	5361	0	0	\N
7807	1277	3959	0	0	\N
7808	1277	5565	0	0	\N
7809	1278	5262	0	0	\N
7810	1278	4673	0	0	\N
7811	1278	5169	0	0	\N
7812	1278	5216	0	0	\N
7813	1278	3911	0	0	\N
7814	1278	4687	0	0	\N
7815	1279	5225	0	0	\N
7816	1279	4481	0	0	\N
7817	1279	4683	0	0	\N
7818	1279	4628	0	0	\N
7819	1279	4697	0	0	\N
7820	1279	5793	0	0	\N
7821	1280	5706	0	0	\N
7822	1280	5272	0	0	\N
7823	1280	5322	0	0	\N
7824	1280	3930	0	0	\N
7825	1280	4450	0	0	\N
7826	1280	4005	0	0	\N
7827	1281	5264	0	0	\N
7828	1281	5266	0	0	\N
7829	1281	5048	0	0	\N
7830	1281	5270	0	0	\N
7831	1281	4004	0	0	\N
7832	1281	4495	0	0	\N
7833	1282	5229	0	0	\N
7834	1282	5224	0	0	\N
7835	1282	5074	0	0	\N
7836	1282	5267	0	0	\N
7837	1282	4449	0	0	\N
7838	1282	5796	0	0	\N
7839	1283	5401	0	0	\N
7840	1283	5454	0	0	\N
7841	1283	5404	0	0	\N
7842	1283	5429	0	0	\N
7843	1283	5788	0	0	\N
7844	1283	5790	0	0	\N
7845	1284	5389	0	0	\N
7846	1284	4695	0	0	\N
7847	1284	5443	0	0	\N
7848	1284	5787	0	0	\N
7849	1284	5406	0	0	\N
7850	1284	3848	0	0	\N
7851	1285	5437	0	0	\N
7852	1285	5392	0	0	\N
7853	1285	5452	0	0	\N
7854	1285	5395	0	0	\N
7855	1285	5408	0	0	\N
7856	1285	5447	0	0	\N
7857	1286	5455	0	0	\N
7858	1286	5390	0	0	\N
7859	1286	5403	0	0	\N
7860	1286	5398	0	0	\N
7861	1286	5791	0	0	\N
7862	1286	5792	0	0	\N
7863	1287	4940	0	0	\N
7864	1287	5001	0	0	\N
7865	1287	4964	0	0	\N
7866	1287	5034	0	0	\N
7867	1287	5018	0	0	\N
7868	1287	5797	0	0	\N
7869	1288	5038	0	0	\N
7870	1288	5036	0	0	\N
7871	1288	5022	0	0	\N
7872	1288	5040	0	0	\N
7873	1288	5630	0	0	\N
7874	1288	5035	0	0	\N
7875	1289	4279	0	0	\N
7876	1289	4959	0	0	\N
7877	1289	4967	0	0	\N
7878	1289	5023	0	0	\N
7879	1289	4738	0	0	\N
7880	1289	5798	0	0	\N
7881	1290	5444	0	0	\N
7882	1290	4945	0	0	\N
7883	1290	4956	0	0	\N
7884	1290	4946	0	0	\N
7885	1290	4955	0	0	\N
7886	1290	5799	0	0	\N
7887	1296	5306	0	0	\N
7888	1296	5288	0	0	\N
7889	1296	4699	0	0	\N
7890	1296	3813	0	0	\N
7891	1296	5662	0	0	\N
7892	1296	4700	0	0	\N
7893	1291	3841	0	0	\N
7894	1291	3838	0	0	\N
7895	1291	3849	0	0	\N
7896	1291	3839	0	0	\N
7897	1291	3810	0	0	\N
7898	1291	3817	0	0	\N
7899	1293	5368	0	0	\N
7900	1293	5367	0	0	\N
7901	1293	5711	0	0	\N
7902	1293	5371	0	0	\N
7903	1293	5370	0	0	\N
7904	1293	5804	0	0	\N
7905	1294	4930	0	0	\N
7906	1294	5286	0	0	\N
7907	1294	5287	0	0	\N
7908	1294	5285	0	0	\N
7909	1294	5659	0	0	\N
7910	1294	5311	0	0	\N
7911	1295	3846	0	0	\N
7912	1295	3843	0	0	\N
7913	1295	3840	0	0	\N
7914	1295	5305	0	0	\N
7915	1295	3818	0	0	\N
7916	1295	5805	0	0	\N
7917	1292	5281	0	0	\N
7918	1292	4735	0	0	\N
7919	1292	4704	0	0	\N
7920	1292	5283	0	0	\N
7921	1292	4693	0	0	\N
7922	1292	4698	0	0	\N
7923	1297	3932	0	0	\N
7924	1297	3937	0	0	\N
7925	1297	3953	0	0	\N
7926	1297	3947	0	0	\N
7927	1297	3925	0	0	\N
7928	1297	5785	0	0	\N
7929	1298	3961	0	0	\N
7930	1298	4757	0	0	\N
7931	1298	3960	0	0	\N
7932	1298	5663	0	0	\N
7933	1298	5713	0	0	\N
7934	1298	5786	0	0	\N
7935	1299	3957	0	0	\N
7936	1299	3931	0	0	\N
7937	1299	3928	0	0	\N
7938	1299	5664	0	0	\N
7939	1299	3956	0	0	\N
7940	1299	3942	0	0	\N
7941	1308	5599	0	0	\N
7942	1308	4003	0	0	\N
7943	1308	4302	0	0	\N
7944	1308	5488	0	0	\N
7945	1308	4454	0	0	\N
7946	1308	4259	0	0	\N
7947	1308	5184	0	0	\N
7948	1308	5498	0	0	\N
7949	1308	5574	0	0	\N
7950	1309	4603	0	0	\N
7951	1309	4739	0	0	\N
7952	1309	5085	0	0	\N
7953	1309	4283	0	0	\N
7954	1309	5611	0	0	\N
7955	1309	4622	0	0	\N
7956	1309	4303	0	0	\N
7957	1309	5564	0	0	\N
7958	1309	5807	0	0	\N
7959	1310	4755	0	0	\N
7960	1310	5217	0	0	\N
7961	1310	4605	0	0	\N
7962	1310	4276	0	0	\N
7963	1310	4607	0	0	\N
7964	1310	5504	0	0	\N
7965	1310	5568	0	0	\N
7966	1310	3968	0	0	\N
7967	1310	4221	0	0	\N
7968	1311	4275	0	0	\N
7969	1311	4487	0	0	\N
7970	1311	4273	0	0	\N
7971	1311	4209	0	0	\N
7972	1311	4928	0	0	\N
7973	1311	4321	0	0	\N
7974	1311	5051	0	0	\N
7975	1311	5053	0	0	\N
7976	1311	4254	0	0	\N
7977	1300	5719	0	0	\N
7978	1300	4608	0	0	\N
7979	1300	4049	0	0	\N
7980	1300	4223	0	0	\N
7981	1300	5561	0	0	\N
7982	1300	4036	0	0	\N
7983	1300	4592	0	0	\N
7984	1300	5811	0	0	\N
7985	1300	5812	0	0	\N
7986	1312	5226	0	0	\N
7987	1312	5672	0	0	\N
7988	1312	4016	0	0	\N
7989	1312	5670	0	0	\N
7990	1312	4040	0	0	\N
7991	1312	5205	0	0	\N
7992	1312	5276	0	0	\N
7993	1312	4242	0	0	\N
7994	1312	5052	0	0	\N
7995	1301	4218	0	0	\N
7996	1301	5500	0	0	\N
7997	1301	5671	0	0	\N
7998	1301	5007	0	0	\N
7999	1301	5595	0	0	\N
8000	1301	5734	0	0	\N
8001	1301	4769	0	0	\N
8002	1301	5076	0	0	\N
8003	1301	5463	0	0	\N
8004	1313	4927	0	0	\N
8005	1313	4227	0	0	\N
8006	1313	5079	0	0	\N
8007	1313	5589	0	0	\N
8008	1313	5576	0	0	\N
8009	1313	4918	0	0	\N
8010	1313	5674	0	0	\N
8011	1313	5495	0	0	\N
8012	1313	5728	0	0	\N
8013	1314	5503	0	0	\N
8014	1314	4255	0	0	\N
8015	1314	5609	0	0	\N
8016	1314	4935	0	0	\N
8017	1314	5725	0	0	\N
8018	1314	4033	0	0	\N
8019	1314	5192	0	0	\N
8020	1314	4225	0	0	\N
8021	1314	5814	0	0	\N
8022	1302	4007	0	0	\N
8023	1302	5613	0	0	\N
8024	1302	4777	0	0	\N
8025	1302	5464	0	0	\N
8026	1302	4294	0	0	\N
8027	1302	4588	0	0	\N
8028	1302	4299	0	0	\N
8029	1302	5188	0	0	\N
8030	1302	5815	0	0	\N
8031	1315	5714	0	0	\N
8032	1315	4261	0	0	\N
8033	1315	5602	0	0	\N
8034	1315	4293	0	0	\N
8035	1315	3977	0	0	\N
8036	1315	4761	0	0	\N
8037	1315	4236	0	0	\N
8038	1315	4476	0	0	\N
8039	1315	5816	0	0	\N
8040	1316	4252	0	0	\N
8041	1316	4332	0	0	\N
8042	1316	5468	0	0	\N
8043	1316	4758	0	0	\N
8044	1316	4783	0	0	\N
8045	1316	4914	0	0	\N
8046	1316	5186	0	0	\N
8047	1316	4244	0	0	\N
8048	1316	4019	0	0	\N
8049	1303	3986	0	0	\N
8050	1303	4268	0	0	\N
8051	1303	3998	0	0	\N
8052	1303	5571	0	0	\N
8053	1303	4286	0	0	\N
8054	1303	4458	0	0	\N
8055	1303	4192	0	0	\N
8056	1303	5170	0	0	\N
8057	1303	5819	0	0	\N
8058	1317	3975	0	0	\N
8059	1317	4924	0	0	\N
8060	1317	5562	0	0	\N
8061	1317	4770	0	0	\N
8062	1317	5487	0	0	\N
8063	1317	4782	0	0	\N
8064	1317	5189	0	0	\N
8065	1317	4748	0	0	\N
8066	1317	4001	0	0	\N
8067	1318	5634	0	0	\N
8068	1318	4280	0	0	\N
8069	1318	3943	0	0	\N
8070	1318	4025	0	0	\N
8071	1318	5615	0	0	\N
8072	1318	4257	0	0	\N
8073	1318	5460	0	0	\N
8074	1318	4020	0	0	\N
8075	1318	4596	0	0	\N
8076	1319	5050	0	0	\N
8077	1319	5569	0	0	\N
8078	1319	4214	0	0	\N
8079	1319	5484	0	0	\N
8080	1319	4295	0	0	\N
8081	1319	5081	0	0	\N
8082	1319	5465	0	0	\N
8083	1319	5726	0	0	\N
8084	1319	5806	0	0	\N
8085	1304	5494	0	0	\N
8086	1304	5471	0	0	\N
8087	1304	5183	0	0	\N
8088	1304	4271	0	0	\N
8089	1304	5469	0	0	\N
8090	1304	5171	0	0	\N
8091	1304	5199	0	0	\N
8092	1304	4013	0	0	\N
8093	1304	4752	0	0	\N
8094	1320	5715	0	0	\N
8095	1320	5716	0	0	\N
8096	1320	5588	0	0	\N
8097	1320	4035	0	0	\N
8098	1320	5476	0	0	\N
8099	1320	4327	0	0	\N
8100	1320	5605	0	0	\N
8101	1320	5575	0	0	\N
8102	1320	5570	0	0	\N
8103	1321	4595	0	0	\N
8104	1321	4240	0	0	\N
8105	1321	5584	0	0	\N
8106	1321	5046	0	0	\N
8107	1321	5665	0	0	\N
8108	1321	3985	0	0	\N
8109	1321	4274	0	0	\N
8110	1321	4936	0	0	\N
8111	1321	5721	0	0	\N
8112	1305	3949	0	0	\N
8113	1305	4472	0	0	\N
8114	1305	4297	0	0	\N
8115	1305	5222	0	0	\N
8116	1305	4440	0	0	\N
8117	1305	4742	0	0	\N
8118	1305	5059	0	0	\N
8119	1305	4641	0	0	\N
8120	1305	5808	0	0	\N
8121	1322	5717	0	0	\N
8122	1322	4486	0	0	\N
8123	1322	4478	0	0	\N
8124	1322	4260	0	0	\N
8125	1322	5177	0	0	\N
8126	1322	4264	0	0	\N
8127	1322	4475	0	0	\N
8128	1322	4256	0	0	\N
8129	1322	5730	0	0	\N
8130	1306	4444	0	0	\N
8131	1306	4006	0	0	\N
8132	1306	5563	0	0	\N
8133	1306	4011	0	0	\N
8134	1306	4318	0	0	\N
8135	1306	5677	0	0	\N
8136	1306	5480	0	0	\N
8137	1306	5699	0	0	\N
8138	1306	5809	0	0	\N
8139	1323	4601	0	0	\N
8140	1323	3864	0	0	\N
8141	1323	3996	0	0	\N
8142	1323	4263	0	0	\N
8143	1323	4253	0	0	\N
8144	1323	4220	0	0	\N
8145	1323	4243	0	0	\N
8146	1323	3987	0	0	\N
8147	1323	4024	0	0	\N
8148	1324	5668	0	0	\N
8149	1324	5614	0	0	\N
8150	1324	4027	0	0	\N
8151	1324	5603	0	0	\N
8152	1324	5180	0	0	\N
8153	1324	5667	0	0	\N
8154	1324	5641	0	0	\N
8155	1324	5193	0	0	\N
8156	1324	4586	0	0	\N
8157	1307	5054	0	0	\N
8158	1307	3991	0	0	\N
8159	1307	4267	0	0	\N
8160	1307	5176	0	0	\N
8161	1307	4934	0	0	\N
8162	1307	4749	0	0	\N
8163	1307	5456	0	0	\N
8164	1307	5271	0	0	\N
8165	1307	5810	0	0	\N
8166	1325	4258	0	0	\N
8167	1325	5179	0	0	\N
8168	1325	4483	0	0	\N
8169	1325	4012	0	0	\N
8170	1325	4497	0	0	\N
8171	1325	5219	0	0	\N
8172	1325	4599	0	0	\N
8173	1325	5676	0	0	\N
8174	1325	5813	0	0	\N
8175	1326	4734	0	0	\N
8176	1326	4313	0	0	\N
8177	1326	5056	0	0	\N
8178	1326	3997	0	0	\N
8179	1326	4028	0	0	\N
8180	1326	5220	0	0	\N
8181	1326	4246	0	0	\N
8182	1326	5616	0	0	\N
8183	1326	5817	0	0	\N
8184	1327	5496	0	0	\N
8185	1327	4038	0	0	\N
8186	1327	4291	0	0	\N
8187	1327	4032	0	0	\N
8188	1327	5596	0	0	\N
8189	1327	4779	0	0	\N
8190	1327	4775	0	0	\N
8191	1327	5578	0	0	\N
8192	1327	5818	0	0	\N
8193	1328	5722	0	0	\N
8194	1328	5213	0	0	\N
8195	1328	4023	0	0	\N
8196	1328	4010	0	0	\N
8197	1328	4037	0	0	\N
8198	1328	5678	0	0	\N
8199	1328	5214	0	0	\N
8200	1328	4776	0	0	\N
8201	1328	5820	0	0	\N
8202	1329	4235	0	0	\N
8203	1329	5458	0	0	\N
8204	1329	5585	0	0	\N
8205	1329	5057	0	0	\N
8206	1329	4308	0	0	\N
8207	1329	5481	0	0	\N
8208	1329	5068	0	0	\N
8209	1329	5483	0	0	\N
8210	1329	5720	0	0	\N
8211	1330	4234	0	0	\N
8212	1330	5607	0	0	\N
8213	1330	4281	0	0	\N
8214	1330	4044	0	0	\N
8215	1330	5089	0	0	\N
8216	1330	5049	0	0	\N
8217	1330	4042	0	0	\N
8218	1330	4786	0	0	\N
8219	1330	5486	0	0	\N
8220	1331	4208	0	0	\N
8221	1331	4262	0	0	\N
8222	1331	5187	0	0	\N
8223	1331	4505	0	0	\N
8224	1331	4288	0	0	\N
8225	1331	4270	0	0	\N
8226	1331	5210	0	0	\N
8227	1331	5821	0	0	\N
8228	1331	5822	0	0	\N
8229	1337	5700	0	0	\N
8230	1337	4941	0	0	\N
8231	1337	5591	0	0	\N
8232	1337	4919	0	0	\N
8233	1337	5592	0	0	\N
8234	1343	4621	0	0	\N
8235	1343	5462	0	0	\N
8236	1343	4030	0	0	\N
8237	1343	5729	0	0	\N
8238	1343	5732	0	0	\N
8239	1343	4021	0	0	\N
8240	1345	5061	0	0	\N
8241	1345	4488	0	0	\N
8242	1345	5024	0	0	\N
8243	1345	3751	0	0	\N
8244	1345	4754	0	0	\N
8245	1345	5718	0	0	\N
8246	1350	5731	0	0	\N
8247	1350	3902	0	0	\N
8248	1350	4498	0	0	\N
8249	1350	5075	0	0	\N
8250	1350	4116	0	0	\N
8251	1350	5828	0	0	\N
8252	1338	5600	0	0	\N
8253	1338	4026	0	0	\N
8254	1338	4501	0	0	\N
8255	1338	5078	0	0	\N
8256	1338	4587	0	0	\N
8257	1338	5587	0	0	\N
8258	1347	4585	0	0	\N
8259	1347	5642	0	0	\N
8260	1347	5467	0	0	\N
8261	1347	5656	0	0	\N
8262	1347	5696	0	0	\N
8263	1348	4456	0	0	\N
8264	1348	5612	0	0	\N
8265	1348	4594	0	0	\N
8266	1348	4502	0	0	\N
8267	1348	3995	0	0	\N
8268	1340	4932	0	0	\N
8269	1340	5489	0	0	\N
8270	1340	5727	0	0	\N
8271	1340	5227	0	0	\N
8272	1340	4503	0	0	\N
8273	1340	5829	0	0	\N
8274	1341	5683	0	0	\N
8275	1341	5723	0	0	\N
8276	1341	3945	0	0	\N
8277	1341	5637	0	0	\N
8278	1341	5666	0	0	\N
8279	1341	5174	0	0	\N
8280	1334	5669	0	0	\N
8281	1334	4966	0	0	\N
8282	1334	5697	0	0	\N
8283	1334	5027	0	0	\N
8284	1334	5702	0	0	\N
8285	1334	4320	0	0	\N
8286	1352	5633	0	0	\N
8287	1352	4499	0	0	\N
8288	1352	5593	0	0	\N
8289	1352	5597	0	0	\N
8290	1352	3989	0	0	\N
8291	1352	5733	0	0	\N
8292	1346	5685	0	0	\N
8293	1346	5631	0	0	\N
8294	1346	4315	0	0	\N
8295	1346	4226	0	0	\N
8296	1346	3976	0	0	\N
8297	1346	4635	0	0	\N
8298	1332	5655	0	0	\N
8299	1332	4484	0	0	\N
8300	1332	5175	0	0	\N
8301	1332	5646	0	0	\N
8302	1332	5826	0	0	\N
8303	1332	5827	0	0	\N
8304	1333	4229	0	0	\N
8305	1333	5675	0	0	\N
8306	1333	4219	0	0	\N
8307	1333	4300	0	0	\N
8308	1333	5695	0	0	\N
8309	1333	5825	0	0	\N
8310	1339	4282	0	0	\N
8311	1339	5212	0	0	\N
8312	1339	3994	0	0	\N
8313	1339	5681	0	0	\N
8314	1339	4265	0	0	\N
8315	1339	4014	0	0	\N
8316	1344	5581	0	0	\N
8317	1344	5673	0	0	\N
8318	1344	5572	0	0	\N
8319	1344	3921	0	0	\N
8320	1344	5830	0	0	\N
8321	1344	5654	0	0	\N
8322	1336	5208	0	0	\N
8323	1336	4736	0	0	\N
8324	1336	4583	0	0	\N
8325	1336	5060	0	0	\N
8326	1335	4582	0	0	\N
8327	1335	5030	0	0	\N
8328	1335	4762	0	0	\N
8329	1335	4287	0	0	\N
8330	1335	4597	0	0	\N
8331	1335	4047	0	0	\N
8332	1342	4463	0	0	\N
8333	1342	4492	0	0	\N
8334	1342	4296	0	0	\N
8335	1342	4217	0	0	\N
8336	1342	4207	0	0	\N
8337	1342	5566	0	0	\N
8338	1349	4284	0	0	\N
8339	1349	5573	0	0	\N
8340	1349	4238	0	0	\N
8341	1349	3969	0	0	\N
8342	1349	5268	0	0	\N
8343	1349	4285	0	0	\N
8344	1351	5712	0	0	\N
8345	1351	4002	0	0	\N
8346	1351	4278	0	0	\N
8347	1351	5072	0	0	\N
8348	1351	5823	0	0	\N
8349	1351	5824	0	0	\N
8350	1353	4215	0	0	\N
8351	1353	3992	0	0	\N
8352	1353	3990	0	0	\N
8353	1353	4507	0	0	\N
8354	1353	4216	0	0	\N
8355	1353	5638	0	0	\N
8356	1354	5039	0	0	\N
8357	1354	5362	0	0	\N
8358	1354	5354	0	0	\N
8359	1354	5707	0	0	\N
8360	1354	4768	0	0	\N
8361	1354	5704	0	0	\N
8362	1355	5349	0	0	\N
8363	1355	5360	0	0	\N
8364	1355	5356	0	0	\N
8365	1355	5321	0	0	\N
8366	1355	5359	0	0	\N
8367	1355	5800	0	0	\N
8368	1356	5352	0	0	\N
8369	1356	5317	0	0	\N
8370	1356	5323	0	0	\N
8371	1356	5348	0	0	\N
8372	1356	5313	0	0	\N
8373	1356	5801	0	0	\N
\.


--
-- Data for Name: seasons; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.seasons (id, name) FROM stdin;
2012	2012-13
2013	2013-14
2014	2014-15
2015	2015-16
2016	2016-17
2017	2017-18
2018	2018-19
2019	2019-20
2020	2020-21
2021	2021-22
2022	2022-23
\.


--
-- Data for Name: team_logos; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.team_logos (id, team_id, start_year, end_year, logo) FROM stdin;
2	3	2012	\N	/img/khl/akbars.png
3	18	2012	\N	/img/khl/barys.png
8	14	2012	\N	/img/khl/lev.png
17	6	2012	\N	/img/khl/loko.png
18	5	2012	\N	/img/khl/donbass.png
40	42	2012	\N	/img/cze/ceske.png
19	21	2012	\N	/img/liiga/jokerit.png
20	22	2012	\N	/img/liiga/tappara.png
21	23	2012	\N	/img/liiga/tps.png
22	24	2012	\N	/img/liiga/assat.png
23	25	2012	\N	/img/liiga/hifk.png
24	26	2012	\N	/img/liiga/ilves.png
60	62	2012	\N	/img/nla/lugano.png
61	63	2012	\N	/img/nla/bern.png
62	64	2012	\N	/img/nla/kloten.png
63	65	2012	\N	/img/nla/ambri.png
41	43	2012	\N	/img/del/mannheim.png
42	44	2012	\N	/img/del/koln.png
31	33	2012	\N	/img/shl/skelleftea.png
32	34	2012	\N	/img/shl/djurgarden.png
43	45	2012	\N	/img/del/deg.png
44	46	2012	\N	/img/del/krefeld.png
45	47	2012	\N	/img/del/munchen.png
46	48	2012	\N	/img/del/eisberen.png
25	27	2012	\N	/img/shl/brynas.png
26	28	2012	\N	/img/shl/lulea.png
27	29	2012	\N	/img/shl/modo.png
28	30	2012	\N	/img/shl/farjestad.png
47	49	2012	\N	/img/fra/grenoble.png
48	50	2012	\N	/img/fra/amiens.png
49	51	2012	\N	/img/fra/rouen.png
29	31	2012	\N	/img/shl/frelunda.png
30	32	2012	\N	/img/shl/hv71.png
64	66	2012	\N	/img/nor/storhamar.png
65	67	2012	\N	/img/nor/stjernen.png
66	68	2012	\N	/img/nor/valerenga.png
51	53	2012	\N	/img/ita/asiago.png
7	15	2012	2015	/img/khl/cska.png
34	36	2012	\N	/img/cze/slavia.png
35	37	2012	\N	/img/cze/litvinov.png
99	101	2012	2016	/img/nhl/edmonton.png
37	39	2012	\N	/img/cze/trinec.png
87	89	2012	2015	/img/nhl/pittsburg.png
92	94	2012	2012	/img/nhl/anaheim.png
53	55	2012	\N	/img/ita/pustertal.png
50	52	2012	\N	/img/ita/bolzano.png
52	54	2012	\N	/img/ita/merano.png
14	7	2012	2012	/img/khl/metallurg.png
75	77	2012	\N	/img/den/herning.png
54	56	2012	\N	/img/ebel/vienna.png
55	57	2012	\N	/img/ebel/vsv.png
56	58	2012	\N	/img/ebel/kac.png
57	59	2012	\N	/img/ebel/black_wings.png
70	72	2012	\N	/img/ocb/torpedo.png
67	69	2012	\N	/img/svk/kosice.gif
71	73	2012	\N	/img/ocb/sokol.png
72	74	2012	\N	/img/ocb/grodno.png
73	75	2012	\N	/img/ocb/gomel.png
74	76	2012	\N	/img/ocb/riga.png
58	60	2012	\N	/img/nla/zug.png
59	61	2012	\N	/img/nla/davos.png
68	70	2012	\N	/img/svk/dukla.gif
69	71	2012	\N	/img/svk/zvolen.gif
76	78	2012	\N	/img/den/aalborg.png
1	2	2012	2012	/img/khl/avangard.png
39	41	2012	2012	/img/cze/pardubice.png
9	10	2012	2013	/img/khl/salavat.png
12	11	2012	2013	/img/khl/severstal.png
5	12	2012	2013	/img/khl/ska.png
33	35	2012	2013	/img/cze/sparta.png
6	19	2012	2015	/img/khl/dynamo_mn.png
38	40	2012	2015	/img/cze/vitkovice.png
13	4	2012	2016	/img/khl/dynamo.png
4	9	2012	\N	/img/khl/slovan.png
36	38	2012	2016	/img/cze/zlin.png
81	83	2012	\N	/img/nhl/montreal.png
84	86	2012	\N	/img/nhl/ny-rangers.png
90	92	2012	\N	/img/nhl/washington.png
96	98	2012	\N	/img/nhl/columbus.png
102	104	2012	\N	/img/nhl/nashville.png
119	121	2013	\N	/img/khl/medvescak13.png
77	79	2012	\N	/img/nhl/boston.png
79	81	2012	\N	/img/nhl/carolina.png
82	84	2012	\N	/img/nhl/new-jersey.png
86	88	2012	\N	/img/nhl/philadelphia.png
88	90	2012	\N	/img/nhl/tampa.png
123	126	2013	2015	/img/ahl/toronto13.png
91	93	2012	\N	/img/nhl/winnipeg.png
94	96	2012	\N	/img/nhl/chicago.png
95	97	2012	\N	/img/nhl/colorado.png
132	103	2013	\N	/img/nhl/minnesota13.png
98	100	2012	\N	/img/nhl/detroit.png
100	102	2012	\N	/img/nhl/los-angeles.png
103	105	2012	\N	/img/nhl/arizona.png
104	106	2012	\N	/img/nhl/san-jose.png
105	107	2012	\N	/img/nhl/st-louis.png
106	108	2012	\N	/img/nhl/vancouver.png
152	142	2015	\N	/img/den/sonderjyske15.png
121	124	2013	\N	/img/ocb/kubards13.png
142	111	2014	\N	/img/ahl/manchester14.png
149	139	2015	\N	/img/nla/zsc15.png
107	109	2012	\N	/img/ahl/springfield.png
108	110	2012	\N	/img/ahl/binghamton.png
110	112	2012	\N	/img/ahl/bridgeport.png
111	113	2012	\N	/img/ahl/norfolk.png
112	114	2012	\N	/img/ahl/syracuse.png
113	115	2012	\N	/img/ahl/chicago.png
114	116	2012	\N	/img/ahl/abbotsford.png
155	127	2015	\N	/img/ahl/st_johns15.png
116	118	2012	\N	/img/ahl/lake-erie.png
117	119	2012	\N	/img/ahl/charlotte.png
124	127	2013	2014	/img/ahl/st_johns13.png
134	10	2014	\N	/img/khl/salavat14.png
143	135	2015	\N	/img/khl/sibir15.png
135	11	2014	\N	/img/khl/severstal14.png
136	12	2014	\N	/img/khl/ska14.png
159	145	2015	\N	/img/ahl/hartford15.png
83	85	2012	2016	/img/nhl/ny-islanders.png
122	125	2013	2014	/img/ahl/grand13.png
125	128	2013	\N	/img/ahl/providence13.png
16	17	2012	2012	/img/khl/atlant.png
137	130	2014	\N	/img/shl/djurgarden.png
115	117	2012	2014	/img/ahl/texas.png
127	17	2013	\N	/img/khl/atlant13.png
93	95	2012	2019	/img/nhl/calgary.png
85	87	2012	2019	/img/nhl/ottawa.png
165	19	2016	2018	/img/khl/dynamo_mn16.png
15	20	2012	2019	/img/khl/dynamo_r.png
144	7	2015	2017	/img/khl/metallurg15.png
138	131	2014	\N	/img/del/hamburg14.png
129	41	2013	\N	/img/cze/pardubice13.png
126	7	2013	2014	/img/khl/metallurg13.png
130	94	2013	\N	/img/nhl/anaheim13.png
97	99	2012	2012	/img/nhl/dallas.png
139	132	2014	\N	/img/ita/rittner.png
131	99	2013	\N	/img/nhl/dallas13.png
101	103	2012	2012	/img/nhl/minnesota.png
145	35	2014	\N	/img/cze/sparta14.png
140	133	2014	\N	/img/nhl/arizona14.png
150	140	2015	\N	/img/ocb/arlan15.png
141	134	2014	\N	/img/ahl/san_antonio15.png
109	111	2012	2013	/img/ahl/manchester.png
153	117	2015	\N	/img/ahl/texas15.png
151	141	2015	\N	/img/ocb/donbass15.png
146	136	2015	\N	/img/cze/trinec15.png
147	137	2015	\N	/img/cze/pardubice15.png
148	138	2015	\N	/img/cze/brno15.png
154	120	2015	\N	/img/ahl/milwaukee15.png
118	120	2012	2014	/img/ahl/milwaukee.png
158	144	2015	\N	/img/ahl/san-diego15.png
156	125	2015	\N	/img/ahl/grand15.png
157	143	2015	\N	/img/ahl/ontario15.png
160	146	2015	\N	/img/ahl/hershey15.png
162	148	2015	\N	/img/ahl/rockford15.png
133	129	2014	2015	/img/khl/jokerit14.png
163	129	2016	\N	/img/khl/jokerit16.png
164	15	2016	\N	/img/khl/cska16.png
166	149	2016	\N	/img/liiga/karpat.png
167	40	2016	\N	/img/cze/vitkovice16.png
120	122	2013	2015	/img/ebel/bolzano13.png
80	82	2012	2015	/img/nhl/florida.png
89	91	2012	2015	/img/nhl/toronto.png
128	2	2013	2017	/img/khl/avangard13.png
168	150	2016	\N	/img/alp/pustertal.png
169	151	2016	\N	/img/alp/asiago.png
170	152	2016	\N	/img/alp/zeller.png
171	122	2016	\N	/img/ebel/bolzano16.png
172	153	2016	\N	/img/svk/nitra16.png
173	154	2016	\N	/img/ocb/junost16.png
174	82	2016	\N	/img/nhl/florida16.png
175	89	2016	\N	/img/nhl/pittsburg16.png
176	91	2016	\N	/img/nhl/toronto16.png
178	156	2016	\N	/img/ahl/cleveland16.png
179	126	2016	\N	/img/ahl/toronto16.png
177	155	2016	\N	/img/ahl/tucson16.png
180	4	2017	\N	/img/khl/dynamo17.png
181	157	2017	\N	/img/khl/kunlun17.png
182	158	2017	\N	/img/khl/neftekhimik17.png
183	38	2017	\N	/img/cze/zlin17.png
184	159	2017	\N	/img/cze/plzen17.png
185	160	2017	\N	/img/khl/medvescak13.png
186	101	2017	\N	/img/nhl/edmonton17.png
187	85	2017	\N	/img/nhl/ny-islanders17.png
188	161	2017	\N	/img/nhl/vegas17.png
189	162	2017	\N	/img/ahl/belleville17.png
190	163	2017	\N	/img/ahl/laval17.png
191	2	2018	\N	/img/khl/avangard18.png
192	7	2018	\N	/img/khl/metallurg18.png
193	164	2018	\N	/img/fra/angers18.png
194	165	2018	\N	/img/nor/stavanger18.png
195	166	2018	\N	/img/ocb/junost16.png
197	19	2019	\N	/img/khl/dynamo_mn19.png
198	169	2019	\N	/img/alp/rittner.png
199	170	2019	\N	/img/ebel/graz.png
200	171	2019	\N	/img/svk/slovan.png
10	13	2012	\N	/img/khl/spartak.png
203	174	2020	\N	/img/ocb/olimp.png
204	175	2020	\N	/img/den/rungsted.png
205	176	2020	\N	/img/ahl/iowa.png
207	178	2020	\N	/img/ahl/lehigh.png
206	177	2020	\N	/img/ahl/binghamton_d.png
208	8	2020	\N	/img/khl/traktor20.png
209	179	2021	\N	/img/nhl/seattle.png
78	80	2012	2019	/img/nhl/buffalo.png
210	80	2020	\N	/img/nhl/buffalo20.png
211	95	2020	\N	/img/nhl/calgary20.png
212	87	2020	\N	/img/nhl/ottawa20.png
11	8	2012	2019	/img/khl/traktor.png
214	20	2020	\N	/img/khl/dynamo_r20.png
161	147	2015	2020	/img/ahl/utica15.png
217	147	2021	\N	/img/ahl/utica21.png
218	248	2021	\N	/img/ahl/bridgeport_i.png
219	249	2021	\N	/img/ahl/springfield21.png
220	250	2021	\N	/img/ahl/henderson.png
221	251	2021	\N	/img/ahl/abbotsford_c.png
222	252	2021	\N	/img/ahl/bakersfield.png
223	253	2021	\N	/img/nla/fribourg.png
215	246	2021	\N	/img/ebel/salzburg.png
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.teams (id, nation_id, full_name, name, short_name, start_year, end_year) FROM stdin;
2	1	Avangard Omsk	name	sname	2012	\N
3	1	Ak Bars Kazan	name	sname	2012	\N
4	1	Dynamo Moskva	name	sname	2012	\N
6	1	Lokomotiv Yaroslavl	name	sname	2012	\N
7	1	Metallurg Magnitogorsk	name	sname	2012	\N
8	1	Traktor Chelyabinsk	name	sname	2012	\N
10	1	Salavat Yulaev Ufa	name	sname	2012	\N
41	1	HC CSOB Pojistovna Pardubice	name	sname	2012	2014
12	1	SKA St. Petersburg	name	sname	2012	\N
15	1	CSKA Moskva	name	sname	2012	\N
18	1	Barys Nur-Sultan	name	sname	2012	\N
19	1	Dinamo Minsk	name	sname	2012	\N
20	1	Dinamo Riga	name	sname	2012	\N
47	1	EHC Munchen	name	sname	2012	\N
48	1	Eisbaren Berlin	name	sname	2012	\N
38	1	PSG Zlin	name	sname	2012	\N
42	1	HC Ceske Budejovice	name	sname	2012	2013
22	1	Tappara	name	sname	2012	\N
23	1	TPS	name	sname	2012	\N
9	1	HC Slovan Bratislava	name	sname	2012	2018
25	1	HIFK	name	sname	2012	\N
26	1	Ilves	name	sname	2012	\N
49	1	Grenoble	name	sname	2012	\N
50	1	Amiens	name	sname	2012	\N
51	1	Rouen	name	sname	2012	\N
27	1	Brynas IF	name	sname	2012	\N
28	1	Lulea HF	name	sname	2012	\N
24	1	Assat	name	sname	2012	2017
30	1	Farjestad BK	name	sname	2012	\N
31	1	Frolunda HC	name	sname	2012	\N
32	1	HV71	name	sname	2012	\N
52	1	HC Bolzano	name	sname	2012	2012
76	1	HK Riga 2000	name	sname	2012	2012
55	1	Pustertal/Val Pusteria	name	sname	2012	2015
121	1	Medvescak Zagreb	name	sname	2013	2016
72	1	Kazzinc-Torpedo	name	sname	2012	2014
5	1	Donbass Donetsk	name	sname	2012	2013
54	1	Milano Rossoblu	name	sname	2012	2014
37	1	HC Litvinov	name	sname	2012	\N
74	1	Neman Grodno	name	sname	2012	2014
40	1	HC Vitkovice Steel	name	sname	2012	\N
36	1	HC Slavia Praha	name	sname	2012	2014
39	1	HC Ocelari Trinec	name	sname	2012	2013
66	1	Storhamar	name	sname	2012	\N
67	1	Stjernen Hockey	name	sname	2012	\N
43	1	Adler Mannheim	name	sname	2012	\N
68	1	Valerenga	name	sname	2012	\N
46	1	Krefeld Pinguine	name	sname	2012	\N
44	1	Kolner Haie	name	sname	2012	\N
45	1	Dusseldorfer EG	name	sname	2012	\N
56	1	Vienna Capitals	name	sname	2012	\N
57	1	Villacher SV	name	sname	2012	\N
58	1	Klagenfurter AC	name	sname	2012	\N
59	1	EHC Linz	name	sname	2012	\N
17	1	Atlant Mytishchi	name	sname	2012	2014
53	1	Asiago	name	sname	2012	2015
75	1	HK Gomel	name	sname	2012	\N
69	1	HC Kosice	name	sname	2012	\N
70	1	HK Dukla Trencin	name	sname	2012	\N
71	1	HKM Zvolen	name	sname	2012	\N
60	1	EV Zug	name	sname	2012	\N
61	1	HC Davos	name	sname	2012	\N
62	1	HC Lugano	name	sname	2012	\N
63	1	SC Bern	name	sname	2012	\N
65	1	HC Ambri-Piotta	name	sname	2012	\N
64	1	Kloten Flyers	name	sname	2012	\N
77	1	Herning Blue Fox	name	sname	2012	\N
29	1	MODO Hockey	name	sname	2012	2016
78	1	Aalborg Pirates	name	sname	2012	\N
14	1	HC Lev Praha	name	sname	2012	2013
21	1	Jokerit	name	sname	2012	2013
11	1	Severstal Cherepovets	name	sname	2012	2014
83	1	Montreal Canadiens	name	sname	2012	\N
85	1	New York Islanders	name	sname	2012	\N
88	1	Philadelphia Flyers	name	sname	2012	\N
91	1	Toronto Maple Leafs	name	sname	2012	\N
95	1	Calgary Flames	name	sname	2012	\N
98	1	Columbus Blue Jackets	name	sname	2012	\N
100	1	Detroit Red Wings	name	sname	2012	\N
103	1	Minnesota Wild	name	sname	2012	\N
34	1	Djurgardens IF	name	sname	2012	2012
152	1	EK Zell am See	name	sname	2016	\N
122	1	HC Bolzano	name	sname	2013	\N
79	1	Boston Bruins	name	sname	2012	\N
80	1	Buffalo Sabres	name	sname	2012	\N
81	1	Carolina Hurricanes	name	sname	2012	\N
82	1	Florida Panthers	name	sname	2012	\N
84	1	New Jersey Devils	name	sname	2012	\N
86	1	New York Rangers	name	sname	2012	\N
87	1	Ottawa Senators	name	sname	2012	\N
89	1	Pittsburgh Penguins	name	sname	2012	\N
90	1	Tampa Bay Lightning	name	sname	2012	\N
92	1	Washington Capitals	name	sname	2012	\N
93	1	Winnipeg Jets	name	sname	2012	\N
94	1	Anaheim Ducks	name	sname	2012	\N
96	1	Chicago Blackhawks	name	sname	2012	\N
97	1	Colorado Avalanche	name	sname	2012	\N
99	1	Dallas Stars	name	sname	2012	\N
101	1	Edmonton Oilers	name	sname	2012	\N
102	1	Los Angeles Kings	name	sname	2012	\N
104	1	Nashville Predators	name	sname	2012	\N
106	1	San Jose Sharks	name	sname	2012	\N
107	1	St. Louis Blues	name	sname	2012	\N
108	1	Vancouver Canucks	name	sname	2012	\N
124	1	HK Kurbads	name	sname	2013	\N
157	1	Kunlun Red Star	name	sname	2017	\N
128	1	Providence Bruins	name	sname	2013	\N
158	1	Neftekhimik Nizhnekamsk	name	sname	2017	\N
126	1	Toronto Marlies	name	sname	2013	\N
125	1	Grand Rapids Griffins	name	sname	2013	\N
159	1	HC Plzen	name	sname	2017	\N
112	1	Bridgeport Sound Tigers	name	sname	2012	\N
143	1	Ontario Reign	name	sname	2015	\N
114	1	Syracuse Crunch	name	sname	2012	\N
115	1	Chicago Wolves	name	sname	2012	\N
144	1	San Diego Gulls	name	sname	2015	\N
117	1	Texas Stars	name	sname	2012	\N
119	1	Charlotte Checkers	name	sname	2012	\N
120	1	Milwaukee Admirals	name	sname	2012	\N
35	1	HC Sparta Praha	name	sname	2012	\N
105	1	Phoenix Coyotes	name	sname	2012	2013
116	1	Abbotsford Heat	name	sname	2012	2013
129	1	Jokerit	name	sname	2014	\N
130	1	Djurgardens IF	name	sname	2014	\N
145	1	Hartford Wolf Pack	name	sname	2015	\N
155	1	Tucson Roadrunners	name	sname	2016	\N
133	1	Arizona Coyotes	name	sname	2014	\N
134	1	San Antonio Rampage	name	sname	2014	\N
111	1	Manchester Monarchs	name	sname	2012	2014
113	1	Norfolk Admirals	name	sname	2012	2014
135	1	Sibir Novosibirsk	name	sname	2015	\N
136	1	HC Ocelari Trinec	name	sname	2015	\N
137	1	HC Dynamo Pardubice	name	sname	2015	\N
156	1	Cleveland Monsters	name	sname	2016	\N
139	1	ZSC Lions	name	sname	2015	\N
140	1	Arlan Kokshetau	name	sname	2015	\N
146	1	Hershey Bears	name	sname	2015	\N
141	1	Donbass Donetsk	name	sname	2015	\N
147	1	Utica Comets	name	sname	2015	\N
142	1	SonderjyskE	name	sname	2015	\N
73	1	Sokol Kiev	name	sname	2012	\N
148	1	Rockford IceHogs	name	sname	2015	\N
138	1	HC Kometa Brno	name	sname	2015	2015
131	1	Hamburg Freezers	name	sname	2014	2015
132	1	Ritten/Renon	name	sname	2014	2015
118	1	Lake Erie Monsters	name	sname	2012	2015
109	1	Springfield Falcons	name	sname	2012	2015
149	1	Karpat	name	sname	2016	\N
153	1	HK Nitra	name	sname	2016	2016
154	1	Yunost Minsk	name	sname	2016	2016
150	1	Pustertal/Val Pusteria	name	sname	2016	\N
151	1	Asiago	name	sname	2016	\N
110	1	Binghamton Senators	name	sname	2012	2016
127	1	St. John's IceCaps	name	sname	2013	2016
162	1	Belleville Senators	name	sname	2017	\N
163	1	Laval Rocket	name	sname	2017	\N
161	1	Vegas Golden Knights	name	sname	2017	\N
166	1	Yunost Minsk	name	sname	2018	\N
164	1	Angers	name	sname	2018	2018
169	1	Ritten/Renon	name	sname	2019	\N
160	1	Medvescak Zagreb	name	sname	2017	2018
170	1	Graz 99	name	sname	2019	\N
171	1	HC Slovan Bratislava	name	sname	2019	\N
13	1	Spartak Moskva	name	sname	2012	\N
174	1	Olimp Riga	name	sname	2020	\N
175	1	Rungsted	name	sname	2020	\N
176	1	Iowa Wild	name	sname	2020	\N
177	1	Binghamton Devils	name	sname	2020	\N
178	1	Lehigh Valley Phantoms	name	sname	2020	\N
179	1	Seattle Kraken	name	sname	2021	\N
245	1	Matti hjghjgjg	name	sname	2020	2022
248	1	Bridgeport Islanders	name	sname	2021	\N
249	1	Springfield Thunderbirds	name	sname	2021	\N
250	1	Henderson Silver Knights	name	sname	2021	\N
251	1	Abbotsford Canucks	name	sname	2021	\N
252	1	Bakersfield Condors	name	sname	2021	\N
33	1	Skelleftea AIK	name	sname	2012	\N
165	1	Stavanger Oilers	name	sname	2018	\N
253	1	HC Fribourg-Gotteron	name	sname	2021	\N
246	1	EC Salzburg	name	sname	2021	\N
\.


--
-- Data for Name: teams_tournaments; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.teams_tournaments (id, tournament_id, team_id, games, wins, ties, losts, goals_for, goals_against, postseason) FROM stdin;
1	1	5	31	22	1	26	3	21	\N
2	1	17	20	24	24	22	30	21	\N
3	1	14	6	28	22	10	13	4	\N
4	1	11	20	12	19	33	13	7	\N
5	1	13	12	18	34	4	27	37	\N
6	1	2	1	17	28	3	29	28	\N
7	1	3	10	11	14	13	34	27	\N
8	1	4	5	31	8	19	17	17	\N
9	1	6	28	10	38	7	23	30	\N
10	1	7	34	23	22	22	38	37	\N
11	1	8	25	3	28	34	30	10	\N
12	1	10	20	25	8	32	27	38	\N
13	1	12	6	29	3	17	18	6	\N
14	1	15	8	7	36	20	7	39	\N
15	1	18	24	16	19	19	38	1	\N
16	1	19	31	3	34	6	19	6	\N
17	1	20	19	21	32	1	37	13	\N
18	1	9	19	36	14	10	16	29	\N
19	2	24	14	22	17	5	25	2	\N
20	2	21	19	13	17	21	21	26	\N
21	2	22	18	37	21	15	35	25	\N
22	2	23	38	11	1	31	23	32	\N
23	2	25	10	30	17	38	12	19	\N
24	2	26	26	3	1	36	36	3	\N
25	3	30	20	4	5	36	16	24	\N
26	3	31	4	21	9	40	19	11	\N
27	3	32	32	20	11	37	3	8	\N
28	3	33	32	9	29	33	8	20	\N
29	3	29	6	38	39	8	4	19	\N
30	3	34	39	25	40	16	4	16	\N
31	3	27	8	2	28	37	27	24	\N
32	3	28	27	8	30	33	23	18	\N
33	4	37	38	2	9	39	18	29	\N
34	4	40	25	33	13	2	36	25	\N
35	4	36	23	14	19	11	12	3	\N
36	4	39	4	2	3	17	15	26	\N
37	4	35	30	27	30	23	14	6	\N
38	4	41	4	21	15	20	12	17	\N
39	4	38	39	2	40	25	20	10	\N
40	4	42	38	2	11	14	27	18	\N
41	5	43	10	32	19	17	29	37	\N
42	5	46	6	21	38	31	36	12	\N
43	5	44	9	21	19	5	17	2	\N
44	5	45	27	29	10	26	20	29	\N
45	5	47	4	11	6	33	2	21	\N
46	5	48	15	9	32	18	39	7	\N
47	6	49	17	10	39	5	21	25	\N
48	6	50	29	14	27	38	5	33	\N
49	6	51	1	8	29	16	11	27	\N
50	7	52	19	14	22	24	9	16	\N
51	7	55	4	37	33	28	5	27	\N
52	7	54	17	4	37	3	10	8	\N
53	7	53	34	6	18	1	31	38	\N
54	8	56	26	34	16	4	13	11	\N
55	8	57	16	38	34	28	4	2	\N
56	8	58	24	26	40	40	19	20	\N
57	8	59	37	38	4	1	28	26	\N
58	9	60	18	34	39	22	27	12	\N
59	9	61	29	21	32	15	27	10	\N
60	9	62	9	14	30	22	34	30	\N
61	9	63	24	27	34	16	17	38	\N
62	9	65	20	40	39	11	13	31	\N
63	9	64	5	35	40	23	4	2	\N
64	10	66	30	33	33	10	28	25	\N
65	10	67	34	7	25	4	28	13	\N
66	10	68	13	30	35	37	23	7	\N
67	11	69	40	2	17	4	31	3	\N
68	11	70	39	14	30	37	34	12	\N
69	11	71	40	19	19	26	3	22	\N
70	12	76	31	15	5	10	8	26	\N
71	12	72	35	31	24	6	19	14	\N
72	12	74	17	23	38	20	34	26	\N
73	12	73	19	8	19	14	36	4	\N
74	12	75	21	1	24	34	26	10	\N
75	13	77	10	29	17	10	22	9	\N
76	13	78	18	6	30	37	8	30	\N
77	14	83	17	6	11	13	31	37	\N
78	14	85	16	38	2	29	33	8	\N
79	14	88	31	19	26	21	9	27	\N
80	14	91	16	16	28	20	10	15	\N
81	14	95	12	29	3	7	33	21	\N
82	14	98	4	2	25	33	34	15	\N
83	14	100	33	23	28	17	15	31	\N
84	14	103	30	23	6	38	10	6	\N
85	14	79	37	9	16	17	18	12	\N
86	14	80	28	14	28	34	22	29	\N
87	14	81	4	24	33	39	35	13	\N
88	14	82	17	4	38	17	18	35	\N
89	14	84	35	14	31	25	7	8	\N
90	14	86	37	35	28	22	10	10	\N
91	14	87	37	20	34	7	28	2	\N
92	14	89	34	18	27	23	13	22	\N
93	14	90	4	14	17	29	34	15	\N
94	14	92	38	35	26	17	29	25	\N
95	14	93	21	11	39	4	40	3	\N
96	14	94	10	38	19	21	24	31	\N
97	14	96	36	23	5	35	39	35	\N
98	14	97	14	17	28	19	20	29	\N
99	14	99	23	3	1	11	4	17	\N
100	14	101	38	24	12	37	39	13	\N
101	14	102	4	1	26	33	29	5	\N
102	14	104	20	6	37	16	5	31	\N
103	14	106	30	5	22	27	18	26	\N
104	14	107	24	10	17	21	31	15	\N
105	14	108	32	4	34	12	6	24	\N
106	14	105	39	32	1	23	3	31	\N
107	15	112	16	9	30	13	25	4	\N
108	15	114	14	5	18	36	25	18	\N
109	15	115	33	40	39	37	36	22	\N
110	15	117	14	1	14	16	2	4	\N
111	15	119	15	4	9	32	37	15	\N
112	15	120	37	22	23	35	27	5	\N
113	15	116	21	18	27	20	24	15	\N
114	15	111	39	16	17	29	22	12	\N
115	15	113	9	18	3	11	33	21	\N
116	15	118	22	8	25	15	4	29	\N
117	15	109	5	5	2	31	5	23	\N
118	15	110	19	40	15	2	17	3	\N
237	16	2	30	23	25	36	31	15	\N
238	16	3	20	30	38	2	7	27	\N
239	16	4	20	30	11	27	8	10	\N
240	16	6	9	22	34	14	13	10	\N
241	16	7	14	37	7	23	34	22	\N
242	16	8	1	32	33	16	3	39	\N
243	16	10	5	37	34	36	8	11	\N
244	16	12	7	3	31	33	28	2	\N
245	16	15	8	1	35	24	6	29	\N
246	16	18	13	16	1	10	9	27	\N
247	16	19	11	36	39	26	11	39	\N
248	16	20	16	40	25	37	36	39	\N
249	16	9	10	18	1	37	3	38	\N
250	16	5	16	38	7	40	25	39	\N
251	16	17	36	9	30	24	19	20	\N
252	16	14	38	23	27	9	35	37	\N
253	16	11	5	23	29	12	36	4	\N
254	16	13	15	23	17	20	36	27	\N
255	16	121	3	30	35	14	4	24	\N
256	17	22	15	19	20	12	3	31	\N
257	17	23	21	20	19	21	19	12	\N
258	17	25	21	8	7	4	1	6	\N
259	17	26	9	5	24	19	16	19	\N
260	17	24	10	3	16	39	32	20	\N
261	17	21	30	39	33	7	1	10	\N
262	18	27	29	33	32	29	23	34	\N
263	18	28	14	6	30	38	12	12	\N
264	18	30	14	14	1	2	18	35	\N
265	18	31	37	39	2	14	36	15	\N
266	18	32	20	5	25	16	35	11	\N
267	18	29	25	40	33	40	12	3	\N
268	19	41	23	19	18	17	39	20	\N
269	19	38	21	7	2	40	8	8	\N
270	19	42	35	14	7	10	15	9	\N
271	19	37	17	3	7	27	33	37	\N
272	19	40	6	1	34	9	15	27	\N
273	19	36	28	16	35	26	25	3	\N
274	19	39	31	1	7	24	27	11	\N
275	19	35	5	27	33	25	13	21	\N
276	20	47	12	36	24	27	14	14	\N
277	20	48	14	29	2	7	9	17	\N
278	20	43	2	3	4	19	34	14	\N
279	20	46	1	38	32	5	2	40	\N
280	20	44	10	21	40	34	8	39	\N
281	20	45	6	12	7	24	6	38	\N
282	21	49	24	8	29	18	36	30	\N
283	21	50	37	26	15	40	26	40	\N
284	21	51	27	26	14	8	9	38	\N
285	22	55	14	37	16	1	26	18	\N
286	22	54	15	28	28	27	38	1	\N
287	22	53	1	16	20	4	6	19	\N
288	23	56	1	30	40	21	5	26	\N
289	23	57	20	5	26	18	25	1	\N
290	23	58	40	31	14	15	22	11	\N
291	23	59	35	33	22	10	30	38	\N
292	23	122	13	21	31	8	10	31	\N
293	24	60	24	12	35	16	39	1	\N
294	24	61	4	11	34	37	17	12	\N
295	24	62	6	28	25	31	27	34	\N
296	24	63	1	2	9	10	14	15	\N
297	24	65	8	13	37	40	25	40	\N
298	24	64	9	7	27	5	7	36	\N
299	25	66	5	32	17	30	16	21	\N
300	25	67	4	19	1	21	7	4	\N
301	25	68	16	27	24	23	9	4	\N
302	26	69	24	40	36	36	28	33	\N
303	26	70	15	36	18	12	5	12	\N
304	26	71	34	5	13	16	18	20	\N
305	27	72	11	31	22	37	10	38	\N
306	27	74	14	17	7	5	38	14	\N
307	27	73	31	4	40	34	16	31	\N
308	27	75	21	22	34	3	9	28	\N
309	27	124	4	33	32	18	5	33	\N
310	28	77	36	21	7	5	19	23	\N
311	28	78	14	8	33	24	27	22	\N
312	29	83	6	36	1	24	36	16	\N
313	29	85	9	10	13	4	39	10	\N
314	29	88	10	39	25	19	9	1	\N
315	29	91	15	25	10	8	13	37	\N
316	29	95	31	9	1	10	29	10	\N
317	29	98	3	14	25	26	13	26	\N
318	29	100	8	28	19	18	33	16	\N
319	29	103	17	12	33	12	8	37	\N
320	29	79	3	23	24	27	15	25	\N
321	29	80	19	19	5	5	18	4	\N
322	29	81	35	23	19	24	6	12	\N
323	29	82	13	14	15	9	13	8	\N
324	29	84	27	2	4	21	12	17	\N
325	29	86	7	5	22	5	28	10	\N
326	29	87	32	4	38	11	38	38	\N
327	29	89	20	26	12	26	39	7	\N
328	29	90	28	40	31	8	16	15	\N
329	29	92	11	6	31	27	9	7	\N
330	29	93	36	20	20	19	27	9	\N
331	29	94	35	34	22	1	32	34	\N
332	29	96	11	15	19	19	17	7	\N
333	29	97	24	29	36	9	26	22	\N
334	29	99	34	11	5	7	14	40	\N
335	29	101	13	16	30	25	17	2	\N
336	29	102	14	25	32	8	6	5	\N
337	29	104	1	8	32	26	32	12	\N
338	29	106	29	32	35	31	17	19	\N
339	29	107	2	15	33	7	5	38	\N
340	29	108	8	23	3	15	19	29	\N
341	29	105	38	24	37	34	40	29	\N
342	30	112	15	5	38	5	3	31	\N
343	30	114	13	36	8	32	19	27	\N
344	30	115	18	28	23	40	29	18	\N
345	30	117	19	12	34	40	3	13	\N
346	30	119	23	22	30	9	22	35	\N
347	30	120	25	21	32	29	32	35	\N
348	30	116	40	37	15	33	9	31	\N
349	30	111	1	8	22	24	35	34	\N
350	30	113	33	39	33	6	23	17	\N
351	30	118	28	6	14	40	37	14	\N
352	30	109	36	40	26	24	34	26	\N
353	30	110	40	1	40	22	13	37	\N
354	30	125	25	8	18	31	34	33	\N
355	30	128	14	5	28	6	5	30	\N
356	30	127	22	35	38	2	19	32	\N
357	30	126	28	30	36	28	10	24	\N
358	31	2	21	24	24	34	9	40	\N
359	31	3	9	14	22	15	38	30	\N
360	31	4	4	10	25	34	16	6	\N
361	31	6	31	35	1	2	22	14	\N
362	31	7	39	11	24	32	17	3	\N
363	31	8	24	31	40	10	16	22	\N
364	31	10	7	14	28	18	10	27	\N
365	31	12	4	21	19	1	36	16	\N
366	31	15	14	5	38	31	10	10	\N
367	31	18	39	14	23	8	1	28	\N
368	31	19	3	28	6	17	27	27	\N
369	31	20	29	39	11	19	30	3	\N
370	31	9	28	22	33	33	31	25	\N
371	31	17	27	33	12	5	36	3	\N
372	31	11	2	29	10	3	22	6	\N
373	31	129	19	17	1	5	6	25	\N
374	31	121	21	33	38	35	18	26	\N
375	32	22	31	30	1	19	4	1	\N
376	32	23	29	15	18	6	17	20	\N
377	32	25	12	31	30	31	20	36	\N
378	32	26	11	32	10	23	30	9	\N
379	32	24	4	31	37	4	26	40	\N
380	33	27	38	7	5	2	14	16	\N
381	33	28	28	23	8	19	6	27	\N
382	33	30	7	28	34	11	4	37	\N
383	33	31	25	8	2	7	32	22	\N
384	33	32	27	27	17	17	8	40	\N
385	33	29	3	28	24	31	18	16	\N
386	33	130	33	13	12	23	4	12	\N
387	34	41	39	13	5	1	33	12	\N
388	34	38	23	23	27	16	9	35	\N
389	34	37	11	7	34	24	15	35	\N
390	34	40	36	19	17	17	19	1	\N
391	34	36	30	26	8	12	2	34	\N
392	34	35	10	6	10	12	37	15	\N
393	35	47	9	12	4	1	22	37	\N
394	35	48	6	9	32	16	5	15	\N
395	35	43	32	31	26	17	18	25	\N
396	35	46	37	4	34	26	20	26	\N
397	35	44	7	2	34	33	4	21	\N
398	35	45	32	38	17	40	16	33	\N
399	35	131	15	19	14	24	9	24	\N
400	36	49	20	39	16	40	16	37	\N
401	36	50	35	11	35	34	22	1	\N
402	36	51	40	2	36	37	2	26	\N
403	37	55	36	10	21	1	2	40	\N
404	37	54	9	39	29	12	35	33	\N
405	37	53	12	39	12	12	14	10	\N
406	37	132	39	32	29	18	12	23	\N
407	38	56	32	10	28	25	31	9	\N
408	38	57	34	16	20	25	5	18	\N
409	38	58	30	28	39	40	27	40	\N
410	38	59	8	27	10	29	18	29	\N
411	38	122	19	1	31	14	36	40	\N
412	39	60	14	4	40	40	37	18	\N
413	39	61	10	19	24	33	25	18	\N
414	39	62	28	26	40	22	16	33	\N
415	39	63	22	28	16	15	20	3	\N
416	39	65	37	31	34	10	4	15	\N
417	39	64	27	31	32	24	17	15	\N
418	40	66	4	20	24	7	29	7	\N
419	40	67	16	31	2	28	11	7	\N
420	40	68	38	3	2	36	32	34	\N
421	41	69	25	8	38	38	7	5	\N
422	41	70	23	8	30	15	22	8	\N
423	41	71	6	26	21	21	38	29	\N
424	42	72	14	25	19	15	37	28	\N
425	42	74	3	24	40	3	33	16	\N
426	42	75	5	19	11	12	10	16	\N
427	42	124	31	19	13	3	31	15	\N
428	43	77	20	12	29	40	31	24	\N
429	43	78	20	14	22	20	36	23	\N
430	44	83	18	5	21	32	11	34	\N
431	44	85	35	19	27	11	29	36	\N
432	44	88	29	16	22	33	14	27	\N
433	44	91	30	31	8	32	31	39	\N
434	44	95	34	16	37	34	33	35	\N
435	44	98	28	16	6	40	7	9	\N
436	44	100	14	10	25	21	15	40	\N
437	44	103	2	13	1	34	7	25	\N
438	44	79	25	6	30	19	36	22	\N
439	44	80	39	30	2	15	23	2	\N
440	44	81	12	28	37	27	12	12	\N
441	44	82	29	25	12	33	5	30	\N
442	44	84	1	7	1	1	35	18	\N
443	44	86	25	29	8	27	17	38	\N
444	44	87	3	13	2	30	34	2	\N
445	44	89	16	27	4	5	14	15	\N
446	44	90	38	17	7	20	31	25	\N
447	44	92	14	12	23	8	9	3	\N
448	44	93	31	18	38	22	28	26	\N
449	44	94	32	9	34	27	9	31	\N
450	44	96	18	38	38	26	6	22	\N
451	44	97	1	4	11	10	22	19	\N
452	44	99	21	10	18	13	14	22	\N
453	44	101	22	27	15	11	28	6	\N
454	44	102	30	36	35	5	25	6	\N
455	44	104	17	28	14	25	17	12	\N
456	44	106	5	40	17	7	13	36	\N
457	44	107	11	24	23	24	34	25	\N
458	44	108	38	6	10	15	2	2	\N
459	44	133	15	5	3	32	13	16	\N
460	45	112	22	39	18	13	13	24	\N
461	45	114	34	29	29	30	22	3	\N
462	45	115	9	25	15	31	2	28	\N
463	45	117	29	9	38	5	7	11	\N
464	45	119	11	9	9	28	10	2	\N
465	45	120	33	9	32	30	15	20	\N
466	45	111	35	19	38	18	32	38	\N
467	45	113	16	6	19	18	36	18	\N
468	45	118	11	9	31	10	18	23	\N
469	45	109	16	10	31	12	1	9	\N
470	45	110	14	15	12	3	31	1	\N
471	45	134	15	14	24	12	6	1	\N
472	45	128	24	40	25	18	9	6	\N
473	45	127	7	29	5	34	5	6	\N
474	45	125	16	18	21	40	31	16	\N
475	45	126	32	13	27	2	19	13	\N
476	46	2	25	36	40	14	21	33	\N
477	46	3	8	23	37	35	5	16	\N
478	46	4	23	24	36	16	39	39	\N
479	46	6	24	33	26	17	29	11	\N
480	46	7	17	31	22	9	36	4	\N
481	46	8	27	31	39	5	4	9	\N
482	46	10	8	25	18	9	28	38	\N
483	46	12	18	28	29	39	30	30	\N
484	46	15	8	25	23	4	32	35	\N
485	46	18	17	4	19	15	40	19	\N
486	46	19	39	29	25	19	36	19	\N
487	46	20	17	22	32	15	13	12	\N
488	46	9	28	13	2	38	13	28	\N
489	46	129	22	14	22	31	27	19	\N
490	46	135	30	28	10	31	18	13	\N
491	46	121	39	37	13	38	20	14	\N
492	47	22	4	40	36	33	15	9	\N
493	47	23	20	6	17	31	9	25	\N
494	47	25	32	4	34	30	36	10	\N
495	47	26	28	37	28	26	12	15	\N
496	47	24	22	24	22	19	2	38	\N
497	48	27	37	26	26	17	19	2	\N
498	48	28	23	8	24	37	26	25	\N
499	48	30	2	22	10	40	22	5	\N
500	48	31	39	17	30	10	39	7	\N
501	48	32	29	31	22	27	40	17	\N
502	48	29	4	19	16	26	30	39	\N
503	48	130	16	39	1	37	25	20	\N
504	49	38	24	24	28	1	30	11	\N
505	49	37	38	5	13	21	3	1	\N
506	49	40	34	13	28	16	14	32	\N
507	49	35	22	9	31	18	24	25	\N
508	49	136	24	6	36	24	4	7	\N
509	49	137	40	22	25	18	19	1	\N
510	49	138	21	30	12	11	26	38	\N
511	50	47	25	19	1	4	11	3	\N
512	50	48	36	17	6	27	3	18	\N
513	50	43	40	21	18	18	22	17	\N
514	50	46	29	18	16	9	28	26	\N
515	50	44	39	35	28	20	40	4	\N
516	50	45	20	18	22	28	11	12	\N
517	50	131	30	39	19	36	37	39	\N
518	51	49	28	2	4	13	32	38	\N
519	51	50	2	9	2	19	31	12	\N
520	51	51	4	18	11	20	3	9	\N
521	52	55	10	16	1	6	17	15	\N
522	52	53	38	23	9	10	40	7	\N
523	52	132	21	11	12	27	19	24	\N
524	53	56	11	30	9	16	25	4	\N
525	53	57	19	25	2	17	13	20	\N
526	53	58	16	6	20	30	34	39	\N
527	53	59	12	22	10	10	2	25	\N
528	53	122	1	35	7	6	6	35	\N
529	54	60	3	3	40	7	3	33	\N
530	54	61	36	6	6	38	27	13	\N
531	54	62	35	8	14	27	3	11	\N
532	54	63	33	27	15	10	15	16	\N
533	54	65	9	21	2	4	34	34	\N
534	54	64	28	23	34	20	21	27	\N
535	54	139	32	6	16	6	32	15	\N
536	55	66	27	8	18	5	1	11	\N
537	55	67	20	4	13	11	1	40	\N
538	55	68	30	10	25	17	38	5	\N
539	56	69	2	35	35	14	35	23	\N
540	56	70	7	26	14	26	19	16	\N
541	56	71	35	35	9	15	20	39	\N
542	57	75	38	9	4	3	32	3	\N
543	57	124	34	30	39	8	22	33	\N
544	57	140	4	27	33	9	22	9	\N
545	57	141	17	32	20	1	13	36	\N
546	58	77	31	34	24	35	26	24	\N
547	58	78	32	6	16	17	32	1	\N
548	58	142	4	5	6	12	13	30	\N
549	59	83	29	33	12	22	38	11	\N
550	59	85	18	31	8	13	22	7	\N
551	59	88	40	11	39	40	9	5	\N
552	59	91	23	6	20	11	24	10	\N
553	59	95	33	2	33	15	1	40	\N
554	59	98	1	9	13	1	39	6	\N
555	59	100	10	10	34	27	27	10	\N
556	59	103	40	37	28	33	19	29	\N
557	59	79	33	39	17	25	27	25	\N
558	59	80	10	7	20	38	27	37	\N
559	59	81	22	29	23	31	15	15	\N
560	59	82	10	28	18	24	1	27	\N
561	59	84	16	27	32	18	39	6	\N
562	59	86	17	10	32	15	17	8	\N
563	59	87	29	40	26	16	10	19	\N
564	59	89	23	8	30	8	15	5	\N
565	59	90	39	14	2	24	10	34	\N
566	59	92	18	32	31	14	3	14	\N
567	59	93	40	5	33	35	8	39	\N
568	59	94	22	17	4	30	9	36	\N
569	59	96	35	19	33	38	36	1	\N
570	59	97	4	19	12	30	12	21	\N
571	59	99	15	27	17	25	5	13	\N
572	59	101	36	6	31	33	12	1	\N
573	59	102	20	22	40	38	17	13	\N
574	59	104	20	6	25	15	4	20	\N
575	59	106	25	34	32	38	16	14	\N
576	59	107	20	5	2	24	24	24	\N
577	59	108	15	39	6	27	21	27	\N
578	59	133	38	34	1	23	14	13	\N
579	60	112	11	26	26	40	34	19	\N
580	60	114	12	9	15	24	35	1	\N
581	60	115	6	34	15	34	25	29	\N
582	60	117	25	14	21	25	2	40	\N
583	60	119	27	39	5	36	29	19	\N
584	60	120	38	39	33	24	3	2	\N
585	60	118	5	23	35	23	1	14	\N
586	60	109	15	34	25	21	9	20	\N
587	60	110	25	26	19	36	39	4	\N
588	60	143	34	36	29	8	27	16	\N
589	60	145	7	28	12	10	30	30	\N
590	60	146	13	23	7	16	28	17	\N
591	60	147	21	6	35	18	32	8	\N
592	60	148	12	19	12	30	20	21	\N
593	60	126	13	32	6	25	19	39	\N
594	60	144	19	33	9	2	17	11	\N
595	60	127	2	4	28	21	36	2	\N
596	60	128	18	30	38	7	28	18	\N
597	60	134	40	34	33	37	38	19	\N
598	60	125	37	21	24	6	1	33	\N
599	61	2	6	21	28	22	3	23	\N
600	61	3	39	10	9	2	36	22	\N
601	61	4	24	39	2	35	21	17	\N
602	61	6	12	33	32	15	14	10	\N
603	61	7	28	14	12	22	6	8	\N
604	61	8	11	31	26	12	30	10	\N
605	61	10	25	28	11	6	33	39	\N
606	61	12	14	32	3	30	31	20	\N
607	61	15	8	29	2	34	22	25	\N
608	61	18	2	8	1	6	7	13	\N
609	61	19	6	30	14	8	5	21	\N
610	61	20	1	32	23	22	30	27	\N
611	61	9	17	8	23	13	7	5	\N
612	61	129	5	35	32	36	1	17	\N
613	61	135	35	37	16	6	10	24	\N
614	61	121	38	11	4	28	7	39	\N
615	62	22	22	2	35	14	9	5	\N
616	62	23	25	37	13	11	28	34	\N
617	62	25	15	21	10	11	25	27	\N
618	62	26	10	38	1	17	16	22	\N
619	62	24	24	22	34	24	32	22	\N
620	62	149	25	25	16	25	9	8	\N
621	63	27	23	9	6	35	22	9	\N
622	63	28	34	9	32	24	32	6	\N
623	63	30	20	37	36	3	2	39	\N
624	63	31	1	22	26	23	35	15	\N
625	63	32	34	28	21	2	9	24	\N
626	63	29	11	24	20	40	39	20	\N
627	63	130	16	12	26	26	19	24	\N
628	64	38	25	30	26	31	33	7	\N
629	64	37	38	37	23	12	18	24	\N
630	64	40	13	38	21	35	30	19	\N
631	64	35	6	40	27	33	32	8	\N
632	64	136	26	35	26	8	28	2	\N
633	64	137	6	2	24	33	35	1	\N
634	65	47	21	39	10	15	4	12	\N
635	65	48	1	24	33	12	23	13	\N
636	65	43	38	29	16	21	24	9	\N
637	65	46	27	7	11	31	24	40	\N
638	65	44	9	40	39	15	37	22	\N
639	65	45	24	33	1	24	34	33	\N
640	66	49	17	5	33	29	15	18	\N
641	66	50	24	21	3	28	23	7	\N
642	66	51	24	37	24	9	9	26	\N
643	67	56	26	5	11	30	26	19	\N
644	67	57	8	29	14	29	33	13	\N
645	67	58	12	1	28	13	12	6	\N
646	67	59	31	23	10	40	32	38	\N
647	67	122	35	14	17	31	28	25	\N
648	68	60	37	40	22	36	13	28	\N
649	68	61	31	39	33	33	27	37	\N
650	68	62	8	11	14	5	5	10	\N
651	68	63	37	21	29	12	12	4	\N
652	68	65	5	1	12	21	25	27	\N
653	68	64	30	27	33	17	5	13	\N
654	68	139	32	16	24	21	11	21	\N
655	69	66	27	30	21	32	9	19	\N
656	69	67	24	22	29	30	24	23	\N
657	69	68	10	13	5	38	26	22	\N
658	70	69	5	40	25	29	19	7	\N
659	70	70	18	12	38	31	24	34	\N
660	70	71	25	34	30	2	26	3	\N
661	70	153	16	34	8	15	4	11	\N
662	71	75	27	34	29	38	40	32	\N
663	71	124	21	39	10	38	21	34	\N
664	71	140	9	38	26	12	34	34	\N
665	71	141	28	13	18	37	36	16	\N
666	71	154	28	4	4	20	31	33	\N
667	72	77	4	2	20	25	20	10	\N
668	72	78	35	38	31	25	12	40	\N
669	72	142	2	38	13	7	15	6	\N
670	73	83	7	34	28	4	32	16	\N
671	73	85	38	32	25	39	27	5	\N
672	73	88	15	25	13	34	17	11	\N
673	73	91	33	2	37	37	36	23	\N
674	73	95	26	29	4	24	14	28	\N
675	73	98	24	32	29	22	22	15	\N
676	73	100	25	15	37	34	14	19	\N
677	73	103	35	1	4	8	14	22	\N
678	73	79	36	35	9	34	28	16	\N
679	73	80	39	10	14	32	15	22	\N
680	73	81	9	18	29	24	13	6	\N
681	73	82	7	3	4	22	12	20	\N
682	73	84	23	15	3	38	6	6	\N
683	73	86	3	20	36	23	5	35	\N
684	73	87	9	24	23	10	16	10	\N
685	73	89	35	18	14	23	15	26	\N
686	73	90	24	26	5	22	27	30	\N
687	73	92	24	1	1	30	12	4	\N
688	73	93	3	35	28	37	29	20	\N
689	73	94	4	8	37	32	22	18	\N
690	73	96	15	35	13	26	35	13	\N
691	73	97	8	6	34	12	35	22	\N
692	73	99	16	6	21	9	40	17	\N
693	73	101	40	25	34	20	3	16	\N
694	73	102	33	9	2	5	12	23	\N
695	73	104	24	31	21	2	11	35	\N
696	73	106	6	30	27	28	10	13	\N
697	73	107	7	23	29	29	1	29	\N
698	73	108	22	8	4	33	1	21	\N
699	73	133	9	14	39	4	15	3	\N
700	74	112	11	31	22	38	35	38	\N
701	74	114	38	19	3	23	28	32	\N
702	74	115	9	9	7	2	2	38	\N
703	74	117	20	11	2	16	20	4	\N
704	74	119	31	6	14	1	26	15	\N
705	74	120	24	23	7	23	39	7	\N
706	74	110	38	38	30	5	31	17	\N
707	74	155	13	19	5	38	38	4	\N
708	74	143	15	40	38	29	14	22	\N
709	74	144	36	15	5	16	18	19	\N
710	74	127	30	33	10	17	6	37	\N
711	74	128	24	28	24	22	39	27	\N
712	74	145	28	21	2	32	1	9	\N
713	74	146	25	30	4	25	23	13	\N
714	74	134	27	34	26	5	3	16	\N
715	74	156	8	7	4	7	31	27	\N
716	74	126	29	25	23	18	12	10	\N
717	74	125	27	39	33	36	38	9	\N
718	74	147	9	24	25	20	9	19	\N
719	74	148	35	28	29	1	38	33	\N
720	75	150	32	11	20	35	6	20	\N
721	75	151	20	6	20	24	2	11	\N
722	75	152	6	33	19	24	15	7	\N
723	76	2	20	21	26	29	21	8	\N
724	76	3	3	40	36	19	24	10	\N
725	76	4	31	1	24	6	18	27	\N
726	76	6	18	8	8	14	19	1	\N
727	76	7	4	30	36	13	11	18	\N
728	76	8	33	12	15	35	15	34	\N
729	76	10	3	15	31	23	4	6	\N
730	76	12	40	18	4	3	33	2	\N
731	76	15	9	2	7	30	22	14	\N
732	76	18	5	12	20	33	10	19	\N
733	76	19	7	25	6	33	18	9	\N
734	76	20	31	15	20	38	1	29	\N
735	76	9	7	13	1	38	27	40	\N
736	76	135	37	17	37	39	16	4	\N
737	76	129	10	24	36	12	6	3	\N
738	76	157	37	8	15	17	24	9	\N
739	76	158	1	26	9	23	36	2	\N
740	77	22	40	16	20	12	25	37	\N
741	77	23	13	9	11	37	24	23	\N
742	77	25	5	21	24	2	31	31	\N
743	77	26	35	34	21	35	8	39	\N
744	77	24	27	28	19	33	7	26	\N
745	77	149	18	30	14	1	37	36	\N
746	78	27	21	32	7	34	6	7	\N
747	78	28	39	10	33	34	7	16	\N
748	78	30	35	13	34	26	7	34	\N
749	78	31	36	23	27	9	7	37	\N
750	78	32	8	8	40	13	10	7	\N
751	78	130	2	4	19	12	33	38	\N
752	79	38	39	16	4	7	18	30	\N
753	79	37	6	18	17	37	33	4	\N
754	79	40	3	28	9	24	40	4	\N
755	79	35	15	15	11	17	11	31	\N
756	79	136	37	24	35	29	34	40	\N
757	79	137	23	10	26	39	9	1	\N
758	79	159	38	37	13	33	33	3	\N
759	80	47	32	34	1	30	30	15	\N
760	80	48	5	39	28	16	38	18	\N
761	80	43	10	2	3	3	23	39	\N
762	80	46	2	30	9	25	7	30	\N
763	80	44	38	29	28	19	3	1	\N
764	80	45	4	30	4	24	16	27	\N
765	81	49	36	5	38	14	33	34	\N
766	81	50	40	6	26	3	37	5	\N
767	81	51	29	5	14	14	28	23	\N
768	82	56	29	22	33	35	34	37	\N
769	82	57	25	38	32	6	34	16	\N
770	82	58	37	38	2	5	40	26	\N
771	82	59	5	23	5	36	27	4	\N
772	82	122	18	5	25	5	40	16	\N
773	82	160	16	2	18	14	16	19	\N
774	83	60	39	19	39	33	35	35	\N
775	83	61	25	30	15	5	38	23	\N
776	83	62	5	37	19	13	12	37	\N
777	83	63	6	23	3	10	38	27	\N
778	83	65	31	3	13	33	31	34	\N
779	83	64	10	30	39	39	14	18	\N
780	83	139	9	9	38	10	29	10	\N
781	84	66	38	19	15	12	6	24	\N
782	84	67	32	40	16	17	14	31	\N
783	84	68	31	28	20	24	37	8	\N
784	85	69	32	28	15	10	34	17	\N
785	85	70	40	32	3	1	16	17	\N
786	85	71	2	38	19	40	7	29	\N
787	86	75	7	40	12	39	23	5	\N
788	86	124	22	4	18	27	30	34	\N
789	86	141	26	19	40	20	10	40	\N
790	86	140	4	19	31	31	17	6	\N
791	87	77	23	39	16	34	22	34	\N
792	87	78	31	31	14	4	20	25	\N
793	87	142	9	24	31	33	31	33	\N
794	88	83	16	11	21	40	20	6	\N
795	88	85	2	35	36	1	22	25	\N
796	88	88	26	15	40	25	40	32	\N
797	88	91	36	25	21	39	21	38	\N
798	88	95	22	37	40	12	21	24	\N
799	88	98	5	8	39	8	9	15	\N
800	88	100	15	20	23	5	19	11	\N
801	88	103	23	14	25	28	19	12	\N
802	88	79	19	9	9	27	17	1	\N
803	88	80	37	9	23	4	37	31	\N
804	88	81	34	4	15	11	3	16	\N
805	88	82	36	5	14	5	39	38	\N
806	88	84	5	16	19	22	36	31	\N
807	88	86	13	14	24	15	38	16	\N
808	88	87	39	18	8	9	32	2	\N
809	88	89	28	32	28	28	32	36	\N
810	88	90	20	35	15	4	18	34	\N
811	88	92	40	7	20	27	13	17	\N
812	88	93	21	37	12	30	8	18	\N
813	88	94	35	1	40	23	33	17	\N
814	88	96	34	27	24	36	11	17	\N
815	88	97	5	24	12	15	24	34	\N
816	88	99	40	28	6	12	40	38	\N
817	88	101	9	18	6	8	21	21	\N
818	88	102	11	38	3	14	7	21	\N
819	88	104	8	18	5	20	17	14	\N
820	88	106	10	1	35	12	3	10	\N
821	88	107	16	9	13	30	28	32	\N
822	88	108	15	12	26	24	5	35	\N
823	88	133	40	37	1	37	9	13	\N
824	89	112	35	19	38	28	28	7	\N
825	89	114	21	15	33	28	22	8	\N
826	89	115	33	17	23	8	17	27	\N
827	89	117	13	16	8	29	13	12	\N
828	89	119	11	25	17	38	10	29	\N
829	89	120	33	17	12	23	24	34	\N
830	89	155	39	25	21	37	37	10	\N
831	89	162	1	35	21	1	4	32	\N
832	89	143	16	23	28	9	34	21	\N
833	89	144	22	18	17	2	14	24	\N
834	89	128	14	10	30	23	17	38	\N
835	89	163	26	30	31	11	30	25	\N
836	89	145	5	1	33	35	34	40	\N
837	89	146	28	2	33	3	28	20	\N
838	89	134	31	34	34	37	27	21	\N
839	89	156	10	30	13	22	9	1	\N
840	89	125	39	16	27	24	1	15	\N
841	89	126	11	26	29	7	19	10	\N
842	89	147	22	27	14	33	7	31	\N
843	89	148	29	40	7	22	36	20	\N
844	90	150	23	26	13	26	39	12	\N
845	90	151	3	17	19	28	10	15	\N
846	90	152	40	40	34	30	40	24	\N
847	91	2	31	40	31	3	16	40	\N
848	91	3	10	21	28	32	4	2	\N
849	91	4	25	26	18	36	30	35	\N
850	91	6	34	37	6	27	7	20	\N
851	91	7	28	18	30	32	34	18	\N
852	91	8	13	4	4	19	11	32	\N
853	91	10	6	39	22	23	2	10	\N
854	91	12	10	15	33	37	1	10	\N
855	91	15	24	26	3	39	15	8	\N
856	91	18	38	8	29	24	29	11	\N
857	91	19	35	18	35	11	32	30	\N
858	91	20	37	36	3	6	32	32	\N
859	91	9	8	25	5	24	23	6	\N
860	91	129	24	4	12	3	37	9	\N
861	91	135	19	37	33	24	30	26	\N
862	91	157	24	10	10	1	16	23	\N
863	91	158	32	24	9	13	28	34	\N
864	92	22	25	33	2	15	34	14	\N
865	92	23	6	18	34	35	12	11	\N
866	92	25	11	9	39	38	16	29	\N
867	92	26	11	15	23	38	8	38	\N
868	92	149	30	23	26	4	5	14	\N
869	93	27	21	25	33	24	30	7	\N
870	93	28	20	21	28	18	35	4	\N
871	93	30	31	9	27	6	24	25	\N
872	93	31	18	8	14	11	30	15	\N
873	93	32	31	34	39	13	37	5	\N
874	93	130	3	6	12	12	17	12	\N
875	94	38	11	31	35	31	12	3	\N
876	94	37	2	25	7	21	29	35	\N
877	94	40	29	7	25	36	12	6	\N
878	94	35	27	15	30	10	1	15	\N
879	94	136	36	21	6	16	25	21	\N
880	94	137	38	21	27	39	37	34	\N
881	94	159	40	29	36	15	21	34	\N
882	95	47	32	19	11	21	13	35	\N
883	95	48	38	29	34	39	27	17	\N
884	95	43	17	35	16	16	3	9	\N
885	95	46	25	6	7	28	4	28	\N
886	95	44	31	34	6	26	21	30	\N
887	95	45	16	10	22	26	20	23	\N
888	96	49	31	10	23	5	4	17	\N
889	96	50	12	13	17	29	28	26	\N
890	96	51	8	33	4	36	19	40	\N
891	96	164	5	13	11	22	27	31	\N
892	97	56	21	31	12	26	8	27	\N
893	97	57	26	25	17	1	6	38	\N
894	97	58	12	30	24	38	31	1	\N
895	97	59	34	30	3	9	22	22	\N
896	97	122	15	9	1	29	17	21	\N
897	97	160	6	29	10	36	30	40	\N
898	98	60	2	32	28	34	38	27	\N
899	98	61	7	21	14	8	19	18	\N
900	98	62	3	6	23	31	23	10	\N
901	98	63	17	36	21	3	24	2	\N
902	98	65	40	34	31	17	7	2	\N
903	98	64	17	27	28	1	39	22	\N
904	98	139	29	2	23	1	3	26	\N
905	99	66	30	19	36	15	5	17	\N
906	99	67	15	19	37	40	30	20	\N
907	99	68	6	12	33	7	21	7	\N
908	99	165	9	27	14	27	15	29	\N
909	100	69	1	8	13	11	18	12	\N
910	100	70	20	40	36	10	11	24	\N
911	100	71	24	22	20	21	15	24	\N
912	101	75	37	22	34	32	21	30	\N
913	101	124	8	4	27	28	14	22	\N
914	101	140	2	8	16	6	10	23	\N
915	101	141	26	36	18	1	34	2	\N
916	101	166	1	23	38	25	7	33	\N
917	102	77	9	12	20	19	8	12	\N
918	102	78	14	32	40	4	10	12	\N
919	102	142	3	4	11	25	24	40	\N
920	103	83	17	27	10	14	39	11	\N
921	103	85	13	18	39	33	33	33	\N
922	103	88	24	11	16	3	2	22	\N
923	103	91	27	12	11	22	14	12	\N
924	103	95	28	39	11	12	12	31	\N
925	103	98	3	36	34	9	21	37	\N
926	103	100	35	29	31	21	7	10	\N
927	103	103	23	20	34	7	12	40	\N
928	103	79	13	12	2	38	18	1	\N
929	103	80	1	15	27	26	19	14	\N
930	103	81	32	36	26	11	22	36	\N
931	103	82	14	23	29	37	8	8	\N
932	103	84	31	2	1	21	33	38	\N
933	103	86	38	38	27	19	30	6	\N
934	103	87	17	27	8	12	40	4	\N
935	103	89	37	20	5	27	22	28	\N
936	103	90	30	35	16	24	17	2	\N
937	103	92	39	10	7	2	24	16	\N
938	103	93	19	35	35	32	12	10	\N
939	103	94	28	30	23	29	6	11	\N
940	103	96	19	34	29	39	6	1	\N
941	103	97	28	31	6	16	2	17	\N
942	103	99	17	8	6	26	8	37	\N
943	103	101	25	15	1	23	12	35	\N
944	103	102	6	20	6	25	15	16	\N
945	103	104	36	17	35	11	1	17	\N
946	103	106	23	22	40	25	19	35	\N
947	103	107	24	38	17	19	11	14	\N
948	103	108	10	1	4	34	9	14	\N
949	103	133	33	13	37	31	3	6	\N
950	103	161	7	36	1	30	26	1	\N
951	104	112	27	27	23	8	17	6	\N
952	104	114	15	32	25	35	38	34	\N
953	104	115	6	23	30	29	20	10	\N
954	104	117	8	23	7	33	35	17	\N
955	104	119	22	14	39	13	22	37	\N
956	104	120	1	24	15	21	39	34	\N
957	104	155	33	16	10	4	40	24	\N
958	104	162	7	9	1	2	23	17	\N
959	104	143	39	1	33	35	14	22	\N
960	104	144	8	33	13	6	28	3	\N
961	104	128	4	13	34	29	18	34	\N
962	104	163	21	35	34	5	36	34	\N
963	104	145	35	14	26	38	39	7	\N
964	104	146	7	29	24	33	34	34	\N
965	104	134	16	16	40	3	23	37	\N
966	104	156	32	18	13	26	32	16	\N
967	104	126	16	3	19	29	34	3	\N
968	104	125	34	37	7	11	30	32	\N
969	104	147	22	31	12	24	38	38	\N
970	104	148	38	5	11	30	37	12	\N
971	105	150	33	34	9	35	24	32	\N
972	105	151	33	23	23	32	14	3	\N
973	105	152	11	32	36	36	21	10	\N
974	106	2	26	26	21	29	28	29	\N
975	106	3	23	14	22	18	31	22	\N
976	106	4	27	13	13	9	35	11	\N
977	106	6	9	28	18	30	37	18	\N
978	106	7	27	25	16	35	10	40	\N
979	106	8	28	38	27	13	22	28	\N
980	106	10	37	31	40	29	34	3	\N
981	106	12	40	40	26	30	40	22	\N
982	106	15	13	6	34	1	27	9	\N
983	106	18	6	32	40	40	2	23	\N
984	106	19	29	22	26	19	23	21	\N
985	106	20	34	32	37	16	38	17	\N
986	106	13	2	29	2	5	1	15	\N
987	106	157	7	8	24	6	5	4	\N
988	106	158	15	27	8	16	36	19	\N
989	106	129	25	18	30	16	30	31	\N
990	106	135	36	13	19	13	36	28	\N
991	107	22	22	31	6	23	36	9	\N
992	107	23	7	28	5	25	25	29	\N
993	107	25	7	38	16	1	24	34	\N
994	107	26	14	19	15	5	38	5	\N
995	107	149	5	29	40	26	22	9	\N
996	108	27	25	30	33	13	40	33	\N
997	108	28	35	19	17	7	31	16	\N
998	108	30	14	20	9	12	6	3	\N
999	108	31	14	31	19	8	3	24	\N
1000	108	32	36	6	10	36	19	15	\N
1001	108	130	17	27	9	31	19	10	\N
1002	109	38	33	7	28	31	5	9	\N
1003	109	37	4	10	26	39	30	35	\N
1004	109	40	22	5	12	39	5	9	\N
1005	109	35	18	18	33	31	29	32	\N
1006	109	136	17	24	30	29	7	14	\N
1007	109	137	14	7	22	3	11	37	\N
1008	109	159	5	11	2	2	31	17	\N
1009	110	47	16	25	39	1	28	19	\N
1010	110	48	28	21	9	13	32	9	\N
1011	110	43	1	20	36	17	8	24	\N
1012	110	46	33	32	10	14	33	27	\N
1013	110	44	21	39	18	23	6	16	\N
1014	110	45	38	8	15	21	5	22	\N
1015	111	49	29	37	23	15	29	2	\N
1016	111	50	20	21	26	3	40	5	\N
1017	111	51	39	26	23	19	7	32	\N
1018	112	56	23	26	38	9	40	3	\N
1019	112	57	33	2	19	19	16	31	\N
1020	112	58	23	8	9	23	18	19	\N
1021	112	59	1	34	24	5	19	12	\N
1022	112	122	19	14	2	36	29	21	\N
1023	112	170	15	30	23	2	28	24	\N
1024	113	60	12	25	36	40	5	40	\N
1025	113	61	23	25	22	14	38	17	\N
1026	113	62	38	30	3	26	15	30	\N
1027	113	63	20	40	34	36	35	37	\N
1028	113	65	14	16	19	30	25	33	\N
1029	113	64	19	23	1	22	12	30	\N
1030	113	139	24	30	6	32	33	25	\N
1031	114	66	16	39	18	20	13	38	\N
1032	114	67	29	38	1	18	21	39	\N
1033	114	68	5	1	8	6	21	5	\N
1034	115	69	35	35	29	24	21	28	\N
1035	115	70	34	12	8	21	40	18	\N
1036	115	71	33	23	15	17	25	25	\N
1037	115	171	37	33	13	36	37	2	\N
1038	116	75	5	11	27	28	9	33	\N
1039	116	124	12	11	25	36	5	20	\N
1040	116	140	26	31	26	1	28	38	\N
1041	116	141	40	28	33	16	11	8	\N
1042	116	166	35	27	30	39	9	23	\N
1043	117	77	5	7	7	11	34	1	\N
1044	117	78	11	1	17	27	32	7	\N
1045	117	142	15	12	17	19	21	5	\N
1046	118	83	38	29	35	9	12	17	\N
1047	118	85	32	26	20	29	5	39	\N
1048	118	88	13	10	18	30	20	4	\N
1049	118	91	19	5	32	20	11	22	\N
1050	118	95	26	27	26	5	33	37	\N
1051	118	98	18	25	28	17	10	20	\N
1052	118	100	12	14	2	7	34	8	\N
1053	118	103	19	22	23	26	22	34	\N
1054	118	79	38	24	27	35	15	26	\N
1055	118	80	37	9	35	13	40	37	\N
1056	118	81	13	18	14	1	32	40	\N
1057	118	82	4	30	31	34	31	31	\N
1058	118	84	16	16	37	36	5	19	\N
1059	118	86	24	30	6	22	8	14	\N
1060	118	87	24	21	35	11	9	6	\N
1061	118	89	35	12	21	23	1	12	\N
1062	118	90	13	5	15	4	10	26	\N
1063	118	92	28	35	9	36	17	10	\N
1064	118	93	13	31	30	15	11	28	\N
1065	118	94	9	19	4	34	36	7	\N
1066	118	96	37	33	36	15	36	2	\N
1067	118	97	38	8	30	12	21	38	\N
1068	118	99	3	29	3	40	12	34	\N
1069	118	101	16	21	38	6	18	29	\N
1070	118	102	21	31	8	19	29	32	\N
1071	118	104	14	28	24	32	30	5	\N
1072	118	106	17	1	1	34	33	25	\N
1073	118	107	31	11	10	23	7	5	\N
1074	118	108	40	18	24	28	5	20	\N
1075	118	133	25	25	9	25	35	13	\N
1076	118	161	24	37	13	39	14	16	\N
1077	119	112	32	26	36	24	20	29	\N
1078	119	114	26	39	7	12	35	17	\N
1079	119	115	21	17	7	7	19	34	\N
1080	119	117	20	15	6	20	40	26	\N
1081	119	119	14	1	13	14	14	20	\N
1082	119	120	9	12	40	3	26	40	\N
1083	119	155	24	5	39	36	2	21	\N
1084	119	162	33	31	3	15	28	5	\N
1085	119	143	22	34	35	27	30	10	\N
1086	119	144	24	21	17	38	23	23	\N
1087	119	134	38	39	8	23	30	29	\N
1088	119	128	1	21	21	35	30	14	\N
1089	119	163	40	6	16	31	8	20	\N
1090	119	145	4	21	34	8	34	27	\N
1091	119	146	27	22	5	25	13	2	\N
1092	119	156	31	7	19	23	35	19	\N
1093	119	126	10	40	25	27	32	8	\N
1094	119	125	36	37	30	29	2	11	\N
1095	119	147	27	4	7	31	7	33	\N
1096	119	148	33	11	34	4	25	17	\N
1097	120	151	32	29	6	37	34	39	\N
1098	120	152	32	3	38	3	6	23	\N
1099	120	150	36	40	27	26	21	27	\N
1100	120	169	28	38	37	12	40	3	\N
1101	121	2	20	23	33	24	35	4	\N
1102	121	3	25	25	2	30	32	24	\N
1103	121	4	37	18	28	18	36	13	\N
1104	121	6	30	14	33	21	32	14	\N
1105	121	7	29	10	35	11	20	20	\N
1106	121	8	22	16	16	11	15	34	\N
1107	121	10	13	24	35	22	5	38	\N
1108	121	12	30	11	27	16	36	38	\N
1109	121	15	22	10	36	11	22	33	\N
1110	121	18	36	21	5	19	37	2	\N
1111	121	19	15	22	20	19	25	27	\N
1112	121	20	7	26	28	14	19	36	\N
1113	121	13	29	30	14	4	31	23	\N
1114	121	129	16	36	27	24	38	38	\N
1115	121	135	36	10	15	33	26	3	\N
1116	121	157	16	9	2	22	6	20	\N
1117	122	22	39	20	35	28	14	10	\N
1118	122	23	36	19	34	11	12	11	\N
1119	122	25	1	6	31	10	21	22	\N
1120	122	26	23	2	7	11	23	2	\N
1121	122	149	35	25	11	22	10	39	\N
1122	123	27	35	18	8	26	22	19	\N
1123	123	28	1	8	10	26	22	24	\N
1124	123	30	21	28	13	30	22	21	\N
1125	123	31	24	37	35	32	5	25	\N
1126	123	32	30	13	10	39	10	3	\N
1127	123	130	14	36	10	17	30	2	\N
1128	124	38	34	16	32	20	28	22	\N
1129	124	37	40	23	20	17	26	29	\N
1130	124	40	40	16	38	31	35	35	\N
1131	124	35	13	13	12	18	24	30	\N
1132	124	136	29	4	2	38	18	38	\N
1133	124	137	20	26	28	3	7	30	\N
1134	125	47	22	11	5	28	36	1	\N
1135	125	48	13	1	7	20	36	38	\N
1136	125	43	7	11	15	31	38	20	\N
1137	125	46	5	34	38	30	12	2	\N
1138	125	44	27	36	33	14	40	34	\N
1139	125	45	33	13	17	5	22	31	\N
1140	126	49	28	27	33	18	7	35	\N
1141	126	50	35	10	12	16	36	19	\N
1142	126	51	26	16	13	21	27	6	\N
1143	127	56	5	11	18	11	13	29	\N
1144	127	57	12	26	3	33	9	5	\N
1145	127	58	14	38	5	26	36	1	\N
1146	127	59	40	23	33	27	18	13	\N
1147	127	122	12	35	3	33	40	34	\N
1148	127	170	15	27	31	28	9	31	\N
1149	128	60	28	10	8	1	38	38	\N
1150	128	61	7	5	33	20	13	18	\N
1151	128	62	4	34	34	35	13	20	\N
1152	128	63	4	28	9	1	8	9	\N
1153	128	65	27	21	34	37	21	11	\N
1154	128	64	15	6	39	10	19	35	\N
1155	128	139	22	5	12	4	20	17	\N
1156	129	66	21	1	25	21	21	2	\N
1157	129	67	16	22	24	6	16	12	\N
1158	129	68	39	30	11	39	38	10	\N
1159	130	69	8	27	28	1	17	35	\N
1160	130	70	16	25	27	18	16	3	\N
1161	130	71	26	20	18	7	22	4	\N
1162	130	171	36	1	27	36	18	22	\N
1163	131	75	14	23	28	19	20	14	\N
1164	131	140	9	36	22	12	34	9	\N
1165	131	141	37	18	17	1	12	30	\N
1166	131	166	11	10	9	12	2	37	\N
1167	131	174	19	5	6	23	30	8	\N
1168	132	77	23	1	39	13	37	1	\N
1169	132	78	26	40	6	9	35	7	\N
1170	132	142	10	22	38	37	19	35	\N
1171	132	175	9	16	5	37	22	32	\N
1172	133	83	27	19	33	24	19	8	\N
1173	133	85	34	1	8	22	38	32	\N
1174	133	88	33	23	34	10	8	15	\N
1175	133	91	26	15	28	32	7	27	\N
1176	133	95	22	2	23	2	34	33	\N
1177	133	98	18	40	19	5	39	28	\N
1178	133	100	34	3	6	26	11	15	\N
1179	133	103	1	9	33	40	4	23	\N
1180	133	79	9	24	12	3	24	37	\N
1181	133	80	23	24	18	6	31	12	\N
1182	133	81	36	3	25	34	20	10	\N
1183	133	82	30	18	26	15	26	17	\N
1184	133	84	14	7	36	28	33	21	\N
1185	133	86	32	2	7	24	37	20	\N
1186	133	87	40	34	15	8	4	14	\N
1187	133	89	3	32	3	2	13	40	\N
1188	133	90	21	2	20	13	23	18	\N
1189	133	92	38	16	26	24	4	15	\N
1190	133	93	33	8	22	4	32	39	\N
1191	133	94	28	1	35	25	12	19	\N
1192	133	96	14	12	12	2	18	11	\N
1193	133	97	27	8	20	17	31	21	\N
1194	133	99	20	10	19	27	34	8	\N
1195	133	101	20	17	3	34	28	15	\N
1196	133	102	35	6	9	30	19	15	\N
1197	133	104	39	40	15	11	23	35	\N
1198	133	106	6	19	16	3	4	27	\N
1199	133	107	36	32	10	23	23	31	\N
1200	133	108	39	7	16	19	29	26	\N
1201	133	133	32	37	8	33	24	20	\N
1202	133	161	8	15	38	11	13	6	\N
1203	134	112	34	17	40	20	21	15	\N
1204	134	114	15	23	39	10	13	16	\N
1205	134	115	18	12	3	19	17	33	\N
1206	134	117	37	37	30	23	2	12	\N
1207	134	155	10	35	28	17	22	29	\N
1208	134	162	37	39	2	30	38	36	\N
1209	134	143	36	34	31	35	29	33	\N
1210	134	144	23	23	1	31	35	40	\N
1211	134	128	1	17	39	3	13	29	\N
1212	134	163	7	9	10	33	29	18	\N
1213	134	145	9	16	16	37	14	24	\N
1214	134	146	17	20	39	34	21	22	\N
1215	134	156	7	34	29	27	10	25	\N
1216	134	126	1	3	2	2	29	40	\N
1217	134	125	6	39	26	2	14	17	\N
1218	134	148	38	12	39	9	14	15	\N
1219	134	147	29	15	5	25	11	3	\N
1220	134	176	21	4	12	4	6	33	\N
1221	134	177	24	28	17	12	34	5	\N
1222	134	178	5	20	5	19	32	20	\N
1223	135	150	21	2	26	11	22	40	\N
1224	135	151	40	26	14	28	27	10	\N
1225	135	169	31	1	7	3	7	29	\N
1226	136	4	0	0	0	0	0	0	\N
1227	136	129	0	0	0	0	0	0	\N
1228	136	12	0	0	0	0	0	0	\N
1229	136	135	0	0	0	0	0	0	\N
1230	136	6	0	0	0	0	0	0	\N
1231	136	15	0	0	0	0	0	0	\N
1232	136	19	0	0	0	0	0	0	\N
1233	136	20	0	0	0	0	0	0	\N
1234	136	2	0	0	0	0	0	0	\N
1235	136	3	0	0	0	0	0	0	\N
1236	136	7	0	0	0	0	0	0	\N
1237	136	8	0	0	0	0	0	0	\N
1238	136	18	0	0	0	0	0	0	\N
1239	136	10	0	0	0	0	0	0	\N
1240	137	25	0	0	0	0	0	0	\N
1241	137	26	0	0	0	0	0	0	\N
1242	137	149	0	0	0	0	0	0	\N
1243	137	22	0	0	0	0	0	0	\N
1244	137	23	0	0	0	0	0	0	\N
1245	138	27	0	0	0	0	0	0	\N
1246	138	130	0	0	0	0	0	0	\N
1247	138	30	0	0	0	0	0	0	\N
1248	138	31	0	0	0	0	0	0	\N
1249	138	32	0	0	0	0	0	0	\N
1250	138	28	0	0	0	0	0	0	\N
1251	138	33	0	0	0	0	0	0	\N
1252	139	40	0	0	0	0	0	0	\N
1253	139	37	0	0	0	0	0	0	\N
1254	139	136	0	0	0	0	0	0	\N
1255	139	35	0	0	0	0	0	0	\N
1256	139	137	0	0	0	0	0	0	\N
1257	139	38	0	0	0	0	0	0	\N
1258	139	159	0	0	0	0	0	0	\N
1259	140	43	0	0	0	0	0	0	\N
1260	140	45	0	0	0	0	0	0	\N
1261	140	47	0	0	0	0	0	0	\N
1262	140	48	0	0	0	0	0	0	\N
1263	140	44	0	0	0	0	0	0	\N
1264	140	46	0	0	0	0	0	0	\N
1265	141	49	0	0	0	0	0	0	\N
1266	141	50	0	0	0	0	0	0	\N
1267	141	51	0	0	0	0	0	0	\N
1268	142	56	0	0	0	0	0	0	\N
1269	142	57	0	0	0	0	0	0	\N
1270	142	58	0	0	0	0	0	0	\N
1271	142	59	0	0	0	0	0	0	\N
1272	142	122	0	0	0	0	0	0	\N
1273	142	170	0	0	0	0	0	0	\N
1274	142	246	0	0	0	0	0	0	\N
1275	143	60	0	0	0	0	0	0	\N
1276	143	61	0	0	0	0	0	0	\N
1277	143	62	0	0	0	0	0	0	\N
1278	143	63	0	0	0	0	0	0	\N
1279	143	64	0	0	0	0	0	0	\N
1280	143	65	0	0	0	0	0	0	\N
1281	143	139	0	0	0	0	0	0	\N
1282	143	253	0	0	0	0	0	0	\N
1283	144	66	0	0	0	0	0	0	\N
1284	144	67	0	0	0	0	0	0	\N
1285	144	68	0	0	0	0	0	0	\N
1286	144	165	0	0	0	0	0	0	\N
1287	145	69	0	0	0	0	0	0	\N
1288	145	70	0	0	0	0	0	0	\N
1289	145	71	0	0	0	0	0	0	\N
1290	145	171	0	0	0	0	0	0	\N
1291	146	75	0	0	0	0	0	0	\N
1292	146	174	0	0	0	0	0	0	\N
1293	146	140	0	0	0	0	0	0	\N
1294	146	141	0	0	0	0	0	0	\N
1295	146	166	0	0	0	0	0	0	\N
1296	146	73	0	0	0	0	0	0	\N
1297	147	77	0	0	0	0	0	0	\N
1298	147	78	0	0	0	0	0	0	\N
1299	147	142	0	0	0	0	0	0	\N
1300	148	83	0	0	0	0	0	0	\N
1301	148	85	0	0	0	0	0	0	\N
1302	148	88	0	0	0	0	0	0	\N
1303	148	91	0	0	0	0	0	0	\N
1304	148	95	0	0	0	0	0	0	\N
1305	148	98	0	0	0	0	0	0	\N
1306	148	100	0	0	0	0	0	0	\N
1307	148	103	0	0	0	0	0	0	\N
1308	148	79	0	0	0	0	0	0	\N
1309	148	80	0	0	0	0	0	0	\N
1310	148	81	0	0	0	0	0	0	\N
1311	148	82	0	0	0	0	0	0	\N
1312	148	84	0	0	0	0	0	0	\N
1313	148	86	0	0	0	0	0	0	\N
1314	148	87	0	0	0	0	0	0	\N
1315	148	89	0	0	0	0	0	0	\N
1316	148	90	0	0	0	0	0	0	\N
1317	148	92	0	0	0	0	0	0	\N
1318	148	93	0	0	0	0	0	0	\N
1319	148	94	0	0	0	0	0	0	\N
1320	148	96	0	0	0	0	0	0	\N
1321	148	97	0	0	0	0	0	0	\N
1322	148	99	0	0	0	0	0	0	\N
1323	148	101	0	0	0	0	0	0	\N
1324	148	102	0	0	0	0	0	0	\N
1325	148	104	0	0	0	0	0	0	\N
1326	148	106	0	0	0	0	0	0	\N
1327	148	107	0	0	0	0	0	0	\N
1328	148	108	0	0	0	0	0	0	\N
1329	148	133	0	0	0	0	0	0	\N
1330	148	161	0	0	0	0	0	0	\N
1331	148	179	0	0	0	0	0	0	\N
1332	149	156	0	0	0	0	0	0	\N
1333	149	162	0	0	0	0	0	0	\N
1334	149	147	0	0	0	0	0	0	\N
1335	149	248	0	0	0	0	0	0	\N
1336	149	178	0	0	0	0	0	0	\N
1337	149	114	0	0	0	0	0	0	\N
1338	149	128	0	0	0	0	0	0	\N
1339	149	163	0	0	0	0	0	0	\N
1340	149	145	0	0	0	0	0	0	\N
1341	149	146	0	0	0	0	0	0	\N
1342	149	249	0	0	0	0	0	0	\N
1343	149	115	0	0	0	0	0	0	\N
1344	149	176	0	0	0	0	0	0	\N
1345	149	117	0	0	0	0	0	0	\N
1346	149	155	0	0	0	0	0	0	\N
1347	149	143	0	0	0	0	0	0	\N
1348	149	144	0	0	0	0	0	0	\N
1349	149	250	0	0	0	0	0	0	\N
1350	149	125	0	0	0	0	0	0	\N
1351	149	251	0	0	0	0	0	0	\N
1352	149	148	0	0	0	0	0	0	\N
1353	149	252	0	0	0	0	0	0	\N
1354	150	150	0	0	0	0	0	0	\N
1355	150	151	0	0	0	0	0	0	\N
1356	150	169	0	0	0	0	0	0	\N
1481	151	4	0	0	0	0	0	0	\N
1482	151	129	0	0	0	0	0	0	\N
1483	151	12	0	0	0	0	0	0	\N
1484	151	135	0	0	0	0	0	0	\N
1485	151	6	0	0	0	0	0	0	\N
1486	151	15	0	0	0	0	0	0	\N
1487	151	19	0	0	0	0	0	0	\N
1488	151	20	0	0	0	0	0	0	\N
1489	151	2	0	0	0	0	0	0	\N
1490	151	3	0	0	0	0	0	0	\N
1491	151	7	0	0	0	0	0	0	\N
1492	151	8	0	0	0	0	0	0	\N
1493	151	18	0	0	0	0	0	0	\N
1494	151	10	0	0	0	0	0	0	\N
1495	152	25	0	0	0	0	0	0	\N
1496	152	26	0	0	0	0	0	0	\N
1497	152	149	0	0	0	0	0	0	\N
1498	152	22	0	0	0	0	0	0	\N
1499	152	23	0	0	0	0	0	0	\N
1500	153	27	0	0	0	0	0	0	\N
1501	153	130	0	0	0	0	0	0	\N
1502	153	30	0	0	0	0	0	0	\N
1503	153	31	0	0	0	0	0	0	\N
1504	153	32	0	0	0	0	0	0	\N
1505	153	28	0	0	0	0	0	0	\N
1506	153	33	0	0	0	0	0	0	\N
1507	154	40	0	0	0	0	0	0	\N
1508	154	37	0	0	0	0	0	0	\N
1509	154	136	0	0	0	0	0	0	\N
1510	154	35	0	0	0	0	0	0	\N
1511	154	137	0	0	0	0	0	0	\N
1512	154	38	0	0	0	0	0	0	\N
1513	154	159	0	0	0	0	0	0	\N
1514	155	43	0	0	0	0	0	0	\N
1515	155	45	0	0	0	0	0	0	\N
1516	155	47	0	0	0	0	0	0	\N
1517	155	48	0	0	0	0	0	0	\N
1518	155	44	0	0	0	0	0	0	\N
1519	155	46	0	0	0	0	0	0	\N
1520	156	49	0	0	0	0	0	0	\N
1521	156	50	0	0	0	0	0	0	\N
1522	156	51	0	0	0	0	0	0	\N
1523	157	56	0	0	0	0	0	0	\N
1524	157	57	0	0	0	0	0	0	\N
1525	157	58	0	0	0	0	0	0	\N
1526	157	59	0	0	0	0	0	0	\N
1527	157	122	0	0	0	0	0	0	\N
1528	157	170	0	0	0	0	0	0	\N
1529	157	246	0	0	0	0	0	0	\N
1530	158	60	0	0	0	0	0	0	\N
1531	158	61	0	0	0	0	0	0	\N
1532	158	62	0	0	0	0	0	0	\N
1533	158	63	0	0	0	0	0	0	\N
1534	158	64	0	0	0	0	0	0	\N
1535	158	65	0	0	0	0	0	0	\N
1536	158	139	0	0	0	0	0	0	\N
1537	158	253	0	0	0	0	0	0	\N
1538	159	66	0	0	0	0	0	0	\N
1539	159	67	0	0	0	0	0	0	\N
1540	159	68	0	0	0	0	0	0	\N
1541	159	165	0	0	0	0	0	0	\N
1542	160	69	0	0	0	0	0	0	\N
1543	160	70	0	0	0	0	0	0	\N
1544	160	71	0	0	0	0	0	0	\N
1545	160	171	0	0	0	0	0	0	\N
1546	161	75	0	0	0	0	0	0	\N
1547	161	174	0	0	0	0	0	0	\N
1548	161	140	0	0	0	0	0	0	\N
1549	161	141	0	0	0	0	0	0	\N
1550	161	166	0	0	0	0	0	0	\N
1551	161	73	0	0	0	0	0	0	\N
1552	162	77	0	0	0	0	0	0	\N
1553	162	78	0	0	0	0	0	0	\N
1554	162	142	0	0	0	0	0	0	\N
1555	163	83	0	0	0	0	0	0	\N
1556	163	85	0	0	0	0	0	0	\N
1557	163	88	0	0	0	0	0	0	\N
1558	163	91	0	0	0	0	0	0	\N
1559	163	95	0	0	0	0	0	0	\N
1560	163	98	0	0	0	0	0	0	\N
1561	163	100	0	0	0	0	0	0	\N
1562	163	103	0	0	0	0	0	0	\N
1563	163	79	0	0	0	0	0	0	\N
1564	163	80	0	0	0	0	0	0	\N
1565	163	81	0	0	0	0	0	0	\N
1566	163	82	0	0	0	0	0	0	\N
1567	163	84	0	0	0	0	0	0	\N
1568	163	86	0	0	0	0	0	0	\N
1569	163	87	0	0	0	0	0	0	\N
1570	163	89	0	0	0	0	0	0	\N
1571	163	90	0	0	0	0	0	0	\N
1572	163	92	0	0	0	0	0	0	\N
1573	163	93	0	0	0	0	0	0	\N
1574	163	94	0	0	0	0	0	0	\N
1575	163	96	0	0	0	0	0	0	\N
1576	163	97	0	0	0	0	0	0	\N
1577	163	99	0	0	0	0	0	0	\N
1578	163	101	0	0	0	0	0	0	\N
1579	163	102	0	0	0	0	0	0	\N
1580	163	104	0	0	0	0	0	0	\N
1581	163	106	0	0	0	0	0	0	\N
1582	163	107	0	0	0	0	0	0	\N
1583	163	108	0	0	0	0	0	0	\N
1584	163	133	0	0	0	0	0	0	\N
1585	163	161	0	0	0	0	0	0	\N
1586	163	179	0	0	0	0	0	0	\N
1587	164	156	0	0	0	0	0	0	\N
1588	164	162	0	0	0	0	0	0	\N
1589	164	147	0	0	0	0	0	0	\N
1590	164	248	0	0	0	0	0	0	\N
1591	164	178	0	0	0	0	0	0	\N
1592	164	114	0	0	0	0	0	0	\N
1593	164	128	0	0	0	0	0	0	\N
1594	164	163	0	0	0	0	0	0	\N
1595	164	145	0	0	0	0	0	0	\N
1596	164	146	0	0	0	0	0	0	\N
1597	164	249	0	0	0	0	0	0	\N
1598	164	115	0	0	0	0	0	0	\N
1599	164	176	0	0	0	0	0	0	\N
1600	164	117	0	0	0	0	0	0	\N
1601	164	155	0	0	0	0	0	0	\N
1602	164	143	0	0	0	0	0	0	\N
1603	164	144	0	0	0	0	0	0	\N
1604	164	250	0	0	0	0	0	0	\N
1605	164	125	0	0	0	0	0	0	\N
1606	164	251	0	0	0	0	0	0	\N
1607	164	148	0	0	0	0	0	0	\N
1608	164	252	0	0	0	0	0	0	\N
1609	165	150	0	0	0	0	0	0	\N
1610	165	151	0	0	0	0	0	0	\N
1611	165	169	0	0	0	0	0	0	\N
\.


--
-- Data for Name: tournaments; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.tournaments (id, season_id, league_id) FROM stdin;
1	2012	1
2	2012	2
3	2012	3
4	2012	4
5	2012	5
6	2012	6
7	2012	7
8	2012	8
9	2012	9
10	2012	10
11	2012	11
12	2012	12
13	2012	13
14	2012	14
15	2012	15
16	2013	1
17	2013	2
18	2013	3
19	2013	4
20	2013	5
21	2013	6
22	2013	7
23	2013	8
24	2013	9
25	2013	10
26	2013	11
27	2013	12
28	2013	13
29	2013	14
30	2013	15
31	2014	1
32	2014	2
33	2014	3
34	2014	4
35	2014	5
36	2014	6
37	2014	7
38	2014	8
39	2014	9
40	2014	10
41	2014	11
42	2014	12
43	2014	13
44	2014	14
45	2014	15
46	2015	1
47	2015	2
48	2015	3
49	2015	4
50	2015	5
51	2015	6
52	2015	7
53	2015	8
54	2015	9
55	2015	10
56	2015	11
57	2015	12
58	2015	13
59	2015	14
60	2015	15
61	2016	1
62	2016	2
63	2016	3
64	2016	4
65	2016	5
66	2016	6
67	2016	8
68	2016	9
69	2016	10
70	2016	11
71	2016	12
72	2016	13
73	2016	14
74	2016	15
75	2016	16
76	2017	1
77	2017	2
78	2017	3
79	2017	4
80	2017	5
81	2017	6
82	2017	8
83	2017	9
84	2017	10
85	2017	11
86	2017	12
87	2017	13
88	2017	14
89	2017	15
90	2017	16
91	2018	1
92	2018	2
93	2018	3
94	2018	4
95	2018	5
96	2018	6
97	2018	8
98	2018	9
99	2018	10
100	2018	11
101	2018	12
102	2018	13
103	2018	14
104	2018	15
105	2018	16
106	2019	1
107	2019	2
108	2019	3
109	2019	4
110	2019	5
111	2019	6
112	2019	8
113	2019	9
114	2019	10
115	2019	11
116	2019	12
117	2019	13
118	2019	14
119	2019	15
120	2019	16
121	2020	1
122	2020	2
123	2020	3
124	2020	4
125	2020	5
126	2020	6
127	2020	8
128	2020	9
129	2020	10
130	2020	11
131	2020	12
132	2020	13
133	2020	14
134	2020	15
135	2020	16
136	2021	1
137	2021	2
138	2021	3
139	2021	4
140	2021	5
141	2021	6
142	2021	8
143	2021	9
144	2021	10
145	2021	11
146	2021	12
147	2021	13
148	2021	14
149	2021	15
150	2021	16
151	2022	1
152	2022	2
153	2022	3
154	2022	4
155	2022	5
156	2022	6
157	2022	8
158	2022	9
159	2022	10
160	2022	11
161	2022	12
162	2022	13
163	2022	14
164	2022	15
165	2022	16
\.


--
-- Name: champ_champ_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.champ_champ_id_seq', 1436, true);


--
-- Name: league_logos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.league_logos_id_seq', 2, false);


--
-- Name: leagues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.leagues_id_seq', 2, false);


--
-- Name: nations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.nations_id_seq', 2, false);


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.players_id_seq', 2, false);


--
-- Name: players_tournaments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.players_tournaments_id_seq', 8373, true);


--
-- Name: season_season_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.season_season_id_seq', 16, true);


--
-- Name: team_logos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.team_logos_id_seq', 2, false);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.teams_id_seq', 2, false);


--
-- Name: teams_tournaments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.teams_tournaments_id_seq', 1612, true);


--
-- Name: tournaments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.tournaments_id_seq', 166, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.users_user_id_seq', 9, true);


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
-- Name: nations nations_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.nations
    ADD CONSTRAINT nations_name_key UNIQUE (name);


--
-- Name: nations nations_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.nations
    ADD CONSTRAINT nations_pkey PRIMARY KEY (id);


--
-- Name: nations nations_short_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.nations
    ADD CONSTRAINT nations_short_name_key UNIQUE (short_name);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: players_tournaments players_tournaments_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.players_tournaments
    ADD CONSTRAINT players_tournaments_pkey PRIMARY KEY (id);


--
-- Name: seasons seasons_pkey1; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.seasons
    ADD CONSTRAINT seasons_pkey1 PRIMARY KEY (id);


--
-- Name: team_logos team_logos_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.team_logos
    ADD CONSTRAINT team_logos_pkey PRIMARY KEY (id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


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
-- Name: league_logos league_logos_league_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.league_logos
    ADD CONSTRAINT league_logos_league_id_fk FOREIGN KEY (league_id) REFERENCES public.leagues(id) ON DELETE CASCADE;


--
-- Name: players players_draft_team_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_draft_team_id_fk FOREIGN KEY (draft_team_id) REFERENCES public.teams(id) ON DELETE SET NULL;


--
-- Name: players players_nation_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_nation_id_fk FOREIGN KEY (nation_id) REFERENCES public.nations(id) ON DELETE RESTRICT;


--
-- Name: players_tournaments players_tournaments_player_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.players_tournaments
    ADD CONSTRAINT players_tournaments_player_id_fk FOREIGN KEY (player_id) REFERENCES public.players(id) ON DELETE RESTRICT;


--
-- Name: players_tournaments players_tournaments_teams_tournament_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.players_tournaments
    ADD CONSTRAINT players_tournaments_teams_tournament_id_fk FOREIGN KEY (teams_tournament_id) REFERENCES public.teams_tournaments(id) ON DELETE CASCADE;


--
-- Name: team_logos team_logos_team_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.team_logos
    ADD CONSTRAINT team_logos_team_id_fk FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- Name: teams teams_nation_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_nation_id_fk FOREIGN KEY (nation_id) REFERENCES public.nations(id) ON DELETE RESTRICT;


--
-- Name: teams_tournaments teams_tournaments_team_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.teams_tournaments
    ADD CONSTRAINT teams_tournaments_team_id_fk FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE RESTRICT;


--
-- Name: teams_tournaments teams_tournaments_tournament_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.teams_tournaments
    ADD CONSTRAINT teams_tournaments_tournament_id_fk FOREIGN KEY (tournament_id) REFERENCES public.tournaments(id) ON DELETE CASCADE;


--
-- Name: tournaments tournaments_league_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tournaments
    ADD CONSTRAINT tournaments_league_id_fk FOREIGN KEY (league_id) REFERENCES public.leagues(id) ON DELETE RESTRICT;


--
-- Name: tournaments tournaments_season_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tournaments
    ADD CONSTRAINT tournaments_season_id_fk FOREIGN KEY (season_id) REFERENCES public.seasons(id) ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--


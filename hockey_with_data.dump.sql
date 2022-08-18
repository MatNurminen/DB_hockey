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
1	2	2016	\N	https://zoom.us/site
2	1	2016	\N	https://baidu.com/user/110
3	5	2013	\N	https://instagram.com/site
4	8	2018	\N	https://wikipedia.org/en-us
5	1	2015	\N	http://youtube.com/one
6	2	2019	\N	https://yahoo.com/site
7	5	2013	\N	http://cnn.com/fr
8	19	2015	\N	http://guardian.co.uk/fr
9	7	2020	\N	http://baidu.com/en-us
10	14	2013	\N	https://cnn.com/user/110
11	7	2017	\N	https://google.com/site
12	19	2017	\N	http://twitter.com/en-ca
13	6	2019	\N	http://twitter.com/settings
14	10	2015	\N	https://nytimes.com/en-us
15	5	2019	\N	https://zoom.us/sub/cars
16	6	2013	\N	https://zoom.us/group/9
17	15	2018	\N	http://facebook.com/group/9
18	10	2020	\N	https://whatsapp.com/site
19	2	2016	\N	https://instagram.com/sub/cars
20	16	2014	\N	http://youtube.com/site
21	3	2015	\N	https://whatsapp.com/fr
22	17	2017	\N	https://ebay.com/sub/cars
23	4	2016	\N	https://cnn.com/one
24	14	2017	\N	https://whatsapp.com/fr
25	19	2015	\N	http://whatsapp.com/fr
26	13	2015	\N	http://facebook.com/user/110
27	19	2019	\N	http://pinterest.com/en-us
28	17	2012	\N	https://cnn.com/sub
29	8	2019	\N	https://guardian.co.uk/sub
30	17	2015	\N	https://twitter.com/group/9
\.


--
-- Data for Name: leagues; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.leagues (id, name, short_name, start_year, end_year, color, is_local) FROM stdin;
1	Niedersachsen	C	2013	\N	\N	f
2	Antwerpen	Qu	2017	\N	\N	t
3	Wigtownshire	PR	2017	\N	\N	f
4	Lạng Sơn	L.	2015	\N	\N	t
5	Bắc Giang	ULY	2019	\N	\N	t
6	Bahia	NI	2013	\N	\N	f
7	Hessen	IX	2013	\N	\N	f
8	Leningrad Oblast	Fl	2014	\N	\N	f
9	Magallanes y Antártica Chilena	TP	2016	\N	\N	f
10	East Lothian	SAP	2017	\N	\N	f
11	Noord Holland	CH	2017	\N	\N	t
12	Cao Bằng	NW	2013	\N	\N	t
13	Eastern Visayas	L	2019	\N	\N	t
14	Umbria	Gy	2013	\N	\N	t
15	New South Wales	VI	2014	\N	\N	t
16	Viken	VIK	2017	\N	\N	t
17	Staffordshire	SI	2016	\N	\N	f
18	łódzkie	BA	2017	\N	\N	f
19	Kogi	VIC	2017	\N	\N	f
20	Lubuskie	LUB	2014	\N	\N	t
\.


--
-- Data for Name: nations; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.nations (id, name, short_name, flag, logo) FROM stdin;
1	Vietnam	QER	http://instagram.com/fr	https://reddit.com/settings
2	Nigeria	VZE	https://whatsapp.com/user/110	http://google.com/settings
3	United States	RFX	https://whatsapp.com/sub	https://netflix.com/sub/cars
4	Canada	IJF	http://walmart.com/user/110	http://wikipedia.org/settings
5	Pakistan	QFD	http://bbc.co.uk/en-us	https://guardian.co.uk/en-us
6	Peru	TBM	https://facebook.com/one	http://pinterest.com/en-us
7	Singapore	BPK	https://google.com/group/9	https://google.com/settings
8	Turkey	TVX	http://facebook.com/group/9	https://youtube.com/settings
9	Australia	PSH	http://twitter.com/sub/cars	http://netflix.com/site
10	Finland	SRZ	http://netflix.com/site	https://reddit.com/sub/cars
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.players (id, first_name, last_name, jersey_number, player_position, player_order, nation_id, birth_year, height, weight, draft_team_id, start_year, end_year) FROM stdin;
1	Jordan	Shelton	99	N	1	9	1988	187	110	61	2019	\N
2	Hamish	Bird	79	K	2	6	1970	176	96	6	2012	\N
3	Odysseus	Conner	2	H	2	9	1976	174	89	45	2018	\N
4	Colby	Wyatt	43	N	2	2	1970	175	87	17	2019	\N
5	Kuame	Munoz	35	O	1	5	1976	184	100	19	2019	\N
6	Tyler	Sanchez	87	I	1	9	1998	190	71	54	2020	\N
7	Oren	Sanford	32	C	1	3	1979	190	74	38	2015	\N
8	Carlos	Phillips	20	K	2	8	1989	177	103	91	2018	\N
9	Zeph	Townsend	76	D	3	5	1989	188	70	72	2013	\N
10	Dalton	Sanford	3	D	1	4	1991	195	78	3	2015	\N
11	Calvin	Briggs	77	L	2	7	1984	180	93	59	2020	\N
12	Zane	Waters	56	Y	2	5	1978	185	97	34	2020	\N
13	Noah	Francis	41	S	3	6	1971	197	93	70	2022	\N
14	Nash	Kirk	10	H	1	2	1990	203	86	10	2014	\N
15	Palmer	Booth	56	Z	2	9	1993	183	86	83	2015	\N
16	Mannix	Price	61	A	2	2	1998	188	73	57	2018	\N
17	Rashad	Cannon	86	O	2	7	1973	180	91	62	2017	\N
18	Gregory	Tate	64	P	2	9	1975	176	87	19	2021	\N
19	Chester	Douglas	62	X	2	7	1993	196	95	76	2018	\N
20	Nolan	Tillman	32	Q	2	5	1988	173	76	17	2019	\N
21	Joel	Whitfield	91	H	1	9	1982	179	92	80	2014	\N
22	Len	Carver	27	D	2	6	1998	171	98	51	2012	\N
23	Clark	Haynes	41	G	2	8	1990	175	72	78	2014	\N
24	Kenneth	English	29	C	2	6	1990	183	79	58	2022	\N
25	Lewis	Mcknight	9	E	2	7	1979	172	87	33	2013	\N
26	Reuben	Reilly	83	H	3	3	1979	197	70	11	2017	\N
27	Derek	Salazar	53	M	3	4	1994	171	87	29	2016	\N
28	Conan	Briggs	77	K	2	4	1973	171	108	25	2018	\N
29	Burke	Sherman	94	N	2	3	1972	194	86	81	2022	\N
30	Nash	Henderson	66	W	2	3	1983	190	91	32	2014	\N
31	Michael	Bray	55	X	1	1	1986	196	73	16	2016	\N
32	Colton	Whitley	82	L	2	9	1978	195	73	50	2014	\N
33	Alexander	Kidd	15	M	2	3	1988	184	73	40	2013	\N
34	Luke	Dejesus	12	B	3	4	1998	185	78	66	2019	\N
35	Gareth	Hanson	96	Y	1	5	1980	193	108	22	2015	\N
36	Carson	Joyce	30	D	3	9	1989	181	95	89	2013	\N
37	Hammett	Kaufman	20	W	3	5	1972	186	80	47	2021	\N
38	Nasim	Galloway	94	C	2	5	1970	173	106	5	2017	\N
39	Dale	Rocha	74	K	1	4	1980	190	106	85	2019	\N
40	Louis	Higgins	73	D	2	5	1981	203	82	92	2021	\N
41	Alden	Hood	20	T	3	9	1998	174	92	31	2015	\N
42	Wesley	Dawson	16	Y	3	4	1986	175	96	91	2020	\N
43	Barry	Howard	84	L	2	3	1971	186	109	19	2021	\N
44	Josiah	Church	82	J	3	6	1978	175	75	92	2015	\N
45	Bruce	Davidson	13	Z	2	6	1993	177	94	16	2015	\N
46	Marsden	Dunlap	30	I	3	8	1983	175	97	72	2022	\N
47	Quamar	Ruiz	53	V	2	3	1992	189	72	80	2013	\N
48	Axel	Spears	64	Q	2	4	1984	194	86	80	2014	\N
49	Chaim	Merritt	74	N	1	2	1977	176	92	54	2019	\N
50	Elvis	Delaney	72	B	1	2	1970	202	108	83	2016	\N
51	Daquan	Barton	4	J	2	9	1975	174	92	83	2021	\N
52	Hoyt	Stout	16	K	1	1	1978	181	83	7	2019	\N
53	Ulric	Acevedo	44	Y	2	9	1995	202	103	66	2016	\N
54	Chandler	Horne	63	P	2	6	1985	203	93	31	2020	\N
55	Logan	Parks	24	L	3	6	1969	194	83	58	2012	\N
56	Ishmael	Blackburn	54	Q	3	2	1985	193	77	93	2014	\N
57	Thomas	Gates	95	Y	1	1	1993	196	81	23	2021	\N
58	Orson	Woodard	68	I	1	9	1982	185	92	52	2016	\N
59	Malachi	Charles	9	Y	2	8	1983	183	89	96	2021	\N
60	Benedict	Chandler	57	N	1	1	1991	185	88	65	2017	\N
61	Jerry	Jefferson	17	U	2	5	1992	194	85	55	2019	\N
62	Stuart	Lane	34	V	2	4	1997	182	109	76	2013	\N
63	Dexter	Hernandez	88	E	1	4	1979	171	97	9	2019	\N
64	Lionel	Noel	31	N	3	1	1975	203	107	94	2015	\N
65	Sawyer	Glenn	3	H	3	8	1987	171	109	78	2017	\N
66	Warren	Gilbert	83	R	2	8	1985	185	101	1	2020	\N
67	Keaton	Mckee	27	X	3	2	1971	174	78	1	2021	\N
68	Wade	Wright	75	C	1	8	1971	183	82	85	2019	\N
69	Jeremy	Valdez	56	Y	2	3	1988	181	98	47	2016	\N
70	Micah	Lowe	99	Y	1	3	1986	172	98	72	2012	\N
71	Tarik	Trevino	35	E	2	2	1982	175	84	62	2020	\N
72	Aladdin	Garrett	76	E	3	5	1989	171	95	21	2012	\N
73	Chandler	Dixon	79	L	2	6	1994	203	75	74	2018	\N
74	Nasim	Floyd	23	C	2	9	1989	194	86	71	2021	\N
75	Brendan	Atkins	36	X	2	4	1999	177	97	63	2015	\N
76	Cyrus	Rosario	18	J	3	7	1985	188	84	56	2015	\N
77	Damian	Giles	24	R	2	2	1994	170	96	68	2018	\N
78	Samuel	Calhoun	54	L	2	7	1980	200	73	89	2017	\N
79	Tad	Brewer	86	M	3	2	1978	175	88	69	2018	\N
80	Keegan	Malone	91	G	2	6	1977	195	89	10	2022	\N
81	Kato	Gay	2	R	3	4	1973	189	77	29	2020	\N
82	Henry	Hogan	8	T	1	5	1992	179	80	73	2014	\N
83	Gavin	Solis	85	M	1	6	1981	182	75	57	2021	\N
84	Derek	Mann	84	V	1	8	1995	193	77	11	2015	\N
85	Hector	Gardner	2	P	2	5	1990	199	70	21	2022	\N
86	Jeremy	Walter	89	Q	2	8	1995	190	92	46	2020	\N
87	Alec	Mueller	65	J	3	6	1998	201	105	30	2021	\N
88	Zachery	Barrera	69	G	1	9	1991	205	91	43	2014	\N
89	Alan	Haynes	38	I	2	7	1979	182	88	25	2014	\N
90	Hamish	Townsend	77	O	1	3	1985	190	96	78	2014	\N
91	Kareem	Dotson	73	D	1	7	1994	204	96	76	2020	\N
92	Macon	Barnett	87	G	2	6	1976	176	76	2	2013	\N
93	Caesar	Pratt	99	V	3	7	1982	182	105	96	2019	\N
94	Hashim	Guy	10	Y	1	6	1987	202	73	76	2020	\N
95	Ivor	Mcleod	9	Q	3	3	1972	199	72	12	2016	\N
96	Camden	Riley	62	M	2	6	1991	174	100	50	2021	\N
97	Jack	Knox	8	F	3	9	1983	202	102	54	2017	\N
98	Tanek	Washington	70	M	3	3	1978	191	107	49	2013	\N
99	Solomon	Boyle	16	A	2	9	1971	178	108	47	2018	\N
100	Seth	Sanford	93	N	2	9	1993	198	98	63	2016	\N
\.


--
-- Data for Name: players_tournaments; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.players_tournaments (teams_tournament_id, player_id, games, goals, postseason) FROM stdin;
21	54	27	86	\N
79	17	28	3	\N
62	48	11	80	\N
71	87	28	5	\N
27	98	22	30	\N
10	71	12	84	\N
24	45	6	21	\N
68	45	10	34	\N
47	47	10	81	\N
58	18	21	46	\N
3	35	4	73	\N
70	85	14	82	\N
49	58	28	92	\N
69	45	28	77	\N
84	42	23	20	\N
22	20	6	86	\N
92	37	16	97	\N
89	100	20	21	\N
99	94	26	36	\N
54	12	20	94	\N
71	4	19	59	\N
18	54	11	58	\N
65	75	15	87	\N
86	92	3	25	\N
91	9	3	18	\N
97	49	28	46	\N
85	26	8	52	\N
81	84	28	33	\N
62	80	29	11	\N
70	62	30	89	\N
47	32	20	98	\N
26	60	4	16	\N
24	88	1	91	\N
44	9	30	16	\N
43	27	13	63	\N
73	49	18	95	\N
34	38	16	18	\N
80	85	23	26	\N
78	61	7	47	\N
39	12	3	21	\N
26	58	12	82	\N
98	62	19	5	\N
80	10	27	88	\N
52	19	14	52	\N
56	23	17	87	\N
24	24	19	91	\N
88	61	17	96	\N
17	63	20	69	\N
3	96	19	59	\N
2	72	15	18	\N
30	60	4	24	\N
6	28	8	5	\N
67	16	29	21	\N
16	24	10	11	\N
15	95	6	58	\N
69	83	21	88	\N
99	19	30	78	\N
76	21	16	89	\N
68	2	20	65	\N
30	97	9	37	\N
33	52	5	48	\N
86	56	16	97	\N
42	41	26	63	\N
13	40	4	71	\N
35	75	7	89	\N
20	96	26	43	\N
79	2	20	38	\N
45	62	29	25	\N
95	57	18	95	\N
10	51	17	60	\N
86	37	25	45	\N
4	17	19	97	\N
29	62	21	86	\N
95	18	2	86	\N
85	31	10	64	\N
83	66	11	25	\N
3	66	14	4	\N
63	79	21	87	\N
39	45	27	35	\N
59	10	21	79	\N
70	12	30	92	\N
84	65	28	32	\N
14	64	13	65	\N
28	10	12	76	\N
33	17	16	24	\N
38	52	21	70	\N
34	57	26	49	\N
29	67	13	57	\N
15	33	21	38	\N
11	70	29	81	\N
90	8	30	11	\N
68	85	15	80	\N
19	76	23	61	\N
82	92	29	94	\N
67	15	10	97	\N
91	48	1	6	\N
100	27	12	92	\N
15	47	24	19	\N
18	23	29	62	\N
80	78	28	35	\N
17	88	20	35	\N
13	39	14	23	\N
62	71	11	59	\N
64	75	3	73	\N
64	51	30	10	\N
85	54	20	92	\N
73	84	25	89	\N
55	12	7	54	\N
90	4	22	11	\N
93	62	3	20	\N
20	42	17	29	\N
26	51	28	8	\N
40	69	5	50	\N
56	8	23	36	\N
9	66	4	4	\N
16	28	27	42	\N
80	80	23	44	\N
49	87	4	76	\N
4	17	26	34	\N
7	45	16	12	\N
73	86	6	72	\N
15	49	13	10	\N
63	52	23	86	\N
19	39	7	49	\N
45	1	9	28	\N
11	58	8	42	\N
19	27	17	83	\N
68	57	28	31	\N
34	73	17	13	\N
6	51	23	19	\N
63	72	4	25	\N
27	49	10	43	\N
8	50	18	11	\N
83	81	21	6	\N
85	36	9	7	\N
1	85	11	96	\N
38	58	16	19	\N
59	86	22	29	\N
64	40	23	65	\N
93	55	19	98	\N
84	5	3	45	\N
91	63	24	71	\N
85	22	10	12	\N
57	30	18	77	\N
62	87	10	99	\N
89	72	20	41	\N
59	89	1	66	\N
76	84	10	9	\N
26	17	5	23	\N
16	82	15	40	\N
60	32	7	16	\N
67	70	23	87	\N
12	60	22	84	\N
31	48	18	57	\N
76	79	26	84	\N
89	38	10	9	\N
15	14	18	57	\N
50	12	18	36	\N
77	35	9	77	\N
27	54	26	66	\N
31	64	9	59	\N
85	18	7	22	\N
4	7	24	76	\N
24	81	3	67	\N
50	17	9	24	\N
7	86	26	29	\N
69	33	10	21	\N
85	85	3	28	\N
65	57	17	84	\N
58	48	22	29	\N
4	21	25	18	\N
10	26	25	15	\N
79	65	25	58	\N
1	43	6	38	\N
70	49	15	27	\N
63	83	20	85	\N
80	6	24	94	\N
26	21	12	45	\N
71	74	25	95	\N
67	97	4	77	\N
10	46	22	31	\N
64	89	26	11	\N
85	52	22	12	\N
98	5	12	67	\N
88	22	21	85	\N
39	59	20	66	\N
12	56	21	92	\N
85	72	3	98	\N
75	35	14	96	\N
26	87	29	29	\N
2	47	7	34	\N
85	48	27	61	\N
53	60	4	43	\N
84	97	3	24	\N
74	99	17	78	\N
12	76	19	14	\N
51	23	16	34	\N
52	38	29	16	\N
93	46	15	34	\N
69	20	19	48	\N
\.


--
-- Data for Name: seasons; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.seasons (id, name, start_year) FROM stdin;
1	2012-13	2012
2	2013-14	2013
3	2014-15	2014
4	2015-16	2015
5	2016-17	2016
6	2017-18	2017
7	2018-19	2018
8	2019-20	2019
9	2020-21	2020
10	2021-22	2021
\.


--
-- Data for Name: team_logos; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.team_logos (id, team_id, start_year, end_year, logo) FROM stdin;
1	84	2019	\N	https://ebay.com/fr
2	27	2018	\N	https://nytimes.com/settings
3	97	2019	\N	https://nytimes.com/group/9
4	9	2013	\N	http://baidu.com/en-ca
5	97	2016	\N	https://pinterest.com/sub/cars
6	33	2016	\N	http://bbc.co.uk/sub
7	81	2012	\N	http://zoom.us/fr
8	89	2016	\N	https://ebay.com/site
9	28	2017	\N	https://zoom.us/en-ca
10	38	2017	\N	http://ebay.com/fr
11	20	2019	\N	http://pinterest.com/fr
12	29	2020	\N	https://bbc.co.uk/settings
13	32	2015	\N	https://whatsapp.com/one
14	70	2015	\N	http://facebook.com/sub
15	56	2014	\N	http://pinterest.com/sub/cars
16	32	2014	\N	https://baidu.com/group/9
17	36	2012	\N	https://bbc.co.uk/site
18	81	2013	\N	http://guardian.co.uk/settings
19	3	2013	\N	http://reddit.com/site
20	20	2018	\N	https://youtube.com/sub
21	89	2012	\N	https://twitter.com/group/9
22	94	2013	\N	http://naver.com/settings
23	79	2018	\N	https://nytimes.com/fr
24	43	2012	\N	http://ebay.com/fr
25	20	2020	\N	https://whatsapp.com/sub/cars
26	88	2015	\N	https://walmart.com/user/110
27	58	2019	\N	https://facebook.com/group/9
28	31	2017	\N	http://pinterest.com/sub/cars
29	69	2016	\N	https://wikipedia.org/en-ca
30	97	2014	\N	https://whatsapp.com/sub/cars
31	90	2014	\N	http://netflix.com/en-us
32	50	2014	\N	http://cnn.com/en-ca
33	54	2013	\N	http://google.com/en-us
34	50	2019	\N	https://bbc.co.uk/en-ca
35	2	2016	\N	https://netflix.com/settings
36	50	2020	\N	https://zoom.us/group/9
37	90	2019	\N	http://walmart.com/group/9
38	35	2012	\N	https://twitter.com/site
39	56	2016	\N	https://cnn.com/en-us
40	26	2019	\N	http://guardian.co.uk/one
41	30	2015	\N	https://whatsapp.com/en-us
42	35	2016	\N	https://youtube.com/user/110
43	66	2012	\N	http://yahoo.com/one
44	45	2013	\N	http://netflix.com/en-ca
45	54	2015	\N	https://google.com/group/9
46	29	2015	\N	https://naver.com/one
47	76	2019	\N	http://zoom.us/sub/cars
48	24	2017	\N	https://google.com/settings
49	75	2016	\N	https://facebook.com/group/9
50	19	2018	\N	https://walmart.com/en-us
51	71	2016	\N	https://ebay.com/user/110
52	47	2017	\N	http://instagram.com/user/110
53	12	2020	\N	https://nytimes.com/en-us
54	45	2016	\N	http://bbc.co.uk/fr
55	54	2015	\N	http://wikipedia.org/sub/cars
56	62	2015	\N	https://pinterest.com/site
57	64	2014	\N	https://walmart.com/one
58	5	2017	\N	http://naver.com/site
59	53	2019	\N	https://zoom.us/user/110
60	36	2014	\N	https://guardian.co.uk/en-ca
61	71	2019	\N	http://twitter.com/one
62	97	2013	\N	https://facebook.com/fr
63	19	2018	\N	http://yahoo.com/sub
64	3	2017	\N	https://guardian.co.uk/fr
65	86	2013	\N	http://guardian.co.uk/en-ca
66	40	2013	\N	https://twitter.com/site
67	23	2017	\N	http://walmart.com/one
68	20	2017	\N	http://youtube.com/sub
69	71	2014	\N	https://netflix.com/en-us
70	71	2013	\N	https://reddit.com/user/110
71	81	2016	\N	http://baidu.com/site
72	9	2014	\N	http://naver.com/fr
73	43	2017	\N	https://instagram.com/en-ca
74	84	2016	\N	https://bbc.co.uk/settings
75	98	2017	\N	https://instagram.com/one
76	40	2018	\N	http://instagram.com/en-ca
77	44	2017	\N	http://nytimes.com/sub
78	15	2015	\N	http://yahoo.com/settings
79	21	2015	\N	http://naver.com/user/110
80	88	2018	\N	https://youtube.com/group/9
81	84	2016	\N	https://google.com/group/9
82	4	2018	\N	http://walmart.com/one
83	72	2013	\N	http://guardian.co.uk/en-ca
84	17	2013	\N	http://facebook.com/sub
85	16	2019	\N	http://naver.com/en-us
86	80	2015	\N	https://youtube.com/sub/cars
87	60	2019	\N	http://ebay.com/site
88	65	2014	\N	http://whatsapp.com/en-ca
89	57	2014	\N	http://google.com/one
90	39	2014	\N	http://twitter.com/settings
91	1	2016	\N	https://wikipedia.org/one
92	57	2013	\N	http://nytimes.com/sub/cars
93	9	2012	\N	http://reddit.com/en-ca
94	43	2013	\N	http://reddit.com/user/110
95	4	2018	\N	http://bbc.co.uk/user/110
96	10	2012	\N	http://facebook.com/site
97	54	2016	\N	http://twitter.com/en-us
98	98	2013	\N	https://ebay.com/fr
99	19	2020	\N	http://netflix.com/group/9
100	54	2017	\N	http://netflix.com/en-ca
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.teams (id, full_name, name, short_name, nation_id) FROM stdin;
1	mattis semper,	Limón (Puerto Limón]	EYE	2
2	posuere at,	Cà Mau	VUH	4
3	vitae erat	Calbayog	ABP	7
4	semper tellus	Mộc Châu	CDO	5
5	mi enim,	Castelvecchio di Rocca Barbena	KKM	2
6	In at	Seogwipo	NXC	7
7	enim. Etiam	Gunsan	DNF	9
8	ornare, libero	Mohmand Agency	QGW	6
9	egestas lacinia.	Heusden	VFA	8
10	odio, auctor	Fayetteville	SYM	7
11	vitae dolor.	Gorzów Wielkopolski	ENJ	6
12	dui, nec	Louisville	TWF	4
13	amet orci.	Słupsk	GBH	6
14	egestas. Aliquam	Juazeiro do Norte	STG	7
15	amet diam	Los Mochis	RUX	6
16	nisl. Quisque	Manokwari	NNM	5
17	morbi tristique	Mandai	GBC	6
18	ut quam	Finspång	LIQ	7
19	rutrum eu,	Geoje	FOH	1
20	ac mi	Salles	CJF	8
21	vulputate, lacus.	Culemborg	CKT	1
22	a, auctor	Liberia	XRP	10
23	fermentum fermentum	Maaseik	RVW	6
24	at fringilla	Vienna	OAH	2
25	lobortis mauris.	Águas Lindas de Goiás	FUT	4
26	viverra. Maecenas	Autre-Eglise	EFO	7
27	eget lacus.	Wibrin	QZG	5
28	elit, pharetra	San Mauro Cilento	OCT	2
29	quis, tristique	Casciana Terme	TAI	8
30	ac orci.	Pangnirtung	IHH	3
31	lorem tristique	Bukit Merah	XVF	5
32	aliquam iaculis,	Bremerhaven	VTF	4
33	molestie dapibus	San Juan del Río	JOR	5
34	augue porttitor	Itajaí	VFM	2
35	Cras eget	Penzance	SLR	2
36	neque non	Knittelfeld	ECH	8
37	a, facilisis	Calarcá	BTF	4
38	suscipit nonummy.	Pontianak	RBZ	9
39	Donec consectetuer	Guizhou	UCL	2
40	magna. Ut	Terme	KOU	4
41	fermentum fermentum	Pike Creek	UPQ	4
42	eu, placerat	De Haan	EUX	4
43	magnis dis	Wellington	QEJ	2
44	eu dui.	Kaduna	EWT	10
45	nisi. Cum	Dole	HST	3
46	in consequat	Zwelitsha	YGP	1
47	ultrices sit	Kasterlee	RYZ	2
48	urna, nec	Belfast	HXH	4
49	faucibus id,	Alençon	JDO	5
50	erat neque	Cotabato City	DNX	7
51	metus vitae	Lagos	SYS	5
52	Duis cursus,	Chungju	PQZ	10
53	augue scelerisque	Evesham	MYO	2
54	non lorem	Dublin	DKV	8
55	non, feugiat	Galway	UNW	6
56	sociis natoque	Vadodara	RED	7
57	elit, pellentesque	Dera Ghazi Khan	RGK	7
58	Quisque tincidunt	Oviedo	FCH	3
59	Cum sociis	Chiclayo	BTQ	2
60	ligula tortor,	Kharmang	PTQ	3
61	augue malesuada	Novozybkov	FSY	2
62	libero lacus,	Ankara	UGA	4
63	Mauris non	Kidapawan	SKZ	5
64	et, rutrum	Matamoros	DGI	6
65	sed pede.	Marine Parade	MQK	4
66	dolor quam,	Mamuju	FTW	6
67	mauris eu	Cao Bằng	HHS	5
68	egestas a,	Queenstown	WKR	5
69	Cras dolor	Cork	HNT	7
70	est. Mauris	Merdorp	LYP	10
71	sit amet	Penza	DNL	6
72	aliquet, metus	Piła	SJI	3
73	enim, sit	Nelson	VUO	9
74	nisi nibh	Nazilli	MRF	7
75	vel pede	Bruck an der Mur	UDY	3
76	Aliquam erat	Olinda	WCQ	5
77	ipsum non	Hoorn	QIL	1
78	neque vitae	Bengkulu	MHC	2
79	consectetuer adipiscing	Çeşme	RMS	5
80	sit amet	San Andrés	RGW	5
81	nisl arcu	Upplands Väsby	OCP	10
82	Sed malesuada	Huaraz	VHO	4
83	Maecenas iaculis	Dörtyol	VYP	5
84	mauris sapien,	Santa Marta	MXN	3
85	lorem lorem,	Şereflikoçhisar	KVB	10
86	Phasellus ornare.	Rankweil	WSX	8
87	nonummy ultricies	Cape Breton Island	NBO	9
88	tincidunt nibh.	Nordhorn	HTE	7
89	tristique pharetra.	Querétaro	BFV	2
90	pretium aliquet,	Magadan	JRF	5
91	Proin velit.	Kharmang	WGK	9
92	imperdiet nec,	Sankt Johann im Pongau	EOB	8
93	at, velit.	Futrono	IQT	7
94	lectus. Nullam	Logroño	VDD	7
95	neque tellus,	Graaff-Reinet	FDP	6
96	diam nunc,	Chihuahua	UXY	6
97	vel nisl.	Jayapura	NUD	3
98	luctus felis	Pachuca	RJJ	3
99	euismod et,	Guwahati	MYV	8
100	Integer in	Mülheim	QJU	2
\.


--
-- Data for Name: teams_tournaments; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.teams_tournaments (id, tournament_id, team_id, games, wins, ties, losts, goals_for, goals_against, postseason) FROM stdin;
1	6	32	21	15	6	8	55	20	\N
2	11	5	29	6	2	11	62	48	\N
3	17	15	20	5	6	23	17	100	\N
4	1	26	23	26	1	22	72	77	\N
5	13	24	23	22	7	1	60	35	\N
6	18	48	9	8	5	9	28	74	\N
7	17	1	12	13	7	14	37	79	\N
8	9	16	25	26	8	21	60	98	\N
9	14	10	2	12	6	29	74	98	\N
10	7	2	12	2	3	22	10	54	\N
11	16	31	28	10	9	3	39	4	\N
12	6	46	14	15	8	6	2	18	\N
13	14	9	5	10	9	2	85	66	\N
14	8	43	20	10	0	8	84	93	\N
15	11	35	27	21	1	11	75	61	\N
16	7	35	11	4	0	27	55	12	\N
17	13	41	12	19	8	15	3	58	\N
18	3	38	26	17	7	27	78	67	\N
19	6	34	4	8	5	10	37	25	\N
20	13	15	8	4	5	15	70	8	\N
21	15	33	9	12	7	30	64	39	\N
22	2	10	17	27	2	7	71	26	\N
23	7	28	7	23	7	22	64	94	\N
24	3	30	8	15	7	10	77	39	\N
25	7	46	11	7	1	14	49	31	\N
26	14	17	14	25	7	1	25	95	\N
27	4	20	7	9	6	7	5	65	\N
28	5	40	14	13	9	27	52	48	\N
29	6	11	24	16	2	17	19	24	\N
30	11	29	21	5	2	27	25	29	\N
31	14	24	24	10	9	12	50	82	\N
32	6	7	14	27	8	25	40	11	\N
33	14	39	14	25	8	9	63	48	\N
34	7	27	13	3	0	14	84	93	\N
35	16	6	18	17	1	29	70	93	\N
36	2	2	26	16	8	29	27	47	\N
37	15	14	10	3	2	18	86	20	\N
38	17	36	21	2	6	29	64	36	\N
39	10	4	13	13	3	21	50	71	\N
40	5	42	17	20	8	20	13	51	\N
41	8	19	28	20	6	13	3	79	\N
42	6	38	13	10	9	7	47	58	\N
43	18	35	2	13	6	28	45	20	\N
44	3	18	20	8	1	25	58	64	\N
45	19	42	12	20	10	27	39	84	\N
46	11	1	25	9	7	22	68	99	\N
47	7	35	27	19	8	4	14	57	\N
48	18	24	20	10	3	18	43	15	\N
49	12	12	25	22	8	14	47	88	\N
50	17	16	12	14	1	14	23	66	\N
51	7	33	10	13	2	12	54	92	\N
52	5	45	3	9	6	9	9	61	\N
53	2	49	17	10	8	11	20	55	\N
54	13	4	21	23	2	5	23	98	\N
55	4	40	28	27	4	19	50	75	\N
56	4	3	26	6	3	17	5	71	\N
57	4	2	6	19	3	2	12	23	\N
58	12	7	11	10	6	15	16	10	\N
59	8	44	28	17	3	10	30	16	\N
60	14	6	18	27	3	11	54	92	\N
61	14	29	25	23	4	3	27	18	\N
62	14	13	10	1	4	24	85	70	\N
63	5	32	8	19	4	8	22	57	\N
64	2	11	24	21	1	28	83	22	\N
65	8	14	25	22	10	8	83	21	\N
66	2	1	28	22	7	4	42	73	\N
67	18	28	19	12	9	16	27	96	\N
68	10	30	22	27	6	28	3	93	\N
69	12	8	26	2	4	2	81	28	\N
70	3	22	22	3	3	8	76	63	\N
71	3	31	10	11	2	5	19	47	\N
72	9	14	2	21	8	11	85	37	\N
73	18	29	11	7	1	17	80	93	\N
74	11	36	4	8	5	2	33	86	\N
75	16	1	6	9	7	21	95	80	\N
76	10	50	21	29	2	2	53	3	\N
77	9	14	11	13	5	9	21	29	\N
78	14	13	15	12	1	30	56	44	\N
79	16	40	8	18	1	24	61	94	\N
80	7	40	28	1	7	8	47	21	\N
81	13	9	18	23	4	22	65	44	\N
82	16	3	28	9	4	14	8	12	\N
83	15	44	27	13	4	29	60	84	\N
84	2	36	3	21	9	12	47	39	\N
85	18	38	10	8	6	7	67	2	\N
86	12	41	22	11	2	5	15	19	\N
87	15	37	16	11	10	2	82	10	\N
88	5	37	19	29	3	6	42	66	\N
89	18	50	6	7	7	9	76	92	\N
90	19	47	6	22	4	4	22	95	\N
91	16	10	24	14	4	21	24	46	\N
92	3	43	29	5	2	4	9	31	\N
93	9	26	27	5	0	6	54	50	\N
94	9	3	17	4	3	12	59	30	\N
95	3	49	12	7	2	25	84	69	\N
96	6	35	30	8	2	29	32	74	\N
97	14	13	29	8	7	24	2	42	\N
98	12	39	1	8	10	26	61	28	\N
99	7	43	12	2	8	20	97	57	\N
100	3	44	28	10	6	20	71	21	\N
\.


--
-- Data for Name: tournaments; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.tournaments (id, season_id, league_id) FROM stdin;
1	3	18
2	2	13
3	3	8
4	8	5
5	5	9
6	9	11
7	3	2
8	2	10
9	2	15
10	7	19
11	6	12
12	3	15
13	5	12
14	10	10
15	4	2
16	2	13
17	7	19
18	5	16
19	9	18
20	2	19
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


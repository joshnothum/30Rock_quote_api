--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: character; Type: TABLE; Schema: public; Owner: joshnothum
--

CREATE TABLE "character" (
    id integer NOT NULL,
    name character varying(35)
);


ALTER TABLE "character" OWNER TO joshnothum;

--
-- Name: character_id_seq; Type: SEQUENCE; Schema: public; Owner: joshnothum
--

CREATE SEQUENCE character_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE character_id_seq OWNER TO joshnothum;

--
-- Name: episode; Type: TABLE; Schema: public; Owner: joshnothum
--

CREATE TABLE episode (
    id integer NOT NULL,
    title character varying(240)
);


ALTER TABLE episode OWNER TO joshnothum;

--
-- Name: episode_id_seq; Type: SEQUENCE; Schema: public; Owner: joshnothum
--

CREATE SEQUENCE episode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE episode_id_seq OWNER TO joshnothum;

--
-- Name: episode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: joshnothum
--

ALTER SEQUENCE episode_id_seq OWNED BY episode.id;


--
-- Name: quote; Type: TABLE; Schema: public; Owner: joshnothum
--

CREATE TABLE quote (
    id integer NOT NULL,
    quote character varying,
    character_id integer,
    episode_id integer
);


ALTER TABLE quote OWNER TO joshnothum;

--
-- Name: quote_id_seq; Type: SEQUENCE; Schema: public; Owner: joshnothum
--

CREATE SEQUENCE quote_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quote_id_seq OWNER TO joshnothum;

--
-- Name: quote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: joshnothum
--

ALTER SEQUENCE quote_id_seq OWNED BY quote.id;


--
-- Name: screenshot; Type: TABLE; Schema: public; Owner: joshnothum
--

CREATE TABLE screenshot (
    id integer NOT NULL,
    start numeric,
    "end" numeric,
    quote_id integer
);


ALTER TABLE screenshot OWNER TO joshnothum;

--
-- Name: screenshot_id_seq; Type: SEQUENCE; Schema: public; Owner: joshnothum
--

CREATE SEQUENCE screenshot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE screenshot_id_seq OWNER TO joshnothum;

--
-- Name: screenshot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: joshnothum
--

ALTER SEQUENCE screenshot_id_seq OWNED BY screenshot.id;


--
-- Name: season; Type: TABLE; Schema: public; Owner: joshnothum
--

CREATE TABLE season (
    id integer NOT NULL
);


ALTER TABLE season OWNER TO joshnothum;

--
-- Name: season_id_seq; Type: SEQUENCE; Schema: public; Owner: joshnothum
--

CREATE SEQUENCE season_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE season_id_seq OWNER TO joshnothum;

--
-- Name: season_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: joshnothum
--

ALTER SEQUENCE season_id_seq OWNED BY season.id;


--
-- Name: episode id; Type: DEFAULT; Schema: public; Owner: joshnothum
--

ALTER TABLE ONLY episode ALTER COLUMN id SET DEFAULT nextval('episode_id_seq'::regclass);


--
-- Name: quote id; Type: DEFAULT; Schema: public; Owner: joshnothum
--

ALTER TABLE ONLY quote ALTER COLUMN id SET DEFAULT nextval('quote_id_seq'::regclass);


--
-- Name: screenshot id; Type: DEFAULT; Schema: public; Owner: joshnothum
--

ALTER TABLE ONLY screenshot ALTER COLUMN id SET DEFAULT nextval('screenshot_id_seq'::regclass);


--
-- Name: season id; Type: DEFAULT; Schema: public; Owner: joshnothum
--

ALTER TABLE ONLY season ALTER COLUMN id SET DEFAULT nextval('season_id_seq'::regclass);


--
-- Data for Name: character; Type: TABLE DATA; Schema: public; Owner: joshnothum
--

COPY "character" (id, name) FROM stdin;
1	Jack Donaghey
\.


--
-- Data for Name: episode; Type: TABLE DATA; Schema: public; Owner: joshnothum
--

COPY episode (id, title) FROM stdin;
\.


--
-- Data for Name: quote; Type: TABLE DATA; Schema: public; Owner: joshnothum
--

COPY quote (id, quote, character_id, episode_id) FROM stdin;
1	"It's after six. What am I? A farmer?"	1	\N
\.


--
-- Data for Name: screenshot; Type: TABLE DATA; Schema: public; Owner: joshnothum
--

COPY screenshot (id, start, "end", quote_id) FROM stdin;
\.


--
-- Data for Name: season; Type: TABLE DATA; Schema: public; Owner: joshnothum
--

COPY season (id) FROM stdin;
\.


--
-- Name: character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: joshnothum
--

SELECT pg_catalog.setval('character_id_seq', 1, false);


--
-- Name: episode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: joshnothum
--

SELECT pg_catalog.setval('episode_id_seq', 1, false);


--
-- Name: quote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: joshnothum
--

SELECT pg_catalog.setval('quote_id_seq', 1, false);


--
-- Name: screenshot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: joshnothum
--

SELECT pg_catalog.setval('screenshot_id_seq', 1, false);


--
-- Name: season_id_seq; Type: SEQUENCE SET; Schema: public; Owner: joshnothum
--

SELECT pg_catalog.setval('season_id_seq', 1, false);


--
-- Name: character character_pkey; Type: CONSTRAINT; Schema: public; Owner: joshnothum
--

ALTER TABLE ONLY "character"
    ADD CONSTRAINT character_pkey PRIMARY KEY (id);


--
-- Name: episode episode_pkey; Type: CONSTRAINT; Schema: public; Owner: joshnothum
--

ALTER TABLE ONLY episode
    ADD CONSTRAINT episode_pkey PRIMARY KEY (id);


--
-- Name: quote quote_pkey; Type: CONSTRAINT; Schema: public; Owner: joshnothum
--

ALTER TABLE ONLY quote
    ADD CONSTRAINT quote_pkey PRIMARY KEY (id);


--
-- Name: screenshot screenshot_pkey; Type: CONSTRAINT; Schema: public; Owner: joshnothum
--

ALTER TABLE ONLY screenshot
    ADD CONSTRAINT screenshot_pkey PRIMARY KEY (id);


--
-- Name: season season_pkey; Type: CONSTRAINT; Schema: public; Owner: joshnothum
--

ALTER TABLE ONLY season
    ADD CONSTRAINT season_pkey PRIMARY KEY (id);


--
-- Name: quote quote_character_fkey; Type: FK CONSTRAINT; Schema: public; Owner: joshnothum
--

ALTER TABLE ONLY quote
    ADD CONSTRAINT quote_character_fkey FOREIGN KEY (character_id) REFERENCES "character"(id);


--
-- Name: quote quote_episode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: joshnothum
--

ALTER TABLE ONLY quote
    ADD CONSTRAINT quote_episode_id_fkey FOREIGN KEY (episode_id) REFERENCES episode(id);


--
-- Name: screenshot screenshot_quote_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: joshnothum
--

ALTER TABLE ONLY screenshot
    ADD CONSTRAINT screenshot_quote_id_fkey FOREIGN KEY (quote_id) REFERENCES quote(id);


--
-- PostgreSQL database dump complete
--


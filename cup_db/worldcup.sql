--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    round character varying(50) NOT NULL,
    year integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (129, 195, 196, 'Final', 2018, 4, 2);
INSERT INTO public.games VALUES (130, 197, 198, 'Third Place', 2018, 2, 0);
INSERT INTO public.games VALUES (131, 196, 198, 'Semi-Final', 2018, 2, 1);
INSERT INTO public.games VALUES (132, 195, 197, 'Semi-Final', 2018, 1, 0);
INSERT INTO public.games VALUES (133, 196, 199, 'Quarter-Final', 2018, 3, 2);
INSERT INTO public.games VALUES (134, 198, 200, 'Quarter-Final', 2018, 2, 0);
INSERT INTO public.games VALUES (135, 197, 201, 'Quarter-Final', 2018, 2, 1);
INSERT INTO public.games VALUES (136, 195, 202, 'Quarter-Final', 2018, 2, 0);
INSERT INTO public.games VALUES (137, 198, 203, 'Eighth-Final', 2018, 2, 1);
INSERT INTO public.games VALUES (138, 200, 204, 'Eighth-Final', 2018, 1, 0);
INSERT INTO public.games VALUES (139, 197, 205, 'Eighth-Final', 2018, 3, 2);
INSERT INTO public.games VALUES (140, 201, 206, 'Eighth-Final', 2018, 2, 0);
INSERT INTO public.games VALUES (141, 196, 207, 'Eighth-Final', 2018, 2, 1);
INSERT INTO public.games VALUES (142, 199, 208, 'Eighth-Final', 2018, 2, 1);
INSERT INTO public.games VALUES (143, 202, 209, 'Eighth-Final', 2018, 2, 1);
INSERT INTO public.games VALUES (144, 195, 210, 'Eighth-Final', 2018, 4, 3);
INSERT INTO public.games VALUES (145, 211, 210, 'Final', 2014, 1, 0);
INSERT INTO public.games VALUES (146, 212, 201, 'Third Place', 2014, 3, 0);
INSERT INTO public.games VALUES (147, 210, 212, 'Semi-Final', 2014, 1, 0);
INSERT INTO public.games VALUES (148, 211, 201, 'Semi-Final', 2014, 7, 1);
INSERT INTO public.games VALUES (149, 212, 213, 'Quarter-Final', 2014, 1, 0);
INSERT INTO public.games VALUES (150, 210, 197, 'Quarter-Final', 2014, 1, 0);
INSERT INTO public.games VALUES (151, 201, 203, 'Quarter-Final', 2014, 2, 1);
INSERT INTO public.games VALUES (152, 211, 195, 'Quarter-Final', 2014, 1, 0);
INSERT INTO public.games VALUES (153, 201, 214, 'Eighth-Final', 2014, 2, 1);
INSERT INTO public.games VALUES (154, 203, 202, 'Eighth-Final', 2014, 2, 0);
INSERT INTO public.games VALUES (155, 195, 215, 'Eighth-Final', 2014, 2, 0);
INSERT INTO public.games VALUES (156, 211, 216, 'Eighth-Final', 2014, 2, 1);
INSERT INTO public.games VALUES (157, 212, 206, 'Eighth-Final', 2014, 2, 1);
INSERT INTO public.games VALUES (158, 213, 217, 'Eighth-Final', 2014, 2, 1);
INSERT INTO public.games VALUES (159, 210, 204, 'Eighth-Final', 2014, 1, 0);
INSERT INTO public.games VALUES (160, 197, 218, 'Eighth-Final', 2014, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (195, 'France');
INSERT INTO public.teams VALUES (196, 'Croatia');
INSERT INTO public.teams VALUES (197, 'Belgium');
INSERT INTO public.teams VALUES (198, 'England');
INSERT INTO public.teams VALUES (199, 'Russia');
INSERT INTO public.teams VALUES (200, 'Sweden');
INSERT INTO public.teams VALUES (201, 'Brazil');
INSERT INTO public.teams VALUES (202, 'Uruguay');
INSERT INTO public.teams VALUES (203, 'Colombia');
INSERT INTO public.teams VALUES (204, 'Switzerland');
INSERT INTO public.teams VALUES (205, 'Japan');
INSERT INTO public.teams VALUES (206, 'Mexico');
INSERT INTO public.teams VALUES (207, 'Denmark');
INSERT INTO public.teams VALUES (208, 'Spain');
INSERT INTO public.teams VALUES (209, 'Portugal');
INSERT INTO public.teams VALUES (210, 'Argentina');
INSERT INTO public.teams VALUES (211, 'Germany');
INSERT INTO public.teams VALUES (212, 'Netherlands');
INSERT INTO public.teams VALUES (213, 'Costa Rica');
INSERT INTO public.teams VALUES (214, 'Chile');
INSERT INTO public.teams VALUES (215, 'Nigeria');
INSERT INTO public.teams VALUES (216, 'Algeria');
INSERT INTO public.teams VALUES (217, 'Greece');
INSERT INTO public.teams VALUES (218, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 160, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 218, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--


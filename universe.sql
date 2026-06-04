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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    distance integer NOT NULL,
    year integer,
    mass numeric(7,2),
    is_inhabited boolean,
    is_good boolean DEFAULT true
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    distance integer NOT NULL,
    year integer,
    mass numeric(7,2),
    is_inhabited boolean,
    is_good boolean DEFAULT true,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: moon_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_station (
    moon_station_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    distance integer NOT NULL,
    year integer,
    mass numeric(7,2),
    is_inhabited boolean,
    is_good boolean DEFAULT true,
    moon_id integer
);


ALTER TABLE public.moon_station OWNER TO freecodecamp;

--
-- Name: moon_station_moon_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_station_moon_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_station_moon_station_id_seq OWNER TO freecodecamp;

--
-- Name: moon_station_moon_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_station_moon_station_id_seq OWNED BY public.moon_station.moon_station_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    distance integer NOT NULL,
    year integer,
    mass numeric(7,2),
    is_inhabited boolean,
    is_good boolean DEFAULT true,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    distance integer NOT NULL,
    year integer,
    mass numeric(7,2),
    is_inhabited boolean,
    is_good boolean DEFAULT true,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_station moon_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_station ALTER COLUMN moon_station_id SET DEFAULT nextval('public.moon_station_moon_station_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda I', 'Andromeda I World', 4586, 78295, 456.00, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda II', 'Andromeda II World', 6586, 72295, 954.00, true, true);
INSERT INTO public.galaxy VALUES (3, 'Andromeda III', 'Andromeda III World', 16586, 472295, 584.00, true, true);
INSERT INTO public.galaxy VALUES (4, 'Andromeda IV', 'Andromeda IV World', 86586, 94795, 467.00, true, true);
INSERT INTO public.galaxy VALUES (5, 'Black Eye', 'Black Eye World', 86686, 24795, 97.00, true, true);
INSERT INTO public.galaxy VALUES (6, 'Hydra', 'Hydra World', 1686, 2495, 917.00, true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Moon World', 816, 995, 5.00, true, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Phobos World', 816, 995, 5.00, true, true, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Deimos World', 816, 995, 5.00, true, true, 2);
INSERT INTO public.moon VALUES (4, 'Io', 'Io World', 816, 995, 5.00, true, true, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 'Europa World', 816, 995, 5.00, true, true, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Ganymede World', 816, 995, 5.00, true, true, 4);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Callisto World', 816, 995, 5.00, true, true, 4);
INSERT INTO public.moon VALUES (8, 'Dione', 'Dione World', 816, 995, 5.00, true, true, 3);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Enceladus World', 816, 995, 5.00, true, true, 3);
INSERT INTO public.moon VALUES (10, 'Epimetheus', 'Epimetheus World', 816, 995, 5.00, true, true, 3);
INSERT INTO public.moon VALUES (11, 'Prometheus', 'Prometheus World', 816, 995, 5.00, true, true, 3);
INSERT INTO public.moon VALUES (12, 'Mimas', 'Mimas World', 816, 995, 5.00, true, true, 3);
INSERT INTO public.moon VALUES (13, 'Rhea', 'Rhea World', 816, 995, 5.00, true, true, 3);
INSERT INTO public.moon VALUES (14, 'Janus', 'Janus World', 816, 995, 5.00, true, true, 3);
INSERT INTO public.moon VALUES (15, 'Tethys', 'Tethys World', 816, 995, 5.00, true, true, 3);
INSERT INTO public.moon VALUES (16, 'Titan', 'Titan World', 816, 995, 5.00, true, true, 3);
INSERT INTO public.moon VALUES (17, 'Miranda', 'Miranda World', 816, 995, 5.00, true, true, 6);
INSERT INTO public.moon VALUES (18, 'Ariel', 'Ariel World', 816, 995, 5.00, true, true, 6);
INSERT INTO public.moon VALUES (19, 'Umbriel', 'Umbriel World', 816, 995, 5.00, true, true, 6);
INSERT INTO public.moon VALUES (20, 'Titania', 'Titania World', 816, 995, 5.00, true, true, 6);
INSERT INTO public.moon VALUES (21, 'Oberon', 'Oberon World', 816, 995, 5.00, true, true, 6);
INSERT INTO public.moon VALUES (22, 'Triton', 'Triton World', 816, 995, 5.00, true, true, 7);
INSERT INTO public.moon VALUES (23, 'Nereid', 'Nereid World', 816, 995, 5.00, true, true, 7);
INSERT INTO public.moon VALUES (24, 'Halimede', 'Halimede World', 816, 995, 5.00, true, true, 7);
INSERT INTO public.moon VALUES (25, 'Sao', 'Sao World', 816, 995, 5.00, true, true, 7);
INSERT INTO public.moon VALUES (26, 'Laomedeia', 'Laomedeia World', 816, 995, 5.00, true, true, 7);
INSERT INTO public.moon VALUES (27, 'Psamathe', 'Psamathe World', 816, 995, 5.00, true, true, 7);
INSERT INTO public.moon VALUES (28, 'Neso', 'Neso World', 816, 995, 5.00, true, true, 7);


--
-- Data for Name: moon_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_station VALUES (1, 'Mir 1', 'Mir 1 World', 816, 995, 5.00, true, true, 1);
INSERT INTO public.moon_station VALUES (2, 'Mir 2', 'Mir 2 World', 816, 995, 5.00, true, true, 2);
INSERT INTO public.moon_station VALUES (3, 'Mir 3', 'Mir 3 World', 816, 995, 5.00, true, true, 3);
INSERT INTO public.moon_station VALUES (4, 'Mir 4', 'Mir 4 World', 816, 995, 5.00, true, true, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mars', 'Mars World', 416, 895, 7.00, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Saturn', 'Saturn World', 646, 7895, 5.00, true, true, 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Júpiter World', 716, 9395, 5.00, true, true, 2);
INSERT INTO public.planet VALUES (4, 'Venus', 'Venus World', 816, 4883, 5.00, true, true, 3);
INSERT INTO public.planet VALUES (5, 'Uranus', 'Uranus World', 126, 5795, 5.00, true, true, 3);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Neptune World', 36, 3695, 5.00, true, true, 4);
INSERT INTO public.planet VALUES (7, 'Pluto', 'Pluto World', 96, 9395, 5.00, true, true, 4);
INSERT INTO public.planet VALUES (8, 'Ceres', 'Ceres World', 66, 1295, 5.00, true, true, 5);
INSERT INTO public.planet VALUES (9, 'Eris', 'Eris World', 76, 895, 5.00, true, true, 5);
INSERT INTO public.planet VALUES (10, 'Charon', 'Charon World', 61, 795, 5.00, true, true, 6);
INSERT INTO public.planet VALUES (11, 'Mercury', 'Mercury World', 816, 995, 5.00, true, true, 6);
INSERT INTO public.planet VALUES (12, 'Earth', 'Earth World', 69, 485, 5.00, true, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Sirius World', 1686, 2495, 97.00, false, true, 1);
INSERT INTO public.star VALUES (2, 'Polaris', 'Polaris World', 686, 7895, 67.00, false, true, 2);
INSERT INTO public.star VALUES (3, 'Vega', 'Vega World', 686, 7895, 97.00, false, true, 3);
INSERT INTO public.star VALUES (4, 'Rigel', 'Rigel World', 186, 1895, 127.00, false, true, 4);
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 'Alpha Centauri World', 286, 7595, 671.00, false, true, 5);
INSERT INTO public.star VALUES (6, 'Orion', 'Orion World', 616, 4895, 367.00, false, true, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 28, true);


--
-- Name: moon_station_moon_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_station_moon_station_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon_station moon_station_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_station
    ADD CONSTRAINT moon_station_name_key UNIQUE (name);


--
-- Name: moon_station moon_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_station
    ADD CONSTRAINT moon_station_pkey PRIMARY KEY (moon_station_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon_station moon_station_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_station
    ADD CONSTRAINT moon_station_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


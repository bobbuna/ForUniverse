--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(20) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    description text,
    galaxy_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    description text,
    is_spherical boolean,
    planet_id integer,
    moon_id integer NOT NULL
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
-- Name: moon_to_galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_to_galaxy (
    moon_to_galaxy_id integer NOT NULL,
    moon_id integer NOT NULL,
    galaxy_id integer,
    name character varying
);


ALTER TABLE public.moon_to_galaxy OWNER TO freecodecamp;

--
-- Name: moon_to_galaxy_m_t_g_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_to_galaxy_m_t_g_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_to_galaxy_m_t_g_id_seq OWNER TO freecodecamp;

--
-- Name: moon_to_galaxy_m_t_g_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_to_galaxy_m_t_g_id_seq OWNED BY public.moon_to_galaxy.moon_to_galaxy_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(20) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    description text,
    has_life boolean,
    star_id integer,
    planet_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    description text,
    galaxy_id integer,
    star_id integer NOT NULL
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
-- Name: moon_to_galaxy moon_to_galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_to_galaxy ALTER COLUMN moon_to_galaxy_id SET DEFAULT nextval('public.moon_to_galaxy_m_t_g_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES ('Moon_1', 5, 243.5, 'it is a moon', 1);
INSERT INTO public.galaxy VALUES ('Galaxy_2', 5, 243.5, 'it is another galaxy', 2);
INSERT INTO public.galaxy VALUES ('Galaxy_3', 5, 243.5, 'it is another galaxy', 3);
INSERT INTO public.galaxy VALUES ('Galaxy_4', 5, 243.5, 'it is another galaxy', 4);
INSERT INTO public.galaxy VALUES ('Galaxy_5', 5, 243.5, 'it is another galaxy', 5);
INSERT INTO public.galaxy VALUES ('Galaxy_6', 5, 243.5, 'it is another galaxy', 6);
INSERT INTO public.galaxy VALUES ('Galaxy_7', 5, 243.5, 'it is another galaxy', 7);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon_1A', 5, 243.5, 'it is another galaxy', false, 7, 1);
INSERT INTO public.moon VALUES ('Moon_2', 5, 243.5, 'it is another galaxy', false, 2, 2);
INSERT INTO public.moon VALUES ('Moon_3', 5, 243.5, 'it is another galaxy', true, 2, 3);
INSERT INTO public.moon VALUES ('Moon_4', 5, 243.5, 'it is another galaxy', true, 3, 4);
INSERT INTO public.moon VALUES ('Moon_5', 5, 243.5, 'it is another galaxy', true, 13, 5);
INSERT INTO public.moon VALUES ('Moon_6', 5, 243.5, 'it is another galaxy', true, 13, 6);
INSERT INTO public.moon VALUES ('Moon_7', 5, 243.5, 'it is another galaxy', true, 13, 7);
INSERT INTO public.moon VALUES ('Moon_8', 5, 243.5, 'it is another galaxy', true, 13, 8);
INSERT INTO public.moon VALUES ('Moon_9', 5, 243.5, 'it is another galaxy', true, 13, 9);
INSERT INTO public.moon VALUES ('Moon_10', 5, 243.5, 'it is another galaxy', true, 11, 10);
INSERT INTO public.moon VALUES ('Moon_11', 5, 243.5, 'it is another galaxy', true, 11, 11);
INSERT INTO public.moon VALUES ('Moon_12', 5, 243.5, 'it is another galaxy', true, 11, 12);
INSERT INTO public.moon VALUES ('Moon_12', 5, 243.5, 'it is another galaxy', true, 15, 13);
INSERT INTO public.moon VALUES ('Moon_13', 5, 243.5, 'it is another galaxy', true, 15, 14);
INSERT INTO public.moon VALUES ('Moon_14', 5, 243.5, 'it is another galaxy', true, 15, 15);
INSERT INTO public.moon VALUES ('Moon_15', 5, 243.5, 'it is another galaxy', true, 9, 16);
INSERT INTO public.moon VALUES ('Moon_16', 5, 243.5, 'it is another galaxy', true, 9, 17);
INSERT INTO public.moon VALUES ('Moon_17', 5, 243.5, 'it is another galaxy', true, 9, 18);
INSERT INTO public.moon VALUES ('Moon_18', 5, 243.5, 'it is another galaxy', true, 9, 19);
INSERT INTO public.moon VALUES ('Moon_18', 5, 243.5, 'it is another galaxy', true, 19, 20);
INSERT INTO public.moon VALUES ('Moon_19', 5, 243.5, 'it is another galaxy', true, 19, 21);
INSERT INTO public.moon VALUES ('Moon_20', 5, 243.5, 'it is another galaxy', true, 19, 22);


--
-- Data for Name: moon_to_galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_to_galaxy VALUES (1, 1, 1, 'this');
INSERT INTO public.moon_to_galaxy VALUES (2, 2, 5, 'that');
INSERT INTO public.moon_to_galaxy VALUES (3, 4, 5, 'the other');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Planet_1', 5, 243.5, 'it is another galaxy', true, 1, 1);
INSERT INTO public.planet VALUES ('Planet_2', 5, 243.5, 'it is another galaxy', true, 1, 2);
INSERT INTO public.planet VALUES ('Planet_3', 5, 243.5, 'it is another galaxy', false, 2, 3);
INSERT INTO public.planet VALUES ('Planet_4', 5, 243.5, 'it is another galaxy', false, 3, 4);
INSERT INTO public.planet VALUES ('Planet_5', 5, 243.5, 'it is another galaxy', false, 3, 5);
INSERT INTO public.planet VALUES ('Planet_6', 5, 243.5, 'it is another galaxy', false, 6, 6);
INSERT INTO public.planet VALUES ('Planet_7', 5, 243.5, 'it is another galaxy', false, 6, 7);
INSERT INTO public.planet VALUES ('Planet_8', 5, 243.5, 'it is another galaxy', false, 6, 8);
INSERT INTO public.planet VALUES ('Planet_9', 5, 243.5, 'it is another galaxy', false, 6, 9);
INSERT INTO public.planet VALUES ('Planet_10', 5, 243.5, 'it is another galaxy', false, 5, 10);
INSERT INTO public.planet VALUES ('Planet_11', 5, 243.5, 'it is another galaxy', false, 5, 11);
INSERT INTO public.planet VALUES ('Planet_12', 5, 243.5, 'it is another galaxy', false, 5, 12);
INSERT INTO public.planet VALUES ('Planet_13', 5, 243.5, 'it is another galaxy', false, 5, 13);
INSERT INTO public.planet VALUES ('Planet_14', 5, 243.5, 'it is another galaxy', false, 7, 14);
INSERT INTO public.planet VALUES ('Planet_15', 5, 243.5, 'it is another galaxy', false, 7, 15);
INSERT INTO public.planet VALUES ('Planet_16', 5, 243.5, 'it is another galaxy', false, 7, 16);
INSERT INTO public.planet VALUES ('Planet_17', 5, 243.5, 'it is another galaxy', false, 7, 17);
INSERT INTO public.planet VALUES ('Planet_18', 5, 243.5, 'it is another galaxy', false, 7, 18);
INSERT INTO public.planet VALUES ('Planet_19', 5, 243.5, 'it is another galaxy', false, 7, 19);
INSERT INTO public.planet VALUES ('Planet_20', 5, 243.5, 'it is another galaxy', false, 4, 20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Star_1', 5, 243.5, 'it is another galaxy', 1, 1);
INSERT INTO public.star VALUES ('Star_2', 5, 243.5, 'it is another galaxy', 1, 2);
INSERT INTO public.star VALUES ('Star_3', 5, 243.5, 'it is another galaxy', 2, 3);
INSERT INTO public.star VALUES ('Star_4', 5, 243.5, 'it is another galaxy', 5, 4);
INSERT INTO public.star VALUES ('Star_5', 5, 243.5, 'it is another galaxy', 7, 5);
INSERT INTO public.star VALUES ('Star_6', 5, 243.5, 'it is another galaxy', 7, 6);
INSERT INTO public.star VALUES ('Star_7', 5, 243.5, 'it is another galaxy', 7, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: moon_to_galaxy_m_t_g_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_to_galaxy_m_t_g_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy g_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT g_id_unique UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon m_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT m_id_unique UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon_to_galaxy moon_to_galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_to_galaxy
    ADD CONSTRAINT moon_to_galaxy_pkey PRIMARY KEY (moon_to_galaxy_id);


--
-- Name: moon_to_galaxy mtg_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_to_galaxy
    ADD CONSTRAINT mtg_id_unique UNIQUE (moon_to_galaxy_id);


--
-- Name: planet p_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT p_id_unique UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star s_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT s_id_unique UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star g_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT g_foreign_key FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon p_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT p_foreign_key FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet s_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT s_foreign_key FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


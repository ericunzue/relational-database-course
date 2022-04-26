 
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
-- Name: classification; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.classification (
    classification_id integer NOT NULL,
    name character varying NOT NULL,
    summary text
);


ALTER TABLE public.classification OWNER TO freecodecamp;

--
-- Name: classification_classification_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.classification_classification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classification_classification_id_seq OWNER TO freecodecamp;

--
-- Name: classification_classification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.classification_classification_id_seq OWNED BY public.classification.classification_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    diameter_in_km integer,
    description text,
    form character varying(20),
    has_life boolean
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
    name character varying NOT NULL,
    daiameter_in_km integer,
    planet_id integer,
    classification_id integer
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    has_life boolean,
    diameter_in_km integer,
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
    name character varying NOT NULL,
    distance_from_earth numeric,
    age_in_millions_of_years integer,
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
-- Name: classification classification_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.classification ALTER COLUMN classification_id SET DEFAULT nextval('public.classification_classification_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: classification; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.classification VALUES (1, 'Pastor', 'mantienen algún anillo de Júpiter, Saturno, Urano o Neptuno en su lugar');
INSERT INTO public.classification VALUES (2, 'Troyano', 'Cuando un planeta y un satélite importante tienen en los puntos de Lagrange');
INSERT INTO public.classification VALUES (3, 'Coorbitales', 'Cuando giran en la misma órbita');
INSERT INTO public.classification VALUES (4, 'Asteroidales', 'Algunos asteroides tienen satélites a su alrededor');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 220000, 'También conocida como Galaxia Espiral M31, Messier 31 o NGC 224', 'espiral', NULL);
INSERT INTO public.galaxy VALUES (2, 'Lactea', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Enana de Acuario', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Can Mayor', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Baby Boom', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Circinus', NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth Moon', NULL, 4, NULL);
INSERT INTO public.moon VALUES (2, 'Fobos', NULL, 5, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, 5, NULL);
INSERT INTO public.moon VALUES (4, 'Nayade', NULL, 6, NULL);
INSERT INTO public.moon VALUES (5, 'Talasa', NULL, 6, NULL);
INSERT INTO public.moon VALUES (6, 'Despina', NULL, 6, NULL);
INSERT INTO public.moon VALUES (7, 'Galatea', NULL, 6, NULL);
INSERT INTO public.moon VALUES (8, 'Larisa', NULL, 6, NULL);
INSERT INTO public.moon VALUES (9, 'Hipocampo', NULL, 6, NULL);
INSERT INTO public.moon VALUES (10, 'Proteo', NULL, 6, NULL);
INSERT INTO public.moon VALUES (11, 'Triton', NULL, 6, NULL);
INSERT INTO public.moon VALUES (12, 'Europa', NULL, 8, NULL);
INSERT INTO public.moon VALUES (13, 'Ganimede', NULL, 8, NULL);
INSERT INTO public.moon VALUES (14, 'Callisto', NULL, 8, NULL);
INSERT INTO public.moon VALUES (15, 'Ameltea', NULL, 8, NULL);
INSERT INTO public.moon VALUES (16, 'Himalia', NULL, 8, NULL);
INSERT INTO public.moon VALUES (17, 'Elara', NULL, 8, NULL);
INSERT INTO public.moon VALUES (18, 'Sinope', NULL, 8, NULL);
INSERT INTO public.moon VALUES (19, 'Carme', NULL, 8, NULL);
INSERT INTO public.moon VALUES (20, 'Mimas', NULL, 9, NULL);
INSERT INTO public.moon VALUES (21, 'Enceladus', NULL, 9, NULL);
INSERT INTO public.moon VALUES (22, 'Tetis', NULL, 9, NULL);
INSERT INTO public.moon VALUES (23, 'Dione', NULL, 9, NULL);
INSERT INTO public.moon VALUES (24, 'Estigia', NULL, 10, NULL);
INSERT INTO public.moon VALUES (25, 'Cerbero', NULL, 10, NULL);
INSERT INTO public.moon VALUES (26, 'Hydra', NULL, 10, NULL);
INSERT INTO public.moon VALUES (27, 'Nix', NULL, 10, NULL);
INSERT INTO public.moon VALUES (28, 'Caronte', NULL, 10, NULL);
INSERT INTO public.moon VALUES (29, 'Actaea', NULL, 11, NULL);
INSERT INTO public.moon VALUES (30, 'Hiʻiaka', NULL, 12, NULL);
INSERT INTO public.moon VALUES (31, 'Namaka', NULL, 12, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Proxima D', NULL, NULL, 2);
INSERT INTO public.planet VALUES (3, '51 Pegasi B', NULL, NULL, 5);
INSERT INTO public.planet VALUES (4, 'Tierra', NULL, NULL, 3);
INSERT INTO public.planet VALUES (5, 'Marte', NULL, NULL, 3);
INSERT INTO public.planet VALUES (6, 'Neptuno', NULL, NULL, 3);
INSERT INTO public.planet VALUES (7, 'Urano', NULL, NULL, 3);
INSERT INTO public.planet VALUES (8, 'Jupiter', NULL, NULL, 3);
INSERT INTO public.planet VALUES (9, 'Saturno', NULL, NULL, 3);
INSERT INTO public.planet VALUES (10, 'Pluton', NULL, NULL, 3);
INSERT INTO public.planet VALUES (11, 'Salacia', NULL, NULL, 3);
INSERT INTO public.planet VALUES (12, 'Haumea', NULL, NULL, 3);
INSERT INTO public.planet VALUES (13, 'Quaoar', NULL, NULL, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Andromedae', NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Mirach', NULL, NULL, 1);
INSERT INTO public.star VALUES (3, 'Sol', NULL, NULL, 2);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', NULL, NULL, 2);
INSERT INTO public.star VALUES (5, '51 Pegasi', NULL, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Siriio', NULL, NULL, 2);


--
-- Name: classification_classification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.classification_classification_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 31, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: classification classification_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.classification
    ADD CONSTRAINT classification_name_key UNIQUE (name);


--
-- Name: classification classification_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.classification
    ADD CONSTRAINT classification_pkey PRIMARY KEY (classification_id);


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
-- Name: moon moon_classification_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_classification_id_fkey FOREIGN KEY (classification_id) REFERENCES public.classification(classification_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


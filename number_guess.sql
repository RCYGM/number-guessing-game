--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: game_stats; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game_stats (
    game_stat_id integer NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer DEFAULT 2000,
    user_id integer NOT NULL
);


ALTER TABLE public.game_stats OWNER TO freecodecamp;

--
-- Name: game_stats_game_stat_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_stats_game_stat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_stats_game_stat_id_seq OWNER TO freecodecamp;

--
-- Name: game_stats_game_stat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_stats_game_stat_id_seq OWNED BY public.game_stats.game_stat_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: game_stats game_stat_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_stats ALTER COLUMN game_stat_id SET DEFAULT nextval('public.game_stats_game_stat_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: game_stats; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game_stats VALUES (1, 5, 10000, 1);
INSERT INTO public.game_stats VALUES (2, 0, 2000, 2);
INSERT INTO public.game_stats VALUES (3, 0, 2000, 6);
INSERT INTO public.game_stats VALUES (4, 0, 2000, 7);
INSERT INTO public.game_stats VALUES (5, 0, 82, 8);
INSERT INTO public.game_stats VALUES (6, 0, 241, 9);
INSERT INTO public.game_stats VALUES (7, 0, 264, 10);
INSERT INTO public.game_stats VALUES (8, 0, 618, 11);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'jorge');
INSERT INTO public.users VALUES (2, 'juan');
INSERT INTO public.users VALUES (6, 'user_1736268494306');
INSERT INTO public.users VALUES (7, 'user_1736268494305');
INSERT INTO public.users VALUES (8, 'user_1736269775747');
INSERT INTO public.users VALUES (9, 'user_1736269775746');
INSERT INTO public.users VALUES (10, 'user_1736269929291');
INSERT INTO public.users VALUES (11, 'user_1736269929290');


--
-- Name: game_stats_game_stat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_stats_game_stat_id_seq', 8, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 11, true);


--
-- Name: game_stats game_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_stats
    ADD CONSTRAINT game_stats_pkey PRIMARY KEY (game_stat_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: game_stats fk_game_stats; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_stats
    ADD CONSTRAINT fk_game_stats FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


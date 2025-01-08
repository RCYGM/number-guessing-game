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
    user_id integer NOT NULL,
    number_of_guesses integer DEFAULT 0 NOT NULL
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

INSERT INTO public.game_stats VALUES (47, 48, 8);
INSERT INTO public.game_stats VALUES (48, 48, 8);
INSERT INTO public.game_stats VALUES (49, 48, 5);
INSERT INTO public.game_stats VALUES (50, 48, 7);
INSERT INTO public.game_stats VALUES (51, 48, 9);
INSERT INTO public.game_stats VALUES (52, 48, 10);
INSERT INTO public.game_stats VALUES (53, 48, 9);
INSERT INTO public.game_stats VALUES (54, 49, 885);
INSERT INTO public.game_stats VALUES (55, 49, 249);
INSERT INTO public.game_stats VALUES (56, 50, 209);
INSERT INTO public.game_stats VALUES (57, 50, 385);
INSERT INTO public.game_stats VALUES (58, 49, 925);
INSERT INTO public.game_stats VALUES (59, 49, 510);
INSERT INTO public.game_stats VALUES (60, 49, 786);
INSERT INTO public.game_stats VALUES (61, 51, 461);
INSERT INTO public.game_stats VALUES (62, 51, 295);
INSERT INTO public.game_stats VALUES (63, 52, 409);
INSERT INTO public.game_stats VALUES (64, 52, 283);
INSERT INTO public.game_stats VALUES (65, 51, 383);
INSERT INTO public.game_stats VALUES (66, 51, 166);
INSERT INTO public.game_stats VALUES (67, 51, 870);
INSERT INTO public.game_stats VALUES (68, 53, 9);
INSERT INTO public.game_stats VALUES (69, 53, 8);
INSERT INTO public.game_stats VALUES (70, 54, 448);
INSERT INTO public.game_stats VALUES (71, 54, 443);
INSERT INTO public.game_stats VALUES (72, 55, 500);
INSERT INTO public.game_stats VALUES (73, 55, 829);
INSERT INTO public.game_stats VALUES (74, 54, 105);
INSERT INTO public.game_stats VALUES (75, 54, 141);
INSERT INTO public.game_stats VALUES (76, 54, 904);
INSERT INTO public.game_stats VALUES (77, 56, 59);
INSERT INTO public.game_stats VALUES (78, 56, 555);
INSERT INTO public.game_stats VALUES (79, 57, 427);
INSERT INTO public.game_stats VALUES (80, 57, 564);
INSERT INTO public.game_stats VALUES (81, 56, 319);
INSERT INTO public.game_stats VALUES (82, 56, 67);
INSERT INTO public.game_stats VALUES (83, 56, 404);
INSERT INTO public.game_stats VALUES (84, 58, 124);
INSERT INTO public.game_stats VALUES (85, 58, 250);
INSERT INTO public.game_stats VALUES (86, 59, 918);
INSERT INTO public.game_stats VALUES (87, 59, 519);
INSERT INTO public.game_stats VALUES (88, 58, 779);
INSERT INTO public.game_stats VALUES (89, 58, 21);
INSERT INTO public.game_stats VALUES (90, 58, 496);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (48, 'juan');
INSERT INTO public.users VALUES (49, 'user_1736344384177');
INSERT INTO public.users VALUES (50, 'user_1736344384176');
INSERT INTO public.users VALUES (51, 'user_1736344719016');
INSERT INTO public.users VALUES (52, 'user_1736344719015');
INSERT INTO public.users VALUES (53, 'papa');
INSERT INTO public.users VALUES (54, 'user_1736346085380');
INSERT INTO public.users VALUES (55, 'user_1736346085379');
INSERT INTO public.users VALUES (56, 'user_1736346206150');
INSERT INTO public.users VALUES (57, 'user_1736346206149');
INSERT INTO public.users VALUES (58, 'user_1736347902282');
INSERT INTO public.users VALUES (59, 'user_1736347902281');


--
-- Name: game_stats_game_stat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_stats_game_stat_id_seq', 90, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 59, true);


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


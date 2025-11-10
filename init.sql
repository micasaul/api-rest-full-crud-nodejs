--
-- PostgreSQL database dump
--

\restrict QaqDgyIcG1XnwhvqkwmQgAozOi6BqLiPJY6qbsulJsIRnDMtK6hU1NgMPw9gHah

-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

-- SET statement_timeout = 0;
-- SET lock_timeout = 0;
-- SET idle_in_transaction_session_timeout = 0;
-- SET transaction_timeout = 0;
-- SET client_encoding = 'UTF8';
-- SET standard_conforming_strings = on;
-- SELECT pg_catalog.set_config('search_path', '', false);
-- SET check_function_bodies = false;
-- SET xmloption = content;
-- SET client_min_messages = warning;
-- SET row_security = off;

-- SET default_tablespace = '';

-- SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: mic2004
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(200) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO mic2004;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: mic2004
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO mic2004;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mic2004
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: mic2004
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: mic2004
--

COPY public.users (id, name, email, created_at) FROM stdin;
1	to├▒o	to├▒o@gmail.com	2025-09-26 05:55:55.749595
2	mic	mica020804@gmail.com	2025-09-26 05:56:06.803369
3	gift	gifi@gmail.com	2025-09-26 05:56:23.387578
4	loren	lolo@gmail.com	2025-09-26 05:56:30.783623
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mic2004
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: mic2004
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict QaqDgyIcG1XnwhvqkwmQgAozOi6BqLiPJY6qbsulJsIRnDMtK6hU1NgMPw9gHah


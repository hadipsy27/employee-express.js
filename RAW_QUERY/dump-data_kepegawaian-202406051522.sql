--
-- PostgreSQL database cluster dump
--

-- Started on 2024-06-05 15:22:41

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.14 (Debian 13.14-1.pgdg120+2)
-- Dumped by pg_dump version 15.3

-- Started on 2024-06-05 15:22:41

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-06-05 15:22:42

--
-- PostgreSQL database dump complete
--

--
-- Database "data_kepegawaian" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.14 (Debian 13.14-1.pgdg120+2)
-- Dumped by pg_dump version 15.3

-- Started on 2024-06-05 15:22:42

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
-- TOC entry 3072 (class 1262 OID 16384)
-- Name: data_kepegawaian; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE data_kepegawaian WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE data_kepegawaian OWNER TO postgres;

\connect data_kepegawaian

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 643 (class 1247 OID 16966)
-- Name: enum_education_level; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_education_level AS ENUM (
    'Tk',
    'Sd',
    'Smp',
    'Sma',
    'Strata 1',
    'Strata 2',
    'Doktor',
    'Profesor'
);


ALTER TYPE public.enum_education_level OWNER TO postgres;

--
-- TOC entry 654 (class 1247 OID 17012)
-- Name: enum_employee_family_relation_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_employee_family_relation_status AS ENUM (
    'Suami',
    'Istri',
    'Anak',
    'Anak Sambung'
);


ALTER TYPE public.enum_employee_family_relation_status OWNER TO postgres;

--
-- TOC entry 651 (class 1247 OID 17000)
-- Name: enum_employee_family_religion; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_employee_family_religion AS ENUM (
    'Islam',
    'Katolik',
    'Buda',
    'Protestan',
    'Konghucu'
);


ALTER TYPE public.enum_employee_family_religion OWNER TO postgres;

--
-- TOC entry 635 (class 1247 OID 16943)
-- Name: enum_employee_profile_gender; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_employee_profile_gender AS ENUM (
    'Laki-laki',
    'perempuan'
);


ALTER TYPE public.enum_employee_profile_gender OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 205 (class 1259 OID 16985)
-- Name: education; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.education (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    name character varying(255),
    level public.enum_education_level NOT NULL,
    description character varying(255) NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.education OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16983)
-- Name: education_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.education_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.education_id_seq OWNER TO postgres;

--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 204
-- Name: education_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.education_id_seq OWNED BY public.education.id;


--
-- TOC entry 201 (class 1259 OID 16931)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    nik character varying(255),
    name character varying(255),
    is_active boolean,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 17023)
-- Name: employee_family; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_family (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    name character varying(255),
    identifier character varying(255),
    job character varying(255),
    place_of_birth character varying(255) NOT NULL,
    date_of_birth timestamp with time zone NOT NULL,
    religion public.enum_employee_family_religion,
    is_life boolean,
    is_divorced boolean,
    relation_status public.enum_employee_family_relation_status NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.employee_family OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17021)
-- Name: employee_family_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_family_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_family_id_seq OWNER TO postgres;

--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 206
-- Name: employee_family_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_family_id_seq OWNED BY public.employee_family.id;


--
-- TOC entry 200 (class 1259 OID 16929)
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_id_seq OWNER TO postgres;

--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 200
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;


--
-- TOC entry 203 (class 1259 OID 16949)
-- Name: employee_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_profile (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    place_of_birth character varying(255) NOT NULL,
    date_of_birth timestamp with time zone NOT NULL,
    gender public.enum_employee_profile_gender NOT NULL,
    is_married boolean,
    prof_pict character varying(255),
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.employee_profile OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16947)
-- Name: employee_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_profile_id_seq OWNER TO postgres;

--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 202
-- Name: employee_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_profile_id_seq OWNED BY public.employee_profile.id;


--
-- TOC entry 2912 (class 2604 OID 16988)
-- Name: education id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education ALTER COLUMN id SET DEFAULT nextval('public.education_id_seq'::regclass);


--
-- TOC entry 2910 (class 2604 OID 16934)
-- Name: employee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);


--
-- TOC entry 2913 (class 2604 OID 17026)
-- Name: employee_family id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_family ALTER COLUMN id SET DEFAULT nextval('public.employee_family_id_seq'::regclass);


--
-- TOC entry 2911 (class 2604 OID 16952)
-- Name: employee_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_profile ALTER COLUMN id SET DEFAULT nextval('public.employee_profile_id_seq'::regclass);


--
-- TOC entry 3064 (class 0 OID 16985)
-- Dependencies: 205
-- Data for Name: education; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.education (id, employee_id, name, level, description, created_by, updated_by, created_at, updated_at) FROM stdin;
1	1	Institut Teknologi Bandung	Strata 1	Bachelor of Science in Computer Science	admin	admin	2024-06-05 14:38:40+00	2024-06-05 14:38:40+00
2	2	SMK Nusa Bangsa	Sma	Ilmu Pengetahuan Alam	admin	admin	2024-06-05 14:38:40+00	2024-06-05 14:38:40+00
\.


--
-- TOC entry 3060 (class 0 OID 16931)
-- Dependencies: 201
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (id, nik, name, is_active, start_date, end_date, created_by, updated_by, created_at, updated_at) FROM stdin;
1	117790	John Doel	t	2023-01-01 00:00:00+00	2024-06-05 00:00:00+00	admin	admin	2024-06-05 14:38:40+00	2024-06-05 14:38:40+00
2	117791	Budi Alexander	t	2023-01-01 00:00:00+00	2024-06-05 00:00:00+00	admin	admin	2024-06-05 14:38:40+00	2024-06-05 14:38:40+00
\.


--
-- TOC entry 3066 (class 0 OID 17023)
-- Dependencies: 207
-- Data for Name: employee_family; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_family (id, employee_id, name, identifier, job, place_of_birth, date_of_birth, religion, is_life, is_divorced, relation_status, created_by, updated_by, created_at, updated_at) FROM stdin;
1	1	Stepani Nadia	123456789012345	Doctor	Jakarta	1995-06-05 00:00:00+00	Islam	t	f	Istri	admin	admin	2024-06-05 14:38:40+00	2024-06-05 14:38:40+00
2	1	Robert Wiliams	123456789012346	Pelajar	Jakarta	2023-07-07 00:00:00+00	Islam	t	f	Anak	admin	admin	2024-06-05 14:38:40+00	2024-06-05 14:38:40+00
3	1	Clara Kumala	123456789012347	Pelajar	Jakarta	2028-01-03 00:00:00+00	Islam	t	f	Anak	admin	admin	2024-06-05 14:38:40+00	2024-06-05 14:38:40+00
\.


--
-- TOC entry 3062 (class 0 OID 16949)
-- Dependencies: 203
-- Data for Name: employee_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_profile (id, employee_id, place_of_birth, date_of_birth, gender, is_married, prof_pict, created_by, updated_by, created_at, updated_at) FROM stdin;
1	1	Jakarta	1990-01-01 00:00:00+00	Laki-laki	t	profile_picture.jpg	admin	admin	2024-06-05 14:38:40+00	2024-06-05 14:38:40+00
2	2	Sukabumi	1995-01-01 00:00:00+00	Laki-laki	f	prof_picture.jpg	admin	admin	2024-06-05 14:38:40+00	2024-06-05 14:38:40+00
\.


--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 204
-- Name: education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.education_id_seq', 2, true);


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 206
-- Name: employee_family_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_family_id_seq', 3, true);


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 200
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_id_seq', 8, true);


--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 202
-- Name: employee_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_profile_id_seq', 2, true);


--
-- TOC entry 2923 (class 2606 OID 16993)
-- Name: education education_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education
    ADD CONSTRAINT education_pkey PRIMARY KEY (id);


--
-- TOC entry 2925 (class 2606 OID 17031)
-- Name: employee_family employee_family_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_family
    ADD CONSTRAINT employee_family_pkey PRIMARY KEY (id);


--
-- TOC entry 2915 (class 2606 OID 16941)
-- Name: employee employee_nik_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_nik_key UNIQUE (nik);


--
-- TOC entry 2917 (class 2606 OID 16939)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- TOC entry 2919 (class 2606 OID 16959)
-- Name: employee_profile employee_profile_employee_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_profile
    ADD CONSTRAINT employee_profile_employee_id_key UNIQUE (employee_id);


--
-- TOC entry 2921 (class 2606 OID 16957)
-- Name: employee_profile employee_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_profile
    ADD CONSTRAINT employee_profile_pkey PRIMARY KEY (id);


--
-- TOC entry 2927 (class 2606 OID 16994)
-- Name: education education_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education
    ADD CONSTRAINT education_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2928 (class 2606 OID 17032)
-- Name: employee_family employee_family_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_family
    ADD CONSTRAINT employee_family_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2926 (class 2606 OID 16960)
-- Name: employee_profile employee_profile_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_profile
    ADD CONSTRAINT employee_profile_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-06-05 15:22:42

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.14 (Debian 13.14-1.pgdg120+2)
-- Dumped by pg_dump version 15.3

-- Started on 2024-06-05 15:22:42

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-06-05 15:22:42

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-06-05 15:22:42

--
-- PostgreSQL database cluster dump complete
--


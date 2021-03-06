--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 14.2

-- Started on 2022-05-03 14:50:32

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
-- TOC entry 203 (class 1259 OID 158117)
-- Name: employes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employes (
    id integer NOT NULL,
    nombre text NOT NULL,
    estado integer NOT NULL,
    fecha_creacion date DEFAULT now() NOT NULL,
    sexo integer NOT NULL,
    salario numeric NOT NULL
);


ALTER TABLE public.employes OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 158216)
-- Name: employes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.employes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 202 (class 1259 OID 158109)
-- Name: marital_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marital_status (
    id integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.marital_status OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 158214)
-- Name: marital_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.marital_status ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.marital_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 205 (class 1259 OID 158137)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 158135)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 204
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 201 (class 1259 OID 158101)
-- Name: sex; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sex (
    id integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.sex OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 158099)
-- Name: sex_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.sex ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.sex_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 209 (class 1259 OID 158221)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 158219)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."user" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 211 (class 1259 OID 158231)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 158229)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 2886 (class 2604 OID 158140)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3034 (class 0 OID 158117)
-- Dependencies: 203
-- Data for Name: employes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employes VALUES (16, 'JUAN', 2, '2022-05-03', 1, 20000);


--
-- TOC entry 3033 (class 0 OID 158109)
-- Dependencies: 202
-- Data for Name: marital_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.marital_status VALUES (1, 'SOLTERO');
INSERT INTO public.marital_status VALUES (2, 'CASADO');


--
-- TOC entry 3036 (class 0 OID 158137)
-- Dependencies: 205
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.migrations VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO public.migrations VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO public.migrations VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO public.migrations VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO public.migrations VALUES (5, '2022_05_03_015417_employes', 2);
INSERT INTO public.migrations VALUES (6, '2022_05_03_020415_create_sexes_table', 3);


--
-- TOC entry 3032 (class 0 OID 158101)
-- Dependencies: 201
-- Data for Name: sex; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sex VALUES (1, 'MASCULINO');
INSERT INTO public.sex VALUES (2, 'FEMENINO');


--
-- TOC entry 3040 (class 0 OID 158221)
-- Dependencies: 209
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."user" VALUES (1, 'admin', '12345');


--
-- TOC entry 3042 (class 0 OID 158231)
-- Dependencies: 211
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'admin', '12345');


--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 207
-- Name: employes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employes_id_seq', 16, true);


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 206
-- Name: marital_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marital_status_id_seq', 2, true);


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 204
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 6, true);


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 200
-- Name: sex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sex_id_seq', 2, true);


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 208
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, true);


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 210
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- TOC entry 2892 (class 2606 OID 158124)
-- Name: employes fk_marial_status; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employes
    ADD CONSTRAINT fk_marial_status PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 158116)
-- Name: marital_status marital_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marital_status
    ADD CONSTRAINT marital_status_pkey PRIMARY KEY (id);


--
-- TOC entry 2894 (class 2606 OID 158142)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2888 (class 2606 OID 158108)
-- Name: sex sex_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sex
    ADD CONSTRAINT sex_pkey PRIMARY KEY (id);


--
-- TOC entry 2896 (class 2606 OID 158228)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2898 (class 2606 OID 158238)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2899 (class 2606 OID 158125)
-- Name: employes fk_pkey_marital; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employes
    ADD CONSTRAINT fk_pkey_marital FOREIGN KEY (estado) REFERENCES public.marital_status(id);


--
-- TOC entry 2900 (class 2606 OID 158130)
-- Name: employes fk_sex; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employes
    ADD CONSTRAINT fk_sex FOREIGN KEY (sexo) REFERENCES public.sex(id);


-- Completed on 2022-05-03 14:50:32

--
-- PostgreSQL database dump complete
--


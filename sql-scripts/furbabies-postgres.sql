--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: adoption; Type: TABLE; Schema: public; Owner: cschirf
--

CREATE TABLE adoption (
    id integer NOT NULL,
    adoption_date date,
    person_id bigint,
    animal_id bigint
);


ALTER TABLE adoption OWNER TO cschirf;

--
-- Name: adoption_id_seq; Type: SEQUENCE; Schema: public; Owner: cschirf
--

CREATE SEQUENCE adoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE adoption_id_seq OWNER TO cschirf;

--
-- Name: adoption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cschirf
--

ALTER SEQUENCE adoption_id_seq OWNED BY adoption.id;


--
-- Name: animal; Type: TABLE; Schema: public; Owner: cschirf
--

CREATE TABLE animal (
    id integer NOT NULL,
    shelter_id character varying(36) NOT NULL,
    name character varying(255),
    date_of_birth date,
    type character varying(5) NOT NULL,
    gender character varying(1),
    altered boolean DEFAULT false NOT NULL,
    ok_with_dogs boolean DEFAULT false NOT NULL,
    ok_with_cats boolean DEFAULT false NOT NULL,
    date_of_surrender date NOT NULL
);


ALTER TABLE animal OWNER TO cschirf;

--
-- Name: animal_id_seq; Type: SEQUENCE; Schema: public; Owner: cschirf
--

CREATE SEQUENCE animal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE animal_id_seq OWNER TO cschirf;

--
-- Name: animal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cschirf
--

ALTER SEQUENCE animal_id_seq OWNED BY animal.id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: cschirf
--

CREATE TABLE person (
    id integer NOT NULL,
    name character varying(255),
    address character varying(255),
    phone_number character varying(50),
    gender character varying(1),
    has_cats boolean DEFAULT true NOT NULL,
    has_dogs boolean DEFAULT true NOT NULL
);


ALTER TABLE person OWNER TO cschirf;

--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: cschirf
--

CREATE SEQUENCE person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person_id_seq OWNER TO cschirf;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cschirf
--

ALTER SEQUENCE person_id_seq OWNED BY person.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cschirf
--

ALTER TABLE ONLY adoption ALTER COLUMN id SET DEFAULT nextval('adoption_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cschirf
--

ALTER TABLE ONLY animal ALTER COLUMN id SET DEFAULT nextval('animal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: cschirf
--

ALTER TABLE ONLY person ALTER COLUMN id SET DEFAULT nextval('person_id_seq'::regclass);


--
-- Data for Name: adoption; Type: TABLE DATA; Schema: public; Owner: cschirf
--

COPY adoption (id, adoption_date, person_id, animal_id) FROM stdin;
1	2016-07-19	6	7
2	2016-08-01	11	15
3	2014-07-05	6	20
4	2015-02-14	13	20
\.


--
-- Name: adoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cschirf
--

SELECT pg_catalog.setval('adoption_id_seq', 4, true);


--
-- Data for Name: animal; Type: TABLE DATA; Schema: public; Owner: cschirf
--

COPY animal (id, shelter_id, name, date_of_birth, type, gender, altered, ok_with_dogs, ok_with_cats, date_of_surrender) FROM stdin;
1	822c13f0-115d-4035-b0c5-579bca4a1468	Kestrel	2016-03-07	dog	M	f	f	f	2016-03-30
2	f291af86-4f21-4ecb-a864-834f7fd3e978	Quintus	2016-04-28	dog	M	f	t	t	2016-06-14
3	e9039484-d2c9-4d9d-80cd-acc58f2cc960	Paco	2016-04-12	dog	M	f	t	t	2016-07-06
4	2e35ff04-98c6-49de-8e83-9e90225c1fda	Colin	2016-05-05	dog	M	f	t	f	2016-08-19
5	606b32ee-a5f8-48d3-bda6-c59db8240b39	Izzy	2015-06-20	dog	F	f	t	t	2015-11-02
6	0d18a661-773e-4983-8272-4e25d02ab5ae	Oreo	2016-03-15	cat	F	f	f	f	2016-10-15
7	5d596464-bc1f-4e83-a963-36fc59f3272e	Massimo	2012-06-13	cat	M	t	t	t	2012-12-10
8	c112f064-2930-42e0-8443-4501f5cc35e1	Gracie	2012-08-17	dog	F	t	f	f	2013-01-04
9	58f50c43-6bfc-4f23-974f-aba79a5b34cf	Roxy	2013-08-06	cat	F	t	f	t	2013-12-20
10	b8672c90-1196-4aa9-963d-6f1cbed7a390	Phineas	2014-05-09	cat	M	t	t	f	2014-05-15
11	a7081f82-2a4e-4f3b-9248-736f594809dc	Gabby	2014-08-07	dog	F	t	f	t	2014-09-30
12	4fe32f77-9c6d-4a09-ba11-8603e988a63a	Anka	2015-01-06	cat	F	t	t	t	2016-02-02
13	55467718-a302-4f3d-9928-740ced142949	Iris	2015-04-28	cat	F	t	f	t	2015-06-29
14	33bb9e66-be19-41e5-a45a-6614668329bd	Leo	2015-06-20	cat	M	t	f	f	2016-05-17
15	a528a5d1-7934-4762-977d-20e3013d3761	Bailey	2010-09-20	dog	M	t	t	t	2014-06-24
16	a4c395a6-ebf6-41f8-8469-6332229926ae	Lucy	2011-01-28	dog	F	t	t	t	2013-05-05
17	10b78650-2e77-48aa-8162-2061d5edd80d	Fenton	2011-04-21	dog	M	t	t	f	2012-07-02
18	e781ffc5-d1c1-469b-9eb6-d4093da55c42	Oliver	2011-06-28	cat	M	t	f	t	2016-03-16
19	8e99ae7b-6eab-4b5a-868a-e2d229a02404	Zoe	2013-01-17	cat	F	t	f	t	2014-01-04
20	ae752b0f-cdfb-489b-84b0-0e96477d19f5	Tigger	2013-08-20	cat	M	t	t	t	2013-10-26
\.


--
-- Name: animal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cschirf
--

SELECT pg_catalog.setval('animal_id_seq', 20, true);


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: cschirf
--

COPY person (id, name, address, phone_number, gender, has_cats, has_dogs) FROM stdin;
1	Tadeu Mendelssohn	95 Woodrow Way, Austin, TX 78701	512-555-555	M	f	f
2	Bratislav Muyskens	3343 Sundown Ln, Austin, TX 78723	715-972-1139	M	f	t
3	Natalia Baumhauer	615 Red River St, Austin, TX 78701	248-451-3463	F	f	t
4	Anna Herbert	1019 Manor Rd, Austin, TX 73301	512-565-0860	F	f	f
5	Alfred Cassidy	11410 Century Oaks Terrace, Austin, TX 78758	512-731-7065	M	t	f
6	Jean Rye	701 W Riverside Dr, Austin, TX 78704	512-690-8488	F	t	t
7	Alger Portner	2350 Robert Dedman Dr, Austin, TX 78712	630-404-1169	M	f	f
8	Alejandro De Rosario	1415 S Congress Ave, Austin, TX 78704	586-775-3548	M	t	t
9	Benjamin Monroe	3208 Guadalupe St, Austin, TX 78705	270-784-6892	M	f	f
10	Lillian Wilkinson	10808 Rawhide Trail, Austin, TX 78736	512-598-0965	F	t	f
11	Xochitl Moreno	4301 W. William Cannon, Austin, TX 78749	512-427-2921	F	f	t
12	Kathy Meyers	1120 S Lamar Blvd, Austin, TX 78704	410-296-5699	F	t	f
13	Benicio Garcia	1100 Congress Ave, Austin, TX 78701	918-562-3674	M	t	f
14	Malik McNeill	200 Lavaca St, Austin, TX 78701	262-965-4112	M	f	t
15	Laura Taylor	2337 E Cesar Chavez St, Austin, TX 78702	907-854-9708	F	f	f
\.


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cschirf
--

SELECT pg_catalog.setval('person_id_seq', 15, true);


--
-- Name: adoption_pkey; Type: CONSTRAINT; Schema: public; Owner: cschirf
--

ALTER TABLE ONLY adoption
    ADD CONSTRAINT adoption_pkey PRIMARY KEY (id);


--
-- Name: animal_pkey; Type: CONSTRAINT; Schema: public; Owner: cschirf
--

ALTER TABLE ONLY animal
    ADD CONSTRAINT animal_pkey PRIMARY KEY (id);


--
-- Name: person_pkey; Type: CONSTRAINT; Schema: public; Owner: cschirf
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: shelter_id_unique; Type: CONSTRAINT; Schema: public; Owner: cschirf
--

ALTER TABLE ONLY animal
    ADD CONSTRAINT shelter_id_unique UNIQUE (shelter_id);


--
-- Name: adoption_animal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cschirf
--

ALTER TABLE ONLY adoption
    ADD CONSTRAINT adoption_animal_id_fkey FOREIGN KEY (animal_id) REFERENCES animal(id);


--
-- Name: adoption_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cschirf
--

ALTER TABLE ONLY adoption
    ADD CONSTRAINT adoption_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)

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

DROP DATABASE bikes;
--
-- Name: bikes; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE bikes WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'pt_BR.UTF-8';


ALTER DATABASE bikes OWNER TO postgres;

\connect bikes

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
-- Name: bikes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bikes (
    bike_id integer NOT NULL,
    type character varying(50) NOT NULL,
    size integer NOT NULL,
    available boolean DEFAULT true NOT NULL
);


ALTER TABLE public.bikes OWNER TO postgres;

--
-- Name: bikes_bike_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bikes_bike_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bikes_bike_id_seq OWNER TO postgres;

--
-- Name: bikes_bike_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bikes_bike_id_seq OWNED BY public.bikes.bike_id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    phone character varying(15) NOT NULL,
    name character varying(60) NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customer_id_seq OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: rentals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rentals (
    customer_id integer NOT NULL,
    bike_id integer NOT NULL,
    date_rented date DEFAULT now() NOT NULL,
    date_returned date,
    rental_id integer NOT NULL
);


ALTER TABLE public.rentals OWNER TO postgres;

--
-- Name: rentals_rental_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rentals_rental_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rentals_rental_id_seq OWNER TO postgres;

--
-- Name: rentals_rental_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rentals_rental_id_seq OWNED BY public.rentals.rental_id;


--
-- Name: bikes bike_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bikes ALTER COLUMN bike_id SET DEFAULT nextval('public.bikes_bike_id_seq'::regclass);


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: rentals rental_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals ALTER COLUMN rental_id SET DEFAULT nextval('public.rentals_rental_id_seq'::regclass);


--
-- Data for Name: bikes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bikes VALUES (8, 'BMX', 20, true);
INSERT INTO public.bikes VALUES (9, 'BMX', 21, true);
INSERT INTO public.bikes VALUES (1, 'Mountain', 27, false);
INSERT INTO public.bikes VALUES (2, 'Mountain', 28, false);
INSERT INTO public.bikes VALUES (6, 'Road', 29, false);
INSERT INTO public.bikes VALUES (5, 'Road', 28, true);
INSERT INTO public.bikes VALUES (4, 'Road', 27, true);
INSERT INTO public.bikes VALUES (3, 'Mountain', 29, true);
INSERT INTO public.bikes VALUES (7, 'BMX', 19, true);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customers VALUES (3, '555-5555', 'Me');
INSERT INTO public.customers VALUES (4, '000-0000', 'Test');


--
-- Data for Name: rentals; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rentals VALUES (3, 1, '2023-08-29', NULL, 1);
INSERT INTO public.rentals VALUES (3, 2, '2023-08-29', NULL, 2);
INSERT INTO public.rentals VALUES (4, 6, '2023-08-29', NULL, 6);
INSERT INTO public.rentals VALUES (3, 5, '2023-08-29', '2023-08-29', 5);
INSERT INTO public.rentals VALUES (3, 4, '2023-08-29', '2023-08-29', 4);
INSERT INTO public.rentals VALUES (3, 3, '2023-08-29', '2023-08-29', 3);
INSERT INTO public.rentals VALUES (4, 7, '2023-08-29', '2023-08-29', 7);


--
-- Name: bikes_bike_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bikes_bike_id_seq', 29, true);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 4, true);


--
-- Name: rentals_rental_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rentals_rental_id_seq', 7, true);


--
-- Name: bikes bikes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bikes
    ADD CONSTRAINT bikes_pkey PRIMARY KEY (bike_id);


--
-- Name: customers customers_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_key UNIQUE (phone);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: rentals rentals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_pkey PRIMARY KEY (rental_id);


--
-- Name: rentals rentals_bike_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_bike_id_fkey FOREIGN KEY (bike_id) REFERENCES public.bikes(bike_id);


--
-- Name: rentals rentals_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- PostgreSQL database dump complete
--


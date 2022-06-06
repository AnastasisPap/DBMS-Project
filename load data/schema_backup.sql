--
-- PostgreSQL database dump
--

-- Dumped from database version 11.15
-- Dumped by pg_dump version 14.2

-- Started on 2022-06-02 20:39:56

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
-- TOC entry 213 (class 1259 OID 25274)
-- Name: actor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.actor (
    id integer NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 17875)
-- Name: collection; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.collection (
    id integer NOT NULL,
    name character varying(60)
);


--
-- TOC entry 214 (class 1259 OID 25284)
-- Name: crewmember; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crewmember (
    id integer NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 17842)
-- Name: genre; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genre (
    id integer NOT NULL,
    name character varying(40)
);


--
-- TOC entry 210 (class 1259 OID 18103)
-- Name: keyword; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.keyword (
    id integer NOT NULL,
    name character varying(50)
);


--
-- TOC entry 201 (class 1259 OID 17847)
-- Name: movie; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movie (
    id integer NOT NULL,
    adult character varying(10),
    budget integer,
    homepage character varying(230),
    original_language character varying(10),
    original_title character varying(110),
    title character varying(110),
    tagline character varying(280),
    overview character varying(1000),
    popularity character varying(10),
    release_date date,
    revenue integer,
    runtime character varying(10)
);


--
-- TOC entry 203 (class 1259 OID 17858)
-- Name: movie_cast; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movie_cast (
    movie_id integer NOT NULL,
    cast_id integer NOT NULL,
    "character" character varying(390) NOT NULL,
    person_id integer NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 17855)
-- Name: movie_collection; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movie_collection (
    movie_id integer NOT NULL,
    collection_id integer NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 17867)
-- Name: movie_crew; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movie_crew (
    movie_id integer NOT NULL,
    department character varying(20),
    person_id integer NOT NULL,
    job character varying(60) NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 17861)
-- Name: movie_genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movie_genres (
    movie_id integer NOT NULL,
    genre_id integer NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 18108)
-- Name: movie_keywords; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movie_keywords (
    movie_id integer NOT NULL,
    key_id integer NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 17864)
-- Name: movie_productioncompanies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movie_productioncompanies (
    movie_id integer NOT NULL,
    pc_id integer NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 25269)
-- Name: person; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.person (
    id integer NOT NULL,
    gender integer,
    name character varying(40)
);


--
-- TOC entry 207 (class 1259 OID 17870)
-- Name: productioncompany; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.productioncompany (
    id integer NOT NULL,
    name character varying(100)
);


--
-- TOC entry 209 (class 1259 OID 17880)
-- Name: ratings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ratings (
    user_id integer,
    movie_id integer,
    rating double precision
);


--
-- TOC entry 4180 (class 2606 OID 25278)
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (id);


--
-- TOC entry 4172 (class 2606 OID 17879)
-- Name: collection collection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (id);


--
-- TOC entry 4182 (class 2606 OID 25288)
-- Name: crewmember crewmember_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crewmember
    ADD CONSTRAINT crewmember_pkey PRIMARY KEY (id);


--
-- TOC entry 4155 (class 2606 OID 17846)
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- TOC entry 4174 (class 2606 OID 18107)
-- Name: keyword keyword_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.keyword
    ADD CONSTRAINT keyword_pkey PRIMARY KEY (id);


--
-- TOC entry 4162 (class 2606 OID 24611)
-- Name: movie_cast movie_cast_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_cast
    ADD CONSTRAINT movie_cast_pkey PRIMARY KEY (movie_id, cast_id, person_id, "character");


--
-- TOC entry 4160 (class 2606 OID 24607)
-- Name: movie_collection movie_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_collection
    ADD CONSTRAINT movie_collection_pkey PRIMARY KEY (movie_id, collection_id);


--
-- TOC entry 4168 (class 2606 OID 24609)
-- Name: movie_crew movie_crew_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_crew
    ADD CONSTRAINT movie_crew_pkey PRIMARY KEY (movie_id, person_id, job);


--
-- TOC entry 4164 (class 2606 OID 24613)
-- Name: movie_genres movie_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_genres
    ADD CONSTRAINT movie_genres_pkey PRIMARY KEY (movie_id, genre_id);


--
-- TOC entry 4176 (class 2606 OID 24617)
-- Name: movie_keywords movie_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_keywords
    ADD CONSTRAINT movie_keywords_pkey PRIMARY KEY (movie_id, key_id);


--
-- TOC entry 4157 (class 2606 OID 17854)
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (id);


--
-- TOC entry 4166 (class 2606 OID 24615)
-- Name: movie_productioncompanies movie_productioncompanies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_productioncompanies
    ADD CONSTRAINT movie_productioncompanies_pkey PRIMARY KEY (movie_id, pc_id);


--
-- TOC entry 4178 (class 2606 OID 25273)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 4170 (class 2606 OID 17874)
-- Name: productioncompany productioncompany_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.productioncompany
    ADD CONSTRAINT productioncompany_pkey PRIMARY KEY (id);


--
-- TOC entry 4158 (class 1259 OID 24838)
-- Name: tmp_dx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tmp_dx ON public.movie USING btree (budget);


--
-- TOC entry 4193 (class 2606 OID 25279)
-- Name: actor actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_id_fkey FOREIGN KEY (id) REFERENCES public.person(id);


--
-- TOC entry 4194 (class 2606 OID 25289)
-- Name: crewmember crewmember_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crewmember
    ADD CONSTRAINT crewmember_id_fkey FOREIGN KEY (id) REFERENCES public.person(id);


--
-- TOC entry 4185 (class 2606 OID 17944)
-- Name: movie_cast fk_mc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_cast
    ADD CONSTRAINT fk_mc FOREIGN KEY (movie_id) REFERENCES public.movie(id);


--
-- TOC entry 4183 (class 2606 OID 17899)
-- Name: movie_collection fk_mc1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_collection
    ADD CONSTRAINT fk_mc1 FOREIGN KEY (movie_id) REFERENCES public.movie(id);


--
-- TOC entry 4184 (class 2606 OID 17904)
-- Name: movie_collection fk_mc2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_collection
    ADD CONSTRAINT fk_mc2 FOREIGN KEY (collection_id) REFERENCES public.collection(id);


--
-- TOC entry 4191 (class 2606 OID 17909)
-- Name: movie_crew fk_mcr1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_crew
    ADD CONSTRAINT fk_mcr1 FOREIGN KEY (movie_id) REFERENCES public.movie(id);


--
-- TOC entry 4187 (class 2606 OID 17914)
-- Name: movie_genres fk_mg1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_genres
    ADD CONSTRAINT fk_mg1 FOREIGN KEY (movie_id) REFERENCES public.movie(id);


--
-- TOC entry 4188 (class 2606 OID 17919)
-- Name: movie_genres fk_mg2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_genres
    ADD CONSTRAINT fk_mg2 FOREIGN KEY (genre_id) REFERENCES public.genre(id);


--
-- TOC entry 4186 (class 2606 OID 25294)
-- Name: movie_cast fk_movie_cast_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_cast
    ADD CONSTRAINT fk_movie_cast_person FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 4192 (class 2606 OID 25299)
-- Name: movie_crew fk_movie_crew_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_crew
    ADD CONSTRAINT fk_movie_crew_person FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 4190 (class 2606 OID 17929)
-- Name: movie_productioncompanies fk_pc1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_productioncompanies
    ADD CONSTRAINT fk_pc1 FOREIGN KEY (pc_id) REFERENCES public.productioncompany(id);


--
-- TOC entry 4189 (class 2606 OID 17924)
-- Name: movie_productioncompanies fk_pc2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_productioncompanies
    ADD CONSTRAINT fk_pc2 FOREIGN KEY (movie_id) REFERENCES public.movie(id);


-- Completed on 2022-06-02 20:40:41

--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by Miracthis

-- Started on 2021-06-05 00:06:25

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
-- TOC entry 204 (class 1259 OID 16714)
-- Name: candidate_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate_users (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    surname character varying(50) NOT NULL,
    national_identity character varying(11) NOT NULL,
    birth_year character varying(4) NOT NULL
);


ALTER TABLE public.candidate_users OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16712)
-- Name: candidate_users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.candidate_users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.candidate_users_user_id_seq OWNER TO postgres;

--
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 203
-- Name: candidate_users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.candidate_users_user_id_seq OWNED BY public.candidate_users.id;


--
-- TOC entry 215 (class 1259 OID 26283)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 26298)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cities ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 16778)
-- Name: confirm_employer_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.confirm_employer_users (
    id integer NOT NULL,
    employer_id integer NOT NULL,
    confirmed_staff_user integer,
    confirmed_date date,
    is_confirmed boolean
);


ALTER TABLE public.confirm_employer_users OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16776)
-- Name: confirm_employer_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.confirm_employer_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.confirm_employer_users_id_seq OWNER TO postgres;

--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 211
-- Name: confirm_employer_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.confirm_employer_users_id_seq OWNED BY public.confirm_employer_users.id;


--
-- TOC entry 225 (class 1259 OID 26432)
-- Name: edu_graduates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.edu_graduates (
    id integer NOT NULL,
    description character varying NOT NULL
);


ALTER TABLE public.edu_graduates OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 26430)
-- Name: edu_graduate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.edu_graduate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.edu_graduate_id_seq OWNER TO postgres;

--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 224
-- Name: edu_graduate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.edu_graduate_id_seq OWNED BY public.edu_graduates.id;


--
-- TOC entry 205 (class 1259 OID 16720)
-- Name: employer_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employer_users (
    user_id integer NOT NULL,
    company_name character varying(100) NOT NULL,
    web_address character varying(50) NOT NULL,
    phone_number character varying(11) NOT NULL,
    user_confirm boolean
);


ALTER TABLE public.employer_users OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16687)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16735)
-- Name: job_positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_positions (
    id integer NOT NULL,
    "position" character varying NOT NULL
);


ALTER TABLE public.job_positions OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16733)
-- Name: job_positions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_positions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_positions_id_seq OWNER TO postgres;

--
-- TOC entry 3144 (class 0 OID 0)
-- Dependencies: 207
-- Name: job_positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_positions_id_seq OWNED BY public.job_positions.id;


--
-- TOC entry 214 (class 1259 OID 26274)
-- Name: job_postings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_postings (
    id integer NOT NULL,
    job_position_id integer NOT NULL,
    description character varying NOT NULL,
    city_id integer NOT NULL,
    min_salary integer,
    max_salary integer,
    open_position_number integer NOT NULL,
    created_date date NOT NULL,
    closed_date date,
    is_active boolean NOT NULL,
    employer_id integer NOT NULL
);


ALTER TABLE public.job_postings OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 26272)
-- Name: job_postings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_postings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_postings_id_seq OWNER TO postgres;

--
-- TOC entry 3145 (class 0 OID 0)
-- Dependencies: 213
-- Name: job_postings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_postings_id_seq OWNED BY public.job_postings.id;


--
-- TOC entry 223 (class 1259 OID 26421)
-- Name: resume_edu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resume_edu (
    id integer NOT NULL,
    resume_id integer NOT NULL,
    school_name character varying NOT NULL,
    graduate_id integer NOT NULL,
    school_department character varying NOT NULL,
    started_date date NOT NULL,
    ended_date date,
    created_date date NOT NULL
);


ALTER TABLE public.resume_edu OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 26419)
-- Name: resume_edu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resume_edu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resume_edu_id_seq OWNER TO postgres;

--
-- TOC entry 3146 (class 0 OID 0)
-- Dependencies: 222
-- Name: resume_edu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resume_edu_id_seq OWNED BY public.resume_edu.id;


--
-- TOC entry 227 (class 1259 OID 26443)
-- Name: resume_job_exp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resume_job_exp (
    id integer NOT NULL,
    resume_id integer NOT NULL,
    company_name character varying NOT NULL,
    job_position_id integer NOT NULL,
    started_date date NOT NULL,
    ended_date date,
    created_date date NOT NULL
);


ALTER TABLE public.resume_job_exp OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 26441)
-- Name: resume_job_exp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resume_job_exp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resume_job_exp_id_seq OWNER TO postgres;

--
-- TOC entry 3147 (class 0 OID 0)
-- Dependencies: 226
-- Name: resume_job_exp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resume_job_exp_id_seq OWNED BY public.resume_job_exp.id;


--
-- TOC entry 221 (class 1259 OID 26410)
-- Name: resume_langs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resume_langs (
    id integer NOT NULL,
    resume_id integer NOT NULL,
    language character varying NOT NULL,
    lang_level character(1) NOT NULL,
    created_date date NOT NULL
);


ALTER TABLE public.resume_langs OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 26408)
-- Name: resume_langs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resume_langs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resume_langs_id_seq OWNER TO postgres;

--
-- TOC entry 3148 (class 0 OID 0)
-- Dependencies: 220
-- Name: resume_langs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resume_langs_id_seq OWNED BY public.resume_langs.id;


--
-- TOC entry 219 (class 1259 OID 26398)
-- Name: resume_techs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resume_techs (
    id integer NOT NULL,
    resume_id integer NOT NULL,
    description character varying NOT NULL,
    created_date date NOT NULL
);


ALTER TABLE public.resume_techs OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 26396)
-- Name: resume_techs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resume_techs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resume_techs_id_seq OWNER TO postgres;

--
-- TOC entry 3149 (class 0 OID 0)
-- Dependencies: 218
-- Name: resume_techs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resume_techs_id_seq OWNED BY public.resume_techs.id;


--
-- TOC entry 217 (class 1259 OID 26387)
-- Name: resumes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resumes (
    id integer NOT NULL,
    candidate_id integer NOT NULL,
    github_link character varying,
    linked_link character varying,
    photo character varying,
    description character varying,
    created_date date NOT NULL,
    is_active boolean,
    updated_date date
);


ALTER TABLE public.resumes OWNER TO postgres;

--
-- TOC entry 3150 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE resumes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.resumes IS 'CV Tablosu';


--
-- TOC entry 228 (class 1259 OID 26489)
-- Name: resumes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.resumes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.resumes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 206 (class 1259 OID 16725)
-- Name: staff_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff_users (
    user_id integer NOT NULL,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    verify boolean
);


ALTER TABLE public.staff_users OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16706)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    mail character varying(50) NOT NULL,
    password character varying(16) NOT NULL,
    verify boolean
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16704)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3151 (class 0 OID 0)
-- Dependencies: 201
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 210 (class 1259 OID 16746)
-- Name: users_verify; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_verify (
    id integer NOT NULL,
    verify_code character varying NOT NULL,
    is_confirmed boolean,
    created_date date,
    confirmed_date date,
    user_id integer NOT NULL
);


ALTER TABLE public.users_verify OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16744)
-- Name: verify_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.verify_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.verify_code_id_seq OWNER TO postgres;

--
-- TOC entry 3152 (class 0 OID 0)
-- Dependencies: 209
-- Name: verify_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.verify_code_id_seq OWNED BY public.users_verify.id;


--
-- TOC entry 2944 (class 2604 OID 16717)
-- Name: candidate_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_users ALTER COLUMN id SET DEFAULT nextval('public.candidate_users_user_id_seq'::regclass);


--
-- TOC entry 2947 (class 2604 OID 16781)
-- Name: confirm_employer_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.confirm_employer_users ALTER COLUMN id SET DEFAULT nextval('public.confirm_employer_users_id_seq'::regclass);


--
-- TOC entry 2952 (class 2604 OID 26435)
-- Name: edu_graduates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edu_graduates ALTER COLUMN id SET DEFAULT nextval('public.edu_graduate_id_seq'::regclass);


--
-- TOC entry 2945 (class 2604 OID 16738)
-- Name: job_positions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_positions ALTER COLUMN id SET DEFAULT nextval('public.job_positions_id_seq'::regclass);


--
-- TOC entry 2948 (class 2604 OID 26277)
-- Name: job_postings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_postings ALTER COLUMN id SET DEFAULT nextval('public.job_postings_id_seq'::regclass);


--
-- TOC entry 2951 (class 2604 OID 26424)
-- Name: resume_edu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resume_edu ALTER COLUMN id SET DEFAULT nextval('public.resume_edu_id_seq'::regclass);


--
-- TOC entry 2953 (class 2604 OID 26446)
-- Name: resume_job_exp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resume_job_exp ALTER COLUMN id SET DEFAULT nextval('public.resume_job_exp_id_seq'::regclass);


--
-- TOC entry 2950 (class 2604 OID 26413)
-- Name: resume_langs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resume_langs ALTER COLUMN id SET DEFAULT nextval('public.resume_langs_id_seq'::regclass);


--
-- TOC entry 2949 (class 2604 OID 26401)
-- Name: resume_techs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resume_techs ALTER COLUMN id SET DEFAULT nextval('public.resume_techs_id_seq'::regclass);


--
-- TOC entry 2943 (class 2604 OID 16709)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2946 (class 2604 OID 16749)
-- Name: users_verify id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_verify ALTER COLUMN id SET DEFAULT nextval('public.verify_code_id_seq'::regclass);


--
-- TOC entry 2959 (class 2606 OID 16719)
-- Name: candidate_users candidate_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_users
    ADD CONSTRAINT candidate_users_pkey PRIMARY KEY (id);


--
-- TOC entry 2979 (class 2606 OID 26290)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 2975 (class 2606 OID 16783)
-- Name: confirm_employer_users confirm_employer_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.confirm_employer_users
    ADD CONSTRAINT confirm_employer_users_pkey PRIMARY KEY (id);


--
-- TOC entry 2989 (class 2606 OID 26440)
-- Name: edu_graduates edu_graduate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edu_graduates
    ADD CONSTRAINT edu_graduate_pkey PRIMARY KEY (id);


--
-- TOC entry 2991 (class 2606 OID 26488)
-- Name: edu_graduates edu_graduates_description_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edu_graduates
    ADD CONSTRAINT edu_graduates_description_key UNIQUE (description);


--
-- TOC entry 2963 (class 2606 OID 16724)
-- Name: employer_users employer_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer_users
    ADD CONSTRAINT employer_users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2967 (class 2606 OID 16743)
-- Name: job_positions job_positions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_positions
    ADD CONSTRAINT job_positions_pkey PRIMARY KEY (id);


--
-- TOC entry 2977 (class 2606 OID 26282)
-- Name: job_postings job_postings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_postings
    ADD CONSTRAINT job_postings_pkey PRIMARY KEY (id);


--
-- TOC entry 2987 (class 2606 OID 26429)
-- Name: resume_edu resume_edu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resume_edu
    ADD CONSTRAINT resume_edu_pkey PRIMARY KEY (id);


--
-- TOC entry 2993 (class 2606 OID 26451)
-- Name: resume_job_exp resume_job_exp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resume_job_exp
    ADD CONSTRAINT resume_job_exp_pkey PRIMARY KEY (id);


--
-- TOC entry 2985 (class 2606 OID 26418)
-- Name: resume_langs resume_langs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resume_langs
    ADD CONSTRAINT resume_langs_pkey PRIMARY KEY (id);


--
-- TOC entry 2983 (class 2606 OID 26406)
-- Name: resume_techs resume_techs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resume_techs
    ADD CONSTRAINT resume_techs_pkey PRIMARY KEY (id);


--
-- TOC entry 2981 (class 2606 OID 26395)
-- Name: resumes resumes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resumes
    ADD CONSTRAINT resumes_pkey PRIMARY KEY (id);


--
-- TOC entry 2965 (class 2606 OID 16732)
-- Name: staff_users staff_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_users
    ADD CONSTRAINT staff_users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2961 (class 2606 OID 16849)
-- Name: candidate_users uk_identity_number; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_users
    ADD CONSTRAINT uk_identity_number UNIQUE (national_identity);


--
-- TOC entry 2955 (class 2606 OID 16847)
-- Name: users uk_mail; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_mail UNIQUE (mail);


--
-- TOC entry 2969 (class 2606 OID 17108)
-- Name: job_positions uk_position; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_positions
    ADD CONSTRAINT uk_position UNIQUE ("position");


--
-- TOC entry 2971 (class 2606 OID 16851)
-- Name: users_verify uk_verify_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_verify
    ADD CONSTRAINT uk_verify_code UNIQUE (verify_code);


--
-- TOC entry 2957 (class 2606 OID 16711)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2973 (class 2606 OID 16754)
-- Name: users_verify verify_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_verify
    ADD CONSTRAINT verify_code_pkey PRIMARY KEY (id);


--
-- TOC entry 2994 (class 2606 OID 16784)
-- Name: candidate_users candidate_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate_users
    ADD CONSTRAINT candidate_users_user_id_fkey FOREIGN KEY (id) REFERENCES public.users(id);


--
-- TOC entry 2998 (class 2606 OID 16834)
-- Name: confirm_employer_users confirm_employer_users_employer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.confirm_employer_users
    ADD CONSTRAINT confirm_employer_users_employer_id_fkey FOREIGN KEY (employer_id) REFERENCES public.employer_users(user_id);


--
-- TOC entry 2995 (class 2606 OID 16789)
-- Name: employer_users employer_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer_users
    ADD CONSTRAINT employer_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3002 (class 2606 OID 26482)
-- Name: resume_edu resume_edu_graduate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resume_edu
    ADD CONSTRAINT resume_edu_graduate_id_fkey FOREIGN KEY (graduate_id) REFERENCES public.edu_graduates(id);


--
-- TOC entry 3003 (class 2606 OID 26477)
-- Name: resume_edu resume_edu_resume_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resume_edu
    ADD CONSTRAINT resume_edu_resume_id_fkey FOREIGN KEY (resume_id) REFERENCES public.resumes(id);


--
-- TOC entry 3004 (class 2606 OID 26472)
-- Name: resume_job_exp resume_job_exp_job_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resume_job_exp
    ADD CONSTRAINT resume_job_exp_job_position_id_fkey FOREIGN KEY (job_position_id) REFERENCES public.job_positions(id);


--
-- TOC entry 3005 (class 2606 OID 26467)
-- Name: resume_job_exp resume_job_exp_resume_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resume_job_exp
    ADD CONSTRAINT resume_job_exp_resume_id_fkey FOREIGN KEY (resume_id) REFERENCES public.resumes(id);


--
-- TOC entry 3001 (class 2606 OID 26462)
-- Name: resume_langs resume_langs_resume_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resume_langs
    ADD CONSTRAINT resume_langs_resume_id_fkey FOREIGN KEY (resume_id) REFERENCES public.resumes(id);


--
-- TOC entry 3000 (class 2606 OID 26457)
-- Name: resume_techs resume_techs_resume_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resume_techs
    ADD CONSTRAINT resume_techs_resume_id_fkey FOREIGN KEY (resume_id) REFERENCES public.resumes(id);


--
-- TOC entry 2999 (class 2606 OID 26452)
-- Name: resumes resumes_candidate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resumes
    ADD CONSTRAINT resumes_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES public.candidate_users(id);


--
-- TOC entry 2996 (class 2606 OID 16794)
-- Name: staff_users staff_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_users
    ADD CONSTRAINT staff_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2997 (class 2606 OID 25554)
-- Name: users_verify user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_verify
    ADD CONSTRAINT user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2021-06-05 00:06:26

--
-- PostgreSQL database dump complete
--


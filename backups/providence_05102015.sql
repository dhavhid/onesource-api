--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: attorneys_doctors; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE attorneys_doctors (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    phone character varying(20) NOT NULL,
    fax character varying(20),
    email character varying(250),
    is_attorney smallint DEFAULT (1)::smallint NOT NULL,
    requesting_office_id integer,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE attorneys_doctors OWNER TO postgres;

--
-- Name: attorneys_doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE attorneys_doctors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attorneys_doctors_id_seq OWNER TO postgres;

--
-- Name: attorneys_doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE attorneys_doctors_id_seq OWNED BY attorneys_doctors.id;


--
-- Name: bodyparts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bodyparts (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT '2015-07-20 00:00:00'::timestamp without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT '2015-07-20 00:00:00'::timestamp without time zone NOT NULL
);


ALTER TABLE bodyparts OWNER TO postgres;

--
-- Name: bodyparts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bodyparts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bodyparts_id_seq OWNER TO postgres;

--
-- Name: bodyparts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bodyparts_id_seq OWNED BY bodyparts.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE clients (
    id integer NOT NULL,
    date_of_referral date NOT NULL,
    date_received date NOT NULL,
    case_type character varying(250) NOT NULL,
    firstname character varying(250) NOT NULL,
    lastname character varying(250) NOT NULL,
    dob date NOT NULL,
    ssn character varying(80),
    phone character varying(30) NOT NULL,
    phone_ext character varying(20),
    alt_phone character varying(30),
    address character varying(250) NOT NULL,
    address1 character varying(250),
    address2 character varying(250),
    city character varying(250) NOT NULL,
    region_id integer,
    zipcode character varying(5) NOT NULL,
    doi date NOT NULL,
    body_parts text NOT NULL,
    other_ibp text,
    insurance_company_id integer,
    is_doctor_mpn smallint DEFAULT 1 NOT NULL,
    employer_name character varying(250),
    referral_source_id integer,
    attorney_id integer,
    attorney_notes text,
    clinic_id integer,
    doctor_id integer,
    scheduled_with character varying(250),
    appt_date timestamp without time zone,
    appt_confirmed_id integer,
    appt_reason_cancel_id integer,
    date_moved timestamp without time zone,
    clinic_notes text,
    patient_treating smallint DEFAULT 1,
    next_appt timestamp without time zone,
    verified_with character varying(255),
    first_seen date,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    created_by integer,
    updated_by integer
);


ALTER TABLE clients OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clients_id_seq OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clients_id_seq OWNED BY clients.id;


--
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE logs (
    id integer NOT NULL,
    action character varying(250) NOT NULL,
    entity character varying(100) NOT NULL,
    entity_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE logs OWNER TO postgres;

--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE logs_id_seq OWNER TO postgres;

--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE logs_id_seq OWNED BY logs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE migrations (
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE migrations OWNER TO postgres;

--
-- Name: oauth_access_token_scopes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth_access_token_scopes (
    id integer NOT NULL,
    access_token_id character varying(40) NOT NULL,
    scope_id character varying(40) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE oauth_access_token_scopes OWNER TO postgres;

--
-- Name: oauth_access_token_scopes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth_access_token_scopes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth_access_token_scopes_id_seq OWNER TO postgres;

--
-- Name: oauth_access_token_scopes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth_access_token_scopes_id_seq OWNED BY oauth_access_token_scopes.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth_access_tokens (
    id character varying(40) NOT NULL,
    session_id integer NOT NULL,
    expire_time integer NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE oauth_access_tokens OWNER TO postgres;

--
-- Name: oauth_auth_code_scopes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth_auth_code_scopes (
    id integer NOT NULL,
    auth_code_id character varying(40) NOT NULL,
    scope_id character varying(40) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE oauth_auth_code_scopes OWNER TO postgres;

--
-- Name: oauth_auth_code_scopes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth_auth_code_scopes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth_auth_code_scopes_id_seq OWNER TO postgres;

--
-- Name: oauth_auth_code_scopes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth_auth_code_scopes_id_seq OWNED BY oauth_auth_code_scopes.id;


--
-- Name: oauth_auth_codes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth_auth_codes (
    id character varying(40) NOT NULL,
    session_id integer NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    expire_time integer NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE oauth_auth_codes OWNER TO postgres;

--
-- Name: oauth_client_endpoints; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth_client_endpoints (
    id integer NOT NULL,
    client_id character varying(40) NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE oauth_client_endpoints OWNER TO postgres;

--
-- Name: oauth_client_endpoints_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth_client_endpoints_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth_client_endpoints_id_seq OWNER TO postgres;

--
-- Name: oauth_client_endpoints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth_client_endpoints_id_seq OWNED BY oauth_client_endpoints.id;


--
-- Name: oauth_client_grants; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth_client_grants (
    id integer NOT NULL,
    client_id character varying(40) NOT NULL,
    grant_id character varying(40) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE oauth_client_grants OWNER TO postgres;

--
-- Name: oauth_client_grants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth_client_grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth_client_grants_id_seq OWNER TO postgres;

--
-- Name: oauth_client_grants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth_client_grants_id_seq OWNED BY oauth_client_grants.id;


--
-- Name: oauth_client_scopes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth_client_scopes (
    id integer NOT NULL,
    client_id character varying(40) NOT NULL,
    scope_id character varying(40) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE oauth_client_scopes OWNER TO postgres;

--
-- Name: oauth_client_scopes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth_client_scopes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth_client_scopes_id_seq OWNER TO postgres;

--
-- Name: oauth_client_scopes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth_client_scopes_id_seq OWNED BY oauth_client_scopes.id;


--
-- Name: oauth_clients; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth_clients (
    id character varying(40) NOT NULL,
    secret character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE oauth_clients OWNER TO postgres;

--
-- Name: oauth_grant_scopes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth_grant_scopes (
    id integer NOT NULL,
    grant_id character varying(40) NOT NULL,
    scope_id character varying(40) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE oauth_grant_scopes OWNER TO postgres;

--
-- Name: oauth_grant_scopes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth_grant_scopes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth_grant_scopes_id_seq OWNER TO postgres;

--
-- Name: oauth_grant_scopes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth_grant_scopes_id_seq OWNED BY oauth_grant_scopes.id;


--
-- Name: oauth_grants; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth_grants (
    id character varying(40) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE oauth_grants OWNER TO postgres;

--
-- Name: oauth_refresh_tokens; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth_refresh_tokens (
    id character varying(40) NOT NULL,
    access_token_id character varying(40) NOT NULL,
    expire_time integer NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE oauth_refresh_tokens OWNER TO postgres;

--
-- Name: oauth_scopes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth_scopes (
    id character varying(40) NOT NULL,
    description character varying(255) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE oauth_scopes OWNER TO postgres;

--
-- Name: oauth_session_scopes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth_session_scopes (
    id integer NOT NULL,
    session_id integer NOT NULL,
    scope_id character varying(40) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE oauth_session_scopes OWNER TO postgres;

--
-- Name: oauth_session_scopes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth_session_scopes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth_session_scopes_id_seq OWNER TO postgres;

--
-- Name: oauth_session_scopes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth_session_scopes_id_seq OWNED BY oauth_session_scopes.id;


--
-- Name: oauth_sessions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth_sessions (
    id integer NOT NULL,
    client_id character varying(40) NOT NULL,
    owner_type character varying(255) DEFAULT 'user'::character varying NOT NULL,
    owner_id character varying(255) NOT NULL,
    client_redirect_uri character varying(255),
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    CONSTRAINT oauth_sessions_owner_type_check CHECK (((owner_type)::text = ANY (ARRAY[('client'::character varying)::text, ('user'::character varying)::text])))
);


ALTER TABLE oauth_sessions OWNER TO postgres;

--
-- Name: oauth_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth_sessions_id_seq OWNER TO postgres;

--
-- Name: oauth_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth_sessions_id_seq OWNED BY oauth_sessions.id;


--
-- Name: passengers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE passengers (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    dob date,
    phone character varying(30),
    phone_ext character varying(20),
    address character varying(250),
    ibp text,
    appt_date timestamp without time zone,
    client_id integer,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE passengers OWNER TO postgres;

--
-- Name: passengers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE passengers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE passengers_id_seq OWNER TO postgres;

--
-- Name: passengers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE passengers_id_seq OWNED BY passengers.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE password_resets OWNER TO postgres;

--
-- Name: reasons; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reasons (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    is_confirmation smallint DEFAULT (0)::smallint NOT NULL,
    created_at timestamp(0) without time zone DEFAULT '2015-07-20 00:00:00'::timestamp without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT '2015-07-20 00:00:00'::timestamp without time zone NOT NULL
);


ALTER TABLE reasons OWNER TO postgres;

--
-- Name: reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reasons_id_seq OWNER TO postgres;

--
-- Name: reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reasons_id_seq OWNED BY reasons.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE regions (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    abbr character varying(2) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT '2015-07-21 00:00:00'::timestamp without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT '2015-07-21 00:00:00'::timestamp without time zone NOT NULL
);


ALTER TABLE regions OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE regions_id_seq OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE regions_id_seq OWNED BY regions.id;


--
-- Name: reports; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reports (
    id integer NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    name character varying(250),
    options jsonb,
    access integer[],
    owner integer NOT NULL,
    "default" smallint DEFAULT 0::smallint NOT NULL
);


ALTER TABLE reports OWNER TO postgres;

--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reports_id_seq OWNER TO postgres;

--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reports_id_seq OWNED BY reports.id;


--
-- Name: requesting_offices; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE requesting_offices (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    address1 character varying(250) NOT NULL,
    address2 character varying(250),
    city character varying(250) NOT NULL,
    zipcode character varying(5) NOT NULL,
    phone character varying(20) NOT NULL,
    fax character varying(20),
    contact character varying(250) NOT NULL,
    email character varying(250),
    alt_phone character varying(20),
    is_lawoffice smallint DEFAULT (1)::smallint NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    is_insurance smallint DEFAULT (0)::smallint NOT NULL,
    is_clinic smallint DEFAULT (0)::smallint NOT NULL,
    link character varying(250),
    username character varying(100),
    pass character varying(100),
    county character varying(255),
    insurance_url character varying(255),
    insurance_login character varying(255),
    insurance_pass character varying(255),
    notes text
);


ALTER TABLE requesting_offices OWNER TO postgres;

--
-- Name: requesting_offices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE requesting_offices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE requesting_offices_id_seq OWNER TO postgres;

--
-- Name: requesting_offices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE requesting_offices_id_seq OWNED BY requesting_offices.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    write smallint DEFAULT (0)::smallint NOT NULL,
    user_id integer,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sessions (
    id integer NOT NULL,
    start_time timestamp(0) without time zone NOT NULL,
    end_time timestamp(0) without time zone NOT NULL,
    ip character varying(32) NOT NULL,
    is_closed smallint DEFAULT (0)::smallint NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    access_token character varying(40)
);


ALTER TABLE sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sessions_id_seq OWNED BY sessions.id;


--
-- Name: test; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE test (
    id integer NOT NULL,
    report jsonb
);


ALTER TABLE test OWNER TO postgres;

--
-- Name: test_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE test_id_seq OWNER TO postgres;

--
-- Name: test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE test_id_seq OWNED BY test.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(60) DEFAULT md5('123'::text) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    is_admin smallint DEFAULT 0::smallint NOT NULL
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: view_reports; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_reports AS
 SELECT clients.id,
    clients.date_of_referral,
    clients.date_received,
    clients.case_type,
    clients.firstname,
    clients.lastname,
    clients.dob,
    clients.ssn,
    clients.phone,
    clients.phone_ext,
    clients.alt_phone,
    clients.address,
    clients.address1,
    clients.address2,
    clients.city,
    clients.zipcode,
    clients.doi,
    clients.body_parts,
    clients.other_ibp,
    clients.is_doctor_mpn,
    clients.employer_name,
    clients.attorney_notes,
    clients.scheduled_with,
    clients.appt_date,
    clients.date_moved,
    clients.clinic_notes,
    clients.patient_treating,
    clients.next_appt,
    clients.verified_with,
    clients.first_seen,
    clients.created_at,
    clients.updated_at,
    clients.created_by,
    clients.updated_by,
    clients.appt_reason_cancel_id,
    clients.appt_confirmed_id,
    clients.referral_source_id,
    clients.clinic_id,
    clients.insurance_company_id,
    clients.attorney_id,
    clients.doctor_id,
        CASE
            WHEN (clinics.name IS NULL) THEN NULL::text
            WHEN (clinics.name IS NOT NULL) THEN concat(clinics.name, ', ', clinics.address1, ', ', clinics.city, ', ', clinics.county)
            ELSE NULL::text
        END AS clinic_name,
    clinics.address1 AS clinic_address1,
    clinics.address2 AS clinic_address2,
    clinics.city AS clinic_city,
    clinics.county AS clinic_county,
    doctors.name AS doctor_name,
    attorneys.name AS attorney_name,
    lawoffices.name AS lawoffice_name,
    insurances.name AS insurance_name,
    confirmations.name AS confirmed,
    cancellations.name AS cancelled,
    creating.name AS "createdBy",
    updating.name AS "updatedBy"
   FROM (((((((((clients
     JOIN attorneys_doctors attorneys ON ((attorneys.id = clients.attorney_id)))
     LEFT JOIN requesting_offices lawoffices ON ((lawoffices.id = clients.referral_source_id)))
     LEFT JOIN requesting_offices clinics ON ((clinics.id = clients.clinic_id)))
     LEFT JOIN requesting_offices insurances ON ((insurances.id = clients.insurance_company_id)))
     LEFT JOIN attorneys_doctors doctors ON ((doctors.id = clients.doctor_id)))
     LEFT JOIN reasons confirmations ON ((confirmations.id = clients.appt_confirmed_id)))
     LEFT JOIN reasons cancellations ON ((cancellations.id = clients.appt_reason_cancel_id)))
     LEFT JOIN users creating ON ((creating.id = clients.created_by)))
     LEFT JOIN users updating ON ((updating.id = clients.updated_by)));


ALTER TABLE view_reports OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attorneys_doctors ALTER COLUMN id SET DEFAULT nextval('attorneys_doctors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bodyparts ALTER COLUMN id SET DEFAULT nextval('bodyparts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients ALTER COLUMN id SET DEFAULT nextval('clients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY logs ALTER COLUMN id SET DEFAULT nextval('logs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_access_token_scopes ALTER COLUMN id SET DEFAULT nextval('oauth_access_token_scopes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_auth_code_scopes ALTER COLUMN id SET DEFAULT nextval('oauth_auth_code_scopes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_client_endpoints ALTER COLUMN id SET DEFAULT nextval('oauth_client_endpoints_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_client_grants ALTER COLUMN id SET DEFAULT nextval('oauth_client_grants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_client_scopes ALTER COLUMN id SET DEFAULT nextval('oauth_client_scopes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_grant_scopes ALTER COLUMN id SET DEFAULT nextval('oauth_grant_scopes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_session_scopes ALTER COLUMN id SET DEFAULT nextval('oauth_session_scopes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_sessions ALTER COLUMN id SET DEFAULT nextval('oauth_sessions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY passengers ALTER COLUMN id SET DEFAULT nextval('passengers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reasons ALTER COLUMN id SET DEFAULT nextval('reasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY regions ALTER COLUMN id SET DEFAULT nextval('regions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports ALTER COLUMN id SET DEFAULT nextval('reports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requesting_offices ALTER COLUMN id SET DEFAULT nextval('requesting_offices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessions ALTER COLUMN id SET DEFAULT nextval('sessions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY test ALTER COLUMN id SET DEFAULT nextval('test_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: attorneys_doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY attorneys_doctors (id, name, phone, fax, email, is_attorney, requesting_office_id, created_at, updated_at) FROM stdin;
610	G. John Jansen	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
611	Lionel Giron	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
612	Rezai & Assc.	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
613	Gabriel Martinez	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
614	Jon M. Woods	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
615	Maricela Bermudez	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
616	Payman Zargari	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
617	Maxwell Agha	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
618	Kyle Nielsen	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
619	Nielsen & Assc.	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
620	Patrick Saboorian	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
621	Sean O'keefe	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
622	Steve K. Marks	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
623	Michael Holmes	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
624	Kampf Schiavone	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
625	Alexander Rosenburg	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
626	Jeffrey Geren	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
627	Jeff Klein	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
628	Ray Wang	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
629	Solimon & Rodgers	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
630	Vincent Quigg	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
631	William Green	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
632	Leyva & Night	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
633	Rose Klein	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
634	Ola Moore	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
635	Marc Grossman	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
636	Levy Ford	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
637	Arteaga & Garcia	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
638	Arteaga & Assc.	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
639	Julia Mac	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
640	Barkhordarian Law Firm	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
641	Ronald Canter	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
642	Barry Hinden	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
643	Bazan Huerta	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
644	Berger & Michelena	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
645	Bigonger Law	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
646	Chahine & Associates	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
647	Garret Law Group	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
648	Mitchell & Shea	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
649	Moses Luna	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
650	Rodriguez & King	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
651	Prussak Welch & Avila	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
652	Sarah Dini	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
653	Rawa Law Group	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
654	Ainbinder & Pratt	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
655	Glauber Berenson	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
656	Jarod Parker	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
657	Haleh Shekarchian	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
658	Williams Abrego & Associates	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
659	Oracle Law Firm	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
660	Dial & Associates	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
661	Paris Law Group	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
662	Ruth Prager	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
663	Sef Krell	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
664	Steven Sapera	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
665	Leo H. Hernandez	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
666	Miles & Hatcher	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
667	Cleveland & Metz	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
668	William Lindheim	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
669	Carlin & Buchsbaum	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
670	William Kropach	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
671	Silberman & Lam	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
672	Wilshire Law Center	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
673	Legacy Pro Law	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
674	Diefer Law Group	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
675	Miller & Chavez	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
676	Angel Carrazco Jr	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
677	Eric Levine	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
678	Goldschmid Silver & Spindel	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
679	Telleria Telleria & Levy LLP	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
680	Kaeni Law	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
681	Albert D'Antin & Associates	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
682	Pisegna & Zimmerman	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
683	Kiara Andino	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
684	Kamyar R. Shayan	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
685	Pacific Attorneys	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
686	Wilson Kyncl	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
687	Richard Sanedin	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
688	Dulio R. Chavez	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
689	Genaro Legorretta	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
690	Raphael Hedwat	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
691	Invictus Law	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
692	Spalding & Spalding	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
693	Bomberg  Benson & Garrett	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
694	William Cort	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
695	Brian W. Freeman	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
696	Peyman & Rahnama	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
697	Christopher J. Trodden	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
698	Bob Nehoray	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
699	William Vallegos	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
700	Martin von Mizener	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
701	Jones Legal	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
702	Christopher Rhodes	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
703	Westphal Law Group	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
704	Goldman Magdalin & Krikes LLP	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
705	Tamar A. Ekizian	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
706	Christopher Lauria	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
707	Lionel Ciro Sapetto	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
708	Brent Romney	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
709	Michael Yadegari	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
710	Napolin Law Firm	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
711	Farrah Maribel	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
712	Ton Law Center	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
713	Gary Merkle	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
714	Richard A. Fisher	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
715	Briles & Associates	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
716	Leigh Jacobs	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
717	London & Nguyen	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37
718	Randy Higashi DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
719	Abel Quesada MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
720	Bruce DeCarlo MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
721	Hitendra Shah MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
722	Brent Pratley MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
723	Andrew Jarminski MD/PM	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
724	Negin Rameshni DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
725	Ziyad Alam DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
726	Steven Rigler DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
727	David Johnson MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
728	Cristian Santizo MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
729	Jalil Rashti MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
730	Zylna Granado DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
731	Edward Opoku MD/DO	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
732	Catalino Dureza MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
733	James Iwanoff DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
734	Malintze Gutierrez DO	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
735	Michael Schiffman MD/QME	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
736	Kambiz Nourian DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
737	Jose Candelario DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
738	Jack Akmakjian MD/ Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
739	Arthur Harris MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
740	Manuel Anel MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
741	Rita Starritt MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
742	Tracy Darling MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
743	Bryan Aun DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
744	John Korzelious MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
745	Robert Gogatz DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
746	Harout Balian MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
747	Evan Marlowe PMR	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
748	Max Matos MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
749	Curtis Montgomery DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
750	Phu La DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
751	Justin Long DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
752	Bobby Smith DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
753	Edward Mizabeghi MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
754	Roger Rhan DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
755	Chris Atamian DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
756	Carla Scheel DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
757	Samir Daher DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
758	Lawrence Domaracki DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
759	Wonil Yoon DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
760	Mayya Kravchenko DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
761	Eric Gofnung DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
762	Nathan Ford MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
763	Eric Jackson Scott DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
764	Christian Mendoza DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
765	Luigi Kirchman DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
766	Joel Gutierrez DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
767	James Caldero DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
768	Arman Ghods DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
769	Michael Barri DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
770	Lauren Hunter DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
771	Andrew Mooney DC/QME	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
772	Lawrence Miller MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
773	Naresh (Nick) Sharma MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
774	Shahab Mahboubian DO	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
775	Guy Gottschalk M.D	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
776	Sylvia De La Llana MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
777	William Bolling MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
778	Elmostafa  Elkhiar DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
779	Faribar Mobin DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
780	Tom Dabrowski MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
781	Jyrki Suutari DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
782	Galal Goubran MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
783	Joseph Bahan DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
784	Johnny Aviles DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
785	Phong H. Tran MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
786	Robert MacArthur MD/Ortho Surgeon	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
787	James Reid MD/ Ortho Surgeon	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
788	George McClellan DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
789	Elias Murillo DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
790	Richard Mulvania Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
791	Martin Backman MD/Neuro	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
792	Gabriel Wade MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
793	Gary Weessies DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
794	Jose De La Llana MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
795	Antonio Manriquez DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
796	Nagasamundar S. Ashok MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
797	Angel De La Llana MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
798	Nikta Andalib DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
799	Domenic Signorelli DPM	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
800	Michael Price MD/ Ortho Surgeon	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
801	Spencer S. Prasarnsuk DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
802	Logan Osland DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
803	Nicholas Vanderhyde DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
804	Reza Moraffi DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
805	Michael Rudolph DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
806	Arash Yaghoobian MD /Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
807	Van Huy Vu MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
808	Saro Dorian MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
809	Dirk Kancilia DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
810	Richard Hart DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
811	Dat Le DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
812	Sierra Moulton DO	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
813	Daniel Oh DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
814	Jordan Rio DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
815	Tommy Chau DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
816	Ronald Kelly DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17
\.


--
-- Name: attorneys_doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('attorneys_doctors_id_seq', 816, true);


--
-- Data for Name: bodyparts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bodyparts (id, name, created_at, updated_at) FROM stdin;
1	head	2015-07-20 00:00:00	2015-07-20 00:00:00
2	neck	2015-07-20 00:00:00	2015-07-20 00:00:00
4	upper back	2015-07-20 00:00:00	2015-07-20 00:00:00
5	mid back	2015-07-20 00:00:00	2015-07-20 00:00:00
6	lower back	2015-07-20 00:00:00	2015-07-20 00:00:00
8	waist	2015-07-20 00:00:00	2015-07-20 00:00:00
9	coccyx	2015-07-20 00:00:00	2015-07-20 00:00:00
10	psych	2015-07-20 00:00:00	2015-07-20 00:00:00
11	stress	2015-07-20 00:00:00	2015-07-20 00:00:00
12	sleep disorder	2015-07-20 00:00:00	2015-07-20 00:00:00
13	depression	2015-07-20 00:00:00	2015-07-20 00:00:00
14	sexual dysfuntion	2015-07-20 00:00:00	2015-07-20 00:00:00
15	hernia	2015-07-20 00:00:00	2015-07-20 00:00:00
16	groin	2015-07-20 00:00:00	2015-07-20 00:00:00
17	R /shoulder	2015-07-20 00:00:00	2015-07-20 00:00:00
18	L /shoulder	2015-07-20 00:00:00	2015-07-20 00:00:00
19	R /arm	2015-07-20 00:00:00	2015-07-20 00:00:00
20	L /arm	2015-07-20 00:00:00	2015-07-20 00:00:00
21	R /elbow	2015-07-20 00:00:00	2015-07-20 00:00:00
22	L /elbow	2015-07-20 00:00:00	2015-07-20 00:00:00
23	R /forearm	2015-07-20 00:00:00	2015-07-20 00:00:00
24	L /forearm	2015-07-20 00:00:00	2015-07-20 00:00:00
25	R /wrist	2015-07-20 00:00:00	2015-07-20 00:00:00
26	L /wrist	2015-07-20 00:00:00	2015-07-20 00:00:00
27	R /hand	2015-07-20 00:00:00	2015-07-20 00:00:00
28	L /hand	2015-07-20 00:00:00	2015-07-20 00:00:00
29	fingers	2015-07-20 00:00:00	2015-07-20 00:00:00
30	R /ribs	2015-07-20 00:00:00	2015-07-20 00:00:00
31	L /ribs	2015-07-20 00:00:00	2015-07-20 00:00:00
32	R /leg	2015-07-20 00:00:00	2015-07-20 00:00:00
33	L /leg	2015-07-20 00:00:00	2015-07-20 00:00:00
34	R /knee	2015-07-20 00:00:00	2015-07-20 00:00:00
35	L /knee	2015-07-20 00:00:00	2015-07-20 00:00:00
36	R /foot	2015-07-20 00:00:00	2015-07-20 00:00:00
37	L /foot	2015-07-20 00:00:00	2015-07-20 00:00:00
38	toes	2015-07-20 00:00:00	2015-07-20 00:00:00
39	R /ankle	2015-07-20 00:00:00	2015-07-20 00:00:00
40	L /ankle	2015-07-20 00:00:00	2015-07-20 00:00:00
41	R /hip	2015-07-20 00:00:00	2015-07-20 00:00:00
42	L /hip	2015-07-20 00:00:00	2015-07-20 00:00:00
43	R /upper ext	2015-07-20 00:00:00	2015-07-20 00:00:00
44	L /upper ext	2015-07-20 00:00:00	2015-07-20 00:00:00
45	R /lower ext	2015-07-20 00:00:00	2015-07-20 00:00:00
46	L /lower ext	2015-07-20 00:00:00	2015-07-20 00:00:00
47	R /thigh	2015-07-20 00:00:00	2015-07-20 00:00:00
48	L /thigh	2015-07-20 00:00:00	2015-07-20 00:00:00
58	Left Hand	2015-08-05 23:29:45	2015-08-05 23:29:45
3	Back	2015-07-20 00:00:00	2015-08-05 23:43:07
7	Chest	2015-07-20 00:00:00	2015-08-05 23:48:17
59	Right Shoulder	2015-08-05 23:50:58	2015-08-05 23:50:58
60	Left Foot Toes	2015-08-05 23:54:21	2015-08-05 23:54:21
61	Middle finger	2015-08-05 23:56:49	2015-08-05 23:56:49
62	Nail on middle finger	2015-08-05 23:59:25	2015-08-05 23:59:25
63	Head Hair	2015-08-06 00:06:10	2015-08-06 00:06:10
64	bAck	2015-09-28 13:14:54	2015-09-28 13:14:54
65	BACK	2015-09-28 13:23:28	2015-09-28 13:23:28
\.


--
-- Name: bodyparts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bodyparts_id_seq', 65, true);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clients (id, date_of_referral, date_received, case_type, firstname, lastname, dob, ssn, phone, phone_ext, alt_phone, address, address1, address2, city, region_id, zipcode, doi, body_parts, other_ibp, insurance_company_id, is_doctor_mpn, employer_name, referral_source_id, attorney_id, attorney_notes, clinic_id, doctor_id, scheduled_with, appt_date, appt_confirmed_id, appt_reason_cancel_id, date_moved, clinic_notes, patient_treating, next_appt, verified_with, first_seen, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clients_id_seq', 6171, true);


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY logs (id, action, entity, entity_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('logs_id_seq', 47, true);


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY migrations (migration, batch) FROM stdin;
2014_10_12_000000_create_users_table	1
2014_10_12_100000_create_password_resets_table	1
2015_05_31_171731_create_doctors_table	1
2015_05_31_171816_create_helps_table	1
2015_07_08_164046_create_bodyparts_table	2
2015_07_08_165413_create_regions_table	3
2015_07_08_165804_create_requesting_offices_table	4
2015_07_08_170716_create_attorneys_doctors_table	4
2015_07_08_172039_create_reasons_table	5
2015_07_08_172756_create_sessions_table	6
2015_07_08_173547_create_logs_table	7
2015_07_08_174130_drop_doctors_table	7
2015_07_08_174709_create_clients_table	7
2015_07_09_215015_create_passengers_table	8
2015_07_13_163932_alter_regions_table_add_abbr	9
2015_07_13_170343_add_column_is_confirmation_to_table_reasons	10
2015_07_13_173744_drop_timestamps_bodyparts_table	11
2015_07_13_173831_drop_timestamps_reasons_table	11
2015_07_13_231121_add_column_is_insurance_requesting_office_table	12
2015_07_13_232046_add_is_insurance_requesting_office_table	13
2015_07_14_011145_add_index_date_of_referral_clients_table	14
2015_07_20_221505_add_timestamps_to_bodyparts_table	15
2015_07_21_174254_add_timestamps_to_reasons_table	16
2015_07_21_225033_add_timestamps_to_regions_table	17
2015_07_22_220317_add_index_clinic_lawoffice_insurance_table_requesting_offices	18
2015_07_22_234120_alter_foreigns_in_clients_table	19
2015_07_23_003039_alter_not_null_client_id_on_table_passengers	20
2015_07_23_010510_add_roles_table	21
2015_07_23_012425_add_default_password_to_users	22
2015_07_23_113746_drop_not_null_user_id_table_roles	23
2015_01_01_000001_create_oauth_scopes_table	24
2015_01_01_000002_create_oauth_grants_table	24
2015_01_01_000003_create_oauth_grant_scopes_table	24
2015_01_01_000004_create_oauth_clients_table	24
2015_01_01_000005_create_oauth_client_endpoints_table	24
2015_01_01_000006_create_oauth_client_scopes_table	24
2015_01_01_000007_create_oauth_client_grants_table	24
2015_01_01_000008_create_oauth_sessions_table	24
2015_01_01_000009_create_oauth_session_scopes_table	24
2015_01_01_000010_create_oauth_auth_codes_table	24
2015_01_01_000011_create_oauth_auth_code_scopes_table	24
2015_01_01_000012_create_oauth_access_tokens_table	24
2015_01_01_000013_create_oauth_access_token_scopes_table	24
2015_01_01_000014_create_oauth_refresh_tokens_table	24
2015_07_27_000416_add_access_token_column_sessions_table	25
2015_08_02_002607_alter_table_clients_modify_column_appt_date	26
2015_08_02_003131_alter_table_passenger_modify_column_appt_date	27
2015_08_03_131753_alter_column_phone_table_clients	28
2015_08_03_163645_add_link_to_insurance_table_requesting_offices	29
2015_09_01_203626_drop_not_null_columns_table_clients	30
2015_09_01_222649_drop_not_null_ssn_table_clients	31
2015_09_01_224421_add_county_requesting_offices	32
2015_09_03_213419_alter_column_appt_date	33
2015_09_03_214431_alter_next_appt_to_timestamp	34
2015_09_07_131437_alter_timestamp	35
2015_09_10_141236_add_activity_fields_to_clients	36
2015_09_16_000635_create_reports_table	37
2015_09_16_001443_add_columns_to_table_reports	38
2015_09_21_172155_add_column_default	39
2015_09_24_203221_drop_not_null_lawoffice_in_clients_table	40
2015_09_24_233115_add_login_info_to_insurances	41
2015_09_25_231430_add_admin_field_to_users	42
2015_09_28_133058_remove_unique_name_clinics	43
2015_10_05_131357_alter_requesting_offices_table	44
\.


--
-- Data for Name: oauth_access_token_scopes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth_access_token_scopes (id, access_token_id, scope_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: oauth_access_token_scopes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth_access_token_scopes_id_seq', 1, false);


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth_access_tokens (id, session_id, expire_time, created_at, updated_at) FROM stdin;
Qj33oOTG7Kd34phVMAMuXDlrqvTqcwEnwzeRj5PI	1	1438583128	2015-07-27 00:25:28	2015-07-27 00:25:28
0Bo9izIsREORirt62YDCZFeM56drVsIsfrIeAN5D	2	1438583175	2015-07-27 00:26:15	2015-07-27 00:26:15
u4TisxC1MGhbJcmSp7JHTAaC7dr3v6WEHTqcotlX	3	1439229206	2015-08-03 11:53:27	2015-08-03 11:53:27
zzpcPMVcn4Ks8G0Y79WZ0e7wGmqHOgJJAax2xwNs	4	1439303908	2015-08-04 08:38:28	2015-08-04 08:38:28
oKhSG1TyAXCU48Z3l0b2CSjGVIFb8SZgEVVG9F9p	5	1439869608	2015-08-10 21:46:48	2015-08-10 21:46:48
Gun6aKNSY6tKjzIUKSjFkm8PPq38xfM93vX9UnnU	6	1439873164	2015-08-10 22:46:04	2015-08-10 22:46:04
dLPDaJq42QXHZ8tseF0yGBPor3Hk1BwbfR5l9zCJ	7	1439334573	2015-08-10 22:46:41	2015-08-10 22:46:41
mXOVCrCnvX1nYLVgZ73eFzZv9fblHpAurZe2uOvs	8	1439943295	2015-08-11 18:14:55	2015-08-11 18:14:55
xx0NW7HmBaJP5CqLNX5CX2TMO8OccRRlsRZ1FSa0	9	1439954224	2015-08-11 21:17:04	2015-08-11 21:17:04
jlbef7Mlws7VINoVYSkKxtCP78QUObbLjUWMq1RT	10	1439954487	2015-08-11 21:21:27	2015-08-11 21:21:27
GMOFrz0g9LKCzqjBE7KXnizClJaXOmL3mN3l1DR3	11	1439954718	2015-08-11 21:25:18	2015-08-11 21:25:18
OacNYVN6PHC9csKSasUI7luTIJ6AgYX9pfj6zpmr	12	1439346795	2015-08-11 21:26:47	2015-08-11 21:26:47
dNMQCor5mdjd1V4rLSNvjZuA0osXSN3uVCznCJXD	13	1439346994	2015-08-11 21:33:49	2015-08-11 21:33:49
rpB5PeBMuApkyd0Qh6enJDxYfbQTYqxNA826Fu2h	14	1439347239	2015-08-11 21:40:31	2015-08-11 21:40:31
OROSc3GA9xwuVMc5vDIfaVfG4dzt5ygGaMimjmrU	15	1439348457	2015-08-11 21:58:41	2015-08-11 21:58:41
qMnn47P59mUOsKdDJX7ZmcbxitSrCHYSfVZ58nd0	16	1439403270	2015-08-11 22:01:27	2015-08-11 22:01:27
kEMkrans86VdoeNEqRD8vU97XQdYdEOPUFDXCQyY	17	1439403337	2015-08-12 13:14:39	2015-08-12 13:14:39
la4TcHQZ2k3cWjmOx6vDUk2FJISrBvflWACSFGrt	18	1440011760	2015-08-12 13:16:00	2015-08-12 13:16:00
BLSIDRUapIT9p75hqUPjozHxboONIXoKQO1vYgBT	19	1441760858	2015-09-01 19:07:38	2015-09-01 19:07:38
Bs68bVjGCfGakhHV5YpGX0zQHY3bMABaF7I3qFtq	20	1441983713	2015-09-08 20:07:54	2015-09-08 20:07:54
q5yKLpzbzVMvcwmVmY9FZrquUEXZjdiQvdL57gw8	21	1442593108	2015-09-11 10:18:28	2015-09-11 10:18:28
cZsF14YP1lKdUsvCRXrlR0eOC0fuV1PVz95sfl8Z	22	1442606780	2015-09-11 14:06:20	2015-09-11 14:06:20
uxXpkU4Oj085f1KOAGAFBjRIzVYbuwZrluWNWVNY	23	1442608582	2015-09-11 14:36:22	2015-09-11 14:36:22
qS0tQD5bCYLUZwxQ1F1rTA1Oxw52m5JtPvummdeC	24	1442945867	2015-09-15 12:17:47	2015-09-15 12:17:47
gInaVD4JAynl1heI20rpNAuWRZmq9KVJP1vwhPBE	26	1443136085	2015-09-23 11:10:08	2015-09-23 11:10:08
Y08xgpHgOM2Z3sH0MJasW279kYaYVoA7AlKyUyew	25	1443136643	2015-09-18 15:04:37	2015-09-18 15:04:37
48tt1C7Sy5Ijo7wietzNyc1rpbnv3yA1J7uiJnJW	27	1443152197	2015-09-24 18:08:36	2015-09-24 18:08:36
vGzBfvT5ReyklsjXagXFr51RkGQ3e4s7E54oQV6Y	28	1443239465	2015-09-24 18:17:47	2015-09-24 18:17:47
hFR8B6fp3yxXrz3dOSbOeJ6kV0qgk6O4w7kCfIEC	30	1443303979	2015-09-25 22:51:34	2015-09-25 22:51:34
idousYxxV1eBeMdbzVXnV2F48lFNnqL9QmNK9tT0	31	1443475785	2015-09-26 16:46:35	2015-09-26 16:46:35
gfr6kFiuW7aVPuo6EP6h23J9MsJmpTodJwDGKks6	32	1443475842	2015-09-28 16:29:58	2015-09-28 16:29:58
FJ0vbFJ1GV5GEvN1RhszqRlbtTpPLipxNPL1XHrm	29	1443476941	2015-09-24 22:36:50	2015-09-24 22:36:50
oXlfgJQWjwQVoKEKROG9VXt63NW1gcKrBujI8GIp	33	1443479220	2015-09-28 16:30:53	2015-09-28 16:30:53
peaqmlhGt9gZyRbRS4wP8QjgYnoJq8e7QeibohWn	35	1443479619	2015-09-28 17:27:10	2015-09-28 17:27:10
6FTIathgL29nBQsSX7h1XUgKOuMTiNvbb5R1c9RG	36	1443479673	2015-09-28 17:33:50	2015-09-28 17:33:50
Jx6V6TcJqqLo8VigyqIpNzy23u954j0zscIS3ZxI	37	1443479778	2015-09-28 17:34:42	2015-09-28 17:34:42
HfCrsMvat7DgUBXDjmJFTT6Uyn5nHwKbM1bDz98H	38	1443479814	2015-09-28 17:36:33	2015-09-28 17:36:33
jTpvPH2Zn7FuW3C2jigUMSFdaY7liNTThUhhV70Q	34	1443532449	2015-09-28 16:49:12	2015-09-28 16:49:12
CEIrwqqMg4RuNteJVScWcWpqXJvgt7G7kPy1Hr9u	39	1443545096	2015-09-28 17:37:10	2015-09-28 17:37:10
WTeGpf7ylCsJxjqpb76pvJOHfa1wTpOkbmDpBrDD	40	1444020124	2015-09-29 08:14:22	2015-09-29 08:14:22
m9TW1FVhce2UC3Igcr1VR4p02yv2Aio9no8a0EQG	42	1444020482	2015-10-04 23:44:31	2015-10-04 23:44:31
eolmx2yWY67571GuIXE05XmAQBeVcrLqeBfRkFiP	41	1444021481	2015-09-29 11:45:45	2015-09-29 11:45:45
ioqmo2FhEFNYo8E56aVgh5Y06PJ3ZxiXAUJ2zTYZ	43	1444629929	2015-10-05 00:05:29	2015-10-05 00:05:29
\.


--
-- Data for Name: oauth_auth_code_scopes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth_auth_code_scopes (id, auth_code_id, scope_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: oauth_auth_code_scopes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth_auth_code_scopes_id_seq', 1, false);


--
-- Data for Name: oauth_auth_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth_auth_codes (id, session_id, redirect_uri, expire_time, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: oauth_client_endpoints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth_client_endpoints (id, client_id, redirect_uri, created_at, updated_at) FROM stdin;
\.


--
-- Name: oauth_client_endpoints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth_client_endpoints_id_seq', 1, false);


--
-- Data for Name: oauth_client_grants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth_client_grants (id, client_id, grant_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: oauth_client_grants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth_client_grants_id_seq', 1, false);


--
-- Data for Name: oauth_client_scopes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth_client_scopes (id, client_id, scope_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: oauth_client_scopes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth_client_scopes_id_seq', 1, false);


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth_clients (id, secret, name, created_at, updated_at) FROM stdin;
11D0DDFEAEFE5AE6D38C3A88F471552E	7CE967F43ACAA1FDD7D8B400E9BE3EE7	OneSource WebApp	2015-07-27 00:24:25	2015-07-27 00:24:27
\.


--
-- Data for Name: oauth_grant_scopes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth_grant_scopes (id, grant_id, scope_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: oauth_grant_scopes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth_grant_scopes_id_seq', 1, false);


--
-- Data for Name: oauth_grants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth_grants (id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: oauth_refresh_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth_refresh_tokens (id, access_token_id, expire_time, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: oauth_scopes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth_scopes (id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: oauth_session_scopes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth_session_scopes (id, session_id, scope_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: oauth_session_scopes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth_session_scopes_id_seq', 1, false);


--
-- Data for Name: oauth_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth_sessions (id, client_id, owner_type, owner_id, client_redirect_uri, created_at, updated_at) FROM stdin;
1	11D0DDFEAEFE5AE6D38C3A88F471552E	user	604	\N	2015-07-27 00:25:28	2015-07-27 00:25:28
2	11D0DDFEAEFE5AE6D38C3A88F471552E	user	604	\N	2015-07-27 00:26:15	2015-07-27 00:26:15
3	11D0DDFEAEFE5AE6D38C3A88F471552E	user	604	\N	2015-08-03 11:53:27	2015-08-03 11:53:27
4	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-08-04 08:38:28	2015-08-04 08:38:28
5	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-08-10 21:46:48	2015-08-10 21:46:48
6	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-08-10 22:46:04	2015-08-10 22:46:04
7	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-08-10 22:46:41	2015-08-10 22:46:41
8	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-08-11 18:14:55	2015-08-11 18:14:55
9	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-08-11 21:17:04	2015-08-11 21:17:04
10	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-08-11 21:21:27	2015-08-11 21:21:27
11	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-08-11 21:25:18	2015-08-11 21:25:18
12	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-08-11 21:26:47	2015-08-11 21:26:47
13	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-08-11 21:33:49	2015-08-11 21:33:49
14	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-08-11 21:40:31	2015-08-11 21:40:31
15	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-08-11 21:58:41	2015-08-11 21:58:41
16	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-08-11 22:01:27	2015-08-11 22:01:27
17	11D0DDFEAEFE5AE6D38C3A88F471552E	user	604	\N	2015-08-12 13:14:39	2015-08-12 13:14:39
18	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-08-12 13:16:00	2015-08-12 13:16:00
19	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-09-01 19:07:38	2015-09-01 19:07:38
20	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-09-08 20:07:54	2015-09-08 20:07:54
21	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-09-11 10:18:28	2015-09-11 10:18:28
22	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-09-11 14:06:20	2015-09-11 14:06:20
23	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-09-11 14:36:22	2015-09-11 14:36:22
24	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-09-15 12:17:47	2015-09-15 12:17:47
25	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-09-18 15:04:37	2015-09-18 15:04:37
26	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-09-23 11:10:07	2015-09-23 11:10:07
27	11D0DDFEAEFE5AE6D38C3A88F471552E	user	609	\N	2015-09-24 18:08:36	2015-09-24 18:08:36
28	11D0DDFEAEFE5AE6D38C3A88F471552E	user	609	\N	2015-09-24 18:17:47	2015-09-24 18:17:47
29	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-09-24 22:36:50	2015-09-24 22:36:50
30	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-09-25 22:51:34	2015-09-25 22:51:34
31	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-09-26 16:46:35	2015-09-26 16:46:35
32	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-09-28 16:29:58	2015-09-28 16:29:58
33	11D0DDFEAEFE5AE6D38C3A88F471552E	user	609	\N	2015-09-28 16:30:53	2015-09-28 16:30:53
34	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-09-28 16:49:12	2015-09-28 16:49:12
35	11D0DDFEAEFE5AE6D38C3A88F471552E	user	609	\N	2015-09-28 17:27:10	2015-09-28 17:27:10
36	11D0DDFEAEFE5AE6D38C3A88F471552E	user	609	\N	2015-09-28 17:33:50	2015-09-28 17:33:50
37	11D0DDFEAEFE5AE6D38C3A88F471552E	user	609	\N	2015-09-28 17:34:42	2015-09-28 17:34:42
38	11D0DDFEAEFE5AE6D38C3A88F471552E	user	609	\N	2015-09-28 17:36:33	2015-09-28 17:36:33
39	11D0DDFEAEFE5AE6D38C3A88F471552E	user	609	\N	2015-09-28 17:37:10	2015-09-28 17:37:10
40	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-09-29 08:14:22	2015-09-29 08:14:22
41	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-09-29 11:45:45	2015-09-29 11:45:45
42	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-10-04 23:44:31	2015-10-04 23:44:31
43	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-10-05 00:05:29	2015-10-05 00:05:29
\.


--
-- Name: oauth_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth_sessions_id_seq', 43, true);


--
-- Data for Name: passengers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY passengers (id, name, dob, phone, phone_ext, address, ibp, appt_date, client_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: passengers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('passengers_id_seq', 6228, true);


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: reasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reasons (id, name, is_confirmation, created_at, updated_at) FROM stdin;
1	Conf by L/O	1	2015-07-20 00:00:00	2015-07-20 00:00:00
2	Conf w/pt	1	2015-07-20 00:00:00	2015-07-20 00:00:00
3	Left Detailed Message	1	2015-07-20 00:00:00	2015-07-20 00:00:00
4	Mailed Letter	1	2015-07-20 00:00:00	2015-07-20 00:00:00
5	TXT Message	1	2015-07-20 00:00:00	2015-07-20 00:00:00
6	Unable to Contact	1	2015-07-20 00:00:00	2015-07-20 00:00:00
7	Wrong Number	1	2015-07-20 00:00:00	2015-07-20 00:00:00
8	1. Hold - No show / Need Atty Status	0	2015-07-20 00:00:00	2015-07-20 00:00:00
9	2. Hold - Pending appt from clinic	0	2015-07-20 00:00:00	2015-07-20 00:00:00
10	3. Hold - Pending Atty response	0	2015-07-20 00:00:00	2015-07-20 00:00:00
11	4. Hold - Missed all appt's	0	2015-07-20 00:00:00	2015-07-20 00:00:00
12	5. Hold - Existing pt w/clinic	0	2015-07-20 00:00:00	2015-07-20 00:00:00
13	6. Hold - Need working phone number	0	2015-07-20 00:00:00	2015-07-20 00:00:00
14	7. Cx'd - No Dr. on MPN	0	2015-07-20 00:00:00	2015-07-20 00:00:00
15	8. Cx'd - No Dr. in area	0	2015-07-20 00:00:00	2015-07-20 00:00:00
16	9. Cx'd - Client settled case	0	2015-07-20 00:00:00	2015-07-20 00:00:00
17	10. Cx'd - Atty dropped case	0	2015-07-20 00:00:00	2015-07-20 00:00:00
18	11. Cx'd - Client settled case/dropped case	0	2015-07-20 00:00:00	2015-07-20 00:00:00
20	13. Cx'd - No Chiro/Ortho body parts	0	2015-07-20 00:00:00	2015-07-20 00:00:00
21	14. Cx'd - Dr. rejected case	0	2015-07-20 00:00:00	2015-07-20 00:00:00
22	15. Cx'd - Client sent to another clinic	0	2015-07-20 00:00:00	2015-07-20 00:00:00
23	16. Cx'd - Client stayed w/current PTP	0	2015-07-20 00:00:00	2015-07-20 00:00:00
24	17. Cx'd - Pending Atty response	0	2015-07-20 00:00:00	2015-07-20 00:00:00
25	18. Cx'd - Clinic pending medical records/paperwork	0	2015-07-20 00:00:00	2015-07-20 00:00:00
26	19. Cx'd - Client out of State	0	2015-07-20 00:00:00	2015-07-20 00:00:00
27	20. Cx'd - Client incarcerated	0	2015-07-20 00:00:00	2015-07-20 00:00:00
28	21. Cx'd - Clinic does not accept WC insurance	0	2015-07-20 00:00:00	2015-07-20 00:00:00
29	22. Cx'd - Client having SX	0	2015-07-20 00:00:00	2015-07-20 00:00:00
30	23. Cx'd - Client pregnant	0	2015-07-20 00:00:00	2015-07-20 00:00:00
31	24. Cx'd - Client subbed out Atty	0	2015-07-20 00:00:00	2015-07-20 00:00:00
32	25. Cx'd - Atty sent to MPN Dr.	0	2015-07-20 00:00:00	2015-07-20 00:00:00
33	26. Cx'd - Client completed all treatment	0	2015-07-20 00:00:00	2015-07-20 00:00:00
34	27. Cx'd - Client Deceased	0	2015-07-20 00:00:00	2015-07-20 00:00:00
35	28. Cx'd - No contact w/client per Atty	0	2015-07-20 00:00:00	2015-07-20 00:00:00
36	29. Cx'd - No working phone number	0	2015-07-20 00:00:00	2015-07-20 00:00:00
37	30. Cx'd - Referral sent in error	0	2015-07-20 00:00:00	2015-07-20 00:00:00
39	Confirmed by the Dr. himself	1	2015-07-21 19:19:48	2015-07-21 19:19:48
19	12. Cx'd - Missed all appt's	0	2015-07-20 00:00:00	2015-07-20 00:00:00
\.


--
-- Name: reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reasons_id_seq', 43, true);


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY regions (id, name, abbr, created_at, updated_at) FROM stdin;
30	Nevada	NV	2015-07-21 00:00:00	2015-07-21 00:00:00
3	Alpine	AK	2015-07-21 00:00:00	2015-07-21 00:00:00
2	Alameda	AL	2015-07-21 00:00:00	2015-07-21 23:13:35
4	Amador	AZ	2015-07-21 00:00:00	2015-07-21 00:00:00
5	Butte	AR	2015-07-21 00:00:00	2015-07-21 00:00:00
6	Calaveras	CA	2015-07-21 00:00:00	2015-07-21 00:00:00
7	Colusa	CO	2015-07-21 00:00:00	2015-07-21 00:00:00
8	Contra Costa	CT	2015-07-21 00:00:00	2015-07-21 00:00:00
9	Del Norte	DE	2015-07-21 00:00:00	2015-07-21 00:00:00
10	El Dorado	DC	2015-07-21 00:00:00	2015-07-21 00:00:00
11	Fresno	FL	2015-07-21 00:00:00	2015-07-21 00:00:00
12	Glenn	GA	2015-07-21 00:00:00	2015-07-21 00:00:00
13	Humboldt	HI	2015-07-21 00:00:00	2015-07-21 00:00:00
14	Imperial	ID	2015-07-21 00:00:00	2015-07-21 00:00:00
15	Inyo	IL	2015-07-21 00:00:00	2015-07-21 00:00:00
16	Kern	IN	2015-07-21 00:00:00	2015-07-21 00:00:00
17	Kings	IA	2015-07-21 00:00:00	2015-07-21 00:00:00
18	Lake	KS	2015-07-21 00:00:00	2015-07-21 00:00:00
19	Lassen	KY	2015-07-21 00:00:00	2015-07-21 00:00:00
20	Los Angeles	LA	2015-07-21 00:00:00	2015-07-21 00:00:00
21	Madera	ME	2015-07-21 00:00:00	2015-07-21 00:00:00
22	Marin	MD	2015-07-21 00:00:00	2015-07-21 00:00:00
23	Mariposa	MA	2015-07-21 00:00:00	2015-07-21 00:00:00
24	Mendocino	MI	2015-07-21 00:00:00	2015-07-21 00:00:00
25	Merced	MN	2015-07-21 00:00:00	2015-07-21 00:00:00
26	Modoc	MS	2015-07-21 00:00:00	2015-07-21 00:00:00
27	Mono	MO	2015-07-21 00:00:00	2015-07-21 00:00:00
28	Monterey	MT	2015-07-21 00:00:00	2015-07-21 00:00:00
29	Napa	NE	2015-07-21 00:00:00	2015-07-21 00:00:00
31	Orange	NH	2015-07-21 00:00:00	2015-07-21 00:00:00
32	Placer	NJ	2015-07-21 00:00:00	2015-07-21 00:00:00
33	Plumas	NM	2015-07-21 00:00:00	2015-07-21 00:00:00
34	Riverside	NY	2015-07-21 00:00:00	2015-07-21 00:00:00
35	Sacramento	NC	2015-07-21 00:00:00	2015-07-21 00:00:00
36	San Benito	ND	2015-07-21 00:00:00	2015-07-21 00:00:00
37	San Bernardino	OH	2015-07-21 00:00:00	2015-07-21 00:00:00
38	San Diego	OK	2015-07-21 00:00:00	2015-07-21 00:00:00
39	San Francisco	OR	2015-07-21 00:00:00	2015-07-21 00:00:00
40	San Joaquin	PA	2015-07-21 00:00:00	2015-07-21 00:00:00
41	San Luis Obispo	RI	2015-07-21 00:00:00	2015-07-21 00:00:00
42	San Mateo	SC	2015-07-21 00:00:00	2015-07-21 00:00:00
43	Santa Barbara	SD	2015-07-21 00:00:00	2015-07-21 00:00:00
44	Santa Clara	TN	2015-07-21 00:00:00	2015-07-21 00:00:00
45	Santa Cruz	TX	2015-07-21 00:00:00	2015-07-21 00:00:00
46	Shasta	UT	2015-07-21 00:00:00	2015-07-21 00:00:00
47	Sierra	VT	2015-07-21 00:00:00	2015-07-21 00:00:00
48	Siskiyou	VA	2015-07-21 00:00:00	2015-07-21 00:00:00
49	Solano	WA	2015-07-21 00:00:00	2015-07-21 00:00:00
50	Sonoma	WV	2015-07-21 00:00:00	2015-07-21 00:00:00
51	Stanislaus	WI	2015-07-21 00:00:00	2015-07-21 00:00:00
52	Sutter	WY	2015-07-21 00:00:00	2015-07-21 00:00:00
54	Tehama	OC	2015-08-06 00:21:08	2015-08-06 00:21:08
55	Trinity	TR	2015-09-01 23:24:06	2015-09-01 23:24:09
56	Tulare	TU	2015-09-01 23:24:43	2015-09-01 23:24:50
57	Tuolumne	TO	2015-09-01 23:25:18	2015-09-01 23:25:23
58	Ventura	VE	2015-09-01 23:25:45	2015-09-01 23:25:47
59	Yolo	YO	2015-09-01 23:26:06	2015-09-01 23:26:13
60	Yuba	YU	2015-09-01 23:26:31	2015-09-01 23:26:33
\.


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('regions_id_seq', 60, true);


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reports (id, created_at, updated_at, name, options, access, owner, "default") FROM stdin;
7	2015-09-29 08:33:32	2015-09-29 08:35:41	Cases Recently Added	{"name": "Cases Recently Added", "sort": [], "type": "table", "access": [], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Record ID#", "value": "id"}, {"text": "First Name", "value": "firstname"}, {"text": "Last Name", "value": "lastname"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "Last Updated By", "value": "updatedBy"}], "filters": [{"field": "date_of_referral", "value": "2015-08-01", "condition": "on_after"}], "allow_edit": true, "allow_view": true, "share_type": "0", "v1/reports": "", "description": "Default Report", "filter_match": "AND", "v1/reports/7": "", "default_report": true, "description_on_report_page": true}	{607,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,603,608,604,610,609}	605	1
9	2015-09-29 13:17:50	2015-09-29 14:45:19	Cases From This Month	{"name": "Cases From This Month", "sort": [{"field": "clinic_name", "order": "sort_group_low_high", "value": ""}], "type": "table", "access": [], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Record ID#", "value": "id"}, {"text": "First Name", "value": "firstname"}, {"text": "Last Name", "value": "lastname"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "Last Updated By", "value": "updatedBy"}], "filters": [{"field": "date_of_referral", "value": "1969-12-31", "condition": "is_this_month"}], "allow_edit": true, "allow_view": true, "share_type": "0", "v1/reports": "", "description": "Cases recorded this month", "filter_match": "AND", "show_summary": true, "v1/reports/9": "", "description_on_report_page": true}	{607,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,603,608,604,610,609}	605	0
8	2015-09-29 13:03:29	2015-09-29 15:15:09	Appointments From Yesterday	{"name": "Appointments From Yesterday", "sort": [], "type": "table", "access": [], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Record ID#", "value": "id"}, {"text": "First Name", "value": "firstname"}, {"text": "Last Name", "value": "lastname"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "Last Updated By", "value": "updatedBy"}], "filters": [{"field": "appt_date", "value": 7, "condition": "is_days_past"}], "allow_edit": true, "allow_view": true, "share_type": "0", "v1/reports": "", "description": "Appointments scheduled to yesterday", "filter_match": "AND", "v1/reports/8": "", "description_on_report_page": true}	{607,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,603,608,604,610,609}	605	0
10	2015-09-29 15:04:11	2015-10-03 22:53:36	Latests added	{"name": "Latests added", "sort": [{"field": "clinic_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Record ID#", "value": "id"}, {"text": "First Name", "value": "firstname"}, {"text": "Last Name", "value": "lastname"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "Last Updated By", "value": "updatedBy"}], "filters": [{"field": "date_of_referral", "value": "2014-01-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2014-06-30", "condition": "before_on"}], "allow_edit": false, "allow_view": false, "share_type": "0", "v1/reports": "", "filter_match": "AND", "show_summary": true, "v1/reports/10": ""}	{607,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,603,608,604,610,609}	605	0
\.


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reports_id_seq', 10, true);


--
-- Data for Name: requesting_offices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY requesting_offices (id, name, address1, address2, city, zipcode, phone, fax, contact, email, alt_phone, is_lawoffice, created_at, updated_at, is_insurance, is_clinic, link, username, pass, county, insurance_url, insurance_login, insurance_pass, notes) FROM stdin;
1165	Screening Sign Up	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N
1166	Bell Medical Solutions	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N
1167	DSJ	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N
1168	Your Doctor Connection	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N
1169	Law Offices of G. John Jansen	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N
1170	Law Office of Lionel Giron	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N
1171	Law Offices of Gabriel Martinez	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N
1172	Law Offices of Jon M. Woods	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N
1173	Law Office of Maricela Bermudez	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N
1174	Law Offices of Rezai & Associates	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N
1175	The Nielsen Firm	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N
1176	Other	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N
1177	Impressive	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N
1179	ACE	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1180	AIMS	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1181	Acclaim Risk Management	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1182	AIG (Chartis)	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1183	Alaska National Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1184	Applied Underwriters	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1185	Argonaut Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1186	American Claims Management (ACM)	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1187	Barrett Business Services Inc (BBSI)	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1188	Berkshire Hathaway	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1189	Broadspire	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1190	Capistrano USD	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1191	Care West	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1192	Chubb Services	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1193	CIGA	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1194	CNA Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1195	Companion P&C	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1196	CompWest Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1197	Corvel	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1198	County of Los Angeles	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1199	City of Los Angeles	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1200	Disney	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1201	Disney World Wide Services	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1202	Disneyland Resort	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1203	Disneyland	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1204	Employers Compensation	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1205	Employers Direct	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1206	ESIS	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1207	Farmers Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1208	Fireman's Fund	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1209	First Comp	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1210	Gallagher Bassett	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1211	Golden Eagle Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1212	Guard Insurance Group	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1213	Hanover Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1214	Hartford Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1215	Hortica	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1216	Insurance Company of the West (ICW)	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1217	Intercare	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1218	Interplan	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1219	Keenan & Associates	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1220	Kroger Co.	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1221	Liberty Mutual / Helmsman	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1222	Lumberman's Underwriting	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1223	LWP Claims Solutions	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1224	Meadowbrook	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1225	Midwest	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1226	Mitsui Sumitomo Marine	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1227	One Beacon Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1228	Pacific Comp	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1229	Pasadena USD	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1230	Patriot Risk Management	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1231	Preferred Employers	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1232	Republic Indemnity Co. of America	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1233	Safeway Inc. (Vons)	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1234	State Comp Ins. Fund (SCIF)	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1235	Seabright Brightcure Network	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1236	Seabright CA Broadbased Network	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1237	Sears Holdings	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1238	Sedgwick	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1239	Sedgwick CMS	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1240	Sentry Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1241	So Cal Edison	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1242	Specialty Risk Services (SRS)	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1243	Tower Group	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1244	Travelers	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1245	Wellcomp	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1246	York Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1247	Zenith Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1248	Zurich NA	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1249	Church Mutual	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1250	AmTrust North America	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1251	Republic Underwriters	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1252	Carl Warren	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1253	Marriott Claims Services	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1254	Tri Star Claims Administration	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1255	Tristar Risk Management	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1256	HDI - Gerling America Insurance Company	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1257	CCMSI	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1258	Applied Risk Services	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1259	Enstar US Orange Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1260	Federal Insurance Company	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1261	Crum & Forster	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1262	Old Republic	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1263	Everest National Ins.	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1264	National Interstate	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1265	Safety National Casualty	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1266	New Hampshire Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1267	State Farm	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1268	Markel Insurance Services	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1269	Chartis	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1270	Allmerica Financial Benefit Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1271	Uninsured Employers Benefit Trust Fund	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1272	Athens Administrators	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1273	Commerce & Industry Insurance Company	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1274	Guide One Mutual	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1275	ACME Administrators	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1276	Allied	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1277	Alpha Fund	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1278	Matrix Absence Management	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1279	Acclamation Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1280	Southland Claims	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1281	Macy's Corporate Services Risk Management Dept.	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1282	Employers Preferred	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1283	Security National Ins.	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1284	Bunch & Associates	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1285	County of Kern Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1286	Hazelrigg Claims Management Services	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1287	QBE Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1288	Star Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1289	Trinity Insure Services	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1290	Illinois Midwest	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1291	HR Comp	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1292	Packard Claims Administration Inc	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1293	Employers Assurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1294	Tokio Marine	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1295	County of San Bernardino	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1296	State of California Department of Industrial Relations	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1297	New York Marine & General Ins.	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N
1178	AARLA	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 14:40:25	1	0	\N	\N	\N	\N	\N	\N	\N	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eget libero \nrhoncus, tincidunt nisi nec, tristique neque. Donec id risus ultrices, \nconsectetur ipsum quis, laoreet purus. Nullam mattis, leo vel placerat \nluctus, massa augue consectetur lectus, at elementum nibh felis eget \nlacus. Aenean quis scelerisque diam. Vivamus sit amet enim neque. Morbi \nporta vehicula diam ut rutrum. Aliquam elementum tempor diam, eu gravida\n erat sagittis vitae. Vivamus id tellus enim. Aenean ac eleifend turpis.\n Nulla tempus diam auctor interdum commodo. Praesent scelerisque odio a \naugue molestie pharetra. Phasellus eleifend neque hendrerit augue \nrhoncus cursus.\n</p><p>Morbi eget augue dapibus, volutpat neque in, fringilla erat. Maecenas \ncursus cursus leo in elementum. Nunc nec consequat neque. Duis posuere \nfelis sed enim efficitur vulputate. Morbi tempor at ipsum eget aliquam. \nNunc vehicula, lacus non vehicula dapibus, sapien enim fermentum quam, \nsit amet ultricies augue leo vehicula ante. Integer ac nisl a lacus \nmaximus pellentesque vitae rhoncus arcu. Praesent sed massa elementum, \nultrices massa ut, pharetra risus. Nam ut lacus non urna placerat \nmaximus.\n</p>
1069	First Line Health	330 S. Garfield Ave	Suite 228	Alhambra	91801	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:47	2015-10-05 01:24:47	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1070	Rudolph Multi Specialty Group	10399 Lemon Avenue	Suite 105 Alta Loma	Los Angeles	91737	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:47	2015-10-05 01:24:47	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1071	First Line Health	212 S. Grand Avenue	Santa Ana	Orange	92701	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:47	2015-10-05 01:24:47	0	1	\N	\N	\N	Orange	\N	\N	\N	\N
1072	So Cal Chiros	2390 E. Orangewood Avenue	Suite 400 Anaheim	Anaheim	92806	(714) 808-9666	(714) 808-1666	N/A	\N	\N	0	2015-10-05 01:24:47	2015-10-05 01:24:47	0	1	\N	\N	\N	Orange	\N	\N	\N	\N
1073	So Cal Chiros	11525 Brookshire Avenue	Suite 202	Downey	90241	(714) 808-9666	(714) 808-1666	N/A	\N	\N	0	2015-10-05 01:24:47	2015-10-05 01:24:47	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1074	Greenfield Integrated	11920 Ramona		El Monte	91732	(626) 448-5501	(626) 448-5502	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1075	MedNation	2920 F Street	Suite C-5	Bakersfield	93301	(818) 697-6190	(888) 391-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Kern	\N	\N	\N	\N
1076	First Line Health	2920 "F" Street	Suite 15	Bakersfield	93301	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Kern	\N	\N	\N	\N
1077	Advance Care	4025 Maine St.		Baldwin Park	91706	(800) 850-2693	(866) 273-1775	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1078	Rise Wellness Center	5030 Bonita Rd.	Suite B Bonita	Los Angeles	91902	(619) 479-7473	(619) 479-9376	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1079	Crosby Square Chiro	420 Heffernan Ave	Suite B-1	Calexico	92231	(619) 238-0096	(619) 232-7046	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Imperial	\N	\N	\N	\N
1080	First Line Health	420 Heffernan Ave	Suite B-1	Calexico	92231	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Imperial	\N	\N	\N	\N
1081	Southland Spine	1520 Nutmeg Place	Suite 110	Costa Mesa	92626	(714) 751-8110	(714) 751-5098	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Orange	\N	\N	\N	\N
1082	Dr. Jalil Rashti	16661 Ventura Blvd	Suite 701 Encino	Los Angeles	91436	(818) 386-1823	(818) 907-0255	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1083	Crosby Square Chiro	240 S. Hickory St.	Suite 106	Escondido	92025	(619) 238-0096	(619) 232-7046	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N
1084	First Line Health	240 S. Hickory	Suite 106	Escondido	92025	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N
1085	MedNation	5339 North Fresno	Suite 105	Fresno	93710	(818) 697-6190	(888) 391-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Fresno	\N	\N	\N	\N
1086	Lighthouse Medical Mgt	8832 Sierra Ave. Fontana		Fontana	92335	(909) 854-4900	(909) 854-4224	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N
1087	Glendale Urgency Chiropractic Clinic	319 South Brand Blvd.		Glendale	91204	(818) 901-0388	(818) 507-0126	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1088	Rudolph Multi Specialty Group.	10918 Hesperia Road	Suite B	Hesperia	92345	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N
1089	Lighthouse Medical Mgt	6011 Pacific Blvd.	Suite 123	Huntington Park	90255	(909) 854-4224	(909) 565-4406	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1090	First Line Health	6522 Pacific Blvd.		Huntington Park	90255	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1091	Rudolph Multi Specialty Group	81557 Doctor Carreon Blvd	Suite B5 Indio	Indio	92201	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N
1092	First Line Health	44075 Jackson Street	Suite C	Indio	92201	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N
1093	Advance Care	2690 Pacific Avenue	#255	Long Beach	90806	(800) 850-2693	(866) 273-1775	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1094	Willow Medical Group	3311 E. Willow St.		Long Beach	90806	(562) 424-4976	(562) 424-5960	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1095	First Line Health	4300 Long Beach Blvd	Suite 170	Long Beach	90807	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1096	MedNation	4201 Long Beach Blvd.	Suite 430	Long Beach	90807	(818) 697-6190	(888) 391-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1097	MedNation	3580 Wilshire Blvd.	Suite 100	Los Angeles	90010	(818) 697-6190	(888) 391-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1098	Atlantis Health Management	3800 E. Cesar Chavez E. Ave		Los Angeles	90063	(323) 264-6296	(323) 395-5782	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1099	Dr. Jalil Rashti	3800 East Cesar Chavez Ave		Los Angeles	90063	(818) 386-1823	(818) 907-0255	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1100	SCOP	8610 South Sepulveda Blvd.	Suite 109	Los Angeles	90045	(310) 337-3700	(310) 337-1643	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1101	First Line Health	3303 Wilshire Blvd	Suite 1225	Los Angeles	90010	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1102	Harout Balian	MD 4950 San Bernardino Street	Suite 102	Montclair	91763	(909) 624-5277		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N
1103	Gogatz Chiropractic Ctr	40485 Murrieta Hot Springs Rd	Ste. B7 Murrieta	Murrieta	92563	(951) 698-4050	(951) 698-4057	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N
1104	Rudolph Multi Specialty Group	5900 Shattuck Avenue	Suite 201	Oakland	94601	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Alameda	\N	\N	\N	\N
1105	Rise Wellness Center	3231 Waring Court	Suite N	Oceanside	92056	(619) 794-2099	(619) 362-9616	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N
1106	Cedar Medical Group	235 N. Laurel Ave.		Ontario	91762	(909) 988-2554	(909) 988-2584	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N
1107	First Line Health	3602 Inland Empire Blvd	Suite 120 Building B	Ontario	91764	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N
1108	MedNation	1555 West 5th Street	Suite 270	Oxnard	93003	(818) 697-6190	(888) 391-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Ventura	\N	\N	\N	\N
1109	C.O.R. Medical Grp	1405 W. Rancho Vista Blvd.		Palmdale	93551	(661) 274-8725	(661) 274-8205	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1110	First Line Health	1645 E. Palmdale Blvd.	Suite D	Palmdale	93550	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1111	Advance Care	14624 Sherman Way	Suite 404 Van Nuys	Los Angeles	91405	(800) 850-2693	(866) 273-1775	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1112	Gutierrez Chiropractic	8445 S. Rosemead Blvd.		Pico Rivera	90660	(562) 861-1600	(562) 861-1717	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1113	Rudolph Multi Specialty Group	8337 Telegraph Road	Suite 214	Pico Rivera	90660	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1114	First Line Health	10832 Laurel St.	Suite 206	Rancho Cucamonga	91730	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N
1115	MedNation	7012 Reseda Blvd	Suite A2 Reseda	Los Angeles	91335	(818) 697-6190	(888) 391-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1116	Spine & Orthopedic Center	7300 Magnolia Avenue		Riverside	92504	(951) 710-1030	(951) 710-1040	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N
1117	Advance Care	4121 10th Street		Riverside	92501	(800) 850-2693	(866) 273-1775	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N
1118	Rudolph Multi Specialty Group	5870 Arlington Ave.	Suite 101	Riverside	92504	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N
1119	Keystone Health Grp	4843 Arlington Ave.		Riverside	92504	(951) 682-4404	(951) 682-4406	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N
1120	Montgomery Chiropractic	3404 Arlington Ave		Riverside	92506	(951) 782-8369	(951) 782-8378	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N
1121	Southland Spine	4354 Latham Street	Suite 100	Riverside	92501	(714) 751-8110	(714) 751-5098	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N
1122	SCOP	4240 Tequesquite Avenue		Riverside	92601	(310) 337-3700	(310) 337-1643	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N
1123	First Line Health	1881 S. Commerce Center Dr. E.	Suite 112	San Bernardino	92408	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N
1124	First Line Health	165 W. Hospitality Lane	Suite 20	San Bernardino	92408	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N
1125	Montgomery Chiropractic	155 W. Hospitality Lane	Suite 175	San Bernardino	92408	(909) 890-2226	(909) 890-9638	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N
1126	Rudolph Multi Specialty Group	435 W. Orange Show Lane	Suite 104	San Bernardino	92408	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N
1127	Spine & Orthopedic Center	236 W. Orange Show Rd	Suite 114	San Bernardino	92408	(951) 710-1030	(951) 710-1040	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N
1128	Lighthouse Medical Mgt	3645 El Cajon Blvd.		San Diego	92104	(909) 854-4224	(909) 565-4406	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N
1129	Advance Care	7581 Mission Center Ct	Suite 205	San Diego	92108	(800) 850-2693	(866) 273-1775	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N
1130	Rise Wellness Center	2710 Adams Ave		San Diego	92116	(619) 794-2099	(619) 362-9616	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N
1131	Crosby Square Chiro	1885 National Ave.		San Diego	92113	(619) 238-0096	(619) 232-7046	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N
1132	First Line Health	1885 National Avenue		San Diego	92113	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N
1133	Rudolph Multi Specialty Group	2360 Mckee Road	Suite 9	San Jose	95116	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Santa Clara	\N	\N	\N	\N
1134	Advance Care	1125 East 17th Street	N-560 Santa Ana	Orange	92701	(800) 850-2693	(866) 273-1775	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Orange	\N	\N	\N	\N
1135	Tri-Star Medical Group	999 N. Tustin Avenue	Suite 201 Santa Ana	Orange	92705	(714) 975-7950	(714) 975-7951	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Orange	\N	\N	\N	\N
1136	First Line Health	12660 Riverside Dr	Unit 201 Studio City	Los Angeles	91607	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1137	Gutierrez Chiropractic	1304 Santa Anita Avenue	Unit A	South El Monte	91733	(626) 452-0202	(626) 452-0200	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1138	SCOP	14600 Sherman Way	Suite 100-A Van Nuys	Los Angeles	91405	(310) 337-3700	(310) 337-1643	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1139	Montgomery Chiropractic	14707 7th Street	Suite 100	Victorville	92395	(760) 881-3600	(760) 881-3601	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N
1140	Spine & Orthopedic Center	14298 St Andrews Drive	Suite 11	Victorville	92395	(951) 710-1030	(951) 710-1040	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N
1141	MedNation	202 W. Willow Street	Suite 302 Visalia	Visalia	93291	(818) 697-6190	(888) 383-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Tulare	\N	\N	\N	\N
1142	Taft Chiropractic	14850 Roscoe Blvd.	Panorama City	Los Angeles	91402	(818) 340-0089	(818) 340-6985	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1143	Harout Balian MD	333 N. Hill Ave Suite 101		Pasadena	91106	(626) 449-9911	(626) 449-9921	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1144	Cedar Medical Group	3165 N. Garey Ave		Pomona	91767	(909) 392-2230		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1145	Cedar Medical Group	17096 E. Foothill Blvd		Fontana	92335	(909) 428-6989	(909) 428-6939	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N
1146	Industrial Treatment & Rehabilitation Center	155 Hospitality Lane	Suite 245	San Bernardino	92408	(909) 890-9703		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N
1147	First Line Health	1011 E. Devonshire Avenue	Suite 200	Hemet	92543	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N
1148	Industrial Healthcare Physicians Medical Group Inc.	2010 Wilshire Blvd	Suite 926	Los Angeles	90057	(213) 353-4921	(213) 402-7659	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1149	Cedar Medical Group	12730 Heacock Street	Suite 8	Moreno Valley	92553	(951) 247-4976		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N
1150	Cedar Medical Group	15664 Main Street	Ste 100	Hesperia	92345	(760) 244-1740	(760) 244-1741	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N
1151	Dr. Nikta Andalib DC	1224 E. Ave S	Ste B	Palmdale	93550	(661) 266-1611	(661) 266-1295	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1152	NobleQuest	14435 Hamlin Street#108	Van Nuys	Los Angeles	91401	(818) 997-7117	(888) 833-2881	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1153	Innovative Medical Management	7630 Painter Ave #B		Whittier	90602	(562) 696-1441		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1154	MedNation	1905 E. 17th Street	Suite 309 Santa Ana	Orange	92705	(818) 697-6190	(888) 391-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Orange	\N	\N	\N	\N
1155	First Line Health	3231 Waring Ct	Suite N	Oceanside	92056	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N
1156	First Line Health	10800 Paramount Blvd.	Suite 201	Downey	90241	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
1157	Advance Care	2935 Oswell St		Bakersfield	93306	(800) 850-2693	(866) 273-1775	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Kern	\N	\N	\N	\N
1158	Advance Care	2001 N. Solar Drive #165		Oxnard	93036	(805) 485-0500	(805) 485-0057	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Ventura	\N	\N	\N	\N
1159	Bakersfield Medical Group	2935 Oswell Street		Bakersfield	93306	(661) 455-0100	(661) 249-6241	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Kern	\N	\N	\N	\N
1160	First Line Health	12901 Harbor Blvd.	Suite A6	Garden Grove	90840	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Orange	\N	\N	\N	\N
1161	RB Spine Center (Rancho Bernardo)	10801 Thornmint Rd #250		San Diego	92127	(858) 345-4114		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N
1162	RB Spine Center (Mission Valley)	2878 Camino Del Rio S. #404		San Diego	92108	(858) 345-4114		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N
1163	RB Spine Center	601 E. San Ysidro #180	San Ysidro	San Diego	92173	(858) 345-4114		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N
1164	RB Spine Center	163 South Avenue 24	# 203-204	Los Angeles	91401	(858) 345-4114		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N
\.


--
-- Name: requesting_offices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('requesting_offices_id_seq', 1297, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles (id, name, write, user_id, created_at, updated_at) FROM stdin;
111	Body Parts	1	605	2015-08-12 13:15:10	2015-08-12 13:15:10
112	Regions	1	605	2015-08-12 13:15:10	2015-08-12 13:15:10
113	Confirmations	1	605	2015-08-12 13:15:10	2015-08-12 13:15:10
114	Cancelations	1	605	2015-08-12 13:15:10	2015-08-12 13:15:10
115	Law Offices	1	605	2015-08-12 13:15:10	2015-08-12 13:15:10
116	Clinics	1	605	2015-08-12 13:15:10	2015-08-12 13:15:10
117	Insurance Companies	1	605	2015-08-12 13:15:10	2015-08-12 13:15:10
118	Attorneys	1	605	2015-08-12 13:15:10	2015-08-12 13:15:10
119	Doctors	1	605	2015-08-12 13:15:10	2015-08-12 13:15:10
120	Clients	1	605	2015-08-12 13:15:10	2015-08-12 13:15:10
122	Searches	1	605	2015-08-12 13:15:10	2015-08-12 13:15:10
123	Reports	1	605	2015-08-12 13:15:10	2015-08-12 13:15:10
121	Users	1	605	2015-08-12 13:15:10	2015-08-12 13:15:10
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 162, true);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sessions (id, start_time, end_time, ip, is_closed, user_id, created_at, updated_at, access_token) FROM stdin;
45	2015-10-04 23:44:31	2015-10-04 23:48:02	192.168.56.1	1	605	2015-10-04 23:44:31	2015-10-04 23:44:31	m9TW1FVhce2UC3Igcr1VR4p02yv2Aio9no8a0EQG
46	2015-10-05 00:05:29	2015-10-05 00:05:29	192.168.56.1	0	605	2015-10-05 00:05:29	2015-10-05 00:05:29	ioqmo2FhEFNYo8E56aVgh5Y06PJ3ZxiXAUJ2zTYZ
\.


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sessions_id_seq', 46, true);


--
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY test (id, report) FROM stdin;
1	{"name": "Monthly appts. by clinic", "sort": [{"field": "firstname", "order": "asc"}, {"field": "lastname", "order": "desc"}], "type": "table", "group": {"field": "lastname", "group_type": "equal"}, "access": ["common"], "columns": ["firstname", "lastname", "..."], "filters": {"match": "OR|AND", "fields": [{"firstname": "david"}, {"lastname": "martinez"}]}, "description": "Nothing yet to describe", "report_group": "common", "description_on_report_page": 0}
\.


--
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('test_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, name, email, password, remember_token, created_at, updated_at, is_admin) FROM stdin;
605	Jessica Rivera Martínez	jessica@rmpublicidad.com.sv	$2y$10$v66IHeiGIPISLYyZLeL9HeSSL3YPBF/AGaMgtrCTSHhWLRU.FVI1S	\N	2015-08-04 07:37:57	2015-08-04 08:07:38	1
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 610, true);


--
-- Name: attorneys_doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY attorneys_doctors
    ADD CONSTRAINT attorneys_doctors_pkey PRIMARY KEY (id);


--
-- Name: bodyparts_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bodyparts
    ADD CONSTRAINT bodyparts_name_unique UNIQUE (name);


--
-- Name: bodyparts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bodyparts
    ADD CONSTRAINT bodyparts_pkey PRIMARY KEY (id);


--
-- Name: clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_token_scopes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_access_token_scopes
    ADD CONSTRAINT oauth_access_token_scopes_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens_id_session_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_id_session_id_unique UNIQUE (id, session_id);


--
-- Name: oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_auth_code_scopes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_auth_code_scopes
    ADD CONSTRAINT oauth_auth_code_scopes_pkey PRIMARY KEY (id);


--
-- Name: oauth_auth_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_auth_codes
    ADD CONSTRAINT oauth_auth_codes_pkey PRIMARY KEY (id);


--
-- Name: oauth_client_endpoints_client_id_redirect_uri_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_client_endpoints
    ADD CONSTRAINT oauth_client_endpoints_client_id_redirect_uri_unique UNIQUE (client_id, redirect_uri);


--
-- Name: oauth_client_endpoints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_client_endpoints
    ADD CONSTRAINT oauth_client_endpoints_pkey PRIMARY KEY (id);


--
-- Name: oauth_client_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_client_grants
    ADD CONSTRAINT oauth_client_grants_pkey PRIMARY KEY (id);


--
-- Name: oauth_client_scopes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_client_scopes
    ADD CONSTRAINT oauth_client_scopes_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients_id_secret_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_clients
    ADD CONSTRAINT oauth_clients_id_secret_unique UNIQUE (id, secret);


--
-- Name: oauth_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_grant_scopes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_grant_scopes
    ADD CONSTRAINT oauth_grant_scopes_pkey PRIMARY KEY (id);


--
-- Name: oauth_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_grants
    ADD CONSTRAINT oauth_grants_pkey PRIMARY KEY (id);


--
-- Name: oauth_refresh_tokens_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_refresh_tokens
    ADD CONSTRAINT oauth_refresh_tokens_id_unique UNIQUE (id);


--
-- Name: oauth_refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_refresh_tokens
    ADD CONSTRAINT oauth_refresh_tokens_pkey PRIMARY KEY (access_token_id);


--
-- Name: oauth_scopes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_scopes
    ADD CONSTRAINT oauth_scopes_pkey PRIMARY KEY (id);


--
-- Name: oauth_session_scopes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_session_scopes
    ADD CONSTRAINT oauth_session_scopes_pkey PRIMARY KEY (id);


--
-- Name: oauth_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_sessions
    ADD CONSTRAINT oauth_sessions_pkey PRIMARY KEY (id);


--
-- Name: passengers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (id);


--
-- Name: reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reasons
    ADD CONSTRAINT reasons_pkey PRIMARY KEY (id);


--
-- Name: regions_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_name_unique UNIQUE (name);


--
-- Name: regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: requesting_offices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY requesting_offices
    ADD CONSTRAINT requesting_offices_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: attorneys_doctors_name_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX attorneys_doctors_name_index ON attorneys_doctors USING btree (name);


--
-- Name: attorneys_doctors_phone_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX attorneys_doctors_phone_index ON attorneys_doctors USING btree (phone);


--
-- Name: bodyparts_name_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX bodyparts_name_index ON bodyparts USING btree (name);


--
-- Name: clients_appt_date_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX clients_appt_date_index ON clients USING btree (appt_date);


--
-- Name: clients_attorney_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX clients_attorney_id_index ON clients USING btree (attorney_id);


--
-- Name: clients_case_type_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX clients_case_type_index ON clients USING btree (case_type);


--
-- Name: clients_city_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX clients_city_index ON clients USING btree (city);


--
-- Name: clients_clinic_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX clients_clinic_id_index ON clients USING btree (clinic_id);


--
-- Name: clients_date_of_referral_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX clients_date_of_referral_index ON clients USING btree (date_of_referral);


--
-- Name: clients_date_received_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX clients_date_received_index ON clients USING btree (date_received);


--
-- Name: clients_doctor_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX clients_doctor_id_index ON clients USING btree (doctor_id);


--
-- Name: clients_doi_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX clients_doi_index ON clients USING btree (doi);


--
-- Name: clients_firstname_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX clients_firstname_index ON clients USING btree (firstname);


--
-- Name: clients_firstname_lastname_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX clients_firstname_lastname_index ON clients USING btree (firstname, lastname);


--
-- Name: clients_insurance_company_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX clients_insurance_company_id_index ON clients USING btree (insurance_company_id);


--
-- Name: clients_lastname_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX clients_lastname_index ON clients USING btree (lastname);


--
-- Name: clients_referral_source_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX clients_referral_source_id_index ON clients USING btree (referral_source_id);


--
-- Name: clients_ssn_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX clients_ssn_index ON clients USING btree (ssn);


--
-- Name: clients_zipcode_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX clients_zipcode_index ON clients USING btree (zipcode);


--
-- Name: logs_action_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX logs_action_index ON logs USING btree (action);


--
-- Name: logs_entity_entity_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX logs_entity_entity_id_index ON logs USING btree (entity, entity_id);


--
-- Name: oauth_access_token_scopes_access_token_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth_access_token_scopes_access_token_id_index ON oauth_access_token_scopes USING btree (access_token_id);


--
-- Name: oauth_access_token_scopes_scope_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth_access_token_scopes_scope_id_index ON oauth_access_token_scopes USING btree (scope_id);


--
-- Name: oauth_access_tokens_session_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth_access_tokens_session_id_index ON oauth_access_tokens USING btree (session_id);


--
-- Name: oauth_auth_code_scopes_auth_code_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth_auth_code_scopes_auth_code_id_index ON oauth_auth_code_scopes USING btree (auth_code_id);


--
-- Name: oauth_auth_code_scopes_scope_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth_auth_code_scopes_scope_id_index ON oauth_auth_code_scopes USING btree (scope_id);


--
-- Name: oauth_auth_codes_session_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth_auth_codes_session_id_index ON oauth_auth_codes USING btree (session_id);


--
-- Name: oauth_client_grants_client_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth_client_grants_client_id_index ON oauth_client_grants USING btree (client_id);


--
-- Name: oauth_client_grants_grant_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth_client_grants_grant_id_index ON oauth_client_grants USING btree (grant_id);


--
-- Name: oauth_client_scopes_client_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth_client_scopes_client_id_index ON oauth_client_scopes USING btree (client_id);


--
-- Name: oauth_client_scopes_scope_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth_client_scopes_scope_id_index ON oauth_client_scopes USING btree (scope_id);


--
-- Name: oauth_grant_scopes_grant_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth_grant_scopes_grant_id_index ON oauth_grant_scopes USING btree (grant_id);


--
-- Name: oauth_grant_scopes_scope_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth_grant_scopes_scope_id_index ON oauth_grant_scopes USING btree (scope_id);


--
-- Name: oauth_session_scopes_scope_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth_session_scopes_scope_id_index ON oauth_session_scopes USING btree (scope_id);


--
-- Name: oauth_session_scopes_session_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth_session_scopes_session_id_index ON oauth_session_scopes USING btree (session_id);


--
-- Name: oauth_sessions_client_id_owner_type_owner_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oauth_sessions_client_id_owner_type_owner_id_index ON oauth_sessions USING btree (client_id, owner_type, owner_id);


--
-- Name: passengers_client_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX passengers_client_id_index ON passengers USING btree (client_id);


--
-- Name: passengers_name_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX passengers_name_index ON passengers USING btree (name);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX password_resets_email_index ON password_resets USING btree (email);


--
-- Name: password_resets_token_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX password_resets_token_index ON password_resets USING btree (token);


--
-- Name: reasons_name_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reasons_name_index ON reasons USING btree (name);


--
-- Name: regions_abbr_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX regions_abbr_index ON regions USING btree (abbr);


--
-- Name: regions_name_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX regions_name_index ON regions USING btree (name);


--
-- Name: requesting_offices_address1_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX requesting_offices_address1_index ON requesting_offices USING btree (address1);


--
-- Name: requesting_offices_city_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX requesting_offices_city_index ON requesting_offices USING btree (city);


--
-- Name: requesting_offices_is_clinic_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX requesting_offices_is_clinic_index ON requesting_offices USING btree (is_clinic);


--
-- Name: requesting_offices_is_insurance_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX requesting_offices_is_insurance_index ON requesting_offices USING btree (is_insurance);


--
-- Name: requesting_offices_is_lawoffice_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX requesting_offices_is_lawoffice_index ON requesting_offices USING btree (is_lawoffice);


--
-- Name: requesting_offices_name_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX requesting_offices_name_index ON requesting_offices USING btree (name);


--
-- Name: requesting_offices_zipcode_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX requesting_offices_zipcode_index ON requesting_offices USING btree (zipcode);


--
-- Name: roles_name_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX roles_name_index ON roles USING btree (name);


--
-- Name: roles_user_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX roles_user_id_index ON roles USING btree (user_id);


--
-- Name: sessions_access_token_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sessions_access_token_index ON sessions USING btree (access_token);


--
-- Name: sessions_end_time_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sessions_end_time_index ON sessions USING btree (end_time);


--
-- Name: sessions_start_time_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sessions_start_time_index ON sessions USING btree (start_time);


--
-- Name: attorneys_doctors_requesting_office_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attorneys_doctors
    ADD CONSTRAINT attorneys_doctors_requesting_office_id_foreign FOREIGN KEY (requesting_office_id) REFERENCES requesting_offices(id);


--
-- Name: clients_appt_confirmed_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_appt_confirmed_id_foreign FOREIGN KEY (appt_confirmed_id) REFERENCES reasons(id);


--
-- Name: clients_appt_reason_cancel_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_appt_reason_cancel_id_foreign FOREIGN KEY (appt_reason_cancel_id) REFERENCES reasons(id);


--
-- Name: clients_attorney_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_attorney_id_foreign FOREIGN KEY (attorney_id) REFERENCES attorneys_doctors(id);


--
-- Name: clients_clinic_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_clinic_id_foreign FOREIGN KEY (clinic_id) REFERENCES requesting_offices(id);


--
-- Name: clients_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_created_by_foreign FOREIGN KEY (created_by) REFERENCES users(id);


--
-- Name: clients_doctor_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_doctor_id_foreign FOREIGN KEY (doctor_id) REFERENCES attorneys_doctors(id);


--
-- Name: clients_insurance_company_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_insurance_company_id_foreign FOREIGN KEY (insurance_company_id) REFERENCES requesting_offices(id);


--
-- Name: clients_referral_source_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_referral_source_id_foreign FOREIGN KEY (referral_source_id) REFERENCES requesting_offices(id);


--
-- Name: clients_region_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_region_id_foreign FOREIGN KEY (region_id) REFERENCES regions(id);


--
-- Name: clients_updated_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_updated_by_foreign FOREIGN KEY (updated_by) REFERENCES users(id);


--
-- Name: logs_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY logs
    ADD CONSTRAINT logs_user_id_foreign FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: oauth_access_token_scopes_access_token_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_access_token_scopes
    ADD CONSTRAINT oauth_access_token_scopes_access_token_id_foreign FOREIGN KEY (access_token_id) REFERENCES oauth_access_tokens(id) ON DELETE CASCADE;


--
-- Name: oauth_access_token_scopes_scope_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_access_token_scopes
    ADD CONSTRAINT oauth_access_token_scopes_scope_id_foreign FOREIGN KEY (scope_id) REFERENCES oauth_scopes(id) ON DELETE CASCADE;


--
-- Name: oauth_access_tokens_session_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_session_id_foreign FOREIGN KEY (session_id) REFERENCES oauth_sessions(id) ON DELETE CASCADE;


--
-- Name: oauth_auth_code_scopes_auth_code_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_auth_code_scopes
    ADD CONSTRAINT oauth_auth_code_scopes_auth_code_id_foreign FOREIGN KEY (auth_code_id) REFERENCES oauth_auth_codes(id) ON DELETE CASCADE;


--
-- Name: oauth_auth_code_scopes_scope_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_auth_code_scopes
    ADD CONSTRAINT oauth_auth_code_scopes_scope_id_foreign FOREIGN KEY (scope_id) REFERENCES oauth_scopes(id) ON DELETE CASCADE;


--
-- Name: oauth_auth_codes_session_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_auth_codes
    ADD CONSTRAINT oauth_auth_codes_session_id_foreign FOREIGN KEY (session_id) REFERENCES oauth_sessions(id) ON DELETE CASCADE;


--
-- Name: oauth_client_endpoints_client_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_client_endpoints
    ADD CONSTRAINT oauth_client_endpoints_client_id_foreign FOREIGN KEY (client_id) REFERENCES oauth_clients(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: oauth_client_grants_client_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_client_grants
    ADD CONSTRAINT oauth_client_grants_client_id_foreign FOREIGN KEY (client_id) REFERENCES oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_client_grants_grant_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_client_grants
    ADD CONSTRAINT oauth_client_grants_grant_id_foreign FOREIGN KEY (grant_id) REFERENCES oauth_grants(id) ON DELETE CASCADE;


--
-- Name: oauth_client_scopes_client_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_client_scopes
    ADD CONSTRAINT oauth_client_scopes_client_id_foreign FOREIGN KEY (client_id) REFERENCES oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_client_scopes_scope_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_client_scopes
    ADD CONSTRAINT oauth_client_scopes_scope_id_foreign FOREIGN KEY (scope_id) REFERENCES oauth_scopes(id) ON DELETE CASCADE;


--
-- Name: oauth_grant_scopes_grant_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_grant_scopes
    ADD CONSTRAINT oauth_grant_scopes_grant_id_foreign FOREIGN KEY (grant_id) REFERENCES oauth_grants(id) ON DELETE CASCADE;


--
-- Name: oauth_grant_scopes_scope_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_grant_scopes
    ADD CONSTRAINT oauth_grant_scopes_scope_id_foreign FOREIGN KEY (scope_id) REFERENCES oauth_scopes(id) ON DELETE CASCADE;


--
-- Name: oauth_refresh_tokens_access_token_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_refresh_tokens
    ADD CONSTRAINT oauth_refresh_tokens_access_token_id_foreign FOREIGN KEY (access_token_id) REFERENCES oauth_access_tokens(id) ON DELETE CASCADE;


--
-- Name: oauth_session_scopes_scope_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_session_scopes
    ADD CONSTRAINT oauth_session_scopes_scope_id_foreign FOREIGN KEY (scope_id) REFERENCES oauth_scopes(id) ON DELETE CASCADE;


--
-- Name: oauth_session_scopes_session_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_session_scopes
    ADD CONSTRAINT oauth_session_scopes_session_id_foreign FOREIGN KEY (session_id) REFERENCES oauth_sessions(id) ON DELETE CASCADE;


--
-- Name: oauth_sessions_client_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_sessions
    ADD CONSTRAINT oauth_sessions_client_id_foreign FOREIGN KEY (client_id) REFERENCES oauth_clients(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: passengers_client_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY passengers
    ADD CONSTRAINT passengers_client_id_foreign FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: roles_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_user_id_foreign FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: sessions_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_user_id_foreign FOREIGN KEY (user_id) REFERENCES users(id);


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


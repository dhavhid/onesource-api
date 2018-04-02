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
    updated_at timestamp(0) without time zone NOT NULL,
    deleted_at timestamp(0) without time zone
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
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cities (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    county_id integer NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


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
    doi character varying(80) NOT NULL,
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
    date_moved character varying(250),
    clinic_notes text,
    patient_treating smallint DEFAULT 1,
    next_appt timestamp without time zone,
    verified_with character varying(255),
    first_seen date,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    created_by integer,
    updated_by integer,
    insurance_notes character varying(250)
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
    updated_at timestamp(0) without time zone DEFAULT '2015-07-20 00:00:00'::timestamp without time zone NOT NULL,
    deleted_at timestamp(0) without time zone
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
    updated_at timestamp(0) without time zone DEFAULT '2015-07-21 00:00:00'::timestamp without time zone NOT NULL,
    deleted_at timestamp(0) without time zone
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
    "default" smallint DEFAULT (0)::smallint NOT NULL
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
    notes text,
    deleted_at timestamp(0) without time zone
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
    access_token character varying(40),
    checkin timestamp(0) without time zone
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
    is_admin smallint DEFAULT (0)::smallint NOT NULL,
    deleted_at timestamp(0) without time zone,
    expiration timestamp(0) without time zone
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
    clients.insurance_notes,
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
            WHEN (clinics.name IS NOT NULL) THEN concat(clinics.name, ', ', clinics.address1, ', ', clinics.city, ', ', clinics.zipcode)
            ELSE NULL::text
        END AS clinic_name,
    clinics.address1 AS clinic_address1,
    clinics.address2 AS clinic_address2,
    clinics.city AS clinic_city,
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

ALTER TABLE ONLY cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


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

COPY attorneys_doctors (id, name, phone, fax, email, is_attorney, requesting_office_id, created_at, updated_at, deleted_at) FROM stdin;
610	G. John Jansen	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
611	Lionel Giron	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
612	Rezai & Assc.	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
613	Gabriel Martinez	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
614	Jon M. Woods	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
615	Maricela Bermudez	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
616	Payman Zargari	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
617	Maxwell Agha	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
618	Kyle Nielsen	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
619	Nielsen & Assc.	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
620	Patrick Saboorian	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
621	Sean O'keefe	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
622	Steve K. Marks	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
623	Michael Holmes	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
624	Kampf Schiavone	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
625	Alexander Rosenburg	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
626	Jeffrey Geren	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
627	Jeff Klein	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
628	Ray Wang	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
629	Solimon & Rodgers	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
630	Vincent Quigg	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
631	William Green	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
632	Leyva & Night	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
633	Rose Klein	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
634	Ola Moore	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
635	Marc Grossman	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
636	Levy Ford	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
637	Arteaga & Garcia	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
638	Arteaga & Assc.	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
639	Julia Mac	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
640	Barkhordarian Law Firm	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
641	Ronald Canter	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
642	Barry Hinden	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
643	Bazan Huerta	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
644	Berger & Michelena	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
645	Bigonger Law	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
646	Chahine & Associates	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
647	Garret Law Group	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
648	Mitchell & Shea	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
649	Moses Luna	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
650	Rodriguez & King	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
651	Prussak Welch & Avila	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
652	Sarah Dini	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
653	Rawa Law Group	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
654	Ainbinder & Pratt	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
655	Glauber Berenson	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
656	Jarod Parker	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
657	Haleh Shekarchian	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
658	Williams Abrego & Associates	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
659	Oracle Law Firm	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
660	Dial & Associates	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
661	Paris Law Group	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
662	Ruth Prager	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
663	Sef Krell	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
664	Steven Sapera	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
665	Leo H. Hernandez	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
666	Miles & Hatcher	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
667	Cleveland & Metz	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
668	William Lindheim	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
669	Carlin & Buchsbaum	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
670	William Kropach	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
671	Silberman & Lam	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
672	Wilshire Law Center	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
673	Legacy Pro Law	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
674	Diefer Law Group	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
675	Miller & Chavez	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
676	Angel Carrazco Jr	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
677	Eric Levine	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
678	Goldschmid Silver & Spindel	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
679	Telleria Telleria & Levy LLP	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
680	Kaeni Law	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
681	Albert D'Antin & Associates	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
682	Pisegna & Zimmerman	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
683	Kiara Andino	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
684	Kamyar R. Shayan	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
685	Pacific Attorneys	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
686	Wilson Kyncl	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
687	Richard Sanedin	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
688	Dulio R. Chavez	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
689	Genaro Legorretta	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
690	Raphael Hedwat	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
691	Invictus Law	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
692	Spalding & Spalding	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
693	Bomberg  Benson & Garrett	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
694	William Cort	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
695	Brian W. Freeman	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
696	Peyman & Rahnama	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
697	Christopher J. Trodden	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
698	Bob Nehoray	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
699	William Vallegos	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
700	Martin von Mizener	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
701	Jones Legal	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
702	Christopher Rhodes	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
703	Westphal Law Group	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
704	Goldman Magdalin & Krikes LLP	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
705	Tamar A. Ekizian	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
706	Christopher Lauria	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
707	Lionel Ciro Sapetto	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
708	Brent Romney	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
709	Michael Yadegari	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
710	Napolin Law Firm	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
711	Farrah Maribel	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
712	Ton Law Center	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
713	Gary Merkle	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
714	Richard A. Fisher	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
715	Briles & Associates	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
716	Leigh Jacobs	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
717	London & Nguyen	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
718	Randy Higashi DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
719	Abel Quesada MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
720	Bruce DeCarlo MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
721	Hitendra Shah MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
722	Brent Pratley MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
723	Andrew Jarminski MD/PM	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
724	Negin Rameshni DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
725	Ziyad Alam DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
726	Steven Rigler DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
727	David Johnson MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
728	Cristian Santizo MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
729	Jalil Rashti MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
730	Zylna Granado DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
731	Edward Opoku MD/DO	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
732	Catalino Dureza MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
733	James Iwanoff DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
734	Malintze Gutierrez DO	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
735	Michael Schiffman MD/QME	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
736	Kambiz Nourian DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
737	Jose Candelario DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
738	Jack Akmakjian MD/ Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
739	Arthur Harris MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
740	Manuel Anel MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
741	Rita Starritt MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
742	Tracy Darling MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
743	Bryan Aun DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
744	John Korzelious MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
745	Robert Gogatz DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
746	Harout Balian MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
747	Evan Marlowe PMR	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
748	Max Matos MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
749	Curtis Montgomery DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
750	Phu La DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
751	Justin Long DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
752	Bobby Smith DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
753	Edward Mizabeghi MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
754	Roger Rhan DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
755	Chris Atamian DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
756	Carla Scheel DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
757	Samir Daher DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
758	Lawrence Domaracki DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
759	Wonil Yoon DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
760	Mayya Kravchenko DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
761	Eric Gofnung DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
762	Nathan Ford MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
763	Eric Jackson Scott DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
764	Christian Mendoza DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
765	Luigi Kirchman DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
766	Joel Gutierrez DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
767	James Caldero DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
768	Arman Ghods DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
769	Michael Barri DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
770	Lauren Hunter DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
771	Andrew Mooney DC/QME	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
772	Lawrence Miller MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
773	Naresh (Nick) Sharma MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
774	Shahab Mahboubian DO	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
775	Guy Gottschalk M.D	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
776	Sylvia De La Llana MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
777	William Bolling MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
778	Elmostafa  Elkhiar DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
779	Faribar Mobin DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
780	Tom Dabrowski MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
781	Jyrki Suutari DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
782	Galal Goubran MD/Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
783	Joseph Bahan DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
784	Johnny Aviles DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
785	Phong H. Tran MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
786	Robert MacArthur MD/Ortho Surgeon	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
787	James Reid MD/ Ortho Surgeon	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
788	George McClellan DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
789	Elias Murillo DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
790	Richard Mulvania Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
791	Martin Backman MD/Neuro	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
792	Gabriel Wade MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
793	Gary Weessies DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
794	Jose De La Llana MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
795	Antonio Manriquez DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
796	Nagasamundar S. Ashok MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
797	Angel De La Llana MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
798	Nikta Andalib DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
799	Domenic Signorelli DPM	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
800	Michael Price MD/ Ortho Surgeon	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
801	Spencer S. Prasarnsuk DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
802	Logan Osland DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
803	Nicholas Vanderhyde DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
804	Reza Moraffi DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
805	Michael Rudolph DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
806	Arash Yaghoobian MD /Ortho	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
807	Van Huy Vu MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
808	Saro Dorian MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
809	Dirk Kancilia DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
810	Richard Hart DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
811	Dat Le DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
812	Sierra Moulton DO	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
813	Daniel Oh DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
814	Jordan Rio DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
815	Tommy Chau DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
816	Ronald Kelly DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
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
7	Chest	2015-07-20 00:00:00	2015-08-05 23:48:17
60	Left Foot Toes	2015-08-05 23:54:21	2015-08-05 23:54:21
67	BACK	2015-10-09 13:08:55	2015-10-09 13:08:55
68	LOWER BACK	2015-10-09 13:09:09	2015-10-09 13:09:09
69	UPPER BACK	2015-10-09 13:09:25	2015-10-09 13:09:25
\.


--
-- Name: bodyparts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bodyparts_id_seq', 69, true);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cities (id, name, county_id, created_at, updated_at) FROM stdin;
1	Alameda	2	2015-10-05 19:49:24	2015-10-05 19:49:24
2	Albany	2	2015-10-05 19:49:24	2015-10-05 19:49:24
3	Berkeley	2	2015-10-05 19:49:24	2015-10-05 19:49:24
4	Dublin	2	2015-10-05 19:49:24	2015-10-05 19:49:24
5	Emeryville	2	2015-10-05 19:49:24	2015-10-05 19:49:24
6	Fremont	2	2015-10-05 19:49:24	2015-10-05 19:49:24
7	Hayward	2	2015-10-05 19:49:24	2015-10-05 19:49:24
8	Livermore	2	2015-10-05 19:49:24	2015-10-05 19:49:24
9	Newark	2	2015-10-05 19:49:24	2015-10-05 19:49:24
10	Oakland	2	2015-10-05 19:49:24	2015-10-05 19:49:24
11	Piedmont	2	2015-10-05 19:49:24	2015-10-05 19:49:24
12	Pleasanton	2	2015-10-05 19:49:24	2015-10-05 19:49:24
13	San Leandro	2	2015-10-05 19:49:24	2015-10-05 19:49:24
14	Union City	2	2015-10-05 19:49:24	2015-10-05 19:49:24
15	Alpine	3	2015-10-05 19:49:24	2015-10-05 19:49:24
16	Amador	4	2015-10-05 19:49:24	2015-10-05 19:49:24
17	Ione	4	2015-10-05 19:49:24	2015-10-05 19:49:24
18	Jackson	4	2015-10-05 19:49:24	2015-10-05 19:49:24
19	Plymouth	4	2015-10-05 19:49:24	2015-10-05 19:49:24
20	Sutter Creek	4	2015-10-05 19:49:24	2015-10-05 19:49:24
21	Biggs	5	2015-10-05 19:49:24	2015-10-05 19:49:24
22	Chico	5	2015-10-05 19:49:24	2015-10-05 19:49:24
23	Gridley	5	2015-10-05 19:49:24	2015-10-05 19:49:24
24	Oroville	5	2015-10-05 19:49:24	2015-10-05 19:49:24
25	Paradise	5	2015-10-05 19:49:24	2015-10-05 19:49:24
26	Angels Camp	6	2015-10-05 19:49:24	2015-10-05 19:49:24
27	Colusa	7	2015-10-05 19:49:24	2015-10-05 19:49:24
28	Williams	7	2015-10-05 19:49:24	2015-10-05 19:49:24
29	Antioch	8	2015-10-05 19:49:24	2015-10-05 19:49:24
30	Brentwood	8	2015-10-05 19:49:24	2015-10-05 19:49:24
31	Clayton	8	2015-10-05 19:49:24	2015-10-05 19:49:24
32	Concord	8	2015-10-05 19:49:24	2015-10-05 19:49:24
33	Danville	8	2015-10-05 19:49:24	2015-10-05 19:49:24
34	El Cerrito	8	2015-10-05 19:49:24	2015-10-05 19:49:24
35	Hercules	8	2015-10-05 19:49:24	2015-10-05 19:49:24
36	Lafayette	8	2015-10-05 19:49:24	2015-10-05 19:49:24
37	Martinez	8	2015-10-05 19:49:24	2015-10-05 19:49:24
38	Moraga	8	2015-10-05 19:49:24	2015-10-05 19:49:24
39	Oakley	8	2015-10-05 19:49:24	2015-10-05 19:49:24
40	Orinda	8	2015-10-05 19:49:24	2015-10-05 19:49:24
41	Pinole	8	2015-10-05 19:49:24	2015-10-05 19:49:24
42	Pittsburg	8	2015-10-05 19:49:24	2015-10-05 19:49:24
43	Pleasant Hill	8	2015-10-05 19:49:24	2015-10-05 19:49:24
44	Richmond	8	2015-10-05 19:49:24	2015-10-05 19:49:24
45	San Pablo	8	2015-10-05 19:49:24	2015-10-05 19:49:24
46	San Ramon	8	2015-10-05 19:49:24	2015-10-05 19:49:24
47	Walnut Creek	8	2015-10-05 19:49:24	2015-10-05 19:49:24
48	Crescent City	9	2015-10-05 19:49:24	2015-10-05 19:49:24
49	Placerville	10	2015-10-05 19:49:24	2015-10-05 19:49:24
50	South Lake Tahoe	10	2015-10-05 19:49:24	2015-10-05 19:49:24
51	Clovis	11	2015-10-05 19:49:24	2015-10-05 19:49:24
52	Coalinga	11	2015-10-05 19:49:24	2015-10-05 19:49:24
53	Firebaugh	11	2015-10-05 19:49:24	2015-10-05 19:49:24
54	Fowler	11	2015-10-05 19:49:24	2015-10-05 19:49:24
55	Fresno	11	2015-10-05 19:49:24	2015-10-05 19:49:24
56	Huron	11	2015-10-05 19:49:24	2015-10-05 19:49:24
57	Kerman	11	2015-10-05 19:49:24	2015-10-05 19:49:24
58	Kingsburg	11	2015-10-05 19:49:24	2015-10-05 19:49:24
59	Mendota	11	2015-10-05 19:49:24	2015-10-05 19:49:24
60	Orange Cove	11	2015-10-05 19:49:24	2015-10-05 19:49:24
61	Parlier	11	2015-10-05 19:49:24	2015-10-05 19:49:24
62	Reedley	11	2015-10-05 19:49:24	2015-10-05 19:49:24
63	Sanger	11	2015-10-05 19:49:24	2015-10-05 19:49:24
64	Selma	11	2015-10-05 19:49:24	2015-10-05 19:49:24
65	Orland	12	2015-10-05 19:49:24	2015-10-05 19:49:24
66	Willows	12	2015-10-05 19:49:24	2015-10-05 19:49:24
67	Arcata	13	2015-10-05 19:49:24	2015-10-05 19:49:24
68	Blue Lake	13	2015-10-05 19:49:24	2015-10-05 19:49:24
69	Eureka	13	2015-10-05 19:49:24	2015-10-05 19:49:24
70	Ferndale	13	2015-10-05 19:49:24	2015-10-05 19:49:24
71	Fortuna	13	2015-10-05 19:49:24	2015-10-05 19:49:24
72	Rio Dell	13	2015-10-05 19:49:24	2015-10-05 19:49:24
73	Trinidad	13	2015-10-05 19:49:24	2015-10-05 19:49:24
74	Brawley	14	2015-10-05 19:49:24	2015-10-05 19:49:24
75	Calexico	14	2015-10-05 19:49:24	2015-10-05 19:49:24
76	Calipatria	14	2015-10-05 19:49:24	2015-10-05 19:49:24
77	El Centro	14	2015-10-05 19:49:24	2015-10-05 19:49:24
78	Holtville	14	2015-10-05 19:49:24	2015-10-05 19:49:24
79	Imperial	14	2015-10-05 19:49:24	2015-10-05 19:49:24
80	Westmorland	14	2015-10-05 19:49:24	2015-10-05 19:49:24
81	Bishop	15	2015-10-05 19:49:24	2015-10-05 19:49:24
82	Arvin	16	2015-10-05 19:49:24	2015-10-05 19:49:24
83	Bakersfield	16	2015-10-05 19:49:24	2015-10-05 19:49:24
84	California City	16	2015-10-05 19:49:24	2015-10-05 19:49:24
85	Delano	16	2015-10-05 19:49:24	2015-10-05 19:49:24
86	Maricopa	16	2015-10-05 19:49:24	2015-10-05 19:49:24
87	Mcfarland	16	2015-10-05 19:49:24	2015-10-05 19:49:24
88	Ridgecrest	16	2015-10-05 19:49:24	2015-10-05 19:49:24
89	Shafter	16	2015-10-05 19:49:24	2015-10-05 19:49:24
90	Taft	16	2015-10-05 19:49:24	2015-10-05 19:49:24
91	Tehachapi	16	2015-10-05 19:49:24	2015-10-05 19:49:24
92	Wasco	16	2015-10-05 19:49:24	2015-10-05 19:49:24
93	Avenal	17	2015-10-05 19:49:24	2015-10-05 19:49:24
94	Corcoran	17	2015-10-05 19:49:24	2015-10-05 19:49:24
95	Hanford	17	2015-10-05 19:49:24	2015-10-05 19:49:24
96	Lemoore	17	2015-10-05 19:49:24	2015-10-05 19:49:24
97	Clearlake	18	2015-10-05 19:49:24	2015-10-05 19:49:24
98	Lakeport	18	2015-10-05 19:49:24	2015-10-05 19:49:24
99	Susanville	19	2015-10-05 19:49:24	2015-10-05 19:49:24
100	Agoura Hills	20	2015-10-05 19:49:24	2015-10-05 19:49:24
101	Alhambra	20	2015-10-05 19:49:24	2015-10-05 19:49:24
102	Arcadia	20	2015-10-05 19:49:24	2015-10-05 19:49:24
103	Artesia	20	2015-10-05 19:49:24	2015-10-05 19:49:24
104	Avalon	20	2015-10-05 19:49:24	2015-10-05 19:49:24
105	Azusa	20	2015-10-05 19:49:24	2015-10-05 19:49:24
106	Baldwin Park	20	2015-10-05 19:49:24	2015-10-05 19:49:24
107	Bell	20	2015-10-05 19:49:24	2015-10-05 19:49:24
108	Bellflower	20	2015-10-05 19:49:24	2015-10-05 19:49:24
109	Bell Gardens	20	2015-10-05 19:49:24	2015-10-05 19:49:24
110	Beverly Hills	20	2015-10-05 19:49:24	2015-10-05 19:49:24
111	Bradbury	20	2015-10-05 19:49:24	2015-10-05 19:49:24
112	Burbank	20	2015-10-05 19:49:24	2015-10-05 19:49:24
113	Calabasas	20	2015-10-05 19:49:24	2015-10-05 19:49:24
114	Carson	20	2015-10-05 19:49:24	2015-10-05 19:49:24
115	Cerritos	20	2015-10-05 19:49:24	2015-10-05 19:49:24
116	Claremont	20	2015-10-05 19:49:24	2015-10-05 19:49:24
117	Commerce	20	2015-10-05 19:49:24	2015-10-05 19:49:24
118	Compton	20	2015-10-05 19:49:24	2015-10-05 19:49:24
119	Covina	20	2015-10-05 19:49:24	2015-10-05 19:49:24
120	Cudahy	20	2015-10-05 19:49:24	2015-10-05 19:49:24
121	Culver City	20	2015-10-05 19:49:24	2015-10-05 19:49:24
122	Diamond Bar	20	2015-10-05 19:49:24	2015-10-05 19:49:24
123	Downey	20	2015-10-05 19:49:24	2015-10-05 19:49:24
124	Duarte	20	2015-10-05 19:49:24	2015-10-05 19:49:24
125	El Monte	20	2015-10-05 19:49:24	2015-10-05 19:49:24
126	El Segundo	20	2015-10-05 19:49:24	2015-10-05 19:49:24
127	Gardena	20	2015-10-05 19:49:24	2015-10-05 19:49:24
128	Glendale	20	2015-10-05 19:49:24	2015-10-05 19:49:24
129	Glendora	20	2015-10-05 19:49:24	2015-10-05 19:49:24
130	Hawaiian Gardens	20	2015-10-05 19:49:24	2015-10-05 19:49:24
131	Hawthorne	20	2015-10-05 19:49:24	2015-10-05 19:49:24
132	Hermosa Beach	20	2015-10-05 19:49:24	2015-10-05 19:49:24
133	Hidden Hills	20	2015-10-05 19:49:24	2015-10-05 19:49:24
134	Huntington Park	20	2015-10-05 19:49:24	2015-10-05 19:49:24
135	Industry	20	2015-10-05 19:49:24	2015-10-05 19:49:24
136	Inglewood	20	2015-10-05 19:49:24	2015-10-05 19:49:24
137	Irwindale	20	2015-10-05 19:49:24	2015-10-05 19:49:24
138	La Canada Flintridge	20	2015-10-05 19:49:24	2015-10-05 19:49:24
139	La Habra Heights	20	2015-10-05 19:49:24	2015-10-05 19:49:24
140	Lakewood	20	2015-10-05 19:49:24	2015-10-05 19:49:24
141	La Mirada	20	2015-10-05 19:49:24	2015-10-05 19:49:24
142	Lancaster	20	2015-10-05 19:49:24	2015-10-05 19:49:24
143	La Puente	20	2015-10-05 19:49:24	2015-10-05 19:49:24
144	La Verne	20	2015-10-05 19:49:24	2015-10-05 19:49:24
145	Lawndale	20	2015-10-05 19:49:24	2015-10-05 19:49:24
146	Lomita	20	2015-10-05 19:49:24	2015-10-05 19:49:24
147	Long Beach	20	2015-10-05 19:49:24	2015-10-05 19:49:24
148	Los Angeles	20	2015-10-05 19:49:24	2015-10-05 19:49:24
149	Lynwood	20	2015-10-05 19:49:24	2015-10-05 19:49:24
150	Malibu	20	2015-10-05 19:49:24	2015-10-05 19:49:24
151	Manhattan Beach	20	2015-10-05 19:49:24	2015-10-05 19:49:24
152	Maywood	20	2015-10-05 19:49:24	2015-10-05 19:49:24
153	Monrovia	20	2015-10-05 19:49:24	2015-10-05 19:49:24
154	Montebello	20	2015-10-05 19:49:24	2015-10-05 19:49:24
155	Monterey Park	20	2015-10-05 19:49:24	2015-10-05 19:49:24
156	Norwalk	20	2015-10-05 19:49:24	2015-10-05 19:49:24
157	Palmdale	20	2015-10-05 19:49:24	2015-10-05 19:49:24
158	Palos Verdes Estates	20	2015-10-05 19:49:24	2015-10-05 19:49:24
159	Paramount	20	2015-10-05 19:49:24	2015-10-05 19:49:24
160	Pasadena	20	2015-10-05 19:49:24	2015-10-05 19:49:24
161	Pico Rivera	20	2015-10-05 19:49:24	2015-10-05 19:49:24
162	Pomona	20	2015-10-05 19:49:24	2015-10-05 19:49:24
163	Rancho Palos Verdes	20	2015-10-05 19:49:24	2015-10-05 19:49:24
164	Redondo Beach	20	2015-10-05 19:49:24	2015-10-05 19:49:24
165	Rolling Hills	20	2015-10-05 19:49:24	2015-10-05 19:49:24
166	Rolling Hills Estates	20	2015-10-05 19:49:24	2015-10-05 19:49:24
167	Rosemead	20	2015-10-05 19:49:24	2015-10-05 19:49:24
168	San Dimas	20	2015-10-05 19:49:24	2015-10-05 19:49:24
169	San Fernando	20	2015-10-05 19:49:24	2015-10-05 19:49:24
170	San Gabriel	20	2015-10-05 19:49:24	2015-10-05 19:49:24
171	San Marino	20	2015-10-05 19:49:24	2015-10-05 19:49:24
172	Santa Clarita	20	2015-10-05 19:49:24	2015-10-05 19:49:24
173	Santa Fe Springs	20	2015-10-05 19:49:24	2015-10-05 19:49:24
174	Santa Monica	20	2015-10-05 19:49:24	2015-10-05 19:49:24
175	Sierra Madre	20	2015-10-05 19:49:24	2015-10-05 19:49:24
176	Signal Hill	20	2015-10-05 19:49:24	2015-10-05 19:49:24
177	South El Monte	20	2015-10-05 19:49:24	2015-10-05 19:49:24
178	South Gate	20	2015-10-05 19:49:24	2015-10-05 19:49:24
179	South Pasadena	20	2015-10-05 19:49:24	2015-10-05 19:49:24
180	Temple City	20	2015-10-05 19:49:24	2015-10-05 19:49:24
181	Torrance	20	2015-10-05 19:49:24	2015-10-05 19:49:24
182	Vernon	20	2015-10-05 19:49:24	2015-10-05 19:49:24
183	Walnut	20	2015-10-05 19:49:24	2015-10-05 19:49:24
184	West Covina	20	2015-10-05 19:49:24	2015-10-05 19:49:24
185	West Hollywood	20	2015-10-05 19:49:24	2015-10-05 19:49:24
186	Westlake Village	20	2015-10-05 19:49:24	2015-10-05 19:49:24
187	Whittier	20	2015-10-05 19:49:24	2015-10-05 19:49:24
188	Chowchilla	21	2015-10-05 19:49:24	2015-10-05 19:49:24
189	Madera	21	2015-10-05 19:49:24	2015-10-05 19:49:24
190	Belvedere	22	2015-10-05 19:49:24	2015-10-05 19:49:24
191	Corte Madera	22	2015-10-05 19:49:24	2015-10-05 19:49:24
192	Fairfax	22	2015-10-05 19:49:24	2015-10-05 19:49:24
193	Larkspur	22	2015-10-05 19:49:24	2015-10-05 19:49:24
194	Mill Valley	22	2015-10-05 19:49:24	2015-10-05 19:49:24
195	Novato	22	2015-10-05 19:49:24	2015-10-05 19:49:24
196	Ross	22	2015-10-05 19:49:24	2015-10-05 19:49:24
197	San Anselmo	22	2015-10-05 19:49:24	2015-10-05 19:49:24
198	San Rafael	22	2015-10-05 19:49:24	2015-10-05 19:49:24
199	Sausalito	22	2015-10-05 19:49:24	2015-10-05 19:49:24
200	Tiburon	22	2015-10-05 19:49:24	2015-10-05 19:49:24
201	No Cities	23	2015-10-05 19:49:24	2015-10-05 19:49:24
202	Fort Bragg	24	2015-10-05 19:49:24	2015-10-05 19:49:24
203	Point Arena	24	2015-10-05 19:49:24	2015-10-05 19:49:24
204	Ukiah	24	2015-10-05 19:49:24	2015-10-05 19:49:24
205	Willits	24	2015-10-05 19:49:24	2015-10-05 19:49:24
206	Atwater	25	2015-10-05 19:49:24	2015-10-05 19:49:24
207	Dos Palos	25	2015-10-05 19:49:24	2015-10-05 19:49:24
208	Gustine	25	2015-10-05 19:49:24	2015-10-05 19:49:24
209	Livingston	25	2015-10-05 19:49:24	2015-10-05 19:49:24
210	Los Banos	25	2015-10-05 19:49:24	2015-10-05 19:49:24
211	Merced	25	2015-10-05 19:49:24	2015-10-05 19:49:24
212	Alturas	26	2015-10-05 19:49:24	2015-10-05 19:49:24
213	Mammoth	27	2015-10-05 19:49:24	2015-10-05 19:49:24
214	Carmel-By-The-Sea	28	2015-10-05 19:49:24	2015-10-05 19:49:24
215	Del Rey Oaks	28	2015-10-05 19:49:24	2015-10-05 19:49:24
216	Gonzales	28	2015-10-05 19:49:24	2015-10-05 19:49:24
217	Greenfield	28	2015-10-05 19:49:24	2015-10-05 19:49:24
218	King City	28	2015-10-05 19:49:24	2015-10-05 19:49:24
219	Marina	28	2015-10-05 19:49:24	2015-10-05 19:49:24
220	Monterey	28	2015-10-05 19:49:24	2015-10-05 19:49:24
221	Pacific Grove	28	2015-10-05 19:49:24	2015-10-05 19:49:24
222	Salinas	28	2015-10-05 19:49:24	2015-10-05 19:49:24
223	Sand City	28	2015-10-05 19:49:24	2015-10-05 19:49:24
224	Seaside	28	2015-10-05 19:49:24	2015-10-05 19:49:24
225	Soledad	28	2015-10-05 19:49:24	2015-10-05 19:49:24
226	American Canyon	29	2015-10-05 19:49:24	2015-10-05 19:49:24
227	Calistoga	29	2015-10-05 19:49:24	2015-10-05 19:49:24
228	Napa	29	2015-10-05 19:49:24	2015-10-05 19:49:24
229	St Helena	29	2015-10-05 19:49:24	2015-10-05 19:49:24
230	Yountville	29	2015-10-05 19:49:24	2015-10-05 19:49:24
231	Grass Valley	30	2015-10-05 19:49:24	2015-10-05 19:49:24
232	Nevada City	30	2015-10-05 19:49:24	2015-10-05 19:49:24
233	Truckee	30	2015-10-05 19:49:24	2015-10-05 19:49:24
234	Aliso Viejo	31	2015-10-05 19:49:24	2015-10-05 19:49:24
235	Anaheim	31	2015-10-05 19:49:24	2015-10-05 19:49:24
236	Brea	31	2015-10-05 19:49:24	2015-10-05 19:49:24
237	Buena Park	31	2015-10-05 19:49:24	2015-10-05 19:49:24
238	Costa Mesa	31	2015-10-05 19:49:24	2015-10-05 19:49:24
239	Cypress	31	2015-10-05 19:49:24	2015-10-05 19:49:24
240	Dana Point	31	2015-10-05 19:49:24	2015-10-05 19:49:24
241	Fountain Valley	31	2015-10-05 19:49:24	2015-10-05 19:49:24
242	Fullerton	31	2015-10-05 19:49:24	2015-10-05 19:49:24
243	Garden Grove	31	2015-10-05 19:49:24	2015-10-05 19:49:24
244	Huntington Beach	31	2015-10-05 19:49:24	2015-10-05 19:49:24
245	Irvine	31	2015-10-05 19:49:24	2015-10-05 19:49:24
246	Laguna Beach	31	2015-10-05 19:49:24	2015-10-05 19:49:24
247	Laguna Hills	31	2015-10-05 19:49:24	2015-10-05 19:49:24
248	Laguna Niguel	31	2015-10-05 19:49:24	2015-10-05 19:49:24
249	Laguna Woods	31	2015-10-05 19:49:24	2015-10-05 19:49:24
250	La Habra	31	2015-10-05 19:49:24	2015-10-05 19:49:24
251	Lake Forest	31	2015-10-05 19:49:24	2015-10-05 19:49:24
252	La Palma	31	2015-10-05 19:49:24	2015-10-05 19:49:24
253	Los Alamitos	31	2015-10-05 19:49:24	2015-10-05 19:49:24
254	Mission Viejo	31	2015-10-05 19:49:24	2015-10-05 19:49:24
255	Newport Beach	31	2015-10-05 19:49:24	2015-10-05 19:49:24
256	Orange	31	2015-10-05 19:49:24	2015-10-05 19:49:24
257	Placentia	31	2015-10-05 19:49:24	2015-10-05 19:49:24
258	Rancho Santa Margarita	31	2015-10-05 19:49:24	2015-10-05 19:49:24
259	San Clemente	31	2015-10-05 19:49:24	2015-10-05 19:49:24
260	San Juan Capistrano	31	2015-10-05 19:49:24	2015-10-05 19:49:24
261	Santa Ana	31	2015-10-05 19:49:24	2015-10-05 19:49:24
262	Seal Beach	31	2015-10-05 19:49:24	2015-10-05 19:49:24
263	Stanton	31	2015-10-05 19:49:24	2015-10-05 19:49:24
264	Tustin	31	2015-10-05 19:49:24	2015-10-05 19:49:24
265	Villa Park	31	2015-10-05 19:49:24	2015-10-05 19:49:24
266	Westminster	31	2015-10-05 19:49:24	2015-10-05 19:49:24
267	Yorba Linda	31	2015-10-05 19:49:24	2015-10-05 19:49:24
268	Auburn	32	2015-10-05 19:49:24	2015-10-05 19:49:24
269	Colfax	32	2015-10-05 19:49:24	2015-10-05 19:49:24
270	Lincoln	32	2015-10-05 19:49:24	2015-10-05 19:49:24
271	Loomis	32	2015-10-05 19:49:24	2015-10-05 19:49:24
272	Rocklin	32	2015-10-05 19:49:24	2015-10-05 19:49:24
273	Roseville	32	2015-10-05 19:49:24	2015-10-05 19:49:24
274	Portola	33	2015-10-05 19:49:24	2015-10-05 19:49:24
275	Banning	34	2015-10-05 19:49:24	2015-10-05 19:49:24
276	Beaumont	34	2015-10-05 19:49:24	2015-10-05 19:49:24
277	Blythe	34	2015-10-05 19:49:24	2015-10-05 19:49:24
278	Calimesa	34	2015-10-05 19:49:24	2015-10-05 19:49:24
279	Canyon Lake	34	2015-10-05 19:49:24	2015-10-05 19:49:24
280	Cathedral City	34	2015-10-05 19:49:24	2015-10-05 19:49:24
281	Coachella	34	2015-10-05 19:49:24	2015-10-05 19:49:24
282	Corona	34	2015-10-05 19:49:24	2015-10-05 19:49:24
283	Desert Hot Springs	34	2015-10-05 19:49:24	2015-10-05 19:49:24
284	Eastvale	34	2015-10-05 19:49:24	2015-10-05 19:49:24
285	Hemet	34	2015-10-05 19:49:24	2015-10-05 19:49:24
286	Indian Wells	34	2015-10-05 19:49:24	2015-10-05 19:49:24
287	Indio	34	2015-10-05 19:49:24	2015-10-05 19:49:24
288	Jurupa Valley	34	2015-10-05 19:49:24	2015-10-05 19:49:24
289	Lake Elsinore	34	2015-10-05 19:49:24	2015-10-05 19:49:24
290	La Quinta	34	2015-10-05 19:49:24	2015-10-05 19:49:24
291	Menifee	34	2015-10-05 19:49:24	2015-10-05 19:49:24
292	Moreno Valley	34	2015-10-05 19:49:24	2015-10-05 19:49:24
293	Murrieta	34	2015-10-05 19:49:24	2015-10-05 19:49:24
294	Norco	34	2015-10-05 19:49:24	2015-10-05 19:49:24
295	Palm Desert	34	2015-10-05 19:49:24	2015-10-05 19:49:24
296	Palm Springs	34	2015-10-05 19:49:24	2015-10-05 19:49:24
297	Perris	34	2015-10-05 19:49:24	2015-10-05 19:49:24
298	Rancho Mirage	34	2015-10-05 19:49:25	2015-10-05 19:49:25
299	Riverside	34	2015-10-05 19:49:25	2015-10-05 19:49:25
300	San Jacinto	34	2015-10-05 19:49:25	2015-10-05 19:49:25
301	Temecula	34	2015-10-05 19:49:25	2015-10-05 19:49:25
302	Wildomar	34	2015-10-05 19:49:25	2015-10-05 19:49:25
303	Citrus Heights	35	2015-10-05 19:49:25	2015-10-05 19:49:25
304	Elk Grove	35	2015-10-05 19:49:25	2015-10-05 19:49:25
305	Folsom	35	2015-10-05 19:49:25	2015-10-05 19:49:25
306	Galt	35	2015-10-05 19:49:25	2015-10-05 19:49:25
307	Isleton	35	2015-10-05 19:49:25	2015-10-05 19:49:25
308	Rancho Cordova	35	2015-10-05 19:49:25	2015-10-05 19:49:25
309	Sacramento	35	2015-10-05 19:49:25	2015-10-05 19:49:25
310	Hollister	36	2015-10-05 19:49:25	2015-10-05 19:49:25
311	San Juan Bautista	36	2015-10-05 19:49:25	2015-10-05 19:49:25
312	Adelanto	37	2015-10-05 19:49:25	2015-10-05 19:49:25
313	Apple Valley	37	2015-10-05 19:49:25	2015-10-05 19:49:25
314	Barstow	37	2015-10-05 19:49:25	2015-10-05 19:49:25
315	Big Bear Lake	37	2015-10-05 19:49:25	2015-10-05 19:49:25
316	Chino	37	2015-10-05 19:49:25	2015-10-05 19:49:25
317	Chino Hills	37	2015-10-05 19:49:25	2015-10-05 19:49:25
318	Colton	37	2015-10-05 19:49:25	2015-10-05 19:49:25
319	Fontana	37	2015-10-05 19:49:25	2015-10-05 19:49:25
320	Grand Terrace	37	2015-10-05 19:49:25	2015-10-05 19:49:25
321	Hesperia	37	2015-10-05 19:49:25	2015-10-05 19:49:25
322	Highland	37	2015-10-05 19:49:25	2015-10-05 19:49:25
323	Loma Linda	37	2015-10-05 19:49:25	2015-10-05 19:49:25
324	Montclair	37	2015-10-05 19:49:25	2015-10-05 19:49:25
325	Needles	37	2015-10-05 19:49:25	2015-10-05 19:49:25
326	Ontario	37	2015-10-05 19:49:25	2015-10-05 19:49:25
327	Rancho Cucamonga	37	2015-10-05 19:49:25	2015-10-05 19:49:25
328	Redlands	37	2015-10-05 19:49:25	2015-10-05 19:49:25
329	Rialto	37	2015-10-05 19:49:25	2015-10-05 19:49:25
330	San Bernardino	37	2015-10-05 19:49:25	2015-10-05 19:49:25
331	Twentynine Palms	37	2015-10-05 19:49:25	2015-10-05 19:49:25
332	Upland	37	2015-10-05 19:49:25	2015-10-05 19:49:25
333	Victorville	37	2015-10-05 19:49:25	2015-10-05 19:49:25
334	Yucaipa	37	2015-10-05 19:49:25	2015-10-05 19:49:25
335	Yucca Valley	37	2015-10-05 19:49:25	2015-10-05 19:49:25
336	Carlsbad	38	2015-10-05 19:49:25	2015-10-05 19:49:25
337	Chula Vista	38	2015-10-05 19:49:25	2015-10-05 19:49:25
338	Coronado	38	2015-10-05 19:49:25	2015-10-05 19:49:25
339	Del Mar	38	2015-10-05 19:49:25	2015-10-05 19:49:25
340	El Cajon	38	2015-10-05 19:49:25	2015-10-05 19:49:25
341	Encinitas	38	2015-10-05 19:49:25	2015-10-05 19:49:25
342	Escondido	38	2015-10-05 19:49:25	2015-10-05 19:49:25
343	Imperial Beach	38	2015-10-05 19:49:25	2015-10-05 19:49:25
344	La Mesa	38	2015-10-05 19:49:25	2015-10-05 19:49:25
345	Lemon Grove	38	2015-10-05 19:49:25	2015-10-05 19:49:25
346	National City	38	2015-10-05 19:49:25	2015-10-05 19:49:25
347	Oceanside	38	2015-10-05 19:49:25	2015-10-05 19:49:25
348	Poway	38	2015-10-05 19:49:25	2015-10-05 19:49:25
349	San Diego	38	2015-10-05 19:49:25	2015-10-05 19:49:25
350	San Marcos	38	2015-10-05 19:49:25	2015-10-05 19:49:25
351	Santee	38	2015-10-05 19:49:25	2015-10-05 19:49:25
352	Solana Beach	38	2015-10-05 19:49:25	2015-10-05 19:49:25
353	Vista	38	2015-10-05 19:49:25	2015-10-05 19:49:25
354	San Francisco	39	2015-10-05 19:49:25	2015-10-05 19:49:25
355	Escalon	40	2015-10-05 19:49:25	2015-10-05 19:49:25
356	Lathrop	40	2015-10-05 19:49:25	2015-10-05 19:49:25
357	Lodi	40	2015-10-05 19:49:25	2015-10-05 19:49:25
358	Manteca	40	2015-10-05 19:49:25	2015-10-05 19:49:25
359	Ripon	40	2015-10-05 19:49:25	2015-10-05 19:49:25
360	Stockton	40	2015-10-05 19:49:25	2015-10-05 19:49:25
361	Tracy	40	2015-10-05 19:49:25	2015-10-05 19:49:25
362	Arroyo Grande	41	2015-10-05 19:49:25	2015-10-05 19:49:25
363	Atascadero	41	2015-10-05 19:49:25	2015-10-05 19:49:25
364	El Paso De Robles	41	2015-10-05 19:49:25	2015-10-05 19:49:25
365	Grover Beach	41	2015-10-05 19:49:25	2015-10-05 19:49:25
366	Morro Bay	41	2015-10-05 19:49:25	2015-10-05 19:49:25
367	Pismo Beach	41	2015-10-05 19:49:25	2015-10-05 19:49:25
368	San Luis Obispo	41	2015-10-05 19:49:25	2015-10-05 19:49:25
369	Atherton	42	2015-10-05 19:49:25	2015-10-05 19:49:25
370	Belmont	42	2015-10-05 19:49:25	2015-10-05 19:49:25
371	Brisbane	42	2015-10-05 19:49:25	2015-10-05 19:49:25
372	Burlingame	42	2015-10-05 19:49:25	2015-10-05 19:49:25
373	Colma	42	2015-10-05 19:49:25	2015-10-05 19:49:25
374	Daly City	42	2015-10-05 19:49:25	2015-10-05 19:49:25
375	East Palo Alto	42	2015-10-05 19:49:25	2015-10-05 19:49:25
376	Foster City	42	2015-10-05 19:49:25	2015-10-05 19:49:25
377	Half Moon Bay	42	2015-10-05 19:49:25	2015-10-05 19:49:25
378	Hillsborough	42	2015-10-05 19:49:25	2015-10-05 19:49:25
379	Menlo Park	42	2015-10-05 19:49:25	2015-10-05 19:49:25
380	Millbrae	42	2015-10-05 19:49:25	2015-10-05 19:49:25
381	Pacifica	42	2015-10-05 19:49:25	2015-10-05 19:49:25
382	Portola Valley	42	2015-10-05 19:49:25	2015-10-05 19:49:25
383	Redwood City	42	2015-10-05 19:49:25	2015-10-05 19:49:25
384	San Bruno	42	2015-10-05 19:49:25	2015-10-05 19:49:25
385	San Carlos	42	2015-10-05 19:49:25	2015-10-05 19:49:25
386	San Mateo	42	2015-10-05 19:49:25	2015-10-05 19:49:25
387	South San Francisco	42	2015-10-05 19:49:25	2015-10-05 19:49:25
388	Woodside	42	2015-10-05 19:49:25	2015-10-05 19:49:25
389	Buellton	43	2015-10-05 19:49:25	2015-10-05 19:49:25
390	Carpinteria	43	2015-10-05 19:49:25	2015-10-05 19:49:25
391	Goleta	43	2015-10-05 19:49:25	2015-10-05 19:49:25
392	Guadalupe	43	2015-10-05 19:49:25	2015-10-05 19:49:25
393	Lompoc	43	2015-10-05 19:49:25	2015-10-05 19:49:25
394	Santa Barbara	43	2015-10-05 19:49:25	2015-10-05 19:49:25
395	Santa Maria	43	2015-10-05 19:49:25	2015-10-05 19:49:25
396	Solvang	43	2015-10-05 19:49:25	2015-10-05 19:49:25
397	Campbell	44	2015-10-05 19:49:25	2015-10-05 19:49:25
398	Cupertino	44	2015-10-05 19:49:25	2015-10-05 19:49:25
399	Gilroy	44	2015-10-05 19:49:25	2015-10-05 19:49:25
400	Los Altos	44	2015-10-05 19:49:25	2015-10-05 19:49:25
401	Los Altos Hills	44	2015-10-05 19:49:25	2015-10-05 19:49:25
402	Los Gatos	44	2015-10-05 19:49:25	2015-10-05 19:49:25
403	Milpitas	44	2015-10-05 19:49:25	2015-10-05 19:49:25
404	Monte Sereno	44	2015-10-05 19:49:25	2015-10-05 19:49:25
405	Morgan Hill	44	2015-10-05 19:49:25	2015-10-05 19:49:25
406	Mountain View	44	2015-10-05 19:49:25	2015-10-05 19:49:25
407	Palo Alto	44	2015-10-05 19:49:25	2015-10-05 19:49:25
408	San Jose	44	2015-10-05 19:49:25	2015-10-05 19:49:25
409	Santa Clara	44	2015-10-05 19:49:25	2015-10-05 19:49:25
410	Saratoga	44	2015-10-05 19:49:25	2015-10-05 19:49:25
411	Sunnyvale	44	2015-10-05 19:49:25	2015-10-05 19:49:25
412	Capitola	45	2015-10-05 19:49:25	2015-10-05 19:49:25
413	Santa Cruz	45	2015-10-05 19:49:25	2015-10-05 19:49:25
414	Scotts Valley	45	2015-10-05 19:49:25	2015-10-05 19:49:25
415	Watsonville	45	2015-10-05 19:49:25	2015-10-05 19:49:25
416	Anderson	46	2015-10-05 19:49:25	2015-10-05 19:49:25
417	Redding	46	2015-10-05 19:49:25	2015-10-05 19:49:25
418	Shasta Lake	46	2015-10-05 19:49:25	2015-10-05 19:49:25
419	Loyalton	47	2015-10-05 19:49:25	2015-10-05 19:49:25
420	Dorris	48	2015-10-05 19:49:25	2015-10-05 19:49:25
421	Dunsmuir	48	2015-10-05 19:49:25	2015-10-05 19:49:25
422	Etna	48	2015-10-05 19:49:25	2015-10-05 19:49:25
423	Fort Jones	48	2015-10-05 19:49:25	2015-10-05 19:49:25
424	Montague	48	2015-10-05 19:49:25	2015-10-05 19:49:25
425	Mount Shasta	48	2015-10-05 19:49:25	2015-10-05 19:49:25
426	Tulelake	48	2015-10-05 19:49:25	2015-10-05 19:49:25
427	Weed	48	2015-10-05 19:49:25	2015-10-05 19:49:25
428	Yreka	48	2015-10-05 19:49:25	2015-10-05 19:49:25
429	Benicia	49	2015-10-05 19:49:25	2015-10-05 19:49:25
430	Dixon	49	2015-10-05 19:49:25	2015-10-05 19:49:25
431	Fairfield	49	2015-10-05 19:49:25	2015-10-05 19:49:25
432	Rio Vista	49	2015-10-05 19:49:25	2015-10-05 19:49:25
433	Suisun City	49	2015-10-05 19:49:25	2015-10-05 19:49:25
434	Vacaville	49	2015-10-05 19:49:25	2015-10-05 19:49:25
435	Vallejo	49	2015-10-05 19:49:25	2015-10-05 19:49:25
436	Cloverdale	50	2015-10-05 19:49:25	2015-10-05 19:49:25
437	Cotati	50	2015-10-05 19:49:25	2015-10-05 19:49:25
438	Healdsburg	50	2015-10-05 19:49:25	2015-10-05 19:49:25
439	Petaluma	50	2015-10-05 19:49:25	2015-10-05 19:49:25
440	Rohnert Park	50	2015-10-05 19:49:25	2015-10-05 19:49:25
441	Santa Rosa	50	2015-10-05 19:49:25	2015-10-05 19:49:25
442	Sebastopol	50	2015-10-05 19:49:25	2015-10-05 19:49:25
443	Sonoma 	50	2015-10-05 19:49:25	2015-10-05 19:49:25
444	Windsor	50	2015-10-05 19:49:25	2015-10-05 19:49:25
445	Ceres	51	2015-10-05 19:49:25	2015-10-05 19:49:25
446	Hughson	51	2015-10-05 19:49:25	2015-10-05 19:49:25
447	Modesto	51	2015-10-05 19:49:25	2015-10-05 19:49:25
448	Newman	51	2015-10-05 19:49:25	2015-10-05 19:49:25
449	Oakdale	51	2015-10-05 19:49:25	2015-10-05 19:49:25
450	Patterson	51	2015-10-05 19:49:25	2015-10-05 19:49:25
451	Riverbank	51	2015-10-05 19:49:25	2015-10-05 19:49:25
452	Turlock	51	2015-10-05 19:49:25	2015-10-05 19:49:25
453	Waterford	51	2015-10-05 19:49:25	2015-10-05 19:49:25
454	Live Oak	52	2015-10-05 19:49:25	2015-10-05 19:49:25
455	Yuba City	52	2015-10-05 19:49:25	2015-10-05 19:49:25
456	Corning	54	2015-10-05 19:49:25	2015-10-05 19:49:25
457	Red Bluff	54	2015-10-05 19:49:25	2015-10-05 19:49:25
458	Tehama	54	2015-10-05 19:49:25	2015-10-05 19:49:25
459	No Cities	55	2015-10-05 19:49:25	2015-10-05 19:49:25
460	Dinuba	56	2015-10-05 19:49:25	2015-10-05 19:49:25
461	Exeter	56	2015-10-05 19:49:25	2015-10-05 19:49:25
462	Farmersville	56	2015-10-05 19:49:25	2015-10-05 19:49:25
463	Lindsay	56	2015-10-05 19:49:25	2015-10-05 19:49:25
464	Porterville	56	2015-10-05 19:49:25	2015-10-05 19:49:25
465	Tulare 	56	2015-10-05 19:49:25	2015-10-05 19:49:25
466	Visalia	56	2015-10-05 19:49:25	2015-10-05 19:49:25
467	Woodlake	56	2015-10-05 19:49:25	2015-10-05 19:49:25
468	Sonora	57	2015-10-05 19:49:25	2015-10-05 19:49:25
469	Camarillo	58	2015-10-05 19:49:25	2015-10-05 19:49:25
470	Fillmore	58	2015-10-05 19:49:25	2015-10-05 19:49:25
471	Moorpark	58	2015-10-05 19:49:25	2015-10-05 19:49:25
472	Ojai	58	2015-10-05 19:49:25	2015-10-05 19:49:25
473	Oxnard	58	2015-10-05 19:49:25	2015-10-05 19:49:25
474	Port Hueneme	58	2015-10-05 19:49:25	2015-10-05 19:49:25
475	San Buenaventura	58	2015-10-05 19:49:25	2015-10-05 19:49:25
476	Santa Paula	58	2015-10-05 19:49:25	2015-10-05 19:49:25
477	Simi Valley	58	2015-10-05 19:49:25	2015-10-05 19:49:25
478	Thousand Oaks	58	2015-10-05 19:49:25	2015-10-05 19:49:25
479	Ventura	58	2015-10-05 19:49:25	2015-10-05 19:49:25
480	Davis	59	2015-10-05 19:49:25	2015-10-05 19:49:25
481	West Sacramento	59	2015-10-05 19:49:25	2015-10-05 19:49:25
482	Winters	59	2015-10-05 19:49:25	2015-10-05 19:49:25
483	Woodland	59	2015-10-05 19:49:25	2015-10-05 19:49:25
484	Marysville	60	2015-10-05 19:49:25	2015-10-05 19:49:25
485	Wheatland	60	2015-10-05 19:49:25	2015-10-05 19:49:25
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cities_id_seq', 485, true);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clients (id, date_of_referral, date_received, case_type, firstname, lastname, dob, ssn, phone, phone_ext, alt_phone, address, address1, address2, city, region_id, zipcode, doi, body_parts, other_ibp, insurance_company_id, is_doctor_mpn, employer_name, referral_source_id, attorney_id, attorney_notes, clinic_id, doctor_id, scheduled_with, appt_date, appt_confirmed_id, appt_reason_cancel_id, date_moved, clinic_notes, patient_treating, next_appt, verified_with, first_seen, created_at, updated_at, created_by, updated_by, insurance_notes) FROM stdin;
6178	2015-10-09	2015-10-09	Workers Compensation	Fidela	Mercado	1972-02-24	755-28-0168	(619) 452-9635	\N	\N	3727 Sunset Lane Apt. 8	\N	\N	San Diego	38	92173	2015-01-14	Middle finger	CT 07-18-2014 to 07-18-2015                 Head, both shoulders, both arms, back, both feet, both hands, fingers, both kneesm chest, both eyes	1306	1	Select Staffing	1176	612	San Ysidro/RB @ 1.15 miles\nSD/LH @ 17.02 miles\n\nPt. requested to be scheduled in San ysidro the last appt. in the afternoon.	1163	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	2015-10-09 12:51:33	2015-10-09 12:51:33	618	618	\N
6172	2015-10-09	2015-10-09	Workers Compensation	Jose	Paulino	1968-10-11	614-88-9064	(818) 585-0748	\N	\N	4315 Lennox Blvd Apt# 16	\N	\N	Inglewood	20	91405	2014-12-12	R /hand	right thumb	1182	1	Southwest Offset Printing	1174	612	\N	1087	757	Ariana	2015-10-20 09:00:00	\N	\N	\N	\N	1	\N	\N	\N	2015-10-09 11:51:27	2015-10-09 11:57:50	614	614	\N
6176	2015-10-09	2015-10-09	Workers Compensation	Kenny RaV Jr.	Fuller	1988-08-19	\N	(661) 944-7731	\N	\N	43361 gadsen avenue apt 429 lancaster ca 93534	\N	\N	Lancaster	20	93534	2014-08-13	neck	Lower back, B. eyes.	\N	1	Securitas Security Services USA, Inc.	1176	612	Clinic Options:\nPalmdale/Nikta @ 12.50 miles\nVan Nuys/Noble Quest @ 56.99 miles\n\nPer pt: Palmdale / morning appt monday or tuesday	1151	798	Noemy	2015-10-13 09:00:00	2	\N	\N	\N	1	\N	\N	\N	2015-10-09 12:43:28	2015-10-09 12:51:49	621	621	\N
6175	2015-10-09	2015-10-09	Workers Compensation	Tzaac	Lage	1995-04-20	604-82-2753	(760) 693-0393	\N	(760) 791-1882	221 smilax road #204	\N	\N	Vista	38	92083	2015-10-07	L /arm,R /arm,R /wrist	\N	\N	1	Panda Express	1176	612	Rancho Bernardo/RB @ 20.00 miles\nMurrieta/Gogatz @ 30.73 miles	1161	\N	\N	\N	\N	9	2015-10-09 13:40:00	\N	1	\N	\N	\N	2015-10-09 12:42:25	2015-10-09 12:44:54	620	620	\N
6179	2015-10-09	2015-10-09	Workers Compensation	Salvador	Alcantar	1966-11-04	\N	(661) 927-4197	\N	(559) 427-6066	1032 E. Ellsworth Ave	\N	\N	Dinuba	56	93256	2015-10-09	head,L /shoulder,R /shoulder,L /hand,R /hand,R /knee,L /knee,neck,BACK,R /foot,L /foot	\N	\N	1	Sunview Vineyards Of California, Inc	\N	612	Opciones de clinicas:\nBMG Bakersfield @ 50.17 Millas\nNikta Palmdale @ 141.21 Millas\nEl cliente prefiere BMG , y la cita la quiere 2:00PM\nEnvie documentos a clinicas para cita	1159	\N	\N	\N	\N	37	2015-10-09 09:00:00	\N	1	\N	\N	\N	2015-10-09 13:41:52	2015-10-09 13:41:52	616	616	\N
6174	2015-10-09	2015-10-09	Workers Compensation	Jesus	Trinidad	1982-08-24	632-97-0123	(323) 849-5779	\N	\N	5080 G Street	\N	\N	Chino	37	91710	2014-06-14	Left Hand	\N	1226	1	Fuji Merchandise Corp	1174	612	Options provided to the L/O: Riverside / Southland Spine – 20.2 miles \nSouth El Monte / Gutierrez Chiropractic – 22.9 miles       Per Jesselin @ L/O schedule pt in Riverside @ Southland Spine. Pt has an In House Hx on 10-23-2015 @ 2:00 pm.	1121	\N	Brenda	2015-10-26 16:00:00	\N	\N	\N	\N	1	\N	\N	\N	2015-10-09 12:30:44	2015-10-09 14:15:45	614	614	\N
6180	2015-10-09	2015-10-09	Workers Compensation	Daniel	Martinez	1957-12-19	\N	(909) 782-0991	\N	\N	15885 San Bernardino Ave.	\N	\N	Fontana	37	92335	2015-10-09	L /shoulder,L /arm,L /hand,neck,BACK	\N	\N	1	Goodyear Rubber	1176	612	Opciones de clinicas:\nL.H - Fontana @ 1.68 Millas\nIndustrial S.B @ 12.17 Millas\nEnvie documentos a clinica y cita L/O	1086	\N	Jenny	2015-10-16 02:45:00	2	\N	\N	\N	1	\N	\N	\N	2015-10-09 14:29:27	2015-10-09 14:42:04	616	616	\N
6181	2015-10-09	2015-10-09	Workers Compensation	Esther aka Maria De Jesus	Escobar aka Gomez	1975-11-08	\N	(818) 310-7339	\N	\N	8654 Parthenia Place Apt.2	\N	\N	Norwalk	20	91343	2015-09-30	L /hand,fingers	Ct 10-05-2014 to 10-06-2015    Neck, spine,  lower back, right shoulder, right arm, right elbow, right hand, right elbow, right hand, fingers, vagina, belly button	1228	1	Excelline Line Food Products, LLC	1176	612	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	2015-10-09 15:07:24	2015-10-09 15:07:24	618	618	\N
6177	2015-10-09	2015-10-09	Workers Compensation	Alvarez AKA Ugarte	Marco AKA Armando	1970-12-29	911-71-7266	(323) 697-2064	\N	\N	7033  marbrisa avenue apto H	\N	\N	Huntington Park	20	90255	2015-10-08	R /leg,L /leg,L /knee,R /knee,toes	lower back, Both thighs.	\N	1	Core System Distribution	1174	612	Unable to reach pt at 5:12 pm .	\N	\N	\N	\N	\N	\N	\N		1	\N	\N	\N	2015-10-09 12:45:21	2015-10-09 16:12:42	622	622	\N
6182	2015-10-09	2015-10-09	Workers Compensation	Jose	Alvarado Torres	1976-07-17	\N	(562) 528-2204	\N	\N	927  Magnolia avenue  apto 4	\N	\N	Long Beach	20	90813	2014-09-28	L /arm,L /shoulder,L /forearm,L /wrist,L /elbow	\N	\N	1	Carlton Forge Workers	1174	612	\N	1093	\N	\N	\N	\N	9	2015-10-09 16:20:00	\N	1	\N	\N	\N	2015-10-09 15:14:16	2015-10-09 15:20:59	622	622	\N
6173	2015-10-09	2015-10-09	Personal Injury	Troy Anthony	Gonzalez	1978-03-14	545-55-7337	(909) 489-4403	\N	\N	9378 Felipe Ave	\N	\N	Montclair	37	91763	2015-09-26	neck	Lower and Upper Back	\N	1	\N	1174	612	\N	1121	814	Paola	2015-10-13 16:20:00	2	\N	\N	\N	1	\N	\N	\N	2015-10-09 11:54:36	2015-10-09 15:30:21	617	617	\N
6183	2015-10-09	2015-10-09	Workers Compensation	David Rene	Sanchez	1972-07-12	566-17-2317	(626) 399-9847	\N	\N	552 north eurrier street	\N	\N	Pomona	20	91768	2015-09-30	L /hand,R /hand,L /shoulder	lower back.	\N	1	24 Hour Personnel	1176	612	Clinic Options:\nMontclair/Balian @ 5.96 miles\nACS/Baldwin Park @ 11.56 miles\n\nUnable to reach pt. no answer.	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	2015-10-09 15:46:05	2015-10-09 15:46:05	621	621	\N
6184	2015-10-09	2015-10-09	Workers Compensation	Jose	Alvarado Torres	1976-07-17	\N	(562) 528-2204	\N	\N	927 Magnolia Ave. Apt. 4	\N	\N	Long Beach	20	90813	2015-10-09	L /arm,L /shoulder,L /forearm,L /wrist,L /elbow	\N	\N	1	Carlon Forge Workers	1176	612	Opciones de clinicas:\nACS L.B @ 1.75 Millas\nAun Downey@ 14.21 Millas\nDeje Mensaje\nDeje Mesaje	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	2015-10-09 15:57:45	2015-10-09 16:26:04	616	616	\N
6185	2015-10-09	2015-10-09	Personal Injury	Canuto	Campos	1980-03-14	\N	(714) 805-3745	\N	(714) 583-1663	1517 Van Ness	\N	\N	Santa Ana	31	92706	2015-10-02	neck	Lower Back	\N	1	\N	1174	612	\N	1072	\N	\N	\N	\N	9	\N	\N	\N	\N	\N	\N	2015-10-09 16:57:24	2015-10-09 20:37:58	617	615	\N
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clients_id_seq', 6185, true);


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
w0ewgzye7K2evLSlSIUuHfcSt5Lrqn8IT5WvRvCF	44	1444685246	2015-10-05 15:27:26	2015-10-05 15:27:26
7JkiGmhkD4o3fusqzNif6G3X3hDXbHRn2PltjZbs	45	1444685646	2015-10-05 15:34:06	2015-10-05 15:34:06
zsCMLM43JBxKzLaR5gAqKj0lNC3asdKGWzG8Cw7g	46	1444748736	2015-10-06 09:05:36	2015-10-06 09:05:36
ASOhNfCs4xmN5OkfAAdP8p1NPA91SdKbbJskOnAa	48	1444856688	2015-10-07 14:04:48	2015-10-07 14:04:48
eBgM9GlOffmG6KBIl3VnCSWXmFqVovO6SvfUpvbc	49	1444254015	2015-10-07 15:33:00	2015-10-07 15:33:00
BMOTAtBQ8JJ3iRa4ssptBnipianp8muuSfTRRNMo	50	1444254932	2015-10-07 15:40:22	2015-10-07 15:40:22
kjngvN8asvmel8SkItGqDyarlKqN5h8qJ8ufV4No	51	1444279837	2015-10-07 22:49:50	2015-10-07 22:49:50
Jz2yCqgNpkEjpeHJCITCc5GHsqTbLjAOyKWRA84i	62	1444930419	2015-10-08 10:33:39	2015-10-08 10:33:39
EdCMjwcgk3ZMu5s9h99HowCAy0XWTIUsTgzyMlkX	47	1444317630	2015-10-06 10:25:45	2015-10-06 10:25:45
8YSF2azwnBNQyKmuFUQxi5RiZ0uGs8ol0JCKpgKL	52	1444317924	2015-10-08 09:21:59	2015-10-08 09:21:59
df1LaPyhSmCFAzAayAk3k9D5sfPc7WiQllboOt0z	53	1444317959	2015-10-08 09:25:43	2015-10-08 09:25:43
Ic5A4FZ14WspRy46Q59CWVEuxbFPTHPlxAp6rkP9	54	1444317989	2015-10-08 09:26:23	2015-10-08 09:26:23
yYmNsQVS2G4gxIbVAOb2g9RbEmuR786N202iY590	55	1444318254	2015-10-08 09:26:53	2015-10-08 09:26:53
NxvRlSe65t9s7O808td3SANWeFaMfKGtbYdPqCiJ	56	1444318292	2015-10-08 09:31:12	2015-10-08 09:31:12
PPayp7ZJbJWHmNQuvkOALeiOPYX0KJ09xn5rU5ac	58	1444319065	2015-10-08 09:44:16	2015-10-08 09:44:16
TdbpKYkiTf4fXXgSlO0jkriTPODFZWnxfXYGpO7n	59	1444927487	2015-10-08 09:44:47	2015-10-08 09:44:47
kEvb1ZLd3t0vtqPlT7Z64yzR4SxOSlhGqbYjmN72	60	1444927845	2015-10-08 09:50:45	2015-10-08 09:50:45
N2wlpJgph4nmbfh1oNowuUKMRfR42YpJCjPEG4fj	57	1444321571	2015-10-08 09:32:41	2015-10-08 09:32:41
c5HGanxmiQz1nUIj0CsK33Xbh1DqGzxO0ZQP35kG	63	1444345759	2015-10-08 12:56:55	2015-10-08 12:56:55
l5a05SumPGov0upEEu22ZpsEZswgW5K5SmW9zbi6	64	1444954201	2015-10-08 17:10:01	2015-10-08 17:10:01
yutjPRPblUucyScZAkB3ln6M0E2MaZMcAPrUprZV	65	1444963866	2015-10-08 19:51:06	2015-10-08 19:51:06
7vC89FucaHGFw0d7uTxVufIiGlk6uFr0KvUWIsOE	66	1445011919	2015-10-09 09:11:59	2015-10-09 09:11:59
xkz5k8BRAHOar1bUsgxRCyrtDzbRNCAZMsXs7xn0	67	1445012944	2015-10-09 09:29:04	2015-10-09 09:29:04
uE2qDL2B2iOoN7yoagqwcWJrCuKo9CePi7dmtLuS	61	1444408776	2015-10-08 10:26:49	2015-10-08 10:26:49
qjttsb8ai96g7MMcjQw0PokY61hyEfPgkv0TjGjF	68	1444408796	2015-10-09 10:39:52	2015-10-09 10:39:52
sHGEbgf7H0krnQGT03miv4mdPp9PTecF9xD37O2w	69	1445017241	2015-10-09 10:40:41	2015-10-09 10:40:41
AXbTwEIxAR7LR1X3aRF012Zp5mtsNlIr4di5BKaP	72	1445017861	2015-10-09 10:51:01	2015-10-09 10:51:01
2bLT2AaCfd0e4yuWqcMP9eVtSHoVPGe2YJ9uAGS1	73	1444410599	2015-10-09 10:58:18	2015-10-09 10:58:18
UbhwDQBNHYnBFjhsrJS9OEbKvlmNfb0OU2QEAYvb	74	1444410610	2015-10-09 11:10:05	2015-10-09 11:10:05
6MhxwHG8sYIhjfGWwGT6t39ZzzEJeWB6hYaCDL8B	76	1445019057	2015-10-09 11:10:57	2015-10-09 11:10:57
UQYBzhbDU3oy9TLmgOS3RtdySnV4wnRFl7cGd83p	75	1444410704	2015-10-09 11:10:14	2015-10-09 11:10:14
P9gcsO1XtKAZTvzGmqYPSdxVbWcpJdhMNMd3R53b	77	1445019106	2015-10-09 11:11:46	2015-10-09 11:11:46
MrOgcuW2bNyUcCh4ypChz6TmsDYwzZwaE43EBYcY	78	1445019238	2015-10-09 11:13:58	2015-10-09 11:13:58
YemATWwI7eHUEXSe7BVJBD4xhc1zqYTY8CG0ChCR	79	1445019323	2015-10-09 11:15:23	2015-10-09 11:15:23
tIe5DXYNlujH8AhsSq03qdD3Fx8roWWtFBlxDZ7t	80	1444411976	2015-10-09 11:24:13	2015-10-09 11:24:13
xSnQcZ5vauke43zzAm7rZikx4iRDIxmvlsJN925B	71	1444435053	2015-10-09 10:43:13	2015-10-09 10:43:13
5r6fzuqxWire354jjTOM3WApDEkcmccJFv8jvO2U	81	1444411987	2015-10-09 11:33:04	2015-10-09 11:33:04
t2z1kSCYIqu3rgsb2kmsguprKlDxtGucpTB99HTq	82	1444412002	2015-10-09 11:33:12	2015-10-09 11:33:12
ZFre2Jy9hfyqVbBn7fDcUwf7qDcnIPit9bTSJsX4	83	1445020405	2015-10-09 11:33:25	2015-10-09 11:33:25
88iQHfZQP2zy753VCLCWgKLu9IShCC5PGh2ueBcE	84	1445020413	2015-10-09 11:33:33	2015-10-09 11:33:33
Jd1Iinqy0a99e5v9eEnblDydRAE1FTgMhD4mMdFz	85	1445020765	2015-10-09 11:39:25	2015-10-09 11:39:25
ppme9An4Uu74BsJAA8T8UuJpQaPn5RD3AmAuRPNg	70	1444418340	2015-10-09 10:41:34	2015-10-09 10:41:34
rFYGmxRGVJFiOFTvLC0dhwxcjwm13XuhFgLxkEcR	86	1444420415	2015-10-09 13:19:53	2015-10-09 13:19:53
4inrxDHxO1TBtIq2NN0scBWQsTfgFnFgno1LDPqw	87	1445028830	2015-10-09 13:53:50	2015-10-09 13:53:50
joOPBRdK4VqJPVQJGE29FkoOqz0icCo3FP5DtYOb	88	1445029015	2015-10-09 13:56:55	2015-10-09 13:56:55
tLimqYDjARDFx5dhGz6WO4SIY7mPAKxKZhx9xDVN	89	1445035895	2015-10-09 15:51:35	2015-10-09 15:51:35
a65FQtJLJDpFen1siuzlHhrFT26XiQ3jqObF1Uvz	90	1445042730	2015-10-09 17:45:30	2015-10-09 17:45:30
1ofOGrvyH7gREeK0vtOGkFe33uyMOcyXnFFhWOa5	91	1445053059	2015-10-09 20:37:39	2015-10-09 20:37:39
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
44	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-10-05 15:27:26	2015-10-05 15:27:26
45	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-10-05 15:34:06	2015-10-05 15:34:06
46	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-10-06 09:05:36	2015-10-06 09:05:36
47	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-10-06 10:25:45	2015-10-06 10:25:45
48	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-10-07 14:04:48	2015-10-07 14:04:48
49	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-07 15:33:00	2015-10-07 15:33:00
50	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-07 15:40:22	2015-10-07 15:40:22
51	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-07 22:49:50	2015-10-07 22:49:50
52	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-08 09:21:59	2015-10-08 09:21:59
53	11D0DDFEAEFE5AE6D38C3A88F471552E	user	617	\N	2015-10-08 09:25:43	2015-10-08 09:25:43
54	11D0DDFEAEFE5AE6D38C3A88F471552E	user	617	\N	2015-10-08 09:26:23	2015-10-08 09:26:23
55	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-08 09:26:53	2015-10-08 09:26:53
56	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-08 09:31:12	2015-10-08 09:31:12
57	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-08 09:32:41	2015-10-08 09:32:41
58	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-08 09:44:16	2015-10-08 09:44:16
59	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-08 09:44:47	2015-10-08 09:44:47
60	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-08 09:50:45	2015-10-08 09:50:45
61	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-08 10:26:48	2015-10-08 10:26:48
62	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-10-08 10:33:39	2015-10-08 10:33:39
63	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-10-08 12:56:55	2015-10-08 12:56:55
64	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-10-08 17:10:01	2015-10-08 17:10:01
65	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-10-08 19:51:06	2015-10-08 19:51:06
66	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-09 09:11:59	2015-10-09 09:11:59
67	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-09 09:29:04	2015-10-09 09:29:04
68	11D0DDFEAEFE5AE6D38C3A88F471552E	user	616	\N	2015-10-09 10:39:52	2015-10-09 10:39:52
69	11D0DDFEAEFE5AE6D38C3A88F471552E	user	614	\N	2015-10-09 10:40:41	2015-10-09 10:40:41
70	11D0DDFEAEFE5AE6D38C3A88F471552E	user	616	\N	2015-10-09 10:41:34	2015-10-09 10:41:34
71	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-09 10:43:13	2015-10-09 10:43:13
72	11D0DDFEAEFE5AE6D38C3A88F471552E	user	618	\N	2015-10-09 10:51:01	2015-10-09 10:51:01
73	11D0DDFEAEFE5AE6D38C3A88F471552E	user	617	\N	2015-10-09 10:58:18	2015-10-09 10:58:18
74	11D0DDFEAEFE5AE6D38C3A88F471552E	user	617	\N	2015-10-09 11:10:05	2015-10-09 11:10:05
75	11D0DDFEAEFE5AE6D38C3A88F471552E	user	617	\N	2015-10-09 11:10:14	2015-10-09 11:10:14
76	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-10-09 11:10:57	2015-10-09 11:10:57
77	11D0DDFEAEFE5AE6D38C3A88F471552E	user	617	\N	2015-10-09 11:11:46	2015-10-09 11:11:46
78	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-10-09 11:13:58	2015-10-09 11:13:58
79	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-09 11:15:23	2015-10-09 11:15:23
80	11D0DDFEAEFE5AE6D38C3A88F471552E	user	620	\N	2015-10-09 11:24:13	2015-10-09 11:24:13
81	11D0DDFEAEFE5AE6D38C3A88F471552E	user	620	\N	2015-10-09 11:33:04	2015-10-09 11:33:04
82	11D0DDFEAEFE5AE6D38C3A88F471552E	user	620	\N	2015-10-09 11:33:12	2015-10-09 11:33:12
83	11D0DDFEAEFE5AE6D38C3A88F471552E	user	620	\N	2015-10-09 11:33:25	2015-10-09 11:33:25
84	11D0DDFEAEFE5AE6D38C3A88F471552E	user	620	\N	2015-10-09 11:33:33	2015-10-09 11:33:33
85	11D0DDFEAEFE5AE6D38C3A88F471552E	user	621	\N	2015-10-09 11:39:25	2015-10-09 11:39:25
86	11D0DDFEAEFE5AE6D38C3A88F471552E	user	616	\N	2015-10-09 13:19:53	2015-10-09 13:19:53
87	11D0DDFEAEFE5AE6D38C3A88F471552E	user	616	\N	2015-10-09 13:53:50	2015-10-09 13:53:50
88	11D0DDFEAEFE5AE6D38C3A88F471552E	user	614	\N	2015-10-09 13:56:55	2015-10-09 13:56:55
89	11D0DDFEAEFE5AE6D38C3A88F471552E	user	617	\N	2015-10-09 15:51:35	2015-10-09 15:51:35
90	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-09 17:45:30	2015-10-09 17:45:30
91	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-09 20:37:39	2015-10-09 20:37:39
\.


--
-- Name: oauth_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth_sessions_id_seq', 91, true);


--
-- Data for Name: passengers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY passengers (id, name, dob, phone, phone_ext, address, ibp, appt_date, client_id, created_at, updated_at) FROM stdin;
6229	Gabriela Cortez	1984-09-11	(909) 354-1293	\N	9378 Felipe Ave Montclair CA 91763	Neck, Headaches	2015-10-13 22:20:00	6173	2015-10-09 15:21:33	2015-10-09 15:30:21
\.


--
-- Name: passengers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('passengers_id_seq', 6229, true);


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: reasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reasons (id, name, is_confirmation, created_at, updated_at, deleted_at) FROM stdin;
1	Conf by L/O	1	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
2	Conf w/pt	1	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
3	Left Detailed Message	1	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
4	Mailed Letter	1	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
5	TXT Message	1	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
6	Unable to Contact	1	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
7	Wrong Number	1	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
12	5. Hold - Existing pt w/clinic	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
14	7. Cx'd - No Dr. on MPN	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
15	8. Cx'd - No Dr. in area	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
16	9. Cx'd - Client settled case	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
17	10. Cx'd - Atty dropped case	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
18	11. Cx'd - Client settled case/dropped case	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
20	13. Cx'd - No Chiro/Ortho body parts	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
21	14. Cx'd - Dr. rejected case	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
22	15. Cx'd - Client sent to another clinic	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
23	16. Cx'd - Client stayed w/current PTP	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
24	17. Cx'd - Pending Atty response	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
25	18. Cx'd - Clinic pending medical records/paperwork	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
26	19. Cx'd - Client out of State	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
27	20. Cx'd - Client incarcerated	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
28	21. Cx'd - Clinic does not accept WC insurance	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
29	22. Cx'd - Client having SX	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
30	23. Cx'd - Client pregnant	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
31	24. Cx'd - Client subbed out Atty	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
32	25. Cx'd - Atty sent to MPN Dr.	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
33	26. Cx'd - Client completed all treatment	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
34	27. Cx'd - Client Deceased	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
35	28. Cx'd - No contact w/client per Atty	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
36	29. Cx'd - No working phone number	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
37	30. Cx'd - Referral sent in error	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
39	Confirmed by the Dr. himself	1	2015-07-21 19:19:48	2015-07-21 19:19:48	\N
19	12. Cx'd - Missed all appt's	0	2015-07-20 00:00:00	2015-07-20 00:00:00	\N
8	1. Hold - No show / Need Atty Status	0	2015-07-20 00:00:00	2015-10-09 17:53:42	2015-10-09 17:53:42
9	2. Hold - Pending appt from clinic	0	2015-07-20 00:00:00	2015-10-09 17:53:42	2015-10-09 17:53:42
10	3. Hold - Pending Atty response	0	2015-07-20 00:00:00	2015-10-09 17:53:42	2015-10-09 17:53:42
11	4. Hold - Missed all appt's	0	2015-07-20 00:00:00	2015-10-09 17:53:42	2015-10-09 17:53:42
13	6. Hold - Need working phone number	0	2015-07-20 00:00:00	2015-10-09 17:53:42	2015-10-09 17:53:42
\.


--
-- Name: reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reasons_id_seq', 43, true);


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY regions (id, name, abbr, created_at, updated_at, deleted_at) FROM stdin;
30	Nevada	NV	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
3	Alpine	AK	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
2	Alameda	AL	2015-07-21 00:00:00	2015-07-21 23:13:35	\N
4	Amador	AZ	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
5	Butte	AR	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
6	Calaveras	CA	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
7	Colusa	CO	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
8	Contra Costa	CT	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
9	Del Norte	DE	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
10	El Dorado	DC	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
11	Fresno	FL	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
12	Glenn	GA	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
13	Humboldt	HI	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
14	Imperial	ID	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
15	Inyo	IL	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
16	Kern	IN	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
17	Kings	IA	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
18	Lake	KS	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
19	Lassen	KY	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
20	Los Angeles	LA	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
21	Madera	ME	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
22	Marin	MD	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
23	Mariposa	MA	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
24	Mendocino	MI	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
25	Merced	MN	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
26	Modoc	MS	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
27	Mono	MO	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
28	Monterey	MT	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
29	Napa	NE	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
31	Orange	NH	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
32	Placer	NJ	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
33	Plumas	NM	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
34	Riverside	NY	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
35	Sacramento	NC	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
36	San Benito	ND	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
37	San Bernardino	OH	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
38	San Diego	OK	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
39	San Francisco	OR	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
40	San Joaquin	PA	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
41	San Luis Obispo	RI	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
42	San Mateo	SC	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
43	Santa Barbara	SD	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
44	Santa Clara	TN	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
45	Santa Cruz	TX	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
46	Shasta	UT	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
47	Sierra	VT	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
48	Siskiyou	VA	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
49	Solano	WA	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
50	Sonoma	WV	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
51	Stanislaus	WI	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
52	Sutter	WY	2015-07-21 00:00:00	2015-07-21 00:00:00	\N
54	Tehama	OC	2015-08-06 00:21:08	2015-08-06 00:21:08	\N
55	Trinity	TR	2015-09-01 23:24:06	2015-09-01 23:24:09	\N
56	Tulare	TU	2015-09-01 23:24:43	2015-09-01 23:24:50	\N
57	Tuolumne	TO	2015-09-01 23:25:18	2015-09-01 23:25:23	\N
58	Ventura	VE	2015-09-01 23:25:45	2015-09-01 23:25:47	\N
59	Yolo	YO	2015-09-01 23:26:06	2015-09-01 23:26:13	\N
60	Yuba	YU	2015-09-01 23:26:31	2015-09-01 23:26:33	\N
\.


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('regions_id_seq', 60, true);


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reports (id, created_at, updated_at, name, options, access, owner, "default") FROM stdin;
9	2015-09-29 13:17:50	2015-09-29 14:45:19	Cases From This Month	{"name": "Cases From This Month", "sort": [{"field": "clinic_name", "order": "sort_group_low_high", "value": ""}], "type": "table", "access": [], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Record ID#", "value": "id"}, {"text": "First Name", "value": "firstname"}, {"text": "Last Name", "value": "lastname"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "Last Updated By", "value": "updatedBy"}], "filters": [{"field": "date_of_referral", "value": "1969-12-31", "condition": "is_this_month"}], "allow_edit": true, "allow_view": true, "share_type": "0", "v1/reports": "", "description": "Cases recorded this month", "filter_match": "AND", "show_summary": true, "v1/reports/9": "", "description_on_report_page": true}	{607,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,603,608,604,610,609}	605	0
8	2015-09-29 13:03:29	2015-09-29 15:15:09	Appointments From Yesterday	{"name": "Appointments From Yesterday", "sort": [], "type": "table", "access": [], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Record ID#", "value": "id"}, {"text": "First Name", "value": "firstname"}, {"text": "Last Name", "value": "lastname"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "Last Updated By", "value": "updatedBy"}], "filters": [{"field": "appt_date", "value": 7, "condition": "is_days_past"}], "allow_edit": true, "allow_view": true, "share_type": "0", "v1/reports": "", "description": "Appointments scheduled to yesterday", "filter_match": "AND", "v1/reports/8": "", "description_on_report_page": true}	{607,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,603,608,604,610,609}	605	0
10	2015-09-29 15:04:11	2015-10-03 22:53:36	Latests added	{"name": "Latests added", "sort": [{"field": "clinic_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Record ID#", "value": "id"}, {"text": "First Name", "value": "firstname"}, {"text": "Last Name", "value": "lastname"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "Last Updated By", "value": "updatedBy"}], "filters": [{"field": "date_of_referral", "value": "2014-01-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2014-06-30", "condition": "before_on"}], "allow_edit": false, "allow_view": false, "share_type": "0", "v1/reports": "", "filter_match": "AND", "show_summary": true, "v1/reports/10": ""}	{607,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,603,608,604,610,609}	605	0
7	2015-09-29 08:33:32	2015-10-09 21:53:59	Cases Recently Added	{"name": "Cases Recently Added", "sort": [], "type": "table", "access": [], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Record ID#", "value": "id"}, {"text": "First Name", "value": "firstname"}, {"text": "Last Name", "value": "lastname"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "Last Updated By", "value": "updatedBy"}], "filters": [{"field": "date_of_referral", "value": "2015-08-01", "condition": "on_after"}], "allow_edit": true, "allow_view": true, "share_type": "0", "v1/reports": "", "description": "Default Report", "filter_match": "AND", "v1/reports/7": "", "default_report": true, "description_on_report_page": true}	{620,622,618,605,623,611,617,613,616,612,614,621}	615	1
\.


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reports_id_seq', 10, true);


--
-- Data for Name: requesting_offices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY requesting_offices (id, name, address1, address2, city, zipcode, phone, fax, contact, email, alt_phone, is_lawoffice, created_at, updated_at, is_insurance, is_clinic, link, username, pass, county, insurance_url, insurance_login, insurance_pass, notes, deleted_at) FROM stdin;
1165	Screening Sign Up	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1166	Bell Medical Solutions	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1167	DSJ	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1168	Your Doctor Connection	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1170	Law Office of Lionel Giron	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1171	Law Offices of Gabriel Martinez	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1173	Law Office of Maricela Bermudez	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1176	Other	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1177	Impressive	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1180	AIMS	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1181	Acclaim Risk Management	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1184	Applied Underwriters	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1185	Argonaut Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1190	Capistrano USD	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1194	CNA Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1195	Companion P&C	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1196	CompWest Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1198	County of Los Angeles	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1199	City of Los Angeles	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1200	Disney	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1201	Disney World Wide Services	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1202	Disneyland Resort	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1203	Disneyland	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1205	Employers Direct	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1211	Golden Eagle Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1214	Hartford Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1216	Insurance Company of the West (ICW)	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1218	Interplan	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1220	Kroger Co.	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1226	Mitsui Sumitomo Marine	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1219	Keenan & Associates	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:37:55	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.keenan.com">http://www.keenan.com</a><br></span></p></td><td><p><span style="font-family: Arial;">Username: special&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Password: access<br></span></p></td></tr></tbody></table><p><br></p>	\N
1228	Pacific Comp	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 21:34:18	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.pacificcomp.com/InjuredWorkers/MedicalProviderNetwork.aspx">http://www.pacificcomp.com/InjuredWorkers/MedicalProviderNetwork.aspx</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on PCIC on the Job MPN, then click on Search by Provider Name or Tax ID<br></span></p></td></tr></tbody></table><p><br></p>	\N
1189	Broadspire	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 23:44:29	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td>Employer<br></td><td>Link<br></td><td>Notes<br></td></tr><tr><td><br></td><td><p><a target="_blank" href="https://www.viiad.com/broadspire/public/app/compass/provider_search_main.asp">https://www.viiad.com/broadspire/public/app/compass/provider_search_main.asp</a><br></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1183	Alaska National Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-06 00:05:20	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td>Employed<br></td><td>Link<br></td><td>Notes<br></td></tr><tr><td><br></td><td><p><a target="_blank" href="http://www.corvel.com/ppo-lookup/">http://www.corvel.com/ppo-lookup/</a><br></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1210	Gallagher Bassett	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-06 13:22:02	1	0	\N	\N	\N	\N	\N	\N	\N	<p>\n\n\n\n\t\n\t\n\t\n\t\n\t<style type="text/css"><!-- \n\t\tbody,div,table,thead,tbody,tfoot,tr,th,td,p { font-family:"Calibri"; font-size:x-small }\n\t\t -->\n\t</style>\n\t\n\n\n\n<br></p><table style="width: 1008px; height: 1682px;" border="0" cellspacing="0">\n\t<colgroup width="346"></colgroup>\n\t<colgroup width="424"></colgroup>\n\t<colgroup width="237"></colgroup>\n\t<tbody><tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><b><font color="#000000" size="3"><span style="font-size: 12px;">Employer</span></font></b></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><b><font color="#000000" size="3">Link</font></b></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><b><font color="#000000" size="3">Notes</font></b></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Whole Foods Market</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/cvty/gbmpn">http://www.talispoint.com/cvty/gbmpn</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="60" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Trademark Construction</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Client Login &amp; Tools         First Health                      Client ID: gbmpn   Channeling Tools</font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Ols Hotels &amp; Resorts DBA Chamberlain W.</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/cvty/gbmpn">htpp://www.talispoint.com/cvty/gbmpn</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="60" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">United Airlines</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Client Login &amp; Tools         First Health                       Client ID: gbmpn Channeling Tools</font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="60" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Sodexo</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Client Login &amp; Tools         First Health                         User ID: gbmpn    Channeling Tools</font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">St Jude Medical</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/cvty/gbmpn">htpp://www.talispoint.com/cvty/gbmpn</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Raamco Motors, Inc DBA Toyota of Torrance</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">NO MPN LINK</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Cheesecake Factory</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/cvty/gbkoj">htpp://www.talispoint.com/cvty/gbkoj</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">CitiStaff Solutions</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/cvty/gbfhmpnselect">htpp://www.talispoint.com/cvty/gbfhmpnselect</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="80" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Burlington Coat Factory</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.firsthealth.com/">htpp://www.firsthealth.com</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Click on "Clients" Tab     Click on Locate a Provider, then click on "Locate a First Health Network Provider Now"</font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Sygma</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/cvty/gbmpn">htpp://www.talispoint.com/cvty/gbmpn</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Molina Healthcare</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/cvty/gbmpn">htpp://www.talispoint.com/cvty/gbmpn</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Qualified Mobile</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><u><font color="#0000FF" size="3"><a target="_blank" href="http://www.talispoint.com/cvty/gbmpn">http://www.talispoint.com/cvty/gbmpn</a></font></u></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Care Meridian</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/cvty/gbctympn">htpp://www.talispoint.com/cvty/gbctympn</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="60" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Lamps Plus</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><u><font color="#0000FF" size="3"><a target="_blank" href="http://www.coventrywcs.com/client-tools/index.htm.">http://www.coventrywcs.com/client-tools/index.htm.</a></font></u></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Client Login &amp; Tools        First Health                      Client ID: SELECT   Channeling Tools</font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="39" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Penske</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com/client-tools/index.htm">http://www.coventrywcs.com/client-tools/index.htm</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">First Health                       Client ID: gbmpn</font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="37" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">WNA Comet Comet West Inc</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/cvty/gbmpn">htpp://www.talispoint.com/cvty/gbmpn</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="39" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Little Company of Mary Hospital</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/">htpp://www.talispoint.com</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">User ID: phs               Password: health</font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="80" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Volt</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com/client-tools/index.htm">htpp://www.coventrywcs.com/client-tools/index.htm</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Client Login &amp; Tools        First Health                           Client ID: GBMPN       Channeling Tools</font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="80" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">O'Reily Auto Parts</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Client Login &amp; Tools        First Health                           Client ID: GBMPN       Channeling Tools</font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="80" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Kentucky Fried Chicken</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Client Login &amp; Tools        First Health                           Client ID: GBMPN       Channeling Tools</font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="80" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Taco Bell</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.firsthealth.com/">htpp://www.firsthealth.com</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Click on "Clients" Tab     Click on Locate a Provider, then click on "Locate a First Health Network Provider Now"</font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="60" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">BJ's Restaurant Inc</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com/client-tools/index.htm">htpp://www.coventrywcs.com/client-tools/index.htm</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Client Login: First Health Client ID: GBMPN              Click on Channeling Tools</font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Riverstone Resdiential Group</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><u><font color="#0000FF" size="3"><a target="_blank" href="https://www.talispoint.com/firsthealth/?AE=997291691&amp;CAID=WCALL&nbsp;">https://www.talispoint.com/firsthealth/?AE=997291691&amp;CAID=WCALL&nbsp;</a></font></u></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">AutoZone, Inc</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><u><font color="#0000FF" size="3"><a target="_blank" href="https://www.talispoint.com/firsthealth/?AE=997291691&amp;CAID=WCALL&nbsp;">https://www.talispoint.com/firsthealth/?AE=997291691&amp;CAID=WCALL&nbsp;</a></font></u></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="60" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Bertolini</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><u><font color="#0000FF" size="3"><a target="_blank" href="http://www.coventrywcs.com/client-tools/index.htm">http://www.coventrywcs.com/client-tools/index.htm</a></font></u></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">First Health                      Client ID: Select             Channeling Tools</font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Dish Network</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><u><font color="#0000FF" size="3"><a target="_blank" href="https://www.talispoint.com/firsthealth/?AE=997291691&amp;CAID=WCALL&nbsp;">https://www.talispoint.com/firsthealth/?AE=997291691&amp;CAID=WCALL&nbsp;</a></font></u></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">TCI Tire Center</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><u><font color="#0000FF" size="3"><a target="_blank" href="http://www.talispoint.com/cvty/gbfhmpnselect">www.talispoint.com/cvty/gbfhmpnselect</a></font></u></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Premier Residential Services</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><u><font color="#0000FF" size="3"><a target="_blank" href="https://www.talispoint.com/firsthealth/?AE=997373505&amp;CAID=GBMPN">https://www.talispoint.com/firsthealth/?AE=997373505&amp;CAID=GBMPN</a></font></u></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="60" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Ulta Salon Cosmetics &amp; Fragrance</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Client Login &amp; Tools            First Health                        Client ID: gbmcs</font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Classic Tents</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><u><font color="#0000FF" size="3"><a target="_blank" href="http://www.talispoint.com/cvty/gbmpn">http://www.talispoint.com/cvty/gbmpn</a></font></u></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Taisei TK Joint Venture</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/cvty/gbmpn">htpp://www.talispoint.com/cvty/gbmpn</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Angelica Textile Services Inc</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><u><font color="#0000FF" size="3"><a target="_blank" href="http://www.talispoint.com/cvty/gbcvtympn">http://www.talispoint.com/cvty/gbcvtympn</a></font></u></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n\t<tr>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" height="22" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3">Ashley Distribution</font></span></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/cvty/gbmpn">htpp://www.talispoint.com/cvty/gbmpn</a></span></p></td>\n\t\t<td style="border-top: 1px solid #808080; border-bottom: 1px solid #808080; border-left: 1px solid #808080; border-right: 1px solid #808080" align="left" valign="bottom"><span style="font-family: Arial;"><font color="#000000" size="3"><br></font></span></td>\n\t</tr>\n</tbody></table><p>\n\n\n\n<br></p>	\N
1174	Law Offices of Rezai & Associates	2601 Main Street, Suite 150, Irvine, Ca 92614	\N	Irvine	92614	(949) 752-7227	(949) 752-7733	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-06 17:08:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1169	Law Offices of G. John Jansen	2114 N. Broadway Boulevard, Santa Ana, Ca 92706	\N	Santa Ana	92706	(714) 560-1647	(714) 617-7002	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-06 17:14:20	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1175	The Nielsen Firm	3250 Wilshire Blvd, Suite 1510, Los Angeles, Ca 90010	\N	Los Angeles	90010	(213) 386-1111	(213) 386-2594	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-06 17:29:20	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1172	Law Offices of Jon M. Woods	3250 E. Willow Street, Signal, Ca 90755	\N	Signal Hill	90755	(562) 426-3244	(562) 426-2712	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-06 18:08:08	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1229	Pasadena USD	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1234	State Comp Ins. Fund (SCIF)	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1235	Seabright Brightcure Network	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1236	Seabright CA Broadbased Network	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1237	Sears Holdings	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1241	So Cal Edison	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1242	Specialty Risk Services (SRS)	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1245	Wellcomp	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1251	Republic Underwriters	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1254	Tri Star Claims Administration	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1256	HDI - Gerling America Insurance Company	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1259	Enstar US Orange Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1260	Federal Insurance Company	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1261	Crum & Forster	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1265	Safety National Casualty	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1266	New Hampshire Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1267	State Farm	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1268	Markel Insurance Services	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1269	Chartis	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1270	Allmerica Financial Benefit Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1271	Uninsured Employers Benefit Trust Fund	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1273	Commerce & Industry Insurance Company	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1274	Guide One Mutual	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1275	ACME Administrators	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1276	Allied	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1277	Alpha Fund	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1279	Acclamation Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1280	Southland Claims	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1281	Macy's Corporate Services Risk Management Dept.	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1282	Employers Preferred	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1283	Security National Ins.	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1284	Bunch & Associates	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1285	County of Kern Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1286	Hazelrigg Claims Management Services	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1287	QBE Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1288	Star Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1289	Trinity Insure Services	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1290	Illinois Midwest	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1272	Athens Administrators	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 19:48:20	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><br></td><td><p><a target="_blank" href="http://www.talispoint.com/medex/athens">http://www.talispoint.com/medex/athens</a><br></p></td><td><p><span style="font-family: Arial;">Click on "Search by Name" </span><br><br></p></td></tr></tbody></table><p><br></p>	\N
1252	Carl Warren	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:08:36	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;">Employer<br></span></td><td><span style="font-weight: bold;">Link<br></span></td><td><span style="font-weight: bold;">Notes<br></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/medex/external">http://www.talispoint.com/medex/external</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1239	Sedgwick CMS	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-06 09:34:25	1	0	\N	\N	\N	\N	\N	\N	\N		\N
1257	CCMSI	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 23:17:08	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com">http://www.coventrywcs.com</a><br></span></p></td><td><p><span style="font-family: Arial;">Client Login &amp; Tools&nbsp;&nbsp;&nbsp;&nbsp; Focus: sedgwickcampn<br></span></p></td></tr></tbody></table>	\N
1291	HR Comp	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1292	Packard Claims Administration Inc	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1293	Employers Assurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1295	County of San Bernardino	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1296	State of California Department of Industrial Relations	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1297	New York Marine & General Ins.	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1069	First Line Health	330 S. Garfield Ave	Suite 228	Alhambra	91801	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:47	2015-10-05 01:24:47	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1070	Rudolph Multi Specialty Group	10399 Lemon Avenue	Suite 105 Alta Loma	Los Angeles	91737	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:47	2015-10-05 01:24:47	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1071	First Line Health	212 S. Grand Avenue	Santa Ana	Orange	92701	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:47	2015-10-05 01:24:47	0	1	\N	\N	\N	Orange	\N	\N	\N	\N	\N
1072	So Cal Chiros	2390 E. Orangewood Avenue	Suite 400 Anaheim	Anaheim	92806	(714) 808-9666	(714) 808-1666	N/A	\N	\N	0	2015-10-05 01:24:47	2015-10-05 01:24:47	0	1	\N	\N	\N	Orange	\N	\N	\N	\N	\N
1073	So Cal Chiros	11525 Brookshire Avenue	Suite 202	Downey	90241	(714) 808-9666	(714) 808-1666	N/A	\N	\N	0	2015-10-05 01:24:47	2015-10-05 01:24:47	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1074	Greenfield Integrated	11920 Ramona		El Monte	91732	(626) 448-5501	(626) 448-5502	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1075	MedNation	2920 F Street	Suite C-5	Bakersfield	93301	(818) 697-6190	(888) 391-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Kern	\N	\N	\N	\N	\N
1076	First Line Health	2920 "F" Street	Suite 15	Bakersfield	93301	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Kern	\N	\N	\N	\N	\N
1077	Advance Care	4025 Maine St.		Baldwin Park	91706	(800) 850-2693	(866) 273-1775	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1078	Rise Wellness Center	5030 Bonita Rd.	Suite B Bonita	Los Angeles	91902	(619) 479-7473	(619) 479-9376	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1079	Crosby Square Chiro	420 Heffernan Ave	Suite B-1	Calexico	92231	(619) 238-0096	(619) 232-7046	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Imperial	\N	\N	\N	\N	\N
1080	First Line Health	420 Heffernan Ave	Suite B-1	Calexico	92231	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Imperial	\N	\N	\N	\N	\N
1081	Southland Spine	1520 Nutmeg Place	Suite 110	Costa Mesa	92626	(714) 751-8110	(714) 751-5098	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Orange	\N	\N	\N	\N	\N
1082	Dr. Jalil Rashti	16661 Ventura Blvd	Suite 701 Encino	Los Angeles	91436	(818) 386-1823	(818) 907-0255	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1083	Crosby Square Chiro	240 S. Hickory St.	Suite 106	Escondido	92025	(619) 238-0096	(619) 232-7046	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	\N
1084	First Line Health	240 S. Hickory	Suite 106	Escondido	92025	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	\N
1085	MedNation	5339 North Fresno	Suite 105	Fresno	93710	(818) 697-6190	(888) 391-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Fresno	\N	\N	\N	\N	\N
1086	Lighthouse Medical Mgt	8832 Sierra Ave. Fontana		Fontana	92335	(909) 854-4900	(909) 854-4224	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1087	Glendale Urgency Chiropractic Clinic	319 South Brand Blvd.		Glendale	91204	(818) 901-0388	(818) 507-0126	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1088	Rudolph Multi Specialty Group.	10918 Hesperia Road	Suite B	Hesperia	92345	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1089	Lighthouse Medical Mgt	6011 Pacific Blvd.	Suite 123	Huntington Park	90255	(909) 854-4224	(909) 565-4406	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1090	First Line Health	6522 Pacific Blvd.		Huntington Park	90255	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1091	Rudolph Multi Specialty Group	81557 Doctor Carreon Blvd	Suite B5 Indio	Indio	92201	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	\N
1092	First Line Health	44075 Jackson Street	Suite C	Indio	92201	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	\N
1093	Advance Care	2690 Pacific Avenue	#255	Long Beach	90806	(800) 850-2693	(866) 273-1775	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1094	Willow Medical Group	3311 E. Willow St.		Long Beach	90806	(562) 424-4976	(562) 424-5960	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1095	First Line Health	4300 Long Beach Blvd	Suite 170	Long Beach	90807	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1096	MedNation	4201 Long Beach Blvd.	Suite 430	Long Beach	90807	(818) 697-6190	(888) 391-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1097	MedNation	3580 Wilshire Blvd.	Suite 100	Los Angeles	90010	(818) 697-6190	(888) 391-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1099	Dr. Jalil Rashti	3800 East Cesar Chavez Ave		Los Angeles	90063	(818) 386-1823	(818) 907-0255	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1100	SCOP	8610 South Sepulveda Blvd.	Suite 109	Los Angeles	90045	(310) 337-3700	(310) 337-1643	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1101	First Line Health	3303 Wilshire Blvd	Suite 1225	Los Angeles	90010	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1102	Harout Balian	MD 4950 San Bernardino Street	Suite 102	Montclair	91763	(909) 624-5277		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1098	Atlantis Health Management	3800 E. Cesar Chavez E. Ave		Los Angeles	90063	(323) 264-6296	(323) 395-5782	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-07 15:33:37	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1103	Gogatz Chiropractic Ctr	40485 Murrieta Hot Springs Rd	Ste. B7 Murrieta	Murrieta	92563	(951) 698-4050	(951) 698-4057	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	\N
1104	Rudolph Multi Specialty Group	5900 Shattuck Avenue	Suite 201	Oakland	94601	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Alameda	\N	\N	\N	\N	\N
1105	Rise Wellness Center	3231 Waring Court	Suite N	Oceanside	92056	(619) 794-2099	(619) 362-9616	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	\N
1106	Cedar Medical Group	235 N. Laurel Ave.		Ontario	91762	(909) 988-2554	(909) 988-2584	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1107	First Line Health	3602 Inland Empire Blvd	Suite 120 Building B	Ontario	91764	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1108	MedNation	1555 West 5th Street	Suite 270	Oxnard	93003	(818) 697-6190	(888) 391-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Ventura	\N	\N	\N	\N	\N
1109	C.O.R. Medical Grp	1405 W. Rancho Vista Blvd.		Palmdale	93551	(661) 274-8725	(661) 274-8205	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1110	First Line Health	1645 E. Palmdale Blvd.	Suite D	Palmdale	93550	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1111	Advance Care	14624 Sherman Way	Suite 404 Van Nuys	Los Angeles	91405	(800) 850-2693	(866) 273-1775	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1112	Gutierrez Chiropractic	8445 S. Rosemead Blvd.		Pico Rivera	90660	(562) 861-1600	(562) 861-1717	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1113	Rudolph Multi Specialty Group	8337 Telegraph Road	Suite 214	Pico Rivera	90660	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1114	First Line Health	10832 Laurel St.	Suite 206	Rancho Cucamonga	91730	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1115	MedNation	7012 Reseda Blvd	Suite A2 Reseda	Los Angeles	91335	(818) 697-6190	(888) 391-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1116	Spine & Orthopedic Center	7300 Magnolia Avenue		Riverside	92504	(951) 710-1030	(951) 710-1040	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	\N
1117	Advance Care	4121 10th Street		Riverside	92501	(800) 850-2693	(866) 273-1775	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	\N
1118	Rudolph Multi Specialty Group	5870 Arlington Ave.	Suite 101	Riverside	92504	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	\N
1119	Keystone Health Grp	4843 Arlington Ave.		Riverside	92504	(951) 682-4404	(951) 682-4406	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	\N
1120	Montgomery Chiropractic	3404 Arlington Ave		Riverside	92506	(951) 782-8369	(951) 782-8378	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	\N
1121	Southland Spine	4354 Latham Street	Suite 100	Riverside	92501	(714) 751-8110	(714) 751-5098	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	\N
1122	SCOP	4240 Tequesquite Avenue		Riverside	92601	(310) 337-3700	(310) 337-1643	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	\N
1123	First Line Health	1881 S. Commerce Center Dr. E.	Suite 112	San Bernardino	92408	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1124	First Line Health	165 W. Hospitality Lane	Suite 20	San Bernardino	92408	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1125	Montgomery Chiropractic	155 W. Hospitality Lane	Suite 175	San Bernardino	92408	(909) 890-2226	(909) 890-9638	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1126	Rudolph Multi Specialty Group	435 W. Orange Show Lane	Suite 104	San Bernardino	92408	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1127	Spine & Orthopedic Center	236 W. Orange Show Rd	Suite 114	San Bernardino	92408	(951) 710-1030	(951) 710-1040	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1128	Lighthouse Medical Mgt	3645 El Cajon Blvd.		San Diego	92104	(909) 854-4224	(909) 565-4406	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	\N
1129	Advance Care	7581 Mission Center Ct	Suite 205	San Diego	92108	(800) 850-2693	(866) 273-1775	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	\N
1130	Rise Wellness Center	2710 Adams Ave		San Diego	92116	(619) 794-2099	(619) 362-9616	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	\N
1131	Crosby Square Chiro	1885 National Ave.		San Diego	92113	(619) 238-0096	(619) 232-7046	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	\N
1132	First Line Health	1885 National Avenue		San Diego	92113	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	\N
1133	Rudolph Multi Specialty Group	2360 Mckee Road	Suite 9	San Jose	95116	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Santa Clara	\N	\N	\N	\N	\N
1134	Advance Care	1125 East 17th Street	N-560 Santa Ana	Orange	92701	(800) 850-2693	(866) 273-1775	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Orange	\N	\N	\N	\N	\N
1135	Tri-Star Medical Group	999 N. Tustin Avenue	Suite 201 Santa Ana	Orange	92705	(714) 975-7950	(714) 975-7951	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Orange	\N	\N	\N	\N	\N
1136	First Line Health	12660 Riverside Dr	Unit 201 Studio City	Los Angeles	91607	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1137	Gutierrez Chiropractic	1304 Santa Anita Avenue	Unit A	South El Monte	91733	(626) 452-0202	(626) 452-0200	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1138	SCOP	14600 Sherman Way	Suite 100-A Van Nuys	Los Angeles	91405	(310) 337-3700	(310) 337-1643	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1139	Montgomery Chiropractic	14707 7th Street	Suite 100	Victorville	92395	(760) 881-3600	(760) 881-3601	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1140	Spine & Orthopedic Center	14298 St Andrews Drive	Suite 11	Victorville	92395	(951) 710-1030	(951) 710-1040	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1141	MedNation	202 W. Willow Street	Suite 302 Visalia	Visalia	93291	(818) 697-6190	(888) 383-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Tulare	\N	\N	\N	\N	\N
1142	Taft Chiropractic	14850 Roscoe Blvd.	Panorama City	Los Angeles	91402	(818) 340-0089	(818) 340-6985	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1143	Harout Balian MD	333 N. Hill Ave Suite 101		Pasadena	91106	(626) 449-9911	(626) 449-9921	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1144	Cedar Medical Group	3165 N. Garey Ave		Pomona	91767	(909) 392-2230		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1145	Cedar Medical Group	17096 E. Foothill Blvd		Fontana	92335	(909) 428-6989	(909) 428-6939	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1146	Industrial Treatment & Rehabilitation Center	155 Hospitality Lane	Suite 245	San Bernardino	92408	(909) 890-9703		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1147	First Line Health	1011 E. Devonshire Avenue	Suite 200	Hemet	92543	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	\N
1148	Industrial Healthcare Physicians Medical Group Inc.	2010 Wilshire Blvd	Suite 926	Los Angeles	90057	(213) 353-4921	(213) 402-7659	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1149	Cedar Medical Group	12730 Heacock Street	Suite 8	Moreno Valley	92553	(951) 247-4976		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	\N
1150	Cedar Medical Group	15664 Main Street	Ste 100	Hesperia	92345	(760) 244-1740	(760) 244-1741	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1151	Dr. Nikta Andalib DC	1224 E. Ave S	Ste B	Palmdale	93550	(661) 266-1611	(661) 266-1295	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1152	NobleQuest	14435 Hamlin Street#108	Van Nuys	Los Angeles	91401	(818) 997-7117	(888) 833-2881	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1153	Innovative Medical Management	7630 Painter Ave #B		Whittier	90602	(562) 696-1441		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1154	MedNation	1905 E. 17th Street	Suite 309 Santa Ana	Orange	92705	(818) 697-6190	(888) 391-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Orange	\N	\N	\N	\N	\N
1155	First Line Health	3231 Waring Ct	Suite N	Oceanside	92056	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	\N
1156	First Line Health	10800 Paramount Blvd.	Suite 201	Downey	90241	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1157	Advance Care	2935 Oswell St		Bakersfield	93306	(800) 850-2693	(866) 273-1775	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Kern	\N	\N	\N	\N	\N
1158	Advance Care	2001 N. Solar Drive #165		Oxnard	93036	(805) 485-0500	(805) 485-0057	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Ventura	\N	\N	\N	\N	\N
1159	Bakersfield Medical Group	2935 Oswell Street		Bakersfield	93306	(661) 455-0100	(661) 249-6241	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Kern	\N	\N	\N	\N	\N
1160	First Line Health	12901 Harbor Blvd.	Suite A6	Garden Grove	90840	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Orange	\N	\N	\N	\N	\N
1161	RB Spine Center (Rancho Bernardo)	10801 Thornmint Rd #250		San Diego	92127	(858) 345-4114		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	\N
1162	RB Spine Center (Mission Valley)	2878 Camino Del Rio S. #404		San Diego	92108	(858) 345-4114		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	\N
1163	RB Spine Center	601 E. San Ysidro #180	San Ysidro	San Diego	92173	(858) 345-4114		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	\N
1164	RB Spine Center	163 South Avenue 24	# 203-204	Los Angeles	91401	(858) 345-4114		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-05 01:24:48	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1178	AARLA	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 16:10:06	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table style="width: 1069px; height: 73px;" class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer</span><br></span></td><td><span style="font-weight: bold;">Link<br></span></td><td><span style="font-weight: bold;">Notes<br></span></td></tr><tr><td><br></td><td><p><a target="_blank" href="http://www.aarla.com">www.aarla.com</a><br><br></p></td><td><p>Click on "Medical Provider Network" Click on Security National MPN<br></p></td></tr></tbody></table><p><br></p>	\N
1258	Applied Risk Services	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 19:02:01	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.auw.com">http://</a></span><a target="_blank" href="http://www.auw.com">www.auw.com</a><span style="font-family: Arial;"><br></span></p></td><td><p><span style="font-family: Arial;">Click on Products &amp; Services, click on Promesa Health then on Promesa CA Provider Search and click on Search by Provider by Name or Tax ID&nbsp; <br><br></span></p></td></tr></tbody></table><p><br></p>	\N
1302	Argonaut Claim Services	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 19:04:48	2015-10-05 19:04:48	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/intracorp">http://</a><a target="_blank" href="http://www.talispoint.com/intracorp">www.talispoint.com/intracorp</a><br></span></p></td><td><p><span style="font-family: Arial;">Username: argo&nbsp;&nbsp;&nbsp;&nbsp; Password: argo<br></span></p></td></tr></tbody></table><p><br></p>	\N
1262	Old Republic	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 19:30:25	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com">http://www.coventrywcs.com</a><br></span></p></td><td><p><span style="font-family: Arial;">Client Login &amp; Tools&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Focus sedgwickkaisercampn<br></span></p></td></tr></tbody></table><p><br></p>	\N
1238	Sedgwick	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-06 10:37:40	1	0	\N	\N	\N	\N	\N	\N	\N	<table style="width: 1008px; height: 3521px;" class="dataa" cellspacing="0">\t<colgroup width="346"></colgroup>\t<colgroup width="424"></colgroup>\t<colgroup width="237"></colgroup>\t<tbody><tr>\t\t<td align="left" height="18" valign="bottom"><b><font color="#000000" face="Arial">Employer</font></b></td>\t\t<td align="left" valign="bottom"><b><font color="#000000" face="Arial">Link</font></b></td>\t\t<td align="left" valign="bottom"><b><font color="#000000" face="Arial">Notes</font></b></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Rollins</font></td>\t\t<td align="left" valign="bottom"><span style="color: rgb(0, 0, 255);"><span style="font-family: Arial;"><span style="text-decoration: underline;"><a target="_blank" href="http://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN">http://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN</a></span></span></span><br></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">County of Los Angeles Probation Dept</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.compcaremed.com/cola">http://www.compcaremed.com/cola</a><br></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Food 4 Less</font></td>\t\t<td align="left" valign="bottom"><p><span style="color: rgb(24, 188, 156);"><span style="font-family: Arial;"><span style="text-decoration: underline;"><a target="_blank" href="http://www.harborsys.com/kroger">http://</a></span></span></span><a target="_blank" href="http://www.harborsys.com/kroger">www.harborsys.com/kroger</a><br></p></td><td align="left" valign="bottom"><br></td></tr><tr><td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">edgwick  (Standard)</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.sedgwickproviders.com">http://www.sedgwickproviders.com</a><span style="color: rgb(24, 188, 156);"><span style="font-family: Arial;"><span style="text-decoration: underline;"><a target="_blank" href="http://www.sedgwickproviders.comwww.sedgwickproviders.com"></a></span></span></span><br></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Choose the correct Network</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Tyche Management Inc</font></td>\t\t<td align="left" valign="bottom"><u><font color="#0000FF" face="Arial"><a target="_blank" href="http://www.talispoint.com/firsthealth/?AE=997571183&amp;CAID=EVEMPN">http://www.talispoint.com/firsthealth/?AE=997571183&amp;CAID=EVEMPN</a></font></u></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Nestle</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/nestle">http://www.harborsys.com/nestle</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/nestle"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">EE Hall Inc</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools       Focus: sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Ross Stores</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/rossstores">http://www.harborsys.com/rossstores</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/rossstores"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">RH Peterson Co.</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.talispoint.com/firsthealth/?AE=997571183&amp;CAID=EVEMPN">http://www.talispoint.com/firsthealth/?AE=997571183&amp;CAID=EVEMPN</a><u><font color="#0000FF" face="Arial"><a href="http://www.talispoint.com/firsthealth/?AE=997571183&amp;CAID=EVEMPN"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">U.S. Horizon Manufacturing Inc</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools       Focus: sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Buffalo Wild Wings</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools       Focus: sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Albertsons</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/sedgwick2">http://www.harborsys.com/sedgwick2</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/sedgwick2"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Sears</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/sears">http://www.harborsys.com/sears</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/sears"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">La Quinta Resort Spa</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/sedgwick2">http://www.harborsys.com/sedgwick2</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/sedgwick2"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Walmart</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.talispoint.com/walmart">http://www.talispoint.com/walmart</a><u><font color="#0000FF" face="Arial"><a href="http://www.talispoint.com/walmart"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Password: wlm</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Pepsi</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools       Focus: sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="18" valign="bottom"><font color="#000000" face="Arial">Mission Hospital</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">NO MPN LINK</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Can schedule with any PTP</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Cheese Cake Factory</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools       Focus: campn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="54" valign="bottom"><font color="#000000" face="Arial">Mariak Industries</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.corvel.com/">htpp://ttwww.corvel.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.corvel.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Got to PPO Look Up         Select Find Provider              Select Network: CA MPN</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Los Angeles Unified School District (LAUSD)</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools           Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Huntington Memorial Hospital</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">NO MPN LINK</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Can schedule with any PTP</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Cintas Corp</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools           Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Northridge Hospital</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">NO MPN LINK</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Can schedule with any PTP</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Corona College Heights Orange &amp; Lemon Association</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools       Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">The Boeing Company</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/boeing">http://www.harborsys.com/boeing</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/boeing"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Lowe's</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.providernet.bunchcare.com/">http://www.providernet.bunchcare.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.providernet.bunchcare.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">ID: Lowes                          Password: Low289</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Perfect Image Youth Center</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventryhealthcare.com/">http://www.coventryhealthcare.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventryhealthcare.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Network: First Health</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Stater Bros</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools       Focus: sedgwickkaisercampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Snapware Corporation</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools           Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Hampton Inn</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/sedgwick">http://www.harborsys.com/sedgwick</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/sedgwick"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Standard Packing</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Ronford Products</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.everestnational.com/workcomp">http://www.everestnational.com/workcomp</a><u><font color="#0000FF" face="Arial"><a href="http://www.everestnational.com/workcomp"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Network: Everest Medical Provider Network</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Savon Drugs</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/client-tools/index.htm">http://www.coventrywcs.com/client-tools/index.htm</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/client-tools/index.htm"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client ID: sedgwickkaisercampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Frito Lay</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN">htpp://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN</a><u><font color="#0000FF" face="Arial"><a href="http://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Little Cesars</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools           First Health Portal: Select</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Knott's Berry Farm</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.talipoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN">htpp://www.talipoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN</a><u><font color="#0000FF" face="Arial"><a href="http://www.talipoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Smart &amp; Final</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools           Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Rollins</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN">htpp://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN</a><u><font color="#0000FF" face="Arial"><a href="http://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Cardinal Health</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Herman Ostrow School of Dentistry</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Securitas Security Services</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Kmart</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/shg">htpp://www.harborsys.com/shg</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/shg"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Target</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/target">htpp://www.harborsys.com/target</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/target"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Chuck E. Cheese's</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/cec">htpp://www.harborsys.com/cec</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/cec"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Big Lots</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Pick Your Parts</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Claim Jumper Restaurant</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Chick Fil A</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Kohl's</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Verizon Wireless</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="54" valign="bottom"><font color="#000000" face="Arial">County of Los Angeles or AIMS</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.ceo.lacounty.gov/mpn/">htpp://www.ceo.lacounty.gov/mpn/</a><u><font color="#0000FF" face="Arial"><a href="http://www.ceo.lacounty.gov/mpn/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Scroll down and click on Medical Provider Network. Then scroll down and select the Corvel option.</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">AT&amp;T</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">99 Cent Only Store</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">General Electric</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Coca-Cola</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login Tools            Focus: CAMPN</font></td>\t</tr>\t<tr>\t\t<td align="left" height="54" valign="bottom"><font color="#000000" face="Arial">Kimco Staffing</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools           First Health Portal            Client ID: ORS          Channeling Tools</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Air Industries</font></td>\t\t<td align="left" valign="bottom"><u><font color="#0000FF" face="Arial"><a href="https://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN">https://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN</a></font></u></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">McCromenter Inc</font></td>\t\t<td align="left" valign="bottom"><u><font color="#0000FF" face="Arial"><a href="https://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN">https://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN</a></font></u></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Super Value Inc</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools   Focus:Sedgwickkaisercampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Scripps Mercy Hospital</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/scripps">htpp://www.harborsys.com/scripps</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/scripps"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Dollar Tree</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools        Focus: sedgwickkaisercampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Jaguar Farm Labor</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.sedgwickproviders.com/ag">htpp://www.sedgwickproviders.com/ag</a><u><font color="#0000FF" face="Arial"><a href="http://www.sedgwickproviders.com/ag"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">John F. Kennedy Memorial Hospital</font></td>\t\t<td align="left" valign="bottom"><u><font color="#0000FF" face="Arial"><a target="_blank" href="https://www.harborsys.com/Temet">https://www.harborsys.com/Temet</a></font></u></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Picar Farm Labor Inc</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/ag">htpp://www.harborsys.com/ag</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/ag"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Hilton San Diego</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/sedgwick">htpp://www.harborsys.com/sedgwick</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/sedgwick"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Hilton Worldwide</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/sedgwick2">htpp://twww.harborsys.com/sedgwick2</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/sedgwick2"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Calabasas Dental Care</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools      Focus:sedgwickkaisercampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="38" valign="bottom"><font color="#000000" face="Arial">Foremost Senior Campus</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/ag">htpp://www.harborsys.com/ag</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/ag"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">USC</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/USC">htpp://www.harborsys.com/USC</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/USC"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="18" valign="bottom"><font color="#000000" face="Arial">Superior Talent Resources</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">NO MPN LINK</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">LA County of Dept of Children &amp; Family Services</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.compcaremed.com/cola/">htpp://www.compcaremed.com/cola/</a><u><font color="#0000FF" face="Arial"><a href="http://www.compcaremed.com/cola/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Knowledge Universe</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools Focus:Sedgwickkaisercampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="40" valign="bottom"><font color="#000000" face="Arial">The Beverly Hilton</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/sedgwick2">htpp://www.harborsys.com/sedgwick2</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/sedgwick2"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Wendy's</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.talispoint.com/">htpp://www.talispoint.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.talispoint.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Username: SRS       Password: arbys</font></td>\t</tr>\t<tr>\t\t<td align="left" height="38" valign="bottom"><font color="#000000" face="Arial">Wells Fargo Bank</font></td>\t\t<td align="left" valign="bottom"><u><font color="#0000FF" face="Arial"><a target="_blank" href="https://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN">https://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN</a></font></u></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Walgreens</font></td>\t\t<td align="left" valign="bottom"><u><font color="#0000FF" face="Arial"><a target="_blank" href="https://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN">https://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN</a></font></u></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Office Depot</font></td>\t\t<td align="left" valign="bottom"><u><font color="#0000FF" face="Arial"><a target="_blank" href="https://www.talispoint.com/genex/login/">https://www.talispoint.com/genex/login/</a></font></u></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Username: Office    Password: Depot</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">LA-Z Boy</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.sedgwickproviders.com/lzb">htpp://www.sedgwickproviders.com/lzb</a><u><font color="#0000FF" face="Arial"><a href="http://www.sedgwickproviders.com/lzb"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="18" valign="bottom"><font color="#000000" face="Arial">Starbucks</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">NO MPN LINK</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Sabor Foods</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.sedgwickproviders.com/ag">htpp://www.sedgwickproviders.com/ag</a><u><font color="#0000FF" face="Arial"><a href="http://www.sedgwickproviders.com/ag"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">General Electric</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools      Focus: sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="18" valign="bottom"><font color="#000000" face="Arial">Trader Joe's</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">NO MPN LINK</font></td>\t\t<td align="center" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="24" valign="bottom"><font color="#000000" face="Arial">Fed-Ex</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.talispoint.com/">htpp://www.talispoint.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.talispoint.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">User ID: Fedex Password:Fedex</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Ralphs</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.sedgwickproviders.com/Kroger">htpp://www.sedgwickproviders.com/Kroger</a><u><font color="#0000FF" face="Arial"><a href="http://www.sedgwickproviders.com/Kroger"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Cardinal Health</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools       Focus: sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="18" valign="bottom"><font color="#000000" face="Arial">UCLA</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">NO MPN LINK</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">McDonald's</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/pog">htpp://www.harborsys.com/pog</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/pog"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">OfficeMax</font></td>\t\t<td align="left" valign="bottom"><u><font color="#0000FF" face="Arial"><a target="_blank" href="http://www-lv.talispoint.com/">http://www-lv.talispoint.com</a></font></u></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Username: Office    Password: Depot</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Flair Cleaners</font></td>\t\t<td align="left" valign="bottom"><u><font color="#0000FF" face="Arial"><a target="_blank" href="http://www.coventrywcs.com/client-tools/index.htm">http://www.coventrywcs.com/client-tools/index.htm</a></font></u></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Focus: campn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Excel Logics</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/desc">htpp://www.harborsys.com/desc</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/desc"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="18" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Whole Foods Market</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.talispoint.com/cvty/gbmpn">htpp://www.talispoint.com/cvty/gbmpn</a><u><font color="#0000FF" face="Arial"><a href="http://www.talispoint.com/cvty/gbmpn"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr></tbody></table>	\N
1264	National Interstate	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 18:12:29	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer</span></span><br></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link</span></span><br></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes</span></span><br></td></tr><tr><td><br></td><td><p><span style="font-family: Arial;">NO MPN LINK</span><br></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1299	Nationwide	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 18:16:48	2015-10-05 18:16:48	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.genexservices.com">http://</a></span><a target="_blank" href="http://www.genexservices.com">www.genexservices.com</a><span style="font-family: Arial;"><br></span></p></td><td><p>User Name: ehi001&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Password: ehi1<span style="font-family: Arial;"><br></span></p></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><span style="font-family: Arial;"><br></span></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1206	ESIS	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 17:25:48	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table style="width: 1117px; height: 74px;" class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;">Employer<br></span></td><td><span style="font-weight: bold;">Link<br></span></td><td><span style="font-weight: bold;">Notes<br></span></td></tr><tr><td><br></td><td><p><a target="_blank" href="http://www.talispoint.com/esis/mpn/">http://www.talispoint.com/esis/mpn/</a><br></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1298	City of Torrance	N/A	\N	Los Angeles	99900	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 17:31:49	2015-10-05 17:31:49	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><br></td><td><p>NO MPN LINK<br></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1250	AmTrust North America	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 19:58:35	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/amtrust/campn">http://www.talispoint.com/amtrust/campn</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on Name Search<br></span></p></td></tr></tbody></table><p><br></p>	\N
1300	Federal Insurance Co.	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 18:22:15	2015-10-05 18:22:15	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.corvel.com">http://</a><a target="_blank" href="http://www.corvel.com">www.corvel.com</a><br></span></p></td><td><p><span style="font-family: Arial;">California MPN<br></span></p></td></tr></tbody></table><p><br></p>	\N
1244	Travelers	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 18:32:21	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/travelers/ext/?lob=wc">http://</a></span><a target="_blank" href="http://www.talispoint.com/travelers/ext/?lob=wc">www.talispoint.com/travelers/ext/?lob=wc</a><span style="font-family: Arial;"><br></span></p></td><td><p>Provider Lookup<span style="font-family: Arial;"><br></span></p></td></tr></tbody></table><p><br></p>	\N
1204	Employers Compensation	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 18:39:14	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.employers.com/workers/provider_locator.aspx">http://www.employers.com/workers/provider_locator.aspx</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on California then click on "To Locate Provider Click Here"&nbsp; and click on "Search by Provider Name or Tax ID"<br></span></p></td></tr></tbody></table><p><br></p>	\N
1301	Southern Insurance Co.	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 18:48:53	2015-10-05 18:48:53	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><br></td><td><p><a target="_blank" href="http://www.risingms.net/employers/firstcomp">http://www.risingms.net/employers/firstcomp</a><br></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1253	Marriott Claims Services	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 18:52:36	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><br></td><td><p><a target="_blank" href="http://http://www.talispoint.com/marriott/campn">http://http://www.talispoint.com/marriott/campn</a><br></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1303	QBE Specialty Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 19:32:43	2015-10-05 19:32:43	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.harborsys.com/sedgwick">http://www.harborsys.com/sedgwick</a><br></span></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1233	Safeway Inc. (Vons)	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 19:36:03	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><p>VONS<span style="font-family: Arial;"><br></span></p></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/saefwaympn">http://</a></span><a target="_blank" href="http://www.talispoint.com/saefwaympn">www.talispoint.com/saefwaympn</a><span style="font-family: Arial;"><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1304	ICW	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 19:38:44	2015-10-05 19:38:44	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><br></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.harborsys.com/ICWGroup">http://www.harborsys.com/ICWGroup</a></span><br></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1278	Matrix Absence Management	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 19:56:16	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com">http://www.coventrywcs.com</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on Provider Tools then click on Referral Search <br><br></span></p></td></tr></tbody></table><p><br></p>	\N
1227	One Beacon Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:00:51	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/firsthealth/provider/">http://www.talispoint.com/firsthealth/provider/</a><br></span></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1197	Corvel	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 21:22:09	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><p><span style="font-family: Arial;"><br></span></p></td><td><p><a target="_blank" href="http://www.corvel.com/ppo-lookup/">http://www.corvel.com/ppo-lookup/</a><span style="font-family: Arial;"><br></span></p></td><td><p>Select California MPN<span style="font-family: Arial;"><br></span></p></td></tr></tbody></table><p><br></p>	\N
1182	AIG (Chartis)	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 22:00:06	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/aig/com/">http://www.talispoint.com/aig/com/</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1217	Intercare	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:02:47	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com">http://www.coventrywcs.com</a><br></span></p></td><td><p><span style="font-family: Arial;">Client Login &amp; Tools&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Focus&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Client ID: campn<br></span></p></td></tr></tbody></table><p><br></p>	\N
1193	CIGA	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:04:42	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/cvty/cigampn">http://www.talispoint.com/cvty/cigampn</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1230	Patriot Risk Management	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:06:33	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://rockporthealthcare.com/SSL/login.aspx">http://rockporthealthcare.com/SSL/login.aspx</a><br></span></p></td><td><p><span style="font-family: Arial;">Username: avizent&nbsp; Password: 9572&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Click on Search by Name under "Locate a Provider"<br></span></p></td></tr></tbody></table><p><br></p>	\N
1232	Republic Indemnity Co. of America	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:20:42	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/ri">http://www.talispoint.com/ri</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr><tr><td><p><span style="font-family: Arial;">Southern California Edison<br></span></p></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/sce/external">http://www.talispoint.com/sce/external</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1305	State Farm Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 20:22:32	2015-10-05 20:22:32	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;">NO MPN LINK<br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1225	Midwest	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:52:24	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td>Notes<br></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="https://www.viiad.com/risingCompass/private/app/compass/provider_search_main.asp">https://www.viiad.com/risingCompass/private/app/compass/provider_search_main.asp</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1222	Lumberman's Underwriting	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:29:29	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www-sf.talispoint.com/talispoint/login.pl?control_id=SF4CF4P8EW&amp;old_sess=SPFLE6V1E6&amp;mode=name">http://www-sf.talispoint.com/talispoint/login.pl?control_id=SF4CF4P8EW&amp;old_sess=SPFLE6V1E6&amp;mode=name</a><br></span></p></td><td><p><span style="font-family: Arial;">Username: Lua001&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Password: lua1<br></span></p></td></tr></tbody></table><p><br></p>	\N
1215	Hortica	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:30:25	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com">http://www.coventrywcs.com</a><br></span></p></td><td><p>Client Login&amp; Tools&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; First Health&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; User ID: hin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Channeling Tools<span style="font-family: Arial;"><br></span></p></td></tr></tbody></table><p><br></p>	\N
1294	Tokio Marine	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:35:40	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com">http://www.coventrywcs.com</a><br></span></p></td><td><p><span style="font-family: Arial;">Client Login&amp; Tools&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; First Health&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; User ID: select<br></span></p></td></tr></tbody></table><p><br></p>	\N
1212	Guard Insurance Group	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:42:48	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.guardinsurancegroup.com/caclaim.stm">http://www.guardinsurancegroup.com/caclaim.stm</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on On-line Directory of Managed Care Providers Click on Name Search&nbsp; <br><br></span></p></td></tr><tr><td><p><span style="font-family: Arial;">Kaiser Permanente<br></span></p></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://http://www.talispoint.com/kaiser/external/">http://http://www.talispoint.com/kaiser/external/</a><br></span></p></td><td><p><span style="font-family: Arial;">Password: Kaiser<br></span></p></td></tr><tr><td><p><span style="font-family: Arial;">Disneyland Worldwide Services<br></span></p></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.harborsys.com/wdpr">http://www.harborsys.com/wdpr</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1240	Sentry Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:44:54	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com/client-tools/index.htm">http://www.coventrywcs.com/client-tools/index.htm</a><br></span></p></td><td><p><span style="font-family: Arial;">First Health Portal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Client ID: SIN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Channeling Tools<br></span></p></td></tr></tbody></table><p><br></p>	\N
1306	Enstar Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 20:47:26	2015-10-05 20:47:26	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.paladinmc.com/providers.html">http://www.paladinmc.com/providers.html</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on Torus Califoria Medical Provider Network<br></span></p></td></tr></tbody></table><p><br></p>	\N
1179	ACE	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:50:28	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes</span><br></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.acegroup.com/esis-en/client-resources/find-a-provider.aspx">http://www.acegroup.com/esis-en/client-resources/find-a-provider.aspx</a><br></span></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1247	Zenith Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:54:17	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.thezenith.com/zmpn">http://www.thezenith.com/zmpn</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on Locate at the bottom on the page then click on "Name Search"<br></span></p></td></tr></tbody></table><p><br></p>	\N
1248	Zurich NA	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:56:07	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.zurichna.com/en">http://www.zurichna.com/en</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on Online Services tab, Click on Customers, scroll to the bottom and click on Workers Comp/safety, click on Access the CARE Directory Now then Name Search<br></span></p></td></tr></tbody></table><p><br></p>	\N
1188	Berkshire Hathaway	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 21:18:01	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="https://www.viiad.com/anthemcompass/KBOAKRIVE00/app/home.asp">https://www.viiad.com/anthemcompass/KBOAKRIVE00/app/home.asp</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1187	Barrett Business Services Inc (BBSI)	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 21:25:12	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.bbsi.com">http://www.bbsi.com</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on MPN Provider Search,&nbsp; Login: BBSI , Click on Find Providers Near you, Select Barrett Buisness MPN<br></span></p></td></tr></tbody></table><p><br></p>	\N
1209	First Comp	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 21:27:39	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="https://www.viiad.com/risingCompass/private/app/compass/provider_search_main.asp">https://www.viiad.com/risingCompass/private/app/compass/provider_search_main.asp</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1255	Tristar Risk Management	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 21:29:18	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.tristarrisk.com/">http://www.tristarrisk.com/</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on Find a Provider, then click on&nbsp;&nbsp;&nbsp; MPN/Network Access<br></span></p></td></tr></tbody></table><p><br></p>	\N
1231	Preferred Employers	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 21:36:24	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.preferredworkcomp.com/Site/1040245120/FindDoctor.asp">http://www.preferredworkcomp.com/Site/1040245120/FindDoctor.asp</a><br></span></p></td><td><p><span style="font-family: Arial;">Need Clain Number &amp; Social Security Number in orde rto search for a Doctor<br></span></p></td></tr></tbody></table><p><br></p>	\N
1307	State Comp Ins Fund (SCIF)	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 21:42:36	2015-10-05 21:42:54	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="https://www.statefundca.com/">https://www.statefundca.com/</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on Find a Doctor, click on Start your Search Now and click on Name/TIN Search<br></span></p></td></tr></tbody></table><p><br></p>	\N
1308	Seabright Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 21:44:11	2015-10-05 21:45:09	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;">Employer<br></span></td><td><span style="font-weight: bold;">Link<br></span></td><td><span style="font-weight: bold;">Notes<br></span></td></tr><tr><td><br></td><td><p><a target="_blank" href="http://www.sbic.com/onlinesystems.html">http://www.sbic.com/onlinesystems.html</a><br></p></td><td><p>Scroll to the bottom of the page and it will give you the option to either click on Brightcure CA Medical Provider Network or Brightcure CA Broadbase Network <br><br></p></td></tr></tbody></table><p><br></p>	\N
1224	Meadowbrook	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 21:51:34	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.meadowbrookinsgrp.com/report-a-claim/workers-compensation-claims/">http://www.meadowbrookinsgrp.com/report-a-claim/workers-compensation-claims/</a><br></span></p></td><td><p><span style="font-family: Arial;">On the right hand side of the page click on MeadowCare Provider Search<br></span></p></td></tr></tbody></table><p><br></p>	\N
1249	Church Mutual	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 21:58:18	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="https://www.churchmutual.com/3261/California-Medical-Provider-Network">https://www.churchmutual.com/3261/California-Medical-Provider-Network</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1192	Chubb Services	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 22:02:46	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><br></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.chubb.com/businesses/cci/chubb12525.html">http://www.chubb.com/businesses/cci/chubb12525.html</a></span><br></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1243	Tower Group	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 22:45:13	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/cvty/twrgrp">http://www.talispoint.com/cvty/twrgrp</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr><tr><td><p><span style="font-family: Arial;">Vallarta<br></span></p></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com">http://www.coventrywcs.com</a><br></span></p></td><td><p><span style="font-family: Arial;">Client Login &amp; Tools&nbsp;&nbsp; FOCUS: sedgwickcampn<br></span></p></td></tr></tbody></table><p><br></p>	\N
1309	The Hartford	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 22:08:37	2015-10-05 22:14:28	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/htfd/external/">http://www.talispoint.com/htfd/external/</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on Provider Lookup<br></span></p></td></tr><tr><td><p><span style="font-family: Arial;">City of San Diego<br></span></p></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.sandiego.gov/riskmanagement/">http://www.sandiego.gov/riskmanagement/</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1310	AmGuard	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 22:30:21	2015-10-05 22:33:08	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><br></td><td><p><a target="_blank" href="http://www.coventrywcs.com">http://www.coventrywcs.com</a></p></td><td><p>First Health Portal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Client ID: Guard<br></p></td></tr><tr><td><p>City of Anaheim<br></p></td><td><p>NO MPN LINK<br></p></td><td><br></td></tr><tr><td><p>Waste Management<br></p></td><td><p>NO MPN LINK<br></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1263	Everest National Ins.	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 22:37:29	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.everestregroup.com//Insurance/InsuranceOverview.aspx?site=red">http://www.everestregroup.com//Insurance/InsuranceOverview.aspx?site=red</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on Insurance Tab, click on Workers Comp &amp; Managed Care and then click on "For Date of injury AFTER Dec 31, 2010"<br></span></p></td></tr><tr><td><p><span style="font-family: Arial;">UCLA<br></span></p></td><td><p><span style="font-family: Arial;">NO MPN LINK<br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1311	Springfield Insurance	N/A		Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 22:49:00	2015-10-05 22:49:31	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.bclhwcmcs.com">http://www.bclhwcmcs.com</a><br></span></p></td><td><p><span style="font-family: Arial;">Under Patient Services click on California then click on Find a Provider then click on California again and last click on Search by Name or Tax ID<br></span></p></td></tr></tbody></table><p><br></p>	\N
1316	Avizent	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 23:53:01	2015-10-05 23:55:15	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employed<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><br></td><td><p><a target="_blank" href="https://www.anthemwc.com/home_claims_administrator.asp">https://www.anthemwc.com/home_claims_administrator.asp</a><br></p></td><td><p>Under Patient Services click on California then click on Find a Provider then click on California again and last click on Search by Name or Tax ID<br></p></td></tr></tbody></table><p><br></p>	\N
1317	Unemployed Benefit Employer Trust Fund (UEBTF)	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 23:57:26	2015-10-05 23:58:55	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employed<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">notes<br></span></span></td></tr><tr><td><br></td><td><br></td><td><p>No Insurance, can schedule with an Dr<br></p></td></tr></tbody></table><p><br></p>	\N
1312	Pinnacle Risk Management	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 23:01:04	2015-10-05 23:02:05	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;">Employer<br></span></td><td><span style="font-family: Arial;">Link<br></span></td><td><span style="font-family: Arial;">Notes<br></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.anthemwc.com">http://www.anthemwc.com</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr><tr><td><p><span style="font-family: Arial;">City of Long Beach<br></span></p></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.tristarrisk.com">http://www.tristarrisk.com</a><br></span></p></td><td><p><span style="font-family: Arial;">Under Client tools click on "Find a Provider" and select "MPN/Network Access" and select corresponding city<br></span></p></td></tr><tr><td><p><span style="font-family: Arial;">Foster Farms<br></span></p></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://mpn.corvel.com/fosterfarms">http://mpn.corvel.com/fosterfarms</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1207	Farmers Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 23:37:40	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/Farmers/emp/">http://www.talispoint.com/Farmers/emp/</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1313	Berkley Specialty Underwriting	N/A	n	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 23:09:50	2015-10-05 23:14:08	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com">http://www.coventrywcs.com</a><br></span></p></td><td><p><span style="font-family: Arial;">Client Login , First Health Password: berkly&nbsp; Channeling Tools<br></span></p></td></tr><tr><td><p><span style="font-family: Arial;">Macy's<br></span></p></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.wcs.anthem.com">http://www.wcs.anthem.com</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1208	Fireman's Fund	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 23:21:27	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com">http://www.coventrywcs.com</a><br></span></p></td><td><p><span style="font-family: Arial;">Client Login &amp; Tools&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; First Health&nbsp;&nbsp; Client ID: FUD<br></span></p></td></tr></tbody></table><p><br></p>	\N
1314	Blue Lake Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 23:25:53	2015-10-05 23:26:40	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.wellcomp.com">http://www.wellcomp.com</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on Provider Lookup Tab then click on&nbsp;&nbsp;&nbsp;&nbsp; Wellcomp CA MPN<br></span></p></td></tr></tbody></table><p><br></p>	\N
1221	Liberty Mutual / Helmsman	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 23:33:16	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;">Link<br></span></td><td><span style="font-weight: bold;">Notes<br></span></td></tr><tr><td><p>UPS<br></p></td><td><p><a target="_blank" href="https://www-sf.talispoint.com/liberty/ext/?uloc=MAIN_PR">http://www.talispoint.com/liberty/ups/ext/</a><br></p></td><td><p>Click on Search by Name<br></p></td></tr></tbody></table><p><br></p>	\N
1186	American Claims Management (ACM)	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 23:40:29	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;">Employer<br></span></td><td><span style="font-family: Arial;">Link<br></span></td><td><span style="font-family: Arial;">Notes<br></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://mpn.acmclaims.com">http://mpn.acmclaims.com</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1315	Patriot Risk Services	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 23:47:37	2015-10-05 23:49:43	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;">Employer<br></span></td><td><span style="font-family: Arial;">Link<br></span></td><td><span style="font-family: Arial;">Notes<br></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.rockporthealthcare.com/SSL/Login.aspx?RedirectUrl=/SearchByZip.aspx&amp;">http://www.rockporthealthcare.com/SSL/Login.aspx?RedirectUrl=/SearchByZip.aspx&amp;</a><br></span></p></td><td><p><span style="font-family: Arial;">Username: avizent&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Password: 9572<br></span></p></td></tr></tbody></table><p><br></p>	\N
1213	Hanover Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-06 00:02:16	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;">Employed<br></span></td><td><span style="font-weight: bold;">Link<br></span></td><td><span style="font-weight: bold;">Notes<br></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.corvel.com">http://www.corvel.com</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on PPO Lookup, Click on search, select California MPN<br></span></p></td></tr></tbody></table><p><br></p>	\N
1191	Care West	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-06 00:19:12	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;">Employer<br></span></td><td><span style="font-family: Arial;">Link<br></span></td><td><span style="font-family: Arial;">Notes<br></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="https://secure.simon-companies.com/carewest/">https://secure.simon-companies.com/carewest/</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1223	LWP Claims Solutions	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-06 00:24:42	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;">Employed<br></span></td><td><span style="font-family: Arial;">Link<br></span></td><td><span style="font-family: Arial;">Notes<br></span></td></tr><tr><td><br></td><td><p><a target="_blank" href="http://www.lwpprosightsignaturempn.com/">http://www.lwpprosightsignaturempn.com/</a><br></p></td><td><br></td></tr><tr><td><br></td><td><br></td><td><br></td></tr></tbody></table><p><br></p>	\N
1246	York Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-06 00:32:12	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link</span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes</span></span></td></tr><tr><td><p>Adelanto School District<br></p></td><td><p><a target="_blank" href="http://www.eiampn.csac-eia.org">http://www.eiampn.csac-eia.org</a><br></p></td><td><br></td></tr><tr><td><p>Dodgers<br></p></td><td><p><a target="_blank" href="http://providernet.bunchcare.com">http://providernet.bunchcare.com</a><br></p></td><td><p>User Name: mlb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Password: mlb104&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Select CA as state of employment then click on Search for Providers<br></p></td></tr></tbody></table><p><br></p>	\N
1319	Law Offices of Saboorian & Associates	14523 Gilmore Street, Van Nuys, Ca 91411	\N	Los Angeles	91411	(818) 780-4040	(818) 780-3712	N/A	\N	\N	1	2015-10-06 16:13:02	2015-10-06 17:35:30	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1320	Steve K. Marks Law Office	8880 Rio San Diego Drive, Suite 800, San Diego, Ca 92108	\N	San Diego	92108	(619) 262-5555	(888) 322-3677	N/A	\N	\N	1	2015-10-06 16:15:54	2015-10-06 17:59:58	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1321	Law Offices of Payman Zargari	5900 Sepulveda Blvd, Suite 304, Sherman Oaks, Ca 91411	\N	Los Angeles	91411	(818) 989-9800	(818) 989-9811	N/A	\N	\N	1	2015-10-06 16:24:30	2015-10-06 18:07:10	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1322	Law Firm of Michael Holmes	505 N. Tustin Ave, Suite 195, Santa Ana, Ca 92705	\N	Santa Ana	92705	(888) 393-4529	(888) 712-0463	N/A	\N	\N	1	2015-10-06 16:28:31	2015-10-06 18:13:42	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1323	Law Office of Tamar Ekisian	7100 Hayvenhurt Ave, Van Nuys, Ca 91406	\N	Los Angeles	91406	(818) 772-4575	(818) 756-0998	N/A	\N	\N	1	2015-10-06 16:32:01	2015-10-06 18:14:56	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1324	Chahine & Associates	33 South Catalina Ave, Suite 202, Pasadena, Ca 91106	\N	Pasadena	91106	(626) 486-0154	(626) 486-0218	N/A	\N	\N	1	2015-10-06 16:33:40	2015-10-06 18:15:52	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1318	Maxwell Agha Law Firm	160 Thorn Street, Suite 200, San Diego, Ca 92103	\N	San Diego	90001	(619) 230-0330	(619) 230-1726	N/A	\N	\N	0	2015-10-06 15:45:49	2015-10-08 13:12:09	1	0	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 13:12:09
\.


--
-- Name: requesting_offices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('requesting_offices_id_seq', 1324, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles (id, name, write, user_id, created_at, updated_at) FROM stdin;
215	Body Parts	1	620	2015-10-09 10:11:21	2015-10-09 10:11:21
216	Regions	1	620	2015-10-09 10:11:21	2015-10-09 10:11:21
217	Confirmations	0	620	2015-10-09 10:11:21	2015-10-09 10:11:21
218	Cancelations	0	620	2015-10-09 10:11:21	2015-10-09 10:11:21
219	Law Offices	0	620	2015-10-09 10:11:21	2015-10-09 10:11:21
220	Clinics	0	620	2015-10-09 10:11:21	2015-10-09 10:11:21
221	Insurance Companies	0	620	2015-10-09 10:11:21	2015-10-09 10:11:21
163	Body Parts	1	617	2015-10-08 09:25:04	2015-10-08 09:25:04
164	Regions	1	617	2015-10-08 09:25:04	2015-10-08 09:25:04
222	Attorneys	0	620	2015-10-09 10:11:21	2015-10-09 10:11:21
165	Confirmations	0	617	2015-10-08 09:25:04	2015-10-08 09:25:04
166	Cancelations	0	617	2015-10-08 09:25:04	2015-10-08 09:25:04
223	Doctors	0	620	2015-10-09 10:11:21	2015-10-09 10:11:21
167	Law Offices	0	617	2015-10-08 09:25:04	2015-10-08 09:25:04
168	Clinics	0	617	2015-10-08 09:25:04	2015-10-08 09:25:04
224	Clients	1	620	2015-10-09 10:11:21	2015-10-09 10:11:21
169	Insurance Companies	0	617	2015-10-08 09:25:04	2015-10-08 09:25:04
170	Attorneys	0	617	2015-10-08 09:25:04	2015-10-08 09:25:04
225	Users	0	620	2015-10-09 10:11:21	2015-10-09 10:11:21
171	Doctors	0	617	2015-10-08 09:25:04	2015-10-08 09:25:04
172	Clients	1	617	2015-10-08 09:25:04	2015-10-08 09:25:04
226	Searches	1	620	2015-10-09 10:11:21	2015-10-09 10:11:21
173	Users	0	617	2015-10-08 09:25:04	2015-10-08 09:25:04
174	Searches	1	617	2015-10-08 09:25:04	2015-10-08 09:25:04
227	Reports	0	620	2015-10-09 10:11:21	2015-10-09 10:11:21
175	Reports	0	617	2015-10-08 09:25:04	2015-10-08 09:25:04
228	Body Parts	1	622	2015-10-09 10:12:08	2015-10-09 10:12:08
229	Regions	1	622	2015-10-09 10:12:08	2015-10-09 10:12:08
230	Confirmations	0	622	2015-10-09 10:12:08	2015-10-09 10:12:08
231	Cancelations	0	622	2015-10-09 10:12:08	2015-10-09 10:12:08
232	Law Offices	0	622	2015-10-09 10:12:08	2015-10-09 10:12:08
233	Clinics	0	622	2015-10-09 10:12:08	2015-10-09 10:12:08
234	Insurance Companies	0	622	2015-10-09 10:12:08	2015-10-09 10:12:08
189	Body Parts	1	616	2015-10-08 09:29:58	2015-10-08 09:29:58
190	Regions	1	616	2015-10-08 09:29:58	2015-10-08 09:29:58
235	Attorneys	0	622	2015-10-09 10:12:08	2015-10-09 10:12:08
191	Confirmations	0	616	2015-10-08 09:29:58	2015-10-08 09:29:58
192	Cancelations	0	616	2015-10-08 09:29:58	2015-10-08 09:29:58
236	Doctors	0	622	2015-10-09 10:12:08	2015-10-09 10:12:08
193	Law Offices	0	616	2015-10-08 09:29:58	2015-10-08 09:29:58
194	Clinics	0	616	2015-10-08 09:29:58	2015-10-08 09:29:58
237	Clients	1	622	2015-10-09 10:12:08	2015-10-09 10:12:08
195	Insurance Companies	0	616	2015-10-08 09:29:58	2015-10-08 09:29:58
196	Attorneys	0	616	2015-10-08 09:29:58	2015-10-08 09:29:58
238	Users	0	622	2015-10-09 10:12:08	2015-10-09 10:12:08
197	Doctors	0	616	2015-10-08 09:29:58	2015-10-08 09:29:58
198	Clients	1	616	2015-10-08 09:29:58	2015-10-08 09:29:58
239	Searches	1	622	2015-10-09 10:12:08	2015-10-09 10:12:08
199	Users	0	616	2015-10-08 09:29:58	2015-10-08 09:29:58
200	Searches	1	616	2015-10-08 09:29:58	2015-10-08 09:29:58
240	Reports	0	622	2015-10-09 10:12:08	2015-10-09 10:12:08
201	Reports	0	616	2015-10-08 09:29:58	2015-10-08 09:29:58
202	Body Parts	1	621	2015-10-09 10:09:44	2015-10-09 10:09:44
241	Body Parts	1	618	2015-10-09 10:50:56	2015-10-09 10:50:56
203	Regions	1	621	2015-10-09 10:09:44	2015-10-09 10:09:44
204	Confirmations	0	621	2015-10-09 10:09:44	2015-10-09 10:09:44
242	Regions	1	618	2015-10-09 10:50:56	2015-10-09 10:50:56
205	Cancelations	0	621	2015-10-09 10:09:44	2015-10-09 10:09:44
206	Law Offices	0	621	2015-10-09 10:09:44	2015-10-09 10:09:44
243	Confirmations	0	618	2015-10-09 10:50:56	2015-10-09 10:50:56
207	Clinics	0	621	2015-10-09 10:09:44	2015-10-09 10:09:44
208	Insurance Companies	0	621	2015-10-09 10:09:44	2015-10-09 10:09:44
244	Cancelations	0	618	2015-10-09 10:50:56	2015-10-09 10:50:56
209	Attorneys	0	621	2015-10-09 10:09:44	2015-10-09 10:09:44
210	Doctors	0	621	2015-10-09 10:09:44	2015-10-09 10:09:44
245	Law Offices	0	618	2015-10-09 10:50:56	2015-10-09 10:50:56
211	Clients	1	621	2015-10-09 10:09:44	2015-10-09 10:09:44
212	Users	0	621	2015-10-09 10:09:44	2015-10-09 10:09:44
246	Clinics	0	618	2015-10-09 10:50:56	2015-10-09 10:50:56
213	Searches	1	621	2015-10-09 10:09:44	2015-10-09 10:09:44
214	Reports	0	621	2015-10-09 10:09:44	2015-10-09 10:09:44
247	Insurance Companies	0	618	2015-10-09 10:50:56	2015-10-09 10:50:56
248	Attorneys	0	618	2015-10-09 10:50:56	2015-10-09 10:50:56
249	Doctors	0	618	2015-10-09 10:50:56	2015-10-09 10:50:56
250	Clients	1	618	2015-10-09 10:50:56	2015-10-09 10:50:56
251	Users	0	618	2015-10-09 10:50:56	2015-10-09 10:50:56
252	Searches	1	618	2015-10-09 10:50:56	2015-10-09 10:50:56
253	Reports	0	618	2015-10-09 10:50:56	2015-10-09 10:50:56
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 253, true);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sessions (id, start_time, end_time, ip, is_closed, user_id, created_at, updated_at, access_token, checkin) FROM stdin;
76	2015-10-09 10:58:19	2015-10-09 11:09:59	190.5.137.161	1	617	2015-10-09 10:58:19	2015-10-09 11:08:27	2bLT2AaCfd0e4yuWqcMP9eVtSHoVPGe2YJ9uAGS1	2015-10-09 11:08:27
58	2015-10-08 09:26:53	2015-10-08 09:30:54	64.183.24.210	1	611	2015-10-08 09:26:53	2015-10-08 09:30:32	yYmNsQVS2G4gxIbVAOb2g9RbEmuR786N202iY590	2015-10-08 09:30:32
69	2015-10-09 09:11:59	2015-10-09 09:11:59	190.62.6.88	0	615	2015-10-09 09:11:59	2015-10-09 09:26:36	7vC89FucaHGFw0d7uTxVufIiGlk6uFr0KvUWIsOE	2015-10-09 09:26:36
59	2015-10-08 09:31:12	2015-10-08 09:31:32	64.183.24.210	1	611	2015-10-08 09:31:12	2015-10-08 09:31:18	NxvRlSe65t9s7O808td3SANWeFaMfKGtbYdPqCiJ	2015-10-08 09:31:18
55	2015-10-08 09:21:59	2015-10-08 09:25:24	64.183.24.210	1	611	2015-10-08 09:21:59	2015-10-08 09:25:19	8YSF2azwnBNQyKmuFUQxi5RiZ0uGs8ol0JCKpgKL	2015-10-08 09:25:19
52	2015-10-07 15:33:00	2015-10-07 15:40:15	190.62.6.88	1	615	2015-10-07 15:33:00	2015-10-07 15:39:07	eBgM9GlOffmG6KBIl3VnCSWXmFqVovO6SvfUpvbc	2015-10-07 15:39:07
73	2015-10-09 10:41:34	2015-10-09 13:19:00	64.183.24.210	1	616	2015-10-09 10:41:34	2015-10-09 13:18:08	ppme9An4Uu74BsJAA8T8UuJpQaPn5RD3AmAuRPNg	2015-10-09 13:18:08
70	2015-10-09 09:29:04	2015-10-09 09:29:04	190.62.6.88	0	615	2015-10-09 09:29:04	2015-10-09 09:29:09	xkz5k8BRAHOar1bUsgxRCyrtDzbRNCAZMsXs7xn0	2015-10-09 09:29:09
53	2015-10-07 15:40:22	2015-10-07 15:55:33	190.62.6.88	1	611	2015-10-07 15:40:22	2015-10-07 15:41:10	BMOTAtBQ8JJ3iRa4ssptBnipianp8muuSfTRRNMo	2015-10-07 15:41:10
56	2015-10-08 09:25:43	2015-10-08 09:25:59	64.183.24.210	1	617	2015-10-08 09:25:43	2015-10-08 09:25:57	df1LaPyhSmCFAzAayAk3k9D5sfPc7WiQllboOt0z	2015-10-08 09:25:57
72	2015-10-09 10:40:41	2015-10-09 10:40:41	64.183.24.210	0	614	2015-10-09 10:40:41	2015-10-09 13:49:29	sHGEbgf7H0krnQGT03miv4mdPp9PTecF9xD37O2w	2015-10-09 13:49:29
57	2015-10-08 09:26:23	2015-10-08 09:26:29	64.183.24.210	1	617	2015-10-08 09:26:23	2015-10-08 09:26:27	Ic5A4FZ14WspRy46Q59CWVEuxbFPTHPlxAp6rkP9	2015-10-08 09:26:27
54	2015-10-07 22:49:50	2015-10-07 22:50:37	190.62.6.88	1	615	2015-10-07 22:49:50	2015-10-07 22:50:33	kjngvN8asvmel8SkItGqDyarlKqN5h8qJ8ufV4No	2015-10-07 22:50:33
77	2015-10-09 11:10:05	2015-10-09 11:10:10	190.5.137.161	1	617	2015-10-09 11:10:05	2015-10-09 11:10:06	UbhwDQBNHYnBFjhsrJS9OEbKvlmNfb0OU2QEAYvb	2015-10-09 11:10:06
61	2015-10-08 09:44:16	2015-10-08 09:44:25	190.62.6.88	1	615	2015-10-08 09:44:16	2015-10-08 09:44:16	PPayp7ZJbJWHmNQuvkOALeiOPYX0KJ09xn5rU5ac	2015-10-08 09:44:16
90	2015-10-09 13:53:50	2015-10-09 13:53:50	64.183.24.210	0	616	2015-10-09 13:53:50	2015-10-09 16:26:04	4inrxDHxO1TBtIq2NN0scBWQsTfgFnFgno1LDPqw	2015-10-09 16:26:04
62	2015-10-08 09:44:47	2015-10-08 09:44:47	190.62.6.88	0	615	2015-10-08 09:44:47	2015-10-08 09:45:04	TdbpKYkiTf4fXXgSlO0jkriTPODFZWnxfXYGpO7n	2015-10-08 09:45:04
65	2015-10-08 10:33:39	2015-10-08 10:33:39	190.62.6.88	0	605	2015-10-08 10:33:39	2015-10-08 10:36:25	Jz2yCqgNpkEjpeHJCITCc5GHsqTbLjAOyKWRA84i	2015-10-08 10:36:25
74	2015-10-09 10:43:13	2015-10-09 17:57:33	64.183.24.210	1	611	2015-10-09 10:43:13	2015-10-09 17:54:26	xSnQcZ5vauke43zzAm7rZikx4iRDIxmvlsJN925B	2015-10-09 17:54:26
67	2015-10-08 17:10:01	2015-10-08 17:10:01	190.99.60.93	0	605	2015-10-08 17:10:01	2015-10-08 19:47:41	l5a05SumPGov0upEEu22ZpsEZswgW5K5SmW9zbi6	2015-10-08 19:47:41
75	2015-10-09 10:51:01	2015-10-09 10:51:01	190.5.137.161	0	618	2015-10-09 10:51:01	2015-10-09 15:07:35	AXbTwEIxAR7LR1X3aRF012Zp5mtsNlIr4di5BKaP	2015-10-09 15:07:35
83	2015-10-09 11:24:13	2015-10-09 11:32:56	190.5.137.161	1	620	2015-10-09 11:24:13	2015-10-09 11:32:48	tIe5DXYNlujH8AhsSq03qdD3Fx8roWWtFBlxDZ7t	2015-10-09 11:32:48
78	2015-10-09 11:10:14	2015-10-09 11:11:44	190.5.137.161	1	617	2015-10-09 11:10:14	2015-10-09 11:11:29	UQYBzhbDU3oy9TLmgOS3RtdySnV4wnRFl7cGd83p	2015-10-09 11:11:29
60	2015-10-08 09:32:41	2015-10-08 10:26:11	64.183.24.210	1	611	2015-10-08 09:32:41	2015-10-08 09:37:10	N2wlpJgph4nmbfh1oNowuUKMRfR42YpJCjPEG4fj	2015-10-08 09:37:10
84	2015-10-09 11:33:04	2015-10-09 11:33:07	190.5.137.161	1	620	2015-10-09 11:33:04	2015-10-09 11:33:04	5r6fzuqxWire354jjTOM3WApDEkcmccJFv8jvO2U	2015-10-09 11:33:04
66	2015-10-08 12:56:55	2015-10-08 17:09:19	190.99.60.93	1	605	2015-10-08 12:56:55	2015-10-08 16:16:34	c5HGanxmiQz1nUIj0CsK33Xbh1DqGzxO0ZQP35kG	2015-10-08 16:16:34
81	2015-10-09 11:13:58	2015-10-09 11:13:58	54.165.243.229	0	605	2015-10-09 11:13:58	2015-10-09 11:14:47	MrOgcuW2bNyUcCh4ypChz6TmsDYwzZwaE43EBYcY	2015-10-09 11:14:47
64	2015-10-08 10:26:49	2015-10-09 10:39:36	64.183.24.210	1	611	2015-10-08 10:26:49	2015-10-09 10:12:11	uE2qDL2B2iOoN7yoagqwcWJrCuKo9CePi7dmtLuS	2015-10-09 10:12:11
71	2015-10-09 10:39:52	2015-10-09 10:39:56	64.183.24.210	1	616	2015-10-09 10:39:52	2015-10-09 10:39:52	qjttsb8ai96g7MMcjQw0PokY61hyEfPgkv0TjGjF	2015-10-09 10:39:52
68	2015-10-08 19:51:06	2015-10-08 19:51:06	190.99.60.93	0	605	2015-10-08 19:51:06	2015-10-08 20:02:11	yutjPRPblUucyScZAkB3ln6M0E2MaZMcAPrUprZV	2015-10-08 20:02:11
93	2015-10-09 17:45:30	2015-10-09 17:45:30	190.62.6.88	0	615	2015-10-09 17:45:30	2015-10-09 18:40:08	a65FQtJLJDpFen1siuzlHhrFT26XiQ3jqObF1Uvz	2015-10-09 18:40:08
63	2015-10-08 09:50:45	2015-10-08 09:50:45	190.62.6.88	0	615	2015-10-08 09:50:45	2015-10-10 09:10:09	kEvb1ZLd3t0vtqPlT7Z64yzR4SxOSlhGqbYjmN72	2015-10-10 09:10:09
88	2015-10-09 11:39:25	2015-10-09 11:39:25	190.5.137.161	0	621	2015-10-09 11:39:25	2015-10-09 15:46:10	Jd1Iinqy0a99e5v9eEnblDydRAE1FTgMhD4mMdFz	2015-10-09 15:46:10
85	2015-10-09 11:33:12	2015-10-09 11:33:22	190.5.137.161	1	620	2015-10-09 11:33:12	2015-10-09 11:33:21	t2z1kSCYIqu3rgsb2kmsguprKlDxtGucpTB99HTq	2015-10-09 11:33:21
79	2015-10-09 11:10:57	2015-10-09 11:10:57	173.63.111.134	0	605	2015-10-09 11:10:57	2015-10-09 11:15:16	6MhxwHG8sYIhjfGWwGT6t39ZzzEJeWB6hYaCDL8B	2015-10-09 11:15:16
82	2015-10-09 11:15:23	2015-10-09 11:15:23	190.5.137.161	0	622	2015-10-09 11:15:23	2015-10-09 16:13:09	YemATWwI7eHUEXSe7BVJBD4xhc1zqYTY8CG0ChCR	2015-10-09 16:13:09
89	2015-10-09 13:19:53	2015-10-09 13:53:35	64.183.24.210	1	616	2015-10-09 13:19:53	2015-10-09 13:53:20	rFYGmxRGVJFiOFTvLC0dhwxcjwm13XuhFgLxkEcR	2015-10-09 13:53:20
86	2015-10-09 11:33:25	2015-10-09 11:33:25	190.5.137.161	0	620	2015-10-09 11:33:25	2015-10-09 11:33:25	ZFre2Jy9hfyqVbBn7fDcUwf7qDcnIPit9bTSJsX4	2015-10-09 11:33:25
91	2015-10-09 13:56:55	2015-10-09 13:56:55	64.183.24.210	0	614	2015-10-09 13:56:55	2015-10-09 15:56:43	joOPBRdK4VqJPVQJGE29FkoOqz0icCo3FP5DtYOb	2015-10-09 15:56:43
87	2015-10-09 11:33:33	2015-10-09 11:33:33	190.5.137.161	0	620	2015-10-09 11:33:33	2015-10-09 16:19:12	88iQHfZQP2zy753VCLCWgKLu9IShCC5PGh2ueBcE	2015-10-09 16:19:12
80	2015-10-09 11:11:46	2015-10-09 11:11:46	190.5.137.161	0	617	2015-10-09 11:11:46	2015-10-09 15:46:36	P9gcsO1XtKAZTvzGmqYPSdxVbWcpJdhMNMd3R53b	2015-10-09 15:46:36
94	2015-10-09 20:37:39	2015-10-09 20:37:39	190.62.6.88	0	615	2015-10-09 20:37:39	2015-10-09 21:54:04	1ofOGrvyH7gREeK0vtOGkFe33uyMOcyXnFFhWOa5	2015-10-09 21:54:04
92	2015-10-09 15:51:35	2015-10-09 15:51:35	190.5.137.161	0	617	2015-10-09 15:51:35	2015-10-09 16:57:32	tLimqYDjARDFx5dhGz6WO4SIY7mPAKxKZhx9xDVN	2015-10-09 16:57:32
\.


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sessions_id_seq', 94, true);


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

COPY users (id, name, email, password, remember_token, created_at, updated_at, is_admin, deleted_at, expiration) FROM stdin;
620	Wilbert S.	wilbert.sanchez@onesourcescheduling.com	$2y$10$Ws9u0QHY9KaLeets.Dx/l.7MxbBcf3yeqy.Rv3sUT4pqRFRwLz2T.	\N	2015-10-06 12:17:18	2015-10-09 10:11:20	0	\N	\N
622	Xiomara M.	xiomara@providencescheduling.com	$2y$10$cn4EpBYTi/A12Bpn0fegYeuFUvw4t2YltnCESdVxKO058H4TyamP6	\N	2015-10-06 12:30:03	2015-10-09 10:12:07	0	\N	\N
618	Benjamin P.	benjamin.portal@onesourcescheduling.com	$2y$10$kkKWGvFdDI8llwRhW5LhBe5.27VoOcikRFVmjXHQo2RHN5j4iFCqi	\N	2015-10-06 12:07:15	2015-10-09 10:50:56	0	\N	\N
605	Jessica Rivera	jessica@rmpublicidad.com.sv	$2y$10$v66IHeiGIPISLYyZLeL9HeSSL3YPBF/AGaMgtrCTSHhWLRU.FVI1S	\N	2015-08-04 07:37:57	2015-10-08 09:22:27	1	\N	\N
615	David Martínez	david@rmpublicidad.com.sv	$2y$10$XEZkL3tHzix9/t8bNv4S.u17QPACSpqn33/HiyUHdppKTrFGcMtWS	\N	2015-10-06 11:43:42	2015-10-08 09:22:33	1	\N	\N
623	Josue Chávez	josue.chavez@tecninfos.com	$2y$10$2MKxxuvNlSO41uvlKsMgsemj.JA7NTfw.JxzTEn1WQGIL27qs6fdO	\N	2015-10-06 12:31:41	2015-10-08 09:22:44	1	\N	\N
611	Lily E.	lily.martinez@onesourcescheduling.com	$2y$10$76cH6IvpZD./tUksBIiVd.V2th4r28ZQgz92kLiQdlzg3h86mBc8O	\N	2015-10-06 11:40:15	2015-10-08 09:23:32	1	\N	\N
617	Alejandra O.	alejandra.orellana@onesourcescheduling.com	$2y$10$.jvRxyPpHVjue6lqLDqV5OxoX2uf0zFIvQyyUdDXGeQ/dABxU1iTu	\N	2015-10-06 12:05:54	2015-10-08 09:25:03	0	\N	\N
613	Claudia	claudia.morales@providencescheduling.com	$2y$10$MA3mNvTmLq1HLJjysljdsOtPdXXhrNPfbv8BZuRlWWo1AAh7iT1xe	\N	2015-10-06 11:42:15	2015-10-08 09:28:53	1	\N	\N
616	Isabel M.	isabel.morales@onesourcescheduling.com	$2y$10$S1R/4LwNW9vg5XzpL0leqeZB9wkd9YvHyRGKO3HWjPEL0bkKnUppK	\N	2015-10-06 12:04:47	2015-10-08 09:29:57	0	\N	\N
612	Pablo Rodríguez	javier.rodriguez@onesourcescheduling.com	$2y$10$aH8zMEUXMqapzkZLr218Q.VX7/rCP8DGYUHASi2vYIJ7vgKbRNQNW	\N	2015-10-06 11:41:45	2015-10-08 09:30:31	1	\N	\N
614	Daisy M.	daisy.marquez@onesourcescheduling.com	$2y$10$DTbaUM.aQ4eywHD.iTFXnOMyEF.c/tPZjhdf2x9NpiKKnlFohNkye	\N	2015-10-06 11:43:05	2015-10-08 10:15:58	1	\N	\N
619	Carlos M.	carlos@example.com	$2y$10$ep3OrNTBuwFg30rJVcTQN.cmU575S0IkPFbL8px4laiumq4NYLYc6	\N	2015-10-06 12:08:20	2015-10-08 10:27:07	0	2015-10-08 10:27:07	\N
621	Rene L.	rene.lopez@onesourcescheduling.com	$2y$10$THNOnlL5iaiiy9s/esIMqOpZdJFk/JBCre6WsQ/z15NfPhH.Zu.5O	\N	2015-10-06 12:18:45	2015-10-09 10:09:43	0	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 623, true);


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
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


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

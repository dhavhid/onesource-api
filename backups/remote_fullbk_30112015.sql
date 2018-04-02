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
    is_doctor_mpn smallint DEFAULT 0,
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
    date_moved timestamp(0) without time zone,
    clinic_notes text,
    patient_treating smallint DEFAULT 0,
    next_appt character varying(250),
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
            WHEN (clinics.name IS NOT NULL) THEN concat(clinics.name, ', ', clinics.address1, ', ', clinics.city, ' CA, ', clinics.zipcode)
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
612	Rezai & Assc.	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
613	Gabriel Martinez	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
614	Jon M. Woods	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
615	Maricela Bermudez	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
616	Payman Zargari	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
618	Kyle Nielsen	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
619	Nielsen & Assc.	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
620	Patrick Saboorian	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
622	Steve K. Marks	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
623	Michael Holmes	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
624	Kampf Schiavone	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
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
641	Ronald Canter	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
646	Chahine & Associates	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
647	Garret Law Group	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
648	Mitchell & Shea	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
649	Moses Luna	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
651	Prussak Welch & Avila	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
653	Rawa Law Group	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
655	Glauber Berenson	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
659	Oracle Law Firm	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
661	Paris Law Group	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
663	Sef Krell	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
664	Steven Sapera	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
667	Cleveland & Metz	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
668	William Lindheim	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
679	Telleria Telleria & Levy LLP	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
682	Pisegna & Zimmerman	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
685	Pacific Attorneys	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
690	Raphael Hedwat	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
625	Alexander Rosenburg	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-14 12:10:38	2015-10-14 12:10:38
676	Angel Carrazco Jr	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-14 12:10:38	2015-10-14 12:10:38
638	Arteaga & Assc.	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-14 12:10:38	2015-10-14 12:10:38
637	Arteaga & Garcia	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-14 12:10:38	2015-10-14 12:10:38
640	Barkhordarian Law Firm	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-14 12:10:38	2015-10-14 12:10:38
642	Barry Hinden	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-14 12:10:38	2015-10-14 12:10:38
643	Bazan Huerta	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-14 12:10:38	2015-10-14 12:10:38
644	Berger & Michelena	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-14 12:10:38	2015-10-14 12:10:38
645	Bigonger Law	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-14 12:10:38	2015-10-14 12:10:38
695	Brian W. Freeman	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-14 12:10:38	2015-10-14 12:10:38
669	Carlin & Buchsbaum	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-14 12:10:38	2015-10-14 12:10:38
660	Dial & Associates	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
674	Diefer Law Group	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
688	Dulio R. Chavez	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
677	Eric Levine	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
678	Goldschmid Silver & Spindel	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
657	Haleh Shekarchian	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
691	Invictus Law	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
656	Jarod Parker	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
639	Julia Mac	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
680	Kaeni Law	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
684	Kamyar R. Shayan	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
673	Legacy Pro Law	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
665	Leo H. Hernandez	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
636	Levy Ford	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
611	Lionel Giron	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
700	Martin von Mizener	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
617	Maxwell Agha	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
666	Miles & Hatcher	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
675	Miller & Chavez	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
687	Richard Sanedin	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
650	Rodriguez & King	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
662	Ruth Prager	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
652	Sarah Dini	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
621	Sean O'keefe	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
671	Silberman & Lam	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
694	William Cort	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
670	William Kropach	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:59:19	2015-11-24 08:59:19
658	Williams Abrego & Associates	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:59:19	2015-11-24 08:59:19
699	William Vallegos	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:59:19	2015-11-24 08:59:19
672	Wilshire Law Center	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:59:19	2015-11-24 08:59:19
686	Wilson Kyncl	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:59:19	2015-11-24 08:59:19
711	Farrah Maribel	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-05 11:49:37	\N
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
708	Brent Romney	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-14 12:10:38	2015-10-14 12:10:38
715	Briles & Associates	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-14 12:10:38	2015-10-14 12:10:38
784	Johnny Aviles DC	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
785	Phong H. Tran MD	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
786	Robert MacArthur MD/Ortho Surgeon	(999) 999-9999	\N	\N	0	\N	2015-10-05 12:13:17	2015-10-05 12:13:17	\N
713	Gary Merkle	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
704	Goldman Magdalin & Krikes LLP	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
701	Jones Legal	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
716	Leigh Jacobs	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
707	Lionel Ciro Sapetto	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
717	London & Nguyen	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
709	Michael Yadegari	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
714	Richard A. Fisher	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
705	Tamar A. Ekizian	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
712	Ton Law Center	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
703	Westphal Law Group	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
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
817	RSnyder Law	(714) 442-1551	\N	sacevedo@rsnyderlaw.com	1	1325	2015-10-14 10:54:07	2015-10-14 10:54:07	\N
654	Ainbinder & Pratt	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-14 12:10:38	2015-10-14 12:10:38
681	Albert D'Antin & Associates	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-14 12:10:38	2015-10-14 12:10:38
698	Bob Nehoray	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-14 12:10:38	2015-10-14 12:10:38
693	Bomberg  Benson & Garrett	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-10-14 12:10:38	2015-10-14 12:10:38
818	Bankers Hill	(619) 230-0330	\N	michelle.martinez@bhlflaw.com	1	1176	2015-10-30 15:44:51	2015-10-30 15:44:51	\N
819	Rostam Kavoosi, MD	(951) 682-4404	\N	scheduling@keystonemedicalgroup.com	0	1335	2015-11-05 13:56:15	2015-11-05 13:56:15	\N
820	William Simpson/ Ortho	(999) 999-9999	\N	sophia@innovativemedmgmt.com	0	1153	2015-11-06 14:43:55	2015-11-06 14:43:55	\N
821	Satish Lal, Ortho	(951) 682-4404	\N	scheduling@keystonemedicalgorup.com	0	1335	2015-11-09 16:23:11	2015-11-09 16:23:20	\N
822	Tosha Brown MD	(999) 999-9999	\N	acs@premiermedicalmarketing.com	0	1077	2015-11-10 13:42:38	2015-11-10 13:42:38	\N
823	Tiffany Nguyen, DC	(999) 999-9999	\N	linda@billing-office.com	0	1334	2015-11-12 16:04:03	2015-11-12 16:04:03	\N
824	Sherry Rostami, DC	(800) 850-2693	\N	acs@premiermedicalmarketing.com	0	1077	2015-11-17 13:50:29	2015-11-17 13:50:29	\N
825	William Simpson, MD	(562) 696-1441	\N	sophia@innovativemedmgmt.com	0	1153	2015-11-18 09:37:08	2015-11-18 09:37:08	\N
826	Mitchell Law Corporation	(310) 571-1857	\N	\N	1	1168	2015-11-23 09:07:41	2015-11-23 09:07:41	\N
697	Christopher J. Trodden	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
706	Christopher Lauria	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
702	Christopher Rhodes	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
689	Genaro Legorretta	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
683	Kiara Andino	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
710	Napolin Law Firm	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
696	Peyman & Rahnama	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
692	Spalding & Spalding	(999) 999-9999	\N	\N	1	\N	2015-10-05 11:49:37	2015-11-24 08:58:59	2015-11-24 08:58:59
827	Ainbinder and Pratt	(562) 498-4600	\N	\N	1	1168	2015-11-24 09:00:00	2015-11-24 09:00:00	\N
\.


--
-- Name: attorneys_doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('attorneys_doctors_id_seq', 827, true);


--
-- Data for Name: bodyparts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bodyparts (id, name, created_at, updated_at) FROM stdin;
87	PSYCH	2015-10-12 14:18:46	2015-10-12 14:18:46
88	STRESS	2015-10-12 14:18:51	2015-10-12 14:18:51
89	SLEEP DISORDER	2015-10-12 14:19:04	2015-10-12 14:19:04
90	DEPRESSION	2015-10-12 14:19:13	2015-10-12 14:19:13
91	SEXUAL DYSFUNCTION	2015-10-12 14:19:26	2015-10-12 14:19:26
92	HERNIA	2015-10-12 14:19:33	2015-10-12 14:19:33
93	GROIN	2015-10-12 14:19:43	2015-10-12 14:19:43
94	EYES	2015-10-12 14:19:48	2015-10-12 14:19:48
95	R / SHOULDER	2015-10-12 14:20:11	2015-10-12 14:20:11
96	L / SHOULDER	2015-10-12 14:20:21	2015-10-12 14:20:21
97	R / ARM	2015-10-12 14:20:33	2015-10-12 14:20:33
98	L / ARM	2015-10-12 14:20:41	2015-10-12 14:20:41
99	R / ELBOW	2015-10-12 14:20:55	2015-10-12 14:20:55
100	L / ELBOW	2015-10-12 14:21:04	2015-10-12 14:21:04
101	R / FOREARM	2015-10-12 14:21:41	2015-10-12 14:21:41
102	L / FOREARM	2015-10-12 14:21:48	2015-10-12 14:21:48
103	R / WRIST	2015-10-12 14:21:58	2015-10-12 14:21:58
104	L / WRIST	2015-10-12 14:22:07	2015-10-12 14:22:07
105	R / HAND	2015-10-12 14:22:22	2015-10-12 14:22:22
106	L / HAND	2015-10-12 14:22:29	2015-10-12 14:22:29
107	FINGERS	2015-10-12 14:22:37	2015-10-12 14:22:37
108	R / RIBS	2015-10-12 14:22:45	2015-10-12 14:22:45
109	L / RIBS	2015-10-12 14:22:56	2015-10-12 14:22:56
110	R / LEG	2015-10-12 14:23:04	2015-10-12 14:23:04
111	L / LEG	2015-10-12 14:23:10	2015-10-12 14:23:10
112	R / KNEE	2015-10-12 14:23:26	2015-10-12 14:23:26
113	L / KNEE	2015-10-12 14:23:38	2015-10-12 14:23:38
114	R / FOOT	2015-10-12 14:23:46	2015-10-12 14:23:46
115	L / FOOT	2015-10-12 14:23:54	2015-10-12 14:23:54
116	TOES	2015-10-12 14:24:03	2015-10-12 14:24:03
117	R / ANKLE	2015-10-12 14:24:13	2015-10-12 14:24:13
118	L / ANKLE	2015-10-12 14:24:26	2015-10-12 14:24:26
119	R / HIP	2015-10-12 14:24:36	2015-10-12 14:24:36
120	L / HIP	2015-10-12 14:24:43	2015-10-12 14:24:43
121	R / UPPER EXT	2015-10-12 14:24:59	2015-10-12 14:24:59
122	L / UPPER EXT	2015-10-12 14:25:11	2015-10-12 14:25:11
123	L / LOWER EXT	2015-10-12 14:25:21	2015-10-12 14:25:21
124	R / LOWER EXT	2015-10-12 14:25:29	2015-10-12 14:25:29
125	R / THIGH	2015-10-12 14:25:55	2015-10-12 14:25:55
126	L / THIGH	2015-10-12 14:26:02	2015-10-12 14:26:02
127	NEURO	2015-10-12 16:22:26	2015-10-12 16:22:26
128	BACK	2015-10-22 13:47:02	2015-10-22 13:47:02
78	HEAD	2015-10-12 14:16:56	2015-10-12 14:16:56
80	NECK	2015-10-12 14:17:22	2015-10-12 14:17:22
81	UPPER BACK	2015-10-12 14:17:45	2015-10-12 14:17:45
82	MID BACK	2015-10-12 14:17:56	2015-10-12 14:17:56
83	LOWER BACK	2015-10-12 14:18:05	2015-10-12 14:18:05
84	CHEST	2015-10-12 14:18:13	2015-10-12 14:18:13
85	WAIST	2015-10-12 14:18:23	2015-10-12 14:18:23
86	COCCYX	2015-10-12 14:18:33	2015-10-12 14:18:33
129	SPINE	2015-11-12 11:19:06	2015-11-12 11:19:06
130	ABDOMEN	2015-11-17 11:09:26	2015-11-17 11:09:26
\.


--
-- Name: bodyparts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bodyparts_id_seq', 130, true);


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
10354	2015-11-11	2015-11-11	Workers Compensation	Alfredo	Mendez	1960-03-03	\N	(626) 262-8494	\N	\N	4937 Peck Road Apt. H	\N	\N	El Monte	\N	91732	CT: 03-16-2014- 03-01-2015	R / HAND,L / HAND,L / WRIST,R / WRIST,R / LEG,LOWER BACK,BACK,R / SHOULDER	\N	\N	0	Atlantic Seafood, Inc	1176	612	<p>-----[Nov-18-15 03:34 PM Isabel M.]-----</p><p>La clinica informo que el telefono esta malo y que no pueden hacer el Historial y hable con L/O y no tienen otro numero para el cliente, ellos van enviarle una carta al cliente</p><p>-----[Nov-13-15 10:26 AM Isabel M.]-----</p><p>Vanessa Llamo que el cliente queria cambio para el dia Martes o Jueves, hable a la clinica y el Dr. solo esta loos dias Lunes, hable con el cliente y dice que deje su cita como esta</p><p>-----[Nov-11-15 02:26 PM Isabel M.]-----</p><p>Envie documentos a clinica y cita L/O</p><p>-----[Nov-11-15 12:30 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">West Covina/Multi-Care @ 5.52\nmiles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Whittier/Ford @ 11.34 miles</p><p class="MsoNormal">El cliente queria una clinica en El Monte y &nbsp;Lily Autorizo Greenfield/El Monte</p><p class="MsoNormal"><o:p></o:p></p></p>	1074	774	Maggie	2015-11-23 13:00:00	2	\N	\N	<p>-----[Nov-11-15 02:26 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-11 12:30:08	2015-11-18 15:34:51	616	616	\N
10418	2015-11-18	2015-11-18	Workers Compensation	Ramon	Barajas Pulido	1995-10-26	603-86-6028	(661) 421-8231	\N	(661) 779-2016	2342 S.  K St	\N	\N	Bakersfield	\N	93304	CT: 11-05-2014 - 11-05-2015	LOWER BACK,L / FOOT,R / FOOT	\N	1248	1	USA Staffing Services	1176	612	<p>-----[Nov-18-15 11:17 AM Isabel M.]-----</p><p>Envie cita L/O y documentos a clinica</p>	1159	808	Alex	2015-12-03 12:00:00	2	\N	\N	<p>-----[Nov-18-15 11:17 AM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-18 11:17:22	2015-11-18 11:17:22	616	616	\N
10508	2015-11-24	2015-11-24	Workers Compensation	Yolanda P.	Olivares	1971-07-03	602-37-1546	(661) 309-7858	\N	\N	27940 Solamint Rd	\N	Apt 9-103	Canyon Country	\N	91387	CT: 10/05/2014-10/05/2015	NECK,R / SHOULDER,R / ARM,R / HIP,L / HIP,SPINE,R / LEG,L / LEG,R / FOOT,HEAD,SLEEP DISORDER	\N	\N	0	Del Taco LLC	1169	610	\N	1115	731	Yanira	2015-12-08 11:00:00	\N	\N	\N	\N	0	\N	\N	\N	2015-11-25 10:42:41	2015-11-25 10:42:41	611	611	\N
10296	2015-11-06	2015-11-06	Workers Compensation	Urbano Tirso	Santos	1968-01-24	794-79-5630	(626) 624-3351	\N	\N	502 Deepmead Avenue	\N	\N	La Puente	\N	91744	CT: 10/21/2014 - 11/04/2015	R / SHOULDER,L / SHOULDER,L / ARM,L / ELBOW,L / WRIST,BACK,R / HIP,NECK	right buttock	1267	1	Southern California Produce, Inc	1176	612	<p>-----[Nov-10-15 10:31 AM Daisy M.]-----</p><p>Per Vanessa cancel.&nbsp;</p><p>-----[Nov-06-15 03:11 PM Daisy M.]-----</p><p>Advised Jesselin @ L/O that we have in our notes that insurance company does not have an MPN link, asked her to advise on how to proceed.&nbsp;</p>	1326	\N	\N	\N	\N	54	2015-11-10 10:30:00	\N	0	\N	\N	\N	2015-11-06 14:25:47	2015-11-10 10:31:33	614	614	\N
10331	2015-11-10	2015-11-10	Workers Compensation	Pedro	Canales	1986-12-21	610-23-0645	(562) 624-8957	\N	\N	4628 Bresee Avenue	\N	\N	Baldwin Park	\N	91706	09/20/2015	R / HAND,R / WRIST	\N	1207	0	Makridis Inc	1174	612	\N	1077	822	Rebeca	2015-11-11 13:30:00	1	\N	\N	\N	1	\N	Rebecca	2015-11-11	2015-11-10 13:39:52	2015-11-17 09:09:00	614	611	\N
10215	2015-11-02	2015-11-02	Workers Compensation	Sergio	Gonzalez	1970-05-12	608-43-4108	(714) 351-4532	\N	\N	811 W. Romneya Dr. Apt 1	\N	\N	Anaheim	\N	92801	08-07-2015	R / FOOT,L / FOOT,L / ANKLE,L / THIGH,L / LEG	L. buttock	\N	0	Pacific Landmark International	1176	612	<p>-----[Nov-02-15 03:19 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Aun/Anaheim @ 6.64 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Santa Ana/Keystone @ 12.56 miles&nbsp;</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica y cit L/O</span><br></p></p>	1072	743	Lorena	2015-11-05 10:00:00	2	\N	\N	<p>-----[Nov-02-15 04:32 PM Isabel M.]-----</p><p>Conf. con Pt</p>	1	\N	Adriana	2015-11-05	2015-11-02 15:19:36	2015-11-06 11:39:49	616	611	\N
10206	2015-11-02	2015-11-02	Workers Compensation	Rosa Maria	Santillan	1965-10-14	\N	(661) 379-4058	\N	(661) 748-6522	2701 Lake St.	\N	\N	Bakersfield	\N	93306	CT: 10-28-2014 - 10-28-2015	LOWER BACK,R / ARM,L / ARM,L / WRIST,R / WRIST,R / HAND,L / HAND,R / ELBOW,L / ELBOW,L / KNEE	L. thumb finger	\N	0	Esparza Enterprises, Inc	1176	612	<p>-----[Nov-02-15 02:55 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-02-15 09:36 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Bakersfield/BMG @ 2.48 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">VanNuys/NobleQuest @ 105.59 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie &nbsp;docuemntos a clinica para cita</span><br></p></p>	1159	808	Alex	2015-11-12 13:30:00	2	\N	\N	<p>-----[Nov-02-15 02:55 PM Isabel M.]-----</p><p>Conf. con Pt</p>	1	2015-12-10 12:15:00	Alex	2015-11-12	2015-11-02 09:36:45	2015-11-18 16:54:33	616	611	\N
10209	2015-11-02	2015-11-02	Workers Compensation	Adriana	Romero	1986-01-19	979-85-7274	(818) 288-3574	\N	\N	15809 Vanowen St #3	\N		Van Nuys	\N	91406	CT: 01/01/2015 - 10/01/2015	STRESS,DEPRESSION,NECK,SLEEP DISORDER	headaches	\N	0	Diesel Products Ins	1325	817	<p>-----[Nov-06-15 11:35 AM Lily E.]-----</p><p>Per Marilyn @ clinic the client was a no show on 11/04 but she spoke to the client and R/S for 11/10 @ 2:45 PM</p><p>-----[Nov-02-15 12:03 PM Daisy M.]-----</p><p>Pending appt from Van Nuys / NobleQuest.&nbsp;</p>	1152	797	Henry	2015-11-10 14:45:00	1	\N	\N	\N	1	\N	Marilyn	2015-11-10	2015-11-02 12:03:11	2015-11-12 11:46:28	614	611	\N
10302	2015-11-06	2015-11-06	Workers Compensation	Israel	Solano	1984-12-04	614-09-3417	(619) 538-3292	\N	(760) 216-9567	534 Massachusetts Ave.	\N	\N	Vista	\N	92084	CT: 05-25-2014 - 05-25-2015	LOWER BACK,R / ARM,R / KNEE,L / KNEE	\N	\N	0	RC Wendt painting, Inc	1176	612	<p>-----[Nov-06-15 03:37 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Rancho Bernardo/RB @ 22.46 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Murrieta/Gogatz @ 29.44 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">El cliente dice que muy lejos, envie correo a L/O</span><br></p></p>	1326	\N	\N	\N	\N	48	2015-11-06 15:35:00	\N	0	\N	\N	\N	2015-11-06 15:37:07	2015-11-06 15:42:23	616	616	\N
10218	2015-11-02	2015-11-02	Personal Injury	Ana Deysi	Rivera	1953-07-26	609-18-8524	(818) 219-8048	\N	(818) 277-8121	11244 Woodcock Ave	\N	\N	Pacoima	\N	91331	10/28/2015	NECK,MID BACK,LOWER BACK	right side of waist	\N	0	\N	1176	612	<p>-----[Nov-02-15 04:33 PM Daisy M.]-----</p><p>Reseda / MedNation&nbsp;</p>	1115	736	Jordy	2015-11-05 10:00:00	2	\N	\N	\N	1	\N	Yanira	2015-11-05	2015-11-02 16:33:29	2015-11-09 13:49:16	614	611	\N
10489	2015-11-24	2015-11-24	Workers Compensation	Jose De Jesus	Magallanes Gomez	1959-11-18	607-14-8717	(661) 401-9890	\N	(661) 746-4537	P.O Box 782	\N	\N	Shafter	\N	93263	CT: 11-16-2014 -11-16-2015	HEAD,R / HIP,R / FOOT,R / ANKLE	\N	\N	0	Con- Fab  California Corporation	1176	612	<p>-----[Nov-24-15 04:41 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-24-15 11:35 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Bakersfield/BMG @ 23.79 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 112.59 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica</span><br></p></p>	1159	808	Alex	2015-12-10 10:00:00	2	\N	\N	\N	0	\N	\N	\N	2015-11-24 11:35:43	2015-11-24 16:41:41	616	616	\N
10225	2015-11-02	2015-11-02	Workers Compensation	Josefina	Gonzalez	1992-10-06	\N	(805) 253-5218	\N	\N	709 E. Scott St.	\N	\N	Port Hueneme	\N	93041	CT: 10-27-2014 - 10-29-2015	CHEST,BACK	\N	\N	0	Santa Paula	1176	612	<p>-----[Nov-03-15 09:15 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p>Reseda/MedNation @ 43.24 Miles</p><p>NobleQuest/Van Nuys @ 49.13 Millas</p><p>A la cliente le parece lejos</p><p class="MsoNormal"><o:p></o:p></p>\n\n<br><p><br></p><p><br></p></p>	1326	\N	\N	\N	\N	48	2015-11-02 15:00:00	\N	0	\N	\N	\N	2015-11-03 09:15:59	2015-11-03 09:15:59	616	616	\N
10208	2015-11-02	2015-11-02	Workers Compensation	Juan	Aguilar	1945-06-24	911-09-5625	(760) 485-1833	\N	\N	91108 Gardenia Court	\N	\N	Mecca	\N	92254	09/07/2010	L / KNEE	\N	\N	0	Sunrise Colony II Management	1176	612	<p>-----[Nov-03-15 10:38 AM Daisy M.]-----</p><p>Per pt both clinics are too far for him since it is difficult for him to sit for long periods of time due to his injury, he stated he would rather be scheduled in Indio if possible. Advised L/O of pt's request and &nbsp;that case will be cancelled since we have nothing closer for pt.&nbsp;</p><p>-----[Nov-02-15 11:58 AM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>Riverside / Montgomery - 99.04 miles&nbsp;</p><p>SB / Industrial - 92.92 miles&nbsp;</p><p>Called pt to provide him with clinic options, but he did not answer. LDM to call back.&nbsp;</p></p>	1326	\N	\N	\N	\N	48	2015-11-03 10:35:00	\N	0	\N	\N	\N	2015-11-02 11:58:15	2015-11-03 10:38:10	614	614	\N
10219	2015-11-02	2015-11-02	Personal Injury	Osmar	Velasquez	1985-09-07	\N	(714) 929-9129	\N	\N	1309 S. Magnolia Ave	\N	\N	Santa Ana	\N	92707	10-21-2015	LOWER BACK,R / LEG,R / FOOT,R / ARM	\N	\N	0	\N	1176	612	<p>-----[Nov-03-15 09:24 AM Daisy M.]-----</p><p>Conf appt with pt and he requested a text message.&nbsp;</p><p>-----[Nov-02-15 05:34 PM Daisy M.]-----</p><p>Will schedule in Anaheim with Dr. Aun instead, Keystone scheduling until 11-12-2015.</p><p>-----[Nov-02-15 04:35 PM Daisy M.]-----</p><p><p>Keystone / Santa Ana&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1072	743	Vanessa	2015-11-04 10:00:00	5	\N	\N	\N	1	\N	Adriana	2015-11-04	2015-11-02 16:35:43	2015-11-06 11:33:21	614	611	\N
10222	2015-11-02	2015-11-02	Workers Compensation	Maria	Marquez	1969-03-22	\N	(619) 755-2171	\N	\N	1561 Olive Ave	\N	\N	Chula Vista	\N	91911	CT: 10/20/2014 - 10/20/2015	BACK,L / LEG,L / ANKLE,R / HAND,L / HAND	respiratory system, skin	\N	0	Oasis Outsourcing	1176	610	<p>-----[Nov-02-15 04:45 PM Daisy M.]-----</p><p>San Ysidro / RB&nbsp;</p>	1163	741	Alma	2015-11-17 10:00:00	1	\N	\N	\N	\N	\N	\N	\N	2015-11-02 16:45:30	2015-11-03 10:39:44	614	614	\N
10227	2015-11-03	2015-11-03	Workers Compensation	Esperanza	Ledezma	1966-04-01	731-16-0328	(951) 707-6539	\N	(951) 707-6529	5760 Rachel Lane	\N	\N	Jurupa Valley	\N	91752	05/28/2015	BACK,L / WRIST	\N	\N	0	Chartwell Staffing Services DBA Chartwell Staffing Solutions	1176	612	<p>-----[Nov-04-15 03:58 PM Daisy M.]-----</p><p>LDM on VM with appt info and mailed out appt letter.&nbsp;</p><p>-----[Nov-03-15 05:38 PM Daisy M.]-----</p><p>Left message for pt to return my call to provide her with appt details.&nbsp;</p><p>-----[Nov-03-15 10:33 AM Daisy M.]-----</p><p>Pt has a phone Hx on 11-13-2015 @ 12:30 pm.</p><p>-----[Nov-03-15 10:00 AM Daisy M.]-----</p><p><p>Southland Spine / Riverside&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1121	747	Luis	2015-11-17 15:50:00	4	\N	\N	\N	1	2015-12-29 09:20:00	Lupe	2015-11-17	2015-11-03 10:00:29	2015-11-18 12:09:46	614	611	\N
10271	2015-11-05	2015-11-05	Workers Compensation	Gabriel	Zazueta	1978-01-24	603-24-5982	(661) 335-1856	\N	(661) 758-4532	1601 Poso Drive Apt 12	\N	\N	Wasco	\N	93280	08/04/2015	BACK,R / KNEE,R / LEG,GROIN	\N	1247	1	Jakov Dulcich and Sons, LLC	1176	612	<p>-----[Nov-09-15 09:26 AM Daisy M.]-----</p><p><p>Advised L/O that case will be placed on cx status since we have no Dr within the MPN.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-05-15 02:17 PM Daisy M.]-----</p><p><p>Emailed Jesselin/Vanessa @ L/O to advise them that we have no Dr within the MPN.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1326	\N	\N	\N	\N	47	2015-11-09 09:25:00	\N	0	\N	\N	\N	2015-11-05 14:17:48	2015-11-09 09:26:44	614	614	\N
10232	2015-11-03	2015-11-03	Workers Compensation	Jesus	Escobedo	1974-07-26	\N	(714) 675-3130	\N	\N	1411 N. Durant Apt. 104	\N	\N	Santa Ana	\N	92706	1. CT: 01/24/2013 - 10/28/2015    2. 01/24/2013	L / SHOULDER,L / ARM	1. spine     2. left shoulder, spine	1221	0	Power Distribution Inc	1176	610	<p>-----[Nov-03-15 11:04 AM Daisy M.]-----</p><p>Santa Ana / Keystone</p>	1335	793	Jesus	2015-11-12 15:00:00	1	\N	\N	\N	1	\N	Jesus	2015-11-12	2015-11-03 11:04:59	2015-11-17 09:38:44	614	611	\N
10451	2015-11-20	2015-11-20	Workers Compensation	Ricardo	Fernando	1979-09-22	632-98-5571	(760) 673-2037	\N	\N	15786 Ave. Monteflora	\N	\N	Dessert Hot Spring	\N	92240	CT: 02-26-2013- 02-26-2014	HEAD,NECK,STRESS,UPPER BACK,R / LEG,L / LEG,L / FOOT,R / FOOT,CHEST	\N	\N	0	Carlos Enterprises Inc	1176	612	<p>-----[Nov-20-15 12:28 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Montgomery @ 51.25 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Riverside/S. Spine @ 54.69 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Al cliente le parece muy lejos, envie correo L/O</span><br></p></p>	1326	\N	\N	\N	\N	48	2015-11-20 12:25:00	\N	0	\N	\N	\N	2015-11-20 12:28:14	2015-11-20 12:28:14	616	616	\N
10362	2015-11-11	2015-11-11	Workers Compensation	Raul	Magana	1995-03-08	619-80-4132	(909) 440-7962	\N	\N	106 N Orange Avenue	\N	\N	Rialto	\N	92376	CT: 01/09/2015 - 09/09/2015	NECK,BACK	\N	1188	0	Delco Management LLC	1176	612	<p>-----[Nov-11-15 05:26 PM Daisy M.]-----</p><p><p>Per Vanessa @ L/O schedule in in Fontana / LH.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1086	719	Jenny	2015-11-13 14:30:00	2	\N	\N	\N	1	\N	Edwin	2015-11-13	2015-11-11 17:26:57	2015-11-17 10:00:30	614	611	\N
10220	2015-11-02	2015-11-02	Workers Compensation	Elias	Mendez	1979-06-12	\N	(323) 379-7649	\N	\N	412 S. 19th Avenue Apt 7	\N	\N	Los Angeles	\N	90031	1. 10/06/2015    2. CT: 02/01/2015 - 10/20/2015	EYES	2. mouth, right hand, right knee	\N	0	Fairway Staffing Services Inc	1176	610	<p>-----[Nov-10-15 11:09 AM Isabel M.]-----</p><p>El cliente no asistio a la cita que tenia 11-06-2015 @ 9:00AM y se programo otra cita, envie nueva cita L/O</p><p>-----[Nov-10-15 10:32 AM Isabel M.]-----</p><p><span style="line-height: 21.4286px;">Deje mensaje para &nbsp;recuperacion de N/S</span></p><p>-----[Nov-09-15 12:24 PM Lily E.]-----</p><p><p>Per Sonny the client was a no show on 11/06 @ 9 AM (Emailed L/O)</p></p><p>-----[Nov-02-15 04:40 PM Daisy M.]-----</p><p><p>Glendale / Daher&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1087	757	Ana	2015-11-30 09:00:00	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-02 16:40:50	2015-11-10 11:09:43	614	616	\N
10221	2015-11-02	2015-11-02	Workers Compensation	Irma	Garcia	1973-06-15	\N	(714) 395-2746	\N	\N	1823 W. Neighbor Ave Apt 4	\N	\N	Anaheim	\N	92801	10/19/2015	R / HAND,R / ARM,R / SHOULDER,L / SHOULDER,NECK	\N	\N	0	Pro Source	1176	610	<p>-----[Nov-02-15 04:42 PM Daisy M.]-----</p><p>Santa Ana / Keystone&nbsp;</p>	1335	722	Jesus	2015-11-12 14:30:00	1	\N	\N	\N	1	2015-12-17 00:00:00	Jesus	2015-11-12	2015-11-02 16:42:55	2015-11-17 09:39:49	614	611	\N
10399	2015-11-16	2015-11-16	Workers Compensation	Ruben	Llamas	1976-05-10	602-23-3476	(562) 644-1241	\N	\N	12437 Columbia Way	\N	Apt B	Downey	\N	90242	CT: 11/03/2014-11/03/2015	R / SHOULDER,R / ARM,SPINE	Nose	\N	0	Cabinets 2000, Inc	1176	610	\N	1073	743	Marisol	2015-11-24 10:00:00	3	\N	\N	\N	\N	\N	\N	\N	2015-11-16 11:02:22	2015-11-24 09:14:44	611	611	\N
10459	2015-11-20	2015-11-20	Workers Compensation	Abel	Hernandez	1980-01-26	606-16-1320	(323) 915-2600	\N	\N	3237 1/2 E. Cesar Chavez	\N	\N	Los Angeles	\N	90063	04/28/2015	SPINE	\N	1204	1	Finesse Apparel Inc.	1169	610	\N	1074	774	Maggie	2015-12-02 10:00:00	3	\N	\N	\N	\N	\N	\N	\N	2015-11-20 16:42:57	2015-11-30 15:12:29	611	611	\N
10469	2015-11-20	2015-11-20	Workers Compensation	Jose Luis	Campos	1947-07-18	611-12-8842	(661) 229-9996	\N	\N	1306 Madison Street	\N	\N	Delano	\N	93215	09-10-2015	BACK,R / SHOULDER,L / SHOULDER,DEPRESSION	insomnia, Nervous	\N	0	La Vina Contracting	1168	648	\N	1159	808	Alex	2015-12-03 13:00:00	1	\N	\N	\N	0	\N	\N	\N	2015-11-23 09:08:34	2015-11-23 09:08:34	611	611	\N
10340	2015-11-10	2015-11-10	Workers Compensation	Jose	Bernal	1963-08-03	\N	(619) 792-8495	\N	\N	400 Greenfield Dr Spc 19	\N	\N	El Cajon	\N	92021	1. CT: 10/14/2014 - 10/14/2015        2. 10/14/2015	R / HIP,L / HIP,L / KNEE,R / KNEE,L / LEG,R / LEG,SLEEP DISORDER	spine	1304	0	Artistic Marble and Granite Inc	1169	610	<p>-----[Nov-12-15 01:43 PM Daisy M.]-----</p><p>Per Humberto cancel case.</p><p>-----[Nov-11-15 02:37 PM Daisy M.]-----</p><p>Per Humberto do we have any other clinic, advised him we have RB/ Mission Valley @ approx 13.9 miles, but their next appt is for 12-3-2015.</p><p>-----[Nov-11-15 08:35 AM Daisy M.]-----</p><p>Advised Humberto that the soonest appt for pt would be @ SD/ LH for 11-19-2015 &nbsp;which would be the history.&nbsp;</p>	1326	\N	\N	\N	\N	54	2015-11-12 13:40:00	\N	0	\N	\N	\N	2015-11-10 17:00:58	2015-11-12 13:43:11	614	614	\N
10254	2015-11-04	2015-11-04	Workers Compensation	Leslie	Aguilar	1993-11-05	\N	(442) 225-9081	\N	(760) 879-1051	165 E. holt Ave. Apt. 29	\N	\N	El Centro	\N	92243	CT: 08-23-2014 - 08-23-2015	BACK,LOWER BACK,L / LEG,R / LEG	\N	\N	0	El Dorado Care Center LLC	1176	612	<p>-----[Nov-04-15 02:35 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">San Ysidro/RB @ 118.74 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">RB/Mission Valley @ 108.36 miles</p><p class="MsoNormal"><o:p><br></o:p></p><p class="MsoNormal"><o:p>Hable con la cliente y dice estar muy lejos y que tambien esta embarazada, envie correo a L/O</o:p></p></p>	1326	\N	\N	\N	\N	48	2015-11-04 14:35:00	\N	0	\N	\N	\N	2015-11-04 14:35:17	2015-11-04 14:35:17	616	616	\N
10233	2015-11-03	2015-11-03	Workers Compensation	Miguel	Martinez	1992-05-02	605-25-9826	(661) 748-9987	\N	\N	P.O Box 813	\N	\N	Lost Hills	\N	93249	CT: 01-06-2014- 01-06-2015	NECK,BACK,LOWER BACK	\N	\N	0	\N	1176	612	<p>-----[Nov-03-15 11:09 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Bakersfield/BMG @ 56.33 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 137.19 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Hable con el cliente y le parece muy lejos, envie correo a su abogado</span><br></p></p>	1326	\N	\N	\N	\N	48	2015-11-03 11:05:00	\N	0	\N	\N	\N	2015-11-03 11:09:22	2015-11-03 11:09:22	616	616	\N
10280	2015-11-05	2015-11-05	Personal Injury	Antonio	Avila Simaj	1972-03-27	\N	(213) 985-8958	\N	\N	638 W. Corregidor St	\N	\N	Compton	\N	90220	10/31/2015	BACK	\N	\N	0	\N	1176	612	\N	1073	743	Kenny	2015-11-06 14:30:00	2	\N	\N	\N	1	\N	Janelle	2015-11-06	2015-11-05 17:12:34	2015-11-09 13:46:45	614	611	\N
10265	2015-11-04	2015-11-04	Workers Compensation	Vilma	Polanco-Diaz	1980-01-09	048-49-3664	(951) 350-5324	\N	\N	1767 Western Village Drive	\N	\N	San Jacinto	\N	92583	CT: 02-27-2014 - 10/15/2015	LOWER BACK,R / ARM,L / ARM,R / HAND,L / HAND,FINGERS	\N	\N	0	Cardenas Markets, Inc	1176	612	<p>-----[Nov-05-15 09:38 AM Daisy M.]-----</p><p><p>Per Jesselin @ L/O schedule schedule in Murrieta.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-04-15 05:15 PM Daisy M.]-----</p><p><p>Options provided to L/O:&nbsp;</p><p class="MsoNormal"><span style="color:#1F497D;mso-themecolor:dark2">Murrieta /\nGogatz Chiropractic – 27.6 miles<o:p></o:p></span></p><p>\n\n</p><p class="MsoNormal"><span style="color:#1F497D;mso-themecolor:dark2">Riverside /\nKeystone Medical Group – 33.5 miles<o:p></o:p></span></p></p>	1103	745	Ana	2015-11-11 10:00:00	2	\N	\N	\N	1	\N	Ana	2015-11-11	2015-11-04 17:15:52	2015-11-12 10:28:21	614	611	\N
10557	2015-11-30	2015-11-30	Workers Compensation	Juan Carlos	Gomez	1967-07-28	619-21-8384	(714) 277-9965	\N	\N	802 E. Hood Street	\N	\N	Santa Ana	\N	92707	11/09/2015	L / THIGH,L / KNEE,L / LEG,L / FOOT	left calf	\N	0	Patrick Mata DBA Premium Green Landscape	1168	690	<p>-----[Nov-30-15 03:42 PM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p class="MsoPlainText">Santa Ana / Keystone - 3.22 miles<o:p></o:p></p><p>\n\n</p><p class="MsoPlainText">Anaheim / SoCal Chiros - 6.73 miles<o:p></o:p></p></p>	1330	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2015-11-30 15:42:32	2015-11-30 15:42:32	614	614	\N
10228	2015-11-03	2015-11-03	Workers Compensation	Michael Alan	Sibley	1965-03-19	563-65-3854	(619) 206-6612	\N	\N	2892 Market St.	\N	\N	San Diego	\N	92102	09-01-2014	BACK,NECK,HEAD	\N	\N	0	Tag Roofing and Construction	1176	612	<p>-----[Nov-06-15 04:26 PM Daisy M.]-----</p><p>LDM on VM 2x's</p><p>-----[Nov-05-15 02:05 PM Daisy M.]-----</p><p>Called pt to provide him with appt details, but he did not answer and I was unable to leave a message.&nbsp;</p><p>-----[Nov-03-15 02:15 PM Daisy M.]-----</p><p>Per pt schedule in Mission Valley.&nbsp;</p><p>-----[Nov-03-15 10:28 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">RB/mission Valley @&nbsp; 7.55\nmiles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">RB/San Ysidro @ 15.56 miles<o:p></o:p></p></p>	1162	741	Linda	2015-11-17 09:00:00	4	\N	\N	\N	\N	\N	\N	\N	2015-11-03 10:28:17	2015-11-06 16:26:02	616	614	\N
10270	2015-11-05	2015-11-05	Workers Compensation	Eva	Garcia Segura	1962-08-05	612-12-1716	(714) 574-0287	\N	\N	2119 Oak St.	\N	\N	Santa Ana	\N	92707	CT: 05-15-2014 - 05-15-2015	R / WRIST,L / SHOULDER,L / FOOT,L / ANKLE,SLEEP DISORDER,HEAD	\N	1194	0	Port Logistics Group	1176	610	<p>-----[Nov-05-15 12:38 PM Isabel M.]-----</p><p>Envie cita L/O y documentos a clinica</p>	1335	819	Raquel	2015-11-12 12:00:00	1	\N	\N	\N	1	\N	Jesus	2015-11-12	2015-11-05 12:38:20	2015-11-17 09:38:07	616	611	\N
10470	2015-11-20	2015-11-20	Workers Compensation	Georgina Liceth	Orozco	1979-07-08	616-07-8795	(818) 926-8632	\N	\N	9633 Kester Ave	\N	\N	North Hills	\N	91343	CT: 05/16/2015-11/16/2015	R / HAND,L / HAND,L / WRIST	\N	\N	0	The Habit Restaurants LLC	1169	610	\N	1115	731	Yanira	2015-12-04 11:00:00	\N	\N	\N	\N	0	\N	\N	\N	2015-11-23 09:15:54	2015-11-23 09:15:55	611	611	\N
10260	2015-11-04	2015-11-04	Workers Compensation	Eduardo	Siordia	1971-10-13	624-22-9281	(626) 488-2741	\N	(909) 545-1036	8410 Hermosa Ave. Apt. F	\N	\N	Rancho Cucamonga	\N	91730	CT: 02-25-2015 - 08-25-2015	NECK,R / SHOULDER,L / SHOULDER,R / ARM,L / ARM,R / WRIST,L / WRIST,L / HIP,R / HIP,R / KNEE,L / KNEE,L / ANKLE,R / ANKLE	\N	\N	0	JC Refrigerated Transport  Service	1176	612	<p>-----[Nov-05-15 10:00 AM Isabel M.]-----</p><p><p>La clinica de Montclair tenia la cita hasta el 11-23-2015 y por eso el cliente pidio que lo cambiaramos a L.H Fontana</p><p>Envie documentos a clinica y cita L/O</p></p><p>-----[Nov-04-15 03:40 PM Isabel M.]-----</p><p>La clinica ya cerro</p><p>-----[Nov-04-15 03:38 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p>Fontana/L.H @ 9.22 Miles</p><p>Montclair/Balian @ 8.99 Miles</p></p>	1086	719	Jenny	2015-11-13 10:30:00	2	\N	\N	<p>-----[Nov-05-15 10:00 AM Isabel M.]-----</p><p>Conf. con Pt.</p>	1	\N	Edwin	2015-11-13	2015-11-04 15:38:46	2015-11-17 10:03:30	616	611	\N
10411	2015-11-17	2015-11-17	Personal Injury	Marilu	Ceballos De Fexix	1967-04-25	\N	(310) 835-4963	\N	\N	23241  Maribel Ave.	\N	\N	Carson	\N	90745	10-22-2015	R / ELBOW,R / SHOULDER,HEAD	\N	\N	0	\N	1176	612	<p>-----[Nov-17-15 04:19 PM Isabel M.]-----</p><p>Hable con la cliente y dice que esta muy lejos , le envie correo L/O</p>	1326	\N	\N	\N	\N	48	2015-11-17 16:20:00	\N	0	\N	\N	\N	2015-11-17 16:19:25	2015-11-17 16:23:05	616	616	\N
10272	2015-11-05	2015-11-05	Workers Compensation	Giovany	Silva	1984-01-12	623-45-7896	(805) 509-8071	\N	\N	161 N. Bonita Ave.	\N	\N	Oxnard	\N	93030	CT: 05-15-2014 - 04-13-2015	HEAD,NECK,CHEST,R / SHOULDER,L / SHOULDER,R / KNEE,L / KNEE	\N	1247	0	San Miguel Produce, Inc	1176	612	<p>-----[Nov-05-15 02:18 PM Isabel M.]-----</p><p><p>Opciones de clinica:<br><b style="line-height: 1.42857;">Reseda/MedNation @ 41.80 miles</b><br></p><p>\n\n</p><p class="MsoNormal"><b>Van Nuys/NobleQuest @ 47.69 miles</b></p><p class="MsoNormal"><b>El cliente dice que esta lejos, envie correo abogado</b><o:p></o:p></p></p>	1326	\N	\N	\N	\N	48	2015-11-05 14:15:00	\N	0	\N	\N	\N	2015-11-05 14:18:56	2015-11-05 14:20:22	616	616	\N
10316	2015-11-09	2015-11-09	Workers Compensation	Adalberto Genaro	Sosa	1984-03-01	\N	(323) 570-8175	\N	\N	1010 E. 35th St. Apt. 6	\N	\N	Los Angeles	\N	90011	CT: 11-04-2014 - 11-05-2015	BACK,L / FOOT,R / FOOT,HEAD,R / ANKLE,L / ANKLE	\N	\N	0	SC  Prestige parking	1176	612	<p>-----[Nov-09-15 03:22 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">La/Industrial @ 4.80 miles<o:p></o:p></p><p>\n\n<span style="font-size: 11pt; font-family: Calibri, sans-serif;">LA/Atlantis @ 5.90 miles</span></p><p><span style="font-size: 11pt; font-family: Calibri, sans-serif;">Envie cita L/O y documentos a clinica<br></span><br></p><p><br></p></p>	1148	776	Nancy	2015-11-12 14:30:00	2	\N	\N	<p>-----[Nov-09-15 03:22 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	1	\N	Carmen	2015-11-12	2015-11-09 15:22:55	2015-11-17 09:08:18	616	611	\N
10255	2015-11-04	2015-11-04	Workers Compensation	Raul F.	Aguirre Canales	1959-07-02	\N	(213) 258-0846	\N	\N	2905 W. Temple Street Apt 6	\N	\N	Los Angeles	\N	90026	CT: 10/01/2014 - 11/02/2015	R / ARM,LOWER BACK	\N	\N	0	Tipparos Thai Restaurant	1176	612	<p>-----[Nov-04-15 02:50 PM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>LA / RB Spine - 4.54 miles&nbsp;</p><p>Glendale / Daher - 6.22 miles</p><p>Per pt schedule in Glendale for a morning appt.&nbsp;</p></p>	1087	757	Ana	2015-11-10 09:00:00	2	\N	\N	\N	1	\N	Ana	2015-11-10	2015-11-04 14:50:36	2015-11-12 10:27:55	614	611	\N
10509	2015-11-24	2015-11-24	Workers Compensation	Luvia Y.	Linarez Zamora	1971-03-06	604-61-8402	(818) 849-1231	\N	\N	8154 Langdon Ave	\N	Apt 111	Van Nuys	\N	91406	CT: 11/13/2014-11/13/2015	R / ARM,R / LEG,L / LEG,SPINE,NECK,L / HAND,R / HAND	ears, throat	1197	0	Select Staffing	1169	610	\N	1115	731	Yanira	2015-12-08 11:30:00	\N	\N	\N	\N	0	\N	\N	\N	2015-11-25 10:52:52	2015-11-25 10:52:52	611	611	\N
10239	2015-11-03	2015-11-03	Workers Compensation	Sandra	Navarro	1978-05-16	639-05-3651	(661) 667-9477	\N	(818) 652-2720	109 San Lucas Street	\N	\N	McFarland	\N	93250	09/30/2015	LOWER BACK,L / KNEE,L / ANKLE,L / WRIST,L / HAND,L / ARM,L / ELBOW	left heel	1332	1	Kern AG Labor Management	1176	612	<p>-----[Nov-06-15 08:55 AM Daisy M.]-----</p><p>Advised Jesselin @ L/O that case will be placed on cancel status until they can provide MPN link or adjuster info in order to search for a Dr.&nbsp;</p><p>-----[Nov-03-15 05:00 PM Daisy M.]-----</p><p><p>Emailed Jesselin to verify if she has MPN link because I tried searching, but there is various ways to search the MPN. Need the correct one in order to give the right Dr options.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1326	\N	\N	\N	\N	55	2015-11-06 08:55:00	\N	0	\N	\N	\N	2015-11-03 17:00:24	2015-11-06 08:55:39	614	614	\N
10240	2015-11-03	2015-11-03	Workers Compensation	Eleno Emmanuel	Ramirez	1993-12-18	615-70-3959	(805) 793-8359	\N	(661) 912-7493	4100 Maize Court	\N	\N	Bakersfield	\N	93313	10/26/2015	L / HAND	\N	1336	1	Golden Bros. Contracting	1176	612	<p>-----[Nov-06-15 08:56 AM Daisy M.]-----</p><p><span style="line-height: 21.4286px;">Advised Jesselin @ L/O that case will be placed on cancel status until they can provide MPN link or adjuster info in order to search for a Dr.&nbsp;</span></p><p>-----[Nov-03-15 05:07 PM Daisy M.]-----</p><p>Emailed Jesselin @ L/O to ask if she has MPN link for this employer.&nbsp;</p>	1326	\N	\N	\N	\N	55	2015-11-06 08:55:00	\N	0	\N	\N	\N	2015-11-03 17:02:47	2015-11-06 08:56:06	614	614	\N
10258	2015-11-04	2015-11-04	Workers Compensation	Fernando	Ordaz	1960-04-12	620-14-7811	(818) 795-2263	\N	\N	9172 Telefair Ave Apt 3	\N	\N	Sun Valley	\N	91352	1. 09/03/2015     2. 10/13/2015	R / KNEE	2. right knee, right leg, right foot, right hip, neck	\N	0	Super Center Concepts Inc	1176	610	<p>-----[Nov-04-15 03:17 PM Daisy M.]-----</p><p>Van Nuys / NobleQuest</p>	1152	794	Henry	2015-11-10 09:30:00	1	\N	\N	\N	1	\N	Marilyn	2015-11-10	2015-11-04 15:17:06	2015-11-12 11:47:17	614	611	\N
10237	2015-11-03	2015-11-03	Workers Compensation	Lucio Alberto	Lerma	1966-12-16	531-13-5145	(619) 864-4571	\N		150 N. East St.  Apt. 205	\N	\N	Anaheim	\N	92805	CT: 06-25-2014 - 06-25-2015	BACK,L / HIP,L / LEG,R / LEG,L / FOOT,R / FOOT	\N	\N	0	Marina Landscape Maintenance, Inc	1176	612	<p>-----[Nov-03-15 04:50 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Keystone/Santa Ana @ 8.88 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Costa Mesa/S. Spine @ 16.89 miles</p><p class="MsoNormal"><o:p></o:p></p><p>Envie cita L/O y documentos a clinicas</p></p>	1335	793	Jesus	2015-11-12 15:30:00	2	\N	\N	<p>-----[Nov-03-15 04:50 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	1	2015-11-24 00:00:00	Jesus	2015-11-12	2015-11-03 16:50:48	2015-11-17 09:39:13	616	611	\N
10243	2015-11-04	2015-11-04	Workers Compensation	Eris	Vasquez	1981-08-12	\N	(626) 923-7332	\N	\N	3623 Gilaman Rd Apt 8	\N	\N	El Monte	\N	91732	1. CT: 09/05/2014 - 09/05/2015   2. 10/01/2014   3. 08/25/2015	R / KNEE,L / KNEE	2. testicles   3. left hand, left hand fingers	\N	0	First Class Construction & Development Inc	1176	610	<p>-----[Nov-04-15 08:55 AM Daisy M.]-----</p><p><p>El Monte / Greenfield&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1074	774	Maggie	2015-11-13 15:30:00	1	\N	\N	\N	1	\N	Jennifer	2015-11-13	2015-11-04 08:55:13	2015-11-17 09:50:19	614	611	\N
10236	2015-11-03	2015-11-03	Workers Compensation	Ramiro	Cortez	1963-06-17	\N	(619) 538-8960	\N		7130 Tait St Apt 7130	\N	\N	San Diego	\N	92111	CT: 10/24/2014 - 10/24/2015	R / LEG,L / LEG,R / HAND,L / HAND,FINGERS	spine	\N	0	DJK Korean BBQ Inc. DBA Dae Jang Keum Restaurant	1176	610	<p>-----[Nov-03-15 04:22 PM Daisy M.]-----</p><p>Appt will be a phone Hx, once HX is completed Dr's appt will be given to pt.&nbsp;</p><p>-----[Nov-03-15 02:12 PM Daisy M.]-----</p><p><p>SD / LH - 5.7 miles&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1128	719	Jenny	2015-11-12 14:00:00	1	\N	\N	\N	1	\N	Emily	2015-11-12	2015-11-03 14:12:43	2015-11-17 09:56:06	614	611	\N
10518	2015-11-25	2015-11-25	Workers Compensation	Manuela	Bernal	1959-05-28	608-18-5507	(747) 256-9307	\N	\N	11411 Dronfield Ave Apt 53	\N	\N	Paicoma	\N	91331	CT: 10-19-2013 - 10-21-2015	R / SHOULDER,L / SHOULDER,R / ARM,L / ARM,R / ELBOW,L / ELBOW,L / WRIST,R / WRIST,L / HAND,R / HAND,FINGERS,NECK,SPINE,LOWER BACK,R / KNEE,L / KNEE,HERNIA	Stomach	\N	0	Canyon Properties III, LLC	1176	612	<p>-----[Nov-30-15 09:31 AM Isabel M.]-----</p><p><p style="color: rgb(89, 126, 162); line-height: 21.4286px; background-color: rgb(236, 240, 241);"><span style="line-height: 21.4286px;">Envie correo para saber si ya tienen la cita</span></p><div><span style="line-height: 21.4286px;"><br></span></div></p><p>-----[Nov-25-15 03:12 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Van Nuys/NobleQuest @ 5.43 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">MedNation/Reseda @ 11.65 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">El cliente prefiere su cita de 3:00PM , Envie documentos a clinica</span><br></p></p>	1152	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2015-11-25 15:12:22	2015-11-30 09:31:07	616	616	\N
10242	2015-11-03	2015-11-03	Workers Compensation	Jose	Pena	1951-01-22	567-21-9118	(760) 556-2130	\N	\N	45 E. Highway 98	\N	\N	Calexico	\N	91231	CT: 06-30-2014 - 12-31-2014	R / KNEE,L / KNEE,L / ARM,R / ARM,BACK,LOWER BACK	\N	\N	0	Harvest Time	1176	612	<p>-----[Nov-03-15 05:22 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">RB/San Ysidro @ 124.19 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">SD/LH @ 114.60 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">El cliente dice que le queda muy lejos, envie correo L/O</span><br></p><p><br></p></p>	1326	\N	\N	\N	\N	48	2015-11-03 17:20:00	\N	0	\N	\N	\N	2015-11-03 17:22:36	2015-11-03 17:22:36	616	616	\N
10558	2015-11-30	2015-11-30	Workers Compensation	Jose Homar	Garcia Gonzalez	1969-09-16	\N	(213) 454-3849	\N	\N	964 S. Menlo Ave. Apt. 206	\N	\N	Los Angeles	\N	90006	CT: 01-14-2014 - 11-07-2015	HERNIA,L / SHOULDER,BACK,L / FOOT,R / FOOT	Soles	\N	0	\N	1176	612	<p>-----[Nov-30-15 04:07 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Industrial/LA @ 1.62 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Glendale/Daher @ 9.64 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica y cita L/O</span><br></p></p>	1148	776	Nancy	2015-12-03 09:30:00	2	\N	\N	<p>-----[Nov-30-15 04:07 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-30 16:07:56	2015-11-30 16:07:56	616	616	\N
10224	2015-11-02	2015-11-02	Workers Compensation	Elizabeth	Rodriguez	1964-09-04	\N	(714) 341-2902	\N	\N	1200 E. Fairhaven Apt 78	\N	\N	Santa Ana	\N	92705	07/31/2015	HEAD,NECK,R / UPPER EXT,L / UPPER EXT,BACK,R / SHOULDER,L / SHOULDER	\N	1197	1	Select Staffing	1176	610	<p>-----[Nov-04-15 09:56 AM Daisy M.]-----</p><p><p>Per Humberto cancel case, appt is too far out.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-03-15 05:14 PM Daisy M.]-----</p><p><p>Per Humberto @ L/O they need a sooner appt for pt, 12-7-2015 it too far out. Called Bianca @ Southland Spine and she advised that Dr. Sierra Moulton is within the MPN and has an appt for 11-30-2015, but&nbsp;<span style="color: rgb(0, 51, 0); line-height: 1.42857;">if pt has any fractures or dislocations she is not willing to\ntake the case.&nbsp;</span></p><p class="MsoNormal"><span style="color:#003300">&nbsp;<br><o:p></o:p></span></p><p><br></p></p><p>-----[Nov-03-15 10:48 AM Daisy M.]-----</p><p>Disregard previous note about Hx appt, it will actually be on 11-16-2015 @ 8:30 am over the phone.&nbsp;</p><p>-----[Nov-03-15 10:36 AM Daisy M.]-----</p><p><p>Per Humberto schedule appt w/ Dr. Matos.</p><p> Pt will have a phone Hx on 11-15-2015 @ 8:30 am with Tammy. Per Luis @ clinic they will put a note in the system that in case there is any cancellations they will move pt's appt to a sooner date.&nbsp;</p></p><p>-----[Nov-02-15 05:50 PM Daisy M.]-----</p><p>Advised Humberto that we have Dr. Max Matos in Costa Mesa @ approx 10.9 miles within the MPN.&nbsp;</p>	1326	748	Luis	2015-12-07 10:15:00	\N	53	2015-11-04 09:55:00	\N	0	\N	\N	\N	2015-11-02 16:51:30	2015-11-04 09:56:35	614	614	\N
10471	2015-11-20	2015-11-20	Workers Compensation	Gabriela Facio	Rodriguez	1997-05-12	440-91-6390	(951) 567-4776	\N	\N	316 S. Merrill Street	\N	\N	Corona	\N	92882	10-30-2015	R / HAND,FINGERS		\N	0	Varsity Contractors Ins.	1176	817	\N	1119	722	Raquel	2015-11-25 16:00:00	1	\N	\N	\N	\N	\N	\N	\N	2015-11-23 09:26:44	2015-11-24 10:53:05	611	611	\N
10389	2015-11-13	2015-11-13	Workers Compensation	Leonardo Daniel	Cadena	1984-11-09	613-05-1869	(760) 619-8576	\N	\N	51-285 Fredericks St.  Apt. J-104	\N	\N	Coachella	\N	92236	CT: 09-22-2012-09-22-2014	R / SHOULDER,L / SHOULDER,R / HIP,L / HIP,R / WRIST,L / WRIST,R / FOOT,R / LEG,SLEEP DISORDER	\N	1315	0	Precision Gunite Corp.	1176	817	<p>-----[Nov-24-15 10:00 AM Isabel M.]-----</p><p>Envie correo de cancelacion</p><p>-----[Nov-23-15 02:02 PM Lily E.]-----</p><p>Per Maribel @ clinic this client was a no show on 11/21. Emailed L/O</p><p>-----[Nov-20-15 12:30 PM Lily E.]-----</p><p>Per Alex @ clinic they cannot take the case due to he lives too far and the doctor does not like to take cases where clients live too far as they need to attend therapies 3x a week. They called client to inform him, Advised Isabel.</p><p>-----[Nov-13-15 12:17 PM Isabel M.]-----</p><p>Envie documento a clinica y cita L/O</p>	1326	794	Maribel	2015-11-21 10:30:00	\N	73	\N	\N	0	\N	\N	\N	2015-11-13 12:17:51	2015-11-24 10:00:09	616	616	\N
10251	2015-11-04	2015-11-04	Workers Compensation	Armando	Sandoval	1971-03-31	516-10-7780	(714) 610-2846	\N	\N	15711 Williams Street Apt 149	\N	\N	Tustin	\N	92780	07/01/2015	HEAD	forehead, mouth, front teeth	1307	1	Balboa Dessert Co.	1176	612	<p>-----[Nov-09-15 10:18 AM Daisy M.]-----</p><p><p class="MsoNormal"><span style="color:#993366">Called Southland Spine to verify\nif they would be willing to take the case due to the IBP, but unfortunately\nnone of the Dr’s they have in their office are willing to take the case. Advised Jesselin that we have no other clinic in the area who would be willing to\nschedule pt. <o:p></o:p></span></p>\n\n<p class="MsoNormal"><span style="color:#993366">&nbsp;</span></p></p><p>-----[Nov-04-15 12:13 PM Daisy M.]-----</p><p><p>Emailed Jesselin / Vanessa @ L/O to advise them that we cannot process this case as there is no chiro / ortho body parts to treat.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1326	\N	\N	\N	\N	51	2015-11-04 12:10:00	\N	0	\N	\N	\N	2015-11-04 12:13:12	2015-11-09 10:18:42	614	614	\N
10364	2015-11-12	2015-11-12	Personal Injury	Martha Estela	Rivera M. Figueroa	1954-11-07	261-45-4783	(760) 231-9064	\N	(760) 622-8588	405 Ribbon Beach Way	\N	Apt 242	Oceanside	\N	92058	08/17/2015	BACK	\N	\N	0	\N	1176	612	<p>-----[Nov-12-15 11:27 AM Daisy M.]-----</p><p><p>Per Jessica cancel, clinics are too far.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-12-15 11:25 AM Daisy M.]-----</p><p><p>Advised Jessica @ L/O that the options below are the closest for pt</p><p class="MsoNormal">Rb/Rancho Bernardo @ 29.09 miles</p><p>\n\n\n\n</p><p class="MsoNormal">Murrieta/Gogatz @ 34.13 miles<o:p></o:p></p></p>	1326	\N	\N	\N	\N	48	2015-11-12 11:25:00	\N	0	\N	\N	\N	2015-11-12 11:14:43	2015-11-12 11:27:13	611	614	\N
10259	2015-11-04	2015-11-04	Workers Compensation	Ricardo	Avila	1977-02-15	605-23-5520	(661) 432-8092	\N		414 Villa Apt B	\N	\N	Bakersfield	\N	93307	CT: 08/24/2015 - 10/24/2015	LOWER BACK,GROIN,BACK	\N	1307	1	7 Contracting	1176	612	<p>-----[Nov-04-15 04:07 PM Daisy M.]-----</p><p>Paperwork emailed to BMG to schedule pt with Dr. Michael Price, he is within the MPN.&nbsp;</p>	1159	800	Ana	2015-11-17 13:00:00	2	\N	\N	\N	1	2015-12-01 13:45:00	Alex	2015-11-17	2015-11-04 15:19:38	2015-11-24 14:38:05	614	611	\N
10373	2015-11-12	2015-11-12	Personal Injury	Gumercindo	Gutierrez	1969-01-13	\N	(714) 395-0748	\N	\N	2505 Evergreen St	\N	\N	Santa Ana	\N	92707	11/06/2015	BACK	\N	\N	0	\N	1176	612	<p>-----[Nov-17-15 12:19 PM Isabel M.]-----</p><p>La clinica informo que todos los pasajeron asistieron a su cita</p><p>-----[Nov-12-15 03:01 PM Daisy M.]-----</p><p>LDM on VM with complete appt info.&nbsp;</p><p>-----[Nov-12-15 02:55 PM Daisy M.]-----</p><p>Sent to Anaheim since Keystone in Santa Ana was not scheduling until 11-17-2015.</p>	1072	743	Marisol	2015-11-16 15:00:00	2	\N	\N	\N	1	\N	Marisol	2015-11-16	2015-11-12 14:44:10	2015-11-17 12:19:40	614	616	\N
10405	2015-11-17	2015-11-17	Workers Compensation	Armando	Fregozo	1979-08-01	\N	(909) 358-1706	\N	\N	10890 Bennett Dr.	\N	\N	Fonatana	\N	92337	1. 09/26/2015 2. 10/01/2015	R / SHOULDER,SPINE,R / HIP,L / HIP	2. Right hand, right hand thumb	1210	0	Citistaff Solutions Inc.	1169	610	\N	1086	719	Jenny	2015-11-20 11:00:00	2	\N	\N	\N	1	\N	Emmanuel	2015-11-20	2015-11-17 11:20:29	2015-11-23 12:07:13	611	611	\N
10238	2015-11-03	2015-11-03	Workers Compensation	Ernesto Jr	Aragon	1988-12-02	\N	(619) 430-6627	\N	(619) 432-9414	3753 Newton Avenue	\N	\N	San Diego	\N	92113	12/13/2012	R / ANKLE,R / FOOT	\N	\N	0	South Coast Specialty Systems Inc	1176	612	<p>-----[Nov-04-15 10:02 AM Daisy M.]-----</p><p>Jesselin from L/ O submitted paperwork with correct DOI for both cases, paperwork send to ACS/SD.&nbsp;</p><p>-----[Nov-04-15 08:38 AM Daisy M.]-----</p><p>Advised Jesselin @ L/O that we cannot schedule this second case @ ACS due to it having the same DOI and IBP as the first case.</p><p>-----[Nov-03-15 04:55 PM Daisy M.]-----</p><p><p>Case 2 of 2, pt's first case was sent to ACS in San Diego, this case will be sent there as well.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1129	718	Rebeca	2015-11-25 09:30:00	2	\N	\N	\N	\N	\N	\N	\N	2015-11-03 16:55:44	2015-11-04 13:56:30	614	614	\N
10253	2015-11-04	2015-11-04	Workers Compensation	Fidel	Sotelo	1965-04-24	\N	(323) 381-1788	\N	\N	5216 S. Normandie Ave.	\N	\N	Los Angeles	\N	90037	10-23-2015	LOWER BACK,L / FOOT	Spine	\N	0	E. C Group, Inc	1176	612	<p>-----[Nov-04-15 02:17 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">LA / Industrial – 5.48 miles <o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Downey / SoCal Chiros – 16.06\nmiles</p><p class="MsoNormal">Envie cita L/O y documentos a clinica</p></p>	1148	776	Carmen	2015-11-11 11:00:00	2	\N	\N	<p>-----[Nov-04-15 02:21 PM Isabel M.]-----</p><p>Conf. con Pt.</p><p>-----[Nov-04-15 02:17 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	1	\N	Judith	2015-11-11	2015-11-04 14:17:25	2015-11-13 09:08:21	616	614	\N
10235	2015-11-03	2015-11-03	Workers Compensation	Jose Alfredo	Hernandez	1977-08-22	\N	(858) 699-9290	\N	\N	1230 Faith Ave	\N	\N	Encinitas	\N	92024	CT: 10/25/2014 - 10/25/2015	R / KNEE,L / KNEE,R / HAND,L / HAND,HERNIA	spine, testicles, abdomen	\N	0	Thai Pan Cuisine	1176	610	<p>-----[Nov-03-15 05:19 PM Daisy M.]-----</p><p><p>Per Humberto @ L/O go ahead and schedule appt.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-03-15 02:09 PM Daisy M.]-----</p><p>Advised Humberto @ L/O that the closest clinic we have for pt is RB/ Rancho Bernardo @ approx 22.1 miles.</p>	1161	742	Linda	2015-11-12 13:00:00	1	\N	\N	\N	1	\N	Linda	2015-11-12	2015-11-03 14:09:17	2015-11-17 10:40:33	614	611	\N
10303	2015-11-06	2015-11-06	Workers Compensation	Jose	Gamboa	1978-04-30	573-57-8867	(760) 498-6297	\N	\N	6505 Sperry Road	\N	\N	Calipatria	\N	92233	Ct: 03-26-2015  - 11-03-2015	LOWER BACK,R / LEG,L / LEG	\N	\N	0	Summit Pizza West LLC	1176	612	<p>-----[Nov-06-15 03:54 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">Rancho Bernardo/RB @ 145.51 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">LH/SD @ 143.06 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">El cliente dice que esta muy lejos, le envie correo L/O</span><br></p></p>	1326	\N	\N	\N	\N	48	2015-11-06 15:50:00	\N	0	\N	\N	\N	2015-11-06 15:54:30	2015-11-06 15:54:30	616	616	\N
10256	2015-11-04	2015-11-04	Workers Compensation	Jenaro Elias	Guarchaj	1981-09-18	265-76-8681	(213) 926-0033	\N	(213) 944-3456	323 S. Burlington Ave.	\N	\N	Los Angeles	\N	90057	CT: 10-31-2014 - 10-31-2015	LOWER BACK,L / FOOT,R / FOOT,R / LEG,L / LEG	\N	\N	0	French Florist DBA Steven H. Jocobson	1176	612	<p>-----[Nov-04-15 03:36 PM Isabel M.]-----</p><p>El cliente llamo y dice que cancelo su caso , cancele la cita en Industrial L.A con Judith</p><p>-----[Nov-04-15 03:26 PM Isabel M.]-----</p><p>El cliente va hablar con su abogado primero, porque no esta seguro si ese es su abogado</p><p>-----[Nov-04-15 03:02 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">LA / Industrial – 0.74 miles <o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Glendale / Daher – 6.42 miles<o:p></o:p></p></p>	1326	776	Carmen	2015-11-12 10:30:00	\N	49	2015-11-04 15:35:00	<p>-----[Nov-04-15 03:26 PM Isabel M.]-----</p><p>Deje mensaje</p>	0	\N	\N	\N	2015-11-04 15:02:35	2015-11-04 15:36:13	616	616	\N
10307	2015-11-07	2015-11-06	Workers Compensation	Cresencio	Tapia	1954-04-19	552-59-8839	(805) 253-5409	\N	\N	163 Dolores Court	\N	\N	Oxnard	\N	93030	CT: 10/30/2014 - 10/30/2015	LOWER BACK,L / SHOULDER,R / ARM,L / ARM,NECK,L / FOOT	\N	1197	1	Barrett Business Services, Inc	1176	612	<p>-----[Nov-10-15 09:50 AM Daisy M.]-----</p><p><span style="line-height: 21.4286px;">Advised Jesselin that case will be placed on cancel status as we have no Dr within the MPN.&nbsp;</span></p><p>-----[Nov-06-15 04:44 PM Daisy M.]-----</p><p>Advised L/O that we have no Dr within the MPN.&nbsp;</p>	1326	\N	\N	\N	\N	47	2015-11-10 09:50:00	\N	0	\N	\N	\N	2015-11-06 16:44:13	2015-11-10 09:50:27	614	614	\N
10493	2015-11-24	2015-11-24	Workers Compensation	Gloria Alicia	Cruz Beltran	1953-06-22	621-50-7352	(661) 709-4117	\N	(661) 720-0528	2042 Gerard St. Space  81	\N	\N	Delano	\N	93215	CT: 11-18-2013 - 11-18-2015	NECK,BACK,R / HIP,L / HIP,L / KNEE,R / LEG,L / LEG,L / FOOT,R / FOOT,L / RIBS,R / RIBS,R / HAND,L / HAND	Shoulder blades, stomach, groin,	\N	0	Kern Ag Labor Management	1176	612	<p>-----[Nov-24-15 02:00 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Bakersfield/BMG @ 38.56 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 130.77 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">La cliente dice muy lejos , le envie correo L/O</span><br></p></p>	1326	\N	\N	\N	\N	48	2015-11-24 14:00:00	\N	0	\N	\N	\N	2015-11-24 14:00:23	2015-11-24 14:00:23	616	616	\N
10496	2015-11-24	2015-11-24	Workers Compensation	Rosa	Gamboa	1982-09-12	\N	(951) 399-5469	\N	\N	4045 Agate St.	\N	\N	Riverside	\N	92509	04-10-2015	BACK	\N	1250	0	Las Makitas Corp	1176	612	<p>-----[Nov-24-15 03:07 PM Isabel M.]-----</p><p>Por L/O programar cita Keystone/Riverside</p>	1119	722	Jesus	2015-11-30 10:00:00	2	\N	\N	<p>-----[Nov-24-15 03:07 PM Isabel M.]-----</p><p>Conf. y quiere texto</p>	0	\N	\N	\N	2015-11-24 15:07:27	2015-11-24 15:07:27	616	616	\N
10264	2015-11-04	2015-11-04	Workers Compensation	Jose M	Meza	1969-03-30	572-97-2969	(714) 397-4345	\N	\N	535  1/4 N St. Louis	\N	\N	Los Angeles	\N	90033	06-03-2013	GROIN,LOWER BACK,HERNIA	Abdomen, nervous system, reproductive system	1252	0	Super King Market	1176	612	<p>-----[Nov-06-15 09:53 AM Isabel M.]-----</p><p>Deje mensaje, enviare correo L/O de cancelacion por no contacto</p><p>-----[Nov-05-15 05:04 PM Isabel M.]-----</p><p><span style="color: rgb(89, 126, 162); line-height: 21.4286px; background-color: rgb(236, 240, 241);">Deje Mensaje&nbsp;</span></p><p>-----[Nov-05-15 08:48 AM Isabel M.]-----</p><p>Envie correo L/O de no contacto</p><p>-----[Nov-05-15 08:46 AM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-04-15 04:20 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">LA / MedNation – 7.32 miles <o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Pico Rivera / Gutierrez – 10.45\nmiles</p><p class="MsoNormal">Deje Mensaje&nbsp;<o:p></o:p></p></p>	1326	\N	\N	\N	\N	69	2015-11-06 09:50:00	\N	0	\N	\N	\N	2015-11-04 16:20:25	2015-11-06 09:53:22	616	616	\N
10384	2015-11-13	2015-11-13	Personal Injury	Justino	Villafuerte Alvear	1990-10-16	\N	(213) 216-1716	\N	\N	267 Del Monte St. Apt. 5	\N	\N	Pasadena	\N	91103	10-29-2015	BACK,WAIST	\N	\N	0	\N	1176	612	<p>-----[Nov-17-15 11:48 AM Isabel M.]-----</p><p>La clinica informa que no tomara el caso porque el cliente tiene dos infecciones en su piel que son contagiosas, le envie correo L/O</p><p>-----[Nov-13-15 09:27 AM Isabel M.]-----</p><p>Envie documentos a clinicas y cita L/O</p>	1326	757	Ana	2015-11-16 12:00:00	\N	52	2015-11-17 11:45:00	<p>-----[Nov-13-15 11:19 AM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-13 09:27:52	2015-11-17 11:48:45	616	616	\N
10406	2015-11-17	2015-11-17	Workers Compensation	Jorge	Duran	1978-07-03	566-83-9432	(310) 256-6690	\N	\N	12700 Fonthill Ave	\N	#3	Hawthorn	\N	90250	1. 02/22/2015 2. 05/30/2015	L / ANKLE,L / KNEE,R / LEG,R / ARM,R / WRIST,R / HAND	2. left ankle, left elbow, left hip, left wrist, right palm,left knee, left shoulder	1197	1	Progistics Distribution/ State Logistics	1176	817	<p>-----[Nov-17-15 11:34 AM Lily E.]-----</p><p>Per L/O they want an MPN Dr. Emailed Silvia @ L/O to advise that unfortunately we do not have a doctor on the MPN.&nbsp;</p>	1330	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2015-11-17 11:34:12	2015-11-17 11:34:12	611	611	\N
10472	2015-11-20	2015-11-20	Workers Compensation	Carmen I.	Palomares	1959-09-19	552-79-5115	(818) 616-0192	\N	\N	9075 Cedros Ave	\N	Apt 28	Panorama City	\N	91402	CT 10/26/2014-10/26/2015	R / SHOULDER,L / SHOULDER,R / ARM,L / ARM,SPINE	\N	\N	0	American Way Management Inc.	1169	610	\N	1115	731	Yanira	2015-12-04 12:00:00	\N	\N	\N	\N	0	\N	\N	\N	2015-11-23 09:36:39	2015-11-23 09:36:39	611	611	\N
10520	2015-11-25	2015-11-25	Workers Compensation	Francisco	Cubias	1964-03-09	615-80-1676	(951) 220-2602	\N	\N	10226 Hendrick Ave	\N	\N	Riverside	\N	92503	CT: 11/10/2014-11/10/2015	LOWER BACK,UPPER BACK	ears	\N	0	Freash & Easy Neighborhood Market	1176	817	\N	1119	722	Jesus	2015-12-07 11:30:00	1	\N	\N	\N	0	\N	\N	\N	2015-11-25 15:21:54	2015-11-25 15:21:54	611	611	\N
10212	2015-11-02	2015-11-02	Workers Compensation	Brigido De Jesus	Zacarias	1961-10-08	611-16-5901	(661) 337-0477	\N	\N	3122 Laurel Dr.	\N	\N	Bakersfield	\N	93304	03-09-2015	R / SHOULDER,R / ARM,R / KNEE	\N	\N	0	Diligent, Inc	1176	612	<p>-----[Nov-04-15 12:02 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-02-15 12:40 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Bakersfield/BMG@ 7.50 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">VanNuys/NobleQuest @ 95.81 miles</p><p class="MsoNormal"><o:p></o:p></p><p>Envie documentos a clinica</p></p>	1159	808	Ana	2015-11-12 12:30:00	2	\N	\N	<p>-----[Nov-04-15 12:02 PM Isabel M.]-----</p><p>Conf. con Pt y envie texto</p><p>-----[Nov-02-15 05:07 PM Isabel M.]-----</p><p>No se pude dejar mensaje</p>	1	2015-12-10 12:00:00	Alex	2015-11-12	2015-11-02 12:40:23	2015-11-18 16:10:27	616	611	\N
10521	2015-11-25	2015-11-25	Workers Compensation	Maria	Escalante	1953-10-06	618-01-5795	(818) 967-2479	\N	\N	15749 Vanowen Street	\N	Apt 10	Van Nuys	\N	91406	CT: 05/03/2012-11/14/2015	R / KNEE,L / KNEE	\N	\N	0	DMS Facility Services	1176	817	\N	1115	731	Jordy	2015-12-08 12:00:00	1	\N	\N	\N	0	\N	\N	\N	2015-11-25 15:28:04	2015-11-25 15:28:04	611	611	\N
10279	2015-11-05	2015-11-05	Workers Compensation	Anna	Navarro	1962-08-02	609-18-1989	(951) 536-4824	\N	\N	29770 Morning Breeze Dr.	\N	\N	Menifee	\N	92584	01-15-2013	R / ARM,R / SHOULDER,R / HAND,R / LEG	R. side of body	1257	0	U. S. Bank	1176	623	<p>-----[Nov-05-15 04:46 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Gogatz/Murrieta @ 8.68 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">S. Spine/Riverside @ 28.26 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica y cita L/O</span><br></p></p>	1103	745	Ana	2015-11-17 14:00:00	2	\N	\N	<p>-----[Nov-05-15 04:46 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	1	\N	Ana	2015-11-17	2015-11-05 16:46:35	2015-11-18 12:25:11	616	611	\N
10281	2015-11-05	2015-11-05	Personal Injury	Alma Josephina	Quintana Banuelos	1993-11-11	\N	(909) 260-7204	\N	(909) 278-1021	935 W. 2nd Street	\N	\N	Rialto	\N	92376	10-23-2015	BACK	\N	\N	0	\N	1176	612	<p>-----[Nov-09-15 03:55 PM Daisy M.]-----</p><p><p>Per Jenny @ Lighthouse Dr. Smith advised her that he will no longer be seeing P/I cases and unfortunately we have no other Dr in the area that will see these patients, advised Jessica @ L/O that the next closest would be Montgomery in SB @ 9.7 miles (appt for 11-17). Per Jessica cancel case.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1326	752	Jenny	2015-11-09 15:30:00	\N	48	2015-11-09 15:55:00	\N	0	\N	\N	\N	2015-11-05 17:16:47	2015-11-09 15:55:52	614	614	\N
10322	2015-11-09	2015-11-09	Workers Compensation	Oscar	Diaz	1978-04-17	623-22-5611	(661) 474-1470	\N	(661) 720-9073	1325 Glenwood Street Apt D	\N	\N	Delano	\N	93215	10/19/2015	NECK,LOWER BACK,R / LEG,L / LEG	\N	\N	0	Farmers Cooperative Almond Huller Inc	1174	612	<p>-----[Nov-09-15 05:18 PM Daisy M.]-----</p><p><p>OPtions provided to Jesselin over the phone:&nbsp;</p><p>Bakersfield / BMG - 38.56 miles</p><p>Van Nuys / NobleQuest - 130.77 miles</p><p>Per Jesselin schedule in Bakersfield. Pending appt form clinic.&nbsp;</p></p>	1159	808	Alex	2015-11-12 12:00:00	2	\N	\N	\N	1	2015-12-10 11:45:00	Alex	2015-11-12	2015-11-09 17:18:30	2015-11-18 16:06:48	614	611	\N
10230	2015-11-03	2015-11-03	Workers Compensation	Arturo	Hernandez	1970-01-07	\N	(323) 373-6649	\N	\N	5028 N. Melrose Ave.	\N	\N	Los Angeles	\N	90038	08-03-2015	L / ELBOW,R / ELBOW,R / SHOULDER,L / SHOULDER	\N	\N	0	Western Home Furniture	1176	612	<p>-----[Nov-16-15 03:17 PM Isabel M.]-----</p><p>Yanira de la clinica,de MedNation Los Angeles, &nbsp;informo que no tomaran el caso porque es pago cash, Vanessa me autorizo que lo cambiaron en Glendale, envie nueva cita L/O</p><p>-----[Nov-05-15 09:42 AM Isabel M.]-----</p><p>En vie cita L/O</p><p>-----[Nov-04-15 04:12 PM Isabel M.]-----</p><p><span style="color: rgb(89, 126, 162); line-height: 21.4286px; background-color: rgb(236, 240, 241);">Envie documentos a clinica, el cliente prefiere por la manana la cita</span></p><p>-----[Nov-04-15 01:47 PM Isabel M.]-----</p><p>Deje Mensaje</p><p>-----[Nov-03-15 10:41 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">MedNation/LA @ 3.22 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Glendale/Daher @ 6.99 miles&nbsp;</p><p class="MsoNormal"><span style="line-height: 1.42857;">caso 1/2</span></p><p class="MsoNormal"><span style="line-height: 1.42857;">Deje mensaje<br></span><br></p></p>	1087	757	Sunny	2015-11-25 10:00:00	1	\N	\N	<p>-----[Nov-16-15 03:40 PM Isabel M.]-----</p><p>Conf. L/O nueva cita</p><p>-----[Nov-05-15 09:00 AM Isabel M.]-----</p><p>Esta malo el telefono , envie carta</p>	0	\N	\N	\N	2015-11-03 10:41:09	2015-11-16 15:40:52	616	616	\N
10461	2015-11-20	2015-11-20	Workers Compensation	Miguel Angel	Martinez	1987-10-28	330-15-3427	(760) 222-5503	\N	\N	P.O Box 1271	\N	\N	Mecca	\N	92254	CT: 10-28-2014 - 10-28-2015	EYES,BACK	\N	\N	0	El Espinal Farm Labor Contractor, Inc	1176	612	<p>-----[Nov-20-15 04:53 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Montgomery/SB @ 92.87 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">S. Spine/Riverside @ 96.31 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">El cliente dice muy lejos, envie correo L/O</span><br></p></p>	1326	\N	\N	\N	\N	48	2015-11-20 16:55:00	\N	0	\N	\N	\N	2015-11-20 16:53:18	2015-11-20 16:53:18	616	616	\N
10318	2015-11-09	2015-11-09	Workers Compensation	Jesus Emmanuel	Valdez Carranza	1988-11-24	522-81-3247	(909) 747-2061	\N	\N	1265 W. Mirada Road	\N		San Bernardino	\N	92405	06/01/2015	HEAD,NECK,R / SHOULDER	\N	\N	0	Employers Resource Mgmt Co.	1174	612	<p>-----[Nov-24-15 03:39 PM Lily E.]-----</p><p>Per Vanessa @ L/O please reschedule this client.&nbsp;</p><p>-----[Nov-17-15 09:59 AM Lily E.]-----</p><p>Per Edwin @ clinic the client was a no show on 11/13/2015. &nbsp;Emailed L/O</p><p>-----[Nov-09-15 04:54 PM Daisy M.]-----</p><p><p>Per pt he needs an appt after 3:00 pm, he was initially scheduled with Dr. &nbsp;Montgomery in SB for 11-5-2015 @ 9:30 am, but did not show. Per Esther @ Dr. Montgomery's office they don't have appts after 3pm, pt was ok with going to Fontana / LH @ 12.2 miles. Notified L/O.</p></p>	1086	719	Jenny	2015-12-04 09:30:00	5	\N	\N	\N	\N	\N	\N	\N	2015-11-09 16:54:04	2015-11-24 15:39:55	614	611	\N
10277	2015-11-05	2015-11-05	Workers Compensation	Edith	Matias Naves	1963-01-16	\N	(951) 657-0937	\N	\N	3413 Nature Trail Ct	\N	\N	Perris	\N	92571	03/08/2008	R / ARM,SLEEP DISORDER,PSYCH,NECK	\N	1210	0	The Scotts Company	1169	610	<p>-----[Nov-05-15 04:04 PM Daisy M.]-----</p><p><p>Future Medical case, per L/O schedule with the closest MD.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1119	722	Jesus	2015-11-09 15:30:00	1	\N	\N	\N	1	\N	Jesus	2015-11-09	2015-11-05 15:57:00	2015-11-10 10:40:23	614	614	\N
10478	2015-11-23	2015-11-23	Workers Compensation	Manuel	Cordova	1945-03-12	561-86-6263	(626) 693-0862	\N	(714) 325-4105	11722 Cambdrige St.	\N	\N	Adelanto	\N	92301	04-27-2014	R / KNEE,R / HAND	\N	1309	0	ARYZTA, LLC	1176	612	<p>-----[Nov-23-15 12:11 PM Isabel M.]-----</p><p><p>Cambio de clinica</p><p>Envie cita L/O y documentos a clinica</p><p>Historial : 12-23-2015 @ 10:30AM en Oficina</p></p>	1139	749	Jessica	2015-12-29 15:50:00	2	\N	\N	<p>-----[Nov-23-15 12:11 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-23 12:11:10	2015-11-23 12:11:10	616	616	\N
10536	2015-11-25	2015-11-25	Workers Compensation	Andro J.	Pavia Jr.	1993-01-15	607-62-7290	(619) 721-0968	\N	\N	370 K. Street	\N	Apt 38	Chula Vista	\N	91911	1. 07/14/2015 2. 07/27/2015	R / WRIST,L / WRIST,L / HAND,R / HAND	2. Left eye	\N	0	Volt Management Corp.	1176	817	<p>-----[Nov-30-15 09:42 AM Lily E.]-----</p><p>Client will be scheduled with RB/San Ysidro. Emailed paperwork requesting the appointment from clinic.</p>	1331	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2015-11-30 09:42:39	2015-11-30 09:42:39	611	611	\N
10317	2015-11-09	2015-11-09	Workers Compensation	Feliciano	Ruiz	1991-01-05	\N	(951) 400-3095	\N	\N	21815 Cottonwood Ave.	\N	\N	Moreno Valley	\N	92553	CT: 11-02-2014 - 11-02-2015	R / KNEE,R / WRIST,R / HAND,R / SHOULDER,HEAD,L / FOOT,R / FOOT,EYES	\N	\N	0	Perris Buffet	1176	612	<p>-----[Nov-09-15 04:21 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">Montgomery/Riverside @ 13.34 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Keystone/Riverside @ 14.19 miles</p><p class="MsoNormal"><o:p></o:p></p><p>Envie documentos a clinicas y cita L/O</p></p>	1119	821	Raquel	2015-11-10 09:30:00	2	\N	\N	<p>-----[Nov-09-15 04:29 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	1	2015-11-20 00:00:00	Jesus	2015-11-10	2015-11-09 16:21:47	2015-11-12 11:36:52	616	611	\N
10559	2015-11-30	2015-11-30	Workers Compensation	Francisco	Galeana	1980-11-20	645-09-0873	(619) 831-3218	\N	\N	4115 Park Blvd	\N	\N	San Diego	\N	92103	1. CT: 03/09/2015 - 09/09/2015      2. 06/12/2015	R / KNEE,R / LEG,L / LEG,L / KNEE,SPINE,R / HIP,L / HIP,SLEEP DISORDER	2. right knee, right leg	\N	0	Lalos Al Pastor, Inc	1176	817	<p>-----[Nov-30-15 04:16 PM Daisy M.]-----</p><p><p>Mission Valley / RB Spine</p><p>Paperwork emailed to the clinic.&nbsp;</p></p>	1162	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2015-11-30 16:16:27	2015-11-30 16:16:27	614	614	\N
10434	2015-11-19	2015-11-19	Workers Compensation	Gustavo	Perez	1957-02-28	560-25-8077	(951) 337-3279	\N	(951) 595-5699	12835 Mead Court	\N	\N	Moreno Valley	\N	92553	02-20-2015	NECK,R / SHOULDER,BACK,HEAD,R / KNEE,L / KNEE	\N	\N	0	Supreme Truck Bodies Of  CA	1176	612	<p>-----[Nov-19-15 09:45 AM Isabel M.]-----</p><p><p>Este cliente Vanesa pidio que programaramos cita</p><p>Envie cita L/O</p></p>	1119	722	Jesus	2015-11-25 15:45:00	2	\N	\N	<p>-----[Nov-19-15 09:48 AM Isabel M.]-----</p><p>Envie texto</p><p>-----[Nov-19-15 09:45 AM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-19 09:45:33	2015-11-19 09:52:42	616	616	\N
10531	2015-11-25	2015-11-25	Workers Compensation	Martha	Villegas Trejo	1961-05-25	992-79-4346	(619) 288-4005	\N	\N	4148 Vandyke  Apt. 5	\N	\N	San Diego	\N	92105	CT: 10-21-2013-11-07-2015	L / FOOT,R / FOOT,R / ARM,R / HAND,FINGERS,R / WRIST,STRESS	\N	\N	0	San Diego Desserts/Bistro 60	1176	612	<p>-----[Nov-25-15 05:32 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">SD/LH @ 2.67 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Murrieta/Gogatz @ 61.74 miles</p><p class="MsoNormal"><br></p><p class="MsoNormal">Envie cita L/O &nbsp;y documentos a clinica</p><p class="MsoNormal"><o:p></o:p></p></p>	1128	719	Jenny	2015-12-10 11:15:00	2	\N	\N	\N	0	\N	\N	\N	2015-11-25 17:32:55	2015-11-25 17:32:55	616	616	\N
10382	2015-11-12	2015-11-12	Workers Compensation	Juan Carlos	Valenzuela	1963-08-04	543-39-4747	(619) 381-0522	\N	\N	5946 Wenrich Dr.	\N	\N	San Diego	\N	92120	10-08-2015	BACK,LOWER BACK,L / ELBOW,R / ELBOW,R / SHOULDER,L / SHOULDER,R / HAND,L / HAND,FINGERS,L / ARM,R / ARM,R / KNEE,L / KNEE,L / FOOT,R / FOOT,R / HIP,L / HIP	\N	\N	0	makelele Systems Landscape and Maintenance, Inc	1176	612	<p>-----[Nov-12-15 04:55 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">SD / LH @ 6.4 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Mission Valley / RB Spine @ 5.65\nmiles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica y cita L/O</span><br></p></p>	1128	719	Jenny	2015-11-19 16:15:00	2	\N	\N	<p>-----[Nov-12-15 04:55 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	1	\N	Emily	2015-11-19	2015-11-12 16:55:11	2015-11-23 11:46:09	616	611	\N
10231	2015-11-03	2015-11-03	Workers Compensation	Miguel	Ruiz	1960-09-28	561-71-4454	(619) 646-0475	\N	\N	482 W. San Ysidro Blvd. PMB 2524	\N	\N	San Ysidro	\N	92173	03-10-2014	R / ARM,L / ARM,BACK	\N	\N	0	AV Trucking & Logistics, Inc	1176	612	<p>-----[Nov-05-15 05:25 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-05-15 11:27 AM Isabel M.]-----</p><p><span style="color: rgb(51, 51, 51); font-family: HelveticaNeue-Roman, HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; line-height: normal; background-color: rgb(245, 245, 245);">Reenvie correo a clinica</span></p><p>-----[Nov-04-15 09:06 AM Isabel M.]-----</p><p>Reenvie correo a clinica</p><p>-----[Nov-03-15 10:59 AM Isabel M.]-----</p><p>El abogado pidio su cita en San Ysidro, envie los documentos a clinica</p>	1163	741	Linda	2015-11-23 10:00:00	2	\N	\N	<p>-----[Nov-05-15 05:25 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	\N	\N	\N	\N	2015-11-03 10:59:30	2015-11-05 17:25:59	616	616	\N
10504	2015-11-25	2015-11-25	Workers Compensation	Ramiro	Gonzalez	1970-04-15	604-26-3386	(714) 232-6578	\N	\N	6272 Stanton Ave	\N	Apt C	Buena Park	\N	90621	CT: 07/13/2014-07/13/2015	SPINE,HEAD	\N	1189	0	Romano's Macaroni Grill	1176	817	\N	1072	743	Marisol	2015-11-30 09:30:00	1	\N	\N	\N	0	\N	\N	\N	2015-11-25 10:02:00	2015-11-25 10:02:00	611	611	\N
10537	2015-11-25	2015-11-25	Workers Compensation	Esperanza	Servin	1956-11-09	621-12-2220	(323) 895-6678	\N	\N	333 S. Avenue 20	\N	\N	Los Angeles	\N	90031	06/15/2014-06/15/2015	LOWER BACK,UPPER BACK,L / LEG	\N	\N	0	Escula Albion	1176	817	\N	1148	776	Judith	2015-12-03 10:00:00	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-30 09:48:53	2015-11-30 09:55:41	611	611	\N
10211	2015-11-02	2015-11-02	Workers Compensation	Jorge Luis	Avila	1970-12-15	605-58-3778	(323) 420-5063	\N	\N	7908 Crafton Ave.	\N	\N	Cudahy	\N	90201	1.- 09-21-2015 ; 2.- CT: 10-26-2013 - 10-26-2015	LOWER BACK,L / THIGH,R / THIGH	1.- R. rib, cocyx ; 2.- Shoulders, wrists, knees, head, buttocks, things	\N	0	CAD Green Acres Corporation DBA People To People Staffing	1176	612	<p>-----[Nov-06-15 11:30 AM Lily E.]-----</p><p>Per Ariana @ clinic the client was a no show on 11/04 @ 5:00 PM</p><p>-----[Nov-02-15 12:24 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">Pico Rivera/Gutierrez @ 5.06 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Whittier/Ford @ 9.55 miles &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style="line-height: 1.42857;">Envie documentos a clinica y cita &nbsp;L/O</span></p></p>	1112	766	Ariana	2015-11-04 17:00:00	\N	45	\N	<p>-----[Nov-02-15 12:24 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	\N	\N	\N	\N	2015-11-02 12:24:12	2015-11-06 11:30:19	616	611	\N
10291	2015-11-06	2015-11-06	Workers Compensation	Rosa M	Hernandez	1959-10-29	605-12-6834	(323) 580-4439	\N	\N	9628 Victoria Ave.	\N	\N	South Gate	\N	90280	12-12-2014	R / HAND,LOWER BACK	\N	\N	0	Culver City Meast Co.	1176	612	<p>-----[Nov-06-15 01:43 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Pico Rivera/Gutierrez @ 6.84 miles<o:p></o:p></p><p>\n\n<span style="font-size: 11pt; font-family: Calibri, sans-serif;">LA/MedNation @ 16.77 miles</span></p><p><span style="font-size: 11pt; font-family: Calibri, sans-serif;">La cliente ya asistio a Dr. Gutierrez el 10-29-2015 y toman el caso si lleva los medical record, Jesslyn llamo para que programaramos cita en Whittier , porque no tienen los medical record y hable con la cliente y ella no quiere ir ni a Whittier, ni Los Angeles, le informe a Lily y dijo que lo cancelaramos, envie correo L/O<br></span><br></p></p>	1326	\N	\N	\N	\N	55	2015-11-06 13:40:00	\N	0	\N	\N	\N	2015-11-06 13:43:23	2015-11-06 13:43:23	616	616	\N
10327	2015-11-10	2015-11-10	Workers Compensation	Eugenio T.	Tapia	1975-12-13	615-90-3564	(909) 241-0335	\N	\N	16253 Del Norte Dr	\N	\N	Victorville	\N	92395	CT: 02/16/2014 - 02/16/2015	R / SHOULDER,R / ARM,EYES,STRESS,PSYCH	anxiety, insomnia	1244	0	Briad Group LLC	1176	610	<p>-----[Nov-10-15 11:56 AM Daisy M.]-----</p><p>Disregard previous note, pt's phone Hx will be on 11-19-2015 @ 5:30 pm.&nbsp;</p><p>-----[Nov-10-15 11:52 AM Daisy M.]-----</p><p>Pt will have a phone HX on 11-20-2015 @ 5:00 pm.</p><p>-----[Nov-10-15 11:17 AM Daisy M.]-----</p><p><span style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;">Dr. De La Llana rejected the case due to pt has received all possible treatment, per Humberto ok to send to Southland Spine in Riverside.</span><br></p>	1121	747	Bianca	\N	1	\N	\N	\N	\N	\N	\N	\N	2015-11-10 11:17:34	2015-11-10 11:56:07	614	614	\N
10292	2015-11-06	2015-11-06	Workers Compensation	Jared	Smith	1976-06-15	529-25-0684	(619) 201-6625	\N	\N	26 Adelfa St	\N	\N	Rancho Mission Viejo	\N	92694	06/02/2015	R / SHOULDER	\N	1221	0	Core Mark International	1168	648	<p>-----[Nov-06-15 05:09 PM Daisy M.]-----</p><p><p>Per Tania @ YDC schedule in Santa Ana.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-06-15 01:51 PM Daisy M.]-----</p><p><p>Options provided to Tania:&nbsp;</p><p class="MsoNormal"><span style="color:#1F497D;mso-themecolor:dark2">Costa Mesa\n/ Southland Spine – 25.7 miles <o:p></o:p></span></p><p>\n\n</p><p class="MsoNormal"><span style="color:#1F497D;mso-themecolor:dark2">Santa Ana /\nKeystone Medical Group – 23.1 miles&nbsp;<o:p></o:p></span></p></p>	1335	793	Jesus	2015-11-12 15:15:00	1	\N	\N	\N	1	\N	Jesus	2015-11-12	2015-11-06 13:51:24	2015-11-17 09:37:49	614	611	\N
10289	2015-11-06	2015-11-06	Workers Compensation	Maricruz	Holguin AKA  Maricruz Vega	1973-12-24	603-45-6771	(909) 495-5198	\N	\N	632 W. 16th St.	\N	\N	San Bernardino	\N	92405	1.-CT: 05-01-2013 -05-01-2014  ;  2.-  03-01-2014	L / WRIST,R / HAND,L / HAND,FINGERS	2.- Lower  back	\N	0	Riverside Market Broiler., LLC	1176	612	<p>-----[Nov-06-15 11:57 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Montgomery/SB @ 7.22 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Fontana/LH @ 11.45 miles</p><p class="MsoNormal"><o:p><br></o:p></p><p class="MsoNormal"><o:p>Envie cita L/O y documentos a clinica</o:p></p></p>	1125	749	Esther	2015-11-17 08:30:00	2	\N	\N	<p>-----[Nov-06-15 11:57 AM Isabel M.]-----</p><p>Conf. con Pt.</p>	1	\N	Erika	2015-11-17	2015-11-06 11:57:43	2015-11-18 12:26:12	616	611	\N
10262	2015-11-04	2015-11-04	Workers Compensation	Juana	Gonzalez De Garcia	1957-06-26	\N	(619) 408-7592	\N	\N	4082  51th St. Apt.C	\N	\N	San Diego	\N	92105	CT: 10-17-2013 - 10-17-2014	R / ARM,L / ARM,R / ELBOW,L / ELBOW,R / HAND,FINGERS,R / WRIST,R / SHOULDER,L / SHOULDER	Ears	\N	0	Angelica Textile Services, Inc	1176	612	<p>-----[Nov-05-15 05:22 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-05-15 11:27 AM Isabel M.]-----</p><p><span style="color: rgb(51, 51, 51); font-family: HelveticaNeue-Roman, HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; line-height: normal; background-color: rgb(245, 245, 245);">Reenvie correo a clinica</span></p><p>-----[Nov-04-15 03:53 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">RB/Mission Valley @ 5.89 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">RB/San Ysidro @ 15.28 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica</span><br></p></p>	1162	741	Linda	2015-11-19 08:00:00	2	\N	\N	<p>-----[Nov-05-15 05:22 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-04 15:53:14	2015-11-05 17:22:36	616	616	\N
10294	2015-11-06	2015-11-06	Workers Compensation	Jose Alfredo	Tec	1966-08-20	623-20-2026	(562) 726-0547	\N	\N	3134 W. Coolidge Ave.	\N	\N	Anaheim	\N	92801	CT: 03-15-2014 - 03-15-2015	NECK,R / FOREARM,L / FOREARM,BACK,R / SHOULDER,L / SHOULDER	\N	\N	0	Prime Auto Resources Inc DBA  Prime Auto Detailling California	1176	612	<p>-----[Nov-06-15 02:20 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Aun/Anaheim @ 6.64 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Whittier/Ford @ 12.44 miles</p><p class="MsoNormal">Envie documentos a clinica y cita L/O</p><p class="MsoNormal"><o:p></o:p></p></p>	1072	743	Genell	2015-11-13 09:30:00	2	\N	\N	\N	1	\N	Janelle	2015-11-13	2015-11-06 14:20:50	2015-11-17 10:11:01	616	611	\N
10338	2015-11-10	2015-11-10	Workers Compensation	Brenda Guadalupe	Lopez	1986-08-15	607-88-6281	(626) 625-3083	\N	\N	5228 Acacia St.	\N	\N	San Gabriel	\N	91778	CT: 04-29-2014 - 04-29-2015	BACK,L / ANKLE,R / ANKLE	Heels	\N	0	Universal Protection Services	1176	612	<p>-----[Nov-11-15 10:15 AM Isabel M.]-----</p><p>Envie cita&nbsp;</p><p>-----[Nov-11-15 09:59 AM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-10-15 04:58 PM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-10-15 04:44 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Greenfield/El Monte @ 7.67 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">West Covina/Multi Care @ 11.55\nmiles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Deje mensaje</span><br></p></p>	1074	774	Maggie	2015-11-23 08:00:00	2	\N	\N	<p>-----[Nov-11-15 10:15 AM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-10 16:44:35	2015-11-11 10:15:43	616	616	\N
10287	2015-11-06	2015-11-06	Workers Compensation	Jose	Sibrian	1978-08-10	602-31-1085	(559) 356-9510	\N	\N	735 1/2 Merced Street	\N	\N	Parlier	\N	93648	1. CT: 12/02/2013 - 12/02/2014    2. 10/15/2014	NECK,R / KNEE,R / ELBOW,SLEEP DISORDER	1. spine    2. right knee, right elbow	1307	0	Varo Construction	1169	610	<p>-----[Nov-10-15 09:49 AM Daisy M.]-----</p><p>Per Humberto cancel .&nbsp;</p><p>-----[Nov-06-15 10:49 AM Daisy M.]-----</p><p><p>Advised Humberto that the closest clinic we have for pt is in Bakersfield w/ Dr. Price @ 99.4 miles.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1326	\N	\N	\N	\N	48	2015-11-10 09:45:00	\N	0	\N	\N	\N	2015-11-06 10:49:01	2015-11-10 09:49:13	614	614	\N
10449	2015-11-19	2015-11-19	Workers Compensation	Xochitl	Alvarez Gonzalez	1967-01-09	480-08-9372	(661) 229-3415	\N	(661) 148-7948	700 S. Shafter Space 55	\N	\N	Shafter	\N	93263	CT: 07-01-2014 - 07-01-2015	R / ELBOW,R / WRIST,HEAD,R / KNEE,L / KNEE,L / FOOT,R / FOOT,L / ANKLE,R / THIGH,L / THIGH	\N	1307	1	MG & Sons Inc	1176	612	<p>-----[Nov-24-15 05:00 PM Isabel M.]-----</p><p>Envie cita &nbsp;L/O</p><p>-----[Nov-23-15 05:14 PM Isabel M.]-----</p><p><p>Vanessa pidio la cita medica sin MPN, envie documentos a clinica y lo removi de cancelado</p><p><br></p></p><p>-----[Nov-19-15 05:53 PM Isabel M.]-----</p><p>Envie correo que no hay Dr. en MPN</p>	1159	808	Alex	2015-12-03 10:00:00	2	\N	\N	<p>-----[Nov-24-15 05:00 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	\N	\N	\N	\N	2015-11-19 17:53:53	2015-11-24 17:00:18	616	616	\N
10510	2015-11-24	2015-11-24	Workers Compensation	Marvin	Mendoza	1993-02-23	603-64-0973	(424) 325-9594	\N	\N	730 W. El Segundo Blvd.	\N	Apt 203	Gardena	\N	90247	10-05-2015	SPINE,R / HIP,L / HIP,L / LEG,L / KNEE	\N	\N	0	Fiverglass Services Inc.	1169	610	\N	1073	743	Vanessa	2015-12-01 14:30:00	\N	\N	\N	\N	0	\N	\N	\N	2015-11-25 11:12:36	2015-11-25 11:12:36	611	611	\N
10257	2015-11-04	2015-11-04	Workers Compensation	Gonzalo	Lopez	1964-11-25	618-92-0527	(424) 772-9105	\N	\N	541 N. Marine Ave Apt 3	\N	\N	Wilmington	\N	90744	06/17/2015	R / HIP,L / HIP,NECK,R / FOOT	spine, right testicle, abdomen	1250	1	Fujimoto Landscaping Inc	1176	817	<p>-----[Nov-09-15 09:39 AM Daisy M.]-----</p><p><span style="color: rgb(89, 126, 162); line-height: 21.4286px; background-color: rgb(236, 240, 241);">Advised Silvia @ L/O that we will go ahead and place case on cancel status as we have no Dr within the MPN.&nbsp;</span></p><p>-----[Nov-04-15 03:23 PM Daisy M.]-----</p><p>Advised Silvia from L/O that we have no Dr within the MPN.&nbsp;</p>	1326	\N	\N	\N	\N	47	2015-11-09 09:35:00	\N	0	\N	\N	\N	2015-11-04 15:15:04	2015-11-09 09:39:16	614	614	\N
10309	2015-11-09	2015-11-09	Workers Compensation	Carlos	Herrera	1989-08-28	626-28-4529	(805) 276-4549	\N	\N	463 N. 5 St.	\N	\N	Port Hueneme	\N	93041	CT: 10-30-2014 - 10-30-2015	LOWER BACK,L / KNEE	Spine	\N	0	Barrett Business Services, Inc	1176	612	<p>-----[Nov-09-15 11:13 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Reseda/MedNation @ 43.24 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">NobleQuest/Van Nuys @ 49.13 miles</p><p class="MsoNormal">El cliente no quiere continuar con su caso porque dice que salio una nueva oportunidad de trabajo , Daysi le informo a Vanessa, Envie correo L/O tambien</p><p class="MsoNormal"><o:p></o:p></p></p>	1326	\N	\N	\N	\N	49	2015-11-09 11:10:00	\N	0	\N	\N	\N	2015-11-09 11:13:31	2015-11-09 11:15:00	616	616	\N
10252	2015-11-04	2015-11-04	Workers Compensation	Paula	Ramirez	1994-09-11	\N	(323) 439-0215	\N	\N	7011 S. Main St.  Apt. 4	\N	\N	Los Angeles	\N	90003	CT: 12-17-2013 - 12-17-2014	BACK,L / LEG,R / LEG,NECK	Heels	\N	0	Arco,  Inc	1176	612	<p>-----[Nov-06-15 10:00 AM Isabel M.]-----</p><p><span style="line-height: 21.4286px;">Deje mensaje, enviare correo L/O de cancelacion por no contacto</span></p><p>-----[Nov-05-15 05:02 PM Isabel M.]-----</p><p><span style="color: rgb(89, 126, 162); line-height: 21.4286px; background-color: rgb(236, 240, 241);">Deje mensaje</span></p><p>-----[Nov-05-15 08:49 AM Isabel M.]-----</p><p><span style="line-height: 21.4286px;">Envie correo L/O de no contacto</span></p><p>-----[Nov-05-15 08:43 AM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-04-15 02:29 PM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-04-15 02:01 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">LA / Industrial – 6.84 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Downey / SoCal Chiros – 14.11\nmiles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Deje mensaje&nbsp;</span><br></p><p class="MsoNormal"><o:p></o:p></p></p>	1326	\N	\N	\N	\N	69	2015-11-06 10:00:00	\N	0	\N	\N	\N	2015-11-04 14:01:27	2015-11-06 10:00:54	616	616	\N
10293	2015-11-06	2015-11-06	Personal Injury	Simona	Moreno	1964-09-28	\N	(323) 385-4335	\N	(323) 751-4452	8302 S. Main St Apt 1	\N	\N	Los Angeles	\N	90003	10/31/2015	HEAD,NECK,R / FOOT,R / ANKLE,L / WRIST,R / WRIST	\N	\N	0	\N	1176	612	<p>-----[Nov-06-15 02:15 PM Daisy M.]-----</p><p><p>LA / MedNation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1097	736	Yanira	2015-11-11 09:00:00	2	\N	\N	\N	1	\N	Yanira	2015-11-11	2015-11-06 14:15:45	2015-11-17 09:34:35	614	611	\N
10266	2015-11-04	2015-11-04	Workers Compensation	Joel Leon	Angel	1979-03-04	613-90-7869	(323) 498-9105	\N	\N	4882 Huntington Park Dr.	\N	\N	Los Angeles	\N	90032	1.- CT: 05-01-2013- 02-23-2015  ;  2.- 01-29-2014	R / SHOULDER,L / SHOULDER,R / ARM,L / ARM,R / ELBOW,L / ELBOW,L / WRIST,R / WRIST,R / HAND,L / HAND,FINGERS,LOWER BACK	2.- R. foot	\N	0	M.P and F, Inc	1176	612	<p>-----[Nov-05-15 05:15 PM Isabel M.]-----</p><p><span style="color: rgb(89, 126, 162); line-height: 21.4286px; background-color: rgb(236, 240, 241);">Envie cita L/O</span></p><p>-----[Nov-05-15 11:32 AM Isabel M.]-----</p><p><span style="color: rgb(51, 51, 51); font-family: HelveticaNeue-Roman, HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; line-height: normal; background-color: rgb(245, 245, 245);">Reenvie correo a clinica</span></p><p>-----[Nov-04-15 05:19 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">LA / RB Spine – 3.00 miles <o:p></o:p></p><p>\n\n</p><p class="MsoNormal">El Monte / Greenfield – 11.70\nmiles</p><p class="MsoNormal">Envie documentos a clinica&nbsp;<o:p></o:p></p></p>	1164	809	Linda	2015-11-20 13:00:00	2	\N	\N	<p>-----[Nov-06-15 10:17 AM Isabel M.]-----</p><p>Conf. con Pt.</p><p>-----[Nov-06-15 09:47 AM Isabel M.]-----</p><p>No contesta</p><p>-----[Nov-05-15 05:15 PM Isabel M.]-----</p><p>No contesto</p>	0	\N	\N	\N	2015-11-04 17:19:50	2015-11-06 10:17:43	616	616	\N
10420	2015-11-18	2015-11-18	Workers Compensation	Manuel G	Cortes	1968-12-31	624-14-8462	(760) 609-3080	\N	\N	86-176 Palmeras Circle	\N	\N	Coachella	\N	92236	CT: 07-20-2013 - 07-20-2014	BACK,L / FOOT	\N	\N	0	Toll Bros, Inc	1176	612	<p>-----[Nov-18-15 12:30 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Southland Spine/Riverside @ 77.46\nmiles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">SB/Montgomery @ 74.08 miles</p><p class="MsoNormal">El cliente le parece muy lejos, le envie correo L/O</p><p class="MsoNormal"><o:p></o:p></p></p>	1326	\N	\N	\N	\N	48	2015-11-18 12:30:00	\N	0	\N	\N	\N	2015-11-18 12:30:41	2015-11-18 12:30:41	616	616	\N
10314	2015-11-09	2015-11-09	Workers Compensation	Jose	Torres	1952-04-21	619-09-4921	(805) 815-6384	\N	\N	931 Bismark Way	\N	\N	Oxnard	\N	93033	CT: 10/30/2014 - 10/30/2015	L / ARM,R / HIP,L / HIP,LOWER BACK,R / SHOULDER,L / SHOULDER	right stomach ache, spine	\N	0	BBSI	1176	817	<p>-----[Nov-12-15 09:05 AM Daisy M.]-----</p><p>Advised Silvia case will be cancelled until advised on how to proceed.&nbsp;</p><p>-----[Nov-11-15 08:42 AM Daisy M.]-----</p><p>Emailed Silvia @ L/O to follow up in regards to scheduling pt in Reseda.&nbsp;</p><p>-----[Nov-10-15 09:39 AM Daisy M.]-----</p><p>Per Silvia @ L/O she is going to call pt and verify if distance is ok with him.&nbsp;</p><p>-----[Nov-09-15 01:37 PM Daisy M.]-----</p><p>Emailed Silvia @ L/O to request pt's DOI and also to advise her that the closest clinic we have for pt is MedNation in Reseda @ approx 41.42 miles.&nbsp;</p>	1326	\N	\N	\N	\N	55	2015-11-12 09:05:00	\N	0	\N	\N	\N	2015-11-09 13:37:41	2015-11-12 09:05:24	614	614	\N
10290	2015-11-06	2015-11-06	Workers Compensation	Maria de Jesus	Garces	1973-10-13	611-86-2314	(714) 654-4295	\N	\N	700 S. Lyon Street Apt 128	\N	\N	Santa Ana	\N	92705	CT: 10/07/2013 - 10/07/2014	R / ARM,L / ARM,R / HAND,L / HAND,L / ELBOW,R / ELBOW,NECK	\N	1248	1	Mirion Technologies	1176	612	<p>-----[Nov-06-15 02:05 PM Daisy M.]-----</p><p><p>Per Vanessa schedule in Anaheim.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-06-15 01:44 PM Daisy M.]-----</p><p><p>MPN options provided to L/O:&nbsp;</p><p class="MsoNormal"><span lang="ES-MX" style="color:#1F497D;mso-ansi-language:\nES-MX">Anaheim / Bryan Aun&nbsp; - 5.6 miles<o:p></o:p></span></p><p class="MsoNormal"><span lang="ES-MX" style="color:#1F497D;mso-ansi-language:\nES-MX">Costa Mesa / Max Matos &amp; Bruce DeCarlo – 8.2 miles<o:p></o:p></span></p><p>\n\n\n\n</p><p class="MsoNormal"><span lang="ES-MX" style="color:#1F497D;mso-ansi-language:\nES-MX">&nbsp;</span></p></p>	1072	743	David	2015-11-13 13:30:00	2	\N	\N	\N	1	\N	Janelle	2015-11-13	2015-11-06 12:10:54	2015-11-17 10:10:29	614	611	\N
10295	2015-11-06	2015-11-06	Workers Compensation	Roberto Carlos	Nunez	1991-09-22	610-50-3872	(661) 470-0723	\N	\N	43560 Gadson Avenue Apt 39	\N	\N	Lancaster	\N	93534	04/02/2015	L / HAND,L / WRIST	left thumb finger	1221	1	Chilli's Grill and Bar	1176	612	<p>-----[Nov-10-15 09:49 AM Daisy M.]-----</p><p><span style="line-height: 21.4286px;">Advised Jesselin that case will be placed on cancel status as we have no Dr within the MPN.&nbsp;</span></p><p>-----[Nov-06-15 03:30 PM Daisy M.]-----</p><p><p>Advised L/O that we have no Dr within the MPN.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1326	\N	\N	\N	\N	47	2015-11-10 09:45:00	\N	0	\N	\N	\N	2015-11-06 14:21:03	2015-11-10 09:49:51	614	614	\N
10268	2015-11-05	2015-11-05	Workers Compensation	Maria	Melia	1951-10-10	547-04-4861	(626) 252-7007	\N	\N	11643 Mullhall St.	\N	\N	El Monte	\N	91732	CT: 11-01-2012 - 11-01-2013	R / HIP,NECK,BACK,R / LEG,R / KNEE,L / FOOT,R / FOOT,R / ANKLE	Headaches	1315	0	Crothall Healthcare, Inc	1176	612	<p>-----[Nov-24-15 11:47 AM Isabel M.]-----</p><p>Le enviare un correo L/O , para saber si tienen un QMS o AME , para poderla enviar a otra clinica</p><p>-----[Nov-18-15 05:20 PM Lily E.]-----</p><p>Per Maggie @ clinic the doctor Mahboubian rejected the case due to the client has already exhausted all treatment. Advised Isabel</p><p>-----[Nov-05-15 12:06 PM Isabel M.]-----</p><p><p><span style="font-size: 11pt; font-family: Calibri, sans-serif;">Es un PTP change</span></p><p><span style="font-size: 11pt; font-family: Calibri, sans-serif;">Envie cita L/O y documentos a clinica</span></p></p>	1326	774	Maggie	2015-11-23 08:30:00	\N	52	2015-11-24 11:45:00	\N	0	\N	\N	\N	2015-11-05 12:06:01	2015-11-24 11:47:45	616	616	\N
10413	2015-11-17	2015-11-17	Workers Compensation	Arturo	Naranjo Serano	1960-02-16	562-21-8220	(818) 336-2089	\N	\N	9825 Laurel Canyon Blvd # 123	\N	\N	Paicoma	\N	91331	CT: 11-07-2013 - 11-07-2015	L / HAND,R / HAND,FINGERS,L / ELBOW,R / ELBOW,R / SHOULDER,L / SHOULDER,NECK,BACK	\N	\N	0	Fullo Life Ins	1176	817	<p>-----[Nov-18-15 10:01 AM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-17-15 04:47 PM Isabel M.]-----</p><p>Envie documentos a clinica</p>	1152	794	Henry	2015-11-24 09:45:00	1	\N	\N	\N	0	\N	\N	\N	2015-11-17 16:47:11	2015-11-18 10:01:33	616	616	\N
10453	2015-11-20	2015-11-20	Workers Compensation	Marcos	Cruz Cazarez	1977-10-07	\N	(213) 379-1837	\N	\N	914 Alvarado St. Apt. 401	\N	\N	Los Angeles	\N	90006	CT: 02-02-2015 - 11-02-2015	R / LEG,L / LEG,R / KNEE,L / KNEE,R / HAND,L / HAND,CHEST	\N	\N	0	Pink Taco	1176	612	<p>-----[Nov-20-15 02:23 PM Isabel M.]-----</p><p>Envie docuemntos a clinica y cita L/O</p><p>-----[Nov-20-15 01:58 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Industrial/LA @ 1.62 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Daher/Glendale @ 9.64 miles<o:p></o:p></p></p>	1148	794	Judith	2015-11-30 14:30:00	2	\N	\N	<p>-----[Nov-20-15 02:23 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-20 13:58:44	2015-11-20 14:23:25	616	616	\N
10297	2015-11-06	2015-11-06	Workers Compensation	Jose Manuel	Alvarez	1965-03-21	556-87-4996	(818) 714-3923	\N	\N	10559 Kewen Avenue	\N	\N	Pacoima	\N	91331	CT: 09/05/2014 - 09/05/2015	R / KNEE	\N	1178	0	American Ironworks Mfg, Inc	1176	612	<p>-----[Nov-09-15 09:42 AM Daisy M.]-----</p><p><p class="MsoNormal"><span style="color:#993366">Advised L/O that I called pt to\nprovide him with this clinic options and he advised me that he is already\nscheduled to see a Dr that the atty's office sent him to. Please note that we will go\nahead and place case on cancel status until we are advised on how to proceed. &nbsp;<o:p></o:p></span></p></p><p>-----[Nov-06-15 02:30 PM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>Van Nuys/NobleQuest - 5.43 miles</p><p>Reseda/MedNation - 11.65 miles</p><p>Called pt to provide him with the clinic options and he stated that he already has an appt to see a Dr and this was provided to him by the atty's office, emailed Jesselin to advise her.&nbsp;</p></p>	1326	\N	\N	\N	\N	52	2015-11-09 09:40:00	\N	0	\N	\N	\N	2015-11-06 14:30:38	2015-11-09 09:42:07	614	614	\N
10286	2015-11-06	2015-11-06	Workers Compensation	Maria Lourdes	Santana	1962-10-23	606-09-6636	(714) 349-1812	\N	\N	938 N. Ventura St	\N	\N	Anaheim	\N	92801	03/10/2014	R / KNEE,L / KNEE,SLEEP DISORDER	\N	1219	1	Anaheim City School District	1169	610	<p>-----[Nov-06-15 10:57 AM Daisy M.]-----</p><p><p>Per Humberto cancel.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-06-15 10:41 AM Daisy M.]-----</p><p><p>Correct link provided by Humberto:&nbsp;<span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;mso-bidi-font-family:\n&quot;Times New Roman&quot;;color:#1F497D;mso-ansi-language:EN-US;mso-fareast-language:\nEN-US;mso-bidi-language:AR-SA"><a href="http://www.keenan.com/resources/provider-locator-tools/">http://www.keenan.com/resources/provider-locator-tools/</a></span></p><p><span style="color: rgb(31, 73, 125); font-family: Calibri, sans-serif; font-size: 14.6667px; line-height: 20.9524px;">then click on "Prime Advantage Link"</span></p><p><span style="color: rgb(31, 73, 125); font-family: Calibri, sans-serif; font-size: 14.6667px; line-height: 20.9524px;">Advised Humberto that we have no Dr within the MPN.&nbsp;</span></p></p><p>-----[Nov-06-15 10:18 AM Daisy M.]-----</p><p><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;mso-bidi-font-family:\n&quot;Times New Roman&quot;;mso-ansi-language:EN-US;mso-fareast-language:EN-US;\nmso-bidi-language:AR-SA">MPN link provided by Humberto @ L/O:&nbsp;<a href="https://keenan.harborsys.com/NMS/NetworkSearch.aspx">https://keenan.harborsys.com/NMS/NetworkSearch.aspx</a>&nbsp;</span></p>	1326	\N	\N	\N	\N	47	2015-11-06 10:55:00	\N	0	\N	\N	\N	2015-11-06 10:18:26	2015-11-06 10:57:25	614	614	\N
10333	2015-11-10	2015-11-10	Workers Compensation	Israel	Duarte	1960-07-25	544-01-9272	(714) 720-5218	\N	\N	1413 S. Standard Ave. Apt. 10	\N	\N	Santa Ana	\N	92707	1.- 08-25-2013  ; 2.- 08-27-2013	NECK,R / SHOULDER,R / ARM,R / HAND,BACK	2.-Lower back,  R, thing	1304	0	Pacific Gold Farms	1176	612	<p>-----[Nov-10-15 03:17 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Keystone/Santa Ana @ 5.30 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Costa Mesa/S. Spine @ 5.72 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie cita L/O y documentos a clinica</span><br></p></p>	1335	819	Jesus	2015-11-12 13:00:00	2	\N	\N	<p>-----[Nov-10-15 03:17 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	1	\N	Jesus	2015-11-12	2015-11-10 15:17:25	2015-11-17 09:37:31	616	611	\N
10305	2015-11-06	2015-11-06	Workers Compensation	Miguel Zarahi	Del Rio	1969-09-28	615-25-8578	(661) 418-8697	\N	\N	244 E. Ave P5	\N	\N	Palmdale	\N	93550	1.- 05-12-2015 ;  2.- CT:  02-01-2015 - 10-27-2015	R / HAND	1.- R. index finger, R. thumb finger  ; 2.- Back, chest	\N	0	Mi Ranchito Mini Market	1176	612	<p>-----[Nov-06-15 04:17 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Van Nuys/Noble Quest @ 45.66 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Reseda/MedNation @ 46.70 miles</p><p class="MsoNormal">El cliente dice que esta muy lejos ala clinica, le envie correo a L/O</p><p class="MsoNormal"><o:p></o:p></p></p>	1326	\N	\N	\N	\N	48	2015-11-04 16:15:00	\N	0	\N	\N	\N	2015-11-06 16:17:11	2015-11-06 16:17:12	616	616	\N
10246	2015-11-04	2015-11-04	Workers Compensation	Jesus	Brito	1982-11-20	557-73-6858	(619) 431-7271	\N	\N	2455 Otay Center Drive #118-804	\N	\N	Otay Mesa	\N	92154	CT: 12/01/2013 - 05/01/2014	L / LEG,BACK	left testicle	\N	0	Merchants Landscape Services	1176	612	<p>-----[Nov-09-15 09:31 AM Daisy M.]-----</p><p><p>Advised Jesselin that case will be placed on cx status until advised on how to proceed.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-05-15 01:50 PM Daisy M.]-----</p><p><p>Per Linda @ clinic Dr is not willing to take the case due to CT being less than a year, emailed L/O to advise on how to proceed.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-04-15 10:13 AM Daisy M.]-----</p><p><p>Per L/O schedule pt in San Ysidro / RB Spine. Paperwork emailed to the clinic.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1326	\N	\N	\N	\N	52	2015-11-09 09:30:00	\N	0	\N	\N	\N	2015-11-04 10:13:28	2015-11-09 09:31:34	614	614	\N
10424	2015-11-18	2015-11-18	Workers Compensation	Anselmo	Galvez Vivar	1992-07-04	535-25-7098	(559) 329-9823	\N	\N	635 N. Fisher St. Apt. 101	\N	\N	Fresno	\N	93702	11-04-2015	HEAD	L. index and middle finger	\N	0	Bee Sweet Citrus	1176	612	<p>-----[Nov-18-15 04:27 PM Isabel M.]-----</p><p><p>Puse la Head, para que dejara grabar</p><p>Opciones de clinicas:</p><p class="MsoNormal">Bakersfield/BMG @ 112.26 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/Noble Quest @ 204.47\nmiles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Al cliente le parece muy lejos, envie correo L/O</span><br></p></p>	1326	\N	\N	\N	\N	48	2015-11-18 16:25:00	\N	0	\N	\N	\N	2015-11-18 16:27:29	2015-11-18 16:27:29	616	616	\N
10543	2015-11-30	2015-11-30	Workers Compensation	Bulmaro	Roblero	1959-10-21	624-09-9870	(323) 570-7507	\N	\N	3032 Sussex Ln #7	\N	\N	Los Angeles	\N	90023	CT: 11/06/2014 - 11/06/2015	L / HAND,R / HAND,BACK,FINGERS,EYES,R / KNEE	skull	\N	0	Preier Meat Company	1176	817	<p>-----[Nov-30-15 11:04 AM Daisy M.]-----</p><p>LA / Indsutrial&nbsp;</p>	1148	776	Judith	2015-12-03 10:00:00	1	\N	\N	\N	\N	\N	\N	\N	2015-11-30 11:04:29	2015-11-30 12:13:26	614	614	\N
10308	2015-11-09	2015-11-09	Workers Compensation	Miguel Angel	Rivas	1970-10-10	619-22-9260	(661) 268-9461	\N	(661) 789-8067	3228 East Ave R-8	\N	\N	Palmdale	\N	93550	09/17/2013	L / KNEE	\N	1186	1	Cali Painting Inc	1168	690	<p>-----[Nov-09-15 11:24 AM Daisy M.]-----</p><p>Per Tania cancel.&nbsp;</p><p>-----[Nov-09-15 10:52 AM Daisy M.]-----</p><p><p>Advised Tania @ YDC that we have no Dr within the MPN.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1326	\N	\N	\N	\N	47	2015-11-09 11:20:00	\N	0	\N	\N	\N	2015-11-09 10:52:46	2015-11-09 11:24:52	614	614	\N
10374	2015-11-12	2015-11-12	Workers Compensation	William	Romero	1992-01-05	652-72-3991	(562) 206-3768	\N	\N	1850 W Orangethorpe Avenue	\N	\N	Fullerton	\N	92833	08/01/2015	L / HAND,L / ARM	\N	1244	0	LYMI, Inc	1174	612	<p>-----[Nov-12-15 02:52 PM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>Santa Ana / Keystone - 11.3 miles</p><p>Costa Mesa / Southland Spine - 19.3 miles</p><p>Per Vanessa @ L/O schedule in Santa Ana.&nbsp;</p></p>	1119	722	Jesus	2015-11-24 14:30:00	2	\N	\N	\N	\N	\N	\N	\N	2015-11-12 14:52:40	2015-11-12 17:00:25	614	614	\N
10465	2015-11-20	2015-11-20	Workers Compensation	Celia	Madrigal	1952-06-15	612-45-5915	(909) 633-0537	\N	(909) 975-9948	1472 9th St.	\N	\N	Upland	\N	91786	CT:  03-26-2012 - 03-26-2015	HEAD,R / SHOULDER,L / SHOULDER,R / WRIST,L / WRIST,R / HAND,L / HAND	Index finger, thumn	\N	0	Omega Interconnect Inc	1176	612	<p>-----[Nov-24-15 02:23 PM Isabel M.]-----</p><p>Envie Claim Form a la clinica</p><p>-----[Nov-23-15 05:29 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-20-15 05:23 PM Isabel M.]-----</p><p>No vienen las partes danadas del cliente , le envie correo L/O</p><p>-----[Nov-20-15 05:20 PM Isabel M.]-----</p><p><p style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;">Opciones de clinicas:</p><p class="MsoNormal" style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;">Montclair/Balian @ 3.85 miles<o:p></o:p></p><p style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;"></p><p class="MsoNormal" style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;">Fontana/LH @ 16.13 miles</p><p class="MsoNormal" style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;"><o:p></o:p></p><p style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;">La clinica ya cerro para hacer la cita</p></p>	1102	746	Maria	2015-12-15 09:30:00	2	\N	\N	<p>-----[Nov-25-15 11:23 AM Isabel M.]-----</p><p>Conf. con Pt.</p><p>-----[Nov-25-15 11:12 AM Isabel M.]-----</p><p>Deje mensaje y envie carta</p><p>-----[Nov-24-15 08:25 AM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-23-15 05:32 PM Isabel M.]-----</p><p>Deje Mensaje</p>	0	\N	\N	\N	2015-11-20 17:20:31	2015-11-25 11:23:25	616	616	\N
10306	2015-11-06	2015-11-06	Workers Compensation	Conrado	Duarte	1959-10-29	559-99-1056	(805) 986-4920	\N		664 Cuesta Del Mar	\N	\N	Oxnard	\N	93033	11/28/2014	LOWER BACK,HEAD,R / HIP,L / HIP,R / LEG,L / LEG	spine, toe fingers, both soles	1197	1	Barrett Business Services, Inc	1176	612	<p>-----[Nov-10-15 09:50 AM Daisy M.]-----</p><p><span style="line-height: 21.4286px;">Advised Jesselin that case will be placed on cancel status as we have no Dr within the MPN.&nbsp;</span></p><p>-----[Nov-06-15 04:39 PM Daisy M.]-----</p><p>Advised L/O that we have no Dr within the MPN.&nbsp;</p>	1326	\N	\N	\N	\N	47	2015-11-10 09:50:00	\N	0	\N	\N	\N	2015-11-06 16:39:36	2015-11-10 09:50:56	614	614	\N
10319	2015-11-09	2015-11-09	Workers Compensation	George	Lisalda	1961-01-28	\N	(951) 329-8593	\N	\N	6130 Camino Real Spc. 117	\N	\N	Riverside	\N	92509	08/04/2015	L / KNEE	\N	\N	0	County of Riverside	1169	610	\N	1119	722	Jesus	2015-11-16 14:30:00	1	\N	\N	\N	1	\N	Jesus	2015-11-16	2015-11-09 17:03:39	2015-11-18 12:05:03	614	611	\N
10439	2015-11-19	2015-11-19	Workers Compensation	Juvenal	Gutierrez	1972-11-19	613-09-0911	(818) 406-2239	\N	\N	1601 Morris Street	\N	\N	Oxnard	\N	93030	CT: 04/24/2010-04/24/2015	R / HIP,R / LEG,L / LEG,L / FOOT	toes, siatic nerve	\N	0	B & S Plastics	1176	612	<p>-----[Nov-20-15 02:36 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-20-15 11:50 AM Isabel M.]-----</p><p>Envie documentos a clinica</p><p>-----[Nov-20-15 11:46 AM Isabel M.]-----</p><p>No contesta y no se puede dejar mensaje</p><p>-----[Nov-19-15 03:18 PM Lily E.]-----</p><p><p>Clinic Options:</p><p>MedNation/Reseda @ 41.80 miles</p><p>Van Nuys/NobleQuest @ 47.69 miles</p></p>	1115	731	Yanira	2015-12-04 10:00:00	2	\N	\N	<p>-----[Nov-20-15 02:36 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-19 15:18:56	2015-11-20 14:36:53	611	616	\N
10284	2015-11-06	2015-11-06	Workers Compensation	Irma	Duran	1965-02-15	605-16-2922	(619) 581-2817	\N	\N	9236 Harness Street Apt C	\N	\N	Spring Valley	\N	91977	06/05/2015	NECK,BACK,LOWER BACK,L / ARM,L / SHOULDER,L / HAND,L / WRIST,FINGERS	teeth, lips	1306	1	Windsor Gardens Conv Ctr	1176	612	<p>-----[Nov-10-15 09:48 AM Daisy M.]-----</p><p>Advised Jesselin that case will be placed on cancel status as we have no Dr within the MPN.&nbsp;</p><p>-----[Nov-06-15 09:43 AM Daisy M.]-----</p><p>Advised Jesselin /Vanessa @ L/O that we have no Dr within the MPN.&nbsp;</p>	1326	\N	\N	\N	\N	47	2015-11-10 09:45:00	\N	0	\N	\N	\N	2015-11-06 09:32:36	2015-11-10 09:48:43	614	614	\N
10383	2015-11-12	2015-11-12	Workers Compensation	Hayasel	Garcia	1979-09-30	\N	(805) 612-9107	\N	\N	1300 Saratoga Ave. Apt.  406	\N	\N	Ventura	\N	93003	CT: 10-01-2013 - 10-01-2014	NECK,R / SHOULDER,L / SHOULDER,L / ARM,R / ARM,L / WRIST,R / WRIST,R / HAND,L / HAND,FINGERS,SPINE,HEAD	\N	\N	0	Service Master Building Maintenance	1176	612	<p>-----[Nov-12-15 05:19 PM Isabel M.]-----</p><p><p>Opciones de clinicas;</p><p class="MsoNormal">Reseda/MedNation @ 46.28 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 52.17 miles</p><p class="MsoNormal"><o:p><br></o:p></p><p class="MsoNormal"><o:p>El cliente le parece muy lejos . envie correo L/O</o:p></p></p>	1326	\N	\N	\N	\N	48	2015-11-12 17:25:00	\N	0	\N	\N	\N	2015-11-12 17:19:01	2015-11-12 17:22:54	616	616	\N
10334	2015-11-10	2015-11-10	Workers Compensation	Manuel	Picaso Gomez	1984-05-05	518-03-7187	(818) 616-0830	\N	\N	13044 Filmore Street	\N	\N	Pacoima	\N	91331	02/27/2015	R / ARM,R / HAND	\N	\N	0	Mohawk Bend	1169	610	<p>-----[Nov-30-15 04:38 PM Daisy M.]-----</p><p>Per Humberto @ L/O Dr. De La Llana in Van Nuys rejected the case (pt seen on 11-17-2015), switched pt to Reseda / MedNation.&nbsp;</p><p>-----[Nov-10-15 03:38 PM Daisy M.]-----</p><p>Van Nuys / NobleQuest&nbsp;</p>	1115	731	Jordy	2015-12-11 10:00:00	\N	\N	\N	\N	\N	\N		\N	2015-11-10 15:38:01	2015-11-30 16:55:43	614	614	\N
10388	2015-11-13	2015-11-13	Workers Compensation	Francisco	Torales	1973-05-30	571-42-4981	(323) 482-0120	\N	\N	2204 W. Olympic Blvd	\N	\N	Montebello	\N	90640	1. 07/30/2013     2. 10/22/2015     3. CT: 07/30/2013 - 10/22/2015	SPINE	2. spine, right leg, right hip     3. spine, hips, legs	1221	0	Smiths Group Services	1169	610	<p>-----[Nov-13-15 04:38 PM Daisy M.]-----</p><p>Pt's voicemail full, unable to confirm appt.&nbsp;</p><p>-----[Nov-13-15 12:16 PM Daisy M.]-----</p><p>Per Humberto @ L/O schedule with Dr. Harris in LA.&nbsp;</p>	1098	739	Desiree	2015-12-01 07:30:00	3	\N	\N	\N	\N	\N	\N	\N	2015-11-13 12:16:33	2015-11-25 17:23:32	614	611	\N
10560	2015-11-30	2015-11-30	Personal Injury	Fermin	Perez Reyes	1956-07-08	\N	(909) 465-0415	\N	\N	2246 Cynthia St.	\N	\N	Pomona	\N	91766	11-21-2015	NECK,HEAD,L / SHOULDER,MID BACK,LOWER BACK	\N	\N	0	\N	1176	612	<p>-----[Nov-30-15 04:30 PM Isabel M.]-----</p><p>Envie cita L/O Y documentos a clinica</p>	1077	764	John	2015-12-04 16:00:00	2	\N	\N	<p>-----[Nov-30-15 04:30 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-30 16:30:55	2015-11-30 16:39:10	616	616	\N
10532	2015-11-25	2015-11-25	Workers Compensation	Marco Antonio	Soto Mesina	1982-04-24	\N	(562) 225-1321	\N	\N	1142 E. Hellman St	\N	\N	Long Beah	\N	90813	03-01-2015	L / FOOT	Thumb	\N	0	Legendary Structures, Inc	1176	612	<p>-----[Nov-30-15 11:22 AM Isabel M.]-----</p><p>Envie cita L/O Y documentos a clinicasa</p><p>-----[Nov-25-15 05:38 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Aun/Downey @ 14.21 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">LA/MedNAtion @ 25.75 miles</p><p class="MsoNormal">La clinica esta cerrada por fiestas&nbsp;<o:p></o:p></p><p><br></p></p>	1073	743	Marisol	2015-12-08 16:00:00	2	\N	\N	\N	0	\N	\N	\N	2015-11-25 17:38:30	2015-11-30 11:22:03	616	616	\N
10321	2015-11-09	2015-11-09	Workers Compensation	Edwin J.	Villalta	1979-05-14	615-37-0935	(323) 620-6613	\N	\N	640 E. Colden Avenue	\N	\N	Los Angeles	\N	90002	1. 11/13/2013        2. 10/28/2015	LOWER BACK		1307	1	Celerity Contracting Services Inc	1176	612	<p>-----[Nov-10-15 10:06 AM Daisy M.]-----</p><p>LDM on VM with appt info.</p><p>-----[Nov-10-15 09:18 AM Daisy M.]-----</p><p>Per Vanessa go ahead and schedule appt.&nbsp;</p><p>-----[Nov-09-15 05:15 PM Daisy M.]-----</p><p><p>MPN options provided to L/O:&nbsp;</p><p>LA / Arthur Harris &amp; Harout Balian - 13.1 miles</p><p>Per Vanessa @ L/o go ahead and schedule appt.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1098	\N	Lisa	2015-11-23 07:30:00	2	\N	\N	\N	\N	\N	\N	\N	2015-11-09 17:15:01	2015-11-11 16:47:02	614	614	\N
10542	2015-11-30	2015-11-30	Workers Compensation	Anita	Anaya	1979-09-24	\N	(951) 489-2462	\N	\N	13445 Running Deer Rd	\N	\N	Moreno Valley	\N	92553	CT: 11/13/2012 - 11/13/2015	SPINE,R / HIP,L / HIP,R / THIGH,R / LEG,L / LEG,EYES	heels, ears	1185	0	Fresh & Easy LLC	1169	610	<p>-----[Nov-30-15 05:03 PM Daisy M.]-----</p><p>LDM on VM, sne text message.</p><p>-----[Nov-30-15 11:52 AM Daisy M.]-----</p><p>LDM on VM with appt info.&nbsp;</p><p>-----[Nov-30-15 11:01 AM Daisy M.]-----</p><p>Riverside / Keystone - 11.09 miles</p>	1119	821	Jesus	2015-12-08 10:15:00	5	\N	\N	\N	\N	\N	\N	\N	2015-11-30 11:01:40	2015-11-30 17:03:11	614	614	\N
10274	2015-11-05	2015-11-05	Workers Compensation	Maria Guadalupe	Viramontes	1959-01-03	602-90-9663	(661) 346-3055	\N	(661) 865-9743	5827 Pine canyon Dr.	\N	\N	Bakersfield	\N	93313	CT: 08-14-2014-08-14-2015	R / KNEE,L / KNEE,R / SHOULDER,R / ARM,R / WRIST	\N	\N	0	Marinoak , Inc	1176	612	<p>-----[Nov-09-15 02:01 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-09-15 09:52 AM Isabel M.]-----</p><p>Reenvie el correo para la cita</p><p>-----[Nov-05-15 03:22 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Bakersfield/BMG @ 19.82 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 88.81 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica</span><br></p></p>	1159	808	Alex	2015-11-19 10:30:00	2	\N	\N	<p>-----[Nov-09-15 02:01 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	1	2015-12-18 13:45:00	Alex	2015-11-19	2015-11-05 15:22:46	2015-11-24 15:06:01	616	611	\N
10414	2015-11-17	2015-11-17	Workers Compensation	Victor Manuel	Ramos	1967-12-24	611-29-0424	(323) 479-4531	\N	\N	850 Cory Ann	\N	\N	Perris	\N	92570	CT: 10-07-2014 - 10-07-2015	BACK,R / ARM,L / ARM,R / SHOULDER,L / SHOULDER,L / HAND,R / HAND,FINGERS,L / FOOT,R / FOOT	\N	\N	0	Legacy C & R Cleaning Solution	1176	817	<p>-----[Nov-17-15 04:58 PM Isabel M.]-----</p><p>Envie cita L/O y documentos clinicas</p>	1120	749	Marta	2015-12-02 09:30:00	1	\N	\N	<p>-----[Nov-17-15 04:58 PM Isabel M.]-----</p><p>Conf. con L/O</p>	0	\N	\N	\N	2015-11-17 16:58:21	2015-11-17 16:58:21	616	616	\N
10320	2015-11-09	2015-11-09	Workers Compensation	Felipe	Santana	1968-05-26	635-25-0689	(323) 901-9409	\N	\N	4843 17th Street Apt 7	\N	\N	Los Angeles	\N	90019	CT: 11/08/2013 - 11/08/2015	R / HIP,L / HIP,NECK,R / KNEE	spine	\N	0	Modello Inc / La Botega Marino	1169	610	\N	1148	776	Carmen	2015-11-12 11:30:00	1	\N	\N	\N	1	\N	Carmen	2015-11-12	2015-11-09 17:08:30	2015-11-17 09:07:39	614	611	\N
10490	2015-11-24	2015-11-24	Workers Compensation	Laura Rebeca	Gomez	1952-01-26	622-18-4510	(619) 946-7809	\N	\N	1611 Dusty Drive	\N	\N	Chula Vista	\N	91915	CT: 10/16/2014-10/16/2015	HEAD,NECK,L / HAND,R / HAND,FINGERS,BACK,L / SHOULDER,R / SHOULDER,R / KNEE	\N	1250	0	Nevwest Inc	1176	612	<p>-----[Nov-24-15 11:53 AM Lily E.]-----</p><p><p>Client was scheduled in the past with RB Spine but they did not take the case. Vanessa @ L/O advised to contact the client to see if she is willing to travel to Lighthouse/SD @ 19.11 miles.&nbsp;</p><p>Called Client and left a message as she did not answer.&nbsp;</p></p>	1128	719	Jenny	2015-12-17 09:00:00	2	\N	\N	\N	\N	\N	\N	\N	2015-11-24 11:53:32	2015-11-24 16:56:09	611	611	\N
10226	2015-11-03	2015-11-03	Workers Compensation	Agustin	Rivera	1955-11-24	611-18-3045	(951) 702-7308	\N	\N	434 Navago Dr	\N	\N	Banning	\N	92222	CT: 06/05/2014 - 06/05/2015	L / KNEE,R / SHOULDER,L / SHOULDER	lower hip	1187	0	America Truck Bodies & Repair	1176	817	<p>-----[Nov-10-15 10:25 AM Daisy M.]-----</p><p>Per Silvia @ L/O she has not been able to speak to pt in order to confirm if he is willing to drive to Riverside, I advised her that we will cancel for ow until her office is able to speak to him.&nbsp;</p><p>-----[Nov-09-15 02:46 PM Daisy M.]-----</p><p>Emailed Silvia @ L/O to advise her that the Dr rejected the case and provided her with the next closest location (Riverside / SS - 30.93 miles).&nbsp;</p><p>-----[Nov-09-15 12:29 PM Lily E.]-----</p><p>Per Alex @ clinic the doctor rejected the case due to the client has already started therapies. We will inform the L/O the only other option we have is Southland Spine in Riverside at 30.93 miles.&nbsp;</p><p>-----[Nov-03-15 09:41 AM Daisy M.]-----</p><p><p>SB / Industrial&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1326	794	Maribel	2015-11-07 13:30:00	\N	52	2015-11-10 10:20:00	\N	0	\N	\N	\N	2015-11-03 09:41:28	2015-11-10 10:25:31	614	614	\N
10426	2015-11-18	2015-11-18	Workers Compensation	Francisco	Rincon Santiago	1985-09-25	611-24-6318	(323) 836-0598	\N	\N	1514  W. 12th Place	\N	\N	Los Angeles	\N	90015	CT: 06-21-2012 - 06-21-2015	R / ARM,R / WRIST,NECK,R / KNEE,LOWER BACK	\N	\N	0	Birria Inc	1176	612	<p>-----[Nov-19-15 05:35 PM Isabel M.]-----</p><p>Por Vanessa que lo cancele , ellos enviaran carta al cliente ya que el telefono no funciona</p><p>-----[Nov-18-15 04:59 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Industrial/La @ 2.07 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">LA/MedNation @ 3.33 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Telefono Malo, envie correo L/O</span><br></p></p>	1326	\N	\N	\N	\N	66	2015-11-19 17:35:00	\N	0	\N	\N	\N	2015-11-18 16:59:00	2015-11-19 17:35:53	616	616	\N
10299	2015-11-06	2015-11-06	Workers Compensation	Raul	Romero	1961-03-02	\N	(760) 213-4629	\N	\N	2173 W El Norte Parkway	\N	\N	Escondido	\N	92026	09-01-2015	R / SHOULDER,NECK,LOWER BACK,R / HAND,FINGERS	\N	\N	0	Select Staffing	1176	612	<p>-----[Nov-10-15 09:48 AM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-09-15 09:59 AM Isabel M.]-----</p><p><span style="line-height: 21.4286px;">Reenvie el correo para la cita</span></p><p>-----[Nov-06-15 03:19 PM Isabel M.]-----</p><p>Envie documentos a clinica para cita</p><p>-----[Nov-06-15 02:34 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">RB/Rancho Bernardo @ 16.04 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Murrieta/Gogatz @ 28.88 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Deje mensaje</span><br></p></p>	1161	742	Linda	2015-11-19 09:00:00	2	\N	\N	<p>-----[Nov-10-15 09:48 AM Isabel M.]-----</p><p>Deje mensaje</p>	\N	\N	\N	\N	2015-11-06 14:34:26	2015-11-10 09:56:43	616	616	\N
10326	2015-11-10	2015-11-10	Workers Compensation	Valentin	Santa Maria	1955-12-16	567-02-2827	(818) 961-5217	\N	\N	517 E. Georgia St	\N	\N	Banning	\N	92220	CT: 05/01/2014 - 03/13/2015	R / ARM,L / ARM,R / SHOULDER,L / SHOULDER,R / KNEE,L / KNEE,R / ELBOW,L / ELBOW,NECK	spine	\N	0	TAP Manufacturing LLC	1176	701	<p>-----[Nov-10-15 11:57 AM Daisy M.]-----</p><p>Correction: Pt's phone Hx will be on 11-2015 @ 5:00 pm.</p><p>-----[Nov-10-15 11:53 AM Daisy M.]-----</p><p>Pt will have a phone HX on 11-20-2015 @ 5:30 pm.&nbsp;</p><p>-----[Nov-10-15 11:07 AM Daisy M.]-----</p><p>Dr. De La Llana rejected the case due to pt has received all possible treatment, per Humberto ok to send to Southland Spine in Riverside.</p>	1121	747	Bianca	\N	1	\N	\N	\N	\N	\N	\N	\N	2015-11-10 11:07:15	2015-11-10 11:57:23	614	614	\N
10298	2015-11-06	2015-11-06	Workers Compensation	Maria Demetria	Alcantar	1953-12-22	522-90-1490	(661) 240-8288	\N	(661) 240-7714	626 6th Street	\N	\N	Wasco	\N	93280	CT: 11/13/2012 - 11/13/2013	R / KNEE,L / KNEE,L / WRIST,R / WRIST,R / HAND,L / HAND,BACK,L / FOOT,R / FOOT	\N	\N	0	Randstad US, L.P.	1176	612	<p>-----[Nov-10-15 09:59 AM Daisy M.]-----</p><p>LDM on VM for pt to call back and obtain appt info.&nbsp;</p><p>-----[Nov-06-15 02:56 PM Daisy M.]-----</p><p><p>Per pt schedule in Bakersfield, paperwork emailed to the clinic.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-06-15 02:41 PM Daisy M.]-----</p><p>Left message on pt's voicemail to call back in order to provide clinic options.&nbsp;</p><p>-----[Nov-06-15 02:34 PM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>Bakersfield/BMG - 35.91 miles</p><p>Van Nuys/NobleQuest - 128.12 miles&nbsp;</p></p>	1159	808	Alex	2015-11-19 12:00:00	2	\N	\N	\N	1	2015-12-21 12:30:00	Alex	2015-11-19	2015-11-06 14:34:07	2015-11-24 15:11:09	614	611	\N
10341	2015-11-10	2015-11-10	Workers Compensation	Emilio	Varela Ortiz	1977-02-05	\N	(858) 266-7735	\N	\N	7130 Tait Street Apt 7130	\N	\N	San Diego	\N	92111	CT: 09/01/2014 - 09/01/2015	R / HAND,HEAD,R / SHOULDER,R / LEG,L / LEG,R / HIP,L / HIP	spine	\N	0	DJK Korean BBQ dba Dae Jang Keum	1169	610	<p>-----[Nov-23-15 11:45 AM Lily E.]-----</p><p>Per Emily @ clinic client was a no show on 11/19&nbsp;</p><p>-----[Nov-11-15 09:53 AM Daisy M.]-----</p><p>Appt on 11-19-2015 will be a phone Hx.</p>	1128	719	Jenny	2015-12-10 10:30:00	1	\N	\N	\N	\N	\N	\N	\N	2015-11-10 17:05:37	2015-11-24 10:19:31	614	611	\N
10244	2015-11-04	2015-11-04	Workers Compensation	Maria	Sarmiento	1972-08-06	657-08-7680	(323) 534-8876	\N	\N	8823 1/2 Hoover St	\N	\N	Los Angeles	\N	90044	1. CT: 01/01/2013 - 10/09/2015     2. 02/11/2011	R / UPPER EXT,L / UPPER EXT,L / LOWER EXT,R / LOWER EXT,R / SHOULDER,L / SHOULDER	1. nervous system   2. right hand, stress	1188	0	Strategic Outsouraing, Inc	1176	817	<p>-----[Nov-10-15 05:14 PM Isabel M.]-----</p><p>Al numero que el abogado envio , Hable con una Sra. que dice que no la ve, porque viven juntas pero ella trabaja desde muy temprano y regresa muy noche, la Sra. no dio su nombre, le envie un correo a su abogado, le informe a Daysi y dice que la cancele</p><p>-----[Nov-10-15 01:55 PM Isabel M.]-----</p><p>La ofinica de L/O envio nuevo numero de tel: 323907-5130 , llame para seguiniento de N/S, deje mensaje</p><p>-----[Nov-10-15 11:39 AM Isabel M.]-----</p><p>Envie un correo L/O solicitando numero de telefono, porque el que tenemos no funciona</p><p>-----[Nov-09-15 12:23 PM Lily E.]-----</p><p>Emailed L/O</p><p>-----[Nov-09-15 12:22 PM Lily E.]-----</p><p>Per Carmen the client was a no show on 11/06/2015 @ 11:00 AM</p><p>-----[Nov-04-15 09:54 AM Daisy M.]-----</p><p><p>Pico Rivera / Gutierrez&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1326	813	Ariana	2015-11-06 11:00:00	\N	66	2015-11-08 17:15:00	\N	0	\N	\N	\N	2015-11-04 09:26:21	2015-11-10 17:14:58	614	616	\N
10386	2015-11-13	2015-11-13	Workers Compensation	Laura	Aguirre	1962-06-22	550-57-9235	(951) 602-2007	\N	\N	10121 Leucadia Lane	\N	\N	Riverside	\N	92503	CT: 03/18/2013 - 03/18/2015	R / HAND,L / LEG,R / LEG,R / FOOT,L / FOOT,L / HAND	nose, right hand thumb	1338	0	Architectural Custom, Inc	1169	610	<p>-----[Nov-13-15 11:29 AM Daisy M.]-----</p><p><p>Riverside / Keystone - 4.6 miles&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1119	722	Raquel	2015-11-19 13:30:00	2	\N	\N	\N	1	2015-12-02 00:00:00	Jesus	2015-11-19	2015-11-13 11:29:14	2015-11-23 11:39:58	614	611	\N
10342	2015-11-11	2015-11-11	Personal Injury	Emelin Yolanda	Enriquez Alverez	1996-08-16	\N	(909) 212-2422	\N	(909) 295-1913	420 Locust Ave	\N	\N	Ontario	\N	91762	10/23/2015	NECK,R / SHOULDER,L / SHOULDER,UPPER BACK,MID BACK,LOWER BACK,L / HAND	\N	\N	0	\N	1176	612	<p>-----[Nov-12-15 10:10 AM Daisy M.]-----</p><p>Per Jessica @ L/O cancel, clinic is too far.&nbsp;</p><p>-----[Nov-12-15 09:02 AM Daisy M.]-----</p><p>Emailed Jessica to follow up on whether or not to schedule appt for pt.&nbsp;</p><p>-----[Nov-11-15 09:11 AM Daisy M.]-----</p><p>Emailed Jessica @ L/O to advise her that the closest clinic we have for pt would be in Covina (Enhanced Precision Care) @ approx 18.9 miles.&nbsp;</p>	1326	\N	\N	\N	\N	48	2015-11-12 10:05:00	\N	0	\N	\N	\N	2015-11-11 09:11:19	2015-11-12 10:10:06	614	614	\N
10344	2015-11-11	2015-11-11	Workers Compensation	Dolores	Alcazar	1969-04-04	611-14-8624	(619) 764-1467	\N	(760) 300-7696	7479 Tooma Street Apt B	\N	\N	San Diego	\N	92139	CT: 10/15/2014 - 10/21/2015	LOWER BACK,R / ARM,R / WRIST,R / HAND,BACK	\N	\N	0	Brighton Place	1176	612	<p>-----[Nov-11-15 09:37 AM Daisy M.]-----</p><p>Pt initially scheduled for 11-10-2015 @ 10:00 am, but on her way to the clinic she got into a car accident, therefore appt had to be R/S.&nbsp;</p>	1163	741	Alma	2015-12-02 10:00:00	1	\N	\N	\N	0	\N	\N	\N	2015-11-11 09:37:08	2015-11-11 09:37:08	614	614	\N
10524	2015-11-25	2015-11-25	Workers Compensation	Josefina	Baragan	1960-01-07	613-94-9367	(619) 255-7636	\N	(619) 731-8661	4408 Delta St. # 18	\N	\N	San Diego	\N	92123	05-11-2015	R / HAND,L / HAND,R / KNEE,L / KNEE	\N	1267	0	Eddy M's Cafe	1176	612	<p>-----[Nov-25-15 03:58 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><br></p><p class="MsoNormal">SD/LH @ 4.86 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Murrieta/Gogatz @ 58.13 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie cita L/O y envie documentos &nbsp;a clinica</span><br></p></p>	1128	719	Jenny	2015-12-17 09:45:00	2	\N	\N	<p>-----[Nov-25-15 03:58 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-25 15:58:23	2015-11-25 15:58:23	616	616	\N
10505	2015-11-25	2015-11-25	Workers Compensation	Efren	Vargas Moreno	1973-06-18	\N	(760) 658-1386	\N	(760) 741-1864	1244 Joshua St.	\N	\N	Escondido	\N	92026	CT: 10-13-2013 - 10-13-2015	BACK,R / LEG,R / SHOULDER	\N	\N	0	Heritage Arabian Inc	1176	612	<p>-----[Nov-30-15 09:06 AM Isabel M.]-----</p><p><span style="line-height: 21.4286px;">Envie correo para saber si ya tienen la cita</span></p><p>-----[Nov-25-15 10:19 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Rancho Bernardo/RB @ 16.04 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Murrieta/Gogatz @ 28.88 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica&nbsp;</span><br></p><p class="MsoNormal"><o:p></o:p></p></p>	1161	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2015-11-25 10:19:28	2015-11-30 09:06:06	616	616	\N
10343	2015-11-11	2015-11-11	Workers Compensation	Ramon	Vasquez	1987-04-05	603-71-2066	(805) 336-4319	\N	\N	4230 Browning Drive	\N	\N	Oxnard	\N	93033	CT: 09/10/2014 - 10/11/2015	LOWER BACK,R / KNEE,L / KNEE,R / HIP,L / HIP	spine	\N	0	Channel Islands Berry Farms	1176	612	<p>-----[Nov-11-15 10:04 AM Daisy M.]-----</p><p>Per pt both clinics are too far for him and he has no transportation. Advised Jesselin/ Vanessa @ L/O that case will be placed on cancel status.&nbsp;</p><p>-----[Nov-11-15 09:17 AM Daisy M.]-----</p><p>Called pt to provide him with clinic options, but he did not answer LDM to call back.&nbsp;</p><p>-----[Nov-11-15 09:15 AM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>Reseda / MedNation - 41.42 miles</p><p>Van Nuys / NobleQuest - 47.31 miles&nbsp;</p></p>	1326	\N	\N	\N	\N	48	2015-11-11 10:00:00	\N	0	\N	\N	\N	2015-11-11 09:15:04	2015-11-11 10:04:16	614	614	\N
10346	2015-11-11	2015-11-11	Workers Compensation	Margarita	Castro	1959-04-19	610-10-9591	(760) 391-8523	\N	\N	P.O Box 2214	\N	\N	Indio	\N	92202	CT: 10-21-2014 - 10-21-2015	R / SHOULDER,R / ARM,NECK,R / ANKLE,HEAD,BACK,R / LEG,R / KNEE	\N	\N	0	Marriott Hotel Services, Inc	1176	612	<p>-----[Nov-11-15 10:43 AM Isabel M.]-----</p><p>La clinica es Industrial San Bernardino @ 71.77 Millas</p><p>-----[Nov-11-15 10:31 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">S. Spine/Riverside @ 75.15 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Industrial/LA @ 71.77 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">La cliente dice que esta muy lejos, le envie corrreo L/O</span><br></p></p>	1326	\N	\N	\N	\N	48	2015-11-11 10:30:00	\N	0	\N	\N	\N	2015-11-11 10:31:07	2015-11-11 10:43:57	616	616	\N
10348	2015-11-11	2015-11-11	Workers Compensation	Daniel	Albarran	1973-05-20	\N	(323) 496-4718	\N	\N	6241 Woodward Avenue	\N	\N	Bell	\N	90201	CT: 10/01/2014 - 08/24/2015	L / KNEE,R / KNEE,L / FOOT,L / ANKLE	\N	\N	0	First Choice Auto Reconditioning	1176	612	<p>-----[Nov-12-15 10:29 AM Daisy M.]-----</p><p>LD on VM with appt info &amp; snet text.</p><p>-----[Nov-11-15 04:51 PM Daisy M.]-----</p><p>LDM on VM for pt with complete appt info.&nbsp;</p><p>-----[Nov-11-15 11:27 AM Daisy M.]-----</p><p>LDM on VM for pt to call us back to obtain appt info.&nbsp;</p><p>-----[Nov-11-15 11:05 AM Daisy M.]-----</p><p>Per Jesselin @ L/O schedule in Pico Rivera with Gutierrez , pt has 2 cases and is already treating @ Gutierrez for his first case.&nbsp;</p>	1112	813	Carmen	2015-11-16 16:00:00	3	\N	\N	\N	1	2015-11-19 00:00:00	Carmen	2015-11-16	2015-11-11 11:05:11	2015-11-17 13:38:38	614	616	\N
10436	2015-11-19	2015-11-19	Workers Compensation	Ana	Rios	1976-09-21	\N	(951) 269-6332	\N	\N	24404 Robie Ct	\N	\N	Moreno Valley	\N	92551	CT: 11/13/2014-1/13/2015	SPINE,L / KNEE,R / FOOT,L / FOOT	heels	\N	0	Fresh & Easy LLC	1169	610	<p>-----[Nov-30-15 05:09 PM Lily E.]-----</p><p>Received a response back from client after sending TXT stating we have the wrong number. Emailed Humberto @ L/O to please verify the clients phone number.</p>	1119	722	Lorena	2015-12-03 13:15:00	5	\N	\N	\N	\N	\N	\N	\N	2015-11-19 14:40:04	2015-11-30 17:09:47	611	611	\N
10337	2015-11-10	2015-11-10	Workers Compensation	Senen	Lopez	1975-10-07	\N	(818) 406-5839	\N	\N	5714 Fair Ave. Apt. G	\N	\N	North Hollywood	\N	91601	CT: 05-15-2014 - 05-21-2015	BACK,L / WRIST	R. Middle Finger	\N	0	Sun Gir, Inc	1176	612	<p>-----[Nov-12-15 11:30 AM Isabel M.]-----</p><p>Envie vita L/O</p><p>-----[Nov-11-15 04:06 PM Isabel M.]-----</p><p>Reenvie correo a clinica</p><p>-----[Nov-10-15 04:22 PM Isabel M.]-----</p><p><p>Opciones de clinicas;</p><p class="MsoNormal">Van Nuys/NobleQuest @ 5.48 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Reseda/MedNation @ 12.36 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinicas</span><br></p></p>	1152	794	Henry	2015-11-17 09:00:00	2	\N	\N	<p>-----[Nov-12-15 11:30 AM Isabel M.]-----</p><p>Conf. con Pt.</p>	1	\N	Henry	2015-11-17	2015-11-10 16:22:15	2015-11-18 12:31:23	616	611	\N
10276	2015-11-05	2015-11-05	Workers Compensation	Victor Hugo	Prieto Mendoza	1958-10-12	559-27-4643	(760) 995-3257	\N	\N	11824 Tiffany St	\N	\N	Victorville	\N	92392	CT: 02/05/2012 - 02/05/2014	HEAD,EYES,R / HIP,L / HIP,R / KNEE,L / KNEE,R / HAND,L / HAND,R / SHOULDER,SLEEP DISORDER,L / SHOULDER,L / ELBOW	spine, anxiety	1189	0	Orion Plastic Corporation	1169	610	<p>-----[Nov-13-15 02:46 PM Daisy M.]-----</p><p>Advised Humberto that case will be placed on cancel stauts until advised on how to proceed.&nbsp;</p><p>-----[Nov-11-15 08:52 AM Daisy M.]-----</p><p>Per Humberto, he requested we give him one day to contact pt and verify with him if he is willing to drive to Victorville.&nbsp;</p><p>-----[Nov-11-15 08:45 AM Daisy M.]-----</p><p>Emailed Humberto to follow up.&nbsp;</p><p>-----[Nov-09-15 09:55 AM Daisy M.]-----</p><p><p class="MsoNormal"><span style="color:purple">Per Jessica @ the clinic she advised that if pt has been receiving treatment with Dr. Long unfortunately\nthey will not be able to take the case. She stated that since Dr. Montgomery is\na DC, if pt has already received all treatment possible there not much else they\nwould be able to do unless you have an AME / QME report. Advised Humberto @ L/O.&nbsp;<o:p></o:p></span></p></p><p>-----[Nov-05-15 04:15 PM Daisy M.]-----</p><p>Per Humberto pt had a SI DOI and that was reported and case settled, advised him the closest we have&nbsp;<span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;mso-bidi-font-family:\n&quot;Times New Roman&quot;;color:#993366;mso-ansi-language:EN-US;mso-fareast-language:\nEN-US;mso-bidi-language:AR-SA">would be Dr. Montgomery in Victorville @ approx.\n7.3 miles, but his next appt would not be until 12-22-2015. We also have Dr. De\nLa Llana in San Bernardino @ approx. 37.6 miles.&nbsp;</span></p><p>-----[Nov-05-15 03:57 PM Daisy M.]-----</p><p><p>Emailed Humberto @ L/O to verify if injury was reported.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1326	\N	\N	\N	\N	55	2015-11-13 14:45:00	\N	0	\N	\N	\N	2015-11-05 15:55:17	2015-11-13 14:46:05	614	614	\N
10427	2015-11-18	2015-11-18	Workers Compensation	Patricia	Navarrete	1970-01-05	556-48-3497	(805) 504-6130	\N	(805) 504-6201	11364 Nardo St.	\N	\N	Ventura	\N	93004	09-10-2015	L / ARM,NECK,BACK	\N	\N	0	Agent River Ridge Farm, Inc	1176	612	<p>-----[Nov-18-15 05:06 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Reseda/MedNation @ 44.51 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 50.41 miles</p><p class="MsoNormal"><o:p><br></o:p></p><p class="MsoNormal"><o:p>AL CLIENTE LE PARECE LEJOS, ENVIE CORREO L/O</o:p></p></p>	1326	\N	\N	\N	\N	48	2015-11-16 17:05:00	\N	0	\N	\N	\N	2015-11-18 17:06:28	2015-11-18 17:06:28	616	616	\N
10415	2015-11-17	2015-11-17	Workers Compensation	Alexander Angel	Pedroza Reyes	1990-06-28	603-42-0144	(626) 378-6442	\N	\N	114 W.  60th St.	\N	\N	Los Angeles	\N	90003	CT: 05-30-2014 - 11-30 -2014	LOWER BACK,NECK,SPINE,R / SHOULDER,L / SHOULDER	\N	\N	0	Owner / Management BBSI	1176	612	<p>-----[Nov-17-15 05:18 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">Downey/Aun @ 13.40 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">LA/MedNation @ 9.67 miles<span style="line-height: 1.42857;">Hable con el cliente y dice que no quiere continuar con el caso. le envie correo L/O</span></p><p class="MsoNormal"><o:p><br></o:p></p><p class="MsoNormal"><o:p><br></o:p></p></p>	1326	\N	\N	\N	\N	49	2015-11-17 17:20:00	\N	0	\N	\N	\N	2015-11-17 17:18:38	2015-11-17 17:22:50	616	616	\N
10491	2015-11-24	2015-11-24	Workers Compensation	Jose	Barradas	1949-03-17	\N	(747) 888-2956	\N	\N	15701 Tustin Village Way	\N	Apt A1	Tustin	\N	92780	09-02-2014	NECK,SPINE,L / HIP,R / HIP,L / SHOULDER,R / SHOULDER,L / LOWER EXT,R / LOWER EXT	\N	1307	0	Heaton & Son Plumbing	1169	610	<p>-----[Nov-24-15 12:02 PM Lily E.]-----</p><p><p>Advised Humberto @ L/O the following options:</p><p>Santa Ana/Keystone @ 2.15 miles</p><p>Costa Mesa/S. Spine @ 8.92miles</p></p>	1335	793	Jesus	2015-12-01 10:45:00	3	\N	\N	\N	\N	\N	\N	\N	2015-11-24 12:02:21	2015-11-24 15:53:21	611	611	\N
10347	2015-11-11	2015-11-11	Workers Compensation	Manuel	Mendoza	1951-09-13	\N	(805) 947-8585	\N	\N	1409 Guava St.	\N	\N	Oxnard	\N	93033	CT: 10-30-2014 - 10-30-2015	L / FOOT,L / ANKLE	L. heel. L. sole	\N	0	Barrett Business Services, Inc	1176	612	<p>-----[Nov-11-15 10:55 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">MedNation/Reseda @ 41.42 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 47.31 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Al cliente le parece muy lejos, le envie correo a L/O</span><br></p></p>	1326	\N	\N	\N	\N	48	2015-11-11 10:55:00	\N	0	\N	\N	\N	2015-11-11 10:55:00	2015-11-11 10:55:00	616	616	\N
10500	2015-11-24	2015-11-24	Workers Compensation	Benjamin	Toscano Tafoya	1987-04-01	602-28-7569	(619) 420-3244	\N	(619) 319-8389	520 Naples St. Apt. 9	\N	\N	Chula Vista	\N	91911	CT: 02-31-2015 - 11-04-2015	R / KNEE,L / KNEE,HEAD,STRESS,EYES	\N	\N	0	St. Vicente De Paul	1176	612	<p>-----[Nov-24-15 05:34 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">SD/LH @ 12.84 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Murrieta/Gogatz @ 73.20 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinicas</span><br></p><p class="MsoNormal"><o:p></o:p></p></p>	1128	719	Jenny	2015-12-10 09:00:00	2	\N	\N	<p>-----[Nov-24-15 05:34 PM Isabel M.]-----</p><p>Conf. con su mama</p>	0	\N	\N	\N	2015-11-24 17:34:47	2015-11-25 08:18:34	616	616	\N
10345	2015-11-11	2015-11-11	Workers Compensation	Salvador	Gomez	1950-01-05	617-03-0768	(760) 315-1463	\N	\N	752 Olive Street	\N	\N	Ramona	\N	92065	CT: 09/21/2014 - 09/21/2015	R / SHOULDER,L / SHOULDER,R / LEG,L / LEG,R / KNEE,L / KNEE,R / HIP,L / HIP,FINGERS,NECK,R / HAND,L / HAND,R / FOOT,L / FOOT,TOES	spine	\N	0	Immaculate Heart of Mary Church	1176	817	<p>-----[Nov-11-15 09:43 AM Daisy M.]-----</p><p><p>Rancho Bernardo / RB Spine. Paperwork emailed to the clinic, pending appt.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1161	742	Linda	2015-11-23 09:00:00	1	\N	\N	\N	\N	\N	\N	\N	2015-11-11 09:43:24	2015-11-11 14:01:46	614	614	\N
10376	2015-11-12	2015-11-12	Workers Compensation	Nancy L.	Arreola	1990-04-14	618-45-2327	(949) 613-1439	\N	(661) 438-6508	1900 Poplar Ave	\N	\N	Wasco	\N	93280	04-20-2015	LOWER BACK,R / SHOULDER	\N	\N	0	Horizon Diversified Group, Inc	1176	612	<p>-----[Nov-13-15 03:38 PM Isabel M.]-----</p><p><p>Son esposos</p><p>Envie cita L/O</p></p><p>-----[Nov-13-15 02:37 PM Isabel M.]-----</p><p>Envie documentos a clinica para cita</p><p>-----[Nov-13-15 09:13 AM Isabel M.]-----</p><p>Envie correo de no contacto</p><p>-----[Nov-13-15 08:58 AM Isabel M.]-----</p><p><p>Deje mensaje</p><p><br></p></p><p>-----[Nov-12-15 05:24 PM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-12-15 03:25 PM Isabel M.]-----</p><p><p>Opciones de &nbsp;clinicas:&nbsp;</p><p>Bakersfield/BMG @ 35.90 Miles</p><p>MedNation / Reseda @ 123.79</p><p><span style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;">Este cliente tiene los mismos telefonos , dirreccion, y empleador de Guadalupe Garcia , hable con Jesselin y dice esta correcto que son amigas y pusieron los mismos datos</span></p><p><span style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;">Deje mensaje<br></span><br></p></p>	1159	808	Alex	2015-12-03 11:30:00	2	\N	\N	<p>-----[Nov-13-15 03:38 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-12 15:25:48	2015-11-13 15:38:35	616	616	\N
10494	2015-11-24	2015-11-24	Workers Compensation	Jose Manuel	Perez	1984-11-22	620-36-7233	(619) 327-3271	\N	\N	21  4th Ave. Apt. Y	\N	\N	Chula Vista	\N	91910	CT: 05-18-2015 - 11-20-2015	R / KNEE,BACK,NECK,STRESS,R / FOOT	R. heel, R. lower leg,	\N	0	Sunset Commercial Services	1176	612	<p>-----[Nov-24-15 02:11 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">SD/LH @ 11.81 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Murrieta/Gogatz @ 70.94 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica y cita L/O</span><br></p></p>	1128	719	Jernny	2015-12-10 17:00:00	6	\N	\N	<p>-----[Nov-24-15 02:11 PM Isabel M.]-----</p><p>Deje mensaje</p>	0	\N	\N	\N	2015-11-24 14:11:14	2015-11-24 14:11:14	616	616	\N
10247	2015-11-04	2015-11-04	Workers Compensation	Karina	Alvarez	1967-07-08	560-91-9142	(442) 231-9374	\N	(760) 562-2927	1720 W. Adams Avenue Apt 39	\N	\N	El Centro	\N	92243	02/02/2015	R / SHOULDER,R / ARM	\N	1224	0	Dominguez, Blanca O.	1174	612	<p>-----[Nov-10-15 01:58 PM Daisy M.]-----</p><p>Advised L/O that we have not been able to reach the patient in order to provide her with the clinic options therefore we are going to go ahead and cancel this case.&nbsp;</p><p>-----[Nov-09-15 09:36 AM Daisy M.]-----</p><p>Called pt and she did not answer, left message for her to call back.&nbsp;</p><p>-----[Nov-06-15 11:50 AM Daisy M.]-----</p><p>Tried contacting pt, but she is not answering.&nbsp;</p><p>-----[Nov-04-15 10:57 AM Daisy M.]-----</p><p><p>Per Vanessa @ L/O call pt to verify with her the distance of both clinics, called pt, but she did not answer. LDM to call back.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-04-15 10:31 AM Daisy M.]-----</p><p><p>Options provided to L/O:&nbsp;</p><p class="MsoNormal">San Diego / Lighthouse – 110 miles <o:p></o:p></p><p class="MsoNormal">San Ysidro / RB Spine – 120 miles <o:p></o:p></p><p>\n\n\n\n</p><p class="MsoNormal"><span style="color:#1F497D;mso-themecolor:dark2">&nbsp;</span></p></p>	1326	\N	\N	\N	\N	69	2015-11-10 13:55:00	\N	0	\N	\N	\N	2015-11-04 10:31:05	2015-11-10 13:58:59	614	614	\N
10416	2015-11-17	2015-11-17	Workers Compensation	Isidro	Gomez Hernandez	1964-05-15	169-75-1474	(951) 345-3017	\N	(951) 345-9058	P.O Box 10334	\N	\N	Moreno Valley	\N	92552	01-23-2015	NECK	R. side of head	1257	1	Staffmark	1176	612	<p>-----[Nov-17-15 05:34 PM Isabel M.]-----</p><p><p>Envie cita L/O</p><p><br></p></p>	1119	722	Jesus	2015-11-25 15:00:00	2	\N	\N	<p>-----[Nov-19-15 10:41 AM Isabel M.]-----</p><p>Conf. con Pt.</p><p>-----[Nov-18-15 02:50 PM Isabel M.]-----</p><p>Deje mensaje</p>	0	\N	\N	\N	2015-11-17 17:34:15	2015-11-19 10:41:47	616	616	\N
10324	2015-11-10	2015-11-10	Workers Compensation	Jose	Montes De oca	1960-07-01	614-18-0931	(818) 612-7331	\N	\N	8826 Tobias Ave. Apt. 10	\N	\N	Panorama City	\N	91402	CT: 01-28-2013 - 07-01-2014	L / HAND,R / HAND,L / ELBOW,R / ELBOW	\N	\N	0	Veri Staffing Solutions	1176	612	<p>-----[Nov-10-15 02:10 PM Isabel M.]-----</p><p>Envie la cita L/O</p><p>-----[Nov-10-15 09:36 AM Isabel M.]-----</p><p>La oficina del L/O pidio que la cita fuera en Van Nuys/NobleQuest, envie documentos a clinica para cita</p>	1152	794	Henry	2015-11-17 16:30:00	4	\N	\N	<p>-----[Nov-11-15 09:54 AM Isabel M.]-----</p><p>Envie carta</p><p>-----[Nov-11-15 09:44 AM Isabel M.]-----</p><p>Deje mensaje completo</p><p>-----[Nov-10-15 02:10 PM Isabel M.]-----</p><p>Deje mensaje</p>	1	\N	Henry	2015-11-17	2015-11-10 09:36:02	2015-11-18 12:27:38	616	611	\N
10352	2015-11-11	2015-11-11	Workers Compensation	Jose Manuel	Alvarado	1973-02-19	\N	(661) 348-6503	\N	(661) 865-9001	651 6th Street	\N	\N	Wasco	\N	93280	CT: 08/23/2014 - 08/23/2015	R / WRIST,R / SHOULDER,L / SHOULDER,LOWER BACK,R / KNEE,L / KNEE,R / ANKLE,L / ANKLE	\N	\N	0	Jerry's Farm Labor Contracting	1176	612	<p>-----[Nov-11-15 02:13 PM Daisy M.]-----</p><p>LDM on VM with all of appt info.&nbsp;</p><p>-----[Nov-11-15 12:18 PM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>Bakersfield / BMG - 35.91 miles</p><p>Van Nuys / NobleQuest - 128.12 miles&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>Per pt schedule in Bakersfield, paperwork emailed to the clinic.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1159	808	Alex	2015-11-19 13:15:00	2	\N	\N	\N	1	2015-12-21 13:00:00	Alex	2015-11-19	2015-11-11 12:18:06	2015-11-24 15:14:57	614	611	\N
10525	2015-11-25	2015-11-25	Workers Compensation	Cirilo	Salgado	1970-05-09	612-38-7117	(661) 858-6368	\N	(661) 868-6568	2212 Lacey St.	\N	\N	Bakersfield	\N	93304	CT: 08-28-2014 - 08-28-2015	BACK,ABDOMEN	R. eye. L. shin	\N	0	DV Custom Farms	1176	612	<p>-----[Nov-25-15 04:28 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Bakersfield/BMG @ 7.50 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 95.81 miles<o:p></o:p></p><p>Envie documentos a clinica y cita L/O</p></p>	1159	\N	Alex	2015-12-10 12:00:00	2	\N	\N	<p>-----[Nov-25-15 04:28 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-25 16:28:25	2015-11-25 16:28:25	616	616	\N
10533	2015-11-25	2015-11-25	Personal Injury	Jose	Maleno	1987-03-10	\N	(661) 375-5681	\N	\N	688 S. Front Street	\N	\N	Earlimart	\N	93219	11-17-2015	CHEST,UPPER BACK,LOWER BACK,L / KNEE,R / KNEE	\N	\N	0	\N	1176	612	<p>-----[Nov-30-15 09:21 AM Lily E.]-----</p><p>Emailed Jessica @ L/O to advise the closest clinic we have to the client is BMG @ 47.56 miles</p>	1330	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2015-11-30 09:21:15	2015-11-30 09:21:15	611	611	\N
10210	2015-11-02	2015-11-02	Workers Compensation	Sandra	Nunez	1977-04-20	616-47-1894	(818) 310-1227	\N	\N	14561 Dyer St.	\N	\N	Sylmar	\N	91342	02-28-2015	L / LEG,L / FOOT,R / HIP,L / HIP,BACK	\N	1247	0	Etchandy Farms	1176	612	<p>-----[Nov-04-15 11:28 AM Isabel M.]-----</p><p><p>Envie cita L/O</p><p>la clinica informa que la cliente ya fue una vez el 07-07-2015 y que despues no volvio asistir , le pregunte a Daisy si lo ponia como paciente existente , pero me dijo que no</p></p><p>-----[Nov-04-15 09:32 AM Isabel M.]-----</p><p>Reenvie correo a clinica para cita</p><p>-----[Nov-02-15 12:05 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p>MedNation/Reseda @ 14.74 Miles<br><span style="line-height: 1.42857;">Van Nuys/NobleQuest @ 13.70 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>Envie documentos a clinica</p></p>	1152	794	Marilyn	2015-11-10 16:30:00	2	\N	\N	<p>-----[Nov-04-15 11:28 AM Isabel M.]-----</p><p>Conf. con Pt.</p>	1	\N	Marilyn	2015-11-10	2015-11-02 12:05:12	2015-11-12 11:47:55	616	611	\N
10278	2015-11-05	2015-11-05	Workers Compensation	Garcia	Alma	1979-03-21	952-72-4570	(626) 975-7429	\N	\N	12224 Magnolia St.	\N	\N	El Monte	\N	91732	10-20-2015	BACK,L / LEG,L / HAND	\N	\N	0	Payroll Staffing  solution, Inc	1176	623	<p>-----[Nov-18-15 01:57 PM Isabel M.]-----</p><p>Por francisca de L/O, pidio que cancelaramos la cita medica , porque ellos dicen que la cliente quiere cancelar su caso , le informe al cliente</p><p>-----[Nov-06-15 10:50 AM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-05-15 04:25 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">El Monte/ Greenfield @ 0.34 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Whittier/Ford @ 11.34 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Deje mensaje</span><br></p></p>	1326	774	Maggie	2015-11-23 07:30:00	\N	49	2015-11-18 13:55:00	<p>-----[Nov-06-15 10:50 AM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-05 16:25:49	2015-11-18 13:57:36	616	616	\N
10261	2015-11-04	2015-11-04	Workers Compensation	Antonio	Escobedo Perez	1971-03-27	\N	(714) 610-6847	\N	\N	507 S. Rosewood St	\N	\N	Santa Ana	\N	92703	08/11/2015	LOWER BACK	\N	1337	1	Merchants Landscape Inc	1176	817	<p>-----[Nov-13-15 02:49 PM Daisy M.]-----</p><p><p style="color: rgb(89, 126, 162); line-height: 21.4286px; background-color: rgb(236, 240, 241);">Advised Silvia that case will be placed on cancel status until advised on how to proceed.&nbsp;</p><div><br></div></p><p>-----[Nov-11-15 10:24 AM Daisy M.]-----</p><p>Advised Silvia that we have no Dr within the MPN.&nbsp;</p><p>-----[Nov-11-15 10:06 AM Daisy M.]-----</p><p>MPN link provided by Silvia:&nbsp;<span style="font-size:16.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;mso-bidi-font-family:\n&quot;Times New Roman&quot;;mso-ansi-language:EN-US;mso-fareast-language:EN-US;\nmso-bidi-language:AR-SA"><a href="http://merchants.employermpn.com/(S(mk5mzfnwkdzfclugjo2owilr))/default.aspx">http://merchants.employermpn.com/(S(mk5mzfnwkdzfclugjo2owilr))/default.aspx</a>&nbsp;</span></p><p>-----[Nov-09-15 12:09 PM Daisy M.]-----</p><p><p class="MsoNormal"><span style="color:#1F497D">909-594-9400 ext. 104 this is\nthe adjusters number <o:p></o:p></span></p>\n\n<p class="MsoNormal"><span style="color:#1F497D">Claim Quest Inc. insurance <o:p></o:p></span></p>\n\n<p class="MsoNormal"><span style="color:#1F497D">300503031500143 claim number</span></p><p class="MsoNormal"><span style="color:#1F497D">Called adjuster and left message for her to call back. &nbsp;<o:p></o:p></span></p></p><p>-----[Nov-04-15 03:57 PM Daisy M.]-----</p><p>Emailed Silvia @ L/O to verify with her if she has the MPN link or adjsuter info.&nbsp;</p>	1326	\N	\N	\N	\N	55	2015-11-13 14:45:00	\N	0	\N	\N	\N	2015-11-04 15:48:49	2015-11-13 14:49:06	614	614	\N
10245	2015-11-04	2015-11-04	Workers Compensation	Oliverio	Zaragoza	1967-05-27	606-60-2608	(213) 570-4259	\N	\N	2058 Pine Ave	\N	\N	Long Beach	\N	90806	1. CT: 04/04/2014 - 04/04/2015   2. 03/12/2015   3. 10/10/2014	R / ARM,L / ARM,R / WRIST,L / WRIST,R / HAND,L / HAND,FINGERS,R / SHOULDER,L / SHOULDER,R / LEG,L / LEG	2. head, neck, spine, shoulders, arms    3. neck, arms, spine, shoulders	1214	0	PCH Poultry and Market LLC	1176	817	<p>-----[Nov-12-15 02:21 PM Daisy M.]-----</p><p>Advised Silvia @ L/O that case will be placed on cancel status due to pt advised that he switched atty.&nbsp;</p><p>-----[Nov-12-15 11:49 AM Lily E.]-----</p><p>Per David @ clinic the client advised their office that he switched Atty and cancelled his appointment. Advised Daisy.&nbsp;</p><p>-----[Nov-04-15 09:30 AM Daisy M.]-----</p><p><p>Downey / Aun&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1326	743	Marisol	2015-11-10 09:00:00	\N	62	2015-11-12 14:20:00	\N	0	\N	\N	\N	2015-11-04 09:30:44	2015-11-12 14:21:43	614	614	\N
10464	2015-11-20	2015-11-20	Workers Compensation	Celia	Madrigal	1952-06-15	612-45-5915	(909) 633-0537	\N	(909) 975-9948	1472 9th St.	\N	\N	Upland	\N	91786	CT: 04-01-2015 - 10-16-2015	R / KNEE,R / ANKLE,R / FOOT	R. sole	\N	0	Staysafe Staffing Inc DBA Horizon Personnel Services	1176	612	<p>-----[Nov-20-15 05:15 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Montclair/Balian @ 3.85 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Fontana/LH @ 16.13 miles</p><p class="MsoNormal"><o:p></o:p></p><p>La clinica ya cerro para hacer la cita</p></p>	1102	746	Maria	2015-12-01 11:00:00	2	\N	\N	<p>-----[Nov-25-15 11:22 AM Isabel M.]-----</p><p>Conf. con Pt.</p><p>-----[Nov-25-15 11:13 AM Isabel M.]-----</p><p>Deje mensaje y envie carta</p><p>-----[Nov-24-15 08:26 AM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-23-15 05:31 PM Isabel M.]-----</p><p>Deje mensaje</p>	0	\N	\N	\N	2015-11-20 17:15:08	2015-11-25 11:22:36	616	616	\N
10358	2015-11-11	2015-11-11	Workers Compensation	Juan	Jimenez	1959-07-23	619-03-9611	(951) 263-8426	\N	\N	9408 54th Avenue	\N	\N	Riverisde	\N	92509	09/12/2014	L / KNEE,SLEEP DISORDER,L / ELBOW	spine	1182	1	Artistic Maintenance Inc	1169	610	<p>-----[Nov-11-15 04:23 PM Daisy M.]-----</p><p><p>Per Humberto schedule with whoever has the soonest appt.&nbsp;</p><p>Appt for 11-13-2015 will be a phone Hx and will be seen by the Dr on 11-16-2015.</p></p><p>-----[Nov-11-15 04:10 PM Daisy M.]-----</p><p><p>MPN options provided to Humberto:&nbsp;</p><p class="MsoNormal"><span style="color:#1F497D;mso-themecolor:dark2">Riverside /\nSouthland Spine (Evan Marlowe) – 9.2 miles<o:p></o:p></span></p><p class="MsoNormal"><span style="color:#1F497D;mso-themecolor:dark2">Fontana /\nLH (Abel Quesada) – 10.1 miles <o:p></o:p></span></p><p>\n\n\n\n</p><p class="MsoNormal"><span style="color:#1F497D;mso-themecolor:dark2">&nbsp;</span></p></p>	1086	719	Jenny	2015-11-13 11:15:00	2	\N	\N	\N	1	\N	Edwin	2015-11-13	2015-11-11 16:10:15	2015-11-17 10:00:56	614	611	\N
10392	2015-11-13	2015-11-13	Workers Compensation	Maria Nelly	Calderon AKA Nancy Chavez	1978-01-19	251-53-5710	(619) 288-5540	\N	\N	133  30th St,	\N	\N	San Diego	\N	92102	CT: 11-08-2014 -11-09-2015	BACK,LOWER BACK,L / ARM,R / ARM,L / WRIST,R / WRIST,R / HAND,L / HAND,FINGERS,L / KNEE,L / ANKLE,L / LEG,NECK,HEAD	L. Buttock	\N	0	Rei Do Gado Corporation	1176	612	<p>-----[Nov-13-15 05:07 PM Isabel M.]-----</p><p>Envie documentos a clinica y cita L/O</p><p>-----[Nov-13-15 03:58 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><br></p><p class="MsoNormal">SD / LH @ 5.03 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Mission Valley / RB Spine @ 7.32\nmiles&nbsp;</p><p class="MsoNormal"><span style="line-height: 1.42857;">La cliente quiere que le llame como a las 4:00PM</span><br></p></p>	1128	719	Jenny	2015-12-03 12:00:00	2	\N	\N	<p>-----[Nov-13-15 05:07 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-13 15:58:06	2015-11-13 17:07:49	616	616	\N
10267	2015-11-05	2015-11-05	Workers Compensation	Morena	Figueroa	1963-03-20	617-24-8644	(714) 581-2475	\N	\N	913 Park Circle Apt E	\N	\N	Anaheim	\N	92804	CT: 05/03/2015 - 11/03/2015	R / SHOULDER,R / ARM,R / HAND,R / WRIST,R / HIP,LOWER BACK,R / ANKLE,NECK	right buttock, right heel	\N	0	Snelling Employment LLC	1176	612	<p>-----[Nov-12-15 11:37 AM Lily E.]-----</p><p>Per Jesus @ clinic the client rescheduled her appointment for 11/12 instead of 11/10.</p><p>-----[Nov-05-15 11:01 AM Daisy M.]-----</p><p><p>Per pt schedule in Santa Ana for the latest time possible.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-05-15 10:20 AM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>Santa Ana / Keystone - 10.97 miles&nbsp;</p><p>Whittier / Ford - 12.44 miles&nbsp;</p><p>Called pt to provide her with the clinic options and she did not answer.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1119	793	Jesus	2015-11-12 11:30:00	4	\N	\N	\N	1	2015-11-24 00:00:00	Jesus	2015-11-12	2015-11-05 10:20:18	2015-11-17 09:36:20	614	611	\N
10223	2015-11-02	2015-11-02	Workers Compensation	Esthela	Ochoa Fonseca	1960-09-13	\N	(619) 750-5948	\N	\N	8720 Ildica Street	\N	\N	Spring Valley	\N	91977	CT: 08/09/2014 - 08/09/2015	R / ARM,L / ARM,R / HAND,L / HAND,BACK,L / LEG,R / LEG,R / KNEE,L / KNEE	\N	\N	0	Good Nite Inn Management Inc	1176	610	<p>-----[Nov-30-15 05:14 PM Lily E.]-----</p><p>Per client she stated she has already attended an appointment on 11/20 and she had X-rays. Emailed Humberto on how we should proceed with case.&nbsp;</p><p>-----[Nov-17-15 11:04 AM Lily E.]-----</p><p>Per Humberto @ L/O reschedule the client.&nbsp;</p><p>-----[Nov-17-15 09:56 AM Lily E.]-----</p><p>Per Emily the client was a no show to her initial appt on 11/12. Emailed L/O</p><p>-----[Nov-02-15 04:48 PM Daisy M.]-----</p><p>SD / LH&nbsp;</p>	1128	719	Jenny	2015-12-03 09:45:00	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-02 16:48:50	2015-11-30 17:14:38	614	611	\N
10349	2015-11-11	2015-11-11	Workers Compensation	Raul	Nunez	1988-04-26	543-77-6767	(661) 565-8950	\N	\N	419 Eastern Ave.	\N	\N	Taft	\N	93268	09-01-2015	BACK	\N	\N	0	Empire AG, Inc	1176	612	<p>-----[Nov-11-15 03:06 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-11-15 12:10 PM Isabel M.]-----</p><p>Envie documentos a clinica para cita</p><p>-----[Nov-11-15 11:10 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Bakersfield/BMG @ 40.76 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 109.72 miles</p><p class="MsoNormal">Hablar como a las 12:00PM en adelante</p><p class="MsoNormal"><o:p></o:p></p></p>	1159	808	Alex	2015-11-19 12:00:00	2	\N	\N	<p>-----[Nov-11-15 05:11 PM Isabel M.]-----</p><p>Conf. con Pt. y envie texto</p><p>-----[Nov-11-15 03:06 PM Isabel M.]-----</p><p>Hablar 3:30PM</p>	1	2015-12-21 15:30:00	Alex	2015-11-19	2015-11-11 11:10:41	2015-11-24 14:40:10	616	611	\N
10359	2015-11-11	2015-11-11	Workers Compensation	Luis	Rodriguez	1986-04-27	\N	(310) 667-0327	\N	\N	511 N. Willow Ave. # C	\N	\N	Compton	\N	90220	11-01-2015	BACK,R / HAND,L / HAND,STRESS	\N	\N	0	Roy Deep Enterprises, LLC  DBA  Popeyes Chicken	1176	817	<p>-----[Nov-30-15 11:36 AM Isabel M.]-----</p><p>Envie nuevo correo L/O</p><p>-----[Nov-24-15 10:42 AM Isabel M.]-----</p><p>Le envie correo L/O donde le informo que en Innovative (Whittier) no tomaron el caso, porque el Dr. no &nbsp;esta aceptado nuevos casos, la otra opcion que tenemos es Downey/ Aun a 13.33 Millas</p><p>-----[Nov-12-15 08:42 AM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-11-15 04:25 PM Isabel M.]-----</p><p>Envie docuemntos a clinica</p>	1330	807	Sophia	2015-12-03 10:30:00	1	\N	\N	\N	0	\N	\N	\N	2015-11-11 16:25:09	2015-11-30 11:38:05	616	616	\N
10216	2015-11-02	2015-11-02	Workers Compensation	Cesar	Salcido	1973-12-13	\N	(805) 793-5504	\N	\N	1911 Lindberg Drive	\N	\N	Oxnard	\N	93033	05-08-2015	BACK,R / SHOULDER,R / ARM,R / FOOT,R / ANKLE,R / LEG	\N	1191	1	Chuy and Sons Labor Inc	1176	612	<p>-----[Nov-11-15 12:24 PM Daisy M.]-----</p><p>Per pt clinics are too far and prefers something in Oxnard, advised Jesselin.&nbsp;</p><p>-----[Nov-11-15 11:39 AM Daisy M.]-----</p><p><p>Per Jesselin go ahead and schedule pt non mpn, clinic options:&nbsp;</p><p>Reseda / MedNation - 43.0 miles</p><p>Van Nuys / NobleQuest - 49.4 miles&nbsp;</p></p><p>-----[Nov-02-15 03:53 PM Daisy M.]-----</p><p>Advised Jesselin @ L/O that we have no Dr within the MPN.&nbsp;</p>	1326	\N	\N	\N	\N	47	2015-11-06 15:00:00	\N	0	\N	\N	\N	2015-11-02 15:53:23	2015-11-11 12:24:19	614	614	\N
10370	2015-11-12	2015-11-12	Workers Compensation	David	Estrada Andrade	1955-02-12	557-29-8143	(661) 468-3146	\N	\N	2608 Overland Ave.	\N	\N	Lancaster	\N	93536	CT: 08-07-2014 - 08-07-2015	LOWER BACK,BACK,L / KNEE,NECK	\N	\N	0	Trasdev Services, Inc	1176	612	<p>-----[Nov-12-15 05:06 PM Isabel M.]-----</p><p>El telefono nuevo es 661-468-3146</p><p>-----[Nov-12-15 05:03 PM Isabel M.]-----</p><p>El cliente dice que muy lejos, envie correo L/O</p><p>-----[Nov-12-15 12:07 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Van Nuys/Noble Quest @ 72.92 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Victorville/Montgomery @ 76.18\nmiles</p><p class="MsoNormal"><span style="line-height: 1.42857;">El telefono esta malo</span><br></p></p>	1326	\N	\N	\N	\N	48	2015-11-12 17:05:00	\N	0	\N	\N	\N	2015-11-12 12:07:08	2015-11-12 17:06:03	616	616	\N
10350	2015-11-11	2015-11-11	Workers Compensation	Gabriela	Mejia	1990-09-03	613-75-2217	(714) 476-5602	\N	\N	3020 Yorba Linda Blvd.  Apt. Q13	\N	\N	Fullerton	\N	92831	CT: 02-25-2015 - 09-09-2015	HEAD,EYES,L / THIGH,R / THIGH,BACK,LOWER BACK	\N	\N	0	Joseph Gaspare Pumilla DBA Chick Fil-A  / Brea Plaza In Line DT	1176	612	<p>-----[Nov-12-15 09:34 AM Isabel M.]-----</p><p>Envie documentos a clinica y cita L/O</p><p>-----[Nov-11-15 03:32 PM Isabel M.]-----</p><p>La clinica no contesta he llamado por 7 veces</p><p>-----[Nov-11-15 11:57 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Whittier/Ford @ 13.78 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Aun/Anaheim @ 6.97 miles</p><p class="MsoNormal">Deje mensaje</p><p class="MsoNormal"><o:p><br></o:p></p><p class="MsoNormal"><o:p><br></o:p></p></p>	1072	743	Adriana	2015-11-16 14:30:00	2	\N	\N	\N	1	\N	Mariso;	2015-11-16	2015-11-11 11:57:03	2015-11-17 13:44:26	616	616	\N
10421	2015-11-18	2015-11-18	Workers Compensation	Francisca	Lopez	1957-02-10	569-95-0700	(760) 980-9129	\N	\N	83-780 Ave 48 Apt. 406	\N	\N	Indio	\N	92201	05-12-2015	L / KNEE,LOWER BACK	\N	\N	0	Agent Richard Bagdasarian, Inc	1176	612	<p>-----[Nov-18-15 02:04 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Riverside/Southland Spine @ 74.58\nmiles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Industrial/SB @ 71.19 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Al cliente le parece muy lejos, envie correo L/O</span><br></p></p>	1326	\N	\N	\N	\N	48	2015-11-18 14:00:00	\N	0	\N	\N	\N	2015-11-18 14:04:34	2015-11-18 14:04:34	616	616	\N
10393	2015-11-13	2015-11-13	Workers Compensation	Salvador	Hernandez	1958-06-19	607-12-7981	(760) 905-1103	\N	\N	72-721 Willow Street Apt 2	\N	\N	Palm Desert	\N	92260	10/25/2015	L / ANKLE,L / LEG	\N	1197	1	Mastro's Steakhouse	1176	612	<p>-----[Nov-24-15 09:48 AM Lily E.]-----</p><p>Per Vanessa @ L/O please schedule client non-MPN</p><p>-----[Nov-13-15 04:35 PM Daisy M.]-----</p><p><p>Advised Jesselin / Vanessa that we have no Dr within the MPN.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1119	722	Jesus	2015-11-30 11:00:00	2	\N	\N	\N	\N	\N	\N	\N	2015-11-13 16:35:10	2015-11-24 14:00:20	614	611	\N
10367	2015-11-12	2015-11-12	Workers Compensation	Henry	Cardona	1950-10-20	602-07-0346	(818) 893-0165	\N	(818) 983-8693	9037 Tobias Avenue Apt 5	\N	\N	Panorama City	\N	91402	CT: 11/02/2014 - 11/02/2015	HERNIA,L / FOOT	\N	\N	0	LYMI, Inc	1174	612	<p>-----[Nov-12-15 12:02 PM Daisy M.]-----</p><p>Per Vanessa schedule in Van Nuys. Paperwork emailed to the clinic.&nbsp;</p><p>-----[Nov-12-15 11:46 AM Daisy M.]-----</p><p><p>Clinic options provided to L/O: &nbsp;</p><p>Reseda / MedNation - 7.4 miles</p><p>Van Nuys / NobleQuest - 3.3 miles&nbsp;</p></p>	1152	794	Henry	2015-11-17 14:45:00	2	\N	\N	\N	1	\N	Henry	2015-11-17	2015-11-12 11:46:29	2015-11-20 10:16:33	614	611	\N
10368	2015-11-12	2015-11-12	Workers Compensation	Ralph Luis	Zamora	1991-12-11	607-52-3540	(760) 993-7686	\N	\N	66-765 Two Bunch Palms Trl. Apt. K102	\N	\N	Desert Hot. Springs	\N	92240	CT: 10-25-2014  - 10-25-2015	BACK,LOWER BACK,R / WRIST,L / KNEE,R / KNEE,HEAD,NECK	\N	\N	0	Hospitality Staffing Solutions, LLC	1176	612	<p>-----[Nov-12-15 11:52 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Industrial/SB @ 51.30 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">S.Spine/Riverside @ 54.69 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Daysi hablo con el cliente y le parece muy lejos , enviare correo a L/O</span><br></p></p>	1326	\N	\N	\N	\N	48	2015-11-12 11:50:00	\N	0	\N	\N	\N	2015-11-12 11:52:03	2015-11-12 11:52:04	616	616	\N
10394	2015-11-13	2015-11-13	Personal Injury	Adriana	Torres	1987-03-11	\N	(323) 517-3976	\N	\N	8407 Wall St.	\N	\N	Los Angeles	\N	90003	10-27-2015	HEAD,CHEST,BACK	Lower stomach, L. side	\N	0	\N	1176	612	<p>-----[Nov-17-15 01:42 PM Isabel M.]-----</p><p>La clinica informa que asistio el pasajero</p><p>-----[Nov-13-15 04:38 PM Isabel M.]-----</p><p>Envie cita L/O y documentos a clinica</p>	1073	743	Vanessa	2015-11-16 14:00:00	2	\N	\N	<p>-----[Nov-13-15 04:38 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	1	\N	Marisol	2015-11-16	2015-11-13 16:38:42	2015-11-17 13:42:34	616	616	\N
10398	2015-11-13	2015-11-13	Workers Compensation	Jose Manuel	Sandoval	1968-03-29	613-23-7087	(951) 210-4619	\N	\N	100 Woodland Ave. Apt. 127	\N	\N	Chula Vista	\N	91910	CT: 03-30-2013 - 04-01-2014	HEAD,BACK,LOWER BACK,R / FOOT,L / FOOT	\N	\N	0	Lexus San Diego	1176	612	<p>-----[Nov-24-15 08:43 AM Lily E.]-----</p><p>PEr Glamis at clinic the client was a no show on 11/11 @ 10 AM. Emailed L/O</p><p>-----[Nov-18-15 11:35 AM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-17-15 10:21 AM Isabel M.]-----</p><p><span style="line-height: 21.4286px;">Reenvie documentos a clinicas</span></p><p>-----[Nov-16-15 11:37 AM Isabel M.]-----</p><p>Por Vanesa envie documentos a clinica para cita</p><p>-----[Nov-13-15 05:25 PM Isabel M.]-----</p><p><p>Este cliente habia sido programado en ACS San Diego 11-11-2015 @ 10:00AM y no asistio y L/O querian nueva programcion &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Opciones de clinicas:</p><p><span style="color: rgb(51, 51, 51); font-family: HelveticaNeue-Roman, HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; line-height: normal; background-color: rgb(245, 245, 245);">Daisy me dio como opciones de clinicas:</span><br style="color: rgb(51, 51, 51); font-family: HelveticaNeue-Roman, HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; line-height: normal;"><span style="color: rgb(51, 51, 51); font-family: HelveticaNeue-Roman, HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; line-height: normal; background-color: rgb(245, 245, 245);">L.H / S.D 10.4 Miles</span><br style="color: rgb(51, 51, 51); font-family: HelveticaNeue-Roman, HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; line-height: normal;"><span style="color: rgb(51, 51, 51); font-family: HelveticaNeue-Roman, HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; line-height: normal; background-color: rgb(245, 245, 245);">Mission Valley / R.B @ 12.03 Miles</span><br style="color: rgb(51, 51, 51); font-family: HelveticaNeue-Roman, HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; line-height: normal;"><span style="color: rgb(51, 51, 51); font-family: HelveticaNeue-Roman, HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; line-height: normal; background-color: rgb(245, 245, 245);">Deje mensaje al cliente</span><br style="color: rgb(51, 51, 51); font-family: HelveticaNeue-Roman, HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; line-height: normal;"><span style="color: rgb(51, 51, 51); font-family: HelveticaNeue-Roman, HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; line-height: normal; background-color: rgb(245, 245, 245);">Hable con Vanessa y no tienen los medical Record, solo le dare opcion Mission Valley</span></p><p><span style="color: rgb(51, 51, 51); font-family: HelveticaNeue-Roman, HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; line-height: normal; background-color: rgb(245, 245, 245);">Deje mensaje<br></span><br></p></p>	1163	741	Linda	2015-12-07 11:00:00	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-13 17:25:17	2015-11-24 08:44:30	616	611	\N
10511	2015-11-24	2015-11-24	Workers Compensation	Joel	Gonzalez	1971-11-05	\N	(909) 478-2596	\N	\N	17400 Valley Blvd	\N	Apt 37	Fontana	\N	92335	CT: 04/02/215-11/02/2015	SPINE,R / FOOT,L / FOOT,R / LEG,L / LEG	\N	\N	0	Rock Security Inc.	1169	610	<p>-----[Nov-25-15 11:33 AM Lily E.]-----</p><p><p>Options given to Humberto @ L/O:</p><p>Fontana L/H @ 1.68 miles</p><p>Montogmery/SB @ 12.22 miles</p></p>	1086	719	Jenny	2015-12-04 10:30:00	\N	\N	\N	\N	0	\N	\N	\N	2015-11-25 11:33:09	2015-11-25 11:33:09	611	611	\N
10463	2015-11-20	2015-11-20	Workers Compensation	Jaime Grimaldo	Lua	1961-01-15	550-31-5958	(760) 698-6985	\N	\N	91-098 Gardenia St,	\N	\N	Mecca	\N	92254	CT: 08-31-2014 - 10-28-2015	L / FOOT,R / KNEE,NECK,UPPER BACK	\N	\N	0	El Espinal Farm Labor Contractor, LLC	1176	612	<p>-----[Nov-20-15 05:06 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">Montgomery/SB @ 92.92 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">S. Spine/Riverside @ 96.31 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">El cliente dice muy lejos, envie correo L/O</span><br></p></p>	1326	\N	\N	\N	\N	48	2015-11-20 17:05:00	\N	0	\N	\N	\N	2015-11-20 17:06:54	2015-11-20 17:07:29	616	616	\N
10360	2015-11-11	2015-11-11	Workers Compensation	Oscar	Morales	1976-10-18	610-94-0422	(951) 261-3896	\N	\N	3741 Harvill Ln.  Apt. 2	\N	\N	Riverside	\N	92503	CT: 06-13-2014-06-13-2015	BACK,L / LEG,L / WRIST,R / FOOT,L / FOOT	Trunk, muscles, spine, spinal cord	1304	0	Cannon Fabrication Inc	1176	817	<p>-----[Nov-11-15 04:35 PM Isabel M.]-----</p><p>Envie documentos a clinica y cita L/O</p>	1119	722	Jesus	2015-11-19 12:00:00	1	\N	\N	\N	1	2015-12-02 00:00:00	Jesus	2015-11-19	2015-11-11 16:35:18	2015-11-23 11:42:04	616	611	\N
10401	2015-11-16	2015-11-16	Workers Compensation	Joel	Sone	1978-06-13	\N	(626) 416-9737	\N	\N	27171 Neda	\N	\N	Mission Viejo	\N	92692	05-06-2015	HERNIA	Umbilical	\N	0	Owner /Management Bliss Holdings, LLC	1176	612	<p>-----[Nov-19-15 02:33 PM Lily E.]-----</p><p>Spoke to client and he advised that he would like to attend the Santa Ana location.</p><p>-----[Nov-18-15 08:24 AM Lily E.]-----</p><p>Called client no answer. LM on VM</p><p>-----[Nov-16-15 02:50 PM Lily E.]-----</p><p>Called client and no answer. Not able to leave voicemail.&nbsp;</p><p>-----[Nov-16-15 12:19 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">S. Spine/Costa Mesa @ 19.36 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Santa Ana/Keystone @ 17.65 miles<o:p></o:p></p></p>	1335	793	Lorena	2015-11-24 10:00:00	3	\N	\N	\N	\N	\N	\N	\N	2015-11-16 12:19:52	2015-11-19 14:33:32	616	611	\N
10325	2015-11-10	2015-11-10	Workers Compensation	Jose	Galvez	1962-08-13	618-52-2542	(626) 333-9949	\N	(626) 931-0673	14046 Proctor Avenue	\N	\N	La Puente	\N	91746	1. CT: 02/26/2002 - 09/05/2007    2. 02/26/2002	NECK,BACK,L / HAND,R / HAND,L / WRIST,R / WRIST,R / ARM,L / ARM,R / SHOULDER,L / SHOULDER,R / ELBOW,L / ELBOW,PSYCH,SLEEP DISORDER,DEPRESSION,STRESS	1. headaches    2.both shoulders, both arms, both hands, both elbows	1194	0	Veris Communication	1174	612	<p>-----[Nov-12-15 08:40 AM Daisy M.]-----</p><p>Additional numbers provided by Vanessa (626) 931-0673 &amp; (626) 986-4541</p><p>-----[Nov-11-15 04:53 PM Daisy M.]-----</p><p>Per Jesselin @ L/O she mailed out pt an appt letter.&nbsp;</p><p>-----[Nov-11-15 04:45 PM Daisy M.]-----</p><p>Emailed L/O to request additional number for pt, the one provided is no longer in service.&nbsp;</p><p>-----[Nov-11-15 03:01 PM Daisy M.]-----</p><p>Per Jesselin go ahead and schedule appt.&nbsp;</p><p>-----[Nov-11-15 02:41 PM Daisy M.]-----</p><p>Advised Jesselin that the next available appt for Whittier would be for 12-3-2015.&nbsp;</p><p>-----[Nov-10-15 11:14 AM Daisy M.]-----</p><p><p>Per Jesselin schedule in Whittier, paperwork emailed to the clinic.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-10-15 10:54 AM Daisy M.]-----</p><p><p>Clinic options provided to L/O:&nbsp;</p><p class="MsoNormal"><span style="color:#1F497D;mso-themecolor:dark2">Whittier / Innovative\nMedical Mgmt – 8.8 miles <o:p></o:p></span></p><p>\n\n</p><p class="MsoNormal"><span style="color:#1F497D;mso-themecolor:dark2">Pico Rivera\n/ Gutierrez Chiropractic – 12.2 miles<o:p></o:p></span></p></p>	1153	807	Sophia	2015-12-03 10:00:00	1	\N	\N	\N	\N	\N	\N	\N	2015-11-10 10:36:12	2015-11-12 08:40:29	614	614	\N
10450	2015-11-20	2015-11-20	Personal Injury	Maria Hermelinda	Jimenez	1966-04-11	\N	(818) 660-7049	\N	\N	8925 Green Bush Ave.	\N	\N	Arleta	\N	91331	11-17-2015	NECK,BACK	\N	\N	0	\N	1176	612	<p>-----[Nov-30-15 09:33 AM Isabel M.]-----</p><p><p style="color: rgb(89, 126, 162); line-height: 21.4286px; background-color: rgb(236, 240, 241);"><span style="line-height: 21.4286px;">Envie correo para saber si ya tienen la cita</span></p><div><span style="line-height: 21.4286px;"><br></span></div></p><p>-----[Nov-25-15 10:09 AM Isabel M.]-----</p><p>Reenvie documentos a clinica</p><p>-----[Nov-20-15 11:42 AM Isabel M.]-----</p><p>Mednation Reseda dio la cita para el 12-03*92015 , envie documentos a Noble Quest para ver quien la da mas pronta la cita</p>	1331	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2015-11-20 11:42:37	2015-11-30 09:33:05	616	616	\N
10438	2015-11-19	2015-11-19	Workers Compensation	Jose Javier	Vargas	1998-02-18	617-04-6057	(760) 682-8937	\N	(760) 587-9113	260 North Midway Drive	\N	\N	Escondido	\N	92027	CT: 06/01/2015-11/12/2015	R / FOOT,LOWER BACK,L / SHOULDER,R / SHOULDER,NECK	\N	\N	0	Chevron	1176	612	<p>-----[Nov-20-15 09:52 AM Isabel M.]-----</p><p>Al padrastro del cliente, ya que el es menor de edad y el lo llevaria y le parece muy lejos la clinica, le envie correo L/O</p><p>-----[Nov-19-15 04:48 PM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-19-15 03:14 PM Lily E.]-----</p><p><p>Clinic Options:</p><p>Gogatz/Murrieta @ 36.37 miles</p><p>SD/LH @ 29.05 miles</p></p>	1326	\N	\N	\N	\N	48	2015-11-20 09:55:00	\N	0	\N	\N	\N	2015-11-19 15:14:12	2015-11-20 09:52:54	611	616	\N
10395	2015-11-13	2015-11-13	Workers Compensation	Miguel A.	Molina	1966-02-20	652-20-0520	(760) 676-7624	\N	\N	84-781 Sonchine Ave.	\N	\N	Coachella	\N	92236	CT: 06-01-2014 - 05-30-2015	HEAD,NECK,BACK,R / SHOULDER,R / ARM	\N	\N	0	Indian Palms Country Club	1176	612	<p>-----[Nov-13-15 05:30 PM Isabel M.]-----</p><p>Envie correo L/O</p><p>-----[Nov-13-15 05:28 PM Isabel M.]-----</p><p>Al cliente le parece muy lejos</p><p>-----[Nov-13-15 05:01 PM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-13-15 04:50 PM Isabel M.]-----</p><p><p>Opciones de clinica</p><p class="MsoNormal">SB / Industrial – 74.54 miles <o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Murrieta / Gogatz – 89.91 miles&nbsp;<o:p></o:p></p></p>	1326	\N	\N	\N	\N	48	2015-11-13 17:30:00	\N	0	\N	\N	\N	2015-11-13 16:50:11	2015-11-13 17:30:32	616	616	\N
10377	2015-11-12	2015-11-12	Workers Compensation	Maria De La Luz	Agosto	1965-07-11	558-67-9215	(619) 906-1290	\N	\N	12630 Lakeshore Dr. Apt. 25	\N	\N	Lakeside	\N	92040	CT: 02-20-2015 - 09-03-2015	L / FOOT,R / FOOT,LOWER BACK,R / HIP,HEAD,R / ANKLE,L / ANKLE	\N	\N	0	Allied	1176	612	<p>-----[Nov-12-15 03:45 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal"><o:p></o:p></p>\n\n<p class="MsoNormal">SD / LH @ 9.09miles <o:p></o:p></p><p class="MsoNormal">\n\n</p><p class="MsoNormal">Mission Valley / RB Spine @18.30\nmiles&nbsp;</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica y &nbsp;cita L/O</span><br></p><p class="MsoNormal" style="box-sizing: border-box; margin: 0px 0px 10.5px; color: rgb(0, 0, 0); font-family: Lato, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 21.4286px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">&nbsp;<span class="Apple-converted-space">&nbsp;</span><br class="Apple-interchange-newline" style="box-sizing: border-box;"></p><p class="MsoNormal"><br class="Apple-interchange-newline"></p><p><br></p></p>	1128	719	Jenny	2015-11-19 15:30:00	2	\N	\N	<p>-----[Nov-12-15 03:45 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-12 15:45:46	2015-11-12 15:48:02	616	616	\N
10487	2015-11-23	2015-11-23	Personal Injury	Roosevelt	Citizen	1993-07-23	604-68-0289	(562) 519-5843	\N	\N	1505 S. Pearl Street	\N	\N	Compton	\N	90221	11-16-2015	BACK,R / LEG,L / LEG	Teeth	\N	0	\N	1168	827	\N	1073	743	David	2015-11-24 09:00:00	1	\N	\N	\N	0	\N	\N	\N	2015-11-24 09:02:23	2015-11-24 09:02:23	611	611	\N
10428	2015-11-18	2015-11-18	Workers Compensation	Guadalupe	Moreno	1956-12-12	\N	(210) 416-9345	\N	\N	3845 Samuel Dr. Spc 181	\N	\N	Oxnard	\N	93033	09--02-2015	LOWER BACK	\N	\N	0	Envel Design Corpiration	1176	612	<p>-----[Nov-18-15 05:12 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Reseda/MedNation @ 41.42 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 47.31 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Al cliente le parece lejos, envie correo L/O&nbsp;</span><br></p><p class="MsoNormal"><o:p></o:p></p></p>	1326	\N	\N	\N	\N	48	2015-11-18 17:10:00	\N	0	\N	\N	\N	2015-11-18 17:12:19	2015-11-18 17:12:19	616	616	\N
10229	2015-11-03	2015-11-03	Workers Compensation	Arturo	Hernandez	1970-01-07	\N	(323) 373-6649	\N	\N	5028 N. Melrose Ave.	\N	\N	Los Angeles	\N	90038	CT:  02-01-2014 - 02-01-2015	R / HIP,L / HIP,R / SHOULDER,L / SHOULDER,L / ELBOW,R / ELBOW,L / LEG,R / LEG,BACK	\N	\N	0	Alla Moda Furniture	1176	612	<p>-----[Nov-16-15 03:13 PM Isabel M.]-----</p><p>Envie nueva cita L/O</p><p>-----[Nov-16-15 03:11 PM Isabel M.]-----</p><p>El cliente tiene dos casos y Mednation no tomo el otro, y la oficina de L/O quiere que asista &nbsp;al mismo lugar, por eso se cambiara de MedNation &nbsp;para &nbsp;Glendale</p><p>-----[Nov-05-15 09:32 AM Isabel M.]-----</p><p><span style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;">Envie cita L/O</span></p><p>-----[Nov-04-15 04:10 PM Isabel M.]-----</p><p>Envie documentos a clinica, el cliente prefiere por la manana la cita</p><p>-----[Nov-04-15 01:48 PM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-03-15 10:35 AM Isabel M.]-----</p><p><p>Opciones de clinicasL:</p><p class="MsoNormal">MedNation/LA @ 3.22 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Glendale/Daher @ 6.99 miles</p><p class="MsoNormal">Caso 2/2</p><p class="MsoNormal"><span style="line-height: 1.42857;">Deje mensaje</span><br></p></p>	1087	757	Sunny	2015-11-25 10:00:00	1	\N	\N	<p>-----[Nov-16-15 03:42 PM Isabel M.]-----</p><p>Conf. L/O de la nueva cita</p><p>-----[Nov-05-15 09:32 AM Isabel M.]-----</p><p><span style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;">Esta malo el telefono , envie carta</span></p>	\N	\N	\N	\N	2015-11-03 10:35:17	2015-11-16 15:42:27	616	616	\N
10378	2015-11-12	2015-11-12	Workers Compensation	Jose Manuel	Gonzalez Arroyo	1975-05-06	\N	(818) 810-8868	\N	\N	9232 Sepulveda Blvd. Apt. 121	\N	\N	North Hills	\N	91343	CT: 01-21-2014 - 01-21-2015	NECK,CHEST,BACK,L / FOOT,R / FOOT	\N	\N	0	Pierre Landscape, Inc	1176	612	<p>-----[Nov-12-15 04:32 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p>Van Nuys/NobleQuest @ 5.7 Millas</p><p>Reseda/ MedNation @ 6.0 Millas</p><p>Envie documentos a clinicas y cita L/O</p><p><br></p></p>	1115	731	Yanira	2015-11-20 11:00:00	2	\N	\N	<p>-----[Nov-12-15 04:32 PM Isabel M.]-----</p><p>Conf. con Pt. y quiere texto</p>	1	\N	Yanira	2015-11-20	2015-11-12 16:32:03	2015-11-23 12:15:04	616	611	\N
10412	2015-11-17	2015-11-17	Workers Compensation	Bartolo	Figueroa Meneces	1969-08-13	567-53-6453	(323) 635-2144	\N	\N	7011 Denver Ave.	\N	\N	Los Angeles	\N	90044	CT: 02-01-2012 - 02-08-2014	LOWER BACK,L / HIP,R / LEG,L / LEG,R / KNEE,L / KNEE,L / FOOT,R / FOOT,L / ANKLE,R / ANKLE,STRESS	Soles, anxiety, depression	\N	0	Spear Management  Company	1176	612	<p>-----[Nov-18-15 09:18 AM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-17-15 04:36 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">MedNation/LA @ 11.40 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Pico Rivera/Gutierrez @ 16.68\nmiles</p><p class="MsoNormal"><o:p><br></o:p></p><p class="MsoNormal"><o:p>Envie documentos a clinica</o:p></p><p><br></p></p>	1097	731	Yanira	2015-11-23 11:00:00	2	\N	\N	<p>-----[Nov-18-15 09:53 AM Isabel M.]-----</p><p>Conf. con &nbsp;Pt.</p>	0	\N	\N	\N	2015-11-17 16:36:25	2015-11-18 09:53:18	616	616	\N
10501	2015-11-25	2015-11-25	Workers Compensation	Gustavo	Gradilla	1975-07-18	634-98-7023	(626) 274-2271	\N	\N	3711 Penn Mar Ave. Apt. 19	\N	\N	El Monte	\N	91732	CT: 11-22-2014 - 05-22-2015	HEAD,LOWER BACK	Heels, soles	1221	0	Service King Collision Repair	1176	612	<p>-----[Nov-25-15 08:50 AM Isabel M.]-----</p><p><p>Lily no dio opciones de clinica</p><p>Envie cita L/O y Lily envio los documentos a clinica</p><p><br></p></p>	1074	774	Maggie	2015-12-07 14:30:00	2	\N	\N	<p>-----[Nov-25-15 08:50 AM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-25 08:50:53	2015-11-25 08:50:53	616	616	\N
10512	2015-11-24	2015-11-24	Workers Compensation	Brandon	Berrios	1978-12-17	554-55-2430	(760) 686-0629	\N	\N	8325 3rd Ave	\N	\N	Hesperia	\N	92345	09-17-2015	R / ARM,R / SHOULDER,NECK,R / UPPER EXT	\N	\N	0	Werner Enterprises	1176	817	\N	1139	749	Jessica	2016-01-07 14:30:00	1	\N	\N	<p>-----[Nov-25-15 11:44 AM Lily E.]-----</p><p>In House HX: Appt 01/05 @ 10:00 AM</p>	0	\N	\N	\N	2015-11-25 11:44:06	2015-11-25 11:44:06	611	611	\N
10339	2015-11-10	2015-11-10	Workers Compensation	Jesus	Nunez	1989-03-17	625-38-5190	(661) 577-1299	\N	(661) 623-7428	419 Eastern Ave.	\N	\N	Taft	\N	93268	CT: 08-25-2014 - 08-25-2015	L / FOOT,R / FOOT,R / SHOULDER,L / SHOULDER,BACK,LOWER BACK	Calves	\N	0	Emipre	1176	612	<p>-----[Nov-13-15 02:46 PM Isabel M.]-----</p><p>Jesselin pidio que lo programaramos y ellos lo confirmarian, envie la cita L/O</p><p>-----[Nov-12-15 05:12 PM Isabel M.]-----</p><p><p>El nuevo numero del cliente : 661-577-1299</p><p><span style="line-height: 1.42857;">Envie documentos a clinica para cita</span><br></p></p><p>-----[Nov-12-15 09:58 AM Isabel M.]-----</p><p>El telefono no funciona, enviare un correo de cancelacion a L/O</p><p>-----[Nov-11-15 05:29 PM Isabel M.]-----</p><p>No funciona el tel</p><p>-----[Nov-11-15 10:09 AM Isabel M.]-----</p><p><span style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;">No funciona el tel</span></p><p>-----[Nov-10-15 04:53 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Bakersfield/BMG @ 40.76 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 109.72 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">No funciona el tel y el abogado no tiene otro</span><br></p></p>	1159	808	Alex	2014-12-03 10:30:00	1	\N	\N	\N	\N	\N	\N	\N	2015-11-10 16:53:27	2015-11-13 14:46:45	616	616	\N
10526	2015-11-25	2015-11-25	Workers Compensation	Angelina	Padilla Guillen	1977-02-13	\N	(323) 635-5711	\N	\N	939 W. 62nd  St.	\N	\N	Los Angeles	\N	90044	CT: 10-16-2013- 10-14-2014	BACK	\N	\N	0	Garment Processing Corp.	1176	612	<p>-----[Nov-25-15 04:39 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">MedNation/LA @ 11.40 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Gutierrez/Pico Rivera @ 16.68\nmiles</p><p class="MsoNormal"><o:p></o:p></p><p>Envie documentos a clinica y cita L/O</p></p>	1097	731	Yanira	2015-12-03 16:00:00	2	\N	\N	<p>-----[Nov-25-15 04:39 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-25 16:39:01	2015-11-25 16:39:02	616	616	\N
10534	2015-11-30	2015-11-30	Workers Compensation	Oscar	Barahona	1960-10-10	\N	(323) 708-4997	\N	\N	3115 South La Salle Avenue	\N	\N	Los Angeles	\N	90018	04/10/2015	R / SHOULDER,L / SHOULDER	\N	1248	0	RDV	1176	612	<p>-----[Nov-30-15 09:25 AM Daisy M.]-----</p><p>Per Vanessa @ L/O pt was previously treating with Dr. Opoku, but is not happy and wants a PTP change, will schedule with Atlantis Health Management @ 9.07 miles.</p>	1098	739	Desiree	2015-12-16 07:30:00	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-30 09:25:35	2015-11-30 10:38:24	614	614	\N
10275	2015-11-05	2015-11-05	Workers Compensation	Jose	Garcia	1972-12-26	615-28-7211	(909) 258-7269	\N	(909) 682-2916	2860 E. Highland Ave.	\N	\N	Highland	\N	92346	10-21-2015	L / SHOULDER,L / ARM,L / HAND,FINGERS,L / KNEE,L / WRIST,NECK	\N	\N	0	Capstone	1176	612	<p>-----[Nov-19-15 01:44 PM Isabel M.]-----</p><p>Deje mensaje para recuperacion de N/S</p><p>-----[Nov-17-15 10:04 AM Lily E.]-----</p><p>Per Esther @ clinic the client was a no show on 11/12/2015. &nbsp;Emailed L/O</p><p>-----[Nov-06-15 01:58 PM Isabel M.]-----</p><p>Envie cita L/O y documentos a clinica</p><p>-----[Nov-06-15 11:01 AM Isabel M.]-----</p><p>La clinica de Industrial &nbsp;S.B tiene cita hasta el 11-21-2015</p><p>-----[Nov-05-15 04:06 PM Isabel M.]-----</p><p>El cliente quiere una cita mas rapida, la clinica de Industrial ya cerro para ver si ellos lo atienden mas pronto</p><p>-----[Nov-05-15 03:44 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Montgomery/SB @ 9.27 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Fontana/LH @ 18.69 miles<o:p></o:p></p></p>	1125	749	Esther	2015-11-12 08:30:00	\N	45	\N	<p>-----[Nov-06-15 01:58 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	\N	\N	\N	\N	2015-11-05 15:44:46	2015-11-19 13:44:50	616	616	\N
10422	2015-11-18	2015-11-18	Workers Compensation	Manuel	Mendez Martinez	1936-08-15	526-64-3428	(951) 849-7363	\N	\N	P.O Box 1094	\N	\N	Banning	\N	92220	CT: 12-03-2011 - 12-03-2014	HEAD,NECK,BACK,L / ARM,R / ARM,R / WRIST,L / WRIST,WAIST,L / LEG,R / LEG,R / KNEE,L / KNEE,L / ELBOW,R / ELBOW,L / ANKLE,R / ANKLE	Allergies	\N	0	Child Help, Inc	1176	612	<p>-----[Nov-20-15 11:02 AM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-18-15 02:41 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Montgomery/SB @ 27.49 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Southland Spine/Riverside @ 30.93\nmiles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Deje Mensaje</span><br></p></p>	1125	749	Erika	2015-12-03 10:30:00	2	\N	\N	<p>-----[Nov-20-15 11:02 AM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-18 14:41:04	2015-11-20 11:02:23	616	616	\N
10396	2015-11-13	2015-11-13	Workers Compensation	Maria Guadalupe	Barajas	1971-12-09	323-94-4999	(661) 337-9017	\N	(661) 446-3305	1900 Poplar Ave. Apt. 116	\N	\N	Wasco	\N	93280	08-20-2015	BACK,LOWER BACK,R / KNEE,HEAD	\N	\N	0	MN Contracting Inc	1176	612	<p>-----[Nov-16-15 09:57 AM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-13-15 04:59 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p style="box-sizing: border-box; margin: 0px 0px 10.5px; color: rgb(0, 0, 0); font-family: Lato, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 21.4286px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="line-height: 1.42857;">Bakersfield / BMG – 30.50 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Reseda / MedNation – 123.75 miles&nbsp;</p><p class="MsoNormal"><o:p></o:p></p><p class="MsoNormal" style="box-sizing: border-box; margin: 0px 0px 10.5px; color: rgb(0, 0, 0); font-family: Lato, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 21.4286px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><o:p style="box-sizing: border-box;"></o:p></p><p>Envie documentos a clinica</p><p class="MsoNormal" style="box-sizing: border-box; margin: 0px 0px 10.5px; color: rgb(0, 0, 0); font-family: Lato, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 21.4286px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">R</p><p><br></p><p class="MsoNormal"><o:p></o:p></p><p><br></p><p><br></p><p><br></p></p>	1159	808	Alex	2015-12-03 11:00:00	2	\N	\N	<p>-----[Nov-16-15 10:34 AM Isabel M.]-----</p><p>Conf. con Pt.</p>	\N	\N	\N	\N	2015-11-13 16:59:43	2015-11-16 10:34:34	616	616	\N
10371	2015-11-12	2015-11-12	Workers Compensation	Jorge	Luna	1974-08-24		(619) 608-4130	\N	(619) 608-3508	2626 Coronado Ave. Space 87	\N	\N	San Diego	\N	92154	09-25-2014	R / ARM,R / HAND	R. thumb	\N	0	Infinity Personnel	1176	612	<p>-----[Nov-17-15 10:00 AM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-16-15 09:39 AM Isabel M.]-----</p><p>Reenvie correo a clinica para cita</p><p>-----[Nov-13-15 02:59 PM Isabel M.]-----</p><p><span style="line-height: 21.4286px;">Por Jesselin pidio que lo programen, la L/O lo confirmara , envie documentos &nbsp;a la clinica</span></p><p>-----[Nov-13-15 09:13 AM Isabel M.]-----</p><p>Envie correo de no contacto</p><p>-----[Nov-13-15 08:54 AM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-12-15 05:23 PM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-12-15 02:52 PM Isabel M.]-----</p><p>Deje mensaje 2 telefonos</p><p>-----[Nov-12-15 02:31 PM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-12-15 12:19 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">San Ysidro/RB @ 4.54 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">SD/LH @ 15.59 miles</p><p class="MsoNormal"><o:p></o:p></p><p>Deje mensaje</p></p>	1163	742	Linda	2015-12-07 10:00:00	1	\N	\N	\N	0	\N	\N	\N	2015-11-12 12:19:21	2015-11-17 10:00:24	616	616	\N
10495	2015-11-24	2015-11-24	Workers Compensation	Veronica	Lara	1973-11-09	612-88-5656	(760) 408-4449	\N	\N	3733 Mauntain View Dr.	\N	\N	Dessert   Shores	\N	92274	07-14-2015	R / WRIST	R. thumb	\N	0	The Jewel Date Company Inc	1176	612	<p>-----[Nov-24-15 02:45 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Montgomery/SB @ 101.00 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">S. Spine/Riverside @ 104.44 miles</p><p class="MsoNormal"><o:p><br></o:p></p><p class="MsoNormal">Envie cita L/O y documentos a clinica</p></p>	1119	722	Jesus	2015-11-30 15:00:00	2	\N	\N	<p>-----[Nov-24-15 02:45 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-24 14:45:44	2015-11-24 14:45:44	616	616	\N
10355	2015-11-11	2015-11-11	Workers Compensation	Benjamin	Hernandez	1952-01-09	\N	(626) 622-4755	\N	\N	3144 Chico Ave.	\N	\N	El Monte	\N	91733	CT: 08-05-2013 - 08-15-2014	HEAD,NECK	\N	\N	0	California Expanded Metal Products, Inc	1176	612	<p>-----[Nov-13-15 11:03 AM Isabel M.]-----</p><p>Cancele la cita con Jeniffer de la clinicay le informe al cliente de no asistir</p><p>-----[Nov-13-15 10:00 AM Daisy M.]-----</p><p>Per Vanessa @ L/O cancel case for now, pt is not clear on the DOI...once that is sorted out they will call back and R/S appt.&nbsp;</p><p>-----[Nov-11-15 02:16 PM Isabel M.]-----</p><p>Envie documentos a clinica y cita L/O</p><p>-----[Nov-11-15 01:58 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">El Monte/Greenfield @ 3.30 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">West Covina/Multi-Care @ 3.20 Miles<o:p></o:p></p></p>	1326	774	Maggie	2015-11-23 09:30:00	\N	55	2015-11-13 11:00:00	<p>-----[Nov-11-15 02:16 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-11 13:58:20	2015-11-13 11:03:21	616	616	\N
10407	2015-11-17	2015-11-17	Workers Compensation	Francisco	Reyes	1967-07-29	\N	(909) 885-4057	\N	\N	265 W. 10th Street	\N	Apt 30	San Bernardino	\N	92410	1. 05/13/2015 2. 11/04/2015	R / SHOULDER	2. right shoulder, right arm, right elbow	1244	1	CA Landscape and Design	1169	610	<p>-----[Nov-20-15 11:49 AM Lily E.]-----</p><p>Per Humberto @ L/O CX as the only Dr. on the MPN is too far.&nbsp;</p><p>-----[Nov-17-15 11:57 AM Lily E.]-----</p><p>Humberto @ L/O is requesting MPN Dr. advised him we only have Dr. Balian in Montclair on the MPN @ 27.13 miles. Pending on how to proceed.&nbsp;</p>	1326	\N	\N	\N	\N	48	\N	\N	0	\N	\N	\N	2015-11-17 11:57:36	2015-11-20 11:49:14	611	611	\N
10312	2015-11-09	2015-11-09	Workers Compensation	Ramon	Cruz	1969-02-19	545-99-7898	(909) 723-0465	\N	\N	2796 Harrison St	\N	\N	San Bernardino	\N	92404	CT: 11/01/2013 - 11/01/2014	R / SHOULDER,R / FOREARM,L / SHOULDER,L / FOREARM,R / ELBOW,L / ELBOW,R / WRIST,L / WRIST,NECK,R / HIP,L / HIP	spine	1182	0	Xcel Building Group Inc	1169	610	<p>-----[Nov-17-15 10:01 AM Lily E.]-----</p><p>Per Edwin @ clinic the clients appt was cancelled per clients request. Will email L/O on how to proceed.&nbsp;</p><p>-----[Nov-09-15 02:01 PM Daisy M.]-----</p><p><p><span style="line-height: 21.4286px;">Per Humberto schedule in Fontana.</span></p><p><span style="line-height: 21.4286px;">Per Jenny @ clinic appt for 11-13-2015 will be a phone Hx.&nbsp;</span></p></p><p>-----[Nov-09-15 01:47 PM Daisy M.]-----</p><p><p>Advised Humberto from L/O that the locations below are the closet for pt:&nbsp;</p><p class="MsoNormal"><span style="color:#1F497D;mso-themecolor:dark2">Fontana /\nLH – 14.0 miles<o:p></o:p></span></p><p class="MsoNormal"><span style="color:#1F497D;mso-themecolor:dark2">Riverside /\nSouthland Spine – 16.0 miles <o:p></o:p></span></p><p>\n\n\n\n</p><p class="MsoNormal"><span style="color:#1F497D;mso-themecolor:dark2">&nbsp;Waiting on him to adivse in which clinic to schedule pt.&nbsp;</span></p></p>	1086	719	Jenny	2015-11-13 09:00:00	\N	55	\N	<p>-----[Nov-09-15 02:01 PM Daisy M.]-----</p><p>Per Jenny @ clinic appt for 11-13-2015 will be a phone Hx.&nbsp;</p>	0	\N	\N	\N	2015-11-09 12:28:57	2015-11-17 10:01:54	614	611	\N
10554	2015-11-30	2015-11-30	Workers Compensation	Alfredo	Viveros	1965-01-12	616-24-2084	(626) 230-9955	\N	\N	3920 Rowland Ave	\N	\N	El Monte	\N	91731	01/08/2015	R / SHOULDER,L / SHOULDER,SPINE,STRESS,R / FOOT,L / FOOT	trunk	1244	0	B.I.G. Enterprises Inc	1169	610	<p>-----[Nov-30-15 03:25 PM Daisy M.]-----</p><p><p>El Monte / Greenfield - 3.69 miles&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1074	774	Maggie	2014-12-16 08:00:00	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-30 15:25:41	2015-11-30 16:21:06	614	614	\N
10513	2015-11-25	2015-11-25	Workers Compensation	Luis	Galarza	1964-07-16	\N	(818) 277-9266	\N	\N	15058 Romero Pl	\N	\N	North Hills	\N	91343	1. 10/16/2015 2.CT: 10/10/2014-10/10/2015	NECK	2. back, neck, waist	\N	0	SCV Pool & Spas Inc.	1176	817	\N	1115	731	Yanira	2015-12-04 14:00:00	1	\N	\N	\N	\N	\N	\N	\N	2015-11-25 12:22:17	2015-11-30 10:07:07	611	611	\N
10403	2015-11-16	2015-11-16	Workers Compensation	Marco	Cerqueda	1993-11-17	\N	(951) 662-2248	\N	\N	2047  12th St,	\N	\N	Riverside	\N	92507	11-06-2015	HEAD,NECK	\N	\N	0	Barrett Business Services	1176	612	<p>-----[Nov-18-15 10:21 AM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-17-15 09:46 AM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-16-15 04:05 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Keystone/Riverside @ 6.97 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Montgomery/Riverside @ 6.12 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Deje mensaje</span><br></p></p>	1119	722	Lorena	2015-11-18 15:00:00	\N	\N	\N	\N	1	2015-12-01 00:00:00	Jesus	2015-11-18	2015-11-16 16:05:44	2015-11-23 11:41:32	616	611	\N
10430	2015-11-18	2015-11-18	Workers Compensation	Fernando	Leiva	1954-05-12		(323) 371-4127	\N	\N	6512 Rugby  Ave	\N	\N	Huntington Park	\N	90255	07-01-2015	WAIST	\N	\N	0	Clougherty  Packing, LLC	1176	612	<p>-----[Nov-19-15 03:43 PM Isabel M.]-----</p><p>Envie cita L/O y documentos a clinica</p><p>-----[Nov-19-15 12:07 PM Isabel M.]-----</p><p>Envie documentos a clinica, porque no contestan</p><p>-----[Nov-18-15 05:28 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Pico Rivera/Gutierrez @ 8.18 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Whittier/Ford @ 12.67 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">No contesta y no se puede dejar mensaje</span><br></p></p>	1112	766	Carmen	2015-11-24 11:00:00	2	\N	\N	<p>-----[Nov-19-15 03:43 PM Isabel M.]-----</p><p>El cliente queria carta y confirme con Pt.</p>	0	\N	\N	\N	2015-11-18 17:28:25	2015-11-19 15:43:24	616	616	\N
10397	2015-11-13	2015-11-13	Workers Compensation	Omar	Quiroz	1979-12-30	\N	(323) 849-6138	\N	\N	5449 1/2 Virginia Ave Apt F	\N	\N	Los Angeles	\N	90029	1. CT: 11/008/2013 - 11/08/2015     2. 10/01/2015	SPINE,R / HIP,L / HIP,L / HAND,R / HAND,EYES,NECK,L / ANKLE,R / ANKLE,R / SHOULDER,L / SHOULDER	1. respiratory system     2. right hand, right hand thumb	\N	0	Cemcoat, Inc	1169	610	<p>-----[Nov-13-15 05:06 PM Daisy M.]-----</p><p>Per Humberto @ L/O schedule after 4:30 pm. Sent paperwork to LA / MedNation (2.5 miles).&nbsp;</p>	1097	\N	Yanira	2015-11-17 17:00:00	2	\N	\N	\N	1	\N	Yanira	2015-11-19	2015-11-13 17:06:00	2015-11-23 12:16:37	614	611	\N
10417	2015-11-18	2015-11-18	Workers Compensation	Elizabeth	Gomez Iniguez	1980-09-20	622-96-0099	(760) 605-8828	\N	(760) 475-8042	14800  Cholame Rd	\N	\N	Victorville	\N	92392	10-11-2015	R / ANKLE,R / FOOT,LOWER BACK,L / HIP	R. foot sole, lower abdomen	1210	0	Kellermeyes Bergensons Services	1176	612	<p>-----[Nov-18-15 10:46 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Victorville/Montgomery @ 7.84\nmiles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Industrial/SB @ 37.49 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">La cita para Historial: 12-23-2015 @ 10:00AM En oficina</span></p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie cita L/O<br></span><br></p></p>	1139	749	Jessica	2015-12-29 14:30:00	2	\N	\N	\N	0	\N	\N	\N	2015-11-18 10:46:38	2015-11-18 10:46:38	616	616	\N
10380	2015-11-12	2015-11-12	Workers Compensation	Noe S.	Lopez	1954-08-11	\N	(909) 567-6413	\N	\N	13126 3rd Street	\N	\N	Chino	\N	91710	1. CT: 11/10/2014 - 11/10/2015	HERNIA,L / KNEE,R / HIP,L / HIP	1. left testicle	\N	0	TransAmerica Landscape	1169	610	<p>-----[Nov-13-15 11:01 AM Daisy M.]-----</p><p><p>Per Humberto schedule appt.&nbsp;</p><p>Pt has a phone HX on 11-23-2015 @ 3:00 pm.&nbsp;</p></p><p>-----[Nov-12-15 04:57 PM Daisy M.]-----</p><p><span style="line-height: 21.4286px;">Advised L/O the closest would be Riverside / Southland Spine @ approx 19.9 miles.&nbsp;</span><span style="line-height: 21.4286px;">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="line-height: 21.4286px;">&nbsp; &nbsp;&nbsp;</span></p><p>-----[Nov-12-15 04:45 PM Daisy M.]-----</p><p>Case 1 of 2</p>	1121	747	Luis	2015-11-25 16:10:00	2	\N	\N	\N	\N	\N	\N	\N	2015-11-12 16:45:51	2015-11-24 10:57:01	614	611	\N
10391	2015-11-13	2015-11-13	Workers Compensation	Jorge A.	Arias	1981-06-19	603-92-6989	(805) 575-7284	\N	(805) 419-1597	182 Ripey St. Apt. 38	\N	\N	Camarillo	\N	93010	ST: 06-01-2014- 06-01-2015	LOWER BACK,HERNIA	TEsticle	1204	0	Coastal Restaurants Dev DBA Subway	1176	612	<p>-----[Nov-13-15 03:13 PM Isabel M.]-----</p><p>Hable con el cliente y le parece muy lejos la clinica, envie correo L/O</p><p>-----[Nov-13-15 02:22 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Reseda / MedNation – 35.41 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys / NobleQuest – 41.30\nmiles</p><p class="MsoNormal">llegara a su casa como a las 3:00PM&nbsp;<o:p></o:p></p><p><br></p></p>	1326	\N	\N	\N	\N	48	2015-11-13 15:10:00	\N	0	\N	\N	\N	2015-11-13 14:22:17	2015-11-13 15:50:21	616	616	\N
10381	2015-11-12	2015-11-12	Workers Compensation	Noe S.	Lopez	1954-08-11	\N	(909) 567-6413	\N	\N	13126 3rd Street	\N	\N	Chino	\N	91710	1 10/13/2015	R / KNEE,R / LEG,R / FOOT,R / HIP,NECK	\N	\N	0	Super Center Concepts Inc	1169	610	<p>-----[Nov-13-15 11:02 AM Daisy M.]-----</p><p><p style="line-height: 21.4286px;">Per Humberto schedule appt.&nbsp;</p><p style="line-height: 21.4286px;">Pt has a phone HX on 11-23-2015 @ 3:00 pm.&nbsp;</p></p><p>-----[Nov-12-15 04:56 PM Daisy M.]-----</p><p><span style="line-height: 21.4286px;">Advised L/O the closest would be Riverside / Southland Spine @ approx 19.9 miles.&nbsp;</span><span style="line-height: 21.4286px;">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="line-height: 21.4286px;">&nbsp; &nbsp;&nbsp;</span></p><p>-----[Nov-12-15 04:49 PM Daisy M.]-----</p><p>Case 2 of 2&nbsp;</p>	1121	747	Luis	2015-11-25 16:10:00	2	\N	\N	\N	\N	\N	\N	\N	2015-11-12 16:49:05	2015-11-24 10:57:37	614	611	\N
10385	2015-11-13	2015-11-13	Workers Compensation	Veronica	Brizuela	1973-06-01	610-54-9612	(619) 538-4712	\N	(619) 779-6890	5344  Rex Ave. Apt.3	\N	\N	San Diego	\N	92105	CT: 06-01-2014 -08-06-2015	L / SHOULDER,L / ARM,NECK,LOWER BACK,BACK	\N	\N	0	GMS Industry Solutions, Inc	1176	612	<p>-----[Nov-13-15 11:14 AM Isabel M.]-----</p><p>Hable &nbsp;con la cliente, porque la cita es para el 12-03-2015 , ya que el Dr. ya que las citas son para Jueves y el 11-19-2015 ya esta lleno y el dia 11-26-2015 estara cerrado por fiestas, pero la cliente prefiere esperar porque la clinica le queda cerca, le informe a su abogado</p><p>-----[Nov-13-15 10:07 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">SD / LH @ 2.80 miles <o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Mission Valley / RB @ 6.02 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica y cita L/O</span><br></p></p>	1128	719	Jenny	2014-12-03 09:00:00	2	\N	\N	<p>-----[Nov-13-15 10:07 AM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-13 10:07:41	2015-11-13 11:14:15	616	616	\N
10514	2015-11-24	2015-11-24	Workers Compensation	Aida	Rivera	1971-06-14	584-74-1604	(714) 931-4388	\N	\N	P.O Box 2633	\N	\N	Orange	\N	92859	1. 05/04/2015 2. CT: 07/17/2014-07/17/2015	L / SHOULDER,L / HAND,FINGERS,L / ARM	2. back, neck	1248	0	MVP Staffing	1176	612	\N	1335	793	Jesus	2015-12-01 11:15:00	2	\N	\N	\N	\N	\N	\N	\N	2015-11-25 12:33:10	2015-11-25 17:20:35	611	611	\N
10379	2015-11-12	2015-11-12	Workers Compensation	Maria	Estrada	1961-02-19	\N	(626) 723-5167	\N	\N	13126 3rd Street	\N	\N	Chino	\N	91710	CT: 10/25/2014 - 10/25/2015	L / SHOULDER,L / ARM,L / HAND,L / KNEE,HERNIA,NECK	\N	\N	0	Platinum Staffing	1169	610	<p>-----[Nov-13-15 11:44 AM Daisy M.]-----</p><p>Conf w/ pt and sent text upon her request.&nbsp;</p><p>-----[Nov-13-15 10:58 AM Daisy M.]-----</p><p><p>Per Humberto go ahead and schedule appt.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>Pt will have a phone HX on 12-23-2015 @ 4:30 pm.</p></p><p>-----[Nov-12-15 04:56 PM Daisy M.]-----</p><p><p>Advised L/O the closest would be Riverside / Southland Spine @ approx 19.9 miles.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1121	747	Lewis	2015-11-25 15:50:00	2	\N	\N	\N	\N	\N	\N	\N	2015-11-12 16:42:15	2015-11-13 11:44:13	614	614	\N
10332	2015-11-10	2015-11-10	Workers Compensation	Guadalupe Maribel	Barreras	1974-12-12	623-78-7213	(661) 623-7428	\N		419 Eastern Avenue	\N	\N	Taft	\N	93268	06/28/2015	LOWER BACK,NECK,L / WRIST,R / WRIST	\N	\N	0	L and R Contracting	1174	612	<p>-----[Nov-12-15 04:37 PM Daisy M.]-----</p><p>PerJesselin @ L/O schedule pt in Bakersfield.&nbsp;</p><p>-----[Nov-11-15 09:40 AM Daisy M.]-----</p><p>Number provided by Jesselin is non working. Advised her and Vanessa that case will be cancelled until we can obtain a good number for her.&nbsp;</p><p>-----[Nov-11-15 09:23 AM Isabel M.]-----</p><p>Llamo Jesselin y di un nuevo numero de telefono : 661-223-7428, Le informe a Daysi</p><p>-----[Nov-10-15 01:52 PM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>Bakersfield / BMG - 40.76 miles</p><p>Van Nuys / NobleQuest - 109.72 miles</p><p>Called pt to provide her with clinic options, but contact number is not in service. Emailed Jesselin @ L/O to verify if they have any additional numbers.&nbsp;</p></p>	1159	808	Alex	2015-11-19 13:45:00	4	\N	\N	\N	1	2015-12-21 13:15:00	AleX	2015-11-19	2015-11-10 13:52:45	2015-11-24 15:20:50	614	611	\N
10476	2015-11-23	2015-11-23	Workers Compensation	Ruben	Higareda	1989-09-21	614-42-7880	(619) 452-6301	\N	(619) 395-3058	814 S. 46th St.	\N	\N	San Diego	\N	92113	CT: 05-01-2014 - 11-13-2015	R / KNEE,L / KNEE,L / FOOT,R / FOOT,HEAD,R / LEG,L / LEG	\N	\N	0	Hai's Painting	1176	612	<p>-----[Nov-23-15 10:55 AM Isabel M.]-----</p><p>Envie documentos a clinica y cita L/O</p><p>-----[Nov-23-15 10:53 AM Isabel M.]-----</p><p><p>Opiciones de clinicas:</p><p class="MsoNormal">SD/LH @ 4.90 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Mission Valley/RB @ 8.20 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clientes</span><br></p></p>	1128	719	Jenny	2015-12-03 16:15:00	2	\N	\N	<p>-----[Nov-23-15 10:53 AM Isabel M.]-----</p><p>Conf, con Pt</p>	0	\N	\N	\N	2015-11-23 10:53:32	2015-11-23 10:55:29	616	616	\N
10440	2015-11-19	2015-11-19	Personal Injury	Ivan Omar	Moran Granados	1988-11-29	\N	(949) 307-3617	\N	\N	1221 W. Brook St.	\N	\N	Santa Ana	\N	92703	11-07-2015	NECK,LOWER BACK	\N	\N	0	\N	1176	612	<p>-----[Nov-19-15 03:19 PM Isabel M.]-----</p><p>Envie documentos a clinicas y cita L/O</p>	1335	793	Jesus	2015-11-24 10:00:00	2	\N	\N	<p>-----[Nov-19-15 03:19 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-19 15:19:47	2015-11-19 15:27:13	616	616	\N
10483	2015-11-23	2015-11-23	Workers Compensation	Nohemi	Aranda Garcia	1968-12-28	625-35-9527	(818) 571-2897	\N	(818) 792-1371	13560 W. Victory Blvd.	\N	\N	Van Nuys	\N	91411	05-18-2015	R / HAND,L / HAND,L / ARM,R / ARM,R / WRIST,L / WRIST,R / SHOULDER,L / SHOULDER,FINGERS,NECK,BACK	\N	\N	0	Alex's Sewing & Cutting, Inc	1176	612	<p>-----[Nov-30-15 05:07 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-30-15 09:34 AM Isabel M.]-----</p><p><p style="color: rgb(89, 126, 162); line-height: 21.4286px; background-color: rgb(236, 240, 241);"><span style="line-height: 21.4286px;">Envie correo para saber si ya tienen la cita</span></p><div><span style="line-height: 21.4286px;"><br></span></div></p><p>-----[Nov-25-15 10:11 AM Isabel M.]-----</p><p><p style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;">Reenvie documentos a clinica</p><div><br></div></p><p>-----[Nov-23-15 03:40 PM Isabel M.]-----</p><p><p>Opciones de clientes:</p><p class="MsoNormal">Van Nuys/NobleQuest @ 1.44 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Reseda/MedNation @ 5.76 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Deje mensaje</span><br></p></p>	1152	794	Prince	2015-12-01 09:15:00	3	\N	\N	<p>-----[Nov-30-15 05:07 PM Isabel M.]-----</p><p>Deje mensaje completo y texto</p>	0	\N	\N	\N	2015-11-23 15:40:29	2015-11-30 17:07:57	616	616	\N
10250	2015-11-04	2015-11-04	Workers Compensation	Ricardo	Itzep	1981-02-01	\N	(213) 361-8735	\N	\N	1312 Ingraham St #204	\N	\N	Los Angeles	\N	90017	1. 10/04/2015    2. CT: 10/05/2014 - 10/05/2015	EYES	1. nose face     2. back, head, neck, ears, nose	\N	0	Elisa Collection, Inc	1176	817	<p>-----[Nov-04-15 01:34 PM Daisy M.]-----</p><p><p>Per Jordy @ clinic:&nbsp;<span style="line-height: 1.42857;">&nbsp;<span style="text-decoration: underline; font-weight: bold;">just to&nbsp;inform you we're only going to be able to\ntreat the CT , we can treat the back and neck but for the head , ears and nose\nthat would have to be treated by a specialist&nbsp; ENT for nose and ears and\nNeurologist for head. if the attorney has doctors they work with we can make\nreferrals out to them. &nbsp;</span></span></p><p><span style="line-height: 21.4285px;">Advised Silvia @ L/O.&nbsp;</span></p><p><p class="MsoNormal"><o:p></o:p></p></p></p><p>-----[Nov-04-15 12:03 PM Daisy M.]-----</p><p>LA / MedNation&nbsp;</p>	1097	731	Yanira	2015-11-09 11:00:00	1	\N	\N	\N	1	\N	Yanira	2015-11-09	2015-11-04 12:03:22	2015-11-17 09:35:05	614	611	\N
10556	2015-11-30	2015-11-30	Workers Compensation	Jaime	Godinez	1951-08-06	\N	(951) 426-1183	\N	\N	1043 Sixth Street	\N	\N	Norco	\N	92860	CT: 11/17/2014 - 11/17/2015	R / FOOT,L / FOOT,SLEEP DISORDER,STRESS	legs (varicose veins)	\N	0	Merritt Hospitality, LLC c/o The Westin Pasadena	1169	610	\N	1119	821	Raquel	2015-12-08 11:00:00	2	\N	\N	\N	\N	\N	\N	\N	2015-11-30 15:33:48	2015-11-30 16:46:49	614	614	\N
10423	2015-11-18	2015-11-18	Workers Compensation	Arturo	Hernandez Garcia	1977-12-15	624-94-7334	(909) 367-5060	\N	(909) 243-5958	503 N. Elderberry Ave,	\N	\N	Ontario	\N	91752	CT: 03-21-2015 - 09-19-2015	R / SHOULDER,L / SHOULDER,R / ARM,L / ARM,R / FOREARM,L / FOREARM,R / ELBOW,L / ELBOW,R / WRIST,L / WRIST,R / HAND,L / HAND,FINGERS	Pits	\N	0	California Pizza Kitchen, Inc	1176	612	<p>-----[Nov-18-15 03:07 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Balian/Montclair @ 15.92 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Covina/Enhanced @ 26.88 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie cita L/O y documentos a clinica</span><br></p><p><br></p></p>	1102	746	Maria	2015-12-01 10:30:00	2	\N	\N	<p>-----[Nov-18-15 03:07 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-18 15:07:57	2015-11-18 15:07:57	616	616	\N
10310	2015-11-09	2015-11-09	Workers Compensation	Jose Carlos	Rojas	1992-01-08	618-52-5739	(805) 248-2781	\N	(805) 485-3240	1101 E. Ventura Blvd Space 160	\N	\N	Oxnard	\N	93036	CT: 10-30-2014 - 10-30-2015	LOWER BACK,R / HAND,FINGERS,L / WRIST,R / WRIST,L / ANKLE,R / KNEE,L / KNEE	Spine	\N	0	Barrett Business Services, Inc	1176	612	<p>-----[Nov-11-15 08:49 AM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-10-15 09:01 AM Isabel M.]-----</p><p>Reenviee el correo para cita</p><p>-----[Nov-09-15 11:22 AM Isabel M.]-----</p><p>El cliente prefiere su cita despues de las 12:00PM</p><p>-----[Nov-09-15 11:20 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Reseda/MedNAtion @ 40.87 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 46.76 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinicas para cita</span><br></p></p>	1115	731	Yanira	2015-11-13 15:00:00	2	\N	\N	<p>-----[Nov-11-15 08:49 AM Isabel M.]-----</p><p>Conf. con Pt.</p>	1	\N	Yanira	2015-11-13	2015-11-09 11:20:37	2015-11-17 10:28:00	616	611	\N
10353	2015-11-11	2015-11-11	Workers Compensation	Marco Stephen	Hernandez	1990-10-12	609-40-1737	(619) 796-8471	\N	\N	545 Woodlawn Avenue Apt 44	\N	\N	Chula Vista	\N	91910	CT: 01/06/2015 - 10/26/2015	BACK,LOWER BACK,CHEST,NECK	\N	\N	0	Duck Dive	1176	612	<p>-----[Nov-17-15 03:20 PM Isabel M.]-----</p><p><p>La clinica de R.B /San Ysidro no tomo el caso por la fecha de la lesion&nbsp;</p><p>Envie cita L/O y Documentos a clinica</p></p><p>-----[Nov-17-15 10:20 AM Isabel M.]-----</p><p>Reenvie documentos a clinicas</p><p>-----[Nov-16-15 02:39 PM Isabel M.]-----</p><p>Envie documentos a clinica para cita</p><p>-----[Nov-12-15 12:09 PM Daisy M.]-----</p><p>Called pt and he did not answer, LDM for pt with clinic options.&nbsp;</p><p>-----[Nov-11-15 12:21 PM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>San Ysidro / RB - 6.98 miles&nbsp;</p><p>San Diego / LH - 11.81 miles&nbsp;</p><p>Called pt and left message with clinic options, asked him to call me back.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1128	719	Jenny	2015-12-03 11:15:00	5	\N	\N	\N	\N	\N	\N	\N	2015-11-11 12:21:46	2015-11-17 15:38:37	614	611	\N
10375	2015-11-12	2015-11-12	Workers Compensation	Guadalupe	Garcia	1993-03-03	928-91-8639	(949) 613-1439	\N	(661) 438-6508	1900 Poplar Ave	\N	\N	Waso	\N	93280	CT: 07-30-2014-07-30-2015	L / SHOULDER,L / ANKLE,LOWER BACK,L / WRIST	\N	\N	0	Horizon Diversified Group, Inc	1176	612	<p>-----[Nov-13-15 03:35 PM Isabel M.]-----</p><p><p>Ellos son esposos</p><p>Envie cita L/O</p></p><p>-----[Nov-13-15 02:36 PM Isabel M.]-----</p><p>Envie documentos a clinica para cita</p><p>-----[Nov-13-15 09:14 AM Isabel M.]-----</p><p>Envie correo de no contacto&nbsp;</p><p>-----[Nov-13-15 08:59 AM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-12-15 05:24 PM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-12-15 03:07 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Bakersfield/BMG @ 35.91 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 128.12 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Deje mensajes &nbsp;en los dos telefonos</span></p><p class="MsoNormal"><span style="line-height: 1.42857;">Este cliente tiene los mismos telefonos , dirreccion, y empleador de Nancy Arreola, hable con Jesselin y dicen que estan correcto ya que son amigas y pusieron los mismos datos<br></span><br></p></p>	1159	808	Alex	2015-12-03 11:00:00	2	\N	\N	<p>-----[Nov-13-15 03:35 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-12 15:07:54	2015-11-13 15:35:54	616	616	\N
10369	2015-11-12	2015-11-12	Workers Compensation	Lizandro	Haro	1974-11-04	623-65-4810	(714) 720-1258	\N	\N	3018 Coolidge Ave #38	\N	\N	Costa Mesa	\N	92626	CT: 02/05/2013 - 10/26/2013	BACK,R / KNEE,L / KNEE		1188	0	The Prominence Hotel and Suites	1169	610	<p>-----[Nov-23-15 11:48 AM Lily E.]-----</p><p>Per Kenny @ clinic the clients second appointment was r/S for 12/18 @ 10:30 AM instead of 11/20 @ 11 AM</p><p>-----[Nov-13-15 02:08 PM Daisy M.]-----</p><p><p>Per Humberto schedule with whoever can take the case.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-12-15 12:00 PM Daisy M.]-----</p><p><p style="line-height: 21.4286px;">Case 2 of 2.&nbsp;</p><p style="line-height: 21.4286px;">Per Humberto @ L/O schedule w/ Dr. Glousman @ Southland Spine.&nbsp;</p><p style="line-height: 21.4286px;">Per Luis @ clinic:&nbsp;<span style="color: rgb(0, 51, 0); font-family: Calibri, sans-serif; font-size: 11pt; line-height: 1.42857;">unfortunately Dr. Glousman would not take the case as he does not treat as a PTP. They did mention that they can schedule appt for pt, but they would have to split it into 2 separate cases due to there being 2 employers. Pt would have to be seen on separate occasions for each employer.</span></p><p style="line-height: 21.4286px;"><span style="color: rgb(0, 51, 0); font-family: Calibri, sans-serif; font-size: 14.6667px; line-height: 20.9524px;">Emailed Humberto to advise on how to proceed.&nbsp;</span></p></p>	1072	743	Janelle	2015-12-18 10:30:00	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-12 12:00:17	2015-11-23 11:48:47	614	611	\N
10300	2015-11-06	2015-11-06	Workers Compensation	Sigfredo Armando	Monzon	1969-01-12	620-42-3288	(818) 884-4088	\N	(818) 304-1530	21205 Roscoe Blvd. Apt. 43	\N	\N	Canoga Park	\N	91304	CT: 05-05-2014 - 05-05-2015	L / ARM,L / LEG,R / LEG	\N	\N	0	SBM Onsite Services	1176	612	<p>-----[Nov-06-15 05:07 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-06-15 03:08 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Reseda/MedNation @ 6.55 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 16.36 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinicas para cita</span><br></p></p>	1115	731	Yanira	2015-11-13 14:00:00	2	\N	\N	<p>-----[Nov-09-15 08:52 AM Isabel M.]-----</p><p>Conf. con Pt.</p><p>-----[Nov-06-15 05:07 PM Isabel M.]-----</p><p>El cliente quiere texto</p>	1	\N	Yanira	2015-11-13	2015-11-06 15:08:34	2015-11-17 09:35:38	616	611	\N
10481	2015-11-23	2015-11-23	Workers Compensation	Elpidio	Gutierrez	1951-06-15	\N	(310) 749-0633	\N	\N	14520  St. Andrews Place	\N	\N	Gardena	\N	90249	CT: 11-01-2010 - 10-01-2012	WAIST,R / ARM	\N	\N	0	A  Gutierrez Roofing	1176	612	<p>-----[Nov-23-15 02:21 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">Pico Rivera/Gutierrez @ 18.39\nmiles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">LA/MedNation @ 13.72 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica y cita L/O</span><br></p></p>	1097	731	Yanira	2015-11-30 10:00:00	2	\N	\N	<p>-----[Nov-23-15 02:21 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-23 14:21:23	2015-11-23 14:21:23	616	616	\N
10351	2015-11-11	2015-11-11	Workers Compensation	Juan	Barajas	1962-03-09	606-09-7219	(661) 845-2785	\N	\N	8708 School St.	\N	\N	Lamont	\N	93241	01-26-2015	BACK,HERNIA	\N	\N	0	Vallarta Supermarkets	1176	612	<p>-----[Nov-11-15 03:24 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-11-15 01:44 PM Isabel M.]-----</p><p>Envie documentos a clinica para cita</p><p>-----[Nov-11-15 12:03 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Bakersfield/BMG @ 12.88 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 88.61 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">No estaba deje mensaje con su esposa Ruth</span><br></p></p>	1159	808	Alex	2015-11-19 12:30:00	2	\N	\N	<p>-----[Nov-11-15 03:24 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	1	2015-12-21 14:30:00	Alex	2015-11-19	2015-11-11 12:03:52	2015-11-24 14:59:10	616	611	\N
10485	2015-11-23	2015-11-23	Workers Compensation	Manuel	Nieto	1981-01-20	605-04-0393	(323) 572-0234	\N	\N	8925 S. Broadway	\N	Apt D.	Los Angeles	\N	90003	CT: 10/09/2014-10/09/2015	L / FOOT,SPINE,R / HIP,L / HIP	Nose	\N	0	Strategic Outsourcing Inc.	1169	610	\N	1097	731	Jordy	2015-12-03 14:30:00	2	\N	\N	\N	\N	\N	\N	\N	2015-11-23 17:02:46	2015-11-30 17:05:36	611	611	\N
10409	2015-11-17	2015-11-17	Workers Compensation	Cirilo	Perulero Molina	1959-02-09	615-27-7531	(619) 366-3437	\N	\N	2628 Commercial Ave.	\N	\N	San Diego	\N	92113	CT: 11-11-2014 - 11-13-2015	L / FOOT,R / FOOT,WAIST	\N	\N	0	Marriot Hotel Services	1176	612	<p>-----[Nov-17-15 03:00 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">SD/LH @ 4.90 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">RB/Mission Valley @ 8.20 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie cita L/O y documentos a clinica</span><br></p></p>	1128	719	Jenny	2015-12-03 10:30:00	2	\N	\N	<p>-----[Nov-17-15 03:00 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-17 15:00:17	2015-11-17 15:00:17	616	616	\N
10410	2015-11-17	2015-11-17	Workers Compensation	Roman	Mendez Vital	1977-08-09	618-38-2104	(805) 793-8428	\N	\N	308 N. Hayes Ave	\N	\N	Oxanard	\N	93030	CT: 05-10-2014 - 11-09-2015	NECK,SPINE,LOWER BACK,L / KNEE,R / KNEE,STRESS	Anxiety	\N	0	Owner / Management	1176	612	<p>-----[Nov-17-15 03:42 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Reseda/MedNation @ 41.80 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/Noble Quest @ 47.69 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">El cliente dice que esta muy lejos, envie correo L/O</span><br></p></p>	1326	\N	\N	\N	\N	48	2015-11-17 15:40:00	\N	0	\N	\N	\N	2015-11-17 15:42:33	2015-11-17 15:42:33	616	616	\N
10336	2015-11-10	2015-11-10	Workers Compensation	Osvaldo Daniel	Ruiz	1981-02-19	282-55-1773	(909) 224-4812	\N	(909) 214-5410	637 Greenhorn Drive	\N	\N	Diamond Bar	\N	91765	CT: 06-03-2014- 06-03-2015	L / SHOULDER,LOWER BACK,BACK,R / HIP,L / HIP	\N	1248	0	AEP Industries, Inc	1176	612	<p>-----[Nov-20-15 03:08 PM Isabel M.]-----</p><p>Envie cita nueva L/O</p><p>-----[Nov-20-15 02:55 PM Lily E.]-----</p><p>Per Lidia @ clinic the client rescheduled his appointment due to court. R/S for 11/25 @ 9:00 AM &nbsp;instead of 11/18 @ 9:00 AM.</p><p>-----[Nov-12-15 04:04 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-12-15 10:14 AM Isabel M.]-----</p><p>Hable con Linda sobre la cita y dice que esta esperando el horario del Dr. y que cuando lo tenga, que espera que sea hoy , enviara la cita</p><p>-----[Nov-11-15 04:05 PM Isabel M.]-----</p><p>Reenvie correo a clinica</p><p>-----[Nov-10-15 04:00 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">West Covina/Multi-Care @ 15.12\nmiles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Whittier/Ford @ 16.35 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica para cita</span><br></p></p>	1334	823	Linda	2015-11-25 09:00:00	2	\N	\N	<p>-----[Nov-12-15 04:07 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	\N	\N	\N	\N	2015-11-10 16:00:36	2015-11-20 15:08:41	616	616	\N
10506	2015-11-25	2015-11-25	Workers Compensation	Francisco	Valadez Valdivia	1971-05-18	\N	(760) 755-4769	\N	\N	P.O Box 30403	\N	\N	Escondido	\N	92030	CT: 11-12-2014 - 11-22-2015	LOWER BACK,R / LEG,L / LEG,R / KNEE,L / KNEE,R / SHOULDER,L / SHOULDER	\N	\N	0	Jaime's Grove Service Inc	1176	612	<p>-----[Nov-30-15 09:04 AM Isabel M.]-----</p><p><span style="line-height: 21.4286px;">Envie correo para saber si ya tienen la cita</span></p><p>-----[Nov-25-15 10:27 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">Rancho Bernardo/RB @ 11.02 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Murrieta/Gogatz @ 33.86 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica</span><br></p></p>	1161	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2015-11-25 10:27:18	2015-11-30 09:04:45	616	616	\N
10330	2015-11-10	2015-11-10	Workers Compensation	Rogaciano	Castro	1965-10-26	\N	(661) 381-3257	\N	(661) 910-8492	700 S. Shafter Ave. Space 52	\N	\N	Shafter	\N	93263	CT: 06-23-2013 - 06-26-2014	R / HAND,L / HAND,LOWER BACK	Lungs	\N	0	Green Tree Contracting	1176	612	<p>-----[Nov-18-15 04:09 PM Lily E.]-----</p><p>Per Alex @ clinic the client R/S from 11/12 @ 2:00 PM to 11/19 @ 1:15 PM</p><p>-----[Nov-10-15 04:32 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-10-15 02:41 PM Isabel M.]-----</p><p>Envie comumentos a clinica para cita</p><p>-----[Nov-10-15 02:37 PM Isabel M.]-----</p><p><p>No contesta</p><p><br></p></p><p>-----[Nov-10-15 01:36 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Bakersfield/BMG @ 2.79 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 112.59 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Deje mensaje con su esposa Guillermina&nbsp;</span><br></p></p>	1159	808	Alex	2015-11-19 13:15:00	2	\N	\N	<p>-----[Nov-10-15 04:32 PM Isabel M.]-----</p><p>&nbsp;Conf. con Pt.</p>	1	2015-12-21 13:45:00	Alex	2015-11-19	2015-11-10 13:36:27	2015-11-24 15:21:56	616	611	\N
10387	2015-11-13	2015-11-13	Workers Compensation	Leonardo L.	Ponce	1980-04-11	607-37-1327	(760) 272-2093	\N	\N	6356 Middleton Street Apt F	\N	\N	Huntington Park	\N	90255	1. 05/21/2015    5.05/26/2015	SPINE	2. spine, left upper ext, left lower ext	\N	0	Rugzy LLC / Gabriel Nalbadian Sole MBR	1169	610	<p>-----[Nov-23-15 09:44 AM Lily E.]-----</p><p>Per Humberto @ L/O cancel the request with Dr. Aun and requested for the client to be scheduled with Industrial/LA.</p><p>-----[Nov-18-15 12:16 PM Lily E.]-----</p><p>Per Blanca @ clinic Client R/S appt for 11/24 @ 12PM instead of 11/17 @ 11 AM.</p><p>-----[Nov-13-15 11:32 AM Daisy M.]-----</p><p><p>Downey / SoCal Chiros - 7.4 miles&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1148	721	Carmen	2015-11-24 11:30:00	1	\N	\N	\N	\N	\N	\N	\N	2015-11-13 11:32:47	2015-11-23 09:44:43	614	611	\N
10361	2015-11-11	2015-11-11	Workers Compensation	Rosa	Aguilera	1975-04-13	\N	(818) 356-6150	\N	\N	14041 Sayre St.	\N	\N	Sylmar	\N	91342	CT: 10-06-2014 -09-24-2015	R / SHOULDER,R / HAND,L / HAND,NECK	\N	\N	0	Natroll, LLC	1176	612	<p>-----[Nov-12-15 10:27 AM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-11-15 05:05 PM Isabel M.]-----</p><p><p>Opciones de clinica:</p><p class="MsoNormal">Van Nuys/NobleQuest @ 13.70 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Reseda/MedNation @ 14.74 miles</p><p class="MsoNormal"><o:p><br></o:p></p><p class="MsoNormal"><o:p>Envie documentos a clinica</o:p></p></p>	1152	797	Henry	2015-11-18 09:00:00	2	\N	\N	<p>-----[Nov-12-15 10:27 AM Isabel M.]-----</p><p>Conf. con Pt</p>	1	\N	Nikko	2015-11-18	2015-11-11 17:05:59	2015-11-23 11:37:19	616	611	\N
10301	2015-11-06	2015-11-06	Workers Compensation	Sigfredo Armando	Monzon	1969-01-12	620-42-3288	(818) 884-4088	\N	(818) 304-1530	21205 Roscoe Blvd. Apt. 43	\N	\N	Canoga Park	\N	91304	10-15-2015	R / ARM	\N	\N	0	CCS Los Angeles Janitorial, Inc	1176	612	<p>-----[Nov-06-15 05:16 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-06-15 03:14 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Reseda/MedNation @ 6.55 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 16.36 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica</span><br></p></p>	1115	731	Yanira	2015-11-20 14:00:00	2	\N	\N	<p>-----[Nov-09-15 08:51 AM Isabel M.]-----</p><p>Conf. con pt.</p>	1	\N	Yanira	2015-11-20	2015-11-06 15:14:28	2015-11-23 12:15:31	616	611	\N
10456	2015-11-20	2015-11-20	Workers Compensation	Jose Angel	Okon Hernandez	1967-09-11		(323) 801-9239	\N	\N	5126 W. Washington Blvd. Apt. 107	\N	\N	Los Angeles	\N	90016	CT: 10-01-2014 - 04-01-2015	WAIST,L / LEG,L / THIGH	L. heel	\N	0	RM Dalton Builders, Inc	1176	612	<p>-----[Nov-20-15 03:58 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">LA/MedNation @ 4.87 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Daher/Glendale @ 15.62 miles<o:p></o:p></p><p><span style="line-height: 1.42857;">Envie documentos a clinica</span><br></p></p>	1097	731	Yanira	2015-11-30 11:00:00	2	\N	\N	<p>-----[Nov-24-15 04:51 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-20 15:58:37	2015-11-24 16:51:18	616	616	\N
10507	2015-11-25	2015-11-25	Workers Compensation	Joaquin	Dominguez Herera	1976-10-26	810-05-1103	(323) 470-2808	\N	\N	7930 S. Main St.	\N	\N	Los Angeles	\N	90003	CT: 11-17-2014 - 11-17-2015	NECK,R / SHOULDER,L / SHOULDER	\N	\N	0	AZ- CFS WEST , INC	1176	612	<p>-----[Nov-25-15 10:36 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">Industrial/LA @ 7.88 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">MedNation/LA @ 9.67 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">El telefono esta malo, no corresponde a la persona</span><br></p></p>	1326	\N	\N	\N	\N	66	2015-11-25 10:35:00	\N	0	\N	\N	\N	2015-11-25 10:36:52	2015-11-25 10:36:52	616	616	\N
10549	2015-11-30	2015-11-30	Workers Compensation	Yesenia	Estrada	1981-02-10	\N	(909) 252-1713	\N	\N	4850 Bandera St. Apt. I	\N	\N	Montclair	\N	91763	CT: 09-01-2014 - 09-01-2015	R / HAND,L / HAND,R / KNEE,L / KNEE,BACK	\N	\N	0	Los Osos Carwash	1176	817	<p>-----[Nov-30-15 02:16 PM Isabel M.]-----</p><p>Envie cita L/O y documentos a clinica</p>	1102	746	Maria	2015-12-21 15:00:00	1	\N	\N	\N	0	\N	\N	\N	2015-11-30 14:16:29	2015-11-30 14:16:29	616	616	\N
10425	2015-11-18	2015-11-18	Workers Compensation	Hermenegilda	Heredia	1965-04-13	\N	(323) 809-8066	\N	\N	317 N. Pasadena Ave.	\N	\N	Azusa	\N	90702	CT: 05-30-2014 - 05-30-2015	BACK,L / SHOULDER,R / HIP,R / ANKLE,R / LEG,R / KNEE,R / FOOT	R. Groin, coccyx, L. shoulder blade, R. heel, R. toes	\N	0	Quality Business Solutions , Inc	1176	612	<p>-----[Nov-18-15 04:44 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Multi-Care/West Covina @ 6.81\nmiles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">El Monte/Greenfield @ 9.44 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie cita L/O y documentos a clinica</span><br></p></p>	1074	774	Maggie	2015-12-07 15:00:00	5	\N	\N	<p>-----[Nov-18-15 04:44 PM Isabel M.]-----</p><p>La cliente quiere texto</p>	0	\N	\N	\N	2015-11-18 16:44:47	2015-11-18 16:44:47	616	616	\N
10213	2015-11-02	2015-11-02	Workers Compensation	Carlos Fernando	Tafolla	1991-03-07	\N	(661) 699-8059	\N	\N	1922 Wingstone Dr.	\N	\N	Bakersfield	\N	93307	CT: 07-13-2014 -07-13-2015	BACK,R / SHOULDER,L / SHOULDER	\N	\N	0	Sturgeon And Son Grading and Paving, Inc	1176	612	<p>-----[Nov-18-15 04:49 PM Lily E.]-----</p><p>Per Alex @ clinic the client was a no show to his initial appointment. Emailed L/O on how to proceed.&nbsp;</p><p>-----[Nov-02-15 04:56 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-02-15 12:52 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">Bakersfield/BMG @ 9.79 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">NobleQuest/Van Nuys @ 94.02 miles</p><p class="MsoNormal"><o:p></o:p></p><p>Envie documentos a clinica</p><p><br></p></p>	1159	808	Ana	2015-11-12 13:00:00	\N	45	\N	<p>-----[Nov-02-15 04:56 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	\N	\N	\N	\N	2015-11-02 12:52:19	2015-11-18 16:49:30	616	611	\N
10460	2015-11-20	2015-11-20	Workers Compensation	Karen	Sotelo Corrales	1991-08-05	\N	(949) 842-1088	\N	\N	26585 Calle Santa Barbara	\N	\N	San Juan Capistrano	\N	92675	CT: 06/01/2014-11/06/2015	SPINE,R / HIP,L / HIP,R / SHOULDER,R / ARM,NECK,R / FOOT,L / FOOT	\N	\N	0	Parker School Uniforms LLC	1169	610	\N	1335	722	Jesus	2015-11-24 15:00:00	3	\N	\N	\N	\N	\N	\N	\N	2015-11-20 16:48:38	2015-11-24 09:15:27	611	611	\N
10448	2015-11-19	2015-11-19	Workers Compensation	Joe	Estrada Sr.	1968-07-16	626-14-9161	(760) 218-1639	\N	\N	17551 Mountain View Rd.  Space 63	\N	\N	Dessert Hot Springs	\N	92240	06-09-2015	NECK,STRESS,R / WRIST,L / WRIST,L / LEG	Heals	\N	0	Mike Thompson Recreational Vehicles Detailer	1176	612	<p>-----[Nov-24-15 12:11 PM Isabel M.]-----</p><p>Envie correo L/O informandole que el cliente si llego a la clinica pero que no esta deacuedo a su fecha de lesion</p><p>-----[Nov-23-15 01:59 PM Lily E.]-----</p><p><span style="line-height: 21.4286px;">Per Maribel @ clinic the client showed but did not agree with DOI and said he would speak to his atty regarding this matter. Informed Isabel</span></p><p>-----[Nov-20-15 10:24 AM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-19-15 05:41 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p>Industrial /S.B @ 51.25 &nbsp;Millas</p><p>S.Spine /Riversde @ 54.69 Millas</p><p>Envie documentos a clinica</p></p>	1326	794	Marisol	2015-11-21 11:30:00	\N	55	2015-11-24 12:10:00	\N	0	\N	\N	\N	2015-11-19 17:41:40	2015-11-24 12:11:05	616	616	\N
10515	2015-11-25	2015-11-25	Workers Compensation	Jose Alfredo	De Paz Valladares	1984-05-31	\N	(323) 906-5623	\N	\N	124 Caldwell St.	\N	\N	Compton	\N	90220	07-06-2015	LOWER BACK,EYES	\N	\N	0	Field Fresh Foods , Inc	1176	612	<p>-----[Nov-25-15 12:34 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Downey/Aun @ 10.33 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Pico Rivera/Gutierrez @ 15.38\nmiles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica y cita L/O</span><br></p><p><br></p></p>	1073	743	Lorena	2015-12-08 16:00:00	2	\N	\N	<p>-----[Nov-25-15 12:34 PM Isabel M.]-----</p><p>Conf. y quiere texto</p>	0	\N	\N	\N	2015-11-25 12:34:20	2015-11-25 12:34:20	616	616	\N
10217	2015-11-02	2015-11-02	Workers Compensation	Angel	Garcia Vasquez	1973-06-15	\N	(951) 333-1920	\N	\N	7911 Arlington Ave Apt 217	\N	\N	Riverside	\N	92503	1. 08/21/2015     2. CT: 08/24/2013 - 08/24/2015	R / HIP,L / HIP	1. spine    2. spine, legs	1221	1	Auto Styles Inc	1169	610	<p>-----[Nov-24-15 03:30 PM Lily E.]-----</p><p>Humberto @ L/O emailed advising to find another PTP on the MPN for this client as Dr. Pratley would no longer treating the client. Advised him the only other doctor we have on the MPN is Dr. Balian @ 28.84 miles and he advised to CX request.&nbsp;</p><p>-----[Nov-02-15 04:26 PM Daisy M.]-----</p><p><p>Per Humberto schedule appt.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-02-15 04:05 PM Daisy M.]-----</p><p><p>Advised Humberto @ L/O that we have Dr. Pratley in Riverside within the MPN @ 3.1 miles.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1119	722	Raquel	2015-11-05 13:15:00	1	\N	\N	\N	1	\N	Lorena	2015-11-05	2015-11-02 15:57:40	2015-11-24 15:30:25	614	611	\N
10473	2015-11-20	2015-11-20	Workers Compensation	Aurora	Mendez	1996-08-13	\N	(909) 443-0610	\N	\N	831 Orchid Ct	\N	Apt K	Upland	\N	91786	CT: 04/01/2015-11/15/2015	STRESS,BACK	\N	\N	0	Casa Healthcare Inc.	1176	817	\N	1102	746	Maria	2015-12-01 10:30:00	1	\N	\N	\N	0	\N	\N	\N	2015-11-23 09:58:49	2015-11-23 09:58:49	611	611	\N
10365	2015-11-12	2015-11-12	Workers Compensation	Lizandro	Haro	1974-11-04	623-65-4810	(714) 720-1258	\N	\N	3018 Coolidge Ave	\N	#39	Costa Mesa	\N	92626	1. CT: 04/01/2013-11/22/2013 2. 10/01/2013	R / HIP,L / HIP,SPINE,L / LEG,R / LEG,L / ANKLE,R / ANKLE,R / FOOT,L / FOOT,L / HAND,R / HAND,FINGERS,R / SHOULDER,L / SHOULDER,NECK,L / ELBOW,SLEEP DISORDER	2. LEFT KNEE	1258	0	AP HERITAGE/BEST WESTERN	1169	610	<p>-----[Nov-13-15 02:08 PM Daisy M.]-----</p><p>Per Humberto schedule with whoever can take the case.&nbsp;</p><p>-----[Nov-12-15 11:58 AM Daisy M.]-----</p><p><p>Case 1 of 2.&nbsp;</p><p>Per Humberto @ L/O schedule w/ Dr. Glousman @ Southland Spine.&nbsp;</p><p>Per Luis @ clinic:&nbsp;<span style="color: rgb(0, 51, 0); font-family: Calibri, sans-serif; font-size: 11pt; line-height: 1.42857;">unfortunately\nDr. Glousman would not take the case as he does not treat as a PTP. They did\nmention that they can schedule appt for pt, but they would have to split it\ninto 2 separate cases due to there being 2 employers. Pt would have to be seen\non separate occasions for each employer. </span></p><p><span style="color: rgb(0, 51, 0); font-family: Calibri, sans-serif; font-size: 14.6667px; line-height: 20.9524px;">Emailed Humberto to advise on how to proceed.&nbsp;</span></p></p>	1072	743	Janelle	2015-11-18 10:30:00	\N	\N	\N	\N	1	\N	Kenny	2015-11-18	2015-11-12 11:19:42	2015-11-23 11:43:02	614	611	\N
10366	2015-11-12	2015-11-12	Workers Compensation	Enrique	Ahilon	1973-11-02	838-52-5282	(510) 485-4859	\N	\N	1264 East Vernon Ave	\N	\N	Los Angeles	\N	90011	CT: 07/28/2014 - 07/28/2015	R / HAND,L / HAND	both soles, abdomen	\N	0	Spice Kitchen	1176	612	<p>-----[Nov-23-15 12:20 PM Lily E.]-----</p><p>Previous Appt was on 11/16 @ 11:00 AM.</p><p>-----[Nov-23-15 12:18 PM Lily E.]-----</p><p>Per Yanira @ Clinic this client rescheduled his appointment for 11/23 @ 10 AM</p><p>-----[Nov-12-15 11:34 AM Daisy M.]-----</p><p>Per Vanessa schedule @ Industrial / LA, due to body parts they wont take it. Sent to LA / MedNation @ 6.9 miles.&nbsp;</p>	1097	731	Yanira	2015-11-23 10:00:00	2	\N	\N	\N	\N	\N	\N	\N	2015-11-12 11:34:03	2015-11-23 12:20:52	614	611	\N
10466	2015-11-20	2015-11-20	Workers Compensation	Jesus	Rios	1969-03-19	619-85-6392	(562) 234-9978	\N	\N	806 E. 115th Street	\N	\N	Los Angeles	\N	90059	CT: 08/01/2013-11/06/2015	SPINE	buttocks, throat, left hand finger	\N	0	VIP Garment Care, Inc	1169	610	\N	1097	731	Yanira	2015-12-03 18:00:00	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-20 17:29:06	2015-11-24 17:19:52	611	611	\N
10429	2015-11-18	2015-11-18	Workers Compensation	Alberto	Torres Ayala	1957-07-08	611-12-1654	(760) 404-8084	\N	\N	P.O Box 1555	\N	\N	Mecca	\N	92254	CT: 11-12-2014 - 11-12-2015	LOWER BACK,R / SHOULDER,L / SHOULDER,R / ARM,L / ARM,R / HAND,L / HAND,FINGERS,R / LEG,L / FOOT,R / FOOT,NECK,HEAD,STRESS,L / LEG	\N	\N	0	Indian Palms Country Club	1176	612	<p>-----[Nov-18-15 05:18 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Montgomery/SB @ 92.87 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Keystone/Riverside @ 99.88 miles</p><p class="MsoNormal"><o:p></o:p></p><p>El cliente dice le queda muy lejos, envie correo L/O</p></p>	1326	\N	\N	\N	\N	48	2015-11-18 17:20:00	\N	0	\N	\N	\N	2015-11-18 17:18:59	2015-11-18 17:23:03	616	616	\N
10452	2015-11-20	2015-11-20	Workers Compensation	Hilario	Zavaleta Gomez	1958-01-14	\N	(909) 657-3716	\N	\N	284 N. Glenwood St.	\N	\N	Colton	\N	92324	CT: 03-15-2014 - 03-15-2015	HEAD,R / ARM,R / ELBOW,R / LEG,L / KNEE,R / KNEE,ABDOMEN		\N	0	Kann Enterprises , Inc	1176	612	<p>-----[Nov-23-15 03:56 PM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-20-15 01:50 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Montgomery/SB @ 2.95 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Fontana/LH @ 10.91 miles</p><p class="MsoNormal">Deje mensaje</p><p class="MsoNormal"><o:p></o:p></p></p>	1146	794	Maribel	2015-12-05 10:00:00	2	\N	\N	<p>-----[Nov-24-15 09:43 AM Isabel M.]-----</p><p>Conf. y el cliente quiere texto</p>	0	\N	\N	\N	2015-11-20 13:50:52	2015-11-25 11:08:34	616	616	\N
10234	2015-11-03	2015-11-03	Workers Compensation	Jose	Gonzalez	1948-01-10	\N	(323) 921-2083	\N	\N	990 E. 33rd St.	\N	\N	Los Angeles	\N	90011	03-10-2015	HEAD,R / ELBOW,L / ELBOW,L / ARM,R / ARM,BACK,L / LEG,R / LEG	\N	\N	0	Santee Collection, LLC	1176	612	<p>-----[Nov-13-15 10:47 AM Isabel M.]-----</p><p>JESSELIN LLAMO QUE QUERIA VERIFICAR SI EL CLIENTE ASISTIO A LA CITA QUE TENIA EL DIA 11-12-2015 @ 4:00PM, HABLE A LA CLINICA Y DICEN QUE EL CLIENTE LLEGO PERO NO VIO AL DOCTOR Y CAMBIO LA CITA PARA EL 11-16-2015 @ 1:00PM</p><p>-----[Nov-06-15 03:47 PM Isabel M.]-----</p><p>Carmen de Industrial L.A &nbsp;llamo que no van a tomar el caso, porque al cliente ya lo estan tratando con otro caso, envie documentos a MedNation para cita</p><p>-----[Nov-03-15 11:42 AM Isabel M.]-----</p><p>Envie &nbsp;cita L/O</p><p>-----[Nov-03-15 11:34 AM Isabel M.]-----</p><p><p>Opciones de &nbsp;clinicas:</p><p>Industrial / L.A @ 4.80 Miles</p><p>MedNation /L.A @ 6.67 Miles</p></p>	1097	731	Yanira	2015-11-16 13:00:00	2	\N	\N	<p>-----[Nov-09-15 09:49 AM Isabel M.]-----</p><p>El cliente quiere que le llame como &nbsp;a las 12: 00PM para recibir la cita</p><p>-----[Nov-03-15 11:34 AM Isabel M.]-----</p><p>Conf. con Pt</p>	1	\N	11-12-2015	2015-11-16	2015-11-03 11:34:27	2015-11-23 12:23:06	616	611	\N
10467	2015-11-20	2015-11-20	Workers Compensation	Liana Isabel Celestina	Coxaj Reynoso	1990-07-18	\N	(323) 456-2667	\N	\N	307 E. 76th Place	\N	\N	Los Angeles	\N	90003	CT: 08-01-2011 - 08-01-2014	NECK,SPINE,LOWER BACK,R / SHOULDER,L / SHOULDER,R / ARM,L / ARM,R / WRIST,L / WRIST,R / HAND,L / HAND,FINGERS,L / LEG,R / LEG,R / KNEE,L / KNEE	Soles	\N	0	Spring Line Fashion, Inc	1176	612	<p>-----[Nov-20-15 05:32 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">LA/MedNAtion @ 9.67 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Pico Rivera/Gutierrez @ 17.35\nmiles</p><p class="MsoNormal">Envie cita L/O y documentos a clinica</p><p class="MsoNormal"><o:p></o:p></p></p>	1097	731	Yanira	2015-11-30 13:00:00	2	\N	\N	<p>-----[Nov-23-15 01:58 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-20 17:32:16	2015-11-23 13:58:55	616	616	\N
10516	2015-11-25	2015-11-25	Workers Compensation	Hortencia	Garcia	1956-12-27	615-01-9580	(424) 264-7271	\N	\N	405 S. Centre Street	\N	Apt B-34	San Pedro	\N	90731	CT: 11/22/2014-11/22/2015	R / ELBOW,R / SHOULDER,R / ARM,R / WRIST,NECK,R / HIP,L / HIP,SPINE	\N	\N	0	Ridgill Johnson Properties Inc. DBA Avalon	1169	610	\N	1073	743	Marisol	2015-12-01 16:00:00	\N	\N	\N	\N	0	\N	\N	\N	2015-11-25 14:26:25	2015-11-25 14:26:25	611	611	\N
10408	2015-11-17	2015-11-17	Workers Compensation	Jorge L.	Najera	1957-05-18	612-08-5107	(310) 272-0682	\N	\N	8613  1/2 Olin St.	\N	\N	Los Angeles	\N	90034	06-13-2015	LOWER BACK	Upper leg	\N	0	Valet Parking Service	1176	817	<p>-----[Nov-23-15 08:30 AM Isabel M.]-----</p><p>Envie correo de cancelacion ya que no tengo respuesta de L/O</p><p>-----[Nov-19-15 11:37 AM Isabel M.]-----</p><p>Le reenvie correo L/O</p><p>-----[Nov-17-15 02:48 PM Isabel M.]-----</p><p>La clinica de Whittier /Dr. Ford le queda a 27.97 Millas , envie correo L/O, para saber si el cliente quiere que le programemos</p>	1326	\N	\N	\N	\N	55	2015-11-23 08:30:00	\N	0	\N	\N	\N	2015-11-17 14:48:01	2015-11-23 08:30:11	616	616	\N
10356	2015-11-11	2015-11-11	Workers Compensation	Jose Antonio	Murillo	1958-04-28	623-22-2869	(909) 721-4324	\N	\N	9121 Olive Street	\N	\N	Fontana	\N	92335	CT: 11/08/2013 - 11/08/2015	HERNIA,BACK,R / KNEE,L / KNEE	\N	\N	0	Mission Dispatch Truck Brolerage Inc	1176	817	<p>-----[Nov-23-15 02:01 PM Lily E.]-----</p><p>Per Maribel @ clinic the client was a no show. Emailed L/O</p><p>-----[Nov-11-15 02:28 PM Daisy M.]-----</p><p><p>SB / Industrial - 11.1 miles&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1326	794	Maribel	2015-11-21 10:00:00	\N	73	\N	\N	0	\N	\N	\N	2015-11-11 14:28:33	2015-11-23 14:01:09	614	611	\N
10474	2015-11-20	2015-11-20	Workers Compensation	Daniel	Rodriguez	1995-02-20	035-90-1995	(951) 547-9872	\N	\N	316 S. Merril Street	\N	\N	Corona	\N	92882	CT: 05/06/2015-11/06/2015	NECK,BACK,EYES	\N	\N	0	Varsity Contractors Inc.	1176	817	\N	1119	722	Jesus	2015-11-25 14:00:00	1	\N	\N	\N	\N	\N	\N	\N	2015-11-23 10:01:13	2015-11-23 10:01:29	611	611	\N
10363	2015-11-09	2015-11-09	Workers Compensation	Basilio	Martinez	1952-04-15	\N	(562) 276-5099	\N	\N	11138 Pope Avenue	\N	\N	Lynwood	\N	90262	1. 06/05/2015    2. CT: 10/15/2014 - 10/12/2015	EYES	1. left eye     2. right shoulder, right arm, back	\N	0	The First Finish	1176	612	<p>-----[Nov-12-15 09:50 AM Daisy M.]-----</p><p>Per pt schedule in Downey, he requested we send him out an appt letter.&nbsp;</p><p>-----[Nov-12-15 08:52 AM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>Pico Rivera / Gutierrez - 7.77 miles&nbsp;</p><p>Downey / Aun - 5.20 miles&nbsp;</p><p>Advised L/O that I've tried calling pt, but his phone goes straight to voicemail.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1073	743	Adriana	2015-11-19 09:15:00	2	\N	\N	\N	1	\N	Kenny	2015-11-19	2015-11-12 08:52:48	2015-11-23 11:44:19	614	611	\N
10527	2015-11-25	2015-11-25	Workers Compensation	Victor	Villareal	1963-10-20	625-07-8431	(714) 614-4164	\N	\N	4208 Oldcastle Ave.	\N	\N	Bakersfield	\N	93313	CT: 10-22-2015 _ 11-21-2015	HEAD,LOWER BACK,L / KNEE,R / KNEE,R / ARM,L / ARM	\N	\N	0	Ralph's Grocery Company	1176	612	<p>-----[Nov-25-15 05:00 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Bakersfield/BMG @ 19.82 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 88.81 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie cita L/O y documentos a clinica</span><br></p></p>	1159	808	Alex	2015-12-10 11:00:00	2	\N	\N	<p>-----[Nov-25-15 05:00 PM Isabel M.]-----</p><p>Conf. Pt. y quiere texto</p>	0	\N	\N	\N	2015-11-25 17:00:06	2015-11-25 17:06:31	616	616	\N
10431	2015-11-18	2015-11-18	Workers Compensation	Maria Hilda	Palacios	1971-03-10	442-87-9049	(619) 806-5551	\N	\N	4316 Delta St. Apt. 8	\N	\N	San Diego	\N	92113	CT: 08-01-2014 - 02-01-2015	R / KNEE,L / KNEE,STRESS,BACK	R. middle finger, anxiety	\N	0	Streme Team Apparel , Inc	1176	612	<p>-----[Nov-19-15 08:47 AM Isabel M.]-----</p><p>Envie correo L/O</p><p>-----[Nov-18-15 05:35 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">SD/LH @ 4.90 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">San Ysidro/RB @ 12.98 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">La cliente no quiere el caso</span><br></p></p>	1326	\N	\N	\N	\N	49	2015-11-18 17:35:00	\N	0	\N	\N	\N	2015-11-18 17:35:26	2015-11-19 08:47:06	616	616	\N
10479	2015-11-04	2015-11-04	Workers Compensation	Ernesto	Aragon	1989-12-02	\N	(619) 430-6637	\N	\N	3753 Newton Ave	\N	\N	San Diego	\N	92113	CT: 02/17/2015-08/03/2015	R / ANKLE,R / FOOT,L / HAND,R / HAND,FINGERS,BACK,LOWER BACK	\N	\N	0	JW Stratton Specialty Coatings	1176	612	<p>-----[Nov-24-15 08:41 AM Lily E.]-----</p><p>Per Glamis @ clinic the client was a no show on 11/11 &amp; is R/S for 11/25 @9:30 am.<br></p>	1129	718	Rebecca	2015-11-25 09:30:00	3	\N	\N	\N	\N	\N	\N	\N	2015-11-23 13:52:06	2015-11-24 08:41:34	611	611	\N
10432	2015-11-19	2015-11-19	Workers Compensation	Juan	Torres Cervantes	1964-06-26	608-18-4227	(909) 578-8793	\N	\N	130 Malcom  Ave.	\N	\N	Ontario	\N	91761	CT: 09-01-2012 - 09-01-2014	R / KNEE,R / THIGH,L / HAND,L / WRIST,L / FOREARM	R. pinky	\N	0	RJ Mitchell Construccion	1176	612	<p>-----[Nov-19-15 08:55 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Enhanced Precision/Covina @ 21.50\nmiles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Southland Spine/Riverside @ 13.93\nmiles</p><p class="MsoNormal"><o:p><br></o:p></p><p class="MsoNormal"><o:p>Cita para historial 11-25-2015 @ 5:00PM por telefono</o:p></p><p class="MsoNormal"><o:p>Envie documentos a clinica y cita L/O</o:p></p></p>	1121	747	Bianca	2015-11-30 14:30:00	2	\N	\N	<p>-----[Nov-19-15 08:55 AM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-19 08:55:11	2015-11-19 08:55:11	616	616	\N
10441	2015-11-19	2015-11-19	Workers Compensation	Cesar	Ugalde Arias	1969-08-17	569-79-9776	(626) 617-4311	\N	(626) 367-0750	4814 Montaro Ct.	\N	Apt A	Bskersfield	\N	93307	CT: 08/20/2014-02/20/2015	LOWER BACK,L / SHOULDER,L / KNEE,R / KNEE	\N	\N	0	Esparza Enterprises, Inc	1176	612	<p>-----[Nov-20-15 03:04 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-19-15 05:31 PM Isabel M.]-----</p><p>Envie documentos a clinica</p><p>-----[Nov-19-15 04:38 PM Isabel M.]-----</p><p>Deje mensaje a los dos telefonos</p><p>-----[Nov-19-15 03:23 PM Lily E.]-----</p><p><p>Clinic Options:</p><p>Bakersfield/BMG @ 9.79 miles</p><p>Van Nuys/NobleQuest @ 94.02 miles</p></p>	1159	808	Alex	2015-12-03 13:00:00	2	\N	\N	<p>-----[Nov-25-15 11:25 AM Isabel M.]-----</p><p>Conf. con Pt.</p><p>-----[Nov-24-15 08:28 AM Isabel M.]-----</p><p>Deje mensaje completo</p>	\N	\N	\N	\N	2015-11-19 15:23:04	2015-11-25 11:25:50	611	616	\N
10433	2015-11-19	2015-11-19	Workers Compensation	Patricia A.	Palacios Cruz	1988-05-16	\N	(661) 421-3017	\N	(661) 220-4104	804 Bradshaw St.	\N	\N	Bakersfield	\N	93307	CT: 11-14-2013 - 11-14-2014	NECK,BACK,R / KNEE,L / KNEE,R / FOOT,L / FOOT,L / ANKLE,R / ANKLE,R / ARM,L / ARM,R / WRIST,L / WRIST,HEAD,R / SHOULDER,L / SHOULDER	\N	\N	0	Kern Ridge Growers, LLC	1176	612	<p>-----[Nov-19-15 09:25 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">Bakersfield/BMG @ 9.79 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 94.02 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie cita L/O</span><br></p></p>	1159	808	Alex	2015-12-03 12:00:00	2	\N	\N	<p>-----[Nov-19-15 09:25 AM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-19 09:25:23	2015-11-19 09:33:20	616	616	\N
10488	2015-11-23	2015-11-23	Workers Compensation	Leopoldino	Ortiz	1992-12-01	618-60-6970	(661) 709-6528	\N	\N	1119 Avila Ave	\N	\N	Delano	\N	93215	09-14-2015	R / FOOT,R / ANKLE	\N	\N	0	DMSI Staffing	1168	826	\N	1159	808	Alex	2015-12-03 13:30:00	1	\N	\N	\N	0	\N	\N	\N	2015-11-24 10:14:41	2015-11-24 10:14:41	611	611	\N
10486	2015-11-23	2015-11-23	Workers Compensation	Angelica L.	Rivera	1985-07-19	\N	(619) 646-1456	\N	\N	848 Colorado Ave	\N	Apt B	Chula Vista	\N	91911	CT: 10/29/2014-10/29/2015	SPINE,HEAD,NECK,R / ARM,STRESS	\N	\N	0	Northgate Gonzalez LLC	1169	610	<p>-----[Nov-30-15 09:23 AM Lily E.]-----</p><p><p>Per Humberto if possible send the client to RB/San Ysidro.</p><p>Emailed Paperwork to clinic requesting appt.</p></p><p>-----[Nov-23-15 05:07 PM Lily E.]-----</p><p><p>Emailed Humberto @ L/O the following options:</p><p>SD/LH @ 12.84 miles</p><p>Murrieta/Gogatz @ 73.20 miles</p></p>	1331	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-23 17:07:11	2015-11-30 09:23:44	611	611	\N
10419	2015-11-18	2015-11-18	Workers Compensation	Julio	Rodriguez Pina	1994-02-26	\N	(909) 275-2522	\N	(909) 600-1909	16291 Dianthus Ave	\N	\N	Fontana	\N	92335	CT: 09-18-2014 - 09-18-2015	R / ELBOW,R / FOREARM,R / KNEE,LOWER BACK	\N	\N	0	Owner /Management Best Value Recycling	1176	612	<p>-----[Nov-23-15 02:38 PM Isabel M.]-----</p><p>Envie correo de cancelacion, deje mensaje al cliente</p><p>-----[Nov-20-15 09:42 AM Isabel M.]-----</p><p>Deje mensaje con MariCruz su esposa</p><p>-----[Nov-19-15 05:04 PM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-19-15 10:05 AM Isabel M.]-----</p><p>1 Telefono deje mensaje y 2 tel. desconectado</p><p>-----[Nov-18-15 12:12 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">LH/Fontana @ 1.68 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">SB/Montgomery @ 12.17 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Deje mensaje</span><br></p></p>	1326	\N	\N	\N	\N	69	2015-11-23 14:35:00	\N	0	\N	\N	\N	2015-11-18 12:12:51	2015-11-23 14:38:28	616	616	\N
10446	2015-11-19	2015-11-19	Workers Compensation	Marcelo De Jesus	Garcia	1973-01-16	\N	(661) 342-2620	\N	(661) 454-9147	11298 Palma Ave.	\N	\N	Wasco	\N	93280	09-25-2015	LOWER BACK,R / KNEE,L / KNEE,L / FOOT,R / FOOT	\N	\N	0	\N	1176	612	<p>-----[Nov-19-15 04:58 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Bakersfield/BMG @ 35.91 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/Noble Quest @ 128.12\nmiles</p><p class="MsoNormal"><o:p><br></o:p></p><p class="MsoNormal"><o:p>Envei cita L/O y documentos a clinica</o:p></p></p>	1159	808	Alex	2015-12-03 12:30:00	2	\N	\N	<p>-----[Nov-19-15 04:58 PM Isabel M.]-----</p><p>Conf, con Hija Eva</p>	0	\N	\N	\N	2015-11-19 16:58:00	2015-11-19 17:02:05	616	616	\N
10550	2015-11-30	2015-11-30	Workers Compensation	Wilfredo Alonzo	Gonzalez	1985-08-06	\N	(323) 425-7512	\N	\N	3263 E. Green St.	\N	\N	Pasadena	\N	91107	CT: 11-11-2014 - 11-11-2015	BACK	Respiratory	\N	0	Cafe Santorini	1176	817	<p>-----[Nov-30-15 03:04 PM Isabel M.]-----</p><p>Envie documentos a clinicas y cita L/O</p>	1074	774	Maggie	2015-12-07 10:00:00	1	\N	\N	\N	0	\N	\N	\N	2015-11-30 15:04:07	2015-11-30 15:04:08	616	616	\N
10435	2015-11-19	2015-11-19	Workers Compensation	Odilon	Gaspar	1958-06-01	\N	(323) 842-1280	\N	\N	10618  1/2 South Normandie Ave.	\N	\N	Los Angeles	\N	90044	CT: 02-01-2014- 02-01-2015	BACK	Nose ( Allegies), lungs	\N	0	SBR Construction, Inc	1176	612	<p>-----[Nov-20-15 11:34 AM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-20-15 09:02 AM Isabel M.]-----</p><p>Por Vanessa, me pidio que programara la cita en MedNation L.A, &nbsp;envie los documentos a la clinica</p><p>-----[Nov-19-15 12:00 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Pico Rivera/Gutierrez @ 16.68\nmiles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">La/MedNation @ 11.40 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">El cliente dice que ya lo enviaron a otra clinica, envie correo L/O</span><br></p></p>	1097	731	Yanira	2015-11-23 12:00:00	6	\N	\N	<p>-----[Nov-20-15 11:34 AM Isabel M.]-----</p><p>El cliente contesto pero colgo&nbsp;</p>	0	\N	\N	\N	2015-11-19 12:00:55	2015-11-20 11:34:42	616	616	\N
10442	2015-11-19	2015-11-19	Workers Compensation	Marco Antonio	Guerrero	1959-12-15	\N	(323) 245-2810	\N	\N	4619 1/2 Fern Place	\N	\N	Los Angeles	\N	90032	CT: 11/01/2014-03/09/2015	NECK,BACK,WAIST	\N	\N	0	Vensure CSLC Staffing	1176	612	<p>-----[Nov-24-15 10:21 AM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-23-15 02:36 PM Isabel M.]-----</p><p><p>Deje mensaje</p><p><br></p></p><p>-----[Nov-20-15 09:59 AM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-19-15 05:30 PM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-19-15 03:28 PM Lily E.]-----</p><p><p>Clinic Options:</p><p>Glendale/Daher @ 10.61 miles</p><p>LA/Industrial @ 8.16 miles</p></p>	1148	721	Judith	2015-12-01 16:00:00	2	\N	\N	<p>-----[Nov-24-15 10:21 AM Isabel M.]-----</p><p>Conf con Pt. y quiere texto</p>	0	\N	\N	\N	2015-11-19 15:28:08	2015-11-24 10:21:35	611	616	\N
10273	2015-11-05	2015-11-05	Workers Compensation	Fidencio	Herrera	1972-11-21	\N	(562) 361-0970	\N	\N	1419 North Rose Ave.	\N	\N	Compton	\N	90221	10-01-2013	HEAD,R / ELBOW	Jaw	\N	0	Davis Development Company, Inc	1176	612	<p>-----[Nov-19-15 12:21 PM Isabel M.]-----</p><p>Llama pero no contestan y no se puede dejar mensaje , para recuperacion de N/S</p><p>-----[Nov-17-15 09:51 AM Lily E.]-----</p><p>Per Ariana @ clinic the client was a no show on 11/13/2015. Emailed L/O</p><p>-----[Nov-05-15 02:54 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Pico Rivera/Gutierrez @ 10.95\nmiles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">MedNation/LA @ 18.04 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">El telefono esta malo y hable con Jesselin y dice que le programe en Pico Rivera y que ellos lo van a confirmar</span></p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica y cita L/O<br></span><br></p></p>	1112	766	Ariana	2015-11-13 11:00:00	\N	45	\N	\N	0	\N	\N	\N	2015-11-05 14:54:37	2015-11-19 12:21:23	616	616	\N
10444	2015-11-19	2015-11-19	Workers Compensation	Milton	Zavala Maya	1980-12-28	609-90-8980	(909) 525-5673	\N	(909) 724-9129	354 S. Spencer Ave. Apt. C	\N	\N	Upland	\N	91786	1.- 04-11-2014 ; 2.- CT: 04-23-2013- 02-01-2015	HEAD,BACK	2.- Back, wrists	\N	0	Hankook Tires	1176	612	<p>-----[Nov-25-15 02:17 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-19-15 04:13 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Enhanced/Covina @ 17.28 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Riverside/S. Spine @ 21.79 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica</span><br></p></p>	1077	822	Glamis	2015-12-07 15:00:00	2	\N	\N	\N	0	\N	\N	\N	2015-11-19 16:13:06	2015-11-25 14:17:29	616	616	\N
10499	2015-11-24	2015-11-24	Workers Compensation	Oscar	Iboy	1986-02-01	\N	(626) 421-2108	\N	\N	16208 Vanowen St. Apt.5	\N	\N	Van Nuys	\N	91406	CT: 07-28-2014 - 07-28-2015  ; 2.-	L / LEG,R / LEG,R / KNEE,L / KNEE,R / ARM,L / ARM,R / ANKLE,L / ANKLE,NECK	\N	1307	0	Encino Glatt Market, Inc	1176	612	<p>-----[Nov-24-15 05:14 PM Isabel M.]-----</p><p>Envie correo L/O</p><p>-----[Nov-24-15 05:12 PM Isabel M.]-----</p><p><p>Opciones de clinicas :</p><p class="MsoNormal">Van Nuys/NobleQuest @ 3.35 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Reseda/MedNation @ 3.96 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">El telefono esta malo</span><br></p><p><br></p></p>	1326	\N	\N	\N	\N	66	2015-11-24 17:10:00	\N	0	\N	\N	\N	2015-11-24 17:12:51	2015-11-30 10:08:25	616	616	\N
10457	2015-11-20	2015-11-20	Workers Compensation	Audon	Lopez Valenzuela	1959-02-21	626-12-2575	(760) 397-6549	\N	\N	1000 S. Pearl Ave	\N	\N	Compton	\N	90221	CT: 10-01-2013 - 11-21-2014	LOWER BACK,R / ARM	\N	\N	0	Agent Giumarra  Vineyards	1176	612	<p>-----[Nov-24-15 02:30 PM Isabel M.]-----</p><p>Envie cita L/O&nbsp;</p><p>-----[Nov-24-15 11:45 AM Isabel M.]-----</p><p>La oficina de L/O dice no tener una clinica mas cercana , Hable con el cliente y prefiere su cita por la manana, lo removi de cancelado, &nbsp;envie documentos a clinica</p><p>-----[Nov-20-15 04:18 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Gutierrez/Pico Rivera @ 10.95\nmiles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Whittier/Ford @ 15.56 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">El cliente dice que le queda muy lejos, envie correo L/O</span><br></p></p>	1112	766	Carmen	2015-12-01 10:00:00	2	\N	\N	\N	\N	\N	\N	\N	2015-11-20 16:18:18	2015-11-30 10:13:56	616	616	\N
10497	2015-11-24	2015-11-24	Workers Compensation	Maria Celia	Martinez Mendoza	1964-10-21	\N	(714) 340-6185	\N	\N	2725 W. Saint Gertrude Place	\N	\N	Santa Ana	\N	92704	CT; 06-13-2014 - 06-13-2015	BACK,L / WRIST,R / HAND,L / HAND,R / WRIST	\N	\N	0	Yun Katz	1176	612	<p>-----[Nov-25-15 08:34 AM Isabel M.]-----</p><p>La clinica mando hacer un cambio del dia 12-03-2015 @ 2:00PM para el 12-01-2015 @ 11:00AM, le envie la nueva cita L/O</p><p>-----[Nov-24-15 03:32 PM Isabel M.]-----</p><p><p>Por L/O &nbsp;cambiar a&nbsp;<span style="line-height: 1.42857;">Santa Ana/Keystone</span></p><p><span style="line-height: 1.42857;">Envie cita L/O y documentos a clinica</span><p class="MsoNormal"><o:p></o:p></p></p></p>	1335	793	Jesus	2015-12-01 11:00:00	2	\N	\N	<p>-----[Nov-25-15 08:34 AM Isabel M.]-----</p><p>Conf. nueva cita</p><p>-----[Nov-24-15 03:32 PM Isabel M.]-----</p><p>&nbsp;No sirve tel. envie carta</p>	0	\N	\N	\N	2015-11-24 15:32:40	2015-11-25 08:34:27	616	616	\N
10443	2015-11-19	2015-11-19	Workers Compensation	Juan Jose	Villalvazo Huerta	1983-02-15	602-45-0962	(909) 567-0177	\N	(909) 567-0217	237 Edgerton Dr.	\N	\N	San Bernardino	\N	92405	CT: 03-15-2014 - 03-15-2015	R / ELBOW,L / ELBOW,R / FOREARM,L / FOREARM,LOWER BACK,NECK	\N	\N	0	Kann Enterprises Inc	1176	612	<p>-----[Nov-23-15 09:42 AM Isabel M.]-----</p><p>Envie &nbsp;cita L/O</p><p>-----[Nov-19-15 04:06 PM Isabel M.]-----</p><p>Envie documentos a clinica</p><p>-----[Nov-19-15 03:54 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">SB/Industrial @ 7.17 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Fontana/LH @ 11.45 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Deje mensaje son su esposa Charlene</span><br></p><p><br></p></p>	1146	794	Alejandra	2015-12-05 09:30:00	2	\N	\N	<p>-----[Nov-23-15 09:42 AM Isabel M.]-----</p><p>Deje mensaje</p>	0	\N	\N	\N	2015-11-19 15:54:01	2015-11-23 10:39:39	616	616	\N
10311	2015-11-09	2015-11-09	Workers Compensation	David Israel	Salmeron Rivera	1975-07-14	547-98-5643	(323) 317-0455	\N	\N	328 N. Mathews Street Apt 7	\N	\N	Los Angeles	\N	90033	1. CT: 08/01/2013 - 07/01/2014     2. 06/01/2014	R / HIP,L / HIP,R / KNEE,NECK,R / SHOULDER,L / SHOULDER,SLEEP DISORDER	2. left trunk, skin, right knee, right shin	1182	0	IIM Employment Group	1176	817	<p>-----[Nov-19-15 01:28 PM Lily E.]-----</p><p>client called in to advise that he called the clinic to R/S his appointment for today @ 5 PM</p><p>-----[Nov-19-15 12:18 PM Isabel M.]-----</p><p>Deje mensaje de recuperacion de N/S</p><p>-----[Nov-17-15 09:33 AM Lily E.]-----</p><p>Per Yanira @ clinic this client was a no show on 11/12. Will email L/O</p><p>-----[Nov-09-15 12:18 PM Daisy M.]-----</p><p><p>LA / MedNation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1097	731	Yanira	2015-11-19 17:00:00	\N	\N	\N	\N	1	\N	Yanira	2015-11-19	2015-11-09 12:18:08	2015-11-23 12:16:12	614	611	\N
10447	2015-11-19	2015-11-19	Workers Compensation	Silvia	Rangel Cardozo	1972-06-14	\N	(661) 342-2620	\N	(661) 454-9147	11298 Palma Ave	\N	\N	Wasco	\N	93280	09-25-2015	LOWER BACK,R / KNEE,L / KNEE,HEAD,L / FOOT,R / FOOT	\N	\N	0	De Santiago Farm Labor Contracting	1176	612	<p>-----[Nov-19-15 05:22 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">BMG/Bakersfield @ 35.91 miles</span></p><p><span style="line-height: 1.42857;">Envie documentos a clinica y cita L/O<br></span><br></p><p class="MsoNormal"><o:p></o:p></p></p>	1159	808	Alex	2015-12-03 12:30:00	2	\N	\N	\N	0	\N	\N	\N	2015-11-19 17:22:18	2015-11-19 17:22:18	616	616	\N
10468	2015-11-23	2015-11-23	Workers Compensation	Salvador	Gonzalez Villasenor	1966-02-13		(323) 204-7098	\N	\N	1604 Crown Hill Ave.	\N	\N	Los Angeles	\N	90026	CT: 11-14-2013-11-01-2015	LOWER BACK,EYES,L / HAND,R / HAND	\N	\N	0	Licha's Restaurant	1176	612	<p>-----[Nov-23-15 08:52 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Industrial/LA @ 1.70 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Glendale/LA @ 6.57 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie cita L/O y documentos a clinica</span><br></p></p>	1148	794	Judith	2015-11-30 12:30:00	2	\N	\N	<p>-----[Nov-23-15 09:06 AM Isabel M.]-----</p><p>Conf. con Pt.</p><p>-----[Nov-23-15 08:52 AM Isabel M.]-----</p><p>Deje mensaje</p>	\N	\N	\N	\N	2015-11-23 08:52:27	2015-11-23 09:06:06	616	616	\N
10288	2015-11-06	2015-11-07	Workers Compensation	Jose	Ruiz	1963-09-11	603-22-9451	(760) 414-1259	\N	\N	850 Anns Way	\N	\N	Vista	\N	92083	CT: 08/24/2014 - 08/24/2015	BACK,R / LEG,L / LEG,R / ARM,L / ARM,R / SHOULDER,L / SHOULDER,R / KNEE,L / KNEE,L / ANKLE,R / ANKLE,HEAD,NECK,R / ELBOW,L / ELBOW,R / WRIST,L / WRIST,R / HAND,L / HAND,L / FOOT,R / FOOT	\N	\N	0	Backyard Vacation	1176	817	<p>-----[Nov-20-15 09:10 AM Lily E.]-----</p><p>Per Linda @ clinic the client R/S for 11/23 @ 8 AM instead of 11/16 @ 8AM</p><p>-----[Nov-06-15 11:27 AM Daisy M.]-----</p><p>Rancho Bernardo / RB Spine - 20.0 miles, pending appt from clinic.&nbsp;</p>	1161	742	Alma	2015-11-23 08:00:00	1	\N	\N	\N	\N	\N	\N	\N	2015-11-06 11:27:34	2015-11-20 09:10:35	614	611	\N
10528	2015-11-24	2015-11-24	Workers Compensation	Francisco	Velasco	1964-12-10	612-12-1728	(805) 336-5825	\N	\N	2661 East Ventura Blvd	\N	\N	Oxnard	\N	93036	CT: 06/30/2014-06/30/2015	WAIST,LOWER BACK,R / FOOT,L / FOOT	\N	\N	0	Hcattle Company	1176	817	<p>-----[Nov-25-15 05:19 PM Lily E.]-----</p><p><p>Advised Silvia @ L/O that the closest clinic we have to the client is in Reseda @ 40.87 miles and she advised to cancel at it is to far.&nbsp;</p></p>	1326	\N	\N	\N	\N	47	\N	\N	0	\N	\N	\N	2015-11-25 17:19:00	2015-11-25 17:19:00	611	611	\N
10357	2015-11-11	2015-11-11	Workers Compensation	Genara	Perez	1966-07-11	\N	(760) 643-7407	\N	(760) 639-8010	1208 Monique Court Apt. A	\N	\N	Vista	\N	92084	10-13-2015	R / LEG,LOWER BACK	Stomach	\N	0	Friendly Greenhouses, LLC	1176	612	<p>-----[Nov-11-15 05:16 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-11-15 02:56 PM Isabel M.]-----</p><p>Envie documentos a clinica para cita</p><p>-----[Nov-11-15 02:46 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Rancho Bernardo/RB @ 22.46 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Murrieta/Gogatz @ 29.44 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Deje mensaje</span><br></p></p>	1161	741	Linda	2015-11-23 08:00:00	2	\N	\N	<p>-----[Nov-11-15 05:16 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	1	\N	Alma	2015-11-23	2015-11-11 14:46:51	2015-11-24 10:30:22	616	611	\N
10214	2015-11-02	2015-11-02	Workers Compensation	Marco Tulio	Tobar	1978-10-28	\N	(323) 229-5465	\N	\N	1502 W. 65th St.	\N	\N	Los Angeles	\N	90047	07-06-2015	BACK	\N	\N	0	Sea Pac Engineering, Inc	1176	612	<p>-----[Nov-05-15 03:52 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-05-15 11:26 AM Isabel M.]-----</p><p><span style="color: rgb(51, 51, 51); font-family: HelveticaNeue-Roman, HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; line-height: normal; background-color: rgb(245, 245, 245);">Reenvie correo a clinica</span></p><p>-----[Nov-04-15 04:23 PM Isabel M.]-----</p><p>Envie documentos a clinica</p><p>-----[Nov-04-15 02:55 PM Isabel M.]-----</p><p>Llamo Judith en Industrial L.A &nbsp; que no tomaron el caso por la seguranza, hable con el cliente y se enviara a R.B L.A , pedi nuevamente sus documentos&nbsp;</p><p>-----[Nov-02-15 02:14 PM Isabel M.]-----</p><p>MedNation No tomo el caso porque dicen que el empleador tiene aseguranza&nbsp;<span style="font-size:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;;\nmso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;mso-ansi-language:\nEN-US;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">berkshire</span></p><p>-----[Nov-02-15 12:59 PM Isabel M.]-----</p><p><p>Opciones de clinicas:<br><span style="line-height: 1.42857;">MedNation/LA @ 7.66 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Industrial/LA @ 9.54 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica</span><br></p></p>	1164	809	Linda	2015-11-20 14:00:00	2	\N	\N	<p>-----[Nov-05-15 03:52 PM Isabel M.]-----</p><p>Conf. con Pt.</p><p>-----[Nov-02-15 02:28 PM Isabel M.]-----</p><p>Conf.conPt.</p><p>-----[Nov-02-15 02:14 PM Isabel M.]-----</p><p>Deje mensaje</p>	\N	\N	\N	\N	2015-11-02 12:59:15	2015-11-20 11:13:52	616	616	\N
10458	2015-11-20	2015-11-20	Workers Compensation	Juan	Labra	1957-01-20	\N	(619) 254-3053	\N	\N	4140 Altadena Ave	\N	Apt 16	San Diego	\N	92105	1. CT: 09/14/2014-11/20/2015 2.  11/07/2015	L / SHOULDER,R / SHOULDER,HEAD,NECK,L / ARM,R / ARM,SPINE,SLEEP DISORDER	1. buttocks 2. chest, left hip, left arm	\N	0	Uptown Touchless Car Wash	1169	612	\N	1128	719	Jenny	2015-12-03 14:00:00	\N	\N	\N	\N	0	\N	\N	\N	2015-11-20 16:34:45	2015-11-20 16:34:45	611	611	\N
10475	2015-11-23	2015-11-23	Workers Compensation	Angela Marie	Baires	1969-06-23	\N	(424) 207-7561	\N	\N	10211 S. Prairie Ave.	\N	\N	Inglewood	\N	90303	08-05-2015	LOWER BACK,FINGERS,R / HAND,L / HAND	\N	\N	0	Flying  Food Group , LLC	1176	612	<p>-----[Nov-23-15 10:18 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">MedNation/LA @ 15.53 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Industrial/LA @ 13.74 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie cita L/O y documentos a la clinica</span><br></p></p>	1148	721	Carmen	2015-11-24 14:30:00	2	\N	\N	<p>-----[Nov-23-15 10:18 AM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-23 10:18:03	2015-11-23 10:19:44	616	616	\N
10285	2015-11-06	2015-11-06	Workers Compensation	Rosa	Martinez	1967-08-30	648-26-0465	(626) 421-0066	\N	\N	18416 Rorimer St	\N	\N	La Puente	\N	91744	CT: 05/18/2013 - 05/18/2015	R / WRIST,L / WRIST,R / ARM,L / ARM,R / KNEE,L / KNEE,NECK	both heels	1210	0	24 HR Personnel Services Inc	1169	610	<p>-----[Nov-06-15 10:11 AM Daisy M.]-----</p><p><p>Per Humberto @ L/O pt needs a new PTP, Dr. Higashi is no longer treating her. Paperwork sent to Innovative Medical Mgmt, pending appt.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1153	820	Sophia	2015-11-17 11:00:00	1	\N	\N	\N	1	\N	Caroline	2015-11-17	2015-11-06 10:11:58	2015-11-23 12:02:06	614	611	\N
10480	2015-11-23	2015-11-23	Workers Compensation	Lorenzo	Herrera Reyes	1945-08-10	\N	(619) 381-2136	\N	\N	2376 Tocayo Ave. Apt. 98	\N	\N	San Diego	\N	92154	CT: 03-01-2014 - 03-01-2015	WAIST,L / LEG,R / LEG,R / KNEE,L / KNEE,BACK,NECK,R / HAND,L / HAND,FINGERS,L / ARM,L / FOOT,R / FOOT,L / ANKLE,R / ANKLE,STRESS	\N	\N	0	Nex Transportation	1176	612	<p>-----[Nov-23-15 02:19 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">SD/LH @ 15.47 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Murrieta/Gogatz @ 74.62 miles</p><p class="MsoNormal"><o:p><br></o:p></p><p class="MsoNormal"><o:p>El cliente dice que esta muy lejos, envie correo L/O</o:p></p></p>	1326	\N	\N	\N	\N	48	2015-11-23 14:10:00	\N	0	\N	\N	\N	2015-11-23 14:19:46	2015-11-23 14:19:46	616	616	\N
10328	2015-11-10	2015-11-10	Workers Compensation	Irma	Aragon	1961-08-21	624-14-4257	(562) 464-8423	\N	(562) 200-3025	7722 Bradwell Avenue Apt 3	\N	\N	Whittier	\N	90606	11/26/2014	R / KNEE,R / LEG	\N	\N	0	Sees Candy Shops, Inc	1176	612	<p>-----[Nov-17-15 03:15 PM Isabel M.]-----</p><p>Envie nueva cita L/O</p><p>-----[Nov-17-15 03:11 PM Isabel M.]-----</p><p>La cita Anterior de la cliente era el 11-11-2015 y se le programo para 11-24-2015</p><p>-----[Nov-17-15 11:42 AM Daisy M.]-----</p><p>Per Vanessa @ L/O go ahead and contact the client to coordinate a new appt for the client. Gave to Isabel to work on.</p><p>-----[Nov-13-15 05:10 PM Daisy M.]-----</p><p>Per Jesselin pt has not called their office back, advised her we'll go ahead and cancel until they can speak to pt in regards to R/S appt.&nbsp;</p><p>-----[Nov-11-15 01:46 PM Daisy M.]-----</p><p>Per Jesselin @ L/O pt showed to appt w/ Gutierrez, but was not seen because she was not on the schedule. Called Arianna @ the clinic and she confirmed that pt was on schedule, she apologized and stated that she would be speaking to Dr. Gutierrez about the misunderstanding. Per Jesselin she will speak to pt to verify if she wishes to be R/S there or sent to Whittier @ approx 6.59 miles.&nbsp;</p><p>-----[Nov-10-15 03:05 PM Daisy M.]-----</p><p>LDM on VM with all of appt info.&nbsp;</p><p>-----[Nov-10-15 11:20 AM Daisy M.]-----</p><p><p>Per Jesselin @ L/O schedule pt in Pico Rivera for a morning appt.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1112	813	Ariana	2015-11-24 10:00:00	5	\N	\N	<p>-----[Nov-23-15 02:25 PM Isabel M.]-----</p><p>Mensaje completo y texto, no contesta</p><p>-----[Nov-19-15 12:11 PM Isabel M.]-----</p><p>No contesta deje mensaje completo</p><p>-----[Nov-17-15 03:11 PM Isabel M.]-----</p><p>Deje mensaje</p>	\N	\N	\N	\N	2015-11-10 11:20:13	2015-11-23 14:25:29	614	616	\N
10455	2015-11-20	2015-11-20	Workers Compensation	Carmelino Alonzo	Mendoza Munoz	1983-04-06	528-14-8453	(619) 633-5186	\N	\N	9669 Gold Coast Dr.  Apt. 70	\N	\N	San Diego	\N	92126	CT: 11-08-2014 - 11-07-2015	R / ARM,EYES,L / FOOT,R / FOOT,LOWER BACK,HEAD	\N	\N	0	Tom Cat Bar & Grill	1176	612	<p>-----[Nov-23-15 03:21 PM Isabel M.]-----</p><p>Envie documentos a clinica y cita</p><p>-----[Nov-20-15 03:39 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">RB/Rancho Bernardo @ 10.44 miles<o:p></o:p></p><p class="MsoNormal">SD/LH @ 13.18 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Deje mensaje</span><br></p><p>\n\n<br></p></p>	1128	719	Jenny	2015-12-10 16:15:00	2	\N	\N	<p>-----[Nov-23-15 03:21 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-20 15:39:35	2015-11-23 15:21:10	616	616	\N
10462	2015-11-20	2015-11-20	Workers Compensation	Jesus	Martinez	1968-02-06	546-08-0413	(619) 428-2540	\N	(619) 848-3660	3604 Beyer Blvd . Building 40  Apt. 202	\N	\N	San Ysidro	\N	92173	10-28-2015	LOWER BACK,NECK,L / SHOULDER	Buttocks	\N	0	More Glass Plus Super Glass	1176	612	<p>-----[Nov-23-15 04:25 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-20-15 05:00 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">RB/San Ysidro @ 1.15 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">SD/LH @ 17.02 miles</p><p class="MsoNormal"><o:p></o:p></p><p>Envie documentos a clinica</p></p>	1163	741	Alma	2015-12-09 11:00:00	2	\N	\N	\N	0	\N	\N	\N	2015-11-20 17:00:43	2015-11-23 16:25:47	616	616	\N
10437	2015-11-19	2015-11-19	Workers Compensation	Joe	Estrada Jr.	1987-03-07	546-95-7166	(760) 485-1544	\N	\N	17551 Mountain View Rd. Space 61	\N	\N	Dessert Hot Springs	\N	92240	09-07-2015	R / ARM,L / ARM,NECK,STRESS,R / WRIST,L / WRIST,L / LEG,R / LEG,L / ANKLE	Back of head	\N	0	Mike Thompson Recreational Vehicles Detailer	1176	612	<p>-----[Nov-24-15 12:12 PM Isabel M.]-----</p><p><span style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;">Envie correo L/O informandole que el cliente si llego a la clinica pero que no esta deacuedo a su fecha de lesion</span></p><p>-----[Nov-23-15 01:59 PM Lily E.]-----</p><p>Per Maribel @ clinic the client showed but did not agree with DOI and said he would speak to his atty regarding this matter. Informed Isabel</p><p>-----[Nov-19-15 03:11 PM Isabel M.]-----</p><p>El cliente solo podia asistir los sabados</p><p>-----[Nov-19-15 03:06 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Montgomery/SB @ 51.30 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">S. Spine/Riverside @ 54.69 miles</p><p class="MsoNormal">Envie documentos a clinica y cita L/O</p><p class="MsoNormal"><o:p></o:p></p></p>	1326	794	Maribel	2015-11-21 11:15:00	\N	55	2015-11-24 12:10:00	<p>-----[Nov-19-15 03:06 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-19 15:06:32	2015-11-24 12:12:26	616	616	\N
10263	2015-11-04	2015-11-04	Workers Compensation	Jose Juan	Ibarra	1971-03-29	621-39-9524	(805) 423-8031	\N	\N	170 N. 2nd St.	\N	\N	Shandon	\N	93461	CT: 10-19-2014 -10-19-2015	LOWER BACK,CHEST,L / ARM	L. ear, Allergies	\N	0	San Juan Ranch	1176	612	<p>-----[Nov-09-15 03:17 PM Isabel M.]-----</p><p>Envie cita &nbsp;L/O</p><p>-----[Nov-09-15 09:54 AM Isabel M.]-----</p><p><span style="line-height: 21.4286px;">Reenvie el correo para la cita</span></p><p>-----[Nov-05-15 04:16 PM Isabel M.]-----</p><p>Lo removi de cancelado, envie documentos a clinica para cita</p><p>-----[Nov-05-15 12:02 PM Lily E.]-----</p><p>Per Jesselin @ L/O the client is willing to travel to Bakersfield.&nbsp;</p><p>-----[Nov-04-15 04:03 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Bakersfield/BMG @ 103.33 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 184.18 miles</p><p class="MsoNormal"><br></p><p class="MsoNormal">Al cliente le parece muy lejos, envie correo L/O&nbsp;<o:p></o:p></p></p>	1159	808	Alex	2015-11-19 11:00:00	2	\N	\N	<p>-----[Nov-09-15 03:17 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	1	2015-12-21 11:30:00	Alex	2015-11-19	2015-11-04 16:03:42	2015-11-24 15:02:55	616	611	\N
10517	2015-11-25	2015-11-25	Workers Compensation	J Jesus	Romero	1976-07-03	\N	(213) 716-0961	\N	\N	16337 Cornuta Ave Apt. 15	\N	\N	Benflower	\N	90706	11-03-2015	WAIST,R / LEG,NECK,BACK,R / SHOULDER	\N	\N	0	Jump For Fun Inc	1176	612	<p>-----[Nov-25-15 02:47 PM Isabel M.]-----</p><p><p>caso 2-2</p><p>Envie documentos a clinica y cita L/O</p></p>	1097	731	Yanira	2014-12-03 17:00:00	2	\N	\N	\N	0	\N	\N	\N	2015-11-25 14:47:17	2015-11-25 14:57:35	616	616	\N
10402	2015-11-16	2015-11-16	Personal Injury	Silbiano	Lemus LeaL	1968-03-02	\N	(760) 877-9078	\N	(760) 390-8381	408 N. Hickory St. Apt. 12	\N	\N	Escondido	\N	92025	10-07-2015	BACK,R / HIP,L / HIP,WAIST	\N	\N	0	\N	1176	612	<p>-----[Nov-23-15 04:43 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-20-15 08:56 AM Isabel M.]-----</p><p><span style="color: rgb(44, 62, 80); font-size: 13px; line-height: 21.4286px;">Reenvie documentos a clinicas</span></p><p>-----[Nov-20-15 08:53 AM Isabel M.]-----</p><p><span style="color: rgb(44, 62, 80); font-size: 13px; line-height: 21.4286px;">Reenvie documentos a clinicas</span></p><p>-----[Nov-19-15 11:49 AM Isabel M.]-----</p><p><span style="color: rgb(44, 62, 80); font-size: 13px; line-height: 21.4286px;">Reenvie documentos a clinicas</span></p><p>-----[Nov-18-15 11:24 AM Isabel M.]-----</p><p><p style="color: rgb(89, 126, 162); line-height: 21.4286px; background-color: rgb(236, 240, 241);">Reenvie correo para cita</p><div><br></div></p><p>-----[Nov-17-15 10:21 AM Isabel M.]-----</p><p><span style="line-height: 21.4286px;">Reenvie documentos a clinicas</span></p><p>-----[Nov-16-15 03:54 PM Isabel M.]-----</p><p><p>Envie documentos a clinica</p><p><br class="Apple-interchange-newline"></p><p><br></p></p>	1161	742	Alma	2015-12-03 09:00:00	2	\N	\N	<p>-----[Nov-23-15 04:43 PM Isabel M.]-----</p><p>Conf. con Pt.</p><p>-----[Nov-23-15 08:24 AM Isabel M.]-----</p><p><span style="color: rgb(89, 126, 162); line-height: 21.4286px; background-color: rgb(236, 240, 241);">Reenvie correo para cita</span></p>	0	\N	\N	\N	2015-11-16 15:54:35	2015-11-23 16:45:36	616	616	\N
10454	2015-11-20	2015-11-20	Workers Compensation	Gildardo E.	Montemira	1968-06-08	\N	(310) 863-1959	\N	\N	1803 Pacific Coast Hwy # 22	\N	\N	Hermosa Beach	\N	90254	CT: 02-06-2014-02-06-2015	NECK,HEAD,BACK,SPINE,L / LEG,R / LEG,STRESS	Anxiety, depression	\N	0	Care 1st Ambulance Services, Inc DBA  AHA	1176	612	<p>-----[Nov-24-15 05:25 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-23-15 03:54 PM Isabel M.]-----</p><p>Envie documentos a clinica</p><p>-----[Nov-20-15 02:51 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><br></p><p class="MsoNormal">Gutierrez/Pico Rivera @\n24.52&nbsp; miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">LA/MedNAtion @ 19.01 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">&nbsp;Deje mensaje</span><br></p></p>	1097	731	Yanira	2015-11-30 13:30:00	1	\N	\N	<p>-----[Nov-25-15 11:05 AM Isabel M.]-----</p><p>Deje mensaje completo y envie texto</p><p>-----[Nov-24-15 05:25 PM Isabel M.]-----</p><p>Deje Mensaje</p>	0	\N	\N	\N	2015-11-20 14:51:12	2015-11-25 12:04:49	616	616	\N
10482	2015-11-23	2015-11-23	Workers Compensation	Bacilio	Paz Riano	1962-06-14	641-28-2614	(661) 768-8095	\N	(661) 623-5102	376 Adam St. Apt. A	\N	\N	Taft	\N	93268	CT;11-06-2014 - 11-06-2015	R / SHOULDER,L / SHOULDER,R / ARM,L / ARM,NECK,LOWER BACK	\N	\N	0	Torres Farm Labor Contractor	1176	612	<p>-----[Nov-23-15 05:02 PM Isabel M.]-----</p><p>El lciente dice muy lejos, envie correo L/O</p><p>-----[Nov-23-15 03:00 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Bakersfield/BMG @ 40.76 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 109.72 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Hable con la esposa Aurora Cruz, y le dara el mensaje</span><br></p></p>	1326	\N	\N	\N	\N	48	2015-11-23 17:05:00	\N	0	\N	\N	\N	2015-11-23 15:00:51	2015-11-23 17:12:24	616	616	\N
10372	2015-11-12	2015-11-12	Workers Compensation	Genera	Perez	1966-07-11	\N	(760) 643-7407	\N	\N	1208 Monique Court Apt. A	\N	\N	Vista	\N	92084	CT: 06-01-2014 - 06-01-2015	L / SHOULDER,LOWER BACK,NECK	\N	\N	0	Speciment House Inc	1176	612	<p>-----[Nov-23-15 05:17 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-23-15 08:24 AM Isabel M.]-----</p><p><span style="color: rgb(89, 126, 162); line-height: 21.4286px; background-color: rgb(236, 240, 241);">Reenvie correo para cita</span></p><p>-----[Nov-20-15 08:56 AM Isabel M.]-----</p><p><span style="color: rgb(44, 62, 80); font-size: 13px; line-height: 21.4286px;">Reenvie documentos a clinicas</span></p><p>-----[Nov-19-15 11:46 AM Isabel M.]-----</p><p>He dejado mensaje en el telefono y nuevamente reenvie correo</p><p>-----[Nov-18-15 11:23 AM Isabel M.]-----</p><p>Reenvie correo para cita</p><p>-----[Nov-17-15 10:22 AM Isabel M.]-----</p><p><span style="line-height: 21.4286px;">Reenvie documentos a clinicas</span></p><p>-----[Nov-16-15 09:40 AM Isabel M.]-----</p><p><span style="color: rgb(89, 126, 162); line-height: 21.4286px; background-color: rgb(236, 240, 241);">Reenvie correo a clinica para cita</span></p><p>-----[Nov-12-15 02:29 PM Isabel M.]-----</p><p>Envie documentos a clinica</p><p>-----[Nov-12-15 01:40 PM Isabel M.]-----</p><p><p>Deje mensaje</p><p><br></p></p><p>-----[Nov-12-15 12:29 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Rancho Bernardo/RB @ 22.46 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Murrieta/Gogatz @ 29.44 miles<o:p></o:p></p><p><br></p></p>	1161	741	Alma	2015-11-25 08:00:00	2	\N	\N	<p>-----[Nov-24-15 08:33 AM Isabel M.]-----</p><p>Deje mensaje completo y el cliente llamo y confirme</p><p>-----[Nov-23-15 05:17 PM Isabel M.]-----</p><p>Deje mensaje completo</p>	0	\N	\N	\N	2015-11-12 12:29:09	2015-11-24 08:33:07	616	616	\N
10400	2015-11-16	2015-11-16	Workers Compensation	Judith	Montes	1983-02-14	613-22-2308	(310) 347-8033	\N	\N	16002 S. Atlantic Blvd.  Apt. 34	\N	\N	Compton	\N	90221	10-31-2015	L / ANKLE,R / LEG,LOWER BACK	\N	\N	0	Citi Staff Solutions, Inc	1176	612	<p>-----[Nov-24-15 04:08 PM Lily E.]-----</p><p>Per Vanessa @ L/O the client was unable to make it to her appt and asked to R/S from 11/24 @ 3PM to 12/08 @ 11 AM</p><p>-----[Nov-17-15 04:01 PM Isabel M.]-----</p><p><p>Por Vanessa que le programamos , ellos &nbsp;la confirmaran&nbsp;</p><p>Envie cita L/O y documentos a clinica</p></p><p>-----[Nov-17-15 09:43 AM Isabel M.]-----</p><p>&nbsp;La persona que contesto dice que es numero equivocado .Le envie un corre L/O</p><p>-----[Nov-16-15 03:44 PM Isabel M.]-----</p><p>Deje Mensaje</p><p>-----[Nov-16-15 12:24 PM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-16-15 11:27 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p>Downey/Aun @ 7 Miles</p><p>Pico Rivera/Gutierrez @ 10.95 Miles</p></p>	1073	743	Genell	2015-12-08 11:00:00	1	\N	\N	\N	\N	\N	\N	\N	2015-11-16 11:27:07	2015-11-24 16:08:48	616	611	\N
10502	2015-11-25	2015-11-25	Workers Compensation	Gustavo	Gradilla	1975-07-18	634-98-7023	(626) 274-2271	\N	\N	3711 Penn Mar Ave. Apt. 19	\N	\N	El Monte	\N	91732	CT: 09-22-2013 - 09-19-2014	HEAD,NECK,R / SHOULDER,L / SHOULDER	Nose ,groin, shoulder blades, heels, soles	\N	0	Marco's  Auto  Body Of South Pasadena	1176	612	<p>-----[Nov-25-15 09:32 AM Isabel M.]-----</p><p><p style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;">Lily no dio opciones de clinica</p><p style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;">Envie cita L/O y Lily envio los documentos a clinica</p></p>	1074	774	Maggie	2015-12-07 14:30:00	2	\N	\N	<p>-----[Nov-25-15 09:32 AM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-25 09:32:17	2015-11-25 09:32:17	616	616	\N
10551	2015-11-30	2015-11-30	Workers Compensation	Juan Carlos	Valencia-Cisneros	1972-11-04	623-78-0688	(909) 235-0503	\N	(916) 968-1935	10162 24th Street	\N	\N	Rancho Cucamonga	\N	91730	CT: 11/22/2014 - 11/22/2015	WAIST,BACK	\N	\N	0	Landry's Seafood House	1176	612	<p>-----[Nov-30-15 03:11 PM Daisy M.]-----</p><p><p>Case 1 of 2&nbsp;</p><p>Clinic options:&nbsp;</p><p>Montclair / Balian - 8.99 miles</p><p>Fontana / LH - 9.22 miles&nbsp;</p><p>LDM on VM for pt to call us back in order to provide him with clinic options.&nbsp;</p></p>	1328	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2015-11-30 15:11:00	2015-11-30 15:11:00	614	614	\N
10241	2015-11-03	2015-11-03	Workers Compensation	Antonio	Alvarado	1975-01-23	\N	(661) 240-7714	\N	(661) 240-8288	626  6th St.	\N	\N	Wasco	\N	93280	CT: 08-28-2014 - 08-28-2015	L / WRIST,L / SHOULDER	R. thumb finger	\N	0	Jerry's  Farm Labor Contracting	1176	612	<p>-----[Nov-06-15 12:01 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-05-15 11:36 AM Isabel M.]-----</p><p>Hable a la clinica y dicen que la persona Kaylene no estara en la clinica ni ayer ni hoy , y que llame manana por la cita</p><p>-----[Nov-04-15 08:41 AM Isabel M.]-----</p><p>Reenvie correo a la clinica</p><p>-----[Nov-03-15 05:16 PM Isabel M.]-----</p><p>El cliente llamo que le programe su cita . envie los documentos a la clinica</p><p>-----[Nov-03-15 05:10 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Bakersfield/BMG @ 35.91 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 128.12</p><p class="MsoNormal"><span style="line-height: 1.42857;">El cliente dice que comienza a trabajar y no puede asistir a las citas, le envie un correo L/O</span><br></p></p>	1159	808	Ana	2015-11-19 13:15:00	2	\N	\N	<p>-----[Nov-09-15 04:59 PM Isabel M.]-----</p><p><br>Conf. Pt.</p><p>-----[Nov-09-15 10:10 AM Isabel M.]-----</p><p>Deje mensaje completo y envie carta</p><p>-----[Nov-06-15 09:45 AM Isabel M.]-----</p><p><p>Deje mensaje</p><p><br></p></p><p>-----[Nov-05-15 05:18 PM Isabel M.]-----</p><p>Deje Mensaje</p>	1	2015-12-21 12:00:00	Alex	2015-11-19	2015-11-03 17:10:32	2015-11-24 15:01:56	616	611	\N
10304	2015-11-06	2015-11-06	Workers Compensation	Luis Antonio	Vallin	1968-03-05	614-06-3769	(661) 384-0489	\N	\N	410 Golden Drive	\N	\N	Bakersfield	\N	93306	CT: 10-06-2014- 10-29-2015	R / SHOULDER,BACK,LOWER BACK	\N	\N	0	Chad B Gallego	1176	612	<p>-----[Nov-09-15 01:35 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-09-15 09:55 AM Isabel M.]-----</p><p><span style="line-height: 21.4286px;">Reenvie el correo para la cita</span></p><p>-----[Nov-06-15 04:05 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal"><b><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;">Bakersfield/BMG\n@ 2.48 miles<o:p></o:p></span></b></p><p>\n\n</p><p class="MsoNormal"><b><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;">Van\nNuys/NobleQuest @ 105.59 miles</span></b></p><p class="MsoNormal"><b><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;">Envie documentos a clinica</span></b><o:p></o:p></p></p>	1159	808	Alex	2015-11-19 11:30:00	2	\N	\N	<p>-----[Nov-09-15 02:21 PM Isabel M.]-----</p><p>Conf. con Pt.</p><p>-----[Nov-09-15 01:55 PM Isabel M.]-----</p><p>Deje mensaje</p>	1	\N	Alex	2015-11-19	2015-11-06 16:05:27	2015-11-24 15:05:23	616	611	\N
10335	2015-11-10	2015-11-10	Workers Compensation	Gladis Elizabeth	Orellana	1977-05-08	619-13-8031	(949) 600-0373	\N	\N	8043 Chapman Avenue Apt 17	\N	\N	Stanton	\N	92701	CT: 09/13/2014 - 09/13/2015	LOWER BACK,BACK	\N	\N	0	Truth and Alchemy	1176	612	<p>-----[Nov-11-15 11:29 AM Daisy M.]-----</p><p>Sent pt a text message with appt info upon her request.&nbsp;</p><p>-----[Nov-10-15 05:13 PM Daisy M.]-----</p><p><p>Per pt schedule appt in Santa Ana fpr the latest time possible.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-10-15 03:49 PM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>Santa Ana &nbsp;/ Keystone - 11.92 miles</p><p>Costa Mesa / Southland Spine - 9.81 miles&nbsp;</p><p>Called pt to provide her with options, but she did not answer, left message for her to call back.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1335	722	Jesus	2015-11-24 17:15:00	2	\N	\N	\N	\N	\N	\N	\N	2015-11-10 15:49:56	2015-11-24 10:54:18	614	611	\N
10329	2015-11-10	2015-11-10	Workers Compensation	David	Birrueta	1963-02-05	624-83-7553	(661) 747-0881	\N	(661) 742-3461	P.O Box 182	\N	\N	Buttonwillow	\N	93206	10-20-2015	L / KNEE,NECK,LOWER BACK	R. buttock	\N	0	Sunny Gem	1176	612	<p>-----[Nov-12-15 11:13 AM Isabel M.]-----</p><p>Lily me informo que programara cita por Jesselyn</p><p>-----[Nov-12-15 10:13 AM Isabel M.]-----</p><p>Reenvie documentos a clinica</p><p>-----[Nov-11-15 04:28 PM Isabel M.]-----</p><p>Envie documentos a clinica</p><p>-----[Nov-11-15 10:07 AM Isabel M.]-----</p><p>No contesta y no se puede dejar mensaje</p><p>-----[Nov-10-15 04:56 PM Isabel M.]-----</p><p>No contestan y el abogado no tiene otros numeros de telefono</p><p>-----[Nov-10-15 02:23 PM Isabel M.]-----</p><p>No contestan</p><p>-----[Nov-10-15 12:21 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Bakersfield/BMG @ 33.39 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 114.72 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">1. telefono no contesta y no se puede deajr mensaje y 2 tel, no funciona</span><br></p></p>	1159	808	Alex	2015-11-19 11:00:00	1	\N	\N	<p>-----[Nov-12-15 11:13 AM Isabel M.]-----</p><p>No contesta y L/O confirmara</p>	1	2015-12-21 12:00:00	Alex	2015-11-19	2015-11-10 12:21:23	2015-11-24 15:10:11	616	611	\N
10529	2015-11-25	2015-11-25	Workers Compensation	Eva Luz	Lopez De Benavidez	1965-05-08	626-16-5967	(909) 202-5378	\N	\N	9532 Laurel Ave	\N	\N	Fontana	\N	92335	CT: 05-01-2014- 10-26-2015	R / HAND,L / HAND,BACK,R / UPPER EXT,L / UPPER EXT,L / LOWER EXT,R / LOWER EXT	\N	\N	0	Nongshim America , Inc	1176	614	<p>-----[Nov-25-15 05:19 PM Isabel M.]-----</p><p><p>Opciones de clinicas;</p><p><span style="line-height: 1.42857;">Fontana/LH @ 1.68 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Montgomery/SB @ 12.22 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie cita L/O</span><br></p></p>	1086	719	Jenny	2015-12-04 11:15:00	2	\N	\N	\N	0	\N	\N	\N	2015-11-25 17:19:33	2015-11-25 17:19:33	616	616	\N
10484	2015-11-23	2015-11-23	Workers Compensation	Jose Panfilo	Cabezas Garcia	1950-06-01	456-91-8463	(760) 429-9199	\N	(760) 781-3002	912 E. Washington Ave, # 207	\N	\N	Esdcondido	\N	92025	CT: 06-01-2012 - 06-01-2014	BACK,R / LEG,NECK,HEAD	\N	\N	0	Edco Disposal	1176	612	<p>-----[Nov-30-15 09:03 AM Isabel M.]-----</p><p>Envie correo para saber si ya tienen la cita</p><p>-----[Nov-25-15 10:56 AM Isabel M.]-----</p><p>Envie documentos &nbsp;a clinica para cita</p><p>-----[Nov-24-15 01:52 PM Isabel M.]-----</p><p>Deje mensaje, le explicare al cliente que el abogado no tiene otra clinica mas cercana</p><p>-----[Nov-23-15 04:02 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Rancho Bernardo/RB @ 7.59 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">SD/LH @ 25.72 miles</p><p class="MsoNormal"><o:p></o:p></p><p>El cliente quiere cita en Escondido, envie correo L/O</p></p>	1161	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2015-11-23 16:02:48	2015-11-30 09:03:40	616	616	\N
10535	2015-11-30	2015-11-30	Workers Compensation	Rosalina	Lopez Cortez	1969-09-28	604-38-6442	(323) 424-2017	\N	\N	3003 Leeward Ave Apt# 320	\N	\N	Los Angeles	\N	90005	05/26/2015	BACK,L / HIP,L / KNEE,L / ANKLE	\N	1250	0	IOTA Brew Cafe	1176	612	<p>-----[Nov-30-15 10:12 AM Daisy M.]-----</p><p>Per pt schedule appt @ MedNation for anything after 11:00 am and send her appt info through a text.&nbsp;</p><p>-----[Nov-30-15 09:38 AM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>MedNation / LA - 0.51 miles</p><p>LA / Industrial - 2.27 miles&nbsp;</p></p>	1097	731	Yanira	2015-12-03 15:00:00	5	\N	\N	\N	\N	\N	\N	\N	2015-11-30 09:38:44	2015-11-30 11:40:35	614	614	\N
10282	2015-11-06	2015-11-06	Workers Compensation	Pascual	Perez	1960-04-17	585-62-2645	(661) 635-5504	\N	\N	1025 Hood Street	\N	\N	Arvin	\N	93203	CT: 11/12/2014 - 11/03/2015	R / KNEE,L / KNEE,LOWER BACK,R / ELBOW,L / ELBOW,R / FOOT,L / FOOT	\N	\N	0	A. Perez Farm Service	1176	612	<p>-----[Nov-11-15 09:20 AM Daisy M.]-----</p><p>LDM on VM with appt info.&nbsp;</p><p>-----[Nov-10-15 03:07 PM Daisy M.]-----</p><p>LDM on VM and mailed out appt letter.&nbsp;</p><p>-----[Nov-10-15 09:56 AM Daisy M.]-----</p><p>LDM on VM for pt to call back and obtain appt info.&nbsp;</p><p>-----[Nov-09-15 09:32 AM Daisy M.]-----</p><p><p>Per pt schedule appt in Bakersfield. Paperwork emailed to the clinic, pending appt.&nbsp;</p></p><p>-----[Nov-06-15 03:04 PM Daisy M.]-----</p><p>Called pt, but no answer.&nbsp;</p><p>-----[Nov-06-15 09:38 AM Daisy M.]-----</p><p>Called pt to provide him with clinic options, but he did not answer. Left message to call back.&nbsp;</p><p>-----[Nov-06-15 09:14 AM Daisy M.]-----</p><p><p>Disregard previos note.&nbsp;</p><p>Clinic Options:&nbsp;</p><p>Bakersfield / BMG - 23.56 miles</p><p>Van Nuys / NobleQuest - 86.54 miles&nbsp;</p></p><p>-----[Nov-06-15 09:12 AM Daisy M.]-----</p><p><p>Bakersfield / BMG&nbsp;, paperwork emailed to the clinic and pending appt.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1159	808	Alex	2015-11-19 12:30:00	4	\N	\N	\N	1	2015-12-21 12:45:00	Alex	2015-11-19	2015-11-06 09:12:57	2015-11-24 15:13:21	614	611	\N
10269	2015-11-05	2015-11-05	Workers Compensation	Dawn Marie	Dickey	1974-12-14	671-63-8937	(661) 800-6741	\N	\N	614 Washington Ave Unit A	\N	\N	Bakersfield	\N	93308	11/18/2013	LOWER BACK	\N	1244	1	BG Retail, LLC	1176	612	<p>-----[Nov-24-15 03:19 PM Lily E.]-----</p><p>Per Alex @ clinic the client was a no show on 11/19 @ 2:30 PM. &nbsp;Emailed L/O</p><p>-----[Nov-12-15 05:08 PM Daisy M.]-----</p><p>LDM on pt's VM with complete appt info.&nbsp;</p><p>-----[Nov-12-15 08:57 AM Daisy M.]-----</p><p>Per Jesselin schedule in Bakersfield, paperwork emailed to the clinic.</p><p>-----[Nov-11-15 05:10 PM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>Bakersfield / BMG - 7.5 miles&nbsp;</p><p>Reseda / MedNation - 101 miles&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-11-15 04:59 PM Isabel M.]-----</p><p>Jesselin dice que le programen Dr. sin MPN, le informe a Daysi</p><p>-----[Nov-09-15 09:38 AM Daisy M.]-----</p><p><p>Advised Jesselin that we are going to go ahead and place case on cx status as we have no Dr within the MPN.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-05-15 12:31 PM Daisy M.]-----</p><p>Advised Jesselin / Vanessa @ L/O that we have no Dr within the MPN.&nbsp;</p>	1159	808	Alex	2015-11-19 14:30:00	\N	45	\N	\N	\N	\N	\N	\N	2015-11-05 12:31:14	2015-11-24 15:19:23	614	611	\N
10249	2015-11-04	2015-11-04	Workers Compensation	Daniel De Jesus	Ponce	1977-06-03	\N	(760) 594-5339	\N	\N	1507 San Jose Street	\N	\N	Oceanside	\N	92054	10/19/2015	EYES,R / SHOULDER,L / SHOULDER,HEAD	both ears	\N	0	Carban	1176	612	<p>-----[Nov-20-15 09:28 AM Lily E.]-----</p><p>Per Vanessa @ L/O the client did show but got tired of waiting after 30 min and left without saying anything. He wants to be R/S and for the earliest time possible.</p><p>-----[Nov-19-15 12:23 PM Isabel M.]-----</p><p><span style="line-height: 21.4286px;">Deje mensaje de recuperacion de N/S</span></p><p>-----[Nov-17-15 10:41 AM Lily E.]-----</p><p>Per Linda @ clinic the client was a no show on 11/12. &nbsp;Emailed L/O</p><p>-----[Nov-05-15 02:46 PM Daisy M.]-----</p><p>Conf w/ Pt and he requested a text message.&nbsp;</p><p>-----[Nov-05-15 02:05 PM Daisy M.]-----</p><p><span style="line-height: 21.4286px;">Called pt to provide him with appt details, but he did not answer and I was unable to leave a message.&nbsp;</span></p><p>-----[Nov-04-15 11:36 AM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>Rancho / RB - 30.51 miles</p><p>Murrieta / Gogatz - 35.59 miles&nbsp;</p><p>Per pt schedule in Rancho Bernardo, paperwork emailed to the clinic to request appt.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1161	742	Linda	2015-11-30 09:00:00	5	\N	\N	\N	\N	\N	\N	\N	2015-11-04 11:36:43	2015-11-24 16:02:16	614	611	\N
10323	2015-11-10	2015-11-10	Workers Compensation	Maurilio	Escobar Paredes	1958-09-13	572-59-0447	(323) 984-1581	\N	\N	1253 S. Greenwood Ave. Apt. 16	\N	\N	Montebello	\N	90640	CT: 03-16-2014 - 08-16-2014	R / WRIST,L / WRIST,R / HAND,L / HAND,FINGERS,R / KNEE,L / KNEE,L / LEG,R / LEG	Soles	1252	0	Vensure HR, Inc	1176	612	<p>-----[Nov-24-15 04:30 PM Isabel M.]-----</p><p>Vanessa llamo que le programamos, envie documentos a clinica y cita L/O</p><p>-----[Nov-24-15 10:51 AM Isabel M.]-----</p><p><p>Hable con el cliente y no quiere asistir El Monte, enviare correo L/O</p><p><br></p><p><br></p></p><p>-----[Nov-24-15 10:47 AM Isabel M.]-----</p><p>Deje mensaje, para explicarle al cliente que en Invovative cancelaron nuevas citas ya que por ahora no estan aceptando nuevos clientes, le informe a L/O</p><p>-----[Nov-11-15 03:44 PM Isabel M.]-----</p><p>Envie dita L/O</p><p>-----[Nov-10-15 02:04 PM Isabel M.]-----</p><p>Hable con Jesselin y le explique que el cliente prefiere esperar la cita para el 12-11-2015 en Whittier, envie correo a clinica para la cita</p><p>-----[Nov-10-15 12:29 PM Isabel M.]-----</p><p>El cliente prefiere asistir a Whittier, le explique la fecha 12-11-2015 , pero el prefiere alli, dice que El Monte le queda muy lejos, preguntare a su abogado por la fecha</p><p>-----[Nov-10-15 09:21 AM Isabel M.]-----</p><p>Se iba enviar Dr. Ford/El Monte, pero el Dr. regresa hasta 12-11-2014, y Lily autorizo El Monte/Mahboudian, &nbsp;deje mensaje al cliente</p>	1074	774	Maggie	2015-12-07 09:30:00	2	\N	2015-11-24 10:50:00	<p>-----[Nov-24-15 04:30 PM Isabel M.]-----</p><p>Conf. con Pt.</p><p>-----[Nov-11-15 04:01 PM Isabel M.]-----</p><p>Conf. con Pt.</p><p>-----[Nov-11-15 03:38 PM Isabel M.]-----</p><p>Deje mensaje</p>	0	\N	\N	\N	2015-11-10 09:21:56	2015-11-24 16:30:40	616	616	\N
10248	2015-11-04	2015-11-04	Workers Compensation	Jose Eduardo	Pena	1960-10-13	550-93-0389	(619) 446-9688	\N	\N	4224 Camino de la Plaza Apt 18D	\N	\N	San Ysidro	\N	92173	CT: 06/01/2014 - 06/01/2015	R / ARM,R / SHOULDER,LOWER BACK,BACK,R / HAND	right index finger	\N	0	Weldmac Manufacturing Company	1176	612	<p>-----[Nov-24-15 05:24 PM Lily E.]-----</p><p>Emailed Vanessa @ L/O regarding client cancelling appointment and advised the request will be cancelled until we are advised on how to proceed.&nbsp;</p><p>-----[Nov-23-15 11:45 AM Lily E.]-----</p><p>Per Emily @ clinic the client CX appt due to his JOB.</p><p>-----[Nov-05-15 02:43 PM Daisy M.]-----</p><p>San Ysidro is closed on Fridays, pt stated that it was ok to schedule in San Diego in San Ysidro had no Friday appt. Pt's appt for 11-19-2015 will be a phone Hx and will see the Dr on a Friday.&nbsp;</p><p>-----[Nov-04-15 11:31 AM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>San Ysidro / RB - 1.00 miles&nbsp;</p><p>SD / LH - 17.99 miles</p><p>Per pt schedule in San Ysidro for a Friday morning appt since that is his day off.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1326	719	Jenny	2015-11-19 09:00:00	\N	55	\N	\N	0	\N	\N	\N	2015-11-04 11:31:52	2015-11-24 17:24:29	614	611	\N
10477	2015-11-23	2015-11-23	Workers Compensation	Martin	Diaz	1970-04-10	606-27-1338	(661) 477-9194	\N	(661) 431-1698	313 Garden Dr.	\N	\N	Bakersfield	\N	93307	08-01-2015	L / FOOT,LOWER BACK,HEAD,R / HIP,L / HIP	\N	\N	0	Grimmway Enterprises , Inc	1176	612	<p>-----[Nov-25-15 03:04 PM Isabel M.]-----</p><p>Envie cita L/O</p><p>-----[Nov-25-15 10:14 AM Isabel M.]-----</p><p><p style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;">Reenvie documentos a clinica</p><div><br></div></p><p>-----[Nov-23-15 11:30 AM Isabel M.]-----</p><p><p>Opciones de clientes:</p><p><span style="line-height: 1.42857;">Bakersfield/BMG @ 9.79</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Van Nuys/NobleQuest @ 94.02 Miles</p><p class="MsoNormal">Envie documentos a clinica</p><p class="MsoNormal"><o:p></o:p></p></p>	1159	808	Alex	2015-12-10 11:30:00	6	\N	\N	<p>-----[Nov-25-15 03:04 PM Isabel M.]-----</p><p>Y no se puede dejar mensaje</p>	0	\N	\N	\N	2015-11-23 11:30:51	2015-11-25 15:04:15	616	616	\N
10404	2015-11-17	2015-11-17	Workers Compensation	Ezperanza	Navarro	1970-01-29	373-45-8991	(562) 929-8394	\N	\N	11830 Ferina Street	\N	\N	Norwalk	\N	90650	1. CT: 08/14/2013-06/02/2015 2. 08/14/2013	L / LEG,SPINE,R / HIP,L / HIP,L / ARM,HEAD,L / UPPER EXT,R / UPPER EXT,SLEEP DISORDER,STRESS,ABDOMEN	2. LEFT LEG, HIPS, GROIN	1250	0	BRIGHT DT, LLC	1169	610	<p>-----[Nov-25-15 10:13 AM Lily E.]-----</p><p>Per Humberto @ L/O please schedule the client with Dr. Mahboubian in El Monte</p><p>-----[Nov-24-15 05:35 PM Lily E.]-----</p><p>Per Sphia @ clinic Dr. Vu cancelled for 12/10 and does not have a next date available. Emailed Humberto the next option for an MD would be Dr. Mahboubian @ 15.17 miles or Dr. Gutierrez in Pico Rivera @ 4.68 miles. Pending on how to proceed.</p><p>-----[Nov-17-15 11:13 AM Lily E.]-----</p><p>PER HUMBERTO SCHEDULE WITH DR. FORD. EMAILED PAPERWORK TO SOPHIA @ CLINIC REQUESTING APPT.</p><p>-----[Nov-17-15 11:12 AM Lily E.]-----</p><p><p>PER HUMBERTO @ L/O PLEASE SCHEDULE CLIENT WITH AN MD. GAVE HIM THE FOLLOWING OPTIONS</p><p>WHITTIER/FORD @ 6.93 MILES</p><p>SANTA ANA/KEYSTONE @ 19.68 MILES</p></p>	1074	774	Maggie	2015-12-07 08:30:00	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-17 11:12:30	2015-11-25 10:13:36	611	611	\N
10313	2015-11-09	2015-11-09	Workers Compensation	Gerges	Soliman	1963-02-15	604-22-5492	(562) 832-3170	\N	\N	10332 Felson St	\N	\N	Bellflower	\N	90706	CT: 12/01/2014 - 06/10/2015	NECK,SLEEP DISORDER,R / SHOULDER,L / SHOULDER,R / FOOT,L / FOOT	spine	1210	0	Costa Mesa Nissan	1169	610	<p>-----[Nov-25-15 10:24 AM Lily E.]-----</p><p>Per Humberto @ L/O schedule this client with Dr. Gutierrez in Pico Rivera as that is the closest we have to the client.n&nbsp;</p><p>-----[Nov-24-15 09:47 AM Lily E.]-----</p><p>Per Humberto @ L/O he cancelled appointment due to client was not willing to travel.&nbsp;</p><p>-----[Nov-23-15 12:02 PM Lily E.]-----</p><p>Per Caroline @ clinic the client cancelled appointment due to the distance of the clinic.&nbsp;</p><p>-----[Nov-09-15 05:23 PM Daisy M.]-----</p><p><p>Disregard previous note, pt will be scheduled in @ Whittier / Ford (11. miles)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-09-15 01:50 PM Daisy M.]-----</p><p>Pt will be scheduled in LB / ACS (10.7 miles), pending appt from clinic.&nbsp;</p>	1112	766	Ariana	2015-12-01 14:30:00	5	\N	\N	<p>-----[Nov-30-15 03:10 PM Lily E.]-----</p><p>LDM and sent out txt</p>	\N	\N	\N	\N	2015-11-09 12:31:30	2015-11-30 15:10:14	614	611	\N
10530	2015-11-24	2015-11-24	Workers Compensation	Davoudi	Manoush	1963-02-04	615-23-3767	(818) 482-4119	\N	\N	10852 McVine Ave	\N	\N	Sunland	\N	91040	08/29/2015	L / HAND,HEAD,NECK,L / SHOULDER,R / SHOULDER,BACK,SPINE,R / LEG,L / LEG	\N	1238	0	Regis Corp	1176	817	<p>-----[Nov-30-15 09:30 AM Isabel M.]-----</p><p><p style="color: rgb(89, 126, 162); line-height: 21.4286px; background-color: rgb(236, 240, 241);"><span style="line-height: 21.4286px;">Envie correo para saber si ya tienen la cita</span></p><div><span style="line-height: 21.4286px;"><br></span></div></p><p>-----[Nov-25-15 05:28 PM Lily E.]-----</p><p>Client will be scheduled with NobleQuest in Van Nuys. Emailed paperwork to clinic requesting appt.</p>	1152	794	Prince	2015-12-08 09:00:00	1	\N	\N	\N	\N	\N	\N	\N	2015-11-25 17:28:57	2015-11-30 16:28:09	611	611	\N
10315	2015-11-09	2015-11-09	Workers Compensation	Erasmo	Guerra	1960-11-30	\N	(661) 706-7964	\N	\N	1240 E Street	\N	\N	Wasco	\N	93280	CT: 11/13/2014 - 11/05/2015	NECK,R / KNEE,L / KNEE,R / FOOT,L / FOOT,LOWER BACK,HEAD,R / SHOULDER	right thumb finger, belly	1283	1	R and L Contracting, Inc	1176	612	<p>-----[Nov-30-15 09:27 AM Lily E.]-----</p><p>Per Vanessa @ L/O R/S the client for a Monday appt.&nbsp;</p><p>-----[Nov-11-15 11:43 AM Daisy M.]-----</p><p><p>Per pt he advised L/O that he cannot miss alot of work to attend appts and would like to speak to them first prior to scheduling appt. Advised L/O that case will be placed on cancel status until further notice.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-11-15 11:23 AM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>Bakersfield / BMG - 30.5 miles</p><p>Reseda / MedNation - 124 miles</p></p><p>-----[Nov-11-15 09:49 AM Isabel M.]-----</p><p>Llamo Jesselin que lo pueden programar sin MPN, le informe a Daysi</p>	1159	808	Alex	2015-12-10 09:30:00	\N	\N	2015-11-11 11:40:00	\N	\N	\N	\N	\N	2015-11-09 13:41:42	2015-11-30 09:27:52	614	611	\N
10541	2015-11-20	2015-11-20	Workers Compensation	Heraclio	Zaragoza Llamas	1979-02-26	\N	(760) 501-4361	\N	\N	P.O Box 1271	\N	\N	Mecca	\N	92254	CT: 08-01-2014 - 10-28-2015	NECK,BACK	L. thumb	\N	0	El Espinal Farm Labor Contractor, LLC	1176	612	<p>-----[Nov-30-15 10:33 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">S. Spine/Riverside @ 96.31 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Montgomery/SB @ 92.92 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">El cliente dice que esta muy lejos, envie correo L/O</span><br></p></p>	1326	\N	\N	\N	\N	48	2015-11-20 14:00:00	\N	0	\N	\N	\N	2015-11-30 10:33:37	2015-11-30 10:33:37	616	616	\N
10538	2015-11-30	2015-11-30	Workers Compensation	Carlos	Lopez Lopez	1992-07-13	612-32-3992	(562) 278-4304	\N	\N	12318 Cheshier St Apt 5	\N	\N	Norwalk	\N	90605	01/14/2015	R / WRIST,R / HAND	right hand fingers	1304	0	Montebello Container	1176	612	<p>-----[Nov-30-15 11:54 AM Daisy M.]-----</p><p>Conf w/ pt, text message sent upon his request.&nbsp;</p><p>-----[Nov-30-15 10:37 AM Daisy M.]-----</p><p><p>Per pt schedule in Pico Rivera for an afternoon appt.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p><p>-----[Nov-30-15 09:54 AM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>Pico Rivera / Gutierrez - 5.50 miles</p><p>Anaheim / SoCal Chiros - 16.02 miles&nbsp;</p></p>	1112	813	Ariana	2015-12-03 16:00:00	2	\N	\N	\N	\N	\N	\N	\N	2015-11-30 09:54:12	2015-11-30 11:56:12	614	614	\N
10503	2015-11-25	2015-11-25	Workers Compensation	Julio Cesar	Rodriguez Munoz	1984-03-16	611-79-4910	(818) 269-3208	\N	\N	13107 Graber St.	\N	\N	Paicoma	\N	91331	07-06-2015	L / LEG,L / FOOT,BACK,R / HAND,L / HAND	L. rib cage	\N	0	Valley Crest Landscape	1176	612	<p>-----[Nov-30-15 09:32 AM Isabel M.]-----</p><p><p style="color: rgb(89, 126, 162); line-height: 21.4286px; background-color: rgb(236, 240, 241);"><span style="line-height: 21.4286px;">Envie correo para saber si ya tienen la cita</span></p><div><span style="line-height: 21.4286px;"><br></span></div></p><p>-----[Nov-25-15 10:12 AM Isabel M.]-----</p><p><p style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;">Reenvie documentos a clinica</p><div><br></div></p><p>-----[Nov-25-15 09:53 AM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">Van Nuys/NobleQuest @ 5.43 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Reseda/MedNation @ 11.65 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica</span><br></p></p>	1152	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2015-11-25 09:53:11	2015-11-30 09:32:05	616	616	\N
10498	2015-11-24	2015-11-24	Workers Compensation	J. Jesus	Romero	1976-07-03	\N	(213) 716-0961	\N	\N	16337 Cornuta Ave. Apt. 15	\N	\N	Bellflower	\N	90706	CT: 01-01-2014 - 08-26-2015	BACK,R / WRIST,L / WRIST	\N	\N	0	Only 123 Fashion	1176	612	<p>-----[Nov-30-15 10:46 AM Isabel M.]-----</p><p>Con Carmen cancele la cita en Industrial</p><p>-----[Nov-25-15 02:41 PM Isabel M.]-----</p><p><p>Cancele la cita en Industrial porque el cliente tiene dos casos y Indiustrial no toma dos casos</p><p>Envie documentos a clinica y cita L/O</p></p><p>-----[Nov-24-15 04:12 PM Isabel M.]-----</p><p><p>Opciones de &nbsp;clinicas:</p><p><span style="line-height: 1.42857;">Pico Rivera/Gutierrez @ 7.42 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">LA/Industrial @ 20.95 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie documentos a clinica y cita L/O</span><br></p><p class="MsoNormal"><o:p></o:p></p></p>	1097	731	Yanira	2015-12-10 14:00:00	2	\N	\N	<p>-----[Nov-24-15 04:12 PM Isabel M.]-----</p><p>Conf. con Pt.</p>	0	\N	\N	\N	2015-11-24 16:12:09	2015-11-30 10:46:08	616	616	\N
10492	2015-11-24	2015-11-24	Workers Compensation	Rocio	Jacome	1963-07-15	\N	(323) 830-6316	\N	\N	2518 California St.	\N	\N	Huntington C.A	\N	90255	CT: 11-22-2013 - 11-21-2015	NECK,SPINE,LOWER BACK,L / SHOULDER,R / ARM,L / ARM,L / WRIST,R / WRIST,R / HAND,L / HAND,FINGERS,STRESS	Anxiety, Depression	\N	0	Lugo Of California , Inc	1176	612	<p>-----[Nov-30-15 11:53 AM Isabel M.]-----</p><p>Envie documentos a clinica y cita L/O</p><p>-----[Nov-25-15 10:45 AM Isabel M.]-----</p><p>Deje mensaje</p><p>-----[Nov-24-15 01:48 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">Pico Rivera/Gutierrez @ 8.18 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">LA/Industrial @ 9.78 miles<o:p></o:p></p><p>Deje mensaje</p></p>	1148	721	Judith	2015-12-08 16:30:00	2	\N	\N	<p>-----[Nov-30-15 11:53 AM Isabel M.]-----</p><p>Conf. Y quiere texto</p>	0	\N	\N	\N	2015-11-24 13:48:36	2015-11-30 11:53:12	616	616	\N
10519	2015-11-25	2015-11-25	Workers Compensation	Antonio	Ramirez Villanueva	1963-07-05	\N	(818) 213-9427	\N	\N	8993 Virginia Ave. Apt. A	\N	\N	South Gate	\N	90280	CT: 10-19-2013 - 11-19-2015	R / HAND,HERNIA	L. heel, L. side of  groin	\N	0	RM HQ LLC DBA El Torito	1176	612	<p>-----[Nov-30-15 12:06 PM Isabel M.]-----</p><p>El cliente solo quiere asistir a la clinica que va de su aseguranza, envie correo L/O</p><p>-----[Nov-25-15 03:21 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p class="MsoNormal">Pico Rivera/Gutierrez @ 6.84 miles<o:p></o:p></p><p>\n\n</p><p class="MsoNormal">LA/MedNAtion @ 16.77 miles<o:p></o:p></p><p>Deje mensaje</p></p>	1326	\N	\N	\N	\N	54	2015-11-30 12:05:00	\N	0	\N	\N	\N	2015-11-25 15:21:53	2015-11-30 12:06:02	616	616	\N
10544	2015-11-30	2015-11-30	Workers Compensation	Enain	Diaz Garcia	1955-01-08	624-10-1927	(805) 814-6059	\N	(805) 263-6221	534 E. Laurel Street	\N	\N	Oxnard	\N	93033	CT: 11/24/2013 - 11/24/2015	R / ARM,L / ARM,R / ELBOW,L / ELBOW,R / WRIST,L / WRIST,R / HAND,L / HAND,FINGERS,R / LEG,L / LEG,R / KNEE,L / KNEE,R / FOOT,L / FOOT,TOES,R / ANKLE,L / ANKLE	soles, diabetes	\N	0	Valley Crest Landscape	1176	612	<p>-----[Nov-30-15 11:29 AM Daisy M.]-----</p><p>Per pt clinic is too far and he is unable to drive, advised Vanessa that case will be placed on cancel status.</p><p>-----[Nov-30-15 11:10 AM Daisy M.]-----</p><p><p>Clinic options:</p><p>Reseda / MedNation - 41.42 miles</p><p>Van Nuys / NobleQuest - 47.31 miles&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1326	\N	\N	\N	\N	48	2015-11-30 11:25:00	\N	0	\N	\N	\N	2015-11-30 11:10:55	2015-11-30 11:29:07	614	614	\N
10539	2015-11-30	2015-11-30	Workers Compensation	Andres	Reyes Bahena	1972-11-08	\N	(213) 925-3872	\N	\N	739 S. Garland Ave Apt 203	\N	\N	Los Angeles	\N	90017	CT: 03/31/2014 - 03/31/2015	R / KNEE,BACK	\N	\N	0	American Apparel Manufacturing	1176	612	<p>-----[Nov-30-15 11:32 AM Daisy M.]-----</p><p>Conf w/ pt &amp; sent text upon his request.&nbsp;</p><p>-----[Nov-30-15 10:51 AM Daisy M.]-----</p><p>Per pt schedule in LA for an afternoon appt, he will call me back after 2:00 pm to obtain appt info since he is currently working.&nbsp;</p><p>-----[Nov-30-15 10:25 AM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>LA / Industrial - 0.70 miles</p><p>Pico Rivera / Gutierrez - 13.29 miles&nbsp;</p><p>LDM on VM for pt to call back to provide clinic options.&nbsp;</p></p>	1148	776	Carmen	2015-12-03 15:30:00	5	\N	\N	\N	\N	\N	\N	\N	2015-11-30 09:56:38	2015-11-30 11:32:18	614	614	\N
10553	2015-11-30	2015-11-30	Workers Compensation	Migdalia	Monteagudo	1977-08-30	607-04-3418	(818) 331-3302	\N	\N	18257 Vanowen St	\N	\N	Reseda	\N	91335	CT: 11/23/2014 - 11/23/2015	R / FOOT,L / FOOT,SPINE,R / WRIST,L / WRIST,NECK,L / SHOULDER,L / ARM	\N	\N	0	Jalos Food Enterprise Inc DBA Vallarta	1169	610	<p>-----[Nov-30-15 03:20 PM Daisy M.]-----</p><p><p>Per Humberto @ L/O pt needs appt after 3:30 pm.</p><p>Reseda / MedNation - 0.56 miles</p><p><br></p></p>	1115	731	Yanira	2015-12-11 16:00:00	2	\N	\N	\N	\N	\N	\N	\N	2015-11-30 15:20:01	2015-11-30 17:07:52	614	614	\N
10546	2015-11-30	2015-11-30	Workers Compensation	Felix	Castro Rodriguez	1961-10-23	547-06-5612	(661) 229-8476	\N	\N	10513 Mount Pleasant Dr	\N	\N	Bakersfield	\N	93311	CT: 09/18/2014 - 09/18/2015	NECK,R / SHOULDER,L / SHOULDER,R / KNEE,L / KNEE,R / ANKLE,L / ANKLE,L / FOOT,R / FOOT,BACK,R / HIP,L / HIP,R / ELBOW,L / ELBOW,R / WRIST,L / WRIST,R / HAND,L / HAND	\N	\N	0	Halliburton Energy Services	1176	612	<p>-----[Nov-30-15 12:18 PM Daisy M.]-----</p><p><p>Clinic options:</p><p>Bakersfield / BMG - 20.94 miles&nbsp;</p><p>Van Nuys / NobleQuest - 94.06 miles</p><p>Per pt schedule in Bakersfield, paperwork emailed to the clinic.&nbsp;</p></p>	1159	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2015-11-30 12:18:51	2015-11-30 12:18:51	614	614	\N
10547	2015-11-30	2015-11-30	Workers Compensation	Salvador	Rivas	1964-12-22	613-44-9620	(909) 496-0825	\N	\N	14499 Begonia Rd Apt 5	\N	\N	Victorville	\N	92392	CT: 05/15/2014 - 11/24/2015	WAIST,BACK,R / KNEE,L / KNEE	\N	\N	0	Staffing Solutions Group	1176	612	<p>-----[Nov-30-15 12:27 PM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>Victorville / Montgomery Chiro - 7.84 miles</p><p>SB / Montgomery Chiro - 37.55 miles&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>Per pt schedule in Victorville.&nbsp;</p><p>Pt will have an In HOuse Hx on 1-5-2015 @ 10:30 am.</p></p>	1139	749	Jessica	2016-01-07 15:50:00	\N	\N	\N	\N	0	\N	\N	\N	2015-11-30 12:27:55	2015-11-30 12:27:55	614	614	\N
10548	2015-11-30	2015-11-30	Workers Compensation	Benito	Juarez Jr Ybarra	1987-02-02	560-93-6556	(661) 855-1174	\N	\N	1023 Water St Apt 2	\N	\N	Bakersfield	\N	93305	08/25/2015	HEAD,BACK,R / THIGH,L / THIGH,R / ELBOW,L / ELBOW,R / LEG,L / LEG,R / FOOT,L / FOOT,TOES,R / ARM,L / ARM	chest, both calves, face, stomach below belly button	\N	0	Bella Vineyard AG Services	1176	612	<p>-----[Nov-30-15 12:41 PM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>Bakersfield / BMG - 2.94 miles&nbsp;</p><p>Van Nuys / NobleQuest - 101.24 miles&nbsp;</p><p>LDM on VM for pt to call back to provide him with clinic options.&nbsp;</p></p>	1328	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2015-11-30 12:41:12	2015-11-30 12:41:12	614	614	\N
10522	2015-11-25	2015-11-18	Workers Compensation	Maria L	De La Rosa Perez	1957-06-05	\N	(619) 677-2747	\N	\N	2872 Franklin Ave. Apt. C	\N	\N	San Diego	\N	92113	CT: 11-19-2014 - 11-19-2015	NECK,R / ARM,WAIST	\N	\N	0	Wyndham Vacation Ownership , Inc	1176	612	<p>-----[Nov-30-15 01:53 PM Isabel M.]-----</p><p>Envie documentos a clinica y cita L/O</p><p>-----[Nov-25-15 03:31 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">SD/LH @ 4.90 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Murrieta/Gogatz @ 64.04 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Deje mensaje</span><br></p><p><br></p></p>	1128	719	Jenny	2015-12-10 15:30:00	2	\N	\N	\N	0	\N	\N	\N	2015-11-25 15:31:04	2015-11-30 13:53:35	616	616	\N
10540	2015-11-30	2015-11-30	Workers Compensation	Elidia Damaris	Dominguez	1957-10-23	620-06-1887	(619) 399-6618	\N	(619) 631-7504	411 Claydelle Ave	\N	\N	El Cajon	\N	92020	CT: 01/01/2015 - 05/11/2015	R / FOOT,L / FOOT,R / ANKLE,L / ANKLE,WAIST,BACK,R / WRIST,R / SHOULDER,R / HAND,STRESS	right hand fingers	\N	0	Alvarado Hospital	1176	612	<p>-----[Nov-30-15 02:07 PM Daisy M.]-----</p><p><p>Per pt schedule appt in San Diego.&nbsp;</p><p>Appt for 12-10-2015 will be a phone Hx.&nbsp;</p></p><p>-----[Nov-30-15 10:23 AM Daisy M.]-----</p><p>LDM on VM for pt to call back in order to provide her with clinic options.&nbsp;</p><p>-----[Nov-30-15 10:04 AM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>SD / LH - 12.35 miles</p><p>Murrieta / Gogatz - 67.01 miles&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1128	719	Jenny	2015-12-10 14:45:00	2	\N	\N	\N	\N	\N	\N	\N	2015-11-30 10:04:49	2015-11-30 14:07:40	614	614	\N
10390	2015-11-13	2015-11-13	Workers Compensation	Canuto	Campos	1980-03-14	621-52-8417	(714) 805-3745	\N	\N	1517 Van Ness	\N	\N	Santa Ana	\N	92706	10-02-2015	NECK,BACK,R / SHOULDER,L / SHOULDER,L / LEG,R / LEG,L / FOOT,R / FOOT	\N	\N	0	Pinnacle Landscape Management	1176	612	<p>-----[Nov-30-15 03:49 PM Isabel M.]-----</p><p><p>El cliente si asistio Dr. Aun / Anaheim el 11-18-2015 y no tomaron el caso, se cambio para Keystone/ Santa Ana</p><p>Enviare nueva cita L/O y documentos a clinica</p></p><p>-----[Nov-13-15 02:04 PM Isabel M.]-----</p><p><p>Opciones de &nbsp;clinicas:</p><p><span style="color: rgb(51, 51, 51); font-family: HelveticaNeue-Roman, HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; line-height: normal; background-color: rgb(245, 245, 245);">Anaheim/Aun @ 3.50 miles</span><br style="color: rgb(51, 51, 51); font-family: HelveticaNeue-Roman, HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; line-height: normal;"><span style="color: rgb(51, 51, 51); font-family: HelveticaNeue-Roman, HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; line-height: normal; background-color: rgb(245, 245, 245);">Costa Mesa/S. Spine @ 7.79 miles</span></p><p><span style="color: rgb(51, 51, 51); font-family: HelveticaNeue-Roman, HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 12px; line-height: normal; background-color: rgb(245, 245, 245);">Envie documentos a clinicas y cita L/O</span><br></p><p><br></p></p>	1335	793	Jesus	2015-12-08 10:00:00	2	\N	\N	<p>-----[Nov-30-15 04:00 PM Isabel M.]-----</p><p>Conf. Nueva cita</p><p>-----[Nov-13-15 02:04 PM Isabel M.]-----</p><p>Conf. con Pt</p>	\N	\N		\N	2015-11-13 14:04:06	2015-11-30 16:00:03	616	616	\N
10523	2015-11-25	2015-11-25	Workers Compensation	Maria L.	De La Rosa Perez	1957-06-05	\N	(619) 677-2747	\N	\N	2872 Franklin Ave. Apt. C	\N	\N	San Diego	\N	92113	05-20-2013	R / ANKLE,R / SHOULDER,R / ARM,BACK	R. groin	\N	0	IHG Management Maryland LLC	1176	612	<p>-----[Nov-30-15 02:35 PM Isabel M.]-----</p><p>Envie correo L/O porque la lesion es del 2013 y Jenny L.H desea saber si tienen medical Record, si la cliente ha sido tratada, envei correo L/O</p><p>-----[Nov-25-15 03:41 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">SD/LH @ 4.90 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Murrieta/Gogatz @ 64.04 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Deje mensaje</span><br></p></p>	1330	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2015-11-25 15:41:49	2015-11-30 14:35:25	616	616	\N
10552	2015-11-30	2015-11-30	Workers Compensation	Juan Carlos	Valencia-Cisneros	1972-11-04	923-78-0688	(909) 235-0503	\N	(916) 968-1935	10162 24th Street	\N	\N	Rancho Cucamonga	\N	91730	CT: 06/15/2010 - 06/15/2015	WAIST,BACK,R / FOREARM,L / FOREARM	\N	\N	0	Pennysaver USA Printing	1176	612	<p>-----[Nov-30-15 03:14 PM Daisy M.]-----</p><p><p style="line-height: 21.4286px;">Case 2 of 2&nbsp;</p><p style="line-height: 21.4286px;">Clinic options:&nbsp;</p><p style="line-height: 21.4286px;">Montclair / Balian - 8.99 miles</p><p style="line-height: 21.4286px;">Fontana / LH - 9.22 miles&nbsp;</p><p style="line-height: 21.4286px;">LDM on VM for pt to call us back in order to provide him with clinic options.&nbsp;</p></p>	1328	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2015-11-30 15:14:27	2015-11-30 15:14:27	614	614	\N
10555	2015-11-30	2015-11-30	Workers Compensation	Armando junior	Rodriguez Rodarte	1991-01-05	622-42-1634	(951) 515-4501	\N	\N	3088 Monroe St,	\N	\N	Riverside	\N	92504	CT: 10-16-2014 - 10-16-2015	BACK,L / FOOT,R / FOOT,R / HAND,L / HAND,R / LEG,L / LEG	\N	\N	0	Creative Metals Inc	1176	612	<p>-----[Nov-30-15 03:32 PM Isabel M.]-----</p><p><p>Opciones de clinicas:</p><p><span style="line-height: 1.42857;">Riverside/Montgomery @ 3.37 miles</span><br></p><p class="MsoNormal"><o:p></o:p></p><p>\n\n</p><p class="MsoNormal">Murrieta/Gogatz @ 34.84 miles</p><p class="MsoNormal"><span style="line-height: 1.42857;">Envie cita L/O y documentos a clinica</span><br></p></p>	1120	749	Nancy	2015-12-21 15:30:00	2	\N	\N	<p>-----[Nov-30-15 03:32 PM Isabel M.]-----</p><p>Conf. y quiere texto</p>	0	\N	\N	\N	2015-11-30 15:32:58	2015-11-30 15:32:58	616	616	\N
10545	2015-11-30	2015-11-30	Workers Compensation	Tito	Munar Kawile	1945-05-22	\N	(951) 743-0111	\N	\N	25717 Turmeric Way	\N	\N	Moreno Valley	\N	92553	10/23/2015	EYES,R / KNEE,R / FOOT,L / FOOT	\N	\N	0	Highway Transport	1176	612	<p>-----[Nov-30-15 03:07 PM Daisy M.]-----</p><p>Per pt schedule appt in Riverside.&nbsp;</p><p>-----[Nov-30-15 11:33 AM Daisy M.]-----</p><p>LDM on VM for pt to return my call to provide clinic options.&nbsp;</p><p>-----[Nov-30-15 11:14 AM Daisy M.]-----</p><p><p>Clinic options:&nbsp;</p><p>Riverside / Keystone - 14.19 miles&nbsp;</p><p>Murrieta / Gogatz - 31.12 miles&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>	1119	722	Jesus	2015-12-07 10:30:00	5	\N	\N	\N	\N	\N	\N	\N	2015-11-30 11:14:57	2015-11-30 16:41:32	614	614	\N
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clients_id_seq', 10560, true);


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
Jd1Iinqy0a99e5v9eEnblDydRAE1FTgMhD4mMdFz	85	1445020765	2015-10-09 11:39:25	2015-10-09 11:39:25
ppme9An4Uu74BsJAA8T8UuJpQaPn5RD3AmAuRPNg	70	1444418340	2015-10-09 10:41:34	2015-10-09 10:41:34
rFYGmxRGVJFiOFTvLC0dhwxcjwm13XuhFgLxkEcR	86	1444420415	2015-10-09 13:19:53	2015-10-09 13:19:53
4inrxDHxO1TBtIq2NN0scBWQsTfgFnFgno1LDPqw	87	1445028830	2015-10-09 13:53:50	2015-10-09 13:53:50
joOPBRdK4VqJPVQJGE29FkoOqz0icCo3FP5DtYOb	88	1445029015	2015-10-09 13:56:55	2015-10-09 13:56:55
X8kiaFwZc5yBKBZ1MjbiUd5T6R06ifEBc2VoAbjs	92	1444670933	2015-10-12 11:27:36	2015-10-12 11:27:36
1ofOGrvyH7gREeK0vtOGkFe33uyMOcyXnFFhWOa5	91	1444671426	2015-10-09 20:37:39	2015-10-09 20:37:39
b9HzUv9CEmPAm8ET8D1wpYPcBSRjR7FwcsFEYzGk	94	1445286329	2015-10-12 13:25:29	2015-10-12 13:25:29
FwrOph2daXex2Jl22bpKxpTaeqwASLwtcyBATUsv	95	1444679987	2015-10-12 13:50:05	2015-10-12 13:50:05
76pm2sDgWtkeN6TrHAkZXW6qXSL2K8v3MQumyERO	96	1444681615	2015-10-12 14:00:07	2015-10-12 14:00:07
a65FQtJLJDpFen1siuzlHhrFT26XiQ3jqObF1Uvz	90	1444682453	2015-10-09 17:45:30	2015-10-09 17:45:30
6IJQV9967rhHkUmW3FcSYHNvMJUwHDehl7O4yrHr	100	1445294732	2015-10-12 15:45:32	2015-10-12 15:45:32
HWuTuWPNonqQVX9aK3ivrFUlsRGJCfehmK5T1tWP	98	1444691283	2015-10-12 14:41:06	2015-10-12 14:41:06
G4GvppoFQo31lXeRHoV47O6VLjM0SCA4BpKEojok	99	1444691356	2015-10-12 14:41:44	2015-10-12 14:41:44
t5Iz70fHoFXUU2Yz7Pk5t4JFsp5AEFwqKAG76kSK	101	1445306426	2015-10-12 19:00:26	2015-10-12 19:00:26
2GQoz9dKIpC0hO0S6FL3ZyUZwxjccc8UlPlwr51B	93	1444710498	2015-10-12 11:37:20	2015-10-12 11:37:20
E9kkm6I85Kq9qY1HoYwDQI1aGOx0fBOOgos5cyL9	102	1445354153	2015-10-13 08:15:53	2015-10-13 08:15:53
gWD5NflC5zoFHe6hJYVQ4K5Lyeh5LdVAkQLxGIMX	97	1444749269	2015-10-12 14:27:14	2015-10-12 14:27:14
pp5XWMcYk6Jf8DyDZyapoDwgvzcuqCHYMgzSqFwO	105	1444749306	2015-10-13 09:14:50	2015-10-13 09:14:50
88iQHfZQP2zy753VCLCWgKLu9IShCC5PGh2ueBcE	84	1444755948	2015-10-09 11:33:33	2015-10-09 11:33:33
DukQR2ohv3fRQRArYlHRD4LWO8scb33qALAz5h0F	106	1444757567	2015-10-13 09:15:32	2015-10-13 09:15:32
8zTlrUNugGp2l1lqhtjX5DK13HBcTuzVUcwHxK4J	108	1444768954	2015-10-13 11:33:11	2015-10-13 11:33:11
8X4ZxcWk4XSNHlqOSAZMApfBkUeXuo8yowuqWxN8	104	1444835411	2015-10-13 09:05:27	2015-10-13 09:05:27
AXbTwEIxAR7LR1X3aRF012Zp5mtsNlIr4di5BKaP	72	1444848281	2015-10-09 10:51:01	2015-10-09 10:51:01
S4kHC3XziBbds0gee3UsGZAPFBC4U3JjHTQCiGXP	109	1444856499	2015-10-13 11:52:29	2015-10-13 11:52:29
aOoy3IlrfZR4zhHBevUZ5epWApsXSHEWKZimx4UZ	114	1445466005	2015-10-14 15:20:05	2015-10-14 15:20:05
6u1mO7asqLMo0k6a1iadDPMw3c5Tx3hySkF5d5tZ	111	1444865068	2015-10-14 09:19:54	2015-10-14 09:19:54
rAWDBIIKmWeIVPgxmgd1TDQwE963SeddiOhEii3x	115	1444920809	2015-10-15 08:37:43	2015-10-15 08:37:43
hrPcOqfQYoKTUSNvGOR0tcEKWMH4XnKjC1SdCX93	110	1444921738	2015-10-14 09:10:47	2015-10-14 09:10:47
rfefrIjmyQuuZIuVnKm0It03EE0EERD51sqsgRsr	118	1445558241	2015-10-15 16:57:21	2015-10-15 16:57:21
tLimqYDjARDFx5dhGz6WO4SIY7mPAKxKZhx9xDVN	89	1445006779	2015-10-09 15:51:35	2015-10-09 15:51:35
1LWyAe5EzWZkgLtwOykSE5tI0VMDnqKPmJd4IxOx	107	1445007997	2015-10-13 11:05:50	2015-10-13 11:05:50
JnlpiiQxmS1ySySysmlW67nDj8zZDBq0dxN36oBe	103	1445014494	2015-10-13 08:44:05	2015-10-13 08:44:05
LNITc9YhFgBXeNtpSVayhyNn1rX8U8BZw7PJX3xy	117	1445016311	2015-10-15 09:10:06	2015-10-15 09:10:06
aDZUPsRjeeANVSeK3rYhdmlDMey68cRR4yfDYLq3	113	1445017673	2015-10-14 15:02:27	2015-10-14 15:02:27
19rMs5XCWYVgKXWUhMQagnFh3gFtgz85fpKQsLRK	116	1445018611	2015-10-15 08:53:58	2015-10-15 08:53:58
sZH8l12F5PxYFXT4YjkqIzvi5Dp5J2wY4HuBdPEU	119	1445018649	2015-10-16 08:46:26	2015-10-16 08:46:26
4EuDoWspQl2imqHe3oPIno7tgnxH8wNrBazrJE3l	121	1445018674	2015-10-16 11:25:34	2015-10-16 11:25:34
EjaQae1mV5KIGOmYci3GodcPVnMaOa9D3TgjX6Ig	126	1445020240	2015-10-16 12:04:18	2015-10-16 12:04:18
frT9knWxTiwyp4W3KSao3DX9X0pPnL6eAwpa7IPA	125	1445021075	2015-10-16 12:04:04	2015-10-16 12:04:04
ZSE2V6yGtXt8cc6iunf5hok5M0jTdlCSiTotDkqA	128	1445021319	2015-10-16 12:31:19	2015-10-16 12:31:19
jJWfS1j2CA5evs7zGcaYrbXYbHWqQ6qDWwtdPcSI	124	1445021716	2015-10-16 12:00:41	2015-10-16 12:00:41
Gr88sspoe5a5q7gYvmoMXdCf7Ao4oEWRiqA9dnae	131	1445630303	2015-10-16 12:58:23	2015-10-16 12:58:23
MMFWihq1lwi7QMNW5PH5EPBVKH4Bi3DLsYXvY5yy	123	1445028782	2015-10-16 11:48:07	2015-10-16 11:48:07
OeB1wJa2QeLUq5YmOO7EBz1HusI7C07d9wuV8LaT	132	1445637192	2015-10-16 14:53:12	2015-10-16 14:53:12
HOzIRsSTjkXDQwxdw9m0tGSRKcLN7vrDuctJQK39	130	1445029120	2015-10-16 12:49:09	2015-10-16 12:49:09
AFovez8Av8jPZLoHzL8PYYDNtgM64ejKvcUCKAaV	129	1445034833	2015-10-16 12:44:56	2015-10-16 12:44:56
J6TF73Y1DSaw79rNPwHtdKBwxOfFxNeXIMUWWzXc	133	1445035285	2015-10-16 15:16:11	2015-10-16 15:16:11
Opd6Kx0AjygvOPpGKCP4xg472pchWtaQGubzLY7h	134	1445036354	2015-10-16 16:41:34	2015-10-16 16:41:34
RWPpqoTfxKkIBarln5zMYcjXRsr0wgHpSqymHA1m	136	1445264362	2015-10-19 07:48:32	2015-10-19 07:48:32
E4lhdDH4b0om7oEzn6hcFokbIoxtt54ZuvUfp3jX	127	1445267301	2015-10-16 12:05:02	2015-10-16 12:05:02
cW8kldwIzPUvUNxT0pZP2yrbsigxCeUXpOVbtXzi	137	1445274407	2015-10-19 08:19:32	2015-10-19 08:19:32
PwhMP3jDhEugKdDciQqk1AYaofq2JiTfZSZE0vz8	140	1445276162	2015-10-19 11:12:33	2015-10-19 11:12:33
i4NL4xijlc3RJHtdH85XMa6cSVEHcrIge92uam8g	141	1445277201	2015-10-19 11:37:09	2015-10-19 11:37:09
wotmKX9NCv9kduOVIeriZmClwNsFwGW3dIWRgUVd	142	1445279549	2015-10-19 11:53:49	2015-10-19 11:53:49
bdmN0J7DbSw8lhyMKlyKBBvx1LRR3VgAb6MqHtus	143	1445280175	2015-10-19 12:33:00	2015-10-19 12:33:00
pgKcK9pV7b3lBvyHRL8wwshw9fHsagfLarQEsLmX	144	1445280974	2015-10-19 12:43:18	2015-10-19 12:43:18
Y3r735bDr1166XF66cILH1VhFjZv4UCXiwRyE0JN	145	1445290890	2015-10-19 12:57:09	2015-10-19 12:57:09
4DqNZCkAyFkJPSo1fXWVziZX8pFXtH4RJlsqOTDo	146	1445348149	2015-10-19 15:42:56	2015-10-19 15:42:56
RbM3BG4yTabYWmOgaJJUhtJs88Zi73REcdZAUZsZ	138	1445353441	2015-10-19 09:11:04	2015-10-19 09:11:04
ULX3JAZRVHMVMWaOStqyvHWrslUSLySXjc8wmxu5	148	1445961871	2015-10-20 09:04:31	2015-10-20 09:04:31
nUkpmLsjzWL9agMDYmBj09auAJFuhboycP2azA4r	147	1445357352	2015-10-20 07:44:15	2015-10-20 07:44:15
kfbXExLXc4MG1un1teunw2JNNHl97g85FMSzrENm	149	1445357409	2015-10-20 10:09:54	2015-10-20 10:09:54
bn2R7wS3uVaMb3CjpoBpgwpV4b4V0q8RtwrAWrq5	150	1445357421	2015-10-20 10:10:13	2015-10-20 10:10:13
8XEPHBoO7Fxia3JPQiC23tznxWy54Cgt69gS2Dbw	139	1445358064	2015-10-19 10:58:38	2015-10-19 10:58:38
JqAVNeLJTIf6VJE3d7y8oZ0kA2MbYGeXP6xaws9k	135	1445360489	2015-10-16 16:43:46	2015-10-16 16:43:46
kpa731kz7PjZZyIiQngjjrE1tfgKBQ1hMHXgVYbf	152	1445360848	2015-10-20 10:21:38	2015-10-20 10:21:38
kI0SITpEzcjtUbXtyIAvM4DRcNvHCgxzuFAVYAcv	154	1445361094	2015-10-20 11:10:50	2015-10-20 11:10:50
hXgaYrKSPBTCiuV66soKoKosddK7ee6FB7Lj8Jen	153	1445361626	2015-10-20 11:01:45	2015-10-20 11:01:45
NDw628zQkK1wWQDeHlgcyhNBWrKVcXZh1PEkpdxj	156	1445362911	2015-10-20 11:32:35	2015-10-20 11:32:35
MZDf1kTR6wbLt47ElX6NomX6Q46HfLI8HwzDJrlh	155	1445363218	2015-10-20 11:12:16	2015-10-20 11:12:16
NKRIGtSEcDNy44UMmgif52Kg5X9uaCRDvh4ZYBYu	158	1445971641	2015-10-20 11:47:21	2015-10-20 11:47:21
PmQ03NqtZJszXWyDIlsGFvZGsx18UWrNJ9wmJaa4	112	1445438543	2015-10-14 12:44:44	2015-10-14 12:44:44
EoI7eUrlKuylt9YpVixFTvzvU7wu7dJ1hVDvAnCC	151	1445438595	2015-10-20 10:10:28	2015-10-20 10:10:28
4yYPWbAsNipoei3t9CnBeWeBnOKAbWG1jvrOEC8w	122	1445452225	2015-10-16 11:41:15	2015-10-16 11:41:15
KBZGtZbWGHZEdShhToEe3aXFvXJvtgVcPqbcc4kt	120	1445526375	2015-10-16 09:06:39	2015-10-16 09:06:39
7b8iCsIxlNJACB3nbFai5DTdXKIwW4filU2PpKyn	157	1445643635	2015-10-20 11:42:09	2015-10-20 11:42:09
SO9UT4LcpNL5oasact4P36oMDYi9zRq95mMqPMRt	159	1445384159	2015-10-20 11:52:40	2015-10-20 11:52:40
3wpU7jX9oSPFzfrWdMC3IpAq9VZ51RhqWP5Uta6f	161	1445992661	2015-10-20 17:37:41	2015-10-20 17:37:41
4ToLcBcqChiwMGbKcYeZywrV2H4SBVRRnF0Q4IDF	160	1445438490	2015-10-20 13:41:51	2015-10-20 13:41:51
0E5d4InrNufO4oV5Jr2tDynQwDlc0YmuJRZFbXgm	162	1445438584	2015-10-21 08:42:18	2015-10-21 08:42:18
euX27FA9B0QkY6dn13UG03R3yJJylnKMujmEyA5C	164	1445438851	2015-10-21 08:43:22	2015-10-21 08:43:22
uSCqFtyURHUFUy8VjrIChPrCNwtm2SWhfCjsdmmT	165	1445438966	2015-10-21 08:48:37	2015-10-21 08:48:37
56aqIgiXziLUqTb3IlRYePmouECkTvwDotSCV0G0	166	1445439015	2015-10-21 08:49:50	2015-10-21 08:49:50
UdYrFzIbsqCjbVy8XbVga9n0xfPUL2w9A4hU8E53	163	1445440806	2015-10-21 08:42:35	2015-10-21 08:42:35
umA0WCxQUGVXTaPVZDIgSM8hIzHaBLukTghpF18G	168	1445441035	2015-10-21 08:50:44	2015-10-21 08:50:44
Is2VNpVVXMACKBBX3ZwSr6o8yfPLCdoYOS50HNrq	171	1446060627	2015-10-21 12:30:27	2015-10-21 12:30:27
FKhZCZx3CUqDlcTGCZaab5LTbmoopCf9Bv1xnMD6	167	1445464345	2015-10-21 08:49:56	2015-10-21 08:49:56
k7ZIxn6zoTvIsLuJoiGJftsG1jXuUriCHxsrxafA	172	1445470145	2015-10-21 15:52:33	2015-10-21 15:52:33
enaMZgDYEnb5au0PmpAQGNZDAp6x30iaOh1snFB1	169	1445525849	2015-10-21 09:20:09	2015-10-21 09:20:09
tOvkKkF5NS6jFtxsQzVfpbILBtuOwM04tXNfzZmA	174	1445526048	2015-10-22 08:57:33	2015-10-22 08:57:33
PHkeAXL47BM1Rp3gtJumznDqxSFmxDscjmNudmpJ	175	1446134455	2015-10-22 09:00:55	2015-10-22 09:00:55
em4WKKZFyfK7gZoo6Gp6C7qD65zR4EXp0f74NHXv	170	1445526289	2015-10-21 09:24:45	2015-10-21 09:24:45
7HGGy8F1UzzVWqELMwIK4zNVdKJv4nVMHue2BXJc	177	1446134777	2015-10-22 09:06:17	2015-10-22 09:06:17
tbjsJGEEzqjuC0lMMYFgujSR0VZvzeC6YHbyQQ4N	173	1445527338	2015-10-22 08:46:25	2015-10-22 08:46:25
9hq7AoYtVn4P8oZXkrB50tzWpTPOcsheIt5PvIQF	179	1446135806	2015-10-22 09:23:26	2015-10-22 09:23:26
pIxz4mRe1UELgCZdyNDoIE7VwzRfnsy74FJbHQHX	176	1445536997	2015-10-22 09:05:10	2015-10-22 09:05:10
MxWHP2nrxJuBLFwdBcAZNMWBJBJYqGB1E7vl6FlG	178	1445537069	2015-10-22 09:07:56	2015-10-22 09:07:56
0kpQIgIQdpz8W5ES9w2Zd5iB3tdNeYpXTHjSqRJK	180	1445537175	2015-10-22 12:03:55	2015-10-22 12:03:55
hyQgZamkbZfwvwLbj7iW3pMWzr7fs1Ch99eJF6jk	181	1445544793	2015-10-22 12:06:55	2015-10-22 12:06:55
3A62khJ5MyU7ChZtYy3dwjlvWMwRo1mOd05S53YZ	182	1445544944	2015-10-22 14:13:48	2015-10-22 14:13:48
RDrKNuKPy71DKJpj87xCmKLsenTFKLkoo6jjzqen	183	1445545093	2015-10-22 14:15:59	2015-10-22 14:15:59
J536gRD3K9vgesz7piQrI9xhAmeUDYFGWYyv15WL	185	1445610164	2015-10-22 15:23:36	2015-10-22 15:23:36
cyRtsJwEJoxzwnlKlkqemxPlio0n7itivGyJWTbT	184	1445611179	2015-10-22 14:18:29	2015-10-22 14:18:29
1fFd8DVYE1TATkZbZJrNaKY7YkoirQFjWA1ihRRg	186	1445636154	2015-10-23 08:39:55	2015-10-23 08:39:55
GUMXuG9wgS7nLcobvFlJ5s6xc5m7ongMaJHXkHx5	187	1445640964	2015-10-23 10:11:44	2015-10-23 10:11:44
ZgRXInqXZMV3Tr3JIS1u1Aog8Z2wtyeK2KutL1Yl	189	1446477472	2015-10-26 08:17:52	2015-10-26 08:17:52
1KDZvbeaAKbVrFiM9jcGxsoPd4JH9ClzHY0LafBw	190	1446477540	2015-10-26 08:19:00	2015-10-26 08:19:00
10IstpiB9jLODAVd05UrFiJY5gtxE2gLF2FJi1A3	192	1446566743	2015-10-27 09:05:43	2015-10-27 09:05:43
5VnDL5Qk7QJ7RoOjfyJ3FlNLiHSVPRFXLhhe6Jx3	188	1445966744	2015-10-26 07:41:55	2015-10-26 07:41:55
C8AfXUDhI8HiLweD9rHdg5HOcM1vYWawrCTGRaBP	193	1446040030	2015-10-27 11:25:46	2015-10-27 11:25:46
SYfenZHMDEcH3z5qLJ3U0zEbP0hv4hi04y7Opb0B	194	1446648440	2015-10-28 07:47:20	2015-10-28 07:47:20
ccyzUu0CSVWwkEXbRWxdwwgHG5N4zkVaiAATFVGS	195	1446668443	2015-10-28 13:20:43	2015-10-28 13:20:43
vafaDv3h8jPjgPMO8h9hfYFzi4pGz7lCpo6SVUOr	191	1446070580	2015-10-26 08:47:09	2015-10-26 08:47:09
VwVokRtYN9AZTMC1zamoDAy6wBUSGBxTvOUCqSVH	197	1446708338	2015-10-29 00:25:38	2015-10-29 00:25:38
6Ga1gmycweae9yPUchcJXRkUXoEH1uCAVgKRK5B6	198	1446829039	2015-10-30 09:57:19	2015-10-30 09:57:19
XSy8iyQsu0jDxOWwGjsiEtM2B5ygyOoJMDDb4cH6	196	1446226257	2015-10-28 16:16:39	2015-10-28 16:16:39
Dn3g0D6qXn4iZOKabTLpwiuLPsENtbDWYaSbTzr2	199	1446226365	2015-10-30 11:32:05	2015-10-30 11:32:05
MLWbCMuKl1LnF3ATFyBTANTbWq07WtUHzG0u6mM4	200	1446226452	2015-10-30 11:33:03	2015-10-30 11:33:03
mgnui1giLuBH2QAMUeFZzspJsleSTBDuvCN6N8Mr	201	1446226549	2015-10-30 11:34:40	2015-10-30 11:34:40
m0vEmMTDF6qAajD56xWCQfC4PaNboibRItjdOglN	202	1446834962	2015-10-30 11:36:02	2015-10-30 11:36:02
lqeNspBeQVKDWco8LyMvCThOiEroBATzrQlgejxE	203	1447086863	2015-11-02 08:34:23	2015-11-02 08:34:23
4THNmfMhBiq3XDZJVlKfbGPQxZWtiumRK8MUvycw	205	1447089364	2015-11-02 09:16:04	2015-11-02 09:16:04
bA8r1Uk7Nevbg7WGs6rNfZFuwTM7RzaIHlwFzVhZ	206	1447089784	2015-11-02 09:23:04	2015-11-02 09:23:04
EnPogMXJpGCrm0NyQfrnpXI2tuGhqOdpHUmH3Zln	204	1446509245	2015-11-02 08:58:01	2015-11-02 08:58:01
CH8iZID3GIQzMWMf8vXOvkSiDpp4bZuGmfdFeFb2	207	1447168495	2015-11-03 07:14:55	2015-11-03 07:14:55
Xo3gxkgY6bMDFfsBGy8t5s8tLo5KcItKPhfbTOc1	208	1446581067	2015-11-03 10:19:08	2015-11-03 10:19:08
xf66cQQ1rJ2LWegNVDGW6TFpM6q20XgK1IHfFdm8	209	1447192542	2015-11-03 13:55:42	2015-11-03 13:55:42
jWHLf5m3Rdy3yUqBa5dXf2lULvGMwN6aWmHgqZ7s	210	1447194545	2015-11-03 14:29:05	2015-11-03 14:29:05
H0w7qKNCubsyqn7xnYlUBXMFXIHcrvbR8hVouJXA	211	1447256025	2015-11-04 07:33:45	2015-11-04 07:33:45
NJ264MeBddV0ZutW6LLmh8g2PWjNKB0HZo6C2KKQ	213	1447695673	2015-11-09 09:41:13	2015-11-09 09:41:13
Tzji4HvgbCCiS0ocmEuTvLYlMoK2HeGB2iJ3YDp1	214	1447199037	2015-11-10 15:39:30	2015-11-10 15:39:30
66TLLXi8260dt548IJef15svLvL00WrRFXTNJjtf	215	1447200754	2015-11-10 16:45:22	2015-11-10 16:45:22
g7yAGsQX7z6cAQ5eSyfqVekckEdg9FKWg1KZUVDX	216	1447201161	2015-11-10 17:12:51	2015-11-10 17:12:51
iNmvc5yxm6tJVNJdGGgmcZi9LwZFt8eCddIqn5Cs	212	1447255802	2015-11-09 09:23:04	2015-11-09 09:23:04
UKB1WA0eDzjLyb0KkgvRqmMGMDuD3T1jLbpakwW6	217	1447259115	2015-11-10 17:19:35	2015-11-10 17:19:35
llrABuwbnCWmeycuUsQKpngEkcVmmbYCLlNQZY3q	219	1447259835	2015-11-11 09:25:33	2015-11-11 09:25:33
vdE70z5oG5tt1p7zxO2QboD8i09BmvIWriO8xBqP	220	1447259952	2015-11-11 09:37:28	2015-11-11 09:37:28
CKLspGnmgoWg7QWS06MYgW9VsH0OO4K37BNAKjNW	221	1447260068	2015-11-11 09:39:32	2015-11-11 09:39:32
XCro2zGlrp4atofmKJ7hWyQaW7jhwZcsiiSOsLqY	222	1447260692	2015-11-11 09:41:46	2015-11-11 09:41:46
khEhRKcE8C4CO43BbZ4gs2e7wnBic34BGbgjV4fz	224	1447261060	2015-11-11 09:56:56	2015-11-11 09:56:56
VBaAErbzhJK4uyJXS6eKgHfk5UgckF4NvS2zDZcF	223	1447261236	2015-11-11 09:56:11	2015-11-11 09:56:11
ciMMBkFXW8Nir1aWyCWYiWhbUTLrO4I00nz2JrnS	225	1447261438	2015-11-11 09:57:52	2015-11-11 09:57:52
uP0KyyD24F9w7WUl0aIM81AV9p7kXaeXKvxsDehQ	226	1447869856	2015-11-11 10:04:16	2015-11-11 10:04:16
BIQ58WTKoHQvVZ8sHqPVe0Cdsjs2AJBSd4X2GQ5l	227	1447870270	2015-11-11 10:11:10	2015-11-11 10:11:10
QMvzwejtfAuHjfaxobxv6BxqGi2aDetcEHR8bEEP	229	1447267214	2015-11-11 11:39:40	2015-11-11 11:39:40
87tIPFhXC6zwItO8IkmInlxBdcoNkEDKRU2QmTCC	230	1447276261	2015-11-11 11:52:52	2015-11-11 11:52:52
c8aOjlvOHLgOwi6pj9Yocewg2GQV2FrMfDImgsxH	218	1447350840	2015-11-11 08:30:55	2015-11-11 08:30:55
dMAqI4PhbjciVbehGejKrzqXUzPjcay8cl1A684G	231	1447959266	2015-11-12 10:54:26	2015-11-12 10:54:26
dVryf0LEiTjsoMYp1lA4MTzuJgFBs3GpqJJxvo2l	228	1447352161	2015-11-11 10:25:31	2015-11-11 10:25:31
yG1JoYad6HK6NMAdTQEF6x9EgmM0FGxpl7xgQiuf	232	1447352554	2015-11-12 11:16:18	2015-11-12 11:16:18
zVE1V8DYTXy5dDNZN5FiQxuMusP9iVlumz6SOMYx	233	1447961741	2015-11-12 11:35:41	2015-11-12 11:35:41
BbUaNWS9QBEohVd5IcXd2NOM8iEsLMbi1b5povM1	234	1447354577	2015-11-12 11:54:52	2015-11-12 11:54:52
k4vFe03qxupLDYpHFILZy7OsSTgD13w6dDKDjt22	235	1448037245	2015-11-13 08:34:05	2015-11-13 08:34:05
SvwKS4nfEKYflw52xY9ZaHc9Jgo17xvCkFbfOFdO	236	1447437115	2015-11-13 10:37:34	2015-11-13 10:37:34
fWX7RHUMevJB7NFcMDQBJhHLI5A8qiOQWuWloe3z	237	1448301012	2015-11-16 09:50:12	2015-11-16 09:50:12
gIS08HhndodgWiMJu4o9iwvbVDv0tN2hcwDG9FST	238	1448569411	2015-11-19 12:23:31	2015-11-19 12:23:31
xte8khQyLKi5WUxrOPEupe9C2TEjz2rBFLvYpmMF	239	1448906793	2015-11-23 10:06:33	2015-11-23 10:06:33
SwGZagL9kAukCywA5pG8XWxDOsoDlqcrhaZu5V0v	240	1448927350	2015-11-23 15:49:10	2015-11-23 15:49:10
oBXqcKFfR4XUkhO0plGrZBo4zFvtF3Msi8HLEgts	241	1449502909	2015-11-30 07:41:49	2015-11-30 07:41:49
aoKbLEWe5YrXhgoRB5amrlZf8OjZpR9YI7bWaXSs	242	1449506418	2015-11-30 08:40:18	2015-11-30 08:40:18
emgadJljmOf72Ae4IJo1YUvucVYtOapeoVLLspfq	243	1449511612	2015-11-30 10:06:52	2015-11-30 10:06:52
3rzGMztIu7KUjdpoemdoU7qf9RkeLaSWPddWNNEZ	244	1449512297	2015-11-30 10:18:17	2015-11-30 10:18:17
PQJEXq3zDK7b6tr60iyw0qLWgRQiaLC3Dc5fzK9W	245	1449532329	2015-11-30 15:52:09	2015-11-30 15:52:09
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
92	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-12 11:27:36	2015-10-12 11:27:36
93	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-12 11:37:20	2015-10-12 11:37:20
94	11D0DDFEAEFE5AE6D38C3A88F471552E	user	616	\N	2015-10-12 13:25:29	2015-10-12 13:25:29
95	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-12 13:50:05	2015-10-12 13:50:05
96	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-12 14:00:07	2015-10-12 14:00:07
97	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-12 14:27:14	2015-10-12 14:27:14
98	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-12 14:41:06	2015-10-12 14:41:06
99	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-12 14:41:44	2015-10-12 14:41:44
100	11D0DDFEAEFE5AE6D38C3A88F471552E	user	614	\N	2015-10-12 15:45:32	2015-10-12 15:45:32
101	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-12 19:00:26	2015-10-12 19:00:26
102	11D0DDFEAEFE5AE6D38C3A88F471552E	user	616	\N	2015-10-13 08:15:53	2015-10-13 08:15:53
103	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-13 08:44:05	2015-10-13 08:44:05
104	11D0DDFEAEFE5AE6D38C3A88F471552E	user	614	\N	2015-10-13 09:05:27	2015-10-13 09:05:27
105	11D0DDFEAEFE5AE6D38C3A88F471552E	user	621	\N	2015-10-13 09:14:50	2015-10-13 09:14:50
106	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-13 09:15:32	2015-10-13 09:15:32
107	11D0DDFEAEFE5AE6D38C3A88F471552E	user	620	\N	2015-10-13 11:05:50	2015-10-13 11:05:50
108	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-13 11:33:11	2015-10-13 11:33:11
109	11D0DDFEAEFE5AE6D38C3A88F471552E	user	616	\N	2015-10-13 11:52:29	2015-10-13 11:52:29
110	11D0DDFEAEFE5AE6D38C3A88F471552E	user	614	\N	2015-10-14 09:10:47	2015-10-14 09:10:47
111	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-14 09:19:54	2015-10-14 09:19:54
112	11D0DDFEAEFE5AE6D38C3A88F471552E	user	618	\N	2015-10-14 12:44:44	2015-10-14 12:44:44
113	11D0DDFEAEFE5AE6D38C3A88F471552E	user	616	\N	2015-10-14 15:02:27	2015-10-14 15:02:27
114	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-14 15:20:05	2015-10-14 15:20:05
115	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-15 08:37:43	2015-10-15 08:37:43
116	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-15 08:53:58	2015-10-15 08:53:58
117	11D0DDFEAEFE5AE6D38C3A88F471552E	user	614	\N	2015-10-15 09:10:06	2015-10-15 09:10:06
118	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-15 16:57:21	2015-10-15 16:57:21
119	11D0DDFEAEFE5AE6D38C3A88F471552E	user	617	\N	2015-10-16 08:46:26	2015-10-16 08:46:26
120	11D0DDFEAEFE5AE6D38C3A88F471552E	user	620	\N	2015-10-16 09:06:39	2015-10-16 09:06:39
121	11D0DDFEAEFE5AE6D38C3A88F471552E	user	614	\N	2015-10-16 11:25:34	2015-10-16 11:25:34
122	11D0DDFEAEFE5AE6D38C3A88F471552E	user	621	\N	2015-10-16 11:41:15	2015-10-16 11:41:15
123	11D0DDFEAEFE5AE6D38C3A88F471552E	user	616	\N	2015-10-16 11:48:07	2015-10-16 11:48:07
124	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-16 12:00:41	2015-10-16 12:00:41
125	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-16 12:04:04	2015-10-16 12:04:04
126	11D0DDFEAEFE5AE6D38C3A88F471552E	user	617	\N	2015-10-16 12:04:18	2015-10-16 12:04:18
127	11D0DDFEAEFE5AE6D38C3A88F471552E	user	614	\N	2015-10-16 12:05:02	2015-10-16 12:05:02
128	11D0DDFEAEFE5AE6D38C3A88F471552E	user	617	\N	2015-10-16 12:31:19	2015-10-16 12:31:19
129	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-16 12:44:56	2015-10-16 12:44:56
130	11D0DDFEAEFE5AE6D38C3A88F471552E	user	624	\N	2015-10-16 12:49:09	2015-10-16 12:49:09
131	11D0DDFEAEFE5AE6D38C3A88F471552E	user	624	\N	2015-10-16 12:58:23	2015-10-16 12:58:23
132	11D0DDFEAEFE5AE6D38C3A88F471552E	user	616	\N	2015-10-16 14:53:12	2015-10-16 14:53:12
133	11D0DDFEAEFE5AE6D38C3A88F471552E	user	624	\N	2015-10-16 15:16:11	2015-10-16 15:16:11
134	11D0DDFEAEFE5AE6D38C3A88F471552E	user	624	\N	2015-10-16 16:41:34	2015-10-16 16:41:34
135	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-16 16:43:46	2015-10-16 16:43:46
136	11D0DDFEAEFE5AE6D38C3A88F471552E	user	624	\N	2015-10-19 07:48:32	2015-10-19 07:48:32
137	11D0DDFEAEFE5AE6D38C3A88F471552E	user	624	\N	2015-10-19 08:19:32	2015-10-19 08:19:32
138	11D0DDFEAEFE5AE6D38C3A88F471552E	user	614	\N	2015-10-19 09:11:04	2015-10-19 09:11:04
139	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-19 10:58:38	2015-10-19 10:58:38
140	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-19 11:12:33	2015-10-19 11:12:33
141	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-19 11:37:09	2015-10-19 11:37:09
142	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-19 11:53:49	2015-10-19 11:53:49
143	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-19 12:33:00	2015-10-19 12:33:00
144	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-19 12:43:18	2015-10-19 12:43:18
145	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-19 12:57:09	2015-10-19 12:57:09
146	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-19 15:42:56	2015-10-19 15:42:56
147	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-20 07:44:15	2015-10-20 07:44:15
148	11D0DDFEAEFE5AE6D38C3A88F471552E	user	614	\N	2015-10-20 09:04:31	2015-10-20 09:04:31
149	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-20 10:09:54	2015-10-20 10:09:54
150	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-20 10:10:13	2015-10-20 10:10:13
151	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-20 10:10:28	2015-10-20 10:10:28
152	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-20 10:21:38	2015-10-20 10:21:38
153	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-20 11:01:45	2015-10-20 11:01:45
154	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-20 11:10:50	2015-10-20 11:10:50
155	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-20 11:12:16	2015-10-20 11:12:16
156	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-20 11:32:35	2015-10-20 11:32:35
157	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-10-20 11:42:09	2015-10-20 11:42:09
158	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-20 11:47:21	2015-10-20 11:47:21
159	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-20 11:52:40	2015-10-20 11:52:40
160	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-20 13:41:51	2015-10-20 13:41:51
161	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-20 17:37:41	2015-10-20 17:37:41
162	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-21 08:42:18	2015-10-21 08:42:18
163	11D0DDFEAEFE5AE6D38C3A88F471552E	user	618	\N	2015-10-21 08:42:35	2015-10-21 08:42:35
164	11D0DDFEAEFE5AE6D38C3A88F471552E	user	625	\N	2015-10-21 08:43:22	2015-10-21 08:43:22
165	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-21 08:48:37	2015-10-21 08:48:37
166	11D0DDFEAEFE5AE6D38C3A88F471552E	user	625	\N	2015-10-21 08:49:50	2015-10-21 08:49:50
167	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-21 08:49:56	2015-10-21 08:49:56
168	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-21 08:50:44	2015-10-21 08:50:44
169	11D0DDFEAEFE5AE6D38C3A88F471552E	user	618	\N	2015-10-21 09:20:09	2015-10-21 09:20:09
170	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-21 09:24:45	2015-10-21 09:24:45
171	11D0DDFEAEFE5AE6D38C3A88F471552E	user	621	\N	2015-10-21 12:30:27	2015-10-21 12:30:27
172	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-21 15:52:33	2015-10-21 15:52:33
173	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-10-22 08:46:25	2015-10-22 08:46:25
174	11D0DDFEAEFE5AE6D38C3A88F471552E	user	618	\N	2015-10-22 08:57:33	2015-10-22 08:57:33
175	11D0DDFEAEFE5AE6D38C3A88F471552E	user	618	\N	2015-10-22 09:00:55	2015-10-22 09:00:55
176	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-22 09:05:10	2015-10-22 09:05:10
177	11D0DDFEAEFE5AE6D38C3A88F471552E	user	620	\N	2015-10-22 09:06:17	2015-10-22 09:06:17
178	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-22 09:07:56	2015-10-22 09:07:56
179	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-10-22 09:23:26	2015-10-22 09:23:26
180	11D0DDFEAEFE5AE6D38C3A88F471552E	user	625	\N	2015-10-22 12:03:55	2015-10-22 12:03:55
181	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-22 12:06:55	2015-10-22 12:06:55
182	11D0DDFEAEFE5AE6D38C3A88F471552E	user	625	\N	2015-10-22 14:13:48	2015-10-22 14:13:48
183	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-22 14:15:59	2015-10-22 14:15:59
184	11D0DDFEAEFE5AE6D38C3A88F471552E	user	625	\N	2015-10-22 14:18:29	2015-10-22 14:18:29
185	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-22 15:23:36	2015-10-22 15:23:36
186	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-23 08:39:55	2015-10-23 08:39:55
187	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-23 10:11:44	2015-10-23 10:11:44
188	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-26 07:41:55	2015-10-26 07:41:55
189	11D0DDFEAEFE5AE6D38C3A88F471552E	user	616	\N	2015-10-26 08:17:52	2015-10-26 08:17:52
190	11D0DDFEAEFE5AE6D38C3A88F471552E	user	616	\N	2015-10-26 08:19:00	2015-10-26 08:19:00
191	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-26 08:47:09	2015-10-26 08:47:09
192	11D0DDFEAEFE5AE6D38C3A88F471552E	user	614	\N	2015-10-27 09:05:43	2015-10-27 09:05:43
193	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-27 11:25:46	2015-10-27 11:25:46
194	11D0DDFEAEFE5AE6D38C3A88F471552E	user	622	\N	2015-10-28 07:47:20	2015-10-28 07:47:20
195	11D0DDFEAEFE5AE6D38C3A88F471552E	user	621	\N	2015-10-28 13:20:43	2015-10-28 13:20:43
196	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-28 16:16:39	2015-10-28 16:16:39
197	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-29 00:25:38	2015-10-29 00:25:38
198	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-10-30 09:57:19	2015-10-30 09:57:19
199	11D0DDFEAEFE5AE6D38C3A88F471552E	user	625	\N	2015-10-30 11:32:05	2015-10-30 11:32:05
200	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-30 11:33:03	2015-10-30 11:33:03
201	11D0DDFEAEFE5AE6D38C3A88F471552E	user	625	\N	2015-10-30 11:34:40	2015-10-30 11:34:40
202	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-10-30 11:36:02	2015-10-30 11:36:02
203	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-11-02 08:34:23	2015-11-02 08:34:23
204	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-11-02 08:58:01	2015-11-02 08:58:01
205	11D0DDFEAEFE5AE6D38C3A88F471552E	user	614	\N	2015-11-02 09:16:04	2015-11-02 09:16:04
206	11D0DDFEAEFE5AE6D38C3A88F471552E	user	616	\N	2015-11-02 09:23:04	2015-11-02 09:23:04
207	11D0DDFEAEFE5AE6D38C3A88F471552E	user	605	\N	2015-11-03 07:14:55	2015-11-03 07:14:55
208	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-11-03 10:19:08	2015-11-03 10:19:08
209	11D0DDFEAEFE5AE6D38C3A88F471552E	user	612	\N	2015-11-03 13:55:42	2015-11-03 13:55:42
210	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-11-03 14:29:05	2015-11-03 14:29:05
211	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-11-04 07:33:45	2015-11-04 07:33:45
212	11D0DDFEAEFE5AE6D38C3A88F471552E	user	614	\N	2015-11-09 09:23:04	2015-11-09 09:23:04
213	11D0DDFEAEFE5AE6D38C3A88F471552E	user	616	\N	2015-11-09 09:41:13	2015-11-09 09:41:13
214	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-11-10 15:39:30	2015-11-10 15:39:30
215	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-11-10 16:45:22	2015-11-10 16:45:22
216	11D0DDFEAEFE5AE6D38C3A88F471552E	user	625	\N	2015-11-10 17:12:51	2015-11-10 17:12:51
217	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-11-10 17:19:35	2015-11-10 17:19:35
218	11D0DDFEAEFE5AE6D38C3A88F471552E	user	614	\N	2015-11-11 08:30:55	2015-11-11 08:30:55
219	11D0DDFEAEFE5AE6D38C3A88F471552E	user	625	\N	2015-11-11 09:25:33	2015-11-11 09:25:33
220	11D0DDFEAEFE5AE6D38C3A88F471552E	user	626	\N	2015-11-11 09:37:28	2015-11-11 09:37:28
221	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-11-11 09:39:32	2015-11-11 09:39:32
222	11D0DDFEAEFE5AE6D38C3A88F471552E	user	625	\N	2015-11-11 09:41:46	2015-11-11 09:41:46
223	11D0DDFEAEFE5AE6D38C3A88F471552E	user	626	\N	2015-11-11 09:56:11	2015-11-11 09:56:11
224	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-11-11 09:56:56	2015-11-11 09:56:56
225	11D0DDFEAEFE5AE6D38C3A88F471552E	user	626	\N	2015-11-11 09:57:52	2015-11-11 09:57:52
226	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-11-11 10:04:16	2015-11-11 10:04:16
227	11D0DDFEAEFE5AE6D38C3A88F471552E	user	626	\N	2015-11-11 10:11:10	2015-11-11 10:11:10
228	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-11-11 10:25:31	2015-11-11 10:25:31
229	11D0DDFEAEFE5AE6D38C3A88F471552E	user	626	\N	2015-11-11 11:39:40	2015-11-11 11:39:40
230	11D0DDFEAEFE5AE6D38C3A88F471552E	user	626	\N	2015-11-11 11:52:52	2015-11-11 11:52:52
231	11D0DDFEAEFE5AE6D38C3A88F471552E	user	614	\N	2015-11-12 10:54:26	2015-11-12 10:54:26
232	11D0DDFEAEFE5AE6D38C3A88F471552E	user	614	\N	2015-11-12 11:16:18	2015-11-12 11:16:18
233	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-11-12 11:35:41	2015-11-12 11:35:41
234	11D0DDFEAEFE5AE6D38C3A88F471552E	user	626	\N	2015-11-12 11:54:52	2015-11-12 11:54:52
235	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-11-13 08:34:05	2015-11-13 08:34:05
236	11D0DDFEAEFE5AE6D38C3A88F471552E	user	626	\N	2015-11-13 10:37:34	2015-11-13 10:37:34
237	11D0DDFEAEFE5AE6D38C3A88F471552E	user	616	\N	2015-11-16 09:50:12	2015-11-16 09:50:12
238	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-11-19 12:23:31	2015-11-19 12:23:31
239	11D0DDFEAEFE5AE6D38C3A88F471552E	user	616	\N	2015-11-23 10:06:33	2015-11-23 10:06:33
240	11D0DDFEAEFE5AE6D38C3A88F471552E	user	614	\N	2015-11-23 15:49:10	2015-11-23 15:49:10
241	11D0DDFEAEFE5AE6D38C3A88F471552E	user	615	\N	2015-11-30 07:41:49	2015-11-30 07:41:49
242	11D0DDFEAEFE5AE6D38C3A88F471552E	user	611	\N	2015-11-30 08:40:18	2015-11-30 08:40:18
243	11D0DDFEAEFE5AE6D38C3A88F471552E	user	616	\N	2015-11-30 10:06:52	2015-11-30 10:06:52
244	11D0DDFEAEFE5AE6D38C3A88F471552E	user	616	\N	2015-11-30 10:18:17	2015-11-30 10:18:17
245	11D0DDFEAEFE5AE6D38C3A88F471552E	user	614	\N	2015-11-30 15:52:09	2015-11-30 15:52:09
\.


--
-- Name: oauth_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth_sessions_id_seq', 245, true);


--
-- Data for Name: passengers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY passengers (id, name, dob, phone, phone_ext, address, ibp, appt_date, client_id, created_at, updated_at) FROM stdin;
6349	Cinthya	1997-05-19	(818) 261-5944	\N	11244 Woodcock Ave Pacoima, CA 91331	neck, upper & lower back	2015-11-05 18:30:00	10218	2015-11-02 17:13:10	2015-11-02 17:13:10
6350	Elodia Avila	1978-10-24	(323) 812-2737	\N	638 W. Corregidor St Compton, CA 90220	stomach, back	2015-11-06 15:00:00	10280	2015-11-05 17:12:35	2015-11-05 17:12:35
6351	Gricelda Avila	1999-06-02	(213) 985-8958	\N	638 W. Corregidor St Compton, CA 90220	neck	2015-11-06 15:30:00	10280	2015-11-05 17:12:35	2015-11-05 17:12:35
6352	Anthony Avila	2002-05-05	(213) 985-8958	\N	638 W. Corregidor St Compton, CA 90220	neck, stomach	2015-11-04 16:00:00	10280	2015-11-05 17:12:35	2015-11-05 17:12:35
6353	Jasmine Jaqueline Quintana Banuelos	1996-02-24	(909) 260-7204	\N	935 W. 2nd Street Rialto, CA 92376	neck, left shoulder, back, hands	2015-11-09 15:30:00	10281	2015-11-05 17:16:48	2015-11-05 17:16:48
6354	Lesly Sanchez Banuelos	2006-12-18	(909) 260-7204	\N	935 W. 2nd Street Rialto, CA 92376	neck, back, legs	2015-11-09 15:30:00	10281	2015-11-05 17:16:48	2015-11-05 17:16:48
6355	Elizabeth Bravo	2000-01-25	(323) 385-4335	\N	8302 S. Main St Apt 1 Los Angeles, CA 90003	head, neck, back	2015-11-11 18:00:00	10293	2015-11-06 15:54:42	2015-11-06 15:54:42
6356	Mauricio Bravo	2001-10-31	(323) 385-4335	\N	8302 S. Main St Apt 1 Los Angeles, CA 90003	head, neck, back	2015-11-11 19:00:00	10293	2015-11-06 15:54:42	2015-11-06 15:54:42
6358	Isel Gutierrez	1993-04-15	(714) 395-0748	\N	2505 Evergreen St Santa Ana, CA 92707	neck, back, rib cage	2015-11-16 15:00:00	10373	2015-11-12 14:55:41	2015-11-12 16:07:08
6359	Oscar Gutierrez	2001-01-31	(714) 395-0748	\N	2505 Evergreen St Santa Ana, CA 92707	neck	2015-11-16 15:00:00	10373	2015-11-12 14:55:41	2015-11-12 16:07:08
6357	Yanet Chavez	1972-09-01	(714) 395-0748	\N	2505 Evergreen St Santa Ana, CA 92707	back, neck	2015-11-16 15:00:00	10373	2015-11-12 14:55:41	2015-11-12 16:07:08
6360	Jorge Issaul Baltazar Barceras	1994-07-10	(323) 704-7402	\N	8407 Wall St. Los Angeles C.A 90003	L. knee, R. Wrist, R. hand, head	2015-11-16 14:00:00	10394	2015-11-13 16:38:42	2015-11-13 16:38:42
\.


--
-- Name: passengers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('passengers_id_seq', 6360, true);


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
39	Confirmed by the Dr. himself	1	2015-07-21 19:19:48	2015-07-21 19:19:48	\N
8	1. Hold - No show / Need Atty Status	0	2015-07-20 00:00:00	2015-10-09 17:53:42	2015-10-09 17:53:42
9	2. Hold - Pending appt from clinic	0	2015-07-20 00:00:00	2015-10-09 17:53:42	2015-10-09 17:53:42
10	3. Hold - Pending Atty response	0	2015-07-20 00:00:00	2015-10-09 17:53:42	2015-10-09 17:53:42
11	4. Hold - Missed all appt's	0	2015-07-20 00:00:00	2015-10-09 17:53:42	2015-10-09 17:53:42
13	6. Hold - Need working phone number	0	2015-07-20 00:00:00	2015-10-09 17:53:42	2015-10-09 17:53:42
17	10. Cx'd - Atty dropped case	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
18	11. Cx'd - Client settled case/dropped case	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
19	12. Cx'd - Missed all appt's	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
20	13. Cx'd - No Chiro/Ortho body parts	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
21	14. Cx'd - Dr. rejected case	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
22	15. Cx'd - Client sent to another clinic	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
23	16. Cx'd - Client stayed w/current PTP	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
24	17. Cx'd - Pending Atty response	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
25	18. Cx'd - Clinic pending medical records/paperwork	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
26	19. Cx'd - Client out of State	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
27	20. Cx'd - Client incarcerated	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
28	21. Cx'd - Clinic does not accept WC insurance	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
29	22. Cx'd - Client having SX	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
30	23. Cx'd - Client pregnant	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
31	24. Cx'd - Client subbed out Atty	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
32	25. Cx'd - Atty sent to MPN Dr.	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
33	26. Cx'd - Client completed all treatment	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
34	27. Cx'd - Client Deceased	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
35	28. Cx'd - No contact w/client per Atty	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
36	29. Cx'd - No working phone number	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
37	30. Cx'd - Referral sent in error	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
12	5. Hold - Existing pt w/clinic	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
14	7. Cx'd - No Dr. on MPN	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
15	8. Cx'd - No Dr. in area	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
16	9. Cx'd - Client settled case	0	2015-07-20 00:00:00	2015-10-21 10:02:18	2015-10-21 10:02:18
44	1. HOLD - NO SHOW / NEED ATTY STATUS	0	2015-10-21 10:02:50	2015-10-21 10:02:50	\N
45	2. HOLD - MISSED ALL APPOINTMENTS	0	2015-10-21 10:03:11	2015-10-21 10:03:11	\N
46	3. HOLD - EXISTING PATIENT WITH CLINIC	0	2015-10-21 10:03:35	2015-10-21 10:03:35	\N
47	4. CX'D - NO DR. ON MPN	0	2015-10-21 10:03:57	2015-10-21 10:03:57	\N
48	5. CX'D - NO DR. IN AREA	0	2015-10-21 10:04:30	2015-10-21 10:04:44	\N
49	6. CX'D - CLIENT SETTLED/DROPPED CASE	0	2015-10-21 10:05:14	2015-10-21 10:05:14	\N
50	7.  CX'D - ATTY DROPPED CASE	0	2015-10-21 10:05:45	2015-10-21 10:05:45	\N
51	8.  CX'D - NO CHIRO/ORTHO BODY PARTS	0	2015-10-21 10:06:11	2015-10-21 10:06:11	\N
52	9. CX'D - DOCTOR REJECTED CASE	0	2015-10-21 10:06:32	2015-10-21 10:06:32	\N
53	10. CX'D - ATTY SCHEDULED CLIENT W/ANOTHER CLINIC	0	2015-10-21 10:08:16	2015-10-21 10:08:16	\N
54	11. CX'D - CLIENT STAYED W/CURRENT PTP	0	2015-10-21 10:08:56	2015-10-21 10:08:56	\N
55	12. CX'D - PENDING ATTY RESPONSE	0	2015-10-21 10:09:18	2015-10-21 10:09:18	\N
56	13. CX'D - CLINIC NEEDS MEDICAL RECORDS TO CONTINUE TRATMENT	0	2015-10-21 10:09:56	2015-10-21 10:09:56	\N
57	14. CX'D - CLIENT OUT OF STATE	0	2015-10-21 10:10:20	2015-10-21 10:10:20	\N
58	15. CX'D - CLIENT INCARCERATED	0	2015-10-21 10:10:37	2015-10-21 10:10:37	\N
59	16. CX'D - CLINIC DOES NOT ACCEPT CLIENTS WC INSURANCE	0	2015-10-21 10:12:12	2015-10-21 10:12:12	\N
60	17. CX'D - CLIENT HAVING SX	0	2015-10-21 10:12:39	2015-10-21 10:12:39	\N
61	18. CX'D - CLIENT PREGNANT	0	2015-10-21 10:13:00	2015-10-21 10:13:00	\N
62	19. CX'D - CLIENT SUBBED OUT ATTORNEY	0	2015-10-21 10:13:37	2015-10-21 10:13:37	\N
63	20. CX'D - ATTORNEY SCHEDULED CLIENT WITH MPN DOCTOR	0	2015-10-21 10:14:19	2015-10-21 10:14:19	\N
64	21. CX'D - CLIENT COMPLETED ALL TREATMENT	0	2015-10-21 10:15:05	2015-10-21 10:15:05	\N
65	22. CX'D - CLIENT DECEASED	0	2015-10-21 10:15:28	2015-10-21 10:15:28	\N
66	CX'D - NO WORKING PHONE NUMBER FOR CLIENT	0	2015-10-21 10:15:52	2015-10-21 10:15:52	\N
68	24. CX'D - PER ATTORNEY NOT THEIR CLIENT	0	2015-10-21 10:16:48	2015-10-21 10:16:48	\N
69	25. CX'D - NO CONTACT WITH CLIENT IN ORDER TO SCHEDULE	0	2015-10-21 10:17:35	2015-10-21 10:17:35	\N
70	26. CX'D - ADJUSTER DID NOT AUTHORIZE TREATMENT	0	2015-10-21 10:18:00	2015-10-21 10:18:00	\N
71	27. CX'D - DOI TOO OLD	0	2015-10-21 10:18:39	2015-10-21 10:18:39	\N
72	28. CX'D - CLIENT PAID IN CASH	0	2015-10-21 10:21:24	2015-10-21 10:21:24	\N
67	23. CX'D - APPOINTMENT REQUEST SENT IN ERROR	0	2015-10-21 10:16:23	2015-11-10 11:44:42	\N
73	29. CX'D - MISSED ALL APPOINTMENTS	0	2015-11-10 11:45:38	2015-11-10 11:45:38	\N
\.


--
-- Name: reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reasons_id_seq', 73, true);


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
10	2015-09-29 15:04:11	2015-10-03 22:53:36	Latests added	{"name": "Latests added", "sort": [{"field": "clinic_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Record ID#", "value": "id"}, {"text": "First Name", "value": "firstname"}, {"text": "Last Name", "value": "lastname"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "Last Updated By", "value": "updatedBy"}], "filters": [{"field": "date_of_referral", "value": "2014-01-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2014-06-30", "condition": "before_on"}], "allow_edit": false, "allow_view": false, "share_type": "0", "v1/reports": "", "filter_match": "AND", "show_summary": true, "v1/reports/10": ""}	{607,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,603,608,604,610,609}	605	0
49	2015-10-20 08:45:02	2015-10-29 00:27:06	Verifications	{"name": "Verifications", "sort": [{"field": "clinic_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [622, 615, 620], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}], "filters": [{"field": "appt_date", "value": 1, "condition": "is_yesterday"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND", "show_summary": true, "v1/reports/49": ""}	{622,615,620}	615	0
7	2015-09-29 08:33:32	2015-10-21 16:31:09	Cases Recently Added	{"name": "Cases Recently Added", "sort": [], "type": "table", "access": [622, 618, 613, 614, 615, 616, 611, 612, 621, 620], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Record ID#", "value": "id"}, {"text": "First Name", "value": "firstname"}, {"text": "Last Name", "value": "lastname"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "Last Updated By", "value": "updatedBy"}], "filters": [{"field": "date_of_referral", "value": "2015-07-01", "condition": "on_after"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "description": "Default Report", "filter_match": "AND", "v1/reports/7": "", "default_report": true, "description_on_report_page": true}	{622,618,613,614,615,616,611,612,621,620}	611	1
12	2015-10-15 08:48:28	2015-10-19 14:36:20	Keystone Health Group	{"name": "Keystone Health Group", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1119], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND", "show_summary": true, "v1/reports/12": ""}	{613,614,612}	611	0
11	2015-10-13 11:32:08	2015-10-19 14:37:04	MedNation	{"name": "MedNation", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 615, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1097, 1115], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND", "show_summary": true, "v1/reports/11": ""}	{613,614,615,612}	611	0
14	2015-10-19 12:31:29	2015-10-19 14:36:39	Keystone Health Group (ATTY)	{"name": "Keystone Health Group (ATTY)", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "First Name", "value": "firstname"}, {"text": "Last Name", "value": "lastname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1119], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "not_in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND", "show_summary": false, "v1/reports/14": ""}	{613,614,612}	611	0
13	2015-10-15 09:45:36	2015-10-19 14:37:25	MedNation (Atty)	{"name": "MedNation (Atty)", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 615, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1097, 1115], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "not_in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND", "show_summary": true, "v1/reports/13": ""}	{613,614,615,612}	611	0
18	2015-10-19 13:55:22	2015-10-19 14:34:06	Advance Care (ATTY)	{"name": "Advance Care (ATTY)", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1111, 1093, 1077, 1129], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "not_in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND", "v1/reports/18": ""}	{613,614,612}	611	0
20	2015-10-19 14:10:04	2015-10-19 14:35:02	Bakersfield Medical Group (ATTY)	{"name": "Bakersfield Medical Group (ATTY)", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "First Name", "value": "firstname"}, {"text": "Last Name", "value": "lastname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1159], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "not_in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND", "v1/reports/20": ""}	{613,614,612}	611	0
16	2015-10-19 13:51:33	2015-10-19 14:35:52	Gutierrez Chiropractic (ATTY)	{"name": "Gutierrez Chiropractic (ATTY)", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1137, 1112], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "not_in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND", "v1/reports/16": ""}	{613,614,612}	611	0
21	2015-10-19 14:23:21	2015-10-19 14:23:21	Dr. Nikta Andalib, DC	{"name": "Dr. Nikta Andalib, DC", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-09-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-09-30", "condition": "before_on"}, {"field": "clinic_name", "value": [1151], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "in"}], "allow_edit": false, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
22	2015-10-19 14:33:26	2015-10-19 14:33:26	Dr. Nikta Andalib, DC (ATTY)	{"name": "Dr. Nikta Andalib, DC (ATTY)", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1151], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "not_in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
17	2015-10-19 13:53:25	2015-11-06 17:27:53	Advance Care	{"name": "Advance Care", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "Patient Treating", "value": "patient_treating"}, {"text": "First Seen", "value": "first_seen"}], "filters": [{"field": "date_of_referral", "value": "2015-11-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-11-30", "condition": "before_on"}, {"field": "clinic_name", "value": [1093, 1129, 1111, 1077], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND", "v1/reports/17": ""}	{613,614,612}	611	0
23	2015-10-19 14:39:17	2015-10-19 14:39:17	Glendale Urgency Chiropractic Clinic	{"name": "Glendale Urgency Chiropractic Clinic", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1087], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
24	2015-10-19 14:41:15	2015-10-19 14:41:15	Glendale Urgency Chiropractic Clinic (ATTY)	{"name": "Glendale Urgency Chiropractic Clinic (ATTY)", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1087], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "not_in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
25	2015-10-19 14:43:14	2015-10-19 14:43:14	Gogatz Chiropractic	{"name": "Gogatz Chiropractic", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1103], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
26	2015-10-19 14:45:02	2015-10-19 14:45:02	Gogatz Chiropractic (ATTY)	{"name": "Gogatz Chiropractic (ATTY)", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1103], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "not_in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
27	2015-10-19 14:46:40	2015-10-19 14:46:40	Greenfield Integrated	{"name": "Greenfield Integrated", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1074], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
28	2015-10-19 14:48:30	2015-10-19 14:48:30	Greenfield Integrated (ATTY)	{"name": "Greenfield Integrated (ATTY)", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1074], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "not_in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
29	2015-10-19 14:51:02	2015-10-19 14:51:02	Harout Balian, MD	{"name": "Harout Balian, MD", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1102], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
30	2015-10-19 14:52:20	2015-10-19 14:52:20	Harout Balian, MD (ATTY)	{"name": "Harout Balian, MD (ATTY)", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1102], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "not_in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
31	2015-10-19 15:26:32	2015-10-19 15:26:32	Industrial Healthcare Physicians Medical Group Inc.	{"name": "Industrial Healthcare Physicians Medical Group Inc.", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1148], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
32	2015-10-19 15:30:18	2015-10-19 15:30:18	Industrial Healthcare Physicians Medical Group Inc. (ATTY)	{"name": "Industrial Healthcare Physicians Medical Group Inc. (ATTY)", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1148], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "not_in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
33	2015-10-19 15:32:45	2015-10-19 15:32:45	Industrial Treatment & Rehabilitation Center	{"name": "Industrial Treatment & Rehabilitation Center", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1146], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
34	2015-10-19 15:36:05	2015-10-19 15:36:05	Industrial Treatment & Rehabilitation Center (ATTY)	{"name": "Industrial Treatment & Rehabilitation Center (ATTY)", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1146], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "not_in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
35	2015-10-19 15:37:53	2015-10-19 15:37:53	Innovative Medical Management	{"name": "Innovative Medical Management", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1153], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
36	2015-10-19 15:39:54	2015-10-19 15:39:54	Innovative Medical Management (ATTY)	{"name": "Innovative Medical Management (ATTY)", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1153], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "not_in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
37	2015-10-19 15:42:21	2015-10-19 15:42:21	Lighthouse Medical Management	{"name": "Lighthouse Medical Management", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1128, 1089, 1086], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
38	2015-10-19 15:45:25	2015-10-19 15:45:25	Lighthouse Medical Management (ATTY)	{"name": "Lighthouse Medical Management (ATTY)", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1128, 1089, 1086], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "not_in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
39	2015-10-19 15:59:01	2015-10-19 15:59:01	Montgomery Chiropractic	{"name": "Montgomery Chiropractic", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1139, 1125, 1120], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
40	2015-10-19 16:03:23	2015-10-19 16:03:23	Montgomery Chiropractic (ATTY)	{"name": "Montgomery Chiropractic (ATTY)", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1139, 1125, 1120], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "not_in"}], "allow_edit": false, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
41	2015-10-19 16:05:09	2015-10-19 16:05:09	NobleQuest	{"name": "NobleQuest", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1152], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
42	2015-10-19 16:06:36	2015-10-19 16:06:36	NobleQuest (ATTY)	{"name": "NobleQuest (ATTY)", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1152], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "not_in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
43	2015-10-19 16:09:44	2015-10-19 16:09:44	RB Spine Center	{"name": "RB Spine Center", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1164, 1163, 1162, 1161], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
44	2015-10-19 16:11:28	2015-10-19 16:11:28	RB Spine Center (ATTY)	{"name": "RB Spine Center (ATTY)", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1164, 1163, 1162, 1161], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "not_in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
45	2015-10-19 16:13:03	2015-10-19 16:13:03	So Cal Chiros	{"name": "So Cal Chiros", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1073, 1072], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
46	2015-10-19 16:14:49	2015-10-19 16:14:49	So Cal Chiros (ATTY)	{"name": "So Cal Chiros (ATTY)", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1073, 1072], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "not_in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
47	2015-10-19 16:16:43	2015-10-19 16:16:43	Southland Spine	{"name": "Southland Spine", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1081, 1121], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
48	2015-10-19 16:18:32	2015-10-19 16:18:32	Southland Spine (ATTY)	{"name": "Southland Spine (ATTY)", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-10-31", "condition": "before_on"}, {"field": "clinic_name", "value": [1081, 1121], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "not_in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND"}	{613,614,612}	611	0
19	2015-10-19 14:08:38	2015-11-03 14:43:12	Bakersfield Medical Group	{"name": "Bakersfield Medical Group", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "First Name", "value": "firstname"}, {"text": "Last Name", "value": "lastname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-11-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-11-30", "condition": "before_on"}, {"field": "clinic_name", "value": [1159], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND", "v1/reports/19": ""}	{613,614,612}	612	0
50	2015-10-20 11:05:23	2015-11-10 16:51:36	G. John Jansen	{"name": "G. John Jansen", "sort": [{"field": "clinic_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [625], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}, {"text": "Last Updated By", "value": "updated_by"}], "filters": [{"field": "date_of_referral", "value": "2015-10-01", "condition": "on_after"}, {"field": "attorney_name", "value": [610], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND", "v1/reports/50": ""}	{625}	611	0
51	2015-10-20 13:50:30	2015-11-24 10:24:53	Verifications	{"name": "Verifications", "sort": [{"field": "clinic_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [620], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "appt_date", "value": "2015-11-21", "condition": "on_after"}, {"field": "appt_date", "value": "2015-11-23", "condition": "before_on"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND", "v1/reports/51": ""}	{620}	611	0
52	2015-11-10 12:20:28	2015-11-10 12:21:02	Monthly Clinics Report	{"name": "Monthly Clinics Report", "sort": [{"field": "clinic_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Record ID#", "value": "id"}, {"text": "First Name", "value": "firstname"}, {"text": "Last Name", "value": "lastname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}, {"text": "Created By", "value": "created_by"}], "filters": [{"field": "date_of_referral", "value": "2015-11-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-11-30", "condition": "before_on"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND", "show_summary": true, "v1/reports/52": ""}	{613,614,612}	611	0
15	2015-10-19 13:49:48	2015-11-24 09:06:11	Gutierrez Chiropractic	{"name": "Gutierrez Chiropractic", "sort": [{"field": "attorney_name", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [613, 614, 612], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}], "filters": [{"field": "date_of_referral", "value": "2015-11-01", "condition": "on_after"}, {"field": "date_of_referral", "value": "2015-11-30", "condition": "before_on"}, {"field": "clinic_name", "value": [1137, 1112], "condition": "in"}, {"field": "lawoffice_name", "value": [1176], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND", "v1/reports/15": ""}	{613,614,612}	611	0
53	2015-11-10 16:50:57	2015-11-11 09:57:36	Rezai & Assc. Clients	{"name": "Rezai & Assc. Clients", "sort": [{"field": "lastname", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [626], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}, {"text": "Last Updated By", "value": "updatedBy"}], "filters": [{"field": "date_of_referral", "value": "2015-11-01", "condition": "on_after"}, {"field": "attorney_name", "value": [612], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND", "v1/reports/53": ""}	{626}	611	0
54	2015-11-20 12:09:30	2015-11-20 12:09:30	RSnyder Law Frim	{"name": "RSnyder Law Frim", "sort": [{"field": "lastname", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [627], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "Last Name", "value": "lastname"}, {"text": "First Name", "value": "firstname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Patient Treating", "value": "patient_treating"}, {"text": "Last Updated By", "value": "updatedBy"}], "filters": [{"field": "date_of_referral", "value": "2015-11-01", "condition": "on_after"}, {"field": "attorney_name", "value": [817], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND", "show_summary": false}	{627}	611	0
55	2015-11-24 13:51:49	2015-11-24 13:52:31	Your Doctor Connection	{"name": "Your Doctor Connection", "sort": [{"field": "lastname", "order": "sort_group_low_high", "value": null}], "type": "table", "access": [628], "columns": [{"text": "Date of Case", "value": "date_of_referral"}, {"text": "First Name", "value": "firstname"}, {"text": "Last Name", "value": "lastname"}, {"text": "Case Type", "value": "case_type"}, {"text": "Date of Birth", "value": "dob"}, {"text": "Clinic", "value": "clinic_name"}, {"text": "Dr. Scheduled with:", "value": "doctor_name"}, {"text": "Appt. Date", "value": "appt_date"}, {"text": "Attorney Name", "value": "attorney_name"}, {"text": "First Seen", "value": "first_seen"}, {"text": "Last Updated By", "value": "updatedBy"}], "filters": [{"field": "date_of_referral", "value": "2015-11-01", "condition": "on_after"}, {"field": "lawoffice_name", "value": [1168], "condition": "in"}], "allow_edit": true, "allow_view": true, "share_type": "1", "v1/reports": "", "filter_match": "AND", "v1/reports/55": ""}	{628}	611	0
\.


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reports_id_seq', 55, true);


--
-- Data for Name: requesting_offices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY requesting_offices (id, name, address1, address2, city, zipcode, phone, fax, contact, email, alt_phone, is_lawoffice, created_at, updated_at, is_insurance, is_clinic, link, username, pass, county, insurance_url, insurance_login, insurance_pass, notes, deleted_at) FROM stdin;
1168	Your Doctor Connection	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1176	Other	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-05 10:53:26	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
1175	The Nielsen Firm	3250 Wilshire Blvd, Suite 1510, Los Angeles, Ca 90010	\N	Los Angeles	90010	(213) 386-1111	(213) 386-2594	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-06 17:29:20	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1229	Pasadena USD	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1234	State Comp Ins. Fund (SCIF)	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1235	Seabright Brightcure Network	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1236	Seabright CA Broadbased Network	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 11:04:08	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1167	DSJ	N/A	\N	Los Angeles	90001	(714) 963-4655	\N	Blanca/ Claudia/ Juana	\N	\N	1	2015-10-05 10:53:26	2015-10-13 14:06:48	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1177	Impressive	N/A	\N	Los Angeles	90001	(562) 298-4170	\N	Kristina/ Breanna	\N	\N	1	2015-10-05 10:53:26	2015-10-13 14:08:00	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1170	Law Office of Lionel Giron	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-13 14:12:19	0	0	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-13 14:12:19
1169	Law Offices of G. John Jansen	2114 N. Broadway Boulevard, Santa Ana, Ca 92706	\N	Santa Ana	92706	(714) 560-1647	(714) 617-7002	Humberto	\N	\N	1	2015-10-05 10:53:26	2015-10-13 14:20:30	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1172	Law Offices of Jon M. Woods	3250 E. Willow Street, Signal, Ca 90755	\N	Signal Hill	90755	(562) 426-3244	(562) 426-2712	Marlene	\N	\N	1	2015-10-05 10:53:26	2015-10-13 14:22:13	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1173	Law Office of Maricela Bermudez	3540 Wilshire Blvd	Suite 301	Los Angeles	90010	(213) 380-1622	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-13 14:28:17	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
1070	Rudolph Multi Specialty Group	10399 Lemon Avenue	Suite 105 Alta Loma	Los Angeles	91737	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:47	2015-10-13 13:59:25	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	2015-10-13 13:59:25
1109	C.O.R. Medical Grp	1405 W. Rancho Vista Blvd.		Palmdale	93551	(661) 274-8725	(661) 274-8205	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:51:54	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	2015-10-13 13:51:54
1099	Dr. Jalil Rashti	3800 East Cesar Chavez Ave		Los Angeles	90063	(818) 386-1823	(818) 907-0255	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:52:05	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	2015-10-13 13:52:05
1082	Dr. Jalil Rashti	16661 Ventura Blvd	Suite 701 Encino	Los Angeles	91436	(818) 386-1823	(818) 907-0255	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:52:22	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	2015-10-13 13:52:22
1101	First Line Health	3303 Wilshire Blvd	Suite 1225	Los Angeles	90010	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:13	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	2015-10-13 13:53:13
1090	First Line Health	6522 Pacific Blvd.		Huntington Park	90255	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:13	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	2015-10-13 13:53:13
1076	First Line Health	2920 "F" Street	Suite 15	Bakersfield	93301	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:13	0	1	\N	\N	\N	Kern	\N	\N	\N	\N	2015-10-13 13:53:13
1080	First Line Health	420 Heffernan Ave	Suite B-1	Calexico	92231	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:13	0	1	\N	\N	\N	Imperial	\N	\N	\N	\N	2015-10-13 13:53:13
1084	First Line Health	240 S. Hickory	Suite 106	Escondido	92025	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:13	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	2015-10-13 13:53:13
1092	First Line Health	44075 Jackson Street	Suite C	Indio	92201	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:13	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	2015-10-13 13:53:13
1095	First Line Health	4300 Long Beach Blvd	Suite 170	Long Beach	90807	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:13	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	2015-10-13 13:53:13
1107	First Line Health	3602 Inland Empire Blvd	Suite 120 Building B	Ontario	91764	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:13	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	2015-10-13 13:53:13
1114	First Line Health	10832 Laurel St.	Suite 206	Rancho Cucamonga	91730	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:13	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	2015-10-13 13:53:13
1110	First Line Health	1645 E. Palmdale Blvd.	Suite D	Palmdale	93550	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:13	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	2015-10-13 13:53:13
1075	MedNation	2920 F Street	Suite C-5	Bakersfield	93301	(818) 697-6190	(888) 391-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:58	0	1	\N	\N	\N	Kern	\N	\N	\N	\N	2015-10-13 13:53:58
1108	MedNation	1555 West 5th Street	Suite 270	Oxnard	93003	(818) 697-6190	(888) 391-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:58	0	1	\N	\N	\N	Ventura	\N	\N	\N	\N	2015-10-13 13:53:58
1085	MedNation	5339 North Fresno	Suite 105	Fresno	93710	(818) 697-6190	(888) 391-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:57:50	0	1	\N	\N	\N	Fresno	\N	\N	\N	\N	2015-10-13 13:57:50
1078	Rise Wellness Center	5030 Bonita Rd.	Suite B Bonita	Los Angeles	91902	(619) 479-7473	(619) 479-9376	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:59:25	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	2015-10-13 13:59:25
1105	Rise Wellness Center	3231 Waring Court	Suite N	Oceanside	92056	(619) 794-2099	(619) 362-9616	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:59:25	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	2015-10-13 13:59:25
1091	Rudolph Multi Specialty Group	81557 Doctor Carreon Blvd	Suite B5 Indio	Indio	92201	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:59:25	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	2015-10-13 13:59:25
1113	Rudolph Multi Specialty Group	8337 Telegraph Road	Suite 214	Pico Rivera	90660	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:59:25	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	2015-10-13 13:59:25
1104	Rudolph Multi Specialty Group	5900 Shattuck Avenue	Suite 201	Oakland	94601	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:59:25	0	1	\N	\N	\N	Alameda	\N	\N	\N	\N	2015-10-13 13:59:25
1088	Rudolph Multi Specialty Group.	10918 Hesperia Road	Suite B	Hesperia	92345	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:59:25	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	2015-10-13 13:59:25
1100	SCOP	8610 South Sepulveda Blvd.	Suite 109	Los Angeles	90045	(310) 337-3700	(310) 337-1643	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:59:25	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	2015-10-13 13:59:25
1116	Spine & Orthopedic Center	7300 Magnolia Avenue		Riverside	92504	(951) 710-1030	(951) 710-1040	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:59:25	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	2015-10-13 13:59:25
1094	Willow Medical Group	3311 E. Willow St.		Long Beach	90806	(562) 424-4976	(562) 424-5960	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:59:25	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	2015-10-13 13:59:25
1079	Crosby Square Chiro	420 Heffernan Ave	Suite B-1	Calexico	92231	(619) 238-0096	(619) 232-7046	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 14:01:09	0	1	\N	\N	\N	Imperial	\N	\N	\N	\N	2015-10-13 14:01:09
1083	Crosby Square Chiro	240 S. Hickory St.	Suite 106	Escondido	92025	(619) 238-0096	(619) 232-7046	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 14:01:09	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	2015-10-13 14:01:09
1073	So Cal Chiros	11525 Brookshire Avenue	Suite 202	Downey	90241	(714) 808-9666	(714) 808-1666	Marisol	intake@socalchiros.com	\N	0	2015-10-05 01:24:47	2015-10-21 14:06:22	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1087	Glendale Urgency Chiropractic Clinic	319 South Brand Blvd.		Glendale	91204	(818) 901-0388	(818) 507-0126	Sonny	glendalechiropractic@yahoo.com	\N	0	2015-10-05 01:24:48	2015-10-21 12:11:57	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1093	Advance Care	2690 Pacific Avenue	#255	Long Beach	90806	(800) 850-2693	(866) 273-1775	Rebecca/Jessica	acs@premiermedicalmarketing.com	\N	0	2015-10-05 01:24:48	2015-10-21 11:53:54	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	<span style="line-height: 21.4286px;">Email paperwork to request appointment for client.</span>	\N
1098	Atlantis Health Management	3800 E. Cesar Chavez E. Ave		Los Angeles	90063	(323) 264-6296	(323) 395-5782	Desiree	scheduling@atlantishealthmgmt.com	\N	0	2015-10-05 01:24:48	2015-10-20 10:15:44	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1106	Cedar Medical Group	235 N. Laurel Ave.		Ontario	91762	(909) 988-2554	(909) 988-2584	Lupe	cedarontario@gmail.com	\N	0	2015-10-05 01:24:48	2015-10-21 12:00:05	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1111	Central Valley	14624 Sherman Way	Suite 404 Van Nuys	Van Nuys	91405	(800) 850-2693	(866) 273-1775	Jessica/Rebecca	cvcr@premiermedicalmarketing.com	\N	0	2015-10-05 01:24:48	2015-10-21 12:06:40	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	Email paperwork to request appointment for client.	\N
1074	Greenfield Integrated	11920 Ramona		El Monte	91732	(626) 448-5501	(626) 448-5502	Maggie	greenfield411@sbcglobal.net	\N	0	2015-10-05 01:24:48	2015-10-21 12:13:15	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1112	Gutierrez Chiropractic	8445 S. Rosemead Blvd.		Pico Rivera	90660	(562) 861-1600	(562) 861-1717	Ariana	carmen@gutierrezchiropractic.com	\N	0	2015-10-05 01:24:48	2015-10-21 12:16:32	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1089	Lighthouse Medical Mgt	6011 Pacific Blvd.	Suite 123	Huntington Park	90255	(909) 854-4224	(909) 565-4406	Jenny	scheduling@lighthousemedicalinc.com	\N	0	2015-10-05 01:24:48	2015-10-21 12:24:38	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1086	Lighthouse Medical Mgt	8832 Sierra Ave.		Fontana	92335	(909) 854-4900	(909) 854-4224	Jenny	scheduling@lighthousemedicalinc.com	\N	0	2015-10-05 01:24:48	2015-10-21 12:24:59	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1097	MedNation	3580 Wilshire Blvd.	Suite 100	Los Angeles	90010	(818) 697-6190	(888) 391-7488	Jordy / Yanira	intake@mednationinc.com	\N	0	2015-10-05 01:24:48	2015-10-21 12:25:41	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1072	So Cal Chiros	2390 E. Orangewood Avenue	Suite 400 Anaheim	Anaheim	92806	(714) 808-9666	(714) 808-1666	Marisol	intake@socalchiros.com	\N	0	2015-10-05 01:24:47	2015-10-21 14:06:54	0	1	\N	\N	\N	Orange	\N	\N	\N	\N	\N
1081	Southland Spine	1520 Nutmeg Place	Suite 110	Costa Mesa	92626	(714) 751-8110	(714) 751-5098	Intake	newpatient@southlandspine.com	\N	0	2015-10-05 01:24:48	2015-10-21 14:08:39	0	1	\N	\N	\N	Orange	\N	\N	\N	\N	\N
1134	Advance Care	1125 East 17th Street	N-560 Santa Ana	Orange	92701	(800) 850-2693	(866) 273-1775	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:51:24	0	1	\N	\N	\N	Orange	\N	\N	\N	\N	2015-10-13 13:51:24
1157	Advance Care	2935 Oswell St		Bakersfield	93306	(800) 850-2693	(866) 273-1775	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:51:29	0	1	\N	\N	\N	Kern	\N	\N	\N	\N	2015-10-13 13:51:29
1136	First Line Health	12660 Riverside Dr	Unit 201 Studio City	Los Angeles	91607	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:13	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	2015-10-13 13:53:13
1160	First Line Health	12901 Harbor Blvd.	Suite A6	Garden Grove	90840	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:13	0	1	\N	\N	\N	Orange	\N	\N	\N	\N	2015-10-13 13:53:13
1156	First Line Health	10800 Paramount Blvd.	Suite 201	Downey	90241	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:13	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	2015-10-13 13:53:13
1155	First Line Health	3231 Waring Ct	Suite N	Oceanside	92056	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:13	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	2015-10-13 13:53:13
1132	First Line Health	1885 National Avenue		San Diego	92113	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:13	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	2015-10-13 13:53:13
1124	First Line Health	165 W. Hospitality Lane	Suite 20	San Bernardino	92408	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:13	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	2015-10-13 13:53:13
1147	First Line Health	1011 E. Devonshire Avenue	Suite 200	Hemet	92543	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:13	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	2015-10-13 13:53:13
1154	MedNation	1905 E. 17th Street	Suite 309 Santa Ana	Orange	92705	(818) 697-6190	(888) 391-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:58	0	1	\N	\N	\N	Orange	\N	\N	\N	\N	2015-10-13 13:53:58
1141	MedNation	202 W. Willow Street	Suite 302 Visalia	Visalia	93291	(818) 697-6190	(888) 383-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:58	0	1	\N	\N	\N	Tulare	\N	\N	\N	\N	2015-10-13 13:53:58
1130	Rise Wellness Center	2710 Adams Ave		San Diego	92116	(619) 794-2099	(619) 362-9616	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:59:25	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	2015-10-13 13:59:25
1133	Rudolph Multi Specialty Group	2360 Mckee Road	Suite 9	San Jose	95116	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:59:25	0	1	\N	\N	\N	Santa Clara	\N	\N	\N	\N	2015-10-13 13:59:25
1126	Rudolph Multi Specialty Group	435 W. Orange Show Lane	Suite 104	San Bernardino	92408	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:59:25	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	2015-10-13 13:59:25
1118	Rudolph Multi Specialty Group	5870 Arlington Ave.	Suite 101	Riverside	92504	(909) 483-3530	(909) 380-7752	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:59:25	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	2015-10-13 13:59:25
1138	SCOP	14600 Sherman Way	Suite 100-A Van Nuys	Los Angeles	91405	(310) 337-3700	(310) 337-1643	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:59:25	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	2015-10-13 13:59:25
1122	SCOP	4240 Tequesquite Avenue		Riverside	92601	(310) 337-3700	(310) 337-1643	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:59:25	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	2015-10-13 13:59:25
1140	Spine & Orthopedic Center	14298 St Andrews Drive	Suite 11	Victorville	92395	(951) 710-1030	(951) 710-1040	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:59:25	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	2015-10-13 13:59:25
1127	Spine & Orthopedic Center	236 W. Orange Show Rd	Suite 114	San Bernardino	92408	(951) 710-1030	(951) 710-1040	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:59:25	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	2015-10-13 13:59:25
1142	Taft Chiropractic	14850 Roscoe Blvd.	Panorama City	Los Angeles	91402	(818) 340-0089	(818) 340-6985	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:59:25	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	2015-10-13 13:59:25
1135	Tri-Star Medical Group	999 N. Tustin Avenue	Suite 201 Santa Ana	Orange	92705	(714) 975-7950	(714) 975-7951	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:59:25	0	1	\N	\N	\N	Orange	\N	\N	\N	\N	2015-10-13 13:59:25
1143	Harout Balian MD	333 N. Hill Ave Suite 101		Pasadena	91106	(626) 449-9911	(626) 449-9921	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 14:00:47	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	2015-10-13 14:00:47
1131	Crosby Square Chiro	1885 National Ave.		San Diego	92113	(619) 238-0096	(619) 232-7046	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 14:01:09	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	2015-10-13 14:01:09
1159	Bakersfield Medical Group	2935 Oswell Street		Bakersfield	93306	(661) 455-0100	(661) 249-6241	Alex	bmg@premiermedicalmarketing.com	\N	0	2015-10-05 01:24:48	2015-10-21 11:53:38	0	1	\N	\N	\N	Kern	\N	\N	\N	Email paperwork to request appointment for client.	\N
1150	Cedar Medical Group	15664 Main Street	Ste 100	Hesperia	92345	(760) 244-1740	(760) 244-1741	Eunice	\N	\N	0	2015-10-05 01:24:48	2015-10-21 12:05:56	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1149	Cedar Medical Group	12730 Heacock Street	Suite 8	Moreno Valley	92553	(951) 247-4976		Carla	morenovalleychiro@gmail.com	\N	0	2015-10-05 01:24:48	2015-10-21 12:09:23	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	\N
1144	Cedar Medical Group	3165 N. Garey Ave		Pomona	91767	(909) 392-2230		Monica	pomonachiro@gmail.com	\N	0	2015-10-05 01:24:48	2015-10-21 12:04:00	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1137	Gutierrez Chiropractic	1304 Santa Anita Avenue	Unit A	South El Monte	91733	(626) 452-0202	(626) 452-0200	Ariana	carmen@gutierrezchiropractic.com	\N	0	2015-10-05 01:24:48	2015-10-21 12:14:28	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1146	Industrial Treatment & Rehabilitation Center	155 Hospitality Lane	Suite 245	San Bernardino	92408	(909) 890-9703		Maria	paintxandrehab@gmail.com	\N	0	2015-10-05 01:24:48	2015-10-21 12:21:55	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1153	Innovative Medical Management	7630 Painter Ave #B		Whittier	90602	(562) 696-1441		Sophia	sophia@innovativemedmgmt.com	\N	0	2015-10-05 01:24:48	2015-10-21 12:22:49	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1128	Lighthouse Medical Mgt	3645 El Cajon Blvd.		San Diego	92104	(909) 854-4224	(909) 565-4406	Jenny	scheduling@lighthousemedicalinc.com	\N	0	2015-10-05 01:24:48	2015-10-21 12:24:23	0	1	\N	\N	\N	San Diego	\N	\N	\N	\N	\N
1125	Montgomery Chiropractic	155 W. Hospitality Lane	Suite 175	San Bernardino	92408	(909) 890-2226	(909) 890-9638	N/A	montgomerychirosb@gmail.com	\N	0	2015-10-05 01:24:48	2015-10-21 13:54:42	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1139	Montgomery Chiropractic	14707 7th Street	Suite 100	Victorville	92395	(760) 881-3600	(760) 881-3601	N/A	montgomerychirovv@gmail.com	\N	0	2015-10-05 01:24:48	2015-10-21 13:56:30	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1120	Montgomery Chiropractic	3404 Arlington Ave		Riverside	92506	(951) 782-8369	(951) 782-8378	N/A	montgomeryriv@gmail.com	\N	0	2015-10-05 01:24:48	2015-10-21 13:56:54	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	\N
1152	NobleQuest	14435 Hamlin Street#108	Van Nuys	Van Nuys	91401	(818) 997-7117	(888) 833-2881	Henry	henryjmrivera@calrehabsp.com	\N	0	2015-10-05 01:24:48	2015-10-21 13:58:06	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1162	RB Spine Center (Mission Valley)	2878 Camino Del Rio S. #404		San Diego	92108	(858) 345-4114		Alma	admin@rbspinecenter.com	\N	0	2015-10-05 01:24:48	2015-10-21 14:05:17	0	1	\N	\N	\N	San Diego	\N	\N	\N	<span style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;">* Only take CT that are for one year, nothing less.</span>	\N
1121	Southland Spine	4354 Latham Street	Suite 100	Riverside	92501	(714) 751-8110	(714) 751-5098	Intake	newpatient@southlandspine.com	\N	0	2015-10-05 01:24:48	2015-10-21 14:09:01	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	\N
1151	Dr. Nikta Andalib DC	1224 E. Ave S	Ste B	Palmdale	93550	(661) 266-1611	(661) 266-1295	N/A	palmdale@gobalcare.net	\N	0	2015-10-05 01:24:48	2015-10-21 16:37:51	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	*No Post Term cases	\N
1178	AARLA	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 16:10:06	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table style="width: 1069px; height: 73px;" class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer</span><br></span></td><td><span style="font-weight: bold;">Link<br></span></td><td><span style="font-weight: bold;">Notes<br></span></td></tr><tr><td><br></td><td><p><a target="_blank" href="http://www.aarla.com">www.aarla.com</a><br><br></p></td><td><p>Click on "Medical Provider Network" Click on Security National MPN<br></p></td></tr></tbody></table><p><br></p>	\N
1102	Harout Balian	MD 4950 San Bernardino Street	Suite 102	Montclair	91763	(909) 624-5277		Maria	maria.advanced411@yahoo.com	\N	0	2015-10-05 01:24:48	2015-10-21 16:49:08	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	<p>*Will not take cases with a CT ending date is more than three months.</p><p>* Specific cannot be more than 6 months old.</p><p>* If specific is not reported they will not take the case.</p><p>* No Post Term cases</p>	\N
1258	Applied Risk Services	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 19:02:01	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.auw.com">http://</a></span><a target="_blank" href="http://www.auw.com">www.auw.com</a><span style="font-family: Arial;"><br></span></p></td><td><p><span style="font-family: Arial;">Click on Products &amp; Services, click on Promesa Health then on Promesa CA Provider Search and click on Search by Provider by Name or Tax ID&nbsp; <br><br></span></p></td></tr></tbody></table><p><br></p>	\N
1302	Argonaut Claim Services	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 19:04:48	2015-10-05 19:04:48	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/intracorp">http://</a><a target="_blank" href="http://www.talispoint.com/intracorp">www.talispoint.com/intracorp</a><br></span></p></td><td><p><span style="font-family: Arial;">Username: argo&nbsp;&nbsp;&nbsp;&nbsp; Password: argo<br></span></p></td></tr></tbody></table><p><br></p>	\N
1262	Old Republic	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 19:30:25	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com">http://www.coventrywcs.com</a><br></span></p></td><td><p><span style="font-family: Arial;">Client Login &amp; Tools&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Focus sedgwickkaisercampn<br></span></p></td></tr></tbody></table><p><br></p>	\N
1238	Sedgwick	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-06 10:37:40	1	0	\N	\N	\N	\N	\N	\N	\N	<table style="width: 1008px; height: 3521px;" class="dataa" cellspacing="0">\t<colgroup width="346"></colgroup>\t<colgroup width="424"></colgroup>\t<colgroup width="237"></colgroup>\t<tbody><tr>\t\t<td align="left" height="18" valign="bottom"><b><font color="#000000" face="Arial">Employer</font></b></td>\t\t<td align="left" valign="bottom"><b><font color="#000000" face="Arial">Link</font></b></td>\t\t<td align="left" valign="bottom"><b><font color="#000000" face="Arial">Notes</font></b></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Rollins</font></td>\t\t<td align="left" valign="bottom"><span style="color: rgb(0, 0, 255);"><span style="font-family: Arial;"><span style="text-decoration: underline;"><a target="_blank" href="http://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN">http://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN</a></span></span></span><br></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">County of Los Angeles Probation Dept</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.compcaremed.com/cola">http://www.compcaremed.com/cola</a><br></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Food 4 Less</font></td>\t\t<td align="left" valign="bottom"><p><span style="color: rgb(24, 188, 156);"><span style="font-family: Arial;"><span style="text-decoration: underline;"><a target="_blank" href="http://www.harborsys.com/kroger">http://</a></span></span></span><a target="_blank" href="http://www.harborsys.com/kroger">www.harborsys.com/kroger</a><br></p></td><td align="left" valign="bottom"><br></td></tr><tr><td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">edgwick  (Standard)</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.sedgwickproviders.com">http://www.sedgwickproviders.com</a><span style="color: rgb(24, 188, 156);"><span style="font-family: Arial;"><span style="text-decoration: underline;"><a target="_blank" href="http://www.sedgwickproviders.comwww.sedgwickproviders.com"></a></span></span></span><br></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Choose the correct Network</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Tyche Management Inc</font></td>\t\t<td align="left" valign="bottom"><u><font color="#0000FF" face="Arial"><a target="_blank" href="http://www.talispoint.com/firsthealth/?AE=997571183&amp;CAID=EVEMPN">http://www.talispoint.com/firsthealth/?AE=997571183&amp;CAID=EVEMPN</a></font></u></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Nestle</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/nestle">http://www.harborsys.com/nestle</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/nestle"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">EE Hall Inc</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools       Focus: sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Ross Stores</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/rossstores">http://www.harborsys.com/rossstores</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/rossstores"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">RH Peterson Co.</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.talispoint.com/firsthealth/?AE=997571183&amp;CAID=EVEMPN">http://www.talispoint.com/firsthealth/?AE=997571183&amp;CAID=EVEMPN</a><u><font color="#0000FF" face="Arial"><a href="http://www.talispoint.com/firsthealth/?AE=997571183&amp;CAID=EVEMPN"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">U.S. Horizon Manufacturing Inc</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools       Focus: sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Buffalo Wild Wings</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools       Focus: sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Albertsons</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/sedgwick2">http://www.harborsys.com/sedgwick2</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/sedgwick2"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Sears</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/sears">http://www.harborsys.com/sears</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/sears"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">La Quinta Resort Spa</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/sedgwick2">http://www.harborsys.com/sedgwick2</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/sedgwick2"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Walmart</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.talispoint.com/walmart">http://www.talispoint.com/walmart</a><u><font color="#0000FF" face="Arial"><a href="http://www.talispoint.com/walmart"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Password: wlm</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Pepsi</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools       Focus: sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="18" valign="bottom"><font color="#000000" face="Arial">Mission Hospital</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">NO MPN LINK</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Can schedule with any PTP</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Cheese Cake Factory</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools       Focus: campn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="54" valign="bottom"><font color="#000000" face="Arial">Mariak Industries</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.corvel.com/">htpp://ttwww.corvel.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.corvel.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Got to PPO Look Up         Select Find Provider              Select Network: CA MPN</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Los Angeles Unified School District (LAUSD)</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools           Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Huntington Memorial Hospital</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">NO MPN LINK</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Can schedule with any PTP</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Cintas Corp</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools           Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Northridge Hospital</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">NO MPN LINK</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Can schedule with any PTP</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Corona College Heights Orange &amp; Lemon Association</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools       Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">The Boeing Company</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/boeing">http://www.harborsys.com/boeing</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/boeing"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Lowe's</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.providernet.bunchcare.com/">http://www.providernet.bunchcare.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.providernet.bunchcare.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">ID: Lowes                          Password: Low289</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Perfect Image Youth Center</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventryhealthcare.com/">http://www.coventryhealthcare.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventryhealthcare.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Network: First Health</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Stater Bros</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools       Focus: sedgwickkaisercampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Snapware Corporation</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools           Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Hampton Inn</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/sedgwick">http://www.harborsys.com/sedgwick</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/sedgwick"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Standard Packing</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">http://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Ronford Products</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.everestnational.com/workcomp">http://www.everestnational.com/workcomp</a><u><font color="#0000FF" face="Arial"><a href="http://www.everestnational.com/workcomp"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Network: Everest Medical Provider Network</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Savon Drugs</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/client-tools/index.htm">http://www.coventrywcs.com/client-tools/index.htm</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/client-tools/index.htm"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client ID: sedgwickkaisercampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Frito Lay</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN">htpp://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN</a><u><font color="#0000FF" face="Arial"><a href="http://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Little Cesars</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools           First Health Portal: Select</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Knott's Berry Farm</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.talipoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN">htpp://www.talipoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN</a><u><font color="#0000FF" face="Arial"><a href="http://www.talipoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Smart &amp; Final</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools           Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Rollins</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN">htpp://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN</a><u><font color="#0000FF" face="Arial"><a href="http://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Cardinal Health</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Herman Ostrow School of Dentistry</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Securitas Security Services</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Kmart</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/shg">htpp://www.harborsys.com/shg</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/shg"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Target</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/target">htpp://www.harborsys.com/target</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/target"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Chuck E. Cheese's</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/cec">htpp://www.harborsys.com/cec</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/cec"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Big Lots</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Pick Your Parts</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Claim Jumper Restaurant</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Chick Fil A</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Kohl's</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Verizon Wireless</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="54" valign="bottom"><font color="#000000" face="Arial">County of Los Angeles or AIMS</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.ceo.lacounty.gov/mpn/">htpp://www.ceo.lacounty.gov/mpn/</a><u><font color="#0000FF" face="Arial"><a href="http://www.ceo.lacounty.gov/mpn/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Scroll down and click on Medical Provider Network. Then scroll down and select the Corvel option.</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">AT&amp;T</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">99 Cent Only Store</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">General Electric</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools                 Focus: Sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Coca-Cola</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login Tools            Focus: CAMPN</font></td>\t</tr>\t<tr>\t\t<td align="left" height="54" valign="bottom"><font color="#000000" face="Arial">Kimco Staffing</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools           First Health Portal            Client ID: ORS          Channeling Tools</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Air Industries</font></td>\t\t<td align="left" valign="bottom"><u><font color="#0000FF" face="Arial"><a href="https://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN">https://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN</a></font></u></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">McCromenter Inc</font></td>\t\t<td align="left" valign="bottom"><u><font color="#0000FF" face="Arial"><a href="https://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN">https://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN</a></font></u></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Super Value Inc</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools   Focus:Sedgwickkaisercampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Scripps Mercy Hospital</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/scripps">htpp://www.harborsys.com/scripps</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/scripps"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Dollar Tree</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools        Focus: sedgwickkaisercampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Jaguar Farm Labor</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.sedgwickproviders.com/ag">htpp://www.sedgwickproviders.com/ag</a><u><font color="#0000FF" face="Arial"><a href="http://www.sedgwickproviders.com/ag"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">John F. Kennedy Memorial Hospital</font></td>\t\t<td align="left" valign="bottom"><u><font color="#0000FF" face="Arial"><a target="_blank" href="https://www.harborsys.com/Temet">https://www.harborsys.com/Temet</a></font></u></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Picar Farm Labor Inc</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/ag">htpp://www.harborsys.com/ag</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/ag"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Hilton San Diego</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/sedgwick">htpp://www.harborsys.com/sedgwick</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/sedgwick"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Hilton Worldwide</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/sedgwick2">htpp://twww.harborsys.com/sedgwick2</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/sedgwick2"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Calabasas Dental Care</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools      Focus:sedgwickkaisercampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="38" valign="bottom"><font color="#000000" face="Arial">Foremost Senior Campus</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/ag">htpp://www.harborsys.com/ag</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/ag"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">USC</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/USC">htpp://www.harborsys.com/USC</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/USC"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="18" valign="bottom"><font color="#000000" face="Arial">Superior Talent Resources</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">NO MPN LINK</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">LA County of Dept of Children &amp; Family Services</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.compcaremed.com/cola/">htpp://www.compcaremed.com/cola/</a><u><font color="#0000FF" face="Arial"><a href="http://www.compcaremed.com/cola/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Knowledge Universe</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools Focus:Sedgwickkaisercampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="40" valign="bottom"><font color="#000000" face="Arial">The Beverly Hilton</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/sedgwick2">htpp://www.harborsys.com/sedgwick2</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/sedgwick2"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Wendy's</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.talispoint.com/">htpp://www.talispoint.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.talispoint.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Username: SRS       Password: arbys</font></td>\t</tr>\t<tr>\t\t<td align="left" height="38" valign="bottom"><font color="#000000" face="Arial">Wells Fargo Bank</font></td>\t\t<td align="left" valign="bottom"><u><font color="#0000FF" face="Arial"><a target="_blank" href="https://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN">https://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN</a></font></u></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Walgreens</font></td>\t\t<td align="left" valign="bottom"><u><font color="#0000FF" face="Arial"><a target="_blank" href="https://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN">https://www.talispoint.com/firsthealth/?AE=997465598&amp;CAID=SEDMPN</a></font></u></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Office Depot</font></td>\t\t<td align="left" valign="bottom"><u><font color="#0000FF" face="Arial"><a target="_blank" href="https://www.talispoint.com/genex/login/">https://www.talispoint.com/genex/login/</a></font></u></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Username: Office    Password: Depot</font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">LA-Z Boy</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.sedgwickproviders.com/lzb">htpp://www.sedgwickproviders.com/lzb</a><u><font color="#0000FF" face="Arial"><a href="http://www.sedgwickproviders.com/lzb"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="18" valign="bottom"><font color="#000000" face="Arial">Starbucks</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">NO MPN LINK</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Sabor Foods</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.sedgwickproviders.com/ag">htpp://www.sedgwickproviders.com/ag</a><u><font color="#0000FF" face="Arial"><a href="http://www.sedgwickproviders.com/ag"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">General Electric</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools      Focus: sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="18" valign="bottom"><font color="#000000" face="Arial">Trader Joe's</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">NO MPN LINK</font></td>\t\t<td align="center" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="24" valign="bottom"><font color="#000000" face="Arial">Fed-Ex</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.talispoint.com/">htpp://www.talispoint.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.talispoint.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">User ID: Fedex Password:Fedex</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Ralphs</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.sedgwickproviders.com/Kroger">htpp://www.sedgwickproviders.com/Kroger</a><u><font color="#0000FF" face="Arial"><a href="http://www.sedgwickproviders.com/Kroger"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="37" valign="bottom"><font color="#000000" face="Arial">Cardinal Health</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.coventrywcs.com/">htpp://www.coventrywcs.com</a><u><font color="#0000FF" face="Arial"><a href="http://www.coventrywcs.com/"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Client Login &amp; Tools       Focus: sedgwickcampn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="18" valign="bottom"><font color="#000000" face="Arial">UCLA</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">NO MPN LINK</font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">McDonald's</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/pog">htpp://www.harborsys.com/pog</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/pog"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">OfficeMax</font></td>\t\t<td align="left" valign="bottom"><u><font color="#0000FF" face="Arial"><a target="_blank" href="http://www-lv.talispoint.com/">http://www-lv.talispoint.com</a></font></u></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Username: Office    Password: Depot</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Flair Cleaners</font></td>\t\t<td align="left" valign="bottom"><u><font color="#0000FF" face="Arial"><a target="_blank" href="http://www.coventrywcs.com/client-tools/index.htm">http://www.coventrywcs.com/client-tools/index.htm</a></font></u></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial">Focus: campn</font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Excel Logics</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.harborsys.com/desc">htpp://www.harborsys.com/desc</a><u><font color="#0000FF" face="Arial"><a href="http://www.harborsys.com/desc"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="18" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr>\t<tr>\t\t<td align="left" height="20" valign="bottom"><font color="#000000" face="Arial">Whole Foods Market</font></td>\t\t<td align="left" valign="bottom"><p><a target="_blank" href="http://www.talispoint.com/cvty/gbmpn">htpp://www.talispoint.com/cvty/gbmpn</a><u><font color="#0000FF" face="Arial"><a href="http://www.talispoint.com/cvty/gbmpn"></a></font></u></p></td>\t\t<td align="left" valign="bottom"><font color="#000000" face="Arial"><br></font></td>\t</tr></tbody></table>	\N
1264	National Interstate	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 18:12:29	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer</span></span><br></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link</span></span><br></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes</span></span><br></td></tr><tr><td><br></td><td><p><span style="font-family: Arial;">NO MPN LINK</span><br></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1299	Nationwide	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 18:16:48	2015-10-05 18:16:48	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.genexservices.com">http://</a></span><a target="_blank" href="http://www.genexservices.com">www.genexservices.com</a><span style="font-family: Arial;"><br></span></p></td><td><p>User Name: ehi001&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Password: ehi1<span style="font-family: Arial;"><br></span></p></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><span style="font-family: Arial;"><br></span></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1206	ESIS	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 17:25:48	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table style="width: 1117px; height: 74px;" class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;">Employer<br></span></td><td><span style="font-weight: bold;">Link<br></span></td><td><span style="font-weight: bold;">Notes<br></span></td></tr><tr><td><br></td><td><p><a target="_blank" href="http://www.talispoint.com/esis/mpn/">http://www.talispoint.com/esis/mpn/</a><br></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1298	City of Torrance	N/A	\N	Los Angeles	99900	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 17:31:49	2015-10-05 17:31:49	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><br></td><td><p>NO MPN LINK<br></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1250	AmTrust North America	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 19:58:35	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/amtrust/campn">http://www.talispoint.com/amtrust/campn</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on Name Search<br></span></p></td></tr></tbody></table><p><br></p>	\N
1227	One Beacon Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:00:51	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/firsthealth/provider/">http://www.talispoint.com/firsthealth/provider/</a><br></span></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1300	Federal Insurance Co.	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 18:22:15	2015-10-05 18:22:15	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.corvel.com">http://</a><a target="_blank" href="http://www.corvel.com">www.corvel.com</a><br></span></p></td><td><p><span style="font-family: Arial;">California MPN<br></span></p></td></tr></tbody></table><p><br></p>	\N
1244	Travelers	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 18:32:21	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/travelers/ext/?lob=wc">http://</a></span><a target="_blank" href="http://www.talispoint.com/travelers/ext/?lob=wc">www.talispoint.com/travelers/ext/?lob=wc</a><span style="font-family: Arial;"><br></span></p></td><td><p>Provider Lookup<span style="font-family: Arial;"><br></span></p></td></tr></tbody></table><p><br></p>	\N
1204	Employers Compensation	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 18:39:14	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.employers.com/workers/provider_locator.aspx">http://www.employers.com/workers/provider_locator.aspx</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on California then click on "To Locate Provider Click Here"&nbsp; and click on "Search by Provider Name or Tax ID"<br></span></p></td></tr></tbody></table><p><br></p>	\N
1301	Southern Insurance Co.	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 18:48:53	2015-10-05 18:48:53	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><br></td><td><p><a target="_blank" href="http://www.risingms.net/employers/firstcomp">http://www.risingms.net/employers/firstcomp</a><br></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1253	Marriott Claims Services	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 18:52:36	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><br></td><td><p><a target="_blank" href="http://http://www.talispoint.com/marriott/campn">http://http://www.talispoint.com/marriott/campn</a><br></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1303	QBE Specialty Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 19:32:43	2015-10-05 19:32:43	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.harborsys.com/sedgwick">http://www.harborsys.com/sedgwick</a><br></span></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1233	Safeway Inc. (Vons)	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 19:36:03	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><p>VONS<span style="font-family: Arial;"><br></span></p></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/saefwaympn">http://</a></span><a target="_blank" href="http://www.talispoint.com/saefwaympn">www.talispoint.com/saefwaympn</a><span style="font-family: Arial;"><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1304	ICW	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 19:38:44	2015-10-05 19:38:44	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><br></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.harborsys.com/ICWGroup">http://www.harborsys.com/ICWGroup</a></span><br></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1278	Matrix Absence Management	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 19:56:16	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com">http://www.coventrywcs.com</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on Provider Tools then click on Referral Search <br><br></span></p></td></tr></tbody></table><p><br></p>	\N
1129	Advance Care	7581 Mission Center Ct	Suite 205	San Diego	92108	(800) 850-2693	(866) 273-1775	Rebecca/Jessica	acs@premiermedicalmarketing.com	\N	0	2015-10-05 01:24:48	2015-10-21 11:53:47	0	1	\N	\N	\N	San Diego	\N	\N	\N	<span style="line-height: 21.4286px;">Email paperwork to request appointment for client.</span>	\N
1197	Corvel	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 21:22:09	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><p><span style="font-family: Arial;"><br></span></p></td><td><p><a target="_blank" href="http://www.corvel.com/ppo-lookup/">http://www.corvel.com/ppo-lookup/</a><span style="font-family: Arial;"><br></span></p></td><td><p>Select California MPN<span style="font-family: Arial;"><br></span></p></td></tr></tbody></table><p><br></p>	\N
1182	AIG (Chartis)	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 22:00:06	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/aig/com/">http://www.talispoint.com/aig/com/</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1217	Intercare	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:02:47	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com">http://www.coventrywcs.com</a><br></span></p></td><td><p><span style="font-family: Arial;">Client Login &amp; Tools&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Focus&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Client ID: campn<br></span></p></td></tr></tbody></table><p><br></p>	\N
1193	CIGA	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:04:42	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/cvty/cigampn">http://www.talispoint.com/cvty/cigampn</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1230	Patriot Risk Management	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:06:33	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://rockporthealthcare.com/SSL/login.aspx">http://rockporthealthcare.com/SSL/login.aspx</a><br></span></p></td><td><p><span style="font-family: Arial;">Username: avizent&nbsp; Password: 9572&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Click on Search by Name under "Locate a Provider"<br></span></p></td></tr></tbody></table><p><br></p>	\N
1232	Republic Indemnity Co. of America	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:20:42	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/ri">http://www.talispoint.com/ri</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr><tr><td><p><span style="font-family: Arial;">Southern California Edison<br></span></p></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.talispoint.com/sce/external">http://www.talispoint.com/sce/external</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1305	State Farm Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 20:22:32	2015-10-05 20:22:32	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-weight: bold;"><span style="font-family: Arial;">Employer<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;">NO MPN LINK<br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1225	Midwest	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:52:24	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td>Notes<br></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="https://www.viiad.com/risingCompass/private/app/compass/provider_search_main.asp">https://www.viiad.com/risingCompass/private/app/compass/provider_search_main.asp</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1145	Cedar Medical Group	17096 E. Foothill Blvd		Fontana	92335	(909) 428-6989	(909) 428-6939	Palmira	cedarfontana@gmail.com	\N	0	2015-10-05 01:24:48	2015-10-21 12:05:28	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	\N
1148	Industrial Healthcare Physicians Medical Group Inc.	2010 Wilshire Blvd	Suite 926	Los Angeles	90057	(213) 353-4921	(213) 402-7659	Judith / Carmen	appt@ihpmg.com	\N	0	2015-10-05 01:24:48	2015-10-21 12:20:57	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	<p>*No Cash patients</p><p>* No Post Term cases</p><p>* No recycled cases (NO FC)</p><p>*No chemical exposure, finger, foot, ankle, toe, wrist, and hand alone cases (NO psych only or internal only)</p>	\N
1115	MedNation	7012 Reseda Blvd	Suite A2	Reseda	91335	(818) 697-6190	(888) 391-7488	Jordy / Yanira	intake@mednationinc.com	\N	0	2015-10-05 01:24:48	2015-10-21 12:26:06	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	\N
1222	Lumberman's Underwriting	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:29:29	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www-sf.talispoint.com/talispoint/login.pl?control_id=SF4CF4P8EW&amp;old_sess=SPFLE6V1E6&amp;mode=name">http://www-sf.talispoint.com/talispoint/login.pl?control_id=SF4CF4P8EW&amp;old_sess=SPFLE6V1E6&amp;mode=name</a><br></span></p></td><td><p><span style="font-family: Arial;">Username: Lua001&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Password: lua1<br></span></p></td></tr></tbody></table><p><br></p>	\N
1215	Hortica	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:30:25	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com">http://www.coventrywcs.com</a><br></span></p></td><td><p>Client Login&amp; Tools&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; First Health&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; User ID: hin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Channeling Tools<span style="font-family: Arial;"><br></span></p></td></tr></tbody></table><p><br></p>	\N
1294	Tokio Marine	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:35:40	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com">http://www.coventrywcs.com</a><br></span></p></td><td><p><span style="font-family: Arial;">Client Login&amp; Tools&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; First Health&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; User ID: select<br></span></p></td></tr></tbody></table><p><br></p>	\N
1212	Guard Insurance Group	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:42:48	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.guardinsurancegroup.com/caclaim.stm">http://www.guardinsurancegroup.com/caclaim.stm</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on On-line Directory of Managed Care Providers Click on Name Search&nbsp; <br><br></span></p></td></tr><tr><td><p><span style="font-family: Arial;">Kaiser Permanente<br></span></p></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://http://www.talispoint.com/kaiser/external/">http://http://www.talispoint.com/kaiser/external/</a><br></span></p></td><td><p><span style="font-family: Arial;">Password: Kaiser<br></span></p></td></tr><tr><td><p><span style="font-family: Arial;">Disneyland Worldwide Services<br></span></p></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.harborsys.com/wdpr">http://www.harborsys.com/wdpr</a><br></span></p></td><td><span style="font-family: Arial;"><br></span></td></tr></tbody></table><p><br></p>	\N
1240	Sentry Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:44:54	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.coventrywcs.com/client-tools/index.htm">http://www.coventrywcs.com/client-tools/index.htm</a><br></span></p></td><td><p><span style="font-family: Arial;">First Health Portal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Client ID: SIN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Channeling Tools<br></span></p></td></tr></tbody></table><p><br></p>	\N
1306	Enstar Insurance	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 20:47:26	2015-10-05 20:47:26	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Notes<br></span></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.paladinmc.com/providers.html">http://www.paladinmc.com/providers.html</a><br></span></p></td><td><p><span style="font-family: Arial;">Click on Torus Califoria Medical Provider Network<br></span></p></td></tr></tbody></table><p><br></p>	\N
1179	ACE	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-05 11:04:08	2015-10-05 20:50:28	1	0	\N	\N	\N	\N	\N	\N	\N	<p><br></p><table class="table table-bordered"><tbody><tr><td><span style="font-family: Arial;"><span style="font-weight: bold;">Employer<br></span></span></td><td><span style="font-family: Arial;"><span style="font-weight: bold;">Link<br></span></span></td><td><span style="font-weight: bold;"><span style="font-family: Arial;">Notes</span><br></span></td></tr><tr><td><span style="font-family: Arial;"><br></span></td><td><p><span style="font-family: Arial;"><a target="_blank" href="http://www.acegroup.com/esis-en/client-resources/find-a-provider.aspx">http://www.acegroup.com/esis-en/client-resources/find-a-provider.aspx</a><br></span></p></td><td><br></td></tr></tbody></table><p><br></p>	\N
1103	Gogatz Chiropractic Ctr	40485 Murrieta Hot Springs Rd	Ste. B7	Murrieta	92563	(951) 698-4050	(951) 698-4057	N/A	gogatzchiropractic@verizon.net	\N	0	2015-10-05 01:24:48	2015-10-21 12:12:31	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	\N
1164	RB Spine Center	163 South Avenue 24	# 203-204	Los Angeles	91401	(858) 345-4114		Alma	admin@rbspinecenter.com	\N	0	2015-10-05 01:24:48	2015-10-21 14:01:47	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	* Only take CT that are for one year, nothing less.	\N
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
1318	Maxwell Agha Law Firm	160 Thorn Street, Suite 200, San Diego, Ca 92103	\N	San Diego	90001	(619) 230-0330	(619) 230-1726	N/A	\N	\N	0	2015-10-06 15:45:49	2015-10-08 13:12:09	1	0	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-08 13:12:09
1158	Advance Care	2001 N. Solar Drive #165		Oxnard	93036	(805) 485-0500	(805) 485-0057	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:51:17	0	1	\N	\N	\N	Ventura	\N	\N	\N	\N	2015-10-13 13:51:17
1117	Advance Care	4121 10th Street		Riverside	92501	(800) 850-2693	(866) 273-1775	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:51:54	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	2015-10-13 13:51:54
1069	First Line Health	330 S. Garfield Ave	Suite 228	Alhambra	91801	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:47	2015-10-13 13:53:13	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	2015-10-13 13:53:13
1071	First Line Health	212 S. Grand Avenue	Santa Ana	Orange	92701	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:47	2015-10-13 13:53:13	0	1	\N	\N	\N	Orange	\N	\N	\N	\N	2015-10-13 13:53:13
1123	First Line Health	1881 S. Commerce Center Dr. E.	Suite 112	San Bernardino	92408	(310) 954-9938		N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:53:13	0	1	\N	\N	\N	San Bernardino	\N	\N	\N	\N	2015-10-13 13:53:13
1096	MedNation	4201 Long Beach Blvd.	Suite 430	Long Beach	90807	(818) 697-6190	(888) 391-7488	N/A	\N	\N	0	2015-10-05 01:24:48	2015-10-13 13:58:32	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	\N	2015-10-13 13:58:32
1166	Bell Medical Solutions	N/A	\N	Los Angeles	90001	(949) 264-2355	\N	Scott/Savannah	\N	\N	1	2015-10-05 10:53:26	2015-10-13 14:05:31	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1325	RSnyder Law	970-C West 17th Street	\N	Santa Ana	92706	(714) 442-1551	\N	Silvia / Adriana	sacevedo@rsnyderlaw.com	\N	1	2015-10-14 10:53:05	2015-10-14 17:18:47	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1171	Law Offices of Gabriel Martinez	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-10-13 14:20:09	0	0	\N	\N	\N	\N	\N	\N	\N	\N	2015-10-13 14:20:09
1321	Law Offices of Payman Zargari	5900 Sepulveda Blvd, Suite 304, Sherman Oaks, Ca 91411	\N	Los Angeles	91411	(818) 989-9800	(818) 989-9811	George	\N	\N	1	2015-10-06 16:24:30	2015-10-13 14:20:50	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1320	Steve K. Marks Law Office	8880 Rio San Diego Drive, Suite 800, San Diego, Ca 92108	\N	San Diego	92108	(619) 262-5555	(888) 322-3677	Joseph	\N	\N	1	2015-10-06 16:15:54	2015-10-13 14:22:33	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1324	Chahine & Associates	33 South Catalina Ave, Suite 202, Pasadena, Ca 91106	\N	Pasadena	91106	(626) 486-0154	(626) 486-0218	Amy/ Gaby	amy@chahinelaw.com	\N	1	2015-10-06 16:33:40	2015-10-13 14:23:52	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1322	Law Firm of Michael Holmes	505 N. Tustin Ave, Suite 195, Santa Ana, Ca 92705	\N	Santa Ana	92705	(888) 393-4529	(888) 712-0463	Evelyn / Daisy	daisy@californiaaccidentinjury.com	\N	1	2015-10-06 16:28:31	2015-10-13 14:29:18	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1326	Cancelled	N/A	\N	N/A	0	(999) 999-9999	\N	N/A		\N	0	2015-10-19 14:11:17	2015-10-19 14:11:17	0	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
1327	MedNation	4201 Long Beach Blvd	Suite 430	Long Beach	90807	(818) 697-6190	\N	Jordy/Yanira	intake@mednationinc.com	\N	0	2015-10-19 14:14:47	2015-10-19 14:14:48	0	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
1331	Pending/ Scheduling	N/A	\N	N/A	0	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-19 14:18:25	2015-10-19 14:18:25	0	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
1328	Pending/ Contacting Client	N/A	\N	N/A	0	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-19 14:15:12	2015-10-19 14:19:05	0	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
1329	Pending/ After Hours	N/A	\N	N/A	0	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-19 14:15:39	2015-10-19 14:19:34	0	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
1330	Pending/ Awaiting on Law Office to proceed	N/A	\N	N/A	0	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-19 14:16:29	2015-10-19 14:19:50	0	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
1161	RB Spine Center (Rancho Bernardo)	10801 Thornmint Rd #250		San Diego	92127	(858) 345-4114		Alma	admin@rbspinecenter.com	\N	0	2015-10-05 01:24:48	2015-10-21 14:05:44	0	1	\N	\N	\N	San Diego	\N	\N	\N	<span style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;">* Only take CT that are for one year, nothing less.</span>	\N
1163	RB Spine Center	601 E. San Ysidro #180	San Ysidro	San Ysidro	92173	(858) 345-4114		Alma	admin@rbspinecenter.com	\N	0	2015-10-05 01:24:48	2015-10-26 10:06:17	0	1	\N	\N	\N	San Diego	\N	\N	\N	<span style="color: rgb(44, 62, 80); font-size: 13px; line-height: 18.5714px;">* Only take CT that are for one year, nothing less.</span>	\N
1332	Risico Claims	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-27 13:31:04	2015-10-27 13:31:04	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1333	Great American	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-10-28 16:27:06	2015-10-28 16:27:42	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1334	Multi- Care Health Center	1250 S. Sunset Ave	Suite 206	West Covina	91790	(626) 488-8548	\N	Lidia	lidia@billing-office.com	\N	0	2015-11-02 11:06:28	2015-11-02 11:06:28	0	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
1335	Keystone Medical Group	540 N. Golden Circle	Suite 301	Santa Ana	92705	(951) 682-4404	\N	Lorena	scheduling@keystonemedicalgroup.com	\N	0	2015-11-03 12:47:41	2015-11-03 12:47:41	0	1	\N	\N	\N	\N	\N	\N	\N	Call appointments are schedule in the Riverside office	\N
1077	Enhanced Precision Care	530 W. Badillo Street	Suite D	Covina	91722	(800) 850-2693	(866) 273-1775	Rebecca/Jessica	acs@premiermedicalmarketing.com	\N	0	2015-10-05 01:24:48	2015-11-03 14:33:26	0	1	\N	\N	\N	Los Angeles	\N	\N	\N	<span style="line-height: 21.4286px;">Email paperwork to request appointment for client.</span>	\N
1336	California Insurance Company	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-11-03 17:04:14	2015-11-03 17:04:14	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1337	Claim Quest	N/A	\N	Los Angeles	90000	(999) 999-9999	\N	N/A	\N	\N	0	2015-11-04 15:49:41	2015-11-04 15:49:41	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1119	Keystone Medical Group	4843 Arlington Ave.		Riverside	92504	(951) 682-4404	(951) 682-4406	Ana	scheduling@keystonemedicalgroup.com	\N	0	2015-10-05 01:24:48	2015-11-06 16:31:53	0	1	\N	\N	\N	Riverside	\N	\N	\N	\N	\N
1338	US Administrator Claims	NA	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	0	2015-11-13 14:35:10	2015-11-13 14:35:10	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1339	Transwestern Insurance	P.O. Box 45019	\N	Fresno	93718	(559) 329-9823	\N	Adjuster	\N	\N	0	2015-11-18 16:14:33	2015-11-18 16:14:33	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1323	Law Office of Tamar Ekisian	7100 Hayvenhurt Ave, Van Nuys, Ca 91406	\N	Los Angeles	91406	(818) 772-4575	(818) 756-0998	N/A	\N	\N	1	2015-10-06 16:32:01	2015-11-24 08:56:20	0	0	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-24 08:56:20
1165	Screening Sign Up	N/A	\N	Los Angeles	90001	(999) 999-9999	\N	N/A	\N	\N	1	2015-10-05 10:53:26	2015-11-24 08:56:34	0	0	\N	\N	\N	\N	\N	\N	\N	\N	2015-11-24 08:56:34
\.


--
-- Name: requesting_offices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('requesting_offices_id_seq', 1339, true);


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
222	Attorneys	0	620	2015-10-09 10:11:21	2015-10-09 10:11:21
223	Doctors	0	620	2015-10-09 10:11:21	2015-10-09 10:11:21
224	Clients	1	620	2015-10-09 10:11:21	2015-10-09 10:11:21
225	Users	0	620	2015-10-09 10:11:21	2015-10-09 10:11:21
226	Searches	1	620	2015-10-09 10:11:21	2015-10-09 10:11:21
227	Reports	0	620	2015-10-09 10:11:21	2015-10-09 10:11:21
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
254	Body Parts	1	617	2015-10-16 12:30:26	2015-10-16 12:30:26
255	Regions	1	617	2015-10-16 12:30:26	2015-10-16 12:30:26
256	Confirmations	0	617	2015-10-16 12:30:26	2015-10-16 12:30:26
257	Cancelations	0	617	2015-10-16 12:30:26	2015-10-16 12:30:26
258	Law Offices	0	617	2015-10-16 12:30:26	2015-10-16 12:30:26
259	Clinics	0	617	2015-10-16 12:30:26	2015-10-16 12:30:26
260	Insurance Companies	0	617	2015-10-16 12:30:26	2015-10-16 12:30:26
261	Attorneys	0	617	2015-10-16 12:30:26	2015-10-16 12:30:26
262	Doctors	0	617	2015-10-16 12:30:26	2015-10-16 12:30:26
263	Clients	1	617	2015-10-16 12:30:26	2015-10-16 12:30:26
264	Users	0	617	2015-10-16 12:30:26	2015-10-16 12:30:26
265	Searches	1	617	2015-10-16 12:30:26	2015-10-16 12:30:26
266	Reports	0	617	2015-10-16 12:30:26	2015-10-16 12:30:26
267	Body Parts	1	624	2015-10-16 12:46:03	2015-10-16 12:46:03
268	Regions	1	624	2015-10-16 12:46:03	2015-10-16 12:46:03
269	Confirmations	0	624	2015-10-16 12:46:03	2015-10-16 12:46:03
270	Cancelations	0	624	2015-10-16 12:46:03	2015-10-16 12:46:03
271	Law Offices	0	624	2015-10-16 12:46:03	2015-10-16 12:46:03
272	Clinics	0	624	2015-10-16 12:46:03	2015-10-16 12:46:03
273	Insurance Companies	0	624	2015-10-16 12:46:03	2015-10-16 12:46:03
274	Attorneys	0	624	2015-10-16 12:46:03	2015-10-16 12:46:03
275	Doctors	0	624	2015-10-16 12:46:03	2015-10-16 12:46:03
276	Clients	1	624	2015-10-16 12:46:03	2015-10-16 12:46:03
277	Users	0	624	2015-10-16 12:46:03	2015-10-16 12:46:03
278	Searches	1	624	2015-10-16 12:46:03	2015-10-16 12:46:03
279	Reports	0	624	2015-10-16 12:46:03	2015-10-16 12:46:03
280	Body Parts	1	622	2015-10-19 11:11:08	2015-10-19 11:11:08
281	Regions	1	622	2015-10-19 11:11:08	2015-10-19 11:11:08
282	Confirmations	0	622	2015-10-19 11:11:08	2015-10-19 11:11:08
283	Cancelations	0	622	2015-10-19 11:11:08	2015-10-19 11:11:08
284	Law Offices	0	622	2015-10-19 11:11:08	2015-10-19 11:11:08
285	Clinics	0	622	2015-10-19 11:11:08	2015-10-19 11:11:08
286	Insurance Companies	0	622	2015-10-19 11:11:08	2015-10-19 11:11:08
287	Attorneys	0	622	2015-10-19 11:11:08	2015-10-19 11:11:08
288	Doctors	0	622	2015-10-19 11:11:08	2015-10-19 11:11:08
289	Clients	1	622	2015-10-19 11:11:08	2015-10-19 11:11:08
290	Users	0	622	2015-10-19 11:11:08	2015-10-19 11:11:08
291	Searches	1	622	2015-10-19 11:11:08	2015-10-19 11:11:08
292	Reports	0	622	2015-10-19 11:11:08	2015-10-19 11:11:08
313	Body Parts	1	616	2015-11-10 17:20:23	2015-11-10 17:20:23
314	Regions	1	616	2015-11-10 17:20:23	2015-11-10 17:20:23
315	Confirmations	0	616	2015-11-10 17:20:23	2015-11-10 17:20:23
316	Cancelations	0	616	2015-11-10 17:20:23	2015-11-10 17:20:23
317	Law Offices	0	616	2015-11-10 17:20:23	2015-11-10 17:20:23
318	Clinics	0	616	2015-11-10 17:20:23	2015-11-10 17:20:23
319	Insurance Companies	0	616	2015-11-10 17:20:23	2015-11-10 17:20:23
320	Attorneys	0	616	2015-11-10 17:20:23	2015-11-10 17:20:23
321	Doctors	0	616	2015-11-10 17:20:23	2015-11-10 17:20:23
322	Clients	1	616	2015-11-10 17:20:23	2015-11-10 17:20:23
323	Users	0	616	2015-11-10 17:20:23	2015-11-10 17:20:23
324	Searches	1	616	2015-11-10 17:20:23	2015-11-10 17:20:23
325	Reports	0	616	2015-11-10 17:20:23	2015-11-10 17:20:23
326	Clinics	0	626	2015-11-11 09:40:48	2015-11-11 09:40:48
327	Clients	0	626	2015-11-11 09:40:48	2015-11-11 09:40:48
328	Searches	1	626	2015-11-11 09:40:48	2015-11-11 09:40:48
329	Reports	1	626	2015-11-11 09:40:48	2015-11-11 09:40:48
330	Clients	0	625	2015-11-11 09:41:02	2015-11-11 09:41:02
331	Searches	1	625	2015-11-11 09:41:02	2015-11-11 09:41:02
332	Reports	1	625	2015-11-11 09:41:02	2015-11-11 09:41:02
335	Clients	0	627	2015-11-19 14:24:46	2015-11-19 14:24:46
336	Searches	1	627	2015-11-19 14:24:46	2015-11-19 14:24:46
337	Reports	0	627	2015-11-19 14:24:46	2015-11-19 14:24:46
338	Clients	0	628	2015-11-24 12:15:00	2015-11-24 12:15:00
339	Searches	1	628	2015-11-24 12:15:00	2015-11-24 12:15:00
340	Reports	1	628	2015-11-24 12:15:00	2015-11-24 12:15:00
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 340, true);


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
83	2015-10-09 11:24:13	2015-10-09 11:32:56	190.5.137.161	1	620	2015-10-09 11:24:13	2015-10-09 11:32:48	tIe5DXYNlujH8AhsSq03qdD3Fx8roWWtFBlxDZ7t	2015-10-09 11:32:48
78	2015-10-09 11:10:14	2015-10-09 11:11:44	190.5.137.161	1	617	2015-10-09 11:10:14	2015-10-09 11:11:29	UQYBzhbDU3oy9TLmgOS3RtdySnV4wnRFl7cGd83p	2015-10-09 11:11:29
60	2015-10-08 09:32:41	2015-10-08 10:26:11	64.183.24.210	1	611	2015-10-08 09:32:41	2015-10-08 09:37:10	N2wlpJgph4nmbfh1oNowuUKMRfR42YpJCjPEG4fj	2015-10-08 09:37:10
84	2015-10-09 11:33:04	2015-10-09 11:33:07	190.5.137.161	1	620	2015-10-09 11:33:04	2015-10-09 11:33:04	5r6fzuqxWire354jjTOM3WApDEkcmccJFv8jvO2U	2015-10-09 11:33:04
66	2015-10-08 12:56:55	2015-10-08 17:09:19	190.99.60.93	1	605	2015-10-08 12:56:55	2015-10-08 16:16:34	c5HGanxmiQz1nUIj0CsK33Xbh1DqGzxO0ZQP35kG	2015-10-08 16:16:34
81	2015-10-09 11:13:58	2015-10-09 11:13:58	54.165.243.229	0	605	2015-10-09 11:13:58	2015-10-09 11:14:47	MrOgcuW2bNyUcCh4ypChz6TmsDYwzZwaE43EBYcY	2015-10-09 11:14:47
64	2015-10-08 10:26:49	2015-10-09 10:39:36	64.183.24.210	1	611	2015-10-08 10:26:49	2015-10-09 10:12:11	uE2qDL2B2iOoN7yoagqwcWJrCuKo9CePi7dmtLuS	2015-10-09 10:12:11
71	2015-10-09 10:39:52	2015-10-09 10:39:56	64.183.24.210	1	616	2015-10-09 10:39:52	2015-10-09 10:39:52	qjttsb8ai96g7MMcjQw0PokY61hyEfPgkv0TjGjF	2015-10-09 10:39:52
68	2015-10-08 19:51:06	2015-10-08 19:51:06	190.99.60.93	0	605	2015-10-08 19:51:06	2015-10-08 20:02:11	yutjPRPblUucyScZAkB3ln6M0E2MaZMcAPrUprZV	2015-10-08 20:02:11
63	2015-10-08 09:50:45	2015-10-08 09:50:45	190.62.6.88	0	615	2015-10-08 09:50:45	2015-10-10 09:10:09	kEvb1ZLd3t0vtqPlT7Z64yzR4SxOSlhGqbYjmN72	2015-10-10 09:10:09
85	2015-10-09 11:33:12	2015-10-09 11:33:22	190.5.137.161	1	620	2015-10-09 11:33:12	2015-10-09 11:33:21	t2z1kSCYIqu3rgsb2kmsguprKlDxtGucpTB99HTq	2015-10-09 11:33:21
79	2015-10-09 11:10:57	2015-10-09 11:10:57	173.63.111.134	0	605	2015-10-09 11:10:57	2015-10-09 11:15:16	6MhxwHG8sYIhjfGWwGT6t39ZzzEJeWB6hYaCDL8B	2015-10-09 11:15:16
89	2015-10-09 13:19:53	2015-10-09 13:53:35	64.183.24.210	1	616	2015-10-09 13:19:53	2015-10-09 13:53:20	rFYGmxRGVJFiOFTvLC0dhwxcjwm13XuhFgLxkEcR	2015-10-09 13:53:20
86	2015-10-09 11:33:25	2015-10-09 11:33:25	190.5.137.161	0	620	2015-10-09 11:33:25	2015-10-09 11:33:25	ZFre2Jy9hfyqVbBn7fDcUwf7qDcnIPit9bTSJsX4	2015-10-09 11:33:25
91	2015-10-09 13:56:55	2015-10-09 13:56:55	64.183.24.210	0	614	2015-10-09 13:56:55	2015-10-09 15:56:43	joOPBRdK4VqJPVQJGE29FkoOqz0icCo3FP5DtYOb	2015-10-09 15:56:43
80	2015-10-09 11:11:46	2015-10-09 11:11:46	190.5.137.161	0	617	2015-10-09 11:11:46	2015-10-09 15:46:36	P9gcsO1XtKAZTvzGmqYPSdxVbWcpJdhMNMd3R53b	2015-10-09 15:46:36
96	2015-10-12 11:37:20	2015-10-12 22:28:18	190.62.40.19	1	615	2015-10-12 11:37:20	2015-10-12 21:26:47	2GQoz9dKIpC0hO0S6FL3ZyUZwxjccc8UlPlwr51B	2015-10-12 21:26:47
97	2015-10-12 13:25:29	2015-10-12 13:25:29	64.183.24.210	0	616	2015-10-12 13:25:29	2015-10-12 14:25:35	b9HzUv9CEmPAm8ET8D1wpYPcBSRjR7FwcsFEYzGk	2015-10-12 14:25:35
94	2015-10-09 20:37:39	2015-10-12 11:37:06	190.62.6.88	1	615	2015-10-09 20:37:39	2015-10-12 11:36:03	1ofOGrvyH7gREeK0vtOGkFe33uyMOcyXnFFhWOa5	2015-10-12 11:36:03
95	2015-10-12 11:27:36	2015-10-12 11:28:53	190.62.40.19	1	615	2015-10-12 11:27:36	2015-10-12 11:28:46	X8kiaFwZc5yBKBZ1MjbiUd5T6R06ifEBc2VoAbjs	2015-10-12 11:28:46
103	2015-10-12 15:45:32	2015-10-12 15:45:32	64.183.24.210	0	614	2015-10-12 15:45:32	2015-10-12 16:51:56	6IJQV9967rhHkUmW3FcSYHNvMJUwHDehl7O4yrHr	2015-10-12 16:51:56
99	2015-10-12 14:00:07	2015-10-12 14:26:55	64.183.24.210	1	611	2015-10-12 14:00:07	2015-10-12 14:26:51	76pm2sDgWtkeN6TrHAkZXW6qXSL2K8v3MQumyERO	2015-10-12 14:26:51
101	2015-10-12 14:41:06	2015-10-12 17:08:03	190.62.40.19	1	615	2015-10-12 14:41:06	2015-10-12 16:58:31	HWuTuWPNonqQVX9aK3ivrFUlsRGJCfehmK5T1tWP	2015-10-12 16:58:31
98	2015-10-12 13:50:05	2015-10-12 13:59:47	64.183.24.210	1	611	2015-10-12 13:50:05	2015-10-12 13:59:36	FwrOph2daXex2Jl22bpKxpTaeqwASLwtcyBATUsv	2015-10-12 13:59:36
75	2015-10-09 10:51:01	2015-10-14 12:44:41	190.5.137.161	1	618	2015-10-09 10:51:01	2015-10-14 12:44:32	AXbTwEIxAR7LR1X3aRF012Zp5mtsNlIr4di5BKaP	2015-10-14 12:44:32
87	2015-10-09 11:33:33	2015-10-13 11:05:48	190.5.137.161	1	620	2015-10-09 11:33:33	2015-10-13 10:58:47	88iQHfZQP2zy753VCLCWgKLu9IShCC5PGh2ueBcE	2015-10-13 10:58:47
92	2015-10-09 15:51:35	2015-10-16 08:46:19	190.5.137.161	1	617	2015-10-09 15:51:35	2015-10-16 08:45:53	tLimqYDjARDFx5dhGz6WO4SIY7mPAKxKZhx9xDVN	2015-10-16 08:45:53
93	2015-10-09 17:45:30	2015-10-12 14:40:53	190.62.6.88	1	615	2015-10-09 17:45:30	2015-10-12 14:40:30	a65FQtJLJDpFen1siuzlHhrFT26XiQ3jqObF1Uvz	2015-10-12 14:40:30
102	2015-10-12 14:41:44	2015-10-12 17:09:16	190.62.40.19	1	615	2015-10-12 14:41:44	2015-10-12 16:48:27	G4GvppoFQo31lXeRHoV47O6VLjM0SCA4BpKEojok	2015-10-12 16:48:27
82	2015-10-09 11:15:23	2015-10-09 11:15:23	190.5.137.161	0	622	2015-10-09 11:15:23	2015-10-15 16:48:47	YemATWwI7eHUEXSe7BVJBD4xhc1zqYTY8CG0ChCR	2015-10-15 16:48:47
100	2015-10-12 14:27:14	2015-10-13 09:14:29	64.183.24.210	1	611	2015-10-12 14:27:14	2015-10-13 09:14:25	gWD5NflC5zoFHe6hJYVQ4K5Lyeh5LdVAkQLxGIMX	2015-10-13 09:14:25
88	2015-10-09 11:39:25	2015-10-09 11:39:25	190.5.137.161	0	621	2015-10-09 11:39:25	2015-10-16 11:39:03	Jd1Iinqy0a99e5v9eEnblDydRAE1FTgMhD4mMdFz	2015-10-16 11:39:03
104	2015-10-12 19:00:26	2015-10-12 19:00:26	190.62.40.19	0	615	2015-10-12 19:00:26	2015-10-13 07:22:33	t5Iz70fHoFXUU2Yz7Pk5t4JFsp5AEFwqKAG76kSK	2015-10-13 07:22:33
149	2015-10-19 15:42:56	2015-10-20 07:35:49	138.99.3.178	1	622	2015-10-19 15:42:56	2015-10-19 15:59:28	4DqNZCkAyFkJPSo1fXWVziZX8pFXtH4RJlsqOTDo	2015-10-19 15:59:28
110	2015-10-13 11:05:50	2015-10-16 09:06:37	190.5.137.161	1	620	2015-10-13 11:05:50	2015-10-16 09:06:27	1LWyAe5EzWZkgLtwOykSE5tI0VMDnqKPmJd4IxOx	2015-10-16 09:06:27
132	2015-10-16 12:44:56	2015-10-16 16:33:53	64.183.24.210	1	611	2015-10-16 12:44:56	2015-10-16 14:06:01	AFovez8Av8jPZLoHzL8PYYDNtgM64ejKvcUCKAaV	2015-10-16 14:06:01
136	2015-10-16 15:16:11	2015-10-16 16:41:25	190.5.137.161	1	624	2015-10-16 15:16:11	2015-10-16 16:41:24	J6TF73Y1DSaw79rNPwHtdKBwxOfFxNeXIMUWWzXc	2015-10-16 16:41:24
116	2015-10-14 15:02:27	2015-10-16 11:47:53	64.183.24.210	1	616	2015-10-14 15:02:27	2015-10-16 11:41:51	aDZUPsRjeeANVSeK3rYhdmlDMey68cRR4yfDYLq3	2015-10-16 11:41:51
106	2015-10-13 08:44:05	2015-10-16 10:54:54	190.62.40.19	1	615	2015-10-13 08:44:05	2015-10-16 10:54:50	JnlpiiQxmS1ySySysmlW67nDj8zZDBq0dxN36oBe	2015-10-16 10:54:50
158	2015-10-20 11:12:16	2015-10-20 11:46:58	64.183.24.210	1	611	2015-10-20 11:12:16	2015-10-20 11:40:00	MZDf1kTR6wbLt47ElX6NomX6Q46HfLI8HwzDJrlh	2015-10-20 11:40:00
114	2015-10-14 09:19:54	2015-10-14 17:24:28	64.183.24.210	1	611	2015-10-14 09:19:54	2015-10-14 17:18:49	6u1mO7asqLMo0k6a1iadDPMw3c5Tx3hySkF5d5tZ	2015-10-14 17:18:49
125	2015-10-16 11:41:15	2015-10-21 12:30:25	190.5.137.161	1	621	2015-10-16 11:41:15	2015-10-21 12:30:21	4yYPWbAsNipoei3t9CnBeWeBnOKAbWG1jvrOEC8w	2015-10-21 12:30:21
127	2015-10-16 12:00:41	2015-10-16 12:55:16	190.5.137.161	1	622	2015-10-16 12:00:41	2015-10-16 12:03:26	jJWfS1j2CA5evs7zGcaYrbXYbHWqQ6qDWwtdPcSI	2015-10-16 12:03:26
123	2015-10-16 09:06:39	2015-10-22 09:06:15	190.5.137.161	1	620	2015-10-16 09:06:39	2015-10-22 09:05:55	KBZGtZbWGHZEdShhToEe3aXFvXJvtgVcPqbcc4kt	2015-10-22 09:05:55
115	2015-10-14 12:44:44	2015-10-21 08:42:23	190.5.137.161	1	618	2015-10-14 12:44:44	2015-10-21 08:42:05	PmQ03NqtZJszXWyDIlsGFvZGsx18UWrNJ9wmJaa4	2015-10-21 08:42:05
118	2015-10-15 08:37:43	2015-10-15 08:53:29	64.183.24.210	1	611	2015-10-15 08:37:43	2015-10-15 08:52:54	rAWDBIIKmWeIVPgxmgd1TDQwE963SeddiOhEii3x	2015-10-15 08:52:54
108	2015-10-13 09:14:50	2015-10-13 09:15:06	64.183.24.210	1	621	2015-10-13 09:14:50	2015-10-13 09:14:58	pp5XWMcYk6Jf8DyDZyapoDwgvzcuqCHYMgzSqFwO	2015-10-13 09:14:58
151	2015-10-20 09:04:31	2015-10-20 09:04:31	64.183.24.210	0	614	2015-10-20 09:04:31	2015-10-27 09:04:00	ULX3JAZRVHMVMWaOStqyvHWrslUSLySXjc8wmxu5	2015-10-27 09:04:00
111	2015-10-13 11:33:11	2015-10-13 14:42:34	64.183.24.210	1	611	2015-10-13 11:33:11	2015-10-13 14:29:27	8zTlrUNugGp2l1lqhtjX5DK13HBcTuzVUcwHxK4J	2015-10-13 14:29:27
121	2015-10-15 16:57:21	2015-10-15 16:57:21	190.62.51.233	0	615	2015-10-15 16:57:21	2015-10-15 16:58:51	rfefrIjmyQuuZIuVnKm0It03EE0EERD51sqsgRsr	2015-10-15 16:58:51
105	2015-10-13 08:15:53	2015-10-13 08:15:53	64.183.24.210	0	616	2015-10-13 08:15:53	2015-10-13 11:04:23	E9kkm6I85Kq9qY1HoYwDQI1aGOx0fBOOgos5cyL9	2015-10-13 11:04:23
112	2015-10-13 11:52:29	2015-10-14 15:01:39	64.183.24.210	1	616	2015-10-13 11:52:29	2015-10-14 15:01:24	S4kHC3XziBbds0gee3UsGZAPFBC4U3JjHTQCiGXP	2015-10-14 15:01:24
140	2015-10-19 08:19:32	2015-10-19 11:06:47	138.99.3.178	1	624	2015-10-19 08:19:32	2015-10-19 09:36:33	cW8kldwIzPUvUNxT0pZP2yrbsigxCeUXpOVbtXzi	2015-10-19 09:36:33
107	2015-10-13 09:05:27	2015-10-14 09:10:11	64.183.24.210	1	614	2015-10-13 09:05:27	2015-10-14 09:10:05	8X4ZxcWk4XSNHlqOSAZMApfBkUeXuo8yowuqWxN8	2015-10-14 09:10:05
119	2015-10-15 08:53:58	2015-10-16 12:03:31	64.183.24.210	1	611	2015-10-15 08:53:58	2015-10-16 12:03:27	19rMs5XCWYVgKXWUhMQagnFh3gFtgz85fpKQsLRK	2015-10-16 12:03:27
126	2015-10-16 11:48:07	2015-10-16 14:53:02	64.183.24.210	1	616	2015-10-16 11:48:07	2015-10-16 14:50:01	MMFWihq1lwi7QMNW5PH5EPBVKH4Bi3DLsYXvY5yy	2015-10-16 14:50:01
113	2015-10-14 09:10:47	2015-10-15 09:08:58	64.183.24.210	1	614	2015-10-14 09:10:47	2015-10-15 09:07:51	hrPcOqfQYoKTUSNvGOR0tcEKWMH4XnKjC1SdCX93	2015-10-15 09:07:51
122	2015-10-16 08:46:26	2015-10-16 12:04:09	190.5.137.161	1	617	2015-10-16 08:46:26	2015-10-16 12:04:02	sZH8l12F5PxYFXT4YjkqIzvi5Dp5J2wY4HuBdPEU	2015-10-16 12:04:02
137	2015-10-16 16:41:34	2015-10-16 16:59:14	190.5.137.161	1	624	2015-10-16 16:41:34	2015-10-16 16:59:12	Opd6Kx0AjygvOPpGKCP4xg472pchWtaQGubzLY7h	2015-10-16 16:59:12
129	2015-10-16 12:04:18	2015-10-16 12:30:40	190.5.137.161	1	617	2015-10-16 12:04:18	2015-10-16 12:25:29	EjaQae1mV5KIGOmYci3GodcPVnMaOa9D3TgjX6Ig	2015-10-16 12:25:29
128	2015-10-16 12:04:04	2015-10-16 12:44:35	64.183.24.210	1	611	2015-10-16 12:04:04	2015-10-16 12:44:24	frT9knWxTiwyp4W3KSao3DX9X0pPnL6eAwpa7IPA	2015-10-16 12:44:24
109	2015-10-13 09:15:32	2015-10-13 11:32:47	64.183.24.210	1	611	2015-10-13 09:15:32	2015-10-13 11:32:15	DukQR2ohv3fRQRArYlHRD4LWO8scb33qALAz5h0F	2015-10-13 11:32:15
124	2015-10-16 11:25:34	2015-10-16 12:04:34	64.183.24.210	1	614	2015-10-16 11:25:34	2015-10-16 12:02:55	4EuDoWspQl2imqHe3oPIno7tgnxH8wNrBazrJE3l	2015-10-16 12:02:55
139	2015-10-19 07:48:32	2015-10-19 08:19:22	138.99.3.178	1	624	2015-10-19 07:48:32	2015-10-19 08:18:14	RWPpqoTfxKkIBarln5zMYcjXRsr0wgHpSqymHA1m	2015-10-19 08:18:14
138	2015-10-16 16:43:46	2015-10-20 11:01:29	104.131.168.156	1	615	2015-10-16 16:43:46	2015-10-20 11:01:28	JqAVNeLJTIf6VJE3d7y8oZ0kA2MbYGeXP6xaws9k	2015-10-20 11:01:28
143	2015-10-19 11:12:33	2015-10-19 11:36:02	138.99.3.178	1	622	2015-10-19 11:12:33	2015-10-19 11:36:00	PwhMP3jDhEugKdDciQqk1AYaofq2JiTfZSZE0vz8	2015-10-19 11:36:00
130	2015-10-16 12:05:02	2015-10-19 09:08:21	64.183.24.210	1	614	2015-10-16 12:05:02	2015-10-19 09:08:15	E4lhdDH4b0om7oEzn6hcFokbIoxtt54ZuvUfp3jX	2015-10-19 09:08:15
120	2015-10-15 09:10:06	2015-10-16 11:25:11	64.183.24.210	1	614	2015-10-15 09:10:06	2015-10-16 11:25:05	LNITc9YhFgBXeNtpSVayhyNn1rX8U8BZw7PJX3xy	2015-10-16 11:25:05
142	2015-10-19 10:58:38	2015-10-20 10:21:04	64.183.24.210	1	611	2015-10-19 10:58:38	2015-10-20 10:19:36	8XEPHBoO7Fxia3JPQiC23tznxWy54Cgt69gS2Dbw	2015-10-20 10:19:36
131	2015-10-16 12:31:19	2015-10-16 12:48:39	190.5.137.161	1	617	2015-10-16 12:31:19	2015-10-16 12:32:45	ZSE2V6yGtXt8cc6iunf5hok5M0jTdlCSiTotDkqA	2015-10-16 12:32:45
145	2015-10-19 11:53:49	2015-10-19 12:32:29	138.99.3.178	1	622	2015-10-19 11:53:49	2015-10-19 12:32:23	wotmKX9NCv9kduOVIeriZmClwNsFwGW3dIWRgUVd	2015-10-19 12:32:23
147	2015-10-19 12:43:18	2015-10-19 12:56:14	138.99.3.178	1	622	2015-10-19 12:43:18	2015-10-19 12:44:36	pgKcK9pV7b3lBvyHRL8wwshw9fHsagfLarQEsLmX	2015-10-19 12:44:36
148	2015-10-19 12:57:09	2015-10-19 15:41:30	138.99.3.178	1	622	2015-10-19 12:57:09	2015-10-19 15:41:07	Y3r735bDr1166XF66cILH1VhFjZv4UCXiwRyE0JN	2015-10-19 15:41:07
144	2015-10-19 11:37:09	2015-10-19 11:53:21	138.99.3.178	1	622	2015-10-19 11:37:09	2015-10-19 11:48:05	i4NL4xijlc3RJHtdH85XMa6cSVEHcrIge92uam8g	2015-10-19 11:48:05
146	2015-10-19 12:33:00	2015-10-19 12:42:55	138.99.3.178	1	622	2015-10-19 12:33:00	2015-10-19 12:42:42	bdmN0J7DbSw8lhyMKlyKBBvx1LRR3VgAb6MqHtus	2015-10-19 12:42:42
152	2015-10-20 10:09:54	2015-10-20 10:10:09	138.99.3.178	1	622	2015-10-20 10:09:54	2015-10-20 10:10:06	kfbXExLXc4MG1un1teunw2JNNHl97g85FMSzrENm	2015-10-20 10:10:06
155	2015-10-20 10:21:38	2015-10-20 11:07:28	64.183.24.210	1	611	2015-10-20 10:21:38	2015-10-20 11:05:23	kpa731kz7PjZZyIiQngjjrE1tfgKBQ1hMHXgVYbf	2015-10-20 11:05:23
150	2015-10-20 07:44:15	2015-10-20 10:09:12	138.99.3.178	1	622	2015-10-20 07:44:15	2015-10-20 09:50:28	nUkpmLsjzWL9agMDYmBj09auAJFuhboycP2azA4r	2015-10-20 09:50:28
117	2015-10-14 15:20:05	2015-10-14 15:20:05	190.62.3.68	0	615	2015-10-14 15:20:05	2015-10-19 22:46:43	aOoy3IlrfZR4zhHBevUZ5epWApsXSHEWKZimx4UZ	2015-10-19 22:46:43
141	2015-10-19 09:11:04	2015-10-20 09:04:01	64.183.24.210	1	614	2015-10-19 09:11:04	2015-10-20 09:03:52	RbM3BG4yTabYWmOgaJJUhtJs88Zi73REcdZAUZsZ	2015-10-20 09:03:52
153	2015-10-20 10:10:13	2015-10-20 10:10:21	138.99.3.178	1	622	2015-10-20 10:10:13	2015-10-20 10:10:14	bn2R7wS3uVaMb3CjpoBpgwpV4b4V0q8RtwrAWrq5	2015-10-20 10:10:14
156	2015-10-20 11:01:45	2015-10-20 11:20:26	190.62.60.21	1	615	2015-10-20 11:01:45	2015-10-20 11:19:47	hXgaYrKSPBTCiuV66soKoKosddK7ee6FB7Lj8Jen	2015-10-20 11:19:47
157	2015-10-20 11:10:50	2015-10-20 11:11:34	64.183.24.210	1	611	2015-10-20 11:10:50	2015-10-20 11:11:22	kI0SITpEzcjtUbXtyIAvM4DRcNvHCgxzuFAVYAcv	2015-10-20 11:11:22
175	2015-10-21 15:52:33	2015-10-21 17:29:05	138.99.3.178	1	622	2015-10-21 15:52:33	2015-10-21 16:21:07	k7ZIxn6zoTvIsLuJoiGJftsG1jXuUriCHxsrxafA	2015-10-21 16:21:07
164	2015-10-20 17:37:41	2015-10-20 17:37:41	190.62.60.21	0	615	2015-10-20 17:37:41	2015-10-20 17:42:46	3wpU7jX9oSPFzfrWdMC3IpAq9VZ51RhqWP5Uta6f	2015-10-20 17:42:46
159	2015-10-20 11:32:35	2015-10-20 11:41:51	190.62.60.21	1	615	2015-10-20 11:32:35	2015-10-20 11:38:49	NDw628zQkK1wWQDeHlgcyhNBWrKVcXZh1PEkpdxj	2015-10-20 11:38:49
187	2015-10-22 14:18:29	2015-10-23 08:39:39	64.183.24.210	1	625	2015-10-22 14:18:29	2015-10-23 08:39:32	cyRtsJwEJoxzwnlKlkqemxPlio0n7itivGyJWTbT	2015-10-23 08:39:32
184	2015-10-22 12:06:55	2015-10-22 14:13:13	64.183.24.210	1	611	2015-10-22 12:06:55	2015-10-22 12:07:34	hyQgZamkbZfwvwLbj7iW3pMWzr7fs1Ch99eJF6jk	2015-10-22 12:07:34
167	2015-10-21 08:43:22	2015-10-21 08:47:31	64.183.24.210	1	625	2015-10-21 08:43:22	2015-10-21 08:47:20	euX27FA9B0QkY6dn13UG03R3yJJylnKMujmEyA5C	2015-10-21 08:47:20
201	2015-10-30 09:57:19	2015-10-30 09:57:19	190.62.41.159	0	615	2015-10-30 09:57:19	2015-11-02 07:40:21	6Ga1gmycweae9yPUchcJXRkUXoEH1uCAVgKRK5B6	2015-11-02 07:40:21
174	2015-10-21 12:30:27	2015-10-21 12:30:27	138.99.3.178	0	621	2015-10-21 12:30:27	2015-10-28 09:31:03	Is2VNpVVXMACKBBX3ZwSr6o8yfPLCdoYOS50HNrq	2015-10-28 09:31:03
171	2015-10-21 08:50:44	2015-10-21 09:23:55	64.183.24.210	1	611	2015-10-21 08:50:44	2015-10-21 09:23:51	umA0WCxQUGVXTaPVZDIgSM8hIzHaBLukTghpF18G	2015-10-21 09:23:51
168	2015-10-21 08:48:37	2015-10-21 08:49:26	64.183.24.210	1	611	2015-10-21 08:48:37	2015-10-21 08:49:21	uSCqFtyURHUFUy8VjrIChPrCNwtm2SWhfCjsdmmT	2015-10-21 08:49:21
163	2015-10-20 13:41:51	2015-10-21 08:41:30	64.183.24.210	1	611	2015-10-20 13:41:51	2015-10-21 08:28:07	4ToLcBcqChiwMGbKcYeZywrV2H4SBVRRnF0Q4IDF	2015-10-21 08:28:07
166	2015-10-21 08:42:35	2015-10-21 09:20:06	138.99.3.178	1	618	2015-10-21 08:42:35	2015-10-21 09:20:03	UdYrFzIbsqCjbVy8XbVga9n0xfPUL2w9A4hU8E53	2015-10-21 09:20:03
176	2015-10-22 08:46:25	2015-10-22 09:22:18	190.99.60.93	1	605	2015-10-22 08:46:25	2015-10-22 08:51:22	tbjsJGEEzqjuC0lMMYFgujSR0VZvzeC6YHbyQQ4N	2015-10-22 08:51:22
169	2015-10-21 08:49:50	2015-10-21 08:50:15	64.183.24.210	1	625	2015-10-21 08:49:50	2015-10-21 08:50:07	56aqIgiXziLUqTb3IlRYePmouECkTvwDotSCV0G0	2015-10-21 08:50:07
165	2015-10-21 08:42:18	2015-10-21 08:43:04	64.183.24.210	1	611	2015-10-21 08:42:18	2015-10-21 08:42:55	0E5d4InrNufO4oV5Jr2tDynQwDlc0YmuJRZFbXgm	2015-10-21 08:42:55
154	2015-10-20 10:10:28	2015-10-21 08:43:15	138.99.3.178	1	622	2015-10-20 10:10:28	2015-10-21 08:01:46	EoI7eUrlKuylt9YpVixFTvzvU7wu7dJ1hVDvAnCC	2015-10-21 08:01:46
183	2015-10-22 12:03:55	2015-10-22 12:06:15	64.183.24.210	1	625	2015-10-22 12:03:55	2015-10-22 12:05:15	0kpQIgIQdpz8W5ES9w2Zd5iB3tdNeYpXTHjSqRJK	2015-10-22 12:05:15
180	2015-10-22 09:06:17	2015-10-22 09:06:17	138.99.3.178	0	620	2015-10-22 09:06:17	2015-10-26 15:41:17	7HGGy8F1UzzVWqELMwIK4zNVdKJv4nVMHue2BXJc	2015-10-26 15:41:17
172	2015-10-21 09:20:09	2015-10-22 08:57:29	138.99.3.178	1	618	2015-10-21 09:20:09	2015-10-22 08:53:13	enaMZgDYEnb5au0PmpAQGNZDAp6x30iaOh1snFB1	2015-10-22 08:53:13
160	2015-10-20 11:42:09	2015-10-23 17:40:35	190.62.60.21	1	605	2015-10-20 11:42:09	2015-10-23 17:39:31	7b8iCsIxlNJACB3nbFai5DTdXKIwW4filU2PpKyn	2015-10-23 17:39:31
203	2015-10-30 11:33:03	2015-10-30 11:34:12	64.183.24.210	1	611	2015-10-30 11:33:03	2015-10-30 11:34:09	MLWbCMuKl1LnF3ATFyBTANTbWq07WtUHzG0u6mM4	2015-10-30 11:34:09
162	2015-10-20 11:52:40	2015-10-20 17:35:59	190.62.60.21	1	611	2015-10-20 11:52:40	2015-10-20 17:35:36	SO9UT4LcpNL5oasact4P36oMDYi9zRq95mMqPMRt	2015-10-20 17:35:36
182	2015-10-22 09:23:26	2015-10-22 09:23:26	190.99.60.93	0	605	2015-10-22 09:23:26	2015-10-22 16:02:44	9hq7AoYtVn4P8oZXkrB50tzWpTPOcsheIt5PvIQF	2015-10-22 16:02:44
161	2015-10-20 11:47:21	2015-10-20 11:47:21	64.183.24.210	0	611	2015-10-20 11:47:21	2015-10-20 11:56:15	NKRIGtSEcDNy44UMmgif52Kg5X9uaCRDvh4ZYBYu	2015-10-20 11:56:15
191	2015-10-26 07:41:55	2015-10-27 11:25:44	190.5.137.161	1	622	2015-10-26 07:41:55	2015-10-27 10:55:59	5VnDL5Qk7QJ7RoOjfyJ3FlNLiHSVPRFXLhhe6Jx3	2015-10-27 10:55:59
199	2015-10-28 16:16:39	2015-10-30 11:30:57	64.183.24.210	1	611	2015-10-28 16:16:39	2015-10-30 11:30:42	XSy8iyQsu0jDxOWwGjsiEtM2B5ygyOoJMDDb4cH6	2015-10-30 11:30:42
186	2015-10-22 14:15:59	2015-10-22 14:18:14	64.183.24.210	1	611	2015-10-22 14:15:59	2015-10-22 14:17:07	RDrKNuKPy71DKJpj87xCmKLsenTFKLkoo6jjzqen	2015-10-22 14:17:07
177	2015-10-22 08:57:33	2015-10-22 09:00:48	138.99.3.178	1	618	2015-10-22 08:57:33	2015-10-22 09:00:00	tOvkKkF5NS6jFtxsQzVfpbILBtuOwM04tXNfzZmA	2015-10-22 09:00:00
179	2015-10-22 09:05:10	2015-10-22 12:03:17	64.183.24.210	1	611	2015-10-22 09:05:10	2015-10-22 09:38:01	pIxz4mRe1UELgCZdyNDoIE7VwzRfnsy74FJbHQHX	2015-10-22 09:38:01
170	2015-10-21 08:49:56	2015-10-21 15:52:25	138.99.3.178	1	622	2015-10-21 08:49:56	2015-10-21 09:44:14	FKhZCZx3CUqDlcTGCZaab5LTbmoopCf9Bv1xnMD6	2015-10-21 09:44:14
188	2015-10-22 15:23:36	2015-10-23 08:22:44	138.99.3.178	1	622	2015-10-22 15:23:36	2015-10-22 16:10:34	J536gRD3K9vgesz7piQrI9xhAmeUDYFGWYyv15WL	2015-10-22 16:10:34
173	2015-10-21 09:24:45	2015-10-22 09:04:49	64.183.24.210	1	611	2015-10-21 09:24:45	2015-10-22 09:04:47	em4WKKZFyfK7gZoo6Gp6C7qD65zR4EXp0f74NHXv	2015-10-22 09:04:47
181	2015-10-22 09:07:56	2015-10-22 12:04:29	138.99.3.178	1	622	2015-10-22 09:07:56	2015-10-22 12:04:24	MxWHP2nrxJuBLFwdBcAZNMWBJBJYqGB1E7vl6FlG	2015-10-22 12:04:24
185	2015-10-22 14:13:48	2015-10-22 14:15:44	64.183.24.210	1	625	2015-10-22 14:13:48	2015-10-22 14:14:31	3A62khJ5MyU7ChZtYy3dwjlvWMwRo1mOd05S53YZ	2015-10-22 14:14:31
194	2015-10-26 08:47:09	2015-10-28 16:16:20	64.183.24.210	1	611	2015-10-26 08:47:09	2015-10-28 16:14:35	vafaDv3h8jPjgPMO8h9hfYFzi4pGz7lCpo6SVUOr	2015-10-28 16:14:35
178	2015-10-22 09:00:55	2015-10-22 09:00:55	138.99.3.178	0	618	2015-10-22 09:00:55	2015-10-28 12:57:05	PHkeAXL47BM1Rp3gtJumznDqxSFmxDscjmNudmpJ	2015-10-28 12:57:05
190	2015-10-23 10:11:44	2015-10-23 16:56:04	138.99.3.178	1	622	2015-10-23 10:11:44	2015-10-23 16:52:56	GUMXuG9wgS7nLcobvFlJ5s6xc5m7ongMaJHXkHx5	2015-10-23 16:52:56
198	2015-10-28 13:20:43	2015-10-28 13:20:43	190.5.137.161	0	621	2015-10-28 13:20:43	2015-10-28 14:11:12	ccyzUu0CSVWwkEXbRWxdwwgHG5N4zkVaiAATFVGS	2015-10-28 14:11:12
135	2015-10-16 14:53:12	2015-10-16 14:53:12	64.183.24.210	0	616	2015-10-16 14:53:12	2015-10-23 13:00:20	OeB1wJa2QeLUq5YmOO7EBz1HusI7C07d9wuV8LaT	2015-10-23 13:00:20
189	2015-10-23 08:39:55	2015-10-23 15:35:54	64.183.24.210	1	611	2015-10-23 08:39:55	2015-10-23 08:39:55	1fFd8DVYE1TATkZbZJrNaKY7YkoirQFjWA1ihRRg	2015-10-23 08:39:55
192	2015-10-26 08:17:52	2015-10-26 08:17:52	64.183.24.210	0	616	2015-10-26 08:17:52	2015-10-26 08:17:53	ZgRXInqXZMV3Tr3JIS1u1Aog8Z2wtyeK2KutL1Yl	2015-10-26 08:17:53
200	2015-10-29 00:25:38	2015-10-29 00:25:38	190.62.41.159	0	615	2015-10-29 00:25:38	2015-10-29 11:57:05	VwVokRtYN9AZTMC1zamoDAy6wBUSGBxTvOUCqSVH	2015-10-29 11:57:05
197	2015-10-28 07:47:20	2015-10-28 07:47:20	190.5.137.161	0	622	2015-10-28 07:47:20	2015-10-28 10:34:55	SYfenZHMDEcH3z5qLJ3U0zEbP0hv4hi04y7Opb0B	2015-10-28 10:34:55
196	2015-10-27 11:25:46	2015-10-28 07:47:11	190.5.137.161	1	622	2015-10-27 11:25:46	2015-10-27 17:18:46	C8AfXUDhI8HiLweD9rHdg5HOcM1vYWawrCTGRaBP	2015-10-27 17:18:46
204	2015-10-30 11:34:40	2015-10-30 11:35:49	64.183.24.210	1	625	2015-10-30 11:34:40	2015-10-30 11:35:36	mgnui1giLuBH2QAMUeFZzspJsleSTBDuvCN6N8Mr	2015-10-30 11:35:36
202	2015-10-30 11:32:05	2015-10-30 11:32:45	64.183.24.210	1	625	2015-10-30 11:32:05	2015-10-30 11:32:31	Dn3g0D6qXn4iZOKabTLpwiuLPsENtbDWYaSbTzr2	2015-10-30 11:32:31
205	2015-10-30 11:36:02	2015-10-30 11:36:02	64.183.24.210	0	611	2015-10-30 11:36:02	2015-10-30 15:49:35	m0vEmMTDF6qAajD56xWCQfC4PaNboibRItjdOglN	2015-10-30 15:49:35
193	2015-10-26 08:19:00	2015-10-26 08:19:00	64.183.24.210	0	616	2015-10-26 08:19:00	2015-10-30 17:06:31	1KDZvbeaAKbVrFiM9jcGxsoPd4JH9ClzHY0LafBw	2015-10-30 17:06:31
195	2015-10-27 09:05:43	2015-10-27 09:05:43	64.183.24.210	0	614	2015-10-27 09:05:43	2015-10-30 17:01:30	10IstpiB9jLODAVd05UrFiJY5gtxE2gLF2FJi1A3	2015-10-30 17:01:30
206	2015-11-02 08:34:23	2015-11-02 08:34:23	190.62.10.146	0	615	2015-11-02 08:34:23	2015-11-02 08:34:32	lqeNspBeQVKDWco8LyMvCThOiEroBATzrQlgejxE	2015-11-02 08:34:32
210	2015-11-03 07:14:55	2015-11-03 07:14:55	190.99.60.93	0	605	2015-11-03 07:14:55	2015-11-03 07:15:39	CH8iZID3GIQzMWMf8vXOvkSiDpp4bZuGmfdFeFb2	2015-11-03 07:15:39
211	2015-11-03 10:19:08	2015-11-03 13:04:27	64.183.24.210	1	611	2015-11-03 10:19:08	2015-11-03 12:47:42	Xo3gxkgY6bMDFfsBGy8t5s8tLo5KcItKPhfbTOc1	2015-11-03 12:47:42
212	2015-11-03 13:55:42	2015-11-03 13:55:42	64.183.24.210	0	612	2015-11-03 13:55:42	2015-11-03 15:58:07	xf66cQQ1rJ2LWegNVDGW6TFpM6q20XgK1IHfFdm8	2015-11-03 15:58:07
207	2015-11-02 08:58:01	2015-11-02 17:07:25	64.183.24.210	1	611	2015-11-02 08:58:01	2015-11-02 17:00:53	EnPogMXJpGCrm0NyQfrnpXI2tuGhqOdpHUmH3Zln	2015-11-02 17:00:53
216	2015-11-09 09:41:13	2015-11-09 09:41:13	64.183.24.210	0	616	2015-11-09 09:41:13	2015-11-16 09:40:54	NJ264MeBddV0ZutW6LLmh8g2PWjNKB0HZo6C2KKQ	2015-11-16 09:40:54
209	2015-11-02 09:23:04	2015-11-02 09:23:04	64.183.24.210	0	616	2015-11-02 09:23:04	2015-11-09 09:22:33	bA8r1Uk7Nevbg7WGs6rNfZFuwTM7RzaIHlwFzVhZ	2015-11-09 09:22:33
208	2015-11-02 09:16:04	2015-11-02 09:16:04	64.183.24.210	0	614	2015-11-02 09:16:04	2015-11-06 17:09:22	4THNmfMhBiq3XDZJVlKfbGPQxZWtiumRK8MUvycw	2015-11-06 17:09:22
214	2015-11-04 07:33:45	2015-11-04 07:33:45	190.62.61.240	0	615	2015-11-04 07:33:45	2015-11-04 07:35:15	H0w7qKNCubsyqn7xnYlUBXMFXIHcrvbR8hVouJXA	2015-11-04 07:35:15
215	2015-11-09 09:23:04	2015-11-11 08:30:02	64.183.24.210	1	614	2015-11-09 09:23:04	2015-11-11 08:30:00	iNmvc5yxm6tJVNJdGGgmcZi9LwZFt8eCddIqn5Cs	2015-11-11 08:30:00
235	2015-11-12 11:16:18	2015-11-12 11:22:34	64.183.24.210	1	614	2015-11-12 11:16:18	2015-11-12 11:22:23	yG1JoYad6HK6NMAdTQEF6x9EgmM0FGxpl7xgQiuf	2015-11-12 11:22:23
213	2015-11-03 14:29:05	2015-11-03 14:29:05	64.183.24.210	0	611	2015-11-03 14:29:05	2015-11-10 13:42:26	jWHLf5m3Rdy3yUqBa5dXf2lULvGMwN6aWmHgqZ7s	2015-11-10 13:42:26
229	2015-11-11 10:04:16	2015-11-11 10:04:16	64.183.24.210	0	611	2015-11-11 10:04:16	2015-11-11 10:06:04	uP0KyyD24F9w7WUl0aIM81AV9p7kXaeXKvxsDehQ	2015-11-11 10:06:04
222	2015-11-11 09:25:33	2015-11-11 09:37:15	64.183.24.210	1	625	2015-11-11 09:25:33	2015-11-11 09:26:15	llrABuwbnCWmeycuUsQKpngEkcVmmbYCLlNQZY3q	2015-11-11 09:26:15
219	2015-11-10 17:12:51	2015-11-10 17:19:21	64.183.24.210	1	625	2015-11-10 17:12:51	2015-11-10 17:18:15	g7yAGsQX7z6cAQ5eSyfqVekckEdg9FKWg1KZUVDX	2015-11-10 17:18:15
242	2015-11-23 10:06:33	2015-11-23 10:06:33	64.183.24.210	0	616	2015-11-23 10:06:33	2015-11-30 10:06:20	xte8khQyLKi5WUxrOPEupe9C2TEjz2rBFLvYpmMF	2015-11-30 10:06:20
225	2015-11-11 09:41:46	2015-11-11 09:51:32	64.183.24.210	1	625	2015-11-11 09:41:46	2015-11-11 09:50:37	XCro2zGlrp4atofmKJ7hWyQaW7jhwZcsiiSOsLqY	2015-11-11 09:50:37
238	2015-11-13 08:34:05	2015-11-13 08:34:05	190.62.53.220	0	615	2015-11-13 08:34:05	2015-11-13 08:34:18	k4vFe03qxupLDYpHFILZy7OsSTgD13w6dDKDjt22	2015-11-13 08:34:18
232	2015-11-11 11:39:40	2015-11-11 11:40:14	174.127.49.82	1	626	2015-11-11 11:39:40	2015-11-11 11:39:44	QMvzwejtfAuHjfaxobxv6BxqGi2aDetcEHR8bEEP	2015-11-11 11:39:44
217	2015-11-10 15:39:30	2015-11-10 16:43:57	64.183.24.210	1	611	2015-11-10 15:39:30	2015-11-10 16:43:43	Tzji4HvgbCCiS0ocmEuTvLYlMoK2HeGB2iJ3YDp1	2015-11-10 16:43:43
223	2015-11-11 09:37:28	2015-11-11 09:39:12	64.183.24.210	1	626	2015-11-11 09:37:28	2015-11-11 09:39:04	vdE70z5oG5tt1p7zxO2QboD8i09BmvIWriO8xBqP	2015-11-11 09:39:04
233	2015-11-11 11:52:52	2015-11-11 14:11:01	174.127.49.82	1	626	2015-11-11 11:52:52	2015-11-11 14:10:49	87tIPFhXC6zwItO8IkmInlxBdcoNkEDKRU2QmTCC	2015-11-11 14:10:49
240	2015-11-16 09:50:12	2015-11-16 09:50:12	64.183.24.210	0	616	2015-11-16 09:50:12	2015-11-23 09:42:03	fWX7RHUMevJB7NFcMDQBJhHLI5A8qiOQWuWloe3z	2015-11-23 09:42:03
227	2015-11-11 09:56:56	2015-11-11 09:57:40	64.183.24.210	1	611	2015-11-11 09:56:56	2015-11-11 09:57:37	khEhRKcE8C4CO43BbZ4gs2e7wnBic34BGbgjV4fz	2015-11-11 09:57:37
230	2015-11-11 10:11:10	2015-11-11 10:11:10	174.127.49.82	0	626	2015-11-11 10:11:10	2015-11-11 10:12:25	BIQ58WTKoHQvVZ8sHqPVe0Cdsjs2AJBSd4X2GQ5l	2015-11-11 10:12:25
231	2015-11-11 10:25:31	2015-11-12 11:16:01	64.183.24.210	1	611	2015-11-11 10:25:31	2015-11-12 11:15:46	dVryf0LEiTjsoMYp1lA4MTzuJgFBs3GpqJJxvo2l	2015-11-12 11:15:46
243	2015-11-23 15:49:10	2015-11-23 15:49:10	64.183.24.210	0	614	2015-11-23 15:49:10	2015-11-30 15:45:44	SwGZagL9kAukCywA5pG8XWxDOsoDlqcrhaZu5V0v	2015-11-30 15:45:44
220	2015-11-10 17:19:35	2015-11-11 09:25:15	64.183.24.210	1	611	2015-11-10 17:19:35	2015-11-11 09:24:46	UKB1WA0eDzjLyb0KkgvRqmMGMDuD3T1jLbpakwW6	2015-11-11 09:24:46
226	2015-11-11 09:56:11	2015-11-11 10:00:36	174.127.49.82	1	626	2015-11-11 09:56:11	2015-11-11 10:00:04	VBaAErbzhJK4uyJXS6eKgHfk5UgckF4NvS2zDZcF	2015-11-11 10:00:04
228	2015-11-11 09:57:52	2015-11-11 10:03:58	64.183.24.210	1	626	2015-11-11 09:57:52	2015-11-11 09:59:25	ciMMBkFXW8Nir1aWyCWYiWhbUTLrO4I00nz2JrnS	2015-11-11 09:59:25
218	2015-11-10 16:45:22	2015-11-10 17:12:34	64.183.24.210	1	611	2015-11-10 16:45:22	2015-11-10 17:12:32	66TLLXi8260dt548IJef15svLvL00WrRFXTNJjtf	2015-11-10 17:12:32
221	2015-11-11 08:30:55	2015-11-12 10:54:01	64.183.24.210	1	614	2015-11-11 08:30:55	2015-11-12 10:52:43	c8aOjlvOHLgOwi6pj9Yocewg2GQV2FrMfDImgsxH	2015-11-12 10:52:43
224	2015-11-11 09:39:32	2015-11-11 09:41:08	64.183.24.210	1	611	2015-11-11 09:39:32	2015-11-11 09:41:04	CKLspGnmgoWg7QWS06MYgW9VsH0OO4K37BNAKjNW	2015-11-11 09:41:04
237	2015-11-12 11:54:52	2015-11-12 11:56:17	174.127.49.82	1	626	2015-11-12 11:54:52	2015-11-12 11:56:04	BbUaNWS9QBEohVd5IcXd2NOM8iEsLMbi1b5povM1	2015-11-12 11:56:04
239	2015-11-13 10:37:34	2015-11-13 10:51:55	174.127.49.82	1	626	2015-11-13 10:37:34	2015-11-13 10:37:45	SvwKS4nfEKYflw52xY9ZaHc9Jgo17xvCkFbfOFdO	2015-11-13 10:37:45
245	2015-11-30 08:40:18	2015-11-30 08:40:18	64.183.24.210	0	611	2015-11-30 08:40:18	2015-11-30 17:14:40	aoKbLEWe5YrXhgoRB5amrlZf8OjZpR9YI7bWaXSs	2015-11-30 17:14:40
248	2015-11-30 15:52:09	2015-11-30 15:52:09	64.183.24.210	0	614	2015-11-30 15:52:09	2015-11-30 17:14:59	PQJEXq3zDK7b6tr60iyw0qLWgRQiaLC3Dc5fzK9W	2015-11-30 17:14:59
246	2015-11-30 10:06:52	2015-11-30 10:06:52	64.183.24.210	0	616	2015-11-30 10:06:52	2015-11-30 10:18:06	emgadJljmOf72Ae4IJo1YUvucVYtOapeoVLLspfq	2015-11-30 10:18:05
241	2015-11-19 12:23:31	2015-11-19 12:23:31	64.183.24.210	0	611	2015-11-19 12:23:31	2015-11-25 17:29:01	gIS08HhndodgWiMJu4o9iwvbVDv0tN2hcwDG9FST	2015-11-25 17:29:01
236	2015-11-12 11:35:41	2015-11-12 11:35:41	64.183.24.210	0	611	2015-11-12 11:35:41	2015-11-18 17:30:45	zVE1V8DYTXy5dDNZN5FiQxuMusP9iVlumz6SOMYx	2015-11-18 17:30:45
234	2015-11-12 10:54:26	2015-11-12 10:54:26	64.183.24.210	0	614	2015-11-12 10:54:26	2015-11-17 11:46:02	dMAqI4PhbjciVbehGejKrzqXUzPjcay8cl1A684G	2015-11-17 11:46:02
247	2015-11-30 10:18:17	2015-11-30 10:18:17	64.183.24.210	0	616	2015-11-30 10:18:17	2015-11-30 17:08:33	3rzGMztIu7KUjdpoemdoU7qf9RkeLaSWPddWNNEZ	2015-11-30 17:08:33
244	2015-11-30 07:41:49	2015-11-30 07:41:49	190.62.6.5	0	615	2015-11-30 07:41:49	2015-11-30 14:39:22	oBXqcKFfR4XUkhO0plGrZBo4zFvtF3Msi8HLEgts	2015-11-30 14:39:22
\.


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sessions_id_seq', 248, true);


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
605	Jessica Rivera	jessica@rmpublicidad.com.sv	$2y$10$v66IHeiGIPISLYyZLeL9HeSSL3YPBF/AGaMgtrCTSHhWLRU.FVI1S	\N	2015-08-04 07:37:57	2015-10-08 09:22:27	1	\N	\N
615	David Martínez	david@rmpublicidad.com.sv	$2y$10$XEZkL3tHzix9/t8bNv4S.u17QPACSpqn33/HiyUHdppKTrFGcMtWS	\N	2015-10-06 11:43:42	2015-10-08 09:22:33	1	\N	\N
623	Josue Chávez	josue.chavez@tecninfos.com	$2y$10$2MKxxuvNlSO41uvlKsMgsemj.JA7NTfw.JxzTEn1WQGIL27qs6fdO	\N	2015-10-06 12:31:41	2015-10-08 09:22:44	1	\N	\N
619	Carlos M.	carlos@example.com	$2y$10$ep3OrNTBuwFg30rJVcTQN.cmU575S0IkPFbL8px4laiumq4NYLYc6	\N	2015-10-06 12:08:20	2015-10-08 10:27:07	0	2015-10-08 10:27:07	\N
617	Alejandra O.	aorellana@onesourcescheduling.com	$2y$10$OzIJZsFqaqEaDEEvYUg7r.MR09t2jKER8/2VjYhD8wlkcrTkN77/K	\N	2015-10-06 12:05:54	2015-10-16 12:43:12	0	2015-10-16 12:43:12	\N
624	Alejandra Orellana	alejandra.orellana@onesourcescheduling.com	$2y$10$FKQMbnX6T/JXwYYp2A2yiuyST2NVjMj7ViaLcTf60xKoNtRGzqh.S	\N	2015-10-16 12:46:02	2015-10-19 11:15:20	0	2015-10-19 11:15:20	\N
625	Humberto Olivas	holivas@jansenlawgroup.com	$2y$10$KL2PaTlA7aLwdfgFEWIuJu9eQxhSwIbz8680H8CZtYUKS.N7eygS2	\N	2015-10-20 11:03:57	2015-10-21 08:42:55	0	\N	\N
622	Alejandra O.	alejandra@providencescheduling.com	$2y$10$cn4EpBYTi/A12Bpn0fegYeuFUvw4t2YltnCESdVxKO058H4TyamP6	\N	2015-10-06 12:30:03	2015-10-30 11:33:18	0	2015-10-30 11:33:18	\N
618	Benjamin P.	benjamin.portal@onesourcescheduling.com	$2y$10$kkKWGvFdDI8llwRhW5LhBe5.27VoOcikRFVmjXHQo2RHN5j4iFCqi	\N	2015-10-06 12:07:15	2015-10-30 11:33:22	0	2015-10-30 11:33:22	\N
612	Pablo Rodríguez	jrodriguez@onesourcescheduling.com	$2y$10$MisU7IfzQleoZXQKhiMYSu4vJpUSWmb0PfgC7TzCf4FEDt78POr0e	\N	2015-10-06 11:41:45	2015-11-02 12:38:59	1	\N	\N
613	Claudia Morales	c.morales@providencescheduling.com	$2y$10$xCUTehPr2ofjiyosHI3MXO6qQbzdjZnUfhErb4fh9tT0SYO8nkBFq	\N	2015-10-06 11:42:15	2015-11-02 12:39:23	1	\N	\N
611	Lily E.	lily@onesourcescheduling.com	$2y$10$76cH6IvpZD./tUksBIiVd.V2th4r28ZQgz92kLiQdlzg3h86mBc8O	\N	2015-10-06 11:40:15	2015-11-03 10:19:26	1	\N	\N
626	Rezai & Associates	intial@rezailaw.com	$2y$10$P9HQQ/e4hy2CD8KdWrwV.OdhhESbTq7uADwoblxXS9YwLcke/Zjiq	\N	2015-11-10 16:48:06	2015-11-10 16:48:06	0	\N	\N
614	Daisy M.	daisy@onesourcescheduling.com	$2y$10$DTbaUM.aQ4eywHD.iTFXnOMyEF.c/tPZjhdf2x9NpiKKnlFohNkye	\N	2015-10-06 11:43:05	2015-11-10 17:19:46	1	\N	\N
621	Rene L.	rene.lopez@onesourcescheduling.com	$2y$10$THNOnlL5iaiiy9s/esIMqOpZdJFk/JBCre6WsQ/z15NfPhH.Zu.5O	\N	2015-10-06 12:18:45	2015-11-10 17:20:04	0	2015-11-10 17:20:04	\N
620	Wilbert S.	wilbert.sanchez@onesourcescheduling.com	$2y$10$Ws9u0QHY9KaLeets.Dx/l.7MxbBcf3yeqy.Rv3sUT4pqRFRwLz2T.	\N	2015-10-06 12:17:18	2015-11-10 17:20:07	0	2015-11-10 17:20:07	\N
616	Isabel M.	isabel@onesourcescheduling.com	$2y$10$S1R/4LwNW9vg5XzpL0leqeZB9wkd9YvHyRGKO3HWjPEL0bkKnUppK	\N	2015-10-06 12:04:47	2015-11-10 17:20:23	0	\N	\N
627	RSnyder Law Firm	sacevedo@rsnyderlaw.com	$2y$10$mZYsTNHJeKPyBIm4bj7qUOK/UUIY/MnLCwNbSxzK1nVAzWEb87Qlm	\N	2015-11-19 14:24:07	2015-11-19 14:24:07	0	\N	\N
628	Your Doctor Connection	assistance@yourdoctorconnection.com	$2y$10$qNwW31uijYM.kIQCw5yh0./J1FA9O8YO67/ziq/XDMsypbailQh2m	\N	2015-11-24 12:14:59	2015-11-24 12:15:00	0	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 628, true);


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


--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, name, email, password, remember_token, created_at, updated_at, is_admin) FROM stdin;
611	Lily M.	lily@providencescheduling.com	$2y$10$76cH6IvpZD./tUksBIiVd.V2th4r28ZQgz92kLiQdlzg3h86mBc8O	\N	2015-10-06 11:40:15	2015-10-06 11:40:15	1
612	Pablo Rodríguez	javier@providencescheduling.com	$2y$10$aH8zMEUXMqapzkZLr218Q.VX7/rCP8DGYUHASi2vYIJ7vgKbRNQNW	\N	2015-10-06 11:41:45	2015-10-06 11:41:45	1
613	Claudia	claudia@providencescheduling.com	$2y$10$MA3mNvTmLq1HLJjysljdsOtPdXXhrNPfbv8BZuRlWWo1AAh7iT1xe	\N	2015-10-06 11:42:15	2015-10-06 11:42:15	1
614	Daisy M.	daisy@providencescheduling.com	$2y$10$DTbaUM.aQ4eywHD.iTFXnOMyEF.c/tPZjhdf2x9NpiKKnlFohNkye	\N	2015-10-06 11:43:05	2015-10-06 11:43:05	1
615	David Martínez	david@rmpublicidad.com.sv	$2y$10$XEZkL3tHzix9/t8bNv4S.u17QPACSpqn33/HiyUHdppKTrFGcMtWS	\N	2015-10-06 11:43:42	2015-10-06 11:43:42	1
605	Jessica Rivera	jessica@rmpublicidad.com.sv	$2y$10$v66IHeiGIPISLYyZLeL9HeSSL3YPBF/AGaMgtrCTSHhWLRU.FVI1S	\N	2015-08-04 07:37:57	2015-10-06 11:44:44	1
616	Isabel M.	isabel@example.com	$2y$10$S1R/4LwNW9vg5XzpL0leqeZB9wkd9YvHyRGKO3HWjPEL0bkKnUppK	\N	2015-10-06 12:04:47	2015-10-06 12:04:47	0
617	Alejandra O.	alejandra@example.com	$2y$10$.jvRxyPpHVjue6lqLDqV5OxoX2uf0zFIvQyyUdDXGeQ/dABxU1iTu	\N	2015-10-06 12:05:54	2015-10-06 12:05:54	0
618	Benjamin P.	benjamin@example.com	$2y$10$Hqutd0zEtYuS3JSDGIVmiebZvV3nIf9Xeyo.H8OGpsEbhHOHfaQcu	\N	2015-10-06 12:07:15	2015-10-06 12:07:15	0
619	Carlos M.	carlos@example.com	$2y$10$ep3OrNTBuwFg30rJVcTQN.cmU575S0IkPFbL8px4laiumq4NYLYc6	\N	2015-10-06 12:08:20	2015-10-06 12:08:20	0
620	Wilbert S.	wilbert@example.com	$2y$10$Ws9u0QHY9KaLeets.Dx/l.7MxbBcf3yeqy.Rv3sUT4pqRFRwLz2T.	\N	2015-10-06 12:17:18	2015-10-06 12:17:18	0
621	Rene L.	rene@example.com	$2y$10$THNOnlL5iaiiy9s/esIMqOpZdJFk/JBCre6WsQ/z15NfPhH.Zu.5O	\N	2015-10-06 12:18:45	2015-10-06 12:19:48	0
622	Xiomara M.	xiomara@example.com	$2y$10$cn4EpBYTi/A12Bpn0fegYeuFUvw4t2YltnCESdVxKO058H4TyamP6	\N	2015-10-06 12:30:03	2015-10-06 12:30:03	0
623	Josue Chávez	josue.chavez@tecninfos.com	$2y$10$2MKxxuvNlSO41uvlKsMgsemj.JA7NTfw.JxzTEn1WQGIL27qs6fdO	\N	2015-10-06 12:31:41	2015-10-06 12:31:41	1
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 623, true);


--
-- PostgreSQL database dump complete
--


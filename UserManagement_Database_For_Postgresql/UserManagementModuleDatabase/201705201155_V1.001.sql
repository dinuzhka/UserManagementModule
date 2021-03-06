-- SQL Manager for PostgreSQL 5.9.1.49393
-- ---------------------------------------
-- Host      : localhost
-- Database  : UserManagementModuleDatabase
-- Version   : PostgreSQL 9.6.3, compiled by Visual C++ build 1800, 64-bit



SET search_path = public, pg_catalog;
DROP TABLE IF EXISTS public."ScreenComponent";
DROP TABLE IF EXISTS public."Screen";
SET check_function_bodies = false;
--
-- Structure for table Screen (OID = 24598) :
--
CREATE TABLE public."Screen" (
    "Id" integer NOT NULL,
    "ScreenName" varchar(25) NOT NULL,
    "IsActive" boolean NOT NULL
)
WITH (oids = false);
--
-- Structure for table ScreenComponent (OID = 24603) :
--
CREATE TABLE public."ScreenComponent" (
    "Id" integer NOT NULL,
    "ScreenId" integer NOT NULL,
    "ComponentName" varchar(50) NOT NULL,
    "IsActive" boolean NOT NULL
)
WITH (oids = false);
--
-- Definition for index Screen_pkey (OID = 24601) :
--
ALTER TABLE ONLY "Screen"
    ADD CONSTRAINT "Screen_pkey"
    PRIMARY KEY ("Id");
--
-- Definition for index ScreenComponent_pkey (OID = 24606) :
--
ALTER TABLE ONLY "ScreenComponent"
    ADD CONSTRAINT "ScreenComponent_pkey"
    PRIMARY KEY ("Id");
--
-- Definition for index ScreenComponent_fk (OID = 24608) :
--
ALTER TABLE ONLY "ScreenComponent"
    ADD CONSTRAINT "ScreenComponent_fk"
    FOREIGN KEY ("ScreenId") REFERENCES "Screen"("Id") ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';

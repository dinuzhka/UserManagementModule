-- SQL Manager for PostgreSQL 5.9.1.49393
-- ---------------------------------------
-- Host      : localhost
-- Database  : UserManagementModuleDatabase
-- Version   : PostgreSQL 9.6.3, compiled by Visual C++ build 1800, 64-bit



SET search_path = public, pg_catalog;
DROP TABLE IF EXISTS public."User";
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
-- Structure for table User (OID = 24616) : 
--
CREATE TABLE public."User" (
    "Id" integer NOT NULL,
    "FirstName" varchar(50) NOT NULL,
    "LastName" varchar(50) NOT NULL,
    "Email" varchar(50) NOT NULL,
    "UserName" varchar(50) NOT NULL,
    "PasswordHash" varchar(64) NOT NULL,
    "Salt" varchar(64),
    "TelephoneNumber" integer NOT NULL
)
WITH (oids = false);
--
-- Data for table public."Screen" (OID = 24598) (LIMIT 0,2)
--
INSERT INTO "Screen" ("Id", "ScreenName", "IsActive")
VALUES (1, 'Login', true);

INSERT INTO "Screen" ("Id", "ScreenName", "IsActive")
VALUES (2, 'Register', true);

--
-- Data for table public."ScreenComponent" (OID = 24603) (LIMIT 0,5)
--
INSERT INTO "ScreenComponent" ("Id", "ScreenId", "ComponentName", "IsActive")
VALUES (1, 1, 'usernamelabel', true);

INSERT INTO "ScreenComponent" ("Id", "ScreenId", "ComponentName", "IsActive")
VALUES (2, 1, 'userNameTxtBox', true);

INSERT INTO "ScreenComponent" ("Id", "ScreenId", "ComponentName", "IsActive")
VALUES (3, 1, 'passwordlabel', true);

INSERT INTO "ScreenComponent" ("Id", "ScreenId", "ComponentName", "IsActive")
VALUES (4, 1, 'passwordtextfield', true);

INSERT INTO "ScreenComponent" ("Id", "ScreenId", "ComponentName", "IsActive")
VALUES (5, 1, 'loginbutton', true);

--
-- Data for table public."User" (OID = 24616) (LIMIT 0,2)
--
INSERT INTO "User" ("Id", "FirstName", "LastName", "Email", "UserName", "PasswordHash", "Salt", "TelephoneNumber")
VALUES (1, 'Chathuranga', 'Sandun', 'clive@gmail.com', 'sandun', 'Ringer#123', NULL, 718256773);

INSERT INTO "User" ("Id", "FirstName", "LastName", "Email", "UserName", "PasswordHash", "Salt", "TelephoneNumber")
VALUES (2, 'Nipuna', 'Player', 'Player@gmail.com', 'Player', 'Ringer#123', NULL, 119);

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
-- Definition for index User_pkey (OID = 24619) : 
--
ALTER TABLE ONLY "User"
    ADD CONSTRAINT "User_pkey"
    PRIMARY KEY ("Id");
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';

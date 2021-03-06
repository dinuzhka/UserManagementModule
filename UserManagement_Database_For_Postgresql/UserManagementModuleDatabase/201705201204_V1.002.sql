-- SQL Manager for PostgreSQL 5.9.1.49393
-- ---------------------------------------
-- Host      : localhost
-- Database  : UserManagement
-- Version   : PostgreSQL 9.6.3, compiled by Visual C++ build 1800, 64-bit



SET search_path = public, pg_catalog;
DROP TABLE IF EXISTS public."ScreenComponent";
DROP TABLE IF EXISTS public."Screen";
SET check_function_bodies = false;
--
-- Structure for table Screen (OID = 32770) : 
--
CREATE TABLE public."Screen" (
    "Id" integer NOT NULL,
    "ScreenName" varchar(25) NOT NULL,
    "IsActive" boolean NOT NULL
)
WITH (oids = false);
--
-- Structure for table ScreenComponent (OID = 32773) : 
--
CREATE TABLE public."ScreenComponent" (
    "Id" integer NOT NULL,
    "ScreenId" integer NOT NULL,
    "ComponentName" varchar(50) NOT NULL,
    "IsActive" boolean NOT NULL
)
WITH (oids = false);
--
-- Data for table public."Screen" (OID = 32770) (LIMIT 0,2)
--
INSERT INTO "Screen" ("Id", "ScreenName", "IsActive")
VALUES (1, 'Login', true);

INSERT INTO "Screen" ("Id", "ScreenName", "IsActive")
VALUES (2, 'Register', true);

--
-- Data for table public."ScreenComponent" (OID = 32773) (LIMIT 0,5)
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
-- Definition for index Screen_pkey (OID = 32776) : 
--
ALTER TABLE ONLY "Screen"
    ADD CONSTRAINT "Screen_pkey"
    PRIMARY KEY ("Id");
--
-- Definition for index ScreenComponent_pkey (OID = 32778) : 
--
ALTER TABLE ONLY "ScreenComponent"
    ADD CONSTRAINT "ScreenComponent_pkey"
    PRIMARY KEY ("Id");
--
-- Definition for index ScreenComponent_fk (OID = 32780) : 
--
ALTER TABLE ONLY "ScreenComponent"
    ADD CONSTRAINT "ScreenComponent_fk"
    FOREIGN KEY ("ScreenId") REFERENCES "Screen"("Id") ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';

/*
This script creates the IMDb database tables.

To use the IMDb scripts:

1) Open MySQL in terminal:
$ mysql -u root -p --local-infile

2) Create IMDb data base in MySQL:
mysql> SOURCE /Users/lappy/Git_repos_mine/MySQL_IMDb_Project/imdb-create-tables.sql

3) Load data using this script in MySQL:
mysql> SOURCE /Users/lappy/Git_repos_mine/MySQL_IMDb_Project/imdb-load-data.sql

4) Add constraints to the IMDb database in MySQL
mysql> SOURCE /Users/lappy/Git_repos_mine/MySQL_IMDb_Project/imdb-add-constraints.sql

5) Add indexes to the IMDb database in MySQL
mysql> SOURCE /Users/lappy/Git_repos_mine/MySQL_IMDb_Project/imdb-index-tables.sql

*/

-- Delete IMDb database if necessary
DROP DATABASE IF EXISTS IMDb;

-- Create IMDb database

CREATE DATABASE IMDb;

-- Use IMDb database

USE IMDb;

-- Character set
-- want to be able to distinguish text with accents
ALTER DATABASE IMDb CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

-- Drop old tables if they exist

-- DROP TABLE IF EXISTS Titles;
-- DROP TABLE IF EXISTS Title_ratings;
-- DROP TABLE IF EXISTS Aliases;
-- DROP TABLE IF EXISTS Alias_types;
-- DROP TABLE IF EXISTS Alias_attributes;
-- DROP TABLE IF EXISTS Episode_belongs_to;
-- DROP TABLE IF EXISTS Title_genres;
-- DROP TABLE IF EXISTS Names_;
-- DROP TABLE IF EXISTS Name_worked_as;
-- DROP TABLE IF EXISTS Had_role;
-- DROP TABLE IF EXISTS Known_for;
-- DROP TABLE IF EXISTS Directors;
-- DROP TABLE IF EXISTS Writers;
-- DROP TABLE IF EXISTS Principals;

-- Create tables only

CREATE TABLE Titles (
  title_id 			  VARCHAR(255) NOT NULL, -- not null bc PK
  title_type 			VARCHAR(50),
  primary_title 	TEXT, -- some are really long
  original_title 	TEXT, -- some are really long
  is_adult 			  BOOLEAN,
  start_year			INTEGER, -- add better domain here (>1800)
  end_year 			  INTEGER, -- add better domain here (>0)
  runtime_minutes	INTEGER -- add better domain here (>0)

);

CREATE TABLE Title_ratings (
  title_id 			  VARCHAR(255) NOT NULL, -- not null bc PK
  average_rating	FLOAT,
  num_votes			  INTEGER
);

CREATE TABLE Aliases (
  title_id          VARCHAR(255) NOT NULL, -- not null bc PK
  ordering          INTEGER NOT NULL, -- not null bc PK
  title             TEXT NOT NULL,
  region				    CHAR(4),
  language          CHAR(4),
  is_original_title	BOOLEAN
);

CREATE TABLE Alias_types (
  title_id      VARCHAR(255) NOT NULL, -- not null bc PK
  ordering			INTEGER NOT NULL, -- not null bc PK
  type				  VARCHAR(255) NOT NULL-- Only stored if not null
);

CREATE TABLE ALias_attributes (
  title_id			VARCHAR(255) NOT NULL, -- not null bc PK
  ordering			INTEGER NOT NULL, -- not null bc PK
  attribute			VARCHAR(255) NOT NULL -- only stored if not null
);

CREATE TABLE Episode_belongs_to (
  episode_title_id          VARCHAR(255) NOT NULL, -- not null bc PK
  parent_tv_show_title_id   VARCHAR(255) NOT NULL,
  season_number             INTEGER,
  episode_number            INTEGER
);

CREATE TABLE Title_genres (
  title_id    VARCHAR(255) NOT NULL, -- not null bc PK
  genre				VARCHAR(255) NOT NULL -- not null bc PK
);

-- Names and name is a reserved word in MySQL, so we add an underscore

CREATE TABLE Names_ (
  name_id       VARCHAR(255) NOT NULL, -- not null bc PK
  name_         VARCHAR(255) NOT NULL, -- everybody has a name
  birth_year    SMALLINT, -- add a better domain here
  death_year    SMALLINT -- add a better domain here
);

CREATE TABLE Name_worked_as (
  name_id       VARCHAR(255) NOT NULL, -- not null bc PK
  profession    VARCHAR(255) NOT NULL -- not null bc PK
);

-- NOTE: All 3 must must be used as the primary key
-- role is a reserved word in MySQL, so we add an underscore

CREATE TABLE Had_role (
  title_id      VARCHAR(255) NOT NULL, -- not null bc PK
  name_id       VARCHAR(255) NOT NULL, -- not null bc PK
  role_         TEXT NOT NULL -- not null bc PK
);

CREATE TABLE Known_for (
  name_id       VARCHAR(255) NOT NULL, -- not null bc PK
  title_id      VARCHAR(255) NOT NULL -- not null bc PK
);

CREATE TABLE Directors (
  title_id      VARCHAR(255) NOT NULL, -- not null bc PK
  name_id       VARCHAR(255) NOT NULL -- not null bc PK
);

CREATE TABLE Writers (
  title_id      VARCHAR(255) NOT NULL, -- not null bc PK
  name_id       VARCHAR(255) NOT NULL -- not null bc PK
);

CREATE TABLE Principals (
  title_id      VARCHAR(255) NOT NULL, -- not null bc PK
  ordering      TINYINT NOT NULL, -- not null bc PK
  name_id       VARCHAR(255) NOT NULL,
  job_category  VARCHAR(255),
  job           TEXT
);

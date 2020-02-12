/*
This script loads normalised IMDb data into IMDb database tables created by
using the script imdb-create-tables.sql.

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


-- SHOW VARIABLES LIKE "local_infile";
SET GLOBAL local_infile = 1;

-- Load Aliases.tsv into Aliases table
LOAD DATA LOCAL INFILE  '/Users/lappy/Git_repos_mine/MySQL_IMDb_Project/Aliases.tsv'
INTO TABLE Aliases
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Alias_attributes.tsv into Alias_attributes table
LOAD DATA LOCAL INFILE  '/Users/lappy/Git_repos_mine/MySQL_IMDb_Project/Alias_attributes.tsv'
INTO TABLE Alias_attributes
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Alias_types.tsv into Alias_types table
LOAD DATA LOCAL INFILE  '/Users/lappy/Git_repos_mine/MySQL_IMDb_Project/Alias_types.tsv'
INTO TABLE Alias_types
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Directors.tsv into Directors table
LOAD DATA LOCAL INFILE '/Users/lappy/Git_repos_mine/MySQL_IMDb_Project/Directors.tsv'
INTO TABLE Directors
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Writers.tsv into Writers table
LOAD DATA LOCAL INFILE '/Users/lappy/Git_repos_mine/MySQL_IMDb_Project/Writers.tsv'
INTO TABLE Writers
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Episode_belongs_to.tsv into Episode_belongs_to table
LOAD DATA LOCAL INFILE '/Users/lappy/Git_repos_mine/MySQL_IMDb_Project/Episode_belongs_to.tsv'
INTO TABLE Episode_belongs_to
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Names_.tsv into Names_ table
LOAD DATA LOCAL INFILE '/Users/lappy/Git_repos_mine/MySQL_IMDb_Project/Names_.tsv'
INTO TABLE Names_
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Name_worked_as.tsv into Name_worked_as table
LOAD DATA LOCAL INFILE '/Users/lappy/Git_repos_mine/MySQL_IMDb_Project/Name_worked_as.tsv'
INTO TABLE Name_worked_as
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Known_for.tsv into Known_for table
LOAD DATA LOCAL INFILE '/Users/lappy/Git_repos_mine/MySQL_IMDb_Project/Known_for.tsv'
INTO TABLE Known_for
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Principals.tsv into Principals table
LOAD DATA LOCAL INFILE '/Users/lappy/Git_repos_mine/MySQL_IMDb_Project/Principals.tsv'
INTO TABLE Principals
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Had_role.tsv into Had_role table
LOAD DATA LOCAL INFILE '/Users/lappy/Git_repos_mine/MySQL_IMDb_Project/Had_role.tsv'
INTO TABLE Had_role
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Titles.tsv into Titles table
LOAD DATA LOCAL INFILE '/Users/lappy/Git_repos_mine/MySQL_IMDb_Project/Titles.tsv'
INTO TABLE Titles
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Title_genres.tsv into Title_genres table
LOAD DATA LOCAL INFILE  '/Users/lappy/Git_repos_mine/MySQL_IMDb_Project/Title_genres.tsv'
INTO TABLE Title_genres
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Title_ratings.tsv into Title_ratings table
LOAD DATA LOCAL INFILE  '/Users/lappy/Git_repos_mine/MySQL_IMDb_Project/Title_ratings.tsv'
INTO TABLE Title_ratings
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

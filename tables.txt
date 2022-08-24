

-- Таблица team_logos
CREATE TABLE team_logos (
id SERIAL PRIMARY KEY,
team_id INT NOT NULL,
start_year INT2 NOT NULL,
end_year INT2,
logo VARCHAR(120) NOT NULL 
);

-- Таблица teams
CREATE TABLE teams (
id SERIAL PRIMARY KEY,
nation_id INT NOT NULL,
full_name VARCHAR(120) NOT NULL,
name VARCHAR(50) NOT NULL,
short_name VARCHAR(5) NOT NULL,
start_year INT2 NOT NULL,
end_year INT2
);

-- Таблица nations
CREATE TABLE nations (
id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL UNIQUE,
short_name VARCHAR(5) NOT NULL UNIQUE,
flag VARCHAR(120) NOT NULL,
logo VARCHAR(120) NOT NULL
);

-- Таблица league_logos
CREATE TABLE league_logos (
id SERIAL PRIMARY KEY,
league_id INT NOT NULL,
start_year INT2 NOT NULL,
end_year INT2,
logo VARCHAR(120) NOT NULL 
);

6-- Таблица leagues
CREATE TABLE leagues (
id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL UNIQUE,
short_name VARCHAR(10) NOT NULL UNIQUE,
start_year INT2 NOT NULL,
end_year INT2,
color VARCHAR(50),
is_local BOOLEAN DEFAULT false
);

-- Таблица players
CREATE TABLE players (
id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
jersey_number INT2 NOT NULL,
player_position VARCHAR(5) NOT NULL,
player_order INT2 NOT NULL,
nation_id INT NOT NULL,
birth_year INT2 NOT NULL,
height INT2,
weight INT2,
draft_team_id INT, 
start_year INT2 NOT NULL,
end_year INT2 
);

-- Таблица players_tournaments
CREATE TABLE players_tournaments (
id SERIAL PRIMARY KEY,
teams_tournament_id INT NOT NULL,
player_id INT NOT NULL,
games INT2,
goals INT2,
postseason VARCHAR(250)
);

-- Таблица seasons
CREATE TABLE seasons (
id INT PRIMARY KEY,
name VARCHAR(20) NOT NULL
);

-- Таблица teams_tournaments
CREATE TABLE teams_tournaments (
id SERIAL PRIMARY KEY,
tournament_id INT NOT NULL,
team_id INT NOT NULL,
games INT2,
wins INT2,
ties INT2,
losts INT2,
goals_for INT2,
goals_against INT2,
postseason VARCHAR(250)
);

-- Таблица tournaments
CREATE TABLE tournaments (
id SERIAL PRIMARY KEY,
season_id INT NOT NULL,
league_id INT NOT NULL 
);

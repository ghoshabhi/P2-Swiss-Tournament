-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP DATABASE IF EXISTS tournament;

CREATE DATABASE tournament;

--Connect to the database
\c tournament;

--Create table "players"
CREATE TABLE players (
	name TEXT,
	id SERIAL PRIMARY KEY
);

--Create table "matches" to hold record for matches like the ids of the players who played and who was the winner!
CREATE TABLE matches (
	player1 INTEGER REFERENCES players (id),
	player2 INTEGER REFERENCES players (id),
	winner INTEGER REFERENCES players (id),
	PRIMARY KEY (player1, player2)	
);


--Create view "total_wins" to find out the total wins that a player has!
CREATE VIEW total_wins AS
SELECT players.id, COUNT(matches.winner) AS wins 
FROM players LEFT JOIN matches 
ON players.id = matches.winner 
GROUP BY players.id 
ORDER BY wins DESC;


-- Create the view "total_matches" to count the total number of matches that a player has played!
CREATE VIEW total_matches AS
SELECT players.id, COUNT(matches.*) AS matches
FROM players LEFT JOIN matches 
ON players.id = matches.player1 OR players.id = matches.player2 
GROUP BY players.id
ORDER BY matches DESC;


-- Create the view "standings" to find out the current standings of the players in the tournament according to their wins!
CREATE VIEW standings AS 
SELECT players.id, players.name, total_wins.wins, total_matches.matches 
FROM players 
	JOIN total_wins 
		ON players.id = total_wins.id 
	JOIN total_matches 
		ON players.id = total_matches.id 
ORDER BY total_wins.wins DESC, total_matches.matches, players.id; 
-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS app_user;
DROP TABLE IF EXISTS deck;
DROP TABLE IF EXISTS note_card;

CREATE TABLE app_user (
  id SERIAL PRIMARY KEY,
  user_name varchar(32) NOT NULL UNIQUE,
  password varchar(32) NOT NULL,
  role varchar(32),
  salt varchar(255) NOT NULL

);
CREATE TABLE deck
(
  user_id INTEGER NOT NULL,
  deck_id SERIAL PRIMARY KEY,
  deckName VARCHAR(80) NOT NULL,
  deckDescription VARCHAR(80) NOT NULL,

 
  CONSTRAINT fk_deck_app_user FOREIGN KEY (user_id) REFERENCES app_user (id)
);

CREATE TABLE note_card
(
  card_id SERIAL PRIMARY KEY,
  deck_id INTEGER NOT NULL,
  question VARCHAR(250) NOT NULL,
  answer VARCHAR(250) NOT NULL,
  tags VARCHAR(100),
  keyword_1 VARCHAR(100),
  keyword_2 VARCHAR(100),
  keyword_3 VARCHAR(100),

  CONSTRAINT fk_note_card_deck FOREIGN KEY (deck_id) REFERENCES deck (deck_id)

);

COMMIT;
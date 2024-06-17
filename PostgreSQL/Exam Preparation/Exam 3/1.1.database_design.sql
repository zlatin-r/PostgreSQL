CREATE TABLE IF NOT EXISTS categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS addresses (
    id SERIAL PRIMARY KEY,
    street_name VARCHAR(100) NOT NULL,
    street_number INT NOT NULL,
    town VARCHAR(30) NOT NULL,
    country VARCHAR(50) NOT NULL,
    zip_code INT NOT NULL,

    CONSTRAINT ck_street_num
        CHECK ( street_number > 0 ),

    CONSTRAINT ck_zip_code
        CHECK ( zip_code > 0 )
);

CREATE TABLE IF NOT EXISTS publishers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    address_id INT NOT NULL,
    website VARCHAR(40),
    phone VARCHAR(20),

    CONSTRAINT fk_publishers_addresses
        FOREIGN KEY (address_id)
        REFERENCES addresses (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS players_ranges (
    id SERIAL PRIMARY KEY,
    min_players INT NOT NULL,
    max_players INT NOT NULL,

    CONSTRAINT ck_min_players
        CHECK ( min_players > 0 ),

    CONSTRAINT ck_max_players
        CHECK ( max_players > 0 )
);

CREATE TABLE IF NOT EXISTS creators (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS board_games (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    release_year INT NOT NULL,
    rating NUMERIC(2) NOT NULL,
    category_id INT NOT NULL,
    publisher_id INT NOT NULL,
    players_range_id INT NOT NULL,

    CONSTRAINT ck_release_year
        CHECK ( release_year > 0 ),

    CONSTRAINT fk_board_games_categories
        FOREIGN KEY (category_id)
        REFERENCES categories (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_board_games_publisher
        FOREIGN KEY (publisher_id)
        REFERENCES publishers (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_board_games_players_range
        FOREIGN KEY (players_range_id)
        REFERENCES players_ranges (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS creators_board_games (
    creator_id INT NOT NULL,
    board_game_id INT NOT NULL,

    CONSTRAINT fk_creators_board_games
        FOREIGN KEY (creator_id)
        REFERENCES creators (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_board_game_creator
        FOREIGN KEY (board_game_id)
        REFERENCES board_games (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
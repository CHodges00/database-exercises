USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE albums(
    id           INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist      VARCHAR(50) DEFAULT 'NONE',
    name         VARCHAR(50) DEFAULT 'NONE',
    release_date INT UNSIGNED,
    sales        INT UNSIGNED NOT NULL,
    genre        VARCHAR(50) DEFAULT 'NONE',
    PRIMARY KEY (id)
);

ALTER TABLE albums
    ADD UNIQUE (name, artist);

DESCRIBE albums;

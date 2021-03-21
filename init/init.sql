DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS events CASCADE;

CREATE EXTENSION IF NOT EXISTS CITEXT;

CREATE TABLE users
(
    id                    BIGSERIAL PRIMARY KEY                              NOT NULL UNIQUE,
    mail_user_id          VARCHAR(128)                                       NOT NULL UNIQUE CHECK ( mail_user_id <> '' ),
    mail_user_email       VARCHAR(512)                                       NOT NULL UNIQUE CHECK ( mail_user_email <> '' ),

    mail_access_token     VARCHAR(128)                                       NOT NULL UNIQUE CHECK ( mail_access_token <> '' ),
    mail_refresh_token    VARCHAR(128)                                       NOT NULL UNIQUE CHECK ( mail_refresh_token <> '' ),
    mail_token_expires_in TIMESTAMP WITH TIME ZONE                           NOT NULL,

    telegram_user_id      BIGINT                                             NOT NULL UNIQUE,

    created_at            TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
--     nickname         VARCHAR(256)          NOT NULL,
--     fullname         VARCHAR(512)          NOT NULL,
);

CREATE TABLE events
(
    id             BIGSERIAL PRIMARY KEY NOT NULL UNIQUE,
    name           CITEXT,
    time_from      TIMESTAMP             NOT NULL,
    time_to        TIMESTAMP             NOT NULL,
    all_day        BOOLEAN,
    repeating      BOOLEAN,
    repeating_info CITEXT,
    call_link      CITEXT,
    description    CITEXT,
    place          CITEXT,
    calendar       CITEXT,
    remember_info  CITEXT

);

CREATE TABLE users_events
(
    event_id BIGINT NOT NULL UNIQUE,
    user_id  BIGINT NOT NULL UNIQUE,

    FOREIGN KEY (user_id) REFERENCES users (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

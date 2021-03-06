DROP TABLE IF EXISTS users CASCADE;

CREATE EXTENSION IF NOT EXISTS CITEXT;

CREATE TABLE users
(
    id                     BIGSERIAL PRIMARY KEY                              NOT NULL UNIQUE,

    telegram_user_id       BIGINT                                             NOT NULL UNIQUE CHECK ( telegram_user_id <> 0 ),
    telegram_user_timezone VARCHAR(128) CHECK ( telegram_user_timezone <> '' ),

    mail_user_id           VARCHAR(128)                                       NOT NULL UNIQUE CHECK ( mail_user_id <> '' ),
    mail_user_email        VARCHAR(512)                                       NOT NULL UNIQUE CHECK ( mail_user_email <> '' ),
    mail_refresh_token     VARCHAR(128)                                       NOT NULL UNIQUE CHECK ( mail_refresh_token <> '' ),

    created_at             TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE SCHEMA IF NOT EXISTS `algo_with_me` DEFAULT CHARACTER SET utf8mb4;

GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root' WITH GRANT OPTION;
GRANT ALL ON algo_with_me.* TO 'root'@'localhost';
FLUSH PRIVILEGES;

drop table if exists members CASCADE;

CREATE TABLE `members`
(
    `id`         BIGINT       NOT NULL AUTO_INCREMENT,
    `email`      VARCHAR(255) NOT NULL,
    `password`   VARCHAR(255) NOT NULL,
    `name`       VARCHAR(255) NOT NULL,
    `created_at` DATETIME     NOT NULL,
    `updated_at` DATETIME     NOT NULL,
    PRIMARY KEY (`id`)
);


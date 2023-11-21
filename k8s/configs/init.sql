CREATE SCHEMA IF NOT EXISTS `algo_with_me` DEFAULT CHARACTER SET utf8mb4;

# GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
# GRANT ALL ON algo_with_me.* TO 'root'@'%';
# FLUSH PRIVILEGES;

CREATE TABLE IF NOT EXISTS `members`
(
    `id`         BIGINT       NOT NULL AUTO_INCREMENT,
    `email`      VARCHAR(255) NOT NULL,
    `password`   VARCHAR(255) NOT NULL,
    `nickname`   VARCHAR(255) NOT NULL,
    `role`       VARCHAR(255) NOT NULL,
    `created_at` DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `problems`
(
    `id`          BIGINT       NOT NULL AUTO_INCREMENT,
    `number`      BIGINT       NOT NULL,
    `description` TEXT         NOT NULL,
    `title`       VARCHAR(255) NOT NULL,
    `difficulty`  VARCHAR(255) NOT NULL,
    `acceptance`  DECIMAL      NOT NULL,
    `created_at`  DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at`  DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `testcases`
(
    `id`           BIGINT       NOT NULL AUTO_INCREMENT,
    `problem_id`   BIGINT       NOT NULL,
    `number`       BIGINT       NOT NULL,
    `input_names`  VARCHAR(255) NOT NULL,
    `input_values` VARCHAR(255) NOT NULL,
    `output`       VARCHAR(255) NOT NULL,
    `is_grading`   BOOLEAN      NOT NULL,
    `created_at`   DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at`   DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `programming_languages`
(
    `id`         BIGINT       NOT NULL AUTO_INCREMENT,
    `name`       VARCHAR(255) NOT NULL,
    `created_at` DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `tags`
(
    `id`         BIGINT       NOT NULL AUTO_INCREMENT,
    `name`       VARCHAR(255) NOT NULL,
    `created_at` DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `problem_tags`
(
    `id`         BIGINT      NOT NULL AUTO_INCREMENT,
    `problem_id` BIGINT      NOT NULL,
    `tag_id`     BIGINT      NOT NULL,
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `available_languages`
(
    `id`                      BIGINT       NOT NULL AUTO_INCREMENT,
    `template_code`           VARCHAR(255) NOT NULL,
    `programming_language_id` BIGINT       NOT NULL,
    `problem_id`              BIGINT       NOT NULL,
    `created_at`              DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at`              DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `submits`
(
    `id`         BIGINT       NOT NULL AUTO_INCREMENT,
    `problem_id` BIGINT       NOT NULL,
    `member_id`  BIGINT       NOT NULL,
    `code`       TEXT         NOT NULL,
    `result`     VARCHAR(255) NOT NULL,
    `created_at` DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `solutions`
(
    `id`         BIGINT       NOT NULL AUTO_INCREMENT,
    `member_id`  BIGINT       NOT NULL,
    `problem_id` BIGINT       NOT NULL,
    `title`      VARCHAR(255) NOT NULL,
    `content`    TEXT         NOT NULL,
    `view_count` BIGINT       NOT NULL,
    `created_at` DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `solution_languages`
(
    `id`                    BIGINT      NOT NULL AUTO_INCREMENT,
    `solution_id`           BIGINT      NOT NULL,
    `available_language_id` BIGINT      NOT NULL,
    `created_at`            DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at`            DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `comments`
(
    `id`          BIGINT       NOT NULL AUTO_INCREMENT,
    `member_id`   BIGINT       NOT NULL,
    `solution_id` BIGINT       NOT NULL,
    `content`     VARCHAR(255) NOT NULL,
    `created_at`  DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at`  DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `replies`
(
    `id`         BIGINT      NOT NULL AUTO_INCREMENT,
    `member_id`  BIGINT      NOT NULL,
    `comment_id` BIGINT      NOT NULL,
    `content`    BIGINT      NOT NULL,
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `solution_likes`
(
    `id`          BIGINT      NOT NULL AUTO_INCREMENT,
    `member_id`   BIGINT      NOT NULL,
    `solution_id` BIGINT      NOT NULL,
    `created_at`  DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at`  DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `comment_likes`
(
    `id`         BIGINT      NOT NULL AUTO_INCREMENT,
    `member_id`  BIGINT      NOT NULL,
    `comment_id` BIGINT      NOT NULL,
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `reply_likes`
(
    `id`         BIGINT      NOT NULL AUTO_INCREMENT,
    `reply_id`   BIGINT      NOT NULL,
    `member_id`  BIGINT      NOT NULL,
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `mini_quizzes`
(
    `id`               BIGINT       NOT NULL AUTO_INCREMENT,
    `description`      VARCHAR(255) NOT NULL,
    `explain`          VARCHAR(255) NOT NULL,
    `answer`           TEXT         NOT NULL,
    `type`             VARCHAR(255) NOT NULL,
    `difficulty`       VARCHAR(255) NOT NULL,
    `choiceOrInitials` VARCHAR(255) NOT NULL,
    `created_at`       DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at`       DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `mini_quiz_tags`
(
    `id`           BIGINT      NOT NULL AUTO_INCREMENT,
    `tag_id`       BIGINT      NOT NULL,
    `mini_quiz_id` BIGINT      NOT NULL,
    `created_at`   DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at`   DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `answers`
(
    `id`         BIGINT       NOT NULL AUTO_INCREMENT,
    `question`   VARCHAR(255) NOT NULL,
    `answer`     VARCHAR(255) NOT NULL,
    `member_id`  BIGINT       NOT NULL,
    `problem_id` BIGINT       NOT NULL,
    `created_at` DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` DATETIME(6)  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `solution_views`
(
    `id`          BIGINT      NOT NULL AUTO_INCREMENT,
    `member_id`   BIGINT      NOT NULL,
    `solution_id` BIGINT      NOT NULL,
    `created_at`  DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at`  DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
);

ALTER TABLE `testcases`
    ADD CONSTRAINT `FK_problems_TO_testcases_1` FOREIGN KEY (
                                                             `problem_id`
        )
        REFERENCES `problems` (
                               `id`
            );

ALTER TABLE `problem_tags`
    ADD CONSTRAINT `FK_problems_TO_problem_tags_1` FOREIGN KEY (
                                                                `problem_id`
        )
        REFERENCES `problems` (
                               `id`
            );

ALTER TABLE `problem_tags`
    ADD CONSTRAINT `FK_tags_TO_problem_tags_1` FOREIGN KEY (
                                                            `tag_id`
        )
        REFERENCES `tags` (
                           `id`
            );

ALTER TABLE `available_languages`
    ADD CONSTRAINT `FK_programming_languages_TO_available_languages_1` FOREIGN KEY (
                                                                                    `programming_language_id`
        )
        REFERENCES `programming_languages` (
                                            `id`
            );

ALTER TABLE `available_languages`
    ADD CONSTRAINT `FK_problems_TO_available_languages_1` FOREIGN KEY (
                                                                       `problem_id`
        )
        REFERENCES `problems` (
                               `id`
            );

ALTER TABLE `submits`
    ADD CONSTRAINT `FK_problems_TO_submits_1` FOREIGN KEY (
                                                           `problem_id`
        )
        REFERENCES `problems` (
                               `id`
            );

ALTER TABLE `submits`
    ADD CONSTRAINT `FK_members_TO_submits_1` FOREIGN KEY (
                                                          `member_id`
        )
        REFERENCES `members` (
                              `id`
            );

ALTER TABLE `solutions`
    ADD CONSTRAINT `FK_members_TO_solutions_1` FOREIGN KEY (
                                                            `member_id`
        )
        REFERENCES `members` (
                              `id`
            );

ALTER TABLE `solutions`
    ADD CONSTRAINT `FK_problems_TO_solutions_1` FOREIGN KEY (
                                                             `problem_id`
        )
        REFERENCES `problems` (
                               `id`
            );

ALTER TABLE `solution_languages`
    ADD CONSTRAINT `FK_solutions_TO_solution_languages_1` FOREIGN KEY (`solution_id`)
        REFERENCES `solutions` (`id`) ON DELETE CASCADE;

ALTER TABLE `solution_languages`
    ADD CONSTRAINT `FK_available_languages_TO_solution_languages_2` FOREIGN KEY (available_language_id)
        REFERENCES `available_languages` (`id`) ON DELETE CASCADE;

ALTER TABLE `comments`
    ADD CONSTRAINT `FK_members_TO_comments_1` FOREIGN KEY (
                                                           `member_id`
        )
        REFERENCES `members` (
                              `id`
            );

ALTER TABLE `comments`
    ADD CONSTRAINT `FK_solutions_TO_comments_1` FOREIGN KEY (`solution_id`)
        REFERENCES `solutions` (`id`) ON DELETE CASCADE;

ALTER TABLE `replies`
    ADD CONSTRAINT `FK_members_TO_replies_1` FOREIGN KEY (
                                                          `member_id`
        )
        REFERENCES `members` (
                              `id`
            );

ALTER TABLE `replies`
    ADD CONSTRAINT `FK_comments_TO_replies_1` FOREIGN KEY (`comment_id`)
        REFERENCES `comments` (`id`) ON DELETE CASCADE;

ALTER TABLE `solution_likes`
    ADD CONSTRAINT `FK_members_TO_solution_likes_1` FOREIGN KEY (`member_id`)
        REFERENCES `members` (`id`) ON DELETE CASCADE;

ALTER TABLE `solution_likes`
    ADD CONSTRAINT `FK_solutions_TO_solution_likes_1` FOREIGN KEY (`solution_id`)
        REFERENCES `solutions` (`id`) ON DELETE CASCADE;

ALTER TABLE `comment_likes`
    ADD CONSTRAINT `FK_members_TO_comment_likes_1` FOREIGN KEY (
                                                                `member_id`
        )
        REFERENCES `members` (
                              `id`
            );

ALTER TABLE `comment_likes`
    ADD CONSTRAINT `FK_comments_TO_comment_likes_1` FOREIGN KEY (`comment_id`)
        REFERENCES `comments` (`id`) ON DELETE CASCADE;

ALTER TABLE `reply_likes`
    ADD CONSTRAINT `FK_replies_TO_reply_likes_1` FOREIGN KEY (
                                                              `reply_id`
        )
        REFERENCES `replies` (
                              `id`
            );

ALTER TABLE `reply_likes`
    ADD CONSTRAINT `FK_members_TO_reply_likes_1` FOREIGN KEY (
                                                              `member_id`
        )
        REFERENCES `members` (
                              `id`
            );

ALTER TABLE `mini_quiz_tags`
    ADD CONSTRAINT `FK_tags_TO_mini_quiz_tags_1` FOREIGN KEY (
                                                              `tag_id`
        )
        REFERENCES `tags` (
                           `id`
            );

ALTER TABLE `mini_quiz_tags`
    ADD CONSTRAINT `FK_mini_quizzes_TO_mini_quiz_tags_1` FOREIGN KEY (`mini_quiz_id`)
        REFERENCES `mini_quizzes` (`id`);

ALTER TABLE `answers`
    ADD CONSTRAINT `FK_members_TO_answers` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`);

ALTER TABLE `answers`
    ADD CONSTRAINT `FK_problems_TO_answers` FOREIGN KEY (`problem_id`) REFERENCES `problems` (`id`);

ALTER TABLE `solution_views`
    ADD CONSTRAINT `FK_members_TO_solution_views` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;

ALTER TABLE `solution_views`
    ADD CONSTRAINT `FK_solutions_TO_solution_views` FOREIGN KEY (`solution_id`) REFERENCES `solutions` (`id`) ON DELETE CASCADE;

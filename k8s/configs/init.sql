CREATE SCHEMA IF NOT EXISTS `algo_with_me` DEFAULT CHARACTER SET utf8mb4;

GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root' WITH GRANT OPTION;
GRANT ALL ON algo_with_me.* TO 'root'@'localhost';
FLUSH PRIVILEGES;

DROP TABLE IF EXISTS `members`;

CREATE TABLE `members`
(
    `id`       BIGINT       NOT NULL,
    `email`    VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `nickname` VARCHAR(255) NOT NULL,
    `role`     VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS `problems`;

CREATE TABLE `problems`
(
    `id`          BIGINT       NOT NULL,
    `number`      BIGINT       NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `title`       VARCHAR(255) NOT NULL,
    `difficulty`  VARCHAR(255) NOT NULL,
    `acceptance`  DECIMAL      NOT NULL
);

DROP TABLE IF EXISTS `testcases`;

CREATE TABLE `testcases`
(
    `id`           BIGINT       NOT NULL,
    `problem_id`   BIGINT       NOT NULL,
    `number`       BIGINT       NOT NULL,
    `input_names`  VARCHAR(255) NOT NULL,
    `input_values` VARCHAR(255) NOT NULL,
    `output`       VARCHAR(255) NOT NULL,
    `isGrading`    BOOLEAN      NOT NULL
);

DROP TABLE IF EXISTS `programming_languages`;

CREATE TABLE `programming_languages`
(
    `id`   BIGINT       NOT NULL,
    `name` VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags`
(
    `id`   BIGINT       NOT NULL,
    `name` VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS `problem_tags`;

CREATE TABLE `problem_tags`
(
    `id`         BIGINT NOT NULL,
    `problem_id` BIGINT NOT NULL,
    `tag_id`     BIGINT NOT NULL
);

DROP TABLE IF EXISTS `available_languages`;

CREATE TABLE `available_languages`
(
    `id`                       BIGINT       NOT NULL,
    `template_code`            VARCHAR(255) NOT NULL,
    `programming_languages_id` BIGINT       NOT NULL,
    `problem_id`               BIGINT       NOT NULL
);

DROP TABLE IF EXISTS `submits`;

CREATE TABLE `submits`
(
    `id`         BIGINT       NOT NULL,
    `problem_id` BIGINT       NOT NULL,
    `member_id`  BIGINT       NOT NULL,
    `code`       TEXT         NOT NULL,
    `result`     VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS `solutions`;

CREATE TABLE `solutions`
(
    `id`         BIGINT       NOT NULL,
    `member_id`  BIGINT       NOT NULL,
    `problem_id` BIGINT       NOT NULL,
    `title`      VARCHAR(255) NOT NULL,
    `content`    VARCHAR(255) NOT NULL,
    `view_count` BIGINT       NOT NULL
);

DROP TABLE IF EXISTS `solution_languages`;

CREATE TABLE `solution_languages`
(
    `id`                       BIGINT NOT NULL,
    `solution_id`              BIGINT NOT NULL,
    `programming_languages_id` BIGINT NOT NULL
);

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments`
(
    `id`          BIGINT       NOT NULL,
    `member_id`   BIGINT       NOT NULL,
    `solution_id` BIGINT       NOT NULL,
    `content`     VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS `replies`;

CREATE TABLE `replies`
(
    `id`         BIGINT NOT NULL,
    `member_id`  BIGINT NOT NULL,
    `comment_id` BIGINT NOT NULL,
    `content`    BIGINT NOT NULL
);

DROP TABLE IF EXISTS `solution_likes`;

CREATE TABLE `solution_likes`
(
    `id`          BIGINT NOT NULL,
    `member_id`   BIGINT NOT NULL,
    `solution_id` BIGINT NOT NULL
);

DROP TABLE IF EXISTS `comment_likes`;

CREATE TABLE `comment_likes`
(
    `id`         BIGINT NOT NULL,
    `member_id`  BIGINT NOT NULL,
    `comment_id` BIGINT NOT NULL
);

DROP TABLE IF EXISTS `reply_likes`;

CREATE TABLE `reply_likes`
(
    `id`        BIGINT NOT NULL,
    `reply_id`  BIGINT NOT NULL,
    `member_id` BIGINT NOT NULL
);

DROP TABLE IF EXISTS `mini_quizzes`;

CREATE TABLE `mini_quizzes`
(
    `id`               BIGINT       NOT NULL,
    `desciprtion`      VARCHAR(255) NOT NULL,
    `explain`          VARCHAR(255) NOT NULL,
    `answer`           VARCHAR(255) NOT NULL,
    `type`             VARCHAR(255) NOT NULL,
    `difficulty`       VARCHAR(255) NOT NULL,
    `choiceOrInitials` VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS `mini_quiz_tags`;

CREATE TABLE `mini_quiz_tags`
(
    `id`           BIGINT NOT NULL,
    `tag_id`       BIGINT NOT NULL,
    `mini_quiz_id` BIGINT NOT NULL
);

ALTER TABLE `members`
    ADD CONSTRAINT `PK_MEMBERS` PRIMARY KEY (
                                             `id`
        );

ALTER TABLE `problems`
    ADD CONSTRAINT `PK_PROBLEMS` PRIMARY KEY (
                                              `id`
        );

ALTER TABLE `testcases`
    ADD CONSTRAINT `PK_TESTCASES` PRIMARY KEY (
                                               `id`,
                                               `problem_id`
        );

ALTER TABLE `programming_languages`
    ADD CONSTRAINT `PK_PROGRAMMING_LANGUAGES` PRIMARY KEY (
                                                           `id`
        );

ALTER TABLE `tags`
    ADD CONSTRAINT `PK_TAGS` PRIMARY KEY (
                                          `id`
        );

ALTER TABLE `problem_tags`
    ADD CONSTRAINT `PK_PROBLEM_TAGS` PRIMARY KEY (
                                                  `id`
        );

ALTER TABLE `available_languages`
    ADD CONSTRAINT `PK_AVAILABLE_LANGUAGES` PRIMARY KEY (
                                                         `id`
        );

ALTER TABLE `submits`
    ADD CONSTRAINT `PK_SUBMITS` PRIMARY KEY (
                                             `id`
        );

ALTER TABLE `solutions`
    ADD CONSTRAINT `PK_SOLUTIONS` PRIMARY KEY (
                                               `id`
        );

ALTER TABLE `solution_languages`
    ADD CONSTRAINT `PK_SOLUTION_LANGUAGES` PRIMARY KEY (
                                                        `id`
        );

ALTER TABLE `comments`
    ADD CONSTRAINT `PK_COMMENTS` PRIMARY KEY (
                                              `id`
        );

ALTER TABLE `replies`
    ADD CONSTRAINT `PK_REPLIES` PRIMARY KEY (
                                             `id`
        );

ALTER TABLE `solution_likes`
    ADD CONSTRAINT `PK_SOLUTION_LIKES` PRIMARY KEY (
                                                    `id`
        );

ALTER TABLE `comment_likes`
    ADD CONSTRAINT `PK_COMMENT_LIKES` PRIMARY KEY (
                                                   `id`
        );

ALTER TABLE `reply_likes`
    ADD CONSTRAINT `PK_REPLY_LIKES` PRIMARY KEY (
                                                 `id`
        );

ALTER TABLE `mini_quizzes`
    ADD CONSTRAINT `PK_MINI_QUIZZES` PRIMARY KEY (
                                                  `id`
        );

ALTER TABLE `mini_quiz_tags`
    ADD CONSTRAINT `PK_MINI_QUIZ_TAGS` PRIMARY KEY (
                                                    `id`
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
                                                                                    `programming_languages_id`
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
    ADD CONSTRAINT `FK_solutions_TO_solution_languages_1` FOREIGN KEY (
                                                                       `solution_id`
        )
        REFERENCES `solutions` (
                                `id`
            );

ALTER TABLE `solution_languages`
    ADD CONSTRAINT `FK_available_languages_TO_solution_languages_1` FOREIGN KEY (
                                                                                 `programming_languages_id`
        )
        REFERENCES `available_languages` (
                                          `id`
            );

ALTER TABLE `comments`
    ADD CONSTRAINT `FK_members_TO_comments_1` FOREIGN KEY (
                                                           `member_id`
        )
        REFERENCES `members` (
                              `id`
            );

ALTER TABLE `comments`
    ADD CONSTRAINT `FK_solutions_TO_comments_1` FOREIGN KEY (
                                                             `solution_id`
        )
        REFERENCES `solutions` (
                                `id`
            );

ALTER TABLE `replies`
    ADD CONSTRAINT `FK_members_TO_replies_1` FOREIGN KEY (
                                                          `member_id`
        )
        REFERENCES `members` (
                              `id`
            );

ALTER TABLE `replies`
    ADD CONSTRAINT `FK_comments_TO_replies_1` FOREIGN KEY (
                                                           `comment_id`
        )
        REFERENCES `comments` (
                               `id`
            );

ALTER TABLE `solution_likes`
    ADD CONSTRAINT `FK_members_TO_solution_likes_1` FOREIGN KEY (
                                                                 `member_id`
        )
        REFERENCES `members` (
                              `id`
            );

ALTER TABLE `solution_likes`
    ADD CONSTRAINT `FK_solutions_TO_solution_likes_1` FOREIGN KEY (
                                                                   `solution_id`
        )
        REFERENCES `solutions` (
                                `id`
            );

ALTER TABLE `comment_likes`
    ADD CONSTRAINT `FK_members_TO_comment_likes_1` FOREIGN KEY (
                                                                `member_id`
        )
        REFERENCES `members` (
                              `id`
            );

ALTER TABLE `comment_likes`
    ADD CONSTRAINT `FK_comments_TO_comment_likes_1` FOREIGN KEY (
                                                                 `comment_id`
        )
        REFERENCES `comments` (
                               `id`
            );

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
    ADD CONSTRAINT `FK_mini_quizzes_TO_mini_quiz_tags_1` FOREIGN KEY (
                                                                      `mini_quiz_id`
        )
        REFERENCES `mini_quizzes` (
                                   `id`
            );



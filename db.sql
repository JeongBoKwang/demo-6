CREATE DATABASE a3;

USE a3;

CREATE TABLE article(
    id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id),
    regDate DATETIME NOT NULL,
    title CHAR(100) NOT NULL,
    `body` TEXT NOT NULL
);

INSERT INTO article(
    regDate, title, `body`
)
VALUES (
    NOW(), "제목1", "내용1"
);

INSERT INTO article(
    regDate, title, `body`
)
VALUES (
    NOW(), "제목2", "내용2"
);

CREATE TABLE `member`(
    id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id),
    regDate DATETIME NOT NULL,
    loginId CHAR(30) NOT NULL,
    loginPw VARCHAR(120) NOT NULL,
    `name` CHAR(100) NOT NULL
);

ALTER TABLE `member` ADD INDEX (`loginId`);
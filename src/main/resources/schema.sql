DROP DATABASE IF EXISTS ssm;
CREATE DATABASE ssm CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ssm;
CREATE TABLE Todo
(
    `id`      INT          NOT NULL AUTO_INCREMENT,
    `content`   VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);



CREATE TABLE `ssm`.`Topic` (
`id` INT NOT NULL AUTO_INCREMENT,
`title` VARCHAR(200) NOT NULL,
`content` VARCHAR(1000) NOT NULL,
`userId` INT NOT NULL,
PRIMARY KEY (`id`));



CREATE TABLE `ssm`.`User` (
`id` INT NOT NULL AUTO_INCREMENT,
`username` VARCHAR(45) NOT NULL,
`password` VARCHAR(100) NOT NULL,
`role` ENUM('admin', 'guest', 'normal') NOT NULL,
PRIMARY KEY (`id`));


CREATE TABLE `ssm`.`TopicComment` (
`id` INT NOT NULL AUTO_INCREMENT,
`content` VARCHAR(200) NOT NULL,
`userId` INT NOT NULL,
`topicId` INT NOT NULL,
PRIMARY KEY (`id`));


/*select
    Topic.title,
    TopicComment.id as c_id,
    TopicComment.content as c_content,
    topiccomment.createdTime as c_createdTime,
    topiccomment.updatedTime as c_updatedTime,
    User.id as u_id
from Topic left join TopicComment
                     on Topic.id = TopicComment.topicId
           left join User
                     on User.id  = TopicComment.userId
where user.id = 1
order by c_updatedTime desc
*/


CREATE TABLE `ssm`.`board` (
                               `id` INT(11) NOT NULL,
                               `name` VARCHAR(200) NOT NULL,
                               PRIMARY KEY (`id`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE `ssm`.`comment` (
                                 `id` INT(11) NOT NULL,
                                 `content` VARCHAR(45) NOT NULL,
                                 `weibo_id` INT(11) NOT NULL,
                                 PRIMARY KEY (`id`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4;



CREATE TABLE `ssm`.`weibo` (
                               `id` INT(11) NOT NULL,
                               `content` VARCHAR(45) NULL,
                               `userId` INT(11) NULL,
                               PRIMARY KEY (`id`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4;



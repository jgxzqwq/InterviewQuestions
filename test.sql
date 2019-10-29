/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-10-29 10:45:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '答案的ID',
  `option` varchar(255) DEFAULT NULL COMMENT '答案的对应选项',
  `option_value` int(11) DEFAULT NULL COMMENT '答案对应的值',
  `subject_id` int(11) DEFAULT NULL COMMENT '关联题目id',
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of answer
-- ----------------------------

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '等级级别的id',
  `img` varchar(255) DEFAULT NULL COMMENT '对应级别的图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '0');
INSERT INTO `grade` VALUES ('2', '0');
INSERT INTO `grade` VALUES ('3', '0');
INSERT INTO `grade` VALUES ('4', '0');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '题目的id',
  `subject` varchar(255) DEFAULT NULL COMMENT '题目',
  `answer_value` int(11) DEFAULT NULL COMMENT '题目对应的答案值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of subject
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '小明', '123');

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message` (
  `user_id` int(11) NOT NULL COMMENT '关联user的id',
  `grade_id` int(11) DEFAULT NULL COMMENT 'user等级',
  `experience` int(11) DEFAULT NULL COMMENT 'user的经验',
  `gold_coin` int(11) DEFAULT NULL COMMENT 'user的金币',
  KEY `user_id` (`user_id`),
  KEY `grade_id` (`grade_id`),
  CONSTRAINT `user_message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_message_ibfk_2` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of user_message
-- ----------------------------
INSERT INTO `user_message` VALUES ('1', '1', '0', '0');

-- ----------------------------
-- Procedure structure for stufind
-- ----------------------------
DROP PROCEDURE IF EXISTS `stufind`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `stufind`()
BEGIN
SELECT *FROM student,score WHERE student.id=score.stu_id GROUP BY student.`NAME` HAVING min(grade)>=60 AND COUNT(DISTINCT c_name)>=2 ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for stu_add
-- ----------------------------
DROP PROCEDURE IF EXISTS `stu_add`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `stu_add`(in stuname VARCHAR(20),in stusex VARCHAR(20),in stubirth int(11),in studepat VARCHAR(20),in stuaddress VARCHAR(20),in scostu_id int(11),in sconame VARCHAR(20),in scograde INT(11) )
BEGIN
	   INSERT INTO student VALUES(null,stuname,stusex,stubirth,studepat,stuaddress);
	   INSERT INTO score VALUES(null,scostu_id,sconame,scograde);
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for stu_dele
-- ----------------------------
DROP PROCEDURE IF EXISTS `stu_dele`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `stu_dele`(in dalename varchar(20))
BEGIN
DELETE FROM score  WHERE student.id=score.stu_id AND student.`NAME`=delename;
DELETE FROM student WHERE name=delename;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for stu_find
-- ----------------------------
DROP PROCEDURE IF EXISTS `stu_find`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `stu_find`(in findname VARCHAR(20))
BEGIN
SELECT t1.grade FROM student,score WHERE student.id=score.stu_id AND (c_name='计算机'OR c_name='英语') AND student.`NAME`=findname;
END
;;
DELIMITER ;

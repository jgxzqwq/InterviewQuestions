/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-10-30 19:14:47
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('1', '应用服务器', '1', '1');
INSERT INTO `answer` VALUES ('2', '虚拟机', '2', '1');
INSERT INTO `answer` VALUES ('3', '垃圾回收器', '3', '1');
INSERT INTO `answer` VALUES ('4', '编译器', '4', '1');
INSERT INTO `answer` VALUES ('5', '5 4 1 3 2', '1', '2');
INSERT INTO `answer` VALUES ('6', '2 3 4 1 5', '2', '2');
INSERT INTO `answer` VALUES ('7', '1 5 4 3 2 ', '3', '2');
INSERT INTO `answer` VALUES ('8', '2 3 1 4 5 ', '4', '2');
INSERT INTO `answer` VALUES ('9', '是一种开源产品', '1', '3');
INSERT INTO `answer` VALUES ('10', '是一种编程语言', '2', '3');
INSERT INTO `answer` VALUES ('11', '是一种访问协议', '3', '3');
INSERT INTO `answer` VALUES ('12', '是一种存储数据的目录', '4', '3');
INSERT INTO `answer` VALUES ('13', '只能在基础表中有select权限', '1', '4');
INSERT INTO `answer` VALUES ('14', '在视图中需要有select权限', '2', '4');
INSERT INTO `answer` VALUES ('15', '基础表中必须有数据', '3', '4');
INSERT INTO `answer` VALUES ('16', '基础表必须在同一个用户模式中', '4', '4');
INSERT INTO `answer` VALUES ('17', '物理层 数据链路层 传输层 网络层 会话层 表示层', '1', '5');
INSERT INTO `answer` VALUES ('18', '物理层 数据链路层 会话层 网络层 传输层 表示层 ', '2', '5');
INSERT INTO `answer` VALUES ('19', '物理层 数据链路层 网络层 传输层 会话层 表示层 应用层', '3', '5');
INSERT INTO `answer` VALUES ('20', '网络层 传输层 物理层 数据链路层 会话层 表示层 ', '4', '5');
INSERT INTO `answer` VALUES ('21', '连接不会关闭，只是简单地还给连接池', '1', '6');
INSERT INTO `answer` VALUES ('22', '连接被关闭，但又被重新打开并还给连接池', '2', '6');
INSERT INTO `answer` VALUES ('23', '连接永久性关闭', '3', '6');
INSERT INTO `answer` VALUES ('24', '连接被关闭，但还在连接池', '4', '6');
INSERT INTO `answer` VALUES ('25', 'eval', '1', '7');
INSERT INTO `answer` VALUES ('26', 'escape', '2', '7');
INSERT INTO `answer` VALUES ('27', 'setTimeout', '3', '7');
INSERT INTO `answer` VALUES ('28', 'parseFloat', '4', '7');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'java');

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
  `category_id` int(255) DEFAULT NULL COMMENT '题目类别',
  `answer_value` int(11) DEFAULT NULL COMMENT '题目对应的答案值',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('1', '在Java中，负责对字节代码解释执行的是', '1', '2');
INSERT INTO `subject` VALUES ('2', '一个栈的输入序列为1 2 3 4 5，则下列序列中不可能是栈得输出序列的是', '1', '1');
INSERT INTO `subject` VALUES ('3', 'LDAP是什么', '1', '3');
INSERT INTO `subject` VALUES ('4', '要想在你的视图上成功的执行查询需要做什么？', '1', '2');
INSERT INTO `subject` VALUES ('5', '下列哪一个选项按照顺序包括了模型的七个层次：（）', '1', '3');
INSERT INTO `subject` VALUES ('6', '当客户端关闭一个从连接池中获取的连接,会发生下面哪一种情况', '1', '1');
INSERT INTO `subject` VALUES ('7', '以下哪些不是的全局函数（）', '1', '3');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '小明', '123', null);

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message` (
  `user_id` int(11) NOT NULL COMMENT '关联user的id',
  `grade_id` int(11) DEFAULT NULL COMMENT 'user等级',
  `experience` int(11) DEFAULT NULL COMMENT 'user的经验',
  `user_img` varchar(11) DEFAULT NULL COMMENT 'user的头像',
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
-- Table structure for wrong
-- ----------------------------
DROP TABLE IF EXISTS `wrong`;
CREATE TABLE `wrong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `wrong_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `wrong_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of wrong
-- ----------------------------

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

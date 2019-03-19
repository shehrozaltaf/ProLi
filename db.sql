/*
Navicat MySQL Data Transfer

Source Server         : localxampp3308
Source Server Version : 50505
Source Host           : localhost:3308
Source Database       : akuportal

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-03-19 15:16:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `group`
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `idGroup` varchar(255) NOT NULL,
  `GroupName` varchar(255) DEFAULT NULL,
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('1AA4943C-B01F-61DF-A582-04A3E8150048', 'User', '');
INSERT INTO `group` VALUES ('5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', 'Admin', '');

-- ----------------------------
-- Table structure for `pagegroup`
-- ----------------------------
DROP TABLE IF EXISTS `pagegroup`;
CREATE TABLE `pagegroup` (
  `idPageGroup` varchar(255) NOT NULL,
  `idGroup` varchar(255) DEFAULT NULL,
  `idPages` varchar(255) DEFAULT NULL,
  `CanAdd` bit(1) DEFAULT b'0',
  `CanEdit` bit(1) DEFAULT b'0',
  `CanDelete` bit(1) DEFAULT b'0',
  `CanView` bit(1) DEFAULT b'0',
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idPageGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pagegroup
-- ----------------------------
INSERT INTO `pagegroup` VALUES ('08444cb3-0a47-4e58-b110-13e5058cac3f', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', '7b668b0f-b90e-467d-9c8b-c2e2a6911981', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('2cc64fd6-4c56-4164-8801-190c5f5c149e', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', 'ff0d3248-2fe9-4157-a922-e131eaa1efe4', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('42406577-46C9-1A3A-19B5-9E0A502E1A1E', '1AA4943C-B01F-61DF-A582-04A3E8150048', '208FA412-F700-3339-CA7E-4E9EE459F6C0', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('58a8f49f-3363-40f9-bdc1-14c0ea120b97', '1AA4943C-B01F-61DF-A582-04A3E8150048', 'ae40d56c-1f44-46e8-82f4-6360a26b30b8', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('5ce26d33-b3e5-4c07-aecc-d40bb7d39ce1', '1AA4943C-B01F-61DF-A582-04A3E8150048', 'cc5f8e7a-c74d-419b-82dd-7c59b026e8f5', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('68a19c68-4326-4b7c-a66c-eea13866c306', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', 'ae40d56c-1f44-46e8-82f4-6360a26b30b8', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('6cf1b0cf-4312-4fee-8d27-1a66b22fc477', '1AA4943C-B01F-61DF-A582-04A3E8150048', 'T70d3248-2fe9-4157-a932-e131eaa1efe1', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('728A2AE1-8EA6-E7B3-B53A-F03BC55882FD', '1AA4943C-B01F-61DF-A582-04A3E8150048', 'ff0d3248-2fe9-4157-a922-e131eaa1efe4', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('97739515-c587-4849-aa53-c51f026b3b5c', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', 'T70d3248-2fe9-4157-a932-e131eaa1efe1', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('A8722A7F-0D57-97D1-AB09-3EC7BC1261F2', '1AA4943C-B01F-61DF-A582-04A3E8150048', '72bd808d-8033-47e9-a580-7ab5b5492837', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('B86BE76A-7D01-20F0-319B-03D02955ECD2', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', '208FA412-F700-3339-CA7E-4E9EE459F6C0', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('badcde94-4323-4619-b914-236553e0bf54', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', '72bd808d-8033-47e9-a580-7ab5b5492837', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('E2675622-8B7A-3866-5A06-AB0FAC334ED0', '1AA4943C-B01F-61DF-A582-04A3E8150048', '7b668b0f-b90e-467d-9c8b-c2e2a6911981', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('e359a33c-3e82-4505-a9ea-b13ba64d9622', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', 'cc5f8e7a-c74d-419b-82dd-7c59b026e8f5', '', '', '', '', '');

-- ----------------------------
-- Table structure for `pages`
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `idPages` varchar(255) NOT NULL,
  `page_name` varchar(255) DEFAULT NULL,
  `page_url` varchar(255) DEFAULT NULL,
  `controller_name` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `sort_no` int(11) DEFAULT NULL,
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idPages`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES ('208FA412-F700-3339-CA7E-4E9EE459F6C0', 'Teams', 'Teams', 'Teams', 'MTeams', '4', '');
INSERT INTO `pages` VALUES ('72bd808d-8033-47e9-a580-7ab5b5492837', 'Dashboard', 'dashboard', 'Dashboard', 'MDashboard', '1', '');
INSERT INTO `pages` VALUES ('7b668b0f-b90e-467d-9c8b-c2e2a6911981', 'Settings', 'setting', 'Setting', 'MSetting', '7', '');
INSERT INTO `pages` VALUES ('ae40d56c-1f44-46e8-82f4-6360a26b30b8', 'Form View', 'form_view', 'Form_View', 'MForm_View', '3', '');
INSERT INTO `pages` VALUES ('cc5f8e7a-c74d-419b-82dd-7c59b026e8f5', 'Pages', 'pages', 'Pages', 'MPages', '6', '');
INSERT INTO `pages` VALUES ('ff0d3248-2fe9-4157-a922-e131eaa1efe4', 'Users', 'users', 'Users', 'MUsers', '5', '');
INSERT INTO `pages` VALUES ('T70d3248-2fe9-4157-a932-e131eaa1efe1', 'Form', 'form', 'Form', 'MForm', '2', '');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `idUser` varchar(255) NOT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `id_org` varchar(255) DEFAULT NULL,
  `idGroup` varchar(255) DEFAULT NULL,
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('3EC0CBA5-F78F-4F80-BA41-052933C5B90D', 'dmu@aku', 'yvAV9WPVrPW4Ht0T8WskzZZ5WUBswUUq6KwCxdvaLeKzn5EqBsr4nATLf2GlPILl8SPeg1LUkblDWqTVtA9TGQ==', 'AKU DMU', 'admin', '1', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', '');
INSERT INTO `users` VALUES ('461BFBAA-71E5-3B15-3D27-3E7ECD6FBE97', 'shehroz.altaf', 'OVoXLdrDVsD5isHW93Kua1v79IZA82RUC36nJN4z+lWx+fzVUhZuqR6gfFb0w8VTmk0cR7MNEesZu5KXrQGcrA==', 'Shehroz', 'Programmer Analyst', '1', '1AA4943C-B01F-61DF-A582-04A3E8150048', '');
INSERT INTO `users` VALUES ('9850BA8F-85C1-8BF4-F297-EB9B575FB6D1', 'Testing', 'RkrjUUHoL9Aq8lRMYQbrcobGee15tVieSOu3P5+y9dfbliqOy6CugwOyF5zy533T1Ev9BU63uAnrUlh5C7SruA==', 'Testing', 'Testing', '1', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', '');
INSERT INTO `users` VALUES ('BCDFB392-D7BB-E305-1A0D-A028A8A062A1', 'test', 'r2lkkO9WUeBflY1wmRKvSB0tnaFeAGq9Ew2MFU5k9yN/SvyJxYXvGx47HXwUE/17/7y4++5bKaNgPgoFmXYKwQ==', 'Test Test', 'test', '1', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', '');

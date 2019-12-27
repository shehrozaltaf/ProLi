/*
Navicat MySQL Data Transfer

Source Server         : localxampp3308
Source Server Version : 50505
Source Host           : localhost:3308
Source Database       : pl

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-12-18 20:13:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `attribute`
-- ----------------------------
DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute` (
  `idAttribute` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(255) NOT NULL,
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idAttribute`) USING BTREE,
  KEY `filter_code` (`idAttribute`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of attribute
-- ----------------------------
INSERT INTO `attribute` VALUES ('1', 'Formula Line Extension', '');
INSERT INTO `attribute` VALUES ('2', 'Formula Line Extension 2', '');
INSERT INTO `attribute` VALUES ('3', 'Line Extension\r\n', '');
INSERT INTO `attribute` VALUES ('4', 'Product Brand\r\n', '');
INSERT INTO `attribute` VALUES ('5', 'Product Type\r\n', '');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `idCategory` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL,
  `cat_desc` longtext,
  `sort_order` int(11) NOT NULL,
  `idParent` varchar(100) NOT NULL,
  `cat_url` longtext NOT NULL,
  `image` longtext,
  `cat_level` varchar(255) DEFAULT NULL,
  `isActive` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCategory`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('38', 'Power Supplies & Power Protection', 'Power Supplies & Power Protection', '1', '0', '', '', '1', '1');
INSERT INTO `category` VALUES ('39', 'Power Supplies', 'Power Supplies', '2', '38', '', '', '2', '1');
INSERT INTO `category` VALUES ('40', 'Storage Devices', 'Storage Devices', '1', '0', '', '', '1', '1');
INSERT INTO `category` VALUES ('41', 'Storage', 'Storage', '2', '40', '', '', '2', '1');
INSERT INTO `category` VALUES ('42', 'Internal Hard Drives', 'Internal Hard Drives', '3', '41', '', '', '3', '1');
INSERT INTO `category` VALUES ('43', 'Desktop Hard Drive', 'Desktop Hard Drive', '4', '42', '', '', '4', '1');
INSERT INTO `category` VALUES ('44', 'Tape Drive', 'Tape Drive', '3', '41', '', '', '3', '1');
INSERT INTO `category` VALUES ('45', 'SSD & HDD Accessories', 'SSD & HDD Accessories', '3', '41', '', '', '3', '1');
INSERT INTO `category` VALUES ('46', 'Motherboards', 'Motherboards', '1', '0', '', '', '1', '1');
INSERT INTO `category` VALUES ('47', 'Server Motherboards', 'Server Motherboards', '2', '46', '', '', '2', '1');
INSERT INTO `category` VALUES ('48', 'RAID Controllers', 'RAID Controllers', '3', '41', '', '', '3', '1');
INSERT INTO `category` VALUES ('49', 'SCSI Controller', 'SCSI Controller', '4', '48', '', '', '4', '1');
INSERT INTO `category` VALUES ('50', 'Laptop Motherboards', 'Laptop Motherboards', '2', '46', '', '', '2', '1');
INSERT INTO `category` VALUES ('51', 'Accessories & Batteries', 'Accessories & Batteries', '1', '0', '', '', '1', '1');
INSERT INTO `category` VALUES ('52', 'Cooling Fans & Heat Sink', 'Cooling Fans & Heat Sink', '2', '51', '', '', '2', '1');
INSERT INTO `category` VALUES ('53', 'Heatsink', 'Heatsink', '3', '52', '', '', '3', '1');
INSERT INTO `category` VALUES ('54', 'PC, Servers & Software', 'PC, Servers & Software', '1', '0', '', '', '1', '1');
INSERT INTO `category` VALUES ('55', 'Laptops', 'Laptops', '2', '54', '', '', '2', '1');
INSERT INTO `category` VALUES ('56', 'Laptop Accessories', 'Laptop Accessories', '3', '55', '', '', '3', '1');
INSERT INTO `category` VALUES ('57', 'Laptop Covers', 'Laptop Covers', '4', '56', '', '', '4', '1');
INSERT INTO `category` VALUES ('58', 'Fiber Channel Controller', 'Fiber Channel Controller', '4', '48', '', '', '4', '1');
INSERT INTO `category` VALUES ('59', 'Server Hard Drive', 'Server Hard Drive', '4', '42', '', '', '4', '1');
INSERT INTO `category` VALUES ('60', 'Laptop Hard Drive', 'Laptop Hard Drive', '4', '42', '', '', '4', '1');
INSERT INTO `category` VALUES ('61', 'Miscellaneous', 'Miscellaneous', '4', '48', '', '', '4', '1');
INSERT INTO `category` VALUES ('62', 'Servers', 'Servers', '2', '54', '', '', '2', '1');
INSERT INTO `category` VALUES ('63', 'Server Accessories', 'Server Accessories', '3', '62', '', '', '3', '1');
INSERT INTO `category` VALUES ('64', 'Tape Drive', 'Tape Drive', '4', '44', '', null, '4', '1');

-- ----------------------------
-- Table structure for `category_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `category_attribute`;
CREATE TABLE `category_attribute` (
  `idCategoryAttribute` int(11) NOT NULL AUTO_INCREMENT,
  `idCategory` int(11) DEFAULT NULL,
  `idAttribute` int(11) DEFAULT NULL,
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idCategoryAttribute`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of category_attribute
-- ----------------------------
INSERT INTO `category_attribute` VALUES ('1', '43', '1', '');
INSERT INTO `category_attribute` VALUES ('2', '43', '2', '');
INSERT INTO `category_attribute` VALUES ('3', '39', '1', '');
INSERT INTO `category_attribute` VALUES ('4', '43', '3', '');
INSERT INTO `category_attribute` VALUES ('5', '43', '4', '');
INSERT INTO `category_attribute` VALUES ('6', '43', '5', '');

-- ----------------------------
-- Table structure for `group`
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `idGroup` varchar(255) NOT NULL,
  `GroupName` varchar(255) DEFAULT NULL,
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idGroup`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('1AA4943C-B01F-61DF-A582-04A3E8150048', 'User', '');
INSERT INTO `group` VALUES ('5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', 'Admin', '');
INSERT INTO `group` VALUES ('CEEBA3AC-898F-FAC1-3B7A-56004456BF2D', 'Data Entry 1', '');
INSERT INTO `group` VALUES ('E86FB262-75C7-7745-B2EE-14AE93028BDF', 'Data Entry', '');

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
  PRIMARY KEY (`idPageGroup`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of pagegroup
-- ----------------------------
INSERT INTO `pagegroup` VALUES ('', '520AEECD-C8C4-F19E-7163-1E1F2DB1497A', null, '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('075B701B-9644-968A-F3DF-30A25CFEBFA3', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', 'FF22FCF2-5805-7378-51C5-A9A5CE345E04', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('08444cb3-0a47-4e58-b110-13e5058cac3f', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', '7b668b0f-b90e-467d-9c8b-c2e2a6911981', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('1', 'E86FB262-75C7-7745-B2EE-14AE93028BDF', '208FA412-F700-3339-CA7E-4E9EE459F6C0', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('2', 'E86FB262-75C7-7745-B2EE-14AE93028BDF', 'ae40d56c-1f44-46e8-82f4-6360a26b30b8', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('2cc64fd6-4c56-4164-8801-190c5f5c149e', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', 'ff0d3248-2fe9-4157-a922-e131eaa1efe4', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('3', 'E86FB262-75C7-7745-B2EE-14AE93028BDF', 'cc5f8e7a-c74d-419b-82dd-7c59b026e8f5', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('4', 'E86FB262-75C7-7745-B2EE-14AE93028BDF', 'T70d3248-2fe9-4157-a932-e131eaa1efe1', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('42406577-46C9-1A3A-19B5-9E0A502E1A1E', '1AA4943C-B01F-61DF-A582-04A3E8150048', '208FA412-F700-3339-CA7E-4E9EE459F6C0', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('5', 'E86FB262-75C7-7745-B2EE-14AE93028BDF', 'ff0d3248-2fe9-4157-a922-e131eaa1efe4', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('58a8f49f-3363-40f9-bdc1-14c0ea120b97', '1AA4943C-B01F-61DF-A582-04A3E8150048', 'ae40d56c-1f44-46e8-82f4-6360a26b30b8', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('5ce26d33-b3e5-4c07-aecc-d40bb7d39ce1', '1AA4943C-B01F-61DF-A582-04A3E8150048', 'cc5f8e7a-c74d-419b-82dd-7c59b026e8f5', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('6', 'E86FB262-75C7-7745-B2EE-14AE93028BDF', '72bd808d-8033-47e9-a580-7ab5b5492837', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('68a19c68-4326-4b7c-a66c-eea13866c306', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', 'ae40d56c-1f44-46e8-82f4-6360a26b30b8', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('6cf1b0cf-4312-4fee-8d27-1a66b22fc477', '1AA4943C-B01F-61DF-A582-04A3E8150048', 'T70d3248-2fe9-4157-a932-e131eaa1efe1', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('7', 'E86FB262-75C7-7745-B2EE-14AE93028BDF', '7b668b0f-b90e-467d-9c8b-c2e2a6911981', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('728A2AE1-8EA6-E7B3-B53A-F03BC55882FD', '1AA4943C-B01F-61DF-A582-04A3E8150048', 'ff0d3248-2fe9-4157-a922-e131eaa1efe4', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('8', 'E86FB262-75C7-7745-B2EE-14AE93028BDF', '520AEECD-C8C4-F19E-7163-1E1F2DB1497A', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('8EED6269-4A5C-967B-EEAF-75C1E10C7FC6', '1AA4943C-B01F-61DF-A582-04A3E8150048', 'FF22FCF2-5805-7378-51C5-A9A5CE345E04', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('97739515-c587-4849-aa53-c51f026b3b5c', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', 'T70d3248-2fe9-4157-a932-e131eaa1efe1', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('A8722A7F-0D57-97D1-AB09-3EC7BC1261F2', '1AA4943C-B01F-61DF-A582-04A3E8150048', '72bd808d-8033-47e9-a580-7ab5b5492837', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('B86BE76A-7D01-20F0-319B-03D02955ECD2', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', '208FA412-F700-3339-CA7E-4E9EE459F6C0', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('badcde94-4323-4619-b914-236553e0bf54', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', '72bd808d-8033-47e9-a580-7ab5b5492837', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('D1E9A65F-140F-C5E3-E8B5-CADA748294CC', 'E86FB262-75C7-7745-B2EE-14AE93028BDF', 'FF22FCF2-5805-7378-51C5-A9A5CE345E04', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('E2675622-8B7A-3866-5A06-AB0FAC334ED0', '1AA4943C-B01F-61DF-A582-04A3E8150048', '7b668b0f-b90e-467d-9c8b-c2e2a6911981', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('e359a33c-3e82-4505-a9ea-b13ba64d9622', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', 'cc5f8e7a-c74d-419b-82dd-7c59b026e8f5', '', '', '', '', '');
INSERT INTO `pagegroup` VALUES ('E5OAEECD-C8C4-F19E-7163-1E1F2DB1392D', '1AA4943C-B01F-61DF-A582-04A3E8150048', '520AEECD-C8C4-F19E-7163-1E1F2DB1497A', '', '', '', '', '');

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
  PRIMARY KEY (`idPages`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES ('208FA412-F700-3339-CA7E-4E9EE459F6C0', 'Products', 'products', 'Products', 'MProducts', '4', '');
INSERT INTO `pages` VALUES ('520AEECD-C8C4-F19E-7163-1E1F2DB1497A', 'Remaining Products', 'products/remainingproducts', 'Products', 'MProducts', '3', '');
INSERT INTO `pages` VALUES ('72bd808d-8033-47e9-a580-7ab5b5492837', 'Dashboard', 'dashboard', 'Dashboard', 'MDashboard', '1', '');
INSERT INTO `pages` VALUES ('7b668b0f-b90e-467d-9c8b-c2e2a6911981', 'Settings', 'setting', 'Setting', 'MSetting', '50', '');
INSERT INTO `pages` VALUES ('cc5f8e7a-c74d-419b-82dd-7c59b026e8f5', 'Pages', 'pages', 'Pages', 'MPages', '49', '');
INSERT INTO `pages` VALUES ('ff0d3248-2fe9-4157-a922-e131eaa1efe4', 'Users', 'users', 'Users', 'MUsers', '46', '');
INSERT INTO `pages` VALUES ('FF22FCF2-5805-7378-51C5-A9A5CE345E04', 'Categories', 'categories', 'Categories', 'MCategories', '5', '');
INSERT INTO `pages` VALUES ('T70d3248-2fe9-4157-a932-e131eaa1efe1', 'Upload Products', 'products/uploadexcel', 'Products', 'MProducts', '2', '');

-- ----------------------------
-- Table structure for `productcategory_`
-- ----------------------------
DROP TABLE IF EXISTS `productcategory_`;
CREATE TABLE `productcategory_` (
  `idProductCategory` int(11) NOT NULL AUTO_INCREMENT,
  `idProduct` int(11) DEFAULT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryLevel` varchar(255) DEFAULT NULL,
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idProductCategory`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=720 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of productcategory_
-- ----------------------------
INSERT INTO `productcategory_` VALUES ('486', '309', 'Power Supplies & Power Protection', '1', '');
INSERT INTO `productcategory_` VALUES ('487', '486', 'Power Supplies', '2', '');
INSERT INTO `productcategory_` VALUES ('488', '310', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('489', '488', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('490', '489', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('491', '490', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('492', '311', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('493', '492', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('494', '493', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('495', '494', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('496', '312', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('497', '496', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('498', '497', 'Tape Drive', '3', '');
INSERT INTO `productcategory_` VALUES ('499', '498', 'Tape Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('500', '313', 'Power Supplies & Power Protection', '1', '');
INSERT INTO `productcategory_` VALUES ('501', '500', 'Power Supplies', '2', '');
INSERT INTO `productcategory_` VALUES ('502', '314', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('503', '502', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('504', '503', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('505', '504', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('506', '315', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('507', '506', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('508', '507', 'SSD & HDD Accessories', '3', '');
INSERT INTO `productcategory_` VALUES ('509', '316', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('510', '509', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('511', '510', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('512', '511', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('513', '317', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('514', '513', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('515', '514', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('516', '515', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('517', '318', 'Motherboards', '1', '');
INSERT INTO `productcategory_` VALUES ('518', '517', 'Server Motherboards', '2', '');
INSERT INTO `productcategory_` VALUES ('519', '319', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('520', '519', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('521', '520', 'RAID Controllers', '3', '');
INSERT INTO `productcategory_` VALUES ('522', '521', 'SCSI Controller', '4', '');
INSERT INTO `productcategory_` VALUES ('523', '320', 'Motherboards', '1', '');
INSERT INTO `productcategory_` VALUES ('524', '523', 'Laptop Motherboards', '2', '');
INSERT INTO `productcategory_` VALUES ('525', '321', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('526', '525', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('527', '526', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('528', '527', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('529', '322', 'Accessories & Batteries', '1', '');
INSERT INTO `productcategory_` VALUES ('530', '529', 'Cooling Fans & Heat Sink', '2', '');
INSERT INTO `productcategory_` VALUES ('531', '530', 'Heatsink', '3', '');
INSERT INTO `productcategory_` VALUES ('532', '323', 'PC, Servers & Software', '1', '');
INSERT INTO `productcategory_` VALUES ('533', '532', 'Laptops', '2', '');
INSERT INTO `productcategory_` VALUES ('534', '533', 'Laptop Accessories', '3', '');
INSERT INTO `productcategory_` VALUES ('535', '534', 'Laptop Covers', '4', '');
INSERT INTO `productcategory_` VALUES ('536', '324', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('537', '536', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('538', '537', 'RAID Controllers', '3', '');
INSERT INTO `productcategory_` VALUES ('539', '538', 'Fiber Channel Controller', '4', '');
INSERT INTO `productcategory_` VALUES ('540', '325', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('541', '540', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('542', '541', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('543', '542', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('544', '326', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('545', '544', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('546', '545', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('547', '546', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('548', '327', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('549', '548', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('550', '549', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('551', '550', 'Server Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('552', '328', 'Motherboards', '1', '');
INSERT INTO `productcategory_` VALUES ('553', '552', 'Server Motherboards', '2', '');
INSERT INTO `productcategory_` VALUES ('554', '329', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('555', '554', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('556', '555', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('557', '556', 'Laptop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('558', '330', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('559', '558', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('560', '559', 'RAID Controllers', '3', '');
INSERT INTO `productcategory_` VALUES ('561', '560', 'Miscellaneous', '4', '');
INSERT INTO `productcategory_` VALUES ('562', '331', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('563', '562', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('564', '563', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('565', '564', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('566', '332', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('567', '566', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('568', '567', 'RAID Controllers', '3', '');
INSERT INTO `productcategory_` VALUES ('569', '568', 'Miscellaneous', '4', '');
INSERT INTO `productcategory_` VALUES ('570', '333', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('571', '570', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('572', '571', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('573', '572', 'Laptop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('574', '334', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('575', '574', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('576', '575', 'RAID Controllers', '3', '');
INSERT INTO `productcategory_` VALUES ('577', '576', 'SCSI Controller', '4', '');
INSERT INTO `productcategory_` VALUES ('578', '335', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('579', '578', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('580', '579', 'Tape Drive', '3', '');
INSERT INTO `productcategory_` VALUES ('581', '580', 'Tape Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('582', '336', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('583', '582', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('584', '583', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('585', '584', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('586', '337', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('587', '586', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('588', '587', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('589', '588', 'Laptop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('590', '338', 'Motherboards', '1', '');
INSERT INTO `productcategory_` VALUES ('591', '590', 'Server Motherboards', '2', '');
INSERT INTO `productcategory_` VALUES ('592', '339', 'Power Supplies & Power Protection', '1', '');
INSERT INTO `productcategory_` VALUES ('593', '592', 'Power Supplies', '2', '');
INSERT INTO `productcategory_` VALUES ('594', '340', 'PC, Servers & Software', '1', '');
INSERT INTO `productcategory_` VALUES ('595', '594', 'Servers', '2', '');
INSERT INTO `productcategory_` VALUES ('596', '595', 'Server Accessories', '3', '');
INSERT INTO `productcategory_` VALUES ('597', '341', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('598', '597', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('599', '598', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('600', '599', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('601', '342', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('602', '601', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('603', '602', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('604', '603', 'Server Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('605', '343', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('606', '605', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('607', '606', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('608', '607', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('609', '344', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('610', '609', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('611', '610', 'Tape Drive', '3', '');
INSERT INTO `productcategory_` VALUES ('612', '611', 'Tape Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('613', '345', 'Power Supplies & Power Protection', '1', '');
INSERT INTO `productcategory_` VALUES ('614', '613', 'Power Supplies', '2', '');
INSERT INTO `productcategory_` VALUES ('615', '346', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('616', '615', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('617', '616', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('618', '617', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('619', '347', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('620', '619', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('621', '620', 'SSD & HDD Accessories', '3', '');
INSERT INTO `productcategory_` VALUES ('622', '348', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('623', '622', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('624', '623', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('625', '624', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('626', '349', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('627', '626', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('628', '627', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('629', '628', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('630', '350', 'Motherboards', '1', '');
INSERT INTO `productcategory_` VALUES ('631', '630', 'Server Motherboards', '2', '');
INSERT INTO `productcategory_` VALUES ('632', '351', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('633', '632', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('634', '633', 'RAID Controllers', '3', '');
INSERT INTO `productcategory_` VALUES ('635', '634', 'SCSI Controller', '4', '');
INSERT INTO `productcategory_` VALUES ('636', '352', 'Motherboards', '1', '');
INSERT INTO `productcategory_` VALUES ('637', '636', 'Laptop Motherboards', '2', '');
INSERT INTO `productcategory_` VALUES ('638', '353', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('639', '638', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('640', '639', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('641', '640', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('642', '354', 'Accessories & Batteries', '1', '');
INSERT INTO `productcategory_` VALUES ('643', '642', 'Cooling Fans & Heat Sink', '2', '');
INSERT INTO `productcategory_` VALUES ('644', '643', 'Heatsink', '3', '');
INSERT INTO `productcategory_` VALUES ('645', '355', 'PC, Servers & Software', '1', '');
INSERT INTO `productcategory_` VALUES ('646', '645', 'Laptops', '2', '');
INSERT INTO `productcategory_` VALUES ('647', '646', 'Laptop Accessories', '3', '');
INSERT INTO `productcategory_` VALUES ('648', '647', 'Laptop Covers', '4', '');
INSERT INTO `productcategory_` VALUES ('649', '356', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('650', '649', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('651', '650', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('652', '651', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('653', '357', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('654', '653', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('655', '654', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('656', '655', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('657', '358', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('658', '657', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('659', '658', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('660', '659', 'Server Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('661', '359', 'Motherboards', '1', '');
INSERT INTO `productcategory_` VALUES ('662', '661', 'Server Motherboards', '2', '');
INSERT INTO `productcategory_` VALUES ('663', '360', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('664', '663', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('665', '664', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('666', '665', 'Laptop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('667', '361', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('668', '667', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('669', '668', 'RAID Controllers', '3', '');
INSERT INTO `productcategory_` VALUES ('670', '669', 'Miscellaneous', '4', '');
INSERT INTO `productcategory_` VALUES ('671', '362', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('672', '671', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('673', '672', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('674', '673', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('675', '363', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('676', '675', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('677', '676', 'RAID Controllers', '3', '');
INSERT INTO `productcategory_` VALUES ('678', '677', 'SCSI Controller', '4', '');
INSERT INTO `productcategory_` VALUES ('679', '364', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('680', '679', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('681', '680', 'Tape Drive', '3', '');
INSERT INTO `productcategory_` VALUES ('682', '681', 'Tape Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('683', '365', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('684', '683', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('685', '684', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('686', '685', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('687', '366', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('688', '687', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('689', '688', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('690', '689', 'Laptop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('691', '367', 'Motherboards', '1', '');
INSERT INTO `productcategory_` VALUES ('692', '691', 'Server Motherboards', '2', '');
INSERT INTO `productcategory_` VALUES ('693', '368', 'Power Supplies & Power Protection', '1', '');
INSERT INTO `productcategory_` VALUES ('694', '693', 'Power Supplies', '2', '');
INSERT INTO `productcategory_` VALUES ('695', '369', 'PC, Servers & Software', '1', '');
INSERT INTO `productcategory_` VALUES ('696', '695', 'Servers', '2', '');
INSERT INTO `productcategory_` VALUES ('697', '696', 'Server Accessories', '3', '');
INSERT INTO `productcategory_` VALUES ('698', '370', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('699', '698', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('700', '699', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('701', '700', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('702', '371', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('703', '702', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('704', '703', 'Tape Drive', '3', '');
INSERT INTO `productcategory_` VALUES ('705', '704', 'Tape Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('706', '372', 'Power Supplies & Power Protection', '1', '');
INSERT INTO `productcategory_` VALUES ('707', '706', 'Power Supplies', '2', '');
INSERT INTO `productcategory_` VALUES ('708', '373', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('709', '708', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('710', '709', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('711', '710', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('712', '374', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('713', '712', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('714', '713', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('715', '714', 'Desktop Hard Drive', '4', '');
INSERT INTO `productcategory_` VALUES ('716', '375', 'Storage Devices', '1', '');
INSERT INTO `productcategory_` VALUES ('717', '716', 'Storage', '2', '');
INSERT INTO `productcategory_` VALUES ('718', '717', 'Internal Hard Drives', '3', '');
INSERT INTO `productcategory_` VALUES ('719', '718', 'Server Hard Drive', '4', '');

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `idProduct` int(11) NOT NULL AUTO_INCREMENT,
  `sku_code` varchar(255) DEFAULT NULL,
  `productName` longtext,
  `short_description` longtext,
  `description` longtext,
  `link` longtext,
  `price` varchar(255) DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `upc` varchar(255) DEFAULT NULL,
  `upc_dev` varchar(255) DEFAULT NULL,
  `condition` varchar(255) DEFAULT NULL,
  `image_link` longtext,
  `category` longtext,
  `weight` varchar(255) DEFAULT NULL,
  `meta_title` longtext,
  `meta_description` longtext,
  `product_stats` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `isMaster` bit(1) DEFAULT b'0',
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idProduct`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=445 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('411', '0-761345-06251-0', '0-761345-06251-0 - Antec High Current Gamer Pro HCP-850 850-Watt 100-240V ATX12V / EPS12V 80+ Platinum Power Supply', 'Antec 850-Watt 100-240V ATX12V / EPS12V 80+ Platinum Power Supply', '0-761345-06251-0 - Antec High Current Gamer Pro HCP-850 850-Watt 100-240V ATX12V / EPS12V 80+ Platinum Power Supply', '0-761345-06251-0-antec-power-supply.html', '478.93', ' ', 'Antec', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/-/0-761345-06251-0-0-761345-06251-0.jpg', 'Power Supplies & Power Protection/Power Supplies', '8', '0-761345-06251-0 - Antec High Current Gamer Pro HCP-850 850-Watt 100-240V ATX12V / EPS12V 80+ Platinum Power Supply', 'Shop 0-761345-06251-0 - Antec High Current Gamer Pro HCP-850 850-Watt 100-240V ATX12V / EPS12V 80+ Platinum Power Supply. Fast, free Shipping & easy return options are available!', 'Y', '', '');
INSERT INTO `products` VALUES ('412', '0000251P', '0000251P - Dell 6.4GB 5400RPM ATA-66 512KB Cache 3.5-inch Hard Drive', 'Dell 6.4GB 5400RPM ATA-66 512KB Cache 3.5-inch Hard Drive', '0000251P - Dell 6.4GB 5400RPM ATA-66 512KB Cache 3.5-inch Hard Drive', '0000251p-dell-desktop-hard-drive.html', '180', '125', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0000251p-0000251p.jpg', 'Storage Devices/Storage/Internal Hard Drives/Desktop Hard Drive', '3', '0000251P - Dell 6.4GB 5400RPM ATA-66 512KB Cache 3.5-inch Hard Drive', 'Buy online 0000251P - Dell 6.4GB 5400RPM ATA-66 512KB Cache 3.5-inch Hard Drive. We offer the best prices, fast shipping and top-rated customer service!', 'Y', '', '');
INSERT INTO `products` VALUES ('413', '000030YM', '000030YM - Dell Quantum Fireball Plus 10GB 5400RPM IDE 3.5-inch Hard Drive', 'Dell Quantum Fireball Plus 10GB 5400RPM IDE 3.5-inch Hard Drive', '000030YM - Dell Quantum Fireball Plus 10GB 5400RPM IDE 3.5-inch Hard Drive', '000030ym-dell-desktop-hard-drive.html', '178.54', '119', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/000030ym-000030ym.jpg', 'Storage Devices/Storage/Internal Hard Drives/Desktop Hard Drive', '3', '000030YM - Dell Quantum Fireball Plus 10GB 5400RPM IDE 3.5-inch Hard Drive', 'Buy Dell Quantum Fireball Plus 10GB 5400RPM IDE 3.5-inch Hard Drive. Hard Disk Direct offers the best prices, fast shipping and top-rated customer service!', 'Y', '', '');
INSERT INTO `products` VALUES ('414', '0000311C', '0000311C - Dell 12/24GB SCSI 4mm Tape Drive', 'Dell 12/24GB SCSI 4mm Tape Drive', '0000311C - Dell 12/24GB SCSI 4mm Tape Drive', '0000311c-dell-12-24gb-scsi-4mm-tape-drive.html', '135.46', '60', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0000311c.jpg', 'Storage Devices/Storage/Tape Drive/Tape Drive', '3', '0000311C - Dell 12/24GB SCSI 4mm Tape Drive', 'Purchase 0000311C - Dell 12/24GB SCSI 4mm Tape Drive. Fast, free Shipping & easy return options are available!', 'Y', '', '');
INSERT INTO `products` VALUES ('415', '0000726C', '0000726C - Dell 330-Watts Power Supply for PowerEdge 6400', 'Dell 330-Watts Power Supply for PowerEdge 6400', '0000726C - Dell 330-Watts Power Supply for PowerEdge 6400', '0000726c-dell-330-watts-power-supply-for-poweredge-6400.html', '204.55', '125', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0000726c.jpg', 'Power Supplies & Power Protection/Power Supplies', '8', '0000726C - Dell 330-Watts Power Supply for PowerEdge 6400', 'Purchase 0000726C - Dell 330-Watts Power Supply for PowerEdge 6400. We offer the best prices, fast shipping and top-rated customer service!', 'Y', '', '');
INSERT INTO `products` VALUES ('416', '0000852R', '0000852R - Dell / Seagate 4.3GB 5400RPM IDE / ATA-66 256KB Cache 3.5-inch Hard Drive', 'Dell / Seagate 4.3GB 5400RPM IDE / ATA-66 256KB Cache 3.5-inch Hard Drive', '0000852R - Dell / Seagate 4.3GB 5400RPM IDE / ATA-66 256KB Cache 3.5-inch Hard Drive', '0000852r-dell-desktop-hard-drive.html', '203.42', '125', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0000852r.jpg', 'Storage Devices/Storage/Internal Hard Drives/Desktop Hard Drive', '3', '0000852R - Dell / Seagate 4.3GB 5400RPM IDE / ATA-66 256KB Cache 3.5-inch Hard Drive for $214.13 by Seagate', 'Buy Dell / Seagate 4.3GB 5400RPM IDE / ATA-66 256KB Cache 3.5-inch Hard Drive. Fast, free Shipping & easy return options are available. Buy Now!', 'Y', '', '');
INSERT INTO `products` VALUES ('417', '00008792-000', '00008792-000 - Dell AIO Primary Gray Hard Drive Caddy 00008792-000 Inspiron 2305', 'Dell AIO Primary Gray Hard Drive Caddy 00008792-000 Inspiron 2305', '00008792-000 - Dell AIO Primary Gray Hard Drive Caddy 00008792-000 Inspiron 2305', '00008792-000-dell-hard-drive-caddy.html', '55.93', '15', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/00008792-000.jpg', 'Storage Devices/Storage/SSD & HDD Accessories', '3', '00008792-000 - Dell AIO Primary Gray Hard Drive Caddy 00008792-000 Inspiron 2305', 'Buy online 00008792-000 - Dell AIO Primary Gray Hard Drive Caddy 00008792-000 Inspiron 2305. Harddiskdirect.com offers the best prices, fast shipping and top-notch customer support!', 'Y', '', '');
INSERT INTO `products` VALUES ('418', '00009PVR', '00009PVR - Dell 20GB 7200RPM IDE / ATA 3.5-inch Hard Drive', 'Dell 20GB 7200RPM IDE / ATA 3.5-inch Hard Drive', '00009PVR - Dell 20GB 7200RPM IDE / ATA 3.5-inch Hard Drive', '00009pvr-dell-20gb-7200rpm-ide-ata-3-5-inch-hard-drive.html', '81.13', '39', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/00009pvr.jpg', 'Storage Devices/Storage/Internal Hard Drives/Desktop Hard Drive', '3', '00009PVR - Dell 20GB 7200RPM IDE / ATA 3.5-inch Hard Drive', 'Shop 00009PVR - Dell 20GB 7200RPM IDE / ATA 3.5-inch Hard Drive. Fast, free Shipping & easy return options are available!', 'Y', '', '');
INSERT INTO `products` VALUES ('419', '000130YM', '000130YM - Dell 20GB 7200RPM ATA-66 2MB Cache 3.5-inch Hard Drive', 'Dell 20GB 7200RPM ATA-66 2MB Cache 3.5-inch Hard Drive', '000130YM - Dell 20GB 7200RPM ATA-66 2MB Cache 3.5-inch Hard Drive', '000130ym-dell-desktop-hard-drive.html', '70.31', '35', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/000130ym-000130ym.jpg', 'Storage Devices/Storage/Internal Hard Drives/Desktop Hard Drive', '3', '000130YM - Dell 20GB 7200RPM ATA-66 2MB Cache 3.5-inch Hard Drive', 'Get the best price on Dell 20GB 7200RPM ATA-66 2MB Cache 3.5-inch Hard Drive. Fast, free Shipping & easy return options are available. Buy Now!', 'Y', '', '');
INSERT INTO `products` VALUES ('420', '0001490R', '0001490R - Dell System Board (Motherboard) for Poweredge 6450 (Refurbished / Grade-A)', 'Dell System Board (Motherboard) for Poweredge 6450 (Refurbished / Grade-A)', '0001490R - Dell System Board (Motherboard) for Poweredge 6450 (Refurbished / Grade-A)', '0001490r-dell-server-motherboard.html', '474.35', '99', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0001490r.jpg', 'Motherboards/Server Motherboards', '5', '0001490R - Dell System Board (Motherboard) for Poweredge 6450 (Refurbished / Grade-A)', 'Purchase online 0001490R - Dell System Board (Motherboard) for Poweredge 6450 (Refurbished / Grade-A). Fast, free Shipping & easy return options are available. Buy Now!', 'Y', '', '');
INSERT INTO `products` VALUES ('421', '0001631T', '0001631T - Dell PERC 2dc PCI SCSI RAID Controller', 'Dell PERC 2dc PCI SCSI RAID Controller', '0001631T - Dell PERC 2dc PCI SCSI RAID Controller', '0001631t-dell-perc-2dc-pci-scsi-raid-controller.html', '326.92', '245', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0001631t-0001631t.jpg', 'Storage Devices/Storage/RAID Controllers/SCSI Controller', '2', '0001631T - Dell PERC 2dc PCI SCSI RAID Controller', 'Buy 0001631T - Dell PERC 2dc PCI SCSI RAID Controller. Fast, free Shipping & easy return options are available!', 'Y', '', '');
INSERT INTO `products` VALUES ('422', '0001703D', '0001703D - Dell Latitude PPI CPI CPU System Board (Motherboard) (Refurbished / Grade-A)', 'Dell Latitude PPI CPI CPU System Board (Motherboard) (Refurbished / Grade-A)', '0001703D - Dell Latitude PPI CPI CPU System Board (Motherboard) (Refurbished / Grade-A)', '0001703d-dell-laptop-motherboard.html', '79.16', '45', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0001703d.jpg', 'Motherboards/Laptop Motherboards', '5', '0001703D - Dell Latitude PPI CPI CPU System Board (Motherboard) (Refurbished / Grade-A)', 'Purchase 0001703D - Dell Latitude PPI CPI CPU System Board (Motherboard) (Refurbished / Grade-A). We offer the best prices, fast shipping and top-rated customer service!', 'Y', '', '');
INSERT INTO `products` VALUES ('423', '0001757C', '0001757C - Dell 2.1GB 5400RPM ATA-33 3.5-inch Hard Drive', 'Dell 2.1GB 5400RPM ATA-33 3.5-inch Hard Drive', '0001757C - Dell 2.1GB 5400RPM ATA-33 3.5-inch Hard Drive', '0001757c-dell-2-1gb-5400rpm-ata-33-3-5-inch-hard-drive.html', '168.92', '115', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0001757c-0001757c.jpg', 'Storage Devices/Storage/Internal Hard Drives/Desktop Hard Drive', '3', '0001757C - Dell 2.1GB 5400RPM ATA-33 3.5-inch Hard Drive', 'Purchase online Dell 2.1GB 5400RPM ATA-33 3.5-inch Hard Drive. Hard Disk Direct offers the best prices, fast shipping and top-rated customer service!', 'Y', '', '');
INSERT INTO `products` VALUES ('424', '0001CT', '0001CT - Dell Heat Sink for Inspiron 5323 Laptop System', 'Dell Heat Sink for Inspiron 5323 Laptop System', '0001CT - Dell Heat Sink for Inspiron 5323 Laptop System', '0001ct-dell-laptop-heat-sink-inspiron-5323.html', '59.54', '10', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0001ct.jpg', 'Accessories & Batteries/Cooling Fans & Heat Sink/Heatsink', '3', '0001CT - Dell Heat Sink for Inspiron 5323 Laptop System', 'Buy online 0001CT - Dell Heat Sink for Inspiron 5323 Laptop System. Fast, free Shipping & easy return options are available!', 'Y', '', '');
INSERT INTO `products` VALUES ('425', '0001X', '0001X - Dell XPS LED Silver Back Cover', 'Dell XPS LED Silver Back Cover', '0001X - Dell XPS LED Silver Back Cover', '0001x-dell-xps-led-silver-back-cover.html', '82.86', '13.05', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0001x.jpg', 'PC, Servers & Software/Laptops/Laptop Accessories/Laptop Covers', '5', '0001X - Dell XPS LED Silver Back Cover', 'Buy online 0001X - Dell XPS LED Silver Back Cover. We offer the best prices, fast shipping and top-rated customer service!', 'Y', '', '');
INSERT INTO `products` VALUES ('426', '0002280R', '0002280R - QLogic 1GB PCI Fibre Channel Host Bus Adapter', 'QLogic 1GB PCI Fibre Channel Host Bus Adapter', '0002280R - QLogic 1GB PCI Fibre Channel Host Bus Adapter', '0002280r-qlogic-1gb-pci-fibre-channel-host-bus-adapter.html', '210.15', '150', 'QLogic', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0002280r.jpg', 'Storage Devices/Storage/RAID Controllers/Fiber Channel Controller', '2', '0002280R - QLogic 1GB PCI Fibre Channel Host Bus Adapter', 'Get best price on 0002280R - QLogic 1GB PCI Fibre Channel Host Bus Adapter. Fast, free Shipping & easy return options are available!', 'Y', '', '');
INSERT INTO `products` VALUES ('427', '000237JN', '000237JN - Dell 6.4GB 5400RPM ATA/IDE 3.5-inch Hard Drive', 'Dell 6.4GB 5400RPM ATA/IDE 3.5-inch Hard Drive', '000237JN - Dell 6.4GB 5400RPM ATA/IDE 3.5-inch Hard Drive', '000237jn-dell-6-4gb-5400rpm-ata-ide-3-5-inch-hard-drive.html', '180', '125', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/000237jn-000237jn.jpg', 'Storage Devices/Storage/Internal Hard Drives/Desktop Hard Drive', '3', '000237JN - Dell 6.4GB 5400RPM ATA/IDE 3.5-inch Hard Drive', 'Buy Dell 6.4GB 5400RPM ATA/IDE 3.5-inch Hard Drive. Harddiskdirect.com offers the best prices, fast shipping and top-notch customer support!', 'Y', '', '');
INSERT INTO `products` VALUES ('428', '0003151P', '0003151P - Dell 10.2GB 7200RPM ATA 512KB Cache 3.5-inch Hard Drive', 'Dell 10.2GB 7200RPM ATA 512KB Cache 3.5-inch Hard Drive', 'Dell 10.2GB 7200RPM ATA 512KB Cache 3.5-inch Hard Drive', '0003151p-dell-desktop-hard-drive.html', '186.66', '119', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0003151p.jpg', 'Storage Devices/Storage/Internal Hard Drives/Desktop Hard Drive', '3', '0003151P - Dell 10.2GB 7200RPM ATA 512KB Cache 3.5-inch Hard Drive', 'Buy Dell 10.2GB 7200RPM ATA 512KB Cache 3.5-inch Hard Drive. Hard Disk Direct offers the best prices, fast shipping and top-rated customer service!', 'Y', '', '');
INSERT INTO `products` VALUES ('429', '0003160U', '0003160U - Dell 9.1GB 10000RPM Ultra-160 SCSI 80-Pin 3.5-inch Hard Drive', 'Dell 9.1GB 10000RPM Ultra-160 SCSI 80-Pin 3.5-inch Hard Drive', 'Dell 9.1GB 10000RPM Ultra-160 SCSI 80-Pin 3.5-inch Hard Drive', '0003160u-dell-server-hard-drive.html', '309.61', '179', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0003160u.jpg', 'Storage Devices/Storage/Internal Hard Drives/Server Hard Drive', '3', '0003160U - Dell 9.1GB 10000RPM Ultra-160 SCSI 80-Pin 3.5-inch Hard Drive', 'Get the best price on 0003160U - Dell 9.1GB 10000RPM Ultra-160 SCSI 80-Pin 3.5-inch Hard Drive. Fast, free Shipping & easy return options are available. Buy Now!', 'Y', '', '');
INSERT INTO `products` VALUES ('430', '00032FCD', '00032FCD - Dell System Board (Motherboard) for Precision 610 (Refurbished / Grade-A)', 'Dell System Board (Motherboard) for Precision 610 (Refurbished / Grade-A)', '00032FCD - Dell System Board (Motherboard) for Precision 610 (Refurbished / Grade-A)', '00032fcd-dell-server-motherboard.html', '136.65', '95', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/00032fcd.jpg', 'Motherboards/Server Motherboards', '5', '00032FCD - Dell System Board (Motherboard) for Precision 610 (Refurbished / Grade-A)', 'Buy online 00032FCD - Dell System Board (Motherboard) for Precision 610 (Refurbished / Grade-A). Hard Disk Direct offers the best prices, fast shipping and top-rated customer service!', 'Y', '', '');
INSERT INTO `products` VALUES ('431', '0003442U', '0003442U - IBM 4.86GB IDE / ATA 2.5-inch Hard Drive', 'IBM 4.86GB IDE / ATA 2.5-inch Hard Drive', '0003442U - IBM 4.86GB IDE / ATA 2.5-inch Hard Drive', '0003442u-ibm-4-86gb-ide-ata-2-5-inch-hard-drive.html', '226.61', '149', 'IBM', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0003442u.jpg', 'Storage Devices/Storage/Internal Hard Drives/Laptop Hard Drive', '3', ' ', 'Buy Online IBM 4.86GB IDE / ATA 2.5-inch Hard Drive. Hard Disk Direct offers the best prices, fast shipping and top-rated customer service!', 'Y', '', '');
INSERT INTO `products` VALUES ('432', '0003512D', '0003512D - Dell PERC 2 PCI Express 16MB Cache RAID Controller', 'Dell PERC 2 PCI Express 16MB Cache RAID Controller', '0003512D - Dell PERC 2 PCI Express 16MB Cache RAID Controller', '0003512d-dell-perc-2-pci-express-16mb-cache-raid-controller.html', '131.94', '85', 'Dell', ' ', ' ', 'Refurbished', ' ', 'Storage Devices/Storage/RAID Controllers/Miscellaneous', '2', '0003512D - Dell PERC 2 PCI Express 16MB Cache RAID Controller', 'Buy 0003512D - Dell PERC 2 PCI Express 16MB Cache RAID Controller. We offer the best prices, fast shipping and top-rated customer service!', 'Y', '', '');
INSERT INTO `products` VALUES ('433', '0003570T', '0003570T - Dell 13.6GB 7200RPM ATA / IDE 3.5-inch Hard Drive', 'Dell 13.6GB 7200RPM ATA / IDE 3.5-inch Hard Drive', 'Dell 13.6GB 7200RPM ATA / IDE 3.5-inch Hard Drive', '0003570t-dell-13-6gb-7200rpm-ata-ide-3-5-inch-hard-drive.html', '224.51', '149', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0003570t.jpg', 'Storage Devices/Storage/Internal Hard Drives/Desktop Hard Drive', '3', '0003570T - Dell 13.6GB 7200RPM ATA / IDE 3.5-inch Hard Drive', 'Get the best price on Dell 13.6GB 7200RPM ATA / IDE 3.5-inch Hard Drive. Hard Disk Direct offers the best prices, fast shipping and top-rated customer service!', 'Y', '', '');
INSERT INTO `products` VALUES ('434', '0004389D', '0004389D - Dell PERC 2dc PCI SCSI RAID Controller', 'Dell PERC 2dc PCI SCSI RAID Controller', '0004389D - Dell PERC 2dc PCI SCSI RAID Controller', '0004389d-dell-perc-2dc-pci-scsi-raid-controller.html', '266.23', '195', 'Dell', ' ', ' ', 'Refurbished', ' ', 'Storage Devices/Storage/RAID Controllers/Miscellaneous', '2', '0004389D - Dell PERC 2dc PCI SCSI RAID Controller', 'Purchase 0004389D - Dell PERC 2dc PCI SCSI RAID Controller. We offer the best prices, fast shipping and top-rated customer service!', 'Y', '', '');
INSERT INTO `products` VALUES ('435', '0004442U', '0004442U - Dell 6GB 4200RPM ATA / IDE 2.5-inch Hard Drive', 'Dell 6GB 4200RPM ATA / IDE 2.5-inch Hard Drive', 'Dell 6GB 4200RPM ATA / IDE 2.5-inch Hard Drive', '0004442u-dell-6gb-4200rpm-ata-ide-2-5-inch-hard-drive.html', '178.48', '68', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0004442u.jpg', 'Storage Devices/Storage/Internal Hard Drives/Laptop Hard Drive', '3', '0004442U - Dell 6GB 4200RPM ATA / IDE 2.5-inch Hard Drive', 'Purchase online Dell 6GB 4200RPM ATA / IDE 2.5-inch Hard Drive. Harddiskdirect.com offers the best prices, fast shipping and top-notch customer support!', 'Y', '', '');
INSERT INTO `products` VALUES ('436', '0004479R', '0004479R - Dell Ultra-320 SCSI PCI Express Controller', 'Dell Ultra-320 SCSI PCI Express Controller', '0004479R - Dell Ultra-320 SCSI PCI Express Controller', '0004479r-dell-ultra-320-scsi-pci-express-controller.html', '206.67', '145', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0004479r-0004479r.jpg', 'Storage Devices/Storage/RAID Controllers/SCSI Controller', '2', '0004479R - Dell Ultra-320 SCSI PCI Express Controller', 'Buy online 0004479R - Dell Ultra-320 SCSI PCI Express Controller. Fast, free Shipping & easy return options are available!', 'Y', '', '');
INSERT INTO `products` VALUES ('437', '00046JVW', '00046JVW - Dell DDS-4 Tape Drive - 20GB (Native)/40GB (Compressed) - SCSIInternal', 'Dell DDS-4 Tape Drive - 20GB (Native)/40GB (Compressed) - SCSIInternal', '00046JVW - Dell DDS-4 Tape Drive - 20GB (Native)/40GB (Compressed) - SCSIInternal', '00046jvw-dell-tape-drive.html', '151.21', '75', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/00046jvw-000000002265.jpg', 'Storage Devices/Storage/Tape Drive/Tape Drive', '3', '00046JVW - Dell DDS-4 Tape Drive - 20GB (Native)/40GB (Compressed) - SCSIInternal', 'Purchase 00046JVW - Dell DDS-4 Tape Drive - 20GB (Native)/40GB (Compressed) - SCSIInternal. Harddiskdirect.com offers the best prices, fast shipping and top-notch customer support!', 'Y', '', '');
INSERT INTO `products` VALUES ('438', '000481GK', '000481GK - Dell 204GB 7200RPM IDE/ATA 3.5-inch Hard Drive', 'Dell 204GB 7200RPM IDE/ATA 3.5-inch Hard Drive', '000481GK - Dell 204GB 7200RPM IDE/ATA 3.5-inch Hard Drive', '000481gk-dell-204gb-7200rpm-ide-ata-3-5-inch-hard-drive.html', '136.99', '90', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/000481gk-000481gk.jpg', 'Storage Devices/Storage/Internal Hard Drives/Desktop Hard Drive', '3', '000481GK - Dell 204GB 7200RPM IDE/ATA 3.5-inch Hard Drive', 'Get best price on 000481GK - Dell 204GB 7200RPM IDE/ATA 3.5-inch Hard Drive. Fast, free Shipping & easy return options are available!', 'Y', '', '');
INSERT INTO `products` VALUES ('439', '0005074T', '0005074T - Dell 6GB 4200RPM ATA / IDE 2.5-inch Hard Drive', 'Dell 6GB 4200RPM ATA / IDE 2.5-inch Hard Drive', 'Dell 6GB 4200RPM ATA / IDE 2.5-inch Hard Drive', '0005074t-dell-6gb-4200rpm-ata-ide-2-5-inch-hard-drive.html', '118.66', '59', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0005074t.jpg', 'Storage Devices/Storage/Internal Hard Drives/Laptop Hard Drive', '3', '0005074T - Dell 6GB 4200RPM ATA / IDE 2.5-inch Hard Drive', 'Buy 0005074T - Dell 6GB 4200RPM ATA / IDE 2.5-inch Hard Drive. We offer the best prices, fast shipping and top-rated customer service!', 'Y', '', '');
INSERT INTO `products` VALUES ('440', '000579CJ', '000579CJ - Dell System Board (Motherboard) for PowerEdge 350 (Refurbished / Grade-A)', 'Dell System Board (Motherboard) for PowerEdge 350 (Refurbished / Grade-A)', '000579CJ - Dell System Board (Motherboard) for PowerEdge 350 (Refurbished / Grade-A)', '000579cj-dell-server-motherboard.html', '136.65', '95', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/000579cj.jpg', 'Motherboards/Server Motherboards', '5', '000579CJ - Dell System Board (Motherboard) for PowerEdge 350 (Refurbished / Grade-A)', 'Buy 000579CJ - Dell System Board (Motherboard) for PowerEdge 350 (Refurbished / Grade-A). Harddiskdirect.com offers the best prices, fast shipping and top-notch customer support!', 'Y', '', '');
INSERT INTO `products` VALUES ('441', '0007390p', '0007390P - Dell 320-Watts Power Supply for PowerEdge 6300 / 6400', 'Dell 320-Watts Power Supply for PowerEdge 6300 / 6400', '0007390P - Dell 320-Watts Power Supply for PowerEdge 6300 / 6400', '0007390p-dell-320-watts-power-supply-for-poweredge-6300-6400.html', '479.17', '335', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0007390p.jpg', 'Power Supplies & Power Protection/Power Supplies', '8', '0007390P - Dell 320-Watts Power Supply for PowerEdge 6300 / 6400', 'Buy online 0007390P - Dell 320-Watts Power Supply for PowerEdge 6300 / 6400. We offer the best prices, fast shipping and top-rated customer service!', 'Y', '', '');
INSERT INTO `products` VALUES ('442', '0007F134', '0007F134 - Dell PERC3/DI SCSI RAID Controller Card with 128MB Cache for PowerEdge 1650', 'Dell PERC3/DI SCSI RAID Controller Card with 128MB Cache for PowerEdge 1650', '0007F134 - Dell PERC3/DI SCSI RAID Controller Card with 128MB Cache for PowerEdge 1650', '0007f134-dell-server-accessories.html', '68.85', '20', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0007f134-0007f134.jpg', 'PC, Servers & Software/Servers/Server Accessories', '1', '0007F134 - Dell PERC3/DI SCSI RAID Controller Card with 128MB Cache for PowerEdge 1650', 'Purchase 0007F134 - Dell PERC3/DI SCSI RAID Controller Card with 128MB Cache for PowerEdge 1650. We offer the best prices, fast shipping and top-rated customer service!', 'Y', '', '');
INSERT INTO `products` VALUES ('443', '0008038C', '0008038C - Dell 4.3GB 5400RPM ATA-33 512KB Cache 3.5-inch Hard Drive', 'Dell 4.3GB 5400RPM ATA-33 512KB Cache 3.5-inch Hard Drive', '0008038C - Dell 4.3GB 5400RPM ATA-33 512KB Cache 3.5-inch Hard Drive', '0008038c-dell-desktop-hard-drive.html', '168.92', '115', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0008038c-0008038c.jpg', 'Storage Devices/Storage/Internal Hard Drives/Desktop Hard Drive', '3', '0008038C - Dell 4.3GB 5400RPM ATA-33 512KB Cache 3.5-inch Hard Drive', 'Buy Online Dell 4.3GB 5400RPM ATA-33 512KB Cache 3.5-inch Hard Drive. Hard Disk Direct offers the best prices, fast shipping and top-rated customer service!', 'Y', '', '');
INSERT INTO `products` VALUES ('444', '0008056P', '0008056P - Dell 36GB 10000RPM Ultra-320 SCSI 68-Pin 3.5-inch Hard Drive', 'Dell 36GB 10000RPM Ultra-320 SCSI 68-Pin 3.5-inch Hard Drive', 'Dell 36GB 10000RPM Ultra-320 SCSI 68-Pin 3.5-inch Hard Drive', '0008056p-dell-server-hard-drive.html', '290.61', '214', 'Dell', ' ', ' ', 'Refurbished', 'https://harddiskdirect.com/media/catalog/product/0/0/0008056p.jpg', 'Storage Devices/Storage/Internal Hard Drives/Server Hard Drive', '3', '0008056P - Dell 36GB 10000RPM Ultra-320 SCSI 68-Pin 3.5-inch Hard Drive', 'Shop 0008056P - Dell 36GB 10000RPM Ultra-320 SCSI 68-Pin 3.5-inch Hard Drive. We offer the best prices, fast shipping and top-rated customer service!', 'Y', '', '');

-- ----------------------------
-- Table structure for `product_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `product_attribute`;
CREATE TABLE `product_attribute` (
  `idProductAttribute` int(11) NOT NULL AUTO_INCREMENT,
  `idProduct` int(11) DEFAULT NULL,
  `idAttribute` int(11) DEFAULT NULL,
  `attribute_value` longtext,
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idProductAttribute`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product_attribute
-- ----------------------------
INSERT INTO `product_attribute` VALUES ('1', '433', '1', 'Predator\r\n', '');
INSERT INTO `product_attribute` VALUES ('2', '433', '2', '4\r\n', '');
INSERT INTO `product_attribute` VALUES ('3', '444', '2', 'asd', '');

-- ----------------------------
-- Table structure for `product_category`
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProduct` int(11) NOT NULL,
  `level_one` int(11) DEFAULT NULL,
  `level_two` int(11) DEFAULT NULL,
  `level_three` int(11) DEFAULT NULL,
  `level_four` int(11) DEFAULT NULL,
  `level_five` int(11) DEFAULT NULL,
  `level_six` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_code` (`idProduct`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12635485 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('12635451', '411', '38', '39', '0', '0', '0', '0');
INSERT INTO `product_category` VALUES ('12635452', '412', '40', '41', '42', '43', '0', '0');
INSERT INTO `product_category` VALUES ('12635453', '413', '40', '41', '42', '43', '0', '0');
INSERT INTO `product_category` VALUES ('12635454', '414', '40', '41', '44', '64', '0', '0');
INSERT INTO `product_category` VALUES ('12635455', '415', '38', '39', '0', '0', '0', '0');
INSERT INTO `product_category` VALUES ('12635456', '416', '40', '41', '42', '43', '0', '0');
INSERT INTO `product_category` VALUES ('12635457', '417', '40', '41', '45', '0', '0', '0');
INSERT INTO `product_category` VALUES ('12635458', '418', '40', '41', '42', '43', '0', '0');
INSERT INTO `product_category` VALUES ('12635459', '419', '40', '41', '42', '43', '0', '0');
INSERT INTO `product_category` VALUES ('12635460', '420', '46', '47', '0', '0', '0', '0');
INSERT INTO `product_category` VALUES ('12635461', '421', '40', '41', '48', '49', '0', '0');
INSERT INTO `product_category` VALUES ('12635462', '422', '46', '50', '0', '0', '0', '0');
INSERT INTO `product_category` VALUES ('12635463', '423', '40', '41', '42', '43', '0', '0');
INSERT INTO `product_category` VALUES ('12635464', '424', '51', '52', '53', '0', '0', '0');
INSERT INTO `product_category` VALUES ('12635465', '425', '54', '55', '56', '57', '0', '0');
INSERT INTO `product_category` VALUES ('12635466', '426', '40', '41', '48', '58', '0', '0');
INSERT INTO `product_category` VALUES ('12635467', '427', '40', '41', '42', '43', '0', '0');
INSERT INTO `product_category` VALUES ('12635468', '428', '40', '41', '42', '43', '0', '0');
INSERT INTO `product_category` VALUES ('12635469', '429', '40', '41', '42', '59', '0', '0');
INSERT INTO `product_category` VALUES ('12635470', '430', '46', '47', '0', '0', '0', '0');
INSERT INTO `product_category` VALUES ('12635471', '431', '40', '41', '42', '60', '0', '0');
INSERT INTO `product_category` VALUES ('12635472', '432', '40', '41', '48', '61', '0', '0');
INSERT INTO `product_category` VALUES ('12635473', '433', '40', '41', '42', '43', '0', '0');
INSERT INTO `product_category` VALUES ('12635474', '434', '40', '41', '48', '61', '0', '0');
INSERT INTO `product_category` VALUES ('12635475', '435', '40', '41', '42', '60', '0', '0');
INSERT INTO `product_category` VALUES ('12635476', '436', '40', '41', '48', '49', '0', '0');
INSERT INTO `product_category` VALUES ('12635477', '437', '40', '41', '44', '64', '0', '0');
INSERT INTO `product_category` VALUES ('12635478', '438', '40', '41', '42', '43', '0', '0');
INSERT INTO `product_category` VALUES ('12635479', '439', '40', '41', '42', '60', '0', '0');
INSERT INTO `product_category` VALUES ('12635480', '440', '46', '47', '0', '0', '0', '0');
INSERT INTO `product_category` VALUES ('12635481', '441', '38', '39', '0', '0', '0', '0');
INSERT INTO `product_category` VALUES ('12635482', '442', '54', '62', '63', '0', '0', '0');
INSERT INTO `product_category` VALUES ('12635483', '443', '40', '41', '42', '43', '0', '0');
INSERT INTO `product_category` VALUES ('12635484', '444', '40', '41', '42', '59', '0', '0');

-- ----------------------------
-- Table structure for `product_custom_field`
-- ----------------------------
DROP TABLE IF EXISTS `product_custom_field`;
CREATE TABLE `product_custom_field` (
  `custom_field_serial` int(11) NOT NULL AUTO_INCREMENT,
  `idProduct` int(11) DEFAULT NULL,
  `custom_field_name` longtext,
  `custom_field_value` longtext,
  PRIMARY KEY (`custom_field_serial`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=37372 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_custom_field
-- ----------------------------
INSERT INTO `product_custom_field` VALUES ('37370', '333', 'Color', 'Red');
INSERT INTO `product_custom_field` VALUES ('37371', '333', 'Materail', 'New');

-- ----------------------------
-- Table structure for `product_filter_list`
-- ----------------------------
DROP TABLE IF EXISTS `product_filter_list`;
CREATE TABLE `product_filter_list` (
  `filter_code` int(11) NOT NULL AUTO_INCREMENT,
  `filter_list_code` int(11) NOT NULL,
  `filter_list_name` varchar(100) NOT NULL,
  `idProduct` int(11) NOT NULL,
  PRIMARY KEY (`filter_code`) USING BTREE,
  KEY `filter_list_code` (`filter_list_code`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_filter_list
-- ----------------------------
INSERT INTO `product_filter_list` VALUES ('1', '1', 'BLADE FIRE\r\n', '333');
INSERT INTO `product_filter_list` VALUES ('2', '1', 'Blade', '333');

-- ----------------------------
-- Table structure for `product_hierarchy_five_`
-- ----------------------------
DROP TABLE IF EXISTS `product_hierarchy_five_`;
CREATE TABLE `product_hierarchy_five_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `level_id_four` int(11) DEFAULT NULL,
  `image` varchar(250) NOT NULL,
  `sorting` varchar(3) NOT NULL,
  `hierarchy_url` varchar(255) DEFAULT NULL,
  `featuredtext` longtext,
  `description` longtext NOT NULL,
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of product_hierarchy_five_
-- ----------------------------
INSERT INTO `product_hierarchy_five_` VALUES ('305', 'Desktop Hard Drive', '303', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_five_` VALUES ('306', 'Fiber Channel Controller', '304', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_five_` VALUES ('307', 'Laptop Covers', '304', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_five_` VALUES ('308', 'Laptop Hard Drive', '311', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_five_` VALUES ('309', 'Miscellaneous', '311', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_five_` VALUES ('310', 'SCSI Controller', '312', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_five_` VALUES ('311', 'Server Hard Drive', '312', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_five_` VALUES ('312', 'Tape Drived', '312', '', '', null, null, '', '');

-- ----------------------------
-- Table structure for `product_hierarchy_four_`
-- ----------------------------
DROP TABLE IF EXISTS `product_hierarchy_four_`;
CREATE TABLE `product_hierarchy_four_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `level_id_three` int(11) DEFAULT NULL,
  `image` varchar(250) NOT NULL,
  `sorting` varchar(3) NOT NULL,
  `hierarchy_url` varchar(255) DEFAULT NULL,
  `featuredtext` longtext,
  `description` longtext NOT NULL,
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of product_hierarchy_four_
-- ----------------------------
INSERT INTO `product_hierarchy_four_` VALUES ('305', 'Desktop Hard Drive', '304', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_four_` VALUES ('306', 'Fiber Channel Controller', '298', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_four_` VALUES ('307', 'Laptop Covers', '298', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_four_` VALUES ('308', 'Laptop Hard Drive', '298', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_four_` VALUES ('309', 'Miscellaneous', '304', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_four_` VALUES ('310', 'SCSI Controller', '304', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_four_` VALUES ('311', 'Server Hard Drive', '304', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_four_` VALUES ('312', 'Tape Drive', '304', '', '', null, null, '', '');

-- ----------------------------
-- Table structure for `product_hierarchy_one_`
-- ----------------------------
DROP TABLE IF EXISTS `product_hierarchy_one_`;
CREATE TABLE `product_hierarchy_one_` (
  `idCategoryOne` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(250) NOT NULL,
  `sorting` int(3) NOT NULL,
  `hierarchy_url` varchar(255) DEFAULT NULL,
  `featuredtext` varchar(255) DEFAULT NULL,
  `description` varchar(6000) NOT NULL,
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idCategoryOne`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of product_hierarchy_one_
-- ----------------------------
INSERT INTO `product_hierarchy_one_` VALUES ('42', 'Accessories & Batteries', '', '1', 'accessories_batteries', null, '', '');
INSERT INTO `product_hierarchy_one_` VALUES ('43', 'Motherboards', '', '2', 'motherboards', null, '', '');
INSERT INTO `product_hierarchy_one_` VALUES ('44', 'PC, Servers & Software', '', '3', 'pc_servers_software', null, '', '');
INSERT INTO `product_hierarchy_one_` VALUES ('45', 'Power Supplies & Power Protection', '', '4', 'power_supplies', null, '', '');
INSERT INTO `product_hierarchy_one_` VALUES ('46', 'Storage Devices', '', '5', 'storage_devices', null, '', '');

-- ----------------------------
-- Table structure for `product_hierarchy_six_`
-- ----------------------------
DROP TABLE IF EXISTS `product_hierarchy_six_`;
CREATE TABLE `product_hierarchy_six_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `level_id_five` int(11) DEFAULT NULL,
  `image` varchar(250) NOT NULL,
  `sorting` varchar(3) NOT NULL,
  `hierarchy_url` varchar(255) DEFAULT NULL,
  `featuredtext` longtext,
  `description` longtext NOT NULL,
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of product_hierarchy_six_
-- ----------------------------

-- ----------------------------
-- Table structure for `product_hierarchy_three_`
-- ----------------------------
DROP TABLE IF EXISTS `product_hierarchy_three_`;
CREATE TABLE `product_hierarchy_three_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `level_id_two` int(11) DEFAULT NULL,
  `image` varchar(250) NOT NULL,
  `sorting` varchar(3) NOT NULL,
  `hierarchy_url` varchar(255) DEFAULT NULL,
  `featuredtext` longtext,
  `description` longtext NOT NULL,
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of product_hierarchy_three_
-- ----------------------------
INSERT INTO `product_hierarchy_three_` VALUES ('298', 'Heatsink', '152', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_three_` VALUES ('299', 'Internal Hard Drives', '153', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_three_` VALUES ('300', 'Laptop Accessories', '154', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_three_` VALUES ('301', 'RAID Controllers', '155', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_three_` VALUES ('302', 'Server Accessories', '156', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_three_` VALUES ('303', 'SSD & HDD Accessories', '158', '', '', null, null, '', '');
INSERT INTO `product_hierarchy_three_` VALUES ('304', 'Tape Drive', '158', '', '', null, null, '', '');

-- ----------------------------
-- Table structure for `product_hierarchy_two_`
-- ----------------------------
DROP TABLE IF EXISTS `product_hierarchy_two_`;
CREATE TABLE `product_hierarchy_two_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `level_id_one` int(11) DEFAULT NULL,
  `image` varchar(250) NOT NULL,
  `sorting` int(3) NOT NULL,
  `hierarchy_url` varchar(255) DEFAULT NULL,
  `featuredtext` varchar(255) DEFAULT NULL,
  `description` varchar(6000) NOT NULL,
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of product_hierarchy_two_
-- ----------------------------
INSERT INTO `product_hierarchy_two_` VALUES ('152', 'Cooling Fans & Heat Sink', '42', '', '0', null, null, '', '');
INSERT INTO `product_hierarchy_two_` VALUES ('153', 'Laptop Motherboards', '43', '', '0', null, null, '', '');
INSERT INTO `product_hierarchy_two_` VALUES ('154', 'Laptops', '43', '', '0', null, null, '', '');
INSERT INTO `product_hierarchy_two_` VALUES ('155', 'Power Supplies', '45', '', '0', null, null, '', '');
INSERT INTO `product_hierarchy_two_` VALUES ('156', 'Server Motherboards', '44', '', '0', null, null, '', '');
INSERT INTO `product_hierarchy_two_` VALUES ('157', 'Servers', '44', '', '0', null, null, '', '');
INSERT INTO `product_hierarchy_two_` VALUES ('158', 'Storage', '46', '', '0', null, null, '', '');

-- ----------------------------
-- Table structure for `product_tag`
-- ----------------------------
DROP TABLE IF EXISTS `product_tag`;
CREATE TABLE `product_tag` (
  `idTag` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(100) NOT NULL,
  `tag_url` varchar(100) NOT NULL,
  `isActive` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idTag`,`tag_name`,`tag_url`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2149 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of product_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `product_tag_relationship`
-- ----------------------------
DROP TABLE IF EXISTS `product_tag_relationship`;
CREATE TABLE `product_tag_relationship` (
  `idTagRelationship` int(11) NOT NULL AUTO_INCREMENT,
  `idTag` int(11) DEFAULT NULL,
  `idProduct` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTagRelationship`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45686 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of product_tag_relationship
-- ----------------------------

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
  PRIMARY KEY (`idUser`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'khawar', '1234', 'khawar', 'Data Entry', '1', 'E86FB262-75C7-7745-B2EE-14AE93028BDF', '');
INSERT INTO `users` VALUES ('461BFBAA-71E5-3B15-3D27-3E7ECD6FBE97', 'shehroz', '1234', 'Shehroz', 'Programmer', '1', '1AA4943C-B01F-61DF-A582-04A3E8150048', '');
INSERT INTO `users` VALUES ('9850BA8F-85C1-8BF4-F297-EB9B575FB6D1', 'Testing', 'RkrjUUHoL9Aq8lRMYQbrcobGee15tVieSOu3P5+y9dfbliqOy6CugwOyF5zy533T1Ev9BU63uAnrUlh5C7SruA==', 'Testing', 'Testing', '1', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', '');
INSERT INTO `users` VALUES ('BCDFB392-D7BB-E305-1A0D-A028A8A062A1', 'test', 'r2lkkO9WUeBflY1wmRKvSB0tnaFeAGq9Ew2MFU5k9yN/SvyJxYXvGx47HXwUE/17/7y4++5bKaNgPgoFmXYKwQ==', 'Test Test', 'test', '1', '5PJ0CBA5-G72F-4280-CA41-1F2933C5B90D', '');

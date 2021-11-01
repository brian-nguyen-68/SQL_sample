/*
      _
                        _ooOoo_
                       o8888888o
                       88" . "88
                       (| -_- |)
                       O\  =  /O
                    ____/`---'\____
                  .'  \\|     |//  `.
                 /  \\|||  :  |||//  \
                /  _||||| -:- |||||_  \
                |   | \\\  -  /'| |   |
                | \_|  `\`---'//  |_/ |
                \  .-\__ `-. -'__/-.  /
              ___`. .'  /--.--\  `. .'___
           ."" '<  `.___\_<|>_/___.' _> \"".
          | | :  `- \`. ;`. _/; .'/ /  .' ; |
          \  \ `-.   \_\_`. _.'_/_/  -' _.' /
===========`-.`___`-.__\ \___  /__.-'_.'_.-'================
                        `=--=-'                  
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int(10) unsigned DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int(10) unsigned DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'only for customer_addresses',
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ward` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_customer_id_foreign` (`customer_id`),
  KEY `addresses_cart_id_foreign` (`cart_id`),
  KEY `addresses_order_id_foreign` (`order_id`),
  CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of addresses
-- ----------------------------
BEGIN;
INSERT INTO `addresses` VALUES (3, 'order_shipping', 95, NULL, 2, 'vu cong truong', NULL, NULL, '3forcom', 'asdsa', NULL, 'adsdasd', 'asdsad', 'asd', 'VN', 'vutruong@gmail.com', '092131292', NULL, 0, NULL, '2021-04-14 09:20:24', '2021-04-14 09:20:24', NULL);
INSERT INTO `addresses` VALUES (4, 'order_billing', 95, NULL, 2, 'vu cong truong', NULL, NULL, '3forcom', 'asdsa', NULL, 'adsdasd', 'asdsad', 'asd', 'VN', 'vutruong@gmail.com', '092131292', NULL, 0, NULL, '2021-04-14 09:20:24', '2021-04-14 09:20:24', NULL);
INSERT INTO `addresses` VALUES (17, 'customer', 96, NULL, NULL, 'ya', NULL, NULL, 'yara', 'cc', NULL, 'ádasd', 'Hải Dương', 'asdas', 'VN', NULL, '0324238483', 'INV01234567891', 1, NULL, '2021-04-16 16:45:53', '2021-04-16 16:45:53', NULL);
INSERT INTO `addresses` VALUES (18, 'cart_billing', 97, 1, NULL, '', NULL, NULL, NULL, '', NULL, '', '', '', '', '', NULL, NULL, 0, NULL, '2021-05-01 14:18:42', '2021-05-01 14:18:42', NULL);
INSERT INTO `addresses` VALUES (19, 'cart_shipping', 97, 1, NULL, '', NULL, NULL, NULL, '', NULL, '', '', '', '', '', NULL, NULL, 0, NULL, '2021-05-01 14:18:42', '2021-05-01 14:18:42', NULL);
INSERT INTO `addresses` VALUES (20, 'order_shipping', 97, NULL, 6, '', NULL, NULL, NULL, '', NULL, '', '', '', '', '', NULL, NULL, 0, NULL, '2021-05-01 14:20:24', '2021-05-01 14:20:24', NULL);
INSERT INTO `addresses` VALUES (21, 'order_billing', 97, NULL, 6, '', NULL, NULL, NULL, '', NULL, '', '', '', '', '', NULL, NULL, 0, NULL, '2021-05-01 14:20:24', '2021-05-01 14:20:24', NULL);
INSERT INTO `addresses` VALUES (22, 'customer', 97, NULL, NULL, 'vu', NULL, NULL, 'paxcreation', 'ok', NULL, 'ok', 'hcm', 'ok', 'VN', NULL, '0239493943', 'INV01234567898', 1, NULL, '2021-05-01 14:31:42', '2021-05-01 14:31:42', NULL);
INSERT INTO `addresses` VALUES (23, 'cart_billing', 97, 2, NULL, '', NULL, NULL, NULL, '', NULL, '', '', '', '', '', NULL, NULL, 0, NULL, '2021-05-01 14:32:22', '2021-05-01 14:32:22', NULL);
INSERT INTO `addresses` VALUES (24, 'cart_shipping', 97, 2, NULL, '', NULL, NULL, NULL, '', NULL, '', '', '', '', '', NULL, NULL, 0, NULL, '2021-05-01 14:32:22', '2021-05-01 14:32:22', NULL);
INSERT INTO `addresses` VALUES (25, 'order_shipping', 97, NULL, 7, '', NULL, NULL, NULL, '', NULL, '', '', '', '', '', NULL, NULL, 0, NULL, '2021-05-01 14:34:30', '2021-05-01 14:34:30', NULL);
INSERT INTO `addresses` VALUES (26, 'order_billing', 97, NULL, 7, '', NULL, NULL, NULL, '', NULL, '', '', '', '', '', NULL, NULL, 0, NULL, '2021-05-01 14:34:30', '2021-05-01 14:34:30', NULL);
INSERT INTO `addresses` VALUES (29, 'order_shipping', 97, NULL, 8, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'hcm', 'ok', 'VN', 'shop@gmail.com', '0239493943', NULL, 0, NULL, '2021-05-23 11:10:02', '2021-05-23 11:10:02', NULL);
INSERT INTO `addresses` VALUES (30, 'order_billing', 97, NULL, 8, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'hcm', 'ok', 'VN', 'shop@gmail.com', '0239493943', NULL, 0, NULL, '2021-05-23 11:10:02', '2021-05-23 11:10:02', NULL);
INSERT INTO `addresses` VALUES (31, 'cart_billing', 96, 8, NULL, 'ya', NULL, NULL, NULL, 'cc', NULL, '', 'Hải Dương', 'asdas', 'VN', 'yara@gmail.com', '0324238483', NULL, 0, NULL, '2021-05-29 12:09:58', '2021-05-29 13:14:52', NULL);
INSERT INTO `addresses` VALUES (32, 'cart_shipping', 96, 8, NULL, 'ya', NULL, NULL, NULL, 'cc', NULL, '', 'Hải Dương', 'asdas', 'VN', 'yara@gmail.com', '0324238483', NULL, 0, NULL, '2021-05-29 12:09:58', '2021-05-29 13:14:52', NULL);
INSERT INTO `addresses` VALUES (33, 'order_shipping', 96, NULL, 9, 'ya', NULL, NULL, NULL, 'cc', NULL, '', 'Hải Dương', 'asdas', 'VN', 'yara@gmail.com', '0324238483', NULL, 0, NULL, '2021-05-29 13:14:53', '2021-05-29 13:14:53', NULL);
INSERT INTO `addresses` VALUES (34, 'order_billing', 96, NULL, 9, 'ya', NULL, NULL, NULL, 'cc', NULL, '', 'Hải Dương', 'asdas', 'VN', 'yara@gmail.com', '0324238483', NULL, 0, NULL, '2021-05-29 13:14:53', '2021-05-29 13:14:53', NULL);
INSERT INTO `addresses` VALUES (35, 'cart_billing', 96, 9, NULL, 'ya', NULL, NULL, NULL, 'cc', NULL, '', 'Hải Dương', 'asdas', 'VN', 'yara@gmail.com', '0324238483', NULL, 0, NULL, '2021-05-29 13:29:27', '2021-05-29 13:29:37', NULL);
INSERT INTO `addresses` VALUES (36, 'cart_shipping', 96, 9, NULL, 'ya', NULL, NULL, NULL, 'cc', NULL, '', 'Hải Dương', 'asdas', 'VN', 'yara@gmail.com', '0324238483', NULL, 0, NULL, '2021-05-29 13:29:27', '2021-05-29 13:29:37', NULL);
INSERT INTO `addresses` VALUES (37, 'order_shipping', 96, NULL, 10, 'ya', NULL, NULL, NULL, 'cc', NULL, '', 'Hải Dương', 'asdas', 'VN', 'yara@gmail.com', '0324238483', NULL, 0, NULL, '2021-05-29 13:29:37', '2021-05-29 13:29:37', NULL);
INSERT INTO `addresses` VALUES (38, 'order_billing', 96, NULL, 10, 'ya', NULL, NULL, NULL, 'cc', NULL, '', 'Hải Dương', 'asdas', 'VN', 'yara@gmail.com', '0324238483', NULL, 0, NULL, '2021-05-29 13:29:37', '2021-05-29 13:29:37', NULL);
INSERT INTO `addresses` VALUES (39, 'customer', 106, NULL, NULL, 'vu', NULL, NULL, 'paxcreation', 'duong 165', NULL, 'ok', 'Cu Chi', 'TPHCM', 'VN', NULL, '023493294', 'INV01234567891', 0, NULL, '2021-06-25 21:06:49', '2021-09-12 11:48:30', 'phuong 11');
INSERT INTO `addresses` VALUES (40, 'cart_billing', 106, 16, NULL, 'ok', NULL, NULL, 'paxcreation', '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', '029349', 0, NULL, '2021-06-27 13:31:00', '2021-06-27 13:49:12', 'phuong 15');
INSERT INTO `addresses` VALUES (41, 'cart_shipping', 106, 16, NULL, 'ok', NULL, NULL, NULL, '83 pham van bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', NULL, 0, NULL, '2021-06-27 13:31:00', '2021-06-27 13:49:12', 'phuong 15');
INSERT INTO `addresses` VALUES (42, 'customer', 106, 16, NULL, 'ok', NULL, NULL, 'paxcreation', '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', '029349', 0, NULL, '2021-06-27 13:49:12', '2021-06-27 13:49:12', 'phuong 15');
INSERT INTO `addresses` VALUES (43, 'order_shipping', 106, NULL, 11, 'ok', NULL, NULL, NULL, '83 pham van bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', NULL, 0, NULL, '2021-06-27 13:49:12', '2021-06-27 13:49:12', 'phuong 15');
INSERT INTO `addresses` VALUES (44, 'order_billing', 106, NULL, 11, 'ok', NULL, NULL, 'paxcreation', '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', '029349', 0, NULL, '2021-06-27 13:49:12', '2021-06-27 13:49:12', 'phuong 15');
INSERT INTO `addresses` VALUES (45, 'cart_billing', 106, 17, NULL, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-27 14:13:28', '2021-06-27 14:13:38', NULL);
INSERT INTO `addresses` VALUES (46, 'cart_shipping', 106, 17, NULL, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-27 14:13:28', '2021-06-27 14:13:38', NULL);
INSERT INTO `addresses` VALUES (47, 'order_shipping', 106, NULL, 12, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-27 14:13:39', '2021-06-27 14:13:39', NULL);
INSERT INTO `addresses` VALUES (48, 'order_billing', 106, NULL, 12, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-27 14:13:39', '2021-06-27 14:13:39', NULL);
INSERT INTO `addresses` VALUES (49, 'cart_billing', 106, 18, NULL, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-27 14:19:33', '2021-06-27 14:29:21', NULL);
INSERT INTO `addresses` VALUES (50, 'cart_shipping', 106, 18, NULL, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-27 14:19:33', '2021-06-27 14:29:21', NULL);
INSERT INTO `addresses` VALUES (51, 'order_shipping', 106, NULL, 13, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-27 14:29:21', '2021-06-27 14:29:21', NULL);
INSERT INTO `addresses` VALUES (52, 'order_billing', 106, NULL, 13, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-27 14:29:21', '2021-06-27 14:29:21', NULL);
INSERT INTO `addresses` VALUES (53, 'cart_billing', 106, 19, NULL, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-27 14:38:29', '2021-06-27 14:38:35', NULL);
INSERT INTO `addresses` VALUES (54, 'cart_shipping', 106, 19, NULL, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-27 14:38:29', '2021-06-27 14:38:35', NULL);
INSERT INTO `addresses` VALUES (55, 'order_shipping', 106, NULL, 14, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-27 14:38:35', '2021-06-27 14:38:35', NULL);
INSERT INTO `addresses` VALUES (56, 'order_billing', 106, NULL, 14, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-27 14:38:35', '2021-06-27 14:38:35', NULL);
INSERT INTO `addresses` VALUES (57, 'cart_billing', 106, 20, NULL, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-29 20:58:20', '2021-06-29 20:59:14', NULL);
INSERT INTO `addresses` VALUES (58, 'cart_shipping', 106, 20, NULL, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-29 20:58:20', '2021-06-29 20:59:14', NULL);
INSERT INTO `addresses` VALUES (59, 'order_shipping', 106, NULL, 15, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-29 20:59:14', '2021-06-29 20:59:14', NULL);
INSERT INTO `addresses` VALUES (60, 'order_billing', 106, NULL, 15, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-29 20:59:14', '2021-06-29 20:59:14', NULL);
INSERT INTO `addresses` VALUES (61, 'cart_billing', 106, 23, NULL, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-29 21:05:39', '2021-06-29 21:05:46', NULL);
INSERT INTO `addresses` VALUES (62, 'cart_shipping', 106, 23, NULL, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-29 21:05:39', '2021-06-29 21:05:46', NULL);
INSERT INTO `addresses` VALUES (63, 'order_shipping', 106, NULL, 16, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-29 21:05:46', '2021-06-29 21:05:46', NULL);
INSERT INTO `addresses` VALUES (64, 'order_billing', 106, NULL, 16, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-06-29 21:05:46', '2021-06-29 21:05:46', NULL);
INSERT INTO `addresses` VALUES (65, 'cart_billing', 106, 24, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', NULL, 0, NULL, '2021-06-29 21:38:26', '2021-07-21 18:11:59', 'phuong 15');
INSERT INTO `addresses` VALUES (66, 'cart_shipping', 106, 24, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', NULL, 0, NULL, '2021-06-29 21:38:26', '2021-07-21 18:11:59', 'phuong 15');
INSERT INTO `addresses` VALUES (67, 'cart_billing', NULL, 25, NULL, '', NULL, NULL, NULL, '', NULL, '', '', '', '', '', NULL, NULL, 0, NULL, '2021-06-29 21:49:19', '2021-06-29 21:49:19', NULL);
INSERT INTO `addresses` VALUES (68, 'cart_shipping', NULL, 25, NULL, '', NULL, NULL, NULL, '', NULL, '', '', '', '', '', NULL, NULL, 0, NULL, '2021-06-29 21:49:19', '2021-06-29 21:49:19', NULL);
INSERT INTO `addresses` VALUES (69, 'order_shipping', 106, NULL, 17, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', NULL, 0, NULL, '2021-07-21 18:11:59', '2021-07-21 18:11:59', 'phuong 15');
INSERT INTO `addresses` VALUES (70, 'order_billing', 106, NULL, 17, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', NULL, 0, NULL, '2021-07-21 18:11:59', '2021-07-21 18:11:59', 'phuong 15');
INSERT INTO `addresses` VALUES (71, 'cart_billing', 106, 26, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', NULL, 0, NULL, '2021-07-21 18:17:26', '2021-07-21 18:18:05', 'phuong 15');
INSERT INTO `addresses` VALUES (72, 'cart_shipping', 106, 26, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', NULL, 0, NULL, '2021-07-21 18:17:26', '2021-07-21 18:18:05', 'phuong 15');
INSERT INTO `addresses` VALUES (73, 'order_shipping', 106, NULL, 18, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', NULL, 0, NULL, '2021-07-21 18:18:06', '2021-07-21 18:18:06', 'phuong 15');
INSERT INTO `addresses` VALUES (74, 'order_billing', 106, NULL, 18, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', NULL, 0, NULL, '2021-07-21 18:18:06', '2021-07-21 18:18:06', 'phuong 15');
INSERT INTO `addresses` VALUES (75, 'cart_billing', 106, 27, NULL, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-07-21 18:25:49', '2021-07-21 18:26:15', NULL);
INSERT INTO `addresses` VALUES (76, 'cart_shipping', 106, 27, NULL, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-07-21 18:25:49', '2021-07-21 18:26:15', NULL);
INSERT INTO `addresses` VALUES (77, 'order_shipping', 106, NULL, 19, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-07-21 18:26:16', '2021-07-21 18:26:16', NULL);
INSERT INTO `addresses` VALUES (78, 'order_billing', 106, NULL, 19, 'vu', NULL, NULL, NULL, 'ok', NULL, '', 'ok', 'k', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-07-21 18:26:16', '2021-07-21 18:26:16', NULL);
INSERT INTO `addresses` VALUES (79, 'cart_billing', 106, 28, NULL, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-07-21 18:29:23', '2021-07-21 18:29:29', NULL);
INSERT INTO `addresses` VALUES (80, 'cart_shipping', 106, 28, NULL, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-07-21 18:29:23', '2021-07-21 18:29:29', NULL);
INSERT INTO `addresses` VALUES (81, 'order_shipping', 106, NULL, 20, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-07-21 18:29:29', '2021-07-21 18:29:29', NULL);
INSERT INTO `addresses` VALUES (82, 'order_billing', 106, NULL, 20, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-07-21 18:29:29', '2021-07-21 18:29:29', NULL);
INSERT INTO `addresses` VALUES (83, 'cart_billing', 106, 29, NULL, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-07-21 18:38:19', '2021-07-21 18:38:26', NULL);
INSERT INTO `addresses` VALUES (84, 'cart_shipping', 106, 29, NULL, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-07-21 18:38:19', '2021-07-21 18:38:26', NULL);
INSERT INTO `addresses` VALUES (85, 'order_shipping', 106, NULL, 21, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-07-21 18:38:27', '2021-07-21 18:38:27', NULL);
INSERT INTO `addresses` VALUES (86, 'order_billing', 106, NULL, 21, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'truongvc@paxcreation.com', '023493294', NULL, 0, NULL, '2021-07-21 18:38:27', '2021-07-21 18:38:27', NULL);
INSERT INTO `addresses` VALUES (87, 'cart_billing', 106, 30, NULL, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 18:41:04', '2021-07-21 18:42:07', NULL);
INSERT INTO `addresses` VALUES (88, 'cart_shipping', 106, 30, NULL, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 18:41:04', '2021-07-21 18:42:07', NULL);
INSERT INTO `addresses` VALUES (89, 'order_shipping', 106, NULL, 22, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 18:42:07', '2021-07-21 18:42:07', NULL);
INSERT INTO `addresses` VALUES (90, 'order_billing', 106, NULL, 22, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 18:42:07', '2021-07-21 18:42:07', NULL);
INSERT INTO `addresses` VALUES (91, 'cart_billing', 106, 31, NULL, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 18:54:01', '2021-07-21 18:54:14', NULL);
INSERT INTO `addresses` VALUES (92, 'cart_shipping', 106, 31, NULL, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 18:54:01', '2021-07-21 18:54:14', NULL);
INSERT INTO `addresses` VALUES (93, 'order_shipping', 106, NULL, 23, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 18:54:15', '2021-07-21 18:54:15', NULL);
INSERT INTO `addresses` VALUES (94, 'order_billing', 106, NULL, 23, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 18:54:15', '2021-07-21 18:54:15', NULL);
INSERT INTO `addresses` VALUES (95, 'cart_billing', 106, 32, NULL, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 19:08:55', '2021-07-21 19:09:24', NULL);
INSERT INTO `addresses` VALUES (96, 'cart_shipping', 106, 32, NULL, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 19:08:55', '2021-07-21 19:09:24', NULL);
INSERT INTO `addresses` VALUES (97, 'order_shipping', 106, NULL, 24, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 19:09:25', '2021-07-21 19:09:25', NULL);
INSERT INTO `addresses` VALUES (98, 'order_billing', 106, NULL, 24, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 19:09:25', '2021-07-21 19:09:25', NULL);
INSERT INTO `addresses` VALUES (99, 'cart_billing', 106, 33, NULL, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 19:12:52', '2021-07-21 19:13:04', NULL);
INSERT INTO `addresses` VALUES (100, 'cart_shipping', 106, 33, NULL, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 19:12:52', '2021-07-21 19:13:04', NULL);
INSERT INTO `addresses` VALUES (101, 'order_shipping', 106, NULL, 25, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 19:13:05', '2021-07-21 19:13:05', NULL);
INSERT INTO `addresses` VALUES (102, 'order_billing', 106, NULL, 25, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 19:13:05', '2021-07-21 19:13:05', NULL);
INSERT INTO `addresses` VALUES (103, 'cart_billing', 106, 34, NULL, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 21:20:57', '2021-07-21 21:21:52', NULL);
INSERT INTO `addresses` VALUES (104, 'cart_shipping', 106, 34, NULL, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 21:20:57', '2021-07-21 21:21:52', NULL);
INSERT INTO `addresses` VALUES (105, 'order_shipping', 106, NULL, 26, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 21:21:52', '2021-07-21 21:21:52', NULL);
INSERT INTO `addresses` VALUES (106, 'order_billing', 106, NULL, 26, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 21:21:52', '2021-07-21 21:21:52', NULL);
INSERT INTO `addresses` VALUES (107, 'cart_billing', 106, 35, NULL, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 21:24:01', '2021-07-21 21:24:27', NULL);
INSERT INTO `addresses` VALUES (108, 'cart_shipping', 106, 35, NULL, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 21:24:01', '2021-07-21 21:24:27', NULL);
INSERT INTO `addresses` VALUES (109, 'order_shipping', 106, NULL, 27, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 21:24:28', '2021-07-21 21:24:28', NULL);
INSERT INTO `addresses` VALUES (110, 'order_billing', 106, NULL, 27, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 21:24:28', '2021-07-21 21:24:28', NULL);
INSERT INTO `addresses` VALUES (111, 'cart_billing', 106, 36, NULL, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 21:27:27', '2021-07-21 21:27:39', NULL);
INSERT INTO `addresses` VALUES (112, 'cart_shipping', 106, 36, NULL, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 21:27:27', '2021-07-21 21:27:39', NULL);
INSERT INTO `addresses` VALUES (113, 'order_shipping', 106, NULL, 28, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 21:27:40', '2021-07-21 21:27:40', NULL);
INSERT INTO `addresses` VALUES (114, 'order_billing', 106, NULL, 28, 'vu', NULL, NULL, NULL, 'duong 165', NULL, '', 'Cu Chi', 'TPHCM', 'VN', 'vucongtruong1998@gmail.com', '023493294', NULL, 0, NULL, '2021-07-21 21:27:40', '2021-07-21 21:27:40', NULL);
INSERT INTO `addresses` VALUES (115, 'cart_billing', 106, 42, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 16:12:12', '2021-08-31 20:27:41', 'phuong 15');
INSERT INTO `addresses` VALUES (116, 'cart_shipping', 106, 42, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 16:12:12', '2021-08-31 20:27:41', 'phuong 15');
INSERT INTO `addresses` VALUES (117, 'order_shipping', 106, NULL, 29, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 20:27:42', '2021-08-31 20:27:42', 'phuong 15');
INSERT INTO `addresses` VALUES (118, 'order_billing', 106, NULL, 29, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 20:27:42', '2021-08-31 20:27:42', 'phuong 15');
INSERT INTO `addresses` VALUES (119, 'cart_billing', 106, 44, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 21:00:44', '2021-08-31 22:43:20', 'phuong 15');
INSERT INTO `addresses` VALUES (120, 'cart_shipping', 106, 44, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 21:00:44', '2021-08-31 22:43:20', 'phuong 15');
INSERT INTO `addresses` VALUES (121, 'order_shipping', 106, NULL, 30, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 22:43:20', '2021-08-31 22:43:20', 'phuong 15');
INSERT INTO `addresses` VALUES (122, 'order_billing', 106, NULL, 30, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 22:43:20', '2021-08-31 22:43:20', 'phuong 15');
INSERT INTO `addresses` VALUES (123, 'cart_billing', 106, 45, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 22:45:41', '2021-08-31 22:46:22', 'phuong 15');
INSERT INTO `addresses` VALUES (124, 'cart_shipping', 106, 45, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 22:45:41', '2021-08-31 22:46:22', 'phuong 15');
INSERT INTO `addresses` VALUES (125, 'order_shipping', 106, NULL, 31, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 22:46:23', '2021-08-31 22:46:23', 'phuong 15');
INSERT INTO `addresses` VALUES (126, 'order_billing', 106, NULL, 31, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 22:46:23', '2021-08-31 22:46:23', 'phuong 15');
INSERT INTO `addresses` VALUES (127, 'cart_billing', 106, 46, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 22:49:44', '2021-08-31 22:49:49', 'phuong 15');
INSERT INTO `addresses` VALUES (128, 'cart_shipping', 106, 46, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 22:49:44', '2021-08-31 22:49:49', 'phuong 15');
INSERT INTO `addresses` VALUES (129, 'order_shipping', 106, NULL, 32, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 22:49:49', '2021-08-31 22:49:49', 'phuong 15');
INSERT INTO `addresses` VALUES (130, 'order_billing', 106, NULL, 32, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 22:49:49', '2021-08-31 22:49:49', 'phuong 15');
INSERT INTO `addresses` VALUES (131, 'cart_billing', 106, 47, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 22:55:22', '2021-08-31 22:55:29', 'phuong 15');
INSERT INTO `addresses` VALUES (132, 'cart_shipping', 106, 47, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 22:55:22', '2021-08-31 22:55:29', 'phuong 15');
INSERT INTO `addresses` VALUES (133, 'order_shipping', 106, NULL, 33, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 22:55:29', '2021-08-31 22:55:29', 'phuong 15');
INSERT INTO `addresses` VALUES (134, 'order_billing', 106, NULL, 33, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 22:55:29', '2021-08-31 22:55:29', 'phuong 15');
INSERT INTO `addresses` VALUES (135, 'cart_billing', 106, 48, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 23:07:53', '2021-08-31 23:09:00', 'phuong 15');
INSERT INTO `addresses` VALUES (136, 'cart_shipping', 106, 48, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 23:07:53', '2021-08-31 23:09:00', 'phuong 15');
INSERT INTO `addresses` VALUES (137, 'order_shipping', 106, NULL, 34, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 23:09:00', '2021-08-31 23:09:00', 'phuong 15');
INSERT INTO `addresses` VALUES (138, 'order_billing', 106, NULL, 34, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 23:09:00', '2021-08-31 23:09:00', 'phuong 15');
INSERT INTO `addresses` VALUES (139, 'cart_billing', 106, 49, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 23:11:22', '2021-08-31 23:11:35', 'phuong 15');
INSERT INTO `addresses` VALUES (140, 'cart_shipping', 106, 49, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 23:11:22', '2021-08-31 23:11:35', 'phuong 15');
INSERT INTO `addresses` VALUES (141, 'order_shipping', 106, NULL, 35, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 23:11:35', '2021-08-31 23:11:35', 'phuong 15');
INSERT INTO `addresses` VALUES (142, 'order_billing', 106, NULL, 35, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 23:11:35', '2021-08-31 23:11:35', 'phuong 15');
INSERT INTO `addresses` VALUES (145, 'order_shipping', 106, NULL, 36, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 23:21:27', '2021-08-31 23:21:27', 'phuong 15');
INSERT INTO `addresses` VALUES (146, 'order_billing', 106, NULL, 36, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-08-31 23:21:27', '2021-08-31 23:21:27', 'phuong 15');
INSERT INTO `addresses` VALUES (149, 'cart_billing', 106, 16, NULL, 'ok', NULL, NULL, 'paxcreation', '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', '029349', 0, NULL, '2021-09-04 12:08:18', '2021-09-04 12:14:55', 'phuong 15');
INSERT INTO `addresses` VALUES (150, 'cart_shipping', 106, 16, NULL, 'ok', NULL, NULL, 'paxcreation', '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', '029349', 0, NULL, '2021-09-04 12:08:18', '2021-09-04 12:14:55', 'phuong 15');
INSERT INTO `addresses` VALUES (151, 'cart_billing', 106, 16, NULL, 'ok', NULL, NULL, 'paxcreation', '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', '029349', 0, NULL, '2021-09-04 12:16:07', '2021-09-04 12:16:07', 'phuong 15');
INSERT INTO `addresses` VALUES (152, 'cart_shipping', 106, 16, NULL, 'ok', NULL, NULL, 'paxcreation', '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', '029349', 0, NULL, '2021-09-04 12:16:07', '2021-09-04 12:16:07', 'phuong 15');
INSERT INTO `addresses` VALUES (153, 'cart_billing', 106, 16, NULL, 'ok', NULL, NULL, 'paxcreation', '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', '029349', 0, NULL, '2021-09-04 12:16:38', '2021-09-04 12:16:38', 'phuong 15');
INSERT INTO `addresses` VALUES (154, 'cart_shipping', 106, 16, NULL, 'ok', NULL, NULL, 'paxcreation', '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', '029349', 0, NULL, '2021-09-04 12:16:38', '2021-09-04 12:16:38', 'phuong 15');
INSERT INTO `addresses` VALUES (155, 'cart_billing', 106, 16, NULL, 'ok', NULL, NULL, 'paxcreation', '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', '029349', 0, NULL, '2021-09-04 12:19:18', '2021-09-04 12:19:18', 'phuong 15');
INSERT INTO `addresses` VALUES (156, 'cart_shipping', 106, 16, NULL, 'ok', NULL, NULL, 'paxcreation', '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', '029349', 0, NULL, '2021-09-04 12:19:18', '2021-09-04 12:19:18', 'phuong 15');
INSERT INTO `addresses` VALUES (157, 'cart_billing', 106, 16, NULL, 'ok', NULL, NULL, 'paxcreation', '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', '029349', 0, NULL, '2021-09-04 12:21:04', '2021-09-04 12:21:04', 'phuong 15');
INSERT INTO `addresses` VALUES (158, 'cart_shipping', 106, 16, NULL, 'ok', NULL, NULL, 'paxcreation', '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', '029349', 0, NULL, '2021-09-04 12:21:04', '2021-09-04 12:21:04', 'phuong 15');
INSERT INTO `addresses` VALUES (159, 'cart_billing', 106, 16, NULL, 'ok', NULL, NULL, 'paxcreation', '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', '029349', 0, NULL, '2021-09-04 12:22:51', '2021-09-04 12:22:51', 'phuong 15');
INSERT INTO `addresses` VALUES (160, 'cart_shipping', 106, 16, NULL, 'ok', NULL, NULL, 'paxcreation', '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', '029349', 0, NULL, '2021-09-04 12:22:51', '2021-09-04 12:22:51', 'phuong 15');
INSERT INTO `addresses` VALUES (161, 'cart_billing', 106, 16, NULL, 'ok', NULL, NULL, 'paxcreation', '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', '029349', 0, NULL, '2021-09-04 12:23:27', '2021-09-04 12:23:27', 'phuong 15');
INSERT INTO `addresses` VALUES (162, 'cart_shipping', 106, 16, NULL, 'ok', NULL, NULL, 'paxcreation', '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'truongvc@paxcreation.com', '0707944742', '029349', 0, NULL, '2021-09-04 12:23:27', '2021-09-04 12:23:27', 'phuong 15');
INSERT INTO `addresses` VALUES (165, 'cart_billing', 106, 57, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 14:13:47', '2021-09-04 14:14:05', 'phuong 15');
INSERT INTO `addresses` VALUES (166, 'cart_shipping', 106, 57, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 14:13:47', '2021-09-04 14:14:05', 'phuong 15');
INSERT INTO `addresses` VALUES (167, 'order_shipping', 106, NULL, 37, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 14:14:06', '2021-09-04 14:14:06', 'phuong 15');
INSERT INTO `addresses` VALUES (168, 'order_billing', 106, NULL, 37, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 14:14:06', '2021-09-04 14:14:06', 'phuong 15');
INSERT INTO `addresses` VALUES (169, 'cart_billing', 106, 62, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 16:01:54', '2021-09-04 16:31:54', 'phuong 15');
INSERT INTO `addresses` VALUES (170, 'cart_shipping', 106, 62, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 16:01:54', '2021-09-04 16:31:54', 'phuong 15');
INSERT INTO `addresses` VALUES (171, 'order_shipping', 106, NULL, 38, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 16:31:54', '2021-09-04 16:31:54', 'phuong 15');
INSERT INTO `addresses` VALUES (172, 'order_billing', 106, NULL, 38, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 16:31:54', '2021-09-04 16:31:54', 'phuong 15');
INSERT INTO `addresses` VALUES (173, 'cart_billing', 106, 63, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 16:40:57', '2021-09-04 16:43:17', 'phuong 15');
INSERT INTO `addresses` VALUES (174, 'cart_shipping', 106, 63, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 16:40:57', '2021-09-04 16:43:17', 'phuong 15');
INSERT INTO `addresses` VALUES (175, 'order_shipping', 106, NULL, 39, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 16:43:18', '2021-09-04 16:43:18', 'phuong 15');
INSERT INTO `addresses` VALUES (176, 'order_billing', 106, NULL, 39, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 16:43:18', '2021-09-04 16:43:18', 'phuong 15');
INSERT INTO `addresses` VALUES (177, 'cart_billing', 106, 64, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 16:54:33', '2021-09-04 16:54:40', 'phuong 15');
INSERT INTO `addresses` VALUES (178, 'cart_shipping', 106, 64, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 16:54:33', '2021-09-04 16:54:40', 'phuong 15');
INSERT INTO `addresses` VALUES (179, 'order_shipping', 106, NULL, 40, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 16:54:40', '2021-09-04 16:54:40', 'phuong 15');
INSERT INTO `addresses` VALUES (180, 'order_billing', 106, NULL, 40, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 16:54:40', '2021-09-04 16:54:40', 'phuong 15');
INSERT INTO `addresses` VALUES (181, 'cart_billing', 106, 65, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 17:00:44', '2021-09-04 17:05:39', 'phuong 15');
INSERT INTO `addresses` VALUES (182, 'cart_shipping', 106, 65, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 17:00:44', '2021-09-04 17:05:39', 'phuong 15');
INSERT INTO `addresses` VALUES (183, 'order_shipping', 106, NULL, 41, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 17:05:40', '2021-09-04 17:05:40', 'phuong 15');
INSERT INTO `addresses` VALUES (184, 'order_billing', 106, NULL, 41, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 17:05:40', '2021-09-04 17:05:40', 'phuong 15');
INSERT INTO `addresses` VALUES (185, 'cart_billing', 106, 66, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 17:19:17', '2021-09-04 17:20:57', 'phuong 15');
INSERT INTO `addresses` VALUES (186, 'cart_shipping', 106, 66, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 17:19:17', '2021-09-04 17:20:57', 'phuong 15');
INSERT INTO `addresses` VALUES (187, 'order_shipping', 106, NULL, 42, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 17:20:57', '2021-09-04 17:20:57', 'phuong 15');
INSERT INTO `addresses` VALUES (188, 'order_billing', 106, NULL, 42, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 17:20:57', '2021-09-04 17:20:57', 'phuong 15');
INSERT INTO `addresses` VALUES (189, 'cart_billing', 106, 67, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 17:25:52', '2021-09-04 17:26:07', 'phuong 15');
INSERT INTO `addresses` VALUES (190, 'cart_shipping', 106, 67, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 17:25:52', '2021-09-04 17:26:07', 'phuong 15');
INSERT INTO `addresses` VALUES (191, 'order_shipping', 106, NULL, 43, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 17:26:07', '2021-09-04 17:26:07', 'phuong 15');
INSERT INTO `addresses` VALUES (192, 'order_billing', 106, NULL, 43, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 17:26:07', '2021-09-04 17:26:07', 'phuong 15');
INSERT INTO `addresses` VALUES (193, 'cart_billing', 106, 68, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 17:29:56', '2021-09-04 19:00:05', 'phuong 15');
INSERT INTO `addresses` VALUES (194, 'cart_shipping', 106, 68, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 17:29:56', '2021-09-04 19:00:05', 'phuong 15');
INSERT INTO `addresses` VALUES (195, 'order_shipping', 106, NULL, 44, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 19:00:05', '2021-09-04 19:00:05', 'phuong 15');
INSERT INTO `addresses` VALUES (196, 'order_billing', 106, NULL, 44, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-04 19:00:05', '2021-09-04 19:00:05', 'phuong 15');
INSERT INTO `addresses` VALUES (197, 'cart_billing', 106, 72, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-06 22:45:49', '2021-09-06 22:45:58', 'phuong 15');
INSERT INTO `addresses` VALUES (198, 'cart_shipping', 106, 72, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-06 22:45:49', '2021-09-06 22:45:58', 'phuong 15');
INSERT INTO `addresses` VALUES (199, 'order_shipping', 106, NULL, 45, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-06 22:45:58', '2021-09-06 22:45:58', 'phuong 15');
INSERT INTO `addresses` VALUES (200, 'order_billing', 106, NULL, 45, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-06 22:45:58', '2021-09-06 22:45:58', 'phuong 15');
INSERT INTO `addresses` VALUES (201, 'cart_billing', 106, 73, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-06 23:12:48', '2021-09-06 23:13:05', 'phuong 15');
INSERT INTO `addresses` VALUES (202, 'cart_shipping', 106, 73, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-06 23:12:48', '2021-09-06 23:13:05', 'phuong 15');
INSERT INTO `addresses` VALUES (203, 'order_shipping', 106, NULL, 46, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-06 23:13:05', '2021-09-06 23:13:05', 'phuong 15');
INSERT INTO `addresses` VALUES (204, 'order_billing', 106, NULL, 46, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-06 23:13:05', '2021-09-06 23:13:05', 'phuong 15');
INSERT INTO `addresses` VALUES (205, 'order_shipping', 106, NULL, 47, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-06 23:14:02', '2021-09-06 23:14:02', 'phuong 15');
INSERT INTO `addresses` VALUES (206, 'order_billing', 106, NULL, 47, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-06 23:14:02', '2021-09-06 23:14:02', 'phuong 15');
INSERT INTO `addresses` VALUES (207, 'cart_billing', 106, 74, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-06 23:19:50', '2021-09-06 23:19:59', 'phuong 15');
INSERT INTO `addresses` VALUES (208, 'cart_shipping', 106, 74, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-06 23:19:50', '2021-09-06 23:19:59', 'phuong 15');
INSERT INTO `addresses` VALUES (209, 'order_shipping', 106, NULL, 48, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-06 23:20:00', '2021-09-06 23:20:00', 'phuong 15');
INSERT INTO `addresses` VALUES (210, 'order_billing', 106, NULL, 48, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-06 23:20:00', '2021-09-06 23:20:00', 'phuong 15');
INSERT INTO `addresses` VALUES (211, 'cart_billing', 106, 75, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-06 23:23:03', '2021-09-06 23:23:08', 'phuong 15');
INSERT INTO `addresses` VALUES (212, 'cart_shipping', 106, 75, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-06 23:23:03', '2021-09-06 23:23:08', 'phuong 15');
INSERT INTO `addresses` VALUES (213, 'order_shipping', 106, NULL, 49, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-06 23:23:08', '2021-09-06 23:23:08', 'phuong 15');
INSERT INTO `addresses` VALUES (214, 'order_billing', 106, NULL, 49, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-06 23:23:08', '2021-09-06 23:23:08', 'phuong 15');
INSERT INTO `addresses` VALUES (215, 'cart_billing', 106, 76, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-12 11:07:56', '2021-09-12 11:08:09', 'phuong 15');
INSERT INTO `addresses` VALUES (216, 'cart_shipping', 106, 76, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-12 11:07:56', '2021-09-12 11:08:09', 'phuong 15');
INSERT INTO `addresses` VALUES (217, 'order_shipping', 106, NULL, 50, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-12 11:08:09', '2021-09-12 11:08:09', 'phuong 15');
INSERT INTO `addresses` VALUES (218, 'order_billing', 106, NULL, 50, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-12 11:08:09', '2021-09-12 11:08:09', 'phuong 15');
INSERT INTO `addresses` VALUES (219, 'cart_billing', 106, 77, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-12 11:48:44', '2021-09-12 11:49:30', 'phuong 15');
INSERT INTO `addresses` VALUES (220, 'cart_shipping', 106, 77, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-12 11:48:44', '2021-09-12 11:49:30', 'phuong 15');
INSERT INTO `addresses` VALUES (221, 'order_shipping', 106, NULL, 51, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-12 11:49:30', '2021-09-12 11:49:30', 'phuong 15');
INSERT INTO `addresses` VALUES (222, 'order_billing', 106, NULL, 51, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-12 11:49:30', '2021-09-12 11:49:30', 'phuong 15');
INSERT INTO `addresses` VALUES (223, 'cart_billing', 106, 78, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-12 11:55:27', '2021-09-12 11:58:22', 'phuong 15');
INSERT INTO `addresses` VALUES (224, 'cart_shipping', 106, 78, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-12 11:55:27', '2021-09-12 11:58:22', 'phuong 15');
INSERT INTO `addresses` VALUES (225, 'order_shipping', 106, NULL, 52, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-12 11:58:22', '2021-09-12 11:58:22', 'phuong 15');
INSERT INTO `addresses` VALUES (226, 'order_billing', 106, NULL, 52, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-12 11:58:22', '2021-09-12 11:58:22', 'phuong 15');
INSERT INTO `addresses` VALUES (227, 'cart_billing', 106, 79, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-12 16:02:19', '2021-09-12 16:02:41', 'phuong 15');
INSERT INTO `addresses` VALUES (228, 'cart_shipping', 106, 79, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-12 16:02:19', '2021-09-12 16:02:41', 'phuong 15');
INSERT INTO `addresses` VALUES (229, 'order_shipping', 106, NULL, 53, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-12 16:02:42', '2021-09-12 16:02:42', 'phuong 15');
INSERT INTO `addresses` VALUES (230, 'order_billing', 106, NULL, 53, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'vucongtruong1998@gmail.com', '0707944742', NULL, 0, NULL, '2021-09-12 16:02:42', '2021-09-12 16:02:42', 'phuong 15');
INSERT INTO `addresses` VALUES (231, 'cart_billing', 106, 80, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'NULL', '0707944742', NULL, 0, NULL, '2021-09-16 18:22:45', '2021-09-16 20:59:51', 'phuong 15');
INSERT INTO `addresses` VALUES (232, 'cart_shipping', 106, 80, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'NULL', '0707944742', NULL, 0, NULL, '2021-09-16 18:22:45', '2021-09-16 20:59:51', 'phuong 15');
INSERT INTO `addresses` VALUES (233, 'order_shipping', 106, NULL, 54, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'NULL', '0707944742', NULL, 0, NULL, '2021-09-16 20:59:52', '2021-09-16 20:59:52', 'phuong 15');
INSERT INTO `addresses` VALUES (234, 'order_billing', 106, NULL, 54, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'NULL', '0707944742', NULL, 0, NULL, '2021-09-16 20:59:52', '2021-09-16 20:59:52', 'phuong 15');
INSERT INTO `addresses` VALUES (235, 'cart_billing', 106, 83, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'agent@kilimo.vn', '0707944742', NULL, 0, NULL, '2021-09-18 16:39:30', '2021-09-19 19:27:12', 'phuong 15');
INSERT INTO `addresses` VALUES (236, 'cart_shipping', 106, 83, NULL, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'agent@kilimo.vn', '0707944742', NULL, 0, NULL, '2021-09-18 16:39:30', '2021-09-19 19:27:12', 'phuong 15');
INSERT INTO `addresses` VALUES (237, 'order_shipping', 106, NULL, 55, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'agent@kilimo.vn', '0707944742', NULL, 0, NULL, '2021-09-19 19:27:12', '2021-09-19 19:27:12', 'phuong 15');
INSERT INTO `addresses` VALUES (238, 'order_billing', 106, NULL, 55, 'ok', NULL, NULL, NULL, '83 Pham Van Bach', NULL, '', 'Tan Binh', 'ho chi minh', 'VN', 'agent@kilimo.vn', '0707944742', NULL, 0, NULL, '2021-09-19 19:27:12', '2021-09-19 19:27:12', 'phuong 15');
INSERT INTO `addresses` VALUES (239, 'cart_billing', 106, 84, NULL, '', NULL, NULL, NULL, '', NULL, '', '', '', '', '', NULL, NULL, 0, NULL, '2021-09-19 19:30:52', '2021-09-19 19:30:52', NULL);
INSERT INTO `addresses` VALUES (240, 'cart_shipping', 106, 84, NULL, '', NULL, NULL, NULL, '', NULL, '', '', '', '', '', NULL, NULL, 0, NULL, '2021-09-19 19:30:52', '2021-09-19 19:30:52', NULL);
INSERT INTO `addresses` VALUES (241, 'cart_billing', 1, 82, NULL, 'test', NULL, NULL, NULL, '43/M', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'truong@gmail.com', '0707944744', NULL, 1, NULL, '2021-09-19 23:08:28', '2021-09-19 23:09:13', 'tan chanh hiep');
INSERT INTO `addresses` VALUES (242, 'cart_shipping', 1, 82, NULL, 'test', NULL, NULL, NULL, '43/M', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'truong@gmail.com', '0707944744', NULL, 1, NULL, '2021-09-19 23:08:28', '2021-09-19 23:09:13', 'tan chanh hiep');
INSERT INTO `addresses` VALUES (244, 'order_shipping', 1, NULL, 56, 'test', NULL, NULL, NULL, '43/M', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'truong@gmail.com', '0707944744', NULL, 1, NULL, '2021-09-19 23:09:14', '2021-09-19 23:09:14', 'tan chanh hiep');
INSERT INTO `addresses` VALUES (245, 'order_billing', 1, NULL, 56, 'test', NULL, NULL, NULL, '43/M', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'truong@gmail.com', '0707944744', NULL, 1, NULL, '2021-09-19 23:09:14', '2021-09-19 23:09:14', 'tan chanh hiep');
INSERT INTO `addresses` VALUES (248, 'cart_billing', 1, 86, NULL, 'test', NULL, NULL, NULL, '43/M', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'truong@gmail.com', '0707944744', NULL, 0, NULL, '2021-09-26 18:49:46', '2021-09-29 22:54:02', 'tan chanh hiep');
INSERT INTO `addresses` VALUES (249, 'cart_shipping', 1, 86, NULL, 'test', NULL, NULL, NULL, '43/M', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'truong@gmail.com', '0707944744', NULL, 0, NULL, '2021-09-26 18:49:46', '2021-09-29 22:54:02', 'tan chanh hiep');
INSERT INTO `addresses` VALUES (250, 'order_shipping', 1, NULL, 57, 'test', NULL, NULL, NULL, '43/M', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'truong@gmail.com', '0707944744', NULL, 0, NULL, '2021-09-29 22:54:03', '2021-09-29 22:54:03', 'tan chanh hiep');
INSERT INTO `addresses` VALUES (251, 'order_billing', 1, NULL, 57, 'test', NULL, NULL, NULL, '43/M', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'truong@gmail.com', '0707944744', NULL, 0, NULL, '2021-09-29 22:54:03', '2021-09-29 22:54:03', 'tan chanh hiep');
INSERT INTO `addresses` VALUES (252, 'cart_billing', 1, 87, NULL, 'test', NULL, NULL, NULL, '43/M', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'truong@gmail.com', '0707944744', NULL, 0, NULL, '2021-09-29 23:04:56', '2021-09-29 23:06:42', 'tan chanh hiep');
INSERT INTO `addresses` VALUES (253, 'cart_shipping', 1, 87, NULL, 'test', NULL, NULL, NULL, '43/M', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'truong@gmail.com', '0707944744', NULL, 0, NULL, '2021-09-29 23:04:56', '2021-09-29 23:06:42', 'tan chanh hiep');
INSERT INTO `addresses` VALUES (254, 'order_shipping', 1, NULL, 58, 'test', NULL, NULL, NULL, '43/M', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'truong@gmail.com', '0707944744', NULL, 0, NULL, '2021-09-29 23:06:42', '2021-09-29 23:06:42', 'tan chanh hiep');
INSERT INTO `addresses` VALUES (255, 'order_billing', 1, NULL, 58, 'test', NULL, NULL, NULL, '43/M', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'truong@gmail.com', '0707944744', NULL, 0, NULL, '2021-09-29 23:06:42', '2021-09-29 23:06:42', 'tan chanh hiep');
INSERT INTO `addresses` VALUES (261, 'cart_billing', 1, 89, NULL, 'test truong', '', NULL, NULL, 'dia chi', NULL, '', 'quan', 'Lâm Đồng', 'VN', 'truong@gmail.com', '0707944744', NULL, 0, NULL, '2021-09-30 11:31:52', '2021-09-30 11:31:58', 'lang');
INSERT INTO `addresses` VALUES (262, 'cart_shipping', 1, 89, NULL, 'test truong', '', NULL, NULL, 'dia chi', NULL, '', 'quan', 'Lâm Đồng', 'VN', 'truong@gmail.com', '0707944744', NULL, 0, NULL, '2021-09-30 11:31:52', '2021-09-30 11:31:58', 'lang');
INSERT INTO `addresses` VALUES (263, 'customer', 1, 89, NULL, 'test truong', '', NULL, NULL, 'dia chi', NULL, '', 'quan', 'Lâm Đồng', 'VN', 'truong@gmail.com', '0707944744', NULL, 0, NULL, '2021-09-30 11:31:58', '2021-09-30 11:31:58', 'lang');
INSERT INTO `addresses` VALUES (264, 'order_shipping', 1, NULL, 60, 'test truong', '', NULL, NULL, 'dia chi', NULL, '', 'quan', 'Lâm Đồng', 'VN', 'truong@gmail.com', '0707944744', NULL, 0, NULL, '2021-09-30 11:31:58', '2021-09-30 11:31:58', 'lang');
INSERT INTO `addresses` VALUES (265, 'order_billing', 1, NULL, 60, 'test truong', '', NULL, NULL, 'dia chi', NULL, '', 'quan', 'Lâm Đồng', 'VN', 'truong@gmail.com', '0707944744', NULL, 0, NULL, '2021-09-30 11:31:58', '2021-09-30 11:31:58', 'lang');
INSERT INTO `addresses` VALUES (266, 'cart_billing', 125, 90, NULL, 'vu cong truong', NULL, NULL, NULL, '43/16M, to 4, ap 5', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'ok@gmail.com', '0707944746', NULL, 0, NULL, '2021-09-30 15:46:24', '2021-10-01 13:44:54', 'phuong tan chanh hiep');
INSERT INTO `addresses` VALUES (267, 'cart_shipping', 125, 90, NULL, 'vu cong truong', NULL, NULL, NULL, '43/16M, to 4, ap 5', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'ok@gmail.com', '0707944746', NULL, 0, NULL, '2021-09-30 15:46:24', '2021-10-01 13:44:54', 'phuong tan chanh hiep');
INSERT INTO `addresses` VALUES (268, 'customer', 125, 90, NULL, 'vu cong truong', NULL, NULL, NULL, '43/16M, to 4, ap 5', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'ok@gmail.com', '0707944746', NULL, 0, NULL, '2021-10-01 13:44:54', '2021-10-01 13:44:54', 'phuong tan chanh hiep');
INSERT INTO `addresses` VALUES (269, 'order_shipping', 125, NULL, 61, 'vu cong truong', NULL, NULL, NULL, '43/16M, to 4, ap 5', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'ok@gmail.com', '0707944746', NULL, 0, NULL, '2021-10-01 13:44:55', '2021-10-01 13:44:55', 'phuong tan chanh hiep');
INSERT INTO `addresses` VALUES (270, 'order_billing', 125, NULL, 61, 'vu cong truong', NULL, NULL, NULL, '43/16M, to 4, ap 5', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'ok@gmail.com', '0707944746', NULL, 0, NULL, '2021-10-01 13:44:55', '2021-10-01 13:44:55', 'phuong tan chanh hiep');
INSERT INTO `addresses` VALUES (271, 'cart_billing', 125, 91, NULL, 'vu cong truong null', NULL, NULL, NULL, '43/16M, to 4, ap 5', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'ok@gmail.com', '0707944746', NULL, 0, NULL, '2021-10-01 14:15:39', '2021-10-01 14:15:59', 'phuong tan chanh hiep');
INSERT INTO `addresses` VALUES (272, 'cart_shipping', 125, 91, NULL, 'vu cong truong null', NULL, NULL, NULL, '43/16M, to 4, ap 5', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'ok@gmail.com', '0707944746', NULL, 0, NULL, '2021-10-01 14:15:39', '2021-10-01 14:15:59', 'phuong tan chanh hiep');
INSERT INTO `addresses` VALUES (273, 'order_shipping', 125, NULL, 62, 'vu cong truong null', NULL, NULL, NULL, '43/16M, to 4, ap 5', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'ok@gmail.com', '0707944746', NULL, 0, NULL, '2021-10-01 14:15:59', '2021-10-01 14:15:59', 'phuong tan chanh hiep');
INSERT INTO `addresses` VALUES (274, 'order_billing', 125, NULL, 62, 'vu cong truong null', NULL, NULL, NULL, '43/16M, to 4, ap 5', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'ok@gmail.com', '0707944746', NULL, 0, NULL, '2021-10-01 14:15:59', '2021-10-01 14:15:59', 'phuong tan chanh hiep');
INSERT INTO `addresses` VALUES (275, 'cart_billing', 125, 92, NULL, 'vu cong truong null', NULL, NULL, NULL, '43/16M, to 4, ap 5', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'ok@gmail.com', '0707944746', NULL, 0, NULL, '2021-10-01 14:18:08', '2021-10-01 14:18:33', 'phuong tan chanh hiep');
INSERT INTO `addresses` VALUES (276, 'cart_shipping', 125, 92, NULL, 'vu cong truong null', NULL, NULL, NULL, '43/16M, to 4, ap 5', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'ok@gmail.com', '0707944746', NULL, 0, NULL, '2021-10-01 14:18:08', '2021-10-01 14:18:33', 'phuong tan chanh hiep');
INSERT INTO `addresses` VALUES (277, 'order_shipping', 125, NULL, 63, 'vu cong truong null', NULL, NULL, NULL, '43/16M, to 4, ap 5', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'ok@gmail.com', '0707944746', NULL, 0, NULL, '2021-10-01 14:18:34', '2021-10-01 14:18:34', 'phuong tan chanh hiep');
INSERT INTO `addresses` VALUES (278, 'order_billing', 125, NULL, 63, 'vu cong truong null', NULL, NULL, NULL, '43/16M, to 4, ap 5', NULL, '', 'quan 12', 'Lâm Đồng', 'VN', 'ok@gmail.com', '0707944746', NULL, 0, NULL, '2021-10-01 14:18:34', '2021-10-01 14:18:34', 'phuong tan chanh hiep');
INSERT INTO `addresses` VALUES (279, 'cart_billing', 125, 93, NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, NULL, 0, NULL, '2021-10-04 16:33:57', '2021-10-04 16:33:57', NULL);
INSERT INTO `addresses` VALUES (280, 'cart_shipping', 125, 93, NULL, '', '', NULL, NULL, '', NULL, '', '', '', '', '', NULL, NULL, 0, NULL, '2021-10-04 16:33:57', '2021-10-04 16:33:57', NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `admin_password_resets`;
CREATE TABLE `admin_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_password_resets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(10) unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admins
-- ----------------------------
BEGIN;
INSERT INTO `admins` VALUES (1, 'Example', 'admin@example.com', '$2y$10$e4QGedrniNbZbNh/Z7Q2x.dB4Vd9s4UjnNveJfVI/sfltEGr.nS/C', 's2flhce6vPPE6DF7smPiHnKJkvAjj18OzrvEgmfvoinI4XRLqbya8QA2hJyoXazMYqDfHAkyZEUDS08Z', 1, 1, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
COMMIT;

-- ----------------------------
-- Table structure for agents
-- ----------------------------
DROP TABLE IF EXISTS `agents`;
CREATE TABLE `agents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `id_card` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_affiliated` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_of_farmer` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 - crop farmer, 2 - livestock or fish farmer',
  `size_of_land` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_crop_type_id` int(10) unsigned DEFAULT NULL,
  `production` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_crops` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_animal_id` int(10) unsigned DEFAULT NULL,
  `number_of_animals` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `other_animals` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agents_customer_id_index` (`customer_id`),
  CONSTRAINT `agents_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of agents
-- ----------------------------
BEGIN;
INSERT INTO `agents` VALUES (1, 97, 'test', 1998, 'test', '10', '2', 1, '20', 1, '20', 'other', 0, 0, '2021-04-19 05:52:36', '2021-05-06 21:02:20', 1, NULL);
INSERT INTO `agents` VALUES (4, 106, 'card', 1998, 'agent', '10', '2', 1, '20', 8, '20', 'ok crop', 0, 0, '2021-06-19 11:37:28', '2021-09-30 12:05:38', 1, NULL);
INSERT INTO `agents` VALUES (9, 121, 'card test', 1998, 'agent name', '100', '4', 1, '10', 8, '30', 'ok', 0, 0, '2021-06-20 17:11:11', '2021-06-20 17:11:11', 1, NULL);
INSERT INTO `agents` VALUES (11, 93, '128128', 1993, 'agent zalo', '10', '3', 1, '20ha', 8, '', '', 0, 0, '2021-09-30 12:18:52', '2021-09-30 13:10:26', 1, '');
INSERT INTO `agents` VALUES (12, 114, '12345678', 1995, 'agent ok', '10', '5', 1, '20m2', 7, '', '', 0, 0, '2021-09-30 13:26:23', '2021-09-30 13:26:23', 1, '');
COMMIT;

-- ----------------------------
-- Table structure for animal_translations
-- ----------------------------
DROP TABLE IF EXISTS `animal_translations`;
CREATE TABLE `animal_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `animal_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `animal_translations_animal_id_foreign` (`animal_id`),
  CONSTRAINT `animal_translations_animal_id_foreign` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of animal_translations
-- ----------------------------
BEGIN;
INSERT INTO `animal_translations` VALUES (1, 'en', 1, 'Fish');
INSERT INTO `animal_translations` VALUES (2, 'en', 2, 'Fish 1');
INSERT INTO `animal_translations` VALUES (3, 'en', 3, 'Fish 2');
INSERT INTO `animal_translations` VALUES (4, 'en', 4, 'Fish 3');
INSERT INTO `animal_translations` VALUES (5, 'en', 5, 'Chicken');
INSERT INTO `animal_translations` VALUES (6, 'en', 6, 'Chicken 1');
INSERT INTO `animal_translations` VALUES (7, 'en', 7, 'Chicken 2');
INSERT INTO `animal_translations` VALUES (8, 'en', 8, 'Chicken 3');
INSERT INTO `animal_translations` VALUES (9, 'en', 9, 'Pig');
INSERT INTO `animal_translations` VALUES (10, 'en', 10, 'Pig 1');
INSERT INTO `animal_translations` VALUES (11, 'en', 11, 'Pig 2');
INSERT INTO `animal_translations` VALUES (12, 'en', 12, 'Pig 3');
INSERT INTO `animal_translations` VALUES (13, 'vi', 8, 'khac');
COMMIT;

-- ----------------------------
-- Table structure for animals
-- ----------------------------
DROP TABLE IF EXISTS `animals`;
CREATE TABLE `animals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of animals
-- ----------------------------
BEGIN;
INSERT INTO `animals` VALUES (1, NULL, 0, '2021-06-26 23:18:35', '2021-06-26 23:18:35');
INSERT INTO `animals` VALUES (2, NULL, 0, '2021-06-26 23:18:35', '2021-06-26 23:18:35');
INSERT INTO `animals` VALUES (3, NULL, 0, '2021-06-26 23:18:35', '2021-06-26 23:18:35');
INSERT INTO `animals` VALUES (4, NULL, 0, '2021-06-26 23:18:35', '2021-06-26 23:18:35');
INSERT INTO `animals` VALUES (5, NULL, 0, '2021-06-26 23:18:35', '2021-06-26 23:18:35');
INSERT INTO `animals` VALUES (6, NULL, 0, '2021-06-26 23:18:35', '2021-06-26 23:18:35');
INSERT INTO `animals` VALUES (7, NULL, 0, '2021-06-26 23:18:35', '2021-06-26 23:18:35');
INSERT INTO `animals` VALUES (8, NULL, 0, '2021-06-26 23:18:35', '2021-06-26 23:18:35');
INSERT INTO `animals` VALUES (9, NULL, 0, '2021-06-26 23:18:35', '2021-06-26 23:18:35');
INSERT INTO `animals` VALUES (10, NULL, 0, '2021-06-26 23:18:35', '2021-06-26 23:18:35');
INSERT INTO `animals` VALUES (11, NULL, 0, '2021-06-26 23:18:35', '2021-06-26 23:18:35');
INSERT INTO `animals` VALUES (12, NULL, 0, '2021-06-26 23:18:35', '2021-06-26 23:18:35');
COMMIT;

-- ----------------------------
-- Table structure for attribute_families
-- ----------------------------
DROP TABLE IF EXISTS `attribute_families`;
CREATE TABLE `attribute_families` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of attribute_families
-- ----------------------------
BEGIN;
INSERT INTO `attribute_families` VALUES (1, 'default', 'Default', 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for attribute_group_mappings
-- ----------------------------
DROP TABLE IF EXISTS `attribute_group_mappings`;
CREATE TABLE `attribute_group_mappings` (
  `attribute_id` int(10) unsigned NOT NULL,
  `attribute_group_id` int(10) unsigned NOT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`),
  CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of attribute_group_mappings
-- ----------------------------
BEGIN;
INSERT INTO `attribute_group_mappings` VALUES (1, 1, 1);
INSERT INTO `attribute_group_mappings` VALUES (2, 1, 3);
INSERT INTO `attribute_group_mappings` VALUES (3, 1, 4);
INSERT INTO `attribute_group_mappings` VALUES (4, 1, 5);
INSERT INTO `attribute_group_mappings` VALUES (5, 1, 6);
INSERT INTO `attribute_group_mappings` VALUES (6, 1, 7);
INSERT INTO `attribute_group_mappings` VALUES (7, 1, 8);
INSERT INTO `attribute_group_mappings` VALUES (8, 1, 10);
INSERT INTO `attribute_group_mappings` VALUES (9, 2, 1);
INSERT INTO `attribute_group_mappings` VALUES (10, 2, 2);
INSERT INTO `attribute_group_mappings` VALUES (11, 4, 1);
INSERT INTO `attribute_group_mappings` VALUES (12, 4, 2);
INSERT INTO `attribute_group_mappings` VALUES (13, 4, 3);
INSERT INTO `attribute_group_mappings` VALUES (14, 4, 4);
INSERT INTO `attribute_group_mappings` VALUES (15, 4, 5);
INSERT INTO `attribute_group_mappings` VALUES (16, 3, 1);
INSERT INTO `attribute_group_mappings` VALUES (17, 3, 2);
INSERT INTO `attribute_group_mappings` VALUES (18, 3, 3);
INSERT INTO `attribute_group_mappings` VALUES (19, 5, 1);
INSERT INTO `attribute_group_mappings` VALUES (20, 5, 2);
INSERT INTO `attribute_group_mappings` VALUES (21, 5, 3);
INSERT INTO `attribute_group_mappings` VALUES (22, 5, 4);
INSERT INTO `attribute_group_mappings` VALUES (23, 1, 11);
INSERT INTO `attribute_group_mappings` VALUES (24, 1, 12);
INSERT INTO `attribute_group_mappings` VALUES (25, 1, 13);
INSERT INTO `attribute_group_mappings` VALUES (26, 1, 9);
INSERT INTO `attribute_group_mappings` VALUES (27, 1, 2);
INSERT INTO `attribute_group_mappings` VALUES (28, 1, 13);
INSERT INTO `attribute_group_mappings` VALUES (32, 2, 3);
INSERT INTO `attribute_group_mappings` VALUES (33, 2, 4);
INSERT INTO `attribute_group_mappings` VALUES (34, 1, 15);
INSERT INTO `attribute_group_mappings` VALUES (35, 1, 16);
INSERT INTO `attribute_group_mappings` VALUES (36, 1, 17);
INSERT INTO `attribute_group_mappings` VALUES (37, 1, 18);
COMMIT;

-- ----------------------------
-- Table structure for attribute_groups
-- ----------------------------
DROP TABLE IF EXISTS `attribute_groups`;
CREATE TABLE `attribute_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `attribute_family_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`),
  CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of attribute_groups
-- ----------------------------
BEGIN;
INSERT INTO `attribute_groups` VALUES (1, 'General', 1, 0, 1);
INSERT INTO `attribute_groups` VALUES (2, 'Description', 2, 0, 1);
INSERT INTO `attribute_groups` VALUES (3, 'Meta Description', 3, 0, 1);
INSERT INTO `attribute_groups` VALUES (4, 'Price', 4, 0, 1);
INSERT INTO `attribute_groups` VALUES (5, 'Shipping', 5, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for attribute_option_translations
-- ----------------------------
DROP TABLE IF EXISTS `attribute_option_translations`;
CREATE TABLE `attribute_option_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `attribute_option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_option_translations_attribute_option_id_locale_unique` (`attribute_option_id`,`locale`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of attribute_option_translations
-- ----------------------------
BEGIN;
INSERT INTO `attribute_option_translations` VALUES (1, 'en', 'Red', 1);
INSERT INTO `attribute_option_translations` VALUES (2, 'en', 'Green', 2);
INSERT INTO `attribute_option_translations` VALUES (3, 'en', 'Yellow', 3);
INSERT INTO `attribute_option_translations` VALUES (4, 'en', 'Black', 4);
INSERT INTO `attribute_option_translations` VALUES (5, 'en', 'White', 5);
INSERT INTO `attribute_option_translations` VALUES (6, 'en', 'S', 6);
INSERT INTO `attribute_option_translations` VALUES (7, 'en', 'M', 7);
INSERT INTO `attribute_option_translations` VALUES (8, 'en', 'L', 8);
INSERT INTO `attribute_option_translations` VALUES (9, 'en', 'XL', 9);
INSERT INTO `attribute_option_translations` VALUES (10, 'vi', '', 6);
INSERT INTO `attribute_option_translations` VALUES (11, 'vi', '', 7);
INSERT INTO `attribute_option_translations` VALUES (12, 'vi', '', 8);
INSERT INTO `attribute_option_translations` VALUES (13, 'vi', '', 9);
COMMIT;

-- ----------------------------
-- Table structure for attribute_options
-- ----------------------------
DROP TABLE IF EXISTS `attribute_options`;
CREATE TABLE `attribute_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `swatch_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of attribute_options
-- ----------------------------
BEGIN;
INSERT INTO `attribute_options` VALUES (1, 'Red', 1, 23, NULL);
INSERT INTO `attribute_options` VALUES (2, 'Green', 2, 23, NULL);
INSERT INTO `attribute_options` VALUES (3, 'Yellow', 3, 23, NULL);
INSERT INTO `attribute_options` VALUES (4, 'Black', 4, 23, NULL);
INSERT INTO `attribute_options` VALUES (5, 'White', 5, 23, NULL);
INSERT INTO `attribute_options` VALUES (6, 'S', 1, 24, NULL);
INSERT INTO `attribute_options` VALUES (7, 'M', 2, 24, NULL);
INSERT INTO `attribute_options` VALUES (8, 'L', 3, 24, NULL);
INSERT INTO `attribute_options` VALUES (9, 'XL', 4, 24, NULL);
COMMIT;

-- ----------------------------
-- Table structure for attribute_translations
-- ----------------------------
DROP TABLE IF EXISTS `attribute_translations`;
CREATE TABLE `attribute_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `attribute_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of attribute_translations
-- ----------------------------
BEGIN;
INSERT INTO `attribute_translations` VALUES (1, 'en', 'SKU', 1);
INSERT INTO `attribute_translations` VALUES (2, 'en', 'Name', 2);
INSERT INTO `attribute_translations` VALUES (3, 'en', 'URL Key', 3);
INSERT INTO `attribute_translations` VALUES (4, 'en', 'Tax Category', 4);
INSERT INTO `attribute_translations` VALUES (5, 'en', 'New', 5);
INSERT INTO `attribute_translations` VALUES (6, 'en', 'Featured', 6);
INSERT INTO `attribute_translations` VALUES (7, 'en', 'Visible Individually', 7);
INSERT INTO `attribute_translations` VALUES (8, 'en', 'Status', 8);
INSERT INTO `attribute_translations` VALUES (9, 'en', 'Short Description', 9);
INSERT INTO `attribute_translations` VALUES (10, 'en', 'Description', 10);
INSERT INTO `attribute_translations` VALUES (11, 'en', 'Price', 11);
INSERT INTO `attribute_translations` VALUES (12, 'en', 'Cost', 12);
INSERT INTO `attribute_translations` VALUES (13, 'en', 'Special Price', 13);
INSERT INTO `attribute_translations` VALUES (14, 'en', 'Special Price From', 14);
INSERT INTO `attribute_translations` VALUES (15, 'en', 'Special Price To', 15);
INSERT INTO `attribute_translations` VALUES (16, 'en', 'Meta Description', 16);
INSERT INTO `attribute_translations` VALUES (17, 'en', 'Meta Keywords', 17);
INSERT INTO `attribute_translations` VALUES (18, 'en', 'Meta Description', 18);
INSERT INTO `attribute_translations` VALUES (19, 'en', 'Width', 19);
INSERT INTO `attribute_translations` VALUES (20, 'en', 'Height', 20);
INSERT INTO `attribute_translations` VALUES (21, 'en', 'Depth', 21);
INSERT INTO `attribute_translations` VALUES (22, 'en', 'Weight', 22);
INSERT INTO `attribute_translations` VALUES (23, 'en', 'Color', 23);
INSERT INTO `attribute_translations` VALUES (24, 'en', 'Size', 24);
INSERT INTO `attribute_translations` VALUES (25, 'en', 'Brand', 25);
INSERT INTO `attribute_translations` VALUES (26, 'en', 'Allow Guest Checkout', 26);
INSERT INTO `attribute_translations` VALUES (27, 'en', 'Product Number', 27);
INSERT INTO `attribute_translations` VALUES (28, 'en', 'Logo Brand', 28);
INSERT INTO `attribute_translations` VALUES (29, 'vi', 'Giá', 11);
INSERT INTO `attribute_translations` VALUES (36, 'en', 'Description 1', 32);
INSERT INTO `attribute_translations` VALUES (37, 'vi', 'Mô tả 1', 32);
INSERT INTO `attribute_translations` VALUES (38, 'en', 'Description 2', 33);
INSERT INTO `attribute_translations` VALUES (39, 'vi', 'Mô tả 2', 33);
INSERT INTO `attribute_translations` VALUES (40, 'en', 'Hot', 34);
INSERT INTO `attribute_translations` VALUES (41, 'vi', 'Hot', 34);
INSERT INTO `attribute_translations` VALUES (42, 'en', 'Popular', 35);
INSERT INTO `attribute_translations` VALUES (43, 'vi', 'Popular', 35);
INSERT INTO `attribute_translations` VALUES (44, 'en', 'Search', 36);
INSERT INTO `attribute_translations` VALUES (45, 'vi', 'Search', 36);
INSERT INTO `attribute_translations` VALUES (46, 'vi', 'Brand', 25);
INSERT INTO `attribute_translations` VALUES (47, 'vi', 'Cân nặng', 22);
INSERT INTO `attribute_translations` VALUES (48, 'vi', 'Kích thước', 24);
INSERT INTO `attribute_translations` VALUES (49, 'en', 'Origin', 37);
INSERT INTO `attribute_translations` VALUES (50, 'vi', 'Xuất xứ', 37);
COMMIT;

-- ----------------------------
-- Table structure for attributes
-- ----------------------------
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE `attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_locale` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_channel` tinyint(1) NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `swatch_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_in_flat` tinyint(1) NOT NULL DEFAULT '1',
  `is_comparable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of attributes
-- ----------------------------
BEGIN;
INSERT INTO `attributes` VALUES (1, 'sku', 'SKU', 'text', NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (2, 'name', 'Name', 'text', NULL, 3, 1, 0, 1, 1, 0, 0, 0, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 1);
INSERT INTO `attributes` VALUES (3, 'url_key', 'URL Key', 'text', NULL, 4, 1, 1, 0, 0, 0, 0, 0, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (4, 'tax_category_id', 'Tax Category', 'select', NULL, 5, 0, 0, 0, 1, 0, 0, 0, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (5, 'new', 'New', 'boolean', NULL, 6, 0, 0, 0, 0, 0, 0, 0, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (6, 'featured', 'Featured', 'boolean', NULL, 7, 0, 0, 0, 0, 0, 0, 0, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (7, 'visible_individually', 'Visible Individually', 'boolean', NULL, 9, 1, 0, 0, 0, 0, 0, 0, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (8, 'status', 'Status', 'boolean', NULL, 10, 1, 0, 0, 0, 0, 0, 0, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (9, 'short_description', 'Short Description', 'textarea', NULL, 11, 1, 0, 1, 1, 0, 0, 0, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (10, 'description', 'Description', 'textarea', NULL, 12, 1, 0, 1, 1, 0, 0, 0, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 1);
INSERT INTO `attributes` VALUES (11, 'price', 'Price', 'price', 'decimal', 13, 1, 0, 0, 0, 1, 0, 0, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 1);
INSERT INTO `attributes` VALUES (12, 'cost', 'Cost', 'price', 'decimal', 14, 0, 0, 0, 1, 0, 0, 1, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (13, 'special_price', 'Special Price', 'price', 'decimal', 15, 0, 0, 0, 0, 0, 0, 0, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (14, 'special_price_from', 'Special Price From', 'date', NULL, 16, 0, 0, 0, 1, 0, 0, 0, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (15, 'special_price_to', 'Special Price To', 'date', NULL, 17, 0, 0, 0, 1, 0, 0, 0, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (16, 'meta_title', 'Meta Title', 'textarea', NULL, 18, 0, 0, 1, 1, 0, 0, 0, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (17, 'meta_keywords', 'Meta Keywords', 'textarea', NULL, 20, 0, 0, 1, 1, 0, 0, 0, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (18, 'meta_description', 'Meta Description', 'textarea', NULL, 21, 0, 0, 1, 1, 0, 0, 1, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (19, 'width', 'Width', 'text', 'decimal', 22, 0, 0, 0, 0, 0, 0, 1, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (20, 'height', 'Height', 'text', 'decimal', 23, 0, 0, 0, 0, 0, 0, 1, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (21, 'depth', 'Depth', 'text', 'decimal', 24, 0, 0, 0, 0, 0, 0, 1, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (22, 'weight', 'Weight', 'text', 'decimal', 25, 1, 0, 0, 0, 0, 0, 0, 1, '2021-04-28 23:24:50', '2021-08-08 18:15:25', NULL, 1, 0);
INSERT INTO `attributes` VALUES (23, 'color', 'Color', 'select', NULL, 26, 0, 0, 0, 0, 1, 1, 1, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (24, 'size', 'Size', 'select', '', 27, 0, 0, 0, 0, 1, 1, 1, 1, '2021-04-28 23:24:50', '2021-08-08 18:16:21', 'dropdown', 1, 0);
INSERT INTO `attributes` VALUES (25, 'brand', 'Brand', 'select', '', 28, 0, 0, 0, 0, 1, 0, 1, 1, '2021-04-28 23:24:50', '2021-08-08 18:09:13', 'dropdown', 1, 0);
INSERT INTO `attributes` VALUES (26, 'guest_checkout', 'Guest Checkout', 'boolean', NULL, 8, 1, 0, 0, 0, 0, 0, 0, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (27, 'product_number', 'Product Number', 'text', NULL, 2, 0, 1, 0, 0, 0, 0, 0, 0, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (28, 'brand_logo', 'Brand Logo', 'image', NULL, 28, 0, 0, 0, 0, 0, 0, 0, 1, '2021-04-28 23:24:50', '2021-04-28 23:24:50', NULL, 1, 0);
INSERT INTO `attributes` VALUES (32, 'Description01', 'Description01', 'textarea', '', NULL, 0, 0, 0, 0, 0, 0, 1, 1, '2021-07-24 23:08:30', '2021-08-08 18:32:38', NULL, 1, 0);
INSERT INTO `attributes` VALUES (33, 'Description02', 'Description02', 'textarea', '', NULL, 0, 0, 0, 0, 0, 0, 1, 1, '2021-07-24 23:08:50', '2021-08-08 18:32:46', NULL, 1, 0);
INSERT INTO `attributes` VALUES (34, 'hot', 'Hot', 'boolean', '', NULL, 0, 0, 0, 0, 0, 0, 1, 0, '2021-07-26 11:18:11', '2021-07-26 11:18:11', NULL, 1, 0);
INSERT INTO `attributes` VALUES (35, 'popular', 'Popular', 'boolean', '', NULL, 0, 0, 0, 0, 0, 0, 1, 0, '2021-07-26 11:24:47', '2021-07-26 11:24:47', NULL, 1, 0);
INSERT INTO `attributes` VALUES (36, 'search', 'Search', 'boolean', '', NULL, 0, 0, 0, 0, 0, 0, 1, 0, '2021-07-26 11:25:32', '2021-07-26 11:25:32', NULL, 1, 0);
INSERT INTO `attributes` VALUES (37, 'origin', 'Origin', 'text', '', NULL, 0, 0, 0, 0, 0, 0, 1, 1, '2021-08-08 18:19:13', '2021-08-08 18:19:13', NULL, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for banner_images
-- ----------------------------
DROP TABLE IF EXISTS `banner_images`;
CREATE TABLE `banner_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marketplace_seller_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `banner_images_marketplace_seller_id_foreign` (`marketplace_seller_id`),
  CONSTRAINT `banner_images_marketplace_seller_id_foreign` FOREIGN KEY (`marketplace_seller_id`) REFERENCES `marketplace_sellers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of banner_images
-- ----------------------------
BEGIN;
INSERT INTO `banner_images` VALUES (6, NULL, 'seller/banners/1/4cTSLucIxMsNEsUI79XeCGbpWsysJNbXxXWhX7dV.png', 1, NULL, NULL);
INSERT INTO `banner_images` VALUES (7, NULL, 'seller/banners/1/2EDoPXqueRXNUvwpKiBSe4XSkvZaaQF42mljkwEg.png', 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for booking_product_appointment_slots
-- ----------------------------
DROP TABLE IF EXISTS `booking_product_appointment_slots`;
CREATE TABLE `booking_product_appointment_slots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `duration` int(11) DEFAULT NULL,
  `break_time` int(11) DEFAULT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_appointment_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_appointment_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of booking_product_appointment_slots
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for booking_product_default_slots
-- ----------------------------
DROP TABLE IF EXISTS `booking_product_default_slots`;
CREATE TABLE `booking_product_default_slots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `booking_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `break_time` int(11) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_default_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_default_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of booking_product_default_slots
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for booking_product_event_ticket_translations
-- ----------------------------
DROP TABLE IF EXISTS `booking_product_event_ticket_translations`;
CREATE TABLE `booking_product_event_ticket_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `booking_product_event_ticket_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `booking_product_event_ticket_translations_locale_unique` (`booking_product_event_ticket_id`,`locale`),
  CONSTRAINT `booking_product_event_ticket_translations_locale_foreign` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of booking_product_event_ticket_translations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for booking_product_event_tickets
-- ----------------------------
DROP TABLE IF EXISTS `booking_product_event_tickets`;
CREATE TABLE `booking_product_event_tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,4) DEFAULT '0.0000',
  `qty` int(11) DEFAULT '0',
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` datetime DEFAULT NULL,
  `special_price_to` datetime DEFAULT NULL,
  `booking_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_event_tickets_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_event_tickets_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of booking_product_event_tickets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for booking_product_rental_slots
-- ----------------------------
DROP TABLE IF EXISTS `booking_product_rental_slots`;
CREATE TABLE `booking_product_rental_slots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `renting_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `daily_price` decimal(12,4) DEFAULT '0.0000',
  `hourly_price` decimal(12,4) DEFAULT '0.0000',
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_rental_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_rental_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of booking_product_rental_slots
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for booking_product_table_slots
-- ----------------------------
DROP TABLE IF EXISTS `booking_product_table_slots`;
CREATE TABLE `booking_product_table_slots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `price_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_limit` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL,
  `break_time` int(11) NOT NULL,
  `prevent_scheduling_before` int(11) NOT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_table_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_table_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of booking_product_table_slots
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for booking_products
-- ----------------------------
DROP TABLE IF EXISTS `booking_products`;
CREATE TABLE `booking_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) DEFAULT '0',
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_location` tinyint(1) NOT NULL DEFAULT '0',
  `available_every_week` tinyint(1) DEFAULT NULL,
  `available_from` datetime DEFAULT NULL,
  `available_to` datetime DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_products_product_id_foreign` (`product_id`),
  CONSTRAINT `booking_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of booking_products
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bookings
-- ----------------------------
DROP TABLE IF EXISTS `bookings`;
CREATE TABLE `bookings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) DEFAULT '0',
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `booking_product_event_ticket_id` int(10) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_order_id_foreign` (`order_id`),
  KEY `bookings_product_id_foreign` (`product_id`),
  CONSTRAINT `bookings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bookings
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bulkupload_data_flow_profiles
-- ----------------------------
DROP TABLE IF EXISTS `bulkupload_data_flow_profiles`;
CREATE TABLE `bulkupload_data_flow_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_family_id` int(10) unsigned NOT NULL,
  `run_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bulkupload_foreign_attribute_family_id` (`attribute_family_id`),
  CONSTRAINT `bulkupload_foreign_attribute_family_id` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bulkupload_data_flow_profiles
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `items_count` int(11) DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `tax_total` decimal(12,4) DEFAULT '0.0000',
  `base_tax_total` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `checkout_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `conversion_time` datetime DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_customer_id_foreign` (`customer_id`),
  KEY `cart_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
BEGIN;
INSERT INTO `cart` VALUES (1, '', '', '', 'free_free', NULL, 0, 1, 2.0000, NULL, 'USD', 'USD', 'USD', 'USD', 30.0000, 30.0000, 30.0000, 30.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 97, 1, '2021-05-01 14:18:15', '2021-05-01 14:20:24', '');
INSERT INTO `cart` VALUES (2, '', '', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 15.0000, 15.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 97, 1, '2021-05-01 14:30:25', '2021-05-01 14:34:30', '');
INSERT INTO `cart` VALUES (3, NULL, NULL, NULL, NULL, NULL, 0, 1, 2.0000, NULL, 'USD', 'USD', 'USD', 'USD', 30.0000, 30.0000, 30.0000, 30.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-05-01 15:27:02', '2021-05-01 15:27:45', '');
INSERT INTO `cart` VALUES (6, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 15.0000, 15.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-05-23 21:14:40', '2021-05-23 21:14:40', '');
INSERT INTO `cart` VALUES (8, 'yara@gmail.com', 'yara', 'ra', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 25.0000, 25.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 96, 1, '2021-05-29 11:57:22', '2021-05-29 13:14:53', '');
INSERT INTO `cart` VALUES (9, 'yara@gmail.com', 'yara', 'ra', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 15.0000, 15.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 96, 1, '2021-05-29 13:29:16', '2021-05-29 13:29:37', '');
INSERT INTO `cart` VALUES (10, 'yara@gmail.com', 'yara', 'ra', NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 15.0000, 15.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 1, NULL, 96, 1, '2021-05-29 13:31:34', '2021-05-29 13:41:53', '');
INSERT INTO `cart` VALUES (13, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 15.0000, 15.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-05-30 21:59:25', '2021-05-30 21:59:25', '');
INSERT INTO `cart` VALUES (14, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 15.0000, 15.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-06-23 20:57:13', '2021-06-23 21:20:36', '');
INSERT INTO `cart` VALUES (15, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 15.0000, 15.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-06-25 20:54:16', '2021-06-25 22:02:59', '');
INSERT INTO `cart` VALUES (16, 'truongvc@paxcreation.com', 'ok', '', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 25.0000, 25.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-06-25 21:06:59', '2021-06-27 13:49:12', '');
INSERT INTO `cart` VALUES (17, 'truongvc@paxcreation.com', 'vu', 'truong', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 25.0000, 25.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-06-27 14:13:20', '2021-06-27 14:13:42', '');
INSERT INTO `cart` VALUES (18, 'truongvc@paxcreation.com', 'vu', 'truong', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 15.0000, 15.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-06-27 14:19:26', '2021-06-27 14:29:25', '');
INSERT INTO `cart` VALUES (19, 'truongvc@paxcreation.com', 'vu', 'truong', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 30.0000, 30.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-06-27 14:38:19', '2021-06-27 14:38:42', '');
INSERT INTO `cart` VALUES (20, 'truongvc@paxcreation.com', 'vu', 'truong', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 25.0000, 25.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-06-27 23:04:13', '2021-06-29 20:59:18', '');
INSERT INTO `cart` VALUES (21, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 15.0000, 15.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-06-27 23:13:55', '2021-06-27 23:13:59', '');
INSERT INTO `cart` VALUES (23, 'truongvc@paxcreation.com', 'vu', 'truong', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 25.0000, 25.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-06-29 21:05:23', '2021-06-29 21:05:53', '');
INSERT INTO `cart` VALUES (24, 'truongvc@paxcreation.com', 'ok', '', 'flatrate_flatrate', NULL, 0, 1, 2.0000, NULL, 'USD', 'USD', 'USD', 'USD', 20018.0000, 20018.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-06-29 21:12:22', '2021-07-21 18:12:06', '');
INSERT INTO `cart` VALUES (25, '', '', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 20.0000, 20.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-06-29 21:48:27', '2021-06-29 22:01:40', '');
INSERT INTO `cart` VALUES (26, 'truongvc@paxcreation.com', 'ok', '', 'flatrate_flatrate', NULL, 0, 1, 3.0000, NULL, 'USD', 'USD', 'USD', 'USD', 30027.0000, 30027.0000, 29997.0000, 29997.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-07-21 18:16:23', '2021-07-21 18:18:10', '');
INSERT INTO `cart` VALUES (27, 'truongvc@paxcreation.com', 'vu', 'truong', 'flatrate_flatrate', NULL, 0, 1, 2.0000, NULL, 'USD', 'USD', 'USD', 'USD', 20018.0000, 20018.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-07-21 18:25:29', '2021-07-21 18:26:20', '');
INSERT INTO `cart` VALUES (28, 'truongvc@paxcreation.com', 'vu', 'truong', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 10009.0000, 10009.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-07-21 18:29:00', '2021-07-21 18:29:33', '');
INSERT INTO `cart` VALUES (29, 'truongvc@paxcreation.com', 'vu', 'truong', 'flatrate_flatrate', NULL, 0, 1, 2.0000, NULL, 'USD', 'USD', 'USD', 'USD', 20018.0000, 20018.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-07-21 18:38:01', '2021-07-21 18:38:30', '');
INSERT INTO `cart` VALUES (30, 'vucongtruong1998@gmail.com', 'vu', 'truong', 'flatrate_flatrate', NULL, 0, 1, 3.0000, NULL, 'USD', 'USD', 'USD', 'USD', 30027.0000, 30027.0000, 29997.0000, 29997.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-07-21 18:40:53', '2021-07-21 18:42:11', '');
INSERT INTO `cart` VALUES (31, 'vucongtruong1998@gmail.com', 'vu', 'truong', 'flatrate_flatrate', NULL, 0, 1, 4.0000, NULL, 'USD', 'USD', 'USD', 'USD', 40036.0000, 40036.0000, 39996.0000, 39996.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-07-21 18:53:39', '2021-07-21 18:54:21', '');
INSERT INTO `cart` VALUES (32, 'vucongtruong1998@gmail.com', 'vu', 'truong', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 10009.0000, 10009.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-07-21 19:08:46', '2021-07-21 19:09:29', '');
INSERT INTO `cart` VALUES (33, 'vucongtruong1998@gmail.com', 'vu', 'truong', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 10009.0000, 10009.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-07-21 19:12:43', '2021-07-21 19:13:11', '');
INSERT INTO `cart` VALUES (34, 'vucongtruong1998@gmail.com', 'vu', 'truong', 'flatrate_flatrate', NULL, 0, 1, 2.0000, NULL, 'USD', 'USD', 'USD', 'USD', 20018.0000, 20018.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-07-21 21:20:49', '2021-07-21 21:22:01', '');
INSERT INTO `cart` VALUES (35, 'vucongtruong1998@gmail.com', 'vu', 'truong', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 9999.0000, 9999.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-07-21 21:23:53', '2021-07-21 21:24:35', '');
INSERT INTO `cart` VALUES (36, 'vucongtruong1998@gmail.com', 'vu', 'truong', 'flatrate_flatrate', NULL, 0, 2, 8.0000, NULL, 'USD', 'USD', 'USD', 'USD', 10184.0000, 10184.0000, 10104.0000, 10104.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-07-21 21:25:14', '2021-07-21 21:27:46', '');
INSERT INTO `cart` VALUES (37, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 9999.0000, 9999.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-07-26 18:56:37', '2021-07-26 18:56:37', '');
INSERT INTO `cart` VALUES (39, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-08-24 10:49:17', '2021-08-24 10:52:44', '');
INSERT INTO `cart` VALUES (40, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 18500.0000, 18500.0000, 18500.0000, 18500.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-08-26 14:54:38', '2021-08-26 14:54:43', '');
INSERT INTO `cart` VALUES (41, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-08-28 16:17:06', '2021-08-28 16:17:07', '');
INSERT INTO `cart` VALUES (42, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 1, 2.0000, NULL, 'USD', 'USD', 'USD', 'USD', 39000.0000, 39000.0000, 39000.0000, 39000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-08-31 16:11:56', '2021-08-31 20:27:46', '');
INSERT INTO `cart` VALUES (44, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-08-31 20:49:09', '2021-08-31 22:43:20', '');
INSERT INTO `cart` VALUES (45, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-08-31 22:45:21', '2021-08-31 22:46:23', '');
INSERT INTO `cart` VALUES (46, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-08-31 22:49:06', '2021-08-31 22:49:54', '');
INSERT INTO `cart` VALUES (47, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-08-31 22:51:29', '2021-08-31 22:55:33', '');
INSERT INTO `cart` VALUES (48, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-08-31 22:56:33', '2021-08-31 23:09:04', '');
INSERT INTO `cart` VALUES (49, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-08-31 23:11:09', '2021-08-31 23:11:39', '');
INSERT INTO `cart` VALUES (57, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 3, 3.0000, NULL, 'USD', 'USD', 'USD', 'USD', 138500.0000, 138500.0000, 138500.0000, 138500.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-09-04 14:12:49', '2021-09-04 14:14:10', '');
INSERT INTO `cart` VALUES (60, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 100000.0000, 100000.0000, 100000.0000, 100000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-09-04 14:33:19', '2021-09-04 14:33:20', '');
INSERT INTO `cart` VALUES (62, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-09-04 16:01:46', '2021-09-04 16:32:05', '');
INSERT INTO `cart` VALUES (63, 'vucongtruong1998@gmail.com', 'ok', '', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 19010.0000, 19010.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-09-04 16:40:48', '2021-09-04 16:43:22', '');
INSERT INTO `cart` VALUES (64, 'vucongtruong1998@gmail.com', 'ok', '', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 20010.0000, 20010.0000, 20000.0000, 20000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-09-04 16:54:07', '2021-09-04 16:54:49', '');
INSERT INTO `cart` VALUES (65, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 20000.0000, 20000.0000, 20000.0000, 20000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-09-04 17:00:37', '2021-09-04 17:05:44', '');
INSERT INTO `cart` VALUES (66, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 20000.0000, 20000.0000, 20000.0000, 20000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-09-04 17:19:11', '2021-09-04 17:21:00', '');
INSERT INTO `cart` VALUES (67, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 2, 2.0000, NULL, 'USD', 'USD', 'USD', 'USD', 119000.0000, 119000.0000, 119000.0000, 119000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-09-04 17:25:36', '2021-09-04 17:26:10', '');
INSERT INTO `cart` VALUES (68, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-09-04 17:29:49', '2021-09-04 19:00:09', '');
INSERT INTO `cart` VALUES (70, NULL, NULL, NULL, NULL, NULL, 0, 1, 3.0000, NULL, 'USD', 'USD', 'USD', 'USD', 57000.0000, 57000.0000, 57000.0000, 57000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2021-09-05 14:03:09', '2021-09-05 15:04:33', '');
INSERT INTO `cart` VALUES (72, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-09-06 22:45:11', '2021-09-06 22:46:07', '');
INSERT INTO `cart` VALUES (73, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-09-06 23:12:33', '2021-09-06 23:14:05', '');
INSERT INTO `cart` VALUES (74, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-09-06 23:19:44', '2021-09-06 23:20:06', '');
INSERT INTO `cart` VALUES (75, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 100000.0000, 100000.0000, 100000.0000, 100000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-09-06 23:22:51', '2021-09-06 23:23:11', '');
INSERT INTO `cart` VALUES (76, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-09-12 11:07:46', '2021-09-12 11:08:16', '');
INSERT INTO `cart` VALUES (77, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-09-12 11:31:15', '2021-09-12 11:49:38', '');
INSERT INTO `cart` VALUES (78, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-09-12 11:54:28', '2021-09-12 11:58:26', '');
INSERT INTO `cart` VALUES (79, 'vucongtruong1998@gmail.com', 'ok', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 20000.0000, 20000.0000, 20000.0000, 20000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-09-12 12:00:39', '2021-09-12 16:02:47', '');
INSERT INTO `cart` VALUES (80, 'NULL', 'ok', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-09-16 18:22:20', '2021-09-16 20:59:52', '');
INSERT INTO `cart` VALUES (82, 'truong@gmail.com', 'test', 'truong', 'flatrate_flatrate', NULL, 0, 2, 2.0000, NULL, 'USD', 'USD', 'USD', 'USD', 19060.0000, 19060.0000, 19040.0000, 19040.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 1, 1, '2021-09-18 16:15:57', '2021-09-19 23:09:17', '');
INSERT INTO `cart` VALUES (83, 'agent@kilimo.vn', 'ok', '', 'flatrate_flatrate', NULL, 0, 3, 8.0000, NULL, 'USD', 'USD', 'USD', 'USD', 122120.0000, 122120.0000, 122040.0000, 122040.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 106, 1, '2021-09-18 16:39:16', '2021-09-19 19:27:29', '');
INSERT INTO `cart` VALUES (84, '', '', '', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 19010.0000, 19010.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 1, NULL, 106, 1, '2021-09-19 19:30:41', '2021-09-19 19:33:47', '');
INSERT INTO `cart` VALUES (86, 'truong@gmail.com', 'test', 'truong', 'free_free', NULL, 0, 2, 2.0000, NULL, 'USD', 'USD', 'USD', 'USD', 8040.0000, 8040.0000, 8040.0000, 8040.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 1, 1, '2021-09-26 18:43:37', '2021-09-29 22:54:09', '');
INSERT INTO `cart` VALUES (87, 'truong@gmail.com', 'test', 'truong', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 1, 1, '2021-09-29 23:04:44', '2021-09-29 23:06:46', '');
INSERT INTO `cart` VALUES (88, 'truong@gmail.com', 'test', 'truong', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 1, 1, '2021-09-29 23:08:42', '2021-09-30 11:22:55', '');
INSERT INTO `cart` VALUES (89, 'truong@gmail.com', 'test truong', '', 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 1, 1, '2021-09-30 11:31:18', '2021-09-30 11:32:02', '');
INSERT INTO `cart` VALUES (90, 'ok@gmail.com', 'vu cong truong', NULL, 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 125, 1, '2021-09-30 15:21:26', '2021-10-01 13:45:02', '');
INSERT INTO `cart` VALUES (91, 'ok@gmail.com', 'vu cong truong null', NULL, 'free_free', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 125, 1, '2021-10-01 14:15:22', '2021-10-01 14:16:03', '');
INSERT INTO `cart` VALUES (92, 'ok@gmail.com', 'vu cong truong null', NULL, 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 50.0000, 50.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 0, NULL, 125, 1, '2021-10-01 14:18:00', '2021-10-01 14:18:37', '');
INSERT INTO `cart` VALUES (93, '', '', '', 'free_free', NULL, 0, 1, 2.0000, NULL, 'USD', 'USD', 'USD', 'USD', 80.0000, 80.0000, 80.0000, 80.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 1, NULL, 125, 1, '2021-10-04 16:33:48', '2021-10-08 10:31:19', '');
INSERT INTO `cart` VALUES (96, 'vutruong@gmail.com', 'truong cac', '', NULL, NULL, 0, 1, 4.0000, NULL, 'USD', 'USD', 'USD', 'USD', 32000.0000, 32000.0000, 32000.0000, 32000.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0, 1, NULL, 95, 1, '2021-10-22 18:27:43', '2021-10-22 19:00:58', '');
COMMIT;

-- ----------------------------
-- Table structure for cart_item_inventories
-- ----------------------------
DROP TABLE IF EXISTS `cart_item_inventories`;
CREATE TABLE `cart_item_inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(10) unsigned NOT NULL DEFAULT '0',
  `inventory_source_id` int(10) unsigned DEFAULT NULL,
  `cart_item_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cart_item_inventories
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cart_items
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `additional` json DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `cart_id` int(10) unsigned NOT NULL,
  `tax_category_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `custom_price` decimal(12,4) DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_product_id_foreign` (`product_id`),
  KEY `cart_items_cart_id_foreign` (`cart_id`),
  KEY `cart_items_tax_category_id_foreign` (`tax_category_id`),
  KEY `cart_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cart_items
-- ----------------------------
BEGIN;
INSERT INTO `cart_items` VALUES (3, 1, 'haha', 'simple', 'Product 16', NULL, 1.0000, 1.0000, 1.0000, 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"quantity\": 1, \"product_id\": 16}', NULL, 16, 39, NULL, '2021-08-24 10:49:17', '2021-08-24 10:52:44', NULL, '');
INSERT INTO `cart_items` VALUES (4, 1, 'test3', 'simple', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 20.0000, 20.0000, 20.0000, 18500.0000, 18500.0000, 18500.0000, 18500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"Qv2Gxa875slkcd5iqrTBiuZqJRcKpXsNIHorHf4J\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"7\"}', NULL, 7, 40, NULL, '2021-08-26 14:54:38', '2021-08-26 14:54:43', NULL, '');
INSERT INTO `cart_items` VALUES (5, 1, 'test3', 'simple', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 20.0000, 20.0000, 20.0000, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"DuF8Ozn1ro8dzPGkowksjkqG6MddSC44fA3dtbPE\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"7\"}', NULL, 7, 41, NULL, '2021-08-28 16:17:06', '2021-08-28 16:17:07', NULL, '');
INSERT INTO `cart_items` VALUES (6, 2, 'test3', 'simple', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 20.0000, 40.0000, 40.0000, 19500.0000, 19500.0000, 39000.0000, 39000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"quantity\": 2, \"product_id\": 7}', NULL, 7, 42, NULL, '2021-08-31 16:11:56', '2021-08-31 20:27:41', NULL, '');
INSERT INTO `cart_items` VALUES (8, 1, 'test3', 'simple', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 20.0000, 20.0000, 20.0000, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"oGqqzDN0G2S6YDKNke6qJFM2NV1t8RCp2ODHc5ub\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"7\"}', NULL, 7, 44, NULL, '2021-08-31 20:49:09', '2021-08-31 22:43:20', NULL, '');
INSERT INTO `cart_items` VALUES (9, 1, 'test3', 'simple', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 20.0000, 20.0000, 20.0000, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"oGqqzDN0G2S6YDKNke6qJFM2NV1t8RCp2ODHc5ub\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"7\"}', NULL, 7, 45, NULL, '2021-08-31 22:45:21', '2021-08-31 22:46:23', NULL, '');
INSERT INTO `cart_items` VALUES (10, 1, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 4.0000, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"oGqqzDN0G2S6YDKNke6qJFM2NV1t8RCp2ODHc5ub\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', NULL, 13, 46, NULL, '2021-08-31 22:49:06', '2021-08-31 22:49:49', NULL, '');
INSERT INTO `cart_items` VALUES (11, 1, 'test3', 'simple', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 20.0000, 20.0000, 20.0000, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"oGqqzDN0G2S6YDKNke6qJFM2NV1t8RCp2ODHc5ub\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"7\"}', NULL, 7, 47, NULL, '2021-08-31 22:51:29', '2021-08-31 22:55:29', NULL, '');
INSERT INTO `cart_items` VALUES (12, 1, 'test3', 'simple', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 20.0000, 20.0000, 20.0000, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"oGqqzDN0G2S6YDKNke6qJFM2NV1t8RCp2ODHc5ub\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"7\"}', NULL, 7, 48, NULL, '2021-08-31 22:56:33', '2021-08-31 23:09:00', NULL, '');
INSERT INTO `cart_items` VALUES (13, 1, 'test3', 'simple', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 20.0000, 20.0000, 20.0000, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"oGqqzDN0G2S6YDKNke6qJFM2NV1t8RCp2ODHc5ub\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"7\"}', NULL, 7, 49, NULL, '2021-08-31 23:11:09', '2021-08-31 23:11:35', NULL, '');
INSERT INTO `cart_items` VALUES (33, 1, 'test6', 'simple', 'Product 9 Product 9 Product 9 Product 9 Product 9', NULL, 4.0000, 4.0000, 4.0000, 100000.0000, 100000.0000, 100000.0000, 100000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"9\"}', NULL, 9, 57, NULL, '2021-09-04 14:12:49', '2021-09-04 14:14:06', NULL, '');
INSERT INTO `cart_items` VALUES (34, 1, 'test3', 'simple', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 20.0000, 20.0000, 20.0000, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"7\"}', NULL, 7, 57, NULL, '2021-09-04 14:12:55', '2021-09-04 14:14:06', NULL, '');
INSERT INTO `cart_items` VALUES (35, 1, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 4.0000, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', NULL, 13, 57, NULL, '2021-09-04 14:13:05', '2021-09-04 14:14:06', NULL, '');
INSERT INTO `cart_items` VALUES (41, 1, 'test6', 'simple', 'Product 9 Product 9 Product 9 Product 9 Product 9', NULL, 4.0000, 4.0000, 4.0000, 100000.0000, 100000.0000, 100000.0000, 100000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"ZXOKd1BWGbcm3erWszsAGDORz2JqZFLPnLugD4mV\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"9\"}', NULL, 9, 60, NULL, '2021-09-04 14:33:19', '2021-09-04 14:33:20', NULL, '');
INSERT INTO `cart_items` VALUES (46, 1, 'test3', 'simple', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 20.0000, 20.0000, 20.0000, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"7\"}', NULL, 7, 62, NULL, '2021-09-04 16:01:46', '2021-09-04 16:31:54', NULL, '');
INSERT INTO `cart_items` VALUES (47, 1, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 4.0000, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', NULL, 13, 63, NULL, '2021-09-04 16:40:48', '2021-09-04 16:43:18', NULL, '');
INSERT INTO `cart_items` VALUES (48, 1, 'asmdamsd', 'simple', 'Product 14', NULL, 1.0000, 1.0000, 1.0000, 20000.0000, 20000.0000, 20000.0000, 20000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"14\"}', NULL, 14, 64, NULL, '2021-09-04 16:54:07', '2021-09-04 16:54:40', NULL, '');
INSERT INTO `cart_items` VALUES (49, 1, 'asmdamsd', 'simple', 'Product 14', NULL, 1.0000, 1.0000, 1.0000, 20000.0000, 20000.0000, 20000.0000, 20000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"14\"}', NULL, 14, 65, NULL, '2021-09-04 17:00:37', '2021-09-04 17:05:40', NULL, '');
INSERT INTO `cart_items` VALUES (50, 1, 'asmdamsd', 'simple', 'Product 14', NULL, 1.0000, 1.0000, 1.0000, 20000.0000, 20000.0000, 20000.0000, 20000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"14\"}', NULL, 14, 66, NULL, '2021-09-04 17:19:11', '2021-09-04 17:20:57', NULL, '');
INSERT INTO `cart_items` VALUES (51, 1, 'test6', 'simple', 'Product 9 Product 9 Product 9 Product 9 Product 9', NULL, 4.0000, 4.0000, 4.0000, 100000.0000, 100000.0000, 100000.0000, 100000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"9\"}', NULL, 9, 67, NULL, '2021-09-04 17:25:36', '2021-09-04 17:26:07', NULL, '');
INSERT INTO `cart_items` VALUES (52, 1, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 4.0000, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', NULL, 13, 67, NULL, '2021-09-04 17:25:43', '2021-09-04 17:26:07', NULL, '');
INSERT INTO `cart_items` VALUES (53, 1, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 4.0000, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', NULL, 13, 68, NULL, '2021-09-04 17:29:49', '2021-09-04 19:00:05', NULL, '');
INSERT INTO `cart_items` VALUES (55, 3, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 12.0000, 12.0000, 19000.0000, 19000.0000, 57000.0000, 57000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"w1DMni5RXvQRxEsmlKxsNIEu39TtjlixPRVV9h6Q\", \"quantity\": 3, \"is_buy_now\": \"0\", \"product_id\": \"13\"}', NULL, 13, 70, NULL, '2021-09-05 14:03:09', '2021-09-05 15:04:33', NULL, '');
INSERT INTO `cart_items` VALUES (57, 1, 'hahaha', 'simple', 'Product 16', NULL, 1.0000, 1.0000, 1.0000, 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"k7mOuYbfSczCvzANjt9l1Ad4hj3r6TzyiteecQ4v\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"16\"}', NULL, 16, 72, NULL, '2021-09-06 22:45:11', '2021-09-06 22:45:58', NULL, '');
INSERT INTO `cart_items` VALUES (58, 1, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 4.0000, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"k7mOuYbfSczCvzANjt9l1Ad4hj3r6TzyiteecQ4v\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', NULL, 13, 73, NULL, '2021-09-06 23:12:33', '2021-09-06 23:14:02', NULL, '');
INSERT INTO `cart_items` VALUES (59, 1, 'sku-18', 'simple', 'Product 18', NULL, 0.5000, 0.5000, 0.5000, 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"k7mOuYbfSczCvzANjt9l1Ad4hj3r6TzyiteecQ4v\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"18\"}', NULL, 18, 74, NULL, '2021-09-06 23:19:44', '2021-09-06 23:19:59', NULL, '');
INSERT INTO `cart_items` VALUES (60, 1, 'test6', 'simple', 'Product 9 Product 9 Product 9 Product 9 Product 9', NULL, 4.0000, 4.0000, 4.0000, 100000.0000, 100000.0000, 100000.0000, 100000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"k7mOuYbfSczCvzANjt9l1Ad4hj3r6TzyiteecQ4v\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"9\"}', NULL, 9, 75, NULL, '2021-09-06 23:22:51', '2021-09-06 23:23:08', NULL, '');
INSERT INTO `cart_items` VALUES (61, 1, 'sku-18', 'simple', 'Product 18', NULL, 0.5000, 0.5000, 0.5000, 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"cfsV6QrgFWr00Z9GHqjDvHfLXQritpleMCIzh2tM\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"18\"}', NULL, 18, 76, NULL, '2021-09-12 11:07:46', '2021-09-12 11:08:09', NULL, '');
INSERT INTO `cart_items` VALUES (62, 1, 'sku-18', 'simple', 'Product 18', NULL, 0.5000, 0.5000, 0.5000, 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"cfsV6QrgFWr00Z9GHqjDvHfLXQritpleMCIzh2tM\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"18\"}', NULL, 18, 77, NULL, '2021-09-12 11:31:15', '2021-09-12 11:49:30', NULL, '');
INSERT INTO `cart_items` VALUES (63, 1, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 4.0000, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"cfsV6QrgFWr00Z9GHqjDvHfLXQritpleMCIzh2tM\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', NULL, 13, 78, NULL, '2021-09-12 11:54:28', '2021-09-12 11:58:22', NULL, '');
INSERT INTO `cart_items` VALUES (64, 1, 'asmdamsd', 'simple', 'Product 14', NULL, 1.0000, 1.0000, 1.0000, 20000.0000, 20000.0000, 20000.0000, 20000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"cfsV6QrgFWr00Z9GHqjDvHfLXQritpleMCIzh2tM\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"14\"}', NULL, 14, 79, NULL, '2021-09-12 12:00:39', '2021-09-12 16:02:42', NULL, '');
INSERT INTO `cart_items` VALUES (65, 1, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 4.0000, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"rxMYMPIc6QCui3g53N5YtGdGJ7x78Bo6NrX1sRpW\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', NULL, 13, 80, NULL, '2021-09-16 18:22:20', '2021-09-16 20:59:52', NULL, '');
INSERT INTO `cart_items` VALUES (67, 1, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 4.0000, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"vheHVL3upuNUL4YTiOqzVGPUsutjfhfbwFMcEn4s\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', NULL, 13, 82, NULL, '2021-09-18 16:15:57', '2021-09-19 23:09:13', NULL, '');
INSERT INTO `cart_items` VALUES (69, 6, 'asmdamsd', 'simple', 'Product 14', NULL, 1.0000, 6.0000, 6.0000, 19000.0000, 19000.0000, 114000.0000, 114000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"quantity\": 6, \"product_id\": 14}', NULL, 14, 83, NULL, '2021-09-18 16:57:43', '2021-09-19 19:27:12', NULL, '');
INSERT INTO `cart_items` VALUES (70, 1, 'sku-18', 'simple', 'Product 18', NULL, 0.5000, 0.5000, 0.5000, 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"XBw5IczuRxkHiaQVgHvL3SngQmhcI6b4rJSH899j\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"18\"}', NULL, 18, 83, NULL, '2021-09-19 17:24:56', '2021-09-19 19:27:12', NULL, '');
INSERT INTO `cart_items` VALUES (71, 1, 'lalala', 'simple', 'Product 6', NULL, 5.0000, 5.0000, 5.0000, 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"XBw5IczuRxkHiaQVgHvL3SngQmhcI6b4rJSH899j\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"6\"}', NULL, 6, 83, NULL, '2021-09-19 17:25:02', '2021-09-19 19:27:12', NULL, '');
INSERT INTO `cart_items` VALUES (72, 1, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 4.0000, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"XBw5IczuRxkHiaQVgHvL3SngQmhcI6b4rJSH899j\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', NULL, 13, 84, NULL, '2021-09-19 19:30:41', '2021-09-19 19:33:47', NULL, '');
INSERT INTO `cart_items` VALUES (73, 1, 'lalala', 'simple', 'Product 6', NULL, 5.0000, 5.0000, 5.0000, 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"_token\": \"sfumFGqoTtDJ5ZIBoBmQiHXgUcpmttgn1rUJomO4\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"6\"}', NULL, 6, 82, NULL, '2021-09-19 23:08:10', '2021-09-19 23:09:13', NULL, '');
INSERT INTO `cart_items` VALUES (75, 1, 'sku-18', 'simple', 'Product 18', NULL, 0.5000, 0.5000, 0.5000, 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"quantity\": 1, \"product_id\": 18}', NULL, 18, 86, NULL, '2021-09-26 18:43:37', '2021-09-29 22:54:02', NULL, '');
INSERT INTO `cart_items` VALUES (76, 1, 'lalala', 'simple', 'Product 6', NULL, 5.0000, 5.0000, 5.0000, 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"quantity\": 1, \"product_id\": 6}', NULL, 6, 86, NULL, '2021-09-26 18:43:43', '2021-09-29 22:54:02', NULL, '');
INSERT INTO `cart_items` VALUES (77, 1, 'lalala', 'simple', 'Product 6', NULL, 5.0000, 5.0000, 5.0000, 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"quantity\": 1, \"product_id\": 6}', NULL, 6, 87, NULL, '2021-09-29 23:04:44', '2021-09-29 23:06:42', NULL, '');
INSERT INTO `cart_items` VALUES (78, 1, 'lalala', 'simple', 'Product 6', NULL, 5.0000, 5.0000, 5.0000, 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"quantity\": 1, \"product_id\": 6}', NULL, 6, 88, NULL, '2021-09-29 23:08:42', '2021-09-30 11:22:51', NULL, '');
INSERT INTO `cart_items` VALUES (79, 1, 'lalala', 'simple', 'Product 6', NULL, 5.0000, 5.0000, 5.0000, 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"quantity\": 1, \"product_id\": 6}', NULL, 6, 89, NULL, '2021-09-30 11:31:18', '2021-09-30 11:31:58', NULL, '');
INSERT INTO `cart_items` VALUES (80, 1, 'sku-18', 'simple', 'Product 18', NULL, 0.5000, 0.5000, 0.5000, 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"quantity\": 1, \"product_id\": 18}', NULL, 18, 90, NULL, '2021-09-30 15:21:26', '2021-10-01 13:44:54', NULL, '');
INSERT INTO `cart_items` VALUES (82, 1, 'lalala', 'simple', 'Product 6', NULL, 5.0000, 5.0000, 5.0000, 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"quantity\": 1, \"product_id\": 6}', NULL, 6, 91, NULL, '2021-10-01 14:15:23', '2021-10-01 14:15:59', NULL, '');
INSERT INTO `cart_items` VALUES (83, 1, 'lalala', 'simple', 'Product 6', NULL, 5.0000, 5.0000, 5.0000, 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"quantity\": 1, \"product_id\": 6}', NULL, 6, 92, NULL, '2021-10-01 14:18:00', '2021-10-01 14:18:34', NULL, '');
INSERT INTO `cart_items` VALUES (84, 2, 'lalala', 'simple', 'Product 6', NULL, 5.0000, 10.0000, 10.0000, 40.0000, 40.0000, 80.0000, 80.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"quantity\": 2, \"product_id\": 6}', NULL, 6, 93, NULL, '2021-10-04 16:33:48', '2021-10-08 10:31:19', NULL, '');
INSERT INTO `cart_items` VALUES (87, 4, 'sku-18', 'simple', 'Product 18', NULL, 0.5000, 2.0000, 2.0000, 8000.0000, 8000.0000, 32000.0000, 32000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '{\"quantity\": 4, \"product_id\": 18}', NULL, 18, 96, NULL, '2021-10-22 18:27:43', '2021-10-22 19:00:58', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for cart_payment
-- ----------------------------
DROP TABLE IF EXISTS `cart_payment`;
CREATE TABLE `cart_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_payment_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cart_payment
-- ----------------------------
BEGIN;
INSERT INTO `cart_payment` VALUES (7, 'cashondelivery', NULL, 1, '2021-05-01 14:20:15', '2021-05-01 14:20:15');
INSERT INTO `cart_payment` VALUES (13, 'paypal_smart_button', NULL, 2, '2021-05-01 14:34:27', '2021-05-01 14:34:27');
INSERT INTO `cart_payment` VALUES (14, 'cashondelivery', NULL, 8, '2021-05-29 13:14:48', '2021-05-29 13:14:48');
INSERT INTO `cart_payment` VALUES (15, 'cashondelivery', NULL, 9, '2021-05-29 13:29:32', '2021-05-29 13:29:32');
INSERT INTO `cart_payment` VALUES (16, 'cashondelivery', NULL, 16, '2021-06-27 13:48:22', '2021-06-27 13:48:22');
INSERT INTO `cart_payment` VALUES (17, 'cashondelivery', NULL, 17, '2021-06-27 14:13:35', '2021-06-27 14:13:35');
INSERT INTO `cart_payment` VALUES (19, 'cashondelivery', NULL, 18, '2021-06-27 14:19:40', '2021-06-27 14:19:40');
INSERT INTO `cart_payment` VALUES (20, 'cashondelivery', NULL, 19, '2021-06-27 14:38:33', '2021-06-27 14:38:33');
INSERT INTO `cart_payment` VALUES (21, 'cashondelivery', NULL, 20, '2021-06-29 20:58:52', '2021-06-29 20:58:52');
INSERT INTO `cart_payment` VALUES (22, 'cashondelivery', NULL, 23, '2021-06-29 21:05:44', '2021-06-29 21:05:44');
INSERT INTO `cart_payment` VALUES (23, 'cashondelivery', NULL, 24, '2021-07-21 18:11:54', '2021-07-21 18:11:54');
INSERT INTO `cart_payment` VALUES (24, 'cashondelivery', NULL, 26, '2021-07-21 18:17:34', '2021-07-21 18:17:34');
INSERT INTO `cart_payment` VALUES (25, 'cashondelivery', NULL, 27, '2021-07-21 18:26:04', '2021-07-21 18:26:04');
INSERT INTO `cart_payment` VALUES (26, 'cashondelivery', NULL, 28, '2021-07-21 18:29:27', '2021-07-21 18:29:27');
INSERT INTO `cart_payment` VALUES (27, 'cashondelivery', NULL, 29, '2021-07-21 18:38:25', '2021-07-21 18:38:25');
INSERT INTO `cart_payment` VALUES (28, 'cashondelivery', NULL, 30, '2021-07-21 18:42:05', '2021-07-21 18:42:05');
INSERT INTO `cart_payment` VALUES (29, 'cashondelivery', NULL, 31, '2021-07-21 18:54:12', '2021-07-21 18:54:12');
INSERT INTO `cart_payment` VALUES (30, 'cashondelivery', NULL, 32, '2021-07-21 19:09:22', '2021-07-21 19:09:22');
INSERT INTO `cart_payment` VALUES (31, 'cashondelivery', NULL, 33, '2021-07-21 19:12:56', '2021-07-21 19:12:56');
INSERT INTO `cart_payment` VALUES (32, 'cashondelivery', NULL, 34, '2021-07-21 21:21:38', '2021-07-21 21:21:38');
INSERT INTO `cart_payment` VALUES (34, 'moneytransfer', NULL, 35, '2021-07-21 21:24:24', '2021-07-21 21:24:24');
INSERT INTO `cart_payment` VALUES (35, 'cashondelivery', NULL, 36, '2021-07-21 21:27:37', '2021-07-21 21:27:37');
INSERT INTO `cart_payment` VALUES (113, 'cashondelivery', NULL, 42, '2021-08-31 20:27:25', '2021-08-31 20:27:25');
INSERT INTO `cart_payment` VALUES (122, 'cashondelivery', NULL, 44, '2021-08-31 22:43:17', '2021-08-31 22:43:17');
INSERT INTO `cart_payment` VALUES (123, 'cashondelivery', NULL, 45, '2021-08-31 22:46:21', '2021-08-31 22:46:21');
INSERT INTO `cart_payment` VALUES (124, 'cashondelivery', NULL, 46, '2021-08-31 22:49:47', '2021-08-31 22:49:47');
INSERT INTO `cart_payment` VALUES (125, 'cashondelivery', NULL, 47, '2021-08-31 22:55:25', '2021-08-31 22:55:25');
INSERT INTO `cart_payment` VALUES (132, 'moneytransfer', NULL, 48, '2021-08-31 23:08:04', '2021-08-31 23:08:04');
INSERT INTO `cart_payment` VALUES (133, 'moneytransfer', NULL, 49, '2021-08-31 23:11:25', '2021-08-31 23:11:25');
INSERT INTO `cart_payment` VALUES (137, 'cashondelivery', NULL, 57, '2021-09-04 14:14:01', '2021-09-04 14:14:01');
INSERT INTO `cart_payment` VALUES (141, 'cashondelivery', NULL, 62, '2021-09-04 16:31:43', '2021-09-04 16:31:43');
INSERT INTO `cart_payment` VALUES (143, 'cashondelivery', NULL, 63, '2021-09-04 16:43:16', '2021-09-04 16:43:16');
INSERT INTO `cart_payment` VALUES (144, 'cashondelivery', NULL, 64, '2021-09-04 16:54:37', '2021-09-04 16:54:37');
INSERT INTO `cart_payment` VALUES (145, 'moneytransfer', NULL, 65, '2021-09-04 17:05:32', '2021-09-04 17:05:32');
INSERT INTO `cart_payment` VALUES (146, 'cashondelivery', NULL, 66, '2021-09-04 17:19:36', '2021-09-04 17:19:36');
INSERT INTO `cart_payment` VALUES (149, 'cashondelivery', NULL, 67, '2021-09-04 17:26:01', '2021-09-04 17:26:01');
INSERT INTO `cart_payment` VALUES (157, 'cashondelivery', NULL, 68, '2021-09-04 19:00:02', '2021-09-04 19:00:02');
INSERT INTO `cart_payment` VALUES (158, 'cashondelivery', NULL, 72, '2021-09-06 22:45:54', '2021-09-06 22:45:54');
INSERT INTO `cart_payment` VALUES (163, 'cashondelivery', NULL, 73, '2021-09-06 23:13:56', '2021-09-06 23:13:56');
INSERT INTO `cart_payment` VALUES (165, 'moneytransfer', NULL, 74, '2021-09-06 23:19:58', '2021-09-06 23:19:58');
INSERT INTO `cart_payment` VALUES (166, 'cashondelivery', NULL, 75, '2021-09-06 23:23:06', '2021-09-06 23:23:06');
INSERT INTO `cart_payment` VALUES (167, 'cashondelivery', NULL, 76, '2021-09-12 11:07:59', '2021-09-12 11:07:59');
INSERT INTO `cart_payment` VALUES (169, 'moneytransfer', NULL, 77, '2021-09-12 11:49:25', '2021-09-12 11:49:25');
INSERT INTO `cart_payment` VALUES (171, 'moneytransfer', NULL, 78, '2021-09-12 11:58:15', '2021-09-12 11:58:15');
INSERT INTO `cart_payment` VALUES (172, 'cashondelivery', NULL, 79, '2021-09-12 16:02:23', '2021-09-12 16:02:23');
INSERT INTO `cart_payment` VALUES (177, 'cashondelivery', NULL, 80, '2021-09-16 20:59:49', '2021-09-16 20:59:49');
INSERT INTO `cart_payment` VALUES (336, 'cashondelivery', NULL, 83, '2021-09-19 19:27:09', '2021-09-19 19:27:09');
INSERT INTO `cart_payment` VALUES (346, 'cashondelivery', NULL, 84, '2021-09-19 19:33:47', '2021-09-19 19:33:47');
INSERT INTO `cart_payment` VALUES (348, 'cashondelivery', NULL, 82, '2021-09-19 23:09:08', '2021-09-19 23:09:08');
INSERT INTO `cart_payment` VALUES (355, 'moneytransfer', NULL, 86, '2021-09-29 22:53:29', '2021-09-29 22:53:29');
INSERT INTO `cart_payment` VALUES (356, 'moneytransfer', NULL, 87, '2021-09-29 23:06:39', '2021-09-29 23:06:39');
INSERT INTO `cart_payment` VALUES (360, 'moneytransfer', NULL, 88, '2021-09-30 11:22:37', '2021-09-30 11:22:37');
INSERT INTO `cart_payment` VALUES (361, 'moneytransfer', NULL, 89, '2021-09-30 11:31:56', '2021-09-30 11:31:56');
INSERT INTO `cart_payment` VALUES (368, 'moneytransfer', NULL, 90, '2021-10-01 13:44:48', '2021-10-01 13:44:48');
INSERT INTO `cart_payment` VALUES (371, 'cashondelivery', NULL, 91, '2021-10-01 14:15:58', '2021-10-01 14:15:58');
INSERT INTO `cart_payment` VALUES (378, 'cashondelivery', NULL, 92, '2021-10-01 14:18:32', '2021-10-01 14:18:32');
INSERT INTO `cart_payment` VALUES (380, 'moneytransfer', NULL, 93, '2021-10-08 10:31:19', '2021-10-08 10:31:19');
COMMIT;

-- ----------------------------
-- Table structure for cart_rule_channels
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_channels`;
CREATE TABLE `cart_rule_channels` (
  `cart_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`channel_id`),
  KEY `cart_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cart_rule_channels
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cart_rule_coupon_usage
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_coupon_usage`;
CREATE TABLE `cart_rule_coupon_usage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `times_used` int(11) NOT NULL DEFAULT '0',
  `cart_rule_coupon_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cart_rule_coupon_usage
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cart_rule_coupons
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_coupons`;
CREATE TABLE `cart_rule_coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usage_limit` int(10) unsigned NOT NULL DEFAULT '0',
  `usage_per_customer` int(10) unsigned NOT NULL DEFAULT '0',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`),
  CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cart_rule_coupons
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cart_rule_customer_groups
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_customer_groups`;
CREATE TABLE `cart_rule_customer_groups` (
  `cart_rule_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cart_rule_customer_groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cart_rule_customers
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_customers`;
CREATE TABLE `cart_rule_customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `times_used` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cart_rule_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  KEY `cart_rule_customers_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cart_rule_customers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cart_rule_translations
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_translations`;
CREATE TABLE `cart_rule_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `cart_rule_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`),
  CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cart_rule_translations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cart_rules
-- ----------------------------
DROP TABLE IF EXISTS `cart_rules`;
CREATE TABLE `cart_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `coupon_type` int(11) NOT NULL DEFAULT '1',
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT '0',
  `usage_per_customer` int(11) NOT NULL DEFAULT '0',
  `uses_per_coupon` int(11) NOT NULL DEFAULT '0',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_quantity` int(11) NOT NULL DEFAULT '1',
  `discount_step` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cart_rules
-- ----------------------------
BEGIN;
INSERT INTO `cart_rules` VALUES (2, 'Discount 10%', 'Giảm giá đơn hàng trên 500.000', '2021-04-13 00:00:00', '2021-04-16 12:00:00', 1, 0, 0, 0, 0, 0, 1, '[{\"value\": \"Phân bón tổng hợp\", \"operator\": \"==\", \"attribute\": \"product|name\", \"attribute_type\": \"text\"}]', 0, 0, 'by_percent', 500000.0000, 0, '0', 0, 0, 0, '2021-04-14 06:05:41', '2021-04-14 06:08:31');
COMMIT;

-- ----------------------------
-- Table structure for cart_shipping_rates
-- ----------------------------
DROP TABLE IF EXISTS `cart_shipping_rates`;
CREATE TABLE `cart_shipping_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carrier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT '0',
  `base_price` double DEFAULT '0',
  `cart_address_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cart_shipping_rates_cart_address_id_foreign` (`cart_address_id`),
  CONSTRAINT `cart_shipping_rates_cart_address_id_foreign` FOREIGN KEY (`cart_address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cart_shipping_rates
-- ----------------------------
BEGIN;
INSERT INTO `cart_shipping_rates` VALUES (5, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 20, 20, 19, '2021-05-01 14:19:13', '2021-05-01 14:19:44', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (6, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 19, '2021-05-01 14:19:13', '2021-05-01 14:20:24', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (9, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 24, '2021-05-01 14:33:23', '2021-05-01 14:33:23', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (10, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 24, '2021-05-01 14:33:23', '2021-05-01 14:34:30', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (117, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 32, '2021-05-29 13:14:21', '2021-05-29 13:14:53', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (118, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 32, '2021-05-29 13:14:21', '2021-05-29 13:14:21', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (119, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 36, '2021-05-29 13:29:27', '2021-05-29 13:29:27', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (120, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 36, '2021-05-29 13:29:27', '2021-05-29 13:29:37', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (123, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 41, '2021-06-27 13:46:29', '2021-06-27 13:49:12', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (124, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 41, '2021-06-27 13:46:29', '2021-06-27 13:46:29', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (125, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 46, '2021-06-27 14:13:29', '2021-06-27 14:13:38', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (126, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 46, '2021-06-27 14:13:29', '2021-06-27 14:13:29', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (127, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 50, '2021-06-27 14:19:33', '2021-06-27 14:19:33', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (128, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 50, '2021-06-27 14:19:33', '2021-06-27 14:29:21', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (129, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 54, '2021-06-27 14:38:29', '2021-06-27 14:38:35', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (130, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 54, '2021-06-27 14:38:29', '2021-06-27 14:38:29', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (133, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 58, '2021-06-29 20:58:32', '2021-06-29 20:59:14', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (134, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 58, '2021-06-29 20:58:32', '2021-06-29 20:58:32', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (135, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 62, '2021-06-29 21:05:40', '2021-06-29 21:05:46', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (136, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 62, '2021-06-29 21:05:40', '2021-06-29 21:05:40', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (181, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping VN', 10, 10, 68, '2021-06-29 21:59:29', '2021-06-29 22:01:38', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (182, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping alo', 0, 0, 68, '2021-06-29 21:59:29', '2021-06-29 22:01:40', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (183, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 20, 20, 66, '2021-07-21 18:11:29', '2021-07-21 18:11:59', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (184, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 66, '2021-07-21 18:11:29', '2021-07-21 18:11:29', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (185, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 30, 30, 72, '2021-07-21 18:17:26', '2021-07-21 18:18:06', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (186, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 72, '2021-07-21 18:17:26', '2021-07-21 18:17:26', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (187, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 20, 20, 76, '2021-07-21 18:25:49', '2021-07-21 18:26:16', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (188, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 76, '2021-07-21 18:25:49', '2021-07-21 18:25:49', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (189, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 80, '2021-07-21 18:29:23', '2021-07-21 18:29:29', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (190, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 80, '2021-07-21 18:29:23', '2021-07-21 18:29:23', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (191, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 20, 20, 84, '2021-07-21 18:38:20', '2021-07-21 18:38:26', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (192, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 84, '2021-07-21 18:38:20', '2021-07-21 18:38:20', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (193, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 30, 30, 88, '2021-07-21 18:41:05', '2021-07-21 18:42:07', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (194, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 88, '2021-07-21 18:41:05', '2021-07-21 18:41:05', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (195, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 40, 40, 92, '2021-07-21 18:54:01', '2021-07-21 18:54:15', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (196, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 92, '2021-07-21 18:54:01', '2021-07-21 18:54:01', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (197, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 96, '2021-07-21 19:08:55', '2021-07-21 19:09:25', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (198, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 96, '2021-07-21 19:08:55', '2021-07-21 19:08:55', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (199, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 100, '2021-07-21 19:12:52', '2021-07-21 19:13:05', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (200, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 100, '2021-07-21 19:12:52', '2021-07-21 19:12:52', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (201, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 20, 20, 104, '2021-07-21 21:20:57', '2021-07-21 21:21:52', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (202, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 104, '2021-07-21 21:20:57', '2021-07-21 21:20:57', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (203, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 108, '2021-07-21 21:24:01', '2021-07-21 21:24:01', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (204, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 108, '2021-07-21 21:24:01', '2021-07-21 21:24:27', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (205, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 80, 80, 112, '2021-07-21 21:27:27', '2021-07-21 21:27:40', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (206, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 112, '2021-07-21 21:27:27', '2021-07-21 21:27:27', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (323, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 20, 20, 116, '2021-08-31 20:27:10', '2021-08-31 20:27:16', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (324, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 116, '2021-08-31 20:27:10', '2021-08-31 20:27:41', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (333, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 120, '2021-08-31 22:42:41', '2021-08-31 22:42:45', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (334, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 120, '2021-08-31 22:42:41', '2021-08-31 22:43:20', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (335, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 124, '2021-08-31 22:45:41', '2021-08-31 22:45:41', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (336, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 124, '2021-08-31 22:45:41', '2021-08-31 22:46:23', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (337, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 128, '2021-08-31 22:49:44', '2021-08-31 22:49:44', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (338, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 128, '2021-08-31 22:49:44', '2021-08-31 22:49:49', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (339, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 132, '2021-08-31 22:55:22', '2021-08-31 22:55:22', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (340, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 132, '2021-08-31 22:55:22', '2021-08-31 22:55:29', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (341, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 136, '2021-08-31 23:07:53', '2021-08-31 23:07:53', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (342, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 136, '2021-08-31 23:07:53', '2021-08-31 23:09:00', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (343, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 140, '2021-08-31 23:11:22', '2021-08-31 23:11:22', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (344, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 140, '2021-08-31 23:11:22', '2021-08-31 23:11:35', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (371, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 150, '2021-09-04 12:08:18', '2021-09-04 12:08:18', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (372, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 150, '2021-09-04 12:08:18', '2021-09-04 12:08:18', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (387, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 30, 30, 166, '2021-09-04 14:13:47', '2021-09-04 14:13:49', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (388, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 166, '2021-09-04 14:13:47', '2021-09-04 14:14:06', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (441, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 170, '2021-09-04 16:27:02', '2021-09-04 16:27:02', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (442, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 170, '2021-09-04 16:27:02', '2021-09-04 16:31:54', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (445, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 174, '2021-09-04 16:41:16', '2021-09-04 16:43:18', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (446, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 174, '2021-09-04 16:41:16', '2021-09-04 16:41:16', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (447, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 178, '2021-09-04 16:54:33', '2021-09-04 16:54:40', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (448, 'free', 'Free Shipping VN', 'free_free', 'Free Shipping VN', 'Free Shipping VN', 0, 0, 178, '2021-09-04 16:54:33', '2021-09-04 16:54:33', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (449, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 182, '2021-09-04 17:00:44', '2021-09-04 17:00:44', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (450, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 182, '2021-09-04 17:00:44', '2021-09-04 17:05:40', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (451, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 186, '2021-09-04 17:19:17', '2021-09-04 17:19:17', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (452, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 186, '2021-09-04 17:19:17', '2021-09-04 17:20:57', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (453, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 20, 20, 190, '2021-09-04 17:25:53', '2021-09-04 17:25:53', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (454, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 190, '2021-09-04 17:25:53', '2021-09-04 17:26:07', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (479, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 194, '2021-09-04 18:59:52', '2021-09-04 18:59:52', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (480, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 194, '2021-09-04 18:59:52', '2021-09-04 19:00:05', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (481, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 198, '2021-09-06 22:45:50', '2021-09-06 22:45:50', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (482, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 198, '2021-09-06 22:45:50', '2021-09-06 22:45:58', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (485, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 202, '2021-09-06 23:13:49', '2021-09-06 23:13:49', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (486, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 202, '2021-09-06 23:13:49', '2021-09-06 23:14:02', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (487, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 208, '2021-09-06 23:19:50', '2021-09-06 23:19:50', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (488, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 208, '2021-09-06 23:19:50', '2021-09-06 23:19:59', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (489, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 212, '2021-09-06 23:23:03', '2021-09-06 23:23:03', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (490, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 212, '2021-09-06 23:23:03', '2021-09-06 23:23:08', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (491, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 216, '2021-09-12 11:07:56', '2021-09-12 11:07:56', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (492, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 216, '2021-09-12 11:07:56', '2021-09-12 11:08:09', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (493, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 220, '2021-09-12 11:48:44', '2021-09-12 11:48:44', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (494, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 220, '2021-09-12 11:48:44', '2021-09-12 11:49:30', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (495, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 224, '2021-09-12 11:55:27', '2021-09-12 11:55:27', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (496, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 224, '2021-09-12 11:55:27', '2021-09-12 11:58:22', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (497, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 228, '2021-09-12 16:02:19', '2021-09-12 16:02:19', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (498, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 228, '2021-09-12 16:02:19', '2021-09-12 16:02:42', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (501, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 232, '2021-09-16 20:59:39', '2021-09-16 20:59:39', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (502, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 232, '2021-09-16 20:59:39', '2021-09-16 20:59:52', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1079, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 80, 80, 236, '2021-09-19 19:26:53', '2021-09-19 19:27:12', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1080, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 236, '2021-09-19 19:26:53', '2021-09-19 19:26:53', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1085, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 240, '2021-09-19 19:33:34', '2021-09-19 19:33:47', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1086, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 240, '2021-09-19 19:33:34', '2021-09-19 19:33:34', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1087, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 20, 20, 242, '2021-09-19 23:08:28', '2021-09-19 23:09:13', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1088, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 242, '2021-09-19 23:08:28', '2021-09-19 23:08:28', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1149, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 20, 20, 249, '2021-09-29 22:52:57', '2021-09-29 22:52:57', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1150, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 249, '2021-09-29 22:52:57', '2021-09-29 22:54:02', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1153, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 253, '2021-09-29 23:05:28', '2021-09-29 23:05:28', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1154, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 253, '2021-09-29 23:05:28', '2021-09-29 23:06:42', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1167, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 262, '2021-09-30 11:31:53', '2021-09-30 11:31:53', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1168, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 262, '2021-09-30 11:31:53', '2021-09-30 11:31:58', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1197, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 267, '2021-10-01 13:44:13', '2021-10-01 13:44:13', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1198, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 267, '2021-10-01 13:44:13', '2021-10-01 13:44:55', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1201, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 272, '2021-10-01 14:15:52', '2021-10-01 14:15:52', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1202, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 272, '2021-10-01 14:15:52', '2021-10-01 14:15:59', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1203, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 10, 10, 276, '2021-10-01 14:18:08', '2021-10-01 14:18:34', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1204, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 276, '2021-10-01 14:18:08', '2021-10-01 14:18:08', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1221, 'flatrate', 'Flat Rate VN', 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', 20, 20, 280, '2021-10-08 10:30:24', '2021-10-08 10:30:24', 0.0000, 0.0000, 1);
INSERT INTO `cart_shipping_rates` VALUES (1222, 'free', 'Miễn phí ship', 'free_free', 'Miễn phí ship', 'Free Shipping VN', 0, 0, 280, '2021-10-08 10:30:24', '2021-10-08 10:31:19', 0.0000, 0.0000, 1);
COMMIT;

-- ----------------------------
-- Table structure for catalog_rule_channels
-- ----------------------------
DROP TABLE IF EXISTS `catalog_rule_channels`;
CREATE TABLE `catalog_rule_channels` (
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of catalog_rule_channels
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for catalog_rule_customer_groups
-- ----------------------------
DROP TABLE IF EXISTS `catalog_rule_customer_groups`;
CREATE TABLE `catalog_rule_customer_groups` (
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of catalog_rule_customer_groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for catalog_rule_product_prices
-- ----------------------------
DROP TABLE IF EXISTS `catalog_rule_product_prices`;
CREATE TABLE `catalog_rule_product_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of catalog_rule_product_prices
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for catalog_rule_products
-- ----------------------------
DROP TABLE IF EXISTS `catalog_rule_products`;
CREATE TABLE `catalog_rule_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_products_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of catalog_rule_products
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for catalog_rules
-- ----------------------------
DROP TABLE IF EXISTS `catalog_rules`;
CREATE TABLE `catalog_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of catalog_rules
-- ----------------------------
BEGIN;
INSERT INTO `catalog_rules` VALUES (1, 'Discount 10%', 'For bill from 500.000 đ\r\n', '2021-04-13', '2021-04-15', 1, 1, '[{\"value\": \"Phân bón tổng hợp\", \"operator\": \"==\", \"attribute\": \"product|name\", \"attribute_type\": \"text\"}]', 0, 'by_percent', 500000.0000, 0, '2021-03-31 17:32:41', '2021-04-14 05:47:06');
COMMIT;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `_lft` int(10) unsigned NOT NULL DEFAULT '0',
  `_rgt` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `display_mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'products_and_description',
  `category_icon_path` text COLLATE utf8mb4_unicode_ci,
  `additional` json DEFAULT NULL,
  `is_home` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` VALUES (1, 1, NULL, 1, 1, 18, NULL, '2021-07-07 17:16:38', '2021-07-07 17:16:38', 'products_and_description', NULL, NULL, 0);
INSERT INTO `categories` VALUES (5, 1, NULL, 1, 14, 15, 1, '2021-07-07 21:37:46', '2021-07-07 21:37:46', 'products_and_description', NULL, NULL, 0);
INSERT INTO `categories` VALUES (6, 4, NULL, 1, 16, 17, 1, '2021-08-22 13:03:57', '2021-08-22 13:03:57', 'products_and_description', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for category_filterable_attributes
-- ----------------------------
DROP TABLE IF EXISTS `category_filterable_attributes`;
CREATE TABLE `category_filterable_attributes` (
  `category_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of category_filterable_attributes
-- ----------------------------
BEGIN;
INSERT INTO `category_filterable_attributes` VALUES (5, 11);
INSERT INTO `category_filterable_attributes` VALUES (6, 11);
COMMIT;

-- ----------------------------
-- Table structure for category_translations
-- ----------------------------
DROP TABLE IF EXISTS `category_translations`;
CREATE TABLE `category_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `category_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale_id` int(10) unsigned DEFAULT NULL,
  `url_path` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'maintained by database triggers',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  KEY `category_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of category_translations
-- ----------------------------
BEGIN;
INSERT INTO `category_translations` VALUES (1, 'Root', 'root', 'Root', '', '', '', 1, 'vi', NULL, '');
INSERT INTO `category_translations` VALUES (6, 'Phân bón', 'phan-bon', '<p>test</p>\r\n<p>&nbsp;</p>', '', '', '', 5, 'vi', 5, 'phan-bon');
INSERT INTO `category_translations` VALUES (7, 'test', 'test', '<p>test</p>\r\n<p>&nbsp;</p>', '', '', '', 5, 'en', 1, 'test');
INSERT INTO `category_translations` VALUES (8, 'Thuốc sâu', 'thuoc-sau', '<p>Thuốc s&acirc;u</p>\r\n<p>&nbsp;</p>', '', '', '', 6, 'vi', 5, 'thuoc-sau');
INSERT INTO `category_translations` VALUES (9, 'Thuốc sâu', 'thuoc-sau', '<p>Thuốc s&acirc;u</p>\r\n<p>&nbsp;</p>', '', '', '', 6, 'en', 1, 'thuoc-sau');
COMMIT;

-- ----------------------------
-- Table structure for channel_currencies
-- ----------------------------
DROP TABLE IF EXISTS `channel_currencies`;
CREATE TABLE `channel_currencies` (
  `channel_id` int(10) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`currency_id`),
  KEY `channel_currencies_currency_id_foreign` (`currency_id`),
  CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of channel_currencies
-- ----------------------------
BEGIN;
INSERT INTO `channel_currencies` VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for channel_inventory_sources
-- ----------------------------
DROP TABLE IF EXISTS `channel_inventory_sources`;
CREATE TABLE `channel_inventory_sources` (
  `channel_id` int(10) unsigned NOT NULL,
  `inventory_source_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `channel_inventory_sources_channel_id_inventory_source_id_unique` (`channel_id`,`inventory_source_id`),
  KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of channel_inventory_sources
-- ----------------------------
BEGIN;
INSERT INTO `channel_inventory_sources` VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for channel_locales
-- ----------------------------
DROP TABLE IF EXISTS `channel_locales`;
CREATE TABLE `channel_locales` (
  `channel_id` int(10) unsigned NOT NULL,
  `locale_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`locale_id`),
  KEY `channel_locales_locale_id_foreign` (`locale_id`),
  CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of channel_locales
-- ----------------------------
BEGIN;
INSERT INTO `channel_locales` VALUES (1, 1);
INSERT INTO `channel_locales` VALUES (1, 5);
COMMIT;

-- ----------------------------
-- Table structure for channel_translations
-- ----------------------------
DROP TABLE IF EXISTS `channel_translations`;
CREATE TABLE `channel_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `home_page_content` text COLLATE utf8mb4_unicode_ci,
  `footer_content` text COLLATE utf8mb4_unicode_ci,
  `maintenance_mode_text` text COLLATE utf8mb4_unicode_ci,
  `home_seo` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  KEY `channel_translations_locale_index` (`locale`),
  CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of channel_translations
-- ----------------------------
BEGIN;
INSERT INTO `channel_translations` VALUES (1, 1, 'en', 'Default', '', '<p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p>\r\n<div class=\"banner-container\">\r\n<div class=\"left-banner\"><img src=\"../../../themes/default/assets/images/1.webp\" data-src=\"http://localhost:8000/themes/default/assets/images/1.webp\" class=\"lazyload\" alt=\"test\" width=\"720\" height=\"720\" /></div>\r\n<div class=\"right-banner\"><img src=\"../../../themes/default/assets/images/2.webp\" data-src=\"http://localhost:8000/themes/default/assets/images/2.webp\" class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" /> <img src=\"../../../themes/default/assets/images/3.webp\" data-src=\"http://localhost:8000/themes/default/assets/images/3.webp\" class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" /></div>\r\n</div>', '<div class=\"list-container\"><span class=\"list-heading\">Quick Links</span>\r\n<ul class=\"list-group\">\r\n<li><a href=\"@php echo route(\'shop.cms.page\', \'about-us\') @endphp\">About Us</a></li>\r\n<li><a href=\"@php echo route(\'shop.cms.page\', \'return-policy\') @endphp\">Return Policy</a></li>\r\n<li><a href=\"@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp\">Refund Policy</a></li>\r\n<li><a href=\"@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp\">Terms and conditions</a></li>\r\n<li><a href=\"@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp\">Terms of Use</a></li>\r\n<li><a href=\"@php echo route(\'shop.cms.page\', \'contact-us\') @endphp\">Contact Us</a></li>\r\n</ul>\r\n</div>\r\n<div class=\"list-container\"><span class=\"list-heading\">Connect With Us</span>\r\n<ul class=\"list-group\">\r\n<li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\r\n<li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\r\n<li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\r\n<li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\r\n<li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\r\n</ul>\r\n</div>', '', '{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}', NULL, '2021-07-07 17:35:03');
INSERT INTO `channel_translations` VALUES (2, 1, 'fr', 'Default', NULL, '\n                    <p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p>\n                        <div class=\"banner-container\">\n                        <div class=\"left-banner\">\n                            <img src=http://localhost:8000/themes/default/assets/images/1.webp data-src=http://localhost:8000/themes/default/assets/images/1.webp class=\"lazyload\" alt=\"test\" width=\"720\" height=\"720\" />\n                        </div>\n                        <div class=\"right-banner\">\n                            <img src=http://localhost:8000/themes/default/assets/images/2.webp data-src=http://localhost:8000/themes/default/assets/images/2.webp class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                            <img src=http://localhost:8000/themes/default/assets/images/3.webp data-src=http://localhost:8000/themes/default/assets/images/3.webp  class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                        </div>\n                    </div>\n                ', '\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Quick Links</span>\n                        <ul class=\"list-group\">\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'about-us\') @endphp\">About Us</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'return-policy\') @endphp\">Return Policy</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp\">Refund Policy</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp\">Terms and conditions</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp\">Terms of Use</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'contact-us\') @endphp\">Contact Us</a></li>\n                        </ul>\n                    </div>\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Connect With Us</span>\n                            <ul class=\"list-group\">\n                                <li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\n                            </ul>\n                        </div>\n                ', NULL, '{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}', NULL, NULL);
INSERT INTO `channel_translations` VALUES (3, 1, 'nl', 'Default', NULL, '\n                    <p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p>\n                        <div class=\"banner-container\">\n                        <div class=\"left-banner\">\n                            <img src=http://localhost:8000/themes/default/assets/images/1.webp data-src=http://localhost:8000/themes/default/assets/images/1.webp class=\"lazyload\" alt=\"test\" width=\"720\" height=\"720\" />\n                        </div>\n                        <div class=\"right-banner\">\n                            <img src=http://localhost:8000/themes/default/assets/images/2.webp data-src=http://localhost:8000/themes/default/assets/images/2.webp class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                            <img src=http://localhost:8000/themes/default/assets/images/3.webp data-src=http://localhost:8000/themes/default/assets/images/3.webp  class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                        </div>\n                    </div>\n                ', '\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Quick Links</span>\n                        <ul class=\"list-group\">\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'about-us\') @endphp\">About Us</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'return-policy\') @endphp\">Return Policy</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp\">Refund Policy</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp\">Terms and conditions</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp\">Terms of Use</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'contact-us\') @endphp\">Contact Us</a></li>\n                        </ul>\n                    </div>\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Connect With Us</span>\n                            <ul class=\"list-group\">\n                                <li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\n                            </ul>\n                        </div>\n                ', NULL, '{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}', NULL, NULL);
INSERT INTO `channel_translations` VALUES (4, 1, 'tr', 'Default', NULL, '\n                    <p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p>\n                        <div class=\"banner-container\">\n                        <div class=\"left-banner\">\n                            <img src=http://localhost:8000/themes/default/assets/images/1.webp data-src=http://localhost:8000/themes/default/assets/images/1.webp class=\"lazyload\" alt=\"test\" width=\"720\" height=\"720\" />\n                        </div>\n                        <div class=\"right-banner\">\n                            <img src=http://localhost:8000/themes/default/assets/images/2.webp data-src=http://localhost:8000/themes/default/assets/images/2.webp class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                            <img src=http://localhost:8000/themes/default/assets/images/3.webp data-src=http://localhost:8000/themes/default/assets/images/3.webp  class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\n                        </div>\n                    </div>\n                ', '\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Quick Links</span>\n                        <ul class=\"list-group\">\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'about-us\') @endphp\">About Us</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'return-policy\') @endphp\">Return Policy</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp\">Refund Policy</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp\">Terms and conditions</a></li>\n                            <li><a href=\"@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp\">Terms of Use</a></li><li><a href=\"@php echo route(\'shop.cms.page\', \'contact-us\') @endphp\">Contact Us</a></li>\n                        </ul>\n                    </div>\n                    <div class=\"list-container\">\n                        <span class=\"list-heading\">Connect With Us</span>\n                            <ul class=\"list-group\">\n                                <li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\n                                <li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\n                                <li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\n                            </ul>\n                        </div>\n                ', NULL, '{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}', NULL, NULL);
INSERT INTO `channel_translations` VALUES (5, 1, 'vi', 'Default', '', '<p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p>\r\n<div class=\"banner-container\">\r\n<div class=\"left-banner\"><img src=\"../../../themes/default/assets/images/1.webp\" data-src=\"http://localhost:8000/themes/default/assets/images/1.webp\" class=\"lazyload\" alt=\"test\" width=\"720\" height=\"720\" /></div>\r\n<div class=\"right-banner\"><img src=\"../../../themes/default/assets/images/2.webp\" data-src=\"http://localhost:8000/themes/default/assets/images/2.webp\" class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" /> <img src=\"../../../themes/default/assets/images/3.webp\" data-src=\"http://localhost:8000/themes/default/assets/images/3.webp\" class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" /></div>\r\n</div>', '<div class=\"list-container\"><span class=\"list-heading\">Quick Links</span>\r\n<ul class=\"list-group\">\r\n<li><a href=\"@php echo route(\'shop.cms.page\', \'about-us\') @endphp\">About Us</a></li>\r\n<li><a href=\"@php echo route(\'shop.cms.page\', \'return-policy\') @endphp\">Return Policy</a></li>\r\n<li><a href=\"@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp\">Refund Policy</a></li>\r\n<li><a href=\"@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp\">Terms and conditions</a></li>\r\n<li><a href=\"@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp\">Terms of Use</a></li>\r\n<li><a href=\"@php echo route(\'shop.cms.page\', \'contact-us\') @endphp\">Contact Us</a></li>\r\n</ul>\r\n</div>\r\n<div class=\"list-container\"><span class=\"list-heading\">Connect With Us</span>\r\n<ul class=\"list-group\">\r\n<li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\r\n<li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\r\n<li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\r\n<li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\r\n<li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\r\n</ul>\r\n</div>', '', '{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}', '2021-07-07 17:33:14', '2021-07-10 17:11:55');
COMMIT;

-- ----------------------------
-- Table structure for channels
-- ----------------------------
DROP TABLE IF EXISTS `channels`;
CREATE TABLE `channels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_ips` text COLLATE utf8mb4_unicode_ci,
  `default_locale_id` int(10) unsigned NOT NULL,
  `base_currency_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `root_category_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  KEY `channels_base_currency_id_foreign` (`base_currency_id`),
  KEY `channels_root_category_id_foreign` (`root_category_id`),
  CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of channels
-- ----------------------------
BEGIN;
INSERT INTO `channels` VALUES (1, 'default', NULL, 'velocity', 'http://localhost:8000', NULL, NULL, 0, '', 5, 1, NULL, '2021-07-10 17:11:55', 1);
COMMIT;

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cities_country_id_index` (`country_id`),
  CONSTRAINT `cities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cities
-- ----------------------------
BEGIN;
INSERT INTO `cities` VALUES (1, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (2, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (3, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (4, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (5, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (6, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (7, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (8, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (9, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (10, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (11, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (12, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (13, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (14, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (15, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (16, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (17, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (18, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (19, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (20, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (21, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (22, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (23, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (24, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (25, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (26, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (27, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (28, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (29, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (30, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (31, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (32, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (33, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (34, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (35, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (36, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (37, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (38, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (39, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (40, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (41, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (42, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (43, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (44, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (45, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (46, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (47, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (48, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (49, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (50, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (51, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (52, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (53, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (54, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (55, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (56, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (57, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (58, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (59, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (60, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (61, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (62, 250, 1, NULL, NULL);
INSERT INTO `cities` VALUES (63, 250, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for city_translations
-- ----------------------------
DROP TABLE IF EXISTS `city_translations`;
CREATE TABLE `city_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_translations_city_id_foreign` (`city_id`),
  CONSTRAINT `city_translations_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of city_translations
-- ----------------------------
BEGIN;
INSERT INTO `city_translations` VALUES (1, 'vi', 'Hà Nội', 1, NULL, NULL);
INSERT INTO `city_translations` VALUES (2, 'en', 'Ha Noi', 1, NULL, NULL);
INSERT INTO `city_translations` VALUES (3, 'vi', 'Hà Giang', 2, NULL, NULL);
INSERT INTO `city_translations` VALUES (4, 'en', 'Ha Giang', 2, NULL, NULL);
INSERT INTO `city_translations` VALUES (5, 'vi', 'Cao Bằng', 3, NULL, NULL);
INSERT INTO `city_translations` VALUES (6, 'en', 'Cao Bang', 3, NULL, NULL);
INSERT INTO `city_translations` VALUES (7, 'vi', 'Bắc Kạn', 4, NULL, NULL);
INSERT INTO `city_translations` VALUES (8, 'en', 'Bac Kan', 4, NULL, NULL);
INSERT INTO `city_translations` VALUES (9, 'vi', 'Tuyên Quang', 5, NULL, NULL);
INSERT INTO `city_translations` VALUES (10, 'en', 'Tuyen Quang', 5, NULL, NULL);
INSERT INTO `city_translations` VALUES (11, 'vi', 'Lào Cai', 6, NULL, NULL);
INSERT INTO `city_translations` VALUES (12, 'en', 'Lao Cai', 6, NULL, NULL);
INSERT INTO `city_translations` VALUES (13, 'vi', 'Điện Biên', 7, NULL, NULL);
INSERT INTO `city_translations` VALUES (14, 'en', 'Dien Bien', 7, NULL, NULL);
INSERT INTO `city_translations` VALUES (15, 'vi', 'Lai Châu', 8, NULL, NULL);
INSERT INTO `city_translations` VALUES (16, 'en', 'Lai Chau', 8, NULL, NULL);
INSERT INTO `city_translations` VALUES (17, 'vi', 'Sơn La', 9, NULL, NULL);
INSERT INTO `city_translations` VALUES (18, 'en', 'Son La', 9, NULL, NULL);
INSERT INTO `city_translations` VALUES (19, 'vi', 'Yên Bái', 10, NULL, NULL);
INSERT INTO `city_translations` VALUES (20, 'en', 'Yen Bai', 10, NULL, NULL);
INSERT INTO `city_translations` VALUES (21, 'vi', 'Hòa Bình', 11, NULL, NULL);
INSERT INTO `city_translations` VALUES (22, 'en', 'Hoa Binh', 11, NULL, NULL);
INSERT INTO `city_translations` VALUES (23, 'vi', 'Thái Nguyên', 12, NULL, NULL);
INSERT INTO `city_translations` VALUES (24, 'en', 'Thai Nguyen', 12, NULL, NULL);
INSERT INTO `city_translations` VALUES (25, 'vi', 'Lạng Sơn', 13, NULL, NULL);
INSERT INTO `city_translations` VALUES (26, 'en', 'Lang Son', 13, NULL, NULL);
INSERT INTO `city_translations` VALUES (27, 'vi', 'Quảng Ninh', 14, NULL, NULL);
INSERT INTO `city_translations` VALUES (28, 'en', 'Quang Ninh', 14, NULL, NULL);
INSERT INTO `city_translations` VALUES (29, 'vi', 'Bắc Giang', 15, NULL, NULL);
INSERT INTO `city_translations` VALUES (30, 'en', 'Bac Giang', 15, NULL, NULL);
INSERT INTO `city_translations` VALUES (31, 'vi', 'Phú Thọ', 16, NULL, NULL);
INSERT INTO `city_translations` VALUES (32, 'en', 'Phu Tho', 16, NULL, NULL);
INSERT INTO `city_translations` VALUES (33, 'vi', 'Vĩnh Phúc', 17, NULL, NULL);
INSERT INTO `city_translations` VALUES (34, 'en', 'Vinh Phuc', 17, NULL, NULL);
INSERT INTO `city_translations` VALUES (35, 'vi', 'Bắc Ninh', 18, NULL, NULL);
INSERT INTO `city_translations` VALUES (36, 'en', 'Bac Ninh', 18, NULL, NULL);
INSERT INTO `city_translations` VALUES (37, 'vi', 'Hải Dương', 19, NULL, NULL);
INSERT INTO `city_translations` VALUES (38, 'en', 'Hai Duong', 19, NULL, NULL);
INSERT INTO `city_translations` VALUES (39, 'vi', 'Hải Phòng', 20, NULL, NULL);
INSERT INTO `city_translations` VALUES (40, 'en', 'Hai Phong', 20, NULL, NULL);
INSERT INTO `city_translations` VALUES (41, 'vi', 'Hưng Yên', 21, NULL, NULL);
INSERT INTO `city_translations` VALUES (42, 'en', 'Hung Yen', 21, NULL, NULL);
INSERT INTO `city_translations` VALUES (43, 'vi', 'Thái Bình', 22, NULL, NULL);
INSERT INTO `city_translations` VALUES (44, 'en', 'Thai Binh', 22, NULL, NULL);
INSERT INTO `city_translations` VALUES (45, 'vi', 'Hà Nam', 23, NULL, NULL);
INSERT INTO `city_translations` VALUES (46, 'en', 'Ha Nam', 23, NULL, NULL);
INSERT INTO `city_translations` VALUES (47, 'vi', 'Nam Định', 24, NULL, NULL);
INSERT INTO `city_translations` VALUES (48, 'en', 'Nam Dinh', 24, NULL, NULL);
INSERT INTO `city_translations` VALUES (49, 'vi', 'Ninh Bình', 25, NULL, NULL);
INSERT INTO `city_translations` VALUES (50, 'en', 'Ninh Binh', 25, NULL, NULL);
INSERT INTO `city_translations` VALUES (51, 'vi', 'Thanh Hóa', 26, NULL, NULL);
INSERT INTO `city_translations` VALUES (52, 'en', 'Thanh Hoa', 26, NULL, NULL);
INSERT INTO `city_translations` VALUES (53, 'vi', 'Nghệ An', 27, NULL, NULL);
INSERT INTO `city_translations` VALUES (54, 'en', 'Nghe An', 27, NULL, NULL);
INSERT INTO `city_translations` VALUES (55, 'vi', 'Hà Tĩnh', 28, NULL, NULL);
INSERT INTO `city_translations` VALUES (56, 'en', 'Ha Tinh', 28, NULL, NULL);
INSERT INTO `city_translations` VALUES (57, 'vi', 'Quảng Bình', 29, NULL, NULL);
INSERT INTO `city_translations` VALUES (58, 'en', 'Quang Binh', 29, NULL, NULL);
INSERT INTO `city_translations` VALUES (59, 'vi', 'Quảng Trị', 30, NULL, NULL);
INSERT INTO `city_translations` VALUES (60, 'en', 'Quang Tri', 30, NULL, NULL);
INSERT INTO `city_translations` VALUES (61, 'vi', 'Thừa Thiên Huế', 31, NULL, NULL);
INSERT INTO `city_translations` VALUES (62, 'en', 'Thua Thien Hue', 31, NULL, NULL);
INSERT INTO `city_translations` VALUES (63, 'vi', 'Đà Nẵng', 32, NULL, NULL);
INSERT INTO `city_translations` VALUES (64, 'en', 'Da Nang', 32, NULL, NULL);
INSERT INTO `city_translations` VALUES (65, 'vi', 'Quảng Nam', 33, NULL, NULL);
INSERT INTO `city_translations` VALUES (66, 'en', 'Quang Nam', 33, NULL, NULL);
INSERT INTO `city_translations` VALUES (67, 'vi', 'Quảng Ngãi', 34, NULL, NULL);
INSERT INTO `city_translations` VALUES (68, 'en', 'Quang Ngai', 34, NULL, NULL);
INSERT INTO `city_translations` VALUES (69, 'vi', 'Bình Định', 35, NULL, NULL);
INSERT INTO `city_translations` VALUES (70, 'en', 'Binh Dinh', 35, NULL, NULL);
INSERT INTO `city_translations` VALUES (71, 'vi', 'Phú Yên', 36, NULL, NULL);
INSERT INTO `city_translations` VALUES (72, 'en', 'Phu Yen', 36, NULL, NULL);
INSERT INTO `city_translations` VALUES (73, 'vi', 'Khánh Hòa', 37, NULL, NULL);
INSERT INTO `city_translations` VALUES (74, 'en', 'Khanh Hoa', 37, NULL, NULL);
INSERT INTO `city_translations` VALUES (75, 'vi', 'Ninh Thuận', 38, NULL, NULL);
INSERT INTO `city_translations` VALUES (76, 'en', 'Ninh Thuan', 38, NULL, NULL);
INSERT INTO `city_translations` VALUES (77, 'vi', 'Bình Thuận', 39, NULL, NULL);
INSERT INTO `city_translations` VALUES (78, 'en', 'Binh Thuan', 39, NULL, NULL);
INSERT INTO `city_translations` VALUES (79, 'vi', 'Kon Tum', 40, NULL, NULL);
INSERT INTO `city_translations` VALUES (80, 'en', 'Kon Tum', 40, NULL, NULL);
INSERT INTO `city_translations` VALUES (81, 'vi', 'Gia Lai', 41, NULL, NULL);
INSERT INTO `city_translations` VALUES (82, 'en', 'Gia Lai', 41, NULL, NULL);
INSERT INTO `city_translations` VALUES (83, 'vi', 'Đắk Lắk', 42, NULL, NULL);
INSERT INTO `city_translations` VALUES (84, 'en', 'Dak Lak', 42, NULL, NULL);
INSERT INTO `city_translations` VALUES (85, 'vi', 'Đắk Nông', 43, NULL, NULL);
INSERT INTO `city_translations` VALUES (86, 'en', 'Dak Nong', 43, NULL, NULL);
INSERT INTO `city_translations` VALUES (87, 'vi', 'Lâm Đồng', 44, NULL, NULL);
INSERT INTO `city_translations` VALUES (88, 'en', 'Lam Dong', 44, NULL, NULL);
INSERT INTO `city_translations` VALUES (89, 'vi', 'Bình Phước', 45, NULL, NULL);
INSERT INTO `city_translations` VALUES (90, 'en', 'Binh Phuoc', 45, NULL, NULL);
INSERT INTO `city_translations` VALUES (91, 'vi', 'Tây Ninh', 46, NULL, NULL);
INSERT INTO `city_translations` VALUES (92, 'en', 'Tay Ninh', 46, NULL, NULL);
INSERT INTO `city_translations` VALUES (93, 'vi', 'Bình Dương', 47, NULL, NULL);
INSERT INTO `city_translations` VALUES (94, 'en', 'Binh Duong', 47, NULL, NULL);
INSERT INTO `city_translations` VALUES (95, 'vi', 'Đồng Nai', 48, NULL, NULL);
INSERT INTO `city_translations` VALUES (96, 'en', 'Dong Nai', 48, NULL, NULL);
INSERT INTO `city_translations` VALUES (97, 'vi', 'Bà Rịa - Vũng Tàu', 49, NULL, NULL);
INSERT INTO `city_translations` VALUES (98, 'en', 'Ba Ria - Vung Tau', 49, NULL, NULL);
INSERT INTO `city_translations` VALUES (99, 'vi', 'Hồ Chí Minh', 50, NULL, NULL);
INSERT INTO `city_translations` VALUES (100, 'en', 'Ho Chi Minh', 50, NULL, NULL);
INSERT INTO `city_translations` VALUES (101, 'vi', 'Long An', 51, NULL, NULL);
INSERT INTO `city_translations` VALUES (102, 'en', 'Long An', 51, NULL, NULL);
INSERT INTO `city_translations` VALUES (103, 'vi', 'Tiền Giang', 52, NULL, NULL);
INSERT INTO `city_translations` VALUES (104, 'en', 'Tien Giang', 52, NULL, NULL);
INSERT INTO `city_translations` VALUES (105, 'vi', 'Bến Tre', 53, NULL, NULL);
INSERT INTO `city_translations` VALUES (106, 'en', 'Ben Tre', 53, NULL, NULL);
INSERT INTO `city_translations` VALUES (107, 'vi', 'Trà Vinh', 54, NULL, NULL);
INSERT INTO `city_translations` VALUES (108, 'en', 'Tra Vinh', 54, NULL, NULL);
INSERT INTO `city_translations` VALUES (109, 'vi', 'Vĩnh Long', 55, NULL, NULL);
INSERT INTO `city_translations` VALUES (110, 'en', 'Vinh Long', 55, NULL, NULL);
INSERT INTO `city_translations` VALUES (111, 'vi', 'Đồng Tháp', 56, NULL, NULL);
INSERT INTO `city_translations` VALUES (112, 'en', 'Dong Thap', 56, NULL, NULL);
INSERT INTO `city_translations` VALUES (113, 'vi', 'An Giang', 57, NULL, NULL);
INSERT INTO `city_translations` VALUES (114, 'en', 'An Giang', 57, NULL, NULL);
INSERT INTO `city_translations` VALUES (115, 'vi', 'Kiên Giang', 58, NULL, NULL);
INSERT INTO `city_translations` VALUES (116, 'en', 'Kien Giang', 58, NULL, NULL);
INSERT INTO `city_translations` VALUES (117, 'vi', 'Cần Thơ', 59, NULL, NULL);
INSERT INTO `city_translations` VALUES (118, 'en', 'Can Tho', 59, NULL, NULL);
INSERT INTO `city_translations` VALUES (119, 'vi', 'Hậu Giang', 60, NULL, NULL);
INSERT INTO `city_translations` VALUES (120, 'en', 'Hau Giang', 60, NULL, NULL);
INSERT INTO `city_translations` VALUES (121, 'vi', 'Sóc Trăng', 61, NULL, NULL);
INSERT INTO `city_translations` VALUES (122, 'en', 'Soc Trang', 61, NULL, NULL);
INSERT INTO `city_translations` VALUES (123, 'vi', 'Bạc Liêu', 62, NULL, NULL);
INSERT INTO `city_translations` VALUES (124, 'en', 'Bac Lieu', 62, NULL, NULL);
INSERT INTO `city_translations` VALUES (125, 'vi', 'Cà Mau', 63, NULL, NULL);
INSERT INTO `city_translations` VALUES (126, 'en', 'Ca Mau', 63, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for cms_page_channels
-- ----------------------------
DROP TABLE IF EXISTS `cms_page_channels`;
CREATE TABLE `cms_page_channels` (
  `cms_page_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  KEY `cms_page_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cms_page_channels
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cms_page_translations
-- ----------------------------
DROP TABLE IF EXISTS `cms_page_translations`;
CREATE TABLE `cms_page_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_content` longtext COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_page_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`),
  CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cms_page_translations
-- ----------------------------
BEGIN;
INSERT INTO `cms_page_translations` VALUES (133, 'About Us', 'about-us', '<div class=\"static-container\"><div class=\"mb-5\">About us page content</div></div>', 'about us', '', 'aboutus', 'en', 1);
INSERT INTO `cms_page_translations` VALUES (134, 'Return Policy', 'return-policy', '<div class=\"static-container\"><div class=\"mb-5\">Return policy page content</div></div>', 'return policy', '', 'return, policy', 'en', 2);
INSERT INTO `cms_page_translations` VALUES (135, 'Refund Policy', 'refund-policy', '<div class=\"static-container\"><div class=\"mb-5\">Refund policy page content</div></div>', 'Refund policy', '', 'refund, policy', 'en', 3);
INSERT INTO `cms_page_translations` VALUES (136, 'Terms & Conditions', 'terms-conditions', '<div class=\"static-container\"><div class=\"mb-5\">Terms & conditions page content</div></div>', 'Terms & Conditions', '', 'term, conditions', 'en', 4);
INSERT INTO `cms_page_translations` VALUES (137, 'Terms of use', 'terms-of-use', '<div class=\"static-container\"><div class=\"mb-5\">Terms of use page content</div></div>', 'Terms of use', '', 'term, use', 'en', 5);
INSERT INTO `cms_page_translations` VALUES (138, 'Contact Us', 'contact-us', '<div class=\"static-container\"><div class=\"mb-5\">Contact us page content</div></div>', 'Contact Us', '', 'contact, us', 'en', 6);
INSERT INTO `cms_page_translations` VALUES (139, 'Customer Service', 'cutomer-service', '<div class=\"static-container\"><div class=\"mb-5\">Customer service  page content</div></div>', 'Customer Service', '', 'customer, service', 'en', 7);
INSERT INTO `cms_page_translations` VALUES (140, 'What\'s New', 'whats-new', '<div class=\"static-container\"><div class=\"mb-5\">What\'s New page content</div></div>', 'What\'s New', '', 'new', 'en', 8);
INSERT INTO `cms_page_translations` VALUES (141, 'Payment Policy', 'payment-policy', '<div class=\"static-container\"><div class=\"mb-5\">Payment Policy page content</div></div>', 'Payment Policy', '', 'payment, policy', 'en', 9);
INSERT INTO `cms_page_translations` VALUES (142, 'Shipping Policy', 'shipping-policy', '<div class=\"static-container\"><div class=\"mb-5\">Shipping Policy  page content</div></div>', 'Shipping Policy', '', 'shipping, policy', 'en', 10);
INSERT INTO `cms_page_translations` VALUES (143, 'Privacy Policy', 'privacy-policy', '<div class=\"static-container\"><div class=\"mb-5\">Privacy Policy  page content</div></div>', 'Privacy Policy', '', 'privacy, policy', 'en', 11);
COMMIT;

-- ----------------------------
-- Table structure for cms_pages
-- ----------------------------
DROP TABLE IF EXISTS `cms_pages`;
CREATE TABLE `cms_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `layout` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cms_pages
-- ----------------------------
BEGIN;
INSERT INTO `cms_pages` VALUES (1, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `cms_pages` VALUES (2, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `cms_pages` VALUES (3, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `cms_pages` VALUES (4, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `cms_pages` VALUES (5, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `cms_pages` VALUES (6, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `cms_pages` VALUES (7, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `cms_pages` VALUES (8, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `cms_pages` VALUES (9, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `cms_pages` VALUES (10, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `cms_pages` VALUES (11, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
COMMIT;

-- ----------------------------
-- Table structure for core_config
-- ----------------------------
DROP TABLE IF EXISTS `core_config`;
CREATE TABLE `core_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_config_channel_id_foreign` (`channel_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1058 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of core_config
-- ----------------------------
BEGIN;
INSERT INTO `core_config` VALUES (1, 'catalog.products.guest-checkout.allow-guest-checkout', '1', NULL, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (2, 'emails.general.notifications.emails.general.notifications.verification', '1', NULL, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (3, 'emails.general.notifications.emails.general.notifications.registration', '1', NULL, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (4, 'emails.general.notifications.emails.general.notifications.customer', '1', NULL, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (5, 'emails.general.notifications.emails.general.notifications.new-order', '1', NULL, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (6, 'emails.general.notifications.emails.general.notifications.new-admin', '1', NULL, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (7, 'emails.general.notifications.emails.general.notifications.new-invoice', '1', NULL, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (8, 'emails.general.notifications.emails.general.notifications.new-refund', '1', NULL, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (9, 'emails.general.notifications.emails.general.notifications.new-shipment', '1', NULL, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (10, 'emails.general.notifications.emails.general.notifications.new-inventory-source', '1', NULL, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (11, 'emails.general.notifications.emails.general.notifications.cancel-order', '1', NULL, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (12, 'catalog.products.homepage.out_of_stock_items', '1', NULL, NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (898, 'customer.settings.social_login.enable_facebook', '1', 'default', NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (899, 'customer.settings.social_login.enable_twitter', '1', 'default', NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (900, 'customer.settings.social_login.enable_google', '1', 'default', NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (901, 'customer.settings.social_login.enable_linkedin', '1', 'default', NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (902, 'customer.settings.social_login.enable_github', '1', 'default', NULL, '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (903, 'general.content.shop.compare_option', '1', 'default', 'en', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (904, 'general.content.shop.compare_option', '1', 'default', 'fr', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (905, 'general.content.shop.compare_option', '1', 'default', 'ar', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (906, 'general.content.shop.compare_option', '1', 'default', 'de', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (907, 'general.content.shop.compare_option', '1', 'default', 'es', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (908, 'general.content.shop.compare_option', '1', 'default', 'fa', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (909, 'general.content.shop.compare_option', '1', 'default', 'it', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (910, 'general.content.shop.compare_option', '1', 'default', 'ja', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (911, 'general.content.shop.compare_option', '1', 'default', 'nl', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (912, 'general.content.shop.compare_option', '1', 'default', 'pl', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (913, 'general.content.shop.compare_option', '1', 'default', 'pt_BR', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (914, 'general.content.shop.compare_option', '1', 'default', 'tr', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (915, 'general.content.shop.wishlist_option', '1', 'default', 'en', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (916, 'general.content.shop.wishlist_option', '1', 'default', 'fr', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (917, 'general.content.shop.wishlist_option', '1', 'default', 'ar', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (918, 'general.content.shop.wishlist_option', '1', 'default', 'de', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (919, 'general.content.shop.wishlist_option', '1', 'default', 'es', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (920, 'general.content.shop.wishlist_option', '1', 'default', 'fa', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (921, 'general.content.shop.wishlist_option', '1', 'default', 'it', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (922, 'general.content.shop.wishlist_option', '1', 'default', 'ja', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (923, 'general.content.shop.wishlist_option', '1', 'default', 'nl', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (924, 'general.content.shop.wishlist_option', '1', 'default', 'pl', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (925, 'general.content.shop.wishlist_option', '1', 'default', 'pt_BR', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (926, 'general.content.shop.wishlist_option', '1', 'default', 'tr', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (927, 'general.content.shop.image_search', '1', 'default', 'en', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (928, 'general.content.shop.image_search', '1', 'default', 'fr', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (929, 'general.content.shop.image_search', '1', 'default', 'ar', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (930, 'general.content.shop.image_search', '1', 'default', 'de', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (931, 'general.content.shop.image_search', '1', 'default', 'es', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (932, 'general.content.shop.image_search', '1', 'default', 'fa', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (933, 'general.content.shop.image_search', '1', 'default', 'it', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (934, 'general.content.shop.image_search', '1', 'default', 'ja', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (935, 'general.content.shop.image_search', '1', 'default', 'nl', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (936, 'general.content.shop.image_search', '1', 'default', 'pl', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (937, 'general.content.shop.image_search', '1', 'default', 'pt_BR', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (938, 'general.content.shop.image_search', '1', 'default', 'tr', '2021-04-28 23:24:50', '2021-04-28 23:24:50');
INSERT INTO `core_config` VALUES (939, 'marketplace.settings.general.status', '1', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (940, 'marketplace.settings.general.featured', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (941, 'marketplace.settings.general.new', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (942, 'marketplace.settings.general.commission_per_unit', '0', 'default', NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (943, 'marketplace.settings.general.seller_approval_required', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (944, 'marketplace.settings.general.product_approval_required', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (945, 'marketplace.settings.general.can_create_invoice', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (946, 'marketplace.settings.general.can_create_shipment', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (947, 'marketplace.settings.general.can_cancel_order', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (948, 'marketplace.settings.landing_page.page_title', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (949, 'marketplace.settings.landing_page.show_banner', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (950, 'marketplace.settings.landing_page.banner_content', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (951, 'marketplace.settings.landing_page.show_features', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (952, 'marketplace.settings.landing_page.feature_heading', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (953, 'marketplace.settings.landing_page.feature_info', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (954, 'marketplace.settings.landing_page.feature_icon_label_1', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (955, 'marketplace.settings.landing_page.feature_icon_label_2', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (956, 'marketplace.settings.landing_page.feature_icon_label_3', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (957, 'marketplace.settings.landing_page.feature_icon_label_4', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (958, 'marketplace.settings.landing_page.feature_icon_label_5', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (959, 'marketplace.settings.landing_page.feature_icon_label_6', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (960, 'marketplace.settings.landing_page.feature_icon_label_7', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (961, 'marketplace.settings.landing_page.feature_icon_label_8', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (962, 'marketplace.settings.landing_page.show_popular_sellers', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (963, 'marketplace.settings.landing_page.open_shop_button_label', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (964, 'marketplace.settings.landing_page.about_marketplace', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (965, 'marketplace.settings.landing_page.show_open_shop_block', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (966, 'marketplace.settings.landing_page.open_shop_info', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (967, 'marketplace.settings.velocity.page_title', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (968, 'marketplace.settings.velocity.show_banner', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (969, 'marketplace.settings.velocity.banner_content', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (970, 'marketplace.settings.velocity.show_features', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (971, 'marketplace.settings.velocity.feature_heading', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (972, 'marketplace.settings.velocity.feature_info', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (973, 'marketplace.settings.velocity.feature_icon_label_1', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (974, 'marketplace.settings.velocity.feature_icon_label_2', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (975, 'marketplace.settings.velocity.feature_icon_label_3', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (976, 'marketplace.settings.velocity.feature_icon_label_4', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (977, 'marketplace.settings.velocity.feature_icon_label_5', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (978, 'marketplace.settings.velocity.feature_icon_label_6', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (979, 'marketplace.settings.velocity.feature_icon_label_7', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (980, 'marketplace.settings.velocity.feature_icon_label_8', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (981, 'marketplace.settings.velocity.show_popular_sellers', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (982, 'marketplace.settings.velocity.open_shop_button_label', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (983, 'marketplace.settings.velocity.about_marketplace', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (984, 'marketplace.settings.velocity.show_open_shop_block', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (985, 'marketplace.settings.velocity.open_shop_info', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (986, 'marketplace.settings.seller_flag.enable', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (987, 'marketplace.settings.seller_flag.text', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (988, 'marketplace.settings.seller_flag.guest_can', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (989, 'marketplace.settings.seller_flag.reason', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (990, 'marketplace.settings.seller_flag.other_reason', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (991, 'marketplace.settings.seller_flag.other_placeholder', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (992, 'marketplace.settings.product_flag.enable', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (993, 'marketplace.settings.product_flag.text', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (994, 'marketplace.settings.product_flag.guest_can', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (995, 'marketplace.settings.product_flag.reason', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (996, 'marketplace.settings.product_flag.other_reason', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (997, 'marketplace.settings.product_flag.other_placeholder', '', 'default', 'en', '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (998, 'marketplace.settings.minimum_order_amount.enable', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (999, 'marketplace.settings.minimum_order_amount.min_amount', '', 'default', NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (1000, 'marketplace.settings.minimum_order_amount.seller_min_amount', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (1001, 'marketplace.settings.google_analytics.enable', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (1002, 'marketplace.settings.google_analytics.google_analytics_id', '', 'default', NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (1003, 'marketplace.settings.google_analytics.seller_google_analytics', '0', NULL, NULL, '2021-05-06 21:58:32', '2021-05-06 21:58:32');
INSERT INTO `core_config` VALUES (1004, 'sales.carriers.free.title', 'Free Shipping', NULL, 'en', '2021-06-29 21:28:41', '2021-06-29 21:28:41');
INSERT INTO `core_config` VALUES (1005, 'sales.carriers.free.description', 'Free Shipping alo', NULL, 'en', '2021-06-29 21:28:41', '2021-06-29 21:28:41');
INSERT INTO `core_config` VALUES (1006, 'sales.carriers.free.active', '1', NULL, 'en', '2021-06-29 21:28:41', '2021-06-29 21:28:41');
INSERT INTO `core_config` VALUES (1007, 'sales.carriers.free.is_calculate_tax', '1', NULL, NULL, '2021-06-29 21:28:41', '2021-06-29 21:28:41');
INSERT INTO `core_config` VALUES (1008, 'sales.carriers.flatrate.title', 'Flat Rate', 'default', 'en', '2021-06-29 21:28:41', '2021-06-29 21:28:41');
INSERT INTO `core_config` VALUES (1009, 'sales.carriers.flatrate.description', 'Flat Rate Shipping VN', 'default', NULL, '2021-06-29 21:28:41', '2021-06-29 21:46:46');
INSERT INTO `core_config` VALUES (1010, 'sales.carriers.flatrate.default_rate', '10', 'default', NULL, '2021-06-29 21:28:41', '2021-06-29 21:28:41');
INSERT INTO `core_config` VALUES (1011, 'sales.carriers.flatrate.type', 'per_unit', NULL, NULL, '2021-06-29 21:28:41', '2021-06-29 21:28:41');
INSERT INTO `core_config` VALUES (1012, 'sales.carriers.flatrate.active', '1', NULL, 'en', '2021-06-29 21:28:41', '2021-06-29 21:28:41');
INSERT INTO `core_config` VALUES (1013, 'sales.carriers.flatrate.is_calculate_tax', '1', NULL, NULL, '2021-06-29 21:28:41', '2021-06-29 21:28:41');
INSERT INTO `core_config` VALUES (1014, 'sales.carriers.free.title', 'Miễn phí ship', NULL, 'vi', '2021-06-29 21:46:46', '2021-09-04 16:57:12');
INSERT INTO `core_config` VALUES (1015, 'sales.carriers.free.description', 'Free Shipping VN', NULL, 'vi', '2021-06-29 21:46:46', '2021-06-29 21:46:46');
INSERT INTO `core_config` VALUES (1016, 'sales.carriers.free.active', '1', NULL, 'vi', '2021-06-29 21:46:46', '2021-06-29 21:46:46');
INSERT INTO `core_config` VALUES (1017, 'sales.carriers.flatrate.title', 'Flat Rate VN', 'default', 'vi', '2021-06-29 21:46:46', '2021-06-29 21:46:46');
INSERT INTO `core_config` VALUES (1018, 'sales.carriers.flatrate.active', '1', NULL, 'vi', '2021-06-29 21:46:46', '2021-06-29 21:46:46');
INSERT INTO `core_config` VALUES (1019, 'sales.paymentmethods.paypal_smart_button.title', 'PayPal Smart Button', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1020, 'sales.paymentmethods.paypal_smart_button.description', 'PayPal', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1021, 'sales.paymentmethods.paypal_smart_button.client_id', 'sb', NULL, NULL, '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1022, 'sales.paymentmethods.paypal_smart_button.client_secret', '', NULL, NULL, '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1023, 'sales.paymentmethods.paypal_smart_button.accepted_currencies', '', NULL, NULL, '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1024, 'sales.paymentmethods.paypal_smart_button.active', '0', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1025, 'sales.paymentmethods.paypal_smart_button.sandbox', '1', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1026, 'sales.paymentmethods.paypal_smart_button.sort', '1', NULL, NULL, '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1027, 'sales.paymentmethods.zalopay.title', 'Zalo Pay', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1028, 'sales.paymentmethods.zalopay.description', 'This is Zalo Pay', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:44:12');
INSERT INTO `core_config` VALUES (1029, 'sales.paymentmethods.zalopay.active', '0', NULL, 'vi', '2021-08-31 16:13:20', '2021-09-19 17:47:49');
INSERT INTO `core_config` VALUES (1030, 'sales.paymentmethods.zalopay.sandbox', '1', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1031, 'sales.paymentmethods.zalopay.sort', '1', NULL, NULL, '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1032, 'sales.paymentmethods.zalopay_atm.title', 'ATM (via ZaloPay)', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1033, 'sales.paymentmethods.zalopay_atm.description', 'This is Zalo Pay with ATM', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:44:12');
INSERT INTO `core_config` VALUES (1034, 'sales.paymentmethods.zalopay_atm.active', '0', NULL, 'vi', '2021-08-31 16:13:20', '2021-09-19 17:47:49');
INSERT INTO `core_config` VALUES (1035, 'sales.paymentmethods.zalopay_atm.sandbox', '1', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1036, 'sales.paymentmethods.zalopay_atm.sort', '1', NULL, NULL, '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1037, 'sales.paymentmethods.cashondelivery.title', 'Cash On Delivery', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1038, 'sales.paymentmethods.cashondelivery.description', 'This is Cash On Delivery\r\nĐịa chỉ: cc\r\nSDT: 0707944746\r\ncc', NULL, 'vi', '2021-08-31 16:13:20', '2021-09-19 17:44:56');
INSERT INTO `core_config` VALUES (1039, 'sales.paymentmethods.cashondelivery.active', '1', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1040, 'sales.paymentmethods.cashondelivery.instructions', 'Instructions COD\r\nĐịa chỉ: cc\r\nSDT: 0707944746\r\ncc', NULL, 'vi', '2021-08-31 16:13:20', '2021-09-19 17:44:56');
INSERT INTO `core_config` VALUES (1041, 'sales.paymentmethods.cashondelivery.sort', '1', NULL, NULL, '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1042, 'sales.paymentmethods.moneytransfer.title', 'Money Transfer', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1043, 'sales.paymentmethods.moneytransfer.description', 'This is Money Transfer', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:44:12');
INSERT INTO `core_config` VALUES (1044, 'sales.paymentmethods.moneytransfer.active', '1', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1045, 'sales.paymentmethods.moneytransfer.mailing_address', 'Instructions money transfer\r\n', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:44:12');
INSERT INTO `core_config` VALUES (1046, 'sales.paymentmethods.moneytransfer.sort', '2', NULL, NULL, '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1047, 'sales.paymentmethods.paypal_standard.title', 'PayPal Standard', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1048, 'sales.paymentmethods.paypal_standard.description', 'PayPal Standard', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1049, 'sales.paymentmethods.paypal_standard.business_account', 'test@webkul.com', NULL, NULL, '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1050, 'sales.paymentmethods.paypal_standard.active', '0', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1051, 'sales.paymentmethods.paypal_standard.sandbox', '1', NULL, 'vi', '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1052, 'sales.paymentmethods.paypal_standard.sort', '3', NULL, NULL, '2021-08-31 16:13:20', '2021-08-31 16:13:20');
INSERT INTO `core_config` VALUES (1053, 'sales.orderSettings.order_number.order_number_prefix', 'KILIMO-', 'default', 'vi', '2021-09-06 22:56:32', '2021-09-06 22:59:06');
INSERT INTO `core_config` VALUES (1054, 'sales.orderSettings.order_number.order_number_length', '9', 'default', 'vi', '2021-09-06 22:56:32', '2021-09-06 22:59:06');
INSERT INTO `core_config` VALUES (1055, 'sales.orderSettings.order_number.order_number_suffix', '', 'default', 'vi', '2021-09-06 22:56:32', '2021-09-06 22:56:32');
INSERT INTO `core_config` VALUES (1056, 'sales.orderSettings.order_number.order_number_generator-class', '9', 'default', 'vi', '2021-09-06 22:56:32', '2021-09-06 22:59:06');
INSERT INTO `core_config` VALUES (1057, 'sales.orderSettings.minimum-order.minimum_order_amount', '', 'default', 'vi', '2021-09-06 22:56:32', '2021-09-06 22:56:32');
COMMIT;

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of countries
-- ----------------------------
BEGIN;
INSERT INTO `countries` VALUES (1, 'AF', 'Afghanistan');
INSERT INTO `countries` VALUES (2, 'AX', 'Åland Islands');
INSERT INTO `countries` VALUES (3, 'AL', 'Albania');
INSERT INTO `countries` VALUES (4, 'DZ', 'Algeria');
INSERT INTO `countries` VALUES (5, 'AS', 'American Samoa');
INSERT INTO `countries` VALUES (6, 'AD', 'Andorra');
INSERT INTO `countries` VALUES (7, 'AO', 'Angola');
INSERT INTO `countries` VALUES (8, 'AI', 'Anguilla');
INSERT INTO `countries` VALUES (9, 'AQ', 'Antarctica');
INSERT INTO `countries` VALUES (10, 'AG', 'Antigua & Barbuda');
INSERT INTO `countries` VALUES (11, 'AR', 'Argentina');
INSERT INTO `countries` VALUES (12, 'AM', 'Armenia');
INSERT INTO `countries` VALUES (13, 'AW', 'Aruba');
INSERT INTO `countries` VALUES (14, 'AC', 'Ascension Island');
INSERT INTO `countries` VALUES (15, 'AU', 'Australia');
INSERT INTO `countries` VALUES (16, 'AT', 'Austria');
INSERT INTO `countries` VALUES (17, 'AZ', 'Azerbaijan');
INSERT INTO `countries` VALUES (18, 'BS', 'Bahamas');
INSERT INTO `countries` VALUES (19, 'BH', 'Bahrain');
INSERT INTO `countries` VALUES (20, 'BD', 'Bangladesh');
INSERT INTO `countries` VALUES (21, 'BB', 'Barbados');
INSERT INTO `countries` VALUES (22, 'BY', 'Belarus');
INSERT INTO `countries` VALUES (23, 'BE', 'Belgium');
INSERT INTO `countries` VALUES (24, 'BZ', 'Belize');
INSERT INTO `countries` VALUES (25, 'BJ', 'Benin');
INSERT INTO `countries` VALUES (26, 'BM', 'Bermuda');
INSERT INTO `countries` VALUES (27, 'BT', 'Bhutan');
INSERT INTO `countries` VALUES (28, 'BO', 'Bolivia');
INSERT INTO `countries` VALUES (29, 'BA', 'Bosnia & Herzegovina');
INSERT INTO `countries` VALUES (30, 'BW', 'Botswana');
INSERT INTO `countries` VALUES (31, 'BR', 'Brazil');
INSERT INTO `countries` VALUES (32, 'IO', 'British Indian Ocean Territory');
INSERT INTO `countries` VALUES (33, 'VG', 'British Virgin Islands');
INSERT INTO `countries` VALUES (34, 'BN', 'Brunei');
INSERT INTO `countries` VALUES (35, 'BG', 'Bulgaria');
INSERT INTO `countries` VALUES (36, 'BF', 'Burkina Faso');
INSERT INTO `countries` VALUES (37, 'BI', 'Burundi');
INSERT INTO `countries` VALUES (38, 'KH', 'Cambodia');
INSERT INTO `countries` VALUES (39, 'CM', 'Cameroon');
INSERT INTO `countries` VALUES (40, 'CA', 'Canada');
INSERT INTO `countries` VALUES (41, 'IC', 'Canary Islands');
INSERT INTO `countries` VALUES (42, 'CV', 'Cape Verde');
INSERT INTO `countries` VALUES (43, 'BQ', 'Caribbean Netherlands');
INSERT INTO `countries` VALUES (44, 'KY', 'Cayman Islands');
INSERT INTO `countries` VALUES (45, 'CF', 'Central African Republic');
INSERT INTO `countries` VALUES (46, 'EA', 'Ceuta & Melilla');
INSERT INTO `countries` VALUES (47, 'TD', 'Chad');
INSERT INTO `countries` VALUES (48, 'CL', 'Chile');
INSERT INTO `countries` VALUES (49, 'CN', 'China');
INSERT INTO `countries` VALUES (50, 'CX', 'Christmas Island');
INSERT INTO `countries` VALUES (51, 'CC', 'Cocos (Keeling) Islands');
INSERT INTO `countries` VALUES (52, 'CO', 'Colombia');
INSERT INTO `countries` VALUES (53, 'KM', 'Comoros');
INSERT INTO `countries` VALUES (54, 'CG', 'Congo - Brazzaville');
INSERT INTO `countries` VALUES (55, 'CD', 'Congo - Kinshasa');
INSERT INTO `countries` VALUES (56, 'CK', 'Cook Islands');
INSERT INTO `countries` VALUES (57, 'CR', 'Costa Rica');
INSERT INTO `countries` VALUES (58, 'CI', 'Côte d’Ivoire');
INSERT INTO `countries` VALUES (59, 'HR', 'Croatia');
INSERT INTO `countries` VALUES (60, 'CU', 'Cuba');
INSERT INTO `countries` VALUES (61, 'CW', 'Curaçao');
INSERT INTO `countries` VALUES (62, 'CY', 'Cyprus');
INSERT INTO `countries` VALUES (63, 'CZ', 'Czechia');
INSERT INTO `countries` VALUES (64, 'DK', 'Denmark');
INSERT INTO `countries` VALUES (65, 'DG', 'Diego Garcia');
INSERT INTO `countries` VALUES (66, 'DJ', 'Djibouti');
INSERT INTO `countries` VALUES (67, 'DM', 'Dominica');
INSERT INTO `countries` VALUES (68, 'DO', 'Dominican Republic');
INSERT INTO `countries` VALUES (69, 'EC', 'Ecuador');
INSERT INTO `countries` VALUES (70, 'EG', 'Egypt');
INSERT INTO `countries` VALUES (71, 'SV', 'El Salvador');
INSERT INTO `countries` VALUES (72, 'GQ', 'Equatorial Guinea');
INSERT INTO `countries` VALUES (73, 'ER', 'Eritrea');
INSERT INTO `countries` VALUES (74, 'EE', 'Estonia');
INSERT INTO `countries` VALUES (75, 'ET', 'Ethiopia');
INSERT INTO `countries` VALUES (76, 'EZ', 'Eurozone');
INSERT INTO `countries` VALUES (77, 'FK', 'Falkland Islands');
INSERT INTO `countries` VALUES (78, 'FO', 'Faroe Islands');
INSERT INTO `countries` VALUES (79, 'FJ', 'Fiji');
INSERT INTO `countries` VALUES (80, 'FI', 'Finland');
INSERT INTO `countries` VALUES (81, 'FR', 'France');
INSERT INTO `countries` VALUES (82, 'GF', 'French Guiana');
INSERT INTO `countries` VALUES (83, 'PF', 'French Polynesia');
INSERT INTO `countries` VALUES (84, 'TF', 'French Southern Territories');
INSERT INTO `countries` VALUES (85, 'GA', 'Gabon');
INSERT INTO `countries` VALUES (86, 'GM', 'Gambia');
INSERT INTO `countries` VALUES (87, 'GE', 'Georgia');
INSERT INTO `countries` VALUES (88, 'DE', 'Germany');
INSERT INTO `countries` VALUES (89, 'GH', 'Ghana');
INSERT INTO `countries` VALUES (90, 'GI', 'Gibraltar');
INSERT INTO `countries` VALUES (91, 'GR', 'Greece');
INSERT INTO `countries` VALUES (92, 'GL', 'Greenland');
INSERT INTO `countries` VALUES (93, 'GD', 'Grenada');
INSERT INTO `countries` VALUES (94, 'GP', 'Guadeloupe');
INSERT INTO `countries` VALUES (95, 'GU', 'Guam');
INSERT INTO `countries` VALUES (96, 'GT', 'Guatemala');
INSERT INTO `countries` VALUES (97, 'GG', 'Guernsey');
INSERT INTO `countries` VALUES (98, 'GN', 'Guinea');
INSERT INTO `countries` VALUES (99, 'GW', 'Guinea-Bissau');
INSERT INTO `countries` VALUES (100, 'GY', 'Guyana');
INSERT INTO `countries` VALUES (101, 'HT', 'Haiti');
INSERT INTO `countries` VALUES (102, 'HN', 'Honduras');
INSERT INTO `countries` VALUES (103, 'HK', 'Hong Kong SAR China');
INSERT INTO `countries` VALUES (104, 'HU', 'Hungary');
INSERT INTO `countries` VALUES (105, 'IS', 'Iceland');
INSERT INTO `countries` VALUES (106, 'IN', 'India');
INSERT INTO `countries` VALUES (107, 'ID', 'Indonesia');
INSERT INTO `countries` VALUES (108, 'IR', 'Iran');
INSERT INTO `countries` VALUES (109, 'IQ', 'Iraq');
INSERT INTO `countries` VALUES (110, 'IE', 'Ireland');
INSERT INTO `countries` VALUES (111, 'IM', 'Isle of Man');
INSERT INTO `countries` VALUES (112, 'IL', 'Israel');
INSERT INTO `countries` VALUES (113, 'IT', 'Italy');
INSERT INTO `countries` VALUES (114, 'JM', 'Jamaica');
INSERT INTO `countries` VALUES (115, 'JP', 'Japan');
INSERT INTO `countries` VALUES (116, 'JE', 'Jersey');
INSERT INTO `countries` VALUES (117, 'JO', 'Jordan');
INSERT INTO `countries` VALUES (118, 'KZ', 'Kazakhstan');
INSERT INTO `countries` VALUES (119, 'KE', 'Kenya');
INSERT INTO `countries` VALUES (120, 'KI', 'Kiribati');
INSERT INTO `countries` VALUES (121, 'XK', 'Kosovo');
INSERT INTO `countries` VALUES (122, 'KW', 'Kuwait');
INSERT INTO `countries` VALUES (123, 'KG', 'Kyrgyzstan');
INSERT INTO `countries` VALUES (124, 'LA', 'Laos');
INSERT INTO `countries` VALUES (125, 'LV', 'Latvia');
INSERT INTO `countries` VALUES (126, 'LB', 'Lebanon');
INSERT INTO `countries` VALUES (127, 'LS', 'Lesotho');
INSERT INTO `countries` VALUES (128, 'LR', 'Liberia');
INSERT INTO `countries` VALUES (129, 'LY', 'Libya');
INSERT INTO `countries` VALUES (130, 'LI', 'Liechtenstein');
INSERT INTO `countries` VALUES (131, 'LT', 'Lithuania');
INSERT INTO `countries` VALUES (132, 'LU', 'Luxembourg');
INSERT INTO `countries` VALUES (133, 'MO', 'Macau SAR China');
INSERT INTO `countries` VALUES (134, 'MK', 'Macedonia');
INSERT INTO `countries` VALUES (135, 'MG', 'Madagascar');
INSERT INTO `countries` VALUES (136, 'MW', 'Malawi');
INSERT INTO `countries` VALUES (137, 'MY', 'Malaysia');
INSERT INTO `countries` VALUES (138, 'MV', 'Maldives');
INSERT INTO `countries` VALUES (139, 'ML', 'Mali');
INSERT INTO `countries` VALUES (140, 'MT', 'Malta');
INSERT INTO `countries` VALUES (141, 'MH', 'Marshall Islands');
INSERT INTO `countries` VALUES (142, 'MQ', 'Martinique');
INSERT INTO `countries` VALUES (143, 'MR', 'Mauritania');
INSERT INTO `countries` VALUES (144, 'MU', 'Mauritius');
INSERT INTO `countries` VALUES (145, 'YT', 'Mayotte');
INSERT INTO `countries` VALUES (146, 'MX', 'Mexico');
INSERT INTO `countries` VALUES (147, 'FM', 'Micronesia');
INSERT INTO `countries` VALUES (148, 'MD', 'Moldova');
INSERT INTO `countries` VALUES (149, 'MC', 'Monaco');
INSERT INTO `countries` VALUES (150, 'MN', 'Mongolia');
INSERT INTO `countries` VALUES (151, 'ME', 'Montenegro');
INSERT INTO `countries` VALUES (152, 'MS', 'Montserrat');
INSERT INTO `countries` VALUES (153, 'MA', 'Morocco');
INSERT INTO `countries` VALUES (154, 'MZ', 'Mozambique');
INSERT INTO `countries` VALUES (155, 'MM', 'Myanmar (Burma)');
INSERT INTO `countries` VALUES (156, 'NA', 'Namibia');
INSERT INTO `countries` VALUES (157, 'NR', 'Nauru');
INSERT INTO `countries` VALUES (158, 'NP', 'Nepal');
INSERT INTO `countries` VALUES (159, 'NL', 'Netherlands');
INSERT INTO `countries` VALUES (160, 'NC', 'New Caledonia');
INSERT INTO `countries` VALUES (161, 'NZ', 'New Zealand');
INSERT INTO `countries` VALUES (162, 'NI', 'Nicaragua');
INSERT INTO `countries` VALUES (163, 'NE', 'Niger');
INSERT INTO `countries` VALUES (164, 'NG', 'Nigeria');
INSERT INTO `countries` VALUES (165, 'NU', 'Niue');
INSERT INTO `countries` VALUES (166, 'NF', 'Norfolk Island');
INSERT INTO `countries` VALUES (167, 'KP', 'North Korea');
INSERT INTO `countries` VALUES (168, 'MP', 'Northern Mariana Islands');
INSERT INTO `countries` VALUES (169, 'NO', 'Norway');
INSERT INTO `countries` VALUES (170, 'OM', 'Oman');
INSERT INTO `countries` VALUES (171, 'PK', 'Pakistan');
INSERT INTO `countries` VALUES (172, 'PW', 'Palau');
INSERT INTO `countries` VALUES (173, 'PS', 'Palestinian Territories');
INSERT INTO `countries` VALUES (174, 'PA', 'Panama');
INSERT INTO `countries` VALUES (175, 'PG', 'Papua New Guinea');
INSERT INTO `countries` VALUES (176, 'PY', 'Paraguay');
INSERT INTO `countries` VALUES (177, 'PE', 'Peru');
INSERT INTO `countries` VALUES (178, 'PH', 'Philippines');
INSERT INTO `countries` VALUES (179, 'PN', 'Pitcairn Islands');
INSERT INTO `countries` VALUES (180, 'PL', 'Poland');
INSERT INTO `countries` VALUES (181, 'PT', 'Portugal');
INSERT INTO `countries` VALUES (182, 'PR', 'Puerto Rico');
INSERT INTO `countries` VALUES (183, 'QA', 'Qatar');
INSERT INTO `countries` VALUES (184, 'RE', 'Réunion');
INSERT INTO `countries` VALUES (185, 'RO', 'Romania');
INSERT INTO `countries` VALUES (186, 'RU', 'Russia');
INSERT INTO `countries` VALUES (187, 'RW', 'Rwanda');
INSERT INTO `countries` VALUES (188, 'WS', 'Samoa');
INSERT INTO `countries` VALUES (189, 'SM', 'San Marino');
INSERT INTO `countries` VALUES (190, 'ST', 'São Tomé & Príncipe');
INSERT INTO `countries` VALUES (191, 'SA', 'Saudi Arabia');
INSERT INTO `countries` VALUES (192, 'SN', 'Senegal');
INSERT INTO `countries` VALUES (193, 'RS', 'Serbia');
INSERT INTO `countries` VALUES (194, 'SC', 'Seychelles');
INSERT INTO `countries` VALUES (195, 'SL', 'Sierra Leone');
INSERT INTO `countries` VALUES (196, 'SG', 'Singapore');
INSERT INTO `countries` VALUES (197, 'SX', 'Sint Maarten');
INSERT INTO `countries` VALUES (198, 'SK', 'Slovakia');
INSERT INTO `countries` VALUES (199, 'SI', 'Slovenia');
INSERT INTO `countries` VALUES (200, 'SB', 'Solomon Islands');
INSERT INTO `countries` VALUES (201, 'SO', 'Somalia');
INSERT INTO `countries` VALUES (202, 'ZA', 'South Africa');
INSERT INTO `countries` VALUES (203, 'GS', 'South Georgia & South Sandwich Islands');
INSERT INTO `countries` VALUES (204, 'KR', 'South Korea');
INSERT INTO `countries` VALUES (205, 'SS', 'South Sudan');
INSERT INTO `countries` VALUES (206, 'ES', 'Spain');
INSERT INTO `countries` VALUES (207, 'LK', 'Sri Lanka');
INSERT INTO `countries` VALUES (208, 'BL', 'St. Barthélemy');
INSERT INTO `countries` VALUES (209, 'SH', 'St. Helena');
INSERT INTO `countries` VALUES (210, 'KN', 'St. Kitts & Nevis');
INSERT INTO `countries` VALUES (211, 'LC', 'St. Lucia');
INSERT INTO `countries` VALUES (212, 'MF', 'St. Martin');
INSERT INTO `countries` VALUES (213, 'PM', 'St. Pierre & Miquelon');
INSERT INTO `countries` VALUES (214, 'VC', 'St. Vincent & Grenadines');
INSERT INTO `countries` VALUES (215, 'SD', 'Sudan');
INSERT INTO `countries` VALUES (216, 'SR', 'Suriname');
INSERT INTO `countries` VALUES (217, 'SJ', 'Svalbard & Jan Mayen');
INSERT INTO `countries` VALUES (218, 'SZ', 'Swaziland');
INSERT INTO `countries` VALUES (219, 'SE', 'Sweden');
INSERT INTO `countries` VALUES (220, 'CH', 'Switzerland');
INSERT INTO `countries` VALUES (221, 'SY', 'Syria');
INSERT INTO `countries` VALUES (222, 'TW', 'Taiwan');
INSERT INTO `countries` VALUES (223, 'TJ', 'Tajikistan');
INSERT INTO `countries` VALUES (224, 'TZ', 'Tanzania');
INSERT INTO `countries` VALUES (225, 'TH', 'Thailand');
INSERT INTO `countries` VALUES (226, 'TL', 'Timor-Leste');
INSERT INTO `countries` VALUES (227, 'TG', 'Togo');
INSERT INTO `countries` VALUES (228, 'TK', 'Tokelau');
INSERT INTO `countries` VALUES (229, 'TO', 'Tonga');
INSERT INTO `countries` VALUES (230, 'TT', 'Trinidad & Tobago');
INSERT INTO `countries` VALUES (231, 'TA', 'Tristan da Cunha');
INSERT INTO `countries` VALUES (232, 'TN', 'Tunisia');
INSERT INTO `countries` VALUES (233, 'TR', 'Turkey');
INSERT INTO `countries` VALUES (234, 'TM', 'Turkmenistan');
INSERT INTO `countries` VALUES (235, 'TC', 'Turks & Caicos Islands');
INSERT INTO `countries` VALUES (236, 'TV', 'Tuvalu');
INSERT INTO `countries` VALUES (237, 'UM', 'U.S. Outlying Islands');
INSERT INTO `countries` VALUES (238, 'VI', 'U.S. Virgin Islands');
INSERT INTO `countries` VALUES (239, 'UG', 'Uganda');
INSERT INTO `countries` VALUES (240, 'UA', 'Ukraine');
INSERT INTO `countries` VALUES (241, 'AE', 'United Arab Emirates');
INSERT INTO `countries` VALUES (242, 'GB', 'United Kingdom');
INSERT INTO `countries` VALUES (243, 'UN', 'United Nations');
INSERT INTO `countries` VALUES (244, 'US', 'United States');
INSERT INTO `countries` VALUES (245, 'UY', 'Uruguay');
INSERT INTO `countries` VALUES (246, 'UZ', 'Uzbekistan');
INSERT INTO `countries` VALUES (247, 'VU', 'Vanuatu');
INSERT INTO `countries` VALUES (248, 'VA', 'Vatican City');
INSERT INTO `countries` VALUES (249, 'VE', 'Venezuela');
INSERT INTO `countries` VALUES (250, 'VN', 'Vietnam');
INSERT INTO `countries` VALUES (251, 'WF', 'Wallis & Futuna');
INSERT INTO `countries` VALUES (252, 'EH', 'Western Sahara');
INSERT INTO `countries` VALUES (253, 'YE', 'Yemen');
INSERT INTO `countries` VALUES (254, 'ZM', 'Zambia');
INSERT INTO `countries` VALUES (255, 'ZW', 'Zimbabwe');
COMMIT;

-- ----------------------------
-- Table structure for country_state_translations
-- ----------------------------
DROP TABLE IF EXISTS `country_state_translations`;
CREATE TABLE `country_state_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_name` text COLLATE utf8mb4_unicode_ci,
  `country_state_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_state_translations_country_state_id_foreign` (`country_state_id`),
  CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of country_state_translations
-- ----------------------------
BEGIN;
INSERT INTO `country_state_translations` VALUES (8521, 'ar', 'ألاباما', 1);
INSERT INTO `country_state_translations` VALUES (8522, 'ar', 'ألاسكا', 2);
INSERT INTO `country_state_translations` VALUES (8523, 'ar', 'ساموا الأمريكية', 3);
INSERT INTO `country_state_translations` VALUES (8524, 'ar', 'أريزونا', 4);
INSERT INTO `country_state_translations` VALUES (8525, 'ar', 'أركنساس', 5);
INSERT INTO `country_state_translations` VALUES (8526, 'ar', 'القوات المسلحة أفريقيا', 6);
INSERT INTO `country_state_translations` VALUES (8527, 'ar', 'القوات المسلحة الأمريكية', 7);
INSERT INTO `country_state_translations` VALUES (8528, 'ar', 'القوات المسلحة الكندية', 8);
INSERT INTO `country_state_translations` VALUES (8529, 'ar', 'القوات المسلحة أوروبا', 9);
INSERT INTO `country_state_translations` VALUES (8530, 'ar', 'القوات المسلحة الشرق الأوسط', 10);
INSERT INTO `country_state_translations` VALUES (8531, 'ar', 'القوات المسلحة في المحيط الهادئ', 11);
INSERT INTO `country_state_translations` VALUES (8532, 'ar', 'كاليفورنيا', 12);
INSERT INTO `country_state_translations` VALUES (8533, 'ar', 'كولورادو', 13);
INSERT INTO `country_state_translations` VALUES (8534, 'ar', 'كونيتيكت', 14);
INSERT INTO `country_state_translations` VALUES (8535, 'ar', 'ديلاوير', 15);
INSERT INTO `country_state_translations` VALUES (8536, 'ar', 'مقاطعة كولومبيا', 16);
INSERT INTO `country_state_translations` VALUES (8537, 'ar', 'ولايات ميكرونيزيا الموحدة', 17);
INSERT INTO `country_state_translations` VALUES (8538, 'ar', 'فلوريدا', 18);
INSERT INTO `country_state_translations` VALUES (8539, 'ar', 'جورجيا', 19);
INSERT INTO `country_state_translations` VALUES (8540, 'ar', 'غوام', 20);
INSERT INTO `country_state_translations` VALUES (8541, 'ar', 'هاواي', 21);
INSERT INTO `country_state_translations` VALUES (8542, 'ar', 'ايداهو', 22);
INSERT INTO `country_state_translations` VALUES (8543, 'ar', 'إلينوي', 23);
INSERT INTO `country_state_translations` VALUES (8544, 'ar', 'إنديانا', 24);
INSERT INTO `country_state_translations` VALUES (8545, 'ar', 'أيوا', 25);
INSERT INTO `country_state_translations` VALUES (8546, 'ar', 'كانساس', 26);
INSERT INTO `country_state_translations` VALUES (8547, 'ar', 'كنتاكي', 27);
INSERT INTO `country_state_translations` VALUES (8548, 'ar', 'لويزيانا', 28);
INSERT INTO `country_state_translations` VALUES (8549, 'ar', 'مين', 29);
INSERT INTO `country_state_translations` VALUES (8550, 'ar', 'جزر مارشال', 30);
INSERT INTO `country_state_translations` VALUES (8551, 'ar', 'ماريلاند', 31);
INSERT INTO `country_state_translations` VALUES (8552, 'ar', 'ماساتشوستس', 32);
INSERT INTO `country_state_translations` VALUES (8553, 'ar', 'ميشيغان', 33);
INSERT INTO `country_state_translations` VALUES (8554, 'ar', 'مينيسوتا', 34);
INSERT INTO `country_state_translations` VALUES (8555, 'ar', 'ميسيسيبي', 35);
INSERT INTO `country_state_translations` VALUES (8556, 'ar', 'ميسوري', 36);
INSERT INTO `country_state_translations` VALUES (8557, 'ar', 'مونتانا', 37);
INSERT INTO `country_state_translations` VALUES (8558, 'ar', 'نبراسكا', 38);
INSERT INTO `country_state_translations` VALUES (8559, 'ar', 'نيفادا', 39);
INSERT INTO `country_state_translations` VALUES (8560, 'ar', 'نيو هامبشاير', 40);
INSERT INTO `country_state_translations` VALUES (8561, 'ar', 'نيو جيرسي', 41);
INSERT INTO `country_state_translations` VALUES (8562, 'ar', 'المكسيك جديدة', 42);
INSERT INTO `country_state_translations` VALUES (8563, 'ar', 'نيويورك', 43);
INSERT INTO `country_state_translations` VALUES (8564, 'ar', 'شمال كارولينا', 44);
INSERT INTO `country_state_translations` VALUES (8565, 'ar', 'شمال داكوتا', 45);
INSERT INTO `country_state_translations` VALUES (8566, 'ar', 'جزر مريانا الشمالية', 46);
INSERT INTO `country_state_translations` VALUES (8567, 'ar', 'أوهايو', 47);
INSERT INTO `country_state_translations` VALUES (8568, 'ar', 'أوكلاهوما', 48);
INSERT INTO `country_state_translations` VALUES (8569, 'ar', 'ولاية أوريغون', 49);
INSERT INTO `country_state_translations` VALUES (8570, 'ar', 'بالاو', 50);
INSERT INTO `country_state_translations` VALUES (8571, 'ar', 'بنسلفانيا', 51);
INSERT INTO `country_state_translations` VALUES (8572, 'ar', 'بورتوريكو', 52);
INSERT INTO `country_state_translations` VALUES (8573, 'ar', 'جزيرة رود', 53);
INSERT INTO `country_state_translations` VALUES (8574, 'ar', 'كارولينا الجنوبية', 54);
INSERT INTO `country_state_translations` VALUES (8575, 'ar', 'جنوب داكوتا', 55);
INSERT INTO `country_state_translations` VALUES (8576, 'ar', 'تينيسي', 56);
INSERT INTO `country_state_translations` VALUES (8577, 'ar', 'تكساس', 57);
INSERT INTO `country_state_translations` VALUES (8578, 'ar', 'يوتا', 58);
INSERT INTO `country_state_translations` VALUES (8579, 'ar', 'فيرمونت', 59);
INSERT INTO `country_state_translations` VALUES (8580, 'ar', 'جزر فيرجن', 60);
INSERT INTO `country_state_translations` VALUES (8581, 'ar', 'فرجينيا', 61);
INSERT INTO `country_state_translations` VALUES (8582, 'ar', 'واشنطن', 62);
INSERT INTO `country_state_translations` VALUES (8583, 'ar', 'فرجينيا الغربية', 63);
INSERT INTO `country_state_translations` VALUES (8584, 'ar', 'ولاية ويسكونسن', 64);
INSERT INTO `country_state_translations` VALUES (8585, 'ar', 'وايومنغ', 65);
INSERT INTO `country_state_translations` VALUES (8586, 'ar', 'ألبرتا', 66);
INSERT INTO `country_state_translations` VALUES (8587, 'ar', 'كولومبيا البريطانية', 67);
INSERT INTO `country_state_translations` VALUES (8588, 'ar', 'مانيتوبا', 68);
INSERT INTO `country_state_translations` VALUES (8589, 'ar', 'نيوفاوندلاند ولابرادور', 69);
INSERT INTO `country_state_translations` VALUES (8590, 'ar', 'برونزيك جديد', 70);
INSERT INTO `country_state_translations` VALUES (8591, 'ar', 'مقاطعة نفوفا سكوشيا', 71);
INSERT INTO `country_state_translations` VALUES (8592, 'ar', 'الاقاليم الشمالية الغربية', 72);
INSERT INTO `country_state_translations` VALUES (8593, 'ar', 'نونافوت', 73);
INSERT INTO `country_state_translations` VALUES (8594, 'ar', 'أونتاريو', 74);
INSERT INTO `country_state_translations` VALUES (8595, 'ar', 'جزيرة الأمير ادوارد', 75);
INSERT INTO `country_state_translations` VALUES (8596, 'ar', 'كيبيك', 76);
INSERT INTO `country_state_translations` VALUES (8597, 'ar', 'ساسكاتشوان', 77);
INSERT INTO `country_state_translations` VALUES (8598, 'ar', 'إقليم يوكون', 78);
INSERT INTO `country_state_translations` VALUES (8599, 'ar', 'Niedersachsen', 79);
INSERT INTO `country_state_translations` VALUES (8600, 'ar', 'بادن فورتمبيرغ', 80);
INSERT INTO `country_state_translations` VALUES (8601, 'ar', 'بايرن ميونيخ', 81);
INSERT INTO `country_state_translations` VALUES (8602, 'ar', 'برلين', 82);
INSERT INTO `country_state_translations` VALUES (8603, 'ar', 'براندنبورغ', 83);
INSERT INTO `country_state_translations` VALUES (8604, 'ar', 'بريمن', 84);
INSERT INTO `country_state_translations` VALUES (8605, 'ar', 'هامبورغ', 85);
INSERT INTO `country_state_translations` VALUES (8606, 'ar', 'هيسن', 86);
INSERT INTO `country_state_translations` VALUES (8607, 'ar', 'مكلنبورغ-فوربومرن', 87);
INSERT INTO `country_state_translations` VALUES (8608, 'ar', 'نوردراين فيستفالن', 88);
INSERT INTO `country_state_translations` VALUES (8609, 'ar', 'راينلاند-بفالز', 89);
INSERT INTO `country_state_translations` VALUES (8610, 'ar', 'سارلاند', 90);
INSERT INTO `country_state_translations` VALUES (8611, 'ar', 'ساكسن', 91);
INSERT INTO `country_state_translations` VALUES (8612, 'ar', 'سكسونيا أنهالت', 92);
INSERT INTO `country_state_translations` VALUES (8613, 'ar', 'شليسفيغ هولشتاين', 93);
INSERT INTO `country_state_translations` VALUES (8614, 'ar', 'تورنغن', 94);
INSERT INTO `country_state_translations` VALUES (8615, 'ar', 'فيينا', 95);
INSERT INTO `country_state_translations` VALUES (8616, 'ar', 'النمسا السفلى', 96);
INSERT INTO `country_state_translations` VALUES (8617, 'ar', 'النمسا العليا', 97);
INSERT INTO `country_state_translations` VALUES (8618, 'ar', 'سالزبورغ', 98);
INSERT INTO `country_state_translations` VALUES (8619, 'ar', 'Каринтия', 99);
INSERT INTO `country_state_translations` VALUES (8620, 'ar', 'STEIERMARK', 100);
INSERT INTO `country_state_translations` VALUES (8621, 'ar', 'تيرول', 101);
INSERT INTO `country_state_translations` VALUES (8622, 'ar', 'بورغنلاند', 102);
INSERT INTO `country_state_translations` VALUES (8623, 'ar', 'فورارلبرغ', 103);
INSERT INTO `country_state_translations` VALUES (8624, 'ar', 'أرجاو', 104);
INSERT INTO `country_state_translations` VALUES (8625, 'ar', 'Appenzell Innerrhoden', 105);
INSERT INTO `country_state_translations` VALUES (8626, 'ar', 'أبنزل أوسيرهودن', 106);
INSERT INTO `country_state_translations` VALUES (8627, 'ar', 'برن', 107);
INSERT INTO `country_state_translations` VALUES (8628, 'ar', 'كانتون ريف بازل', 108);
INSERT INTO `country_state_translations` VALUES (8629, 'ar', 'بازل شتات', 109);
INSERT INTO `country_state_translations` VALUES (8630, 'ar', 'فرايبورغ', 110);
INSERT INTO `country_state_translations` VALUES (8631, 'ar', 'Genf', 111);
INSERT INTO `country_state_translations` VALUES (8632, 'ar', 'جلاروس', 112);
INSERT INTO `country_state_translations` VALUES (8633, 'ar', 'غراوبوندن', 113);
INSERT INTO `country_state_translations` VALUES (8634, 'ar', 'العصر الجوارسي أو الجوري', 114);
INSERT INTO `country_state_translations` VALUES (8635, 'ar', 'لوزيرن', 115);
INSERT INTO `country_state_translations` VALUES (8636, 'ar', 'في Neuenburg', 116);
INSERT INTO `country_state_translations` VALUES (8637, 'ar', 'نيدوالدن', 117);
INSERT INTO `country_state_translations` VALUES (8638, 'ar', 'أوبوالدن', 118);
INSERT INTO `country_state_translations` VALUES (8639, 'ar', 'سانت غالن', 119);
INSERT INTO `country_state_translations` VALUES (8640, 'ar', 'شافهاوزن', 120);
INSERT INTO `country_state_translations` VALUES (8641, 'ar', 'سولوتورن', 121);
INSERT INTO `country_state_translations` VALUES (8642, 'ar', 'شفيتس', 122);
INSERT INTO `country_state_translations` VALUES (8643, 'ar', 'ثورجو', 123);
INSERT INTO `country_state_translations` VALUES (8644, 'ar', 'تيتشينو', 124);
INSERT INTO `country_state_translations` VALUES (8645, 'ar', 'أوري', 125);
INSERT INTO `country_state_translations` VALUES (8646, 'ar', 'وادت', 126);
INSERT INTO `country_state_translations` VALUES (8647, 'ar', 'اليس', 127);
INSERT INTO `country_state_translations` VALUES (8648, 'ar', 'زوغ', 128);
INSERT INTO `country_state_translations` VALUES (8649, 'ar', 'زيورخ', 129);
INSERT INTO `country_state_translations` VALUES (8650, 'ar', 'Corunha', 130);
INSERT INTO `country_state_translations` VALUES (8651, 'ar', 'ألافا', 131);
INSERT INTO `country_state_translations` VALUES (8652, 'ar', 'الباسيتي', 132);
INSERT INTO `country_state_translations` VALUES (8653, 'ar', 'اليكانتي', 133);
INSERT INTO `country_state_translations` VALUES (8654, 'ar', 'الميريا', 134);
INSERT INTO `country_state_translations` VALUES (8655, 'ar', 'أستورياس', 135);
INSERT INTO `country_state_translations` VALUES (8656, 'ar', 'أفيلا', 136);
INSERT INTO `country_state_translations` VALUES (8657, 'ar', 'بطليوس', 137);
INSERT INTO `country_state_translations` VALUES (8658, 'ar', 'البليار', 138);
INSERT INTO `country_state_translations` VALUES (8659, 'ar', 'برشلونة', 139);
INSERT INTO `country_state_translations` VALUES (8660, 'ar', 'برغش', 140);
INSERT INTO `country_state_translations` VALUES (8661, 'ar', 'كاسيريس', 141);
INSERT INTO `country_state_translations` VALUES (8662, 'ar', 'كاديز', 142);
INSERT INTO `country_state_translations` VALUES (8663, 'ar', 'كانتابريا', 143);
INSERT INTO `country_state_translations` VALUES (8664, 'ar', 'كاستيلون', 144);
INSERT INTO `country_state_translations` VALUES (8665, 'ar', 'سبتة', 145);
INSERT INTO `country_state_translations` VALUES (8666, 'ar', 'سيوداد ريال', 146);
INSERT INTO `country_state_translations` VALUES (8667, 'ar', 'قرطبة', 147);
INSERT INTO `country_state_translations` VALUES (8668, 'ar', 'كوينكا', 148);
INSERT INTO `country_state_translations` VALUES (8669, 'ar', 'جيرونا', 149);
INSERT INTO `country_state_translations` VALUES (8670, 'ar', 'غرناطة', 150);
INSERT INTO `country_state_translations` VALUES (8671, 'ar', 'غوادالاخارا', 151);
INSERT INTO `country_state_translations` VALUES (8672, 'ar', 'بجويبوزكوا', 152);
INSERT INTO `country_state_translations` VALUES (8673, 'ar', 'هويلفا', 153);
INSERT INTO `country_state_translations` VALUES (8674, 'ar', 'هويسكا', 154);
INSERT INTO `country_state_translations` VALUES (8675, 'ar', 'خاين', 155);
INSERT INTO `country_state_translations` VALUES (8676, 'ar', 'لاريوخا', 156);
INSERT INTO `country_state_translations` VALUES (8677, 'ar', 'لاس بالماس', 157);
INSERT INTO `country_state_translations` VALUES (8678, 'ar', 'ليون', 158);
INSERT INTO `country_state_translations` VALUES (8679, 'ar', 'يدا', 159);
INSERT INTO `country_state_translations` VALUES (8680, 'ar', 'لوغو', 160);
INSERT INTO `country_state_translations` VALUES (8681, 'ar', 'مدريد', 161);
INSERT INTO `country_state_translations` VALUES (8682, 'ar', 'ملقة', 162);
INSERT INTO `country_state_translations` VALUES (8683, 'ar', 'مليلية', 163);
INSERT INTO `country_state_translations` VALUES (8684, 'ar', 'مورسيا', 164);
INSERT INTO `country_state_translations` VALUES (8685, 'ar', 'نافارا', 165);
INSERT INTO `country_state_translations` VALUES (8686, 'ar', 'أورينس', 166);
INSERT INTO `country_state_translations` VALUES (8687, 'ar', 'بلنسية', 167);
INSERT INTO `country_state_translations` VALUES (8688, 'ar', 'بونتيفيدرا', 168);
INSERT INTO `country_state_translations` VALUES (8689, 'ar', 'سالامانكا', 169);
INSERT INTO `country_state_translations` VALUES (8690, 'ar', 'سانتا كروز دي تينيريفي', 170);
INSERT INTO `country_state_translations` VALUES (8691, 'ar', 'سيغوفيا', 171);
INSERT INTO `country_state_translations` VALUES (8692, 'ar', 'اشبيلية', 172);
INSERT INTO `country_state_translations` VALUES (8693, 'ar', 'سوريا', 173);
INSERT INTO `country_state_translations` VALUES (8694, 'ar', 'تاراغونا', 174);
INSERT INTO `country_state_translations` VALUES (8695, 'ar', 'تيرويل', 175);
INSERT INTO `country_state_translations` VALUES (8696, 'ar', 'توليدو', 176);
INSERT INTO `country_state_translations` VALUES (8697, 'ar', 'فالنسيا', 177);
INSERT INTO `country_state_translations` VALUES (8698, 'ar', 'بلد الوليد', 178);
INSERT INTO `country_state_translations` VALUES (8699, 'ar', 'فيزكايا', 179);
INSERT INTO `country_state_translations` VALUES (8700, 'ar', 'زامورا', 180);
INSERT INTO `country_state_translations` VALUES (8701, 'ar', 'سرقسطة', 181);
INSERT INTO `country_state_translations` VALUES (8702, 'ar', 'عين', 182);
INSERT INTO `country_state_translations` VALUES (8703, 'ar', 'أيسن', 183);
INSERT INTO `country_state_translations` VALUES (8704, 'ar', 'اليي', 184);
INSERT INTO `country_state_translations` VALUES (8705, 'ar', 'ألب البروفنس العليا', 185);
INSERT INTO `country_state_translations` VALUES (8706, 'ar', 'أوتس ألب', 186);
INSERT INTO `country_state_translations` VALUES (8707, 'ar', 'ألب ماريتيم', 187);
INSERT INTO `country_state_translations` VALUES (8708, 'ar', 'ARDECHE', 188);
INSERT INTO `country_state_translations` VALUES (8709, 'ar', 'Ardennes', 189);
INSERT INTO `country_state_translations` VALUES (8710, 'ar', 'آردن', 190);
INSERT INTO `country_state_translations` VALUES (8711, 'ar', 'أوب', 191);
INSERT INTO `country_state_translations` VALUES (8712, 'ar', 'اود', 192);
INSERT INTO `country_state_translations` VALUES (8713, 'ar', 'أفيرون', 193);
INSERT INTO `country_state_translations` VALUES (8714, 'ar', 'بوكاس دو رون', 194);
INSERT INTO `country_state_translations` VALUES (8715, 'ar', 'كالفادوس', 195);
INSERT INTO `country_state_translations` VALUES (8716, 'ar', 'كانتال', 196);
INSERT INTO `country_state_translations` VALUES (8717, 'ar', 'شارانت', 197);
INSERT INTO `country_state_translations` VALUES (8718, 'ar', 'سيين إت مارن', 198);
INSERT INTO `country_state_translations` VALUES (8719, 'ar', 'شير', 199);
INSERT INTO `country_state_translations` VALUES (8720, 'ar', 'كوريز', 200);
INSERT INTO `country_state_translations` VALUES (8721, 'ar', 'سود كورس-دو-', 201);
INSERT INTO `country_state_translations` VALUES (8722, 'ar', 'هوت كورس', 202);
INSERT INTO `country_state_translations` VALUES (8723, 'ar', 'كوستا دوركوريز', 203);
INSERT INTO `country_state_translations` VALUES (8724, 'ar', 'كوتس دورمور', 204);
INSERT INTO `country_state_translations` VALUES (8725, 'ar', 'كروز', 205);
INSERT INTO `country_state_translations` VALUES (8726, 'ar', 'دوردوني', 206);
INSERT INTO `country_state_translations` VALUES (8727, 'ar', 'دوبس', 207);
INSERT INTO `country_state_translations` VALUES (8728, 'ar', 'DrômeFinistère', 208);
INSERT INTO `country_state_translations` VALUES (8729, 'ar', 'أور', 209);
INSERT INTO `country_state_translations` VALUES (8730, 'ar', 'أور ولوار', 210);
INSERT INTO `country_state_translations` VALUES (8731, 'ar', 'فينيستير', 211);
INSERT INTO `country_state_translations` VALUES (8732, 'ar', 'جارد', 212);
INSERT INTO `country_state_translations` VALUES (8733, 'ar', 'هوت غارون', 213);
INSERT INTO `country_state_translations` VALUES (8734, 'ar', 'الخيام', 214);
INSERT INTO `country_state_translations` VALUES (8735, 'ar', 'جيروند', 215);
INSERT INTO `country_state_translations` VALUES (8736, 'ar', 'هيرولت', 216);
INSERT INTO `country_state_translations` VALUES (8737, 'ar', 'إيل وفيلان', 217);
INSERT INTO `country_state_translations` VALUES (8738, 'ar', 'إندر', 218);
INSERT INTO `country_state_translations` VALUES (8739, 'ar', 'أندر ولوار', 219);
INSERT INTO `country_state_translations` VALUES (8740, 'ar', 'إيسر', 220);
INSERT INTO `country_state_translations` VALUES (8741, 'ar', 'العصر الجوارسي أو الجوري', 221);
INSERT INTO `country_state_translations` VALUES (8742, 'ar', 'اندز', 222);
INSERT INTO `country_state_translations` VALUES (8743, 'ar', 'لوار وشير', 223);
INSERT INTO `country_state_translations` VALUES (8744, 'ar', 'لوار', 224);
INSERT INTO `country_state_translations` VALUES (8745, 'ar', 'هوت-لوار', 225);
INSERT INTO `country_state_translations` VALUES (8746, 'ar', 'وار أتلانتيك', 226);
INSERT INTO `country_state_translations` VALUES (8747, 'ar', 'لورا', 227);
INSERT INTO `country_state_translations` VALUES (8748, 'ar', 'كثيرا', 228);
INSERT INTO `country_state_translations` VALUES (8749, 'ar', 'الكثير غارون', 229);
INSERT INTO `country_state_translations` VALUES (8750, 'ar', 'لوزر', 230);
INSERT INTO `country_state_translations` VALUES (8751, 'ar', 'مين-إي-لوار', 231);
INSERT INTO `country_state_translations` VALUES (8752, 'ar', 'المانش', 232);
INSERT INTO `country_state_translations` VALUES (8753, 'ar', 'مارن', 233);
INSERT INTO `country_state_translations` VALUES (8754, 'ar', 'هوت مارن', 234);
INSERT INTO `country_state_translations` VALUES (8755, 'ar', 'مايين', 235);
INSERT INTO `country_state_translations` VALUES (8756, 'ar', 'مورت وموزيل', 236);
INSERT INTO `country_state_translations` VALUES (8757, 'ar', 'ميوز', 237);
INSERT INTO `country_state_translations` VALUES (8758, 'ar', 'موربيهان', 238);
INSERT INTO `country_state_translations` VALUES (8759, 'ar', 'موسيل', 239);
INSERT INTO `country_state_translations` VALUES (8760, 'ar', 'نيفر', 240);
INSERT INTO `country_state_translations` VALUES (8761, 'ar', 'نورد', 241);
INSERT INTO `country_state_translations` VALUES (8762, 'ar', 'إيل دو فرانس', 242);
INSERT INTO `country_state_translations` VALUES (8763, 'ar', 'أورن', 243);
INSERT INTO `country_state_translations` VALUES (8764, 'ar', 'با-دو-كاليه', 244);
INSERT INTO `country_state_translations` VALUES (8765, 'ar', 'بوي دي دوم', 245);
INSERT INTO `country_state_translations` VALUES (8766, 'ar', 'البرانيس ​​الأطلسية', 246);
INSERT INTO `country_state_translations` VALUES (8767, 'ar', 'أوتس-بيرينيهs', 247);
INSERT INTO `country_state_translations` VALUES (8768, 'ar', 'بيرينيه-أورينتال', 248);
INSERT INTO `country_state_translations` VALUES (8769, 'ar', 'بس رين', 249);
INSERT INTO `country_state_translations` VALUES (8770, 'ar', 'أوت رين', 250);
INSERT INTO `country_state_translations` VALUES (8771, 'ar', 'رون [3]', 251);
INSERT INTO `country_state_translations` VALUES (8772, 'ar', 'هوت-سون', 252);
INSERT INTO `country_state_translations` VALUES (8773, 'ar', 'سون ولوار', 253);
INSERT INTO `country_state_translations` VALUES (8774, 'ar', 'سارت', 254);
INSERT INTO `country_state_translations` VALUES (8775, 'ar', 'سافوا', 255);
INSERT INTO `country_state_translations` VALUES (8776, 'ar', 'هاوت سافوي', 256);
INSERT INTO `country_state_translations` VALUES (8777, 'ar', 'باريس', 257);
INSERT INTO `country_state_translations` VALUES (8778, 'ar', 'سين البحرية', 258);
INSERT INTO `country_state_translations` VALUES (8779, 'ar', 'سيين إت مارن', 259);
INSERT INTO `country_state_translations` VALUES (8780, 'ar', 'إيفلين', 260);
INSERT INTO `country_state_translations` VALUES (8781, 'ar', 'دوكس سفرس', 261);
INSERT INTO `country_state_translations` VALUES (8782, 'ar', 'السوم', 262);
INSERT INTO `country_state_translations` VALUES (8783, 'ar', 'تارن', 263);
INSERT INTO `country_state_translations` VALUES (8784, 'ar', 'تارن وغارون', 264);
INSERT INTO `country_state_translations` VALUES (8785, 'ar', 'فار', 265);
INSERT INTO `country_state_translations` VALUES (8786, 'ar', 'فوكلوز', 266);
INSERT INTO `country_state_translations` VALUES (8787, 'ar', 'تارن', 267);
INSERT INTO `country_state_translations` VALUES (8788, 'ar', 'فيين', 268);
INSERT INTO `country_state_translations` VALUES (8789, 'ar', 'هوت فيين', 269);
INSERT INTO `country_state_translations` VALUES (8790, 'ar', 'الفوج', 270);
INSERT INTO `country_state_translations` VALUES (8791, 'ar', 'يون', 271);
INSERT INTO `country_state_translations` VALUES (8792, 'ar', 'تيريتوير-دي-بلفور', 272);
INSERT INTO `country_state_translations` VALUES (8793, 'ar', 'إيسون', 273);
INSERT INTO `country_state_translations` VALUES (8794, 'ar', 'هوت دو سين', 274);
INSERT INTO `country_state_translations` VALUES (8795, 'ar', 'سين سان دوني', 275);
INSERT INTO `country_state_translations` VALUES (8796, 'ar', 'فال دو مارن', 276);
INSERT INTO `country_state_translations` VALUES (8797, 'ar', 'فال دواز', 277);
INSERT INTO `country_state_translations` VALUES (8798, 'ar', 'ألبا', 278);
INSERT INTO `country_state_translations` VALUES (8799, 'ar', 'اراد', 279);
INSERT INTO `country_state_translations` VALUES (8800, 'ar', 'ARGES', 280);
INSERT INTO `country_state_translations` VALUES (8801, 'ar', 'باكاو', 281);
INSERT INTO `country_state_translations` VALUES (8802, 'ar', 'بيهور', 282);
INSERT INTO `country_state_translations` VALUES (8803, 'ar', 'بيستريتا ناسود', 283);
INSERT INTO `country_state_translations` VALUES (8804, 'ar', 'بوتوساني', 284);
INSERT INTO `country_state_translations` VALUES (8805, 'ar', 'براشوف', 285);
INSERT INTO `country_state_translations` VALUES (8806, 'ar', 'برايلا', 286);
INSERT INTO `country_state_translations` VALUES (8807, 'ar', 'بوخارست', 287);
INSERT INTO `country_state_translations` VALUES (8808, 'ar', 'بوزاو', 288);
INSERT INTO `country_state_translations` VALUES (8809, 'ar', 'كاراس سيفيرين', 289);
INSERT INTO `country_state_translations` VALUES (8810, 'ar', 'كالاراسي', 290);
INSERT INTO `country_state_translations` VALUES (8811, 'ar', 'كلوج', 291);
INSERT INTO `country_state_translations` VALUES (8812, 'ar', 'كونستانتا', 292);
INSERT INTO `country_state_translations` VALUES (8813, 'ar', 'كوفاسنا', 293);
INSERT INTO `country_state_translations` VALUES (8814, 'ar', 'دامبوفيتا', 294);
INSERT INTO `country_state_translations` VALUES (8815, 'ar', 'دولج', 295);
INSERT INTO `country_state_translations` VALUES (8816, 'ar', 'جالاتي', 296);
INSERT INTO `country_state_translations` VALUES (8817, 'ar', 'Giurgiu', 297);
INSERT INTO `country_state_translations` VALUES (8818, 'ar', 'غيورغيو', 298);
INSERT INTO `country_state_translations` VALUES (8819, 'ar', 'هارغيتا', 299);
INSERT INTO `country_state_translations` VALUES (8820, 'ar', 'هونيدوارا', 300);
INSERT INTO `country_state_translations` VALUES (8821, 'ar', 'ايالوميتا', 301);
INSERT INTO `country_state_translations` VALUES (8822, 'ar', 'ياشي', 302);
INSERT INTO `country_state_translations` VALUES (8823, 'ar', 'إيلفوف', 303);
INSERT INTO `country_state_translations` VALUES (8824, 'ar', 'مارامريس', 304);
INSERT INTO `country_state_translations` VALUES (8825, 'ar', 'MEHEDINTI', 305);
INSERT INTO `country_state_translations` VALUES (8826, 'ar', 'موريس', 306);
INSERT INTO `country_state_translations` VALUES (8827, 'ar', 'نيامتس', 307);
INSERT INTO `country_state_translations` VALUES (8828, 'ar', 'أولت', 308);
INSERT INTO `country_state_translations` VALUES (8829, 'ar', 'براهوفا', 309);
INSERT INTO `country_state_translations` VALUES (8830, 'ar', 'ساتو ماري', 310);
INSERT INTO `country_state_translations` VALUES (8831, 'ar', 'سالاج', 311);
INSERT INTO `country_state_translations` VALUES (8832, 'ar', 'سيبيو', 312);
INSERT INTO `country_state_translations` VALUES (8833, 'ar', 'سوسيفا', 313);
INSERT INTO `country_state_translations` VALUES (8834, 'ar', 'تيليورمان', 314);
INSERT INTO `country_state_translations` VALUES (8835, 'ar', 'تيم هو', 315);
INSERT INTO `country_state_translations` VALUES (8836, 'ar', 'تولسيا', 316);
INSERT INTO `country_state_translations` VALUES (8837, 'ar', 'فاسلوي', 317);
INSERT INTO `country_state_translations` VALUES (8838, 'ar', 'فالسيا', 318);
INSERT INTO `country_state_translations` VALUES (8839, 'ar', 'فرانتشا', 319);
INSERT INTO `country_state_translations` VALUES (8840, 'ar', 'Lappi', 320);
INSERT INTO `country_state_translations` VALUES (8841, 'ar', 'Pohjois-Pohjanmaa', 321);
INSERT INTO `country_state_translations` VALUES (8842, 'ar', 'كاينو', 322);
INSERT INTO `country_state_translations` VALUES (8843, 'ar', 'Pohjois-كارجالا', 323);
INSERT INTO `country_state_translations` VALUES (8844, 'ar', 'Pohjois-سافو', 324);
INSERT INTO `country_state_translations` VALUES (8845, 'ar', 'Etelä-سافو', 325);
INSERT INTO `country_state_translations` VALUES (8846, 'ar', 'Etelä-Pohjanmaa', 326);
INSERT INTO `country_state_translations` VALUES (8847, 'ar', 'Pohjanmaa', 327);
INSERT INTO `country_state_translations` VALUES (8848, 'ar', 'بيركنما', 328);
INSERT INTO `country_state_translations` VALUES (8849, 'ar', 'ساتا كونتا', 329);
INSERT INTO `country_state_translations` VALUES (8850, 'ar', 'كسكي-Pohjanmaa', 330);
INSERT INTO `country_state_translations` VALUES (8851, 'ar', 'كسكي-سومي', 331);
INSERT INTO `country_state_translations` VALUES (8852, 'ar', 'Varsinais-سومي', 332);
INSERT INTO `country_state_translations` VALUES (8853, 'ar', 'Etelä-كارجالا', 333);
INSERT INTO `country_state_translations` VALUES (8854, 'ar', 'Päijät-Häme', 334);
INSERT INTO `country_state_translations` VALUES (8855, 'ar', 'كانتا-HAME', 335);
INSERT INTO `country_state_translations` VALUES (8856, 'ar', 'أوسيما', 336);
INSERT INTO `country_state_translations` VALUES (8857, 'ar', 'أوسيما', 337);
INSERT INTO `country_state_translations` VALUES (8858, 'ar', 'كومنلاكسو', 338);
INSERT INTO `country_state_translations` VALUES (8859, 'ar', 'Ahvenanmaa', 339);
INSERT INTO `country_state_translations` VALUES (8860, 'ar', 'Harjumaa', 340);
INSERT INTO `country_state_translations` VALUES (8861, 'ar', 'هيوما', 341);
INSERT INTO `country_state_translations` VALUES (8862, 'ar', 'المؤسسة الدولية للتنمية فيروما', 342);
INSERT INTO `country_state_translations` VALUES (8863, 'ar', 'جوغفما', 343);
INSERT INTO `country_state_translations` VALUES (8864, 'ar', 'يارفا', 344);
INSERT INTO `country_state_translations` VALUES (8865, 'ar', 'انيما', 345);
INSERT INTO `country_state_translations` VALUES (8866, 'ar', 'اني فيريوما', 346);
INSERT INTO `country_state_translations` VALUES (8867, 'ar', 'بولفاما', 347);
INSERT INTO `country_state_translations` VALUES (8868, 'ar', 'بارنوما', 348);
INSERT INTO `country_state_translations` VALUES (8869, 'ar', 'Raplamaa', 349);
INSERT INTO `country_state_translations` VALUES (8870, 'ar', 'Saaremaa', 350);
INSERT INTO `country_state_translations` VALUES (8871, 'ar', 'Tartumaa', 351);
INSERT INTO `country_state_translations` VALUES (8872, 'ar', 'Valgamaa', 352);
INSERT INTO `country_state_translations` VALUES (8873, 'ar', 'Viljandimaa', 353);
INSERT INTO `country_state_translations` VALUES (8874, 'ar', 'روايات Salacgr novvas', 354);
INSERT INTO `country_state_translations` VALUES (8875, 'ar', 'داوجافبيلس', 355);
INSERT INTO `country_state_translations` VALUES (8876, 'ar', 'يلغافا', 356);
INSERT INTO `country_state_translations` VALUES (8877, 'ar', 'يكاب', 357);
INSERT INTO `country_state_translations` VALUES (8878, 'ar', 'يورمال', 358);
INSERT INTO `country_state_translations` VALUES (8879, 'ar', 'يابايا', 359);
INSERT INTO `country_state_translations` VALUES (8880, 'ar', 'ليباج أبريس', 360);
INSERT INTO `country_state_translations` VALUES (8881, 'ar', 'ريزكن', 361);
INSERT INTO `country_state_translations` VALUES (8882, 'ar', 'ريغا', 362);
INSERT INTO `country_state_translations` VALUES (8883, 'ar', 'مقاطعة ريغا', 363);
INSERT INTO `country_state_translations` VALUES (8884, 'ar', 'فالميرا', 364);
INSERT INTO `country_state_translations` VALUES (8885, 'ar', 'فنتسبيلز', 365);
INSERT INTO `country_state_translations` VALUES (8886, 'ar', 'روايات Aglonas', 366);
INSERT INTO `country_state_translations` VALUES (8887, 'ar', 'Aizkraukles novads', 367);
INSERT INTO `country_state_translations` VALUES (8888, 'ar', 'Aizkraukles novads', 368);
INSERT INTO `country_state_translations` VALUES (8889, 'ar', 'Aknīstes novads', 369);
INSERT INTO `country_state_translations` VALUES (8890, 'ar', 'Alojas novads', 370);
INSERT INTO `country_state_translations` VALUES (8891, 'ar', 'روايات Alsungas', 371);
INSERT INTO `country_state_translations` VALUES (8892, 'ar', 'ألكسنس أبريز', 372);
INSERT INTO `country_state_translations` VALUES (8893, 'ar', 'روايات أماتاس', 373);
INSERT INTO `country_state_translations` VALUES (8894, 'ar', 'قرود الروايات', 374);
INSERT INTO `country_state_translations` VALUES (8895, 'ar', 'روايات أوسيس', 375);
INSERT INTO `country_state_translations` VALUES (8896, 'ar', 'بابيت الروايات', 376);
INSERT INTO `country_state_translations` VALUES (8897, 'ar', 'Baldones الروايات', 377);
INSERT INTO `country_state_translations` VALUES (8898, 'ar', 'بالتينافاس الروايات', 378);
INSERT INTO `country_state_translations` VALUES (8899, 'ar', 'روايات بالفو', 379);
INSERT INTO `country_state_translations` VALUES (8900, 'ar', 'Bauskas الروايات', 380);
INSERT INTO `country_state_translations` VALUES (8901, 'ar', 'Beverīnas novads', 381);
INSERT INTO `country_state_translations` VALUES (8902, 'ar', 'Novads Brocēnu', 382);
INSERT INTO `country_state_translations` VALUES (8903, 'ar', 'Novads Burtnieku', 383);
INSERT INTO `country_state_translations` VALUES (8904, 'ar', 'Carnikavas novads', 384);
INSERT INTO `country_state_translations` VALUES (8905, 'ar', 'Cesvaines novads', 385);
INSERT INTO `country_state_translations` VALUES (8906, 'ar', 'Ciblas novads', 386);
INSERT INTO `country_state_translations` VALUES (8907, 'ar', 'تسو أبريس', 387);
INSERT INTO `country_state_translations` VALUES (8908, 'ar', 'Dagdas novads', 388);
INSERT INTO `country_state_translations` VALUES (8909, 'ar', 'Daugavpils novads', 389);
INSERT INTO `country_state_translations` VALUES (8910, 'ar', 'روايات دوبيليس', 390);
INSERT INTO `country_state_translations` VALUES (8911, 'ar', 'ديربيس الروايات', 391);
INSERT INTO `country_state_translations` VALUES (8912, 'ar', 'ديربيس الروايات', 392);
INSERT INTO `country_state_translations` VALUES (8913, 'ar', 'يشرك الروايات', 393);
INSERT INTO `country_state_translations` VALUES (8914, 'ar', 'Garkalnes novads', 394);
INSERT INTO `country_state_translations` VALUES (8915, 'ar', 'Grobiņas novads', 395);
INSERT INTO `country_state_translations` VALUES (8916, 'ar', 'غولبينيس الروايات', 396);
INSERT INTO `country_state_translations` VALUES (8917, 'ar', 'إيكافاس روايات', 397);
INSERT INTO `country_state_translations` VALUES (8918, 'ar', 'Ikškiles novads', 398);
INSERT INTO `country_state_translations` VALUES (8919, 'ar', 'Ilūkstes novads', 399);
INSERT INTO `country_state_translations` VALUES (8920, 'ar', 'روايات Inčukalna', 400);
INSERT INTO `country_state_translations` VALUES (8921, 'ar', 'Jaunjelgavas novads', 401);
INSERT INTO `country_state_translations` VALUES (8922, 'ar', 'Jaunpiebalgas novads', 402);
INSERT INTO `country_state_translations` VALUES (8923, 'ar', 'روايات Jaunpiebalgas', 403);
INSERT INTO `country_state_translations` VALUES (8924, 'ar', 'Jelgavas novads', 404);
INSERT INTO `country_state_translations` VALUES (8925, 'ar', 'جيكابيلس أبريز', 405);
INSERT INTO `country_state_translations` VALUES (8926, 'ar', 'روايات كاندافاس', 406);
INSERT INTO `country_state_translations` VALUES (8927, 'ar', 'Kokneses الروايات', 407);
INSERT INTO `country_state_translations` VALUES (8928, 'ar', 'Krimuldas novads', 408);
INSERT INTO `country_state_translations` VALUES (8929, 'ar', 'Krustpils الروايات', 409);
INSERT INTO `country_state_translations` VALUES (8930, 'ar', 'Krāslavas Apriņķis', 410);
INSERT INTO `country_state_translations` VALUES (8931, 'ar', 'كولدوغاس أبريز', 411);
INSERT INTO `country_state_translations` VALUES (8932, 'ar', 'Kārsavas novads', 412);
INSERT INTO `country_state_translations` VALUES (8933, 'ar', 'روايات ييلفاريس', 413);
INSERT INTO `country_state_translations` VALUES (8934, 'ar', 'ليمباو أبريز', 414);
INSERT INTO `country_state_translations` VALUES (8935, 'ar', 'روايات لباناس', 415);
INSERT INTO `country_state_translations` VALUES (8936, 'ar', 'روايات لودزاس', 416);
INSERT INTO `country_state_translations` VALUES (8937, 'ar', 'مقاطعة ليجاتني', 417);
INSERT INTO `country_state_translations` VALUES (8938, 'ar', 'مقاطعة ليفاني', 418);
INSERT INTO `country_state_translations` VALUES (8939, 'ar', 'مادونا روايات', 419);
INSERT INTO `country_state_translations` VALUES (8940, 'ar', 'Mazsalacas novads', 420);
INSERT INTO `country_state_translations` VALUES (8941, 'ar', 'روايات مالبلز', 421);
INSERT INTO `country_state_translations` VALUES (8942, 'ar', 'Mārupes novads', 422);
INSERT INTO `country_state_translations` VALUES (8943, 'ar', 'نوفاو نوكشنو', 423);
INSERT INTO `country_state_translations` VALUES (8944, 'ar', 'روايات نيريتاس', 424);
INSERT INTO `country_state_translations` VALUES (8945, 'ar', 'روايات نيكاس', 425);
INSERT INTO `country_state_translations` VALUES (8946, 'ar', 'أغنام الروايات', 426);
INSERT INTO `country_state_translations` VALUES (8947, 'ar', 'أولينيس الروايات', 427);
INSERT INTO `country_state_translations` VALUES (8948, 'ar', 'روايات Ozolnieku', 428);
INSERT INTO `country_state_translations` VALUES (8949, 'ar', 'بريسيو أبرييس', 429);
INSERT INTO `country_state_translations` VALUES (8950, 'ar', 'Priekules الروايات', 430);
INSERT INTO `country_state_translations` VALUES (8951, 'ar', 'كوندادو دي بريكوي', 431);
INSERT INTO `country_state_translations` VALUES (8952, 'ar', 'Pärgaujas novads', 432);
INSERT INTO `country_state_translations` VALUES (8953, 'ar', 'روايات بافيلوستاس', 433);
INSERT INTO `country_state_translations` VALUES (8954, 'ar', 'بلافيناس مقاطعة', 434);
INSERT INTO `country_state_translations` VALUES (8955, 'ar', 'روناس روايات', 435);
INSERT INTO `country_state_translations` VALUES (8956, 'ar', 'Riebiņu novads', 436);
INSERT INTO `country_state_translations` VALUES (8957, 'ar', 'روجاس روايات', 437);
INSERT INTO `country_state_translations` VALUES (8958, 'ar', 'Novads روباو', 438);
INSERT INTO `country_state_translations` VALUES (8959, 'ar', 'روكافاس روايات', 439);
INSERT INTO `country_state_translations` VALUES (8960, 'ar', 'روغاجو روايات', 440);
INSERT INTO `country_state_translations` VALUES (8961, 'ar', 'رندلس الروايات', 441);
INSERT INTO `country_state_translations` VALUES (8962, 'ar', 'Radzeknes novads', 442);
INSERT INTO `country_state_translations` VALUES (8963, 'ar', 'Rūjienas novads', 443);
INSERT INTO `country_state_translations` VALUES (8964, 'ar', 'بلدية سالاسغريفا', 444);
INSERT INTO `country_state_translations` VALUES (8965, 'ar', 'روايات سالاس', 445);
INSERT INTO `country_state_translations` VALUES (8966, 'ar', 'Salaspils novads', 446);
INSERT INTO `country_state_translations` VALUES (8967, 'ar', 'روايات سالدوس', 447);
INSERT INTO `country_state_translations` VALUES (8968, 'ar', 'Novuls Saulkrastu', 448);
INSERT INTO `country_state_translations` VALUES (8969, 'ar', 'سيغولداس روايات', 449);
INSERT INTO `country_state_translations` VALUES (8970, 'ar', 'Skrundas novads', 450);
INSERT INTO `country_state_translations` VALUES (8971, 'ar', 'مقاطعة Skrīveri', 451);
INSERT INTO `country_state_translations` VALUES (8972, 'ar', 'يبتسم الروايات', 452);
INSERT INTO `country_state_translations` VALUES (8973, 'ar', 'روايات Stopiņu', 453);
INSERT INTO `country_state_translations` VALUES (8974, 'ar', 'روايات Stren novu', 454);
INSERT INTO `country_state_translations` VALUES (8975, 'ar', 'سجاس روايات', 455);
INSERT INTO `country_state_translations` VALUES (8976, 'ar', 'روايات تالسو', 456);
INSERT INTO `country_state_translations` VALUES (8977, 'ar', 'توكوما الروايات', 457);
INSERT INTO `country_state_translations` VALUES (8978, 'ar', 'Tērvetes novads', 458);
INSERT INTO `country_state_translations` VALUES (8979, 'ar', 'Vaiņodes novads', 459);
INSERT INTO `country_state_translations` VALUES (8980, 'ar', 'فالكاس الروايات', 460);
INSERT INTO `country_state_translations` VALUES (8981, 'ar', 'فالميراس الروايات', 461);
INSERT INTO `country_state_translations` VALUES (8982, 'ar', 'مقاطعة فاكلاني', 462);
INSERT INTO `country_state_translations` VALUES (8983, 'ar', 'Vecpiebalgas novads', 463);
INSERT INTO `country_state_translations` VALUES (8984, 'ar', 'روايات Vecumnieku', 464);
INSERT INTO `country_state_translations` VALUES (8985, 'ar', 'فنتسبيلس الروايات', 465);
INSERT INTO `country_state_translations` VALUES (8986, 'ar', 'Viesītes Novads', 466);
INSERT INTO `country_state_translations` VALUES (8987, 'ar', 'Viļakas novads', 467);
INSERT INTO `country_state_translations` VALUES (8988, 'ar', 'روايات فيناو', 468);
INSERT INTO `country_state_translations` VALUES (8989, 'ar', 'Vārkavas novads', 469);
INSERT INTO `country_state_translations` VALUES (8990, 'ar', 'روايات زيلوبس', 470);
INSERT INTO `country_state_translations` VALUES (8991, 'ar', 'مقاطعة أدازي', 471);
INSERT INTO `country_state_translations` VALUES (8992, 'ar', 'مقاطعة Erglu', 472);
INSERT INTO `country_state_translations` VALUES (8993, 'ar', 'مقاطعة كيغمس', 473);
INSERT INTO `country_state_translations` VALUES (8994, 'ar', 'مقاطعة كيكافا', 474);
INSERT INTO `country_state_translations` VALUES (8995, 'ar', 'Alytaus Apskritis', 475);
INSERT INTO `country_state_translations` VALUES (8996, 'ar', 'كاونو ابكريتيس', 476);
INSERT INTO `country_state_translations` VALUES (8997, 'ar', 'Klaipėdos apskritis', 477);
INSERT INTO `country_state_translations` VALUES (8998, 'ar', 'Marijampol\'s apskritis', 478);
INSERT INTO `country_state_translations` VALUES (8999, 'ar', 'Panevėžio apskritis', 479);
INSERT INTO `country_state_translations` VALUES (9000, 'ar', 'uliaulių apskritis', 480);
INSERT INTO `country_state_translations` VALUES (9001, 'ar', 'Taurag\'s apskritis', 481);
INSERT INTO `country_state_translations` VALUES (9002, 'ar', 'Telšių apskritis', 482);
INSERT INTO `country_state_translations` VALUES (9003, 'ar', 'Utenos apskritis', 483);
INSERT INTO `country_state_translations` VALUES (9004, 'ar', 'فيلنياوس ابكريتيس', 484);
INSERT INTO `country_state_translations` VALUES (9005, 'ar', 'فدان', 485);
INSERT INTO `country_state_translations` VALUES (9006, 'ar', 'ألاغواس', 486);
INSERT INTO `country_state_translations` VALUES (9007, 'ar', 'أمابا', 487);
INSERT INTO `country_state_translations` VALUES (9008, 'ar', 'أمازوناس', 488);
INSERT INTO `country_state_translations` VALUES (9009, 'ar', 'باهيا', 489);
INSERT INTO `country_state_translations` VALUES (9010, 'ar', 'سيارا', 490);
INSERT INTO `country_state_translations` VALUES (9011, 'ar', 'إسبيريتو سانتو', 491);
INSERT INTO `country_state_translations` VALUES (9012, 'ar', 'غوياس', 492);
INSERT INTO `country_state_translations` VALUES (9013, 'ar', 'مارانهاو', 493);
INSERT INTO `country_state_translations` VALUES (9014, 'ar', 'ماتو جروسو', 494);
INSERT INTO `country_state_translations` VALUES (9015, 'ar', 'ماتو جروسو دو سول', 495);
INSERT INTO `country_state_translations` VALUES (9016, 'ar', 'ميناس جريس', 496);
INSERT INTO `country_state_translations` VALUES (9017, 'ar', 'بارا', 497);
INSERT INTO `country_state_translations` VALUES (9018, 'ar', 'بارايبا', 498);
INSERT INTO `country_state_translations` VALUES (9019, 'ar', 'بارانا', 499);
INSERT INTO `country_state_translations` VALUES (9020, 'ar', 'بيرنامبوكو', 500);
INSERT INTO `country_state_translations` VALUES (9021, 'ar', 'بياوي', 501);
INSERT INTO `country_state_translations` VALUES (9022, 'ar', 'ريو دي جانيرو', 502);
INSERT INTO `country_state_translations` VALUES (9023, 'ar', 'ريو غراندي دو نورتي', 503);
INSERT INTO `country_state_translations` VALUES (9024, 'ar', 'ريو غراندي دو سول', 504);
INSERT INTO `country_state_translations` VALUES (9025, 'ar', 'روندونيا', 505);
INSERT INTO `country_state_translations` VALUES (9026, 'ar', 'رورايما', 506);
INSERT INTO `country_state_translations` VALUES (9027, 'ar', 'سانتا كاتارينا', 507);
INSERT INTO `country_state_translations` VALUES (9028, 'ar', 'ساو باولو', 508);
INSERT INTO `country_state_translations` VALUES (9029, 'ar', 'سيرغيبي', 509);
INSERT INTO `country_state_translations` VALUES (9030, 'ar', 'توكانتينز', 510);
INSERT INTO `country_state_translations` VALUES (9031, 'ar', 'وفي مقاطعة الاتحادية', 511);
INSERT INTO `country_state_translations` VALUES (9032, 'ar', 'Zagrebačka زوبانيا', 512);
INSERT INTO `country_state_translations` VALUES (9033, 'ar', 'Krapinsko-zagorska زوبانيا', 513);
INSERT INTO `country_state_translations` VALUES (9034, 'ar', 'Sisačko-moslavačka زوبانيا', 514);
INSERT INTO `country_state_translations` VALUES (9035, 'ar', 'كارلوفيتش شوبانيا', 515);
INSERT INTO `country_state_translations` VALUES (9036, 'ar', 'فارادينسكا زوبانيجا', 516);
INSERT INTO `country_state_translations` VALUES (9037, 'ar', 'Koprivničko-križevačka زوبانيجا', 517);
INSERT INTO `country_state_translations` VALUES (9038, 'ar', 'بيلوفارسكو-بيلوجورسكا', 518);
INSERT INTO `country_state_translations` VALUES (9039, 'ar', 'بريمورسكو غورانسكا سوبانيا', 519);
INSERT INTO `country_state_translations` VALUES (9040, 'ar', 'ليكو سينيسكا زوبانيا', 520);
INSERT INTO `country_state_translations` VALUES (9041, 'ar', 'Virovitičko-podravska زوبانيا', 521);
INSERT INTO `country_state_translations` VALUES (9042, 'ar', 'Požeško-slavonska županija', 522);
INSERT INTO `country_state_translations` VALUES (9043, 'ar', 'Brodsko-posavska županija', 523);
INSERT INTO `country_state_translations` VALUES (9044, 'ar', 'زادارسكا زوبانيجا', 524);
INSERT INTO `country_state_translations` VALUES (9045, 'ar', 'Osječko-baranjska županija', 525);
INSERT INTO `country_state_translations` VALUES (9046, 'ar', 'شيبنسكو-كنينسكا سوبانيا', 526);
INSERT INTO `country_state_translations` VALUES (9047, 'ar', 'Virovitičko-podravska زوبانيا', 527);
INSERT INTO `country_state_translations` VALUES (9048, 'ar', 'Splitsko-dalmatinska زوبانيا', 528);
INSERT INTO `country_state_translations` VALUES (9049, 'ar', 'Istarska زوبانيا', 529);
INSERT INTO `country_state_translations` VALUES (9050, 'ar', 'Dubrovačko-neretvanska زوبانيا', 530);
INSERT INTO `country_state_translations` VALUES (9051, 'ar', 'Međimurska زوبانيا', 531);
INSERT INTO `country_state_translations` VALUES (9052, 'ar', 'غراد زغرب', 532);
INSERT INTO `country_state_translations` VALUES (9053, 'ar', 'جزر أندامان ونيكوبار', 533);
INSERT INTO `country_state_translations` VALUES (9054, 'ar', 'ولاية اندرا براديش', 534);
INSERT INTO `country_state_translations` VALUES (9055, 'ar', 'اروناتشال براديش', 535);
INSERT INTO `country_state_translations` VALUES (9056, 'ar', 'أسام', 536);
INSERT INTO `country_state_translations` VALUES (9057, 'ar', 'بيهار', 537);
INSERT INTO `country_state_translations` VALUES (9058, 'ar', 'شانديغار', 538);
INSERT INTO `country_state_translations` VALUES (9059, 'ar', 'تشهاتيسجاره', 539);
INSERT INTO `country_state_translations` VALUES (9060, 'ar', 'دادرا ونجار هافيلي', 540);
INSERT INTO `country_state_translations` VALUES (9061, 'ar', 'دامان وديو', 541);
INSERT INTO `country_state_translations` VALUES (9062, 'ar', 'دلهي', 542);
INSERT INTO `country_state_translations` VALUES (9063, 'ar', 'غوا', 543);
INSERT INTO `country_state_translations` VALUES (9064, 'ar', 'غوجارات', 544);
INSERT INTO `country_state_translations` VALUES (9065, 'ar', 'هاريانا', 545);
INSERT INTO `country_state_translations` VALUES (9066, 'ar', 'هيماشال براديش', 546);
INSERT INTO `country_state_translations` VALUES (9067, 'ar', 'جامو وكشمير', 547);
INSERT INTO `country_state_translations` VALUES (9068, 'ar', 'جهارخاند', 548);
INSERT INTO `country_state_translations` VALUES (9069, 'ar', 'كارناتاكا', 549);
INSERT INTO `country_state_translations` VALUES (9070, 'ar', 'ولاية كيرالا', 550);
INSERT INTO `country_state_translations` VALUES (9071, 'ar', 'اكشادويب', 551);
INSERT INTO `country_state_translations` VALUES (9072, 'ar', 'ماديا براديش', 552);
INSERT INTO `country_state_translations` VALUES (9073, 'ar', 'ماهاراشترا', 553);
INSERT INTO `country_state_translations` VALUES (9074, 'ar', 'مانيبور', 554);
INSERT INTO `country_state_translations` VALUES (9075, 'ar', 'ميغالايا', 555);
INSERT INTO `country_state_translations` VALUES (9076, 'ar', 'ميزورام', 556);
INSERT INTO `country_state_translations` VALUES (9077, 'ar', 'ناجالاند', 557);
INSERT INTO `country_state_translations` VALUES (9078, 'ar', 'أوديشا', 558);
INSERT INTO `country_state_translations` VALUES (9079, 'ar', 'بودوتشيري', 559);
INSERT INTO `country_state_translations` VALUES (9080, 'ar', 'البنجاب', 560);
INSERT INTO `country_state_translations` VALUES (9081, 'ar', 'راجستان', 561);
INSERT INTO `country_state_translations` VALUES (9082, 'ar', 'سيكيم', 562);
INSERT INTO `country_state_translations` VALUES (9083, 'ar', 'تاميل نادو', 563);
INSERT INTO `country_state_translations` VALUES (9084, 'ar', 'تيلانجانا', 564);
INSERT INTO `country_state_translations` VALUES (9085, 'ar', 'تريبورا', 565);
INSERT INTO `country_state_translations` VALUES (9086, 'ar', 'ولاية اوتار براديش', 566);
INSERT INTO `country_state_translations` VALUES (9087, 'ar', 'أوتارانتشال', 567);
INSERT INTO `country_state_translations` VALUES (9088, 'ar', 'البنغال الغربية', 568);
INSERT INTO `country_state_translations` VALUES (9089, 'fa', 'آلاباما', 1);
INSERT INTO `country_state_translations` VALUES (9090, 'fa', 'آلاسکا', 2);
INSERT INTO `country_state_translations` VALUES (9091, 'fa', 'ساموآ آمریکایی', 3);
INSERT INTO `country_state_translations` VALUES (9092, 'fa', 'آریزونا', 4);
INSERT INTO `country_state_translations` VALUES (9093, 'fa', 'آرکانزاس', 5);
INSERT INTO `country_state_translations` VALUES (9094, 'fa', 'نیروهای مسلح آفریقا', 6);
INSERT INTO `country_state_translations` VALUES (9095, 'fa', 'Armed Forces America', 7);
INSERT INTO `country_state_translations` VALUES (9096, 'fa', 'نیروهای مسلح کانادا', 8);
INSERT INTO `country_state_translations` VALUES (9097, 'fa', 'نیروهای مسلح اروپا', 9);
INSERT INTO `country_state_translations` VALUES (9098, 'fa', 'نیروهای مسلح خاورمیانه', 10);
INSERT INTO `country_state_translations` VALUES (9099, 'fa', 'نیروهای مسلح اقیانوس آرام', 11);
INSERT INTO `country_state_translations` VALUES (9100, 'fa', 'کالیفرنیا', 12);
INSERT INTO `country_state_translations` VALUES (9101, 'fa', 'کلرادو', 13);
INSERT INTO `country_state_translations` VALUES (9102, 'fa', 'کانکتیکات', 14);
INSERT INTO `country_state_translations` VALUES (9103, 'fa', 'دلاور', 15);
INSERT INTO `country_state_translations` VALUES (9104, 'fa', 'منطقه کلمبیا', 16);
INSERT INTO `country_state_translations` VALUES (9105, 'fa', 'ایالات فدرال میکرونزی', 17);
INSERT INTO `country_state_translations` VALUES (9106, 'fa', 'فلوریدا', 18);
INSERT INTO `country_state_translations` VALUES (9107, 'fa', 'جورجیا', 19);
INSERT INTO `country_state_translations` VALUES (9108, 'fa', 'گوام', 20);
INSERT INTO `country_state_translations` VALUES (9109, 'fa', 'هاوایی', 21);
INSERT INTO `country_state_translations` VALUES (9110, 'fa', 'آیداهو', 22);
INSERT INTO `country_state_translations` VALUES (9111, 'fa', 'ایلینویز', 23);
INSERT INTO `country_state_translations` VALUES (9112, 'fa', 'ایندیانا', 24);
INSERT INTO `country_state_translations` VALUES (9113, 'fa', 'آیووا', 25);
INSERT INTO `country_state_translations` VALUES (9114, 'fa', 'کانزاس', 26);
INSERT INTO `country_state_translations` VALUES (9115, 'fa', 'کنتاکی', 27);
INSERT INTO `country_state_translations` VALUES (9116, 'fa', 'لوئیزیانا', 28);
INSERT INTO `country_state_translations` VALUES (9117, 'fa', 'ماین', 29);
INSERT INTO `country_state_translations` VALUES (9118, 'fa', 'مای', 30);
INSERT INTO `country_state_translations` VALUES (9119, 'fa', 'مریلند', 31);
INSERT INTO `country_state_translations` VALUES (9120, 'fa', ' ', 32);
INSERT INTO `country_state_translations` VALUES (9121, 'fa', 'میشیگان', 33);
INSERT INTO `country_state_translations` VALUES (9122, 'fa', 'مینه سوتا', 34);
INSERT INTO `country_state_translations` VALUES (9123, 'fa', 'می سی سی پی', 35);
INSERT INTO `country_state_translations` VALUES (9124, 'fa', 'میسوری', 36);
INSERT INTO `country_state_translations` VALUES (9125, 'fa', 'مونتانا', 37);
INSERT INTO `country_state_translations` VALUES (9126, 'fa', 'نبراسکا', 38);
INSERT INTO `country_state_translations` VALUES (9127, 'fa', 'نواد', 39);
INSERT INTO `country_state_translations` VALUES (9128, 'fa', 'نیوهمپشایر', 40);
INSERT INTO `country_state_translations` VALUES (9129, 'fa', 'نیوجرسی', 41);
INSERT INTO `country_state_translations` VALUES (9130, 'fa', 'نیومکزیکو', 42);
INSERT INTO `country_state_translations` VALUES (9131, 'fa', 'نیویورک', 43);
INSERT INTO `country_state_translations` VALUES (9132, 'fa', 'کارولینای شمالی', 44);
INSERT INTO `country_state_translations` VALUES (9133, 'fa', 'داکوتای شمالی', 45);
INSERT INTO `country_state_translations` VALUES (9134, 'fa', 'جزایر ماریانای شمالی', 46);
INSERT INTO `country_state_translations` VALUES (9135, 'fa', 'اوهایو', 47);
INSERT INTO `country_state_translations` VALUES (9136, 'fa', 'اوکلاهما', 48);
INSERT INTO `country_state_translations` VALUES (9137, 'fa', 'اورگان', 49);
INSERT INTO `country_state_translations` VALUES (9138, 'fa', 'پالائو', 50);
INSERT INTO `country_state_translations` VALUES (9139, 'fa', 'پنسیلوانیا', 51);
INSERT INTO `country_state_translations` VALUES (9140, 'fa', 'پورتوریکو', 52);
INSERT INTO `country_state_translations` VALUES (9141, 'fa', 'رود آیلند', 53);
INSERT INTO `country_state_translations` VALUES (9142, 'fa', 'کارولینای جنوبی', 54);
INSERT INTO `country_state_translations` VALUES (9143, 'fa', 'داکوتای جنوبی', 55);
INSERT INTO `country_state_translations` VALUES (9144, 'fa', 'تنسی', 56);
INSERT INTO `country_state_translations` VALUES (9145, 'fa', 'تگزاس', 57);
INSERT INTO `country_state_translations` VALUES (9146, 'fa', 'یوتا', 58);
INSERT INTO `country_state_translations` VALUES (9147, 'fa', 'ورمونت', 59);
INSERT INTO `country_state_translations` VALUES (9148, 'fa', 'جزایر ویرجین', 60);
INSERT INTO `country_state_translations` VALUES (9149, 'fa', 'ویرجینیا', 61);
INSERT INTO `country_state_translations` VALUES (9150, 'fa', 'واشنگتن', 62);
INSERT INTO `country_state_translations` VALUES (9151, 'fa', 'ویرجینیای غربی', 63);
INSERT INTO `country_state_translations` VALUES (9152, 'fa', 'ویسکانسین', 64);
INSERT INTO `country_state_translations` VALUES (9153, 'fa', 'وایومینگ', 65);
INSERT INTO `country_state_translations` VALUES (9154, 'fa', 'آلبرتا', 66);
INSERT INTO `country_state_translations` VALUES (9155, 'fa', 'بریتیش کلمبیا', 67);
INSERT INTO `country_state_translations` VALUES (9156, 'fa', 'مانیتوبا', 68);
INSERT INTO `country_state_translations` VALUES (9157, 'fa', 'نیوفاندلند و لابرادور', 69);
INSERT INTO `country_state_translations` VALUES (9158, 'fa', 'نیوبرانزویک', 70);
INSERT INTO `country_state_translations` VALUES (9159, 'fa', 'نوا اسکوشیا', 71);
INSERT INTO `country_state_translations` VALUES (9160, 'fa', 'سرزمینهای شمال غربی', 72);
INSERT INTO `country_state_translations` VALUES (9161, 'fa', 'نوناووت', 73);
INSERT INTO `country_state_translations` VALUES (9162, 'fa', 'انتاریو', 74);
INSERT INTO `country_state_translations` VALUES (9163, 'fa', 'جزیره پرنس ادوارد', 75);
INSERT INTO `country_state_translations` VALUES (9164, 'fa', 'کبک', 76);
INSERT INTO `country_state_translations` VALUES (9165, 'fa', 'ساسکاتچوان', 77);
INSERT INTO `country_state_translations` VALUES (9166, 'fa', 'قلمرو یوکان', 78);
INSERT INTO `country_state_translations` VALUES (9167, 'fa', 'نیدرزاکسن', 79);
INSERT INTO `country_state_translations` VALUES (9168, 'fa', 'بادن-وورتمبرگ', 80);
INSERT INTO `country_state_translations` VALUES (9169, 'fa', 'بایرن', 81);
INSERT INTO `country_state_translations` VALUES (9170, 'fa', 'برلین', 82);
INSERT INTO `country_state_translations` VALUES (9171, 'fa', 'براندنبورگ', 83);
INSERT INTO `country_state_translations` VALUES (9172, 'fa', 'برمن', 84);
INSERT INTO `country_state_translations` VALUES (9173, 'fa', 'هامبور', 85);
INSERT INTO `country_state_translations` VALUES (9174, 'fa', 'هسن', 86);
INSERT INTO `country_state_translations` VALUES (9175, 'fa', 'مکلنبورگ-وورپومرن', 87);
INSERT INTO `country_state_translations` VALUES (9176, 'fa', 'نوردراین-وستفالن', 88);
INSERT INTO `country_state_translations` VALUES (9177, 'fa', 'راینلاند-پلاتینات', 89);
INSERT INTO `country_state_translations` VALUES (9178, 'fa', 'سارلند', 90);
INSERT INTO `country_state_translations` VALUES (9179, 'fa', 'ساچسن', 91);
INSERT INTO `country_state_translations` VALUES (9180, 'fa', 'ساچسن-آنهالت', 92);
INSERT INTO `country_state_translations` VALUES (9181, 'fa', 'شلسویگ-هولشتاین', 93);
INSERT INTO `country_state_translations` VALUES (9182, 'fa', 'تورینگی', 94);
INSERT INTO `country_state_translations` VALUES (9183, 'fa', 'وین', 95);
INSERT INTO `country_state_translations` VALUES (9184, 'fa', 'اتریش پایین', 96);
INSERT INTO `country_state_translations` VALUES (9185, 'fa', 'اتریش فوقانی', 97);
INSERT INTO `country_state_translations` VALUES (9186, 'fa', 'سالزبورگ', 98);
INSERT INTO `country_state_translations` VALUES (9187, 'fa', 'کارنتا', 99);
INSERT INTO `country_state_translations` VALUES (9188, 'fa', 'Steiermar', 100);
INSERT INTO `country_state_translations` VALUES (9189, 'fa', 'تیرول', 101);
INSERT INTO `country_state_translations` VALUES (9190, 'fa', 'بورگنلن', 102);
INSERT INTO `country_state_translations` VALUES (9191, 'fa', 'Vorarlber', 103);
INSERT INTO `country_state_translations` VALUES (9192, 'fa', 'آرگ', 104);
INSERT INTO `country_state_translations` VALUES (9193, 'fa', '', 105);
INSERT INTO `country_state_translations` VALUES (9194, 'fa', 'اپنزلسرهودن', 106);
INSERT INTO `country_state_translations` VALUES (9195, 'fa', 'بر', 107);
INSERT INTO `country_state_translations` VALUES (9196, 'fa', 'بازل-لندشفت', 108);
INSERT INTO `country_state_translations` VALUES (9197, 'fa', 'بازل استاد', 109);
INSERT INTO `country_state_translations` VALUES (9198, 'fa', 'فرایبورگ', 110);
INSERT INTO `country_state_translations` VALUES (9199, 'fa', 'گنف', 111);
INSERT INTO `country_state_translations` VALUES (9200, 'fa', 'گلاروس', 112);
INSERT INTO `country_state_translations` VALUES (9201, 'fa', 'Graubünde', 113);
INSERT INTO `country_state_translations` VALUES (9202, 'fa', 'ژورا', 114);
INSERT INTO `country_state_translations` VALUES (9203, 'fa', 'لوزرن', 115);
INSERT INTO `country_state_translations` VALUES (9204, 'fa', 'نوینبور', 116);
INSERT INTO `country_state_translations` VALUES (9205, 'fa', 'نیدالد', 117);
INSERT INTO `country_state_translations` VALUES (9206, 'fa', 'اوبولدن', 118);
INSERT INTO `country_state_translations` VALUES (9207, 'fa', 'سنت گالن', 119);
INSERT INTO `country_state_translations` VALUES (9208, 'fa', 'شافهاوز', 120);
INSERT INTO `country_state_translations` VALUES (9209, 'fa', 'سولوتور', 121);
INSERT INTO `country_state_translations` VALUES (9210, 'fa', 'شووی', 122);
INSERT INTO `country_state_translations` VALUES (9211, 'fa', 'تورگاو', 123);
INSERT INTO `country_state_translations` VALUES (9212, 'fa', 'تسسی', 124);
INSERT INTO `country_state_translations` VALUES (9213, 'fa', 'اوری', 125);
INSERT INTO `country_state_translations` VALUES (9214, 'fa', 'وادت', 126);
INSERT INTO `country_state_translations` VALUES (9215, 'fa', 'والی', 127);
INSERT INTO `country_state_translations` VALUES (9216, 'fa', 'ز', 128);
INSERT INTO `country_state_translations` VALUES (9217, 'fa', 'زوریخ', 129);
INSERT INTO `country_state_translations` VALUES (9218, 'fa', 'کورونا', 130);
INSERT INTO `country_state_translations` VALUES (9219, 'fa', 'آلاوا', 131);
INSERT INTO `country_state_translations` VALUES (9220, 'fa', 'آلبوم', 132);
INSERT INTO `country_state_translations` VALUES (9221, 'fa', 'آلیکانت', 133);
INSERT INTO `country_state_translations` VALUES (9222, 'fa', 'آلمریا', 134);
INSERT INTO `country_state_translations` VALUES (9223, 'fa', 'آستوریا', 135);
INSERT INTO `country_state_translations` VALUES (9224, 'fa', 'آویلا', 136);
INSERT INTO `country_state_translations` VALUES (9225, 'fa', 'باداژوز', 137);
INSERT INTO `country_state_translations` VALUES (9226, 'fa', 'ضرب و شتم', 138);
INSERT INTO `country_state_translations` VALUES (9227, 'fa', 'بارسلون', 139);
INSERT INTO `country_state_translations` VALUES (9228, 'fa', 'بورگو', 140);
INSERT INTO `country_state_translations` VALUES (9229, 'fa', 'کاسر', 141);
INSERT INTO `country_state_translations` VALUES (9230, 'fa', 'کادی', 142);
INSERT INTO `country_state_translations` VALUES (9231, 'fa', 'کانتابریا', 143);
INSERT INTO `country_state_translations` VALUES (9232, 'fa', 'کاستلون', 144);
INSERT INTO `country_state_translations` VALUES (9233, 'fa', 'سوت', 145);
INSERT INTO `country_state_translations` VALUES (9234, 'fa', 'سیوداد واقعی', 146);
INSERT INTO `country_state_translations` VALUES (9235, 'fa', 'کوردوب', 147);
INSERT INTO `country_state_translations` VALUES (9236, 'fa', 'Cuenc', 148);
INSERT INTO `country_state_translations` VALUES (9237, 'fa', 'جیرون', 149);
INSERT INTO `country_state_translations` VALUES (9238, 'fa', 'گراناد', 150);
INSERT INTO `country_state_translations` VALUES (9239, 'fa', 'گوادالاجار', 151);
INSERT INTO `country_state_translations` VALUES (9240, 'fa', 'Guipuzcoa', 152);
INSERT INTO `country_state_translations` VALUES (9241, 'fa', 'هولوا', 153);
INSERT INTO `country_state_translations` VALUES (9242, 'fa', 'هوسک', 154);
INSERT INTO `country_state_translations` VALUES (9243, 'fa', 'جی', 155);
INSERT INTO `country_state_translations` VALUES (9244, 'fa', 'لا ریوجا', 156);
INSERT INTO `country_state_translations` VALUES (9245, 'fa', 'لاس پالماس', 157);
INSERT INTO `country_state_translations` VALUES (9246, 'fa', 'لئو', 158);
INSERT INTO `country_state_translations` VALUES (9247, 'fa', 'Lleid', 159);
INSERT INTO `country_state_translations` VALUES (9248, 'fa', 'لوگ', 160);
INSERT INTO `country_state_translations` VALUES (9249, 'fa', 'مادری', 161);
INSERT INTO `country_state_translations` VALUES (9250, 'fa', 'مالاگ', 162);
INSERT INTO `country_state_translations` VALUES (9251, 'fa', 'ملیلی', 163);
INSERT INTO `country_state_translations` VALUES (9252, 'fa', 'مورسیا', 164);
INSERT INTO `country_state_translations` VALUES (9253, 'fa', 'ناوار', 165);
INSERT INTO `country_state_translations` VALUES (9254, 'fa', 'اورنس', 166);
INSERT INTO `country_state_translations` VALUES (9255, 'fa', 'پالنسی', 167);
INSERT INTO `country_state_translations` VALUES (9256, 'fa', 'پونتوودر', 168);
INSERT INTO `country_state_translations` VALUES (9257, 'fa', 'سالامانک', 169);
INSERT INTO `country_state_translations` VALUES (9258, 'fa', 'سانتا کروز د تنریفه', 170);
INSERT INTO `country_state_translations` VALUES (9259, 'fa', 'سوگویا', 171);
INSERT INTO `country_state_translations` VALUES (9260, 'fa', 'سوی', 172);
INSERT INTO `country_state_translations` VALUES (9261, 'fa', 'سوریا', 173);
INSERT INTO `country_state_translations` VALUES (9262, 'fa', 'تاراگونا', 174);
INSERT INTO `country_state_translations` VALUES (9263, 'fa', 'ترئو', 175);
INSERT INTO `country_state_translations` VALUES (9264, 'fa', 'تولدو', 176);
INSERT INTO `country_state_translations` VALUES (9265, 'fa', 'والنسیا', 177);
INSERT INTO `country_state_translations` VALUES (9266, 'fa', 'والادولی', 178);
INSERT INTO `country_state_translations` VALUES (9267, 'fa', 'ویزکایا', 179);
INSERT INTO `country_state_translations` VALUES (9268, 'fa', 'زامور', 180);
INSERT INTO `country_state_translations` VALUES (9269, 'fa', 'ساراگوز', 181);
INSERT INTO `country_state_translations` VALUES (9270, 'fa', 'عی', 182);
INSERT INTO `country_state_translations` VALUES (9271, 'fa', 'آیز', 183);
INSERT INTO `country_state_translations` VALUES (9272, 'fa', 'آلی', 184);
INSERT INTO `country_state_translations` VALUES (9273, 'fa', 'آلپ-دو-هاوت-پرووانس', 185);
INSERT INTO `country_state_translations` VALUES (9274, 'fa', 'هاوتس آلپ', 186);
INSERT INTO `country_state_translations` VALUES (9275, 'fa', 'Alpes-Maritime', 187);
INSERT INTO `country_state_translations` VALUES (9276, 'fa', 'اردچه', 188);
INSERT INTO `country_state_translations` VALUES (9277, 'fa', 'آرد', 189);
INSERT INTO `country_state_translations` VALUES (9278, 'fa', 'محاصر', 190);
INSERT INTO `country_state_translations` VALUES (9279, 'fa', 'آبه', 191);
INSERT INTO `country_state_translations` VALUES (9280, 'fa', 'Aud', 192);
INSERT INTO `country_state_translations` VALUES (9281, 'fa', 'آویرون', 193);
INSERT INTO `country_state_translations` VALUES (9282, 'fa', 'BOCAS DO Rhône', 194);
INSERT INTO `country_state_translations` VALUES (9283, 'fa', 'نوعی عرق', 195);
INSERT INTO `country_state_translations` VALUES (9284, 'fa', 'کانتینال', 196);
INSERT INTO `country_state_translations` VALUES (9285, 'fa', 'چارنت', 197);
INSERT INTO `country_state_translations` VALUES (9286, 'fa', 'چارنت-دریایی', 198);
INSERT INTO `country_state_translations` VALUES (9287, 'fa', 'چ', 199);
INSERT INTO `country_state_translations` VALUES (9288, 'fa', 'کور', 200);
INSERT INTO `country_state_translations` VALUES (9289, 'fa', 'کرس دو ساد', 201);
INSERT INTO `country_state_translations` VALUES (9290, 'fa', 'هاوت کورس', 202);
INSERT INTO `country_state_translations` VALUES (9291, 'fa', 'کوستا دورکرز', 203);
INSERT INTO `country_state_translations` VALUES (9292, 'fa', 'تخت دارمور', 204);
INSERT INTO `country_state_translations` VALUES (9293, 'fa', 'درهم', 205);
INSERT INTO `country_state_translations` VALUES (9294, 'fa', 'دوردگن', 206);
INSERT INTO `country_state_translations` VALUES (9295, 'fa', 'دوب', 207);
INSERT INTO `country_state_translations` VALUES (9296, 'fa', 'تعریف اول', 208);
INSERT INTO `country_state_translations` VALUES (9297, 'fa', 'یور', 209);
INSERT INTO `country_state_translations` VALUES (9298, 'fa', 'Eure-et-Loi', 210);
INSERT INTO `country_state_translations` VALUES (9299, 'fa', 'فمینیست', 211);
INSERT INTO `country_state_translations` VALUES (9300, 'fa', 'باغ', 212);
INSERT INTO `country_state_translations` VALUES (9301, 'fa', 'اوت-گارون', 213);
INSERT INTO `country_state_translations` VALUES (9302, 'fa', 'گر', 214);
INSERT INTO `country_state_translations` VALUES (9303, 'fa', 'جیروند', 215);
INSERT INTO `country_state_translations` VALUES (9304, 'fa', 'هیر', 216);
INSERT INTO `country_state_translations` VALUES (9305, 'fa', 'هشدار داده می شود', 217);
INSERT INTO `country_state_translations` VALUES (9306, 'fa', 'ایندور', 218);
INSERT INTO `country_state_translations` VALUES (9307, 'fa', 'Indre-et-Loir', 219);
INSERT INTO `country_state_translations` VALUES (9308, 'fa', 'ایزر', 220);
INSERT INTO `country_state_translations` VALUES (9309, 'fa', 'یور', 221);
INSERT INTO `country_state_translations` VALUES (9310, 'fa', 'لندز', 222);
INSERT INTO `country_state_translations` VALUES (9311, 'fa', 'Loir-et-Che', 223);
INSERT INTO `country_state_translations` VALUES (9312, 'fa', 'وام گرفتن', 224);
INSERT INTO `country_state_translations` VALUES (9313, 'fa', 'Haute-Loir', 225);
INSERT INTO `country_state_translations` VALUES (9314, 'fa', 'Loire-Atlantiqu', 226);
INSERT INTO `country_state_translations` VALUES (9315, 'fa', 'لیرت', 227);
INSERT INTO `country_state_translations` VALUES (9316, 'fa', 'لوط', 228);
INSERT INTO `country_state_translations` VALUES (9317, 'fa', 'لوت و گارون', 229);
INSERT INTO `country_state_translations` VALUES (9318, 'fa', 'لوزر', 230);
INSERT INTO `country_state_translations` VALUES (9319, 'fa', 'ماین et-Loire', 231);
INSERT INTO `country_state_translations` VALUES (9320, 'fa', 'مانچ', 232);
INSERT INTO `country_state_translations` VALUES (9321, 'fa', 'مارن', 233);
INSERT INTO `country_state_translations` VALUES (9322, 'fa', 'هاوت-مارن', 234);
INSERT INTO `country_state_translations` VALUES (9323, 'fa', 'مایین', 235);
INSERT INTO `country_state_translations` VALUES (9324, 'fa', 'مورته-et-Moselle', 236);
INSERT INTO `country_state_translations` VALUES (9325, 'fa', 'مسخره کردن', 237);
INSERT INTO `country_state_translations` VALUES (9326, 'fa', 'موربیان', 238);
INSERT INTO `country_state_translations` VALUES (9327, 'fa', 'موزل', 239);
INSERT INTO `country_state_translations` VALUES (9328, 'fa', 'Nièvr', 240);
INSERT INTO `country_state_translations` VALUES (9329, 'fa', 'نورد', 241);
INSERT INTO `country_state_translations` VALUES (9330, 'fa', 'اوی', 242);
INSERT INTO `country_state_translations` VALUES (9331, 'fa', 'ارن', 243);
INSERT INTO `country_state_translations` VALUES (9332, 'fa', 'پاس-کاله', 244);
INSERT INTO `country_state_translations` VALUES (9333, 'fa', 'Puy-de-Dôm', 245);
INSERT INTO `country_state_translations` VALUES (9334, 'fa', 'Pyrénées-Atlantiques', 246);
INSERT INTO `country_state_translations` VALUES (9335, 'fa', 'Hautes-Pyrénée', 247);
INSERT INTO `country_state_translations` VALUES (9336, 'fa', 'Pyrénées-Orientales', 248);
INSERT INTO `country_state_translations` VALUES (9337, 'fa', 'بس راین', 249);
INSERT INTO `country_state_translations` VALUES (9338, 'fa', 'هاوت-رین', 250);
INSERT INTO `country_state_translations` VALUES (9339, 'fa', 'رو', 251);
INSERT INTO `country_state_translations` VALUES (9340, 'fa', 'Haute-Saône', 252);
INSERT INTO `country_state_translations` VALUES (9341, 'fa', 'Saône-et-Loire', 253);
INSERT INTO `country_state_translations` VALUES (9342, 'fa', 'سارته', 254);
INSERT INTO `country_state_translations` VALUES (9343, 'fa', 'ساووی', 255);
INSERT INTO `country_state_translations` VALUES (9344, 'fa', 'هاو-ساووی', 256);
INSERT INTO `country_state_translations` VALUES (9345, 'fa', 'پاری', 257);
INSERT INTO `country_state_translations` VALUES (9346, 'fa', 'Seine-Maritime', 258);
INSERT INTO `country_state_translations` VALUES (9347, 'fa', 'Seine-et-Marn', 259);
INSERT INTO `country_state_translations` VALUES (9348, 'fa', 'ایولینز', 260);
INSERT INTO `country_state_translations` VALUES (9349, 'fa', 'Deux-Sèvres', 261);
INSERT INTO `country_state_translations` VALUES (9350, 'fa', 'سمی', 262);
INSERT INTO `country_state_translations` VALUES (9351, 'fa', 'ضعف', 263);
INSERT INTO `country_state_translations` VALUES (9352, 'fa', 'Tarn-et-Garonne', 264);
INSERT INTO `country_state_translations` VALUES (9353, 'fa', 'وار', 265);
INSERT INTO `country_state_translations` VALUES (9354, 'fa', 'ووکلوز', 266);
INSERT INTO `country_state_translations` VALUES (9355, 'fa', 'وندیه', 267);
INSERT INTO `country_state_translations` VALUES (9356, 'fa', 'وین', 268);
INSERT INTO `country_state_translations` VALUES (9357, 'fa', 'هاوت-وین', 269);
INSERT INTO `country_state_translations` VALUES (9358, 'fa', 'رأی دادن', 270);
INSERT INTO `country_state_translations` VALUES (9359, 'fa', 'یون', 271);
INSERT INTO `country_state_translations` VALUES (9360, 'fa', 'سرزمین-دو-بلفورت', 272);
INSERT INTO `country_state_translations` VALUES (9361, 'fa', 'اسون', 273);
INSERT INTO `country_state_translations` VALUES (9362, 'fa', 'هاوتز دی سی', 274);
INSERT INTO `country_state_translations` VALUES (9363, 'fa', 'Seine-Saint-Deni', 275);
INSERT INTO `country_state_translations` VALUES (9364, 'fa', 'والد مارن', 276);
INSERT INTO `country_state_translations` VALUES (9365, 'fa', 'Val-d\'Ois', 277);
INSERT INTO `country_state_translations` VALUES (9366, 'fa', 'آلبا', 278);
INSERT INTO `country_state_translations` VALUES (9367, 'fa', 'آرا', 279);
INSERT INTO `country_state_translations` VALUES (9368, 'fa', 'Argeș', 280);
INSERT INTO `country_state_translations` VALUES (9369, 'fa', 'باکو', 281);
INSERT INTO `country_state_translations` VALUES (9370, 'fa', 'بیهور', 282);
INSERT INTO `country_state_translations` VALUES (9371, 'fa', 'بیستریا-نسوود', 283);
INSERT INTO `country_state_translations` VALUES (9372, 'fa', 'بوتانی', 284);
INSERT INTO `country_state_translations` VALUES (9373, 'fa', 'برازوف', 285);
INSERT INTO `country_state_translations` VALUES (9374, 'fa', 'Brăila', 286);
INSERT INTO `country_state_translations` VALUES (9375, 'fa', 'București', 287);
INSERT INTO `country_state_translations` VALUES (9376, 'fa', 'بوز', 288);
INSERT INTO `country_state_translations` VALUES (9377, 'fa', 'کارا- Severin', 289);
INSERT INTO `country_state_translations` VALUES (9378, 'fa', 'کالیراسی', 290);
INSERT INTO `country_state_translations` VALUES (9379, 'fa', 'كلوژ', 291);
INSERT INTO `country_state_translations` VALUES (9380, 'fa', 'کنستانس', 292);
INSERT INTO `country_state_translations` VALUES (9381, 'fa', 'کواسنا', 293);
INSERT INTO `country_state_translations` VALUES (9382, 'fa', 'Dâmbovița', 294);
INSERT INTO `country_state_translations` VALUES (9383, 'fa', 'دال', 295);
INSERT INTO `country_state_translations` VALUES (9384, 'fa', 'گالشی', 296);
INSERT INTO `country_state_translations` VALUES (9385, 'fa', 'جورجیو', 297);
INSERT INTO `country_state_translations` VALUES (9386, 'fa', 'گور', 298);
INSERT INTO `country_state_translations` VALUES (9387, 'fa', 'هارگیتا', 299);
INSERT INTO `country_state_translations` VALUES (9388, 'fa', 'هوندهار', 300);
INSERT INTO `country_state_translations` VALUES (9389, 'fa', 'ایالومیشا', 301);
INSERT INTO `country_state_translations` VALUES (9390, 'fa', 'Iași', 302);
INSERT INTO `country_state_translations` VALUES (9391, 'fa', 'Ilfo', 303);
INSERT INTO `country_state_translations` VALUES (9392, 'fa', 'Maramureș', 304);
INSERT INTO `country_state_translations` VALUES (9393, 'fa', 'Mehedinți', 305);
INSERT INTO `country_state_translations` VALUES (9394, 'fa', 'Mureș', 306);
INSERT INTO `country_state_translations` VALUES (9395, 'fa', 'Neamț', 307);
INSERT INTO `country_state_translations` VALUES (9396, 'fa', 'اولت', 308);
INSERT INTO `country_state_translations` VALUES (9397, 'fa', 'پرهوا', 309);
INSERT INTO `country_state_translations` VALUES (9398, 'fa', 'ستو ماره', 310);
INSERT INTO `country_state_translations` VALUES (9399, 'fa', 'سلاج', 311);
INSERT INTO `country_state_translations` VALUES (9400, 'fa', 'سیبیو', 312);
INSERT INTO `country_state_translations` VALUES (9401, 'fa', 'سوساو', 313);
INSERT INTO `country_state_translations` VALUES (9402, 'fa', 'تلورمان', 314);
INSERT INTO `country_state_translations` VALUES (9403, 'fa', 'تیمیچ', 315);
INSERT INTO `country_state_translations` VALUES (9404, 'fa', 'تولسا', 316);
INSERT INTO `country_state_translations` VALUES (9405, 'fa', 'واسلوئی', 317);
INSERT INTO `country_state_translations` VALUES (9406, 'fa', 'Vâlcea', 318);
INSERT INTO `country_state_translations` VALUES (9407, 'fa', 'ورانسا', 319);
INSERT INTO `country_state_translations` VALUES (9408, 'fa', 'لاپی', 320);
INSERT INTO `country_state_translations` VALUES (9409, 'fa', 'Pohjois-Pohjanmaa', 321);
INSERT INTO `country_state_translations` VALUES (9410, 'fa', 'کائینو', 322);
INSERT INTO `country_state_translations` VALUES (9411, 'fa', 'Pohjois-Karjala', 323);
INSERT INTO `country_state_translations` VALUES (9412, 'fa', 'Pohjois-Savo', 324);
INSERT INTO `country_state_translations` VALUES (9413, 'fa', 'اتل-ساوو', 325);
INSERT INTO `country_state_translations` VALUES (9414, 'fa', 'کسکی-پوهانما', 326);
INSERT INTO `country_state_translations` VALUES (9415, 'fa', 'Pohjanmaa', 327);
INSERT INTO `country_state_translations` VALUES (9416, 'fa', 'پیرکانما', 328);
INSERT INTO `country_state_translations` VALUES (9417, 'fa', 'ساتاکونتا', 329);
INSERT INTO `country_state_translations` VALUES (9418, 'fa', 'کسکی-پوهانما', 330);
INSERT INTO `country_state_translations` VALUES (9419, 'fa', 'کسکی-سوومی', 331);
INSERT INTO `country_state_translations` VALUES (9420, 'fa', 'Varsinais-Suomi', 332);
INSERT INTO `country_state_translations` VALUES (9421, 'fa', 'اتلی کرجالا', 333);
INSERT INTO `country_state_translations` VALUES (9422, 'fa', 'Päijät-HAM', 334);
INSERT INTO `country_state_translations` VALUES (9423, 'fa', 'کانتا-هوم', 335);
INSERT INTO `country_state_translations` VALUES (9424, 'fa', 'یوسیما', 336);
INSERT INTO `country_state_translations` VALUES (9425, 'fa', 'اوسیم', 337);
INSERT INTO `country_state_translations` VALUES (9426, 'fa', 'کیمنلاکو', 338);
INSERT INTO `country_state_translations` VALUES (9427, 'fa', 'آونوانما', 339);
INSERT INTO `country_state_translations` VALUES (9428, 'fa', 'هارژوم', 340);
INSERT INTO `country_state_translations` VALUES (9429, 'fa', 'سلا', 341);
INSERT INTO `country_state_translations` VALUES (9430, 'fa', 'آیدا-ویروما', 342);
INSERT INTO `country_state_translations` VALUES (9431, 'fa', 'Jõgevamaa', 343);
INSERT INTO `country_state_translations` VALUES (9432, 'fa', 'جوروماا', 344);
INSERT INTO `country_state_translations` VALUES (9433, 'fa', 'لونما', 345);
INSERT INTO `country_state_translations` VALUES (9434, 'fa', 'لون-ویروما', 346);
INSERT INTO `country_state_translations` VALUES (9435, 'fa', 'پالوماا', 347);
INSERT INTO `country_state_translations` VALUES (9436, 'fa', 'پورنوما', 348);
INSERT INTO `country_state_translations` VALUES (9437, 'fa', 'Raplama', 349);
INSERT INTO `country_state_translations` VALUES (9438, 'fa', 'ساارما', 350);
INSERT INTO `country_state_translations` VALUES (9439, 'fa', 'تارتوما', 351);
INSERT INTO `country_state_translations` VALUES (9440, 'fa', 'والگام', 352);
INSERT INTO `country_state_translations` VALUES (9441, 'fa', 'ویلجاندیم', 353);
INSERT INTO `country_state_translations` VALUES (9442, 'fa', 'Võrumaa', 354);
INSERT INTO `country_state_translations` VALUES (9443, 'fa', 'داگاوپیل', 355);
INSERT INTO `country_state_translations` VALUES (9444, 'fa', 'جلگاو', 356);
INSERT INTO `country_state_translations` VALUES (9445, 'fa', 'جکابیل', 357);
INSERT INTO `country_state_translations` VALUES (9446, 'fa', 'جرمل', 358);
INSERT INTO `country_state_translations` VALUES (9447, 'fa', 'لیپجا', 359);
INSERT INTO `country_state_translations` VALUES (9448, 'fa', 'شهرستان لیپاج', 360);
INSERT INTO `country_state_translations` VALUES (9449, 'fa', 'روژن', 361);
INSERT INTO `country_state_translations` VALUES (9450, 'fa', 'راگ', 362);
INSERT INTO `country_state_translations` VALUES (9451, 'fa', 'شهرستان ریگ', 363);
INSERT INTO `country_state_translations` VALUES (9452, 'fa', 'والمییرا', 364);
INSERT INTO `country_state_translations` VALUES (9453, 'fa', 'Ventspils', 365);
INSERT INTO `country_state_translations` VALUES (9454, 'fa', 'آگلوناس نوادا', 366);
INSERT INTO `country_state_translations` VALUES (9455, 'fa', 'تازه کاران آیزکرایکلس', 367);
INSERT INTO `country_state_translations` VALUES (9456, 'fa', 'تازه واردان', 368);
INSERT INTO `country_state_translations` VALUES (9457, 'fa', 'شهرستا', 369);
INSERT INTO `country_state_translations` VALUES (9458, 'fa', 'نوازندگان آلوجاس', 370);
INSERT INTO `country_state_translations` VALUES (9459, 'fa', 'تازه های آلسونگاس', 371);
INSERT INTO `country_state_translations` VALUES (9460, 'fa', 'شهرستان آلوکس', 372);
INSERT INTO `country_state_translations` VALUES (9461, 'fa', 'تازه کاران آماتاس', 373);
INSERT INTO `country_state_translations` VALUES (9462, 'fa', 'میمون های تازه', 374);
INSERT INTO `country_state_translations` VALUES (9463, 'fa', 'نوادا را آویز می کند', 375);
INSERT INTO `country_state_translations` VALUES (9464, 'fa', 'شهرستان بابی', 376);
INSERT INTO `country_state_translations` VALUES (9465, 'fa', 'Baldones novad', 377);
INSERT INTO `country_state_translations` VALUES (9466, 'fa', 'نوین های بالتیناوا', 378);
INSERT INTO `country_state_translations` VALUES (9467, 'fa', 'Balvu novad', 379);
INSERT INTO `country_state_translations` VALUES (9468, 'fa', 'نوازندگان باسکاس', 380);
INSERT INTO `country_state_translations` VALUES (9469, 'fa', 'شهرستان بورین', 381);
INSERT INTO `country_state_translations` VALUES (9470, 'fa', 'شهرستان بروچن', 382);
INSERT INTO `country_state_translations` VALUES (9471, 'fa', 'بوردنیکو نوآوران', 383);
INSERT INTO `country_state_translations` VALUES (9472, 'fa', 'تازه کارنیکاوا', 384);
INSERT INTO `country_state_translations` VALUES (9473, 'fa', 'نوازان سزوینس', 385);
INSERT INTO `country_state_translations` VALUES (9474, 'fa', 'نوادگان Cibla', 386);
INSERT INTO `country_state_translations` VALUES (9475, 'fa', 'شهرستان Cesis', 387);
INSERT INTO `country_state_translations` VALUES (9476, 'fa', 'تازه های داگدا', 388);
INSERT INTO `country_state_translations` VALUES (9477, 'fa', 'داوگاوپیلز نوادا', 389);
INSERT INTO `country_state_translations` VALUES (9478, 'fa', 'دابل نوادی', 390);
INSERT INTO `country_state_translations` VALUES (9479, 'fa', 'تازه کارهای دنداگاس', 391);
INSERT INTO `country_state_translations` VALUES (9480, 'fa', 'نوباد دوربس', 392);
INSERT INTO `country_state_translations` VALUES (9481, 'fa', 'مشغول تازه کارها است', 393);
INSERT INTO `country_state_translations` VALUES (9482, 'fa', 'گرکالنس نواد', 394);
INSERT INTO `country_state_translations` VALUES (9483, 'fa', 'یا شهرستان گروبی', 395);
INSERT INTO `country_state_translations` VALUES (9484, 'fa', 'تازه های گلبنس', 396);
INSERT INTO `country_state_translations` VALUES (9485, 'fa', 'Iecavas novads', 397);
INSERT INTO `country_state_translations` VALUES (9486, 'fa', 'شهرستان ایسکل', 398);
INSERT INTO `country_state_translations` VALUES (9487, 'fa', 'ایالت ایلکست', 399);
INSERT INTO `country_state_translations` VALUES (9488, 'fa', 'کنددو د اینچوکالن', 400);
INSERT INTO `country_state_translations` VALUES (9489, 'fa', 'نوجواد Jaunjelgavas', 401);
INSERT INTO `country_state_translations` VALUES (9490, 'fa', 'تازه های Jaunpiebalgas', 402);
INSERT INTO `country_state_translations` VALUES (9491, 'fa', 'شهرستان جونپیلس', 403);
INSERT INTO `country_state_translations` VALUES (9492, 'fa', 'شهرستان جگلو', 404);
INSERT INTO `country_state_translations` VALUES (9493, 'fa', 'شهرستان جکابیل', 405);
INSERT INTO `country_state_translations` VALUES (9494, 'fa', 'شهرستان کنداوا', 406);
INSERT INTO `country_state_translations` VALUES (9495, 'fa', 'شهرستان کوکنز', 407);
INSERT INTO `country_state_translations` VALUES (9496, 'fa', 'شهرستان کریمولد', 408);
INSERT INTO `country_state_translations` VALUES (9497, 'fa', 'شهرستان کرستپیل', 409);
INSERT INTO `country_state_translations` VALUES (9498, 'fa', 'شهرستان کراسلاو', 410);
INSERT INTO `country_state_translations` VALUES (9499, 'fa', 'کاندادو د کلدیگا', 411);
INSERT INTO `country_state_translations` VALUES (9500, 'fa', 'کاندادو د کارساوا', 412);
INSERT INTO `country_state_translations` VALUES (9501, 'fa', 'شهرستان لیولوارد', 413);
INSERT INTO `country_state_translations` VALUES (9502, 'fa', 'شهرستان لیمباشی', 414);
INSERT INTO `country_state_translations` VALUES (9503, 'fa', 'ای ولسوالی لوبون', 415);
INSERT INTO `country_state_translations` VALUES (9504, 'fa', 'شهرستان لودزا', 416);
INSERT INTO `country_state_translations` VALUES (9505, 'fa', 'شهرستان لیگات', 417);
INSERT INTO `country_state_translations` VALUES (9506, 'fa', 'شهرستان لیوانی', 418);
INSERT INTO `country_state_translations` VALUES (9507, 'fa', 'شهرستان مادونا', 419);
INSERT INTO `country_state_translations` VALUES (9508, 'fa', 'شهرستان مازسال', 420);
INSERT INTO `country_state_translations` VALUES (9509, 'fa', 'شهرستان مالپیلس', 421);
INSERT INTO `country_state_translations` VALUES (9510, 'fa', 'شهرستان Mārupe', 422);
INSERT INTO `country_state_translations` VALUES (9511, 'fa', 'ا کنددو د نوکشنی', 423);
INSERT INTO `country_state_translations` VALUES (9512, 'fa', 'کاملاً یک شهرستان', 424);
INSERT INTO `country_state_translations` VALUES (9513, 'fa', 'شهرستان نیکا', 425);
INSERT INTO `country_state_translations` VALUES (9514, 'fa', 'شهرستان اوگر', 426);
INSERT INTO `country_state_translations` VALUES (9515, 'fa', 'شهرستان اولین', 427);
INSERT INTO `country_state_translations` VALUES (9516, 'fa', 'شهرستان اوزولنیکی', 428);
INSERT INTO `country_state_translations` VALUES (9517, 'fa', 'شهرستان پرلیلی', 429);
INSERT INTO `country_state_translations` VALUES (9518, 'fa', 'شهرستان Priekule', 430);
INSERT INTO `country_state_translations` VALUES (9519, 'fa', 'Condado de Priekuļi', 431);
INSERT INTO `country_state_translations` VALUES (9520, 'fa', 'شهرستان در حال حرکت', 432);
INSERT INTO `country_state_translations` VALUES (9521, 'fa', 'شهرستان پاویلوستا', 433);
INSERT INTO `country_state_translations` VALUES (9522, 'fa', 'شهرستان Plavinas', 4);
INSERT INTO `country_state_translations` VALUES (9523, 'fa', 'شهرستان راونا', 435);
INSERT INTO `country_state_translations` VALUES (9524, 'fa', 'شهرستان ریبیشی', 436);
INSERT INTO `country_state_translations` VALUES (9525, 'fa', 'شهرستان روجا', 437);
INSERT INTO `country_state_translations` VALUES (9526, 'fa', 'شهرستان روپازی', 438);
INSERT INTO `country_state_translations` VALUES (9527, 'fa', 'شهرستان روساوا', 439);
INSERT INTO `country_state_translations` VALUES (9528, 'fa', 'شهرستان روگی', 440);
INSERT INTO `country_state_translations` VALUES (9529, 'fa', 'شهرستان راندل', 441);
INSERT INTO `country_state_translations` VALUES (9530, 'fa', 'شهرستان ریزکن', 442);
INSERT INTO `country_state_translations` VALUES (9531, 'fa', 'شهرستان روژینا', 443);
INSERT INTO `country_state_translations` VALUES (9532, 'fa', 'شهرداری Salacgriva', 444);
INSERT INTO `country_state_translations` VALUES (9533, 'fa', 'منطقه جزیره', 445);
INSERT INTO `country_state_translations` VALUES (9534, 'fa', 'شهرستان Salaspils', 446);
INSERT INTO `country_state_translations` VALUES (9535, 'fa', 'شهرستان سالدوس', 447);
INSERT INTO `country_state_translations` VALUES (9536, 'fa', 'شهرستان ساولکرستی', 448);
INSERT INTO `country_state_translations` VALUES (9537, 'fa', 'شهرستان سیگولدا', 449);
INSERT INTO `country_state_translations` VALUES (9538, 'fa', 'شهرستان Skrunda', 450);
INSERT INTO `country_state_translations` VALUES (9539, 'fa', 'شهرستان Skrīveri', 451);
INSERT INTO `country_state_translations` VALUES (9540, 'fa', 'شهرستان Smiltene', 452);
INSERT INTO `country_state_translations` VALUES (9541, 'fa', 'شهرستان ایستینی', 453);
INSERT INTO `country_state_translations` VALUES (9542, 'fa', 'شهرستان استرنشی', 454);
INSERT INTO `country_state_translations` VALUES (9543, 'fa', 'منطقه کاشت', 455);
INSERT INTO `country_state_translations` VALUES (9544, 'fa', 'شهرستان تالسی', 456);
INSERT INTO `country_state_translations` VALUES (9545, 'fa', 'توکومس', 457);
INSERT INTO `country_state_translations` VALUES (9546, 'fa', 'شهرستان تورت', 458);
INSERT INTO `country_state_translations` VALUES (9547, 'fa', 'یا شهرستان وایودود', 459);
INSERT INTO `country_state_translations` VALUES (9548, 'fa', 'شهرستان والکا', 460);
INSERT INTO `country_state_translations` VALUES (9549, 'fa', 'شهرستان Valmiera', 461);
INSERT INTO `country_state_translations` VALUES (9550, 'fa', 'شهرستان وارکانی', 462);
INSERT INTO `country_state_translations` VALUES (9551, 'fa', 'شهرستان Vecpiebalga', 463);
INSERT INTO `country_state_translations` VALUES (9552, 'fa', 'شهرستان وکومنیکی', 464);
INSERT INTO `country_state_translations` VALUES (9553, 'fa', 'شهرستان ونتسپیل', 465);
INSERT INTO `country_state_translations` VALUES (9554, 'fa', 'کنددو د بازدید', 466);
INSERT INTO `country_state_translations` VALUES (9555, 'fa', 'شهرستان ویلاکا', 467);
INSERT INTO `country_state_translations` VALUES (9556, 'fa', 'شهرستان ویلانی', 468);
INSERT INTO `country_state_translations` VALUES (9557, 'fa', 'شهرستان واركاوا', 469);
INSERT INTO `country_state_translations` VALUES (9558, 'fa', 'شهرستان زیلوپ', 470);
INSERT INTO `country_state_translations` VALUES (9559, 'fa', 'شهرستان آدازی', 471);
INSERT INTO `country_state_translations` VALUES (9560, 'fa', 'شهرستان ارگلو', 472);
INSERT INTO `country_state_translations` VALUES (9561, 'fa', 'شهرستان کگومس', 473);
INSERT INTO `country_state_translations` VALUES (9562, 'fa', 'شهرستان ککاوا', 474);
INSERT INTO `country_state_translations` VALUES (9563, 'fa', 'شهرستان Alytus', 475);
INSERT INTO `country_state_translations` VALUES (9564, 'fa', 'شهرستان Kaunas', 476);
INSERT INTO `country_state_translations` VALUES (9565, 'fa', 'شهرستان کلایپدا', 477);
INSERT INTO `country_state_translations` VALUES (9566, 'fa', 'شهرستان ماریجامپولی', 478);
INSERT INTO `country_state_translations` VALUES (9567, 'fa', 'شهرستان پانویسیز', 479);
INSERT INTO `country_state_translations` VALUES (9568, 'fa', 'شهرستان سیاولیا', 480);
INSERT INTO `country_state_translations` VALUES (9569, 'fa', 'شهرستان تاجیج', 481);
INSERT INTO `country_state_translations` VALUES (9570, 'fa', 'شهرستان تلشیا', 482);
INSERT INTO `country_state_translations` VALUES (9571, 'fa', 'شهرستان اوتنا', 483);
INSERT INTO `country_state_translations` VALUES (9572, 'fa', 'شهرستان ویلنیوس', 484);
INSERT INTO `country_state_translations` VALUES (9573, 'fa', 'جریب', 485);
INSERT INTO `country_state_translations` VALUES (9574, 'fa', 'حالت', 486);
INSERT INTO `country_state_translations` VALUES (9575, 'fa', 'آمپá', 487);
INSERT INTO `country_state_translations` VALUES (9576, 'fa', 'آمازون', 488);
INSERT INTO `country_state_translations` VALUES (9577, 'fa', 'باهی', 489);
INSERT INTO `country_state_translations` VALUES (9578, 'fa', 'سارا', 490);
INSERT INTO `country_state_translations` VALUES (9579, 'fa', 'روح القدس', 491);
INSERT INTO `country_state_translations` VALUES (9580, 'fa', 'برو', 492);
INSERT INTO `country_state_translations` VALUES (9581, 'fa', 'مارانهائ', 493);
INSERT INTO `country_state_translations` VALUES (9582, 'fa', 'ماتو گروسو', 494);
INSERT INTO `country_state_translations` VALUES (9583, 'fa', 'Mato Grosso do Sul', 495);
INSERT INTO `country_state_translations` VALUES (9584, 'fa', 'ایالت میناس گرایس', 496);
INSERT INTO `country_state_translations` VALUES (9585, 'fa', 'پار', 497);
INSERT INTO `country_state_translations` VALUES (9586, 'fa', 'حالت', 498);
INSERT INTO `country_state_translations` VALUES (9587, 'fa', 'پارانا', 499);
INSERT INTO `country_state_translations` VALUES (9588, 'fa', 'حال', 500);
INSERT INTO `country_state_translations` VALUES (9589, 'fa', 'پیازو', 501);
INSERT INTO `country_state_translations` VALUES (9590, 'fa', 'ریو دوژانیرو', 502);
INSERT INTO `country_state_translations` VALUES (9591, 'fa', 'ریو گراند دو نورته', 503);
INSERT INTO `country_state_translations` VALUES (9592, 'fa', 'ریو گراند دو سول', 504);
INSERT INTO `country_state_translations` VALUES (9593, 'fa', 'Rondôni', 505);
INSERT INTO `country_state_translations` VALUES (9594, 'fa', 'Roraim', 506);
INSERT INTO `country_state_translations` VALUES (9595, 'fa', 'سانتا کاتارینا', 507);
INSERT INTO `country_state_translations` VALUES (9596, 'fa', 'پ', 508);
INSERT INTO `country_state_translations` VALUES (9597, 'fa', 'Sergip', 509);
INSERT INTO `country_state_translations` VALUES (9598, 'fa', 'توکانتین', 510);
INSERT INTO `country_state_translations` VALUES (9599, 'fa', 'منطقه فدرال', 511);
INSERT INTO `country_state_translations` VALUES (9600, 'fa', 'شهرستان زاگرب', 512);
INSERT INTO `country_state_translations` VALUES (9601, 'fa', 'Condado de Krapina-Zagorj', 513);
INSERT INTO `country_state_translations` VALUES (9602, 'fa', 'شهرستان سیساک-موسلاوینا', 514);
INSERT INTO `country_state_translations` VALUES (9603, 'fa', 'شهرستان کارلوواک', 515);
INSERT INTO `country_state_translations` VALUES (9604, 'fa', 'شهرداری واراžدین', 516);
INSERT INTO `country_state_translations` VALUES (9605, 'fa', 'Condo de Koprivnica-Križevci', 517);
INSERT INTO `country_state_translations` VALUES (9606, 'fa', 'محل سکونت د بیلوار-بلوگورا', 518);
INSERT INTO `country_state_translations` VALUES (9607, 'fa', 'Condado de Primorje-Gorski kotar', 519);
INSERT INTO `country_state_translations` VALUES (9608, 'fa', 'شهرستان لیکا-سنج', 520);
INSERT INTO `country_state_translations` VALUES (9609, 'fa', 'Condado de Virovitica-Podravina', 521);
INSERT INTO `country_state_translations` VALUES (9610, 'fa', 'شهرستان پوژگا-اسلاونیا', 522);
INSERT INTO `country_state_translations` VALUES (9611, 'fa', 'Condado de Brod-Posavina', 523);
INSERT INTO `country_state_translations` VALUES (9612, 'fa', 'شهرستان زجر', 524);
INSERT INTO `country_state_translations` VALUES (9613, 'fa', 'Condado de Osijek-Baranja', 525);
INSERT INTO `country_state_translations` VALUES (9614, 'fa', 'Condo de Sibenik-Knin', 526);
INSERT INTO `country_state_translations` VALUES (9615, 'fa', 'Condado de Vukovar-Srijem', 527);
INSERT INTO `country_state_translations` VALUES (9616, 'fa', 'شهرستان اسپلیت-Dalmatia', 528);
INSERT INTO `country_state_translations` VALUES (9617, 'fa', 'شهرستان ایستیا', 529);
INSERT INTO `country_state_translations` VALUES (9618, 'fa', 'Condado de Dubrovnik-Neretva', 530);
INSERT INTO `country_state_translations` VALUES (9619, 'fa', 'شهرستان Međimurje', 531);
INSERT INTO `country_state_translations` VALUES (9620, 'fa', 'شهر زاگرب', 532);
INSERT INTO `country_state_translations` VALUES (9621, 'fa', 'جزایر آندامان و نیکوبار', 533);
INSERT INTO `country_state_translations` VALUES (9622, 'fa', 'آندرا پرادش', 534);
INSERT INTO `country_state_translations` VALUES (9623, 'fa', 'آروناچال پرادش', 535);
INSERT INTO `country_state_translations` VALUES (9624, 'fa', 'آسام', 536);
INSERT INTO `country_state_translations` VALUES (9625, 'fa', 'Biha', 537);
INSERT INTO `country_state_translations` VALUES (9626, 'fa', 'چاندیگار', 538);
INSERT INTO `country_state_translations` VALUES (9627, 'fa', 'چاتیسگار', 539);
INSERT INTO `country_state_translations` VALUES (9628, 'fa', 'دادرا و نگار هاولی', 540);
INSERT INTO `country_state_translations` VALUES (9629, 'fa', 'دامان و دیو', 541);
INSERT INTO `country_state_translations` VALUES (9630, 'fa', 'دهلی', 542);
INSERT INTO `country_state_translations` VALUES (9631, 'fa', 'گوا', 543);
INSERT INTO `country_state_translations` VALUES (9632, 'fa', 'گجرات', 544);
INSERT INTO `country_state_translations` VALUES (9633, 'fa', 'هاریانا', 545);
INSERT INTO `country_state_translations` VALUES (9634, 'fa', 'هیماچال پرادش', 546);
INSERT INTO `country_state_translations` VALUES (9635, 'fa', 'جامو و کشمیر', 547);
INSERT INTO `country_state_translations` VALUES (9636, 'fa', 'جهخند', 548);
INSERT INTO `country_state_translations` VALUES (9637, 'fa', 'کارناتاکا', 549);
INSERT INTO `country_state_translations` VALUES (9638, 'fa', 'کرال', 550);
INSERT INTO `country_state_translations` VALUES (9639, 'fa', 'لاکشادوپ', 551);
INSERT INTO `country_state_translations` VALUES (9640, 'fa', 'مادیا پرادش', 552);
INSERT INTO `country_state_translations` VALUES (9641, 'fa', 'ماهاراشترا', 553);
INSERT INTO `country_state_translations` VALUES (9642, 'fa', 'مانی پور', 554);
INSERT INTO `country_state_translations` VALUES (9643, 'fa', 'مگالایا', 555);
INSERT INTO `country_state_translations` VALUES (9644, 'fa', 'مزورام', 556);
INSERT INTO `country_state_translations` VALUES (9645, 'fa', 'ناگلند', 557);
INSERT INTO `country_state_translations` VALUES (9646, 'fa', 'ادیشا', 558);
INSERT INTO `country_state_translations` VALUES (9647, 'fa', 'میناکاری', 559);
INSERT INTO `country_state_translations` VALUES (9648, 'fa', 'پنجا', 560);
INSERT INTO `country_state_translations` VALUES (9649, 'fa', 'راجستان', 561);
INSERT INTO `country_state_translations` VALUES (9650, 'fa', 'سیکیم', 562);
INSERT INTO `country_state_translations` VALUES (9651, 'fa', 'تامیل نادو', 563);
INSERT INTO `country_state_translations` VALUES (9652, 'fa', 'تلنگانا', 564);
INSERT INTO `country_state_translations` VALUES (9653, 'fa', 'تریپورا', 565);
INSERT INTO `country_state_translations` VALUES (9654, 'fa', 'اوتار پرادش', 566);
INSERT INTO `country_state_translations` VALUES (9655, 'fa', 'اوتاراکند', 567);
INSERT INTO `country_state_translations` VALUES (9656, 'fa', 'بنگال غرب', 568);
INSERT INTO `country_state_translations` VALUES (9657, 'pt_BR', 'Alabama', 1);
INSERT INTO `country_state_translations` VALUES (9658, 'pt_BR', 'Alaska', 2);
INSERT INTO `country_state_translations` VALUES (9659, 'pt_BR', 'Samoa Americana', 3);
INSERT INTO `country_state_translations` VALUES (9660, 'pt_BR', 'Arizona', 4);
INSERT INTO `country_state_translations` VALUES (9661, 'pt_BR', 'Arkansas', 5);
INSERT INTO `country_state_translations` VALUES (9662, 'pt_BR', 'Forças Armadas da África', 6);
INSERT INTO `country_state_translations` VALUES (9663, 'pt_BR', 'Forças Armadas das Américas', 7);
INSERT INTO `country_state_translations` VALUES (9664, 'pt_BR', 'Forças Armadas do Canadá', 8);
INSERT INTO `country_state_translations` VALUES (9665, 'pt_BR', 'Forças Armadas da Europa', 9);
INSERT INTO `country_state_translations` VALUES (9666, 'pt_BR', 'Forças Armadas do Oriente Médio', 10);
INSERT INTO `country_state_translations` VALUES (9667, 'pt_BR', 'Forças Armadas do Pacífico', 11);
INSERT INTO `country_state_translations` VALUES (9668, 'pt_BR', 'California', 12);
INSERT INTO `country_state_translations` VALUES (9669, 'pt_BR', 'Colorado', 13);
INSERT INTO `country_state_translations` VALUES (9670, 'pt_BR', 'Connecticut', 14);
INSERT INTO `country_state_translations` VALUES (9671, 'pt_BR', 'Delaware', 15);
INSERT INTO `country_state_translations` VALUES (9672, 'pt_BR', 'Distrito de Columbia', 16);
INSERT INTO `country_state_translations` VALUES (9673, 'pt_BR', 'Estados Federados da Micronésia', 17);
INSERT INTO `country_state_translations` VALUES (9674, 'pt_BR', 'Florida', 18);
INSERT INTO `country_state_translations` VALUES (9675, 'pt_BR', 'Geórgia', 19);
INSERT INTO `country_state_translations` VALUES (9676, 'pt_BR', 'Guam', 20);
INSERT INTO `country_state_translations` VALUES (9677, 'pt_BR', 'Havaí', 21);
INSERT INTO `country_state_translations` VALUES (9678, 'pt_BR', 'Idaho', 22);
INSERT INTO `country_state_translations` VALUES (9679, 'pt_BR', 'Illinois', 23);
INSERT INTO `country_state_translations` VALUES (9680, 'pt_BR', 'Indiana', 24);
INSERT INTO `country_state_translations` VALUES (9681, 'pt_BR', 'Iowa', 25);
INSERT INTO `country_state_translations` VALUES (9682, 'pt_BR', 'Kansas', 26);
INSERT INTO `country_state_translations` VALUES (9683, 'pt_BR', 'Kentucky', 27);
INSERT INTO `country_state_translations` VALUES (9684, 'pt_BR', 'Louisiana', 28);
INSERT INTO `country_state_translations` VALUES (9685, 'pt_BR', 'Maine', 29);
INSERT INTO `country_state_translations` VALUES (9686, 'pt_BR', 'Ilhas Marshall', 30);
INSERT INTO `country_state_translations` VALUES (9687, 'pt_BR', 'Maryland', 31);
INSERT INTO `country_state_translations` VALUES (9688, 'pt_BR', 'Massachusetts', 32);
INSERT INTO `country_state_translations` VALUES (9689, 'pt_BR', 'Michigan', 33);
INSERT INTO `country_state_translations` VALUES (9690, 'pt_BR', 'Minnesota', 34);
INSERT INTO `country_state_translations` VALUES (9691, 'pt_BR', 'Mississippi', 35);
INSERT INTO `country_state_translations` VALUES (9692, 'pt_BR', 'Missouri', 36);
INSERT INTO `country_state_translations` VALUES (9693, 'pt_BR', 'Montana', 37);
INSERT INTO `country_state_translations` VALUES (9694, 'pt_BR', 'Nebraska', 38);
INSERT INTO `country_state_translations` VALUES (9695, 'pt_BR', 'Nevada', 39);
INSERT INTO `country_state_translations` VALUES (9696, 'pt_BR', 'New Hampshire', 40);
INSERT INTO `country_state_translations` VALUES (9697, 'pt_BR', 'Nova Jersey', 41);
INSERT INTO `country_state_translations` VALUES (9698, 'pt_BR', 'Novo México', 42);
INSERT INTO `country_state_translations` VALUES (9699, 'pt_BR', 'Nova York', 43);
INSERT INTO `country_state_translations` VALUES (9700, 'pt_BR', 'Carolina do Norte', 44);
INSERT INTO `country_state_translations` VALUES (9701, 'pt_BR', 'Dakota do Norte', 45);
INSERT INTO `country_state_translations` VALUES (9702, 'pt_BR', 'Ilhas Marianas do Norte', 46);
INSERT INTO `country_state_translations` VALUES (9703, 'pt_BR', 'Ohio', 47);
INSERT INTO `country_state_translations` VALUES (9704, 'pt_BR', 'Oklahoma', 48);
INSERT INTO `country_state_translations` VALUES (9705, 'pt_BR', 'Oregon', 4);
INSERT INTO `country_state_translations` VALUES (9706, 'pt_BR', 'Palau', 50);
INSERT INTO `country_state_translations` VALUES (9707, 'pt_BR', 'Pensilvânia', 51);
INSERT INTO `country_state_translations` VALUES (9708, 'pt_BR', 'Porto Rico', 52);
INSERT INTO `country_state_translations` VALUES (9709, 'pt_BR', 'Rhode Island', 53);
INSERT INTO `country_state_translations` VALUES (9710, 'pt_BR', 'Carolina do Sul', 54);
INSERT INTO `country_state_translations` VALUES (9711, 'pt_BR', 'Dakota do Sul', 55);
INSERT INTO `country_state_translations` VALUES (9712, 'pt_BR', 'Tennessee', 56);
INSERT INTO `country_state_translations` VALUES (9713, 'pt_BR', 'Texas', 57);
INSERT INTO `country_state_translations` VALUES (9714, 'pt_BR', 'Utah', 58);
INSERT INTO `country_state_translations` VALUES (9715, 'pt_BR', 'Vermont', 59);
INSERT INTO `country_state_translations` VALUES (9716, 'pt_BR', 'Ilhas Virgens', 60);
INSERT INTO `country_state_translations` VALUES (9717, 'pt_BR', 'Virginia', 61);
INSERT INTO `country_state_translations` VALUES (9718, 'pt_BR', 'Washington', 62);
INSERT INTO `country_state_translations` VALUES (9719, 'pt_BR', 'West Virginia', 63);
INSERT INTO `country_state_translations` VALUES (9720, 'pt_BR', 'Wisconsin', 64);
INSERT INTO `country_state_translations` VALUES (9721, 'pt_BR', 'Wyoming', 65);
INSERT INTO `country_state_translations` VALUES (9722, 'pt_BR', 'Alberta', 66);
INSERT INTO `country_state_translations` VALUES (9723, 'pt_BR', 'Colúmbia Britânica', 67);
INSERT INTO `country_state_translations` VALUES (9724, 'pt_BR', 'Manitoba', 68);
INSERT INTO `country_state_translations` VALUES (9725, 'pt_BR', 'Terra Nova e Labrador', 69);
INSERT INTO `country_state_translations` VALUES (9726, 'pt_BR', 'New Brunswick', 70);
INSERT INTO `country_state_translations` VALUES (9727, 'pt_BR', 'Nova Escócia', 7);
INSERT INTO `country_state_translations` VALUES (9728, 'pt_BR', 'Territórios do Noroeste', 72);
INSERT INTO `country_state_translations` VALUES (9729, 'pt_BR', 'Nunavut', 73);
INSERT INTO `country_state_translations` VALUES (9730, 'pt_BR', 'Ontario', 74);
INSERT INTO `country_state_translations` VALUES (9731, 'pt_BR', 'Ilha do Príncipe Eduardo', 75);
INSERT INTO `country_state_translations` VALUES (9732, 'pt_BR', 'Quebec', 76);
INSERT INTO `country_state_translations` VALUES (9733, 'pt_BR', 'Saskatchewan', 77);
INSERT INTO `country_state_translations` VALUES (9734, 'pt_BR', 'Território yukon', 78);
INSERT INTO `country_state_translations` VALUES (9735, 'pt_BR', 'Niedersachsen', 79);
INSERT INTO `country_state_translations` VALUES (9736, 'pt_BR', 'Baden-Wurttemberg', 80);
INSERT INTO `country_state_translations` VALUES (9737, 'pt_BR', 'Bayern', 81);
INSERT INTO `country_state_translations` VALUES (9738, 'pt_BR', 'Berlim', 82);
INSERT INTO `country_state_translations` VALUES (9739, 'pt_BR', 'Brandenburg', 83);
INSERT INTO `country_state_translations` VALUES (9740, 'pt_BR', 'Bremen', 84);
INSERT INTO `country_state_translations` VALUES (9741, 'pt_BR', 'Hamburgo', 85);
INSERT INTO `country_state_translations` VALUES (9742, 'pt_BR', 'Hessen', 86);
INSERT INTO `country_state_translations` VALUES (9743, 'pt_BR', 'Mecklenburg-Vorpommern', 87);
INSERT INTO `country_state_translations` VALUES (9744, 'pt_BR', 'Nordrhein-Westfalen', 88);
INSERT INTO `country_state_translations` VALUES (9745, 'pt_BR', 'Renânia-Palatinado', 8);
INSERT INTO `country_state_translations` VALUES (9746, 'pt_BR', 'Sarre', 90);
INSERT INTO `country_state_translations` VALUES (9747, 'pt_BR', 'Sachsen', 91);
INSERT INTO `country_state_translations` VALUES (9748, 'pt_BR', 'Sachsen-Anhalt', 92);
INSERT INTO `country_state_translations` VALUES (9749, 'pt_BR', 'Schleswig-Holstein', 93);
INSERT INTO `country_state_translations` VALUES (9750, 'pt_BR', 'Turíngia', 94);
INSERT INTO `country_state_translations` VALUES (9751, 'pt_BR', 'Viena', 95);
INSERT INTO `country_state_translations` VALUES (9752, 'pt_BR', 'Baixa Áustria', 96);
INSERT INTO `country_state_translations` VALUES (9753, 'pt_BR', 'Oberösterreich', 97);
INSERT INTO `country_state_translations` VALUES (9754, 'pt_BR', 'Salzburg', 98);
INSERT INTO `country_state_translations` VALUES (9755, 'pt_BR', 'Caríntia', 99);
INSERT INTO `country_state_translations` VALUES (9756, 'pt_BR', 'Steiermark', 100);
INSERT INTO `country_state_translations` VALUES (9757, 'pt_BR', 'Tirol', 101);
INSERT INTO `country_state_translations` VALUES (9758, 'pt_BR', 'Burgenland', 102);
INSERT INTO `country_state_translations` VALUES (9759, 'pt_BR', 'Vorarlberg', 103);
INSERT INTO `country_state_translations` VALUES (9760, 'pt_BR', 'Aargau', 104);
INSERT INTO `country_state_translations` VALUES (9761, 'pt_BR', 'Appenzell Innerrhoden', 105);
INSERT INTO `country_state_translations` VALUES (9762, 'pt_BR', 'Appenzell Ausserrhoden', 106);
INSERT INTO `country_state_translations` VALUES (9763, 'pt_BR', 'Bern', 107);
INSERT INTO `country_state_translations` VALUES (9764, 'pt_BR', 'Basel-Landschaft', 108);
INSERT INTO `country_state_translations` VALUES (9765, 'pt_BR', 'Basel-Stadt', 109);
INSERT INTO `country_state_translations` VALUES (9766, 'pt_BR', 'Freiburg', 110);
INSERT INTO `country_state_translations` VALUES (9767, 'pt_BR', 'Genf', 111);
INSERT INTO `country_state_translations` VALUES (9768, 'pt_BR', 'Glarus', 112);
INSERT INTO `country_state_translations` VALUES (9769, 'pt_BR', 'Grisons', 113);
INSERT INTO `country_state_translations` VALUES (9770, 'pt_BR', 'Jura', 114);
INSERT INTO `country_state_translations` VALUES (9771, 'pt_BR', 'Luzern', 115);
INSERT INTO `country_state_translations` VALUES (9772, 'pt_BR', 'Neuenburg', 116);
INSERT INTO `country_state_translations` VALUES (9773, 'pt_BR', 'Nidwalden', 117);
INSERT INTO `country_state_translations` VALUES (9774, 'pt_BR', 'Obwalden', 118);
INSERT INTO `country_state_translations` VALUES (9775, 'pt_BR', 'St. Gallen', 119);
INSERT INTO `country_state_translations` VALUES (9776, 'pt_BR', 'Schaffhausen', 120);
INSERT INTO `country_state_translations` VALUES (9777, 'pt_BR', 'Solothurn', 121);
INSERT INTO `country_state_translations` VALUES (9778, 'pt_BR', 'Schwyz', 122);
INSERT INTO `country_state_translations` VALUES (9779, 'pt_BR', 'Thurgau', 123);
INSERT INTO `country_state_translations` VALUES (9780, 'pt_BR', 'Tessin', 124);
INSERT INTO `country_state_translations` VALUES (9781, 'pt_BR', 'Uri', 125);
INSERT INTO `country_state_translations` VALUES (9782, 'pt_BR', 'Waadt', 126);
INSERT INTO `country_state_translations` VALUES (9783, 'pt_BR', 'Wallis', 127);
INSERT INTO `country_state_translations` VALUES (9784, 'pt_BR', 'Zug', 128);
INSERT INTO `country_state_translations` VALUES (9785, 'pt_BR', 'Zurique', 129);
INSERT INTO `country_state_translations` VALUES (9786, 'pt_BR', 'Corunha', 130);
INSERT INTO `country_state_translations` VALUES (9787, 'pt_BR', 'Álava', 131);
INSERT INTO `country_state_translations` VALUES (9788, 'pt_BR', 'Albacete', 132);
INSERT INTO `country_state_translations` VALUES (9789, 'pt_BR', 'Alicante', 133);
INSERT INTO `country_state_translations` VALUES (9790, 'pt_BR', 'Almeria', 134);
INSERT INTO `country_state_translations` VALUES (9791, 'pt_BR', 'Astúrias', 135);
INSERT INTO `country_state_translations` VALUES (9792, 'pt_BR', 'Avila', 136);
INSERT INTO `country_state_translations` VALUES (9793, 'pt_BR', 'Badajoz', 137);
INSERT INTO `country_state_translations` VALUES (9794, 'pt_BR', 'Baleares', 138);
INSERT INTO `country_state_translations` VALUES (9795, 'pt_BR', 'Barcelona', 139);
INSERT INTO `country_state_translations` VALUES (9796, 'pt_BR', 'Burgos', 140);
INSERT INTO `country_state_translations` VALUES (9797, 'pt_BR', 'Caceres', 141);
INSERT INTO `country_state_translations` VALUES (9798, 'pt_BR', 'Cadiz', 142);
INSERT INTO `country_state_translations` VALUES (9799, 'pt_BR', 'Cantábria', 143);
INSERT INTO `country_state_translations` VALUES (9800, 'pt_BR', 'Castellon', 144);
INSERT INTO `country_state_translations` VALUES (9801, 'pt_BR', 'Ceuta', 145);
INSERT INTO `country_state_translations` VALUES (9802, 'pt_BR', 'Ciudad Real', 146);
INSERT INTO `country_state_translations` VALUES (9803, 'pt_BR', 'Cordoba', 147);
INSERT INTO `country_state_translations` VALUES (9804, 'pt_BR', 'Cuenca', 148);
INSERT INTO `country_state_translations` VALUES (9805, 'pt_BR', 'Girona', 149);
INSERT INTO `country_state_translations` VALUES (9806, 'pt_BR', 'Granada', 150);
INSERT INTO `country_state_translations` VALUES (9807, 'pt_BR', 'Guadalajara', 151);
INSERT INTO `country_state_translations` VALUES (9808, 'pt_BR', 'Guipuzcoa', 152);
INSERT INTO `country_state_translations` VALUES (9809, 'pt_BR', 'Huelva', 153);
INSERT INTO `country_state_translations` VALUES (9810, 'pt_BR', 'Huesca', 154);
INSERT INTO `country_state_translations` VALUES (9811, 'pt_BR', 'Jaen', 155);
INSERT INTO `country_state_translations` VALUES (9812, 'pt_BR', 'La Rioja', 156);
INSERT INTO `country_state_translations` VALUES (9813, 'pt_BR', 'Las Palmas', 157);
INSERT INTO `country_state_translations` VALUES (9814, 'pt_BR', 'Leon', 158);
INSERT INTO `country_state_translations` VALUES (9815, 'pt_BR', 'Lleida', 159);
INSERT INTO `country_state_translations` VALUES (9816, 'pt_BR', 'Lugo', 160);
INSERT INTO `country_state_translations` VALUES (9817, 'pt_BR', 'Madri', 161);
INSERT INTO `country_state_translations` VALUES (9818, 'pt_BR', 'Málaga', 162);
INSERT INTO `country_state_translations` VALUES (9819, 'pt_BR', 'Melilla', 163);
INSERT INTO `country_state_translations` VALUES (9820, 'pt_BR', 'Murcia', 164);
INSERT INTO `country_state_translations` VALUES (9821, 'pt_BR', 'Navarra', 165);
INSERT INTO `country_state_translations` VALUES (9822, 'pt_BR', 'Ourense', 166);
INSERT INTO `country_state_translations` VALUES (9823, 'pt_BR', 'Palencia', 167);
INSERT INTO `country_state_translations` VALUES (9824, 'pt_BR', 'Pontevedra', 168);
INSERT INTO `country_state_translations` VALUES (9825, 'pt_BR', 'Salamanca', 169);
INSERT INTO `country_state_translations` VALUES (9826, 'pt_BR', 'Santa Cruz de Tenerife', 170);
INSERT INTO `country_state_translations` VALUES (9827, 'pt_BR', 'Segovia', 171);
INSERT INTO `country_state_translations` VALUES (9828, 'pt_BR', 'Sevilla', 172);
INSERT INTO `country_state_translations` VALUES (9829, 'pt_BR', 'Soria', 173);
INSERT INTO `country_state_translations` VALUES (9830, 'pt_BR', 'Tarragona', 174);
INSERT INTO `country_state_translations` VALUES (9831, 'pt_BR', 'Teruel', 175);
INSERT INTO `country_state_translations` VALUES (9832, 'pt_BR', 'Toledo', 176);
INSERT INTO `country_state_translations` VALUES (9833, 'pt_BR', 'Valencia', 177);
INSERT INTO `country_state_translations` VALUES (9834, 'pt_BR', 'Valladolid', 178);
INSERT INTO `country_state_translations` VALUES (9835, 'pt_BR', 'Vizcaya', 179);
INSERT INTO `country_state_translations` VALUES (9836, 'pt_BR', 'Zamora', 180);
INSERT INTO `country_state_translations` VALUES (9837, 'pt_BR', 'Zaragoza', 181);
INSERT INTO `country_state_translations` VALUES (9838, 'pt_BR', 'Ain', 182);
INSERT INTO `country_state_translations` VALUES (9839, 'pt_BR', 'Aisne', 183);
INSERT INTO `country_state_translations` VALUES (9840, 'pt_BR', 'Allier', 184);
INSERT INTO `country_state_translations` VALUES (9841, 'pt_BR', 'Alpes da Alta Provença', 185);
INSERT INTO `country_state_translations` VALUES (9842, 'pt_BR', 'Altos Alpes', 186);
INSERT INTO `country_state_translations` VALUES (9843, 'pt_BR', 'Alpes-Maritimes', 187);
INSERT INTO `country_state_translations` VALUES (9844, 'pt_BR', 'Ardèche', 188);
INSERT INTO `country_state_translations` VALUES (9845, 'pt_BR', 'Ardennes', 189);
INSERT INTO `country_state_translations` VALUES (9846, 'pt_BR', 'Ariege', 190);
INSERT INTO `country_state_translations` VALUES (9847, 'pt_BR', 'Aube', 191);
INSERT INTO `country_state_translations` VALUES (9848, 'pt_BR', 'Aude', 192);
INSERT INTO `country_state_translations` VALUES (9849, 'pt_BR', 'Aveyron', 193);
INSERT INTO `country_state_translations` VALUES (9850, 'pt_BR', 'BOCAS DO Rhône', 194);
INSERT INTO `country_state_translations` VALUES (9851, 'pt_BR', 'Calvados', 195);
INSERT INTO `country_state_translations` VALUES (9852, 'pt_BR', 'Cantal', 196);
INSERT INTO `country_state_translations` VALUES (9853, 'pt_BR', 'Charente', 197);
INSERT INTO `country_state_translations` VALUES (9854, 'pt_BR', 'Charente-Maritime', 198);
INSERT INTO `country_state_translations` VALUES (9855, 'pt_BR', 'Cher', 199);
INSERT INTO `country_state_translations` VALUES (9856, 'pt_BR', 'Corrèze', 200);
INSERT INTO `country_state_translations` VALUES (9857, 'pt_BR', 'Corse-du-Sud', 201);
INSERT INTO `country_state_translations` VALUES (9858, 'pt_BR', 'Alta Córsega', 202);
INSERT INTO `country_state_translations` VALUES (9859, 'pt_BR', 'Costa d\'OrCorrèze', 203);
INSERT INTO `country_state_translations` VALUES (9860, 'pt_BR', 'Cotes d\'Armor', 204);
INSERT INTO `country_state_translations` VALUES (9861, 'pt_BR', 'Creuse', 205);
INSERT INTO `country_state_translations` VALUES (9862, 'pt_BR', 'Dordogne', 206);
INSERT INTO `country_state_translations` VALUES (9863, 'pt_BR', 'Doubs', 207);
INSERT INTO `country_state_translations` VALUES (9864, 'pt_BR', 'DrômeFinistère', 208);
INSERT INTO `country_state_translations` VALUES (9865, 'pt_BR', 'Eure', 209);
INSERT INTO `country_state_translations` VALUES (9866, 'pt_BR', 'Eure-et-Loir', 210);
INSERT INTO `country_state_translations` VALUES (9867, 'pt_BR', 'Finistère', 211);
INSERT INTO `country_state_translations` VALUES (9868, 'pt_BR', 'Gard', 212);
INSERT INTO `country_state_translations` VALUES (9869, 'pt_BR', 'Haute-Garonne', 213);
INSERT INTO `country_state_translations` VALUES (9870, 'pt_BR', 'Gers', 214);
INSERT INTO `country_state_translations` VALUES (9871, 'pt_BR', 'Gironde', 215);
INSERT INTO `country_state_translations` VALUES (9872, 'pt_BR', 'Hérault', 216);
INSERT INTO `country_state_translations` VALUES (9873, 'pt_BR', 'Ille-et-Vilaine', 217);
INSERT INTO `country_state_translations` VALUES (9874, 'pt_BR', 'Indre', 218);
INSERT INTO `country_state_translations` VALUES (9875, 'pt_BR', 'Indre-et-Loire', 219);
INSERT INTO `country_state_translations` VALUES (9876, 'pt_BR', 'Isère', 220);
INSERT INTO `country_state_translations` VALUES (9877, 'pt_BR', 'Jura', 221);
INSERT INTO `country_state_translations` VALUES (9878, 'pt_BR', 'Landes', 222);
INSERT INTO `country_state_translations` VALUES (9879, 'pt_BR', 'Loir-et-Cher', 223);
INSERT INTO `country_state_translations` VALUES (9880, 'pt_BR', 'Loire', 224);
INSERT INTO `country_state_translations` VALUES (9881, 'pt_BR', 'Haute-Loire', 22);
INSERT INTO `country_state_translations` VALUES (9882, 'pt_BR', 'Loire-Atlantique', 226);
INSERT INTO `country_state_translations` VALUES (9883, 'pt_BR', 'Loiret', 227);
INSERT INTO `country_state_translations` VALUES (9884, 'pt_BR', 'Lot', 228);
INSERT INTO `country_state_translations` VALUES (9885, 'pt_BR', 'Lot e Garona', 229);
INSERT INTO `country_state_translations` VALUES (9886, 'pt_BR', 'Lozère', 230);
INSERT INTO `country_state_translations` VALUES (9887, 'pt_BR', 'Maine-et-Loire', 231);
INSERT INTO `country_state_translations` VALUES (9888, 'pt_BR', 'Manche', 232);
INSERT INTO `country_state_translations` VALUES (9889, 'pt_BR', 'Marne', 233);
INSERT INTO `country_state_translations` VALUES (9890, 'pt_BR', 'Haute-Marne', 234);
INSERT INTO `country_state_translations` VALUES (9891, 'pt_BR', 'Mayenne', 235);
INSERT INTO `country_state_translations` VALUES (9892, 'pt_BR', 'Meurthe-et-Moselle', 236);
INSERT INTO `country_state_translations` VALUES (9893, 'pt_BR', 'Meuse', 237);
INSERT INTO `country_state_translations` VALUES (9894, 'pt_BR', 'Morbihan', 238);
INSERT INTO `country_state_translations` VALUES (9895, 'pt_BR', 'Moselle', 239);
INSERT INTO `country_state_translations` VALUES (9896, 'pt_BR', 'Nièvre', 240);
INSERT INTO `country_state_translations` VALUES (9897, 'pt_BR', 'Nord', 241);
INSERT INTO `country_state_translations` VALUES (9898, 'pt_BR', 'Oise', 242);
INSERT INTO `country_state_translations` VALUES (9899, 'pt_BR', 'Orne', 243);
INSERT INTO `country_state_translations` VALUES (9900, 'pt_BR', 'Pas-de-Calais', 244);
INSERT INTO `country_state_translations` VALUES (9901, 'pt_BR', 'Puy-de-Dôme', 24);
INSERT INTO `country_state_translations` VALUES (9902, 'pt_BR', 'Pirineus Atlânticos', 246);
INSERT INTO `country_state_translations` VALUES (9903, 'pt_BR', 'Hautes-Pyrénées', 247);
INSERT INTO `country_state_translations` VALUES (9904, 'pt_BR', 'Pirineus Orientais', 248);
INSERT INTO `country_state_translations` VALUES (9905, 'pt_BR', 'Bas-Rhin', 249);
INSERT INTO `country_state_translations` VALUES (9906, 'pt_BR', 'Alto Reno', 250);
INSERT INTO `country_state_translations` VALUES (9907, 'pt_BR', 'Rhône', 251);
INSERT INTO `country_state_translations` VALUES (9908, 'pt_BR', 'Haute-Saône', 252);
INSERT INTO `country_state_translations` VALUES (9909, 'pt_BR', 'Saône-et-Loire', 253);
INSERT INTO `country_state_translations` VALUES (9910, 'pt_BR', 'Sarthe', 25);
INSERT INTO `country_state_translations` VALUES (9911, 'pt_BR', 'Savoie', 255);
INSERT INTO `country_state_translations` VALUES (9912, 'pt_BR', 'Alta Sabóia', 256);
INSERT INTO `country_state_translations` VALUES (9913, 'pt_BR', 'Paris', 257);
INSERT INTO `country_state_translations` VALUES (9914, 'pt_BR', 'Seine-Maritime', 258);
INSERT INTO `country_state_translations` VALUES (9915, 'pt_BR', 'Seine-et-Marne', 259);
INSERT INTO `country_state_translations` VALUES (9916, 'pt_BR', 'Yvelines', 260);
INSERT INTO `country_state_translations` VALUES (9917, 'pt_BR', 'Deux-Sèvres', 261);
INSERT INTO `country_state_translations` VALUES (9918, 'pt_BR', 'Somme', 262);
INSERT INTO `country_state_translations` VALUES (9919, 'pt_BR', 'Tarn', 263);
INSERT INTO `country_state_translations` VALUES (9920, 'pt_BR', 'Tarn-et-Garonne', 264);
INSERT INTO `country_state_translations` VALUES (9921, 'pt_BR', 'Var', 265);
INSERT INTO `country_state_translations` VALUES (9922, 'pt_BR', 'Vaucluse', 266);
INSERT INTO `country_state_translations` VALUES (9923, 'pt_BR', 'Compradora', 267);
INSERT INTO `country_state_translations` VALUES (9924, 'pt_BR', 'Vienne', 268);
INSERT INTO `country_state_translations` VALUES (9925, 'pt_BR', 'Haute-Vienne', 269);
INSERT INTO `country_state_translations` VALUES (9926, 'pt_BR', 'Vosges', 270);
INSERT INTO `country_state_translations` VALUES (9927, 'pt_BR', 'Yonne', 271);
INSERT INTO `country_state_translations` VALUES (9928, 'pt_BR', 'Território de Belfort', 272);
INSERT INTO `country_state_translations` VALUES (9929, 'pt_BR', 'Essonne', 273);
INSERT INTO `country_state_translations` VALUES (9930, 'pt_BR', 'Altos do Sena', 274);
INSERT INTO `country_state_translations` VALUES (9931, 'pt_BR', 'Seine-Saint-Denis', 275);
INSERT INTO `country_state_translations` VALUES (9932, 'pt_BR', 'Val-de-Marne', 276);
INSERT INTO `country_state_translations` VALUES (9933, 'pt_BR', 'Val-d\'Oise', 277);
INSERT INTO `country_state_translations` VALUES (9934, 'pt_BR', 'Alba', 278);
INSERT INTO `country_state_translations` VALUES (9935, 'pt_BR', 'Arad', 279);
INSERT INTO `country_state_translations` VALUES (9936, 'pt_BR', 'Arges', 280);
INSERT INTO `country_state_translations` VALUES (9937, 'pt_BR', 'Bacau', 281);
INSERT INTO `country_state_translations` VALUES (9938, 'pt_BR', 'Bihor', 282);
INSERT INTO `country_state_translations` VALUES (9939, 'pt_BR', 'Bistrita-Nasaud', 283);
INSERT INTO `country_state_translations` VALUES (9940, 'pt_BR', 'Botosani', 284);
INSERT INTO `country_state_translations` VALUES (9941, 'pt_BR', 'Brașov', 285);
INSERT INTO `country_state_translations` VALUES (9942, 'pt_BR', 'Braila', 286);
INSERT INTO `country_state_translations` VALUES (9943, 'pt_BR', 'Bucareste', 287);
INSERT INTO `country_state_translations` VALUES (9944, 'pt_BR', 'Buzau', 288);
INSERT INTO `country_state_translations` VALUES (9945, 'pt_BR', 'Caras-Severin', 289);
INSERT INTO `country_state_translations` VALUES (9946, 'pt_BR', 'Călărași', 290);
INSERT INTO `country_state_translations` VALUES (9947, 'pt_BR', 'Cluj', 291);
INSERT INTO `country_state_translations` VALUES (9948, 'pt_BR', 'Constanta', 292);
INSERT INTO `country_state_translations` VALUES (9949, 'pt_BR', 'Covasna', 29);
INSERT INTO `country_state_translations` VALUES (9950, 'pt_BR', 'Dambovita', 294);
INSERT INTO `country_state_translations` VALUES (9951, 'pt_BR', 'Dolj', 295);
INSERT INTO `country_state_translations` VALUES (9952, 'pt_BR', 'Galati', 296);
INSERT INTO `country_state_translations` VALUES (9953, 'pt_BR', 'Giurgiu', 297);
INSERT INTO `country_state_translations` VALUES (9954, 'pt_BR', 'Gorj', 298);
INSERT INTO `country_state_translations` VALUES (9955, 'pt_BR', 'Harghita', 299);
INSERT INTO `country_state_translations` VALUES (9956, 'pt_BR', 'Hunedoara', 300);
INSERT INTO `country_state_translations` VALUES (9957, 'pt_BR', 'Ialomita', 301);
INSERT INTO `country_state_translations` VALUES (9958, 'pt_BR', 'Iasi', 302);
INSERT INTO `country_state_translations` VALUES (9959, 'pt_BR', 'Ilfov', 303);
INSERT INTO `country_state_translations` VALUES (9960, 'pt_BR', 'Maramures', 304);
INSERT INTO `country_state_translations` VALUES (9961, 'pt_BR', 'Maramures', 305);
INSERT INTO `country_state_translations` VALUES (9962, 'pt_BR', 'Mures', 306);
INSERT INTO `country_state_translations` VALUES (9963, 'pt_BR', 'alemão', 307);
INSERT INTO `country_state_translations` VALUES (9964, 'pt_BR', 'Olt', 308);
INSERT INTO `country_state_translations` VALUES (9965, 'pt_BR', 'Prahova', 309);
INSERT INTO `country_state_translations` VALUES (9966, 'pt_BR', 'Satu-Mare', 310);
INSERT INTO `country_state_translations` VALUES (9967, 'pt_BR', 'Salaj', 311);
INSERT INTO `country_state_translations` VALUES (9968, 'pt_BR', 'Sibiu', 312);
INSERT INTO `country_state_translations` VALUES (9969, 'pt_BR', 'Suceava', 313);
INSERT INTO `country_state_translations` VALUES (9970, 'pt_BR', 'Teleorman', 314);
INSERT INTO `country_state_translations` VALUES (9971, 'pt_BR', 'Timis', 315);
INSERT INTO `country_state_translations` VALUES (9972, 'pt_BR', 'Tulcea', 316);
INSERT INTO `country_state_translations` VALUES (9973, 'pt_BR', 'Vaslui', 317);
INSERT INTO `country_state_translations` VALUES (9974, 'pt_BR', 'dale', 318);
INSERT INTO `country_state_translations` VALUES (9975, 'pt_BR', 'Vrancea', 319);
INSERT INTO `country_state_translations` VALUES (9976, 'pt_BR', 'Lappi', 320);
INSERT INTO `country_state_translations` VALUES (9977, 'pt_BR', 'Pohjois-Pohjanmaa', 321);
INSERT INTO `country_state_translations` VALUES (9978, 'pt_BR', 'Kainuu', 322);
INSERT INTO `country_state_translations` VALUES (9979, 'pt_BR', 'Pohjois-Karjala', 323);
INSERT INTO `country_state_translations` VALUES (9980, 'pt_BR', 'Pohjois-Savo', 324);
INSERT INTO `country_state_translations` VALUES (9981, 'pt_BR', 'Sul Savo', 325);
INSERT INTO `country_state_translations` VALUES (9982, 'pt_BR', 'Ostrobothnia do sul', 326);
INSERT INTO `country_state_translations` VALUES (9983, 'pt_BR', 'Pohjanmaa', 327);
INSERT INTO `country_state_translations` VALUES (9984, 'pt_BR', 'Pirkanmaa', 328);
INSERT INTO `country_state_translations` VALUES (9985, 'pt_BR', 'Satakunta', 329);
INSERT INTO `country_state_translations` VALUES (9986, 'pt_BR', 'Keski-Pohjanmaa', 330);
INSERT INTO `country_state_translations` VALUES (9987, 'pt_BR', 'Keski-Suomi', 331);
INSERT INTO `country_state_translations` VALUES (9988, 'pt_BR', 'Varsinais-Suomi', 332);
INSERT INTO `country_state_translations` VALUES (9989, 'pt_BR', 'Carélia do Sul', 333);
INSERT INTO `country_state_translations` VALUES (9990, 'pt_BR', 'Päijät-Häme', 334);
INSERT INTO `country_state_translations` VALUES (9991, 'pt_BR', 'Kanta-Häme', 335);
INSERT INTO `country_state_translations` VALUES (9992, 'pt_BR', 'Uusimaa', 336);
INSERT INTO `country_state_translations` VALUES (9993, 'pt_BR', 'Uusimaa', 337);
INSERT INTO `country_state_translations` VALUES (9994, 'pt_BR', 'Kymenlaakso', 338);
INSERT INTO `country_state_translations` VALUES (9995, 'pt_BR', 'Ahvenanmaa', 339);
INSERT INTO `country_state_translations` VALUES (9996, 'pt_BR', 'Harjumaa', 340);
INSERT INTO `country_state_translations` VALUES (9997, 'pt_BR', 'Hiiumaa', 341);
INSERT INTO `country_state_translations` VALUES (9998, 'pt_BR', 'Ida-Virumaa', 342);
INSERT INTO `country_state_translations` VALUES (9999, 'pt_BR', 'Condado de Jõgeva', 343);
INSERT INTO `country_state_translations` VALUES (10000, 'pt_BR', 'Condado de Järva', 344);
INSERT INTO `country_state_translations` VALUES (10001, 'pt_BR', 'Läänemaa', 345);
INSERT INTO `country_state_translations` VALUES (10002, 'pt_BR', 'Condado de Lääne-Viru', 346);
INSERT INTO `country_state_translations` VALUES (10003, 'pt_BR', 'Condado de Põlva', 347);
INSERT INTO `country_state_translations` VALUES (10004, 'pt_BR', 'Condado de Pärnu', 348);
INSERT INTO `country_state_translations` VALUES (10005, 'pt_BR', 'Raplamaa', 349);
INSERT INTO `country_state_translations` VALUES (10006, 'pt_BR', 'Saaremaa', 350);
INSERT INTO `country_state_translations` VALUES (10007, 'pt_BR', 'Tartumaa', 351);
INSERT INTO `country_state_translations` VALUES (10008, 'pt_BR', 'Valgamaa', 352);
INSERT INTO `country_state_translations` VALUES (10009, 'pt_BR', 'Viljandimaa', 353);
INSERT INTO `country_state_translations` VALUES (10010, 'pt_BR', 'Võrumaa', 354);
INSERT INTO `country_state_translations` VALUES (10011, 'pt_BR', 'Daugavpils', 355);
INSERT INTO `country_state_translations` VALUES (10012, 'pt_BR', 'Jelgava', 356);
INSERT INTO `country_state_translations` VALUES (10013, 'pt_BR', 'Jekabpils', 357);
INSERT INTO `country_state_translations` VALUES (10014, 'pt_BR', 'Jurmala', 358);
INSERT INTO `country_state_translations` VALUES (10015, 'pt_BR', 'Liepaja', 359);
INSERT INTO `country_state_translations` VALUES (10016, 'pt_BR', 'Liepaja County', 360);
INSERT INTO `country_state_translations` VALUES (10017, 'pt_BR', 'Rezekne', 361);
INSERT INTO `country_state_translations` VALUES (10018, 'pt_BR', 'Riga', 362);
INSERT INTO `country_state_translations` VALUES (10019, 'pt_BR', 'Condado de Riga', 363);
INSERT INTO `country_state_translations` VALUES (10020, 'pt_BR', 'Valmiera', 364);
INSERT INTO `country_state_translations` VALUES (10021, 'pt_BR', 'Ventspils', 365);
INSERT INTO `country_state_translations` VALUES (10022, 'pt_BR', 'Aglonas novads', 366);
INSERT INTO `country_state_translations` VALUES (10023, 'pt_BR', 'Aizkraukles novads', 367);
INSERT INTO `country_state_translations` VALUES (10024, 'pt_BR', 'Aizputes novads', 368);
INSERT INTO `country_state_translations` VALUES (10025, 'pt_BR', 'Condado de Akniste', 369);
INSERT INTO `country_state_translations` VALUES (10026, 'pt_BR', 'Alojas novads', 370);
INSERT INTO `country_state_translations` VALUES (10027, 'pt_BR', 'Alsungas novads', 371);
INSERT INTO `country_state_translations` VALUES (10028, 'pt_BR', 'Aluksne County', 372);
INSERT INTO `country_state_translations` VALUES (10029, 'pt_BR', 'Amatas novads', 373);
INSERT INTO `country_state_translations` VALUES (10030, 'pt_BR', 'Macacos novads', 374);
INSERT INTO `country_state_translations` VALUES (10031, 'pt_BR', 'Auces novads', 375);
INSERT INTO `country_state_translations` VALUES (10032, 'pt_BR', 'Babītes novads', 376);
INSERT INTO `country_state_translations` VALUES (10033, 'pt_BR', 'Baldones novads', 377);
INSERT INTO `country_state_translations` VALUES (10034, 'pt_BR', 'Baltinavas novads', 378);
INSERT INTO `country_state_translations` VALUES (10035, 'pt_BR', 'Balvu novads', 379);
INSERT INTO `country_state_translations` VALUES (10036, 'pt_BR', 'Bauskas novads', 380);
INSERT INTO `country_state_translations` VALUES (10037, 'pt_BR', 'Condado de Beverina', 381);
INSERT INTO `country_state_translations` VALUES (10038, 'pt_BR', 'Condado de Broceni', 382);
INSERT INTO `country_state_translations` VALUES (10039, 'pt_BR', 'Burtnieku novads', 383);
INSERT INTO `country_state_translations` VALUES (10040, 'pt_BR', 'Carnikavas novads', 384);
INSERT INTO `country_state_translations` VALUES (10041, 'pt_BR', 'Cesvaines novads', 385);
INSERT INTO `country_state_translations` VALUES (10042, 'pt_BR', 'Ciblas novads', 386);
INSERT INTO `country_state_translations` VALUES (10043, 'pt_BR', 'Cesis county', 387);
INSERT INTO `country_state_translations` VALUES (10044, 'pt_BR', 'Dagdas novads', 388);
INSERT INTO `country_state_translations` VALUES (10045, 'pt_BR', 'Daugavpils novads', 389);
INSERT INTO `country_state_translations` VALUES (10046, 'pt_BR', 'Dobeles novads', 390);
INSERT INTO `country_state_translations` VALUES (10047, 'pt_BR', 'Dundagas novads', 391);
INSERT INTO `country_state_translations` VALUES (10048, 'pt_BR', 'Durbes novads', 392);
INSERT INTO `country_state_translations` VALUES (10049, 'pt_BR', 'Engad novads', 393);
INSERT INTO `country_state_translations` VALUES (10050, 'pt_BR', 'Garkalnes novads', 394);
INSERT INTO `country_state_translations` VALUES (10051, 'pt_BR', 'O condado de Grobiņa', 395);
INSERT INTO `country_state_translations` VALUES (10052, 'pt_BR', 'Gulbenes novads', 396);
INSERT INTO `country_state_translations` VALUES (10053, 'pt_BR', 'Iecavas novads', 397);
INSERT INTO `country_state_translations` VALUES (10054, 'pt_BR', 'Ikskile county', 398);
INSERT INTO `country_state_translations` VALUES (10055, 'pt_BR', 'Ilūkste county', 399);
INSERT INTO `country_state_translations` VALUES (10056, 'pt_BR', 'Condado de Inčukalns', 400);
INSERT INTO `country_state_translations` VALUES (10057, 'pt_BR', 'Jaunjelgavas novads', 401);
INSERT INTO `country_state_translations` VALUES (10058, 'pt_BR', 'Jaunpiebalgas novads', 402);
INSERT INTO `country_state_translations` VALUES (10059, 'pt_BR', 'Jaunpils novads', 403);
INSERT INTO `country_state_translations` VALUES (10060, 'pt_BR', 'Jelgavas novads', 404);
INSERT INTO `country_state_translations` VALUES (10061, 'pt_BR', 'Jekabpils county', 405);
INSERT INTO `country_state_translations` VALUES (10062, 'pt_BR', 'Kandavas novads', 406);
INSERT INTO `country_state_translations` VALUES (10063, 'pt_BR', 'Kokneses novads', 407);
INSERT INTO `country_state_translations` VALUES (10064, 'pt_BR', 'Krimuldas novads', 408);
INSERT INTO `country_state_translations` VALUES (10065, 'pt_BR', 'Krustpils novads', 409);
INSERT INTO `country_state_translations` VALUES (10066, 'pt_BR', 'Condado de Kraslava', 410);
INSERT INTO `country_state_translations` VALUES (10067, 'pt_BR', 'Condado de Kuldīga', 411);
INSERT INTO `country_state_translations` VALUES (10068, 'pt_BR', 'Condado de Kārsava', 412);
INSERT INTO `country_state_translations` VALUES (10069, 'pt_BR', 'Condado de Lielvarde', 413);
INSERT INTO `country_state_translations` VALUES (10070, 'pt_BR', 'Condado de Limbaži', 414);
INSERT INTO `country_state_translations` VALUES (10071, 'pt_BR', 'O distrito de Lubāna', 415);
INSERT INTO `country_state_translations` VALUES (10072, 'pt_BR', 'Ludzas novads', 416);
INSERT INTO `country_state_translations` VALUES (10073, 'pt_BR', 'Ligatne county', 417);
INSERT INTO `country_state_translations` VALUES (10074, 'pt_BR', 'Livani county', 418);
INSERT INTO `country_state_translations` VALUES (10075, 'pt_BR', 'Madonas novads', 419);
INSERT INTO `country_state_translations` VALUES (10076, 'pt_BR', 'Mazsalacas novads', 420);
INSERT INTO `country_state_translations` VALUES (10077, 'pt_BR', 'Mālpils county', 421);
INSERT INTO `country_state_translations` VALUES (10078, 'pt_BR', 'Mārupe county', 422);
INSERT INTO `country_state_translations` VALUES (10079, 'pt_BR', 'O condado de Naukšēni', 423);
INSERT INTO `country_state_translations` VALUES (10080, 'pt_BR', 'Neretas novads', 424);
INSERT INTO `country_state_translations` VALUES (10081, 'pt_BR', 'Nīca county', 425);
INSERT INTO `country_state_translations` VALUES (10082, 'pt_BR', 'Ogres novads', 426);
INSERT INTO `country_state_translations` VALUES (10083, 'pt_BR', 'Olaines novads', 427);
INSERT INTO `country_state_translations` VALUES (10084, 'pt_BR', 'Ozolnieku novads', 428);
INSERT INTO `country_state_translations` VALUES (10085, 'pt_BR', 'Preiļi county', 429);
INSERT INTO `country_state_translations` VALUES (10086, 'pt_BR', 'Priekules novads', 430);
INSERT INTO `country_state_translations` VALUES (10087, 'pt_BR', 'Condado de Priekuļi', 431);
INSERT INTO `country_state_translations` VALUES (10088, 'pt_BR', 'Moving county', 432);
INSERT INTO `country_state_translations` VALUES (10089, 'pt_BR', 'Condado de Pavilosta', 433);
INSERT INTO `country_state_translations` VALUES (10090, 'pt_BR', 'Condado de Plavinas', 434);
INSERT INTO `country_state_translations` VALUES (10091, 'pt_BR', 'Raunas novads', 435);
INSERT INTO `country_state_translations` VALUES (10092, 'pt_BR', 'Condado de Riebiņi', 436);
INSERT INTO `country_state_translations` VALUES (10093, 'pt_BR', 'Rojas novads', 437);
INSERT INTO `country_state_translations` VALUES (10094, 'pt_BR', 'Ropazi county', 438);
INSERT INTO `country_state_translations` VALUES (10095, 'pt_BR', 'Rucavas novads', 439);
INSERT INTO `country_state_translations` VALUES (10096, 'pt_BR', 'Rugāji county', 440);
INSERT INTO `country_state_translations` VALUES (10097, 'pt_BR', 'Rundāle county', 441);
INSERT INTO `country_state_translations` VALUES (10098, 'pt_BR', 'Rezekne county', 442);
INSERT INTO `country_state_translations` VALUES (10099, 'pt_BR', 'Rūjiena county', 443);
INSERT INTO `country_state_translations` VALUES (10100, 'pt_BR', 'O município de Salacgriva', 444);
INSERT INTO `country_state_translations` VALUES (10101, 'pt_BR', 'Salas novads', 445);
INSERT INTO `country_state_translations` VALUES (10102, 'pt_BR', 'Salaspils novads', 446);
INSERT INTO `country_state_translations` VALUES (10103, 'pt_BR', 'Saldus novads', 447);
INSERT INTO `country_state_translations` VALUES (10104, 'pt_BR', 'Saulkrastu novads', 448);
INSERT INTO `country_state_translations` VALUES (10105, 'pt_BR', 'Siguldas novads', 449);
INSERT INTO `country_state_translations` VALUES (10106, 'pt_BR', 'Skrundas novads', 450);
INSERT INTO `country_state_translations` VALUES (10107, 'pt_BR', 'Skrīveri county', 451);
INSERT INTO `country_state_translations` VALUES (10108, 'pt_BR', 'Smiltenes novads', 452);
INSERT INTO `country_state_translations` VALUES (10109, 'pt_BR', 'Condado de Stopini', 453);
INSERT INTO `country_state_translations` VALUES (10110, 'pt_BR', 'Condado de Strenči', 454);
INSERT INTO `country_state_translations` VALUES (10111, 'pt_BR', 'Região de semeadura', 455);
INSERT INTO `country_state_translations` VALUES (10112, 'pt_BR', 'Talsu novads', 456);
INSERT INTO `country_state_translations` VALUES (10113, 'pt_BR', 'Tukuma novads', 457);
INSERT INTO `country_state_translations` VALUES (10114, 'pt_BR', 'Condado de Tērvete', 458);
INSERT INTO `country_state_translations` VALUES (10115, 'pt_BR', 'O condado de Vaiņode', 459);
INSERT INTO `country_state_translations` VALUES (10116, 'pt_BR', 'Valkas novads', 460);
INSERT INTO `country_state_translations` VALUES (10117, 'pt_BR', 'Valmieras novads', 461);
INSERT INTO `country_state_translations` VALUES (10118, 'pt_BR', 'Varaklani county', 462);
INSERT INTO `country_state_translations` VALUES (10119, 'pt_BR', 'Vecpiebalgas novads', 463);
INSERT INTO `country_state_translations` VALUES (10120, 'pt_BR', 'Vecumnieku novads', 464);
INSERT INTO `country_state_translations` VALUES (10121, 'pt_BR', 'Ventspils novads', 465);
INSERT INTO `country_state_translations` VALUES (10122, 'pt_BR', 'Condado de Viesite', 466);
INSERT INTO `country_state_translations` VALUES (10123, 'pt_BR', 'Condado de Vilaka', 467);
INSERT INTO `country_state_translations` VALUES (10124, 'pt_BR', 'Vilani county', 468);
INSERT INTO `country_state_translations` VALUES (10125, 'pt_BR', 'Condado de Varkava', 469);
INSERT INTO `country_state_translations` VALUES (10126, 'pt_BR', 'Zilupes novads', 470);
INSERT INTO `country_state_translations` VALUES (10127, 'pt_BR', 'Adazi county', 471);
INSERT INTO `country_state_translations` VALUES (10128, 'pt_BR', 'Erglu county', 472);
INSERT INTO `country_state_translations` VALUES (10129, 'pt_BR', 'Kegums county', 473);
INSERT INTO `country_state_translations` VALUES (10130, 'pt_BR', 'Kekava county', 474);
INSERT INTO `country_state_translations` VALUES (10131, 'pt_BR', 'Alytaus Apskritis', 475);
INSERT INTO `country_state_translations` VALUES (10132, 'pt_BR', 'Kauno Apskritis', 476);
INSERT INTO `country_state_translations` VALUES (10133, 'pt_BR', 'Condado de Klaipeda', 477);
INSERT INTO `country_state_translations` VALUES (10134, 'pt_BR', 'Marijampolė county', 478);
INSERT INTO `country_state_translations` VALUES (10135, 'pt_BR', 'Panevezys county', 479);
INSERT INTO `country_state_translations` VALUES (10136, 'pt_BR', 'Siauliai county', 480);
INSERT INTO `country_state_translations` VALUES (10137, 'pt_BR', 'Taurage county', 481);
INSERT INTO `country_state_translations` VALUES (10138, 'pt_BR', 'Telšiai county', 482);
INSERT INTO `country_state_translations` VALUES (10139, 'pt_BR', 'Utenos Apskritis', 483);
INSERT INTO `country_state_translations` VALUES (10140, 'pt_BR', 'Vilniaus Apskritis', 484);
INSERT INTO `country_state_translations` VALUES (10141, 'pt_BR', 'Acre', 485);
INSERT INTO `country_state_translations` VALUES (10142, 'pt_BR', 'Alagoas', 486);
INSERT INTO `country_state_translations` VALUES (10143, 'pt_BR', 'Amapá', 487);
INSERT INTO `country_state_translations` VALUES (10144, 'pt_BR', 'Amazonas', 488);
INSERT INTO `country_state_translations` VALUES (10145, 'pt_BR', 'Bahia', 489);
INSERT INTO `country_state_translations` VALUES (10146, 'pt_BR', 'Ceará', 490);
INSERT INTO `country_state_translations` VALUES (10147, 'pt_BR', 'Espírito Santo', 491);
INSERT INTO `country_state_translations` VALUES (10148, 'pt_BR', 'Goiás', 492);
INSERT INTO `country_state_translations` VALUES (10149, 'pt_BR', 'Maranhão', 493);
INSERT INTO `country_state_translations` VALUES (10150, 'pt_BR', 'Mato Grosso', 494);
INSERT INTO `country_state_translations` VALUES (10151, 'pt_BR', 'Mato Grosso do Sul', 495);
INSERT INTO `country_state_translations` VALUES (10152, 'pt_BR', 'Minas Gerais', 496);
INSERT INTO `country_state_translations` VALUES (10153, 'pt_BR', 'Pará', 497);
INSERT INTO `country_state_translations` VALUES (10154, 'pt_BR', 'Paraíba', 498);
INSERT INTO `country_state_translations` VALUES (10155, 'pt_BR', 'Paraná', 499);
INSERT INTO `country_state_translations` VALUES (10156, 'pt_BR', 'Pernambuco', 500);
INSERT INTO `country_state_translations` VALUES (10157, 'pt_BR', 'Piauí', 501);
INSERT INTO `country_state_translations` VALUES (10158, 'pt_BR', 'Rio de Janeiro', 502);
INSERT INTO `country_state_translations` VALUES (10159, 'pt_BR', 'Rio Grande do Norte', 503);
INSERT INTO `country_state_translations` VALUES (10160, 'pt_BR', 'Rio Grande do Sul', 504);
INSERT INTO `country_state_translations` VALUES (10161, 'pt_BR', 'Rondônia', 505);
INSERT INTO `country_state_translations` VALUES (10162, 'pt_BR', 'Roraima', 506);
INSERT INTO `country_state_translations` VALUES (10163, 'pt_BR', 'Santa Catarina', 507);
INSERT INTO `country_state_translations` VALUES (10164, 'pt_BR', 'São Paulo', 508);
INSERT INTO `country_state_translations` VALUES (10165, 'pt_BR', 'Sergipe', 509);
INSERT INTO `country_state_translations` VALUES (10166, 'pt_BR', 'Tocantins', 510);
INSERT INTO `country_state_translations` VALUES (10167, 'pt_BR', 'Distrito Federal', 511);
INSERT INTO `country_state_translations` VALUES (10168, 'pt_BR', 'Condado de Zagreb', 512);
INSERT INTO `country_state_translations` VALUES (10169, 'pt_BR', 'Condado de Krapina-Zagorje', 513);
INSERT INTO `country_state_translations` VALUES (10170, 'pt_BR', 'Condado de Sisak-Moslavina', 514);
INSERT INTO `country_state_translations` VALUES (10171, 'pt_BR', 'Condado de Karlovac', 515);
INSERT INTO `country_state_translations` VALUES (10172, 'pt_BR', 'Concelho de Varaždin', 516);
INSERT INTO `country_state_translations` VALUES (10173, 'pt_BR', 'Condado de Koprivnica-Križevci', 517);
INSERT INTO `country_state_translations` VALUES (10174, 'pt_BR', 'Condado de Bjelovar-Bilogora', 518);
INSERT INTO `country_state_translations` VALUES (10175, 'pt_BR', 'Condado de Primorje-Gorski kotar', 519);
INSERT INTO `country_state_translations` VALUES (10176, 'pt_BR', 'Condado de Lika-Senj', 520);
INSERT INTO `country_state_translations` VALUES (10177, 'pt_BR', 'Condado de Virovitica-Podravina', 521);
INSERT INTO `country_state_translations` VALUES (10178, 'pt_BR', 'Condado de Požega-Slavonia', 522);
INSERT INTO `country_state_translations` VALUES (10179, 'pt_BR', 'Condado de Brod-Posavina', 523);
INSERT INTO `country_state_translations` VALUES (10180, 'pt_BR', 'Condado de Zadar', 524);
INSERT INTO `country_state_translations` VALUES (10181, 'pt_BR', 'Condado de Osijek-Baranja', 525);
INSERT INTO `country_state_translations` VALUES (10182, 'pt_BR', 'Condado de Šibenik-Knin', 526);
INSERT INTO `country_state_translations` VALUES (10183, 'pt_BR', 'Condado de Vukovar-Srijem', 527);
INSERT INTO `country_state_translations` VALUES (10184, 'pt_BR', 'Condado de Split-Dalmácia', 528);
INSERT INTO `country_state_translations` VALUES (10185, 'pt_BR', 'Condado de Ístria', 529);
INSERT INTO `country_state_translations` VALUES (10186, 'pt_BR', 'Condado de Dubrovnik-Neretva', 530);
INSERT INTO `country_state_translations` VALUES (10187, 'pt_BR', 'Međimurska županija', 531);
INSERT INTO `country_state_translations` VALUES (10188, 'pt_BR', 'Grad Zagreb', 532);
INSERT INTO `country_state_translations` VALUES (10189, 'pt_BR', 'Ilhas Andaman e Nicobar', 533);
INSERT INTO `country_state_translations` VALUES (10190, 'pt_BR', 'Andhra Pradesh', 534);
INSERT INTO `country_state_translations` VALUES (10191, 'pt_BR', 'Arunachal Pradesh', 535);
INSERT INTO `country_state_translations` VALUES (10192, 'pt_BR', 'Assam', 536);
INSERT INTO `country_state_translations` VALUES (10193, 'pt_BR', 'Bihar', 537);
INSERT INTO `country_state_translations` VALUES (10194, 'pt_BR', 'Chandigarh', 538);
INSERT INTO `country_state_translations` VALUES (10195, 'pt_BR', 'Chhattisgarh', 539);
INSERT INTO `country_state_translations` VALUES (10196, 'pt_BR', 'Dadra e Nagar Haveli', 540);
INSERT INTO `country_state_translations` VALUES (10197, 'pt_BR', 'Daman e Diu', 541);
INSERT INTO `country_state_translations` VALUES (10198, 'pt_BR', 'Delhi', 542);
INSERT INTO `country_state_translations` VALUES (10199, 'pt_BR', 'Goa', 543);
INSERT INTO `country_state_translations` VALUES (10200, 'pt_BR', 'Gujarat', 544);
INSERT INTO `country_state_translations` VALUES (10201, 'pt_BR', 'Haryana', 545);
INSERT INTO `country_state_translations` VALUES (10202, 'pt_BR', 'Himachal Pradesh', 546);
INSERT INTO `country_state_translations` VALUES (10203, 'pt_BR', 'Jammu e Caxemira', 547);
INSERT INTO `country_state_translations` VALUES (10204, 'pt_BR', 'Jharkhand', 548);
INSERT INTO `country_state_translations` VALUES (10205, 'pt_BR', 'Karnataka', 549);
INSERT INTO `country_state_translations` VALUES (10206, 'pt_BR', 'Kerala', 550);
INSERT INTO `country_state_translations` VALUES (10207, 'pt_BR', 'Lakshadweep', 551);
INSERT INTO `country_state_translations` VALUES (10208, 'pt_BR', 'Madhya Pradesh', 552);
INSERT INTO `country_state_translations` VALUES (10209, 'pt_BR', 'Maharashtra', 553);
INSERT INTO `country_state_translations` VALUES (10210, 'pt_BR', 'Manipur', 554);
INSERT INTO `country_state_translations` VALUES (10211, 'pt_BR', 'Meghalaya', 555);
INSERT INTO `country_state_translations` VALUES (10212, 'pt_BR', 'Mizoram', 556);
INSERT INTO `country_state_translations` VALUES (10213, 'pt_BR', 'Nagaland', 557);
INSERT INTO `country_state_translations` VALUES (10214, 'pt_BR', 'Odisha', 558);
INSERT INTO `country_state_translations` VALUES (10215, 'pt_BR', 'Puducherry', 559);
INSERT INTO `country_state_translations` VALUES (10216, 'pt_BR', 'Punjab', 560);
INSERT INTO `country_state_translations` VALUES (10217, 'pt_BR', 'Rajasthan', 561);
INSERT INTO `country_state_translations` VALUES (10218, 'pt_BR', 'Sikkim', 562);
INSERT INTO `country_state_translations` VALUES (10219, 'pt_BR', 'Tamil Nadu', 563);
INSERT INTO `country_state_translations` VALUES (10220, 'pt_BR', 'Telangana', 564);
INSERT INTO `country_state_translations` VALUES (10221, 'pt_BR', 'Tripura', 565);
INSERT INTO `country_state_translations` VALUES (10222, 'pt_BR', 'Uttar Pradesh', 566);
INSERT INTO `country_state_translations` VALUES (10223, 'pt_BR', 'Uttarakhand', 567);
INSERT INTO `country_state_translations` VALUES (10224, 'pt_BR', 'Bengala Ocidental', 568);
COMMIT;

-- ----------------------------
-- Table structure for country_states
-- ----------------------------
DROP TABLE IF EXISTS `country_states`;
CREATE TABLE `country_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_states_country_id_foreign` (`country_id`),
  CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of country_states
-- ----------------------------
BEGIN;
INSERT INTO `country_states` VALUES (1, 'US', 'AL', 'Alabama', 244);
INSERT INTO `country_states` VALUES (2, 'US', 'AK', 'Alaska', 244);
INSERT INTO `country_states` VALUES (3, 'US', 'AS', 'American Samoa', 244);
INSERT INTO `country_states` VALUES (4, 'US', 'AZ', 'Arizona', 244);
INSERT INTO `country_states` VALUES (5, 'US', 'AR', 'Arkansas', 244);
INSERT INTO `country_states` VALUES (6, 'US', 'AE', 'Armed Forces Africa', 244);
INSERT INTO `country_states` VALUES (7, 'US', 'AA', 'Armed Forces Americas', 244);
INSERT INTO `country_states` VALUES (8, 'US', 'AE', 'Armed Forces Canada', 244);
INSERT INTO `country_states` VALUES (9, 'US', 'AE', 'Armed Forces Europe', 244);
INSERT INTO `country_states` VALUES (10, 'US', 'AE', 'Armed Forces Middle East', 244);
INSERT INTO `country_states` VALUES (11, 'US', 'AP', 'Armed Forces Pacific', 244);
INSERT INTO `country_states` VALUES (12, 'US', 'CA', 'California', 244);
INSERT INTO `country_states` VALUES (13, 'US', 'CO', 'Colorado', 244);
INSERT INTO `country_states` VALUES (14, 'US', 'CT', 'Connecticut', 244);
INSERT INTO `country_states` VALUES (15, 'US', 'DE', 'Delaware', 244);
INSERT INTO `country_states` VALUES (16, 'US', 'DC', 'District of Columbia', 244);
INSERT INTO `country_states` VALUES (17, 'US', 'FM', 'Federated States Of Micronesia', 244);
INSERT INTO `country_states` VALUES (18, 'US', 'FL', 'Florida', 244);
INSERT INTO `country_states` VALUES (19, 'US', 'GA', 'Georgia', 244);
INSERT INTO `country_states` VALUES (20, 'US', 'GU', 'Guam', 244);
INSERT INTO `country_states` VALUES (21, 'US', 'HI', 'Hawaii', 244);
INSERT INTO `country_states` VALUES (22, 'US', 'ID', 'Idaho', 244);
INSERT INTO `country_states` VALUES (23, 'US', 'IL', 'Illinois', 244);
INSERT INTO `country_states` VALUES (24, 'US', 'IN', 'Indiana', 244);
INSERT INTO `country_states` VALUES (25, 'US', 'IA', 'Iowa', 244);
INSERT INTO `country_states` VALUES (26, 'US', 'KS', 'Kansas', 244);
INSERT INTO `country_states` VALUES (27, 'US', 'KY', 'Kentucky', 244);
INSERT INTO `country_states` VALUES (28, 'US', 'LA', 'Louisiana', 244);
INSERT INTO `country_states` VALUES (29, 'US', 'ME', 'Maine', 244);
INSERT INTO `country_states` VALUES (30, 'US', 'MH', 'Marshall Islands', 244);
INSERT INTO `country_states` VALUES (31, 'US', 'MD', 'Maryland', 244);
INSERT INTO `country_states` VALUES (32, 'US', 'MA', 'Massachusetts', 244);
INSERT INTO `country_states` VALUES (33, 'US', 'MI', 'Michigan', 244);
INSERT INTO `country_states` VALUES (34, 'US', 'MN', 'Minnesota', 244);
INSERT INTO `country_states` VALUES (35, 'US', 'MS', 'Mississippi', 244);
INSERT INTO `country_states` VALUES (36, 'US', 'MO', 'Missouri', 244);
INSERT INTO `country_states` VALUES (37, 'US', 'MT', 'Montana', 244);
INSERT INTO `country_states` VALUES (38, 'US', 'NE', 'Nebraska', 244);
INSERT INTO `country_states` VALUES (39, 'US', 'NV', 'Nevada', 244);
INSERT INTO `country_states` VALUES (40, 'US', 'NH', 'New Hampshire', 244);
INSERT INTO `country_states` VALUES (41, 'US', 'NJ', 'New Jersey', 244);
INSERT INTO `country_states` VALUES (42, 'US', 'NM', 'New Mexico', 244);
INSERT INTO `country_states` VALUES (43, 'US', 'NY', 'New York', 244);
INSERT INTO `country_states` VALUES (44, 'US', 'NC', 'North Carolina', 244);
INSERT INTO `country_states` VALUES (45, 'US', 'ND', 'North Dakota', 244);
INSERT INTO `country_states` VALUES (46, 'US', 'MP', 'Northern Mariana Islands', 244);
INSERT INTO `country_states` VALUES (47, 'US', 'OH', 'Ohio', 244);
INSERT INTO `country_states` VALUES (48, 'US', 'OK', 'Oklahoma', 244);
INSERT INTO `country_states` VALUES (49, 'US', 'OR', 'Oregon', 244);
INSERT INTO `country_states` VALUES (50, 'US', 'PW', 'Palau', 244);
INSERT INTO `country_states` VALUES (51, 'US', 'PA', 'Pennsylvania', 244);
INSERT INTO `country_states` VALUES (52, 'US', 'PR', 'Puerto Rico', 244);
INSERT INTO `country_states` VALUES (53, 'US', 'RI', 'Rhode Island', 244);
INSERT INTO `country_states` VALUES (54, 'US', 'SC', 'South Carolina', 244);
INSERT INTO `country_states` VALUES (55, 'US', 'SD', 'South Dakota', 244);
INSERT INTO `country_states` VALUES (56, 'US', 'TN', 'Tennessee', 244);
INSERT INTO `country_states` VALUES (57, 'US', 'TX', 'Texas', 244);
INSERT INTO `country_states` VALUES (58, 'US', 'UT', 'Utah', 244);
INSERT INTO `country_states` VALUES (59, 'US', 'VT', 'Vermont', 244);
INSERT INTO `country_states` VALUES (60, 'US', 'VI', 'Virgin Islands', 244);
INSERT INTO `country_states` VALUES (61, 'US', 'VA', 'Virginia', 244);
INSERT INTO `country_states` VALUES (62, 'US', 'WA', 'Washington', 244);
INSERT INTO `country_states` VALUES (63, 'US', 'WV', 'West Virginia', 244);
INSERT INTO `country_states` VALUES (64, 'US', 'WI', 'Wisconsin', 244);
INSERT INTO `country_states` VALUES (65, 'US', 'WY', 'Wyoming', 244);
INSERT INTO `country_states` VALUES (66, 'CA', 'AB', 'Alberta', 40);
INSERT INTO `country_states` VALUES (67, 'CA', 'BC', 'British Columbia', 40);
INSERT INTO `country_states` VALUES (68, 'CA', 'MB', 'Manitoba', 40);
INSERT INTO `country_states` VALUES (69, 'CA', 'NL', 'Newfoundland and Labrador', 40);
INSERT INTO `country_states` VALUES (70, 'CA', 'NB', 'New Brunswick', 40);
INSERT INTO `country_states` VALUES (71, 'CA', 'NS', 'Nova Scotia', 40);
INSERT INTO `country_states` VALUES (72, 'CA', 'NT', 'Northwest Territories', 40);
INSERT INTO `country_states` VALUES (73, 'CA', 'NU', 'Nunavut', 40);
INSERT INTO `country_states` VALUES (74, 'CA', 'ON', 'Ontario', 40);
INSERT INTO `country_states` VALUES (75, 'CA', 'PE', 'Prince Edward Island', 40);
INSERT INTO `country_states` VALUES (76, 'CA', 'QC', 'Quebec', 40);
INSERT INTO `country_states` VALUES (77, 'CA', 'SK', 'Saskatchewan', 40);
INSERT INTO `country_states` VALUES (78, 'CA', 'YT', 'Yukon Territory', 40);
INSERT INTO `country_states` VALUES (79, 'DE', 'NDS', 'Niedersachsen', 88);
INSERT INTO `country_states` VALUES (80, 'DE', 'BAW', 'Baden-Württemberg', 88);
INSERT INTO `country_states` VALUES (81, 'DE', 'BAY', 'Bayern', 88);
INSERT INTO `country_states` VALUES (82, 'DE', 'BER', 'Berlin', 88);
INSERT INTO `country_states` VALUES (83, 'DE', 'BRG', 'Brandenburg', 88);
INSERT INTO `country_states` VALUES (84, 'DE', 'BRE', 'Bremen', 88);
INSERT INTO `country_states` VALUES (85, 'DE', 'HAM', 'Hamburg', 88);
INSERT INTO `country_states` VALUES (86, 'DE', 'HES', 'Hessen', 88);
INSERT INTO `country_states` VALUES (87, 'DE', 'MEC', 'Mecklenburg-Vorpommern', 88);
INSERT INTO `country_states` VALUES (88, 'DE', 'NRW', 'Nordrhein-Westfalen', 88);
INSERT INTO `country_states` VALUES (89, 'DE', 'RHE', 'Rheinland-Pfalz', 88);
INSERT INTO `country_states` VALUES (90, 'DE', 'SAR', 'Saarland', 88);
INSERT INTO `country_states` VALUES (91, 'DE', 'SAS', 'Sachsen', 88);
INSERT INTO `country_states` VALUES (92, 'DE', 'SAC', 'Sachsen-Anhalt', 88);
INSERT INTO `country_states` VALUES (93, 'DE', 'SCN', 'Schleswig-Holstein', 88);
INSERT INTO `country_states` VALUES (94, 'DE', 'THE', 'Thüringen', 88);
INSERT INTO `country_states` VALUES (95, 'AT', 'WI', 'Wien', 16);
INSERT INTO `country_states` VALUES (96, 'AT', 'NO', 'Niederösterreich', 16);
INSERT INTO `country_states` VALUES (97, 'AT', 'OO', 'Oberösterreich', 16);
INSERT INTO `country_states` VALUES (98, 'AT', 'SB', 'Salzburg', 16);
INSERT INTO `country_states` VALUES (99, 'AT', 'KN', 'Kärnten', 16);
INSERT INTO `country_states` VALUES (100, 'AT', 'ST', 'Steiermark', 16);
INSERT INTO `country_states` VALUES (101, 'AT', 'TI', 'Tirol', 16);
INSERT INTO `country_states` VALUES (102, 'AT', 'BL', 'Burgenland', 16);
INSERT INTO `country_states` VALUES (103, 'AT', 'VB', 'Vorarlberg', 16);
INSERT INTO `country_states` VALUES (104, 'CH', 'AG', 'Aargau', 220);
INSERT INTO `country_states` VALUES (105, 'CH', 'AI', 'Appenzell Innerrhoden', 220);
INSERT INTO `country_states` VALUES (106, 'CH', 'AR', 'Appenzell Ausserrhoden', 220);
INSERT INTO `country_states` VALUES (107, 'CH', 'BE', 'Bern', 220);
INSERT INTO `country_states` VALUES (108, 'CH', 'BL', 'Basel-Landschaft', 220);
INSERT INTO `country_states` VALUES (109, 'CH', 'BS', 'Basel-Stadt', 220);
INSERT INTO `country_states` VALUES (110, 'CH', 'FR', 'Freiburg', 220);
INSERT INTO `country_states` VALUES (111, 'CH', 'GE', 'Genf', 220);
INSERT INTO `country_states` VALUES (112, 'CH', 'GL', 'Glarus', 220);
INSERT INTO `country_states` VALUES (113, 'CH', 'GR', 'Graubünden', 220);
INSERT INTO `country_states` VALUES (114, 'CH', 'JU', 'Jura', 220);
INSERT INTO `country_states` VALUES (115, 'CH', 'LU', 'Luzern', 220);
INSERT INTO `country_states` VALUES (116, 'CH', 'NE', 'Neuenburg', 220);
INSERT INTO `country_states` VALUES (117, 'CH', 'NW', 'Nidwalden', 220);
INSERT INTO `country_states` VALUES (118, 'CH', 'OW', 'Obwalden', 220);
INSERT INTO `country_states` VALUES (119, 'CH', 'SG', 'St. Gallen', 220);
INSERT INTO `country_states` VALUES (120, 'CH', 'SH', 'Schaffhausen', 220);
INSERT INTO `country_states` VALUES (121, 'CH', 'SO', 'Solothurn', 220);
INSERT INTO `country_states` VALUES (122, 'CH', 'SZ', 'Schwyz', 220);
INSERT INTO `country_states` VALUES (123, 'CH', 'TG', 'Thurgau', 220);
INSERT INTO `country_states` VALUES (124, 'CH', 'TI', 'Tessin', 220);
INSERT INTO `country_states` VALUES (125, 'CH', 'UR', 'Uri', 220);
INSERT INTO `country_states` VALUES (126, 'CH', 'VD', 'Waadt', 220);
INSERT INTO `country_states` VALUES (127, 'CH', 'VS', 'Wallis', 220);
INSERT INTO `country_states` VALUES (128, 'CH', 'ZG', 'Zug', 220);
INSERT INTO `country_states` VALUES (129, 'CH', 'ZH', 'Zürich', 220);
INSERT INTO `country_states` VALUES (130, 'ES', 'A Coruсa', 'A Coruña', 206);
INSERT INTO `country_states` VALUES (131, 'ES', 'Alava', 'Alava', 206);
INSERT INTO `country_states` VALUES (132, 'ES', 'Albacete', 'Albacete', 206);
INSERT INTO `country_states` VALUES (133, 'ES', 'Alicante', 'Alicante', 206);
INSERT INTO `country_states` VALUES (134, 'ES', 'Almeria', 'Almeria', 206);
INSERT INTO `country_states` VALUES (135, 'ES', 'Asturias', 'Asturias', 206);
INSERT INTO `country_states` VALUES (136, 'ES', 'Avila', 'Avila', 206);
INSERT INTO `country_states` VALUES (137, 'ES', 'Badajoz', 'Badajoz', 206);
INSERT INTO `country_states` VALUES (138, 'ES', 'Baleares', 'Baleares', 206);
INSERT INTO `country_states` VALUES (139, 'ES', 'Barcelona', 'Barcelona', 206);
INSERT INTO `country_states` VALUES (140, 'ES', 'Burgos', 'Burgos', 206);
INSERT INTO `country_states` VALUES (141, 'ES', 'Caceres', 'Caceres', 206);
INSERT INTO `country_states` VALUES (142, 'ES', 'Cadiz', 'Cadiz', 206);
INSERT INTO `country_states` VALUES (143, 'ES', 'Cantabria', 'Cantabria', 206);
INSERT INTO `country_states` VALUES (144, 'ES', 'Castellon', 'Castellon', 206);
INSERT INTO `country_states` VALUES (145, 'ES', 'Ceuta', 'Ceuta', 206);
INSERT INTO `country_states` VALUES (146, 'ES', 'Ciudad Real', 'Ciudad Real', 206);
INSERT INTO `country_states` VALUES (147, 'ES', 'Cordoba', 'Cordoba', 206);
INSERT INTO `country_states` VALUES (148, 'ES', 'Cuenca', 'Cuenca', 206);
INSERT INTO `country_states` VALUES (149, 'ES', 'Girona', 'Girona', 206);
INSERT INTO `country_states` VALUES (150, 'ES', 'Granada', 'Granada', 206);
INSERT INTO `country_states` VALUES (151, 'ES', 'Guadalajara', 'Guadalajara', 206);
INSERT INTO `country_states` VALUES (152, 'ES', 'Guipuzcoa', 'Guipuzcoa', 206);
INSERT INTO `country_states` VALUES (153, 'ES', 'Huelva', 'Huelva', 206);
INSERT INTO `country_states` VALUES (154, 'ES', 'Huesca', 'Huesca', 206);
INSERT INTO `country_states` VALUES (155, 'ES', 'Jaen', 'Jaen', 206);
INSERT INTO `country_states` VALUES (156, 'ES', 'La Rioja', 'La Rioja', 206);
INSERT INTO `country_states` VALUES (157, 'ES', 'Las Palmas', 'Las Palmas', 206);
INSERT INTO `country_states` VALUES (158, 'ES', 'Leon', 'Leon', 206);
INSERT INTO `country_states` VALUES (159, 'ES', 'Lleida', 'Lleida', 206);
INSERT INTO `country_states` VALUES (160, 'ES', 'Lugo', 'Lugo', 206);
INSERT INTO `country_states` VALUES (161, 'ES', 'Madrid', 'Madrid', 206);
INSERT INTO `country_states` VALUES (162, 'ES', 'Malaga', 'Malaga', 206);
INSERT INTO `country_states` VALUES (163, 'ES', 'Melilla', 'Melilla', 206);
INSERT INTO `country_states` VALUES (164, 'ES', 'Murcia', 'Murcia', 206);
INSERT INTO `country_states` VALUES (165, 'ES', 'Navarra', 'Navarra', 206);
INSERT INTO `country_states` VALUES (166, 'ES', 'Ourense', 'Ourense', 206);
INSERT INTO `country_states` VALUES (167, 'ES', 'Palencia', 'Palencia', 206);
INSERT INTO `country_states` VALUES (168, 'ES', 'Pontevedra', 'Pontevedra', 206);
INSERT INTO `country_states` VALUES (169, 'ES', 'Salamanca', 'Salamanca', 206);
INSERT INTO `country_states` VALUES (170, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife', 206);
INSERT INTO `country_states` VALUES (171, 'ES', 'Segovia', 'Segovia', 206);
INSERT INTO `country_states` VALUES (172, 'ES', 'Sevilla', 'Sevilla', 206);
INSERT INTO `country_states` VALUES (173, 'ES', 'Soria', 'Soria', 206);
INSERT INTO `country_states` VALUES (174, 'ES', 'Tarragona', 'Tarragona', 206);
INSERT INTO `country_states` VALUES (175, 'ES', 'Teruel', 'Teruel', 206);
INSERT INTO `country_states` VALUES (176, 'ES', 'Toledo', 'Toledo', 206);
INSERT INTO `country_states` VALUES (177, 'ES', 'Valencia', 'Valencia', 206);
INSERT INTO `country_states` VALUES (178, 'ES', 'Valladolid', 'Valladolid', 206);
INSERT INTO `country_states` VALUES (179, 'ES', 'Vizcaya', 'Vizcaya', 206);
INSERT INTO `country_states` VALUES (180, 'ES', 'Zamora', 'Zamora', 206);
INSERT INTO `country_states` VALUES (181, 'ES', 'Zaragoza', 'Zaragoza', 206);
INSERT INTO `country_states` VALUES (182, 'FR', '1', 'Ain', 81);
INSERT INTO `country_states` VALUES (183, 'FR', '2', 'Aisne', 81);
INSERT INTO `country_states` VALUES (184, 'FR', '3', 'Allier', 81);
INSERT INTO `country_states` VALUES (185, 'FR', '4', 'Alpes-de-Haute-Provence', 81);
INSERT INTO `country_states` VALUES (186, 'FR', '5', 'Hautes-Alpes', 81);
INSERT INTO `country_states` VALUES (187, 'FR', '6', 'Alpes-Maritimes', 81);
INSERT INTO `country_states` VALUES (188, 'FR', '7', 'Ardèche', 81);
INSERT INTO `country_states` VALUES (189, 'FR', '8', 'Ardennes', 81);
INSERT INTO `country_states` VALUES (190, 'FR', '9', 'Ariège', 81);
INSERT INTO `country_states` VALUES (191, 'FR', '10', 'Aube', 81);
INSERT INTO `country_states` VALUES (192, 'FR', '11', 'Aude', 81);
INSERT INTO `country_states` VALUES (193, 'FR', '12', 'Aveyron', 81);
INSERT INTO `country_states` VALUES (194, 'FR', '13', 'Bouches-du-Rhône', 81);
INSERT INTO `country_states` VALUES (195, 'FR', '14', 'Calvados', 81);
INSERT INTO `country_states` VALUES (196, 'FR', '15', 'Cantal', 81);
INSERT INTO `country_states` VALUES (197, 'FR', '16', 'Charente', 81);
INSERT INTO `country_states` VALUES (198, 'FR', '17', 'Charente-Maritime', 81);
INSERT INTO `country_states` VALUES (199, 'FR', '18', 'Cher', 81);
INSERT INTO `country_states` VALUES (200, 'FR', '19', 'Corrèze', 81);
INSERT INTO `country_states` VALUES (201, 'FR', '2A', 'Corse-du-Sud', 81);
INSERT INTO `country_states` VALUES (202, 'FR', '2B', 'Haute-Corse', 81);
INSERT INTO `country_states` VALUES (203, 'FR', '21', 'Côte-d\'Or', 81);
INSERT INTO `country_states` VALUES (204, 'FR', '22', 'Côtes-d\'Armor', 81);
INSERT INTO `country_states` VALUES (205, 'FR', '23', 'Creuse', 81);
INSERT INTO `country_states` VALUES (206, 'FR', '24', 'Dordogne', 81);
INSERT INTO `country_states` VALUES (207, 'FR', '25', 'Doubs', 81);
INSERT INTO `country_states` VALUES (208, 'FR', '26', 'Drôme', 81);
INSERT INTO `country_states` VALUES (209, 'FR', '27', 'Eure', 81);
INSERT INTO `country_states` VALUES (210, 'FR', '28', 'Eure-et-Loir', 81);
INSERT INTO `country_states` VALUES (211, 'FR', '29', 'Finistère', 81);
INSERT INTO `country_states` VALUES (212, 'FR', '30', 'Gard', 81);
INSERT INTO `country_states` VALUES (213, 'FR', '31', 'Haute-Garonne', 81);
INSERT INTO `country_states` VALUES (214, 'FR', '32', 'Gers', 81);
INSERT INTO `country_states` VALUES (215, 'FR', '33', 'Gironde', 81);
INSERT INTO `country_states` VALUES (216, 'FR', '34', 'Hérault', 81);
INSERT INTO `country_states` VALUES (217, 'FR', '35', 'Ille-et-Vilaine', 81);
INSERT INTO `country_states` VALUES (218, 'FR', '36', 'Indre', 81);
INSERT INTO `country_states` VALUES (219, 'FR', '37', 'Indre-et-Loire', 81);
INSERT INTO `country_states` VALUES (220, 'FR', '38', 'Isère', 81);
INSERT INTO `country_states` VALUES (221, 'FR', '39', 'Jura', 81);
INSERT INTO `country_states` VALUES (222, 'FR', '40', 'Landes', 81);
INSERT INTO `country_states` VALUES (223, 'FR', '41', 'Loir-et-Cher', 81);
INSERT INTO `country_states` VALUES (224, 'FR', '42', 'Loire', 81);
INSERT INTO `country_states` VALUES (225, 'FR', '43', 'Haute-Loire', 81);
INSERT INTO `country_states` VALUES (226, 'FR', '44', 'Loire-Atlantique', 81);
INSERT INTO `country_states` VALUES (227, 'FR', '45', 'Loiret', 81);
INSERT INTO `country_states` VALUES (228, 'FR', '46', 'Lot', 81);
INSERT INTO `country_states` VALUES (229, 'FR', '47', 'Lot-et-Garonne', 81);
INSERT INTO `country_states` VALUES (230, 'FR', '48', 'Lozère', 81);
INSERT INTO `country_states` VALUES (231, 'FR', '49', 'Maine-et-Loire', 81);
INSERT INTO `country_states` VALUES (232, 'FR', '50', 'Manche', 81);
INSERT INTO `country_states` VALUES (233, 'FR', '51', 'Marne', 81);
INSERT INTO `country_states` VALUES (234, 'FR', '52', 'Haute-Marne', 81);
INSERT INTO `country_states` VALUES (235, 'FR', '53', 'Mayenne', 81);
INSERT INTO `country_states` VALUES (236, 'FR', '54', 'Meurthe-et-Moselle', 81);
INSERT INTO `country_states` VALUES (237, 'FR', '55', 'Meuse', 81);
INSERT INTO `country_states` VALUES (238, 'FR', '56', 'Morbihan', 81);
INSERT INTO `country_states` VALUES (239, 'FR', '57', 'Moselle', 81);
INSERT INTO `country_states` VALUES (240, 'FR', '58', 'Nièvre', 81);
INSERT INTO `country_states` VALUES (241, 'FR', '59', 'Nord', 81);
INSERT INTO `country_states` VALUES (242, 'FR', '60', 'Oise', 81);
INSERT INTO `country_states` VALUES (243, 'FR', '61', 'Orne', 81);
INSERT INTO `country_states` VALUES (244, 'FR', '62', 'Pas-de-Calais', 81);
INSERT INTO `country_states` VALUES (245, 'FR', '63', 'Puy-de-Dôme', 81);
INSERT INTO `country_states` VALUES (246, 'FR', '64', 'Pyrénées-Atlantiques', 81);
INSERT INTO `country_states` VALUES (247, 'FR', '65', 'Hautes-Pyrénées', 81);
INSERT INTO `country_states` VALUES (248, 'FR', '66', 'Pyrénées-Orientales', 81);
INSERT INTO `country_states` VALUES (249, 'FR', '67', 'Bas-Rhin', 81);
INSERT INTO `country_states` VALUES (250, 'FR', '68', 'Haut-Rhin', 81);
INSERT INTO `country_states` VALUES (251, 'FR', '69', 'Rhône', 81);
INSERT INTO `country_states` VALUES (252, 'FR', '70', 'Haute-Saône', 81);
INSERT INTO `country_states` VALUES (253, 'FR', '71', 'Saône-et-Loire', 81);
INSERT INTO `country_states` VALUES (254, 'FR', '72', 'Sarthe', 81);
INSERT INTO `country_states` VALUES (255, 'FR', '73', 'Savoie', 81);
INSERT INTO `country_states` VALUES (256, 'FR', '74', 'Haute-Savoie', 81);
INSERT INTO `country_states` VALUES (257, 'FR', '75', 'Paris', 81);
INSERT INTO `country_states` VALUES (258, 'FR', '76', 'Seine-Maritime', 81);
INSERT INTO `country_states` VALUES (259, 'FR', '77', 'Seine-et-Marne', 81);
INSERT INTO `country_states` VALUES (260, 'FR', '78', 'Yvelines', 81);
INSERT INTO `country_states` VALUES (261, 'FR', '79', 'Deux-Sèvres', 81);
INSERT INTO `country_states` VALUES (262, 'FR', '80', 'Somme', 81);
INSERT INTO `country_states` VALUES (263, 'FR', '81', 'Tarn', 81);
INSERT INTO `country_states` VALUES (264, 'FR', '82', 'Tarn-et-Garonne', 81);
INSERT INTO `country_states` VALUES (265, 'FR', '83', 'Var', 81);
INSERT INTO `country_states` VALUES (266, 'FR', '84', 'Vaucluse', 81);
INSERT INTO `country_states` VALUES (267, 'FR', '85', 'Vendée', 81);
INSERT INTO `country_states` VALUES (268, 'FR', '86', 'Vienne', 81);
INSERT INTO `country_states` VALUES (269, 'FR', '87', 'Haute-Vienne', 81);
INSERT INTO `country_states` VALUES (270, 'FR', '88', 'Vosges', 81);
INSERT INTO `country_states` VALUES (271, 'FR', '89', 'Yonne', 81);
INSERT INTO `country_states` VALUES (272, 'FR', '90', 'Territoire-de-Belfort', 81);
INSERT INTO `country_states` VALUES (273, 'FR', '91', 'Essonne', 81);
INSERT INTO `country_states` VALUES (274, 'FR', '92', 'Hauts-de-Seine', 81);
INSERT INTO `country_states` VALUES (275, 'FR', '93', 'Seine-Saint-Denis', 81);
INSERT INTO `country_states` VALUES (276, 'FR', '94', 'Val-de-Marne', 81);
INSERT INTO `country_states` VALUES (277, 'FR', '95', 'Val-d\'Oise', 81);
INSERT INTO `country_states` VALUES (278, 'RO', 'AB', 'Alba', 185);
INSERT INTO `country_states` VALUES (279, 'RO', 'AR', 'Arad', 185);
INSERT INTO `country_states` VALUES (280, 'RO', 'AG', 'Argeş', 185);
INSERT INTO `country_states` VALUES (281, 'RO', 'BC', 'Bacău', 185);
INSERT INTO `country_states` VALUES (282, 'RO', 'BH', 'Bihor', 185);
INSERT INTO `country_states` VALUES (283, 'RO', 'BN', 'Bistriţa-Năsăud', 185);
INSERT INTO `country_states` VALUES (284, 'RO', 'BT', 'Botoşani', 185);
INSERT INTO `country_states` VALUES (285, 'RO', 'BV', 'Braşov', 185);
INSERT INTO `country_states` VALUES (286, 'RO', 'BR', 'Brăila', 185);
INSERT INTO `country_states` VALUES (287, 'RO', 'B', 'Bucureşti', 185);
INSERT INTO `country_states` VALUES (288, 'RO', 'BZ', 'Buzău', 185);
INSERT INTO `country_states` VALUES (289, 'RO', 'CS', 'Caraş-Severin', 185);
INSERT INTO `country_states` VALUES (290, 'RO', 'CL', 'Călăraşi', 185);
INSERT INTO `country_states` VALUES (291, 'RO', 'CJ', 'Cluj', 185);
INSERT INTO `country_states` VALUES (292, 'RO', 'CT', 'Constanţa', 185);
INSERT INTO `country_states` VALUES (293, 'RO', 'CV', 'Covasna', 185);
INSERT INTO `country_states` VALUES (294, 'RO', 'DB', 'Dâmboviţa', 185);
INSERT INTO `country_states` VALUES (295, 'RO', 'DJ', 'Dolj', 185);
INSERT INTO `country_states` VALUES (296, 'RO', 'GL', 'Galaţi', 185);
INSERT INTO `country_states` VALUES (297, 'RO', 'GR', 'Giurgiu', 185);
INSERT INTO `country_states` VALUES (298, 'RO', 'GJ', 'Gorj', 185);
INSERT INTO `country_states` VALUES (299, 'RO', 'HR', 'Harghita', 185);
INSERT INTO `country_states` VALUES (300, 'RO', 'HD', 'Hunedoara', 185);
INSERT INTO `country_states` VALUES (301, 'RO', 'IL', 'Ialomiţa', 185);
INSERT INTO `country_states` VALUES (302, 'RO', 'IS', 'Iaşi', 185);
INSERT INTO `country_states` VALUES (303, 'RO', 'IF', 'Ilfov', 185);
INSERT INTO `country_states` VALUES (304, 'RO', 'MM', 'Maramureş', 185);
INSERT INTO `country_states` VALUES (305, 'RO', 'MH', 'Mehedinţi', 185);
INSERT INTO `country_states` VALUES (306, 'RO', 'MS', 'Mureş', 185);
INSERT INTO `country_states` VALUES (307, 'RO', 'NT', 'Neamţ', 185);
INSERT INTO `country_states` VALUES (308, 'RO', 'OT', 'Olt', 185);
INSERT INTO `country_states` VALUES (309, 'RO', 'PH', 'Prahova', 185);
INSERT INTO `country_states` VALUES (310, 'RO', 'SM', 'Satu-Mare', 185);
INSERT INTO `country_states` VALUES (311, 'RO', 'SJ', 'Sălaj', 185);
INSERT INTO `country_states` VALUES (312, 'RO', 'SB', 'Sibiu', 185);
INSERT INTO `country_states` VALUES (313, 'RO', 'SV', 'Suceava', 185);
INSERT INTO `country_states` VALUES (314, 'RO', 'TR', 'Teleorman', 185);
INSERT INTO `country_states` VALUES (315, 'RO', 'TM', 'Timiş', 185);
INSERT INTO `country_states` VALUES (316, 'RO', 'TL', 'Tulcea', 185);
INSERT INTO `country_states` VALUES (317, 'RO', 'VS', 'Vaslui', 185);
INSERT INTO `country_states` VALUES (318, 'RO', 'VL', 'Vâlcea', 185);
INSERT INTO `country_states` VALUES (319, 'RO', 'VN', 'Vrancea', 185);
INSERT INTO `country_states` VALUES (320, 'FI', 'Lappi', 'Lappi', 80);
INSERT INTO `country_states` VALUES (321, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa', 80);
INSERT INTO `country_states` VALUES (322, 'FI', 'Kainuu', 'Kainuu', 80);
INSERT INTO `country_states` VALUES (323, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala', 80);
INSERT INTO `country_states` VALUES (324, 'FI', 'Pohjois-Savo', 'Pohjois-Savo', 80);
INSERT INTO `country_states` VALUES (325, 'FI', 'Etelä-Savo', 'Etelä-Savo', 80);
INSERT INTO `country_states` VALUES (326, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa', 80);
INSERT INTO `country_states` VALUES (327, 'FI', 'Pohjanmaa', 'Pohjanmaa', 80);
INSERT INTO `country_states` VALUES (328, 'FI', 'Pirkanmaa', 'Pirkanmaa', 80);
INSERT INTO `country_states` VALUES (329, 'FI', 'Satakunta', 'Satakunta', 80);
INSERT INTO `country_states` VALUES (330, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa', 80);
INSERT INTO `country_states` VALUES (331, 'FI', 'Keski-Suomi', 'Keski-Suomi', 80);
INSERT INTO `country_states` VALUES (332, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi', 80);
INSERT INTO `country_states` VALUES (333, 'FI', 'Etelä-Karjala', 'Etelä-Karjala', 80);
INSERT INTO `country_states` VALUES (334, 'FI', 'Päijät-Häme', 'Päijät-Häme', 80);
INSERT INTO `country_states` VALUES (335, 'FI', 'Kanta-Häme', 'Kanta-Häme', 80);
INSERT INTO `country_states` VALUES (336, 'FI', 'Uusimaa', 'Uusimaa', 80);
INSERT INTO `country_states` VALUES (337, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa', 80);
INSERT INTO `country_states` VALUES (338, 'FI', 'Kymenlaakso', 'Kymenlaakso', 80);
INSERT INTO `country_states` VALUES (339, 'FI', 'Ahvenanmaa', 'Ahvenanmaa', 80);
INSERT INTO `country_states` VALUES (340, 'EE', 'EE-37', 'Harjumaa', 74);
INSERT INTO `country_states` VALUES (341, 'EE', 'EE-39', 'Hiiumaa', 74);
INSERT INTO `country_states` VALUES (342, 'EE', 'EE-44', 'Ida-Virumaa', 74);
INSERT INTO `country_states` VALUES (343, 'EE', 'EE-49', 'Jõgevamaa', 74);
INSERT INTO `country_states` VALUES (344, 'EE', 'EE-51', 'Järvamaa', 74);
INSERT INTO `country_states` VALUES (345, 'EE', 'EE-57', 'Läänemaa', 74);
INSERT INTO `country_states` VALUES (346, 'EE', 'EE-59', 'Lääne-Virumaa', 74);
INSERT INTO `country_states` VALUES (347, 'EE', 'EE-65', 'Põlvamaa', 74);
INSERT INTO `country_states` VALUES (348, 'EE', 'EE-67', 'Pärnumaa', 74);
INSERT INTO `country_states` VALUES (349, 'EE', 'EE-70', 'Raplamaa', 74);
INSERT INTO `country_states` VALUES (350, 'EE', 'EE-74', 'Saaremaa', 74);
INSERT INTO `country_states` VALUES (351, 'EE', 'EE-78', 'Tartumaa', 74);
INSERT INTO `country_states` VALUES (352, 'EE', 'EE-82', 'Valgamaa', 74);
INSERT INTO `country_states` VALUES (353, 'EE', 'EE-84', 'Viljandimaa', 74);
INSERT INTO `country_states` VALUES (354, 'EE', 'EE-86', 'Võrumaa', 74);
INSERT INTO `country_states` VALUES (355, 'LV', 'LV-DGV', 'Daugavpils', 125);
INSERT INTO `country_states` VALUES (356, 'LV', 'LV-JEL', 'Jelgava', 125);
INSERT INTO `country_states` VALUES (357, 'LV', 'Jēkabpils', 'Jēkabpils', 125);
INSERT INTO `country_states` VALUES (358, 'LV', 'LV-JUR', 'Jūrmala', 125);
INSERT INTO `country_states` VALUES (359, 'LV', 'LV-LPX', 'Liepāja', 125);
INSERT INTO `country_states` VALUES (360, 'LV', 'LV-LE', 'Liepājas novads', 125);
INSERT INTO `country_states` VALUES (361, 'LV', 'LV-REZ', 'Rēzekne', 125);
INSERT INTO `country_states` VALUES (362, 'LV', 'LV-RIX', 'Rīga', 125);
INSERT INTO `country_states` VALUES (363, 'LV', 'LV-RI', 'Rīgas novads', 125);
INSERT INTO `country_states` VALUES (364, 'LV', 'Valmiera', 'Valmiera', 125);
INSERT INTO `country_states` VALUES (365, 'LV', 'LV-VEN', 'Ventspils', 125);
INSERT INTO `country_states` VALUES (366, 'LV', 'Aglonas novads', 'Aglonas novads', 125);
INSERT INTO `country_states` VALUES (367, 'LV', 'LV-AI', 'Aizkraukles novads', 125);
INSERT INTO `country_states` VALUES (368, 'LV', 'Aizputes novads', 'Aizputes novads', 125);
INSERT INTO `country_states` VALUES (369, 'LV', 'Aknīstes novads', 'Aknīstes novads', 125);
INSERT INTO `country_states` VALUES (370, 'LV', 'Alojas novads', 'Alojas novads', 125);
INSERT INTO `country_states` VALUES (371, 'LV', 'Alsungas novads', 'Alsungas novads', 125);
INSERT INTO `country_states` VALUES (372, 'LV', 'LV-AL', 'Alūksnes novads', 125);
INSERT INTO `country_states` VALUES (373, 'LV', 'Amatas novads', 'Amatas novads', 125);
INSERT INTO `country_states` VALUES (374, 'LV', 'Apes novads', 'Apes novads', 125);
INSERT INTO `country_states` VALUES (375, 'LV', 'Auces novads', 'Auces novads', 125);
INSERT INTO `country_states` VALUES (376, 'LV', 'Babītes novads', 'Babītes novads', 125);
INSERT INTO `country_states` VALUES (377, 'LV', 'Baldones novads', 'Baldones novads', 125);
INSERT INTO `country_states` VALUES (378, 'LV', 'Baltinavas novads', 'Baltinavas novads', 125);
INSERT INTO `country_states` VALUES (379, 'LV', 'LV-BL', 'Balvu novads', 125);
INSERT INTO `country_states` VALUES (380, 'LV', 'LV-BU', 'Bauskas novads', 125);
INSERT INTO `country_states` VALUES (381, 'LV', 'Beverīnas novads', 'Beverīnas novads', 125);
INSERT INTO `country_states` VALUES (382, 'LV', 'Brocēnu novads', 'Brocēnu novads', 125);
INSERT INTO `country_states` VALUES (383, 'LV', 'Burtnieku novads', 'Burtnieku novads', 125);
INSERT INTO `country_states` VALUES (384, 'LV', 'Carnikavas novads', 'Carnikavas novads', 125);
INSERT INTO `country_states` VALUES (385, 'LV', 'Cesvaines novads', 'Cesvaines novads', 125);
INSERT INTO `country_states` VALUES (386, 'LV', 'Ciblas novads', 'Ciblas novads', 125);
INSERT INTO `country_states` VALUES (387, 'LV', 'LV-CE', 'Cēsu novads', 125);
INSERT INTO `country_states` VALUES (388, 'LV', 'Dagdas novads', 'Dagdas novads', 125);
INSERT INTO `country_states` VALUES (389, 'LV', 'LV-DA', 'Daugavpils novads', 125);
INSERT INTO `country_states` VALUES (390, 'LV', 'LV-DO', 'Dobeles novads', 125);
INSERT INTO `country_states` VALUES (391, 'LV', 'Dundagas novads', 'Dundagas novads', 125);
INSERT INTO `country_states` VALUES (392, 'LV', 'Durbes novads', 'Durbes novads', 125);
INSERT INTO `country_states` VALUES (393, 'LV', 'Engures novads', 'Engures novads', 125);
INSERT INTO `country_states` VALUES (394, 'LV', 'Garkalnes novads', 'Garkalnes novads', 125);
INSERT INTO `country_states` VALUES (395, 'LV', 'Grobiņas novads', 'Grobiņas novads', 125);
INSERT INTO `country_states` VALUES (396, 'LV', 'LV-GU', 'Gulbenes novads', 125);
INSERT INTO `country_states` VALUES (397, 'LV', 'Iecavas novads', 'Iecavas novads', 125);
INSERT INTO `country_states` VALUES (398, 'LV', 'Ikšķiles novads', 'Ikšķiles novads', 125);
INSERT INTO `country_states` VALUES (399, 'LV', 'Ilūkstes novads', 'Ilūkstes novads', 125);
INSERT INTO `country_states` VALUES (400, 'LV', 'Inčukalna novads', 'Inčukalna novads', 125);
INSERT INTO `country_states` VALUES (401, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads', 125);
INSERT INTO `country_states` VALUES (402, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads', 125);
INSERT INTO `country_states` VALUES (403, 'LV', 'Jaunpils novads', 'Jaunpils novads', 125);
INSERT INTO `country_states` VALUES (404, 'LV', 'LV-JL', 'Jelgavas novads', 125);
INSERT INTO `country_states` VALUES (405, 'LV', 'LV-JK', 'Jēkabpils novads', 125);
INSERT INTO `country_states` VALUES (406, 'LV', 'Kandavas novads', 'Kandavas novads', 125);
INSERT INTO `country_states` VALUES (407, 'LV', 'Kokneses novads', 'Kokneses novads', 125);
INSERT INTO `country_states` VALUES (408, 'LV', 'Krimuldas novads', 'Krimuldas novads', 125);
INSERT INTO `country_states` VALUES (409, 'LV', 'Krustpils novads', 'Krustpils novads', 125);
INSERT INTO `country_states` VALUES (410, 'LV', 'LV-KR', 'Krāslavas novads', 125);
INSERT INTO `country_states` VALUES (411, 'LV', 'LV-KU', 'Kuldīgas novads', 125);
INSERT INTO `country_states` VALUES (412, 'LV', 'Kārsavas novads', 'Kārsavas novads', 125);
INSERT INTO `country_states` VALUES (413, 'LV', 'Lielvārdes novads', 'Lielvārdes novads', 125);
INSERT INTO `country_states` VALUES (414, 'LV', 'LV-LM', 'Limbažu novads', 125);
INSERT INTO `country_states` VALUES (415, 'LV', 'Lubānas novads', 'Lubānas novads', 125);
INSERT INTO `country_states` VALUES (416, 'LV', 'LV-LU', 'Ludzas novads', 125);
INSERT INTO `country_states` VALUES (417, 'LV', 'Līgatnes novads', 'Līgatnes novads', 125);
INSERT INTO `country_states` VALUES (418, 'LV', 'Līvānu novads', 'Līvānu novads', 125);
INSERT INTO `country_states` VALUES (419, 'LV', 'LV-MA', 'Madonas novads', 125);
INSERT INTO `country_states` VALUES (420, 'LV', 'Mazsalacas novads', 'Mazsalacas novads', 125);
INSERT INTO `country_states` VALUES (421, 'LV', 'Mālpils novads', 'Mālpils novads', 125);
INSERT INTO `country_states` VALUES (422, 'LV', 'Mārupes novads', 'Mārupes novads', 125);
INSERT INTO `country_states` VALUES (423, 'LV', 'Naukšēnu novads', 'Naukšēnu novads', 125);
INSERT INTO `country_states` VALUES (424, 'LV', 'Neretas novads', 'Neretas novads', 125);
INSERT INTO `country_states` VALUES (425, 'LV', 'Nīcas novads', 'Nīcas novads', 125);
INSERT INTO `country_states` VALUES (426, 'LV', 'LV-OG', 'Ogres novads', 125);
INSERT INTO `country_states` VALUES (427, 'LV', 'Olaines novads', 'Olaines novads', 125);
INSERT INTO `country_states` VALUES (428, 'LV', 'Ozolnieku novads', 'Ozolnieku novads', 125);
INSERT INTO `country_states` VALUES (429, 'LV', 'LV-PR', 'Preiļu novads', 125);
INSERT INTO `country_states` VALUES (430, 'LV', 'Priekules novads', 'Priekules novads', 125);
INSERT INTO `country_states` VALUES (431, 'LV', 'Priekuļu novads', 'Priekuļu novads', 125);
INSERT INTO `country_states` VALUES (432, 'LV', 'Pārgaujas novads', 'Pārgaujas novads', 125);
INSERT INTO `country_states` VALUES (433, 'LV', 'Pāvilostas novads', 'Pāvilostas novads', 125);
INSERT INTO `country_states` VALUES (434, 'LV', 'Pļaviņu novads', 'Pļaviņu novads', 125);
INSERT INTO `country_states` VALUES (435, 'LV', 'Raunas novads', 'Raunas novads', 125);
INSERT INTO `country_states` VALUES (436, 'LV', 'Riebiņu novads', 'Riebiņu novads', 125);
INSERT INTO `country_states` VALUES (437, 'LV', 'Rojas novads', 'Rojas novads', 125);
INSERT INTO `country_states` VALUES (438, 'LV', 'Ropažu novads', 'Ropažu novads', 125);
INSERT INTO `country_states` VALUES (439, 'LV', 'Rucavas novads', 'Rucavas novads', 125);
INSERT INTO `country_states` VALUES (440, 'LV', 'Rugāju novads', 'Rugāju novads', 125);
INSERT INTO `country_states` VALUES (441, 'LV', 'Rundāles novads', 'Rundāles novads', 125);
INSERT INTO `country_states` VALUES (442, 'LV', 'LV-RE', 'Rēzeknes novads', 125);
INSERT INTO `country_states` VALUES (443, 'LV', 'Rūjienas novads', 'Rūjienas novads', 125);
INSERT INTO `country_states` VALUES (444, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads', 125);
INSERT INTO `country_states` VALUES (445, 'LV', 'Salas novads', 'Salas novads', 125);
INSERT INTO `country_states` VALUES (446, 'LV', 'Salaspils novads', 'Salaspils novads', 125);
INSERT INTO `country_states` VALUES (447, 'LV', 'LV-SA', 'Saldus novads', 125);
INSERT INTO `country_states` VALUES (448, 'LV', 'Saulkrastu novads', 'Saulkrastu novads', 125);
INSERT INTO `country_states` VALUES (449, 'LV', 'Siguldas novads', 'Siguldas novads', 125);
INSERT INTO `country_states` VALUES (450, 'LV', 'Skrundas novads', 'Skrundas novads', 125);
INSERT INTO `country_states` VALUES (451, 'LV', 'Skrīveru novads', 'Skrīveru novads', 125);
INSERT INTO `country_states` VALUES (452, 'LV', 'Smiltenes novads', 'Smiltenes novads', 125);
INSERT INTO `country_states` VALUES (453, 'LV', 'Stopiņu novads', 'Stopiņu novads', 125);
INSERT INTO `country_states` VALUES (454, 'LV', 'Strenču novads', 'Strenču novads', 125);
INSERT INTO `country_states` VALUES (455, 'LV', 'Sējas novads', 'Sējas novads', 125);
INSERT INTO `country_states` VALUES (456, 'LV', 'LV-TA', 'Talsu novads', 125);
INSERT INTO `country_states` VALUES (457, 'LV', 'LV-TU', 'Tukuma novads', 125);
INSERT INTO `country_states` VALUES (458, 'LV', 'Tērvetes novads', 'Tērvetes novads', 125);
INSERT INTO `country_states` VALUES (459, 'LV', 'Vaiņodes novads', 'Vaiņodes novads', 125);
INSERT INTO `country_states` VALUES (460, 'LV', 'LV-VK', 'Valkas novads', 125);
INSERT INTO `country_states` VALUES (461, 'LV', 'LV-VM', 'Valmieras novads', 125);
INSERT INTO `country_states` VALUES (462, 'LV', 'Varakļānu novads', 'Varakļānu novads', 125);
INSERT INTO `country_states` VALUES (463, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads', 125);
INSERT INTO `country_states` VALUES (464, 'LV', 'Vecumnieku novads', 'Vecumnieku novads', 125);
INSERT INTO `country_states` VALUES (465, 'LV', 'LV-VE', 'Ventspils novads', 125);
INSERT INTO `country_states` VALUES (466, 'LV', 'Viesītes novads', 'Viesītes novads', 125);
INSERT INTO `country_states` VALUES (467, 'LV', 'Viļakas novads', 'Viļakas novads', 125);
INSERT INTO `country_states` VALUES (468, 'LV', 'Viļānu novads', 'Viļānu novads', 125);
INSERT INTO `country_states` VALUES (469, 'LV', 'Vārkavas novads', 'Vārkavas novads', 125);
INSERT INTO `country_states` VALUES (470, 'LV', 'Zilupes novads', 'Zilupes novads', 125);
INSERT INTO `country_states` VALUES (471, 'LV', 'Ādažu novads', 'Ādažu novads', 125);
INSERT INTO `country_states` VALUES (472, 'LV', 'Ērgļu novads', 'Ērgļu novads', 125);
INSERT INTO `country_states` VALUES (473, 'LV', 'Ķeguma novads', 'Ķeguma novads', 125);
INSERT INTO `country_states` VALUES (474, 'LV', 'Ķekavas novads', 'Ķekavas novads', 125);
INSERT INTO `country_states` VALUES (475, 'LT', 'LT-AL', 'Alytaus Apskritis', 131);
INSERT INTO `country_states` VALUES (476, 'LT', 'LT-KU', 'Kauno Apskritis', 131);
INSERT INTO `country_states` VALUES (477, 'LT', 'LT-KL', 'Klaipėdos Apskritis', 131);
INSERT INTO `country_states` VALUES (478, 'LT', 'LT-MR', 'Marijampolės Apskritis', 131);
INSERT INTO `country_states` VALUES (479, 'LT', 'LT-PN', 'Panevėžio Apskritis', 131);
INSERT INTO `country_states` VALUES (480, 'LT', 'LT-SA', 'Šiaulių Apskritis', 131);
INSERT INTO `country_states` VALUES (481, 'LT', 'LT-TA', 'Tauragės Apskritis', 131);
INSERT INTO `country_states` VALUES (482, 'LT', 'LT-TE', 'Telšių Apskritis', 131);
INSERT INTO `country_states` VALUES (483, 'LT', 'LT-UT', 'Utenos Apskritis', 131);
INSERT INTO `country_states` VALUES (484, 'LT', 'LT-VL', 'Vilniaus Apskritis', 131);
INSERT INTO `country_states` VALUES (485, 'BR', 'AC', 'Acre', 31);
INSERT INTO `country_states` VALUES (486, 'BR', 'AL', 'Alagoas', 31);
INSERT INTO `country_states` VALUES (487, 'BR', 'AP', 'Amapá', 31);
INSERT INTO `country_states` VALUES (488, 'BR', 'AM', 'Amazonas', 31);
INSERT INTO `country_states` VALUES (489, 'BR', 'BA', 'Bahia', 31);
INSERT INTO `country_states` VALUES (490, 'BR', 'CE', 'Ceará', 31);
INSERT INTO `country_states` VALUES (491, 'BR', 'ES', 'Espírito Santo', 31);
INSERT INTO `country_states` VALUES (492, 'BR', 'GO', 'Goiás', 31);
INSERT INTO `country_states` VALUES (493, 'BR', 'MA', 'Maranhão', 31);
INSERT INTO `country_states` VALUES (494, 'BR', 'MT', 'Mato Grosso', 31);
INSERT INTO `country_states` VALUES (495, 'BR', 'MS', 'Mato Grosso do Sul', 31);
INSERT INTO `country_states` VALUES (496, 'BR', 'MG', 'Minas Gerais', 31);
INSERT INTO `country_states` VALUES (497, 'BR', 'PA', 'Pará', 31);
INSERT INTO `country_states` VALUES (498, 'BR', 'PB', 'Paraíba', 31);
INSERT INTO `country_states` VALUES (499, 'BR', 'PR', 'Paraná', 31);
INSERT INTO `country_states` VALUES (500, 'BR', 'PE', 'Pernambuco', 31);
INSERT INTO `country_states` VALUES (501, 'BR', 'PI', 'Piauí', 31);
INSERT INTO `country_states` VALUES (502, 'BR', 'RJ', 'Rio de Janeiro', 31);
INSERT INTO `country_states` VALUES (503, 'BR', 'RN', 'Rio Grande do Norte', 31);
INSERT INTO `country_states` VALUES (504, 'BR', 'RS', 'Rio Grande do Sul', 31);
INSERT INTO `country_states` VALUES (505, 'BR', 'RO', 'Rondônia', 31);
INSERT INTO `country_states` VALUES (506, 'BR', 'RR', 'Roraima', 31);
INSERT INTO `country_states` VALUES (507, 'BR', 'SC', 'Santa Catarina', 31);
INSERT INTO `country_states` VALUES (508, 'BR', 'SP', 'São Paulo', 31);
INSERT INTO `country_states` VALUES (509, 'BR', 'SE', 'Sergipe', 31);
INSERT INTO `country_states` VALUES (510, 'BR', 'TO', 'Tocantins', 31);
INSERT INTO `country_states` VALUES (511, 'BR', 'DF', 'Distrito Federal', 31);
INSERT INTO `country_states` VALUES (512, 'HR', 'HR-01', 'Zagrebačka županija', 59);
INSERT INTO `country_states` VALUES (513, 'HR', 'HR-02', 'Krapinsko-zagorska županija', 59);
INSERT INTO `country_states` VALUES (514, 'HR', 'HR-03', 'Sisačko-moslavačka županija', 59);
INSERT INTO `country_states` VALUES (515, 'HR', 'HR-04', 'Karlovačka županija', 59);
INSERT INTO `country_states` VALUES (516, 'HR', 'HR-05', 'Varaždinska županija', 59);
INSERT INTO `country_states` VALUES (517, 'HR', 'HR-06', 'Koprivničko-križevačka županija', 59);
INSERT INTO `country_states` VALUES (518, 'HR', 'HR-07', 'Bjelovarsko-bilogorska županija', 59);
INSERT INTO `country_states` VALUES (519, 'HR', 'HR-08', 'Primorsko-goranska županija', 59);
INSERT INTO `country_states` VALUES (520, 'HR', 'HR-09', 'Ličko-senjska županija', 59);
INSERT INTO `country_states` VALUES (521, 'HR', 'HR-10', 'Virovitičko-podravska županija', 59);
INSERT INTO `country_states` VALUES (522, 'HR', 'HR-11', 'Požeško-slavonska županija', 59);
INSERT INTO `country_states` VALUES (523, 'HR', 'HR-12', 'Brodsko-posavska županija', 59);
INSERT INTO `country_states` VALUES (524, 'HR', 'HR-13', 'Zadarska županija', 59);
INSERT INTO `country_states` VALUES (525, 'HR', 'HR-14', 'Osječko-baranjska županija', 59);
INSERT INTO `country_states` VALUES (526, 'HR', 'HR-15', 'Šibensko-kninska županija', 59);
INSERT INTO `country_states` VALUES (527, 'HR', 'HR-16', 'Vukovarsko-srijemska županija', 59);
INSERT INTO `country_states` VALUES (528, 'HR', 'HR-17', 'Splitsko-dalmatinska županija', 59);
INSERT INTO `country_states` VALUES (529, 'HR', 'HR-18', 'Istarska županija', 59);
INSERT INTO `country_states` VALUES (530, 'HR', 'HR-19', 'Dubrovačko-neretvanska županija', 59);
INSERT INTO `country_states` VALUES (531, 'HR', 'HR-20', 'Međimurska županija', 59);
INSERT INTO `country_states` VALUES (532, 'HR', 'HR-21', 'Grad Zagreb', 59);
INSERT INTO `country_states` VALUES (533, 'IN', 'AN', 'Andaman and Nicobar Islands', 106);
INSERT INTO `country_states` VALUES (534, 'IN', 'AP', 'Andhra Pradesh', 106);
INSERT INTO `country_states` VALUES (535, 'IN', 'AR', 'Arunachal Pradesh', 106);
INSERT INTO `country_states` VALUES (536, 'IN', 'AS', 'Assam', 106);
INSERT INTO `country_states` VALUES (537, 'IN', 'BR', 'Bihar', 106);
INSERT INTO `country_states` VALUES (538, 'IN', 'CH', 'Chandigarh', 106);
INSERT INTO `country_states` VALUES (539, 'IN', 'CT', 'Chhattisgarh', 106);
INSERT INTO `country_states` VALUES (540, 'IN', 'DN', 'Dadra and Nagar Haveli', 106);
INSERT INTO `country_states` VALUES (541, 'IN', 'DD', 'Daman and Diu', 106);
INSERT INTO `country_states` VALUES (542, 'IN', 'DL', 'Delhi', 106);
INSERT INTO `country_states` VALUES (543, 'IN', 'GA', 'Goa', 106);
INSERT INTO `country_states` VALUES (544, 'IN', 'GJ', 'Gujarat', 106);
INSERT INTO `country_states` VALUES (545, 'IN', 'HR', 'Haryana', 106);
INSERT INTO `country_states` VALUES (546, 'IN', 'HP', 'Himachal Pradesh', 106);
INSERT INTO `country_states` VALUES (547, 'IN', 'JK', 'Jammu and Kashmir', 106);
INSERT INTO `country_states` VALUES (548, 'IN', 'JH', 'Jharkhand', 106);
INSERT INTO `country_states` VALUES (549, 'IN', 'KA', 'Karnataka', 106);
INSERT INTO `country_states` VALUES (550, 'IN', 'KL', 'Kerala', 106);
INSERT INTO `country_states` VALUES (551, 'IN', 'LD', 'Lakshadweep', 106);
INSERT INTO `country_states` VALUES (552, 'IN', 'MP', 'Madhya Pradesh', 106);
INSERT INTO `country_states` VALUES (553, 'IN', 'MH', 'Maharashtra', 106);
INSERT INTO `country_states` VALUES (554, 'IN', 'MN', 'Manipur', 106);
INSERT INTO `country_states` VALUES (555, 'IN', 'ML', 'Meghalaya', 106);
INSERT INTO `country_states` VALUES (556, 'IN', 'MZ', 'Mizoram', 106);
INSERT INTO `country_states` VALUES (557, 'IN', 'NL', 'Nagaland', 106);
INSERT INTO `country_states` VALUES (558, 'IN', 'OR', 'Odisha', 106);
INSERT INTO `country_states` VALUES (559, 'IN', 'PY', 'Puducherry', 106);
INSERT INTO `country_states` VALUES (560, 'IN', 'PB', 'Punjab', 106);
INSERT INTO `country_states` VALUES (561, 'IN', 'RJ', 'Rajasthan', 106);
INSERT INTO `country_states` VALUES (562, 'IN', 'SK', 'Sikkim', 106);
INSERT INTO `country_states` VALUES (563, 'IN', 'TN', 'Tamil Nadu', 106);
INSERT INTO `country_states` VALUES (564, 'IN', 'TG', 'Telangana', 106);
INSERT INTO `country_states` VALUES (565, 'IN', 'TR', 'Tripura', 106);
INSERT INTO `country_states` VALUES (566, 'IN', 'UP', 'Uttar Pradesh', 106);
INSERT INTO `country_states` VALUES (567, 'IN', 'UT', 'Uttarakhand', 106);
INSERT INTO `country_states` VALUES (568, 'IN', 'WB', 'West Bengal', 106);
COMMIT;

-- ----------------------------
-- Table structure for country_translations
-- ----------------------------
DROP TABLE IF EXISTS `country_translations`;
CREATE TABLE `country_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `country_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_translations_country_id_foreign` (`country_id`),
  CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4591 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of country_translations
-- ----------------------------
BEGIN;
INSERT INTO `country_translations` VALUES (3826, 'ar', 'أفغانستان', 1);
INSERT INTO `country_translations` VALUES (3827, 'ar', 'جزر آلاند', 2);
INSERT INTO `country_translations` VALUES (3828, 'ar', 'ألبانيا', 3);
INSERT INTO `country_translations` VALUES (3829, 'ar', 'الجزائر', 4);
INSERT INTO `country_translations` VALUES (3830, 'ar', 'ساموا الأمريكية', 5);
INSERT INTO `country_translations` VALUES (3831, 'ar', 'أندورا', 6);
INSERT INTO `country_translations` VALUES (3832, 'ar', 'أنغولا', 7);
INSERT INTO `country_translations` VALUES (3833, 'ar', 'أنغيلا', 8);
INSERT INTO `country_translations` VALUES (3834, 'ar', 'القارة القطبية الجنوبية', 9);
INSERT INTO `country_translations` VALUES (3835, 'ar', 'أنتيغوا وبربودا', 10);
INSERT INTO `country_translations` VALUES (3836, 'ar', 'الأرجنتين', 11);
INSERT INTO `country_translations` VALUES (3837, 'ar', 'أرمينيا', 12);
INSERT INTO `country_translations` VALUES (3838, 'ar', 'أروبا', 13);
INSERT INTO `country_translations` VALUES (3839, 'ar', 'جزيرة الصعود', 14);
INSERT INTO `country_translations` VALUES (3840, 'ar', 'أستراليا', 15);
INSERT INTO `country_translations` VALUES (3841, 'ar', 'النمسا', 16);
INSERT INTO `country_translations` VALUES (3842, 'ar', 'أذربيجان', 17);
INSERT INTO `country_translations` VALUES (3843, 'ar', 'الباهاما', 18);
INSERT INTO `country_translations` VALUES (3844, 'ar', 'البحرين', 19);
INSERT INTO `country_translations` VALUES (3845, 'ar', 'بنغلاديش', 20);
INSERT INTO `country_translations` VALUES (3846, 'ar', 'بربادوس', 21);
INSERT INTO `country_translations` VALUES (3847, 'ar', 'روسيا البيضاء', 22);
INSERT INTO `country_translations` VALUES (3848, 'ar', 'بلجيكا', 23);
INSERT INTO `country_translations` VALUES (3849, 'ar', 'بليز', 24);
INSERT INTO `country_translations` VALUES (3850, 'ar', 'بنين', 25);
INSERT INTO `country_translations` VALUES (3851, 'ar', 'برمودا', 26);
INSERT INTO `country_translations` VALUES (3852, 'ar', 'بوتان', 27);
INSERT INTO `country_translations` VALUES (3853, 'ar', 'بوليفيا', 28);
INSERT INTO `country_translations` VALUES (3854, 'ar', 'البوسنة والهرسك', 29);
INSERT INTO `country_translations` VALUES (3855, 'ar', 'بوتسوانا', 30);
INSERT INTO `country_translations` VALUES (3856, 'ar', 'البرازيل', 31);
INSERT INTO `country_translations` VALUES (3857, 'ar', 'إقليم المحيط البريطاني الهندي', 32);
INSERT INTO `country_translations` VALUES (3858, 'ar', 'جزر فيرجن البريطانية', 33);
INSERT INTO `country_translations` VALUES (3859, 'ar', 'بروناي', 34);
INSERT INTO `country_translations` VALUES (3860, 'ar', 'بلغاريا', 35);
INSERT INTO `country_translations` VALUES (3861, 'ar', 'بوركينا فاسو', 36);
INSERT INTO `country_translations` VALUES (3862, 'ar', 'بوروندي', 37);
INSERT INTO `country_translations` VALUES (3863, 'ar', 'كمبوديا', 38);
INSERT INTO `country_translations` VALUES (3864, 'ar', 'الكاميرون', 39);
INSERT INTO `country_translations` VALUES (3865, 'ar', 'كندا', 40);
INSERT INTO `country_translations` VALUES (3866, 'ar', 'جزر الكناري', 41);
INSERT INTO `country_translations` VALUES (3867, 'ar', 'الرأس الأخضر', 42);
INSERT INTO `country_translations` VALUES (3868, 'ar', 'الكاريبي هولندا', 43);
INSERT INTO `country_translations` VALUES (3869, 'ar', 'جزر كايمان', 44);
INSERT INTO `country_translations` VALUES (3870, 'ar', 'جمهورية افريقيا الوسطى', 45);
INSERT INTO `country_translations` VALUES (3871, 'ar', 'سبتة ومليلية', 46);
INSERT INTO `country_translations` VALUES (3872, 'ar', 'تشاد', 47);
INSERT INTO `country_translations` VALUES (3873, 'ar', 'تشيلي', 48);
INSERT INTO `country_translations` VALUES (3874, 'ar', 'الصين', 49);
INSERT INTO `country_translations` VALUES (3875, 'ar', 'جزيرة الكريسماس', 50);
INSERT INTO `country_translations` VALUES (3876, 'ar', 'جزر كوكوس (كيلينغ)', 51);
INSERT INTO `country_translations` VALUES (3877, 'ar', 'كولومبيا', 52);
INSERT INTO `country_translations` VALUES (3878, 'ar', 'جزر القمر', 53);
INSERT INTO `country_translations` VALUES (3879, 'ar', 'الكونغو - برازافيل', 54);
INSERT INTO `country_translations` VALUES (3880, 'ar', 'الكونغو - كينشاسا', 55);
INSERT INTO `country_translations` VALUES (3881, 'ar', 'جزر كوك', 56);
INSERT INTO `country_translations` VALUES (3882, 'ar', 'كوستاريكا', 57);
INSERT INTO `country_translations` VALUES (3883, 'ar', 'ساحل العاج', 58);
INSERT INTO `country_translations` VALUES (3884, 'ar', 'كرواتيا', 59);
INSERT INTO `country_translations` VALUES (3885, 'ar', 'كوبا', 60);
INSERT INTO `country_translations` VALUES (3886, 'ar', 'كوراساو', 61);
INSERT INTO `country_translations` VALUES (3887, 'ar', 'قبرص', 62);
INSERT INTO `country_translations` VALUES (3888, 'ar', 'التشيك', 63);
INSERT INTO `country_translations` VALUES (3889, 'ar', 'الدنمارك', 64);
INSERT INTO `country_translations` VALUES (3890, 'ar', 'دييغو غارسيا', 65);
INSERT INTO `country_translations` VALUES (3891, 'ar', 'جيبوتي', 66);
INSERT INTO `country_translations` VALUES (3892, 'ar', 'دومينيكا', 67);
INSERT INTO `country_translations` VALUES (3893, 'ar', 'جمهورية الدومنيكان', 68);
INSERT INTO `country_translations` VALUES (3894, 'ar', 'الإكوادور', 69);
INSERT INTO `country_translations` VALUES (3895, 'ar', 'مصر', 70);
INSERT INTO `country_translations` VALUES (3896, 'ar', 'السلفادور', 71);
INSERT INTO `country_translations` VALUES (3897, 'ar', 'غينيا الإستوائية', 72);
INSERT INTO `country_translations` VALUES (3898, 'ar', 'إريتريا', 73);
INSERT INTO `country_translations` VALUES (3899, 'ar', 'استونيا', 74);
INSERT INTO `country_translations` VALUES (3900, 'ar', 'أثيوبيا', 75);
INSERT INTO `country_translations` VALUES (3901, 'ar', 'منطقة اليورو', 76);
INSERT INTO `country_translations` VALUES (3902, 'ar', 'جزر فوكلاند', 77);
INSERT INTO `country_translations` VALUES (3903, 'ar', 'جزر فاروس', 78);
INSERT INTO `country_translations` VALUES (3904, 'ar', 'فيجي', 79);
INSERT INTO `country_translations` VALUES (3905, 'ar', 'فنلندا', 80);
INSERT INTO `country_translations` VALUES (3906, 'ar', 'فرنسا', 81);
INSERT INTO `country_translations` VALUES (3907, 'ar', 'غيانا الفرنسية', 82);
INSERT INTO `country_translations` VALUES (3908, 'ar', 'بولينيزيا الفرنسية', 83);
INSERT INTO `country_translations` VALUES (3909, 'ar', 'المناطق الجنوبية لفرنسا', 84);
INSERT INTO `country_translations` VALUES (3910, 'ar', 'الغابون', 85);
INSERT INTO `country_translations` VALUES (3911, 'ar', 'غامبيا', 86);
INSERT INTO `country_translations` VALUES (3912, 'ar', 'جورجيا', 87);
INSERT INTO `country_translations` VALUES (3913, 'ar', 'ألمانيا', 88);
INSERT INTO `country_translations` VALUES (3914, 'ar', 'غانا', 89);
INSERT INTO `country_translations` VALUES (3915, 'ar', 'جبل طارق', 90);
INSERT INTO `country_translations` VALUES (3916, 'ar', 'اليونان', 91);
INSERT INTO `country_translations` VALUES (3917, 'ar', 'الأرض الخضراء', 92);
INSERT INTO `country_translations` VALUES (3918, 'ar', 'غرينادا', 93);
INSERT INTO `country_translations` VALUES (3919, 'ar', 'جوادلوب', 94);
INSERT INTO `country_translations` VALUES (3920, 'ar', 'غوام', 95);
INSERT INTO `country_translations` VALUES (3921, 'ar', 'غواتيمالا', 96);
INSERT INTO `country_translations` VALUES (3922, 'ar', 'غيرنسي', 97);
INSERT INTO `country_translations` VALUES (3923, 'ar', 'غينيا', 98);
INSERT INTO `country_translations` VALUES (3924, 'ar', 'غينيا بيساو', 99);
INSERT INTO `country_translations` VALUES (3925, 'ar', 'غيانا', 100);
INSERT INTO `country_translations` VALUES (3926, 'ar', 'هايتي', 101);
INSERT INTO `country_translations` VALUES (3927, 'ar', 'هندوراس', 102);
INSERT INTO `country_translations` VALUES (3928, 'ar', 'هونج كونج SAR الصين', 103);
INSERT INTO `country_translations` VALUES (3929, 'ar', 'هنغاريا', 104);
INSERT INTO `country_translations` VALUES (3930, 'ar', 'أيسلندا', 105);
INSERT INTO `country_translations` VALUES (3931, 'ar', 'الهند', 106);
INSERT INTO `country_translations` VALUES (3932, 'ar', 'إندونيسيا', 107);
INSERT INTO `country_translations` VALUES (3933, 'ar', 'إيران', 108);
INSERT INTO `country_translations` VALUES (3934, 'ar', 'العراق', 109);
INSERT INTO `country_translations` VALUES (3935, 'ar', 'أيرلندا', 110);
INSERT INTO `country_translations` VALUES (3936, 'ar', 'جزيرة آيل أوف مان', 111);
INSERT INTO `country_translations` VALUES (3937, 'ar', 'إسرائيل', 112);
INSERT INTO `country_translations` VALUES (3938, 'ar', 'إيطاليا', 113);
INSERT INTO `country_translations` VALUES (3939, 'ar', 'جامايكا', 114);
INSERT INTO `country_translations` VALUES (3940, 'ar', 'اليابان', 115);
INSERT INTO `country_translations` VALUES (3941, 'ar', 'جيرسي', 116);
INSERT INTO `country_translations` VALUES (3942, 'ar', 'الأردن', 117);
INSERT INTO `country_translations` VALUES (3943, 'ar', 'كازاخستان', 118);
INSERT INTO `country_translations` VALUES (3944, 'ar', 'كينيا', 119);
INSERT INTO `country_translations` VALUES (3945, 'ar', 'كيريباس', 120);
INSERT INTO `country_translations` VALUES (3946, 'ar', 'كوسوفو', 121);
INSERT INTO `country_translations` VALUES (3947, 'ar', 'الكويت', 122);
INSERT INTO `country_translations` VALUES (3948, 'ar', 'قرغيزستان', 123);
INSERT INTO `country_translations` VALUES (3949, 'ar', 'لاوس', 124);
INSERT INTO `country_translations` VALUES (3950, 'ar', 'لاتفيا', 125);
INSERT INTO `country_translations` VALUES (3951, 'ar', 'لبنان', 126);
INSERT INTO `country_translations` VALUES (3952, 'ar', 'ليسوتو', 127);
INSERT INTO `country_translations` VALUES (3953, 'ar', 'ليبيريا', 128);
INSERT INTO `country_translations` VALUES (3954, 'ar', 'ليبيا', 129);
INSERT INTO `country_translations` VALUES (3955, 'ar', 'ليختنشتاين', 130);
INSERT INTO `country_translations` VALUES (3956, 'ar', 'ليتوانيا', 131);
INSERT INTO `country_translations` VALUES (3957, 'ar', 'لوكسمبورغ', 132);
INSERT INTO `country_translations` VALUES (3958, 'ar', 'ماكاو SAR الصين', 133);
INSERT INTO `country_translations` VALUES (3959, 'ar', 'مقدونيا', 134);
INSERT INTO `country_translations` VALUES (3960, 'ar', 'مدغشقر', 135);
INSERT INTO `country_translations` VALUES (3961, 'ar', 'مالاوي', 136);
INSERT INTO `country_translations` VALUES (3962, 'ar', 'ماليزيا', 137);
INSERT INTO `country_translations` VALUES (3963, 'ar', 'جزر المالديف', 138);
INSERT INTO `country_translations` VALUES (3964, 'ar', 'مالي', 139);
INSERT INTO `country_translations` VALUES (3965, 'ar', 'مالطا', 140);
INSERT INTO `country_translations` VALUES (3966, 'ar', 'جزر مارشال', 141);
INSERT INTO `country_translations` VALUES (3967, 'ar', 'مارتينيك', 142);
INSERT INTO `country_translations` VALUES (3968, 'ar', 'موريتانيا', 143);
INSERT INTO `country_translations` VALUES (3969, 'ar', 'موريشيوس', 144);
INSERT INTO `country_translations` VALUES (3970, 'ar', 'ضائع', 145);
INSERT INTO `country_translations` VALUES (3971, 'ar', 'المكسيك', 146);
INSERT INTO `country_translations` VALUES (3972, 'ar', 'ميكرونيزيا', 147);
INSERT INTO `country_translations` VALUES (3973, 'ar', 'مولدوفا', 148);
INSERT INTO `country_translations` VALUES (3974, 'ar', 'موناكو', 149);
INSERT INTO `country_translations` VALUES (3975, 'ar', 'منغوليا', 150);
INSERT INTO `country_translations` VALUES (3976, 'ar', 'الجبل الأسود', 151);
INSERT INTO `country_translations` VALUES (3977, 'ar', 'مونتسيرات', 152);
INSERT INTO `country_translations` VALUES (3978, 'ar', 'المغرب', 153);
INSERT INTO `country_translations` VALUES (3979, 'ar', 'موزمبيق', 154);
INSERT INTO `country_translations` VALUES (3980, 'ar', 'ميانمار (بورما)', 155);
INSERT INTO `country_translations` VALUES (3981, 'ar', 'ناميبيا', 156);
INSERT INTO `country_translations` VALUES (3982, 'ar', 'ناورو', 157);
INSERT INTO `country_translations` VALUES (3983, 'ar', 'نيبال', 158);
INSERT INTO `country_translations` VALUES (3984, 'ar', 'نيبال', 159);
INSERT INTO `country_translations` VALUES (3985, 'ar', 'كاليدونيا الجديدة', 160);
INSERT INTO `country_translations` VALUES (3986, 'ar', 'نيوزيلاندا', 161);
INSERT INTO `country_translations` VALUES (3987, 'ar', 'نيكاراغوا', 162);
INSERT INTO `country_translations` VALUES (3988, 'ar', 'النيجر', 163);
INSERT INTO `country_translations` VALUES (3989, 'ar', 'نيجيريا', 164);
INSERT INTO `country_translations` VALUES (3990, 'ar', 'نيوي', 165);
INSERT INTO `country_translations` VALUES (3991, 'ar', 'جزيرة نورفولك', 166);
INSERT INTO `country_translations` VALUES (3992, 'ar', 'كوريا الشماليه', 167);
INSERT INTO `country_translations` VALUES (3993, 'ar', 'جزر مريانا الشمالية', 168);
INSERT INTO `country_translations` VALUES (3994, 'ar', 'النرويج', 169);
INSERT INTO `country_translations` VALUES (3995, 'ar', 'سلطنة عمان', 170);
INSERT INTO `country_translations` VALUES (3996, 'ar', 'باكستان', 171);
INSERT INTO `country_translations` VALUES (3997, 'ar', 'بالاو', 172);
INSERT INTO `country_translations` VALUES (3998, 'ar', 'الاراضي الفلسطينية', 173);
INSERT INTO `country_translations` VALUES (3999, 'ar', 'بناما', 174);
INSERT INTO `country_translations` VALUES (4000, 'ar', 'بابوا غينيا الجديدة', 175);
INSERT INTO `country_translations` VALUES (4001, 'ar', 'باراغواي', 176);
INSERT INTO `country_translations` VALUES (4002, 'ar', 'بيرو', 177);
INSERT INTO `country_translations` VALUES (4003, 'ar', 'الفلبين', 178);
INSERT INTO `country_translations` VALUES (4004, 'ar', 'جزر بيتكيرن', 179);
INSERT INTO `country_translations` VALUES (4005, 'ar', 'بولندا', 180);
INSERT INTO `country_translations` VALUES (4006, 'ar', 'البرتغال', 181);
INSERT INTO `country_translations` VALUES (4007, 'ar', 'بورتوريكو', 182);
INSERT INTO `country_translations` VALUES (4008, 'ar', 'دولة قطر', 183);
INSERT INTO `country_translations` VALUES (4009, 'ar', 'جمع شمل', 184);
INSERT INTO `country_translations` VALUES (4010, 'ar', 'رومانيا', 185);
INSERT INTO `country_translations` VALUES (4011, 'ar', 'روسيا', 186);
INSERT INTO `country_translations` VALUES (4012, 'ar', 'رواندا', 187);
INSERT INTO `country_translations` VALUES (4013, 'ar', 'ساموا', 188);
INSERT INTO `country_translations` VALUES (4014, 'ar', 'سان مارينو', 189);
INSERT INTO `country_translations` VALUES (4015, 'ar', 'سانت كيتس ونيفيس', 190);
INSERT INTO `country_translations` VALUES (4016, 'ar', 'المملكة العربية السعودية', 191);
INSERT INTO `country_translations` VALUES (4017, 'ar', 'السنغال', 192);
INSERT INTO `country_translations` VALUES (4018, 'ar', 'صربيا', 193);
INSERT INTO `country_translations` VALUES (4019, 'ar', 'سيشيل', 194);
INSERT INTO `country_translations` VALUES (4020, 'ar', 'سيراليون', 195);
INSERT INTO `country_translations` VALUES (4021, 'ar', 'سنغافورة', 196);
INSERT INTO `country_translations` VALUES (4022, 'ar', 'سينت مارتن', 197);
INSERT INTO `country_translations` VALUES (4023, 'ar', 'سلوفاكيا', 198);
INSERT INTO `country_translations` VALUES (4024, 'ar', 'سلوفينيا', 199);
INSERT INTO `country_translations` VALUES (4025, 'ar', 'جزر سليمان', 200);
INSERT INTO `country_translations` VALUES (4026, 'ar', 'الصومال', 201);
INSERT INTO `country_translations` VALUES (4027, 'ar', 'جنوب أفريقيا', 202);
INSERT INTO `country_translations` VALUES (4028, 'ar', 'جورجيا الجنوبية وجزر ساندويتش الجنوبية', 203);
INSERT INTO `country_translations` VALUES (4029, 'ar', 'كوريا الجنوبية', 204);
INSERT INTO `country_translations` VALUES (4030, 'ar', 'جنوب السودان', 205);
INSERT INTO `country_translations` VALUES (4031, 'ar', 'إسبانيا', 206);
INSERT INTO `country_translations` VALUES (4032, 'ar', 'سيريلانكا', 207);
INSERT INTO `country_translations` VALUES (4033, 'ar', 'سانت بارتيليمي', 208);
INSERT INTO `country_translations` VALUES (4034, 'ar', 'سانت هيلانة', 209);
INSERT INTO `country_translations` VALUES (4035, 'ar', 'سانت كيتس ونيفيس', 210);
INSERT INTO `country_translations` VALUES (4036, 'ar', 'شارع لوسيا', 211);
INSERT INTO `country_translations` VALUES (4037, 'ar', 'سانت مارتن', 212);
INSERT INTO `country_translations` VALUES (4038, 'ar', 'سانت بيير وميكلون', 213);
INSERT INTO `country_translations` VALUES (4039, 'ar', 'سانت فنسنت وجزر غرينادين', 214);
INSERT INTO `country_translations` VALUES (4040, 'ar', 'السودان', 215);
INSERT INTO `country_translations` VALUES (4041, 'ar', 'سورينام', 216);
INSERT INTO `country_translations` VALUES (4042, 'ar', 'سفالبارد وجان ماين', 217);
INSERT INTO `country_translations` VALUES (4043, 'ar', 'سوازيلاند', 218);
INSERT INTO `country_translations` VALUES (4044, 'ar', 'السويد', 219);
INSERT INTO `country_translations` VALUES (4045, 'ar', 'سويسرا', 220);
INSERT INTO `country_translations` VALUES (4046, 'ar', 'سوريا', 221);
INSERT INTO `country_translations` VALUES (4047, 'ar', 'تايوان', 222);
INSERT INTO `country_translations` VALUES (4048, 'ar', 'طاجيكستان', 223);
INSERT INTO `country_translations` VALUES (4049, 'ar', 'تنزانيا', 224);
INSERT INTO `country_translations` VALUES (4050, 'ar', 'تايلاند', 225);
INSERT INTO `country_translations` VALUES (4051, 'ar', 'تيمور', 226);
INSERT INTO `country_translations` VALUES (4052, 'ar', 'توجو', 227);
INSERT INTO `country_translations` VALUES (4053, 'ar', 'توكيلاو', 228);
INSERT INTO `country_translations` VALUES (4054, 'ar', 'تونغا', 229);
INSERT INTO `country_translations` VALUES (4055, 'ar', 'ترينيداد وتوباغو', 230);
INSERT INTO `country_translations` VALUES (4056, 'ar', 'تريستان دا كونها', 231);
INSERT INTO `country_translations` VALUES (4057, 'ar', 'تونس', 232);
INSERT INTO `country_translations` VALUES (4058, 'ar', 'ديك رومي', 233);
INSERT INTO `country_translations` VALUES (4059, 'ar', 'تركمانستان', 234);
INSERT INTO `country_translations` VALUES (4060, 'ar', 'جزر تركس وكايكوس', 235);
INSERT INTO `country_translations` VALUES (4061, 'ar', 'توفالو', 236);
INSERT INTO `country_translations` VALUES (4062, 'ar', 'جزر الولايات المتحدة البعيدة', 237);
INSERT INTO `country_translations` VALUES (4063, 'ar', 'جزر فيرجن الأمريكية', 238);
INSERT INTO `country_translations` VALUES (4064, 'ar', 'أوغندا', 239);
INSERT INTO `country_translations` VALUES (4065, 'ar', 'أوكرانيا', 240);
INSERT INTO `country_translations` VALUES (4066, 'ar', 'الإمارات العربية المتحدة', 241);
INSERT INTO `country_translations` VALUES (4067, 'ar', 'المملكة المتحدة', 242);
INSERT INTO `country_translations` VALUES (4068, 'ar', 'الأمم المتحدة', 243);
INSERT INTO `country_translations` VALUES (4069, 'ar', 'الولايات المتحدة الأمريكية', 244);
INSERT INTO `country_translations` VALUES (4070, 'ar', 'أوروغواي', 245);
INSERT INTO `country_translations` VALUES (4071, 'ar', 'أوزبكستان', 246);
INSERT INTO `country_translations` VALUES (4072, 'ar', 'فانواتو', 247);
INSERT INTO `country_translations` VALUES (4073, 'ar', 'مدينة الفاتيكان', 248);
INSERT INTO `country_translations` VALUES (4074, 'ar', 'فنزويلا', 249);
INSERT INTO `country_translations` VALUES (4075, 'ar', 'فيتنام', 250);
INSERT INTO `country_translations` VALUES (4076, 'ar', 'واليس وفوتونا', 251);
INSERT INTO `country_translations` VALUES (4077, 'ar', 'الصحراء الغربية', 252);
INSERT INTO `country_translations` VALUES (4078, 'ar', 'اليمن', 253);
INSERT INTO `country_translations` VALUES (4079, 'ar', 'زامبيا', 254);
INSERT INTO `country_translations` VALUES (4080, 'ar', 'زيمبابوي', 255);
INSERT INTO `country_translations` VALUES (4081, 'fa', 'افغانستان', 1);
INSERT INTO `country_translations` VALUES (4082, 'fa', 'جزایر الند', 2);
INSERT INTO `country_translations` VALUES (4083, 'fa', 'آلبانی', 3);
INSERT INTO `country_translations` VALUES (4084, 'fa', 'الجزایر', 4);
INSERT INTO `country_translations` VALUES (4085, 'fa', 'ساموآ آمریکایی', 5);
INSERT INTO `country_translations` VALUES (4086, 'fa', 'آندورا', 6);
INSERT INTO `country_translations` VALUES (4087, 'fa', 'آنگولا', 7);
INSERT INTO `country_translations` VALUES (4088, 'fa', 'آنگولا', 8);
INSERT INTO `country_translations` VALUES (4089, 'fa', 'جنوبگان', 9);
INSERT INTO `country_translations` VALUES (4090, 'fa', 'آنتیگوا و باربودا', 10);
INSERT INTO `country_translations` VALUES (4091, 'fa', 'آرژانتین', 11);
INSERT INTO `country_translations` VALUES (4092, 'fa', 'ارمنستان', 12);
INSERT INTO `country_translations` VALUES (4093, 'fa', 'آروبا', 13);
INSERT INTO `country_translations` VALUES (4094, 'fa', 'جزیره صعود', 14);
INSERT INTO `country_translations` VALUES (4095, 'fa', 'استرالیا', 15);
INSERT INTO `country_translations` VALUES (4096, 'fa', 'اتریش', 16);
INSERT INTO `country_translations` VALUES (4097, 'fa', 'آذربایجان', 17);
INSERT INTO `country_translations` VALUES (4098, 'fa', 'باهاما', 18);
INSERT INTO `country_translations` VALUES (4099, 'fa', 'بحرین', 19);
INSERT INTO `country_translations` VALUES (4100, 'fa', 'بنگلادش', 20);
INSERT INTO `country_translations` VALUES (4101, 'fa', 'باربادوس', 21);
INSERT INTO `country_translations` VALUES (4102, 'fa', 'بلاروس', 22);
INSERT INTO `country_translations` VALUES (4103, 'fa', 'بلژیک', 23);
INSERT INTO `country_translations` VALUES (4104, 'fa', 'بلژیک', 24);
INSERT INTO `country_translations` VALUES (4105, 'fa', 'بنین', 25);
INSERT INTO `country_translations` VALUES (4106, 'fa', 'برمودا', 26);
INSERT INTO `country_translations` VALUES (4107, 'fa', 'بوتان', 27);
INSERT INTO `country_translations` VALUES (4108, 'fa', 'بولیوی', 28);
INSERT INTO `country_translations` VALUES (4109, 'fa', 'بوسنی و هرزگوین', 29);
INSERT INTO `country_translations` VALUES (4110, 'fa', 'بوتسوانا', 30);
INSERT INTO `country_translations` VALUES (4111, 'fa', 'برزیل', 31);
INSERT INTO `country_translations` VALUES (4112, 'fa', 'قلمرو اقیانوس هند انگلیس', 32);
INSERT INTO `country_translations` VALUES (4113, 'fa', 'جزایر ویرجین انگلیس', 33);
INSERT INTO `country_translations` VALUES (4114, 'fa', 'برونئی', 34);
INSERT INTO `country_translations` VALUES (4115, 'fa', 'بلغارستان', 35);
INSERT INTO `country_translations` VALUES (4116, 'fa', 'بورکینا فاسو', 36);
INSERT INTO `country_translations` VALUES (4117, 'fa', 'بوروندی', 37);
INSERT INTO `country_translations` VALUES (4118, 'fa', 'کامبوج', 38);
INSERT INTO `country_translations` VALUES (4119, 'fa', 'کامرون', 39);
INSERT INTO `country_translations` VALUES (4120, 'fa', 'کانادا', 40);
INSERT INTO `country_translations` VALUES (4121, 'fa', 'جزایر قناری', 41);
INSERT INTO `country_translations` VALUES (4122, 'fa', 'کیپ ورد', 42);
INSERT INTO `country_translations` VALUES (4123, 'fa', 'کارائیب هلند', 43);
INSERT INTO `country_translations` VALUES (4124, 'fa', 'Cayman Islands', 44);
INSERT INTO `country_translations` VALUES (4125, 'fa', 'جمهوری آفریقای مرکزی', 45);
INSERT INTO `country_translations` VALUES (4126, 'fa', 'سوتا و ملیلا', 46);
INSERT INTO `country_translations` VALUES (4127, 'fa', 'چاد', 47);
INSERT INTO `country_translations` VALUES (4128, 'fa', 'شیلی', 48);
INSERT INTO `country_translations` VALUES (4129, 'fa', 'چین', 49);
INSERT INTO `country_translations` VALUES (4130, 'fa', 'جزیره کریسمس', 50);
INSERT INTO `country_translations` VALUES (4131, 'fa', 'جزایر کوکو (Keeling)', 51);
INSERT INTO `country_translations` VALUES (4132, 'fa', 'کلمبیا', 52);
INSERT INTO `country_translations` VALUES (4133, 'fa', 'کومور', 53);
INSERT INTO `country_translations` VALUES (4134, 'fa', 'کنگو - برزاویل', 54);
INSERT INTO `country_translations` VALUES (4135, 'fa', 'کنگو - کینشاسا', 55);
INSERT INTO `country_translations` VALUES (4136, 'fa', 'جزایر کوک', 56);
INSERT INTO `country_translations` VALUES (4137, 'fa', 'کاستاریکا', 57);
INSERT INTO `country_translations` VALUES (4138, 'fa', 'ساحل عاج', 58);
INSERT INTO `country_translations` VALUES (4139, 'fa', 'کرواسی', 59);
INSERT INTO `country_translations` VALUES (4140, 'fa', 'کوبا', 60);
INSERT INTO `country_translations` VALUES (4141, 'fa', 'کوراسائو', 61);
INSERT INTO `country_translations` VALUES (4142, 'fa', 'قبرس', 62);
INSERT INTO `country_translations` VALUES (4143, 'fa', 'چک', 63);
INSERT INTO `country_translations` VALUES (4144, 'fa', 'دانمارک', 64);
INSERT INTO `country_translations` VALUES (4145, 'fa', 'دیگو گارسیا', 65);
INSERT INTO `country_translations` VALUES (4146, 'fa', 'جیبوتی', 66);
INSERT INTO `country_translations` VALUES (4147, 'fa', 'دومینیکا', 67);
INSERT INTO `country_translations` VALUES (4148, 'fa', 'جمهوری دومینیکن', 68);
INSERT INTO `country_translations` VALUES (4149, 'fa', 'اکوادور', 69);
INSERT INTO `country_translations` VALUES (4150, 'fa', 'مصر', 70);
INSERT INTO `country_translations` VALUES (4151, 'fa', 'السالوادور', 71);
INSERT INTO `country_translations` VALUES (4152, 'fa', 'گینه استوایی', 72);
INSERT INTO `country_translations` VALUES (4153, 'fa', 'اریتره', 73);
INSERT INTO `country_translations` VALUES (4154, 'fa', 'استونی', 74);
INSERT INTO `country_translations` VALUES (4155, 'fa', 'اتیوپی', 75);
INSERT INTO `country_translations` VALUES (4156, 'fa', 'منطقه یورو', 76);
INSERT INTO `country_translations` VALUES (4157, 'fa', 'جزایر فالکلند', 77);
INSERT INTO `country_translations` VALUES (4158, 'fa', 'جزایر فارو', 78);
INSERT INTO `country_translations` VALUES (4159, 'fa', 'فیجی', 79);
INSERT INTO `country_translations` VALUES (4160, 'fa', 'فنلاند', 80);
INSERT INTO `country_translations` VALUES (4161, 'fa', 'فرانسه', 81);
INSERT INTO `country_translations` VALUES (4162, 'fa', 'گویان فرانسه', 82);
INSERT INTO `country_translations` VALUES (4163, 'fa', 'پلی‌نزی فرانسه', 83);
INSERT INTO `country_translations` VALUES (4164, 'fa', 'سرزمین های جنوبی فرانسه', 84);
INSERT INTO `country_translations` VALUES (4165, 'fa', 'گابن', 85);
INSERT INTO `country_translations` VALUES (4166, 'fa', 'گامبیا', 86);
INSERT INTO `country_translations` VALUES (4167, 'fa', 'جورجیا', 87);
INSERT INTO `country_translations` VALUES (4168, 'fa', 'آلمان', 88);
INSERT INTO `country_translations` VALUES (4169, 'fa', 'غنا', 89);
INSERT INTO `country_translations` VALUES (4170, 'fa', 'جبل الطارق', 90);
INSERT INTO `country_translations` VALUES (4171, 'fa', 'یونان', 91);
INSERT INTO `country_translations` VALUES (4172, 'fa', 'گرینلند', 92);
INSERT INTO `country_translations` VALUES (4173, 'fa', 'گرنادا', 93);
INSERT INTO `country_translations` VALUES (4174, 'fa', 'گوادلوپ', 94);
INSERT INTO `country_translations` VALUES (4175, 'fa', 'گوام', 95);
INSERT INTO `country_translations` VALUES (4176, 'fa', 'گواتمالا', 96);
INSERT INTO `country_translations` VALUES (4177, 'fa', 'گورنسی', 97);
INSERT INTO `country_translations` VALUES (4178, 'fa', 'گینه', 98);
INSERT INTO `country_translations` VALUES (4179, 'fa', 'گینه بیسائو', 99);
INSERT INTO `country_translations` VALUES (4180, 'fa', 'گویان', 100);
INSERT INTO `country_translations` VALUES (4181, 'fa', 'هائیتی', 101);
INSERT INTO `country_translations` VALUES (4182, 'fa', 'هندوراس', 102);
INSERT INTO `country_translations` VALUES (4183, 'fa', 'هنگ کنگ SAR چین', 103);
INSERT INTO `country_translations` VALUES (4184, 'fa', 'مجارستان', 104);
INSERT INTO `country_translations` VALUES (4185, 'fa', 'ایسلند', 105);
INSERT INTO `country_translations` VALUES (4186, 'fa', 'هند', 106);
INSERT INTO `country_translations` VALUES (4187, 'fa', 'اندونزی', 107);
INSERT INTO `country_translations` VALUES (4188, 'fa', 'ایران', 108);
INSERT INTO `country_translations` VALUES (4189, 'fa', 'عراق', 109);
INSERT INTO `country_translations` VALUES (4190, 'fa', 'ایرلند', 110);
INSERT INTO `country_translations` VALUES (4191, 'fa', 'جزیره من', 111);
INSERT INTO `country_translations` VALUES (4192, 'fa', 'اسرائيل', 112);
INSERT INTO `country_translations` VALUES (4193, 'fa', 'ایتالیا', 113);
INSERT INTO `country_translations` VALUES (4194, 'fa', 'جامائیکا', 114);
INSERT INTO `country_translations` VALUES (4195, 'fa', 'ژاپن', 115);
INSERT INTO `country_translations` VALUES (4196, 'fa', 'پیراهن ورزشی', 116);
INSERT INTO `country_translations` VALUES (4197, 'fa', 'اردن', 117);
INSERT INTO `country_translations` VALUES (4198, 'fa', 'قزاقستان', 118);
INSERT INTO `country_translations` VALUES (4199, 'fa', 'کنیا', 119);
INSERT INTO `country_translations` VALUES (4200, 'fa', 'کیریباتی', 120);
INSERT INTO `country_translations` VALUES (4201, 'fa', 'کوزوو', 121);
INSERT INTO `country_translations` VALUES (4202, 'fa', 'کویت', 122);
INSERT INTO `country_translations` VALUES (4203, 'fa', 'قرقیزستان', 123);
INSERT INTO `country_translations` VALUES (4204, 'fa', 'لائوس', 124);
INSERT INTO `country_translations` VALUES (4205, 'fa', 'لتونی', 125);
INSERT INTO `country_translations` VALUES (4206, 'fa', 'لبنان', 126);
INSERT INTO `country_translations` VALUES (4207, 'fa', 'لسوتو', 127);
INSERT INTO `country_translations` VALUES (4208, 'fa', 'لیبریا', 128);
INSERT INTO `country_translations` VALUES (4209, 'fa', 'لیبی', 129);
INSERT INTO `country_translations` VALUES (4210, 'fa', 'لیختن اشتاین', 130);
INSERT INTO `country_translations` VALUES (4211, 'fa', 'لیتوانی', 131);
INSERT INTO `country_translations` VALUES (4212, 'fa', 'لوکزامبورگ', 132);
INSERT INTO `country_translations` VALUES (4213, 'fa', 'ماکائو SAR چین', 133);
INSERT INTO `country_translations` VALUES (4214, 'fa', 'مقدونیه', 134);
INSERT INTO `country_translations` VALUES (4215, 'fa', 'ماداگاسکار', 135);
INSERT INTO `country_translations` VALUES (4216, 'fa', 'مالاوی', 136);
INSERT INTO `country_translations` VALUES (4217, 'fa', 'مالزی', 137);
INSERT INTO `country_translations` VALUES (4218, 'fa', 'مالدیو', 138);
INSERT INTO `country_translations` VALUES (4219, 'fa', 'مالی', 139);
INSERT INTO `country_translations` VALUES (4220, 'fa', 'مالت', 140);
INSERT INTO `country_translations` VALUES (4221, 'fa', 'جزایر مارشال', 141);
INSERT INTO `country_translations` VALUES (4222, 'fa', 'مارتینیک', 142);
INSERT INTO `country_translations` VALUES (4223, 'fa', 'موریتانی', 143);
INSERT INTO `country_translations` VALUES (4224, 'fa', 'موریس', 144);
INSERT INTO `country_translations` VALUES (4225, 'fa', 'گمشده', 145);
INSERT INTO `country_translations` VALUES (4226, 'fa', 'مکزیک', 146);
INSERT INTO `country_translations` VALUES (4227, 'fa', 'میکرونزی', 147);
INSERT INTO `country_translations` VALUES (4228, 'fa', 'مولداوی', 148);
INSERT INTO `country_translations` VALUES (4229, 'fa', 'موناکو', 149);
INSERT INTO `country_translations` VALUES (4230, 'fa', 'مغولستان', 150);
INSERT INTO `country_translations` VALUES (4231, 'fa', 'مونته نگرو', 151);
INSERT INTO `country_translations` VALUES (4232, 'fa', 'مونتسرات', 152);
INSERT INTO `country_translations` VALUES (4233, 'fa', 'مراکش', 153);
INSERT INTO `country_translations` VALUES (4234, 'fa', 'موزامبیک', 154);
INSERT INTO `country_translations` VALUES (4235, 'fa', 'میانمار (برمه)', 155);
INSERT INTO `country_translations` VALUES (4236, 'fa', 'ناميبيا', 156);
INSERT INTO `country_translations` VALUES (4237, 'fa', 'نائورو', 157);
INSERT INTO `country_translations` VALUES (4238, 'fa', 'نپال', 158);
INSERT INTO `country_translations` VALUES (4239, 'fa', 'هلند', 159);
INSERT INTO `country_translations` VALUES (4240, 'fa', 'کالدونیای جدید', 160);
INSERT INTO `country_translations` VALUES (4241, 'fa', 'نیوزلند', 161);
INSERT INTO `country_translations` VALUES (4242, 'fa', 'نیکاراگوئه', 162);
INSERT INTO `country_translations` VALUES (4243, 'fa', 'نیجر', 163);
INSERT INTO `country_translations` VALUES (4244, 'fa', 'نیجریه', 164);
INSERT INTO `country_translations` VALUES (4245, 'fa', 'نیو', 165);
INSERT INTO `country_translations` VALUES (4246, 'fa', 'جزیره نورفولک', 166);
INSERT INTO `country_translations` VALUES (4247, 'fa', 'کره شمالی', 167);
INSERT INTO `country_translations` VALUES (4248, 'fa', 'جزایر ماریانای شمالی', 168);
INSERT INTO `country_translations` VALUES (4249, 'fa', 'نروژ', 169);
INSERT INTO `country_translations` VALUES (4250, 'fa', 'عمان', 170);
INSERT INTO `country_translations` VALUES (4251, 'fa', 'پاکستان', 171);
INSERT INTO `country_translations` VALUES (4252, 'fa', 'پالائو', 172);
INSERT INTO `country_translations` VALUES (4253, 'fa', 'سرزمین های فلسطینی', 173);
INSERT INTO `country_translations` VALUES (4254, 'fa', 'پاناما', 174);
INSERT INTO `country_translations` VALUES (4255, 'fa', 'پاپوا گینه نو', 175);
INSERT INTO `country_translations` VALUES (4256, 'fa', 'پاراگوئه', 176);
INSERT INTO `country_translations` VALUES (4257, 'fa', 'پرو', 177);
INSERT INTO `country_translations` VALUES (4258, 'fa', 'فیلیپین', 178);
INSERT INTO `country_translations` VALUES (4259, 'fa', 'جزایر پیکریرن', 179);
INSERT INTO `country_translations` VALUES (4260, 'fa', 'لهستان', 180);
INSERT INTO `country_translations` VALUES (4261, 'fa', 'کشور پرتغال', 181);
INSERT INTO `country_translations` VALUES (4262, 'fa', 'پورتوریکو', 182);
INSERT INTO `country_translations` VALUES (4263, 'fa', 'قطر', 183);
INSERT INTO `country_translations` VALUES (4264, 'fa', 'تجدید دیدار', 184);
INSERT INTO `country_translations` VALUES (4265, 'fa', 'رومانی', 185);
INSERT INTO `country_translations` VALUES (4266, 'fa', 'روسیه', 186);
INSERT INTO `country_translations` VALUES (4267, 'fa', 'رواندا', 187);
INSERT INTO `country_translations` VALUES (4268, 'fa', 'ساموآ', 188);
INSERT INTO `country_translations` VALUES (4269, 'fa', 'سان مارینو', 189);
INSERT INTO `country_translations` VALUES (4270, 'fa', 'سنت کیتس و نوویس', 190);
INSERT INTO `country_translations` VALUES (4271, 'fa', 'عربستان سعودی', 191);
INSERT INTO `country_translations` VALUES (4272, 'fa', 'سنگال', 192);
INSERT INTO `country_translations` VALUES (4273, 'fa', 'صربستان', 193);
INSERT INTO `country_translations` VALUES (4274, 'fa', 'سیشل', 194);
INSERT INTO `country_translations` VALUES (4275, 'fa', 'سیرالئون', 195);
INSERT INTO `country_translations` VALUES (4276, 'fa', 'سنگاپور', 196);
INSERT INTO `country_translations` VALUES (4277, 'fa', 'سینت ماارتن', 197);
INSERT INTO `country_translations` VALUES (4278, 'fa', 'اسلواکی', 198);
INSERT INTO `country_translations` VALUES (4279, 'fa', 'اسلوونی', 199);
INSERT INTO `country_translations` VALUES (4280, 'fa', 'جزایر سلیمان', 200);
INSERT INTO `country_translations` VALUES (4281, 'fa', 'سومالی', 201);
INSERT INTO `country_translations` VALUES (4282, 'fa', 'آفریقای جنوبی', 202);
INSERT INTO `country_translations` VALUES (4283, 'fa', 'جزایر جورجیا جنوبی و جزایر ساندویچ جنوبی', 203);
INSERT INTO `country_translations` VALUES (4284, 'fa', 'کره جنوبی', 204);
INSERT INTO `country_translations` VALUES (4285, 'fa', 'سودان جنوبی', 205);
INSERT INTO `country_translations` VALUES (4286, 'fa', 'اسپانیا', 206);
INSERT INTO `country_translations` VALUES (4287, 'fa', 'سری لانکا', 207);
INSERT INTO `country_translations` VALUES (4288, 'fa', 'سنت بارتلی', 208);
INSERT INTO `country_translations` VALUES (4289, 'fa', 'سنت هلنا', 209);
INSERT INTO `country_translations` VALUES (4290, 'fa', 'سنت کیتز و نوویس', 210);
INSERT INTO `country_translations` VALUES (4291, 'fa', 'سنت لوسیا', 211);
INSERT INTO `country_translations` VALUES (4292, 'fa', 'سنت مارتین', 212);
INSERT INTO `country_translations` VALUES (4293, 'fa', 'سنت پیر و میکلون', 213);
INSERT INTO `country_translations` VALUES (4294, 'fa', 'سنت وینسنت و گرنادینها', 214);
INSERT INTO `country_translations` VALUES (4295, 'fa', 'سودان', 215);
INSERT INTO `country_translations` VALUES (4296, 'fa', 'سورینام', 216);
INSERT INTO `country_translations` VALUES (4297, 'fa', 'اسوالبارد و جان ماین', 217);
INSERT INTO `country_translations` VALUES (4298, 'fa', 'سوازیلند', 218);
INSERT INTO `country_translations` VALUES (4299, 'fa', 'سوئد', 219);
INSERT INTO `country_translations` VALUES (4300, 'fa', 'سوئیس', 220);
INSERT INTO `country_translations` VALUES (4301, 'fa', 'سوریه', 221);
INSERT INTO `country_translations` VALUES (4302, 'fa', 'تایوان', 222);
INSERT INTO `country_translations` VALUES (4303, 'fa', 'تاجیکستان', 223);
INSERT INTO `country_translations` VALUES (4304, 'fa', 'تانزانیا', 224);
INSERT INTO `country_translations` VALUES (4305, 'fa', 'تایلند', 225);
INSERT INTO `country_translations` VALUES (4306, 'fa', 'تیمور-لست', 226);
INSERT INTO `country_translations` VALUES (4307, 'fa', 'رفتن', 227);
INSERT INTO `country_translations` VALUES (4308, 'fa', 'توکلو', 228);
INSERT INTO `country_translations` VALUES (4309, 'fa', 'تونگا', 229);
INSERT INTO `country_translations` VALUES (4310, 'fa', 'ترینیداد و توباگو', 230);
INSERT INTO `country_translations` VALUES (4311, 'fa', 'تریستان دا کانونا', 231);
INSERT INTO `country_translations` VALUES (4312, 'fa', 'تونس', 232);
INSERT INTO `country_translations` VALUES (4313, 'fa', 'بوقلمون', 233);
INSERT INTO `country_translations` VALUES (4314, 'fa', 'ترکمنستان', 234);
INSERT INTO `country_translations` VALUES (4315, 'fa', 'جزایر تورکس و کایکوس', 235);
INSERT INTO `country_translations` VALUES (4316, 'fa', 'تووالو', 236);
INSERT INTO `country_translations` VALUES (4317, 'fa', 'جزایر دور افتاده ایالات متحده آمریکا', 237);
INSERT INTO `country_translations` VALUES (4318, 'fa', 'جزایر ویرجین ایالات متحده', 238);
INSERT INTO `country_translations` VALUES (4319, 'fa', 'اوگاندا', 239);
INSERT INTO `country_translations` VALUES (4320, 'fa', 'اوکراین', 240);
INSERT INTO `country_translations` VALUES (4321, 'fa', 'امارات متحده عربی', 241);
INSERT INTO `country_translations` VALUES (4322, 'fa', 'انگلستان', 242);
INSERT INTO `country_translations` VALUES (4323, 'fa', 'سازمان ملل', 243);
INSERT INTO `country_translations` VALUES (4324, 'fa', 'ایالات متحده', 244);
INSERT INTO `country_translations` VALUES (4325, 'fa', 'اروگوئه', 245);
INSERT INTO `country_translations` VALUES (4326, 'fa', 'ازبکستان', 246);
INSERT INTO `country_translations` VALUES (4327, 'fa', 'وانواتو', 247);
INSERT INTO `country_translations` VALUES (4328, 'fa', 'شهر واتیکان', 248);
INSERT INTO `country_translations` VALUES (4329, 'fa', 'ونزوئلا', 249);
INSERT INTO `country_translations` VALUES (4330, 'fa', 'ویتنام', 250);
INSERT INTO `country_translations` VALUES (4331, 'fa', 'والیس و فوتونا', 251);
INSERT INTO `country_translations` VALUES (4332, 'fa', 'صحرای غربی', 252);
INSERT INTO `country_translations` VALUES (4333, 'fa', 'یمن', 253);
INSERT INTO `country_translations` VALUES (4334, 'fa', 'زامبیا', 254);
INSERT INTO `country_translations` VALUES (4335, 'fa', 'زیمبابوه', 255);
INSERT INTO `country_translations` VALUES (4336, 'pt_BR', 'Afeganistão', 1);
INSERT INTO `country_translations` VALUES (4337, 'pt_BR', 'Ilhas Åland', 2);
INSERT INTO `country_translations` VALUES (4338, 'pt_BR', 'Albânia', 3);
INSERT INTO `country_translations` VALUES (4339, 'pt_BR', 'Argélia', 4);
INSERT INTO `country_translations` VALUES (4340, 'pt_BR', 'Samoa Americana', 5);
INSERT INTO `country_translations` VALUES (4341, 'pt_BR', 'Andorra', 6);
INSERT INTO `country_translations` VALUES (4342, 'pt_BR', 'Angola', 7);
INSERT INTO `country_translations` VALUES (4343, 'pt_BR', 'Angola', 8);
INSERT INTO `country_translations` VALUES (4344, 'pt_BR', 'Antártico', 9);
INSERT INTO `country_translations` VALUES (4345, 'pt_BR', 'Antígua e Barbuda', 10);
INSERT INTO `country_translations` VALUES (4346, 'pt_BR', 'Argentina', 11);
INSERT INTO `country_translations` VALUES (4347, 'pt_BR', 'Armênia', 12);
INSERT INTO `country_translations` VALUES (4348, 'pt_BR', 'Aruba', 13);
INSERT INTO `country_translations` VALUES (4349, 'pt_BR', 'Ilha de escalada', 14);
INSERT INTO `country_translations` VALUES (4350, 'pt_BR', 'Austrália', 15);
INSERT INTO `country_translations` VALUES (4351, 'pt_BR', 'Áustria', 16);
INSERT INTO `country_translations` VALUES (4352, 'pt_BR', 'Azerbaijão', 17);
INSERT INTO `country_translations` VALUES (4353, 'pt_BR', 'Bahamas', 18);
INSERT INTO `country_translations` VALUES (4354, 'pt_BR', 'Bahrain', 19);
INSERT INTO `country_translations` VALUES (4355, 'pt_BR', 'Bangladesh', 20);
INSERT INTO `country_translations` VALUES (4356, 'pt_BR', 'Barbados', 21);
INSERT INTO `country_translations` VALUES (4357, 'pt_BR', 'Bielorrússia', 22);
INSERT INTO `country_translations` VALUES (4358, 'pt_BR', 'Bélgica', 23);
INSERT INTO `country_translations` VALUES (4359, 'pt_BR', 'Bélgica', 24);
INSERT INTO `country_translations` VALUES (4360, 'pt_BR', 'Benin', 25);
INSERT INTO `country_translations` VALUES (4361, 'pt_BR', 'Bermuda', 26);
INSERT INTO `country_translations` VALUES (4362, 'pt_BR', 'Butão', 27);
INSERT INTO `country_translations` VALUES (4363, 'pt_BR', 'Bolívia', 28);
INSERT INTO `country_translations` VALUES (4364, 'pt_BR', 'Bósnia e Herzegovina', 29);
INSERT INTO `country_translations` VALUES (4365, 'pt_BR', 'Botsuana', 30);
INSERT INTO `country_translations` VALUES (4366, 'pt_BR', 'Brasil', 31);
INSERT INTO `country_translations` VALUES (4367, 'pt_BR', 'Território Britânico do Oceano Índico', 32);
INSERT INTO `country_translations` VALUES (4368, 'pt_BR', 'Ilhas Virgens Britânicas', 33);
INSERT INTO `country_translations` VALUES (4369, 'pt_BR', 'Brunei', 34);
INSERT INTO `country_translations` VALUES (4370, 'pt_BR', 'Bulgária', 35);
INSERT INTO `country_translations` VALUES (4371, 'pt_BR', 'Burkina Faso', 36);
INSERT INTO `country_translations` VALUES (4372, 'pt_BR', 'Burundi', 37);
INSERT INTO `country_translations` VALUES (4373, 'pt_BR', 'Camboja', 38);
INSERT INTO `country_translations` VALUES (4374, 'pt_BR', 'Camarões', 39);
INSERT INTO `country_translations` VALUES (4375, 'pt_BR', 'Canadá', 40);
INSERT INTO `country_translations` VALUES (4376, 'pt_BR', 'Ilhas Canárias', 41);
INSERT INTO `country_translations` VALUES (4377, 'pt_BR', 'Cabo Verde', 42);
INSERT INTO `country_translations` VALUES (4378, 'pt_BR', 'Holanda do Caribe', 43);
INSERT INTO `country_translations` VALUES (4379, 'pt_BR', 'Ilhas Cayman', 44);
INSERT INTO `country_translations` VALUES (4380, 'pt_BR', 'República Centro-Africana', 45);
INSERT INTO `country_translations` VALUES (4381, 'pt_BR', 'Ceuta e Melilla', 46);
INSERT INTO `country_translations` VALUES (4382, 'pt_BR', 'Chade', 47);
INSERT INTO `country_translations` VALUES (4383, 'pt_BR', 'Chile', 48);
INSERT INTO `country_translations` VALUES (4384, 'pt_BR', 'China', 49);
INSERT INTO `country_translations` VALUES (4385, 'pt_BR', 'Ilha Christmas', 50);
INSERT INTO `country_translations` VALUES (4386, 'pt_BR', 'Ilhas Cocos (Keeling)', 51);
INSERT INTO `country_translations` VALUES (4387, 'pt_BR', 'Colômbia', 52);
INSERT INTO `country_translations` VALUES (4388, 'pt_BR', 'Comores', 53);
INSERT INTO `country_translations` VALUES (4389, 'pt_BR', 'Congo - Brazzaville', 54);
INSERT INTO `country_translations` VALUES (4390, 'pt_BR', 'Congo - Kinshasa', 55);
INSERT INTO `country_translations` VALUES (4391, 'pt_BR', 'Ilhas Cook', 56);
INSERT INTO `country_translations` VALUES (4392, 'pt_BR', 'Costa Rica', 57);
INSERT INTO `country_translations` VALUES (4393, 'pt_BR', 'Costa do Marfim', 58);
INSERT INTO `country_translations` VALUES (4394, 'pt_BR', 'Croácia', 59);
INSERT INTO `country_translations` VALUES (4395, 'pt_BR', 'Cuba', 60);
INSERT INTO `country_translations` VALUES (4396, 'pt_BR', 'Curaçao', 61);
INSERT INTO `country_translations` VALUES (4397, 'pt_BR', 'Chipre', 62);
INSERT INTO `country_translations` VALUES (4398, 'pt_BR', 'Czechia', 63);
INSERT INTO `country_translations` VALUES (4399, 'pt_BR', 'Dinamarca', 64);
INSERT INTO `country_translations` VALUES (4400, 'pt_BR', 'Diego Garcia', 65);
INSERT INTO `country_translations` VALUES (4401, 'pt_BR', 'Djibuti', 66);
INSERT INTO `country_translations` VALUES (4402, 'pt_BR', 'Dominica', 67);
INSERT INTO `country_translations` VALUES (4403, 'pt_BR', 'República Dominicana', 68);
INSERT INTO `country_translations` VALUES (4404, 'pt_BR', 'Equador', 69);
INSERT INTO `country_translations` VALUES (4405, 'pt_BR', 'Egito', 70);
INSERT INTO `country_translations` VALUES (4406, 'pt_BR', 'El Salvador', 71);
INSERT INTO `country_translations` VALUES (4407, 'pt_BR', 'Guiné Equatorial', 72);
INSERT INTO `country_translations` VALUES (4408, 'pt_BR', 'Eritreia', 73);
INSERT INTO `country_translations` VALUES (4409, 'pt_BR', 'Estônia', 74);
INSERT INTO `country_translations` VALUES (4410, 'pt_BR', 'Etiópia', 75);
INSERT INTO `country_translations` VALUES (4411, 'pt_BR', 'Zona Euro', 76);
INSERT INTO `country_translations` VALUES (4412, 'pt_BR', 'Ilhas Malvinas', 77);
INSERT INTO `country_translations` VALUES (4413, 'pt_BR', 'Ilhas Faroe', 78);
INSERT INTO `country_translations` VALUES (4414, 'pt_BR', 'Fiji', 79);
INSERT INTO `country_translations` VALUES (4415, 'pt_BR', 'Finlândia', 80);
INSERT INTO `country_translations` VALUES (4416, 'pt_BR', 'França', 81);
INSERT INTO `country_translations` VALUES (4417, 'pt_BR', 'Guiana Francesa', 82);
INSERT INTO `country_translations` VALUES (4418, 'pt_BR', 'Polinésia Francesa', 83);
INSERT INTO `country_translations` VALUES (4419, 'pt_BR', 'Territórios Franceses do Sul', 84);
INSERT INTO `country_translations` VALUES (4420, 'pt_BR', 'Gabão', 85);
INSERT INTO `country_translations` VALUES (4421, 'pt_BR', 'Gâmbia', 86);
INSERT INTO `country_translations` VALUES (4422, 'pt_BR', 'Geórgia', 87);
INSERT INTO `country_translations` VALUES (4423, 'pt_BR', 'Alemanha', 88);
INSERT INTO `country_translations` VALUES (4424, 'pt_BR', 'Gana', 89);
INSERT INTO `country_translations` VALUES (4425, 'pt_BR', 'Gibraltar', 90);
INSERT INTO `country_translations` VALUES (4426, 'pt_BR', 'Grécia', 91);
INSERT INTO `country_translations` VALUES (4427, 'pt_BR', 'Gronelândia', 92);
INSERT INTO `country_translations` VALUES (4428, 'pt_BR', 'Granada', 93);
INSERT INTO `country_translations` VALUES (4429, 'pt_BR', 'Guadalupe', 94);
INSERT INTO `country_translations` VALUES (4430, 'pt_BR', 'Guam', 95);
INSERT INTO `country_translations` VALUES (4431, 'pt_BR', 'Guatemala', 96);
INSERT INTO `country_translations` VALUES (4432, 'pt_BR', 'Guernsey', 97);
INSERT INTO `country_translations` VALUES (4433, 'pt_BR', 'Guiné', 98);
INSERT INTO `country_translations` VALUES (4434, 'pt_BR', 'Guiné-Bissau', 99);
INSERT INTO `country_translations` VALUES (4435, 'pt_BR', 'Guiana', 100);
INSERT INTO `country_translations` VALUES (4436, 'pt_BR', 'Haiti', 101);
INSERT INTO `country_translations` VALUES (4437, 'pt_BR', 'Honduras', 102);
INSERT INTO `country_translations` VALUES (4438, 'pt_BR', 'Região Administrativa Especial de Hong Kong, China', 103);
INSERT INTO `country_translations` VALUES (4439, 'pt_BR', 'Hungria', 104);
INSERT INTO `country_translations` VALUES (4440, 'pt_BR', 'Islândia', 105);
INSERT INTO `country_translations` VALUES (4441, 'pt_BR', 'Índia', 106);
INSERT INTO `country_translations` VALUES (4442, 'pt_BR', 'Indonésia', 107);
INSERT INTO `country_translations` VALUES (4443, 'pt_BR', 'Irã', 108);
INSERT INTO `country_translations` VALUES (4444, 'pt_BR', 'Iraque', 109);
INSERT INTO `country_translations` VALUES (4445, 'pt_BR', 'Irlanda', 110);
INSERT INTO `country_translations` VALUES (4446, 'pt_BR', 'Ilha de Man', 111);
INSERT INTO `country_translations` VALUES (4447, 'pt_BR', 'Israel', 112);
INSERT INTO `country_translations` VALUES (4448, 'pt_BR', 'Itália', 113);
INSERT INTO `country_translations` VALUES (4449, 'pt_BR', 'Jamaica', 114);
INSERT INTO `country_translations` VALUES (4450, 'pt_BR', 'Japão', 115);
INSERT INTO `country_translations` VALUES (4451, 'pt_BR', 'Jersey', 116);
INSERT INTO `country_translations` VALUES (4452, 'pt_BR', 'Jordânia', 117);
INSERT INTO `country_translations` VALUES (4453, 'pt_BR', 'Cazaquistão', 118);
INSERT INTO `country_translations` VALUES (4454, 'pt_BR', 'Quênia', 119);
INSERT INTO `country_translations` VALUES (4455, 'pt_BR', 'Quiribati', 120);
INSERT INTO `country_translations` VALUES (4456, 'pt_BR', 'Kosovo', 121);
INSERT INTO `country_translations` VALUES (4457, 'pt_BR', 'Kuwait', 122);
INSERT INTO `country_translations` VALUES (4458, 'pt_BR', 'Quirguistão', 123);
INSERT INTO `country_translations` VALUES (4459, 'pt_BR', 'Laos', 124);
INSERT INTO `country_translations` VALUES (4460, 'pt_BR', 'Letônia', 125);
INSERT INTO `country_translations` VALUES (4461, 'pt_BR', 'Líbano', 126);
INSERT INTO `country_translations` VALUES (4462, 'pt_BR', 'Lesoto', 127);
INSERT INTO `country_translations` VALUES (4463, 'pt_BR', 'Libéria', 128);
INSERT INTO `country_translations` VALUES (4464, 'pt_BR', 'Líbia', 129);
INSERT INTO `country_translations` VALUES (4465, 'pt_BR', 'Liechtenstein', 130);
INSERT INTO `country_translations` VALUES (4466, 'pt_BR', 'Lituânia', 131);
INSERT INTO `country_translations` VALUES (4467, 'pt_BR', 'Luxemburgo', 132);
INSERT INTO `country_translations` VALUES (4468, 'pt_BR', 'Macau SAR China', 133);
INSERT INTO `country_translations` VALUES (4469, 'pt_BR', 'Macedônia', 134);
INSERT INTO `country_translations` VALUES (4470, 'pt_BR', 'Madagascar', 135);
INSERT INTO `country_translations` VALUES (4471, 'pt_BR', 'Malawi', 136);
INSERT INTO `country_translations` VALUES (4472, 'pt_BR', 'Malásia', 137);
INSERT INTO `country_translations` VALUES (4473, 'pt_BR', 'Maldivas', 138);
INSERT INTO `country_translations` VALUES (4474, 'pt_BR', 'Mali', 139);
INSERT INTO `country_translations` VALUES (4475, 'pt_BR', 'Malta', 140);
INSERT INTO `country_translations` VALUES (4476, 'pt_BR', 'Ilhas Marshall', 141);
INSERT INTO `country_translations` VALUES (4477, 'pt_BR', 'Martinica', 142);
INSERT INTO `country_translations` VALUES (4478, 'pt_BR', 'Mauritânia', 143);
INSERT INTO `country_translations` VALUES (4479, 'pt_BR', 'Maurício', 144);
INSERT INTO `country_translations` VALUES (4480, 'pt_BR', 'Maiote', 145);
INSERT INTO `country_translations` VALUES (4481, 'pt_BR', 'México', 146);
INSERT INTO `country_translations` VALUES (4482, 'pt_BR', 'Micronésia', 147);
INSERT INTO `country_translations` VALUES (4483, 'pt_BR', 'Moldávia', 148);
INSERT INTO `country_translations` VALUES (4484, 'pt_BR', 'Mônaco', 149);
INSERT INTO `country_translations` VALUES (4485, 'pt_BR', 'Mongólia', 150);
INSERT INTO `country_translations` VALUES (4486, 'pt_BR', 'Montenegro', 151);
INSERT INTO `country_translations` VALUES (4487, 'pt_BR', 'Montserrat', 152);
INSERT INTO `country_translations` VALUES (4488, 'pt_BR', 'Marrocos', 153);
INSERT INTO `country_translations` VALUES (4489, 'pt_BR', 'Moçambique', 154);
INSERT INTO `country_translations` VALUES (4490, 'pt_BR', 'Mianmar (Birmânia)', 155);
INSERT INTO `country_translations` VALUES (4491, 'pt_BR', 'Namíbia', 156);
INSERT INTO `country_translations` VALUES (4492, 'pt_BR', 'Nauru', 157);
INSERT INTO `country_translations` VALUES (4493, 'pt_BR', 'Nepal', 158);
INSERT INTO `country_translations` VALUES (4494, 'pt_BR', 'Holanda', 159);
INSERT INTO `country_translations` VALUES (4495, 'pt_BR', 'Nova Caledônia', 160);
INSERT INTO `country_translations` VALUES (4496, 'pt_BR', 'Nova Zelândia', 161);
INSERT INTO `country_translations` VALUES (4497, 'pt_BR', 'Nicarágua', 162);
INSERT INTO `country_translations` VALUES (4498, 'pt_BR', 'Níger', 163);
INSERT INTO `country_translations` VALUES (4499, 'pt_BR', 'Nigéria', 164);
INSERT INTO `country_translations` VALUES (4500, 'pt_BR', 'Niue', 165);
INSERT INTO `country_translations` VALUES (4501, 'pt_BR', 'Ilha Norfolk', 166);
INSERT INTO `country_translations` VALUES (4502, 'pt_BR', 'Coréia do Norte', 167);
INSERT INTO `country_translations` VALUES (4503, 'pt_BR', 'Ilhas Marianas do Norte', 168);
INSERT INTO `country_translations` VALUES (4504, 'pt_BR', 'Noruega', 169);
INSERT INTO `country_translations` VALUES (4505, 'pt_BR', 'Omã', 170);
INSERT INTO `country_translations` VALUES (4506, 'pt_BR', 'Paquistão', 171);
INSERT INTO `country_translations` VALUES (4507, 'pt_BR', 'Palau', 172);
INSERT INTO `country_translations` VALUES (4508, 'pt_BR', 'Territórios Palestinos', 173);
INSERT INTO `country_translations` VALUES (4509, 'pt_BR', 'Panamá', 174);
INSERT INTO `country_translations` VALUES (4510, 'pt_BR', 'Papua Nova Guiné', 175);
INSERT INTO `country_translations` VALUES (4511, 'pt_BR', 'Paraguai', 176);
INSERT INTO `country_translations` VALUES (4512, 'pt_BR', 'Peru', 177);
INSERT INTO `country_translations` VALUES (4513, 'pt_BR', 'Filipinas', 178);
INSERT INTO `country_translations` VALUES (4514, 'pt_BR', 'Ilhas Pitcairn', 179);
INSERT INTO `country_translations` VALUES (4515, 'pt_BR', 'Polônia', 180);
INSERT INTO `country_translations` VALUES (4516, 'pt_BR', 'Portugal', 181);
INSERT INTO `country_translations` VALUES (4517, 'pt_BR', 'Porto Rico', 182);
INSERT INTO `country_translations` VALUES (4518, 'pt_BR', 'Catar', 183);
INSERT INTO `country_translations` VALUES (4519, 'pt_BR', 'Reunião', 184);
INSERT INTO `country_translations` VALUES (4520, 'pt_BR', 'Romênia', 185);
INSERT INTO `country_translations` VALUES (4521, 'pt_BR', 'Rússia', 186);
INSERT INTO `country_translations` VALUES (4522, 'pt_BR', 'Ruanda', 187);
INSERT INTO `country_translations` VALUES (4523, 'pt_BR', 'Samoa', 188);
INSERT INTO `country_translations` VALUES (4524, 'pt_BR', 'São Marinho', 189);
INSERT INTO `country_translations` VALUES (4525, 'pt_BR', 'São Cristóvão e Nevis', 190);
INSERT INTO `country_translations` VALUES (4526, 'pt_BR', 'Arábia Saudita', 191);
INSERT INTO `country_translations` VALUES (4527, 'pt_BR', 'Senegal', 192);
INSERT INTO `country_translations` VALUES (4528, 'pt_BR', 'Sérvia', 193);
INSERT INTO `country_translations` VALUES (4529, 'pt_BR', 'Seychelles', 194);
INSERT INTO `country_translations` VALUES (4530, 'pt_BR', 'Serra Leoa', 195);
INSERT INTO `country_translations` VALUES (4531, 'pt_BR', 'Cingapura', 196);
INSERT INTO `country_translations` VALUES (4532, 'pt_BR', 'São Martinho', 197);
INSERT INTO `country_translations` VALUES (4533, 'pt_BR', 'Eslováquia', 198);
INSERT INTO `country_translations` VALUES (4534, 'pt_BR', 'Eslovênia', 199);
INSERT INTO `country_translations` VALUES (4535, 'pt_BR', 'Ilhas Salomão', 200);
INSERT INTO `country_translations` VALUES (4536, 'pt_BR', 'Somália', 201);
INSERT INTO `country_translations` VALUES (4537, 'pt_BR', 'África do Sul', 202);
INSERT INTO `country_translations` VALUES (4538, 'pt_BR', 'Ilhas Geórgia do Sul e Sandwich do Sul', 203);
INSERT INTO `country_translations` VALUES (4539, 'pt_BR', 'Coréia do Sul', 204);
INSERT INTO `country_translations` VALUES (4540, 'pt_BR', 'Sudão do Sul', 205);
INSERT INTO `country_translations` VALUES (4541, 'pt_BR', 'Espanha', 206);
INSERT INTO `country_translations` VALUES (4542, 'pt_BR', 'Sri Lanka', 207);
INSERT INTO `country_translations` VALUES (4543, 'pt_BR', 'São Bartolomeu', 208);
INSERT INTO `country_translations` VALUES (4544, 'pt_BR', 'Santa Helena', 209);
INSERT INTO `country_translations` VALUES (4545, 'pt_BR', 'São Cristóvão e Nevis', 210);
INSERT INTO `country_translations` VALUES (4546, 'pt_BR', 'Santa Lúcia', 211);
INSERT INTO `country_translations` VALUES (4547, 'pt_BR', 'São Martinho', 212);
INSERT INTO `country_translations` VALUES (4548, 'pt_BR', 'São Pedro e Miquelon', 213);
INSERT INTO `country_translations` VALUES (4549, 'pt_BR', 'São Vicente e Granadinas', 214);
INSERT INTO `country_translations` VALUES (4550, 'pt_BR', 'Sudão', 215);
INSERT INTO `country_translations` VALUES (4551, 'pt_BR', 'Suriname', 216);
INSERT INTO `country_translations` VALUES (4552, 'pt_BR', 'Svalbard e Jan Mayen', 217);
INSERT INTO `country_translations` VALUES (4553, 'pt_BR', 'Suazilândia', 218);
INSERT INTO `country_translations` VALUES (4554, 'pt_BR', 'Suécia', 219);
INSERT INTO `country_translations` VALUES (4555, 'pt_BR', 'Suíça', 220);
INSERT INTO `country_translations` VALUES (4556, 'pt_BR', 'Síria', 221);
INSERT INTO `country_translations` VALUES (4557, 'pt_BR', 'Taiwan', 222);
INSERT INTO `country_translations` VALUES (4558, 'pt_BR', 'Tajiquistão', 223);
INSERT INTO `country_translations` VALUES (4559, 'pt_BR', 'Tanzânia', 224);
INSERT INTO `country_translations` VALUES (4560, 'pt_BR', 'Tailândia', 225);
INSERT INTO `country_translations` VALUES (4561, 'pt_BR', 'Timor-Leste', 226);
INSERT INTO `country_translations` VALUES (4562, 'pt_BR', 'Togo', 227);
INSERT INTO `country_translations` VALUES (4563, 'pt_BR', 'Tokelau', 228);
INSERT INTO `country_translations` VALUES (4564, 'pt_BR', 'Tonga', 229);
INSERT INTO `country_translations` VALUES (4565, 'pt_BR', 'Trinidad e Tobago', 230);
INSERT INTO `country_translations` VALUES (4566, 'pt_BR', 'Tristan da Cunha', 231);
INSERT INTO `country_translations` VALUES (4567, 'pt_BR', 'Tunísia', 232);
INSERT INTO `country_translations` VALUES (4568, 'pt_BR', 'Turquia', 233);
INSERT INTO `country_translations` VALUES (4569, 'pt_BR', 'Turquemenistão', 234);
INSERT INTO `country_translations` VALUES (4570, 'pt_BR', 'Ilhas Turks e Caicos', 235);
INSERT INTO `country_translations` VALUES (4571, 'pt_BR', 'Tuvalu', 236);
INSERT INTO `country_translations` VALUES (4572, 'pt_BR', 'Ilhas periféricas dos EUA', 237);
INSERT INTO `country_translations` VALUES (4573, 'pt_BR', 'Ilhas Virgens dos EUA', 238);
INSERT INTO `country_translations` VALUES (4574, 'pt_BR', 'Uganda', 239);
INSERT INTO `country_translations` VALUES (4575, 'pt_BR', 'Ucrânia', 240);
INSERT INTO `country_translations` VALUES (4576, 'pt_BR', 'Emirados Árabes Unidos', 241);
INSERT INTO `country_translations` VALUES (4577, 'pt_BR', 'Reino Unido', 242);
INSERT INTO `country_translations` VALUES (4578, 'pt_BR', 'Nações Unidas', 243);
INSERT INTO `country_translations` VALUES (4579, 'pt_BR', 'Estados Unidos', 244);
INSERT INTO `country_translations` VALUES (4580, 'pt_BR', 'Uruguai', 245);
INSERT INTO `country_translations` VALUES (4581, 'pt_BR', 'Uzbequistão', 246);
INSERT INTO `country_translations` VALUES (4582, 'pt_BR', 'Vanuatu', 247);
INSERT INTO `country_translations` VALUES (4583, 'pt_BR', 'Cidade do Vaticano', 248);
INSERT INTO `country_translations` VALUES (4584, 'pt_BR', 'Venezuela', 249);
INSERT INTO `country_translations` VALUES (4585, 'pt_BR', 'Vietnã', 250);
INSERT INTO `country_translations` VALUES (4586, 'pt_BR', 'Wallis e Futuna', 251);
INSERT INTO `country_translations` VALUES (4587, 'pt_BR', 'Saara Ocidental', 252);
INSERT INTO `country_translations` VALUES (4588, 'pt_BR', 'Iêmen', 253);
INSERT INTO `country_translations` VALUES (4589, 'pt_BR', 'Zâmbia', 254);
INSERT INTO `country_translations` VALUES (4590, 'pt_BR', 'Zimbábue', 255);
COMMIT;

-- ----------------------------
-- Table structure for credit_card_registrations
-- ----------------------------
DROP TABLE IF EXISTS `credit_card_registrations`;
CREATE TABLE `credit_card_registrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_card` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Male',
  `year_of_birth` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `city_id` int(10) unsigned DEFAULT NULL,
  `belongs_to_company` int(11) NOT NULL,
  `farmer_type` int(11) NOT NULL,
  `crop_type_id` bigint(20) unsigned DEFAULT NULL,
  `weight_of_main_crop_production` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_crop` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `animal_id` bigint(20) unsigned DEFAULT NULL,
  `number_of_animals` int(11) DEFAULT NULL,
  `profit_per_year` int(11) NOT NULL,
  `other_job` tinyint(1) NOT NULL,
  `other_job_profit` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 - disapprove, 2 - pending, 3 - approve',
  PRIMARY KEY (`id`),
  KEY `credit_card_registrations_customer_id_foreign` (`customer_id`),
  KEY `credit_card_registrations_city_id_foreign` (`city_id`),
  KEY `credit_card_registrations_crop_type_id_foreign` (`crop_type_id`),
  KEY `credit_card_registrations_animal_id_foreign` (`animal_id`),
  CONSTRAINT `credit_card_registrations_animal_id_foreign` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`) ON DELETE SET NULL,
  CONSTRAINT `credit_card_registrations_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE SET NULL,
  CONSTRAINT `credit_card_registrations_crop_type_id_foreign` FOREIGN KEY (`crop_type_id`) REFERENCES `crop_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `credit_card_registrations_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of credit_card_registrations
-- ----------------------------
BEGIN;
INSERT INTO `credit_card_registrations` VALUES (5, NULL, 'represent', 'asmdasmd', 'Male', '2021-05-10 22:27:41', 6, 1, 1, 4, '200', 'ok', 1, 0, 1, 2, 3, '2021-05-10 22:23:10', '2021-05-10 22:23:10', 2);
COMMIT;

-- ----------------------------
-- Table structure for crop_type_translations
-- ----------------------------
DROP TABLE IF EXISTS `crop_type_translations`;
CREATE TABLE `crop_type_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crop_type_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `crop_type_translations_crop_type_id_foreign` (`crop_type_id`),
  CONSTRAINT `crop_type_translations_crop_type_id_foreign` FOREIGN KEY (`crop_type_id`) REFERENCES `crop_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of crop_type_translations
-- ----------------------------
BEGIN;
INSERT INTO `crop_type_translations` VALUES (1, 'en', 1, 'Flower');
INSERT INTO `crop_type_translations` VALUES (2, 'en', 2, 'Flower 1');
INSERT INTO `crop_type_translations` VALUES (3, 'en', 3, 'Flower 2');
INSERT INTO `crop_type_translations` VALUES (4, 'en', 4, 'Flower 3');
INSERT INTO `crop_type_translations` VALUES (5, 'en', 5, 'Tea');
INSERT INTO `crop_type_translations` VALUES (6, 'en', 6, 'Tea 1');
INSERT INTO `crop_type_translations` VALUES (7, 'en', 7, 'Tea 2');
INSERT INTO `crop_type_translations` VALUES (8, 'en', 8, 'Tea 3');
INSERT INTO `crop_type_translations` VALUES (9, 'en', 9, 'Coffee');
INSERT INTO `crop_type_translations` VALUES (10, 'en', 10, 'Coffee 1');
INSERT INTO `crop_type_translations` VALUES (11, 'vi', 8, 'khac');
COMMIT;

-- ----------------------------
-- Table structure for crop_types
-- ----------------------------
DROP TABLE IF EXISTS `crop_types`;
CREATE TABLE `crop_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of crop_types
-- ----------------------------
BEGIN;
INSERT INTO `crop_types` VALUES (1, NULL, 0, '2021-06-26 23:18:28', '2021-06-26 23:18:28');
INSERT INTO `crop_types` VALUES (2, NULL, 0, '2021-06-26 23:18:28', '2021-06-26 23:18:28');
INSERT INTO `crop_types` VALUES (3, NULL, 0, '2021-06-26 23:18:28', '2021-06-26 23:18:28');
INSERT INTO `crop_types` VALUES (4, NULL, 0, '2021-06-26 23:18:28', '2021-06-26 23:18:28');
INSERT INTO `crop_types` VALUES (5, NULL, 0, '2021-06-26 23:18:28', '2021-06-26 23:18:28');
INSERT INTO `crop_types` VALUES (6, NULL, 0, '2021-06-26 23:18:28', '2021-06-26 23:18:28');
INSERT INTO `crop_types` VALUES (7, NULL, 0, '2021-06-26 23:18:28', '2021-06-26 23:18:28');
INSERT INTO `crop_types` VALUES (8, NULL, 0, '2021-06-26 23:18:28', '2021-06-26 23:18:28');
INSERT INTO `crop_types` VALUES (9, NULL, 0, '2021-06-26 23:18:28', '2021-06-26 23:18:28');
INSERT INTO `crop_types` VALUES (10, NULL, 0, '2021-06-26 23:18:28', '2021-06-26 23:18:28');
COMMIT;

-- ----------------------------
-- Table structure for currencies
-- ----------------------------
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of currencies
-- ----------------------------
BEGIN;
INSERT INTO `currencies` VALUES (1, 'USD', 'US Dollar', NULL, NULL, '$');
INSERT INTO `currencies` VALUES (2, 'EUR', 'Euro', NULL, NULL, '€');
COMMIT;

-- ----------------------------
-- Table structure for currency_exchange_rates
-- ----------------------------
DROP TABLE IF EXISTS `currency_exchange_rates`;
CREATE TABLE `currency_exchange_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`),
  CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of currency_exchange_rates
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for customer_groups
-- ----------------------------
DROP TABLE IF EXISTS `customer_groups`;
CREATE TABLE `customer_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_groups_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of customer_groups
-- ----------------------------
BEGIN;
INSERT INTO `customer_groups` VALUES (1, 'Guest', 0, NULL, NULL, 'guest');
INSERT INTO `customer_groups` VALUES (2, 'General', 0, NULL, NULL, 'general');
INSERT INTO `customer_groups` VALUES (3, 'Wholesale', 0, NULL, NULL, 'wholesale');
COMMIT;

-- ----------------------------
-- Table structure for customer_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `customer_password_resets`;
CREATE TABLE `customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `customer_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of customer_password_resets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for customer_sellers
-- ----------------------------
DROP TABLE IF EXISTS `customer_sellers`;
CREATE TABLE `customer_sellers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `seller_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_sellers_seller_id_index` (`seller_id`),
  KEY `customer_sellers_customer_id_index` (`customer_id`),
  CONSTRAINT `customer_sellers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `customer_sellers_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of customer_sellers
-- ----------------------------
BEGIN;
INSERT INTO `customer_sellers` VALUES (23, 95, 93, 0, NULL, NULL);
INSERT INTO `customer_sellers` VALUES (25, 95, 96, 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for customer_social_accounts
-- ----------------------------
DROP TABLE IF EXISTS `customer_social_accounts`;
CREATE TABLE `customer_social_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provider_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  KEY `customer_social_accounts_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of customer_social_accounts
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int(10) unsigned DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag_agent` tinyint(1) NOT NULL DEFAULT '0',
  `agent_parent_id` int(10) unsigned DEFAULT NULL,
  `represent_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag_seller` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  UNIQUE KEY `customers_api_token_unique` (`api_token`),
  UNIQUE KEY `customers_phone_unique` (`phone`),
  KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  KEY `customers_agent_parent_id_foreign` (`agent_parent_id`),
  CONSTRAINT `customers_agent_parent_id_foreign` FOREIGN KEY (`agent_parent_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of customers
-- ----------------------------
BEGIN;
INSERT INTO `customers` VALUES (1, 'test truong', '', 'Male', '2021-03-01', 'truong@gmail.com', 1, '$2y$10$jzBH/RG.LBgCJog/xG3xe.rf2I57Qe1xzG0L4dNiLUOvwnGkVLHCO', NULL, 2, 0, NULL, '2021-03-31 04:00:11', '2021-09-30 12:12:50', 1, NULL, 'ok\r\n', '0707944744', 1, 106, 'agent', NULL, 0);
INSERT INTO `customers` VALUES (93, 'Vũ Sơn', NULL, 'Male', NULL, 'vuson@gmail.com', 1, '$2y$10$2hZJdEffsiFzqsYVKWEWCexvDXpNKUAAxqEa2KTEv5AGGFAax37H.', 'KXMabou6UAcZqPl4Cia3n1YS15zqwQDR70quDm5fPJLpBJB1Fn98PAa5SFaVJKJVMVqWgFGwMWXFXCRy', 2, 0, NULL, '2021-04-10 10:04:10', '2021-09-30 12:18:52', 1, '40940981b482c4f8785d636963f68aae', NULL, '0123456789', 1, NULL, 'agent zalo', '', 0);
INSERT INTO `customers` VALUES (95, 'truong cac', '', 'Female', '0000-00-00', 'vutruong@gmail.com', 1, '$2y$10$k3pr95kOlR4d6SRxgVYT3uOhydROs3hBK3JWfExOQ7TR3c6BXMDSe', NULL, 2, 0, NULL, '2021-04-12 08:09:24', '2021-09-14 23:05:00', 1, NULL, NULL, '0707944747', 0, NULL, NULL, NULL, 1);
INSERT INTO `customers` VALUES (96, 'yara', 'ra', 'Male', '0000-00-00', 'yara@gmail.com', 1, '$2y$10$0Wn8GLEs3w/0z9ht.uMW8.dJ4aRhla8e1wCyc9feaOxLbdjaxaWG6', NULL, 2, 0, NULL, '2021-04-16 11:17:26', '2021-04-19 05:41:33', 1, NULL, NULL, '0707944748', 0, NULL, NULL, NULL, 1);
INSERT INTO `customers` VALUES (97, 'du ma', NULL, 'Male', NULL, 'shop@gmail.com', 1, '$2y$10$jTZAzdYpMWCw4Yp5128AWu4co0iiBp54J2nVeaoP6xo3t7xo6sBWy', NULL, NULL, 0, NULL, '2021-04-19 05:52:36', '2021-05-18 21:45:02', 1, NULL, NULL, '0707944749', 0, NULL, '', '', 1);
INSERT INTO `customers` VALUES (106, 'agent ok', '', 'Male', NULL, 'agent@kilimo.vn', 1, '$2y$10$rTiXRH6g57y8WlpPET4KU.PsH0VphwuTbcyUK6jSB89VJ/SnLyv/K', 'ZETHXYJ9ST13syyShpLbCkoGaEoz8FpHr45gWhx7U0yJoYfsTfBrB91siZn4iKZo9kyYPMvI95j47ZxP', 2, 0, NULL, '2021-06-16 21:15:41', '2021-09-19 22:54:29', 1, '0a3e4b93a58788a0af6f5e7d8ea460cf', NULL, '0707944742', 1, NULL, 'represent', NULL, 0);
INSERT INTO `customers` VALUES (112, 'success', NULL, NULL, NULL, NULL, 1, '$2y$10$2hZJdEffsiFzqsYVKWEWCexvDXpNKUAAxqEa2KTEv5AGGFAax37H.', 'OH2jyYrq0M7rPiRMOUu7aNqdk1EdiuMj281orasdkslLTVs9Fy21UbLuZcsHCTSvHKoOTUFnMO16WaF8', 2, 0, NULL, '2021-06-20 14:21:49', '2021-06-20 14:21:49', 1, '3cf25c40d76991bd6e010d2dc188ff43', NULL, 'a', 0, NULL, NULL, NULL, 0);
INSERT INTO `customers` VALUES (113, 'full name', NULL, NULL, NULL, NULL, 1, '$2y$10$Kaewd3ZGQ36PLa4HxegXWOmBaJEt9IT8TL9mrYBLynYoZfsg5bg1S', 'qj3COJYR54455otsr3n4GIpFZTubf6aVFtiHn8eXKiC8okpXDU8rhnNGbffu4jp88ClDCgWEFMClNVoX', 2, 0, NULL, '2021-06-20 16:39:47', '2021-06-20 16:39:47', 1, 'e3baab569929411b20ccd07d886cbfb1', NULL, '0707944740', 0, NULL, NULL, NULL, 0);
INSERT INTO `customers` VALUES (114, 'ok', NULL, 'Male', NULL, NULL, 1, '$2y$10$2hZJdEffsiFzqsYVKWEWCexvDXpNKUAAxqEa2KTEv5AGGFAax37H.', 'KJNT61bmDnYjSHx4ajij7cb2EpBLncZH8iFflw46N8Ene5yYiNnhTfny4RLSUnXmqMpGXfyHCOpphCIb', 2, 0, NULL, '2021-06-20 16:42:03', '2021-09-30 13:26:23', 1, 'd0a83b3d153b3a32ce565a53c0d72fe6', NULL, '0707944741', 1, NULL, 'agent', NULL, 0);
INSERT INTO `customers` VALUES (115, 'okok', NULL, NULL, NULL, NULL, 1, '$2y$10$zH/1fsk0/CKGw2tCGlQCCeZdthAteJ.ITMtFDE/2l8rm.n/lM3ggq', 'nIXqhpicZTcmfQIKtO9j1lDARjqQ8i2IiXuid9lJ3yFN6lcWi6BlOJSUNNKNxrteGhpOelxoc3oktC6L', 2, 0, NULL, '2021-06-20 16:47:01', '2021-06-20 16:47:01', 1, '392e21550114b2af1aac434d8e3b98b6', NULL, '0707944743', 0, NULL, NULL, NULL, 0);
INSERT INTO `customers` VALUES (116, 'okok', NULL, NULL, NULL, NULL, 1, '$2y$10$DHUzZErPVR58S3W3apQ2n.Xtd1yy5JvVqY2gZymupuhukwlzk7I9q', 'jYmMNgoXW5p0OxBKgFe4HrE87vc3uypVkM5Og4vmkgBlgKzs5sGq487ngGOFBhYAvjRW4wtSv1DURQVG', 2, 0, NULL, '2021-06-20 16:50:26', '2021-06-20 16:50:26', 1, 'c50c36a0675dfb94f04d3ef1c5571732', NULL, '0747474745', 0, NULL, NULL, NULL, 0);
INSERT INTO `customers` VALUES (117, 'lala', NULL, NULL, NULL, NULL, 1, '$2y$10$rHPLtBMWzud5umY5na1vDOs7RsOJmq.KIM3JBK.E8cOGbmOLeTC0O', 'QjPZJwD8uL14zw36ESJprwhlRSNpbSDYGpgBewJy6y11OKXTVo5xORKhvFGmBvlxcZ5rSu6G3tMB7hHV', 2, 0, NULL, '2021-06-20 16:51:46', '2021-06-20 16:51:46', 1, '341c8c4b3215c10c9eb6c0e73da0cb2b', NULL, '0986757472', 0, NULL, NULL, NULL, 0);
INSERT INTO `customers` VALUES (119, 'okay man', NULL, NULL, NULL, NULL, 1, '$2y$10$tDq1DPwdh6G6XAzbvCOXa.VoRC3S2I93D2ZFpB5Dwg9nP9FhDCxhW', 'meUlnMqIKzkRx9Qd5sfci8HZ4fODrpLXEvxRpEDk4KLIavAjUJWqoyhPQU2UGJvt2xsAeT9FUsZ68s9k', 2, 0, NULL, '2021-06-20 16:54:32', '2021-06-20 16:54:32', 1, 'e1a37878d706765e0c17f7070937ab8b', NULL, '0707944767', 0, NULL, NULL, NULL, 0);
INSERT INTO `customers` VALUES (120, 'shop man', '', NULL, NULL, 'shopne@gmail.com', 1, '$2y$10$Q8zYj2AHTWp7yBK6Ca89IuvPPrRuJms3Ct8z68voO9SxyDISiRBuW', NULL, 2, 0, NULL, '2021-06-20 16:58:08', '2021-06-20 16:58:08', 1, NULL, NULL, '0707944723', 0, NULL, NULL, NULL, 1);
INSERT INTO `customers` VALUES (121, NULL, NULL, 'Male', NULL, NULL, 1, '$2y$10$uXHRxZpniQTzixPjwkTDmeK5RwsG4iVdZbS5cvHWSyr35ypGbcjCO', NULL, 2, 0, NULL, '2021-06-20 17:11:11', '2021-06-20 17:11:11', 1, NULL, NULL, '0707944755', 1, NULL, 'agent represent', NULL, 0);
INSERT INTO `customers` VALUES (122, 'ok', 'ok', 'Male', NULL, NULL, 1, '$2y$10$OUF8xjZQUR/zaOeHJ8HMZeQiXT/oeAm.YfwdMjWL2isJECw94ANfG\n\n\n\n\"\n>>>\n\n\n\n\n$2y$10$OUF8xjZQUR/zaOeHJ8HMZeQiXT/oeAm.YfwdMjWL2isJECw94ANfG', NULL, 2, 0, NULL, NULL, '2021-06-22 00:06:59', 1, NULL, NULL, '0702915674', 0, NULL, NULL, NULL, 0);
INSERT INTO `customers` VALUES (125, 'vu cong truong', NULL, 'Male', NULL, 'ok@gmail.com', 1, '$2y$10$2HiXxUsUuQwdnV3ZzrqcKOE0Bjg3GE0Ij2vV4tDcZqN9ZvRm3xu4C', '40ge7IyjLQxSKP24QQ2gH974FBaSWsmOKGb1oChew37I2EibNoxf9chRsrIO51qcrevyxmU7Pucv9OU1', 2, 0, NULL, '2021-09-30 13:42:37', '2021-10-04 15:53:14', 1, '3b67f940f6cd243f951bd4477ac4cc6a', NULL, '0707944746', 0, NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for downloadable_link_purchased
-- ----------------------------
DROP TABLE IF EXISTS `downloadable_link_purchased`;
CREATE TABLE `downloadable_link_purchased` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_bought` int(11) NOT NULL DEFAULT '0',
  `download_used` int(11) NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `order_item_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `download_canceled` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`),
  CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of downloadable_link_purchased
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for firebase_notification_tokens
-- ----------------------------
DROP TABLE IF EXISTS `firebase_notification_tokens`;
CREATE TABLE `firebase_notification_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firebase_notification_id` bigint(20) unsigned DEFAULT NULL,
  `firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of firebase_notification_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for firebase_notifications
-- ----------------------------
DROP TABLE IF EXISTS `firebase_notifications`;
CREATE TABLE `firebase_notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fb_notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fb_notifiable_id` bigint(20) unsigned NOT NULL,
  `notification_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_key_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `firebase_notifications_fb_notifiable_type_fb_notifiable_id_index` (`fb_notifiable_type`,`fb_notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of firebase_notifications
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for import_products
-- ----------------------------
DROP TABLE IF EXISTS `import_products`;
CREATE TABLE `import_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_family_id` int(10) unsigned NOT NULL,
  `data_flow_profile_id` int(10) unsigned NOT NULL,
  `is_downloadable` tinyint(1) NOT NULL DEFAULT '0',
  `upload_link_files` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_links_have_samples` tinyint(1) NOT NULL DEFAULT '0',
  `upload_link_sample_files` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_samples_available` tinyint(1) NOT NULL DEFAULT '0',
  `upload_sample_files` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `import_admin_foreign_attribute_family_id` (`attribute_family_id`),
  KEY `import_admin_foreign_data_flow_profile_id` (`data_flow_profile_id`),
  CONSTRAINT `import_admin_foreign_attribute_family_id` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE,
  CONSTRAINT `import_admin_foreign_data_flow_profile_id` FOREIGN KEY (`data_flow_profile_id`) REFERENCES `bulkupload_data_flow_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of import_products
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for inventory_sources
-- ----------------------------
DROP TABLE IF EXISTS `inventory_sources`;
CREATE TABLE `inventory_sources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_sources_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of inventory_sources
-- ----------------------------
BEGIN;
INSERT INTO `inventory_sources` VALUES (1, 'default', 'Default', NULL, 'Detroit Warehouse', 'warehouse@example.com', '1234567899', NULL, 'US', 'MI', 'Detroit', '12th Street', '48127', 0, NULL, NULL, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for invoice_items
-- ----------------------------
DROP TABLE IF EXISTS `invoice_items`;
CREATE TABLE `invoice_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `invoice_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of invoice_items
-- ----------------------------
BEGIN;
INSERT INTO `invoice_items` VALUES (1, 'Phân bón tổng hợp', NULL, 'skskusk', 2, 15.0000, 15.0000, 30.0000, 30.0000, 0.0000, 0.0000, 1, 'Webkul\\Product\\Models\\Product', 5, 1, NULL, '{\"_token\": \"2fUpOL63eVX5fKlitQZkwFtrhzr51tTZDIxes6io\", \"locale\": \"en\", \"quantity\": \"2\", \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2021-05-01 14:26:56', '2021-05-01 14:26:56', 0.0000, 0.0000, 0.0000);
INSERT INTO `invoice_items` VALUES (2, 'tim kiem', NULL, 'mmdsf', 2, 9999.0000, 9999.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 12, 'Webkul\\Product\\Models\\Product', 18, 2, NULL, '{\"_token\": \"pgmrt01fbXSzfwbtHasAxp9fCRQDfMLa1K9nm2I3\", \"locale\": \"vi\", \"quantity\": \"2\", \"is_buy_now\": \"0\", \"product_id\": \"12\"}', '2021-07-23 10:35:51', '2021-07-23 10:35:51', 0.0000, 0.0000, 0.0000);
INSERT INTO `invoice_items` VALUES (3, 'tim kiem', NULL, 'mmdsf', 1, 9999.0000, 9999.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 12, 'Webkul\\Product\\Models\\Product', 19, 3, NULL, '{\"locale\": \"vi\", \"quantity\": 1, \"product_id\": 12}', '2021-07-23 11:09:48', '2021-07-23 11:09:48', 0.0000, 0.0000, 0.0000);
INSERT INTO `invoice_items` VALUES (4, 'tim kiem', NULL, 'mmdsf', 2, 9999.0000, 9999.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 12, 'Webkul\\Product\\Models\\Product', 20, 4, NULL, '{\"_token\": \"pgmrt01fbXSzfwbtHasAxp9fCRQDfMLa1K9nm2I3\", \"locale\": \"vi\", \"quantity\": \"2\", \"is_buy_now\": \"0\", \"product_id\": \"12\"}', '2021-07-23 11:18:52', '2021-07-23 11:18:52', 0.0000, 0.0000, 0.0000);
INSERT INTO `invoice_items` VALUES (5, 'tim kiem', NULL, 'mmdsf', 3, 9999.0000, 9999.0000, 29997.0000, 29997.0000, 0.0000, 0.0000, 12, 'Webkul\\Product\\Models\\Product', 21, 5, NULL, '{\"locale\": \"vi\", \"quantity\": 3, \"product_id\": 12}', '2021-07-23 11:26:55', '2021-07-23 11:26:55', 0.0000, 0.0000, 0.0000);
INSERT INTO `invoice_items` VALUES (6, 'tim kiem', NULL, 'mmdsf', 4, 9999.0000, 9999.0000, 39996.0000, 39996.0000, 0.0000, 0.0000, 12, 'Webkul\\Product\\Models\\Product', 22, 6, NULL, '{\"_token\": \"pgmrt01fbXSzfwbtHasAxp9fCRQDfMLa1K9nm2I3\", \"locale\": \"vi\", \"quantity\": \"4\", \"is_buy_now\": \"0\", \"product_id\": \"12\"}', '2021-07-23 11:29:59', '2021-07-23 11:29:59', 0.0000, 0.0000, 0.0000);
INSERT INTO `invoice_items` VALUES (7, 'tim kiem', NULL, 'mmdsf', 1, 9999.0000, 9999.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 12, 'Webkul\\Product\\Models\\Product', 23, 7, NULL, '{\"_token\": \"pgmrt01fbXSzfwbtHasAxp9fCRQDfMLa1K9nm2I3\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"12\"}', '2021-07-23 11:54:24', '2021-07-23 11:54:24', 0.0000, 0.0000, 0.0000);
INSERT INTO `invoice_items` VALUES (8, 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 'test3', 1, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 7, 'Webkul\\Product\\Models\\Product', 35, 8, NULL, '{\"_token\": \"oGqqzDN0G2S6YDKNke6qJFM2NV1t8RCp2ODHc5ub\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"7\"}', '2021-08-31 23:18:06', '2021-08-31 23:18:06', 0.0000, 0.0000, 0.0000);
COMMIT;

-- ----------------------------
-- Table structure for invoices
-- ----------------------------
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `order_id` int(10) unsigned DEFAULT NULL,
  `order_address_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_order_id_foreign` (`order_id`),
  KEY `invoices_order_address_id_foreign` (`order_address_id`),
  CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of invoices
-- ----------------------------
BEGIN;
INSERT INTO `invoices` VALUES (1, NULL, 'paid', 0, 2, 'USD', 'USD', 'USD', 30.0000, 30.0000, 30.0000, 30.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 6, 21, '2021-05-01 14:26:56', '2021-05-01 14:26:56', NULL);
INSERT INTO `invoices` VALUES (2, NULL, 'paid', 0, 2, 'USD', 'USD', 'USD', 19998.0000, 19998.0000, 20018.0000, 20018.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19, 78, '2021-07-23 10:35:51', '2021-07-23 10:35:51', NULL);
INSERT INTO `invoices` VALUES (3, NULL, 'paid', 0, 1, 'USD', 'USD', 'USD', 9999.0000, 9999.0000, 10009.0000, 10009.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20, 82, '2021-07-23 11:09:48', '2021-07-23 11:09:48', NULL);
INSERT INTO `invoices` VALUES (4, NULL, 'paid', 0, 2, 'USD', 'USD', 'USD', 19998.0000, 19998.0000, 20018.0000, 20018.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 21, 86, '2021-07-23 11:18:52', '2021-07-23 11:18:52', NULL);
INSERT INTO `invoices` VALUES (5, NULL, 'paid', 0, 3, 'USD', 'USD', 'USD', 29997.0000, 29997.0000, 30027.0000, 30027.0000, 30.0000, 30.0000, 0.0000, 0.0000, 0.0000, 0.0000, 22, 90, '2021-07-23 11:26:55', '2021-07-23 11:26:55', NULL);
INSERT INTO `invoices` VALUES (6, NULL, 'paid', 0, 4, 'USD', 'USD', 'USD', 39996.0000, 39996.0000, 40036.0000, 40036.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 23, 94, '2021-07-23 11:29:59', '2021-07-23 11:29:59', NULL);
INSERT INTO `invoices` VALUES (7, NULL, 'paid', 0, 1, 'USD', 'USD', 'USD', 9999.0000, 9999.0000, 10009.0000, 10009.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 24, 98, '2021-07-23 11:54:24', '2021-07-23 11:54:24', NULL);
INSERT INTO `invoices` VALUES (8, NULL, 'paid', 0, 1, 'USD', 'USD', 'USD', 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 35, 142, '2021-08-31 23:18:06', '2021-08-31 23:18:06', NULL);
COMMIT;

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for locales
-- ----------------------------
DROP TABLE IF EXISTS `locales`;
CREATE TABLE `locales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `locale_image` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of locales
-- ----------------------------
BEGIN;
INSERT INTO `locales` VALUES (1, 'en', 'English', NULL, NULL, 'ltr', NULL);
INSERT INTO `locales` VALUES (5, 'vi', 'Vietnamese', '2021-05-23 12:13:15', '2021-05-23 12:13:15', 'ltr', NULL);
COMMIT;

-- ----------------------------
-- Table structure for marketing_campaigns
-- ----------------------------
DROP TABLE IF EXISTS `marketing_campaigns`;
CREATE TABLE `marketing_campaigns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spooling` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int(10) unsigned DEFAULT NULL,
  `customer_group_id` int(10) unsigned DEFAULT NULL,
  `marketing_template_id` int(10) unsigned DEFAULT NULL,
  `marketing_event_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_campaigns_channel_id_foreign` (`channel_id`),
  KEY `marketing_campaigns_customer_group_id_foreign` (`customer_group_id`),
  KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`),
  CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `marketing_templates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketing_campaigns
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for marketing_events
-- ----------------------------
DROP TABLE IF EXISTS `marketing_events`;
CREATE TABLE `marketing_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketing_events
-- ----------------------------
BEGIN;
INSERT INTO `marketing_events` VALUES (1, 'Birthday', 'Birthday', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for marketing_templates
-- ----------------------------
DROP TABLE IF EXISTS `marketing_templates`;
CREATE TABLE `marketing_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketing_templates
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for marketplace_invoice_items
-- ----------------------------
DROP TABLE IF EXISTS `marketplace_invoice_items`;
CREATE TABLE `marketplace_invoice_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `marketplace_invoice_id` int(10) unsigned NOT NULL,
  `invoice_item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `marketplace_invoice_items_marketplace_invoice_id_foreign` (`marketplace_invoice_id`),
  KEY `marketplace_invoice_items_invoice_item_id_foreign` (`invoice_item_id`),
  CONSTRAINT `marketplace_invoice_items_invoice_item_id_foreign` FOREIGN KEY (`invoice_item_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `marketplace_invoice_items_marketplace_invoice_id_foreign` FOREIGN KEY (`marketplace_invoice_id`) REFERENCES `marketplace_invoices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketplace_invoice_items
-- ----------------------------
BEGIN;
INSERT INTO `marketplace_invoice_items` VALUES (1, 1, 2);
INSERT INTO `marketplace_invoice_items` VALUES (2, 2, 3);
INSERT INTO `marketplace_invoice_items` VALUES (3, 3, 6);
COMMIT;

-- ----------------------------
-- Table structure for marketplace_invoices
-- ----------------------------
DROP TABLE IF EXISTS `marketplace_invoices`;
CREATE TABLE `marketplace_invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int(11) DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `invoice_id` int(10) unsigned NOT NULL,
  `marketplace_order_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketplace_invoices_invoice_id_foreign` (`invoice_id`),
  KEY `marketplace_invoices_marketplace_order_id_foreign` (`marketplace_order_id`),
  CONSTRAINT `marketplace_invoices_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `marketplace_invoices_marketplace_order_id_foreign` FOREIGN KEY (`marketplace_order_id`) REFERENCES `marketplace_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketplace_invoices
-- ----------------------------
BEGIN;
INSERT INTO `marketplace_invoices` VALUES (1, 'paid', 0, 2, 19998.0000, 19998.0000, 20018.0000, 20018.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 2, 6, '2021-07-23 10:35:54', '2021-07-23 10:35:54');
INSERT INTO `marketplace_invoices` VALUES (2, 'paid', 0, 1, 9999.0000, 9999.0000, 10009.0000, 10009.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3, 7, '2021-07-23 11:09:54', '2021-07-23 11:09:54');
INSERT INTO `marketplace_invoices` VALUES (3, 'paid', 0, 4, 39996.0000, 39996.0000, 40036.0000, 40036.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 6, 8, '2021-07-23 11:30:02', '2021-07-23 11:30:02');
COMMIT;

-- ----------------------------
-- Table structure for marketplace_order_items
-- ----------------------------
DROP TABLE IF EXISTS `marketplace_order_items`;
CREATE TABLE `marketplace_order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `commission` decimal(12,4) DEFAULT '0.0000',
  `base_commission` decimal(12,4) DEFAULT '0.0000',
  `commission_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_commission_invoiced` decimal(12,4) DEFAULT '0.0000',
  `seller_total` decimal(12,4) DEFAULT '0.0000',
  `base_seller_total` decimal(12,4) DEFAULT '0.0000',
  `seller_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_seller_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `order_item_id` int(10) unsigned NOT NULL,
  `marketplace_product_id` int(10) unsigned DEFAULT NULL,
  `marketplace_order_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketplace_order_items_order_item_id_foreign` (`order_item_id`),
  KEY `marketplace_order_items_marketplace_product_id_foreign` (`marketplace_product_id`),
  KEY `marketplace_order_items_marketplace_order_id_foreign` (`marketplace_order_id`),
  KEY `marketplace_order_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `marketplace_order_items_marketplace_order_id_foreign` FOREIGN KEY (`marketplace_order_id`) REFERENCES `marketplace_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `marketplace_order_items_marketplace_product_id_foreign` FOREIGN KEY (`marketplace_product_id`) REFERENCES `marketplace_products` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketplace_order_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `marketplace_order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `marketplace_order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketplace_order_items
-- ----------------------------
BEGIN;
INSERT INTO `marketplace_order_items` VALUES (1, 0.0000, 0.0000, 0.0000, 0.0000, 40.0000, 40.0000, 0.0000, 0.0000, 3, NULL, 1, NULL);
INSERT INTO `marketplace_order_items` VALUES (2, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 0.0000, 0.0000, 4, NULL, 2, NULL);
INSERT INTO `marketplace_order_items` VALUES (3, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 0.0000, 0.0000, 13, NULL, 3, NULL);
INSERT INTO `marketplace_order_items` VALUES (4, 0.0000, 0.0000, 0.0000, 0.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 16, NULL, 4, NULL);
INSERT INTO `marketplace_order_items` VALUES (5, 0.0000, 0.0000, 0.0000, 0.0000, 29997.0000, 29997.0000, 0.0000, 0.0000, 17, NULL, 5, NULL);
INSERT INTO `marketplace_order_items` VALUES (6, 0.0000, 0.0000, 0.0000, 0.0000, 19998.0000, 19998.0000, 19998.0000, 19998.0000, 18, NULL, 6, NULL);
INSERT INTO `marketplace_order_items` VALUES (7, 0.0000, 0.0000, 0.0000, 0.0000, 9999.0000, 9999.0000, 9999.0000, 9999.0000, 19, NULL, 7, NULL);
INSERT INTO `marketplace_order_items` VALUES (8, 0.0000, 0.0000, 0.0000, 0.0000, 39996.0000, 39996.0000, 39996.0000, 39996.0000, 22, NULL, 8, NULL);
INSERT INTO `marketplace_order_items` VALUES (9, 0.0000, 0.0000, 0.0000, 0.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 24, NULL, 9, NULL);
INSERT INTO `marketplace_order_items` VALUES (10, 0.0000, 0.0000, 0.0000, 0.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 25, NULL, 10, NULL);
INSERT INTO `marketplace_order_items` VALUES (11, 0.0000, 0.0000, 0.0000, 0.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 26, NULL, 11, NULL);
INSERT INTO `marketplace_order_items` VALUES (12, 0.0000, 0.0000, 0.0000, 0.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 27, NULL, 12, NULL);
INSERT INTO `marketplace_order_items` VALUES (13, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 48, 14, 13, NULL);
INSERT INTO `marketplace_order_items` VALUES (14, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 51, 16, 14, NULL);
INSERT INTO `marketplace_order_items` VALUES (15, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 53, 16, 15, NULL);
INSERT INTO `marketplace_order_items` VALUES (16, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 54, 16, 16, NULL);
INSERT INTO `marketplace_order_items` VALUES (17, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 59, 16, 17, NULL);
INSERT INTO `marketplace_order_items` VALUES (18, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 63, 16, 18, NULL);
INSERT INTO `marketplace_order_items` VALUES (19, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 68, 16, 19, NULL);
COMMIT;

-- ----------------------------
-- Table structure for marketplace_orders
-- ----------------------------
DROP TABLE IF EXISTS `marketplace_orders`;
CREATE TABLE `marketplace_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_withdrawal_requested` tinyint(1) NOT NULL DEFAULT '0',
  `seller_payout_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_percentage` decimal(12,4) DEFAULT '0.0000',
  `commission` decimal(12,4) DEFAULT '0.0000',
  `base_commission` decimal(12,4) DEFAULT '0.0000',
  `commission_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_commission_invoiced` decimal(12,4) DEFAULT '0.0000',
  `seller_total` decimal(12,4) DEFAULT '0.0000',
  `base_seller_total` decimal(12,4) DEFAULT '0.0000',
  `seller_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_seller_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `total_item_count` int(11) DEFAULT NULL,
  `total_qty_ordered` int(11) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `marketplace_seller_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `marketplace_orders_marketplace_seller_id_order_id_unique` (`marketplace_seller_id`,`order_id`),
  KEY `marketplace_orders_order_id_foreign` (`order_id`),
  CONSTRAINT `marketplace_orders_marketplace_seller_id_foreign` FOREIGN KEY (`marketplace_seller_id`) REFERENCES `marketplace_sellers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `marketplace_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketplace_orders
-- ----------------------------
BEGIN;
INSERT INTO `marketplace_orders` VALUES (1, 'pending', 0, 'pending', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 40.0000, 40.0000, 0.0000, 0.0000, 1, 2, 60.0000, 60.0000, 0.0000, 0.0000, 0.0000, 0.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 4, '2021-04-14 14:37:30', '2021-04-14 14:37:30');
INSERT INTO `marketplace_orders` VALUES (2, 'pending', 0, 'pending', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 0.0000, 0.0000, 1, 2, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 5, '2021-04-14 15:30:37', '2021-04-14 15:30:37');
INSERT INTO `marketplace_orders` VALUES (3, 'pending', 0, 'pending', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 0.0000, 0.0000, 1, 1, 30.0000, 30.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 14, 14, '2021-06-27 14:38:39', '2021-06-27 14:38:39');
INSERT INTO `marketplace_orders` VALUES (4, 'pending', 0, 'pending', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 1, 2, 20018.0000, 20018.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 14, 17, '2021-07-21 18:12:03', '2021-07-21 18:12:03');
INSERT INTO `marketplace_orders` VALUES (5, 'pending', 0, 'pending', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 29997.0000, 29997.0000, 0.0000, 0.0000, 1, 3, 30027.0000, 30027.0000, 0.0000, 0.0000, 0.0000, 0.0000, 29997.0000, 29997.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 30.0000, 30.0000, 0.0000, 0.0000, 0.0000, 0.0000, 14, 18, '2021-07-21 18:18:10', '2021-07-21 18:18:10');
INSERT INTO `marketplace_orders` VALUES (6, 'completed', 0, 'pending', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19998.0000, 19998.0000, 20018.0000, 19998.0000, 1, 2, 20018.0000, 20018.0000, 20018.0000, 20018.0000, 0.0000, 0.0000, 19998.0000, 19998.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 20.0000, 20.0000, 0.0000, 0.0000, 14, 19, '2021-07-21 18:26:20', '2021-07-23 10:40:47');
INSERT INTO `marketplace_orders` VALUES (7, 'processing', 0, 'pending', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 9999.0000, 9999.0000, 10009.0000, 9999.0000, 1, 1, 10009.0000, 10009.0000, 10009.0000, 10009.0000, 0.0000, 0.0000, 9999.0000, 9999.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 10.0000, 10.0000, 0.0000, 0.0000, 14, 20, '2021-07-21 18:29:33', '2021-07-23 11:09:54');
INSERT INTO `marketplace_orders` VALUES (8, 'completed', 0, 'pending', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 39996.0000, 39996.0000, 40036.0000, 39996.0000, 1, 4, 40036.0000, 40036.0000, 40036.0000, 40036.0000, 0.0000, 0.0000, 39996.0000, 39996.0000, 39996.0000, 39996.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 14, 23, '2021-07-21 18:54:19', '2021-07-23 11:46:36');
INSERT INTO `marketplace_orders` VALUES (9, 'pending', 0, 'pending', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 1, 1, 10009.0000, 10009.0000, 0.0000, 0.0000, 0.0000, 0.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 14, 25, '2021-07-21 19:13:08', '2021-07-21 19:13:08');
INSERT INTO `marketplace_orders` VALUES (10, 'pending', 0, 'pending', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 1, 2, 20018.0000, 20018.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 14, 26, '2021-07-21 21:21:57', '2021-07-21 21:21:57');
INSERT INTO `marketplace_orders` VALUES (11, 'pending', 0, 'pending', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 1, 1, 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 14, 27, '2021-07-21 21:24:31', '2021-07-21 21:24:31');
INSERT INTO `marketplace_orders` VALUES (12, 'pending', 0, 'pending', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 1, 1, 10079.0000, 10079.0000, 0.0000, 0.0000, 0.0000, 0.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 80.0000, 80.0000, 0.0000, 0.0000, 0.0000, 0.0000, 14, 28, '2021-07-21 21:27:43', '2021-07-21 21:27:43');
INSERT INTO `marketplace_orders` VALUES (13, 'pending', 0, 'pending', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 1, 1, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 45, '2021-09-06 22:46:03', '2021-09-06 22:46:03');
INSERT INTO `marketplace_orders` VALUES (14, 'pending', 0, 'pending', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 1, 1, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 48, '2021-09-06 23:20:03', '2021-09-06 23:20:03');
INSERT INTO `marketplace_orders` VALUES (15, 'pending', 0, 'pending', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 1, 1, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 50, '2021-09-12 11:08:13', '2021-09-12 11:08:13');
INSERT INTO `marketplace_orders` VALUES (16, 'pending', 0, 'pending', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 1, 1, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 51, '2021-09-12 11:49:34', '2021-09-12 11:49:34');
INSERT INTO `marketplace_orders` VALUES (17, 'pending', 0, 'pending', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 1, 1, 8080.0000, 8080.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 80.0000, 80.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 55, '2021-09-19 19:27:16', '2021-09-19 19:27:16');
INSERT INTO `marketplace_orders` VALUES (18, 'pending', 0, 'pending', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 1, 1, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 57, '2021-09-29 22:54:06', '2021-09-29 22:54:06');
INSERT INTO `marketplace_orders` VALUES (19, 'pending', 0, 'pending', 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 1, 1, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 61, '2021-10-01 13:44:59', '2021-10-01 13:44:59');
COMMIT;

-- ----------------------------
-- Table structure for marketplace_product_flag_reasons
-- ----------------------------
DROP TABLE IF EXISTS `marketplace_product_flag_reasons`;
CREATE TABLE `marketplace_product_flag_reasons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketplace_product_flag_reasons
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for marketplace_product_flags
-- ----------------------------
DROP TABLE IF EXISTS `marketplace_product_flags`;
CREATE TABLE `marketplace_product_flags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketplace_product_flags_product_id_foreign` (`product_id`),
  CONSTRAINT `marketplace_product_flags_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketplace_product_flags
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for marketplace_product_images
-- ----------------------------
DROP TABLE IF EXISTS `marketplace_product_images`;
CREATE TABLE `marketplace_product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marketplace_product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketplace_product_images_marketplace_product_id_foreign` (`marketplace_product_id`),
  CONSTRAINT `marketplace_product_images_marketplace_product_id_foreign` FOREIGN KEY (`marketplace_product_id`) REFERENCES `marketplace_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketplace_product_images
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for marketplace_product_videos
-- ----------------------------
DROP TABLE IF EXISTS `marketplace_product_videos`;
CREATE TABLE `marketplace_product_videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marketplace_product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mp_products_video_foreign` (`marketplace_product_id`),
  CONSTRAINT `mp_products_video_foreign` FOREIGN KEY (`marketplace_product_id`) REFERENCES `marketplace_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketplace_product_videos
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for marketplace_products
-- ----------------------------
DROP TABLE IF EXISTS `marketplace_products`;
CREATE TABLE `marketplace_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `condition` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_approved` tinyint(1) DEFAULT NULL,
  `is_owner` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `marketplace_seller_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `marketplace_products_marketplace_seller_id_product_id_unique` (`marketplace_seller_id`,`product_id`),
  KEY `marketplace_products_product_id_foreign` (`product_id`),
  KEY `marketplace_products_parent_id_foreign` (`parent_id`),
  CONSTRAINT `marketplace_products_marketplace_seller_id_foreign` FOREIGN KEY (`marketplace_seller_id`) REFERENCES `marketplace_sellers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `marketplace_products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `marketplace_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `marketplace_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketplace_products
-- ----------------------------
BEGIN;
INSERT INTO `marketplace_products` VALUES (9, 'new', 100000, 'desc', 1, 1, NULL, 9, 2, '2021-04-18 07:57:27', '2021-04-18 07:57:27');
INSERT INTO `marketplace_products` VALUES (12, NULL, 0, NULL, 1, 1, NULL, 11, 13, '2021-05-26 21:12:35', '2021-05-26 21:12:35');
INSERT INTO `marketplace_products` VALUES (14, NULL, 0, NULL, 1, 1, NULL, 16, 1, '2021-07-27 18:36:45', '2021-07-27 18:36:45');
INSERT INTO `marketplace_products` VALUES (15, NULL, 0, NULL, 1, 1, NULL, 17, 2, '2021-08-11 16:49:29', '2021-08-11 16:49:29');
INSERT INTO `marketplace_products` VALUES (16, NULL, 0, NULL, 1, 1, NULL, 18, 1, '2021-08-13 13:54:06', '2021-08-13 13:54:06');
INSERT INTO `marketplace_products` VALUES (17, NULL, 0, NULL, 1, 1, NULL, 19, 1, '2021-10-14 22:40:06', '2021-10-14 22:40:06');
COMMIT;

-- ----------------------------
-- Table structure for marketplace_refund_items
-- ----------------------------
DROP TABLE IF EXISTS `marketplace_refund_items`;
CREATE TABLE `marketplace_refund_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `marketplace_refund_id` int(10) unsigned NOT NULL,
  `refund_item_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketplace_refund_items_marketplace_refund_id_foreign` (`marketplace_refund_id`),
  KEY `marketplace_refund_items_refund_item_id_foreign` (`refund_item_id`),
  CONSTRAINT `marketplace_refund_items_marketplace_refund_id_foreign` FOREIGN KEY (`marketplace_refund_id`) REFERENCES `marketplace_refunds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `marketplace_refund_items_refund_item_id_foreign` FOREIGN KEY (`refund_item_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketplace_refund_items
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for marketplace_refunds
-- ----------------------------
DROP TABLE IF EXISTS `marketplace_refunds`;
CREATE TABLE `marketplace_refunds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int(11) DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `refund_id` int(10) unsigned DEFAULT NULL,
  `marketplace_order_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketplace_refunds_refund_id_foreign` (`refund_id`),
  KEY `marketplace_refunds_marketplace_order_id_foreign` (`marketplace_order_id`),
  CONSTRAINT `marketplace_refunds_marketplace_order_id_foreign` FOREIGN KEY (`marketplace_order_id`) REFERENCES `marketplace_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `marketplace_refunds_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketplace_refunds
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for marketplace_seller_flag_reasons
-- ----------------------------
DROP TABLE IF EXISTS `marketplace_seller_flag_reasons`;
CREATE TABLE `marketplace_seller_flag_reasons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketplace_seller_flag_reasons
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for marketplace_seller_flags
-- ----------------------------
DROP TABLE IF EXISTS `marketplace_seller_flags`;
CREATE TABLE `marketplace_seller_flags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketplace_seller_flags_seller_id_foreign` (`seller_id`),
  CONSTRAINT `marketplace_seller_flags_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `marketplace_sellers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketplace_seller_flags
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for marketplace_seller_reviews
-- ----------------------------
DROP TABLE IF EXISTS `marketplace_seller_reviews`;
CREATE TABLE `marketplace_seller_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marketplace_seller_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketplace_seller_reviews_marketplace_seller_id_foreign` (`marketplace_seller_id`),
  KEY `marketplace_seller_reviews_customer_id_foreign` (`customer_id`),
  CONSTRAINT `marketplace_seller_reviews_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `marketplace_seller_reviews_marketplace_seller_id_foreign` FOREIGN KEY (`marketplace_seller_id`) REFERENCES `marketplace_sellers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketplace_seller_reviews
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for marketplace_sellers
-- ----------------------------
DROP TABLE IF EXISTS `marketplace_sellers`;
CREATE TABLE `marketplace_sellers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `shop_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_vat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_policy` text COLLATE utf8mb4_unicode_ci,
  `shipping_policy` text COLLATE utf8mb4_unicode_ci,
  `privacy_policy` text COLLATE utf8mb4_unicode_ci,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linked_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pinterest` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_enable` tinyint(1) NOT NULL DEFAULT '0',
  `commission_percentage` decimal(12,4) DEFAULT '0.0000',
  `min_order_amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_analytics_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_category` int(10) unsigned DEFAULT NULL,
  `show_at_home` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `marketplace_sellers_url_unique` (`url`),
  UNIQUE KEY `marketplace_sellers_customer_id_unique` (`customer_id`),
  CONSTRAINT `marketplace_sellers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketplace_sellers
-- ----------------------------
BEGIN;
INSERT INTO `marketplace_sellers` VALUES (1, 'baconco', 1, 'Baconco', '', '\"seller\\/banner\\/1\\/CNHPQmixgeJjkowQQpi7ShUz3sISNZq7ZMBVV5C2.png\"', 'seller/logo/1/q7HosG1hcPy9m80cGy4gBejd56UPx5fyN0dzqhfG.png', '', NULL, '', '', 'm', 'm', 'm', 'm', 'm', 'DZ', 'm', '', '', '', '', '', '', '', '', '', '', 95, NULL, '2021-08-22 13:08:43', 0, 0.0000, NULL, NULL, 5, 0);
INSERT INTO `marketplace_sellers` VALUES (2, 'yara', 1, 'yara', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, '2021-04-16 11:17:26', '2021-08-11 16:48:49', 0, 0.0000, NULL, NULL, 1, 0);
INSERT INTO `marketplace_sellers` VALUES (13, 'shop', 1, 'shop', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, '2021-05-18 21:45:02', '2021-05-18 21:45:02', 0, 0.0000, NULL, NULL, 5, 0);
INSERT INTO `marketplace_sellers` VALUES (14, 'shopne', 1, 'name shop', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, '2021-06-20 16:58:08', '2021-06-20 16:58:08', 0, 0.0000, NULL, NULL, 5, 0);
COMMIT;

-- ----------------------------
-- Table structure for marketplace_shipment_items
-- ----------------------------
DROP TABLE IF EXISTS `marketplace_shipment_items`;
CREATE TABLE `marketplace_shipment_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `marketplace_shipment_id` int(10) unsigned NOT NULL,
  `shipment_item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `marketplace_shipment_items_marketplace_shipment_id_foreign` (`marketplace_shipment_id`),
  KEY `marketplace_shipment_items_shipment_item_id_foreign` (`shipment_item_id`),
  CONSTRAINT `marketplace_shipment_items_marketplace_shipment_id_foreign` FOREIGN KEY (`marketplace_shipment_id`) REFERENCES `marketplace_shipments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `marketplace_shipment_items_shipment_item_id_foreign` FOREIGN KEY (`shipment_item_id`) REFERENCES `shipment_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketplace_shipment_items
-- ----------------------------
BEGIN;
INSERT INTO `marketplace_shipment_items` VALUES (1, 1, 2);
INSERT INTO `marketplace_shipment_items` VALUES (2, 2, 3);
COMMIT;

-- ----------------------------
-- Table structure for marketplace_shipments
-- ----------------------------
DROP TABLE IF EXISTS `marketplace_shipments`;
CREATE TABLE `marketplace_shipments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `total_qty` int(11) DEFAULT NULL,
  `shipment_id` int(10) unsigned NOT NULL,
  `marketplace_order_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketplace_shipments_shipment_id_foreign` (`shipment_id`),
  KEY `marketplace_shipments_marketplace_order_id_foreign` (`marketplace_order_id`),
  CONSTRAINT `marketplace_shipments_marketplace_order_id_foreign` FOREIGN KEY (`marketplace_order_id`) REFERENCES `marketplace_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `marketplace_shipments_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketplace_shipments
-- ----------------------------
BEGIN;
INSERT INTO `marketplace_shipments` VALUES (1, 2, 2, 6, '2021-07-23 10:40:47', '2021-07-23 10:40:47');
INSERT INTO `marketplace_shipments` VALUES (2, 4, 3, 8, '2021-07-23 11:46:36', '2021-07-23 11:46:36');
COMMIT;

-- ----------------------------
-- Table structure for marketplace_transactions
-- ----------------------------
DROP TABLE IF EXISTS `marketplace_transactions`;
CREATE TABLE `marketplace_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `base_total` decimal(12,4) DEFAULT '0.0000',
  `marketplace_seller_id` int(10) unsigned NOT NULL,
  `marketplace_order_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `marketplace_transactions_transaction_id_unique` (`transaction_id`),
  KEY `marketplace_transactions_marketplace_seller_id_foreign` (`marketplace_seller_id`),
  KEY `marketplace_transactions_marketplace_order_id_foreign` (`marketplace_order_id`),
  CONSTRAINT `marketplace_transactions_marketplace_order_id_foreign` FOREIGN KEY (`marketplace_order_id`) REFERENCES `marketplace_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `marketplace_transactions_marketplace_seller_id_foreign` FOREIGN KEY (`marketplace_seller_id`) REFERENCES `marketplace_sellers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of marketplace_transactions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mediable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mediable_id` bigint(20) unsigned NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `absolute_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_mediable_type_mediable_id_index` (`mediable_type`,`mediable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of media
-- ----------------------------
BEGIN;
INSERT INTO `media` VALUES (1, 'Kilimo\\BuyNowPayLater\\Models\\CreditCardRegistration', 2, 'images/1fce88789b189ca298a42c333053966b.jpeg', 'http://localhost:8000/storage/images/1fce88789b189ca298a42c333053966b.jpeg', '2021-05-09 09:59:21', '2021-05-09 09:59:21');
INSERT INTO `media` VALUES (3, 'Kilimo\\BuyNowPayLater\\Models\\CreditCardRegistration', 4, 'images/1fce88789b189ca298a42c333053966b-6097ad84a1b81.jpeg', 'http://localhost:8000/storage/images/1fce88789b189ca298a42c333053966b-6097ad84a1b81.jpeg', '2021-05-09 16:38:12', '2021-05-09 16:38:12');
INSERT INTO `media` VALUES (4, 'Kilimo\\BuyNowPayLater\\Models\\CreditCardRegistration', 5, 'images/1fce88789b189ca298a42c333053966b-60994fded2b14.jpeg', 'http://localhost:8000/storage/images/1fce88789b189ca298a42c333053966b-60994fded2b14.jpeg', '2021-05-10 22:23:10', '2021-05-10 22:23:10');
INSERT INTO `media` VALUES (5, 'Kilimo\\BuyNowPayLater\\Models\\CreditCardRegistration', 5, 'images/nhung-duoi-file-hinh-anh-pho-bien-dan-may-doc-duoc-2.jpeg', 'http://localhost:8000/storage/images/nhung-duoi-file-hinh-anh-pho-bien-dan-may-doc-duoc-2.jpeg', '2021-05-10 22:23:10', '2021-05-10 22:23:10');
INSERT INTO `media` VALUES (6, 'Kilimo\\BuyNowPayLater\\Models\\CreditCardRegistration', 6, 'images/1fce88789b189ca298a42c333053966b-609954ca6bb7f.jpeg', 'http://localhost:8000/storage/images/1fce88789b189ca298a42c333053966b-609954ca6bb7f.jpeg', '2021-05-10 22:44:10', '2021-05-10 22:44:10');
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_admin_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (4, '2018_06_12_111907_create_admins_table', 1);
INSERT INTO `migrations` VALUES (5, '2018_06_13_055341_create_roles_table', 1);
INSERT INTO `migrations` VALUES (6, '2018_07_05_130148_create_attributes_table', 1);
INSERT INTO `migrations` VALUES (7, '2018_07_05_132854_create_attribute_translations_table', 1);
INSERT INTO `migrations` VALUES (8, '2018_07_05_135150_create_attribute_families_table', 1);
INSERT INTO `migrations` VALUES (9, '2018_07_05_135152_create_attribute_groups_table', 1);
INSERT INTO `migrations` VALUES (10, '2018_07_05_140832_create_attribute_options_table', 1);
INSERT INTO `migrations` VALUES (11, '2018_07_05_140856_create_attribute_option_translations_table', 1);
INSERT INTO `migrations` VALUES (12, '2018_07_05_142820_create_categories_table', 1);
INSERT INTO `migrations` VALUES (13, '2018_07_10_055143_create_locales_table', 1);
INSERT INTO `migrations` VALUES (14, '2018_07_20_054426_create_countries_table', 1);
INSERT INTO `migrations` VALUES (15, '2018_07_20_054502_create_currencies_table', 1);
INSERT INTO `migrations` VALUES (16, '2018_07_20_054542_create_currency_exchange_rates_table', 1);
INSERT INTO `migrations` VALUES (17, '2018_07_20_064849_create_channels_table', 1);
INSERT INTO `migrations` VALUES (18, '2018_07_21_142836_create_category_translations_table', 1);
INSERT INTO `migrations` VALUES (19, '2018_07_23_110040_create_inventory_sources_table', 1);
INSERT INTO `migrations` VALUES (20, '2018_07_24_082635_create_customer_groups_table', 1);
INSERT INTO `migrations` VALUES (21, '2018_07_24_082930_create_customers_table', 1);
INSERT INTO `migrations` VALUES (22, '2018_07_24_083025_create_customer_addresses_table', 1);
INSERT INTO `migrations` VALUES (23, '2018_07_27_065727_create_products_table', 1);
INSERT INTO `migrations` VALUES (24, '2018_07_27_070011_create_product_attribute_values_table', 1);
INSERT INTO `migrations` VALUES (25, '2018_07_27_092623_create_product_reviews_table', 1);
INSERT INTO `migrations` VALUES (26, '2018_07_27_113941_create_product_images_table', 1);
INSERT INTO `migrations` VALUES (27, '2018_07_27_113956_create_product_inventories_table', 1);
INSERT INTO `migrations` VALUES (28, '2018_08_03_114203_create_sliders_table', 1);
INSERT INTO `migrations` VALUES (29, '2018_08_30_064755_create_tax_categories_table', 1);
INSERT INTO `migrations` VALUES (30, '2018_08_30_065042_create_tax_rates_table', 1);
INSERT INTO `migrations` VALUES (31, '2018_08_30_065840_create_tax_mappings_table', 1);
INSERT INTO `migrations` VALUES (32, '2018_09_05_150444_create_cart_table', 1);
INSERT INTO `migrations` VALUES (33, '2018_09_05_150915_create_cart_items_table', 1);
INSERT INTO `migrations` VALUES (34, '2018_09_11_064045_customer_password_resets', 1);
INSERT INTO `migrations` VALUES (35, '2018_09_19_092845_create_cart_address', 1);
INSERT INTO `migrations` VALUES (36, '2018_09_19_093453_create_cart_payment', 1);
INSERT INTO `migrations` VALUES (37, '2018_09_19_093508_create_cart_shipping_rates_table', 1);
INSERT INTO `migrations` VALUES (38, '2018_09_20_060658_create_core_config_table', 1);
INSERT INTO `migrations` VALUES (39, '2018_09_27_113154_create_orders_table', 1);
INSERT INTO `migrations` VALUES (40, '2018_09_27_113207_create_order_items_table', 1);
INSERT INTO `migrations` VALUES (41, '2018_09_27_113405_create_order_address_table', 1);
INSERT INTO `migrations` VALUES (42, '2018_09_27_115022_create_shipments_table', 1);
INSERT INTO `migrations` VALUES (43, '2018_09_27_115029_create_shipment_items_table', 1);
INSERT INTO `migrations` VALUES (44, '2018_09_27_115135_create_invoices_table', 1);
INSERT INTO `migrations` VALUES (45, '2018_09_27_115144_create_invoice_items_table', 1);
INSERT INTO `migrations` VALUES (46, '2018_10_01_095504_create_order_payment_table', 1);
INSERT INTO `migrations` VALUES (47, '2018_10_03_025230_create_wishlist_table', 1);
INSERT INTO `migrations` VALUES (48, '2018_10_12_101803_create_country_translations_table', 1);
INSERT INTO `migrations` VALUES (49, '2018_10_12_101913_create_country_states_table', 1);
INSERT INTO `migrations` VALUES (50, '2018_10_12_101923_create_country_state_translations_table', 1);
INSERT INTO `migrations` VALUES (51, '2018_11_15_153257_alter_order_table', 1);
INSERT INTO `migrations` VALUES (52, '2018_11_15_163729_alter_invoice_table', 1);
INSERT INTO `migrations` VALUES (53, '2018_11_16_173504_create_subscribers_list_table', 1);
INSERT INTO `migrations` VALUES (54, '2018_11_17_165758_add_is_verified_column_in_customers_table', 1);
INSERT INTO `migrations` VALUES (55, '2018_11_21_144411_create_cart_item_inventories_table', 1);
INSERT INTO `migrations` VALUES (56, '2018_11_26_110500_change_gender_column_in_customers_table', 1);
INSERT INTO `migrations` VALUES (57, '2018_11_27_174449_change_content_column_in_sliders_table', 1);
INSERT INTO `migrations` VALUES (58, '2018_12_05_132625_drop_foreign_key_core_config_table', 1);
INSERT INTO `migrations` VALUES (59, '2018_12_05_132629_alter_core_config_table', 1);
INSERT INTO `migrations` VALUES (60, '2018_12_06_185202_create_product_flat_table', 1);
INSERT INTO `migrations` VALUES (61, '2018_12_07_164618_create_marketplace_sellers_table', 1);
INSERT INTO `migrations` VALUES (62, '2018_12_19_103208_create_marketplace_products_table', 1);
INSERT INTO `migrations` VALUES (63, '2018_12_19_130903_create_marketplace_seller_reviews_table', 1);
INSERT INTO `migrations` VALUES (64, '2018_12_21_101307_alter_channels_table', 1);
INSERT INTO `migrations` VALUES (65, '2018_12_24_123812_create_channel_inventory_sources_table', 1);
INSERT INTO `migrations` VALUES (66, '2018_12_24_184402_alter_shipments_table', 1);
INSERT INTO `migrations` VALUES (67, '2018_12_26_165327_create_product_ordered_inventories_table', 1);
INSERT INTO `migrations` VALUES (68, '2018_12_31_152453_create_marketplace_product_images_table', 1);
INSERT INTO `migrations` VALUES (69, '2018_12_31_161114_alter_channels_category_table', 1);
INSERT INTO `migrations` VALUES (70, '2019_01_07_180846_create_marketplace_orders_table', 1);
INSERT INTO `migrations` VALUES (71, '2019_01_07_185328_create_marketplace_order_items_table', 1);
INSERT INTO `migrations` VALUES (72, '2019_01_11_122452_add_vendor_id_column_in_product_inventories_table', 1);
INSERT INTO `migrations` VALUES (73, '2019_01_11_163303_create_marketplace_shipments_table', 1);
INSERT INTO `migrations` VALUES (74, '2019_01_11_163341_create_marketplace_shipment_items_table', 1);
INSERT INTO `migrations` VALUES (75, '2019_01_11_182037_create_marketplace_invoices_table', 1);
INSERT INTO `migrations` VALUES (76, '2019_01_11_182104_create_marketplace_invoice_items_table', 1);
INSERT INTO `migrations` VALUES (77, '2019_01_16_130617_create_marketplace_transactions_table', 1);
INSERT INTO `migrations` VALUES (78, '2019_01_25_124522_add_updated_at_column_in_product_flat_table', 1);
INSERT INTO `migrations` VALUES (79, '2019_01_29_123053_add_min_price_and_max_price_column_in_product_flat_table', 1);
INSERT INTO `migrations` VALUES (80, '2019_01_31_164117_update_value_column_type_to_text_in_core_config_table', 1);
INSERT INTO `migrations` VALUES (81, '2019_02_21_145238_alter_product_reviews_table', 1);
INSERT INTO `migrations` VALUES (82, '2019_02_21_152709_add_swatch_type_column_in_attributes_table', 1);
INSERT INTO `migrations` VALUES (83, '2019_02_21_153035_alter_customer_id_in_product_reviews_table', 1);
INSERT INTO `migrations` VALUES (84, '2019_02_21_153851_add_swatch_value_columns_in_attribute_options_table', 1);
INSERT INTO `migrations` VALUES (85, '2019_03_15_123337_add_display_mode_column_in_categories_table', 1);
INSERT INTO `migrations` VALUES (86, '2019_03_28_103658_add_notes_column_in_customers_table', 1);
INSERT INTO `migrations` VALUES (87, '2019_04_23_115227_create_bulkupload_data_flow_profiles_table', 1);
INSERT INTO `migrations` VALUES (88, '2019_04_24_155820_alter_product_flat_table', 1);
INSERT INTO `migrations` VALUES (89, '2019_05_13_024320_remove_tables', 1);
INSERT INTO `migrations` VALUES (90, '2019_05_13_024321_create_cart_rules_table', 1);
INSERT INTO `migrations` VALUES (91, '2019_05_13_024322_create_cart_rule_channels_table', 1);
INSERT INTO `migrations` VALUES (92, '2019_05_13_024323_create_cart_rule_customer_groups_table', 1);
INSERT INTO `migrations` VALUES (93, '2019_05_13_024324_create_cart_rule_translations_table', 1);
INSERT INTO `migrations` VALUES (94, '2019_05_13_024325_create_cart_rule_customers_table', 1);
INSERT INTO `migrations` VALUES (95, '2019_05_13_024326_create_cart_rule_coupons_table', 1);
INSERT INTO `migrations` VALUES (96, '2019_05_13_024327_create_cart_rule_coupon_usage_table', 1);
INSERT INTO `migrations` VALUES (97, '2019_05_22_165833_update_zipcode_column_type_to_varchar_in_cart_address_table', 1);
INSERT INTO `migrations` VALUES (98, '2019_05_23_113407_add_remaining_column_in_product_flat_table', 1);
INSERT INTO `migrations` VALUES (99, '2019_05_23_155520_add_discount_columns_in_invoice_items_table', 1);
INSERT INTO `migrations` VALUES (100, '2019_05_23_184029_rename_discount_columns_in_cart_table', 1);
INSERT INTO `migrations` VALUES (101, '2019_05_24_184029_rename_discount_invoiced_columns_in_marketplace_orders_table', 1);
INSERT INTO `migrations` VALUES (102, '2019_06_04_114009_add_phone_column_in_customers_table', 1);
INSERT INTO `migrations` VALUES (103, '2019_06_06_195905_update_custom_price_to_nullable_in_cart_items', 1);
INSERT INTO `migrations` VALUES (104, '2019_06_15_183412_add_code_column_in_customer_groups_table', 1);
INSERT INTO `migrations` VALUES (105, '2019_06_17_180258_create_product_downloadable_samples_table', 1);
INSERT INTO `migrations` VALUES (106, '2019_06_17_180314_create_product_downloadable_sample_translations_table', 1);
INSERT INTO `migrations` VALUES (107, '2019_06_17_180325_create_product_downloadable_links_table', 1);
INSERT INTO `migrations` VALUES (108, '2019_06_17_180346_create_product_downloadable_link_translations_table', 1);
INSERT INTO `migrations` VALUES (109, '2019_06_19_162817_remove_unique_in_phone_column_in_customers_table', 1);
INSERT INTO `migrations` VALUES (110, '2019_06_21_130512_update_weight_column_deafult_value_in_cart_items_table', 1);
INSERT INTO `migrations` VALUES (111, '2019_06_21_202249_create_downloadable_link_purchased_table', 1);
INSERT INTO `migrations` VALUES (112, '2019_07_02_180307_create_booking_products_table', 1);
INSERT INTO `migrations` VALUES (113, '2019_07_05_114157_add_symbol_column_in_currencies_table', 1);
INSERT INTO `migrations` VALUES (114, '2019_07_05_154415_create_booking_product_default_slots_table', 1);
INSERT INTO `migrations` VALUES (115, '2019_07_05_154429_create_booking_product_appointment_slots_table', 1);
INSERT INTO `migrations` VALUES (116, '2019_07_05_154440_create_booking_product_event_tickets_table', 1);
INSERT INTO `migrations` VALUES (117, '2019_07_05_154451_create_booking_product_rental_slots_table', 1);
INSERT INTO `migrations` VALUES (118, '2019_07_05_154502_create_booking_product_table_slots_table', 1);
INSERT INTO `migrations` VALUES (119, '2019_07_11_151210_add_locale_id_in_category_translations', 1);
INSERT INTO `migrations` VALUES (120, '2019_07_23_033128_alter_locales_table', 1);
INSERT INTO `migrations` VALUES (121, '2019_07_23_174708_create_velocity_contents_table', 1);
INSERT INTO `migrations` VALUES (122, '2019_07_23_175212_create_velocity_contents_translations_table', 1);
INSERT INTO `migrations` VALUES (123, '2019_07_29_142734_add_use_in_flat_column_in_attributes_table', 1);
INSERT INTO `migrations` VALUES (124, '2019_07_30_153530_create_cms_pages_table', 1);
INSERT INTO `migrations` VALUES (125, '2019_07_31_143339_create_category_filterable_attributes_table', 1);
INSERT INTO `migrations` VALUES (126, '2019_08_02_105320_create_product_grouped_products_table', 1);
INSERT INTO `migrations` VALUES (127, '2019_08_12_184925_add_additional_cloumn_in_wishlist_table', 1);
INSERT INTO `migrations` VALUES (128, '2019_08_20_170510_create_product_bundle_options_table', 1);
INSERT INTO `migrations` VALUES (129, '2019_08_20_170520_create_product_bundle_option_translations_table', 1);
INSERT INTO `migrations` VALUES (130, '2019_08_20_170528_create_product_bundle_option_products_table', 1);
INSERT INTO `migrations` VALUES (131, '2019_08_21_123707_add_seo_column_in_channels_table', 1);
INSERT INTO `migrations` VALUES (132, '2019_09_11_184511_create_refunds_table', 1);
INSERT INTO `migrations` VALUES (133, '2019_09_11_184519_create_refund_items_table', 1);
INSERT INTO `migrations` VALUES (134, '2019_09_26_163950_remove_channel_id_from_customers_table', 1);
INSERT INTO `migrations` VALUES (135, '2019_10_03_105451_change_rate_column_in_currency_exchange_rates_table', 1);
INSERT INTO `migrations` VALUES (136, '2019_10_21_105136_order_brands', 1);
INSERT INTO `migrations` VALUES (137, '2019_10_24_105250_create_marketplace_refunds_table', 1);
INSERT INTO `migrations` VALUES (138, '2019_10_24_105315_create_marketplace_refund_items_table', 1);
INSERT INTO `migrations` VALUES (139, '2019_10_24_173358_change_postcode_column_type_in_order_address_table', 1);
INSERT INTO `migrations` VALUES (140, '2019_10_24_173437_change_postcode_column_type_in_cart_address_table', 1);
INSERT INTO `migrations` VALUES (141, '2019_10_24_173507_change_postcode_column_type_in_customer_addresses_table', 1);
INSERT INTO `migrations` VALUES (142, '2019_11_18_125848_add_commission_enable_and_commission_percentage_to_marketplace_sellers_table', 1);
INSERT INTO `migrations` VALUES (143, '2019_11_21_194541_add_column_url_path_to_category_translations', 1);
INSERT INTO `migrations` VALUES (144, '2019_11_21_194608_add_stored_function_to_get_url_path_of_category', 1);
INSERT INTO `migrations` VALUES (145, '2019_11_21_194627_add_trigger_to_category_translations', 1);
INSERT INTO `migrations` VALUES (146, '2019_11_21_194648_add_url_path_to_existing_category_translations', 1);
INSERT INTO `migrations` VALUES (147, '2019_11_21_194703_add_trigger_to_categories', 1);
INSERT INTO `migrations` VALUES (148, '2019_11_25_171136_add_applied_cart_rule_ids_column_in_cart_table', 1);
INSERT INTO `migrations` VALUES (149, '2019_11_25_171208_add_applied_cart_rule_ids_column_in_cart_items_table', 1);
INSERT INTO `migrations` VALUES (150, '2019_11_30_124437_add_applied_cart_rule_ids_column_in_orders_table', 1);
INSERT INTO `migrations` VALUES (151, '2019_11_30_165644_add_discount_columns_in_cart_shipping_rates_table', 1);
INSERT INTO `migrations` VALUES (152, '2019_12_03_175253_create_remove_catalog_rule_tables', 1);
INSERT INTO `migrations` VALUES (153, '2019_12_03_184613_create_catalog_rules_table', 1);
INSERT INTO `migrations` VALUES (154, '2019_12_03_184651_create_catalog_rule_channels_table', 1);
INSERT INTO `migrations` VALUES (155, '2019_12_03_184732_create_catalog_rule_customer_groups_table', 1);
INSERT INTO `migrations` VALUES (156, '2019_12_06_101110_create_catalog_rule_products_table', 1);
INSERT INTO `migrations` VALUES (157, '2019_12_06_110507_create_catalog_rule_product_prices_table', 1);
INSERT INTO `migrations` VALUES (158, '2019_12_30_155256_create_velocity_meta_data', 1);
INSERT INTO `migrations` VALUES (159, '2020_01_02_201029_add_api_token_columns', 1);
INSERT INTO `migrations` VALUES (160, '2020_01_06_173505_alter_trigger_category_translations', 1);
INSERT INTO `migrations` VALUES (161, '2020_01_06_173524_alter_stored_function_url_path_category', 1);
INSERT INTO `migrations` VALUES (162, '2020_01_06_195305_alter_trigger_on_categories', 1);
INSERT INTO `migrations` VALUES (163, '2020_01_09_154851_add_shipping_discount_columns_in_orders_table', 1);
INSERT INTO `migrations` VALUES (164, '2020_01_09_202815_add_inventory_source_name_column_in_shipments_table', 1);
INSERT INTO `migrations` VALUES (165, '2020_01_10_122226_update_velocity_meta_data', 1);
INSERT INTO `migrations` VALUES (166, '2020_01_10_151902_customer_address_improvements', 1);
INSERT INTO `migrations` VALUES (167, '2020_01_13_131431_alter_float_value_column_type_in_product_attribute_values_table', 1);
INSERT INTO `migrations` VALUES (168, '2020_01_13_155803_add_velocity_locale_icon', 1);
INSERT INTO `migrations` VALUES (169, '2020_01_13_192149_add_category_velocity_meta_data', 1);
INSERT INTO `migrations` VALUES (170, '2020_01_14_191854_create_cms_page_translations_table', 1);
INSERT INTO `migrations` VALUES (171, '2020_01_14_192206_remove_columns_from_cms_pages_table', 1);
INSERT INTO `migrations` VALUES (172, '2020_01_15_130209_create_cms_page_channels_table', 1);
INSERT INTO `migrations` VALUES (173, '2020_01_15_145637_add_product_policy', 1);
INSERT INTO `migrations` VALUES (174, '2020_01_15_152121_add_banner_link', 1);
INSERT INTO `migrations` VALUES (175, '2020_01_28_102422_add_new_column_and_rename_name_column_in_customer_addresses_table', 1);
INSERT INTO `migrations` VALUES (176, '2020_01_29_124748_alter_name_column_in_country_state_translations_table', 1);
INSERT INTO `migrations` VALUES (177, '2020_02_18_165639_create_bookings_table', 1);
INSERT INTO `migrations` VALUES (178, '2020_02_21_121201_create_booking_product_event_ticket_translations_table', 1);
INSERT INTO `migrations` VALUES (179, '2020_02_24_190025_add_is_comparable_column_in_attributes_table', 1);
INSERT INTO `migrations` VALUES (180, '2020_02_25_181902_propagate_company_name', 1);
INSERT INTO `migrations` VALUES (181, '2020_02_26_163908_change_column_type_in_cart_rules_table', 1);
INSERT INTO `migrations` VALUES (182, '2020_02_28_105104_fix_order_columns', 1);
INSERT INTO `migrations` VALUES (183, '2020_02_28_111958_create_customer_compare_products_table', 1);
INSERT INTO `migrations` VALUES (184, '2020_03_23_201431_alter_booking_products_table', 1);
INSERT INTO `migrations` VALUES (185, '2020_04_13_224524_add_locale_in_sliders_table', 1);
INSERT INTO `migrations` VALUES (186, '2020_04_16_130351_remove_channel_from_tax_category', 1);
INSERT INTO `migrations` VALUES (187, '2020_04_16_185147_add_table_addresses', 1);
INSERT INTO `migrations` VALUES (188, '2020_05_06_171638_create_order_comments_table', 1);
INSERT INTO `migrations` VALUES (189, '2020_05_13_223920_create_import_products_table', 1);
INSERT INTO `migrations` VALUES (190, '2020_05_21_171500_create_product_customer_group_prices_table', 1);
INSERT INTO `migrations` VALUES (191, '2020_06_08_161708_add_sale_prices_to_booking_product_event_tickets', 1);
INSERT INTO `migrations` VALUES (192, '2020_06_10_201453_add_locale_velocity_meta_data', 1);
INSERT INTO `migrations` VALUES (193, '2020_06_25_162154_create_customer_social_accounts_table', 1);
INSERT INTO `migrations` VALUES (194, '2020_06_25_162340_change_email_password_columns_in_customers_table', 1);
INSERT INTO `migrations` VALUES (195, '2020_06_30_163510_remove_unique_name_in_tax_categories_table', 1);
INSERT INTO `migrations` VALUES (196, '2020_07_31_142021_update_cms_page_translations_table_field_html_content', 1);
INSERT INTO `migrations` VALUES (197, '2020_08_01_132239_add_header_content_count_velocity_meta_data_table', 1);
INSERT INTO `migrations` VALUES (198, '2020_08_12_114128_removing_foriegn_key', 1);
INSERT INTO `migrations` VALUES (199, '2020_08_17_104228_add_channel_to_velocity_meta_data_table', 1);
INSERT INTO `migrations` VALUES (200, '2020_09_07_120413_add_unique_index_to_increment_id_in_orders_table', 1);
INSERT INTO `migrations` VALUES (201, '2020_09_07_195157_add_additional_to_category', 1);
INSERT INTO `migrations` VALUES (202, '2020_10_16_174016_create_marketplace_product_flag_reasons', 1);
INSERT INTO `migrations` VALUES (203, '2020_10_16_174036_create_marketplace_seller_flag_reasons', 1);
INSERT INTO `migrations` VALUES (204, '2020_10_23_160706_create_marketplace_product_flags_table', 1);
INSERT INTO `migrations` VALUES (205, '2020_10_23_160718_create_marketplace_seller_flags_table', 1);
INSERT INTO `migrations` VALUES (206, '2020_11_10_174816_add_product_number_column_in_product_flat_table', 1);
INSERT INTO `migrations` VALUES (207, '2020_11_19_112228_create_product_videos_table', 1);
INSERT INTO `migrations` VALUES (208, '2020_11_20_105353_add_columns_in_channels_table', 1);
INSERT INTO `migrations` VALUES (209, '2020_11_20_111012_add_min_order_amount_to_marketplace_sellers', 1);
INSERT INTO `migrations` VALUES (210, '2020_11_24_164714_add_google_analytics_to_marketplace_sellers', 1);
INSERT INTO `migrations` VALUES (211, '2020_11_26_141455_create_marketing_templates_table', 1);
INSERT INTO `migrations` VALUES (212, '2020_11_26_150534_create_marketing_events_table', 1);
INSERT INTO `migrations` VALUES (213, '2020_11_26_150644_create_marketing_campaigns_table', 1);
INSERT INTO `migrations` VALUES (214, '2020_12_18_122826_add_is_tax_calculation_column_to_cart_shipping_rates_table', 1);
INSERT INTO `migrations` VALUES (215, '2020_12_21_000200_create_channel_translations_table', 1);
INSERT INTO `migrations` VALUES (216, '2020_12_21_140151_remove_columns_from_channels_table', 1);
INSERT INTO `migrations` VALUES (217, '2020_12_24_131004_add_customer_id_column_in_subscribers_list_table', 1);
INSERT INTO `migrations` VALUES (218, '2020_12_27_121950_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (219, '2021_02_03_104907_add_adittional_data_to_order_payment_table', 1);
INSERT INTO `migrations` VALUES (220, '2021_02_04_150033_add_download_canceled_column_in_downloadable_link_purchased_table', 1);
INSERT INTO `migrations` VALUES (237, '2021_02_25_181228_create_marketplace_product_videos_table', 2);
INSERT INTO `migrations` VALUES (238, '2021_03_30_130628_add_columns_customers_table', 2);
INSERT INTO `migrations` VALUES (239, '2021_03_30_133725_create_agents_table', 2);
INSERT INTO `migrations` VALUES (240, '2021_03_30_135035_create_phone_codes_table', 2);
INSERT INTO `migrations` VALUES (242, '2021_03_31_160316_add_column_represent_name_customers_table', 3);
INSERT INTO `migrations` VALUES (248, '2021_04_02_025208_create_cities_table', 4);
INSERT INTO `migrations` VALUES (249, '2021_04_04_031800_add_column_full_name_customers_table', 5);
INSERT INTO `migrations` VALUES (250, '2021_04_08_083444_alter_customer_table_phone_col', 5);
INSERT INTO `migrations` VALUES (251, '2021_04_09_035801_alter_is_home_categories_table', 5);
INSERT INTO `migrations` VALUES (254, '2021_04_09_043728_add_col_main_cate_supplier', 6);
INSERT INTO `migrations` VALUES (255, '2021_04_12_093052_create_customer_sellers_table', 6);
INSERT INTO `migrations` VALUES (256, '2021_04_16_042734_create_banner_images_table', 7);
INSERT INTO `migrations` VALUES (257, '2021_04_27_084506_alter_addresses_add_ward', 8);
INSERT INTO `migrations` VALUES (258, '2021_05_05_223213_create_crop_types_table', 8);
INSERT INTO `migrations` VALUES (259, '2021_05_05_223441_create_animals_table', 8);
INSERT INTO `migrations` VALUES (260, '2021_05_07_211805_create_credit_card_registrations_table', 8);
INSERT INTO `migrations` VALUES (261, '2021_05_08_222033_create_media_table', 9);
INSERT INTO `migrations` VALUES (264, '2021_05_10_221511_add_column_status_credit_card_registrations', 10);
INSERT INTO `migrations` VALUES (267, '2021_05_17_223645_add_column_flag_seller_customers_table', 11);
INSERT INTO `migrations` VALUES (268, '2021_06_19_170040_add_col_show_at_home_to_sellers_table', 12);
INSERT INTO `migrations` VALUES (269, '2021_07_11_181250_create_firebase_notification_table', 12);
INSERT INTO `migrations` VALUES (270, '2021_07_11_181310_create_firebase_notification_token_table', 12);
INSERT INTO `migrations` VALUES (272, '2021_09_30_104442_add_column_other_animals_agents_table', 13);
INSERT INTO `migrations` VALUES (273, '2021_09_30_111740_change_column_last_name_addresses_table', 14);
COMMIT;

-- ----------------------------
-- Table structure for order_brands
-- ----------------------------
DROP TABLE IF EXISTS `order_brands`;
CREATE TABLE `order_brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `brand` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_brands_order_id_foreign` (`order_id`),
  KEY `order_brands_order_item_id_foreign` (`order_item_id`),
  KEY `order_brands_product_id_foreign` (`product_id`),
  KEY `order_brands_brand_foreign` (`brand`),
  CONSTRAINT `order_brands_brand_foreign` FOREIGN KEY (`brand`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_brands_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_brands_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_brands_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order_brands
-- ----------------------------
BEGIN;
INSERT INTO `order_brands` VALUES (4, 5, 4, 6, 12, '2021-04-14 15:30:37', '2021-04-14 15:30:37');
INSERT INTO `order_brands` VALUES (8, 32, 32, 13, NULL, '2021-08-31 22:49:54', '2021-08-31 22:49:54');
INSERT INTO `order_brands` VALUES (11, 37, 39, 13, NULL, '2021-09-04 14:14:10', '2021-09-04 14:14:10');
INSERT INTO `order_brands` VALUES (13, 39, 41, 13, NULL, '2021-09-04 16:43:22', '2021-09-04 16:43:22');
INSERT INTO `order_brands` VALUES (14, 40, 42, 14, NULL, '2021-09-04 16:54:49', '2021-09-04 16:54:49');
INSERT INTO `order_brands` VALUES (15, 41, 43, 14, NULL, '2021-09-04 17:05:43', '2021-09-04 17:05:43');
INSERT INTO `order_brands` VALUES (16, 42, 44, 14, NULL, '2021-09-04 17:21:00', '2021-09-04 17:21:00');
INSERT INTO `order_brands` VALUES (18, 43, 46, 13, NULL, '2021-09-04 17:26:10', '2021-09-04 17:26:10');
INSERT INTO `order_brands` VALUES (19, 44, 47, 13, NULL, '2021-09-04 19:00:09', '2021-09-04 19:00:09');
INSERT INTO `order_brands` VALUES (20, 45, 48, 16, NULL, '2021-09-06 22:46:03', '2021-09-06 22:46:03');
INSERT INTO `order_brands` VALUES (21, 46, 49, 13, NULL, '2021-09-06 23:13:10', '2021-09-06 23:13:10');
INSERT INTO `order_brands` VALUES (22, 47, 50, 13, NULL, '2021-09-06 23:14:05', '2021-09-06 23:14:05');
INSERT INTO `order_brands` VALUES (23, 48, 51, 18, NULL, '2021-09-06 23:20:03', '2021-09-06 23:20:03');
INSERT INTO `order_brands` VALUES (24, 50, 53, 18, NULL, '2021-09-12 11:08:13', '2021-09-12 11:08:13');
INSERT INTO `order_brands` VALUES (25, 51, 54, 18, NULL, '2021-09-12 11:49:34', '2021-09-12 11:49:34');
INSERT INTO `order_brands` VALUES (26, 52, 55, 13, NULL, '2021-09-12 11:58:26', '2021-09-12 11:58:26');
INSERT INTO `order_brands` VALUES (27, 53, 56, 14, NULL, '2021-09-12 16:02:47', '2021-09-12 16:02:47');
INSERT INTO `order_brands` VALUES (28, 54, 57, 13, NULL, '2021-09-16 20:59:52', '2021-09-16 20:59:52');
INSERT INTO `order_brands` VALUES (29, 55, 58, 14, NULL, '2021-09-19 19:27:16', '2021-09-19 19:27:16');
INSERT INTO `order_brands` VALUES (30, 55, 59, 18, NULL, '2021-09-19 19:27:16', '2021-09-19 19:27:16');
INSERT INTO `order_brands` VALUES (32, 56, 61, 13, NULL, '2021-09-19 23:09:17', '2021-09-19 23:09:17');
INSERT INTO `order_brands` VALUES (33, 57, 63, 18, NULL, '2021-09-29 22:54:06', '2021-09-29 22:54:06');
INSERT INTO `order_brands` VALUES (34, 61, 68, 18, NULL, '2021-10-01 13:44:59', '2021-10-01 13:44:59');
COMMIT;

-- ----------------------------
-- Table structure for order_comments
-- ----------------------------
DROP TABLE IF EXISTS `order_comments`;
CREATE TABLE `order_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_comments_order_id_foreign` (`order_id`),
  CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order_comments
-- ----------------------------
BEGIN;
INSERT INTO `order_comments` VALUES (1, 'ok nhe', 1, 19, '2021-07-23 10:34:21', '2021-07-23 10:34:21');
INSERT INTO `order_comments` VALUES (2, 'Sẽ giao hàng sớm nhất có thể !!!', 1, 20, '2021-07-23 10:54:37', '2021-07-23 10:54:37');
INSERT INTO `order_comments` VALUES (3, 'đã nhận được.', 1, 24, '2021-07-23 11:53:54', '2021-07-23 11:53:54');
INSERT INTO `order_comments` VALUES (4, 'cac\r\n', 0, 35, '2021-08-31 23:15:23', '2021-08-31 23:15:23');
INSERT INTO `order_comments` VALUES (5, 'ok man', 1, 35, '2021-08-31 23:16:04', '2021-08-31 23:16:04');
COMMIT;

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `total_weight` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` int(11) DEFAULT '0',
  `qty_shipped` int(11) DEFAULT '0',
  `qty_invoiced` int(11) DEFAULT '0',
  `qty_canceled` int(11) DEFAULT '0',
  `qty_refunded` int(11) DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order_items
-- ----------------------------
BEGIN;
INSERT INTO `order_items` VALUES (1, 'skskusk', 'simple', 'Phân bón tổng hợp', NULL, 90.0000, 90.0000, 1, 0, 0, 0, 0, 10.0000, 10.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Product\\Models\\Product', 2, NULL, '{\"_token\": \"4hiuJzW3wXhLxOLPVuUMVi7QEbyLpU4cSOSCPph6\", \"locale\": \"en\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2021-04-14 09:20:24', '2021-04-14 09:20:24');
INSERT INTO `order_items` VALUES (2, 'skskusk', 'simple', 'Phân bón tổng hợp', NULL, 90.0000, 90.0000, 1, 0, 0, 0, 0, 10.0000, 10.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Product\\Models\\Product', 3, NULL, '{\"_token\": \"4hiuJzW3wXhLxOLPVuUMVi7QEbyLpU4cSOSCPph6\", \"locale\": \"en\", \"quantity\": \"1\", \"product_id\": \"1\"}', '2021-04-14 14:27:35', '2021-04-14 14:27:35');
INSERT INTO `order_items` VALUES (3, 'skskusk', 'simple', 'Phân bón tổng hợp', NULL, 90.0000, 180.0000, 2, 0, 0, 0, 0, 20.0000, 20.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Product\\Models\\Product', 4, NULL, '{\"_token\": \"4hiuJzW3wXhLxOLPVuUMVi7QEbyLpU4cSOSCPph6\", \"locale\": \"en\", \"quantity\": 2, \"product_id\": \"1\", \"seller_info\": {\"is_owner\": \"0\", \"seller_id\": \"1\", \"product_id\": \"5\"}}', '2021-04-14 14:37:30', '2021-04-14 14:37:30');
INSERT INTO `order_items` VALUES (4, 'lalala', 'simple', 'Phân bón 1 cua baconco', NULL, 5.0000, 10.0000, 2, 0, 0, 0, 0, 10.0000, 10.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 6, 'Webkul\\Product\\Models\\Product', 5, NULL, '{\"_token\": \"4hiuJzW3wXhLxOLPVuUMVi7QEbyLpU4cSOSCPph6\", \"locale\": \"en\", \"quantity\": 2, \"product_id\": \"6\", \"seller_info\": {\"is_owner\": \"0\", \"seller_id\": \"1\", \"product_id\": \"6\"}}', '2021-04-14 15:30:37', '2021-04-14 15:30:37');
INSERT INTO `order_items` VALUES (5, 'skskusk', 'simple', 'Phân bón tổng hợp', NULL, 10.0000, 20.0000, 2, 2, 2, 0, 0, 15.0000, 15.0000, 30.0000, 30.0000, 30.0000, 30.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Product\\Models\\Product', 6, NULL, '{\"_token\": \"2fUpOL63eVX5fKlitQZkwFtrhzr51tTZDIxes6io\", \"locale\": \"en\", \"quantity\": \"2\", \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2021-05-01 14:20:24', '2021-05-01 14:27:19');
INSERT INTO `order_items` VALUES (6, 'skskusk', 'simple', 'Phân bón tổng hợp', NULL, 10.0000, 10.0000, 1, 0, 0, 1, 0, 15.0000, 15.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Product\\Models\\Product', 7, NULL, '{\"_token\": \"2fUpOL63eVX5fKlitQZkwFtrhzr51tTZDIxes6io\", \"locale\": \"en\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2021-05-01 14:34:30', '2021-05-01 14:34:52');
INSERT INTO `order_items` VALUES (7, 'skskusk', 'simple', 'Phân bón tổng hợp', NULL, 10.0000, 10.0000, 1, 0, 0, 0, 0, 15.0000, 15.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Product\\Models\\Product', 8, NULL, '{\"_token\": \"RhzE7xw1rixmrb5uJCRSNbXjE2FuRLI2kMxNtmKD\", \"locale\": \"en\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2021-05-23 11:10:02', '2021-05-23 11:10:02');
INSERT INTO `order_items` VALUES (8, 'skskusk', 'simple', 'Phân bón tổng hợp', NULL, 10.0000, 10.0000, 1, 0, 0, 0, 0, 15.0000, 15.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Product\\Models\\Product', 9, NULL, '{\"_token\": \"UGqInDy1uQwlg5tV4evadHTzgSQB4UOPdkCH5hoS\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2021-05-29 13:14:53', '2021-05-29 13:14:53');
INSERT INTO `order_items` VALUES (9, 'skskusk', 'simple', 'Đồ việt nam', NULL, 10.0000, 10.0000, 1, 0, 0, 0, 0, 15.0000, 15.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Product\\Models\\Product', 10, NULL, '{\"_token\": \"UGqInDy1uQwlg5tV4evadHTzgSQB4UOPdkCH5hoS\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2021-05-29 13:29:37', '2021-05-29 13:29:37');
INSERT INTO `order_items` VALUES (10, 'skskusk', 'simple', 'Phân bón tổng hợp', NULL, 10.0000, 10.0000, 1, 0, 0, 0, 0, 15.0000, 15.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Product\\Models\\Product', 11, NULL, '{\"locale\": \"en\", \"quantity\": 1, \"product_id\": 1}', '2021-06-27 13:49:12', '2021-06-27 13:49:12');
INSERT INTO `order_items` VALUES (11, 'skskusk', 'simple', 'Phân bón tổng hợp', NULL, 10.0000, 10.0000, 1, 0, 0, 0, 0, 15.0000, 15.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Product\\Models\\Product', 12, NULL, '{\"_token\": \"yck0fGRN98bJr6JzAbKGZhR4cOjedullVjvT8LTi\", \"locale\": \"en\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2021-06-27 14:13:39', '2021-06-27 14:13:39');
INSERT INTO `order_items` VALUES (12, 'skskusk', 'simple', 'Phân bón tổng hợp', NULL, 10.0000, 10.0000, 1, 0, 0, 0, 0, 15.0000, 15.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Product\\Models\\Product', 13, NULL, '{\"_token\": \"yck0fGRN98bJr6JzAbKGZhR4cOjedullVjvT8LTi\", \"locale\": \"en\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2021-06-27 14:29:21', '2021-06-27 14:29:21');
INSERT INTO `order_items` VALUES (13, 'mmdsf', 'simple', NULL, NULL, 5.0000, 5.0000, 1, 0, 0, 0, 0, 20.0000, 20.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 12, 'Webkul\\Product\\Models\\Product', 14, NULL, '{\"_token\": \"yck0fGRN98bJr6JzAbKGZhR4cOjedullVjvT8LTi\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"12\"}', '2021-06-27 14:38:35', '2021-06-27 14:38:35');
INSERT INTO `order_items` VALUES (14, 'skskusk', 'simple', 'Phân bón tổng hợp', NULL, 10.0000, 10.0000, 1, 0, 0, 0, 0, 15.0000, 15.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Product\\Models\\Product', 15, NULL, '{\"locale\": \"vi\", \"quantity\": 1, \"product_id\": 1}', '2021-06-29 20:59:14', '2021-06-29 20:59:14');
INSERT INTO `order_items` VALUES (15, 'skskusk', 'simple', 'Đồ việt nam', NULL, 10.0000, 10.0000, 1, 0, 0, 0, 0, 15.0000, 15.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Product\\Models\\Product', 16, NULL, '{\"_token\": \"nGgotHFr46aYMFUj1QxqnD6YEjnFN8LvPhebLLrf\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2021-06-29 21:05:46', '2021-06-29 21:05:46');
INSERT INTO `order_items` VALUES (16, 'mmdsf', 'simple', 'name', NULL, 5.0000, 10.0000, 2, 0, 0, 0, 0, 9999.0000, 9999.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 12, 'Webkul\\Product\\Models\\Product', 17, NULL, '{\"locale\": \"vi\", \"quantity\": 2, \"product_id\": 12}', '2021-07-21 18:11:59', '2021-07-21 18:11:59');
INSERT INTO `order_items` VALUES (17, 'mmdsf', 'simple', 'tim kiem', NULL, 5.0000, 15.0000, 3, 0, 0, 0, 0, 9999.0000, 9999.0000, 29997.0000, 29997.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 12, 'Webkul\\Product\\Models\\Product', 18, NULL, '{\"locale\": \"vi\", \"quantity\": 3, \"product_id\": 12}', '2021-07-21 18:18:06', '2021-07-21 18:18:06');
INSERT INTO `order_items` VALUES (18, 'mmdsf', 'simple', 'tim kiem', NULL, 5.0000, 10.0000, 2, 2, 2, 0, 0, 9999.0000, 9999.0000, 19998.0000, 19998.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 12, 'Webkul\\Product\\Models\\Product', 19, NULL, '{\"_token\": \"pgmrt01fbXSzfwbtHasAxp9fCRQDfMLa1K9nm2I3\", \"locale\": \"vi\", \"quantity\": \"2\", \"is_buy_now\": \"0\", \"product_id\": \"12\"}', '2021-07-21 18:26:16', '2021-07-23 10:40:34');
INSERT INTO `order_items` VALUES (19, 'mmdsf', 'simple', 'tim kiem', NULL, 5.0000, 5.0000, 1, 0, 1, 0, 0, 9999.0000, 9999.0000, 9999.0000, 9999.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 12, 'Webkul\\Product\\Models\\Product', 20, NULL, '{\"locale\": \"vi\", \"quantity\": 1, \"product_id\": 12}', '2021-07-21 18:29:29', '2021-07-23 11:09:48');
INSERT INTO `order_items` VALUES (20, 'mmdsf', 'simple', 'tim kiem', NULL, 5.0000, 10.0000, 2, 0, 2, 0, 0, 9999.0000, 9999.0000, 19998.0000, 19998.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 12, 'Webkul\\Product\\Models\\Product', 21, NULL, '{\"_token\": \"pgmrt01fbXSzfwbtHasAxp9fCRQDfMLa1K9nm2I3\", \"locale\": \"vi\", \"quantity\": \"2\", \"is_buy_now\": \"0\", \"product_id\": \"12\"}', '2021-07-21 18:38:27', '2021-07-23 11:18:52');
INSERT INTO `order_items` VALUES (21, 'mmdsf', 'simple', 'tim kiem', NULL, 5.0000, 15.0000, 3, 3, 3, 0, 0, 9999.0000, 9999.0000, 29997.0000, 29997.0000, 29997.0000, 29997.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 12, 'Webkul\\Product\\Models\\Product', 22, NULL, '{\"locale\": \"vi\", \"quantity\": 3, \"product_id\": 12}', '2021-07-21 18:42:07', '2021-07-23 11:51:15');
INSERT INTO `order_items` VALUES (22, 'mmdsf', 'simple', 'tim kiem', NULL, 5.0000, 20.0000, 4, 4, 4, 0, 0, 9999.0000, 9999.0000, 39996.0000, 39996.0000, 39996.0000, 39996.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 12, 'Webkul\\Product\\Models\\Product', 23, NULL, '{\"_token\": \"pgmrt01fbXSzfwbtHasAxp9fCRQDfMLa1K9nm2I3\", \"locale\": \"vi\", \"quantity\": \"4\", \"is_buy_now\": \"0\", \"product_id\": \"12\"}', '2021-07-21 18:54:15', '2021-07-23 11:46:30');
INSERT INTO `order_items` VALUES (23, 'mmdsf', 'simple', 'tim kiem', NULL, 5.0000, 5.0000, 1, 1, 1, 0, 0, 9999.0000, 9999.0000, 9999.0000, 9999.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 12, 'Webkul\\Product\\Models\\Product', 24, NULL, '{\"_token\": \"pgmrt01fbXSzfwbtHasAxp9fCRQDfMLa1K9nm2I3\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"12\"}', '2021-07-21 19:09:25', '2021-07-23 11:55:41');
INSERT INTO `order_items` VALUES (24, 'mmdsf', 'simple', 'tim kiem', NULL, 5.0000, 5.0000, 1, 0, 0, 0, 0, 9999.0000, 9999.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 12, 'Webkul\\Product\\Models\\Product', 25, NULL, '{\"_token\": \"pgmrt01fbXSzfwbtHasAxp9fCRQDfMLa1K9nm2I3\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"12\"}', '2021-07-21 19:13:05', '2021-07-21 19:13:05');
INSERT INTO `order_items` VALUES (25, 'mmdsf', 'simple', 'tim kiem', NULL, 5.0000, 10.0000, 2, 0, 0, 0, 0, 9999.0000, 9999.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 12, 'Webkul\\Product\\Models\\Product', 26, NULL, '{\"_token\": \"pgmrt01fbXSzfwbtHasAxp9fCRQDfMLa1K9nm2I3\", \"locale\": \"vi\", \"quantity\": \"2\", \"is_buy_now\": \"0\", \"product_id\": \"12\"}', '2021-07-21 21:21:52', '2021-07-21 21:21:52');
INSERT INTO `order_items` VALUES (26, 'mmdsf', 'simple', 'tim kiem', NULL, 5.0000, 5.0000, 1, 0, 0, 0, 0, 9999.0000, 9999.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 12, 'Webkul\\Product\\Models\\Product', 27, NULL, '{\"_token\": \"pgmrt01fbXSzfwbtHasAxp9fCRQDfMLa1K9nm2I3\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"12\"}', '2021-07-21 21:24:28', '2021-07-21 21:24:28');
INSERT INTO `order_items` VALUES (27, 'mmdsf', 'simple', 'tim kiem', NULL, 5.0000, 5.0000, 1, 0, 0, 0, 0, 9999.0000, 9999.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 12, 'Webkul\\Product\\Models\\Product', 28, NULL, '{\"_token\": \"pgmrt01fbXSzfwbtHasAxp9fCRQDfMLa1K9nm2I3\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"12\"}', '2021-07-21 21:27:40', '2021-07-21 21:27:40');
INSERT INTO `order_items` VALUES (28, 'skskusk', 'simple', 'Đồ việt nam', NULL, 10.0000, 70.0000, 7, 0, 0, 0, 0, 15.0000, 15.0000, 105.0000, 105.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Product\\Models\\Product', 28, NULL, '{\"locale\": \"vi\", \"quantity\": 7, \"product_id\": 1}', '2021-07-21 21:27:40', '2021-07-21 21:27:40');
INSERT INTO `order_items` VALUES (29, 'test3', 'simple', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 20.0000, 40.0000, 2, 0, 0, 0, 0, 19500.0000, 19500.0000, 39000.0000, 39000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 7, 'Webkul\\Product\\Models\\Product', 29, NULL, '{\"locale\": \"vi\", \"quantity\": 2, \"product_id\": 7}', '2021-08-31 20:27:42', '2021-08-31 20:27:42');
INSERT INTO `order_items` VALUES (30, 'test3', 'simple', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 20.0000, 20.0000, 1, 0, 0, 0, 0, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 7, 'Webkul\\Product\\Models\\Product', 30, NULL, '{\"_token\": \"oGqqzDN0G2S6YDKNke6qJFM2NV1t8RCp2ODHc5ub\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"7\"}', '2021-08-31 22:43:20', '2021-08-31 22:43:20');
INSERT INTO `order_items` VALUES (31, 'test3', 'simple', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 20.0000, 20.0000, 1, 0, 0, 0, 0, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 7, 'Webkul\\Product\\Models\\Product', 31, NULL, '{\"_token\": \"oGqqzDN0G2S6YDKNke6qJFM2NV1t8RCp2ODHc5ub\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"7\"}', '2021-08-31 22:46:23', '2021-08-31 22:46:23');
INSERT INTO `order_items` VALUES (32, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 1, 0, 0, 0, 0, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 13, 'Webkul\\Product\\Models\\Product', 32, NULL, '{\"_token\": \"oGqqzDN0G2S6YDKNke6qJFM2NV1t8RCp2ODHc5ub\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', '2021-08-31 22:49:49', '2021-08-31 22:49:49');
INSERT INTO `order_items` VALUES (33, 'test3', 'simple', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 20.0000, 20.0000, 1, 0, 0, 0, 0, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 7, 'Webkul\\Product\\Models\\Product', 33, NULL, '{\"_token\": \"oGqqzDN0G2S6YDKNke6qJFM2NV1t8RCp2ODHc5ub\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"7\"}', '2021-08-31 22:55:29', '2021-08-31 22:55:29');
INSERT INTO `order_items` VALUES (34, 'test3', 'simple', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 20.0000, 20.0000, 1, 0, 0, 0, 0, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 7, 'Webkul\\Product\\Models\\Product', 34, NULL, '{\"_token\": \"oGqqzDN0G2S6YDKNke6qJFM2NV1t8RCp2ODHc5ub\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"7\"}', '2021-08-31 23:09:00', '2021-08-31 23:09:00');
INSERT INTO `order_items` VALUES (35, 'test3', 'simple', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 20.0000, 20.0000, 1, 1, 1, 0, 0, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 7, 'Webkul\\Product\\Models\\Product', 35, NULL, '{\"_token\": \"oGqqzDN0G2S6YDKNke6qJFM2NV1t8RCp2ODHc5ub\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"7\"}', '2021-08-31 23:11:35', '2021-08-31 23:18:44');
INSERT INTO `order_items` VALUES (36, 'test3', 'simple', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 20.0000, 20.0000, 1, 0, 0, 0, 0, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 7, 'Webkul\\Product\\Models\\Product', 36, NULL, '{\"_token\": \"oGqqzDN0G2S6YDKNke6qJFM2NV1t8RCp2ODHc5ub\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"7\"}', '2021-08-31 23:21:27', '2021-08-31 23:21:27');
INSERT INTO `order_items` VALUES (37, 'test6', 'simple', 'Product 9 Product 9 Product 9 Product 9 Product 9', NULL, 4.0000, 4.0000, 1, 0, 0, 0, 0, 100000.0000, 100000.0000, 100000.0000, 100000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 9, 'Webkul\\Product\\Models\\Product', 37, NULL, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"9\"}', '2021-09-04 14:14:06', '2021-09-04 14:14:06');
INSERT INTO `order_items` VALUES (38, 'test3', 'simple', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 20.0000, 20.0000, 1, 0, 0, 0, 0, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 7, 'Webkul\\Product\\Models\\Product', 37, NULL, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"7\"}', '2021-09-04 14:14:06', '2021-09-04 14:14:06');
INSERT INTO `order_items` VALUES (39, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 1, 0, 0, 0, 0, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 13, 'Webkul\\Product\\Models\\Product', 37, NULL, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', '2021-09-04 14:14:06', '2021-09-04 14:14:06');
INSERT INTO `order_items` VALUES (40, 'test3', 'simple', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 20.0000, 20.0000, 1, 0, 0, 0, 0, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 7, 'Webkul\\Product\\Models\\Product', 38, NULL, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"7\"}', '2021-09-04 16:31:54', '2021-09-04 16:31:54');
INSERT INTO `order_items` VALUES (41, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 1, 0, 0, 0, 0, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 13, 'Webkul\\Product\\Models\\Product', 39, NULL, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', '2021-09-04 16:43:18', '2021-09-04 16:43:18');
INSERT INTO `order_items` VALUES (42, 'asmdamsd', 'simple', 'Product 14', NULL, 1.0000, 1.0000, 1, 0, 0, 0, 0, 20000.0000, 20000.0000, 20000.0000, 20000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 14, 'Webkul\\Product\\Models\\Product', 40, NULL, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"14\"}', '2021-09-04 16:54:40', '2021-09-04 16:54:40');
INSERT INTO `order_items` VALUES (43, 'asmdamsd', 'simple', 'Product 14', NULL, 1.0000, 1.0000, 1, 0, 0, 0, 0, 20000.0000, 20000.0000, 20000.0000, 20000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 14, 'Webkul\\Product\\Models\\Product', 41, NULL, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"14\"}', '2021-09-04 17:05:40', '2021-09-04 17:05:40');
INSERT INTO `order_items` VALUES (44, 'asmdamsd', 'simple', 'Product 14', NULL, 1.0000, 1.0000, 1, 0, 0, 0, 0, 20000.0000, 20000.0000, 20000.0000, 20000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 14, 'Webkul\\Product\\Models\\Product', 42, NULL, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"14\"}', '2021-09-04 17:20:57', '2021-09-04 17:20:57');
INSERT INTO `order_items` VALUES (45, 'test6', 'simple', 'Product 9 Product 9 Product 9 Product 9 Product 9', NULL, 4.0000, 4.0000, 1, 0, 0, 0, 0, 100000.0000, 100000.0000, 100000.0000, 100000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 9, 'Webkul\\Product\\Models\\Product', 43, NULL, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"9\"}', '2021-09-04 17:26:07', '2021-09-04 17:26:07');
INSERT INTO `order_items` VALUES (46, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 1, 0, 0, 0, 0, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 13, 'Webkul\\Product\\Models\\Product', 43, NULL, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', '2021-09-04 17:26:07', '2021-09-04 17:26:07');
INSERT INTO `order_items` VALUES (47, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 1, 0, 0, 0, 0, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 13, 'Webkul\\Product\\Models\\Product', 44, NULL, '{\"_token\": \"ccykvjYApf3CM08xrsEBfKHFAq0BSmCPDObPrHne\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', '2021-09-04 19:00:05', '2021-09-04 19:00:05');
INSERT INTO `order_items` VALUES (48, 'hahaha', 'simple', 'Product 16', NULL, 1.0000, 1.0000, 1, 0, 0, 0, 0, 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 16, 'Webkul\\Product\\Models\\Product', 45, NULL, '{\"_token\": \"k7mOuYbfSczCvzANjt9l1Ad4hj3r6TzyiteecQ4v\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"16\"}', '2021-09-06 22:45:58', '2021-09-06 22:45:58');
INSERT INTO `order_items` VALUES (49, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 1, 0, 0, 0, 0, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 13, 'Webkul\\Product\\Models\\Product', 46, NULL, '{\"_token\": \"k7mOuYbfSczCvzANjt9l1Ad4hj3r6TzyiteecQ4v\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', '2021-09-06 23:13:05', '2021-09-06 23:13:05');
INSERT INTO `order_items` VALUES (50, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 1, 0, 0, 0, 0, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 13, 'Webkul\\Product\\Models\\Product', 47, NULL, '{\"_token\": \"k7mOuYbfSczCvzANjt9l1Ad4hj3r6TzyiteecQ4v\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', '2021-09-06 23:14:02', '2021-09-06 23:14:02');
INSERT INTO `order_items` VALUES (51, 'sku-18', 'simple', 'Product 18', NULL, 0.5000, 0.5000, 1, 0, 0, 0, 0, 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 18, 'Webkul\\Product\\Models\\Product', 48, NULL, '{\"_token\": \"k7mOuYbfSczCvzANjt9l1Ad4hj3r6TzyiteecQ4v\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"18\"}', '2021-09-06 23:20:00', '2021-09-06 23:20:00');
INSERT INTO `order_items` VALUES (52, 'test6', 'simple', 'Product 9 Product 9 Product 9 Product 9 Product 9', NULL, 4.0000, 4.0000, 1, 0, 0, 0, 0, 100000.0000, 100000.0000, 100000.0000, 100000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 9, 'Webkul\\Product\\Models\\Product', 49, NULL, '{\"_token\": \"k7mOuYbfSczCvzANjt9l1Ad4hj3r6TzyiteecQ4v\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"9\"}', '2021-09-06 23:23:08', '2021-09-06 23:23:08');
INSERT INTO `order_items` VALUES (53, 'sku-18', 'simple', 'Product 18', NULL, 0.5000, 0.5000, 1, 0, 0, 0, 0, 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 18, 'Webkul\\Product\\Models\\Product', 50, NULL, '{\"_token\": \"cfsV6QrgFWr00Z9GHqjDvHfLXQritpleMCIzh2tM\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"18\"}', '2021-09-12 11:08:09', '2021-09-12 11:08:09');
INSERT INTO `order_items` VALUES (54, 'sku-18', 'simple', 'Product 18', NULL, 0.5000, 0.5000, 1, 0, 0, 0, 0, 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 18, 'Webkul\\Product\\Models\\Product', 51, NULL, '{\"_token\": \"cfsV6QrgFWr00Z9GHqjDvHfLXQritpleMCIzh2tM\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"18\"}', '2021-09-12 11:49:30', '2021-09-12 11:49:30');
INSERT INTO `order_items` VALUES (55, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 1, 0, 0, 0, 0, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 13, 'Webkul\\Product\\Models\\Product', 52, NULL, '{\"_token\": \"cfsV6QrgFWr00Z9GHqjDvHfLXQritpleMCIzh2tM\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', '2021-09-12 11:58:22', '2021-09-12 11:58:22');
INSERT INTO `order_items` VALUES (56, 'asmdamsd', 'simple', 'Product 14', NULL, 1.0000, 1.0000, 1, 0, 0, 0, 0, 20000.0000, 20000.0000, 20000.0000, 20000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 14, 'Webkul\\Product\\Models\\Product', 53, NULL, '{\"_token\": \"cfsV6QrgFWr00Z9GHqjDvHfLXQritpleMCIzh2tM\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"14\"}', '2021-09-12 16:02:42', '2021-09-12 16:02:42');
INSERT INTO `order_items` VALUES (57, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 1, 0, 0, 0, 0, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 13, 'Webkul\\Product\\Models\\Product', 54, NULL, '{\"_token\": \"rxMYMPIc6QCui3g53N5YtGdGJ7x78Bo6NrX1sRpW\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', '2021-09-16 20:59:52', '2021-09-16 20:59:52');
INSERT INTO `order_items` VALUES (58, 'asmdamsd', 'simple', 'Product 14', NULL, 1.0000, 6.0000, 6, 0, 0, 0, 0, 19000.0000, 19000.0000, 114000.0000, 114000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 14, 'Webkul\\Product\\Models\\Product', 55, NULL, '{\"locale\": \"vi\", \"quantity\": 6, \"product_id\": 14}', '2021-09-19 19:27:12', '2021-09-19 19:27:12');
INSERT INTO `order_items` VALUES (59, 'sku-18', 'simple', 'Product 18', NULL, 0.5000, 0.5000, 1, 0, 0, 0, 0, 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 18, 'Webkul\\Product\\Models\\Product', 55, NULL, '{\"_token\": \"XBw5IczuRxkHiaQVgHvL3SngQmhcI6b4rJSH899j\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"18\"}', '2021-09-19 19:27:12', '2021-09-19 19:27:12');
INSERT INTO `order_items` VALUES (60, 'lalala', 'simple', 'Product 6', NULL, 5.0000, 5.0000, 1, 0, 0, 0, 0, 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 6, 'Webkul\\Product\\Models\\Product', 55, NULL, '{\"_token\": \"XBw5IczuRxkHiaQVgHvL3SngQmhcI6b4rJSH899j\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"6\"}', '2021-09-19 19:27:12', '2021-09-19 19:27:12');
INSERT INTO `order_items` VALUES (61, 'mmsadm', 'simple', 'Product 13', NULL, 4.0000, 4.0000, 1, 0, 0, 0, 0, 19000.0000, 19000.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 13, 'Webkul\\Product\\Models\\Product', 56, NULL, '{\"_token\": \"vheHVL3upuNUL4YTiOqzVGPUsutjfhfbwFMcEn4s\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"13\"}', '2021-09-19 23:09:14', '2021-09-19 23:09:14');
INSERT INTO `order_items` VALUES (62, 'lalala', 'simple', 'Product 6', NULL, 5.0000, 5.0000, 1, 0, 0, 0, 0, 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 6, 'Webkul\\Product\\Models\\Product', 56, NULL, '{\"_token\": \"sfumFGqoTtDJ5ZIBoBmQiHXgUcpmttgn1rUJomO4\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"6\"}', '2021-09-19 23:09:14', '2021-09-19 23:09:14');
INSERT INTO `order_items` VALUES (63, 'sku-18', 'simple', 'Product 18', NULL, 0.5000, 0.5000, 1, 0, 0, 0, 0, 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 18, 'Webkul\\Product\\Models\\Product', 57, NULL, '{\"locale\": \"vi\", \"quantity\": 1, \"product_id\": 18}', '2021-09-29 22:54:03', '2021-09-29 22:54:03');
INSERT INTO `order_items` VALUES (64, 'lalala', 'simple', 'Product 6', NULL, 5.0000, 5.0000, 1, 0, 0, 0, 0, 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 6, 'Webkul\\Product\\Models\\Product', 57, NULL, '{\"locale\": \"vi\", \"quantity\": 1, \"product_id\": 6}', '2021-09-29 22:54:03', '2021-09-29 22:54:03');
INSERT INTO `order_items` VALUES (65, 'lalala', 'simple', 'Product 6', NULL, 5.0000, 5.0000, 1, 0, 0, 0, 0, 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 6, 'Webkul\\Product\\Models\\Product', 58, NULL, '{\"locale\": \"vi\", \"quantity\": 1, \"product_id\": 6}', '2021-09-29 23:06:42', '2021-09-29 23:06:42');
INSERT INTO `order_items` VALUES (66, 'lalala', 'simple', 'Product 6', NULL, 5.0000, 5.0000, 1, 0, 0, 0, 0, 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 6, 'Webkul\\Product\\Models\\Product', 59, NULL, '{\"locale\": \"vi\", \"quantity\": 1, \"product_id\": 6}', '2021-09-30 11:22:51', '2021-09-30 11:22:51');
INSERT INTO `order_items` VALUES (67, 'lalala', 'simple', 'Product 6', NULL, 5.0000, 5.0000, 1, 0, 0, 0, 0, 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 6, 'Webkul\\Product\\Models\\Product', 60, NULL, '{\"locale\": \"vi\", \"quantity\": 1, \"product_id\": 6}', '2021-09-30 11:31:58', '2021-09-30 11:31:58');
INSERT INTO `order_items` VALUES (68, 'sku-18', 'simple', 'Product 18', NULL, 0.5000, 0.5000, 1, 0, 0, 0, 0, 8000.0000, 8000.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 18, 'Webkul\\Product\\Models\\Product', 61, NULL, '{\"locale\": \"vi\", \"quantity\": 1, \"product_id\": 18}', '2021-10-01 13:44:55', '2021-10-01 13:44:55');
INSERT INTO `order_items` VALUES (69, 'lalala', 'simple', 'Product 6', NULL, 5.0000, 5.0000, 1, 0, 0, 0, 0, 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 6, 'Webkul\\Product\\Models\\Product', 62, NULL, '{\"locale\": \"vi\", \"quantity\": 1, \"product_id\": 6}', '2021-10-01 14:15:59', '2021-10-01 14:15:59');
INSERT INTO `order_items` VALUES (70, 'lalala', 'simple', 'Product 6', NULL, 5.0000, 5.0000, 1, 0, 0, 0, 0, 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 6, 'Webkul\\Product\\Models\\Product', 63, NULL, '{\"locale\": \"vi\", \"quantity\": 1, \"product_id\": 6}', '2021-10-01 14:18:34', '2021-10-01 14:18:34');
COMMIT;

-- ----------------------------
-- Table structure for order_payment
-- ----------------------------
DROP TABLE IF EXISTS `order_payment`;
CREATE TABLE `order_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_payment_order_id_foreign` (`order_id`),
  CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order_payment
-- ----------------------------
BEGIN;
INSERT INTO `order_payment` VALUES (1, 'cashondelivery', NULL, 2, NULL, '2021-04-14 09:20:24', '2021-04-14 09:20:24');
INSERT INTO `order_payment` VALUES (2, 'cashondelivery', NULL, 3, NULL, '2021-04-14 14:27:35', '2021-04-14 14:27:35');
INSERT INTO `order_payment` VALUES (3, 'cashondelivery', NULL, 4, NULL, '2021-04-14 14:37:30', '2021-04-14 14:37:30');
INSERT INTO `order_payment` VALUES (4, 'cashondelivery', NULL, 5, NULL, '2021-04-14 15:30:37', '2021-04-14 15:30:37');
INSERT INTO `order_payment` VALUES (5, 'cashondelivery', NULL, 6, NULL, '2021-05-01 14:20:24', '2021-05-01 14:20:24');
INSERT INTO `order_payment` VALUES (6, 'paypal_smart_button', NULL, 7, NULL, '2021-05-01 14:34:30', '2021-05-01 14:34:30');
INSERT INTO `order_payment` VALUES (7, 'zalopay', NULL, 8, NULL, '2021-05-23 11:10:02', '2021-05-23 11:10:02');
INSERT INTO `order_payment` VALUES (8, 'cashondelivery', NULL, 9, NULL, '2021-05-29 13:14:53', '2021-05-29 13:14:53');
INSERT INTO `order_payment` VALUES (9, 'cashondelivery', NULL, 10, NULL, '2021-05-29 13:29:37', '2021-05-29 13:29:37');
INSERT INTO `order_payment` VALUES (10, 'cashondelivery', NULL, 11, NULL, '2021-06-27 13:49:12', '2021-06-27 13:49:12');
INSERT INTO `order_payment` VALUES (11, 'cashondelivery', NULL, 12, NULL, '2021-06-27 14:13:39', '2021-06-27 14:13:39');
INSERT INTO `order_payment` VALUES (12, 'cashondelivery', NULL, 13, NULL, '2021-06-27 14:29:21', '2021-06-27 14:29:21');
INSERT INTO `order_payment` VALUES (13, 'cashondelivery', NULL, 14, NULL, '2021-06-27 14:38:35', '2021-06-27 14:38:35');
INSERT INTO `order_payment` VALUES (14, 'cashondelivery', NULL, 15, NULL, '2021-06-29 20:59:14', '2021-06-29 20:59:14');
INSERT INTO `order_payment` VALUES (15, 'cashondelivery', NULL, 16, NULL, '2021-06-29 21:05:46', '2021-06-29 21:05:46');
INSERT INTO `order_payment` VALUES (16, 'cashondelivery', NULL, 17, NULL, '2021-07-21 18:11:59', '2021-07-21 18:11:59');
INSERT INTO `order_payment` VALUES (17, 'cashondelivery', NULL, 18, NULL, '2021-07-21 18:18:06', '2021-07-21 18:18:06');
INSERT INTO `order_payment` VALUES (18, 'cashondelivery', NULL, 19, NULL, '2021-07-21 18:26:16', '2021-07-21 18:26:16');
INSERT INTO `order_payment` VALUES (19, 'cashondelivery', NULL, 20, NULL, '2021-07-21 18:29:29', '2021-07-21 18:29:29');
INSERT INTO `order_payment` VALUES (20, 'cashondelivery', NULL, 21, NULL, '2021-07-21 18:38:27', '2021-07-21 18:38:27');
INSERT INTO `order_payment` VALUES (21, 'cashondelivery', NULL, 22, NULL, '2021-07-21 18:42:07', '2021-07-21 18:42:07');
INSERT INTO `order_payment` VALUES (22, 'cashondelivery', NULL, 23, NULL, '2021-07-21 18:54:15', '2021-07-21 18:54:15');
INSERT INTO `order_payment` VALUES (23, 'cashondelivery', NULL, 24, NULL, '2021-07-21 19:09:25', '2021-07-21 19:09:25');
INSERT INTO `order_payment` VALUES (24, 'cashondelivery', NULL, 25, NULL, '2021-07-21 19:13:05', '2021-07-21 19:13:05');
INSERT INTO `order_payment` VALUES (25, 'cashondelivery', NULL, 26, NULL, '2021-07-21 21:21:52', '2021-07-21 21:21:52');
INSERT INTO `order_payment` VALUES (26, 'moneytransfer', NULL, 27, NULL, '2021-07-21 21:24:28', '2021-07-21 21:24:28');
INSERT INTO `order_payment` VALUES (27, 'cashondelivery', NULL, 28, NULL, '2021-07-21 21:27:40', '2021-07-21 21:27:40');
INSERT INTO `order_payment` VALUES (28, 'cashondelivery', NULL, 29, NULL, '2021-08-31 20:27:42', '2021-08-31 20:27:42');
INSERT INTO `order_payment` VALUES (29, 'cashondelivery', NULL, 30, NULL, '2021-08-31 22:43:20', '2021-08-31 22:43:20');
INSERT INTO `order_payment` VALUES (30, 'cashondelivery', NULL, 31, NULL, '2021-08-31 22:46:23', '2021-08-31 22:46:23');
INSERT INTO `order_payment` VALUES (31, 'cashondelivery', NULL, 32, NULL, '2021-08-31 22:49:49', '2021-08-31 22:49:49');
INSERT INTO `order_payment` VALUES (32, 'cashondelivery', NULL, 33, NULL, '2021-08-31 22:55:29', '2021-08-31 22:55:29');
INSERT INTO `order_payment` VALUES (33, 'moneytransfer', NULL, 34, NULL, '2021-08-31 23:09:00', '2021-08-31 23:09:00');
INSERT INTO `order_payment` VALUES (34, 'moneytransfer', NULL, 35, NULL, '2021-08-31 23:11:35', '2021-08-31 23:11:35');
INSERT INTO `order_payment` VALUES (35, 'zalopay_atm', NULL, 36, NULL, '2021-08-31 23:21:27', '2021-08-31 23:21:27');
INSERT INTO `order_payment` VALUES (36, 'cashondelivery', NULL, 37, NULL, '2021-09-04 14:14:06', '2021-09-04 14:14:06');
INSERT INTO `order_payment` VALUES (37, 'cashondelivery', NULL, 38, NULL, '2021-09-04 16:31:54', '2021-09-04 16:31:54');
INSERT INTO `order_payment` VALUES (38, 'cashondelivery', NULL, 39, NULL, '2021-09-04 16:43:18', '2021-09-04 16:43:18');
INSERT INTO `order_payment` VALUES (39, 'cashondelivery', NULL, 40, NULL, '2021-09-04 16:54:40', '2021-09-04 16:54:40');
INSERT INTO `order_payment` VALUES (40, 'moneytransfer', NULL, 41, NULL, '2021-09-04 17:05:40', '2021-09-04 17:05:40');
INSERT INTO `order_payment` VALUES (41, 'cashondelivery', NULL, 42, NULL, '2021-09-04 17:20:57', '2021-09-04 17:20:57');
INSERT INTO `order_payment` VALUES (42, 'cashondelivery', NULL, 43, NULL, '2021-09-04 17:26:07', '2021-09-04 17:26:07');
INSERT INTO `order_payment` VALUES (43, 'cashondelivery', NULL, 44, NULL, '2021-09-04 19:00:05', '2021-09-04 19:00:05');
INSERT INTO `order_payment` VALUES (44, 'cashondelivery', NULL, 45, NULL, '2021-09-06 22:45:58', '2021-09-06 22:45:58');
INSERT INTO `order_payment` VALUES (45, 'zalopay_atm', NULL, 46, NULL, '2021-09-06 23:13:05', '2021-09-06 23:13:05');
INSERT INTO `order_payment` VALUES (46, 'cashondelivery', NULL, 47, NULL, '2021-09-06 23:14:02', '2021-09-06 23:14:02');
INSERT INTO `order_payment` VALUES (47, 'moneytransfer', NULL, 48, NULL, '2021-09-06 23:20:00', '2021-09-06 23:20:00');
INSERT INTO `order_payment` VALUES (48, 'cashondelivery', NULL, 49, NULL, '2021-09-06 23:23:08', '2021-09-06 23:23:08');
INSERT INTO `order_payment` VALUES (49, 'cashondelivery', NULL, 50, NULL, '2021-09-12 11:08:09', '2021-09-12 11:08:09');
INSERT INTO `order_payment` VALUES (50, 'moneytransfer', NULL, 51, NULL, '2021-09-12 11:49:30', '2021-09-12 11:49:30');
INSERT INTO `order_payment` VALUES (51, 'moneytransfer', NULL, 52, NULL, '2021-09-12 11:58:22', '2021-09-12 11:58:22');
INSERT INTO `order_payment` VALUES (52, 'cashondelivery', NULL, 53, NULL, '2021-09-12 16:02:42', '2021-09-12 16:02:42');
INSERT INTO `order_payment` VALUES (53, 'cashondelivery', NULL, 54, NULL, '2021-09-16 20:59:52', '2021-09-16 20:59:52');
INSERT INTO `order_payment` VALUES (54, 'cashondelivery', NULL, 55, NULL, '2021-09-19 19:27:12', '2021-09-19 19:27:12');
INSERT INTO `order_payment` VALUES (55, 'cashondelivery', NULL, 56, NULL, '2021-09-19 23:09:14', '2021-09-19 23:09:14');
INSERT INTO `order_payment` VALUES (56, 'moneytransfer', NULL, 57, NULL, '2021-09-29 22:54:03', '2021-09-29 22:54:03');
INSERT INTO `order_payment` VALUES (57, 'moneytransfer', NULL, 58, NULL, '2021-09-29 23:06:42', '2021-09-29 23:06:42');
INSERT INTO `order_payment` VALUES (58, 'moneytransfer', NULL, 59, NULL, '2021-09-30 11:22:51', '2021-09-30 11:22:51');
INSERT INTO `order_payment` VALUES (59, 'moneytransfer', NULL, 60, NULL, '2021-09-30 11:31:58', '2021-09-30 11:31:58');
INSERT INTO `order_payment` VALUES (60, 'moneytransfer', NULL, 61, NULL, '2021-10-01 13:44:55', '2021-10-01 13:44:55');
INSERT INTO `order_payment` VALUES (61, 'cashondelivery', NULL, 62, NULL, '2021-10-01 14:15:59', '2021-10-01 14:15:59');
INSERT INTO `order_payment` VALUES (62, 'cashondelivery', NULL, 63, NULL, '2021-10-01 14:18:34', '2021-10-01 14:18:34');
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_vat_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `total_item_count` int(11) DEFAULT NULL,
  `total_qty_ordered` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `customer_id` int(10) unsigned DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int(10) unsigned DEFAULT NULL,
  `channel_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  KEY `orders_channel_id_foreign` (`channel_id`),
  CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES (2, '2', 'pending', 'Default', 0, 'vutruong@gmail.com', 'vu cong truong', 'truong', NULL, NULL, 'flatrate_flatrate', 'Flat Rate - Flat Rate', 'Flat Rate Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 95, 'Webkul\\Customer\\Models\\Customer', NULL, 'Webkul\\Core\\Models\\Channel', '2021-04-14 09:20:24', '2021-04-14 09:20:24', 1, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (3, '3', 'pending', 'Default', 0, 'vutruong@gmail.com', 'vu', 'truong', NULL, NULL, 'flatrate_flatrate', 'Flat Rate - Flat Rate', 'Flat Rate Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 'Webkul\\Customer\\Models\\Customer', NULL, 'Webkul\\Core\\Models\\Channel', '2021-04-14 14:27:35', '2021-04-14 14:27:35', 2, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (4, '4', 'pending', 'Default', 0, 'vutruong@gmail.com', 'Vũ', 'Sơn', NULL, NULL, 'flatrate_flatrate', 'Flat Rate - Flat Rate', 'Flat Rate Shipping', NULL, 0, 1, 2, 'USD', 'USD', 'USD', 60.0000, 60.0000, 0.0000, 0.0000, 0.0000, 0.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 'Webkul\\Customer\\Models\\Customer', NULL, 'Webkul\\Core\\Models\\Channel', '2021-04-14 14:37:30', '2021-04-14 14:37:30', 3, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (5, '5', 'pending', 'Default', 0, 'son@gmail.com', 'Vũ', 'Sơn', NULL, NULL, 'flatrate_flatrate', 'Flat Rate - Flat Rate', 'Flat Rate Shipping', NULL, 0, 1, 2, 'USD', 'USD', 'USD', 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 'Webkul\\Customer\\Models\\Customer', NULL, 'Webkul\\Core\\Models\\Channel', '2021-04-14 15:30:37', '2021-04-14 15:30:37', 4, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (6, '6', 'completed', 'Default', 0, '', '', '', NULL, NULL, 'free_free', 'Free Shipping - Free Shipping', 'Free Shipping', NULL, 0, 1, 2, 'USD', 'USD', 'USD', 30.0000, 30.0000, 30.0000, 30.0000, 0.0000, 0.0000, 30.0000, 30.0000, 30.0000, 30.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 97, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-05-01 14:20:24', '2021-05-01 14:27:19', 1, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (7, '7', 'canceled', 'Default', 0, '', '', '', NULL, NULL, 'free_free', 'Free Shipping - Free Shipping', 'Free Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 97, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-05-01 14:34:30', '2021-05-01 14:34:52', 2, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (8, '8', 'canceled', 'Default', 0, 'shop@gmail.com', 'vu', 'truong', NULL, NULL, 'free_free', 'Free Shipping - Free Shipping', 'Free Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 97, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-05-23 11:10:02', '2021-05-23 11:10:56', 4, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (9, '9', 'pending', NULL, 0, 'yara@gmail.com', 'yara', 'ra', NULL, NULL, 'flatrate_flatrate', 'Flat Rate - Flat Rate', 'Flat Rate Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 25.0000, 25.0000, 0.0000, 0.0000, 0.0000, 0.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 96, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-05-29 13:14:53', '2021-05-29 13:14:53', 8, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (10, '10', 'pending', NULL, 0, 'yara@gmail.com', 'yara', 'ra', NULL, NULL, 'free_free', 'Free Shipping - Free Shipping', 'Free Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 96, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-05-29 13:29:37', '2021-05-29 13:29:37', 9, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (11, '11', 'pending', 'Default', 0, 'truongvc@paxcreation.com', 'ok', '', NULL, NULL, 'flatrate_flatrate', 'Flat Rate - Flat Rate', 'Flat Rate Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 25.0000, 25.0000, 0.0000, 0.0000, 0.0000, 0.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-06-27 13:49:12', '2021-06-27 13:49:12', 16, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (12, '12', 'pending', 'Default', 0, 'truongvc@paxcreation.com', 'vu', 'truong', NULL, NULL, 'flatrate_flatrate', 'Flat Rate - Flat Rate', 'Flat Rate Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 25.0000, 25.0000, 0.0000, 0.0000, 0.0000, 0.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-06-27 14:13:39', '2021-06-27 14:13:39', 17, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (13, '13', 'pending', 'Default', 0, 'truongvc@paxcreation.com', 'vu', 'truong', NULL, NULL, 'free_free', 'Free Shipping - Free Shipping', 'Free Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-06-27 14:29:21', '2021-06-27 14:29:21', 18, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (14, '14', 'pending', NULL, 0, 'truongvc@paxcreation.com', 'vu', 'truong', NULL, NULL, 'flatrate_flatrate', 'Flat Rate - Flat Rate', 'Flat Rate Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 30.0000, 30.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-06-27 14:38:35', '2021-06-27 14:38:35', 19, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (15, '15', 'pending', NULL, 0, 'truongvc@paxcreation.com', 'vu', 'truong', NULL, NULL, 'flatrate_flatrate', 'Flat Rate - Flat Rate', 'Flat Rate Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 25.0000, 25.0000, 0.0000, 0.0000, 0.0000, 0.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-06-29 20:59:14', '2021-06-29 20:59:14', 20, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (16, '16', 'pending', NULL, 0, 'truongvc@paxcreation.com', 'vu', 'truong', NULL, NULL, 'flatrate_flatrate', 'Flat Rate - Flat Rate', 'Flat Rate Shipping', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 25.0000, 25.0000, 0.0000, 0.0000, 0.0000, 0.0000, 15.0000, 15.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-06-29 21:05:46', '2021-06-29 21:05:46', 23, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (17, '17', 'pending', 'Default', 0, 'truongvc@paxcreation.com', 'ok', '', NULL, NULL, 'flatrate_flatrate', 'Flat Rate VN - Flat Rate VN', 'Flat Rate Shipping VN', NULL, 0, 1, 2, 'USD', 'USD', 'USD', 20018.0000, 20018.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-07-21 18:11:59', '2021-07-21 18:11:59', 24, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (18, '18', 'pending', 'Default', 0, 'truongvc@paxcreation.com', 'ok', '', NULL, NULL, 'flatrate_flatrate', 'Flat Rate VN - Flat Rate VN', 'Flat Rate Shipping VN', NULL, 0, 1, 3, 'USD', 'USD', 'USD', 30027.0000, 30027.0000, 0.0000, 0.0000, 0.0000, 0.0000, 29997.0000, 29997.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 30.0000, 30.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-07-21 18:18:06', '2021-07-21 18:18:06', 26, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (19, '19', 'completed', 'Default', 0, 'truongvc@paxcreation.com', 'vu', 'truong', NULL, NULL, 'flatrate_flatrate', 'Flat Rate VN - Flat Rate VN', 'Flat Rate Shipping VN', NULL, 0, 1, 2, 'USD', 'USD', 'USD', 20018.0000, 20018.0000, 20018.0000, 20018.0000, 0.0000, 0.0000, 19998.0000, 19998.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 20.0000, 20.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-07-21 18:26:16', '2021-07-23 10:40:34', 27, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (20, '20', 'processing', 'Default', 0, 'truongvc@paxcreation.com', 'vu', 'truong', NULL, NULL, 'flatrate_flatrate', 'Flat Rate VN - Flat Rate VN', 'Flat Rate Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 10009.0000, 10009.0000, 10009.0000, 10009.0000, 0.0000, 0.0000, 9999.0000, 9999.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 10.0000, 10.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-07-21 18:29:29', '2021-07-23 11:09:48', 28, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (21, '21', 'processing', 'Default', 0, 'truongvc@paxcreation.com', 'vu', 'truong', NULL, NULL, 'flatrate_flatrate', 'Flat Rate VN - Flat Rate VN', 'Flat Rate Shipping VN', NULL, 0, 1, 2, 'USD', 'USD', 'USD', 20018.0000, 20018.0000, 20018.0000, 20018.0000, 0.0000, 0.0000, 19998.0000, 19998.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 20.0000, 20.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-07-21 18:38:27', '2021-07-23 11:18:52', 29, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (22, '22', 'completed', 'Default', 0, 'vucongtruong1998@gmail.com', 'vu', 'truong', NULL, NULL, 'flatrate_flatrate', 'Flat Rate VN - Flat Rate VN', 'Flat Rate Shipping VN', NULL, 0, 1, 3, 'USD', 'USD', 'USD', 30027.0000, 30027.0000, 30027.0000, 30027.0000, 0.0000, 0.0000, 29997.0000, 29997.0000, 29997.0000, 29997.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 30.0000, 30.0000, 30.0000, 30.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-07-21 18:42:07', '2021-07-23 11:51:15', 30, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (23, '23', 'completed', 'Default', 0, 'vucongtruong1998@gmail.com', 'vu', 'truong', NULL, NULL, 'flatrate_flatrate', 'Flat Rate VN - Flat Rate VN', 'Flat Rate Shipping VN', NULL, 0, 1, 4, 'USD', 'USD', 'USD', 40036.0000, 40036.0000, 40036.0000, 40036.0000, 0.0000, 0.0000, 39996.0000, 39996.0000, 39996.0000, 39996.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 40.0000, 40.0000, 40.0000, 40.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-07-21 18:54:15', '2021-07-23 11:46:30', 31, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (24, '24', 'completed', 'Default', 0, 'vucongtruong1998@gmail.com', 'vu', 'truong', NULL, NULL, 'flatrate_flatrate', 'Flat Rate VN - Flat Rate VN', 'Flat Rate Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 10009.0000, 10009.0000, 10009.0000, 10009.0000, 0.0000, 0.0000, 9999.0000, 9999.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 10.0000, 10.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-07-21 19:09:25', '2021-07-23 11:55:41', 32, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (25, '25', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'vu', 'truong', NULL, NULL, 'flatrate_flatrate', 'Flat Rate VN - Flat Rate VN', 'Flat Rate Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 10009.0000, 10009.0000, 0.0000, 0.0000, 0.0000, 0.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-07-21 19:13:05', '2021-07-21 19:13:05', 33, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (26, '26', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'vu', 'truong', NULL, NULL, 'flatrate_flatrate', 'Flat Rate VN - Flat Rate VN', 'Flat Rate Shipping VN', NULL, 0, 1, 2, 'USD', 'USD', 'USD', 20018.0000, 20018.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19998.0000, 19998.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-07-21 21:21:52', '2021-07-21 21:21:52', 34, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (27, '27', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'vu', 'truong', NULL, NULL, 'free_free', 'Free Shipping VN - Free Shipping VN', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 9999.0000, 9999.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-07-21 21:24:28', '2021-07-21 21:24:28', 35, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (28, '28', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'vu', 'truong', NULL, NULL, 'flatrate_flatrate', 'Flat Rate VN - Flat Rate VN', 'Flat Rate Shipping VN', NULL, 0, 2, 8, 'USD', 'USD', 'USD', 10184.0000, 10184.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10104.0000, 10104.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 80.0000, 80.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-07-21 21:27:40', '2021-07-21 21:27:40', 36, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (29, '29', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Free Shipping VN - Free Shipping VN', 'Free Shipping VN', NULL, 0, 1, 2, 'USD', 'USD', 'USD', 39000.0000, 39000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 39000.0000, 39000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-08-31 20:27:42', '2021-08-31 20:27:42', 42, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (30, '30', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Free Shipping VN - Free Shipping VN', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-08-31 22:43:20', '2021-08-31 22:43:20', 44, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (31, '31', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Free Shipping VN - Free Shipping VN', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-08-31 22:46:23', '2021-08-31 22:46:23', 45, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (32, '32', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Free Shipping VN - Free Shipping VN', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-08-31 22:49:49', '2021-08-31 22:49:49', 46, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (33, '33', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Free Shipping VN - Free Shipping VN', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-08-31 22:55:29', '2021-08-31 22:55:29', 47, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (34, '34', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Free Shipping VN - Free Shipping VN', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-08-31 23:09:00', '2021-08-31 23:09:00', 48, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (35, '35', 'completed', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Free Shipping VN - Free Shipping VN', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-08-31 23:11:35', '2021-08-31 23:18:44', 49, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (36, '36', 'canceled', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Free Shipping VN - Free Shipping VN', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-08-31 23:21:27', '2021-08-31 23:25:36', 50, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (37, '37', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Free Shipping VN - Free Shipping VN', 'Free Shipping VN', NULL, 0, 3, 3, 'USD', 'USD', 'USD', 138500.0000, 138500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 138500.0000, 138500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-04 14:14:06', '2021-09-04 14:14:06', 57, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (38, '38', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Free Shipping VN - Free Shipping VN', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19500.0000, 19500.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-04 16:31:54', '2021-09-04 16:31:54', 62, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (39, '39', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'flatrate_flatrate', 'Flat Rate VN - Flat Rate VN', 'Flat Rate Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 19010.0000, 19010.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-04 16:43:18', '2021-09-04 16:43:18', 63, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (40, '40', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'flatrate_flatrate', 'Flat Rate VN - Flat Rate VN', 'Flat Rate Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 20010.0000, 20010.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20000.0000, 20000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-04 16:54:40', '2021-09-04 16:54:40', 64, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (41, '41', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Miễn phí ship - Miễn phí ship', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 20000.0000, 20000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20000.0000, 20000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-04 17:05:40', '2021-09-04 17:05:40', 65, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (42, '42', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Miễn phí ship', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 20000.0000, 20000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20000.0000, 20000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-04 17:20:57', '2021-09-04 17:20:57', 66, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (43, '43', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Miễn phí ship', 'Free Shipping VN', NULL, 0, 2, 2, 'USD', 'USD', 'USD', 119000.0000, 119000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 119000.0000, 119000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-04 17:26:07', '2021-09-04 17:26:07', 67, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (44, '44', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Miễn phí ship', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-04 19:00:05', '2021-09-04 19:00:05', 68, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (45, '45', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Miễn phí ship', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-06 22:45:58', '2021-09-06 22:45:58', 72, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (46, 'KILIMO-00000000046', 'pending_payment', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Miễn phí ship', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-06 23:13:05', '2021-09-06 23:13:05', 73, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (47, 'KILIMO-00000000047', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Miễn phí ship', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-06 23:14:02', '2021-09-06 23:14:02', 73, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (48, 'KILIMO-00000000048', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Miễn phí ship', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-06 23:20:00', '2021-09-06 23:20:00', 74, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (49, 'KILIMO-00000000049', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Miễn phí ship', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 100000.0000, 100000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100000.0000, 100000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-06 23:23:08', '2021-09-06 23:23:08', 75, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (50, 'KILIMO-00000000050', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Miễn phí ship', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-12 11:08:09', '2021-09-12 11:08:09', 76, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (51, 'KILIMO-00000000051', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Miễn phí ship', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-12 11:49:30', '2021-09-12 11:49:30', 77, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (52, 'KILIMO-00000000052', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Miễn phí ship', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-12 11:58:22', '2021-09-12 11:58:22', 78, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (53, 'KILIMO-00000000053', 'pending', 'Default', 0, 'vucongtruong1998@gmail.com', 'ok', '', NULL, NULL, 'free_free', 'Miễn phí ship', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 20000.0000, 20000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20000.0000, 20000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-12 16:02:42', '2021-09-12 16:02:42', 79, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (54, 'KILIMO-00000000054', 'pending', 'Default', 0, 'NULL', 'ok', '', NULL, NULL, 'free_free', 'Miễn phí ship', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19000.0000, 19000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-16 20:59:52', '2021-09-16 20:59:52', 80, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (55, 'KILIMO-00000000055', 'pending', 'Default', 0, 'agent@kilimo.vn', 'ok', '', NULL, NULL, 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', NULL, 0, 3, 8, 'USD', 'USD', 'USD', 122120.0000, 122120.0000, 0.0000, 0.0000, 0.0000, 0.0000, 122040.0000, 122040.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 80.0000, 80.0000, 0.0000, 0.0000, 0.0000, 0.0000, 106, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-19 19:27:12', '2021-09-19 19:27:12', 83, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (56, 'KILIMO-00000000056', 'pending', 'Default', 0, 'truong@gmail.com', 'test', 'truong', NULL, NULL, 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', NULL, 0, 2, 2, 'USD', 'USD', 'USD', 19060.0000, 19060.0000, 0.0000, 0.0000, 0.0000, 0.0000, 19040.0000, 19040.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-19 23:09:14', '2021-09-19 23:09:14', 82, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (57, 'KILIMO-00000000057', 'pending', 'Default', 0, 'truong@gmail.com', 'test', 'truong', NULL, NULL, 'free_free', 'Miễn phí ship', 'Free Shipping VN', NULL, 0, 2, 2, 'USD', 'USD', 'USD', 8040.0000, 8040.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8040.0000, 8040.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-29 22:54:03', '2021-09-29 22:54:03', 86, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (58, 'KILIMO-00000000058', 'pending', 'Default', 0, 'truong@gmail.com', 'test', 'truong', NULL, NULL, 'free_free', 'Miễn phí ship', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-29 23:06:42', '2021-09-29 23:06:42', 87, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (59, 'KILIMO-00000000059', 'pending', 'Default', 0, 'truong@gmail.com', 'test', 'truong', NULL, NULL, 'free_free', 'Miễn phí ship', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-30 11:22:51', '2021-09-30 11:22:51', 88, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (60, 'KILIMO-00000000060', 'pending', 'Default', 0, 'truong@gmail.com', 'test truong', '', NULL, NULL, 'free_free', 'Miễn phí ship', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-09-30 11:31:58', '2021-09-30 11:31:58', 89, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (61, 'KILIMO-00000000061', 'pending', 'Default', 0, 'ok@gmail.com', 'vu cong truong', NULL, NULL, NULL, 'free_free', 'Miễn phí ship', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 8000.0000, 8000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 125, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-10-01 13:44:55', '2021-10-01 13:44:55', 90, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (62, 'KILIMO-00000000062', 'pending', 'Default', 0, 'ok@gmail.com', 'vu cong truong null', NULL, NULL, NULL, 'free_free', 'Miễn phí ship', 'Free Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 125, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-10-01 14:15:59', '2021-10-01 14:15:59', 91, '', 0.0000, 0.0000);
INSERT INTO `orders` VALUES (63, 'KILIMO-00000000063', 'pending', 'Default', 0, 'ok@gmail.com', 'vu cong truong null', NULL, NULL, NULL, 'flatrate_flatrate', 'Flat Rate VN', 'Flat Rate Shipping VN', NULL, 0, 1, 1, 'USD', 'USD', 'USD', 50.0000, 50.0000, 0.0000, 0.0000, 0.0000, 0.0000, 40.0000, 40.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 125, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', '2021-10-01 14:18:34', '2021-10-01 14:18:34', 92, '', 0.0000, 0.0000);
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for phone_codes
-- ----------------------------
DROP TABLE IF EXISTS `phone_codes`;
CREATE TABLE `phone_codes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of phone_codes
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `product_attribute_values`;
CREATE TABLE `product_attribute_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_value` text COLLATE utf8mb4_unicode_ci,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` json DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  KEY `product_attribute_values_product_id_foreign` (`product_id`),
  KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=698 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_attribute_values
-- ----------------------------
BEGIN;
INSERT INTO `product_attribute_values` VALUES (88, 'en', 'default', '<p>product 4</p>', NULL, NULL, NULL, NULL, NULL, NULL, 4, 9);
INSERT INTO `product_attribute_values` VALUES (89, 'en', 'default', '<p>product 4</p>', NULL, NULL, NULL, NULL, NULL, NULL, 4, 10);
INSERT INTO `product_attribute_values` VALUES (91, NULL, NULL, 'test4', NULL, NULL, NULL, NULL, NULL, NULL, 4, 1);
INSERT INTO `product_attribute_values` VALUES (92, 'en', 'default', 'Product 4', NULL, NULL, NULL, NULL, NULL, NULL, 4, 2);
INSERT INTO `product_attribute_values` VALUES (93, NULL, NULL, 'product-4', NULL, NULL, NULL, NULL, NULL, NULL, 4, 3);
INSERT INTO `product_attribute_values` VALUES (94, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 4, 4);
INSERT INTO `product_attribute_values` VALUES (95, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 5);
INSERT INTO `product_attribute_values` VALUES (96, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 6);
INSERT INTO `product_attribute_values` VALUES (97, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 7);
INSERT INTO `product_attribute_values` VALUES (98, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 8);
INSERT INTO `product_attribute_values` VALUES (99, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 4, 23);
INSERT INTO `product_attribute_values` VALUES (100, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 4, 24);
INSERT INTO `product_attribute_values` VALUES (101, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, 4, 25);
INSERT INTO `product_attribute_values` VALUES (102, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 26);
INSERT INTO `product_attribute_values` VALUES (103, NULL, NULL, 'asdkasd', NULL, NULL, NULL, NULL, NULL, NULL, 4, 27);
INSERT INTO `product_attribute_values` VALUES (104, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 16);
INSERT INTO `product_attribute_values` VALUES (105, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 17);
INSERT INTO `product_attribute_values` VALUES (106, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 18);
INSERT INTO `product_attribute_values` VALUES (107, NULL, NULL, NULL, NULL, NULL, 5.0000, NULL, NULL, NULL, 4, 11);
INSERT INTO `product_attribute_values` VALUES (108, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 12);
INSERT INTO `product_attribute_values` VALUES (109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 13);
INSERT INTO `product_attribute_values` VALUES (110, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 14);
INSERT INTO `product_attribute_values` VALUES (111, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 15);
INSERT INTO `product_attribute_values` VALUES (112, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 19);
INSERT INTO `product_attribute_values` VALUES (113, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 20);
INSERT INTO `product_attribute_values` VALUES (114, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 21);
INSERT INTO `product_attribute_values` VALUES (115, NULL, NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, 4, 22);
INSERT INTO `product_attribute_values` VALUES (146, 'en', 'default', '<p>Product 6</p>', NULL, NULL, NULL, NULL, NULL, NULL, 6, 9);
INSERT INTO `product_attribute_values` VALUES (147, 'en', 'default', '<p>Product 6</p>', NULL, NULL, NULL, NULL, NULL, NULL, 6, 10);
INSERT INTO `product_attribute_values` VALUES (149, NULL, NULL, 'lalala', NULL, NULL, NULL, NULL, NULL, NULL, 6, 1);
INSERT INTO `product_attribute_values` VALUES (150, 'en', 'default', 'Product 6', NULL, NULL, NULL, NULL, NULL, NULL, 6, 2);
INSERT INTO `product_attribute_values` VALUES (151, NULL, NULL, 'product-6', NULL, NULL, NULL, NULL, NULL, NULL, 6, 3);
INSERT INTO `product_attribute_values` VALUES (152, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 6, 4);
INSERT INTO `product_attribute_values` VALUES (153, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 5);
INSERT INTO `product_attribute_values` VALUES (154, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 6);
INSERT INTO `product_attribute_values` VALUES (155, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 7);
INSERT INTO `product_attribute_values` VALUES (156, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 8);
INSERT INTO `product_attribute_values` VALUES (157, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 23);
INSERT INTO `product_attribute_values` VALUES (158, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 6, 24);
INSERT INTO `product_attribute_values` VALUES (159, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, 6, 25);
INSERT INTO `product_attribute_values` VALUES (160, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 26);
INSERT INTO `product_attribute_values` VALUES (161, NULL, NULL, '010', NULL, NULL, NULL, NULL, NULL, NULL, 6, 27);
INSERT INTO `product_attribute_values` VALUES (163, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 16);
INSERT INTO `product_attribute_values` VALUES (164, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 17);
INSERT INTO `product_attribute_values` VALUES (165, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 18);
INSERT INTO `product_attribute_values` VALUES (166, NULL, NULL, NULL, NULL, NULL, 40.0000, NULL, NULL, NULL, 6, 11);
INSERT INTO `product_attribute_values` VALUES (167, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 12);
INSERT INTO `product_attribute_values` VALUES (168, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 13);
INSERT INTO `product_attribute_values` VALUES (169, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 14);
INSERT INTO `product_attribute_values` VALUES (170, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 15);
INSERT INTO `product_attribute_values` VALUES (171, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 19);
INSERT INTO `product_attribute_values` VALUES (172, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 20);
INSERT INTO `product_attribute_values` VALUES (173, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 21);
INSERT INTO `product_attribute_values` VALUES (174, NULL, NULL, '5', NULL, NULL, NULL, NULL, NULL, NULL, 6, 22);
INSERT INTO `product_attribute_values` VALUES (175, 'en', 'default', '<p>Product 7</p>', NULL, NULL, NULL, NULL, NULL, NULL, 7, 9);
INSERT INTO `product_attribute_values` VALUES (176, 'en', 'default', '<p>Product 7</p>', NULL, NULL, NULL, NULL, NULL, NULL, 7, 10);
INSERT INTO `product_attribute_values` VALUES (178, NULL, NULL, 'test3', NULL, NULL, NULL, NULL, NULL, NULL, 7, 1);
INSERT INTO `product_attribute_values` VALUES (179, 'en', 'default', 'Product 7', NULL, NULL, NULL, NULL, NULL, NULL, 7, 2);
INSERT INTO `product_attribute_values` VALUES (180, NULL, NULL, 'product-7', NULL, NULL, NULL, NULL, NULL, NULL, 7, 3);
INSERT INTO `product_attribute_values` VALUES (181, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 7, 4);
INSERT INTO `product_attribute_values` VALUES (182, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 5);
INSERT INTO `product_attribute_values` VALUES (183, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 6);
INSERT INTO `product_attribute_values` VALUES (184, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 7);
INSERT INTO `product_attribute_values` VALUES (185, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 8);
INSERT INTO `product_attribute_values` VALUES (186, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 7, 23);
INSERT INTO `product_attribute_values` VALUES (187, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 7, 24);
INSERT INTO `product_attribute_values` VALUES (188, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, 7, 25);
INSERT INTO `product_attribute_values` VALUES (189, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 26);
INSERT INTO `product_attribute_values` VALUES (190, NULL, NULL, '12321', NULL, NULL, NULL, NULL, NULL, NULL, 7, 27);
INSERT INTO `product_attribute_values` VALUES (191, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 16);
INSERT INTO `product_attribute_values` VALUES (192, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 17);
INSERT INTO `product_attribute_values` VALUES (193, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 18);
INSERT INTO `product_attribute_values` VALUES (194, NULL, NULL, NULL, NULL, NULL, 19500.0000, NULL, NULL, NULL, 7, 11);
INSERT INTO `product_attribute_values` VALUES (195, NULL, 'default', NULL, NULL, NULL, 20000.0000, NULL, NULL, NULL, 7, 12);
INSERT INTO `product_attribute_values` VALUES (196, NULL, NULL, NULL, NULL, NULL, 18500.0000, NULL, NULL, NULL, 7, 13);
INSERT INTO `product_attribute_values` VALUES (197, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2021-08-13', NULL, 7, 14);
INSERT INTO `product_attribute_values` VALUES (198, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2021-08-26', NULL, 7, 15);
INSERT INTO `product_attribute_values` VALUES (199, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 19);
INSERT INTO `product_attribute_values` VALUES (200, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 20);
INSERT INTO `product_attribute_values` VALUES (201, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 21);
INSERT INTO `product_attribute_values` VALUES (202, NULL, NULL, '20', NULL, NULL, NULL, NULL, NULL, NULL, 7, 22);
INSERT INTO `product_attribute_values` VALUES (203, 'en', 'default', '<p>cac</p>', NULL, NULL, NULL, NULL, NULL, NULL, 8, 9);
INSERT INTO `product_attribute_values` VALUES (204, 'en', 'default', '<p>cac</p>', NULL, NULL, NULL, NULL, NULL, NULL, 8, 10);
INSERT INTO `product_attribute_values` VALUES (206, NULL, NULL, 'test5', NULL, NULL, NULL, NULL, NULL, NULL, 8, 1);
INSERT INTO `product_attribute_values` VALUES (207, 'en', 'default', 'Product 5', NULL, NULL, NULL, NULL, NULL, NULL, 8, 2);
INSERT INTO `product_attribute_values` VALUES (208, NULL, NULL, 'product-5', NULL, NULL, NULL, NULL, NULL, NULL, 8, 3);
INSERT INTO `product_attribute_values` VALUES (209, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 8, 4);
INSERT INTO `product_attribute_values` VALUES (210, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 5);
INSERT INTO `product_attribute_values` VALUES (211, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 6);
INSERT INTO `product_attribute_values` VALUES (212, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 7);
INSERT INTO `product_attribute_values` VALUES (213, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 8);
INSERT INTO `product_attribute_values` VALUES (214, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 23);
INSERT INTO `product_attribute_values` VALUES (215, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 8, 24);
INSERT INTO `product_attribute_values` VALUES (216, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, 8, 25);
INSERT INTO `product_attribute_values` VALUES (217, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 26);
INSERT INTO `product_attribute_values` VALUES (218, NULL, NULL, '3882', NULL, NULL, NULL, NULL, NULL, NULL, 8, 27);
INSERT INTO `product_attribute_values` VALUES (220, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 8, 16);
INSERT INTO `product_attribute_values` VALUES (221, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 8, 17);
INSERT INTO `product_attribute_values` VALUES (222, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 8, 18);
INSERT INTO `product_attribute_values` VALUES (223, NULL, NULL, NULL, NULL, NULL, 20.0000, NULL, NULL, NULL, 8, 11);
INSERT INTO `product_attribute_values` VALUES (224, NULL, 'default', NULL, NULL, NULL, 10.0000, NULL, NULL, NULL, 8, 12);
INSERT INTO `product_attribute_values` VALUES (225, NULL, NULL, NULL, NULL, NULL, 10.0000, NULL, NULL, NULL, 8, 13);
INSERT INTO `product_attribute_values` VALUES (226, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 14);
INSERT INTO `product_attribute_values` VALUES (227, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 15);
INSERT INTO `product_attribute_values` VALUES (228, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 8, 19);
INSERT INTO `product_attribute_values` VALUES (229, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 8, 20);
INSERT INTO `product_attribute_values` VALUES (230, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 8, 21);
INSERT INTO `product_attribute_values` VALUES (231, NULL, NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, 8, 22);
INSERT INTO `product_attribute_values` VALUES (233, 'en', 'default', '<p>Product 9</p>', NULL, NULL, NULL, NULL, NULL, NULL, 9, 9);
INSERT INTO `product_attribute_values` VALUES (234, 'en', 'default', '<p>Product 9</p>', NULL, NULL, NULL, NULL, NULL, NULL, 9, 10);
INSERT INTO `product_attribute_values` VALUES (236, NULL, NULL, 'test6', NULL, NULL, NULL, NULL, NULL, NULL, 9, 1);
INSERT INTO `product_attribute_values` VALUES (237, 'en', 'default', 'Product 9', NULL, NULL, NULL, NULL, NULL, NULL, 9, 2);
INSERT INTO `product_attribute_values` VALUES (238, NULL, NULL, 'product-9', NULL, NULL, NULL, NULL, NULL, NULL, 9, 3);
INSERT INTO `product_attribute_values` VALUES (239, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 9, 4);
INSERT INTO `product_attribute_values` VALUES (240, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 5);
INSERT INTO `product_attribute_values` VALUES (241, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 6);
INSERT INTO `product_attribute_values` VALUES (242, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 7);
INSERT INTO `product_attribute_values` VALUES (243, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 8);
INSERT INTO `product_attribute_values` VALUES (244, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 9, 23);
INSERT INTO `product_attribute_values` VALUES (245, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 9, 24);
INSERT INTO `product_attribute_values` VALUES (246, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, 9, 25);
INSERT INTO `product_attribute_values` VALUES (247, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 26);
INSERT INTO `product_attribute_values` VALUES (248, NULL, NULL, '121', NULL, NULL, NULL, NULL, NULL, NULL, 9, 27);
INSERT INTO `product_attribute_values` VALUES (250, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 16);
INSERT INTO `product_attribute_values` VALUES (251, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 17);
INSERT INTO `product_attribute_values` VALUES (252, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 18);
INSERT INTO `product_attribute_values` VALUES (253, NULL, NULL, NULL, NULL, NULL, 100000.0000, NULL, NULL, NULL, 9, 11);
INSERT INTO `product_attribute_values` VALUES (254, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 12);
INSERT INTO `product_attribute_values` VALUES (255, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 13);
INSERT INTO `product_attribute_values` VALUES (256, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 14);
INSERT INTO `product_attribute_values` VALUES (257, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 15);
INSERT INTO `product_attribute_values` VALUES (258, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 19);
INSERT INTO `product_attribute_values` VALUES (259, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 20);
INSERT INTO `product_attribute_values` VALUES (260, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 21);
INSERT INTO `product_attribute_values` VALUES (261, NULL, NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, 9, 22);
INSERT INTO `product_attribute_values` VALUES (275, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 11, 8);
INSERT INTO `product_attribute_values` VALUES (341, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 32);
INSERT INTO `product_attribute_values` VALUES (342, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 33);
INSERT INTO `product_attribute_values` VALUES (343, 'vi', 'default', '<p>product 4</p>', NULL, NULL, NULL, NULL, NULL, NULL, 4, 9);
INSERT INTO `product_attribute_values` VALUES (344, 'vi', 'default', '<p>product 4</p>', NULL, NULL, NULL, NULL, NULL, NULL, 4, 10);
INSERT INTO `product_attribute_values` VALUES (345, 'vi', 'default', 'Product 4', NULL, NULL, NULL, NULL, NULL, NULL, 4, 2);
INSERT INTO `product_attribute_values` VALUES (346, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 16);
INSERT INTO `product_attribute_values` VALUES (347, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 17);
INSERT INTO `product_attribute_values` VALUES (348, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 18);
INSERT INTO `product_attribute_values` VALUES (349, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 32);
INSERT INTO `product_attribute_values` VALUES (350, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 33);
INSERT INTO `product_attribute_values` VALUES (351, 'vi', 'default', '<p>Product 9</p>', NULL, NULL, NULL, NULL, NULL, NULL, 9, 9);
INSERT INTO `product_attribute_values` VALUES (352, 'vi', 'default', '<p>Product 9</p>', NULL, NULL, NULL, NULL, NULL, NULL, 9, 10);
INSERT INTO `product_attribute_values` VALUES (353, 'vi', 'default', 'Product 9 Product 9 Product 9 Product 9 Product 9', NULL, NULL, NULL, NULL, NULL, NULL, 9, 2);
INSERT INTO `product_attribute_values` VALUES (354, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 16);
INSERT INTO `product_attribute_values` VALUES (355, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 17);
INSERT INTO `product_attribute_values` VALUES (356, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 18);
INSERT INTO `product_attribute_values` VALUES (357, 'en', 'default', '<p>Product 11</p>', NULL, NULL, NULL, NULL, NULL, NULL, 11, 9);
INSERT INTO `product_attribute_values` VALUES (358, 'en', 'default', '<p>Product 11</p>', NULL, NULL, NULL, NULL, NULL, NULL, 11, 10);
INSERT INTO `product_attribute_values` VALUES (359, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 32);
INSERT INTO `product_attribute_values` VALUES (360, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 33);
INSERT INTO `product_attribute_values` VALUES (361, NULL, NULL, 'temporary-sku-540fda', NULL, NULL, NULL, NULL, NULL, NULL, 11, 1);
INSERT INTO `product_attribute_values` VALUES (362, 'en', 'default', 'Product 11', NULL, NULL, NULL, NULL, NULL, NULL, 11, 2);
INSERT INTO `product_attribute_values` VALUES (363, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 11, 3);
INSERT INTO `product_attribute_values` VALUES (364, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 11, 4);
INSERT INTO `product_attribute_values` VALUES (365, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 11, 5);
INSERT INTO `product_attribute_values` VALUES (366, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 11, 6);
INSERT INTO `product_attribute_values` VALUES (367, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 11, 7);
INSERT INTO `product_attribute_values` VALUES (368, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 11, 23);
INSERT INTO `product_attribute_values` VALUES (369, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 11, 24);
INSERT INTO `product_attribute_values` VALUES (370, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 11, 26);
INSERT INTO `product_attribute_values` VALUES (371, NULL, NULL, '212', NULL, NULL, NULL, NULL, NULL, NULL, 11, 27);
INSERT INTO `product_attribute_values` VALUES (372, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 16);
INSERT INTO `product_attribute_values` VALUES (373, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 17);
INSERT INTO `product_attribute_values` VALUES (374, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 18);
INSERT INTO `product_attribute_values` VALUES (375, NULL, NULL, NULL, NULL, NULL, 9000.0000, NULL, NULL, NULL, 11, 11);
INSERT INTO `product_attribute_values` VALUES (376, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 12);
INSERT INTO `product_attribute_values` VALUES (377, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 13);
INSERT INTO `product_attribute_values` VALUES (378, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 14);
INSERT INTO `product_attribute_values` VALUES (379, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 15);
INSERT INTO `product_attribute_values` VALUES (380, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 19);
INSERT INTO `product_attribute_values` VALUES (381, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 20);
INSERT INTO `product_attribute_values` VALUES (382, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 21);
INSERT INTO `product_attribute_values` VALUES (383, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 11, 22);
INSERT INTO `product_attribute_values` VALUES (384, 'vi', 'default', '<p>Product 11</p>', NULL, NULL, NULL, NULL, NULL, NULL, 11, 9);
INSERT INTO `product_attribute_values` VALUES (385, 'vi', 'default', '<p>Product 11</p>', NULL, NULL, NULL, NULL, NULL, NULL, 11, 10);
INSERT INTO `product_attribute_values` VALUES (386, 'vi', 'default', 'Product 11', NULL, NULL, NULL, NULL, NULL, NULL, 11, 2);
INSERT INTO `product_attribute_values` VALUES (387, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 16);
INSERT INTO `product_attribute_values` VALUES (388, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 17);
INSERT INTO `product_attribute_values` VALUES (389, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 18);
INSERT INTO `product_attribute_values` VALUES (390, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 32);
INSERT INTO `product_attribute_values` VALUES (391, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 33);
INSERT INTO `product_attribute_values` VALUES (392, 'vi', 'default', '<p>Product 7</p>', NULL, NULL, NULL, NULL, NULL, NULL, 7, 9);
INSERT INTO `product_attribute_values` VALUES (393, 'vi', 'default', '<p>Product 7</p>', NULL, NULL, NULL, NULL, NULL, NULL, 7, 10);
INSERT INTO `product_attribute_values` VALUES (394, 'vi', 'default', 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, NULL, NULL, NULL, NULL, NULL, 7, 2);
INSERT INTO `product_attribute_values` VALUES (395, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 16);
INSERT INTO `product_attribute_values` VALUES (396, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 17);
INSERT INTO `product_attribute_values` VALUES (397, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 18);
INSERT INTO `product_attribute_values` VALUES (398, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 32);
INSERT INTO `product_attribute_values` VALUES (399, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 33);
INSERT INTO `product_attribute_values` VALUES (400, 'vi', 'default', '<p>Product 6</p>', NULL, NULL, NULL, NULL, NULL, NULL, 6, 9);
INSERT INTO `product_attribute_values` VALUES (401, 'vi', 'default', '<p>Product 6</p>', NULL, NULL, NULL, NULL, NULL, NULL, 6, 10);
INSERT INTO `product_attribute_values` VALUES (402, 'vi', 'default', 'Product 6', NULL, NULL, NULL, NULL, NULL, NULL, 6, 2);
INSERT INTO `product_attribute_values` VALUES (403, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 16);
INSERT INTO `product_attribute_values` VALUES (404, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 17);
INSERT INTO `product_attribute_values` VALUES (405, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 18);
INSERT INTO `product_attribute_values` VALUES (416, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 34);
INSERT INTO `product_attribute_values` VALUES (417, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 35);
INSERT INTO `product_attribute_values` VALUES (418, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 36);
INSERT INTO `product_attribute_values` VALUES (422, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 6, 34);
INSERT INTO `product_attribute_values` VALUES (423, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 6, 35);
INSERT INTO `product_attribute_values` VALUES (424, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 36);
INSERT INTO `product_attribute_values` VALUES (425, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 34);
INSERT INTO `product_attribute_values` VALUES (426, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 7, 35);
INSERT INTO `product_attribute_values` VALUES (427, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 7, 36);
INSERT INTO `product_attribute_values` VALUES (428, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 34);
INSERT INTO `product_attribute_values` VALUES (429, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 9, 35);
INSERT INTO `product_attribute_values` VALUES (430, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 9, 36);
INSERT INTO `product_attribute_values` VALUES (442, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 11, 34);
INSERT INTO `product_attribute_values` VALUES (443, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 35);
INSERT INTO `product_attribute_values` VALUES (444, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 11, 36);
INSERT INTO `product_attribute_values` VALUES (445, 'en', 'default', '<p>Product 13</p>', NULL, NULL, NULL, NULL, NULL, NULL, 13, 9);
INSERT INTO `product_attribute_values` VALUES (446, 'en', 'default', '<p>Product 13</p>', NULL, NULL, NULL, NULL, NULL, NULL, 13, 10);
INSERT INTO `product_attribute_values` VALUES (447, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 32);
INSERT INTO `product_attribute_values` VALUES (448, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 33);
INSERT INTO `product_attribute_values` VALUES (449, NULL, NULL, 'mmsadm', NULL, NULL, NULL, NULL, NULL, NULL, 13, 1);
INSERT INTO `product_attribute_values` VALUES (450, 'en', 'default', 'Product 13', NULL, NULL, NULL, NULL, NULL, NULL, 13, 2);
INSERT INTO `product_attribute_values` VALUES (451, NULL, NULL, 'product-13', NULL, NULL, NULL, NULL, NULL, NULL, 13, 3);
INSERT INTO `product_attribute_values` VALUES (452, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 13, 4);
INSERT INTO `product_attribute_values` VALUES (453, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 5);
INSERT INTO `product_attribute_values` VALUES (454, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 6);
INSERT INTO `product_attribute_values` VALUES (455, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 7);
INSERT INTO `product_attribute_values` VALUES (456, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 8);
INSERT INTO `product_attribute_values` VALUES (457, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 13, 23);
INSERT INTO `product_attribute_values` VALUES (458, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 13, 24);
INSERT INTO `product_attribute_values` VALUES (459, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 26);
INSERT INTO `product_attribute_values` VALUES (460, NULL, NULL, '92439', NULL, NULL, NULL, NULL, NULL, NULL, 13, 27);
INSERT INTO `product_attribute_values` VALUES (461, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 34);
INSERT INTO `product_attribute_values` VALUES (462, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 13, 35);
INSERT INTO `product_attribute_values` VALUES (463, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 13, 36);
INSERT INTO `product_attribute_values` VALUES (464, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 16);
INSERT INTO `product_attribute_values` VALUES (465, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 17);
INSERT INTO `product_attribute_values` VALUES (466, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 18);
INSERT INTO `product_attribute_values` VALUES (467, NULL, NULL, NULL, NULL, NULL, 19000.0000, NULL, NULL, NULL, 13, 11);
INSERT INTO `product_attribute_values` VALUES (468, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 12);
INSERT INTO `product_attribute_values` VALUES (469, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 13);
INSERT INTO `product_attribute_values` VALUES (470, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 14);
INSERT INTO `product_attribute_values` VALUES (471, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 15);
INSERT INTO `product_attribute_values` VALUES (472, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 19);
INSERT INTO `product_attribute_values` VALUES (473, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 20);
INSERT INTO `product_attribute_values` VALUES (474, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 21);
INSERT INTO `product_attribute_values` VALUES (475, NULL, NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, 13, 22);
INSERT INTO `product_attribute_values` VALUES (476, 'vi', 'default', '<p>Product 13</p>', NULL, NULL, NULL, NULL, NULL, NULL, 13, 9);
INSERT INTO `product_attribute_values` VALUES (477, 'vi', 'default', '<p>Product 13</p>', NULL, NULL, NULL, NULL, NULL, NULL, 13, 10);
INSERT INTO `product_attribute_values` VALUES (478, 'vi', 'default', 'Product 13', NULL, NULL, NULL, NULL, NULL, NULL, 13, 2);
INSERT INTO `product_attribute_values` VALUES (479, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 16);
INSERT INTO `product_attribute_values` VALUES (480, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 17);
INSERT INTO `product_attribute_values` VALUES (481, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 18);
INSERT INTO `product_attribute_values` VALUES (482, 'en', 'default', '<p>Product 14</p>', NULL, NULL, NULL, NULL, NULL, NULL, 14, 9);
INSERT INTO `product_attribute_values` VALUES (483, 'en', 'default', '<p>Product 14</p>', NULL, NULL, NULL, NULL, NULL, NULL, 14, 10);
INSERT INTO `product_attribute_values` VALUES (484, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 14, 32);
INSERT INTO `product_attribute_values` VALUES (485, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 14, 33);
INSERT INTO `product_attribute_values` VALUES (486, NULL, NULL, 'asmdamsd', NULL, NULL, NULL, NULL, NULL, NULL, 14, 1);
INSERT INTO `product_attribute_values` VALUES (487, 'en', 'default', 'Product 14', NULL, NULL, NULL, NULL, NULL, NULL, 14, 2);
INSERT INTO `product_attribute_values` VALUES (488, NULL, NULL, 'product-14', NULL, NULL, NULL, NULL, NULL, NULL, 14, 3);
INSERT INTO `product_attribute_values` VALUES (489, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 14, 4);
INSERT INTO `product_attribute_values` VALUES (490, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 5);
INSERT INTO `product_attribute_values` VALUES (491, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 6);
INSERT INTO `product_attribute_values` VALUES (492, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 7);
INSERT INTO `product_attribute_values` VALUES (493, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 8);
INSERT INTO `product_attribute_values` VALUES (494, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 14, 23);
INSERT INTO `product_attribute_values` VALUES (495, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 14, 24);
INSERT INTO `product_attribute_values` VALUES (496, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 26);
INSERT INTO `product_attribute_values` VALUES (497, NULL, NULL, '03240', NULL, NULL, NULL, NULL, NULL, NULL, 14, 27);
INSERT INTO `product_attribute_values` VALUES (498, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 34);
INSERT INTO `product_attribute_values` VALUES (499, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 35);
INSERT INTO `product_attribute_values` VALUES (500, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 36);
INSERT INTO `product_attribute_values` VALUES (501, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 14, 16);
INSERT INTO `product_attribute_values` VALUES (502, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 14, 17);
INSERT INTO `product_attribute_values` VALUES (503, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 14, 18);
INSERT INTO `product_attribute_values` VALUES (504, NULL, NULL, NULL, NULL, NULL, 20000.0000, NULL, NULL, NULL, 14, 11);
INSERT INTO `product_attribute_values` VALUES (505, NULL, 'default', NULL, NULL, NULL, 22000.0000, NULL, NULL, NULL, 14, 12);
INSERT INTO `product_attribute_values` VALUES (506, NULL, NULL, NULL, NULL, NULL, 19000.0000, NULL, NULL, NULL, 14, 13);
INSERT INTO `product_attribute_values` VALUES (507, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2021-09-01', NULL, 14, 14);
INSERT INTO `product_attribute_values` VALUES (508, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2021-09-30', NULL, 14, 15);
INSERT INTO `product_attribute_values` VALUES (509, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 14, 19);
INSERT INTO `product_attribute_values` VALUES (510, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 14, 20);
INSERT INTO `product_attribute_values` VALUES (511, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 14, 21);
INSERT INTO `product_attribute_values` VALUES (512, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 14, 22);
INSERT INTO `product_attribute_values` VALUES (513, 'vi', 'default', '<p>Product 14</p>', NULL, NULL, NULL, NULL, NULL, NULL, 14, 9);
INSERT INTO `product_attribute_values` VALUES (514, 'vi', 'default', '<p>Product 14</p>', NULL, NULL, NULL, NULL, NULL, NULL, 14, 10);
INSERT INTO `product_attribute_values` VALUES (515, 'vi', 'default', 'Product 14', NULL, NULL, NULL, NULL, NULL, NULL, 14, 2);
INSERT INTO `product_attribute_values` VALUES (516, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 14, 16);
INSERT INTO `product_attribute_values` VALUES (517, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 14, 17);
INSERT INTO `product_attribute_values` VALUES (518, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 14, 18);
INSERT INTO `product_attribute_values` VALUES (519, 'en', 'default', '<p>Product 15</p>', NULL, NULL, NULL, NULL, NULL, NULL, 15, 9);
INSERT INTO `product_attribute_values` VALUES (520, 'en', 'default', '<p>Product 15</p>', NULL, NULL, NULL, NULL, NULL, NULL, 15, 10);
INSERT INTO `product_attribute_values` VALUES (521, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 15, 32);
INSERT INTO `product_attribute_values` VALUES (522, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 15, 33);
INSERT INTO `product_attribute_values` VALUES (523, NULL, NULL, '144', NULL, NULL, NULL, NULL, NULL, NULL, 15, 1);
INSERT INTO `product_attribute_values` VALUES (524, 'en', 'default', 'Product 15', NULL, NULL, NULL, NULL, NULL, NULL, 15, 2);
INSERT INTO `product_attribute_values` VALUES (525, NULL, NULL, 'product-15', NULL, NULL, NULL, NULL, NULL, NULL, 15, 3);
INSERT INTO `product_attribute_values` VALUES (526, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 15, 4);
INSERT INTO `product_attribute_values` VALUES (527, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 5);
INSERT INTO `product_attribute_values` VALUES (528, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 6);
INSERT INTO `product_attribute_values` VALUES (529, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 7);
INSERT INTO `product_attribute_values` VALUES (530, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 8);
INSERT INTO `product_attribute_values` VALUES (531, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 15, 23);
INSERT INTO `product_attribute_values` VALUES (532, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 15, 24);
INSERT INTO `product_attribute_values` VALUES (533, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 26);
INSERT INTO `product_attribute_values` VALUES (534, NULL, NULL, '4414', NULL, NULL, NULL, NULL, NULL, NULL, 15, 27);
INSERT INTO `product_attribute_values` VALUES (535, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 15, 34);
INSERT INTO `product_attribute_values` VALUES (536, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 15, 35);
INSERT INTO `product_attribute_values` VALUES (537, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 15, 36);
INSERT INTO `product_attribute_values` VALUES (538, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 15, 16);
INSERT INTO `product_attribute_values` VALUES (539, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 15, 17);
INSERT INTO `product_attribute_values` VALUES (540, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 15, 18);
INSERT INTO `product_attribute_values` VALUES (541, NULL, NULL, NULL, NULL, NULL, 25000.0000, NULL, NULL, NULL, 15, 11);
INSERT INTO `product_attribute_values` VALUES (542, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 12);
INSERT INTO `product_attribute_values` VALUES (543, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 13);
INSERT INTO `product_attribute_values` VALUES (544, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 14);
INSERT INTO `product_attribute_values` VALUES (545, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 15);
INSERT INTO `product_attribute_values` VALUES (546, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 15, 19);
INSERT INTO `product_attribute_values` VALUES (547, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 15, 20);
INSERT INTO `product_attribute_values` VALUES (548, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 15, 21);
INSERT INTO `product_attribute_values` VALUES (549, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 15, 22);
INSERT INTO `product_attribute_values` VALUES (550, 'vi', 'default', '<p>Product 15</p>', NULL, NULL, NULL, NULL, NULL, NULL, 15, 9);
INSERT INTO `product_attribute_values` VALUES (551, 'vi', 'default', '<p>Product 15</p>', NULL, NULL, NULL, NULL, NULL, NULL, 15, 10);
INSERT INTO `product_attribute_values` VALUES (552, 'vi', 'default', 'Product 15', NULL, NULL, NULL, NULL, NULL, NULL, 15, 2);
INSERT INTO `product_attribute_values` VALUES (553, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 15, 16);
INSERT INTO `product_attribute_values` VALUES (554, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 15, 17);
INSERT INTO `product_attribute_values` VALUES (555, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 15, 18);
INSERT INTO `product_attribute_values` VALUES (556, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 8);
INSERT INTO `product_attribute_values` VALUES (557, 'vi', 'default', '<p>Product 16</p>', NULL, NULL, NULL, NULL, NULL, NULL, 16, 9);
INSERT INTO `product_attribute_values` VALUES (558, 'vi', 'default', '<p>Product 16</p>', NULL, NULL, NULL, NULL, NULL, NULL, 16, 10);
INSERT INTO `product_attribute_values` VALUES (559, NULL, NULL, '<p>Description 1</p>\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: 296px; top: 31px;\">&nbsp;</div>', NULL, NULL, NULL, NULL, NULL, NULL, 16, 32);
INSERT INTO `product_attribute_values` VALUES (560, NULL, NULL, '<p>Description 2</p>', NULL, NULL, NULL, NULL, NULL, NULL, 16, 33);
INSERT INTO `product_attribute_values` VALUES (561, NULL, NULL, 'hahaha', NULL, NULL, NULL, NULL, NULL, NULL, 16, 1);
INSERT INTO `product_attribute_values` VALUES (562, 'vi', 'default', 'Product 16', NULL, NULL, NULL, NULL, NULL, NULL, 16, 2);
INSERT INTO `product_attribute_values` VALUES (563, NULL, NULL, 'product-16', NULL, NULL, NULL, NULL, NULL, NULL, 16, 3);
INSERT INTO `product_attribute_values` VALUES (564, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 16, 4);
INSERT INTO `product_attribute_values` VALUES (565, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 5);
INSERT INTO `product_attribute_values` VALUES (566, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 16, 6);
INSERT INTO `product_attribute_values` VALUES (567, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 7);
INSERT INTO `product_attribute_values` VALUES (568, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 16, 23);
INSERT INTO `product_attribute_values` VALUES (569, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 16, 24);
INSERT INTO `product_attribute_values` VALUES (570, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 16, 26);
INSERT INTO `product_attribute_values` VALUES (571, NULL, NULL, '16', NULL, NULL, NULL, NULL, NULL, NULL, 16, 27);
INSERT INTO `product_attribute_values` VALUES (572, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 34);
INSERT INTO `product_attribute_values` VALUES (573, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 16, 16);
INSERT INTO `product_attribute_values` VALUES (574, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 16, 17);
INSERT INTO `product_attribute_values` VALUES (575, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 16, 18);
INSERT INTO `product_attribute_values` VALUES (576, NULL, NULL, NULL, NULL, NULL, 8000.0000, NULL, NULL, NULL, 16, 11);
INSERT INTO `product_attribute_values` VALUES (577, NULL, 'default', NULL, NULL, NULL, 9000.0000, NULL, NULL, NULL, 16, 12);
INSERT INTO `product_attribute_values` VALUES (578, NULL, NULL, NULL, NULL, NULL, 7500.0000, NULL, NULL, NULL, 16, 13);
INSERT INTO `product_attribute_values` VALUES (579, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 16, 19);
INSERT INTO `product_attribute_values` VALUES (580, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 16, 20);
INSERT INTO `product_attribute_values` VALUES (581, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 16, 21);
INSERT INTO `product_attribute_values` VALUES (582, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 16, 22);
INSERT INTO `product_attribute_values` VALUES (584, 'en', 'default', '<p>Product 16</p>', NULL, NULL, NULL, NULL, NULL, NULL, 16, 9);
INSERT INTO `product_attribute_values` VALUES (585, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 16, 16);
INSERT INTO `product_attribute_values` VALUES (586, 'en', 'default', '<p>Product 16</p>', NULL, NULL, NULL, NULL, NULL, NULL, 16, 10);
INSERT INTO `product_attribute_values` VALUES (587, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 16, 17);
INSERT INTO `product_attribute_values` VALUES (588, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 16, 18);
INSERT INTO `product_attribute_values` VALUES (589, 'en', 'default', 'Product 16', NULL, NULL, NULL, NULL, NULL, NULL, 16, 2);
INSERT INTO `product_attribute_values` VALUES (590, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2021-09-01', NULL, 16, 14);
INSERT INTO `product_attribute_values` VALUES (591, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2021-09-23', NULL, 16, 15);
INSERT INTO `product_attribute_values` VALUES (592, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 16, 35);
INSERT INTO `product_attribute_values` VALUES (593, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 16, 36);
INSERT INTO `product_attribute_values` VALUES (594, NULL, NULL, 'Thuỵ Sĩ', NULL, NULL, NULL, NULL, NULL, NULL, 16, 37);
INSERT INTO `product_attribute_values` VALUES (595, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 8);
INSERT INTO `product_attribute_values` VALUES (596, 'vi', 'default', '<p>product 17</p>', NULL, NULL, NULL, NULL, NULL, NULL, 17, 9);
INSERT INTO `product_attribute_values` VALUES (597, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 17, 16);
INSERT INTO `product_attribute_values` VALUES (598, NULL, NULL, NULL, NULL, NULL, 5900.0000, NULL, NULL, NULL, 17, 11);
INSERT INTO `product_attribute_values` VALUES (599, NULL, NULL, 'sku-yara-2', NULL, NULL, NULL, NULL, NULL, NULL, 17, 1);
INSERT INTO `product_attribute_values` VALUES (600, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 17, 19);
INSERT INTO `product_attribute_values` VALUES (601, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 17, 20);
INSERT INTO `product_attribute_values` VALUES (602, 'vi', 'default', '<p>product 17</p>', NULL, NULL, NULL, NULL, NULL, NULL, 17, 10);
INSERT INTO `product_attribute_values` VALUES (603, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 17, 17);
INSERT INTO `product_attribute_values` VALUES (604, NULL, 'default', NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, 17, 12);
INSERT INTO `product_attribute_values` VALUES (605, NULL, NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, 17, 27);
INSERT INTO `product_attribute_values` VALUES (606, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 17, 21);
INSERT INTO `product_attribute_values` VALUES (607, NULL, NULL, '<p>product 17</p>', NULL, NULL, NULL, NULL, NULL, NULL, 17, 32);
INSERT INTO `product_attribute_values` VALUES (608, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 17, 18);
INSERT INTO `product_attribute_values` VALUES (609, 'vi', 'default', 'Product 17', NULL, NULL, NULL, NULL, NULL, NULL, 17, 2);
INSERT INTO `product_attribute_values` VALUES (610, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, 17, 13);
INSERT INTO `product_attribute_values` VALUES (611, NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, 17, 22);
INSERT INTO `product_attribute_values` VALUES (612, NULL, NULL, '<p>product 17</p>', NULL, NULL, NULL, NULL, NULL, NULL, 17, 33);
INSERT INTO `product_attribute_values` VALUES (613, NULL, NULL, 'product-17', NULL, NULL, NULL, NULL, NULL, NULL, 17, 3);
INSERT INTO `product_attribute_values` VALUES (614, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 17, 4);
INSERT INTO `product_attribute_values` VALUES (615, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 5);
INSERT INTO `product_attribute_values` VALUES (616, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 17, 6);
INSERT INTO `product_attribute_values` VALUES (617, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 17, 7);
INSERT INTO `product_attribute_values` VALUES (618, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 17, 26);
INSERT INTO `product_attribute_values` VALUES (619, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 17, 23);
INSERT INTO `product_attribute_values` VALUES (620, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 17, 24);
INSERT INTO `product_attribute_values` VALUES (621, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 34);
INSERT INTO `product_attribute_values` VALUES (622, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 35);
INSERT INTO `product_attribute_values` VALUES (623, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 36);
INSERT INTO `product_attribute_values` VALUES (624, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 17, 37);
INSERT INTO `product_attribute_values` VALUES (625, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 8);
INSERT INTO `product_attribute_values` VALUES (626, 'vi', 'default', '<p>product 18</p>', NULL, NULL, NULL, NULL, NULL, NULL, 18, 9);
INSERT INTO `product_attribute_values` VALUES (627, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 16);
INSERT INTO `product_attribute_values` VALUES (628, NULL, NULL, NULL, NULL, NULL, 8000.0000, NULL, NULL, NULL, 18, 11);
INSERT INTO `product_attribute_values` VALUES (629, NULL, NULL, 'sku-18', NULL, NULL, NULL, NULL, NULL, NULL, 18, 1);
INSERT INTO `product_attribute_values` VALUES (630, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 19);
INSERT INTO `product_attribute_values` VALUES (631, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 20);
INSERT INTO `product_attribute_values` VALUES (632, 'vi', 'default', '<p>product 18</p>', NULL, NULL, NULL, NULL, NULL, NULL, 18, 10);
INSERT INTO `product_attribute_values` VALUES (633, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 17);
INSERT INTO `product_attribute_values` VALUES (634, NULL, 'default', NULL, NULL, NULL, 8500.0000, NULL, NULL, NULL, 18, 12);
INSERT INTO `product_attribute_values` VALUES (635, NULL, NULL, '18', NULL, NULL, NULL, NULL, NULL, NULL, 18, 27);
INSERT INTO `product_attribute_values` VALUES (636, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 21);
INSERT INTO `product_attribute_values` VALUES (637, NULL, NULL, '<p>product 18</p>', NULL, NULL, NULL, NULL, NULL, NULL, 18, 32);
INSERT INTO `product_attribute_values` VALUES (638, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 18);
INSERT INTO `product_attribute_values` VALUES (639, 'vi', 'default', 'Product 18', NULL, NULL, NULL, NULL, NULL, NULL, 18, 2);
INSERT INTO `product_attribute_values` VALUES (640, NULL, NULL, NULL, NULL, NULL, 7500.0000, NULL, NULL, NULL, 18, 13);
INSERT INTO `product_attribute_values` VALUES (641, NULL, NULL, '0.5', NULL, NULL, NULL, NULL, NULL, NULL, 18, 22);
INSERT INTO `product_attribute_values` VALUES (642, NULL, NULL, '<p>product 18</p>', NULL, NULL, NULL, NULL, NULL, NULL, 18, 33);
INSERT INTO `product_attribute_values` VALUES (643, NULL, NULL, 'product-18', NULL, NULL, NULL, NULL, NULL, NULL, 18, 3);
INSERT INTO `product_attribute_values` VALUES (644, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 18, 4);
INSERT INTO `product_attribute_values` VALUES (645, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 5);
INSERT INTO `product_attribute_values` VALUES (646, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 18, 6);
INSERT INTO `product_attribute_values` VALUES (647, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 7);
INSERT INTO `product_attribute_values` VALUES (648, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 18, 26);
INSERT INTO `product_attribute_values` VALUES (649, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 18, 23);
INSERT INTO `product_attribute_values` VALUES (650, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 18, 24);
INSERT INTO `product_attribute_values` VALUES (651, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 34);
INSERT INTO `product_attribute_values` VALUES (652, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 37);
INSERT INTO `product_attribute_values` VALUES (653, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2021-08-11', NULL, 18, 14);
INSERT INTO `product_attribute_values` VALUES (654, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2021-08-27', NULL, 18, 15);
INSERT INTO `product_attribute_values` VALUES (655, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 37);
INSERT INTO `product_attribute_values` VALUES (656, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 37);
INSERT INTO `product_attribute_values` VALUES (657, 'en', 'default', '<p>product 18</p>', NULL, NULL, NULL, NULL, NULL, NULL, 18, 9);
INSERT INTO `product_attribute_values` VALUES (658, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 16);
INSERT INTO `product_attribute_values` VALUES (659, 'en', 'default', '<p>product 18</p>', NULL, NULL, NULL, NULL, NULL, NULL, 18, 10);
INSERT INTO `product_attribute_values` VALUES (660, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 17);
INSERT INTO `product_attribute_values` VALUES (661, 'en', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 18);
INSERT INTO `product_attribute_values` VALUES (662, 'en', 'default', 'Product 18', NULL, NULL, NULL, NULL, NULL, NULL, 18, 2);
INSERT INTO `product_attribute_values` VALUES (663, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 18, 35);
INSERT INTO `product_attribute_values` VALUES (664, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 18, 36);
INSERT INTO `product_attribute_values` VALUES (665, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 14, 37);
INSERT INTO `product_attribute_values` VALUES (666, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 19, 8);
INSERT INTO `product_attribute_values` VALUES (667, 'vi', 'default', '<p>short</p>', NULL, NULL, NULL, NULL, NULL, NULL, 19, 9);
INSERT INTO `product_attribute_values` VALUES (668, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 19, 16);
INSERT INTO `product_attribute_values` VALUES (669, NULL, NULL, NULL, NULL, NULL, 20000.0000, NULL, NULL, NULL, 19, 11);
INSERT INTO `product_attribute_values` VALUES (670, NULL, NULL, '19', NULL, NULL, NULL, NULL, NULL, NULL, 19, 1);
INSERT INTO `product_attribute_values` VALUES (671, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 19, 19);
INSERT INTO `product_attribute_values` VALUES (672, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 19, 20);
INSERT INTO `product_attribute_values` VALUES (673, 'vi', 'default', '<p>description</p>', NULL, NULL, NULL, NULL, NULL, NULL, 19, 10);
INSERT INTO `product_attribute_values` VALUES (674, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 19, 17);
INSERT INTO `product_attribute_values` VALUES (675, NULL, 'default', NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, 19, 12);
INSERT INTO `product_attribute_values` VALUES (676, NULL, NULL, '19', NULL, NULL, NULL, NULL, NULL, NULL, 19, 27);
INSERT INTO `product_attribute_values` VALUES (677, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 19, 21);
INSERT INTO `product_attribute_values` VALUES (678, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 19, 32);
INSERT INTO `product_attribute_values` VALUES (679, 'vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 19, 18);
INSERT INTO `product_attribute_values` VALUES (680, 'vi', 'default', 'Product 19', NULL, NULL, NULL, NULL, NULL, NULL, 19, 2);
INSERT INTO `product_attribute_values` VALUES (681, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, 19, 13);
INSERT INTO `product_attribute_values` VALUES (682, NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, 19, 22);
INSERT INTO `product_attribute_values` VALUES (683, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 19, 33);
INSERT INTO `product_attribute_values` VALUES (684, NULL, NULL, 'product-19', NULL, NULL, NULL, NULL, NULL, NULL, 19, 3);
INSERT INTO `product_attribute_values` VALUES (685, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 19, 14);
INSERT INTO `product_attribute_values` VALUES (686, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 19, 4);
INSERT INTO `product_attribute_values` VALUES (687, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 19, 15);
INSERT INTO `product_attribute_values` VALUES (688, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 19, 5);
INSERT INTO `product_attribute_values` VALUES (689, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 19, 6);
INSERT INTO `product_attribute_values` VALUES (690, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 19, 7);
INSERT INTO `product_attribute_values` VALUES (691, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 19, 26);
INSERT INTO `product_attribute_values` VALUES (692, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 19, 23);
INSERT INTO `product_attribute_values` VALUES (693, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 19, 24);
INSERT INTO `product_attribute_values` VALUES (694, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 19, 37);
INSERT INTO `product_attribute_values` VALUES (695, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 19, 34);
INSERT INTO `product_attribute_values` VALUES (696, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 19, 35);
INSERT INTO `product_attribute_values` VALUES (697, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 19, 36);
COMMIT;

-- ----------------------------
-- Table structure for product_bundle_option_products
-- ----------------------------
DROP TABLE IF EXISTS `product_bundle_option_products`;
CREATE TABLE `product_bundle_option_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `product_bundle_option_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_bundle_option_products_product_bundle_option_id_foreign` (`product_bundle_option_id`),
  KEY `product_bundle_option_products_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_option_products_product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_bundle_option_products
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_bundle_option_translations
-- ----------------------------
DROP TABLE IF EXISTS `product_bundle_option_translations`;
CREATE TABLE `product_bundle_option_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `product_bundle_option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`),
  CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_bundle_option_translations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_bundle_options
-- ----------------------------
DROP TABLE IF EXISTS `product_bundle_options`;
CREATE TABLE `product_bundle_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_bundle_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_bundle_options
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_categories
-- ----------------------------
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE `product_categories` (
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  KEY `product_categories_product_id_foreign` (`product_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_categories
-- ----------------------------
BEGIN;
INSERT INTO `product_categories` VALUES (13, 5);
INSERT INTO `product_categories` VALUES (14, 5);
INSERT INTO `product_categories` VALUES (15, 5);
INSERT INTO `product_categories` VALUES (18, 5);
INSERT INTO `product_categories` VALUES (16, 5);
INSERT INTO `product_categories` VALUES (7, 5);
COMMIT;

-- ----------------------------
-- Table structure for product_cross_sells
-- ----------------------------
DROP TABLE IF EXISTS `product_cross_sells`;
CREATE TABLE `product_cross_sells` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  KEY `product_cross_sells_parent_id_foreign` (`parent_id`),
  KEY `product_cross_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_cross_sells
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_customer_group_prices
-- ----------------------------
DROP TABLE IF EXISTS `product_customer_group_prices`;
CREATE TABLE `product_customer_group_prices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT '0',
  `value_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_customer_group_prices
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_downloadable_link_translations
-- ----------------------------
DROP TABLE IF EXISTS `product_downloadable_link_translations`;
CREATE TABLE `product_downloadable_link_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `product_downloadable_link_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`),
  CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_downloadable_link_translations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_downloadable_links
-- ----------------------------
DROP TABLE IF EXISTS `product_downloadable_links`;
CREATE TABLE `product_downloadable_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sample_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloads` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_links_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_downloadable_links
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_downloadable_sample_translations
-- ----------------------------
DROP TABLE IF EXISTS `product_downloadable_sample_translations`;
CREATE TABLE `product_downloadable_sample_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `product_downloadable_sample_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`),
  CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_downloadable_sample_translations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_downloadable_samples
-- ----------------------------
DROP TABLE IF EXISTS `product_downloadable_samples`;
CREATE TABLE `product_downloadable_samples` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_samples_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_downloadable_samples
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_flat
-- ----------------------------
DROP TABLE IF EXISTS `product_flat`;
CREATE TABLE `product_flat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `url_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `cost` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `color` int(11) DEFAULT NULL,
  `color_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `size_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `width` decimal(12,4) DEFAULT NULL,
  `height` decimal(12,4) DEFAULT NULL,
  `depth` decimal(12,4) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `brand_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hot` tinyint(1) DEFAULT NULL,
  `popular` tinyint(1) DEFAULT NULL,
  `search` tinyint(1) DEFAULT NULL,
  `origin` text COLLATE utf8mb4_unicode_ci,
  `Description01` text COLLATE utf8mb4_unicode_ci,
  `Description02` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  KEY `product_flat_parent_id_foreign` (`parent_id`),
  CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_flat
-- ----------------------------
BEGIN;
INSERT INTO `product_flat` VALUES (4, 'test4', 'asdkasd', 'Product 4', '<p>product 4</p>', 'product-4', 1, 1, 1, 5.0000, NULL, NULL, NULL, NULL, 4.0000, 1, 'Red', 6, 'S', '2021-04-05 03:11:55', 'en', 'default', 4, '2021-04-05 03:11:55', NULL, 1, 5.0000, 5.0000, '<p>product 4</p>', '', '', '', 0.0000, 0.0000, 0.0000, 12, 'Baconco', 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `product_flat` VALUES (6, 'lalala', '010', 'Product 6', '<p>Product 6</p>', 'product-6', 1, 1, 1, 40.0000, NULL, NULL, NULL, NULL, 5.0000, 1, 'Red', 6, 'S', '2021-04-05 10:35:14', 'en', 'default', 6, '2021-04-05 10:35:59', NULL, 1, 40.0000, 40.0000, '<p>Product 6</p>', '', '', '', 0.0000, 0.0000, 0.0000, 12, 'Baconco', 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `product_flat` VALUES (7, 'test3', '12321', 'Product 7', '<p>Product 7</p>', 'product-7', 1, 1, 1, 19500.0000, 20000.0000, 18500.0000, '2021-08-13', '2021-08-26', 20.0000, 1, 'Red', 6, 'S', '2021-04-14 09:00:48', 'en', 'default', 7, '2021-04-14 09:00:48', NULL, 1, 19500.0000, 19500.0000, '<p>Product 7</p>', '', '', '', 0.0000, 0.0000, 0.0000, 12, 'Baconco', 1, 0, 0, '', '', '');
INSERT INTO `product_flat` VALUES (8, 'test5', '3882', 'Product 5', '<p>cac</p>', 'product-5', 1, 1, 1, 20.0000, 10.0000, 10.0000, NULL, NULL, 4.0000, 1, 'Red', 6, 'S', '2021-04-14 09:01:49', 'en', 'default', 8, '2021-04-14 09:01:49', NULL, 1, 10.0000, 10.0000, '<p>cac</p>', '', '', '', 0.0000, 0.0000, 0.0000, 12, 'Baconco', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_flat` VALUES (9, 'test6', '121', 'Product 9', '<p>Product 9</p>', 'product-9', 1, 1, 1, 100000.0000, NULL, NULL, NULL, NULL, 4.0000, 1, 'Red', 6, 'S', '2021-04-14 13:52:42', 'en', 'default', 9, '2021-04-14 13:52:42', NULL, 1, 100000.0000, 100000.0000, '<p>Product 9</p>', '', '', '', 0.0000, 0.0000, 0.0000, 13, 'Yara', 1, 0, 0, '', '', '');
INSERT INTO `product_flat` VALUES (15, 'temporary-sku-540fda', '212', 'Product 11', '<p>Product 11</p>', '1', 0, 0, 0, 9000.0000, NULL, NULL, NULL, NULL, 1.0000, 1, 'Red', 6, 'S', '2021-05-26 21:12:35', 'en', 'default', 11, '2021-05-26 21:12:35', NULL, 0, 9000.0000, 9000.0000, '<p>Product 11</p>', '', '', '', 0.0000, 0.0000, 0.0000, NULL, NULL, 0, 1, 0, NULL, NULL, NULL);
INSERT INTO `product_flat` VALUES (18, 'test5', '3882', NULL, NULL, 'product-5', 1, 1, 1, 20.0000, 10.0000, 10.0000, NULL, NULL, 4.0000, 1, 'Red', 6, 'S', '2021-04-14 09:01:49', 'vi', 'default', 8, '2021-04-14 09:01:49', NULL, 1, 10.0000, 10.0000, NULL, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 12, 'Baconco', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_flat` VALUES (19, 'test4', 'asdkasd', 'Product 4', '<p>product 4</p>', 'product-4', 1, 1, 1, 5.0000, NULL, NULL, NULL, NULL, 4.0000, 1, 'Red', 6, 'S', '2021-04-05 03:11:55', 'vi', 'default', 4, '2021-04-05 03:11:55', NULL, 1, 5.0000, 5.0000, '<p>product 4</p>', '', '', '', 0.0000, 0.0000, 0.0000, 12, 'Baconco', 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `product_flat` VALUES (20, 'test6', '121', 'Product 9 Product 9 Product 9 Product 9 Product 9', '<p>Product 9</p>', 'product-9', 1, 1, 1, 100000.0000, NULL, NULL, NULL, NULL, 4.0000, 1, 'Red', 6, '', '2021-04-14 13:52:42', 'vi', 'default', 9, '2021-04-14 13:52:42', NULL, 1, 100000.0000, 100000.0000, '<p>Product 9</p>', '', '', '', 0.0000, 0.0000, 0.0000, 13, 'Yara', 1, 0, 0, '', '', '');
INSERT INTO `product_flat` VALUES (21, 'temporary-sku-540fda', '212', 'Product 11', '<p>Product 11</p>', '1', 0, 0, 0, 9000.0000, NULL, NULL, NULL, NULL, 1.0000, 1, 'Red', 6, 'S', '2021-05-26 21:12:35', 'vi', 'default', 11, '2021-05-26 21:12:35', NULL, 0, 9000.0000, 9000.0000, '<p>Product 11</p>', '', '', '', 0.0000, 0.0000, 0.0000, NULL, NULL, 0, 1, 0, NULL, NULL, NULL);
INSERT INTO `product_flat` VALUES (22, 'test3', '12321', 'Product 7 Product 7 Product 7 Product 7 Product 7', '<p>Product 7</p>', 'product-7', 1, 1, 1, 19500.0000, 20000.0000, 18500.0000, '2021-08-13', '2021-08-26', 20.0000, 1, 'Red', 6, '', '2021-04-14 09:00:48', 'vi', 'default', 7, '2021-04-14 09:00:48', NULL, 1, 19500.0000, 19500.0000, '<p>Product 7</p>', '', '', '', 0.0000, 0.0000, 0.0000, 12, 'Baconco', 1, 0, 0, '', '', '');
INSERT INTO `product_flat` VALUES (23, 'lalala', '010', 'Product 6', '<p>Product 6</p>', 'product-6', 1, 1, 1, 40.0000, NULL, NULL, NULL, NULL, 5.0000, 1, 'Red', 6, 'S', '2021-04-05 10:35:14', 'vi', 'default', 6, '2021-04-05 10:35:59', NULL, 1, 40.0000, 40.0000, '<p>Product 6</p>', '', '', '', 0.0000, 0.0000, 0.0000, 12, 'Baconco', 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `product_flat` VALUES (24, 'mmsadm', '92439', 'Product 13', '<p>Product 13</p>', 'product-13', 1, 1, 1, 19000.0000, NULL, NULL, NULL, NULL, 4.0000, 1, 'Red', 6, 'S', '2021-07-26 18:52:04', 'en', 'default', 13, '2021-07-26 18:52:04', NULL, 1, 19000.0000, 19000.0000, '<p>Product 13</p>', '', '', '', 0.0000, 0.0000, 0.0000, NULL, NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `product_flat` VALUES (25, 'mmsadm', '92439', 'Product 13', '<p>Product 13</p>', 'product-13', 1, 1, 1, 19000.0000, NULL, NULL, NULL, NULL, 4.0000, 1, 'Red', 6, 'S', '2021-07-26 18:52:04', 'vi', 'default', 13, '2021-07-26 18:52:04', NULL, 1, 19000.0000, 19000.0000, '<p>Product 13</p>', '', '', '', 0.0000, 0.0000, 0.0000, NULL, NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `product_flat` VALUES (26, 'asmdamsd', '03240', 'Product 14', '<p>Product 14</p>', 'product-14', 1, 1, 1, 20000.0000, 22000.0000, 19000.0000, '2021-09-01', '2021-09-30', 1.0000, 1, 'Red', 6, 'S', '2021-07-26 18:52:59', 'en', 'default', 14, '2021-07-26 18:52:59', NULL, 1, 19000.0000, 19000.0000, '<p>Product 14</p>', '', '', '', 0.0000, 0.0000, 0.0000, NULL, NULL, 1, 0, 0, '', '', '');
INSERT INTO `product_flat` VALUES (27, 'asmdamsd', '03240', 'Product 14', '<p>Product 14</p>', 'product-14', 1, 1, 1, 20000.0000, 22000.0000, 19000.0000, '2021-09-01', '2021-09-30', 1.0000, 1, 'Red', 6, '', '2021-07-26 18:52:59', 'vi', 'default', 14, '2021-07-26 18:52:59', NULL, 1, 19000.0000, 19000.0000, '<p>Product 14</p>', '', '', '', 0.0000, 0.0000, 0.0000, NULL, NULL, 1, 0, 0, '', '', '');
INSERT INTO `product_flat` VALUES (28, '144', '4414', 'Product 15', '<p>Product 15</p>', 'product-15', 1, 1, 1, 25000.0000, NULL, NULL, NULL, NULL, 1.0000, 1, 'Red', 6, 'S', '2021-07-26 18:54:18', 'en', 'default', 15, '2021-07-26 18:54:18', NULL, 1, 25000.0000, 25000.0000, '<p>Product 15</p>', '', '', '', 0.0000, 0.0000, 0.0000, NULL, NULL, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `product_flat` VALUES (29, '144', '4414', 'Product 15', '<p>Product 15</p>', 'product-15', 1, 1, 1, 25000.0000, NULL, NULL, NULL, NULL, 1.0000, 1, 'Red', 6, 'S', '2021-07-26 18:54:18', 'vi', 'default', 15, '2021-07-26 18:54:18', NULL, 1, 25000.0000, 25000.0000, '<p>Product 15</p>', '', '', '', 0.0000, 0.0000, 0.0000, NULL, NULL, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `product_flat` VALUES (30, 'hahaha', '16', 'Product 16', '<p>Product 16</p>', 'product-16', 1, 0, 1, 8000.0000, 9000.0000, 7500.0000, '2021-09-01', '2021-09-23', 1.0000, 2, 'Green', 6, 'S', '2021-07-27 18:36:45', 'en', 'default', 16, '2021-09-06 22:43:24', NULL, 1, 8000.0000, 8000.0000, '<p>Product 16</p>', '', '', '', 0.0000, 0.0000, 0.0000, NULL, NULL, 1, 0, 0, 'Thuỵ Sĩ', '<p>Description 1</p>\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: 296px; top: 31px;\"> </div>', '<p>Description 2</p>');
INSERT INTO `product_flat` VALUES (31, 'hahaha', '16', 'Product 16', '<p>Product 16</p>', 'product-16', 1, 0, 1, 8000.0000, 9000.0000, 7500.0000, '2021-09-01', '2021-09-23', 1.0000, 2, 'Green', 6, '', '2021-07-27 18:36:45', 'vi', 'default', 16, '2021-09-06 22:43:24', NULL, 1, 8000.0000, 8000.0000, '<p>Product 16</p>', '', '', '', 0.0000, 0.0000, 0.0000, NULL, NULL, 1, 0, 0, 'Thuỵ Sĩ', '<p>Description 1</p>\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: 296px; top: 31px;\"> </div>', '<p>Description 2</p>');
INSERT INTO `product_flat` VALUES (32, 'sku-yara-2', 'aaa', NULL, NULL, 'product-17', 1, 0, 1, 5900.0000, 0.0000, 0.0000, NULL, NULL, 3.0000, 1, 'Red', 6, 'S', '2021-08-11 16:49:29', 'en', 'default', 17, '2021-08-11 16:49:29', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, 1, 1, '', '<p>product 17</p>', '<p>product 17</p>');
INSERT INTO `product_flat` VALUES (33, 'sku-yara-2', 'aaa', 'Product 17', '<p>product 17</p>', 'product-17', 1, 0, 1, 5900.0000, 0.0000, 0.0000, NULL, NULL, 3.0000, 1, 'Red', 6, '', '2021-08-11 16:49:29', 'vi', 'default', 17, '2021-08-11 16:49:29', NULL, 0, NULL, NULL, '<p>product 17</p>', '', '', '', 0.0000, 0.0000, 0.0000, NULL, NULL, 1, 1, 1, '', '<p>product 17</p>', '<p>product 17</p>');
INSERT INTO `product_flat` VALUES (34, 'sku-18', '18', 'Product 18', '<p>product 18</p>', 'product-18', 1, 0, 1, 8000.0000, 8500.0000, 7500.0000, '2021-08-11', '2021-08-27', 0.5000, 1, 'Red', 6, 'S', '2021-08-13 13:54:05', 'en', 'default', 18, '2021-08-13 13:54:05', NULL, 1, 8000.0000, 8000.0000, '<p>product 18</p>', '', '', '', 0.0000, 0.0000, 0.0000, NULL, NULL, 1, 0, 0, '', '<p>product 18</p>', '<p>product 18</p>');
INSERT INTO `product_flat` VALUES (35, 'sku-18', '18', 'Product 18', '<p>product 18</p>', 'product-18', 1, 0, 1, 8000.0000, 8500.0000, 7500.0000, '2021-08-11', '2021-08-27', 0.5000, 1, 'Red', 6, '', '2021-08-13 13:54:05', 'vi', 'default', 18, '2021-08-13 13:54:05', NULL, 1, 8000.0000, 8000.0000, '<p>product 18</p>', '', '', '', 0.0000, 0.0000, 0.0000, NULL, NULL, 1, 0, 0, '', '<p>product 18</p>', '<p>product 18</p>');
INSERT INTO `product_flat` VALUES (36, '19', '19', NULL, NULL, 'product-19', 0, 0, 1, 20000.0000, 0.0000, 0.0000, '0000-00-00', '0000-00-00', 2.0000, 1, 'Red', 6, 'S', '2021-10-14 22:40:06', 'en', 'default', 19, '2021-10-14 22:40:06', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, 0, 0, 1, '', '', '');
INSERT INTO `product_flat` VALUES (37, '19', '19', 'Product 19', '<p>description</p>', 'product-19', 0, 0, 1, 20000.0000, 0.0000, 0.0000, '0000-00-00', '0000-00-00', 2.0000, 1, 'Red', 6, '', '2021-10-14 22:40:06', 'vi', 'default', 19, '2021-10-14 22:40:06', NULL, 1, NULL, NULL, '<p>short</p>', '', '', '', 0.0000, 0.0000, 0.0000, NULL, NULL, 0, 0, 1, '', '', '');
COMMIT;

-- ----------------------------
-- Table structure for product_grouped_products
-- ----------------------------
DROP TABLE IF EXISTS `product_grouped_products`;
CREATE TABLE `product_grouped_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `associated_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_grouped_products_product_id_foreign` (`product_id`),
  KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`),
  CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_grouped_products
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_images
-- ----------------------------
BEGIN;
INSERT INTO `product_images` VALUES (3, NULL, 'product/6/f7LpxGBygxBk4qoP6NGjyWWRoZ1iZP0P199ZvA09.png', 6);
INSERT INTO `product_images` VALUES (20, NULL, 'product/16/1CEDghcvZwmATSCfVul0m3PfDVHbc9FGPsGgDZAD.jpg', 16);
INSERT INTO `product_images` VALUES (21, NULL, 'product/16/C4UzNdZHU7bLIDQajSdomICM611XuZzFrfTq3QrZ.jpg', 16);
INSERT INTO `product_images` VALUES (22, NULL, 'product/16/S0cDseL1Q20BdrANcIwdhhrzZ2mZOtY4ODET9nX7.jpg', 16);
INSERT INTO `product_images` VALUES (23, NULL, 'product/16/3w3EYxWNtPWsN544ZNPPPmH6tdEOfvW62e0GHhaP.jpg', 16);
INSERT INTO `product_images` VALUES (35, NULL, 'product/18/ptnu2v2tMY6rGL4Po9Cj5mnUur2wgsN8z1DVKlCR.jpg', 18);
INSERT INTO `product_images` VALUES (36, NULL, 'product/18/TTDUb7VXePqoS4Xoa3fRw4UG0LgRolLkrmv31Kli.jpg', 18);
COMMIT;

-- ----------------------------
-- Table structure for product_inventories
-- ----------------------------
DROP TABLE IF EXISTS `product_inventories`;
CREATE TABLE `product_inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `inventory_source_id` int(10) unsigned NOT NULL,
  `vendor_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_inventories
-- ----------------------------
BEGIN;
INSERT INTO `product_inventories` VALUES (32, 10, 6, 1, 0);
INSERT INTO `product_inventories` VALUES (33, 10, 9, 1, 0);
INSERT INTO `product_inventories` VALUES (34, 0, 4, 1, 0);
INSERT INTO `product_inventories` VALUES (41, 20, 8, 1, 0);
INSERT INTO `product_inventories` VALUES (42, 0, 11, 1, 13);
INSERT INTO `product_inventories` VALUES (43, 0, 11, 1, 0);
INSERT INTO `product_inventories` VALUES (44, 9, 7, 1, 0);
INSERT INTO `product_inventories` VALUES (45, 10, 13, 1, 0);
INSERT INTO `product_inventories` VALUES (46, 10, 14, 1, 0);
INSERT INTO `product_inventories` VALUES (47, 10, 15, 1, 0);
INSERT INTO `product_inventories` VALUES (48, 10, 16, 1, 1);
INSERT INTO `product_inventories` VALUES (49, 10, 16, 1, 0);
INSERT INTO `product_inventories` VALUES (50, 10, 17, 1, 2);
INSERT INTO `product_inventories` VALUES (51, 10, 18, 1, 1);
INSERT INTO `product_inventories` VALUES (52, 0, 18, 1, 0);
INSERT INTO `product_inventories` VALUES (53, 25, 19, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for product_ordered_inventories
-- ----------------------------
DROP TABLE IF EXISTS `product_ordered_inventories`;
CREATE TABLE `product_ordered_inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_ordered_inventories
-- ----------------------------
BEGIN;
INSERT INTO `product_ordered_inventories` VALUES (1, 9, 7, 1);
INSERT INTO `product_ordered_inventories` VALUES (2, 10, 13, 1);
INSERT INTO `product_ordered_inventories` VALUES (3, 3, 9, 1);
INSERT INTO `product_ordered_inventories` VALUES (4, 10, 14, 1);
INSERT INTO `product_ordered_inventories` VALUES (5, 1, 16, 1);
INSERT INTO `product_ordered_inventories` VALUES (6, 6, 18, 1);
INSERT INTO `product_ordered_inventories` VALUES (7, 8, 6, 1);
COMMIT;

-- ----------------------------
-- Table structure for product_relations
-- ----------------------------
DROP TABLE IF EXISTS `product_relations`;
CREATE TABLE `product_relations` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  KEY `product_relations_parent_id_foreign` (`parent_id`),
  KEY `product_relations_child_id_foreign` (`child_id`),
  CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_relations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_reviews
-- ----------------------------
DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE `product_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  KEY `product_reviews_customer_id_foreign` (`customer_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_reviews
-- ----------------------------
BEGIN;
INSERT INTO `product_reviews` VALUES (1, '', 3, 'loz', 'approved', '2021-04-24 11:22:57', '2021-04-24 11:43:52', 6, 83, 'agent ');
INSERT INTO `product_reviews` VALUES (2, '', 3, 'sản phẩm ok đấy', 'approved', '2021-04-24 11:31:19', '2021-04-24 11:43:59', 6, 83, 'agent ');
INSERT INTO `product_reviews` VALUES (3, '', 1, 'oki bro', 'approved', '2021-04-24 11:33:33', '2021-04-24 11:44:06', 6, 83, 'agent ');
INSERT INTO `product_reviews` VALUES (4, '', 3, 'ok đấy cu', 'approved', '2021-04-24 13:13:42', '2021-04-24 13:52:00', 6, 83, 'agent');
INSERT INTO `product_reviews` VALUES (5, '', 5, 'như l', 'approved', '2021-04-24 14:06:08', '2021-04-24 14:06:35', 6, 83, 'agent');
INSERT INTO `product_reviews` VALUES (10, '', 3, 'oki', 'approved', '2021-04-24 16:47:15', '2021-04-24 16:47:15', 8, 96, 'yara ra');
INSERT INTO `product_reviews` VALUES (11, '', 3, 'okay okay', 'approved', '2021-04-24 16:49:17', '2021-04-24 16:49:17', 8, 96, 'yara ra');
INSERT INTO `product_reviews` VALUES (12, '', 5, 'alo', 'approved', '2021-04-24 23:49:56', '2021-04-24 23:49:56', 8, 96, 'yara ra');
INSERT INTO `product_reviews` VALUES (13, '', 2, 'không yêu', 'approved', '2021-04-25 00:00:09', '2021-04-25 00:00:09', 6, 96, 'yara ra');
INSERT INTO `product_reviews` VALUES (14, '', 2, 'có chứ', 'approved', '2021-04-25 00:00:18', '2021-04-25 00:00:18', 6, 96, 'yara ra');
INSERT INTO `product_reviews` VALUES (16, '', 4, 'ok', 'approved', '2021-05-08 10:57:52', '2021-05-08 10:58:15', 9, 96, 'yara ra');
INSERT INTO `product_reviews` VALUES (19, '', 3, 'cac', 'approved', '2021-08-29 19:36:04', '2021-08-29 19:36:04', 7, 95, 'truong cac ');
INSERT INTO `product_reviews` VALUES (20, '', 4, 'hay đấy', 'approved', '2021-08-29 19:38:59', '2021-08-29 19:38:59', 7, 95, 'truong cac ');
COMMIT;

-- ----------------------------
-- Table structure for product_super_attributes
-- ----------------------------
DROP TABLE IF EXISTS `product_super_attributes`;
CREATE TABLE `product_super_attributes` (
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  KEY `product_super_attributes_product_id_foreign` (`product_id`),
  KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_super_attributes
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_up_sells
-- ----------------------------
DROP TABLE IF EXISTS `product_up_sells`;
CREATE TABLE `product_up_sells` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  KEY `product_up_sells_parent_id_foreign` (`parent_id`),
  KEY `product_up_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_up_sells
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_videos
-- ----------------------------
DROP TABLE IF EXISTS `product_videos`;
CREATE TABLE `product_videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_videos_product_id_foreign` (`product_id`),
  CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_videos
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `attribute_family_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `products_parent_id_foreign` (`parent_id`),
  CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`),
  CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
BEGIN;
INSERT INTO `products` VALUES (4, 'test4', 'simple', '2021-04-05 03:11:55', '2021-04-05 03:11:55', NULL, 1);
INSERT INTO `products` VALUES (6, 'lalala', 'simple', '2021-04-05 10:35:14', '2021-04-05 10:35:59', NULL, 1);
INSERT INTO `products` VALUES (7, 'test3', 'simple', '2021-04-14 09:00:48', '2021-04-14 09:00:48', NULL, 1);
INSERT INTO `products` VALUES (8, 'test5', 'simple', '2021-04-14 09:01:49', '2021-04-14 09:01:49', NULL, 1);
INSERT INTO `products` VALUES (9, 'test6', 'simple', '2021-04-14 13:52:42', '2021-04-14 13:52:42', NULL, 1);
INSERT INTO `products` VALUES (11, 'temporary-sku-540fda', 'simple', '2021-05-26 21:12:35', '2021-05-26 21:12:35', NULL, 1);
INSERT INTO `products` VALUES (13, 'mmsadm', 'simple', '2021-07-26 18:52:04', '2021-07-26 18:52:04', NULL, 1);
INSERT INTO `products` VALUES (14, 'asmdamsd', 'simple', '2021-07-26 18:52:59', '2021-07-26 18:52:59', NULL, 1);
INSERT INTO `products` VALUES (15, '144', 'simple', '2021-07-26 18:54:18', '2021-07-26 18:54:18', NULL, 1);
INSERT INTO `products` VALUES (16, 'hahaha', 'simple', '2021-07-27 18:36:45', '2021-09-06 22:43:24', NULL, 1);
INSERT INTO `products` VALUES (17, 'sku-yara-2', 'simple', '2021-08-11 16:49:29', '2021-08-11 16:49:29', NULL, 1);
INSERT INTO `products` VALUES (18, 'sku-18', 'simple', '2021-08-13 13:54:05', '2021-08-13 13:54:05', NULL, 1);
INSERT INTO `products` VALUES (19, '19', 'simple', '2021-10-14 22:40:06', '2021-10-14 22:40:06', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for refund_items
-- ----------------------------
DROP TABLE IF EXISTS `refund_items`;
CREATE TABLE `refund_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `refund_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  KEY `refund_items_refund_id_foreign` (`refund_id`),
  KEY `refund_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of refund_items
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for refunds
-- ----------------------------
DROP TABLE IF EXISTS `refunds`;
CREATE TABLE `refunds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `order_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refunds_order_id_foreign` (`order_id`),
  CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of refunds
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES (1, 'Administrator', 'Administrator role', 'all', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for shipment_items
-- ----------------------------
DROP TABLE IF EXISTS `shipment_items`;
CREATE TABLE `shipment_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `base_price` decimal(12,4) DEFAULT '0.0000',
  `total` decimal(12,4) DEFAULT '0.0000',
  `base_total` decimal(12,4) DEFAULT '0.0000',
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `shipment_id` int(10) unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipment_items_shipment_id_foreign` (`shipment_id`),
  CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of shipment_items
-- ----------------------------
BEGIN;
INSERT INTO `shipment_items` VALUES (1, 'Phân bón tổng hợp', NULL, 'skskusk', 2, 20, 15.0000, 15.0000, 30.0000, 30.0000, 1, 'Webkul\\Product\\Models\\Product', 5, 1, '{\"_token\": \"2fUpOL63eVX5fKlitQZkwFtrhzr51tTZDIxes6io\", \"locale\": \"en\", \"quantity\": \"2\", \"is_buy_now\": \"0\", \"product_id\": \"1\"}', '2021-05-01 14:27:19', '2021-05-01 14:27:19');
INSERT INTO `shipment_items` VALUES (2, 'tim kiem', NULL, 'mmdsf', 2, 10, 9999.0000, 9999.0000, 19998.0000, 19998.0000, 12, 'Webkul\\Product\\Models\\Product', 18, 2, '{\"_token\": \"pgmrt01fbXSzfwbtHasAxp9fCRQDfMLa1K9nm2I3\", \"locale\": \"vi\", \"quantity\": \"2\", \"is_buy_now\": \"0\", \"product_id\": \"12\"}', '2021-07-23 10:40:33', '2021-07-23 10:40:33');
INSERT INTO `shipment_items` VALUES (3, 'tim kiem', NULL, 'mmdsf', 4, 20, 9999.0000, 9999.0000, 39996.0000, 39996.0000, 12, 'Webkul\\Product\\Models\\Product', 22, 3, '{\"_token\": \"pgmrt01fbXSzfwbtHasAxp9fCRQDfMLa1K9nm2I3\", \"locale\": \"vi\", \"quantity\": \"4\", \"is_buy_now\": \"0\", \"product_id\": \"12\"}', '2021-07-23 11:46:30', '2021-07-23 11:46:30');
INSERT INTO `shipment_items` VALUES (4, 'tim kiem', NULL, 'mmdsf', 3, 15, 9999.0000, 9999.0000, 29997.0000, 29997.0000, 12, 'Webkul\\Product\\Models\\Product', 21, 4, '{\"locale\": \"vi\", \"quantity\": 3, \"product_id\": 12}', '2021-07-23 11:51:15', '2021-07-23 11:51:15');
INSERT INTO `shipment_items` VALUES (5, 'tim kiem', NULL, 'mmdsf', 1, 5, 9999.0000, 9999.0000, 9999.0000, 9999.0000, 12, 'Webkul\\Product\\Models\\Product', 23, 5, '{\"_token\": \"pgmrt01fbXSzfwbtHasAxp9fCRQDfMLa1K9nm2I3\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"12\"}', '2021-07-23 11:55:41', '2021-07-23 11:55:41');
INSERT INTO `shipment_items` VALUES (6, 'Product 7 Product 7 Product 7 Product 7 Product 7', NULL, 'test3', 1, 20, 19500.0000, 19500.0000, 19500.0000, 19500.0000, 7, 'Webkul\\Product\\Models\\Product', 35, 6, '{\"_token\": \"oGqqzDN0G2S6YDKNke6qJFM2NV1t8RCp2ODHc5ub\", \"locale\": \"vi\", \"quantity\": \"1\", \"is_buy_now\": \"0\", \"product_id\": \"7\"}', '2021-08-31 23:18:44', '2021-08-31 23:18:44');
COMMIT;

-- ----------------------------
-- Table structure for shipments
-- ----------------------------
DROP TABLE IF EXISTS `shipments`;
CREATE TABLE `shipments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `carrier_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track_number` text COLLATE utf8mb4_unicode_ci,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `customer_id` int(10) unsigned DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `order_address_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `inventory_source_id` int(10) unsigned DEFAULT NULL,
  `inventory_source_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_order_id_foreign` (`order_id`),
  KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`),
  KEY `shipments_order_address_id_foreign` (`order_address_id`),
  CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of shipments
-- ----------------------------
BEGIN;
INSERT INTO `shipments` VALUES (1, NULL, 2, NULL, NULL, '', '', 0, 97, 'Webkul\\Customer\\Models\\Customer', 6, 20, '2021-05-01 14:27:19', '2021-05-01 14:27:19', 1, 'Default');
INSERT INTO `shipments` VALUES (2, NULL, 2, NULL, NULL, '', '', 0, 106, 'Webkul\\Customer\\Models\\Customer', 19, 77, '2021-07-23 10:40:33', '2021-07-23 10:40:34', 1, 'Default');
INSERT INTO `shipments` VALUES (3, NULL, 4, NULL, NULL, 'carrier', '0123', 0, 106, 'Webkul\\Customer\\Models\\Customer', 23, 93, '2021-07-23 11:46:30', '2021-07-23 11:46:30', 1, 'Default');
INSERT INTO `shipments` VALUES (4, NULL, 3, NULL, NULL, 'carrier', '02349', 0, 106, 'Webkul\\Customer\\Models\\Customer', 22, 89, '2021-07-23 11:51:15', '2021-07-23 11:51:15', 1, 'Default');
INSERT INTO `shipments` VALUES (5, NULL, 1, NULL, NULL, 'carrier', '0987', 0, 106, 'Webkul\\Customer\\Models\\Customer', 24, 97, '2021-07-23 11:55:41', '2021-07-23 11:55:41', 1, 'Default');
INSERT INTO `shipments` VALUES (6, NULL, 1, NULL, NULL, '', '', 0, 106, 'Webkul\\Customer\\Models\\Customer', 35, 141, '2021-08-31 23:18:44', '2021-08-31 23:18:44', 1, 'Default');
COMMIT;

-- ----------------------------
-- Table structure for sliders
-- ----------------------------
DROP TABLE IF EXISTS `sliders`;
CREATE TABLE `sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slider_path` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sliders_channel_id_foreign` (`channel_id`),
  CONSTRAINT `sliders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sliders
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for subscribers_list
-- ----------------------------
DROP TABLE IF EXISTS `subscribers_list`;
CREATE TABLE `subscribers_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribers_list_channel_id_foreign` (`channel_id`),
  KEY `subscribers_list_customer_id_foreign` (`customer_id`),
  CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of subscribers_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tax_categories
-- ----------------------------
DROP TABLE IF EXISTS `tax_categories`;
CREATE TABLE `tax_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_categories_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tax_categories
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tax_categories_tax_rates
-- ----------------------------
DROP TABLE IF EXISTS `tax_categories_tax_rates`;
CREATE TABLE `tax_categories_tax_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_category_id` int(10) unsigned NOT NULL,
  `tax_rate_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`),
  CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tax_categories_tax_rates
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tax_rates
-- ----------------------------
DROP TABLE IF EXISTS `tax_rates`;
CREATE TABLE `tax_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT '0',
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rates_identifier_unique` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tax_rates
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for velocity_contents
-- ----------------------------
DROP TABLE IF EXISTS `velocity_contents`;
CREATE TABLE `velocity_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of velocity_contents
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for velocity_contents_translations
-- ----------------------------
DROP TABLE IF EXISTS `velocity_contents_translations`;
CREATE TABLE `velocity_contents_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_heading` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_link` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_target` tinyint(1) NOT NULL DEFAULT '0',
  `catalog_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `products` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `velocity_contents_translations_content_id_foreign` (`content_id`),
  CONSTRAINT `velocity_contents_translations_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `velocity_contents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of velocity_contents_translations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for velocity_customer_compare_products
-- ----------------------------
DROP TABLE IF EXISTS `velocity_customer_compare_products`;
CREATE TABLE `velocity_customer_compare_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_flat_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `velocity_customer_compare_products_product_flat_id_foreign` (`product_flat_id`),
  KEY `velocity_customer_compare_products_customer_id_foreign` (`customer_id`),
  CONSTRAINT `velocity_customer_compare_products_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `velocity_customer_compare_products_product_flat_id_foreign` FOREIGN KEY (`product_flat_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of velocity_customer_compare_products
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for velocity_meta_data
-- ----------------------------
DROP TABLE IF EXISTS `velocity_meta_data`;
CREATE TABLE `velocity_meta_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `home_page_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_left_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_middle_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slider` tinyint(1) NOT NULL DEFAULT '0',
  `advertisement` json DEFAULT NULL,
  `sidebar_category_count` int(11) NOT NULL DEFAULT '9',
  `featured_product_count` int(11) NOT NULL DEFAULT '10',
  `new_products_count` int(11) NOT NULL DEFAULT '10',
  `subscription_bar_content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_view_images` json DEFAULT NULL,
  `product_policy` text COLLATE utf8mb4_unicode_ci,
  `locale` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_content_count` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of velocity_meta_data
-- ----------------------------
BEGIN;
INSERT INTO `velocity_meta_data` VALUES (1, '<p>@include(\'shop::home.advertisements.advertisement-four\')@include(\'shop::home.featured-products\') @include(\'shop::home.product-policy\') @include(\'shop::home.advertisements.advertisement-three\') @include(\'shop::home.new-products\') @include(\'shop::home.advertisements.advertisement-two\')</p>', '<p>We love to craft softwares and solve the real world problems with the binaries. We are highly committed to our goals. We invest our resources to create world class easy to use softwares and applications for the enterprise business with the top notch, on the edge technology expertise.</p>', '<div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"{!! url(\'page/about-us\') !!}\">About Us</a></li><li><a href=\"{!! url(\'page/cutomer-service\') !!}\">Customer Service</a></li><li><a href=\"{!! url(\'page/whats-new\') !!}\">What&rsquo;s New</a></li><li><a href=\"{!! url(\'page/contact-us\') !!}\">Contact Us </a></li></ul></div><div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"{!! url(\'page/return-policy\') !!}\"> Order and Returns </a></li><li><a href=\"{!! url(\'page/payment-policy\') !!}\"> Payment Policy </a></li><li><a href=\"{!! url(\'page/shipping-policy\') !!}\"> Shipping Policy</a></li><li><a href=\"{!! url(\'page/privacy-policy\') !!}\"> Privacy and Cookies Policy </a></li></ul></div>', 1, NULL, 9, 10, 10, '<div class=\"social-icons col-lg-6\"><a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-facebook\" title=\"facebook\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-twitter\" title=\"twitter\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-linked-in\" title=\"linkedin\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-pintrest\" title=\"Pinterest\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-youtube\" title=\"Youtube\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-instagram\" title=\"instagram\"></i></a></div>', NULL, NULL, NULL, '<div class=\"row col-12 remove-padding-margin\"><div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-van-ship fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Free Shipping on Order $20 or More</span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Replace &amp; Return Available </span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Exchange and EMI Available </span></div></div></div></div></div>', 'en', 'default', '5');
INSERT INTO `velocity_meta_data` VALUES (2, '<p>@include(\'shop::home.advertisements.advertisement-four\')@include(\'shop::home.featured-products\') @include(\'shop::home.product-policy\') @include(\'shop::home.advertisements.advertisement-three\') @include(\'shop::home.new-products\') @include(\'shop::home.advertisements.advertisement-two\')</p>', '<p>We love to craft softwares and solve the real world problems with the binaries. We are highly committed to our goals. We invest our resources to create world class easy to use softwares and applications for the enterprise business with the top notch, on the edge technology expertise.</p>', '<div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"{!! url(\'page/about-us\') !!}\">About Us</a></li><li><a href=\"{!! url(\'page/cutomer-service\') !!}\">Customer Service</a></li><li><a href=\"{!! url(\'page/whats-new\') !!}\">What&rsquo;s New</a></li><li><a href=\"{!! url(\'page/contact-us\') !!}\">Contact Us </a></li></ul></div><div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"{!! url(\'page/return-policy\') !!}\"> Order and Returns </a></li><li><a href=\"{!! url(\'page/payment-policy\') !!}\"> Payment Policy </a></li><li><a href=\"{!! url(\'page/shipping-policy\') !!}\"> Shipping Policy</a></li><li><a href=\"{!! url(\'page/privacy-policy\') !!}\"> Privacy and Cookies Policy </a></li></ul></div>', 1, NULL, 9, 10, 10, '<div class=\"social-icons col-lg-6\"><a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-facebook\" title=\"facebook\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-twitter\" title=\"twitter\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-linked-in\" title=\"linkedin\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-pintrest\" title=\"Pinterest\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-youtube\" title=\"Youtube\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-instagram\" title=\"instagram\"></i></a></div>', NULL, NULL, NULL, '<div class=\"row col-12 remove-padding-margin\"><div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-van-ship fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Free Shipping on Order $20 or More</span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Replace &amp; Return Available </span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Exchange and EMI Available </span></div></div></div></div></div>', 'vi', 'default', '5');
COMMIT;

-- ----------------------------
-- Table structure for wishlist
-- ----------------------------
DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `item_options` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `additional` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_channel_id_foreign` (`channel_id`),
  KEY `wishlist_product_id_foreign` (`product_id`),
  KEY `wishlist_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of wishlist
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Function structure for get_url_path_of_category
-- ----------------------------
DROP FUNCTION IF EXISTS `get_url_path_of_category`;
delimiter ;;
CREATE FUNCTION `get_url_path_of_category`(categoryId INT,
                localeCode VARCHAR(255))
 RETURNS varchar(255) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
  DETERMINISTIC
BEGIN

                DECLARE urlPath VARCHAR(255);

                IF NOT EXISTS (
                    SELECT id
                    FROM categories
                    WHERE
                        id = categoryId
                        AND parent_id IS NULL
                )
                THEN
                    SELECT
                        GROUP_CONCAT(parent_translations.slug SEPARATOR '/') INTO urlPath
                    FROM
                        categories AS node,
                        categories AS parent
                        JOIN category_translations AS parent_translations ON parent.id = parent_translations.category_id
                    WHERE
                        node._lft >= parent._lft
                        AND node._rgt <= parent._rgt
                        AND node.id = categoryId
                        AND node.parent_id IS NOT NULL
                        AND parent.parent_id IS NOT NULL
                        AND parent_translations.locale = localeCode
                    GROUP BY
                        node.id;

                    IF urlPath IS NULL
                    THEN
                        SET urlPath = (SELECT slug FROM category_translations WHERE category_translations.category_id = categoryId);
                    END IF;
                 ELSE
                    SET urlPath = '';
                 END IF;

                 RETURN urlPath;
            END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table categories
-- ----------------------------
DROP TRIGGER IF EXISTS `trig_categories_insert`;
delimiter ;;
CREATE TRIGGER `trig_categories_insert` AFTER INSERT ON `categories` FOR EACH ROW BEGIN
                            DECLARE urlPath VARCHAR(255);
            DECLARE localeCode VARCHAR(255);
            DECLARE done INT;
            DECLARE curs CURSOR FOR (SELECT category_translations.locale
                    FROM category_translations
                    WHERE category_id = NEW.id);
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;


            IF EXISTS (
                SELECT *
                FROM category_translations
                WHERE category_id = NEW.id
            )
            THEN

                OPEN curs;

            	SET done = 0;
                REPEAT
                	FETCH curs INTO localeCode;

                    SELECT get_url_path_of_category(NEW.id, localeCode) INTO urlPath;

                    IF NEW.parent_id IS NULL
                    THEN
                        SET urlPath = '';
                    END IF;

                    UPDATE category_translations
                    SET url_path = urlPath
                    WHERE
                        category_translations.category_id = NEW.id
                        AND category_translations.locale = localeCode;

                UNTIL done END REPEAT;

                CLOSE curs;

            END IF;
            END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table categories
-- ----------------------------
DROP TRIGGER IF EXISTS `trig_categories_update`;
delimiter ;;
CREATE TRIGGER `trig_categories_update` AFTER UPDATE ON `categories` FOR EACH ROW BEGIN
                            DECLARE urlPath VARCHAR(255);
            DECLARE localeCode VARCHAR(255);
            DECLARE done INT;
            DECLARE curs CURSOR FOR (SELECT category_translations.locale
                    FROM category_translations
                    WHERE category_id = NEW.id);
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;


            IF EXISTS (
                SELECT *
                FROM category_translations
                WHERE category_id = NEW.id
            )
            THEN

                OPEN curs;

            	SET done = 0;
                REPEAT
                	FETCH curs INTO localeCode;

                    SELECT get_url_path_of_category(NEW.id, localeCode) INTO urlPath;

                    IF NEW.parent_id IS NULL
                    THEN
                        SET urlPath = '';
                    END IF;

                    UPDATE category_translations
                    SET url_path = urlPath
                    WHERE
                        category_translations.category_id = NEW.id
                        AND category_translations.locale = localeCode;

                UNTIL done END REPEAT;

                CLOSE curs;

            END IF;
            END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table category_translations
-- ----------------------------
DROP TRIGGER IF EXISTS `trig_category_translations_insert`;
delimiter ;;
CREATE TRIGGER `trig_category_translations_insert` BEFORE INSERT ON `category_translations` FOR EACH ROW BEGIN
                            DECLARE parentUrlPath varchar(255);
            DECLARE urlPath varchar(255);

            IF NOT EXISTS (
                SELECT id
                FROM categories
                WHERE
                    id = NEW.category_id
                    AND parent_id IS NULL
            )
            THEN

                SELECT
                    GROUP_CONCAT(parent_translations.slug SEPARATOR '/') INTO parentUrlPath
                FROM
                    categories AS node,
                    categories AS parent
                    JOIN category_translations AS parent_translations ON parent.id = parent_translations.category_id
                WHERE
                    node._lft >= parent._lft
                    AND node._rgt <= parent._rgt
                    AND node.id = (SELECT parent_id FROM categories WHERE id = NEW.category_id)
                    AND node.parent_id IS NOT NULL
                    AND parent.parent_id IS NOT NULL
                    AND parent_translations.locale = NEW.locale
                GROUP BY
                    node.id;

                IF parentUrlPath IS NULL
                THEN
                    SET urlPath = NEW.slug;
                ELSE
                    SET urlPath = concat(parentUrlPath, '/', NEW.slug);
                END IF;

                SET NEW.url_path = urlPath;

            END IF;
            END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table category_translations
-- ----------------------------
DROP TRIGGER IF EXISTS `trig_category_translations_update`;
delimiter ;;
CREATE TRIGGER `trig_category_translations_update` BEFORE UPDATE ON `category_translations` FOR EACH ROW BEGIN
                            DECLARE parentUrlPath varchar(255);
            DECLARE urlPath varchar(255);

            IF NOT EXISTS (
                SELECT id
                FROM categories
                WHERE
                    id = NEW.category_id
                    AND parent_id IS NULL
            )
            THEN

                SELECT
                    GROUP_CONCAT(parent_translations.slug SEPARATOR '/') INTO parentUrlPath
                FROM
                    categories AS node,
                    categories AS parent
                    JOIN category_translations AS parent_translations ON parent.id = parent_translations.category_id
                WHERE
                    node._lft >= parent._lft
                    AND node._rgt <= parent._rgt
                    AND node.id = (SELECT parent_id FROM categories WHERE id = NEW.category_id)
                    AND node.parent_id IS NOT NULL
                    AND parent.parent_id IS NOT NULL
                    AND parent_translations.locale = NEW.locale
                GROUP BY
                    node.id;

                IF parentUrlPath IS NULL
                THEN
                    SET urlPath = NEW.slug;
                ELSE
                    SET urlPath = concat(parentUrlPath, '/', NEW.slug);
                END IF;

                SET NEW.url_path = urlPath;

            END IF;
            END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

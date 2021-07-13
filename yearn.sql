-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.5.9-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 yearn_painting 的数据库结构
CREATE DATABASE IF NOT EXISTS `yearn_painting` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `yearn_painting`;

-- 导出  表 yearn_painting.certification 结构
CREATE TABLE IF NOT EXISTS `certification` (
  `id` varchar(50) DEFAULT NULL COMMENT 'ID',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `id_card` varchar(50) DEFAULT NULL COMMENT '身份证号',
  `actual_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `approve` varchar(50) DEFAULT NULL COMMENT '审批状态 0 申请中 1通过 2未通过',
  `blockade` varchar(50) DEFAULT NULL COMMENT '0未封锁 1 以封锁',
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='画师认证表';

-- 正在导出表  yearn_painting.certification 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `certification` DISABLE KEYS */;
INSERT INTO `certification` (`id`, `user_id`, `id_card`, `actual_name`, `create_time`, `approve`, `blockade`) VALUES
	('d7030e3209104a39bafed7779e20650b', 'ce88f124526344b08416c2608ce3b5c2', '210847294827564829', '张三', '2021-05-05 15:40:59', '1', '0');
/*!40000 ALTER TABLE `certification` ENABLE KEYS */;

-- 导出  表 yearn_painting.order 结构
CREATE TABLE IF NOT EXISTS `order` (
  `id` varchar(50) DEFAULT NULL COMMENT 'ID',
  `planning_id` varchar(50) DEFAULT NULL COMMENT '企划ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT '订单状态0进行1以完成2以中断3已退款',
  `refund` varchar(50) DEFAULT NULL COMMENT '退款0未申请1申请',
  `reason` varchar(50) DEFAULT NULL COMMENT '退款理由',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `feedback` varchar(50) DEFAULT NULL COMMENT '订单反馈'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- 正在导出表  yearn_painting.order 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`id`, `planning_id`, `order_status`, `refund`, `reason`, `create_time`, `user_id`, `feedback`) VALUES
	('f172197fb5c14812b6f7e3f68eef42d4', 'a4683a7bcdb94623910935bc70a0a44a', '2', '0', NULL, '2021-04-26 21:34:19', '32a77e76444b4b9ba646a4030fa4c303', '案发时发'),
	('721da8b3e38a4de3a53de88518adf1dc', 'a4683a7bcdb94623910935bc70a0a44a', '3', '0', NULL, '2021-04-26 21:34:31', '32a77e76444b4b9ba646a4030fa4c303', '啊沙发沙发'),
	('f5f5c08313ae47bda5338952a09d878e', '5d58c045d1c549d793e2821eb7e0e248', '0', '0', NULL, '2021-05-05 14:33:06', '32a77e76444b4b9ba646a4030fa4c303', NULL),
	('cca618934acd4d368af9870182601a81', 'ee9eaf390af4458086597573e43c4462', '0', '0', NULL, '2021-05-05 15:48:15', 'ce88f124526344b08416c2608ce3b5c2', NULL),
	('dba7cba1ffdc4128af7a46f66034316d', '8a31ca41830f4a55a44ff075b5b92e42', '1', '0', NULL, '2021-05-06 00:07:27', 'ce88f124526344b08416c2608ce3b5c2', NULL),
	('30f4dcc4aa764804a6e42d2d70e7f14c', '313f30793b4f4a249b5ed0917019a8a6', '0', '0', NULL, '2021-05-16 16:07:37', '865b990333bb4e3f8b7eb720f2b575b1', NULL);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

-- 导出  表 yearn_painting.planning 结构
CREATE TABLE IF NOT EXISTS `planning` (
  `id` varchar(50) NOT NULL COMMENT '企划ID',
  `use` varchar(50) NOT NULL COMMENT '用途',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '收稿时间',
  `min_money` int(11) DEFAULT NULL COMMENT '最小费用',
  `max_money` int(11) DEFAULT NULL COMMENT '最大费用',
  `title` varchar(50) DEFAULT NULL COMMENT '稿件标题',
  `content` varchar(50) DEFAULT NULL COMMENT '稿件描述',
  `planning_type` varchar(50) DEFAULT NULL COMMENT '稿件类型',
  `create_user_id` varchar(50) DEFAULT NULL COMMENT '创建用户ID',
  `acceptance_stage` varchar(255) DEFAULT NULL COMMENT '验收阶段',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `status` varchar(50) DEFAULT NULL COMMENT '企划状态0未发布 1发布',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企划表';

-- 正在导出表  yearn_painting.planning 的数据：~13 rows (大约)
/*!40000 ALTER TABLE `planning` DISABLE KEYS */;
INSERT INTO `planning` (`id`, `use`, `end_time`, `min_money`, `max_money`, `title`, `content`, `planning_type`, `create_user_id`, `acceptance_stage`, `create_time`, `status`) VALUES
	('313f30793b4f4a249b5ed0917019a8a6', '啊沙发沙发', '2021-04-24 20:45:17', 50, 100, '会让他华人', '豆腐干大概', 'PNG', '32a77e76444b4b9ba646a4030fa4c303', '阿发是否', '2021-04-24 20:47:04', '0'),
	('531039d959394a64a37912ca8a106af5', '啊沙发沙发', '2021-04-24 20:45:17', 50, 100, '分段施工的', '豆腐干大概', 'PNG', '32a77e76444b4b9ba646a4030fa4c303', '阿发是否', '2021-04-24 20:47:07', '0'),
	('5bccb0b90e0546d4bb1ee12d34828f83', '啊沙发沙发', '2021-04-24 20:45:17', 50, 100, '手动阀手动阀', '豆腐干大概', 'PNG', '32a77e76444b4b9ba646a4030fa4c303', '阿发是否', '2021-04-24 20:47:02', '0'),
	('5d58c045d1c549d793e2821eb7e0e248', '测试使用', '2021-04-20 21:19:25', 50, 100, '哈哈', '哈哈', 'JPEG', '32a77e76444b4b9ba646a4030fa4c303', '哈哈', '2021-04-20 21:19:39', '0'),
	('6cb695c4b0a84b2ca647e5f8e4f22b8b', '啊沙发沙发', '2021-04-24 20:45:17', 50, 100, '三国杀', '豆腐干大概', 'PNG', '32a77e76444b4b9ba646a4030fa4c303', '阿发是否', '2021-04-24 20:46:41', '0'),
	('7f4941a3556642f080af4717fb22cf4b', '啊沙发沙发', '2021-04-24 20:45:17', 50, 100, '是豆腐干山豆根', '豆腐干大概', 'PNG', '32a77e76444b4b9ba646a4030fa4c303', '阿发是否', '2021-04-24 20:46:55', '0'),
	('8a31ca41830f4a55a44ff075b5b92e42', '个人头像使用', '2021-05-08 00:00:00', 50, 100, '卡通头像', '本人十分需要一个卡通人设头像，有意者联系我', 'PNG', '865b990333bb4e3f8b7eb720f2b575b1', '10% 交付线稿 50% 上色 100% 结账', '2021-05-05 23:57:16', '0'),
	('a4683a7bcdb94623910935bc70a0a44a', '啊沙发沙发', '2021-04-24 20:45:17', 50, 100, '风格的部分干部', '豆腐干大概', 'PNG', '32a77e76444b4b9ba646a4030fa4c303', '阿发是否', '2021-04-24 20:46:53', '0'),
	('b5367f7b20a645d6a414c61c5b912cc1', '啊沙发沙发', '2021-04-24 20:45:17', 50, 100, '主席周小川', '豆腐干大概', 'PNG', '32a77e76444b4b9ba646a4030fa4c303', '阿发是否', '2021-04-24 20:47:00', '0'),
	('b8924868fcfc49a6bd34e24f1427ba96', '啊沙发沙发', '2021-04-24 20:45:17', 50, 100, '请问请问', '豆腐干大概', 'PNG', '32a77e76444b4b9ba646a4030fa4c303', '阿发是否', '2021-04-24 20:46:58', '0'),
	('cc98245d30a442d29ef20c9b4ecad990', '啊沙发沙发', '2021-04-24 20:45:17', 50, 100, '豆腐干大概大概', '豆腐干大概', 'PNG', '32a77e76444b4b9ba646a4030fa4c303', '阿发是否', '2021-04-24 20:46:50', '0'),
	('e904f997acac456991f4dd5beed671b6', '手动阀手动阀', '2021-04-24 20:45:17', 50, 100, '阿萨大大', '阿发是否', 'PNG', '32a77e76444b4b9ba646a4030fa4c303', '阿发是否', '2021-04-24 20:45:35', '0'),
	('ee9eaf390af4458086597573e43c4462', '啊实打实的', '2021-04-24 20:45:17', 50, 100, '阿萨法发是', '阿发是否', 'PNG', '32a77e76444b4b9ba646a4030fa4c303', '阿发是否', '2021-04-24 20:45:30', '0'),
	('f604d1a7a3384a259d625384a7dd7db1', '啊沙发沙发', '2021-04-24 20:45:17', 50, 100, '戛纳甘胺', '豆腐干大概', 'PNG', '32a77e76444b4b9ba646a4030fa4c303', '阿发是否', '2021-04-24 20:46:46', '0');
/*!40000 ALTER TABLE `planning` ENABLE KEYS */;

-- 导出  表 yearn_painting.release 结构
CREATE TABLE IF NOT EXISTS `release` (
  `id` varchar(50) NOT NULL COMMENT 'ID',
  `planning_id` varchar(50) DEFAULT NULL COMMENT '企划ID',
  `release_type` varchar(50) DEFAULT NULL COMMENT '企划类型0定向1全部',
  `invite_people` varchar(50) DEFAULT NULL COMMENT '邀请用户',
  `accept_users` varchar(50) DEFAULT NULL COMMENT '接受用户',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '发布时间',
  `feedback` varchar(50) DEFAULT NULL COMMENT '定期反馈',
  PRIMARY KEY (`id`),
  UNIQUE KEY `planning_id` (`planning_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发布企划表';

-- 正在导出表  yearn_painting.release 的数据：~13 rows (大约)
/*!40000 ALTER TABLE `release` DISABLE KEYS */;
INSERT INTO `release` (`id`, `planning_id`, `release_type`, `invite_people`, `accept_users`, `create_time`, `feedback`) VALUES
	('0a2be01af92345a2bde72065abdce8f2', '5d58c045d1c549d793e2821eb7e0e248', '1', NULL, NULL, '2021-04-24 20:17:34', NULL),
	('2da507c0031941c183022de92312d7f7', 'a4683a7bcdb94623910935bc70a0a44a', '1', NULL, NULL, '2021-04-24 20:47:26', NULL),
	('557415626c37472d832be432eb754cd7', 'ee9eaf390af4458086597573e43c4462', '1', NULL, NULL, '2021-04-24 20:47:31', '123'),
	('6342ff81db194fdf8d565b4ae90f197b', '313f30793b4f4a249b5ed0917019a8a6', '1', NULL, NULL, '2021-04-24 20:47:22', NULL),
	('6e57362296654f719b483b90b10ef4fb', '5bccb0b90e0546d4bb1ee12d34828f83', '1', NULL, NULL, '2021-04-24 20:47:23', NULL),
	('a9d48301e4b345439381277928e4945b', '531039d959394a64a37912ca8a106af5', '1', NULL, NULL, '2021-04-24 20:47:23', NULL),
	('b01708ee256541b2b819b667f7a42f9a', 'b5367f7b20a645d6a414c61c5b912cc1', '1', NULL, NULL, '2021-04-24 20:47:28', NULL),
	('b650072393b74e49bfbd4365a079abd4', 'b8924868fcfc49a6bd34e24f1427ba96', '1', NULL, NULL, '2021-04-24 20:47:28', NULL),
	('b8d5588806414f1aac92fbc6e45c25aa', '8a31ca41830f4a55a44ff075b5b92e42', '1', NULL, NULL, '2021-05-06 00:07:03', NULL),
	('dc69e6912c424c289ebec1e70cd08df3', '6cb695c4b0a84b2ca647e5f8e4f22b8b', '1', NULL, NULL, '2021-04-24 20:47:24', NULL),
	('e0bae23f5cf440f2851f671e40020919', 'e904f997acac456991f4dd5beed671b6', '1', NULL, NULL, '2021-04-24 20:47:29', NULL),
	('edadd44d772b46799e23c03c196df6b1', 'cc98245d30a442d29ef20c9b4ecad990', '1', NULL, NULL, '2021-04-24 20:47:29', NULL),
	('f5c84258b0ac4bf790a7bbee6f3a4303', '7f4941a3556642f080af4717fb22cf4b', '1', NULL, NULL, '2021-04-24 20:47:26', NULL);
/*!40000 ALTER TABLE `release` ENABLE KEYS */;

-- 导出  表 yearn_painting.sys_user 结构
CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` varchar(50) NOT NULL COMMENT 'ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `realname` varchar(50) NOT NULL COMMENT '昵称',
  `mail` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `tel` varchar(50) DEFAULT NULL COMMENT '电话',
  `pay_password` varchar(50) DEFAULT NULL COMMENT '支付密码',
  `role` varchar(50) DEFAULT NULL COMMENT '角色(0企划方,1画师,3管理员)',
  `ban` varchar(50) DEFAULT NULL COMMENT '是否封禁0 未封 1 封',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- 正在导出表  yearn_painting.sys_user 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`id`, `username`, `password`, `realname`, `mail`, `tel`, `pay_password`, `role`, `ban`) VALUES
	('32a77e76444b4b9ba646a4030fa4c303', 'admin', '123456', '管理员用户', 'shiwan@163.com', '1066777959', '123', '2', '0'),
	('865b990333bb4e3f8b7eb720f2b575b1', 'qihuafang', '123456', '企划方用户', 'Test@163.com', '18740766666', NULL, '0', NULL),
	('8bc3de855e5e4ed4acf57b682b03bd73', 'putong', '123456', '普通用户', '20210505@163.com', '10086', '123456', '0', NULL),
	('ce88f124526344b08416c2608ce3b5c2', 'huashi', '123456', '画师用户', NULL, NULL, NULL, '1', NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

-- 导出  表 yearn_painting.test 结构
CREATE TABLE IF NOT EXISTS `test` (
  `id` varchar(50) NOT NULL,
  `test_one` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试表';

-- 正在导出表  yearn_painting.test 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;

-- 导出  表 yearn_painting.user_attention 结构
CREATE TABLE IF NOT EXISTS `user_attention` (
  `user_id` varchar(50) NOT NULL COMMENT '用户ID',
  `follow_user_id` varchar(50) NOT NULL COMMENT '关注用户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关注表';

-- 正在导出表  yearn_painting.user_attention 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `user_attention` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_attention` ENABLE KEYS */;

-- 导出  表 yearn_painting.user_works 结构
CREATE TABLE IF NOT EXISTS `user_works` (
  `id` varchar(50) NOT NULL COMMENT 'ID',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_size` varchar(255) DEFAULT NULL COMMENT '文件大小',
  `file_description` varchar(255) DEFAULT NULL COMMENT '描述',
  `file_tag` varchar(255) DEFAULT NULL COMMENT '标签',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `check_number` int(10) unsigned zerofill DEFAULT NULL COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作品表';

-- 正在导出表  yearn_painting.user_works 的数据：~24 rows (大约)
/*!40000 ALTER TABLE `user_works` DISABLE KEYS */;
INSERT INTO `user_works` (`id`, `file_name`, `file_size`, `file_description`, `file_tag`, `user_id`, `create_time`, `check_number`) VALUES
	('0440c0a9fca64ae38345877ec8a56050', '20210505102434_87952141_p0.jpg', '6803461', '我的第二幅作品', '作品二', 'ce88f124526344b08416c2608ce3b5c2', '2021-05-05 10:24:34', 0000000031),
	('0769301814404c83bc34c0fba86b0165', '20210404104348_87515945_p0.png', '10338927', NULL, '很不错奥', '32a77e76444b4b9ba646a4030fa4c303', '2021-04-04 10:43:48', 0000000032),
	('0e4b1486730c4bb98827e5bde66a7374', '20210505101548_86336401_p0.jpg', '2440992', '啊啊啊', '嗚呼', '8bc3de855e5e4ed4acf57b682b03bd73', '2021-05-05 10:15:48', 0000000031),
	('244378e65657404c88bf0e3bd54a7dff', '20210406215614_87709922_p1.jpg', '931565', '阿萨大', '阿发·', '32a77e76444b4b9ba646a4030fa4c303', '2021-04-06 21:56:14', 0000000032),
	('2c3a6c5ba47d43baaffa58c78e8568c7', '20210401212915_yande.re 755141 blood reset tagme weapon.jpg', '1272659', '你看看', '咋这么酷炫', '32a77e76444b4b9ba646a4030fa4c303', '2021-04-01 21:29:15', 0000000029),
	('3abcf144f65b4b2cb6bae9b1f25426a8', '20210401212914_yande.re 718454 bodysuit ddal landscape wallpaper.jpg', '1309635', '你看看', '咋这么酷炫', '32a77e76444b4b9ba646a4030fa4c303', '2021-04-01 21:29:14', 0000000029),
	('440bef74092e4f40a5ec511754ce7e5f', '20210404104344_87952141_p0.jpg', '6803461', NULL, '可以的', '32a77e76444b4b9ba646a4030fa4c303', '2021-04-04 10:43:44', 0000000029),
	('618f3cd2bd864f4cbf46f7c0a6dc8823', '20210401204409_88578355_p0.jpg', '5878440', '豆腐干地方', '案说法,阿萨法发', '32a77e76444b4b9ba646a4030fa4c303', '2021-04-01 20:44:09', 0000000030),
	('629a74621aa64be798fc2039368c7c1b', '20210505101606_yande.re 762464 bike_shorts garter mecha nakamura_eight thighhighs.jpg', '4305496', '什麽', '二黑', '8bc3de855e5e4ed4acf57b682b03bd73', '2021-05-05 10:16:06', 0000000031),
	('75ce5aa1eeef4b0a986fc3ec05e43c23', '20210401212912_yande.re 651234 benghuai_xueyuan honkai_impact kuo_(kuo114514) megane seele_vollerei umbrella.jpg', '2309180', '你看看', '咋这么酷炫', '32a77e76444b4b9ba646a4030fa4c303', '2021-04-01 21:29:12', 0000000029),
	('85784547d6f6407bab5a988256d724d4', '20210401191705_yande.re 757059 epi_tamago maeshimashi nun wallpaper wave.jpg', '851768', '一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈一哈', '计划骨结核', '32a77e76444b4b9ba646a4030fa4c303', '2021-04-01 19:17:05', 0000000029),
	('86e7a5c4e0d04cdeb7579be084b2e207', '20210401213348_yande.re 715745 buri_(retty9349) hatsune_miku headphones skirt_lift thighhighs vocaloid.jpg', '1494191', '那真是太奥里给了', '简直不要太帅,那真是太不错了', '32a77e76444b4b9ba646a4030fa4c303', '2021-04-01 21:33:48', 0000000030),
	('89511562d29043e5baeb4dac110949c7', '20210505102436_Konachan.com - 280755 2girls aie cigarette glasses hatsune_miku kasane_teto smoking utau vocaloid.jpg', '1462767', '我的第一幅作品', '作品一', 'ce88f124526344b08416c2608ce3b5c2', '2021-05-05 10:24:36', 0000000031),
	('9eceeb1818a34c7bb1d98c49b77e8421', '20210505102426_yande.re 757059 epi_tamago maeshimashi nun wallpaper wave.jpg', '851768', '我的第五幅作品', '作品一,作品五', 'ce88f124526344b08416c2608ce3b5c2', '2021-05-05 10:24:26', 0000000027),
	('a8d5db301bb04ca086467ff713c3c5cf', '20210401212909_86336401_p0.jpg', '2440992', '你看看', '咋这么酷炫', '32a77e76444b4b9ba646a4030fa4c303', '2021-04-01 21:29:09', 0000000029),
	('afaa90456990457183289b70622dc85a', '20210505102430_88434001_p0.jpg', '1894745', '我的第三幅作品', '作品三', 'ce88f124526344b08416c2608ce3b5c2', '2021-05-05 10:24:30', 0000000031),
	('b1552e97b05047c389b083d058536b2f', '20210401212858_yande.re 718454 bodysuit ddal landscape wallpaper.jpg', '1309635', '你看看', '咋这么酷炫', '32a77e76444b4b9ba646a4030fa4c303', '2021-04-01 21:28:58', 0000000029),
	('b52d9d7cf34945ebb34a2808647531d5', '20210401213353_Konachan.com - 318963 animal black_hair building cat city codec007 guitar headphones hoodie instrument kneehighs original phone red_eyes school_uniform skirt snow umbrella.jpg', '5149629', '那真是太奥里给了', 'kk', '32a77e76444b4b9ba646a4030fa4c303', '2021-04-01 21:33:53', 0000000029),
	('bdc602e6458c469b8359d85856df73f5', '20210401212902_yande.re 755141 blood reset tagme weapon.jpg', '1272659', '你看看', '咋这么酷炫', '32a77e76444b4b9ba646a4030fa4c303', '2021-04-01 21:29:02', 0000000030),
	('c6ae52f1303945afbf6d16ec7c4ffc98', '20210505101601_yande.re 718454 bodysuit ddal landscape wallpaper.jpg', '1309635', '什麽', '二黑', '8bc3de855e5e4ed4acf57b682b03bd73', '2021-05-05 10:16:01', 0000000031),
	('d1262d7873ae4c8fab706467230ed25b', '20210401205459_86336401_p0.jpg', '2440992', '我的阿萨大阿萨大', '133,大大·,奥里给标签,阿萨大大,阿斯顿', '32a77e76444b4b9ba646a4030fa4c303', '2021-04-01 20:54:59', 0000000029),
	('d50eff2701f1429dbcba8f002c929e7e', '20210401213345_85331814_p0.jpg', '2807051', '那真是太奥里给了', '和规范化', '32a77e76444b4b9ba646a4030fa4c303', '2021-04-01 21:33:45', 0000000029),
	('dd85689312af411e80c47cabc5962ce5', '20210404104353_88434001_p0.jpg', '1894745', NULL, '初音,Miku', '32a77e76444b4b9ba646a4030fa4c303', '2021-04-04 10:43:53', 0000000032),
	('e3bf0c6275b045abba41799e80efa192', '20210505102428_yande.re 762464 bike_shorts garter mecha nakamura_eight thighhighs.jpg', '4305496', '我的第四幅作品', '作品一,作品四', 'ce88f124526344b08416c2608ce3b5c2', '2021-05-05 10:24:28', 0000000027);
/*!40000 ALTER TABLE `user_works` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

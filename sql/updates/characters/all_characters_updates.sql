Nothing for now !UPDATE worldstates SET value=14 WHERE entry=20004;
DROP TABLE IF EXISTS `quest_tracker`;
CREATE TABLE `quest_tracker` (
    `id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
    `character_guid` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `quest_accept_time` DATETIME NOT NULL,
    `quest_complete_time` DATETIME DEFAULT NULL,
    `quest_abandon_time` DATETIME DEFAULT NULL,
    `completed_by_gm` BOOL NOT NULL DEFAULT '0',
    `core_hash` VARCHAR(120) NOT NULL DEFAULT '0',
    `core_revision` VARCHAR(120) NOT NULL DEFAULT '0'
)
ENGINE=InnoDB;DROP TABLE IF EXISTS `character_casino_data`;
ALTER TABLE `characters` ADD `currentPetSlot` smallint(2) NOT NULL DEFAULT 0 AFTER `grantableLevels`;-- Warning : this makes  characters  with 0 honor to start from 0 because if remain with thoose numbers it will still be error

-- Drop Currency Table
DROP TABLE IF EXISTS `character_currency`;

-- Create Currency Table
CREATE TABLE `character_currency` (
  `guid` int(10) unsigned NOT NULL,
  `currency` smallint(5) unsigned NOT NULL,
  `week_count` int(10) unsigned NOT NULL,
  `total_count` int(10) unsigned NOT NULL,
  `season_count` INT(11) unsigned NOT NULL,
  PRIMARY KEY (`guid`,`currency`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

-- OLD Numbers For Old Currency System
-- insert  into `character_currency`(`guid`,`currency`,`total_count`,`week_count`,`week_cap`) values (1,390,0,0,165000),(1,392,0,0,0),(1,395,0,0,0),(1,396,720,720,100000),(2,390,0,0,165000),(2,392,0,0,0),(2,395,0,0,0),(2,396,240,240,100000),(3,390,0,0,165000),(3,392,0,0,0),(3,395,0,0,0),(3,396,0,0,100000),(4,390,0,0,165000),(4,392,0,0,0),(4,395,0,0,0),(4,396,240,240,100000),(5,390,0,0,165000),(5,392,0,0,0),(5,395,0,0,0),(5,396,0,0,100000),(6,390,0,0,165000),(6,392,0,0,0),(6,395,0,0,0),(6,396,0,0,100000),(7,390,0,0,165000),(7,392,0,0,0),(7,395,0,0,0),(7,396,0,0,100000),(8,390,0,0,165000),(8,392,0,0,0),(8,395,0,0,0),(8,396,7120,7120,100000),(9,390,0,0,165000),(9,392,0,0,0),(9,395,0,0,0),(9,396,7200,7200,100000),(10,390,0,0,165000),(10,392,0,0,0),(10,395,0,0,0),(10,396,0,0,100000),(11,390,0,0,165000),(11,392,0,0,0),(11,395,0,0,0),(11,396,0,0,100000),(12,390,0,0,165000),(12,392,0,0,0),(12,395,0,0,0),(12,396,0,0,100000),(13,390,10000,10000,165000),(13,392,42028,42028,0),(13,395,0,0,0),(13,396,0,0,100000),(14,390,0,0,165000),(14,392,0,0,0),(14,395,0,0,0),(14,396,0,0,100000),(15,390,0,0,165000),(15,392,0,0,0),(15,395,0,0,0),(15,396,0,0,100000),(16,390,0,0,165000),(16,392,0,0,0),(16,395,0,0,0),(16,396,0,0,100000),(17,390,10000,10000,165000),(17,392,1756,1756,0),(17,395,39170,39170,0),(17,396,24780,24780,100000),(18,390,0,0,165000),(18,392,0,0,0),(18,395,0,0,0),(18,396,80,80,100000);

-- some  of server it might need  clean table or run this query 
-- UPDATE  character_currency SET week_cap=0;
-- but  i warning you this makes  characters  with 0 honor to start from 0 because if remain with thoose numbers it will still be error

-- You Need Only Updates ? Ok So Do these lines Carefully
-- ALTER TABLE `character_currency` DROP COLUMN `new_cap`;
-- ALTER TABLE `character_currency` ADD COLUMN `season_count` INT(11) UNSIGNED NOT NULL AFTER `total_count`;
-- Also For Currect Work U Should Change the Order in This Way :   1-guid  2-currency  3-week_count  4-total_count  5-season_count

-- *Guide*
-- Add Character_currency.sql & character_currency_week_cap.sql at Character Database 
-- For test it u can use these commends in Game
-- Valor : .mod curr 396 x
-- Justic : .mod curr 395 x
-- Honor : .mod curr 392 x
-- Conquest :  .mod curr 396 x-- Drop Table If Exist
DROP TABLE IF EXISTS `character_currency_weekcap`;
-- Create character_currency_weekcap Table
CREATE TABLE `character_currency_weekcap` (
`guid` INT(10) UNSIGNED NOT NULL DEFAULT '0',
`source` SMALLINT(3) UNSIGNED NOT NULL DEFAULT '0',
`max_week_rating` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
`week_cap` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
PRIMARY KEY (`guid`, `source`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;DROP TABLE IF EXISTS `players_reports_status`;

CREATE TABLE `players_reports_status` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `creation_time` int(10) unsigned NOT NULL DEFAULT '0',
  `average` float NOT NULL DEFAULT '0',
  `total_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `speed_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fly_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `jump_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `waterwalk_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `teleportplane_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `climb_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='';

DROP TABLE IF EXISTS `daily_players_reports`;
CREATE TABLE `daily_players_reports` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `creation_time` int(10) unsigned NOT NULL DEFAULT '0',
  `average` float NOT NULL DEFAULT '0',
  `total_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `speed_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fly_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `jump_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `waterwalk_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `teleportplane_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `climb_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='';-- -------------------------------------------------------
--		Pro Fake Player System Make By lizard.tiny		--
--														--
--		Email : lizard.tiny@gmail.com					--
--		Skype : lizard.tiny								--
--														--
--		Game Server : Funwowserver.Com					--
----------------------------------------------------------

-- Import This File In To " Characters " Database

-- Fake Player DB
DROP TABLE IF EXISTS `characters_fake`;
CREATE TABLE `characters_fake` (
  `name` varchar(36) NOT NULL,
  `race` mediumint(3) NOT NULL DEFAULT '0',
  `class` mediumint(3) NOT NULL DEFAULT '0',
  `level` mediumint(3) NOT NULL DEFAULT '0',
  `zone` mediumint(9) NOT NULL DEFAULT '0',
  `gender` mediumint(3) NOT NULL DEFAULT '0',
  `guild` varchar(255) NOT NULL,
  `online` mediumint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
-- Fake Player List
INSERT INTO `characters_fake`(`name`,`race`,`class`,`level`,`zone`,`gender`,`guild`,`online`) VALUES 
('Drikish',10,8,86,38,0,'Anathema',2),('Sovelis',1,1,90,45,0,'Anathema',2),('Cuddles',10,2,90,13,0,'Anathema',2),('Epiasdv',8,4,86,30,0,'Anathema',2),('Mac',5,4,86,8,0,'Anathema',2),('Tiesto',8,6,87,50,0,'Anathema',2),('Ihavfacebook',11,7,87,28,1,'Anathema',2),('Mimik',10,4,86,36,0,'Anathema',2),('Deadmau',5,4,90,210,0,'Anathema',2),('Smoosh',8,1,86,26,0,'Anathema',2),('Shadowcrest',4,4,87,37,1,'Anathema',2),('Lolol',4,5,90,8,1,'Anathema',2),('Prox',11,1,86,28,1,'Anathema',2),('Rovip',10,4,87,17,0,'Anathema',2),('Ryan',10,8,87,49,0,'Anathema',2),('Holysmite',1,2,86,46,0,'',2),('Airagon',10,2,87,30,0,'',2),('Fracture',5,1,87,12,0,'',2),('Supershen',10,2,86,18,1,'',2),('Jana',2,4,90,6,0,'',2),('Gamm',2,1,90,26,0,'',2),('Emoarchie',10,8,87,11,0,'',2),('Melia',10,2,90,28,1,'',2),('Balu',6,11,90,4,0,'',2),('Jabari',2,1,90,38,0,'',2),('Sinan',10,2,85,25,0,'',2),('Shisha',10,4,90,9,1,'',2),('Killbill',1,4,90,23,0,'',2),('Gaby',4,11,85,37,1,'',2),('Fallen',4,4,90,13,0,'',2),('Druidita',6,11,86,210,0,'',2),('Pigolo',6,11,90,35,0,'',2),('Saga',10,2,90,11,0,'',2),('Deadmask',10,2,90,49,0,'',2),('Assasincz',4,4,90,12,0,'',2),('Petracz',1,4,90,11,1,'',2),('Aleks',10,2,85,21,0,'',2),('Cazadormen',4,4,90,20,1,'',2),('Kireth',1,2,90,38,1,'',2),('Liesma',1,1,90,28,1,'',2),('Tyller',1,1,90,25,0,'',2),('Astrabutaz',1,2,90,210,0,'',2),('Carlita',7,8,90,28,1,'',2),('beanie',10,2,87,18,0,'Panda Lords',2),('Nergal',10,3,90,210,0,'Panda Lords',2),('Smikis',10,5,90,20,0,'Panda Lords',2),('Peperoma',11,2,90,35,0,'Panda Lords',2),('May',1,2,90,16,1,'Panda Lords',2),('Keyadis',8,7,90,24,0,'Panda Lords',2),('Preatorian',10,2,90,19,0,'Panda Lords',2),('Mitza',1,9,90,24,0,'Panda Lords',2),('Keedor',10,2,86,14,0,'Panda Lords',2),('Kekw',4,3,90,45,1,'Panda Lords',2),('Wark',1,2,90,35,0,'Panda Lords',2),('Barrabus',10,2,85,39,0,'Panda Lords',2),('Malodetehepy',4,11,90,38,0,'Panda Lords',2),('Dranati',10,2,90,24,0,'Panda Lords',2),('Sorin',2,1,90,6,0,'Panda Lords',2),('Resan',4,4,90,7,0,'Panda Lords',2),('Silverhilt',1,1,90,17,1,'Panda Lords',2),('Chirica',10,2,90,15,0,'Panda Lords',2),('Trias',10,8,90,21,0,'Panda Lords',2),('Prdo',5,1,90,10,0,'Panda Lords',2),('Guten',8,7,90,37,0,'Panda Lords',2),('Sonsia',4,3,90,6,1,'Panda Lords',2),('Smikiss',10,4,86,15,0,'Panda Lords',2),('Ledy',4,1,90,9,1,'Panda Lords',2),('Rymar',5,4,90,1,0,'',2),('Rokass',5,1,90,25,0,'',2),('Waisha',10,3,90,21,1,'',2),('Xenon',4,1,90,210,0,'',2),('Palanoski',1,2,90,32,0,'',2),('Helona',6,11,85,23,1,'',2),('Skalons',2,1,90,19,0,'',2),('Zazlock',5,9,90,23,0,'',2),('Zazk',6,7,90,10,0,'',2),('Ezekiel',10,9,90,31,0,'',2),('Deiv',10,8,90,24,0,'',2),('Crashwar',5,1,90,27,0,'',2),('Bandaid',5,5,86,10,0,'',2),('Hunterherbie',4,3,90,210,0,'Premium Bax',2),('Cheesebeard',3,1,90,26,0,'Premium Bax',2),('Phin',7,8,90,16,0,'Premium Bax',2),('Prig',10,5,90,50,0,'Premium Bax',2),('Eraevel',10,5,90,3,1,'Premium Bax',2),('Bourne',5,4,90,15,0,'Premium Bax',2),('Twoogi',5,8,90,16,0,'Premium Bax',2),('Devon',5,4,77,33,0,'Premium Bax',2),('Ledystar',1,2,86,18,1,'Premium Bax',2),('Frostie',10,8,90,40,1,'Premium Bax',2),('Kie',5,4,90,43,0,'Premium Bax',2),('Reios',1,2,90,48,0,'Premium Bax',2),('Zero',4,4,90,9,0,'',2),('Wuk',2,1,90,50,0,'',2),('Sylvaediir',4,3,90,21,0,'',2),('Kansetsu',11,2,90,210,0,'',2),('Makura',11,2,90,14,1,'',2),('Demonia',11,2,85,1,1,'',2),('Stonebull',6,11,90,15,0,'',2),('Marianus',10,2,90,19,0,'',2);

UPDATE characters_fake SET `level` = level -35;
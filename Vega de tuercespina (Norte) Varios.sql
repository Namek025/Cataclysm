-- CAMPAMENTO REBELDE

-- CREATURE (repetidos, lvl, etc.)
-- Rebel Watchman "332578"	"52404"	"0"	"0"	"0"	"1"	"1"	"38082"	"1"	"-11346.3"	"-225.003"	"76.1621"	"5.97721"	"300"	"3"	"0"	"464940"	"0"	"1"	"0"	"0"	"0"
-- Rebel Watchman "332579"	"52404"	"0"	"0"	"0"	"1"	"1"	"38085"	"1"	"-11328.1"	"-228.134"	"75.4132"	"1.55122"	"300"	"3"	"0"	"464940"	"0"	"1"	"0"	"0"	"0"
-- Rebel Watchman "332580"	"52404"	"0"	"0"	"0"	"1"	"1"	"38084"	"1"	"-11344.8"	"-204.856"	"75.5712"	"0.700957"	"300"	"3"	"0"	"464940"	"0"	"1"	"0"	"0"	"0"
-- Rebel Watchman "332581"	"52404"	"0"	"0"	"0"	"1"	"1"	"4660"	"1"	"-11303"	"-210.276"	"76.2735"	"2.44346"	"300"	"3"	"0"	"464940"	"0"	"1"	"0"	"0"	"0"
-- Rebel Watchman "332583"	"52404"	"0"	"0"	"0"	"1"	"1"	"4660"	"1"	"-11331.2"	"-194.431"	"75.4939"	"5.37561"	"300"	"3"	"0"	"464940"	"0"	"1"	"0"	"0"	"0"
-- Rebel Watchman "332586"	"52404"	"0"	"0"	"0"	"1"	"1"	"38082"	"1"	"-11300.7"	"-195.382"	"75.489"	"3.14159"	"300"	"3"	"0"	"464940"	"0"	"1"	"0"	"0"	"0"
-- Rebel Watchman "332587"	"52404"	"0"	"0"	"0"	"1"	"1"	"38082"	"1"	"-11319.8"	"-207.608"	"75.3682"	"2.33874"	"300"	"3"	"0"	"464940"	"0"	"1"	"0"	"0"	"0"
-- Rebel Watchman "332588"	"52404"	"0"	"0"	"0"	"1"	"1"	"38082"	"1"	"-11316.8"	"-183.471"	"75.0458"	"5.13127"	"300"	"3"	"0"	"464940"	"0"	"1"	"0"	"0"	"0"
-- Ragnaros(1)    "332584"	"52410"	"0"	"0"	"0"	"1"	"1"	"2593"	"1"	"-11345"	"-214"	"75.3033"	"4.29542"	"300"	"0"	"0"	"464940"	"0"	"0"	"0"	"0"	"0"
-- James Stillair "332585"	"52753"	"0"	"0"	"0"	"1"	"1"	"3263"	"1"	"-11340.9"	"-218.649"	"75.2965"	"2.28638"	"300"	"0"	"0"	"232470"	"0"	"0"	"0"	"0"	"0"
-- Grifo iracundo  "332577"	"9526"	"0"	"0"	"0"	"1"	"1"	"1149"	"0"	"-11347.1"	"-220.003"	"76.4846"	"4.17543"	"300"	"3"	"0"	"232470"	"0"	"1"	"0"	"0"	"0"
-- Velador rebelde "17251"	"754"	"0"	"0"	"0"	"1"	"1"	"4660"	"0"	"-11382.1"	"-241.007"	"67.6844"	"4.59043"	"90"	"0"	"0"	"2440"	"0"	"0"	"0"	"0"	"0"

DELETE FROM `creature` WHERE `id`=52404 AND `guid` IN (332578,332579,332580,332581,332583,332586,332587,332588); 
DELETE FROM `creature` WHERE `id`=52410 AND `guid`=332584;
DELETE FROM `creature` WHERE `id`=52753 AND `guid`=332585;
DELETE FROM `creature` WHERE `id`=9526 AND `guid`=332577;
DELETE FROM `creature` WHERE `id`=754 AND `guid`=17251;


-- Velador rebelde - ID: 754 - Guid: 69335 NPC Guardia waypoint
SET @GUID := 69335; -- 754
SET @PATH := @GUID * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-11323.9,`position_y`=-213.859,`position_z`=76.5214 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@GUID,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11323.9,-213.859,76.5214,0,0,0,0,100,0),
(@PATH,2,-11329.3,-209.232,75.5794,0,0,0,0,100,0),
(@PATH,3,-11366.6,-212.093,75.2342,0,0,0,0,100,0),
(@PATH,4,-11379.4,-222.883,74.4098,0,0,0,0,100,0),
(@PATH,5,-11388.5,-270.887,59.9001,0,0,0,0,100,0),
(@PATH,6,-11379.4,-222.883,74.4098,0,0,0,0,100,0),
(@PATH,7,-11366.6,-212.093,75.2342,0,0,0,0,100,0),
(@PATH,8,-11329.3,-209.232,75.5794,0,0,0,0,100,0);


-- Osborn Obnoticus - ID: 43884 -- Bien ubicado
-- Emerine Junis - ID:  43885 -- Ubicacion
UPDATE `creature` SET `position_x`=-11299.699219,`position_y`=-210.450653,`position_z`=76.185493,`orientation`=2.848985 WHERE id=43885 AND guid=338201;
-- Berrin Burnquill - ID: 43886 -- Ubicacion
UPDATE `creature` SET `position_x`=-11345.218750,`position_y`=-223.874252,`position_z`=75.772102,`orientation`=3.108171 WHERE id=43886 AND guid=338202;



SELECT * FROM quest_template WHERE id=26738; -- Setear como autoaceptable mientras se tiene 26732 Bad Medicine
SELECT * FROM quest_template WHERE id=26732; -- Bad Medicine
SELECT * FROM quest_template WHERE id=26737; -- Stopping Kurzen's Legacy
SELECT * FROM quest_template WHERE id=26736; -- Spared from Madness
SELECT * FROM quest_template WHERE id=26735; -- The Fate of Kurzen


SELECT * FROM `creature_addon` WHERE guid=20335;
SELECT * FROM waypoint_data WHERE id=@PATH;
SELECT * FROM creature WHERE id=43886;
SELECT * FROM creature_template WHERE entry=43886;

-- Spared from Madness 26736 by Namek
SET @caja=204828;
SET @osborn=43919;
SET @junis=43920;
SET @berrin=43921;
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry` IN (@caja);
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (43919,43920,43921);

-- borrado de cajas extras
DELETE FROM `gameobject` WHERE `id`=@caja AND `guid` !=91;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@caja AND `source_type`=1;
INSERT INTO `smart_scripts` VALUES
(@caja,1,0,0,70,0,100,0,2,0,0,0,85,82214,2,0,0,0,0,7,0,0,0,0,0,0,0,"Jail - Summon Osborn"),
(@caja,1,1,0,70,0,100,0,2,0,0,0,85,82212,2,0,0,0,0,7,0,0,0,0,0,0,0,"Jail - Summon Berrin"),
(@caja,1,2,0,70,0,100,0,2,0,0,0,85,82213,2,0,0,0,0,7,0,0,0,0,0,0,0,"Jail - Summon Junis");


DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@osborn,@junis,@berrin) AND source_type IN (0);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@osborn*100,@junis*100,@berrin*100) AND source_type IN (9);
INSERT INTO `smart_scripts` VALUES
(@osborn,0,0,0,54,0,100,0,0,0,0,0,80,@osborn*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Just Spawned - Start Actionlist"),
(@osborn*100,9,0,0,0,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Actionlist 1 - Set flag"),
(@osborn*100,9,1,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,1,0,0,0,-11571.011719,-572.738586,33.682682,4.773003,"Actionlist 2 - Move to pos"),
(@osborn*100,9,2,0,0,0,100,0,0,0,0,0,33,@osborn,0,0,0,0,0,7,0,0,0,0,0,0,0,"Actionlist 3 - Give credit Osborn"),
(@osborn*100,9,3,0,0,0,100,0,1000,1000,1000,1000,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Actionlist 4 - Set orientation"),
(@osborn*100,9,4,0,0,0,100,0,1000,1000,1000,1000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Actionlist 5 - Say line"),
(@osborn*100,9,5,0,0,0,100,0,9000,9000,9000,9000,41,9000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Actionlist 6 - Despawn"),
-- 
(@junis,0,0,0,54,0,100,0,0,0,0,0,80,@junis*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Just Spawned - Start Actionlist"),
(@junis*100,9,0,0,0,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Actionlist 1 - Set flag"),
(@junis*100,9,1,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,1,0,0,0,-11568.952148,-574.127197,33.682682,3.170789,"Actionlist 2 - Move to pos"),
(@junis*100,9,2,0,0,0,100,0,0,0,0,0,33,@junis,0,0,0,0,0,7,0,0,0,0,0,0,0,"Actionlist 3 - Give credit Junis"),
(@junis*100,9,3,0,0,0,100,0,1000,1000,1000,1000,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Actionlist 4 - Set orientation"),
(@junis*100,9,4,0,0,0,100,0,4000,4000,4000,4000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Actionlist 5 - Say line"),
(@junis*100,9,5,0,0,0,100,0,5000,5000,5000,5000,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Actionlist 6 - Say line"),
(@junis*100,9,6,0,0,0,100,0,6000,6000,6000,6000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Actionlist 7 - Say line"),
(@junis*100,9,7,0,0,0,100,0,3000,3000,3000,3000,11,64195,2,0,0,0,0,1,0,0,0,0,0,0,0,"Actionlist 8 - Cast cosmetic"),
(@junis*100,9,8,0,0,0,100,0,1000,1000,1000,1000,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Actionlist 9 - Despawn"),
--
(@berrin,0,0,0,54,0,100,0,0,0,0,0,80,@berrin*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Just Spawned - Start Actionlist"),
(@berrin*100,9,0,0,0,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Actionlist 1 - Set flag"),
(@berrin*100,9,1,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,1,0,0,0,-11572.919922,-574.227478,33.682682,0.025268,"Actionlist 2 - Move to pos"),
(@berrin*100,9,2,0,0,0,100,0,0,0,0,0,33,@berrin,0,0,0,0,0,7,0,0,0,0,0,0,0,"Actionlist 3 - Give credit Berrin"),
(@berrin*100,9,3,0,0,0,100,0,1000,1000,1000,1000,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Actionlist 4 - Set orientation"),
(@berrin*100,9,4,0,0,0,100,0,2000,2000,2000,2000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Actionlist 5 - Say line"),
(@berrin*100,9,5,0,0,0,100,0,9000,9000,9000,9000,41,8000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Actionlist 6 - Despawn");

DELETE FROM `creature_text` WHERE entry IN (@osborn,@junis,@berrin);
INSERT INTO `creature_text` VALUES
(@osborn,0,0,"Woo hoo.",12,0,100,0,0,0,"Osborn"),
(@berrin,0,0,"Freedom! Sweet, sweet freedom!",12,0,100,4,0,0,"Berrin - Emote"),
(@junis,0,0,"Thank you! I don't know how much longer we would have survived.",12,0,100,0,0,0,"Junis"),
(@junis,1,0,"That cage was stifling my magic.",12,0,100,0,0,0,"Junis"),
(@junis,2,0,"If you don't mind, I'm going to teleport us back to the Rebel Camp. We'll thank you in person later.",12,0,100,0,0,0,"Junis");
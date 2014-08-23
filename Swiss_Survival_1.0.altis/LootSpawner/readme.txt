Hello and welcome to the Lootspawner system!

I'am not great at writing long text so to make it short...
The LS system here at hand evolved from the loot spawn system used in 404's and GOT's older Wasteland versions.
This version however is completly rewriten and evolves around the idea to spawn the loot as near as possible to
the player position and therefore gain speed and reduce lag.

It is compatible with every island/map that uses buildings that have buildingpositions.
It is configurable to a great degree and almost, NOT completly ofcourse, Lag and FPS neutral.

The last part, about Lag and FPS for high player counts, has to be tested as i have only a few friends that play ArmA, 
but here you all can help me! For small playercounts on Altis, with my PC running client and server simultan on an
Phenom X4 965, it is almost unnoticeable even with a bit edited A3Wasteland dev. build i use.

MultiPlayer example maps for Altis and AiA/Chernarus are available at:

http://na-palmplace.net/downloads/LS_example.Altis.pbo and
http://na-palmplace.net/downloads/LS_example.Chernarus.pbo

SinglePlayer example maps for Altis and AiA/Chernarus are available at:

http://na-palmplace.net/downloads/LS_example_SP.Altis.pbo and
http://na-palmplace.net/downloads/LS_example_SP.Chernarus.pbo

HOWTO:
MultiPlayer: create a init.sqf file in your mission folder and paste this code inside:

[CODE]
if (isServer) then {
	fn_getBuildingstospawnLoot = compile preProcessFileLineNumbers "fn_LSgetBuildingstospawnLoot.sqf"; 
	LSdeleter = compile preProcessFileLineNumbers "LSdeleter.sqf";
	execVM "Lootspawner.sqf";
};[/CODE]

SinglePlayer: create a init.sqf file in your mission folder and paste this code inside:

[CODE]
fn_getBuildingstospawnLoot = compile preProcessFileLineNumbers "fn_LSgetBuildingstospawnLoot.sqf"; 
LSdeleter = compile preProcessFileLineNumbers "LSdeleter.sqf";
execVM "Lootspawner_SP.sqf";[/CODE]

to configure the system, open:

1.	'Lootspawner.sqf' to change the available variables as needed.
                       (ex. spawninterval, chance of loot, categories of loot...)

2.	'LSlootLists.sqf' to customize the items inside the categories

3.	'LSlootBuildings.sqf' to change the lootcategory of a building or add/remove buildings



credits go to: Ed! (404Forums) and [GoT] JoSchaap (GoT2DayZ.nl) for the initial spawnsystem for Wasteland

greetings Na_Palm

[URL="http://na-palmplace.net/downloads/LootSpawner.zip"]Lootspawner as ZIP[/URL]
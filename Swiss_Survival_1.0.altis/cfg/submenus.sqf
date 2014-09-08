/* WHEN ADDING A NEW BUILDING
	Define the building class name in the switches
	on the bottom of PlacingBuilding.sqf and BuildBuilding.sqf
	ALSO comment the building from the buildings with loot out
	specified in Lootspawner\LSlootBuildings.sqf
	
	CALLING of PlacingBuilding.sqf
						Building Classname     Startpostion
	_null = ['Land_HelipadCivil_F', getpos player"] execVM 'funct\playerActions\PlacingBuilding.sqf'
*/

nametags_submenu = [
  ["Nametags",true],
  ["Custom"          ,[2],"",-5,[["expression","createDialog 'nametag_custom';"]],"1","1"]
  ["Equipment"       ,[3],"",-5,[["expression","_null = ['Equipment'] execVM 'funct\playerActions\newNametag.sqf'"]],"1","1"],
  ["Pistols"         ,[4],"",-5,[["expression","_null = ['Pistols'] execVM 'funct\playerActions\newNametag.sqf'"]],"1","1"],
  ["Rifles"          ,[5],"",-5,[["expression","_null = ['Rifles'] execVM 'funct\playerActions\newNametag.sqf'"]],"1","1"],
  ["LMG"         		 ,[6],"",-5,[["expression","_null = ['LMG'] execVM 'funct\playerActions\newNametag.sqf'"]],"1","1"],
  ["Sniper"          ,[7],"",-5,[["expression","_null = ['Sniper'] execVM 'funct\playerActions\newNametag.sqf'"]],"1","1"],
  ["Launcher"     	 ,[8],"",-5,[["expression","_null = ['Launcher'] execVM 'funct\playerActions\newNametag.sqf'"]],"1","1"],
  ["Attachments"     ,[9],"",-5,[["expression","_null = ['Attachments'] execVM 'funct\playerActions\newNametag.sqf'"]],"1","1"],
  ["Grenades"        ,[10],"",-5,[["expression","_null = ['Grenades'] execVM 'funct\playerActions\newNametag.sqf'"]],"1","1"],
];  
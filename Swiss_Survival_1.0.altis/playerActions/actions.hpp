class CfgCommunicationMenu
/* WHEN ADDING A BUILDING WITH SPECIAL FUNCTION:
	Define the class name (first argument in call) in the switches
	on the bottom of PlacingBuilding.sqf and BuildDefense.sqf
	
	ALSO comment the building from the buildings with loot out
	specified in Lootspawner\LSlootBuildings.sqf
*/

{
	class establish_base
  {
    text = "Establish Base"; // Text displayed in the menu and in a notification
    submenu = ""; // Submenu opened upon activation
    expression = "_null = ['Land_i_House_Small_03_V1_F', getpos player, 100] execVM 'playerActions\PlacingBuilding.sqf'";
    icon = "\a3\ui_f\data\gui\cfg\hints\Head_ca.paa";
    cursor = ""; // Custom cursor displayed when the item is selected
    enable = "1"; // Simple expression condition for enabling the item
    removeAfterExpressionCall = 1; // 1 to remove the item after calling
  };
  class establish_vehicle_refit
  {
    text = "Establish Vehicle Pad"; // Text displayed in the menu and in a notification
    submenu = ""; // Submenu opened upon activation
    expression = "_null = ['Land_i_Garage_V1_F', getpos player, 100] execVM 'playerActions\PlacingBuilding.sqf'";
    icon = "\a3\ui_f\data\gui\cfg\hints\Head_ca.paa";
    cursor = ""; // Custom cursor displayed when the item is selected
    enable = "1"; // Simple expression condition for enabling the item
    removeAfterExpressionCall = 0; // 1 to remove the item after calling
  };
};
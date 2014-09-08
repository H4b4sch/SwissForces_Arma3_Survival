class CfgCommunicationMenu
/* WHEN ADDING A NEW BUILDING
	Define the building class name in the switches
	on the bottom of PlacingBuilding.sqf and BuildBuilding.sqf
	ALSO comment the building from the buildings with loot out
	specified in Lootspawner\LSlootBuildings.sqf
	
	CALLING of PlacingBuilding.sqf
						Building Classname     Startpostion
	_null = ['Land_HelipadCivil_F', getpos player"] execVM 'funct\playerActions\PlacingBuilding.sqf'
*/
{
	class establish_base
  {
    text = "Establish Base"; // Text displayed in the menu and in a notification
    submenu = ""; // Submenu opened upon activation
    expression = "_null = ['Land_i_House_Small_03_V1_F', getpos player] execVM 'funct\playerActions\PlacingBuilding.sqf'";
    icon = "\a3\ui_f\data\gui\cfg\hints\Head_ca.paa";
    cursor = ""; // Custom cursor displayed when the item is selected
    enable = "1"; // Simple expression condition for enabling the item
    removeAfterExpressionCall = 1; // 1 to remove the item after calling
  };
  class establish_landvehicle_refit
  {
    text = "Establish Land Vehicle Refit"; // Text displayed in the menu and in a notification
    submenu = ""; // Submenu opened upon activation
    expression = "_null = ['Land_i_Garage_V1_F', getpos player] execVM 'funct\playerActions\PlacingBuilding.sqf'";
    icon = "\a3\ui_f\data\gui\cfg\hints\Head_ca.paa";
    cursor = ""; // Custom cursor displayed when the item is selected
    enable = "1"; // Simple expression condition for enabling the item
    removeAfterExpressionCall = 1; // 1 to remove the item after calling
  };
  class establish_airvehicle_refit
  {
    text = "Establish Air Vehicle Refit"; // Text displayed in the menu and in a notification
    submenu = ""; // Submenu opened upon activation
    expression = "_null = ['Land_HelipadCivil_F', getpos player] execVM 'funct\playerActions\PlacingBuilding.sqf'";
    icon = "\a3\ui_f\data\gui\cfg\hints\Head_ca.paa";
    cursor = ""; // Custom cursor displayed when the item is selected
    enable = "1"; // Simple expression condition for enabling the item
    removeAfterExpressionCall = 1; // 1 to remove the item after calling
  };   	
  class nametags
  {
  	text = "Nametags"; // Text displayed in the menu and in a notification
    submenu = "#USER:nametags_submenu"; // Submenu opened upon activation
    expression = "";
    icon = "\a3\ui_f\data\gui\cfg\hints\Head_ca.paa";
    cursor = ""; // Custom cursor displayed when the item is selected
    enable = "1"; // Simple expression condition for enabling the item
    removeAfterExpressionCall = 0; // 1 to remove the item after calling
  };
};
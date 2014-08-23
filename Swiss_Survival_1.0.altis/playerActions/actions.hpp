class CfgCommunicationMenu
{
	class establish_base
  {
    text = "Establish Base"; // Text displayed in the menu and in a notification
    submenu = ""; // Submenu opened upon activation
    expression = "_null = [getpos player] execVM 'playerActions\establishBase.sqf'"; 
    icon = "\a3\ui_f\data\gui\cfg\hints\Head_ca.paa";
    cursor = ""; // Custom cursor displayed when the item is selected
    enable = "1"; // Simple expression condition for enabling the item
    removeAfterExpressionCall = 1; // 1 to remove the item after calling
  };
  class establish_vehicle_refit
  {
    text = "Establish Vehicle Pad"; // Text displayed in the menu and in a notification
    submenu = ""; // Submenu opened upon activation
    expression = "_null = [getpos player] execVM 'playerActions\establishVehicleRefit.sqf'"; 
    icon = "\a3\ui_f\data\gui\cfg\hints\Head_ca.paa";
    cursor = ""; // Custom cursor displayed when the item is selected
    enable = "1"; // Simple expression condition for enabling the item
    removeAfterExpressionCall = 1; // 1 to remove the item after calling
  };
};

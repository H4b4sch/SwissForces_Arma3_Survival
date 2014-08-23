# Information
This is a small script pack to provide logistics functions to a mission. The following features will be provided:

* Dragging of objects
* Storing Objects and Fortifications inside vehicles
* Load Ammo Crates and fortifications onto trucks
* Lift vehicles and Objects with helicopters.

The Package consists out of the BTC Logistics script and the Igiload script, both which are heavily modified to be useful
in this context, and work together.

To Actiate the Script, add the following command to the init.sql file:

```
_logistic = execVM "SAF_Logistics\Logistic_Init.sqf";
0 = execVM "SAF_Logistics\IgiLoad\IgiLoadInit.sqf";
```

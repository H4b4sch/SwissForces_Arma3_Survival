class nametag_custom {
	idd = -1;
	duration = 999999;
	class controlsBackground {
		class background {
			type = CT_STATIC;
			idc = -1;
			style = ST_LEFT;
			colorBackground[] = {.3, .3, .3, 0.8};
			colorText[] = {1, 1, 1, 1};
			font = "puristaLight";
			sizeEx = 0.04;
			x = 1.0;
			y = 0.1;
			w = 0.33;
			h = 0.115;
			text = "";
		};
	};
	class controls {
		class text { 
			idc = 101;
			type = CT_EDIT;
			style = ST_LEFT;
			x = 1.015;
			y = 0.115;
			w = .3;
			h = .04;
			sizeEx = .04;
			font = "puristaLight";
			text = "";
			colorText[] = {1,0.76,0,1};
			colorSelection[] = {0,0,0,0.8};
			colorDisabled[] = {0,0,0,0.8};
			autocomplete = false;
		};
		class submit {
			type = 1; // CT_BUTTON
			style = 2; // ST_CENTER
			idc = -1;
			x = 1.015;
			y = 0.16;
			w = 0.3;
			h = 0.04;
			text = "Submit";
			font = "puristaLight";
			sizeEx = .04;
			colorText[] = {1,0.76,0,1};
			colorBackground[] = {0.25,0.25,0.25,.8};
			colorFocused[] = {0.25,0.25,0.25,.8};
			colorBackgroundActive[] = {0.25,0.25,0.25,.8};
			colorDisabled[] = {.2,.2,.2,1};
			colorBackgroundDisabled[] = {.1,.1,.1,1};
			colorShadow[] = {0,0,0,.3}; // color and offset of drop shadow
			offsetX = .001;
			offsetY = .001;
			offsetPressedX = .001; // offset when pressed
			offsetPressedY = .001;
			borderSize = 0; // no left-hand border
			colorBorder[] = {};
			soundEnter[] = {}; // no sounds
			soundPush[] = {};
			soundClick[] = {};
			soundEscape[] = {};
			action = "closeDialog 0; _null = [ctrlText 101] execVM 'funct\playerActions\newNametag.sqf'"; // action when pressed
			toolTip = ""; // tooltip
		};
	};
};
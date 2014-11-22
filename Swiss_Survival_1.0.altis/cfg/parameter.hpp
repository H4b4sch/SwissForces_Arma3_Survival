class Params {
	class headerAI {
		title = ":: ENEMY SETTINGS ::";
		values[]={0,0};
		texts[]={ "",""};
		default = 0;
	};
	class PAR_AI_SKILL_INFANTRY {
		title = "Infantry Skill";
		values[]={0.1,0.2,0.4,0.6,0.8,1};
		texts[]={"10%","20%","40%","60%","80%","100%"};
		default =0.2;
	};
	class PAR_AI_SKILL_VEHICLES {
		title = "Vehicle Skill";
		values[]={0.1,0.2,0.4,0.6,0.8,1};
		texts[]={"10%","20%","40%","60%","80%","100%"};
		default =0.2;
	};
// Example Parameter
	class headerGeneral {
		title = ":: GENERAL SETTINGS ::";
		values[]={0,0};
		texts[]={ "",""};
		default = 0;
	};
	class PAR_ADVANCED_START {
		title = "Advanced Start";
		values[]={0,1};
		texts[]={"Disabled","Enabled"};
		default =0;
	};
};
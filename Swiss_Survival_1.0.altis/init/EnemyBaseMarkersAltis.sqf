/* Marker [index, type, numHouses, sizeX, sizeY, pos];
   type is used mostly for taking bonuses
   		bigger cities for example give vehicles more often while on houses can be found objects like maps and stuff
      Possibilities:
  			- Wildness
  			- Houses
  			- SmallTown
  			- BigTown
  			- City
  			- Military
  			- Airport
  			
	 numHouses determines the number of house-defending-groups created, varies somewhat around the number
			ISNT actually the number of houses in the zone
*/
arr_enemyBaseMarkers = [];
arr_enemyBaseMarkers set [0  , ["Houses", 1, 50, 50, [3780.6816,21493.488]]];
arr_enemyBaseMarkers set [1  ,   ["Houses", 2, 120, 120, [3097.5269,22023.84]]];
arr_enemyBaseMarkers set [2  ,   ["Houses", 1, 100, 100, [2619.1736,22246.494]]];
arr_enemyBaseMarkers set [3  ,   ["Houses", 1, 40, 40, [4671.9722,22327.797]]];
arr_enemyBaseMarkers set [4  ,   ["Military", 3, 140, 140, [4852.0859,21946.586]]];
arr_enemyBaseMarkers set [5  ,   ["SmallTown", 4, 160, 160, [4580.1997,21444.598]]];
arr_enemyBaseMarkers set [6  ,   ["Houses", 1, 50, 50, [6025.2998,22571.949]]];
arr_enemyBaseMarkers set [7  ,   ["Houses", 1, 100, 100, [6914.4131,22126.115]]];
arr_enemyBaseMarkers set [8  ,   ["Houses", 1, 80, 80, [8206.4521,22540.602]]];
arr_enemyBaseMarkers set [9  ,   ["Houses", 1, 80, 80, [9304.168,23198.512]]];
arr_enemyBaseMarkers set [10 ,   ["Wildness", 0, 50, 50, [9612.9346,23112.305]]];
arr_enemyBaseMarkers set [11 ,  ["Wildness", 3, 100, 100, [9714.4111,22293.855]]];
arr_enemyBaseMarkers set [12 ,  ["Houses", 4, 60, 60, [9236.9941,22174.266]]];
arr_enemyBaseMarkers set [13 ,  ["Houses", 1, 40, 40, [9317.2881,22368.16]]];
arr_enemyBaseMarkers set [14 ,  ["Houses", 2, 100, 100, [10642.41,22161.475]]];
arr_enemyBaseMarkers set [15 ,  ["Houses", 1, 60, 60, [11100.554,22705.271]]];
arr_enemyBaseMarkers set [16 ,  ["Houses", 0, 60, 60, [12204.626,22941.182]]];
arr_enemyBaseMarkers set [17 ,  ["Houses", 1, 60, 60, [12006.091,22722.414]]];
arr_enemyBaseMarkers set [18 ,  ["Houses", 1, 80, 80, [11671.387,21552.076]]];
arr_enemyBaseMarkers set [19 ,  ["Airport", 2, 160, 160, [9171.8701,21538.381]]];
arr_enemyBaseMarkers set [20 ,  ["SmallTown", 3, 160, 160, [9441.8838,20278.67]]];
arr_enemyBaseMarkers set [21 ,  ["Houses", 1, 60, 60, [13921.831,23112.672]]];
arr_enemyBaseMarkers set [22 ,  ["Houses", 0, 80, 80, [13443.916,22641.48]]];
arr_enemyBaseMarkers set [23 ,  ["Wildness", 0, 100, 100, [14492.514,23420.32]]];
arr_enemyBaseMarkers set [24 ,  ["Houses", 1, 80, 80, [15129.847,22622.139]]];
arr_enemyBaseMarkers set [25 ,  ["Houses", 1, 100, 100, [14332.381,21823.963]]];
arr_enemyBaseMarkers set [26 ,  ["Houses", 1, 100, 100, [16810.697,21894.693]]];
arr_enemyBaseMarkers set [27 ,  ["SmallTown", 1, 160, 160, [14621.082,20790.225]]];
arr_enemyBaseMarkers set [28 ,  ["Houses", 1, 100, 100, [16676.082,20527.867]]];
arr_enemyBaseMarkers set [29 ,  ["Houses", 2, 120, 120, [12824.26,19674.438]]];
arr_enemyBaseMarkers set [30 ,  ["City", 20, 350, 350, [14041.669,18639.818]]];
arr_enemyBaseMarkers set [31 ,  ["Houses", 1, 100, 100, [17517.41,18986.816]]];
arr_enemyBaseMarkers set [32 ,  ["SmallTown", 2, 50, 50, [17788.906,18113.535]]];
arr_enemyBaseMarkers set [33 ,  ["Houses", 3, 130, 130, [19254.91,17585.32]]];
arr_enemyBaseMarkers set [34 ,  ["Wildness", 1, 60, 60, [19710.264,18776.365]]];
arr_enemyBaseMarkers set [35 ,  ["Houses", 1, 50, 50, [20059.736,18976.955]]];
arr_enemyBaseMarkers set [36 ,  ["Houses", 2, 80, 80, [20272.76,19237.539]]];
arr_enemyBaseMarkers set [37 ,  ["Houses", 2, 60, 60, [20212.795,19711.406]]];
arr_enemyBaseMarkers set [38 ,  ["Houses", 0, 40, 40, [20072.416,20072.711]]];
arr_enemyBaseMarkers set [39 ,  ["Military", 4, 120, 120, [20951.4,19248.49]]];
arr_enemyBaseMarkers set [40 ,  ["Houses", 1, 60, 60, [21513.695,18367.105]]];
arr_enemyBaseMarkers set [41 ,  ["SmallTown", 2, 100, 100, [23208.113,19962.82]]];
arr_enemyBaseMarkers set [42 ,  ["Houses", 2, 80, 80, [23935.506,20165.822]]];
arr_enemyBaseMarkers set [43 ,  ["Military", 3, 180, 140, [23587.057,21109.385]]];
arr_enemyBaseMarkers set [44 ,  ["City", 8, 300, 300, [25624.529,21324.336]]];
arr_enemyBaseMarkers set [45 ,  ["City", 6, 250, 250, [27002.92,23188.992]]];
arr_enemyBaseMarkers set [46 ,  ["Airport", 1, 180, 160, [26804.006,24594.277]]];
arr_enemyBaseMarkers set [47 ,  ["Wildness", 1, 140, 100, [27007.895,21505.889]]];
arr_enemyBaseMarkers set [48 ,  ["Houses", 2, 80, 80, [27792.445,22241.104]]];
arr_enemyBaseMarkers set [49 ,  ["Wildness", 0, 100, 100, [26048.529,19776.539]]];
arr_enemyBaseMarkers set [50 ,  ["Houses", 2, 80, 80, [25408.225,20336.246]]];
arr_enemyBaseMarkers set [51 ,  ["Airport", 1, 160, 160, [23054.373,18871.779]]];
arr_enemyBaseMarkers set [52 ,  ["Wildness", 1, 80, 80, [23989.805,15471.189]]];
arr_enemyBaseMarkers set [53 ,  ["City", 10, 200, 200, [21368.658,16359.113]]];
arr_enemyBaseMarkers set [54 ,  ["City", 14, 350, 350, [20935.285,16964.666]]];
arr_enemyBaseMarkers set [55 ,  ["Wildness", 0, 300, 300, [21036.449,14732.331]]];
arr_enemyBaseMarkers set [56 ,  ["Houses", 3, 140, 140, [22116.975,15298.2]]];
arr_enemyBaseMarkers set [57 ,  ["Wildness", 0, 180, 180, [22848.395,13663.676]]];
arr_enemyBaseMarkers set [58 ,  ["SmallTown", 1, 160, 160, [19398.191,13242.865]]];
arr_enemyBaseMarkers set [59 ,  ["City", 11, 360, 360, [16832.313,12654.903]]];
arr_enemyBaseMarkers set [60 ,  ["Houses", 2, 160, 160, [15002.58,11118.313]]];
arr_enemyBaseMarkers set [61 ,  ["Wildness", 0, 120, 80, [18777.334,10215.124]]];
arr_enemyBaseMarkers set [62 ,  ["City", 12, 250, 250, [18109.941,15205.013]]];
arr_enemyBaseMarkers set [63 ,  ["Houses", 5, 160, 160, [18313.785,15564.513]]];
arr_enemyBaseMarkers set [64 ,  ["City", 10, 200, 200, [16652.75,16104.21]]];
arr_enemyBaseMarkers set [65 ,  ["Houses", 1, 80, 80, [16869.5,15472.743]]];
arr_enemyBaseMarkers set [66 ,  ["City", 12, 300, 300, [18799.42,16615.91]]];
arr_enemyBaseMarkers set [67 ,  ["Houses", 2, 120, 120, [19445.127,15393.78]]];
arr_enemyBaseMarkers set [68 ,  ["BigTown", 4, 6, 6, [16343.113,17256.924]]];
arr_enemyBaseMarkers set [69 ,  ["Military", 2, 160, 160, [16076.945,16991.584]]];
arr_enemyBaseMarkers set [70 ,  ["Military", 0, 120, 160, [15404.012,16013.882]]];
arr_enemyBaseMarkers set [71 ,  ["SmallTown", 3, 160, 160, [14601.868,16832.48]]];
arr_enemyBaseMarkers set [72 ,  ["Military", 0, 200, 200, [14290.812,16277.501]]];
arr_enemyBaseMarkers set [73 ,  ["Military", 4, 220, 220, [15064.954,17254.449]]];
arr_enemyBaseMarkers set [74 ,  ["BigTown", 6, 180, 180, [14475.963,17655.828]]];
arr_enemyBaseMarkers set [75 ,  ["Wildness", 0, 180, 180, [18514.107,14282.496]]];
arr_enemyBaseMarkers set [76 ,  ["Houses", 1, 80, 80, [18142.379,12874.951]]];
arr_enemyBaseMarkers set [77 ,  ["BigTown", 4, 180, 180, [20234.766,11676.246]]];
arr_enemyBaseMarkers set [78 ,  ["Houses", 1, 120, 120, [21281.395,10513.254]]];
arr_enemyBaseMarkers set [79 ,  ["SmallTown", 5, 200, 150, [20476.139,8868.5957]]];
arr_enemyBaseMarkers set [80 ,  ["SmallTown", 6, 120, 120, [20812.139,6738.9072]]];
arr_enemyBaseMarkers set [81 ,  ["SmallTown", 4, 180, 180, [21692.76,7577.0894]]];
arr_enemyBaseMarkers set [82 ,  ["Wildness", 0, 80, 80, [18376.15,7912.4102]]];
arr_enemyBaseMarkers set [83 ,  ["Houses", 1, 60, 60, [17647.479,10559.289]]];
arr_enemyBaseMarkers set [84 ,  ["Wildness", 0, 40, 40, [18911.615,9061.4189]]];
arr_enemyBaseMarkers set [85 ,  ["BigTown", 6, 180, 180, [12377.887,15663.115]]];
arr_enemyBaseMarkers set [86 ,  ["BigTown", 8, 220, 220, [12926.131,15041.677]]];
arr_enemyBaseMarkers set [87 ,  ["BigTown", 6, 260, 260, [12504.722,14345.65]]];
arr_enemyBaseMarkers set [88 ,  ["SmallTown", 2, 140, 140, [11735.588,13710.727]]];
arr_enemyBaseMarkers set [89 ,  ["SmallTown", 4, 180, 180, [10997.047,13414.832]]];
arr_enemyBaseMarkers set [90 ,  ["BigTown", 2, 180, 180, [10670.918,12272.264]]];
arr_enemyBaseMarkers set [91 ,  ["SmallTown", 10, 280, 280, [9048.041,11991.263]]];
arr_enemyBaseMarkers set [92 ,  ["Houses", 0, 80, 80, [14262.886,13047.169]]];
arr_enemyBaseMarkers set [93 ,  ["Airport", 2, 160, 160, [11600.38,11982.213]]];
arr_enemyBaseMarkers set [94 ,  ["Wildness", 0, 100, 100, [10990.144,12633.834]]];
arr_enemyBaseMarkers set [95 ,  ["SmallTown", 3, 140, 140, [11114.775,14548.692]]];
arr_enemyBaseMarkers set [96 ,  ["SmallTown", 2, 120, 120, [11374.996,14220.787]]];
arr_enemyBaseMarkers set [97 ,  ["Military", 3, 120, 120, [12858.305,16701.072]]];
arr_enemyBaseMarkers set [98 ,  ["Houses", 2, 200, 200, [11747.249,18313.801]]];
arr_enemyBaseMarkers set [99 ,  ["SmallTown", 4, 120, 120, [10332.155,19071.902]]];
arr_enemyBaseMarkers set [100,  ["SmallTown", 6, 140, 140, [8636.7314,18280.309]]];
arr_enemyBaseMarkers set [101, ["Wildness", 0, 60, 60, [7859.3965,18018.404]]];
arr_enemyBaseMarkers set [102, ["Houses", 1, 160, 160, [5901.7437,20223.701]]];
arr_enemyBaseMarkers set [103, ["Houses", 2, 140, 140, [6558.0239,20036.518]]];
arr_enemyBaseMarkers set [104, ["Houses", 1, 80, 80, [5421.2671,17920.605]]];
arr_enemyBaseMarkers set [105, ["Houses", 2, 120, 200, [3950.0981,17299.025]]];
arr_enemyBaseMarkers set [106, ["Houses", 2, 100, 100, [3008.5283,18491.451]]];
arr_enemyBaseMarkers set [107, ["SmallTown", 3, 200, 200, [4938.708,16177.123]]];
arr_enemyBaseMarkers set [108, ["Houses", 1, 200, 120, [6191.3389,16222.314]]];
arr_enemyBaseMarkers set [109, ["SmallTown", 5, 140, 140, [7134.6646,16442.967]]];
arr_enemyBaseMarkers set [110, ["BigTown", 10, 400, 200, [9329.8369,15866.847]]];
arr_enemyBaseMarkers set [111, ["Houses", 5, 160, 160, [10440.089,17247.475]]];
arr_enemyBaseMarkers set [112, ["Wildness", 0, 180, 180, [7891.5024,14630.147]]];
arr_enemyBaseMarkers set [113, ["Houses", 2, 80, 80, [7373.3784,15400.555]]];
arr_enemyBaseMarkers set [114, ["Military", 1, 80, 80, [4561.7793,15398.688]]];
arr_enemyBaseMarkers set [115, ["Houses", 1, 120, 120, [4202.7783,15039.648]]];
arr_enemyBaseMarkers set [116, ["Houses", 2, 120, 120, [5469.2354,14994.4]]];
arr_enemyBaseMarkers set [117, ["BigTown", 10, 260, 260, [3811.7034,13672.732]]];
arr_enemyBaseMarkers set [118, ["City", 24, 320, 440, [3578.1648,13004.541]]];
arr_enemyBaseMarkers set [119, ["Houses", 1, 140, 140, [5239.2324,13596.224]]];
arr_enemyBaseMarkers set [120, ["BigTown", 10, 220, 220, [5095.8013,11243.741]]];
arr_enemyBaseMarkers set [121, ["BigTown", 12, 260, 260, [4107.3999,11676.305]]];
arr_enemyBaseMarkers set [122, ["SmallTown", 3, 160, 160, [3610.8601,10251.85]]];
arr_enemyBaseMarkers set [123, ["Houses", 2, 300, 300, [4752.3228,10393.233]]];
arr_enemyBaseMarkers set [124, ["Houses", 0, 140, 140, [5954.4512,12454.043]]];
arr_enemyBaseMarkers set [125, ["Houses", 1, 120, 120, [7220.8242,11048.657]]];
arr_enemyBaseMarkers set [126, ["Houses", 0, 80, 80, [10786.799,10872.11]]];
arr_enemyBaseMarkers set [127, ["Houses", 2, 60, 60, [10205.201,9687.8262]]];
arr_enemyBaseMarkers set [128, ["Military", 0, 80, 80, [11199.728,8716.0049]]];
arr_enemyBaseMarkers set [129, ["Houses", 1, 80, 80, [11871.471,9462.1709]]];
arr_enemyBaseMarkers set [130, ["Houses", 1, 120, 120, [11537.57,7063.4658]]];
arr_enemyBaseMarkers set [131, ["Houses", 0, 100, 100, [9036.6992,7692.021]]];
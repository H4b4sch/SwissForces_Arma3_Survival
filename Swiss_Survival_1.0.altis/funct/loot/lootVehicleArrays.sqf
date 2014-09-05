// Arrays with vehicle classes to be spawned

// Light Vehicles (Quad and SUVs)
arr_vehLight = ["B_Quadbike_01_F", "B_Truck_01_mover_F", "I_Quadbike_01_F", "C_Quadbike_01_F",
						 "C_Hatchback_01_F", "C_SUV_01_F", "C_Van_01_box_F"];
		
// Vehicles with Cargo (PickUp)
arr_vehLightCargo = ["B_G_Offroad_01_F", "B_G_Van_01_transport_F", "I_G_Offroad_01_F",
									"I_G_Van_01_transport_F", "C_Offroad_01_F", "C_Van_01_transport_F",
									"C_Van_01_box_F"];

// Light armed vehicles (armed Pickup)
arr_vehLightArmed = ["B_G_Offroad_01_armed_F", "I_G_Offroad_01_armed_F"];

// Heavy Vehicles (Hummer unarmed)
arr_vehHeavy = ["B_MRAP_01_F", "I_MRAP_03_F"];

// Heavy Cargo Vehicles (Trucks)
arr_vehHeavyCargo = ["B_Truck_01_transport_F", "B_Truck_01_covered_F", "B_Truck_01_box_F",
									"I_Truck_02_covered_F", "I_Truck_02_transport_F"];
									
// Heavy Vehicles Armed (Armed Vehicles without armor)
arr_vehHeavyArmed = ["I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F", "B_MRAP_01_gmg_F", "B_MRAP_01_hmg_F"];

// Support Vehicles (Medical Truck)
arr_vehSupport = ["B_Truck_01_Repair_F", "B_Truck_01_ammo_F", "B_Truck_01_fuel_F", "B_Truck_01_medical_F",
							 "I_Truck_02_ammo_F", "I_Truck_02_box_F", "I_Truck_02_medical_F", "I_Truck_02_fuel_F",
							 "C_Van_01_fuel_F"];

// Light Armor (Marid, APC's)
arr_armorLight = ["B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_CRV_F", "B_APC_Wheeled_01_cannon_F",
							"I_APC_Wheeled_03_cannon_F"];
						
// Heavy Armor (Tanks & AA)	
arr_armorHeavy = ["B_APC_Tracked_01_AA_F", "B_MBT_01_cannon_F", "B_MBT_01_TUSK_F", "I_APC_tracked_03_cannon_F",
							 "I_MBT_03_cannon_F"];

// Artillery
arr_artillery = ["B_MBT_01_arty_F", "B_MBT_01_mlrs_F"];

// Light Helis (Hummingbird)
arr_heliLight = ["B_Heli_Light_01_F", "I_Heli_light_03_unarmed_F"];

// Light armed helis (Pawnee)
arr_heliLightArmed = ["I_Heli_light_03_F", "B_Heli_Light_01_armed_F"];

// Attack Helicopters
arr_heliAttack = ["B_Heli_Attack_01_F", "B_Heli_Transport_01_F"];

// cargo Helicopters (only the mohawk)
arr_heliCargo = ["I_Heli_Transport_02_F"];

// Planes
arr_planesAttack = ["I_Plane_Fighter_03_CAS_F", "I_Plane_Fighter_03_AA_F", "B_Plane_CAS_01_F"];

// Unarmed Ground Drones
arr_dronesGround = ["B_UGV_01_F", "I_UGV_01_F"];

// Armed Ground Drones
arr_dronesGroundArmed = ["I_UGV_01_rcws_F", "B_UGV_01_rcws_F"];

// Unarmed Air Drones
arr_dronesAir = ["B_UAV_01_F"];

// Armed Air Drones
arr_dronesAirArmed = ["B_UAV_02_F", "B_UAV_02_CAS_F"];

// Create Array with all of those inside
arr_spawnVehicle = [arr_vehLight, arr_vehLightCargo, arr_vehLightArmed, arr_vehHeavy, arr_vehHeavyCargo, arr_vehHeavyArmed,
										arr_vehSupport, arr_armorLight, arr_armorHeavy, arr_artillery,
										arr_heliLight, arr_heliLightArmed, arr_heliAttack, arr_heliCargo,
									  arr_planesAttack, arr_dronesGround, arr_dronesGroundArmed, arr_dronesAir, arr_dronesAirArmed];
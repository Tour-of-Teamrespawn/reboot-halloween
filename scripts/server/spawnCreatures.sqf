/**
	the tour certified zombie spawner pro edition mk2022

	Usage:
	1. place this script in "scripts\fnc_spawnCreatures.sqf";

	2. add to your init.sqf:
	call compile preprocessFileLineNumbers "scripts\fnc_spawnCreatures.sqf";

	3. place a trigger that will cause creatures to spawn when activated (set size, presence conditions etc.)
	
	4. place game logics (or any other objects) where creatures should spawn
	
	5. synchronize the game logics to the trigger (one game logic can be synced to multiple triggers if need be)

	6. place in the trigger activation field:
	[thisTrigger] call fnc_spawnCreatures;

	----
	optional steps below
	----

	7. (optional) customize how many and what kind of creatures can spawn:
	[thisTrigger, 10 + round random 2, ["dev_asymhuman_stage2_o", "dev_asymhuman_o", "dev_parasite_o"]] call fnc_spawnCreatures;
	this will spawn 10-12 creatures, their types will be randomly selected from the provided three

	8. (optional) customize loadouts:

	8.1. go to editor and give player the desired loadout

	8.2. start the game and run the line below in debug console to copy the loadout to clipboard:
	copyToClipboard str getUnitLoadout player;

	8.3. open your init.sqf, paste the loadout and assign it to a variable, you can do it multiple times, example:
	myLoadout1 = [["arifle_MX_ACO_pointer_F","", (...) "ItemWatch","NVGoggles"];
	myLoadout2 = [["arifle_MX_ACO_pointer_F","", (...) "ItemWatch",""];
	dont forget the ; at the end

	8.4. in the trigger activation you can now customize the loadouts:
	[thisTrigger, 5, ["dev_o_zombie_casual_i"], [myLoadout1, myLoadout2]] call fnc_spawnCreatures;
	this will spawn 5 zombies, each of them will have myLoadout1 or myLoadout2 selected randomly

	8.5. (alternative) you can copy default loadout from any unit by specifying its classname:
	[thisTrigger, 5, ["dev_o_zombie_casual_i"], ["B_Soldier_F"]] call fnc_spawnCreatures;
	this will spawn 5 zombies dressed like blufor rifleman
*/

fnc_spawnCreatures = {
	if (!isServer) exitWith {
		// only server can spawn creatures
	};

	_this spawn {
		params [
			"_trigger",
			[
				"_creatureCount",  // default value below
				round random [2, 5, 10]
			],
			[
				"_creatureTypes",  // default value below
				[
					"dev_o_zombie_p_beggar_F_euro",
					"dev_o_zombie_casual_i",
					"dev_o_zombie_casual_5_v2_F_afro",
					"dev_o_zombie_smart_casual_2_F_tanoan",
					"dev_o_zombie_sport_1_F_euro",
					"dev_o_zombie_polo_2_F_afro",
					"dev_o_zombie_ConstructionWorker_01_Blue_F",
					"dev_o_zombie_engineer_i",
					"dev_o_zombie_p_fugitive_F_euro",
					"dev_o_zombie_Journalist_01_War_F",
					"dev_o_zombie_scientist_i",
					"dev_o_zombie_scientist2_i",
					"dev_o_zombie_scientist3_i"
				]
			],
			"_loadouts",
			["_giveWaypoint", false]
		];

		private _spawnPoints = synchronizedObjects _trigger;

		for "_i" from 1 to _creatureCount do {
			private _spawnPoint = selectRandom _spawnPoints;
			private _group = [
				getPos _spawnPoint,
				east,
				[selectRandom _creatureTypes]
			] call BIS_fnc_spawnGroup;

			if (!isNil "_loadouts") then {
				(leader _group) setUnitLoadout selectRandom _loadouts;
			};

			(leader _group) setPosASL getPosASL _spawnPoint;

			if (_giveWaypoint) then {
				(leader _group) doMove getPos _trigger;
			};

			sleep 0.25;  // sleep to be gentle to the server
		};
	};
};

call compile preprocessFileLineNumbers "scripts\server\loadouts.sqf";

waitUntil {
	sleep 1;
	!isNil "Foley_rebootDone"
};

private _spawnPoints = (entities "Logic") select {_x getVariable ["Foley_spawnPoint", false]};

sleep 2;

private _waves = [
	[
		[
			"dev_parasite_o",
			"dev_parasite_o",
			"dev_asymhuman_stage2_o",
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
			"dev_o_zombie_scientist3_i",
			"dev_module_sfx_zombies"
		],
		3,
		180
	],
	[
		[
			"dev_asymhuman_stage2_o",
			"dev_parasite_o",
			"dev_toxmut_o",
			"dev_form939_o",
			"dev_asymhuman_o",
			"dev_parasite_o",
			"dev_parasite_o",
			"dev_parasite_o",
			"dev_o_zombie_scientist_i",
			"dev_o_zombie_scientist2_i",
			"dev_o_zombie_scientist3_i",
			"dev_o_zombie_sport_1_F_euro",
			"dev_o_zombie_polo_2_F_afro",
			"dev_o_zombie_ConstructionWorker_01_Blue_F",
			"dev_o_zombie_engineer_i"
		],
		1,
		180
	],
	[
		[
			"dev_asymhuman_stage2_o",
			"dev_parasite_o",
			"dev_toxmut_o",
			"dev_asymhuman_o",
			"dev_parasite_o",
			"dev_parasite_o",
			"dev_parasite_o",
			"dev_parasite_o",
			"dev_parasite_o",
			"dev_form939_o"
		],
		4,
		300
	],
	[
		[
			"dev_asymhuman_stage2_o",
			"dev_asymhuman_stage2_o",
			"dev_toxmut_o",
			"dev_toxmut_o",
			"dev_asymhuman_o",
			"dev_asymhuman_o",
			"dev_parasite_o",
			"dev_parasite_o",
			"dev_parasite_o",
			"dev_parasite_o",
			"dev_o_zombie_scientist_i",
			"dev_o_zombie_scientist2_i",
			"dev_o_zombie_scientist3_i",
			"dev_o_zombie_sport_1_F_euro",
			"dev_o_zombie_polo_2_F_afro",
			"dev_o_zombie_ConstructionWorker_01_Blue_F",
			"dev_o_zombie_engineer_i"
		],
		4,
		60
	]
];

{
	_x params ["_units", "_groupCount", "_duration"];

	private _targets = allPlayers select {alive _x && _x inArea "radar_marker"};

	for "_i" from 1 to _groupCount do {
		{
			private _group = [
				getPos selectRandom _spawnPoints,
				east,
				[_x]
			] call BIS_fnc_spawnGroup;

			if ("zombie" in toLower typeOf (leader _group)) then {
				(leader _group) setUnitLoadout selectRandom Foley_loadouts;
			};

			if (count _targets > 0) then {
				(leader _group) doMove getPosATL selectRandom _targets;
			};

			sleep 0.1;
		} forEach _units;

		sleep 5;
	};

	sleep _duration;
} forEach _waves;

Foley_wavesDone = true;

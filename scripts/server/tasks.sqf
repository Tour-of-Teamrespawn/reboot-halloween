if (!isServer) exitWith {};

[
	blufor,
	"reboot",
	[
		"Go to the <marker name='radar_marker'>radar station</marker> and reboot the system.",
		"Reboot the system"
	],
	objNull,
	"ASSIGNED",
	10,
	false,
	"interact"
] call BIS_fnc_taskCreate;


[] spawn {
	sleep 10;

	waitUntil {
		sleep 1;

		!isNil "Foley_rebootFailed"
	};

	sleep 6;

	["reboot", "FAILED", true] call BIS_fnc_taskSetState;
	
	waitUntil {
		sleep 1;

		!isNil "Foley_rebootDone"
	};

	sleep 5;
	
	[
		blufor,
		"defend",
		[
			"Clear the perimeter of the radar station from the infected while you wait for tech support.",
			"Clear the perimeter"
		],
		objNull,
		"ASSIGNED",
		20,
		true,
		"attack"
	] call BIS_fnc_taskCreate;

	waitUntil {
		!isNil "Foley_wavesDone"
	};

	sleep 30;

	waitUntil {
		sleep 1;

		{
			alive _x && 
			faction _x == "dev_mutants" && 
			(getPos _x) distance (getMarkerPos "radar_marker") < 300
		} count allUnits <= 3;
	};

	["defend", "SUCCEEDED", true] call BIS_fnc_taskSetState;
};

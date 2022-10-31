if (!isServer) exitWith {};

sleep 10;

waitUntil {
	sleep 1;

	time > 0 && ({alive _x && side _x == blufor} count allPlayers) > 0
};

waitUntil {
	sleep 1;

	({alive _x && side _x == blufor} count allPlayers) == 0 || "defend" call BIS_fnc_taskState == "SUCCEEDED"
};

if ("defend" call BIS_fnc_taskState == "SUCCEEDED") exitWith {
	sleep 5;
	"VictoryEnding" call BIS_fnc_endMissionServer;
};

sleep 5;
"loser" call BIS_fnc_endMissionServer;

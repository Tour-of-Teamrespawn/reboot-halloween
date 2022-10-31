call compile preprocessFileLineNumbers "scripts\common\params.sqf";

if (isServer) then {
	call compile preprocessFileLineNumbers "scripts\server\tasks.sqf";
	call compile preprocessFileLineNumbers "scripts\server\spawnCreatures.sqf";
	execVM "scripts\server\ai.sqf";
	execVM "scripts\server\reboot.sqf";
	execVM "scripts\server\time.sqf";
	execVM "scripts\server\endings.sqf";
	[Foley_lada] call compile preprocessFileLineNumbers "scripts\server\lada.sqf";
};

if (hasInterface) then {
	waitUntil {
		!isNull player
	};

	player addRating 100000;
	doStop player;

	call compile preprocessFileLineNumbers "scripts\player\briefing.sqf";
	execVM "scripts\player\radioSilence.sqf";
	execVM "scripts\player\rebootInteract.sqf";
	[Foley_skullLightLocation] call compile preprocessFileLineNumbers "scripts\server\skull.sqf";
};

[TOUR_respawnTickets, TOUR_respawnTime] execVM "scripts\TOUR_RC\init.sqf";

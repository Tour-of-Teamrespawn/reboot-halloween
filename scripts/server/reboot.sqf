if (!isServer) exitWith {};

waitUntil {
	sleep 1;

	!isNil "Foley_rebootStarted"
};

Foley_currentTexture = "";
Foley_activeScreens = [];
Foley_fnc_activateScreen = {
	params ["_screen"];

	playSound3D [
		getMissionPath "assets\error.ogg",
		_screen,
		true,
		getPosASL _screen,
		3,
		1,
		100
	];
	sleep 0.1;
	_screen setObjectTextureGlobal [0, Foley_currentTexture];
	Foley_activeScreens pushBackUnique _screen;
};

[] spawn {
	private _textures = [
		"1.paa",
		"2.paa",
		"3.paa",
		"4.paa",
		"5.paa",
		"6.paa",
		"7.paa",
		"8.paa",
		"9.paa",
		"10.paa",
		"11.paa",
		"12.paa",
		"13.paa",
		"14.paa",
		"15.paa",
		"17.paa"
	];
	_textures = _textures call BIS_fnc_arrayShuffle;
	_textures = ["16.paa"] + _textures;
	private _i = 0;

	while {true} do {
		private _texture = _textures select (_i % count _textures);
		Foley_currentTexture = (getMissionPath "assets\") + _texture;

		{
			_x setObjectTextureGlobal [0, Foley_currentTexture];
		} forEach Foley_activeScreens;

		Foley_radar animateSource ["radar_rotation", selectRandom [-10000, 10000], selectRandom [0.1, 0.5, 1, 2, 5]];

		sleep random [1, 3, 5];
		_i = _i + 1;
	};
};

Foley_rebootStarted = true;
publicVariable "Foley_rebootStarted";

private _t = time;

playSound3D [
	getMissionPath "assets\cachemonet1.ogg",
	Foley_computer,
	true,
	getPosASL Foley_computer,
	5,
	1,
	150
];

[Foley_computer] call Foley_fnc_activateScreen;

waitUntil {
	time >= _t + 12.04;
};

Foley_rebootFailed = true;

_t = time;
playSound3D [
	getMissionPath "assets\cachemonet2.ogg",
	Foley_computer,
	true,
	getPosASL Foley_computer,
	7,
	1,
	300
];

[] spawn {
	private _screens = entities [
		[
			"Land_Laptop_02_unfolded_F",
			"Land_MapBoard_01_Wall_F",
			"Land_PCSet_01_screen_F"
		],
		nil,
		nil,
		nil
	];

	{
		[_x] call Foley_fnc_activateScreen;
		Foley_activeScreens pushBackUnique _x;
		sleep random [0.1, 0.2, 0.5];
	} forEach _screens;
};

waitUntil {
	time >= _t + 29.56;
};

Foley_rebootDone = true;

private _speakers = ((getPos Foley_computer) nearObjects ["Loudspeakers_EP1", 100]);

{
	playSound3D [
		getMissionPath "assets\cachemonet3.ogg",
		_x,
		false,
		getPosASL _x,
		20,
		1,
		400
	];
} forEach _speakers;

sleep (180 - 8.5);

{
	playSound3D [
		getMissionPath "assets\stop-running1.ogg",
		_x,
		false,
		getPosASL _x,
		20,
		1,
		400
	];
} forEach _speakers;

sleep 180;

{
	playSound3D [
		getMissionPath "assets\stop-running2.ogg",
		_x,
		false,
		getPosASL _x,
		20,
		1,
		400
	];
} forEach _speakers;

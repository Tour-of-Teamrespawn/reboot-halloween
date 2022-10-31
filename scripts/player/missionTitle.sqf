sleep 3;
private _startPos = getPos player;

waitUntil {
	sleep 1;

	player distance _startPos > 400
};

private _text = "<t font='PuristaBold' size='1.6'>30 [Tour] Reboot</t><br />by Foley";
[parseText _text, true, nil, 6, 0.6, 0] spawn BIS_fnc_textTiles;

waitUntil {
	{_x inArea "radar_marker"} count allPlayers > 0
};

setTimeMultiplier 15;

waitUntil {
	dayTime >= 18.0
};

setTimeMultiplier 1;

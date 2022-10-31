while {isNil "Foley_rebootStarted"} do {
	waitUntil {
		sleep 0.1;

		player distance Foley_computer < 5
	};

	if (leader group player == player) then {
		hintSilent "Sit down in front of the computer to interact";
	};

	if (!isNil { player getVariable "ace_sitting_sittingStatus" }) then {
		if (player distance Foley_computer < 3) then {
			Foley_rebootStarted = true;
			publicVariable "Foley_rebootStarted";
		} else {
			hintSilent "Sit closer to the computer";
		};
	};
};

hintSilent "";

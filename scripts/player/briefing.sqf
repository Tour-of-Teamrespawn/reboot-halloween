player createDiaryRecord [
	"Diary", 
	[
		"About",
		"<font size=16>30 [Tour] Reboot</font><br />
by Foley<br />
<br />
<font face='RobotoCondensedLight'>Reboot a blue-screened computer</font><br />
<br />
<font size=12>Version: <font face='RobotoCondensedBold'>v0.4</font><br />
Discord: <font face='RobotoCondensedBold'>Foley#1330</font></font>"
	]
];

player createDiaryRecord [
	"Diary",
	[
		"Assets",
		"<font size=16>Units:</font><br />
<img image='ca\ui\data\markers\b_hq2.paa' height='20' valign='middle' /> <font size=15 valign='middle'>Command</font><br />
<img image='ca\ui\data\markers\b_inf.paa' height='20' valign='middle' /> <font size=15 valign='middle'>Alpha</font> - Infantry Squad<br />
<img image='ca\ui\data\markers\b_inf.paa' height='20' valign='middle' /> <font size=15 valign='middle'>Bravo</font> - Infantry Squad<br />
<img image='ca\ui\data\markers\b_inf.paa' height='20' valign='middle' /> <font size=15 valign='middle'>Charlie</font> - Infantry Squad<br />
<img image='ca\ui\data\markers\b_inf.paa' height='20' valign='middle' /> <font size=15 valign='middle'>Delta</font> - Special Operations Team<br />
<br />
<font size=16>Vehicles:</font><br />
4x UAZ<br />
2x GAZ-66"
	]
];

if (player getVariable ["Foley_secretBriefing", false]) then {
	player createDiaryRecord [
		"Diary",
		[
			"Secret briefing",
			"<font face='RobotoCondensedBold'>Secret briefing for the commander</font><br />
<br />
There is a surprise on the way to Krasnostav.<br />
For best effect, follow the obvious road out of the airbase to Krasnostav.<br />
<br />
Anyone can reboot the blue-screened computer by taking the seat in front of it (ACE interact).<br />
For best effect, refrain from interacting with it immediately after reaching the radar station - take your time to regroup."
		]
	];
};

player createDiaryRecord [
	"Diary",
	[
		"Briefing",
		"<marker name='base_marker'>Krasnostav airbase</marker>, 2002<br />
<br />
Chernorussian Defence Force maintains presence in the region despite hordes of the infected roaming around the countryside.<br />
<br />
A nearby radar has shut down unexpectedly. Our technicians say it's most likely due to a routine software crash.<br />
<br />
<font face='RobotoCondensedBold'>Go to the radar station and reboot the system.</font><br />
Once you secure the area, find the blue-screened computer and try turning it off and on again. If you spot anything unusual, call the tech support for further instructions.<br />
<br />
The <marker name='radar_marker'>radar station</marker> is located on the Klen peak and ought to be watched by a police patrol stationed at the nearby <marker name='checkpoint_marker'>checkpoint</marker>. Check in with them before proceeding to the station."
	]
];

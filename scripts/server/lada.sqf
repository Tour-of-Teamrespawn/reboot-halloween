params ["_lada"];

_lada setPilotLight true;
_lada animateSource ["Beacon", 1];

private _hitPointNames = ["hitbeacon","hitbody","hitengine","hitfuel","hitglass1","hitglass2","hitglass3","hitglass4","hitglass5","hitglass6","hitlfwheel","hitlf2wheel","hitrfwheel","hitrf2wheel","hitrglass","hitlglass","hitlbwheel","hitlmwheel","hitrbwheel","hitrmwheel","hithull","#light_l1","#light_l2","#light_r1","#light_r2","#beacon","#beacon"],["beacon","karoserie","motor","palivo","glass1","glass2","glass3","glass4","glass5","glass6","wheel_1_1_steering","wheel_1_2_steering","wheel_2_1_steering","wheel_2_2_steering","","","","","","","palivo","light_l1","light_l2","light_r1","light_r2","beacon","beacon"];

private _hitPointDamages = [0.50051,0.610506,0.787178,0.453405,0.465824,0.453405,1,0.453405,0.56326,0.453405,1,0.453405,0.453405,0.453405,0.453405,0.453405,0.453405,0.453405,0.453405,0.453405,0.453405,1,1,0,0,1,0];

{
	_lada setHitPointDamage [_x, _hitPointDamages select _forEachIndex];
} forEach _hitPointNames;

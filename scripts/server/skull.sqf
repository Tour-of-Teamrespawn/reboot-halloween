params ["_locationObject"];

Foley_skullLight = "#lightpoint" createVehicleLocal getPos _locationObject;
Foley_skullLight setPosASL getPosASL _locationObject;
Foley_skullLight setLightAmbient [1.0, 0.1, 0.1];
Foley_skullLight setLightColor [1.0, 0.1, 0.1];
Foley_skullLight setLightIntensity 6000;
Foley_skullLight setLightAttenuation [0.1, 1, 10, 2, 2, 4];
Foley_skullLight setLightDayLight true;
Foley_skullLight setLightUseFlare true;
Foley_skullLight setLightFlareSize 0.4;

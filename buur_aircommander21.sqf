if (roleDescription player in _aircommanders) then
 {
findDisplay 12 displayCtrl 51 ctrlAddEventHandler
[
  "Draw",
    "
      {
        _x0 = _x select 0;
        _x1 = _x select 1;

        if (_x1 > 0) then
        {
         if (side _x0 == side player) then
         {
           _this select 0 drawIcon
           [
             getText (configFile/'CfgVehicles'/typeOf _x0/'Icon'),
             [ side _x0, false ] call BIS_fnc_sideColor,
             getpos _x0,
             24,
             24,
             getDir _x0,
             roleDescription (driver _x0),
             1,
             0.04,
             'TahomaB',
             'right'
             ];
         } else
        {
          _this select 0 drawIcon
          [
            getText (configFile/'CfgVehicles'/typeOf _x0/'Icon'),
            [ side _x0, false ] call BIS_fnc_sideColor,
            getpos _x0,
            24,
            24,
            getDir _x0,
            gettext (configfile >> 'CfgVehicles' >> typeof _x0 >> 'displayName') + ' RadarOn' + ' ' + str (isVehicleRadarOn  _x0),
            1,
            0.04,
            'TahomaB',
            'right'
            ];
        };
        if (_x0 isKindOf 'Air') then
          {_this select 0 drawIcon
          [
            '#(argb,8,8,3)color(0,0,0,0)',
            [ side _x0, false ] call BIS_fnc_sideColor,
            getpos _x0,
            24,
            24,
            getDir _x0,
            'H:' + str (ceil (getPosASLvisual _x0 select 2)) + ' S:' + str (ceil (speed _x0)),
            1,
            0.04,
            'TahomaB',
            'left'
            ];
        };
      };
    }forEach (listRemoteTargets (side player));
  "
];
};

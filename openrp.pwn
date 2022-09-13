//
//  ...   ... ...    ....  .. ...   ... ..  ... ...
//.|  '|.  ||'  || .|...||  ||  ||   ||' ''  ||'  ||
//||   ||  ||    | ||       ||  ||   ||      ||    |
// '|..|'  ||...'   '|...' .||. ||. .||.     ||...'
//         ||                                ||
//        ''''                              ''''
//               BUILD: 1.00.1-B0.1-ALPHA

#include <a_samp>

main()
{
	print("Creator: Leviaria");
}

public OnGameModeInit()
{
	SetGameModeText("openrp");
	AddPlayerClass(127, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

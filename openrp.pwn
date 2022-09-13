//
//  ...   ... ...    ....  .. ...   ... ..  ... ...
//.|  '|.  ||'  || .|...||  ||  ||   ||' ''  ||'  ||
//||   ||  ||    | ||       ||  ||   ||      ||    |
// '|..|'  ||...'   '|...' .||. ||. .||.     ||...'
//         ||                                ||
//        ''''                              ''''
//               BUILD: 1.00.1-B0.1-ALPHA

#include <a_samp> /* samp-stdlib */
#include <a_mysql> /* MySQL plugin for SA:MP. */

// YSI Implementation v5.06.1932

#define YSI_NO_OPTIMISATION_MESSAGE /* Don't display the message about startup optimisation */
#define YSI_NO_CACHE_MESSAGE /* Don't display the message about caching the code */
#define YSI_NO_MODE_CACHE /* Disable the cache entirely */
#define YSI_NO_HEAP_MALLOC /* In almost all cases of issues, the solution is to define YSI_NO_HEAP_MALLOC */
#define YSI_NO_VERSION_CHECK /* Don't check if this is the latest version of YSI. */

/*
This include allows you to quickly and easily define timer functions, that is functions which are to be called after a given time.
The library provides two systems: tasks, which are functions that run all the time in the background (for example streamers); and timers,
which are functions you can start, stop, and call on a delay at will.
*/

#include <YSI_CODING\y_timers>

/*
MAX_PLAYERS is a value which defines the number of players that can join the server. It is separate from the 'maxplayers' server variable.
By default, in a_samp.inc, this value is 500 (or 800/1000 depending on the server package).
If one is only running a server with maxplayers set to 100, MAX_PLAYERS will still be 500 - 400 more than you need.
To fix this, simply re-define MAX_PLAYERS directly under the inclusion of a_samp:
*/

#undef MAX_PLAYERS
const MAX_PLAYERS = 200;

#define func:%0(%1) forward%0(%1); public%0(%1)

/*
Setup the Parameters to connect to a MySQL server and database using a defines where all connection credentials and options are specified.
*/

#define MYSQL_Host "localhost"
#define MYSQL_User "root"
#define MYSQL_PW "demo"
#define MYSQL_DB "demo"

new MySQL:SQL, yQuery[500], yString[500];

/*
The next part has two sides of a function call. main() is a function which you write the code for and is called from elsewhere,
print(string[]) is a function with the code elsewhere which you call.
Currently all this will do is load, print a string (i.e. print "Hello World!" (without the ""s) (a tradition in all scripting languages)) to the server console and end.
*/

main()
{

}

func: OnGameModeInit() { /* This callback is triggered when the gamemode starts. */

	/* Connects to the Database */

	SQL = mysql_connect(MYSQL_Host, MYSQL_User, MYSQL_PW, MYSQL_DB);

	if (mysql_errno() != 0) {
		print("* [MYSQL] It is not possible to connect to the database.");
		return 0;
	}
	else print("* [MYSQL] The connection to the database is successful. ");

	SetGameModeText("openrp"); /* Set the name of the game mode, which appears in the server browser. */

	return 1;
}

public OnGameModeExit() /* This callback is called when a gamemode ends, either through 'gmx', the server being shut down, or GameModeExit. */
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid) /* This callback is called when a player changes class at class selection (and when class selection first appears). */
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746); /* Set a player's position. */
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746); /* Sets the camera to a specific position for a player. */
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746); /* Set the direction a player's camera looks at. Generally meant to be used in combination with SetPlayerCameraPos. */
	return 1;
}
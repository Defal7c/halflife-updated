/*
Ricobot (C) Copyright 2004, Wei Mingzhi
All rights reserved.

Redistribution and use in source and binary forms with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3. Neither the name of this project nor the names of its contributors may be
used to endorse or promote products derived from this software without
specific prior written permission.

THIS SOFTWARE IS PROVIDED BY WEI MINGZHI "AS IS" AND ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
EVENT SHALL THE CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

//
// Ricobot - a bot example for Valve Software's Ricochet MOD
//
// dll.cpp
//

#include "bot.h"

char welcome_msg[] = "Welcome to Ricobot by Wei Mingzhi\n"
                     "Visit http://yapb.mapzap.org\n"
                     "Compile date: " __DATE__ "\n";

DLL_FUNCTIONS other_gFunctionTable;
DLL_GLOBAL const Vector g_vecZero = Vector(0,0,0);

int default_bot_skill = 2;
float bot_check_time = 30.0;
int min_bots = -1;
int max_bots = -1;
int num_bots = 0;
int prev_num_bots = 0;
bool g_GameRules = FALSE;
edict_t *listenserver_edict = NULL;
float welcome_time = 0.0;
bool welcome_sent = FALSE;

FILE *bot_cfg_fp = NULL;
bool need_to_open_cfg = TRUE;
float bot_cfg_pause_time = 0.0;
float respawn_time = 0.0;
bool spawn_time_reset = FALSE;

char bot_whine[MAX_BOT_WHINE][81];
int whine_count;
int recent_bot_whine[5];

void BotNameInit(void);
void ProcessBotCfgFile(void);

void ServerCommand(void)
{
   if (strcmp(CMD_ARGV(1), "addbot") == 0)
   {
      BotCreate( NULL, CMD_ARGV(2), CMD_ARGV(3) );
      bot_check_time = gpGlobals->time + 5.0;
   }
   else if (strcmp(CMD_ARGV(1), "min_bots") == 0)
   {
      min_bots = atoi( CMD_ARGV(2) );

      if ((min_bots < 0) || (min_bots > 31))
         min_bots = 1;

      printf("min_bots set to %d\n", min_bots);
   }
   else if (strcmp(CMD_ARGV(1), "max_bots") == 0)
   {
      max_bots = atoi( CMD_ARGV(2) );

      if ((max_bots < 0) || (max_bots > 31))
         max_bots = 1;

      printf("max_bots set to %d\n", max_bots);
   }
}

void GameDLLInit( void )
{
   char filename[256];
   char buffer[256];
   int i, length;
   FILE *bfp;
   char *ptr;

   // Register server command
   (*g_engfuncs.pfnAddServerCommand)("bot", ServerCommand);

   whine_count = 0;

   // initialize the bots array of structures...
   memset(bots, 0, sizeof(bots));

   for (i=0; i < 5; i++)
      recent_bot_whine[i] = -1;

   BotNameInit();

   UTIL_BuildFileName(filename, "bot_whine.txt", NULL);

   bfp = fopen(filename, "r");

   if (bfp != NULL)
   {
      while ((whine_count < MAX_BOT_WHINE) &&
             (fgets(buffer, 80, bfp) != NULL))
      {
         length = strlen(buffer);

         if (buffer[length-1] == '\n')
         {
            buffer[length-1] = 0;  // remove '\n'
            length--;
         }

         if ((ptr = strstr(buffer, "%n")) != NULL)
         {
            *(ptr+1) = 's';  // change %n to %s
         }

         if (length > 0)
         {
            strcpy(bot_whine[whine_count], buffer);
            whine_count++;
         }
      }

      fclose(bfp);
   }

   (*other_gFunctionTable.pfnGameInit)();
}

int DispatchSpawn( edict_t *pent )
{
   if (gpGlobals->deathmatch)
   {
      char *pClassname = (char *)STRING(pent->v.classname);

      if (strcmp(pClassname, "worldspawn") == 0)
      {
         g_GameRules = TRUE;

         bot_cfg_pause_time = 0.0;
         respawn_time = 0.0;
         spawn_time_reset = FALSE;

         prev_num_bots = num_bots;
         num_bots = 0;

         bot_check_time = gpGlobals->time + 30.0;
      }
   }

   return (*other_gFunctionTable.pfnSpawn)(pent);
}

void DispatchThink( edict_t *pent )
{
   (*other_gFunctionTable.pfnThink)(pent);
}

void DispatchUse( edict_t *pentUsed, edict_t *pentOther )
{
   (*other_gFunctionTable.pfnUse)(pentUsed, pentOther);
}

void DispatchTouch( edict_t *pentTouched, edict_t *pentOther )
{
   (*other_gFunctionTable.pfnTouch)(pentTouched, pentOther);
}

void DispatchBlocked( edict_t *pentBlocked, edict_t *pentOther )
{
   (*other_gFunctionTable.pfnBlocked)(pentBlocked, pentOther);
}

void DispatchKeyValue( edict_t *pentKeyvalue, KeyValueData *pkvd )
{
   (*other_gFunctionTable.pfnKeyValue)(pentKeyvalue, pkvd);
}

void DispatchSave( edict_t *pent, SAVERESTOREDATA *pSaveData )
{
   (*other_gFunctionTable.pfnSave)(pent, pSaveData);
}

int DispatchRestore( edict_t *pent, SAVERESTOREDATA *pSaveData, int globalEntity )
{
   return (*other_gFunctionTable.pfnRestore)(pent, pSaveData, globalEntity);
}

void DispatchObjectCollsionBox( edict_t *pent )
{
   (*other_gFunctionTable.pfnSetAbsBox)(pent);
}

void SaveWriteFields( SAVERESTOREDATA *pSaveData, const char *pname, void *pBaseData, TYPEDESCRIPTION *pFields, int fieldCount )
{
   (*other_gFunctionTable.pfnSaveWriteFields)(pSaveData, pname, pBaseData, pFields, fieldCount);
}

void SaveReadFields( SAVERESTOREDATA *pSaveData, const char *pname, void *pBaseData, TYPEDESCRIPTION *pFields, int fieldCount )
{
   (*other_gFunctionTable.pfnSaveReadFields)(pSaveData, pname, pBaseData, pFields, fieldCount);
}

void SaveGlobalState( SAVERESTOREDATA *pSaveData )
{
   (*other_gFunctionTable.pfnSaveGlobalState)(pSaveData);
}

void RestoreGlobalState( SAVERESTOREDATA *pSaveData )
{
   (*other_gFunctionTable.pfnRestoreGlobalState)(pSaveData);
}

void ResetGlobalState( void )
{
   (*other_gFunctionTable.pfnResetGlobalState)();
}

BOOL ClientConnect( edict_t *pEntity, const char *pszName, const char *pszAddress, char szRejectReason[ 128 ]  )
{
   if (gpGlobals->deathmatch)
   {
      int i;
      int count = 0;

      // check if this client is the listen server client
      if (strcmp(pszAddress, "loopback") == 0)
         listenserver_edict = pEntity; // save the edict of the listen server client...

      // check if this is NOT a bot joining the server...
      if (strcmp(pszAddress, "127.0.0.1") != 0)
      {
         // don't try to add bots for 60 seconds, give client time to get added
         bot_check_time = gpGlobals->time + 60.0;

         for (i = 0; i < 32; i++)
         {
            if (bots[i].is_used)  // count the number of bots in use
               count++;
         }

         // if there are currently more than the minimum number of bots running
         // then kick one of the bots off the server...
         if (count > min_bots && min_bots != -1)
         {
            for (i=0; i < 32; i++)
            {
               if (bots[i].is_used)  // is this slot used?
               {
                  char cmd[80];
                  sprintf(cmd, "kick \"%s\"\n", STRING(bots[i].pEdict->v.netname));
                  SERVER_COMMAND(cmd);  // kick the bot using (kick "name")
                  break;
               }
            }
         }
      }
   }

   return (*other_gFunctionTable.pfnClientConnect)(pEntity, pszName, pszAddress, szRejectReason);
}

void ClientDisconnect( edict_t *pEntity )
{
   if (gpGlobals->deathmatch)
   {
      for (int i = 0; i < 32; i++)
      {
         if (bots[i].pEdict == pEntity)
         {
            // someone kicked this bot off of the server...
            bots[i].is_used = FALSE;  // this slot is now free to use
            bots[i].kick_time = gpGlobals->time;  // save the kicked time
            break;
         }
      }
   }

   (*other_gFunctionTable.pfnClientDisconnect)(pEntity);
}

void ClientKill( edict_t *pEntity )
{
   (*other_gFunctionTable.pfnClientKill)(pEntity);
}

void ClientPutInServer( edict_t *pEntity )
{
   (*other_gFunctionTable.pfnClientPutInServer)(pEntity);
}

void ClientCommand( edict_t *pEntity )
{
   // only allow custom commands if deathmatch mode and NOT dedicated server and
   // client sending command is the listen server client...

   if ((gpGlobals->deathmatch) && (!IS_DEDICATED_SERVER()) &&
       (pEntity == listenserver_edict))
   {
      const char *pcmd = CMD_ARGV(0);
      const char *arg1 = CMD_ARGV(1);
      const char *arg2 = CMD_ARGV(2);
      char msg[80];

      if (FStrEq(pcmd, "addbot"))
      {
         BotCreate( pEntity, arg1, arg2 );

         bot_check_time = gpGlobals->time + 5.0;

         return;
      }
      else if (FStrEq(pcmd, "observer"))
      {
         if ((arg1 != NULL) && (*arg1 != 0))
         {
            int temp = atoi(arg1);
            if (temp)
               b_observer_mode = TRUE;
            else
               b_observer_mode = FALSE;
         }

         if (b_observer_mode)
            ClientPrint(pEntity, HUD_PRINTNOTIFY, "observer mode ENABLED\n");
         else
            ClientPrint(pEntity, HUD_PRINTNOTIFY, "observer mode DISABLED\n");

         return;
      }
      else if (FStrEq(pcmd, "botskill"))
      {
         if ((arg1 != NULL) && (*arg1 != 0))
         {
            int temp = atoi(arg1);

            if (temp < 1 || temp > 5)
               ClientPrint(pEntity, HUD_PRINTNOTIFY, "invalid botskill value!\n");
            else
               default_bot_skill = temp;
         }

         sprintf(msg, "botskill is %d\n", default_bot_skill);
         ClientPrint(pEntity, HUD_PRINTNOTIFY, msg);

         return;
      }
      else if (FStrEq(pcmd, "botdontshoot"))
      {
         if ((arg1 != NULL) && (*arg1 != 0))
         {
            int temp = atoi(arg1);
            if (temp)
               b_botdontshoot = TRUE;
            else
               b_botdontshoot = FALSE;
         }

         if (b_botdontshoot)
            ClientPrint(pEntity, HUD_PRINTNOTIFY, "botdontshoot ENABLED\n");
         else
            ClientPrint(pEntity, HUD_PRINTNOTIFY, "botdontshoot DISABLED\n");

         return;
      }
      else if (FStrEq(pcmd, "bot_chat_percent"))
      {
         if ((arg1 != NULL) && (*arg1 != 0))
         {
            int temp = atoi(arg1);

            if ((temp < 0) || (temp > 100))
               ClientPrint(pEntity, HUD_PRINTNOTIFY, "invalid bot_chat_percent value!\n");
            else
               bot_chat_percent = temp;
         }

         sprintf(msg, "bot_chat_percent is %d\n", bot_chat_percent);
         ClientPrint(pEntity, HUD_PRINTNOTIFY, msg);

         return;
      }
   }

   (*other_gFunctionTable.pfnClientCommand)(pEntity);
}

void ClientUserInfoChanged( edict_t *pEntity, char *infobuffer )
{
   (*other_gFunctionTable.pfnClientUserInfoChanged)(pEntity, infobuffer);
}

void ServerActivate( edict_t *pEdictList, int edictCount, int clientMax )
{
   (*other_gFunctionTable.pfnServerActivate)(pEdictList, edictCount, clientMax);
}

void ServerDeactivate( void )
{
   (*other_gFunctionTable.pfnServerDeactivate)();
}

void PlayerPreThink( edict_t *pEntity )
{
   (*other_gFunctionTable.pfnPlayerPreThink)(pEntity);
}

void PlayerPostThink( edict_t *pEntity )
{
   (*other_gFunctionTable.pfnPlayerPostThink)(pEntity);
}

void StartFrame( void )
{
   if (gpGlobals->deathmatch)
   {
      static int i, index, bot_index;
      static float previous_time = -1.0;
      int count;

      // if a new map has started then (MUST BE FIRST IN StartFrame)...
      if (gpGlobals->time + 0.1 < previous_time)
      {
         char filename[256];
         char mapname[64];

         // check if mapname_bot.cfg file exists...
         strcpy(mapname, STRING(gpGlobals->mapname));
         strcat(mapname, "_bot.cfg");

         UTIL_BuildFileName(filename, "maps", mapname);

         if ((bot_cfg_fp = fopen(filename, "r")) != NULL)
         {
            for (index = 0; index < 32; index++)
            {
               bots[index].is_used = FALSE;
               bots[index].respawn_state = 0;
               bots[index].kick_time = 0.0;
            }

            if (IS_DEDICATED_SERVER())
               bot_cfg_pause_time = gpGlobals->time + 5.0;
            else
               bot_cfg_pause_time = gpGlobals->time + 20.0;
         }
         else
         {
            count = 0;

            // mark the bots as needing to be respawned...
            for (index = 0; index < 32; index++)
            {
               if (count >= prev_num_bots)
               {
                  bots[index].is_used = FALSE;
                  bots[index].respawn_state = 0;
                  bots[index].kick_time = 0.0;
               }

               if (bots[index].is_used)  // is this slot used?
               {
                  bots[index].respawn_state = RESPAWN_NEED_TO_RESPAWN;
                  count++;
               }

               // check for any bots that were very recently kicked...
               if ((bots[index].kick_time + 5.0) > previous_time)
               {
                  bots[index].respawn_state = RESPAWN_NEED_TO_RESPAWN;
                  count++;
               }
               else
                  bots[index].kick_time = 0.0;  // reset to prevent false spawns later
            }

            // set the respawn time
            if (IS_DEDICATED_SERVER())
               respawn_time = gpGlobals->time + 5.0;
            else
               respawn_time = gpGlobals->time + 20.0;
         }

         bot_check_time = gpGlobals->time + 30.0;
      }

      if (!IS_DEDICATED_SERVER())
      {
         if ((listenserver_edict != NULL) && (welcome_sent == FALSE) &&
             (welcome_time < 1.0))
         {
            // are they out of observer mode yet?
            if (IsAlive(listenserver_edict))
               welcome_time = gpGlobals->time + 5.0;  // welcome in 5 seconds
         }

         if ((welcome_time > 0.0) && (welcome_time < gpGlobals->time) &&
             (welcome_sent == FALSE))
         {

         }
      }

      count = 0;

      for (bot_index = 0; bot_index < gpGlobals->maxClients; bot_index++)
      {
         if ((bots[bot_index].is_used) &&  // is this slot used AND
             (bots[bot_index].respawn_state == RESPAWN_IDLE))  // not respawning
         {
            BotThink(&bots[bot_index]);

            count++;
         }
      }

      if (count > num_bots)
         num_bots = count;

      // are we currently respawning bots and is it time to spawn one yet?
      if (respawn_time > 1.0 && respawn_time <= gpGlobals->time)
      {
         int index = 0;

         // find bot needing to be respawned...
         while (index < 32 &&
                bots[index].respawn_state != RESPAWN_NEED_TO_RESPAWN)
            index++;

         if (index < 32)
         {
            bots[index].respawn_state = RESPAWN_IS_RESPAWNING;
            bots[index].is_used = FALSE;      // free up this slot

            // respawn 1 bot then wait a while (otherwise engine crashes)
            char c_skill[2];
            sprintf(c_skill, "%d", bots[index].bot_skill);
            BotCreate(NULL, bots[index].name, c_skill);

            respawn_time = gpGlobals->time + 2.0;  // set next respawn time

            bot_check_time = gpGlobals->time + 5.0;
         }
         else
            respawn_time = 0.0;
      }

      if (g_GameRules)
      {
         if (need_to_open_cfg)  // have we open bot.cfg file yet?
         {
            char filename[256];
            char mapname[64];

            need_to_open_cfg = FALSE;  // only do this once!!!

            // check if mapname_bot.cfg file exists...

            strcpy(mapname, STRING(gpGlobals->mapname));
            strcat(mapname, "_bot.cfg");

            UTIL_BuildFileName(filename, "maps", mapname);

            if ((bot_cfg_fp = fopen(filename, "r")) == NULL)
            {
               UTIL_BuildFileName(filename, "bot.cfg", NULL);
               bot_cfg_fp = fopen(filename, "r");
            }

            if (IS_DEDICATED_SERVER())
               bot_cfg_pause_time = gpGlobals->time + 5.0;
            else
               bot_cfg_pause_time = gpGlobals->time + 20.0;
         }

         if (!IS_DEDICATED_SERVER() && !spawn_time_reset)
         {
            if (listenserver_edict != NULL)
            {
               if (IsAlive(listenserver_edict))
               {
                  spawn_time_reset = TRUE;

                  if (respawn_time >= 1.0)
                     respawn_time = min(respawn_time, gpGlobals->time + (float)1.0);

                  if (bot_cfg_pause_time >= 1.0)
                     bot_cfg_pause_time = min(bot_cfg_pause_time, gpGlobals->time + (float)1.0);
               }
            }
         }

         if ((bot_cfg_fp) &&
             (bot_cfg_pause_time >= 1.0) && (bot_cfg_pause_time <= gpGlobals->time))
         {
            // process bot.cfg file options...
            ProcessBotCfgFile();
         }
      }

      // check if time to see if a bot needs to be created...
      if (bot_check_time < gpGlobals->time)
      {
         int count = 0;
         bot_check_time = gpGlobals->time + 5.0;

         for (i = 1; i <= gpGlobals->maxClients; i++)
         {
            edict_t *pPlayer = INDEXENT(i);
            if (!FNullEnt(pPlayer) && !pPlayer->free &&
               (pPlayer->v.flags & (FL_CLIENT | FL_FAKECLIENT)))
               count++;
         }

         // if there are currently less than the maximum number of "players"
         // then add another bot using the default skill level...
         if (count < max_bots && max_bots != -1)
            BotCreate( NULL, NULL, NULL );
      }

      previous_time = gpGlobals->time;
   }

   (*other_gFunctionTable.pfnStartFrame)();
}

void ParmsNewLevel( void )
{
   (*other_gFunctionTable.pfnParmsNewLevel)();
}

void ParmsChangeLevel( void )
{
   (*other_gFunctionTable.pfnParmsChangeLevel)();
}

const char *GetGameDescription( void )
{
   return (*other_gFunctionTable.pfnGetGameDescription)();
}

void PlayerCustomization( edict_t *pEntity, customization_t *pCust )
{
   (*other_gFunctionTable.pfnPlayerCustomization)(pEntity, pCust);
}

void SpectatorConnect( edict_t *pEntity )
{
   (*other_gFunctionTable.pfnSpectatorConnect)(pEntity);
}

void SpectatorDisconnect( edict_t *pEntity )
{
   (*other_gFunctionTable.pfnSpectatorDisconnect)(pEntity);
}

void SpectatorThink( edict_t *pEntity )
{
   (*other_gFunctionTable.pfnSpectatorThink)(pEntity);
}

void Sys_Error( const char *error_string )
{
   (*other_gFunctionTable.pfnSys_Error)(error_string);
}

void PM_Move ( struct playermove_s *ppmove, int server )
{
   (*other_gFunctionTable.pfnPM_Move)(ppmove, server);
}

void PM_Init ( struct playermove_s *ppmove )
{
   (*other_gFunctionTable.pfnPM_Init)(ppmove);
}

char PM_FindTextureType( char *name )
{
   return (*other_gFunctionTable.pfnPM_FindTextureType)(name);
}

void SetupVisibility( edict_t *pViewEntity, edict_t *pClient, unsigned char **pvs, unsigned char **pas )
{
   (*other_gFunctionTable.pfnSetupVisibility)(pViewEntity, pClient, pvs, pas);
}

void UpdateClientData ( const struct edict_s *ent, int sendweapons, struct clientdata_s *cd )
{
   (*other_gFunctionTable.pfnUpdateClientData)(ent, sendweapons, cd);
}

int AddToFullPack( struct entity_state_s *state, int e, edict_t *ent, edict_t *host, int hostflags, int player, unsigned char *pSet )
{
   return (*other_gFunctionTable.pfnAddToFullPack)(state, e, ent, host, hostflags, player, pSet);
}

void CreateBaseline( int player, int eindex, struct entity_state_s *baseline, struct edict_s *entity, int playermodelindex, vec3_t player_mins, vec3_t player_maxs )
{
   (*other_gFunctionTable.pfnCreateBaseline)(player, eindex, baseline, entity, playermodelindex, player_mins, player_maxs);
}

void RegisterEncoders( void )
{
   (*other_gFunctionTable.pfnRegisterEncoders)();
}

int GetWeaponData( struct edict_s *player, struct weapon_data_s *info )
{
   return (*other_gFunctionTable.pfnGetWeaponData)(player, info);
}

void CmdStart( const edict_t *player, const struct usercmd_s *cmd, unsigned int random_seed )
{
   (*other_gFunctionTable.pfnCmdStart)(player, cmd, random_seed);
}

void CmdEnd ( const edict_t *player )
{
   (*other_gFunctionTable.pfnCmdEnd)(player);
}

int ConnectionlessPacket( const struct netadr_s *net_from, const char *args, char *response_buffer, int *response_buffer_size )
{
   return (*other_gFunctionTable.pfnConnectionlessPacket)(net_from, args, response_buffer, response_buffer_size);
}

int GetHullBounds( int hullnumber, float *mins, float *maxs )
{
   return (*other_gFunctionTable.pfnGetHullBounds)(hullnumber, mins, maxs);
}

void CreateInstancedBaselines( void )
{
   (*other_gFunctionTable.pfnCreateInstancedBaselines)();
}

int InconsistentFile( const edict_t *player, const char *filename, char *disconnect_message )
{
   return (*other_gFunctionTable.pfnInconsistentFile)(player, filename, disconnect_message);
}

int AllowLagCompensation( void )
{
   return (*other_gFunctionTable.pfnAllowLagCompensation)();
}


DLL_FUNCTIONS gFunctionTable =
{
   GameDLLInit,               //pfnGameInit
   DispatchSpawn,             //pfnSpawn
   DispatchThink,             //pfnThink
   DispatchUse,               //pfnUse
   DispatchTouch,             //pfnTouch
   DispatchBlocked,           //pfnBlocked
   DispatchKeyValue,          //pfnKeyValue
   DispatchSave,              //pfnSave
   DispatchRestore,           //pfnRestore
   DispatchObjectCollsionBox, //pfnAbsBox

   SaveWriteFields,           //pfnSaveWriteFields
   SaveReadFields,            //pfnSaveReadFields

   SaveGlobalState,           //pfnSaveGlobalState
   RestoreGlobalState,        //pfnRestoreGlobalState
   ResetGlobalState,          //pfnResetGlobalState

   ClientConnect,             //pfnClientConnect
   ClientDisconnect,          //pfnClientDisconnect
   ClientKill,                //pfnClientKill
   ClientPutInServer,         //pfnClientPutInServer
   ClientCommand,             //pfnClientCommand
   ClientUserInfoChanged,     //pfnClientUserInfoChanged
   ServerActivate,            //pfnServerActivate
   ServerDeactivate,          //pfnServerDeactivate

   PlayerPreThink,            //pfnPlayerPreThink
   PlayerPostThink,           //pfnPlayerPostThink

   StartFrame,                //pfnStartFrame
   ParmsNewLevel,             //pfnParmsNewLevel
   ParmsChangeLevel,          //pfnParmsChangeLevel

   GetGameDescription,        //pfnGetGameDescription    Returns string describing current .dll game.
   PlayerCustomization,       //pfnPlayerCustomization   Notifies .dll of new customization for player.

   SpectatorConnect,          //pfnSpectatorConnect      Called when spectator joins server
   SpectatorDisconnect,       //pfnSpectatorDisconnect   Called when spectator leaves the server
   SpectatorThink,            //pfnSpectatorThink        Called when spectator sends a command packet (usercmd_t)

   Sys_Error,                 //pfnSys_Error          Called when engine has encountered an error

   PM_Move,                   //pfnPM_Move
   PM_Init,                   //pfnPM_Init            Server version of player movement initialization
   PM_FindTextureType,        //pfnPM_FindTextureType

   SetupVisibility,           //pfnSetupVisibility        Set up PVS and PAS for networking for this client
   UpdateClientData,          //pfnUpdateClientData       Set up data sent only to specific client
   AddToFullPack,             //pfnAddToFullPack
   CreateBaseline,            //pfnCreateBaseline        Tweak entity baseline for network encoding, allows setup of player baselines, too.
   RegisterEncoders,          //pfnRegisterEncoders      Callbacks for network encoding
   GetWeaponData,             //pfnGetWeaponData
   CmdStart,                  //pfnCmdStart
   CmdEnd,                    //pfnCmdEnd
   ConnectionlessPacket,      //pfnConnectionlessPacket
   GetHullBounds,             //pfnGetHullBounds
   CreateInstancedBaselines,  //pfnCreateInstancedBaselines
   InconsistentFile,          //pfnInconsistentFile
   AllowLagCompensation,      //pfnAllowLagCompensation
};

C_DLLEXPORT int GetEntityAPI( DLL_FUNCTIONS *pFunctionTable, int interfaceVersion )
{
   // check if engine's pointer is valid and version is correct...

   if ( !pFunctionTable || interfaceVersion != INTERFACE_VERSION )
      return FALSE;

   // pass engine callback function table to engine...
   memcpy( pFunctionTable, &gFunctionTable, sizeof( DLL_FUNCTIONS ) );

   // pass other DLLs engine callbacks to function table...
   if (!(*other_GetEntityAPI)(&other_gFunctionTable, INTERFACE_VERSION))
      return FALSE;  // error initializing function table!!!

   return TRUE;
}

C_DLLEXPORT int GetNewDLLFunctions( NEW_DLL_FUNCTIONS *pFunctionTable, int *interfaceVersion )
{
   if (other_GetNewDLLFunctions == NULL)
      return FALSE;

   // pass other DLLs engine callbacks to function table...
   if (!(*other_GetNewDLLFunctions)(pFunctionTable, interfaceVersion))
      return FALSE;  // error initializing function table!!!

   return TRUE;
}

void ProcessBotCfgFile(void)
{
   int ch;
   char cmd_line[256];
   int cmd_index;
   static char server_cmd[80];
   char *cmd, *arg1, *arg2;
   char msg[80];

   if (bot_cfg_pause_time > gpGlobals->time)
      return;

   if (bot_cfg_fp == NULL)
      return;

   cmd_index = 0;
   cmd_line[cmd_index] = 0;

   ch = fgetc(bot_cfg_fp);

   // skip any leading blanks
   while (ch == ' ')
      ch = fgetc(bot_cfg_fp);

   while ((ch != EOF) && (ch != '\r') && (ch != '\n'))
   {
      if (ch == '\t')  // convert tabs to spaces
         ch = ' ';

      cmd_line[cmd_index] = ch;

      ch = fgetc(bot_cfg_fp);

      // skip multiple spaces in input file
      while ((cmd_line[cmd_index] == ' ') &&
             (ch == ' '))
         ch = fgetc(bot_cfg_fp);

      cmd_index++;
   }

   if (ch == '\r')  // is it a carriage return?
   {
      ch = fgetc(bot_cfg_fp);  // skip the linefeed
   }

   // if reached end of file, then close it
   if (ch == EOF)
   {
      fclose(bot_cfg_fp);

      bot_cfg_fp = NULL;

      bot_cfg_pause_time = 0.0;
   }

   cmd_line[cmd_index] = 0;  // terminate the command line

   // copy the command line to a server command buffer...
   strcpy(server_cmd, cmd_line);
   strcat(server_cmd, "\n");

   cmd_index = 0;
   cmd = cmd_line;
   arg1 = arg2 = NULL;

   // skip to blank or end of string...
   while ((cmd_line[cmd_index] != ' ') && (cmd_line[cmd_index] != 0))
      cmd_index++;

   if (cmd_line[cmd_index] == ' ')
   {
      cmd_line[cmd_index++] = 0;
      arg1 = &cmd_line[cmd_index];

      // skip to blank or end of string...
      while ((cmd_line[cmd_index] != ' ') && (cmd_line[cmd_index] != 0))
         cmd_index++;

      if (cmd_line[cmd_index] == ' ')
      {
         cmd_line[cmd_index++] = 0;
         arg2 = &cmd_line[cmd_index];
      }
   }

   if (cmd_line[0] == '#' || cmd_line[0] == 0)
      return;  // return if comment or blank line

   if (strcmp(cmd, "addbot") == 0)
   {
      BotCreate( NULL, arg1, arg2 );

      // have to delay here or engine gives "Tried to write to
      // uninitialized sizebuf_t" error and crashes...

      bot_cfg_pause_time = gpGlobals->time + 2.0;
      bot_check_time = gpGlobals->time + 5.0;

      return;
   }

   if (strcmp(cmd, "botskill") == 0)
   {
      int temp = atoi(arg1);

      if ((temp >= 1) && (temp <= 5))
         default_bot_skill = atoi( arg1 );  // set default bot skill level

      return;
   }

   if (strcmp(cmd, "observer") == 0)
   {
      int temp = atoi(arg1);

      if (temp)
         b_observer_mode = TRUE;
      else
         b_observer_mode = FALSE;

      return;
   }

   if (strcmp(cmd, "botdontshoot") == 0)
   {
      int temp = atoi(arg1);

      if (temp)
         b_botdontshoot = TRUE;
      else
         b_botdontshoot = FALSE;

      return;
   }

   if (strcmp(cmd, "min_bots") == 0)
   {
      min_bots = atoi( arg1 );

      if ((min_bots < 0) || (min_bots > 31))
         min_bots = 1;

      if (IS_DEDICATED_SERVER())
      {
         sprintf(msg, "min_bots set to %d\n", min_bots);
         printf(msg);
      }

      return;
   }

   if (strcmp(cmd, "max_bots") == 0)
   {
      max_bots = atoi( arg1 );

      if ((max_bots < 0) || (max_bots > 31))
         max_bots = 1;

      if (IS_DEDICATED_SERVER())
      {
         sprintf(msg, "max_bots set to %d\n", max_bots);
         printf(msg);
      }

      return;
   }

   if (strcmp(cmd, "pause") == 0)
   {
      bot_cfg_pause_time = gpGlobals->time + atoi( arg1 );
      return;
   }

   if (strcmp(cmd, "bot_chat_percent") == 0)
   {
      int temp = atoi(arg1);

      if ((temp >= 0) && (temp <= 100))
         bot_chat_percent = atoi( arg1 );  // set bot chat percent

      return;
   }

   SERVER_COMMAND(server_cmd);
}

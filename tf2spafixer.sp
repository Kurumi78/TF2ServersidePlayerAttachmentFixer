#include <sourcemod>
#include <sdktools>

#pragma semicolon 1
#pragma newdecls required

#define PLUGIN_VERSION "1.0"

public Plugin myinfo = {
	name = "[TF2] Serverside Player Attachment Fixer",
	author = "404UNF",
	description = "Fixes the engine rendering entities attached to players invisible",
	version = PLUGIN_VERSION,
	url = "http://www.404UNF.ca"
};

public void OnPluginStart()
{
	CreateConVar("sm_spafix_version", PLUGIN_VERSION, "[TF2] Serverside Player Attachment Fixer plugin version.", FCVAR_SPONLY|FCVAR_NOTIFY|FCVAR_DONTRECORD);
}

public void OnEntityCreated(int iEntity, const char[] strClassname)
{
    if (IsValidEntity(iEntity) && HasEntProp(iEntity, Prop_Send, "m_bValidatedAttachedEntity"))
    {
		SetEntProp(iEntity, Prop_Send, "m_bValidatedAttachedEntity", 1);
    }
}
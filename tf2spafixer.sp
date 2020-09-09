#include <sourcemod>
#include <sdktools>
#include <sdkhooks>

#pragma semicolon 1
#pragma newdecls required

#define PLUGIN_VERSION "1.0"

public Plugin myinfo = {
	name = "[TF2] Serverside Player Attachment Fixer",
	author = "NiagaraDryGuy",
	description = "Fixes the engine rendering entities attached to players invisible",
	version = PLUGIN_VERSION
};

public void OnPluginStart()
{
	CreateConVar("sm_spafix_version", PLUGIN_VERSION, "[TF2] Serverside Player Attachment Fixer plugin version.", FCVAR_SPONLY|FCVAR_NOTIFY|FCVAR_DONTRECORD);
}

public void OnEntityCreated(int iEntity, const char[] strClassname)
{
    if (IsValidEntity(iEntity) && HasEntProp(iEntity, Prop_Send, "m_bValidatedAttachedEntity"))
    {
    	// If it's already set to 1, don't bother fucking with it.
    	if (GetEntProp(iEntity, Prop_Send, "m_bValidatedAttachedEntity") != 0) return;
	
	// Hey, yeah, Source Engine, let's not fuck with visibility thanks.
	SetEntProp(iEntity, Prop_Send, "m_bValidatedAttachedEntity", 1);
    }
}

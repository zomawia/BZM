class BZMGame extends CMWTO2;

var int DefaultFamilyIndex;
var class<AOCWeapon> DefaultPrimary;
var class<AOCWeapon> DefaultSecondary;
var class<AOCWeapon> DefaultTertiary;
  
static event class<GameInfo> SetGameType(string MapName, string Options, string Portal)
{
    //returns this object's own class, so this class is setting itself to be the game type used
    return default.class;
}

event PostLogin( playercontroller NewPlayer )
{
	local string SteamID;
	local LoadOutFile ReturnToPlayer;    
	
	super.PostLogin(NewPlayer);
	
	ReturnToPlayer = new Class'LoadOutFile';    
	SteamID = OnlineSubsystemSteamworks(OnlineSub).UniqueNetIdToInt64(NewPlayer.PlayerReplicationInfo.UniqueId);
	
	if(class'Engine'.static.BasicLoadObject(ReturnToPlayer,SteamID$".dat", true, 0))
	{
		BZMPlayerController(NewPlayer).ReturnLoadOut();
	}		
}

function Logout( Controller Exiting )
{
	BZMPlayerController(Exiting).SaveLoadOut();
	super.Logout(Exiting);
}

event InitGame( string Options, out string ErrorMessage )
{
    super.InitGame(Options, ErrorMessage);
 
	// use BZM customization class
    CustomizationClass = class'BZM.BZMCustomizationContent';
}

//function PerformRealGameActions( AOCPlayerController PC)
//{	
	//// temp: Force set PC's loadout and skip the loadout/team screens
	//// take from tutorial
	//
	//PC.SetWeapons(DefaultPrimary, DefaultPrimary.default.AlternativeMode, DefaultSecondary, DefaultTertiary);
	//PC.SetNewClass(AOCGRI(Worldinfo.GRI).FamilyInfos[DefaultFamilyIndex]);
	//
	//PC.SetReady(true);
//
	//AOCBaseHUD(PC.myHUD).ShowCursor(false);
	//
	////AOCTO stuff
	////AOCTeamObjectivePC(PC).SetAttackingFaction(AttackingTeam);
//}


// ScoreKill
function ScoreKill( Controller Killer, Controller Other )
{
	local EAOCFaction KillerTeam, KilledTeam;
	//local int KillBonus;
	//local Volume Vol;
	//local IAOCKillBonusVolume KillVol;
	
		
	// set killer faction if player or bot
	if (AOCPlayerController(Killer) != none)
		KillerTeam = AOCPlayerController(Killer).CurrentFamilyInfo.FamilyFaction;	
	else if (AOCAIController(Killer) != none)
		KillerTeam = AOCAIController(Killer).myPawnClass.default.FamilyFaction;

	// set killed faction if player or bot
	if (AOCPlayerController(Other) != none)
	{	
		KilledTeam = AOCPlayerController(Other).CurrentFamilyInfo.FamilyFaction;
	}
	else if (AOCAIController(Other) != none)
	{		
		KilledTeam = AOCAIController(Other).myPawnClass.default.FamilyFaction;
	}
	
	// Killer is currently lawful	
	if (KillerTeam == EFAC_AGATHA)
	{
		if (KilledTeam == EFAC_AGATHA || KilledTeam == EFAC_NONE) 
		{
			//AOCPRI(Killer.PlayerReplicationInfo).Score += 10;
			BZMPRI(Killer.PlayerReplicationInfo).Law -= 100;						
		}
		
		else if (KilledTeam == EFAC_MASON) // kill an outlaw		
		{
			BZMPRI(Killer.PlayerReplicationInfo).Law += 10;
		}
		
		else if (KilledTeam == EFAC_FFA) // kill orc, mob, etc.
		{
			BZMPRI(Killer.PlayerReplicationInfo).Law += 2;
		}		
		Killer.PlayerReplicationInfo.bForceNetUpdate = TRUE;
	}
	
	// Killer is currently outlaw
	else if (KillerTeam == EFAC_MASON)
	{
		if (KilledTeam == EFAC_AGATHA || KilledTeam == EFAC_NONE) // kill a lawful or neutral NPC
		{
			//AOCPRI(Killer.PlayerReplicationInfo).Score += 10;
			BZMPRI(Killer.PlayerReplicationInfo).Law -= 100;
			BZMPRI(Killer.PlayerReplicationInfo).Bounty += (Other.PlayerReplicationInfo.Score * 0.25) + 10;		
		}
		
		else if (KilledTeam == EFAC_MASON) // kill an outlaw
		{
			BZMPRI(Killer.PlayerReplicationInfo).Law += 10;
		}
		
		else if (KilledTeam == EFAC_FFA) // kill orc, mob
		{
			BZMPRI(Killer.PlayerReplicationInfo).Law += 2;
		}		
		Killer.PlayerReplicationInfo.bForceNetUpdate = TRUE;
	}
	
	else if (KillerTeam == EFAC_FFA || KillerTeam == EFAC_NONE) // handles mob team
	{
		//if(AOCAIController(Other) != none && !AOCPRI(AOCAIController(Other).PlayerReplicationInfo).bDisplayOnScoreboard) //is an "NPC", not a "bot player"
		//{
			////AOCPRI(Killer.PlayerReplicationInfo).Score += AOCAIController(Other).KillReward;
			////AOCPRI(Killer.PlayerReplicationInfo).ObjPoints += AOCAIController(Other).KillReward;
			//BZMPRI(Killer.PlayerReplicationInfo).Law -= 100;
		//}
		//
		//else
		//{
			//if(LastKilledPawn != none && Killer.Pawn != none)
			//{
				 //assist calc, disabled for now
				//foreach LastKilledPawn.CollidingActors(class'Volume', Vol, LastKilledPawn.GetCollisionRadius(), LastKilledPawn.Location, true)
				//{
					//KillVol = IAOCKillBonusVolume(Vol);
					//if(KillVol != none)
					//{
						////KillBonus += KillVol.GetKillBonus(AOCPawn(Killer.Pawn), AOCPawn(LastKilledPawn));
						//
					//}
				//}
			//}
			//AOCPRI(Killer.PlayerReplicationInfo).ObjPoints += KillBonus;
			//AOCPRI(Killer.PlayerReplicationInfo).Score += 10 + KillBonus;		
	
	BZMPRI(Killer.PlayerReplicationInfo).Law -= 100;
	BZMPRI(Killer.PlayerReplicationInfo).Bounty += (Other.PlayerReplicationInfo.Score * 0.25) + 10;
		
	}
	
	// swap factions if lawful requirements met
	if (BZMPRI(Killer.PlayerReplicationInfo).Law < 0 && KillerTeam == EFAC_AGATHA)
		{
			BZMPRI(Killer.PlayerReplicationInfo).MyFamilyInfo.FamilyFaction = EFAC_MASON;
			BZMPRI(Killer.PlayerReplicationInfo).OwnerPawn.ReplicatedEvent('PawnInfo');
			AOCPlayerController(Killer).ReceiveChatMessage("You are now an Outlaw", 4, true);
			
		}
		
	if (BZMPRI(Killer.PlayerReplicationInfo).Law >= 0 && KillerTeam == EFAC_MASON)
		{
			BZMPRI(Killer.PlayerReplicationInfo).MyFamilyInfo.FamilyFaction = EFAC_AGATHA;
			BZMPRI(Killer.PlayerReplicationInfo).OwnerPawn.ReplicatedEvent('PawnInfo');
			AOCPlayerController(Killer).ReceiveChatMessage("You are now Lawful", 4, true);			
		}		
	
	Killer.PlayerReplicationInfo.bForceNetUpdate = TRUE;
}

	// check score again to see if team won
    //if ( (Killer != None) && bScoreTeamKills )
		//CheckScore(Killer.PlayerReplicationInfo);


//Killed - override to transfer score
function Killed( Controller Killer, Controller KilledPlayer, Pawn KilledPawn, class<DamageType> damageType )
{
	local AOCPRI KilledPRI;

	if (bGameEnded)
		return;
		
	// transfer money & additional bounty (if any)
	// TODO: add some local text to show the amounts
	AOCPRI(Killer.PlayerReplicationInfo).Score += (AOCPRI(KilledPlayer.PlayerReplicationInfo).Score * 0.75f) + (BZMPRI(KilledPlayer.PlayerReplicationInfo).Bounty);
	
	// Give kill to Killer
	self.LastKilledPawn = KilledPawn;
	ScoreKill(Killer, KilledPlayer);	
	self.LastKilledPawn = none;
	
	// after death, zero out killedplayers score and bounty
	AOCPRI(KilledPlayer.PlayerReplicationInfo).Score = 0;
	BZMPRI(KilledPlayer.PlayerReplicationInfo).Bounty = 0;
	BZMPRI(KilledPlayer.PlayerReplicationInfo).Metal = 0;
	//disable to zero out wood in dropweapon function
	//BZMPRI(KilledPlayer.PlayerReplicationInfo).Wood = 0;
	

	KilledPRI = AOCPRI(KilledPlayer.PlayerReplicationInfo);
	
	// Give Death to Dead Player
	if (KilledPRI != none)
	{
		KilledPRI.IncrementDeaths();
	}

	// no autobalance dead player
	//PerformDeathBasedAB(AOCPlayerController(KilledPlayer));

	NotifyKilled(Killer, KilledPlayer, KilledPawn, damageType);
	
	// ???
	//`RecordKillEvent(NORMAL, Killer, DamageType, KilledPlayer);
	//`RecordDeathEvent(NORMAL, Killer, DamageType, KilledPlayer);
}

// hacking in override team damage penalty (there are no "teams")
// because adding bDisableTeamDamagePenalty in default properties doesnt work
function int GetTeamDamagePenalty(Controller PC)
{
	return 0;
}
 
defaultproperties
{
    ModDisplayString="BZM"
    
    HUDType=class'BZMBaseHud'
    
    GameReplicationInfoClass=class'BZMGRI'
	PlayerReplicationInfoClass=class'BZMPRI'
    
    PlayerControllerClass=class'BZMPlayerController'
    
    bWaitForTeams=false
    
    fTeamDamagePercent=1        //teams don't matter on FFA, 100% damage for everyone	
		
	bIsTeamMode = false
	
	// doesnt work
	// bDisableTeamDamagePenalty = true
	
     
    SpawnWaveInterval=1
    MinimumRespawnTime=0

    //Use our new, custom pawn class instead of AOCPawn
    DefaultPawnClass=class'BZMPawn'
    
    //Families(ECLASS_Archer)=class'BZMFamilyInfo_Agatha_Archer'
	//Families(ECLASS_ManAtArms)=class'BZMFamilyInfo_Agatha_ManAtArms'
	//Families(ECLASS_Vanguard)=class'BZMFamilyInfo_Agatha_Vanguard'
	//Families(ECLASS_Knight)=class'BZMFamilyInfo_Agatha_Knight'
	//// test comment
	//// same order as above for Masons, but we cant do maths in the thingys.
	//Families(5)=class'BZMFamilyInfo_Mason_Archer'
	//Families(6)=class'BZMFamilyInfo_Mason_ManAtArms'
	//Families(7)=class'BZMFamilyInfo_Mason_Vanguard'
	//Families(8)=class'BZMFamilyInfo_Mason_Knight'  
    
}
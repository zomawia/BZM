class BZMPlayerController extends CMWTO2PC;

var BZMCustomizationContent CustomizationBaseDummy; //force loading it in

//override to spawn as peasant
//function LocalRequestJoinClass(byte inClass)
//{		
	//Request_JoinClass(0);
//}

// TODO: award score for certain stuff
function RewardObjPoints(int Points)
{
	//AOCPRI(PlayerReplicationInfo).Score += Points;
	//AOCPRI(PlayerReplicationInfo).ObjPoints += Points;
	//PlayerReplicationInfo.bForceNetUpdate = true;
	
	//local CMWTO2MapInfo MInfo;
	//MInfo = CMWTO2MapInfo(Worldinfo.GetMapInfo());
//
	//if(MInfo == none || !MInfo.bManualPlayerScoring)
	//{
		//super.RewardObjPoints(Points);
	//}
//
	//if (Worldinfo.Game.BaseMutator != None)
	//{
		//Worldinfo.Game.BaseMutator.ScoreObjective(PlayerReplicationInfo, Points);
	//}
}

// suicide?
reliable server function S_Suicide()
{
	// 0 points/gold for suicide
	PlayerReplicationInfo.Score = 0;
	bJustSuicided =  true;

	AOCPawn(Pawn).ReplicatedHitInfo.DamageString = "5";
	AOCPawn(Pawn).ReplicatedHitInfo.DamageType = class'AOCDmgType_Swing';
	Pawn.TakeDamage(500.0f, none, Vect(0.0f,0.0f,0.0f),Vect(0.0f,0.0f,0.0f), class'AOCDmgType_Swing');
}

//server F10 override to take away money
reliable server function S_DoF10()
{
	AOCPawn(Pawn).ReplicatedHitInfo.DamageString = "&";

	// Take points away for suicide
	PlayerReplicationInfo.Score = 0;

	Pawn.TakeDamage(500.0f, none, Vect(0.0f,0.0f,0.0f),Vect(0.0f,0.0f,0.0f), class'AOCDmgType_Generic');
}

//GetViewName -- changed some text for revive and item pickups
simulated function String GetViewName(out EAOCFaction Faction, out float Dist, out string ExtraText, out ECrosshairInfoType Type)
{
	local Actor myViewTarget;
	local AOCPawn PawnTarget;
	local Vector Loc,Norm;
	local Vector Start,End;
	local Vector PawnEnd;
	local int bHold;
	local string TitleText;
	local string UseButtonString;

	Faction = EFAC_NONE;
	Dist = 0.0f;
	if (Pawn == none)
		return "None";

	Start = Pawn.GetPawnViewLocation();
	End = Pawn.GetPawnViewLocation() + Vector(Pawn.GetViewRotation()) * 200;
	myViewTarget = Trace( Loc, Norm, End, Start, true );
	if (myViewTarget == none)
	{
		PawnEnd = Pawn.GetPawnViewLocation() + Vector(Pawn.GetViewRotation()) * 3000;
		myViewTarget = Trace( Loc, Norm, PawnEnd, Start, true );
		if (myViewTarget == none)
			return "None";
		else if (AOCPawn(myViewTarget) != none)
		{
			PawnTarget = AOCPawn(myViewTarget);
			if(IAOCUsable(myViewTarget).CanBeUsed(AOCPawn(Pawn).PawnFamily.FamilyFaction, AOCPawn(Pawn)) && AOCWeapon(Pawn.Weapon).bCanExecute && AOCWeapon(Pawn.Weapon).default.bCanExecute
				&& Abs(PawnTarget.Location.Z - Pawn.Location.Z) <= class'AOCPawn'.default.fExecutionZRange)
			{
				Type = EXHAIRINFO_Use;
				return "Press \""$FindKeyForCommand("GBA_Use")$" \"to help up."; 
			}
			else
			{
				if (PawnTarget.PlayerReplicationInfo == none)
					return "None";
				Dist = VSize(PawnTarget.Location - Pawn.Location);
				Faction = PawnTarget.PawnFamily.FamilyFaction;
				Type = EXHAIRINFO_Player;
				ExtraText = "";
				return PawnTarget.PlayerReplicationInfo.GetPlayerNameForMarkup();
			}
		}
		return "None";
	}
	bHold = 0;
	if(IAOCInformationBoxDisplayer(myViewTarget) != none)
	{
		if(IAOCInformationBoxDisplayer(myViewTarget).GetInformationBoxText(self, TitleText, ExtraText, Type))
		{
			return ReplaceStringKeybindsWithControllerBinds(TitleText);
		}
		else
		{
			return "Take";
		}
	}
	else if (IAOCUsable(myViewTarget) != none && AOCPawn(myViewTarget) == none && IAOCUsable(myViewTarget).CanBeUsed(AOCPawn(Pawn).PawnFamily.FamilyFaction, AOCPawn(Pawn), bHold))
	{
		Type = EXHAIRINFO_Use;

		if(AOCGameViewportClient(GameEngine(Class'Engine'.static.GetEngine()).GameViewport).bUsingGamepad)
		{
			UseButtonString = "X";
		}
		else
		{
			UseButtonString = FindKeyForCommand("GBA_Use");
		}

		if (bHold == 0)
		{
			return Repl(Localize("Hud", "PressToUse", "AOCUI"),"{BUTTON}",UseButtonString); 
		}
		else
		{
			return Repl(Localize("Hud", "HoldToUse", "AOCUI"),"{BUTTON}",UseButtonString); 
		}
	}
	else if (AOCPawn(myViewTarget) != none)
	{
		PawnTarget = AOCPawn(myViewTarget);
		bHold = 0;
		if(IAOCUsable(myViewTarget).CanBeUsed(AOCPawn(Pawn).PawnFamily.FamilyFaction, AOCPawn(Pawn), bHold))
		{
			if (AOCWeapon(Pawn.Weapon).bCanExecute && AOCWeapon(Pawn.Weapon).default.bCanExecute
				&& Abs(PawnTarget.Location.Z - Pawn.Location.Z) <= class'AOCPawn'.default.fExecutionZRange)
			{
				Type = EXHAIRINFO_Use;
				if (bHold == 0)
				{
					return "Press \""$FindKeyForCommand("GBA_Use")$"\" to help up."; 
				}
				else
				{
					return "Hold \""$FindKeyForCommand("GBA_Use")$"\" to help up."; 
				}
			}
		}
		else
		{
			if (PawnTarget.PlayerReplicationInfo == none)
				return "None";
			Dist = VSize(PawnTarget.Location - Pawn.Location);
			Faction = PawnTarget.PawnFamily.FamilyFaction;
			Type = EXHAIRINFO_Player;
			ExtraText = "";
			return PawnTarget.PlayerReplicationInfo.GetPlayerNameForMarkup();
		}
	}
	else if (myViewTarget.bShowsInformationBox)
	{
		Type = EXHAIRINFO_Box;
		// Extra Text is Information Text
		ExtraText = myViewTarget.InformationBoxText;

		// Return string is Title
		return myViewTarget.InformationBoxTitle;
	}

	return "None";
}

// save inventory
// SaveLoadOut
exec function SaveLoadOut() //Asks the server to save players loadout.
{
    local LoadOutFile Storage;
    local string SteamID;
    
    Storage = new Class'LoadOutFile';
	SteamID = OnlineSubsystemSteamworks(OnlineSub).UniqueNetIdToInt64(PlayerReplicationInfo.UniqueId);
    
    // main mod variables
    Storage.SavedScore = PlayerReplicationInfo.Score;
	Storage.SavedLaw = BZMPRI(PlayerReplicationInfo).Law;
	Storage.SavedWood = BZMPRI(PlayerReplicationInfo).Wood;
	Storage.SavedMetal = BZMPRI(PlayerReplicationInfo).Metal;
	Storage.SavedBounty = BZMPRI(PlayerReplicationInfo).Bounty;
	
	Storage.SavedHealth = Pawn.Health;
	Storage.SavedStamina = AOCPawn(Pawn).Stamina;
	
	// location
	Storage.SavedVectorX = Pawn.Location.X;
	Storage.SavedVectorY = Pawn.Location.Y;
	Storage.SavedVectorZ = Pawn.Location.Z;
	
	Storage.SavedRotatorPitch = Pawn.Rotation.Pitch;
	Storage.SavedRotatorYaw = Pawn.Rotation.Yaw;
	Storage.SavedRotatorRoll = Pawn.Rotation.Roll;
	
	Storage.SavedFaction = CurrentFamilyInfo.FamilyFaction;
	
	// inventory
	Storage.SavedPrimary = AOCPawn(Pawn).PawnInfo.myPrimary;
	Storage.SavedPrimaryAlt = AOCPawn(Pawn).PawnInfo.myAlternatePrimary;
	Storage.SavedSecondary = AOCPawn(Pawn).PawnInfo.mySecondary;
	Storage.SavedTert = AOCPawn(Pawn).PawnInfo.myTertiary;
	
	// appearance
	//Storage.SavedArmor.CharacterMesh = AOCPawn(Pawn).CharacterAssetStore.CharacterMesh;
	//Storage.SavedArmor.DecapMesh = AOCPawn(Pawn).CharacterAssetStore.DecapMesh;
	//Storage.SavedArmor.OwnerMesh = AOCPawn(Pawn).CharacterAssetStore.OwnerMesh;
	//Storage.SavedArmor.BodyMaterial = AOCPawn(Pawn).CharacterAssetStore.BodyMaterial;
	//Storage.SavedArmor.HeadMaterial = AOCPawn(Pawn).CharacterAssetStore.HeadMaterial;
	Storage.SavedCustomization = AOCPawn(Pawn).CustomizationClass;
	Storage.SavedFamily = AOCPawn(Pawn).PawnInfo.myFamily;
	
	//Storage.SavedHelmet = AOCPawn(Pawn).CharacterA
	
	//var SkeletalMesh CharacterMesh;
	//var SkeletalMesh DecapMesh;
	//var SkeletalMesh OwnerMesh;
	//var MaterialInterface BodyMaterial;
	//var MaterialInterface HeadMaterial;
	
	class'Engine'.static.BasicSaveObject(Storage,SteamID$".dat",true,0);
}

// load save game
// ReturnLoadOut
exec function ReturnLoadOut() //reliable server
{
    local LoadOutFile ReturnToPlayer;
	local Vector ReturnLocation;
	local Rotator ReturnRotator;
	local string SteamID;
	
	SteamID = OnlineSubsystemSteamworks(OnlineSub).UniqueNetIdToInt64(PlayerReplicationInfo.UniqueId);	
    ReturnToPlayer = new Class'LoadOutFile';

    if(class'Engine'.static.BasicLoadObject(ReturnToPlayer,SteamID$".dat", true, 0)) //If the server has a loadout saved for this player.
    {
		PlayerReplicationInfo.Score = ReturnToPlayer.SavedScore;
        BZMPRI(PlayerReplicationInfo).Law = ReturnToPlayer.SavedLaw;
        BZMPRI(PlayerReplicationInfo).Wood = ReturnToPlayer.SavedWood;
        BZMPRI(PlayerReplicationInfo).Metal = ReturnToPlayer.SavedMetal;
        BZMPRI(PlayerReplicationInfo).Bounty = ReturnToPlayer.SavedBounty;
        
        Pawn.Health = ReturnToPlayer.SavedHealth;
        AOCPawn(Pawn).Stamina = ReturnToPlayer.SavedStamina;

		CurrentFamilyInfo.FamilyFaction = ReturnToPlayer.SavedFaction;
		
		AOCPawn(Pawn).PawnInfo.myFamily = ReturnToPlayer.SavedFamily;
		AOCPawn(Pawn).CustomizationClass = ReturnToPlayer.SavedCustomization;

		AOCPawn(Pawn).PawnInfo.myPrimary = ReturnToPlayer.SavedPrimary;
		AOCPawn(Pawn).PawnInfo.myAlternatePrimary = ReturnToPlayer.SavedPrimaryAlt;
		AOCPawn(Pawn).PawnInfo.mySecondary = ReturnToPlayer.SavedSecondary;
		AOCPawn(Pawn).PawnInfo.myTertiary = ReturnToPlayer.SavedTert;

		ReturnLocation.X = ReturnToPlayer.SavedVectorX; 
		ReturnLocation.Y = ReturnToPlayer.SavedVectorY;
		ReturnLocation.Z = ReturnToPlayer.SavedVectorZ;		
		ReturnRotator.Pitch = ReturnToPlayer.SavedRotatorPitch;
		ReturnRotator.Yaw = ReturnToPlayer.SavedRotatorYaw;
		ReturnRotator.Roll = ReturnToPlayer.SavedRotatorRoll;

		Pawn.SetLocation(ReturnLocation);
		Pawn.SetRotation(ReturnRotator);
	}
	
	AddDefaultInventory(Pawn);
	
}

// taken from AOCGame
// adddefaultinventory
function AddDefaultInventory( Pawn PlayerPawn )
{
	local AOCWeapon PrimWeapon, SecWeapon, AltWep, TertWeapon;
	PlayerPawn.InvManager.DiscardInventory();
	AOCInventoryManager(PlayerPawn.InvManager).ClearAttachables();
	
//	super.AddDefaultInventory(PlayerPawn);
	if (PlayerPawn == none);
		////`log("PAWN IS NONE");

	PrimWeapon = AOCWeapon(PlayerPawn.CreateInventory(AOCPawn(PlayerPawn).PawnInfo.myPrimary, false)); // store reference here so we can add shield as necessary
	// Check for Alt Mode
	if (PrimWeapon.AlternativeMode != class'AOCWeapon_None')
	{
		if (!PrimWeapon.bAltRequireShield || class<AOCWeapon_Shield>(AOCPawn(PlayerPawn).PawnInfo.myTertiary) != none)
		{
			AltWep = AOCWeapon( PlayerPawn.CreateInventory(PrimWeapon.default.AlternativeMode, true) );
			AltWep.AllowedShieldClass = class<AOCWeapon_Shield>(AOCPawn(PlayerPawn).PawnInfo.myTertiary).default.Shield;
		}

		// Possibility alt weapon is ranged
		if (AOCRangeWeapon(AltWep) != none)
			AOCRangeWeapon(AltWep).RefreshProjectileType();
	}
	
	SecWeapon = AOCWeapon(PlayerPawn.CreateInventory(AOCPawn(PlayerPawn).PawnInfo.mySecondary, true)); // store reference here so we can add shield as necessary
	// Possibility secondary weapon is ranged
	if (AOCRangeWeapon(SecWeapon) != none)
		AOCRangeWeapon(SecWeapon).RefreshProjectileType();

	//`log("SPAWN TERTIARY"@AOCPawn(PlayerPawn).PawnInfo.myTertiary);
	if (class<AOCWeapon_Projectile>(AOCPawn(PlayerPawn).PawnInfo.myTertiary) != none || class<AOCWeapon_ExtraAmmo>(AOCPawn(PlayerPawn).PawnInfo.myTertiary) != none)
	{
		// Assign projectile to the weapon
		AOCRangeWeapon(PrimWeapon).ChangeProjectileType(class<AOCWeapon_Projectile>(AOCPawn(PlayerPawn).PawnInfo.myTertiary).default.Proj);
	}
	else if (class<AOCWeapon_Shield>(AOCPawn(PlayerPawn).PawnInfo.myTertiary) == none)
	{
		TertWeapon = AOCWeapon(PlayerPawn.CreateInventory(AOCPawn(PlayerPawn).PawnInfo.myTertiary, true));
		if (AOCRangeWeapon(TertWeapon) != none)
			AOCRangeWeapon(TertWeapon).RefreshProjectileType();
	}
	else
	{
		if (PrimWeapon.bHaveShield)
		{
			PrimWeapon.AllowedShieldClass = class<AOCWeapon_Shield>(AOCPawn(PlayerPawn).PawnInfo.myTertiary).default.Shield;
		}
		if (SecWeapon.bHaveShield)
			SecWeapon.AllowedShieldClass = class<AOCWeapon_Shield>(AOCPawn(PlayerPawn).PawnInfo.myTertiary).default.Shield;
	}
		////`log("CREATE INV ERROR");
	 AOCWeapon(PlayerPawn.CreateInventory(class'AOCWeapon_Fists', true));

	 if (AOCRangeWeapon(PrimWeapon) != none)
		AOCRangeWeapon(PrimWeapon).RefreshProjectileType();

    //PlayerPawn.AddDefaultInventory();
	//AOCPawn(PlayerPawn).NotifyAttachmentsChanged();
}

defaultproperties
{
    CustomizationClass=class'BZMCustomization'
    
    //ThirdPersonCameraPositions(0)=(X=130.0000, Y=38.0000, Z=-6.0000)
	//ThirdPersonCameraPositions(1)=(X=80.0000, Y=0.0000, Z=20.0000)
	//ThirdPersonCameraPositions(2)=(X=130.0000, Y=-18.0000, Z=-7.0000)
}
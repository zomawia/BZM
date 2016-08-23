/*
* Lets one buy stuff. If it's not connected to a CMWMutator_SpecialCustomScoring mutator, 
* this takes Score to use; otherwise, it takes CMWMutator_SpecialCustomScoring's Score 
*/
class BZMSpecialCustomScoring_PurchaseBox extends SkeletalMeshActor
	implements(IAOCUsable)
	implements(IAOCInformationBoxDisplayer)
	dependson(AOCBaseHUD)
	placeable;

/* Localization key for the title when user has enough points to make purchase (in Shipping, if localization can't happen, will just show this as the title string) */
var(Strings) string CanBuyTitleLocKey;
/* Localization key for the description when user has enough points to make purchase (in Shipping, if localization can't happen, will just show this as the title string) */
var(Strings) string CanBuyDescriptionLocKey;

/* Localization key for the title when user doesn't have enough points to make purchase (in Shipping, if localization can't happen, will just show this as the title string) */
var(Strings) string CannotBuyTitleLocKey;
/* Localization key for the description when user doesn't have enough points to make purchase (in Shipping, if localization can't happen, will just show this as the title string) */
var(Strings) string CannotBuyDescriptionLocKey;

var(Strings) string LocSection;
var(Strings) string LocPackage;

/* How many points this costs to use */
var(Purchase) int Cost;

/* A CMWMutator_SpecialCustomScoring to take points from; if none specified, uses Score instead */
var(Purchase) CMWMutator_SpecialCustomScoring Mutator;

var(Purchase) EAOCFaction       AllowedFaction;

var repnotify string MutatorStringName;
var CMWSpecialCustomScoring_ReplicationInfo LocalPlayerScoreRI;

replication
{
	if(Role == ROLE_Authority && (bNetDirty || bNetInitial))
		MutatorStringName;
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	if(Mutator != none)
	{
		MutatorStringName = String(Mutator);
		bNetDirty = true;
	}
	
	if(WorldInfo.Netmode != NM_DedicatedServer && MutatorStringName != "")
	{
		CacheLocalScoreRI();
	}
}

simulated event ReplicatedEvent(name VarName)
{
	super.ReplicatedEvent(VarName);

	if(VarName == 'MutatorStringName')
	{
		CacheLocalScoreRI();
	}
}

//Cache the local ScoreRI so we don't have to fetch it all the time (i.e. so we don't need to iterate over DynamicActors constantly, because that's slow)
function CacheLocalScoreRI()
{
	local CMWSpecialCustomScoring_ReplicationInfo TestScoreRI;
	local PlayerReplicationInfo LocalPRI;

	if(Worldinfo.Netmode == NM_DedicatedServer)
	{
		return;
	}

	LocalPRI = GetALocalPlayerController().PlayerReplicationInfo;

	foreach WorldInfo.DynamicActors(class'CMWSpecialCustomScoring_ReplicationInfo', TestScoreRI)
	{
		if(TestScoreRI.OwnerPRI == LocalPRI)
		{
			LocalPlayerScoreRI = TestScoreRI;
		}
	}
}

function bool UtilizeObject(AOCPawn User, bool bUseDrop, optional name BoneHit = 'none')
{
	if (CanBeUsed(User.PawnFamily.FamilyFaction, User))
	{
		if(Mutator != none)
		{
			Mutator.ChangePlayerScore(User.Controller, -1 * Cost, true);
			ActivatePurchaseEvents(User.Controller);
		}
		else
		{
			User.Controller.PlayerReplicationInfo.Score -= Cost;
			ActivatePurchaseEvents(User.Controller);
		}
	}

	return false;
}

simulated function bool CanBeUsed(optional int Faction = EFAC_ALL, optional AOCPawn CheckUser, optional out int bHold)
{
	local bool bCorrectTeam;

	if(Faction == EFAC_All && CheckUser != none)
	{
		Faction = CheckUser.PawnFamily.FamilyFaction;
	}

	bCorrectTeam = Faction == EFAC_ALL || AllowedFaction == EFAC_ALL || AllowedFaction == Faction;

	return bCorrectTeam && PlayerHasSufficientPoints(CheckUser.Controller);
}

simulated function bool PlayerHasSufficientPoints(Controller User)
{
	if(User == none)
	{
		return false;
	}
	else
	{
		return Cost <= 0 || GetPlayerPoints(User) >= Cost;
	}
}

simulated function int GetPlayerPoints(Controller User)
{
	if(Worldinfo.NetMode == NM_DedicatedServer || Worldinfo.NetMode == NM_ListenServer)
	{
		if(Mutator != none)
		{
			return Mutator.GetPlayerScore(User);
		}
		else
		{
			return User.PlayerReplicationInfo.Score;
		}
	}
	else
	{
		if(LocalPlayerScoreRI == none && MutatorStringName != "")
		{
			CacheLocalScoreRI();
		}

		if(MutatorStringName != "")
		{
			if(LocalPlayerScoreRI != none)
			{
				return LocalPlayerScoreRI.Score;
			}
			else
			{
				return 0;
			}
		}
		else
		{
			return User.PlayerReplicationInfo.Score;
		}
	}
}



simulated function bool GetInformationBoxText(Controller User, out string OutTitle, out string OutText, out ECrosshairInfoType OutType)
{
	local bool bCorrectTeam;
	bCorrectTeam = AllowedFaction == EFAC_ALL || AllowedFaction == User.PlayerReplicationInfo.Team.TeamIndex;

	if(bCorrectTeam)
	{
		if(PlayerHasSufficientPoints(User))
		{
			OutTitle = LocalizeAndFillString(CanBuyTitleLocKey, User);
			if(CanBuyDescriptionLocKey != "")
			{
				OutText = LocalizeAndFillString(CanBuyDescriptionLocKey, User);
				OutType = EXHAIRINFO_BoxWithUse;
			}
			else
			{
				OutType = EXHAIRINFO_Use;
			}
		}
		else
		{
			OutTitle = LocalizeAndFillString(CannotBuyTitleLocKey, User);
			if(CanBuyDescriptionLocKey != "")
			{
				OutText = LocalizeAndFillString(CannotBuyDescriptionLocKey, User);
				OutType = EXHAIRINFO_Box;
			}
			else
			{
				OutType = EXHAIRINFO_Use;
			}
		}

		return true;
	}
	else //(bCorrectTeam)
	{
		return false;
	}
}

function ActivatePurchaseEvents(Controller Purchaser)
{
	local CMWSeqEvent_PurchaseBoxPurchased PurchaseEvent;
	local int Idx;

	for (Idx = 0; Idx < GeneratedEvents.Length; Idx++)
	{
		PurchaseEvent = CMWSeqEvent_PurchaseBoxPurchased(GeneratedEvents[Idx]);
		if (PurchaseEvent != None &&
			PurchaseEvent.CheckActivate(self,Purchaser))
		{
		}
	}
}

//Localize a string and fill in the placeholders, {COST} and {CURRPOINTS}
simulated function String LocalizeAndFillString(String LocKey, optional Controller User)
{
	local string Text;

	Text = Localize(LocSection, LocKey, LocPackage);
	Text = Repl(Text, "{COST}", Cost, false);
	if(User != none)
	{
		Text = Repl(Text, "{CURRPOINTS}", GetPlayerPoints(User), false);
	}

	return Text;
}

simulated function EndUtilizeObject(AOCPawn User)
{
}

DefaultProperties
{
	AllowedFaction=EFAC_ALL
	Begin Object Name=SkeletalMeshComponent0
		SkeletalMesh=SkeletalMesh'CHV_torchpit.Meshes.Sk_Torchpit'
		Animations=AnimNodeSeq0
		bUpdateSkelWhenNotRendered=FALSE
		CollideActors=TRUE //@warning: leave at TRUE until backwards compatibility code is removed (bCollideActors_OldValue, etc)
		BlockActors=TRUE
		BlockZeroExtent=TRUE
		BlockNonZeroExtent=TRUE
		BlockRigidBody=FALSE
		bAcceptsDynamicDecals=true
		bAcceptsDecalsDuringGameplay=true
		bAcceptsDecals=true
		bHasPhysicsAssetInstance=true
		LightEnvironment=MyLightEnvironment
		PhysicsAsset=PhysicsAsset'CHV_torchpit.Meshes.Torchpit_Physics'
		RBChannel=RBCC_GameplayPhysics
		RBCollideWithChannels=(Default=TRUE,BlockingVolume=TRUE,GameplayPhysics=TRUE,EffectPhysics=TRUE)
	End Object

	Physics=PHYS_None
	bEdShouldSnap=TRUE
	bCollideActors=true
	bBlockActors=true
	bWorldGeometry=true
	bCollideWorld=true
	bNoDelete=true

	SupportedEvents.Add(class'CMWSeqEvent_PurchaseBoxPurchased')

	CanBuyTitleLocKey="Purchase!"
	CanBuyDescriptionLocKey="Best thing ever.\nCost: {COST}\nYour balance: {CURRPOINTS}"
	CannotBuyTitleLocKey="Not enough points to buy!"
	CannotBuyDescriptionLocKey="Best thing ever.\nCost: {COST}\nYour balance: {CURRPOINTS}"
}

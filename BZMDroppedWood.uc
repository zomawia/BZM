/**
* Wood can be pickup  
* Code copied from DroppedWeapon
*/


class BZMDroppedWood extends KActorSpawnable
	implements(IAOCUsable)
	implements(IAOCInformationBoxDisplayer)
	dependson(AOCBaseHUD)
	dependson(BZMGame);

var Vector MeshScale;
var StaticMesh WoodStaticMesh;
var bool bInitialized;

var string Description;
var int WoodDropAmount;

var bool bCanBeUsed;
var	float SecondsToReuse;

event Tick(float DeltaTime)
{
	if(!bInitialized && WoodStaticMesh != none)
	{
		bInitialized = true;

		SetStaticMesh(WoodStaticMesh, , , MeshScale);
		SetPhysicalCollisionProperties();

		reset();
		Initialize();

		TossWeapon();		
		bTearOff = true;
	}
	
	super.Tick(DeltaTime);
}

simulated function Initialize()
{
	super.Initialize();
	SetPhysics(PHYS_Falling);
}

simulated function SetMeshAndInitialize(int Amount)
{
	MeshScale = 0.15 * vect(1,1,1);
	//WoodStaticMesh = StaticMesh'CHV_Forest_Props.Meshes.Logs.SM_DF_Log_Pile3';
	self.WoodDropAmount = Amount;
	bInitialized = false;	
}

function bool UtilizeObject(AOCPawn User, bool bUseDrop, optional name BoneHit = 'none')
{	
	//local bool bWasUsed;
	//
	//bWasUsed = true;
	local Controller PC;
	
	if (bCanBeUsed)
	{
		if(User != none)
		{									
			BZMPawn(User).AddWood(WoodDropAmount);
			PC = User.Controller;
			AOCPlayerController(PC).ReceiveChatMessage("You picked up " $ WoodDropAmount $ " Wood", 4, true);			
			Shutdown();
		}
		
	}
	
	else
	{
		AOCGame(WorldInfo.Game).LocalizedPrivateMessage(PlayerController(User.Controller), 0,
			class'AOCSystemMessages'.static.CreateLocalizationdata("INVALIDDATA", string(int(GetTimerRate('AllowReuse') - GetTimerCount('AllowReuse'))), ""));
	}
	
	return false;
}



simulated function bool GetInformationBoxText(Controller User, out string OutTitle, out string OutText, out ECrosshairInfoType OutType)
{
	if(CanBeUsed(User.PlayerReplicationInfo.Team.TeamIndex, AOCPawn(User.Pawn)))
	{
		OutType = EXHAIRINFO_Use;
		OutTitle = Description;
		OutText = Description;
	}
	else
	{
		return false;
	}
}

simulated function bool CanBeUsed(optional int Faction, optional AOCPawn CheckUser, optional out int bHold)
{
	return true;
}

simulated function TossWeapon()
{
	local Vector TossVector;

	TossVector.X = 90 * ( FRand() - FRand() );
	TossVector.Y = 90 * ( FRand() - FRand() );
	TossVector.Z = 90 * ( FRand() - FRand() );
	CollisionComponent.SetRBAngularVelocity(TossVector);

	TossVector.X = 200 * ( FRand() - FRand() );
	TossVector.Y = 200 * ( FRand() - FRand() );
	TossVector.Z = 140 * FRand();
	CollisionComponent.SetRBLinearVelocity(TossVector);

}

event ApplyImpulse( Vector ImpulseDir, float ImpulseMag, Vector HitLocation, optional TraceHitInfo HitInfo, optional class<DamageType> DamageType )
{
}

simulated event ShutDown()
{
	//ScriptTrace();
	super.ShutDown();
}

simulated event Attach(Actor Other)
{
	//ScriptTrace();
	super.Attach(Other);
}

simulated function EndUtilizeObject(AOCPawn User)
{
}

function AllowReuse()
{
	bCanBeUsed = false;
}


DefaultProperties
{
	bWakeOnLevelStart=true	
	bCanBeUsed=true
	bCollideWorld=true
	bCollideActors=false

	bTearOff = true //never ever has to exist on the server

	LifeSpan = 180
	SecondsToReuse=35.0f
	
	TickGroup=TG_PostAsyncWork
	bInitialized = false
	
	Description = "log"

	WoodStaticMesh=StaticMesh'CHV_Forest_Props.Meshes.Logs.SM_DF_Log_Pile3'
}
/**
* Weapon can be pickup  
*/


class BZMDroppedWeapon extends KActorSpawnable
	implements(IAOCUsable)
	implements(IAOCInformationBoxDisplayer)
	dependson(AOCBaseHUD)
	dependson(BZMGame);

var Vector MeshScale;
var StaticMesh WeaponStaticMesh;
var SkeletalMesh WeaponSkeletalMesh;
var bool bInitialized;

var class<AOCWeaponAttachment> WeaponAssetStore;
var() class<AOCWeapon> WeaponToEquip;

var string Description;
var int WeaponSlot;

var bool bCanBeUsed;
var	float SecondsToReuse;

event Tick(float DeltaTime)
{
	if(!bInitialized && WeaponStaticMesh != none)
	{
		bInitialized = true;

		SetStaticMesh(WeaponStaticMesh, , , MeshScale);
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
	//SetPhysics(PHYS_Falling);
	//SetCollision(false, false, false);
}

simulated function SetMeshAndInitialize(StaticMesh myWeaponStaticMesh, float Scale, SkeletalMesh myWeaponSkeletalMesh)
{
	// 1.5 Scaling included for character scale
	MeshScale = 1.5 * Scale * vect(1,1,1);
	self.WeaponStaticMesh = myWeaponStaticMesh;
	self.WeaponSkeletalMesh = myWeaponSkeletalMesh;
	bInitialized = false;
}

simulated function StoreAssets(class<AOCWeaponAttachment> StoreWeapon, class<AOCWeapon> WeaponEquip, int Slot)
{
	self.WeaponAssetStore = StoreWeapon;
	self.WeaponToEquip = WeaponEquip;
	self.WeaponSlot = Slot;
}

function bool UtilizeObject(AOCPawn User, bool bUseDrop, optional name BoneHit = 'none')
{	
	//local bool bWasUsed;
	
	//bWasUsed = true;
	
	if (bCanBeUsed)
	{
		if(User != none)
		{
			if(WeaponSlot == 1)
			{
				User.PawnInfo.myPrimary = WeaponToEquip;
				User.PawnInfo.myAlternatePrimary = WeaponToEquip.default.AlternativeMode;			
			}
			if(WeaponSlot == 2)
			{
				User.PawnInfo.mySecondary = WeaponToEquip;
			}
			if(WeaponSlot == 3)
			{
				User.PawnInfo.myTertiary = WeaponToEquip;
			}
							
			AddDefaultInventory(User);
			User.RefreshPawnClass();
			Shutdown();
		}
		
	}
	
	//else
	//{
		//AOCGame(WorldInfo.Game).LocalizedPrivateMessage(PlayerController(User.Controller), 0,
			//class'AOCSystemMessages'.static.CreateLocalizationdata("INVALIDDATA", string(int(GetTimerRate('AllowReuse') - GetTimerCount('AllowReuse'))), ""));
	//}
	
	return false;
}

// taken from AOCGame
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
	bCanBeUsed = true;
}


DefaultProperties
{
	Begin Object Name=StaticMeshComponent0
		WireframeColor=(R=0,G=255,B=128,A=255)
		BlockRigidBody=true
		Scale=1
		bNotifyRigidBodyCollision=false
		HiddenGame=false 
        CollideActors=true
        BlockActors=false
        AlwaysCheckCollision=true
        ScriptRigidBodyCollisionThreshold=0.001
		RBChannel=RBCC_NOTHING
		RBCollideWithChannels=(default=TRUE,GameplayPhysics=TRUE,EffectPhysics=TRUE,Pawn=FALSE,DeadPawn=FALSE)	
	End Object

	bWakeOnLevelStart=true	
	bCanBeUsed=true
	bCollideWorld=true
	bTearOff = true //never ever has to exist on the server

	LifeSpan = 180
	SecondsToReuse=35.0f
	
	TickGroup=TG_PostAsyncWork
	bInitialized = false
	
	Description = "A fallen person's weapon of choice."
}
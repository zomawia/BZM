//BZM Pawn

class BZMPawn extends AOCPawn;

var bool bPrevBleedOut;

var() AnimationInfo RevivePawn;
var() AnimationInfo PawnRevived;

var float fLawScale;

	//Executions are disabled, so we don't need these:
	//bEndExecution bIsExecutable, bNoPlayDeathAnimation,

//AddWood
// adds wood
simulated function AddWood(int Amount)
{
	BZMPRI(Controller.PlayerReplicationInfo).Wood += Amount;
}

// DropWeaponOnDeath 
// more like drop inventory now
simulated function DropWeaponOnDeath()
{
	local BZMDroppedWeapon DroppedWeapon;
	local BZMDroppedWood DroppedWood;
	local AOCDroppedWeapon DroppedShield;
	local Vector WeaponSocketWorldLocation;
	local Rotator WeaponSocketWorldRotation;
	local AssetStore_AOCPawn_Weapon WeaponAssetStore;
	local class<AOCWeapon> WeaponEquipped;
	local int WeaponSlot;

	//Held weapons
	if(CurrentWeaponAttachment != none)
	{
		if(CurrentWeaponAttachment.Class == PawnInfo.myPrimary.default.AttachmentClass
			|| CurrentWeaponAttachment.Class == PawnInfo.myAlternatePrimary.default.AttachmentClass)
		{
			WeaponAssetStore = PrimaryWeaponAssetStore;
			WeaponEquipped = PawnInfo.myPrimary;
			WeaponSlot = 1;
		}
		else if(CurrentWeaponAttachment.Class == PawnInfo.mySecondary.default.AttachmentClass)
		{
			WeaponAssetStore = SecondaryWeaponAssetStore;
			WeaponEquipped = PawnInfo.mySecondary;
			WeaponSlot = 2;
		}
		else if(CurrentWeaponAttachment.Class == PawnInfo.mySecondary.default.AttachmentClass)
		{
			WeaponAssetStore = TertiaryWeaponAssetStore;
			WeaponEquipped = PawnInfo.mySecondary;
			WeaponSlot = 3;
		}
	}

	// Drop weapon if pawn is dead
	if ( WeaponAssetStore != none && WeaponAssetStore.StaticMesh != none )
	{
		Mesh.GetSocketWorldLocationAndRotation(class<AOCWeaponAttachment>(CurrentWeaponAttachment.Class).default.WeaponSocket, WeaponSocketWorldLocation, WeaponSocketWorldRotation);
		WeaponSocketWorldLocation.Z += 150;
					
		DroppedWeapon = Spawn(class'BZMDroppedWeapon', self, , WeaponSocketWorldLocation, WeaponSocketWorldRotation);
		DroppedWeapon.SetMeshAndInitialize(WeaponAssetStore.StaticMesh, class<AOCWeaponAttachment>(CurrentWeaponAttachment.Class).default.WeaponStaticMeshScale, WeaponAssetStore.SkeletalMesh);
		
		// store weapon information to dropped weapon
		DroppedWeapon.StoreAssets(class<AOCWeaponAttachment>(CurrentWeaponAttachment.Class), WeaponEquipped, WeaponSlot);
	}
	
	// Wood Drops
	if (BZMPRI(Controller.PlayerReplicationInfo).Wood > 0)
	{
		DroppedWood = Spawn(class'BZMDroppedWood', self, , WeaponSocketWorldLocation * 1.1, WeaponSocketWorldRotation);
		DroppedWood.SetMeshAndInitialize(BZMPRI(Controller.PlayerReplicationInfo).Wood);
		BZMPRI(Controller.PlayerReplicationInfo).Wood = 0;
	
	}

	//`log("CHECK CHECK"@bEquipShield@AllowedShieldClass.default.InventoryAttachmentClass[AOCPawn(P).PawnFamily.FamilyFaction].default.StaticMeshSpawn);
	if (StateVariables.bShieldEquipped)
	{
		DroppedShield = Spawn(class'AOCDroppedWeapon', self, , Location + Vect(0.f, 0.f, 30.f), WeaponSocketWorldRotation);
		DroppedShield.SetMeshAndInitialize(class<AOCWeapon_Shield>(TertiaryWeapon).default.Shield.default.InventoryAttachmentClass[PawnFamily.FamilyFaction].default.StaticMeshSpawn , 1.f);

		SetCustomizationForMeshComponent(DroppedShield.StaticMeshComponent, false);
		DroppedShield.StaticMeshComponent.SetMaterial(0, ShieldMesh.GetMaterial(0));
	}	
}

// WeaponAttachmentChanged
simulated function WeaponAttachmentChanged()
{
	local MaterialInstanceConstant ShieldMIC;
	local int TeamID;

	//if(IsLocallyControlled() && IsWeaponSwitchAFullSwitch(class<AOCWeaponAttachment>(CurrentWeaponAttachment.Class), class<AOCWeaponAttachment>(CurrentWeaponAttachmentClass)))
	//{
		//`LogAnalyticsGameStringStat(PLAYER_WEAPON_CHANGE, String(Weapon.Class));
	//}

	TeamID = GetCustomizationFactionFromActualFaction(PawnFamily.FamilyFaction);

	//`log("WEAPON ATTACHMENT CHANGED"@CurrentWeaponAttachment@CurrentWeaponAttachment.Class@CurrentWeaponAttachmentClass@IsWeaponSwitchAFullSwitch(class<AOCWeaponAttachment>(CurrentWeaponAttachment.Class), class<AOCWeaponAttachment>(CurrentWeaponAttachmentClass)));
	if ((CurrentWeaponAttachment == None || CurrentWeaponAttachment.Class != CurrentWeaponAttachmentClass) && Mesh.SkeletalMesh != None)
	{
		// Change Inventory Attachment too on the server so it gets replicated
		if (Role == ROLE_Authority)
		{
			// Check which weapon we're equipping and remove it from inventory attachment
			if (PreviousWeapon == PrimaryWeapon)
				AttachedItems[0] = PrimaryWeapon.default.InventoryAttachmentClass;
			else if (PreviousWeapon == SecondaryWeapon)
				AttachedItems[1] = SecondaryWeapon.default.InventoryAttachmentClass;
			else if (PreviousWeapon == TertiaryWeapon && Pavise == none)
				AttachedItems[2] = TertiaryWeapon.default.InventoryAttachmentClass;

			if (CurrentWeaponAttachmentClass.default.WeaponClass == PrimaryWeapon)
				AttachedItems[0] = none;
			else if (CurrentWeaponAttachmentClass.default.WeaponClass == PrimaryWeapon.default.AlternativeMode)
				AttachedItems[0] = none;
			else if (CurrentWeaponAttachmentClass.default.WeaponClass == SecondaryWeapon)
				AttachedItems[1] = none;
			else if (CurrentWeaponAttachmentClass.default.WeaponClass == TertiaryWeapon)
				AttachedItems[2] = none;

			HandleReplicatedInventoryAttachment();
		}

		// Detach/Destroy the current attachment if we have one
		if (CurrentWeaponAttachment!=None)
		{
			if(AOCWeaponAttachment_PaviseShield(CurrentWeaponAttachment) != none)
			{
				PaviseMaterial = CurrentWeaponAttachment.Mesh.GetMaterial(0);
			}

			// Check to drop weapon here
			if (Health <= 0 || IsInState('Dying') || ReplicatedHitInfo.bWasKilled || IsInState('Kneeling'))
				DropWeaponOnDeath();
			CurrentWeaponAttachment.DetachFrom(Mesh);
			CurrentWeaponAttachment.Destroy();
		}

		// Create the new Attachment.
		if (CurrentWeaponAttachmentClass!=None)
		{
			if (bIsMirror && class<AOCWeaponAttachment>(CurrentWeaponAttachmentClass).default.MirroredAttachment != none)
			{
				CurrentWeaponAttachmentClass = class<AOCWeaponAttachment>(CurrentWeaponAttachmentClass).default.MirroredAttachment;
			}

			CurrentWeaponAttachment = Spawn(CurrentWeaponAttachmentClass,self);
			CurrentWeaponAttachment.Instigator = self;
		}
		else
			CurrentWeaponAttachment = none;

		// Get attachment mesh if weapon is ranged
		if (class<AOCRangeWeapon>(CurrentWeaponAttachment.WeaponClass) != none)
		{
			if (class<AOCWeapon_Projectile>(PawnInfo.myTertiary) != none)
			{
				AOCWeaponAttachment(CurrentWeaponAttachment).ArrowAttachment = class<AOCWeapon_Projectile>(PawnInfo.myTertiary).default.Proj.default.AttachmentMesh;
				AOCWeaponAttachment(CurrentWeaponAttachment).ProjectileClass = class<AOCWeapon_Projectile>(PawnInfo.myTertiary).default.Proj;
			}
			else
			{
				AOCWeaponAttachment(CurrentWeaponAttachment).ArrowAttachment = class<AOCProjectile>(class<AOCRangeWeapon>(CurrentWeaponAttachment.WeaponClass).default.WeaponProjectiles[0]).default.AttachmentMesh;
				AOCWeaponAttachment(CurrentWeaponAttachment).ProjectileClass = class<AOCProjectile>(class<AOCRangeWeapon>(CurrentWeaponAttachment.WeaponClass).default.WeaponProjectiles[0]);
			}
			
		}

		// If all is good, attach it to the Pawn's Mesh.
		if (CurrentWeaponAttachment != None)
		{
			CurrentWeaponAttachment.AttachTo(self);
			CurrentWeaponAttachment.SetSkin(ReplicatedBodyMaterial);
			CurrentWeaponAttachment.ChangeVisibility(bWeaponAttachmentVisible);

			//0000830: Attacks will sometimes not produce tracers after exiting a ballista or catapult
			AOCWeapon(Weapon).AOCWepAttachment = AOCWeaponAttachment(CurrentWeaponAttachment);
		}

		AOCPlayerController(Controller).StatWrapper.AggregatedStats.OnWeaponChanged(
			CurrentWeaponAttachment == none ? EWEP_NULL : class<AOCWeapon>(AOCWeaponAttachment(CurrentWeaponAttachment).WeaponClass).default.CurrentWeaponType
		);

		HandleShieldAttach();
	}

	UpdateWeaponAttachmentSkin();

	// Handle pavise shield customization (while planting)
	if(AOCWeaponAttachment_PaviseShield(CurrentWeaponAttachment) != none)
	{
		if(PawnInfo.myCustomization.Shield != 0)
		{
			CurrentWeaponAttachment.Mesh.SetMaterial(0, PawnInfo.myTertiary.default.InventoryAttachmentClass.default.CustomizationMaterial);
			ShieldMIC = CurrentWeaponAttachment.Mesh.CreateAndSetMaterialInstanceConstant(0);

			ActuallyCustomizeShield(ShieldMIC, TeamID);

			if(CurrentWeaponAttachment.OverlayMesh != none)
			{
				CurrentWeaponAttachment.OverlayMesh.SetMaterial(0, PawnInfo.myTertiary.default.InventoryAttachmentClass.default.CustomizationMaterial);
				ShieldMIC = CurrentWeaponAttachment.OverlayMesh.CreateAndSetMaterialInstanceConstant(0);

				ActuallyCustomizeShield(ShieldMIC, TeamID);
			}
		}
	}
}

// AttackOtherPawn
reliable server function AttackOtherPawn(HitInfo Info, string DamageString, optional bool bCheckParryOnly = false, optional bool bBoxParrySuccess, optional bool bHitShield = false, optional SwingTypeImpactSound LastHit = ESWINGSOUND_Slash, optional bool bQuickKick = false)
{
	local bool bParry;
	local float ActualDamage;
	local bool bSameTeam;
	local bool bFlinch;
	local IAOCAIListener AIList;
	local int i;
	local float Resistance;
	local float GenericDamage;
	local float HitForceMag;
	local PlayerReplicationInfo PRI;
	local bool bOnFire;
	local bool bPassiveBlock;
	local AOCWeaponAttachment HitActorWeaponAttachment;
	local class<AOCWeapon> UsedWeapon;
	local TraceHitInfo THI;
	local bool bEnemyWasBot;
	local bool bWasKilled;

	if (PlayerReplicationInfo == none)
		PRI = Info.PRI;
	else
		PRI = PlayerReplicationInfo;

	Info.PRI = PRI;

	if (!PerformAttackSSSC(Info) && WorldInfo.NetMode != NM_Standalone)
	{
		//`log("SSSC Failure Notice By:"@PRI.PlayerName);
		//`log( self@"performed an illegal move directed at"@Info.HitActor$".");
		//`log("Attack Information:");
		//`log("My Location:"@Location$"; Hit Location"@Info.HitLocation);
		//`log("Attack Type:"@Info.AttackType@Info.DamageType);
		//`log("Hit Damage:"@Info.HitDamage);
		//`log("Hit Component:"@Info.HitComp);
		//`log("Hit Bone:"@Info.BoneName);
		//`log("Current Weapon State:"@Weapon.GetStateName());
		return;
	}

	if (Info.UsedWeapon == 0)
	{
		UsedWeapon = PrimaryWeapon;
	}
	else if (Info.UsedWeapon == 1)
	{
		UsedWeapon = SecondaryWeapon;
	}
	else
	{
		UsedWeapon = TertiaryWeapon;
	}

	HitActorWeaponAttachment = AOCWeaponAttachment(Info.HitActor.CurrentWeaponAttachment);

	bSameTeam = IsOnSameTeam(self, Info.HitActor);

	bParry = false;
	bFlinch = false;

	//if(AOCPlayerController(Info.HitActor.Controller).bBoxParrySystem)
	//{
		bParry = bBoxParrySuccess && (Info.HitActor.StateVariables.bIsParrying || Info.HitActor.StateVariables.bIsActiveShielding) && class<AOCDmgType_Generic>(Info.DamageType) == none 
			&& Info.DamageType != class'AOCDmgType_SiegeWeapon';

		// Check if fists...fists can only blocks fists
		if (AOCWeapon_Fists(Info.HitActor.Weapon) != none && class<AOCDmgType_Fists>(Info.DamageType) == none)
			bParry = false;

		if(bParry)
		{
			DetectSuccessfulParry(Info, i, bCheckParryOnly, 0);
		}
	//}
	//else
	//{
	//	// check if the other pawn is parrying or active shielding
	//	if (!Info.HitActor.bPlayedDeath && (Info.HitActor.StateVariables.bIsParrying || Info.HitActor.StateVariables.bIsActiveShielding) && class<AOCDmgType_Generic>(Info.DamageType) != none)
	//	{
	//		bParry = ParryDetectionBonusAngles(Info, bCheckParryOnly);
	//	}
	//}

	if (Info.DamageType.default.bIsProjectile)
		AOCPRI(PlayerReplicationInfo).NumHits += 1;
	
	bPassiveBlock = false;
	if ( bHitShield && Info.DamageType.default.bIsProjectile)
	{
		// Check for passive shield block
		bParry = true;
		Info.HitDamage = 0.0f;
		bPassiveBlock = !Info.HitActor.StateVariables.bIsActiveShielding;
	}

	if (bCheckParryOnly)
		return;
	//`log("SUCCESSFUL ATTACK OTHER PAWN HERE ("@self@Role@")->"@Info.HitActor);
	// Play hit sound
	AOCWeaponAttachment(CurrentWeaponAttachment).LastSwingType = LastHit;
	if(!bParry)
	{
		Info.HitActor.OnActionFailed(EACT_Block);
		Info.HitSound = AOCWeaponAttachment(CurrentWeaponAttachment).PlayHitPawnSound(Info.HitActor);
	}
	else        
		Info.HitSound = AOCWeaponAttachment(CurrentWeaponAttachment).PlayHitPawnSound(Info.HitActor, true);
	
	if (AOCMeleeWeapon(Info.Instigator.Weapon) != none)
	{
		AOCMeleeWeapon(Info.Instigator.Weapon).bHitPawn = true;
	}

	// Less damage for quick kick
	if (bQuickKick)
	{
		Info.HitDamage = 3;
	}

	ActualDamage = Info.HitDamage;
	GenericDamage = Info.HitDamage * Info.DamageType.default.DamageType[EDMG_Generic];
	ActualDamage -= GenericDamage; //Generic damage is unaffected by resistances etc.

	//Backstab damage for melee damage
	if (!CheckOtherPawnFacingMe(Info.HitActor) && !Info.DamageType.default.bIsProjectile)
		ActualDamage *= PawnFamily.fBackstabModifier;

	// Vanguard Aggression
	//ActualDamage *= PawnFamily.fComboAggressionBonus ** Info.HitCombo;
	
	// make the other pawn take damage, the push back should be handled here too
	//Damage = HitDamage * LocationModifier * Resistances
	if (Info.UsedWeapon == 0 && AOCWeapon_Crossbow(Weapon) != none && Info.DamageType.default.bIsProjectile)
	{
		ActualDamage *= Info.HitActor.PawnFamily.CrossbowLocationModifiers[GetBoneLocation(Info.BoneName)];
	}
	else
	{
		ActualDamage *= (Info.DamageType.default.bIsProjectile ? Info.HitActor.PawnFamily.ProjectileLocationModifiers[GetBoneLocation(Info.BoneName)] : 
			Info.HitActor.PawnFamily.LocationModifiers[GetBoneLocation(Info.BoneName)]);
	}
		                                                           
	Resistance = 0;
	
	for( i = 0; i < ArrayCount(Info.DamageType.default.DamageType); i++)
	{
		Resistance += Info.DamageType.default.DamageType[i] * Info.HitActor.PawnFamily.DamageResistances[i];
	}
	
	ActualDamage *= Resistance;

	//if (PawnFamily.FamilyFaction == Info.HitActor.PawnFamily.FamilyFaction)
		//ActualDamage *= AOCGame(WorldInfo.Game).fTeamDamagePercent;
		
	ActualDamage += GenericDamage;
		
	//Damage calculations should be done now; round it to nearest whole number
	ActualDamage = float(Round(ActualDamage));

	//`log("ATTACK OTHER PAWN"@ActualDamage);
	// Successful parry but stamina got too low!
	if (bParry && !bPassiveBlock && Info.HitActor.Stamina <= 0)
	{
		bFlinch = true;
		AOCWeapon(Info.HitActor.Weapon).ActivateFlinch(true, Info.HitActor.GetHitDirection(Location), true, true, AOCWeapon(Weapon).bTwoHander); 
	}
	// if the other pawn is currently attacking, we just conducted a counter-attack
	if (Info.AttackType == Attack_Shove && !bParry && !Info.HitActor.StateVariables.bIsSprintAttack)
	{
		// kick should activate flinch and take away 10 stamina
		//if (!bSameTeam)
		//{
			bFlinch = true;
			AOCWeapon(Info.HitActor.Weapon).ActivateFlinch(true, Info.HitActor.GetHitDirection(Location),true, Info.HitActor.StateVariables.bIsActiveShielding && !bQuickKick, false);
		//}
		Info.HitActor.ConsumeStamina(10);
		if (Info.HitActor.StateVariables.bIsActiveShielding && Info.HitActor.Stamina <= 0)
		{
			Info.HitActor.ConsumeStamina(-30.f);
		}
	}
	else if (Info.AttackType == Attack_Sprint)
	{
		bFlinch = true;
		AOCWeapon(Info.HitActor.Weapon).ActivateFlinch(true, Info.HitActor.GetHitDirection(Location), true, false, AOCWeapon(Weapon).bTwoHander); // sprint attack should daze
	}
	else if ((Info.HitActor.StateVariables.bIsParrying || Info.HitActor.StateVariables.bIsActiveShielding) && !bParry)
	{
		bFlinch = true;
		AOCWeapon(Info.HitActor.Weapon).ActivateFlinch(true, Info.HitActor.GetHitDirection(Location), class<AOCDmgType_Generic>(Info.DamageType) != none
			, class<AOCDmgType_Generic>(Info.DamageType) != none, AOCWeapon(Weapon).bTwoHander);
	}
	else if (ShouldActivateFlinch(Info, UsedWeapon) && !bParry)
	{
		AOCWeapon(Info.HitActor.Weapon).ActivateFlinch(true, Info.HitActor.GetHitDirection(Location), false, false, AOCWeapon(Weapon).bTwoHander);
	}
	else if (!bParry) // cause the other pawn to play the hit animation
	{
		AOCWeapon(Info.HitActor.Weapon).ActivateHitAnim(Info.HitActor.GetHitDirection(Location, false, true), bSameTeam);
	}

	// GOD MODE - TODO: REMOVE
	if (Info.HitActor.bInfiniteHealth)
		ActualDamage = 0.0f;

	if (ActualDamage > 0.0f)
	{
		Info.HitActor.SetHitDebuff();
		LastAttackedBy = Info.Instigator;
		PauseHealthRegeneration();
		Info.HitActor.PauseHealthRegeneration();
		Info.HitActor.DisableSprint(true);	
		Info.HitActor.StartSprintRecovery();

		// play a PING sound if we hit a player when shooting
		if (Info.DamageType.default.bIsProjectile)
			PlayRangedHitSound();
		else
		{
			if(!bSameTeam)
				PlayMeleeHit();
		}

		// Play sounds for everyone
		if (Info.HitActor.Health - ActualDamage > 0.0f)
			Info.HitActor.PlayHitSounds(ActualDamage, bFlinch);
		
		//PlayPitcherHitSound(ActualDamage, Info.HitActor.Location);
		if (AOCPlayerController(Controller) != none)
			AOCPlayerController(Controller).PC_SuccessfulHit();

		// Add to assist list if not in it already
		if (Info.HitActor.ContributingDamagers.Find(AOCPRI(PlayerReplicationInfo)) == INDEX_NONE && !bSameTeam)
			Info.HitActor.ContributingDamagers.AddItem(AOCPRI(PlayerReplicationInfo));

		Info.HitActor.LastPawnToHurtYou = Controller;

		//do not set the timer to clear the last pawn to attack value on a duel map...we want players to receive the kill even if the other player
		//  commits suicide by receiving falling damage or trap damage
		if( AOCDuel(WorldInfo.Game) == none || CDWDuel(WorldInfo.Game) == none )
			Info.HitActor.SetTimer(10.f, false, 'ClearLastPawnToAttack');

		if (Info.DamageType.default.bIsProjectile)
		{
			Info.HitActor.StruckByProjectile(self, UsedWeapon);
		}
	}

	
	// Notify Pawn that we hit
	if (AOCMeleeWeapon(Weapon) != none && Info.HitActor.Health - ActualDamage > 0.0f && Info.AttackType != Attack_Shove && Info.AttackType != Attack_Sprint && !bParry)
		AOCMeleeWeapon(Weapon).NotifyHitPawn();

	// pass attack info to be replicated to the clients
	Info.bParry = bParry;
	Info.DamageString = DamageString;
	if (Info.BoneName == 'b_Neck' && !Info.DamageType.default.bIsProjectile && Info.DamageType.default.bCanDecap && Info.AttackType != Attack_Stab)
		Info.DamageString $= "3";
	else if ((Info.BoneName == 'b_Neck' || Info.BoneName == 'b_Head') && Info.DamageType.default.bIsProjectile)
	{
		Info.DamageString $= "4";

		if ( AOCPlayerController(Controller) != none)
			AOCPlayerController(Controller).NotifyAchievementHeadshot();
	}
	else if ((Info.BoneName == 'b_spine_A' || Info.BoneName == 'b_spine_B' || Info.BoneName == 'b_spine_C' || Info.BoneName == 'b_spine_D') && Info.DamageType.default.bIsProjectile)
	{
		if ( AOCPlayerController(Controller) != none)
			AOCPlayerController(Controller).NotifyCupidProgress();
	}
	Info.HitActor.ReplicatedHitInfo = Info;
	Info.HitDamage = ActualDamage;

	Info.HitForce *= int(PawnState != ESTATE_PUSH && PawnState != ESTATE_BATTERING);
	Info.HitForce *= int(!bFlinch);
	HitForceMag = VSize( Info.HitForce );
	Info.HitForce.Z = 0.f;
	Info.HitForce = Normal(Info.HitForce) * HitForceMag;

	// Stat Tracking For Damage
	// TODO: Also sort by weapon
	if (PRI != none)
	{
		if (Info.HitActor.PawnInfo.myFamily.FamilyFaction == EFAC_AGATHA)
		{
			if (PawnInfo.myFamily.FamilyFaction == EFAC_AGATHA)
			{
				// If lawful attack another lawful then minus law rating with scaling (15%) from law
				// Scaling is there so high lawfuls cant slaughter a bunch of people before turning outlaw
				BZMPRI(PRI).Law -= (BZMPRI(PRI).Law * fLawScale) + 10;
			}
			else
			{
				// flat law reduction if outlaw or something else
				BZMPRI(PRI).Law -= 10;
			}
		}
		
		if (!bSameTeam)
		{
			AOCPRI(PRI).EnemyDamageDealt += ActualDamage;			
		}
		else
		{
			if (Info.HitActor.PawnInfo.myFamily.ClassReference != ECLASS_Peasant
				&& Info.HitActor.PlayerReplicationInfo != PRI)
			{
				AOCPRI(PRI).TeamDamageDealt += ActualDamage;
				AOCPlayerController(Controller).TeamDamageDealt += ActualDamage;
			}
		}
		
		AOCPRI(PRI).bForceNetUpdate = TRUE;
	}

	if (Info.HitActor.PlayerReplicationInfo != none)
	{
		AOCPRI(Info.HitActor.PlayerReplicationInfo).DamageTaken += ActualDamage;
		AOCPRI(Info.HitActor.PlayerReplicationInfo).bForceNetUpdate = TRUE;
	}

	//`log("ATTACK OTHER PAWN ("@self@Role@")->"@Info.HitActor@Controller@CurrentSiegeWeapon.Controller);
	bOnFire = Info.HitActor.bIsBurning;

	THI = MakeTraceHitInfoFromHitInfo(Info);
	
	bEnemyWasBot = Info.HitActor.bIsBot || Info.HitActor.PlayerReplicationInfo.bBot || AOCPRI(Info.HitActor.PlayerReplicationInfo).bIsBot || AOCAIController(Info.HitActor.Controller) != none;

	Info.HitActor.TakeDamage(ActualDamage, Controller != none ? Controller : CurrentSiegeWeapon.Controller, Info.HitLocation, Info.HitForce, Info.DamageType, THI);

	bWasKilled = (Info.HitActor == none || Info.HitActor.Health <= 0);
	Info.HitActor.ReplicatedHitInfo.bWasKilled = bWasKilled;

	if (bWasKilled && WorldInfo.NetMode == NM_DedicatedServer)
	{
		// Make sure this wasn't a team kill
		if (AOCPlayerController(Controller).StatWrapper != none
			&& !bSameTeam
			&& Info.UsedWeapon < 2
			&& !bEnemyWasBot)
		{
			AOCPlayerController(Controller).StatWrapper.IncrementKillStats(
				Info.UsedWeapon == 0 ? PrimaryWeapon : SecondaryWeapon, 
				PawnFamily,
				Info.HitActor.PawnFamily,
				class<AOCWeapon>(HitActorWeaponAttachment.WeaponClass)
			);
		}

		// Do another check for a headshot here
		if (Info.BoneName == 'b_Neck' && !Info.DamageType.default.bIsProjectile && Info.DamageType.default.bCanDecap && Info.AttackType != Attack_Stab)
		{
			// Award rotiserie chef achievement on client
			if (AOCPlayerController(Controller) != none && bOnFire)
			{
				AOCPlayerController(Controller).UnlockRotisserieChef();
			}

			// Notify decap
			AOCPlayerController(Controller).NotifyAchievementDecap();
		}

		// Check if fists
		if (class<AOCDmgType_Fists>(Info.DamageType) != none)
		{
			if (AOCPlayerController(Controller) != none)
			{
				AOCPlayerController(Controller).NotifyFistofFuryProgress();
			}
		}
	}

	foreach AICombatInterests(AIList)
	{
		AIList.NotifyPawnPerformSuccessfulAttack(self);
	}
	
	foreach Info.HitActor.AICombatInterests(AIList)
	{
		if (!bParry)
			AIList.NotifyPawnReceiveHit(Info.HitActor,self);
		else
			AIList.NotifyPawnSuccessBlock(Info.HitActor, self);
	}

	// manually do the replication if we're on the standalone
	if (WorldInfo.NetMode == NM_Standalone || Worldinfo.NetMode == NM_ListenServer)
	{
		Info.HitActor.HandlePawnGetHit();
	}
}

//Died
function bool Died(Controller Killer, class<DamageType> DamageType, vector HitLocation)
{
	if (!bPrevBleedOut)
	{
		PlayDying(DamageType, HitLocation);
		return false;
	}
	
	else
		super.Died(Killer, DamageType, HitLocation);
}

// PlayDying
simulated function PlayDying(class<DamageType> DamageType, vector HitLoc)
{	
	if ((bAlreadyRestarted || Health < PawnFamily.fExecutionThreshold * HealthMax || class<AOCDamageType>(DamageType).default.bIsProjectile || Physics != PHYS_Walking )
		&& !bPrevBleedOut)
	{		
		bPrevBleedOut = true;
		PrepareForExecution();		
	}
	else
	{
		PlayerHUDStartIdle();
	
		if(Role != ROLE_Authority)
		{
			return;
		}
	
		if(Executee != none)
		{
			Executee.ExecutorDied();
			Executee = none;	
		}
		
		ChangePawnState(ESTATE_IDLE);
		ActualPlayDying(DamageType, HitLoc);
	}

}

//***********************************************
// Edited Execution stuff
//***********************************************
simulated function PrepareForExecution()
{
	local float Len;
	
	GotoState('Kneeling');
	
	bNoPlayDeathAnimation = true;
	
	SetPhysics(PHYS_NONE); //can't move
	
	// make sure I don't have an active weaponattachment	
	CurrentWeaponAttachmentClass = None;
	WeaponAttachmentChanged();

	PlayHeartbeat(false);
	bAlreadyRestarted= true;
	
	ChangePawnState(ESTATE_EXECUTION);	
	
	if(AOCAIController(Controller) != none)
	{
		AOCAIController(Controller).EnterExecution();	
	}

	if (Role < ROLE_Authority)
		return;
		
	// change to decap
	SwitchToDecapMesh();

	//`log("PLAY EXEC ANIM"@PawnFamily.DropDownToKneeAnim.AnimationName);
	PlayPawnAnimation(PawnFamily.DropDownToKneeAnim,,false);

	// Set Timer to Go to next stage of waiting for the execution
	if (PawnFamily.DropDownToKneeAnim.fAnimationLength == 0.0f)
		Len = Mesh.GetAnimLength(PawnFamily.DropDownToKneeAnim.AnimationName);
	else
		Len = PawnFamily.DropDownToKneeAnim.fAnimationLength;

	SetTimer(Len, false, 'WaitForExecution');
}

simulated function WaitForExecution()
{
	local float Len;
	PlayPawnAnimation(PawnFamily.WaitForExecuteAnim,,false);
	bIsExecutable = true;
	SetPhysics(PHYS_NONE);
	
	// Set Timer to Go to kill off pawn
	Len = 12.0f;

	if (Role == ROLE_Authority)
		SetTimer(Len, false, 'FailedExecution');
}


simulated function FailedExecution()
{	
	bIsExecutable = false;
	Died(LastPawnToHurtyou, ReplicatedHitInfo.DamageType, ReplicatedHitInfo.HitLocation);
	bEndExecution = bNoPlayDeathAnimation;
	DetachFromController();
	ActualPlayDying(ReplicatedHitInfo.DamageType, ReplicatedHitInfo.HitLocation, true, PawnFamily.NoExecuteAnim);
}

simulated function bool UtilizeObject(AOCPawn User, bool bUseDrop, optional name BoneHit = 'none')
{
	if (User.bIsCrouching)
	{
		// to do: ROB person
		S_CheckPerformExecute(User);
		return false;
	}
	
	else
	{
		S_CheckGetHelpedUp(User);

		return false;
	}
}
//***********************************************
// Revive system - modified from Execution system
//***********************************************
reliable server function S_CheckGetHelpedUp(AOCPawn User)
{		
	BZMPawn(User).PerformHelpedUp(RevivePawn, self);
	GetHelpedUp(PawnRevived, BZMPawn(User));
}

simulated function PerformHelpedUp(AnimationInfo Info, BZMPawn other)
{
	local float Len;	
	
	if (Role == ROLE_Authority && WorldInfo.NetMode != NM_STANDALONE && Worldinfo.NetMode != NM_ListenServer)
		PerformHelpedUpClient(Info, other);
		
	Executee = other;
	ChangePawnState(ESTATE_EXECUTION);
		
	SetPhysics(PHYS_NONE); //can't move while helping anim

	PlayPawnAnimation(Info);
	
	ClearTimer('LeaveExecution');
	if (Info.fAnimationLength == 0.0f)
		Len = Mesh.GetAnimLength(Info.AnimationName);
	else 
		Len = Info.fAnimationLength;		
	SetTimer(Len, false, 'LeaveExecution');
}

simulated function LeaveExecution()
{
	ChangePawnState(ESTATE_IDLE);
	Executee = none;
	ManualReset();
	if ( Role == ROLE_Authority )
	{
		SetPhysics(PHYS_Falling);
	}
}

reliable client function PerformHelpedUpClient(AnimationInfo Info, BZMPawn other)
{
	//`log("PERFORM EXECUTION CLIENT"@Info.AnimationName);
	//SetPhysics(PHYS_NONE); //can't move while being helped up
	
	Executee = other;
	
	ChangePawnState(ESTATE_EXECUTION);
	
	PlayPawnAnimation(Info);
}

simulated function GetHelpedUp(AnimationInfo Info, BZMPawn Other)
{
	local float Len;
	
	if (Role == ROLE_Authority && WorldInfo.NetMode != NM_STANDALONE && Worldinfo.NetMode != NM_ListenServer)
		GetHelpedUpClient(Info, other);
	
	bIsExecutable = false; //we're being helped up, we're no longer executable by others
	
	//PlayPawnAnimation(Info);
		
	ClearTimer('WaitForExecution');
	ClearTimer('FailedExecution');
	
	Len = 3.0f;
		
	SetTimer(Len, false, 'HelpedUp');
}

reliable client function GetHelpedUpClient(AnimationInfo Info, BZMPawn Other)
{
	SetPhysics(PHYS_NONE); //can't move while helping anim
	
	ChangePawnState(ESTATE_EXECUTION);
	
	//PlayPawnAnimation(Info);
}

simulated function HelpedUp()
{
	SetPhysics(PHYS_NONE);
	PlayPawnAnimation(PawnRevived);
	SetTimer(2, false, 'PostHelpedUp');
}

simulated function PostHelpedUp()
{
	bAllowGoBackIdleState = true;
	ChangePawnState(ESTATE_IDLE);
	ManualReset();
	Health = 5.0f;
	bPrevBleedOut = true;
	
	if ( Role == ROLE_Authority )
	{
		SetPhysics(PHYS_Falling);
	}
}

// DisplayDebug
simulated function DisplayDebug(HUD HUD, out float out_YL, out float out_YPos)
{
	local Canvas	Canvas;
	
	Super.DisplayDebug(HUD, out_YL, out_YPos);
	
	Canvas = HUD.Canvas;
	Canvas.SetDrawColor(255,255,255);
	
	// showing mod variables for debugging purposes
	Canvas.DrawText("LawRating:"@ BZMPRI(PlayerReplicationInfo).Law);
	out_YPos += out_YL;
	out_YPos += out_YL;
	Canvas.SetPos(4,out_YPos);
	
	Canvas.DrawText("Wood:"@ BZMPRI(PlayerReplicationInfo).Wood);
	out_YPos += out_YL;
	out_YPos += out_YL;
	Canvas.SetPos(4,out_YPos);
	
	Canvas.DrawText("FamilyFaction:"@ BZMPRI(PlayerReplicationInfo).MyFamilyInfo.FamilyFaction);
	out_YPos += out_YL;
	out_YPos += out_YL;
	Canvas.SetPos(4,out_YPos);
	
	Canvas.DrawText("Bounty:"@ BZMPRI(PlayerReplicationInfo).Bounty);
	out_YPos += out_YL;
	out_YPos += out_YL;
	Canvas.SetPos(4,out_YPos);
	
	Canvas.DrawText("Credit:"@ BZMPRI(PlayerReplicationInfo).Credit);
	out_YPos += out_YL;
	out_YPos += out_YL;
	Canvas.SetPos(4,out_YPos);
	
	Canvas.DrawText("bPrevBleedOut:"@ bPrevBleedOut);
	out_YPos += out_YL;
	out_YPos += out_YL;
	Canvas.SetPos(4,out_YPos);	
	
	Canvas.DrawText("WepAttach:"@ AOCWeaponAttachment(CurrentWeaponAttachment).WeaponStaticMesh);
	out_YPos += out_YL;
	out_YPos += out_YL;
	Canvas.SetPos(4,out_YPos);	
}

// override to disable drafting/chase mechanics
simulated function StartDrafting()
{
	//if (IsChasingEnemy())
	//{
		//AddDebuff(false, EDEBF_DRAFT, 1.2f, 2.0f, false);
	//}
	//else
	//{
		//ClearTimer('StartDrafting');
	//}
}

//RegenHealth
function RegenHealth()
{
	super.RegenHealth();
	
	// health regen to full with let person be incapicitated again
	if ((Health >= HealthMax) && (bPrevBleedOut))
	{
		bPrevBleedOut = false;
	}		
}

/** Pause Health Regeneration */
// override to set delay higher
function PauseHealthRegeneration(optional bool bStartTime = true)
{
	if(Role != ROLE_Authority)
	{
		return;
	}
	bCanHealthRegen = false;
	ClearTimer('RegenHealth');
	// should only happen on server...take care of that when calling this function
	ClearTimer('RestartHealthRegen'); // clear any existing timers just in case
	if (bStartTime)
	{
		SetTimer(8.0f, false, 'RestartHealthRegen');
	}
}

defaultproperties
{
	// % for law reduction per hit (current law x LawScale)
	//prevention for high law players going on a killing spree without losing a lot of law
	fLawScale = 0.15f
	
	CustomizationClass=class'BZMCustomization'
	bPrevBleedOut = false
	
	// i think this doesnt work, no variable calls to them...
	bSprintConsumeStamina=true
	iStaminaSprintConsumePerSecond = 2
	
	// hardcoded animations for revive
	RevivePawn=(AnimationName=3p_common_sabotagestart,ComboAnimation=,AssociatedSoundCue=,bFullBody=True,bCombo=False,bLoop=False,bForce=false,UniqueShieldSound=none,fModifiedMovement=0.0,fAnimationLength=0.0,fBlendInTime=0.0,fBlendOutTime=0.00,bLastAnimation=false,fShieldAnimLength=0.0,bUseAltBoneBranch=true)
	PawnRevived=(AnimationName=3p_common_sabotageend,ComboAnimation=,AssociatedSoundCue=,bFullBody=True,bCombo=False,bLoop=False,bForce=false,UniqueShieldSound=none,fModifiedMovement=0.0,fAnimationLength=0.0,fBlendInTime=0.0,fBlendOutTime=0.00,bLastAnimation=false,fShieldAnimLength=0.0,bUseAltBoneBranch=true)
	
	// reduced heal amount / slower heal
	HealAmount = 1.0
	
	//increase stamina regen for now
	StaminaPerSecond = 15
}
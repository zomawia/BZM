/**
* Light Armor - Base for the archer and man at arms meshes
* 
*/
class BZMFamilyInfo_ArmorLight extends BZMFamilyInfo;

DefaultProperties
{
	PrimaryWeapons(0)=class'AOCWeapon_None'
	SecondaryWeapons(0)=class'AOCWeapon_None'	

	PawnArmorType = ARMORTYPE_LIGHT

	AirSpeed=440.0
	WaterSpeed=220.0
	AirControl=0.35
	GroundSpeed=210.0

	ClassReference = ECLASS_ManAtArms

	// damage modifiers
	DamageResistances(EDMG_Swing) = 0.85
	DamageResistances(EDMG_Pierce) = 0.85
	DamageResistances(EDMG_Blunt) = 0.75

	/*
	 *
	 * Formerly in UDKFamilyInfo.ini
	 *
	 */
	AccelRate=700.0
	SprintAccelRate=100.0
	JumpZ=380.0
	SprintModifier=1.55
	SprintTime=10.0
	DodgeSpeed=400.0
	DodgeSpeedZ=200.0
	Health=100
	BACK_MODIFY=0.85
	STRAFE_MODIFY=0.9
	FORWARD_MODIFY=1.0
	CROUCH_MODIFY=0.65
	MaxSprintSpeedTime=2
	bCanDodge=true
	iDodgeCost=20
	iKickCost=20
	fComboAggressionBonus=1.0
	fBackstabModifier=1.0
	iMissMeleeStrikePenalty=10
	iMissMeleeStrikePenaltyBonus=0
	bCanSprintAttack=false
	fStandingSpread=0.05f
	fCrouchingSpread=0.0f
	fWalkingSpread=0.1
	fSprintingSpread=0.25
	fFallingSpread=0.25
	fSpreadPenaltyPerSecond=0.5
	fSpreadRecoveryPerSecond=0.3
}

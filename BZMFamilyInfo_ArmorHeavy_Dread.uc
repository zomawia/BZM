// mason knight dreadnaught
class BZMFamilyInfo_ArmorHeavy_Dread extends BZMFamilyInfo_ArmorHeavy;

defaultproperties
{
	PawnArmorType = ARMORTYPE_HEAVY;

	AirSpeed=440.0
	WaterSpeed=220.0
	AirControl=0.35
	GroundSpeed=175.0

	ClassReference = ECLASS_KNIGHT
	
	// damage modifiers
	DamageResistances(EDMG_Swing) = 0.1
	DamageResistances(EDMG_Pierce) = 0.1
	DamageResistances(EDMG_Blunt) = 0.45
	DamageResistances(EDMG_Chop) = 0.25
	DamageResistances(EDMG_Spike) = 0.15

	/*
	 * 
	 * Formerly in UDKFamilyInfo.ini
	 *
	 */
	AccelRate=400.0
	SprintAccelRate=100.0
	JumpZ=380.0
	SprintModifier=1.8
	SprintTime=10.0
	DodgeSpeed=300.0
	DodgeSpeedZ=150.0
	Health=100
	BACK_MODIFY=0.8
	STRAFE_MODIFY=0.85
	FORWARD_MODIFY=1.0
	CROUCH_MODIFY=0.65
	MaxSprintSpeedTime=5
	bCanDodge=false
	iDodgeCost=60
	iKickCost=25
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
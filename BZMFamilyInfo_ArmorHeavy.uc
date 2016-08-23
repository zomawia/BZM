/**
* Copyright 2010-2012, Torn Banner Studios, All rights reserved
* 
* Original Author: Michael Bao
* 
* Knight.
*/

class BZMFamilyInfo_ArmorHeavy extends BZMFamilyInfo;

DefaultProperties
{
	PawnArmorType = ARMORTYPE_HEAVY;

	AirSpeed=440.0
	WaterSpeed=220.0
	AirControl=0.35
	GroundSpeed=180.0

	ClassReference = ECLASS_KNIGHT
	
	// damage modifiers
	DamageResistances(EDMG_Swing) = 0.4
	DamageResistances(EDMG_Pierce) = 0.5
	DamageResistances(EDMG_Blunt) = 0.61
	DamageResistances(EDMG_Chop) = 0.5
	DamageResistances(EDMG_Spike) = 0.5

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

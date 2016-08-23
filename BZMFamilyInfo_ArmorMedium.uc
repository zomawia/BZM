/**
* Copyright 2010-2013, Torn Banner Studios, All rights reserved
* 
* Original Author: Michael Bao
* 
* Vanguard.
*/
class BZMFamilyInfo_ArmorMedium extends BZMFamilyInfo;

DefaultProperties
{
	
	PawnArmorType = ARMORTYPE_MEDIUM

	AirSpeed=440.0
	WaterSpeed=220.0
	AirControl=0.35
	GroundSpeed=190.0

	ClassReference = ECLASS_Vanguard

	// damage modifiers
	DamageResistances(EDMG_Swing) = 0.6
	DamageResistances(EDMG_Pierce) = 0.8
	DamageResistances(EDMG_Blunt) = 0.7

	/*
	 * 
	 * Formerly in UDKFamilyInfo.ini
	 *
	 */
	AccelRate=500.0
	SprintAccelRate=100.0
	JumpZ=380.0
	SprintModifier=1.65
	SprintTime=10.0
	DodgeSpeed=350.0
	DodgeSpeedZ=150.0
	Health=100
	BACK_MODIFY=0.8
	STRAFE_MODIFY=0.85
	FORWARD_MODIFY=1.0
	CROUCH_MODIFY=0.65
	MaxSprintSpeedTime=3.5
	bCanDodge=true
	iKickCost=25
	iDodgeCost=50
	fComboAggressionBonus=1.0
	fBackstabModifier=1.0
	iMissMeleeStrikePenalty=10
	iMissMeleeStrikePenaltyBonus=0
	bCanSprintAttack=true
	fStandingSpread=0.05f
	fCrouchingSpread=0.0f
	fWalkingSpread=0.1
	fSprintingSpread=0.25
	fFallingSpread=0.25
	fSpreadPenaltyPerSecond=0.5
	fSpreadRecoveryPerSecond=0.3
}

/**
* Copyright 2010-2012, Torn Banner Studios, All rights reserved
* 
* Original Author: Michael Bao
* 
* Archer.
*/
class BZMFamilyInfo_Archer extends BZMFamilyInfo
	dependson(AOCPawn);

DefaultProperties
{
	PawnArmorType = ARMORTYPE_LIGHT

	AirSpeed=440.0
	WaterSpeed=220.0
	AirControl=0.35
	GroundSpeed=200.0

	ClassReference=ECLASS_Archer

	DefaultFOV=95.0f
	
	// damage modifiers
	DamageResistances(EDMG_Swing) = 1.00
	DamageResistances(EDMG_Pierce) = 0.9
	DamageResistances(EDMG_Blunt) = 0.8

	/*
	 * 
	 * Formerly in UDKFamilyInfo.ini
	 *
	 */
	AccelRate=600.0
	SprintAccelRate=100.0
	JumpZ=380.0
	SprintModifier=1.65
	SprintTime=10.0
	DodgeSpeed=400.0
	DodgeSpeedZ=200.0
	Health=100
	BACK_MODIFY=0.8
	STRAFE_MODIFY=0.8
	FORWARD_MODIFY=1.0
	CROUCH_MODIFY=0.65
	MaxSprintSpeedTime=3.5
	bCanDodge=false
	iDodgeCost=30
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
	fMaxComplexRelevancyDistanceSquared = 25000000
}

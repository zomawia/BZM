/**
 * AOC NPC Family Info
 *
 * Author: Zack Dayton
 *
 * Copyright ? 2005-2008, Torn Banner Studios, All rights reserved
 */


class BZMFamilyInfo_NPC extends BZMFamilyInfo
	dependson(AOCPawn);

DefaultProperties
{
	PawnArmorType = ARMORTYPE_HEAVY

	AirSpeed=440.0
	WaterSpeed=220.0
	AccelRate=2000.0
	SprintAccelRate=100.0
	JumpZ=322.0
	AirControl=0.35
	SprintModifier=1.5
	SprintTime=10.0
	DodgeSpeed=500.0
	DodgeSpeedZ=130.0
}

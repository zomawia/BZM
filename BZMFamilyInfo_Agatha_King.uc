/**
* Copyright 2010-2012, Torn Banner Studios, All rights reserved
*
* Original Author: Michael Bao
*
* King Class. For Assassination Objective.
*/
class BZMFamilyInfo_Agatha_King extends BZMFamilyInfo_Agatha_Knight;

DefaultProperties
{
	FamilyID="King"
	Health=300
	
	ProjectileLocationModifiers(EHIT_Head) = 1.0

	KillBonus = 75
	AssistBonus = 15
	ClassReference=ECLASS_King
}

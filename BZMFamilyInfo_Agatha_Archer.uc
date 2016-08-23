/**
* Copyright 2010-2012, Torn Banner Studios, All rights reserved
*
* Original Author: Michael Bao
*
* Agathian Archer.
*/

class BZMFamilyInfo_Agatha_Archer extends BZMFamilyInfo_Archer
	dependson(AOCPawn);

DefaultProperties
{
	PrimaryWeapons(0)=class'AOCWeapon_Fists'
	SecondaryWeapons(0)=class'AOCWeapon_Fists'
	
	FamilyID="Archer"
	Faction="Agatha"
	FamilyFaction=EFAC_AGATHA

}

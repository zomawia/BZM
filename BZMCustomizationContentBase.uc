/**
* Copyright 2013
* 
* Original author: Brady Brenot
* 
* bbrenot:
* This class exists in the AOC script package, but doesn't contain any references to actual helmets.
* References to helmets are in a subclass in the AOCCustomization package (e.g. AOCCHelmets)
* 
* I'm doing this so that we can FindObject the subclass, cast it to class<AOCCGearCategoryBase>, and access members.
* This allows us to keep all references to gear totally separated from the AOC script package, so gear meshes/textures don't get cooked into it.
*/

class BZMCustomizationContentBase extends AOCCustomizationContentBase;

///* Avoid passing these by value */
//var array<class<BZMCustomizationTeam> > Teams;
//var array<class<BZMCharacterInfo> > Characters;
//
//// Hardcoded drops arrays. 
//// Drop IDs in range [0, 1000) are reserved for this script file
//var array<SDropInfo>        Drops;
//var array<SWeaponItemInfo>  Weapons;
//var array<SHelmetItemInfo>  Helmets;
//
//static function int GetDefaultCharacterIDFor(int Team, int PawnClass);
//static function int GetCharacterIDFor(string ClassName);

defaultproperties
{
}

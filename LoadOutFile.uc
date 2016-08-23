// Stores player data for saving

class LoadOutFile extends Object;

var int SavedScore;
var int	SavedLaw;
var int	SavedWood;
var int	SavedBounty;
var int	SavedMetal;
var int	SavedCredit;

// pawn stuff
var() int SavedHealth;
var float SavedStamina;
var EAOCFaction SavedFaction;

var AssetStore_AOCPawn_Helmet     SavedHelmet;
//var AssetStore_AOCPawn_Character  SavedArmor;
var class<AOCCustomization> SavedCustomization;
var AOCFamilyInfo SavedFamily;

// location to save
var float SavedVectorX;
var float SavedVectorY;
var float SavedVectorZ;

// view stuff -- not working atm
var int SavedRotatorPitch;
var int SavedRotatorYaw;
var int SavedRotatorRoll;

var() class<AOCWeapon> SavedPrimary;
var() class<AOCWeapon> SavedPrimaryAlt;
var() class<AOCWeapon> SavedSecondary;
var() class<AOCWeapon> SavedTert;

defaultproperties
{
	SavedScore = 0
	SavedLaw = 0
	SavedWood = 0
	SavedBounty = 0
	SavedMetal = 0
	SavedCredit = 0
}
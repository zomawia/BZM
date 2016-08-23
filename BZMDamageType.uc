class BZMDamageType extends AOCDamageType;

enum EDamageType
{
	EDMG_Swing,
	EDMG_Pierce,
	EDMG_Blunt,
	EDMG_Generic,
	EDMG_Spike,
	EDMG_Chop
};

defaultproperties
{
	DamageType(EDMG_Spike)  = 0.0f
	DamageType(EDMG_Chop) = 0.0f
}
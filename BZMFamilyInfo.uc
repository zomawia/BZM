/**
 gah

 */
class BZMFamilyInfo extends AOCFamilyInfo;

static function class<AOCFamilyInfo> GetFamilyFromEAOCClass(EAOCClass ConvertClass, optional EAOCFaction Fac = EFAC_Agatha)
{
	//switch(ConvertClass)
	//{
	//case ECLASS_Archer:
		//return Fac == EFAC_Agatha ? class'BZMFamilyInfo_Agatha_Archer' : class'BZMFamilyInfo_Mason_Archer';
	//case ECLASS_ManAtArms:
		//return Fac == EFAC_Agatha ? class'BZMFamilyInfo_Agatha_ManAtArms' : class'BZMFamilyInfo_Mason_ManAtArms';
	//case ECLASS_Knight:
		//return Fac == EFAC_Agatha ? class'BZMFamilyInfo_Agatha_Knight' : class'BZMFamilyInfo_Mason_Knight';
	//case ECLASS_Vanguard:
		//return Fac == EFAC_Agatha ? class'BZMFamilyInfo_Agatha_Vanguard' : class'BZMFamilyInfo_Mason_Vanguard';
	//}
	
	return Fac == EFAC_Agatha ? class'BZMFamilyInfo_Peasant' : class'BZMFamilyInfo_Peasant';
}
	

DefaultProperties
{
	
}

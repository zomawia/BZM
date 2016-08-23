/**
* Copyright 2010-2013, Torn Banner Studios, All rights reserved
* 
* Original Author: Brady Brenot
* 
*/
class BZMCharacterInfo_ArmorHeavy_Scale extends AOCCharacterInfo_Knight;

defaultproperties
{
	/** Pull this out into the Helmets etc. arrays */

	MobileBattleCry=SoundCue'A_VO_Manual.Agatha_Knight.Battlecry_Running_Agatha_Knight'

	CharacterMeshPath="CH_Barb_AgathaKnight.models.SK_CH_3P_Barb_AgathaKnight"
	DecapMeshPath="CH_Barb_AgathaKnight.models.SK_CH_3P_Barb_AgathaKnight_Gore"
	OwnerMeshPath="CH_Barb_AgathaKnight.models.SK_CH_1P_Barb_AgathaKnight"

	HeadMaterialPath="CH_Barb_AgathaKnight.Materials.MI_CH_3P_Barb_AgathaKnight_Body01"
	BodyMaterialPath="CH_Barb_AgathaKnight.Materials.MI_CH_3P_Barb_AgathaKnight_Head"

	StandinMesh=SkeletalMesh'CH_AgathanKnight_PKG.models.SK_CH_3P_AgathaKnight'
	StandinDecapMesh=SkeletalMesh'CH_AgathanKnight_PKG.models.SK_CH_3P_AgathaKnight_Gore'
	StandinOwnerMesh=SkeletalMesh'CH_AgathanKnight_PKG.models.SK_CH_1P_AgathaKnight'
	StandinHeadMaterial=MaterialInterface'CH_AgathanKnight_PKG.Materials.MI_CH_3P_AgathaKnight_Body'
	StandinBodyMaterial=MaterialInterface'CH_AgathanKnight_PKG.Materials.MI_CH_3P_AgathaKnight_Head'

	PhysAsset=PhysicsAsset'CH_AgathanMaa_PKG.SkeletalMesh.SK_CH_3P_AgathaMaa_Physics'

	/** Ownership info **/

	AllowedTeams.Add(0)

	/** Customizables **/

	////Helmets.Add((SkeletalMeshPath="CH_Barb_AgathaKnight_Accesso.models.SK_CH_Barb_AgathaKnight_Helm01",      StaticMeshPath="CH_Barb_AgathaKnight_Accesso.models.S_CH_Barb_AgathaKnight_Helm01",         GearData=(GearNameID=DefaultHatOpen)))
	//Helmets.Add((SkeletalMeshPath="CH_Barb_AgathaKnight_Accesso.models.SK_CH_Barb_AgathaKnight_Helm02",      StaticMeshPath="CH_Barb_AgathaKnight_Accesso.models.S_CH_Barb_AgathaKnight_Helm02",         GearData=(GearNameID=DefaultHat)))
	//Helmets.Add((SkeletalMeshPath="",      StaticMeshPath="",         GearData=(GearNameID=NoHat)))
	//Helmets.Add((SkeletalMeshPath="CHV_Cowskull.cowskull.sk_cowskull", StaticMeshPath="CHV_Cowskull.cowskull.SM_CowSkull", GearData=(AppID=222360, GearNameID=GDev, bVisibleInSelectorIfUnowned=false)))
	//
	//Helmets.Add((SkeletalMeshPath="CH_AgathanKnight_PKG.models.SK_CH_Agathaknight_Helm02",      StaticMeshPath="CH_sm_helms.smhelms_SK_CH_Agathaknight_Helm02",         GearData=(GearNameID=DefaultHatOpen)))
	////Helmets.Add((SkeletalMeshPath="CH_H_AOC.Meshes.sk_aoc_agatha_helm",                         StaticMeshPath="CH_H_AOC.Meshes.sm_AOC_Agatha_Knight",                  GearData=(AppID=219970, GearNameID=KickStarterHat, bVisibleInSelectorIfUnowned=false)))
	////Helmets.Add((SkeletalMeshPath="CH_H_Veteran.a_k.sk_CH_AgathaKnight_Helmet_Veteran",         StaticMeshPath="CH_H_Veteran.a_a.sm_CH_AgathaKnight_Helmet_Veteran",    GearData=(bVeteranGear=true, GearNameID=VeteranHelmet)))
	//Helmets.Add((SkeletalMeshPath="CH_H_Veteran.a_k.CH_AgathaKnight_HelmetUP_Veteran",          StaticMeshPath="CH_H_Veteran.a_k.sm_CH_AgathaKnight_Helmet_Veteranup",  GearData=(bVeteranGear=true, GearNameID=VeteranHelmetOpen)))
	//Helmets.Add((SkeletalMeshPath="CH_AgathanKnight_PKG.models.SK_CH_AgathaKnight_Helm02",      StaticMeshPath="CH_sm_helms.smhelms_SK_CH_Agathaknight_Helm02", 	    MaterialPath="CH_H_Gold.Materials.M_akn_s",      GearData=(GearNameID=SilverHat, MinRank=30, bVisibleInSelectorIfUnowned=false)))
	//Helmets.Add((SkeletalMeshPath="CH_H_Veteran.a_k.CH_AgathaKnight_HelmetUP_Veteran",         StaticMeshPath="CH_H_Veteran.a_a.sm_CH_AgathaKnight_Helmet_Veteran",	MaterialPath="CH_H_Gold.Materials.M_akv_b", GearData=(GearNameID=BlackHat, MinRank=40, bVisibleInSelectorIfUnowned=false)))	
	//Helmets.Add((SkeletalMeshPath="CH_H_Veteran.a_k.CH_AgathaKnight_HelmetUP_Veteran",         StaticMeshPath="CH_H_Veteran.a_a.sm_CH_AgathaKnight_Helmet_Veteran",	MaterialPath="CH_H_Gold.Materials.M_akv_g", GearData=(GearNameID=GoldHat, MinRank=50, bVisibleInSelectorIfUnowned=false)))	
	//Helmets.Add((SkeletalMeshPath="CH_H_Veteran.a_k.sk_CH_AgathaKnight_Helmet_Veteran",         StaticMeshPath="CH_H_Veteran.a_a.sm_CH_AgathaKnight_Helmet_Veteran",	MaterialPath="CH_H_Gold.Materials.M_akv_p", GearData=(GearNameID=PinkHat, MinRank=60, bVisibleInSelectorIfUnowned=false)))	
	//
	////Helmets.Add((SkeletalMeshPath="CH_H_AOC.Meshes.sk_aoc_agatha_helm",                         StaticMeshPath="CH_H_AOC.Meshes.sm_AOC_Agatha_Knight",                  MaterialPath="CH_H_Gold.Materials.M_ka_b", ParticleSystemPath="CH_H_Gold.Particles.P_devhelmfire",              GearData=(AppID=222360, GearNameID=GDev, bVisibleInSelectorIfUnowned=false)))	
	//
	////Helmets.Add((SkeletalMeshPath="CH_HP1_Agatha.Knight.sk_hp1a_knight",                        StaticMeshPath="CH_HP1_Agatha.Knight.sm_hp1a-knight",                   GearData=(GearNameID=Agatha_Knight_DLC_Helmet_1, MicroTxID=101010, bPartOfBundle=true, BundleNameID=Agatha_Bundle_DLC_Helmets_1, GearStoreDescriptionID=Agatha_Bundle_DLC_Helmets_1))) 
	//Helmets.Add((SkeletalMeshPath="CH_HP1_Agatha.Knight.sk_hp1aNV-knight",                      StaticMeshPath="CH_HP1_Agatha.Knight.sm_hp1a-knight_lowhelm",           GearData=(GearNameID=Agatha_Knight_DLC_HelmetOpen_1, MicroTxID=101010, bPartOfBundle=true, BundleNameID=Agatha_Bundle_DLC_Helmets_1, GearStoreDescriptionID=Agatha_Bundle_DLC_Helmets_1))) 
	//Helmets.Add((SkeletalMeshPath="CH_HP2_Agatha.Knight.sk_HP2A_Knight2",                      StaticMeshPath="CH_HP2_Agatha.Knight.sm_HP2A_Knight2",                   GearData=(GearNameID=Agatha_Knight_DLC_HelmetOpen_2, GearStoreDescriptionID=Agatha_Knight_DLC_Helmets_2, MicroTxID=101014, bVisibleInSelectorIfUnowned=false))) 
	//Helmets.Add((SkeletalMeshPath="CH_NPC_Peasant.models.Sk_PC_Peasant_Hat01",                 StaticMeshPath="CH_sm_helms.smhelms_SK_NPC_Peasant_Hat01",              GearData=(GearNameID=Peasant, MicroTxID=101012, bVisibleInSelectorIfUnowned=false)))
	//Helmets.Add((SkeletalMeshPath="CH_AgathaKnight_DLC1.models.SK_Char_knight_helmet",         		StaticMeshPath="CH_AgathaKnight_DLC1.models.SM_Char_knight_Helmet",			MaterialPath="CH_AgathaKnight_DLC1.Materials.MI_CH_3P_Knight_Body", GearData=(GearNameID=Agatha_Elite_Helm1, GearStoreDescriptionID=Agatha_Elite_Knight_Bundle_1, MicroTxID=101025, bPartOfBundle=true, BundleNameID=Agatha_Elite_Knight_Bundle_1)))	
	//Helmets.Add((SkeletalMeshPath="CH_AgathaKnight_DLC1.models.SK_Char_knight_Helmet_Open",         StaticMeshPath="CH_AgathaKnight_DLC1.models.SM_Char_knight_Helmet_Open",	MaterialPath="CH_AgathaKnight_DLC1.Materials.MI_CH_3P_Knight_Body", GearData=(GearNameID=Agatha_Elite_Helm2, GearStoreDescriptionID=Agatha_Elite_Knight_Bundle_1, MicroTxID=101025, bPartOfBundle=true, BundleNameID=Agatha_Elite_Knight_Bundle_1)))	
	//Helmets.Add((SkeletalMeshPath="CH_NPC_Peasant.models.Sk_PC_Peasant_Hat03",             StaticMeshPath="CH_sm_helms.smhelms_SK_NPC_Peasant_Hat03",              GearData=(GearNameID=Cartographer, MicroTxID=101034, bVisibleInSelectorIfUnowned=false)))
	//Helmets.Add((SkeletalMeshPath="ch_hp3_polycount.Mesh.sk_HP3_Archer",             StaticMeshPath="ch_hp3_polycount.Mesh.sm_HP3_Archer",              GearData=(GearNameID=Greentooth, MicroTxID=101035, bVisibleInSelectorIfUnowned=false)))
	//Helmets.Add((SkeletalMeshPath="CH_HP4_Agatha_NBLM.SK_CH_HoundHelmet",             StaticMeshPath="CH_HP4_Agatha_NBLM.SM_CH_HoundHelmet",              GearData=(GearNameID=HoundHelmet, GearStoreDescriptionID=Hound_Set, bVisibleInSelectorIfUnowned=true, MicroTxID=102012, bPartOfBundle=true, BundleNameID=Hound_Set_Bundle)))
	//Helmets.Add((SkeletalMeshPath="CH_H_OrnamentalSet.Meshes.SK_CH_H_h24_down",             StaticMeshPath="CH_H_OrnamentalSet.Meshes.SM_CH_H_h24_visordown",              GearData=(GearNameID=OrnamentalHelmet_down, GearStoreDescriptionID=Ornamental_Set, bVisibleInSelectorIfUnowned=true, MicroTxID=102014, bPartOfBundle=true, BundleNameID=Ornamental_Set_Bundle)))
	//Helmets.Add((SkeletalMeshPath="CH_H_OrnamentalSet.Meshes.SK_CH_H_h24_up",             StaticMeshPath="CH_H_OrnamentalSet.Meshes.SM_CH_H_h24_visorup",              GearData=(GearNameID=OrnamentalHelmet_up, GearStoreDescriptionID=Ornamental_Set, bVisibleInSelectorIfUnowned=true, MicroTxID=102014, bPartOfBundle=true, BundleNameID=Ornamental_Set_Bundle)))
//
	//Helmets.Add((SkeletalMeshPath="CH_H_Leo.SK_CH_H_Leo_Closed",             StaticMeshPath="CH_H_Leo.SM_CH_H_Leo_Closed",              GearData=(GearNameID=LeoHelm_Closed, GearStoreDescriptionID=Leo_Set, bVisibleInSelectorIfUnowned=true, MicroTxID=102023, bPartOfBundle=true, BundleNameID=Leo_Set)))
	//Helmets.Add((SkeletalMeshPath="CH_H_Leo.SK_CH_H_Leo_Open",             StaticMeshPath="CH_H_Leo.SM_CH_H_Leo_Open",              GearData=(GearNameID=LeoHelm_Open, GearStoreDescriptionID=Leo_Set, bVisibleInSelectorIfUnowned=true, MicroTxID=102023, bPartOfBundle=true, BundleNameID=Leo_Set)))
	//Helmets.Add((SkeletalMeshPath="CH_H_RatHelmet.SK_Rat_Helmet",             StaticMeshPath="CH_H_RatHelmet.SM_Rat_Helmet",              GearData=(GearNameID=RatHelm, GearStoreDescriptionID=RatSet, bVisibleInSelectorIfUnowned=true, MicroTxID=102031, bPartOfBundle=true, BundleNameID=RatSet)))
	//Helmets.Add((SkeletalMeshPath="CH_Warmonger_Helm.SK_Bascinet",             StaticMeshPath="CH_Warmonger_Helm.SM_Bascinet",              GearData=(GearNameID=WarmongerHelmAgatha, GearStoreDescriptionID=WarmongerSet1, bVisibleInSelectorIfUnowned=true, bPartOfBundle=true, MicroTxID=102045, BundleNameID=WarmongerSet1)))
	//Helmets.Add((SkeletalMeshPath="CH_H_Winter_Soldier_set.SK_CH_H_cold_vengence_01",             StaticMeshPath="CH_H_Winter_Soldier_set.SM_CH_H_cold_vengence_01",              GearData=(GearNameID=WinterSoldierHelm, GearStoreDescriptionID=WinterSoldierSet, bVisibleInSelectorIfUnowned=true, MicroTxId=102051, bPartOfBundle=true, BundleNameID=WinterSoldierSet)))
	//Helmets.Add((SkeletalMeshPath="CH_H_Winter_Soldier_set.SK_CH_H_cold_vengence_02",             StaticMeshPath="CH_H_Winter_Soldier_set.SM_CH_H_cold_vengence_02",              GearData=(GearNameID=WinterSoldierHelmOpen, GearStoreDescriptionID=WinterSoldierSet, bVisibleInSelectorIfUnowned=true, MicroTxId=102051, bPartOfBundle=true, BundleNameID=WinterSoldierSet)))
	////Helmets.Add((SkeletalMeshPath="CH_Reiverhelm_Agatha.SK_Reiverhelm_Agatha",             StaticMeshPath="CH_Reiverhelm_Agatha.SM_Reiverhelm_Agatha",             GearData=(GearNameID=ReiverHelmAgatha, GearStoreDescriptionID=ReiverSet1, bVisibleInSelectorIfUnowned=true, bPartOfBundle=true, MicroTxID=102053)))
	////Helmets.Add((SkeletalMeshPath="CH_Reiverhelm_Agatha.SK_Reiverhelm_open_Agatha",             StaticMeshPath="CH_Reiverhelm_Agatha.SM_Reiverhelm_open_Agatha",              GearData=(GearNameID=ReiverHelmAgathaOpen, GearStoreDescriptionID=ReiverSet1, bVisibleInSelectorIfUnowned=true, bPartOfBundle=true, MicroTxID=102053)))
//
	//Helmets.Add((SkeletalMeshPath="CH_H_FinalGuard.Meshes.SK_FinalGuardHelmet",             StaticMeshPath="CH_H_FinalGuard.Meshes.SM_FinalGuardHelmet",              GearData=(GearNameID=FinalGuardHelm, GearStoreDescriptionID=FinalGuardSet, bVisibleInSelectorIfUnowned=true, MicroTxID=102025, bPartOfBundle=true, BundleNameID=FinalGuardSet)))
//
	//Helmets.Add((SkeletalMeshPath="HP_PlagueDoctorMask.SK_PlagueDoctorMask_Agatha",             StaticMeshPath="HP_PlagueDoctorMask.mask01",          GearData=(GearNameID=KF2_AgathaHelm, bVisibleInSelectorIfUnowned=true, AppIdNoDLC=232090, bPartOfBundle=true, BundleNameID=KF2_Item_Set_Name, GearStoreDescriptionID=KF2_Item_Set_Description)))
	//Helmets.Add((SkeletalMeshPath="CHV_Santa.hat.SK_Chivmas_hat", StaticMeshPath="CHV_Santa.hat.SM_Chivmas_hat", MaterialPath="CHV_Santa.hat.M_chivmas-hat", GearData=(MicroTxID=101036, GearNameID=Chivmas, bVisibleInSelectorIfUnowned=false)))
	//Helmets.Add((SkeletalMeshPath="CHV_Santa.hat.SK_Chivmas_hat", StaticMeshPath="CHV_Santa.hat.SM_Chivmas_hat", MaterialPath="CHV_Santa.hat.M_chivmas-hat", GearData=(AppID=222360, GearNameID=GDev, bVisibleInSelectorIfUnowned=false)))
	//Helmets.Add((SkeletalMeshPath="CHV_Santa.hat.sm_chivmas_antlers", StaticMeshPath="CHV_Santa.hat.sk_chivmas_antlers", GearData=(AppID=222360, GearNameID=GDev, bVisibleInSelectorIfUnowned=false)))
//
	//Helmets.Add((SkeletalMeshPath="CH_H_SwordMaster.SK_smastercrown", StaticMeshPath="CH_H_SwordMaster.SM_smastercrown", GearData=(GroupHexID="1700000003F72EC", MicroTxID=101038, GearNameID=SquireTrainerHelm,bVisibleInSelectorIfUnowned=true, GearStoreDescriptionID=PeasantRevoltDesc)))
	//Helmets.Add((SkeletalMeshPath="CH_HP_Community_Helms.Meshes.SK_Community_Helm", StaticMeshPath="CH_HP_Community_Helms.SM_Community_Helm", MaterialPath="CH_HP_Community_Helms.Materials.M_Community_Helm_Agatha", GearData=(GroupHexID="1700000003F72EC", GearNameID=CommunityHat, GearStoreDescriptionID=CommunityHatDesc)))
	//Helmets.Add((SkeletalMeshPath="ch_punkin_head.sk_punkinHead", StaticMeshPath="ch_punkin_head.SM_PunkinHead", GearData=(GroupHexID="1700000003F72EC", MicroTxID=101068, GearNameID=HalloweenHelm2015,bVisibleInSelectorIfUnowned=true, GearStoreDescriptionID=HalloweenHelm2015Desc)))
	//
	////Tabards.Add((Img=Texture2D'CH_AgathanKnight_PKG.Textures.T_CH_3P_AgathaKnight_Body_P01', GearData=(GearNameID=Default)))
	////Tabards.Add((Img=Texture2D'CH_AgathanKnight_PKG.Textures.T_CH_3P_AgathaKnight_Body_pc1', GearData=(GearNameID=Checkers)))
	////Tabards.Add((Img=Texture2D'CH_AgathanKnight_PKG.Textures.T_CH_3P_AgathaKnight_Body_p02', GearData=(GearNameID=Tabard2)))
	////Tabards.Add((Img=Texture2D'CH_AgathanKnight_PKG.Textures.T_CH_3P_AgathaKnight_Body_pb1', GearData=(GearNameID=Split)))
	////Tabards.Add((Img=Texture2D'CH_AgathanKnight_PKG.Textures.T_CH_3P_AgathaKnight_Body_pq1', GearData=(GearNameID=Quadrant)))
	////Tabards.Add((Img=Texture2D'CH_AgathanKnight_PKG.Textures.T_CH_3P_AgathaKnight_Body_ps1', GearData=(GearNameID=Stripes)))
	////Tabards.Add((Img=Texture2D'CH_AgathanKnight_PKG.Textures.T_CH_3P_AgathaKnight_Body_ps2', GearData=(GearNameID=Stripes2)))
	////Tabards.Add((Img=Texture2D'CH_AgathanKnight_PKG.Textures.T_CH_3P_AgathaKnight_Body_ps3', GearData=(GearNameID=Stripes3)))
	////Tabards.Add((Img=Texture2D'CH_AgathanKnight_PKG.Textures.T_CH_3P_AgathaKnight_Body_ps4', GearData=(GearNameID=Stripes4)))
	////Tabards.Add((Img=Texture2D'CH_AgathanKnight_PKG.Textures.T_CH_3P_AgathaKnight_Body_ps5', GearData=(GearNameID=Stripes5)))
	////Tabards.Add((Img=Texture2D'CH_AgathanKnight_PKG.Textures.T_CH_3P_AgathaKnight_Body_px', GearData=(GearNameID=Solid)))
	//Tabards=((GearData=(GearNameID=Default)))
	//
	//ShieldPatterns.Add((GearData=(GearNameID=Default),PerShieldTextures[0]=Texture2D'WP_shld_Buckler.T_buckler_pa1',PerShieldTextures[1]=Texture2D'WP_shld_Heatshield.T_Heaters_pa1',PerShieldTextures[2]=Texture2D'WP_shld_TowerShield.Materials.t_towershield_pa1',PerShieldTextures[3]=Texture2D'WP_shld_Kite.T_kite_pa1'))
	//ShieldPatterns.Add((GearData=(GearNameID=Quadrant),PerShieldTextures[0]=Texture2D'WP_shld_Buckler.T_buckler_p01',PerShieldTextures[1]=Texture2D'WP_shld_Heatshield.T_Heaters_p01',PerShieldTextures[2]=Texture2D'WP_shld_TowerShield.Materials.t_towershield_p01',PerShieldTextures[3]=Texture2D'WP_shld_Kite.T_kite_p01'))
	//ShieldPatterns.Add((GearData=(GearNameID=Stripes),PerShieldTextures[0]=Texture2D'WP_shld_Buckler.T_buckler_p02',PerShieldTextures[1]=Texture2D'WP_shld_Heatshield.T_Heaters_p02',PerShieldTextures[2]=Texture2D'WP_shld_TowerShield.Materials.t_towershield_p02',PerShieldTextures[3]=Texture2D'WP_shld_Kite.T_kite_p02'))
	//ShieldPatterns.Add((GearData=(GearNameID=Checkers),PerShieldTextures[0]=Texture2D'WP_shld_Buckler.T_buckler_p03',PerShieldTextures[1]=Texture2D'WP_shld_Heatshield.T_Heaters_p03',PerShieldTextures[2]=Texture2D'WP_shld_TowerShield.Materials.t_towershield_p02',PerShieldTextures[3]=Texture2D'WP_shld_Kite.T_kite_p03'))

	SoundGroupClassName="AOCAudioContent.AOCPawnSoundGroup_BARB_Knight"
	OverridePawnArmorType="ARMORTYPE_HEAVY"
}
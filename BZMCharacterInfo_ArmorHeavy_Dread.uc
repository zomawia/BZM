// Heavy Armor - Dreadnaught
class BZMCharacterInfo_ArmorHeavy_Dread extends AOCCharacterInfo_Knight;

defaultproperties
{
	/** Pull this out into the Helmets etc. arrays */

	MobileBattleCry=SoundCue'A_VO_Manual.Mason_Knight.Battlecry_Running_Mason_Knight'
	//MobileBattleCry=SoundCue'A_VO_Manual.Agatha_archer.Battlecry_Running_Agatha_Archer'

	CharacterMeshPath="CH_MasonKnight_DLC1.models.SK_Char_knight"
	DecapMeshPath="CH_MasonKnight_DLC1.models.SK_Char_knight_gore"
	OwnerMeshPath="CH_MasonKnight_DLC1.models.SK_Char_knight_FP"

	HeadMaterialPath="CH_MasonKnight_DLC1.Materials.MI_CH_3P_Knight_Body"
	BodyMaterialPath="CH_MasonKnight_DLC1.Materials.MI_CH_3P_Knight_Head"
	
	PhysAsset=PhysicsAsset'CH_AgathanMaa_PKG.SkeletalMesh.SK_CH_3P_AgathaMaa_Physics'

	AllowedTeams.Add(0)
	AllowedTeams.Add(1)
	AllowedTeams.Add(5)

	/** Customizables **/
	//Helmets.Empty
//
	//Helmets.Add((SkeletalMeshPath="CH_H_AOC.Meshes.sk_aoc_mason_helm",						StaticMeshPath="CH_H_AOC.Meshes.sm_AOC_Mason_Knight",                   MaterialPath="CH_H_Gold.Materials.M_km_b", ParticleSystemPath="CH_H_Gold.Particles.P_devhelmfire", GearData=(GearNameID=GDev)))	
	//Helmets.Add((SkeletalMeshPath="",                                                                     StaticMeshPath="",                                        GearData=(GearNameID=NoHat)))
	//
	//Helmets.Add((SkeletalMeshPath="CH_MasonKnight.models.SK_CH_MasonKnight_Helm01",         StaticMeshPath="CH_MasonKnight.models.SM_CH_MasonKnight_Helm01",        GearData=(GearNameID=DefaultHat)))	
	//
	//Helmets.Add((SkeletalMeshPath="CH_MasonKnight_DLC1.Helmet.sk_CHPack_Knight01",         StaticMeshPath="CH_MasonKnight_DLC1.Helmet.sm_CHPack_Knight01",			GearData=(GearNameID=MasonKnight_Helm1_DLC1)))
	//Helmets.Add((SkeletalMeshPath="CH_MasonKnight_DLC1.Helmet.sk_CHPack_Knight01_a",         StaticMeshPath="CH_MasonKnight_DLC1.Helmet.sm_CHPack_Knight01_a",		GearData=(GearNameID=MasonKnight_Helm_a_DLC1)))
	//Helmets.Add((SkeletalMeshPath="CH_MasonKnight_DLC1.Helmet.sk_CHPack_Knight01_c",         StaticMeshPath="CH_MasonKnight_DLC1.Helmet.sm_CHPack_Knight01_c",      GearData=(GearNameID=MasonKnight_Helm_c_DLC1)))
	//Helmets.Add((SkeletalMeshPath="CH_MasonKnight_DLC1.Helmet.sk_CHPack_Knight01_b",       StaticMeshPath="CH_MasonKnight_DLC1.Helmet.sm_CHPack_Knight01_b",		GearData=(GearNameID=MasonKnight_Helm_b_DLC1)))
	//
	//Helmets.Add((SkeletalMeshPath="CH_H_AOC.Meshes.sk_aoc_mason_helm",                      StaticMeshPath="CH_H_AOC.Meshes.sm_AOC_Mason_Knight",                   GearData=(GearNameID=KickStarterHat)))
	//Helmets.Add((SkeletalMeshPath="CH_H_Veteran.m_k.sk_CH_MasonKnight_Helmet_Veteran",      StaticMeshPath="CH_H_Veteran.a_a.sm_CH_MasonKnight_Helmet_Veteran",     GearData=(GearNameID=VeteranHelmet)))
	//Helmets.Add((SkeletalMeshPath="CH_H_Veteran.m_k.sk_CH_MasonKnight_Helmet_Veteranup",    StaticMeshPath="CH_H_Veteran.m_k.sm_CH_MasonKnight_Helmet_Veteranup",   GearData=(GearNameID=VeteranHelmetOpen)))
	//Helmets.Add((SkeletalMeshPath="CH_MasonKnight.models.SK_CH_MasonKnight_Helm01",         StaticMeshPath="CH_MasonKnight.models.SM_CH_MasonKnight_Helm01", 	    MaterialPath="CH_H_Gold.Materials.M_mkn_s", GearData=(GearNameID=SilverHat)))
	//Helmets.Add((SkeletalMeshPath="CH_H_Veteran.m_k.sk_CH_MasonKnight_Helmet_Veteran",      StaticMeshPath="CH_H_Veteran.a_a.sm_CH_MasonKnight_Helmet_Veteran",	    MaterialPath="CH_H_Gold.Materials.M_mkv_b", GearData=(GearNameID=BlackHat)))	
	//Helmets.Add((SkeletalMeshPath="CH_H_Veteran.m_k.sk_CH_MasonKnight_Helmet_Veteran",      StaticMeshPath="CH_H_Veteran.a_a.sm_CH_MasonKnight_Helmet_Veteran",	    MaterialPath="CH_H_Gold.Materials.M_mkv_g", GearData=(GearNameID=GoldHat)))	
	//Helmets.Add((SkeletalMeshPath="CH_H_Veteran.m_k.sk_CH_MasonKnight_Helmet_Veteran",      StaticMeshPath="CH_H_Veteran.a_a.sm_CH_MasonKnight_Helmet_Veteran",	    MaterialPath="CH_H_Gold.Materials.M_mkv_p", GearData=(GearNameID=PinkHat)))
	//
//
	//
	//Helmets.Add((SkeletalMeshPath="CH_HP1_Mason.Knight.sk_HP1M_Knight",                     StaticMeshPath="CH_HP1_Mason.Knight.sm_HP1M_Knight",                    GearData=(GearNameID=Mason_Knight_DLC_Helmet_1)))
	//Helmets.Add((SkeletalMeshPath="CH_HP2_Mason.Knight.sk_HP2M_Knight1",                      StaticMeshPath="CH_HP2_Mason.Knight.sm_HP2M_Knight1",                 GearData=(GearNameID=Mason_Knight_DLC_Helmet_2))) 
	//Helmets.Add((SkeletalMeshPath="CH_HP2_Mason.Knight.sk_HP2M_Knight2",                      StaticMeshPath="CH_HP2_Mason.Knight.sm_HP2M_Knight2",                 GearData=(GearNameID=Mason_Knight_DLC_HelmetOpen_2))) 
	//Helmets.Add((SkeletalMeshPath="CH_HP1_Mason.Knight.sk_hp1mnv_knight",                   StaticMeshPath="CH_HP1_Mason.Knight.sk_hp1mnv_knight",                  GearData=(GearNameID=Mason_Knight_DLC_HelmetOpen_1)))
	//Helmets.Add((SkeletalMeshPath="CH_NPC_Peasant.models.SK_PC_Peasant_Hat02",             StaticMeshPath="CH_sm_helms.smhelms_SK_NPC_Peasant_Hat02",               GearData=(GearNameID=Peasant)))
	//Helmets.Add((SkeletalMeshPath="CHV_Cowskull.cowskull.sk_cowskull", StaticMeshPath="CHV_Cowskull.cowskull.SM_CowSkull", MaterialPath="CHV_Cowskull.cowskull.M_cowskull_mason", GearData=(GearNameID=GDev)))
	//Helmets.Add((SkeletalMeshPath="CH_NPC_Peasant.models.Sk_PC_Peasant_Hat04",             StaticMeshPath="CH_sm_helms.smhelms_SK_NPC_Peasant_Hat04",              GearData=(GearNameID=Cartographer)))
	//Helmets.Add((SkeletalMeshPath="ch_hp3_polycount.Mesh.sk_HP3_Archer",             StaticMeshPath="ch_hp3_polycount.Mesh.sm_HP3_Archer",              GearData=(GearNameID=Greentooth)))
	//Helmets.Add((SkeletalMeshPath="CH_HP4_Agatha_Scootdapoot.Meshes.SK_CH_H_DOS",             StaticMeshPath="CH_HP4_Agatha_Scootdapoot.Meshes.SM_CH_H_DOS",              GearData=(GearNameID=DarkOrnateHelm)))
	//Helmets.Add((SkeletalMeshPath="CH_HP4_Mason_Arsenal.Meshes.SK_judgehelm",             StaticMeshPath="CH_HP4_Mason_Arsenal.Meshes.SM_judgehelm",              GearData=(GearNameID=JudgementHelm)))
	//Helmets.Add((SkeletalMeshPath="CH_H_ChickenSet.SK_CH_H_ChickenHelmet",             StaticMeshPath="CH_H_ChickenSet.SM_CH_H_ChickenHelmet",              GearData=(GearNameID=Chickenhelm)))
	//Helmets.Add((SkeletalMeshPath="CH_ChaosHelmet.SK_ChaosHelm",             StaticMeshPath="CH_ChaosHelmet.SM_ChaosHelm",              GearData=(GearNameID=Chaoshelm)))
	//Helmets.Add((SkeletalMeshPath="CH_H_Bucket.SK_CH_H_Bucket01",             StaticMeshPath="CH_H_Bucket.SM_CH_H_Bucket01",              GearData=(GearNameID=WreckerHelm)))
	//Helmets.Add((SkeletalMeshPath="CH_H_Bucket.SK_CH_H_Bucket02",             StaticMeshPath="CH_H_Bucket.SM_CH_H_Bucket02",              GearData=(GearNameID=WreckerHelmOpen)))
	//Helmets.Add((SkeletalMeshPath="CH_Warmonger_Helm.SK_WarlordsHelmet",             StaticMeshPath="CH_Warmonger_Helm.SM_WarlordsHelmet",              GearData=(GearNameID=WarmongerHelmMason)))
	//Helmets.Add((SkeletalMeshPath="HP_PlagueDoctorMask.SK_PlagueDoctorMask_Mason",             StaticMeshPath="HP_PlagueDoctorMask.mask02",          GearData=(GearNameID=KF2_MasonHelm)))
	//Helmets.Add((SkeletalMeshPath="PD2_knight_dallas.sk_dallas_mason",             StaticMeshPath="PD2_knight_dallas.sm_dallas_mason",          GearData=(GearNameID=PD2_MasonDallas)))
	//Helmets.Add((SkeletalMeshPath="CH_MasonKnight_H_Borgoneta.SK_borgoneta",             StaticMeshPath="CH_MasonKnight_H_Borgoneta.SM_borgoneta",              GearData=(GearNameID=InstigatorHelm)))
	//Helmets.Add((SkeletalMeshPath="CH_MasonKnight_H_Borgoneta.SK_open_borgoneta",        StaticMeshPath="CH_MasonKnight_H_Borgoneta.SM_open_borgoneta",              GearData=(GearNameID=InstigatorHelmOpen)))
	//Helmets.Add((SkeletalMeshPath="CH_H_MasonBurgonet.SK_Burgonet",             StaticMeshPath="CH_H_MasonBurgonet.SM_Burgonet",              GearData=(GearNameID=RobberBaronHelm)))
//
	//Helmets.Add((SkeletalMeshPath="CHV_Santa.hat.SK_Chivmas_hat", StaticMeshPath="CHV_Santa.hat.SM_Chivmas_hat", MaterialPath="CHV_Santa.hat.M_chivmas-hat", GearData=(GearNameID=Chivmas)))
	//Helmets.Add((SkeletalMeshPath="CHV_Santa.hat.SK_Chivmas_hat", StaticMeshPath="CHV_Santa.hat.SM_Chivmas_hat", MaterialPath="CHV_Santa.hat.M_chivmas-hat", GearData=(GearNameID=GDev)))
	//Helmets.Add((SkeletalMeshPath="CHV_Santa.hat.sm_chivmas_antlers", StaticMeshPath="CHV_Santa.hat.sk_chivmas_antlers", GearData=(GearNameID=GDev)))
	//
	//Helmets.Add((SkeletalMeshPath="CH_H_SwordMaster.SK_smastercrown", StaticMeshPath="CH_H_SwordMaster.SM_smastercrown", GearData=(GearNameID=SquireTrainerHelm)))
	//Helmets.Add((SkeletalMeshPath="CH_HP_Community_Helms.Meshes.SK_Community_Helm", StaticMeshPath="CH_HP_Community_Helms.SM_Community_Helm", MaterialPath="CH_HP_Community_Helms.Materials.M_Community_Helm_Mason", GearData=(GearNameID=CommunityHat)))
	//Helmets.Add((SkeletalMeshPath="ch_punkin_head.sk_punkinHead", StaticMeshPath="ch_punkin_head.SM_PunkinHead", GearData=(GearNameID=HalloweenHelm2015)))

	Tabards.Empty
	Tabards.Add((Img=Texture2D'CH_MasonKnight_DLC1.Textures.T_knight_3P_body_P01', GearData=(GearNameID=Default)))
}
/**
* Zomboner Class
* 
* 
* 
*/
class BZMCharacterInfo_Zomboner extends AOCCharacterInfo;

defaultproperties
{
	/** Pull this out into the Helmets etc. arrays */

	MobileBattleCry=SoundCue'A_VO_Manual.Mason_Vanguard.Battlecry_Running_Mason_Vanguard'
	SoundGroupClassName="AOCAudioContent.AOCPawnSoundGroup_Archer"

	AnimSets(0)=AnimSet'ANIM_3p_common_PKG.ANIM_3p_common'
	AnimSets(1)=AnimSet'ANIM_3p_common_PKG.ANIM_execution'
	AnimSets(2)=AnimSet'ANIM_ThrowingKnife.AnimSet.ANIM_ThrowingKnife'

	ThirdPersonAnimSets(0)=AnimSet'ANIM_3p_Vanguard_PKG.ANIM_3p_1hsharp'
	ThirdPersonAnimSets(1)=AnimSet'ANIM_3p_buckler_PKG.3p_buckler'
	ThirdPersonAnimSets(2)=AnimSet'ANIM_1p_longsword.3p_longsword'
	ThirdPersonAnimSets(3)=AnimSet'ANIM_Halberd.3p_Halberd'
	ThirdPersonAnimSets(4)=AnimSet'ANIM_Heatshield.3p_Heatshield'
	ThirdPersonAnimSets(5)=AnimSet'ANIM_spear.ANIM_3p_spear'
	ThirdPersonAnimSets(6)=AnimSet'ANIM_3p_common_PKG.ANIM_3p_deaths'
	ThirdPersonAnimSets(7)=AnimSet'ANIM_ThrowingKnife.AnimSet.ANIM_ThrowingKnife'
	ThirdPersonAnimSets(8)=AnimSet'ANIM_fist.ANIM_3p_fist'
	ThirdPersonAnimSets(9)=AnimSet'ANIM_doubleaxe.3p_doubleaxe'
	ThirdPersonAnimSets(10)=AnimSet'ANIM_flail_New.3p_flail'
	ThirdPersonAnimSets(11)=AnimSet'ANIM_Dagger.3p_Dagger'
	ThirdPersonAnimSets(12)=AnimSet'ANIM_Qstaff.ANIM_3p_Qstaff'
	ThirdPersonAnimSets(13)=AnimSet'ANIM_javelin.3p_Javelin'
	ThirdPersonAnimSets(14)=AnimSet'ANIM_3p_longbow_PKG.3p_longbow_PKG'
	ThirdPersonAnimSets(15)=AnimSet'ANIM_3p_Xbow_PKG.3p_Xbow_ANIMSET'
	ThirdPersonAnimSets(16)=AnimSet'ANIM_pavise.ANIM_3p_Pavise'
	ThirdPersonAnimSets(17)=AnimSet'ANIM_Sling.ANIM_3p_sling'

	FirstPersonAnimSets(0)=AnimSet'ANIM_3p_Vanguard_PKG.New_Melee'
	FirstPersonAnimSets(1)=AnimSet'ANIM_3p_buckler_PKG.ANIM_3p_buckler_PKG'
	FirstPersonAnimSets(2)=AnimSet'ANIM_1p_longsword.ANIM_1p_longsword'
	FirstPersonAnimSets(3)=AnimSet'ANIM_Halberd.ANIM_Halberd'
	FirstPersonAnimSets(4)=AnimSet'ANIM_Heatshield.ANIM_Heatshield'
	FirstPersonAnimSets(5)=AnimSet'ANIM_spear.ANIM_1p_spear'
	FirstPersonAnimSets(6)=AnimSet'ANIM_3p_common_PKG.ANIM_1p_deaths'
	FirstPersonAnimSets(7)=AnimSet'ANIM_ThrowingKnife.ANIM_1p_ThrowingKnife'
	FirstPersonAnimSets(8)=AnimSet'ANIM_fist.ANIM_1p_fist'
	FirstPersonAnimSets(9)=AnimSet'ANIM_doubleaxe.ANIM_3p_doubleaxe'
	FirstPersonAnimSets(10)=AnimSet'ANIM_flail_New.ANIM_3p_flail'
	FirstPersonAnimSets(11)=AnimSet'ANIM_javelin.ANIM_3p_Javelin'
	FirstPersonAnimSets(12)=AnimSet'ANIM_3p_longbow_PKG.ANIM_3p_longbow_PKG'
	FirstPersonAnimSets(13)=AnimSet'ANIM_3p_Xbow_PKG.1p_Xbow_ANIMSET'
	FirstPersonAnimSets(14)=AnimSet'ANIM_pavise.ANIM_1p_Pavise'
	FirstPersonAnimSets(15)=AnimSet'ANIM_Dagger.1p_Dagger'
	FirstPersonAnimSets(16)=AnimSet'ANIM_Sling.ANIM_1p_sling'
	FirstPersonAnimSets(17)=AnimSet'ANIM_Qstaff.ANIM_1p_Qstaff'

	CharacterMeshPath="CH_NPC_Peasant.models.SK_NPC_Peasant01"
	DecapMeshPath="CH_NPC_Peasant.models.SK_NPC_Peasant01"
	OwnerMeshPath="CH_A_MasonArcher_PKG.SkeletalMesh.SK_CH_1P_MAsonArcher"

	HeadMaterialPath="CH_NPC_Peasant.Materials.M_CH_Peasant_grey"
	BodyMaterialPath="CH_NPC_Peasant.Materials.M_CH_Peasant01_Head"

	StandinMesh=SkeletalMesh'CH_NPC_Peasant.models.SK_NPC_Peasant01'
	StandinOwnerMesh=SkeletalMesh'CH_A_MasonArcher_PKG.SkeletalMesh.SK_CH_1P_MAsonArcher'
	StandinDecapMesh=SkeletalMesh'CH_NPC_Peasant.models.SK_NPC_Peasant01'
	StandinBodyMaterial=MaterialInterface'CH_NPC_Peasant.Materials.M_CH_Peasant_grey'
	StandinHeadMaterial=MaterialInterface'CH_NPC_Peasant.Materials.M_CH_Peasant01_Head'

	PhysAsset=PhysicsAsset'CH_AgathanMaa_PKG.SkeletalMesh.SK_CH_3P_AgathaMaa_Physics'

	//OverrideMeshAnimTree = AnimTree'ANIM_3p_NPC_AnimTree.3p_NPC_Peasant_at'
	//OverrideOwnerMeshAnimTree = AnimTree'ANIM_3p_NPC_AnimTree.3p_NPC_Peasant_at'

	bCanDecap = false

	/** Ownership info **/

	GearData=(GearNameID=Zomboner)

	/** Customizables **/
	Helmets.Add((SkeletalMeshPath="", StaticMeshPath="", GearData=(GearNameID=NoHat)))
	
	ShieldPatterns.Add((GearData=(GearNameID=Default),PerShieldTextures[0]=Texture2D'WP_shld_Buckler.T_buckler_pa1',PerShieldTextures[1]=Texture2D'WP_shld_Heatshield.T_Heaters_pa1',PerShieldTextures[2]=Texture2D'WP_shld_TowerShield.Materials.t_towershield_pa1',PerShieldTextures[3]=Texture2D'WP_shld_Kite.T_kite_pa1'))
	ShieldPatterns.Add((GearData=(GearNameID=Quadrant),PerShieldTextures[0]=Texture2D'WP_shld_Buckler.T_buckler_p01',PerShieldTextures[1]=Texture2D'WP_shld_Heatshield.T_Heaters_p01',PerShieldTextures[2]=Texture2D'WP_shld_TowerShield.Materials.t_towershield_p01',PerShieldTextures[3]=Texture2D'WP_shld_Kite.T_kite_p01'))
	ShieldPatterns.Add((GearData=(GearNameID=Stripes),PerShieldTextures[0]=Texture2D'WP_shld_Buckler.T_buckler_p02',PerShieldTextures[1]=Texture2D'WP_shld_Heatshield.T_Heaters_p02',PerShieldTextures[2]=Texture2D'WP_shld_TowerShield.Materials.t_towershield_p02',PerShieldTextures[3]=Texture2D'WP_shld_Kite.T_kite_p02'))
	ShieldPatterns.Add((GearData=(GearNameID=Checkers),PerShieldTextures[0]=Texture2D'WP_shld_Buckler.T_buckler_p03',PerShieldTextures[1]=Texture2D'WP_shld_Heatshield.T_Heaters_p03',PerShieldTextures[2]=Texture2D'WP_shld_TowerShield.Materials.t_towershield_p02',PerShieldTextures[3]=Texture2D'WP_shld_Kite.T_kite_p03'))
	
	Tabards=((GearData=(GearNameID=Default)))

	AllowedClasses.Add(0)
	AllowedClasses.Add(1)
	AllowedClasses.Add(2)
	AllowedClasses.Add(3)
	AllowedClasses.Add(4)
	AllowedClasses.Add(5)
	AllowedClasses.Add(6)
	AllowedClasses.Add(7)
	AllowedTeams.Add(5)
}
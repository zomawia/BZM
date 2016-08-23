/**
* Copyright 2014, Torn Banner Studios, All rights reserved
* 
* A class that is allowed to override the paths the AssetStores are going to load
*/

interface BZMIAOCPawnAssetOverrider extends IAOCPawnAssetOverrider;

//simulated function BZMOverrideHelmetAssets(BZMPawn Pawn, out string SkeletalMeshPath, out string StaticMeshPath, out string MaterialPath, out string ParticleSystemPath, out int HelmetZ);
//
//simulated function BZMOverrideWeaponAssets(BZMPawn Pawn, class<AOCWeaponAttachment> AttachmentClass, out string SkeletalMeshPath, out string StaticMeshPath, out string MaterialPath, out byte bUseDefaultParameters, out SWeaponParameterSet WeaponParameterSets[3]);
//
//simulated function OverrideCharacterAssets(out string CharacterMeshPath, out string BodyMaterialPath, out string HeadMaterialPath, out string DecapMeshPath, out string OwnerMeshPath);
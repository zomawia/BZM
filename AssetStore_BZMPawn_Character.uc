/**
* Copyright 2014, Torn Banner Studios, All rights reserved
* 
* Loads/stores assets for a pawn's character */

class AssetStore_BZMPawn_Character extends AssetStore_AOCPawn_Character;

//var class<BZMCharacterInfo> CharacterInfo;
//
//var SkeletalMesh CharacterMesh;
//var SkeletalMesh DecapMesh;
//var SkeletalMesh OwnerMesh;
//var MaterialInterface BodyMaterial;
//var MaterialInterface HeadMaterial;
//
//var string CharacterMeshPath, BodyMaterialPath, HeadMaterialPath, DecapMeshPath, OwnerMeshPath;
//
//function AssetLoadComplete(Object LoadedObject, Object data, int Id)
//{
	//if(PathName(LoadedObject) ~= CharacterMeshPath)
	//{
		//CharacterMesh = SkeletalMesh(LoadedObject);
	//}
	//if(PathName(LoadedObject) ~= DecapMeshPath)
	//{
		//DecapMesh = SkeletalMesh(LoadedObject);
	//}
	//if(PathName(LoadedObject) ~= OwnerMeshPath)
	//{
		//OwnerMesh = SkeletalMesh(LoadedObject);
	//}
	//if(PathName(LoadedObject) ~= BodyMaterialPath)
	//{
		//BodyMaterial = MaterialInterface(LoadedObject);
	//}
	//if(PathName(LoadedObject) ~= HeadMaterialPath)
	//{
		//HeadMaterial = MaterialInterface(LoadedObject);
	//}
//
	//if(PendingObjects.Length == 0)
	//{
		//AllAssetsLoaded();
	//}
//}
//
//delegate AllAssetsLoaded();
//
//event Clear()
//{
	//super.Clear();
//
	//CharacterInfo = none;
	//CharacterMesh = none;
	//DecapMesh = none;
	//OwnerMesh = none;
	//BodyMaterial = none;
	//HeadMaterial = none;
//}
//
//defaultproperties
//{
	//LoadComplete = AssetLoadComplete;
//}
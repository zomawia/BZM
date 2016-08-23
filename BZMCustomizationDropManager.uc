/**
* Copyright 2014, Torn Banner Studios, All rights reserved
*  
* Original Author: Brady Brenot
* 
* Handles server communication, telling AOCCustomization about new drops, etc.
*/
class BZMCustomizationDropManager extends AOCCustomizationDropManager;	
//
//function Initialize(AOCPlayerController PC)
//{
	////local AOCPlayerController PC;
	//local class<BZMCustomizationContentBase> Content;
//
	//local int i;
//
	//local SDropInfo Drop;
	//local SWeaponItemInfo WeaponItem;
	//local SHelmetItemInfo HelmetItem;
//
	//local SWeaponItemInfoIdPair WeaponIdPair;
	//local array<SWeaponItemInfoIdPair> WeaponIdPairs;
//
	//local SHelmetItemInfoIdPair HelmetIdPair;
	//local array<SHelmetItemInfoIdPair> HelmetIdPairs;
//
	//local SRetrieveDropInfo DropIdPair;
	//local array<SRetrieveDropInfo> DropIdPairs;
//
	//local SMicroTxOwnership OwnershipInfo;
//
	////this doesn't work if the server is populating the drop list
	//if(PC == none)
		//PC = AOCPlayerController(Class'WorldInfo'.static.GetWorldInfo().GetALocalPlayerController());
	//Content = class<BZMCustomizationContentBase>(FindObject(PC.CustomizationClass.default.CustomizationContentClassString, class'Class'));
//
	//// Set up all the script hardcoded drops (which won't be coming off the server)
//
	//foreach Content.default.Drops(Drop, i)
	//{
		//DropIdPair.DropId = i;
		//DropIdPair.DropInfo = Drop;
		//DropIdPairs.AddItem(DropIdPair);
		//AcquirableDrops.AddItem(i);
//
		////Cache MicroTx drops for quick access. *Assumes only one drop per MicroTxId*
		//if(Drop.GearData.MicroTxID > 0)
		//{
			//OwnershipInfo.HelmetIds = Drop.HelmetItemIds;
			//OwnershipInfo.WeaponIds = Drop.WeaponItemIds;
			//SetOwnershipByMicroTxId(Drop.GearData.MicroTxID, OwnershipInfo);
		//}
	//}
	//AddDropInfoPayloadToMap(DropIdPairs);
//
	//foreach Content.default.Weapons(WeaponItem, i)
	//{
		//WeaponIdPair.ItemId = i;
		//WeaponIdPair.ItemInfo = WeaponItem;
		//WeaponIdPairs.AddItem(WeaponIdPair);
	//}
	//AddWeaponInfosToMap(WeaponIdPairs);
//
	//foreach Content.default.Helmets(HelmetItem, i)
	//{
		//HelmetIdPair.ItemId = i;
		//HelmetIdPair.ItemInfo = HelmetItem;
		//HelmetIdPairs.AddItem(HelmetIdPair);
	//}
	//AddHelmetInfosToMap(HelmetIdPairs);
//}
//
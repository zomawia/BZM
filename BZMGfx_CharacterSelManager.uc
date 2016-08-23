class BZMGfx_CharacterSelManager extends AOCGfx_CharacterSelManager;

event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{    
	local bool bResult;
	bResult = false;
	switch(WidgetName)
    {      
	case ('MessageOfTheDay'):
		if (MessageOfTheDay == none)
		{
			MessageOfTheDay = AOCView_HUD_Motd(Widget);
			ConfigureView(MessageOfTheDay, WidgetName, WidgetPath);
			MenusLoaded++;
			CheckAllMenusLoaded();
			bResult = true;
		}
		break;
	case ('TeamSelect'):
		if (TeamSelection == none)
		{
			TeamSelection = AOCView_HUD_TeamSelect(Widget);
			ConfigureView(TeamSelection, WidgetName, WidgetPath);
			MenusLoaded++;
			CheckAllMenusLoaded();
			bResult = true;
		}
		break;
	case ('ClassSelect'):
		if (ClassSelection == none)
		{
			ClassSelection = AOCView_HUD_ClassSelect(Widget);
			ConfigureView(ClassSelection, WidgetName, WidgetPath);
			ClassSelection.PostConfigureWidgetInit();
			MenusLoaded++;
			CheckAllMenusLoaded();
			bResult = true;
		}
		break;
	case ('WeaponSelect'):
		if (WeaponSelection == none)
		{
			WeaponSelection = AOCView_HUD_WeaponSelect(Widget);
			ConfigureView(WeaponSelection, WidgetName, WidgetPath);
			MenusLoaded++;
			CheckAllMenusLoaded();
			bResult = true;
		}
		break;
	case ('LoadoutSelect'):
		if (LoadoutSelection == none)
		{
			LoadoutSelection = BZMView_HUD_Loadout(Widget);
			ConfigureView(LoadoutSelection, WidgetName, WidgetPath);
			MenusLoaded++;
			CheckAllMenusLoaded();
			bResult = true;
		}
		break;
	case ('ConfirmDialog'):
		if (ConfirmDialog == none)
		{
			ConfirmDialog = AOCView_ConfirmDialog(Widget);
			ConfigureView(ConfirmDialog, WidgetName, WidgetPath);
			bResult = true;
		}
		break;
	case ('PasswordDialog'):
		if (PasswordDialog == none)
		{
			PasswordDialog = AOCView_PasswordDialog(Widget);
			ConfigureView(PasswordDialog, WidgetName, WidgetPath);
			bResult = true;
		}
		break;
    }
	return bResult;
}


defaultproperties
{
	//AllViewData.Add((ViewName="LoadoutSelect",ViewSWF="BZMUI.BZMUI_QuickStart"))
	//WidgetBindings.Add((WidgetName="joinButton",WidgetClass=class'GFxCLIKWidget'))
    //WidgetBindings.Add((WidgetName="exitButton",WidgetClass=class'GFxCLIKWidget'))
	
	WidgetBindings.Add((WidgetName="LoadoutSelect",WidgetClass=class'BZMView_HUD_Loadout'))

}
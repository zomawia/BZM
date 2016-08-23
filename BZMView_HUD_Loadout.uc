class BZMView_HUD_Loadout extends AOCView_HUD_Loadout;

// overrude
function OnClickHandler(GFxClikWidget.EventData Params)
{
	Manager.TimeElapsedSinceUpdate = 0.f;
	switch(Params.target.GetString("_name"))
	{
		case "archer_section":
			AOCPlayerController(Manager.PlayerOwner).LocalRequestJoinClass(0);
			JoinClass = ECLASS_Peasant;
			break;
		case "maa_section":
			AOCPlayerController(Manager.PlayerOwner).LocalRequestJoinClass(1);
			JoinClass = ECLASS_Peasant;
			break;
		case "vanguard_section":
			AOCPlayerController(Manager.PlayerOwner).LocalRequestJoinClass(2);
			JoinClass = ECLASS_Peasant;
			break;
		case "knight_section":
			AOCPlayerController(Manager.PlayerOwner).LocalRequestJoinClass(3);
			JoinClass = ECLASS_Peasant;
			break;
		//case "random_select":
		//	bDidRequestRandom = true;
		//	AOCPlayerController(Manager.PlayerOwner).LocalRequestJoinClass(4);
		//	break;
		//case "GoBackButton":
		//	if (AOCFFAPlayerController(Manager.PlayerOwner) != none ||
		//		CDWDuelPlayerController(Manager.PlayerOwner) != none)
		//	{
		//		// Join Spectator Team - We can end class selection now
		//		AOCPlayerController(Manager.PlayerOwner).JoinSpectatorTeam();
		//		AOCBaseHUD(Manager.PlayerOwner.myHUD).EarlyExitSelection();
		//		AOCPlayerController(Manager.PlayerOwner).LeaveTempTeam(true);
		//	}
		//	else
		//	{
		//		OnEscapeKeyPress();
		//	}
		//	break;
		//case "QuitButton":
		//	// Reset selected team to what it was before - if we actually haven't set a team yet, we can just leave it where it was
		//	if (AOCPRI(Manager.PlayerOwner.PlayerReplicationInfo).MyFamilyInfo.FamilyFaction== EFAC_AGATHA)
		//		AOCBaseHUD(Manager.PlayerOwner.myHUD).SelectedTeam = 0;
		//	else if (AOCPRI(Manager.PlayerOwner.PlayerReplicationInfo).MyFamilyInfo.FamilyFaction== EFAC_MASON)
		//		AOCBaseHUD(Manager.PlayerOwner.myHUD).SelectedTeam = 1;

		//	AOCBaseHUD(Manager.PlayerOwner.myHUD).EarlyExitSelection();
		//	AOCPlayerController(Manager.PlayerOwner).LeaveTempTeam(false);
		//	break;
		case "ExitButton":
			OnEscapeKeyPress();
			break;
	}
}

defaultproperties
{
}
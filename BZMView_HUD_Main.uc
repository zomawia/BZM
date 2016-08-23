class BZMView_HUD_Main extends AOCView_HUD_Main;

/* ************************************************************************
 * PLAYER NAME FUNCTIONALITY
 * - Display player name text based on team
 **************************************************************************/
function BZMUpdatePlayerNameText(string PlayerName, EAOCFaction Faction, int Law)
{
	local int CurrentLaw;
	local string Construct;
	
	CurrentLaw = Law;

	//ReplaceSpecialChar(PlayerName);

	// Blue/Red for teams	
	if (Faction == EFAC_Agatha)
		{
		if (CurrentLaw >= 0 && CurrentLaw < 50) // citizen, white
		{			
			Construct = "<font color=\""$NeutralChatColor$"\">"$PlayerName$"</font>";			
		}
		
		else if (CurrentLaw >= 50 && CurrentLaw < 125) // lawman, light blue
		{			
			Construct = "<font color=\"#dae3f1\">"$PlayerName$"</font>";
		}
		
		else if (CurrentLaw >= 150 && CurrentLaw < 300) // lawman, reg blue
		{			
			Construct = "<font color=\"#4872B6\">"$PlayerName$"</font>";
		}
		
		else if (CurrentLaw >= 300 && CurrentLaw < 500) // knight, deep blue
		{
			Construct = "<font color=\"#24395b\">"$PlayerName$"</font>";
		}

		else if (CurrentLaw >= 500) // champion, gold
		{			
			Construct = "<font color=\"#e5e600\">"$PlayerName$"</font>";
		}		
	}
	
	else if (Faction == EFAC_Mason)
	{
		if (CurrentLaw <= 0 && CurrentLaw > -200) // vagabond, light pink
		{			
			Construct = "<font color=\"#f7eded\">"$PlayerName$"</font>";
		}
		
		else if (CurrentLaw <= -200 && CurrentLaw > -750) // bandit, light red
		{
			Construct = "<font color=\"#dfb9b9\">"$PlayerName$"</font>";
		}
		
		else if (CurrentLaw <= -750 && CurrentLaw > -1200) // bandit, reg red
		{
			Construct = "<font color=\"#924242\">"$PlayerName$"</font>";			
		}
		
		else if (CurrentLaw >= -1200 && CurrentLaw < -2500) // outlaw, deep red
		{
			Construct = "<font color=\"#582828\">"$PlayerName$"</font>";
		}

		else if (CurrentLaw <= -2500) // rogue, black
		{
			Construct = "<font color=\"#231010\">"$PlayerName$"</font>";
		}	
	}
	
	else if (Faction == EFAC_NPC)
	{		
		Construct = "<font color=\"#FFFFFF\">"$PlayerName$"</font>";
	}
		
	else if (Faction == EFAC_FFA)
	{		
		Construct = "<font color=\"#387b38\">"$PlayerName$"</font>";
	}
	
	PlayerNameWidget.GetObject("textField").SetString("htmlText", Construct);
}
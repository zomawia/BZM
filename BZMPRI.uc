class BZMPRI extends AOCPRI;

/** Mod variables. */
var repnotify int	Law;
var repnotify int	Wood;
var repnotify int	Bounty;
var repnotify int	Metal;
var repnotify int	Credit;

// clan tag
var repnotify string	ClanTag;

replication
{
	// Things the server should send to the client.
	if (bNetDirty)
		Law, ClanTag, Wood, Bounty, Metal, Credit;
}

function CopyProperties(PlayerReplicationInfo PRI)
{
	super.CopyProperties(PRI);
		
	//adding new vars to PRI
	BZMPRI(PRI).Law = Law;
	BZMPRI(PRI).Wood = Wood;
	BZMPRI(PRI).Bounty = Bounty;
	BZMPRI(PRI).Metal = Metal;
	BZMPRI(PRI).Credit = Credit;
}

// override to add law rating coloring and emblems
simulated function string GetPlayerNameForMarkup()
{
	local string NewName;
	NewName = PlayerName;
	NewName = Repl(NewName, "&", "&#38;");
	NewName = Repl(NewName, "<", "&#60;");
	NewName = Repl(NewName, ">", "&#62;");
	NewName = Repl(NewName, "\\", "&#92;");

	if (Law >= 0 && Law < 10) // citizen, white
	{
		NewName $= "<font color=\"#ffffff\">"$Chr(9005)$"</font>";
	}
	
	if (Law >= 0 && Law < 20) // citizen, white
	{
		NewName $= "<font color=\"#e5f0ff\">"$Chr(9005)$"</font>";
	}
		
	if (Law >= 20 && Law < 40) // lawman, light blue
	{
		NewName $= "<font color=\"#cce0ff\">"$Chr(9005)$"</font>";
	}
	
	if (Law >= 40 && Law < 70) // lawman, light blue
	{
		NewName $= "<font color=\"#80b3ff\">"$Chr(9005)$"</font>";
	}
		
	if (Law >= 70 && Law < 100) // lawman, light blue
	{
		NewName $= "<font color=\"#3385ff\">"$Chr(9005)$"</font>";
	}
	
	if (Law >= 100 && Law < 200) // lawman, reg blue
	{
		NewName $= "<font color=\"#0066ff\">"$Chr(9005)$"</font>";
	}
		
	if (Law >= 200 && Law < 300) // knight, deep blue
	{
		NewName $= "<font color=\"#0052cc\">"$Chr(9005)$"</font>";
	}
	
	if (Law >= 300 && Law <= 500) // knight, deep blue
	{
		NewName $= "<font color=\"#003d99\">"$Chr(9005)$"</font>";
	}

	if (Law > 500) // champion, gold
	{
		NewName $= "<font color=\"#E5E600\">"$Chr(9005)$"</font>";
	}
			
	if (Law < 0 && Law > -200) // vagabond, light pink
	{
		NewName $= "<font color=\"#f7eded\">"$Chr(9006)$"</font>";
	}
		
	if (Law <= -200 && Law > -450) // bandit, light red
	{
		NewName $= "<font color=\"#dfb9b9\">"$Chr(9006)$"</font>";
	}
	
	if (Law <= -450 && Law > -600) // bandit, light red
	{
		NewName $= "<font color=\"#c78484\">"$Chr(9006)$"</font>";
	}
		
	if (Law <= -600 && Law > -750) // bandit, light red
	{
		NewName $= "<font color=\"#b86161\">"$Chr(9006)$"</font>";
	}	
		
	if (Law <= -750 && Law > -1000) // bandit, reg red
	{
		NewName $= "<font color=\"#924242\">"$Chr(9006)$"</font>";
	}
		
	if (Law <= -1000 && Law > -1500) // outlaw, deep red
	{
		NewName $= "<font color=\"#7b3838\">"$Chr(9006)$"</font>";
	}
	
	if (Law <= -1500 && Law > -2500) // outlaw, deep red
	{
		NewName $= "<font color=\"#582828\">"$Chr(9006)$"</font>";
	}

	if (Law <= -2500) // rogue, black
	{
		NewName $= "<font color=\"#231010\">"$Chr(9006)$"</font>";
	}	
		
	//if (DevStatus == EDEV_HasDevKey)
	//{
		//NewName $= "<font color=\"#999999\">"$"[Ex"$Chr(8482)$"]"$"</font>";
	//}
	//else if (DevStatus == EDEV_Dev)
	//{
		//NewName $= "<font color=\"#FF8F00\">"$Chr(8482)$"</font>";
	//}
	//else if (CharacterCustomization.FactionSupportId != EFAC_None && !bIsBot)
	//{
		//if(CharacterCustomization.FactionSupportId == EFAC_Agatha)
			//NewName $= "<font color=\"#4872B6\">"$Chr(9005)$"</font>";
		//else if(CharacterCustomization.FactionSupportId == EFAC_Mason)
			//NewName $= "<font color=\"#924242\">"$Chr(9006)$"</font>";
	//}
//
	//if(bIsBot)
	//{
		//NewName = Repl(NewName, "BOT", "<font color=\"#B27500\">BOT</font>");
	//}

	return NewName;
}

defaultproperties
{
	Score=10
}
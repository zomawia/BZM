class BZMBaseHud extends AOCTUTHUD;

var BZMPRI ShowLaw;
//var Font LawFont;
//var string LawText;

// override with blank to disable scoreboard
exec function ShowScoreboard(bool bShow)
{
	
}

//
function BZMUpdatePlayerName(string Text, EAOCFaction Faction, int Law)
{
	if (!CheckCanUseHUD())
		return;
	BZMGFx_HUDManager(HUD).BZMMainHUD.BZMUpdatePlayerNameText(Text, Faction, Law);
}

// DrawHud
function DrawHUD()
{
	/*local AOCCaptureVolume CapVolume;
	local KillInfo sKillInfo;	
	local int StartIndictatorY;
	local Vector PointVec, VectorDir;
	local Vector2D ScreenPositionVec;*/
	local HUDMessage sHUDMes;
	local EAOCFaction Faction;
	local float PlayerDist;
	local string ActorName, ActorText;
	local ECrosshairInfoType ViewType;
	local int ActorLaw;

	if (PlayerOwner == none)
		return;

	// draw HUD messages
	if (AllHUDMessage.Length > 0)
	{
		Canvas.Font = Class'Engine'.Static.GetMediumFont();
		Canvas.SetPos(Canvas.SizeX/2, Canvas.SizeY/2);
		Canvas.DrawColor = OrangeColor;
		foreach AllHUDMessage(sHUDMes)
		{
			Canvas.DrawText(sHUDMes.MessageText);
		}
	}

	if (CharManager != none && CharManager.bInitialized)
	{
		CharManager.TimeElapsedSinceUpdate += RenderDelta;
		if (CharManager.TimeElapsedSinceUpdate > 0.5f)
		{
			CharManager.UpdateRelevant();
		}

		//If the MOTD refuses to come through, skip it (extra safety on HS 286 because we don't have a repro case)
		if(CharManager.StartedWaitingForMotdTime >= 0 && Worldinfo.TimeSeconds - CharManager.StartedWaitingForMotdTime > 5.f)
		{
			CharManager.bSkipMotd = true;
			CharManager.StartFlow();
		}
	}

	if (HUD != none)
	{
		HUD.TimeElapsedSinceUpdate += RenderDelta;
		if (HUD.TimeElapsedSinceUpdate > 0.7f)
		{
			HUD.UpdateRelevant();

			if(EscapeMenu != none)
			{
				EscapeMenu.UpdateRelevant();
			}
		}
	}

	UpdateDynamicHUDMarkers();

	

	if (AOCPawn(PlayerOwner.Pawn) == none && AOCSW_Base(PlayerOwner.Pawn) == none)
	{
		// Make sure no name is displayed and turn off information box
		UpdatePlayerName("", EFAC_NONE);
		
		//This, purely for displaying player name when in Spectator Follow (until we have proper HUD support for it)
		if(AOCPawn(PlayerOwner.ViewTarget) == none || !bOverrideSubXhair)
		{
			ShowInfomationBox(false);
		}
		else
		{
			ShowInfomationBox(true, OverrideText, "");
		}
		
		//Player names when you're looking at them in Spectator Freecam
		
		ActorName = AOCPlayerController(PlayerOwner).GetViewName(Faction, PlayerDist, ActorText, ViewType);
		ShowHintCrosshair(false, EHX_Default, "");
		if(ActorName != "None" && ViewType == EXHAIRINFO_Player)
		{
			UpdatePlayerName(ActorName, Faction);

			// Update Melee Crosshair
			if (AOCDuelGRI(WorldInfo.GRI) == none && CDWDuelGRI(WorldInfo.GRI) == none && AOCFFAGRI(Worldinfo.GRI) == none)
			{
				UpdateMeleeCrosshair(true, Faction != AOCPlayerController(PlayerOwner).CurrentFamilyInfo.FamilyFaction);
			}
			else
			{
				UpdateMeleeCrosshair(true, true);
			}
		}
		else
		{
			UpdatePlayerName("", Faction);

			// Make sure Information box is hidden
			ShowInfomationBox(false);

			UpdateMeleeCrosshair(false);
		}
		
		bForceHintCrosshair = false;
		ShowHintCrosshair(false, EHX_Default, "");
		// Update Melee Crosshair
		UpdateMeleeCrosshair(false);
		return;
	}
	else if (AOCSW_Base(PlayerOwner.Pawn) != none)
	{
		ShowHintCrosshair(false, EHX_Default, "");
		UpdateMeleeCrosshair(false);
		TurnOnRangeCrosshair();
		if (bOverrideSubXhair)
		{
			ShowInfomationBox(true, OverrideText, "");
		}
		else
			ShowInfomationBox(false);
		return;
	}

	super.DrawHUD();

	if (bDebugSpeed)
	{
		Canvas.Font = Font'AOC_UI_Common.DescriptionFont';
		Canvas.SetPos(Canvas.SizeX - 40.0f, Canvas.SizeY - Canvas.Font.GetMaxCharHeight() );
		Canvas.DrawColor = RedColor;
		Canvas.DrawText(string(VSize(AOCPlayerController(PlayerOwner).Pawn.Velocity)), true);

		Canvas.SetPos(Canvas.SizeX - 70.0f, Canvas.SizeY - 2.5 * Canvas.Font.GetMaxCharHeight() );
		Canvas.DrawText(string(AOCPawn(AOCPlayerController(PlayerOwner).Pawn).SprintTime)@string(AOCPawn(PlayerOwner.Pawn).StateVariables.bCanSprint), true);
	}

	if (bDebugReach)
	{
		Canvas.Font = Font'AOC_UI_Common.DescriptionFont';
		Canvas.SetPos(Canvas.SizeX - 40.0f, Canvas.SizeY - Canvas.Font.GetMaxCharHeight() );
		Canvas.DrawColor = RedColor;
		Canvas.DrawText(string(AOCWeaponAttachment(AOCPawn(PlayerOwner.Pawn).CurrentWeaponAttachment).fLongestWeaponReach), true);
	}


	// Handle Override of the Hint Crosshair First
	if (bForceHintCrosshair)
	{
		ShowHintCrosshair(true , ForcedHintXhairImg, ForcedHintXhairText);
	}
	else
	{

		ActorName = AOCPlayerController(PlayerOwner).GetViewName(Faction, PlayerDist, ActorText, ViewType);
		ActorLaw = BZMPRI(PlayerOwner.PlayerReplicationInfo).Law;
		if (ViewType == EXHAIRINFO_Use)
		{
			// Usable Object
			ShowHintCrosshair(true, EHX_Use, ActorName);
		}
		else
		{
			ShowHintCrosshair(false, EHX_Default, "");
			if(ActorName != "None" )
			{
				if (ViewType == EXHAIRINFO_Player)
				{
					BZMUpdatePlayerName(ActorName, Faction, ActorLaw);

					// Update Melee Crosshair
					if (AOCDuelGRI(WorldInfo.GRI) == none && CDWDuelGRI(WorldInfo.GRI) == none && AOCFFAGRI(Worldinfo.GRI) == none)
					{
						UpdateMeleeCrosshair(true, Faction != AOCPlayerController(PlayerOwner).CurrentFamilyInfo.FamilyFaction);
					}
					else
					{
						UpdateMeleeCrosshair(true, true);
					}

				}
				else if (ViewType == EXHAIRINFO_Box)
				{
					// Actor that displays an information box or text under screen
					ShowInfomationBox(true, ActorName, ActorText);
					UpdateMeleeCrosshair(false);
				}
				else if(ViewType == EXHAIRINFO_BoxWithUse)
				{
					ShowHintCrosshair(true, EHX_Use, "");
					// Actor that displays an information box or text under screen
					ShowInfomationBox(true, ActorName, ActorText);
					UpdateMeleeCrosshair(false);
				}
			}
			else
			{
				BZMUpdatePlayerName("", Faction, ActorLaw);

				// Make sure Information box is hidden
				ShowInfomationBox(false);

				UpdateMeleeCrosshair(false);
			}
		}
	}

	if (bOverrideSubXhair)
	{
		ShowInfomationBox(true, OverrideText, "");
	}
}


defaultproperties
{
	HUDClass=class'BZMGFx_HudManager'
	PawnClass=class'BZMPawn'
}
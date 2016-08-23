class BZMUIJoin extends GFxMoviePlayer;
	//dependson (AOCPlayerController)
	//dependson (AOCGFxView);

/** Reference to the label used to display the message on the UI */
var GFxCLIKWidget JoinButton;

/** Reference to the button used to close the UI - must add a widget binding since we expect a GFxCLIKWidget */
var GFxCLIKWidget ExitButton;

// Called when the UI is opened to start the movie
function bool Start(optional bool StartPaused = false)
{
	// Start playing the movie
    Super.Start();

	// Initialize all objects in the movie
    Advance(0);

    return true;
}

// Callback automatically called for each object in the movie with enableInitCallback enabled
event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
    // Determine which widget is being initialized and handle it accordingly
    switch(Widgetname)
    {
        case 'joinButton':
        	// Save reference to the label that displays the message to the player
            JoinButton = GFxCLIKWidget(Widget);
            //AOCPlayerController(Manager.PlayerOwner).LocalRequestJoinClass(0);
			//JoinClass = ECLASS_Peasant;
			break;
			                   
        case 'exitButton':
        	// Save reference to the button that closes the UI
		// the Widget is cast to a GFxCLIKWidget to allow for event listeners - see WidgetBindings
            ExitButton = GFxCLIKWidget(Widget);
            // Add a delegate for when this button is clicked
            ExitButton.AddEventListener('CLIK_click', CloseMovie);
            break;
            
        default:
        	// Pass on if not a widget we are looking for
            return Super.WidgetInitialized(Widgetname, WidgetPath, Widget);
    }
    
    return false;
}


// Delegate added to close the movie
function CloseMovie(EventData data)
{
    // Only on left mouse button
    if(data.mouseIndex == 0)
    {
    	// Close the UI
        Close();
    }
}

defaultproperties
{
    // The imported SWF to use
	MovieInfo=SwfMovie'BZMUI.BZMUI_QuickStart'

    // Set widget bindings so the Widget passed to
    // WidgetInitialized for the buttons is a GFxCLICKWidget
    WidgetBindings.Add((WidgetName="joinButton",WidgetClass=class'GFxCLIKWidget'))
    WidgetBindings.Add((WidgetName="exitButton",WidgetClass=class'GFxCLIKWidget'))

    // Set properties for the movie
    // TimingMode=TM_Real makes the menu run while the game is paused
    bDisplayWithHudOff=TRUE
    TimingMode=TM_Real
	bPauseGameWhileActive=TRUE
	bCaptureInput=true
}
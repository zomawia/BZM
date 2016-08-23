/**
* modified from CMWSeqAction_ChangePlayerScore
*/
class BZMSeqAction_ChangePlayerWood extends SequenceAction
	dependson(CMWTO2);

//This is a delta (an addition/subtraction) if you shoot the "Delta" input. This is an amount to set straight-up if you shoot the "Set" input.
var() int Amount;

event Activated()
{
	local array<Object> ObjVars;
	local Object Obj;
	local Controller PC;
	local bool bIsADelta;

	if (InputLinks[0].bHasImpulse || InputLinks[1].bHasImpulse)
	{
		bIsADelta = InputLinks[0].bHasImpulse;

		if(CMWTO2(GetWorldInfo().Game) != none)
		{
			GetObjectVars(ObjVars, "Player(s)");
			foreach ObjVars(Obj)
			{
				PC = GetController(Actor(Obj));
				if(AOCPRI(PC.PlayerReplicationInfo) != none)
				{
					if(bIsADelta)
					{
						BZMPRI(PC.PlayerReplicationInfo).Wood += Amount;
					}
					else
					{
						BZMPRI(PC.PlayerReplicationInfo).Wood = Amount;
					}
				}
			}
		}
	}
}

defaultproperties
{
	// generic input 
	InputLinks(0)=(LinkDesc="Delta (relative)")
	InputLinks(1)=(LinkDesc="Set (absolute)")
	VariableLinks(1)=(ExpectedType=class'SeqVar_Object',LinkDesc="Player(s)")

	ObjName="Change Player Wood"
	ObjCategory="BZM Actions"

	bCallHandler=false
}

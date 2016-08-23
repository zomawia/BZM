/**
* modified from CMWSeqAction_ChangePlayerScore
*/
class BZMSeqAction_TradeWoodScore extends SequenceAction
	dependson(CMWTO2);

//This is a delta (an addition/subtraction) if you shoot the "Delta" input. This is an amount to set straight-up if you shoot the "Set" input.
var() int TradeRate;

event Activated()
{
	local array<Object> ObjVars;
	local Object Obj;
	local Controller PC;
	local bool bIsADelta;
	local int Amount;

	if (InputLinks[0].bHasImpulse)
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
						Amount = BZMPRI(PC.PlayerReplicationInfo).Wood / TradeRate;
						BZMPRI(PC.PlayerReplicationInfo).Score += Amount;
						BZMPRI(PC.PlayerReplicationInfo).Wood -= Amount * TradeRate;
					}					
				}
			}
		}
	}
}

defaultproperties
{
	// generic input 
	InputLinks(0)=(LinkDesc="Input")
	VariableLinks(1)=(ExpectedType=class'SeqVar_Object',LinkDesc="Player(s)")

	ObjName="Trade Wood to Score"
	ObjCategory="BZM Actions"

	bCallHandler=false
}

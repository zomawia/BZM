/**
* modified from CMWSeqAction_ChangePlayerScore
*/
class BZMSeqAction_TradeScoreCredit extends SequenceAction
	dependson(CMWTO2);

//This is a delta (an addition/subtraction) if you shoot the "Delta" input. This is an amount to set straight-up if you shoot the "Set" input.
var() int Amount;

event Activated()
{
	local array<Object> ObjVars, BankVars;
	local Object Obj, Banker;
	local BZMPRI BankActor;
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
					GetObjectVars(BankVars, "Bank");
					foreach BankVars(Banker)
					{
						BankActor = BZMPRI(Banker);
						if(bIsADelta)
						{
							if (PC.PlayerReplicationInfo.Score >= Amount)
							{
								BZMPRI(PC.PlayerReplicationInfo).Credit += Amount;
								PC.PlayerReplicationInfo.Score -= Amount;

								BankActor.Score += Amount;															
							}
						}
						else if (PC.PlayerReplicationInfo.Score >= Amount)
						{
							BZMPRI(PC.PlayerReplicationInfo).Credit = Amount;
							BankActor.Score += Amount;
						}
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
	VariableLinks(2)=(ExpectedType=class'SeqVar_Object',LinkDesc="Bank")

	ObjName="Trade Score for Credit (Bank Deposit)"
	ObjCategory="BZM Actions"

	bCallHandler=false
}

/**
 * Copyright 2013, Torn Banner Studios, All rights reserved
 * 
 * Original Author: Brady Brenot
 */
class BZMCustomizationTeam_Agatha extends AOCCustomizationTeam_Agatha;


defaultproperties
{
	TeamID=0

	bNoColorLimit=false

	//Emblems
	//agatha
	Emblems.Add((Img=Texture2D'CH_Emblems.Agatha.t_agathalion-single',	GearData=(GearNameID=AgathaLion1)))
	Emblems.Add((Img=Texture2D'CH_Emblems.t_ge_dev',			GearData=(GearNameID=GDev,AppID=222360,bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'CH_Emblems.T_blank',				GearData=(GearNameID=GBlank)))
	Emblems.Add((Img=Texture2D'CH_Emblems.Agatha.t_agathacross-single',	GearData=(GearNameID=AgathaCross1)))
	Emblems.Add((Img=Texture2D'CH_Emblems.Agatha.t_agathacross-dual',	GearData=(GearNameID=AgathaCross2)))
	Emblems.Add((Img=Texture2D'CH_Emblems.Agatha.t_agathacross-four',	TabardOverrideImg=Texture2D'CH_Emblems.Agatha.t_agathacross-single',	GearData=(GearNameID=AgathaCross4)))
	Emblems.Add((Img=Texture2D'CH_Emblems.Agatha.T_agathacrosslion',	TabardOverrideImg=Texture2D'CH_Emblems.Agatha.t_agathacross-single',	GearData=(GearNameID=AgathaCrossLion)))
	Emblems.Add((Img=Texture2D'CH_Emblems.Agatha.t_agathalion-six',	TabardOverrideImg=Texture2D'CH_Emblems.Agatha.t_agathalion-single',	GearData=(GearNameID=AgathaLion6)))
	Emblems.Add((Img=Texture2D'CH_Emblems.Agatha.t_agathalion-three',	GearData=(GearNameID=AgathaLion3)))

	//agatha barb icons---BEARS!!!
	Emblems.Add((Img=Texture2D'CH_Barb_Emblems.t_be_bear1',	GearData=(GearNameID=BarbBear1,bVisibleInSelectorIfUnowned=false, GearStoreDescriptionID=Barb_MAA_Bundle_1, MicroTxID=101024, bPartOfBundle=true, BundleNameID=Barb_MAA_Bundle_1)))
	Emblems.Add((Img=Texture2D'CH_Barb_Emblems.t_be_bear2',	GearData=(GearNameID=BarbBear2,bVisibleInSelectorIfUnowned=false, GearStoreDescriptionID=Barb_Archer_Bundle_1, MicroTxID=101021, bPartOfBundle=true, BundleNameID=Barb_Archer_Bundle_1)))
	Emblems.Add((Img=Texture2D'CH_Barb_Emblems.t_be_bear3',	GearData=(GearNameID=BarbBear3,bVisibleInSelectorIfUnowned=false, GearStoreDescriptionID=Barb_Knight_Bundle_1, MicroTxID=101022, bPartOfBundle=true, BundleNameID=Barb_Archer_Bundle_1)))
	Emblems.Add((Img=Texture2D'CH_Barb_Emblems.t_be_bear4',	GearData=(GearNameID=BarbBear4,bVisibleInSelectorIfUnowned=false, GearStoreDescriptionID=Barb_Vanguard_Bundle_1, MicroTxID=101023, bPartOfBundle=true, BundleNameID=Barb_Vanguard_Bundle_1)))

	//generic emblem batch1
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems1.T_ge_dragon',			GearData=(GearNameID=GDragon)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems1.t_ge_helm',			GearData=(GearNameID=GHelm)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems1.t_ge_rose',			GearData=(GearNameID=GRose)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems1.t_ge_serpenttower',	GearData=(GearNameID=GSerpTower)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems1.t_ge_stars',			GearData=(GearNameID=GStars)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems1.t_ge_weapcross1',		GearData=(GearNameID=GWep1)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems1.t_ge_weapcross2',		GearData=(GearNameID=GWep2)))
	
	//generic emblem batch2
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems2.t_ge_arrows',		GearData=(GearNameID=GArrows)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems2.t_ge_boar',		GearData=(GearNameID=GBoar)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems2.t_ge_claws',		GearData=(GearNameID=GClaws)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems2.t_ge_crustacean',		GearData=(GearNameID=GCrust)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems2.t_ge_griffin',		GearData=(GearNameID=GGriffin)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems2.t_ge_hammer',		GearData=(GearNameID=GHam)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems2.t_ge_huntsman',		GearData=(GearNameID=GHunts)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems2.t_ge_meowric',		GearData=(GearNameID=GMeow)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems2.t_ge_rams',		GearData=(GearNameID=GRams)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems2.t_ge_scorp',		GearData=(GearNameID=GScorp)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems2.t_ge_sickle',		GearData=(GearNameID=GSickle)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems2.t_ge_spears',		GearData=(GearNameID=GSpears)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems2.t_ge_taurus',		GearData=(GearNameID=GTaurus)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems2.t_ge_varg',		GearData=(GearNameID=GWolf)))
	
	//generic emblem batch3
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems3.t_ge_bearknight',		GearData=(GearNameID=GBearKnight)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems3.t_ge_clover',		GearData=(GearNameID=GClover)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems3.t_ge_crab',		GearData=(GearNameID=GCrab)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems3.t_ge_eagleclaws',		GearData=(GearNameID=GEagleClaws)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems3.t_ge_fishes',		GearData=(GearNameID=GFishes)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems3.t_ge_sailfish',		GearData=(GearNameID=GSailfish)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems3.t_ge_skullarrow',		GearData=(GearNameID=GSkullArrow)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems3.t_ge_sunthing',		GearData=(GearNameID=GSunthing)))
	Emblems.Add((Img=Texture2D'CH_Emblems.emblems3.t_ge_triskell',		GearData=(GearNameID=GTriskell)))
	
	//COMMUNITY EMBLEM DROP
	//agatha
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Agatha.T_CE_admin-fleury',		GearData=(GearNameID=CFleur1)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Agatha.T_CE_TobiahSullivan-fleur',		GearData=(GearNameID=CFleur2)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Agatha.T_CE_Raegarth-fleuryang',		GearData=(GearNameID=CFleur3)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Agatha.T_CE_StijnKralingen-warriorsfleur',		GearData=(GearNameID=CFleur4)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Agatha.T_CE_admin-rampantlion',		GearData=(GearNameID=CLion1)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Agatha.T_CE_taartmetkaas-lionel',		GearData=(GearNameID=CLion2)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Agatha.T_CE_blindguardian-goatee',		GearData=(GearNameID=CGoat1)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Agatha.T_CE_MattOades-GoatLion',		GearData=(GearNameID=CGoat2)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Agatha.T_CE_MattOades-UnichornSnakeLion',		GearData=(GearNameID=CLion3)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Agatha.T_CE_JanneSirainen-crowncrest',		GearData=(GearNameID=CCrest1)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Agatha.T_CE_JanneSirainen-rosecrest',		GearData=(GearNameID=CCrest2)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Agatha.T_CE_JulienDiels-electricpony',		GearData=(GearNameID=CPony)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Agatha.T_CE_LiamKennedy-Swordsmen',		GearData=(GearNameID=CSwordsmen)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Agatha.T_CE_razvanpandor-crown',		GearData=(GearNameID=CCrown)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Agatha.T_CE_taartmetkaas-feydrid',		GearData=(GearNameID=CAKing)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Agatha.T_CE_antoly-TempleCross',		GearData=(GearNameID=CTemCross)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Agatha.T_CE_ErikOhrn-celtycross',		GearData=(GearNameID=CCeltCross)))
	
	//generic
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_AlexHordern-Kick',		GearData=(GearNameID=CKick)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_ArtoElstela-ouroboros',		GearData=(GearNameID=COuroboros)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_BlavetBastien-bannerman',		GearData=(GearNameID=CBannerman)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_BlavetBastien-blazon',		GearData=(GearNameID=CBlazon)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_BlavetBastien-drakescrown',		GearData=(GearNameID=CDrakecrown)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_CorentinClays-balance',		GearData=(GearNameID=CBalance)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_CorentinClays-FatFrogs',		GearData=(GearNameID=CFatfrog)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_CorentinClays-Tree',		GearData=(GearNameID=CTree)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_CT-pawn',		GearData=(GearNameID=CPawn)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_MatthewS-king',		GearData=(GearNameID=CKing)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_DavePowell-maulrevival',		GearData=(GearNameID=CMaul)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_ErikOhrn-burningbush',		GearData=(GearNameID=CBurningbush)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_GianlucaAmatuccii-cresticle',		GearData=(GearNameID=CCresticle)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_GianlucaAmatuccii-defist',		GearData=(GearNameID=CDefist)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_GianlucaAmatuccii-deknight',		GearData=(GearNameID=CDeknight)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_GianlucaAmatuccii-partyhat',		GearData=(GearNameID=CPartyhat)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_Goron-apple',		GearData=(GearNameID=CApple)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_JulianHabenicht-cheers',		GearData=(GearNameID=CCheers)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_JustinTetreault-wolfsbane',		GearData=(GearNameID=CWolfsbane)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_KevinPeterburs-MLMAA',		GearData=(GearNameID=CMLMAA)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_khaarax-nestingknight',		GearData=(GearNameID=CNest)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_kilvertm-culthand',		GearData=(GearNameID=CHand)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_Kimiko-Paw1',		GearData=(GearNameID=CPaw)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_LeongSingDong-templar',		GearData=(GearNameID=CTemplar)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_MatthewS-endoskeleton',		GearData=(GearNameID=CEndoskel)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_MaxJensen-suspiciousjester',		GearData=(GearNameID=CJest)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_PatrykZatylny-shrubbery',		GearData=(GearNameID=CShrub)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_pnobio-ellosailor',		GearData=(GearNameID=CSailor)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_robertoHo-PEASANT',		GearData=(GearNameID=CPeasant)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_RyanDaimonas-sandwich',		GearData=(GearNameID=CSandwich)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_taartmetkaas-AA',		GearData=(GearNameID=CAA)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generic.T_CE_TheDen-tenderrose',		GearData=(GearNameID=CRosey)))

//bears
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.bear.T_CE_BrodieHill-bearcavalry',		GearData=(GearNameID=CBearCav)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.bear.T_CE_FilipEstelle-bearofbarema',		GearData=(GearNameID=CBearema)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.bear.T_CE_SandorClegane-bearmesser',		GearData=(GearNameID=CBearmess)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.bear.T_CE_taartmetkaas-beary',		GearData=(GearNameID=CBeary)))

//deer
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.deer.T_CE_CorentinClays-Dear',		GearData=(GearNameID=CDeerHead)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.deer.T_CE_FilipEstelle-deird',		GearData=(GearNameID=CDeeder)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.deer.T_CE_FraqFraq-prancer',		GearData=(GearNameID=CPrancer)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.deer.T_CE_MattOades-deelydeparted',		GearData=(GearNameID=CDeerhunter)))

//snakes
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.snake.T_CE_JaredThigpin-snake',		GearData=(GearNameID=CSnake1)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.snake.T_CE_KennethMalm-serpent',		GearData=(GearNameID=CSnake2)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.snake.T_CE_PasqualeErhard-serpentsembrace',		GearData=(GearNameID=CSnake3)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.snake.T_CE_CorentinClays-Serpent',		GearData=(GearNameID=CSnake4)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.Other.T_CE_TheDen-viperbite',		GearData=(GearNameID=CSnake5)))

//wolves
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.wolf.T_CE_ErikOhrn-howlow',				GearData=(GearNameID=CWolf1)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.wolf.T_CE_JustinTetreault-wolf',		GearData=(GearNameID=CWolf2)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.wolf.T_CE_kilvertm-lonewolfinc',		GearData=(GearNameID=CWolf3)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.wolf.T_CE_MattOades-BeardedWolf',		GearData=(GearNameID=CWolf4)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.wolf.T_CE_MattOades-BloodWolf',			GearData=(GearNameID=CWolf5)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.wolf.T_CE_taartmetkaas-wolfrage',		GearData=(GearNameID=CWolf6)))

//misc animals
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.Other.T_CE_AlexLounders-Shrimp',		GearData=(GearNameID=CShrimp)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.Other.T_CE_BlavetBastien-allaboard',		GearData=(GearNameID=CBoar)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.Other.T_CE_ChrisMcGowen-valtheimpaler',		GearData=(GearNameID=CUni)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.Other.T_CE_DavePowell-turkeygard',		GearData=(GearNameID=CTurkey)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.Other.T_CE_DavidThomas-dogknight',		GearData=(GearNameID=CDog)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.Other.T_CE_FilipEstelle-jackelopeasus',		GearData=(GearNameID=CJack)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.Other.T_CE_GianlucaAmatuccii-horsey',		GearData=(GearNameID=CHorse)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.Other.T_CE_BaptisteCharpentier-punkephant',		GearData=(GearNameID=CElephant)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.Other.T_CE_IvanWalsh-mammoth',		GearData=(GearNameID=CMammoth)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.Other.T_CE_JonTesta-6eyedbuffalo',		GearData=(GearNameID=CBuffalo)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.Other.T_CE_kilvertm-gremlinhouse',		GearData=(GearNameID=CGremlin)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.Other.T_CE_kilvertm-meowricscousin',		GearData=(GearNameID=CMeow)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.Other.T_CE_Kimiko-Bat',		GearData=(GearNameID=CBatSil)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.Other.T_CE_KnilSilversnake-batknight',		GearData=(GearNameID=CBatKnight)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.Other.T_CE_SilasJoiner-thesharkknight',		GearData=(GearNameID=CSharkKnight)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.Other.T_CE_TobiahSullivan-creeper',		GearData=(GearNameID=CSpidey)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.Other.T_CE_TobiahSullivan-flutterfly',		GearData=(GearNameID=CButt)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.animals.Other.T_CE_TylerSmith-bokbok',		GearData=(GearNameID=CBokBok)))

//celticvikings
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.celtvikingtheme.T_CE_blindguardian-axeknot',		GearData=(GearNameID=CCelt1)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.celtvikingtheme.T_CE_blindguardian-draugr',		GearData=(GearNameID=CCelt2)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.celtvikingtheme.T_CE_PatrykZatylny-dragonboat',		GearData=(GearNameID=CCelt3)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.celtvikingtheme.T_CE_PatrykZatylny-raidingparty',		GearData=(GearNameID=CCelt4)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.celtvikingtheme.T_CE_PatrykZatylny-vikingcross',		GearData=(GearNameID=CCelt5)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.celtvikingtheme.T_CE_PaulDouglas-pillage',		GearData=(GearNameID=CCelt6)))

//shapey
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.shapes.T_CE_AlexLounders-Clubs',		GearData=(GearNameID=CSuit1)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.shapes.T_CE_AlexLounders-Diamonds',		GearData=(GearNameID=CSuit2)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.shapes.T_CE_AlexLounders-Hearts',		GearData=(GearNameID=CSuit3)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.shapes.T_CE_FoxAce-spades',		GearData=(GearNameID=CSuit4)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.shapes.T_CE_JohnStobart-spade',		GearData=(GearNameID=CSuit5)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.shapes.T_CE_ErikOhrn-triangleception',		GearData=(GearNameID=CTrian)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.shapes.T_CE_FilipEstelle-allseeingluck',		GearData=(GearNameID=CLuck)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.shapes.T_CE_LiamKennedy-tmen',		GearData=(GearNameID=CTmen)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.shapes.T_CE_MarkFurtos-carouselofdeath',		GearData=(GearNameID=CCarousel)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.shapes.T_CE_taartmetkaas-bullseye',		GearData=(GearNameID=CBullse)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.shapes.T_CE_IvanWalsh-SunSigils',		GearData=(GearNameID=CSun1)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.shapes.T_CE_SavasYilmaz-starburst',		GearData=(GearNameID=CSun2)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.shapes.T_CE_TobiahSullivan-sun2',		GearData=(GearNameID=CSun3)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.shapes.T_CE_tonileivonen-redsun',		GearData=(GearNameID=CSun4)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.shapes.T_CE_tonileivonen-blackflower',		GearData=(GearNameID=CFlower)))

//skulls
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.skulls.T_CE_AlexHordern-PissPot',		GearData=(GearNameID=CSkulls1)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.skulls.T_CE_DavePowell-bullrush',		GearData=(GearNameID=CSkulls2)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.skulls.T_CE_kilvertm-trollking',		GearData=(GearNameID=CSkulls3)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.skulls.T_CE_NathanDye-Skull1',		GearData=(GearNameID=CSkulls4)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.skulls.T_CE_NathanDye-Skull2',		GearData=(GearNameID=CSkulls5)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.skulls.T_CE_NigelDavis-ogreskull',		GearData=(GearNameID=CSkulls6)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.skulls.T_CE_taartmetkaas-skullhood',		GearData=(GearNameID=CSkulls7)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.skulls.T_CE_TheDen-dragonskull',		GearData=(GearNameID=CSkulls8)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.skulls.T_CE_TheDen-fallenwarrior',		GearData=(GearNameID=CSkulls9)))

//weapons
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.Weapons.T_CE_CT-brokensword',		GearData=(GearNameID=CBrokenSword)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.Weapons.T_CE_DavePowell-houseofblades',		GearData=(GearNameID=CBladeHouse)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.Weapons.T_CE_ErikOhrn-griffinsbane',		GearData=(GearNameID=CGriffinBane)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.Weapons.T_CE_ErikOhrn-stabthesun',		GearData=(GearNameID=CStabSun)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.Weapons.T_CE_FraqFraq-daggnabit',		GearData=(GearNameID=CDagg)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.Weapons.T_CE_kilvertm-rangerbrotherhood',		GearData=(GearNameID=CRangers)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.Weapons.T_CE_MockolCone-artillerycorps',		GearData=(GearNameID=CArty)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.Weapons.T_CE_MockolCone-firepotabuse',		GearData=(GearNameID=CFirepot)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.Weapons.T_CE_phi-hunter',		GearData=(GearNameID=CHunter)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.Weapons.T_CE_razvanpandor-arrows',		GearData=(GearNameID=CArrows)))
	Emblems.Add((Img=Texture2D'CH_CommunityEmblems.Generictheme.Weapons.T_CE_taartmetkaas-snagger',		GearData=(GearNameID=CSnagger)))

	//KF2 promo
	Emblems.Add((Img=Texture2D'kf2_emblem.t_KF2_Horzine',		GearData=(GearNameID=KF2Horzine, bVisibleInSelectorIfUnowned=true, AppidNoDLC=232090, bPartOfBundle=true, BundleNameID=KF2_Item_Set_Name, GearStoreDescriptionID=KF2_Item_Set_Description)))

	//Rocket league promo
	Emblems.Add((Img=Texture2D'rocketleague_emblems.t_RL_ball',		GearData=(GearNameID=RocketLeague_Ball)))
	Emblems.Add((Img=Texture2D'rocketleague_emblems.t_RL_wagonleague',		GearData=(GearNameID=RocketLeague_Wagon)))

	//PAYDAY2 cross promo
	Emblems.Add((Img=Texture2D'pd2_emblems.t_pd2_2',		    GearData=(GearNameID=PAYDAY2_Emblem, bVisibleInSelectorIfUnowned=true, AppidNoDLC=218620, GearStoreDescriptionID=PAYDAY2_Item_Set_Description)))
	Emblems.Add((Img=Texture2D'pd2_emblems.t_pd2_anarchy',		GearData=(GearNameID=PAYDAY2_Anarchy, bVisibleInSelectorIfUnowned=true, AppidNoDLC=218620, GearStoreDescriptionID=PAYDAY2_Item_Set_Description)))
	Emblems.Add((Img=Texture2D'pd2_emblems.t_pd2_electric',		GearData=(GearNameID=PAYDAY2_ElectricCenter, bVisibleInSelectorIfUnowned=true, AppidNoDLC=218620, GearStoreDescriptionID=PAYDAY2_Item_Set_Description)))
	Emblems.Add((Img=Texture2D'pd2_emblems.t_pd2_freedomeagle',	GearData=(GearNameID=PAYDAY2_FreedomEagle, bVisibleInSelectorIfUnowned=true, AppidNoDLC=218620, GearStoreDescriptionID=PAYDAY2_Item_Set_Description)))
	Emblems.Add((Img=Texture2D'pd2_emblems.t_pd2_overkill',		GearData=(GearNameID=PAYDAY2_Overkill, bVisibleInSelectorIfUnowned=true, AppidNoDLC=218620, GearStoreDescriptionID=PAYDAY2_Item_Set_Description)))
	Emblems.Add((Img=Texture2D'pd2_emblems.t_pd2_starbreeze',	GearData=(GearNameID=PAYDAY2_Starbreeze, bVisibleInSelectorIfUnowned=true, AppidNoDLC=218620, GearStoreDescriptionID=PAYDAY2_Item_Set_Description)))
	Emblems.Add((Img=Texture2D'pd2_emblems.t_pd2_theQ',		    GearData=(GearNameID=PAYDAY2_TheQ, bVisibleInSelectorIfUnowned=true, AppidNoDLC=218620, GearStoreDescriptionID=PAYDAY2_Item_Set_Description)))
	Emblems.Add((Img=Texture2D'pd2_emblems.t_pd2_twolions',		GearData=(GearNameID=PAYDAY2_TwoLions, bVisibleInSelectorIfUnowned=true, AppidNoDLC=218620, GearStoreDescriptionID=PAYDAY2_Item_Set_Description)))


	//WARFRAME emblem
	Emblems.Add((Img=Texture2D'DigitalExtremes_Warframe.Warframe',		GearData=(GearNameID=WarFrame_Emblem1)))

	//Polaris PEEPS
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_JELLY',		GearData=(GearNameID=Polaris_Jelly, MicroTxId=101039, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_JESSECOX',		GearData=(GearNameID=Polaris_JesseCox, MicroTxId=101040, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_KOOTRA',		GearData=(GearNameID=Polaris_Kootra, MicroTxId=101041, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_KULEDUD3',		GearData=(GearNameID=Polaris_Kuledud3, MicroTxId=101042, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_MESSYOURSELF',		GearData=(GearNameID=Polaris_MessYourself, MicroTxId=101043, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_OCTOPIMP',		GearData=(GearNameID=Polaris_OctoPimp, MicroTxId=101044, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_SHOFU',		GearData=(GearNameID=Polaris_Shofu, MicroTxId=101045, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_SLYFOXHOUND',		GearData=(GearNameID=Polaris_Slyfoxhound, MicroTxId=101046, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_STRIPPIN',		GearData=(GearNameID=Polaris_Strippin, MicroTxId=101047, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_TB',		GearData=(GearNameID=Polaris_TotalBiscuit, MicroTxId=101048, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_UBERHAXORNOVA',		GearData=(GearNameID=Polaris_UberHaxorNova, MicroTxId=101049, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_WILLMCHD',		GearData=(GearNameID=Polaris_MrWilliamo, MicroTxId=101050, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_WOWCRENDOR',		GearData=(GearNameID=Polaris_WowCrendor, MicroTxId=101051, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_YOGSCASTKIM',		GearData=(GearNameID=Polaris_YogscastKim, MicroTxId=101052, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_YOGSCASTLALNA',		GearData=(GearNameID=Polaris_YogscastDuncan, MicroTxId=101053, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_YOGSCASTSIPS',		GearData=(GearNameID=Polaris_YogscastSips, MicroTxId=101054, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_YOGSCASTSJIN',		GearData=(GearNameID=Polaris_YogscastSjin, MicroTxId=101055, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_AJ2',		GearData=(GearNameID=Polaris_AngryJoe, MicroTxId=101056, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_BEDBANANAS',		GearData=(GearNameID=Polaris_BedBananas, MicroTxId=101057, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_BROTATO',		GearData=(GearNameID=Polaris_Brotato, MicroTxId=101058, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_COMMMANDERHOLLY',		GearData=(GearNameID=Polaris_CommanderHolly, MicroTxId=101059, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_CRIKEN2',		GearData=(GearNameID=Polaris_Criken, MicroTxId=101060, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_CRYAOTIC',		GearData=(GearNameID=Polaris_Cryaotic, MicroTxId=101061, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_DEADLOXMC',		GearData=(GearNameID=Polaris_Deadlox, MicroTxId=101062, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_DODGER',		GearData=(GearNameID=Polaris_Dodger, MicroTxId=101063, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_FORCESTRATEGYGAMING',		GearData=(GearNameID=Polaris_ForceStrategyGaming, MicroTxId=101064, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_GAMINGBEAVER',		GearData=(GearNameID=Polaris_GamingBeaver, MicroTxId=101065, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_IMMORTALHD',		GearData=(GearNameID=Polaris_ImmortalHD, MicroTxId=101066, bVisibleInSelectorIfUnowned=false)))
	Emblems.Add((Img=Texture2D'POLCW.T_POLCW_CHIVALRYEMBLEMS_INTHELITTLEWOD',		GearData=(GearNameID=Polaris_Inthelittlewood, MicroTxId=101067, bVisibleInSelectorIfUnowned=false)))
	//COMMUNITY EMBLEM END

	//Colors
	TabardColorsPrimary.Add((R=0.133193,G=0.236336,B=0.475121))	//blue FF6584B5
	TabardColorsPrimary.Add((R=1,G=1,B=1))							//white FFFFFF
	TabardColorsPrimary.Add((R=0.39,G=0.46,B=0.63)) //light blue FFA6B3CE
	//TabardColorsPrimary.Add((R=.715465,G=0.618686,B=0.238828))		//gold FFDACC84
	TabardColorsPrimary.Add((R=0.066596,G=0.118168,B=0.237560))	//darkblue FF4A6084

	TabardColorsSecondary.Add((R=0.133193,G=0.236336,B=0.475121))	//blue
	TabardColorsSecondary.Add((R=1,G=1,B=1))							//white
	TabardColorsSecondary.Add((R=.715465,G=0.618686,B=0.238828))		//gold
	TabardColorsSecondary.Add((R=0.066596,G=0.118168,B=0.237560))	//darkblue

	TabardColorsTrim.Add((R=0.02,G=0.02,B=0.02))//grey
	TabardColorsTrim.Add((R=0.40,G=0.40,B=0.40))
	TabardColorsTrim.Add((R=0.80,G=0.80,B=0.80))
	TabardColorsTrim.Add((R=0.05,G=0.06,B=0.05))//extra grey
	TabardColorsTrim.Add((R=0.20,G=0.20,B=0.20))
	TabardColorsTrim.Add((R=1.00,G=1.00,B=1.00))
	TabardColorsTrim.Add((R=0.116018,G=0.106613,B=0.070553))//brown
	TabardColorsTrim.Add((R=0.290196,G=0.266666,B=0.176470))
	TabardColorsTrim.Add((R=0.552941,G=0.517647,B=0.337254))
	TabardColorsTrim.Add((R=0.143641,G=0.143641,B=0.093173))//tan
	TabardColorsTrim.Add((R=0.435294,G=0.435294,B=0.282352))
	TabardColorsTrim.Add((R=0.588235,G=0.588235,B=0.447058))
	TabardColorsTrim.Add((R=0.045055,G=0.132592,B=0.028321))//green
	TabardColorsTrim.Add((R=0.137254,G=0.403921,B=0.086274))
	TabardColorsTrim.Add((R=0.239215,G=0.701960,B=0.149019))
	TabardColorsTrim.Add((R=0.013917,G=0.030996,B=0.088395))//blue
	TabardColorsTrim.Add((R=0.075670,G=0.135018,B=0.270708))
	TabardColorsTrim.Add((R=0.360784,G=0.470588,B=0.647058))
	TabardColorsTrim.Add((R=0.109803,G=0.129411,B=0.1686274))//unblue
	TabardColorsTrim.Add((R=0.207843,G=0.243137,B=0.3176470))
	TabardColorsTrim.Add((R=0.431372,G=0.486274,B=0.5764705))
	TabardColorsTrim.Add((R=0.138116,G=0.083417,B=0.134014))//pink
	TabardColorsTrim.Add((R=0.396078,G=0.239215,B=0.384313))
	TabardColorsTrim.Add((R=0.631372,G=0.305882,B=0.635294))
	TabardColorsTrim.Add((R=0.176789,G=0.061539,B=0.000000))//orange
	TabardColorsTrim.Add((R=0.513793,G=0.228682,B=0.000000))
	TabardColorsTrim.Add((R=0.823174,G=0.311655,B=0.000000))
	TabardColorsTrim.Add((R=0.125581,G=0.127067,B=0.009616))//yellow
	TabardColorsTrim.Add((R=0.491695,G=0.429399,B=0.067672))
	TabardColorsTrim.Add((R=.715465,G=0.618686,B=0.238828))
	
	ShieldColors.Add((R=0.133193,G=0.236336,B=0.475121))	//blue
	ShieldColors.Add((R=1,G=1,B=1))							//white
	ShieldColors.Add((R=.715465,G=0.618686,B=0.238828))		//gold
	ShieldColors.Add((R=0.066596,G=0.118168,B=0.237560))	//darkblue
	
	EmblemColors.Add((R=0.02,G=0.02,B=0.02))//grey
	EmblemColors.Add((R=0.40,G=0.40,B=0.40))
	EmblemColors.Add((R=0.80,G=0.80,B=0.80))
	EmblemColors.Add((R=0.05,G=0.06,B=0.05))//extra grey
	EmblemColors.Add((R=0.20,G=0.20,B=0.20))
	EmblemColors.Add((R=1.00,G=1.00,B=1.00))
	EmblemColors.Add((R=0.116018,G=0.106613,B=0.070553))//brown
	EmblemColors.Add((R=0.290196,G=0.266666,B=0.176470))
	EmblemColors.Add((R=0.552941,G=0.517647,B=0.337254))
	EmblemColors.Add((R=0.143641,G=0.143641,B=0.093173))//tan
	EmblemColors.Add((R=0.435294,G=0.435294,B=0.282352))
	EmblemColors.Add((R=0.588235,G=0.588235,B=0.447058))
	EmblemColors.Add((R=0.045055,G=0.132592,B=0.028321))//green
	EmblemColors.Add((R=0.137254,G=0.403921,B=0.086274))
	EmblemColors.Add((R=0.239215,G=0.701960,B=0.149019))
	EmblemColors.Add((R=0.013917,G=0.030996,B=0.088395))//blue
	EmblemColors.Add((R=0.075670,G=0.135018,B=0.270708))
	EmblemColors.Add((R=0.360784,G=0.470588,B=0.647058))
	EmblemColors.Add((R=0.109803,G=0.129411,B=0.1686274))//unblue
	EmblemColors.Add((R=0.207843,G=0.243137,B=0.3176470))
	EmblemColors.Add((R=0.431372,G=0.486274,B=0.5764705))
	EmblemColors.Add((R=0.138116,G=0.083417,B=0.134014))//pink
	EmblemColors.Add((R=0.396078,G=0.239215,B=0.384313))
	EmblemColors.Add((R=0.631372,G=0.305882,B=0.635294))
	EmblemColors.Add((R=0.176789,G=0.061539,B=0.000000))//orange
	EmblemColors.Add((R=0.513793,G=0.228682,B=0.000000))
	EmblemColors.Add((R=0.823174,G=0.311655,B=0.000000))
	EmblemColors.Add((R=0.125581,G=0.127067,B=0.009616))//yellow
	EmblemColors.Add((R=0.491695,G=0.429399,B=0.067672))
	EmblemColors.Add((R=.715465,G=0.618686,B=0.238828))
	

	DefaultEmblemColorIndex[0]=2
	DefaultEmblemColorIndex[1]=1
	DefaultEmblemColorIndex[2]=16

	DefaultTabardColorIndex[0]=0
	DefaultTabardColorIndex[1]=1
	DefaultTabardColorIndex[2]=11

	DefaultShieldColorIndex[0]=0
	DefaultShieldColorIndex[1]=1
	DefaultShieldColorIndex[2]=2
}
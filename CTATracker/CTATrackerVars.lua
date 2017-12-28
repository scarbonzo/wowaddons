--Version 3.1 Config 7.0 update
--fixed display not updating
--general categories to watch
CTATracker_HeroicWatch = true;
CTATracker_TWWatch = true;
CTATracker_LFRWatch = true;
--heroic roles to watch
CTATracker_HeroicTankWatch = false;
CTATracker_HeroicHealerWatch = false;
CTATracker_HeroicDPSWatch = false;
--timewalking roles to watch
CTATracker_TWTankWatch = false;
CTATracker_TWHealerWatch = false;
CTATracker_TWDPSWatch = false;
--LFR roles to watch
CTATracker_LFRTankWatch = false;
CTATracker_LFRHealerWatch = false;
CTATracker_LFRDPSWatch = false;
--Group checker for frame hiding
CTATracker_GroupStop = false;
--Current CTA status
CTATracker_CurrentlyHeroicCTA = false;
CTATracker_CurrentlyTWCTA = false;
CTATracker_CurrentlyLFRCTA = false;
--dungeon ids
CTATracker_HeroicID = 1046;
CTATracker_TWID = {995,1146,744}; --WOTLK TW, don't know others
CTATracker_LFRID = {1287,1288,1289,1411,1290,1291,1292,1293};
CTATracker_LFRNames = {"DarkB","TormG","Aln","ToV","ArcA","Royal Ath","Night","BetRise"};
--frame
CTATracker_InnerFrame = nil;
CTATracker_ConfigFrame = nil;
--current cta display
CTATracker_CurrentCTA = {CTATracker_MainFrame};
CTATracker_NumberOfCTA = 1;
--current num of role icons
CTATracker_RoleIcons = {};
CTATracker_CurrentRoleIconNum = 0;
--current num of enter queue Buttons
CTATracker_EnterQueueButtons = {};
CTATracker_CurrentEnterQueueNum = 1;
--Last important relativePoint
CTATracker_NextRelativePoint = nil;

--frame height
CTATracker_FrameHeight = 0;
--frame scale
CTATracker_FrameScale = 1.10;

--group and raid tracking
CTATracker_IsGrouped = false;

--play sound
CTATracker_PlaySound = false;

--checkbutton globals
CTATracker_HWCheckButton = nil;
CTATracker_HWTankCheckButton = nil;
CTATracker_HWHealerCheckButton =  nil;
CTATracker_HWDPSCheckButton = nil;

CTATracker_TWWCheckButton = nil;
CTATracker_TWWTankCheckButton = nil;
CTATracker_TWWHealerCheckButton = nil;
CTATracker_TWWDPSCheckButton = nil;

CTATracker_LFRWCheckButton = nil;
CTATracker_LFRWTankCheckButton = nil;
CTATracker_LFRWHealerCheckButton = nil;
CTATracker_LFRWDPSCheckButton = nil;

CTATracker_HWPlaySoundCheckButton = nil;

--individual join group Buttons
CTATracker_HeroicJoinButton = nil;

CTATracker_TWJoinButton1 = nil;
CTATracker_TWJoinButton2 = nil;
CTATracker_TWJoinButton3 = nil;

CTATracker_DarkBJoinButton = nil;
CTATracker_TormGJoinButton = nil;
CTATracker_AlnJoinButton = nil;
CTATracker_ToVJoinButton = nil;
CTATracker_ArcAJoinButton = nil;
CTATracker_RoyalAthJoinButton = nil;
CTATracker_NightJoinButton = nil;
CTATracker_BetRiseJoinButton = nil;

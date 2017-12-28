SLASH_CTA1 = '/cta';

function CTATracker_handler(msg, editbox)
	if CTATracker_MainFrame:IsVisible() and msg=="" then
		CTATracker_MainFrame:Hide();
	elseif msg=="" then
		CTATracker_MainFrame:Show();
		CTATracker_LFGUpdate();
	end
	if msg == "hwatch" then
		CTATracker_HeroicWatchConfig();
	end
	if msg == "hwatchtank" then
		CTATracker_HeroicWatchTank();
	end
	if msg == "hwatchhealer" then
		CTATracker_HeroicWatchHealer();
	end
	if msg == "hwatchdps" then
		CTATracker_HeroicWatchDPS();
	end

	if msg == "twwatchtank" then
		CTATracker_TWWatchTank();
	end
	if msg == "twwatchhealer" then
		CTATracker_TWWatchHealer();
	end
	if msg == "twwatchdps" then
		CTATracker_TWWatchDPS();
	end

	if msg == "lfrwatchtank" then
		CTATracker_LFRWatchTank();
	end
	if msg == "lfrwatchhealer" then
		CTATracker_LFRWatchHealer();
	end
	if msg == "lfrwatchdps" then
		CTATracker_LFRWatchDPS();
	end

  if msg == "twwatch" then
    CTATracker_TWWatchConfig();
  end
  if msg == "lfrwatch" then
    CTATracker_LFRWatchConfig();
  end
	if msg == "status" then
		CTATracker_Status();
	end
	if msg == "sound" then
		CTATracker_SoundConfig();
	end
	if msg == "help" then
		CTATracker_Help();
	end
	if msg == "config" then
		CTATracker_Config();
	end
end
SlashCmdList["CTA"] = CTATracker_handler;
--------------------------------------------------------------------------------
--heroic related
--------------------------------------------------------------------------------
function CTATracker_HeroicWatchConfig()
	if CTATracker_HeroicWatch == true then
		print("CTA: Heroic watching - off.");
		CTATracker_HeroicWatch = false;
		CTATracker_HWCheckButton:SetChecked(false);
		CTATracker_LFGUpdate();
	else
		print("CTA: Heroic watching - on.");
		CTATracker_HeroicWatch = true;
		CTATracker_HWCheckButton:SetChecked(true);
		CTATracker_HeroicTankWatch = false;
		CTATracker_HWTankCheckButton:SetChecked(false);
		CTATracker_HeroicHealerWatch = false;
		CTATracker_HWHealerCheckButton:SetChecked(false);
		CTATracker_HeroicDPSWatch = false;
		CTATracker_HWDPSCheckButton:SetChecked(false);
		CTATracker_LFGUpdate();
	end
end

function CTATracker_HeroicWatchTank()
	if(CTATracker_HeroicTankWatch == true) then
		print("CTA: Heroic Tank watching - off");
		CTATracker_HeroicTankWatch = false;
		CTATracker_HWTankCheckButton:SetChecked(false);
	else
		print("CTA: Heroic Tank watching - on");
		print("CTA: Heroic watching - off.");
		CTATracker_HeroicTankWatch = true;
		CTATracker_HWTankCheckButton:SetChecked(true);
		CTATracker_HeroicWatch = false;
		CTATracker_HWCheckButton:SetChecked(false);
	end
	CTATracker_LFGUpdate();
end
function CTATracker_HeroicWatchHealer()
	if(CTATracker_HeroicHealerWatch == true) then
		print("CTA: Heroic Healer watching - off");
		CTATracker_HeroicHealerWatch = false;
		CTATracker_HWHealerCheckButton:SetChecked(false);
	else
		print("CTA: Heroic Healer watching - on");
		print("CTA: Heroic watching - off.");
		CTATracker_HeroicHealerWatch = true;
		CTATracker_HWHealerCheckButton:SetChecked(true);
		CTATracker_HeroicWatch = false;
		CTATracker_HWCheckButton:SetChecked(false);
	end
	CTATracker_LFGUpdate();
end
function CTATracker_HeroicWatchDPS()
	if(CTATracker_HeroicDPSWatch == true) then
		print("CTA: Heroic DPS watching - off");
		CTATracker_HeroicDPSWatch = false;
		CTATracker_HWDPSCheckButton:SetChecked(false);
	else
		print("CTA: Heroic DPS watching - on");
		print("CTA: Heroic watching - off.");
		CTATracker_HeroicDPSWatch = true;
		CTATracker_HWDPSCheckButton:SetChecked(true);
		CTATracker_HeroicWatch = false;
		CTATracker_HWCheckButton:SetChecked(false);
	end
	CTATracker_LFGUpdate();
end
--------------------------------------------------------------------------------
--Timewalking related
--------------------------------------------------------------------------------
function CTATracker_TWWatchConfig()
	if CTATracker_TWWatch == true then
		print("CTA: Timewalking watching - off.");
		CTATracker_TWWatch = false;
		CTATracker_TWWCheckButton:SetChecked(false);
		CTATracker_LFGUpdate();
	else
		print("CTA: Timewalking watching - on.");
		CTATracker_TWWatch = true;
		CTATracker_TWWCheckButton:SetChecked(true);
		CTATracker_TWTankWatch = false;
		CTATracker_TWWTankCheckButton:SetChecked(false);
		CTATracker_TWHealerWatch = false;
		CTATracker_TWWHealerCheckButton:SetChecked(false);
		CTATracker_TWDPSWatch = false;
		CTATracker_TWWDPSCheckButton:SetChecked(false);
		CTATracker_LFGUpdate();
	end
end
function CTATracker_TWWatchTank()
	if(CTATracker_TWTankWatch == true) then
		print("CTA: Timewalking Tank watching - off");
		CTATracker_TWTankWatch = false;
		CTATracker_TWWTankCheckButton:SetChecked(false);
	else
		print("CTA: Timewalking Tank watching - on");
		print("CTA: Timewalking watching - off.");
		CTATracker_TWTankWatch = true;
		CTATracker_TWWTankCheckButton:SetChecked(true);
		CTATracker_TWWatch = false;
		CTATracker_TWWCheckButton:SetChecked(false);
	end
	CTATracker_LFGUpdate();
end
function CTATracker_TWWatchHealer()
	if(CTATracker_TWHealerWatch == true) then
		print("CTA: Timewalking Healer watching - off");
		CTATracker_TWHealerWatch = false;
		CTATracker_TWWHealerCheckButton:SetChecked(false);
	else
		print("CTA: Timewalking Healer watching - on");
		print("CTA: Timewalking watching - off.");
		CTATracker_TWHealerWatch = true;
		CTATracker_TWWHealerCheckButton:SetChecked(true);
		CTATracker_TWWatch = false;
		CTATracker_TWWCheckButton:SetChecked(false);
	end
	CTATracker_LFGUpdate();
end
function CTATracker_TWWatchDPS()
	if(CTATracker_TWDPSWatch == true) then
		print("CTA: Timewalking DPS watching - off");
		CTATracker_TWDPSWatch = false;
		CTATracker_TWWDPSCheckButton:SetChecked(false);
	else
		print("CTA: Timewalking DPS watching - on");
		print("CTA: Timewalking watching - off.");
		CTATracker_TWDPSWatch = true;
		CTATracker_TWWDPSCheckButton:SetChecked(true);
		CTATracker_TWWatch = false;
		CTATracker_TWWCheckButton:SetChecked(false);
	end
	CTATracker_LFGUpdate();
end
--------------------------------------------------------------------------------
--LFR related
--------------------------------------------------------------------------------
function CTATracker_LFRWatchConfig()
	if CTATracker_LFRWatch == true then
		print("CTA: LFR watching - off.");
		CTATracker_LFRWatch = false;
		CTATracker_LFRWCheckButton:SetChecked(false);
		CTATracker_LFGUpdate();
	else
		print("CTA: LFR watching - on.");
		CTATracker_LFRWatch = true;
		CTATracker_LFRWCheckButton:SetChecked(true);
		CTATracker_LFRTankWatch = false;
		CTATracker_LFRWTankCheckButton:SetChecked(false);
		CTATracker_LFRHealerWatch = false;
		CTATracker_LFRWHealerCheckButton:SetChecked(false);
		CTATracker_LFRDPSWatch = false;
		CTATracker_LFRWDPSCheckButton:SetChecked(false);
		CTATracker_LFGUpdate();
	end
end
function CTATracker_LFRWatchTank()
	if(CTATracker_LFRTankWatch == true) then
		print("CTA: LFR Tank watching - off");
		CTATracker_LFRTankWatch = false;
		CTATracker_LFRWTankCheckButton:SetChecked(false);
	else
		print("CTA: LFR Tank watching - on");
		print("CTA: LFR watching - off.");
		CTATracker_LFRTankWatch = true;
		CTATracker_LFRWTankCheckButton:SetChecked(true);
		CTATracker_LFRWatch = false;
		CTATracker_LFRWCheckButton:SetChecked(false);
	end
	CTATracker_LFGUpdate();
end
function CTATracker_LFRWatchHealer()
	if(CTATracker_LFRHealerWatch == true) then
		print("CTA: LFR Healer watching - off");
		CTATracker_LFRHealerWatch = false;
		CTATracker_LFRWHealerCheckButton:SetChecked(false);
	else
		print("CTA: LFR Healer watching - on");
		print("CTA: LFR watching - off.");
		CTATracker_LFRHealerWatch = true;
		CTATracker_LFRWHealerCheckButton:SetChecked(true);
		CTATracker_LFRWatch = false;
		CTATracker_LFRWCheckButton:SetChecked(false);
	end
	CTATracker_LFGUpdate();
end
function CTATracker_LFRWatchDPS()
	if(CTATracker_LFRDPSWatch == true) then
		print("CTA: LFR DPS watching - off");
		CTATracker_LFRDPSWatch = false;
		CTATracker_LFRWDPSCheckButton:SetChecked(false);
	else
		print("CTA: LFR DPS watching - on");
		print("CTA: LFR watching - off.");
		CTATracker_LFRDPSWatch = true;
		CTATracker_LFRWDPSCheckButton:SetChecked(true);
		CTATracker_LFRWatch = false;
		CTATracker_LFRWCheckButton:SetChecked(false);
	end
	CTATracker_LFGUpdate();
end
--------------------------------------------------------------------------------
--Config Frame
--------------------------------------------------------------------------------
function CTATracker_Config()
	if(CTATracker_ConfigFrame:IsVisible()) then
		CTATracker_ConfigFrame:Hide();
	else
		CTATracker_ConfirmBoxes(); --mistakes with addon loading, fix with watching for poper addon event
		CTATracker_ConfigFrame:Show();
	end
end
--------------------------------------------------------------------------------
--Status related
--------------------------------------------------------------------------------
function CTATracker_Status()
	print("~~~~~~~~~~~~~~~~~~~~");
	print("Call to arms status");
	print("~~~~~~~~~~~~~~~~~~~~");
	if(CTATracker_HeroicWatch == true) then
		print("CTA: Heroic watching - on");
	else
		print("CTA: Heroic watching - off");
	end
  if(CTATracker_TWWatch == true) then
		print("CTA: Timewalking watching - on");
	else
		print("CTA: Timewalking watching - off");
	end
  if(CTATracker_LFRWatch == true) then
		print("CTA: LFR watching - on");
	else
		print("CTA: LFR watching - off");
	end
	if(CTATracker_HeroicTankWatch == true) then
		print("CTA: Heroic Tank watching - on");
	else
		print("CTA: Heroic Tank watching - off");
	end
	if(CTATracker_HeroicHealerWatch == true) then
		print("CTA: Heroic Healer watching - on");
	else
		print("CTA: Heroic Healer watching - off");
	end
	if(CTATracker_HeroicDPSWatch == true) then
		print("CTA: Heroic DPS watching - on");
	else
		print("CTA: Heroic DPS watching - off");
	end

	if(CTATracker_TWTankWatch == true) then
		print("CTA: Timewalking Tank watching - on");
	else
		print("CTA: Timewalking Tank watching - off");
	end
	if(CTATracker_TWHealerWatch == true) then
		print("CTA: Timewalking Healer watching - on");
	else
		print("CTA: Timewalking Healer watching - off");
	end
	if(CTATracker_TWDPSWatch == true) then
		print("CTA: Timewalking DPS watching - on");
	else
		print("CTA: Timewalking DPS watching - off");
	end

	if(CTATracker_LFRTankWatch == true) then
		print("CTA: LFR Tank watching - on");
	else
		print("CTA: LFR Tank watching - off");
	end
	if(CTATracker_LFRHealerWatch == true) then
		print("CTA: LFR Healer watching - on");
	else
		print("CTA: LFR Healer watching - off");
	end
	if(CTATracker_LFRDPSWatch == true) then
		print("CTA: LFR DPS watching - on");
	else
		print("CTA: LFR DPS watching - off");
	end

	if(CTATracker_PlaySound == true) then
		print("Sound Notification - on");
	else
		print("Sound Notification - off");
	end

	if(CTATracker_CurrentlyHeroicCTA == true) then
		print("There is currently a Heroic CTA");
	else
		print("There is currently no Heroic CTA");
	end

	if(CTATracker_CurrentlyTWCTA == true) then
		print("There is currently a Timewalking CTA");
	else
		print("There is currently no Timewalking CTA");
	end

	if(CTATracker_CurrentlyLFRCTA == true) then
		print("There is currently a LFR CTA");
	else
		print("There is currently no LFR CTA");
	end
end

function CTATracker_SoundConfig()
	if(CTATracker_PlaySound == true) then
		print("Sound Notification - off");
		CTATracker_PlaySound = false;
		CTATracker_HWPlaySoundCheckButton:SetChecked(false);
	else
		print("Sound Notification - on");
		CTATracker_PlaySound = true;
		CTATracker_HWPlaySoundCheckButton:SetChecked(true);
	end
end

function CTATracker_Help()
	print("~~~~~~~~~~~~~~~~~~~~");
	print("Call to arms help");
	print("~~~~~~~~~~~~~~~~~~~~");
	print("/cta - toggles show or hide of frame");
	print("/cta config - toggles config window");
	print("/cta hwatch - toggles whether to watch for a heroic CTA. If you are watching for a CTA the frame will auto show when the addon finds one. This is the same as having hwatchtank,hwatchhealer,and hwatchdps all on.");
	print("/cta hwatchtank - toggles to watch specifically for tank CTA, will turn off general HCTA watching.");
	print("/cta hwatchhealer - toggles to watch specifically for healer CTA, will turn off general HCTA watching.");
	print("/cta hwatchdps - toggles to watch specifically for DPS CTA, will turn off general HCTA watching.");

  print("/cta twwatch - toggles whether to watch for a Timewalking CTA. If you are watching for a CTA the frame will auto show when the addon finds one. This is the same as having twwatchtank,twwatchhealer,and twwatchdps all on.");
	print("/cta twwatchtank - toggles to watch specifically for tank CTA, will turn off general TWCTA watching.");
	print("/cta twwatchhealer - toggles to watch specifically for healer CTA, will turn off general TWCTA watching.");
	print("/cta twwatchdps - toggles to watch specifically for DPS CTA, will turn off general TWCTA watching.");

  print("/cta lfrwatch - toggles whether to watch for a LFR CTA. If you are watching for a CTA the frame will auto show when the addon finds one. This is the same as having lfrwatchtank,lfrwatchhealer,and lfrwatchdps all on.");
	print("/cta lfrwatchtank - toggles to watch specifically for tank CTA, will turn off general LFRCTA watching.");
	print("/cta lfrwatchhealer - toggles to watch specifically for healer CTA, will turn off general LFRCTA watching.");
	print("/cta lfrwatchdps - toggles to watch specifically for DPS CTA, will turn off general HCTA LFRatching.");

	print("/cta status - prints if currently watching for heroic CTA and if there is a known CTA ongoing");

	print("/cta sound - toggles sound notification upon heroic CTA event. Currently, only for heroic and timewalking in hwatch or twatch mode.");
	print("/cta help - prints this menu");
end

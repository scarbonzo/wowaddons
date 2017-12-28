function CTATracker_AddToConfigFrame()
  ------------------------------------------------------------------------------
  --Config Window Title Header
  ------------------------------------------------------------------------------
  CTATracker_ConfigHeader = CTATracker_ConfigFrame:CreateFontString(nil, "ARTWORK","GAMEFONTNORMAL");
  CTATracker_ConfigHeader:SetPoint("TOP",CTATracker_ConfigFrame,0,-5);
  CTATracker_ConfigHeader:SetText("CTA TRACKER CONFIG");

  CTATracker_LFRSplit = CTATracker_ConfigFrame:CreateFontString(nil,"ARTWORK","GameFontNormal");
  CTATracker_ScaleHeader = CTATracker_ConfigFrame:CreateFontString(nil, "ARTWORK","GameFontNormal");
  CTATracker_ScaleNumber = CTATracker_ConfigFrame:CreateFontString(nil, "ARTWORK","GameFontNormal");
  ------------------------------------------------------------------------------
  --Config Window Close Button
  ------------------------------------------------------------------------------
  local button = CreateFrame("Button", nil, CTATracker_ConfigFrame)
	button:SetPoint("TOP", CTATracker_ConfigFrame, 100, -5)
	button:SetWidth(10)
	button:SetHeight(10)

	button:SetText("X")
	button:SetNormalFontObject("GameFontNormal")

	local ntex = button:CreateTexture()
	ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
	ntex:SetTexCoord(0, 0.625, 0, 0.6875)
	ntex:SetAllPoints()
	button:SetNormalTexture(ntex)

	local htex = button:CreateTexture()
	htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
	htex:SetTexCoord(0, 0.625, 0, 0.6875)
	htex:SetAllPoints()
	button:SetHighlightTexture(htex)

	local ptex = button:CreateTexture()
	ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
	ptex:SetTexCoord(0, 0.625, 0, 0.6875)
	ptex:SetAllPoints()
	button:SetPushedTexture(ptex)
  button:SetScript("OnClick", function() CTATracker_ConfigFrame:Hide(); end);
  ------------------------------------------------------------------------------
  --Slider for Scale
  ------------------------------------------------------------------------------
  CTATracker_ScaleSlider = CreateFrame("Slider","S",CTATracker_ConfigFrame);
  CTATracker_ScaleSlider:SetPoint("TOPRIGHT",-10,-25);
  CTATracker_ScaleSlider:SetWidth(130);
  CTATracker_ScaleSlider:SetHeight(15);
  CTATracker_ScaleSlider:SetOrientation("HORIZONTAL");
  CTATracker_ScaleSlider:SetThumbTexture("Interface\\Buttons\\UI-SliderBar-Button-Horizontal");
  CTATracker_ScaleSlider:SetMinMaxValues(0.5,3.0);
  CTATracker_ScaleSlider:SetValueStep(0.05);
  CTATracker_ScaleSlider:SetObeyStepOnDrag(true);
  CTATracker_ScaleSlider:SetValue(CTATracker_MainFrame:GetScale());
  CTATracker_ScaleSlider:SetBackdrop({
        bgFile="Interface\\Buttons\\UI-SliderBar-Background",
        edgeFile="Interface\\Buttons\\UI-SliderBar-Border",
        tile = true, tileSize =8, edgeSize =8,
        insets = {left =3, right =3, top =6, bottom =6}});
  CTATracker_ScaleSlider:SetScript("OnValueChanged", function(self, value) CTATracker_ScaleNumber:SetText(round(value,2)); CTATracker_MainFrame:SetScale(value); CTATracker_FrameScale = value; end);

  CTATracker_ScaleNumber:SetPoint("TOPLEFT",CTATracker_ScaleSlider,-30,-2);
  CTATracker_ScaleNumber:SetText(CTATracker_MainFrame:GetScale());

  CTATracker_ScaleHeader:SetPoint("TOPLEFT",CTATracker_ScaleSlider,-70,-2);
  CTATracker_ScaleHeader:SetText("Scale: ");
--------------------------------------------------------------------------------
--HEROIC WATCH CHECK BUTTON
--------------------------------------------------------------------------------
  CTATracker_HWCheckButton = CreateFrame("CheckButton", "CTATracker_HWCheckButton", CTATracker_ConfigFrame, "ChatConfigCheckButtonTemplate");
  CTATracker_HWCheckButton:SetPoint("TOP", CTATracker_ScaleHeader, -15, -20);
  CTATracker_HWCheckButtonText:SetText("Heroic Watching");
  CTATracker_HWCheckButton.tooltip = "Check to watch for heroic CTA.";
  if (CTATracker_HeroicWatch == true) then
    CTATracker_HWCheckButton:SetChecked(true);
  else
    CTATracker_HWCheckButton:SetChecked(false);
  end

  CTATracker_HWCheckButton:SetScript("OnClick",
    function()
      CTATracker_HeroicWatchConfig();
    end
  );
--------------------------------------------------------------------------------
--Heroic Tank Watch Check Button
--------------------------------------------------------------------------------
CTATracker_HWTankCheckButton = CreateFrame("CheckButton", "CTATracker_HWTankCheckButton", CTATracker_ConfigFrame, "ChatConfigCheckButtonTemplate");
CTATracker_HWTankCheckButton:SetPoint("TOP", CTATracker_ScaleHeader, 0, -40);
CTATracker_HWTankCheckButtonText:SetText("Tank");
CTATracker_HWTankCheckButton.tooltip = "Check to watch only for Heroic Tank CTA.";
if (CTATracker_HeroicTankWatch == true) then
  CTATracker_HWTankCheckButton:SetChecked(true);
else
  CTATracker_HWTankCheckButton:SetChecked(false);
end
CTATracker_HWTankCheckButton:SetScript("OnClick",
  function()
    CTATracker_HeroicWatchTank();
  end
);
--------------------------------------------------------------------------------
--Heroic Healer Watch Check Button
--------------------------------------------------------------------------------
CTATracker_HWHealerCheckButton = CreateFrame("CheckButton", "CTATracker_HWHealerCheckButton", CTATracker_ConfigFrame, "ChatConfigCheckButtonTemplate");
CTATracker_HWHealerCheckButton:SetPoint("TOP", CTATracker_ScaleHeader, 0, -60);
CTATracker_HWHealerCheckButtonText:SetText("Healer");
CTATracker_HWHealerCheckButton.tooltip = "Check to watch only for Heroic Healer CTA.";
if (CTATracker_HeroicHealerWatch == true) then
  CTATracker_HWHealerCheckButton:SetChecked(true);
else
  CTATracker_HWHealerCheckButton:SetChecked(false);
end
CTATracker_HWHealerCheckButton:SetScript("OnClick",
  function()
    CTATracker_HeroicWatchHealer();
  end
);
--------------------------------------------------------------------------------
--Heroic DPS Watch Check Button
--------------------------------------------------------------------------------
CTATracker_HWDPSCheckButton = CreateFrame("CheckButton", "CTATracker_HWDPSCheckButton", CTATracker_ConfigFrame, "ChatConfigCheckButtonTemplate");
CTATracker_HWDPSCheckButton:SetPoint("TOP", CTATracker_ScaleHeader, 0, -80);
CTATracker_HWDPSCheckButtonText:SetText("DPS");
CTATracker_HWDPSCheckButton.tooltip = "Check to watch only for Heroic DPS CTA.";
if (CTATracker_HeroicDPSWatch == true) then
  CTATracker_HWDPSCheckButton:SetChecked(true);
else
  CTATracker_HWDPSCheckButton:SetChecked(false);
end
CTATracker_HWDPSCheckButton:SetScript("OnClick",
  function()
    CTATracker_HeroicWatchDPS();
  end
);

--------------------------------------------------------------------------------
--Timewalking WATCH CHECK BUTTON
--------------------------------------------------------------------------------
  CTATracker_TWWCheckButton = CreateFrame("CheckButton", "CTATracker_TWWCheckButton", CTATracker_ConfigFrame, "ChatConfigCheckButtonTemplate");
  CTATracker_TWWCheckButton:SetPoint("TOP", CTATracker_ScaleHeader, -15, -100);
  CTATracker_TWWCheckButtonText:SetText("Timewalking Watching");
  CTATracker_TWWCheckButton.tooltip = "Check to watch for Timewalking CTA.";
  if (CTATracker_TWWatch == true) then
    CTATracker_TWWCheckButton:SetChecked(true);
  else
    CTATracker_TWWCheckButton:SetChecked(false);
  end

  CTATracker_TWWCheckButton:SetScript("OnClick",
    function()
      CTATracker_TWWatchConfig();
    end
  );
--------------------------------------------------------------------------------
--Timewalking Tank Watch Check Button
--------------------------------------------------------------------------------
CTATracker_TWWTankCheckButton = CreateFrame("CheckButton", "CTATracker_TWWTankCheckButton", CTATracker_ConfigFrame, "ChatConfigCheckButtonTemplate");
CTATracker_TWWTankCheckButton:SetPoint("TOP", CTATracker_ScaleHeader, 0, -120);
CTATracker_TWWTankCheckButtonText:SetText("Tank");
CTATracker_TWWTankCheckButton.tooltip = "Check to watch only for Timewalking Tank CTA.";
if (CTATracker_TWTankWatch == true) then
  CTATracker_TWWTankCheckButton:SetChecked(true);
else
  CTATracker_TWWTankCheckButton:SetChecked(false);
end
CTATracker_TWWTankCheckButton:SetScript("OnClick",
  function()
    CTATracker_TWWatchTank();
  end
);
--------------------------------------------------------------------------------
--Timewalking Healer Watch Check Button
--------------------------------------------------------------------------------
CTATracker_TWWHealerCheckButton = CreateFrame("CheckButton", "CTATracker_TWWHealerCheckButton", CTATracker_ConfigFrame, "ChatConfigCheckButtonTemplate");
CTATracker_TWWHealerCheckButton:SetPoint("TOP", CTATracker_ScaleHeader, 0, -140);
CTATracker_TWWHealerCheckButtonText:SetText("Healer");
CTATracker_TWWHealerCheckButton.tooltip = "Check to watch only for Timewalking Healer CTA.";
if (CTATracker_TWHealerWatch == true) then
  CTATracker_TWWHealerCheckButton:SetChecked(true);
else
  CTATracker_TWWHealerCheckButton:SetChecked(false);
end
CTATracker_TWWHealerCheckButton:SetScript("OnClick",
  function()
    CTATracker_TWWatchHealer();
  end
);
--------------------------------------------------------------------------------
--Timewalking DPS Watch Check Button
--------------------------------------------------------------------------------
CTATracker_TWWDPSCheckButton = CreateFrame("CheckButton", "CTATracker_TWWDPSCheckButton", CTATracker_ConfigFrame, "ChatConfigCheckButtonTemplate");
CTATracker_TWWDPSCheckButton:SetPoint("TOP", CTATracker_ScaleHeader, 0, -160);
CTATracker_TWWDPSCheckButtonText:SetText("DPS");
CTATracker_TWWDPSCheckButton.tooltip = "Check to watch only for Timewalking DPS CTA.";
if (CTATracker_TWDPSWatch == true) then
  CTATracker_TWWDPSCheckButton:SetChecked(true);
else
  CTATracker_TWWDPSCheckButton:SetChecked(false);
end
CTATracker_TWWDPSCheckButton:SetScript("OnClick",
  function()
    CTATracker_TWWatchDPS();
  end
);
--------------------------------------------------------------------------------
--Heroic and Timewalking Sound Watch Check Button
--------------------------------------------------------------------------------
CTATracker_HWPlaySoundCheckButton = CreateFrame("CheckButton", "CTATracker_HWPlaySoundCheckButton", CTATracker_ConfigFrame, "ChatConfigCheckButtonTemplate");
CTATracker_HWPlaySoundCheckButton:SetPoint("TOP", CTATracker_ScaleHeader, -15, -180);
CTATracker_HWPlaySoundCheckButtonText:SetText("Sound Alert");
CTATracker_HWPlaySoundCheckButton.tooltip = "Check to hear sound upon general heroic and timewalking CTA.";
if (CTATracker_PlaySound == true) then
  CTATracker_HWPlaySoundCheckButton:SetChecked(true);
else
  CTATracker_HWPlaySoundCheckButton:SetChecked(false);
end
CTATracker_HWPlaySoundCheckButton:SetScript("OnClick",
  function()
    CTATracker_SoundConfig();
  end
);
--------------------------------------------------------------------------------
--Config HR
--------------------------------------------------------------------------------
CTATracker_LFRSplit:SetPoint("LEFT",CTATracker_ScaleHeader,0,-200);
CTATracker_LFRSplit:SetText("==========================");
--------------------------------------------------------------------------------
--LFR WATCH CHECK BUTTON
--------------------------------------------------------------------------------
  CTATracker_LFRWCheckButton = CreateFrame("CheckButton", "CTATracker_LFRWCheckButton", CTATracker_ConfigFrame, "ChatConfigCheckButtonTemplate");
  CTATracker_LFRWCheckButton:SetPoint("TOP", CTATracker_ScaleHeader, -15, -220);
  CTATracker_LFRWCheckButtonText:SetText("LFR Watching");
  CTATracker_LFRWCheckButton.tooltip = "Check to watch for LFR CTA.";
  if (CTATracker_LFRWatch == true) then
    CTATracker_LFRWCheckButton:SetChecked(true);
  else
    CTATracker_LFRWCheckButton:SetChecked(false);
  end

  CTATracker_LFRWCheckButton:SetScript("OnClick",
    function()
      CTATracker_LFRWatchConfig();
    end
  );
--------------------------------------------------------------------------------
--LFR Tank Watch Check Button
--------------------------------------------------------------------------------
CTATracker_LFRWTankCheckButton = CreateFrame("CheckButton", "CTATracker_LFRWTankCheckButton", CTATracker_ConfigFrame, "ChatConfigCheckButtonTemplate");
CTATracker_LFRWTankCheckButton:SetPoint("TOP", CTATracker_ScaleHeader, 0, -240);
CTATracker_LFRWTankCheckButtonText:SetText("Tank");
CTATracker_LFRWTankCheckButton.tooltip = "Check to watch only for LFR Tank CTA.";
if (CTATracker_LFRTankWatch == true) then
  CTATracker_LFRWTankCheckButton:SetChecked(true);
else
  CTATracker_LFRWTankCheckButton:SetChecked(false);
end
CTATracker_LFRWTankCheckButton:SetScript("OnClick",
  function()
    CTATracker_LFRWatchTank();
  end
);
--------------------------------------------------------------------------------
--LFR Healer Watch Check Button
--------------------------------------------------------------------------------
CTATracker_LFRWHealerCheckButton = CreateFrame("CheckButton", "CTATracker_LFRWHealerCheckButton", CTATracker_ConfigFrame, "ChatConfigCheckButtonTemplate");
CTATracker_LFRWHealerCheckButton:SetPoint("TOP", CTATracker_ScaleHeader, 0, -260);
CTATracker_LFRWHealerCheckButtonText:SetText("Healer");
CTATracker_LFRWHealerCheckButton.tooltip = "Check to watch only for LFR Healer CTA.";
if (CTATracker_LFRHealerWatch == true) then
  CTATracker_LFRWHealerCheckButton:SetChecked(true);
else
  CTATracker_LFRWHealerCheckButton:SetChecked(false);
end
CTATracker_LFRWHealerCheckButton:SetScript("OnClick",
  function()
    CTATracker_LFRWatchHealer();
  end
);
--------------------------------------------------------------------------------
--LFR DPS Watch Check Button
--------------------------------------------------------------------------------
CTATracker_LFRWDPSCheckButton = CreateFrame("CheckButton", "CTATracker_LFRWDPSCheckButton", CTATracker_ConfigFrame, "ChatConfigCheckButtonTemplate");
CTATracker_LFRWDPSCheckButton:SetPoint("TOP", CTATracker_ScaleHeader, 0, -280);
CTATracker_LFRWDPSCheckButtonText:SetText("DPS");
CTATracker_LFRWDPSCheckButton.tooltip = "Check to watch only for LFR DPS CTA.";
if (CTATracker_LFRDPSWatch == true) then
  CTATracker_LFRWDPSCheckButton:SetChecked(true);
else
  CTATracker_LFRWDPSCheckButton:SetChecked(false);
end
CTATracker_LFRWDPSCheckButton:SetScript("OnClick",
  function()
    CTATracker_LFRWatchDPS();
  end
);

end
--------------------------------------------------------------------------------
--Rounding function for slider value displays
--------------------------------------------------------------------------------
function round(num, idp)
   local mult =  10^idp;
   local newNum = math.floor(num * mult + 0.5) /mult;
   return newNum;
end
--------------------------------------------------------------------------------
--Fix for addon load variables late later, for now recheck
--------------------------------------------------------------------------------
function CTATracker_ConfirmBoxes()
    CTATracker_HWCheckButton:SetChecked(CTATracker_HeroicWatch);
    CTATracker_HWTankCheckButton:SetChecked(CTATracker_HeroicTankWatch);
    CTATracker_HWHealerCheckButton:SetChecked(CTATracker_HeroicHealerWatch);
    CTATracker_HWDPSCheckButton:SetChecked(CTATracker_HeroicDPSWatch);

    CTATracker_TWWCheckButton:SetChecked(CTATracker_TWWatch);
    CTATracker_TWWTankCheckButton:SetChecked(CTATracker_TWTankWatch);
    CTATracker_TWWHealerCheckButton:SetChecked(CTATracker_TWHealerWatch);
    CTATracker_TWWDPSCheckButton:SetChecked(CTATracker_TWDPSWatch);

    CTATracker_LFRWCheckButton:SetChecked(CTATracker_LFRWatch);
    CTATracker_LFRWTankCheckButton:SetChecked(CTATracker_LFRTankWatch);
    CTATracker_LFRWHealerCheckButton:SetChecked(CTATracker_LFRHealerWatch);
    CTATracker_LFRWDPSCheckButton:SetChecked(CTATracker_LFRDPSWatch);

    CTATracker_HWPlaySoundCheckButton:SetChecked(CTATracker_PlaySound);
end

function CTATracker_CreateInnerFrame()
  CTATracker_MainFrame:SetWidth(89);
  CTATracker_MainFrame:SetHeight(0);
  CTATracker_InnerFrame = CreateFrame("frame","CTATracker_IFrame",CTATracker_MainFrame);
  CTATracker_InnerFrame:SetPoint("RIGHT",CTATracker_MainFrame,-2,0);
  CTATracker_InnerFrame:SetWidth(50);
  CTATracker_InnerFrame:SetHeight(0);
  CTATracker_InnerFrame:SetMovable(true);
  CTATracker_InnerFrame:EnableMouse(true);
  CTATracker_InnerFrame:SetFrameStrata("BACKGROUND");

  CTATracker_InnerFrame.texture = CTATracker_InnerFrame:CreateTexture();
  CTATracker_InnerFrame.texture:SetAllPoints(CTATracker_InnerFrame);
  CTATracker_InnerFrame.texture:SetTexture("Interface\\GLUES\\COMMON\\Glue-Tooltip-Background.blp",true);
  --CTATracker_InnerFrame.texture:SetColorTexture(0.50,0.25,0.25,0.75);
  CTATracker_CreateConfigFrame();

end

function CTATracker_CreateConfigFrame()
  CTATracker_ConfigFrame = CreateFrame("Frame","CTATracker_ConfigFrame", UIParent);
  CTATracker_ConfigFrame:SetPoint("CENTER",UIParent,0,0);
  CTATracker_ConfigFrame:SetMovable(true);
  CTATracker_ConfigFrame:EnableMouse(true);
  CTATracker_ConfigFrame:RegisterForDrag("LeftButton");
  CTATracker_ConfigFrame:SetScript("OnDragStart", CTATracker_ConfigFrame.StartMoving);
  CTATracker_ConfigFrame:SetScript("OnDragStop", CTATracker_ConfigFrame.StopMovingOrSizing);
  CTATracker_ConfigFrame:SetFrameStrata("BACKGROUND");
  CTATracker_ConfigFrame:SetWidth(220);
  CTATracker_ConfigFrame:SetHeight(340);
  CTATracker_ConfigFrame.texture = CTATracker_ConfigFrame:CreateTexture(nil, "BACKGROUND");
  CTATracker_ConfigFrame.texture:SetAllPoints(CTATracker_ConfigFrame);
  CTATracker_ConfigFrame.texture:SetTexture("Interface\\GLUES\\COMMON\\Glue-Tooltip-Background.blp", false);
  CTATracker_ConfigFrame:Hide();
  CTATracker_AddToConfigFrame();

  CTATracker_MakeQueueButtons();
end

function CTATracker_UpdateDisplay(name, tank, healer, dps)
  CTATracker_MainFrame:SetScale(CTATracker_FrameScale);
  local foundRelavantPoint = 0;
  if(tank == true or healer == true or dps == true) then
    CTATracker_DisplayName(name);
  end
  if(tank == true) then
    foundRelavantPoint = CTATracker_DisplayTankIcon(foundRelavantPoint,name);
  end
  if(healer == true) then
    foundRelavantPoint = CTATracker_DisplayHealerIcon(foundRelavantPoint,name);
  end
  if(dps == true) then
    foundRelavantPoint = CTATracker_DisplayDPSIcon(foundRelavantPoint,name);
  end
  ---new for join lfg test
  if(tank == true or healer == true or dps == true) then
    CTATracker_JoinQueue(name, tank, healer, dps);
  end
  CTATracker_MainFrame:SetHeight((16*(CTATracker_NumberOfCTA-1)));
  CTATracker_InnerFrame:SetHeight((16*(CTATracker_NumberOfCTA-1)));
  foundRelavantPoint = 0;
end
--this function puts the name of the current cta in a font string and displays it
function CTATracker_DisplayName(name)
  local text = CTATracker_MainFrame:CreateFontString(nil,"BACKGROUND");
  text:SetPoint("RIGHT", 4, 0);
  --top if runs when it is the first name to be displayed, second runs otherwise
    if(CTATracker_CurrentCTA[CTATracker_NumberOfCTA] == CTATracker_MainFrame) then
      text:SetPoint("LEFT", CTATracker_CurrentCTA[CTATracker_NumberOfCTA], "TOPLEFT", 2, -10);
    else
      text:SetPoint("LEFT", CTATracker_CurrentCTA[CTATracker_NumberOfCTA], "TOPLEFT", 0, -20);
    end
  text:SetFont("Fonts\\FRIZQT__.TTF", 8);
  text:SetShadowOffset(1,-1);
  text:SetJustifyH("LEFT");
  text:SetText(name);
  table.insert(CTATracker_CurrentCTA, text);
  CTATracker_NumberOfCTA = CTATracker_NumberOfCTA + 1;
end
--if there is a tank CTA for the current lfg/lfr check, the tank icon is displayed
function CTATracker_DisplayTankIcon(foundRelavantPoint,name)
  --tank texture
  local tankButton = CreateFrame("button","tankButton",CTATracker_InnerFrame);
  tankButton:EnableMouse(true);
  --for determining if other CTA's will be aligned to this icon or not
  if((CTATracker_NumberOfCTA-1) == 1 and CTATracker_CurrentRoleIconNum == 0) then --checks for first cta found
    tankButton:SetPoint("LEFT",CTATracker_CurrentCTA[CTATracker_NumberOfCTA],"CENTER",-10,0);
    CTATracker_NextRelativePoint = tankButton;
    foundRelavantPoint = 1;
  else --checks for relative point for displaying next CTA icon
    tankButton:SetPoint("TOP", CTATracker_NextRelativePoint,"BOTTOM");
    CTATracker_NextRelativePoint = tankButton;
    foundRelavantPoint = 1;
  end
  tankButton:SetWidth(16);
  tankButton:SetHeight(16);
  tankButton:SetFrameStrata("MEDIUM");

  local textureTank = tankButton:CreateTexture();
  textureTank:SetTexture("Interface\\LFGFRAME\\UI-LFG-ICON-ROLES.blp");
  textureTank:SetTexCoord(0,0.26,0.26,0.52);
  textureTank:SetAllPoints();
  tankButton:SetNormalTexture(textureTank);

  local htex = tankButton:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight");
  htex:SetTexCoord(0,0.625,0,0.6875);
  htex:SetAllPoints();
  tankButton:SetHighlightTexture(htex);

  local ptex = tankButton:CreateTexture();
  ptex:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES.blp");
  ptex:SetTexCoord(0,0.26,0.26,0.52);
  ptex:SetAllPoints();
  tankButton:SetPushedTexture(ptex);
  tankButton:SetScript("OnClick", function() lfgRestrictedJoinParameters(name,true,false,false); end);
  table.insert(CTATracker_RoleIcons, tankButton);
  CTATracker_CurrentRoleIconNum = CTATracker_CurrentRoleIconNum + 1;
  return foundRelavantPoint;
end

--if there is a healer cta for the current lfg/lfr check, the healer icon is displayed
function CTATracker_DisplayHealerIcon(foundRelavantPoint,name)
  --healer texture
  local healerButton = CreateFrame("Button","healerButton",CTATracker_InnerFrame);
  healerButton:EnableMouse(true);
  if((CTATracker_NumberOfCTA-1) == 1 and CTATracker_CurrentRoleIconNum == 0) then --checks for first cta found
    healerButton:SetPoint("LEFT",CTATracker_CurrentCTA[CTATracker_NumberOfCTA],"CENTER",-10,0);
    CTATracker_NextRelativePoint = healerButton;
    foundRelavantPoint = 1;
  elseif(tank ~= true and CTATracker_CurrentRoleIconNum == 0) then
    healerButton:SetPoint("LEFT",CTATracker_CurrentCTA[CTATracker_NumberOfCTA],"CENTER",-10,0);
    CTATracker_NextRelativePoint = healerButton;
  elseif(tank ~= true and foundRelavantPoint == 0) then
    healerButton:SetPoint("TOP",CTATracker_NextRelativePoint,"BOTTOM",0,0);
    CTATracker_NextRelativePoint = healerButton;
    foundRelavantPoint = 1;
  else
    healerButton:SetPoint("LEFT", CTATracker_RoleIcons[CTATracker_CurrentRoleIconNum],"RIGHT",0,0);
  end
  healerButton:SetWidth(16);
  healerButton:SetHeight(16);
  healerButton:SetFrameStrata("MEDIUM");

  local textureHealer = healerButton:CreateTexture();
  textureHealer:SetTexture("Interface\\LFGFRAME\\UI-LFG-ICON-ROLES.blp");
  textureHealer:SetTexCoord(0.26,0.52,0,0.26);
  textureHealer:SetAllPoints(healerButton);
  healerButton:SetNormalTexture(textureHealer);

  local htex = healerButton:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight");
  htex:SetTexCoord(0,0.625,0,0.6875);
  htex:SetAllPoints();
  healerButton:SetHighlightTexture(htex);

  local ptex = healerButton:CreateTexture();
  ptex:SetTexture("Interface\\LFGFRAME\\UI-LFG-ICON-ROLES.blp");
  ptex:SetTexCoord(0.26,0.52,0,0.26);
  ptex:SetAllPoints();
  healerButton:SetPushedTexture(ptex);

  healerButton:SetScript("OnClick", function() lfgRestrictedJoinParameters(name,false,true,false);end);

  table.insert(CTATracker_RoleIcons, healerButton);
  CTATracker_CurrentRoleIconNum = CTATracker_CurrentRoleIconNum + 1;
  return foundRelavantPoint;
end
--if there is a dps cta for the current lfg/lfr check, the dps icon is displayed
function CTATracker_DisplayDPSIcon(foundRelavantPoint,name)
  --dps texture
  local dpsButton = CreateFrame("Button","dpsButton",CTATracker_InnerFrame);
  dpsButton:EnableMouse(true);
  if(tank ~= true and healer ~= true and CTATracker_CurrentRoleIconNum == 0) then
    dpsButton:SetPoint("LEFT",CTATracker_CurrentCTA[CTATracker_NumberOfCTA],"CENTER",-10,0);
    CTATracker_NextRelativePoint = dpsButton;
  elseif(tank ~= true and healer ~= true and foundRelavantPoint == 0) then
    dpsButton:SetPoint("TOP", CTATracker_NextRelativePoint,"BOTTOM",0,0);
    CTATracker_NextRelativePoint = dpsButton;
    foundRelavantPoint = 1;
  else
    dpsButton:SetPoint("LEFT", CTATracker_RoleIcons[CTATracker_CurrentRoleIconNum],"RIGHT",0,0);
  end
  dpsButton:SetWidth(16);
  dpsButton:SetHeight(16);
  dpsButton:SetFrameStrata("MEDIUM");

  local textureDPS = dpsButton:CreateTexture();
  textureDPS:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES.blp");
  textureDPS:SetTexCoord(0.26,0.52,0.26,0.52);
  textureDPS:SetAllPoints(dpsButton);
  dpsButton:SetNormalTexture(textureDPS);

  local htex = dpsButton:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight");
  htex:SetTexCoord(0,0.625,0,0.6875);
  htex:SetAllPoints();
  dpsButton:SetHighlightTexture(htex);

  local ptex = dpsButton:CreateTexture();
  ptex:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES.blp");
  ptex:SetTexCoord(0.26,0.52,0.26,0.52);
  ptex:SetAllPoints();
  dpsButton:SetPushedTexture(ptex);

  dpsButton:SetScript("OnClick", function() lfgRestrictedJoinParameters(name,false,false,true); end);

  table.insert(CTATracker_RoleIcons, dpsButton);
  CTATracker_CurrentRoleIconNum = CTATracker_CurrentRoleIconNum + 1;
  return foundRelavantPoint;
end

function findInstanceIndex(name)
  if(name == "HEROIC") then
    return 1046;
  elseif(name == "TIMEW") then
    for i=1,3 do
      local elig = GetLFGRoleShortageRewards(CTATracker_TWID[i],LFG_ROLE_SHORTAGE_RARE);
      if(elig) then
        return CTATracker_TWID[i];
      end -- internal if
    end -- for tw
  else
    for i=1,8 do --for lfr
      if(CTATracker_LFRNames[i] == name) then
        return CTATracker_LFRID[i];
      end -- internal if
    end -- lfr for
  end -- big if
end -- end function

function findTypeOfDungeon(name)
  if(name == "HEROIC") then
    return 2;
  elseif(name == "TIMEW") then
    return 2;
  else
    return 3;
  end
end

function lfgJoinParameters(typeOfDungeon, instanceID)
  ClearAllLFGDungeons(LE_LFG_CATEGORY_LFR);
  ClearAllLFGDungeons(LE_LFG_CATEGORY_LFD);
  ClearAllLFGDungeons(LE_LFG_CATEGORY_RF);
  local _,tank,healer,dps = GetLFGRoleShortageRewards(instanceID,LFG_ROLE_SHORTAGE_RARE);
  SetLFGRoles(true,tank,healer,dps);
  SetLFGDungeon(typeOfDungeon,instanceID); JoinLFG(typeOfDungeon);
end

function lfgRestrictedJoinParameters(name, tank, healer, dps)
  ClearAllLFGDungeons(LE_LFG_CATEGORY_LFR);
  ClearAllLFGDungeons(LE_LFG_CATEGORY_LFD);
  ClearAllLFGDungeons(LE_LFG_CATEGORY_RF);
  SetLFGRoles(true,tank,healer,dps);
--[[  print(name);
  print(findTypeOfDungeon(name));
  print(findInstanceIndex(name));
  print(CTATracker_LFRID[findInstanceIndex(name)]);]]--
  SetLFGDungeon(findTypeOfDungeon(name),findInstanceIndex(name));
  JoinLFG(findTypeOfDungeon(name));
end
--------------------------------------------------------------------------------
--massive join queue logic
--------------------------------------------------------------------------------
function CTATracker_JoinQueue(name, tank, healer, dps)
  local typeOfDungeon = findTypeOfDungeon(name);
  local instanceID = findInstanceIndex(name);
  if(name=="HEROIC")then
    CTATracker_HeroicJoinButton:SetPoint("LEFT", CTATracker_NextRelativePoint , 50, 0);
    CTATracker_HeroicJoinButton:Show();
  elseif(name=="TIMEW") then
    for i=1,3 do
      local elig = GetLFGRoleShortageRewards(CTATracker_TWID[i],LFG_ROLE_SHORTAGE_RARE);
      if(elig) then
        if(i == 1) then
          CTATracker_TWJoinButton1:SetPoint("LEFT",CTATracker_NextRelativePoint,50,0);
          CTATracker_TWJoinButton1:Show();
        elseif(i == 2) then
          CTATracker_TWJoinButton2:SetPoint("LEFT",CTATracker_NextRelativePoint,50,0);
          CTATracker_TWJoinButton2:Show();
        else
          CTATracker_TWJoinButton3:SetPoint("LEFT",CTATracker_NextRelativePoint,50,0);
          CTATracker_TWJoinButton3:Show();
        end --end if
      end--end outer if
    end--end for
  elseif(name=="DarkB")then
    CTATracker_DarkBJoinButton:SetPoint("LEFT", CTATracker_NextRelativePoint , 50, 0);
    CTATracker_DarkBJoinButton:Show();
  elseif(name=="TormG")then
    CTATracker_TormGJoinButton:SetPoint("LEFT", CTATracker_NextRelativePoint , 50, 0);
    CTATracker_TormGJoinButton:Show();
  elseif(name=="Aln")then
    CTATracker_AlnJoinButton:SetPoint("LEFT", CTATracker_NextRelativePoint , 50, 0);
    CTATracker_AlnJoinButton:Show();
  elseif(name=="ToV")then
    CTATracker_ToVJoinButton:SetPoint("LEFT", CTATracker_NextRelativePoint , 50, 0);
    CTATracker_ToVJoinButton:Show();
  elseif(name=="ArcA")then
    CTATracker_ArcAJoinButton:SetPoint("LEFT", CTATracker_NextRelativePoint , 50, 0);
    CTATracker_ArcAJoinButton:Show();
  elseif(name=="Royal Ath")then
    CTATracker_RoyalAthJoinButton:SetPoint("LEFT", CTATracker_NextRelativePoint , 50, 0);
    CTATracker_RoyalAthJoinButton:Show();
  elseif(name=="Night")then
    CTATracker_NightJoinButton:SetPoint("LEFT", CTATracker_NextRelativePoint , 50, 0);
    CTATracker_NightJoinButton:Show();
  elseif(name=="BetRise")then
    CTATracker_BetRiseJoinButton:SetPoint("LEFT", CTATracker_NextRelativePoint , 50, 0);
    CTATracker_BetRiseJoinButton:Show();
  end --end main if
--[[CTATracker_EnterQueueButtons[CTATracker_CurrentEnterQueueNum]:SetPoint("LEFT", CTATracker_NextRelativePoint , 50, 0);
CTATracker_EnterQueueButtons[CTATracker_CurrentEnterQueueNum]:SetScript("OnClick", function() SetLFGRoles(true,tank,healer,dps); SetLFGDungeon(typeOfDungeon,instanceID); JoinLFG(typeOfDungeon); end);
CTATracker_EnterQueueButtons[CTATracker_CurrentEnterQueueNum]:Show();
CTATracker_CurrentEnterQueueNum = CTATracker_CurrentEnterQueueNum + 1;]]--
end

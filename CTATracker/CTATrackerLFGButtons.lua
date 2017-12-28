function CTATracker_MakeQueueButtons()
  ------------------------------------------------------------------------------
  --Heroic Join Queue Button
  ------------------------------------------------------------------------------
  CTATracker_HeroicJoinButton = CreateFrame("Button", nil, CTATracker_InnerFrame);
  CTATracker_HeroicJoinButton:SetWidth(15);
  CTATracker_HeroicJoinButton:SetHeight(15);

  CTATracker_HeroicJoinButton:SetText("");
  CTATracker_HeroicJoinButton:SetNormalFontObject("GameFontNormal");

  local ntex = CTATracker_HeroicJoinButton:CreateTexture();
  ntex:SetTexture("Interface/Buttons/UI-PlusButton-Up");
  ntex:SetTexCoord(0,1,0,1);
  --ntex:SetTexCoord(0, 0.625, 0, 0.6875)
  ntex:SetAllPoints();
  CTATracker_HeroicJoinButton:SetNormalTexture(ntex);

  local htex = CTATracker_HeroicJoinButton:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-PlusButton-Hilight");
  htex:SetTexCoord(0, 1, 0, 1);
  htex:SetAllPoints();
  CTATracker_HeroicJoinButton:SetHighlightTexture(htex);

  local ptex = CTATracker_HeroicJoinButton:CreateTexture();
  ptex:SetTexture("Interface/Buttons/UI-PlusButton-Down");
  ptex:SetTexCoord(0, 1, 0, 1);
  ptex:SetAllPoints();
  CTATracker_HeroicJoinButton:SetPushedTexture(ptex);
  CTATracker_HeroicJoinButton:SetScript("OnClick", function() lfgJoinParameters(2,1046);
   end);
  ------------------------------------------------------------------------------
  --Timewalking Join Queue Button 995
  ------------------------------------------------------------------------------
  CTATracker_TWJoinButton1 = CreateFrame("Button", nil, CTATracker_InnerFrame);
  CTATracker_TWJoinButton1:SetWidth(15);
  CTATracker_TWJoinButton1:SetHeight(15);

  CTATracker_TWJoinButton1:SetText("");
  CTATracker_TWJoinButton1:SetNormalFontObject("GameFontNormal");

  local ntex = CTATracker_TWJoinButton1:CreateTexture();
  ntex:SetTexture("Interface/Buttons/UI-PlusButton-Up");
  ntex:SetTexCoord(0,1,0,1);
  --ntex:SetTexCoord(0, 0.625, 0, 0.6875)
  ntex:SetAllPoints();
  CTATracker_TWJoinButton1:SetNormalTexture(ntex);

  local htex = CTATracker_TWJoinButton1:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-PlusButton-Hilight");
  htex:SetTexCoord(0, 1, 0, 1);
  htex:SetAllPoints();
  CTATracker_TWJoinButton1:SetHighlightTexture(htex);

  local ptex = CTATracker_TWJoinButton1:CreateTexture();
  ptex:SetTexture("Interface/Buttons/UI-PlusButton-Down");
  ptex:SetTexCoord(0, 1, 0, 1);
  ptex:SetAllPoints();
  CTATracker_TWJoinButton1:SetPushedTexture(ptex);
  CTATracker_TWJoinButton1:SetScript("OnClick", function() lfgJoinParameters(2,995); end);
  ------------------------------------------------------------------------------
  --Timewalking Join Queue Button 1146
  ------------------------------------------------------------------------------
  CTATracker_TWJoinButton2 = CreateFrame("Button", nil, CTATracker_InnerFrame);
  CTATracker_TWJoinButton2:SetWidth(15);
  CTATracker_TWJoinButton2:SetHeight(15);

  CTATracker_TWJoinButton2:SetText("");
  CTATracker_TWJoinButton2:SetNormalFontObject("GameFontNormal");

  local ntex = CTATracker_TWJoinButton2:CreateTexture();
  ntex:SetTexture("Interface/Buttons/UI-PlusButton-Up");
  ntex:SetTexCoord(0,1,0,1);
  --ntex:SetTexCoord(0, 0.625, 0, 0.6875)
  ntex:SetAllPoints();
  CTATracker_TWJoinButton2:SetNormalTexture(ntex);

  local htex = CTATracker_TWJoinButton2:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-PlusButton-Hilight");
  htex:SetTexCoord(0, 1, 0, 1);
  htex:SetAllPoints();
  CTATracker_TWJoinButton2:SetHighlightTexture(htex);

  local ptex = CTATracker_TWJoinButton2:CreateTexture();
  ptex:SetTexture("Interface/Buttons/UI-PlusButton-Down");
  ptex:SetTexCoord(0, 1, 0, 1);
  ptex:SetAllPoints();
  CTATracker_TWJoinButton2:SetPushedTexture(ptex);
  CTATracker_TWJoinButton2:SetScript("OnClick", function() lfgJoinParameters(2,1146); end);
  ------------------------------------------------------------------------------
  --Timewalking Join Queue Button 744
  ------------------------------------------------------------------------------
  CTATracker_TWJoinButton3 = CreateFrame("Button", nil, CTATracker_InnerFrame);
  CTATracker_TWJoinButton3:SetWidth(15);
  CTATracker_TWJoinButton3:SetHeight(15);

  CTATracker_TWJoinButton3:SetText("");
  CTATracker_TWJoinButton3:SetNormalFontObject("GameFontNormal");

  local ntex = CTATracker_TWJoinButton3:CreateTexture();
  ntex:SetTexture("Interface/Buttons/UI-PlusButton-Up");
  ntex:SetTexCoord(0,1,0,1);
  --ntex:SetTexCoord(0, 0.625, 0, 0.6875)
  ntex:SetAllPoints();
  CTATracker_TWJoinButton3:SetNormalTexture(ntex);

  local htex = CTATracker_TWJoinButton3:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-PlusButton-Hilight");
  htex:SetTexCoord(0, 1, 0, 1);
  htex:SetAllPoints();
  CTATracker_TWJoinButton3:SetHighlightTexture(htex);

  local ptex = CTATracker_TWJoinButton3:CreateTexture();
  ptex:SetTexture("Interface/Buttons/UI-PlusButton-Down");
  ptex:SetTexCoord(0, 1, 0, 1);
  ptex:SetAllPoints();
  CTATracker_TWJoinButton3:SetPushedTexture(ptex);
  CTATracker_TWJoinButton3:SetScript("OnClick", function() lfgJoinParameters(2,744); end);
  ------------------------------------------------------------------------------
  --LFR Join Queue Button Darkbough
  ------------------------------------------------------------------------------
  CTATracker_DarkBJoinButton = CreateFrame("Button", nil, CTATracker_InnerFrame);
  CTATracker_DarkBJoinButton:SetWidth(15);
  CTATracker_DarkBJoinButton:SetHeight(15);

  CTATracker_DarkBJoinButton:SetText("");
  CTATracker_DarkBJoinButton:SetNormalFontObject("GameFontNormal");

  local ntex = CTATracker_DarkBJoinButton:CreateTexture();
  ntex:SetTexture("Interface/Buttons/UI-PlusButton-Up");
  ntex:SetTexCoord(0,1,0,1);
  --ntex:SetTexCoord(0, 0.625, 0, 0.6875)
  ntex:SetAllPoints();
  CTATracker_DarkBJoinButton:SetNormalTexture(ntex);

  local htex = CTATracker_DarkBJoinButton:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-PlusButton-Hilight");
  htex:SetTexCoord(0, 1, 0, 1);
  htex:SetAllPoints();
  CTATracker_DarkBJoinButton:SetHighlightTexture(htex);

  local ptex = CTATracker_DarkBJoinButton:CreateTexture();
  ptex:SetTexture("Interface/Buttons/UI-PlusButton-Down");
  ptex:SetTexCoord(0, 1, 0, 1);
  ptex:SetAllPoints();
  CTATracker_DarkBJoinButton:SetPushedTexture(ptex);
  CTATracker_DarkBJoinButton:SetScript("OnClick", function() lfgJoinParameters(3,1287);
  end);

  ------------------------------------------------------------------------------
  --LFR Join Queue Button Tormented Guardians
  ------------------------------------------------------------------------------
  CTATracker_TormGJoinButton = CreateFrame("Button", nil, CTATracker_InnerFrame);
  CTATracker_TormGJoinButton:SetWidth(15);
  CTATracker_TormGJoinButton:SetHeight(15);

  CTATracker_TormGJoinButton:SetText("");
  CTATracker_TormGJoinButton:SetNormalFontObject("GameFontNormal");

  local ntex = CTATracker_TormGJoinButton:CreateTexture();
  ntex:SetTexture("Interface/Buttons/UI-PlusButton-Up");
  ntex:SetTexCoord(0,1,0,1);
  --ntex:SetTexCoord(0, 0.625, 0, 0.6875)
  ntex:SetAllPoints();
  CTATracker_TormGJoinButton:SetNormalTexture(ntex);

  local htex = CTATracker_TormGJoinButton:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-PlusButton-Hilight");
  htex:SetTexCoord(0, 1, 0, 1);
  htex:SetAllPoints();
  CTATracker_TormGJoinButton:SetHighlightTexture(htex);

  local ptex = CTATracker_TormGJoinButton:CreateTexture();
  ptex:SetTexture("Interface/Buttons/UI-PlusButton-Down");
  ptex:SetTexCoord(0, 1, 0, 1);
  ptex:SetAllPoints();
  CTATracker_TormGJoinButton:SetPushedTexture(ptex);
  CTATracker_TormGJoinButton:SetScript("OnClick", function() lfgJoinParameters(3,1288); end);
  ------------------------------------------------------------------------------
  --LFR Join Queue Button Rift of Aln
  ------------------------------------------------------------------------------
  CTATracker_AlnJoinButton = CreateFrame("Button", nil, CTATracker_InnerFrame);
  CTATracker_AlnJoinButton:SetWidth(15);
  CTATracker_AlnJoinButton:SetHeight(15);

  CTATracker_AlnJoinButton:SetText("");
  CTATracker_AlnJoinButton:SetNormalFontObject("GameFontNormal");

  local ntex = CTATracker_AlnJoinButton:CreateTexture();
  ntex:SetTexture("Interface/Buttons/UI-PlusButton-Up");
  ntex:SetTexCoord(0,1,0,1);
  --ntex:SetTexCoord(0, 0.625, 0, 0.6875)
  ntex:SetAllPoints();
  CTATracker_AlnJoinButton:SetNormalTexture(ntex);

  local htex = CTATracker_AlnJoinButton:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-PlusButton-Hilight");
  htex:SetTexCoord(0, 1, 0, 1);
  htex:SetAllPoints();
  CTATracker_AlnJoinButton:SetHighlightTexture(htex);

  local ptex = CTATracker_AlnJoinButton:CreateTexture();
  ptex:SetTexture("Interface/Buttons/UI-PlusButton-Down");
  ptex:SetTexCoord(0, 1, 0, 1);
  ptex:SetAllPoints();
  CTATracker_AlnJoinButton:SetPushedTexture(ptex);
  CTATracker_AlnJoinButton:SetScript("OnClick", function() lfgJoinParameters(3,1289); end);
  ------------------------------------------------------------------------------
  --LFR Join Queue Button Trial of Valor
  ------------------------------------------------------------------------------
  CTATracker_ToVJoinButton = CreateFrame("Button", nil, CTATracker_InnerFrame);
  CTATracker_ToVJoinButton:SetWidth(15);
  CTATracker_ToVJoinButton:SetHeight(15);

  CTATracker_ToVJoinButton:SetText("");
  CTATracker_ToVJoinButton:SetNormalFontObject("GameFontNormal");

  local ntex = CTATracker_ToVJoinButton:CreateTexture();
  ntex:SetTexture("Interface/Buttons/UI-PlusButton-Up");
  ntex:SetTexCoord(0,1,0,1);
  --ntex:SetTexCoord(0, 0.625, 0, 0.6875)
  ntex:SetAllPoints();
  CTATracker_ToVJoinButton:SetNormalTexture(ntex);

  local htex = CTATracker_ToVJoinButton:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-PlusButton-Hilight");
  htex:SetTexCoord(0, 1, 0, 1);
  htex:SetAllPoints();
  CTATracker_ToVJoinButton:SetHighlightTexture(htex);

  local ptex = CTATracker_ToVJoinButton:CreateTexture();
  ptex:SetTexture("Interface/Buttons/UI-PlusButton-Down");
  ptex:SetTexCoord(0, 1, 0, 1);
  ptex:SetAllPoints();
  CTATracker_ToVJoinButton:SetPushedTexture(ptex);
  CTATracker_ToVJoinButton:SetScript("OnClick", function() lfgJoinParameters(3,1411); end);
  ------------------------------------------------------------------------------
  --LFR Join Queue Button Arcing Aquaducts
  ------------------------------------------------------------------------------
  CTATracker_ArcAJoinButton = CreateFrame("Button", nil, CTATracker_InnerFrame);
  CTATracker_ArcAJoinButton:SetWidth(15);
  CTATracker_ArcAJoinButton:SetHeight(15);

  CTATracker_ArcAJoinButton:SetText("");
  CTATracker_ArcAJoinButton:SetNormalFontObject("GameFontNormal");

  local ntex = CTATracker_ArcAJoinButton:CreateTexture();
  ntex:SetTexture("Interface/Buttons/UI-PlusButton-Up");
  ntex:SetTexCoord(0,1,0,1);
  --ntex:SetTexCoord(0, 0.625, 0, 0.6875)
  ntex:SetAllPoints();
  CTATracker_ArcAJoinButton:SetNormalTexture(ntex);

  local htex = CTATracker_ArcAJoinButton:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-PlusButton-Hilight");
  htex:SetTexCoord(0, 1, 0, 1);
  htex:SetAllPoints();
  CTATracker_ArcAJoinButton:SetHighlightTexture(htex);

  local ptex = CTATracker_ArcAJoinButton:CreateTexture();
  ptex:SetTexture("Interface/Buttons/UI-PlusButton-Down");
  ptex:SetTexCoord(0, 1, 0, 1);
  ptex:SetAllPoints();
  CTATracker_ArcAJoinButton:SetPushedTexture(ptex);
  CTATracker_ArcAJoinButton:SetScript("OnClick", function() lfgJoinParameters(3,1290); end);
  ------------------------------------------------------------------------------
  --LFR Join Queue Button Royal Athenaeum
  ------------------------------------------------------------------------------
  CTATracker_RoyalAthJoinButton = CreateFrame("Button", nil, CTATracker_InnerFrame);
  CTATracker_RoyalAthJoinButton:SetWidth(15);
  CTATracker_RoyalAthJoinButton:SetHeight(15);

  CTATracker_RoyalAthJoinButton:SetText("");
  CTATracker_RoyalAthJoinButton:SetNormalFontObject("GameFontNormal");

  local ntex = CTATracker_RoyalAthJoinButton:CreateTexture();
  ntex:SetTexture("Interface/Buttons/UI-PlusButton-Up");
  ntex:SetTexCoord(0,1,0,1);
  --ntex:SetTexCoord(0, 0.625, 0, 0.6875)
  ntex:SetAllPoints();
  CTATracker_RoyalAthJoinButton:SetNormalTexture(ntex);

  local htex = CTATracker_RoyalAthJoinButton:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-PlusButton-Hilight");
  htex:SetTexCoord(0, 1, 0, 1);
  htex:SetAllPoints();
  CTATracker_RoyalAthJoinButton:SetHighlightTexture(htex);

  local ptex = CTATracker_RoyalAthJoinButton:CreateTexture();
  ptex:SetTexture("Interface/Buttons/UI-PlusButton-Down");
  ptex:SetTexCoord(0, 1, 0, 1);
  ptex:SetAllPoints();
  CTATracker_RoyalAthJoinButton:SetPushedTexture(ptex);
  CTATracker_RoyalAthJoinButton:SetScript("OnClick", function() lfgJoinParameters(3,1291); end);
  ------------------------------------------------------------------------------
  --LFR Join Queue Button Nightspire
  ------------------------------------------------------------------------------
  CTATracker_NightJoinButton = CreateFrame("Button", nil, CTATracker_InnerFrame);
  CTATracker_NightJoinButton:SetWidth(15);
  CTATracker_NightJoinButton:SetHeight(15);

  CTATracker_NightJoinButton:SetText("");
  CTATracker_NightJoinButton:SetNormalFontObject("GameFontNormal");

  local ntex = CTATracker_NightJoinButton:CreateTexture();
  ntex:SetTexture("Interface/Buttons/UI-PlusButton-Up");
  ntex:SetTexCoord(0,1,0,1);
  --ntex:SetTexCoord(0, 0.625, 0, 0.6875)
  ntex:SetAllPoints();
  CTATracker_NightJoinButton:SetNormalTexture(ntex);

  local htex = CTATracker_NightJoinButton:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-PlusButton-Hilight");
  htex:SetTexCoord(0, 1, 0, 1);
  htex:SetAllPoints();
  CTATracker_NightJoinButton:SetHighlightTexture(htex);

  local ptex = CTATracker_NightJoinButton:CreateTexture();
  ptex:SetTexture("Interface/Buttons/UI-PlusButton-Down");
  ptex:SetTexCoord(0, 1, 0, 1);
  ptex:SetAllPoints();
  CTATracker_NightJoinButton:SetPushedTexture(ptex);
  CTATracker_NightJoinButton:SetScript("OnClick", function() lfgJoinParameters(3,1292); end);
  ------------------------------------------------------------------------------
  --LFR Join Queue Button Betrayer's Rise
  ------------------------------------------------------------------------------
  CTATracker_BetRiseJoinButton = CreateFrame("Button", nil, CTATracker_InnerFrame);
  CTATracker_BetRiseJoinButton:SetWidth(15);
  CTATracker_BetRiseJoinButton:SetHeight(15);

  CTATracker_BetRiseJoinButton:SetText("");
  CTATracker_BetRiseJoinButton:SetNormalFontObject("GameFontNormal");

  local ntex = CTATracker_BetRiseJoinButton:CreateTexture();
  ntex:SetTexture("Interface/Buttons/UI-PlusButton-Up");
  ntex:SetTexCoord(0,1,0,1);
  --ntex:SetTexCoord(0, 0.625, 0, 0.6875)
  ntex:SetAllPoints();
  CTATracker_BetRiseJoinButton:SetNormalTexture(ntex);

  local htex = CTATracker_BetRiseJoinButton:CreateTexture();
  htex:SetTexture("Interface/Buttons/UI-PlusButton-Hilight");
  htex:SetTexCoord(0, 1, 0, 1);
  htex:SetAllPoints();
  CTATracker_BetRiseJoinButton:SetHighlightTexture(htex);

  local ptex = CTATracker_BetRiseJoinButton:CreateTexture();
  ptex:SetTexture("Interface/Buttons/UI-PlusButton-Down");
  ptex:SetTexCoord(0, 1, 0, 1);
  ptex:SetAllPoints();
  CTATracker_BetRiseJoinButton:SetPushedTexture(ptex);
  CTATracker_BetRiseJoinButton:SetScript("OnClick", function() lfgJoinParameters(3,1293); end);

end

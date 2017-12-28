function CTATracker_UpdateInterval(self, elapsed)
	self.CTATracker_TimeSinceLastUpdate = self.CTATracker_TimeSinceLastUpdate + elapsed;
	if (self.CTATracker_TimeSinceLastUpdate > 20.0) then
		RequestLFDPlayerLockInfo();
    self.CTATracker_GarbageCollectionTime = self.CTATracker_GarbageCollectionTime + 1;
		self.CTATracker_TimeSinceLastUpdate = 0.0;
    if(self.CTATracker_GarbageCollectionTime == 100.0) then
      CTATracker_GarbageCollect();
      self.CTATracker_GarbageCollectionTime = 0.0;
    end
	end
end

function CTATracker_LFGUpdate()
  --cleanup for next round
  CTATracker_TidyUp();
	if(IsInRaid() or IsInGroup()) then
		CTATracker_IsGrouped = true;
	else
		CTATracker_IsGrouped = false;
	end
	if(CTATracker_IsGrouped == false) then
  --heroic checks
  if((CTATracker_HeroicWatch == true)
   or (CTATracker_HeroicTankWatch == true)
   or (CTATracker_HeroicHealerWatch == true)
   or (CTATracker_HeroicDPSWatch == true)) then
     local _,tank,healer,dps = GetLFGRoleShortageRewards(CTATracker_HeroicID,LFG_ROLE_SHORTAGE_RARE);
     if(tank == true or healer == true or dps == true) then
			 if(CTATracker_CurrentlyHeroicCTA ~= true and CTATracker_PlaySound == true and CTATracker_HeroicWatch == true) then
				 PlaySound("QUESTADDED","Master");
			 end
       CTATracker_CurrentlyHeroicCTA = true;
     else
       CTATracker_CurrentlyHeroicCTA = false;
     end
		 if(CTATracker_HeroicWatch == true) then
     	CTATracker_UpdateDisplay("HEROIC",tank,healer,dps);
		 elseif(CTATracker_HeroicTankWatch == true and tank == true) then
			CTATracker_UpdateDisplay("HEROIC",tank,healer,dps);
		 elseif(CTATracker_HeroicHealerWatch == true and healer == true) then
			CTATracker_UpdateDisplay("HEROIC",tank,healer,dps);
		 elseif(CTATracker_HeroicDPSWatch == true and dps == true) then
			CTATracker_UpdateDisplay("HEROIC",tank,healer,dps);
		end
  end

  --Timewalking Checks
  if((CTATracker_TWWatch == true)
   or (CTATracker_TWTankWatch == true)
   or (CTATracker_TWHealerWatch == true)
   or (CTATracker_TWDPSWatch == true)) then
		 for i=1,3 do
     local _,tank,healer,dps = GetLFGRoleShortageRewards(CTATracker_TWID[i],LFG_ROLE_SHORTAGE_RARE);
     if(tank == true or healer == true or dps == true) then
			 if(CTATracker_CurrentlyTWCTA ~= true and CTATracker_PlaySound == true and CTATracker_TWWatch == true) then
				 PlaySound("QUESTADDED","Master");
			 end
       CTATracker_CurrentlyTWCTA = true;
     else
       CTATracker_CurrentlyTWCTA = false;
     end

		 if(CTATracker_TWWatch == true) then
     	CTATracker_UpdateDisplay("TIMEW",tank,healer,dps);
		 elseif(CTATracker_TWTankWatch == true and tank == true) then
			CTATracker_UpdateDisplay("TIMEW",tank,healer,dps);
		 elseif(CTATracker_TWHealerWatch == true and healer == true) then
			CTATracker_UpdateDisplay("TIMEW",tank,healer,dps);
		 elseif(CTATracker_TWDPSWatch == true and dps == true) then
			CTATracker_UpdateDisplay("TIMEW",tank,healer,dps);
	 	 end
	 end
  end

  --LFR Checks
  if((CTATracker_LFRWatch == true)
   or (CTATracker_LFRTankWatch == true)
   or (CTATracker_LFRHealerWatch == true)
   or (CTATracker_LFRDPSWatch == true)) then
     for i=1,8 do
       local _,tank,healer,dps = GetLFGRoleShortageRewards(CTATracker_LFRID[i],LFG_ROLE_SHORTAGE_RARE);
       if(tank == true or healer == true or dps == true) then
         CTATracker_CurrentlyLFRCTA = true;
       else
         CTATracker_CurrentlyLFRCTA = false;
       end
			 if(CTATracker_LFRWatch == true) then
       	CTATracker_UpdateDisplay(CTATracker_LFRNames[i],tank,healer,dps);
			 elseif(CTATracker_LFRTankWatch == true and tank == true) then
				CTATracker_UpdateDisplay(CTATracker_LFRNames[i],tank,healer,dps);
			 elseif(CTATracker_LFRHealerWatch == true and healer == true) then
				CTATracker_UpdateDisplay(CTATracker_LFRNames[i],tank,healer,dps);
			 elseif(CTATracker_LFRDPSWatch == true and dps == true) then
				CTATracker_UpdateDisplay(CTATracker_LFRNames[i],tank,healer,dps);
			end
     end
  end
	CTATracker_MainFrame:SetHeight(CTATracker_MainFrame:GetHeight()+4);
	CTATracker_InnerFrame:SetHeight(CTATracker_InnerFrame:GetHeight()+2);
  if(CTATracker_NumberOfCTA == 1) then
    CTATracker_MainFrame:Hide();
    CTATracker_InnerFrame:Hide();
  end
  if((CTATracker_HeroicWatch == true or CTATracker_LFRWatch == true or CTATracker_TWWatch == true) and CTATracker_NumberOfCTA > 1) then
    CTATracker_MainFrame:Show();
    CTATracker_InnerFrame:Show();
  end
	end
	if(CTATracker_IsGrouped == true) then
		CTATracker_MainFrame:Hide();
	end

end
--tidy up
function CTATracker_TidyUp()
  --reset # of frame objects
  for i = 1, CTATracker_NumberOfCTA do
    if (i ~= 1) then
      CTATracker_CurrentCTA[i]:Hide();
      CTATracker_CurrentCTA[i] = nil;
    end
  end
  for i = 1, CTATracker_CurrentRoleIconNum do
    CTATracker_RoleIcons[i]:Hide();
    CTATracker_RoleIcons[i] = nil;
  end

	CTATracker_HeroicJoinButton:Hide();

	CTATracker_TWJoinButton1:Hide();
	CTATracker_TWJoinButton2:Hide();
	CTATracker_TWJoinButton3:Hide();

	CTATracker_DarkBJoinButton:Hide(); -- 1287
	CTATracker_TormGJoinButton:Hide(); -- 1288
	CTATracker_AlnJoinButton:Hide(); -- 1289
	CTATracker_ToVJoinButton:Hide(); -- 1411
	CTATracker_ArcAJoinButton:Hide(); -- 1290
	CTATracker_RoyalAthJoinButton:Hide(); -- 1291
	CTATracker_NightJoinButton:Hide(); -- 1292
	CTATracker_BetRiseJoinButton:Hide(); -- 1293

  CTATracker_CurrentCTA = {CTATracker_MainFrame};
  CTATracker_NumberOfCTA = 1;
  --reset # of role icon objects
  CTATracker_RoleIcons = {};
  CTATracker_CurrentRoleIconNum = 0;
	CTATracker_CurrentEnterQueueNum = 1;


  --CTATracker_CurrentlyHeroicCTA = false;
  --CTATracker_CurrentlyTWCTA = false;
  --CTATracker_CurrentlyLFRCTA = false;
  CTATracker_NextRelativePoint = nil;
end

--cleans up orphaned icons and font strings
function CTATracker_GarbageCollect()
  collectgarbage("collect");
end

function CTATracker_HideMainFrame()
	--CTATracker_MainFrame:Hide();
end

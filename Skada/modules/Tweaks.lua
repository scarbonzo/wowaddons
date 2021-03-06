-- Various silly tweaks needed to keep up with Blizzard's shenanigans. Not added to core because they may not be needed/relevant forever.
Skada:AddLoadableModule("Tweaks", "Various tweaks to get around deficiences and problems in the game's combat logs. Carries a small performance penalty.", function(Skada, L)
	if Skada.db.profile.modulesBlocked.Tweaks then return end

    local band = bit.band
        
    -- Cache variables
    local boms = {}
    local stormlashes = {}
    local akaarisource = nil
    local lastpet = {}
    local assignedhatis = {}
        
    local PET_FLAG = COMBATLOG_OBJECT_TYPE_PET
        
    local orig = Skada.cleuFrame:GetScript("OnEvent")
    Skada.cleuFrame:SetScript("OnEvent", function(frame, event, timestamp, eventtype, hideCaster, srcGUID, srcName, srcFlags, srcRaidFlags, dstGUID, dstName, dstFlags, dstRaidFlags, ...)

        -- Only perform these modifications if we are already in combat
        if Skada.current then
            local firstArg = select(1, ...)
            
            -- Hati (7.0, BM hunter artifact)
            if band(srcFlags, PET_FLAG) ~= 0 then
                lastpet.timestamp = timestamp
                lastpet.srcGUID = srcGUID
            elseif srcName == 'Hati' and not assignedhatis[srcGUID] then
                if lastpet.timestamp == timestamp then
                    local owner = Skada:GetPetOwner(lastpet.srcGUID)
                    if owner then
                        Skada:AssignPet(owner.id, owner.name, srcGUID)
                        assignedhatis[srcGUID] = true
                    end
                end
            end
                    
            -- Akaari's Soul (7.0, Rogue artifact)
            if (firstArg == 185438 or firstArg == 145424) and eventtype == 'SPELL_DAMAGE' then
                akaarisource = srcGUID
            end
            if firstArg == 220893 and akaarisource then
                srcGUID = UnitGUID(akaarisource)
                srcName = UnitName(akaarisource)
                akaarisource = nil
            end

            -- Greater Blessing of Might (7.0)
            if firstArg == 205729 and eventtype == 'SPELL_DAMAGE' then
                --Skada:Print('Ooh, caught a GBOM!')
                if not boms[srcGUID] then
                    local spellname = select(2, ...)
                    
                    -- Had no luck without iterating, sadly.
                    local i = 1
                    local buffname, _, _, _, _, _, _, caster, _, _, _ = UnitBuff(srcName, i)
                    local bomSource = nil
                    while buffname do
                        if buffname == spellname then
                            bomSource = caster
                        end
                        i = i + 1;
                        buffname, _, _, _, _, _, _, caster, _, _, _ = UnitBuff(srcName, i)
                    end
                    
                    if bomSource then
                        boms[srcGUID] = {
                            id = UnitGUID(bomSource),
                            name = UnitName(bomSource)
                        }
                    end
                end

                local source = boms[srcGUID]
                if source then
                    srcGUID = source.id
                    srcName = source.name
                end
            end

            if firstArg == 203528 and eventtype == 'SPELL_AURA_REMOVED' then
                --Skada:Print("removed BOM source")
                boms[dstGUID] = nil
            end

            -- Stormlash (7.0)
            if firstArg == 195256 and eventtype == 'SPELL_DAMAGE' then
                --Skada:Print('Ooh, caught a Stormlash!')
                local source = stormlashes[srcGUID]
                if source ~= nil then
                    srcGUID = source.id
                    srcName = source.name
                end
            end

            if firstArg == 195222 then
                if eventtype == 'SPELL_AURA_APPLIED' and srcGUID ~= dstGUID then
                    --Skada:Print('New Stormlash source: '..srcGUID..' - '..srcName)
                    stormlashes[dstGUID] = {
                        id = srcGUID,
                        name = srcName
                    }
                end

                if eventtype == 'SPELL_AURA_REMOVED' then
                    --Skada:Print('Removed Stormlash source')
                    stormlashes[dstGUID] = nil
                end
            end
                    
        end

        orig(frame, event, timestamp, eventtype, hideCaster, srcGUID, srcName, srcFlags, srcRaidFlags, dstGUID, dstName, dstFlags, dstRaidFlags, ...)
    end)
        
end)

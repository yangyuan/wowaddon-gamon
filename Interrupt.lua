SetCVar("scriptErrors", 1, SHOW_LUA_ERRORS)

local frame = CreateFrame("FRAME", "INTERRUPT");
frame:RegisterUnitEvent("COMBAT_LOG_EVENT_UNFILTERED");
local function eventHandler(self, event, ...)
	local timestamp, event_extra, hideCaster, sourceGUID, sourceName, sourceFlags, sourceFlags2, destGUID, destName, destFlags, destFlags2,
	spellID, spellName, spellSchool,
	extraSpellID, extraSpellName, extraSchool = ...; 
	if (event_extra == "SPELL_INTERRUPT") and (sourceGUID == UnitGUID("pet") or sourceGUID == UnitGUID("player")) then
		local x = math.random(2)
		local extra = ""
		if x == 1 then
			extra = "主席说：你打断，我放心！"
		elseif x == 2 then
			extra = "你咬我呀！"
		else
			extra = "喵！"
		end
		SendChatMessage("华丽丽地用"..GetSpellLink(spellID).."打断"..destName.."的"..GetSpellLink(extraSpellID).."，"..extra, "SAY", nil, nil)
	end
	if (event_extra == "SPELL_DISPEL") and (sourceGUID == UnitGUID("pet") or sourceGUID == UnitGUID("player")) then
		local x = math.random(2)
		local extra = ""
		if x == 1 then
			extra = "主席说：你驱散，我放心！"
		elseif x == 2 then
			extra = "你咬我呀！"
		else
			extra = "喵！"
		end
		if not (spellID == 32375) then
			SendChatMessage("华丽丽地用"..GetSpellLink(spellID).."驱散"..destName.."身上的"..GetSpellLink(extraSpellID).."，"..extra, "SAY", nil, nil)
		end
		
	end 
end
frame:SetScript("OnEvent", eventHandler);
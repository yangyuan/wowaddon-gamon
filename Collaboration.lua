SetCVar("scriptErrors", 1, SHOW_LUA_ERRORS)

local frame = CreateFrame("FRAME", "COLLABORATION");
frame:RegisterEvent("QUEST_ACCEPTED");
frame:RegisterEvent("QUEST_COMPLETE");
frame:RegisterEvent("UI_INFO_MESSAGE");
local function eventHandler(self, event, ...)
	local message_log
	if (event == "QUEST_ACCEPTED") then
		local questLogID, questID = ...
		local questTitle, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily, questID = GetQuestLogTitle(questLogID);
		message_log = questTitle;
		SendChatMessage("QUEST ACCEPTED: "..questTitle , (IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and "INSTANCE_CHAT") or (IsInRaid() and "RAID") or "PARTY")
	end
	if (event == "QUEST_COMPLETE") then
		message_log = GetTitleText()
		SendChatMessage("QUEST COMPLETE: "..GetTitleText() , (IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and "INSTANCE_CHAT") or (IsInRaid() and "RAID") or "PARTY")
	end
	if (event == "UI_INFO_MESSAGE") then
		local message = ...
		message_log = message
		local REGEX_QP = "(.*)[:：]%s*([-%d]+)%s*/([-%d]+)%s*";
		local REGEX_QC = "%(Complete%)";
		local MESSAGE_QP = "Quest progress: ";
		local MESSAGE_QC = " (Complete)";
		
		if string.find(message, REGEX_QP) then
			local _,num1,num2=string.match(message, REGEX_QP)
			if num1 == num2 then
				SendChatMessage(MESSAGE_QP..message..MESSAGE_QC, (IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and "INSTANCE_CHAT") or (IsInRaid() and "RAID") or "PARTY");
			else
				SendChatMessage(MESSAGE_QP..message, (IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and "INSTANCE_CHAT") or (IsInRaid() and "RAID") or "PARTY");
			end
		elseif string.find(message, REGEX_QC) then
			SendChatMessage(MESSAGE_QP..message, (IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and "INSTANCE_CHAT") or (IsInRaid() and "RAID") or "PARTY");
		end
	end
	print("|cffff8800"..event..": "..message_log.."|r")
end
frame:SetScript("OnEvent", eventHandler);
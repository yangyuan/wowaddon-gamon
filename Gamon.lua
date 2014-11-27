SetCVar("scriptErrors", 1, SHOW_LUA_ERRORS)


SlashCmdList["GAMON"] = function(msg, editbox)

end


local login = CreateFrame("FRAME", "GAMON_MESSAGE");
login:RegisterEvent("PLAYER_LOGIN")
login:SetScript("OnEvent",function()
	print("|cff00A2FF加摩尔会保护大家的！|r")
	print("|cffff8800吧......|r")
end)
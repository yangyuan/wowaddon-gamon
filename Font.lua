SetCVar("scriptErrors", 1, SHOW_LUA_ERRORS)

local login = CreateFrame("FRAME", "GAMON_FONT_HELPER");
login:RegisterEvent("PLAYER_LOGIN")

login:SetScript("OnEvent",function()
	-- DEFAULT_CHAT_FRAME.editBox:SetFont([[Fonts\ARHei.TTF]], Size)
	-- print (DEFAULT_CHAT_FRAME:GetAttribute("name"))
	for i = 1, 10 do
		local frame =_G["ChatFrame"..i].editBox
		local font, size = frame:GetFont()
		frame:SetFont([[Fonts\ARHei.TTF]], size)
	end
end)
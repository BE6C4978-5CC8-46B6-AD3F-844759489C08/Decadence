function onConnectStatusChangeEvent(serverConnectionHandlerID, status, errorNumber)
	if status == 4 then
		local ll = ts3.getCurrentServerConnectionHandlerID()
		local oij, error = ts3.getClientID(ll)

--	msg_p(serverConnectionHandlerID, '[b][color=teal] ' .. name .. ver .. by .. '[/color][/b]\n There are two commands:\n ! [color=darkgreen]add [ [i]word1[/i] ] [ [i]word2[/i] ] [etc] [/color] \n[color=darkred]! del (! remove) [ [i]word1[/i] ] [ [i]word2[/i] ] [etc].[/color] \n '.. cred, oij)
	local clients = getusers(ll)

	for i,v in pairs(clients) do
		msg_t('CONNECTED USER: '.. userBBcode(ll, v))
	end

	end
end

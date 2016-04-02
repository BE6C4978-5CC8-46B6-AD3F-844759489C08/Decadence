--[[ ===== FUNC SECTION ======]]
local baname = 'Decadence '

	function onConnectStatusChangeEvent(serverConnectionHandlerID, status, errorNumber)
	for script,events in pairs(ts3RegisteredModules) do
		if events.onConnectStatusChangeEvent ~= nil then
			events.onConnectStatusChangeEvent(serverConnectionHandlerID, status, errorNumber)
			ts3.printMessageToCurrentTab('Im gonna :O')
		end
	end
end
local function onTextMessageEvent(serverConnectionHandlerID, targetMode, toID, fromID, fromName, fromUniqueIdentifier, message, ffIgnored)
    ts3.printMessageToCurrentTab(baname .. ': onTextMessageEvent: ' .. serverConnectionHandlerID .. ' ' .. targetMode .. ' ' .. toID .. ' ' .. fromID .. ' ' .. fromName .. ' ' .. fromUniqueIdentifier .. ' ' .. message .. ' ' .. ffIgnored)
end

function onNewChannelEvent(serverConnectionHandlerID, channelID, channelParentID)
	for script,events in pairs(ts3RegisteredModules) do
		if events.onNewChannelEvent ~= nil then
			events.onNewChannelEvent(serverConnectionHandlerID, channelID, channelParentID)
		end
	end
end

function onNewChannelCreatedEvent(serverConnectionHandlerID, channelID, channelParentID, invokerID, invokerName, invokerUniqueIdentifier)
	for script,events in pairs(ts3RegisteredModules) do
		if events.onNewChannelCreatedEvent ~= nil then
			events.onNewChannelCreatedEvent(serverConnectionHandlerID, channelID, channelParentID, invokerID, invokerName, invokerUniqueIdentifier)
		end
	end
end

function onUpdateChannelEditedEvent(serverConnectionHandlerID, channelID, invokerID, invokerName, invokerUniqueIdentifier)
	for script,events in pairs(ts3RegisteredModules) do
		if events.onUpdateChannelEditedEvent ~= nil then
			events.onUpdateChannelEditedEvent(serverConnectionHandlerID, channelID, invokerID, invokerName, invokerUniqueIdentifier)
		end
	end
end

local function onUpdateClientEvent(serverConnectionHandlerID, clientID)
	for script,events in pairs(ts3RegisteredModules) do
		if events.onUpdateClientEvent ~= nil then
			events.onUpdateClientEvent(serverConnectionHandlerID, clientID)
		end
	end
end

decadence_events = {
	onServerPermissionErrorEvent = onServerPermissionErrorEvent,
	onTextMessageEvent = onTextMessageEvent,
	onUpdateClientEvent = onUpdateClientEvent,
	onChannelMove = onChannelMove,
}

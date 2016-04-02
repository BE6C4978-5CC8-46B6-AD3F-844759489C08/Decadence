print(" Loading realy required Function ")
require("ts3init")
print(" Loading : events ")
require("decadence/events")
print(" Loading : Function")
require ("decadence/ts3")
require("decadence/func")
print(" Loading : onTextMessageEvent")
require("decadence/event/onTextMessageEvent")
print(" Loading : onUpdateClientEvent ")
require("decadence/event/onUpdateClientEvent")
--print(" Loading : onChannelMoveEvent")
--require("decadence/event/onChannelMoveEvent")
print(" Loading : onNewChannelEvent")
require("decadence/event/onNewChannelEvent")
print(" Loading : onConnectStatusChangeEvent")
require("decadence/event/onConnectStatusChangeEvent")
--require("decadence/dumper.lua")
	--onServerPermissionErrorEvent = decadence_events.onServerPermissionErrorEvent,

local registeredEvents = {
	onConnectStatusChangeEvent = decadence_events.onConnectStatusChangeEvent,
	onNewChannelEvent = decadence_events.onNewChannelEvent,
	onChannelMoveEvent = decadence_events.onChannelMoveEvent,
	onTextMessageEvent = decadence_events.onTextMessageEvent,
	onUpdateClientEvent = decadence_events.onUpdateClientEvent,
}
ts3RegisterModule("decadence", registeredEvents)

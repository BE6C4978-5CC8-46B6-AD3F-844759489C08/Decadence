require('decadence/mes')
require('ts3defs')
require('ts3errors')

mes = 'plugins/lua_plugin/decadence/mes.lua'

-- Plugin function  Start --
function as(SID, data)
	local konsola = 1
	local tab = 1
	if konsola == 1 and tab == 1 then
		print('    Debug:: ' .. data)
		ts3.printMessageToCurrentTab('  Debug:: ' .. data)
	elseif konsola == 0 and tab == 1 then
			ts3.printMessageToCurrentTab('  Debug:: ' .. data)
	end
end

function check_username(SID,userID)
	local data = read_word()
	for a,z in ipairs(data) do
		if string.find(z, string.lower(getuserpro(serverConnectionHandlerID,clientID,1))) or string.find(z,string.lower(getuserpro(serverConnectionHandlerID,clientID,39))) or string.find(z,string.lower(getuserpro(serverConnectionHandlerID,clientID,44))) or string.find(z,string.lower(getuserpro(serverConnectionHandlerID,clientID,45))) or string.find(z,string.lower(getuserpro(serverConnectionHandlerID,clientID,53))) then
			msg_t(msg)
			msg_p(serverConnectionHandlerID, 'lol', clientID)
		end
	end
	return 2
end


function explode(div,str)
	if(div=='') then
		return false
	end
	local pos,arr = 0,{}
	for st,sp in function()
		return string.find(str,div,pos,true)
	end do
		table.insert(arr,string.sub(str,pos,st-1)) pos = sp + 1
	end
	table.insert(arr,string.sub(str,pos))
	return arr
end

function removewith(filename,linewith)
	local fp = io.open( filename, 'r' )
	if fp == nil then
		return nil
	end
	content = {}
	for line in fp:lines() do
		if not string.find(line, linewith) then
			content[#content+1] = line
		end
	end
	fp:close() fp = io.open( filename, 'w+' )
	for i = 1, #content do
		fp:write( string.format( '%s\n', content[i]))
	end
	fp:close()
end

function del_bad_words(serverConnectionHandlerID, message, fromID, qwe_myid)
		array = explode(' ', message)
			for t,y in ipairs(array) do
				if not string.find(y, '!del') and not string.find(y, '!remove') then
				removewith(qwe_banfile, y)
				msg_t(string.gsub(msgdel, '/INAPPROPRIATE/', y))
				end -- end if
			end -- end for loop
end

function add_bad_words(serverConnectionHandlerID, message,fromID, qwe_myid)
		file = io.open (qwe_banfile , 'a')
		file:seek('end')
		array = explode(' ', message)
			for e,y in ipairs(array) do
				if not string.find(y, '!add') then
				local str = y .. '\n'
				file:write (str)
				io.flush ()
				--local kanal = ts3.getChannelOfClient(serverConnectionHandlerID, fromID)
				--msg_c(serverConnectionHandlerID, msgadd ..' ' .. y, kanal)
				msg_t(string.gsub(msgadd, '/INAPPROPRIATE/', y))

				end
			end
		file:close ()
end

function read_word()
	local database = {}
	for l in io.lines(qwe_banfile) do
		table.insert(database, tostring(l))
	end
	return database
end

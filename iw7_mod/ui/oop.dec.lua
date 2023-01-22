LUI.Class = function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = {
		__index = f1_arg0
	}
	f1_local0.super = f1_arg0
	if not f1_arg0 or not f1_arg0.allocate then
		f1_local0.allocate = function ()
			return {}
		end
		
	end
	f1_local0.new = function ( ... )
		local f3_local0 = f1_local0.allocate()
		local f3_local1 = getmetatable( f3_local0 )
		if not f3_local1 then
			f3_local1 = {}
			setmetatable( f3_local0, f3_local1 )
		end
		if type( f3_local0 ) == "userdata" then
			local f3_local2 = {}
			f3_local1.__index = f3_local2
			setmetatable( f3_local2, {
				__index = f1_local0
			} )
			f3_local1.__newindex = f3_local2
		else
			f3_local1.__index = f1_local0
		end
		f3_local0:init( ... )
		return f3_local0
	end
	
	setmetatable( f1_local0, f1_local1 )
	return f1_local0
end


LUI.LUIElementPool = LUI.Class()
LUI.LUIElementPool.init = function ( f1_arg0, f1_arg1 )
	f1_arg0.pool = {}
	f1_arg0.lastFreedElement = nil
	f1_arg0.id = f1_arg1.id or ""
	f1_arg0.buildElement = f1_arg1.buildElement
	f1_arg0.maxPoolSize = f1_arg1.maxPoolSize or 10
	local f1_local0 = f1_arg1.initialPoolSize or 1
	for f1_local1 = 1, f1_local0, 1 do
		local f1_local4 = f1_local1
		local f1_local5 = f1_arg0.buildElement()
		f1_local5.inUse = false
		table.insert( f1_arg0.pool, f1_local5 )
	end
end

LUI.LUIElementPool.AllocateElement = function ( f2_arg0 )
	assert( f2_arg0.pool )
	if f2_arg0.lastFreedElement ~= nil then
		local f2_local0 = f2_arg0.lastFreedElement
		f2_arg0.lastFreedElement = nil
		f2_local0.inUse = true
		f2_local0:processEvent( {
			name = "pooled_on_allocate"
		} )
		return f2_local0
	end
	local f2_local0 = #f2_arg0.pool
	for f2_local1 = 1, f2_local0, 1 do
		local f2_local4 = f2_arg0.pool[f2_local1]
		if f2_local4.inUse == false then
			f2_local4.inUse = true
			f2_local4:processEvent( {
				name = "pooled_on_allocate"
			} )
			return f2_local4
		end
	end
	local f2_local1 = nil
	if #f2_arg0.pool < f2_arg0.maxPoolSize then
		assert( f2_arg0.buildElement )
		f2_local1 = f2_arg0.buildElement()
		table.insert( f2_arg0.pool, f2_local1 )
		f2_local1.inUse = true
	else
		f2_local1 = f2_arg0.buildElement()
	end
	if f2_local1 then
		f2_local1:processEvent( {
			name = "pooled_on_allocate"
		} )
	end
	return f2_local1
end

LUI.LUIElementPool.DeallocateElement = function ( f3_arg0, f3_arg1 )
	f3_arg1.inUse = false
	f3_arg0.lastFreedElement = f3_arg1
end


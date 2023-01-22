UNLOCK = UNLOCK or {}
UNLOCK.SplitCompoundUnlockRef = function ( f1_arg0 )
	local f1_local0 = LUI.Split( f1_arg0, "+" )
	assert( #f1_local0 >= 2 )
	return f1_local0[1], f1_local0[2]
end


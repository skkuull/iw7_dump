LUI.UIPrettyNumber = LUI.Class( LUI.UIText )
LUI.UIPrettyNumber.init = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg2 )
	assert( type( f1_arg2.speed ) == "number" )
	assert( type( f1_arg2.initialValue ) == "number" )
	local f1_local0 = assert
	local f1_local1
	if f1_arg2.precision and type( f1_arg2.precision ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_arg2.precision = f1_arg2.precision or 1
	LUI.UIText.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "UIPrettyNumber"
	if f1_arg0.setupPrettyNumber then
		f1_arg0:setupPrettyNumber( f1_arg2.speed, f1_arg2.initialValue, f1_arg2.precision )
	end
end


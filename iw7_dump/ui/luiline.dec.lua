LUI.UILine = LUI.Class( LUI.UIElement )
LUI.UILine.START = 0
LUI.UILine.END = 1
LUI.UILine.init = function ( f1_arg0 )
	LUI.UILine.super.init( f1_arg0 )
	f1_arg0:SetupLine()
end

LUI.UILine.SetVertexPosition = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4, f2_arg5, f2_arg6, f2_arg7 )
	local f2_local0 = assert
	local f2_local1
	if f2_arg1 ~= LUI.UILine.START and f2_arg1 ~= LUI.UILine.END then
		f2_local1 = false
	else
		f2_local1 = true
	end
	f2_local0( f2_local1 )
	if f2_arg1 == 0 then
		f2_arg0:SetLeftAnchor( f2_arg2, f2_arg6, f2_arg7 )
		f2_arg0:SetTopAnchor( f2_arg3, f2_arg6, f2_arg7 )
		f2_arg0:SetLeft( f2_arg4, f2_arg6, f2_arg7 )
		return f2_arg0:SetTop( f2_arg5, f2_arg6, f2_arg7 )
	else
		f2_arg0:SetRightAnchor( 1 - f2_arg2, f2_arg6, f2_arg7 )
		f2_arg0:SetBottomAnchor( 1 - f2_arg3, f2_arg6, f2_arg7 )
		f2_arg0:SetRight( f2_arg4, f2_arg6, f2_arg7 )
		return f2_arg0:SetBottom( f2_arg5, f2_arg6, f2_arg7 )
	end
end

LUI.UILine.id = "LUILine"

LUI.UIText = LUI.Class( LUI.UIElement )
LUI.UIText.build = function ( f1_arg0, f1_arg1 )
	return LUI.UIText.new()
end

LUI.UIText.init = function ( f2_arg0, f2_arg1 )
	LUI.UIElement.init( f2_arg0, f2_arg1 )
	f2_arg0:setupUIText()
end

LUI.UIText.TransitionComplete_OutState = function ( f3_arg0, f3_arg1 )
	f3_arg0:setText( f3_arg0.replaceContentData.text )
	f3_arg0:registerEventHandler( "transition_complete_" .. f3_arg0.replaceContentData.outState, nil )
	f3_arg0:animateToState( f3_arg0.replaceContentData.inState, f3_arg0.replaceContentData.inDuration )
	f3_arg0.replaceContentData = nil
end

LUI.UIText.setText = function ( f4_arg0, f4_arg1, f4_arg2 )
	return f4_arg0:setTextInC( f4_arg1, f4_arg2 )
end

LUI.UIText.setTextStyle = function ( f5_arg0, f5_arg1 )
	f5_arg0.m_textStyle = f5_arg1
end

LUI.UIText.id = "LUIText"

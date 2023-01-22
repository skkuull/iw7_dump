LUI.UIMarqueeText = LUI.Class( LUI.UIElement )
LUI.UIMarqueeText.build = function ( f1_arg0, f1_arg1 )
	if not f1_arg1 then
		f1_arg1 = {}
	end
	local self = LUI.UIMarqueeText.new( f1_arg1.defaultAnimationState )
	if f1_arg1.textHeight then
		LUI.UIMarqueeText.SetTextHeight( self, f1_arg1.textHeight )
	end
	if f1_arg1.useTextWrapping then
		LUI.UIMarqueeText.SetUseTextWrapping( self, f1_arg1.useTextWrapping )
	end
	if f1_arg1.scrollSpeed then
		LUI.UIMarqueeText.SetSpeed( self, f1_arg1.scrollSpeed )
	end
	return self
end

LUI.UIMarqueeText.SetColor = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	f2_arg0:registerAnimationState( "default", {
		red = f2_arg1,
		green = f2_arg2,
		blue = f2_arg3,
		alpha = 1
	} )
	f2_arg0:animateToState( "default" )
	LUI.UIMarqueeText.RestartScroll( f2_arg0 )
end

LUI.UIMarqueeText.init = function ( f3_arg0, f3_arg1 )
	LUI.UIElement.init( f3_arg0, f3_arg1 )
	f3_arg0:setUseStencil( true )
	local f3_local0 = {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	}
	local self
	if f3_arg1 then
		self = f3_arg1.font
		if not self then
		
		else
			f3_local0.font = self
			f3_local0.red = 1
			f3_local0.green = 1
			f3_local0.blue = 1
			f3_local0.alpha = 1
			self = LUI.UIText.new( f3_local0 )
			f3_arg0.text = self
			f3_arg0:addElement( self )
			f3_arg0.text:registerAnimationState( "default", f3_local0 )
			f3_arg0.text:animateToState( "default" )
			f3_arg0.text:registerAnimationState( "start", f3_local0 )
			f3_arg0.text:registerAnimationState( "alphaOut", {
				alpha = 0
			} )
			f3_arg0.text:registerEventHandler( "transition_complete_start", LUI.UIMarqueeText.HandleStartScroll )
			f3_arg0.text:animateToState( "start", 1 )
			f3_arg0.text.scrollSpeed = 90
		end
	end
	self = CoD.TextSettings.NormalFont.Font
end

LUI.UIMarqueeText.RestartScroll = function ( f4_arg0 )
	f4_arg0.text:animateToState( "start", 1 )
end

LUI.UIMarqueeText.SetUseTextWrapping = function ( f5_arg0, f5_arg1 )
	f5_arg0.text.useTextWrapping = f5_arg1
	LUI.UIMarqueeText.RestartScroll( f5_arg0 )
end

LUI.UIMarqueeText.SetTextHeight = function ( f6_arg0, f6_arg1 )
	local f6_local0 = {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = f6_arg1,
		left = 0,
		right = 0
	}
	f6_arg0.text.textHeight = f6_arg1
	f6_arg0.text:registerAnimationState( "default", f6_local0 )
	f6_arg0.text:registerAnimationState( "start", f6_local0 )
	LUI.UIMarqueeText.RestartScroll( f6_arg0 )
end

LUI.UIMarqueeText.SetSpeed = function ( f7_arg0, f7_arg1 )
	f7_arg0.text.scrollSpeed = f7_arg1
end

LUI.UIMarqueeText.HandleStartScroll = function ( f8_arg0 )
	local f8_local0 = f8_arg0:getParent()
	local f8_local1, f8_local2, f8_local3, f8_local4 = f8_local0:getCurrentGlobalRect()
	local f8_local5 = f8_arg0:getCurrentGlobalRect()
	local f8_local6 = f8_local0:getCurrentAlignment()
	local f8_local7 = LUI.Alignment.None
	if f8_arg0.useTextWrapping then
		if f8_local6 == LUI.Alignment.None then
			local f8_local8 = LUI.Alignment.Left
		end
		f8_local7 = f8_local8 or f8_local6
	end
	f8_arg0:registerAnimationState( "setup", {
		alignment = f8_local7
	} )
	f8_arg0:animateToState( "setup" )
	if f8_local1 and f8_local5 then
		local f8_local9, f8_local10 = f8_arg0:getElementTextDims()
		local f8_local11 = f8_local0:GetCurrentFont()
		local f8_local12, f8_local13, f8_local14, f8_local15 = f8_local0:getCurrentRGBA()
		local f8_local16 = nil
		local f8_local17 = false
		local f8_local18 = {
			red = f8_local12,
			green = f8_local13,
			blue = f8_local14,
			alpha = f8_local15
		}
		local f8_local19 = 0.01
		if f8_local3 - f8_local1 + f8_local19 < f8_local9 and not f8_arg0.textHeight then
			f8_local16 = (f8_local9 - f8_local3 - f8_local1) / f8_arg0.scrollSpeed * 1000
			f8_local17 = true
			f8_local18.alignment = LUI.Alignment.None
			f8_arg0:registerAnimationState( "alphaIn", f8_local18 )
			f8_arg0:registerAnimationState( "one", {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				top = 0,
				bottom = f8_local10,
				left = 0,
				right = f8_local9,
				font = f8_local11
			} )
			f8_arg0:registerAnimationState( "two", {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = false,
				rightAnchor = true,
				top = 0,
				bottom = f8_local10,
				left = -f8_local9,
				right = 0,
				font = f8_local11
			} )
			local f8_local20 = MBh.AnimateLoop( {
				{
					"alphaIn",
					0
				},
				{
					"one",
					0
				},
				{
					"one",
					500
				},
				{
					"two",
					f8_local16
				},
				{
					"two",
					500
				},
				{
					"alphaOut",
					250
				},
				{
					"one",
					0
				},
				{
					"alphaIn",
					250
				}
			} )
			f8_local20( f8_arg0 )
		elseif f8_local4 - f8_local2 + f8_local19 < f8_local10 and f8_arg0.textHeight then
			local f8_local21 = f8_local10 - f8_local4 - f8_local2
			local f8_local22 = f8_local10 / f8_arg0.textHeight
			f8_local16 = f8_local21 / f8_arg0.scrollSpeed * 1000
			f8_local17 = true
			local f8_local20
			if f8_local6 == LUI.Alignment.None then
				f8_local20 = LUI.Alignment.Center
				if not f8_local20 then
				
				else
					f8_local18.alignment = f8_local20
					f8_arg0:registerAnimationState( "alphaIn", f8_local18 )
					f8_local20 = {
						{
							"alphaOut",
							0
						},
						{
							"line_0",
							0
						},
						{
							"alphaIn",
							250
						}
					}
					for f8_local23 = 0, f8_local22 - math.floor( (f8_local4 - f8_local2) / f8_arg0.textHeight ), 1 do
						local f8_local26 = "line_" .. f8_local23
						f8_arg0:registerAnimationState( f8_local26, {
							topAnchor = true,
							bottomAnchor = false,
							leftAnchor = true,
							rightAnchor = true,
							top = -f8_local23 * f8_arg0.textHeight,
							bottom = (1 - f8_local23) * f8_arg0.textHeight,
							left = 0,
							right = 0,
							font = f8_local11
						} )
						table.insert( f8_local20, {
							f8_local26,
							f8_arg0.textHeight / f8_arg0.scrollSpeed * 1000,
							true,
							true
						} )
						table.insert( f8_local20, {
							f8_local26,
							2000
						} )
					end
					table.insert( f8_local20, {
						"alphaOut",
						250
					} )
					table.insert( f8_local20, {
						"line_0",
						0
					} )
					local f8_local23 = MBh.AnimateLoop( f8_local20 )
					f8_local23( f8_arg0 )
				end
			end
			f8_local20 = f8_local6
		end
		if not f8_local17 then
			f8_local18.alignment = f8_local6
			f8_arg0:registerEventHandler( LUI.FormatAnimStateFinishEvent( "alphaIn" ), nil )
			f8_arg0:registerAnimationState( "alphaIn", f8_local18 )
			f8_arg0:animateToState( "alphaIn", 0 )
		end
	else
		f8_arg0:animateToState( "alphaOut" )
		f8_arg0:animateToState( "start", 1 )
	end
end

LUI.UIMarqueeText.setText = function ( f9_arg0, f9_arg1 )
	f9_arg0.text:setTextInC( f9_arg1 )
	if f9_arg0.text.currText ~= f9_arg1 then
		LUI.UIMarqueeText.RestartScroll( f9_arg0 )
	end
	f9_arg0.text.currText = f9_arg1
end

LUI.UIMarqueeText.setTextStyle = function ( f10_arg0, f10_arg1 )
	f10_arg0.text.m_textStyle = f10_arg1
end

LUI.UIMarqueeText.id = "LUIMarqueeText"
MenuBuilder.registerType( "UIMarqueeText", LUI.UIMarqueeText.build )

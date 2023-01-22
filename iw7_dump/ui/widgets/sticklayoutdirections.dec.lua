local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function StickLayoutDirections( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 250 * _1080p )
	self.id = "StickLayoutDirections"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local UpTextR = nil
	
	UpTextR = LUI.UIStyledText.new()
	UpTextR.id = "UpTextR"
	UpTextR:SetFontSize( 19 * _1080p )
	UpTextR:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	UpTextR:SetAlignment( LUI.Alignment.Left )
	UpTextR:SetOptOutRightToLeftAlignmentFlip( true )
	UpTextR:SetShadowMinDistance( -0.8, 0 )
	UpTextR:SetShadowMaxDistance( 0.8, 0 )
	UpTextR:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 40, _1080p * 400, _1080p * 12, _1080p * 31 )
	UpTextR:SubscribeToModelThroughElement( self, "upColor", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.upColor:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			UpTextR:SetRGBFromInt( f2_local0, 0 )
		end
	end )
	UpTextR:SubscribeToModelThroughElement( self, "up", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.up:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			UpTextR:setText( ToUpperCase( f3_local0 ), 0 )
		end
	end )
	self:addElement( UpTextR )
	self.UpTextR = UpTextR
	
	local DownTextR = nil
	
	DownTextR = LUI.UIStyledText.new()
	DownTextR.id = "DownTextR"
	DownTextR:SetFontSize( 19 * _1080p )
	DownTextR:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	DownTextR:SetAlignment( LUI.Alignment.Left )
	DownTextR:SetOptOutRightToLeftAlignmentFlip( true )
	DownTextR:SetShadowMinDistance( -0.8, 0 )
	DownTextR:SetShadowMaxDistance( 0.8, 0 )
	DownTextR:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 40, _1080p * 400, _1080p * -62.5, _1080p * -43.5 )
	DownTextR:SubscribeToModelThroughElement( self, "downColor", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.downColor:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			DownTextR:SetRGBFromInt( f4_local0, 0 )
		end
	end )
	DownTextR:SubscribeToModelThroughElement( self, "down", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.down:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			DownTextR:setText( ToUpperCase( f5_local0 ), 0 )
		end
	end )
	self:addElement( DownTextR )
	self.DownTextR = DownTextR
	
	local RightTextR = nil
	
	RightTextR = LUI.UIStyledText.new()
	RightTextR.id = "RightTextR"
	RightTextR:SetFontSize( 19 * _1080p )
	RightTextR:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	RightTextR:SetAlignment( LUI.Alignment.Left )
	RightTextR:SetOptOutRightToLeftAlignmentFlip( true )
	RightTextR:SetShadowMinDistance( -0.8, 0 )
	RightTextR:SetShadowMaxDistance( 0.8, 0 )
	RightTextR:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 40, _1080p * 400, _1080p * -9.5, _1080p * 9.5 )
	RightTextR:SubscribeToModelThroughElement( self, "rightColor", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.rightColor:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			RightTextR:SetRGBFromInt( f6_local0, 0 )
		end
	end )
	RightTextR:SubscribeToModelThroughElement( self, "right", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.right:GetValue( f1_local1 )
		if f7_local0 ~= nil then
			RightTextR:setText( ToUpperCase( f7_local0 ), 0 )
		end
	end )
	self:addElement( RightTextR )
	self.RightTextR = RightTextR
	
	local LeftTextR = nil
	
	LeftTextR = LUI.UIStyledText.new()
	LeftTextR.id = "LeftTextR"
	LeftTextR:SetFontSize( 19 * _1080p )
	LeftTextR:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	LeftTextR:SetAlignment( LUI.Alignment.Left )
	LeftTextR:SetOptOutRightToLeftAlignmentFlip( true )
	LeftTextR:SetShadowMinDistance( -0.8, 0 )
	LeftTextR:SetShadowMaxDistance( 0.8, 0 )
	LeftTextR:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 40, _1080p * 400, _1080p * 43.5, _1080p * 62.5 )
	LeftTextR:SubscribeToModelThroughElement( self, "leftColor", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.leftColor:GetValue( f1_local1 )
		if f8_local0 ~= nil then
			LeftTextR:SetRGBFromInt( f8_local0, 0 )
		end
	end )
	LeftTextR:SubscribeToModelThroughElement( self, "left", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.left:GetValue( f1_local1 )
		if f9_local0 ~= nil then
			LeftTextR:setText( ToUpperCase( f9_local0 ), 0 )
		end
	end )
	self:addElement( LeftTextR )
	self.LeftTextR = LeftTextR
	
	local ButtonTextR = nil
	
	ButtonTextR = LUI.UIStyledText.new()
	ButtonTextR.id = "ButtonTextR"
	ButtonTextR:SetFontSize( 19 * _1080p )
	ButtonTextR:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ButtonTextR:SetAlignment( LUI.Alignment.Left )
	ButtonTextR:SetOptOutRightToLeftAlignmentFlip( true )
	ButtonTextR:SetShadowMinDistance( -0.8, 0 )
	ButtonTextR:SetShadowMaxDistance( 0.8, 0 )
	ButtonTextR:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 40, _1080p * 400, _1080p * -31, _1080p * -12 )
	ButtonTextR:SubscribeToModelThroughElement( self, "buttonColor", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.buttonColor:GetValue( f1_local1 )
		if f10_local0 ~= nil then
			ButtonTextR:SetRGBFromInt( f10_local0, 0 )
		end
	end )
	ButtonTextR:SubscribeToModelThroughElement( self, "button", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.button:GetValue( f1_local1 )
		if f11_local0 ~= nil then
			ButtonTextR:setText( ToUpperCase( f11_local0 ), 0 )
		end
	end )
	self:addElement( ButtonTextR )
	self.ButtonTextR = ButtonTextR
	
	local UpTextL = nil
	
	UpTextL = LUI.UIStyledText.new()
	UpTextL.id = "UpTextL"
	UpTextL:SetFontSize( 19 * _1080p )
	UpTextL:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	UpTextL:SetAlignment( LUI.Alignment.Right )
	UpTextL:SetShadowMinDistance( -0.8, 0 )
	UpTextL:SetShadowMaxDistance( 0.8, 0 )
	UpTextL:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -400, _1080p * -40, _1080p * 12, _1080p * 31 )
	UpTextL:SubscribeToModelThroughElement( self, "upColor", function ()
		local f12_local0 = self:GetDataSource()
		f12_local0 = f12_local0.upColor:GetValue( f1_local1 )
		if f12_local0 ~= nil then
			UpTextL:SetRGBFromInt( f12_local0, 0 )
		end
	end )
	UpTextL:SubscribeToModelThroughElement( self, "up", function ()
		local f13_local0 = self:GetDataSource()
		f13_local0 = f13_local0.up:GetValue( f1_local1 )
		if f13_local0 ~= nil then
			UpTextL:setText( ToUpperCase( f13_local0 ), 0 )
		end
	end )
	self:addElement( UpTextL )
	self.UpTextL = UpTextL
	
	local DownTextL = nil
	
	DownTextL = LUI.UIStyledText.new()
	DownTextL.id = "DownTextL"
	DownTextL:SetFontSize( 19 * _1080p )
	DownTextL:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	DownTextL:SetAlignment( LUI.Alignment.Right )
	DownTextL:SetShadowMinDistance( -0.8, 0 )
	DownTextL:SetShadowMaxDistance( 0.8, 0 )
	DownTextL:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * -400, _1080p * -40, _1080p * -62.5, _1080p * -43.5 )
	DownTextL:SubscribeToModelThroughElement( self, "downColor", function ()
		local f14_local0 = self:GetDataSource()
		f14_local0 = f14_local0.downColor:GetValue( f1_local1 )
		if f14_local0 ~= nil then
			DownTextL:SetRGBFromInt( f14_local0, 0 )
		end
	end )
	DownTextL:SubscribeToModelThroughElement( self, "down", function ()
		local f15_local0 = self:GetDataSource()
		f15_local0 = f15_local0.down:GetValue( f1_local1 )
		if f15_local0 ~= nil then
			DownTextL:setText( ToUpperCase( f15_local0 ), 0 )
		end
	end )
	self:addElement( DownTextL )
	self.DownTextL = DownTextL
	
	local RightTextL = nil
	
	RightTextL = LUI.UIStyledText.new()
	RightTextL.id = "RightTextL"
	RightTextL:SetFontSize( 19 * _1080p )
	RightTextL:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	RightTextL:SetAlignment( LUI.Alignment.Right )
	RightTextL:SetShadowMinDistance( -0.8, 0 )
	RightTextL:SetShadowMaxDistance( 0.8, 0 )
	RightTextL:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * -400, _1080p * -40, _1080p * -9.5, _1080p * 9.5 )
	RightTextL:SubscribeToModelThroughElement( self, "rightColor", function ()
		local f16_local0 = self:GetDataSource()
		f16_local0 = f16_local0.rightColor:GetValue( f1_local1 )
		if f16_local0 ~= nil then
			RightTextL:SetRGBFromInt( f16_local0, 0 )
		end
	end )
	RightTextL:SubscribeToModelThroughElement( self, "right", function ()
		local f17_local0 = self:GetDataSource()
		f17_local0 = f17_local0.right:GetValue( f1_local1 )
		if f17_local0 ~= nil then
			RightTextL:setText( ToUpperCase( f17_local0 ), 0 )
		end
	end )
	self:addElement( RightTextL )
	self.RightTextL = RightTextL
	
	local LeftTextL = nil
	
	LeftTextL = LUI.UIStyledText.new()
	LeftTextL.id = "LeftTextL"
	LeftTextL:SetFontSize( 19 * _1080p )
	LeftTextL:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	LeftTextL:SetAlignment( LUI.Alignment.Right )
	LeftTextL:SetShadowMinDistance( -0.8, 0 )
	LeftTextL:SetShadowMaxDistance( 0.8, 0 )
	LeftTextL:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * -400, _1080p * -40, _1080p * 43.5, _1080p * 62.5 )
	LeftTextL:SubscribeToModelThroughElement( self, "leftColor", function ()
		local f18_local0 = self:GetDataSource()
		f18_local0 = f18_local0.leftColor:GetValue( f1_local1 )
		if f18_local0 ~= nil then
			LeftTextL:SetRGBFromInt( f18_local0, 0 )
		end
	end )
	LeftTextL:SubscribeToModelThroughElement( self, "left", function ()
		local f19_local0 = self:GetDataSource()
		f19_local0 = f19_local0.left:GetValue( f1_local1 )
		if f19_local0 ~= nil then
			LeftTextL:setText( ToUpperCase( f19_local0 ), 0 )
		end
	end )
	self:addElement( LeftTextL )
	self.LeftTextL = LeftTextL
	
	local ButtonTextL = nil
	
	ButtonTextL = LUI.UIStyledText.new()
	ButtonTextL.id = "ButtonTextL"
	ButtonTextL:SetFontSize( 19 * _1080p )
	ButtonTextL:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ButtonTextL:SetAlignment( LUI.Alignment.Right )
	ButtonTextL:SetShadowMinDistance( -0.8, 0 )
	ButtonTextL:SetShadowMaxDistance( 0.8, 0 )
	ButtonTextL:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -400, _1080p * -40, _1080p * -31, _1080p * -12 )
	ButtonTextL:SubscribeToModelThroughElement( self, "buttonColor", function ()
		local f20_local0 = self:GetDataSource()
		f20_local0 = f20_local0.buttonColor:GetValue( f1_local1 )
		if f20_local0 ~= nil then
			ButtonTextL:SetRGBFromInt( f20_local0, 0 )
		end
	end )
	ButtonTextL:SubscribeToModelThroughElement( self, "button", function ()
		local f21_local0 = self:GetDataSource()
		f21_local0 = f21_local0.button:GetValue( f1_local1 )
		if f21_local0 ~= nil then
			ButtonTextL:setText( ToUpperCase( f21_local0 ), 0 )
		end
	end )
	self:addElement( ButtonTextL )
	self.ButtonTextL = ButtonTextL
	
	local UpArrow = nil
	
	UpArrow = LUI.UIImage.new()
	UpArrow.id = "UpArrow"
	UpArrow:SetAlpha( 0.4, 0 )
	UpArrow:SetZRotation( -90, 0 )
	UpArrow:setImage( RegisterMaterial( "wdg_selection_arrow_left_1" ), 0 )
	UpArrow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 173, _1080p * 200, _1080p * -5, _1080p * 49 )
	self:addElement( UpArrow )
	self.UpArrow = UpArrow
	
	local LeftArrow = nil
	
	LeftArrow = LUI.UIImage.new()
	LeftArrow.id = "LeftArrow"
	LeftArrow:SetAlpha( 0.4, 0 )
	LeftArrow:setImage( RegisterMaterial( "wdg_selection_arrow_left_1" ), 0 )
	LeftArrow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 27, _1080p * 25, _1080p * 79 )
	self:addElement( LeftArrow )
	self.LeftArrow = LeftArrow
	
	local RightArrow = nil
	
	RightArrow = LUI.UIImage.new()
	RightArrow.id = "RightArrow"
	RightArrow:SetAlpha( 0.4, 0 )
	RightArrow:SetZRotation( 180, 0 )
	RightArrow:setImage( RegisterMaterial( "wdg_selection_arrow_left_1" ), 0 )
	RightArrow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 173, _1080p * 200, _1080p * -29, _1080p * 25 )
	self:addElement( RightArrow )
	self.RightArrow = RightArrow
	
	local DownArrow = nil
	
	DownArrow = LUI.UIImage.new()
	DownArrow.id = "DownArrow"
	DownArrow:SetAlpha( 0.4, 0 )
	DownArrow:SetZRotation( 90, 0 )
	DownArrow:setImage( RegisterMaterial( "wdg_selection_arrow_left_1" ), 0 )
	DownArrow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 173, _1080p * 200, _1080p * -78, _1080p * -24 )
	self:addElement( DownArrow )
	self.DownArrow = DownArrow
	
	local Button = nil
	
	Button = LUI.UIImage.new()
	Button.id = "Button"
	Button:SetAlpha( 0.4, 0 )
	Button:setImage( RegisterMaterial( "button_stick_down" ), 0 )
	Button:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 173, _1080p * 237, _1080p * -44, _1080p * -2 )
	self:addElement( Button )
	self.Button = Button
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		UpTextR:RegisterAnimationSequence( "ArrowsOnLeft", {
			{
				function ()
					return self.UpTextR:SetAlpha( 1, 0 )
				end
			}
		} )
		DownTextR:RegisterAnimationSequence( "ArrowsOnLeft", {
			{
				function ()
					return self.DownTextR:SetAlpha( 1, 0 )
				end
			}
		} )
		RightTextR:RegisterAnimationSequence( "ArrowsOnLeft", {
			{
				function ()
					return self.RightTextR:SetAlpha( 1, 0 )
				end
			}
		} )
		LeftTextR:RegisterAnimationSequence( "ArrowsOnLeft", {
			{
				function ()
					return self.LeftTextR:SetAlpha( 1, 0 )
				end
			}
		} )
		ButtonTextR:RegisterAnimationSequence( "ArrowsOnLeft", {
			{
				function ()
					return self.ButtonTextR:SetAlpha( 1, 0 )
				end
			}
		} )
		UpTextL:RegisterAnimationSequence( "ArrowsOnLeft", {
			{
				function ()
					return self.UpTextL:SetAlpha( 0, 0 )
				end
			}
		} )
		DownTextL:RegisterAnimationSequence( "ArrowsOnLeft", {
			{
				function ()
					return self.DownTextL:SetAlpha( 0, 0 )
				end
			}
		} )
		RightTextL:RegisterAnimationSequence( "ArrowsOnLeft", {
			{
				function ()
					return self.RightTextL:SetAlpha( 0, 0 )
				end
			}
		} )
		LeftTextL:RegisterAnimationSequence( "ArrowsOnLeft", {
			{
				function ()
					return self.LeftTextL:SetAlpha( 0, 0 )
				end
			}
		} )
		ButtonTextL:RegisterAnimationSequence( "ArrowsOnLeft", {
			{
				function ()
					return self.ButtonTextL:SetAlpha( 0, 0 )
				end
			}
		} )
		UpArrow:RegisterAnimationSequence( "ArrowsOnLeft", {
			{
				function ()
					return self.UpArrow:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 27, _1080p * -5, _1080p * 49, 0 )
				end
			}
		} )
		LeftArrow:RegisterAnimationSequence( "ArrowsOnLeft", {
			{
				function ()
					return self.LeftArrow:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 27, _1080p * -100, _1080p * -46, 0 )
				end
			}
		} )
		RightArrow:RegisterAnimationSequence( "ArrowsOnLeft", {
			{
				function ()
					return self.RightArrow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 27, _1080p * -27, _1080p * 27, 0 )
				end
			}
		} )
		DownArrow:RegisterAnimationSequence( "ArrowsOnLeft", {
			{
				function ()
					return self.DownArrow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 27, _1080p * -78, _1080p * -24, 0 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "ArrowsOnLeft", {
			{
				function ()
					return self.Button:setImage( RegisterMaterial( "button_stick_down" ), 0 )
				end
			},
			{
				function ()
					return self.Button:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -27, _1080p * 27, _1080p * -42.5, _1080p * -0.5, 0 )
				end
			}
		} )
		self._sequences.ArrowsOnLeft = function ()
			UpTextR:AnimateSequence( "ArrowsOnLeft" )
			DownTextR:AnimateSequence( "ArrowsOnLeft" )
			RightTextR:AnimateSequence( "ArrowsOnLeft" )
			LeftTextR:AnimateSequence( "ArrowsOnLeft" )
			ButtonTextR:AnimateSequence( "ArrowsOnLeft" )
			UpTextL:AnimateSequence( "ArrowsOnLeft" )
			DownTextL:AnimateSequence( "ArrowsOnLeft" )
			RightTextL:AnimateSequence( "ArrowsOnLeft" )
			LeftTextL:AnimateSequence( "ArrowsOnLeft" )
			ButtonTextL:AnimateSequence( "ArrowsOnLeft" )
			UpArrow:AnimateSequence( "ArrowsOnLeft" )
			LeftArrow:AnimateSequence( "ArrowsOnLeft" )
			RightArrow:AnimateSequence( "ArrowsOnLeft" )
			DownArrow:AnimateSequence( "ArrowsOnLeft" )
			Button:AnimateSequence( "ArrowsOnLeft" )
		end
		
		UpTextR:RegisterAnimationSequence( "ArrowsOnRight", {
			{
				function ()
					return self.UpTextR:SetAlpha( 0, 0 )
				end
			}
		} )
		DownTextR:RegisterAnimationSequence( "ArrowsOnRight", {
			{
				function ()
					return self.DownTextR:SetAlpha( 0, 0 )
				end
			}
		} )
		RightTextR:RegisterAnimationSequence( "ArrowsOnRight", {
			{
				function ()
					return self.RightTextR:SetAlpha( 0, 0 )
				end
			}
		} )
		LeftTextR:RegisterAnimationSequence( "ArrowsOnRight", {
			{
				function ()
					return self.LeftTextR:SetAlpha( 0, 0 )
				end
			}
		} )
		ButtonTextR:RegisterAnimationSequence( "ArrowsOnRight", {
			{
				function ()
					return self.ButtonTextR:SetAlpha( 0, 0 )
				end
			}
		} )
		UpTextL:RegisterAnimationSequence( "ArrowsOnRight", {
			{
				function ()
					return self.UpTextL:SetAlpha( 1, 0 )
				end
			}
		} )
		DownTextL:RegisterAnimationSequence( "ArrowsOnRight", {
			{
				function ()
					return self.DownTextL:SetAlpha( 1, 0 )
				end
			}
		} )
		RightTextL:RegisterAnimationSequence( "ArrowsOnRight", {
			{
				function ()
					return self.RightTextL:SetAlpha( 1, 0 )
				end
			}
		} )
		LeftTextL:RegisterAnimationSequence( "ArrowsOnRight", {
			{
				function ()
					return self.LeftTextL:SetAlpha( 1, 0 )
				end
			}
		} )
		ButtonTextL:RegisterAnimationSequence( "ArrowsOnRight", {
			{
				function ()
					return self.ButtonTextL:SetAlpha( 1, 0 )
				end
			}
		} )
		UpArrow:RegisterAnimationSequence( "ArrowsOnRight", {
			{
				function ()
					return self.UpArrow:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -27, 0, _1080p * -5, _1080p * 49, 0 )
				end
			}
		} )
		LeftArrow:RegisterAnimationSequence( "ArrowsOnRight", {
			{
				function ()
					return self.LeftArrow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -27, 0, _1080p * 27, _1080p * 81, 0 )
				end
			}
		} )
		RightArrow:RegisterAnimationSequence( "ArrowsOnRight", {
			{
				function ()
					return self.RightArrow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -27, 0, _1080p * -29, _1080p * 25, 0 )
				end
			}
		} )
		DownArrow:RegisterAnimationSequence( "ArrowsOnRight", {
			{
				function ()
					return self.DownArrow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -27, 0, _1080p * -78, _1080p * -24, 0 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "ArrowsOnRight", {
			{
				function ()
					return self.Button:setImage( RegisterMaterial( "button_stick_down" ), 0 )
				end
			},
			{
				function ()
					return self.Button:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 170, _1080p * 220, _1080p * -45, _1080p * -3, 0 )
				end
			}
		} )
		self._sequences.ArrowsOnRight = function ()
			UpTextR:AnimateSequence( "ArrowsOnRight" )
			DownTextR:AnimateSequence( "ArrowsOnRight" )
			RightTextR:AnimateSequence( "ArrowsOnRight" )
			LeftTextR:AnimateSequence( "ArrowsOnRight" )
			ButtonTextR:AnimateSequence( "ArrowsOnRight" )
			UpTextL:AnimateSequence( "ArrowsOnRight" )
			DownTextL:AnimateSequence( "ArrowsOnRight" )
			RightTextL:AnimateSequence( "ArrowsOnRight" )
			LeftTextL:AnimateSequence( "ArrowsOnRight" )
			ButtonTextL:AnimateSequence( "ArrowsOnRight" )
			UpArrow:AnimateSequence( "ArrowsOnRight" )
			LeftArrow:AnimateSequence( "ArrowsOnRight" )
			RightArrow:AnimateSequence( "ArrowsOnRight" )
			DownArrow:AnimateSequence( "ArrowsOnRight" )
			Button:AnimateSequence( "ArrowsOnRight" )
		end
		
		ButtonTextR:RegisterAnimationSequence( "HideStickButtonPromptsForVita", {
			{
				function ()
					return self.ButtonTextR:SetAlpha( 0, 0 )
				end
			}
		} )
		ButtonTextL:RegisterAnimationSequence( "HideStickButtonPromptsForVita", {
			{
				function ()
					return self.ButtonTextL:SetAlpha( 0, 0 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "HideStickButtonPromptsForVita", {
			{
				function ()
					return self.Button:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideStickButtonPromptsForVita = function ()
			ButtonTextR:AnimateSequence( "HideStickButtonPromptsForVita" )
			ButtonTextL:AnimateSequence( "HideStickButtonPromptsForVita" )
			Button:AnimateSequence( "HideStickButtonPromptsForVita" )
		end
		
		Button:RegisterAnimationSequence( "L3ButtonIconPS4", {
			{
				function ()
					return self.Button:setImage( RegisterMaterial( "button_stick_left_down" ), 0 )
				end
			},
			{
				function ()
					return self.Button:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 164, _1080p * 264, _1080p * -42.5, _1080p * -0.5, 0 )
				end
			}
		} )
		self._sequences.L3ButtonIconPS4 = function ()
			Button:AnimateSequence( "L3ButtonIconPS4" )
		end
		
		Button:RegisterAnimationSequence( "R3ButtonIconPS4", {
			{
				function ()
					return self.Button:setImage( RegisterMaterial( "button_stick_right_down" ), 0 )
				end
			},
			{
				function ()
					return self.Button:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -67, _1080p * 33, _1080p * -42.5, _1080p * -0.5, 0 )
				end
			}
		} )
		self._sequences.R3ButtonIconPS4 = function ()
			Button:AnimateSequence( "R3ButtonIconPS4" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "StickLayoutDirections", StickLayoutDirections )
LockTable( _M )

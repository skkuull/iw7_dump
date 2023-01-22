local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PS4VitaLayout( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "PS4VitaLayout"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ControllerImage = nil
	
	ControllerImage = LUI.UIImage.new()
	ControllerImage.id = "ControllerImage"
	ControllerImage:setImage( RegisterMaterial( "cont_vita" ), 0 )
	ControllerImage:SetUseAA( true )
	ControllerImage:SetBlendMode( BLEND_MODE.addWithAlpha )
	ControllerImage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 603, _1080p * 25, _1080p * 537 )
	self:addElement( ControllerImage )
	self.ControllerImage = ControllerImage
	
	local Arrows = nil
	
	Arrows = LUI.UIImage.new()
	Arrows.id = "Arrows"
	Arrows:SetAlpha( 0.4, 0 )
	Arrows:setImage( RegisterMaterial( "cont_lines_btn_vita" ), 0 )
	Arrows:SetUseAA( true )
	Arrows:SetBlendMode( BLEND_MODE.addWithAlpha )
	Arrows:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -12, _1080p * 602, _1080p * 2, _1080p * 506 )
	self:addElement( Arrows )
	self.Arrows = Arrows
	
	local LeftTrigger = nil
	
	LeftTrigger = LUI.UIStyledText.new()
	LeftTrigger.id = "LeftTrigger"
	LeftTrigger:SetFontSize( 19 * _1080p )
	LeftTrigger:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	LeftTrigger:SetAlignment( LUI.Alignment.Center )
	LeftTrigger:SetShadowMinDistance( -0.8, 0 )
	LeftTrigger:SetShadowMaxDistance( 0.8, 0 )
	LeftTrigger:SetShadowRGBFromInt( 0, 0 )
	LeftTrigger:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -45, _1080p * 235, _1080p * 7, _1080p * 26 )
	LeftTrigger:SubscribeToModelThroughElement( self, "leftTriggerColor", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.leftTriggerColor:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			LeftTrigger:SetRGBFromInt( f2_local0, 0 )
		end
	end )
	LeftTrigger:SubscribeToModelThroughElement( self, "leftTrigger", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.leftTrigger:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			LeftTrigger:setText( ToUpperCase( f3_local0 ), 0 )
		end
	end )
	self:addElement( LeftTrigger )
	self.LeftTrigger = LeftTrigger
	
	local LeftShoulder = nil
	
	LeftShoulder = LUI.UIStyledText.new()
	LeftShoulder.id = "LeftShoulder"
	LeftShoulder:SetFontSize( 19 * _1080p )
	LeftShoulder:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	LeftShoulder:SetAlignment( LUI.Alignment.Right )
	LeftShoulder:SetShadowMinDistance( -0.8, 0 )
	LeftShoulder:SetShadowMaxDistance( 0.8, 0 )
	LeftShoulder:SetShadowRGBFromInt( 0, 0 )
	LeftShoulder:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -159.5, _1080p * 121.5, _1080p * 400, _1080p * 419 )
	LeftShoulder:SubscribeToModelThroughElement( self, "leftShoulderColor", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.leftShoulderColor:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			LeftShoulder:SetRGBFromInt( f4_local0, 0 )
		end
	end )
	LeftShoulder:SubscribeToModelThroughElement( self, "leftShoulder", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.leftShoulder:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			LeftShoulder:setText( ToUpperCase( f5_local0 ), 0 )
		end
	end )
	self:addElement( LeftShoulder )
	self.LeftShoulder = LeftShoulder
	
	local RightTrigger = nil
	
	RightTrigger = LUI.UIStyledText.new()
	RightTrigger.id = "RightTrigger"
	RightTrigger:SetFontSize( 19 * _1080p )
	RightTrigger:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	RightTrigger:SetAlignment( LUI.Alignment.Center )
	RightTrigger:SetShadowMinDistance( -0.8, 0 )
	RightTrigger:SetShadowMaxDistance( 0.8, 0 )
	RightTrigger:SetShadowRGBFromInt( 0, 0 )
	RightTrigger:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 369, _1080p * 649, _1080p * 7, _1080p * 26 )
	RightTrigger:SubscribeToModelThroughElement( self, "rightTriggerColor", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.rightTriggerColor:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			RightTrigger:SetRGBFromInt( f6_local0, 0 )
		end
	end )
	RightTrigger:SubscribeToModelThroughElement( self, "rightTrigger", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.rightTrigger:GetValue( f1_local1 )
		if f7_local0 ~= nil then
			RightTrigger:setText( ToUpperCase( f7_local0 ), 0 )
		end
	end )
	self:addElement( RightTrigger )
	self.RightTrigger = RightTrigger
	
	local RightShoulder = nil
	
	RightShoulder = LUI.UIStyledText.new()
	RightShoulder.id = "RightShoulder"
	RightShoulder:SetFontSize( 19 * _1080p )
	RightShoulder:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	RightShoulder:SetAlignment( LUI.Alignment.Left )
	RightShoulder:SetOptOutRightToLeftAlignmentFlip( true )
	RightShoulder:SetShadowMinDistance( -0.8, 0 )
	RightShoulder:SetShadowMaxDistance( 0.8, 0 )
	RightShoulder:SetShadowRGBFromInt( 0, 0 )
	RightShoulder:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 489, _1080p * 768, _1080p * 400, _1080p * 419 )
	RightShoulder:SubscribeToModelThroughElement( self, "rightShoulderColor", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.rightShoulderColor:GetValue( f1_local1 )
		if f8_local0 ~= nil then
			RightShoulder:SetRGBFromInt( f8_local0, 0 )
		end
	end )
	RightShoulder:SubscribeToModelThroughElement( self, "rightShoulder", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.rightShoulder:GetValue( f1_local1 )
		if f9_local0 ~= nil then
			RightShoulder:setText( ToUpperCase( f9_local0 ), 0 )
		end
	end )
	self:addElement( RightShoulder )
	self.RightShoulder = RightShoulder
	
	local Start = nil
	
	Start = LUI.UIStyledText.new()
	Start.id = "Start"
	Start:SetFontSize( 19 * _1080p )
	Start:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Start:SetAlignment( LUI.Alignment.Left )
	Start:SetOptOutRightToLeftAlignmentFlip( true )
	Start:SetShadowMinDistance( -0.8, 0 )
	Start:SetShadowMaxDistance( 0.8, 0 )
	Start:SetShadowRGBFromInt( 0, 0 )
	Start:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 587.5, _1080p * 747.5, _1080p * 330.34, _1080p * 349.34 )
	Start:SubscribeToModelThroughElement( self, "startColor", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.startColor:GetValue( f1_local1 )
		if f10_local0 ~= nil then
			Start:SetRGBFromInt( f10_local0, 0 )
		end
	end )
	Start:SubscribeToModelThroughElement( self, "start", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.start:GetValue( f1_local1 )
		if f11_local0 ~= nil then
			Start:setText( ToUpperCase( f11_local0 ), 0 )
		end
	end )
	self:addElement( Start )
	self.Start = Start
	
	local Select = nil
	
	Select = LUI.UIStyledText.new()
	Select.id = "Select"
	Select:SetFontSize( 19 * _1080p )
	Select:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Select:SetAlignment( LUI.Alignment.Center )
	Select:SetShadowMinDistance( -0.8, 0 )
	Select:SetShadowMaxDistance( 0.8, 0 )
	Select:SetShadowRGBFromInt( 0, 0 )
	Select:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 213, _1080p * 397, _1080p * 241.34, _1080p * 260.34 )
	Select:SubscribeToModelThroughElement( self, "selectColor", function ()
		local f12_local0 = self:GetDataSource()
		f12_local0 = f12_local0.selectColor:GetValue( f1_local1 )
		if f12_local0 ~= nil then
			Select:SetRGBFromInt( f12_local0, 0 )
		end
	end )
	Select:SubscribeToModelThroughElement( self, "select", function ()
		local f13_local0 = self:GetDataSource()
		f13_local0 = f13_local0.select:GetValue( f1_local1 )
		if f13_local0 ~= nil then
			Select:setText( ToUpperCase( f13_local0 ), 0 )
		end
	end )
	self:addElement( Select )
	self.Select = Select
	
	local RightStick = nil
	
	RightStick = LUI.UIStyledText.new()
	RightStick.id = "RightStick"
	RightStick:SetFontSize( 19 * _1080p )
	RightStick:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	RightStick:SetAlignment( LUI.Alignment.Left )
	RightStick:SetOptOutRightToLeftAlignmentFlip( true )
	RightStick:SetShadowMinDistance( -0.8, 0 )
	RightStick:SetShadowMaxDistance( 0.8, 0 )
	RightStick:SetShadowRGBFromInt( 0, 0 )
	RightStick:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 233.5, _1080p * 607, _1080p * 462, _1080p * 481 )
	RightStick:SubscribeToModelThroughElement( self, "rightStickColor", function ()
		local f14_local0 = self:GetDataSource()
		f14_local0 = f14_local0.rightStickColor:GetValue( f1_local1 )
		if f14_local0 ~= nil then
			RightStick:SetRGBFromInt( f14_local0, 0 )
		end
	end )
	RightStick:SubscribeToModelThroughElement( self, "rightStick", function ()
		local f15_local0 = self:GetDataSource()
		f15_local0 = f15_local0.rightStick:GetValue( f1_local1 )
		if f15_local0 ~= nil then
			RightStick:setText( ToUpperCase( f15_local0 ), 0 )
		end
	end )
	self:addElement( RightStick )
	self.RightStick = RightStick
	
	local LeftStick = nil
	
	LeftStick = LUI.UIStyledText.new()
	LeftStick.id = "LeftStick"
	LeftStick:SetFontSize( 19 * _1080p )
	LeftStick:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	LeftStick:SetAlignment( LUI.Alignment.Right )
	LeftStick:SetShadowMinDistance( -0.8, 0 )
	LeftStick:SetShadowMaxDistance( 0.8, 0 )
	LeftStick:SetShadowRGBFromInt( 0, 0 )
	LeftStick:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -349, _1080p * 10, _1080p * 462, _1080p * 481 )
	LeftStick:SubscribeToModelThroughElement( self, "leftStickColor", function ()
		local f16_local0 = self:GetDataSource()
		f16_local0 = f16_local0.leftStickColor:GetValue( f1_local1 )
		if f16_local0 ~= nil then
			LeftStick:SetRGBFromInt( f16_local0, 0 )
		end
	end )
	LeftStick:SubscribeToModelThroughElement( self, "leftStick", function ()
		local f17_local0 = self:GetDataSource()
		f17_local0 = f17_local0.leftStick:GetValue( f1_local1 )
		if f17_local0 ~= nil then
			LeftStick:setText( ToUpperCase( f17_local0 ), 0 )
		end
	end )
	self:addElement( LeftStick )
	self.LeftStick = LeftStick
	
	local DPad = nil
	
	DPad = LUI.UIStyledText.new()
	DPad.id = "DPad"
	DPad:SetFontSize( 19 * _1080p )
	DPad:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	DPad:SetAlignment( LUI.Alignment.Right )
	DPad:SetShadowMinDistance( -0.8, 0 )
	DPad:SetShadowMaxDistance( 0.8, 0 )
	DPad:SetShadowRGBFromInt( 0, 0 )
	DPad:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -280, _1080p * -12, _1080p * 221.34, _1080p * 240.34 )
	DPad:SubscribeToModelThroughElement( self, "dPadColor", function ()
		local f18_local0 = self:GetDataSource()
		f18_local0 = f18_local0.dPadColor:GetValue( f1_local1 )
		if f18_local0 ~= nil then
			DPad:SetRGBFromInt( f18_local0, 0 )
		end
	end )
	DPad:SubscribeToModelThroughElement( self, "dPad", function ()
		local f19_local0 = self:GetDataSource()
		f19_local0 = f19_local0.dPad:GetValue( f1_local1 )
		if f19_local0 ~= nil then
			DPad:setText( ToUpperCase( f19_local0 ), 0 )
		end
	end )
	self:addElement( DPad )
	self.DPad = DPad
	
	local AltTwo = nil
	
	AltTwo = LUI.UIStyledText.new()
	AltTwo.id = "AltTwo"
	AltTwo:SetFontSize( 19 * _1080p )
	AltTwo:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	AltTwo:SetAlignment( LUI.Alignment.Left )
	AltTwo:SetOptOutRightToLeftAlignmentFlip( true )
	AltTwo:SetShadowMinDistance( -0.8, 0 )
	AltTwo:SetShadowMaxDistance( 0.8, 0 )
	AltTwo:SetShadowRGBFromInt( 0, 0 )
	AltTwo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 600, _1080p * 875, _1080p * 171, _1080p * 190 )
	AltTwo:SubscribeToModelThroughElement( self, "altTwoColor", function ()
		local f20_local0 = self:GetDataSource()
		f20_local0 = f20_local0.altTwoColor:GetValue( f1_local1 )
		if f20_local0 ~= nil then
			AltTwo:SetRGBFromInt( f20_local0, 0 )
		end
	end )
	AltTwo:SubscribeToModelThroughElement( self, "altTwo", function ()
		local f21_local0 = self:GetDataSource()
		f21_local0 = f21_local0.altTwo:GetValue( f1_local1 )
		if f21_local0 ~= nil then
			AltTwo:setText( ToUpperCase( f21_local0 ), 0 )
		end
	end )
	self:addElement( AltTwo )
	self.AltTwo = AltTwo
	
	local Secondary = nil
	
	Secondary = LUI.UIStyledText.new()
	Secondary.id = "Secondary"
	Secondary:SetFontSize( 19 * _1080p )
	Secondary:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Secondary:SetAlignment( LUI.Alignment.Left )
	Secondary:SetOptOutRightToLeftAlignmentFlip( true )
	Secondary:SetShadowMinDistance( -0.8, 0 )
	Secondary:SetShadowMaxDistance( 0.8, 0 )
	Secondary:SetShadowRGBFromInt( 0, 0 )
	Secondary:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 600, _1080p * 875, _1080p * 206, _1080p * 225 )
	Secondary:SubscribeToModelThroughElement( self, "secondaryColor", function ()
		local f22_local0 = self:GetDataSource()
		f22_local0 = f22_local0.secondaryColor:GetValue( f1_local1 )
		if f22_local0 ~= nil then
			Secondary:SetRGBFromInt( f22_local0, 0 )
		end
	end )
	Secondary:SubscribeToModelThroughElement( self, "secondary", function ()
		local f23_local0 = self:GetDataSource()
		f23_local0 = f23_local0.secondary:GetValue( f1_local1 )
		if f23_local0 ~= nil then
			Secondary:setText( ToUpperCase( f23_local0 ), 0 )
		end
	end )
	self:addElement( Secondary )
	self.Secondary = Secondary
	
	local AltOne = nil
	
	AltOne = LUI.UIStyledText.new()
	AltOne.id = "AltOne"
	AltOne:SetFontSize( 19 * _1080p )
	AltOne:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	AltOne:SetAlignment( LUI.Alignment.Left )
	AltOne:SetOptOutRightToLeftAlignmentFlip( true )
	AltOne:SetShadowMinDistance( -0.8, 0 )
	AltOne:SetShadowMaxDistance( 0.8, 0 )
	AltOne:SetShadowRGBFromInt( 0, 0 )
	AltOne:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 600, _1080p * 875, _1080p * 241, _1080p * 260 )
	AltOne:SubscribeToModelThroughElement( self, "altOneColor", function ()
		local f24_local0 = self:GetDataSource()
		f24_local0 = f24_local0.altOneColor:GetValue( f1_local1 )
		if f24_local0 ~= nil then
			AltOne:SetRGBFromInt( f24_local0, 0 )
		end
	end )
	AltOne:SubscribeToModelThroughElement( self, "altOne", function ()
		local f25_local0 = self:GetDataSource()
		f25_local0 = f25_local0.altOne:GetValue( f1_local1 )
		if f25_local0 ~= nil then
			AltOne:setText( ToUpperCase( f25_local0 ), 0 )
		end
	end )
	self:addElement( AltOne )
	self.AltOne = AltOne
	
	local Primary = nil
	
	Primary = LUI.UIStyledText.new()
	Primary.id = "Primary"
	Primary:SetFontSize( 19 * _1080p )
	Primary:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Primary:SetAlignment( LUI.Alignment.Left )
	Primary:SetOptOutRightToLeftAlignmentFlip( true )
	Primary:SetShadowMinDistance( -0.8, 0 )
	Primary:SetShadowMaxDistance( 0.8, 0 )
	Primary:SetShadowRGBFromInt( 0, 0 )
	Primary:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 600, _1080p * 875, _1080p * 276, _1080p * 295 )
	Primary:SubscribeToModelThroughElement( self, "primaryColor", function ()
		local f26_local0 = self:GetDataSource()
		f26_local0 = f26_local0.primaryColor:GetValue( f1_local1 )
		if f26_local0 ~= nil then
			Primary:SetRGBFromInt( f26_local0, 0 )
		end
	end )
	Primary:SubscribeToModelThroughElement( self, "primary", function ()
		local f27_local0 = self:GetDataSource()
		f27_local0 = f27_local0.primary:GetValue( f1_local1 )
		if f27_local0 ~= nil then
			Primary:setText( ToUpperCase( f27_local0 ), 0 )
		end
	end )
	self:addElement( Primary )
	self.Primary = Primary
	
	return self
end

MenuBuilder.registerType( "PS4VitaLayout", PS4VitaLayout )
LockTable( _M )

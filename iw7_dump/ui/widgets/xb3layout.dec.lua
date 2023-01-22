local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function XB3Layout( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "XB3Layout"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ControllerImage = nil
	
	ControllerImage = LUI.UIImage.new()
	ControllerImage.id = "ControllerImage"
	ControllerImage:setImage( RegisterMaterial( "cont" ), 0 )
	ControllerImage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, _1080p * 25.84, _1080p * 537.84 )
	self:addElement( ControllerImage )
	self.ControllerImage = ControllerImage
	
	local Arrows = nil
	
	Arrows = LUI.UIImage.new()
	Arrows.id = "Arrows"
	Arrows:setImage( RegisterMaterial( "cont_lines_btn" ), 0 )
	Arrows:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 512 )
	self:addElement( Arrows )
	self.Arrows = Arrows
	
	local LeftTrigger = nil
	
	LeftTrigger = LUI.UIText.new()
	LeftTrigger.id = "LeftTrigger"
	LeftTrigger:SetFontSize( 19 * _1080p )
	LeftTrigger:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	LeftTrigger:SetAlignment( LUI.Alignment.Center )
	LeftTrigger:SetOptOutRightToLeftAlignmentFlip( true )
	LeftTrigger:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -32.5, _1080p * 279.5, _1080p * 10.84, _1080p * 30.84 )
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
			LeftTrigger:setText( f3_local0, 0 )
		end
	end )
	self:addElement( LeftTrigger )
	self.LeftTrigger = LeftTrigger
	
	local LeftShoulder = nil
	
	LeftShoulder = LUI.UIText.new()
	LeftShoulder.id = "LeftShoulder"
	LeftShoulder:SetFontSize( 18 * _1080p )
	LeftShoulder:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	LeftShoulder:SetAlignment( LUI.Alignment.Right )
	LeftShoulder:SetOptOutRightToLeftAlignmentFlip( true )
	LeftShoulder:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -213.5, _1080p * 87.5, _1080p * 72.34, _1080p * 91.34 )
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
			LeftShoulder:setText( f5_local0, 0 )
		end
	end )
	self:addElement( LeftShoulder )
	self.LeftShoulder = LeftShoulder
	
	local RightTrigger = nil
	
	RightTrigger = LUI.UIText.new()
	RightTrigger.id = "RightTrigger"
	RightTrigger:SetFontSize( 18 * _1080p )
	RightTrigger:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	RightTrigger:SetAlignment( LUI.Alignment.Center )
	RightTrigger:SetOptOutRightToLeftAlignmentFlip( true )
	RightTrigger:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 279.5, _1080p * 509, _1080p * 11.34, _1080p * 30.34 )
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
			RightTrigger:setText( f7_local0, 0 )
		end
	end )
	self:addElement( RightTrigger )
	self.RightTrigger = RightTrigger
	
	local RightShoulder = nil
	
	RightShoulder = LUI.UIText.new()
	RightShoulder.id = "RightShoulder"
	RightShoulder:SetFontSize( 18 * _1080p )
	RightShoulder:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	RightShoulder:SetAlignment( LUI.Alignment.Left )
	RightShoulder:SetOptOutRightToLeftAlignmentFlip( true )
	RightShoulder:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 426, _1080p * 748, _1080p * 72.34, _1080p * 91.34 )
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
			RightShoulder:setText( f9_local0, 0 )
		end
	end )
	self:addElement( RightShoulder )
	self.RightShoulder = RightShoulder
	
	local Start = nil
	
	Start = LUI.UIText.new()
	Start.id = "Start"
	Start:SetFontSize( 18 * _1080p )
	Start:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Start:SetAlignment( LUI.Alignment.Center )
	Start:SetOptOutRightToLeftAlignmentFlip( true )
	Start:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 234.5, _1080p * 384.5, _1080p * 72.84, _1080p * 90.34 )
	Start:SubscribeToModelThroughElement( self, "selectColor", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.selectColor:GetValue( f1_local1 )
		if f10_local0 ~= nil then
			Start:SetRGBFromInt( f10_local0, 0 )
		end
	end )
	Start:SubscribeToModelThroughElement( self, "start", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.start:GetValue( f1_local1 )
		if f11_local0 ~= nil then
			Start:setText( f11_local0, 0 )
		end
	end )
	self:addElement( Start )
	self.Start = Start
	
	local Select = nil
	
	Select = LUI.UIText.new()
	Select.id = "Select"
	Select:SetFontSize( 19 * _1080p )
	Select:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Select:SetAlignment( LUI.Alignment.Center )
	Select:SetOptOutRightToLeftAlignmentFlip( true )
	Select:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 138, _1080p * 309.5, _1080p * 39.34, _1080p * 58.34 )
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
			Select:setText( f13_local0, 0 )
		end
	end )
	self:addElement( Select )
	self.Select = Select
	
	local RightStick = nil
	
	RightStick = LUI.UIText.new()
	RightStick.id = "RightStick"
	RightStick:SetFontSize( 19 * _1080p )
	RightStick:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	RightStick:SetAlignment( LUI.Alignment.Left )
	RightStick:SetOptOutRightToLeftAlignmentFlip( true )
	RightStick:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 284.5, _1080p * 597, _1080p * 479.34, _1080p * 498.34 )
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
			RightStick:setText( f15_local0, 0 )
		end
	end )
	self:addElement( RightStick )
	self.RightStick = RightStick
	
	local LeftStick = nil
	
	LeftStick = LUI.UIText.new()
	LeftStick.id = "LeftStick"
	LeftStick:SetFontSize( 19 * _1080p )
	LeftStick:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	LeftStick:SetAlignment( LUI.Alignment.Right )
	LeftStick:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -73, _1080p * 216, _1080p * 479.34, _1080p * 498.34 )
	LeftStick:SubscribeToModelThroughElement( self, "dPadColor", function ()
		local f16_local0 = self:GetDataSource()
		f16_local0 = f16_local0.dPadColor:GetValue( f1_local1 )
		if f16_local0 ~= nil then
			LeftStick:SetRGBFromInt( f16_local0, 0 )
		end
	end )
	LeftStick:SubscribeToModelThroughElement( self, "dPad", function ()
		local f17_local0 = self:GetDataSource()
		f17_local0 = f17_local0.dPad:GetValue( f1_local1 )
		if f17_local0 ~= nil then
			LeftStick:setText( f17_local0, 0 )
		end
	end )
	self:addElement( LeftStick )
	self.LeftStick = LeftStick
	
	local DPad = nil
	
	DPad = LUI.UIText.new()
	DPad.id = "DPad"
	DPad:SetFontSize( 19 * _1080p )
	DPad:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	DPad:SetAlignment( LUI.Alignment.Right )
	DPad:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -308, _1080p * -5, _1080p * 296.34, _1080p * 315.34 )
	DPad:SubscribeToModelThroughElement( self, "leftStickColor", function ()
		local f18_local0 = self:GetDataSource()
		f18_local0 = f18_local0.leftStickColor:GetValue( f1_local1 )
		if f18_local0 ~= nil then
			DPad:SetRGBFromInt( f18_local0, 0 )
		end
	end )
	DPad:SubscribeToModelThroughElement( self, "leftStick", function ()
		local f19_local0 = self:GetDataSource()
		f19_local0 = f19_local0.leftStick:GetValue( f1_local1 )
		if f19_local0 ~= nil then
			DPad:setText( f19_local0, 0 )
		end
	end )
	self:addElement( DPad )
	self.DPad = DPad
	
	local AltTwo = nil
	
	AltTwo = LUI.UIText.new()
	AltTwo.id = "AltTwo"
	AltTwo:SetFontSize( 18 * _1080p )
	AltTwo:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	AltTwo:SetAlignment( LUI.Alignment.Left )
	AltTwo:SetOptOutRightToLeftAlignmentFlip( true )
	AltTwo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 492, _1080p * 813, _1080p * 237, _1080p * 256 )
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
			AltTwo:setText( f21_local0, 0 )
		end
	end )
	self:addElement( AltTwo )
	self.AltTwo = AltTwo
	
	local Secondary = nil
	
	Secondary = LUI.UIText.new()
	Secondary.id = "Secondary"
	Secondary:SetFontSize( 19 * _1080p )
	Secondary:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Secondary:SetAlignment( LUI.Alignment.Left )
	Secondary:SetOptOutRightToLeftAlignmentFlip( true )
	Secondary:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 492, _1080p * 813, _1080p * 274.84, _1080p * 293.84 )
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
			Secondary:setText( f23_local0, 0 )
		end
	end )
	self:addElement( Secondary )
	self.Secondary = Secondary
	
	local AltOne = nil
	
	AltOne = LUI.UIText.new()
	AltOne.id = "AltOne"
	AltOne:SetFontSize( 19 * _1080p )
	AltOne:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	AltOne:SetAlignment( LUI.Alignment.Left )
	AltOne:SetOptOutRightToLeftAlignmentFlip( true )
	AltOne:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 492, _1080p * 813, _1080p * 317.34, _1080p * 336.34 )
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
			AltOne:setText( f25_local0, 0 )
		end
	end )
	self:addElement( AltOne )
	self.AltOne = AltOne
	
	local Primary = nil
	
	Primary = LUI.UIText.new()
	Primary.id = "Primary"
	Primary:SetFontSize( 19 * _1080p )
	Primary:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Primary:SetAlignment( LUI.Alignment.Left )
	Primary:SetOptOutRightToLeftAlignmentFlip( true )
	Primary:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 492, _1080p * 813, _1080p * 358.34, _1080p * 377.34 )
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
			Primary:setText( f27_local0, 0 )
		end
	end )
	self:addElement( Primary )
	self.Primary = Primary
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Arrows:RegisterAnimationSequence( "XB3", {
			{
				function ()
					return self.Arrows:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4, _1080p * 495, _1080p * -5, _1080p * 507, 0 )
				end
			}
		} )
		LeftShoulder:RegisterAnimationSequence( "XB3", {
			{
				function ()
					return self.LeftShoulder:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -202.5, _1080p * 98.5, _1080p * 74.34, _1080p * 93.34, 0 )
				end
			}
		} )
		RightTrigger:RegisterAnimationSequence( "XB3", {
			{
				function ()
					return self.RightTrigger:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 281.5, _1080p * 511, _1080p * 10.34, _1080p * 29.34, 0 )
				end
			}
		} )
		RightShoulder:RegisterAnimationSequence( "XB3", {
			{
				function ()
					return self.RightShoulder:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 416, _1080p * 738, _1080p * 74.34, _1080p * 93.34, 0 )
				end
			}
		} )
		Start:RegisterAnimationSequence( "XB3", {
			{
				function ()
					return self.Start:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 226.5, _1080p * 376.5, _1080p * 84.84, _1080p * 102.34, 0 )
				end
			}
		} )
		Select:RegisterAnimationSequence( "XB3", {
			{
				function ()
					return self.Select:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 128, _1080p * 299.5, _1080p * 50.34, _1080p * 69.34, 0 )
				end
			}
		} )
		RightStick:RegisterAnimationSequence( "XB3", {
			{
				function ()
					return self.RightStick:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 284.5, _1080p * 597, _1080p * 471.34, _1080p * 490.34, 0 )
				end
			}
		} )
		LeftStick:RegisterAnimationSequence( "XB3", {
			{
				function ()
					return self.LeftStick:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -73, _1080p * 216, _1080p * 471.34, _1080p * 490.34, 0 )
				end
			}
		} )
		DPad:RegisterAnimationSequence( "XB3", {
			{
				function ()
					return self.DPad:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -305, _1080p * -2, _1080p * 296.34, _1080p * 315.34, 0 )
				end
			}
		} )
		AltTwo:RegisterAnimationSequence( "XB3", {
			{
				function ()
					return self.AltTwo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 497, _1080p * 818, _1080p * 255, _1080p * 274, 0 )
				end
			}
		} )
		Secondary:RegisterAnimationSequence( "XB3", {
			{
				function ()
					return self.Secondary:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 497, _1080p * 818, _1080p * 292.84, _1080p * 311.84, 0 )
				end
			}
		} )
		AltOne:RegisterAnimationSequence( "XB3", {
			{
				function ()
					return self.AltOne:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 497, _1080p * 818, _1080p * 335.34, _1080p * 354.34, 0 )
				end
			}
		} )
		Primary:RegisterAnimationSequence( "XB3", {
			{
				function ()
					return self.Primary:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 497, _1080p * 818, _1080p * 376.34, _1080p * 395.34, 0 )
				end
			}
		} )
		self._sequences.XB3 = function ()
			Arrows:AnimateSequence( "XB3" )
			LeftShoulder:AnimateSequence( "XB3" )
			RightTrigger:AnimateSequence( "XB3" )
			RightShoulder:AnimateSequence( "XB3" )
			Start:AnimateSequence( "XB3" )
			Select:AnimateSequence( "XB3" )
			RightStick:AnimateSequence( "XB3" )
			LeftStick:AnimateSequence( "XB3" )
			DPad:AnimateSequence( "XB3" )
			AltTwo:AnimateSequence( "XB3" )
			Secondary:AnimateSequence( "XB3" )
			AltOne:AnimateSequence( "XB3" )
			Primary:AnimateSequence( "XB3" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsXboxOne( self ) then
		ACTIONS.AnimateSequence( self, "XB3" )
	end
	return self
end

MenuBuilder.registerType( "XB3Layout", XB3Layout )
LockTable( _M )

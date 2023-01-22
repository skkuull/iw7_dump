local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ConfirmRigButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 289 * _1080p, 0, 40 * _1080p )
	self.id = "ConfirmRigButton"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:SubscribeToModelThroughElement( self, nil, function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			self:SetButtonDisabled( f2_local0 )
		end
	end )
	local Backer = nil
	
	Backer = LUI.UIImage.new()
	Backer.id = "Backer"
	Backer:SetRGBFromTable( SWATCHES.CAC.greenDark, 0 )
	self:addElement( Backer )
	self.Backer = Backer
	
	local Text = nil
	
	Text = LUI.UIStyledText.new()
	Text.id = "Text"
	Text:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
	Text:setText( ToUpperCase( "Confirm Rig" ), 0 )
	Text:SetFontSize( 30 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Left )
	Text:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 10, _1080p * 289, _1080p * 5, _1080p * -5 )
	self:addElement( Text )
	self.Text = Text
	
	local DisabledSlash = nil
	
	DisabledSlash = LUI.UIImage.new()
	DisabledSlash.id = "DisabledSlash"
	DisabledSlash:SetAlpha( 0, 0 )
	DisabledSlash:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	DisabledSlash:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -22, _1080p * 22, _1080p * -15, _1080p * 15 )
	self:addElement( DisabledSlash )
	self.DisabledSlash = DisabledSlash
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Backer:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Backer:SetRGBFromTable( SWATCHES.CAC.yellowLight, 50 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Text:SetRGBFromInt( 0, 50 )
				end
			}
		} )
		DisabledSlash:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.DisabledSlash:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Backer:AnimateSequence( "ButtonOver" )
			Text:AnimateSequence( "ButtonOver" )
			DisabledSlash:AnimateSequence( "ButtonOver" )
		end
		
		Backer:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Backer:SetRGBFromTable( SWATCHES.CAC.greenDark, 200 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.CAC.greenLight, 200 )
				end
			}
		} )
		DisabledSlash:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.DisabledSlash:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Backer:AnimateSequence( "ButtonUp" )
			Text:AnimateSequence( "ButtonUp" )
			DisabledSlash:AnimateSequence( "ButtonUp" )
		end
		
		Backer:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Backer:SetRGBFromTable( SWATCHES.CAC.yellowLight, 50 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Text:SetRGBFromInt( 0, 50 )
				end
			}
		} )
		DisabledSlash:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.DisabledSlash:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			Backer:AnimateSequence( "ButtonOverDisabled" )
			Text:AnimateSequence( "ButtonOverDisabled" )
			DisabledSlash:AnimateSequence( "ButtonOverDisabled" )
		end
		
		Backer:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Backer:SetRGBFromTable( SWATCHES.CAC.greenDark, 200 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.CAC.greenLight, 200 )
				end
			}
		} )
		DisabledSlash:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.DisabledSlash:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			Backer:AnimateSequence( "ButtonUpDisabled" )
			Text:AnimateSequence( "ButtonUpDisabled" )
			DisabledSlash:AnimateSequence( "ButtonUpDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f21_arg0, f21_arg1 )
		local f21_local0 = f21_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f22_arg0, f22_arg1 )
		local f22_local0 = f22_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_disable", function ( f23_arg0, f23_arg1 )
		local f23_local0 = f23_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUpDisabled" )
	end )
	self:addEventHandler( "button_over_disable", function ( f24_arg0, f24_arg1 )
		local f24_local0 = f24_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
	end )
	return self
end

MenuBuilder.registerType( "ConfirmRigButton", ConfirmRigButton )
LockTable( _M )

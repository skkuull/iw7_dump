local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PlayerAbilityWarning( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 120 * _1080p, 0, 20 * _1080p )
	self.id = "PlayerAbilityWarning"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local WarnginBacker = nil
	
	WarnginBacker = LUI.UIImage.new()
	WarnginBacker.id = "WarnginBacker"
	WarnginBacker:SetRGBFromInt( 0, 0 )
	WarnginBacker:SetAlpha( 0.75, 0 )
	WarnginBacker:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	self:addElement( WarnginBacker )
	self.WarnginBacker = WarnginBacker
	
	local WarningText = nil
	
	WarningText = LUI.UIStyledText.new()
	WarningText.id = "WarningText"
	WarningText:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	WarningText:setText( ToUpperCase( Engine.Localize( "HUD_ABILITY_WARNING" ) ), 0 )
	WarningText:SetFontSize( 16 * _1080p )
	WarningText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WarningText:SetAlignment( LUI.Alignment.Center )
	WarningText:SetStartupDelay( 500 )
	WarningText:SetLineHoldTime( 500 )
	WarningText:SetAnimMoveTime( 500 )
	WarningText:SetEndDelay( 500 )
	WarningText:SetCrossfadeTime( 400 )
	WarningText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	WarningText:SetMaxVisibleLines( 1 )
	WarningText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -35, _1080p * 35, _1080p * -8, _1080p * 8 )
	self:addElement( WarningText )
	self.WarningText = WarningText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		WarningText:RegisterAnimationSequence( "MenuCreated", {
			{
				function ()
					return self.WarningText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.WarningText:SetAlpha( 1, 700 )
				end,
				function ()
					return self.WarningText:SetAlpha( 0, 100 )
				end,
				function ()
					return self.WarningText:SetAlpha( 0, 100 )
				end,
				function ()
					return self.WarningText:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.MenuCreated = function ()
			WarningText:AnimateLoop( "MenuCreated" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "menu_create", function ( f10_arg0, f10_arg1 )
		local f10_local0 = f10_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "MenuCreated" )
	end )
	return self
end

MenuBuilder.registerType( "PlayerAbilityWarning", PlayerAbilityWarning )
LockTable( _M )

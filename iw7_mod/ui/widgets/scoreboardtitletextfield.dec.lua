local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ScoreboardTitleTextField( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 192 * _1080p, 0, 40 * _1080p )
	self.id = "ScoreboardTitleTextField"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Field = nil
	
	Field = LUI.UIStyledText.new()
	Field.id = "Field"
	Field:SetRGBFromTable( SWATCHES.Scoreboard.text, 0 )
	Field:setText( "-", 0 )
	Field:SetFontSize( 18 * _1080p )
	Field:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Field:SetAlignment( LUI.Alignment.Center )
	Field:SetStartupDelay( 1000 )
	Field:SetLineHoldTime( 400 )
	Field:SetAnimMoveTime( 300 )
	Field:SetEndDelay( 1000 )
	Field:SetCrossfadeTime( 500 )
	Field:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Field:SetMaxVisibleLines( 1 )
	Field:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 9, _1080p * -9, _1080p * -9, _1080p * 9 )
	self:addElement( Field )
	self.Field = Field
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Field:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Field:SetRGBFromTable( SWATCHES.Scoreboard.text, 0 )
				end
			},
			{
				function ()
					return self.Field:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Field:AnimateSequence( "ButtonUp" )
		end
		
		Field:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Field:SetRGBFromTable( SWATCHES.Scoreboard.text, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Field:AnimateSequence( "ButtonOver" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f10_arg0, f10_arg1 )
		local f10_local0 = f10_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	return self
end

MenuBuilder.registerType( "ScoreboardTitleTextField", ScoreboardTitleTextField )
LockTable( _M )

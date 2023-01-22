local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if CONDITIONS.IsThirdGameMode( f1_arg0 ) then
		f1_arg0.Field:SetAlignment( LUI.Alignment.Center )
	end
end

function LeaderboardHeaderTextField( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 40 * _1080p )
	self.id = "LeaderboardHeaderTextField"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local ColumnTint = nil
	
	ColumnTint = LUI.UIImage.new()
	ColumnTint.id = "ColumnTint"
	ColumnTint:SetRGBFromInt( 0, 0 )
	ColumnTint:SetAlpha( 0, 0 )
	self:addElement( ColumnTint )
	self.ColumnTint = ColumnTint
	
	local Field = nil
	
	Field = LUI.UIStyledText.new()
	Field.id = "Field"
	Field:setText( "N/A", 0 )
	Field:SetFontSize( 24 * _1080p )
	Field:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Field:SetAlignment( LUI.Alignment.Left )
	Field:SetOptOutRightToLeftAlignmentFlip( true )
	Field:SetStartupDelay( 1000 )
	Field:SetLineHoldTime( 500 )
	Field:SetAnimMoveTime( 500 )
	Field:SetEndDelay( 1000 )
	Field:SetCrossfadeTime( 500 )
	Field:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Field:SetMaxVisibleLines( 1 )
	Field:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 5, _1080p * -5, _1080p * -12, _1080p * 12 )
	self:addElement( Field )
	self.Field = Field
	
	self._animationSets.DefaultAnimationSet = function ()
		Field:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Field:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Field:AnimateSequence( "DefaultSequence" )
		end
		
		Field:RegisterAnimationSequence( "Player", {
			{
				function ()
					return self.Field:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			}
		} )
		self._sequences.Player = function ()
			Field:AnimateSequence( "Player" )
		end
		
		Field:RegisterAnimationSequence( "Highlight", {
			{
				function ()
					return self.Field:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.Highlight = function ()
			Field:AnimateSequence( "Highlight" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "LeaderboardHeaderTextField", LeaderboardHeaderTextField )
LockTable( _M )

local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LeaderboardRankField( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 130 * _1080p, 0, 40 * _1080p )
	self.id = "LeaderboardRankField"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ColumnTint = nil
	
	ColumnTint = LUI.UIImage.new()
	ColumnTint.id = "ColumnTint"
	ColumnTint:SetRGBFromInt( 0, 0 )
	ColumnTint:SetAlpha( 0.15, 0 )
	self:addElement( ColumnTint )
	self.ColumnTint = ColumnTint
	
	local RankIcon = nil
	
	RankIcon = LUI.UIImage.new()
	RankIcon.id = "RankIcon"
	RankIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 9, _1080p * 33, _1080p * -12, _1080p * 12 )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local RankDisplay = nil
	
	RankDisplay = LUI.UIText.new()
	RankDisplay.id = "RankDisplay"
	RankDisplay:setText( "99", 0 )
	RankDisplay:SetFontSize( 24 * _1080p )
	RankDisplay:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RankDisplay:SetAlignment( LUI.Alignment.Left )
	RankDisplay:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 49, _1080p * -13, _1080p * -12, _1080p * 12 )
	self:addElement( RankDisplay )
	self.RankDisplay = RankDisplay
	
	self._animationSets.DefaultAnimationSet = function ()
		RankIcon:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.RankIcon:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		RankDisplay:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.RankDisplay:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			RankIcon:AnimateSequence( "DefaultSequence" )
			RankDisplay:AnimateSequence( "DefaultSequence" )
		end
		
		RankDisplay:RegisterAnimationSequence( "Player", {
			{
				function ()
					return self.RankDisplay:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			}
		} )
		self._sequences.Player = function ()
			RankDisplay:AnimateSequence( "Player" )
		end
		
		RankDisplay:RegisterAnimationSequence( "Highlight", {
			{
				function ()
					return self.RankDisplay:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.Highlight = function ()
			RankDisplay:AnimateSequence( "Highlight" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_up", function ( f10_arg0, f10_arg1 )
		local f10_local0 = f10_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "DefaultSequence" )
	end )
	self:addEventHandler( "button_over", function ( f11_arg0, f11_arg1 )
		local f11_local0 = f11_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Highlight" )
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "LeaderboardRankField", LeaderboardRankField )
LockTable( _M )

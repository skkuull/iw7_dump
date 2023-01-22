local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if IsLanguageArabic() then
		f1_arg0.NextRankIcon:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -230, _1080p * -206, _1080p * -2, _1080p * 22 )
		f1_arg0.NextRankValue:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -204, _1080p * -174, 0, _1080p * 20 )
	end
end

function AARRewardsNextRank( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 20 * _1080p )
	self.id = "AARRewardsNextRank"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local NextRankLabel = nil
	
	NextRankLabel = LUI.UIStyledText.new()
	NextRankLabel.id = "NextRankLabel"
	NextRankLabel:SetRGBFromInt( 16767744, 0 )
	NextRankLabel:setText( Engine.Localize( "MENU_NEW" ), 0 )
	NextRankLabel:SetFontSize( 20 * _1080p )
	NextRankLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	NextRankLabel:SetAlignment( LUI.Alignment.Left )
	NextRankLabel:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 20 )
	self:addElement( NextRankLabel )
	self.NextRankLabel = NextRankLabel
	
	local NextRankIcon = nil
	
	NextRankIcon = LUI.UIImage.new()
	NextRankIcon.id = "NextRankIcon"
	NextRankIcon:setImage( RegisterMaterial( "rank_icon_10" ), 0 )
	NextRankIcon:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -59, _1080p * -35, _1080p * -2, _1080p * 22 )
	self:addElement( NextRankIcon )
	self.NextRankIcon = NextRankIcon
	
	local NextRankValue = nil
	
	NextRankValue = LUI.UIText.new()
	NextRankValue.id = "NextRankValue"
	NextRankValue:SetRGBFromTable( SWATCHES.AAR.featuredRankProgress, 0 )
	NextRankValue:setText( "22", 0 )
	NextRankValue:SetFontSize( 20 * _1080p )
	NextRankValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	NextRankValue:SetAlignment( LUI.Alignment.Right )
	NextRankValue:SetOptOutRightToLeftAlignmentFlip( true )
	NextRankValue:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -34, 0, 0, _1080p * 20 )
	self:addElement( NextRankValue )
	self.NextRankValue = NextRankValue
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		NextRankLabel:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.NextRankLabel:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		NextRankValue:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.NextRankValue:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.CPDefault = function ()
			NextRankLabel:AnimateSequence( "CPDefault" )
			NextRankValue:AnimateSequence( "CPDefault" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPDefault" )
	end
	return self
end

MenuBuilder.registerType( "AARRewardsNextRank", AARRewardsNextRank )
LockTable( _M )

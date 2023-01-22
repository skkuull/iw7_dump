local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LoadoutDraftTeamInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 652 * _1080p, 0, 128 * _1080p )
	self.id = "LoadoutDraftTeamInfo"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TeamLogo = nil
	
	TeamLogo = LUI.UIImage.new()
	TeamLogo.id = "TeamLogo"
	TeamLogo:setImage( RegisterMaterial( "icon_faction_unsa_color" ), 0 )
	TeamLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 524, _1080p * 652, 0, _1080p * 128 )
	self:addElement( TeamLogo )
	self.TeamLogo = TeamLogo
	
	local TeamName = nil
	
	TeamName = LUI.UIText.new()
	TeamName.id = "TeamName"
	TeamName:setText( Engine.Localize( "MENU_FACTION_UNSA_SHORT" ), 0 )
	TeamName:SetFontSize( 48 * _1080p )
	TeamName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TeamName:SetAlignment( LUI.Alignment.Center )
	TeamName:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 452, _1080p * 10, _1080p * 58 )
	self:addElement( TeamName )
	self.TeamName = TeamName
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TeamLogo:RegisterAnimationSequence( "TeamLeft", {
			{
				function ()
					return self.TeamLogo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -128, 0, 0, _1080p * 128, 0 )
				end
			}
		} )
		TeamName:RegisterAnimationSequence( "TeamLeft", {
			{
				function ()
					return self.TeamName:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -200, _1080p * 10, _1080p * 58, 0 )
				end
			}
		} )
		self._sequences.TeamLeft = function ()
			TeamLogo:AnimateSequence( "TeamLeft" )
			TeamName:AnimateSequence( "TeamLeft" )
		end
		
		TeamLogo:RegisterAnimationSequence( "TeamRight", {
			{
				function ()
					return self.TeamLogo:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128, 0 )
				end
			}
		} )
		TeamName:RegisterAnimationSequence( "TeamRight", {
			{
				function ()
					return self.TeamName:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -452, 0, _1080p * 10, _1080p * 58, 0 )
				end
			}
		} )
		self._sequences.TeamRight = function ()
			TeamLogo:AnimateSequence( "TeamRight" )
			TeamName:AnimateSequence( "TeamRight" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "LoadoutDraftTeamInfo", LoadoutDraftTeamInfo )
LockTable( _M )

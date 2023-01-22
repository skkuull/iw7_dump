local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CodCasterTeamIdentityInformationPanel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 366 * _1080p )
	self.id = "CodCasterTeamIdentityInformationPanel"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CodCasterTeam2Information = nil
	
	CodCasterTeam2Information = MenuBuilder.BuildRegisteredType( "CodCasterTeamIdentityInformation", {
		controllerIndex = f1_local1
	} )
	CodCasterTeam2Information.id = "CodCasterTeam2Information"
	CodCasterTeam2Information.TeamColorImage:SetRGBFromTable( SWATCHES.HUD.enemyTeam, 0 )
	CodCasterTeam2Information.TeamNameTitle:setText( Engine.Localize( "CODCASTER_TEAM2_NAME" ), 0 )
	CodCasterTeam2Information.TeamLogoImage:setImage( RegisterMaterial( "icon_faction_sdf_color" ), 0 )
	CodCasterTeam2Information.TeamColorTitle:setText( Engine.Localize( "CODCASTER_TEAM2_COLOR" ), 0 )
	CodCasterTeam2Information.TeamLogoTitle:setText( Engine.Localize( "CODCASTER_TEAM2_LOGO" ), 0 )
	CodCasterTeam2Information:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -144, _1080p * 181, _1080p * 366 )
	self:addElement( CodCasterTeam2Information )
	self.CodCasterTeam2Information = CodCasterTeam2Information
	
	local CodCasterTeam1Information = nil
	
	CodCasterTeam1Information = MenuBuilder.BuildRegisteredType( "CodCasterTeamIdentityInformation", {
		controllerIndex = f1_local1
	} )
	CodCasterTeam1Information.id = "CodCasterTeam1Information"
	CodCasterTeam1Information.TeamNameTitle:setText( Engine.Localize( "CODCASTER_TEAM1_NAME" ), 0 )
	CodCasterTeam1Information.TeamColorTitle:setText( Engine.Localize( "CODCASTER_TEAM1_COLOR" ), 0 )
	CodCasterTeam1Information.TeamLogoTitle:setText( Engine.Localize( "CODCASTER_TEAM1_LOGO" ), 0 )
	CodCasterTeam1Information:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 180 )
	self:addElement( CodCasterTeam1Information )
	self.CodCasterTeam1Information = CodCasterTeam1Information
	
	local CodCasterTeam2Selection = nil
	
	CodCasterTeam2Selection = LUI.UIImage.new()
	CodCasterTeam2Selection.id = "CodCasterTeam2Selection"
	CodCasterTeam2Selection:SetRGBFromInt( 14277081, 0 )
	CodCasterTeam2Selection:SetAlpha( 0, 0 )
	CodCasterTeam2Selection:SetBlendMode( BLEND_MODE.replace )
	CodCasterTeam2Selection:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 219.9, _1080p * 550, _1080p * 285, _1080p * -79.5 )
	self:addElement( CodCasterTeam2Selection )
	self.CodCasterTeam2Selection = CodCasterTeam2Selection
	
	local CodCasterTeam1Selection = nil
	
	CodCasterTeam1Selection = LUI.UIImage.new()
	CodCasterTeam1Selection.id = "CodCasterTeam1Selection"
	CodCasterTeam1Selection:SetRGBFromInt( 14277081, 0 )
	CodCasterTeam1Selection:SetAlpha( 0, 0 )
	CodCasterTeam1Selection:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 219.9, _1080p * 550, _1080p * 104, _1080p * -260.5 )
	self:addElement( CodCasterTeam1Selection )
	self.CodCasterTeam1Selection = CodCasterTeam1Selection
	
	self._animationSets.DefaultAnimationSet = function ()
		CodCasterTeam2Information:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.CodCasterTeam2Information:SetAlpha( 0, 0 )
				end
			}
		} )
		CodCasterTeam1Information:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.CodCasterTeam1Information:SetAlpha( 0, 0 )
				end
			}
		} )
		CodCasterTeam2Selection:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.CodCasterTeam2Selection:SetAlpha( 0, 0 )
				end
			}
		} )
		CodCasterTeam1Selection:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.CodCasterTeam1Selection:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			CodCasterTeam2Information:AnimateSequence( "DefaultSequence" )
			CodCasterTeam1Information:AnimateSequence( "DefaultSequence" )
			CodCasterTeam2Selection:AnimateSequence( "DefaultSequence" )
			CodCasterTeam1Selection:AnimateSequence( "DefaultSequence" )
		end
		
		CodCasterTeam2Information:RegisterAnimationSequence( "ShowBoth", {
			{
				function ()
					return self.CodCasterTeam2Information:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CodCasterTeam2Information:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 456, _1080p * 181, _1080p * 366, 0 )
				end
			}
		} )
		CodCasterTeam1Information:RegisterAnimationSequence( "ShowBoth", {
			{
				function ()
					return self.CodCasterTeam1Information:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CodCasterTeam1Information:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 456, 0, _1080p * 180, 0 )
				end
			}
		} )
		CodCasterTeam2Selection:RegisterAnimationSequence( "ShowBoth", {
			{
				function ()
					return self.CodCasterTeam2Selection:SetAlpha( 0, 0 )
				end
			}
		} )
		CodCasterTeam1Selection:RegisterAnimationSequence( "ShowBoth", {
			{
				function ()
					return self.CodCasterTeam1Selection:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.CodCasterTeam1Selection:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 10, 0, 0, _1080p * -183, 0 )
				end
			}
		} )
		self._sequences.ShowBoth = function ()
			CodCasterTeam2Information:AnimateSequence( "ShowBoth" )
			CodCasterTeam1Information:AnimateSequence( "ShowBoth" )
			CodCasterTeam2Selection:AnimateSequence( "ShowBoth" )
			CodCasterTeam1Selection:AnimateSequence( "ShowBoth" )
		end
		
		CodCasterTeam2Information:RegisterAnimationSequence( "ShowTeam1Only", {
			{
				function ()
					return self.CodCasterTeam2Information:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CodCasterTeam2Information:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 318, _1080p * 181, _1080p * 366, 0 )
				end
			}
		} )
		CodCasterTeam1Information:RegisterAnimationSequence( "ShowTeam1Only", {
			{
				function ()
					return self.CodCasterTeam1Information:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CodCasterTeam1Information:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 456, 0, _1080p * 180, 0 )
				end
			}
		} )
		CodCasterTeam2Selection:RegisterAnimationSequence( "ShowTeam1Only", {
			{
				function ()
					return self.CodCasterTeam2Selection:SetBlendMode( BLEND_MODE.replace )
				end
			},
			{
				function ()
					return self.CodCasterTeam2Selection:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.CodCasterTeam2Selection:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 7, 0, _1080p * 183, 0, 0 )
				end
			}
		} )
		CodCasterTeam1Selection:RegisterAnimationSequence( "ShowTeam1Only", {
			{
				function ()
					return self.CodCasterTeam1Selection:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CodCasterTeam1Selection:SetAlpha( 1, 350, LUI.EASING.inOutCubic )
				end
			},
			{
				function ()
					return self.CodCasterTeam1Selection:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			},
			{
				function ()
					return self.CodCasterTeam1Selection:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 219.9, _1080p * 219.9, _1080p * 104, _1080p * 105.5, 0 )
				end,
				function ()
					return self.CodCasterTeam1Selection:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 219.9, _1080p * 550, _1080p * 104, _1080p * 105.5, 349, LUI.EASING.inOutCubic )
				end
			}
		} )
		self._sequences.ShowTeam1Only = function ()
			CodCasterTeam2Information:AnimateSequence( "ShowTeam1Only" )
			CodCasterTeam1Information:AnimateSequence( "ShowTeam1Only" )
			CodCasterTeam2Selection:AnimateSequence( "ShowTeam1Only" )
			CodCasterTeam1Selection:AnimateSequence( "ShowTeam1Only" )
		end
		
		CodCasterTeam2Information:RegisterAnimationSequence( "ShowTeam2Only", {
			{
				function ()
					return self.CodCasterTeam2Information:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CodCasterTeam2Information:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 456, _1080p * 181, _1080p * 366, 0 )
				end
			}
		} )
		CodCasterTeam1Information:RegisterAnimationSequence( "ShowTeam2Only", {
			{
				function ()
					return self.CodCasterTeam1Information:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CodCasterTeam1Information:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 456, 0, _1080p * 180, 0 )
				end
			}
		} )
		CodCasterTeam2Selection:RegisterAnimationSequence( "ShowTeam2Only", {
			{
				function ()
					return self.CodCasterTeam2Selection:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CodCasterTeam2Selection:SetAlpha( 1, 350, LUI.EASING.inOutCubic )
				end
			},
			{
				function ()
					return self.CodCasterTeam2Selection:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			},
			{
				function ()
					return self.CodCasterTeam2Selection:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 219.9, _1080p * 219.9, _1080p * 285, _1080p * 286.5, 0 )
				end,
				function ()
					return self.CodCasterTeam2Selection:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 219.9, _1080p * 550, _1080p * 285, _1080p * 286.5, 349, LUI.EASING.inOutCubic )
				end
			}
		} )
		CodCasterTeam1Selection:RegisterAnimationSequence( "ShowTeam2Only", {
			{
				function ()
					return self.CodCasterTeam1Selection:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ShowTeam2Only = function ()
			CodCasterTeam2Information:AnimateSequence( "ShowTeam2Only" )
			CodCasterTeam1Information:AnimateSequence( "ShowTeam2Only" )
			CodCasterTeam2Selection:AnimateSequence( "ShowTeam2Only" )
			CodCasterTeam1Selection:AnimateSequence( "ShowTeam2Only" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "CodCasterTeamIdentityInformationPanel", CodCasterTeamIdentityInformationPanel )
LockTable( _M )

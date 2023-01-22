local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MissionTeamProgressBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 250 * _1080p, 0, 100 * _1080p )
	self.id = "MissionTeamProgressBar"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local MaxLeveL = nil
	
	MaxLeveL = LUI.UIStyledText.new()
	MaxLeveL.id = "MaxLeveL"
	MaxLeveL:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MAX_RANK" ) ), 0 )
	MaxLeveL:SetFontSize( 16 * _1080p )
	MaxLeveL:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MaxLeveL:SetAlignment( LUI.Alignment.Left )
	MaxLeveL:SetStartupDelay( 1000 )
	MaxLeveL:SetLineHoldTime( 400 )
	MaxLeveL:SetAnimMoveTime( 150 )
	MaxLeveL:SetEndDelay( 1000 )
	MaxLeveL:SetCrossfadeTime( 400 )
	MaxLeveL:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	MaxLeveL:SetMaxVisibleLines( 1 )
	MaxLeveL:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 4, _1080p * 86, _1080p * 46.75, _1080p * 63.25 )
	self:addElement( MaxLeveL )
	self.MaxLeveL = MaxLeveL
	
	local LevelLabel = nil
	
	LevelLabel = LUI.UIText.new()
	LevelLabel.id = "LevelLabel"
	LevelLabel:setText( Engine.Localize( "LUA_MENU_RANK_CAPS" ), 0 )
	LevelLabel:SetFontSize( 20 * _1080p )
	LevelLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LevelLabel:SetAlignment( LUI.Alignment.Left )
	LevelLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 3, _1080p * -8, _1080p * 17, _1080p * 37 )
	self:addElement( LevelLabel )
	self.LevelLabel = LevelLabel
	
	local black = nil
	
	black = LUI.UIImage.new()
	black.id = "black"
	black:SetRGBFromInt( 0, 0 )
	black:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 43, _1080p * -23 )
	self:addElement( black )
	self.black = black
	
	local f1_local6 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f1_local6 = LUI.UIImage.new()
		f1_local6.id = "left"
		f1_local6:setImage( RegisterMaterial( "challenges_progress_hori_bg_left" ), 0 )
		f1_local6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -8, _1080p * 16, _1080p * 37, _1080p * 73 )
		self:addElement( f1_local6 )
		self.left = f1_local6
	end
	local f1_local7 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f1_local7 = LUI.UIImage.new()
		f1_local7.id = "center"
		f1_local7:setImage( RegisterMaterial( "challenges_progress_hori_bg_center" ), 0 )
		f1_local7:SetBlendMode( BLEND_MODE.blend )
		f1_local7:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, _1080p * -18, _1080p * 37, _1080p * 73 )
		self:addElement( f1_local7 )
		self.center = f1_local7
	end
	local f1_local8 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f1_local8 = LUI.UIImage.new()
		f1_local8.id = "right"
		f1_local8:setImage( RegisterMaterial( "challenges_progress_hori_bg_right" ), 0 )
		f1_local8:SetBlendMode( BLEND_MODE.blend )
		f1_local8:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -18, _1080p * 6, _1080p * 37, _1080p * 73 )
		self:addElement( f1_local8 )
		self.right = f1_local8
	end
	local f1_local9 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f1_local9 = LUI.UIImage.new()
		f1_local9.id = "Fill"
		f1_local9:setImage( RegisterMaterial( "challenges_progress_hori_center" ), 0 )
		f1_local9:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 8, _1080p * -8, _1080p * 38, _1080p * 74 )
		self:addElement( f1_local9 )
		self.Fill = f1_local9
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LevelLabel:RegisterAnimationSequence( "CommanderRankLevelColor", {
			{
				function ()
					return self.LevelLabel:SetRGBFromInt( 16752128, 0 )
				end
			}
		} )
		self._sequences.CommanderRankLevelColor = function ()
			LevelLabel:AnimateSequence( "CommanderRankLevelColor" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "MissionTeamProgressBar", MissionTeamProgressBar )
LockTable( _M )

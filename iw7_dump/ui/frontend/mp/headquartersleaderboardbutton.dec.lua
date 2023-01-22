local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HeadquartersLeaderboardButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 498 * _1080p, 0, 250 * _1080p )
	self.id = "HeadquartersLeaderboardButton"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local GenericItemBackground = nil
	
	GenericItemBackground = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f1_local1
	} )
	GenericItemBackground.id = "GenericItemBackground"
	GenericItemBackground:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 496.9, _1080p * 24, _1080p * 248.6 )
	self:addElement( GenericItemBackground )
	self.GenericItemBackground = GenericItemBackground
	
	local f1_local4 = nil
	if CONDITIONS.IsLeaderboardsKillswitched( self ) then
		f1_local4 = MenuBuilder.BuildRegisteredType( "HeadquartersLeaderboardComingSoon", {
			controllerIndex = f1_local1
		} )
		f1_local4.id = "HeadquartersLeaderboardComingSoon"
		f1_local4:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 22.6, 0 )
		self:addElement( f1_local4 )
		self.HeadquartersLeaderboardComingSoon = f1_local4
	end
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f1_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 494.9, _1080p * 24, _1080p * 248.6 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local TitleBackground = nil
	
	TitleBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f1_local1
	} )
	TitleBackground.id = "TitleBackground"
	TitleBackground.DropShadow:SetAlpha( 0, 0 )
	TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -3.1, 0, _1080p * 24 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_LEADERBOARD" ) ), 0 )
	Title:SetFontSize( 19 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 9, _1080p * 486.9, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( Title )
	self.Title = Title
	
	local f1_local8 = nil
	if not CONDITIONS.IsLeaderboardsKillswitched( self ) then
		f1_local8 = LUI.UIImage.new()
		f1_local8.id = "TrophyIcon"
		f1_local8:setImage( RegisterMaterial( "icon_barracks_trophy" ), 0 )
		f1_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 160.45, _1080p * 334.45, _1080p * 49.3, _1080p * 223.3 )
		self:addElement( f1_local8 )
		self.TrophyIcon = f1_local8
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Title:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Title:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Title:AnimateSequence( "ButtonOver" )
		end
		
		Title:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Title:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Title:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f8_arg0, f8_arg1 )
		local f8_local0 = f8_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	return self
end

MenuBuilder.registerType( "HeadquartersLeaderboardButton", HeadquartersLeaderboardButton )
LockTable( _M )

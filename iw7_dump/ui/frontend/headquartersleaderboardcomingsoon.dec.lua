local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HeadquartersLeaderboardComingSoon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 226 * _1080p )
	self.id = "HeadquartersLeaderboardComingSoon"
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
	GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( GenericItemBackground )
	self.GenericItemBackground = GenericItemBackground
	
	local OuterDiamond = nil
	
	OuterDiamond = LUI.UIImage.new()
	OuterDiamond.id = "OuterDiamond"
	OuterDiamond:SetAlpha( 0.1, 0 )
	OuterDiamond:SetZRotation( 45, 0 )
	OuterDiamond:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 186, _1080p * 314, _1080p * 49, _1080p * 177 )
	self:addElement( OuterDiamond )
	self.OuterDiamond = OuterDiamond
	
	local InnerDiamond = nil
	
	InnerDiamond = LUI.UIImage.new()
	InnerDiamond.id = "InnerDiamond"
	InnerDiamond:SetAlpha( 0.1, 0 )
	InnerDiamond:SetZRotation( 45, 0 )
	InnerDiamond:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -36, _1080p * 36, _1080p * -36, _1080p * 36 )
	self:addElement( InnerDiamond )
	self.InnerDiamond = InnerDiamond
	
	local Bar = nil
	
	Bar = LUI.UIImage.new()
	Bar.id = "Bar"
	Bar:SetRGBFromTable( SWATCHES.genericMenu.blackBackground, 0 )
	Bar:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -30.51, _1080p * 30 )
	self:addElement( Bar )
	self.Bar = Bar
	
	local ComingsoonLabel = nil
	
	ComingsoonLabel = LUI.UIText.new()
	ComingsoonLabel.id = "ComingsoonLabel"
	ComingsoonLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_STORE_COMING_SOON" ) ), 0 )
	ComingsoonLabel:SetFontSize( 36 * _1080p )
	ComingsoonLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ComingsoonLabel:SetAlignment( LUI.Alignment.Center )
	ComingsoonLabel:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 95, _1080p * -95 )
	self:addElement( ComingsoonLabel )
	self.ComingsoonLabel = ComingsoonLabel
	
	local TopLine = nil
	
	TopLine = LUI.UIImage.new()
	TopLine.id = "TopLine"
	TopLine:SetRGBFromInt( 16775056, 0 )
	TopLine:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 90, _1080p * 92 )
	self:addElement( TopLine )
	self.TopLine = TopLine
	
	local BottomLine = nil
	
	BottomLine = LUI.UIImage.new()
	BottomLine.id = "BottomLine"
	BottomLine:SetRGBFromInt( 16775056, 0 )
	BottomLine:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -92, _1080p * -90 )
	self:addElement( BottomLine )
	self.BottomLine = BottomLine
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TopLine:RegisterAnimationSequence( "IsThirdGameMode", {
			{
				function ()
					return self.TopLine:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			}
		} )
		BottomLine:RegisterAnimationSequence( "IsThirdGameMode", {
			{
				function ()
					return self.BottomLine:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			}
		} )
		self._sequences.IsThirdGameMode = function ()
			TopLine:AnimateSequence( "IsThirdGameMode" )
			BottomLine:AnimateSequence( "IsThirdGameMode" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "IsThirdGameMode" )
	end
	return self
end

MenuBuilder.registerType( "HeadquartersLeaderboardComingSoon", HeadquartersLeaderboardComingSoon )
LockTable( _M )

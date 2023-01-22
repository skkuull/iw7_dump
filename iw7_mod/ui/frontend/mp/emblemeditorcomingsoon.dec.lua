local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function EmblemEditorComingsoon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1220 * _1080p, 0, 653 * _1080p )
	self.id = "EmblemEditorComingsoon"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BgImage = nil
	
	BgImage = LUI.UIImage.new()
	BgImage.id = "BgImage"
	BgImage:SetRGBFromTable( SWATCHES.genericMenu.blackBackground, 0 )
	BgImage:SetAlpha( 0.75, 0 )
	BgImage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1220, 0, _1080p * 659.5 )
	self:addElement( BgImage )
	self.BgImage = BgImage
	
	local OuterDiamond = nil
	
	OuterDiamond = LUI.UIImage.new()
	OuterDiamond.id = "OuterDiamond"
	OuterDiamond:SetAlpha( 0.1, 0 )
	OuterDiamond:SetZRotation( 45, 0 )
	OuterDiamond:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -200, _1080p * 200, _1080p * -200, _1080p * 200 )
	self:addElement( OuterDiamond )
	self.OuterDiamond = OuterDiamond
	
	local InnerDiamond = nil
	
	InnerDiamond = LUI.UIImage.new()
	InnerDiamond.id = "InnerDiamond"
	InnerDiamond:SetAlpha( 0.1, 0 )
	InnerDiamond:SetZRotation( 45, 0 )
	InnerDiamond:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -120, _1080p * 120, _1080p * -120, _1080p * 120 )
	self:addElement( InnerDiamond )
	self.InnerDiamond = InnerDiamond
	
	local CenterBar = nil
	
	CenterBar = LUI.UIImage.new()
	CenterBar.id = "CenterBar"
	CenterBar:SetRGBFromTable( SWATCHES.genericMenu.blackBackground, 0 )
	CenterBar:SetAlpha( 0.8, 0 )
	CenterBar:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -70, _1080p * 70 )
	self:addElement( CenterBar )
	self.CenterBar = CenterBar
	
	local ComingSoonLabel = nil
	
	ComingSoonLabel = LUI.UIStyledText.new()
	ComingSoonLabel.id = "ComingSoonLabel"
	ComingSoonLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_STORE_COMING_SOON" ) ), 0 )
	ComingSoonLabel:SetFontSize( 86 * _1080p )
	ComingSoonLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ComingSoonLabel:SetAlignment( LUI.Alignment.Center )
	ComingSoonLabel:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1210, _1080p * 287.5, _1080p * 373.5 )
	self:addElement( ComingSoonLabel )
	self.ComingSoonLabel = ComingSoonLabel
	
	local TopLine = nil
	
	TopLine = LUI.UIImage.new()
	TopLine.id = "TopLine"
	TopLine:SetRGBFromInt( 16775056, 0 )
	TopLine:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 280, _1080p * 282 )
	self:addElement( TopLine )
	self.TopLine = TopLine
	
	local BottomLine = nil
	
	BottomLine = LUI.UIImage.new()
	BottomLine.id = "BottomLine"
	BottomLine:SetRGBFromInt( 16775056, 0 )
	BottomLine:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -282, _1080p * -280 )
	self:addElement( BottomLine )
	self.BottomLine = BottomLine
	
	local TicUR = nil
	
	TicUR = LUI.UIImage.new()
	TicUR.id = "TicUR"
	TicUR:SetAlpha( 0.8, 0 )
	TicUR:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -15, _1080p * -1, _1080p * 1, _1080p * 4 )
	self:addElement( TicUR )
	self.TicUR = TicUR
	
	local TicUL = nil
	
	TicUL = LUI.UIImage.new()
	TicUL.id = "TicUL"
	TicUL:SetAlpha( 0.8, 0 )
	TicUL:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1, _1080p * 15, _1080p * 1, _1080p * 4 )
	self:addElement( TicUL )
	self.TicUL = TicUL
	
	local TicBL = nil
	
	TicBL = LUI.UIImage.new()
	TicBL.id = "TicBL"
	TicBL:SetAlpha( 0.8, 0 )
	TicBL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1, _1080p * 15, _1080p * -10, _1080p * -6 )
	self:addElement( TicBL )
	self.TicBL = TicBL
	
	local TicBR = nil
	
	TicBR = LUI.UIImage.new()
	TicBR.id = "TicBR"
	TicBR:SetAlpha( 0.8, 0 )
	TicBR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -15, _1080p * -1, _1080p * -10, _1080p * -6 )
	self:addElement( TicBR )
	self.TicBR = TicBR
	
	self._animationSets.DefaultAnimationSet = function ()
		TopLine:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TopLine:SetRGBFromInt( 16775056, 0 )
				end
			}
		} )
		BottomLine:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.BottomLine:SetRGBFromInt( 16775056, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			TopLine:AnimateSequence( "DefaultSequence" )
			BottomLine:AnimateSequence( "DefaultSequence" )
		end
		
		TopLine:RegisterAnimationSequence( "ThirdGameMode", {
			{
				function ()
					return self.TopLine:SetRGBFromTable( SWATCHES.Zombies.PrimaryColor, 0 )
				end
			}
		} )
		BottomLine:RegisterAnimationSequence( "ThirdGameMode", {
			{
				function ()
					return self.BottomLine:SetRGBFromTable( SWATCHES.Zombies.PrimaryColor, 0 )
				end
			}
		} )
		self._sequences.ThirdGameMode = function ()
			TopLine:AnimateSequence( "ThirdGameMode" )
			BottomLine:AnimateSequence( "ThirdGameMode" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	BottomLine:addEventHandler( "menu_create", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg1.controller or f1_local1
		if CONDITIONS.IsThirdGameMode( self ) then
			ACTIONS.AnimateSequence( self, "ThirdGameMode" )
		end
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "EmblemEditorComingsoon", EmblemEditorComingsoon )
LockTable( _M )

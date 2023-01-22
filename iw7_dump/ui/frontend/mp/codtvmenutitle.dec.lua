local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CODTvMenuTitle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 960 * _1080p, 0, 80 * _1080p )
	self.id = "CODTvMenuTitle"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f1_local3 = LUI.UIImage.new()
		f1_local3.id = "MPBackerImage"
		f1_local3:setImage( RegisterMaterial( "menu_header" ), 0 )
		f1_local3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -19, _1080p * 1005, _1080p * -1.5, _1080p * 126.5 )
		self:addElement( f1_local3 )
		self.MPBackerImage = f1_local3
	end
	local f1_local4 = nil
	if not CONDITIONS.IsCoreMultiplayer( self ) then
		f1_local4 = LUI.UIImage.new()
		f1_local4.id = "Darkener"
		f1_local4:SetRGBFromInt( 0, 0 )
		f1_local4:setImage( RegisterMaterial( "menu_title_darkener" ), 0 )
		f1_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -105, _1080p * 655, _1080p * -54, _1080p * 326 )
		self:addElement( f1_local4 )
		self.Darkener = f1_local4
	end
	local f1_local5 = nil
	if Engine.IsAliensMode() and CONDITIONS.IsThirdGameMode( self ) then
		f1_local5 = LUI.UIImage.new()
		f1_local5.id = "Gradient"
		f1_local5:SetAlpha( 0, 0 )
		f1_local5:setImage( RegisterMaterial( "cp_wepbuild_gradient_banner_1" ), 0 )
		f1_local5:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -95, 0, 0, 0 )
		self:addElement( f1_local5 )
		self.Gradient = f1_local5
	end
	local MenuBreadcrumbs = nil
	
	MenuBreadcrumbs = LUI.UIStyledText.new()
	MenuBreadcrumbs.id = "MenuBreadcrumbs"
	MenuBreadcrumbs:setText( "", 0 )
	MenuBreadcrumbs:SetFontSize( 16 * _1080p )
	MenuBreadcrumbs:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MenuBreadcrumbs:SetAlignment( LUI.Alignment.Left )
	MenuBreadcrumbs:SetOptOutRightToLeftAlignmentFlip( true )
	MenuBreadcrumbs:SetDecodeLetterLength( 20 )
	MenuBreadcrumbs:SetDecodeMaxRandChars( 6 )
	MenuBreadcrumbs:SetDecodeUpdatesPerLetter( 4 )
	MenuBreadcrumbs:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 94, _1080p * -304, 0, _1080p * 16 )
	self:addElement( MenuBreadcrumbs )
	self.MenuBreadcrumbs = MenuBreadcrumbs
	
	local Divider = nil
	
	Divider = LUI.UIImage.new()
	Divider.id = "Divider"
	Divider:SetAlpha( 0.8, 0 )
	Divider:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	Divider:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 90, _1080p * 490, _1080p * 16, _1080p * 17 )
	self:addElement( Divider )
	self.Divider = Divider
	
	local TicBR = nil
	
	TicBR = LUI.UIImage.new()
	TicBR.id = "TicBR"
	TicBR:SetAlpha( 0.8, 0 )
	TicBR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 482, _1080p * 492, _1080p * 68, _1080p * 70 )
	self:addElement( TicBR )
	self.TicBR = TicBR
	
	local TicuR = nil
	
	TicuR = LUI.UIImage.new()
	TicuR.id = "TicuR"
	TicuR:SetAlpha( 0.8, 0 )
	TicuR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 482, _1080p * 492, _1080p * -4.5, _1080p * -2.5 )
	self:addElement( TicuR )
	self.TicuR = TicuR
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:SetAlpha( 0.8, 0 )
	Title:setText( Engine.Localize( "CODTV_COD_ON_MLGTV" ), 0 )
	Title:SetFontSize( 50 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 94, _1080p * 949, _1080p * 19, _1080p * 69 )
	self:addElement( Title )
	self.Title = Title
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local3:RegisterAnimationSequence( "MPSetup", {
				{
					function ()
						return self.MPBackerImage:SetAlpha( 1, 0 )
					end
				},
				{
					function ()
						return self.MPBackerImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -19, _1080p * 1164, _1080p * -1.5, _1080p * 126.5, 0 )
					end
				}
			} )
		end
		MenuBreadcrumbs:RegisterAnimationSequence( "MPSetup", {
			{
				function ()
					return self.MenuBreadcrumbs:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 8, _1080p * -395, 0, _1080p * 16, 0 )
				end
			}
		} )
		Divider:RegisterAnimationSequence( "MPSetup", {
			{
				function ()
					return self.Divider:SetAlpha( 0, 0 )
				end
			}
		} )
		TicBR:RegisterAnimationSequence( "MPSetup", {
			{
				function ()
					return self.TicBR:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TicBR:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		TicuR:RegisterAnimationSequence( "MPSetup", {
			{
				function ()
					return self.TicuR:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TicuR:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Title:RegisterAnimationSequence( "MPSetup", {
			{
				function ()
					return self.Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 929, _1080p * 18, _1080p * 68, 0 )
				end
			}
		} )
		self._sequences.MPSetup = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local3:AnimateSequence( "MPSetup" )
			end
			MenuBreadcrumbs:AnimateSequence( "MPSetup" )
			Divider:AnimateSequence( "MPSetup" )
			TicBR:AnimateSequence( "MPSetup" )
			TicuR:AnimateSequence( "MPSetup" )
			Title:AnimateSequence( "MPSetup" )
		end
		
	end
	
	self._animationSets.CP = function ()
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local3:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.MPBackerImage:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsAliensMode() and CONDITIONS.IsThirdGameMode( self ) then
			f1_local5:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.Gradient:SetAlpha( 0.3, 0 )
					end
				}
			} )
		end
		MenuBreadcrumbs:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.MenuBreadcrumbs:SetAlpha( 0, 0 )
				end
			}
		} )
		Divider:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Divider:SetAlpha( 0, 0 )
				end
			}
		} )
		TicBR:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TicBR:SetAlpha( 0, 0 )
				end
			}
		} )
		TicuR:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TicuR:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local3:AnimateSequence( "DefaultSequence" )
			end
			if Engine.IsAliensMode() and CONDITIONS.IsThirdGameMode( self ) then
				f1_local5:AnimateSequence( "DefaultSequence" )
			end
			MenuBreadcrumbs:AnimateSequence( "DefaultSequence" )
			Divider:AnimateSequence( "DefaultSequence" )
			TicBR:AnimateSequence( "DefaultSequence" )
			TicuR:AnimateSequence( "DefaultSequence" )
		end
		
		self._sequences.Flicker = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsMultiplayer( self ) then
		ACTIONS.AnimateSequence( self, "MPSetup" )
		ACTIONS.PlaySoundSetSound( self, "menuDecode", false )
	end
	return self
end

MenuBuilder.registerType( "CODTvMenuTitle", CODTvMenuTitle )
LockTable( _M )

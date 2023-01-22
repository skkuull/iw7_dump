local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HackControlGrid( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "HackControlGrid"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local PixelGrid1 = nil
	
	PixelGrid1 = LUI.UIImage.new()
	PixelGrid1.id = "PixelGrid1"
	PixelGrid1:SetAlpha( 0.5, 0 )
	PixelGrid1:setImage( RegisterMaterial( "hud_pixel_grid_glitch" ), 0 )
	PixelGrid1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 960, 0, _1080p * 540 )
	self:addElement( PixelGrid1 )
	self.PixelGrid1 = PixelGrid1
	
	local PixelGrid2 = nil
	
	PixelGrid2 = LUI.UIImage.new()
	PixelGrid2.id = "PixelGrid2"
	PixelGrid2:SetAlpha( 0.5, 0 )
	PixelGrid2:setImage( RegisterMaterial( "hud_pixel_grid_glitch" ), 0 )
	PixelGrid2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -960, 0, 0, _1080p * 540 )
	self:addElement( PixelGrid2 )
	self.PixelGrid2 = PixelGrid2
	
	local PixelGrid3 = nil
	
	PixelGrid3 = LUI.UIImage.new()
	PixelGrid3.id = "PixelGrid3"
	PixelGrid3:SetAlpha( 0.5, 0 )
	PixelGrid3:setImage( RegisterMaterial( "hud_pixel_grid_glitch" ), 0 )
	PixelGrid3:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 960, _1080p * -540, 0 )
	self:addElement( PixelGrid3 )
	self.PixelGrid3 = PixelGrid3
	
	local PixelGrid4 = nil
	
	PixelGrid4 = LUI.UIImage.new()
	PixelGrid4.id = "PixelGrid4"
	PixelGrid4:SetAlpha( 0.5, 0 )
	PixelGrid4:setImage( RegisterMaterial( "hud_pixel_grid_glitch" ), 0 )
	PixelGrid4:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -960, 0, _1080p * -540, 0 )
	self:addElement( PixelGrid4 )
	self.PixelGrid4 = PixelGrid4
	
	local f1_local7 = nil
	if not Engine.IsMultiplayer() then
		f1_local7 = LUI.UIImage.new()
		f1_local7.id = "PrintoutFrame"
		f1_local7:SetAlpha( 0.4, 0 )
		f1_local7:setImage( RegisterMaterial( "hud_robot_hack_output_frame" ), 0 )
		f1_local7:SetBlendMode( BLEND_MODE.addWithAlpha )
		f1_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 186, _1080p * 698, _1080p * 338, _1080p * 535 )
		self:addElement( f1_local7 )
		self.PrintoutFrame = f1_local7
	end
	local f1_local8 = nil
	if not Engine.IsMultiplayer() then
		f1_local8 = MenuBuilder.BuildRegisteredType( "ChyronBlock", {
			sourceFile = "sp/c8chyrontext.csv",
			linesPerBlock = 8,
			textLineDelay = 1000,
			textFont = FONTS.GetFont( FONTS.MainBold.File ),
			textHeight = 12,
			chyronLetterSpeed = 30,
			chyronRandDhars = 3,
			chyronUpdatesPerLetter = 4,
			maxCharsPerLine = 100,
			controllerIndex = f1_local1
		} )
		f1_local8.id = "PrintoutC8"
		f1_local8:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
		f1_local8:SetAlpha( 0, 0 )
		f1_local8:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f1_local8:SetFontSize( 12 * _1080p )
		f1_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 216, _1080p * 691, _1080p * 360, _1080p * 521 )
		self:addElement( f1_local8 )
		self.PrintoutC8 = f1_local8
	end
	local f1_local9 = nil
	if not Engine.IsMultiplayer() then
		f1_local9 = MenuBuilder.BuildRegisteredType( "ChyronBlock", {
			sourceFile = "sp/c6chyrontext.csv",
			linesPerBlock = 8,
			textLineDelay = 1000,
			textFont = FONTS.GetFont( FONTS.MainBold.File ),
			textHeight = 12,
			chyronLetterSpeed = 30,
			chyronRandDhars = 3,
			chyronUpdatesPerLetter = 4,
			maxCharsPerLine = 100,
			controllerIndex = f1_local1
		} )
		f1_local9.id = "PrintoutC6"
		f1_local9:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
		f1_local9:SetAlpha( 0.6, 0 )
		f1_local9:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f1_local9:SetFontSize( 12 * _1080p )
		f1_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 216, _1080p * 691, _1080p * 360, _1080p * 521 )
		self:addElement( f1_local9 )
		self.PrintoutC6 = f1_local9
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if not Engine.IsMultiplayer() then
			f1_local8:RegisterAnimationSequence( "SelfDestruct", {
				{
					function ()
						return self.PrintoutC8:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
					end
				}
			} )
		end
		if not Engine.IsMultiplayer() then
			f1_local9:RegisterAnimationSequence( "SelfDestruct", {
				{
					function ()
						return self.PrintoutC6:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
					end
				}
			} )
		end
		self._sequences.SelfDestruct = function ()
			if not Engine.IsMultiplayer() then
				f1_local8:AnimateSequence( "SelfDestruct" )
			end
			if not Engine.IsMultiplayer() then
				f1_local9:AnimateSequence( "SelfDestruct" )
			end
		end
		
		if not Engine.IsMultiplayer() then
			f1_local8:RegisterAnimationSequence( "ShowPrintoutC8", {
				{
					function ()
						return self.PrintoutC8:SetAlpha( 0.6, 0 )
					end
				}
			} )
		end
		if not Engine.IsMultiplayer() then
			f1_local9:RegisterAnimationSequence( "ShowPrintoutC8", {
				{
					function ()
						return self.PrintoutC6:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.ShowPrintoutC8 = function ()
			if not Engine.IsMultiplayer() then
				f1_local8:AnimateSequence( "ShowPrintoutC8" )
			end
			if not Engine.IsMultiplayer() then
				f1_local9:AnimateSequence( "ShowPrintoutC8" )
			end
		end
		
		if not Engine.IsMultiplayer() then
			f1_local8:RegisterAnimationSequence( "ShowPrintoutC6", {
				{
					function ()
						return self.PrintoutC8:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if not Engine.IsMultiplayer() then
			f1_local9:RegisterAnimationSequence( "ShowPrintoutC6", {
				{
					function ()
						return self.PrintoutC6:SetAlpha( 0.6, 0 )
					end
				}
			} )
		end
		self._sequences.ShowPrintoutC6 = function ()
			if not Engine.IsMultiplayer() then
				f1_local8:AnimateSequence( "ShowPrintoutC6" )
			end
			if not Engine.IsMultiplayer() then
				f1_local9:AnimateSequence( "ShowPrintoutC6" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if not Engine.IsMultiplayer() then
		f1_local9:SubscribeToModel( DataSources.inGame.SP.hackControlRobotType:GetModel( f1_local1 ), function ()
			if DataSources.inGame.SP.hackControlRobotType:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.hackControlRobotType:GetValue( f1_local1 ) == 1 then
				ACTIONS.AnimateSequence( self, "ShowPrintoutC8" )
			end
			if DataSources.inGame.SP.hackControlRobotType:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.hackControlRobotType:GetValue( f1_local1 ) ~= 1 then
				ACTIONS.AnimateSequence( self, "ShowPrintoutC6" )
			end
		end )
	end
	return self
end

MenuBuilder.registerType( "HackControlGrid", HackControlGrid )
LockTable( _M )

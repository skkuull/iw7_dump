local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0 )
	assert( f1_arg0.Title )
	f1_arg0.SetTitle = function ( f2_arg0, f2_arg1 )
		f2_arg0.Title:setText( f2_arg1 )
	end
	
	f1_arg0.MeasureTitle = function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg0.Title:GetCurrentFont()
		local f3_local1, f3_local2, f3_local3, f3_local4 = f3_arg0.Title:getLocalRect()
		local f3_local5, f3_local6, f3_local7, f3_local8 = f3_arg0.Title:GetAnchorData()
		local f3_local9 = assert
		local f3_local10
		if (f3_local6 ~= 0 or f3_local8 ~= 1) and (f3_local6 ~= 1 or f3_local8 ~= 0) then
			f3_local10 = false
		else
			f3_local10 = true
		end
		f3_local9( f3_local10 )
		f3_local10, f3_local11, f3_local12, f3_local13 = GetTextDimensions( f3_arg1, f3_local0, math.abs( f3_local2 - f3_local4 ) )
		return f3_local12 - f3_local10
	end
	
end

function PopupFrameZm( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 400 * _1080p )
	self.id = "PopupFrameZm"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.Popups.backgroundPopup, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -10, _1080p * 10, _1080p * -60, _1080p * 10 )
	self:addElement( Background )
	self.Background = Background
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	Border:SetRGBFromTable( SWATCHES.genericMenu.border, 0 )
	Border:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10 )
	self:addElement( Border )
	self.Border = Border
	
	local TitleBar = nil
	
	TitleBar = LUI.UIImage.new()
	TitleBar.id = "TitleBar"
	TitleBar:SetRGBFromInt( 5723991, 0 )
	TitleBar:SetAlpha( 0.4, 0 )
	TitleBar:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -10, _1080p * 10, _1080p * -60, _1080p * -10 )
	self:addElement( TitleBar )
	self.TitleBar = TitleBar
	
	local Gradient = nil
	
	Gradient = LUI.UIImage.new()
	Gradient.id = "Gradient"
	Gradient:SetRGBFromInt( 0, 0 )
	Gradient:SetAlpha( 0.4, 0 )
	Gradient:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	Gradient:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -10, _1080p * 10, _1080p * -60, _1080p * -10 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local Title = nil
	
	Title = LUI.UIStyledText.new()
	Title.id = "Title"
	Title:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Title:SetFontSize( 38 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Title:SetAlignment( LUI.Alignment.Center )
	Title:SetStartupDelay( 1000 )
	Title:SetLineHoldTime( 400 )
	Title:SetAnimMoveTime( 150 )
	Title:SetEndDelay( 1000 )
	Title:SetCrossfadeTime( 400 )
	Title:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Title:SetMaxVisibleLines( 1 )
	Title:SetDecodeLetterLength( 25 )
	Title:SetDecodeMaxRandChars( 3 )
	Title:SetDecodeUpdatesPerLetter( 4 )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -52, _1080p * -14 )
	self:addElement( Title )
	self.Title = Title
	
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "PopupFrameZm", PopupFrameZm )
LockTable( _M )

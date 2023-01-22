local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = nil
	if f1_arg2 == 0 then
		f1_local0 = 0
	else
		f1_local0 = f1_arg1 / f1_arg2
	end
	f1_arg0.Progress:SetLeftAnchor( 0 )
	f1_arg0.Progress:SetRightAnchor( 1 - f1_local0, 1000 )
	f1_arg0.Progress:SetLeft( 0 )
	f1_arg0.Progress:SetRight( 0 )
end

f0_local1 = function ( f2_arg0 )
	f2_arg0.Progress:SetLeftAnchor( 0 )
	f2_arg0.Progress:SetRightAnchor( 1 )
	f2_arg0.Progress:SetLeft( 0 )
	f2_arg0.Progress:SetRight( 0 )
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	f3_arg0.UpdateProgress = f0_local0
	f3_arg0.ResetProgress = f0_local1
end

function CODTvProgressBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 15 * _1080p )
	self.id = "CODTvProgressBar"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 7039851, 0 )
	Background:SetAlpha( 0.8, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Progress = nil
	
	Progress = LUI.UIImage.new()
	Progress.id = "Progress"
	Progress:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	Progress:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, 0, 0 )
	self:addElement( Progress )
	self.Progress = Progress
	
	local TimeLabel = nil
	
	TimeLabel = LUI.UIText.new()
	TimeLabel.id = "TimeLabel"
	TimeLabel:SetRGBFromInt( 196608, 0 )
	TimeLabel:setText( "1:20 / 2:30", 0 )
	TimeLabel:SetFontSize( 16 * _1080p )
	TimeLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TimeLabel:SetAlignment( LUI.Alignment.Right )
	TimeLabel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -513, _1080p * -13, _1080p * -0.75, _1080p * 15.75 )
	self:addElement( TimeLabel )
	self.TimeLabel = TimeLabel
	
	f0_local2( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "CODTvProgressBar", CODTvProgressBar )
LockTable( _M )

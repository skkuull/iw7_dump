local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = CONDITIONS.IsThirdGameMode( f1_arg0 ) and f1_arg0.FillCP or f1_arg0.Fill
	assert( f1_local0 )
	f1_local0:SetAnchors( 0, 1 - math.min( f1_arg1, 1 ), 0, 1, 0, LUI.EASING.linear )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	REG3.SubscribeToModelThroughElement( CONDITIONS.IsThirdGameMode( f2_arg0 ) and f2_arg0.FillCP or f2_arg0.Fill, f2_arg0, "currentProgressPercent", function ()
		local f3_local0 = f2_arg0:GetDataSource()
		f0_local0( f2_arg0, f3_local0.currentProgressPercent:GetValue( f2_arg1 ) )
	end )
	f2_arg0.SetCurrentProgress = f0_local0
end

function ChallengeInfoProgressBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 206 * _1080p, 0, 27 * _1080p )
	self.id = "ChallengeInfoProgressBar"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local black = nil
	
	black = LUI.UIImage.new()
	black.id = "black"
	black:SetRGBFromInt( 0, 0 )
	black:SetAlpha( 0.5, 0 )
	self:addElement( black )
	self.black = black
	
	local f4_local4 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local4 = LUI.UIImage.new()
		f4_local4.id = "left"
		f4_local4:setImage( RegisterMaterial( "challenges_progress_hori_bg_left" ), 0 )
		f4_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -8, _1080p * 16, _1080p * -5, _1080p * 31 )
		self:addElement( f4_local4 )
		self.left = f4_local4
	end
	local f4_local5 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local5 = LUI.UIImage.new()
		f4_local5.id = "center"
		f4_local5:setImage( RegisterMaterial( "challenges_progress_hori_bg_center" ), 0 )
		f4_local5:SetBlendMode( BLEND_MODE.blend )
		f4_local5:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, _1080p * -18, _1080p * -5, _1080p * 31 )
		self:addElement( f4_local5 )
		self.center = f4_local5
	end
	local f4_local6 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local6 = LUI.UIImage.new()
		f4_local6.id = "right"
		f4_local6:setImage( RegisterMaterial( "challenges_progress_hori_bg_right" ), 0 )
		f4_local6:SetBlendMode( BLEND_MODE.blend )
		f4_local6:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -18, _1080p * 6, _1080p * -5, _1080p * 31 )
		self:addElement( f4_local6 )
		self.right = f4_local6
	end
	local f4_local7 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local7 = LUI.UIImage.new()
		f4_local7.id = "Fill"
		f4_local7:setImage( RegisterMaterial( "challenges_progress_hori_center" ), 0 )
		f4_local7:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 8, _1080p * -8, _1080p * -4, _1080p * 32 )
		self:addElement( f4_local7 )
		self.Fill = f4_local7
	end
	local f4_local8 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local8 = LUI.UIImage.new()
		f4_local8.id = "BackCP"
		f4_local8:SetAlpha( 0.3, 0 )
		f4_local8:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 11, _1080p * 17 )
		self:addElement( f4_local8 )
		self.BackCP = f4_local8
	end
	local f4_local9 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local9 = LUI.UIImage.new()
		f4_local9.id = "FillCP"
		f4_local9:SetRGBFromInt( 16745216, 0 )
		f4_local9:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 12, _1080p * 16 )
		self:addElement( f4_local9 )
		self.FillCP = f4_local9
	end
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "ChallengeInfoProgressBar", ChallengeInfoProgressBar )
LockTable( _M )

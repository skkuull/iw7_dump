local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.ProgressText )
	assert( f1_arg0.ProgressBar )
	if f1_arg2.teamIndex ~= -1 or Engine.IsAliensMode() then
		assert( f1_arg2.color )
		f1_arg0.ProgressTitle:SetRGBFromTable( COLORS.white )
		f1_arg0.ProgressHeader:SetRGBFromInt( f1_arg2.color, 0 )
		f1_arg0.ProgressBorder:SetRGBFromInt( f1_arg2.color, 0 )
	end
	if Contracts.CheckCompletion( f1_arg1, f1_arg2.index ) then
		if not Engine.IsAliensMode() then
			f1_arg0.ProgressText:setText( Engine.Localize( "LUA_MENU_MP_CONTRACT_COMPLETE" ) )
		else
			f1_arg0.ProgressText:setText( Engine.Localize( "ZM_CONTRACTS_BOUNTY_COMPLETE" ) )
		end
		f1_arg0.ProgressBar:SetAlpha( 0, 0 )
	else
		local f1_local0 = Contracts.GetCurrentChallengeProgress( f1_arg1, f1_arg2.index )
		local f1_local1 = tonumber( f1_arg2.challengeData.target )
		f1_arg0.ProgressText:setText( Engine.Localize( "LUA_MENU_MP_PROGRESS_TOTAL", Contracts.GetCurrentChallengeProgress( f1_arg1, f1_arg2.index ), f1_local1 ) )
		assert( f1_local1 ~= 0 )
		f1_arg0.ProgressBar:SetCurrentProgress( f1_local0 / f1_local1 )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.SetupProgress = f0_local0
end

function ContractProgress( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 660 * _1080p, 0, 130 * _1080p )
	self.id = "ContractProgress"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.6, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local ProgressHeader = nil
	
	ProgressHeader = LUI.UIImage.new()
	ProgressHeader.id = "ProgressHeader"
	ProgressHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 36 )
	self:addElement( ProgressHeader )
	self.ProgressHeader = ProgressHeader
	
	local ProgressTitle = nil
	
	ProgressTitle = LUI.UIText.new()
	ProgressTitle.id = "ProgressTitle"
	ProgressTitle:SetRGBFromInt( 0, 0 )
	ProgressTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_PROGRESS" ) ), 0 )
	ProgressTitle:SetFontSize( 24 * _1080p )
	ProgressTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ProgressTitle:SetAlignment( LUI.Alignment.Left )
	ProgressTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -112, _1080p * 6, _1080p * 30 )
	self:addElement( ProgressTitle )
	self.ProgressTitle = ProgressTitle
	
	local ProgressBackground = nil
	
	ProgressBackground = LUI.UIImage.new()
	ProgressBackground.id = "ProgressBackground"
	ProgressBackground:SetRGBFromInt( 0, 0 )
	ProgressBackground:SetAlpha( 0.5, 0 )
	ProgressBackground:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -30, _1080p * -2 )
	self:addElement( ProgressBackground )
	self.ProgressBackground = ProgressBackground
	
	local ProgressBar = nil
	
	ProgressBar = MenuBuilder.BuildRegisteredType( "ChallengeInfoProgressBar", {
		controllerIndex = f3_local1
	} )
	ProgressBar.id = "ProgressBar"
	ProgressBar.black:SetAlpha( 0, 0 )
	ProgressBar:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * -30, _1080p * -2 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local ProgressText = nil
	
	ProgressText = LUI.UIText.new()
	ProgressText.id = "ProgressText"
	ProgressText:setText( "", 0 )
	ProgressText:SetFontSize( 48 * _1080p )
	ProgressText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ProgressText:SetAlignment( LUI.Alignment.Center )
	ProgressText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 23, _1080p * -10, _1080p * -16.5, _1080p * 31.5 )
	self:addElement( ProgressText )
	self.ProgressText = ProgressText
	
	local ProgressBorder = nil
	
	ProgressBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	ProgressBorder.id = "ProgressBorder"
	ProgressBorder:SetBorderThicknessLeft( _1080p * 2, 0 )
	ProgressBorder:SetBorderThicknessRight( _1080p * 2, 0 )
	ProgressBorder:SetBorderThicknessTop( _1080p * 2, 0 )
	ProgressBorder:SetBorderThicknessBottom( _1080p * 2, 0 )
	self:addElement( ProgressBorder )
	self.ProgressBorder = ProgressBorder
	
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ContractProgress", ContractProgress )
LockTable( _M )

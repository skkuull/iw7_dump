local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CallingCardChallengesSelectionButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 376 * _1080p, 0, 250 * _1080p )
	self.id = "CallingCardChallengesSelectionButton"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	self:addElement( Border )
	self.Border = Border
	
	local CallingCardTexture = nil
	
	CallingCardTexture = LUI.UIImage.new()
	CallingCardTexture.id = "CallingCardTexture"
	CallingCardTexture:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -188, _1080p * 188, _1080p * 51, _1080p * 199 )
	CallingCardTexture:SubscribeToModelThroughElement( self, "challengeInfo.isCompletedAlpha", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.challengeInfo.isCompletedAlpha:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			CallingCardTexture:SetAlpha( Add( f2_local0, 0.5 ), 0 )
		end
	end )
	CallingCardTexture:SubscribeToModelThroughElement( self, "texture", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.texture:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			CallingCardTexture:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( CallingCardTexture )
	self.CallingCardTexture = CallingCardTexture
	
	local ChallengeNameLabel = nil
	
	ChallengeNameLabel = LUI.UIStyledText.new()
	ChallengeNameLabel.id = "ChallengeNameLabel"
	ChallengeNameLabel:SetFontSize( 36 * _1080p )
	ChallengeNameLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ChallengeNameLabel:SetAlignment( LUI.Alignment.Left )
	ChallengeNameLabel:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -43, _1080p * -7 )
	ChallengeNameLabel:SubscribeToModelThroughElement( self, "challengeInfoAlpha", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.challengeInfoAlpha:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			ChallengeNameLabel:SetAlpha( f4_local0, 0 )
		end
	end )
	ChallengeNameLabel:SubscribeToModelThroughElement( self, "challengeInfo.name", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.challengeInfo.name:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			ChallengeNameLabel:setText( LocalizeString( f5_local0 ), 0 )
		end
	end )
	self:addElement( ChallengeNameLabel )
	self.ChallengeNameLabel = ChallengeNameLabel
	
	local TierLabel = nil
	
	TierLabel = LUI.UIStyledText.new()
	TierLabel.id = "TierLabel"
	TierLabel:SetFontSize( 16 * _1080p )
	TierLabel:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	TierLabel:SetAlignment( LUI.Alignment.Right )
	TierLabel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -82, _1080p * -6, _1080p * 20, _1080p * 36 )
	TierLabel:SubscribeToModelThroughElement( self, "challengeInfoAlpha", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.challengeInfoAlpha:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			TierLabel:SetAlpha( f6_local0, 0 )
		end
	end )
	TierLabel:SubscribeToModelThroughElement( self, "challengeInfo.currentTierLabel", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.challengeInfo.currentTierLabel:GetValue( f1_local1 )
		if f7_local0 ~= nil then
			TierLabel:setText( f7_local0, 0 )
		end
	end )
	self:addElement( TierLabel )
	self.TierLabel = TierLabel
	
	local ProgressBar = nil
	
	ProgressBar = MenuBuilder.BuildRegisteredType( "ChallengeInfoProgressBar", {
		controllerIndex = f1_local1
	} )
	ProgressBar.id = "ProgressBar"
	ProgressBar:SetDataSourceThroughElement( self, "challengeInfo" )
	ProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 288, _1080p * 16, _1080p * 37 )
	ProgressBar:SubscribeToModelThroughElement( self, "challengeInfoAlpha", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.challengeInfoAlpha:GetValue( f1_local1 )
		if f8_local0 ~= nil then
			ProgressBar:SetAlpha( f8_local0, 0 )
		end
	end )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	ProgressBar:SetDataSourceThroughElement( self, "challengeInfo" )
	return self
end

MenuBuilder.registerType( "CallingCardChallengesSelectionButton", CallingCardChallengesSelectionButton )
LockTable( _M )

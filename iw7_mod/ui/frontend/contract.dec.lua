local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	assert( f1_arg0.ContractType )
	assert( f1_arg0.ContractDesc )
	assert( f1_arg0.MissionTeamImage )
	assert( f1_arg0.RequirementText )
	assert( f1_arg0.Background )
	assert( f1_arg0.Border )
	assert( f1_arg0.ContractProgress )
	assert( f1_arg0.ContractRewardBox )
	f1_arg0.contractData = Contracts.GetContractData( f1_arg1, f1_arg2, f1_arg3 )
	f1_arg0.ContractType:setText( ToUpperCase( f1_arg0.contractData.type ) )
	f1_arg0.ContractDesc:setText( f1_arg0.contractData.desc )
	f1_arg0.ContractRewardBox:SetupRewardBox( f1_arg1, f1_arg0.contractData )
	if f1_arg0.contractData.teamIndex ~= -1 or Engine.IsAliensMode() then
		assert( f1_arg0.contractData.color )
		f1_arg0.ContractType:SetRGBFromTable( COLORS.white )
		f1_arg0.MissionTeamImage:setImage( f1_arg0.contractData.teamImage )
		f1_arg0.Background:SetRGBFromInt( f1_arg0.contractData.color, 0 )
		f1_arg0.Border:SetRGBFromInt( f1_arg0.contractData.color, 0 )
		f1_arg0.ContractRequirementBorder:SetRGBFromInt( f1_arg0.contractData.color, 0 )
		f1_arg0.ContractHeaderBG:SetRGBFromInt( f1_arg0.contractData.color, 0 )
		f1_arg0.ContractHeaderBGAngle:SetRGBFromInt( f1_arg0.contractData.color, 0 )
		if not Engine.IsAliensMode() then
			f1_arg0.MissionTeamImageBacker:SetAlpha( 1, 0 )
		else
			f1_arg0.MissionTeamImageBacker:SetAlpha( 0, 0 )
		end
	end
	if Engine.IsAliensMode() then
		f1_arg0.MissionTeamImage:SetAlpha( 0, 0 )
		if f1_arg0.contractData.teamIndex == -1 then
			f1_arg0.willard:SetAlpha( 1, 0 )
		elseif f1_arg0.contractData.teamIndex == 0 then
			f1_arg0.hoff:SetAlpha( 1, 0 )
		elseif f1_arg0.contractData.teamIndex == 1 then
			f1_arg0.kevin:SetAlpha( 1, 0 )
		elseif f1_arg0.contractData.teamIndex == 2 then
			f1_arg0.pam:SetAlpha( 1, 0 )
		elseif f1_arg0.contractData.teamIndex == 3 then
			f1_arg0.elvira:SetAlpha( 1, 0 )
		elseif f1_arg0.contractData.teamIndex == 4 then
			f1_arg0.neil:SetAlpha( 1, 0 )
		end
	end
	f1_arg0.RequirementText:setText( Contracts.GetRequirementText( f1_arg0.contractData.teamIndex, f1_arg3, f1_arg1 ) )
	f1_arg0.ContractProgress:SetupProgress( f1_arg1, f1_arg0.contractData )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.SetupContract = f0_local0
end

function Contract( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 700 * _1080p, 0, 620 * _1080p )
	self.id = "Contract"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	local Background = nil
	
	Background = LUI.UIBlur.new()
	Background.id = "Background"
	Background:SetBlurStrength( 2.25, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local ContractHeaderBG = nil
	
	ContractHeaderBG = LUI.UIImage.new()
	ContractHeaderBG.id = "ContractHeaderBG"
	ContractHeaderBG:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 525, 0, _1080p * 36 )
	self:addElement( ContractHeaderBG )
	self.ContractHeaderBG = ContractHeaderBG
	
	local ContractHeaderBGAngle = nil
	
	ContractHeaderBGAngle = LUI.UIImage.new()
	ContractHeaderBGAngle.id = "ContractHeaderBGAngle"
	ContractHeaderBGAngle:setImage( RegisterMaterial( "wdg_slot_cut_out_1" ), 0 )
	ContractHeaderBGAngle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 525, _1080p * 561, 0, _1080p * 36 )
	self:addElement( ContractHeaderBGAngle )
	self.ContractHeaderBGAngle = ContractHeaderBGAngle
	
	local ContractRequirementDropShadow = nil
	
	ContractRequirementDropShadow = LUI.UIImage.new()
	ContractRequirementDropShadow.id = "ContractRequirementDropShadow"
	ContractRequirementDropShadow:SetRGBFromInt( 0, 0 )
	ContractRequirementDropShadow:SetAlpha( 0.3, 0 )
	ContractRequirementDropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	ContractRequirementDropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 2, _1080p * -2, _1080p * -243, _1080p * -239 )
	self:addElement( ContractRequirementDropShadow )
	self.ContractRequirementDropShadow = ContractRequirementDropShadow
	
	local ContractRequirementBacker = nil
	
	ContractRequirementBacker = LUI.UIImage.new()
	ContractRequirementBacker.id = "ContractRequirementBacker"
	ContractRequirementBacker:SetRGBFromInt( 0, 0 )
	ContractRequirementBacker:SetAlpha( 0.6, 0 )
	ContractRequirementBacker:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 318, _1080p * 378 )
	self:addElement( ContractRequirementBacker )
	self.ContractRequirementBacker = ContractRequirementBacker
	
	local ContractRequirementBorder = nil
	
	ContractRequirementBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	ContractRequirementBorder.id = "ContractRequirementBorder"
	ContractRequirementBorder:SetBorderThicknessLeft( _1080p * 0, 0 )
	ContractRequirementBorder:SetBorderThicknessRight( _1080p * 0, 0 )
	ContractRequirementBorder:SetBorderThicknessTop( _1080p * 2, 0 )
	ContractRequirementBorder:SetBorderThicknessBottom( _1080p * 2, 0 )
	ContractRequirementBorder:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 2, _1080p * -2, _1080p * 318, _1080p * 378 )
	self:addElement( ContractRequirementBorder )
	self.ContractRequirementBorder = ContractRequirementBorder
	
	local RequirementText = nil
	
	RequirementText = LUI.UIStyledText.new()
	RequirementText.id = "RequirementText"
	RequirementText:setText( "", 0 )
	RequirementText:SetFontSize( 24 * _1080p )
	RequirementText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RequirementText:SetAlignment( LUI.Alignment.Center )
	RequirementText:SetStartupDelay( 1500 )
	RequirementText:SetLineHoldTime( 400 )
	RequirementText:SetAnimMoveTime( 300 )
	RequirementText:SetEndDelay( 1000 )
	RequirementText:SetCrossfadeTime( 500 )
	RequirementText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	RequirementText:SetMaxVisibleLines( 1 )
	RequirementText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 51.5, _1080p * -47.5, _1080p * 336, _1080p * 360 )
	self:addElement( RequirementText )
	self.RequirementText = RequirementText
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	Border.id = "Border"
	Border:SetBorderThicknessLeft( _1080p * 2, 0 )
	Border:SetBorderThicknessRight( _1080p * 2, 0 )
	Border:SetBorderThicknessTop( _1080p * 2, 0 )
	Border:SetBorderThicknessBottom( _1080p * 2, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local MissionTeamImageBacker = nil
	
	MissionTeamImageBacker = LUI.UIImage.new()
	MissionTeamImageBacker.id = "MissionTeamImageBacker"
	MissionTeamImageBacker:SetAlpha( 0, 0 )
	MissionTeamImageBacker:setImage( RegisterMaterial( "mp_mt_contract_backing" ), 0 )
	MissionTeamImageBacker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -58.5, _1080p * 142.5, _1080p * -28, _1080p * 173 )
	self:addElement( MissionTeamImageBacker )
	self.MissionTeamImageBacker = MissionTeamImageBacker
	
	local MissionTeamImage = nil
	
	MissionTeamImage = LUI.UIImage.new()
	MissionTeamImage.id = "MissionTeamImage"
	MissionTeamImage:setImage( RegisterMaterial( "mission_team_joint_ops_icon" ), 0 )
	MissionTeamImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -58.5, _1080p * 142.5, _1080p * -28, _1080p * 173 )
	self:addElement( MissionTeamImage )
	self.MissionTeamImage = MissionTeamImage
	
	local willard = nil
	
	willard = LUI.UIImage.new()
	willard.id = "willard"
	willard:SetAlpha( 0, 0 )
	willard:SetScale( 0.35, 0 )
	willard:setImage( RegisterMaterial( "zm_character_willard" ), 0 )
	willard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -22, _1080p * 106, 0, _1080p * 256 )
	self:addElement( willard )
	self.willard = willard
	
	local kevin = nil
	
	kevin = LUI.UIImage.new()
	kevin.id = "kevin"
	kevin:SetAlpha( 0, 0 )
	kevin:SetScale( 0.35, 0 )
	kevin:setImage( RegisterMaterial( "zm_character_select_smith" ), 0 )
	kevin:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -22, _1080p * 106, _1080p * -85, _1080p * 171 )
	self:addElement( kevin )
	self.kevin = kevin
	
	local hoff = nil
	
	hoff = LUI.UIImage.new()
	hoff.id = "hoff"
	hoff:SetAlpha( 0, 0 )
	hoff:SetScale( -0.09, 0 )
	hoff:setImage( RegisterMaterial( "zm_character_select_hoff" ), 0 )
	hoff:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -94.93, _1080p * 161.07, _1080p * -55.5, _1080p * 200.5 )
	self:addElement( hoff )
	self.hoff = hoff
	
	local pam = nil
	
	pam = LUI.UIImage.new()
	pam.id = "pam"
	pam:SetAlpha( 0, 0 )
	pam:SetScale( 0.03, 0 )
	pam:setImage( RegisterMaterial( "zm_character_select_pam" ), 0 )
	pam:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -22, _1080p * 106, _1080p * -55, _1080p * 201 )
	self:addElement( pam )
	self.pam = pam
	
	local elvira = nil
	
	elvira = LUI.UIImage.new()
	elvira.id = "elvira"
	elvira:SetAlpha( 0, 0 )
	elvira:SetScale( 0.35, 0 )
	elvira:setImage( RegisterMaterial( "zm_character_select_elvira" ), 0 )
	elvira:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -12.5, _1080p * 115.5, _1080p * -40.2, _1080p * 215.8 )
	self:addElement( elvira )
	self.elvira = elvira
	
	local neil = nil
	
	neil = LUI.UIImage.new()
	neil.id = "neil"
	neil:SetAlpha( 0, 0 )
	neil:SetScale( 0.24, 0 )
	neil:setImage( RegisterMaterial( "bounties_neil" ), 0 )
	neil:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -30.93, _1080p * 97.07, _1080p * -15, _1080p * 113 )
	self:addElement( neil )
	self.neil = neil
	
	local ContractType = nil
	
	ContractType = LUI.UIStyledText.new()
	ContractType.id = "ContractType"
	ContractType:SetRGBFromInt( 0, 0 )
	ContractType:setText( ToUpperCase( "" ), 0 )
	ContractType:SetFontSize( 24 * _1080p )
	ContractType:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ContractType:SetAlignment( LUI.Alignment.Left )
	ContractType:SetStartupDelay( 1500 )
	ContractType:SetLineHoldTime( 400 )
	ContractType:SetAnimMoveTime( 300 )
	ContractType:SetEndDelay( 1000 )
	ContractType:SetCrossfadeTime( 500 )
	ContractType:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	ContractType:SetMaxVisibleLines( 1 )
	ContractType:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 140, _1080p * -180, _1080p * 6, _1080p * 30 )
	self:addElement( ContractType )
	self.ContractType = ContractType
	
	local ContractDesc = nil
	
	ContractDesc = LUI.UIStyledText.new()
	ContractDesc.id = "ContractDesc"
	ContractDesc:setText( "", 0 )
	ContractDesc:SetFontSize( 24 * _1080p )
	ContractDesc:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ContractDesc:SetAlignment( LUI.Alignment.Left )
	ContractDesc:SetStartupDelay( 1000 )
	ContractDesc:SetLineHoldTime( 400 )
	ContractDesc:SetAnimMoveTime( 150 )
	ContractDesc:SetEndDelay( 1000 )
	ContractDesc:SetCrossfadeTime( 400 )
	ContractDesc:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	ContractDesc:SetMaxVisibleLines( 3 )
	ContractDesc:SetDecodeLetterLength( 12 )
	ContractDesc:SetDecodeMaxRandChars( 3 )
	ContractDesc:SetDecodeUpdatesPerLetter( 4 )
	ContractDesc:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 140, _1080p * -47, _1080p * 49, _1080p * 73 )
	self:addElement( ContractDesc )
	self.ContractDesc = ContractDesc
	
	local ContractRewardBox = nil
	
	ContractRewardBox = MenuBuilder.BuildRegisteredType( "ContractRewardBox", {
		controllerIndex = f3_local1
	} )
	ContractRewardBox.id = "ContractRewardBox"
	ContractRewardBox.Title:SetLeft( _1080p * 250, 0 )
	ContractRewardBox.Flare2:SetLeft( _1080p * -45, 0 )
	ContractRewardBox.Flare2:SetRight( _1080p * 240, 0 )
	ContractRewardBox.Flare:SetLeft( _1080p * -52, 0 )
	ContractRewardBox.Flare:SetRight( _1080p * 240, 0 )
	ContractRewardBox.RewardImage:SetLeft( _1080p * -90, 0 )
	ContractRewardBox.RewardImage:SetRight( _1080p * 278, 0 )
	ContractRewardBox.RewardType:SetLeft( _1080p * 250, 0 )
	ContractRewardBox.RewardType:SetTop( _1080p * 46, 0 )
	ContractRewardBox.RewardType:SetBottom( _1080p * 70, 0 )
	ContractRewardBox.RewardDesc:SetLeft( _1080p * 250, 0 )
	ContractRewardBox.RewardDesc:SetTop( _1080p * 80, 0 )
	ContractRewardBox.RewardDesc:SetBottom( _1080p * 104, 0 )
	ContractRewardBox:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 20, _1080p * -20, _1080p * -220, _1080p * -20 )
	self:addElement( ContractRewardBox )
	self.ContractRewardBox = ContractRewardBox
	
	local ContractProgress = nil
	
	ContractProgress = MenuBuilder.BuildRegisteredType( "ContractProgress", {
		controllerIndex = f3_local1
	} )
	ContractProgress.id = "ContractProgress"
	ContractProgress:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -20, _1080p * 169, _1080p * 299 )
	self:addElement( ContractProgress )
	self.ContractProgress = ContractProgress
	
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Contract", Contract )
LockTable( _M )

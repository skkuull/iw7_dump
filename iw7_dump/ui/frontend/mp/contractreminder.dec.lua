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
	assert( f1_arg0.ContractRewardBox )
	f1_arg0.contractData = Contracts.GetContractData( f1_arg1, f1_arg2, f1_arg3 )
	f1_arg0.ContractType:setText( ToUpperCase( f1_arg0.contractData.type ) )
	f1_arg0.ContractDesc:setText( f1_arg0.contractData.desc )
	f1_arg0.ContractRewardBox:SetupRewardBox( f1_arg1, f1_arg0.contractData )
	if Engine.IsCoreMode() then
		if f1_arg0.contractData.teamIndex ~= -1 then
			assert( f1_arg0.contractData.color )
			f1_arg0.ContractType:SetRGBFromTable( COLORS.white )
			f1_arg0.MissionTeamImage:setImage( f1_arg0.contractData.teamImage )
			f1_arg0.Background:SetRGBFromInt( f1_arg0.contractData.color, 0 )
			f1_arg0.Border:SetRGBFromInt( f1_arg0.contractData.color, 0 )
			f1_arg0.ContractHeaderBG:SetRGBFromInt( f1_arg0.contractData.color, 0 )
			f1_arg0.ContractHeaderBGAngle:SetRGBFromInt( f1_arg0.contractData.color, 0 )
			f1_arg0.ContractRequirementBorder:SetRGBFromInt( f1_arg0.contractData.color, 0 )
			f1_arg0.MissionTeamImageBacker:SetAlpha( 1, 0 )
		end
	elseif Engine.IsAliensMode() then
		f1_arg0.MissionTeamImage:SetAlpha( 0, 0 )
		f1_arg0.ContractType:SetRGBFromTable( COLORS.white )
		f1_arg0.Background:SetRGBFromInt( f1_arg0.contractData.color, 0 )
		f1_arg0.Border:SetRGBFromInt( f1_arg0.contractData.color, 0 )
		f1_arg0.ContractHeaderBG:SetRGBFromInt( f1_arg0.contractData.color, 0 )
		f1_arg0.ContractHeaderBGAngle:SetRGBFromInt( f1_arg0.contractData.color, 0 )
		f1_arg0.ContractRequirementBorder:SetRGBFromInt( f1_arg0.contractData.color, 0 )
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
	f1_arg0.RequirementText:setText( Contracts.GetRequirementText( f1_arg0.contractData.teamIndex, f1_arg3, f1_arg1, true ) )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.SetupContract = f0_local0
end

function ContractReminder( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 560 * _1080p, 0, 405 * _1080p )
	self.id = "ContractReminder"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetAlpha( 0.6, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local PopupBacker = nil
	
	PopupBacker = LUI.UIImage.new()
	PopupBacker.id = "PopupBacker"
	PopupBacker:SetRGBFromInt( 0, 0 )
	PopupBacker:SetAlpha( 0.5, 0 )
	self:addElement( PopupBacker )
	self.PopupBacker = PopupBacker
	
	local ContractRequirementDropShadow = nil
	
	ContractRequirementDropShadow = LUI.UIImage.new()
	ContractRequirementDropShadow.id = "ContractRequirementDropShadow"
	ContractRequirementDropShadow:SetRGBFromInt( 0, 0 )
	ContractRequirementDropShadow:SetAlpha( 0.3, 0 )
	ContractRequirementDropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	ContractRequirementDropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 2, _1080p * -2, _1080p * -222, _1080p * -218 )
	self:addElement( ContractRequirementDropShadow )
	self.ContractRequirementDropShadow = ContractRequirementDropShadow
	
	local ContractRequirementBacker = nil
	
	ContractRequirementBacker = LUI.UIImage.new()
	ContractRequirementBacker.id = "ContractRequirementBacker"
	ContractRequirementBacker:SetRGBFromInt( 0, 0 )
	ContractRequirementBacker:SetAlpha( 0.4, 0 )
	ContractRequirementBacker:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 123, _1080p * 183 )
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
	ContractRequirementBorder:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 2, _1080p * -2, _1080p * 123, _1080p * 183 )
	self:addElement( ContractRequirementBorder )
	self.ContractRequirementBorder = ContractRequirementBorder
	
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
	
	local RequirementText = nil
	
	RequirementText = LUI.UIStyledText.new()
	RequirementText.id = "RequirementText"
	RequirementText:setText( "", 0 )
	RequirementText:SetFontSize( 22 * _1080p )
	RequirementText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RequirementText:SetAlignment( LUI.Alignment.Center )
	RequirementText:SetStartupDelay( 1500 )
	RequirementText:SetLineHoldTime( 400 )
	RequirementText:SetAnimMoveTime( 300 )
	RequirementText:SetEndDelay( 1000 )
	RequirementText:SetCrossfadeTime( 500 )
	RequirementText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	RequirementText:SetMaxVisibleLines( 1 )
	RequirementText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 31, _1080p * -29, _1080p * 141, _1080p * 163 )
	self:addElement( RequirementText )
	self.RequirementText = RequirementText
	
	local ContractHeaderBGAngle = nil
	
	ContractHeaderBGAngle = LUI.UIImage.new()
	ContractHeaderBGAngle.id = "ContractHeaderBGAngle"
	ContractHeaderBGAngle:setImage( RegisterMaterial( "wdg_slot_cut_out_1" ), 0 )
	ContractHeaderBGAngle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 460, _1080p * 496, 0, _1080p * 36 )
	self:addElement( ContractHeaderBGAngle )
	self.ContractHeaderBGAngle = ContractHeaderBGAngle
	
	local ContractHeaderBG = nil
	
	ContractHeaderBG = LUI.UIImage.new()
	ContractHeaderBG.id = "ContractHeaderBG"
	ContractHeaderBG:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 460, 0, _1080p * 36 )
	self:addElement( ContractHeaderBG )
	self.ContractHeaderBG = ContractHeaderBG
	
	local ContractType = nil
	
	ContractType = LUI.UIStyledText.new()
	ContractType.id = "ContractType"
	ContractType:SetRGBFromInt( 0, 0 )
	ContractType:setText( "", 0 )
	ContractType:SetFontSize( 22 * _1080p )
	ContractType:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ContractType:SetAlignment( LUI.Alignment.Left )
	ContractType:SetStartupDelay( 1500 )
	ContractType:SetLineHoldTime( 400 )
	ContractType:SetAnimMoveTime( 300 )
	ContractType:SetEndDelay( 1000 )
	ContractType:SetCrossfadeTime( 500 )
	ContractType:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	ContractType:SetMaxVisibleLines( 1 )
	ContractType:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 90, _1080p * -106, _1080p * 7, _1080p * 29 )
	self:addElement( ContractType )
	self.ContractType = ContractType
	
	local ContractDesc = nil
	
	ContractDesc = LUI.UIStyledText.new()
	ContractDesc.id = "ContractDesc"
	ContractDesc:setText( "", 0 )
	ContractDesc:SetFontSize( 20 * _1080p )
	ContractDesc:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ContractDesc:SetAlignment( LUI.Alignment.Left )
	ContractDesc:SetStartupDelay( 1000 )
	ContractDesc:SetLineHoldTime( 400 )
	ContractDesc:SetAnimMoveTime( 150 )
	ContractDesc:SetEndDelay( 1000 )
	ContractDesc:SetCrossfadeTime( 400 )
	ContractDesc:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	ContractDesc:SetMaxVisibleLines( 2 )
	ContractDesc:SetDecodeLetterLength( 12 )
	ContractDesc:SetDecodeMaxRandChars( 3 )
	ContractDesc:SetDecodeUpdatesPerLetter( 4 )
	ContractDesc:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 90, _1080p * -19, _1080p * 47.5, _1080p * 67.5 )
	self:addElement( ContractDesc )
	self.ContractDesc = ContractDesc
	
	local ContractRewardBox = nil
	
	ContractRewardBox = MenuBuilder.BuildRegisteredType( "ContractRewardBox", {
		controllerIndex = f3_local1
	} )
	ContractRewardBox.id = "ContractRewardBox"
	ContractRewardBox.Title:SetLeft( _1080p * 212, 0 )
	ContractRewardBox.Flare2:SetLeft( _1080p * -59, 0 )
	ContractRewardBox.Flare2:SetRight( _1080p * 209, 0 )
	ContractRewardBox.Flare:SetLeft( _1080p * -59, 0 )
	ContractRewardBox.Flare:SetRight( _1080p * 209, 0 )
	ContractRewardBox.RewardImage:SetLeft( _1080p * -85, 0 )
	ContractRewardBox.RewardImage:SetRight( _1080p * 235, 0 )
	ContractRewardBox.RewardType:SetLeft( _1080p * 212, 0 )
	ContractRewardBox.RewardType:SetTop( _1080p * 46, 0 )
	ContractRewardBox.RewardType:SetBottom( _1080p * 66, 0 )
	ContractRewardBox.RewardDesc:SetLeft( _1080p * 212, 0 )
	ContractRewardBox.RewardDesc:SetTop( _1080p * 70, 0 )
	ContractRewardBox.RewardDesc:SetBottom( _1080p * 90, 0 )
	ContractRewardBox:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 20, _1080p * -20, _1080p * -196, _1080p * -20 )
	self:addElement( ContractRewardBox )
	self.ContractRewardBox = ContractRewardBox
	
	local MissionTeamImageBacker = nil
	
	MissionTeamImageBacker = LUI.UIImage.new()
	MissionTeamImageBacker.id = "MissionTeamImageBacker"
	MissionTeamImageBacker:SetAlpha( 0, 0 )
	MissionTeamImageBacker:setImage( RegisterMaterial( "mp_mt_contract_backing" ), 0 )
	MissionTeamImageBacker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -59.5, _1080p * 87.5, _1080p * -23, _1080p * 124 )
	self:addElement( MissionTeamImageBacker )
	self.MissionTeamImageBacker = MissionTeamImageBacker
	
	local MissionTeamImage = nil
	
	MissionTeamImage = LUI.UIImage.new()
	MissionTeamImage.id = "MissionTeamImage"
	MissionTeamImage:setImage( RegisterMaterial( "mission_team_joint_ops_icon" ), 0 )
	MissionTeamImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -59.5, _1080p * 87.5, _1080p * -23, _1080p * 124 )
	self:addElement( MissionTeamImage )
	self.MissionTeamImage = MissionTeamImage
	
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	local willard = nil
	
	willard = LUI.UIImage.new()
	willard.id = "willard"
	willard:SetAlpha( 0, 0 )
	willard:setImage( RegisterMaterial( "zm_character_willard" ), 0 )
	willard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -40.5, _1080p * 87.5, _1080p * -40.2, _1080p * 215.8 )
	self:addElement( willard )
	self.willard = willard
	
	local elvira = nil
	
	elvira = LUI.UIImage.new()
	elvira.id = "elvira"
	elvira:SetAlpha( 0, 0 )
	elvira:setImage( RegisterMaterial( "zm_character_select_elvira" ), 0 )
	elvira:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -33, _1080p * 95, _1080p * -70.5, _1080p * 185.5 )
	self:addElement( elvira )
	self.elvira = elvira
	
	local kevin = nil
	
	kevin = LUI.UIImage.new()
	kevin.id = "kevin"
	kevin:SetAlpha( 0, 0 )
	kevin:setImage( RegisterMaterial( "zm_character_select_smith" ), 0 )
	kevin:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -38, _1080p * 90, _1080p * -92, _1080p * 164 )
	self:addElement( kevin )
	self.kevin = kevin
	
	local hoff = nil
	
	hoff = LUI.UIImage.new()
	hoff.id = "hoff"
	hoff:SetAlpha( 0, 0 )
	hoff:SetScale( -0.36, 0 )
	hoff:setImage( RegisterMaterial( "zm_character_select_hoff" ), 0 )
	hoff:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -114, _1080p * 142, _1080p * -68.92, _1080p * 187.08 )
	self:addElement( hoff )
	self.hoff = hoff
	
	local pam = nil
	
	pam = LUI.UIImage.new()
	pam.id = "pam"
	pam:SetAlpha( 0, 0 )
	pam:SetScale( -0.13, 0 )
	pam:setImage( RegisterMaterial( "zm_character_select_pam" ), 0 )
	pam:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -44, _1080p * 84, _1080p * -70.5, _1080p * 185.5 )
	self:addElement( pam )
	self.pam = pam
	
	local neil = nil
	
	neil = LUI.UIImage.new()
	neil.id = "neil"
	neil:SetAlpha( 0, 0 )
	neil:SetScale( 0.24, 0 )
	neil:setImage( RegisterMaterial( "bounties_neil" ), 0 )
	neil:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -40.93, _1080p * 87.07, _1080p * -15, _1080p * 113 )
	self:addElement( neil )
	self.neil = neil
	
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ContractReminder", ContractReminder )
LockTable( _M )

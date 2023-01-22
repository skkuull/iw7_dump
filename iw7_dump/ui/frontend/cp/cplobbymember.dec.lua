local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg1.controller
		assert( f2_local0 )
		local f2_local1 = f2_arg0:GetDataSource()
		local f2_local2 = Lobby.GetActivePartyMemberXUID( f2_local1.memberIndex:GetValue( f2_local0 ) )
		assert( f2_local2 )
		if Engine.IsXB3() or Engine.IsPCApp() or not Lobby.IsLocalPlayer( f2_local2 ) then
			LUI.FlowManager.RequestPopupMenu( nil, "LobbyMemberActions", true, f2_local0, false, {
				xuid = f2_local2
			} )
		end
	end )
	f1_arg0.bindButton:addEventHandler( "button_alt1", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg0:getParent()
		if #f3_local0:getAllFocusedChildren() <= 0 then
			f3_local0 = f3_arg0:getParent()
			if f3_local0:isInFocus() then
				f3_local0 = f1_arg0:GetDataSource()
				local f3_local1 = Lobby.GetActivePartyMemberXUID( f3_local0.memberIndex:GetValue( f1_arg1 ) )
				assert( f3_local1 )
				if not Lobby.IsLocalPlayer( f3_local1 ) then
					Lobby.ToggleMute( f1_arg1, f3_local1 )
				end
				return true
			end
			return false
		end
		f3_local0 = f1_arg0:GetDataSource()
		local f3_local1 = Lobby.GetActivePartyMemberXUID( f3_local0.memberIndex:GetValue( f1_arg1 ) )
		assert( f3_local1 )
		if not Lobby.IsLocalPlayer( f3_local1 ) then
			Lobby.ToggleMute( f1_arg1, f3_local1 )
		end
		return true
	end )
	f1_arg0.Gamertag:SubscribeToModelThroughElement( f1_arg0, "gamertag", function ()
		local f4_local0 = f1_arg0:GetDataSource()
		f4_local0 = f4_local0.gamertag:GetValue( f1_arg1 )
		if f4_local0 ~= nil then
			if Engine.IsPC() then
				f1_arg0.Gamertag:setText( Engine.TruncateToGlyphCount( f4_local0, 16 ), 0 )
			else
				f1_arg0.Gamertag:setText( f4_local0, 0 )
			end
		end
		local f4_local1 = f1_arg0:GetDataSource()
		f4_local1 = f4_local1.missingGamertag:GetValue( f1_arg1 )
		if Engine.IsAliensMode() then
			if f4_local1 or CONDITIONS.IsSystemLink() then
				f1_arg0.RankIcon:SetAlpha( 0 )
				f1_arg0.Rank:SetAlpha( 0 )
			else
				f1_arg0.RankIcon:SetAlpha( 1 )
				f1_arg0.Rank:SetAlpha( 1 )
			end
		elseif f4_local1 or CONDITIONS.IsSystemLink() or not CONDITIONS.IsPublicMatch() then
			f1_arg0.RankIcon:SetAlpha( 0 )
			f1_arg0.Rank:SetAlpha( 0 )
		else
			f1_arg0.RankIcon:SetAlpha( 1 )
			f1_arg0.Rank:SetAlpha( 1 )
		end
	end )
	local f1_local0 = function ()
		if f1_arg0.Emblem then
			f1_arg0.Emblem:close()
			f1_arg0.Emblem = nil
		end
		f1_arg0.Emblem = LUI.UIElement.new()
		f1_arg0.Emblem.id = "Emblem"
		f1_arg0.Emblem:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 118, _1080p * 76, _1080p * 192.5 )
		f1_arg0:addElement( f1_arg0.Emblem )
		local f5_local0 = f1_arg0:GetDataSource()
		local f5_local1 = f5_local0.xuid
		local f5_local2, f5_local3 = false
		if f5_local1 then
			f5_local3 = f5_local1:GetValue( f1_arg1 )
			if #f5_local3 > 0 then
				f5_local2 = not Engine.IsXUIDInvalid( f5_local3 )
			else
				f5_local2 = false
			end
		end
		local f5_local4 = f5_local0.customEmblemEquipped
		if Engine.GetDvarBool( "killswitch_custom_emblems" ) ~= true and f5_local4 and f5_local2 and f5_local4:GetValue( f1_arg1 ) then
			if Engine.CanViewCustomEmblemFromUser( f1_arg1, f5_local3 ) then
				f1_arg0.Emblem:SetupUserEmblem( {
					xuid = f5_local3
				} )
			else
				f1_arg0.Emblem:setupUIImage()
				f1_arg0.Emblem:SetUseAA( true )
				f1_arg0.Emblem:setImage( RegisterMaterial( "ui_emblem_static_016" ), 0 )
			end
		else
			f1_arg0.Emblem:setupUIImage()
			f1_arg0.Emblem:SetUseAA( true )
			local f5_local5 = f5_local0.emblem:GetValue( f1_arg1 )
			if f5_local5 ~= nil then
				f1_arg0.Emblem:setImage( RegisterMaterial( f5_local5 ), 0 )
			else
				f1_arg0.Emblem:setImage( RegisterMaterial( "white" ), 0 )
			end
		end
	end
	
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "fullName", f1_local0, true )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "customEmblemEquipped", f1_local0, true )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "emblem", f1_local0 )
end

function CPLobbyMember( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 416 * _1080p, 0, 192 * _1080p )
	self.id = "CPLobbyMember"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 416, _1080p * 100, _1080p * 192.5 )
	self:addElement( Background )
	self.Background = Background
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f6_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 420, _1080p * 1, _1080p * 192 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local topLineBackingCopy = nil
	
	topLineBackingCopy = LUI.UIImage.new()
	topLineBackingCopy.id = "topLineBackingCopy"
	topLineBackingCopy:SetRGBFromInt( 0, 0 )
	topLineBackingCopy:SetAlpha( 0.9, 0 )
	topLineBackingCopy:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 416, _1080p * 32, _1080p * 75.5 )
	self:addElement( topLineBackingCopy )
	self.topLineBackingCopy = topLineBackingCopy
	
	local FAFCard5Image = nil
	
	FAFCard5Image = LUI.UIImage.new()
	FAFCard5Image.id = "FAFCard5Image"
	FAFCard5Image:SetAlpha( 0.5, 0 )
	FAFCard5Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 344, _1080p * 415, _1080p * 16.9, _1080p * 87.9 )
	FAFCard5Image:SubscribeToModelThroughElement( self, "zombiesConsumables.cardSlot5Icon", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.zombiesConsumables.cardSlot5Icon:GetValue( f6_local1 )
		if f7_local0 ~= nil then
			FAFCard5Image:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	self:addElement( FAFCard5Image )
	self.FAFCard5Image = FAFCard5Image
	
	local FAFCard4Image = nil
	
	FAFCard4Image = LUI.UIImage.new()
	FAFCard4Image.id = "FAFCard4Image"
	FAFCard4Image:SetAlpha( 0.5, 0 )
	FAFCard4Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 279, _1080p * 350, _1080p * 15.88, _1080p * 86.88 )
	FAFCard4Image:SubscribeToModelThroughElement( self, "zombiesConsumables.cardSlot4Icon", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.zombiesConsumables.cardSlot4Icon:GetValue( f6_local1 )
		if f8_local0 ~= nil then
			FAFCard4Image:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	self:addElement( FAFCard4Image )
	self.FAFCard4Image = FAFCard4Image
	
	local FAFCard3Image = nil
	
	FAFCard3Image = LUI.UIImage.new()
	FAFCard3Image.id = "FAFCard3Image"
	FAFCard3Image:SetAlpha( 0.5, 0 )
	FAFCard3Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 214, _1080p * 285, _1080p * 15.88, _1080p * 86.88 )
	FAFCard3Image:SubscribeToModelThroughElement( self, "zombiesConsumables.cardSlot3Icon", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.zombiesConsumables.cardSlot3Icon:GetValue( f6_local1 )
		if f9_local0 ~= nil then
			FAFCard3Image:setImage( RegisterMaterial( f9_local0 ), 0 )
		end
	end )
	self:addElement( FAFCard3Image )
	self.FAFCard3Image = FAFCard3Image
	
	local FAFCard2Image = nil
	
	FAFCard2Image = LUI.UIImage.new()
	FAFCard2Image.id = "FAFCard2Image"
	FAFCard2Image:SetAlpha( 0.5, 0 )
	FAFCard2Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 149, _1080p * 220, _1080p * 15.88, _1080p * 86.88 )
	FAFCard2Image:SubscribeToModelThroughElement( self, "zombiesConsumables.cardSlot2Icon", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.zombiesConsumables.cardSlot2Icon:GetValue( f6_local1 )
		if f10_local0 ~= nil then
			FAFCard2Image:setImage( RegisterMaterial( f10_local0 ), 0 )
		end
	end )
	self:addElement( FAFCard2Image )
	self.FAFCard2Image = FAFCard2Image
	
	local FAFCard1Image = nil
	
	FAFCard1Image = LUI.UIImage.new()
	FAFCard1Image.id = "FAFCard1Image"
	FAFCard1Image:SetAlpha( 0.5, 0 )
	FAFCard1Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 83, _1080p * 155, _1080p * 15.88, _1080p * 86.88 )
	FAFCard1Image:SubscribeToModelThroughElement( self, "zombiesConsumables.cardSlot1Icon", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.zombiesConsumables.cardSlot1Icon:GetValue( f6_local1 )
		if f11_local0 ~= nil then
			FAFCard1Image:setImage( RegisterMaterial( f11_local0 ), 0 )
		end
	end )
	self:addElement( FAFCard1Image )
	self.FAFCard1Image = FAFCard1Image
	
	local topLineBacking = nil
	
	topLineBacking = LUI.UIImage.new()
	topLineBacking.id = "topLineBacking"
	topLineBacking:SetRGBFromInt( 0, 0 )
	topLineBacking:SetAlpha( 0.9, 0 )
	topLineBacking:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 416, 0, _1080p * 32 )
	self:addElement( topLineBacking )
	self.topLineBacking = topLineBacking
	
	local PlayercardBackrgoundBlur = nil
	
	PlayercardBackrgoundBlur = LUI.UIBlur.new()
	PlayercardBackrgoundBlur.id = "PlayercardBackrgoundBlur"
	PlayercardBackrgoundBlur:SetRGBFromTable( SWATCHES.Callouts.SmallPlayercardBackgroundGrey, 0 )
	PlayercardBackrgoundBlur:SetBlurStrength( 2.75, 0 )
	PlayercardBackrgoundBlur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1, _1080p * 119, _1080p * 75.5, _1080p * 192.5 )
	self:addElement( PlayercardBackrgoundBlur )
	self.PlayercardBackrgoundBlur = PlayercardBackrgoundBlur
	
	local Playercard = nil
	
	Playercard = LUI.UIImage.new()
	Playercard.id = "Playercard"
	Playercard:SetUseAA( true )
	Playercard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 118, _1080p * 416, _1080p * 75.5, _1080p * 192.5 )
	Playercard:SubscribeToModelThroughElement( self, "background", function ()
		local f12_local0 = self:GetDataSource()
		f12_local0 = f12_local0.background:GetValue( f6_local1 )
		if f12_local0 ~= nil then
			Playercard:setImage( RegisterMaterial( f12_local0 ), 0 )
		end
	end )
	self:addElement( Playercard )
	self.Playercard = Playercard
	
	local topLineAccent = nil
	
	topLineAccent = LUI.UIImage.new()
	topLineAccent.id = "topLineAccent"
	topLineAccent:SetRGBFromTable( SWATCHES.Lobby.memberClanText, 0 )
	topLineAccent:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 415, _1080p * 1, _1080p * 3 )
	self:addElement( topLineAccent )
	self.topLineAccent = topLineAccent
	
	local f6_local15 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f6_local15 = LUI.UIImage.new()
		f6_local15.id = "CPBackground"
		f6_local15:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
		f6_local15:setImage( RegisterMaterial( "cp_main_button_background" ), 0 )
		f6_local15:SetBlendMode( BLEND_MODE.addWithAlpha )
		f6_local15:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -36, _1080p * 440, _1080p * -4, _1080p * 37 )
		self:addElement( f6_local15 )
		self.CPBackground = f6_local15
	end
	local CPBackgroundCopyFlicker = nil
	
	CPBackgroundCopyFlicker = LUI.UIImage.new()
	CPBackgroundCopyFlicker.id = "CPBackgroundCopyFlicker"
	CPBackgroundCopyFlicker:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
	CPBackgroundCopyFlicker:setImage( RegisterMaterial( "cp_main_button_background" ), 0 )
	CPBackgroundCopyFlicker:SetBlendMode( BLEND_MODE.addWithAlpha )
	CPBackgroundCopyFlicker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -36, _1080p * 440, _1080p * -4, _1080p * 37 )
	self:addElement( CPBackgroundCopyFlicker )
	self.CPBackgroundCopyFlicker = CPBackgroundCopyFlicker
	
	local f6_local17 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f6_local17 = LUI.UIImage.new()
		f6_local17.id = "CPBackgroundGlow"
		f6_local17:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
		f6_local17:setImage( RegisterMaterial( "cp_main_button_glow" ), 0 )
		f6_local17:SetBlendMode( BLEND_MODE.blend )
		f6_local17:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 415, _1080p * 2, _1080p * 32 )
		self:addElement( f6_local17 )
		self.CPBackgroundGlow = f6_local17
	end
	local splat = nil
	
	splat = LUI.UIImage.new()
	splat.id = "splat"
	splat:SetScale( -0.45, 0 )
	splat:setImage( RegisterMaterial( "cp_main_button_blood_splatter" ), 0 )
	splat:SetBlendMode( BLEND_MODE.addWithAlpha )
	splat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -147, _1080p * 109, _1080p * -113.4, _1080p * 142.6 )
	self:addElement( splat )
	self.splat = splat
	
	local RankIcon = nil
	
	RankIcon = LUI.UIImage.new()
	RankIcon.id = "RankIcon"
	RankIcon:SetScale( 0.36, 0 )
	RankIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 7.03, _1080p * 37.74, _1080p * 37.4, _1080p * 67.4 )
	RankIcon:SubscribeToModelThroughElement( self, "rankIcon", function ()
		local f13_local0 = self:GetDataSource()
		f13_local0 = f13_local0.rankIcon:GetValue( f6_local1 )
		if f13_local0 ~= nil then
			RankIcon:setImage( RegisterMaterial( f13_local0 ), 0 )
		end
	end )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local Rank = nil
	
	Rank = LUI.UIText.new()
	Rank.id = "Rank"
	Rank:SetRGBFromInt( 14277081, 0 )
	Rank:SetFontSize( 24 * _1080p )
	Rank:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Rank:SetAlignment( LUI.Alignment.Left )
	Rank:SetOptOutRightToLeftAlignmentFlip( true )
	Rank:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 48.4, _1080p * 87.11, _1080p * 42.4, _1080p * 66.4 )
	Rank:SubscribeToModelThroughElement( self, "displayRank", function ()
		local f14_local0 = self:GetDataSource()
		f14_local0 = f14_local0.displayRank:GetValue( f6_local1 )
		if f14_local0 ~= nil then
			Rank:setText( f14_local0, 0 )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local Gamertag = nil
	
	Gamertag = LUI.UIText.new()
	Gamertag.id = "Gamertag"
	Gamertag:SetRGBFromInt( 14277081, 0 )
	Gamertag:setText( "WWWWWWWWWWWWWWWW", 0 )
	Gamertag:SetFontSize( 24 * _1080p )
	Gamertag:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	Gamertag:SetAlignment( LUI.Alignment.Left )
	Gamertag:SetOptOutRightToLeftAlignmentFlip( true )
	Gamertag:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 103.5, _1080p * 394.5, _1080p * 4, _1080p * 28 )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	local ClanTag = nil
	
	ClanTag = LUI.UIText.new()
	ClanTag.id = "ClanTag"
	ClanTag:SetRGBFromInt( 14277081, 0 )
	ClanTag:SetFontSize( 24 * _1080p )
	ClanTag:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	ClanTag:SetAlignment( LUI.Alignment.Left )
	ClanTag:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4.38, _1080p * 94.38, _1080p * 4, _1080p * 28 )
	ClanTag:SubscribeToModelThroughElement( self, "clanTag", function ()
		local f15_local0 = self:GetDataSource()
		f15_local0 = f15_local0.clanTag:GetValue( f6_local1 )
		if f15_local0 ~= nil then
			ClanTag:setText( f15_local0, 0 )
		end
	end )
	self:addElement( ClanTag )
	self.ClanTag = ClanTag
	
	local MicIcon = nil
	
	MicIcon = LUI.UIImage.new()
	MicIcon.id = "MicIcon"
	MicIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1, _1080p * -33, 0, _1080p * 32 )
	MicIcon:SubscribeToModelThroughElement( self, "microphoneAlpha", function ()
		local f16_local0 = self:GetDataSource()
		f16_local0 = f16_local0.microphoneAlpha:GetValue( f6_local1 )
		if f16_local0 ~= nil then
			MicIcon:SetAlpha( f16_local0, 0 )
		end
	end )
	MicIcon:SubscribeToModelThroughElement( self, "microphoneIcon", function ()
		local f17_local0 = self:GetDataSource()
		f17_local0 = f17_local0.microphoneIcon:GetValue( f6_local1 )
		if f17_local0 ~= nil then
			MicIcon:setImage( RegisterMaterial( f17_local0 ), 0 )
		end
	end )
	self:addElement( MicIcon )
	self.MicIcon = MicIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		if CONDITIONS.IsThirdGameMode( self ) then
			f6_local15:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPBackground:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		CPBackgroundCopyFlicker:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.CPBackgroundCopyFlicker:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f6_local17:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPBackgroundGlow:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		splat:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.splat:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f6_local15:AnimateSequence( "DefaultSequence" )
			end
			CPBackgroundCopyFlicker:AnimateSequence( "DefaultSequence" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f6_local17:AnimateSequence( "DefaultSequence" )
			end
			splat:AnimateSequence( "DefaultSequence" )
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f6_local15:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.CPBackground:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		CPBackgroundCopyFlicker:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.CPBackgroundCopyFlicker:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f6_local17:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.CPBackgroundGlow:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		splat:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.splat:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f6_local15:AnimateSequence( "ButtonUp" )
			end
			CPBackgroundCopyFlicker:AnimateSequence( "ButtonUp" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f6_local17:AnimateSequence( "ButtonUp" )
			end
			splat:AnimateSequence( "ButtonUp" )
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f6_local15:RegisterAnimationSequence( "ButtonOver", {
				{
					function ()
						return self.CPBackground:SetAlpha( 0, 0 )
					end,
					function ()
						return self.CPBackground:SetAlpha( 0.7, 260 )
					end
				}
			} )
		end
		CPBackgroundCopyFlicker:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.CPBackgroundCopyFlicker:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f6_local17:RegisterAnimationSequence( "ButtonOver", {
				{
					function ()
						return self.CPBackgroundGlow:SetAlpha( 0, 0 )
					end,
					function ()
						return self.CPBackgroundGlow:SetAlpha( 1, 260 )
					end
				}
			} )
		end
		splat:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.splat:SetAlpha( 0, 0 )
				end,
				function ()
					return self.splat:SetAlpha( 1, 260 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f6_local15:AnimateSequence( "ButtonOver" )
			end
			CPBackgroundCopyFlicker:AnimateSequence( "ButtonOver" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f6_local17:AnimateSequence( "ButtonOver" )
			end
			splat:AnimateSequence( "ButtonOver" )
		end
		
		Gamertag:RegisterAnimationSequence( "ShowRank", {
			{
				function ()
					return self.Gamertag:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 210, _1080p * -195, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		ClanTag:RegisterAnimationSequence( "ShowRank", {
			{
				function ()
					return self.ClanTag:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 100, _1080p * 190, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		self._sequences.ShowRank = function ()
			Gamertag:AnimateSequence( "ShowRank" )
			ClanTag:AnimateSequence( "ShowRank" )
		end
		
		Gamertag:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.Gamertag:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 127, _1080p * -278, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		ClanTag:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.ClanTag:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 17, _1080p * 107, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		self._sequences.HideRank = function ()
			Gamertag:AnimateSequence( "HideRank" )
			ClanTag:AnimateSequence( "HideRank" )
		end
		
		CPBackgroundCopyFlicker:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.CPBackgroundCopyFlicker:SetAlpha( 0.25, 0 )
				end,
				function ()
					return self.CPBackgroundCopyFlicker:SetAlpha( 0.5, 500 )
				end,
				function ()
					return self.CPBackgroundCopyFlicker:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.CPBackgroundCopyFlicker:SetAlpha( 0.25, 500 )
				end
			}
		} )
		self._sequences.Flicker = function ()
			CPBackgroundCopyFlicker:AnimateSequence( "Flicker" )
		end
		
	end
	
	self._animationSets.ThirdGameModeAnimationSet = function ()
		Background:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -192, 0, 0, 0 )
				end
			}
		} )
		Gamertag:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Gamertag:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 210, _1080p * -192, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Background:AnimateSequence( "DefaultSequence" )
			Gamertag:AnimateSequence( "DefaultSequence" )
		end
		
		Background:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Background:SetAlpha( 0.7, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Background:AnimateSequence( "ButtonUp" )
		end
		
		Background:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Background:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 0.95, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Background:AnimateSequence( "ButtonOver" )
		end
		
		Background:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -280, 0, 0, 0 )
				end
			}
		} )
		GenericButtonSelection:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.GenericButtonSelection:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 420, 0, _1080p * 32, 0 )
				end
			}
		} )
		RankIcon:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.RankIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		Rank:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.Rank:SetAlpha( 0, 0 )
				end
			}
		} )
		Gamertag:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.Gamertag:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 116, _1080p * -104, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		ClanTag:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.ClanTag:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 6, _1080p * 96, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		self._sequences.HideRank = function ()
			Background:AnimateSequence( "HideRank" )
			GenericButtonSelection:AnimateSequence( "HideRank" )
			RankIcon:AnimateSequence( "HideRank" )
			Rank:AnimateSequence( "HideRank" )
			Gamertag:AnimateSequence( "HideRank" )
			ClanTag:AnimateSequence( "HideRank" )
		end
		
		Background:RegisterAnimationSequence( "ButtonOverLAN", {
			{
				function ()
					return self.Background:SetAlpha( 0.95, 0 )
				end
			}
		} )
		RankIcon:RegisterAnimationSequence( "ButtonOverLAN", {
			{
				function ()
					return self.RankIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		Rank:RegisterAnimationSequence( "ButtonOverLAN", {
			{
				function ()
					return self.Rank:SetAlpha( 0, 0 )
				end
			}
		} )
		Gamertag:RegisterAnimationSequence( "ButtonOverLAN", {
			{
				function ()
					return self.Gamertag:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 116, _1080p * -104, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		ClanTag:RegisterAnimationSequence( "ButtonOverLAN", {
			{
				function ()
					return self.ClanTag:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 6, _1080p * 96, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		self._sequences.ButtonOverLAN = function ()
			Background:AnimateSequence( "ButtonOverLAN" )
			RankIcon:AnimateSequence( "ButtonOverLAN" )
			Rank:AnimateSequence( "ButtonOverLAN" )
			Gamertag:AnimateSequence( "ButtonOverLAN" )
			ClanTag:AnimateSequence( "ButtonOverLAN" )
		end
		
		Background:RegisterAnimationSequence( "ButtonUpLAN", {
			{
				function ()
					return self.Background:SetAlpha( 0.7, 0 )
				end
			}
		} )
		RankIcon:RegisterAnimationSequence( "ButtonUpLAN", {
			{
				function ()
					return self.RankIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		Rank:RegisterAnimationSequence( "ButtonUpLAN", {
			{
				function ()
					return self.Rank:SetAlpha( 0, 0 )
				end
			}
		} )
		Gamertag:RegisterAnimationSequence( "ButtonUpLAN", {
			{
				function ()
					return self.Gamertag:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 116, _1080p * -104, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		ClanTag:RegisterAnimationSequence( "ButtonUpLAN", {
			{
				function ()
					return self.ClanTag:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 6, _1080p * 96, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		self._sequences.ButtonUpLAN = function ()
			Background:AnimateSequence( "ButtonUpLAN" )
			RankIcon:AnimateSequence( "ButtonUpLAN" )
			Rank:AnimateSequence( "ButtonUpLAN" )
			Gamertag:AnimateSequence( "ButtonUpLAN" )
			ClanTag:AnimateSequence( "ButtonUpLAN" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f76_arg0, f76_arg1 )
		if #f76_arg0:getAllFocusedChildren() > 0 or f76_arg0:isInFocus() then
			f76_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "XBOXLIVE_PLAYER_MUTE" ),
				button_ref = "button_alt1",
				side = "left",
				priority = 100,
				clickable = true
			} )
		end
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:addEventHandler( "button_over", function ( f77_arg0, f77_arg1 )
		local f77_local0 = f77_arg1.controller or f6_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
		ACTIONS.AnimateSequence( self, "Flicker" )
	end )
	self:addEventHandler( "button_up", function ( f78_arg0, f78_arg1 )
		local f78_local0 = f78_arg1.controller or f6_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "gain_focus", function ( f79_arg0, f79_arg1 )
		local f79_local0 = f79_arg1.controller or f6_local1
		f79_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "XBOXLIVE_PLAYER_MUTE" ),
			button_ref = "button_alt1",
			side = "left",
			priority = 100,
			clickable = true
		} )
	end )
	self:addEventHandler( "lose_focus", function ( f80_arg0, f80_arg1 )
		local f80_local0 = f80_arg1.controller or f6_local1
		f80_arg0:RemoveButtonHelperText( "button_alt1", "left" )
		local f80_local1 = f80_arg0:getParent()
		while f80_local1 and not f80_local1.addButtonHelperFunction and f80_local1.id ~= f6_local2.id do
			f80_local1 = f80_local1:getParent()
		end
		if f80_local1 and f80_local1.addButtonHelperFunction then
			f80_local1.addButtonHelperFunction( f80_arg0, f80_arg1 )
		end
	end )
	PostLoadFunc( self, f6_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "CPLobbyMember", CPLobbyMember )
LockTable( _M )

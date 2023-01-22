local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0:GetDataSource()
	local f1_local1 = f1_arg0:isInFocus()
	if CONDITIONS.IsPC( f1_arg0 ) then
		local f1_local2 = f1_arg0:GetCurrentMenu()
		assert( f1_local2.Attachments )
		local f1_local3 = f1_local2.Attachments
		local f1_local4 = f1_local3:GetFocusPosition( LUI.DIRECTION.horizontal )
		if f1_local4 then
			local f1_local5 = f1_local3:GetElementAtPosition( 0, f1_local4 )
			if f1_local5 then
				local f1_local6 = f1_local5:GetDataSource()
				f1_local1 = f1_local6.index == 0
			end
		end
	end
	local f1_local2
	if f1_local0.index == 0 then
		local f1_local7 = f1_local1
		f1_local2 = f1_arg0.hasReticleData
	else
		f1_local2 = false
	end
	return f1_local2
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0:GetCurrentMenu()
	assert( f2_local0.BaseWeapons )
	assert( f2_local0.BaseWeapons:GetDataSource() )
	local f2_local1 = f2_local0.BaseWeapons:GetDataSource( f2_arg1 )
	return f2_local1.equippedDetails
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = f3_arg0:GetCurrentMenu()
	assert( f3_local0.Weapons )
	local f3_local1 = f3_local0.Weapons:GetDataSource( f3_arg2 )
	if not f3_local1 then
		local f3_local2 = f3_arg0:GetDataSource()
		return f3_local2.disabled:GetValue( f3_arg2 )
	else
		local f3_local2 = f3_local1.weapon
		return not Cac.DoesWeaponHaveAttachmentsByCategory( f3_local2.baseWeaponRef:GetValue( f3_arg2 ), f3_local2.weaponLootID:GetValue( f3_arg2 ), f3_arg2, Cac.GetCategoryBySlotIndex( f3_arg1 ) )
	end
end

function AnimateFramedAttachment( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = f4_arg0:GetDataSource()
	if not f4_local0 then
		return 
	end
	local f4_local1 = f4_local0.used:GetValue( f4_arg2 )
	local f4_local2 = f4_local0.weaponRef:GetValue( f4_arg2 )
	local f4_local3 = f4_local0.index + 1
	local f4_local4 = Cac.IsCPAttachmentSlotUnlocked( f4_local3, f4_local2, f4_arg2 )
	local f4_local5 = f0_local2( f4_arg0, f4_local0.index, f4_arg2 )
	local f4_local6
	if f4_local4 then
		f4_local6 = f4_local5
	else
		f4_local6 = true
	end
	f4_arg0.unlockLevel:SetAlpha( 0, 0 )
	f4_arg0.Lock:SetAlpha( 0, 0 )
	f4_arg0.LevelString:SetAlpha( 0, 0 )
	local f4_local7 = 0
	if f4_local3 == 2 then
		f4_local7 = 2
	elseif f4_local3 == 3 then
		f4_local7 = 4
	elseif f4_local3 == 4 then
		f4_local7 = 6
	elseif f4_local3 == 5 then
		f4_local7 = 8
	elseif f4_local3 == 6 then
		f4_local7 = 10
	end
	if f4_local6 then
		f4_arg0.unlockLevel:setText( ToUpperCase( f4_local7 ), 0 )
		f4_arg0.Lock:SetAlpha( 1, 0 )
		if not f4_local5 then
			f4_arg0.LevelString:SetAlpha( 1, 0 )
			f4_arg0.unlockLevel:SetAlpha( 1, 0 )
		end
	end
	local f4_local8 = nil
	if f4_arg1 then
		if f4_local6 then
			f4_local8 = "ButtonOverDisabled"
		elseif f4_local1 then
			f4_local8 = "ButtonOverInUse"
		else
			f4_local8 = "ButtonOverNotInUse"
		end
	elseif f4_local6 then
		f4_local8 = "Disabled"
	elseif f4_local1 then
		f4_local8 = "ButtonUpInUse"
	else
		f4_local8 = "ButtonUpNotInUse"
	end
	if f4_local8 and f4_arg0._currentSequence ~= f4_local8 then
		ACTIONS.AnimateSequence( f4_arg0, f4_local8 )
		f4_arg0._currentSequence = f4_local8
	end
end

function PostLoadFunc( f5_arg0, f5_arg1, f5_arg2 )
	f5_arg0:addEventHandler( "refresh_widget", function ( f6_arg0, f6_arg1 )
		ACTIONS.AnimateSequence( f6_arg0, "RefreshWidget" )
	end )
	f5_arg0:registerEventHandler( "button_over", function ( element, event )
		AnimateFramedAttachment( element, true, f5_arg1 )
	end )
	f5_arg0:registerEventHandler( "button_over_disable", function ( element, event )
		AnimateFramedAttachment( element, true, f5_arg1 )
	end )
	f5_arg0:registerEventHandler( "button_up", function ( element, event )
		AnimateFramedAttachment( element, false, f5_arg1 )
	end )
	f5_arg0:registerEventHandler( "button_disable", function ( element, event )
		AnimateFramedAttachment( element, false, f5_arg1 )
	end )
	f5_arg0:SubscribeToModelThroughElement( f5_arg0, "used", function ()
		AnimateFramedAttachment( f5_arg0, f5_arg0:isInFocus(), f5_arg1 )
	end )
	f5_arg0:registerEventHandler( "refresh_animate", function ()
		AnimateFramedAttachment( f5_arg0, f5_arg0:isInFocus(), f5_arg1 )
	end )
	local f5_local0 = function ()
		local f13_local0 = f5_arg0:GetCurrentMenu()
		local f13_local1 = LUI.FlowManager.GetScopedData( f13_local0 )
		if f13_local1.openedAttachmentEdit == true then
			local f13_local2 = ""
			if f0_local0( f5_arg0, f5_arg1 ) then
				f13_local2 = Engine.Localize( "LUA_MENU_MP_PERSONALIZE" )
			end
			f5_arg0:AddButtonHelperTextToElement( f13_local0.ButtonHelperBar, {
				helper_text = f13_local2,
				button_ref = "button_alt2",
				side = "left",
				clickable = true,
				priority = 1
			} )
		end
	end
	
	f5_arg0.hasReticleData = false
	local f5_local1 = function ()
		if f5_arg0:GetDataSource() then
			local f14_local0 = f5_arg0:GetDataSource()
			if f14_local0.ref then
				f14_local0 = f5_arg0:GetDataSource()
				f14_local0 = f14_local0.ref:GetValue( f5_arg1 )
				local f14_local1 = f0_local1( f5_arg0, f5_arg1 )
				f5_arg0.hasReticleData = Cac.HasReticleData( f14_local0, f14_local1.weaponRef:GetValue( f5_arg1 ), f14_local1.variantID:GetValue( f5_arg1 ) )
			end
		end
		f5_arg0.hasReticleData = false
	end
	
	f5_arg0:SubscribeToModelThroughElement( f5_arg0, "ref", f5_local1 )
	f5_arg0:addEventHandler( "gain_focus", function ()
		local f15_local0 = f5_arg0:GetDataSource()
		if f15_local0.index == 0 then
			f5_local1()
		end
		f5_local0()
	end )
	f5_arg0.bindButton:addEventHandler( "button_alt2", function ()
		if f0_local0( f5_arg0, f5_arg1 ) then
			local f16_local0 = LUI.FlowManager.GetScopedData( "CPWeaponSelect" )
			if f16_local0.openedAttachmentEdit then
				ClientWeapon.SetWeaponVisible( 0, false )
				Engine.PlaySound( "cp_ui_select_alt" )
				ACTIONS.OpenReticlePersonalizeMenu( f5_arg0, f5_arg1, f0_local1( f5_arg0, f5_arg1 ) )
			end
		end
	end )
	f5_arg0:addEventHandler( "button_action", function ( f17_arg0, f17_arg1 )
		if Engine.IsPC() then
			local f17_local0 = LUI.FlowManager.GetScopedData( "CPWeaponSelect" )
			if f17_local0 and not f17_local0.openedAttachmentEdit then
				f5_arg0:dispatchEventToCurrentMenu( {
					name = "open_attachment_selection"
				} )
				return 
			end
		end
		local f17_local0 = f17_arg0:GetCurrentMenu()
		assert( f17_local0.Weapons )
		assert( f17_local0.Weapons:GetDataSource() )
		local f17_local1 = f17_local0.Weapons:GetDataSource()
		local f17_local2 = WEAPON_BUILD.GetWeaponDataSourceForKey( f17_local1.weapon.baseWeaponRef:GetValue( f5_arg1 ), f5_arg1 )
		f17_local2.isProperty = false
		local f17_local3 = f17_arg0:GetDataSource()
		local f17_local4 = {
			currentWeaponDataSource = f17_local2,
			attachmentSlot = f17_local3.index
		}
		if Cac.IsCPAttachmentSlotUnlocked( f17_local3.index + 1, f17_local3.weaponRef:GetValue( f5_arg1 ), f5_arg1 ) and not f17_local3.disabled:GetValue( f5_arg1 ) then
			LUI.FlowManager.RequestAddMenu( "AttachmentSelect", true, f5_arg1, nil, f17_local4, true )
		end
	end )
	f5_arg0.bindButton:addEventHandler( "button_alt1", function ( f18_arg0, f18_arg1 )
		if Engine.IsPC() then
			local f18_local0 = LUI.FlowManager.GetScopedData( "CPWeaponSelect" )
			if f18_local0 and not f18_local0.openedAttachmentEdit then
				return false
			end
		end
		local f18_local0 = f18_arg1.controller or f5_arg1
		local f18_local1 = f18_arg0:getParent()
		if #f18_local1:getAllFocusedChildren() <= 0 then
			f18_local1 = f18_arg0:getParent()
			if f18_local1:isInFocus() then
			
			else
				return false
			end
		end
		Engine.PlaySound( "cp_ui_select_alt" )
		ACTIONS.OnClearAttachment( f5_arg0, f18_local0 )
		f5_local0()
		return true
	end )
	f5_arg0.AttachmentImage:SubscribeToModelThroughElement( f5_arg0, "icon", function ()
		local f19_local0 = f5_arg0:GetDataSource()
		f19_local0 = f19_local0.icon:GetValue( f5_arg1 )
		local f19_local1 = f5_arg0:GetDataSource()
		f19_local1 = f19_local1.attachmentUniqueDataSource:GetValue( f5_arg1 )
		if f19_local0 ~= nil and f19_local1 and f19_local1 ~= "none" then
			f5_arg0.AttachmentImage:setImage( RegisterMaterial( f19_local0 ), 0 )
		end
	end )
end

function WeaponAttachmentButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 160 * _1080p, 0, 120 * _1080p )
	self.id = "WeaponAttachmentButton"
	self._animationSets = {}
	self._sequences = {}
	local f20_local1 = controller and controller.controllerIndex
	if not f20_local1 and not Engine.InFrontend() then
		f20_local1 = self:getRootController()
	end
	assert( f20_local1 )
	local f20_local2 = self
	local HeaderBG = nil
	
	HeaderBG = LUI.UIImage.new()
	HeaderBG.id = "HeaderBG"
	HeaderBG:SetRGBFromInt( 0, 0 )
	HeaderBG:SetAlpha( 0.6, 0 )
	HeaderBG:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 4.5, _1080p * -5, _1080p * 5, _1080p * 28 )
	self:addElement( HeaderBG )
	self.HeaderBG = HeaderBG
	
	local f20_local4 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f20_local4 = LUI.UIImage.new()
		f20_local4.id = "CPBackground"
		f20_local4:SetAlpha( 0.8, 0 )
		f20_local4:setImage( RegisterMaterial( "cp_wepbuild_slot_off" ), 0 )
		f20_local4:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -62, _1080p * 62, _1080p * -38, _1080p * 38 )
		self:addElement( f20_local4 )
		self.CPBackground = f20_local4
	end
	local f20_local5 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f20_local5 = LUI.UIImage.new()
		f20_local5.id = "CPEdgeGlowLeft"
		f20_local5:SetAlpha( 0, 0 )
		f20_local5:setImage( RegisterMaterial( "cp_wepbuild_mainbox_on_glow" ), 0 )
		f20_local5:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -28, _1080p * 28, _1080p * -16, _1080p * 16 )
		self:addElement( f20_local5 )
		self.CPEdgeGlowLeft = f20_local5
	end
	local f20_local6 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f20_local6 = LUI.UIImage.new()
		f20_local6.id = "CPEdgeGlowRight"
		f20_local6:SetAlpha( 0, 0 )
		f20_local6:setImage( RegisterMaterial( "cp_wepbuild_mainbox_on_glow" ), 0 )
		f20_local6:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -28.5, _1080p * 27.5, _1080p * -16, _1080p * 16 )
		self:addElement( f20_local6 )
		self.CPEdgeGlowRight = f20_local6
	end
	local AttachmentImage = nil
	
	AttachmentImage = LUI.UIImage.new()
	AttachmentImage.id = "AttachmentImage"
	AttachmentImage:SetAlpha( 0, 0 )
	AttachmentImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -36.5, _1080p * 35.5, _1080p * -24, _1080p * 48 )
	self:addElement( AttachmentImage )
	self.AttachmentImage = AttachmentImage
	
	local f20_local8 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f20_local8 = LUI.UIText.new()
		f20_local8.id = "Name"
		f20_local8:SetAlpha( 0.6, 0 )
		f20_local8:SetFontSize( 16 * _1080p )
		f20_local8:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f20_local8:SetAlignment( LUI.Alignment.Center )
		f20_local8:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 5.5, _1080p * -5, _1080p * 8.5, _1080p * 24.5 )
		f20_local8:SubscribeToModelThroughElement( self, "name", function ()
			local f21_local0 = self:GetDataSource()
			f21_local0 = f21_local0.name:GetValue( f20_local1 )
			if f21_local0 ~= nil then
				f20_local8:setText( ToUpperCase( f21_local0 ), 0 )
			end
		end )
		self:addElement( f20_local8 )
		self.Name = f20_local8
	end
	local f20_local9 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f20_local9 = LUI.UIStyledText.new()
		f20_local9.id = "CPName"
		f20_local9:SetAlpha( 0.6, 0 )
		f20_local9:SetFontSize( 16 * _1080p )
		f20_local9:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f20_local9:SetAlignment( LUI.Alignment.Center )
		f20_local9:SetStartupDelay( 2000 )
		f20_local9:SetLineHoldTime( 400 )
		f20_local9:SetAnimMoveTime( 300 )
		f20_local9:SetEndDelay( 1500 )
		f20_local9:SetCrossfadeTime( 750 )
		f20_local9:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
		f20_local9:SetMaxVisibleLines( 1 )
		f20_local9:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 5.5, _1080p * -5, _1080p * 8.5, _1080p * 24.5 )
		f20_local9:SubscribeToModelThroughElement( self, "name", function ()
			local f22_local0 = self:GetDataSource()
			f22_local0 = f22_local0.name:GetValue( f20_local1 )
			if f22_local0 ~= nil then
				f20_local9:setText( ToUpperCase( f22_local0 ), 0 )
			end
		end )
		self:addElement( f20_local9 )
		self.CPName = f20_local9
	end
	local Lock = nil
	
	Lock = LUI.UIImage.new()
	Lock.id = "Lock"
	Lock:setImage( RegisterMaterial( "cp_wepbuild_lock" ), 0 )
	Lock:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 63.75, _1080p * 95.75, _1080p * 37.5, _1080p * 69.5 )
	self:addElement( Lock )
	self.Lock = Lock
	
	local unlockLevel = nil
	
	unlockLevel = LUI.UIText.new()
	unlockLevel.id = "unlockLevel"
	unlockLevel:setText( Engine.Localize( "MENU_NEW" ), 0 )
	unlockLevel:SetFontSize( 16 * _1080p )
	unlockLevel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	unlockLevel:SetAlignment( LUI.Alignment.Center )
	unlockLevel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 51.25, _1080p * 107.25, _1080p * 97, _1080p * 113 )
	self:addElement( unlockLevel )
	self.unlockLevel = unlockLevel
	
	local LevelString = nil
	
	LevelString = LUI.UIText.new()
	LevelString.id = "LevelString"
	LevelString:setText( Engine.Localize( "MENU_LEVEL_CAPS" ), 0 )
	LevelString:SetFontSize( 16 * _1080p )
	LevelString:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	LevelString:SetAlignment( LUI.Alignment.Center )
	LevelString:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 154.5, _1080p * 77, _1080p * 93 )
	self:addElement( LevelString )
	self.LevelString = LevelString
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		HeaderBG:RegisterAnimationSequence( "ButtonOverInUse", {
			{
				function ()
					return self.HeaderBG:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local4:RegisterAnimationSequence( "ButtonOverInUse", {
				{
					function ()
						return self.CPBackground:setImage( RegisterMaterial( "cp_wepbuild_slot_on" ), 0 )
					end
				},
				{
					function ()
						return self.CPBackground:SetAlpha( 0.8, 100 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local5:RegisterAnimationSequence( "ButtonOverInUse", {
				{
					function ()
						return self.CPEdgeGlowLeft:SetAlpha( 0.5, 250 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local6:RegisterAnimationSequence( "ButtonOverInUse", {
				{
					function ()
						return self.CPEdgeGlowRight:SetAlpha( 0.5, 250 )
					end
				}
			} )
		end
		AttachmentImage:RegisterAnimationSequence( "ButtonOverInUse", {
			{
				function ()
					return self.AttachmentImage:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.AttachmentImage:SetScale( 0.05, 100 )
				end
			}
		} )
		if not CONDITIONS.IsThirdGameMode( self ) then
			f20_local8:RegisterAnimationSequence( "ButtonOverInUse", {
				{
					function ()
						return self.Name:SetRGBFromInt( 0, 0 )
					end
				},
				{
					function ()
						return self.Name:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local9:RegisterAnimationSequence( "ButtonOverInUse", {
				{
					function ()
						return self.CPName:SetAlpha( 1, 0 )
					end
				},
				{
					function ()
						return self.CPName:SetRGBFromInt( 16777215, 0 )
					end
				}
			} )
		end
		self._sequences.ButtonOverInUse = function ()
			HeaderBG:AnimateSequence( "ButtonOverInUse" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local4:AnimateSequence( "ButtonOverInUse" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local5:AnimateSequence( "ButtonOverInUse" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local6:AnimateSequence( "ButtonOverInUse" )
			end
			AttachmentImage:AnimateSequence( "ButtonOverInUse" )
			if not CONDITIONS.IsThirdGameMode( self ) then
				f20_local8:AnimateSequence( "ButtonOverInUse" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local9:AnimateSequence( "ButtonOverInUse" )
			end
		end
		
		HeaderBG:RegisterAnimationSequence( "ButtonOverNotInUse", {
			{
				function ()
					return self.HeaderBG:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local4:RegisterAnimationSequence( "ButtonOverNotInUse", {
				{
					function ()
						return self.CPBackground:setImage( RegisterMaterial( "cp_wepbuild_slot_on" ), 0 )
					end
				},
				{
					function ()
						return self.CPBackground:SetAlpha( 0.8, 100 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local5:RegisterAnimationSequence( "ButtonOverNotInUse", {
				{
					function ()
						return self.CPEdgeGlowLeft:SetAlpha( 0.5, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local6:RegisterAnimationSequence( "ButtonOverNotInUse", {
				{
					function ()
						return self.CPEdgeGlowRight:SetAlpha( 0.5, 0 )
					end
				}
			} )
		end
		AttachmentImage:RegisterAnimationSequence( "ButtonOverNotInUse", {
			{
				function ()
					return self.AttachmentImage:SetAlpha( 0, 250 )
				end
			},
			{
				function ()
					return self.AttachmentImage:SetScale( 0.05, 250 )
				end
			}
		} )
		if not CONDITIONS.IsThirdGameMode( self ) then
			f20_local8:RegisterAnimationSequence( "ButtonOverNotInUse", {
				{
					function ()
						return self.Name:SetRGBFromInt( 16777215, 0 )
					end
				},
				{
					function ()
						return self.Name:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local9:RegisterAnimationSequence( "ButtonOverNotInUse", {
				{
					function ()
						return self.CPName:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.ButtonOverNotInUse = function ()
			HeaderBG:AnimateSequence( "ButtonOverNotInUse" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local4:AnimateSequence( "ButtonOverNotInUse" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local5:AnimateSequence( "ButtonOverNotInUse" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local6:AnimateSequence( "ButtonOverNotInUse" )
			end
			AttachmentImage:AnimateSequence( "ButtonOverNotInUse" )
			if not CONDITIONS.IsThirdGameMode( self ) then
				f20_local8:AnimateSequence( "ButtonOverNotInUse" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local9:AnimateSequence( "ButtonOverNotInUse" )
			end
		end
		
		HeaderBG:RegisterAnimationSequence( "ButtonUpInUse", {
			{
				function ()
					return self.HeaderBG:SetAlpha( 0.6, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local4:RegisterAnimationSequence( "ButtonUpInUse", {
				{
					function ()
						return self.CPBackground:setImage( RegisterMaterial( "cp_wepbuild_slot_off" ), 0 )
					end
				},
				{
					function ()
						return self.CPBackground:SetAlpha( 0.8, 100 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local5:RegisterAnimationSequence( "ButtonUpInUse", {
				{
					function ()
						return self.CPEdgeGlowLeft:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local6:RegisterAnimationSequence( "ButtonUpInUse", {
				{
					function ()
						return self.CPEdgeGlowRight:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		AttachmentImage:RegisterAnimationSequence( "ButtonUpInUse", {
			{
				function ()
					return self.AttachmentImage:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.AttachmentImage:SetScale( 0, 100 )
				end
			}
		} )
		if not CONDITIONS.IsThirdGameMode( self ) then
			f20_local8:RegisterAnimationSequence( "ButtonUpInUse", {
				{
					function ()
						return self.Name:SetAlpha( 0.6, 0 )
					end
				},
				{
					function ()
						return self.Name:SetRGBFromInt( 16777215, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local9:RegisterAnimationSequence( "ButtonUpInUse", {
				{
					function ()
						return self.CPName:SetAlpha( 0.6, 0 )
					end
				},
				{
					function ()
						return self.CPName:SetRGBFromInt( 16777215, 0 )
					end
				}
			} )
		end
		self._sequences.ButtonUpInUse = function ()
			HeaderBG:AnimateSequence( "ButtonUpInUse" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local4:AnimateSequence( "ButtonUpInUse" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local5:AnimateSequence( "ButtonUpInUse" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local6:AnimateSequence( "ButtonUpInUse" )
			end
			AttachmentImage:AnimateSequence( "ButtonUpInUse" )
			if not CONDITIONS.IsThirdGameMode( self ) then
				f20_local8:AnimateSequence( "ButtonUpInUse" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local9:AnimateSequence( "ButtonUpInUse" )
			end
		end
		
		HeaderBG:RegisterAnimationSequence( "ButtonUpNotInUse", {
			{
				function ()
					return self.HeaderBG:SetAlpha( 0.2, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local4:RegisterAnimationSequence( "ButtonUpNotInUse", {
				{
					function ()
						return self.CPBackground:setImage( RegisterMaterial( "cp_wepbuild_slot_off" ), 0 )
					end
				},
				{
					function ()
						return self.CPBackground:SetAlpha( 0.3, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local5:RegisterAnimationSequence( "ButtonUpNotInUse", {
				{
					function ()
						return self.CPEdgeGlowLeft:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local6:RegisterAnimationSequence( "ButtonUpNotInUse", {
				{
					function ()
						return self.CPEdgeGlowRight:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		AttachmentImage:RegisterAnimationSequence( "ButtonUpNotInUse", {
			{
				function ()
					return self.AttachmentImage:SetAlpha( 0, 200 )
				end
			},
			{
				function ()
					return self.AttachmentImage:SetScale( 0, 200 )
				end
			}
		} )
		if not CONDITIONS.IsThirdGameMode( self ) then
			f20_local8:RegisterAnimationSequence( "ButtonUpNotInUse", {
				{
					function ()
						return self.Name:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local9:RegisterAnimationSequence( "ButtonUpNotInUse", {
				{
					function ()
						return self.CPName:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.ButtonUpNotInUse = function ()
			HeaderBG:AnimateSequence( "ButtonUpNotInUse" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local4:AnimateSequence( "ButtonUpNotInUse" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local5:AnimateSequence( "ButtonUpNotInUse" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local6:AnimateSequence( "ButtonUpNotInUse" )
			end
			AttachmentImage:AnimateSequence( "ButtonUpNotInUse" )
			if not CONDITIONS.IsThirdGameMode( self ) then
				f20_local8:AnimateSequence( "ButtonUpNotInUse" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local9:AnimateSequence( "ButtonUpNotInUse" )
			end
		end
		
		HeaderBG:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.HeaderBG:SetAlpha( 0.4, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local4:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.CPBackground:setImage( RegisterMaterial( "cp_wepbuild_slot_off" ), 0 )
					end
				},
				{
					function ()
						return self.CPBackground:SetAlpha( 0.8, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local5:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.CPEdgeGlowLeft:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local6:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.CPEdgeGlowRight:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		AttachmentImage:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.AttachmentImage:SetAlpha( 0, 200 )
				end
			}
		} )
		if not CONDITIONS.IsThirdGameMode( self ) then
			f20_local8:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.Name:SetRGBFromInt( 16777215, 0 )
					end
				},
				{
					function ()
						return self.Name:SetAlpha( 0.6, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local9:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.CPName:SetRGBFromInt( 16777215, 0 )
					end
				},
				{
					function ()
						return self.CPName:SetAlpha( 0.6, 0 )
					end
				}
			} )
		end
		self._sequences.Disabled = function ()
			HeaderBG:AnimateSequence( "Disabled" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local4:AnimateSequence( "Disabled" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local5:AnimateSequence( "Disabled" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local6:AnimateSequence( "Disabled" )
			end
			AttachmentImage:AnimateSequence( "Disabled" )
			if not CONDITIONS.IsThirdGameMode( self ) then
				f20_local8:AnimateSequence( "Disabled" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local9:AnimateSequence( "Disabled" )
			end
		end
		
		HeaderBG:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.HeaderBG:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local4:RegisterAnimationSequence( "ButtonOverDisabled", {
				{
					function ()
						return self.CPBackground:setImage( RegisterMaterial( "cp_wepbuild_slot_on" ), 0 )
					end
				},
				{
					function ()
						return self.CPBackground:SetAlpha( 0.8, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local5:RegisterAnimationSequence( "ButtonOverDisabled", {
				{
					function ()
						return self.CPEdgeGlowLeft:SetAlpha( 0.5, 250 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local6:RegisterAnimationSequence( "ButtonOverDisabled", {
				{
					function ()
						return self.CPEdgeGlowRight:SetAlpha( 0.5, 250 )
					end
				}
			} )
		end
		AttachmentImage:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.AttachmentImage:SetAlpha( 0, 100 )
				end
			}
		} )
		if not CONDITIONS.IsThirdGameMode( self ) then
			f20_local8:RegisterAnimationSequence( "ButtonOverDisabled", {
				{
					function ()
						return self.Name:SetRGBFromInt( 0, 0 )
					end
				},
				{
					function ()
						return self.Name:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f20_local9:RegisterAnimationSequence( "ButtonOverDisabled", {
				{
					function ()
						return self.CPName:SetAlpha( 1, 0 )
					end
				},
				{
					function ()
						return self.CPName:SetRGBFromInt( 16777215, 0 )
					end
				}
			} )
		end
		self._sequences.ButtonOverDisabled = function ()
			HeaderBG:AnimateSequence( "ButtonOverDisabled" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local4:AnimateSequence( "ButtonOverDisabled" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local5:AnimateSequence( "ButtonOverDisabled" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local6:AnimateSequence( "ButtonOverDisabled" )
			end
			AttachmentImage:AnimateSequence( "ButtonOverDisabled" )
			if not CONDITIONS.IsThirdGameMode( self ) then
				f20_local8:AnimateSequence( "ButtonOverDisabled" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f20_local9:AnimateSequence( "ButtonOverDisabled" )
			end
		end
		
		self._sequences.RefreshWidget = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:addEventHandler( "button_over_disable", function ( f93_arg0, f93_arg1 )
		local f93_local0 = f93_arg1.controller or f20_local1
		ACTIONS.AnimateSequence( self, "ButtonOverInUse" )
	end )
	self:addEventHandler( "button_disable", function ( f94_arg0, f94_arg1 )
		local f94_local0 = f94_arg1.controller or f20_local1
		ACTIONS.AnimateSequence( self, "ButtonUpInUse" )
	end )
	PostLoadFunc( self, f20_local1, controller )
	return self
end

MenuBuilder.registerType( "WeaponAttachmentButton", WeaponAttachmentButton )
LockTable( _M )

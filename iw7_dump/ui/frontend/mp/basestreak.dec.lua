local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if IsSystemLink() then
		return false
	end
	local f1_local0 = f1_arg0:GetCurrentMenu()
	local f1_local1 = f1_arg0:GetDataSource( f1_arg1 )
	local f1_local2
	if not Engine.GetDvarBool( "killswitch_streak_variants" ) and f1_local1.variants:GetCountValue() > 1 and not f1_local0.showingVariants then
		f1_local2 = not CONDITIONS.UseLoadoutRestrictions()
	else
		f1_local2 = false
	end
	return f1_local2
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0:GetDataSource()
	f2_local0 = f2_local0.ref:GetValue( f2_arg1 )
	f2_arg0.progressionNew = Rewards.IsNew( f2_arg1, "killstreak", Engine.TableLookupGetRowNum( CSV.streakUnlockTable.file, CSV.streakUnlockTable.cols.ref, f2_local0 ) )
	local f2_local1 = CONDITIONS.AreLootStreaksEnabled()
	if f2_local1 then
		f2_local1 = LOOT.AreAnyLastLootItemsBaseStreak( f2_arg1, f2_local0 )
	end
	f2_arg0.lootNew = f2_local1
	if f2_arg0.progressionNew or f2_arg0.lootNew then
		f2_arg0.Base.NewItemNotification:SetAlpha( 1, 0 )
	else
		f2_arg0.Base.NewItemNotification:SetAlpha( 0, 0 )
	end
end

function PostLoadFunc( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg0.Base )
	assert( f3_arg0.Base.NewItemNotification )
	local self = LUI.UIBindButton.new()
	self.id = "bindButton"
	self:AlwaysEnabled( true )
	f3_arg0:addElement( self )
	self:addEventHandler( "button_alt2", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f4_arg0:getParent()
		if #f4_local0:getAllFocusedChildren() <= 0 then
			f4_local0 = f4_arg0:getParent()
			if f4_local0:isInFocus() then
			
			else
				return false
			end
		end
		if f0_local0( f3_arg0, f3_arg1 ) then
			f4_arg0:dispatchEventToCurrentMenu( {
				name = "show_variants"
			} )
			return true
		end
		return false
	end )
	if CONDITIONS.UseCACBreadCrumbs() then
		f3_arg0:SubscribeToModelThroughElement( f3_arg0, "ref", function ()
			f0_local1( f3_arg0, f3_arg1 )
		end )
		f3_arg0:addEventHandler( "update_loot_item_new", function ( f6_arg0, f6_arg1 )
			if f6_arg0 and f6_arg0:GetDataSource() then
				local f6_local0 = f6_arg0:GetDataSource()
				if f6_local0.ref then
					f6_local0 = f6_arg0:GetDataSource()
					f6_local0 = f6_local0.ref:GetValue( f3_arg1 )
					if f6_arg1.baseStreak == f6_local0 and not f6_arg0.progressionNew then
						local f6_local1 = CONDITIONS.AreLootStreaksEnabled()
						if f6_local1 then
							f6_local1 = LOOT.AreAnyLastLootItemsBaseStreak( f3_arg1, f6_local0 )
						end
						f6_arg0.lootNew = f6_local1
						if f6_arg0.lootNew then
							f3_arg0.Base.NewItemNotification:SetAlpha( 1, 0 )
						else
							f3_arg0.Base.NewItemNotification:SetAlpha( 0, 0 )
						end
					end
				end
			end
		end )
		f3_arg0:addEventHandler( "lose_focus", function ( f7_arg0, f7_arg1 )
			local f7_local0 = LUI.FlowManager.GetScopedData( f7_arg0 )
			local f7_local1 = f7_local0.currentBaseStreak
			if not f7_local1 then
				return 
			end
			local f7_local2 = Engine.TableLookupGetRowNum( CSV.streakUnlockTable.file, CSV.streakUnlockTable.cols.ref, f7_local1 )
			if Rewards.IsNew( f3_arg1, "killstreak", f7_local2 ) then
				Rewards.ClearNew( f3_arg1, "killstreak", f7_local2 )
				f0_local1( f3_arg0, f3_arg1 )
			end
		end )
		f3_arg0:addEventHandler( "gain_focus", function ( f8_arg0, f8_arg1 )
			local f8_local0 = LUI.FlowManager.GetScopedData( f8_arg0 )
			local f8_local1 = f3_arg0:GetDataSource()
			f8_local0.currentBaseStreak = f8_local1.ref:GetValue( f3_arg1 )
		end )
	end
	f3_arg0.lastAnimationButtonPlayed = "none"
	f3_arg0:addEventHandler( "button_over", function ( f9_arg0, f9_arg1 )
		local f9_local0 = "Rollover"
		if f3_arg0.lastAnimationButtonPlayed ~= f9_local0 then
			local f9_local1 = f9_arg1.controller or f3_arg1
			ACTIONS.AnimateSequenceByElement( f3_arg0, {
				elementName = "Base",
				sequenceName = f9_local0,
				elementPath = "Base"
			} )
			f3_arg0.lastAnimationButtonPlayed = f9_local0
		end
	end )
	f3_arg0:addEventHandler( "button_up", function ( f10_arg0, f10_arg1 )
		local f10_local0 = "Rollout"
		if f3_arg0.lastAnimationButtonPlayed ~= f10_local0 then
			local f10_local1 = f10_arg1.controller or f3_arg1
			ACTIONS.AnimateSequenceByElement( f3_arg0, {
				elementName = "Base",
				sequenceName = f10_local0,
				elementPath = "Base"
			} )
			f3_arg0.lastAnimationButtonPlayed = f10_local0
		end
	end )
	f3_arg0:addEventHandler( "button_disable", function ( f11_arg0, f11_arg1 )
		local f11_local0 = "Disabled_Rollout"
		if f3_arg0.lastAnimationButtonPlayed ~= f11_local0 then
			local f11_local1 = f11_arg1.controller or f3_arg1
			ACTIONS.AnimateSequenceByElement( f3_arg0, {
				elementName = "Base",
				sequenceName = f11_local0,
				elementPath = "Base"
			} )
			f3_arg0.lastAnimationButtonPlayed = f11_local0
		end
	end )
	f3_arg0:addEventHandler( "button_over_disable", function ( f12_arg0, f12_arg1 )
		local f12_local0 = "Disabled_Rollover"
		if f3_arg0.lastAnimationButtonPlayed ~= f12_local0 then
			local f12_local1 = f12_arg1.controller or f3_arg1
			ACTIONS.AnimateSequenceByElement( f3_arg0, {
				elementName = "Base",
				sequenceName = f12_local0,
				elementPath = "Base"
			} )
			f3_arg0.lastAnimationButtonPlayed = f12_local0
		end
	end )
	assert( f3_arg0.VariantPrompt )
	assert( f3_arg0.VariantsButton )
	local f3_local1 = function ()
		local f13_local0 = Engine.IsGamepadEnabled() == 1
		f3_arg0.VariantPrompt:SetAlpha( 0 )
		f3_arg0.VariantsButton:SetAlpha( 0 )
		f3_arg0.VariantsButton:SetHandleMouse( not f13_local0 )
		f3_arg0.VariantPrompt:setText( Engine.Localize( "LUA_MENU_PAD_ALT2_BUTTON" ) )
		f3_arg0:SetHandleMouseButton( true )
	end
	
	f3_arg0:addEventHandler( "refresh_button_helper", f3_local1 )
	f3_local1()
	local f3_local2 = function ( f14_arg0 )
		f3_arg0:SetHandleMouseButton( true )
		local f14_local0 = f3_arg0:isInFocus()
		if f14_local0 then
			f14_local0 = Engine.IsGamepadEnabled() ~= 1
		end
		local f14_local1 = f14_arg0
		local f14_local2 = f14_arg0.SetAlpha
		local f14_local3
		if f14_local0 then
			f14_local3 = 0.6
			if not f14_local3 then
			
			else
				f14_local2( f14_local1, f14_local3 )
			end
		end
		f14_local3 = 0
	end
	
	f3_arg0.VariantsButton:addEventHandler( "button_up", f3_local2 )
	f3_arg0.VariantsButton:addEventHandler( "button_disable", f3_local2 )
	local f3_local3 = function ( f15_arg0 )
		if f15_arg0:isInFocus() and not (Engine.IsGamepadEnabled() == 1) then
			f3_arg0:SetHandleMouseButton( false )
			f15_arg0:SetAlpha( 1 )
		end
	end
	
	f3_arg0.VariantsButton:addEventHandler( "button_over", f3_local3 )
	f3_arg0.VariantsButton:addEventHandler( "button_over_disable", f3_local3 )
	f3_arg0.VariantsButton:addEventHandler( "leftmouseup", function ( f16_arg0 )
		if f16_arg0:isInFocus() then
			f16_arg0:dispatchEventToCurrentMenu( {
				name = "show_variants"
			} )
		end
	end )
	f3_arg0:addEventHandler( "gain_focus", function ( f17_arg0, f17_arg1 )
		if f0_local0( f3_arg0, f3_arg1 ) then
			local f17_local0 = Engine.IsGamepadEnabled() == 1
			local f17_local1 = f3_arg0.VariantsButton
			local f17_local2 = f17_local1
			f17_local1 = f17_local1.SetAlpha
			local f17_local3
			if f17_local0 then
				f17_local3 = 0
				if not f17_local3 then
				
				else
					f17_local1( f17_local2, f17_local3 )
					f17_local1 = f3_arg0.VariantPrompt
					f17_local2 = f17_local1
					f17_local1 = f17_local1.SetAlpha
					if f17_local0 then
						f17_local3 = 1
						if not f17_local3 then
						
						else
							f17_local1( f17_local2, f17_local3 )
						end
					end
					f17_local3 = 0
				end
			end
			f17_local3 = 0.6
		end
	end )
	f3_arg0:addEventHandler( "lose_focus", function ( f18_arg0, f18_arg1 )
		f3_arg0.VariantsButton:SetAlpha( 0 )
		f3_arg0.VariantPrompt:SetAlpha( 0 )
	end )
	self:addEventHandler( "button_alt1", function ( f19_arg0, f19_arg1 )
		local f19_local0 = f19_arg0:getParent()
		if #f19_local0:getAllFocusedChildren() <= 0 then
			f19_local0 = f19_arg0:getParent()
			if f19_local0:isInFocus() then
				f19_local0 = f3_arg0:GetCurrentMenu()
				if not f19_local0.showingVariants then
					ACTIONS.PlaySoundSetSound( f3_arg0, "selectAlt", false )
					local f19_local1 = f19_local0.squadMemberDataSource
					local f19_local2 = f3_arg0:GetDataSource()
					local f19_local3 = Cac.GetStreakIndexIfEquipped( f19_local1, f3_arg1, f19_local2.streak.baseStreakRef:GetValue( f3_arg1 ) )
					if f19_local3 then
						Cac.ClearStreakSlot( f19_local1, f3_arg1, f19_local3, f19_local0.statsGroupDataSource, true )
						f19_local0.BaseStreaks:RefreshContent()
					end
					return true
				end
			end
			return false
		end
		f19_local0 = f3_arg0:GetCurrentMenu()
		if not f19_local0.showingVariants then
			ACTIONS.PlaySoundSetSound( f3_arg0, "selectAlt", false )
			local f19_local1 = f19_local0.squadMemberDataSource
			local f19_local2 = f3_arg0:GetDataSource()
			local f19_local3 = Cac.GetStreakIndexIfEquipped( f19_local1, f3_arg1, f19_local2.streak.baseStreakRef:GetValue( f3_arg1 ) )
			if f19_local3 then
				Cac.ClearStreakSlot( f19_local1, f3_arg1, f19_local3, f19_local0.statsGroupDataSource, true )
				f19_local0.BaseStreaks:RefreshContent()
			end
			return true
		end
	end )
	f3_arg0:addEventHandler( "button_action", function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg0:GetCurrentMenu()
		local f20_local1 = f20_arg0:GetDataSource()
		if not Cac.GetStreakIndexIfEquipped( f20_local0.squadMemberDataSource, f3_arg1, f20_local1.streak.baseStreakRef:GetValue( f3_arg1 ) ) then
			ACTIONS.OnSelectStreak( f3_arg0, f3_arg1 )
		end
	end )
	assert( f3_arg0.Base.Name )
	if IsLanguageOversizedFont() then
		f3_arg0.Base.Name:SetTop( _1080p * 5, 0 )
		f3_arg0.Base.Name:SetBottom( _1080p * 19, 0 )
	end
end

function BaseStreak( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 150 * _1080p, 0, 150 * _1080p )
	self.id = "BaseStreak"
	self._animationSets = {}
	self._sequences = {}
	local f21_local1 = controller and controller.controllerIndex
	if not f21_local1 and not Engine.InFrontend() then
		f21_local1 = self:getRootController()
	end
	assert( f21_local1 )
	local f21_local2 = self
	self:SubscribeToModelThroughElement( self, "isDisabled", function ()
		local f22_local0 = self:GetDataSource()
		f22_local0 = f22_local0.isDisabled:GetValue( f21_local1 )
		if f22_local0 ~= nil then
			self:SetButtonDisabled( f22_local0 )
		end
	end )
	local SelectedBackground = nil
	
	SelectedBackground = LUI.UIImage.new()
	SelectedBackground.id = "SelectedBackground"
	SelectedBackground:SetRGBFromInt( 0, 0 )
	self:addElement( SelectedBackground )
	self.SelectedBackground = SelectedBackground
	
	local Base = nil
	Base = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f21_local1
	} )
	Base.id = "Base"
	Base.Image:SetLeft( _1080p * -50, 0 )
	Base.Image:SetRight( _1080p * 50, 0 )
	Base.Image:SetTop( _1080p * -111, 0 )
	Base.Image:SetBottom( _1080p * -11, 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.Level:setText( "", 0 )
	end
	Base.Name:SetAlignment( LUI.Alignment.Center )
	Base:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	Base:SubscribeToModelThroughElement( self, "streak.image", function ()
		local f23_local0 = self:GetDataSource()
		f23_local0 = f23_local0.streak.image:GetValue( f21_local1 )
		if f23_local0 ~= nil then
			Base.Image:setImage( RegisterMaterial( f23_local0 ), 0 )
		end
	end )
	Base:SubscribeToModelThroughElement( self, "streak.name", function ()
		local f24_local0 = self:GetDataSource()
		f24_local0 = f24_local0.streak.name:GetValue( f21_local1 )
		if f24_local0 ~= nil then
			Base.Name:setText( f24_local0, 0 )
		end
	end )
	self:addElement( Base )
	self.Base = Base
	
	local StreakUnlocked = nil
	
	StreakUnlocked = MenuBuilder.BuildRegisteredType( "StreakUnlocked", {
		controllerIndex = f21_local1
	} )
	StreakUnlocked.id = "StreakUnlocked"
	StreakUnlocked:SetAlpha( 0, 0 )
	StreakUnlocked:SetDataSourceThroughElement( self, "streak" )
	StreakUnlocked:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -30, 0, _1080p * -30, _1080p * -2 )
	self:addElement( StreakUnlocked )
	self.StreakUnlocked = StreakUnlocked
	
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f21_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon.IconShadow:SetAlpha( 0.2, 0 )
	QualityIcon:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 8, _1080p * 40, _1080p * -35, _1080p * -3 )
	QualityIcon:SubscribeToModelThroughElement( self, "streak.qualityImage", function ()
		local f25_local0 = self:GetDataSource()
		f25_local0 = f25_local0.streak.qualityImage:GetValue( f21_local1 )
		if f25_local0 ~= nil then
			QualityIcon.IconShadow:setImage( RegisterMaterial( f25_local0 ), 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "streak.qualityColor", function ()
		local f26_local0 = self:GetDataSource()
		f26_local0 = f26_local0.streak.qualityColor:GetValue( f21_local1 )
		if f26_local0 ~= nil then
			QualityIcon.Icon:SetRGBFromInt( f26_local0, 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "streak.qualityImage", function ()
		local f27_local0 = self:GetDataSource()
		f27_local0 = f27_local0.streak.qualityImage:GetValue( f21_local1 )
		if f27_local0 ~= nil then
			QualityIcon.Icon:setImage( RegisterMaterial( f27_local0 ), 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "streak.qualityColor", function ()
		local f28_local0 = self:GetDataSource()
		f28_local0 = f28_local0.streak.qualityColor:GetValue( f21_local1 )
		if f28_local0 ~= nil then
			QualityIcon.IconDuplicate:SetRGBFromInt( f28_local0, 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "streak.qualityImage", function ()
		local f29_local0 = self:GetDataSource()
		f29_local0 = f29_local0.streak.qualityImage:GetValue( f21_local1 )
		if f29_local0 ~= nil then
			QualityIcon.IconDuplicate:setImage( RegisterMaterial( f29_local0 ), 0 )
		end
	end )
	self:addElement( QualityIcon )
	self.QualityIcon = QualityIcon
	
	local VariantPrompt = nil
	
	VariantPrompt = LUI.UIText.new()
	VariantPrompt.id = "VariantPrompt"
	VariantPrompt:setText( Engine.Localize( "LUA_MENU_PAD_ALT2_BUTTON" ), 0 )
	VariantPrompt:SetFontSize( 20 * _1080p )
	VariantPrompt:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	VariantPrompt:SetAlignment( LUI.Alignment.Right )
	VariantPrompt:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 108, _1080p * 140, _1080p * 38, _1080p * 58 )
	self:addElement( VariantPrompt )
	self.VariantPrompt = VariantPrompt
	
	local VariantsButton = nil
	
	VariantsButton = MenuBuilder.BuildRegisteredType( "VariantsButton", {
		controllerIndex = f21_local1
	} )
	VariantsButton.id = "VariantsButton"
	VariantsButton:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -33, _1080p * -5, _1080p * 34, _1080p * 62 )
	self:addElement( VariantsButton )
	self.VariantsButton = VariantsButton
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.ButtonDisabled = function ()
			
		end
		
		self._sequences.ButtonOverDisabled = function ()
			
		end
		
		self._sequences.ButtonOverVariant = function ()
			
		end
		
		QualityIcon:RegisterAnimationSequence( "ShowQuality", {
			{
				function ()
					return self.QualityIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowQuality = function ()
			QualityIcon:AnimateSequence( "ShowQuality" )
		end
		
		QualityIcon:RegisterAnimationSequence( "HideQuality", {
			{
				function ()
					return self.QualityIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideQuality = function ()
			QualityIcon:AnimateSequence( "HideQuality" )
		end
		
		SelectedBackground:RegisterAnimationSequence( "ShowSelected", {
			{
				function ()
					return self.SelectedBackground:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowSelected = function ()
			SelectedBackground:AnimateSequence( "ShowSelected" )
		end
		
		SelectedBackground:RegisterAnimationSequence( "HideSelected", {
			{
				function ()
					return self.SelectedBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideSelected = function ()
			SelectedBackground:AnimateSequence( "HideSelected" )
		end
		
		Base:RegisterAnimationSequence( "ImageDisabled", {
			{
				function ()
					return self.Base.Image:SetAlpha( 0.3, 0 )
				end
			}
		} )
		self._sequences.ImageDisabled = function ()
			Base:AnimateSequence( "ImageDisabled" )
		end
		
		Base:RegisterAnimationSequence( "ImageEnabled", {
			{
				function ()
					return self.Base.Image:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ImageEnabled = function ()
			Base:AnimateSequence( "ImageEnabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	QualityIcon:SubscribeToModelThroughElement( self, "streak.quality", function ()
		local f47_local0 = self:GetDataSource()
		if f47_local0.streak.quality:GetValue( f21_local1 ) ~= nil then
			f47_local0 = self:GetDataSource()
			if f47_local0.streak.quality:GetValue( f21_local1 ) == 0 then
				ACTIONS.AnimateSequence( self, "HideQuality" )
			end
		end
		f47_local0 = self:GetDataSource()
		if f47_local0.streak.quality:GetValue( f21_local1 ) ~= nil then
			f47_local0 = self:GetDataSource()
			if f47_local0.streak.quality:GetValue( f21_local1 ) ~= 0 then
				ACTIONS.AnimateSequence( self, "ShowQuality" )
			end
		end
	end )
	StreakUnlocked:SetDataSourceThroughElement( self, "streak" )
	self:SubscribeToModelThroughElement( self, "isSelected", function ()
		local f48_local0 = self:GetDataSource()
		if f48_local0.isSelected:GetValue( f21_local1 ) ~= nil then
			f48_local0 = self:GetDataSource()
			if f48_local0.isSelected:GetValue( f21_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Message",
					sequenceName = "Activate",
					elementPath = "Base.Message"
				} )
				ACTIONS.AnimateSequence( self, "ShowSelected" )
			end
		end
		f48_local0 = self:GetDataSource()
		if f48_local0.isSelected:GetValue( f21_local1 ) ~= nil then
			f48_local0 = self:GetDataSource()
			if f48_local0.isSelected:GetValue( f21_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Message",
					sequenceName = "Inactive",
					elementPath = "Base.Message"
				} )
				ACTIONS.AnimateSequence( self, "HideSelected" )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "streak.isUnlocked", function ()
		local f49_local0 = self:GetDataSource()
		if f49_local0.streak.isUnlocked:GetValue( f21_local1 ) ~= nil then
			f49_local0 = self:GetDataSource()
			if f49_local0.streak.isUnlocked:GetValue( f21_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Base",
					sequenceName = "Locked",
					elementPath = "Base"
				} )
			end
		end
	end )
	local f21_local9 = function ()
		local f50_local0 = self:GetDataSource()
		if f50_local0.isDisabled:GetValue( f21_local1 ) ~= nil then
			f50_local0 = self:GetDataSource()
			if f50_local0.isDisabled:GetValue( f21_local1 ) == true then
				f50_local0 = self:GetDataSource()
				if f50_local0.streak.isUnlocked:GetValue( f21_local1 ) ~= nil then
					f50_local0 = self:GetDataSource()
					if f50_local0.streak.isUnlocked:GetValue( f21_local1 ) == true then
						ACTIONS.AnimateSequence( self, "ImageDisabled" )
					end
				end
			end
		end
		f50_local0 = self:GetDataSource()
		if f50_local0.isDisabled:GetValue( f21_local1 ) ~= nil then
			f50_local0 = self:GetDataSource()
			if f50_local0.isDisabled:GetValue( f21_local1 ) == false then
				f50_local0 = self:GetDataSource()
				if f50_local0.streak.isUnlocked:GetValue( f21_local1 ) ~= nil then
					f50_local0 = self:GetDataSource()
					if f50_local0.streak.isUnlocked:GetValue( f21_local1 ) == true then
						ACTIONS.AnimateSequence( self, "ImageEnabled" )
					end
				end
			end
		end
	end
	
	self:SubscribeToModelThroughElement( self, "isDisabled", f21_local9 )
	self:SubscribeToModelThroughElement( self, "streak.isUnlocked", f21_local9 )
	PostLoadFunc( self, f21_local1, controller )
	return self
end

MenuBuilder.registerType( "BaseStreak", BaseStreak )
LockTable( _M )

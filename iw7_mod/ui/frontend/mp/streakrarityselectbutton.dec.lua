local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.StreakImage:SetMask( f1_arg0.Mask )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "isDisabled", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		local f2_local1 = f2_local0.isDisabled:GetValue( f1_arg1 )
		local f2_local2 = f2_local0.streak.isBase
		local f2_local3 = f2_local0.streak.baseStreakRef:GetValue( f1_arg1 )
		local f2_local4 = f2_local0.streak.isOwned
		if f2_local1 then
			if f2_local2 or f2_local4 then
				f1_arg0.UnlockCriteria.UnlockDesc:setText( GetStreakUnlockText( f2_local3 ) )
			else
				f1_arg0.UnlockCriteria.UnlockDesc:setText( Engine.Localize( "LUA_MENU_MP_ARMORY_STREAK_UNLOCK_MSG" ) )
			end
		end
		if f1_arg0:IsDisabled() == true ~= f2_local1 then
			f1_arg0:SetButtonDisabled( f2_local1 )
			if f2_local1 then
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "UnlockCriteria",
					sequenceName = "Visible",
					elementPath = "UnlockCriteria"
				} )
			else
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "UnlockCriteria",
					sequenceName = "Hidden",
					elementPath = "UnlockCriteria"
				} )
			end
		end
	end )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "isSelected", function ()
		local f3_local0 = f1_arg0:GetDataSource()
		local f3_local1
		if f3_local0.isSelected:GetValue( f1_arg1 ) then
			f3_local1 = 1
			if not f3_local1 then
			
			else
				f1_arg0.SelectedTag:SetAlpha( f3_local1, 0 )
			end
		end
		f3_local1 = 0
	end )
	f1_arg0:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f4_arg0:GetCurrentMenu()
		ACTIONS.OnSelectStreak( f1_arg0, f1_arg1, function ()
			f4_local0.showingVariants = false
			f4_arg0:dispatchEventToCurrentMenu( {
				name = "hide_variants"
			} )
		end )
	end )
	if CONDITIONS.UseCACBreadCrumbs() then
		assert( f1_arg0.NewItemNotification )
		f1_arg0:SubscribeToModelThroughElement( f1_arg0, "streak.ref", function ()
			local f6_local0 = f1_arg0:GetDataSource()
			if Loot.IsNew( f1_arg1, f6_local0.streak.lootID:GetValue( f1_arg1 ) ) then
				f1_arg0.NewItemNotification:SetAlpha( 1, 0 )
			else
				f1_arg0.NewItemNotification:SetAlpha( 0, 0 )
			end
		end )
		f1_arg0:addEventHandler( "lose_focus", function ( f7_arg0, f7_arg1 )
			if f7_arg0:GetDataSource() then
				local f7_local0 = f7_arg0:GetDataSource()
				f7_local0 = f7_local0.streak.lootID:GetValue( f1_arg1 )
				if Loot.IsNew( f1_arg1, f7_local0 ) and f7_local0 ~= Cac.LootIDNoneValue then
					Loot.ClearNew( f1_arg1, f7_local0 )
					f7_arg0.NewItemNotification:SetAlpha( 0, 0 )
					f7_arg0:dispatchEventToCurrentMenu( {
						name = "update_loot_item_new",
						lootItemID = f7_local0,
						baseStreak = Engine.TableLookup( CSV.streakLootMaster.file, CSV.streakLootMaster.cols.index, f7_local0, CSV.streakLootMaster.cols.baseStreak )
					} )
				end
			end
		end )
	end
end

function StreakRaritySelectButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 426 * _1080p, 0, 125 * _1080p )
	self.id = "StreakRaritySelectButton"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	Border:SetRGBFromInt( 0, 0 )
	Border:SetAlpha( 0.1, 0 )
	Border:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 640, 0, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local GenericItemBackground = nil
	
	GenericItemBackground = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f8_local1
	} )
	GenericItemBackground.id = "GenericItemBackground"
	GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericItemBackground )
	self.GenericItemBackground = GenericItemBackground
	
	local StreakDescription = nil
	
	StreakDescription = LUI.UIStyledText.new()
	StreakDescription.id = "StreakDescription"
	StreakDescription:SetAlpha( 0, 0 )
	StreakDescription:SetFontSize( 18 * _1080p )
	StreakDescription:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	StreakDescription:SetAlignment( LUI.Alignment.Left )
	StreakDescription:SetStartupDelay( 1000 )
	StreakDescription:SetLineHoldTime( 400 )
	StreakDescription:SetAnimMoveTime( 150 )
	StreakDescription:SetEndDelay( 1000 )
	StreakDescription:SetCrossfadeTime( 400 )
	StreakDescription:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	StreakDescription:SetMaxVisibleLines( 3 )
	StreakDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 336, _1080p * 598, _1080p * 31.5, _1080p * 49.5 )
	StreakDescription:SubscribeToModelThroughElement( self, "streak.desc", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.streak.desc:GetValue( f8_local1 )
		if f9_local0 ~= nil then
			StreakDescription:setText( f9_local0, 0 )
		end
	end )
	self:addElement( StreakDescription )
	self.StreakDescription = StreakDescription
	
	local Mask = nil
	
	Mask = LUI.UIImage.new()
	Mask.id = "Mask"
	Mask:setImage( RegisterMaterial( "wdg_large_mask" ), 0 )
	Mask:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( Mask )
	self.Mask = Mask
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f8_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local UnlockCriteria = nil
	
	UnlockCriteria = MenuBuilder.BuildRegisteredType( "UnlockCriteria", {
		controllerIndex = f8_local1
	} )
	UnlockCriteria.id = "UnlockCriteria"
	UnlockCriteria:SetAlpha( 0, 0 )
	UnlockCriteria.UnlockDesc:SetRight( _1080p * 300, 0 )
	UnlockCriteria.UnlockDesc:setText( "", 0 )
	UnlockCriteria:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 320, _1080p * 603, _1080p * 58.5, _1080p * 90.5 )
	self:addElement( UnlockCriteria )
	self.UnlockCriteria = UnlockCriteria
	
	local UnlockIcon = nil
	
	UnlockIcon = LUI.UIImage.new()
	UnlockIcon.id = "UnlockIcon"
	UnlockIcon:SetAlpha( 0, 0 )
	UnlockIcon:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	UnlockIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 320, _1080p * 352, _1080p * -4, _1080p * 28 )
	self:addElement( UnlockIcon )
	self.UnlockIcon = UnlockIcon
	
	local f8_local10 = nil
	if CONDITIONS.UseCACBreadCrumbs( self ) then
		f8_local10 = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
			controllerIndex = f8_local1
		} )
		f8_local10.id = "NewItemNotification"
		f8_local10:SetAlpha( 0, 0 )
		f8_local10:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -25.5, _1080p * 38.5 )
		self:addElement( f8_local10 )
		self.NewItemNotification = f8_local10
	end
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f8_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 40, _1080p * 86.5, _1080p * 118.5 )
	QualityIcon:SubscribeToModelThroughElement( self, "streak.qualityImage", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.streak.qualityImage:GetValue( f8_local1 )
		if f10_local0 ~= nil then
			QualityIcon.IconShadow:setImage( RegisterMaterial( f10_local0 ), 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "streak.qualityColor", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.streak.qualityColor:GetValue( f8_local1 )
		if f11_local0 ~= nil then
			QualityIcon.Icon:SetRGBFromInt( f11_local0, 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "streak.qualityImage", function ()
		local f12_local0 = self:GetDataSource()
		f12_local0 = f12_local0.streak.qualityImage:GetValue( f8_local1 )
		if f12_local0 ~= nil then
			QualityIcon.Icon:setImage( RegisterMaterial( f12_local0 ), 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "streak.qualityColor", function ()
		local f13_local0 = self:GetDataSource()
		f13_local0 = f13_local0.streak.qualityColor:GetValue( f8_local1 )
		if f13_local0 ~= nil then
			QualityIcon.IconDuplicate:SetRGBFromInt( f13_local0, 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "streak.qualityImage", function ()
		local f14_local0 = self:GetDataSource()
		f14_local0 = f14_local0.streak.qualityImage:GetValue( f8_local1 )
		if f14_local0 ~= nil then
			QualityIcon.IconDuplicate:setImage( RegisterMaterial( f14_local0 ), 0 )
		end
	end )
	self:addElement( QualityIcon )
	self.QualityIcon = QualityIcon
	
	local SelectedTag = nil
	
	SelectedTag = MenuBuilder.BuildRegisteredType( "CaCSelectedMessage", {
		controllerIndex = f8_local1
	} )
	SelectedTag.id = "SelectedTag"
	SelectedTag.EndCapRight:SetAlpha( 1, 0 )
	SelectedTag:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -132, 0, _1080p * -20, 0 )
	self:addElement( SelectedTag )
	self.SelectedTag = SelectedTag
	
	local StreakImage = nil
	
	StreakImage = LUI.UIImage.new()
	StreakImage.id = "StreakImage"
	StreakImage:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 72, _1080p * -237, _1080p * 13, _1080p * 5 )
	StreakImage:SubscribeToModelThroughElement( self, "streak.image", function ()
		local f15_local0 = self:GetDataSource()
		f15_local0 = f15_local0.streak.image:GetValue( f8_local1 )
		if f15_local0 ~= nil then
			StreakImage:setImage( RegisterMaterial( f15_local0 ), 0 )
		end
	end )
	self:addElement( StreakImage )
	self.StreakImage = StreakImage
	
	local f8_local14 = nil
	if Engine.InFrontend() then
		f8_local14 = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
			controllerIndex = f8_local1
		} )
		f8_local14.id = "TitleBackground"
		f8_local14.DropShadow:SetAlpha( 0, 0 )
		f8_local14:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
		self:addElement( f8_local14 )
		self.TitleBackground = f8_local14
	end
	local FrameLabel = nil
	
	FrameLabel = LUI.UIText.new()
	FrameLabel.id = "FrameLabel"
	FrameLabel:SetRGBFromInt( 14277081, 0 )
	FrameLabel:SetFontSize( 19 * _1080p )
	FrameLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FrameLabel:SetAlignment( LUI.Alignment.Right )
	FrameLabel:SetOptOutRightToLeftAlignmentFlip( true )
	FrameLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -20, _1080p * 2.5, _1080p * 21.5 )
	FrameLabel:SubscribeToModelThroughElement( self, "streak.name", function ()
		local f16_local0 = self:GetDataSource()
		f16_local0 = f16_local0.streak.name:GetValue( f8_local1 )
		if f16_local0 ~= nil then
			FrameLabel:setText( ToUpperCase( f16_local0 ), 0 )
		end
	end )
	self:addElement( FrameLabel )
	self.FrameLabel = FrameLabel
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Border:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Border:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 618, 0, 0, 100 )
				end
			}
		} )
		GenericItemBackground:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * 192, _1080p * 24, 0, 100 )
				end
			}
		} )
		SelectedTag:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.SelectedTag:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * 60, _1080p * 192, _1080p * -20, 0, 100 )
				end
			}
		} )
		StreakImage:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.StreakImage:SetScale( 0.05, 100 )
				end
			}
		} )
		if Engine.InFrontend() then
			f8_local14:RegisterAnimationSequence( "ButtonOver", {
				{
					function ()
						return self.TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * 192, 0, _1080p * 24, 100 )
					end
				}
			} )
		end
		FrameLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 0, 100 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 212, _1080p * 172, _1080p * 2.5, _1080p * 21.5, 100 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Border:AnimateSequence( "ButtonOver" )
			GenericItemBackground:AnimateSequence( "ButtonOver" )
			SelectedTag:AnimateSequence( "ButtonOver" )
			StreakImage:AnimateSequence( "ButtonOver" )
			if Engine.InFrontend() then
				f8_local14:AnimateSequence( "ButtonOver" )
			end
			FrameLabel:AnimateSequence( "ButtonOver" )
		end
		
		GenericItemBackground:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0, 200 )
				end
			}
		} )
		SelectedTag:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.SelectedTag:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -132, 0, _1080p * -20, 0, 200 )
				end
			}
		} )
		StreakImage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.StreakImage:SetScale( 0, 200 )
				end
			}
		} )
		if Engine.InFrontend() then
			f8_local14:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24, 200 )
					end
				}
			} )
		end
		FrameLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 14277081, 200 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -20, _1080p * 2.5, _1080p * 21.5, 200 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			GenericItemBackground:AnimateSequence( "ButtonUp" )
			SelectedTag:AnimateSequence( "ButtonUp" )
			StreakImage:AnimateSequence( "ButtonUp" )
			if Engine.InFrontend() then
				f8_local14:AnimateSequence( "ButtonUp" )
			end
			FrameLabel:AnimateSequence( "ButtonUp" )
		end
		
		StreakImage:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.StreakImage:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.StreakImage:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			StreakImage:AnimateSequence( "Locked" )
		end
		
		StreakImage:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.StreakImage:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			StreakImage:AnimateSequence( "Unlocked" )
		end
		
		StreakDescription:RegisterAnimationSequence( "TextOverUnlocked", {
			{
				function ()
					return self.StreakDescription:SetAlpha( 0, 100 )
				end,
				function ()
					return self.StreakDescription:SetAlpha( 1, 10 )
				end
			}
		} )
		UnlockCriteria:RegisterAnimationSequence( "TextOverUnlocked", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 0 )
				end
			}
		} )
		UnlockIcon:RegisterAnimationSequence( "TextOverUnlocked", {
			{
				function ()
					return self.UnlockIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		StreakImage:RegisterAnimationSequence( "TextOverUnlocked", {
			{
				function ()
					return self.StreakImage:SetAlpha( 1, 110 )
				end
			}
		} )
		self._sequences.TextOverUnlocked = function ()
			StreakDescription:AnimateSequence( "TextOverUnlocked" )
			UnlockCriteria:AnimateSequence( "TextOverUnlocked" )
			UnlockIcon:AnimateSequence( "TextOverUnlocked" )
			StreakImage:AnimateSequence( "TextOverUnlocked" )
		end
		
		StreakDescription:RegisterAnimationSequence( "TextUpUnlocked", {
			{
				function ()
					return self.StreakDescription:SetAlpha( 1, 0 )
				end,
				function ()
					return self.StreakDescription:SetAlpha( 0, 10 )
				end
			}
		} )
		UnlockCriteria:RegisterAnimationSequence( "TextUpUnlocked", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 0 )
				end
			}
		} )
		UnlockIcon:RegisterAnimationSequence( "TextUpUnlocked", {
			{
				function ()
					return self.UnlockIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		StreakImage:RegisterAnimationSequence( "TextUpUnlocked", {
			{
				function ()
					return self.StreakImage:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.TextUpUnlocked = function ()
			StreakDescription:AnimateSequence( "TextUpUnlocked" )
			UnlockCriteria:AnimateSequence( "TextUpUnlocked" )
			UnlockIcon:AnimateSequence( "TextUpUnlocked" )
			StreakImage:AnimateSequence( "TextUpUnlocked" )
		end
		
		StreakDescription:RegisterAnimationSequence( "TextOverLocked", {
			{
				function ()
					return self.StreakDescription:SetAlpha( 0, 0 )
				end
			}
		} )
		UnlockCriteria:RegisterAnimationSequence( "TextOverLocked", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 90 )
				end,
				function ()
					return self.UnlockCriteria:SetAlpha( 1, 10 )
				end
			}
		} )
		UnlockIcon:RegisterAnimationSequence( "TextOverLocked", {
			{
				function ()
					return self.UnlockIcon:SetAlpha( 1, 90 )
				end,
				function ()
					return self.UnlockIcon:SetAlpha( 0, 10 )
				end
			}
		} )
		StreakImage:RegisterAnimationSequence( "TextOverLocked", {
			{
				function ()
					return self.StreakImage:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.TextOverLocked = function ()
			StreakDescription:AnimateSequence( "TextOverLocked" )
			UnlockCriteria:AnimateSequence( "TextOverLocked" )
			UnlockIcon:AnimateSequence( "TextOverLocked" )
			StreakImage:AnimateSequence( "TextOverLocked" )
		end
		
		StreakDescription:RegisterAnimationSequence( "TextUpLocked", {
			{
				function ()
					return self.StreakDescription:SetAlpha( 1, 0 )
				end,
				function ()
					return self.StreakDescription:SetAlpha( 0, 10 )
				end
			}
		} )
		UnlockCriteria:RegisterAnimationSequence( "TextUpLocked", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 0 )
				end
			}
		} )
		UnlockIcon:RegisterAnimationSequence( "TextUpLocked", {
			{
				function ()
					return self.UnlockIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		StreakImage:RegisterAnimationSequence( "TextUpLocked", {
			{
				function ()
					return self.StreakImage:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.TextUpLocked = function ()
			StreakDescription:AnimateSequence( "TextUpLocked" )
			UnlockCriteria:AnimateSequence( "TextUpLocked" )
			UnlockIcon:AnimateSequence( "TextUpLocked" )
			StreakImage:AnimateSequence( "TextUpLocked" )
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
		
	end
	
	self._animationSets.DefaultAnimationSet()
	QualityIcon:SubscribeToModelThroughElement( self, "streak.quality", function ()
		local f69_local0 = self:GetDataSource()
		if f69_local0.streak.quality:GetValue( f8_local1 ) ~= nil then
			f69_local0 = self:GetDataSource()
			if f69_local0.streak.quality:GetValue( f8_local1 ) == 0 then
				ACTIONS.AnimateSequence( self, "HideQuality" )
			end
		end
		f69_local0 = self:GetDataSource()
		if f69_local0.streak.quality:GetValue( f8_local1 ) ~= nil then
			f69_local0 = self:GetDataSource()
			if f69_local0.streak.quality:GetValue( f8_local1 ) ~= 0 then
				ACTIONS.AnimateSequence( self, "ShowQuality" )
			end
		end
	end )
	self:addEventHandler( "button_over", function ( f70_arg0, f70_arg1 )
		local f70_local0 = f70_arg1.controller or f8_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
		ACTIONS.AnimateSequence( self, "TextOverUnlocked" )
	end )
	self:addEventHandler( "button_up", function ( f71_arg0, f71_arg1 )
		local f71_local0 = f71_arg1.controller or f8_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
		ACTIONS.AnimateSequence( self, "TextUpUnlocked" )
	end )
	self:addEventHandler( "button_over_disable", function ( f72_arg0, f72_arg1 )
		local f72_local0 = f72_arg1.controller or f8_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
		ACTIONS.AnimateSequence( self, "TextOverLocked" )
	end )
	self:addEventHandler( "button_disable", function ( f73_arg0, f73_arg1 )
		local f73_local0 = f73_arg1.controller or f8_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
		ACTIONS.AnimateSequence( self, "TextUpLocked" )
	end )
	f0_local0( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "StreakRaritySelectButton", StreakRaritySelectButton )
LockTable( _M )

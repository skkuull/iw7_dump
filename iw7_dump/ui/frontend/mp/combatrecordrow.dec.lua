local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = "FiveRow"
	if f1_arg0.currentAnimation ~= f1_local0 then
		ACTIONS.AnimateSequence( f1_arg0, f1_local0 )
	end
	f1_arg0.currentAnimation = f1_local0
	f1_arg0.BaseField:setText( f1_arg1.name )
	f1_arg0.Field1:setText( f1_arg1.kills )
	f1_arg0.Field2:setText( string.format( "%.2f", f1_arg1.kdr ) )
	f1_arg0.Field3:setText( f1_arg1.headShots )
	f1_arg0.Field4:setText( string.format( "%.2f", f1_arg1.accuracy ) )
	f1_arg0.currentItem = f1_arg1
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = "SixRow"
	if f2_arg0.currentAnimation ~= f2_local0 then
		ACTIONS.AnimateSequence( f2_arg0, f2_local0 )
	end
	f2_arg0.currentAnimation = f2_local0
	f2_arg0.BaseField:setText( f2_arg1.name )
	f2_arg0.Field1:setText( f2_arg1.score )
	f2_arg0.Field2:setText( f2_arg1.timePlayed )
	f2_arg0.Field3:setText( f2_arg1.kills )
	f2_arg0.Field4:setText( string.format( "%.2f", f2_arg1.kdr ) )
	f2_arg0.Field5:setText( string.format( "%.2f", f2_arg1.spm ) )
	f2_arg0.currentItem = f2_arg1
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = "TwoRow"
	if f3_arg0.currentAnimation ~= f3_local0 then
		ACTIONS.AnimateSequence( f3_arg0, f3_local0 )
	end
	f3_arg0.currentAnimation = f3_local0
	f3_arg0.BaseField:setText( f3_arg1.name )
	f3_arg0.Field1:setText( f3_arg1.extraStat1 )
	f3_arg0.currentItem = f3_arg1
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = "TwoRow"
	if f4_arg0.currentAnimation ~= f4_local0 then
		ACTIONS.AnimateSequence( f4_arg0, f4_local0 )
	end
	f4_arg0.currentAnimation = f4_local0
	f4_arg0.BaseField:setText( f4_arg1.name )
	f4_arg0.Field1:setText( f4_arg1.uses )
	f4_arg0.currentItem = f4_arg1
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = "TwoRow"
	if f5_arg0.currentAnimation ~= f5_local0 then
		ACTIONS.AnimateSequence( f5_arg0, f5_local0 )
	end
	f5_arg0.currentAnimation = f5_local0
	f5_arg0.BaseField:setText( f5_arg1.name )
	f5_arg0.Field1:setText( f5_arg1.extraStat1 )
	f5_arg0.currentItem = f5_arg1
end

local f0_local5 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = "TwoRow"
	if f6_arg0.currentAnimation ~= f6_local0 then
		ACTIONS.AnimateSequence( f6_arg0, f6_local0 )
	end
	f6_arg0.currentAnimation = f6_local0
	f6_arg0.BaseField:setText( f6_arg1.name )
	f6_arg0.Field1:setText( f6_arg1.uses )
	f6_arg0.currentItem = f6_arg1
end

local f0_local6 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = "TwoRow"
	if f7_arg0.currentAnimation ~= f7_local0 then
		ACTIONS.AnimateSequence( f7_arg0, f7_local0 )
	end
	f7_arg0.currentAnimation = f7_local0
	f7_arg0.BaseField:setText( f7_arg1.name )
	f7_arg0.Field1:setText( f7_arg1.kills )
	f7_arg0.currentItem = f7_arg1
end

local f0_local7 = function ( f8_arg0, f8_arg1, f8_arg2 )
	f8_arg0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, 39 * _1080p )
	f8_arg0.SetupWeaponRowData = f0_local0
	f8_arg0.SetupGameModeRowData = f0_local1
	f8_arg0.SetupLethalRowData = f0_local2
	f8_arg0.SetupTacticalRowData = f0_local3
	f8_arg0.SetupRigRowData = f0_local6
	f8_arg0.SetupLethalStreakRowData = f0_local4
	f8_arg0.SetupSupportStreakRowData = f0_local5
	f8_arg0:addEventHandler( "button_over", function ( f9_arg0, f9_arg1 )
		f9_arg0:dispatchEventToCurrentMenu( {
			name = "update_record_item",
			currentItem = f9_arg0.currentItem
		} )
	end )
end

function CombatRecordRow( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1000 * _1080p, 0, 39 * _1080p )
	self.id = "CombatRecordRow"
	self._animationSets = {}
	self._sequences = {}
	local f10_local1 = controller and controller.controllerIndex
	if not f10_local1 and not Engine.InFrontend() then
		f10_local1 = self:getRootController()
	end
	assert( f10_local1 )
	local f10_local2 = self
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetBlurStrength( 1.5, 0 )
	ListBlur:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -1 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -1 )
	self:addElement( Background )
	self.Background = Background
	
	local HighlightBar = nil
	
	HighlightBar = LUI.UIImage.new()
	HighlightBar.id = "HighlightBar"
	HighlightBar:SetAlpha( 0, 0 )
	HighlightBar:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 6, 0, 0, 0 )
	self:addElement( HighlightBar )
	self.HighlightBar = HighlightBar
	
	local RowTint = nil
	
	RowTint = LUI.UIImage.new()
	RowTint.id = "RowTint"
	RowTint:SetRGBFromInt( 0, 0 )
	RowTint:SetAlpha( 0.15, 0 )
	RowTint:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -1 )
	self:addElement( RowTint )
	self.RowTint = RowTint
	
	local Cap = nil
	
	Cap = LUI.UIImage.new()
	Cap.id = "Cap"
	Cap:SetRGBFromInt( 14277081, 0 )
	Cap:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 6, 0, _1080p * -1 )
	self:addElement( Cap )
	self.Cap = Cap
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f10_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -1 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local Field1 = nil
	
	Field1 = LUI.UIStyledText.new()
	Field1.id = "Field1"
	Field1:SetRGBFromTable( SWATCHES.combatRecord.upRow, 0 )
	Field1:setText( "", 0 )
	Field1:SetFontSize( 20 * _1080p )
	Field1:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Field1:SetAlignment( LUI.Alignment.Center )
	Field1:SetStartupDelay( 1000 )
	Field1:SetLineHoldTime( 400 )
	Field1:SetAnimMoveTime( 150 )
	Field1:SetEndDelay( 1000 )
	Field1:SetCrossfadeTime( 400 )
	Field1:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Field1:SetMaxVisibleLines( 1 )
	Field1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -757, _1080p * -643, _1080p * 8, _1080p * 28 )
	self:addElement( Field1 )
	self.Field1 = Field1
	
	local Field2 = nil
	
	Field2 = LUI.UIStyledText.new()
	Field2.id = "Field2"
	Field2:setText( "", 0 )
	Field2:SetFontSize( 20 * _1080p )
	Field2:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Field2:SetAlignment( LUI.Alignment.Center )
	Field2:SetStartupDelay( 1000 )
	Field2:SetLineHoldTime( 400 )
	Field2:SetAnimMoveTime( 150 )
	Field2:SetEndDelay( 1000 )
	Field2:SetCrossfadeTime( 400 )
	Field2:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Field2:SetMaxVisibleLines( 1 )
	Field2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -631, _1080p * -517, _1080p * 8, _1080p * 28 )
	self:addElement( Field2 )
	self.Field2 = Field2
	
	local Field3 = nil
	
	Field3 = LUI.UIStyledText.new()
	Field3.id = "Field3"
	Field3:setText( "", 0 )
	Field3:SetFontSize( 20 * _1080p )
	Field3:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Field3:SetAlignment( LUI.Alignment.Center )
	Field3:SetStartupDelay( 1000 )
	Field3:SetLineHoldTime( 400 )
	Field3:SetAnimMoveTime( 150 )
	Field3:SetEndDelay( 1000 )
	Field3:SetCrossfadeTime( 400 )
	Field3:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Field3:SetMaxVisibleLines( 1 )
	Field3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -505, _1080p * -392, _1080p * 8, _1080p * 28 )
	self:addElement( Field3 )
	self.Field3 = Field3
	
	local Field4 = nil
	
	Field4 = LUI.UIStyledText.new()
	Field4.id = "Field4"
	Field4:setText( "", 0 )
	Field4:SetFontSize( 20 * _1080p )
	Field4:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Field4:SetAlignment( LUI.Alignment.Center )
	Field4:SetStartupDelay( 1000 )
	Field4:SetLineHoldTime( 400 )
	Field4:SetAnimMoveTime( 150 )
	Field4:SetEndDelay( 1000 )
	Field4:SetCrossfadeTime( 400 )
	Field4:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Field4:SetMaxVisibleLines( 1 )
	Field4:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -378, _1080p * -264, _1080p * 8, _1080p * 28 )
	self:addElement( Field4 )
	self.Field4 = Field4
	
	local Field5 = nil
	
	Field5 = LUI.UIStyledText.new()
	Field5.id = "Field5"
	Field5:setText( "", 0 )
	Field5:SetFontSize( 20 * _1080p )
	Field5:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Field5:SetAlignment( LUI.Alignment.Center )
	Field5:SetStartupDelay( 1000 )
	Field5:SetLineHoldTime( 400 )
	Field5:SetAnimMoveTime( 150 )
	Field5:SetEndDelay( 1000 )
	Field5:SetCrossfadeTime( 400 )
	Field5:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Field5:SetMaxVisibleLines( 1 )
	Field5:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -253, _1080p * -139, _1080p * 8, _1080p * 28 )
	self:addElement( Field5 )
	self.Field5 = Field5
	
	local Field6 = nil
	
	Field6 = LUI.UIStyledText.new()
	Field6.id = "Field6"
	Field6:setText( "", 0 )
	Field6:SetFontSize( 20 * _1080p )
	Field6:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Field6:SetAlignment( LUI.Alignment.Center )
	Field6:SetStartupDelay( 1000 )
	Field6:SetLineHoldTime( 400 )
	Field6:SetAnimMoveTime( 150 )
	Field6:SetEndDelay( 1000 )
	Field6:SetCrossfadeTime( 400 )
	Field6:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Field6:SetMaxVisibleLines( 1 )
	Field6:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -127, _1080p * -13, _1080p * 8, _1080p * 28 )
	self:addElement( Field6 )
	self.Field6 = Field6
	
	local BaseField = nil
	
	BaseField = LUI.UIStyledText.new()
	BaseField.id = "BaseField"
	BaseField:setText( "", 0 )
	BaseField:SetFontSize( 20 * _1080p )
	BaseField:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	BaseField:SetAlignment( LUI.Alignment.Left )
	BaseField:SetStartupDelay( 1000 )
	BaseField:SetLineHoldTime( 400 )
	BaseField:SetAnimMoveTime( 150 )
	BaseField:SetEndDelay( 1000 )
	BaseField:SetCrossfadeTime( 400 )
	BaseField:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	BaseField:SetMaxVisibleLines( 1 )
	BaseField:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 230, _1080p * 8, _1080p * 28 )
	self:addElement( BaseField )
	self.BaseField = BaseField
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		HighlightBar:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.HighlightBar:SetAlpha( 1, 0 )
				end
			}
		} )
		Field1:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Field1:SetRGBFromTable( SWATCHES.combatRecord.highlightRow, 0 )
				end
			}
		} )
		Field2:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Field2:SetRGBFromTable( SWATCHES.combatRecord.highlightRow, 0 )
				end
			}
		} )
		Field3:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Field3:SetRGBFromTable( SWATCHES.combatRecord.highlightRow, 0 )
				end
			}
		} )
		Field4:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Field4:SetRGBFromTable( SWATCHES.combatRecord.highlightRow, 0 )
				end
			}
		} )
		Field5:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Field5:SetRGBFromTable( SWATCHES.combatRecord.highlightRow, 0 )
				end
			}
		} )
		Field6:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Field6:SetRGBFromTable( SWATCHES.combatRecord.highlightRow, 0 )
				end
			}
		} )
		BaseField:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.BaseField:SetRGBFromTable( SWATCHES.combatRecord.highlightRow, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			HighlightBar:AnimateSequence( "ButtonOver" )
			Field1:AnimateSequence( "ButtonOver" )
			Field2:AnimateSequence( "ButtonOver" )
			Field3:AnimateSequence( "ButtonOver" )
			Field4:AnimateSequence( "ButtonOver" )
			Field5:AnimateSequence( "ButtonOver" )
			Field6:AnimateSequence( "ButtonOver" )
			BaseField:AnimateSequence( "ButtonOver" )
		end
		
		HighlightBar:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.HighlightBar:SetAlpha( 0, 0 )
				end
			}
		} )
		Field1:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Field1:SetRGBFromTable( SWATCHES.combatRecord.upRow, 0 )
				end
			}
		} )
		Field2:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Field2:SetRGBFromTable( SWATCHES.combatRecord.upRow, 0 )
				end
			}
		} )
		Field3:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Field3:SetRGBFromTable( SWATCHES.combatRecord.upRow, 0 )
				end
			}
		} )
		Field4:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Field4:SetRGBFromTable( SWATCHES.combatRecord.upRow, 0 )
				end
			}
		} )
		Field5:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Field5:SetRGBFromTable( SWATCHES.combatRecord.upRow, 0 )
				end
			}
		} )
		Field6:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Field6:SetRGBFromTable( SWATCHES.combatRecord.upRow, 0 )
				end
			}
		} )
		BaseField:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.BaseField:SetRGBFromTable( SWATCHES.combatRecord.upRow, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			HighlightBar:AnimateSequence( "ButtonUp" )
			Field1:AnimateSequence( "ButtonUp" )
			Field2:AnimateSequence( "ButtonUp" )
			Field3:AnimateSequence( "ButtonUp" )
			Field4:AnimateSequence( "ButtonUp" )
			Field5:AnimateSequence( "ButtonUp" )
			Field6:AnimateSequence( "ButtonUp" )
			BaseField:AnimateSequence( "ButtonUp" )
		end
		
		Field1:RegisterAnimationSequence( "FiveRow", {
			{
				function ()
					return self.Field1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -758, _1080p * -580, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field2:RegisterAnimationSequence( "FiveRow", {
			{
				function ()
					return self.Field2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -568, _1080p * -392, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field3:RegisterAnimationSequence( "FiveRow", {
			{
				function ()
					return self.Field3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -379, _1080p * -202, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field4:RegisterAnimationSequence( "FiveRow", {
			{
				function ()
					return self.Field4:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -190, _1080p * -13, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field5:RegisterAnimationSequence( "FiveRow", {
			{
				function ()
					return self.Field5:SetAlpha( 0, 0 )
				end
			}
		} )
		Field6:RegisterAnimationSequence( "FiveRow", {
			{
				function ()
					return self.Field6:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.FiveRow = function ()
			Field1:AnimateSequence( "FiveRow" )
			Field2:AnimateSequence( "FiveRow" )
			Field3:AnimateSequence( "FiveRow" )
			Field4:AnimateSequence( "FiveRow" )
			Field5:AnimateSequence( "FiveRow" )
			Field6:AnimateSequence( "FiveRow" )
		end
		
		Field1:RegisterAnimationSequence( "SevenRow", {
			{
				function ()
					return self.Field1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Field1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -757, _1080p * -643, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field2:RegisterAnimationSequence( "SevenRow", {
			{
				function ()
					return self.Field2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Field2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -631, _1080p * -517, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field3:RegisterAnimationSequence( "SevenRow", {
			{
				function ()
					return self.Field3:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Field3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -505, _1080p * -391, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field4:RegisterAnimationSequence( "SevenRow", {
			{
				function ()
					return self.Field4:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Field4:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -379, _1080p * -265, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field5:RegisterAnimationSequence( "SevenRow", {
			{
				function ()
					return self.Field5:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Field5:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -253, _1080p * -139, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field6:RegisterAnimationSequence( "SevenRow", {
			{
				function ()
					return self.Field6:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Field6:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -127, _1080p * -13, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		self._sequences.SevenRow = function ()
			Field1:AnimateSequence( "SevenRow" )
			Field2:AnimateSequence( "SevenRow" )
			Field3:AnimateSequence( "SevenRow" )
			Field4:AnimateSequence( "SevenRow" )
			Field5:AnimateSequence( "SevenRow" )
			Field6:AnimateSequence( "SevenRow" )
		end
		
		Field1:RegisterAnimationSequence( "SixRow", {
			{
				function ()
					return self.Field1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Field1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -758, _1080p * -617, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field2:RegisterAnimationSequence( "SixRow", {
			{
				function ()
					return self.Field2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Field2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -607, _1080p * -466, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field3:RegisterAnimationSequence( "SixRow", {
			{
				function ()
					return self.Field3:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Field3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -456, _1080p * -315, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field4:RegisterAnimationSequence( "SixRow", {
			{
				function ()
					return self.Field4:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Field4:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -305, _1080p * -164, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field5:RegisterAnimationSequence( "SixRow", {
			{
				function ()
					return self.Field5:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Field5:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -154, _1080p * -13, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field6:RegisterAnimationSequence( "SixRow", {
			{
				function ()
					return self.Field6:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Field6:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -154, _1080p * -13, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		BaseField:RegisterAnimationSequence( "SixRow", {
			{
				function ()
					return self.BaseField:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 231, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		self._sequences.SixRow = function ()
			Field1:AnimateSequence( "SixRow" )
			Field2:AnimateSequence( "SixRow" )
			Field3:AnimateSequence( "SixRow" )
			Field4:AnimateSequence( "SixRow" )
			Field5:AnimateSequence( "SixRow" )
			Field6:AnimateSequence( "SixRow" )
			BaseField:AnimateSequence( "SixRow" )
		end
		
		Field1:RegisterAnimationSequence( "TwoRow", {
			{
				function ()
					return self.Field1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -339, _1080p * -13, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field2:RegisterAnimationSequence( "TwoRow", {
			{
				function ()
					return self.Field2:SetAlpha( 0, 0 )
				end
			}
		} )
		Field3:RegisterAnimationSequence( "TwoRow", {
			{
				function ()
					return self.Field3:SetAlpha( 0, 0 )
				end
			}
		} )
		Field4:RegisterAnimationSequence( "TwoRow", {
			{
				function ()
					return self.Field4:SetAlpha( 0, 0 )
				end
			}
		} )
		Field5:RegisterAnimationSequence( "TwoRow", {
			{
				function ()
					return self.Field5:SetAlpha( 0, 0 )
				end
			}
		} )
		Field6:RegisterAnimationSequence( "TwoRow", {
			{
				function ()
					return self.Field6:SetAlpha( 0, 0 )
				end
			}
		} )
		BaseField:RegisterAnimationSequence( "TwoRow", {
			{
				function ()
					return self.BaseField:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 393, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		self._sequences.TwoRow = function ()
			Field1:AnimateSequence( "TwoRow" )
			Field2:AnimateSequence( "TwoRow" )
			Field3:AnimateSequence( "TwoRow" )
			Field4:AnimateSequence( "TwoRow" )
			Field5:AnimateSequence( "TwoRow" )
			Field6:AnimateSequence( "TwoRow" )
			BaseField:AnimateSequence( "TwoRow" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f73_arg0, f73_arg1 )
		local f73_local0 = f73_arg1.controller or f10_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f74_arg0, f74_arg1 )
		local f74_local0 = f74_arg1.controller or f10_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	f0_local7( self, f10_local1, controller )
	return self
end

MenuBuilder.registerType( "CombatRecordRow", CombatRecordRow )
LockTable( _M )

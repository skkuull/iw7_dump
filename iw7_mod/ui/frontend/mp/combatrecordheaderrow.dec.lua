local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if #f1_arg1 == 2 then
		ACTIONS.AnimateSequence( f1_arg0, "TwoRow" )
	elseif #f1_arg1 == 5 then
		ACTIONS.AnimateSequence( f1_arg0, "FiveRow" )
	elseif #f1_arg1 == 6 then
		ACTIONS.AnimateSequence( f1_arg0, "SixRow" )
	elseif #f1_arg1 == 7 then
		ACTIONS.AnimateSequence( f1_arg0, "SevenRow" )
	else
		assert( false, "Trying to use an unsupported number of header strings." )
	end
	for f1_local3, f1_local4 in ipairs( f1_arg1 ) do
		assert( f1_arg0["Field" .. f1_local3] )
		f1_arg0["Field" .. f1_local3]:setText( ToUpperCase( Engine.Localize( f1_local4 ) ) )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.SetupHeader = f0_local0
end

function CombatRecordHeaderRow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1000 * _1080p, 0, 39 * _1080p )
	self.id = "CombatRecordHeaderRow"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetBlurStrength( 1.5, 0 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.8, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Field1 = nil
	
	Field1 = LUI.UIStyledText.new()
	Field1.id = "Field1"
	Field1:setText( "", 0 )
	Field1:SetFontSize( 20 * _1080p )
	Field1:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Field1:SetAlignment( LUI.Alignment.Left )
	Field1:SetStartupDelay( 1000 )
	Field1:SetLineHoldTime( 400 )
	Field1:SetAnimMoveTime( 150 )
	Field1:SetEndDelay( 1000 )
	Field1:SetCrossfadeTime( 400 )
	Field1:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Field1:SetMaxVisibleLines( 1 )
	Field1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 230, _1080p * 8, _1080p * 28 )
	self:addElement( Field1 )
	self.Field1 = Field1
	
	local Field2 = nil
	
	Field2 = LUI.UIStyledText.new()
	Field2.id = "Field2"
	Field2:SetRGBFromTable( SWATCHES.combatRecord.upRow, 0 )
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
	Field2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -758, _1080p * -644, _1080p * 8, _1080p * 28 )
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
	Field3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -631, _1080p * -517, _1080p * 8, _1080p * 28 )
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
	Field4:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -505, _1080p * -391, _1080p * 8, _1080p * 28 )
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
	Field5:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -379, _1080p * -265, _1080p * 8, _1080p * 28 )
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
	Field6:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -253, _1080p * -139, _1080p * 8, _1080p * 28 )
	self:addElement( Field6 )
	self.Field6 = Field6
	
	local Field7 = nil
	
	Field7 = LUI.UIStyledText.new()
	Field7.id = "Field7"
	Field7:setText( "", 0 )
	Field7:SetFontSize( 20 * _1080p )
	Field7:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Field7:SetAlignment( LUI.Alignment.Center )
	Field7:SetStartupDelay( 1000 )
	Field7:SetLineHoldTime( 400 )
	Field7:SetAnimMoveTime( 150 )
	Field7:SetEndDelay( 1000 )
	Field7:SetCrossfadeTime( 400 )
	Field7:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Field7:SetMaxVisibleLines( 1 )
	Field7:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -127, _1080p * -13, _1080p * 8, _1080p * 28 )
	self:addElement( Field7 )
	self.Field7 = Field7
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Field2:RegisterAnimationSequence( "FiveRow", {
			{
				function ()
					return self.Field2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -758, _1080p * -580, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field3:RegisterAnimationSequence( "FiveRow", {
			{
				function ()
					return self.Field3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -568, _1080p * -392, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field4:RegisterAnimationSequence( "FiveRow", {
			{
				function ()
					return self.Field4:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -379, _1080p * -203, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field5:RegisterAnimationSequence( "FiveRow", {
			{
				function ()
					return self.Field5:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -189, _1080p * -12, _1080p * 8, _1080p * 28, 0 )
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
		Field7:RegisterAnimationSequence( "FiveRow", {
			{
				function ()
					return self.Field7:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.FiveRow = function ()
			Field2:AnimateSequence( "FiveRow" )
			Field3:AnimateSequence( "FiveRow" )
			Field4:AnimateSequence( "FiveRow" )
			Field5:AnimateSequence( "FiveRow" )
			Field6:AnimateSequence( "FiveRow" )
			Field7:AnimateSequence( "FiveRow" )
		end
		
		Field2:RegisterAnimationSequence( "SevenRow", {
			{
				function ()
					return self.Field2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Field2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -758, _1080p * -644, _1080p * 8, _1080p * 28, 0 )
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
					return self.Field3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -631, _1080p * -517, _1080p * 8, _1080p * 28, 0 )
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
					return self.Field4:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -505, _1080p * -391, _1080p * 8, _1080p * 28, 0 )
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
					return self.Field5:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -379, _1080p * -265, _1080p * 8, _1080p * 28, 0 )
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
					return self.Field6:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -253, _1080p * -139, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field7:RegisterAnimationSequence( "SevenRow", {
			{
				function ()
					return self.Field7:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Field7:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -127, _1080p * -13, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		self._sequences.SevenRow = function ()
			Field2:AnimateSequence( "SevenRow" )
			Field3:AnimateSequence( "SevenRow" )
			Field4:AnimateSequence( "SevenRow" )
			Field5:AnimateSequence( "SevenRow" )
			Field6:AnimateSequence( "SevenRow" )
			Field7:AnimateSequence( "SevenRow" )
		end
		
		Field1:RegisterAnimationSequence( "SixRow", {
			{
				function ()
					return self.Field1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 230, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field2:RegisterAnimationSequence( "SixRow", {
			{
				function ()
					return self.Field2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -758, _1080p * -617, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field3:RegisterAnimationSequence( "SixRow", {
			{
				function ()
					return self.Field3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -607, _1080p * -466, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field4:RegisterAnimationSequence( "SixRow", {
			{
				function ()
					return self.Field4:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -456, _1080p * -315, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field5:RegisterAnimationSequence( "SixRow", {
			{
				function ()
					return self.Field5:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -305, _1080p * -164, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field6:RegisterAnimationSequence( "SixRow", {
			{
				function ()
					return self.Field6:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -154, _1080p * -13, _1080p * 8, _1080p * 28, 0 )
				end
			}
		} )
		Field7:RegisterAnimationSequence( "SixRow", {
			{
				function ()
					return self.Field7:SetAlpha( 0, 0 )
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
			Field7:AnimateSequence( "SixRow" )
		end
		
		Field2:RegisterAnimationSequence( "TwoRow", {
			{
				function ()
					return self.Field2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -339, _1080p * -13, _1080p * 8, _1080p * 28, 0 )
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
		Field7:RegisterAnimationSequence( "TwoRow", {
			{
				function ()
					return self.Field7:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.TwoRow = function ()
			Field2:AnimateSequence( "TwoRow" )
			Field3:AnimateSequence( "TwoRow" )
			Field4:AnimateSequence( "TwoRow" )
			Field5:AnimateSequence( "TwoRow" )
			Field6:AnimateSequence( "TwoRow" )
			Field7:AnimateSequence( "TwoRow" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f41_arg0, f41_arg1 )
		local f41_local0 = f41_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f42_arg0, f42_arg1 )
		local f42_local0 = f42_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "CombatRecordHeaderRow", CombatRecordHeaderRow )
LockTable( _M )

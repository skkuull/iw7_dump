local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PopFunc()
	WipeGlobalModelsAtPath( CRM.menuModelPath )
end

function CRMUpdatePips( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	if 1 < f2_arg2 then
		f2_arg0.Pips:Resize( f2_arg2 )
		f2_arg0.Pips:UpdateChildren( f2_arg3 - 1 )
	end
end

function CRMContainerOpenWindow( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
	local f3_local0 = f3_arg0._messageDataSources[f3_arg2]
	if not f3_local0 then
		return 
	elseif f3_arg0.CRMWindow then
		f3_arg0.CRMWindow:closeTree()
	end
	local f3_local1 = {
		messageIndex = f3_local0[CRM.keys.MESSAGE_INDEX]:GetValue( f3_arg1 ),
		forceOpen = f3_arg3,
		locationIndex = f3_local0[CRM.keys.LOCATION_ID]:GetValue( f3_arg1 ),
		controllerIndex = f3_arg1
	}
	f3_arg0._currentPopupMessageIndex = f3_arg2
	local f3_local2 = nil
	if f3_local0.layout_type then
		f3_local2 = f3_local0.layout_type:GetValue( f3_arg1 )
	else
		f3_local2 = "1"
	end
	local CRMWindow = CRM.InitPopupWindow( f3_local1, f3_local2, f3_arg0 )
	CRMUpdatePips( f3_arg0, f3_arg1, #f3_arg0._messageDataSources, f3_arg2 )
	CRMWindow:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080 )
	f3_arg0:addElement( CRMWindow )
	f3_arg0.CRMWindow = CRMWindow
	
	if not f3_arg0.windowsViewed then
		f3_arg0.windowsViewed = {}
	end
	if (not f3_local0.action or f3_local0.action:GetValue( f3_arg1 ) ~= "redeem") and not f3_arg0.windowsViewed[f3_arg2] then
		CRM.QueueReadMessage( f3_arg0, f3_arg1, f3_local1.messageIndex, f3_local1.locationIndex )
		f3_arg0.windowsViewed[f3_arg2] = true
	end
	f3_arg0:processEvent( {
		name = "crm_window_added"
	} )
end

function CRMContainerCycle( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = f4_arg0._currentPopupMessageIndex
	local f4_local1 = #f4_arg0._messageDataSources
	CRMContainerOpenWindow( f4_arg0, f4_arg1, 1 + (f4_local0 - 1 + f4_arg2 + f4_local1) % f4_local1, false )
end

function PostLoadFunc( f5_arg0, f5_arg1, f5_arg2 )
	assert( f5_arg2.locationIndex )
	assert( f5_arg2.messageIndex )
	f5_arg0._messageDataSources = CRM.GetMenuMessageDataSources( CRM.menuModelPath, f5_arg1, true )
	if #f5_arg0._messageDataSources > 1 then
		ACTIONS.AnimateSequence( f5_arg0, "MultipleSelection" )
	else
		ACTIONS.AnimateSequence( f5_arg0, "SingleSelection" )
	end
	for bindButton = 1, #f5_arg0._messageDataSources, 1 do
		local f5_local3 = f5_arg0._messageDataSources[bindButton][CRM.keys.MESSAGE_INDEX]:GetValue( f5_arg1 )
		local f5_local4 = f5_arg0._messageDataSources[bindButton][CRM.keys.LOCATION_ID]:GetValue( f5_arg1 )
		assert( f5_local3 )
		if f5_local3 == f5_arg2.messageIndex and f5_arg2.locationIndex == f5_local4 then
			CRMContainerOpenWindow( f5_arg0, f5_arg1, bindButton, f5_arg2.forceOpen )
			break
		end
	end
	assert( f5_arg0._currentPopupMessageIndex )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "bindButton"
	f5_arg0:addElement( bindButton )
	f5_arg0.bindButton = bindButton
	
	f5_arg0.bindButton:addEventHandler( "button_left_trigger", function ( f6_arg0, f6_arg1 )
		CRMContainerCycle( f5_arg0, f5_arg1, -1 )
	end )
	f5_arg0.bindButton:addEventHandler( "button_right_trigger", function ( f7_arg0, f7_arg1 )
		CRMContainerCycle( f5_arg0, f5_arg1, 1 )
	end )
end

function CRMContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "CRMContainer"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local DarkenBackground = nil
	
	DarkenBackground = LUI.UIImage.new()
	DarkenBackground.id = "DarkenBackground"
	DarkenBackground:SetRGBFromInt( 0, 0 )
	DarkenBackground:SetAlpha( 0.85, 0 )
	self:addElement( DarkenBackground )
	self.DarkenBackground = DarkenBackground
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f8_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 316, _1080p * -316, _1080p * -112.5, _1080p * -62.5 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local PipsBG = nil
	
	PipsBG = LUI.UIImage.new()
	PipsBG.id = "PipsBG"
	PipsBG:SetRGBFromTable( SWATCHES.genericMenu.blackBackground, 0 )
	PipsBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 316, _1080p * 1604, _1080p * 901, _1080p * 967.5 )
	self:addElement( PipsBG )
	self.PipsBG = PipsBG
	
	local Pips = nil
	
	Pips = LUI.Pips.new( {
		spacing = _1080p * 5,
		direction = LUI.DIRECTION.horizontal,
		alignment = LUI.Alignment.Center,
		buildPip = function ()
			return MenuBuilder.BuildRegisteredType( "Pip", {
				controllerIndex = f8_local1
			} )
		end,
		controllerIndex = f8_local1
	} )
	Pips.id = "Pips"
	Pips:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 887, _1080p * 987, _1080p * 930, _1080p * 946 )
	self:addElement( Pips )
	self.Pips = Pips
	
	local LeftInputText = nil
	
	LeftInputText = LUI.UIText.new()
	LeftInputText.id = "LeftInputText"
	LeftInputText:setText( LocalizeString( Engine.Localize( "LUA_MENU_PAD_LEFT_TRIGGER_BUTTON" ) ), 0 )
	LeftInputText:SetFontSize( 45 * _1080p )
	LeftInputText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	LeftInputText:SetAlignment( LUI.Alignment.Right )
	LeftInputText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 771, _1080p * 867, _1080p * 915.5, _1080p * 960.5 )
	self:addElement( LeftInputText )
	self.LeftInputText = LeftInputText
	
	local RightInputText = nil
	
	RightInputText = LUI.UIText.new()
	RightInputText.id = "RightInputText"
	RightInputText:setText( LocalizeString( Engine.Localize( "LUA_MENU_PAD_RIGHT_TRIGGER_BUTTON" ) ), 0 )
	RightInputText:SetFontSize( 45 * _1080p )
	RightInputText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	RightInputText:SetAlignment( LUI.Alignment.Left )
	RightInputText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1007.5, _1080p * 1113.5, _1080p * 915.5, _1080p * 960.5 )
	self:addElement( RightInputText )
	self.RightInputText = RightInputText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ButtonHelperBar:RegisterAnimationSequence( "MultipleSelection", {
			{
				function ()
					return self.ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 316, _1080p * -316, _1080p * -112.5, _1080p * -62.5, 0 )
				end
			}
		} )
		PipsBG:RegisterAnimationSequence( "MultipleSelection", {
			{
				function ()
					return self.PipsBG:SetAlpha( 1, 0 )
				end
			}
		} )
		Pips:RegisterAnimationSequence( "MultipleSelection", {
			{
				function ()
					return self.Pips:SetAlpha( 1, 0 )
				end
			}
		} )
		LeftInputText:RegisterAnimationSequence( "MultipleSelection", {
			{
				function ()
					return self.LeftInputText:SetAlpha( 1, 0 )
				end
			}
		} )
		RightInputText:RegisterAnimationSequence( "MultipleSelection", {
			{
				function ()
					return self.RightInputText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.MultipleSelection = function ()
			ButtonHelperBar:AnimateSequence( "MultipleSelection" )
			PipsBG:AnimateSequence( "MultipleSelection" )
			Pips:AnimateSequence( "MultipleSelection" )
			LeftInputText:AnimateSequence( "MultipleSelection" )
			RightInputText:AnimateSequence( "MultipleSelection" )
		end
		
		ButtonHelperBar:RegisterAnimationSequence( "SingleSelection", {
			{
				function ()
					return self.ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 316, _1080p * -316, _1080p * -175, _1080p * -125, 0 )
				end
			}
		} )
		PipsBG:RegisterAnimationSequence( "SingleSelection", {
			{
				function ()
					return self.PipsBG:SetAlpha( 0, 0 )
				end
			}
		} )
		Pips:RegisterAnimationSequence( "SingleSelection", {
			{
				function ()
					return self.Pips:SetAlpha( 0, 0 )
				end
			}
		} )
		LeftInputText:RegisterAnimationSequence( "SingleSelection", {
			{
				function ()
					return self.LeftInputText:SetAlpha( 0, 0 )
				end
			}
		} )
		RightInputText:RegisterAnimationSequence( "SingleSelection", {
			{
				function ()
					return self.RightInputText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.SingleSelection = function ()
			ButtonHelperBar:AnimateSequence( "SingleSelection" )
			PipsBG:AnimateSequence( "SingleSelection" )
			Pips:AnimateSequence( "SingleSelection" )
			LeftInputText:AnimateSequence( "SingleSelection" )
			RightInputText:AnimateSequence( "SingleSelection" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "CRMContainer", CRMContainer )
LUI.FlowManager.RegisterStackPopBehaviour( "CRMContainer", PopFunc )
LockTable( _M )

local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.AnnouncerVoice"
function AddButtonHelperbar( f1_arg0, f1_arg1 )
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f1_arg1,
		list_left_inset = 10
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -10, _1080p * 10, _1080p * 11, _1080p * 66 )
	f1_arg0:addElement( ButtonHelperBar )
	f1_arg0.ButtonHelperBar = ButtonHelperBar
	
	local f1_local1 = f1_arg0
	local f1_local2 = f1_arg0.AddButtonHelperTextToElement
	local f1_local3 = f1_arg0.ButtonHelperBar
	local f1_local4 = {
		helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
		button_ref = "button_primary",
		side = "left"
	}
	local f1_local5 = 10
	f1_local4.clickable = true
	f1_local4[1] = f1_local5
	f1_local2( f1_local1, f1_local3, f1_local4 )
	f1_local1 = f1_arg0
	f1_local2 = f1_arg0.AddButtonHelperTextToElement
	f1_local3 = f1_arg0.ButtonHelperBar
	f1_local4 = {
		helper_text = Engine.Localize( "MENU_BACK" ),
		button_ref = "button_secondary",
		side = "left"
	}
	f1_local5 = 10
	f1_local4.clickable = true
	f1_local4[1] = f1_local5
	f1_local2( f1_local1, f1_local3, f1_local4 )
	f1_local1 = f1_arg0
	f1_local2 = f1_arg0.AddButtonHelperTextToElement
	f1_local3 = f1_arg0.ButtonHelperBar
	f1_local4 = {
		helper_text = Engine.Localize( "LUA_MENU_ANNOUNCER_PREVIEW" ),
		button_ref = "button_alt2",
		side = "left"
	}
	f1_local5 = 10
	f1_local4.clickable = true
	f1_local4[1] = f1_local5
	f1_local2( f1_local1, f1_local3, f1_local4 )
end

function LeaveAnnouncerMenu( f2_arg0, f2_arg1 )
	WipeGlobalModelsAtPath( f0_local0 )
	WipeGlobalModelsAtPath( f0_local0 .. "." .. "voice" )
	ACTIONS.LeaveMenu( f2_arg0 )
end

function PostLoadFunc( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = Engine.GetPlayerDataEx( f3_arg1, CoD.StatsGroup.Common, "mp_announcer_type" )
	local f3_local1 = Engine.TableGetRowCount( CSV.announcerVoiceDataTable.file )
	local f3_local2 = {}
	for f3_local3 = 0, f3_local1 - 1, 1 do
		local f3_local6 = CSV.ReadRow( CSV.announcerVoiceDataTable, f3_local3 )
		local f3_local7 = f3_local6.index
		if Engine.IsAnnouncerReleased( f3_local7 ) then
			table.insert( f3_local2, {
				announcerId = f3_local7,
				name = Engine.Localize( f3_local6.name ),
				preview = f3_local6.preview,
				isUnlocked = Engine.IsAnnouncerUnlocked( f3_local7 ),
				isSelected = tostring( f3_local7 ) == tostring( f3_local0 )
			} )
		end
	end
	local f3_local3 = LUI.DataSourceFromList.new( #f3_local2 )
	f3_local3.MakeDataSourceAtIndex = function ( f4_arg0, f4_arg1, f4_arg2 )
		local f4_local0 = f3_local2[f4_arg1 + 1]
		local f4_local1 = f0_local0 .. ".voice." .. f4_arg1
		local f4_local2 = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".name", f4_local0.name )
		local f4_local3 = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".isUnlocked" )
		local f4_local4 = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".isSelected" )
		f4_local4:SetValue( f4_arg2, f4_local0.isSelected )
		f4_local3:SetValue( f4_arg2, f4_local0.isUnlocked )
		return {
			name = f4_local2,
			isUnlocked = f4_local3,
			isSelected = f4_local4,
			announcerId = f4_local0.announcerId,
			preview = f4_local0.preview
		}
	end
	
	f3_local3.GetDefaultFocusIndex = function ()
		for f5_local0 = 1, #f3_local2, 1 do
			if tostring( f3_local2[f5_local0].announcerId ) == tostring( f3_local0 ) then
				return f5_local0 - 1
			end
		end
	end
	
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	f3_arg0:addElement( bindButton )
	f3_arg0.bindButton = bindButton
	
	f3_arg0.VoiceList:SetGridDataSource( f3_local3, f0_local0 )
	AddButtonHelperbar( f3_arg0, f3_arg1 )
	f3_arg0.bindButton:addEventHandler( "button_secondary", function ( f6_arg0, f6_arg1 )
		LeaveAnnouncerMenu( f3_arg0, f3_arg1 )
	end )
	local f3_local5 = function ()
		local f7_local0 = f3_arg0.VoiceList:GetDataSource( f3_arg1 )
		if not f7_local0 then
			return 
		else
			assert( f7_local0.preview )
			Engine.PlaySound( f7_local0.preview )
		end
	end
	
	f3_arg0.bindButton:addEventHandler( "button_alt2", function ( f8_arg0, f8_arg1 )
		f3_local5()
	end )
	if Engine.IsPC() then
		f3_arg0:addEventHandler( "gamepad_button", function ( f9_arg0, f9_arg1 )
			if f9_arg1.down and f9_arg1.button == "p" then
				f3_local5()
			end
		end )
	end
end

function AnnouncerVoiceSelectWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 700 * _1080p, 0, 425 * _1080p )
	self.id = "AnnouncerVoiceSelectWidget"
	local f10_local1 = controller and controller.controllerIndex
	if not f10_local1 and not Engine.InFrontend() then
		f10_local1 = self:getRootController()
	end
	assert( f10_local1 )
	local f10_local2 = self
	local VoiceList = nil
	
	VoiceList = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 7,
		controllerIndex = f10_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "AnnouncerVoiceSelectButton", {
				controllerIndex = f10_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 30,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	VoiceList.id = "VoiceList"
	VoiceList:setUseStencil( true )
	VoiceList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 112.25, _1080p * 612.25, _1080p * 96, _1080p * 342 )
	self:addElement( VoiceList )
	self.VoiceList = VoiceList
	
	local Scrollbar = nil
	
	Scrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f10_local1
	} )
	Scrollbar.id = "Scrollbar"
	Scrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 79.25, _1080p * 96.25, _1080p * 81.25, _1080p * 356.75 )
	self:addElement( Scrollbar )
	self.Scrollbar = Scrollbar
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f10_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 434.75, _1080p * 454.75, _1080p * 342, _1080p * 382 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f10_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 269.75, _1080p * 289.75, _1080p * 342, _1080p * 382 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 289.75, _1080p * 434.75, _1080p * 350, _1080p * 374 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local ButtonDescriptionText = nil
	
	ButtonDescriptionText = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f10_local1
	} )
	ButtonDescriptionText.id = "ButtonDescriptionText"
	ButtonDescriptionText.Description:SetRight( _1080p * 500, 0 )
	ButtonDescriptionText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 112.25, _1080p * 612.25, _1080p * 382, _1080p * 414 )
	self:addElement( ButtonDescriptionText )
	self.ButtonDescriptionText = ButtonDescriptionText
	
	local f10_local9 = nil
	if CONDITIONS.IsPC( self ) then
		f10_local9 = LUI.UIText.new()
		f10_local9.id = "PreviewText"
		f10_local9:setText( Engine.Localize( "LUA_MENU_ANNOUNCER_PREVIEW_TIP" ), 0 )
		f10_local9:SetFontSize( 24 * _1080p )
		f10_local9:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f10_local9:SetAlignment( LUI.Alignment.Center )
		f10_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100, _1080p * 600, _1080p * 49.25, _1080p * 73.25 )
		self:addElement( f10_local9 )
		self.PreviewText = f10_local9
	end
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:setText( Engine.Localize( "LUA_MENU_ANNOUNCER_MESSAGE" ), 0 )
	Text:SetFontSize( 24 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Center )
	Text:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 87.75, _1080p * 612.25, _1080p * 18.5, _1080p * 42.5 )
	self:addElement( Text )
	self.Text = Text
	
	local f10_local11 = LUI.UIScrollbar.new
	local f10_local12 = {
		direction = LUI.DIRECTION.vertical,
		eventListener = Scrollbar,
		startCap = Scrollbar.startCap,
		endCap = Scrollbar.endCap
	}
	local f10_local13 = Scrollbar.sliderArea
	if f10_local13 then
		f10_local13 = Scrollbar.sliderArea.slider
	end
	f10_local12.slider = f10_local13
	f10_local13 = Scrollbar.sliderArea
	if f10_local13 then
		f10_local13 = Scrollbar.sliderArea.fixedSizeSlider
	end
	f10_local12.fixedSizeSlider = f10_local13
	VoiceList:AddScrollbar( f10_local11( f10_local12 ) )
	VoiceList:AddArrow( ArrowUp )
	VoiceList:AddArrow( ArrowDown )
	VoiceList:AddItemNumbers( ListCount )
	PostLoadFunc( self, f10_local1, controller )
	return self
end

MenuBuilder.registerType( "AnnouncerVoiceSelectWidget", AnnouncerVoiceSelectWidget )
LockTable( _M )

local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	if f1_arg0.options and #f1_arg0.options > 0 then
		for f1_local0 = 1, #f1_arg0.options, 1 do
			f1_arg0.options[f1_local0]:processEvent( {
				name = "refresh_values"
			} )
		end
	end
end

f0_local1 = function ( f2_arg0 )
	if f2_arg0.options and #f2_arg0.options > 0 then
		if type( f2_arg0.options[1] ) == "userdata" then
			for f2_local0 = 1, #f2_arg0.options, 1 do
				f2_arg0.buttonList:removeElement( f2_arg0.options[f2_local0] )
			end
		elseif f2_arg0.SubmenuGrid then
			f2_arg0.SubmenuGrid:UpdateOptions( {} )
		end
	end
	f2_arg0.options = {}
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4 )
	assert( f3_arg0.OptionDecorations.SetTitle )
	assert( f3_arg3 )
	if f3_arg0.currCategory == f3_arg4 and f3_arg4 ~= nil then
		f3_arg0:RefreshCurrentOptions()
		return 
	end
	f3_arg0.OptionDecorations:SetTitle( f3_arg2 )
	local f3_local0 = 0
	f3_arg0:ClearCurrentOptions()
	f3_arg0.options = f3_arg3( f3_arg0, f3_arg1 )
	if f3_arg0.options and #f3_arg0.options > 0 then
		if type( f3_arg0.options[1] ) == "userdata" then
			for f3_local1 = 1, #f3_arg0.options, 1 do
				f3_arg0.options[f3_local1]:addEventHandler( "button_over", function ( f4_arg0, f4_arg1 )
					f3_arg0:processEvent( {
						name = "optionwindow_button_over"
					} )
				end )
				f3_arg0.options[f3_local1]:addEventHandler( "button_over_disable", function ( f5_arg0, f5_arg1 )
					f3_arg0:processEvent( {
						name = "optionwindow_button_over"
					} )
				end )
				f3_arg0.buttonList:addElement( f3_arg0.options[f3_local1] )
			end
			f3_arg0.SubmenuGrid:UpdateOptions( {} )
		elseif f3_arg0.SubmenuGrid then
			f3_arg0.SubmenuGrid:UpdateOptions( f3_arg0.options )
		end
	end
	f3_arg0.currCategory = f3_arg4
end

function PostLoadFunc( f6_arg0, f6_arg1, f6_arg2 )
	local buttonList = LUI.UIVerticalList.new()
	buttonList:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, 800 * _1080p )
	buttonList.id = "buttonListId"
	buttonList:SetAlignment( LUI.Alignment.Top )
	buttonList:SetIgnoreStretchingChildren( true )
	buttonList:SetAdjustSizeToContent( true )
	buttonList:SetSpacing( 7 )
	f6_arg0:addElement( buttonList )
	f6_arg0.buttonList = buttonList
	
	local f6_local1 = nil
	f6_local1 = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f6_arg1
	} )
	f6_local1.id = "ButtonDescriptionText"
	f6_local1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 778, 0, _1080p * 32 )
	f6_arg0.ButtonDescriptionText = f6_local1
	local f6_local2 = MenuBuilder.BuildRegisteredType( "PopupFrame", {
		controllerIndex = f6_arg1,
		hideBackground = true
	} )
	f6_arg0.OptionDecorations = f6_local2
	assert( f6_local2.MeasureTitle )
	assert( f6_local2.SetTitle )
	f6_local2:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	f6_arg0.buttonList:addElement( f6_local2 )
	local f6_local3 = nil
	f6_local3 = MenuBuilder.BuildRegisteredType( "PCOptionSubmenuGrid", {
		controllerIndex = f6_arg1
	} )
	f6_local3.id = "SubmenuGrid"
	f6_local3:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, 0 )
	f6_arg0.buttonList:addElement( f6_local3 )
	f6_arg0.SubmenuGrid = f6_local3
	f6_arg0:addElement( f6_local1 )
	f6_arg0.RefreshCurrentOptions = f0_local0
	f6_arg0.ClearCurrentOptions = f0_local1
	f6_arg0.UpdateOptions = f0_local2
	f6_arg0.options = {}
	f6_arg0:registerEventHandler( "hide_description_text", function ( element, event )
		f6_arg0.ButtonDescriptionText:SetAlpha( 0, 0 )
	end )
	f6_arg0:registerEventHandler( "show_description_text", function ( element, event )
		f6_arg0.ButtonDescriptionText:SetAlpha( 1, 0 )
	end )
end

function PCOptionWindow( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1000 * _1080p, 0, 800 * _1080p )
	self.id = "PCOptionWindow"
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	local f9_local2 = self
	self:SetSpacing( 10 * _1080p )
	PostLoadFunc( self, f9_local1, controller )
	return self
end

MenuBuilder.registerType( "PCOptionWindow", PCOptionWindow )
LockTable( _M )

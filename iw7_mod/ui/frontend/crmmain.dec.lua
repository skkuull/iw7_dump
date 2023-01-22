local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.CRM"
f0_local1 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = CRM.GetMenuMessageDataSources( f0_local0, f1_arg1 )
	local f1_local1 = LUI.DataSourceFromList.new( #f1_local0 )
	f1_local1.MakeDataSourceAtIndex = function ( f2_arg0, f2_arg1 )
		return f1_local0[f2_arg1 + 1]
	end
	
	f1_local1.GetDefaultFocusIndex = function ()
		return f1_arg0.CRMList:GetContentOffset( LUI.DIRECTION.horizontal )
	end
	
	if f1_local1:GetCountValue( f1_arg1 ) == 0 then
		f1_arg0.noData = true
		if f1_arg0.timer then
			f1_arg0.timer:closeTree()
			f1_arg0.timer = nil
		end
		f1_arg0:SetAlpha( 0, 0 )
		return 
	elseif not f1_arg0.timer then
		f1_arg0.timer = LUI.UITimer.new( nil, {
			interval = CRM.viewTime,
			event = "scroll_crm"
		} )
		f1_arg0:addElement( f1_arg0.timer )
	end
	f1_arg0.noData = false
	f1_arg0:SetAlpha( 1, 0 )
	f1_arg0.CRMList:SetGridDataSource( f1_local1, f1_arg1 )
	f1_arg0.CRMList:SetDataSource( f1_local1:GetDataSourceAtIndex( 0, f1_arg1 ), f1_arg1 )
	f1_arg0.CRMList:SetPosition( {
		x = 0,
		y = 0
	}, true )
	f1_arg0.Pips:UpdateChildren( 0, 0 )
end

f0_local2 = function ( f4_arg0, f4_arg1, f4_arg2 )
	assert( f4_arg0.CRMList )
	assert( f4_arg0.CRMAction )
	assert( f4_arg0.Pips )
	f4_arg0.CRMList:SetMask( f4_arg0.Mask )
	local f4_local0 = false
	local f4_local1 = f4_arg0._sequences.Minimize
	f4_arg0.Minimize = function ( f5_arg0 )
		f4_local1()
		f4_local0 = true
	end
	
	f4_arg0._sequences.Minimize = function ()
		f4_arg0:Minimize()
	end
	
	f4_arg0.timer = LUI.UITimer.new( nil, {
		interval = CRM.viewTime,
		event = "scroll_crm"
	} )
	f4_arg0:addElement( f4_arg0.timer )
	f0_local1( f4_arg0, f4_arg1 )
	f4_arg0.CRMList:SetTargetColumn( 0, false, true )
	f4_arg0.Pips:UpdateChildren( 0, 0 )
	f4_arg0.CRMAction:SetDataSourceThroughElement( f4_arg0.CRMList, nil )
	f4_arg0:addEventHandler( "update_crm_data", function ( f7_arg0, f7_arg1 )
		f0_local1( f7_arg0, f7_arg1.controllerIndex )
		return true
	end )
	f4_arg0:addEventHandler( "comm_widget_data_refresh", function ( f8_arg0, f8_arg1 )
		f0_local1( f8_arg0, f4_arg1 )
		return true
	end )
	local f4_local2 = function ( f9_arg0 )
		if not f4_arg0.noData then
			local f9_local0 = f4_arg0.CRMList:GetContentOffset( LUI.DIRECTION.horizontal )
			local f9_local1 = f4_arg0.CRMList:GetDataSource()
			if f9_local1.content_long and f9_local1.content_long:GetValue( f4_arg1 ) ~= "" then
				local f9_local2 = f9_local1.layout_type
				if f9_local2 then
					f9_local2 = f9_local1.layout_type:GetValue( f4_arg1 )
				end
				CRM.OpenCRMWindow( f9_local2, f9_local1.location_id:GetValue( f4_arg1 ), f9_local1.message_index:GetValue( f4_arg1 ), f4_arg1 )
			elseif f9_local1.actionFunction then
				f9_local1.actionFunction( f4_arg0, f9_arg0 )
				return true
			end
		end
	end
	
	local f4_local3 = LUI.UIBindButton.new()
	f4_local3.id = "selfBindButton"
	f4_arg0:addElement( f4_local3 )
	f4_local3:addEventHandler( "button_left_trigger", function ( f10_arg0, f10_arg1 )
		f4_local2( f10_arg1 )
	end )
	f4_arg0:addEventHandler( "scroll_crm", function ( f11_arg0, f11_arg1 )
		local f11_local0 = f11_arg0.CRMList:GetContentOffset( LUI.DIRECTION.horizontal )
		if f11_local0 then
			local f11_local1
			if f11_arg0.CRMList:GetContentSize( LUI.DIRECTION.horizontal ) - 1 < f11_local0 + 1 then
				f11_local1 = 0
				if not f11_local1 then
				
				else
					local f11_local2 = f11_arg0.CRMList:GetGridDataSource()
					local f11_local3 = f11_local2:GetDataSourceAtIndex( f11_local1, f4_arg1 )
					f11_arg0.CRMList:SetDataSource( f11_local3, f4_arg1 )
					f11_arg0.CRMList:SetTargetColumn( f11_local1, true, false )
					f11_arg0.Pips:UpdateChildren( f11_local1, 0 )
					if (not f11_local3.action or f11_local3.action:GetValue( f4_arg1 ) ~= "redeem") and not CRM.IsLocationMOTD( f11_local3.location_id:GetValue( f4_arg1 ) ) then
						CRM.ViewMessage( f11_local3, f4_arg1 )
					end
				end
			end
			f11_local1 = f11_local0 + 1
		end
	end )
	if Engine.IsPC() then
		local f4_local4 = function ( f12_arg0, f12_arg1 )
			ACTIONS.AnimateSequence( f4_arg0.CRMAction, "MouseFocused" )
			ACTIONS.AnimateSequence( f4_arg0, "MouseFocused" )
		end
		
		local f4_local5 = function ( f13_arg0, f13_arg1 )
			ACTIONS.AnimateSequence( f4_arg0.CRMAction, "MouseUnfocused" )
			ACTIONS.AnimateSequence( f4_arg0, "MouseUnfocused" )
		end
		
		f4_arg0.CRMAction:SetHandleMouse( true )
		f4_arg0.CRMAction:registerEventHandler( "mouseenter", f4_local4 )
		f4_arg0.CRMAction:registerEventHandler( "mouseleave", f4_local5 )
		f4_arg0.CRMAction:registerEventHandler( "leftmousedown", function ( element, event )
			
		end )
		f4_arg0.CRMAction:registerEventHandler( "leftmouseup", function ( element, event )
			if event.inside then
				f4_local2( event )
			end
		end )
		f4_arg0.CRMList:SetHandleMouse( true )
		f4_arg0.CRMList:registerEventHandler( "mouseenter", function ( element, event )
			if not f4_local0 then
				f4_local4( element, event )
			end
		end )
		f4_arg0.CRMList:registerEventHandler( "mouseleave", function ( element, event )
			if not f4_local0 then
				f4_local5( element, event )
			end
		end )
		f4_arg0.CRMList:registerEventHandler( "leftmousedown", function ( element, event )
			
		end )
		f4_arg0.CRMList:registerEventHandler( "leftmouseup", function ( element, event )
			if not f4_local0 and event.inside then
				f4_local2( event )
			end
		end )
	end
	local f4_local4 = nil
	local f4_local5 = function ()
		CRM.SendQueuedMessages()
		local f20_local0 = f4_arg0:Wait( Engine.GetDvarInt( "lui_crm_messageSendBatchIntervalSecs" ) * 1000 )
		f20_local0.onComplete = f4_local4
	end
	
	f4_local5()
end

function CRMMain( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 311 * _1080p, 0, 194 * _1080p )
	self.id = "CRMMain"
	self._animationSets = {}
	self._sequences = {}
	local f21_local1 = controller and controller.controllerIndex
	if not f21_local1 and not Engine.InFrontend() then
		f21_local1 = self:getRootController()
	end
	assert( f21_local1 )
	local f21_local2 = self
	local CRMList = nil
	
	CRMList = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 1,
		controllerIndex = f21_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CRMListItem", {
				controllerIndex = f21_local1
			} )
		end,
		wrapX = true,
		wrapY = false,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 29,
		spacingY = _1080p * 29,
		columnWidth = _1080p * 311,
		rowHeight = _1080p * 194,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	CRMList.id = "CRMList"
	CRMList:setUseStencil( true )
	CRMList:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 194 )
	self:addElement( CRMList )
	self.CRMList = CRMList
	
	local CRMAction = nil
	
	CRMAction = MenuBuilder.BuildRegisteredType( "CRMAction", {
		controllerIndex = f21_local1
	} )
	CRMAction.id = "CRMAction"
	CRMAction:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -2, _1080p * 2, _1080p * 212.5, _1080p * 257.5 )
	self:addElement( CRMAction )
	self.CRMAction = CRMAction
	
	local Pips = nil
	
	Pips = LUI.Pips.new( {
		spacing = _1080p * 5,
		direction = LUI.DIRECTION.horizontal,
		alignment = LUI.Alignment.Center,
		buildPip = function ()
			return MenuBuilder.BuildRegisteredType( "Pip", {
				controllerIndex = f21_local1
			} )
		end,
		controllerIndex = f21_local1
	} )
	Pips.id = "Pips"
	Pips:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -50.25, _1080p * 49.75, _1080p * 199, _1080p * 215 )
	self:addElement( Pips )
	self.Pips = Pips
	
	local LeftBracket = nil
	
	LeftBracket = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	LeftBracket.id = "LeftBracket"
	LeftBracket:SetRGBFromInt( 0, 0 )
	LeftBracket:SetAlpha( 0.7, 0 )
	LeftBracket:SetBorderThicknessRight( _1080p * 0, 0 )
	LeftBracket:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -6, _1080p * 6, _1080p * -6, _1080p * 200 )
	self:addElement( LeftBracket )
	self.LeftBracket = LeftBracket
	
	local RightBracket = nil
	
	RightBracket = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	RightBracket.id = "RightBracket"
	RightBracket:SetRGBFromInt( 0, 0 )
	RightBracket:SetAlpha( 0.7, 0 )
	RightBracket:SetBorderThicknessLeft( _1080p * 0, 0 )
	RightBracket:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -6, _1080p * 6, _1080p * -6, _1080p * 200 )
	self:addElement( RightBracket )
	self.RightBracket = RightBracket
	
	local Mask = nil
	
	Mask = LUI.UIImage.new()
	Mask.id = "Mask"
	Mask:setImage( RegisterMaterial( "wdg_large_mask" ), 0 )
	Mask:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -0.25, _1080p * 1, 0, 0 )
	self:addElement( Mask )
	self.Mask = Mask
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CRMList:RegisterAnimationSequence( "Minimize", {
			{
				function ()
					return self.CRMList:SetAlpha( 0, 0 )
				end
			}
		} )
		Pips:RegisterAnimationSequence( "Minimize", {
			{
				function ()
					return self.Pips:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Pips:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -155.5, _1080p * -55.5, _1080p * 40, _1080p * 56, 0 )
				end
			}
		} )
		LeftBracket:RegisterAnimationSequence( "Minimize", {
			{
				function ()
					return self.LeftBracket:SetAlpha( 0, 0 )
				end
			}
		} )
		RightBracket:RegisterAnimationSequence( "Minimize", {
			{
				function ()
					return self.RightBracket:SetAlpha( 0, 0 )
				end
			}
		} )
		Mask:RegisterAnimationSequence( "Minimize", {
			{
				function ()
					return self.Mask:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Minimize = function ()
			CRMList:AnimateSequence( "Minimize" )
			Pips:AnimateSequence( "Minimize" )
			LeftBracket:AnimateSequence( "Minimize" )
			RightBracket:AnimateSequence( "Minimize" )
			Mask:AnimateSequence( "Minimize" )
		end
		
		CRMAction:RegisterAnimationSequence( "Opening", {
			{
				function ()
					return self.CRMAction:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CRMAction:SetAlpha( 0, 400 )
				end,
				function ()
					return self.CRMAction:SetAlpha( 1, 80 )
				end,
				function ()
					return self.CRMAction:SetAlpha( 0, 80 )
				end,
				function ()
					return self.CRMAction:SetAlpha( 1, 60 )
				end,
				function ()
					return self.CRMAction:SetAlpha( 0, 60 )
				end,
				function ()
					return self.CRMAction:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CRMAction:SetAlpha( 0, 70 )
				end,
				function ()
					return self.CRMAction:SetAlpha( 1, 50 )
				end
			}
		} )
		Pips:RegisterAnimationSequence( "Opening", {
			{
				function ()
					return self.Pips:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Pips:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Pips:SetAlpha( 1, 200 )
				end
			}
		} )
		LeftBracket:RegisterAnimationSequence( "Opening", {
			{
				function ()
					return self.LeftBracket:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 153, _1080p * 165, _1080p * -6, _1080p * 200, 0 )
				end,
				function ()
					return self.LeftBracket:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -6, _1080p * 6, _1080p * -6, _1080p * 200, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		RightBracket:RegisterAnimationSequence( "Opening", {
			{
				function ()
					return self.RightBracket:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -165, _1080p * -153, _1080p * -6, _1080p * 200, 0 )
				end,
				function ()
					return self.RightBracket:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -6, _1080p * 6, _1080p * -6, _1080p * 200, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		Mask:RegisterAnimationSequence( "Opening", {
			{
				function ()
					return self.Mask:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -1, _1080p * 1, 0, 0, 0 )
				end,
				function ()
					return self.Mask:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -160, _1080p * 160, 0, 0, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Opening = function ()
			CRMAction:AnimateSequence( "Opening" )
			Pips:AnimateSequence( "Opening" )
			LeftBracket:AnimateSequence( "Opening" )
			RightBracket:AnimateSequence( "Opening" )
			Mask:AnimateSequence( "Opening" )
		end
		
		Pips:RegisterAnimationSequence( "MouseFocused", {
			{
				function ()
					return self.Pips:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			}
		} )
		LeftBracket:RegisterAnimationSequence( "MouseFocused", {
			{
				function ()
					return self.LeftBracket:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			}
		} )
		RightBracket:RegisterAnimationSequence( "MouseFocused", {
			{
				function ()
					return self.RightBracket:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			}
		} )
		self._sequences.MouseFocused = function ()
			Pips:AnimateSequence( "MouseFocused" )
			LeftBracket:AnimateSequence( "MouseFocused" )
			RightBracket:AnimateSequence( "MouseFocused" )
		end
		
		Pips:RegisterAnimationSequence( "MouseUnfocused", {
			{
				function ()
					return self.Pips:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		LeftBracket:RegisterAnimationSequence( "MouseUnfocused", {
			{
				function ()
					return self.LeftBracket:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		RightBracket:RegisterAnimationSequence( "MouseUnfocused", {
			{
				function ()
					return self.RightBracket:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.MouseUnfocused = function ()
			Pips:AnimateSequence( "MouseUnfocused" )
			LeftBracket:AnimateSequence( "MouseUnfocused" )
			RightBracket:AnimateSequence( "MouseUnfocused" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	CRMList:AddScrollbar( Pips )
	f0_local2( self, f21_local1, controller )
	ACTIONS.AnimateSequence( self, "Opening" )
	return self
end

MenuBuilder.registerType( "CRMMain", CRMMain )
LockTable( _M )

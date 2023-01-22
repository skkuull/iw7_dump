local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = function ()
		local f2_local0 = f1_arg0:GetDataSource()
		if f2_local0.action_title then
			f2_local0 = f1_arg0:GetDataSource()
			if f2_local0.action_title:GetValue( f1_arg1 ) == "" then
				f2_local0 = f1_arg0:GetDataSource()
				if f2_local0.content_long then
					f2_local0 = f1_arg0:GetDataSource()
					if f2_local0.content_long:GetValue( f1_arg1 ) == "" then
					
					elseif Engine.IsGamepadEnabled() == 1 then
						ACTIONS.AnimateSequence( f1_arg0, "ShowButton" )
						ACTIONS.AnimateSequence( f1_arg0, "HideKey" )
					else
						ACTIONS.AnimateSequence( f1_arg0, "HideButton" )
						ACTIONS.AnimateSequence( f1_arg0, "ShowKey" )
					end
				end
				ACTIONS.AnimateSequence( f1_arg0, "HideButton" )
				ACTIONS.AnimateSequence( f1_arg0, "HideKey" )
			elseif Engine.IsGamepadEnabled() == 1 then
				ACTIONS.AnimateSequence( f1_arg0, "ShowButton" )
				ACTIONS.AnimateSequence( f1_arg0, "HideKey" )
			else
				ACTIONS.AnimateSequence( f1_arg0, "HideButton" )
				ACTIONS.AnimateSequence( f1_arg0, "ShowKey" )
			end
		else
			f2_local0 = f1_arg0:GetDataSource()
			if f2_local0.content_long then
				f2_local0 = f1_arg0:GetDataSource()
				if f2_local0.content_long:GetValue( f1_arg1 ) == "" then
				
				elseif Engine.IsGamepadEnabled() == 1 then
					ACTIONS.AnimateSequence( f1_arg0, "ShowButton" )
					ACTIONS.AnimateSequence( f1_arg0, "HideKey" )
				else
					ACTIONS.AnimateSequence( f1_arg0, "HideButton" )
					ACTIONS.AnimateSequence( f1_arg0, "ShowKey" )
				end
			end
			ACTIONS.AnimateSequence( f1_arg0, "HideButton" )
			ACTIONS.AnimateSequence( f1_arg0, "HideKey" )
		end
	end
	
	local f1_local1 = f1_arg0:SubscribeToDataSourceThroughElement( f1_arg0, nil, function ()
		local f3_local0 = f1_arg0:GetDataSource()
		if f3_local0.action_title then
			f1_arg0:SubscribeToModelThroughElement( f1_arg0, "action_title", f1_local0 )
		elseif f3_local0.content_long then
			f1_arg0:SubscribeToModelThroughElement( f1_arg0, "content_long", f1_local0 )
		end
	end )
	f1_local1.unlinkOnCallback = true
end

function CRMAction( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 315 * _1080p, 0, 45 * _1080p )
	self.id = "CRMAction"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local ActionIcon = nil
	
	ActionIcon = LUI.UIImage.new()
	ActionIcon.id = "ActionIcon"
	ActionIcon:setImage( RegisterMaterial( "button_trigger_left" ), 0 )
	ActionIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2.25, _1080p * 43.33, _1080p * 9.86, _1080p * 35.14 )
	self:addElement( ActionIcon )
	self.ActionIcon = ActionIcon
	
	local ActionKeyBorder = nil
	
	ActionKeyBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	ActionKeyBorder.id = "ActionKeyBorder"
	ActionKeyBorder:SetAlpha( 0, 0 )
	ActionKeyBorder:SetBorderThicknessLeft( _1080p * 2, 0 )
	ActionKeyBorder:SetBorderThicknessRight( _1080p * 2, 0 )
	ActionKeyBorder:SetBorderThicknessTop( _1080p * 2, 0 )
	ActionKeyBorder:SetBorderThicknessBottom( _1080p * 2, 0 )
	ActionKeyBorder:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11.04, _1080p * 34.54, _1080p * 11.5, _1080p * 33.5 )
	self:addElement( ActionKeyBorder )
	self.ActionKeyBorder = ActionKeyBorder
	
	local f4_local5 = nil
	if not Engine.IsConsoleGame() then
		f4_local5 = LUI.UIText.new()
		f4_local5.id = "ActionKey"
		f4_local5:SetAlpha( 0, 0 )
		f4_local5:setText( Engine.Localize( "PLATFORM_KB_LEFT_TRIGGER_BUTTON" ), 0 )
		f4_local5:SetFontSize( 20 * _1080p )
		f4_local5:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f4_local5:SetAlignment( LUI.Alignment.Center )
		f4_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12.21, _1080p * 33.37, _1080p * 12.39, _1080p * 32.61 )
		self:addElement( f4_local5 )
		self.ActionKey = f4_local5
	end
	local ActionText = nil
	
	ActionText = LUI.UIStyledText.new()
	ActionText.id = "ActionText"
	ActionText:SetFontSize( 22 * _1080p )
	ActionText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ActionText:SetAlignment( LUI.Alignment.Left )
	ActionText:SetOptOutRightToLeftAlignmentFlip( true )
	ActionText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 49, _1080p * 980, _1080p * 11.5, _1080p * 33.5 )
	ActionText:SubscribeToModelThroughElement( self, "content_short", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.content_short:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			ActionText:setText( f5_local0, 0 )
		end
	end )
	self:addElement( ActionText )
	self.ActionText = ActionText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ActionIcon:RegisterAnimationSequence( "HideButton", {
			{
				function ()
					return self.ActionIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideButton = function ()
			ActionIcon:AnimateSequence( "HideButton" )
		end
		
		ActionIcon:RegisterAnimationSequence( "ShowButton", {
			{
				function ()
					return self.ActionIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowButton = function ()
			ActionIcon:AnimateSequence( "ShowButton" )
		end
		
		ActionKeyBorder:RegisterAnimationSequence( "ShowKey", {
			{
				function ()
					return self.ActionKeyBorder:SetAlpha( 1, 0 )
				end
			}
		} )
		if not Engine.IsConsoleGame() then
			f4_local5:RegisterAnimationSequence( "ShowKey", {
				{
					function ()
						return self.ActionKey:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.ShowKey = function ()
			ActionKeyBorder:AnimateSequence( "ShowKey" )
			if not Engine.IsConsoleGame() then
				f4_local5:AnimateSequence( "ShowKey" )
			end
		end
		
		ActionKeyBorder:RegisterAnimationSequence( "HideKey", {
			{
				function ()
					return self.ActionKeyBorder:SetAlpha( 0, 0 )
				end
			}
		} )
		if not Engine.IsConsoleGame() then
			f4_local5:RegisterAnimationSequence( "HideKey", {
				{
					function ()
						return self.ActionKey:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HideKey = function ()
			ActionKeyBorder:AnimateSequence( "HideKey" )
			if not Engine.IsConsoleGame() then
				f4_local5:AnimateSequence( "HideKey" )
			end
		end
		
		ActionKeyBorder:RegisterAnimationSequence( "MouseFocused", {
			{
				function ()
					return self.ActionKeyBorder:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			}
		} )
		if not Engine.IsConsoleGame() then
			f4_local5:RegisterAnimationSequence( "MouseFocused", {
				{
					function ()
						return self.ActionKey:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
					end
				}
			} )
		end
		ActionText:RegisterAnimationSequence( "MouseFocused", {
			{
				function ()
					return self.ActionText:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			}
		} )
		self._sequences.MouseFocused = function ()
			ActionKeyBorder:AnimateSequence( "MouseFocused" )
			if not Engine.IsConsoleGame() then
				f4_local5:AnimateSequence( "MouseFocused" )
			end
			ActionText:AnimateSequence( "MouseFocused" )
		end
		
		ActionKeyBorder:RegisterAnimationSequence( "MouseUnfocused", {
			{
				function ()
					return self.ActionKeyBorder:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		if not Engine.IsConsoleGame() then
			f4_local5:RegisterAnimationSequence( "MouseUnfocused", {
				{
					function ()
						return self.ActionKey:SetRGBFromInt( 16777215, 0 )
					end
				}
			} )
		end
		ActionText:RegisterAnimationSequence( "MouseUnfocused", {
			{
				function ()
					return self.ActionText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.MouseUnfocused = function ()
			ActionKeyBorder:AnimateSequence( "MouseUnfocused" )
			if not Engine.IsConsoleGame() then
				f4_local5:AnimateSequence( "MouseUnfocused" )
			end
			ActionText:AnimateSequence( "MouseUnfocused" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "CRMAction", CRMAction )
LockTable( _M )

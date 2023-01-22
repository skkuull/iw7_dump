local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.GenericItemInfo, "WARNING: Map Detail Items Are Missing..." )
	local f1_local0 = f1_arg0.GenericItemInfo
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "name", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f1_local0.HeaderText:setText( ToUpperCase( Engine.Localize( f2_local0.name:GetValue( f1_arg1 ) ) ), 0 )
	end )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "desc", function ()
		local f3_local0 = f1_arg0:GetDataSource()
		f1_local0.BodyText:setText( Engine.Localize( f3_local0.desc:GetValue( f1_arg1 ) ), 0 )
	end )
end

function ModeDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 900 * _1080p, 0, 470 * _1080p )
	self.id = "ModeDetails"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 5,
		borderThicknessRight = _1080p * 5,
		borderThicknessTop = _1080p * 5,
		borderThicknessBottom = _1080p * 5
	} )
	Border.id = "Border"
	Border:SetRGBFromInt( 0, 0 )
	Border:SetZRotation( 45, 0 )
	Border:SetBorderThicknessLeft( _1080p * 5, 0 )
	Border:SetBorderThicknessRight( _1080p * 5, 0 )
	Border:SetBorderThicknessTop( _1080p * 5, 0 )
	Border:SetBorderThicknessBottom( _1080p * 5, 0 )
	Border:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 491.13, _1080p * 821.87, _1080p * 2, _1080p * 329 )
	self:addElement( Border )
	self.Border = Border
	
	local GenericItemInfo = nil
	
	GenericItemInfo = MenuBuilder.BuildRegisteredType( "GenericItemInfo", {
		controllerIndex = f4_local1
	} )
	GenericItemInfo.id = "GenericItemInfo"
	GenericItemInfo.BodyText:setText( "", 0 )
	GenericItemInfo.HeaderText:setText( ToUpperCase( "" ), 0 )
	GenericItemInfo:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -132, _1080p * 8 )
	self:addElement( GenericItemInfo )
	self.GenericItemInfo = GenericItemInfo
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 463.13, _1080p * 847.87, _1080p * -25, _1080p * 356 )
	Icon:SubscribeToModelThroughElement( self, "image", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.image:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			Icon:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	local WipeWarningIcon = nil
	
	WipeWarningIcon = LUI.UIImage.new()
	WipeWarningIcon.id = "WipeWarningIcon"
	WipeWarningIcon:SetAlpha( 0, 0 )
	WipeWarningIcon:setImage( RegisterMaterial( "hud_icon_warning" ), 0 )
	WipeWarningIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 43, _1080p * 107, _1080p * 2, _1080p * 66 )
	self:addElement( WipeWarningIcon )
	self.WipeWarningIcon = WipeWarningIcon
	
	local WipeWarningLabel = nil
	
	WipeWarningLabel = LUI.UIText.new()
	WipeWarningLabel.id = "WipeWarningLabel"
	WipeWarningLabel:SetAlpha( 0, 0 )
	WipeWarningLabel:setText( Engine.Localize( "LUA_MENU_MP_LOADOUT_WIPE_WARN" ), 0 )
	WipeWarningLabel:SetFontSize( 22 * _1080p )
	WipeWarningLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WipeWarningLabel:SetAlignment( LUI.Alignment.Left )
	WipeWarningLabel:SetOptOutRightToLeftAlignmentFlip( true )
	WipeWarningLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 539, _1080p * 23, _1080p * 45 )
	self:addElement( WipeWarningLabel )
	self.WipeWarningLabel = WipeWarningLabel
	
	local WipeWarningText = nil
	
	WipeWarningText = LUI.UIText.new()
	WipeWarningText.id = "WipeWarningText"
	WipeWarningText:SetAlpha( 0, 0 )
	WipeWarningText:setText( Engine.Localize( "GAME_WARNING" ), 0 )
	WipeWarningText:SetFontSize( 22 * _1080p )
	WipeWarningText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WipeWarningText:SetAlignment( LUI.Alignment.Center )
	WipeWarningText:SetOptOutRightToLeftAlignmentFlip( true )
	WipeWarningText:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 150, _1080p * 55, _1080p * 77 )
	self:addElement( WipeWarningText )
	self.WipeWarningText = WipeWarningText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Border:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.Border:SetScale( -0.5, 0 )
				end,
				function ()
					return self.Border:SetScale( 0, 400, LUI.EASING.outBack )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.Icon:SetScale( -0.25, 0 )
				end,
				function ()
					return self.Icon:SetScale( 0, 300, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Update = function ()
			Border:AnimateSequence( "Update" )
			Icon:AnimateSequence( "Update" )
		end
		
		WipeWarningIcon:RegisterAnimationSequence( "ShowWipeWarning", {
			{
				function ()
					return self.WipeWarningIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		WipeWarningLabel:RegisterAnimationSequence( "ShowWipeWarning", {
			{
				function ()
					return self.WipeWarningLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		WipeWarningText:RegisterAnimationSequence( "ShowWipeWarning", {
			{
				function ()
					return self.WipeWarningText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowWipeWarning = function ()
			WipeWarningIcon:AnimateSequence( "ShowWipeWarning" )
			WipeWarningLabel:AnimateSequence( "ShowWipeWarning" )
			WipeWarningText:AnimateSequence( "ShowWipeWarning" )
		end
		
		WipeWarningIcon:RegisterAnimationSequence( "HideWipeWarning", {
			{
				function ()
					return self.WipeWarningIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		WipeWarningLabel:RegisterAnimationSequence( "HideWipeWarning", {
			{
				function ()
					return self.WipeWarningLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		WipeWarningText:RegisterAnimationSequence( "HideWipeWarning", {
			{
				function ()
					return self.WipeWarningText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideWipeWarning = function ()
			WipeWarningIcon:AnimateSequence( "HideWipeWarning" )
			WipeWarningLabel:AnimateSequence( "HideWipeWarning" )
			WipeWarningText:AnimateSequence( "HideWipeWarning" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "image", function ()
		ACTIONS.AnimateSequence( self, "Update" )
	end )
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "ModeDetails", ModeDetails )
LockTable( _M )

local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 10
f0_local1 = 1
f0_local2 = 2
local f0_local3 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	if not MenuBuilder.IsTypeRegistered( f1_arg1 ) then
		DebugPrint( "ERROR: Attempting to use unknown widget " .. f1_arg1 .. ". Ensure this widget is properly included for your game mode!" )
		return nil
	end
	local f1_local0 = MenuBuilder.BuildRegisteredType( f1_arg1, {
		controllerIndex = f1_arg3
	} )
	local f1_local1 = {
		entityTag = f1_arg2,
		isLockedToTag = f1_arg6,
		naturalDistance = f1_arg7,
		minScale = f1_arg8,
		maxScale = f1_arg9
	}
	f1_local0.id = "weaponWidget" .. f1_arg1
	f1_local0:SetupAnchoredElement( f1_local1 )
	if f1_arg4 then
		f1_local0:AttachToReticleViewModel()
	else
		f1_local0:AttachToViewModel( f1_arg5 )
	end
	f1_arg0:addElement( f1_local0 )
	return f1_local0
end

local f0_local4 = function ( f2_arg0, f2_arg1, f2_arg2 )
	if not MenuBuilder.IsTypeRegistered( f2_arg2 ) then
		DebugPrint( "ERROR: Attempting to use unknown widget " .. f2_arg2 .. ". Ensure this widget is properly included for your game mode!" )
		return nil
	else
		local f2_local0 = MenuBuilder.BuildRegisteredType( f2_arg2, {
			controllerIndex = f2_arg1
		} )
		f2_local0.id = "crosshairWidget" .. f2_arg2
		f2_local0:SetAnchors( 0, 0, 0, 0, 0 )
		f2_local0:SetLeft( 0, 0 )
		f2_local0:SetRight( 0, 0 )
		f2_local0:SetTop( 0, 0 )
		f2_local0:SetBottom( 0, 0 )
		f2_arg0:addElement( f2_local0 )
		return f2_local0
	end
end

local f0_local5 = function ( f3_arg0, f3_arg1 )
	if f3_arg0.smartPelletAttachment then
		f3_arg0.smartPelletAttachment:closeTree()
		f3_arg0.smartPelletAttachment = nil
	end
	if f3_arg1 then
		local self = LUI.UIElement.new( {
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			top = 0,
			bottom = 0,
			left = 0,
			right = 0,
			red = 1,
			green = 1,
			blue = 1,
			alpha = 1
		} )
		self.id = "smartPelletAttachment"
		self:SetupSmartPelletAttachment()
		f3_arg0.smartPelletAttachment = self
		f3_arg0:addElement( self )
	end
	f3_arg0.isSmartPelletWeapon = f3_arg1
end

local f0_local6 = function ( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = "tag_reticle_attach"
	local f4_local1 = f4_arg0.reticleType ~= f4_arg2
	if f4_arg0.scopeReticle and f4_local1 then
		f4_arg0.scopeReticle:closeTree()
		f4_arg0.scopeReticle = nil
	end
	if f4_arg2 ~= nil and #f4_arg2 > 0 then
		if f4_local1 then
			f4_arg0.scopeReticle = f0_local3( f4_arg0, f4_arg2, f4_local0, f4_arg1, true, true, Game.GetReticleWidgetLockToTag( f4_arg1 ), Game.GetReticleNaturalDistance( f4_arg1, false ), Game.GetReticleMinScale( f4_arg1, false ), Game.GetReticleMaxScale( f4_arg1, false ) )
			f4_arg0.reticleType = f4_arg2
		end
	else
		f4_arg0.reticleType = nil
	end
end

local f0_local7 = function ( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = "tag_reticle_attach2"
	local f5_local1 = f5_arg0.altReticleType ~= f5_arg2
	if f5_arg0.altReticle and f5_local1 then
		f5_arg0.altReticle:closeTree()
		f5_arg0.altReticle = nil
	end
	if f5_arg2 ~= nil and #f5_arg2 > 0 then
		if f5_local1 then
			f5_arg0.altReticle = f0_local3( f5_arg0, f5_arg2, f5_local0, f5_arg1, true, true, Game.GetAltReticleWidgetLockToTag( f5_arg1 ), Game.GetReticleNaturalDistance( f5_arg1, true ), Game.GetReticleMinScale( f5_arg1, true ), Game.GetReticleMaxScale( f5_arg1, true ) )
			f5_arg0.altReticleType = f5_arg2
		end
	else
		f5_arg0.altReticleType = nil
	end
end

local f0_local8 = function ( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local0 = nil
	local f6_local1 = false
	if f6_arg2 ~= nil and #f6_arg2 > 0 then
		f6_local0 = Game.GetWeaponWidgetTag( f6_arg1 )
		f6_local1 = Game.GetTagIsVisible( f6_arg1, f6_local0 )
	end
	local f6_local2 = f6_arg0.weaponWidgetType ~= f6_arg2
	if f6_arg0.weaponWidget and (f6_local2 or (f6_arg0.weaponWidgetBone ~= f6_local0) or not f6_local1) then
		f6_arg0.weaponWidget:closeTree()
		f6_arg0.weaponWidget = nil
	end
	if f6_arg2 ~= nil and #f6_arg2 > 0 and f6_local2 and f6_local1 then
		f6_arg0.weaponWidget = f0_local3( f6_arg0, f6_arg2, f6_local0, f6_arg1, false, Game.GetWeaponWidgetUsesScopeStencil( f6_arg1 ), true, f0_local0, f0_local1, f0_local2 )
		f6_arg0.weaponWidgetType = f6_arg2
		f6_arg0.weaponWidgetBone = f6_local0
	else
		f6_arg0.weaponWidgetType = nil
		f6_arg0.weaponWidgetBone = nil
	end
end

local f0_local9 = function ( f7_arg0, f7_arg1, f7_arg2 )
	if f7_arg0.maxNumAttachments ~= f7_arg2 then
		return true
	elseif not f7_arg0.attachmentsInfo then
		return true
	end
	local f7_local0 = 0
	for f7_local1 = 0, f7_arg2 - 1, 1 do
		local f7_local4 = Game.GetWeaponAttachmentWidgetName( f7_arg1, f7_local1 )
		local f7_local5 = Game.GetWeaponAttachmentWidgetTag( f7_arg1, f7_local1 )
		local f7_local6 = Game.GetWeaponAttachmentWidgetUsesScopeStencil( f7_arg1, f7_local1 )
		if f7_local4 ~= nil and #f7_local4 > 0 then
			f7_local0 = f7_local0 + 1
			if not f7_arg0.attachmentsInfo[f7_local0] then
				return true
			end
			if (f7_local4 ~= f7_arg0.attachmentsInfo[f7_local0].widgetType) or (f7_local5 ~= f7_arg0.attachmentsInfo[f7_local0].widgetAttachPoint) or f7_local6 ~= f7_arg0.attachmentsInfo[f7_local0].widgetUsesScopeStencil then
				return true
			end
		end
	end
	if f7_local0 ~= #f7_arg0.attachmentsList then
		return true
	end
	return false
end

local f0_local10 = function ( f8_arg0, f8_arg1, f8_arg2 )
	if f8_arg0.attachmentsList then
		for f8_local3, f8_local4 in ipairs( f8_arg0.attachmentsList ) do
			f8_arg0.attachmentsList[f8_local3]:closeTree()
			f8_arg0.attachmentsList[f8_local3] = nil
		end
	end
	f8_arg0.attachmentsList = nil
	f8_arg0.attachmentsInfo = nil
	f8_arg0.attachmentsList = {}
	f8_arg0.attachmentsInfo = {}
	f8_arg0.maxNumAttachments = f8_arg2
	for f8_local0 = 0, f8_arg2 - 1, 1 do
		local f8_local4 = Game.GetWeaponAttachmentWidgetName( f8_arg1, f8_local0 )
		local f8_local5 = Game.GetWeaponAttachmentWidgetTag( f8_arg1, f8_local0 )
		local f8_local6 = Game.GetWeaponAttachmentWidgetUsesScopeStencil( f8_arg1, f8_local0 )
		if f8_local4 ~= nil and #f8_local4 > 0 then
			f8_arg0.attachmentsList[#f8_arg0.attachmentsList + 1] = f0_local3( f8_arg0, f8_local4, f8_local5, f8_arg1, false, f8_local6, true, f0_local0, f0_local1, f0_local2 )
			f8_arg0.attachmentsInfo[#f8_arg0.attachmentsInfo + 1] = {
				widgetType = f8_local4,
				widgetAttachPoint = f8_local5,
				widgetUsesScopeStencil = f8_local6
			}
		end
	end
end

local f0_local11 = function ( f9_arg0, f9_arg1, f9_arg2 )
	if f9_arg0.crosshairWidget then
		f9_arg0.crosshairWidget:closeTree()
		f9_arg0.crosshairWidget = nil
	end
	if f9_arg2 ~= nil and #f9_arg2 > 0 then
		f9_arg0.crosshairWidget = f0_local4( f9_arg0, f9_arg1, f9_arg2 )
	end
	f9_arg0.crosshairWidgetType = f9_arg2
end

local f0_local12 = function ( f10_arg0, f10_arg1 )
	local f10_local0 = DataSources.inGame.player.currentWeapon.primaryReticleVisible:GetValue( f10_arg1 )
	local f10_local1 = DataSources.inGame.player.currentWeapon.altReticleVisible:GetValue( f10_arg1 )
	local f10_local2 = DataSources.inGame.player.currentWeapon.weaponInfoLUIWidgetsVisible:GetValue( f10_arg1 )
	local f10_local3 = DataSources.inGame.player.currentWeapon.hipfireCrosshairVisible:GetValue( f10_arg1 )
	if f10_local1 and not f10_local0 and not f10_arg0.altReticle then
		f10_local0 = true
		f10_local1 = false
	end
	if f10_arg0.scopeReticle then
		local f10_local4 = f10_arg0.scopeReticle
		local f10_local5 = f10_local4
		f10_local4 = f10_local4.SetAlpha
		local f10_local6
		if f10_local0 then
			f10_local6 = 1
			if not f10_local6 then
			
			else
				f10_local4( f10_local5, f10_local6, 0 )
			end
		end
		f10_local6 = 0
	end
	if f10_arg0.altReticle then
		local f10_local4 = f10_arg0.altReticle
		local f10_local5 = f10_local4
		f10_local4 = f10_local4.SetAlpha
		local f10_local6
		if f10_local1 then
			f10_local6 = 1
			if not f10_local6 then
			
			else
				f10_local4( f10_local5, f10_local6, 0 )
			end
		end
		f10_local6 = 0
	end
	if f10_arg0.smartPelletAttachment then
		local f10_local4 = f10_arg0.smartPelletAttachment
		local f10_local5 = f10_local4
		f10_local4 = f10_local4.SetAlpha
		local f10_local6
		if f10_local0 then
			f10_local6 = 1
			if not f10_local6 then
			
			else
				f10_local4( f10_local5, f10_local6, 0 )
			end
		end
		f10_local6 = 0
	end
	if f10_arg0.weaponWidget then
		local f10_local4 = f10_arg0.weaponWidget
		local f10_local5 = f10_local4
		f10_local4 = f10_local4.SetAlpha
		local f10_local6
		if f10_local2 then
			f10_local6 = 1
			if not f10_local6 then
			
			else
				f10_local4( f10_local5, f10_local6, 0 )
			end
		end
		f10_local6 = 0
	end
	if f10_arg0.attachmentsList then
		for f10_local8, f10_local9 in ipairs( f10_arg0.attachmentsList ) do
			local f10_local10 = f10_arg0.attachmentsList[f10_local8]
			local f10_local11 = f10_local10
			f10_local10 = f10_local10.SetAlpha
			local f10_local7
			if f10_local2 then
				f10_local7 = 1
				if not f10_local7 then
				
				else
					f10_local10( f10_local11, f10_local7, 0 )
				end
			end
			f10_local7 = 0
		end
	end
	if f10_arg0.crosshairWidget then
		local f10_local4 = f10_arg0.crosshairWidget
		local f10_local5 = f10_local4
		f10_local4 = f10_local4.SetAlpha
		local f10_local6
		if f10_local3 then
			f10_local6 = 1
			if not f10_local6 then
			
			else
				f10_local4( f10_local5, f10_local6, 0 )
			end
		end
		f10_local6 = 0
	end
end

function ScopeReticleManager()
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.id = "ScopeReticleManager"
	local f11_local1 = self:getRootController()
	local f11_local2 = function ( f12_arg0 )
		if Engine.GetDvarBool( "cg_lui_scope_reticles" ) then
			local f12_local0 = Game.GetScopeReticleWidget( f11_local1 )
			local f12_local1 = nil
			if Game.WeaponHasAltMode( f11_local1 ) then
				f12_local1 = Game.GetAltReticleWidget( f11_local1 )
			end
			local f12_local2 = Game.GetPlayerIsSmartPelletWeapon( f11_local1 )
			local f12_local3 = Game.GetWeaponWidgetName( f11_local1 )
			local f12_local4 = Game.GetNumWeaponAttachments( f11_local1 )
			local f12_local5 = Game.GetCrosshairWidget( f11_local1 )
			local f12_local6 = f0_local9( self, f11_local1, f12_local4 )
			if f12_local2 ~= self.isSmartPelletWeapon then
				f0_local5( self, f12_local2 )
			end
			f0_local6( self, f11_local1, f12_local0 )
			f0_local7( self, f11_local1, f12_local1 )
			f0_local8( self, f11_local1, f12_local3 )
			if f12_local6 then
				f0_local10( self, f11_local1, f12_local4 )
			end
			if self.crosshairWidgetType ~= f12_local5 then
				f0_local11( self, f11_local1, f12_local5 )
			end
			f0_local12( self, f11_local1 )
		end
	end
	
	local f11_local3 = DataSources.inGame.player.currentWeapon.scopeVariation
	local f11_local4 = DataSources.inGame.player.currentWeapon.scopeIndex
	local f11_local5 = DataSources.inGame.player.currentWeapon.name
	local f11_local6 = DataSources.inGame.player.currentWeapon.displayName
	local f11_local7 = DataSources.inGame.player.currentWeapon.isDefaultWeapon
	local f11_local8 = DataSources.inGame.player.currentWeapon.isNull
	self:SubscribeToModel( f11_local3:GetModel( f11_local1 ), f11_local2 )
	self:SubscribeToModel( f11_local4:GetModel( f11_local1 ), f11_local2 )
	self:SubscribeToModel( f11_local5:GetModel( f11_local1 ), f11_local2 )
	self:SubscribeToModel( f11_local6:GetModel( f11_local1 ), f11_local2 )
	self:SubscribeToModel( f11_local7:GetModel( f11_local1 ), f11_local2 )
	self:SubscribeToModel( f11_local8:GetModel( f11_local1 ), f11_local2 )
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.primaryReticleVisible:GetModel( f11_local1 ), function ()
		f0_local12( self, f11_local1 )
	end )
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.altReticleVisible:GetModel( f11_local1 ), function ()
		f0_local12( self, f11_local1 )
	end )
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.weaponInfoLUIWidgetsVisible:GetModel( f11_local1 ), function ()
		f0_local12( self, f11_local1 )
	end )
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.hipfireCrosshairVisible:GetModel( f11_local1 ), function ()
		f0_local12( self, f11_local1 )
	end )
	local f11_local9 = LUI.DataSourceInControllerModel.new( "cg.player.currentWeapon.inWorldAttachmentsAlpha" )
	self:BindAlphaToModel( f11_local9:GetModel( f11_local1 ) )
	self:SubscribeToModel( DataSources.inGame.player.affectedByEMP:GetModel( f11_local1 ), function ( f17_arg0 )
		if DataModel.GetModelValue( f17_arg0 ) then
			self:SetGlitchEnabled( true )
			self:SetGlitchBlockWidth( 4 )
			self:SetGlitchBlockHeight( 4 )
			self:SetGlitchDistortionRange( 4 )
			self:SetGlitchScanlinePitch( 1 )
			self:SetGlitchMaskPitch( 1 )
			self:SetGlitchAmount( 1 )
		else
			self:SetGlitchEnabled( false )
		end
	end )
	return self
end

MenuBuilder.registerType( "ScopeReticleManager", ScopeReticleManager )
LockTable( _M )

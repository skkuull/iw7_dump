local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0:GetDataSource()
	f1_local0 = f1_local0.weapon
	local f1_local1 = Engine.IsAliensMode() and f1_local0.weaponLootID:GetValue( f1_arg1 ) or f1_local0.lootItemID
	if f1_local1 ~= Cac.LootIDNoneValue then
		if Loot.IsNew( f1_arg1, f1_local1 ) then
			f1_arg0.NewItemNotification:SetAlpha( 1, 0 )
		else
			f1_arg0.NewItemNotification:SetAlpha( 0, 0 )
		end
	else
		f1_arg0.NewItemNotification:SetAlpha( 0, 0 )
	end
end

function PostLoadFunc( f2_arg0, f2_arg1 )
	if CONDITIONS.UseCACBreadCrumbs() then
		assert( f2_arg0.NewItemNotification )
		f2_arg0:SubscribeToModelThroughElement( f2_arg0, "weapon.ref", function ()
			f0_local0( f2_arg0, f2_arg1 )
		end )
		f2_arg0:addEventHandler( "update_loot_item_new", function ( f4_arg0, f4_arg1 )
			local f4_local0
			if Engine.IsAliensMode() then
				f4_local0 = f4_arg0:GetDataSource()
				f4_local0 = f4_local0.weapon.weaponLootID:GetValue( f2_arg1 )
				if not f4_local0 then
				
				else
					if f4_arg1.lootItemID == f4_local0 then
						f0_local0( f4_arg0, f2_arg1 )
					end
				end
			end
			f4_local0 = f4_arg0:GetDataSource()
			f4_local0 = f4_local0.weapon.lootItemID
		end )
	end
	f2_arg0.QualityIcon:SubscribeToModelThroughElement( f2_arg0, "weapon.quality", function ()
		local f5_local0 = f2_arg0:GetDataSource()
		f5_local0 = f5_local0.weapon.ref:GetValue( f2_arg1 )
		local f5_local1 = f2_arg0:GetDataSource()
		f5_local1 = f5_local1.weapon.qualityImage:GetValue( f2_arg1 )
		if f5_local1 ~= nil and modelvalue ~= "icon_item_quality_0" then
			f2_arg0.QualityIcon.IconDuplicate:setImage( RegisterMaterial( f5_local1 .. "_mk2" ), 0 )
		end
		if Cac.IsWeaponRefMk2( f5_local0 ) then
			ACTIONS.AnimateSequenceByElement( f2_arg0, {
				elementName = "QualityIcon",
				sequenceName = "LegendaryPulse",
				elementPath = "QualityIcon"
			} )
		else
			f2_arg0.QualityIcon.IconDuplicate:SetAlpha( 0, 0 )
			ACTIONS.AnimateSequenceByElement( f2_arg0, {
				elementName = "QualityIcon",
				sequenceName = "StopPulse",
				elementPath = "QualityIcon"
			} )
		end
	end )
end

function WeaponPip( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 48 * _1080p, 0, 48 * _1080p )
	self.id = "WeaponPip"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local DefaultSelection = nil
	
	DefaultSelection = LUI.UIImage.new()
	DefaultSelection.id = "DefaultSelection"
	DefaultSelection:SetZRotation( 45, 0 )
	DefaultSelection:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 7, _1080p * -7, _1080p * 7, _1080p * -7 )
	self:addElement( DefaultSelection )
	self.DefaultSelection = DefaultSelection
	
	local Highlight = nil
	
	Highlight = LUI.UIImage.new()
	Highlight.id = "Highlight"
	Highlight:setImage( RegisterMaterial( "challenges_progress_hori" ), 0 )
	Highlight:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -1, _1080p * 1, _1080p * -14, _1080p * 4 )
	self:addElement( Highlight )
	self.Highlight = Highlight
	
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f6_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * -3 )
	QualityIcon:SubscribeToModelThroughElement( self, "weapon.qualityImage", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.weapon.qualityImage:GetValue( f6_local1 )
		if f7_local0 ~= nil then
			QualityIcon.IconShadow:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "weapon.qualityColor", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.weapon.qualityColor:GetValue( f6_local1 )
		if f8_local0 ~= nil then
			QualityIcon.Icon:SetRGBFromInt( f8_local0, 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "weapon.qualityImage", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.weapon.qualityImage:GetValue( f6_local1 )
		if f9_local0 ~= nil then
			QualityIcon.Icon:setImage( RegisterMaterial( f9_local0 ), 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "weapon.qualityColor", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.weapon.qualityColor:GetValue( f6_local1 )
		if f10_local0 ~= nil then
			QualityIcon.IconDuplicate:SetRGBFromInt( f10_local0, 0 )
		end
	end )
	self:addElement( QualityIcon )
	self.QualityIcon = QualityIcon
	
	local f6_local6 = nil
	if CONDITIONS.UseCACBreadCrumbs( self ) then
		f6_local6 = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
			controllerIndex = f6_local1
		} )
		f6_local6.id = "NewItemNotification"
		f6_local6:SetAlpha( 0, 0 )
		f6_local6:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -33, _1080p * 33, _1080p * -2, _1080p * 64 )
		self:addElement( f6_local6 )
		self.NewItemNotification = f6_local6
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Highlight:RegisterAnimationSequence( "HighlightOn", {
			{
				function ()
					return self.Highlight:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.HighlightOn = function ()
			Highlight:AnimateSequence( "HighlightOn" )
		end
		
		Highlight:RegisterAnimationSequence( "HightlightOff", {
			{
				function ()
					return self.Highlight:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HightlightOff = function ()
			Highlight:AnimateSequence( "HightlightOff" )
		end
		
		QualityIcon:RegisterAnimationSequence( "PipRefresh", {
			{
				function ()
					return self.QualityIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.QualityIcon:SetAlpha( 0, 30 )
				end,
				function ()
					return self.QualityIcon:SetAlpha( 1, 30 )
				end,
				function ()
					return self.QualityIcon:SetAlpha( 0, 30 )
				end,
				function ()
					return self.QualityIcon:SetAlpha( 1, 30 )
				end,
				function ()
					return self.QualityIcon:SetAlpha( 0, 30 )
				end,
				function ()
					return self.QualityIcon:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.PipRefresh = function ()
			QualityIcon:AnimateSequence( "PipRefresh" )
		end
		
		DefaultSelection:RegisterAnimationSequence( "DefaultOn", {
			{
				function ()
					return self.DefaultSelection:SetAlpha( 0.8, 0 )
				end
			}
		} )
		self._sequences.DefaultOn = function ()
			DefaultSelection:AnimateSequence( "DefaultOn" )
		end
		
		DefaultSelection:RegisterAnimationSequence( "DefaultOff", {
			{
				function ()
					return self.DefaultSelection:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultOff = function ()
			DefaultSelection:AnimateSequence( "DefaultOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "scrollbar_pip_highlighted", function ( f29_arg0, f29_arg1 )
		local f29_local0 = f29_arg1.controller or f6_local1
		ACTIONS.AnimateSequence( self, "HighlightOn" )
	end )
	self:addEventHandler( "scrollbar_pip_not_highlighted", function ( f30_arg0, f30_arg1 )
		local f30_local0 = f30_arg1.controller or f6_local1
		ACTIONS.AnimateSequence( self, "HightlightOff" )
	end )
	self:addEventHandler( "scrollbar_pip_is_default", function ( f31_arg0, f31_arg1 )
		local f31_local0 = f31_arg1.controller or f6_local1
		ACTIONS.AnimateSequence( self, "DefaultOn" )
	end )
	self:addEventHandler( "scrollbar_pip_is_not_default", function ( f32_arg0, f32_arg1 )
		local f32_local0 = f32_arg1.controller or f6_local1
		ACTIONS.AnimateSequence( self, "DefaultOff" )
	end )
	PostLoadFunc( self, f6_local1, controller )
	ACTIONS.AnimateSequence( self, "PipRefresh" )
	return self
end

MenuBuilder.registerType( "WeaponPip", WeaponPip )
LockTable( _M )

local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = function ()
		local f2_local0 = f1_arg1:GetDataSource()
		local f2_local1 = f2_local0.weaponRef:GetValue( f1_arg0 )
		local f2_local2 = {
			f2_local0.attachmentOneRef,
			f2_local0.attachmentTwoRef,
			f2_local0.attachmentThreeRef
		}
		if Engine.IsMultiplayer() then
			table.insert( f2_local2, f2_local0.attachmentFourRef )
			table.insert( f2_local2, f2_local0.attachmentFiveRef )
			if f2_local0.attachmentSixRef then
				table.insert( f2_local2, f2_local0.attachmentSixRef )
			end
		end
		local f2_local3 = 0
		local f2_local4 = 0
		if f2_local1 and f2_local1 ~= "none" then
			local f2_local5 = Cac.GetWeaponClass( f2_local1 )
			if Engine.IsAliensMode() and f2_local5 == "weapon_classic_s" then
				f2_local5 = "weapon_classic_p"
			end
			local f2_local6 = Cac.GetWeaponRowList()
			if f2_local6[f2_local5][f2_local1] then
				f2_local3 = f2_local3 + f2_local6[f2_local5][f2_local1].stats[f1_arg3]
			end
		end
		if f2_local0.weaponLootID ~= nil then
			local f2_local5 = f2_local0.weaponLootID:GetValue( f1_arg0 )
			if f2_local5 > 0 then
				local f2_local6 = LOOT.GetLootItemStats( f2_local5, f2_local1 )
				if f2_local6 ~= nil and f2_local6[f1_arg3] ~= 0 then
					f2_local4 = f2_local4 + f2_local6[f1_arg3]
				end
			end
		end
		local f2_local5 = {
			accuracy = Cac.GetAttachmentStatAccuracy,
			damage = Cac.GetAttachmentStatDamage,
			range = Cac.GetAttachmentStatRange,
			fireRate = Cac.GetAttachmentStatFireRate,
			mobility = Cac.GetAttachmentStatMobility
		}
		for f2_local6 = 1, #f2_local2, 1 do
			if f2_local2[f2_local6] then
				local f2_local9 = f2_local5[f1_arg3]
				assert( f2_local9 )
				local f2_local10 = f2_local9( Cac.GetAttachmentRef( f2_local2[f2_local6]:GetValue( f1_arg0 ), f2_local1 ) )
				if f2_local10 then
					f2_local4 = f2_local4 + f2_local10
					local f2_local11 = Cac.GetAttachmentBaseRef( f2_local2[f2_local6]:GetValue( f1_arg0 ) )
					for f2_local12 = f2_local6 + 1, #f2_local2, 1 do
						if f2_local11 == Cac.GetAttachmentBaseRef( f2_local2[f2_local12]:GetValue( f1_arg0 ) ) then
							f2_local4 = f2_local4 - f2_local10
						end
					end
				end
			end
		end
		f2_local3 = NormalizeNumber( f2_local3, 0, Cac.MaxStatValue )
		if f2_local3 == f1_arg2.lastBaseValue and f2_local4 == f1_arg2.lastAttachmentsValue then
			return 
		end
		f1_arg2.lastBaseValue = f2_local3
		f1_arg2.lastAttachmentsValue = f2_local4
		local f2_local6 = f2_local3 / Cac.MaxStatValue
		local f2_local7 = f2_local4 / Cac.MaxStatValue
		local f2_local8 = SWATCHES.CAC.weaponMeterMain
		if f2_local7 > 0 then
			f2_local8 = SWATCHES.CAC.weaponMeterBetter
		elseif f2_local7 < 0 then
			f2_local8 = SWATCHES.CAC.weaponMeterWorse
		end
		local f2_local15 = -1
		local f2_local9 = 1
		f2_local6 = NormalizeNumber( f2_local6, f2_local15, f2_local9 )
		f2_local7 = NormalizeNumber( f2_local6 + f2_local7, f2_local15, f2_local9 ) - f2_local6
		local f2_local11 = NormalizeNumber( (f2_local3 + f2_local4) / Cac.MaxStatValue, f2_local15, f2_local9 )
		f1_arg2.ProgressBar.BaseFill:SetRightAnchor( 1 - f2_local6, 250 )
		f1_arg2.ProgressBar.ArrowStub:SetRightAnchor( 1 - f2_local11, 250 )
		f1_arg2.ProgressBar.ArrowStub:SetLeftAnchor( f2_local11, 250 )
		f1_arg2.ProgressBar.AttachmentsFill:SetRightAnchor( 1 - f2_local6 - f2_local7, 250 )
		f1_arg2.ProgressBar.AttachmentsFill:SetLeftAnchor( f2_local6, 250 )
		f1_arg2.ProgressBar.AttachmentsFill:SetRGBFromTable( f2_local8, 0 )
		f1_arg2.BaseValue:setText( f2_local3 )
		local f2_local12 = f1_arg2.AttachmentValue
		local f2_local13 = f2_local12
		f2_local12 = f2_local12.setText
		if f2_local4 ~= 0 then
			local f2_local16 = f2_local4
		end
		f2_local12( f2_local13, f2_local16 or "" )
		f1_arg2.AttachmentValue:SetRGBFromTable( f2_local8, 0 )
	end
	
	f1_arg2:SubscribeToModelThroughElement( f1_arg1, "weaponRef", f1_local0 )
	if Engine.IsMultiplayer() then
		f1_arg2:SubscribeToModelThroughElement( f1_arg1, "weaponLootID", f1_local0 )
	end
	f1_arg2:SubscribeToModelThroughElement( f1_arg1, "attachmentOneRef", f1_local0 )
	f1_arg2:SubscribeToModelThroughElement( f1_arg1, "attachmentTwoRef", f1_local0 )
	f1_arg2:SubscribeToModelThroughElement( f1_arg1, "attachmentThreeRef", f1_local0 )
	if Engine.IsMultiplayer() then
		f1_arg2:SubscribeToModelThroughElement( f1_arg1, "attachmentFourRef", f1_local0 )
		f1_arg2:SubscribeToModelThroughElement( f1_arg1, "attachmentFiveRef", f1_local0 )
		local f1_local1 = f1_arg1:GetDataSource()
		if f1_local1.attachmentSixRef then
			f1_arg2:SubscribeToModelThroughElement( f1_arg1, "attachmentSixRef", f1_local0 )
		end
	end
end

function NormalizeNumber( f3_arg0, f3_arg1, f3_arg2 )
	if f3_arg0 < f3_arg1 then
		return f3_arg1
	elseif f3_arg2 < f3_arg0 then
		return f3_arg2
	else
		return f3_arg0
	end
end

f0_local1 = function ( f4_arg0, f4_arg1 )
	f4_arg0:SubscribeToDataSourceThroughElement( f4_arg0, nil, function ()
		if not f4_arg0.setupStatsBars then
			f0_local0( f4_arg1, f4_arg0, f4_arg0.accuracyBar, "accuracy" )
			f0_local0( f4_arg1, f4_arg0, f4_arg0.damageBar, "damage" )
			f0_local0( f4_arg1, f4_arg0, f4_arg0.rangeBar, "range" )
			f0_local0( f4_arg1, f4_arg0, f4_arg0.fireRateBar, "fireRate" )
			f0_local0( f4_arg1, f4_arg0, f4_arg0.mobilityBar, "mobility" )
			f4_arg0.setupStatsBars = true
		end
	end )
end

function WeaponStatsPanel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 86 * _1080p )
	self.id = "WeaponStatsPanel"
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local mobilityBar = nil
	
	mobilityBar = MenuBuilder.BuildRegisteredType( "WeaponStatsBar", {
		controllerIndex = f6_local1
	} )
	mobilityBar.id = "mobilityBar"
	mobilityBar.StatName:setText( ToUpperCase( Engine.Localize( "LUA_MENU_WEAPSTATS_MOBILITY" ) ), 0 )
	mobilityBar.BaseValue:setText( "999", 0 )
	mobilityBar.AttachmentValue:setText( "999", 0 )
	mobilityBar:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, 0, _1080p * 68, _1080p * 88 )
	self:addElement( mobilityBar )
	self.mobilityBar = mobilityBar
	
	local fireRateBar = nil
	
	fireRateBar = MenuBuilder.BuildRegisteredType( "WeaponStatsBar", {
		controllerIndex = f6_local1
	} )
	fireRateBar.id = "fireRateBar"
	fireRateBar.StatName:setText( ToUpperCase( Engine.Localize( "LUA_MENU_WEAPSTATS_ROF" ) ), 0 )
	fireRateBar.BaseValue:setText( "999", 0 )
	fireRateBar.AttachmentValue:setText( "999", 0 )
	fireRateBar:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, 0, _1080p * 51, _1080p * 71 )
	self:addElement( fireRateBar )
	self.fireRateBar = fireRateBar
	
	local rangeBar = nil
	
	rangeBar = MenuBuilder.BuildRegisteredType( "WeaponStatsBar", {
		controllerIndex = f6_local1
	} )
	rangeBar.id = "rangeBar"
	rangeBar.StatName:setText( ToUpperCase( Engine.Localize( "LUA_MENU_WEAPSTATS_RANGE" ) ), 0 )
	rangeBar.BaseValue:setText( "999", 0 )
	rangeBar.AttachmentValue:setText( "999", 0 )
	rangeBar:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, 0, _1080p * 34, _1080p * 54 )
	self:addElement( rangeBar )
	self.rangeBar = rangeBar
	
	local damageBar = nil
	
	damageBar = MenuBuilder.BuildRegisteredType( "WeaponStatsBar", {
		controllerIndex = f6_local1
	} )
	damageBar.id = "damageBar"
	damageBar.StatName:setText( ToUpperCase( Engine.Localize( "LUA_MENU_WEAPSTATS_DAMAGE" ) ), 0 )
	damageBar.BaseValue:setText( "999", 0 )
	damageBar.AttachmentValue:setText( "999", 0 )
	damageBar:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, 0, _1080p * 17, _1080p * 37 )
	self:addElement( damageBar )
	self.damageBar = damageBar
	
	local accuracyBar = nil
	
	accuracyBar = MenuBuilder.BuildRegisteredType( "WeaponStatsBar", {
		controllerIndex = f6_local1
	} )
	accuracyBar.id = "accuracyBar"
	accuracyBar.StatName:setText( ToUpperCase( Engine.Localize( "LUA_MENU_WEAPSTATS_ACCURACY" ) ), 0 )
	accuracyBar.BaseValue:setText( "999", 0 )
	accuracyBar.AttachmentValue:setText( "999", 0 )
	accuracyBar:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, 0, 0, _1080p * 20 )
	self:addElement( accuracyBar )
	self.accuracyBar = accuracyBar
	
	local VerticalBar = nil
	
	VerticalBar = LUI.UIImage.new()
	VerticalBar.id = "VerticalBar"
	VerticalBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, 0, 0, _1080p * 86 )
	self:addElement( VerticalBar )
	self.VerticalBar = VerticalBar
	
	f0_local1( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "WeaponStatsPanel", WeaponStatsPanel )
LockTable( _M )

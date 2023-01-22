local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = false
	local f1_local1 = f1_arg0:GetDataSource()
	assert( f1_local1 )
	assert( f1_local1.cards )
	assert( type( f1_local1.cards ) == "table" )
	for f1_local2 = 1, #f1_local1.cards, 1 do
		local f1_local5 = f1_local1.cards[f1_local2]
		if f1_arg2 then
			local f1_local6 = f1_local5.challenge:GetValue( f1_arg1 )
			if f1_local6 and f1_local6 ~= "" then
				local f1_local7 = Engine.TableLookupGetRowNum( CSV.callingCardUnlockTable.file, CSV.callingCardUnlockTable.cols.ref, f1_local6 )
				if f1_local7 ~= -1 and Rewards.IsNew( f1_arg1, "callingCard", f1_local7 ) then
					f1_local0 = true
					break
				end
			end
		end
		if f1_arg3 then
			local f1_local6 = Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.index, f1_local5.index:GetValue( f1_arg1 ), CSV.callingCards.cols.lootID )
			if f1_local6 and f1_local6 ~= "" and Loot.IsNew( f1_arg1, f1_local6 ) then
				f1_local0 = true
				break
			end
		end
	end
	if f1_local0 then
		f1_arg0.NewItemNotification:SetAlpha( 1, 0 )
	else
		f1_arg0.NewItemNotification:SetAlpha( 0, 0 )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0:addEventHandler( "focus_tab", function ( f3_arg0, f3_arg1 )
		f2_arg0.SubMenuTab.index = f2_arg0.index
	end )
	f2_arg0:SubscribeToDataSourceThroughElement( f2_arg0, nil, function ()
		f0_local0( f2_arg0, f2_arg1, true, true )
	end )
	f2_arg0:addEventHandler( "update_loot_item_new", function ( f5_arg0, f5_arg1 )
		f0_local0( f2_arg0, f2_arg1, false, true )
	end )
	f2_arg0:addEventHandler( "update_progression_item_new", function ( f6_arg0, f6_arg1 )
		f0_local0( f2_arg0, f2_arg1, true, false )
	end )
end

function CallingCardTab( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 180 * _1080p, 0, 30 * _1080p )
	self.id = "CallingCardTab"
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local SubMenuTab = nil
	
	SubMenuTab = MenuBuilder.BuildRegisteredType( "SubMenuTab", {
		controllerIndex = f7_local1
	} )
	SubMenuTab.id = "SubMenuTab"
	SubMenuTab:SetDataSourceThroughElement( self, nil )
	SubMenuTab:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( SubMenuTab )
	self.SubMenuTab = SubMenuTab
	
	local NewItemNotification = nil
	
	NewItemNotification = LUI.UIImage.new()
	NewItemNotification.id = "NewItemNotification"
	NewItemNotification:SetAlpha( 0, 0 )
	NewItemNotification:setImage( RegisterMaterial( "icon_new_item_condensed" ), 0 )
	NewItemNotification:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -37, _1080p * 21, _1080p * -31, _1080p * 27 )
	self:addElement( NewItemNotification )
	self.NewItemNotification = NewItemNotification
	
	SubMenuTab:SetDataSourceThroughElement( self, nil )
	f0_local1( self, f7_local1, controller )
	return self
end

MenuBuilder.registerType( "CallingCardTab", CallingCardTab )
LockTable( _M )

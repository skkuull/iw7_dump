local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = ZombiesUtils.CombatRecordMenuModelPath .. ".cards"
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.FateCardStats )
	assert( f1_arg0.FortuneCardStats )
	local f1_local0 = function ( f2_arg0, f2_arg1, f2_arg2 )
		return {
			cardSlot = f2_arg0,
			content = f2_arg1:Decorate( ZMB_CONSUMABLES.DecorateCardFunc( f0_local0 ) )
		}
	end
	
	local f1_local1, f1_local2 = nil
	local f1_local3 = -1
	local f1_local4 = -1
	local f1_local5 = DataSources.frontEnd.CP.fortuneCards:Decorate( f1_local0 )
	for f1_local6 = 0, f1_local5:GetCountValue( f1_arg1 ) - 1, 1 do
		local f1_local9 = f1_local5:GetDataSourceAtIndex( f1_local6 )
		f1_local9 = f1_local9.content
		for f1_local10 = 0, f1_local9:GetCountValue( f1_arg1 ) - 1, 1 do
			local f1_local13 = f1_local9:GetDataSourceAtIndex( f1_local10, f1_arg1 )
			local f1_local14 = f1_local13.timesUsed:GetValue( f1_arg1 )
			if f1_local6 == 0 then
				if f1_local3 < f1_local14 then
					f1_local1 = f1_local13
					f1_local3 = f1_local14
				end
			end
			if f1_local4 < f1_local14 then
				f1_local2 = f1_local13
				f1_local4 = f1_local14
			end
		end
	end
	f1_arg0.FateCardStats:SetDataSource( f1_local1, f1_arg1 )
	f1_arg0.FortuneCardStats:SetDataSource( f1_local2, f1_arg1 )
end

function CPCombatRecordCardsHighlight( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1200 * _1080p, 0, 825 * _1080p )
	self.id = "CPCombatRecordCardsHighlight"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local FateCardStats = nil
	
	FateCardStats = MenuBuilder.BuildRegisteredType( "CPCombatRecordCardStats", {
		controllerIndex = f3_local1
	} )
	FateCardStats.id = "FateCardStats"
	FateCardStats.Title:setText( Engine.Localize( "LUA_MENU_ZM_MOST_USED_FATE_CARD_CAPS" ), 0 )
	FateCardStats:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45, _1080p * 545, _1080p * 15, _1080p * 326.5 )
	self:addElement( FateCardStats )
	self.FateCardStats = FateCardStats
	
	local FortuneCardStats = nil
	
	FortuneCardStats = MenuBuilder.BuildRegisteredType( "CPCombatRecordCardStats", {
		controllerIndex = f3_local1
	} )
	FortuneCardStats.id = "FortuneCardStats"
	FortuneCardStats.Title:setText( Engine.Localize( "LUA_MENU_ZM_MOST_USED_FORTUNE_CARD_CAPS" ), 0 )
	FortuneCardStats:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 633, _1080p * 1133, _1080p * 69, _1080p * 380.5 )
	self:addElement( FortuneCardStats )
	self.FortuneCardStats = FortuneCardStats
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "CPCombatRecordCardsHighlight", CPCombatRecordCardsHighlight )
LockTable( _M )

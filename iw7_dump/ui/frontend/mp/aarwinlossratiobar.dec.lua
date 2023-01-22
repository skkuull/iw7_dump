local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	assert( f1_arg0.Wins )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, nil, function ()
		local f2_local0 = f1_arg0:GetDataSource()
		assert( f2_local0 )
		local f2_local1 = f2_local0:GetValue( f1_arg1 )
		if f2_local1 then
			f1_arg0.Wins:SetAnchors( 0, 1 - LUI.clamp( f2_local1, 0, 1 ), 0, 0, 250 )
		end
	end )
end

function AARWinLossRatioBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 10 * _1080p )
	self.id = "AARWinLossRatioBar"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Losses = nil
	
	Losses = LUI.UIImage.new()
	Losses.id = "Losses"
	Losses:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
	self:addElement( Losses )
	self.Losses = Losses
	
	local Wins = nil
	
	Wins = LUI.UIImage.new()
	Wins.id = "Wins"
	Wins:SetRGBFromTable( SWATCHES.CAC.weaponMeterMain, 0 )
	Wins:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, 0, 0 )
	self:addElement( Wins )
	self.Wins = Wins
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "AARWinLossRatioBar", AARWinLossRatioBar )
LockTable( _M )

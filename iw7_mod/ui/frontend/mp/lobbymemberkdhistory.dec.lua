local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ComputeKDHistoryData( f1_arg0, f1_arg1 )
	assert( #f1_arg0 == #f1_arg1 )
	local f1_local0 = 0
	local f1_local1 = 0
	local f1_local2 = {}
	for f1_local3 = 1, #f1_arg0, 1 do
		local f1_local6 = f1_arg0[f1_local3]
		local f1_local7 = f1_arg1[f1_local3]
		if f1_local7 == 0 then
			f1_local7 = 1
		end
		local f1_local8 = f1_local6 / f1_local7
		f1_local0 = math.max( f1_local0, f1_local8 )
		f1_local1 = f1_local1 + f1_local8
		table.insert( f1_local2, {
			value = f1_local8,
			valid = true,
			barColor = GetIntForColor( SWATCHES.AAR.InfoNormal ),
			valueText = string.format( "%.2f", f1_local8 )
		} )
	end
	for f1_local3 = 1, #f1_local2, 1 do
		f1_local2[f1_local3].maxValue = f1_local0
	end
	return f1_local2, {
		maxValue = f1_local0,
		average = f1_local1 / #f1_local2
	}
end

function PostLoadFunc( f2_arg0, f2_arg1 )
	f2_arg0.SetData = function ( f3_arg0, f3_arg1 )
		assert( f3_arg1.killsHistory )
		assert( f3_arg1.deathsHistory )
		local f3_local0, f3_local1 = ComputeKDHistoryData( f3_arg1.killsHistory, f3_arg1.deathsHistory )
		f3_arg0.Bars:SetGraphData( f3_local0, f3_local1, true )
	end
	
end

function LobbyMemberKDHistory( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 418 * _1080p, 0, 240 * _1080p )
	self.id = "LobbyMemberKDHistory"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.6, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Bars = nil
	
	Bars = MenuBuilder.BuildRegisteredType( "AARBars", {
		controllerIndex = f4_local1
	} )
	Bars.id = "Bars"
	Bars:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -173, _1080p * 190, _1080p * 59, _1080p * 210 )
	self:addElement( Bars )
	self.Bars = Bars
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:setText( Engine.Localize( "MP_FRONTEND_ONLY_RECENT_KD" ), 0 )
	Title:SetFontSize( 30 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, 0, _1080p * 30 )
	self:addElement( Title )
	self.Title = Title
	
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "LobbyMemberKDHistory", LobbyMemberKDHistory )
LockTable( _M )

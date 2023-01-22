local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( type( f1_arg1 ) == "number" )
	assert( type( f1_arg2 ) == "number" )
	f1_arg0.Fill:SetAnchors( 0, 1 - LUI.clamp( f1_arg1, 0, 1 ), 0, 0, f1_arg2 )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg0.SetProgress = f0_local0
	f2_arg0:SubscribeToModelThroughElement( f2_arg0, nil, function ()
		local f3_local0 = f2_arg0:GetDataSource()
		assert( f3_local0 )
		local f3_local1 = f3_local0:GetValue( f2_arg1 )
		if f3_local1 then
			f2_arg0:SetProgress( f3_local1, 250 )
		end
	end )
end

function GenericProgressBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 10 * _1080p )
	self.id = "GenericProgressBar"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetRGBFromTable( SWATCHES.CAC.weaponMeterMain, 0 )
	Fill:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, 0, 0 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local Frame = nil
	
	Frame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Frame.id = "Frame"
	self:addElement( Frame )
	self.Frame = Frame
	
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "GenericProgressBar", GenericProgressBar )
LockTable( _M )

LUI.UIRadialProgressBar = LUI.Class( LUI.UIElement )
LUI.UIRadialProgressBar.init = function ( f1_arg0, f1_arg1 )
	LUI.UIRadialProgressBar.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "UIRadialProgressBar"
	assert( type( f1_arg1 ) == "table" )
	assert( type( f1_arg1 ) == "table" )
	local f1_local0 = assert
	local f1_local1
	if f1_arg1.snapToMultiplesOfAngle ~= nil and type( f1_arg1.snapToMultiplesOfAngle ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	assert( f1_arg1.segmentCount > 1 )
	assert( f1_arg1.segmentMaterial )
	f1_local0 = assert
	f1_local1 = f1_arg1.maskMaterial
	if not f1_local1 then
		f1_local1 = f1_arg1.segmentCount < 3
	end
	f1_local0( f1_local1 )
	f1_arg0.segmentCount = f1_arg1.segmentCount
	f1_arg0.percentUpdateFunc = f1_arg1.percentUpdateFunc
	f1_arg0.snapToMultiplesOfAngle = f1_arg1.snapToMultiplesOfAngle or 0
	f1_arg0.useCodeImplementation = f1_arg0.segmentCount < 3
	if f1_arg0.useCodeImplementation then
		f1_arg0:SetupRadialProgressBar( f1_arg1.counterClockwise == true )
		f1_arg0:setImage( RegisterMaterial( f1_arg1.segmentMaterial ) )
	else
		f1_arg0.rotDirection = f1_arg1.counterClockwise and 1 or -1
		f1_arg0.segmentData = {}
		f1_arg0:CreateSegments( f1_arg1.segmentMaterial, f1_arg1.maskMaterial, f1_arg1.counterClockwise )
		f1_arg0:SetProgress( 0 )
	end
end

LUI.UIRadialProgressBar.SetProgress = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	local f2_local0 = nil
	if f2_arg0.snapToMultiplesOfAngle > 0 then
		local f2_local1 = f2_arg0.snapToMultiplesOfAngle / 360
		f2_arg1 = math.floor( 0.5 + f2_arg1 / f2_local1 ) * f2_local1
	end
	if f2_arg0.useCodeImplementation then
		f2_local0 = f2_arg0:SetProgressInC( f2_arg1, f2_arg2 or 0, f2_arg3 or 0 )
	else
		f2_arg0.fillPercent = f2_arg1
		f2_arg0:RefreshSegments( f2_arg1 )
	end
	if f2_arg0.percentUpdateFunc then
		f2_arg0.percentUpdateFunc( f2_arg1 )
	end
	return f2_local0
end

LUI.UIRadialProgressBar.SetOnUpdateCallback = function ( f3_arg0, f3_arg1 )
	f3_arg0.percentUpdateFunc = f3_arg1
end

LUI.UIRadialProgressBar.SetSegmentImage = function ( f4_arg0, f4_arg1 )
	if f4_arg0.useCodeImplementation then
		f4_arg0:setImage( f4_arg1 )
	else
		for f4_local0 = 1, f4_arg0.segmentCount, 1 do
			f4_arg0.segmentData[f4_local0].segment:setImage( f4_arg1 )
		end
	end
end

LUI.UIRadialProgressBar.CreateSegments = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
	local f5_local0 = f5_arg0.rotDirection * 360 / f5_arg0.segmentCount
	local f5_local1 = 1 / f5_arg0.segmentCount
	local f5_local2, f5_local3, f5_local4, f5_local5 = f5_arg0:getCurrentRGBA()
	for f5_local6 = 1, f5_arg0.segmentCount, 1 do
		local f5_local9 = (f5_local6 - 1) * f5_local0
		local f5_local10 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
		f5_local10.red = f5_local2
		f5_local10.green = f5_local3
		f5_local10.blue = f5_local4
		f5_local10.zRot = f5_local9
		f5_local10.material = RegisterMaterial( f5_arg1 )
		local self = LUI.UIImage.new( f5_local10 )
		self.id = "segment" .. f5_local6
		f5_arg0:addElement( self )
		f5_local10.material = RegisterMaterial( f5_arg2 )
		local f5_local12 = LUI.UIImage.new( f5_local10 )
		f5_local12.id = "segmentMask" .. f5_local6
		f5_arg0:addElement( f5_local12 )
		if f5_arg3 then
			self:SetUMin( 1, 0 )
			self:SetUMax( 0, 0 )
			f5_local12:SetUMin( 1, 0 )
			f5_local12:SetUMax( 0, 0 )
		end
		self:SetMask( f5_local12 )
		f5_local12.startRot = f5_local9
		f5_local12.endRot = math.max( f5_local9 + f5_local0 )
		f5_local12.startPercent = (f5_local6 - 1) * f5_local1
		f5_local12.endPercent = math.max( f5_local12.startPercent + f5_local1 )
		table.insert( f5_arg0.segmentData, {
			segment = self,
			mask = f5_local12
		} )
	end
end

LUI.UIRadialProgressBar.RefreshSegments = function ( f6_arg0, f6_arg1 )
	for f6_local0 = 1, f6_arg0.segmentCount, 1 do
		local f6_local3 = f6_arg0.segmentData[f6_local0].mask
		f6_local3:SetZRotation( f6_local3.startRot + LUI.clamp( (f6_arg1 - f6_local3.startPercent) / (f6_local3.endPercent - f6_local3.startPercent), 0, 1 ) * (f6_local3.endRot - f6_local3.startRot) )
	end
end

function BuildRadialProgressBar( f7_arg0, f7_arg1 )
	return LUI.UIRadialProgressBar.new( f7_arg1 )
end

MenuBuilder.registerType( "UIRadialProgressBar", BuildRadialProgressBar )

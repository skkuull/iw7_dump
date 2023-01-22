local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function InteractiveObjectBackground( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 50 * _1080p )
	self.id = "InteractiveObjectBackground"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if not Engine.IsMultiplayer() then
		f1_local3 = LUI.UIBlur.new()
		f1_local3.id = "Blur"
		f1_local3:SetRGBFromInt( 12566463, 0 )
		f1_local3:SetBlurStrength( 0.75, 0 )
		self:addElement( f1_local3 )
		self.Blur = f1_local3
	end
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 3,
		borderThicknessRight = _1080p * 3,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 0
	} )
	Border.id = "Border"
	Border:SetAlpha( 0.4, 0 )
	Border:SetBorderThicknessLeft( _1080p * 3, 0 )
	Border:SetBorderThicknessRight( _1080p * 3, 0 )
	Border:SetBorderThicknessTop( _1080p * 0, 0 )
	Border:SetBorderThicknessBottom( _1080p * 0, 0 )
	self:addElement( Border )
	self.Border = Border
	
	return self
end

MenuBuilder.registerType( "InteractiveObjectBackground", InteractiveObjectBackground )
LockTable( _M )

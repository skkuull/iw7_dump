local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CPMapsTalisman( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 42 * _1080p, 0, 202 * _1080p )
	self.id = "CPMapsTalisman"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local talisman1empty = nil
	
	talisman1empty = LUI.UIImage.new()
	talisman1empty.id = "talisman1empty"
	talisman1empty:SetScale( -0.84, 0 )
	talisman1empty:setImage( RegisterMaterial( "zm_directors_cut_talisman_empty" ), 0 )
	talisman1empty:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -107.52, _1080p * 148.48, _1080p * -107.52, _1080p * 148.48 )
	self:addElement( talisman1empty )
	self.talisman1empty = talisman1empty
	
	local talisman2empty = nil
	
	talisman2empty = LUI.UIImage.new()
	talisman2empty.id = "talisman2empty"
	talisman2empty:SetScale( -0.84, 0 )
	talisman2empty:setImage( RegisterMaterial( "zm_directors_cut_talisman_empty" ), 0 )
	talisman2empty:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -107.52, _1080p * 148.48, _1080p * -67.52, _1080p * 188.48 )
	self:addElement( talisman2empty )
	self.talisman2empty = talisman2empty
	
	local talisman3empty = nil
	
	talisman3empty = LUI.UIImage.new()
	talisman3empty.id = "talisman3empty"
	talisman3empty:SetScale( -0.84, 0 )
	talisman3empty:setImage( RegisterMaterial( "zm_directors_cut_talisman_empty" ), 0 )
	talisman3empty:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -107.52, _1080p * 148.48, _1080p * -27.52, _1080p * 228.48 )
	self:addElement( talisman3empty )
	self.talisman3empty = talisman3empty
	
	local talisman4empty = nil
	
	talisman4empty = LUI.UIImage.new()
	talisman4empty.id = "talisman4empty"
	talisman4empty:SetScale( -0.84, 0 )
	talisman4empty:setImage( RegisterMaterial( "zm_directors_cut_talisman_empty" ), 0 )
	talisman4empty:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -107.52, _1080p * 148.48, _1080p * 12.48, _1080p * 268.48 )
	self:addElement( talisman4empty )
	self.talisman4empty = talisman4empty
	
	local talisman5empty = nil
	
	talisman5empty = LUI.UIImage.new()
	talisman5empty.id = "talisman5empty"
	talisman5empty:SetScale( -0.84, 0 )
	talisman5empty:setImage( RegisterMaterial( "zm_directors_cut_talisman_empty" ), 0 )
	talisman5empty:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -107.52, _1080p * 148.48, _1080p * 52.48, _1080p * 308.48 )
	self:addElement( talisman5empty )
	self.talisman5empty = talisman5empty
	
	local f1_local8 = nil
	if CONDITIONS.HasMapTalisman( f1_local1, "item_1" ) then
		f1_local8 = LUI.UIImage.new()
		f1_local8.id = "talisman1full"
		f1_local8:SetScale( -0.84, 0 )
		f1_local8:setImage( RegisterMaterial( "zm_directors_cut_talisman" ), 0 )
		f1_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -107.52, _1080p * 148.48, _1080p * -107.52, _1080p * 148.48 )
		self:addElement( f1_local8 )
		self.talisman1full = f1_local8
	end
	local f1_local9 = nil
	if CONDITIONS.HasMapTalisman( f1_local1, "item_2" ) then
		f1_local9 = LUI.UIImage.new()
		f1_local9.id = "talisman2full"
		f1_local9:SetScale( -0.84, 0 )
		f1_local9:setImage( RegisterMaterial( "zm_directors_cut_talisman" ), 0 )
		f1_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -107.52, _1080p * 148.48, _1080p * -67.52, _1080p * 188.48 )
		self:addElement( f1_local9 )
		self.talisman2full = f1_local9
	end
	local f1_local10 = nil
	if CONDITIONS.HasMapTalisman( f1_local1, "item_3" ) then
		f1_local10 = LUI.UIImage.new()
		f1_local10.id = "talisman3full"
		f1_local10:SetScale( -0.84, 0 )
		f1_local10:setImage( RegisterMaterial( "zm_directors_cut_talisman" ), 0 )
		f1_local10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -107.52, _1080p * 148.48, _1080p * -27.52, _1080p * 228.48 )
		self:addElement( f1_local10 )
		self.talisman3full = f1_local10
	end
	local f1_local11 = nil
	if CONDITIONS.HasMapTalisman( f1_local1, "item_4" ) then
		f1_local11 = LUI.UIImage.new()
		f1_local11.id = "talisman4full"
		f1_local11:SetScale( -0.84, 0 )
		f1_local11:setImage( RegisterMaterial( "zm_directors_cut_talisman" ), 0 )
		f1_local11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -107.52, _1080p * 148.48, _1080p * 12.48, _1080p * 268.48 )
		self:addElement( f1_local11 )
		self.talisman4full = f1_local11
	end
	local f1_local12 = nil
	if CONDITIONS.HasMapTalisman( f1_local1, "item_5" ) then
		f1_local12 = LUI.UIImage.new()
		f1_local12.id = "talisman5full"
		f1_local12:SetScale( -0.84, 0 )
		f1_local12:setImage( RegisterMaterial( "zm_directors_cut_talisman" ), 0 )
		f1_local12:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -107.52, _1080p * 148.48, _1080p * 52.48, _1080p * 308.48 )
		self:addElement( f1_local12 )
		self.talisman5full = f1_local12
	end
	return self
end

MenuBuilder.registerType( "CPMapsTalisman", CPMapsTalisman )
LockTable( _M )

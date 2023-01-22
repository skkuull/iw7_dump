local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RigVariant( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 340 * _1080p, 0, 170 * _1080p )
	self.id = "RigVariant"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Top = nil
	
	Top = LUI.UIImage.new()
	Top.id = "Top"
	Top:SetRGBFromInt( 0, 0 )
	Top:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 32 )
	self:addElement( Top )
	self.Top = Top
	
	local Left = nil
	
	Left = LUI.UIImage.new()
	Left.id = "Left"
	Left:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 1, _1080p * 32, 0 )
	self:addElement( Left )
	self.Left = Left
	
	local Right = nil
	
	Right = LUI.UIImage.new()
	Right.id = "Right"
	Right:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -1, 0, _1080p * 32, 0 )
	self:addElement( Right )
	self.Right = Right
	
	local Bottom = nil
	
	Bottom = LUI.UIImage.new()
	Bottom.id = "Bottom"
	Bottom:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -1, 0 )
	self:addElement( Bottom )
	self.Bottom = Bottom
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.4, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * -1, _1080p * 32, _1080p * -1 )
	self:addElement( Background )
	self.Background = Background
	
	local Name = nil
	
	Name = LUI.UIText.new()
	Name.id = "Name"
	Name:SetRGBFromInt( 6718853, 0 )
	Name:SetFontSize( 30 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	Name:SetAlignment( LUI.Alignment.Left )
	Name:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16.5, 0, _1080p * 2, _1080p * 32 )
	Name:SubscribeToModelThroughElement( self, "name", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.name:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Name:setText( f2_local0, 0 )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -64, _1080p * 64, _1080p * 32, _1080p * -1 )
	Image:SubscribeToModelThroughElement( self, "image", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.image:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Image:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local RigSelected = nil
	
	RigSelected = MenuBuilder.BuildRegisteredType( "RigSelected", {
		controllerIndex = f1_local1
	} )
	RigSelected.id = "RigSelected"
	RigSelected:SetDataSourceThroughElement( self, nil )
	RigSelected:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16.5, _1080p * 51.5, _1080p * 121.32, _1080p * 157.32 )
	self:addElement( RigSelected )
	self.RigSelected = RigSelected
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Top:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Top:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Top:AnimateSequence( "ButtonOver" )
			Name:AnimateSequence( "ButtonOver" )
		end
		
		Top:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Top:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Name:SetRGBFromInt( 6718853, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Top:AnimateSequence( "ButtonUp" )
			Name:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	RigSelected:SetDataSourceThroughElement( self, nil )
	self.addButtonHelperFunction = function ( f12_arg0, f12_arg1 )
		if #f12_arg0:getAllFocusedChildren() > 0 or f12_arg0:isInFocus() then
			f12_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "MENU_BACK" ),
				button_ref = "button_secondary",
				side = "right",
				clickable = true
			} )
		end
		if #f12_arg0:getAllFocusedChildren() > 0 or f12_arg0:isInFocus() then
			f12_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
				button_ref = "button_primary",
				side = "right",
				priority = 20,
				clickable = true
			} )
		end
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:addEventHandler( "button_over", function ( f13_arg0, f13_arg1 )
		local f13_local0 = f13_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f14_arg0, f14_arg1 )
		local f14_local0 = f14_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self.bindButton:addEventHandler( "button_secondary", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg1.controller or f1_local1
		local f15_local1 = f15_arg0:getParent()
		if #f15_local1:getAllFocusedChildren() <= 0 then
			f15_local1 = f15_arg0:getParent()
			if f15_local1:isInFocus() then
			
			else
				return false
			end
		end
		ACTIONS.LeaveMenu( self )
		return true
	end )
	self:addEventHandler( "gain_focus", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg1.controller or f1_local1
		f16_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "right",
			clickable = true
		} )
		f16_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "right",
			priority = 20,
			clickable = true
		} )
	end )
	self:addEventHandler( "lose_focus", function ( f17_arg0, f17_arg1 )
		local f17_local0 = f17_arg1.controller or f1_local1
		f17_arg0:RemoveButtonHelperText( "button_secondary", "right" )
		f17_arg0:RemoveButtonHelperText( "button_primary", "right" )
		local f17_local1 = f17_arg0:getParent()
		while f17_local1 and not f17_local1.addButtonHelperFunction and f17_local1.id ~= f1_local2.id do
			f17_local1 = f17_local1:getParent()
		end
		if f17_local1 and f17_local1.addButtonHelperFunction then
			f17_local1.addButtonHelperFunction( f17_arg0, f17_arg1 )
		end
	end )
	return self
end

MenuBuilder.registerType( "RigVariant", RigVariant )
LockTable( _M )

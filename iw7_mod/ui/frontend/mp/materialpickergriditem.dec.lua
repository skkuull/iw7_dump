local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "id", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f1_arg0.Background:setImage( EmblemEditor.GetMaterialHandle( f2_local0.id:GetValue( f1_arg1 ) ) )
	end )
	f1_arg0:addEventHandler( "gain_focus", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f1_arg0:GetDataSource()
		if f3_local0 then
			local f3_local1 = f3_local0.id:GetValue( f1_arg1 )
			if f3_local1 then
				f1_arg0:dispatchEventToCurrentMenu( {
					name = "focused_on_layer_material",
					controller = f3_arg1.controller,
					materialID = f3_local1
				} )
			end
		end
	end )
	f1_arg0:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		f1_arg0:dispatchEventToCurrentMenu( {
			name = "material_picker_material_selected",
			controller = f4_arg1.controller
		} )
	end )
end

function MaterialPickerGridItem( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "MaterialPickerGridItem"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	self:addElement( Background )
	self.Background = Background
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	Border.id = "Border"
	Border:SetAlpha( 0, 0 )
	Border:SetBorderThicknessLeft( _1080p * 2, 0 )
	Border:SetBorderThicknessRight( _1080p * 2, 0 )
	Border:SetBorderThicknessTop( _1080p * 2, 0 )
	Border:SetBorderThicknessBottom( _1080p * 2, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f5_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	self._animationSets.DefaultAnimationSet = function ()
		Border:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Border:SetAlpha( 0, 80 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Border:AnimateSequence( "DefaultSequence" )
		end
		
		Border:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Border:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.Border:SetRGBFromInt( 16763904, 100 )
				end
			},
			{
				function ()
					return self.Border:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Border:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Border:AnimateSequence( "ButtonOver" )
		end
		
		Border:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Border:SetRGBFromInt( 16763904, 0 )
				end,
				function ()
					return self.Border:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.Border:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Border:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Border:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f19_arg0, f19_arg1 )
		local f19_local0 = f19_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	PostLoadFunc( self, f5_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "MaterialPickerGridItem", MaterialPickerGridItem )
LockTable( _M )

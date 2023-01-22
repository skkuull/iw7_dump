local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "color", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		local f2_local1
		if f2_local0 ~= nil then
			f2_local1 = f2_local0.color:GetValue( f1_arg1 )
			if not f2_local1 then
			
			else
				if f2_local1 ~= nil then
					f1_arg0.Background:SetRGBFromInt( f2_local1 )
				end
			end
		end
		f2_local1 = nil
	end )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "valid", function ()
		local f3_local0 = f1_arg0:GetDataSource()
		local f3_local1
		if f3_local0 ~= nil then
			f3_local1 = f3_local0.valid:GetValue( f1_arg1 )
			if not f3_local1 then
			
			else
				if f3_local1 then
					f1_arg0.Background:SetAlpha( 1 )
					f1_arg0.SlotOutline:SetAlpha( 0 )
				else
					f1_arg0.Background:SetAlpha( 0 )
					f1_arg0.SlotOutline:SetAlpha( 0.4 )
				end
			end
		end
		f3_local1 = false
	end )
	f1_arg0:addEventHandler( "gain_focus", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f1_arg0:GetDataSource()
		if f4_local0 and f4_local0.valid:GetValue( f1_arg1 ) then
			local f4_local1 = f4_local0.color:GetValue( f1_arg1 )
			if f4_local1 then
				f1_arg0:dispatchEventToCurrentMenu( {
					name = "focused_on_layer_color",
					controller = f4_arg1.controller,
					color = f4_local1
				} )
			end
		end
	end )
	f1_arg0:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f1_arg0:GetDataSource()
		if f5_local0 and f5_local0.valid:GetValue( f1_arg1 ) then
			f1_arg0:dispatchEventToCurrentMenu( {
				name = "color_picker_color_selected",
				controller = f5_arg1.controller
			} )
		end
	end )
end

function FavoriteColorGridItem( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 72 * _1080p, 0, 18 * _1080p )
	self.id = "FavoriteColorGridItem"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	self:addElement( Background )
	self.Background = Background
	
	local SlotOutline = nil
	
	SlotOutline = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	SlotOutline.id = "SlotOutline"
	SlotOutline:SetAlpha( 0, 0 )
	SlotOutline:SetBorderThicknessLeft( _1080p * 2, 0 )
	SlotOutline:SetBorderThicknessRight( _1080p * 2, 0 )
	SlotOutline:SetBorderThicknessTop( _1080p * 2, 0 )
	SlotOutline:SetBorderThicknessBottom( _1080p * 2, 0 )
	self:addElement( SlotOutline )
	self.SlotOutline = SlotOutline
	
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
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Border:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Border:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.Border:SetRGBFromTable( SWATCHES.genericButton.highlight, 100 )
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
					return self.Border:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
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
		local f19_local0 = f19_arg1.controller or f6_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg1.controller or f6_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	PostLoadFunc( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "FavoriteColorGridItem", FavoriteColorGridItem )
LockTable( _M )

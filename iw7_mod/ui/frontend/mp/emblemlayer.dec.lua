local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "iconId", function ()
		RefreshLayerContent( f1_arg0, f1_arg1 )
	end )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "groupIndex", function ()
		local f3_local0 = f1_arg0:GetDataSource()
		f3_local0 = f3_local0.groupIndex:GetValue( f1_arg1 )
		local f3_local1
		if f3_local0 == nil or f3_local0 <= 0 then
			f3_local1 = false
		else
			f3_local1 = true
		end
		local f3_local2 = f1_arg0.GroupedIcon
		local f3_local3 = f3_local2
		f3_local2 = f3_local2.SetAlpha
		local f3_local4
		if f3_local1 then
			f3_local4 = 1
			if not f3_local4 then
			
			else
				f3_local2( f3_local3, f3_local4 )
			end
		end
		f3_local4 = 0
	end )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "number", function ()
		local f4_local0 = f1_arg0:GetDataSource()
		if f4_local0.number:GetValue( f1_arg1 ) == 1 then
			f1_arg0.FirstLayerDivider:SetAlpha( 1, 0 )
		else
			f1_arg0.FirstLayerDivider:SetAlpha( 0, 0 )
		end
	end )
	f1_arg0:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg0:GetCurrentMenu()
		if f5_local0 then
			f5_local0:processEvent( {
				name = "edit_emblem_layer",
				controller = f1_arg1
			} )
		end
	end )
	f1_arg0:SetHandleMouse( false )
end

function RefreshLayerContent( f6_arg0, f6_arg1 )
	local f6_local0 = 0
	local f6_local1 = 0
	if f6_arg0:GetDataSource() ~= nil then
		local f6_local2 = f6_arg0:GetDataSource()
		f6_local2 = f6_local2.number:GetValue( f6_arg1 )
		if f6_local2 ~= nil then
			local f6_local3 = f6_arg0:GetDataSource()
			f6_local0 = f6_local3.iconId:GetValue( f6_arg1 )
			f6_local1 = f6_local2 - 1
			if f6_local0 ~= -1 then
				f6_arg0.plusicon:SetAlpha( 0, 0 )
			else
				f6_arg0.plusicon:SetAlpha( 1, 0 )
			end
		end
	end
	f6_arg0.LayerImage:SetupEmblemSelector( f6_local0, f6_local1 )
end

function EmblemLayer( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 200 * _1080p )
	self.id = "EmblemLayer"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetRGBFromTable( SWATCHES.CAC.BarracksBlurLight, 0 )
	ListBlur:SetBlurStrength( 2.75, 0 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f7_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -200, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local LayerImage = nil
	
	LayerImage = LUI.UIImage.new()
	LayerImage.id = "LayerImage"
	LayerImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 18, _1080p * 182, _1080p * 18, _1080p * 182 )
	self:addElement( LayerImage )
	self.LayerImage = LayerImage
	
	local LayerNumberLabel = nil
	
	LayerNumberLabel = LUI.UIText.new()
	LayerNumberLabel.id = "LayerNumberLabel"
	LayerNumberLabel:SetFontSize( 19 * _1080p )
	LayerNumberLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LayerNumberLabel:SetAlignment( LUI.Alignment.Left )
	LayerNumberLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 187, _1080p * 8, _1080p * 27 )
	LayerNumberLabel:SubscribeToModelThroughElement( self, "number", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.number:GetValue( f7_local1 )
		if f8_local0 ~= nil then
			LayerNumberLabel:setText( f8_local0, 0 )
		end
	end )
	self:addElement( LayerNumberLabel )
	self.LayerNumberLabel = LayerNumberLabel
	
	local GroupedIcon = nil
	
	GroupedIcon = LUI.UIImage.new()
	GroupedIcon.id = "GroupedIcon"
	GroupedIcon:SetAlpha( 0, 0 )
	GroupedIcon:setImage( RegisterMaterial( "emblem_link_icon" ), 0 )
	GroupedIcon:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -54, _1080p * -4, _1080p * 4, _1080p * 29 )
	self:addElement( GroupedIcon )
	self.GroupedIcon = GroupedIcon
	
	local plusicon = nil
	
	plusicon = LUI.UIImage.new()
	plusicon.id = "plusicon"
	plusicon:setImage( RegisterMaterial( "emblem_plus_icon" ), 0 )
	plusicon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -60, _1080p * 60, _1080p * -60, _1080p * 60 )
	self:addElement( plusicon )
	self.plusicon = plusicon
	
	local f7_local9 = nil
	if Engine.InFrontend() then
		f7_local9 = LUI.UIImage.new()
		f7_local9.id = "DropShadow"
		f7_local9:SetRGBFromInt( 0, 0 )
		f7_local9:SetAlpha( 0.3, 0 )
		f7_local9:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f7_local9:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f7_local9 )
		self.DropShadow = f7_local9
	end
	local FirstLayerDivider = nil
	
	FirstLayerDivider = LUI.UIImage.new()
	FirstLayerDivider.id = "FirstLayerDivider"
	FirstLayerDivider:SetAlpha( 0, 0 )
	FirstLayerDivider:setImage( RegisterMaterial( "emblem_divider" ), 0 )
	FirstLayerDivider:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -22, _1080p * -6, 0, 0 )
	self:addElement( FirstLayerDivider )
	self.FirstLayerDivider = FirstLayerDivider
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.ButtonOver = function ()
			
		end
		
		self._sequences.ButtonUp = function ()
			
		end
		
		LayerImage:RegisterAnimationSequence( "ButtonDisable", {
			{
				function ()
					return self.LayerImage:SetAlpha( 1, 0 )
				end,
				function ()
					return self.LayerImage:SetAlpha( 0.5, 100 )
				end
			}
		} )
		self._sequences.ButtonDisable = function ()
			LayerImage:AnimateSequence( "ButtonDisable" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg1.controller or f7_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f17_arg0, f17_arg1 )
		local f17_local0 = f17_arg1.controller or f7_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_disable", function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg1.controller or f7_local1
		ACTIONS.AnimateSequence( self, "ButtonDisable" )
	end )
	f0_local0( self, f7_local1, controller )
	return self
end

MenuBuilder.registerType( "EmblemLayer", EmblemLayer )
LockTable( _M )

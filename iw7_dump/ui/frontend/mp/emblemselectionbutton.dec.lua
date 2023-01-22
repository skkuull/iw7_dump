local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToDataSourceThroughElement( f1_arg0, nil, function ( f2_arg0, f2_arg1 )
		RefreshContent( f1_arg0, f1_arg1 )
	end )
	f1_arg0:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg0:GetCurrentMenu()
		if f3_local0 then
			f3_local0:processEvent( {
				name = "select_emblem_decal",
				controller = f1_arg1
			} )
		end
	end )
end

function RefreshContent( f4_arg0, f4_arg1 )
	if f4_arg0:GetDataSource() ~= nil then
		local f4_local0 = f4_arg0:GetDataSource()
		f4_arg0.EmblemTexture:SetupEmblemIcon( f4_local0.index )
	else
		f4_arg0.EmblemTexture:SetupEmblemIcon( -1 )
	end
end

function EmblemSelectionButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 194 * _1080p, 0, 219 * _1080p )
	self.id = "EmblemSelectionButton"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetRGBFromTable( SWATCHES.CAC.BarracksBlurLight, 0 )
	ListBlur:SetBlurStrength( 2.75, 0 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f5_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -195, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local f5_local5 = nil
	if not Engine.InFrontend() then
		f5_local5 = LUI.UIImage.new()
		f5_local5.id = "InGameBackground"
		f5_local5:SetRGBFromInt( 0, 0 )
		f5_local5:SetAlpha( 0.8, 0 )
		f5_local5:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
		self:addElement( f5_local5 )
		self.InGameBackground = f5_local5
	end
	local f5_local6 = nil
	if Engine.InFrontend() then
		f5_local6 = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
			controllerIndex = f5_local1
		} )
		f5_local6.id = "Background"
		f5_local6.DropShadow:SetAlpha( 0, 0 )
		f5_local6:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
		self:addElement( f5_local6 )
		self.Background = f5_local6
	end
	local EmblemTexture = nil
	
	EmblemTexture = LUI.UIImage.new()
	EmblemTexture.id = "EmblemTexture"
	EmblemTexture:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 17.5, _1080p * -17.5, _1080p * -177, _1080p * -18 )
	self:addElement( EmblemTexture )
	self.EmblemTexture = EmblemTexture
	
	local EmblemNameLabel = nil
	
	EmblemNameLabel = LUI.UIStyledText.new()
	EmblemNameLabel.id = "EmblemNameLabel"
	EmblemNameLabel:SetFontSize( 19 * _1080p )
	EmblemNameLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	EmblemNameLabel:SetAlignment( LUI.Alignment.Left )
	EmblemNameLabel:SetStartupDelay( 1000 )
	EmblemNameLabel:SetLineHoldTime( 400 )
	EmblemNameLabel:SetAnimMoveTime( 500 )
	EmblemNameLabel:SetEndDelay( 1000 )
	EmblemNameLabel:SetCrossfadeTime( 400 )
	EmblemNameLabel:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	EmblemNameLabel:SetMaxVisibleLines( 1 )
	EmblemNameLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -15, _1080p * 2.5, _1080p * 21.5 )
	EmblemNameLabel:SubscribeToModelThroughElement( self, "description", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.description:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			EmblemNameLabel:setText( ToUpperCase( LocalizeString( f6_local0 ) ), 0 )
		end
	end )
	self:addElement( EmblemNameLabel )
	self.EmblemNameLabel = EmblemNameLabel
	
	local f5_local9 = nil
	if Engine.InFrontend() then
		f5_local9 = LUI.UIImage.new()
		f5_local9.id = "DropShadow"
		f5_local9:SetRGBFromInt( 0, 0 )
		f5_local9:SetAlpha( 0.3, 0 )
		f5_local9:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f5_local9:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f5_local9 )
		self.DropShadow = f5_local9
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		EmblemNameLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.EmblemNameLabel:SetAlpha( 1, 0 )
				end,
				function ()
					return self.EmblemNameLabel:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.EmblemNameLabel:SetRGBFromInt( 0, 100 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			EmblemNameLabel:AnimateSequence( "ButtonOver" )
		end
		
		EmblemNameLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.EmblemNameLabel:SetRGBFromInt( 0, 0 )
				end,
				function ()
					return self.EmblemNameLabel:SetRGBFromInt( 16777215, 100 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			EmblemNameLabel:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f17_arg0, f17_arg1 )
		local f17_local0 = f17_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	f0_local0( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "EmblemSelectionButton", EmblemSelectionButton )
LockTable( _M )

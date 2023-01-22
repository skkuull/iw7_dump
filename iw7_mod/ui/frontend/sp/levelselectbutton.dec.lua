local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.GenericButton )
	local f1_local0 = function ( f2_arg0 )
		return string.match( f2_arg0, "^sa_" ) and f2_arg0 ~= "sa_moon"
	end
	
	f1_arg0.GenericButton:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f1_arg0:GetDataSource()
		f3_local0.buttonOnClickFunction( f3_arg0, f3_arg1 )
	end )
	f1_arg0.GenericButton:addEventHandler( "button_over", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f1_arg0:GetDataSource()
		f4_local0.buttonOnHoverFunction( f4_arg0, f4_arg1 )
		f4_local0 = f1_arg0:GetDataSource()
		f4_local0 = f4_local0.levelName
		if f1_local0( f4_local0 ) then
			f1_arg0.MainMissionIcon:SetAlpha( 0, 0 )
			f1_arg0.SAIcon:SetAlpha( 1, 0 )
			f1_arg0.JAIcon:SetAlpha( 0, 0 )
		elseif string.match( f4_local0, "^ja_" ) then
			f1_arg0.MainMissionIcon:SetAlpha( 0, 0 )
			f1_arg0.SAIcon:SetAlpha( 0, 0 )
			f1_arg0.JAIcon:SetAlpha( 1, 0 )
		else
			f1_arg0.MainMissionIcon:SetAlpha( 1, 0 )
			f1_arg0.SAIcon:SetAlpha( 0, 0 )
			f1_arg0.JAIcon:SetAlpha( 0, 0 )
		end
	end )
	f1_arg0.GenericButton:addEventHandler( "button_up", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f1_arg0:GetDataSource()
		f5_local0.buttonOnHoverFunction( f5_arg0, f5_arg1 )
		f5_local0 = f1_arg0:GetDataSource()
		f5_local0 = f5_local0.levelName
		if f1_local0( f5_local0 ) then
			f1_arg0.MainMissionIcon:SetAlpha( 0, 0 )
			f1_arg0.SAIcon:SetAlpha( 0.6, 0 )
			f1_arg0.JAIcon:SetAlpha( 0, 0 )
		elseif string.match( f5_local0, "^ja_" ) then
			f1_arg0.MainMissionIcon:SetAlpha( 0, 0 )
			f1_arg0.SAIcon:SetAlpha( 0, 0 )
			f1_arg0.JAIcon:SetAlpha( 0.6, 0 )
		else
			f1_arg0.MainMissionIcon:SetAlpha( 0.6, 0 )
			f1_arg0.SAIcon:SetAlpha( 0, 0 )
			f1_arg0.JAIcon:SetAlpha( 0, 0 )
		end
	end )
	f1_arg0:registerEventHandler( "grid_anim", function ( element, event )
		element:SetAlpha( event.value )
	end )
	assert( f1_arg0.MainMissionIcon )
	assert( f1_arg0.SAIcon )
	assert( f1_arg0.JAIcon )
	f1_arg0:SubscribeToDataSourceThroughElement( f1_arg0, nil, function ()
		local f7_local0 = f1_arg0:GetDataSource()
		f7_local0 = f7_local0.levelName
		if f1_local0( f7_local0 ) then
			f1_arg0.MainMissionIcon:SetAlpha( 0, 0 )
			f1_arg0.SAIcon:SetAlpha( 0.6, 0 )
			f1_arg0.JAIcon:SetAlpha( 0, 0 )
		elseif string.match( f7_local0, "^ja_" ) then
			f1_arg0.MainMissionIcon:SetAlpha( 0, 0 )
			f1_arg0.SAIcon:SetAlpha( 0, 0 )
			f1_arg0.JAIcon:SetAlpha( 0.6, 0 )
		else
			f1_arg0.MainMissionIcon:SetAlpha( 0.6, 0 )
			f1_arg0.SAIcon:SetAlpha( 0, 0 )
			f1_arg0.JAIcon:SetAlpha( 0, 0 )
		end
	end )
end

function LevelSelectButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "LevelSelectButton"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local GenericButton = nil
	
	GenericButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f8_local1
	} )
	GenericButton.id = "GenericButton"
	GenericButton:SetAlpha( 0, 0 )
	GenericButton:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 500, 0, 0 )
	GenericButton:SubscribeToModelThroughElement( self, "buttonLabel", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.buttonLabel:GetValue( f8_local1 )
		if f9_local0 ~= nil then
			GenericButton.Text:setText( LocalizeString( ToUpperCase( f9_local0 ) ), 0 )
		end
	end )
	self:addElement( GenericButton )
	self.GenericButton = GenericButton
	
	local GenericListButtonBackground = nil
	
	GenericListButtonBackground = MenuBuilder.BuildRegisteredType( "GenericListArrowButtonBackground", {
		controllerIndex = f8_local1
	} )
	GenericListButtonBackground.id = "GenericListButtonBackground"
	GenericListButtonBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( GenericListButtonBackground )
	self.GenericListButtonBackground = GenericListButtonBackground
	
	local Text = nil
	
	Text = LUI.UIStyledText.new()
	Text.id = "Text"
	Text:SetRGBFromInt( 14277081, 0 )
	Text:SetFontSize( 22 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Left )
	Text:SetStartupDelay( 2000 )
	Text:SetLineHoldTime( 400 )
	Text:SetAnimMoveTime( 300 )
	Text:SetEndDelay( 1500 )
	Text:SetCrossfadeTime( 750 )
	Text:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Text:SetMaxVisibleLines( 1 )
	Text:SetOutlineRGBFromInt( 0, 0 )
	Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 44, _1080p * -41, _1080p * -11, _1080p * 11 )
	Text:SubscribeToModelThroughElement( self, "buttonLabel", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.buttonLabel:GetValue( f8_local1 )
		if f10_local0 ~= nil then
			Text:setText( LocalizeString( ToUpperCase( f10_local0 ) ), 0 )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	local Lock = nil
	
	Lock = LUI.UIImage.new()
	Lock.id = "Lock"
	Lock:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
	Lock:SetAlpha( 0, 0 )
	Lock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Lock:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -32, _1080p * -6, _1080p * -12, _1080p * 14 )
	self:addElement( Lock )
	self.Lock = Lock
	
	local JAIcon = nil
	
	JAIcon = MenuBuilder.BuildRegisteredType( "OpsMapIconJA", {
		controllerIndex = f8_local1
	} )
	JAIcon.id = "JAIcon"
	JAIcon:SetAlpha( 0, 0 )
	JAIcon:SetScale( -0.75, 0 )
	JAIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -36.64, _1080p * 86.36, _1080p * -46.13, _1080p * 76.88 )
	self:addElement( JAIcon )
	self.JAIcon = JAIcon
	
	local MainMissionIcon = nil
	
	MainMissionIcon = MenuBuilder.BuildRegisteredType( "OpsMapIconML", {
		controllerIndex = f8_local1
	} )
	MainMissionIcon.id = "MainMissionIcon"
	MainMissionIcon:SetAlpha( 0, 0 )
	MainMissionIcon:SetZRotation( 45, 0 )
	MainMissionIcon:SetScale( -0.75, 0 )
	MainMissionIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -18.64, _1080p * 68.36, _1080p * -35.95, _1080p * 68.06 )
	self:addElement( MainMissionIcon )
	self.MainMissionIcon = MainMissionIcon
	
	local SAIcon = nil
	
	SAIcon = MenuBuilder.BuildRegisteredType( "OpsMapIconSA", {
		controllerIndex = f8_local1
	} )
	SAIcon.id = "SAIcon"
	SAIcon:SetAlpha( 0, 0 )
	SAIcon:SetScale( -0.78, 0 )
	SAIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -62.14, _1080p * 111.86, _1080p * -60.13, _1080p * 90.88 )
	self:addElement( SAIcon )
	self.SAIcon = SAIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Text:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Text:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Lock:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
				end
			}
		} )
		JAIcon:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.JAIcon:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		MainMissionIcon:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.MainMissionIcon:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		SAIcon:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.SAIcon:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Text:AnimateSequence( "ButtonOver" )
			Lock:AnimateSequence( "ButtonOver" )
			JAIcon:AnimateSequence( "ButtonOver" )
			MainMissionIcon:AnimateSequence( "ButtonOver" )
			SAIcon:AnimateSequence( "ButtonOver" )
		end
		
		Text:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Text:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		JAIcon:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.JAIcon:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		MainMissionIcon:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.MainMissionIcon:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		SAIcon:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.SAIcon:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Text:AnimateSequence( "ButtonUp" )
			Lock:AnimateSequence( "ButtonUp" )
			JAIcon:AnimateSequence( "ButtonUp" )
			MainMissionIcon:AnimateSequence( "ButtonUp" )
			SAIcon:AnimateSequence( "ButtonUp" )
		end
		
		Text:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Text:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Lock:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		JAIcon:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.JAIcon:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		MainMissionIcon:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.MainMissionIcon:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		SAIcon:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.SAIcon:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			Text:AnimateSequence( "ButtonOverDisabled" )
			Lock:AnimateSequence( "ButtonOverDisabled" )
			JAIcon:AnimateSequence( "ButtonOverDisabled" )
			MainMissionIcon:AnimateSequence( "ButtonOverDisabled" )
			SAIcon:AnimateSequence( "ButtonOverDisabled" )
		end
		
		Text:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Text:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Lock:SetRGBFromInt( 12566463, 0 )
				end
			}
		} )
		JAIcon:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.JAIcon:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		MainMissionIcon:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.MainMissionIcon:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		SAIcon:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.SAIcon:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			Text:AnimateSequence( "ButtonUpDisabled" )
			Lock:AnimateSequence( "ButtonUpDisabled" )
			JAIcon:AnimateSequence( "ButtonUpDisabled" )
			MainMissionIcon:AnimateSequence( "ButtonUpDisabled" )
			SAIcon:AnimateSequence( "ButtonUpDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	SAIcon:addEventHandler( "button_over", function ( f42_arg0, f42_arg1 )
		local f42_local0 = f42_arg1.controller or f8_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	SAIcon:addEventHandler( "button_up", function ( f43_arg0, f43_arg1 )
		local f43_local0 = f43_arg1.controller or f8_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	PostLoadFunc( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "LevelSelectButton", LevelSelectButton )
LockTable( _M )

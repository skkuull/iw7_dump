local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 60 * _1080p
f0_local1 = 115 * _1080p
f0_local2 = 500 * _1080p
local f0_local3, f0_local4 = nil
local f0_local5 = 60 * _1080p
local f0_local6 = FONTS.GetFont( FONTS.MainMedium.File )
local f0_local7 = 30 * _1080p
local f0_local8 = function ( f1_arg0 )
	local f1_local0 = f1_arg0.MessageText
	local f1_local1 = f1_arg0.MantleHint
	local f1_local2 = f1_arg0.InteractiveObjectIcon
	local f1_local3 = f1_arg0.Background
	f0_local3 = f0_local3 and f0_local2 or f0_local3
	f0_local4 = f0_local4 and f0_local0 or f0_local4
	f1_local0:SetAlpha( 0, 0 )
	f1_local1:SetAlpha( 0, 0 )
	f1_local2:SetAlpha( 0, 0 )
	f1_local3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, -f0_local4 * 0.5, f0_local4 * 0.5, 100, LUI.EASING.outQuadratic )
	f1_local3:SetAlpha( 0, 100 )
	f1_arg0:SetAlpha( 0, 100 )
end

function PostLoadFunc( f2_arg0, f2_arg1 )
	local f2_local0 = assert
	local f2_local1 = f2_arg0.MessageText
	if f2_local1 then
		f2_local1 = f2_arg0.MantleHint and f2_arg0.Background
	end
	f2_local0( f2_local1, "WARNING: Message specific elements are missing..." )
	f2_local0 = f2_arg0.MessageText
	f2_local0:SetShadowMinDistance( -0.2, 0 )
	f2_local0:SetShadowMaxDistance( 0.2, 0 )
	f2_local0:SetShadowRGBFromInt( 0, 0 )
	f2_local0:SetShadowUOffset( -0 )
	f2_local0:SetShadowVOffset( -0 )
	f2_local1 = f2_arg0.MantleHint
	f2_local1:SetShadowMinDistance( -0.2, 0 )
	f2_local1:SetShadowMaxDistance( 0.2, 0 )
	f2_local1:SetShadowRGBFromInt( 0, 0 )
	f2_local1:SetShadowUOffset( -0 )
	f2_local1:SetShadowVOffset( -0 )
	f2_local1:SetWordWrap( false )
	local f2_local2 = DataSources.inGame.HUD.hints.interactiveObject.popup.shouldShow:GetModel( f2_arg1 )
	local f2_local3 = DataSources.inGame.HUD.hints.interactiveObject.popup.shouldShowIcon:GetModel( f2_arg1 )
	local f2_local4 = DataSources.inGame.HUD.hints.interactiveObject.popup.string:GetModel( f2_arg1 )
	local f2_local5 = DataSources.inGame.HUD.hints.canMantle:GetModel( f2_arg1 )
	local f2_local6 = function ( f3_arg0 )
		local f3_local0, f3_local1, f3_local2, f3_local3 = GetTextDimensions( f3_arg0, f0_local6, f0_local7 )
		return f3_local2 - f3_local0
	end
	
	f2_arg0.currentState = "Hidden"
	ACTIONS.AnimateSequence( f2_arg0, "Hidden" )
	local f2_local7 = function ()
		local f4_local0 = DataModel.GetModelValue( f2_local2 )
		local f4_local1 = DataModel.GetModelValue( f2_local5 )
		local f4_local2 = DataModel.GetModelValue( f2_local4 )
		local f4_local3, f4_local4 = nil
		local f4_local5 = Engine.IsAliensMode()
		local f4_local6 = "Hidden"
		if f4_local5 then
			f4_local6 = "ZombiesHidden"
		end
		if f4_local0 and f4_local2 ~= "" then
			f2_arg0:SetAlpha( 1 )
			local f4_local7 = DataModel.GetModelValue( f2_local3 )
			if f4_local1 and f4_local7 == false then
				local f4_local8 = Engine.Localize( "PLATFORM_MANTLE" )
				f4_local6 = "none"
				f4_local3 = f2_local6( f4_local8 ) + f0_local5 * 3
				f4_local4 = f0_local0
				f2_arg0.MantleHint:setText( f4_local8 )
				f2_arg0.Background:SetScale( 0, 0 )
				f2_arg0.Background:SetAlpha( 1, 0 )
				f2_arg0.InteractiveObjectIcon:SetAlpha( 0, 0 )
				f2_arg0.MessageText:SetAlpha( 0, 0 )
				f2_arg0.MantleHint:SetAlpha( 1, 0 )
			elseif f4_local5 then
				f4_local6 = "none"
				f4_local3 = f2_local6( f4_local2 ) + f0_local5
				f4_local4 = f0_local1
				f2_local0:SetTop( _1080p * -15, 0 )
				f2_local0:SetBottom( _1080p * 15, 0 )
				f2_local0:SetLeft( f4_local3 * -0.5, 0 )
				f2_local0:SetRight( f4_local3 * 0.5, 0 )
				f2_arg0.Background:SetAlpha( 0, 0 )
				f2_arg0.InteractiveObjectIcon:SetAlpha( 0, 0 )
				f2_arg0.MessageText:SetAlpha( 1, 0 )
				f2_arg0.MantleHint:SetAlpha( 0, 0 )
			elseif f4_local7 then
				f4_local6 = "none"
				f4_local3 = f2_local6( f4_local2 ) + f0_local5
				f4_local4 = f0_local1
				f2_local0:SetTop( _1080p * -53, 0 )
				f2_local0:SetBottom( _1080p * -23, 0 )
				f2_local0:SetLeft( f4_local3 * -0.5, 0 )
				f2_local0:SetRight( f4_local3 * 0.5, 0 )
				f2_arg0.Background:SetScale( 0, 0 )
				f2_arg0.Background:SetAlpha( 1, 0 )
				f2_arg0.InteractiveObjectIcon:SetAlpha( 1, 0 )
				f2_arg0.MessageText:SetAlpha( 1, 0 )
				f2_arg0.MantleHint:SetAlpha( 0, 0 )
			else
				f4_local6 = "none"
				f4_local3 = f2_local6( f4_local2 ) + f0_local5
				f4_local4 = f0_local0
				f2_local0:SetTop( _1080p * -15, 0 )
				f2_local0:SetBottom( _1080p * 15, 0 )
				f2_local0:SetLeft( f4_local3 * -0.5, 0 )
				f2_local0:SetRight( f4_local3 * 0.5, 0 )
				f2_arg0.Background:SetAlpha( 1, 0 )
				f2_arg0.Background:SetScale( 0, 0 )
				f2_arg0.InteractiveObjectIcon:SetAlpha( 0, 0 )
				f2_arg0.MessageText:SetAlpha( 1, 0 )
				f2_arg0.MantleHint:SetAlpha( 0, 0 )
			end
		end
		if f4_local3 ~= nil then
			f0_local3 = f4_local3
			f2_arg0.Background:SetLeft( f4_local3 * -0.5, 100 )
			f2_arg0.Background:SetRight( f4_local3 * 0.5, 100 )
		end
		if f4_local4 ~= nil then
			f0_local4 = f4_local4
			f2_arg0.Background:SetTop( f4_local4 * -0.5, 100 )
			f2_arg0.Background:SetBottom( f4_local4 * 0.5, 100 )
		end
		if f2_arg0.currentState ~= f4_local6 then
			if f4_local6 == "Hidden" then
				f0_local8( f2_arg0 )
			elseif f4_local6 ~= "none" then
				ACTIONS.AnimateSequence( f2_arg0, f4_local6 )
			end
			f2_arg0.currentState = f4_local6
		end
	end
	
	f2_arg0:SubscribeToModel( f2_local2, f2_local7, true )
	f2_arg0:SubscribeToModel( f2_local4, f2_local7, true )
	f2_arg0:SubscribeToModel( f2_local5, f2_local7 )
	if Engine.IsMultiplayer() then
		f2_arg0:SubscribeToModel( DataSources.inGame.HUD.hints.interactiveObject.weapon.isMk2:GetModel( f2_arg1 ), function ()
			if DataSources.inGame.HUD.hints.interactiveObject.weapon.isMk2:GetValue( f2_arg1 ) ~= nil and DataSources.inGame.HUD.hints.interactiveObject.weapon.isMk2:GetValue( f2_arg1 ) == true then
				f2_arg0.MK2:SetAlpha( 1, 0 )
				f2_arg0.MK2Pattern:SetAlpha( 1, 0 )
				f2_arg0.MK2Pattern.Gradient:SetAlpha( 0, 0 )
			else
				f2_arg0.MK2:SetAlpha( 0, 0 )
				f2_arg0.MK2Pattern:SetAlpha( 0, 0 )
				f2_arg0.MK2Pattern.Gradient:SetAlpha( 0, 0 )
			end
		end )
	end
end

function InteractiveObjectPopup( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 115 * _1080p )
	self.id = "InteractiveObjectPopup"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local f6_local3 = nil
	if Engine.IsMultiplayer() then
		f6_local3 = MenuBuilder.BuildRegisteredType( "MK2Pattern", {
			controllerIndex = f6_local1
		} )
		f6_local3.id = "MK2Pattern"
		f6_local3:SetAlpha( 0, 0 )
		f6_local3:SetScale( -0.5, 0 )
		f6_local3:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 590, _1080p * -579, _1080p * -182.5, _1080p * 329.5 )
		self:addElement( f6_local3 )
		self.MK2Pattern = f6_local3
	end
	local f6_local4 = nil
	if Engine.IsMultiplayer() then
		f6_local4 = LUI.UIImage.new()
		f6_local4.id = "MK2"
		f6_local4:SetAlpha( 0, 0 )
		f6_local4:setImage( RegisterMaterial( "mk2_watermark_1" ), 0 )
		f6_local4:SetBlendMode( BLEND_MODE.addWithAlpha )
		f6_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 273.5, _1080p * 337.5, _1080p * 110, _1080p * 142 )
		self:addElement( f6_local4 )
		self.MK2 = f6_local4
	end
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "InteractiveObjectBackground", {
		controllerIndex = f6_local1
	} )
	Background.id = "Background"
	Background:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -57, _1080p * 58 )
	self:addElement( Background )
	self.Background = Background
	
	local InteractiveObjectIcon = nil
	
	InteractiveObjectIcon = MenuBuilder.BuildRegisteredType( "InteractiveObjectIcon", {
		controllerIndex = f6_local1
	} )
	InteractiveObjectIcon.id = "InteractiveObjectIcon"
	InteractiveObjectIcon:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	InteractiveObjectIcon:SetScale( -0.4, 0 )
	InteractiveObjectIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -50, _1080p * 78 )
	self:addElement( InteractiveObjectIcon )
	self.InteractiveObjectIcon = InteractiveObjectIcon
	
	local MessageText = nil
	
	MessageText = LUI.UIStyledText.new()
	MessageText.id = "MessageText"
	MessageText:SetFontSize( 32 * _1080p )
	MessageText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MessageText:SetAlignment( LUI.Alignment.Center )
	MessageText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -54, _1080p * -22 )
	MessageText:SubscribeToModel( DataSources.inGame.HUD.hints.interactiveObject.popup.string:GetModel( f6_local1 ), function ()
		local f7_local0 = DataSources.inGame.HUD.hints.interactiveObject.popup.string:GetValue( f6_local1 )
		if f7_local0 ~= nil then
			MessageText:setText( f7_local0, 0 )
		end
	end )
	self:addElement( MessageText )
	self.MessageText = MessageText
	
	local MantleHint = nil
	
	MantleHint = LUI.UIStyledText.new()
	MantleHint.id = "MantleHint"
	MantleHint:setText( Engine.Localize( "PLATFORM_MANTLE" ), 0 )
	MantleHint:SetFontSize( 32 * _1080p )
	MantleHint:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MantleHint:SetAlignment( LUI.Alignment.Center )
	MantleHint:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -16, _1080p * 16 )
	self:addElement( MantleHint )
	self.MantleHint = MantleHint
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "VisibleIcon", {
			{
				function ()
					return self.Background:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end
			}
		} )
		InteractiveObjectIcon:RegisterAnimationSequence( "VisibleIcon", {
			{
				function ()
					return self.InteractiveObjectIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "VisibleIcon", {
			{
				function ()
					return self.MessageText:SetAlpha( 1, 0 )
				end
			}
		} )
		MantleHint:RegisterAnimationSequence( "VisibleIcon", {
			{
				function ()
					return self.MantleHint:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.VisibleIcon = function ()
			Background:AnimateSequence( "VisibleIcon" )
			InteractiveObjectIcon:AnimateSequence( "VisibleIcon" )
			MessageText:AnimateSequence( "VisibleIcon" )
			MantleHint:AnimateSequence( "VisibleIcon" )
		end
		
		Background:RegisterAnimationSequence( "VisibleNoIcon", {
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Background:SetScale( 0, 0 )
				end
			}
		} )
		InteractiveObjectIcon:RegisterAnimationSequence( "VisibleNoIcon", {
			{
				function ()
					return self.InteractiveObjectIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "VisibleNoIcon", {
			{
				function ()
					return self.MessageText:SetAlpha( 1, 0 )
				end
			}
		} )
		MantleHint:RegisterAnimationSequence( "VisibleNoIcon", {
			{
				function ()
					return self.MantleHint:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.VisibleNoIcon = function ()
			Background:AnimateSequence( "VisibleNoIcon" )
			InteractiveObjectIcon:AnimateSequence( "VisibleNoIcon" )
			MessageText:AnimateSequence( "VisibleNoIcon" )
			MantleHint:AnimateSequence( "VisibleNoIcon" )
		end
		
		Background:RegisterAnimationSequence( "VisibleMantle", {
			{
				function ()
					return self.Background:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end
			}
		} )
		InteractiveObjectIcon:RegisterAnimationSequence( "VisibleMantle", {
			{
				function ()
					return self.InteractiveObjectIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "VisibleMantle", {
			{
				function ()
					return self.MessageText:SetAlpha( 0, 0 )
				end
			}
		} )
		MantleHint:RegisterAnimationSequence( "VisibleMantle", {
			{
				function ()
					return self.MantleHint:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.VisibleMantle = function ()
			Background:AnimateSequence( "VisibleMantle" )
			InteractiveObjectIcon:AnimateSequence( "VisibleMantle" )
			MessageText:AnimateSequence( "VisibleMantle" )
			MantleHint:AnimateSequence( "VisibleMantle" )
		end
		
		Background:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Background:SetScale( 0, 0 )
				end
			}
		} )
		InteractiveObjectIcon:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.InteractiveObjectIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.MessageText:SetAlpha( 0, 0 )
				end
			}
		} )
		MantleHint:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.MantleHint:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hidden = function ()
			Background:AnimateSequence( "Hidden" )
			InteractiveObjectIcon:AnimateSequence( "Hidden" )
			MessageText:AnimateSequence( "Hidden" )
			MantleHint:AnimateSequence( "Hidden" )
		end
		
		Background:RegisterAnimationSequence( "Zombies", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		InteractiveObjectIcon:RegisterAnimationSequence( "Zombies", {
			{
				function ()
					return self.InteractiveObjectIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "Zombies", {
			{
				function ()
					return self.MessageText:SetAlpha( 1, 0 )
				end
			}
		} )
		MantleHint:RegisterAnimationSequence( "Zombies", {
			{
				function ()
					return self.MantleHint:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Zombies = function ()
			Background:AnimateSequence( "Zombies" )
			InteractiveObjectIcon:AnimateSequence( "Zombies" )
			MessageText:AnimateSequence( "Zombies" )
			MantleHint:AnimateSequence( "Zombies" )
		end
		
		Background:RegisterAnimationSequence( "ZombiesHidden", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Background:SetScale( -1, 0 )
				end
			}
		} )
		InteractiveObjectIcon:RegisterAnimationSequence( "ZombiesHidden", {
			{
				function ()
					return self.InteractiveObjectIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "ZombiesHidden", {
			{
				function ()
					return self.MessageText:SetAlpha( 0, 0 )
				end
			}
		} )
		MantleHint:RegisterAnimationSequence( "ZombiesHidden", {
			{
				function ()
					return self.MantleHint:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ZombiesHidden = function ()
			Background:AnimateSequence( "ZombiesHidden" )
			InteractiveObjectIcon:AnimateSequence( "ZombiesHidden" )
			MessageText:AnimateSequence( "ZombiesHidden" )
			MantleHint:AnimateSequence( "ZombiesHidden" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "InteractiveObjectPopup", InteractiveObjectPopup )
LockTable( _M )

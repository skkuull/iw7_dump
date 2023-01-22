local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "achieved", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.achieved:GetValue( f1_arg1 )
		local f2_local1 = f1_arg0:GetDataSource()
		f2_local1 = f2_local1.count:GetValue( f1_arg1 )
		if f2_local0 then
			if f2_local1 <= 0 then
				ACTIONS.AnimateSequence( f1_arg0, "UnlockedNoCount" )
			else
				ACTIONS.AnimateSequence( f1_arg0, "Unlocked" )
			end
			f1_arg0:SetButtonDisabled( false )
		else
			ACTIONS.AnimateSequence( f1_arg0, "Locked" )
			f1_arg0:SetButtonDisabled( true )
		end
	end )
end

function MedalButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 155 * _1080p, 0, 155 * _1080p )
	self.id = "MedalButton"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local f3_local3 = nil
	if Engine.InFrontend() then
		f3_local3 = LUI.UIImage.new()
		f3_local3.id = "DropShadow"
		f3_local3:SetRGBFromInt( 0, 0 )
		f3_local3:SetAlpha( 0.3, 0 )
		f3_local3:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f3_local3:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f3_local3 )
		self.DropShadow = f3_local3
	end
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetBlurStrength( 2.75, 0 )
	Blur:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f3_local1
	} )
	Background.id = "Background"
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -64, _1080p * 64, _1080p * 26, _1080p * 154 )
	Icon:SubscribeToModelThroughElement( self, "icon", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.icon:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Icon:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Selection = nil
	
	Selection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f3_local1
	} )
	Selection.id = "Selection"
	Selection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( Selection )
	self.Selection = Selection
	
	local f3_local8 = nil
	if Engine.InFrontend() then
		f3_local8 = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
			controllerIndex = f3_local1
		} )
		f3_local8.id = "TitleBG"
		f3_local8.DropShadow:SetAlpha( 0, 0 )
		f3_local8:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
		self:addElement( f3_local8 )
		self.TitleBG = f3_local8
	end
	local TitleLabel = nil
	
	TitleLabel = LUI.UIStyledText.new()
	TitleLabel.id = "TitleLabel"
	TitleLabel:SetFontSize( 19 * _1080p )
	TitleLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TitleLabel:SetAlignment( LUI.Alignment.Left )
	TitleLabel:SetStartupDelay( 1000 )
	TitleLabel:SetLineHoldTime( 500 )
	TitleLabel:SetAnimMoveTime( 500 )
	TitleLabel:SetEndDelay( 1000 )
	TitleLabel:SetCrossfadeTime( 500 )
	TitleLabel:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	TitleLabel:SetMaxVisibleLines( 1 )
	TitleLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 13, 0, _1080p * 2.5, _1080p * 21.5 )
	TitleLabel:SubscribeToModelThroughElement( self, "text", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.text:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			TitleLabel:setText( LocalizeString( f5_local0 ), 0 )
		end
	end )
	self:addElement( TitleLabel )
	self.TitleLabel = TitleLabel
	
	local Count = nil
	
	Count = LUI.UIText.new()
	Count.id = "Count"
	Count:SetFontSize( 22 * _1080p )
	Count:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Count:SetAlignment( LUI.Alignment.Right )
	Count:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 5, _1080p * -5, _1080p * -22, 0 )
	Count:SubscribeToModelThroughElement( self, "count", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.count:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			Count:setText( LocalizeIntoString( f6_local0, "LUA_MENU_MP_RULES_MULTIPLIER" ), 0 )
		end
	end )
	self:addElement( Count )
	self.Count = Count
	
	local Lock = nil
	
	Lock = LUI.UIImage.new()
	Lock.id = "Lock"
	Lock:SetAlpha( 0, 0 )
	Lock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Lock:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -16, _1080p * 16, _1080p * -4, _1080p * 28 )
	self:addElement( Lock )
	self.Lock = Lock
	
	self._animationSets.DefaultAnimationSet = function ()
		TitleLabel:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TitleLabel:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			TitleLabel:AnimateSequence( "DefaultSequence" )
		end
		
		Icon:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Icon:SetScale( 0.05, 50 )
				end
			}
		} )
		TitleLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.TitleLabel:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Count:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Count:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Icon:AnimateSequence( "ButtonOver" )
			TitleLabel:AnimateSequence( "ButtonOver" )
			Count:AnimateSequence( "ButtonOver" )
		end
		
		Icon:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Icon:SetScale( 0, 200 )
				end
			}
		} )
		TitleLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.TitleLabel:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		Count:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Count:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Icon:AnimateSequence( "ButtonUp" )
			TitleLabel:AnimateSequence( "ButtonUp" )
			Count:AnimateSequence( "ButtonUp" )
		end
		
		Icon:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Icon:SetAlpha( 0.1, 0 )
				end
			},
			{
				function ()
					return self.Icon:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Icon:SetScale( 0, 0 )
				end
			}
		} )
		Count:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Count:SetAlpha( 0, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Icon:AnimateSequence( "Locked" )
			Count:AnimateSequence( "Locked" )
			Lock:AnimateSequence( "Locked" )
		end
		
		Icon:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Icon:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Icon:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Icon:SetScale( 0, 0 )
				end
			}
		} )
		Count:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Count:SetAlpha( 1, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			Icon:AnimateSequence( "Unlocked" )
			Count:AnimateSequence( "Unlocked" )
			Lock:AnimateSequence( "Unlocked" )
		end
		
		Count:RegisterAnimationSequence( "UnlockedNoCount", {
			{
				function ()
					return self.Count:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.UnlockedNoCount = function ()
			Count:AnimateSequence( "UnlockedNoCount" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f32_arg0, f32_arg1 )
		local f32_local0 = f32_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f33_arg0, f33_arg1 )
		local f33_local0 = f33_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_disable", function ( f34_arg0, f34_arg1 )
		local f34_local0 = f34_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_over_disable", function ( f35_arg0, f35_arg1 )
		local f35_local0 = f35_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "MedalButton", MedalButton )
LockTable( _M )

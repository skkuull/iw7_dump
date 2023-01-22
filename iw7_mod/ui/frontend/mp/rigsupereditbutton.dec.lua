local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if CONDITIONS.UseCACBreadCrumbs() then
		f1_arg0:SubscribeToModelThroughElement( f1_arg0, "rigRef", function ()
			assert( f1_arg0.NewItemNotification )
			local f2_local0 = Cac.GetSuperRowList()
			local f2_local1 = f1_arg0:GetDataSource()
			f2_local1 = f2_local1.rigRef:GetValue( f1_arg1 )
			for f2_local5, f2_local6 in pairs( f2_local0 ) do
				if f2_local6.rigRef == f2_local1 and Rewards.IsNew( f1_arg1, "super", Engine.TableLookupGetRowNum( CSV.rigSuperUnlockTable.file, CSV.rigSuperUnlockTable.cols.ref, f2_local5 ) ) then
					f1_arg0.NewItemNotification:SetAlpha( 1, 0 )
					break
				end
			end
		end )
	end
end

function RigSuperEditButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 210 * _1080p, 0, 174 * _1080p )
	self.id = "RigSuperEditButton"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	self:setUseStencil( true )
	local GenericItemBackground = nil
	
	GenericItemBackground = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f3_local1
	} )
	GenericItemBackground.id = "GenericItemBackground"
	GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericItemBackground )
	self.GenericItemBackground = GenericItemBackground
	
	local SuperImage = nil
	
	SuperImage = LUI.UIImage.new()
	SuperImage.id = "SuperImage"
	SuperImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -75, _1080p * 75, _1080p * -63, _1080p * 87 )
	SuperImage:SubscribeToModelThroughElement( self, "icon", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.icon:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			SuperImage:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( SuperImage )
	self.SuperImage = SuperImage
	
	local SuperName = nil
	
	SuperName = LUI.UIStyledText.new()
	SuperName.id = "SuperName"
	SuperName:SetFontSize( 22 * _1080p )
	SuperName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	SuperName:SetAlignment( LUI.Alignment.Left )
	SuperName:SetStartupDelay( 1000 )
	SuperName:SetLineHoldTime( 400 )
	SuperName:SetAnimMoveTime( 150 )
	SuperName:SetEndDelay( 1000 )
	SuperName:SetCrossfadeTime( 400 )
	SuperName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	SuperName:SetMaxVisibleLines( 1 )
	SuperName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 9, _1080p * 201, _1080p * 141, _1080p * 163 )
	SuperName:SubscribeToModelThroughElement( self, "superName", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.superName:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			SuperName:setText( f5_local0, 0 )
		end
	end )
	self:addElement( SuperName )
	self.SuperName = SuperName
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f3_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local f3_local7 = nil
	if Engine.InFrontend() then
		f3_local7 = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
			controllerIndex = f3_local1
		} )
		f3_local7.id = "SuperLabelBackground"
		f3_local7.DropShadow:SetAlpha( 0, 0 )
		f3_local7:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 210, _1080p * -174, _1080p * -150 )
		self:addElement( f3_local7 )
		self.SuperLabelBackground = f3_local7
	end
	local SuperLabel = nil
	
	SuperLabel = LUI.UIStyledText.new()
	SuperLabel.id = "SuperLabel"
	SuperLabel:SetRGBFromInt( 14277081, 0 )
	SuperLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_SELECT_SUPER" ) ), 0 )
	SuperLabel:SetFontSize( 19 * _1080p )
	SuperLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	SuperLabel:SetAlignment( LUI.Alignment.Left )
	SuperLabel:SetOptOutRightToLeftAlignmentFlip( true )
	SuperLabel:SetStartupDelay( 1250 )
	SuperLabel:SetLineHoldTime( 400 )
	SuperLabel:SetAnimMoveTime( 300 )
	SuperLabel:SetEndDelay( 1000 )
	SuperLabel:SetCrossfadeTime( 500 )
	SuperLabel:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	SuperLabel:SetMaxVisibleLines( 1 )
	SuperLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -20, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( SuperLabel )
	self.SuperLabel = SuperLabel
	
	local Lock = nil
	
	Lock = LUI.UIImage.new()
	Lock.id = "Lock"
	Lock:SetRGBFromInt( 12566463, 0 )
	Lock:SetAlpha( 0, 0 )
	Lock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Lock:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -28, _1080p * -6, _1080p * -86, _1080p * -64 )
	self:addElement( Lock )
	self.Lock = Lock
	
	local f3_local10 = nil
	if CONDITIONS.UseCACBreadCrumbs( self ) then
		f3_local10 = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
			controllerIndex = f3_local1
		} )
		f3_local10.id = "NewItemNotification"
		f3_local10:SetAlpha( 0, 0 )
		f3_local10:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -20, _1080p * 44 )
		self:addElement( f3_local10 )
		self.NewItemNotification = f3_local10
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		SuperImage:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.SuperImage:SetScale( 0.05, 50 )
				end
			}
		} )
		SuperLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.SuperLabel:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.SuperLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			SuperImage:AnimateSequence( "ButtonOver" )
			SuperLabel:AnimateSequence( "ButtonOver" )
			Lock:AnimateSequence( "ButtonOver" )
		end
		
		SuperImage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.SuperImage:SetScale( 0, 200 )
				end
			}
		} )
		SuperLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.SuperLabel:SetRGBFromInt( 14277081, 0 )
				end
			},
			{
				function ()
					return self.SuperLabel:SetAlpha( 1, 0 )
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
		self._sequences.ButtonUp = function ()
			SuperImage:AnimateSequence( "ButtonUp" )
			SuperLabel:AnimateSequence( "ButtonUp" )
			Lock:AnimateSequence( "ButtonUp" )
		end
		
		self._sequences.Pulse = function ()
			
		end
		
		self._sequences.PulseStop = function ()
			
		end
		
		SuperLabel:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.SuperLabel:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.SuperLabel:SetAlpha( 0.5, 0 )
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
		self._sequences.ButtonOverDisabled = function ()
			SuperLabel:AnimateSequence( "ButtonOverDisabled" )
			Lock:AnimateSequence( "ButtonOverDisabled" )
		end
		
		SuperLabel:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.SuperLabel:SetRGBFromInt( 12566463, 0 )
				end
			},
			{
				function ()
					return self.SuperLabel:SetAlpha( 1, 0 )
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
					return self.Lock:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			SuperLabel:AnimateSequence( "ButtonUpDisabled" )
			Lock:AnimateSequence( "ButtonUpDisabled" )
		end
		
		self._sequences.Activate = function ()
			
		end
		
		SuperImage:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.SuperImage:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			SuperImage:AnimateSequence( "Locked" )
		end
		
		SuperImage:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.SuperImage:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			SuperImage:AnimateSequence( "Unlocked" )
		end
		
		self._sequences.StopActivateAnim = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f36_arg0, f36_arg1 )
		local f36_local0 = f36_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "SuperLabelBackground",
			sequenceName = "ButtonOver",
			elementPath = "SuperLabelBackground"
		} )
	end )
	self:addEventHandler( "button_up", function ( f37_arg0, f37_arg1 )
		local f37_local0 = f37_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "SuperLabelBackground",
			sequenceName = "ButtonUp",
			elementPath = "SuperLabelBackground"
		} )
	end )
	self:addEventHandler( "button_over_disable", function ( f38_arg0, f38_arg1 )
		local f38_local0 = f38_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "SuperLabelBackground",
			sequenceName = "ButtonOver",
			elementPath = "SuperLabelBackground"
		} )
	end )
	self:addEventHandler( "button_disable", function ( f39_arg0, f39_arg1 )
		local f39_local0 = f39_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonUpDisabled" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "SuperLabelBackground",
			sequenceName = "ButtonUp",
			elementPath = "SuperLabelBackground"
		} )
	end )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "RigSuperEditButton", RigSuperEditButton )
LockTable( _M )

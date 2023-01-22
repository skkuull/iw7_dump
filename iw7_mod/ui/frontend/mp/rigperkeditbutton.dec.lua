local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if CONDITIONS.UseCACBreadCrumbs() then
		assert( f1_arg0.NewItemNotification )
		f1_arg0:SubscribeToModelThroughElement( f1_arg0, "rigRef", function ()
			assert( f1_arg0.NewItemNotification )
			local f2_local0 = f1_arg0:GetDataSource()
			for f2_local4, f2_local5 in pairs( Cac.GetTraitsForRig( f2_local0.rigRef:GetValue( f1_arg1 ) ) ) do
				if Rewards.IsNew( f1_arg1, "trait", Engine.TableLookupGetRowNum( CSV.rigTraitUnlockTable.file, CSV.rigTraitUnlockTable.cols.ref, f2_local4 ) ) then
					f1_arg0.NewItemNotification:SetAlpha( 1, 0 )
					break
				end
			end
		end )
	end
end

function RigPerkEditButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 210 * _1080p, 0, 174 * _1080p )
	self.id = "RigPerkEditButton"
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
	
	local RigPerkImage = nil
	
	RigPerkImage = LUI.UIImage.new()
	RigPerkImage.id = "RigPerkImage"
	RigPerkImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -52, _1080p * 76 )
	RigPerkImage:SubscribeToModelThroughElement( self, "archetypePerk.icon", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.archetypePerk.icon:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			RigPerkImage:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( RigPerkImage )
	self.RigPerkImage = RigPerkImage
	
	local TraitName = nil
	
	TraitName = LUI.UIStyledText.new()
	TraitName.id = "TraitName"
	TraitName:SetFontSize( 22 * _1080p )
	TraitName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TraitName:SetAlignment( LUI.Alignment.Left )
	TraitName:SetStartupDelay( 1000 )
	TraitName:SetLineHoldTime( 400 )
	TraitName:SetAnimMoveTime( 150 )
	TraitName:SetEndDelay( 1000 )
	TraitName:SetCrossfadeTime( 400 )
	TraitName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	TraitName:SetMaxVisibleLines( 1 )
	TraitName:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 9, _1080p * -9, _1080p * 141, _1080p * 163 )
	TraitName:SubscribeToModelThroughElement( self, "archetypePerk.name", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.archetypePerk.name:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			TraitName:setText( f5_local0, 0 )
		end
	end )
	self:addElement( TraitName )
	self.TraitName = TraitName
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f3_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local TraitLabelBackground = nil
	
	TraitLabelBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f3_local1
	} )
	TraitLabelBackground.id = "TraitLabelBackground"
	TraitLabelBackground.DropShadow:SetAlpha( 0, 0 )
	TraitLabelBackground:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -210, 0, _1080p * -174, _1080p * -150 )
	self:addElement( TraitLabelBackground )
	self.TraitLabelBackground = TraitLabelBackground
	
	local TraitLabel = nil
	
	TraitLabel = LUI.UIText.new()
	TraitLabel.id = "TraitLabel"
	TraitLabel:SetRGBFromInt( 14277081, 0 )
	TraitLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_SELECT_TRAIT" ) ), 0 )
	TraitLabel:SetFontSize( 19 * _1080p )
	TraitLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TraitLabel:SetAlignment( LUI.Alignment.Left )
	TraitLabel:SetOptOutRightToLeftAlignmentFlip( true )
	TraitLabel:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -190, _1080p * -20, _1080p * -171.5, _1080p * -152.5 )
	self:addElement( TraitLabel )
	self.TraitLabel = TraitLabel
	
	local Lock = nil
	
	Lock = LUI.UIImage.new()
	Lock.id = "Lock"
	Lock:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
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
		
		RigPerkImage:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.RigPerkImage:SetScale( 0.05, 50 )
				end
			}
		} )
		TraitLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.TraitLabel:SetRGBFromInt( 0, 0 )
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
			RigPerkImage:AnimateSequence( "ButtonOver" )
			TraitLabel:AnimateSequence( "ButtonOver" )
			Lock:AnimateSequence( "ButtonOver" )
		end
		
		RigPerkImage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.RigPerkImage:SetScale( 0, 200 )
				end
			}
		} )
		TraitLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.TraitLabel:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TraitLabel:SetRGBFromInt( 14277081, 0 )
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
			RigPerkImage:AnimateSequence( "ButtonUp" )
			TraitLabel:AnimateSequence( "ButtonUp" )
			Lock:AnimateSequence( "ButtonUp" )
		end
		
		self._sequences.Pulse = function ()
			
		end
		
		self._sequences.PulseStop = function ()
			
		end
		
		TraitLabel:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.TraitLabel:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.TraitLabel:SetAlpha( 1, 0 )
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
			},
			{
				function ()
					return self.Lock:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -26, 0, _1080p * -88, _1080p * -62, 0 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			TraitLabel:AnimateSequence( "ButtonOverDisabled" )
			Lock:AnimateSequence( "ButtonOverDisabled" )
		end
		
		TraitLabel:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.TraitLabel:SetRGBFromInt( 12566463, 0 )
				end
			},
			{
				function ()
					return self.TraitLabel:SetAlpha( 1, 0 )
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
			TraitLabel:AnimateSequence( "ButtonUpDisabled" )
			Lock:AnimateSequence( "ButtonUpDisabled" )
		end
		
		self._sequences.Activate = function ()
			
		end
		
		RigPerkImage:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.RigPerkImage:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			RigPerkImage:AnimateSequence( "Locked" )
		end
		
		RigPerkImage:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.RigPerkImage:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			RigPerkImage:AnimateSequence( "Unlocked" )
		end
		
		self._sequences.StopActivateAnim = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f36_arg0, f36_arg1 )
		local f36_local0 = f36_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "TraitLabelBackground",
			sequenceName = "ButtonOver",
			elementPath = "TraitLabelBackground"
		} )
	end )
	self:addEventHandler( "button_up", function ( f37_arg0, f37_arg1 )
		local f37_local0 = f37_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "TraitLabelBackground",
			sequenceName = "ButtonUp",
			elementPath = "TraitLabelBackground"
		} )
	end )
	self:addEventHandler( "button_over_disable", function ( f38_arg0, f38_arg1 )
		local f38_local0 = f38_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "TraitLabelBackground",
			sequenceName = "ButtonOver",
			elementPath = "TraitLabelBackground"
		} )
	end )
	self:addEventHandler( "button_disable", function ( f39_arg0, f39_arg1 )
		local f39_local0 = f39_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonUpDisabled" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "TraitLabelBackground",
			sequenceName = "ButtonUp",
			elementPath = "TraitLabelBackground"
		} )
	end )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "RigPerkEditButton", RigPerkEditButton )
LockTable( _M )

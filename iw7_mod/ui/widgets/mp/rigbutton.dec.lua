local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.NewItemNotification )
	if CONDITIONS.UseCACBreadCrumbs() then
		if Rewards.IsTypeNew( f1_arg1, "rig" ) or Rewards.IsTypeNew( f1_arg1, "super" ) or Rewards.IsTypeNew( f1_arg1, "trait" ) then
			f1_arg0.NewItemNotification:SetAlpha( 1, 0 )
		end
	end
	local f1_local0 = CONDITIONS.IsSplitscreen()
	local f1_local1
	if f1_local0 then
		f1_local1 = "ButtonUpSplitscreen"
		if not f1_local1 then
		
		else
			local f1_local2
			if f1_local0 then
				f1_local2 = "ButtonOverSplitscreen"
				if not f1_local2 then
				
				else
					f1_arg0:addEventHandler( "button_up", function ( f2_arg0, f2_arg1 )
						ACTIONS.AnimateSequence( f1_arg0, f1_local1 )
					end )
					f1_arg0:addEventHandler( "button_over", function ( f3_arg0, f3_arg1 )
						ACTIONS.AnimateSequence( f1_arg0, f1_local2 )
					end )
					f1_arg0:addEventHandler( "button_disable", function ( f4_arg0, f4_arg1 )
						ACTIONS.AnimateSequence( f1_arg0, f1_local1 )
					end )
					f1_arg0:addEventHandler( "button_over_disable", function ( f5_arg0, f5_arg1 )
						ACTIONS.AnimateSequence( f1_arg0, f1_local2 )
					end )
					if CONDITIONS.IsDraftEnabled( f1_arg0 ) then
						f1_arg0:addEventHandler( "button_disable", function ( f6_arg0, f6_arg1 )
							ACTIONS.AnimateSequence( f1_arg0, "Disabled" )
						end )
					end
				end
			end
			f1_local2 = "ButtonOver"
		end
	end
	f1_local1 = "ButtonUp"
end

function RigButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 360 * _1080p, 0, 160 * _1080p )
	self.id = "RigButton"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local f7_local3 = nil
	if CONDITIONS.IsDraftEnabled( self ) then
		f7_local3 = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
			controllerIndex = f7_local1
		} )
		f7_local3.id = "GenericItemBackground"
		f7_local3:SetAlpha( 0, 0 )
		f7_local3:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -30 )
		self:addElement( f7_local3 )
		self.GenericItemBackground = f7_local3
	end
	local TitleBackground = nil
	
	TitleBackground = MenuBuilder.BuildRegisteredType( "GenericListArrowButtonBackground", {
		controllerIndex = f7_local1
	} )
	TitleBackground.id = "TitleBackground"
	TitleBackground.DropShadow:SetAlpha( 0, 0 )
	TitleBackground:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -30, 0 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local NameBacker = nil
	
	NameBacker = LUI.UIImage.new()
	NameBacker.id = "NameBacker"
	NameBacker:SetRGBFromInt( 0, 0 )
	NameBacker:SetAlpha( 0.25, 0 )
	NameBacker:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -75, _1080p * -35 )
	self:addElement( NameBacker )
	self.NameBacker = NameBacker
	
	local NameGradient = nil
	
	NameGradient = LUI.UIImage.new()
	NameGradient.id = "NameGradient"
	NameGradient:SetRGBFromInt( 0, 0 )
	NameGradient:SetAlpha( 0.6, 0 )
	NameGradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	NameGradient:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -75, _1080p * -35 )
	self:addElement( NameGradient )
	self.NameGradient = NameGradient
	
	local DarkLine = nil
	
	DarkLine = LUI.UIImage.new()
	DarkLine.id = "DarkLine"
	DarkLine:SetRGBFromInt( 0, 0 )
	DarkLine:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 85, _1080p * 89 )
	self:addElement( DarkLine )
	self.DarkLine = DarkLine
	
	local RigIcon = nil
	
	RigIcon = LUI.UIImage.new()
	RigIcon.id = "RigIcon"
	RigIcon:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 134, _1080p * -169, _1080p * -35 )
	RigIcon:SubscribeToModelThroughElement( self, "rigHeadshot", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.rigHeadshot:GetValue( f7_local1 )
		if f8_local0 ~= nil then
			RigIcon:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	self:addElement( RigIcon )
	self.RigIcon = RigIcon
	
	local RigName = nil
	
	RigName = LUI.UIStyledText.new()
	RigName.id = "RigName"
	RigName:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
	RigName:SetFontSize( 24 * _1080p )
	RigName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RigName:SetAlignment( LUI.Alignment.Right )
	RigName:SetOptOutRightToLeftAlignmentFlip( true )
	RigName:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -209, _1080p * -9, _1080p * -65, _1080p * -41 )
	RigName:SubscribeToModelThroughElement( self, "name", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.name:GetValue( f7_local1 )
		if f9_local0 ~= nil then
			RigName:setText( ToUpperCase( f9_local0 ), 0 )
		end
	end )
	self:addElement( RigName )
	self.RigName = RigName
	
	local FrameLabel = nil
	
	FrameLabel = LUI.UIText.new()
	FrameLabel.id = "FrameLabel"
	FrameLabel:SetRGBFromInt( 14277081, 0 )
	FrameLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_RIG_OPTIONS" ) ), 0 )
	FrameLabel:SetFontSize( 22 * _1080p )
	FrameLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FrameLabel:SetAlignment( LUI.Alignment.Left )
	FrameLabel:SetOptOutRightToLeftAlignmentFlip( true )
	FrameLabel:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 20, _1080p * -14, _1080p * -26, _1080p * -4 )
	self:addElement( FrameLabel )
	self.FrameLabel = FrameLabel
	
	local NewItemNotification = nil
	
	NewItemNotification = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
		controllerIndex = f7_local1
	} )
	NewItemNotification.id = "NewItemNotification"
	NewItemNotification:SetAlpha( 0, 0 )
	NewItemNotification:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 285, _1080p * 349, _1080p * 111, _1080p * 175 )
	self:addElement( NewItemNotification )
	self.NewItemNotification = NewItemNotification
	
	local f7_local12 = nil
	if CONDITIONS.IsDraftEnabled( self ) then
		f7_local12 = LUI.UIImage.new()
		f7_local12.id = "UnlockIcon"
		f7_local12:SetAlpha( 0, 0 )
		f7_local12:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
		f7_local12:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -13, _1080p * 19, _1080p * -38, _1080p * -6 )
		self:addElement( f7_local12 )
		self.UnlockIcon = f7_local12
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RigIcon:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.RigIcon:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 134, _1080p * -169, _1080p * -35, 200 )
				end
			}
		} )
		RigName:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.RigName:SetRGBFromTable( SWATCHES.genericButton.textDefault, 200 )
				end
			}
		} )
		FrameLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.FrameLabel:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			RigIcon:AnimateSequence( "ButtonUp" )
			RigName:AnimateSequence( "ButtonUp" )
			FrameLabel:AnimateSequence( "ButtonUp" )
		end
		
		RigIcon:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.RigIcon:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 141, _1080p * -176, _1080p * -35, 100 )
				end
			}
		} )
		RigName:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.RigName:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.RigName:SetAlpha( 1, 100 )
				end
			}
		} )
		FrameLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			RigIcon:AnimateSequence( "ButtonOver" )
			RigName:AnimateSequence( "ButtonOver" )
			FrameLabel:AnimateSequence( "ButtonOver" )
		end
		
		RigIcon:RegisterAnimationSequence( "ButtonOverSplitscreen", {
			{
				function ()
					return self.RigIcon:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 100, _1080p * -135, _1080p * -35, 100 )
				end
			}
		} )
		RigName:RegisterAnimationSequence( "ButtonOverSplitscreen", {
			{
				function ()
					return self.RigName:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.RigName:SetAlpha( 1, 100 )
				end
			}
		} )
		FrameLabel:RegisterAnimationSequence( "ButtonOverSplitscreen", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonOverSplitscreen = function ()
			RigIcon:AnimateSequence( "ButtonOverSplitscreen" )
			RigName:AnimateSequence( "ButtonOverSplitscreen" )
			FrameLabel:AnimateSequence( "ButtonOverSplitscreen" )
		end
		
		RigIcon:RegisterAnimationSequence( "ButtonUpSplitscreen", {
			{
				function ()
					return self.RigIcon:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 93, _1080p * -128, _1080p * -35, 200 )
				end
			}
		} )
		RigName:RegisterAnimationSequence( "ButtonUpSplitscreen", {
			{
				function ()
					return self.RigName:SetRGBFromTable( SWATCHES.genericButton.textDefault, 200 )
				end
			}
		} )
		FrameLabel:RegisterAnimationSequence( "ButtonUpSplitscreen", {
			{
				function ()
					return self.FrameLabel:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		self._sequences.ButtonUpSplitscreen = function ()
			RigIcon:AnimateSequence( "ButtonUpSplitscreen" )
			RigName:AnimateSequence( "ButtonUpSplitscreen" )
			FrameLabel:AnimateSequence( "ButtonUpSplitscreen" )
		end
		
		RigIcon:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.RigIcon:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 93, _1080p * -128, _1080p * -35, 0 )
				end
			}
		} )
		self._sequences.Splitscreen = function ()
			RigIcon:AnimateSequence( "Splitscreen" )
		end
		
		if CONDITIONS.IsDraftEnabled( self ) then
			f7_local3:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.GenericItemBackground:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		RigIcon:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.RigIcon:SetAlpha( 0.5, 0 )
				end
			}
		} )
		if CONDITIONS.IsDraftEnabled( self ) then
			f7_local12:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.UnlockIcon:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.Disabled = function ()
			if CONDITIONS.IsDraftEnabled( self ) then
				f7_local3:AnimateSequence( "Disabled" )
			end
			RigIcon:AnimateSequence( "Disabled" )
			if CONDITIONS.IsDraftEnabled( self ) then
				f7_local12:AnimateSequence( "Disabled" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f7_local1, controller )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "RigButton", RigButton )
LockTable( _M )

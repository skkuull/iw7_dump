local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.MissionTeamImage )
	f1_arg0.MissionTeamImage:SetMask( f1_arg0.Mask )
	f1_arg0:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.disabled:GetValue( f1_arg1 )
		local f2_local1 = f1_arg0:GetDataSource()
		f2_local1 = f2_local1.teamID:GetValue( f1_arg1 )
		local f2_local2 = MissionDirector.GetActiveMissionTeam( f1_arg1 )
		local f2_local3 = not MissionDirector.HasEverBeenMember( f2_local1, f1_arg1 )
		if not f2_local0 and f2_local1 ~= f2_local2 then
			if f2_local3 then
				Engine.SetDvarBool( "lui_mc_firstTimeInCurrentMissionTeam", true )
			else
				Engine.SetDvarBool( "lui_mc_rejoinedCurrentMissionTeam", true )
			end
			MissionDirector.SetActiveMissionTeam( f1_arg1, f2_local1 )
		end
		local f2_local4 = LUI.FlowManager.GetCurrentMenu( f1_arg0 )
		f2_local4:LeaveMenu( f2_local3 )
	end )
	f1_arg0:addEventHandler( "button_over", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f1_arg0:GetDataSource()
		f3_local0 = f3_local0.image:GetValue( f1_arg1 )
		if f3_local0 ~= nil then
			f1_arg0.MissionTeamImage:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	f1_arg0:addEventHandler( "button_up", function ( f4_arg0, f4_arg1 )
		local f4_local0 = tostring
		local f4_local1 = f1_arg0:GetDataSource()
		f4_local0 = f4_local0( f4_local1.image:GetValue( f1_arg1 ) ) .. "_off"
		if f4_local0 ~= nil then
			f1_arg0.MissionTeamImage:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
end

function MissionTeamSelectButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 285 * _1080p, 0, 96 * _1080p )
	self.id = "MissionTeamSelectButton"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	self:SubscribeToModelThroughElement( self, "disabled", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.disabled:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			self:SetButtonDisabled( f6_local0 )
		end
	end )
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	Border:SetRGBFromInt( 0, 0 )
	Border:SetAlpha( 0.1, 0 )
	Border:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 480, 0, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local BG = nil
	
	BG = LUI.UIImage.new()
	BG.id = "BG"
	BG:SetRGBFromInt( 1710618, 0 )
	BG:SetAlpha( 0.5, 0 )
	BG:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( BG )
	self.BG = BG
	
	local MissionTeamImage = nil
	
	MissionTeamImage = LUI.UIImage.new()
	MissionTeamImage.id = "MissionTeamImage"
	MissionTeamImage:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -100, _1080p * -19.5, _1080p * 69.5 )
	MissionTeamImage:SubscribeToModelThroughElement( self, "imageGrayscale", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.imageGrayscale:GetValue( f5_local1 )
		if f7_local0 ~= nil then
			MissionTeamImage:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	self:addElement( MissionTeamImage )
	self.MissionTeamImage = MissionTeamImage
	
	local Mask = nil
	
	Mask = LUI.UIImage.new()
	Mask.id = "Mask"
	Mask:setImage( RegisterMaterial( "wdg_large_mask" ), 0 )
	Mask:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( Mask )
	self.Mask = Mask
	
	local Gradient = nil
	
	Gradient = LUI.UIImage.new()
	Gradient.id = "Gradient"
	Gradient:SetRGBFromInt( 0, 0 )
	Gradient:SetAlpha( 0.4, 0 )
	Gradient:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	Gradient:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -40, 0 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f5_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local f5_local9 = nil
	if Engine.InFrontend() then
		f5_local9 = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
			controllerIndex = f5_local1
		} )
		f5_local9.id = "TitleBackground"
		f5_local9.DropShadow:SetAlpha( 0, 0 )
		f5_local9:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
		self:addElement( f5_local9 )
		self.TitleBackground = f5_local9
	end
	local FrameLabel = nil
	
	FrameLabel = LUI.UIText.new()
	FrameLabel.id = "FrameLabel"
	FrameLabel:SetRGBFromInt( 14277081, 0 )
	FrameLabel:SetFontSize( 19 * _1080p )
	FrameLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FrameLabel:SetAlignment( LUI.Alignment.Right )
	FrameLabel:SetOptOutRightToLeftAlignmentFlip( true )
	FrameLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -20, _1080p * 2.5, _1080p * 21.5 )
	FrameLabel:SubscribeToModelThroughElement( self, "name", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.name:GetValue( f5_local1 )
		if f8_local0 ~= nil then
			FrameLabel:setText( ToUpperCase( f8_local0 ), 0 )
		end
	end )
	self:addElement( FrameLabel )
	self.FrameLabel = FrameLabel
	
	local UnlockCriteria = nil
	
	UnlockCriteria = MenuBuilder.BuildRegisteredType( "UnlockCriteria", {
		controllerIndex = f5_local1
	} )
	UnlockCriteria.id = "UnlockCriteria"
	UnlockCriteria:SetAlpha( 0, 0 )
	UnlockCriteria:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 224, _1080p * 567, _1080p * 40, _1080p * 72 )
	UnlockCriteria:SubscribeToModelThroughElement( self, "missionTeamUnlockDesc", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.missionTeamUnlockDesc:GetValue( f5_local1 )
		if f9_local0 ~= nil then
			UnlockCriteria.UnlockDesc:setText( f9_local0, 0 )
		end
	end )
	self:addElement( UnlockCriteria )
	self.UnlockCriteria = UnlockCriteria
	
	local UnlockIcon = nil
	
	UnlockIcon = LUI.UIImage.new()
	UnlockIcon.id = "UnlockIcon"
	UnlockIcon:SetAlpha( 0, 0 )
	UnlockIcon:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	UnlockIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 224, _1080p * 256, _1080p * -8, _1080p * 24 )
	self:addElement( UnlockIcon )
	self.UnlockIcon = UnlockIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BG:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.BG:SetAlpha( 0.7, 100 )
				end
			},
			{
				function ()
					return self.BG:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * 195, _1080p * 24, 0, 100 )
				end
			}
		} )
		MissionTeamImage:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.MissionTeamImage:SetScale( 0.05, 100 )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Gradient:SetAnchorsAndPosition( 0, 0, 1, 0, 0, _1080p * 195, _1080p * -40, 0, 100 )
				end
			}
		} )
		if Engine.InFrontend() then
			f5_local9:RegisterAnimationSequence( "ButtonOver", {
				{
					function ()
						return self.TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * 195, 0, _1080p * 24, 100 )
					end
				}
			} )
		end
		FrameLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 0, 100 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 215, _1080p * 175, _1080p * 2.5, _1080p * 21.5, 100 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			BG:AnimateSequence( "ButtonOver" )
			MissionTeamImage:AnimateSequence( "ButtonOver" )
			Gradient:AnimateSequence( "ButtonOver" )
			if Engine.InFrontend() then
				f5_local9:AnimateSequence( "ButtonOver" )
			end
			FrameLabel:AnimateSequence( "ButtonOver" )
		end
		
		BG:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.BG:SetAlpha( 0.5, 200 )
				end
			},
			{
				function ()
					return self.BG:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0, 200 )
				end
			}
		} )
		MissionTeamImage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.MissionTeamImage:SetScale( 0, 200 )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Gradient:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -40, 0, 200 )
				end
			}
		} )
		if Engine.InFrontend() then
			f5_local9:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24, 200 )
					end
				}
			} )
		end
		FrameLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 14277081, 200 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -20, _1080p * 2.5, _1080p * 21.5, 200 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			BG:AnimateSequence( "ButtonUp" )
			MissionTeamImage:AnimateSequence( "ButtonUp" )
			Gradient:AnimateSequence( "ButtonUp" )
			if Engine.InFrontend() then
				f5_local9:AnimateSequence( "ButtonUp" )
			end
			FrameLabel:AnimateSequence( "ButtonUp" )
		end
		
		MissionTeamImage:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.MissionTeamImage:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.MissionTeamImage:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			MissionTeamImage:AnimateSequence( "Locked" )
		end
		
		MissionTeamImage:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.MissionTeamImage:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			MissionTeamImage:AnimateSequence( "Unlocked" )
		end
		
		BG:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.BG:SetAlpha( 0.7, 100 )
				end
			}
		} )
		MissionTeamImage:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.MissionTeamImage:SetAlpha( 0.5, 0 )
				end
			}
		} )
		UnlockCriteria:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 90 )
				end,
				function ()
					return self.UnlockCriteria:SetAlpha( 1, 10 )
				end
			}
		} )
		UnlockIcon:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.UnlockIcon:SetAlpha( 1, 90 )
				end,
				function ()
					return self.UnlockIcon:SetAlpha( 0, 10 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			BG:AnimateSequence( "ButtonOverDisabled" )
			MissionTeamImage:AnimateSequence( "ButtonOverDisabled" )
			UnlockCriteria:AnimateSequence( "ButtonOverDisabled" )
			UnlockIcon:AnimateSequence( "ButtonOverDisabled" )
		end
		
		BG:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.BG:SetAlpha( 0.5, 200 )
				end
			}
		} )
		MissionTeamImage:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.MissionTeamImage:SetAlpha( 0.5, 0 )
				end
			}
		} )
		UnlockCriteria:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 0 )
				end,
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 10 )
				end
			}
		} )
		UnlockIcon:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.UnlockIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			BG:AnimateSequence( "ButtonUpDisabled" )
			MissionTeamImage:AnimateSequence( "ButtonUpDisabled" )
			UnlockCriteria:AnimateSequence( "ButtonUpDisabled" )
			UnlockIcon:AnimateSequence( "ButtonUpDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f47_arg0, f47_arg1 )
		local f47_local0 = f47_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f48_arg0, f48_arg1 )
		local f48_local0 = f48_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_over_disable", function ( f49_arg0, f49_arg1 )
		local f49_local0 = f49_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_disable", function ( f50_arg0, f50_arg1 )
		local f50_local0 = f50_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonUpDisabled" )
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	f0_local0( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "MissionTeamSelectButton", MissionTeamSelectButton )
LockTable( _M )

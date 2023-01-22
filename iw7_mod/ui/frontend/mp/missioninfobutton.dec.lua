local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.missionInfoButton"
f0_local1 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.TabA )
	assert( f1_arg0.TabB )
	local f1_local0 = f1_arg1:GetCountValue( f1_arg2 )
	if f1_local0 == 1 then
		ACTIONS.AnimateSequence( f1_arg0.TabA, "Locked" )
		ACTIONS.AnimateSequence( f1_arg0.TabB, "Locked" )
	elseif f1_local0 == 2 then
		ACTIONS.AnimateSequence( f1_arg0.TabA, "Unlocked" )
		ACTIONS.AnimateSequence( f1_arg0.TabB, "Locked" )
	elseif f1_local0 == 3 then
		ACTIONS.AnimateSequence( f1_arg0.TabA, "Unlocked" )
		ACTIONS.AnimateSequence( f1_arg0.TabB, "Unlocked" )
	end
end

f0_local2 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	assert( f2_arg0.MissionArrowButton )
	local f2_local0 = f2_arg0.MissionArrowButton
	local f2_local1 = f2_arg2
	local f2_local2 = f2_arg1:GetCountValue( f2_arg3 )
	if f2_local2 > 1 then
		if f2_local1 == 1 then
			f2_local0.ArrowLeft:SetAlpha( 0 )
			f2_local0.ArrowRight:SetAlpha( 1 )
		elseif f2_local1 == 2 and f2_local2 == 2 then
			f2_local0.ArrowLeft:SetAlpha( 1 )
			f2_local0.ArrowRight:SetAlpha( 0 )
		elseif f2_local1 == 2 and f2_local2 == 3 then
			f2_local0.ArrowLeft:SetAlpha( 1 )
			f2_local0.ArrowRight:SetAlpha( 1 )
		elseif f2_local1 == 3 then
			f2_local0.ArrowLeft:SetAlpha( 1 )
			f2_local0.ArrowRight:SetAlpha( 0 )
		end
	else
		f2_local0.ArrowLeft:SetAlpha( 0 )
		f2_local0.ArrowRight:SetAlpha( 0 )
	end
	ACTIONS.AnimateSequence( f2_arg0, "Slot" .. f2_arg2 )
end

local f0_local3 = function ( f3_arg0, f3_arg1, f3_arg2 )
	return function ( f4_arg0, f4_arg1 )
		MissionDirector.SetActiveMissionSlot( f4_arg1, f3_arg1, f4_arg0 - 1 )
		f0_local2( f3_arg0, f3_arg2, f4_arg0, f4_arg1 )
	end
	
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	return function ( f6_arg0 )
		assert( f6_arg0.Text )
		assert( f6_arg0.TextCompletion )
		assert( f6_arg0.MissionsHonours )
		local f6_local0 = f5_arg0:GetDataSourceAtIndex( f6_arg0.currentValue - 1, f5_arg1 )
		if f6_arg0.currentInfoButtonSubscription then
			f6_arg0.Text:UnsubscribeFromModel( f6_arg0.currentInfoButtonSubscription )
		end
		f6_arg0.currentInfoButtonSubscription = f6_arg0.Text:SubscribeToModel( f6_local0.name:GetModel( f5_arg1 ), function ()
			local f7_local0 = f6_local0.name:GetValue( f5_arg1 )
			if f7_local0 ~= f6_arg0.Text:getText() then
				f6_arg0.Text:setText( f7_local0, 0 )
			end
			local f7_local1 = ToUpperCase( tostring( f6_local0.target:GetValue( f5_arg1 ) ) )
			if f7_local1 ~= f6_arg0.TextCompletion:getText() then
				f6_arg0.TextCompletion:setText( f7_local1, 0 )
			end
			f6_arg0.MissionsHonours:UpdateHonors( tostring( f6_local0.bonus1:GetValue( f5_arg1 ) ), tostring( f6_local0.bonus2:GetValue( f5_arg1 ) ), tostring( f6_local0.bonus3:GetValue( f5_arg1 ) ) )
		end )
	end
	
end

function PostLoadFunc( f8_arg0, f8_arg1, f8_arg2 )
	assert( f8_arg0.MissionArrowButton )
	local f8_local0 = false
	local f8_local1 = f8_arg0:SubscribeToDataSourceThroughElement( f8_arg0, "teamID", function ()
		local f9_local0 = f8_arg0:GetDataSource()
		f9_local0 = f9_local0.teamID:GetValue( f8_arg1 )
		local f9_local1 = MissionDirector.GetMissionDataSourcesForTeam( f0_local0, f9_local0, f8_arg1 )
		local f9_local2 = MissionDirector.GetActiveMission( f8_arg1, f9_local0 )
		local f9_local3 = 0
		for f9_local4 = 0, f9_local1:GetCountValue( f8_arg1 ) - 1, 1 do
			local f9_local7 = f9_local1:GetDataSourceAtIndex( f9_local4, f8_arg1 )
			if f9_local2 == f9_local7.index:GetValue( f8_arg1 ) then
				f9_local3 = f9_local4
			end
		end
		LUI.AddUICustomArrowButtonLogic( f8_arg0.MissionArrowButton, f8_arg1, {
			action = f0_local3( f8_arg0, f9_local0, f9_local1 ),
			defaultValue = f9_local3 + 1,
			min = 1,
			max = f9_local1:GetCountValue( f8_arg1 ),
			UpdateContent = f0_local4( f9_local1, f8_arg1 )
		} )
		if not f8_arg0.MissionArrowButton.bindButton then
			local self = LUI.UIBindButton.new()
			self.id = "selfBindButton"
			f8_arg0.MissionArrowButton:addElement( self )
			f8_arg0.MissionArrowButton.bindButton = self
		end
		f0_local2( f8_arg0, f9_local1, f9_local3 + 1 )
		f0_local1( f8_arg0, f9_local1, f8_arg1 )
	end )
	f8_local1.unlinkOnCallback = true
	f8_arg0.modelPath = f0_local0
	f8_arg0:addEventHandler( "lose_focus", function ( f10_arg0, f10_arg1 )
		ACTIONS.AnimateSequence( f8_arg0, "ButtonOver" )
	end )
	f8_arg0:addEventHandler( "gain_focus", function ( f11_arg0, f11_arg1 )
		ACTIONS.AnimateSequence( f8_arg0, "ButtonUp" )
	end )
end

function MissionInfoButton( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 120 * _1080p )
	self.id = "MissionInfoButton"
	self._animationSets = {}
	self._sequences = {}
	local f12_local1 = controller and controller.controllerIndex
	if not f12_local1 and not Engine.InFrontend() then
		f12_local1 = self:getRootController()
	end
	assert( f12_local1 )
	local f12_local2 = self
	local TabA = nil
	
	TabA = MenuBuilder.BuildRegisteredType( "MissionInfoMiniTab", {
		controllerIndex = f12_local1
	} )
	TabA.id = "TabA"
	TabA.NumText:setText( "2", 0 )
	TabA:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 440, _1080p * 470, _1080p * 30, 0 )
	self:addElement( TabA )
	self.TabA = TabA
	
	local TabB = nil
	
	TabB = MenuBuilder.BuildRegisteredType( "MissionInfoMiniTab", {
		controllerIndex = f12_local1
	} )
	TabB.id = "TabB"
	TabB.NumText:setText( "3", 0 )
	TabB:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 470, _1080p * 500, _1080p * 30, 0 )
	self:addElement( TabB )
	self.TabB = TabB
	
	local MissionArrowButton = nil
	
	MissionArrowButton = MenuBuilder.BuildRegisteredType( "MissionArrowButton", {
		controllerIndex = f12_local1
	} )
	MissionArrowButton.id = "MissionArrowButton"
	MissionArrowButton.Text:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	MissionArrowButton.NumText:setText( "1", 0 )
	MissionArrowButton:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -60, _1080p * 30, 0 )
	self:addElement( MissionArrowButton )
	self.MissionArrowButton = MissionArrowButton
	
	local HeaderBackground = nil
	
	HeaderBackground = LUI.UIBlur.new()
	HeaderBackground.id = "HeaderBackground"
	HeaderBackground:SetRGBFromInt( 4210752, 0 )
	HeaderBackground:SetBlurStrength( 2.5, 0 )
	HeaderBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30 )
	self:addElement( HeaderBackground )
	self.HeaderBackground = HeaderBackground
	
	local HeaderText = nil
	
	HeaderText = LUI.UIStyledText.new()
	HeaderText.id = "HeaderText"
	HeaderText:SetRGBFromTable( SWATCHES.MissionSelectButton.titleText, 0 )
	HeaderText:SetAlpha( 0.5, 0 )
	HeaderText:setText( Engine.Localize( "LUA_MENU_PUBLIC_MATCH_CAPS" ), 0 )
	HeaderText:SetFontSize( 18 * _1080p )
	HeaderText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	HeaderText:SetAlignment( LUI.Alignment.Left )
	HeaderText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 23, _1080p * -4, _1080p * 5, _1080p * 23 )
	self:addElement( HeaderText )
	self.HeaderText = HeaderText
	
	local HeaderStub = nil
	
	HeaderStub = LUI.UIImage.new()
	HeaderStub.id = "HeaderStub"
	HeaderStub:SetRGBFromInt( 10921638, 0 )
	HeaderStub:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 9, _1080p * 13, _1080p * 12, _1080p * 16 )
	self:addElement( HeaderStub )
	self.HeaderStub = HeaderStub
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TabA:RegisterAnimationSequence( "Slot1", {
			{
				function ()
					return self.TabA.NumText:setText( "2", 0 )
				end
			},
			{
				function ()
					return self.TabA.Gradient:SetZRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.TabA:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.TabA:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 440, _1080p * 470, _1080p * 30, 0, 0 )
				end
			}
		} )
		TabB:RegisterAnimationSequence( "Slot1", {
			{
				function ()
					return self.TabB.NumText:setText( "3", 0 )
				end
			},
			{
				function ()
					return self.TabB.Gradient:SetZRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.TabB:SetAlpha( 0.4, 50 )
				end
			},
			{
				function ()
					return self.TabB:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 470, _1080p * 500, _1080p * 30, 0, 0 )
				end
			}
		} )
		MissionArrowButton:RegisterAnimationSequence( "Slot1", {
			{
				function ()
					return self.MissionArrowButton.NumText:setText( "1", 0 )
				end
			},
			{
				function ()
					return self.MissionArrowButton:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -60, _1080p * 30, 0, 50 )
				end
			}
		} )
		self._sequences.Slot1 = function ()
			TabA:AnimateSequence( "Slot1" )
			TabB:AnimateSequence( "Slot1" )
			MissionArrowButton:AnimateSequence( "Slot1" )
		end
		
		TabA:RegisterAnimationSequence( "Slot2", {
			{
				function ()
					return self.TabA.NumText:setText( "1", 0 )
				end
			},
			{
				function ()
					return self.TabA.Gradient:SetZRotation( 180, 0 )
				end
			},
			{
				function ()
					return self.TabA:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.TabA:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 30, _1080p * 30, 0, 0 )
				end
			}
		} )
		TabB:RegisterAnimationSequence( "Slot2", {
			{
				function ()
					return self.TabB.NumText:setText( "3", 0 )
				end
			},
			{
				function ()
					return self.TabB.Gradient:SetZRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.TabB:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.TabB:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 470, _1080p * 500, _1080p * 30, 0, 0 )
				end
			}
		} )
		MissionArrowButton:RegisterAnimationSequence( "Slot2", {
			{
				function ()
					return self.MissionArrowButton.NumText:setText( "2", 0 )
				end
			},
			{
				function ()
					return self.MissionArrowButton:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 30, _1080p * -30, _1080p * 30, 0, 50 )
				end
			}
		} )
		self._sequences.Slot2 = function ()
			TabA:AnimateSequence( "Slot2" )
			TabB:AnimateSequence( "Slot2" )
			MissionArrowButton:AnimateSequence( "Slot2" )
		end
		
		TabA:RegisterAnimationSequence( "Slot3", {
			{
				function ()
					return self.TabA.NumText:setText( "1", 0 )
				end
			},
			{
				function ()
					return self.TabA.Gradient:SetZRotation( 180, 0 )
				end
			},
			{
				function ()
					return self.TabA:SetAlpha( 0.4, 50 )
				end
			},
			{
				function ()
					return self.TabA:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 30, _1080p * 30, 0, 0 )
				end
			}
		} )
		TabB:RegisterAnimationSequence( "Slot3", {
			{
				function ()
					return self.TabB.NumText:setText( "2", 0 )
				end
			},
			{
				function ()
					return self.TabB.Gradient:SetZRotation( 180, 0 )
				end
			},
			{
				function ()
					return self.TabB:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.TabB:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 30, _1080p * 60, _1080p * 30, 0, 0 )
				end
			}
		} )
		MissionArrowButton:RegisterAnimationSequence( "Slot3", {
			{
				function ()
					return self.MissionArrowButton.NumText:setText( "3", 0 )
				end
			},
			{
				function ()
					return self.MissionArrowButton:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 60, 0, _1080p * 30, 0, 0 )
				end,
				function ()
					return self.MissionArrowButton:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 60, 0, _1080p * 30, 0, 50 )
				end
			}
		} )
		self._sequences.Slot3 = function ()
			TabA:AnimateSequence( "Slot3" )
			TabB:AnimateSequence( "Slot3" )
			MissionArrowButton:AnimateSequence( "Slot3" )
		end
		
		HeaderText:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.HeaderText:SetAlpha( 0.5, 100 )
				end
			},
			{
				function ()
					return self.HeaderText:SetRGBFromTable( SWATCHES.MissionSelectButton.titleText, 100 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			HeaderText:AnimateSequence( "ButtonOver" )
		end
		
		HeaderText:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.HeaderText:SetRGBFromTable( SWATCHES.MissionSelectButton.highlight, 100 )
				end
			},
			{
				function ()
					return self.HeaderText:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			HeaderText:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f12_local1, controller )
	return self
end

MenuBuilder.registerType( "MissionInfoButton", MissionInfoButton )
LockTable( _M )

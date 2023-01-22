local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Button )
	f1_arg0.Button.actionSFX = "ui_select_screen_return"
	f1_arg0.Button:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.ref
		local f2_local1 = MatchRules.GetData( "gametype" )
		if f2_local0 == f2_local1 then
			local f2_local2 = f1_arg0:GetDataSource()
			if f2_local2.isMLGMode ~= MLG.AreMLGRulesEnabled() then
			
			else
				LUI.FlowManager.RequestLeaveMenu( f1_arg0, true, true )
			end
		end
		if f2_local1 then
			FixTeamLimitsAndDifficultiesIfNecessary( f2_local1, f2_local0 )
		end
		MatchRules.SetData( "gametype", f2_local0 )
		if not Engine.IsDevelopmentBuild() or Engine.GetDvarBool( "load_recipes" ) then
			MatchRules.LoadMatchRulesDataDefault()
		end
		local f2_local2 = IsLocalPlay()
		local f2_local3 = IsSystemLink()
		local f2_local4 = IsPrivateMatch()
		if f2_local2 then
			Engine.ExecNow( MPConfig.default_splitscreen, f2_arg1.controller )
		end
		if f2_local3 then
			Engine.ExecNow( MPConfig.default_systemlink, f2_arg1.controller )
		end
		local f2_local5 = f1_arg0:GetDataSource()
		if f2_local5.isMLGMode then
			if MatchRules.HasMLGRecipeAvailable() then
				MatchRules.LoadMLGRecipe()
			end
			MLG.SetUsingMLGRules( true )
			MatchRules.SetData( "cwlRulesEnabled", true )
			ClearAllBots()
		else
			LoadoutDrafting.SetEnabled( false )
			MLG.SetUsingMLGRules( false )
			MatchRules.LoadMatchRulesDataDefault()
		end
		if f2_local4 then
			Engine.ExecNow( MPConfig.default_xboxlive, f2_arg1.controller )
			f2_local5 = Engine.GetDvarInt( "party_maxPrivatePartyPlayers" )
			if f2_local5 ~= Engine.GetDvarInt( "party_maxplayers" ) then
				Engine.SetDvarInt( "party_maxplayers", f2_local5 )
				Engine.Exec( "xtogprivateslots; xtogprivateslots; xsessionupdate;" )
			end
		end
		Engine.ExecNow( "xupdatepartystate" )
	end )
	f1_arg0:registerEventHandler( "grid_anim", function ( element, event )
		element:SetAlpha( event.value )
	end )
end

function ModeButton( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "ModeButton"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Button = nil
	
	Button = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f4_local1
	} )
	Button.id = "Button"
	Button:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 500, 0, 0 )
	Button:SubscribeToModelThroughElement( self, "name", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.name:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			Button.Text:setText( ToUpperCase( LocalizeString( f5_local0 ) ), 0 )
		end
	end )
	self:addElement( Button )
	self.Button = Button
	
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "ModeButton", ModeButton )
LockTable( _M )

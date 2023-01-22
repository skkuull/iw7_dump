SURVEY = SURVEY or {}
SURVEY.PostGameSurveyYesButtonPressed = function ( f1_arg0, f1_arg1, f1_arg2 )
	Engine.PostMatchSurveyResponded( f1_arg0, f1_arg1, 0, f1_arg2 )
end

SURVEY.PostGameSurveyNoButtonPressed = function ( f2_arg0, f2_arg1, f2_arg2 )
	Engine.PostMatchSurveyResponded( f2_arg0, f2_arg1, 1, f2_arg2 )
end

SURVEY.PostGameSurveySkipButtonPressed = function ( f3_arg0, f3_arg1, f3_arg2 )
	Engine.PostMatchSurveyResponded( f3_arg0, f3_arg1, 2, f3_arg2 )
end

SURVEY.PostGameSurveyBackButtonPressed = function ( f4_arg0, f4_arg1, f4_arg2 )
	Engine.PostMatchSurveyResponded( f4_arg0, f4_arg1, 3, f4_arg2 )
end

SURVEY.OpenPostGameSurveyIfRequired = function ( f5_arg0, f5_arg1 )
	if not IsPublicMatch() then
		return false
	elseif Engine.ShouldShowPostMatchSurvey() == true then
		Engine.SetDvarBool( "should_show_post_game_survey", false )
		local f5_local0 = math.random( 0, 5 )
		local f5_local1 = {}
		if f5_local0 == 0 then
			f5_local1.label1 = Engine.Localize( "LUA_MENU_SURVEY_POST_MATCH_SKIP" )
			f5_local1.action1 = SURVEY.PostGameSurveySkipButtonPressed
			f5_local1.label2 = Engine.Localize( "LUA_MENU_YES" )
			f5_local1.action2 = SURVEY.PostGameSurveyYesButtonPressed
			f5_local1.label3 = Engine.Localize( "LUA_MENU_NO" )
			f5_local1.action3 = SURVEY.PostGameSurveyNoButtonPressed
		elseif f5_local0 == 1 then
			f5_local1.label1 = Engine.Localize( "LUA_MENU_SURVEY_POST_MATCH_SKIP" )
			f5_local1.action1 = SURVEY.PostGameSurveySkipButtonPressed
			f5_local1.label2 = Engine.Localize( "LUA_MENU_NO" )
			f5_local1.action2 = SURVEY.PostGameSurveyNoButtonPressed
			f5_local1.label3 = Engine.Localize( "LUA_MENU_YES" )
			f5_local1.action3 = SURVEY.PostGameSurveyYesButtonPressed
		elseif f5_local0 == 2 then
			f5_local1.label1 = Engine.Localize( "LUA_MENU_YES" )
			f5_local1.action1 = SURVEY.PostGameSurveyYesButtonPressed
			f5_local1.label2 = Engine.Localize( "LUA_MENU_NO" )
			f5_local1.action2 = SURVEY.PostGameSurveyNoButtonPressed
			f5_local1.label3 = Engine.Localize( "LUA_MENU_SURVEY_POST_MATCH_SKIP" )
			f5_local1.action3 = SURVEY.PostGameSurveySkipButtonPressed
		elseif f5_local0 == 3 then
			f5_local1.label1 = Engine.Localize( "LUA_MENU_YES" )
			f5_local1.action1 = SURVEY.PostGameSurveyYesButtonPressed
			f5_local1.label2 = Engine.Localize( "LUA_MENU_SURVEY_POST_MATCH_SKIP" )
			f5_local1.action2 = SURVEY.PostGameSurveySkipButtonPressed
			f5_local1.label3 = Engine.Localize( "LUA_MENU_NO" )
			f5_local1.action3 = SURVEY.PostGameSurveyNoButtonPressed
		elseif f5_local0 == 4 then
			f5_local1.label1 = Engine.Localize( "LUA_MENU_NO" )
			f5_local1.action1 = SURVEY.PostGameSurveyNoButtonPressed
			f5_local1.label2 = Engine.Localize( "LUA_MENU_YES" )
			f5_local1.action2 = SURVEY.PostGameSurveyYesButtonPressed
			f5_local1.label3 = Engine.Localize( "LUA_MENU_SURVEY_POST_MATCH_SKIP" )
			f5_local1.action3 = SURVEY.PostGameSurveySkipButtonPressed
		elseif f5_local0 == 5 then
			f5_local1.label1 = Engine.Localize( "LUA_MENU_NO" )
			f5_local1.action1 = SURVEY.PostGameSurveyNoButtonPressed
			f5_local1.label2 = Engine.Localize( "LUA_MENU_SURVEY_POST_MATCH_SKIP" )
			f5_local1.action2 = SURVEY.PostGameSurveySkipButtonPressed
			f5_local1.label3 = Engine.Localize( "LUA_MENU_YES" )
			f5_local1.action3 = SURVEY.PostGameSurveyYesButtonPressed
		end
		f5_local1.buttonOrder = f5_local0
		f5_local1.isQuitter = f5_arg1
		LUI.FlowManager.RequestPopupMenu( unused, "PostMatchSurveyPopup", false, f5_arg0, false, f5_local1 )
	end
end


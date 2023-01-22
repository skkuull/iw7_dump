Onboarding = {
	tutorials = {
		RIG_SELECT = 0,
		QUARTERMASTER = 1
	},
	RigTutorial = {},
	RigTutorial = function ( f1_arg0, f1_arg1 )
		if Engine.IsDevelopmentBuild() then
			local f1_local0 = Engine.GetDvarInt( "dev_onboarding_mode" )
			if f1_local0 == nil or f1_local0 == 0 then
				return true
			elseif f1_local0 == 2 then
				return false
			end
		end
		return Engine.IsTutorialCompleted( f1_arg1, Onboarding.tutorials.RIG_SELECT )
	end,
	RigTutorial = function ( f2_arg0, f2_arg1 )
		Engine.CompleteTutorial( f2_arg1, Onboarding.tutorials.RIG_SELECT )
		ACTIONS.UploadStats( f2_arg0, f2_arg1 )
	end,
	RigTutorial = {
		{
			name = "RIG_SELECT",
			whitelist = {
				{
					menu = "Missions",
					buttons = {
						"CAC"
					}
				},
				{
					menu = "LoadoutSelect",
					buttons = {
						"RigButton"
					}
				},
				{
					menu = "RigSelect",
					buttons = {
						"RigSelect"
					}
				}
			}
		},
		{
			name = "RIG_VIDEO"
		},
		{
			name = "LOADOUT_HINT"
		}
	},
	Quartermaster = {},
	Quartermaster = function ( f3_arg0, f3_arg1 )
		return Engine.IsTutorialCompleted( f3_arg1, Onboarding.tutorials.QUARTERMASTER )
	end,
	Quartermaster = function ( f4_arg0, f4_arg1 )
		Engine.CompleteTutorial( f4_arg1, Onboarding.tutorials.QUARTERMASTER )
		ACTIONS.UploadStats( f4_arg0, f4_arg1 )
	end,
	Quartermaster = {
		{
			name = "INTRO",
			whitelist = {
				{
					menu = "Armory",
					buttons = {}
				}
			}
		}
	},
	BeginFlow = function ( f5_arg0, f5_arg1, f5_arg2 )
		if f5_arg0._activeFlow then
			return false
		else
			assert( f5_arg2 )
			if f5_arg1:WasCompleted( f5_arg2 ) then
				return false
			else
				assert( #f5_arg1.stages > 0 )
				f5_arg0._activeFlow = f5_arg1
				f5_arg0._currentStage = 1
				f5_arg0._controllerIndex = f5_arg2
				return true
			end
		end
	end,
	IsFlowInProgress = function ( f6_arg0, f6_arg1 )
		return f6_arg1 == f6_arg0._activeFlow
	end,
	AdvanceFlow = function ( f7_arg0, f7_arg1, f7_arg2 )
		if f7_arg0._activeFlow ~= f7_arg1 then
			return false
		end
		local f7_local0 = false
		for f7_local4, f7_local5 in ipairs( f7_arg0._activeFlow.stages ) do
			if f7_local5.name == f7_arg2 and f7_local4 == f7_arg0._currentStage then
				f7_arg0._currentStage = f7_arg0._currentStage + 1
				DebugPrint( "Onboarding completed stage: " .. f7_arg2 )
				f7_local0 = true
				break
			end
		end
		if #f7_arg0._activeFlow.stages < f7_arg0._currentStage then
			f7_arg0:CompleteFlow()
		end
		return f7_local0
	end,
	ResetFlow = function ( f8_arg0, f8_arg1 )
		if f8_arg0._activeFlow and f8_arg0._activeFlow == f8_arg1 then
			f8_arg0._activeFlow = nil
			f8_arg0._currentStage = nil
			f8_arg0._controllerIndex = nil
		end
	end,
	CompleteFlow = function ( f9_arg0 )
		if f9_arg0._activeFlow then
			f9_arg0._activeFlow:MarkCompleted( f9_arg0._controllerIndex )
			f9_arg0._activeFlow = nil
			f9_arg0._currentStage = nil
			f9_arg0._controllerIndex = nil
		end
	end,
	ApplyWhitelist = function ( f10_arg0, f10_arg1, f10_arg2 )
		if not f10_arg0._activeFlow then
			return 
		end
		local f10_local0 = f10_arg0._activeFlow.stages[f10_arg0._currentStage]
		assert( f10_local0 )
		local f10_local1 = nil
		if f10_local0.whitelist then
			for f10_local5, f10_local6 in ipairs( f10_local0.whitelist ) do
				if f10_local6.menu == f10_arg1 then
					f10_local1 = f10_local6.buttons
					break
				end
			end
		end
		if not f10_local1 then
			return 
		end
		local f10_local2 = f10_arg2:getFirstChild()
		while f10_local2 do
			if f10_local2.SetButtonDisabled then
				if not LUI.IsItemInArray( f10_local1, f10_local2.id ) then
					f10_local2:SetButtonDisabled( true )
				end
			else
				Onboarding:ApplyWhitelist( f10_arg1, f10_local2 )
			end
			f10_local2 = f10_local2:getNextSibling()
		end
	end
}

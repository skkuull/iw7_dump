local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.TargetingReticles = LUI.Class( LUI.UIElement )
LUI.TargetingReticles.init = function ( f1_arg0, f1_arg1 )
	assert( type( f1_arg1 ) == "table" )
	assert( type( f1_arg1.widgetType ) == "string" )
	assert( type( f1_arg1.entityDataSources ) == "table" )
	LUI.TargetingReticles.super.init( f1_arg0 )
	f1_arg0.id = "TargetingReticles_" .. f1_arg1.widgetType
	f1_arg0.reticles = {}
	if f1_arg1.stateDataSources then
		assert( #f1_arg1.stateDataSources == #f1_arg1.entityDataSources )
	end
	local f1_local0 = #f1_arg1.entityDataSources
	local f1_local1 = f1_arg1.anchoringOptions or {}
	local f1_local2 = f1_arg0:getRootController()
	for f1_local3 = 1, f1_local0, 1 do
		local f1_local6 = f1_local3
		local f1_local7 = {
			entity = f1_arg1.entityDataSources[f1_local6]
		}
		local f1_local8 = f1_arg1.stateDataSources
		if f1_local8 then
			f1_local8 = f1_arg1.stateDataSources[f1_local6]
		end
		f1_local7.lockState = f1_local8
		assert( f1_local7.entity )
		f1_arg0:SubscribeToModel( f1_local7.entity:GetModel( f1_local2 ), function ( f2_arg0 )
			local f2_local0 = DataModel.GetModelValue( f2_arg0 )
			if f2_local0 <= 0 or f2_local0 == Engine.GetEntityNumNoneValue() then
				if f1_arg0.reticles[f1_local6] then
					f1_arg0.reticles[f1_local6]:close()
					f1_arg0.reticles[f1_local6] = nil
				end
			else
				if not f1_arg0.reticles[f1_local6] then
					local f2_local1 = MenuBuilder.BuildRegisteredType( f1_arg1.widgetType )
					f2_local1.id = "reticle_" .. f1_local6
					f2_local1:SetupAnchoredElement( f1_local1 )
					f2_local1:SetDataSource( f1_local7, f1_local2 )
					f1_arg0.reticles[f1_local6] = f2_local1
					f1_arg0:addElement( f1_arg0.reticles[f1_local6] )
				end
				assert( f1_arg0.reticles[f1_local6].SetEntityNum )
				f1_arg0.reticles[f1_local6]:SetEntityNum( f2_local0 )
			end
		end )
	end
end


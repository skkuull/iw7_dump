local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
HINT_STYLES = {
	circle = 0,
	iconAndRarity = 1
}
function InteractiveObjectButtons()
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "InteractiveObjectButtons"
	self.instances = {}
	local f1_local1 = self:getRootController()
	local f1_local2 = DataSources.inGame.HUD.hints.interactiveObject.button.targetEntity:GetModel( f1_local1 )
	local f1_local3 = DataSources.inGame.HUD.hints.interactiveObject.button.shouldShow:GetModel( f1_local1 )
	local f1_local4 = DataSources.inGame.HUD.hints.interactiveObject.button.style:GetModel( f1_local1 )
	self:SubscribeToModel( f1_local2, function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		local f2_local1 = DataSources.inGame.HUD.hints.interactiveObject.button.dismiss:GetModel( f1_local1 )
		DataModel.SetModelValue( f2_local1, true )
		for f2_local5, f2_local6 in pairs( self.instances ) do
			f2_local6:SetDataSource( nil, f1_local1 )
			local f2_local7 = f2_local6:Wait( 500 )
			f2_local7.onComplete = function ()
				f2_local6:closeTree()
				if self.instances[f2_local5] == f2_local6 then
					self.instances[f2_local5] = nil
				end
			end
			
		end
		DataModel.SetModelValue( f2_local1, false )
		if self.instances[f2_local0] then
			self.instances[f2_local0]:closeTree()
			self.instances[f2_local0] = nil
		end
		f2_local2 = DataModel.GetModelValue( f1_local3 )
		f2_local3 = DataModel.GetModelValue( f1_local4 )
		f2_local4, f2_local5 = nil
		if f2_local2 then
			if f2_local3 == HINT_STYLES.circle then
				f2_local4 = "InteractiveObjectButton"
				f2_local5 = {
					snapEdges = true,
					buttonHintMinScale = Engine.GetDvarFloat( "cg_buttonHintMinScale" ),
					buttonHintMaxScale = Engine.GetDvarFloat( "cg_buttonHintMaxScale" ),
					buttonHintNaturalDistance = Engine.GetDvarFloat( "cg_buttonHintNaturalDistance" )
				}
			elseif f2_local3 == HINT_STYLES.iconAndRarity then
				f2_local4 = "InteractiveObjectCustomButton"
				f2_local5 = {
					snapEdges = false,
					buttonHintMinScale = 0.3,
					buttonHintMaxScale = 1,
					buttonHintNaturalDistance = 130
				}
			end
		end
		if f2_local4 then
			f2_local6 = MenuBuilder.BuildRegisteredType( f2_local4 )
			f2_local6.id = "hint_" .. f2_local0
			f2_local6:SetupAnchoredElement( {
				entityNum = f2_local0,
				snapToScreenEdges = f2_local5.snapEdges,
				minScale = f2_local5.buttonHintMinScale,
				maxScale = f2_local5.buttonHintMaxScale,
				naturalDistance = f2_local5.buttonHintNaturalDistance
			} )
			f2_local6:SubscribeToModelThroughElement( f2_local6, "targetEntityTag", function ( f4_arg0 )
				f2_local6:SetEntityTag( DataModel.GetModelValue( f4_arg0 ) )
			end )
			f2_local6:SetDataSource( DataSources.inGame.HUD.hints.interactiveObject.button, f1_local1 )
			self.instances[f2_local0] = f2_local6
			self:addElement( self.instances[f2_local0] )
		end
	end )
	return self
end

MenuBuilder.registerType( "InteractiveObjectButtons", InteractiveObjectButtons )
LockTable( _M )

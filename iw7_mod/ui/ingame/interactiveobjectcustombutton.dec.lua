local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "obstructed", function ( f2_arg0 )
		if DataModel.GetModelValue( f2_arg0 ) then
			f1_arg0:SetAlpha( 0.3, 150 )
		else
			f1_arg0:SetAlpha( 1, 150 )
		end
	end )
end

function InteractiveObjectCustomButton( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 40 * _1080p, 0, 40 * _1080p )
	self.id = "InteractiveObjectCustomButton"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local InteractiveObjectCustomButtonIcon = nil
	
	InteractiveObjectCustomButtonIcon = MenuBuilder.BuildRegisteredType( "InteractiveObjectCustomButtonIcon", {
		controllerIndex = f3_local1
	} )
	InteractiveObjectCustomButtonIcon.id = "InteractiveObjectCustomButtonIcon"
	InteractiveObjectCustomButtonIcon:SetDataSourceThroughElement( self, nil )
	InteractiveObjectCustomButtonIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -262, _1080p * 302, _1080p * -12, _1080p * 52 )
	InteractiveObjectCustomButtonIcon:SubscribeToModelThroughElement( self, "material", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.material:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			InteractiveObjectCustomButtonIcon.Icon:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	InteractiveObjectCustomButtonIcon:SubscribeToModelThroughElement( self, "string", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.string:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			InteractiveObjectCustomButtonIcon.Text:setText( f5_local0, 0 )
		end
	end )
	InteractiveObjectCustomButtonIcon:SubscribeToModelThroughElement( self, "string", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.string:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			InteractiveObjectCustomButtonIcon.TextFadeEffect:setText( f6_local0, 0 )
		end
	end )
	self:addElement( InteractiveObjectCustomButtonIcon )
	self.InteractiveObjectCustomButtonIcon = InteractiveObjectCustomButtonIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		InteractiveObjectCustomButtonIcon:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.InteractiveObjectCustomButtonIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.InteractiveObjectCustomButtonIcon:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.FadeIn = function ()
			InteractiveObjectCustomButtonIcon:AnimateSequence( "FadeIn" )
		end
		
		InteractiveObjectCustomButtonIcon:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.InteractiveObjectCustomButtonIcon:SetAlpha( 0, 200 )
				end
			}
		} )
		self._sequences.FadeOut = function ()
			InteractiveObjectCustomButtonIcon:AnimateSequence( "FadeOut" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	InteractiveObjectCustomButtonIcon:SetDataSourceThroughElement( self, nil )
	self:SubscribeToModelThroughElement( self, "range", function ()
		local f14_local0 = self:GetDataSource()
		if f14_local0.range:GetValue( f3_local1 ) ~= nil then
			f14_local0 = self:GetDataSource()
			if f14_local0.range:GetValue( f3_local1 ) == 0 then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "InteractiveObjectCustomButtonIcon",
					sequenceName = "InRange",
					elementPath = "InteractiveObjectCustomButtonIcon"
				} )
			end
		end
		if DataSources.inGame.HUD.hints.interactiveObject.button.range:GetValue( f3_local1 ) ~= nil and DataSources.inGame.HUD.hints.interactiveObject.button.range:GetValue( f3_local1 ) == 1 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "InteractiveObjectCustomButtonIcon",
				sequenceName = "NotInRange",
				elementPath = "InteractiveObjectCustomButtonIcon"
			} )
		end
	end )
	self:SubscribeToModelThroughElement( self, "dismiss", function ()
		local f15_local0 = self:GetDataSource()
		if f15_local0.dismiss:GetValue( f3_local1 ) ~= nil then
			f15_local0 = self:GetDataSource()
			if f15_local0.dismiss:GetValue( f3_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "InteractiveObjectCustomButtonIcon",
					sequenceName = "FadeOut",
					elementPath = "InteractiveObjectCustomButtonIcon"
				} )
			end
		end
	end )
	self:SubscribeToModel( DataSources.inGame.HUD.hints.interactiveObject.button.range:GetModel( f3_local1 ), function ()
		if DataSources.inGame.HUD.hints.interactiveObject.button.range:GetValue( f3_local1 ) ~= nil and DataSources.inGame.HUD.hints.interactiveObject.button.range:GetValue( f3_local1 ) == 2 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "InteractiveObjectCustomButtonIcon",
				sequenceName = "HintOn",
				elementPath = "InteractiveObjectCustomButtonIcon"
			} )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "FadeIn" )
	return self
end

MenuBuilder.registerType( "InteractiveObjectCustomButton", InteractiveObjectCustomButton )
LockTable( _M )

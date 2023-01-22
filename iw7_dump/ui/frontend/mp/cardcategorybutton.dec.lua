local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	assert( f1_arg0.Button )
	f1_arg0.Button:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg1.controller
		assert( f2_local0 )
		LUI.FlowManager.RequestAddMenu( "CallingCardSelectionMenu", true, f2_arg1.controller, false, {
			cardCategoryRef = CallingCardUtils.GetCardChallengeCategoryRef( f1_arg0:GetDataSource(), f2_local0 )
		} )
	end )
	if CONDITIONS.UseCACBreadCrumbs() and CONDITIONS.IsPublicMatch() then
		f1_arg0:SubscribeToDataSourceThroughElement( f1_arg0, nil, function ( f3_arg0, f3_arg1 )
			local f3_local0 = f1_arg0:GetDataSource()
			local f3_local1 = f3_local0.hasNew
			if f3_local1 then
				f3_local1 = f3_local0.hasNew:GetValue( f1_arg1 )
			end
			if f3_local1 then
				assert( f1_arg0.NewItemNotification )
				f1_arg0.NewItemNotification:SetAlpha( 1, 0 )
			end
		end )
	end
end

function CardCategoryButton( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "CardCategoryButton"
	self._animationSets = {}
	self._sequences = {}
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
	Button:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	Button:SubscribeToModelThroughElement( self, "category", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.category:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			Button.Text:setText( ToUpperCase( f5_local0 ), 0 )
		end
	end )
	self:addElement( Button )
	self.Button = Button
	
	local NewItemNotification = nil
	
	NewItemNotification = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
		controllerIndex = f4_local1
	} )
	NewItemNotification.id = "NewItemNotification"
	NewItemNotification:SetAlpha( 0, 0 )
	NewItemNotification:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 385, _1080p * -51, _1080p * -17, _1080p * 47 )
	self:addElement( NewItemNotification )
	self.NewItemNotification = NewItemNotification
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		NewItemNotification:RegisterAnimationSequence( "isArabic", {
			{
				function ()
					return self.NewItemNotification:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 13, _1080p * -423, _1080p * -17, _1080p * 47, 0 )
				end
			}
		} )
		self._sequences.isArabic = function ()
			NewItemNotification:AnimateSequence( "isArabic" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f4_local1, controller )
	if CONDITIONS.IsArabic( self ) then
		ACTIONS.AnimateSequence( self, "isArabic" )
	end
	return self
end

MenuBuilder.registerType( "CardCategoryButton", CardCategoryButton )
LockTable( _M )

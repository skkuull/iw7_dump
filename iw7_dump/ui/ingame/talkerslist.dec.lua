local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function TalkersList( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 375 * _1080p )
	self.id = "TalkersList"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TalkersList = nil
	
	TalkersList = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		controllerIndex = f1_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "TalkerWidget", {
				controllerIndex = f1_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 2,
		spacingY = _1080p * 2,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 30,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	TalkersList.id = "TalkersList"
	TalkersList:setUseStencil( true )
	TalkersList:SetGridDataSource( DataSources.inGame.HUD.talkersList, f1_local1 )
	TalkersList:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 40, _1080p * 166 )
	self:addElement( TalkersList )
	self.TalkersList = TalkersList
	
	local OwnerIsTalking = nil
	
	OwnerIsTalking = LUI.UIImage.new()
	OwnerIsTalking.id = "OwnerIsTalking"
	OwnerIsTalking:setImage( RegisterMaterial( "voice_on" ), 0 )
	OwnerIsTalking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 47.5, 0, 0, _1080p * 40 )
	self:addElement( OwnerIsTalking )
	self.OwnerIsTalking = OwnerIsTalking
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		OwnerIsTalking:RegisterAnimationSequence( "FadeOutOwnerTalking", {
			{
				function ()
					return self.OwnerIsTalking:SetAlpha( 1, 0 )
				end,
				function ()
					return self.OwnerIsTalking:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.FadeOutOwnerTalking = function ()
			OwnerIsTalking:AnimateSequence( "FadeOutOwnerTalking" )
		end
		
		OwnerIsTalking:RegisterAnimationSequence( "FadeInOwnerTalking", {
			{
				function ()
					return self.OwnerIsTalking:SetAlpha( 0, 0 )
				end,
				function ()
					return self.OwnerIsTalking:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.FadeInOwnerTalking = function ()
			OwnerIsTalking:AnimateSequence( "FadeInOwnerTalking" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	OwnerIsTalking:SubscribeToModel( DataSources.inGame.HUD.ownerIsTalking:GetModel( f1_local1 ), function ()
		if DataSources.inGame.HUD.ownerIsTalking:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.ownerIsTalking:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "FadeOutOwnerTalking" )
		end
		if DataSources.inGame.HUD.ownerIsTalking:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.ownerIsTalking:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "FadeInOwnerTalking" )
		end
	end )
	return self
end

MenuBuilder.registerType( "TalkersList", TalkersList )
LockTable( _M )

local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questTooth( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "questTooth"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ToothBox = nil
	
	ToothBox = LUI.UIImage.new()
	ToothBox.id = "ToothBox"
	ToothBox:SetRGBFromInt( 2302755, 0 )
	ToothBox:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128 )
	self:addElement( ToothBox )
	self.ToothBox = ToothBox
	
	local toothBacking = nil
	
	toothBacking = LUI.UIImage.new()
	toothBacking.id = "toothBacking"
	toothBacking:SetAlpha( 0.7, 0 )
	toothBacking:setImage( RegisterMaterial( "cp_zmb_sticker_teeth_empty" ), 0 )
	toothBacking:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128 )
	self:addElement( toothBacking )
	self.toothBacking = toothBacking
	
	local tooth = nil
	
	tooth = LUI.UIImage.new()
	tooth.id = "tooth"
	tooth:setImage( RegisterMaterial( "cp_zmb_sticker_teeth" ), 0 )
	tooth:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128 )
	tooth:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questToothAlpha:GetModel( f1_local1 ) )
	self:addElement( tooth )
	self.tooth = tooth
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		tooth:RegisterAnimationSequence( "toothFound", {
			{
				function ()
					return self.tooth:SetScale( 0, 350 )
				end,
				function ()
					return self.tooth:SetScale( 0.5, 200 )
				end,
				function ()
					return self.tooth:SetScale( 0, 200 )
				end,
				function ()
					return self.tooth:SetScale( 0.25, 200 )
				end,
				function ()
					return self.tooth:SetScale( 0, 200 )
				end,
				function ()
					return self.tooth:SetScale( 0.13, 200 )
				end,
				function ()
					return self.tooth:SetScale( 0, 150 )
				end
			}
		} )
		self._sequences.toothFound = function ()
			tooth:AnimateSequence( "toothFound" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	tooth:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questToothAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questToothAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questToothAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "toothFound" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questTooth", questTooth )
LockTable( _M )

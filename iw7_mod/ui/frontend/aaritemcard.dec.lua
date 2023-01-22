local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:playSound( "itemCardIntro" )
	f1_arg0:SetAlpha( 0 )
	f1_arg0:SetScale( 1 )
	f1_arg0:SetAlpha( 1, 200, LUI.EASING.outBack )
	f1_arg0:SetScale( 0, 200, LUI.EASING.outBack )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.PlayIntro = f0_local0
	f2_arg0.soundSet = "aarrewards"
	f2_arg0:SubscribeToDataSourceThroughElement( f2_arg0, nil, function ()
		local f3_local0 = f2_arg0:GetDataSource()
		local f3_local1 = {
			context = f3_local0.context,
			itemType = f3_local0.itemType,
			identifier = f3_local0.identifier,
			modelPath = f3_local0.modelPath,
			isButton = true,
			controllerIndex = f2_arg1
		}
		if not f2_arg0._itemCard then
			f2_arg0._itemCard = LUI.ItemCard.new( {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = true,
				left = 0,
				right = 0,
				top = 0,
				bottom = 0
			}, f3_local1 )
			f2_arg0:addElement( f2_arg0._itemCard )
		else
			f2_arg0._itemCard:BuildItemCard( f3_local1.context, f3_local1.itemType, f3_local1.identifier, f3_local1.controllerIndex, true )
		end
	end )
	local Highlight = nil
	
	Highlight = MenuBuilder.BuildRegisteredType( "AARItemCardHighlight", {
		controllerIndex = f2_arg1
	} )
	Highlight.id = "Highlight"
	Highlight:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -3, _1080p * 3, 0, _1080p * -5, 0 )
	Highlight:SetAlpha( 1 )
	f2_arg0:addElement( Highlight )
	f2_arg0.Highlight = Highlight
	
	f2_arg0.Highlight:setPriority( 1000 )
end

function AARItemCard( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 420 * _1080p )
	self.id = "AARItemCard"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	self.soundSet = "aarrewards"
	local f4_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.8, 0 )
	self:addElement( Background )
	self.Background = Background
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.Background:SetAlpha( 0.2, 0 )
				end
			}
		} )
		self._sequences.CPDefault = function ()
			Background:AnimateSequence( "CPDefault" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local1( self, f4_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPDefault" )
	end
	return self
end

MenuBuilder.registerType( "AARItemCard", AARItemCard )
LockTable( _M )

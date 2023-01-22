local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PerkItemHeader( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1149 * _1080p, 0, 220 * _1080p )
	self.id = "PerkItemHeader"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ItemHeader = nil
	
	ItemHeader = MenuBuilder.BuildRegisteredType( "CACItemHeader", {
		controllerIndex = f1_local1
	} )
	ItemHeader.id = "ItemHeader"
	ItemHeader:SetDataSource( DataSources.frontEnd.MP.CAC.perks.perkSelectArchetype, f1_local1 )
	ItemHeader.Background:SetRGBFromTable( SWATCHES.itemRarity.qualityBase, 0 )
	ItemHeader.ItemDescription:SetRight( _1080p * 750, 0 )
	ItemHeader.ItemDescription:setText( ToUpperCase( "ITEM DESCRIPTION" ), 0 )
	ItemHeader.ItemName:setText( "ITEM NAME", 0 )
	ItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100 )
	self:addElement( ItemHeader )
	self.ItemHeader = ItemHeader
	
	local SPStrip = nil
	
	SPStrip = LUI.UIImage.new()
	SPStrip.id = "SPStrip"
	SPStrip:SetRGBFromTable( SWATCHES.itemRarity.qualityBase, 0 )
	SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100 )
	self:addElement( SPStrip )
	self.SPStrip = SPStrip
	
	local UnlockCriteria = nil
	
	UnlockCriteria = MenuBuilder.BuildRegisteredType( "UnlockCriteria", {
		controllerIndex = f1_local1
	} )
	UnlockCriteria.id = "UnlockCriteria"
	UnlockCriteria:SetDataSourceThroughElement( self, nil )
	UnlockCriteria:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 380, _1080p * 188, _1080p * 220 )
	UnlockCriteria:SubscribeToModelThroughElement( self, "ref", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.ref:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			UnlockCriteria.UnlockDesc:setText( GetPerkUnlockText( f2_local0 ), 0 )
		end
	end )
	self:addElement( UnlockCriteria )
	self.UnlockCriteria = UnlockCriteria
	
	local ShowcaseLock = nil
	
	ShowcaseLock = MenuBuilder.BuildRegisteredType( "ShowcaseLock", {
		controllerIndex = f1_local1
	} )
	ShowcaseLock.id = "ShowcaseLock"
	ShowcaseLock:SetDataSourceThroughElement( self, nil )
	ShowcaseLock:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -251, _1080p * 261, _1080p * 136, _1080p * 648 )
	self:addElement( ShowcaseLock )
	self.ShowcaseLock = ShowcaseLock
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ItemHeader:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.ItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -37, 0, 0, _1080p * 100, 0 )
				end,
				function ()
					return self.ItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		SPStrip:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -37, _1080p * -26, 0, _1080p * 100, 0 )
				end,
				function ()
					return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.MenuOpen = function ()
			ItemHeader:AnimateSequence( "MenuOpen" )
			SPStrip:AnimateSequence( "MenuOpen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ItemHeader:SetDataSource( DataSources.frontEnd.MP.CAC.perks.perkSelectArchetype, f1_local1 )
	UnlockCriteria:SetDataSourceThroughElement( self, nil )
	ShowcaseLock:SetDataSourceThroughElement( self, nil )
	return self
end

MenuBuilder.registerType( "PerkItemHeader", PerkItemHeader )
LockTable( _M )

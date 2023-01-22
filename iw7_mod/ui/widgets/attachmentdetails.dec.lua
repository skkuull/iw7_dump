local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	if f1_arg0.UnlockCriteria then
		f1_arg0.CACItemHeader:SubscribeToModelThroughElement( f1_arg0, "desc", function ()
			local f2_local0 = f1_arg0:GetDataSource()
			f2_local0 = f2_local0.desc:GetValue( f1_arg1 )
			if f2_local0 ~= nil then
				Cac.PositionUnlockCriteria( ToUpperCase( LocalizeString( f2_local0 ) ), f1_arg0.CACItemHeader.ItemDescription, f1_arg0.UnlockCriteria )
			end
		end )
	end
	if Engine.IsAliensMode() then
		f1_arg0.CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	else
		f1_arg0.CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	end
end

function AttachmentDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1145 * _1080p, 0, 220 * _1080p )
	self.id = "AttachmentDetails"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local CACItemHeader = nil
	
	CACItemHeader = MenuBuilder.BuildRegisteredType( "CACItemHeader", {
		controllerIndex = f3_local1
	} )
	CACItemHeader.id = "CACItemHeader"
	CACItemHeader.Background:SetRGBFromTable( SWATCHES.itemRarity.qualityBase, 0 )
	CACItemHeader.ItemDescription:SetRight( _1080p * 750, 0 )
	CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100 )
	CACItemHeader:SubscribeToModelThroughElement( self, "desc", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.desc:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			CACItemHeader.ItemDescription:setText( LocalizeString( f4_local0 ), 0 )
		end
	end )
	CACItemHeader:SubscribeToModelThroughElement( self, "name", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.name:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			CACItemHeader.ItemName:setText( LocalizeString( f5_local0 ), 0 )
		end
	end )
	self:addElement( CACItemHeader )
	self.CACItemHeader = CACItemHeader
	
	local SPStrip = nil
	
	SPStrip = LUI.UIImage.new()
	SPStrip.id = "SPStrip"
	SPStrip:SetRGBFromTable( SWATCHES.itemRarity.qualityBase, 0 )
	SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100 )
	self:addElement( SPStrip )
	self.SPStrip = SPStrip
	
	local f3_local5 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f3_local5 = MenuBuilder.BuildRegisteredType( "UnlockCriteria", {
			controllerIndex = f3_local1
		} )
		f3_local5.id = "UnlockCriteria"
		if not CONDITIONS.IsThirdGameMode( self ) then
			f3_local5:SetDataSourceThroughElement( self, nil )
		end
		f3_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5.5, _1080p * 443.5, _1080p * 188, _1080p * 220 )
		f3_local5:SubscribeToModelThroughElement( self, "unlockText", function ()
			local f6_local0 = self:GetDataSource()
			f6_local0 = f6_local0.unlockText:GetValue( f3_local1 )
			if f6_local0 ~= nil then
				f3_local5.UnlockDesc:setText( f6_local0, 0 )
			end
		end )
		self:addElement( f3_local5 )
		self.UnlockCriteria = f3_local5
	end
	local f3_local6 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f3_local6 = MenuBuilder.BuildRegisteredType( "ShowcaseLock", {
			controllerIndex = f3_local1
		} )
		f3_local6.id = "ShowcaseLock"
		if not CONDITIONS.IsThirdGameMode( self ) then
			f3_local6:SetDataSourceThroughElement( self, nil )
		end
		f3_local6:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 135, _1080p * 647 )
		self:addElement( f3_local6 )
		self.ShowcaseLock = f3_local6
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CACItemHeader:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -39, 0, 0, _1080p * 100, 0 )
				end,
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		SPStrip:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -39, _1080p * -28, 0, _1080p * 100, 0 )
				end,
				function ()
					return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.MenuOpen = function ()
			CACItemHeader:AnimateSequence( "MenuOpen" )
			SPStrip:AnimateSequence( "MenuOpen" )
		end
		
	end
	
	self._animationSets.CP = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CACItemHeader:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -39, 0, 0, _1080p * 100, 0 )
				end,
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100, 300 )
				end
			}
		} )
		SPStrip:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -39, _1080p * -28, 0, _1080p * 100, 0 )
				end,
				function ()
					return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300 )
				end
			}
		} )
		self._sequences.MenuOpen = function ()
			CACItemHeader:AnimateSequence( "MenuOpen" )
			SPStrip:AnimateSequence( "MenuOpen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if not CONDITIONS.IsThirdGameMode( self ) then
		f3_local5:SetDataSourceThroughElement( self, nil )
	end
	if not CONDITIONS.IsThirdGameMode( self ) then
		f3_local6:SetDataSourceThroughElement( self, nil )
	end
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CACItemHeader",
		sequenceName = "UpdateDescription",
		elementPath = "CACItemHeader"
	} )
	return self
end

MenuBuilder.registerType( "AttachmentDetails", AttachmentDetails )
LockTable( _M )

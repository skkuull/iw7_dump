local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CACItemDescription( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 150 * _1080p )
	self.id = "CACItemDescription"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TitleBacker = nil
	
	TitleBacker = LUI.UIImage.new()
	TitleBacker.id = "TitleBacker"
	TitleBacker:SetRGBFromInt( 0, 0 )
	TitleBacker:SetAlpha( 0.5, 0 )
	TitleBacker:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 45 )
	self:addElement( TitleBacker )
	self.TitleBacker = TitleBacker
	
	local TitleBorder = nil
	
	TitleBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	TitleBorder.id = "TitleBorder"
	TitleBorder:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 45 )
	self:addElement( TitleBorder )
	self.TitleBorder = TitleBorder
	
	local ContentBacker = nil
	
	ContentBacker = LUI.UIImage.new()
	ContentBacker.id = "ContentBacker"
	ContentBacker:SetRGBFromInt( 0, 0 )
	ContentBacker:SetAlpha( 0.5, 0 )
	ContentBacker:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 45, 0 )
	self:addElement( ContentBacker )
	self.ContentBacker = ContentBacker
	
	local ContentBorder = nil
	
	ContentBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	ContentBorder.id = "ContentBorder"
	ContentBorder:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 45, 0 )
	self:addElement( ContentBorder )
	self.ContentBorder = ContentBorder
	
	local ItemDescription = nil
	
	ItemDescription = LUI.UIStyledText.new()
	ItemDescription.id = "ItemDescription"
	ItemDescription:SetFontSize( 45 * _1080p )
	ItemDescription:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	ItemDescription:SetAlignment( LUI.Alignment.Center )
	ItemDescription:SetDecodeLetterLength( 22 )
	ItemDescription:SetDecodeMaxRandChars( 3 )
	ItemDescription:SetDecodeUpdatesPerLetter( 4 )
	ItemDescription:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, 0, _1080p * 45 )
	ItemDescription:SubscribeToModelThroughElement( self, "name", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.name:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ItemDescription:setText( f2_local0, 0 )
		end
	end )
	self:addElement( ItemDescription )
	self.ItemDescription = ItemDescription
	
	local ItemName = nil
	
	ItemName = LUI.UIText.new()
	ItemName.id = "ItemName"
	ItemName:SetFontSize( 34 * _1080p )
	ItemName:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	ItemName:SetAlignment( LUI.Alignment.Center )
	ItemName:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, _1080p * 45, _1080p * 79 )
	ItemName:SubscribeToModelThroughElement( self, "desc", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.desc:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			ItemName:setText( f3_local0, 0 )
		end
	end )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TitleBorder:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.TitleBorder:SetAlpha( 0, 0 )
				end
			}
		} )
		ContentBorder:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.ContentBorder:SetAlpha( 0, 0 )
				end
			}
		} )
		ItemDescription:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.ItemDescription:SetAlpha( 0, 0 )
				end
			}
		} )
		ItemName:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.ItemName:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hidden = function ()
			TitleBorder:AnimateSequence( "Hidden" )
			ContentBorder:AnimateSequence( "Hidden" )
			ItemDescription:AnimateSequence( "Hidden" )
			ItemName:AnimateSequence( "Hidden" )
		end
		
		TitleBorder:RegisterAnimationSequence( "Visible", {
			{
				function ()
					return self.TitleBorder:SetAlpha( 1, 0 )
				end
			}
		} )
		ContentBorder:RegisterAnimationSequence( "Visible", {
			{
				function ()
					return self.ContentBorder:SetAlpha( 1, 0 )
				end
			}
		} )
		ItemDescription:RegisterAnimationSequence( "Visible", {
			{
				function ()
					return self.ItemDescription:SetAlpha( 1, 0 )
				end
			}
		} )
		ItemName:RegisterAnimationSequence( "Visible", {
			{
				function ()
					return self.ItemName:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Visible = function ()
			TitleBorder:AnimateSequence( "Visible" )
			ContentBorder:AnimateSequence( "Visible" )
			ItemDescription:AnimateSequence( "Visible" )
			ItemName:AnimateSequence( "Visible" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "used", function ()
		local f16_local0 = self:GetDataSource()
		if f16_local0.used:GetValue( f1_local1 ) ~= nil then
			f16_local0 = self:GetDataSource()
			if f16_local0.used:GetValue( f1_local1 ) == true then
				ACTIONS.AnimateSequence( self, "Visible" )
			end
		end
		f16_local0 = self:GetDataSource()
		if f16_local0.used:GetValue( f1_local1 ) ~= nil then
			f16_local0 = self:GetDataSource()
			if f16_local0.used:GetValue( f1_local1 ) == false then
				ACTIONS.AnimateSequence( self, "Hidden" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "CACItemDescription", CACItemDescription )
LockTable( _M )

local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARUnlockItemDescription( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 30 * _1080p )
	self.id = "AARUnlockItemDescription"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local DescText = nil
	
	DescText = LUI.UIText.new()
	DescText.id = "DescText"
	DescText:SetFontSize( 20 * _1080p )
	DescText:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	DescText:SetAlignment( LUI.Alignment.Center )
	DescText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 9, _1080p * -9, _1080p * 5, _1080p * 25 )
	DescText:SubscribeToModelThroughElement( self, "desc", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.desc:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			DescText:setText( f2_local0, 0 )
		end
	end )
	self:addElement( DescText )
	self.DescText = DescText
	
	local DividingLine = nil
	
	DividingLine = LUI.UIImage.new()
	DividingLine.id = "DividingLine"
	DividingLine:SetAlpha( 0.2, 0 )
	DividingLine:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 1 )
	self:addElement( DividingLine )
	self.DividingLine = DividingLine
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		DescText:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.DescText:SetAlpha( 0, 0 )
				end
			}
		} )
		DividingLine:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.DividingLine:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hide = function ()
			DescText:AnimateSequence( "Hide" )
			DividingLine:AnimateSequence( "Hide" )
		end
		
		DescText:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.DescText:SetAlpha( 1, 0 )
				end
			}
		} )
		DividingLine:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.DividingLine:SetAlpha( 0.2, 0 )
				end
			}
		} )
		self._sequences.Show = function ()
			DescText:AnimateSequence( "Show" )
			DividingLine:AnimateSequence( "Show" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "AARUnlockItemDescription", AARUnlockItemDescription )
LockTable( _M )

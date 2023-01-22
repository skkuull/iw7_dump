local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ItemCardHeader( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 26 * _1080p )
	self.id = "ItemCardHeader"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 15132390, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:SetRGBFromInt( 0, 0 )
	Title:SetFontSize( 20 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Center )
	Title:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -10, _1080p * 10 )
	Title:SubscribeToModelThroughElement( self, "text", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.text:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Title:setText( ToUpperCase( f2_local0 ), 0 )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.Background:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Title:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.Title:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			}
		} )
		self._sequences.CPDefault = function ()
			Background:AnimateSequence( "CPDefault" )
			Title:AnimateSequence( "CPDefault" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPDefault" )
	end
	return self
end

MenuBuilder.registerType( "ItemCardHeader", ItemCardHeader )
LockTable( _M )

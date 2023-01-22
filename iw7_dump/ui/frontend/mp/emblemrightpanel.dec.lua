local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function EmblemRightPanel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 425 * _1080p, 0, 712 * _1080p )
	self.id = "EmblemRightPanel"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if Engine.InFrontend() then
		f1_local3 = LUI.UIImage.new()
		f1_local3.id = "DropShadow"
		f1_local3:SetRGBFromInt( 0, 0 )
		f1_local3:SetAlpha( 0.3, 0 )
		f1_local3:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f1_local3:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f1_local3 )
		self.DropShadow = f1_local3
	end
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetRGBFromTable( SWATCHES.CAC.BarracksBlurDark, 0 )
	ListBlur:SetBlurStrength( 2.75, 0 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local black = nil
	
	black = LUI.UIImage.new()
	black.id = "black"
	black:SetRGBFromInt( 0, 0 )
	black:SetAlpha( 0.8, 0 )
	black:SetDotPitchEnabled( true )
	black:SetDotPitchX( 0, 0 )
	black:SetDotPitchY( 0, 0 )
	black:SetDotPitchContrast( 0, 0 )
	black:SetDotPitchMode( 0 )
	black:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 12.5, _1080p * -12.5, _1080p * 461, _1080p * 507 )
	self:addElement( black )
	self.black = black
	
	local FrameLabel = nil
	
	FrameLabel = LUI.UIText.new()
	FrameLabel.id = "FrameLabel"
	FrameLabel:SetRGBFromInt( 14277081, 0 )
	FrameLabel:setText( "EMBLEM LIVE PREVIEW", 0 )
	FrameLabel:SetFontSize( 22 * _1080p )
	FrameLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FrameLabel:SetAlignment( LUI.Alignment.Left )
	FrameLabel:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 41, _1080p * -12.5, _1080p * -44.5, _1080p * -22.5 )
	self:addElement( FrameLabel )
	self.FrameLabel = FrameLabel
	
	local Cap = nil
	
	Cap = LUI.UIImage.new()
	Cap.id = "Cap"
	Cap:SetRGBFromInt( 14277081, 0 )
	Cap:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 23, _1080p * 29, _1080p * -46.5, _1080p * -21 )
	self:addElement( Cap )
	self.Cap = Cap
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		black:RegisterAnimationSequence( "ShowQualityHeader", {
			{
				function ()
					return self.black:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ShowQualityHeader = function ()
			black:AnimateSequence( "ShowQualityHeader" )
		end
		
		black:RegisterAnimationSequence( "HideQualityHeader", {
			{
				function ()
					return self.black:SetAlpha( 0.8, 0 )
				end
			}
		} )
		self._sequences.HideQualityHeader = function ()
			black:AnimateSequence( "HideQualityHeader" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "EmblemRightPanel", EmblemRightPanel )
LockTable( _M )

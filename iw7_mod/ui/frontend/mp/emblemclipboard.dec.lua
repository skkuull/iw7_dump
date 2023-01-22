local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.CopiedEmblem:SetupEmblemCopyWidget()
end

function EmblemClipboard( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 202 * _1080p, 0, 229 * _1080p )
	self.id = "EmblemClipboard"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetRGBFromTable( SWATCHES.CAC.BarracksBlurDark, 0 )
	ListBlur:SetBlurStrength( 2.75, 0 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local CopiedEmblem = nil
	
	CopiedEmblem = LUI.UIImage.new()
	CopiedEmblem.id = "CopiedEmblem"
	CopiedEmblem:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 18, _1080p * -18, _1080p * 47, _1080p * -18 )
	self:addElement( CopiedEmblem )
	self.CopiedEmblem = CopiedEmblem
	
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
	black:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 29 )
	self:addElement( black )
	self.black = black
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f2_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 29, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:setText( Engine.Localize( "MP_EMBLEM_EDITOR_CLIPBOARD" ), 0 )
	Title:SetFontSize( 19 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 8, _1080p * -8, _1080p * 5, _1080p * 24 )
	self:addElement( Title )
	self.Title = Title
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "EmblemClipboard", EmblemClipboard )
LockTable( _M )

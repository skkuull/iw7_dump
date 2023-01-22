local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function BuildDecodeBlock( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( 100, 100, 600, 268, CoD.AnchorTypes.TopLeft ), controller )
	self.id = "UIDecodeBlock"
	assert( controller )
	assert( controller.sourceFile )
	local f1_local1 = controller.textFont
	if not f1_local1 then
		f1_local1 = FONTS.GetFont( FONTS.MainBold.File )
	end
	controller.textFont = f1_local1
	f1_local1 = controller.textAlign
	if not f1_local1 then
		f1_local1 = LUI.Alignment.Left
	end
	controller.textAlign = f1_local1
	f1_local1 = controller.feedHorizontalAlign
	if not f1_local1 then
		f1_local1 = LUI.Alignment.Left
	end
	controller.feedHorizontalAlign = f1_local1
	f1_local1 = controller.feedVerticalAlign
	if not f1_local1 then
		f1_local1 = LUI.Alignment.Top
	end
	controller.feedVerticalAlign = f1_local1
	controller.textHeight = controller.textHeight or 21
	controller.textLineDelay = controller.textLineDelay or 300
	controller.blockFadeTime = controller.blockFadeTime or 400
	controller.decodeLetterSpeed = controller.decodeLetterSpeed or controller.chyronLetterSpeed
	controller.decodeRandChars = controller.decodeRandChars or controller.chyronRandChars
	controller.decodeUpdatesPerLetter = controller.decodeUpdatesPerLetter or controller.chyronUpdatesPerLetter
	f1_local1 = controller.decodeLetterSpeed or 10
	local f1_local2 = controller.decodeRandChars or 1
	local f1_local3 = controller.decodeUpdatesPerLetter or 4
	self:SetupChyronBlock( controller )
	return self
end

MenuBuilder.registerType( "DecodeBlock", BuildDecodeBlock )
MenuBuilder.registerType( "ChyronBlock", BuildDecodeBlock )
LockTable( _M )

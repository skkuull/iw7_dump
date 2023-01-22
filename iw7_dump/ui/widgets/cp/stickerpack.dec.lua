local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function StickerPack( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 300 * _1080p )
	self.id = "StickerPack"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local grayBoxheader = nil
	
	grayBoxheader = LUI.UIImage.new()
	grayBoxheader.id = "grayBoxheader"
	grayBoxheader:SetRGBFromInt( 2169886, 0 )
	grayBoxheader:SetAlpha( 0.3, 0 )
	grayBoxheader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 595.76, 0, _1080p * 58.53, _1080p * 113.43 )
	self:addElement( grayBoxheader )
	self.grayBoxheader = grayBoxheader
	
	local linesHeader = nil
	
	linesHeader = LUI.UIImage.new()
	linesHeader.id = "linesHeader"
	linesHeader:SetAlpha( 0.3, 0 )
	linesHeader:setImage( RegisterMaterial( "cp_zmb_inventory_line_pattern" ), 0 )
	linesHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 591.88, 0, _1080p * 48.48, _1080p * 125.43 )
	self:addElement( linesHeader )
	self.linesHeader = linesHeader
	
	local pinkGradiant = nil
	
	pinkGradiant = LUI.UIImage.new()
	pinkGradiant.id = "pinkGradiant"
	pinkGradiant:setImage( RegisterMaterial( "cp_zmb_inventory_pink_gradient_bg" ), 0 )
	pinkGradiant:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -186.57, _1080p * -2.47 )
	self:addElement( pinkGradiant )
	self.pinkGradiant = pinkGradiant
	
	local blackBoxN3il = nil
	
	blackBoxN3il = LUI.UIImage.new()
	blackBoxN3il.id = "blackBoxN3il"
	blackBoxN3il:setImage( RegisterMaterial( "cp_zmb_inventory_sticker_bg" ), 0 )
	blackBoxN3il:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 119.04, _1080p * 331.19, _1080p * -175.57, _1080p * -65.57 )
	self:addElement( blackBoxN3il )
	self.blackBoxN3il = blackBoxN3il
	
	local XQuisiteBox = nil
	
	XQuisiteBox = LUI.UIImage.new()
	XQuisiteBox.id = "XQuisiteBox"
	XQuisiteBox:setImage( RegisterMaterial( "cp_zmb_inventory_sticker_bg" ), 0 )
	XQuisiteBox:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 338.04, _1080p * 688.02, _1080p * -175.57, _1080p * -65.57 )
	self:addElement( XQuisiteBox )
	self.XQuisiteBox = XQuisiteBox
	
	local headcutBox = nil
	
	headcutBox = LUI.UIImage.new()
	headcutBox.id = "headcutBox"
	headcutBox:setImage( RegisterMaterial( "cp_zmb_inventory_sticker_bg" ), 0 )
	headcutBox:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 691.88, _1080p * 912.33, _1080p * -175.57, _1080p * -65.57 )
	self:addElement( headcutBox )
	self.headcutBox = headcutBox
	
	local faceBox = nil
	
	faceBox = LUI.UIImage.new()
	faceBox.id = "faceBox"
	faceBox:setImage( RegisterMaterial( "cp_zmb_inventory_sticker_bg" ), 0 )
	faceBox:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 916.33, _1080p * 1136.78, _1080p * -175.57, _1080p * -65.57 )
	self:addElement( faceBox )
	self.faceBox = faceBox
	
	local dischordBox = nil
	
	dischordBox = LUI.UIImage.new()
	dischordBox.id = "dischordBox"
	dischordBox:setImage( RegisterMaterial( "cp_zmb_inventory_sticker_bg" ), 0 )
	dischordBox:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1140.78, _1080p * 1361.22, _1080p * -175.57, _1080p * -65.57 )
	self:addElement( dischordBox )
	self.dischordBox = dischordBox
	
	local shredderBox = nil
	
	shredderBox = LUI.UIImage.new()
	shredderBox.id = "shredderBox"
	shredderBox:setImage( RegisterMaterial( "cp_zmb_inventory_sticker_bg" ), 0 )
	shredderBox:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1365.73, _1080p * 1586.17, _1080p * -175.57, _1080p * -65.57 )
	self:addElement( shredderBox )
	self.shredderBox = shredderBox
	
	local setiBox = nil
	
	setiBox = LUI.UIImage.new()
	setiBox.id = "setiBox"
	setiBox:setImage( RegisterMaterial( "cp_zmb_inventory_sticker_bg" ), 0 )
	setiBox:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1591.43, _1080p * 1811.88, _1080p * -175.57, _1080p * -65.57 )
	self:addElement( setiBox )
	self.setiBox = setiBox
	
	local questRecorderWidget = nil
	
	questRecorderWidget = MenuBuilder.BuildRegisteredType( "questRecorderWidget", {
		controllerIndex = f1_local1
	} )
	questRecorderWidget.id = "questRecorderWidget"
	questRecorderWidget:SetScale( -0.5, 0 )
	questRecorderWidget.Backing:SetAlpha( 0, 0 )
	questRecorderWidget:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1528.45, _1080p * 1842.86, _1080p * -156.31, _1080p * -52.56 )
	self:addElement( questRecorderWidget )
	self.questRecorderWidget = questRecorderWidget
	
	local questWOR4Widget = nil
	
	questWOR4Widget = MenuBuilder.BuildRegisteredType( "questWOR4Widget", {
		controllerIndex = f1_local1
	} )
	questWOR4Widget.id = "questWOR4Widget"
	questWOR4Widget:SetScale( -0.5, 0 )
	questWOR4Widget.Backing:SetAlpha( 0, 0 )
	questWOR4Widget:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1333.25, _1080p * 1538.25, _1080p * -158.47, _1080p * -44.47 )
	self:addElement( questWOR4Widget )
	self.questWOR4Widget = questWOR4Widget
	
	local questWOR3Widget = nil
	
	questWOR3Widget = MenuBuilder.BuildRegisteredType( "questWOR3Widget", {
		controllerIndex = f1_local1
	} )
	questWOR3Widget.id = "questWOR3Widget"
	questWOR3Widget:SetScale( -0.5, 0 )
	questWOR3Widget.Backing:SetAlpha( 0, 0 )
	questWOR3Widget:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1113.25, _1080p * 1318.25, _1080p * -158.47, _1080p * -44.47 )
	self:addElement( questWOR3Widget )
	self.questWOR3Widget = questWOR3Widget
	
	local questWOR2Widget = nil
	
	questWOR2Widget = MenuBuilder.BuildRegisteredType( "questWOR2Widget", {
		controllerIndex = f1_local1
	} )
	questWOR2Widget.id = "questWOR2Widget"
	questWOR2Widget:SetScale( -0.5, 0 )
	questWOR2Widget.Backing:SetAlpha( 0, 0 )
	questWOR2Widget:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 898.05, _1080p * 1103.05, _1080p * -156.47, _1080p * -42.47 )
	self:addElement( questWOR2Widget )
	self.questWOR2Widget = questWOR2Widget
	
	local questWOR1Widget = nil
	
	questWOR1Widget = MenuBuilder.BuildRegisteredType( "questWOR1Widget", {
		controllerIndex = f1_local1
	} )
	questWOR1Widget.id = "questWOR1Widget"
	questWOR1Widget:SetScale( -0.5, 0 )
	questWOR1Widget.Backing:SetAlpha( 0, 0 )
	questWOR1Widget:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 662.98, _1080p * 862.57, _1080p * -154.3, _1080p * -48.57 )
	self:addElement( questWOR1Widget )
	self.questWOR1Widget = questWOR1Widget
	
	local questTooth = nil
	
	questTooth = MenuBuilder.BuildRegisteredType( "questTooth", {
		controllerIndex = f1_local1
	} )
	questTooth.id = "questTooth"
	questTooth:SetScale( -0.5, 0 )
	questTooth.ToothBox:SetAlpha( 0, 0 )
	questTooth:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 588.12, _1080p * 671.89, _1080p * -155.22, _1080p * -74.22 )
	self:addElement( questTooth )
	self.questTooth = questTooth
	
	local questArkWidget = nil
	
	questArkWidget = MenuBuilder.BuildRegisteredType( "questArkWidget", {
		controllerIndex = f1_local1
	} )
	questArkWidget.id = "questArkWidget"
	questArkWidget:SetScale( -0.5, 0 )
	questArkWidget.ArkQuestBox:SetAlpha( 0, 0 )
	questArkWidget:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 192.03, _1080p * 834.03, _1080p * -166.19, _1080p * -38.76 )
	self:addElement( questArkWidget )
	self.questArkWidget = questArkWidget
	
	local questRobotWidget = nil
	
	questRobotWidget = MenuBuilder.BuildRegisteredType( "questRobotWidget", {
		controllerIndex = f1_local1
	} )
	questRobotWidget.id = "questRobotWidget"
	questRobotWidget:SetScale( -0.5, 0 )
	questRobotWidget.RobotQuestBox:SetAlpha( 0, 0 )
	questRobotWidget:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 54.11, _1080p * 354.11, _1080p * -166.47, _1080p * -34.47 )
	self:addElement( questRobotWidget )
	self.questRobotWidget = questRobotWidget
	
	local Text7 = nil
	
	Text7 = LUI.UIText.new()
	Text7.id = "Text7"
	Text7:setText( Engine.Localize( "LUA_MENU_ZM_INVENTORY_SETI_COM" ), 0 )
	Text7:SetFontSize( 24 * _1080p )
	Text7:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Text7:SetAlignment( LUI.Alignment.Center )
	Text7:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1591.43, _1080p * 1811.88, _1080p * -160.94, _1080p * -136.94 )
	self:addElement( Text7 )
	self.Text7 = Text7
	
	local Text6 = nil
	
	Text6 = LUI.UIText.new()
	Text6.id = "Text6"
	Text6:setText( Engine.Localize( "LUA_MENU_ZM_INVENTORY_SHREDDER" ), 0 )
	Text6:SetFontSize( 24 * _1080p )
	Text6:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Text6:SetAlignment( LUI.Alignment.Center )
	Text6:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1365.73, _1080p * 1586.17, _1080p * -160.43, _1080p * -136.43 )
	self:addElement( Text6 )
	self.Text6 = Text6
	
	local Text5 = nil
	
	Text5 = LUI.UIText.new()
	Text5.id = "Text5"
	Text5:setText( Engine.Localize( "LUA_MENU_ZM_INVENTORY_DISCHORD" ), 0 )
	Text5:SetFontSize( 24 * _1080p )
	Text5:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Text5:SetAlignment( LUI.Alignment.Center )
	Text5:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1140.78, _1080p * 1361.22, _1080p * -161, _1080p * -137 )
	self:addElement( Text5 )
	self.Text5 = Text5
	
	local Text4 = nil
	
	Text4 = LUI.UIText.new()
	Text4.id = "Text4"
	Text4:setText( Engine.Localize( "LUA_MENU_ZM_INVENTORY_FACE_MELTER" ), 0 )
	Text4:SetFontSize( 24 * _1080p )
	Text4:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Text4:SetAlignment( LUI.Alignment.Center )
	Text4:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 916.33, _1080p * 1136.78, _1080p * -159.57, _1080p * -135.57 )
	self:addElement( Text4 )
	self.Text4 = Text4
	
	local Text3 = nil
	
	Text3 = LUI.UIText.new()
	Text3.id = "Text3"
	Text3:setText( Engine.Localize( "LUA_MENU_ZM_INVENTORY_HEAD_CUTTER" ), 0 )
	Text3:SetFontSize( 24 * _1080p )
	Text3:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Text3:SetAlignment( LUI.Alignment.Center )
	Text3:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 691.88, _1080p * 912.33, _1080p * -161.57, _1080p * -137.57 )
	self:addElement( Text3 )
	self.Text3 = Text3
	
	local Text2 = nil
	
	Text2 = LUI.UIText.new()
	Text2.id = "Text2"
	Text2:setText( Engine.Localize( "LUA_MENU_ZM_INVENTORY_XQUISITE" ), 0 )
	Text2:SetFontSize( 24 * _1080p )
	Text2:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Text2:SetAlignment( LUI.Alignment.Center )
	Text2:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 338.04, _1080p * 688.02, _1080p * -159.57, _1080p * -135.57 )
	self:addElement( Text2 )
	self.Text2 = Text2
	
	local Text1 = nil
	
	Text1 = LUI.UIText.new()
	Text1.id = "Text1"
	Text1:setText( Engine.Localize( "LUA_MENU_ZM_INVENTORY_N31L" ), 0 )
	Text1:SetFontSize( 24 * _1080p )
	Text1:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Text1:SetAlignment( LUI.Alignment.Center )
	Text1:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 119.04, _1080p * 331.19, _1080p * -161.57, _1080p * -137.57 )
	self:addElement( Text1 )
	self.Text1 = Text1
	
	local stapleXquisite = nil
	
	stapleXquisite = LUI.UIImage.new()
	stapleXquisite.id = "stapleXquisite"
	stapleXquisite:SetZRotation( 3, 0 )
	stapleXquisite:setImage( RegisterMaterial( "cp_zmb_inventory_staple" ), 0 )
	stapleXquisite:SetUseAA( true )
	stapleXquisite:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 503.43, _1080p * 535.43, _1080p * -170.43, _1080p * -162.43 )
	self:addElement( stapleXquisite )
	self.stapleXquisite = stapleXquisite
	
	local stapleNeil = nil
	
	stapleNeil = LUI.UIImage.new()
	stapleNeil.id = "stapleNeil"
	stapleNeil:SetZRotation( -6, 0 )
	stapleNeil:setImage( RegisterMaterial( "cp_zmb_inventory_staple" ), 0 )
	stapleNeil:SetUseAA( true )
	stapleNeil:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 209.11, _1080p * 241.11, _1080p * -169.57, _1080p * -161.57 )
	self:addElement( stapleNeil )
	self.stapleNeil = stapleNeil
	
	local stapleHead = nil
	
	stapleHead = LUI.UIImage.new()
	stapleHead.id = "stapleHead"
	stapleHead:SetZRotation( -4, 0 )
	stapleHead:setImage( RegisterMaterial( "cp_zmb_inventory_staple" ), 0 )
	stapleHead:SetUseAA( true )
	stapleHead:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 794.1, _1080p * 826.1, _1080p * -170.94, _1080p * -162.94 )
	self:addElement( stapleHead )
	self.stapleHead = stapleHead
	
	local stapleFace = nil
	
	stapleFace = LUI.UIImage.new()
	stapleFace.id = "stapleFace"
	stapleFace:SetZRotation( 2, 0 )
	stapleFace:setImage( RegisterMaterial( "cp_zmb_inventory_staple" ), 0 )
	stapleFace:SetUseAA( true )
	stapleFace:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1010.55, _1080p * 1042.55, _1080p * -170.94, _1080p * -162.94 )
	self:addElement( stapleFace )
	self.stapleFace = stapleFace
	
	local stapleDischord = nil
	
	stapleDischord = LUI.UIImage.new()
	stapleDischord.id = "stapleDischord"
	stapleDischord:SetZRotation( -2, 0 )
	stapleDischord:setImage( RegisterMaterial( "cp_zmb_inventory_staple" ), 0 )
	stapleDischord:SetUseAA( true )
	stapleDischord:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1235, _1080p * 1267, _1080p * -170.94, _1080p * -162.94 )
	self:addElement( stapleDischord )
	self.stapleDischord = stapleDischord
	
	local stapleDischordCopy0 = nil
	
	stapleDischordCopy0 = LUI.UIImage.new()
	stapleDischordCopy0.id = "stapleDischordCopy0"
	stapleDischordCopy0:SetZRotation( 8, 0 )
	stapleDischordCopy0:setImage( RegisterMaterial( "cp_zmb_inventory_staple" ), 0 )
	stapleDischordCopy0:SetUseAA( true )
	stapleDischordCopy0:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1467, _1080p * 1499, _1080p * -170.94, _1080p * -162.94 )
	self:addElement( stapleDischordCopy0 )
	self.stapleDischordCopy0 = stapleDischordCopy0
	
	local stapleSeti = nil
	
	stapleSeti = LUI.UIImage.new()
	stapleSeti.id = "stapleSeti"
	stapleSeti:SetZRotation( -3, 0 )
	stapleSeti:setImage( RegisterMaterial( "cp_zmb_inventory_staple" ), 0 )
	stapleSeti:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1685.66, _1080p * 1717.66, _1080p * -170.94, _1080p * -162.94 )
	self:addElement( stapleSeti )
	self.stapleSeti = stapleSeti
	
	local SpaceLandHeader = nil
	
	SpaceLandHeader = LUI.UIImage.new()
	SpaceLandHeader.id = "SpaceLandHeader"
	SpaceLandHeader:SetScale( -0.34, 0 )
	SpaceLandHeader:setImage( RegisterMaterial( "cp_zmb_inventory_main_header" ), 0 )
	SpaceLandHeader:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -174.27, _1080p * 849.73, _1080p * -343.52, _1080p * -87.52 )
	self:addElement( SpaceLandHeader )
	self.SpaceLandHeader = SpaceLandHeader
	
	local StickerPackText = nil
	
	StickerPackText = LUI.UIText.new()
	StickerPackText.id = "StickerPackText"
	StickerPackText:setText( Engine.Localize( "LUA_MENU_ZM_INVENTORY_STICKER" ), 0 )
	StickerPackText:SetFontSize( 24 * _1080p )
	StickerPackText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	StickerPackText:SetAlignment( LUI.Alignment.Left )
	StickerPackText:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 481.72, _1080p * 606.15, _1080p * -237.02, _1080p * -213.02 )
	self:addElement( StickerPackText )
	self.StickerPackText = StickerPackText
	
	local pinkLeftpieceCopy0 = nil
	
	pinkLeftpieceCopy0 = LUI.UIImage.new()
	pinkLeftpieceCopy0.id = "pinkLeftpieceCopy0"
	pinkLeftpieceCopy0:SetRGBFromInt( 15540613, 0 )
	pinkLeftpieceCopy0:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 79, _1080p * -240.47, _1080p * -235.02 )
	self:addElement( pinkLeftpieceCopy0 )
	self.pinkLeftpieceCopy0 = pinkLeftpieceCopy0
	
	local grayLeftpiece = nil
	
	grayLeftpiece = LUI.UIImage.new()
	grayLeftpiece.id = "grayLeftpiece"
	grayLeftpiece:SetRGBFromInt( 2105118, 0 )
	grayLeftpiece:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 76, _1080p * -235.02, _1080p * -186.57 )
	self:addElement( grayLeftpiece )
	self.grayLeftpiece = grayLeftpiece
	
	local NO0001text = nil
	
	NO0001text = LUI.UIText.new()
	NO0001text.id = "NO0001text"
	NO0001text:SetZRotation( 90, 0 )
	NO0001text:setText( "NO 0001", 0 )
	NO0001text:SetFontSize( 10 * _1080p )
	NO0001text:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	NO0001text:SetAlignment( LUI.Alignment.Left )
	NO0001text:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 304.54, _1080p * 343.54, _1080p * -99.47, _1080p * -89.47 )
	self:addElement( NO0001text )
	self.NO0001text = NO0001text
	
	local NO0002text = nil
	
	NO0002text = LUI.UIText.new()
	NO0002text.id = "NO0002text"
	NO0002text:SetZRotation( 90, 0 )
	NO0002text:setText( "NO 0002", 0 )
	NO0002text:SetFontSize( 10 * _1080p )
	NO0002text:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	NO0002text:SetAlignment( LUI.Alignment.Left )
	NO0002text:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 650.95, _1080p * 712.88, _1080p * -111.44, _1080p * -101.44 )
	self:addElement( NO0002text )
	self.NO0002text = NO0002text
	
	local NO0003text = nil
	
	NO0003text = LUI.UIText.new()
	NO0003text.id = "NO0003text"
	NO0003text:SetZRotation( 90, 0 )
	NO0003text:setText( "NO 0003", 0 )
	NO0003text:SetFontSize( 10 * _1080p )
	NO0003text:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	NO0003text:SetAlignment( LUI.Alignment.Left )
	NO0003text:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 886.22, _1080p * 925.22, _1080p * -99.47, _1080p * -89.47 )
	self:addElement( NO0003text )
	self.NO0003text = NO0003text
	
	local NO0004text = nil
	
	NO0004text = LUI.UIText.new()
	NO0004text.id = "NO0004text"
	NO0004text:SetZRotation( 90, 0 )
	NO0004text:setText( "NO 0004", 0 )
	NO0004text:SetFontSize( 10 * _1080p )
	NO0004text:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	NO0004text:SetAlignment( LUI.Alignment.Left )
	NO0004text:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1105.12, _1080p * 1157.12, _1080p * -106.44, _1080p * -96.44 )
	self:addElement( NO0004text )
	self.NO0004text = NO0004text
	
	local NO0005text = nil
	
	NO0005text = LUI.UIText.new()
	NO0005text.id = "NO0005text"
	NO0005text:SetZRotation( 90, 0 )
	NO0005text:setText( "NO 0005", 0 )
	NO0005text:SetFontSize( 10 * _1080p )
	NO0005text:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	NO0005text:SetAlignment( LUI.Alignment.Left )
	NO0005text:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1332.58, _1080p * 1375.73, _1080p * -99.47, _1080p * -89.47 )
	self:addElement( NO0005text )
	self.NO0005text = NO0005text
	
	local NO0006text = nil
	
	NO0006text = LUI.UIText.new()
	NO0006text.id = "NO0006text"
	NO0006text:SetZRotation( 90, 0 )
	NO0006text:setText( "NO 0006", 0 )
	NO0006text:SetFontSize( 10 * _1080p )
	NO0006text:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	NO0006text:SetAlignment( LUI.Alignment.Left )
	NO0006text:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1561.8, _1080p * 1598.27, _1080p * -97.52, _1080p * -87.52 )
	self:addElement( NO0006text )
	self.NO0006text = NO0006text
	
	local NO0007text = nil
	
	NO0007text = LUI.UIText.new()
	NO0007text.id = "NO0007text"
	NO0007text:SetZRotation( 90, 0 )
	NO0007text:setText( "NO 0007", 0 )
	NO0007text:SetFontSize( 10 * _1080p )
	NO0007text:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	NO0007text:SetAlignment( LUI.Alignment.Left )
	NO0007text:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1773.88, _1080p * 1838.88, _1080p * -112.47, _1080p * -102.47 )
	self:addElement( NO0007text )
	self.NO0007text = NO0007text
	
	local questSetiComWidget = nil
	
	questSetiComWidget = MenuBuilder.BuildRegisteredType( "questSetiComWidget", {
		controllerIndex = f1_local1
	} )
	questSetiComWidget.id = "questSetiComWidget"
	questSetiComWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1594.17, _1080p * 1792.17, _1080p * 66, _1080p * 260 )
	self:addElement( questSetiComWidget )
	self.questSetiComWidget = questSetiComWidget
	
	local HorzLine = nil
	
	HorzLine = LUI.UIImage.new()
	HorzLine.id = "HorzLine"
	HorzLine:SetRGBFromTable( SWATCHES.genericMenu.frame, 0 )
	HorzLine:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 90, _1080p * 58.5, _1080p * 59.5 )
	self:addElement( HorzLine )
	self.HorzLine = HorzLine
	
	return self
end

MenuBuilder.registerType( "StickerPack", StickerPack )
LockTable( _M )

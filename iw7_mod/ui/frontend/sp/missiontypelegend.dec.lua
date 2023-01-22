local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MissionTypeLegend( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 700 * _1080p, 0, 42 * _1080p )
	self.id = "MissionTypeLegend"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local background = nil
	
	background = LUI.UIImage.new()
	background.id = "background"
	background:SetAlpha( 0.21, 0 )
	background:setImage( RegisterMaterial( "widg_gradient_right_to_left" ), 0 )
	background:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 700, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local JackalLabel = nil
	
	JackalLabel = LUI.UIText.new()
	JackalLabel.id = "JackalLabel"
	JackalLabel:setText( Engine.Localize( "MENU_SP_JACKAL_KEY" ), 0 )
	JackalLabel:SetFontSize( 22 * _1080p )
	JackalLabel:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	JackalLabel:SetAlignment( LUI.Alignment.Left )
	JackalLabel:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 543, _1080p * 700, _1080p * 9.5, _1080p * -10.5 )
	self:addElement( JackalLabel )
	self.JackalLabel = JackalLabel
	
	local ShipAssaultLabel = nil
	
	ShipAssaultLabel = LUI.UIText.new()
	ShipAssaultLabel.id = "ShipAssaultLabel"
	ShipAssaultLabel:setText( Engine.Localize( "MENU_SP_ASSAULT_KEY" ), 0 )
	ShipAssaultLabel:SetFontSize( 22 * _1080p )
	ShipAssaultLabel:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	ShipAssaultLabel:SetAlignment( LUI.Alignment.Left )
	ShipAssaultLabel:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 298, _1080p * 455, _1080p * 9.5, _1080p * -10.5 )
	self:addElement( ShipAssaultLabel )
	self.ShipAssaultLabel = ShipAssaultLabel
	
	local MissionLabel = nil
	
	MissionLabel = LUI.UIText.new()
	MissionLabel.id = "MissionLabel"
	MissionLabel:setText( Engine.Localize( "MENU_SP_MISSION_KEY" ), 0 )
	MissionLabel:SetFontSize( 22 * _1080p )
	MissionLabel:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	MissionLabel:SetAlignment( LUI.Alignment.Left )
	MissionLabel:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 42, _1080p * 199, _1080p * 9.5, _1080p * -10.5 )
	self:addElement( MissionLabel )
	self.MissionLabel = MissionLabel
	
	local OpsMapIconJA = nil
	
	OpsMapIconJA = MenuBuilder.BuildRegisteredType( "OpsMapIconJA", {
		controllerIndex = f1_local1
	} )
	OpsMapIconJA.id = "OpsMapIconJA"
	OpsMapIconJA:SetScale( -0.75, 0 )
	OpsMapIconJA:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 458.5, _1080p * 581.5, _1080p * -40, _1080p * 83 )
	self:addElement( OpsMapIconJA )
	self.OpsMapIconJA = OpsMapIconJA
	
	local OpsMapIconML = nil
	
	OpsMapIconML = MenuBuilder.BuildRegisteredType( "OpsMapIconML", {
		controllerIndex = f1_local1
	} )
	OpsMapIconML.id = "OpsMapIconML"
	OpsMapIconML:SetScale( -0.75, 0 )
	OpsMapIconML:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -17.38, _1080p * 69.63, _1080p * -30.5, _1080p * 73.5 )
	self:addElement( OpsMapIconML )
	self.OpsMapIconML = OpsMapIconML
	
	local OpsMapIconSA = nil
	
	OpsMapIconSA = MenuBuilder.BuildRegisteredType( "OpsMapIconSA", {
		controllerIndex = f1_local1
	} )
	OpsMapIconSA.id = "OpsMapIconSA"
	OpsMapIconSA:SetScale( -0.75, 0 )
	OpsMapIconSA:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 182.88, _1080p * 356.88, _1080p * -54, _1080p * 97 )
	self:addElement( OpsMapIconSA )
	self.OpsMapIconSA = OpsMapIconSA
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		background:RegisterAnimationSequence( "LevelSelect", {
			{
				function ()
					return self.background:SetAlpha( 0, 0 )
				end
			}
		} )
		JackalLabel:RegisterAnimationSequence( "LevelSelect", {
			{
				function ()
					return self.JackalLabel:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 450, _1080p * 607, _1080p * 11.25, _1080p * -11.25, 0 )
				end
			}
		} )
		ShipAssaultLabel:RegisterAnimationSequence( "LevelSelect", {
			{
				function ()
					return self.ShipAssaultLabel:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 248.27, _1080p * 405.27, _1080p * 11.25, _1080p * -11.25, 0 )
				end
			}
		} )
		MissionLabel:RegisterAnimationSequence( "LevelSelect", {
			{
				function ()
					return self.MissionLabel:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 42, _1080p * 199, _1080p * 11.25, _1080p * -11.25, 0 )
				end
			}
		} )
		OpsMapIconJA:RegisterAnimationSequence( "LevelSelect", {
			{
				function ()
					return self.OpsMapIconJA:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 367.5, _1080p * 490.5, _1080p * -40, _1080p * 83, 0 )
				end
			}
		} )
		OpsMapIconSA:RegisterAnimationSequence( "LevelSelect", {
			{
				function ()
					return self.OpsMapIconSA:SetScale( -0.78, 0 )
				end
			},
			{
				function ()
					return self.OpsMapIconSA:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 140.14, _1080p * 314.14, _1080p * -54, _1080p * 97, 0 )
				end
			}
		} )
		self._sequences.LevelSelect = function ()
			background:AnimateSequence( "LevelSelect" )
			JackalLabel:AnimateSequence( "LevelSelect" )
			ShipAssaultLabel:AnimateSequence( "LevelSelect" )
			MissionLabel:AnimateSequence( "LevelSelect" )
			OpsMapIconJA:AnimateSequence( "LevelSelect" )
			OpsMapIconSA:AnimateSequence( "LevelSelect" )
		end
		
		background:RegisterAnimationSequence( "LevelSelectRightToLeft", {
			{
				function ()
					return self.background:SetAlpha( 0, 0 )
				end
			}
		} )
		JackalLabel:RegisterAnimationSequence( "LevelSelectRightToLeft", {
			{
				function ()
					return self.JackalLabel:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 410, _1080p * 567, _1080p * 11.25, _1080p * -11.25, 0 )
				end
			}
		} )
		ShipAssaultLabel:RegisterAnimationSequence( "LevelSelectRightToLeft", {
			{
				function ()
					return self.ShipAssaultLabel:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 208.27, _1080p * 365.27, _1080p * 11.25, _1080p * -11.25, 0 )
				end
			}
		} )
		MissionLabel:RegisterAnimationSequence( "LevelSelectRightToLeft", {
			{
				function ()
					return self.MissionLabel:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 2, _1080p * 159, _1080p * 11.25, _1080p * -11.25, 0 )
				end
			}
		} )
		OpsMapIconJA:RegisterAnimationSequence( "LevelSelectRightToLeft", {
			{
				function ()
					return self.OpsMapIconJA:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 522.5, _1080p * 645.5, _1080p * -40, _1080p * 83, 0 )
				end
			}
		} )
		OpsMapIconML:RegisterAnimationSequence( "LevelSelectRightToLeft", {
			{
				function ()
					return self.OpsMapIconML:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 131.63, _1080p * 218.63, _1080p * -30.5, _1080p * 73.5, 0 )
				end
			}
		} )
		OpsMapIconSA:RegisterAnimationSequence( "LevelSelectRightToLeft", {
			{
				function ()
					return self.OpsMapIconSA:SetScale( -0.78, 0 )
				end
			},
			{
				function ()
					return self.OpsMapIconSA:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 296.14, _1080p * 470.14, _1080p * -54, _1080p * 97, 0 )
				end
			}
		} )
		self._sequences.LevelSelectRightToLeft = function ()
			background:AnimateSequence( "LevelSelectRightToLeft" )
			JackalLabel:AnimateSequence( "LevelSelectRightToLeft" )
			ShipAssaultLabel:AnimateSequence( "LevelSelectRightToLeft" )
			MissionLabel:AnimateSequence( "LevelSelectRightToLeft" )
			OpsMapIconJA:AnimateSequence( "LevelSelectRightToLeft" )
			OpsMapIconML:AnimateSequence( "LevelSelectRightToLeft" )
			OpsMapIconSA:AnimateSequence( "LevelSelectRightToLeft" )
		end
		
		background:RegisterAnimationSequence( "LevelSelectJapanese", {
			{
				function ()
					return self.background:SetAlpha( 0, 0 )
				end
			}
		} )
		JackalLabel:RegisterAnimationSequence( "LevelSelectJapanese", {
			{
				function ()
					return self.JackalLabel:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 484.78, _1080p * 689.92, _1080p * 11.25, _1080p * -11.25, 0 )
				end
			}
		} )
		ShipAssaultLabel:RegisterAnimationSequence( "LevelSelectJapanese", {
			{
				function ()
					return self.ShipAssaultLabel:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 277.27, _1080p * 440.41, _1080p * 11.25, _1080p * -11.25, 0 )
				end
			}
		} )
		MissionLabel:RegisterAnimationSequence( "LevelSelectJapanese", {
			{
				function ()
					return self.MissionLabel:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 42, _1080p * 227.14, _1080p * 11.25, _1080p * -11.25, 0 )
				end
			}
		} )
		OpsMapIconJA:RegisterAnimationSequence( "LevelSelectJapanese", {
			{
				function ()
					return self.OpsMapIconJA:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 403.28, _1080p * 526.28, _1080p * -40, _1080p * 83, 0 )
				end
			}
		} )
		OpsMapIconSA:RegisterAnimationSequence( "LevelSelectJapanese", {
			{
				function ()
					return self.OpsMapIconSA:SetScale( -0.78, 0 )
				end
			},
			{
				function ()
					return self.OpsMapIconSA:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 169.14, _1080p * 343.14, _1080p * -54, _1080p * 97, 0 )
				end
			}
		} )
		self._sequences.LevelSelectJapanese = function ()
			background:AnimateSequence( "LevelSelectJapanese" )
			JackalLabel:AnimateSequence( "LevelSelectJapanese" )
			ShipAssaultLabel:AnimateSequence( "LevelSelectJapanese" )
			MissionLabel:AnimateSequence( "LevelSelectJapanese" )
			OpsMapIconJA:AnimateSequence( "LevelSelectJapanese" )
			OpsMapIconSA:AnimateSequence( "LevelSelectJapanese" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "MissionTypeLegend", MissionTypeLegend )
LockTable( _M )

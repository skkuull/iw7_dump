local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.AwardText, "WARNING: Award Items Are Missing..." )
	local f1_local0 = f1_arg0.AwardText
	f1_local0:SetDecodeParams( 20, 3, 4 )
	f1_local0:SetShadowMinDistance( -0.2, 0 )
	f1_local0:SetShadowMaxDistance( 0.2, 0 )
	f1_local0:SetShadowRGBFromInt( 0, 0 )
	f1_local0:SetShadowUOffset( -0 )
	f1_local0:SetShadowVOffset( -0 )
	f1_arg0:SetGlitchEnabled( true )
	f1_arg0:SetGlitchBlockWidth( math.random( 15, 20 ) )
	f1_arg0:SetGlitchBlockHeight( math.random( 15, 20 ) )
	f1_arg0:SetGlitchDistortionRange( math.random( 1, 80 ) )
	f1_arg0:SetGlitchScanlinePitch( 1 )
	f1_arg0:SetGlitchMaskPitch( 1 )
	local f1_local1 = function ()
		f1_arg0:SetGlitchAmount( 0 )
		f1_arg0:SetAlpha( 0 )
		f1_arg0:SetScale( 1 )
		f1_arg0:SetAlpha( 1, 150, LUI.EASING.outBack )
		f1_arg0:SetScale( 0, 150, LUI.EASING.outBack )
		local f2_local0 = f1_arg0:getParent()
		if f2_local0._numAlive == 0 then
			Engine.PlaySound( "ui_iw7_medal_slam" )
		else
			Engine.PlaySound( "ui_iw7_medal_slam_afterfirst" )
		end
	end
	
	f1_arg0:addEventHandler( "feed_expiration", function ()
		f1_arg0:SetGlitchAmount( 1 )
		f1_arg0:SetAlpha( 0, 100, LUI.EASING.inBack )
	end )
	f1_arg0.AwardIcon:SubscribeToModelThroughElement( f1_arg0, "icon", function ( f4_arg0 )
		local f4_local0 = DataModel.GetModelValue( f4_arg0 )
		if f4_local0 ~= nil then
			f1_arg0.AwardIcon:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	f1_arg0.AwardText:SubscribeToModelThroughElement( f1_arg0, "text", function ( f5_arg0 )
		f1_local1()
		local f5_local0 = DataModel.GetModelValue( f5_arg0 )
		if f5_local0 ~= nil then
			f1_arg0.AwardText:setText( ToUpperCase( LocalizeString( f5_local0 ) ), 0 )
		end
	end )
end

function Award( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 227 * _1080p )
	self.id = "Award"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local AwardIcon = nil
	
	AwardIcon = LUI.UIImage.new()
	AwardIcon.id = "AwardIcon"
	AwardIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -96, _1080p * 96, 0, _1080p * 192 )
	self:addElement( AwardIcon )
	self.AwardIcon = AwardIcon
	
	local AwardText = nil
	
	AwardText = LUI.UIStyledText.new()
	AwardText.id = "AwardText"
	AwardText:setText( ToUpperCase( LocalizeString( Engine.Localize( "MENU_NEW" ) ) ), 0 )
	AwardText:SetFontSize( 30 * _1080p )
	AwardText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	AwardText:SetAlignment( LUI.Alignment.Center )
	AwardText:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -212.5, _1080p * 212.5, _1080p * -58, _1080p * -28 )
	self:addElement( AwardText )
	self.AwardText = AwardText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AwardIcon:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.AwardIcon:SetScale( 1, 0 )
				end,
				function ()
					return self.AwardIcon:SetScale( 0, 150, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AwardIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AwardIcon:SetAlpha( 1, 150, LUI.EASING.outBack )
				end
			}
		} )
		AwardText:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.AwardText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AwardText:SetAlpha( 1, 150, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AwardText:SetScale( 0, 150, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Intro = function ()
			AwardIcon:AnimateSequence( "Intro" )
			AwardText:AnimateSequence( "Intro" )
		end
		
		AwardIcon:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.AwardIcon:SetAlpha( 1, 0 )
				end,
				function ()
					return self.AwardIcon:SetAlpha( 0, 150, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.AwardIcon:SetScale( 0, 0 )
				end,
				function ()
					return self.AwardIcon:SetScale( -0.5, 150, LUI.EASING.inBack )
				end
			}
		} )
		AwardText:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.AwardText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.AwardText:SetAlpha( 0, 150, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.AwardText:SetScale( 0, 0 )
				end
			}
		} )
		self._sequences.Outro = function ()
			AwardIcon:AnimateSequence( "Outro" )
			AwardText:AnimateSequence( "Outro" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "Award", Award )
LockTable( _M )

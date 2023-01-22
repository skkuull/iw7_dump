local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	assert( f1_arg0.RigDescription )
	f1_arg0.RigDescription:SetShadowRGBFromInt( GetIntForColor( COLORS.white ), 0 )
end

function RigDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 66 * _1080p, 0, 1080 * _1080p )
	self.id = "RigDetails"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local RigName = nil
	
	RigName = LUI.UIStyledText.new()
	RigName.id = "RigName"
	RigName:SetAlpha( 0.3, 0 )
	RigName:SetZRotation( 90, 0 )
	RigName:SetFontSize( 38 * _1080p )
	RigName:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	RigName:SetAlignment( LUI.Alignment.Center )
	RigName:SetOptOutRightToLeftAlignmentFlip( true )
	RigName:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -306.5, _1080p * 306.5, _1080p * 281.5, _1080p * 319.5 )
	RigName:SubscribeToModelThroughElement( self, "name", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.name:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			RigName:setText( f3_local0, 0 )
		end
	end )
	self:addElement( RigName )
	self.RigName = RigName
	
	local Square = nil
	
	Square = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 6,
		borderThicknessRight = _1080p * 6,
		borderThicknessTop = _1080p * 6,
		borderThicknessBottom = _1080p * 7
	} )
	Square.id = "Square"
	Square:SetAlpha( 0.3, 0 )
	Square:SetBorderThicknessLeft( _1080p * 6, 0 )
	Square:SetBorderThicknessRight( _1080p * 6, 0 )
	Square:SetBorderThicknessTop( _1080p * 6, 0 )
	Square:SetBorderThicknessBottom( _1080p * 7, 0 )
	Square:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -14, _1080p * 14, _1080p * -808.5, _1080p * -780.5 )
	self:addElement( Square )
	self.Square = Square
	
	local RigNumber = nil
	
	RigNumber = LUI.UIStyledText.new()
	RigNumber.id = "RigNumber"
	RigNumber:SetAlpha( 0.3, 0 )
	RigNumber:SetZRotation( 90, 0 )
	RigNumber:SetFontSize( 48 * _1080p )
	RigNumber:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	RigNumber:SetAlignment( LUI.Alignment.Left )
	RigNumber:SetDecodeLetterLength( 100 )
	RigNumber:SetDecodeMaxRandChars( 7 )
	RigNumber:SetDecodeUpdatesPerLetter( 10 )
	RigNumber:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -249.82, _1080p * 250.18, _1080p * -555, _1080p * -507 )
	RigNumber:SubscribeToModelThroughElement( self, "rigIndex", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.rigIndex:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			RigNumber:setText( ToUpperCase( f4_local0 ), 0 )
		end
	end )
	self:addElement( RigNumber )
	self.RigNumber = RigNumber
	
	local DescriptionAnchor = nil
	
	DescriptionAnchor = LUI.UIImage.new()
	DescriptionAnchor.id = "DescriptionAnchor"
	DescriptionAnchor:SetAlpha( 0.3, 0 )
	DescriptionAnchor:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -20, _1080p * 20, _1080p * -429, _1080p * -425 )
	self:addElement( DescriptionAnchor )
	self.DescriptionAnchor = DescriptionAnchor
	
	local RigDescription = nil
	
	RigDescription = LUI.UIStyledText.new()
	RigDescription.id = "RigDescription"
	RigDescription:SetAlpha( 0.3, 0 )
	RigDescription:SetZRotation( 90, 0 )
	RigDescription:SetFontSize( 18 * _1080p )
	RigDescription:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RigDescription:SetAlignment( LUI.Alignment.Left )
	RigDescription:SetDecodeLetterLength( 10 )
	RigDescription:SetDecodeMaxRandChars( 3 )
	RigDescription:SetDecodeUpdatesPerLetter( 4 )
	RigDescription:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -185, _1080p * 157, _1080p * -76.5, _1080p * -58.5 )
	RigDescription:SubscribeToModelThroughElement( self, "desc", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.desc:GetValue( f2_local1 )
		if f5_local0 ~= nil then
			RigDescription:setText( f5_local0, 0 )
		end
	end )
	self:addElement( RigDescription )
	self.RigDescription = RigDescription
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RigName:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.RigName:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.RigName:SetAlpha( 0.9, 0 )
				end
			}
		} )
		Square:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.Square:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Square:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		RigNumber:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.RigNumber:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.RigNumber:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		DescriptionAnchor:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.DescriptionAnchor:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.DescriptionAnchor:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		RigDescription:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.RigDescription:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.RigDescription:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.Focused = function ()
			RigName:AnimateSequence( "Focused" )
			Square:AnimateSequence( "Focused" )
			RigNumber:AnimateSequence( "Focused" )
			DescriptionAnchor:AnimateSequence( "Focused" )
			RigDescription:AnimateSequence( "Focused" )
		end
		
		RigName:RegisterAnimationSequence( "NotFocused", {
			{
				function ()
					return self.RigName:SetAlpha( 0.4, 0 )
				end
			},
			{
				function ()
					return self.RigName:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
				end
			}
		} )
		Square:RegisterAnimationSequence( "NotFocused", {
			{
				function ()
					return self.Square:SetAlpha( 0.4, 0 )
				end
			},
			{
				function ()
					return self.Square:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
				end
			}
		} )
		RigNumber:RegisterAnimationSequence( "NotFocused", {
			{
				function ()
					return self.RigNumber:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
				end
			},
			{
				function ()
					return self.RigNumber:SetAlpha( 0.4, 0 )
				end
			}
		} )
		DescriptionAnchor:RegisterAnimationSequence( "NotFocused", {
			{
				function ()
					return self.DescriptionAnchor:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
				end
			},
			{
				function ()
					return self.DescriptionAnchor:SetAlpha( 0.4, 0 )
				end
			}
		} )
		RigDescription:RegisterAnimationSequence( "NotFocused", {
			{
				function ()
					return self.RigDescription:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
				end
			},
			{
				function ()
					return self.RigDescription:SetAlpha( 0.4, 0 )
				end
			}
		} )
		self._sequences.NotFocused = function ()
			RigName:AnimateSequence( "NotFocused" )
			Square:AnimateSequence( "NotFocused" )
			RigNumber:AnimateSequence( "NotFocused" )
			DescriptionAnchor:AnimateSequence( "NotFocused" )
			RigDescription:AnimateSequence( "NotFocused" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "RigDetails", RigDetails )
LockTable( _M )

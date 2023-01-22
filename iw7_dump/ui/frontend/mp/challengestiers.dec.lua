local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "tierCount", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.tierCount:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			for f2_local1 = 1, 5, 1 do
				local f2_local4 = f1_arg0["box" .. tostring( f2_local1 )]
				local f2_local5 = f2_local4
				f2_local4 = f2_local4.SetAlpha
				local f2_local6
				if f2_local0 < f2_local1 then
					f2_local6 = 0
					if not f2_local6 then
					
					else
						f2_local4( f2_local5, f2_local6, 0 )
						f2_local4 = f1_arg0["number" .. tostring( f2_local1 )]
						f2_local5 = f2_local4
						f2_local4 = f2_local4.SetAlpha
						if f2_local0 < f2_local1 then
							f2_local6 = 0
							if not f2_local6 then
							
							else
								f2_local4( f2_local5, f2_local6, 0 )
							end
						end
						f2_local6 = 1
					end
				end
				f2_local6 = 1
			end
		end
	end )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "currentTier", function ()
		local f3_local0 = f1_arg0:GetDataSource()
		f3_local0 = f3_local0.currentTier:GetValue( f1_arg1 )
		if f3_local0 ~= nil then
			ACTIONS.AnimateSequence( f1_arg0, "Tier" .. tostring( f3_local0 + 1 ) )
		end
		local f3_local1 = f1_arg0:GetDataSource()
		f3_local1 = f3_local1.tierCount:GetValue( f1_arg1 )
		if f3_local1 ~= nil then
			for f3_local2 = f3_local1 + 1, 5, 1 do
				ACTIONS.AnimateSequence( f1_arg0, "ClearTier" .. tostring( f3_local2 ) )
			end
		end
	end )
end

function ChallengesTiers( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 520 * _1080p, 0, 76 * _1080p )
	self.id = "ChallengesTiers"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local box1 = nil
	
	box1 = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	box1.id = "box1"
	box1:SetRGBFromTable( SWATCHES.genericButton.border, 0 )
	box1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32, _1080p * 121, _1080p * 19, _1080p * 56 )
	self:addElement( box1 )
	self.box1 = box1
	
	local highlight1 = nil
	
	highlight1 = LUI.UIImage.new()
	highlight1.id = "highlight1"
	highlight1:setImage( RegisterMaterial( "challenges_tier" ), 0 )
	highlight1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 18, _1080p * 134, _1080p * 10, _1080p * 68 )
	self:addElement( highlight1 )
	self.highlight1 = highlight1
	
	local number1 = nil
	
	number1 = LUI.UIText.new()
	number1.id = "number1"
	number1:SetRGBFromInt( 0, 0 )
	number1:setText( "1", 0 )
	number1:SetFontSize( 28 * _1080p )
	number1:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	number1:SetAlignment( LUI.Alignment.Center )
	number1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30, _1080p * 122, _1080p * 24, _1080p * 52 )
	self:addElement( number1 )
	self.number1 = number1
	
	local box2 = nil
	
	box2 = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	box2.id = "box2"
	box2:SetRGBFromTable( SWATCHES.genericButton.border, 0 )
	box2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 125, _1080p * 214, _1080p * 19, _1080p * 56 )
	self:addElement( box2 )
	self.box2 = box2
	
	local highlight2 = nil
	
	highlight2 = LUI.UIImage.new()
	highlight2.id = "highlight2"
	highlight2:SetAlpha( 0, 0 )
	highlight2:setImage( RegisterMaterial( "challenges_tier" ), 0 )
	highlight2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 112, _1080p * 228, _1080p * 10, _1080p * 68 )
	self:addElement( highlight2 )
	self.highlight2 = highlight2
	
	local number2 = nil
	
	number2 = LUI.UIText.new()
	number2.id = "number2"
	number2:SetAlpha( 0.37, 0 )
	number2:setText( "2", 0 )
	number2:SetFontSize( 28 * _1080p )
	number2:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	number2:SetAlignment( LUI.Alignment.Center )
	number2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 124, _1080p * 216, _1080p * 24, _1080p * 52 )
	self:addElement( number2 )
	self.number2 = number2
	
	local box3 = nil
	
	box3 = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	box3.id = "box3"
	box3:SetRGBFromTable( SWATCHES.genericButton.border, 0 )
	box3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 218, _1080p * 307, _1080p * 19, _1080p * 56 )
	self:addElement( box3 )
	self.box3 = box3
	
	local highlight3 = nil
	
	highlight3 = LUI.UIImage.new()
	highlight3.id = "highlight3"
	highlight3:SetAlpha( 0, 0 )
	highlight3:setImage( RegisterMaterial( "challenges_tier" ), 0 )
	highlight3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 206, _1080p * 320, _1080p * 10, _1080p * 68 )
	self:addElement( highlight3 )
	self.highlight3 = highlight3
	
	local number3 = nil
	
	number3 = LUI.UIText.new()
	number3.id = "number3"
	number3:SetAlpha( 0.37, 0 )
	number3:setText( "3", 0 )
	number3:SetFontSize( 28 * _1080p )
	number3:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	number3:SetAlignment( LUI.Alignment.Center )
	number3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 217, _1080p * 309, _1080p * 24, _1080p * 52 )
	self:addElement( number3 )
	self.number3 = number3
	
	local box4 = nil
	
	box4 = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	box4.id = "box4"
	box4:SetRGBFromTable( SWATCHES.genericButton.border, 0 )
	box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 311, _1080p * 400, _1080p * 19, _1080p * 56 )
	self:addElement( box4 )
	self.box4 = box4
	
	local highlight4 = nil
	
	highlight4 = LUI.UIImage.new()
	highlight4.id = "highlight4"
	highlight4:SetAlpha( 0, 0 )
	highlight4:setImage( RegisterMaterial( "challenges_tier" ), 0 )
	highlight4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 297.64, _1080p * 413.64, _1080p * 10, _1080p * 68 )
	self:addElement( highlight4 )
	self.highlight4 = highlight4
	
	local number4 = nil
	
	number4 = LUI.UIText.new()
	number4.id = "number4"
	number4:SetAlpha( 0.37, 0 )
	number4:setText( "4", 0 )
	number4:SetFontSize( 28 * _1080p )
	number4:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	number4:SetAlignment( LUI.Alignment.Center )
	number4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 309.64, _1080p * 401.64, _1080p * 24, _1080p * 52 )
	self:addElement( number4 )
	self.number4 = number4
	
	local box5 = nil
	
	box5 = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	box5.id = "box5"
	box5:SetRGBFromTable( SWATCHES.genericButton.border, 0 )
	box5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 404, _1080p * 493, _1080p * 19, _1080p * 56 )
	self:addElement( box5 )
	self.box5 = box5
	
	local highlight5 = nil
	
	highlight5 = LUI.UIImage.new()
	highlight5.id = "highlight5"
	highlight5:SetAlpha( 0, 0 )
	highlight5:setImage( RegisterMaterial( "challenges_tier" ), 0 )
	highlight5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 390.64, _1080p * 506.64, _1080p * 10, _1080p * 68 )
	self:addElement( highlight5 )
	self.highlight5 = highlight5
	
	local number5 = nil
	
	number5 = LUI.UIText.new()
	number5.id = "number5"
	number5:SetAlpha( 0.37, 0 )
	number5:setText( "5", 0 )
	number5:SetFontSize( 28 * _1080p )
	number5:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	number5:SetAlignment( LUI.Alignment.Center )
	number5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 404.64, _1080p * 496.64, _1080p * 24, _1080p * 52 )
	self:addElement( number5 )
	self.number5 = number5
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		box1:RegisterAnimationSequence( "Tier1", {
			{
				function ()
					return self.box1:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight1:RegisterAnimationSequence( "Tier1", {
			{
				function ()
					return self.highlight1:SetAlpha( 1, 0 )
				end
			}
		} )
		number1:RegisterAnimationSequence( "Tier1", {
			{
				function ()
					return self.number1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.number1:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		box2:RegisterAnimationSequence( "Tier1", {
			{
				function ()
					return self.box2:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight2:RegisterAnimationSequence( "Tier1", {
			{
				function ()
					return self.highlight2:SetAlpha( 0, 0 )
				end
			}
		} )
		number2:RegisterAnimationSequence( "Tier1", {
			{
				function ()
					return self.number2:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number2:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		box3:RegisterAnimationSequence( "Tier1", {
			{
				function ()
					return self.box3:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight3:RegisterAnimationSequence( "Tier1", {
			{
				function ()
					return self.highlight3:SetAlpha( 0, 0 )
				end
			}
		} )
		number3:RegisterAnimationSequence( "Tier1", {
			{
				function ()
					return self.number3:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number3:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		box4:RegisterAnimationSequence( "Tier1", {
			{
				function ()
					return self.box4:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight4:RegisterAnimationSequence( "Tier1", {
			{
				function ()
					return self.highlight4:SetAlpha( 0, 0 )
				end
			}
		} )
		number4:RegisterAnimationSequence( "Tier1", {
			{
				function ()
					return self.number4:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number4:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		box5:RegisterAnimationSequence( "Tier1", {
			{
				function ()
					return self.box5:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight5:RegisterAnimationSequence( "Tier1", {
			{
				function ()
					return self.highlight5:SetAlpha( 0, 0 )
				end
			}
		} )
		number5:RegisterAnimationSequence( "Tier1", {
			{
				function ()
					return self.number5:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number5:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.Tier1 = function ()
			box1:AnimateSequence( "Tier1" )
			highlight1:AnimateSequence( "Tier1" )
			number1:AnimateSequence( "Tier1" )
			box2:AnimateSequence( "Tier1" )
			highlight2:AnimateSequence( "Tier1" )
			number2:AnimateSequence( "Tier1" )
			box3:AnimateSequence( "Tier1" )
			highlight3:AnimateSequence( "Tier1" )
			number3:AnimateSequence( "Tier1" )
			box4:AnimateSequence( "Tier1" )
			highlight4:AnimateSequence( "Tier1" )
			number4:AnimateSequence( "Tier1" )
			box5:AnimateSequence( "Tier1" )
			highlight5:AnimateSequence( "Tier1" )
			number5:AnimateSequence( "Tier1" )
		end
		
		box1:RegisterAnimationSequence( "Tier2", {
			{
				function ()
					return self.box1:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight1:RegisterAnimationSequence( "Tier2", {
			{
				function ()
					return self.highlight1:SetAlpha( 0, 0 )
				end
			}
		} )
		number1:RegisterAnimationSequence( "Tier2", {
			{
				function ()
					return self.number1:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number1:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		box2:RegisterAnimationSequence( "Tier2", {
			{
				function ()
					return self.box2:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight2:RegisterAnimationSequence( "Tier2", {
			{
				function ()
					return self.highlight2:SetAlpha( 1, 0 )
				end
			}
		} )
		number2:RegisterAnimationSequence( "Tier2", {
			{
				function ()
					return self.number2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.number2:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		box3:RegisterAnimationSequence( "Tier2", {
			{
				function ()
					return self.box3:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight3:RegisterAnimationSequence( "Tier2", {
			{
				function ()
					return self.highlight3:SetAlpha( 0, 0 )
				end
			}
		} )
		number3:RegisterAnimationSequence( "Tier2", {
			{
				function ()
					return self.number3:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number3:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		box4:RegisterAnimationSequence( "Tier2", {
			{
				function ()
					return self.box4:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight4:RegisterAnimationSequence( "Tier2", {
			{
				function ()
					return self.highlight4:SetAlpha( 0, 0 )
				end
			}
		} )
		number4:RegisterAnimationSequence( "Tier2", {
			{
				function ()
					return self.number4:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number4:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		box5:RegisterAnimationSequence( "Tier2", {
			{
				function ()
					return self.box5:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight5:RegisterAnimationSequence( "Tier2", {
			{
				function ()
					return self.highlight5:SetAlpha( 0, 0 )
				end
			}
		} )
		number5:RegisterAnimationSequence( "Tier2", {
			{
				function ()
					return self.number5:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number5:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.Tier2 = function ()
			box1:AnimateSequence( "Tier2" )
			highlight1:AnimateSequence( "Tier2" )
			number1:AnimateSequence( "Tier2" )
			box2:AnimateSequence( "Tier2" )
			highlight2:AnimateSequence( "Tier2" )
			number2:AnimateSequence( "Tier2" )
			box3:AnimateSequence( "Tier2" )
			highlight3:AnimateSequence( "Tier2" )
			number3:AnimateSequence( "Tier2" )
			box4:AnimateSequence( "Tier2" )
			highlight4:AnimateSequence( "Tier2" )
			number4:AnimateSequence( "Tier2" )
			box5:AnimateSequence( "Tier2" )
			highlight5:AnimateSequence( "Tier2" )
			number5:AnimateSequence( "Tier2" )
		end
		
		box1:RegisterAnimationSequence( "Tier3", {
			{
				function ()
					return self.box1:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight1:RegisterAnimationSequence( "Tier3", {
			{
				function ()
					return self.highlight1:SetAlpha( 0, 0 )
				end
			}
		} )
		number1:RegisterAnimationSequence( "Tier3", {
			{
				function ()
					return self.number1:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number1:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		box2:RegisterAnimationSequence( "Tier3", {
			{
				function ()
					return self.box2:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight2:RegisterAnimationSequence( "Tier3", {
			{
				function ()
					return self.highlight2:SetAlpha( 0, 0 )
				end
			}
		} )
		number2:RegisterAnimationSequence( "Tier3", {
			{
				function ()
					return self.number2:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number2:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		box3:RegisterAnimationSequence( "Tier3", {
			{
				function ()
					return self.box3:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight3:RegisterAnimationSequence( "Tier3", {
			{
				function ()
					return self.highlight3:SetAlpha( 1, 0 )
				end
			}
		} )
		number3:RegisterAnimationSequence( "Tier3", {
			{
				function ()
					return self.number3:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.number3:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		box4:RegisterAnimationSequence( "Tier3", {
			{
				function ()
					return self.box4:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight4:RegisterAnimationSequence( "Tier3", {
			{
				function ()
					return self.highlight4:SetAlpha( 0, 0 )
				end
			}
		} )
		number4:RegisterAnimationSequence( "Tier3", {
			{
				function ()
					return self.number4:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number4:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		box5:RegisterAnimationSequence( "Tier3", {
			{
				function ()
					return self.box5:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight5:RegisterAnimationSequence( "Tier3", {
			{
				function ()
					return self.highlight5:SetAlpha( 0, 0 )
				end
			}
		} )
		number5:RegisterAnimationSequence( "Tier3", {
			{
				function ()
					return self.number5:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number5:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.Tier3 = function ()
			box1:AnimateSequence( "Tier3" )
			highlight1:AnimateSequence( "Tier3" )
			number1:AnimateSequence( "Tier3" )
			box2:AnimateSequence( "Tier3" )
			highlight2:AnimateSequence( "Tier3" )
			number2:AnimateSequence( "Tier3" )
			box3:AnimateSequence( "Tier3" )
			highlight3:AnimateSequence( "Tier3" )
			number3:AnimateSequence( "Tier3" )
			box4:AnimateSequence( "Tier3" )
			highlight4:AnimateSequence( "Tier3" )
			number4:AnimateSequence( "Tier3" )
			box5:AnimateSequence( "Tier3" )
			highlight5:AnimateSequence( "Tier3" )
			number5:AnimateSequence( "Tier3" )
		end
		
		box1:RegisterAnimationSequence( "Tier4", {
			{
				function ()
					return self.box1:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight1:RegisterAnimationSequence( "Tier4", {
			{
				function ()
					return self.highlight1:SetAlpha( 0, 0 )
				end
			}
		} )
		number1:RegisterAnimationSequence( "Tier4", {
			{
				function ()
					return self.number1:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number1:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		box2:RegisterAnimationSequence( "Tier4", {
			{
				function ()
					return self.box2:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight2:RegisterAnimationSequence( "Tier4", {
			{
				function ()
					return self.highlight2:SetAlpha( 0, 0 )
				end
			}
		} )
		number2:RegisterAnimationSequence( "Tier4", {
			{
				function ()
					return self.number2:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number2:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		box3:RegisterAnimationSequence( "Tier4", {
			{
				function ()
					return self.box3:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight3:RegisterAnimationSequence( "Tier4", {
			{
				function ()
					return self.highlight3:SetAlpha( 0, 0 )
				end
			}
		} )
		number3:RegisterAnimationSequence( "Tier4", {
			{
				function ()
					return self.number3:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number3:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		box4:RegisterAnimationSequence( "Tier4", {
			{
				function ()
					return self.box4:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight4:RegisterAnimationSequence( "Tier4", {
			{
				function ()
					return self.highlight4:SetAlpha( 1, 0 )
				end
			}
		} )
		number4:RegisterAnimationSequence( "Tier4", {
			{
				function ()
					return self.number4:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.number4:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		box5:RegisterAnimationSequence( "Tier4", {
			{
				function ()
					return self.box5:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight5:RegisterAnimationSequence( "Tier4", {
			{
				function ()
					return self.highlight5:SetAlpha( 0, 0 )
				end
			}
		} )
		number5:RegisterAnimationSequence( "Tier4", {
			{
				function ()
					return self.number5:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number5:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.Tier4 = function ()
			box1:AnimateSequence( "Tier4" )
			highlight1:AnimateSequence( "Tier4" )
			number1:AnimateSequence( "Tier4" )
			box2:AnimateSequence( "Tier4" )
			highlight2:AnimateSequence( "Tier4" )
			number2:AnimateSequence( "Tier4" )
			box3:AnimateSequence( "Tier4" )
			highlight3:AnimateSequence( "Tier4" )
			number3:AnimateSequence( "Tier4" )
			box4:AnimateSequence( "Tier4" )
			highlight4:AnimateSequence( "Tier4" )
			number4:AnimateSequence( "Tier4" )
			box5:AnimateSequence( "Tier4" )
			highlight5:AnimateSequence( "Tier4" )
			number5:AnimateSequence( "Tier4" )
		end
		
		box1:RegisterAnimationSequence( "Tier5", {
			{
				function ()
					return self.box1:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight1:RegisterAnimationSequence( "Tier5", {
			{
				function ()
					return self.highlight1:SetAlpha( 0, 0 )
				end
			}
		} )
		number1:RegisterAnimationSequence( "Tier5", {
			{
				function ()
					return self.number1:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number1:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		box2:RegisterAnimationSequence( "Tier5", {
			{
				function ()
					return self.box2:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight2:RegisterAnimationSequence( "Tier5", {
			{
				function ()
					return self.highlight2:SetAlpha( 0, 0 )
				end
			}
		} )
		number2:RegisterAnimationSequence( "Tier5", {
			{
				function ()
					return self.number2:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number2:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		box3:RegisterAnimationSequence( "Tier5", {
			{
				function ()
					return self.box3:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight3:RegisterAnimationSequence( "Tier5", {
			{
				function ()
					return self.highlight3:SetAlpha( 0, 0 )
				end
			}
		} )
		number3:RegisterAnimationSequence( "Tier5", {
			{
				function ()
					return self.number3:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number3:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		box4:RegisterAnimationSequence( "Tier5", {
			{
				function ()
					return self.box4:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight4:RegisterAnimationSequence( "Tier5", {
			{
				function ()
					return self.highlight4:SetAlpha( 0, 0 )
				end
			}
		} )
		number4:RegisterAnimationSequence( "Tier5", {
			{
				function ()
					return self.number4:SetAlpha( 0.37, 0 )
				end
			},
			{
				function ()
					return self.number4:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		box5:RegisterAnimationSequence( "Tier5", {
			{
				function ()
					return self.box5:SetAlpha( 1, 0 )
				end
			}
		} )
		highlight5:RegisterAnimationSequence( "Tier5", {
			{
				function ()
					return self.highlight5:SetAlpha( 1, 0 )
				end
			}
		} )
		number5:RegisterAnimationSequence( "Tier5", {
			{
				function ()
					return self.number5:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.number5:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.Tier5 = function ()
			box1:AnimateSequence( "Tier5" )
			highlight1:AnimateSequence( "Tier5" )
			number1:AnimateSequence( "Tier5" )
			box2:AnimateSequence( "Tier5" )
			highlight2:AnimateSequence( "Tier5" )
			number2:AnimateSequence( "Tier5" )
			box3:AnimateSequence( "Tier5" )
			highlight3:AnimateSequence( "Tier5" )
			number3:AnimateSequence( "Tier5" )
			box4:AnimateSequence( "Tier5" )
			highlight4:AnimateSequence( "Tier5" )
			number4:AnimateSequence( "Tier5" )
			box5:AnimateSequence( "Tier5" )
			highlight5:AnimateSequence( "Tier5" )
			number5:AnimateSequence( "Tier5" )
		end
		
		box1:RegisterAnimationSequence( "ClearTier1", {
			{
				function ()
					return self.box1:SetAlpha( 0, 0 )
				end
			}
		} )
		number1:RegisterAnimationSequence( "ClearTier1", {
			{
				function ()
					return self.number1:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ClearTier1 = function ()
			box1:AnimateSequence( "ClearTier1" )
			number1:AnimateSequence( "ClearTier1" )
		end
		
		box2:RegisterAnimationSequence( "ClearTier2", {
			{
				function ()
					return self.box2:SetAlpha( 0, 0 )
				end
			}
		} )
		number2:RegisterAnimationSequence( "ClearTier2", {
			{
				function ()
					return self.number2:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ClearTier2 = function ()
			box2:AnimateSequence( "ClearTier2" )
			number2:AnimateSequence( "ClearTier2" )
		end
		
		box3:RegisterAnimationSequence( "ClearTier3", {
			{
				function ()
					return self.box3:SetAlpha( 0, 0 )
				end
			}
		} )
		number3:RegisterAnimationSequence( "ClearTier3", {
			{
				function ()
					return self.number3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ClearTier3 = function ()
			box3:AnimateSequence( "ClearTier3" )
			number3:AnimateSequence( "ClearTier3" )
		end
		
		box4:RegisterAnimationSequence( "ClearTier4", {
			{
				function ()
					return self.box4:SetAlpha( 0, 0 )
				end
			}
		} )
		number4:RegisterAnimationSequence( "ClearTier4", {
			{
				function ()
					return self.number4:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ClearTier4 = function ()
			box4:AnimateSequence( "ClearTier4" )
			number4:AnimateSequence( "ClearTier4" )
		end
		
		box5:RegisterAnimationSequence( "ClearTier5", {
			{
				function ()
					return self.box5:SetAlpha( 0, 0 )
				end
			}
		} )
		number5:RegisterAnimationSequence( "ClearTier5", {
			{
				function ()
					return self.number5:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ClearTier5 = function ()
			box5:AnimateSequence( "ClearTier5" )
			number5:AnimateSequence( "ClearTier5" )
		end
		
		highlight1:RegisterAnimationSequence( "CPColorHighlight", {
			{
				function ()
					return self.highlight1:SetRGBFromInt( 16745216, 0 )
				end
			}
		} )
		highlight2:RegisterAnimationSequence( "CPColorHighlight", {
			{
				function ()
					return self.highlight2:SetRGBFromInt( 16745216, 0 )
				end
			}
		} )
		highlight3:RegisterAnimationSequence( "CPColorHighlight", {
			{
				function ()
					return self.highlight3:SetRGBFromInt( 16745216, 0 )
				end
			}
		} )
		highlight4:RegisterAnimationSequence( "CPColorHighlight", {
			{
				function ()
					return self.highlight4:SetRGBFromInt( 16745216, 0 )
				end
			}
		} )
		highlight5:RegisterAnimationSequence( "CPColorHighlight", {
			{
				function ()
					return self.highlight5:SetRGBFromInt( 16745216, 0 )
				end
			}
		} )
		self._sequences.CPColorHighlight = function ()
			highlight1:AnimateSequence( "CPColorHighlight" )
			highlight2:AnimateSequence( "CPColorHighlight" )
			highlight3:AnimateSequence( "CPColorHighlight" )
			highlight4:AnimateSequence( "CPColorHighlight" )
			highlight5:AnimateSequence( "CPColorHighlight" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f4_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPColorHighlight" )
	end
	return self
end

MenuBuilder.registerType( "ChallengesTiers", ChallengesTiers )
LockTable( _M )

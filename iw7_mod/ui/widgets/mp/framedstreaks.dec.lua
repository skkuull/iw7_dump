local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	if CONDITIONS.UseCACBreadCrumbs() then
		assert( f1_arg0.NewItemNotification )
		local f1_local0 = Rewards.IsTypeNew( f1_arg1, "killstreak" )
		if CONDITIONS.AreLootStreaksEnabled() and not f1_local0 then
			f1_local0 = LOOT.AreAnyLastLootItemsInCSV( f1_arg1, CSV.streakLootMaster.file )
		end
		if f1_local0 then
			f1_arg0.NewItemNotification:SetAlpha( 1, 0 )
		end
	end
	if IsLanguageArabic() then
		f1_arg0.Lock:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -340, _1080p * -314, _1080p * -54, _1080p * -28 )
	end
end

function FramedStreaks( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 360 * _1080p, 0, 112 * _1080p )
	self.id = "FramedStreaks"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local TitleBackground = nil
	
	TitleBackground = MenuBuilder.BuildRegisteredType( "GenericListArrowButtonBackground", {
		controllerIndex = f2_local1
	} )
	TitleBackground.id = "TitleBackground"
	TitleBackground.DropShadow:SetAlpha( 0, 0 )
	TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local ImageBacker = nil
	
	ImageBacker = LUI.UIImage.new()
	ImageBacker.id = "ImageBacker"
	ImageBacker:SetRGBFromInt( 0, 0 )
	ImageBacker:SetAlpha( 0.24, 0 )
	ImageBacker:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 35, 0 )
	self:addElement( ImageBacker )
	self.ImageBacker = ImageBacker
	
	local ScoreGradient = nil
	
	ScoreGradient = LUI.UIImage.new()
	ScoreGradient.id = "ScoreGradient"
	ScoreGradient:SetRGBFromInt( 0, 0 )
	ScoreGradient:SetAlpha( 0.6, 0 )
	ScoreGradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	ScoreGradient:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -24, 0 )
	self:addElement( ScoreGradient )
	self.ScoreGradient = ScoreGradient
	
	local FrameLabel = nil
	
	FrameLabel = LUI.UIText.new()
	FrameLabel.id = "FrameLabel"
	FrameLabel:SetRGBFromInt( 14277081, 0 )
	FrameLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_SCORESTREAKS" ) ), 0 )
	FrameLabel:SetFontSize( 22 * _1080p )
	FrameLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FrameLabel:SetAlignment( LUI.Alignment.Left )
	FrameLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -20, _1080p * 4, _1080p * 26 )
	self:addElement( FrameLabel )
	self.FrameLabel = FrameLabel
	
	local StreakGrid = nil
	
	StreakGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 3,
		maxVisibleRows = 1,
		controllerIndex = f2_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "FramedStreak", {
				controllerIndex = f2_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 56,
		spacingY = _1080p * 56,
		columnWidth = _1080p * 64,
		rowHeight = _1080p * 77,
		scrollingThresholdX = 0,
		scrollingThresholdY = 0,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	StreakGrid.id = "StreakGrid"
	StreakGrid:setUseStencil( false )
	StreakGrid:SetGridDataSourceThroughElement( self, "streaks" )
	StreakGrid:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -152, _1080p * 152, _1080p * 35, _1080p * 112 )
	self:addElement( StreakGrid )
	self.StreakGrid = StreakGrid
	
	local Divider1 = nil
	
	Divider1 = LUI.UIImage.new()
	Divider1.id = "Divider1"
	Divider1:setImage( RegisterMaterial( "wdg_button_arrow_tip" ), 0 )
	Divider1:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -64, _1080p * -56, _1080p * -20, _1080p * -4 )
	self:addElement( Divider1 )
	self.Divider1 = Divider1
	
	local Divider2 = nil
	
	Divider2 = LUI.UIImage.new()
	Divider2.id = "Divider2"
	Divider2:setImage( RegisterMaterial( "wdg_button_arrow_tip" ), 0 )
	Divider2:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 56, _1080p * 64, _1080p * -20, _1080p * -4 )
	self:addElement( Divider2 )
	self.Divider2 = Divider2
	
	local DividerLine1 = nil
	
	DividerLine1 = LUI.UIImage.new()
	DividerLine1.id = "DividerLine1"
	DividerLine1:SetAlpha( 0.4, 0 )
	DividerLine1:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -60.5, _1080p * -59.5, _1080p * 41, _1080p * 82 )
	self:addElement( DividerLine1 )
	self.DividerLine1 = DividerLine1
	
	local DividerLine2 = nil
	
	DividerLine2 = LUI.UIImage.new()
	DividerLine2.id = "DividerLine2"
	DividerLine2:SetAlpha( 0.4, 0 )
	DividerLine2:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 59.5, _1080p * 60.5, _1080p * 41, _1080p * 82 )
	self:addElement( DividerLine2 )
	self.DividerLine2 = DividerLine2
	
	local Lock = nil
	
	Lock = LUI.UIImage.new()
	Lock.id = "Lock"
	Lock:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
	Lock:SetAlpha( 0, 0 )
	Lock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Lock:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -33, _1080p * -7, _1080p * -54, _1080p * -28 )
	self:addElement( Lock )
	self.Lock = Lock
	
	local f2_local13 = nil
	if CONDITIONS.UseCACBreadCrumbs( self ) then
		f2_local13 = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
			controllerIndex = f2_local1
		} )
		f2_local13.id = "NewItemNotification"
		f2_local13:SetAlpha( 0, 0 )
		f2_local13:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -32, _1080p * 32, _1080p * 31.5, _1080p * 95.5 )
		self:addElement( f2_local13 )
		self.NewItemNotification = f2_local13
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.InUse = function ()
			
		end
		
		self._sequences.NotInUse = function ()
			
		end
		
		FrameLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		StreakGrid:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.StreakGrid:SetRGBFromInt( 16777215, 100 )
				end
			}
		} )
		Divider1:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Divider1:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.Divider1:SetAlpha( 1, 100 )
				end
			}
		} )
		Divider2:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Divider2:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.Divider2:SetAlpha( 1, 100 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			FrameLabel:AnimateSequence( "ButtonOver" )
			StreakGrid:AnimateSequence( "ButtonOver" )
			Divider1:AnimateSequence( "ButtonOver" )
			Divider2:AnimateSequence( "ButtonOver" )
			Lock:AnimateSequence( "ButtonOver" )
		end
		
		FrameLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 14277081, 0 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		Divider1:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Divider1:SetRGBFromInt( 14277081, 200 )
				end
			},
			{
				function ()
					return self.Divider1:SetAlpha( 1, 200 )
				end
			}
		} )
		Divider2:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Divider2:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.Divider2:SetRGBFromInt( 14277081, 200 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			FrameLabel:AnimateSequence( "ButtonUp" )
			Divider1:AnimateSequence( "ButtonUp" )
			Divider2:AnimateSequence( "ButtonUp" )
			Lock:AnimateSequence( "ButtonUp" )
		end
		
		self._sequences.Pulse = function ()
			
		end
		
		self._sequences.PulseStop = function ()
			
		end
		
		FrameLabel:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		StreakGrid:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.StreakGrid:SetRGBFromInt( 16777215, 100 )
				end
			}
		} )
		Divider1:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Divider1:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.Divider1:SetAlpha( 1, 100 )
				end
			}
		} )
		Divider2:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Divider2:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.Divider2:SetAlpha( 1, 100 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Lock:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			FrameLabel:AnimateSequence( "ButtonOverDisabled" )
			StreakGrid:AnimateSequence( "ButtonOverDisabled" )
			Divider1:AnimateSequence( "ButtonOverDisabled" )
			Divider2:AnimateSequence( "ButtonOverDisabled" )
			Lock:AnimateSequence( "ButtonOverDisabled" )
		end
		
		FrameLabel:RegisterAnimationSequence( "ButtonDisabled", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 14277081, 0 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		StreakGrid:RegisterAnimationSequence( "ButtonDisabled", {
			{
				function ()
					return self.StreakGrid:SetRGBFromInt( 14277081, 200 )
				end
			},
			{
				function ()
					return self.StreakGrid:SetAlpha( 1, 200 )
				end
			}
		} )
		Divider1:RegisterAnimationSequence( "ButtonDisabled", {
			{
				function ()
					return self.Divider1:SetRGBFromInt( 14277081, 200 )
				end
			},
			{
				function ()
					return self.Divider1:SetAlpha( 1, 200 )
				end
			}
		} )
		Divider2:RegisterAnimationSequence( "ButtonDisabled", {
			{
				function ()
					return self.Divider2:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.Divider2:SetRGBFromInt( 14277081, 200 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonDisabled", {
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Lock:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonDisabled = function ()
			FrameLabel:AnimateSequence( "ButtonDisabled" )
			StreakGrid:AnimateSequence( "ButtonDisabled" )
			Divider1:AnimateSequence( "ButtonDisabled" )
			Divider2:AnimateSequence( "ButtonDisabled" )
			Lock:AnimateSequence( "ButtonDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f48_arg0, f48_arg1 )
		local f48_local0 = f48_arg1.controller or f2_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
		ACTIONS.AnimateSequence( self, "Pulse" )
	end )
	self:addEventHandler( "button_up", function ( f49_arg0, f49_arg1 )
		local f49_local0 = f49_arg1.controller or f2_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
		ACTIONS.AnimateSequence( self, "PulseStop" )
	end )
	self:addEventHandler( "button_over_disable", function ( f50_arg0, f50_arg1 )
		local f50_local0 = f50_arg1.controller or f2_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
	end )
	self:addEventHandler( "button_disable", function ( f51_arg0, f51_arg1 )
		local f51_local0 = f51_arg1.controller or f2_local1
		ACTIONS.AnimateSequence( self, "ButtonDisabled" )
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "FramedStreaks", FramedStreaks )
LockTable( _M )

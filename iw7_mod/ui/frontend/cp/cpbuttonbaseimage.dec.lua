local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CPButtonBaseimage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 335 * _1080p, 0, 175 * _1080p )
	self.id = "CPButtonBaseimage"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CPBackground = nil
	
	CPBackground = LUI.UIImage.new()
	CPBackground.id = "CPBackground"
	CPBackground:setImage( RegisterMaterial( "cp_wepbuild_mainbox_off" ), 0 )
	CPBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, 0, _1080p * -9, _1080p * 10 )
	self:addElement( CPBackground )
	self.CPBackground = CPBackground
	
	local EdgeGlowLeft = nil
	
	EdgeGlowLeft = LUI.UIImage.new()
	EdgeGlowLeft.id = "EdgeGlowLeft"
	EdgeGlowLeft:SetAlpha( 0, 0 )
	EdgeGlowLeft:setImage( RegisterMaterial( "cp_wepbuild_mainbox_on_glow" ), 0 )
	EdgeGlowLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -32, _1080p * 32, _1080p * -24, _1080p * 24 )
	self:addElement( EdgeGlowLeft )
	self.EdgeGlowLeft = EdgeGlowLeft
	
	local EdgeGlowRight = nil
	
	EdgeGlowRight = LUI.UIImage.new()
	EdgeGlowRight.id = "EdgeGlowRight"
	EdgeGlowRight:SetAlpha( 0, 0 )
	EdgeGlowRight:setImage( RegisterMaterial( "cp_wepbuild_mainbox_on_glow" ), 0 )
	EdgeGlowRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -32, _1080p * 32, _1080p * -24, _1080p * 24 )
	self:addElement( EdgeGlowRight )
	self.EdgeGlowRight = EdgeGlowRight
	
	local Name = nil
	
	Name = LUI.UIText.new()
	Name.id = "Name"
	Name:SetAlpha( 0.6, 0 )
	Name:setText( "Item Name", 0 )
	Name:SetFontSize( 19 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Name:SetAlignment( LUI.Alignment.Left )
	Name:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 7, _1080p * 26 )
	self:addElement( Name )
	self.Name = Name
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -114, _1080p * 114, _1080p * -120, _1080p * -12 )
	self:addElement( Image )
	self.Image = Image
	
	local RectrictionOverlay = nil
	
	RectrictionOverlay = MenuBuilder.BuildRegisteredType( "CaCButtonRectrictionOverlay", {
		controllerIndex = f1_local1
	} )
	RectrictionOverlay.id = "RectrictionOverlay"
	RectrictionOverlay:SetAlpha( 0, 0 )
	RectrictionOverlay:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * -1, _1080p * 30, _1080p * -1 )
	self:addElement( RectrictionOverlay )
	self.RectrictionOverlay = RectrictionOverlay
	
	local f1_local9 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f1_local9 = LUI.UIImage.new()
		f1_local9.id = "LevelBacker"
		f1_local9:SetRGBFromInt( 0, 0 )
		f1_local9:SetAlpha( 0.2, 0 )
		f1_local9:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 100, _1080p * -24, _1080p * -5 )
		self:addElement( f1_local9 )
		self.LevelBacker = f1_local9
	end
	local f1_local10 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f1_local10 = MenuBuilder.BuildRegisteredType( "GenericBorderFrame", {
			controllerIndex = f1_local1
		} )
		f1_local10.id = "LevelFrame"
		f1_local10:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
		f1_local10:SetAlpha( 0.6, 0 )
		f1_local10.Left:SetRight( _1080p * 0, 0 )
		f1_local10.Right:SetLeft( _1080p * -1, 0 )
		f1_local10.Top:SetBottom( _1080p * 1, 0 )
		f1_local10.Bottom:SetTop( _1080p * 0, 0 )
		f1_local10:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 91, _1080p * 101, _1080p * -25, _1080p * -15 )
		self:addElement( f1_local10 )
		self.LevelFrame = f1_local10
	end
	local f1_local11 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f1_local11 = LUI.UIText.new()
		f1_local11.id = "Level"
		f1_local11:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
		f1_local11:SetAlpha( 0.6, 0 )
		f1_local11:setText( "Level: 3", 0 )
		f1_local11:SetFontSize( 19 * _1080p )
		f1_local11:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f1_local11:SetAlignment( LUI.Alignment.Center )
		f1_local11:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 100, _1080p * -24, _1080p * -5 )
		self:addElement( f1_local11 )
		self.Level = f1_local11
	end
	local NewItemNotification = nil
	
	NewItemNotification = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
		controllerIndex = f1_local1
	} )
	NewItemNotification.id = "NewItemNotification"
	NewItemNotification:SetAlpha( 0, 0 )
	NewItemNotification:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -32, _1080p * 32, _1080p * -56, _1080p * 8 )
	self:addElement( NewItemNotification )
	self.NewItemNotification = NewItemNotification
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CPBackground:RegisterAnimationSequence( "Rollover", {
			{
				function ()
					return self.CPBackground:setImage( RegisterMaterial( "cp_wepbuild_mainbox_on" ), 0 )
				end
			}
		} )
		EdgeGlowLeft:RegisterAnimationSequence( "Rollover", {
			{
				function ()
					return self.EdgeGlowLeft:SetAlpha( 0.5, 0 )
				end
			}
		} )
		EdgeGlowRight:RegisterAnimationSequence( "Rollover", {
			{
				function ()
					return self.EdgeGlowRight:SetAlpha( 0.5, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "Rollover", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.Name:SetAlpha( 1, 100 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "Rollover", {
			{
				function ()
					return self.Image:SetScale( 0.05, 100 )
				end
			},
			{
				function ()
					return self.Image:SetAlpha( 1, 100 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local10:RegisterAnimationSequence( "Rollover", {
				{
					function ()
						return self.LevelFrame.Right:SetRGBFromInt( 16777215, 100 )
					end
				},
				{
					function ()
						return self.LevelFrame.Top:SetRGBFromInt( 16777215, 100 )
					end
				},
				{
					function ()
						return self.LevelFrame:SetRGBFromTable( SWATCHES.CAC.yellowLight, 100 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local11:RegisterAnimationSequence( "Rollover", {
				{
					function ()
						return self.Level:SetRGBFromInt( 16777215, 100 )
					end
				}
			} )
		end
		self._sequences.Rollover = function ()
			CPBackground:AnimateSequence( "Rollover" )
			EdgeGlowLeft:AnimateSequence( "Rollover" )
			EdgeGlowRight:AnimateSequence( "Rollover" )
			Name:AnimateSequence( "Rollover" )
			Image:AnimateSequence( "Rollover" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local10:AnimateSequence( "Rollover" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local11:AnimateSequence( "Rollover" )
			end
		end
		
		CPBackground:RegisterAnimationSequence( "Rollout", {
			{
				function ()
					return self.CPBackground:setImage( RegisterMaterial( "cp_wepbuild_mainbox_off" ), 0 )
				end
			}
		} )
		EdgeGlowLeft:RegisterAnimationSequence( "Rollout", {
			{
				function ()
					return self.EdgeGlowLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		EdgeGlowRight:RegisterAnimationSequence( "Rollout", {
			{
				function ()
					return self.EdgeGlowRight:SetAlpha( 0, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "Rollout", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 200 )
				end
			},
			{
				function ()
					return self.Name:SetAlpha( 0.6, 200 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "Rollout", {
			{
				function ()
					return self.Image:SetScale( 0, 200 )
				end
			},
			{
				function ()
					return self.Image:SetAlpha( 0.5, 200 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local10:RegisterAnimationSequence( "Rollout", {
				{
					function ()
						return self.LevelFrame:SetRGBFromTable( SWATCHES.CAC.greenLight, 200 )
					end
				},
				{
					function ()
						return self.LevelFrame.Top:SetRGBFromInt( 16777215, 200 )
					end
				},
				{
					function ()
						return self.LevelFrame.Right:SetRGBFromInt( 16777215, 200 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local11:RegisterAnimationSequence( "Rollout", {
				{
					function ()
						return self.Level:SetRGBFromTable( SWATCHES.CAC.greenLight, 200 )
					end
				}
			} )
		end
		self._sequences.Rollout = function ()
			CPBackground:AnimateSequence( "Rollout" )
			EdgeGlowLeft:AnimateSequence( "Rollout" )
			EdgeGlowRight:AnimateSequence( "Rollout" )
			Name:AnimateSequence( "Rollout" )
			Image:AnimateSequence( "Rollout" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local10:AnimateSequence( "Rollout" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local11:AnimateSequence( "Rollout" )
			end
		end
		
		Image:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Image:SetAlpha( 0.15, 0 )
				end
			}
		} )
		RectrictionOverlay:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.RectrictionOverlay:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Image:AnimateSequence( "Locked" )
			RectrictionOverlay:AnimateSequence( "Locked" )
		end
		
		Image:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Image:SetAlpha( 0.3, 0 )
				end
			},
			{
				function ()
					return self.Image:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		RectrictionOverlay:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.RectrictionOverlay:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			Image:AnimateSequence( "Unlocked" )
			RectrictionOverlay:AnimateSequence( "Unlocked" )
		end
		
		Image:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.Image:SetAlpha( 0.1, 0 )
				end
			}
		} )
		self._sequences.Disabled = function ()
			Image:AnimateSequence( "Disabled" )
		end
		
		CPBackground:RegisterAnimationSequence( "Disabled_Rollover", {
			{
				function ()
					return self.CPBackground:setImage( RegisterMaterial( "cp_wepbuild_mainbox_on" ), 0 )
				end
			}
		} )
		EdgeGlowLeft:RegisterAnimationSequence( "Disabled_Rollover", {
			{
				function ()
					return self.EdgeGlowLeft:SetAlpha( 0.5, 0 )
				end
			}
		} )
		EdgeGlowRight:RegisterAnimationSequence( "Disabled_Rollover", {
			{
				function ()
					return self.EdgeGlowRight:SetAlpha( 0.5, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "Disabled_Rollover", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Name:SetAlpha( 1, 0 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "Disabled_Rollover", {
			{
				function ()
					return self.Image:SetAlpha( 0.1, 0 )
				end
			},
			{
				function ()
					return self.Image:SetScale( 0.05, 100 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local9:RegisterAnimationSequence( "Disabled_Rollover", {
				{
					function ()
						return self.LevelBacker:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local10:RegisterAnimationSequence( "Disabled_Rollover", {
				{
					function ()
						return self.LevelFrame:SetRGBFromTable( SWATCHES.CAC.yellowLight, 0 )
					end
				},
				{
					function ()
						return self.LevelFrame:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local11:RegisterAnimationSequence( "Disabled_Rollover", {
				{
					function ()
						return self.Level:SetRGBFromInt( 16777215, 0 )
					end
				},
				{
					function ()
						return self.Level:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.Disabled_Rollover = function ()
			CPBackground:AnimateSequence( "Disabled_Rollover" )
			EdgeGlowLeft:AnimateSequence( "Disabled_Rollover" )
			EdgeGlowRight:AnimateSequence( "Disabled_Rollover" )
			Name:AnimateSequence( "Disabled_Rollover" )
			Image:AnimateSequence( "Disabled_Rollover" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local9:AnimateSequence( "Disabled_Rollover" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local10:AnimateSequence( "Disabled_Rollover" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local11:AnimateSequence( "Disabled_Rollover" )
			end
		end
		
		CPBackground:RegisterAnimationSequence( "Disabled_Rollout", {
			{
				function ()
					return self.CPBackground:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CPBackground:setImage( RegisterMaterial( "cp_wepbuild_mainbox_off" ), 0 )
				end
			}
		} )
		EdgeGlowLeft:RegisterAnimationSequence( "Disabled_Rollout", {
			{
				function ()
					return self.EdgeGlowLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		EdgeGlowRight:RegisterAnimationSequence( "Disabled_Rollout", {
			{
				function ()
					return self.EdgeGlowRight:SetAlpha( 0, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "Disabled_Rollout", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Name:SetAlpha( 0.6, 0 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "Disabled_Rollout", {
			{
				function ()
					return self.Image:SetAlpha( 0.1, 0 )
				end
			},
			{
				function ()
					return self.Image:SetScale( 0, 200 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local9:RegisterAnimationSequence( "Disabled_Rollout", {
				{
					function ()
						return self.LevelBacker:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local10:RegisterAnimationSequence( "Disabled_Rollout", {
				{
					function ()
						return self.LevelFrame:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local11:RegisterAnimationSequence( "Disabled_Rollout", {
				{
					function ()
						return self.Level:SetRGBFromTable( SWATCHES.CAC.ItemBtnName_Idle, 0 )
					end
				},
				{
					function ()
						return self.Level:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.Disabled_Rollout = function ()
			CPBackground:AnimateSequence( "Disabled_Rollout" )
			EdgeGlowLeft:AnimateSequence( "Disabled_Rollout" )
			EdgeGlowRight:AnimateSequence( "Disabled_Rollout" )
			Name:AnimateSequence( "Disabled_Rollout" )
			Image:AnimateSequence( "Disabled_Rollout" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local9:AnimateSequence( "Disabled_Rollout" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local10:AnimateSequence( "Disabled_Rollout" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local11:AnimateSequence( "Disabled_Rollout" )
			end
		end
		
		Image:RegisterAnimationSequence( "Enabled", {
			{
				function ()
					return self.Image:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.Enabled = function ()
			Image:AnimateSequence( "Enabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f65_arg0, f65_arg1 )
		local f65_local0 = f65_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Rollover" )
	end )
	self:addEventHandler( "button_up", function ( f66_arg0, f66_arg1 )
		local f66_local0 = f66_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Rollout" )
	end )
	self:addEventHandler( "button_disable", function ( f67_arg0, f67_arg1 )
		local f67_local0 = f67_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Disabled_Rollout" )
	end )
	self:addEventHandler( "button_over_disable", function ( f68_arg0, f68_arg1 )
		local f68_local0 = f68_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Disabled_Rollover" )
	end )
	return self
end

MenuBuilder.registerType( "CPButtonBaseimage", CPButtonBaseimage )
LockTable( _M )

local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CaCButtonBaseImage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 335 * _1080p, 0, 173 * _1080p )
	self.id = "CaCButtonBaseImage"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local GenericItemBackground = nil
	
	GenericItemBackground = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f1_local1
	} )
	GenericItemBackground.id = "GenericItemBackground"
	GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericItemBackground )
	self.GenericItemBackground = GenericItemBackground
	
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -128, _1080p * 128, _1080p * -132, _1080p * -4 )
	self:addElement( Image )
	self.Image = Image
	
	local PrestigeBG = nil
	
	PrestigeBG = LUI.UIImage.new()
	PrestigeBG.id = "PrestigeBG"
	PrestigeBG:SetRGBFromInt( 13421772, 0 )
	PrestigeBG:SetAlpha( 0, 0 )
	PrestigeBG:setImage( RegisterMaterial( "widg_disabled" ), 0 )
	PrestigeBG:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( PrestigeBG )
	self.PrestigeBG = PrestigeBG
	
	local RectrictionOverlay = nil
	
	RectrictionOverlay = MenuBuilder.BuildRegisteredType( "CaCButtonRectrictionOverlay", {
		controllerIndex = f1_local1
	} )
	RectrictionOverlay.id = "RectrictionOverlay"
	RectrictionOverlay:SetAlpha( 0, 0 )
	RectrictionOverlay:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( RectrictionOverlay )
	self.RectrictionOverlay = RectrictionOverlay
	
	local f1_local8 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f1_local8 = LUI.UIImage.new()
		f1_local8.id = "LevelBacker"
		f1_local8:SetRGBFromInt( 0, 0 )
		f1_local8:SetAlpha( 0, 0 )
		f1_local8:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 100, _1080p * -24, 0 )
		self:addElement( f1_local8 )
		self.LevelBacker = f1_local8
	end
	local f1_local9 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f1_local9 = MenuBuilder.BuildRegisteredType( "GenericBorderFrame", {
			controllerIndex = f1_local1
		} )
		f1_local9.id = "LevelFrame"
		f1_local9:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
		f1_local9:SetAlpha( 0, 0 )
		f1_local9.Left:SetRight( _1080p * 0, 0 )
		f1_local9.Right:SetLeft( _1080p * -1, 0 )
		f1_local9.Top:SetBottom( _1080p * 1, 0 )
		f1_local9.Bottom:SetTop( _1080p * 0, 0 )
		f1_local9:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 91, _1080p * 101, _1080p * -25, _1080p * -15 )
		self:addElement( f1_local9 )
		self.LevelFrame = f1_local9
	end
	local f1_local10 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f1_local10 = LUI.UIText.new()
		f1_local10.id = "Level"
		f1_local10:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
		f1_local10:SetAlpha( 0, 0 )
		f1_local10:setText( "Level: 3", 0 )
		f1_local10:SetFontSize( 19 * _1080p )
		f1_local10:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f1_local10:SetAlignment( LUI.Alignment.Center )
		f1_local10:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 2.5, _1080p * 97.5, _1080p * -21.5, _1080p * -2.5 )
		self:addElement( f1_local10 )
		self.Level = f1_local10
	end
	local Message = nil
	
	Message = MenuBuilder.BuildRegisteredType( "CaCSelectedMessage", {
		controllerIndex = f1_local1
	} )
	Message.id = "Message"
	Message:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -317, 0, _1080p * -20, 0 )
	Message:SubscribeToModelThroughElement( self, "DataSources.frontEnd.MP.CAC.perks.content.equipIconAlpha", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.DataSources.frontEnd.MP.CAC.perks.content.equipIconAlpha:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Message.EndCapRight:SetAlpha( f2_local0, 0 )
		end
	end )
	self:addElement( Message )
	self.Message = Message
	
	local NewItemNotification = nil
	
	NewItemNotification = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
		controllerIndex = f1_local1
	} )
	NewItemNotification.id = "NewItemNotification"
	NewItemNotification:SetAlpha( 0, 0 )
	NewItemNotification:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -32, _1080p * 32, _1080p * -56, _1080p * 8 )
	self:addElement( NewItemNotification )
	self.NewItemNotification = NewItemNotification
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f1_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local TitleBackground = nil
	
	TitleBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f1_local1
	} )
	TitleBackground.id = "TitleBackground"
	TitleBackground.DropShadow:SetAlpha( 0, 0 )
	TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local Name = nil
	
	Name = LUI.UIStyledText.new()
	Name.id = "Name"
	Name:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
	Name:setText( "Item Name", 0 )
	Name:SetFontSize( 19 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Name:SetAlignment( LUI.Alignment.Left )
	Name:SetStartupDelay( 2000 )
	Name:SetLineHoldTime( 400 )
	Name:SetAnimMoveTime( 300 )
	Name:SetEndDelay( 1500 )
	Name:SetCrossfadeTime( 750 )
	Name:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Name:SetMaxVisibleLines( 1 )
	Name:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 13, _1080p * -13, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( Name )
	self.Name = Name
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Image:RegisterAnimationSequence( "Rollover", {
			{
				function ()
					return self.Image:SetScale( 0.05, 100 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local9:RegisterAnimationSequence( "Rollover", {
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
			f1_local10:RegisterAnimationSequence( "Rollover", {
				{
					function ()
						return self.Level:SetRGBFromInt( 16777215, 100 )
					end
				}
			} )
		end
		Name:RegisterAnimationSequence( "Rollover", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Name:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Rollover = function ()
			Image:AnimateSequence( "Rollover" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local9:AnimateSequence( "Rollover" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local10:AnimateSequence( "Rollover" )
			end
			Name:AnimateSequence( "Rollover" )
		end
		
		Image:RegisterAnimationSequence( "Rollout", {
			{
				function ()
					return self.Image:SetScale( 0, 200 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local9:RegisterAnimationSequence( "Rollout", {
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
			f1_local10:RegisterAnimationSequence( "Rollout", {
				{
					function ()
						return self.Level:SetRGBFromTable( SWATCHES.CAC.greenLight, 200 )
					end
				}
			} )
		end
		Name:RegisterAnimationSequence( "Rollout", {
			{
				function ()
					return self.Name:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
				end
			},
			{
				function ()
					return self.Name:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Rollout = function ()
			Image:AnimateSequence( "Rollout" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local9:AnimateSequence( "Rollout" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local10:AnimateSequence( "Rollout" )
			end
			Name:AnimateSequence( "Rollout" )
		end
		
		Image:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Image:SetAlpha( 0, 0 )
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
					return self.Image:SetAlpha( 1, 0 )
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
		
		self._sequences.Disabled = function ()
			
		end
		
		self._sequences.Enabled = function ()
			
		end
		
		self._sequences.Pulse = function ()
			
		end
		
		self._sequences.PulseStop = function ()
			
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local9:RegisterAnimationSequence( "Disabled_Rollover", {
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
			f1_local10:RegisterAnimationSequence( "Disabled_Rollover", {
				{
					function ()
						return self.Level:SetRGBFromInt( 16777215, 100 )
					end
				}
			} )
		end
		Name:RegisterAnimationSequence( "Disabled_Rollover", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Name:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Disabled_Rollover = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local9:AnimateSequence( "Disabled_Rollover" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local10:AnimateSequence( "Disabled_Rollover" )
			end
			Name:AnimateSequence( "Disabled_Rollover" )
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local9:RegisterAnimationSequence( "Disabled_Rollout", {
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
			f1_local10:RegisterAnimationSequence( "Disabled_Rollout", {
				{
					function ()
						return self.Level:SetRGBFromTable( SWATCHES.CAC.greenLight, 200 )
					end
				}
			} )
		end
		Name:RegisterAnimationSequence( "Disabled_Rollout", {
			{
				function ()
					return self.Name:SetRGBFromInt( 12566463, 0 )
				end
			},
			{
				function ()
					return self.Name:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Disabled_Rollout = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local9:AnimateSequence( "Disabled_Rollout" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local10:AnimateSequence( "Disabled_Rollout" )
			end
			Name:AnimateSequence( "Disabled_Rollout" )
		end
		
		NewItemNotification:RegisterAnimationSequence( "IsNew", {
			{
				function ()
					return self.NewItemNotification:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.IsNew = function ()
			NewItemNotification:AnimateSequence( "IsNew" )
		end
		
		NewItemNotification:RegisterAnimationSequence( "IsNotNew", {
			{
				function ()
					return self.NewItemNotification:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.IsNotNew = function ()
			NewItemNotification:AnimateSequence( "IsNotNew" )
		end
		
	end
	
	self._animationSets.CP = function ()
		Name:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Name:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
				end
			},
			{
				function ()
					return self.Name:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Name:AnimateSequence( "DefaultSequence" )
		end
		
		Image:RegisterAnimationSequence( "Rollover", {
			{
				function ()
					return self.Image:SetScale( 0.05, 100 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local9:RegisterAnimationSequence( "Rollover", {
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
			f1_local10:RegisterAnimationSequence( "Rollover", {
				{
					function ()
						return self.Level:SetRGBFromInt( 16777215, 100 )
					end
				}
			} )
		end
		Name:RegisterAnimationSequence( "Rollover", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 100 )
				end
			}
		} )
		self._sequences.Rollover = function ()
			Image:AnimateSequence( "Rollover" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local9:AnimateSequence( "Rollover" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local10:AnimateSequence( "Rollover" )
			end
			Name:AnimateSequence( "Rollover" )
		end
		
		Image:RegisterAnimationSequence( "Rollout", {
			{
				function ()
					return self.Image:SetScale( 0, 200 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local9:RegisterAnimationSequence( "Rollout", {
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
			f1_local10:RegisterAnimationSequence( "Rollout", {
				{
					function ()
						return self.Level:SetRGBFromTable( SWATCHES.CAC.greenLight, 200 )
					end
				}
			} )
		end
		Name:RegisterAnimationSequence( "Rollout", {
			{
				function ()
					return self.Name:SetRGBFromTable( SWATCHES.genericButton.textDefault, 200 )
				end
			}
		} )
		self._sequences.Rollout = function ()
			Image:AnimateSequence( "Rollout" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local9:AnimateSequence( "Rollout" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local10:AnimateSequence( "Rollout" )
			end
			Name:AnimateSequence( "Rollout" )
		end
		
		Image:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Image:SetAlpha( 0, 0 )
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
					return self.Image:SetAlpha( 1, 0 )
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
		
		self._sequences.Disabled = function ()
			
		end
		
		self._sequences.Enabled = function ()
			
		end
		
		self._sequences.Pulse = function ()
			
		end
		
		self._sequences.PulseStop = function ()
			
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local9:RegisterAnimationSequence( "Disabled_Rollover", {
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
			f1_local10:RegisterAnimationSequence( "Disabled_Rollover", {
				{
					function ()
						return self.Level:SetRGBFromInt( 16777215, 100 )
					end
				}
			} )
		end
		Name:RegisterAnimationSequence( "Disabled_Rollover", {
			{
				function ()
					return self.Name:SetRGBFromTable( SWATCHES.genericButton.textDefault, 100 )
				end
			}
		} )
		self._sequences.Disabled_Rollover = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local9:AnimateSequence( "Disabled_Rollover" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local10:AnimateSequence( "Disabled_Rollover" )
			end
			Name:AnimateSequence( "Disabled_Rollover" )
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f1_local9:RegisterAnimationSequence( "Disabled_Rollout", {
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
			f1_local10:RegisterAnimationSequence( "Disabled_Rollout", {
				{
					function ()
						return self.Level:SetRGBFromTable( SWATCHES.CAC.greenLight, 200 )
					end
				}
			} )
		end
		Name:RegisterAnimationSequence( "Disabled_Rollout", {
			{
				function ()
					return self.Name:SetRGBFromTable( SWATCHES.genericButton.textDefault, 200 )
				end
			}
		} )
		self._sequences.Disabled_Rollout = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local9:AnimateSequence( "Disabled_Rollout" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f1_local10:AnimateSequence( "Disabled_Rollout" )
			end
			Name:AnimateSequence( "Disabled_Rollout" )
		end
		
		self._sequences.IsNew = function ()
			
		end
		
		self._sequences.IsNotNew = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f91_arg0, f91_arg1 )
		local f91_local0 = f91_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Rollover" )
	end )
	self:addEventHandler( "button_up", function ( f92_arg0, f92_arg1 )
		local f92_local0 = f92_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Rollout" )
	end )
	self:addEventHandler( "button_disable", function ( f93_arg0, f93_arg1 )
		local f93_local0 = f93_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Disabled_Rollout" )
	end )
	self:addEventHandler( "button_over_disable", function ( f94_arg0, f94_arg1 )
		local f94_local0 = f94_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Disabled_Rollover" )
	end )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.SetAnimationSet( self, "CP" )
	end
	return self
end

MenuBuilder.registerType( "CaCButtonBaseImage", CaCButtonBaseImage )
LockTable( _M )

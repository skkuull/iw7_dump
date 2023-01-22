local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARRewardsRank( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 550 * _1080p, 0, 250 * _1080p )
	self.id = "AARRewardsRank"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self.soundSet = "aarrewards"
	local f1_local2 = self
	local f1_local3 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f1_local3 = LUI.UIImage.new()
		f1_local3.id = "Background"
		f1_local3:SetRGBFromInt( 1710618, 0 )
		f1_local3:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
		f1_local3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 550, _1080p * 41, _1080p * 209 )
		self:addElement( f1_local3 )
		self.Background = f1_local3
	end
	local f1_local4 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f1_local4 = LUI.UIBlur.new()
		f1_local4.id = "BackgroundCP"
		f1_local4:SetBlurStrength( 2, 0 )
		f1_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 550, _1080p * 41, _1080p * 209 )
		self:addElement( f1_local4 )
		self.BackgroundCP = f1_local4
	end
	local f1_local5 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f1_local5 = LUI.UIImage.new()
		f1_local5.id = "HeaderBarCP"
		f1_local5:SetRGBFromInt( 0, 0 )
		f1_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 550, _1080p * 41, _1080p * 67 )
		self:addElement( f1_local5 )
		self.HeaderBarCP = f1_local5
	end
	local AARRewardsRankProgress = nil
	
	AARRewardsRankProgress = MenuBuilder.BuildRegisteredType( "AARRewardsRankProgress", {
		controllerIndex = f1_local1
	} )
	AARRewardsRankProgress.id = "AARRewardsRankProgress"
	AARRewardsRankProgress:SetDataSourceThroughElement( self, nil )
	AARRewardsRankProgress:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 250, 0, _1080p * 250 )
	self:addElement( AARRewardsRankProgress )
	self.AARRewardsRankProgress = AARRewardsRankProgress
	
	local AARRewardsNextRank = nil
	
	AARRewardsNextRank = MenuBuilder.BuildRegisteredType( "AARRewardsNextRank", {
		controllerIndex = f1_local1
	} )
	AARRewardsNextRank.id = "AARRewardsNextRank"
	AARRewardsNextRank.NextRankLabel:setText( Engine.Localize( "LUA_MENU_MP_AAR_NEXT_RANK" ), 0 )
	AARRewardsNextRank:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 485, _1080p * 155, _1080p * 175 )
	AARRewardsNextRank:SubscribeToModelThroughElement( self, "nextRankIcon", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.nextRankIcon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			AARRewardsNextRank.NextRankIcon:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	AARRewardsNextRank:SubscribeToModelThroughElement( self, "nextRank", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.nextRank:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			AARRewardsNextRank.NextRankValue:setText( f3_local0, 0 )
		end
	end )
	self:addElement( AARRewardsNextRank )
	self.AARRewardsNextRank = AARRewardsNextRank
	
	local AARRewardsXPNeeded = nil
	
	AARRewardsXPNeeded = MenuBuilder.BuildRegisteredType( "AARRewardsXPNeeded", {
		controllerIndex = f1_local1
	} )
	AARRewardsXPNeeded.id = "AARRewardsXPNeeded"
	AARRewardsXPNeeded.XPNeededLabel:setText( Engine.Localize( "LUA_MENU_MP_AAR_XP_NEEDED" ), 0 )
	AARRewardsXPNeeded:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 485, _1080p * 180, _1080p * 200 )
	AARRewardsXPNeeded:SubscribeToModelThroughElement( self, "xpRequired", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.xpRequired:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			AARRewardsXPNeeded.XPNeededValue:setText( f4_local0, 0 )
		end
	end )
	self:addElement( AARRewardsXPNeeded )
	self.AARRewardsXPNeeded = AARRewardsXPNeeded
	
	local XPEarnedValue = nil
	
	XPEarnedValue = LUI.UIText.new()
	XPEarnedValue.id = "XPEarnedValue"
	XPEarnedValue:SetFontSize( 38 * _1080p )
	XPEarnedValue:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	XPEarnedValue:SetAlignment( LUI.Alignment.Left )
	XPEarnedValue:SetOptOutRightToLeftAlignmentFlip( true )
	XPEarnedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 550, _1080p * 109, _1080p * 147 )
	XPEarnedValue:SubscribeToModelThroughElement( self, "totalXp", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.totalXp:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			XPEarnedValue:setText( f5_local0, 0 )
		end
	end )
	self:addElement( XPEarnedValue )
	self.XPEarnedValue = XPEarnedValue
	
	local XPEarnedText = nil
	
	XPEarnedText = LUI.UIText.new()
	XPEarnedText.id = "XPEarnedText"
	XPEarnedText:SetRGBFromInt( 16767744, 0 )
	XPEarnedText:setText( Engine.Localize( "LUA_MENU_MP_AAR_EARNED_XP" ), 0 )
	XPEarnedText:SetFontSize( 32 * _1080p )
	XPEarnedText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	XPEarnedText:SetAlignment( LUI.Alignment.Left )
	XPEarnedText:SetOptOutRightToLeftAlignmentFlip( true )
	XPEarnedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 723, _1080p * 77, _1080p * 109 )
	self:addElement( XPEarnedText )
	self.XPEarnedText = XPEarnedText
	
	self._animationSets.DefaultAnimationSet = function ()
		if not CONDITIONS.IsThirdGameMode( self ) then
			f1_local3:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.Background:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local4:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.BackgroundCP:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local5:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.HeaderBarCP:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		AARRewardsRankProgress:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.AARRewardsRankProgress:SetAlpha( 0, 0 )
				end
			}
		} )
		AARRewardsNextRank:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.AARRewardsNextRank:SetAlpha( 0, 0 )
				end
			}
		} )
		AARRewardsXPNeeded:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.AARRewardsXPNeeded:SetAlpha( 0, 0 )
				end
			}
		} )
		XPEarnedValue:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.XPEarnedValue:SetAlpha( 0, 0 )
				end
			}
		} )
		XPEarnedText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.XPEarnedText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			if not CONDITIONS.IsThirdGameMode( self ) then
				f1_local3:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local4:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local5:AnimateSequence( "DefaultSequence" )
			end
			AARRewardsRankProgress:AnimateSequence( "DefaultSequence" )
			AARRewardsNextRank:AnimateSequence( "DefaultSequence" )
			AARRewardsXPNeeded:AnimateSequence( "DefaultSequence" )
			XPEarnedValue:AnimateSequence( "DefaultSequence" )
			XPEarnedText:AnimateSequence( "DefaultSequence" )
		end
		
		if not CONDITIONS.IsThirdGameMode( self ) then
			f1_local3:RegisterAnimationSequence( "Featured", {
				{
					function ()
						return self.Background:SetAlpha( 0, 0 )
					end,
					function ()
						return self.Background:SetAlpha( 1, 200 )
					end
				},
				{
					function ()
						return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 190, _1080p * 41, _1080p * 209, 0 )
					end,
					function ()
						return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 190, _1080p * 41, _1080p * 209, 200 )
					end,
					function ()
						return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 550, _1080p * 41, _1080p * 209, 200, LUI.EASING.outQuintic )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local4:RegisterAnimationSequence( "Featured", {
				{
					function ()
						return self.BackgroundCP:SetAlpha( 0, 0 )
					end,
					function ()
						return self.BackgroundCP:SetAlpha( 1, 400 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local5:RegisterAnimationSequence( "Featured", {
				{
					function ()
						return self.HeaderBarCP:SetAlpha( 0, 0 )
					end,
					function ()
						return self.HeaderBarCP:SetAlpha( 1, 400, LUI.EASING.inOutQuadratic )
					end
				},
				{
					function ()
						return self.HeaderBarCP:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 191, _1080p * 41, _1080p * 67, 0 )
					end,
					function ()
						return self.HeaderBarCP:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 550, _1080p * 41, _1080p * 67, 400, LUI.EASING.inOutQuadratic )
					end
				}
			} )
		end
		AARRewardsRankProgress:RegisterAnimationSequence( "Featured", {
			{
				function ()
					return self.AARRewardsRankProgress:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AARRewardsRankProgress:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsRankProgress:SetScale( 1, 0 )
				end,
				function ()
					return self.AARRewardsRankProgress:SetScale( 0, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsRankProgress:playSound( "meterIntroKeys", false, 0 )
				end
			}
		} )
		AARRewardsNextRank:RegisterAnimationSequence( "Featured", {
			{
				function ()
					return self.AARRewardsNextRank:SetAlpha( 0, 300 )
				end,
				function ()
					return self.AARRewardsNextRank:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsNextRank:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 760, _1080p * 155, _1080p * 175, 300 )
				end,
				function ()
					return self.AARRewardsNextRank:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 485, _1080p * 155, _1080p * 175, 199, LUI.EASING.outBack )
				end
			}
		} )
		AARRewardsXPNeeded:RegisterAnimationSequence( "Featured", {
			{
				function ()
					return self.AARRewardsXPNeeded:SetAlpha( 0, 350 )
				end,
				function ()
					return self.AARRewardsXPNeeded:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsXPNeeded:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 760, _1080p * 178, _1080p * 198, 349 )
				end,
				function ()
					return self.AARRewardsXPNeeded:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 485, _1080p * 178, _1080p * 198, 200, LUI.EASING.outBack )
				end
			}
		} )
		XPEarnedValue:RegisterAnimationSequence( "Featured", {
			{
				function ()
					return self.XPEarnedValue:SetAlpha( 0, 250 )
				end,
				function ()
					return self.XPEarnedValue:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.XPEarnedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 825, _1080p * 105, _1080p * 143, 0 )
				end,
				function ()
					return self.XPEarnedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 825, _1080p * 105, _1080p * 143, 250 )
				end,
				function ()
					return self.XPEarnedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 550, _1080p * 105, _1080p * 143, 199, LUI.EASING.outBack )
				end
			}
		} )
		XPEarnedText:RegisterAnimationSequence( "Featured", {
			{
				function ()
					return self.XPEarnedText:SetAlpha( 0, 200 )
				end,
				function ()
					return self.XPEarnedText:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.XPEarnedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 995, _1080p * 78, _1080p * 110, 0 )
				end,
				function ()
					return self.XPEarnedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 995, _1080p * 78, _1080p * 110, 200 )
				end,
				function ()
					return self.XPEarnedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 721, _1080p * 78, _1080p * 110, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Featured = function ()
			if not CONDITIONS.IsThirdGameMode( self ) then
				f1_local3:AnimateSequence( "Featured" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local4:AnimateSequence( "Featured" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local5:AnimateSequence( "Featured" )
			end
			AARRewardsRankProgress:AnimateSequence( "Featured" )
			AARRewardsNextRank:AnimateSequence( "Featured" )
			AARRewardsXPNeeded:AnimateSequence( "Featured" )
			XPEarnedValue:AnimateSequence( "Featured" )
			XPEarnedText:AnimateSequence( "Featured" )
		end
		
		if not CONDITIONS.IsThirdGameMode( self ) then
			f1_local3:RegisterAnimationSequence( "NotFeatured", {
				{
					function ()
						return self.Background:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local4:RegisterAnimationSequence( "NotFeatured", {
				{
					function ()
						return self.BackgroundCP:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local5:RegisterAnimationSequence( "NotFeatured", {
				{
					function ()
						return self.HeaderBarCP:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		AARRewardsRankProgress:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.AARRewardsRankProgress:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.AARRewardsRankProgress:SetScale( 0, 0 )
				end
			}
		} )
		AARRewardsNextRank:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.AARRewardsNextRank:SetAlpha( 1, 0 )
				end
			}
		} )
		AARRewardsXPNeeded:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.AARRewardsXPNeeded:SetAlpha( 1, 0 )
				end
			}
		} )
		XPEarnedValue:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.XPEarnedValue:SetAlpha( 1, 0 )
				end
			}
		} )
		XPEarnedText:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.XPEarnedText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.NotFeatured = function ()
			if not CONDITIONS.IsThirdGameMode( self ) then
				f1_local3:AnimateSequence( "NotFeatured" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local4:AnimateSequence( "NotFeatured" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local5:AnimateSequence( "NotFeatured" )
			end
			AARRewardsRankProgress:AnimateSequence( "NotFeatured" )
			AARRewardsNextRank:AnimateSequence( "NotFeatured" )
			AARRewardsXPNeeded:AnimateSequence( "NotFeatured" )
			XPEarnedValue:AnimateSequence( "NotFeatured" )
			XPEarnedText:AnimateSequence( "NotFeatured" )
		end
		
		if not CONDITIONS.IsThirdGameMode( self ) then
			f1_local3:RegisterAnimationSequence( "FeaturedMax", {
				{
					function ()
						return self.Background:SetAlpha( 0, 0 )
					end,
					function ()
						return self.Background:SetAlpha( 1, 200 )
					end
				},
				{
					function ()
						return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 190, _1080p * 41, _1080p * 209, 0 )
					end,
					function ()
						return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 190, _1080p * 41, _1080p * 209, 200 )
					end,
					function ()
						return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 550, _1080p * 41, _1080p * 209, 200, LUI.EASING.outQuintic )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local4:RegisterAnimationSequence( "FeaturedMax", {
				{
					function ()
						return self.BackgroundCP:SetAlpha( 0, 0 )
					end,
					function ()
						return self.BackgroundCP:SetAlpha( 1, 400 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local5:RegisterAnimationSequence( "FeaturedMax", {
				{
					function ()
						return self.HeaderBarCP:SetAlpha( 0, 0 )
					end,
					function ()
						return self.HeaderBarCP:SetAlpha( 1, 400, LUI.EASING.inOutQuadratic )
					end
				},
				{
					function ()
						return self.HeaderBarCP:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 191, _1080p * 41, _1080p * 67, 0 )
					end,
					function ()
						return self.HeaderBarCP:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 550, _1080p * 41, _1080p * 67, 400, LUI.EASING.inOutQuadratic )
					end
				}
			} )
		end
		AARRewardsRankProgress:RegisterAnimationSequence( "FeaturedMax", {
			{
				function ()
					return self.AARRewardsRankProgress:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AARRewardsRankProgress:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsRankProgress:SetScale( 1, 0 )
				end,
				function ()
					return self.AARRewardsRankProgress:SetScale( 0, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsRankProgress:playSound( "meterIntroKeys", false, 0 )
				end
			}
		} )
		AARRewardsNextRank:RegisterAnimationSequence( "FeaturedMax", {
			{
				function ()
					return self.AARRewardsNextRank:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.AARRewardsNextRank:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 760, _1080p * 155, _1080p * 175, 0 )
				end
			}
		} )
		AARRewardsXPNeeded:RegisterAnimationSequence( "FeaturedMax", {
			{
				function ()
					return self.AARRewardsXPNeeded:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.AARRewardsXPNeeded:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 760, _1080p * 178, _1080p * 198, 0 )
				end
			}
		} )
		XPEarnedValue:RegisterAnimationSequence( "FeaturedMax", {
			{
				function ()
					return self.XPEarnedValue:SetAlpha( 0, 250 )
				end,
				function ()
					return self.XPEarnedValue:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.XPEarnedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 825, _1080p * 105, _1080p * 143, 0 )
				end,
				function ()
					return self.XPEarnedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 825, _1080p * 105, _1080p * 143, 250 )
				end,
				function ()
					return self.XPEarnedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 550, _1080p * 105, _1080p * 143, 199, LUI.EASING.outBack )
				end
			}
		} )
		XPEarnedText:RegisterAnimationSequence( "FeaturedMax", {
			{
				function ()
					return self.XPEarnedText:SetAlpha( 0, 200 )
				end,
				function ()
					return self.XPEarnedText:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.XPEarnedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 995, _1080p * 78, _1080p * 110, 0 )
				end,
				function ()
					return self.XPEarnedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 995, _1080p * 78, _1080p * 110, 200 )
				end,
				function ()
					return self.XPEarnedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 721, _1080p * 78, _1080p * 110, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.FeaturedMax = function ()
			if not CONDITIONS.IsThirdGameMode( self ) then
				f1_local3:AnimateSequence( "FeaturedMax" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local4:AnimateSequence( "FeaturedMax" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local5:AnimateSequence( "FeaturedMax" )
			end
			AARRewardsRankProgress:AnimateSequence( "FeaturedMax" )
			AARRewardsNextRank:AnimateSequence( "FeaturedMax" )
			AARRewardsXPNeeded:AnimateSequence( "FeaturedMax" )
			XPEarnedValue:AnimateSequence( "FeaturedMax" )
			XPEarnedText:AnimateSequence( "FeaturedMax" )
		end
		
		if not CONDITIONS.IsThirdGameMode( self ) then
			f1_local3:RegisterAnimationSequence( "NotFeaturedMax", {
				{
					function ()
						return self.Background:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local4:RegisterAnimationSequence( "NotFeaturedMax", {
				{
					function ()
						return self.BackgroundCP:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local5:RegisterAnimationSequence( "NotFeaturedMax", {
				{
					function ()
						return self.HeaderBarCP:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		AARRewardsRankProgress:RegisterAnimationSequence( "NotFeaturedMax", {
			{
				function ()
					return self.AARRewardsRankProgress:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.AARRewardsRankProgress:SetScale( 0, 0 )
				end
			}
		} )
		AARRewardsNextRank:RegisterAnimationSequence( "NotFeaturedMax", {
			{
				function ()
					return self.AARRewardsNextRank:SetAlpha( 0, 0 )
				end
			}
		} )
		AARRewardsXPNeeded:RegisterAnimationSequence( "NotFeaturedMax", {
			{
				function ()
					return self.AARRewardsXPNeeded:SetAlpha( 0, 0 )
				end
			}
		} )
		XPEarnedValue:RegisterAnimationSequence( "NotFeaturedMax", {
			{
				function ()
					return self.XPEarnedValue:SetAlpha( 1, 0 )
				end
			}
		} )
		XPEarnedText:RegisterAnimationSequence( "NotFeaturedMax", {
			{
				function ()
					return self.XPEarnedText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.NotFeaturedMax = function ()
			if not CONDITIONS.IsThirdGameMode( self ) then
				f1_local3:AnimateSequence( "NotFeaturedMax" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local4:AnimateSequence( "NotFeaturedMax" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local5:AnimateSequence( "NotFeaturedMax" )
			end
			AARRewardsRankProgress:AnimateSequence( "NotFeaturedMax" )
			AARRewardsNextRank:AnimateSequence( "NotFeaturedMax" )
			AARRewardsXPNeeded:AnimateSequence( "NotFeaturedMax" )
			XPEarnedValue:AnimateSequence( "NotFeaturedMax" )
			XPEarnedText:AnimateSequence( "NotFeaturedMax" )
		end
		
	end
	
	self._animationSets.CPAnimationSet = function ()
		if not CONDITIONS.IsThirdGameMode( self ) then
			f1_local3:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.Background:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local4:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.BackgroundCP:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local5:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.HeaderBarCP:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		AARRewardsRankProgress:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.AARRewardsRankProgress:SetAlpha( 0, 0 )
				end
			}
		} )
		AARRewardsNextRank:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.AARRewardsNextRank:SetAlpha( 0, 0 )
				end
			}
		} )
		AARRewardsXPNeeded:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.AARRewardsXPNeeded:SetAlpha( 0, 0 )
				end
			}
		} )
		XPEarnedValue:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.XPEarnedValue:SetAlpha( 0, 0 )
				end
			}
		} )
		XPEarnedText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.XPEarnedText:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.XPEarnedText:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			if not CONDITIONS.IsThirdGameMode( self ) then
				f1_local3:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local4:AnimateSequence( "DefaultSequence" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local5:AnimateSequence( "DefaultSequence" )
			end
			AARRewardsRankProgress:AnimateSequence( "DefaultSequence" )
			AARRewardsNextRank:AnimateSequence( "DefaultSequence" )
			AARRewardsXPNeeded:AnimateSequence( "DefaultSequence" )
			XPEarnedValue:AnimateSequence( "DefaultSequence" )
			XPEarnedText:AnimateSequence( "DefaultSequence" )
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local4:RegisterAnimationSequence( "Featured", {
				{
					function ()
						return self.BackgroundCP:SetAlpha( 0, 0 )
					end,
					function ()
						return self.BackgroundCP:SetAlpha( 0, 400 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local5:RegisterAnimationSequence( "Featured", {
				{
					function ()
						return self.HeaderBarCP:SetAlpha( 0, 0 )
					end,
					function ()
						return self.HeaderBarCP:SetAlpha( 1, 400, LUI.EASING.inOutQuadratic )
					end
				},
				{
					function ()
						return self.HeaderBarCP:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 191, _1080p * 41, _1080p * 76, 0 )
					end,
					function ()
						return self.HeaderBarCP:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 550, _1080p * 41, _1080p * 76, 400, LUI.EASING.inOutQuadratic )
					end
				}
			} )
		end
		AARRewardsRankProgress:RegisterAnimationSequence( "Featured", {
			{
				function ()
					return self.AARRewardsRankProgress:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AARRewardsRankProgress:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsRankProgress:SetScale( 1, 0 )
				end,
				function ()
					return self.AARRewardsRankProgress:SetScale( 0, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsRankProgress:playSound( "meterIntroKeys", false, 0 )
				end
			}
		} )
		AARRewardsNextRank:RegisterAnimationSequence( "Featured", {
			{
				function ()
					return self.AARRewardsNextRank:SetAlpha( 0, 300 )
				end,
				function ()
					return self.AARRewardsNextRank:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsNextRank:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 760, _1080p * 125, _1080p * 145, 300 )
				end,
				function ()
					return self.AARRewardsNextRank:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262, _1080p * 472, _1080p * 125, _1080p * 145, 199, LUI.EASING.outBack )
				end
			}
		} )
		AARRewardsXPNeeded:RegisterAnimationSequence( "Featured", {
			{
				function ()
					return self.AARRewardsXPNeeded:SetAlpha( 0, 350 )
				end,
				function ()
					return self.AARRewardsXPNeeded:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsXPNeeded:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 760, _1080p * 148, _1080p * 168, 349 )
				end,
				function ()
					return self.AARRewardsXPNeeded:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262, _1080p * 472, _1080p * 148, _1080p * 168, 200, LUI.EASING.outBack )
				end
			}
		} )
		XPEarnedValue:RegisterAnimationSequence( "Featured", {
			{
				function ()
					return self.XPEarnedValue:SetAlpha( 0, 250 )
				end,
				function ()
					return self.XPEarnedValue:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.XPEarnedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 718, _1080p * 79, _1080p * 117, 250 )
				end,
				function ()
					return self.XPEarnedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 260, _1080p * 428, _1080p * 79, _1080p * 117, 199, LUI.EASING.outBack )
				end
			}
		} )
		XPEarnedText:RegisterAnimationSequence( "Featured", {
			{
				function ()
					return self.XPEarnedText:SetAlpha( 0, 200 )
				end,
				function ()
					return self.XPEarnedText:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.XPEarnedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 710, _1080p * 42, _1080p * 74, 200 )
				end,
				function ()
					return self.XPEarnedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 260, _1080p * 420, _1080p * 42, _1080p * 74, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Featured = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local4:AnimateSequence( "Featured" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local5:AnimateSequence( "Featured" )
			end
			AARRewardsRankProgress:AnimateSequence( "Featured" )
			AARRewardsNextRank:AnimateSequence( "Featured" )
			AARRewardsXPNeeded:AnimateSequence( "Featured" )
			XPEarnedValue:AnimateSequence( "Featured" )
			XPEarnedText:AnimateSequence( "Featured" )
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local4:RegisterAnimationSequence( "NotFeatured", {
				{
					function ()
						return self.BackgroundCP:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local5:RegisterAnimationSequence( "NotFeatured", {
				{
					function ()
						return self.HeaderBarCP:SetAlpha( 1, 0 )
					end
				},
				{
					function ()
						return self.HeaderBarCP:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 550, _1080p * 41, _1080p * 76, 0 )
					end
				}
			} )
		end
		AARRewardsRankProgress:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.AARRewardsRankProgress:SetAlpha( 1, 0 )
				end
			}
		} )
		AARRewardsNextRank:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.AARRewardsNextRank:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.AARRewardsNextRank:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262, _1080p * 472, _1080p * 125, _1080p * 145, 0 )
				end
			}
		} )
		AARRewardsXPNeeded:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.AARRewardsXPNeeded:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.AARRewardsXPNeeded:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262, _1080p * 472, _1080p * 148, _1080p * 168, 0 )
				end
			}
		} )
		XPEarnedValue:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.XPEarnedValue:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.XPEarnedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 260, _1080p * 428, _1080p * 79, _1080p * 117, 0 )
				end
			}
		} )
		XPEarnedText:RegisterAnimationSequence( "NotFeatured", {
			{
				function ()
					return self.XPEarnedText:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.XPEarnedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 260, _1080p * 420, _1080p * 42, _1080p * 74, 0 )
				end
			}
		} )
		self._sequences.NotFeatured = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local4:AnimateSequence( "NotFeatured" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local5:AnimateSequence( "NotFeatured" )
			end
			AARRewardsRankProgress:AnimateSequence( "NotFeatured" )
			AARRewardsNextRank:AnimateSequence( "NotFeatured" )
			AARRewardsXPNeeded:AnimateSequence( "NotFeatured" )
			XPEarnedValue:AnimateSequence( "NotFeatured" )
			XPEarnedText:AnimateSequence( "NotFeatured" )
		end
		
		if not CONDITIONS.IsThirdGameMode( self ) then
			f1_local3:RegisterAnimationSequence( "FeaturedMax", {
				{
					function ()
						return self.Background:SetAlpha( 0, 0 )
					end,
					function ()
						return self.Background:SetAlpha( 1, 200 )
					end
				},
				{
					function ()
						return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 190, _1080p * 41, _1080p * 209, 0 )
					end,
					function ()
						return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 190, _1080p * 41, _1080p * 209, 200 )
					end,
					function ()
						return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 550, _1080p * 41, _1080p * 209, 200, LUI.EASING.outQuintic )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local4:RegisterAnimationSequence( "FeaturedMax", {
				{
					function ()
						return self.BackgroundCP:SetAlpha( 0, 0 )
					end,
					function ()
						return self.BackgroundCP:SetAlpha( 1, 400 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local5:RegisterAnimationSequence( "FeaturedMax", {
				{
					function ()
						return self.HeaderBarCP:SetAlpha( 0, 0 )
					end,
					function ()
						return self.HeaderBarCP:SetAlpha( 1, 400, LUI.EASING.inOutQuadratic )
					end
				},
				{
					function ()
						return self.HeaderBarCP:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 191, _1080p * 41, _1080p * 67, 0 )
					end,
					function ()
						return self.HeaderBarCP:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 550, _1080p * 41, _1080p * 67, 400, LUI.EASING.inOutQuadratic )
					end
				}
			} )
		end
		AARRewardsRankProgress:RegisterAnimationSequence( "FeaturedMax", {
			{
				function ()
					return self.AARRewardsRankProgress:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AARRewardsRankProgress:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsRankProgress:SetScale( 1, 0 )
				end,
				function ()
					return self.AARRewardsRankProgress:SetScale( 0, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AARRewardsRankProgress:playSound( "meterIntroKeys", false, 0 )
				end
			}
		} )
		AARRewardsNextRank:RegisterAnimationSequence( "FeaturedMax", {
			{
				function ()
					return self.AARRewardsNextRank:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.AARRewardsNextRank:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 760, _1080p * 155, _1080p * 175, 0 )
				end
			}
		} )
		AARRewardsXPNeeded:RegisterAnimationSequence( "FeaturedMax", {
			{
				function ()
					return self.AARRewardsXPNeeded:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.AARRewardsXPNeeded:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 760, _1080p * 178, _1080p * 198, 0 )
				end
			}
		} )
		XPEarnedValue:RegisterAnimationSequence( "FeaturedMax", {
			{
				function ()
					return self.XPEarnedValue:SetAlpha( 0, 250 )
				end,
				function ()
					return self.XPEarnedValue:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.XPEarnedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 825, _1080p * 105, _1080p * 143, 0 )
				end,
				function ()
					return self.XPEarnedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 825, _1080p * 105, _1080p * 143, 250 )
				end,
				function ()
					return self.XPEarnedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 550, _1080p * 105, _1080p * 143, 199, LUI.EASING.outBack )
				end
			}
		} )
		XPEarnedText:RegisterAnimationSequence( "FeaturedMax", {
			{
				function ()
					return self.XPEarnedText:SetAlpha( 0, 200 )
				end,
				function ()
					return self.XPEarnedText:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.XPEarnedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 995, _1080p * 78, _1080p * 110, 0 )
				end,
				function ()
					return self.XPEarnedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 995, _1080p * 78, _1080p * 110, 200 )
				end,
				function ()
					return self.XPEarnedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 275, _1080p * 721, _1080p * 78, _1080p * 110, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.FeaturedMax = function ()
			if not CONDITIONS.IsThirdGameMode( self ) then
				f1_local3:AnimateSequence( "FeaturedMax" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local4:AnimateSequence( "FeaturedMax" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local5:AnimateSequence( "FeaturedMax" )
			end
			AARRewardsRankProgress:AnimateSequence( "FeaturedMax" )
			AARRewardsNextRank:AnimateSequence( "FeaturedMax" )
			AARRewardsXPNeeded:AnimateSequence( "FeaturedMax" )
			XPEarnedValue:AnimateSequence( "FeaturedMax" )
			XPEarnedText:AnimateSequence( "FeaturedMax" )
		end
		
		if not CONDITIONS.IsThirdGameMode( self ) then
			f1_local3:RegisterAnimationSequence( "NotFeaturedMax", {
				{
					function ()
						return self.Background:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local4:RegisterAnimationSequence( "NotFeaturedMax", {
				{
					function ()
						return self.BackgroundCP:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f1_local5:RegisterAnimationSequence( "NotFeaturedMax", {
				{
					function ()
						return self.HeaderBarCP:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		AARRewardsRankProgress:RegisterAnimationSequence( "NotFeaturedMax", {
			{
				function ()
					return self.AARRewardsRankProgress:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.AARRewardsRankProgress:SetScale( 0, 0 )
				end
			}
		} )
		AARRewardsNextRank:RegisterAnimationSequence( "NotFeaturedMax", {
			{
				function ()
					return self.AARRewardsNextRank:SetAlpha( 0, 0 )
				end
			}
		} )
		AARRewardsXPNeeded:RegisterAnimationSequence( "NotFeaturedMax", {
			{
				function ()
					return self.AARRewardsXPNeeded:SetAlpha( 0, 0 )
				end
			}
		} )
		XPEarnedValue:RegisterAnimationSequence( "NotFeaturedMax", {
			{
				function ()
					return self.XPEarnedValue:SetAlpha( 1, 0 )
				end
			}
		} )
		XPEarnedText:RegisterAnimationSequence( "NotFeaturedMax", {
			{
				function ()
					return self.XPEarnedText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.NotFeaturedMax = function ()
			if not CONDITIONS.IsThirdGameMode( self ) then
				f1_local3:AnimateSequence( "NotFeaturedMax" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local4:AnimateSequence( "NotFeaturedMax" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f1_local5:AnimateSequence( "NotFeaturedMax" )
			end
			AARRewardsRankProgress:AnimateSequence( "NotFeaturedMax" )
			AARRewardsNextRank:AnimateSequence( "NotFeaturedMax" )
			AARRewardsXPNeeded:AnimateSequence( "NotFeaturedMax" )
			XPEarnedValue:AnimateSequence( "NotFeaturedMax" )
			XPEarnedText:AnimateSequence( "NotFeaturedMax" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	AARRewardsRankProgress:SetDataSourceThroughElement( self, nil )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.SetAnimationSet( self, "CPAnimationSet" )
	end
	return self
end

MenuBuilder.registerType( "AARRewardsRank", AARRewardsRank )
LockTable( _M )

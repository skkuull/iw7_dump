local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	f1_arg0.Desc:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -100, _1080p * 100, _1080p * 81, _1080p * 99 )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0:SubscribeToDataSourceThroughElement( f2_arg0, nil, function ()
		local f3_local0 = f2_arg0:GetDataSource()
		if f3_local0.showDescription then
			ACTIONS.AnimateSequence( f2_arg0, "ShowDescription" )
		else
			ACTIONS.AnimateSequence( f2_arg0, "HideDescription" )
		end
	end )
	f2_arg0:addEventHandler( "show_description", function ( f4_arg0, f4_arg1 )
		ACTIONS.AnimateSequence( f2_arg0, "ShowDescription" )
	end )
	f2_arg0:addEventHandler( "hide_description", function ( f5_arg0, f5_arg1 )
		ACTIONS.AnimateSequence( f2_arg0, "HideDescription" )
	end )
	f2_arg0:addEventHandler( "update_passive_width", f0_local0 )
end

function ItemCardPassive( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 175 * _1080p, 0, 120 * _1080p )
	self.id = "ItemCardPassive"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 62.5, _1080p * 112.5, _1080p * 5, _1080p * 55 )
	Icon:SubscribeToModelThroughElement( self, "passive.image", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.passive.image:GetValue( f6_local1 )
		if f7_local0 ~= nil then
			Icon:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Name = nil
	
	Name = LUI.UIStyledText.new()
	Name.id = "Name"
	Name:SetFontSize( 20 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Name:SetAlignment( LUI.Alignment.Center )
	Name:SetStartupDelay( 1000 )
	Name:SetLineHoldTime( 400 )
	Name:SetAnimMoveTime( 150 )
	Name:SetEndDelay( 1000 )
	Name:SetCrossfadeTime( 400 )
	Name:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Name:SetMaxVisibleLines( 1 )
	Name:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 2.5, _1080p * -2.5, _1080p * 61, _1080p * 81 )
	Name:SubscribeToModelThroughElement( self, "passive.name", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.passive.name:GetValue( f6_local1 )
		if f8_local0 ~= nil then
			Name:setText( ToUpperCase( LocalizeString( f8_local0 ) ), 0 )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local Desc = nil
	
	Desc = LUI.UIStyledText.new()
	Desc.id = "Desc"
	Desc:SetAlpha( 0, 0 )
	Desc:SetFontSize( 18 * _1080p )
	Desc:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Desc:SetAlignment( LUI.Alignment.Center )
	Desc:SetStartupDelay( 1000 )
	Desc:SetLineHoldTime( 400 )
	Desc:SetAnimMoveTime( 150 )
	Desc:SetEndDelay( 1000 )
	Desc:SetCrossfadeTime( 400 )
	Desc:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	Desc:SetMaxVisibleLines( 3 )
	Desc:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 2.5, _1080p * -2.5, _1080p * 81, _1080p * 99 )
	Desc:SubscribeToModelThroughElement( self, "passive.desc", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.passive.desc:GetValue( f6_local1 )
		if f9_local0 ~= nil then
			Desc:setText( LocalizeString( ToUpperCase( f9_local0 ) ), 0 )
		end
	end )
	self:addElement( Desc )
	self.Desc = Desc
	
	self._animationSets.DefaultAnimationSet = function ()
		Icon:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Icon:SetAlpha( 1, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Name:SetAlpha( 1, 0 )
				end
			}
		} )
		Desc:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Desc:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Icon:AnimateSequence( "DefaultSequence" )
			Name:AnimateSequence( "DefaultSequence" )
			Desc:AnimateSequence( "DefaultSequence" )
		end
		
		Desc:RegisterAnimationSequence( "ShowDescription", {
			{
				function ()
					return self.Desc:SetAlpha( 1, 150 )
				end
			}
		} )
		self._sequences.ShowDescription = function ()
			Desc:AnimateSequence( "ShowDescription" )
		end
		
		Desc:RegisterAnimationSequence( "HideDescription", {
			{
				function ()
					return self.Desc:SetAlpha( 0, 150 )
				end
			}
		} )
		self._sequences.HideDescription = function ()
			Desc:AnimateSequence( "HideDescription" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local1( self, f6_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "ItemCardPassive", ItemCardPassive )
LockTable( _M )

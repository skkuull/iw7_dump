local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Background )
	if f1_arg2.missionTeamID then
		f1_arg0.Background:SetRGBFromTable( SWATCHES.MissionTeams[Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f1_arg2.missionTeamID, CSV.missionTeams.cols.color )] )
		f1_arg0.Background:SetBlendMode( BLEND_MODE.addWithAlpha )
		if f1_arg2.missionTeamID == MissionTeams.Wraith then
			f1_arg0.Title:SetRGBFromTable( SWATCHES.CAC.MissionInfoTabBorder, 0 )
		end
	end
end

function ItemCardFooter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 26 * _1080p )
	self.id = "ItemCardFooter"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 15132390, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:SetRGBFromInt( 0, 0 )
	Title:SetFontSize( 20 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Center )
	Title:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -10, _1080p * 10 )
	Title:SubscribeToModelThroughElement( self, "text", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.text:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			Title:setText( ToUpperCase( f3_local0 ), 0 )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local Shadow = nil
	
	Shadow = LUI.UIImage.new()
	Shadow.id = "Shadow"
	Shadow:SetRGBFromInt( 0, 0 )
	Shadow:SetAlpha( 0.4, 0 )
	Shadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	Shadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 10 )
	self:addElement( Shadow )
	self.Shadow = Shadow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.Background:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Title:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.Title:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			}
		} )
		self._sequences.CPDefault = function ()
			Background:AnimateSequence( "CPDefault" )
			Title:AnimateSequence( "CPDefault" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPDefault" )
	end
	return self
end

MenuBuilder.registerType( "ItemCardFooter", ItemCardFooter )
LockTable( _M )

local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RankInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 94 * _1080p, 0, 44 * _1080p )
	self.id = "RankInfo"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local RankIcon = nil
	
	RankIcon = LUI.UIImage.new()
	RankIcon.id = "RankIcon"
	RankIcon:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -59, _1080p * 4, _1080p * -4 )
	RankIcon:SubscribeToModelThroughElement( self, "rankIcon", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.rankIcon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			RankIcon:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local Rank = nil
	
	Rank = LUI.UIText.new()
	Rank.id = "Rank"
	Rank:SetFontSize( 24 * _1080p )
	Rank:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Rank:SetAlignment( LUI.Alignment.Left )
	Rank:SetOptOutRightToLeftAlignmentFlip( true )
	Rank:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -51, _1080p * -9, _1080p * -34, _1080p * -10 )
	Rank:SubscribeToModelThroughElement( self, "rankDisplay", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.rankDisplay:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Rank:setText( f3_local0, 0 )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.CPinit = function ()
			Rank:AnimateSequence( "CPinit" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "RankInfo", RankInfo )
LockTable( _M )

PersistentBackground = {
	SetToDefault = function ()
		PersistentBackground.Set( PersistentBackground.Variants.LetterboxOnlyBackground )
	end,
	Set = function ( f2_arg0 )
		local f2_local0 = Engine.GetLuiRoot()
		if not f2_local0.background then
			local self = LUI.UIElement.new()
			self.id = "persistent_bg_container"
			self:setupLetterboxElement()
			f2_local0.background = self
			f2_local0.background:setPriority( -1000 )
			f2_local0:addElement( self )
		end
		if f2_arg0 and f2_arg0 ~= PersistentBackground.current then
			PersistentBackground.current = f2_arg0
			local self = f2_arg0()
			f2_local0.background:closeChildren()
			f2_local0.background:addElement( self )
		end
	end,
	ProcessEvent = function ( f3_arg0 )
		local f3_local0 = Engine.GetLuiRoot()
		if f3_local0.background then
			f3_local0.background:processEvent( f3_arg0 )
		end
	end,
	Hide = function ( f4_arg0 )
		local f4_local0 = Engine.GetLuiRoot()
		if f4_local0.background then
			f4_local0.background:SetAlpha( 0 )
		end
	end,
	Show = function ( f5_arg0 )
		local f5_local0 = Engine.GetLuiRoot()
		if f5_local0.background then
			f5_local0.background:SetAlpha( 1 )
		end
	end,
	Variants = {
		DebugBackground = function ()
			local self = LUI.UIImage.new()
			self:registerAnimationState( "default", CoD.ColorizeState( SWATCHES.highlight.frontEnd, {
				material = RegisterMaterial( "white" ),
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				top = 300,
				height = 256,
				right = 0,
				width = 256
			} ) )
			self:registerAnimationState( "far", {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = false,
				rightAnchor = true,
				top = 300,
				height = 256,
				left = 0,
				width = 256
			} )
			self:animateToState( "default" )
			local f6_local1 = MBh.AnimateLoop( {
				{
					"default",
					0
				},
				{
					"far",
					5000
				}
			} )
			f6_local1( self, {} )
			return self
		end,
		LetterboxOnlyBackground = function ()
			local self = LUI.UIElement.new()
			self.id = "persistent_bg_letterbox"
			return self
		end
	}
}

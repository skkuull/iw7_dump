LuaQ            TNIL    	   TBOOLEAN       TLIGHTUSERDATA       TNUMBER       TSTRING       TTABLE    
   TFUNCTION    
   TUSERDATA       TTHREAD 	      TIFUNCTION 
      TCFUNCTION       TUI64       TSTRUCT                   _   ¶   ¶               6 ¶	        2 ¶  ¶  ¶             module          package          seeall        SPOxygenMeter        MenuBuilder          registerType   
       LockTable          _M                  	   l       _  ¶             9            9            9            9         2        	                	        
  2 2 2 2 2 2         ¶ 
               ¶ 
       / ¶          2 ¶ !      "      #      $%         &          assert   
       TitleText 
       ValueText        Fill        Glow        Mask .       WARNING: SP Oxygen Meter Items Are Missing...        SetMask        SetDotPitchEnabled        SetDotPitchX   À@           SetDotPitchY   @@       SetDotPitchContrast >       SetBlendMode        BLEND_MODE          addWithAlpha        currentState        WarningOff        ACTIONS          AnimateSequence 	       LoopGlow        DataSources          inGame        SP        helmetMeterOxygen        SubscribeToModel 	       GetModel                   h          L   L  ¶    2 4 L      V 2 L      	  
 2
x 2 p   9 2 L       A 9 L L       ¶ 
      
       2 ¶        L  ' 9 2 L         9 L L       ¶ 
      
       2 ¶        L  ¶        L 2     	       GetValue        Divide     ÈB       Mask        SetTopAnchor   ?
       ValueText        setText        %       ÈA
       WarningOn        currentState        Fill        SetRGBFromTable 	       SWATCHES   
       HUDMeters        fill_temp_hot        ACTIONS          AnimateSequence        WarningOff 	       fill_oxg 	       LoopGlow                   ¾      __  ¶              2 2 2 2	 2
 ¶	 

Z 2 ¶	 Z  h  h  z  9         
 9 ¶          9  ¶    
4  ¶               2	 2 ¶  	" 2	 2# $% ¶& (       2	 2
 2 2 2 ¶	 )X ¶	 *X ¶	 +X, 
6 4  ¶              -.	/ ¶0 	2      	3      
 2	 ¶  
4 2	
 2$	% ¶& 	(      	 2
 2 2 2 ¶	 5X ¶	 6X ¶	 *X ¶	 +!X,	 Z 4  ¶              7
 2 2
 ¶  8 2
 2#
 
 2 2 2 2 ¶	 9X ¶	 :X ¶	 *!X ¶	 +#X,
 n 4	  ¶ 	      	      	 ;	 2 2		 ¶  < 2 2		, 	v	 4
  ¶ 
=      
      
	 	>
./ ¶0 2      ?       2

@ ¶ A      B 2 2

C ¶	 VZ

DE ¶F H      E ¶F I      J       
 
K  ¶ L      M      

N 2 2

 2 2 2 2 ¶	 *!X ¶	 O#X ¶	 P%X ¶	 Q'X

, 
	|
 4  ¶ =            
 
R./ ¶0 2      S       2@T 2 2C ¶	 VZDE ¶F H      E ¶F I      J        K  ¶ L      U      N 2 2 2 2 2 2 ¶	 V#X ¶	 W%X ¶	 P'X ¶	 Q)X, 
¤       	 
        °       X        L   Y ¶Z \       ] 2   ^          LUI   
       UIElement        new        SetAnchorsAndPosition       ?       _1080p      C  ÔC       id        SPOxygenMeter        _animationSets        _sequences        controllerIndex        Engine          InFrontend        getRootController        assert          UIImage        Frame 	       SetAlpha    ?	       setImage        RegisterMaterial          hud_sp_meter_frame 	       SetUseAA        SetBlendMode        BLEND_MODE          addWithAlpha    Ã  Á  A       addElement        Glow        SetRGBFromTable 	       SWATCHES   
       HUDMeters 	       fill_oxg        hud_sp_meter_fill_glow   (Â  ´Â       Fill        hud_sp_meter_fill   @Â  ¨Â       Mask        white_2d_mask        UIStyledText 
       TitleText        text        setText 	       Localize        HUD_METER_OXG        SetFontSize        SetFont        FONTS          GetFont 	       MainBold        File        SetAlignment 
       Alignment        Left        SetShadowRGBFromInt    B  Á  A
       ValueText        value                Right   äÂ  Â       DefaultAnimationSet        ACTIONS          AnimateSequence        DefaultSequence                   õ       ___  h h      L  2      L       h h    
h            	   
 L  2  h 
h   	   
      	   
 
h         	   
   
 L 	 2  h 
h         	   
   
 L  2  h 
h      	   
      
 
L  2	 
 h 
h   	   
          
 L 	 2
 !        L       h	 h
"   	
 h#   
	 L	  2 		 h
 h$   
 h%   	
 L
  2 

 h h&   
 L  2  h h'    h(    
L  2  h h)    h*    L  2 +        L       h h,   -   .    L  2 /    L       
            RegisterAnimationSequence        DefaultSequence        _sequences 
       WarningOn        WarningOff 	       LoopGlow     0              
       __   L           2 2  ,               Mask 	       SetAlpha   ?                              _   L   2             AnimateSequence        DefaultSequence                           _   L           ¶              2  ,               Frame        SetRGBFromTable 	       SWATCHES   
       HUDMeters        fill_temp_hot                        
          L           2 2  ,               Frame 	       SetAlpha   ?                       
          L           2 2  ,               Frame 	       SetAlpha   ?  ÃC                   
          L           2 2  ,               Frame 	       SetAlpha    ?  RC                   
          L           2 2  ,               Frame 	       SetAlpha    ?  ÈC                   
          L           2 2  ,               Frame 	       SetAlpha   ?  HC                             L           ¶              2  ,               Glow        SetRGBFromTable 	       SWATCHES   
       HUDMeters        fill_temp_hot                               _   L           ¶              2  ,               Glow        SetRGBFromTable 	       SWATCHES   
       HUDMeters        fill_temp_hot   ÃC                          _   L           ¶              2  ,               Glow        SetRGBFromTable 	       SWATCHES   
       HUDMeters 	       fill_oxg   RC                          __   L           ¶              2  ,               Glow        SetRGBFromTable 	       SWATCHES   
       HUDMeters 	       fill_oxg   ÈC                          __   L           ¶              2  ,               Glow        SetRGBFromTable 	       SWATCHES   
       HUDMeters        fill_temp_hot   HC                   
       _   L           2 2  ,               Glow 	       SetAlpha   ?                       
       _   L           2 2  ,               Glow 	       SetAlpha   ?  ÃC                   
       _   L           2 2  ,               Glow 	       SetAlpha    ?  RC                   
       _   L           2 2  ,               Glow 	       SetAlpha    ?  ÈC                   
       _   L           2 2  ,               Glow 	       SetAlpha   ?  HC                          _   L           ¶              2  ,               Fill        SetRGBFromTable 	       SWATCHES   
       HUDMeters        fill_temp_hot                               _   L           ¶              2  ,               Fill        SetRGBFromTable 	       SWATCHES   
       HUDMeters        fill_temp_hot   ÃC                          _   L           ¶              2  ,               Fill        SetRGBFromTable 	       SWATCHES   
       HUDMeters 	       fill_oxg   RC                          __   L           ¶              2  ,               Fill        SetRGBFromTable 	       SWATCHES   
       HUDMeters 	       fill_oxg   ÈC                          __   L           ¶              2  ,               Fill        SetRGBFromTable 	       SWATCHES   
       HUDMeters        fill_temp_hot   HC                   
       _   L           2 2  ,        
       TitleText 	       SetAlpha   ?                       
          L           2 2  ,        
       TitleText 	       SetAlpha   ?  ÃC                   
          L           2 2  ,        
       TitleText 	       SetAlpha    ?  RC                   
          L           2 2  ,        
       TitleText 	       SetAlpha    ?  ÈC                   
          L           2 2  ,        
       TitleText 	       SetAlpha   ?  HC                   
          L           2 2  ,        
       ValueText 	       SetAlpha   ?                       
          L           2 2  ,        
       ValueText 	       SetAlpha   ?  ÃC                   
          L           2 2  ,        
       ValueText 	       SetAlpha    ?  RC                   
          L           2 2  ,        
       ValueText 	       SetAlpha    ?  ÈC                   
          L           2 2  ,        
       ValueText 	       SetAlpha   ?  HC                             L   2   L   2   L   2   L   2   L   2             AnimateLoop 
       WarningOn                    
       ___   L           2 2  ,               Frame        SetRGBFromInt ÿÿK                       
       ___   L           2 2  ,               Frame 	       SetAlpha    ?                                 L           ¶              2  ,               Glow        SetRGBFromTable 	       SWATCHES   
       HUDMeters 	       fill_oxg                        
       __   L           2 2  ,               Glow 	       SetAlpha   ?                       
       _   L           2 2  ,               Fill        SetRGBFromInt ÿÿK                                 L           ¶              2  ,        
       TitleText        SetRGBFromTable 	       SWATCHES   
       HUDMeters        text                        
       _   L           2 2  ,        
       TitleText 	       SetAlpha   ?                                 L           ¶              2  ,        
       ValueText        SetRGBFromTable 	       SWATCHES   
       HUDMeters        value                        
          L           2 2  ,        
       ValueText 	       SetAlpha   ?                                 L   2   L   2   L   2   L   2   L   2             AnimateSequence        WarningOff                    
       __   L           2 2  ,               Glow 	       SetAlpha   ?                       
       _   L           2 2  ,               Glow 	       SetAlpha    ?  zD                   
       _   L           2 2  ,               Glow 	       SetAlpha   ?  zD                          _   L   2             AnimateLoop 	       LoopGlow                    
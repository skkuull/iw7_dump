LuaQ            TNIL    	   TBOOLEAN       TLIGHTUSERDATA       TNUMBER       TSTRING       TTABLE    
   TFUNCTION    
   TUSERDATA       TTHREAD 	      TIFUNCTION 
      TCFUNCTION       TUI64       TSTRUCT            0       _   ¶   ¶          2  6 
 2 	 6  2  6  2  6  2  6  2  6  2  6     6    6    6    6    6  ¶          2 ¶    ¶  " ¶#    %          module          package          seeall        MIN_EXPONENT   >       MAX_EXPONENT    @	       MIN_STEP ÍÌÌ=	       MAX_STEP        MAX_HEIGHT_PCT þÔX?	       MAX_PIPS   ¸A       NUM_PIP_ELEMENTS   @@       InitializeFSparGaugeSettings        ResetFSparGaugeSettings        UpdateFSparGauge        PostLoadFunc        OlympusMonsFSparGauge        MenuBuilder          registerType   
       LockTable          _M                  
   Q         2 ¶   2I }         h ¶ 	 ¶
 	 ¶ 	T	 ¶ 	      		XP
! ¶  ¶ 	 ¶ 	T	 ¶ 	      		XP$   	 
 9        
              2  9 	 
 9        
              2 	 9        
              2´ÿ~       ?       NUM_PIP_ELEMENTS          fsparGaugeSettings 	       exponent        MIN_EXPONENT          MAX_EXPONENT          math          random 	       lastStep            currentStep 	       MIN_STEP   	       MAX_STEP          element        LeftPip    @
       CenterPip 	       RightPip                 	                          ¶  ¶  ¶ 
T ¶	       
XP                ¶                
      
        2 2   ' 9                ¶	                
      
        ¶ 
P ¶  ¶ T ¶	       X
P 2" & 9                ¶	                
      
        ¶  ¶  ¶ T ¶	       XP
T 2"            fsparGaugeSettings 	       exponent        MIN_EXPONENT          MAX_EXPONENT          math          random 	       lastStep        LUI          clamp        currentStep       ?       min 	       MIN_STEP   	       MAX_STEP          max                    Ê        
T ¶ X ¶ \                     p   9  		 2

 ¶ 	 2	¨ }    9                     p " 9                     p  9   9                     p 
 9                      p  9 ¶                                               T ¶                            T\                                            XP ¶        ¶  X v  9 ¶                	               	  9 t  9 2                                                     !X
T 2	Uÿ~             getLocalRect        MAX_HEIGHT_PCT   	       MAX_PIPS          LeftPip        fsparLastReloadState   ?       NUM_PIP_ELEMENTS          fsparGaugeSettings        currentStep 	       lastStep        ResetFSparGaugeSettings          math          pow 	       exponent        floor            element        SetTop                 
   !       _  h    ¶    ¶ 	      
                          	 
            fsparGaugeSettings        fsparLastReloadState            InitializeFSparGaugeSettings          DataSources          inGame        SP        heistSpace        olympusMonsWeaponStatus 	       GetModel        SubscribeToModel                             ¶           L  ¶  L       
       DataModel          GetModelValue        UpdateFSparGauge                      |      ___  ¶              2 2 2 2	 2
 ¶	 

Z 2 ¶	 Z  h  h  z  9         
 9 ¶          9  ¶    
4  ¶               2	 2   ¶! #       2	 2
 2 2 ¶	 $X ¶	 %X ¶	 &X ¶	 'X( 
6 4  ¶              )	 2
 2	 	  ¶! 	#      	 2
 2 2 2 ¶	 *X ¶	 +X ¶	 &X ¶	 '!X(	 R 4  ¶              ,
 2 2
 
  ¶! 
#      
 2 2 2 2 ¶	 -X ¶	 .X ¶	 &!X ¶	 '#X(
 X 4	  ¶ 	      	      	 /	01 ¶2 4 2 2		 		 2 2 2 2 2 2 2 2		( 	^	 4
  ¶ 
      
      
	 	5
01 ¶2 6 2 2

 

( 
	j
 4  ¶ 7            
 
89 2 2: ¶ ;      < 2 2= ¶	 |Z?@ ¶A C      @ ¶A D      E        F  ¶ G      H       2 2 2 2 ¶	 I#X 2 2 ¶	 J)X( 
p      
               K         L ¶M O      P      Q      R      ST  U ¶V       X          LUI   
       UIElement        new        SetAnchorsAndPosition       ?       _1080p     C GD       id        OlympusMonsFSparGauge        _animationSets        _sequences        controllerIndex        Engine          InFrontend        getRootController        assert          UIImage        LeftPip        SetRGBFromInt  K	       SetUseAA        SetBlendMode        BLEND_MODE          add   vB @+Ã  fÂ  
Â       addElement 
       CenterPip ÂàBÂèÂ	       RightPip Ha*CyÂ
       GaugeMask 	       setImage        RegisterMaterial   !       radar_targeting_fspar_gauge_mask        Gauge        radar_targeting_fspar_gauge        UIText        Primed   K       setText 	       Localize        HEIST_PRIMED        SetFontSize   pB       SetFont        FONTS          GetFont 	       MainBold        File        SetAlignment 
       Alignment        Center   À@áª7Ä       DefaultAnimationSet        DataSources          inGame        SP        heistSpace        olympusMonsWeaponStatus        SubscribeToModel 	       GetModel        PostLoadFunc                                 L         h h          L 2  h h          L 2  h h      	    L	 2  h h
         	   
       L 2        L        h h    L	 2
  h h	    L
 2  h	 h
   		 L	 2 		 h
 h   
	
 L
 2 

       L       
            _sequences        DefaultSequence        RegisterAnimationSequence        Ready 	       Charging                           __                         
       ___   L           2 2  ,               LeftPip        SetRGBFromInt  J K                              _   L           2 2 ¶               
,     	          LeftPip        SetRGBFromInt  K  úC       LUI          EASING 
       inOutSine                           ___   L           2 2 ¶               
,     	          LeftPip        SetRGBFromInt  J K  úC       LUI          EASING 
       inOutSine                    
       ___   L           2 2  ,        
       CenterPip        SetRGBFromInt  J K                              ___   L           2 2 ¶               
,     	   
       CenterPip        SetRGBFromInt  K  úC       LUI          EASING 
       inOutSine                           _   L           2 2 ¶               
,     	   
       CenterPip        SetRGBFromInt  J K  úC       LUI          EASING 
       inOutSine                    
       _   L           2 2  ,        	       RightPip        SetRGBFromInt  K K                                 L           2 2 ¶               
,     	   	       RightPip        SetRGBFromInt  K  úC       LUI          EASING 
       inOutSine                           __   L           2 2 ¶               
,     	   	       RightPip        SetRGBFromInt  J K  úC       LUI          EASING 
       inOutSine                    
       __   L           2 2  ,               Primed 	       SetAlpha                                  L           2 2 ¶               
,     	          Primed 	       SetAlpha   ?  ¥C       LUI          EASING        inSine                              L           2 2 ¶               
,     	          Primed 	       SetAlpha        A       LUI          EASING        outQuintic                              L           2 2 ¶               
,     	          Primed 	       SetAlpha   ?   C       LUI          EASING        inSine                              L           2 2 ¶               
,     	          Primed 	       SetAlpha        A       LUI          EASING        outQuintic                              L           2 2 ¶               
,     	          Primed 	       SetAlpha   ?  ¥C       LUI          EASING        inSine                              L   2   L   2   L   2   L   2             AnimateLoop        Ready                    
       ___   L           2 2  ,               LeftPip        SetRGBFromInt  J K                       
       _   L           2 2  ,        
       CenterPip        SetRGBFromInt  J K                       
       ___   L           2 2  ,        	       RightPip        SetRGBFromInt  J K                       
          L           2 2  ,               Primed 	       SetAlpha                                  L   2   L   2   L   2   L   2             AnimateSequence 	       Charging                    ]          ¶                                    L   9   ¶                                    L  	p  9 
 ¶          L 2    ¶                                    L   9   ¶                                    L   v  9 
 ¶          L 2             DataSources          inGame        SP        heistSpace        olympusMonsWeaponStatus 	       GetValue    ?       ACTIONS          AnimateSequence 	       Charging        Ready                    
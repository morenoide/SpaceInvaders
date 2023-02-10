*-----------------------------------------------------------
;   VARIABLES DEL JUEGO
*-----------------------------------------------------------

; --- LASER JUGADOR ----------------------------------------
   
LASPOSX     DS.W    1       ; COORDENADAS LASER X
LASPOSY     DS.W    1       ; COORDENADAS LASER Y

; --- VARIABLES JUGADOR ------------------------------------

PJPOSX      DS.W    1       ; POSICION JUGADOR
; --- SCOREBOARD VARIABLES ---------------------------------
SCOOUT      DS.W    1       ; PUNTOS PERDIDOS (MUERTES)(OPCIONAL)
; --- INTRO STATE RELATED VARIABLES --------------------------------------------
ISCTIMER    DS.W    1       ; INTRO TIMER

;--- INSTUCCTIONS STATE RELATED VARIABLES --------------------------------------------
INSTIMER    DS.W    1       ;INSTRUCCION TIMER

; --- STATE RELATED VARIABLES --------------------------------------------------

STACUR      DS.W    1        ; CURRENT STATE
STANEXT     DS.W    1        ; NEXT STATE







*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~

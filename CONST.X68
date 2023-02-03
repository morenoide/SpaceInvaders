*-----------------------------------------------------------
;   CONSTANTES DEL JUEGO
*-----------------------------------------------------------

; --- LASER CONSTANTES -------------------------------------

LASX        EQU     4               ; TAMA�O X LASER
LASY        EQU     16              ; TAMA�O Y LASER
LASCOLOR    EQU     $00ffffff       ; COLOR CONTORNO LASER
LASFILL     EQU     $0000ffff       ; COLOR RELLENO LASER
LASSPEED    EQU     3               ; VELOCIDAD LASER

; --- JUGADOR VARIABLES ------------------------------------

PJANCHO     EQU     128             ; ANCHURA JUGADOR
PJALTO      EQU     16              ; ALTURA JUGADOR
PJY         EQU     500             ; POSICION JUGADOR
PJSPEED     EQU     7               ; VELOCIDAD JUGADOR
PJCOLOR     EQU     $00FF0000       ; COLOR CONTORNO JUGADOR
PJFILL      EQU     $000000FF       ; COLOR RELLENO JUGADOR

; --- CONSTANTES MARCADOR ----------------------------------

SCOFILL     EQU     $00000000       ; TEXT BACKGROUND COLOR
SCOLINE1    EQU     $0101           ; PRIMERA LINEA, SCORE ACTUAL
SCOLINE2    EQU     $1001           ; SEGUNDA LINEA, SCORE MAX



*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
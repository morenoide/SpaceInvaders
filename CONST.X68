*-----------------------------------------------------------
;   CONSTANTES DEL JUEGO
*-----------------------------------------------------------

; --- LASER CONSTANTES -------------------------------------

LASX        EQU     4               ; TAMAÑO X LASER
LASY        EQU     16              ; TAMAÑO Y LASER
LASCOLOR    EQU     $00ffffff       ; COLOR CONTORNO LASER
LASFILL     EQU     $0000ffff       ; COLOR RELLENO LASER
LASSPEED    EQU     8               ; VELOCIDAD LASER

; --- AGENTES CONSTANTES -----------------------------------

LASID       EQU     1               ;ID DE LOS LASERES
ENEID       EQU     2               ;ID DE LOS LASERES

; --- JUGADOR VARIABLES ------------------------------------

PJANCHO     EQU     128             ; ANCHURA JUGADOR
PJALTO      EQU     16              ; ALTURA JUGADOR
PJY         EQU     500             ; POSICION JUGADOR
PJSPEED     EQU     7               ; VELOCIDAD JUGADOR
PJCOLOR     EQU     $00FF0000       ; COLOR CONTORNO JUGADOR
PJFILL      EQU     $000000FF       ; COLOR RELLENO JUGADOR

; --- CONSTANTES ENEMIGO -----------------------------------

ENEANCHO    EQU     32
ENEALTO     EQU     32
ENESPEED    EQU     1
ENEYSPEED   EQU     32
ENECOLOR    EQU     $00FFFF00
ENEFILL     EQU     $00FF00FF

; --- CONSTANTES MARCADOR ----------------------------------

SCOFILL     EQU     $00000000       ; TEXT BACKGROUND COLOR
SCOLINE1    EQU     $0101           ; PRIMERA LINEA, SCORE ACTUAL
SCOLINE2    EQU     $1001           ; SEGUNDA LINEA, SCORE MAX
SCOLINE3    EQU     $0103           ; GOAL FPS TEXT
SCOLINE4    EQU     $1003           ; ACTUAL FPS TEXT








*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~

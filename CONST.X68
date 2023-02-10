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

PJANCHO     EQU     64             ; ANCHURA JUGADOR
PJALTO      EQU     16              ; ALTURA JUGADOR
PJY         EQU     500             ; POSICION JUGADOR
PJSPEED     EQU     7               ; VELOCIDAD JUGADOR
PJCOLOR     EQU     $0000FFFF       ; COLOR CONTORNO JUGADOR
PJFILL      EQU     $00000FFF       ; COLOR RELLENO JUGADOR

; --- CONSTANTES ENEMIGO -----------------------------------

ENEANCHO    EQU     32
ENEALTO     EQU     32
ENESPEED    EQU     4
ENEYSPEED   EQU     32
ENECOLOR    EQU     $0000AAFF
ENEFILL     EQU     $000000FF
ENENUMF     EQU     4
ENENUMC     EQU     8

; --- CONSTANTES MARCADOR ----------------------------------

SCOFILL     EQU     $00000000       ; TEXT BACKGROUND COLOR
SCOLINE1    EQU     $0101           ; PRIMERA LINEA, SCORE ACTUAL
SCOLINE2    EQU     $1001           ; SEGUNDA LINEA, SCORE MAX
SCOLINE3    EQU     $0103           ; GOAL FPS TEXT
SCOLINE4    EQU     $1003           ; ACTUAL FPS TEXT

; --- STATE RELATED CONSTANTS --------------------------------------------------

STANONE     EQU     -1                  ; NON-EXISTENT STATE NUMBER
ISCMAXTM    EQU     500                 ;INTRO SCRREN WAITING CYCLES
INSMAXTM    EQU     500                 ;INSTRUCTION SCREEN WAITING CYCLES

;----- VICTORY/DEFEAT CONSTANTS---------------

SCOOUTMX    EQU     32              ;CONDICION DE VICTORIA MATAR A LOS 32 ENEMIGOS




















*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~

*-----------------------------------------------------------
; CONSTANTES DEL SISTEMA
*-----------------------------------------------------------

; --- CONSTANTES PANTALLA ----------------------------------

SCRWIDTH    EQU     640                 ;SCREEN WIDTH
SCRHEIGHT   EQU     640                 ;SCREEN HEIGHT
FPS         EQU     100                 ; FPS

; --- CODIGOS DE CARACTERES --------------------------------

KBDLEFT     EQU     $25     ; FLECHAS
KBDUP       EQU     $26
KBDRIGHT    EQU     $27
KBDDOWN     EQU     $28
KBDFIRE1    EQU     ' '     ; ESPACIO
KBDFIRE2    EQU     'M'     ; TECLA M
KBDFIRE3    EQU     $10     ; TECLA SHIFT
KBDPAUSE    EQU     'P'     ; TECLA P

; --- ID SONIDOS -------------------------------------------

SNDHIT      EQU     0
SNDSHOOT    EQU     1

; --- TRAP NUMBER ------------------------------------------

SCRUPTN     EQU     0       ; TRAP ACTUALIZAR PANTALLA
KBDUPTN     EQU     1       ; TRAP ACTUALIZAR TECLADO
SNDPLTN     EQU     2       ; TRAP PLAY SONIDO
MOUSETRAP   EQU     3       ;TRAP MAUSE

; --- INTERRUPT NUMBERS ------------------------------------

SCRINTN     EQU     1       ; NUMERO INTERRUPCION
FPSTN       EQU     2       ; INTERRUPCION CONTADOR FPS




*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~

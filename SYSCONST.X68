*-----------------------------------------------------------
; CONSTANTES DEL SISTEMA
*-----------------------------------------------------------

; --- CONSTANTES PANTALLA ----------------------------------

SCRWIDTH    EQU     640                 ;SCREEN WIDTH
SCRHEIGHT   EQU     640                 ;SCREEN HEIGHT
FPS         EQU     60                  ; FPS

; --- CODIGOS DE CARACTERES --------------------------------

KBDLEFT     EQU     $25     ; FLECHAS
KBDUP       EQU     $26
KBDRIGHT    EQU     $27
KBDDOWN     EQU     $28
KBDFIRE1    EQU     ' '     ; ESPACIO
KBDFIRE2    EQU     'M'     ; TECLA M
KBDFIRE3    EQU     $10     ; TECLA SHIFT
KBDPAUSE    EQU     'P'     ; TECLA P

; --- TRAP NUMBER ------------------------------------------

SCRUPTN     EQU     0       ; TRAP ACTUALIZAR PANTALLA
KBDUPTN     EQU     1       ; TRAP ACTUALIZAR TECLADO

; --- INTERRUPT NUMBERS ------------------------------------

SCRINTN     EQU     1       ; NUMERO INTERRUPCION



*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~

*-----------------------------------------------------------
;   VARIABLES DEL SISTEMA
*-----------------------------------------------------------


; --- VARIABLES DE TECLADO  --------------------------------

KBDVAL      DS.B    1           ; ESTADO DE TODAS LAS TECLAS
KBDEDGE     DS.B    1           ; SI SE ACABA DE PULSAR UNA TECLA
MOUSEPRESS  DS.B    1           ;SI SE HA PRESIONADO
MOUSEPOS    DS.L    1

; --- VARIABLES DE SINCRONIZACION DE TIEMPO (FPS)  ---------

SCRINTCT    DS.B    1           ;CONTADOR DE INTERRUPCION
            DS.W    0
FPSCOUNT    DS.W    1           ;CONTADOR FRAMES REALES POR SEGUNDO
FPSSHOW     DS.W    1           ;MUESTRA LOS FPS EN PANTALLA
SCRCYCCT    DS.B    1           ;CONTADOR FRAMES
            DS.W    0



*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~

; =============================================================================
; GRAPHICS LIBRARY. NOTE THAT, IN SPITE OF THE NAME, THESE ARE NOT SUBROUTINES
; FOLLOWING THE LIBRARY CONVENTIONS. THE WORLD IS SLIGHTLY WORST BY DOING SO.
; A PICTURE IS A SEQUENCE OF:
; - ID: WORD SPECIFYING THE ACTION TO DO. POSSIBLE VALUES ARE SHOWN IN THE
;   COMMENTS OF .JMPTBL IN GFXDRPIC
; - VALUES: DEPEND ON THE ACTION. SINCE THE GRAPHIC ACTION CORRESPONDS TO TASK
;   ID+79 OF TRAP #15, THE VALUES TO USE ARE RELATED TO THE TASK PARAMETERS.
;   FOR EXAMPLE, IF ID=1 A SINGLE LONG VALUE SPECIFYING COLOR IS EXPECTED. IF
;   ID=8, THE FOUR WORD COORDINATES REQUIRED TO DRAW A RECTANGLE ARE TO BE
;   PROVIDED.
; =============================================================================
         
; -----------------------------------------------------------------------------
GFXDRWCL
; DRAWS A PICTURE BY ID
; INPUT    - A2 POINTER TO THE LIST OF POINTERS TO COLORS
;            D2.B COLOR ID
;            D3.W X OFFSET
;            D4.W Y OFFSET
; OUTPUT   - NONE
; MODIFIES - A1
; -----------------------------------------------------------------------------
            MOVEM.L D0-D7/A2,-(A7)
            ROL.W   #2,D2                   ; PREPARE INDEX
            MOVE.L  (A2,D2.W),A2

; -----------------------------------------------------------------------------
GFXDRPXL
; DRAWS THE PIXEL OF A SPRITE
; INPUT    - D1.W COLOR
;            D4.W X OFFSET
;            D3.W Y OFFSET
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVE.B  #80,D0
            TRAP    #15
            MOVE.B  #82,D0
            MOVE.W  D4,D1
            MOVE.W  D3,D2
            TRAP    #15
            RTS


*~Font name~Courier New~
*~Font size~10~
*~Tab type~0~
*~Tab size~4~

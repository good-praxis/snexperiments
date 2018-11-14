;== Include memorymap, header info, and SNES initialization routines
.include "libSFX.i"

;===================
; Start
;===================

Main:
        stz     $2122
        lda     #$7C
        sta     $2122

        lda #$0F
        sta $2100
forever:
        jmp forever

;== Include memorymap, header info, and SNES initialization routines
.include "libSFX.i"

;===================
; Start
;===================

Main:
        VBL_on
        stz     $2121
        stz     $2122
        stz     $2122
        lda     #$0F
        sta     $2100
        wai
        jmp     red
red:
        stz     $2121
        stz     $2122
        lda     #$1F
        sta     $2122
        lda     #$0F
        sta     $2100
        jsr     waitingaholebunch
        jmp     blue
blue:
        stz     $2121
        lda     #$7C
        sta     $2122
        stz     $2122
        lda     #$0F
        sta     $2100
        jsr     waitingaholebunch
        jmp     green
green:
        stz     $2121
        lda     #$03
        sta     $2122
        lda     #$E0
        sta     $2122
        lda     #$0F
        sta     $2100
        jsr     waitingaholebunch
        jmp     red

waitingaholebunch:
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        wai
        lda     #$0F
        sta     $2100
        rts

    

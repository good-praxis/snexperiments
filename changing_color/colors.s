;== Include memorymap, header info, and SNES initialization routines
.include "libSFX.i"

;===================
; Start
;===================

Main:
        VBL_on
        stz     $2122
        lda     #$4F
        sta     $2122
        stz $2122
        stz $2122
        lda     #$0F
        sta     $2100
        stz $2122
        stz $2122
        stz     $2100
        lda     #$0F
        sta     $2100
        jmp     increment

increment:
        stz $2122
        stz $2122
        lda     $2122
        cmp     #$FE
        beq     decrement

        inc     $2122
        jsr     wait
        jmp     increment

decrement:
        jmp     wait
        lda     $2122
        cmp     #$00
        beq     increment

        dec     $2122
        jsr     wait
        jmp     decrement

wait:
        lda     $4212
        cmp     #$40
        beq     return
        jmp     wait

return:
        stz $2122
        stz $2122
        rts

end:

        

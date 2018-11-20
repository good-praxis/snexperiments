;== Include memorymap, header info, and SNES initialization routines
.include "libSFX.i"

;===================
; Start
;===================

Main:
        VBL_on
        lda     %10000001
        sta     $4200   ;enabling joypad
        lda     %11000000
        sta     $4201   ;???
        lda     #$0F
        sta     $2100
        jmp     mainloop

mainloop:
        wai
        lda     #$81    ; enabling joypad
        sta     $4200

checkRed:
        lda     #$1F    ; value of red
        sta     $0000   ; write registers
        stz     $0001

        lda     $0034   ; getting input
        cmp     #$01    ; pressing right?
        beq     write


checkBlue:
        lda     #$7C    ; value of blue
        stz     $0000   ; write registers
        sta     $0001

        lda     $0034
        cmp     #$02    ; pressing left?
        beq     write

checkGreen:
        lda     #$E0    ; value of green
        sta     $0000   ; write registers
        lda     #$03
        sta     $0001

        lda     $0034
        cmp     #$04    ;11111011, so it'll be FF if we press down
        beq     write


checkWhite:

        cmp     #$08    ;11110111, so it'll be FF if we press up
        lda     #$FF
        sta     $0000   ; write registers
        sta     $0001
 
        lda     $0034
        cmp     #$08    ;11110111, so it'll be FF if we press down
        beq     write


black: 
        stz     $0000
        stz     $0001


write:
        stz     $2121
        lda     $0000
        sta     $2122
        lda     $0001
        sta     $2122
        lda     #$0F
        sta     $2100
        stz     $0000
        stz     $0001
        jmp     mainloop
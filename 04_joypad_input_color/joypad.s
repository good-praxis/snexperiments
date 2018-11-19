;== Include memorymap, header info, and SNES initialization routines
.include "libSFX.i"

;===================
; Start
;===================

Main:
        VBL_on
        SFX_JOY = JOY1
        lda     %10000001
        sta     $4200   ;enabling joypad
        lda     %11000000
        sta     $4201   ;???
        lda     #$0F
        sta     $2100
        jmp     mainloop

sleep:
        wai

mainloop:
        lda     #$81    ; enabling joypad
        sta     $4200
getInput:
        lda     #$FE
        and     $4212
        cmp     #$FF
        beq     sleep

        lda     $4219
        sta     $0003

        JSR     checkRed

        lda     $0003
        JSR     checkBlue

        lda     $0003
        JSR     checkGreen

        lda     $0003
        JSR     checkWhite

        jmp     black


checkRed:
        and     #$FE    ;11111110, so it'll be FF if we press right
        cmp     #$FF
        lda     #$1F    ; value of red
        sta     $0000   ; write registers
        stz     $0001
        beq     write
        rts

checkBlue:
        and     #$FD    ;11111101, so it'll be FF if we press left
        cmp     #$FF
        lda     #$7C    ; value of blue
        stz     $0000   ; write registers
        sta     $0001
        beq     write
        rts

checkGreen:
        and     #$FB    ;11111011, so it'll be FF if we press down
        cmp     #$FF
        lda     #$E0    ; value of green
        sta     $0000   ; write registers
        lda     #$03
        sta     $0001
        beq     write
        rts


checkWhite:

        and     #$F7    ;11110111, so it'll be FF if we press up
        cmp     #$FF    ; also value of white (duh)
        sta     $0000   ; write registers
        sta     $0001
        beq     write
        rts

black: 
        stz     $0000
        stz     $0001


write:
        stz     $0003

        stz     $2121
        lda     $0000
        sta     $2122
        lda     $0001
        sta     $2122
        lda     #$0F
        sta     $2100
        stz     $0000
        stz     $0001
        jmp     sleep
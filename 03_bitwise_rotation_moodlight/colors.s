;== Include memorymap, header info, and SNES initialization routines
.include "libSFX.i"

;===================
; Start
;===================

Main:
        VBL_on
        stz     $2121

        stz     $2122
        lda     #%00011111
        sta     $2122
        
        lda     #$0F
        sta     $2100
        
        jmp     mainloop

mainloop:
        wai             ; waiting for interrupt
        clc
        sec             ; making sure we will use the carry flag
        
        stz     $2121
        lda     $213b   ; reading from CG-RAM
        rol     a       ; rotating with carry
        tax             ; storing into x for now
        lda     $213b
        rol     a
        tay             ; transfering to y for now
        
        txa
        adc     #$00    ; adding 0, this will add the carry bit if set
        
        stz     $2121   ; resetting address

        sta     $2122
        tya
        sta     $2122



loopSetup:     
        lda     #$1F    ; setting up the loop counter
        sta     $0000
loop:
        lda     #$0F    
        sta     $2100   ; turning on the screen before doing anything else
        
        lda     $0000
        cmp     #$00    ; if counter is 0
        beq     mainloop       

        dec     a
        sta     $0000

        wai
        jmp     loop


        

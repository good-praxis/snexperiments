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
                        ; We are going to use $0002 and $0003 as our
                        ; local copies of CGRAM, because the 7th bit
                        ; of the 2nd byte of CGRAM resets inbetween frames.
        sta     $0003   
        
        lda     #$0F
        sta     $2100
        
        jmp     mainloop

mainloop:
        wai             ; waiting for interrupt

        clc

        lda     $0002   ; reading local version of CGRAM (first address)
        rol
        sta     $0002   ; Storing this again because we'll have to add carry later
        
        lda     $0003   ; Reading 2nd address
        rol     
        sta     $0003 
        
        lda     $0002
        adc     #$00    ; adding 0, this will add the carry bit if set
        sta     $0002

        stz     $2121   ; resetting address, adding new values to CGRAM
        sta     $2122   
        lda     $0003
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


        

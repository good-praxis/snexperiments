;== Include memorymap, header info, and SNES initialization routines
.include "libSFX.i"

;===================
; Start
;===================

Main:
        VBL_on
        lda #%00011111
        sta $2122
        stz $2122
        lda     #$0F
        sta     $2100
        jmp     increment

increment:
        wai
        ; ldx     $2122
        ; lda     $2122 
        ; asl     a 
        ; sta     $2122
        ; txa     
        ; asl     a
        ; sta     $2122
        rol     $2122
        rol     $2122

        lda     #$0F
        sta     $2100
        jmp     increment

; decrement:
;         jmp increment
;         wai
;         lda     $2122
;         cmp     #$00
;         beq     increment

;         dec     $2122
;         stx     $2100
;         jmp     decrement

; end:    
;         wai
;         stx     $2100
;         jmp end

        

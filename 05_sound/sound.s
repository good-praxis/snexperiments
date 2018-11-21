.include "libSFX.i"

;===================
; Start
;===================

Main:
        SMP_playspc SPC_State, SPC_Image_Lo, SPC_Image_Hi

:       wai
        bra     :-
        


;Import music
.define spc_file "Data/pmk-03.spc"
.segment "RODATA"
SPC_State:    SPC_incbin_state spc_file
.segment "ROM2"
SPC_Image_Lo: SPC_incbin_lo spc_file
.segment "ROM3"
SPC_Image_Hi: SPC_incbin_hi spc_file

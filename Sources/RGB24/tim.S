/* tim.S — embed bunpattern.tim TIM texture as a .rodata symbol */
    .section .rodata
    .global tim_image
    .align 4
tim_image:
    .incbin "Sources/RGB24/bunpattern.tim"

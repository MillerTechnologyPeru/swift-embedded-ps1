/* ball16c.S — embed ball16c.tim TIM texture as a .rodata symbol */
    .section .rodata
    .global ball16c
    .align 4
ball16c:
    .incbin "Sources/Balls/ball16c.tim"

/* tim.S — embed tiles_256.tim TIM texture as the tim_tileset symbol */
    .section .rodata
    .global tim_tileset
    .align 4
tim_tileset:
    .incbin "Sources/Tiles/tiles_256.tim"

; Spawn an obstacle but not always
spawnObstacles:
	ld a, [ASTEROID_SPAWN_IN]
	or a
	call z, updateSpawnTimer
	dec a
	ld [ASTEROID_SPAWN_IN], a
	ret

updateSpawnTimer::
	call createObstacle
	call random
	and %00011111
	inc a
	ret

; Create a random obstacle
; Params:
;    None
; Return:
;    None
; Registers:
;    N/A
createObstacle::
	ld hl, OBSTACLES_ADDR
.loop:
	ld a, [hli]
	or a
	jr z, .endLoop
	inc hl
	inc hl
	inc hl
	jr .loop
.endLoop:
	dec hl

	; y speed downward
	call random
	and %00000011
	inc a
	ld [hli], a

	; y value is set to 0 the obstacle must start at the top of the screen
	ld a, 0
	ld [hli], a

	; x value
	call random
	and %01111111
	ld [hli], a

	ld hl, OBSTACLES_ADDR
	inc [hl]
	ret

; Update all obstacles
; Params:
;    None
; Return:
;    None
; Registers:
;    N/A
updateObstacles::
	ld hl, OBSTACLES_ADDR
	ld de, (OAM_SRC_START << 8) + SPRITE_SIZE * (NB_PLAYERS + NB_LASERS_MAX)
.loop;
	; apply the speed to y
	ld a, [hli]
	ld b, a
	ld a, [hl]
	add b
	ld [hli], a

	cp $C0
	jr nc, .deleteObstacle

	; y
	ld [de], a
	inc de

	; x
	ld a, [hli]
	add a, $8
	ld [de], a
	inc de

	ld a, ASTEROID_SPRITE_INDEX
	ld [de], a
	inc de

	ld a, %00010000
	ld [de], a
	inc de

	dec hl
	dec hl
	; y 2
	ld a, [hli]
	ld [de], a
	inc de

	; x
	ld a, [hli]
	add a, $10
	ld [de], a
	inc de

	ld a, ASTEROID_SPRITE_INDEX + 2
	ld [de], a
	inc de

	ld a, %00010000
	ld [de], a
	inc de

	; the padding byte
	inc hl

	ld a, $00
	cp e
	jr nz, .loop
	ret
.deleteObstacle:
	dec hl
	dec hl
	xor a
	ld [hli], a
	inc hl
	inc hl
	inc hl
	jr .loop
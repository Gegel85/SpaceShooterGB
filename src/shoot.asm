deleteLaser::
	push hl
	push de

	ld a,[NB_SHOOTS]
	dec a
	ld [NB_SHOOTS],a

	ld h, d
	ld l, e

	rla
	dec de
	add SHOOTS_PTR & $FF
	sub e
	rla

	ld b, 0
	ld c, a

	inc hl

	call copyMemory

	pop de
	pop hl
	dec de
	dec de
	ret

; Collision between laser and boss
; Params:
;    de -> The address of the laser struct
; Return:
;    None
; Registers:
;    af -> Not preserved
checkCollisionsWithBoss::
	ld a, [BOSS_STATUS]
	or a
	ret z

	push hl
	push de

	ld a, [de]
	ld b, a
	add a, $8
	ld hl, BOSS_STRUCT + PLAYER_STRUCT_X_OFF
	cp [hl]
	ld a, 0
	jr c, .noCollide

	inc de
	ld a, [de]
	ld c, a
	add a, $8
	ld hl, BOSS_STRUCT + PLAYER_STRUCT_Y_OFF
	cp [hl]
	ld a, 0
	jr c, .noCollide

	ld a, [BOSS_STRUCT + PLAYER_STRUCT_X_OFF]
	add a, BOSS_SIZE_X
	cp b
	ld a, 0
	jr c, .noCollide

	ld a, [BOSS_STRUCT + PLAYER_STRUCT_Y_OFF]
	add a, BOSS_SIZE_Y
	cp c
	ld a, 0
	jr c, .noCollide

	pop de
	inc de
	call deleteLaser
	push de

	ld a, [BOSS_STATUS]
	cp $6
	ld a, 1
	pop de
	pop hl
	ret nz

	push hl
	push de
	ld hl, meteorDestruction
	call playNoiseSound

	ld a, 1
	ld hl, BOSS_STRUCT + 2
	dec [hl]

	pop de
	pop hl


	jr nz, .noCollide
	jp killBoss
.noCollide:
	pop de
	pop hl
	ret

; Collision between spaceship and asteroid
; Params:
;    de -> The address of the laser struct
; Return:
;    None
; Registers:
;    hl -> Preserved
;	 de -> Preserved
checkCollisionsWithLasers::
	push hl
	ld hl, OBSTACLES_ADDR
.loop:
	inc hl

	inc de
	ld a, [de]
	cp [hl]
	call c, laserCollideY

	inc hl
	inc hl
	inc hl
	dec de

	ld a, l
	cp $FF
	jr z, .collided
	cp $88
	jr nz, .loop

	pop hl
	ret
.collided:
	pop hl
	inc de
	pop bc
	jr updateLasers.skip

laserCollideY::
	add $10
	cp [hl]
	inc hl
	call nc, laserCollideX
	dec hl
	ret

laserCollideX::
	dec de
	ld a, [de]
	add $10
	inc de
	cp [hl]
	ret c
	sub $20
	cp [hl]
	call c, laserCollided
	ret

laserCollided::
	dec hl
	call deleteObstacle
	call deleteLaser
	push hl
	push de
	ld hl, meteorDestruction
	call playNoiseSound
	ld de, 5
	call addScore
	pop de
	pop hl
	ld l, $FD
	ret

updateLasers::
	xor a
	ld hl, (OAM_SRC_START << 8) + SPRITE_SIZE * 2
	ld d, h
	ld e, l
	ld bc, 40
	call fillMemory

	ld a,[NB_SHOOTS]
	or a
	ret z
	ld de, SHOOTS_PTR
.loop:
	push af
	call checkCollisionsWithLasers
	call checkCollisionsWithBoss
	or a
	jr nz, .skip

	inc de
	ld a, [de]
	add a, $10
	ld [hli], a

	dec de
	ld a, [de]
	add a, $8
	ld [hli], a

	ld a, $6
	ld [hli], a

	ld a, $0
	ld [hli], a

	inc de
	ld a, [de]
	sub a, 4
	ld [de], a

	cp a, $EE
	jr nc, .skip
	cp a, $90
	jr c, .skip
	call deleteLaser
.skip:
	inc de
	pop af
	dec a
	jr nz, .loop
	ret

shoot::
	ld a,[NB_SHOOTS]
	ld b, 0
	ld c, a
	add 0
	rl c
	inc a
	ld [NB_SHOOTS], a
	ld hl, SHOOTS_PTR
	add hl, bc
	ld d, h
	ld e, l
	ld hl, PLAYER1_STRUCT
	ld a, [hli]
	add a, 4
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ret
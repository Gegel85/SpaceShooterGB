updatePlayer::
	ld hl, OAM_SRC_START << 8

	ld a, [PLAYER1_STRUCT + PLAYER_STRUCT_Y_OFF]
	add a, $10
	ld [hli], a
	ld a, [PLAYER1_STRUCT + PLAYER_STRUCT_X_OFF]
	add a, $8
	ld [hli], a
	ld a, $2
	ld [hli], a
	xor a
	ld [hli], a

	ld a, [PLAYER1_STRUCT + PLAYER_STRUCT_Y_OFF]
	add a, $10
	ld [hli], a
	ld a, [PLAYER1_STRUCT + PLAYER_STRUCT_X_OFF]
	add a, $10
	ld [hli], a
	ld a, $4
	ld [hli], a
	xor a
	ld [hl], a
	ret

; Read input and execute the actions associated.
; Params:
;    None
; Return:
;    None
; Registers:
;    af -> Not preserved
;    bc -> Preserved
;    de -> Preserved
;    hl -> Not preserved
executePlayerActions::
	call getKeys
	ld b, a
	bit 0, b
	call z, .right
	bit 1, b
	call z, .left
	bit 2, b
	call z, .up
	bit 3, b
	call z, .down
	bit 4, b
	call z, .shoot
	bit 5, b
	call z, .shoot
	ret

.shoot::
	xor a
	ld hl, SHOOT_COOLDOWN
	or [hl]
	ret nz
	ld [hl], BASE_SHOOT_COOLDOWN
	ld hl, laser
	call playChannel1Sound
	call shoot
	ret

.right::
	ld a, $8E
	ld hl, PLAYER1_STRUCT + PLAYER_STRUCT_X_OFF
	cp [hl]
	jr z, .end
	inc [hl]
	inc [hl]
	ret

.left::
	ld a, $2
	ld hl, PLAYER1_STRUCT + PLAYER_STRUCT_X_OFF
	cp [hl]
	jr z, .end
	dec [hl]
	dec [hl]
	ret

.up::
	ld a, $2
	ld hl, PLAYER1_STRUCT + PLAYER_STRUCT_Y_OFF
	cp [hl]
	jr z, .end
	dec [hl]
	dec [hl]
	ret

.down::
	ld a, $7E
	ld hl, PLAYER1_STRUCT + PLAYER_STRUCT_Y_OFF
	cp [hl]
	jr c, .end
	inc [hl]
	inc [hl]
.end:
	ret
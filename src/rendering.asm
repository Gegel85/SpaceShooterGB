; Draw the background
; Params:
;    None
; Return:
;    None
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
drawBackground::
	ld hl, VRAM_BG_START
.loop:
	call random
	and $F

	jr z, .skip
	ld a, 1
.skip:
	ld [hli], a
	bit 5, h
	jr z, .loop
	ret

; Load all sprites and put thems inside the VRam
; Params:
;    None
; Return:
;    None
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
loadSprites::
	; Load font into VRAM
	ld a, 1
	ld hl, textAssets + 32 * 8
	ld bc, textAssetsEnd - (textAssets + 32 * 8)
	ld de, VRAM_START + 32 * 16
	call uncompress

	; Load background into VRAM
	xor a
	ld hl, background
	ld bc, backgroundEnd - background
	ld de, VRAM_START
	call uncompress

	; Load space ship into VRAM
	xor a
	ld hl, spaceship
	ld bc, spaceshipEnd - spaceship
	call copyMemory

	; Load laser into VRAM
	xor a
	ld hl, laserSprite
	ld bc, laserSpriteEnd - laserSprite
	call uncompress

	; Load asteroids into VRAM
	ld hl, asteroids
	ld bc, asteroidsEnd - asteroids
	call copyMemory

	ld bc, $20
	xor a
	call fillMemory

	; Load boss into VRAM
	ld hl, boss
	ld bc, bossEnd - boss
	call copyMemory

	xor a
	ld de, $8800
	ld hl, EpitechLogo
	ld bc, EpitechLogoEnd - EpitechLogo
	call uncompress

	; Load JAM letters into VRAM
	xor a
	ld hl, JAMLetters
	ld bc, JAMLettersEnd - JAMLetters
	call uncompress


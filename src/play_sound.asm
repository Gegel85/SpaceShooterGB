;laser sound sfx
laser::
    db $1F, $CF, $85, $D0, $87

destruction::
    db $00, $D5, $70, $80

playChannel1Sound::
    ld de, CHANNEL1_SWEEP
    ld c, 5
.loop:
    ld a, [hli]
    ld [de], a
    inc de
    dec c
    jr nz, .loop
    ret

playChannel2Sound::
    ld de, CHANNEL2_LENGTH
    ld c, 4
.loop:
    ld a, [hli]
    ld [de], a
    inc de
    dec c
    jr nz, .loop
    ret

playChannelWave::
    ld de, CHANNEL3_ON_OFF
    ld c, 5
.loop:
    ld a, [hli]
    ld [de], a
    inc de
    dec c
    jr nz, .loop
    ret

playNoiseSound::
    ld de, CHANNEL4_LENGTH
    ld c, 4
.loop:
    ld a, [hli]
    ld [de], a
    inc de
    dec c
    jr nz, .loop
    ret



gameMelody::
;patt1
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $0C, $86, $14 ;DO 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $0C, $86, $28 ;DO 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $73, $86, $14 ;MI 1
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $04, $F7, $86, $28 ; NO SOUND
;patt1
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $0C, $86, $14 ;DO 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $0C, $86, $28 ;DO 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $73, $86, $14 ;MI 1
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $04, $F7, $86, $28 ; NO SOUND
;patt2
    db $80, $84, $B2, $86, $28 ;SOL 1
    db $80, $84, $8A, $86, $14 ;FA 1
    db $80, $84, $0C, $86, $14 ;DO 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $0C, $86, $28 ;DO 1
    db $80, $84, $EF, $85, $28 ;SI 0
    db $80, $84, $63, $85, $14 ;SOL 0
    db $80, $84, $17, $84, $14 ;DO 0
    db $80, $84, $13, $85, $28 ;FA 0
    db $80, $04, $F7, $86, $28 ; NO SOUND
;patt2
    db $80, $84, $B2, $86, $28 ;SOL 1
    db $80, $84, $8A, $86, $14 ;FA 1
    db $80, $84, $0C, $86, $14 ;DO 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $0C, $86, $28 ;DO 1
    db $80, $84, $EF, $85, $28 ;SI 0
    db $80, $84, $63, $85, $14 ;SOL 0
    db $80, $84, $17, $84, $14 ;DO 0
    db $80, $84, $13, $85, $28 ;FA 0
    db $80, $04, $F7, $86, $28 ; NO SOUND
;patt1
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $0C, $86, $14 ;DO 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $0C, $86, $28 ;DO 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $73, $86, $14 ;MI 1
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $04, $F7, $86, $28 ; NO SOUND
;patt1
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $0C, $86, $14 ;DO 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $0C, $86, $28 ;DO 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $73, $86, $14 ;MI 1
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $04, $F7, $86, $28 ; NO SOUND
;patt4
    db $80, $84, $05, $87, $28 ;DO 2
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $F7, $86, $14 ;SI 1
    db $80, $84, $B2, $86, $28 ;SOL 1
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $84, $B2, $86, $28 ;SOL 1
    db $80, $84, $F7, $86, $14 ;SI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $05, $87, $28 ;DO 2
    db $80, $04, $F7, $86, $28 ; NO SOUND
;patt3
    db $80, $84, $63, $85, $28 ;SOL 0
    db $80, $84, $0C, $86, $28 ;DO 1
    db $80, $84, $EF, $85, $28 ;SI 0
    db $80, $84, $8A, $86, $28 ;FA 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $84, $05, $87, $28 ;DO 2
    db $80, $04, $F7, $86, $28 ; NO SOUND
;patt1
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $0C, $86, $14 ;DO 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $0C, $86, $28 ;DO 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $73, $86, $14 ;MI 1
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $04, $F7, $86, $28 ; NO SOUND
;patt1
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $0C, $86, $14 ;DO 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $0C, $86, $28 ;DO 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $73, $86, $14 ;MI 1
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $04, $F7, $86, $28 ; NO SOUND
;patt2
    db $80, $84, $B2, $86, $28 ;SOL 1
    db $80, $84, $8A, $86, $14 ;FA 1
    db $80, $84, $0C, $86, $14 ;DO 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $0C, $86, $28 ;DO 1
    db $80, $84, $EF, $85, $28 ;SI 0
    db $80, $84, $63, $85, $14 ;SOL 0
    db $80, $84, $17, $84, $14 ;DO 0
    db $80, $84, $13, $85, $28 ;FA 0
    db $80, $04, $F7, $86, $28 ; NO SOUND
;patt2
    db $80, $84, $B2, $86, $28 ;SOL 1
    db $80, $84, $8A, $86, $14 ;FA 1
    db $80, $84, $0C, $86, $14 ;DO 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $0C, $86, $28 ;DO 1
    db $80, $84, $EF, $85, $28 ;SI 0
    db $80, $84, $63, $85, $14 ;SOL 0
    db $80, $84, $17, $84, $14 ;DO 0
    db $80, $84, $13, $85, $28 ;FA 0
    db $80, $04, $F7, $86, $28 ; NO SOUND
;patt5
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $0C, $86, $14 ;DO 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $0C, $86, $28 ;DO 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $73, $86, $14 ;MI 1
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $04, $F7, $86, $28 ; NO SOUND
;patt5
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $0C, $86, $14 ;DO 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $0C, $86, $14 ;DO 1
    db $80, $84, $63, $85, $14 ;SOL 0
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $73, $86, $14 ;MI 1
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $04, $F7, $86, $28 ; NO SOUND
;patt6
    db $80, $84, $05, $87, $28 ;DO 2
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $F7, $86, $14 ;SI 1
    db $80, $84, $B2, $86, $28 ;SOL 1
    db $80, $84, $05, $87, $14 ;DO 2
    db $80, $84, $F7, $86, $14 ;SI 1
    db $80, $84, $B2, $86, $28 ;SOL 1
    db $80, $84, $F7, $86, $14 ;SI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $05, $87, $28 ;DO 2
    db $80, $04, $F7, $86, $28 ; NO SOUND
;patt7
    db $80, $84, $63, $85, $14 ;SOL 0
    db $80, $84, $13, $85, $14 ;FA 0
    db $80, $84, $E6, $84, $14 ;MI 0
    db $80, $84, $13, $85, $14 ;FA 0
    db $80, $84, $63, $85, $14 ;SOL 0
    db $80, $84, $EF, $85, $14 ;SI 0
    db $80, $84, $0C, $86, $14 ;DO 1
    db $80, $84, $73, $86, $14 ;MI 1
    db $80, $84, $B2, $86, $28 ;SOL 1
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $84, $05, $87, $28 ;DO 2
    db $80, $04, $F7, $86, $28 ; NO SOUND
;patt8
    db $80, $84, $F7, $86, $14 ;SI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $8A, $86, $14 ;FA 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $8A, $86, $28 ;FA 1
    db $80, $84, $F7, $86, $14 ;SI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $8A, $86, $14 ;FA 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $8A, $86, $28 ;FA 1
    db $80, $04, $F7, $86, $50 ; NO SOUND
;patt8
    db $80, $84, $F7, $86, $14 ;SI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $8A, $86, $14 ;FA 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $8A, $86, $28 ;FA 1
    db $80, $84, $F7, $86, $14 ;SI 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $8A, $86, $14 ;FA 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $8A, $86, $28 ;FA 1
    db $80, $04, $F7, $86, $50 ; NO SOUND
;patt9
    db $80, $84, $0C, $86, $14 ;DO 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $8A, $86, $14 ;FA 1
    db $80, $84, $0C, $86, $14 ;DO 1
    db $80, $84, $8A, $86, $28 ;FA 1
    db $80, $84, $0C, $86, $14 ;DO 1
    db $80, $84, $B2, $86, $14 ;SOL 1
    db $80, $84, $8A, $86, $14 ;FA 1
    db $80, $84, $0C, $86, $14 ;D0 1
    db $80, $84, $63, $85, $28 ;SOL 0
    db $80, $04, $F7, $86, $50 ; NO SOUND
;patt10
    db $80, $84, $39, $87, $28 ;MI 2
    db $80, $84, $05, $87, $28 ;DO 2
    db $80, $84, $F7, $86, $28 ;SI 1
    db $80, $84, $B2, $86, $28 ;SOL 1
    db $80, $84, $8A, $86, $28 ;FA 1
    db $80, $84, $73, $86, $28 ;MI 1
    db $80, $84, $0C, $86, $28 ;DO 1
    db $80, $84, $EF, $85, $28 ;SI 0
    db $80, $04, $F7, $86, $FF ;Loop
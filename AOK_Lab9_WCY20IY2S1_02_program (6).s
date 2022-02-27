.data

skladnik: 	.double 1220
ulamek:		.double 0.25
rozmiar:	.double 102
T:		.space 1040
TB:		.space 816
rozmiar_T:	.double 130
rozmiar_TB:	.double 102
Suma:		.double 0
zmienna_1:	.double 1
nr: 		.double 2
l_pocz:		.double 0
mnoznik:	.double 2.2

.text

ld f0, l_pocz
ld f2, nr
ld f4, skladnik
ld f6, ulamek
addd f0, f2, f4
addd f0, f0, f6
ld f2, 0
ld f4, 0
ld f6, 0
ld f4, mnoznik
ld f8, zmienna_1
addi r10, r0, T
addi r15, r0, #130
addi r20, r0, TB
addi r25, r0, #102

Tab_T:

sd 0(r10), f0
addi r10, r10, #8
subi r15, r15, #1
addd f0, f0, f8
bnez r15, Tab_T

addi r26, r0, T
addi r27, r0, T+8
addi r28, r0, T+16
addi r29, r0, T+24
addi r30, r0, T+32
addi r21, r0, T+40
addi r22, r0, T+48
addi r23, r0, T+56
addi r24, r0, T+64
ld f8, 0

Tab_TB:

ld f6, 0(r26)
ld f8, 0(r27)
ld f12, 0(r28)
ld f14, 0(r29)
ld f16, 0(r30)
ld f18, 0(r21)
ld f20, 0(r22)
ld f22, 0(r23)
ld f24, 0(r24)
multd f26, f4,f6
multd f26, f26, f8
multd f28, f12, f14
multd f28, f28, f16
addd f2, f26, f28
ld f26, 0
ld f28, 0
ld f30, ulamek
multd f26, f30, f18
multd f26, f26, f20
multd f28, f22, f24
ld f30, 0
addd f30, f26, f28
ld f26, 0
divd f26, f2, f30
sd 0(r20), f26
addd f10, f10, f26
addi r26, r26, #8
addi r27, r27, #8
addi r28, r28, #8
addi r29, r29, #8
addi r30, r30, #8
addi r21, r21, #8
addi r22, r22, #8
addi r23, r23, #8
addi r24, r24, #8
addi r20, r20, #8
subi r25, r25, #1
bnez r25, Tab_TB
sd Suma, f10

trap 0
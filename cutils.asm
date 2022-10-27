; Disassembly of file: bin/cutils
; Mon Oct 24 20:50:11 2022
; Type: ELF64
; Syntax: NASM
; Instruction set: SSE2, x64

default rel

global _end
global _init: function
global main: function
global _start: function
global create: function
global append: function
global length: function
global alloced: function
global show: function
global freea: function
global _fini: function
global _IO_stdin_used
global __data_start
global data_start                                       ; Note: Weak.
global __dso_handle
global __TMC_END__
global __bss_start
global _edata

extern __cxa_finalize@GLIBC_2.2.5                       ; near
extern _ITM_registerTMCloneTable                        ; byte
extern exit@GLIBC_2.2.5                                 ; near
extern realloc@GLIBC_2.2.5                              ; near
extern memcpy@GLIBC_2.14                                ; near
extern __gmon_start__                                   ; byte
extern calloc@GLIBC_2.2.5                               ; near
extern printf@GLIBC_2.2.5                               ; near
extern __stack_chk_fail@GLIBC_2.4                       ; near
extern puts@GLIBC_2.2.5                                 ; near
extern _ITM_deregisterTMCloneTable                      ; byte
extern __libc_start_main@GLIBC_2.34                     ; near
extern free@GLIBC_2.2.5                                 ; near
extern __cxa_finalize                                   ; near
extern _ITM_registerTMCloneTable                        ; byte
extern exit                                             ; near
extern realloc                                          ; near
extern memcpy                                           ; near
extern __gmon_start__                                   ; byte
extern calloc                                           ; near
extern printf                                           ; near
extern __stack_chk_fail                                 ; near
extern puts                                             ; near
extern _ITM_deregisterTMCloneTable                      ; byte
extern __libc_start_main                                ; near
extern free                                             ; near


SECTION .interp align=1 noexecute                       ; section number 1, const

        db 2FH, 6CH, 69H, 62H, 36H, 34H, 2FH, 6CH       ; 0318 _ /lib64/l
        db 64H, 2DH, 6CH, 69H, 6EH, 75H, 78H, 2DH       ; 0320 _ d-linux-
        db 78H, 38H, 36H, 2DH, 36H, 34H, 2EH, 73H       ; 0328 _ x86-64.s
        db 6FH, 2EH, 32H, 00H                           ; 0330 _ o.2.


SECTION .note.gnu.property align=8 noexecute            ; section number 2, const

        db 04H, 00H, 00H, 00H, 30H, 00H, 00H, 00H       ; 0338 _ ....0...
        db 05H, 00H, 00H, 00H, 47H, 4EH, 55H, 00H       ; 0340 _ ....GNU.
        db 02H, 80H, 00H, 0C0H, 04H, 00H, 00H, 00H      ; 0348 _ ........
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0350 _ ........
        db 01H, 00H, 01H, 0C0H, 04H, 00H, 00H, 00H      ; 0358 _ ........
        db 09H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0360 _ ........
        db 02H, 00H, 01H, 0C0H, 04H, 00H, 00H, 00H      ; 0368 _ ........
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0370 _ ........


SECTION .note.gnu.build-id align=4 noexecute            ; section number 3, const

        db 04H, 00H, 00H, 00H, 14H, 00H, 00H, 00H       ; 0378 _ ........
        db 03H, 00H, 00H, 00H, 47H, 4EH, 55H, 00H       ; 0380 _ ....GNU.
        db 0ACH, 5EH, 41H, 21H, 21H, 92H, 0BH, 0DCH     ; 0388 _ .^A!!...
        db 07H, 83H, 87H, 0B8H, 2DH, 0B1H, 0AH, 19H     ; 0390 _ ....-...
        db 0F1H, 20H, 0A9H, 93H                         ; 0398 _ . ..


SECTION .note.ABI-tag align=4 noexecute                 ; section number 4, const

__abi_tag:                                              ; yword
        db 04H, 00H, 00H, 00H, 10H, 00H, 00H, 00H       ; 039C _ ........
        db 01H, 00H, 00H, 00H, 47H, 4EH, 55H, 00H       ; 03A4 _ ....GNU.
        db 00H, 00H, 00H, 00H, 04H, 00H, 00H, 00H       ; 03AC _ ........
        db 04H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 03B4 _ ........


SECTION .gnu.hash align=8 noexecute                     ; section number 5, const

        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 03C0 _ ........
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 03C8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 03D0 _ ........
        db 00H, 00H, 00H, 00H                           ; 03D8 _ ....


SECTION .dynsym align=8 noexecute                       ; section number 6, const

        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 03E0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 03E8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 03F0 _ ........
        db 17H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 03F8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0400 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0408 _ ........
        db 29H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 0410 _ ).......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0418 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0420 _ ........
        db 95H, 00H, 00H, 00H, 20H, 00H, 00H, 00H       ; 0428 _ .... ...
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0430 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0438 _ ........
        db 01H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 0440 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0448 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0450 _ ........
        db 06H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 0458 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0460 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0468 _ ........
        db 51H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 0470 _ Q.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0478 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0480 _ ........
        db 4AH, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 0488 _ J.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0490 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0498 _ ........
        db 0B1H, 00H, 00H, 00H, 20H, 00H, 00H, 00H      ; 04A0 _ .... ...
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 04A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 04B0 _ ........
        db 58H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 04B8 _ X.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 04C0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 04C8 _ ........
        db 21H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 04D0 _ !.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 04D8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 04E0 _ ........
        db 1CH, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 04E8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 04F0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 04F8 _ ........
        db 0C0H, 00H, 00H, 00H, 20H, 00H, 00H, 00H      ; 0500 _ .... ...
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0508 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0510 _ ........
        db 3BH, 00H, 00H, 00H, 22H, 00H, 00H, 00H       ; 0518 _ ;..."...
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0520 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0528 _ ........


SECTION .dynstr align=1 noexecute                       ; section number 7, const

        db 00H, 70H, 75H, 74H, 73H, 00H, 5FH, 5FH       ; 0530 _ .puts.__
        db 73H, 74H, 61H, 63H, 6BH, 5FH, 63H, 68H       ; 0538 _ stack_ch
        db 6BH, 5FH, 66H, 61H, 69H, 6CH, 00H, 66H       ; 0540 _ k_fail.f
        db 72H, 65H, 65H, 00H, 65H, 78H, 69H, 74H       ; 0548 _ ree.exit
        db 00H, 72H, 65H, 61H, 6CH, 6CH, 6FH, 63H       ; 0550 _ .realloc
        db 00H, 5FH, 5FH, 6CH, 69H, 62H, 63H, 5FH       ; 0558 _ .__libc_
        db 73H, 74H, 61H, 72H, 74H, 5FH, 6DH, 61H       ; 0560 _ start_ma
        db 69H, 6EH, 00H, 5FH, 5FH, 63H, 78H, 61H       ; 0568 _ in.__cxa
        db 5FH, 66H, 69H, 6EH, 61H, 6CH, 69H, 7AH       ; 0570 _ _finaliz
        db 65H, 00H, 63H, 61H, 6CH, 6CH, 6FH, 63H       ; 0578 _ e.calloc
        db 00H, 70H, 72H, 69H, 6EH, 74H, 66H, 00H       ; 0580 _ .printf.
        db 6DH, 65H, 6DH, 63H, 70H, 79H, 00H, 6CH       ; 0588 _ memcpy.l
        db 69H, 62H, 63H, 2EH, 73H, 6FH, 2EH, 36H       ; 0590 _ ibc.so.6
        db 00H, 47H, 4CH, 49H, 42H, 43H, 5FH, 32H       ; 0598 _ .GLIBC_2
        db 2EH, 31H, 34H, 00H, 47H, 4CH, 49H, 42H       ; 05A0 _ .14.GLIB
        db 43H, 5FH, 32H, 2EH, 34H, 00H, 47H, 4CH       ; 05A8 _ C_2.4.GL
        db 49H, 42H, 43H, 5FH, 32H, 2EH, 33H, 34H       ; 05B0 _ IBC_2.34
        db 00H, 47H, 4CH, 49H, 42H, 43H, 5FH, 32H       ; 05B8 _ .GLIBC_2
        db 2EH, 32H, 2EH, 35H, 00H, 5FH, 49H, 54H       ; 05C0 _ .2.5._IT
        db 4DH, 5FH, 64H, 65H, 72H, 65H, 67H, 69H       ; 05C8 _ M_deregi
        db 73H, 74H, 65H, 72H, 54H, 4DH, 43H, 6CH       ; 05D0 _ sterTMCl
        db 6FH, 6EH, 65H, 54H, 61H, 62H, 6CH, 65H       ; 05D8 _ oneTable
        db 00H, 5FH, 5FH, 67H, 6DH, 6FH, 6EH, 5FH       ; 05E0 _ .__gmon_
        db 73H, 74H, 61H, 72H, 74H, 5FH, 5FH, 00H       ; 05E8 _ start__.
        db 5FH, 49H, 54H, 4DH, 5FH, 72H, 65H, 67H       ; 05F0 _ _ITM_reg
        db 69H, 73H, 74H, 65H, 72H, 54H, 4DH, 43H       ; 05F8 _ isterTMC
        db 6CH, 6FH, 6EH, 65H, 54H, 61H, 62H, 6CH       ; 0600 _ loneTabl
        db 65H, 00H                                     ; 0608 _ e.


SECTION .gnu.version align=2 noexecute                  ; section number 8, const

        db 00H, 00H, 02H, 00H, 03H, 00H, 01H, 00H       ; 060A _ ........
        db 02H, 00H, 04H, 00H, 02H, 00H, 02H, 00H       ; 0612 _ ........
        db 01H, 00H, 05H, 00H, 02H, 00H, 02H, 00H       ; 061A _ ........
        db 01H, 00H, 02H, 00H                           ; 0622 _ ....


SECTION .gnu.version_r align=8 noexecute                ; section number 9, const

        db 01H, 00H, 04H, 00H, 5FH, 00H, 00H, 00H       ; 0628 _ ...._...
        db 10H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0630 _ ........
        db 94H, 91H, 96H, 06H, 00H, 00H, 05H, 00H       ; 0638 _ ........
        db 69H, 00H, 00H, 00H, 10H, 00H, 00H, 00H       ; 0640 _ i.......
        db 14H, 69H, 69H, 0DH, 00H, 00H, 04H, 00H       ; 0648 _ .ii.....
        db 74H, 00H, 00H, 00H, 10H, 00H, 00H, 00H       ; 0650 _ t.......
        db 0B4H, 91H, 96H, 06H, 00H, 00H, 03H, 00H      ; 0658 _ ........
        db 7EH, 00H, 00H, 00H, 10H, 00H, 00H, 00H       ; 0660 _ ~.......
        db 75H, 1AH, 69H, 09H, 00H, 00H, 02H, 00H       ; 0668 _ u.i.....
        db 89H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0670 _ ........


SECTION .rela.dyn align=8 noexecute                     ; section number 10, const

        db 0D0H, 3DH, 00H, 00H, 00H, 00H, 00H, 00H      ; 0678 _ .=......
        db 08H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0680 _ ........
        db 30H, 12H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0688 _ 0.......
        db 0D8H, 3DH, 00H, 00H, 00H, 00H, 00H, 00H      ; 0690 _ .=......
        db 08H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0698 _ ........
        db 0E0H, 11H, 00H, 00H, 00H, 00H, 00H, 00H      ; 06A0 _ ........
        db 48H, 40H, 00H, 00H, 00H, 00H, 00H, 00H       ; 06A8 _ H@......
        db 08H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 06B0 _ ........
        db 48H, 40H, 00H, 00H, 00H, 00H, 00H, 00H       ; 06B8 _ H@......
        db 0C0H, 3FH, 00H, 00H, 00H, 00H, 00H, 00H      ; 06C0 _ .?......
        db 06H, 00H, 00H, 00H, 02H, 00H, 00H, 00H       ; 06C8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 06D0 _ ........
        db 0C8H, 3FH, 00H, 00H, 00H, 00H, 00H, 00H      ; 06D8 _ .?......
        db 06H, 00H, 00H, 00H, 03H, 00H, 00H, 00H       ; 06E0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 06E8 _ ........
        db 0D0H, 3FH, 00H, 00H, 00H, 00H, 00H, 00H      ; 06F0 _ .?......
        db 06H, 00H, 00H, 00H, 08H, 00H, 00H, 00H       ; 06F8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0700 _ ........
        db 0D8H, 3FH, 00H, 00H, 00H, 00H, 00H, 00H      ; 0708 _ .?......
        db 06H, 00H, 00H, 00H, 0CH, 00H, 00H, 00H       ; 0710 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0718 _ ........
        db 0E0H, 3FH, 00H, 00H, 00H, 00H, 00H, 00H      ; 0720 _ .?......
        db 06H, 00H, 00H, 00H, 0DH, 00H, 00H, 00H       ; 0728 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0730 _ ........


SECTION .rela.plt align=8 noexecute                     ; section number 11, const

        db 00H, 40H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0738 _ .@......
        db 07H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0740 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0748 _ ........
        db 08H, 40H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0750 _ .@......
        db 07H, 00H, 00H, 00H, 04H, 00H, 00H, 00H       ; 0758 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0760 _ ........
        db 10H, 40H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0768 _ .@......
        db 07H, 00H, 00H, 00H, 05H, 00H, 00H, 00H       ; 0770 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0778 _ ........
        db 18H, 40H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0780 _ .@......
        db 07H, 00H, 00H, 00H, 06H, 00H, 00H, 00H       ; 0788 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0790 _ ........
        db 20H, 40H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0798 _  @......
        db 07H, 00H, 00H, 00H, 07H, 00H, 00H, 00H       ; 07A0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 07A8 _ ........
        db 28H, 40H, 00H, 00H, 00H, 00H, 00H, 00H       ; 07B0 _ (@......
        db 07H, 00H, 00H, 00H, 09H, 00H, 00H, 00H       ; 07B8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 07C0 _ ........
        db 30H, 40H, 00H, 00H, 00H, 00H, 00H, 00H       ; 07C8 _ 0@......
        db 07H, 00H, 00H, 00H, 0AH, 00H, 00H, 00H       ; 07D0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 07D8 _ ........
        db 38H, 40H, 00H, 00H, 00H, 00H, 00H, 00H       ; 07E0 _ 8@......
        db 07H, 00H, 00H, 00H, 0BH, 00H, 00H, 00H       ; 07E8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 07F0 _ ........


SECTION .init   align=4 execute                         ; section number 12, code

_init:  ; Function begin
        endbr64                                         ; 1000 _ F3: 0F 1E. FA
        sub     rsp, 8                                  ; 1004 _ 48: 83. EC, 08
        mov     rax, qword [rel ?_033]                  ; 1008 _ 48: 8B. 05, 00002FC1(rel)
        test    rax, rax                                ; 100F _ 48: 85. C0
        jz      ?_001                                   ; 1012 _ 74, 02
        call    rax                                     ; 1014 _ FF. D0
?_001:  add     rsp, 8                                  ; 1016 _ 48: 83. C4, 08
        ret                                             ; 101A _ C3
; _init End of function


SECTION .plt    align=16 execute                        ; section number 13, code

?_002:  ; Local function
        push    qword [rel ?_036]                       ; 1020 _ FF. 35, 00002FCA(rel)
        jmp     near [rel ?_037]                        ; 1026 _ FF. 25, 00002FCC(rel)

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_003:  jmp     near [rel ?_038]                        ; 1030 _ FF. 25, 00002FCA(rel)

; Note: Immediate operand could be made smaller by sign extension
        push    0                                       ; 1036 _ 68, 00000000
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_002                                   ; 103B _ E9, FFFFFFE0

?_004:  ; Local function
        jmp     near [rel ?_039]                        ; 1040 _ FF. 25, 00002FC2(rel)

; Note: Immediate operand could be made smaller by sign extension
        push    1                                       ; 1046 _ 68, 00000001
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_002                                   ; 104B _ E9, FFFFFFD0

?_005:  ; Local function
        jmp     near [rel ?_040]                        ; 1050 _ FF. 25, 00002FBA(rel)

; Note: Immediate operand could be made smaller by sign extension
        push    2                                       ; 1056 _ 68, 00000002
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_002                                   ; 105B _ E9, FFFFFFC0

?_006:  ; Local function
        jmp     near [rel ?_041]                        ; 1060 _ FF. 25, 00002FB2(rel)

; Note: Immediate operand could be made smaller by sign extension
        push    3                                       ; 1066 _ 68, 00000003
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_002                                   ; 106B _ E9, FFFFFFB0

?_007:  ; Local function
        jmp     near [rel ?_042]                        ; 1070 _ FF. 25, 00002FAA(rel)

; Note: Immediate operand could be made smaller by sign extension
        push    4                                       ; 1076 _ 68, 00000004
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_002                                   ; 107B _ E9, FFFFFFA0

?_008:  ; Local function
        jmp     near [rel ?_043]                        ; 1080 _ FF. 25, 00002FA2(rel)

; Note: Immediate operand could be made smaller by sign extension
        push    5                                       ; 1086 _ 68, 00000005
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_002                                   ; 108B _ E9, FFFFFF90

?_009:  ; Local function
        jmp     near [rel ?_044]                        ; 1090 _ FF. 25, 00002F9A(rel)

; Note: Immediate operand could be made smaller by sign extension
        push    6                                       ; 1096 _ 68, 00000006
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_002                                   ; 109B _ E9, FFFFFF80

?_010:  ; Local function
        jmp     near [rel ?_045]                        ; 10A0 _ FF. 25, 00002F92(rel)

; Note: Immediate operand could be made smaller by sign extension
        push    7                                       ; 10A6 _ 68, 00000007
        jmp     ?_002                                   ; 10AB _ E9, FFFFFF70


SECTION .text   align=16 execute                        ; section number 14, code

main:   ; Function begin
        push    rbx                                     ; 10B0 _ 53
        sub     rsp, 32                                 ; 10B1 _ 48: 83. EC, 20
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        mov     rax, qword [fs:abs 28H]                 ; 10B5 _ 64 48: 8B. 04 25, 00000028
        mov     qword [rsp+18H], rax                    ; 10BE _ 48: 89. 44 24, 18
        xor     eax, eax                                ; 10C3 _ 31. C0
        lea     rbx, [rsp+8H]                           ; 10C5 _ 48: 8D. 5C 24, 08
        mov     qword [rsp+8H], 0                       ; 10CA _ 48: C7. 44 24, 08, 00000000
        mov     rdi, rbx                                ; 10D3 _ 48: 89. DF
        call    create                                  ; 10D6 _ E8, 00000165
        mov     eax, 25185                              ; 10DB _ B8, 00006261
        lea     rsi, [rsp+15H]                          ; 10E0 _ 48: 8D. 74 24, 15
        mov     rdi, rbx                                ; 10E5 _ 48: 89. DF
        mov     edx, 3                                  ; 10E8 _ BA, 00000003
        mov     word [rsp+15H], ax                      ; 10ED _ 66: 89. 44 24, 15
        mov     byte [rsp+17H], 99                      ; 10F2 _ C6. 44 24, 17, 63
        call    append                                  ; 10F7 _ E8, 00000194
        mov     rdi, qword [rsp+8H]                     ; 10FC _ 48: 8B. 7C 24, 08
        mov     esi, 1                                  ; 1101 _ BE, 00000001
        call    show                                    ; 1106 _ E8, 000002D5
        mov     rdi, qword [rsp+8H]                     ; 110B _ 48: 8B. 7C 24, 08
        call    freea                                   ; 1110 _ E8, 0000036B
        mov     rax, qword [rsp+18H]                    ; 1115 _ 48: 8B. 44 24, 18
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        sub     rax, qword [fs:abs 28H]                 ; 111A _ 64 48: 2B. 04 25, 00000028
        jnz     ?_011                                   ; 1123 _ 75, 08
        add     rsp, 32                                 ; 1125 _ 48: 83. C4, 20
        xor     eax, eax                                ; 1129 _ 31. C0
        pop     rbx                                     ; 112B _ 5B
        ret                                             ; 112C _ C3
; main End of function

?_011:  ; Local function
        call    ?_005                                   ; 112D _ E8, FFFFFF1E(rel)
; Filling space: 0EH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 0FH, 1FH, 40H, 00H

ALIGN   16

_start:
        endbr64                                         ; 1140 _ F3: 0F 1E. FA
        xor     ebp, ebp                                ; 1144 _ 31. ED
        mov     r9, rdx                                 ; 1146 _ 49: 89. D1
        pop     rsi                                     ; 1149 _ 5E
        mov     rdx, rsp                                ; 114A _ 48: 89. E2
        and     rsp, 0FFFFFFFFFFFFFFF0H                 ; 114D _ 48: 83. E4, F0
        push    rax                                     ; 1151 _ 50
        push    rsp                                     ; 1152 _ 54
        xor     r8d, r8d                                ; 1153 _ 45: 31. C0
        xor     ecx, ecx                                ; 1156 _ 31. C9
        lea     rdi, [rel main]                         ; 1158 _ 48: 8D. 3D, FFFFFF51(rel)
        call    near [rel ?_031]                        ; 115F _ FF. 15, 00002E5B(rel)
        hlt                                             ; 1165 _ F4
; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
deregister_tm_clones:
        lea     rdi, [rel _edata]                       ; 1170 _ 48: 8D. 3D, 00002ED9(rel)
        lea     rax, [rel _edata]                       ; 1177 _ 48: 8D. 05, 00002ED2(rel)
        cmp     rax, rdi                                ; 117E _ 48: 39. F8
        jz      ?_012                                   ; 1181 _ 74, 15
        mov     rax, qword [rel ?_032]                  ; 1183 _ 48: 8B. 05, 00002E3E(rel)
        test    rax, rax                                ; 118A _ 48: 85. C0
        jz      ?_012                                   ; 118D _ 74, 09
        jmp     rax                                     ; 118F _ FF. E0

; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8
?_012:  ret                                             ; 1198 _ C3

; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8

register_tm_clones:; Local function
        lea     rdi, [rel _edata]                       ; 11A0 _ 48: 8D. 3D, 00002EA9(rel)
        lea     rsi, [rel _edata]                       ; 11A7 _ 48: 8D. 35, 00002EA2(rel)
        sub     rsi, rdi                                ; 11AE _ 48: 29. FE
        mov     rax, rsi                                ; 11B1 _ 48: 89. F0
        shr     rsi, 63                                 ; 11B4 _ 48: C1. EE, 3F
        sar     rax, 3                                  ; 11B8 _ 48: C1. F8, 03
        add     rsi, rax                                ; 11BC _ 48: 01. C6
        sar     rsi, 1                                  ; 11BF _ 48: D1. FE
        jz      ?_013                                   ; 11C2 _ 74, 14
        mov     rax, qword [rel ?_034]                  ; 11C4 _ 48: 8B. 05, 00002E0D(rel)
        test    rax, rax                                ; 11CB _ 48: 85. C0
        jz      ?_013                                   ; 11CE _ 74, 08
        jmp     rax                                     ; 11D0 _ FF. E0

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_013:  ret                                             ; 11D8 _ C3

; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8

__do_global_dtors_aux:; Local function
        endbr64                                         ; 11E0 _ F3: 0F 1E. FA
        cmp     byte [rel _edata], 0                    ; 11E4 _ 80. 3D, 00002E65(rel), 00
        jnz     ?_015                                   ; 11EB _ 75, 33
        push    rbp                                     ; 11ED _ 55
        cmp     qword [rel ?_035], 0                    ; 11EE _ 48: 83. 3D, 00002DEA(rel), 00
        mov     rbp, rsp                                ; 11F6 _ 48: 89. E5
        jz      ?_014                                   ; 11F9 _ 74, 0D
        mov     rdi, qword [rel __dso_handle]           ; 11FB _ 48: 8B. 3D, 00002E46(rel)
        call    near [rel ?_035]                        ; 1202 _ FF. 15, 00002DD8(rel)
?_014:  call    deregister_tm_clones                    ; 1208 _ E8, FFFFFF63
        mov     byte [rel _edata], 1                    ; 120D _ C6. 05, 00002E3C(rel), 01
        pop     rbp                                     ; 1214 _ 5D
        ret                                             ; 1215 _ C3

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_015:  ret                                             ; 1220 _ C3

; Filling space: 0FH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H
;       db 00H, 00H, 00H, 0FH, 1FH, 40H, 00H

ALIGN   16

frame_dummy:; Local function
        endbr64                                         ; 1230 _ F3: 0F 1E. FA
        jmp     register_tm_clones                      ; 1234 _ E9, FFFFFF67

; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8

create: ; Function begin
        push    rbx                                     ; 1240 _ 53
        mov     esi, 1                                  ; 1241 _ BE, 00000001
        mov     rbx, rdi                                ; 1246 _ 48: 89. FB
        mov     edi, 72                                 ; 1249 _ BF, 00000048
        call    ?_007                                   ; 124E _ E8, FFFFFE1D(rel)
        mov     qword [rbx], rax                        ; 1253 _ 48: 89. 03
        test    rax, rax                                ; 1256 _ 48: 85. C0
        jz      ?_016                                   ; 1259 _ 74, 22
        lea     rsi, [rax+8H]                           ; 125B _ 48: 8D. 70, 08
        mov     dword [rax], 64                         ; 125F _ C7. 00, 00000040
        mov     rdx, rax                                ; 1265 _ 48: 89. C2
        xor     eax, eax                                ; 1268 _ 31. C0
        mov     qword [rbx], rsi                        ; 126A _ 48: 89. 33
        lea     rdi, [rel ?_022]                        ; 126D _ 48: 8D. 3D, 00000D90(rel)
        call    ?_006                                   ; 1274 _ E8, FFFFFDE7(rel)
        xor     eax, eax                                ; 1279 _ 31. C0
        pop     rbx                                     ; 127B _ 5B
        ret                                             ; 127C _ C3
; create End of function

?_016:  ; Local function
        or      eax, 0FFFFFFFFH                         ; 127D _ 83. C8, FF
        pop     rbx                                     ; 1280 _ 5B
        ret                                             ; 1281 _ C3

; Filling space: 0EH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H
;       db 00H, 00H, 00H, 0FH, 1FH, 00H

ALIGN   16

append: ; Function begin
        push    r15                                     ; 1290 _ 41: 57
        xor     eax, eax                                ; 1292 _ 31. C0
        push    r14                                     ; 1294 _ 41: 56
        mov     r14, rsi                                ; 1296 _ 49: 89. F6
        push    r13                                     ; 1299 _ 41: 55
        push    r12                                     ; 129B _ 41: 54
        mov     r12d, edx                               ; 129D _ 41: 89. D4
        push    rbp                                     ; 12A0 _ 55
        mov     ecx, r12d                               ; 12A1 _ 44: 89. E1
        push    rbx                                     ; 12A4 _ 53
        mov     rbx, rdi                                ; 12A5 _ 48: 89. FB
        sub     rsp, 24                                 ; 12A8 _ 48: 83. EC, 18
        mov     rbp, qword [rdi]                        ; 12AC _ 48: 8B. 2F
        lea     rdi, [rel ?_027]                        ; 12AF _ 48: 8D. 3D, 00000DBA(rel)
        mov     esi, dword [rbp-4H]                     ; 12B6 _ 8B. 75, FC
        mov     edx, dword [rbp-8H]                     ; 12B9 _ 8B. 55, F8
        sub     rbp, 4                                  ; 12BC _ 48: 83. ED, 04
        lea     r8d, [rsi+r12]                          ; 12C0 _ 46: 8D. 04 26
        call    ?_006                                   ; 12C4 _ E8, FFFFFD97(rel)
        mov     r15d, dword [rbp]                       ; 12C9 _ 44: 8B. 7D, 00
        mov     edx, dword [rbp-4H]                     ; 12CD _ 8B. 55, FC
        lea     r13d, [r15+r12]                         ; 12D0 _ 47: 8D. 2C 27
        cmp     r13d, edx                               ; 12D4 _ 41: 39. D5
        jl      ?_017                                   ; 12D7 _ 0F 8C, 0000008A
        lea     ebp, [r13+48H]                          ; 12DD _ 41: 8D. 6D, 48
        mov     rsi, qword [rbx]                        ; 12E1 _ 48: 8B. 33
        lea     rdi, [rel ?_028]                        ; 12E4 _ 48: 8D. 3D, 00000DB5(rel)
        xor     eax, eax                                ; 12EB _ 31. C0
        mov     ecx, ebp                                ; 12ED _ 89. E9
        mov     dword [rsp+0CH], ebp                    ; 12EF _ 89. 6C 24, 0C
        call    ?_006                                   ; 12F3 _ E8, FFFFFD68(rel)
        mov     rax, qword [rbx]                        ; 12F8 _ 48: 8B. 03
        movsxd  rsi, ebp                                ; 12FB _ 48: 63. F5
        lea     rdi, [rax-8H]                           ; 12FE _ 48: 8D. 78, F8
        mov     qword [rbx], rdi                        ; 1302 _ 48: 89. 3B
        call    ?_009                                   ; 1305 _ E8, FFFFFD86(rel)
        mov     qword [rbx], rax                        ; 130A _ 48: 89. 03
        test    rax, rax                                ; 130D _ 48: 85. C0
        je      ?_018                                   ; 1310 _ 0F 84, 00000090
        mov     qword [rax], 0                          ; 1316 _ 48: C7. 00, 00000000
        mov     rsi, qword [rbx]                        ; 131D _ 48: 8B. 33
        lea     rdi, [rel ?_023]                        ; 1320 _ 48: 8D. 3D, 00000CF7(rel)
        xor     eax, eax                                ; 1327 _ 31. C0
        call    ?_006                                   ; 1329 _ E8, FFFFFD32(rel)
        lea     edx, [r13+40H]                          ; 132E _ 41: 8D. 55, 40
        mov     rax, qword [rbx]                        ; 1332 _ 48: 8B. 03
        mov     ecx, dword [rsp+0CH]                    ; 1335 _ 8B. 4C 24, 0C
        movd    xmm0, edx                               ; 1339 _ 66: 0F 6E. C2
        movd    xmm1, r15d                              ; 133D _ 66 41: 0F 6E. CF
        mov     esi, r15d                               ; 1342 _ 44: 89. FE
        punpckldq xmm0, xmm1                            ; 1345 _ 66: 0F 62. C1
        lea     rbp, [rax+4H]                           ; 1349 _ 48: 8D. 68, 04
        add     rax, 8                                  ; 134D _ 48: 83. C0, 08
        movq    qword [rax-8H], xmm0                    ; 1351 _ 66: 0F D6. 40, F8
        lea     rdi, [rel ?_024]                        ; 1356 _ 48: 8D. 3D, 00000CDA(rel)
        mov     qword [rbx], rax                        ; 135D _ 48: 89. 03
        xor     eax, eax                                ; 1360 _ 31. C0
        call    ?_006                                   ; 1362 _ E8, FFFFFCF9(rel)
?_017:  movsxd  rdx, dword [rbp]                        ; 1367 _ 48: 63. 55, 00
        mov     esi, r12d                               ; 136B _ 44: 89. E6
        add     rdx, qword [rbx]                        ; 136E _ 48: 03. 13
        xor     eax, eax                                ; 1371 _ 31. C0
        lea     rdi, [rel ?_030]                        ; 1373 _ 48: 8D. 3D, 00000D7E(rel)
        call    ?_006                                   ; 137A _ E8, FFFFFCE1(rel)
        movsxd  rdi, dword [rbp]                        ; 137F _ 48: 63. 7D, 00
        movsxd  rdx, r12d                               ; 1383 _ 49: 63. D4
        add     rdi, qword [rbx]                        ; 1386 _ 48: 03. 3B
        mov     rsi, r14                                ; 1389 _ 4C: 89. F6
        call    ?_008                                   ; 138C _ E8, FFFFFCEF(rel)
        add     dword [rbp], r12d                       ; 1391 _ 44: 01. 65, 00
        add     rsp, 24                                 ; 1395 _ 48: 83. C4, 18
        xor     eax, eax                                ; 1399 _ 31. C0
        pop     rbx                                     ; 139B _ 5B
        pop     rbp                                     ; 139C _ 5D
        pop     r12                                     ; 139D _ 41: 5C
        pop     r13                                     ; 139F _ 41: 5D
        pop     r14                                     ; 13A1 _ 41: 5E
        pop     r15                                     ; 13A3 _ 41: 5F
        ret                                             ; 13A5 _ C3
; append End of function

?_018:  ; Local function
        lea     rdi, [rel ?_029]                        ; 13A6 _ 48: 8D. 3D, 00000D23(rel)
        call    ?_004                                   ; 13AD _ E8, FFFFFC8E(rel)
        or      edi, 0FFFFFFFFH                         ; 13B2 _ 83. CF, FF
        call    ?_010                                   ; 13B5 _ E8, FFFFFCE6(rel)
; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

length:
        mov     eax, dword [rdi-4H]                     ; 13C0 _ 8B. 47, FC
        ret                                             ; 13C3 _ C3

; Filling space: 0CH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H
;       db 00H, 00H, 00H, 90H

ALIGN   16

alloced:; Function begin
        mov     eax, dword [rdi-8H]                     ; 13D0 _ 8B. 47, F8
        ret                                             ; 13D3 _ C3
; alloced End of function

; Filling space: 0CH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H
;       db 00H, 00H, 00H, 90H

ALIGN   16

show:   ; Function begin
        push    r15                                     ; 13E0 _ 41: 57
        xor     eax, eax                                ; 13E2 _ 31. C0
        lea     r15, [rel ?_026]                        ; 13E4 _ 4C: 8D. 3D, 00000C7C(rel)
        push    r14                                     ; 13EB _ 41: 56
        mov     r14d, esi                               ; 13ED _ 41: 89. F6
        mov     rsi, rdi                                ; 13F0 _ 48: 89. FE
        push    r13                                     ; 13F3 _ 41: 55
        push    r12                                     ; 13F5 _ 41: 54
        mov     r12, rdi                                ; 13F7 _ 49: 89. FC
        lea     rdi, [rel ?_025]                        ; 13FA _ 48: 8D. 3D, 00000C51(rel)
        push    rbp                                     ; 1401 _ 55
        xor     ebp, ebp                                ; 1402 _ 31. ED
        push    rbx                                     ; 1404 _ 53
        xor     ebx, ebx                                ; 1405 _ 31. DB
        sub     rsp, 8                                  ; 1407 _ 48: 83. EC, 08
        call    ?_006                                   ; 140B _ E8, FFFFFC50(rel)
        movsxd  rsi, r14d                               ; 1410 _ 49: 63. F6
        mov     edi, 1                                  ; 1413 _ BF, 00000001
        call    ?_007                                   ; 1418 _ E8, FFFFFC53(rel)
        mov     r13, rax                                ; 141D _ 49: 89. C5
        jmp     ?_020                                   ; 1420 _ EB, 0A

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_019:  add     rbp, 1                                  ; 1428 _ 48: 83. C5, 01
?_020:  mov     rdi, r12                                ; 142C _ 4C: 89. E7
        call    length                                  ; 142F _ E8, FFFFFF8C
        cmp     eax, ebp                                ; 1434 _ 39. E8
        jle     ?_021                                   ; 1436 _ 7E, 28
        movzx   edx, byte [r12+rbp]                     ; 1438 _ 41: 0F B6. 14 2C
        movsxd  rax, ebx                                ; 143D _ 48: 63. C3
        add     ebx, 1                                  ; 1440 _ 83. C3, 01
        mov     byte [r13+rax], dl                      ; 1443 _ 41: 88. 54 05, 00
        cmp     r14d, ebx                               ; 1448 _ 41: 39. DE
        jnz     ?_019                                   ; 144B _ 75, DB
        mov     esi, dword [r13]                        ; 144D _ 41: 8B. 75, 00
        mov     rdi, r15                                ; 1451 _ 4C: 89. FF
        xor     eax, eax                                ; 1454 _ 31. C0
        xor     ebx, ebx                                ; 1456 _ 31. DB
        call    ?_006                                   ; 1458 _ E8, FFFFFC03(rel)
        jmp     ?_019                                   ; 145D _ EB, C9

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   8
?_021:  add     rsp, 8                                  ; 1460 _ 48: 83. C4, 08
        xor     eax, eax                                ; 1464 _ 31. C0
        pop     rbx                                     ; 1466 _ 5B
        pop     rbp                                     ; 1467 _ 5D
        pop     r12                                     ; 1468 _ 41: 5C
        pop     r13                                     ; 146A _ 41: 5D
        pop     r14                                     ; 146C _ 41: 5E
        pop     r15                                     ; 146E _ 41: 5F
        ret                                             ; 1470 _ C3
; show End of function

; Filling space: 0FH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H
;       db 00H, 00H, 00H, 0FH, 1FH, 40H, 00H

ALIGN   16

freea:  ; Function begin
        sub     rsp, 8                                  ; 1480 _ 48: 83. EC, 08
        sub     rdi, 8                                  ; 1484 _ 48: 83. EF, 08
        call    ?_003                                   ; 1488 _ E8, FFFFFBA3(rel)
        xor     eax, eax                                ; 148D _ 31. C0
        add     rsp, 8                                  ; 148F _ 48: 83. C4, 08
        ret                                             ; 1493 _ C3
; freea End of function


SECTION .fini   align=4 execute                         ; section number 15, code

_fini:  ; Function begin
        endbr64                                         ; 1494 _ F3: 0F 1E. FA
        sub     rsp, 8                                  ; 1498 _ 48: 83. EC, 08
        add     rsp, 8                                  ; 149C _ 48: 83. C4, 08
        ret                                             ; 14A0 _ C3
; _fini End of function


SECTION .rodata align=8 noexecute                       ; section number 16, const

_IO_stdin_used:                                         ; dword
        dd 00020001H                                    ; 2000 _ 131073 

?_022:                                                  ; byte
        db 41H, 72H, 72H, 61H, 79H, 20H, 63H, 72H       ; 2004 _ Array cr
        db 65H, 61H, 74H, 65H, 64H, 20H, 3AH, 20H       ; 200C _ eated : 
        db 76H, 25H, 70H, 20H, 2DH, 20H, 72H, 25H       ; 2014 _ v%p - r%
        db 70H, 00H                                     ; 201C _ p.

?_023:                                                  ; byte
        db 41H, 72H, 72H, 61H, 79H, 20H, 72H, 65H       ; 201E _ Array re
        db 61H, 6CH, 6CH, 6FH, 63H, 61H, 74H, 65H       ; 2026 _ allocate
        db 64H, 20H, 61H, 74H, 20H, 25H, 70H, 0AH       ; 202E _ d at %p.
        db 00H                                          ; 2036 _ .

?_024:                                                  ; byte
        db 73H, 69H, 7AH, 65H, 3AH, 20H, 25H, 64H       ; 2037 _ size: %d
        db 2CH, 20H, 61H, 6CH, 6CH, 6FH, 63H, 3AH       ; 203F _ , alloc:
        db 20H, 76H, 25H, 64H, 2FH, 72H, 25H, 64H       ; 2047 _  v%d/r%d
        db 0AH, 20H, 00H                                ; 204F _ . .

?_025:                                                  ; byte
        db 53H, 68H, 6FH, 77H, 69H, 6EH, 67H, 20H       ; 2052 _ Showing 
        db 61H, 72H, 72H, 61H, 79H, 20H, 61H, 74H       ; 205A _ array at
        db 20H, 25H, 70H, 0AH, 00H                      ; 2062 _  %p..

?_026:                                                  ; byte
        db 25H, 63H, 0AH, 00H, 00H, 00H, 00H, 00H       ; 2067 _ %c......
        db 00H                                          ; 206F _ .

?_027:                                                  ; byte
        db 53H, 69H, 7AH, 65H, 3AH, 20H, 25H, 64H       ; 2070 _ Size: %d
        db 20H, 2CH, 20H, 41H, 6CH, 6CH, 6FH, 63H       ; 2078 _  , Alloc
        db 3AH, 20H, 25H, 64H, 20H, 2CH, 20H, 41H       ; 2080 _ : %d , A
        db 53H, 69H, 7AH, 65H, 3AH, 20H, 25H, 64H       ; 2088 _ Size: %d
        db 20H, 2CH, 20H, 54H, 6FH, 74H, 53H, 69H       ; 2090 _  , TotSi
        db 7AH, 65H, 3AH, 20H, 25H, 64H, 0AH, 00H       ; 2098 _ ze: %d..

?_028:                                                  ; byte
        db 52H, 65H, 61H, 6CH, 6CH, 6FH, 63H, 61H       ; 20A0 _ Realloca
        db 74H, 69H, 6EH, 67H, 20H, 61H, 72H, 72H       ; 20A8 _ ting arr
        db 61H, 79H, 20H, 61H, 74H, 20H, 25H, 70H       ; 20B0 _ ay at %p
        db 20H, 66H, 72H, 6FH, 6DH, 20H, 25H, 64H       ; 20B8 _  from %d
        db 20H, 74H, 6FH, 20H, 25H, 64H, 20H, 0AH       ; 20C0 _  to %d .
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 20C8 _ ........

?_029:                                                  ; byte
        db 45H, 72H, 72H, 6FH, 72H, 20H, 72H, 65H       ; 20D0 _ Error re
        db 61H, 6CH, 6CH, 6FH, 63H, 61H, 74H, 69H       ; 20D8 _ allocati
        db 6EH, 67H, 20H, 61H, 72H, 72H, 61H, 79H       ; 20E0 _ ng array
        db 20H, 28H, 79H, 61H, 79H, 79H, 79H, 29H       ; 20E8 _  (yayyy)
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 20F0 _ ........

?_030:                                                  ; byte
        db 43H, 6FH, 70H, 79H, 69H, 6EH, 67H, 20H       ; 20F8 _ Copying 
        db 25H, 64H, 20H, 62H, 79H, 74H, 65H, 73H       ; 2100 _ %d bytes
        db 20H, 74H, 6FH, 20H, 61H, 72H, 72H, 61H       ; 2108 _  to arra
        db 79H, 20H, 61H, 74H, 20H, 25H, 70H, 0AH       ; 2110 _ y at %p.
        db 00H                                          ; 2118 _ .


SECTION .eh_frame_hdr align=4 noexecute                 ; section number 17, const

__GNU_EH_FRAME_HDR:                                     ; byte
        db 01H, 1BH, 03H, 3BH, 50H, 00H, 00H, 00H       ; 211C _ ...;P...
        db 09H, 00H, 00H, 00H, 04H, 0EFH, 0FFH, 0FFH    ; 2124 _ ........
        db 84H, 00H, 00H, 00H, 94H, 0EFH, 0FFH, 0FFH    ; 212C _ ........
        db 0ACH, 00H, 00H, 00H, 24H, 0F0H, 0FFH, 0FFH   ; 2134 _ ....$...
        db 6CH, 00H, 00H, 00H, 24H, 0F1H, 0FFH, 0FFH    ; 213C _ l...$...
        db 0D4H, 00H, 00H, 00H, 74H, 0F1H, 0FFH, 0FFH   ; 2144 _ ....t...
        db 0F4H, 00H, 00H, 00H, 0A4H, 0F2H, 0FFH, 0FFH  ; 214C _ ........
        db 40H, 01H, 00H, 00H, 0B4H, 0F2H, 0FFH, 0FFH   ; 2154 _ @.......
        db 54H, 01H, 00H, 00H, 0C4H, 0F2H, 0FFH, 0FFH   ; 215C _ T.......
        db 68H, 01H, 00H, 00H, 64H, 0F3H, 0FFH, 0FFH    ; 2164 _ h...d...
        db 0B0H, 01H, 00H, 00H                          ; 216C _ ....


SECTION .eh_frame align=8 noexecute                     ; section number 18, const

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 2170 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 2178 _ .zR..x..
        db 1BH, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 2180 _ ........
        db 14H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 2188 _ ........
        db 0B0H, 0EFH, 0FFH, 0FFH, 26H, 00H, 00H, 00H   ; 2190 _ ....&...
        db 00H, 44H, 07H, 10H, 00H, 00H, 00H, 00H       ; 2198 _ .D......
        db 24H, 00H, 00H, 00H, 34H, 00H, 00H, 00H       ; 21A0 _ $...4...
        db 78H, 0EEH, 0FFH, 0FFH, 90H, 00H, 00H, 00H    ; 21A8 _ x.......
        db 00H, 0EH, 10H, 46H, 0EH, 18H, 4AH, 0FH       ; 21B0 _ ...F..J.
        db 0BH, 77H, 08H, 80H, 00H, 3FH, 1AH, 3BH       ; 21B8 _ .w...?.;
        db 2AH, 33H, 24H, 22H, 00H, 00H, 00H, 00H       ; 21C0 _ *3$"....
        db 24H, 00H, 00H, 00H, 5CH, 00H, 00H, 00H       ; 21C8 _ $...\...
        db 0E0H, 0EEH, 0FFH, 0FFH, 82H, 00H, 00H, 00H   ; 21D0 _ ........
        db 00H, 41H, 0EH, 10H, 83H, 02H, 44H, 0EH       ; 21D8 _ .A....D.
        db 30H, 02H, 74H, 0AH, 0EH, 10H, 43H, 0EH       ; 21E0 _ 0.t...C.
        db 08H, 41H, 0BH, 00H, 00H, 00H, 00H, 00H       ; 21E8 _ .A......
        db 1CH, 00H, 00H, 00H, 84H, 00H, 00H, 00H       ; 21F0 _ ........
        db 48H, 0F0H, 0FFH, 0FFH, 42H, 00H, 00H, 00H    ; 21F8 _ H...B...
        db 00H, 41H, 0EH, 10H, 83H, 02H, 7BH, 0AH       ; 2200 _ .A....{.
        db 0EH, 08H, 41H, 0BH, 44H, 0EH, 08H, 00H       ; 2208 _ ..A.D...
        db 48H, 00H, 00H, 00H, 0A4H, 00H, 00H, 00H      ; 2210 _ H.......
        db 78H, 0F0H, 0FFH, 0FFH, 2AH, 01H, 00H, 00H    ; 2218 _ x...*...
        db 00H, 42H, 0EH, 10H, 8FH, 02H, 44H, 0EH       ; 2220 _ .B....D.
        db 18H, 8EH, 03H, 45H, 0EH, 20H, 8DH, 04H       ; 2228 _ ...E. ..
        db 42H, 0EH, 28H, 8CH, 05H, 44H, 0EH, 30H       ; 2230 _ B.(..D.0
        db 86H, 06H, 44H, 0EH, 38H, 83H, 07H, 47H       ; 2238 _ ..D.8..G
        db 0EH, 50H, 02H, 0EDH, 0AH, 0EH, 38H, 43H      ; 2240 _ .P....8C
        db 0EH, 30H, 41H, 0EH, 28H, 42H, 0EH, 20H       ; 2248 _ .0A.(B. 
        db 42H, 0EH, 18H, 42H, 0EH, 10H, 42H, 0EH       ; 2250 _ B..B..B.
        db 08H, 41H, 0BH, 00H, 10H, 00H, 00H, 00H       ; 2258 _ .A......
        db 0F0H, 00H, 00H, 00H, 5CH, 0F1H, 0FFH, 0FFH   ; 2260 _ ....\...
        db 04H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 2268 _ ........
        db 10H, 00H, 00H, 00H, 04H, 01H, 00H, 00H       ; 2270 _ ........
        db 58H, 0F1H, 0FFH, 0FFH, 04H, 00H, 00H, 00H    ; 2278 _ X.......
        db 00H, 00H, 00H, 00H, 44H, 00H, 00H, 00H       ; 2280 _ ....D...
        db 18H, 01H, 00H, 00H, 54H, 0F1H, 0FFH, 0FFH    ; 2288 _ ....T...
        db 91H, 00H, 00H, 00H, 00H, 42H, 0EH, 10H       ; 2290 _ .....B..
        db 8FH, 02H, 4BH, 0EH, 18H, 8EH, 03H, 48H       ; 2298 _ ..K....H
        db 0EH, 20H, 8DH, 04H, 42H, 0EH, 28H, 8CH       ; 22A0 _ . ..B.(.
        db 05H, 4BH, 0EH, 30H, 86H, 06H, 43H, 0EH       ; 22A8 _ .K.0..C.
        db 38H, 83H, 07H, 46H, 0EH, 40H, 02H, 59H       ; 22B0 _ 8..F.@.Y
        db 0EH, 38H, 43H, 0EH, 30H, 41H, 0EH, 28H       ; 22B8 _ .8C.0A.(
        db 42H, 0EH, 20H, 42H, 0EH, 18H, 42H, 0EH       ; 22C0 _ B. B..B.
        db 10H, 42H, 0EH, 08H, 14H, 00H, 00H, 00H       ; 22C8 _ .B......
        db 60H, 01H, 00H, 00H, 0ACH, 0F1H, 0FFH, 0FFH   ; 22D0 _ `.......
        db 14H, 00H, 00H, 00H, 00H, 44H, 0EH, 10H       ; 22D8 _ .....D..
        db 4FH, 0EH, 08H, 00H                           ; 22E0 _ O...

__FRAME_END__:                                          ; byte
        db 00H, 00H, 00H, 00H                           ; 22E4 _ ....


SECTION .init_array align=8 noexecute                   ; section number 19, data

__frame_dummy_init_array_entry:                         ; byte
        db 30H, 12H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3DD0 _ 0.......


SECTION .fini_array align=8 noexecute                   ; section number 20, data

__do_global_dtors_aux_fini_array_entry:                 ; byte
        db 0E0H, 11H, 00H, 00H, 00H, 00H, 00H, 00H      ; 3DD8 _ ........


SECTION .dynamic align=8 noexecute                      ; section number 21, data

_DYNAMIC:                                               ; byte
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3DE0 _ ........
        db 5FH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3DE8 _ _.......
        db 0CH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3DF0 _ ........
        db 00H, 10H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3DF8 _ ........
        db 0DH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3E00 _ ........
        db 94H, 14H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3E08 _ ........
        db 19H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3E10 _ ........
        db 0D0H, 3DH, 00H, 00H, 00H, 00H, 00H, 00H      ; 3E18 _ .=......
        db 1BH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3E20 _ ........
        db 08H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3E28 _ ........
        db 1AH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3E30 _ ........
        db 0D8H, 3DH, 00H, 00H, 00H, 00H, 00H, 00H      ; 3E38 _ .=......
        db 1CH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3E40 _ ........
        db 08H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3E48 _ ........
        db 0F5H, 0FEH, 0FFH, 6FH, 00H, 00H, 00H, 00H    ; 3E50 _ ...o....
        db 0C0H, 03H, 00H, 00H, 00H, 00H, 00H, 00H      ; 3E58 _ ........
        db 05H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3E60 _ ........
        db 30H, 05H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3E68 _ 0.......
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3E70 _ ........
        db 0E0H, 03H, 00H, 00H, 00H, 00H, 00H, 00H      ; 3E78 _ ........
        db 0AH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3E80 _ ........
        db 0DAH, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 3E88 _ ........
        db 0BH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3E90 _ ........
        db 18H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3E98 _ ........
        db 15H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3EA0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3EA8 _ ........
        db 03H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3EB0 _ ........
        db 0E8H, 3FH, 00H, 00H, 00H, 00H, 00H, 00H      ; 3EB8 _ .?......
        db 02H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3EC0 _ ........
        db 0C0H, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 3EC8 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3ED0 _ ........
        db 07H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3ED8 _ ........
        db 17H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3EE0 _ ........
        db 38H, 07H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3EE8 _ 8.......
        db 07H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3EF0 _ ........
        db 78H, 06H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3EF8 _ x.......
        db 08H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3F00 _ ........
        db 0C0H, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 3F08 _ ........
        db 09H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3F10 _ ........
        db 18H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3F18 _ ........
        db 0FBH, 0FFH, 0FFH, 6FH, 00H, 00H, 00H, 00H    ; 3F20 _ ...o....
        db 00H, 00H, 00H, 08H, 00H, 00H, 00H, 00H       ; 3F28 _ ........
        db 0FEH, 0FFH, 0FFH, 6FH, 00H, 00H, 00H, 00H    ; 3F30 _ ...o....
        db 28H, 06H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3F38 _ (.......
        db 0FFH, 0FFH, 0FFH, 6FH, 00H, 00H, 00H, 00H    ; 3F40 _ ...o....
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3F48 _ ........
        db 0F0H, 0FFH, 0FFH, 6FH, 00H, 00H, 00H, 00H    ; 3F50 _ ...o....
        db 0AH, 06H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3F58 _ ........
        db 0F9H, 0FFH, 0FFH, 6FH, 00H, 00H, 00H, 00H    ; 3F60 _ ...o....
        db 03H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3F68 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3F70 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3F78 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3F80 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3F88 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3F90 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3F98 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3FA0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3FA8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3FB0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 3FB8 _ ........


SECTION .got    align=8 noexecute                       ; section number 22, data

?_031:                                                  ; virtual table or function pointer
        dq 0000000000000000H                            ; 3FC0 _ 0000000000000000 

?_032:                                                  ; switch/case jump table
        dq 0000000000000000H                            ; 3FC8 _ 0000000000000000 

?_033:                                                  ; virtual table or function pointer
        dq 0000000000000000H                            ; 3FD0 _ 0000000000000000 

?_034:                                                  ; switch/case jump table
        dq 0000000000000000H                            ; 3FD8 _ 0000000000000000 

?_035:                                                  ; virtual table or function pointer
        dq 0000000000000000H                            ; 3FE0 _ 0000000000000000 


SECTION .got.plt align=8 noexecute                      ; section number 23, data

_GLOBAL_OFFSET_TABLE_:                                  ; byte
        db 0E0H, 3DH, 00H, 00H, 00H, 00H, 00H, 00H      ; 3FE8 _ .=......

?_036:                                                  ; qword
        dq 0000000000000000H                            ; 3FF0 _ 0000000000000000 

?_037:                                                  ; switch/case jump table
        dq 0000000000000000H                            ; 3FF8 _ 0000000000000000 

?_038:                                                  ; switch/case jump table
        dq 0000000000001036H                            ; 4000 _ 0000000000001036 

?_039:                                                  ; switch/case jump table
        dq 0000000000001046H                            ; 4008 _ 0000000000001046 

?_040:                                                  ; switch/case jump table
        dq 0000000000001056H                            ; 4010 _ 0000000000001056 

?_041:                                                  ; switch/case jump table
        dq 0000000000001066H                            ; 4018 _ 0000000000001066 

?_042:                                                  ; switch/case jump table
        dq 0000000000001076H                            ; 4020 _ 0000000000001076 

?_043:                                                  ; switch/case jump table
        dq 0000000000001086H                            ; 4028 _ 0000000000001086 

?_044:                                                  ; switch/case jump table
        dq 0000000000001096H                            ; 4030 _ 0000000000001096 

?_045:                                                  ; switch/case jump table
        dq 00000000000010A6H                            ; 4038 _ 00000000000010A6 


SECTION .data   align=8 noexecute                       ; section number 24, data

__data_start:                                           ; byte
data_start:                                             ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4040 _ ........

__dso_handle:                                           ; qword
        dq 0000000000004048H                            ; 4048 _ 0000000000004048 


SECTION .bss    align=1 noexecute                       ; section number 25, bss

__TMC_END__:                                            ; byte
__bss_start:                                            ; byte
_edata:                                                 ; byte
completed.0:                                            ; byte
        resb    8                                       ; 4050


; Error: Relocation number 1 has a non-existing source address. Section: 0 Offset: 00003DD0H
; Error: Relocation number 1 at section 0 offset 00003DD0 has a non-existing target index. Target: 0
; Error: Relocation number 2 has a non-existing source address. Section: 0 Offset: 00003DD8H
; Error: Relocation number 2 at section 0 offset 00003DD8 has a non-existing target index. Target: 0
; Error: Relocation number 3 has a non-existing source address. Section: 0 Offset: 00003FC0H
; Error: Relocation number 4 has a non-existing source address. Section: 0 Offset: 00003FC8H
; Error: Relocation number 5 has a non-existing source address. Section: 0 Offset: 00003FD0H
; Error: Relocation number 6 has a non-existing source address. Section: 0 Offset: 00003FD8H
; Error: Relocation number 7 has a non-existing source address. Section: 0 Offset: 00003FE0H
; Error: Relocation number 8 has a non-existing source address. Section: 0 Offset: 00004048H
; Error: Relocation number 8 at section 0 offset 00004048 has a non-existing target index. Target: 0


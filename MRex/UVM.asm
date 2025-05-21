
./Object/UVM:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <_UVM_Entry>:
              space very well.
Input       : None.
Output      : None.
*****************************************************************************/
_UVM_Entry:
    JMP                 main
       0:	e9 50 03 00 00       	jmp    355 <main>

0000000000000005 <__UVM_X64_In>:
Output         : None.
Return         : ptr_t - The data received from that port.
Register Usage : None.
*****************************************************************************/
__UVM_X64_In:
    PUSHQ               %RDX
       5:	52                   	push   %rdx
    MOVQ                %RDI,%RDX
       6:	48 89 fa             	mov    %rdi,%rdx
    MOVQ                %RAX,%RAX
       9:	48 89 c0             	mov    %rax,%rax
    INB                 (%DX),%AL
       c:	ec                   	in     (%dx),%al
    POPQ                %RDX
       d:	5a                   	pop    %rdx
    RETQ
       e:	c3                   	ret    

000000000000000f <__UVM_X64_Out>:
Output         : None.
Return         : None.
Register Usage : None.
*****************************************************************************/
__UVM_X64_Out:
    PUSHQ               %RDX
       f:	52                   	push   %rdx
    PUSHQ               %RAX
      10:	50                   	push   %rax
    MOVQ                %RDI,%RDX
      11:	48 89 fa             	mov    %rdi,%rdx
    MOVQ                %RSI,%RAX
      14:	48 89 f0             	mov    %rsi,%rax
    OUTB                %AL,(%DX)
      17:	ee                   	out    %al,(%dx)
    POPQ                %RAX
      18:	58                   	pop    %rax
    POPQ                %RDX
      19:	5a                   	pop    %rdx
    RETQ
      1a:	c3                   	ret    

000000000000001b <__UVM_X64_Read_TSC>:
Output         : None.
Return         : ptr_t - The timestamp value returned.
Register Usage : None.
******************************************************************************/
__UVM_X64_Read_TSC:
    PUSHQ               %RDX
      1b:	52                   	push   %rdx
    RDTSC
      1c:	0f 31                	rdtsc  
    SHL                 $32,%RDX
      1e:	48 c1 e2 20          	shl    $0x20,%rdx
    ORQ                 %RDX,%RAX
      22:	48 09 d0             	or     %rdx,%rax
    POPQ                %RDX
      25:	5a                   	pop    %rdx
    RETQ
      26:	c3                   	ret    

0000000000000027 <_UVM_Set_TLS_Pos>:
Output      : None.
Return      : None.
*****************************************************************************/
_UVM_Set_TLS_Pos:
    /* The alignment mask is not used in x86-64 */
    WRFSBASE            %RSI
      27:	f3 48 0f ae d6       	wrfsbase %rsi
    RETQ
      2c:	c3                   	ret    

000000000000002d <_UVM_Get_TLS_Pos>:
Output      : None.
Return      : ptr_t* - The thread local storage position.
*****************************************************************************/
_UVM_Get_TLS_Pos:
    /* The alignment mask is not used in x86-64 */
    RDFSBASE            %RAX
      2d:	f3 48 0f ae c0       	rdfsbase %rax
    RETQ
      32:	c3                   	ret    

0000000000000033 <_UVM_Thd_Stub>:
Input       : RDI - The entry address.
              RSI - The stack address that we are using now.
Output      : None.
*****************************************************************************/
_UVM_Thd_Stub:
    MOVQ                (%RSP),%RDI
      33:	48 8b 3c 24          	mov    (%rsp),%rdi
    MOVQ                8(%RSP),%RSI
      37:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    MOVQ                16(%RSP),%RDX
      3c:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    MOVQ                24(%RSP),%RCX
      41:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    JMP                 *32(%RSP)           /* Jump to the actual entry address */
      46:	ff 64 24 20          	jmp    *0x20(%rsp)

000000000000004a <_UVM_Inv_Stub>:
Input       : R4 - The entry address.
              R5 - The stack address that we are using now.
Output      : None.
*****************************************************************************/
_UVM_Inv_Stub:
    MOVQ                %RSI,%RDI           /* Pass the parameter */
      4a:	48 89 f7             	mov    %rsi,%rdi
    CALLQ               *32(%RSP)           /* Branch to the actual entry address */
      4d:	ff 54 24 20          	call   *0x20(%rsp)

    XORQ                %RDI,%RDI           /* UVM_SVC_INV_RET */
      51:	48 31 ff             	xor    %rdi,%rdi
    MOVQ                %RAX,%RSI           /* return value in RSI */
      54:	48 89 c6             	mov    %rax,%rsi
    SYSCALL                                 /* System call */
      57:	0f 05                	syscall 

0000000000000059 <UVM_Inv_Act>:
              RSI - ptr_t Param - The parameter for the call.
Output      : RDX - ptr_t* Retval - The return value from the call.
Return      : RAX - ptr_t - The return value of the system call itself.
*****************************************************************************/
UVM_Inv_Act:
    PUSHQ               %RBX                /* The user-level should push all context */
      59:	53                   	push   %rbx
    PUSHQ               %RCX
      5a:	51                   	push   %rcx
    PUSHQ               %RDX
      5b:	52                   	push   %rdx
    PUSHQ               %RBP
      5c:	55                   	push   %rbp
    PUSHQ               %R8
      5d:	41 50                	push   %r8
    PUSHQ               %R9
      5f:	41 51                	push   %r9
    PUSHQ               %R10
      61:	41 52                	push   %r10
    PUSHQ               %R11
      63:	41 53                	push   %r11
    PUSHQ               %R12
      65:	41 54                	push   %r12
    PUSHQ               %R13
      67:	41 55                	push   %r13
    PUSHQ               %R14
      69:	41 56                	push   %r14
    PUSHQ               %R15
      6b:	41 57                	push   %r15
    PUSHFQ
      6d:	9c                   	pushf  

    MOVQ                %RSI,%RDX           /* Param */
      6e:	48 89 f2             	mov    %rsi,%rdx
    MOVQ                %RDI,%RSI           /* Cap_Inv */
      71:	48 89 fe             	mov    %rdi,%rsi
    MOVQ                $0x100000000,%RDI   /* UVM_SVC_INV_ACT */
      74:	48 bf 00 00 00 00 01 	movabs $0x100000000,%rdi
      7b:	00 00 00 
    SYSCALL
      7e:	0f 05                	syscall 

    POPFQ
      80:	9d                   	popf   
    POPQ                %R15
      81:	41 5f                	pop    %r15
    POPQ                %R14
      83:	41 5e                	pop    %r14
    POPQ                %R13
      85:	41 5d                	pop    %r13
    POPQ                %R12
      87:	41 5c                	pop    %r12
    POPQ                %R11
      89:	41 5b                	pop    %r11
    POPQ                %R10
      8b:	41 5a                	pop    %r10
    POPQ                %R9
      8d:	41 59                	pop    %r9
    POPQ                %R8
      8f:	41 58                	pop    %r8
    POPQ                %RBP
      91:	5d                   	pop    %rbp
    POPQ                %RDX
      92:	5a                   	pop    %rdx
    POPQ                %RCX
      93:	59                   	pop    %rcx
    POPQ                %RBX                /* POP all saved registers now */
      94:	5b                   	pop    %rbx

    CMPQ                $0,%RDX             /* See if this return value is desired */
      95:	48 83 fa 00          	cmp    $0x0,%rdx
    JZ                  No_Retval
      99:	74 03                	je     9e <No_Retval>
    MOVQ                %RSI,(%RDX)
      9b:	48 89 32             	mov    %rsi,(%rdx)

000000000000009e <No_Retval>:
No_Retval:
    RETQ
      9e:	c3                   	ret    

000000000000009f <UVM_Inv_Act_Dummy>:

UVM_Inv_Act_Dummy:
    .global UVM_Inv_Act_Dummy
    PUSHQ               %RBX                /* The user-level should push all context */
      9f:	53                   	push   %rbx
    PUSHQ               %RCX
      a0:	51                   	push   %rcx
    PUSHQ               %RDX
      a1:	52                   	push   %rdx
    PUSHQ               %RBP
      a2:	55                   	push   %rbp
    PUSHQ               %R8
      a3:	41 50                	push   %r8
    PUSHQ               %R9
      a5:	41 51                	push   %r9
    PUSHQ               %R10
      a7:	41 52                	push   %r10
    PUSHQ               %R11
      a9:	41 53                	push   %r11
    PUSHQ               %R12
      ab:	41 54                	push   %r12
    PUSHQ               %R13
      ad:	41 55                	push   %r13
    PUSHQ               %R14
      af:	41 56                	push   %r14
    PUSHQ               %R15
      b1:	41 57                	push   %r15
    PUSHFQ
      b3:	9c                   	pushf  

    MOVQ                %RSI,%RDX           /* Param */
      b4:	48 89 f2             	mov    %rsi,%rdx
    MOVQ                %RDI,%RSI           /* Cap_Inv */
      b7:	48 89 fe             	mov    %rdi,%rsi
    MOVQ                $0x100000000,%RDI   /* UVM_SVC_INV_ACT */
      ba:	48 bf 00 00 00 00 01 	movabs $0x100000000,%rdi
      c1:	00 00 00 

    POPFQ
      c4:	9d                   	popf   
    POPQ                %R15
      c5:	41 5f                	pop    %r15
    POPQ                %R14
      c7:	41 5e                	pop    %r14
    POPQ                %R13
      c9:	41 5d                	pop    %r13
    POPQ                %R12
      cb:	41 5c                	pop    %r12
    POPQ                %R11
      cd:	41 5b                	pop    %r11
    POPQ                %R10
      cf:	41 5a                	pop    %r10
    POPQ                %R9
      d1:	41 59                	pop    %r9
    POPQ                %R8
      d3:	41 58                	pop    %r8
    POPQ                %RBP
      d5:	5d                   	pop    %rbp
    POPQ                %RDX
      d6:	5a                   	pop    %rdx
    POPQ                %RCX
      d7:	59                   	pop    %rcx
    POPQ                %RBX                /* POP all saved registers now */
      d8:	5b                   	pop    %rbx

    CMPQ                $0,%RDX             /* See if this return value is desired */
      d9:	48 83 fa 00          	cmp    $0x0,%rdx
    JZ                  No_Retval_Dummy
      dd:	74 03                	je     e2 <No_Retval_Dummy>
    MOVQ                %RSI,(%RDX)
      df:	48 89 32             	mov    %rsi,(%rdx)

00000000000000e2 <No_Retval_Dummy>:
No_Retval_Dummy:
    RETQ
      e2:	c3                   	ret    

00000000000000e3 <UVM_cret>:

UVM_cret:
    .global     UVM_cret
    RETQ
      e3:	c3                   	ret    

00000000000000e4 <UVM_Inv_Ret>:
Input       : RDI - The returning result from the invocation.
Output      : None.
Return      : None.
*****************************************************************************/
UVM_Inv_Ret:
    MOVQ                %RDI,%RSI           /* Set return value to the register */
      e4:	48 89 fe             	mov    %rdi,%rsi
    XORQ                %RDI,%RDI           /* UVM_SVC_INV_RET */
      e7:	48 31 ff             	xor    %rdi,%rdi
    SYSCALL                                 /* System call */
      ea:	0f 05                	syscall 
    RETQ
      ec:	c3                   	ret    

00000000000000ed <UVM_Svc>:
              RCX - Argument 3. We need to move this to R8 because SYSCALL will use RCX.
Output      : None.
Retun       : RAX - The return value.
*****************************************************************************/
UVM_Svc:
    MOV                 %RCX,%R8
      ed:	49 89 c8             	mov    %rcx,%r8
    PUSH                %R11
      f0:	41 53                	push   %r11
    SYSCALL                                 /* Do the system call directly */
      f2:	0f 05                	syscall 
    POP                 %R11
      f4:	41 5b                	pop    %r11
    RETQ
      f6:	c3                   	ret    

00000000000000f7 <_UVM_MSB_Get>:
;Output         : None.
;Return         : ptr_t - The MSB position.   
;Register Usage : None. 
;*****************************************************************************/
_UVM_MSB_Get:
    LZCNTQ              %RDI,%RDI
      f7:	f3 48 0f bd ff       	lzcnt  %rdi,%rdi
    MOVQ                $63,%RAX
      fc:	48 c7 c0 3f 00 00 00 	mov    $0x3f,%rax
    SUBQ                %RDI,%RAX
     103:	48 29 f8             	sub    %rdi,%rax
    RETQ
     106:	c3                   	ret    

0000000000000107 <UVM_Clear>:
              ptr_t Size - The size to clear.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_Clear(void* Addr, ptr_t Size)
{
     107:	f3 0f 1e fa          	endbr64 
     10b:	55                   	push   %rbp
     10c:	48 89 e5             	mov    %rsp,%rbp
     10f:	48 83 ec 30          	sub    $0x30,%rsp
     113:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
     117:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    u8* Byte_Inc;
    ptr_t Words;
    ptr_t Bytes;
    
    /* On processors not that fast, copy by word is really important */
    Word_Inc=(ptr_t*)Addr;
     11b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     11f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
     123:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
     127:	48 c1 e8 03          	shr    $0x3,%rax
     12b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     12f:	eb 15                	jmp    146 <UVM_Clear+0x3f>
    {
        *Word_Inc=0;
     131:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     135:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
        Word_Inc++;
     13c:	48 83 45 f8 08       	addq   $0x8,-0x8(%rbp)
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
     141:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
     146:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
     14b:	75 e4                	jne    131 <UVM_Clear+0x2a>
    }
    
    /* Get the final bytes */
    Byte_Inc=(u8*)Word_Inc;
     14d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     151:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    for(Bytes=Size%sizeof(ptr_t);Bytes>0;Bytes--)
     155:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
     159:	83 e0 07             	and    $0x7,%eax
     15c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     160:	eb 11                	jmp    173 <UVM_Clear+0x6c>
    {
        *Byte_Inc=0;
     162:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     166:	c6 00 00             	movb   $0x0,(%rax)
        Byte_Inc++;
     169:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    for(Bytes=Size%sizeof(ptr_t);Bytes>0;Bytes--)
     16e:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
     173:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
     178:	75 e8                	jne    162 <UVM_Clear+0x5b>
    }
}
     17a:	90                   	nop
     17b:	90                   	nop
     17c:	c9                   	leave  
     17d:	c3                   	ret    

000000000000017e <TEST_THD1_FUNC>:
ptr_t sum;
ptr_t sumin;
ptr_t sumout;

void TEST_THD1_FUNC(void)
{
     17e:	f3 0f 1e fa          	endbr64 
     182:	55                   	push   %rbp
     183:	48 89 e5             	mov    %rsp,%rbp
     186:	48 83 ec 10          	sub    $0x10,%rsp
    cnt_t Count;
    sum=0;
     18a:	48 c7 05 8b 1e 00 00 	movq   $0x0,0x1e8b(%rip)        # 2020 <sum>
     191:	00 00 00 00 
    UVM_LOG_S("\r\nenter thread 1");
     195:	bf 40 1a 00 00       	mov    $0x1a40,%edi
     19a:	e8 68 0c 00 00       	call   e07 <UVM_Print_String>
        sum+=end-start;
    }
    UVM_LOG_S("\r\nThread Switching takes clock cycles:");
    UVM_LOG_I(sum/10000);
    UVM_Thd_Swt(UVM_CAPID(UVM_BOOT_TBL_THD,0),0);*/
    for(Count=0;Count<10000;Count++)
     19f:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     1a6:	00 
     1a7:	e9 2c 01 00 00       	jmp    2d8 <TEST_THD1_FUNC+0x15a>
    {
        UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG1,RME_SIG_FLAG_RCV_NS)>=0);
     1ac:	be 08 00 00 00       	mov    $0x8,%esi
     1b1:	bf 0c 00 00 00       	mov    $0xc,%edi
     1b6:	e8 83 16 00 00       	call   183e <UVM_Sig_Rcv>
     1bb:	48 85 c0             	test   %rax,%rax
     1be:	79 5c                	jns    21c <TEST_THD1_FUNC+0x9e>
     1c0:	bf 58 1a 00 00       	mov    $0x1a58,%edi
     1c5:	e8 3d 0c 00 00       	call   e07 <UVM_Print_String>
     1ca:	bf 89 1a 00 00       	mov    $0x1a89,%edi
     1cf:	e8 33 0c 00 00       	call   e07 <UVM_Print_String>
     1d4:	bf 95 1a 00 00       	mov    $0x1a95,%edi
     1d9:	e8 29 0c 00 00       	call   e07 <UVM_Print_String>
     1de:	bf 69 00 00 00       	mov    $0x69,%edi
     1e3:	e8 55 09 00 00       	call   b3d <UVM_Print_Int>
     1e8:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     1ed:	e8 15 0c 00 00       	call   e07 <UVM_Print_String>
     1f2:	bf a0 1a 00 00       	mov    $0x1aa0,%edi
     1f7:	e8 0b 0c 00 00       	call   e07 <UVM_Print_String>
     1fc:	bf ac 1a 00 00       	mov    $0x1aac,%edi
     201:	e8 01 0c 00 00       	call   e07 <UVM_Print_String>
     206:	bf af 1a 00 00       	mov    $0x1aaf,%edi
     20b:	e8 f7 0b 00 00       	call   e07 <UVM_Print_String>
     210:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     215:	e8 ed 0b 00 00       	call   e07 <UVM_Print_String>
     21a:	eb fe                	jmp    21a <TEST_THD1_FUNC+0x9c>
        UVM_LOG_S("\r\nsig snd/rev takes clock cycles:");
     21c:	bf b8 1a 00 00       	mov    $0x1ab8,%edi
     221:	e8 e1 0b 00 00       	call   e07 <UVM_Print_String>
        start=__UVM_X64_Read_TSC();
     226:	e8 f0 fd ff ff       	call   1b <__UVM_X64_Read_TSC>
     22b:	48 89 05 d6 1d 00 00 	mov    %rax,0x1dd6(%rip)        # 2008 <start>
        UVM_ASSERT(UVM_Thd_Swt(TEST_THD2,0)>=0);
     232:	be 00 00 00 00       	mov    $0x0,%esi
     237:	bf 0a 00 00 00       	mov    $0xa,%edi
     23c:	e8 0a 15 00 00       	call   174b <UVM_Thd_Swt>
     241:	48 85 c0             	test   %rax,%rax
     244:	79 5c                	jns    2a2 <TEST_THD1_FUNC+0x124>
     246:	bf 58 1a 00 00       	mov    $0x1a58,%edi
     24b:	e8 b7 0b 00 00       	call   e07 <UVM_Print_String>
     250:	bf 89 1a 00 00       	mov    $0x1a89,%edi
     255:	e8 ad 0b 00 00       	call   e07 <UVM_Print_String>
     25a:	bf 95 1a 00 00       	mov    $0x1a95,%edi
     25f:	e8 a3 0b 00 00       	call   e07 <UVM_Print_String>
     264:	bf 6c 00 00 00       	mov    $0x6c,%edi
     269:	e8 cf 08 00 00       	call   b3d <UVM_Print_Int>
     26e:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     273:	e8 8f 0b 00 00       	call   e07 <UVM_Print_String>
     278:	bf a0 1a 00 00       	mov    $0x1aa0,%edi
     27d:	e8 85 0b 00 00       	call   e07 <UVM_Print_String>
     282:	bf ac 1a 00 00       	mov    $0x1aac,%edi
     287:	e8 7b 0b 00 00       	call   e07 <UVM_Print_String>
     28c:	bf af 1a 00 00       	mov    $0x1aaf,%edi
     291:	e8 71 0b 00 00       	call   e07 <UVM_Print_String>
     296:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     29b:	e8 67 0b 00 00       	call   e07 <UVM_Print_String>
     2a0:	eb fe                	jmp    2a0 <TEST_THD1_FUNC+0x122>
        end=__UVM_X64_Read_TSC();
     2a2:	e8 74 fd ff ff       	call   1b <__UVM_X64_Read_TSC>
     2a7:	48 89 05 6a 1d 00 00 	mov    %rax,0x1d6a(%rip)        # 2018 <end>
        sum+=end-start;
     2ae:	48 8b 05 63 1d 00 00 	mov    0x1d63(%rip),%rax        # 2018 <end>
     2b5:	48 8b 15 4c 1d 00 00 	mov    0x1d4c(%rip),%rdx        # 2008 <start>
     2bc:	48 29 d0             	sub    %rdx,%rax
     2bf:	48 89 c1             	mov    %rax,%rcx
     2c2:	48 8b 05 57 1d 00 00 	mov    0x1d57(%rip),%rax        # 2020 <sum>
     2c9:	48 01 c8             	add    %rcx,%rax
     2cc:	48 89 05 4d 1d 00 00 	mov    %rax,0x1d4d(%rip)        # 2020 <sum>
    for(Count=0;Count<10000;Count++)
     2d3:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
     2d8:	48 81 7d f8 0f 27 00 	cmpq   $0x270f,-0x8(%rbp)
     2df:	00 
     2e0:	0f 8e c6 fe ff ff    	jle    1ac <TEST_THD1_FUNC+0x2e>
    }
    UVM_LOG_S("\r\nsig snd/rev takes clock cycles:");
     2e6:	bf b8 1a 00 00       	mov    $0x1ab8,%edi
     2eb:	e8 17 0b 00 00       	call   e07 <UVM_Print_String>
    UVM_LOG_I(sum/10000);
     2f0:	48 8b 05 29 1d 00 00 	mov    0x1d29(%rip),%rax        # 2020 <sum>
     2f7:	48 ba 4b 59 86 38 d6 	movabs $0x346dc5d63886594b,%rdx
     2fe:	c5 6d 34 
     301:	48 f7 e2             	mul    %rdx
     304:	48 89 d0             	mov    %rdx,%rax
     307:	48 c1 e8 0b          	shr    $0xb,%rax
     30b:	48 89 c7             	mov    %rax,%rdi
     30e:	e8 2a 08 00 00       	call   b3d <UVM_Print_Int>
}
     313:	90                   	nop
     314:	c9                   	leave  
     315:	c3                   	ret    

0000000000000316 <TEST_THD2_FUNC>:

void TEST_THD2_FUNC(void)
{
     316:	f3 0f 1e fa          	endbr64 
     31a:	55                   	push   %rbp
     31b:	48 89 e5             	mov    %rsp,%rbp
    while(1)
    {
        UVM_Sig_Snd(TEST_SIG1);
     31e:	bf 0c 00 00 00       	mov    $0xc,%edi
     323:	e8 e1 14 00 00       	call   1809 <UVM_Sig_Snd>
     328:	eb f4                	jmp    31e <TEST_THD2_FUNC+0x8>

000000000000032a <TEST_INV1_FUNC>:
    }
}

void TEST_INV1_FUNC(ptr_t param)
{
     32a:	f3 0f 1e fa          	endbr64 
     32e:	55                   	push   %rbp
     32f:	48 89 e5             	mov    %rsp,%rbp
     332:	48 83 ec 10          	sub    $0x10,%rsp
     336:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    middle=__UVM_X64_Read_TSC();
     33a:	e8 dc fc ff ff       	call   1b <__UVM_X64_Read_TSC>
     33f:	48 89 05 ca 1c 00 00 	mov    %rax,0x1cca(%rip)        # 2010 <middle>
    UVM_Inv_Ret(param);
     346:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     34a:	48 89 c7             	mov    %rax,%rdi
     34d:	e8 92 fd ff ff       	call   e4 <UVM_Inv_Ret>
}
     352:	90                   	nop
     353:	c9                   	leave  
     354:	c3                   	ret    

0000000000000355 <main>:
Input       : None.
Output      : None.
Return      : int - This function shall never return.
******************************************************************************/
int main(ptr_t CPUID)
{
     355:	f3 0f 1e fa          	endbr64 
     359:	55                   	push   %rbp
     35a:	48 89 e5             	mov    %rsp,%rbp
     35d:	4c 8d 9c 24 00 c0 ff 	lea    -0x4000(%rsp),%r11
     364:	ff 
     365:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
     36c:	48 83 0c 24 00       	orq    $0x0,(%rsp)
     371:	4c 39 dc             	cmp    %r11,%rsp
     374:	75 ef                	jne    365 <main+0x10>
     376:	48 83 ec 20          	sub    $0x20,%rsp
     37a:	48 89 bd e8 bf ff ff 	mov    %rdi,-0x4018(%rbp)
    ptr_t Cur_Addr;
    cnt_t Count;
    cnt_t Count1;
    cnt_t Count2;
    ptr_t TEST_INV_STACK[2048];
    UVM_LOG_S("\r\nEnter user mode success!Welcome to RME system!");
     381:	bf e0 1a 00 00       	mov    $0x1ae0,%edi
     386:	e8 7c 0a 00 00       	call   e07 <UVM_Print_String>
    UVM_LOG_S("\r\nNow we are running init thread on cpu:");
     38b:	bf 18 1b 00 00       	mov    $0x1b18,%edi
     390:	e8 72 0a 00 00       	call   e07 <UVM_Print_String>
    UVM_LOG_I(CPUID);
     395:	48 8b 85 e8 bf ff ff 	mov    -0x4018(%rbp),%rax
     39c:	48 89 c7             	mov    %rax,%rdi
     39f:	e8 99 07 00 00       	call   b3d <UVM_Print_Int>
    if(CPUID==0) {
     3a4:	48 83 bd e8 bf ff ff 	cmpq   $0x0,-0x4018(%rbp)
     3ab:	00 
     3ac:	0f 85 e7 06 00 00    	jne    a99 <main+0x744>
        /*Empty test begins here*/
        sum=0;
     3b2:	48 c7 05 63 1c 00 00 	movq   $0x0,0x1c63(%rip)        # 2020 <sum>
     3b9:	00 00 00 00 
        for(Count=0;Count<10000;Count++)
     3bd:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     3c4:	00 
     3c5:	eb 42                	jmp    409 <main+0xb4>
        {
            start=__UVM_X64_Read_TSC();
     3c7:	e8 4f fc ff ff       	call   1b <__UVM_X64_Read_TSC>
     3cc:	48 89 05 35 1c 00 00 	mov    %rax,0x1c35(%rip)        # 2008 <start>
            end=__UVM_X64_Read_TSC();
     3d3:	e8 43 fc ff ff       	call   1b <__UVM_X64_Read_TSC>
     3d8:	48 89 05 39 1c 00 00 	mov    %rax,0x1c39(%rip)        # 2018 <end>
            sum+=end-start;
     3df:	48 8b 05 32 1c 00 00 	mov    0x1c32(%rip),%rax        # 2018 <end>
     3e6:	48 8b 15 1b 1c 00 00 	mov    0x1c1b(%rip),%rdx        # 2008 <start>
     3ed:	48 29 d0             	sub    %rdx,%rax
     3f0:	48 89 c1             	mov    %rax,%rcx
     3f3:	48 8b 05 26 1c 00 00 	mov    0x1c26(%rip),%rax        # 2020 <sum>
     3fa:	48 01 c8             	add    %rcx,%rax
     3fd:	48 89 05 1c 1c 00 00 	mov    %rax,0x1c1c(%rip)        # 2020 <sum>
        for(Count=0;Count<10000;Count++)
     404:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
     409:	48 81 7d f8 0f 27 00 	cmpq   $0x270f,-0x8(%rbp)
     410:	00 
     411:	7e b4                	jle    3c7 <main+0x72>
        }
        UVM_LOG_S("\r\nEmpty test takes clock cycles:");
     413:	bf 48 1b 00 00       	mov    $0x1b48,%edi
     418:	e8 ea 09 00 00       	call   e07 <UVM_Print_String>
        UVM_LOG_I(sum/10000);
     41d:	48 8b 05 fc 1b 00 00 	mov    0x1bfc(%rip),%rax        # 2020 <sum>
     424:	48 ba 4b 59 86 38 d6 	movabs $0x346dc5d63886594b,%rdx
     42b:	c5 6d 34 
     42e:	48 f7 e2             	mul    %rdx
     431:	48 89 d0             	mov    %rdx,%rax
     434:	48 c1 e8 0b          	shr    $0xb,%rax
     438:	48 89 c7             	mov    %rax,%rdi
     43b:	e8 fd 06 00 00       	call   b3d <UVM_Print_Int>
        /*Empty test ends here*/

        /*Empty system call test begins here*/
        sum=0;
     440:	48 c7 05 d5 1b 00 00 	movq   $0x0,0x1bd5(%rip)        # 2020 <sum>
     447:	00 00 00 00 
        for(Count=0;Count<10000;Count++)
     44b:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     452:	00 
     453:	eb 63                	jmp    4b8 <main+0x163>
        {
            start=__UVM_X64_Read_TSC();
     455:	e8 c1 fb ff ff       	call   1b <__UVM_X64_Read_TSC>
     45a:	48 89 05 a7 1b 00 00 	mov    %rax,0x1ba7(%rip)        # 2008 <start>
            UVM_Svc(-1,-1,-1,-1);
     461:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
     468:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
     46f:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
     476:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
     47d:	e8 6b fc ff ff       	call   ed <UVM_Svc>
            end=__UVM_X64_Read_TSC();
     482:	e8 94 fb ff ff       	call   1b <__UVM_X64_Read_TSC>
     487:	48 89 05 8a 1b 00 00 	mov    %rax,0x1b8a(%rip)        # 2018 <end>
            sum+=end-start;
     48e:	48 8b 05 83 1b 00 00 	mov    0x1b83(%rip),%rax        # 2018 <end>
     495:	48 8b 15 6c 1b 00 00 	mov    0x1b6c(%rip),%rdx        # 2008 <start>
     49c:	48 29 d0             	sub    %rdx,%rax
     49f:	48 89 c1             	mov    %rax,%rcx
     4a2:	48 8b 05 77 1b 00 00 	mov    0x1b77(%rip),%rax        # 2020 <sum>
     4a9:	48 01 c8             	add    %rcx,%rax
     4ac:	48 89 05 6d 1b 00 00 	mov    %rax,0x1b6d(%rip)        # 2020 <sum>
        for(Count=0;Count<10000;Count++)
     4b3:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
     4b8:	48 81 7d f8 0f 27 00 	cmpq   $0x270f,-0x8(%rbp)
     4bf:	00 
     4c0:	7e 93                	jle    455 <main+0x100>
        }
        UVM_LOG_S("\r\nEmpty system call takes clock cycles:");
     4c2:	bf 70 1b 00 00       	mov    $0x1b70,%edi
     4c7:	e8 3b 09 00 00       	call   e07 <UVM_Print_String>
        UVM_LOG_I(sum/10000);
     4cc:	48 8b 05 4d 1b 00 00 	mov    0x1b4d(%rip),%rax        # 2020 <sum>
     4d3:	48 ba 4b 59 86 38 d6 	movabs $0x346dc5d63886594b,%rdx
     4da:	c5 6d 34 
     4dd:	48 f7 e2             	mul    %rdx
     4e0:	48 89 d0             	mov    %rdx,%rax
     4e3:	48 c1 e8 0b          	shr    $0xb,%rax
     4e7:	48 89 c7             	mov    %rax,%rdi
     4ea:	e8 4e 06 00 00       	call   b3d <UVM_Print_Int>
        /*Empty system call test ends here*/

        /*Now we begin to place kernel objects at this address,It must be a relative address*/
        Cur_Addr=0xFFFF800010000000ULL-0xFFFF800001600000ULL;
     4ef:	48 c7 45 f0 00 00 a0 	movq   $0xea00000,-0x10(%rbp)
     4f6:	0e 

        UVM_Thd_Swt(TEST_THD1,0);
        UVM_LOG_S("\r\nExit THD1!");*/
        /*Thread switching test ends here*/

        UVM_ASSERT(UVM_Proc_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS,UVM_BOOT_CAPTBL,
     4f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     4fb:	49 89 c1             	mov    %rax,%r9
     4fe:	41 b8 00 80 01 00    	mov    $0x18000,%r8d
     504:	b9 00 00 00 00       	mov    $0x0,%ecx
     509:	ba 0f 00 00 00       	mov    $0xf,%edx
     50e:	be 00 80 05 00       	mov    $0x58000,%esi
     513:	bf 00 00 00 00       	mov    $0x0,%edi
     518:	e8 c7 0e 00 00       	call   13e4 <UVM_Proc_Crt>
     51d:	48 85 c0             	test   %rax,%rax
     520:	79 5c                	jns    57e <main+0x229>
     522:	bf 58 1a 00 00       	mov    $0x1a58,%edi
     527:	e8 db 08 00 00       	call   e07 <UVM_Print_String>
     52c:	bf 89 1a 00 00       	mov    $0x1a89,%edi
     531:	e8 d1 08 00 00       	call   e07 <UVM_Print_String>
     536:	bf 95 1a 00 00       	mov    $0x1a95,%edi
     53b:	e8 c7 08 00 00       	call   e07 <UVM_Print_String>
     540:	bf c0 00 00 00       	mov    $0xc0,%edi
     545:	e8 f3 05 00 00       	call   b3d <UVM_Print_Int>
     54a:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     54f:	e8 b3 08 00 00       	call   e07 <UVM_Print_String>
     554:	bf a0 1a 00 00       	mov    $0x1aa0,%edi
     559:	e8 a9 08 00 00       	call   e07 <UVM_Print_String>
     55e:	bf ac 1a 00 00       	mov    $0x1aac,%edi
     563:	e8 9f 08 00 00       	call   e07 <UVM_Print_String>
     568:	bf af 1a 00 00       	mov    $0x1aaf,%edi
     56d:	e8 95 08 00 00       	call   e07 <UVM_Print_String>
     572:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     577:	e8 8b 08 00 00       	call   e07 <UVM_Print_String>
     57c:	eb fe                	jmp    57c <main+0x227>
                                        UVM_CAPID(UVM_BOOT_TBL_PGTBL,0),Cur_Addr)>=0);
        Cur_Addr+=UVM_PROC_SIZE;
     57e:	48 83 45 f0 20       	addq   $0x20,-0x10(%rbp)
        UVM_ASSERT(UVM_Thd_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD1, TEST_PROCESS, 10, Cur_Addr)>=0);
     583:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     587:	49 89 c1             	mov    %rax,%r9
     58a:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
     590:	b9 0f 00 00 00       	mov    $0xf,%ecx
     595:	ba 09 00 00 00       	mov    $0x9,%edx
     59a:	be 00 80 05 00       	mov    $0x58000,%esi
     59f:	bf 00 00 00 00       	mov    $0x0,%edi
     5a4:	e8 36 0f 00 00       	call   14df <UVM_Thd_Crt>
     5a9:	48 85 c0             	test   %rax,%rax
     5ac:	79 5c                	jns    60a <main+0x2b5>
     5ae:	bf 58 1a 00 00       	mov    $0x1a58,%edi
     5b3:	e8 4f 08 00 00       	call   e07 <UVM_Print_String>
     5b8:	bf 89 1a 00 00       	mov    $0x1a89,%edi
     5bd:	e8 45 08 00 00       	call   e07 <UVM_Print_String>
     5c2:	bf 95 1a 00 00       	mov    $0x1a95,%edi
     5c7:	e8 3b 08 00 00       	call   e07 <UVM_Print_String>
     5cc:	bf c3 00 00 00       	mov    $0xc3,%edi
     5d1:	e8 67 05 00 00       	call   b3d <UVM_Print_Int>
     5d6:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     5db:	e8 27 08 00 00       	call   e07 <UVM_Print_String>
     5e0:	bf a0 1a 00 00       	mov    $0x1aa0,%edi
     5e5:	e8 1d 08 00 00       	call   e07 <UVM_Print_String>
     5ea:	bf ac 1a 00 00       	mov    $0x1aac,%edi
     5ef:	e8 13 08 00 00       	call   e07 <UVM_Print_String>
     5f4:	bf af 1a 00 00       	mov    $0x1aaf,%edi
     5f9:	e8 09 08 00 00       	call   e07 <UVM_Print_String>
     5fe:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     603:	e8 ff 07 00 00       	call   e07 <UVM_Print_String>
     608:	eb fe                	jmp    608 <main+0x2b3>
        UVM_ASSERT(UVM_Thd_Sched_Bind(TEST_THD1,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
     60a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     610:	b9 00 00 00 00       	mov    $0x0,%ecx
     615:	b8 00 00 00 80       	mov    $0x80000000,%eax
     61a:	48 89 c2             	mov    %rax,%rdx
     61d:	be 00 80 03 00       	mov    $0x38000,%esi
     622:	bf 09 00 00 00       	mov    $0x9,%edi
     627:	e8 e2 0f 00 00       	call   160e <UVM_Thd_Sched_Bind>
     62c:	48 85 c0             	test   %rax,%rax
     62f:	79 5c                	jns    68d <main+0x338>
     631:	bf 58 1a 00 00       	mov    $0x1a58,%edi
     636:	e8 cc 07 00 00       	call   e07 <UVM_Print_String>
     63b:	bf 89 1a 00 00       	mov    $0x1a89,%edi
     640:	e8 c2 07 00 00       	call   e07 <UVM_Print_String>
     645:	bf 95 1a 00 00       	mov    $0x1a95,%edi
     64a:	e8 b8 07 00 00       	call   e07 <UVM_Print_String>
     64f:	bf c4 00 00 00       	mov    $0xc4,%edi
     654:	e8 e4 04 00 00       	call   b3d <UVM_Print_Int>
     659:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     65e:	e8 a4 07 00 00       	call   e07 <UVM_Print_String>
     663:	bf a0 1a 00 00       	mov    $0x1aa0,%edi
     668:	e8 9a 07 00 00       	call   e07 <UVM_Print_String>
     66d:	bf ac 1a 00 00       	mov    $0x1aac,%edi
     672:	e8 90 07 00 00       	call   e07 <UVM_Print_String>
     677:	bf af 1a 00 00       	mov    $0x1aaf,%edi
     67c:	e8 86 07 00 00       	call   e07 <UVM_Print_String>
     681:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     686:	e8 7c 07 00 00       	call   e07 <UVM_Print_String>
     68b:	eb fe                	jmp    68b <main+0x336>
        UVM_ASSERT(UVM_Thd_Time_Xfer(TEST_THD1,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     68d:	48 b8 fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rax
     694:	ff ff 7f 
     697:	48 89 c2             	mov    %rax,%rdx
     69a:	be 00 80 03 00       	mov    $0x38000,%esi
     69f:	bf 09 00 00 00       	mov    $0x9,%edi
     6a4:	e8 67 10 00 00       	call   1710 <UVM_Thd_Time_Xfer>
     6a9:	48 85 c0             	test   %rax,%rax
     6ac:	79 5c                	jns    70a <main+0x3b5>
     6ae:	bf 58 1a 00 00       	mov    $0x1a58,%edi
     6b3:	e8 4f 07 00 00       	call   e07 <UVM_Print_String>
     6b8:	bf 89 1a 00 00       	mov    $0x1a89,%edi
     6bd:	e8 45 07 00 00       	call   e07 <UVM_Print_String>
     6c2:	bf 95 1a 00 00       	mov    $0x1a95,%edi
     6c7:	e8 3b 07 00 00       	call   e07 <UVM_Print_String>
     6cc:	bf c5 00 00 00       	mov    $0xc5,%edi
     6d1:	e8 67 04 00 00       	call   b3d <UVM_Print_Int>
     6d6:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     6db:	e8 27 07 00 00       	call   e07 <UVM_Print_String>
     6e0:	bf a0 1a 00 00       	mov    $0x1aa0,%edi
     6e5:	e8 1d 07 00 00       	call   e07 <UVM_Print_String>
     6ea:	bf ac 1a 00 00       	mov    $0x1aac,%edi
     6ef:	e8 13 07 00 00       	call   e07 <UVM_Print_String>
     6f4:	bf af 1a 00 00       	mov    $0x1aaf,%edi
     6f9:	e8 09 07 00 00       	call   e07 <UVM_Print_String>
     6fe:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     703:	e8 ff 06 00 00       	call   e07 <UVM_Print_String>
     708:	eb fe                	jmp    708 <main+0x3b3>
        UVM_ASSERT(UVM_Thd_Exec_Set(TEST_THD1,TEST_THD1_FUNC,12*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     70a:	b8 7e 01 00 00       	mov    $0x17e,%eax
     70f:	b9 00 00 00 00       	mov    $0x0,%ecx
     714:	ba 00 00 c0 00       	mov    $0xc00000,%edx
     719:	48 89 c6             	mov    %rax,%rsi
     71c:	bf 09 00 00 00       	mov    $0x9,%edi
     721:	e8 6a 0e 00 00       	call   1590 <UVM_Thd_Exec_Set>
     726:	48 85 c0             	test   %rax,%rax
     729:	79 5c                	jns    787 <main+0x432>
     72b:	bf 58 1a 00 00       	mov    $0x1a58,%edi
     730:	e8 d2 06 00 00       	call   e07 <UVM_Print_String>
     735:	bf 89 1a 00 00       	mov    $0x1a89,%edi
     73a:	e8 c8 06 00 00       	call   e07 <UVM_Print_String>
     73f:	bf 95 1a 00 00       	mov    $0x1a95,%edi
     744:	e8 be 06 00 00       	call   e07 <UVM_Print_String>
     749:	bf c6 00 00 00       	mov    $0xc6,%edi
     74e:	e8 ea 03 00 00       	call   b3d <UVM_Print_Int>
     753:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     758:	e8 aa 06 00 00       	call   e07 <UVM_Print_String>
     75d:	bf a0 1a 00 00       	mov    $0x1aa0,%edi
     762:	e8 a0 06 00 00       	call   e07 <UVM_Print_String>
     767:	bf ac 1a 00 00       	mov    $0x1aac,%edi
     76c:	e8 96 06 00 00       	call   e07 <UVM_Print_String>
     771:	bf af 1a 00 00       	mov    $0x1aaf,%edi
     776:	e8 8c 06 00 00       	call   e07 <UVM_Print_String>
     77b:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     780:	e8 82 06 00 00       	call   e07 <UVM_Print_String>
     785:	eb fe                	jmp    785 <main+0x430>
        Cur_Addr+=UVM_THD_SIZE;
     787:	48 81 45 f0 d0 09 00 	addq   $0x9d0,-0x10(%rbp)
     78e:	00 

        UVM_ASSERT(UVM_Thd_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD2, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
     78f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     793:	49 89 c1             	mov    %rax,%r9
     796:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
     79c:	b9 02 00 00 00       	mov    $0x2,%ecx
     7a1:	ba 0a 00 00 00       	mov    $0xa,%edx
     7a6:	be 00 80 05 00       	mov    $0x58000,%esi
     7ab:	bf 00 00 00 00       	mov    $0x0,%edi
     7b0:	e8 2a 0d 00 00       	call   14df <UVM_Thd_Crt>
     7b5:	48 85 c0             	test   %rax,%rax
     7b8:	79 5c                	jns    816 <main+0x4c1>
     7ba:	bf 58 1a 00 00       	mov    $0x1a58,%edi
     7bf:	e8 43 06 00 00       	call   e07 <UVM_Print_String>
     7c4:	bf 89 1a 00 00       	mov    $0x1a89,%edi
     7c9:	e8 39 06 00 00       	call   e07 <UVM_Print_String>
     7ce:	bf 95 1a 00 00       	mov    $0x1a95,%edi
     7d3:	e8 2f 06 00 00       	call   e07 <UVM_Print_String>
     7d8:	bf c9 00 00 00       	mov    $0xc9,%edi
     7dd:	e8 5b 03 00 00       	call   b3d <UVM_Print_Int>
     7e2:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     7e7:	e8 1b 06 00 00       	call   e07 <UVM_Print_String>
     7ec:	bf a0 1a 00 00       	mov    $0x1aa0,%edi
     7f1:	e8 11 06 00 00       	call   e07 <UVM_Print_String>
     7f6:	bf ac 1a 00 00       	mov    $0x1aac,%edi
     7fb:	e8 07 06 00 00       	call   e07 <UVM_Print_String>
     800:	bf af 1a 00 00       	mov    $0x1aaf,%edi
     805:	e8 fd 05 00 00       	call   e07 <UVM_Print_String>
     80a:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     80f:	e8 f3 05 00 00       	call   e07 <UVM_Print_String>
     814:	eb fe                	jmp    814 <main+0x4bf>
        UVM_ASSERT(UVM_Thd_Sched_Bind(TEST_THD2,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
     816:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     81c:	b9 00 00 00 00       	mov    $0x0,%ecx
     821:	b8 00 00 00 80       	mov    $0x80000000,%eax
     826:	48 89 c2             	mov    %rax,%rdx
     829:	be 00 80 03 00       	mov    $0x38000,%esi
     82e:	bf 0a 00 00 00       	mov    $0xa,%edi
     833:	e8 d6 0d 00 00       	call   160e <UVM_Thd_Sched_Bind>
     838:	48 85 c0             	test   %rax,%rax
     83b:	79 5c                	jns    899 <main+0x544>
     83d:	bf 58 1a 00 00       	mov    $0x1a58,%edi
     842:	e8 c0 05 00 00       	call   e07 <UVM_Print_String>
     847:	bf 89 1a 00 00       	mov    $0x1a89,%edi
     84c:	e8 b6 05 00 00       	call   e07 <UVM_Print_String>
     851:	bf 95 1a 00 00       	mov    $0x1a95,%edi
     856:	e8 ac 05 00 00       	call   e07 <UVM_Print_String>
     85b:	bf ca 00 00 00       	mov    $0xca,%edi
     860:	e8 d8 02 00 00       	call   b3d <UVM_Print_Int>
     865:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     86a:	e8 98 05 00 00       	call   e07 <UVM_Print_String>
     86f:	bf a0 1a 00 00       	mov    $0x1aa0,%edi
     874:	e8 8e 05 00 00       	call   e07 <UVM_Print_String>
     879:	bf ac 1a 00 00       	mov    $0x1aac,%edi
     87e:	e8 84 05 00 00       	call   e07 <UVM_Print_String>
     883:	bf af 1a 00 00       	mov    $0x1aaf,%edi
     888:	e8 7a 05 00 00       	call   e07 <UVM_Print_String>
     88d:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     892:	e8 70 05 00 00       	call   e07 <UVM_Print_String>
     897:	eb fe                	jmp    897 <main+0x542>
        UVM_ASSERT(UVM_Thd_Time_Xfer(TEST_THD2,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     899:	48 b8 fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rax
     8a0:	ff ff 7f 
     8a3:	48 89 c2             	mov    %rax,%rdx
     8a6:	be 00 80 03 00       	mov    $0x38000,%esi
     8ab:	bf 0a 00 00 00       	mov    $0xa,%edi
     8b0:	e8 5b 0e 00 00       	call   1710 <UVM_Thd_Time_Xfer>
     8b5:	48 85 c0             	test   %rax,%rax
     8b8:	79 5c                	jns    916 <main+0x5c1>
     8ba:	bf 58 1a 00 00       	mov    $0x1a58,%edi
     8bf:	e8 43 05 00 00       	call   e07 <UVM_Print_String>
     8c4:	bf 89 1a 00 00       	mov    $0x1a89,%edi
     8c9:	e8 39 05 00 00       	call   e07 <UVM_Print_String>
     8ce:	bf 95 1a 00 00       	mov    $0x1a95,%edi
     8d3:	e8 2f 05 00 00       	call   e07 <UVM_Print_String>
     8d8:	bf cb 00 00 00       	mov    $0xcb,%edi
     8dd:	e8 5b 02 00 00       	call   b3d <UVM_Print_Int>
     8e2:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     8e7:	e8 1b 05 00 00       	call   e07 <UVM_Print_String>
     8ec:	bf a0 1a 00 00       	mov    $0x1aa0,%edi
     8f1:	e8 11 05 00 00       	call   e07 <UVM_Print_String>
     8f6:	bf ac 1a 00 00       	mov    $0x1aac,%edi
     8fb:	e8 07 05 00 00       	call   e07 <UVM_Print_String>
     900:	bf af 1a 00 00       	mov    $0x1aaf,%edi
     905:	e8 fd 04 00 00       	call   e07 <UVM_Print_String>
     90a:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     90f:	e8 f3 04 00 00       	call   e07 <UVM_Print_String>
     914:	eb fe                	jmp    914 <main+0x5bf>
        UVM_ASSERT(UVM_Thd_Exec_Set(TEST_THD2,TEST_THD2_FUNC,13*UVM_POW2(RME_PGT_SIZE_1M),1)>=0);
     916:	b8 16 03 00 00       	mov    $0x316,%eax
     91b:	b9 01 00 00 00       	mov    $0x1,%ecx
     920:	ba 00 00 d0 00       	mov    $0xd00000,%edx
     925:	48 89 c6             	mov    %rax,%rsi
     928:	bf 0a 00 00 00       	mov    $0xa,%edi
     92d:	e8 5e 0c 00 00       	call   1590 <UVM_Thd_Exec_Set>
     932:	48 85 c0             	test   %rax,%rax
     935:	79 5c                	jns    993 <main+0x63e>
     937:	bf 58 1a 00 00       	mov    $0x1a58,%edi
     93c:	e8 c6 04 00 00       	call   e07 <UVM_Print_String>
     941:	bf 89 1a 00 00       	mov    $0x1a89,%edi
     946:	e8 bc 04 00 00       	call   e07 <UVM_Print_String>
     94b:	bf 95 1a 00 00       	mov    $0x1a95,%edi
     950:	e8 b2 04 00 00       	call   e07 <UVM_Print_String>
     955:	bf cc 00 00 00       	mov    $0xcc,%edi
     95a:	e8 de 01 00 00       	call   b3d <UVM_Print_Int>
     95f:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     964:	e8 9e 04 00 00       	call   e07 <UVM_Print_String>
     969:	bf a0 1a 00 00       	mov    $0x1aa0,%edi
     96e:	e8 94 04 00 00       	call   e07 <UVM_Print_String>
     973:	bf ac 1a 00 00       	mov    $0x1aac,%edi
     978:	e8 8a 04 00 00       	call   e07 <UVM_Print_String>
     97d:	bf af 1a 00 00       	mov    $0x1aaf,%edi
     982:	e8 80 04 00 00       	call   e07 <UVM_Print_String>
     987:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     98c:	e8 76 04 00 00       	call   e07 <UVM_Print_String>
     991:	eb fe                	jmp    991 <main+0x63c>
        Cur_Addr+=UVM_THD_SIZE;
     993:	48 81 45 f0 d0 09 00 	addq   $0x9d0,-0x10(%rbp)
     99a:	00 

        /*Signal send test begins here*/
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG1, Cur_Addr)>=0);
     99b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     99f:	48 89 c1             	mov    %rax,%rcx
     9a2:	ba 0c 00 00 00       	mov    $0xc,%edx
     9a7:	be 00 80 05 00       	mov    $0x58000,%esi
     9ac:	bf 00 00 00 00       	mov    $0x0,%edi
     9b1:	e8 cd 0d 00 00       	call   1783 <UVM_Sig_Crt>
     9b6:	48 85 c0             	test   %rax,%rax
     9b9:	79 5c                	jns    a17 <main+0x6c2>
     9bb:	bf 58 1a 00 00       	mov    $0x1a58,%edi
     9c0:	e8 42 04 00 00       	call   e07 <UVM_Print_String>
     9c5:	bf 89 1a 00 00       	mov    $0x1a89,%edi
     9ca:	e8 38 04 00 00       	call   e07 <UVM_Print_String>
     9cf:	bf 95 1a 00 00       	mov    $0x1a95,%edi
     9d4:	e8 2e 04 00 00       	call   e07 <UVM_Print_String>
     9d9:	bf d0 00 00 00       	mov    $0xd0,%edi
     9de:	e8 5a 01 00 00       	call   b3d <UVM_Print_Int>
     9e3:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     9e8:	e8 1a 04 00 00       	call   e07 <UVM_Print_String>
     9ed:	bf a0 1a 00 00       	mov    $0x1aa0,%edi
     9f2:	e8 10 04 00 00       	call   e07 <UVM_Print_String>
     9f7:	bf ac 1a 00 00       	mov    $0x1aac,%edi
     9fc:	e8 06 04 00 00       	call   e07 <UVM_Print_String>
     a01:	bf af 1a 00 00       	mov    $0x1aaf,%edi
     a06:	e8 fc 03 00 00       	call   e07 <UVM_Print_String>
     a0b:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     a10:	e8 f2 03 00 00       	call   e07 <UVM_Print_String>
     a15:	eb fe                	jmp    a15 <main+0x6c0>
        Cur_Addr+=UVM_SIG_SIZE;
     a17:	48 83 45 f0 20       	addq   $0x20,-0x10(%rbp)
        sum=0;
     a1c:	48 c7 05 f9 15 00 00 	movq   $0x0,0x15f9(%rip)        # 2020 <sum>
     a23:	00 00 00 00 
        UVM_ASSERT(UVM_Thd_Swt(TEST_THD1,0)>=0);
     a27:	be 00 00 00 00       	mov    $0x0,%esi
     a2c:	bf 09 00 00 00       	mov    $0x9,%edi
     a31:	e8 15 0d 00 00       	call   174b <UVM_Thd_Swt>
     a36:	48 85 c0             	test   %rax,%rax
     a39:	79 5c                	jns    a97 <main+0x742>
     a3b:	bf 58 1a 00 00       	mov    $0x1a58,%edi
     a40:	e8 c2 03 00 00       	call   e07 <UVM_Print_String>
     a45:	bf 89 1a 00 00       	mov    $0x1a89,%edi
     a4a:	e8 b8 03 00 00       	call   e07 <UVM_Print_String>
     a4f:	bf 95 1a 00 00       	mov    $0x1a95,%edi
     a54:	e8 ae 03 00 00       	call   e07 <UVM_Print_String>
     a59:	bf d3 00 00 00       	mov    $0xd3,%edi
     a5e:	e8 da 00 00 00       	call   b3d <UVM_Print_Int>
     a63:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     a68:	e8 9a 03 00 00       	call   e07 <UVM_Print_String>
     a6d:	bf a0 1a 00 00       	mov    $0x1aa0,%edi
     a72:	e8 90 03 00 00       	call   e07 <UVM_Print_String>
     a77:	bf ac 1a 00 00       	mov    $0x1aac,%edi
     a7c:	e8 86 03 00 00       	call   e07 <UVM_Print_String>
     a81:	bf af 1a 00 00       	mov    $0x1aaf,%edi
     a86:	e8 7c 03 00 00       	call   e07 <UVM_Print_String>
     a8b:	bf 9d 1a 00 00       	mov    $0x1a9d,%edi
     a90:	e8 72 03 00 00       	call   e07 <UVM_Print_String>
     a95:	eb fe                	jmp    a95 <main+0x740>
            start=__UVM_X64_Read_TSC();
            UVM_ASSERT(UVM_Thd_Swt(TEST_THD1,0)>=0);
            end=__UVM_X64_Read_TSC();
            sum+=end-start;
        }*/
        while (1){}
     a97:	eb fe                	jmp    a97 <main+0x742>
        UVM_Thd_Swt(TEST_THD1,0);

        /*Cross-process thread switching test ends here*/
        while (1);/*Idle*/
    }
}
     a99:	90                   	nop
     a9a:	c9                   	leave  
     a9b:	c3                   	ret    

0000000000000a9c <UVM_List_Crt>:
Input       : volatile struct UVM_List* Head - The pointer to the list head.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Crt(volatile struct UVM_List* Head)
{
     a9c:	f3 0f 1e fa          	endbr64 
     aa0:	55                   	push   %rbp
     aa1:	48 89 e5             	mov    %rsp,%rbp
     aa4:	48 83 ec 08          	sub    $0x8,%rsp
     aa8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    Head->Prev=(struct UVM_List*)Head;
     aac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     ab0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     ab4:	48 89 10             	mov    %rdx,(%rax)
    Head->Next=(struct UVM_List*)Head;
     ab7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     abb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     abf:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
     ac3:	90                   	nop
     ac4:	c9                   	leave  
     ac5:	c3                   	ret    

0000000000000ac6 <UVM_List_Del>:
              volatile struct UVM_List* Next - The next node of the target node.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Del(volatile struct UVM_List* Prev,volatile struct UVM_List* Next)
{
     ac6:	f3 0f 1e fa          	endbr64 
     aca:	55                   	push   %rbp
     acb:	48 89 e5             	mov    %rsp,%rbp
     ace:	48 83 ec 10          	sub    $0x10,%rsp
     ad2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     ad6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    Next->Prev=(struct UVM_List*)Prev;
     ada:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     ade:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     ae2:	48 89 10             	mov    %rdx,(%rax)
    Prev->Next=(struct UVM_List*)Next;
     ae5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     ae9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
     aed:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
     af1:	90                   	nop
     af2:	c9                   	leave  
     af3:	c3                   	ret    

0000000000000af4 <UVM_List_Ins>:
Return      : None.
******************************************************************************/
void UVM_List_Ins(volatile struct UVM_List* New,
                  volatile struct UVM_List* Prev,
                  volatile struct UVM_List* Next)
{
     af4:	f3 0f 1e fa          	endbr64 
     af8:	55                   	push   %rbp
     af9:	48 89 e5             	mov    %rsp,%rbp
     afc:	48 83 ec 18          	sub    $0x18,%rsp
     b00:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     b04:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     b08:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    Next->Prev=(struct UVM_List*)New;
     b0c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     b10:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     b14:	48 89 10             	mov    %rdx,(%rax)
    New->Next=(struct UVM_List*)Next;
     b17:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     b1b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
     b1f:	48 89 50 08          	mov    %rdx,0x8(%rax)
    New->Prev=(struct UVM_List*)Prev;
     b23:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     b27:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
     b2b:	48 89 10             	mov    %rdx,(%rax)
    Prev->Next=(struct UVM_List*)New;
     b2e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     b32:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     b36:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
     b3a:	90                   	nop
     b3b:	c9                   	leave  
     b3c:	c3                   	ret    

0000000000000b3d <UVM_Print_Int>:
Input       : cnt_t Int - The integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Int(cnt_t Int)
{
     b3d:	f3 0f 1e fa          	endbr64 
     b41:	55                   	push   %rbp
     b42:	48 89 e5             	mov    %rsp,%rbp
     b45:	48 83 ec 30          	sub    $0x30,%rsp
     b49:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    cnt_t Count;
    cnt_t Num;
    ptr_t Div;
    
    /* how many digits are there? */
    if(Int==0)
     b4d:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
     b52:	75 14                	jne    b68 <UVM_Print_Int+0x2b>
    {
        UVM_Putchar('0');
     b54:	bf 30 00 00 00       	mov    $0x30,%edi
     b59:	e8 0d 0e 00 00       	call   196b <UVM_Putchar>
        return 1;
     b5e:	b8 01 00 00 00       	mov    $0x1,%eax
     b63:	e9 d8 01 00 00       	jmp    d40 <UVM_Print_Int+0x203>
    }
    else if(Int<0)
     b68:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
     b6d:	0f 89 f1 00 00 00    	jns    c64 <UVM_Print_Int+0x127>
    {
        /* How many digits are there? */
        Count=0;
     b73:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
     b7a:	00 
        Div=1;
     b7b:	48 c7 45 e0 01 00 00 	movq   $0x1,-0x20(%rbp)
     b82:	00 
        Iter=-Int;
     b83:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     b87:	48 f7 d8             	neg    %rax
     b8a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while(Iter!=0)
     b8e:	eb 36                	jmp    bc6 <UVM_Print_Int+0x89>
        {
            Iter/=10;
     b90:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     b94:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
     b9b:	cc cc cc 
     b9e:	48 f7 e2             	mul    %rdx
     ba1:	48 89 d0             	mov    %rdx,%rax
     ba4:	48 c1 e8 03          	shr    $0x3,%rax
     ba8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            Count++;
     bac:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
            Div*=10;
     bb1:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
     bb5:	48 89 d0             	mov    %rdx,%rax
     bb8:	48 c1 e0 02          	shl    $0x2,%rax
     bbc:	48 01 d0             	add    %rdx,%rax
     bbf:	48 01 c0             	add    %rax,%rax
     bc2:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Iter!=0)
     bc6:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
     bcb:	75 c3                	jne    b90 <UVM_Print_Int+0x53>
        }
        Div/=10;
     bcd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     bd1:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
     bd8:	cc cc cc 
     bdb:	48 f7 e2             	mul    %rdx
     bde:	48 89 d0             	mov    %rdx,%rax
     be1:	48 c1 e8 03          	shr    $0x3,%rax
     be5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        
        UVM_Putchar('-');
     be9:	bf 2d 00 00 00       	mov    $0x2d,%edi
     bee:	e8 78 0d 00 00       	call   196b <UVM_Putchar>
        Iter=-Int;
     bf3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     bf7:	48 f7 d8             	neg    %rax
     bfa:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        Num=Count+1;
     bfe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     c02:	48 83 c0 01          	add    $0x1,%rax
     c06:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        
        while(Count>0)
     c0a:	eb 4c                	jmp    c58 <UVM_Print_Int+0x11b>
        {
            Count--;
     c0c:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            UVM_Putchar(Iter/Div+'0');
     c11:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     c15:	ba 00 00 00 00       	mov    $0x0,%edx
     c1a:	48 f7 75 e0          	divq   -0x20(%rbp)
     c1e:	83 c0 30             	add    $0x30,%eax
     c21:	0f be c0             	movsbl %al,%eax
     c24:	89 c7                	mov    %eax,%edi
     c26:	e8 40 0d 00 00       	call   196b <UVM_Putchar>
            Iter=Iter%Div;
     c2b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     c2f:	ba 00 00 00 00       	mov    $0x0,%edx
     c34:	48 f7 75 e0          	divq   -0x20(%rbp)
     c38:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
            Div/=10;
     c3c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     c40:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
     c47:	cc cc cc 
     c4a:	48 f7 e2             	mul    %rdx
     c4d:	48 89 d0             	mov    %rdx,%rax
     c50:	48 c1 e8 03          	shr    $0x3,%rax
     c54:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Count>0)
     c58:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
     c5d:	7f ad                	jg     c0c <UVM_Print_Int+0xcf>
     c5f:	e9 d8 00 00 00       	jmp    d3c <UVM_Print_Int+0x1ff>
        }
    }
    else
    {
        /* How many digits are there? */
        Count=0;
     c64:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
     c6b:	00 
        Div=1;
     c6c:	48 c7 45 e0 01 00 00 	movq   $0x1,-0x20(%rbp)
     c73:	00 
        Iter=Int;
     c74:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     c78:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while(Iter!=0)
     c7c:	eb 36                	jmp    cb4 <UVM_Print_Int+0x177>
        {
            Iter/=10;
     c7e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     c82:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
     c89:	cc cc cc 
     c8c:	48 f7 e2             	mul    %rdx
     c8f:	48 89 d0             	mov    %rdx,%rax
     c92:	48 c1 e8 03          	shr    $0x3,%rax
     c96:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            Count++;
     c9a:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
            Div*=10;
     c9f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
     ca3:	48 89 d0             	mov    %rdx,%rax
     ca6:	48 c1 e0 02          	shl    $0x2,%rax
     caa:	48 01 d0             	add    %rdx,%rax
     cad:	48 01 c0             	add    %rax,%rax
     cb0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Iter!=0)
     cb4:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
     cb9:	75 c3                	jne    c7e <UVM_Print_Int+0x141>
        }
        Div/=10;
     cbb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     cbf:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
     cc6:	cc cc cc 
     cc9:	48 f7 e2             	mul    %rdx
     ccc:	48 89 d0             	mov    %rdx,%rax
     ccf:	48 c1 e8 03          	shr    $0x3,%rax
     cd3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        
        Iter=Int;
     cd7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     cdb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        Num=Count;
     cdf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     ce3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        
        while(Count>0)
     ce7:	eb 4c                	jmp    d35 <UVM_Print_Int+0x1f8>
        {
            Count--;
     ce9:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            UVM_Putchar(Iter/Div+'0');
     cee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     cf2:	ba 00 00 00 00       	mov    $0x0,%edx
     cf7:	48 f7 75 e0          	divq   -0x20(%rbp)
     cfb:	83 c0 30             	add    $0x30,%eax
     cfe:	0f be c0             	movsbl %al,%eax
     d01:	89 c7                	mov    %eax,%edi
     d03:	e8 63 0c 00 00       	call   196b <UVM_Putchar>
            Iter=Iter%Div;
     d08:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     d0c:	ba 00 00 00 00       	mov    $0x0,%edx
     d11:	48 f7 75 e0          	divq   -0x20(%rbp)
     d15:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
            Div/=10;
     d19:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     d1d:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
     d24:	cc cc cc 
     d27:	48 f7 e2             	mul    %rdx
     d2a:	48 89 d0             	mov    %rdx,%rax
     d2d:	48 c1 e8 03          	shr    $0x3,%rax
     d31:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Count>0)
     d35:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
     d3a:	7f ad                	jg     ce9 <UVM_Print_Int+0x1ac>
        }
    }
    
    return Num;
     d3c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
     d40:	c9                   	leave  
     d41:	c3                   	ret    

0000000000000d42 <UVM_Print_Uint>:
Input       : ptr_t Uint - The unsigned integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Uint(ptr_t Uint)
{
     d42:	f3 0f 1e fa          	endbr64 
     d46:	55                   	push   %rbp
     d47:	48 89 e5             	mov    %rsp,%rbp
     d4a:	48 83 ec 30          	sub    $0x30,%rsp
     d4e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    ptr_t Iter;
    cnt_t Count;
    cnt_t Num;
    
    /* how many digits are there? */
    if(Uint==0)
     d52:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
     d57:	75 14                	jne    d6d <UVM_Print_Uint+0x2b>
    {
        UVM_Putchar('0');
     d59:	bf 30 00 00 00       	mov    $0x30,%edi
     d5e:	e8 08 0c 00 00       	call   196b <UVM_Putchar>
        return 1;
     d63:	b8 01 00 00 00       	mov    $0x1,%eax
     d68:	e9 98 00 00 00       	jmp    e05 <UVM_Print_Uint+0xc3>
    }
    else
    {
        /* Filter out all the zeroes */
        Count=0;
     d6d:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
     d74:	00 
        Iter=Uint;
     d75:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     d79:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
     d7d:	eb 0a                	jmp    d89 <UVM_Print_Uint+0x47>
        {
            Iter<<=4;
     d7f:	48 c1 65 f8 04       	shlq   $0x4,-0x8(%rbp)
            Count++;
     d84:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
     d89:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     d8d:	48 c1 e8 3c          	shr    $0x3c,%rax
     d91:	48 85 c0             	test   %rax,%rax
     d94:	74 e9                	je     d7f <UVM_Print_Uint+0x3d>
        }
        /* Count is the number of pts to print */
        Count=sizeof(ptr_t)*2-Count;
     d96:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
     d9a:	b8 10 00 00 00       	mov    $0x10,%eax
     d9f:	48 29 d0             	sub    %rdx,%rax
     da2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        Num=Count;
     da6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     daa:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        while(Count>0)
     dae:	eb 4a                	jmp    dfa <UVM_Print_Uint+0xb8>
        {
            Count--;
     db0:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            Iter=(Uint>>(Count*4))&0x0F;
     db5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     db9:	c1 e0 02             	shl    $0x2,%eax
     dbc:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
     dc0:	89 c1                	mov    %eax,%ecx
     dc2:	48 d3 ea             	shr    %cl,%rdx
     dc5:	48 89 d0             	mov    %rdx,%rax
     dc8:	83 e0 0f             	and    $0xf,%eax
     dcb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            if(Iter<10)
     dcf:	48 83 7d f8 09       	cmpq   $0x9,-0x8(%rbp)
     dd4:	77 13                	ja     de9 <UVM_Print_Uint+0xa7>
                UVM_Putchar('0'+Iter);
     dd6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     dda:	83 c0 30             	add    $0x30,%eax
     ddd:	0f be c0             	movsbl %al,%eax
     de0:	89 c7                	mov    %eax,%edi
     de2:	e8 84 0b 00 00       	call   196b <UVM_Putchar>
     de7:	eb 11                	jmp    dfa <UVM_Print_Uint+0xb8>
            else
                UVM_Putchar('A'+Iter-10);
     de9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     ded:	83 c0 37             	add    $0x37,%eax
     df0:	0f be c0             	movsbl %al,%eax
     df3:	89 c7                	mov    %eax,%edi
     df5:	e8 71 0b 00 00       	call   196b <UVM_Putchar>
        while(Count>0)
     dfa:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
     dff:	7f af                	jg     db0 <UVM_Print_Uint+0x6e>
        }
    }
    
    return Num;
     e01:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
     e05:	c9                   	leave  
     e06:	c3                   	ret    

0000000000000e07 <UVM_Print_String>:
Input       : s8* String - The string to print.
Output      : None.
Return      : cnt_t - The length of the string printed, the '\0' is not included.
******************************************************************************/
cnt_t UVM_Print_String(s8* String)
{
     e07:	f3 0f 1e fa          	endbr64 
     e0b:	55                   	push   %rbp
     e0c:	48 89 e5             	mov    %rsp,%rbp
     e0f:	48 83 ec 20          	sub    $0x20,%rsp
     e13:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    cnt_t Count;
    
    Count=0;
     e17:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     e1e:	00 
    while(Count<UVM_USER_DEBUG_MAX_STR)
     e1f:	eb 35                	jmp    e56 <UVM_Print_String+0x4f>
    {
        if(String[Count]=='\0')
     e21:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     e25:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     e29:	48 01 d0             	add    %rdx,%rax
     e2c:	0f b6 00             	movzbl (%rax),%eax
     e2f:	84 c0                	test   %al,%al
     e31:	74 2c                	je     e5f <UVM_Print_String+0x58>
            break;
        
        UVM_Putchar(String[Count++]);
     e33:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     e37:	48 8d 50 01          	lea    0x1(%rax),%rdx
     e3b:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
     e3f:	48 89 c2             	mov    %rax,%rdx
     e42:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     e46:	48 01 d0             	add    %rdx,%rax
     e49:	0f b6 00             	movzbl (%rax),%eax
     e4c:	0f be c0             	movsbl %al,%eax
     e4f:	89 c7                	mov    %eax,%edi
     e51:	e8 15 0b 00 00       	call   196b <UVM_Putchar>
    while(Count<UVM_USER_DEBUG_MAX_STR)
     e56:	48 83 7d f8 7f       	cmpq   $0x7f,-0x8(%rbp)
     e5b:	7e c4                	jle    e21 <UVM_Print_String+0x1a>
     e5d:	eb 01                	jmp    e60 <UVM_Print_String+0x59>
            break;
     e5f:	90                   	nop
    }
    
    return Count;
     e60:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
     e64:	c9                   	leave  
     e65:	c3                   	ret    

0000000000000e66 <UVM_Captbl_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, 
                     cid_t Cap_Captbl, ptr_t Vaddr, ptr_t Entry_Num)
{
     e66:	f3 0f 1e fa          	endbr64 
     e6a:	55                   	push   %rbp
     e6b:	48 89 e5             	mov    %rsp,%rbp
     e6e:	48 83 ec 30          	sub    $0x30,%rsp
     e72:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     e76:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     e7a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
     e7e:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
     e82:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_CRT, Cap_Captbl_Crt,
     e86:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     e8a:	48 c1 e0 20          	shl    $0x20,%rax
     e8e:	48 89 c2             	mov    %rax,%rdx
     e91:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     e95:	89 c0                	mov    %eax,%eax
     e97:	48 89 d6             	mov    %rdx,%rsi
     e9a:	48 09 c6             	or     %rax,%rsi
     e9d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     ea1:	48 ba 00 00 00 00 0a 	movabs $0xa00000000,%rdx
     ea8:	00 00 00 
     eab:	48 09 d0             	or     %rdx,%rax
     eae:	48 89 c7             	mov    %rax,%rdi
     eb1:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
     eb5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     eb9:	48 89 d1             	mov    %rdx,%rcx
     ebc:	48 89 c2             	mov    %rax,%rdx
     ebf:	e8 29 f2 ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Captbl),
                      Vaddr,
                      Entry_Num);
}
     ec4:	c9                   	leave  
     ec5:	c3                   	ret    

0000000000000ec6 <UVM_Captbl_Del>:
              cid_t Cap_Del - The capability to the capability table to be deleted. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Del(cid_t Cap_Captbl_Del, cid_t Cap_Del)
{
     ec6:	f3 0f 1e fa          	endbr64 
     eca:	55                   	push   %rbp
     ecb:	48 89 e5             	mov    %rsp,%rbp
     ece:	48 83 ec 10          	sub    $0x10,%rsp
     ed2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     ed6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_DEL, Cap_Captbl_Del,
     eda:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     ede:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     ee2:	48 b9 00 00 00 00 0b 	movabs $0xb00000000,%rcx
     ee9:	00 00 00 
     eec:	48 09 ca             	or     %rcx,%rdx
     eef:	48 89 d7             	mov    %rdx,%rdi
     ef2:	b9 00 00 00 00       	mov    $0x0,%ecx
     ef7:	ba 00 00 00 00       	mov    $0x0,%edx
     efc:	48 89 c6             	mov    %rax,%rsi
     eff:	e8 e9 f1 ff ff       	call   ed <UVM_Svc>
                      Cap_Del,
                      0,
                      0);
}
     f04:	c9                   	leave  
     f05:	c3                   	ret    

0000000000000f06 <UVM_Captbl_Frz>:
              cid_t Cap_Frz - The cap to the kernel object being freezed. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Frz(cid_t Cap_Captbl_Frz, cid_t Cap_Frz)
{
     f06:	f3 0f 1e fa          	endbr64 
     f0a:	55                   	push   %rbp
     f0b:	48 89 e5             	mov    %rsp,%rbp
     f0e:	48 83 ec 10          	sub    $0x10,%rsp
     f12:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     f16:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
        return UVM_CAP_OP(RME_SVC_CPT_FRZ, Cap_Captbl_Frz,
     f1a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     f1e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     f22:	48 b9 00 00 00 00 0c 	movabs $0xc00000000,%rcx
     f29:	00 00 00 
     f2c:	48 09 ca             	or     %rcx,%rdx
     f2f:	48 89 d7             	mov    %rdx,%rdi
     f32:	b9 00 00 00 00       	mov    $0x0,%ecx
     f37:	ba 00 00 00 00       	mov    $0x0,%edx
     f3c:	48 89 c6             	mov    %rax,%rsi
     f3f:	e8 a9 f1 ff ff       	call   ed <UVM_Svc>
                          Cap_Frz,
                          0,
                          0);
}
     f44:	c9                   	leave  
     f45:	c3                   	ret    

0000000000000f46 <UVM_Captbl_Add>:
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Add(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                     cid_t Cap_Captbl_Src, cid_t Cap_Src, ptr_t Flags)
{
     f46:	f3 0f 1e fa          	endbr64 
     f4a:	55                   	push   %rbp
     f4b:	48 89 e5             	mov    %rsp,%rbp
     f4e:	48 83 ec 30          	sub    $0x30,%rsp
     f52:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     f56:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     f5a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
     f5e:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
     f62:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
     f66:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     f6a:	48 c1 e0 20          	shl    $0x20,%rax
     f6e:	48 89 c2             	mov    %rax,%rdx
     f71:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     f75:	89 c0                	mov    %eax,%eax
     f77:	48 09 c2             	or     %rax,%rdx
     f7a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     f7e:	48 c1 e0 20          	shl    $0x20,%rax
     f82:	48 89 c1             	mov    %rax,%rcx
     f85:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     f89:	89 c0                	mov    %eax,%eax
     f8b:	48 09 c1             	or     %rax,%rcx
     f8e:	48 89 ce             	mov    %rcx,%rsi
     f91:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     f95:	48 89 c1             	mov    %rax,%rcx
     f98:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
     f9f:	00 00 00 
     fa2:	48 89 c7             	mov    %rax,%rdi
     fa5:	e8 43 f1 ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),Flags);
}
     faa:	c9                   	leave  
     fab:	c3                   	ret    

0000000000000fac <UVM_Captbl_Pgtbl>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Pgtbl(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                       cid_t Cap_Captbl_Src, cid_t Cap_Src,
                       ptr_t Start, ptr_t End, ptr_t Flags)
{
     fac:	f3 0f 1e fa          	endbr64 
     fb0:	55                   	push   %rbp
     fb1:	48 89 e5             	mov    %rsp,%rbp
     fb4:	48 83 ec 30          	sub    $0x30,%rsp
     fb8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     fbc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     fc0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
     fc4:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
     fc8:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
     fcc:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
     fd0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
     fd4:	48 c1 e0 24          	shl    $0x24,%rax
     fd8:	48 89 c2             	mov    %rax,%rdx
     fdb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     fdf:	48 c1 e0 08          	shl    $0x8,%rax
     fe3:	48 09 d0             	or     %rdx,%rax
     fe6:	48 0b 45 10          	or     0x10(%rbp),%rax
     fea:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
     fee:	48 89 d1             	mov    %rdx,%rcx
     ff1:	48 c1 e1 20          	shl    $0x20,%rcx
     ff5:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
     ff9:	89 d2                	mov    %edx,%edx
     ffb:	48 09 ca             	or     %rcx,%rdx
     ffe:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    1002:	48 89 ce             	mov    %rcx,%rsi
    1005:	48 c1 e6 20          	shl    $0x20,%rsi
    1009:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    100d:	89 c9                	mov    %ecx,%ecx
    100f:	48 09 ce             	or     %rcx,%rsi
    1012:	48 89 c1             	mov    %rax,%rcx
    1015:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    101c:	00 00 00 
    101f:	48 89 c7             	mov    %rax,%rdi
    1022:	e8 c6 f0 ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_PGTBL_FLAG(End,Start,Flags));
}
    1027:	c9                   	leave  
    1028:	c3                   	ret    

0000000000001029 <UVM_Captbl_Kern>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kern(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End)
{
    1029:	f3 0f 1e fa          	endbr64 
    102d:	55                   	push   %rbp
    102e:	48 89 e5             	mov    %rsp,%rbp
    1031:	48 83 ec 30          	sub    $0x30,%rsp
    1035:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1039:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    103d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1041:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    1045:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    1049:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    104d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    1051:	48 c1 e0 20          	shl    $0x20,%rax
    1055:	48 0b 45 d8          	or     -0x28(%rbp),%rax
    1059:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    105d:	48 c1 e2 20          	shl    $0x20,%rdx
    1061:	48 89 d1             	mov    %rdx,%rcx
    1064:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    1068:	89 d2                	mov    %edx,%edx
    106a:	48 09 ca             	or     %rcx,%rdx
    106d:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    1071:	48 89 ce             	mov    %rcx,%rsi
    1074:	48 c1 e6 20          	shl    $0x20,%rsi
    1078:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    107c:	89 c9                	mov    %ecx,%ecx
    107e:	48 09 ce             	or     %rcx,%rsi
    1081:	48 89 c1             	mov    %rax,%rcx
    1084:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    108b:	00 00 00 
    108e:	48 89 c7             	mov    %rax,%rdi
    1091:	e8 57 f0 ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_KERN_FLAG(End,Start));
}
    1096:	c9                   	leave  
    1097:	c3                   	ret    

0000000000001098 <UVM_Captbl_Kmem>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kmem(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End, ptr_t Flags)
{
    1098:	f3 0f 1e fa          	endbr64 
    109c:	55                   	push   %rbp
    109d:	48 89 e5             	mov    %rsp,%rbp
    10a0:	48 83 ec 30          	sub    $0x30,%rsp
    10a4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    10a8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    10ac:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    10b0:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    10b4:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    10b8:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(UVM_KMEM_SVC(End,RME_SVC_CPT_ADD), UVM_KMEM_CAPID(Start,Flags),
    10bc:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
    10c3:	ff ff ff 
    10c6:	48 23 45 d0          	and    -0x30(%rbp),%rax
    10ca:	48 89 c2             	mov    %rax,%rdx
    10cd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    10d1:	48 c1 e8 20          	shr    $0x20,%rax
    10d5:	48 89 d1             	mov    %rdx,%rcx
    10d8:	48 09 c1             	or     %rax,%rcx
    10db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    10df:	48 c1 e0 20          	shl    $0x20,%rax
    10e3:	48 89 c2             	mov    %rax,%rdx
    10e6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    10ea:	89 c0                	mov    %eax,%eax
    10ec:	48 09 c2             	or     %rax,%rdx
    10ef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    10f3:	48 c1 e0 20          	shl    $0x20,%rax
    10f7:	48 89 c6             	mov    %rax,%rsi
    10fa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    10fe:	89 c0                	mov    %eax,%eax
    1100:	48 09 c6             	or     %rax,%rsi
    1103:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    1107:	48 c1 e8 06          	shr    $0x6,%rax
    110b:	48 c1 e0 26          	shl    $0x26,%rax
    110f:	48 89 c7             	mov    %rax,%rdi
    1112:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1116:	48 c1 e8 06          	shr    $0x6,%rax
    111a:	48 c1 e0 26          	shl    $0x26,%rax
    111e:	48 c1 e8 20          	shr    $0x20,%rax
    1122:	48 0b 45 10          	or     0x10(%rbp),%rax
    1126:	48 09 c7             	or     %rax,%rdi
    1129:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    1130:	00 00 00 
    1133:	48 09 f8             	or     %rdi,%rax
    1136:	48 89 c7             	mov    %rax,%rdi
    1139:	e8 af ef ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_KMEM_FLAG(End,Start));
}
    113e:	c9                   	leave  
    113f:	c3                   	ret    

0000000000001140 <UVM_Captbl_Rem>:
              cid_t Cap_Rem - The capability slot you want to remove. 1-Level.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Rem(cid_t Cap_Captbl_Rem, cid_t Cap_Rem)
{
    1140:	f3 0f 1e fa          	endbr64 
    1144:	55                   	push   %rbp
    1145:	48 89 e5             	mov    %rsp,%rbp
    1148:	48 83 ec 10          	sub    $0x10,%rsp
    114c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1150:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_REM, Cap_Captbl_Rem,
    1154:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1158:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    115c:	48 b9 00 00 00 00 0e 	movabs $0xe00000000,%rcx
    1163:	00 00 00 
    1166:	48 09 ca             	or     %rcx,%rdx
    1169:	48 89 d7             	mov    %rdx,%rdi
    116c:	b9 00 00 00 00       	mov    $0x0,%ecx
    1171:	ba 00 00 00 00       	mov    $0x0,%edx
    1176:	48 89 c6             	mov    %rax,%rsi
    1179:	e8 6f ef ff ff       	call   ed <UVM_Svc>
                      Cap_Rem,
                      0,
                      0);
}
    117e:	c9                   	leave  
    117f:	c3                   	ret    

0000000000001180 <UVM_Kern_Act>:
                      kernel function ever causes a context switch, it is responsible
                      for setting the return value. On failure, a context switch 
                      in the kernel fucntion is banned.
******************************************************************************/
ret_t UVM_Kern_Act(cid_t Cap_Kern, ptr_t Func_ID, ptr_t Sub_ID, ptr_t Param1, ptr_t Param2)
{
    1180:	f3 0f 1e fa          	endbr64 
    1184:	55                   	push   %rbp
    1185:	48 89 e5             	mov    %rsp,%rbp
    1188:	48 83 ec 30          	sub    $0x30,%rsp
    118c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1190:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1194:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1198:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    119c:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_KFN, Cap_Kern,
    11a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11a4:	48 c1 e0 20          	shl    $0x20,%rax
    11a8:	48 89 c2             	mov    %rax,%rdx
    11ab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    11af:	89 c0                	mov    %eax,%eax
    11b1:	48 89 d6             	mov    %rdx,%rsi
    11b4:	48 09 c6             	or     %rax,%rsi
    11b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11bb:	48 ba 00 00 00 00 04 	movabs $0x400000000,%rdx
    11c2:	00 00 00 
    11c5:	48 09 d0             	or     %rdx,%rax
    11c8:	48 89 c7             	mov    %rax,%rdi
    11cb:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    11cf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    11d3:	48 89 d1             	mov    %rdx,%rcx
    11d6:	48 89 c2             	mov    %rax,%rdx
    11d9:	e8 0f ef ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Sub_ID)|UVM_PARAM_D0(Func_ID),
                      Param1,
                      Param2);
}
    11de:	c9                   	leave  
    11df:	c3                   	ret    

00000000000011e0 <UVM_Pgtbl_Crt>:
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Pgtbl, 
                    ptr_t Vaddr, ptr_t Start_Addr, ptr_t Top_Flag,
                    ptr_t Size_Order, ptr_t Num_Order)
{
    11e0:	f3 0f 1e fa          	endbr64 
    11e4:	55                   	push   %rbp
    11e5:	48 89 e5             	mov    %rsp,%rbp
    11e8:	48 83 ec 30          	sub    $0x30,%rsp
    11ec:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    11f0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    11f4:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    11f8:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    11fc:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    1200:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    
    return UVM_CAP_OP(UVM_PGTBL_SVC(Num_Order,RME_SVC_PGT_CRT), Cap_Captbl,
    1204:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1208:	48 0b 45 d0          	or     -0x30(%rbp),%rax
    120c:	48 89 c2             	mov    %rax,%rdx
    120f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1213:	48 c1 e0 20          	shl    $0x20,%rax
    1217:	48 89 c1             	mov    %rax,%rcx
    121a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    121e:	48 c1 e0 10          	shl    $0x10,%rax
    1222:	89 c0                	mov    %eax,%eax
    1224:	48 09 c1             	or     %rax,%rcx
    1227:	48 8b 45 10          	mov    0x10(%rbp),%rax
    122b:	0f b7 c0             	movzwl %ax,%eax
    122e:	48 89 ce             	mov    %rcx,%rsi
    1231:	48 09 c6             	or     %rax,%rsi
    1234:	48 8b 45 18          	mov    0x18(%rbp),%rax
    1238:	48 c1 e0 10          	shl    $0x10,%rax
    123c:	48 c1 e0 20          	shl    $0x20,%rax
    1240:	48 89 c1             	mov    %rax,%rcx
    1243:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1247:	48 09 c1             	or     %rax,%rcx
    124a:	48 b8 00 00 00 00 0f 	movabs $0xf00000000,%rax
    1251:	00 00 00 
    1254:	48 89 cf             	mov    %rcx,%rdi
    1257:	48 09 c7             	or     %rax,%rdi
    125a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    125e:	48 89 d1             	mov    %rdx,%rcx
    1261:	48 89 c2             	mov    %rax,%rdx
    1264:	e8 84 ee ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_Q1(Cap_Pgtbl)|UVM_PARAM_Q0(Size_Order),
                      Vaddr, 
                      Start_Addr|Top_Flag);
}
    1269:	c9                   	leave  
    126a:	c3                   	ret    

000000000000126b <UVM_Pgtbl_Del>:
                                page table capability to be in. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Del(cid_t Cap_Captbl, cid_t Cap_Pgtbl)
{
    126b:	f3 0f 1e fa          	endbr64 
    126f:	55                   	push   %rbp
    1270:	48 89 e5             	mov    %rsp,%rbp
    1273:	48 83 ec 10          	sub    $0x10,%rsp
    1277:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    127b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_DEL, Cap_Captbl,
    127f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1283:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1287:	48 b9 00 00 00 00 10 	movabs $0x1000000000,%rcx
    128e:	00 00 00 
    1291:	48 09 ca             	or     %rcx,%rdx
    1294:	48 89 d7             	mov    %rdx,%rdi
    1297:	b9 00 00 00 00       	mov    $0x0,%ecx
    129c:	ba 00 00 00 00       	mov    $0x0,%edx
    12a1:	48 89 c6             	mov    %rax,%rsi
    12a4:	e8 44 ee ff ff       	call   ed <UVM_Svc>
                      Cap_Pgtbl,
                      0,
                      0);
}
    12a9:	c9                   	leave  
    12aa:	c3                   	ret    

00000000000012ab <UVM_Pgtbl_Add>:
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Add(cid_t Cap_Pgtbl_Dst, ptr_t Pos_Dst, ptr_t Flags_Dst,
                    cid_t Cap_Pgtbl_Src, ptr_t Pos_Src, ptr_t Index)
{
    12ab:	f3 0f 1e fa          	endbr64 
    12af:	55                   	push   %rbp
    12b0:	48 89 e5             	mov    %rsp,%rbp
    12b3:	48 83 ec 30          	sub    $0x30,%rsp
    12b7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    12bb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    12bf:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    12c3:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    12c7:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    12cb:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_ADD, Flags_Dst,
    12cf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    12d3:	48 c1 e0 20          	shl    $0x20,%rax
    12d7:	48 89 c2             	mov    %rax,%rdx
    12da:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    12de:	89 c0                	mov    %eax,%eax
    12e0:	48 89 d7             	mov    %rdx,%rdi
    12e3:	48 09 c7             	or     %rax,%rdi
    12e6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    12ea:	48 c1 e0 20          	shl    $0x20,%rax
    12ee:	48 89 c2             	mov    %rax,%rdx
    12f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    12f5:	89 c0                	mov    %eax,%eax
    12f7:	48 89 d6             	mov    %rdx,%rsi
    12fa:	48 09 c6             	or     %rax,%rsi
    12fd:	48 b8 00 00 00 00 11 	movabs $0x1100000000,%rax
    1304:	00 00 00 
    1307:	48 0b 45 e8          	or     -0x18(%rbp),%rax
    130b:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    130f:	48 89 d1             	mov    %rdx,%rcx
    1312:	48 89 fa             	mov    %rdi,%rdx
    1315:	48 89 c7             	mov    %rax,%rdi
    1318:	e8 d0 ed ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Pgtbl_Dst)|UVM_PARAM_D0(Pos_Dst),
                      UVM_PARAM_D1(Cap_Pgtbl_Src)|UVM_PARAM_D0(Pos_Src),
                      Index);
}
    131d:	c9                   	leave  
    131e:	c3                   	ret    

000000000000131f <UVM_Pgtbl_Rem>:
              ptr_t Pos - The virtual address position to unmap from.
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Rem(cid_t Cap_Pgtbl, ptr_t Pos)
{
    131f:	f3 0f 1e fa          	endbr64 
    1323:	55                   	push   %rbp
    1324:	48 89 e5             	mov    %rsp,%rbp
    1327:	48 83 ec 10          	sub    $0x10,%rsp
    132b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    132f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_REM, 0,
    1333:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1337:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    133b:	b9 00 00 00 00       	mov    $0x0,%ecx
    1340:	48 89 c6             	mov    %rax,%rsi
    1343:	48 b8 00 00 00 00 12 	movabs $0x1200000000,%rax
    134a:	00 00 00 
    134d:	48 89 c7             	mov    %rax,%rdi
    1350:	e8 98 ed ff ff       	call   ed <UVM_Svc>
                      Cap_Pgtbl,
                      Pos,
                      0);
}
    1355:	c9                   	leave  
    1356:	c3                   	ret    

0000000000001357 <UVM_Pgtbl_Con>:
              ptr_t Flags_Child - This have no effect on MPU-based architectures.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Con(cid_t Cap_Pgtbl_Parent, ptr_t Pos, cid_t Cap_Pgtbl_Child, ptr_t Flags_Child)
{
    1357:	f3 0f 1e fa          	endbr64 
    135b:	55                   	push   %rbp
    135c:	48 89 e5             	mov    %rsp,%rbp
    135f:	48 83 ec 20          	sub    $0x20,%rsp
    1363:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1367:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    136b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    136f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_CON, 0,
    1373:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1377:	48 c1 e0 20          	shl    $0x20,%rax
    137b:	48 89 c2             	mov    %rax,%rdx
    137e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1382:	89 c0                	mov    %eax,%eax
    1384:	48 89 d6             	mov    %rdx,%rsi
    1387:	48 09 c6             	or     %rax,%rsi
    138a:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    138e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1392:	48 89 d1             	mov    %rdx,%rcx
    1395:	48 89 c2             	mov    %rax,%rdx
    1398:	48 b8 00 00 00 00 13 	movabs $0x1300000000,%rax
    139f:	00 00 00 
    13a2:	48 89 c7             	mov    %rax,%rdi
    13a5:	e8 43 ed ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Pgtbl_Parent)|UVM_PARAM_D0(Cap_Pgtbl_Child),
                      Pos,
                      Flags_Child);
}
    13aa:	c9                   	leave  
    13ab:	c3                   	ret    

00000000000013ac <UVM_Pgtbl_Des>:
                          table from.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Des(cid_t Cap_Pgtbl, ptr_t Pos)
{
    13ac:	f3 0f 1e fa          	endbr64 
    13b0:	55                   	push   %rbp
    13b1:	48 89 e5             	mov    %rsp,%rbp
    13b4:	48 83 ec 10          	sub    $0x10,%rsp
    13b8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    13bc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_DES, 0,
    13c0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    13c4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    13c8:	b9 00 00 00 00       	mov    $0x0,%ecx
    13cd:	48 89 c6             	mov    %rax,%rsi
    13d0:	48 b8 00 00 00 00 14 	movabs $0x1400000000,%rax
    13d7:	00 00 00 
    13da:	48 89 c7             	mov    %rax,%rdi
    13dd:	e8 0b ed ff ff       	call   ed <UVM_Svc>
                      Cap_Pgtbl,
                      Pos,
                      0);
}
    13e2:	c9                   	leave  
    13e3:	c3                   	ret    

00000000000013e4 <UVM_Proc_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, cid_t Cap_Proc,
                   cid_t Cap_Captbl, cid_t Cap_Pgtbl, ptr_t Vaddr)
{
    13e4:	f3 0f 1e fa          	endbr64 
    13e8:	55                   	push   %rbp
    13e9:	48 89 e5             	mov    %rsp,%rbp
    13ec:	48 83 ec 30          	sub    $0x30,%rsp
    13f0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    13f4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    13f8:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    13fc:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    1400:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    1404:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_CRT, Cap_Captbl_Crt,
    1408:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    140c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    1410:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1414:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
    1418:	48 bf 00 00 00 00 15 	movabs $0x1500000000,%rdi
    141f:	00 00 00 
    1422:	48 09 f7             	or     %rsi,%rdi
    1425:	48 89 c6             	mov    %rax,%rsi
    1428:	e8 c0 ec ff ff       	call   ed <UVM_Svc>
                      Cap_Proc,
                      Cap_Captbl,
                      Cap_Pgtbl);
}
    142d:	c9                   	leave  
    142e:	c3                   	ret    

000000000000142f <UVM_Proc_Del>:
              cid_t Cap_Proc - The capability to the process. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Del(cid_t Cap_Captbl, cid_t Cap_Proc)
{
    142f:	f3 0f 1e fa          	endbr64 
    1433:	55                   	push   %rbp
    1434:	48 89 e5             	mov    %rsp,%rbp
    1437:	48 83 ec 10          	sub    $0x10,%rsp
    143b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    143f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_DEL, Cap_Captbl,
    1443:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1447:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    144b:	48 b9 00 00 00 00 16 	movabs $0x1600000000,%rcx
    1452:	00 00 00 
    1455:	48 09 ca             	or     %rcx,%rdx
    1458:	48 89 d7             	mov    %rdx,%rdi
    145b:	b9 00 00 00 00       	mov    $0x0,%ecx
    1460:	ba 00 00 00 00       	mov    $0x0,%edx
    1465:	48 89 c6             	mov    %rax,%rsi
    1468:	e8 80 ec ff ff       	call   ed <UVM_Svc>
                      Cap_Proc,
                      0,
                      0);
}
    146d:	c9                   	leave  
    146e:	c3                   	ret    

000000000000146f <UVM_Proc_Cpt>:
                                 this process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Cpt(cid_t Cap_Proc, cid_t Cap_Captbl)
{
    146f:	f3 0f 1e fa          	endbr64 
    1473:	55                   	push   %rbp
    1474:	48 89 e5             	mov    %rsp,%rbp
    1477:	48 83 ec 10          	sub    $0x10,%rsp
    147b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    147f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_CPT, 0,
    1483:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1487:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    148b:	b9 00 00 00 00       	mov    $0x0,%ecx
    1490:	48 89 c6             	mov    %rax,%rsi
    1493:	48 b8 00 00 00 00 17 	movabs $0x1700000000,%rax
    149a:	00 00 00 
    149d:	48 89 c7             	mov    %rax,%rdi
    14a0:	e8 48 ec ff ff       	call   ed <UVM_Svc>
                      Cap_Proc,
                      Cap_Captbl,
                      0);
}
    14a5:	c9                   	leave  
    14a6:	c3                   	ret    

00000000000014a7 <UVM_Proc_Pgt>:
                                process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Pgt(cid_t Cap_Proc, cid_t Cap_Pgtbl)
{
    14a7:	f3 0f 1e fa          	endbr64 
    14ab:	55                   	push   %rbp
    14ac:	48 89 e5             	mov    %rsp,%rbp
    14af:	48 83 ec 10          	sub    $0x10,%rsp
    14b3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    14b7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_PGT, 0,
    14bb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    14bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    14c3:	b9 00 00 00 00       	mov    $0x0,%ecx
    14c8:	48 89 c6             	mov    %rax,%rsi
    14cb:	48 b8 00 00 00 00 18 	movabs $0x1800000000,%rax
    14d2:	00 00 00 
    14d5:	48 89 c7             	mov    %rax,%rdi
    14d8:	e8 10 ec ff ff       	call   ed <UVM_Svc>
                      Cap_Proc,
                      Cap_Pgtbl,
                      0);
}
    14dd:	c9                   	leave  
    14de:	c3                   	ret    

00000000000014df <UVM_Thd_Crt>:
Output      : None.
Return      : ret_t - If successful, the Thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Thd,
                  cid_t Cap_Proc, ptr_t Max_Prio, ptr_t Vaddr)
{
    14df:	f3 0f 1e fa          	endbr64 
    14e3:	55                   	push   %rbp
    14e4:	48 89 e5             	mov    %rsp,%rbp
    14e7:	48 83 ec 30          	sub    $0x30,%rsp
    14eb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    14ef:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    14f3:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    14f7:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    14fb:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    14ff:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_CRT, Cap_Captbl, 
    1503:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1507:	48 c1 e0 20          	shl    $0x20,%rax
    150b:	48 89 c2             	mov    %rax,%rdx
    150e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1512:	89 c0                	mov    %eax,%eax
    1514:	48 09 c2             	or     %rax,%rdx
    1517:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    151b:	48 c1 e0 20          	shl    $0x20,%rax
    151f:	48 89 c1             	mov    %rax,%rcx
    1522:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1526:	89 c0                	mov    %eax,%eax
    1528:	48 89 ce             	mov    %rcx,%rsi
    152b:	48 09 c6             	or     %rax,%rsi
    152e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1532:	48 b9 00 00 00 00 19 	movabs $0x1900000000,%rcx
    1539:	00 00 00 
    153c:	48 09 c8             	or     %rcx,%rax
    153f:	48 89 c7             	mov    %rax,%rdi
    1542:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    1546:	48 89 c1             	mov    %rax,%rcx
    1549:	e8 9f eb ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Thd),
                      UVM_PARAM_D1(Cap_Proc)|UVM_PARAM_D0(Max_Prio),
                      Vaddr);
}
    154e:	c9                   	leave  
    154f:	c3                   	ret    

0000000000001550 <UVM_Thd_Del>:
              cid_t Cap_Thd - The capability to the thread in the captbl. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Del(cid_t Cap_Captbl, cid_t Cap_Thd)
{
    1550:	f3 0f 1e fa          	endbr64 
    1554:	55                   	push   %rbp
    1555:	48 89 e5             	mov    %rsp,%rbp
    1558:	48 83 ec 10          	sub    $0x10,%rsp
    155c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1560:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_DEL, Cap_Captbl,
    1564:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1568:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    156c:	48 b9 00 00 00 00 1a 	movabs $0x1a00000000,%rcx
    1573:	00 00 00 
    1576:	48 09 ca             	or     %rcx,%rdx
    1579:	48 89 d7             	mov    %rdx,%rdi
    157c:	b9 00 00 00 00       	mov    $0x0,%ecx
    1581:	ba 00 00 00 00       	mov    $0x0,%edx
    1586:	48 89 c6             	mov    %rax,%rsi
    1589:	e8 5f eb ff ff       	call   ed <UVM_Svc>
                      Cap_Thd,
                      0,
                      0);
}
    158e:	c9                   	leave  
    158f:	c3                   	ret    

0000000000001590 <UVM_Thd_Exec_Set>:
              ptr_t Param - The parameter of the thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Exec_Set(cid_t Cap_Thd, ptr_t Entry, ptr_t Stack, ptr_t Param)
{
    1590:	f3 0f 1e fa          	endbr64 
    1594:	55                   	push   %rbp
    1595:	48 89 e5             	mov    %rsp,%rbp
    1598:	48 83 ec 20          	sub    $0x20,%rsp
    159c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    15a0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    15a4:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    15a8:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, Cap_Thd,
    15ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    15b0:	48 ba 00 00 00 00 06 	movabs $0x600000000,%rdx
    15b7:	00 00 00 
    15ba:	48 09 d0             	or     %rdx,%rax
    15bd:	48 89 c7             	mov    %rax,%rdi
    15c0:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    15c4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    15c8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    15cc:	48 89 c6             	mov    %rax,%rsi
    15cf:	e8 19 eb ff ff       	call   ed <UVM_Svc>
                      Entry, 
                      Stack,
                      Param);
}
    15d4:	c9                   	leave  
    15d5:	c3                   	ret    

00000000000015d6 <UVM_Thd_Hyp_Set>:
                            thread's register sets.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Hyp_Set(cid_t Cap_Thd, ptr_t Kaddr)
{
    15d6:	f3 0f 1e fa          	endbr64 
    15da:	55                   	push   %rbp
    15db:	48 89 e5             	mov    %rsp,%rbp
    15de:	48 83 ec 10          	sub    $0x10,%rsp
    15e2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    15e6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, 0,
    15ea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    15ee:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    15f2:	b9 00 00 00 00       	mov    $0x0,%ecx
    15f7:	48 89 c6             	mov    %rax,%rsi
    15fa:	48 b8 00 00 00 00 06 	movabs $0x600000000,%rax
    1601:	00 00 00 
    1604:	48 89 c7             	mov    %rax,%rdi
    1607:	e8 e1 ea ff ff       	call   ed <UVM_Svc>
                      Cap_Thd,
                      Kaddr,
                      0);
}
    160c:	c9                   	leave  
    160d:	c3                   	ret    

000000000000160e <UVM_Thd_Sched_Bind>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Bind(cid_t Cap_Thd, cid_t Cap_Thd_Sched, cid_t Cap_Sig, tid_t TID, ptr_t Prio)
{
    160e:	f3 0f 1e fa          	endbr64 
    1612:	55                   	push   %rbp
    1613:	48 89 e5             	mov    %rsp,%rbp
    1616:	48 83 ec 30          	sub    $0x30,%rsp
    161a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    161e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1622:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1626:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    162a:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_BIND, Cap_Thd,
    162e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1632:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1636:	48 89 d1             	mov    %rdx,%rcx
    1639:	48 c1 e1 20          	shl    $0x20,%rcx
    163d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1641:	89 d2                	mov    %edx,%edx
    1643:	48 89 ce             	mov    %rcx,%rsi
    1646:	48 09 d6             	or     %rdx,%rsi
    1649:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    164d:	48 b9 00 00 00 00 1b 	movabs $0x1b00000000,%rcx
    1654:	00 00 00 
    1657:	48 89 d7             	mov    %rdx,%rdi
    165a:	48 09 cf             	or     %rcx,%rdi
    165d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    1661:	48 89 d1             	mov    %rdx,%rcx
    1664:	48 89 c2             	mov    %rax,%rdx
    1667:	e8 81 ea ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Thd_Sched)|UVM_PARAM_D0(Cap_Sig),
                      TID, 
                      Prio);
}
    166c:	c9                   	leave  
    166d:	c3                   	ret    

000000000000166e <UVM_Thd_Sched_Rcv>:
                              is simply not allowed. 2-Level.
Output      : None.
Return      : ret_t - If successful, the thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Rcv(cid_t Cap_Thd)
{
    166e:	f3 0f 1e fa          	endbr64 
    1672:	55                   	push   %rbp
    1673:	48 89 e5             	mov    %rsp,%rbp
    1676:	48 83 ec 10          	sub    $0x10,%rsp
    167a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_RCV, 0,
    167e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1682:	b9 00 00 00 00       	mov    $0x0,%ecx
    1687:	ba 00 00 00 00       	mov    $0x0,%edx
    168c:	48 89 c6             	mov    %rax,%rsi
    168f:	48 b8 00 00 00 00 1c 	movabs $0x1c00000000,%rax
    1696:	00 00 00 
    1699:	48 89 c7             	mov    %rax,%rdi
    169c:	e8 4c ea ff ff       	call   ed <UVM_Svc>
                      Cap_Thd,
                      0, 
                      0);
}
    16a1:	c9                   	leave  
    16a2:	c3                   	ret    

00000000000016a3 <UVM_Thd_Sched_Prio>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Prio(cid_t Cap_Thd, ptr_t Prio)
{
    16a3:	f3 0f 1e fa          	endbr64 
    16a7:	55                   	push   %rbp
    16a8:	48 89 e5             	mov    %rsp,%rbp
    16ab:	48 83 ec 10          	sub    $0x10,%rsp
    16af:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    16b3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_PRIO, 0,
    16b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    16bb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    16bf:	b9 00 00 00 00       	mov    $0x0,%ecx
    16c4:	48 89 c6             	mov    %rax,%rsi
    16c7:	48 b8 00 00 00 00 07 	movabs $0x700000000,%rax
    16ce:	00 00 00 
    16d1:	48 89 c7             	mov    %rax,%rdi
    16d4:	e8 14 ea ff ff       	call   ed <UVM_Svc>
                      Cap_Thd,
                      Prio, 
                      0);
}
    16d9:	c9                   	leave  
    16da:	c3                   	ret    

00000000000016db <UVM_Thd_Sched_Free>:
Input       : cid_t Cap_Thd - The capability to the thread. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Free(cid_t Cap_Thd)
{
    16db:	f3 0f 1e fa          	endbr64 
    16df:	55                   	push   %rbp
    16e0:	48 89 e5             	mov    %rsp,%rbp
    16e3:	48 83 ec 10          	sub    $0x10,%rsp
    16e7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_FREE, 0,
    16eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    16ef:	b9 00 00 00 00       	mov    $0x0,%ecx
    16f4:	ba 00 00 00 00       	mov    $0x0,%edx
    16f9:	48 89 c6             	mov    %rax,%rsi
    16fc:	48 b8 00 00 00 00 05 	movabs $0x500000000,%rax
    1703:	00 00 00 
    1706:	48 89 c7             	mov    %rax,%rdi
    1709:	e8 df e9 ff ff       	call   ed <UVM_Svc>
                      Cap_Thd,
                      0, 
                      0);
}
    170e:	c9                   	leave  
    170f:	c3                   	ret    

0000000000001710 <UVM_Thd_Time_Xfer>:
                           order of 100us or 1ms.
Output      : None.
Return      : ret_t - If successful, the destination time amount; or an error code.
******************************************************************************/
ret_t UVM_Thd_Time_Xfer(cid_t Cap_Thd_Dst, cid_t Cap_Thd_Src, ptr_t Time)
{
    1710:	f3 0f 1e fa          	endbr64 
    1714:	55                   	push   %rbp
    1715:	48 89 e5             	mov    %rsp,%rbp
    1718:	48 83 ec 20          	sub    $0x20,%rsp
    171c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1720:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1724:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_TIME_XFER, 0,
    1728:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    172c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1730:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1734:	48 89 c6             	mov    %rax,%rsi
    1737:	48 b8 00 00 00 00 08 	movabs $0x800000000,%rax
    173e:	00 00 00 
    1741:	48 89 c7             	mov    %rax,%rdi
    1744:	e8 a4 e9 ff ff       	call   ed <UVM_Svc>
                      Cap_Thd_Dst,
                      Cap_Thd_Src, 
                      Time);
}
    1749:	c9                   	leave  
    174a:	c3                   	ret    

000000000000174b <UVM_Thd_Swt>:
                                 this thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Swt(cid_t Cap_Thd, ptr_t Full_Yield)
{
    174b:	f3 0f 1e fa          	endbr64 
    174f:	55                   	push   %rbp
    1750:	48 89 e5             	mov    %rsp,%rbp
    1753:	48 83 ec 10          	sub    $0x10,%rsp
    1757:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    175b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SWT, 0,
    175f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1763:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1767:	b9 00 00 00 00       	mov    $0x0,%ecx
    176c:	48 89 c6             	mov    %rax,%rsi
    176f:	48 b8 00 00 00 00 09 	movabs $0x900000000,%rax
    1776:	00 00 00 
    1779:	48 89 c7             	mov    %rax,%rdi
    177c:	e8 6c e9 ff ff       	call   ed <UVM_Svc>
                      Cap_Thd,
                      Full_Yield, 
                      0);
}
    1781:	c9                   	leave  
    1782:	c3                   	ret    

0000000000001783 <UVM_Sig_Crt>:
                            within the kernel virtual address.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Sig, ptr_t Vaddr)
{
    1783:	f3 0f 1e fa          	endbr64 
    1787:	55                   	push   %rbp
    1788:	48 89 e5             	mov    %rsp,%rbp
    178b:	48 83 ec 20          	sub    $0x20,%rsp
    178f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1793:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1797:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    179b:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_CRT, Cap_Captbl,
    179f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    17a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    17a7:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    17ab:	48 be 00 00 00 00 1d 	movabs $0x1d00000000,%rsi
    17b2:	00 00 00 
    17b5:	48 89 cf             	mov    %rcx,%rdi
    17b8:	48 09 f7             	or     %rsi,%rdi
    17bb:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    17bf:	48 89 c6             	mov    %rax,%rsi
    17c2:	e8 26 e9 ff ff       	call   ed <UVM_Svc>
                      Cap_Sig,
                      Cap_Kmem,
                      Vaddr);
}
    17c7:	c9                   	leave  
    17c8:	c3                   	ret    

00000000000017c9 <UVM_Sig_Del>:
              cid_t Cap_Sig - The capability to the signal. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Del(cid_t Cap_Captbl, cid_t Cap_Sig)
{
    17c9:	f3 0f 1e fa          	endbr64 
    17cd:	55                   	push   %rbp
    17ce:	48 89 e5             	mov    %rsp,%rbp
    17d1:	48 83 ec 10          	sub    $0x10,%rsp
    17d5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    17d9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_DEL, Cap_Captbl,
    17dd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    17e1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    17e5:	48 b9 00 00 00 00 1e 	movabs $0x1e00000000,%rcx
    17ec:	00 00 00 
    17ef:	48 09 ca             	or     %rcx,%rdx
    17f2:	48 89 d7             	mov    %rdx,%rdi
    17f5:	b9 00 00 00 00       	mov    $0x0,%ecx
    17fa:	ba 00 00 00 00       	mov    $0x0,%edx
    17ff:	48 89 c6             	mov    %rax,%rsi
    1802:	e8 e6 e8 ff ff       	call   ed <UVM_Svc>
                      Cap_Sig,
                      0, 
                      0);
}
    1807:	c9                   	leave  
    1808:	c3                   	ret    

0000000000001809 <UVM_Sig_Snd>:
Input       : cid_t Cap_Sig - The capability to the signal. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0, or an error code.
******************************************************************************/
ret_t UVM_Sig_Snd(cid_t Cap_Sig)
{
    1809:	f3 0f 1e fa          	endbr64 
    180d:	55                   	push   %rbp
    180e:	48 89 e5             	mov    %rsp,%rbp
    1811:	48 83 ec 10          	sub    $0x10,%rsp
    1815:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_SND, 0,
    1819:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    181d:	b9 00 00 00 00       	mov    $0x0,%ecx
    1822:	ba 00 00 00 00       	mov    $0x0,%edx
    1827:	48 89 c6             	mov    %rax,%rsi
    182a:	48 b8 00 00 00 00 02 	movabs $0x200000000,%rax
    1831:	00 00 00 
    1834:	48 89 c7             	mov    %rax,%rdi
    1837:	e8 b1 e8 ff ff       	call   ed <UVM_Svc>
                      Cap_Sig,
                      0, 
                      0);
}
    183c:	c9                   	leave  
    183d:	c3                   	ret    

000000000000183e <UVM_Sig_Rcv>:
Output      : None.
Return      : ret_t - If successful, a non-negative number containing the number of signals
                      received will be returned; else an error code.
******************************************************************************/
ret_t UVM_Sig_Rcv(cid_t Cap_Sig, ptr_t Option)
{
    183e:	f3 0f 1e fa          	endbr64 
    1842:	55                   	push   %rbp
    1843:	48 89 e5             	mov    %rsp,%rbp
    1846:	48 83 ec 10          	sub    $0x10,%rsp
    184a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    184e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_RCV, 0,
    1852:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1856:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    185a:	b9 00 00 00 00       	mov    $0x0,%ecx
    185f:	48 89 c6             	mov    %rax,%rsi
    1862:	48 b8 00 00 00 00 03 	movabs $0x300000000,%rax
    1869:	00 00 00 
    186c:	48 89 c7             	mov    %rax,%rdi
    186f:	e8 79 e8 ff ff       	call   ed <UVM_Svc>
                      Cap_Sig,
                      Option, 
                      0);
}
    1874:	c9                   	leave  
    1875:	c3                   	ret    

0000000000001876 <UVM_Inv_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, 
                  cid_t Cap_Inv, cid_t Cap_Proc, ptr_t Vaddr)
{
    1876:	f3 0f 1e fa          	endbr64 
    187a:	55                   	push   %rbp
    187b:	48 89 e5             	mov    %rsp,%rbp
    187e:	48 83 ec 30          	sub    $0x30,%rsp
    1882:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1886:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    188a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    188e:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    1892:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_CRT, Cap_Captbl,
    1896:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    189a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    189e:	48 89 d1             	mov    %rdx,%rcx
    18a1:	48 c1 e1 20          	shl    $0x20,%rcx
    18a5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    18a9:	89 d2                	mov    %edx,%edx
    18ab:	48 89 ce             	mov    %rcx,%rsi
    18ae:	48 09 d6             	or     %rdx,%rsi
    18b1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    18b5:	48 b9 00 00 00 00 1f 	movabs $0x1f00000000,%rcx
    18bc:	00 00 00 
    18bf:	48 89 d7             	mov    %rdx,%rdi
    18c2:	48 09 cf             	or     %rcx,%rdi
    18c5:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    18c9:	48 89 d1             	mov    %rdx,%rcx
    18cc:	48 89 c2             	mov    %rax,%rdx
    18cf:	e8 19 e8 ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Inv),
                      Cap_Proc, 
                      Vaddr);
}
    18d4:	c9                   	leave  
    18d5:	c3                   	ret    

00000000000018d6 <UVM_Inv_Del>:
              cid_t Cap_Inv - The capability to the invocation stub. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Del(cid_t Cap_Captbl, cid_t Cap_Inv)
{
    18d6:	f3 0f 1e fa          	endbr64 
    18da:	55                   	push   %rbp
    18db:	48 89 e5             	mov    %rsp,%rbp
    18de:	48 83 ec 10          	sub    $0x10,%rsp
    18e2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    18e6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_DEL, Cap_Captbl,
    18ea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    18ee:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    18f2:	48 b9 00 00 00 00 20 	movabs $0x2000000000,%rcx
    18f9:	00 00 00 
    18fc:	48 09 ca             	or     %rcx,%rdx
    18ff:	48 89 d7             	mov    %rdx,%rdi
    1902:	b9 00 00 00 00       	mov    $0x0,%ecx
    1907:	ba 00 00 00 00       	mov    $0x0,%edx
    190c:	48 89 c6             	mov    %rax,%rsi
    190f:	e8 d9 e7 ff ff       	call   ed <UVM_Svc>
                      Cap_Inv,
                      0, 
                      0);
}
    1914:	c9                   	leave  
    1915:	c3                   	ret    

0000000000001916 <UVM_Inv_Set>:
                                     immediately, or we wait for fault handling?
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Set(cid_t Cap_Inv, ptr_t Entry, ptr_t Stack, ptr_t Fault_Ret_Flag)
{
    1916:	f3 0f 1e fa          	endbr64 
    191a:	55                   	push   %rbp
    191b:	48 89 e5             	mov    %rsp,%rbp
    191e:	48 83 ec 20          	sub    $0x20,%rsp
    1922:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1926:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    192a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    192e:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_SET, 0,
    1932:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1936:	48 c1 e0 20          	shl    $0x20,%rax
    193a:	48 89 c2             	mov    %rax,%rdx
    193d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1941:	89 c0                	mov    %eax,%eax
    1943:	48 89 d6             	mov    %rdx,%rsi
    1946:	48 09 c6             	or     %rax,%rsi
    1949:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    194d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1951:	48 89 d1             	mov    %rdx,%rcx
    1954:	48 89 c2             	mov    %rax,%rdx
    1957:	48 b8 00 00 00 00 21 	movabs $0x2100000000,%rax
    195e:	00 00 00 
    1961:	48 89 c7             	mov    %rax,%rdi
    1964:	e8 84 e7 ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Fault_Ret_Flag)|UVM_PARAM_D0(Cap_Inv),
                      Entry, 
                      Stack);
}
    1969:	c9                   	leave  
    196a:	c3                   	ret    

000000000000196b <UVM_Putchar>:
Input       : char Char - The character to print.
Output      : None.
Return      : ptr_t - Always 0.
******************************************************************************/
ptr_t UVM_Putchar(char Char)
{
    196b:	f3 0f 1e fa          	endbr64 
    196f:	55                   	push   %rbp
    1970:	48 89 e5             	mov    %rsp,%rbp
    1973:	48 83 ec 10          	sub    $0x10,%rsp
    1977:	89 f8                	mov    %edi,%eax
    1979:	88 45 fc             	mov    %al,-0x4(%rbp)
    /* Wait until we have transmitted */
    while((__UVM_X64_In(UVM_X64_COM1+5)&0x20)==0);
    197c:	90                   	nop
    197d:	bf fd 03 00 00       	mov    $0x3fd,%edi
    1982:	e8 7e e6 ff ff       	call   5 <__UVM_X64_In>
    1987:	83 e0 20             	and    $0x20,%eax
    198a:	48 85 c0             	test   %rax,%rax
    198d:	74 ee                	je     197d <UVM_Putchar+0x12>

    __UVM_X64_Out(UVM_X64_COM1, Char);
    198f:	48 0f be 45 fc       	movsbq -0x4(%rbp),%rax
    1994:	48 89 c6             	mov    %rax,%rsi
    1997:	bf f8 03 00 00       	mov    $0x3f8,%edi
    199c:	e8 6e e6 ff ff       	call   f <__UVM_X64_Out>

    return 0;
    19a1:	b8 00 00 00 00       	mov    $0x0,%eax
}
    19a6:	c9                   	leave  
    19a7:	c3                   	ret    

00000000000019a8 <_UVM_Stack_Init>:
Output      : None.
Return      : ptr_t - The actual stack address to use for system call.
******************************************************************************/
ptr_t _UVM_Stack_Init(ptr_t Stack, ptr_t Size, ptr_t Stub, ptr_t Entry,
                      ptr_t Param1, ptr_t Param2, ptr_t Param3, ptr_t Param4)
{
    19a8:	f3 0f 1e fa          	endbr64 
    19ac:	55                   	push   %rbp
    19ad:	48 89 e5             	mov    %rsp,%rbp
    19b0:	48 83 ec 40          	sub    $0x40,%rsp
    19b4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    19b8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    19bc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    19c0:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    19c4:	4c 89 45 c8          	mov    %r8,-0x38(%rbp)
    19c8:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
	ptr_t* Stack_Ptr;

    Stack_Ptr=(ptr_t*)(Stack+Size-UVM_STACK_SAFE_SIZE*sizeof(ptr_t));
    19cc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    19d0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    19d4:	48 01 d0             	add    %rdx,%rax
    19d7:	48 2d 00 01 00 00    	sub    $0x100,%rax
    19dd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    Stack_Ptr[0]=Param1;
    19e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    19e5:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    19e9:	48 89 10             	mov    %rdx,(%rax)
    Stack_Ptr[1]=Param2;
    19ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    19f0:	48 8d 50 08          	lea    0x8(%rax),%rdx
    19f4:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    19f8:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[2]=Param3;
    19fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    19ff:	48 8d 50 10          	lea    0x10(%rax),%rdx
    1a03:	48 8b 45 10          	mov    0x10(%rbp),%rax
    1a07:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[3]=Param4;
    1a0a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1a0e:	48 8d 50 18          	lea    0x18(%rax),%rdx
    1a12:	48 8b 45 18          	mov    0x18(%rbp),%rax
    1a16:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[4]=Entry;
    1a19:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1a1d:	48 8d 50 20          	lea    0x20(%rax),%rdx
    1a21:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    1a25:	48 89 02             	mov    %rax,(%rdx)

    return (ptr_t)Stack_Ptr;
    1a28:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
    1a2c:	c9                   	leave  
    1a2d:	c3                   	ret    

0000000000001a2e <_UVM_Idle>:
Input       : None.
Output      : None.
Return      : None.
******************************************************************************/
void _UVM_Idle(void)
{
    1a2e:	f3 0f 1e fa          	endbr64 
    1a32:	55                   	push   %rbp
    1a33:	48 89 e5             	mov    %rsp,%rbp
    /* Do nothing. In the future we may call a kernel function to put us to sleep */
}
    1a36:	90                   	nop
    1a37:	5d                   	pop    %rbp
    1a38:	c3                   	ret    

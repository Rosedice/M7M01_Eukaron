
./Object/UVM:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <_UVM_Entry>:
              space very well.
Input       : None.
Output      : None.
*****************************************************************************/
_UVM_Entry:
    JMP                 main
       0:	e9 8b 05 00 00       	jmp    590 <main>

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
     107:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
     10e:	00 00 

0000000000000110 <TEST_THD_FUNC2>:
    UVM_Thd_Swt(UVM_CAPID(UVM_BOOT_TBL_THD,0),0);
}

/*This function is for tread switching test*/
void TEST_THD_FUNC2(void)
{
     110:	f3 0f 1e fa          	endbr64 
     114:	50                   	push   %rax
     115:	58                   	pop    %rax
     116:	48 83 ec 08          	sub    $0x8,%rsp
     11a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    while(1)
    {
        UVM_Thd_Swt(UVM_CAPID(TEST_THD_TBL,TEST_THD1),0);
     120:	31 f6                	xor    %esi,%esi
     122:	bf 00 80 09 00       	mov    $0x98000,%edi
     127:	e8 e4 1c 00 00       	call   1e10 <UVM_Thd_Swt>
    while(1)
     12c:	eb f2                	jmp    120 <TEST_THD_FUNC2+0x10>
     12e:	66 90                	xchg   %ax,%ax

0000000000000130 <TEST_THD_FUNC4>:
    UVM_Thd_Swt(UVM_CAPID(UVM_BOOT_TBL_THD,0),0);
}

/*This function is for cross-process tread switching test*/
void TEST_THD_FUNC4(void)
{
     130:	f3 0f 1e fa          	endbr64 
     134:	50                   	push   %rax
     135:	58                   	pop    %rax
     136:	48 83 ec 08          	sub    $0x8,%rsp
     13a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    while(1)
    {
        UVM_Thd_Swt(UVM_CAPID(TEST_THD_TBL,TEST_THD3),0);
     140:	31 f6                	xor    %esi,%esi
     142:	bf 02 80 09 00       	mov    $0x98002,%edi
     147:	e8 c4 1c 00 00       	call   1e10 <UVM_Thd_Swt>
    while(1)
     14c:	eb f2                	jmp    140 <TEST_THD_FUNC4+0x10>
     14e:	66 90                	xchg   %ax,%ax

0000000000000150 <TEST_THD_FUNC1>:
{
     150:	f3 0f 1e fa          	endbr64 
    sum=0;
     154:	48 c7 05 b1 2e 00 00 	movq   $0x0,0x2eb1(%rip)        # 3010 <sum>
     15b:	00 00 00 00 
{
     15f:	53                   	push   %rbx
    sum=0;
     160:	bb 10 27 00 00       	mov    $0x2710,%ebx
     165:	0f 1f 00             	nopl   (%rax)
        start=__UVM_X64_Read_TSC();
     168:	e8 ae fe ff ff       	call   1b <__UVM_X64_Read_TSC>
        UVM_Thd_Swt(UVM_CAPID(TEST_THD_TBL,TEST_THD2),0);
     16d:	31 f6                	xor    %esi,%esi
     16f:	bf 01 80 09 00       	mov    $0x98001,%edi
        start=__UVM_X64_Read_TSC();
     174:	48 89 05 ad 2e 00 00 	mov    %rax,0x2ead(%rip)        # 3028 <start>
        UVM_Thd_Swt(UVM_CAPID(TEST_THD_TBL,TEST_THD2),0);
     17b:	e8 90 1c 00 00       	call   1e10 <UVM_Thd_Swt>
        end=__UVM_X64_Read_TSC();
     180:	e8 96 fe ff ff       	call   1b <__UVM_X64_Read_TSC>
     185:	48 89 05 8c 2e 00 00 	mov    %rax,0x2e8c(%rip)        # 3018 <end>
        sum+=end-start;
     18c:	48 8b 05 85 2e 00 00 	mov    0x2e85(%rip),%rax        # 3018 <end>
     193:	48 8b 15 8e 2e 00 00 	mov    0x2e8e(%rip),%rdx        # 3028 <start>
     19a:	48 29 d0             	sub    %rdx,%rax
     19d:	48 01 05 6c 2e 00 00 	add    %rax,0x2e6c(%rip)        # 3010 <sum>
    for(Cnt=0;Cnt<10000;Cnt++)
     1a4:	48 83 eb 01          	sub    $0x1,%rbx
     1a8:	75 be                	jne    168 <TEST_THD_FUNC1+0x18>
    UVM_LOG_S("\r\nThread Switching takes clock cycles:");
     1aa:	bf c8 1f 00 00       	mov    $0x1fc8,%edi
     1af:	e8 5c 17 00 00       	call   1910 <UVM_Print_String>
    UVM_LOG_I(sum/10000);
     1b4:	48 ba 4b 59 86 38 d6 	movabs $0x346dc5d63886594b,%rdx
     1bb:	c5 6d 34 
     1be:	48 89 d0             	mov    %rdx,%rax
     1c1:	48 f7 25 48 2e 00 00 	mulq   0x2e48(%rip)        # 3010 <sum>
     1c8:	48 89 d7             	mov    %rdx,%rdi
     1cb:	48 c1 ef 0b          	shr    $0xb,%rdi
     1cf:	e8 0c 15 00 00       	call   16e0 <UVM_Print_Int>
    UVM_Thd_Swt(UVM_CAPID(UVM_BOOT_TBL_THD,0),0);
     1d4:	31 f6                	xor    %esi,%esi
     1d6:	bf 00 80 03 00       	mov    $0x38000,%edi
}
     1db:	5b                   	pop    %rbx
    UVM_Thd_Swt(UVM_CAPID(UVM_BOOT_TBL_THD,0),0);
     1dc:	e9 2f 1c 00 00       	jmp    1e10 <UVM_Thd_Swt>
     1e1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
     1e8:	00 00 00 00 
     1ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000001f0 <TEST_THD_FUNC3>:
{
     1f0:	f3 0f 1e fa          	endbr64 
    sum=0;
     1f4:	48 c7 05 11 2e 00 00 	movq   $0x0,0x2e11(%rip)        # 3010 <sum>
     1fb:	00 00 00 00 
{
     1ff:	53                   	push   %rbx
    sum=0;
     200:	bb 10 27 00 00       	mov    $0x2710,%ebx
     205:	0f 1f 00             	nopl   (%rax)
        start=__UVM_X64_Read_TSC();
     208:	e8 0e fe ff ff       	call   1b <__UVM_X64_Read_TSC>
        UVM_Thd_Swt(UVM_CAPID(TEST_THD_TBL,TEST_THD4),0);
     20d:	31 f6                	xor    %esi,%esi
     20f:	bf 03 80 09 00       	mov    $0x98003,%edi
        start=__UVM_X64_Read_TSC();
     214:	48 89 05 0d 2e 00 00 	mov    %rax,0x2e0d(%rip)        # 3028 <start>
        UVM_Thd_Swt(UVM_CAPID(TEST_THD_TBL,TEST_THD4),0);
     21b:	e8 f0 1b 00 00       	call   1e10 <UVM_Thd_Swt>
        end=__UVM_X64_Read_TSC();
     220:	e8 f6 fd ff ff       	call   1b <__UVM_X64_Read_TSC>
     225:	48 89 05 ec 2d 00 00 	mov    %rax,0x2dec(%rip)        # 3018 <end>
        sum+=end-start;
     22c:	48 8b 05 e5 2d 00 00 	mov    0x2de5(%rip),%rax        # 3018 <end>
     233:	48 8b 15 ee 2d 00 00 	mov    0x2dee(%rip),%rdx        # 3028 <start>
     23a:	48 29 d0             	sub    %rdx,%rax
     23d:	48 01 05 cc 2d 00 00 	add    %rax,0x2dcc(%rip)        # 3010 <sum>
    for(Cnt=0;Cnt<10000;Cnt++)
     244:	48 83 eb 01          	sub    $0x1,%rbx
     248:	75 be                	jne    208 <TEST_THD_FUNC3+0x18>
    UVM_LOG_S("\r\nCross-process thread Switching takes clock cycles:");
     24a:	bf f0 1f 00 00       	mov    $0x1ff0,%edi
     24f:	e8 bc 16 00 00       	call   1910 <UVM_Print_String>
    UVM_LOG_I(sum/10000);
     254:	48 ba 4b 59 86 38 d6 	movabs $0x346dc5d63886594b,%rdx
     25b:	c5 6d 34 
     25e:	48 89 d0             	mov    %rdx,%rax
     261:	48 f7 25 a8 2d 00 00 	mulq   0x2da8(%rip)        # 3010 <sum>
     268:	48 89 d7             	mov    %rdx,%rdi
     26b:	48 c1 ef 0b          	shr    $0xb,%rdi
     26f:	e8 6c 14 00 00       	call   16e0 <UVM_Print_Int>
    UVM_Thd_Swt(UVM_CAPID(UVM_BOOT_TBL_THD,0),0);
     274:	31 f6                	xor    %esi,%esi
     276:	bf 00 80 03 00       	mov    $0x38000,%edi
}
     27b:	5b                   	pop    %rbx
    UVM_Thd_Swt(UVM_CAPID(UVM_BOOT_TBL_THD,0),0);
     27c:	e9 8f 1b 00 00       	jmp    1e10 <UVM_Thd_Swt>
     281:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
     288:	00 00 00 00 
     28c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000290 <TEST_SIG_FUNC1>:
    }
}

/*This function is for signal sending-receiving test*/
void TEST_SIG_FUNC1(void)
{
     290:	f3 0f 1e fa          	endbr64 
     294:	53                   	push   %rbx
    cnt_t Cnt;
    sum=0;
     295:	bb 10 27 00 00       	mov    $0x2710,%ebx
     29a:	48 c7 05 6b 2d 00 00 	movq   $0x0,0x2d6b(%rip)        # 3010 <sum>
     2a1:	00 00 00 00 
    for(Cnt=0;Cnt<10000;Cnt++)
     2a5:	eb 33                	jmp    2da <TEST_SIG_FUNC1+0x4a>
     2a7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
     2ae:	00 00 
    {
        start=__UVM_X64_Read_TSC();
        UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG1,RME_RCV_BS));
        end=__UVM_X64_Read_TSC();
     2b0:	e8 66 fd ff ff       	call   1b <__UVM_X64_Read_TSC>
     2b5:	48 89 05 5c 2d 00 00 	mov    %rax,0x2d5c(%rip)        # 3018 <end>
        sum+=end-start;
     2bc:	48 8b 05 55 2d 00 00 	mov    0x2d55(%rip),%rax        # 3018 <end>
     2c3:	48 8b 15 5e 2d 00 00 	mov    0x2d5e(%rip),%rdx        # 3028 <start>
     2ca:	48 29 d0             	sub    %rdx,%rax
     2cd:	48 01 05 3c 2d 00 00 	add    %rax,0x2d3c(%rip)        # 3010 <sum>
    for(Cnt=0;Cnt<10000;Cnt++)
     2d4:	48 83 eb 01          	sub    $0x1,%rbx
     2d8:	74 7e                	je     358 <TEST_SIG_FUNC1+0xc8>
        start=__UVM_X64_Read_TSC();
     2da:	e8 3c fd ff ff       	call   1b <__UVM_X64_Read_TSC>
        UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG1,RME_RCV_BS));
     2df:	31 f6                	xor    %esi,%esi
     2e1:	bf 0b 00 00 00       	mov    $0xb,%edi
        start=__UVM_X64_Read_TSC();
     2e6:	48 89 05 3b 2d 00 00 	mov    %rax,0x2d3b(%rip)        # 3028 <start>
        UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG1,RME_RCV_BS));
     2ed:	e8 9e 1b 00 00       	call   1e90 <UVM_Sig_Rcv>
     2f2:	48 85 c0             	test   %rax,%rax
     2f5:	75 b9                	jne    2b0 <TEST_SIG_FUNC1+0x20>
     2f7:	bf 28 20 00 00       	mov    $0x2028,%edi
     2fc:	e8 0f 16 00 00       	call   1910 <UVM_Print_String>
     301:	bf 50 22 00 00       	mov    $0x2250,%edi
     306:	e8 05 16 00 00       	call   1910 <UVM_Print_String>
     30b:	bf 5c 22 00 00       	mov    $0x225c,%edi
     310:	e8 fb 15 00 00       	call   1910 <UVM_Print_String>
     315:	bf 9b 00 00 00       	mov    $0x9b,%edi
     31a:	e8 c1 13 00 00       	call   16e0 <UVM_Print_Int>
     31f:	bf 64 22 00 00       	mov    $0x2264,%edi
     324:	e8 e7 15 00 00       	call   1910 <UVM_Print_String>
     329:	bf 67 22 00 00       	mov    $0x2267,%edi
     32e:	e8 dd 15 00 00       	call   1910 <UVM_Print_String>
     333:	bf 73 22 00 00       	mov    $0x2273,%edi
     338:	e8 d3 15 00 00       	call   1910 <UVM_Print_String>
     33d:	bf 76 22 00 00       	mov    $0x2276,%edi
     342:	e8 c9 15 00 00       	call   1910 <UVM_Print_String>
     347:	bf 64 22 00 00       	mov    $0x2264,%edi
     34c:	e8 bf 15 00 00       	call   1910 <UVM_Print_String>
     351:	eb fe                	jmp    351 <TEST_SIG_FUNC1+0xc1>
     353:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    }
    UVM_LOG_S("\r\nSignal sending-receiving takes clock cycles:");
     358:	bf 60 20 00 00       	mov    $0x2060,%edi
     35d:	e8 ae 15 00 00       	call   1910 <UVM_Print_String>
    UVM_LOG_I(sum/10000);
     362:	48 ba 4b 59 86 38 d6 	movabs $0x346dc5d63886594b,%rdx
     369:	c5 6d 34 
     36c:	48 89 d0             	mov    %rdx,%rax
     36f:	48 f7 25 9a 2c 00 00 	mulq   0x2c9a(%rip)        # 3010 <sum>
     376:	48 89 d7             	mov    %rdx,%rdi
     379:	48 c1 ef 0b          	shr    $0xb,%rdi
     37d:	e8 5e 13 00 00       	call   16e0 <UVM_Print_Int>
    UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG1,RME_RCV_BS));
     382:	31 f6                	xor    %esi,%esi
     384:	bf 0b 00 00 00       	mov    $0xb,%edi
     389:	e8 02 1b 00 00       	call   1e90 <UVM_Sig_Rcv>
     38e:	48 85 c0             	test   %rax,%rax
     391:	74 02                	je     395 <TEST_SIG_FUNC1+0x105>
}
     393:	5b                   	pop    %rbx
     394:	c3                   	ret    
    UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG1,RME_RCV_BS));
     395:	bf 28 20 00 00       	mov    $0x2028,%edi
     39a:	e8 71 15 00 00       	call   1910 <UVM_Print_String>
     39f:	bf 50 22 00 00       	mov    $0x2250,%edi
     3a4:	e8 67 15 00 00       	call   1910 <UVM_Print_String>
     3a9:	bf 5c 22 00 00       	mov    $0x225c,%edi
     3ae:	e8 5d 15 00 00       	call   1910 <UVM_Print_String>
     3b3:	bf a1 00 00 00       	mov    $0xa1,%edi
     3b8:	e8 23 13 00 00       	call   16e0 <UVM_Print_Int>
     3bd:	bf 64 22 00 00       	mov    $0x2264,%edi
     3c2:	e8 49 15 00 00       	call   1910 <UVM_Print_String>
     3c7:	bf 67 22 00 00       	mov    $0x2267,%edi
     3cc:	e8 3f 15 00 00       	call   1910 <UVM_Print_String>
     3d1:	bf 73 22 00 00       	mov    $0x2273,%edi
     3d6:	e8 35 15 00 00       	call   1910 <UVM_Print_String>
     3db:	bf 76 22 00 00       	mov    $0x2276,%edi
     3e0:	e8 2b 15 00 00       	call   1910 <UVM_Print_String>
     3e5:	bf 64 22 00 00       	mov    $0x2264,%edi
     3ea:	e8 21 15 00 00       	call   1910 <UVM_Print_String>
     3ef:	eb fe                	jmp    3ef <TEST_SIG_FUNC1+0x15f>
     3f1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
     3f8:	00 00 00 00 
     3fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000400 <TEST_SIG_FUNC2>:

/*This function is for Cross-process signal sending-receiving test*/
void TEST_SIG_FUNC2(void)
{
     400:	f3 0f 1e fa          	endbr64 
     404:	53                   	push   %rbx
    cnt_t Cnt;
    sum=0;
     405:	bb 10 27 00 00       	mov    $0x2710,%ebx
     40a:	48 c7 05 fb 2b 00 00 	movq   $0x0,0x2bfb(%rip)        # 3010 <sum>
     411:	00 00 00 00 
    for(Cnt=0;Cnt<10000;Cnt++)
     415:	eb 33                	jmp    44a <TEST_SIG_FUNC2+0x4a>
     417:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
     41e:	00 00 
    {
        start=__UVM_X64_Read_TSC();
        UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG2,RME_RCV_BS));
        end=__UVM_X64_Read_TSC();
     420:	e8 f6 fb ff ff       	call   1b <__UVM_X64_Read_TSC>
     425:	48 89 05 ec 2b 00 00 	mov    %rax,0x2bec(%rip)        # 3018 <end>
        sum+=end-start;
     42c:	48 8b 05 e5 2b 00 00 	mov    0x2be5(%rip),%rax        # 3018 <end>
     433:	48 8b 15 ee 2b 00 00 	mov    0x2bee(%rip),%rdx        # 3028 <start>
     43a:	48 29 d0             	sub    %rdx,%rax
     43d:	48 01 05 cc 2b 00 00 	add    %rax,0x2bcc(%rip)        # 3010 <sum>
    for(Cnt=0;Cnt<10000;Cnt++)
     444:	48 83 eb 01          	sub    $0x1,%rbx
     448:	74 7e                	je     4c8 <TEST_SIG_FUNC2+0xc8>
        start=__UVM_X64_Read_TSC();
     44a:	e8 cc fb ff ff       	call   1b <__UVM_X64_Read_TSC>
        UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG2,RME_RCV_BS));
     44f:	31 f6                	xor    %esi,%esi
     451:	bf 0c 00 00 00       	mov    $0xc,%edi
        start=__UVM_X64_Read_TSC();
     456:	48 89 05 cb 2b 00 00 	mov    %rax,0x2bcb(%rip)        # 3028 <start>
        UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG2,RME_RCV_BS));
     45d:	e8 2e 1a 00 00       	call   1e90 <UVM_Sig_Rcv>
     462:	48 85 c0             	test   %rax,%rax
     465:	75 b9                	jne    420 <TEST_SIG_FUNC2+0x20>
     467:	bf 28 20 00 00       	mov    $0x2028,%edi
     46c:	e8 9f 14 00 00       	call   1910 <UVM_Print_String>
     471:	bf 50 22 00 00       	mov    $0x2250,%edi
     476:	e8 95 14 00 00       	call   1910 <UVM_Print_String>
     47b:	bf 5c 22 00 00       	mov    $0x225c,%edi
     480:	e8 8b 14 00 00       	call   1910 <UVM_Print_String>
     485:	bf ac 00 00 00       	mov    $0xac,%edi
     48a:	e8 51 12 00 00       	call   16e0 <UVM_Print_Int>
     48f:	bf 64 22 00 00       	mov    $0x2264,%edi
     494:	e8 77 14 00 00       	call   1910 <UVM_Print_String>
     499:	bf 67 22 00 00       	mov    $0x2267,%edi
     49e:	e8 6d 14 00 00       	call   1910 <UVM_Print_String>
     4a3:	bf 73 22 00 00       	mov    $0x2273,%edi
     4a8:	e8 63 14 00 00       	call   1910 <UVM_Print_String>
     4ad:	bf 76 22 00 00       	mov    $0x2276,%edi
     4b2:	e8 59 14 00 00       	call   1910 <UVM_Print_String>
     4b7:	bf 64 22 00 00       	mov    $0x2264,%edi
     4bc:	e8 4f 14 00 00       	call   1910 <UVM_Print_String>
     4c1:	eb fe                	jmp    4c1 <TEST_SIG_FUNC2+0xc1>
     4c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    }
    UVM_LOG_S("\r\nCross-process signal sending-receiving takes clock cycles:");
     4c8:	bf 90 20 00 00       	mov    $0x2090,%edi
     4cd:	e8 3e 14 00 00       	call   1910 <UVM_Print_String>
    UVM_LOG_I(sum/10000);
     4d2:	48 ba 4b 59 86 38 d6 	movabs $0x346dc5d63886594b,%rdx
     4d9:	c5 6d 34 
     4dc:	48 89 d0             	mov    %rdx,%rax
     4df:	48 f7 25 2a 2b 00 00 	mulq   0x2b2a(%rip)        # 3010 <sum>
     4e6:	48 89 d7             	mov    %rdx,%rdi
     4e9:	48 c1 ef 0b          	shr    $0xb,%rdi
     4ed:	e8 ee 11 00 00       	call   16e0 <UVM_Print_Int>
    UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG2,RME_RCV_BS));
     4f2:	31 f6                	xor    %esi,%esi
     4f4:	bf 0c 00 00 00       	mov    $0xc,%edi
     4f9:	e8 92 19 00 00       	call   1e90 <UVM_Sig_Rcv>
     4fe:	48 85 c0             	test   %rax,%rax
     501:	74 02                	je     505 <TEST_SIG_FUNC2+0x105>
}
     503:	5b                   	pop    %rbx
     504:	c3                   	ret    
    UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG2,RME_RCV_BS));
     505:	bf 28 20 00 00       	mov    $0x2028,%edi
     50a:	e8 01 14 00 00       	call   1910 <UVM_Print_String>
     50f:	bf 50 22 00 00       	mov    $0x2250,%edi
     514:	e8 f7 13 00 00       	call   1910 <UVM_Print_String>
     519:	bf 5c 22 00 00       	mov    $0x225c,%edi
     51e:	e8 ed 13 00 00       	call   1910 <UVM_Print_String>
     523:	bf b2 00 00 00       	mov    $0xb2,%edi
     528:	e8 b3 11 00 00       	call   16e0 <UVM_Print_Int>
     52d:	bf 64 22 00 00       	mov    $0x2264,%edi
     532:	e8 d9 13 00 00       	call   1910 <UVM_Print_String>
     537:	bf 67 22 00 00       	mov    $0x2267,%edi
     53c:	e8 cf 13 00 00       	call   1910 <UVM_Print_String>
     541:	bf 73 22 00 00       	mov    $0x2273,%edi
     546:	e8 c5 13 00 00       	call   1910 <UVM_Print_String>
     54b:	bf 76 22 00 00       	mov    $0x2276,%edi
     550:	e8 bb 13 00 00       	call   1910 <UVM_Print_String>
     555:	bf 64 22 00 00       	mov    $0x2264,%edi
     55a:	e8 b1 13 00 00       	call   1910 <UVM_Print_String>
     55f:	eb fe                	jmp    55f <TEST_SIG_FUNC2+0x15f>
     561:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
     568:	00 00 00 00 
     56c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000570 <TEST_INV1_FUNC>:

void TEST_INV1_FUNC(ptr_t param)
{
     570:	f3 0f 1e fa          	endbr64 
     574:	55                   	push   %rbp
     575:	48 89 fd             	mov    %rdi,%rbp
    middle=__UVM_X64_Read_TSC();
     578:	e8 9e fa ff ff       	call   1b <__UVM_X64_Read_TSC>
    UVM_Inv_Ret(param);
     57d:	48 89 ef             	mov    %rbp,%rdi
}
     580:	5d                   	pop    %rbp
    middle=__UVM_X64_Read_TSC();
     581:	48 89 05 98 2a 00 00 	mov    %rax,0x2a98(%rip)        # 3020 <middle>
    UVM_Inv_Ret(param);
     588:	e9 57 fb ff ff       	jmp    e4 <UVM_Inv_Ret>
     58d:	0f 1f 00             	nopl   (%rax)

0000000000000590 <main>:
Input       : None.
Output      : None.
Return      : int - This function shall never return.
******************************************************************************/
int main(ptr_t CPUID)
{
     590:	f3 0f 1e fa          	endbr64 
     594:	55                   	push   %rbp
     595:	53                   	push   %rbx
     596:	48 89 fb             	mov    %rdi,%rbx
    ptr_t Cur_Addr;
    cnt_t Count;
    UVM_LOG_S("........Booting RME system........");
     599:	bf d0 20 00 00       	mov    $0x20d0,%edi
{
     59e:	48 83 ec 08          	sub    $0x8,%rsp
    UVM_LOG_S("........Booting RME system........");
     5a2:	e8 69 13 00 00       	call   1910 <UVM_Print_String>
    UVM_LOG_S("\r\nEnter user mode success!Welcome to RME system!");
     5a7:	bf f8 20 00 00       	mov    $0x20f8,%edi
     5ac:	e8 5f 13 00 00       	call   1910 <UVM_Print_String>
    UVM_LOG_S("\r\nNow we are running init thread on cpu:");
     5b1:	bf 30 21 00 00       	mov    $0x2130,%edi
     5b6:	e8 55 13 00 00       	call   1910 <UVM_Print_String>
    UVM_LOG_I(CPUID);
     5bb:	48 89 df             	mov    %rbx,%rdi
     5be:	e8 1d 11 00 00       	call   16e0 <UVM_Print_Int>
    if(CPUID==0) 
     5c3:	48 85 db             	test   %rbx,%rbx
     5c6:	0f 85 b7 06 00 00    	jne    c83 <main+0x6f3>
    {
        /*Empty test begins here*/
        sum=0;
     5cc:	48 c7 05 39 2a 00 00 	movq   $0x0,0x2a39(%rip)        # 3010 <sum>
     5d3:	00 00 00 00 
     5d7:	bb 10 27 00 00       	mov    $0x2710,%ebx
     5dc:	0f 1f 40 00          	nopl   0x0(%rax)
        for(Count=0;Count<10000;Count++)
        {
            start=__UVM_X64_Read_TSC();
     5e0:	e8 36 fa ff ff       	call   1b <__UVM_X64_Read_TSC>
     5e5:	48 89 05 3c 2a 00 00 	mov    %rax,0x2a3c(%rip)        # 3028 <start>
            end=__UVM_X64_Read_TSC();
     5ec:	e8 2a fa ff ff       	call   1b <__UVM_X64_Read_TSC>
     5f1:	48 89 05 20 2a 00 00 	mov    %rax,0x2a20(%rip)        # 3018 <end>
            sum+=end-start;
     5f8:	48 8b 05 19 2a 00 00 	mov    0x2a19(%rip),%rax        # 3018 <end>
     5ff:	48 8b 15 22 2a 00 00 	mov    0x2a22(%rip),%rdx        # 3028 <start>
     606:	48 29 d0             	sub    %rdx,%rax
     609:	48 01 05 00 2a 00 00 	add    %rax,0x2a00(%rip)        # 3010 <sum>
        for(Count=0;Count<10000;Count++)
     610:	48 83 eb 01          	sub    $0x1,%rbx
     614:	75 ca                	jne    5e0 <main+0x50>
        }
        UVM_LOG_S("\r\nEmpty test takes clock cycles:");
     616:	bf 60 21 00 00       	mov    $0x2160,%edi
        UVM_LOG_I(sum/10000);
        /*Empty test ends here*/

        /*Empty system call test begins here*/
        sum=0;
     61b:	bb 10 27 00 00       	mov    $0x2710,%ebx
        UVM_LOG_S("\r\nEmpty test takes clock cycles:");
     620:	e8 eb 12 00 00       	call   1910 <UVM_Print_String>
        UVM_LOG_I(sum/10000);
     625:	48 8b 05 e4 29 00 00 	mov    0x29e4(%rip),%rax        # 3010 <sum>
     62c:	b9 10 27 00 00       	mov    $0x2710,%ecx
     631:	31 d2                	xor    %edx,%edx
     633:	48 f7 f1             	div    %rcx
     636:	48 89 c7             	mov    %rax,%rdi
     639:	e8 a2 10 00 00       	call   16e0 <UVM_Print_Int>
        sum=0;
     63e:	48 c7 05 c7 29 00 00 	movq   $0x0,0x29c7(%rip)        # 3010 <sum>
     645:	00 00 00 00 
        for(Count=0;Count<10000;Count++)
     649:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
        {
            start=__UVM_X64_Read_TSC();
     650:	e8 c6 f9 ff ff       	call   1b <__UVM_X64_Read_TSC>
            UVM_Svc(-1,-1,-1,-1);
     655:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
     65c:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
     663:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
     66a:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
            start=__UVM_X64_Read_TSC();
     671:	48 89 05 b0 29 00 00 	mov    %rax,0x29b0(%rip)        # 3028 <start>
            UVM_Svc(-1,-1,-1,-1);
     678:	e8 70 fa ff ff       	call   ed <UVM_Svc>
            end=__UVM_X64_Read_TSC();
     67d:	e8 99 f9 ff ff       	call   1b <__UVM_X64_Read_TSC>
     682:	48 89 05 8f 29 00 00 	mov    %rax,0x298f(%rip)        # 3018 <end>
            sum+=end-start;
     689:	48 8b 05 88 29 00 00 	mov    0x2988(%rip),%rax        # 3018 <end>
     690:	48 8b 15 91 29 00 00 	mov    0x2991(%rip),%rdx        # 3028 <start>
     697:	48 29 d0             	sub    %rdx,%rax
     69a:	48 01 05 6f 29 00 00 	add    %rax,0x296f(%rip)        # 3010 <sum>
        for(Count=0;Count<10000;Count++)
     6a1:	48 83 eb 01          	sub    $0x1,%rbx
     6a5:	75 a9                	jne    650 <main+0xc0>
        }
        UVM_LOG_S("\r\nEmpty system call takes clock cycles:");
     6a7:	bf 88 21 00 00       	mov    $0x2188,%edi
     6ac:	e8 5f 12 00 00       	call   1910 <UVM_Print_String>
        UVM_LOG_I(sum/10000);
     6b1:	48 8b 05 58 29 00 00 	mov    0x2958(%rip),%rax        # 3010 <sum>
     6b8:	b9 10 27 00 00       	mov    $0x2710,%ecx
     6bd:	31 d2                	xor    %edx,%edx
     6bf:	48 f7 f1             	div    %rcx
     6c2:	48 89 c7             	mov    %rax,%rdi
     6c5:	e8 16 10 00 00       	call   16e0 <UVM_Print_Int>
        /*Now we begin to create UVM kernel objects*/
        Cur_Addr=UVM_OBJ_BASE;
        
        /*Thread switching test begins here, We place the thread stack at 12MB */
        /*Create test thread capability table*/
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD_TBL,Cur_Addr,16)>=0);
     6ca:	31 ff                	xor    %edi,%edi
     6cc:	41 b8 10 00 00 00    	mov    $0x10,%r8d
     6d2:	b9 00 00 a0 0e       	mov    $0xea00000,%ecx
     6d7:	ba 09 00 00 00       	mov    $0x9,%edx
     6dc:	be 00 80 05 00       	mov    $0x58000,%esi
     6e1:	e8 6a 12 00 00       	call   1950 <UVM_Captbl_Crt>
     6e6:	48 85 c0             	test   %rax,%rax
     6e9:	0f 88 9a 05 00 00    	js     c89 <main+0x6f9>
        Cur_Addr+=UVM_CAPTBL_SIZE(16);
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD1, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
     6ef:	31 d2                	xor    %edx,%edx
     6f1:	41 b9 00 04 a0 0e    	mov    $0xea00400,%r9d
     6f7:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
     6fd:	b9 02 00 00 00       	mov    $0x2,%ecx
     702:	be 00 80 05 00       	mov    $0x58000,%esi
     707:	bf 09 00 00 00       	mov    $0x9,%edi
     70c:	e8 af 15 00 00       	call   1cc0 <UVM_Thd_Crt>
     711:	48 85 c0             	test   %rax,%rax
     714:	0f 88 cb 05 00 00    	js     ce5 <main+0x755>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD1),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
     71a:	45 31 c0             	xor    %r8d,%r8d
     71d:	31 c9                	xor    %ecx,%ecx
     71f:	ba 00 00 00 80       	mov    $0x80000000,%edx
     724:	be 00 80 03 00       	mov    $0x38000,%esi
     729:	bf 00 80 09 00       	mov    $0x98000,%edi
     72e:	e8 2d 16 00 00       	call   1d60 <UVM_Thd_Sched_Bind>
     733:	48 85 c0             	test   %rax,%rax
     736:	0f 88 05 06 00 00    	js     d41 <main+0x7b1>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD1),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     73c:	be 00 80 03 00       	mov    $0x38000,%esi
     741:	bf 00 80 09 00       	mov    $0x98000,%edi
    Word_Inc=(ptr_t*)Addr;
     746:	bb 00 00 c0 00       	mov    $0xc00000,%ebx
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD1),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     74b:	48 ba fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rdx
     752:	ff ff 7f 
     755:	e8 96 16 00 00       	call   1df0 <UVM_Thd_Time_Xfer>
     75a:	48 85 c0             	test   %rax,%rax
     75d:	0f 88 96 06 00 00    	js     df9 <main+0x869>
        *Word_Inc=0;
     763:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
        Word_Inc++;
     76a:	48 83 c3 08          	add    $0x8,%rbx
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
     76e:	48 81 fb 00 00 d0 00 	cmp    $0xd00000,%rbx
     775:	75 ec                	jne    763 <main+0x1d3>
        UVM_Clear((void*)(12*UVM_POW2(RME_PGT_SIZE_1M)), UVM_POW2(RME_PGT_SIZE_1M));
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD1),(ptr_t)TEST_THD_FUNC1,12*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     777:	31 c9                	xor    %ecx,%ecx
     779:	ba 00 00 c0 00       	mov    $0xc00000,%edx
     77e:	be 50 01 00 00       	mov    $0x150,%esi
     783:	bf 00 80 09 00       	mov    $0x98000,%edi
     788:	e8 93 15 00 00       	call   1d20 <UVM_Thd_Exec_Set>
     78d:	48 85 c0             	test   %rax,%rax
     790:	0f 88 07 06 00 00    	js     d9d <main+0x80d>
        Cur_Addr+=UVM_THD_SIZE;
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD2, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
     796:	41 b9 d0 0d a0 0e    	mov    $0xea00dd0,%r9d
     79c:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
     7a2:	b9 02 00 00 00       	mov    $0x2,%ecx
     7a7:	ba 01 00 00 00       	mov    $0x1,%edx
     7ac:	be 00 80 05 00       	mov    $0x58000,%esi
     7b1:	bf 09 00 00 00       	mov    $0x9,%edi
     7b6:	e8 05 15 00 00       	call   1cc0 <UVM_Thd_Crt>
     7bb:	48 85 c0             	test   %rax,%rax
     7be:	0f 88 91 06 00 00    	js     e55 <main+0x8c5>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD2),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
     7c4:	45 31 c0             	xor    %r8d,%r8d
     7c7:	31 c9                	xor    %ecx,%ecx
     7c9:	ba 00 00 00 80       	mov    $0x80000000,%edx
     7ce:	be 00 80 03 00       	mov    $0x38000,%esi
     7d3:	bf 01 80 09 00       	mov    $0x98001,%edi
     7d8:	e8 83 15 00 00       	call   1d60 <UVM_Thd_Sched_Bind>
     7dd:	48 85 c0             	test   %rax,%rax
     7e0:	0f 88 cb 06 00 00    	js     eb1 <main+0x921>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD2),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     7e6:	48 ba fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rdx
     7ed:	ff ff 7f 
     7f0:	be 00 80 03 00       	mov    $0x38000,%esi
     7f5:	bf 01 80 09 00       	mov    $0x98001,%edi
     7fa:	e8 f1 15 00 00       	call   1df0 <UVM_Thd_Time_Xfer>
     7ff:	48 85 c0             	test   %rax,%rax
     802:	0f 88 61 07 00 00    	js     f69 <main+0x9d9>
        *Word_Inc=0;
     808:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
        Word_Inc++;
     80f:	48 83 c3 08          	add    $0x8,%rbx
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
     813:	48 81 fb 00 00 e0 00 	cmp    $0xe00000,%rbx
     81a:	75 ec                	jne    808 <main+0x278>
        UVM_Clear((void*)(13*UVM_POW2(RME_PGT_SIZE_1M)), UVM_POW2(RME_PGT_SIZE_1M));
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD2),(ptr_t)TEST_THD_FUNC2,13*UVM_POW2(RME_PGT_SIZE_1M),1)>=0);
     81c:	b9 01 00 00 00       	mov    $0x1,%ecx
     821:	ba 00 00 d0 00       	mov    $0xd00000,%edx
     826:	be 10 01 00 00       	mov    $0x110,%esi
     82b:	bf 01 80 09 00       	mov    $0x98001,%edi
     830:	e8 eb 14 00 00       	call   1d20 <UVM_Thd_Exec_Set>
     835:	48 85 c0             	test   %rax,%rax
     838:	0f 88 cf 06 00 00    	js     f0d <main+0x97d>
        Cur_Addr+=UVM_THD_SIZE;
        UVM_LOG_S("\r\nSwtching thread...");
     83e:	bf 7f 22 00 00       	mov    $0x227f,%edi
     843:	e8 c8 10 00 00       	call   1910 <UVM_Print_String>
        UVM_Thd_Swt(UVM_CAPID(TEST_THD_TBL,TEST_THD1),0);
     848:	31 f6                	xor    %esi,%esi
     84a:	bf 00 80 09 00       	mov    $0x98000,%edi
     84f:	e8 bc 15 00 00       	call   1e10 <UVM_Thd_Swt>
        UVM_LOG_S("\r\nBack to main thread!");
     854:	bf 94 22 00 00       	mov    $0x2294,%edi
     859:	e8 b2 10 00 00       	call   1910 <UVM_Print_String>
        /*Thread switching test ends here*/
        
        /*Signal Sending-receiving test begins here*/
        /*create endpoint first*/
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG1, Cur_Addr)>=0);
     85e:	b9 a0 17 a0 0e       	mov    $0xea017a0,%ecx
     863:	ba 0b 00 00 00       	mov    $0xb,%edx
     868:	31 ff                	xor    %edi,%edi
     86a:	be 00 80 05 00       	mov    $0x58000,%esi
     86f:	e8 bc 15 00 00       	call   1e30 <UVM_Sig_Crt>
     874:	49 89 c0             	mov    %rax,%r8
    Word_Inc=(ptr_t*)Addr;
     877:	b8 00 00 c0 00       	mov    $0xc00000,%eax
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG1, Cur_Addr)>=0);
     87c:	4d 85 c0             	test   %r8,%r8
     87f:	0f 88 40 07 00 00    	js     fc5 <main+0xa35>
        *Word_Inc=0;
     885:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
        Word_Inc++;
     88c:	48 83 c0 08          	add    $0x8,%rax
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
     890:	48 3d 00 00 d0 00    	cmp    $0xd00000,%rax
     896:	75 ed                	jne    885 <main+0x2f5>
        Cur_Addr+=UVM_SIG_SIZE;
        /*reset two threads*/
        UVM_Clear((void*)(12*UVM_POW2(RME_PGT_SIZE_1M)), UVM_POW2(RME_PGT_SIZE_1M));
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD1),(ptr_t)TEST_SIG_FUNC1,12*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     898:	31 c9                	xor    %ecx,%ecx
     89a:	ba 00 00 c0 00       	mov    $0xc00000,%edx
     89f:	be 90 02 00 00       	mov    $0x290,%esi
     8a4:	bf 00 80 09 00       	mov    $0x98000,%edi
     8a9:	e8 72 14 00 00       	call   1d20 <UVM_Thd_Exec_Set>
     8ae:	48 85 c0             	test   %rax,%rax
     8b1:	0f 88 c6 07 00 00    	js     107d <main+0xaed>
        /*throw away thread1 infinity time slices,and add finity time slices to it*/
        //UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(UVM_BOOT_TBL_THD,0),TEST_THD1,UVM_THD_INIT_TIME)>=0);
        //UVM_ASSERT(UVM_Thd_Time_Xfer(TEST_THD1,UVM_CAPID(UVM_BOOT_TBL_THD,0),100)>=0);
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD1),1)>=0);
     8b7:	be 01 00 00 00       	mov    $0x1,%esi
     8bc:	bf 00 80 09 00       	mov    $0x98000,%edi
     8c1:	bd 10 27 00 00       	mov    $0x2710,%ebp
     8c6:	e8 e5 14 00 00       	call   1db0 <UVM_Thd_Sched_Prio>
     8cb:	48 85 c0             	test   %rax,%rax
     8ce:	0f 88 4d 07 00 00    	js     1021 <main+0xa91>
        for(Count=0;Count<10000;Count++)
        {
            UVM_Sig_Snd(TEST_SIG1);
     8d4:	bf 0b 00 00 00       	mov    $0xb,%edi
     8d9:	e8 92 15 00 00       	call   1e70 <UVM_Sig_Snd>
        for(Count=0;Count<10000;Count++)
     8de:	48 83 ed 01          	sub    $0x1,%rbp
     8e2:	75 f0                	jne    8d4 <main+0x344>
        }
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD1),0)>=0);
     8e4:	31 f6                	xor    %esi,%esi
     8e6:	bf 00 80 09 00       	mov    $0x98000,%edi
     8eb:	e8 c0 14 00 00       	call   1db0 <UVM_Thd_Sched_Prio>
     8f0:	48 85 c0             	test   %rax,%rax
     8f3:	0f 88 64 0a 00 00    	js     135d <main+0xdcd>
        //     }
        // }
        // UVM_LOG_S("\r\nAdd pages success!!!!");

        /*Create test process here*/
        UVM_ASSERT(UVM_Proc_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS,UVM_BOOT_CAPTBL,
     8f9:	31 c9                	xor    %ecx,%ecx
     8fb:	31 ff                	xor    %edi,%edi
     8fd:	41 b9 c0 17 a0 0e    	mov    $0xea017c0,%r9d
     903:	41 b8 00 80 01 00    	mov    $0x18000,%r8d
     909:	ba 0f 00 00 00       	mov    $0xf,%edx
     90e:	be 00 80 05 00       	mov    $0x58000,%esi
     913:	e8 28 13 00 00       	call   1c40 <UVM_Proc_Crt>
     918:	48 85 c0             	test   %rax,%rax
     91b:	0f 88 e0 09 00 00    	js     1301 <main+0xd71>
                                        UVM_CAPID(UVM_BOOT_TBL_PGTBL,0),Cur_Addr)>=0);
        Cur_Addr+=UVM_PROC_SIZE;
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD3, TEST_PROCESS, 10, Cur_Addr)>=0);
     921:	41 b9 e0 17 a0 0e    	mov    $0xea017e0,%r9d
     927:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
     92d:	b9 0f 00 00 00       	mov    $0xf,%ecx
     932:	ba 02 00 00 00       	mov    $0x2,%edx
     937:	be 00 80 05 00       	mov    $0x58000,%esi
     93c:	bf 09 00 00 00       	mov    $0x9,%edi
     941:	e8 7a 13 00 00       	call   1cc0 <UVM_Thd_Crt>
     946:	48 85 c0             	test   %rax,%rax
     949:	0f 88 56 09 00 00    	js     12a5 <main+0xd15>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD3),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
     94f:	45 31 c0             	xor    %r8d,%r8d
     952:	31 c9                	xor    %ecx,%ecx
     954:	ba 00 00 00 80       	mov    $0x80000000,%edx
     959:	be 00 80 03 00       	mov    $0x38000,%esi
     95e:	bf 02 80 09 00       	mov    $0x98002,%edi
     963:	e8 f8 13 00 00       	call   1d60 <UVM_Thd_Sched_Bind>
     968:	48 85 c0             	test   %rax,%rax
     96b:	0f 88 d8 08 00 00    	js     1249 <main+0xcb9>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD3),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     971:	be 00 80 03 00       	mov    $0x38000,%esi
     976:	bf 02 80 09 00       	mov    $0x98002,%edi
    Word_Inc=(ptr_t*)Addr;
     97b:	bd 00 00 e0 00       	mov    $0xe00000,%ebp
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD3),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     980:	48 ba fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rdx
     987:	ff ff 7f 
     98a:	e8 61 14 00 00       	call   1df0 <UVM_Thd_Time_Xfer>
     98f:	48 85 c0             	test   %rax,%rax
     992:	0f 88 41 07 00 00    	js     10d9 <main+0xb49>
        *Word_Inc=0;
     998:	48 c7 45 00 00 00 00 	movq   $0x0,0x0(%rbp)
     99f:	00 
        Word_Inc++;
     9a0:	48 83 c5 08          	add    $0x8,%rbp
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
     9a4:	48 81 fd 00 00 f0 00 	cmp    $0xf00000,%rbp
     9ab:	75 eb                	jne    998 <main+0x408>
        UVM_Clear((void*)(14*UVM_POW2(RME_PGT_SIZE_1M)), UVM_POW2(RME_PGT_SIZE_1M));
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD3),(ptr_t)TEST_THD_FUNC3,14*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     9ad:	31 c9                	xor    %ecx,%ecx
     9af:	ba 00 00 e0 00       	mov    $0xe00000,%edx
     9b4:	be f0 01 00 00       	mov    $0x1f0,%esi
     9b9:	bf 02 80 09 00       	mov    $0x98002,%edi
     9be:	e8 5d 13 00 00       	call   1d20 <UVM_Thd_Exec_Set>
     9c3:	48 85 c0             	test   %rax,%rax
     9c6:	0f 88 21 08 00 00    	js     11ed <main+0xc5d>
        Cur_Addr+=UVM_THD_SIZE;

        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD4, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
     9cc:	41 b9 b0 21 a0 0e    	mov    $0xea021b0,%r9d
     9d2:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
     9d8:	b9 02 00 00 00       	mov    $0x2,%ecx
     9dd:	ba 03 00 00 00       	mov    $0x3,%edx
     9e2:	be 00 80 05 00       	mov    $0x58000,%esi
     9e7:	bf 09 00 00 00       	mov    $0x9,%edi
     9ec:	e8 cf 12 00 00       	call   1cc0 <UVM_Thd_Crt>
     9f1:	48 85 c0             	test   %rax,%rax
     9f4:	0f 88 97 07 00 00    	js     1191 <main+0xc01>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD4),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
     9fa:	45 31 c0             	xor    %r8d,%r8d
     9fd:	31 c9                	xor    %ecx,%ecx
     9ff:	ba 00 00 00 80       	mov    $0x80000000,%edx
     a04:	be 00 80 03 00       	mov    $0x38000,%esi
     a09:	bf 03 80 09 00       	mov    $0x98003,%edi
     a0e:	e8 4d 13 00 00       	call   1d60 <UVM_Thd_Sched_Bind>
     a13:	48 85 c0             	test   %rax,%rax
     a16:	0f 88 9d 09 00 00    	js     13b9 <main+0xe29>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD4),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     a1c:	48 ba fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rdx
     a23:	ff ff 7f 
     a26:	be 00 80 03 00       	mov    $0x38000,%esi
     a2b:	bf 03 80 09 00       	mov    $0x98003,%edi
     a30:	e8 bb 13 00 00       	call   1df0 <UVM_Thd_Time_Xfer>
     a35:	48 85 c0             	test   %rax,%rax
     a38:	0f 88 f7 06 00 00    	js     1135 <main+0xba5>
        *Word_Inc=0;
     a3e:	48 c7 45 00 00 00 00 	movq   $0x0,0x0(%rbp)
     a45:	00 
        Word_Inc++;
     a46:	48 83 c5 08          	add    $0x8,%rbp
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
     a4a:	48 81 fd 00 00 00 01 	cmp    $0x1000000,%rbp
     a51:	75 eb                	jne    a3e <main+0x4ae>
        UVM_Clear((void*)(15*UVM_POW2(RME_PGT_SIZE_1M)), UVM_POW2(RME_PGT_SIZE_1M));
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD4),(ptr_t)TEST_THD_FUNC4,15*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     a53:	31 c9                	xor    %ecx,%ecx
     a55:	ba 00 00 f0 00       	mov    $0xf00000,%edx
     a5a:	be 30 01 00 00       	mov    $0x130,%esi
     a5f:	bf 03 80 09 00       	mov    $0x98003,%edi
     a64:	e8 b7 12 00 00       	call   1d20 <UVM_Thd_Exec_Set>
     a69:	48 85 c0             	test   %rax,%rax
     a6c:	0f 88 ff 09 00 00    	js     1471 <main+0xee1>
        Cur_Addr+=UVM_THD_SIZE;

        UVM_LOG_S("\r\nCross-process swtching thread...");
     a72:	bf b0 21 00 00       	mov    $0x21b0,%edi
     a77:	e8 94 0e 00 00       	call   1910 <UVM_Print_String>
        UVM_Thd_Swt(UVM_CAPID(TEST_THD_TBL,TEST_THD3),0);
     a7c:	31 f6                	xor    %esi,%esi
     a7e:	bf 02 80 09 00       	mov    $0x98002,%edi
     a83:	e8 88 13 00 00       	call   1e10 <UVM_Thd_Swt>
        UVM_LOG_S("\r\nBack to main thread!");
     a88:	bf 94 22 00 00       	mov    $0x2294,%edi
     a8d:	e8 7e 0e 00 00       	call   1910 <UVM_Print_String>

        /*Cross-process thread switching test ends here*/
       
        /*Cross-process signal Sending-receiving test begins here*/
        /*create endpoint first*/
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG2, Cur_Addr)>=0);
     a92:	31 ff                	xor    %edi,%edi
     a94:	b9 80 2b a0 0e       	mov    $0xea02b80,%ecx
     a99:	ba 0c 00 00 00       	mov    $0xc,%edx
     a9e:	be 00 80 05 00       	mov    $0x58000,%esi
     aa3:	e8 88 13 00 00       	call   1e30 <UVM_Sig_Crt>
     aa8:	48 85 c0             	test   %rax,%rax
     aab:	0f 88 64 09 00 00    	js     1415 <main+0xe85>
        *Word_Inc=0;
     ab1:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
        Word_Inc++;
     ab8:	48 83 c3 08          	add    $0x8,%rbx
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
     abc:	48 81 fb 00 00 f0 00 	cmp    $0xf00000,%rbx
     ac3:	75 ec                	jne    ab1 <main+0x521>
        Cur_Addr+=UVM_SIG_SIZE;
        UVM_Clear((void*)(14*UVM_POW2(RME_PGT_SIZE_1M)), UVM_POW2(RME_PGT_SIZE_1M));
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD3),(ptr_t)TEST_SIG_FUNC2,14*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     ac5:	31 c9                	xor    %ecx,%ecx
     ac7:	ba 00 00 e0 00       	mov    $0xe00000,%edx
     acc:	be 00 04 00 00       	mov    $0x400,%esi
     ad1:	bf 02 80 09 00       	mov    $0x98002,%edi
     ad6:	e8 45 12 00 00       	call   1d20 <UVM_Thd_Exec_Set>
     adb:	48 85 c0             	test   %rax,%rax
     ade:	0f 88 45 0a 00 00    	js     1529 <main+0xf99>

        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD3),1)>=0);
     ae4:	be 01 00 00 00       	mov    $0x1,%esi
     ae9:	bf 02 80 09 00       	mov    $0x98002,%edi
     aee:	bd 10 27 00 00       	mov    $0x2710,%ebp
     af3:	e8 b8 12 00 00       	call   1db0 <UVM_Thd_Sched_Prio>
     af8:	48 85 c0             	test   %rax,%rax
     afb:	0f 88 cc 09 00 00    	js     14cd <main+0xf3d>
        for(Count=0;Count<10000;Count++)
        {
            UVM_Sig_Snd(TEST_SIG2);
     b01:	bf 0c 00 00 00       	mov    $0xc,%edi
     b06:	e8 65 13 00 00       	call   1e70 <UVM_Sig_Snd>
        for(Count=0;Count<10000;Count++)
     b0b:	48 83 ed 01          	sub    $0x1,%rbp
     b0f:	75 f0                	jne    b01 <main+0x571>
        }
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD3),0)>=0);
     b11:	31 f6                	xor    %esi,%esi
     b13:	bf 02 80 09 00       	mov    $0x98002,%edi
     b18:	e8 93 12 00 00       	call   1db0 <UVM_Thd_Sched_Prio>
     b1d:	48 85 c0             	test   %rax,%rax
     b20:	0f 88 bb 0a 00 00    	js     15e1 <main+0x1051>

        /*Cross-process signal Sending-receiving test ends here*/

        /*Invocation stub test begins here*/
      
        UVM_ASSERT(UVM_Inv_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_INV1, TEST_PROCESS, Cur_Addr)>=0);
     b26:	31 ff                	xor    %edi,%edi
     b28:	41 b8 a0 2b a0 0e    	mov    $0xea02ba0,%r8d
     b2e:	b9 0f 00 00 00       	mov    $0xf,%ecx
     b33:	ba 0a 00 00 00       	mov    $0xa,%edx
     b38:	be 00 80 05 00       	mov    $0x58000,%esi
     b3d:	e8 6e 13 00 00       	call   1eb0 <UVM_Inv_Crt>
     b42:	48 85 c0             	test   %rax,%rax
     b45:	0f 88 3a 0a 00 00    	js     1585 <main+0xff5>
        *Word_Inc=0;
     b4b:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
        Word_Inc++;
     b52:	48 83 c3 08          	add    $0x8,%rbx
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
     b56:	48 81 fb 00 00 00 01 	cmp    $0x1000000,%rbx
     b5d:	75 ec                	jne    b4b <main+0x5bb>
        Cur_Addr+=UVM_INV_SIZE;
        UVM_Clear((void*)(15*UVM_POW2(RME_PGT_SIZE_1M)), UVM_POW2(RME_PGT_SIZE_1M));
        UVM_ASSERT(UVM_Inv_Set(TEST_INV1,(ptr_t)TEST_INV1_FUNC,15*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     b5f:	31 c9                	xor    %ecx,%ecx
     b61:	ba 00 00 f0 00       	mov    $0xf00000,%edx
     b66:	be 70 05 00 00       	mov    $0x570,%esi
     b6b:	bf 0a 00 00 00       	mov    $0xa,%edi
     b70:	e8 8b 13 00 00       	call   1f00 <UVM_Inv_Set>
     b75:	48 85 c0             	test   %rax,%rax
     b78:	0f 88 bf 0a 00 00    	js     163d <main+0x10ad>
        sum=0;
     b7e:	48 c7 05 87 24 00 00 	movq   $0x0,0x2487(%rip)        # 3010 <sum>
     b85:	00 00 00 00 
        sumin=0;
        sumout=0;
     b89:	bb 10 27 00 00       	mov    $0x2710,%ebx
        sumin=0;
     b8e:	48 c7 05 6f 24 00 00 	movq   $0x0,0x246f(%rip)        # 3008 <sumin>
     b95:	00 00 00 00 
        sumout=0;
     b99:	48 c7 05 5c 24 00 00 	movq   $0x0,0x245c(%rip)        # 3000 <sumout>
     ba0:	00 00 00 00 
        for(Count=0;Count<10000;Count++)
        {
            start=__UVM_X64_Read_TSC();
     ba4:	e8 72 f4 ff ff       	call   1b <__UVM_X64_Read_TSC>
            UVM_Inv_Act(TEST_INV1,0,0);
     ba9:	31 d2                	xor    %edx,%edx
     bab:	31 f6                	xor    %esi,%esi
     bad:	bf 0a 00 00 00       	mov    $0xa,%edi
            start=__UVM_X64_Read_TSC();
     bb2:	48 89 05 6f 24 00 00 	mov    %rax,0x246f(%rip)        # 3028 <start>
            UVM_Inv_Act(TEST_INV1,0,0);
     bb9:	e8 9b f4 ff ff       	call   59 <UVM_Inv_Act>
            end=__UVM_X64_Read_TSC();
     bbe:	e8 58 f4 ff ff       	call   1b <__UVM_X64_Read_TSC>
     bc3:	48 89 05 4e 24 00 00 	mov    %rax,0x244e(%rip)        # 3018 <end>
            sum+=end-start;
     bca:	48 8b 05 47 24 00 00 	mov    0x2447(%rip),%rax        # 3018 <end>
     bd1:	48 8b 15 50 24 00 00 	mov    0x2450(%rip),%rdx        # 3028 <start>
     bd8:	48 29 d0             	sub    %rdx,%rax
     bdb:	48 01 05 2e 24 00 00 	add    %rax,0x242e(%rip)        # 3010 <sum>
            sumin+=middle-start;
     be2:	48 8b 05 37 24 00 00 	mov    0x2437(%rip),%rax        # 3020 <middle>
     be9:	48 8b 15 38 24 00 00 	mov    0x2438(%rip),%rdx        # 3028 <start>
     bf0:	48 29 d0             	sub    %rdx,%rax
     bf3:	48 01 05 0e 24 00 00 	add    %rax,0x240e(%rip)        # 3008 <sumin>
            sumout+=end-middle;
     bfa:	48 8b 05 17 24 00 00 	mov    0x2417(%rip),%rax        # 3018 <end>
     c01:	48 8b 15 18 24 00 00 	mov    0x2418(%rip),%rdx        # 3020 <middle>
     c08:	48 29 d0             	sub    %rdx,%rax
     c0b:	48 01 05 ee 23 00 00 	add    %rax,0x23ee(%rip)        # 3000 <sumout>
        for(Count=0;Count<10000;Count++)
     c12:	48 83 eb 01          	sub    $0x1,%rbx
     c16:	75 8c                	jne    ba4 <main+0x614>
        }
        UVM_LOG_S("\r\nInvocation total takes clock cycles:");
     c18:	bf d8 21 00 00       	mov    $0x21d8,%edi
        UVM_LOG_I(sum/10000);
     c1d:	bb 10 27 00 00       	mov    $0x2710,%ebx
        UVM_LOG_S("\r\nInvocation total takes clock cycles:");
     c22:	e8 e9 0c 00 00       	call   1910 <UVM_Print_String>
        UVM_LOG_I(sum/10000);
     c27:	48 8b 05 e2 23 00 00 	mov    0x23e2(%rip),%rax        # 3010 <sum>
     c2e:	31 d2                	xor    %edx,%edx
     c30:	48 f7 f3             	div    %rbx
     c33:	48 89 c7             	mov    %rax,%rdi
     c36:	e8 a5 0a 00 00       	call   16e0 <UVM_Print_Int>
        UVM_LOG_S("\r\nInvocation entry takes clock cycles:");
     c3b:	bf 00 22 00 00       	mov    $0x2200,%edi
     c40:	e8 cb 0c 00 00       	call   1910 <UVM_Print_String>
        UVM_LOG_I(sumin/10000);
     c45:	48 8b 05 bc 23 00 00 	mov    0x23bc(%rip),%rax        # 3008 <sumin>
     c4c:	31 d2                	xor    %edx,%edx
     c4e:	48 f7 f3             	div    %rbx
     c51:	48 89 c7             	mov    %rax,%rdi
     c54:	e8 87 0a 00 00       	call   16e0 <UVM_Print_Int>
        UVM_LOG_S("\r\nInvocation return takes clock cycles:");
     c59:	bf 28 22 00 00       	mov    $0x2228,%edi
     c5e:	e8 ad 0c 00 00       	call   1910 <UVM_Print_String>
        UVM_LOG_I(sumout/10000);
     c63:	48 8b 05 96 23 00 00 	mov    0x2396(%rip),%rax        # 3000 <sumout>
     c6a:	31 d2                	xor    %edx,%edx
     c6c:	48 f7 f3             	div    %rbx
     c6f:	48 89 c7             	mov    %rax,%rdi
     c72:	e8 69 0a 00 00       	call   16e0 <UVM_Print_Int>
        
        /*Invocation stub test ends here*/

        /*Idle*/
        UVM_LOG_S("\r\nIdle......");
     c77:	bf ab 22 00 00       	mov    $0x22ab,%edi
     c7c:	e8 8f 0c 00 00       	call   1910 <UVM_Print_String>
        while (1);
     c81:	eb fe                	jmp    c81 <main+0x6f1>
    }
    return 0;
}
     c83:	5a                   	pop    %rdx
     c84:	31 c0                	xor    %eax,%eax
     c86:	5b                   	pop    %rbx
     c87:	5d                   	pop    %rbp
     c88:	c3                   	ret    
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD_TBL,Cur_Addr,16)>=0);
     c89:	bf 28 20 00 00       	mov    $0x2028,%edi
     c8e:	e8 7d 0c 00 00       	call   1910 <UVM_Print_String>
     c93:	bf 50 22 00 00       	mov    $0x2250,%edi
     c98:	e8 73 0c 00 00       	call   1910 <UVM_Print_String>
     c9d:	bf 5c 22 00 00       	mov    $0x225c,%edi
     ca2:	e8 69 0c 00 00       	call   1910 <UVM_Print_String>
     ca7:	bf e9 00 00 00       	mov    $0xe9,%edi
     cac:	e8 2f 0a 00 00       	call   16e0 <UVM_Print_Int>
     cb1:	bf 64 22 00 00       	mov    $0x2264,%edi
     cb6:	e8 55 0c 00 00       	call   1910 <UVM_Print_String>
     cbb:	bf 67 22 00 00       	mov    $0x2267,%edi
     cc0:	e8 4b 0c 00 00       	call   1910 <UVM_Print_String>
     cc5:	bf 73 22 00 00       	mov    $0x2273,%edi
     cca:	e8 41 0c 00 00       	call   1910 <UVM_Print_String>
     ccf:	bf 76 22 00 00       	mov    $0x2276,%edi
     cd4:	e8 37 0c 00 00       	call   1910 <UVM_Print_String>
     cd9:	bf 64 22 00 00       	mov    $0x2264,%edi
     cde:	e8 2d 0c 00 00       	call   1910 <UVM_Print_String>
     ce3:	eb fe                	jmp    ce3 <main+0x753>
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD1, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
     ce5:	bf 28 20 00 00       	mov    $0x2028,%edi
     cea:	e8 21 0c 00 00       	call   1910 <UVM_Print_String>
     cef:	bf 50 22 00 00       	mov    $0x2250,%edi
     cf4:	e8 17 0c 00 00       	call   1910 <UVM_Print_String>
     cf9:	bf 5c 22 00 00       	mov    $0x225c,%edi
     cfe:	e8 0d 0c 00 00       	call   1910 <UVM_Print_String>
     d03:	bf eb 00 00 00       	mov    $0xeb,%edi
     d08:	e8 d3 09 00 00       	call   16e0 <UVM_Print_Int>
     d0d:	bf 64 22 00 00       	mov    $0x2264,%edi
     d12:	e8 f9 0b 00 00       	call   1910 <UVM_Print_String>
     d17:	bf 67 22 00 00       	mov    $0x2267,%edi
     d1c:	e8 ef 0b 00 00       	call   1910 <UVM_Print_String>
     d21:	bf 73 22 00 00       	mov    $0x2273,%edi
     d26:	e8 e5 0b 00 00       	call   1910 <UVM_Print_String>
     d2b:	bf 76 22 00 00       	mov    $0x2276,%edi
     d30:	e8 db 0b 00 00       	call   1910 <UVM_Print_String>
     d35:	bf 64 22 00 00       	mov    $0x2264,%edi
     d3a:	e8 d1 0b 00 00       	call   1910 <UVM_Print_String>
     d3f:	eb fe                	jmp    d3f <main+0x7af>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD1),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
     d41:	bf 28 20 00 00       	mov    $0x2028,%edi
     d46:	e8 c5 0b 00 00       	call   1910 <UVM_Print_String>
     d4b:	bf 50 22 00 00       	mov    $0x2250,%edi
     d50:	e8 bb 0b 00 00       	call   1910 <UVM_Print_String>
     d55:	bf 5c 22 00 00       	mov    $0x225c,%edi
     d5a:	e8 b1 0b 00 00       	call   1910 <UVM_Print_String>
     d5f:	bf ec 00 00 00       	mov    $0xec,%edi
     d64:	e8 77 09 00 00       	call   16e0 <UVM_Print_Int>
     d69:	bf 64 22 00 00       	mov    $0x2264,%edi
     d6e:	e8 9d 0b 00 00       	call   1910 <UVM_Print_String>
     d73:	bf 67 22 00 00       	mov    $0x2267,%edi
     d78:	e8 93 0b 00 00       	call   1910 <UVM_Print_String>
     d7d:	bf 73 22 00 00       	mov    $0x2273,%edi
     d82:	e8 89 0b 00 00       	call   1910 <UVM_Print_String>
     d87:	bf 76 22 00 00       	mov    $0x2276,%edi
     d8c:	e8 7f 0b 00 00       	call   1910 <UVM_Print_String>
     d91:	bf 64 22 00 00       	mov    $0x2264,%edi
     d96:	e8 75 0b 00 00       	call   1910 <UVM_Print_String>
     d9b:	eb fe                	jmp    d9b <main+0x80b>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD1),(ptr_t)TEST_THD_FUNC1,12*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     d9d:	bf 28 20 00 00       	mov    $0x2028,%edi
     da2:	e8 69 0b 00 00       	call   1910 <UVM_Print_String>
     da7:	bf 50 22 00 00       	mov    $0x2250,%edi
     dac:	e8 5f 0b 00 00       	call   1910 <UVM_Print_String>
     db1:	bf 5c 22 00 00       	mov    $0x225c,%edi
     db6:	e8 55 0b 00 00       	call   1910 <UVM_Print_String>
     dbb:	bf ef 00 00 00       	mov    $0xef,%edi
     dc0:	e8 1b 09 00 00       	call   16e0 <UVM_Print_Int>
     dc5:	bf 64 22 00 00       	mov    $0x2264,%edi
     dca:	e8 41 0b 00 00       	call   1910 <UVM_Print_String>
     dcf:	bf 67 22 00 00       	mov    $0x2267,%edi
     dd4:	e8 37 0b 00 00       	call   1910 <UVM_Print_String>
     dd9:	bf 73 22 00 00       	mov    $0x2273,%edi
     dde:	e8 2d 0b 00 00       	call   1910 <UVM_Print_String>
     de3:	bf 76 22 00 00       	mov    $0x2276,%edi
     de8:	e8 23 0b 00 00       	call   1910 <UVM_Print_String>
     ded:	bf 64 22 00 00       	mov    $0x2264,%edi
     df2:	e8 19 0b 00 00       	call   1910 <UVM_Print_String>
     df7:	eb fe                	jmp    df7 <main+0x867>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD1),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     df9:	bf 28 20 00 00       	mov    $0x2028,%edi
     dfe:	e8 0d 0b 00 00       	call   1910 <UVM_Print_String>
     e03:	bf 50 22 00 00       	mov    $0x2250,%edi
     e08:	e8 03 0b 00 00       	call   1910 <UVM_Print_String>
     e0d:	bf 5c 22 00 00       	mov    $0x225c,%edi
     e12:	e8 f9 0a 00 00       	call   1910 <UVM_Print_String>
     e17:	bf ed 00 00 00       	mov    $0xed,%edi
     e1c:	e8 bf 08 00 00       	call   16e0 <UVM_Print_Int>
     e21:	bf 64 22 00 00       	mov    $0x2264,%edi
     e26:	e8 e5 0a 00 00       	call   1910 <UVM_Print_String>
     e2b:	bf 67 22 00 00       	mov    $0x2267,%edi
     e30:	e8 db 0a 00 00       	call   1910 <UVM_Print_String>
     e35:	bf 73 22 00 00       	mov    $0x2273,%edi
     e3a:	e8 d1 0a 00 00       	call   1910 <UVM_Print_String>
     e3f:	bf 76 22 00 00       	mov    $0x2276,%edi
     e44:	e8 c7 0a 00 00       	call   1910 <UVM_Print_String>
     e49:	bf 64 22 00 00       	mov    $0x2264,%edi
     e4e:	e8 bd 0a 00 00       	call   1910 <UVM_Print_String>
     e53:	eb fe                	jmp    e53 <main+0x8c3>
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD2, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
     e55:	bf 28 20 00 00       	mov    $0x2028,%edi
     e5a:	e8 b1 0a 00 00       	call   1910 <UVM_Print_String>
     e5f:	bf 50 22 00 00       	mov    $0x2250,%edi
     e64:	e8 a7 0a 00 00       	call   1910 <UVM_Print_String>
     e69:	bf 5c 22 00 00       	mov    $0x225c,%edi
     e6e:	e8 9d 0a 00 00       	call   1910 <UVM_Print_String>
     e73:	bf f1 00 00 00       	mov    $0xf1,%edi
     e78:	e8 63 08 00 00       	call   16e0 <UVM_Print_Int>
     e7d:	bf 64 22 00 00       	mov    $0x2264,%edi
     e82:	e8 89 0a 00 00       	call   1910 <UVM_Print_String>
     e87:	bf 67 22 00 00       	mov    $0x2267,%edi
     e8c:	e8 7f 0a 00 00       	call   1910 <UVM_Print_String>
     e91:	bf 73 22 00 00       	mov    $0x2273,%edi
     e96:	e8 75 0a 00 00       	call   1910 <UVM_Print_String>
     e9b:	bf 76 22 00 00       	mov    $0x2276,%edi
     ea0:	e8 6b 0a 00 00       	call   1910 <UVM_Print_String>
     ea5:	bf 64 22 00 00       	mov    $0x2264,%edi
     eaa:	e8 61 0a 00 00       	call   1910 <UVM_Print_String>
     eaf:	eb fe                	jmp    eaf <main+0x91f>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD2),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
     eb1:	bf 28 20 00 00       	mov    $0x2028,%edi
     eb6:	e8 55 0a 00 00       	call   1910 <UVM_Print_String>
     ebb:	bf 50 22 00 00       	mov    $0x2250,%edi
     ec0:	e8 4b 0a 00 00       	call   1910 <UVM_Print_String>
     ec5:	bf 5c 22 00 00       	mov    $0x225c,%edi
     eca:	e8 41 0a 00 00       	call   1910 <UVM_Print_String>
     ecf:	bf f2 00 00 00       	mov    $0xf2,%edi
     ed4:	e8 07 08 00 00       	call   16e0 <UVM_Print_Int>
     ed9:	bf 64 22 00 00       	mov    $0x2264,%edi
     ede:	e8 2d 0a 00 00       	call   1910 <UVM_Print_String>
     ee3:	bf 67 22 00 00       	mov    $0x2267,%edi
     ee8:	e8 23 0a 00 00       	call   1910 <UVM_Print_String>
     eed:	bf 73 22 00 00       	mov    $0x2273,%edi
     ef2:	e8 19 0a 00 00       	call   1910 <UVM_Print_String>
     ef7:	bf 76 22 00 00       	mov    $0x2276,%edi
     efc:	e8 0f 0a 00 00       	call   1910 <UVM_Print_String>
     f01:	bf 64 22 00 00       	mov    $0x2264,%edi
     f06:	e8 05 0a 00 00       	call   1910 <UVM_Print_String>
     f0b:	eb fe                	jmp    f0b <main+0x97b>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD2),(ptr_t)TEST_THD_FUNC2,13*UVM_POW2(RME_PGT_SIZE_1M),1)>=0);
     f0d:	bf 28 20 00 00       	mov    $0x2028,%edi
     f12:	e8 f9 09 00 00       	call   1910 <UVM_Print_String>
     f17:	bf 50 22 00 00       	mov    $0x2250,%edi
     f1c:	e8 ef 09 00 00       	call   1910 <UVM_Print_String>
     f21:	bf 5c 22 00 00       	mov    $0x225c,%edi
     f26:	e8 e5 09 00 00       	call   1910 <UVM_Print_String>
     f2b:	bf f5 00 00 00       	mov    $0xf5,%edi
     f30:	e8 ab 07 00 00       	call   16e0 <UVM_Print_Int>
     f35:	bf 64 22 00 00       	mov    $0x2264,%edi
     f3a:	e8 d1 09 00 00       	call   1910 <UVM_Print_String>
     f3f:	bf 67 22 00 00       	mov    $0x2267,%edi
     f44:	e8 c7 09 00 00       	call   1910 <UVM_Print_String>
     f49:	bf 73 22 00 00       	mov    $0x2273,%edi
     f4e:	e8 bd 09 00 00       	call   1910 <UVM_Print_String>
     f53:	bf 76 22 00 00       	mov    $0x2276,%edi
     f58:	e8 b3 09 00 00       	call   1910 <UVM_Print_String>
     f5d:	bf 64 22 00 00       	mov    $0x2264,%edi
     f62:	e8 a9 09 00 00       	call   1910 <UVM_Print_String>
     f67:	eb fe                	jmp    f67 <main+0x9d7>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD2),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     f69:	bf 28 20 00 00       	mov    $0x2028,%edi
     f6e:	e8 9d 09 00 00       	call   1910 <UVM_Print_String>
     f73:	bf 50 22 00 00       	mov    $0x2250,%edi
     f78:	e8 93 09 00 00       	call   1910 <UVM_Print_String>
     f7d:	bf 5c 22 00 00       	mov    $0x225c,%edi
     f82:	e8 89 09 00 00       	call   1910 <UVM_Print_String>
     f87:	bf f3 00 00 00       	mov    $0xf3,%edi
     f8c:	e8 4f 07 00 00       	call   16e0 <UVM_Print_Int>
     f91:	bf 64 22 00 00       	mov    $0x2264,%edi
     f96:	e8 75 09 00 00       	call   1910 <UVM_Print_String>
     f9b:	bf 67 22 00 00       	mov    $0x2267,%edi
     fa0:	e8 6b 09 00 00       	call   1910 <UVM_Print_String>
     fa5:	bf 73 22 00 00       	mov    $0x2273,%edi
     faa:	e8 61 09 00 00       	call   1910 <UVM_Print_String>
     faf:	bf 76 22 00 00       	mov    $0x2276,%edi
     fb4:	e8 57 09 00 00       	call   1910 <UVM_Print_String>
     fb9:	bf 64 22 00 00       	mov    $0x2264,%edi
     fbe:	e8 4d 09 00 00       	call   1910 <UVM_Print_String>
     fc3:	eb fe                	jmp    fc3 <main+0xa33>
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG1, Cur_Addr)>=0);
     fc5:	bf 28 20 00 00       	mov    $0x2028,%edi
     fca:	e8 41 09 00 00       	call   1910 <UVM_Print_String>
     fcf:	bf 50 22 00 00       	mov    $0x2250,%edi
     fd4:	e8 37 09 00 00       	call   1910 <UVM_Print_String>
     fd9:	bf 5c 22 00 00       	mov    $0x225c,%edi
     fde:	e8 2d 09 00 00       	call   1910 <UVM_Print_String>
     fe3:	bf fe 00 00 00       	mov    $0xfe,%edi
     fe8:	e8 f3 06 00 00       	call   16e0 <UVM_Print_Int>
     fed:	bf 64 22 00 00       	mov    $0x2264,%edi
     ff2:	e8 19 09 00 00       	call   1910 <UVM_Print_String>
     ff7:	bf 67 22 00 00       	mov    $0x2267,%edi
     ffc:	e8 0f 09 00 00       	call   1910 <UVM_Print_String>
    1001:	bf 73 22 00 00       	mov    $0x2273,%edi
    1006:	e8 05 09 00 00       	call   1910 <UVM_Print_String>
    100b:	bf 76 22 00 00       	mov    $0x2276,%edi
    1010:	e8 fb 08 00 00       	call   1910 <UVM_Print_String>
    1015:	bf 64 22 00 00       	mov    $0x2264,%edi
    101a:	e8 f1 08 00 00       	call   1910 <UVM_Print_String>
    101f:	eb fe                	jmp    101f <main+0xa8f>
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD1),1)>=0);
    1021:	bf 28 20 00 00       	mov    $0x2028,%edi
    1026:	e8 e5 08 00 00       	call   1910 <UVM_Print_String>
    102b:	bf 50 22 00 00       	mov    $0x2250,%edi
    1030:	e8 db 08 00 00       	call   1910 <UVM_Print_String>
    1035:	bf 5c 22 00 00       	mov    $0x225c,%edi
    103a:	e8 d1 08 00 00       	call   1910 <UVM_Print_String>
    103f:	bf 06 01 00 00       	mov    $0x106,%edi
    1044:	e8 97 06 00 00       	call   16e0 <UVM_Print_Int>
    1049:	bf 64 22 00 00       	mov    $0x2264,%edi
    104e:	e8 bd 08 00 00       	call   1910 <UVM_Print_String>
    1053:	bf 67 22 00 00       	mov    $0x2267,%edi
    1058:	e8 b3 08 00 00       	call   1910 <UVM_Print_String>
    105d:	bf 73 22 00 00       	mov    $0x2273,%edi
    1062:	e8 a9 08 00 00       	call   1910 <UVM_Print_String>
    1067:	bf 76 22 00 00       	mov    $0x2276,%edi
    106c:	e8 9f 08 00 00       	call   1910 <UVM_Print_String>
    1071:	bf 64 22 00 00       	mov    $0x2264,%edi
    1076:	e8 95 08 00 00       	call   1910 <UVM_Print_String>
    107b:	eb fe                	jmp    107b <main+0xaeb>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD1),(ptr_t)TEST_SIG_FUNC1,12*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
    107d:	bf 28 20 00 00       	mov    $0x2028,%edi
    1082:	e8 89 08 00 00       	call   1910 <UVM_Print_String>
    1087:	bf 50 22 00 00       	mov    $0x2250,%edi
    108c:	e8 7f 08 00 00       	call   1910 <UVM_Print_String>
    1091:	bf 5c 22 00 00       	mov    $0x225c,%edi
    1096:	e8 75 08 00 00       	call   1910 <UVM_Print_String>
    109b:	bf 02 01 00 00       	mov    $0x102,%edi
    10a0:	e8 3b 06 00 00       	call   16e0 <UVM_Print_Int>
    10a5:	bf 64 22 00 00       	mov    $0x2264,%edi
    10aa:	e8 61 08 00 00       	call   1910 <UVM_Print_String>
    10af:	bf 67 22 00 00       	mov    $0x2267,%edi
    10b4:	e8 57 08 00 00       	call   1910 <UVM_Print_String>
    10b9:	bf 73 22 00 00       	mov    $0x2273,%edi
    10be:	e8 4d 08 00 00       	call   1910 <UVM_Print_String>
    10c3:	bf 76 22 00 00       	mov    $0x2276,%edi
    10c8:	e8 43 08 00 00       	call   1910 <UVM_Print_String>
    10cd:	bf 64 22 00 00       	mov    $0x2264,%edi
    10d2:	e8 39 08 00 00       	call   1910 <UVM_Print_String>
    10d7:	eb fe                	jmp    10d7 <main+0xb47>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD3),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
    10d9:	bf 28 20 00 00       	mov    $0x2028,%edi
    10de:	e8 2d 08 00 00       	call   1910 <UVM_Print_String>
    10e3:	bf 50 22 00 00       	mov    $0x2250,%edi
    10e8:	e8 23 08 00 00       	call   1910 <UVM_Print_String>
    10ed:	bf 5c 22 00 00       	mov    $0x225c,%edi
    10f2:	e8 19 08 00 00       	call   1910 <UVM_Print_String>
    10f7:	bf 3f 01 00 00       	mov    $0x13f,%edi
    10fc:	e8 df 05 00 00       	call   16e0 <UVM_Print_Int>
    1101:	bf 64 22 00 00       	mov    $0x2264,%edi
    1106:	e8 05 08 00 00       	call   1910 <UVM_Print_String>
    110b:	bf 67 22 00 00       	mov    $0x2267,%edi
    1110:	e8 fb 07 00 00       	call   1910 <UVM_Print_String>
    1115:	bf 73 22 00 00       	mov    $0x2273,%edi
    111a:	e8 f1 07 00 00       	call   1910 <UVM_Print_String>
    111f:	bf 76 22 00 00       	mov    $0x2276,%edi
    1124:	e8 e7 07 00 00       	call   1910 <UVM_Print_String>
    1129:	bf 64 22 00 00       	mov    $0x2264,%edi
    112e:	e8 dd 07 00 00       	call   1910 <UVM_Print_String>
    1133:	eb fe                	jmp    1133 <main+0xba3>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD4),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
    1135:	bf 28 20 00 00       	mov    $0x2028,%edi
    113a:	e8 d1 07 00 00       	call   1910 <UVM_Print_String>
    113f:	bf 50 22 00 00       	mov    $0x2250,%edi
    1144:	e8 c7 07 00 00       	call   1910 <UVM_Print_String>
    1149:	bf 5c 22 00 00       	mov    $0x225c,%edi
    114e:	e8 bd 07 00 00       	call   1910 <UVM_Print_String>
    1153:	bf 46 01 00 00       	mov    $0x146,%edi
    1158:	e8 83 05 00 00       	call   16e0 <UVM_Print_Int>
    115d:	bf 64 22 00 00       	mov    $0x2264,%edi
    1162:	e8 a9 07 00 00       	call   1910 <UVM_Print_String>
    1167:	bf 67 22 00 00       	mov    $0x2267,%edi
    116c:	e8 9f 07 00 00       	call   1910 <UVM_Print_String>
    1171:	bf 73 22 00 00       	mov    $0x2273,%edi
    1176:	e8 95 07 00 00       	call   1910 <UVM_Print_String>
    117b:	bf 76 22 00 00       	mov    $0x2276,%edi
    1180:	e8 8b 07 00 00       	call   1910 <UVM_Print_String>
    1185:	bf 64 22 00 00       	mov    $0x2264,%edi
    118a:	e8 81 07 00 00       	call   1910 <UVM_Print_String>
    118f:	eb fe                	jmp    118f <main+0xbff>
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD4, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
    1191:	bf 28 20 00 00       	mov    $0x2028,%edi
    1196:	e8 75 07 00 00       	call   1910 <UVM_Print_String>
    119b:	bf 50 22 00 00       	mov    $0x2250,%edi
    11a0:	e8 6b 07 00 00       	call   1910 <UVM_Print_String>
    11a5:	bf 5c 22 00 00       	mov    $0x225c,%edi
    11aa:	e8 61 07 00 00       	call   1910 <UVM_Print_String>
    11af:	bf 44 01 00 00       	mov    $0x144,%edi
    11b4:	e8 27 05 00 00       	call   16e0 <UVM_Print_Int>
    11b9:	bf 64 22 00 00       	mov    $0x2264,%edi
    11be:	e8 4d 07 00 00       	call   1910 <UVM_Print_String>
    11c3:	bf 67 22 00 00       	mov    $0x2267,%edi
    11c8:	e8 43 07 00 00       	call   1910 <UVM_Print_String>
    11cd:	bf 73 22 00 00       	mov    $0x2273,%edi
    11d2:	e8 39 07 00 00       	call   1910 <UVM_Print_String>
    11d7:	bf 76 22 00 00       	mov    $0x2276,%edi
    11dc:	e8 2f 07 00 00       	call   1910 <UVM_Print_String>
    11e1:	bf 64 22 00 00       	mov    $0x2264,%edi
    11e6:	e8 25 07 00 00       	call   1910 <UVM_Print_String>
    11eb:	eb fe                	jmp    11eb <main+0xc5b>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD3),(ptr_t)TEST_THD_FUNC3,14*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
    11ed:	bf 28 20 00 00       	mov    $0x2028,%edi
    11f2:	e8 19 07 00 00       	call   1910 <UVM_Print_String>
    11f7:	bf 50 22 00 00       	mov    $0x2250,%edi
    11fc:	e8 0f 07 00 00       	call   1910 <UVM_Print_String>
    1201:	bf 5c 22 00 00       	mov    $0x225c,%edi
    1206:	e8 05 07 00 00       	call   1910 <UVM_Print_String>
    120b:	bf 41 01 00 00       	mov    $0x141,%edi
    1210:	e8 cb 04 00 00       	call   16e0 <UVM_Print_Int>
    1215:	bf 64 22 00 00       	mov    $0x2264,%edi
    121a:	e8 f1 06 00 00       	call   1910 <UVM_Print_String>
    121f:	bf 67 22 00 00       	mov    $0x2267,%edi
    1224:	e8 e7 06 00 00       	call   1910 <UVM_Print_String>
    1229:	bf 73 22 00 00       	mov    $0x2273,%edi
    122e:	e8 dd 06 00 00       	call   1910 <UVM_Print_String>
    1233:	bf 76 22 00 00       	mov    $0x2276,%edi
    1238:	e8 d3 06 00 00       	call   1910 <UVM_Print_String>
    123d:	bf 64 22 00 00       	mov    $0x2264,%edi
    1242:	e8 c9 06 00 00       	call   1910 <UVM_Print_String>
    1247:	eb fe                	jmp    1247 <main+0xcb7>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD3),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
    1249:	bf 28 20 00 00       	mov    $0x2028,%edi
    124e:	e8 bd 06 00 00       	call   1910 <UVM_Print_String>
    1253:	bf 50 22 00 00       	mov    $0x2250,%edi
    1258:	e8 b3 06 00 00       	call   1910 <UVM_Print_String>
    125d:	bf 5c 22 00 00       	mov    $0x225c,%edi
    1262:	e8 a9 06 00 00       	call   1910 <UVM_Print_String>
    1267:	bf 3e 01 00 00       	mov    $0x13e,%edi
    126c:	e8 6f 04 00 00       	call   16e0 <UVM_Print_Int>
    1271:	bf 64 22 00 00       	mov    $0x2264,%edi
    1276:	e8 95 06 00 00       	call   1910 <UVM_Print_String>
    127b:	bf 67 22 00 00       	mov    $0x2267,%edi
    1280:	e8 8b 06 00 00       	call   1910 <UVM_Print_String>
    1285:	bf 73 22 00 00       	mov    $0x2273,%edi
    128a:	e8 81 06 00 00       	call   1910 <UVM_Print_String>
    128f:	bf 76 22 00 00       	mov    $0x2276,%edi
    1294:	e8 77 06 00 00       	call   1910 <UVM_Print_String>
    1299:	bf 64 22 00 00       	mov    $0x2264,%edi
    129e:	e8 6d 06 00 00       	call   1910 <UVM_Print_String>
    12a3:	eb fe                	jmp    12a3 <main+0xd13>
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD3, TEST_PROCESS, 10, Cur_Addr)>=0);
    12a5:	bf 28 20 00 00       	mov    $0x2028,%edi
    12aa:	e8 61 06 00 00       	call   1910 <UVM_Print_String>
    12af:	bf 50 22 00 00       	mov    $0x2250,%edi
    12b4:	e8 57 06 00 00       	call   1910 <UVM_Print_String>
    12b9:	bf 5c 22 00 00       	mov    $0x225c,%edi
    12be:	e8 4d 06 00 00       	call   1910 <UVM_Print_String>
    12c3:	bf 3d 01 00 00       	mov    $0x13d,%edi
    12c8:	e8 13 04 00 00       	call   16e0 <UVM_Print_Int>
    12cd:	bf 64 22 00 00       	mov    $0x2264,%edi
    12d2:	e8 39 06 00 00       	call   1910 <UVM_Print_String>
    12d7:	bf 67 22 00 00       	mov    $0x2267,%edi
    12dc:	e8 2f 06 00 00       	call   1910 <UVM_Print_String>
    12e1:	bf 73 22 00 00       	mov    $0x2273,%edi
    12e6:	e8 25 06 00 00       	call   1910 <UVM_Print_String>
    12eb:	bf 76 22 00 00       	mov    $0x2276,%edi
    12f0:	e8 1b 06 00 00       	call   1910 <UVM_Print_String>
    12f5:	bf 64 22 00 00       	mov    $0x2264,%edi
    12fa:	e8 11 06 00 00       	call   1910 <UVM_Print_String>
    12ff:	eb fe                	jmp    12ff <main+0xd6f>
        UVM_ASSERT(UVM_Proc_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS,UVM_BOOT_CAPTBL,
    1301:	bf 28 20 00 00       	mov    $0x2028,%edi
    1306:	e8 05 06 00 00       	call   1910 <UVM_Print_String>
    130b:	bf 50 22 00 00       	mov    $0x2250,%edi
    1310:	e8 fb 05 00 00       	call   1910 <UVM_Print_String>
    1315:	bf 5c 22 00 00       	mov    $0x225c,%edi
    131a:	e8 f1 05 00 00       	call   1910 <UVM_Print_String>
    131f:	bf 3a 01 00 00       	mov    $0x13a,%edi
    1324:	e8 b7 03 00 00       	call   16e0 <UVM_Print_Int>
    1329:	bf 64 22 00 00       	mov    $0x2264,%edi
    132e:	e8 dd 05 00 00       	call   1910 <UVM_Print_String>
    1333:	bf 67 22 00 00       	mov    $0x2267,%edi
    1338:	e8 d3 05 00 00       	call   1910 <UVM_Print_String>
    133d:	bf 73 22 00 00       	mov    $0x2273,%edi
    1342:	e8 c9 05 00 00       	call   1910 <UVM_Print_String>
    1347:	bf 76 22 00 00       	mov    $0x2276,%edi
    134c:	e8 bf 05 00 00       	call   1910 <UVM_Print_String>
    1351:	bf 64 22 00 00       	mov    $0x2264,%edi
    1356:	e8 b5 05 00 00       	call   1910 <UVM_Print_String>
    135b:	eb fe                	jmp    135b <main+0xdcb>
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD1),0)>=0);
    135d:	bf 28 20 00 00       	mov    $0x2028,%edi
    1362:	e8 a9 05 00 00       	call   1910 <UVM_Print_String>
    1367:	bf 50 22 00 00       	mov    $0x2250,%edi
    136c:	e8 9f 05 00 00       	call   1910 <UVM_Print_String>
    1371:	bf 5c 22 00 00       	mov    $0x225c,%edi
    1376:	e8 95 05 00 00       	call   1910 <UVM_Print_String>
    137b:	bf 0b 01 00 00       	mov    $0x10b,%edi
    1380:	e8 5b 03 00 00       	call   16e0 <UVM_Print_Int>
    1385:	bf 64 22 00 00       	mov    $0x2264,%edi
    138a:	e8 81 05 00 00       	call   1910 <UVM_Print_String>
    138f:	bf 67 22 00 00       	mov    $0x2267,%edi
    1394:	e8 77 05 00 00       	call   1910 <UVM_Print_String>
    1399:	bf 73 22 00 00       	mov    $0x2273,%edi
    139e:	e8 6d 05 00 00       	call   1910 <UVM_Print_String>
    13a3:	bf 76 22 00 00       	mov    $0x2276,%edi
    13a8:	e8 63 05 00 00       	call   1910 <UVM_Print_String>
    13ad:	bf 64 22 00 00       	mov    $0x2264,%edi
    13b2:	e8 59 05 00 00       	call   1910 <UVM_Print_String>
    13b7:	eb fe                	jmp    13b7 <main+0xe27>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD4),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
    13b9:	bf 28 20 00 00       	mov    $0x2028,%edi
    13be:	e8 4d 05 00 00       	call   1910 <UVM_Print_String>
    13c3:	bf 50 22 00 00       	mov    $0x2250,%edi
    13c8:	e8 43 05 00 00       	call   1910 <UVM_Print_String>
    13cd:	bf 5c 22 00 00       	mov    $0x225c,%edi
    13d2:	e8 39 05 00 00       	call   1910 <UVM_Print_String>
    13d7:	bf 45 01 00 00       	mov    $0x145,%edi
    13dc:	e8 ff 02 00 00       	call   16e0 <UVM_Print_Int>
    13e1:	bf 64 22 00 00       	mov    $0x2264,%edi
    13e6:	e8 25 05 00 00       	call   1910 <UVM_Print_String>
    13eb:	bf 67 22 00 00       	mov    $0x2267,%edi
    13f0:	e8 1b 05 00 00       	call   1910 <UVM_Print_String>
    13f5:	bf 73 22 00 00       	mov    $0x2273,%edi
    13fa:	e8 11 05 00 00       	call   1910 <UVM_Print_String>
    13ff:	bf 76 22 00 00       	mov    $0x2276,%edi
    1404:	e8 07 05 00 00       	call   1910 <UVM_Print_String>
    1409:	bf 64 22 00 00       	mov    $0x2264,%edi
    140e:	e8 fd 04 00 00       	call   1910 <UVM_Print_String>
    1413:	eb fe                	jmp    1413 <main+0xe83>
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG2, Cur_Addr)>=0);
    1415:	bf 28 20 00 00       	mov    $0x2028,%edi
    141a:	e8 f1 04 00 00       	call   1910 <UVM_Print_String>
    141f:	bf 50 22 00 00       	mov    $0x2250,%edi
    1424:	e8 e7 04 00 00       	call   1910 <UVM_Print_String>
    1429:	bf 5c 22 00 00       	mov    $0x225c,%edi
    142e:	e8 dd 04 00 00       	call   1910 <UVM_Print_String>
    1433:	bf 53 01 00 00       	mov    $0x153,%edi
    1438:	e8 a3 02 00 00       	call   16e0 <UVM_Print_Int>
    143d:	bf 64 22 00 00       	mov    $0x2264,%edi
    1442:	e8 c9 04 00 00       	call   1910 <UVM_Print_String>
    1447:	bf 67 22 00 00       	mov    $0x2267,%edi
    144c:	e8 bf 04 00 00       	call   1910 <UVM_Print_String>
    1451:	bf 73 22 00 00       	mov    $0x2273,%edi
    1456:	e8 b5 04 00 00       	call   1910 <UVM_Print_String>
    145b:	bf 76 22 00 00       	mov    $0x2276,%edi
    1460:	e8 ab 04 00 00       	call   1910 <UVM_Print_String>
    1465:	bf 64 22 00 00       	mov    $0x2264,%edi
    146a:	e8 a1 04 00 00       	call   1910 <UVM_Print_String>
    146f:	eb fe                	jmp    146f <main+0xedf>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD4),(ptr_t)TEST_THD_FUNC4,15*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
    1471:	bf 28 20 00 00       	mov    $0x2028,%edi
    1476:	e8 95 04 00 00       	call   1910 <UVM_Print_String>
    147b:	bf 50 22 00 00       	mov    $0x2250,%edi
    1480:	e8 8b 04 00 00       	call   1910 <UVM_Print_String>
    1485:	bf 5c 22 00 00       	mov    $0x225c,%edi
    148a:	e8 81 04 00 00       	call   1910 <UVM_Print_String>
    148f:	bf 48 01 00 00       	mov    $0x148,%edi
    1494:	e8 47 02 00 00       	call   16e0 <UVM_Print_Int>
    1499:	bf 64 22 00 00       	mov    $0x2264,%edi
    149e:	e8 6d 04 00 00       	call   1910 <UVM_Print_String>
    14a3:	bf 67 22 00 00       	mov    $0x2267,%edi
    14a8:	e8 63 04 00 00       	call   1910 <UVM_Print_String>
    14ad:	bf 73 22 00 00       	mov    $0x2273,%edi
    14b2:	e8 59 04 00 00       	call   1910 <UVM_Print_String>
    14b7:	bf 76 22 00 00       	mov    $0x2276,%edi
    14bc:	e8 4f 04 00 00       	call   1910 <UVM_Print_String>
    14c1:	bf 64 22 00 00       	mov    $0x2264,%edi
    14c6:	e8 45 04 00 00       	call   1910 <UVM_Print_String>
    14cb:	eb fe                	jmp    14cb <main+0xf3b>
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD3),1)>=0);
    14cd:	bf 28 20 00 00       	mov    $0x2028,%edi
    14d2:	e8 39 04 00 00       	call   1910 <UVM_Print_String>
    14d7:	bf 50 22 00 00       	mov    $0x2250,%edi
    14dc:	e8 2f 04 00 00       	call   1910 <UVM_Print_String>
    14e1:	bf 5c 22 00 00       	mov    $0x225c,%edi
    14e6:	e8 25 04 00 00       	call   1910 <UVM_Print_String>
    14eb:	bf 58 01 00 00       	mov    $0x158,%edi
    14f0:	e8 eb 01 00 00       	call   16e0 <UVM_Print_Int>
    14f5:	bf 64 22 00 00       	mov    $0x2264,%edi
    14fa:	e8 11 04 00 00       	call   1910 <UVM_Print_String>
    14ff:	bf 67 22 00 00       	mov    $0x2267,%edi
    1504:	e8 07 04 00 00       	call   1910 <UVM_Print_String>
    1509:	bf 73 22 00 00       	mov    $0x2273,%edi
    150e:	e8 fd 03 00 00       	call   1910 <UVM_Print_String>
    1513:	bf 76 22 00 00       	mov    $0x2276,%edi
    1518:	e8 f3 03 00 00       	call   1910 <UVM_Print_String>
    151d:	bf 64 22 00 00       	mov    $0x2264,%edi
    1522:	e8 e9 03 00 00       	call   1910 <UVM_Print_String>
    1527:	eb fe                	jmp    1527 <main+0xf97>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD3),(ptr_t)TEST_SIG_FUNC2,14*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
    1529:	bf 28 20 00 00       	mov    $0x2028,%edi
    152e:	e8 dd 03 00 00       	call   1910 <UVM_Print_String>
    1533:	bf 50 22 00 00       	mov    $0x2250,%edi
    1538:	e8 d3 03 00 00       	call   1910 <UVM_Print_String>
    153d:	bf 5c 22 00 00       	mov    $0x225c,%edi
    1542:	e8 c9 03 00 00       	call   1910 <UVM_Print_String>
    1547:	bf 56 01 00 00       	mov    $0x156,%edi
    154c:	e8 8f 01 00 00       	call   16e0 <UVM_Print_Int>
    1551:	bf 64 22 00 00       	mov    $0x2264,%edi
    1556:	e8 b5 03 00 00       	call   1910 <UVM_Print_String>
    155b:	bf 67 22 00 00       	mov    $0x2267,%edi
    1560:	e8 ab 03 00 00       	call   1910 <UVM_Print_String>
    1565:	bf 73 22 00 00       	mov    $0x2273,%edi
    156a:	e8 a1 03 00 00       	call   1910 <UVM_Print_String>
    156f:	bf 76 22 00 00       	mov    $0x2276,%edi
    1574:	e8 97 03 00 00       	call   1910 <UVM_Print_String>
    1579:	bf 64 22 00 00       	mov    $0x2264,%edi
    157e:	e8 8d 03 00 00       	call   1910 <UVM_Print_String>
    1583:	eb fe                	jmp    1583 <main+0xff3>
        UVM_ASSERT(UVM_Inv_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_INV1, TEST_PROCESS, Cur_Addr)>=0);
    1585:	bf 28 20 00 00       	mov    $0x2028,%edi
    158a:	e8 81 03 00 00       	call   1910 <UVM_Print_String>
    158f:	bf 50 22 00 00       	mov    $0x2250,%edi
    1594:	e8 77 03 00 00       	call   1910 <UVM_Print_String>
    1599:	bf 5c 22 00 00       	mov    $0x225c,%edi
    159e:	e8 6d 03 00 00       	call   1910 <UVM_Print_String>
    15a3:	bf 63 01 00 00       	mov    $0x163,%edi
    15a8:	e8 33 01 00 00       	call   16e0 <UVM_Print_Int>
    15ad:	bf 64 22 00 00       	mov    $0x2264,%edi
    15b2:	e8 59 03 00 00       	call   1910 <UVM_Print_String>
    15b7:	bf 67 22 00 00       	mov    $0x2267,%edi
    15bc:	e8 4f 03 00 00       	call   1910 <UVM_Print_String>
    15c1:	bf 73 22 00 00       	mov    $0x2273,%edi
    15c6:	e8 45 03 00 00       	call   1910 <UVM_Print_String>
    15cb:	bf 76 22 00 00       	mov    $0x2276,%edi
    15d0:	e8 3b 03 00 00       	call   1910 <UVM_Print_String>
    15d5:	bf 64 22 00 00       	mov    $0x2264,%edi
    15da:	e8 31 03 00 00       	call   1910 <UVM_Print_String>
    15df:	eb fe                	jmp    15df <main+0x104f>
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD3),0)>=0);
    15e1:	bf 28 20 00 00       	mov    $0x2028,%edi
    15e6:	e8 25 03 00 00       	call   1910 <UVM_Print_String>
    15eb:	bf 50 22 00 00       	mov    $0x2250,%edi
    15f0:	e8 1b 03 00 00       	call   1910 <UVM_Print_String>
    15f5:	bf 5c 22 00 00       	mov    $0x225c,%edi
    15fa:	e8 11 03 00 00       	call   1910 <UVM_Print_String>
    15ff:	bf 5d 01 00 00       	mov    $0x15d,%edi
    1604:	e8 d7 00 00 00       	call   16e0 <UVM_Print_Int>
    1609:	bf 64 22 00 00       	mov    $0x2264,%edi
    160e:	e8 fd 02 00 00       	call   1910 <UVM_Print_String>
    1613:	bf 67 22 00 00       	mov    $0x2267,%edi
    1618:	e8 f3 02 00 00       	call   1910 <UVM_Print_String>
    161d:	bf 73 22 00 00       	mov    $0x2273,%edi
    1622:	e8 e9 02 00 00       	call   1910 <UVM_Print_String>
    1627:	bf 76 22 00 00       	mov    $0x2276,%edi
    162c:	e8 df 02 00 00       	call   1910 <UVM_Print_String>
    1631:	bf 64 22 00 00       	mov    $0x2264,%edi
    1636:	e8 d5 02 00 00       	call   1910 <UVM_Print_String>
    163b:	eb fe                	jmp    163b <main+0x10ab>
        UVM_ASSERT(UVM_Inv_Set(TEST_INV1,(ptr_t)TEST_INV1_FUNC,15*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
    163d:	bf 28 20 00 00       	mov    $0x2028,%edi
    1642:	e8 c9 02 00 00       	call   1910 <UVM_Print_String>
    1647:	bf 50 22 00 00       	mov    $0x2250,%edi
    164c:	e8 bf 02 00 00       	call   1910 <UVM_Print_String>
    1651:	bf 5c 22 00 00       	mov    $0x225c,%edi
    1656:	e8 b5 02 00 00       	call   1910 <UVM_Print_String>
    165b:	bf 66 01 00 00       	mov    $0x166,%edi
    1660:	e8 7b 00 00 00       	call   16e0 <UVM_Print_Int>
    1665:	bf 64 22 00 00       	mov    $0x2264,%edi
    166a:	e8 a1 02 00 00       	call   1910 <UVM_Print_String>
    166f:	bf 67 22 00 00       	mov    $0x2267,%edi
    1674:	e8 97 02 00 00       	call   1910 <UVM_Print_String>
    1679:	bf 73 22 00 00       	mov    $0x2273,%edi
    167e:	e8 8d 02 00 00       	call   1910 <UVM_Print_String>
    1683:	bf 76 22 00 00       	mov    $0x2276,%edi
    1688:	e8 83 02 00 00       	call   1910 <UVM_Print_String>
    168d:	bf 64 22 00 00       	mov    $0x2264,%edi
    1692:	e8 79 02 00 00       	call   1910 <UVM_Print_String>
    1697:	eb fe                	jmp    1697 <main+0x1107>
    1699:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000016a0 <UVM_List_Crt>:
Input       : volatile struct UVM_List* Head - The pointer to the list head.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Crt(volatile struct UVM_List* Head)
{
    16a0:	f3 0f 1e fa          	endbr64 
    Head->Prev=(struct UVM_List*)Head;
    16a4:	48 89 3f             	mov    %rdi,(%rdi)
    Head->Next=(struct UVM_List*)Head;
    16a7:	48 89 7f 08          	mov    %rdi,0x8(%rdi)
}
    16ab:	c3                   	ret    
    16ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000016b0 <UVM_List_Del>:
              volatile struct UVM_List* Next - The next node of the target node.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Del(volatile struct UVM_List* Prev,volatile struct UVM_List* Next)
{
    16b0:	f3 0f 1e fa          	endbr64 
    Next->Prev=(struct UVM_List*)Prev;
    16b4:	48 89 3e             	mov    %rdi,(%rsi)
    Prev->Next=(struct UVM_List*)Next;
    16b7:	48 89 77 08          	mov    %rsi,0x8(%rdi)
}
    16bb:	c3                   	ret    
    16bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000016c0 <UVM_List_Ins>:
Return      : None.
******************************************************************************/
void UVM_List_Ins(volatile struct UVM_List* New,
                  volatile struct UVM_List* Prev,
                  volatile struct UVM_List* Next)
{
    16c0:	f3 0f 1e fa          	endbr64 
    Next->Prev=(struct UVM_List*)New;
    16c4:	48 89 3a             	mov    %rdi,(%rdx)
    New->Next=(struct UVM_List*)Next;
    16c7:	48 89 57 08          	mov    %rdx,0x8(%rdi)
    New->Prev=(struct UVM_List*)Prev;
    16cb:	48 89 37             	mov    %rsi,(%rdi)
    Prev->Next=(struct UVM_List*)New;
    16ce:	48 89 7e 08          	mov    %rdi,0x8(%rsi)
}
    16d2:	c3                   	ret    
    16d3:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    16da:	00 00 00 00 
    16de:	66 90                	xchg   %ax,%ax

00000000000016e0 <UVM_Print_Int>:
Input       : cnt_t Int - The integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Int(cnt_t Int)
{
    16e0:	f3 0f 1e fa          	endbr64 
    16e4:	41 57                	push   %r15
    16e6:	41 56                	push   %r14
    16e8:	41 55                	push   %r13
    16ea:	41 54                	push   %r12
    16ec:	55                   	push   %rbp
    16ed:	53                   	push   %rbx
    16ee:	48 83 ec 08          	sub    $0x8,%rsp
    cnt_t Count;
    cnt_t Num;
    ptr_t Div;

    /* how many digits are there? */
    if(Int==0)
    16f2:	48 85 ff             	test   %rdi,%rdi
    16f5:	0f 84 4d 01 00 00    	je     1848 <UVM_Print_Int+0x168>
    {
        UVM_Putchar('0');
        return 1;
    }
    else if(Int<0)
    16fb:	0f 88 a7 00 00 00    	js     17a8 <UVM_Print_Int+0xc8>
    else
    {
        /* How many digits are there? */
        Count=0;
        Div=1;
        Iter=Int;
    1701:	48 89 fa             	mov    %rdi,%rdx
        Div=1;
    1704:	bb 01 00 00 00       	mov    $0x1,%ebx
        Count=0;
    1709:	45 31 e4             	xor    %r12d,%r12d
        while(Iter!=0)
        {
            Iter/=10;
    170c:	48 be cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rsi
    1713:	cc cc cc 
    1716:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    171d:	00 00 00 
    1720:	48 89 d0             	mov    %rdx,%rax
    1723:	48 89 d1             	mov    %rdx,%rcx
            Count++;
            Div*=10;
    1726:	48 8d 1c 9b          	lea    (%rbx,%rbx,4),%rbx
            Count++;
    172a:	49 83 c4 01          	add    $0x1,%r12
            Iter/=10;
    172e:	48 f7 e6             	mul    %rsi
            Div*=10;
    1731:	48 01 db             	add    %rbx,%rbx
            Iter/=10;
    1734:	48 c1 ea 03          	shr    $0x3,%rdx
        while(Iter!=0)
    1738:	48 83 f9 09          	cmp    $0x9,%rcx
    173c:	77 e2                	ja     1720 <UVM_Print_Int+0x40>
        while(Count>0)
        {
            Count--;
            UVM_Putchar(Iter/Div+'0');
            Iter=Iter%Div;
            Div/=10;
    173e:	48 bd cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rbp
    1745:	cc cc cc 
        Div/=10;
    1748:	48 89 d8             	mov    %rbx,%rax
            Count++;
    174b:	4d 89 e6             	mov    %r12,%r14
        Div/=10;
    174e:	48 f7 e6             	mul    %rsi
    1751:	48 89 d3             	mov    %rdx,%rbx
    1754:	48 c1 eb 03          	shr    $0x3,%rbx
        while(Count>0)
    1758:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    175f:	00 
            Count--;
    1760:	48 89 f8             	mov    %rdi,%rax
    1763:	31 d2                	xor    %edx,%edx
    1765:	49 83 ee 01          	sub    $0x1,%r14
            UVM_Putchar(Iter/Div+'0');
    1769:	48 f7 f3             	div    %rbx
    176c:	48 89 c7             	mov    %rax,%rdi
    176f:	49 89 d5             	mov    %rdx,%r13
    1772:	83 c7 30             	add    $0x30,%edi
    1775:	40 0f be ff          	movsbl %dil,%edi
    1779:	e8 b2 07 00 00       	call   1f30 <UVM_Putchar>
            Div/=10;
    177e:	48 89 d8             	mov    %rbx,%rax
            Iter=Iter%Div;
    1781:	4c 89 ef             	mov    %r13,%rdi
            Div/=10;
    1784:	48 f7 e5             	mul    %rbp
    1787:	48 89 d3             	mov    %rdx,%rbx
    178a:	48 c1 eb 03          	shr    $0x3,%rbx
        while(Count>0)
    178e:	4d 85 f6             	test   %r14,%r14
    1791:	75 cd                	jne    1760 <UVM_Print_Int+0x80>
        }
    }
    
    return Num;
}
    1793:	48 83 c4 08          	add    $0x8,%rsp
    1797:	4c 89 e0             	mov    %r12,%rax
    179a:	5b                   	pop    %rbx
    179b:	5d                   	pop    %rbp
    179c:	41 5c                	pop    %r12
    179e:	41 5d                	pop    %r13
    17a0:	41 5e                	pop    %r14
    17a2:	41 5f                	pop    %r15
    17a4:	c3                   	ret    
    17a5:	0f 1f 00             	nopl   (%rax)
        Iter=-Int;
    17a8:	48 f7 df             	neg    %rdi
        Div=1;
    17ab:	bb 01 00 00 00       	mov    $0x1,%ebx
        Count=0;
    17b0:	45 31 ff             	xor    %r15d,%r15d
            Iter/=10;
    17b3:	48 be cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rsi
    17ba:	cc cc cc 
        Iter=-Int;
    17bd:	49 89 fe             	mov    %rdi,%r14
    17c0:	48 89 fa             	mov    %rdi,%rdx
    17c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
            Iter/=10;
    17c8:	48 89 d0             	mov    %rdx,%rax
    17cb:	48 89 d1             	mov    %rdx,%rcx
            Div*=10;
    17ce:	48 8d 1c 9b          	lea    (%rbx,%rbx,4),%rbx
    17d2:	4d 89 fc             	mov    %r15,%r12
            Iter/=10;
    17d5:	48 f7 e6             	mul    %rsi
            Count++;
    17d8:	49 83 c7 01          	add    $0x1,%r15
            Div*=10;
    17dc:	48 01 db             	add    %rbx,%rbx
            Iter/=10;
    17df:	48 c1 ea 03          	shr    $0x3,%rdx
        while(Iter!=0)
    17e3:	48 83 f9 09          	cmp    $0x9,%rcx
    17e7:	77 df                	ja     17c8 <UVM_Print_Int+0xe8>
        Div/=10;
    17e9:	48 89 d8             	mov    %rbx,%rax
        UVM_Putchar('-');
    17ec:	bf 2d 00 00 00       	mov    $0x2d,%edi
        Num=Count+1;
    17f1:	49 83 c4 02          	add    $0x2,%r12
            Div/=10;
    17f5:	49 bd cd cc cc cc cc 	movabs $0xcccccccccccccccd,%r13
    17fc:	cc cc cc 
        Div/=10;
    17ff:	48 f7 e6             	mul    %rsi
    1802:	48 89 d3             	mov    %rdx,%rbx
        UVM_Putchar('-');
    1805:	e8 26 07 00 00       	call   1f30 <UVM_Putchar>
        Div/=10;
    180a:	48 c1 eb 03          	shr    $0x3,%rbx
        while(Count>0)
    180e:	66 90                	xchg   %ax,%ax
            Count--;
    1810:	4c 89 f0             	mov    %r14,%rax
    1813:	31 d2                	xor    %edx,%edx
    1815:	49 83 ef 01          	sub    $0x1,%r15
            UVM_Putchar(Iter/Div+'0');
    1819:	48 f7 f3             	div    %rbx
    181c:	83 c0 30             	add    $0x30,%eax
    181f:	49 89 d6             	mov    %rdx,%r14
    1822:	0f be f8             	movsbl %al,%edi
    1825:	e8 06 07 00 00       	call   1f30 <UVM_Putchar>
            Div/=10;
    182a:	48 89 d8             	mov    %rbx,%rax
    182d:	49 f7 e5             	mul    %r13
    1830:	48 89 d3             	mov    %rdx,%rbx
    1833:	48 c1 eb 03          	shr    $0x3,%rbx
        while(Count>0)
    1837:	4d 85 ff             	test   %r15,%r15
    183a:	75 d4                	jne    1810 <UVM_Print_Int+0x130>
    183c:	e9 52 ff ff ff       	jmp    1793 <UVM_Print_Int+0xb3>
    1841:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
        UVM_Putchar('0');
    1848:	bf 30 00 00 00       	mov    $0x30,%edi
        return 1;
    184d:	41 bc 01 00 00 00    	mov    $0x1,%r12d
        UVM_Putchar('0');
    1853:	e8 d8 06 00 00       	call   1f30 <UVM_Putchar>
        return 1;
    1858:	e9 36 ff ff ff       	jmp    1793 <UVM_Print_Int+0xb3>
    185d:	0f 1f 00             	nopl   (%rax)

0000000000001860 <UVM_Print_Uint>:
Input       : ptr_t Uint - The unsigned integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Uint(ptr_t Uint)
{
    1860:	f3 0f 1e fa          	endbr64 
    1864:	41 54                	push   %r12
    1866:	55                   	push   %rbp
    1867:	53                   	push   %rbx
    ptr_t Iter;
    cnt_t Count;
    cnt_t Num;
    
    /* how many digits are there? */
    if(Uint==0)
    1868:	48 85 ff             	test   %rdi,%rdi
    186b:	0f 84 87 00 00 00    	je     18f8 <UVM_Print_Uint+0x98>
    else
    {
        /* Filter out all the zeroes */
        Count=0;
        Iter=Uint;
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    1871:	48 89 f9             	mov    %rdi,%rcx
        Count=0;
    1874:	31 d2                	xor    %edx,%edx
    1876:	48 89 fd             	mov    %rdi,%rbp
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    1879:	48 89 f8             	mov    %rdi,%rax
    187c:	48 c1 e9 3c          	shr    $0x3c,%rcx
        {
            Iter<<=4;
            Count++;
        }
        /* Count is the number of pts to print */
        Count=sizeof(ptr_t)*2-Count;
    1880:	41 bc 10 00 00 00    	mov    $0x10,%r12d
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    1886:	75 27                	jne    18af <UVM_Print_Uint+0x4f>
    1888:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    188f:	00 
            Iter<<=4;
    1890:	48 c1 e0 04          	shl    $0x4,%rax
            Count++;
    1894:	48 83 c2 01          	add    $0x1,%rdx
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    1898:	48 89 c6             	mov    %rax,%rsi
    189b:	48 c1 ee 3c          	shr    $0x3c,%rsi
    189f:	74 ef                	je     1890 <UVM_Print_Uint+0x30>
        Count=sizeof(ptr_t)*2-Count;
    18a1:	41 bc 10 00 00 00    	mov    $0x10,%r12d
    18a7:	49 29 d4             	sub    %rdx,%r12
        Num=Count;
        while(Count>0)
    18aa:	4d 85 e4             	test   %r12,%r12
    18ad:	7e 3d                	jle    18ec <UVM_Print_Uint+0x8c>
        Count=sizeof(ptr_t)*2-Count;
    18af:	4c 89 e3             	mov    %r12,%rbx
    18b2:	eb 11                	jmp    18c5 <UVM_Print_Uint+0x65>
    18b4:	0f 1f 40 00          	nopl   0x0(%rax)
        {
            Count--;
            Iter=(Uint>>(Count*4))&0x0F;
            if(Iter<10)
                UVM_Putchar('0'+Iter);
    18b8:	8d 78 30             	lea    0x30(%rax),%edi
    18bb:	e8 70 06 00 00       	call   1f30 <UVM_Putchar>
        while(Count>0)
    18c0:	48 85 db             	test   %rbx,%rbx
    18c3:	74 27                	je     18ec <UVM_Print_Uint+0x8c>
            Count--;
    18c5:	48 83 eb 01          	sub    $0x1,%rbx
            Iter=(Uint>>(Count*4))&0x0F;
    18c9:	48 89 e8             	mov    %rbp,%rax
    18cc:	8d 0c 9d 00 00 00 00 	lea    0x0(,%rbx,4),%ecx
    18d3:	48 d3 e8             	shr    %cl,%rax
    18d6:	83 e0 0f             	and    $0xf,%eax
            if(Iter<10)
    18d9:	48 83 f8 09          	cmp    $0x9,%rax
    18dd:	76 d9                	jbe    18b8 <UVM_Print_Uint+0x58>
            else
                UVM_Putchar('A'+Iter-10);
    18df:	8d 78 37             	lea    0x37(%rax),%edi
    18e2:	e8 49 06 00 00       	call   1f30 <UVM_Putchar>
        while(Count>0)
    18e7:	48 85 db             	test   %rbx,%rbx
    18ea:	75 d9                	jne    18c5 <UVM_Print_Uint+0x65>
        }
    }
    
    return Num;
}
    18ec:	4c 89 e0             	mov    %r12,%rax
    18ef:	5b                   	pop    %rbx
    18f0:	5d                   	pop    %rbp
    18f1:	41 5c                	pop    %r12
    18f3:	c3                   	ret    
    18f4:	0f 1f 40 00          	nopl   0x0(%rax)
        return 1;
    18f8:	41 bc 01 00 00 00    	mov    $0x1,%r12d
        UVM_Putchar('0');
    18fe:	bf 30 00 00 00       	mov    $0x30,%edi
    1903:	e8 28 06 00 00       	call   1f30 <UVM_Putchar>
}
    1908:	4c 89 e0             	mov    %r12,%rax
    190b:	5b                   	pop    %rbx
    190c:	5d                   	pop    %rbp
    190d:	41 5c                	pop    %r12
    190f:	c3                   	ret    

0000000000001910 <UVM_Print_String>:
Input       : s8* String - The string to print.
Output      : None.
Return      : cnt_t - The length of the string printed, the '\0' is not included.
******************************************************************************/
cnt_t UVM_Print_String(s8* String)
{
    1910:	f3 0f 1e fa          	endbr64 
    1914:	41 54                	push   %r12
    cnt_t Count;
    
    Count=0;
    1916:	45 31 e4             	xor    %r12d,%r12d
{
    1919:	53                   	push   %rbx
    191a:	48 89 fb             	mov    %rdi,%rbx
    191d:	48 83 ec 08          	sub    $0x8,%rsp
    1921:	eb 17                	jmp    193a <UVM_Print_String+0x2a>
    1923:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    while(Count<UVM_USER_DEBUG_MAX_STR)
    {
        if(String[Count]=='\0')
            break;
        
        UVM_Putchar(String[Count++]);
    1928:	49 83 c4 01          	add    $0x1,%r12
    192c:	e8 ff 05 00 00       	call   1f30 <UVM_Putchar>
    while(Count<UVM_USER_DEBUG_MAX_STR)
    1931:	49 81 fc 80 00 00 00 	cmp    $0x80,%r12
    1938:	74 0a                	je     1944 <UVM_Print_String+0x34>
        if(String[Count]=='\0')
    193a:	42 0f be 3c 23       	movsbl (%rbx,%r12,1),%edi
    193f:	40 84 ff             	test   %dil,%dil
    1942:	75 e4                	jne    1928 <UVM_Print_String+0x18>
    }

    return Count;
}
    1944:	48 83 c4 08          	add    $0x8,%rsp
    1948:	4c 89 e0             	mov    %r12,%rax
    194b:	5b                   	pop    %rbx
    194c:	41 5c                	pop    %r12
    194e:	c3                   	ret    
    194f:	90                   	nop

0000000000001950 <UVM_Captbl_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, 
                     cid_t Cap_Captbl, ptr_t Vaddr, ptr_t Entry_Num)
{
    1950:	f3 0f 1e fa          	endbr64 
    1954:	49 89 d1             	mov    %rdx,%r9
    return UVM_CAP_OP(RME_SVC_CPT_CRT, Cap_Captbl_Crt,
    1957:	48 c1 e6 20          	shl    $0x20,%rsi
{
    195b:	48 89 ca             	mov    %rcx,%rdx
    return UVM_CAP_OP(RME_SVC_CPT_CRT, Cap_Captbl_Crt,
    195e:	48 b8 00 00 00 00 0a 	movabs $0xa00000000,%rax
    1965:	00 00 00 
    1968:	45 89 c9             	mov    %r9d,%r9d
{
    196b:	4c 89 c1             	mov    %r8,%rcx
    return UVM_CAP_OP(RME_SVC_CPT_CRT, Cap_Captbl_Crt,
    196e:	48 09 c7             	or     %rax,%rdi
    1971:	4c 09 ce             	or     %r9,%rsi
    1974:	e9 74 e7 ff ff       	jmp    ed <UVM_Svc>
    1979:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001980 <UVM_Captbl_Del>:
              cid_t Cap_Del - The capability to the capability table to be deleted. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Del(cid_t Cap_Captbl_Del, cid_t Cap_Del)
{
    1980:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_CPT_DEL, Cap_Captbl_Del,
    1984:	48 b8 00 00 00 00 0b 	movabs $0xb00000000,%rax
    198b:	00 00 00 
    198e:	31 c9                	xor    %ecx,%ecx
    1990:	31 d2                	xor    %edx,%edx
    1992:	48 09 c7             	or     %rax,%rdi
    1995:	e9 53 e7 ff ff       	jmp    ed <UVM_Svc>
    199a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000019a0 <UVM_Captbl_Frz>:
              cid_t Cap_Frz - The cap to the kernel object being freezed. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Frz(cid_t Cap_Captbl_Frz, cid_t Cap_Frz)
{
    19a0:	f3 0f 1e fa          	endbr64 
        return UVM_CAP_OP(RME_SVC_CPT_FRZ, Cap_Captbl_Frz,
    19a4:	48 b8 00 00 00 00 0c 	movabs $0xc00000000,%rax
    19ab:	00 00 00 
    19ae:	31 c9                	xor    %ecx,%ecx
    19b0:	31 d2                	xor    %edx,%edx
    19b2:	48 09 c7             	or     %rax,%rdi
    19b5:	e9 33 e7 ff ff       	jmp    ed <UVM_Svc>
    19ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000019c0 <UVM_Captbl_Add>:
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Add(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                     cid_t Cap_Captbl_Src, cid_t Cap_Src, ptr_t Flags)
{
    19c0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    19c4:	48 c1 e7 20          	shl    $0x20,%rdi
{
    19c8:	49 89 c9             	mov    %rcx,%r9
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    19cb:	48 c1 e2 20          	shl    $0x20,%rdx
    19cf:	89 f6                	mov    %esi,%esi
    19d1:	45 89 c9             	mov    %r9d,%r9d
    19d4:	48 09 fe             	or     %rdi,%rsi
{
    19d7:	4c 89 c1             	mov    %r8,%rcx
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    19da:	48 bf 00 00 00 00 0d 	movabs $0xd00000000,%rdi
    19e1:	00 00 00 
    19e4:	4c 09 ca             	or     %r9,%rdx
    19e7:	e9 01 e7 ff ff       	jmp    ed <UVM_Svc>
    19ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000019f0 <UVM_Captbl_Pgtbl>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Pgtbl(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                       cid_t Cap_Captbl_Src, cid_t Cap_Src,
                       ptr_t Start, ptr_t End, ptr_t Flags)
{
    19f0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    19f4:	49 c1 e1 24          	shl    $0x24,%r9
{
    19f8:	49 89 f2             	mov    %rsi,%r10
    19fb:	49 89 cb             	mov    %rcx,%r11
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    19fe:	48 89 fe             	mov    %rdi,%rsi
    1a01:	4c 89 c1             	mov    %r8,%rcx
    1a04:	48 c1 e2 20          	shl    $0x20,%rdx
    1a08:	45 89 db             	mov    %r11d,%r11d
    1a0b:	45 89 d2             	mov    %r10d,%r10d
    1a0e:	48 c1 e1 08          	shl    $0x8,%rcx
    1a12:	48 c1 e6 20          	shl    $0x20,%rsi
    1a16:	4c 09 da             	or     %r11,%rdx
    1a19:	48 0b 4c 24 08       	or     0x8(%rsp),%rcx
    1a1e:	48 bf 00 00 00 00 0d 	movabs $0xd00000000,%rdi
    1a25:	00 00 00 
    1a28:	4c 09 c9             	or     %r9,%rcx
    1a2b:	4c 09 d6             	or     %r10,%rsi
    1a2e:	e9 ba e6 ff ff       	jmp    ed <UVM_Svc>
    1a33:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1a3a:	00 00 00 00 
    1a3e:	66 90                	xchg   %ax,%ax

0000000000001a40 <UVM_Captbl_Kern>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kern(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End)
{
    1a40:	f3 0f 1e fa          	endbr64 
    1a44:	49 89 f2             	mov    %rsi,%r10
    1a47:	49 89 cb             	mov    %rcx,%r11
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    1a4a:	48 89 fe             	mov    %rdi,%rsi
    1a4d:	4c 89 c9             	mov    %r9,%rcx
    1a50:	48 c1 e1 20          	shl    $0x20,%rcx
    1a54:	48 c1 e2 20          	shl    $0x20,%rdx
    1a58:	45 89 db             	mov    %r11d,%r11d
    1a5b:	45 89 d2             	mov    %r10d,%r10d
    1a5e:	48 c1 e6 20          	shl    $0x20,%rsi
    1a62:	4c 09 c1             	or     %r8,%rcx
    1a65:	4c 09 da             	or     %r11,%rdx
    1a68:	48 bf 00 00 00 00 0d 	movabs $0xd00000000,%rdi
    1a6f:	00 00 00 
    1a72:	4c 09 d6             	or     %r10,%rsi
    1a75:	e9 73 e6 ff ff       	jmp    ed <UVM_Svc>
    1a7a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001a80 <UVM_Captbl_Kmem>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kmem(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End, ptr_t Flags)
{
    1a80:	f3 0f 1e fa          	endbr64 
    1a84:	49 89 cb             	mov    %rcx,%r11
    1a87:	49 89 f2             	mov    %rsi,%r10
    return UVM_CAP_OP(UVM_KMEM_SVC(End,RME_SVC_CPT_ADD), UVM_KMEM_CAPID(Start,Flags),
    1a8a:	4c 89 c0             	mov    %r8,%rax
    1a8d:	48 89 fe             	mov    %rdi,%rsi
    1a90:	4c 89 c7             	mov    %r8,%rdi
    1a93:	48 c1 e8 20          	shr    $0x20,%rax
    1a97:	45 89 db             	mov    %r11d,%r11d
    1a9a:	45 89 d2             	mov    %r10d,%r10d
    1a9d:	48 c1 e2 20          	shl    $0x20,%rdx
    1aa1:	83 e7 c0             	and    $0xffffffc0,%edi
    1aa4:	48 c1 e6 20          	shl    $0x20,%rsi
    1aa8:	48 b9 00 00 00 00 ff 	movabs $0xffffffff00000000,%rcx
    1aaf:	ff ff ff 
    1ab2:	4c 21 c9             	and    %r9,%rcx
    1ab5:	49 c1 e9 06          	shr    $0x6,%r9
    1ab9:	4c 09 da             	or     %r11,%rdx
    1abc:	4c 09 d6             	or     %r10,%rsi
    1abf:	49 c1 e1 26          	shl    $0x26,%r9
    1ac3:	48 09 c1             	or     %rax,%rcx
    1ac6:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    1acd:	00 00 00 
    1ad0:	4c 09 cf             	or     %r9,%rdi
    1ad3:	48 0b 7c 24 08       	or     0x8(%rsp),%rdi
    1ad8:	48 09 c7             	or     %rax,%rdi
    1adb:	e9 0d e6 ff ff       	jmp    ed <UVM_Svc>

0000000000001ae0 <UVM_Captbl_Rem>:
              cid_t Cap_Rem - The capability slot you want to remove. 1-Level.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Rem(cid_t Cap_Captbl_Rem, cid_t Cap_Rem)
{
    1ae0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_CPT_REM, Cap_Captbl_Rem,
    1ae4:	48 b8 00 00 00 00 0e 	movabs $0xe00000000,%rax
    1aeb:	00 00 00 
    1aee:	31 c9                	xor    %ecx,%ecx
    1af0:	31 d2                	xor    %edx,%edx
    1af2:	48 09 c7             	or     %rax,%rdi
    1af5:	e9 f3 e5 ff ff       	jmp    ed <UVM_Svc>
    1afa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001b00 <UVM_Kern_Act>:
                      kernel function ever causes a context switch, it is responsible
                      for setting the return value. On failure, a context switch 
                      in the kernel fucntion is banned.
******************************************************************************/
ret_t UVM_Kern_Act(cid_t Cap_Kern, ptr_t Func_ID, ptr_t Sub_ID, ptr_t Param1, ptr_t Param2)
{
    1b00:	f3 0f 1e fa          	endbr64 
    1b04:	49 89 c9             	mov    %rcx,%r9
    return UVM_CAP_OP(RME_SVC_KFN, Cap_Kern,
    1b07:	48 c1 e2 20          	shl    $0x20,%rdx
    1b0b:	89 f6                	mov    %esi,%esi
{
    1b0d:	4c 89 c1             	mov    %r8,%rcx
    return UVM_CAP_OP(RME_SVC_KFN, Cap_Kern,
    1b10:	48 09 d6             	or     %rdx,%rsi
    1b13:	48 0f ba ef 22       	bts    $0x22,%rdi
    1b18:	4c 89 ca             	mov    %r9,%rdx
    1b1b:	e9 cd e5 ff ff       	jmp    ed <UVM_Svc>

0000000000001b20 <UVM_Pgtbl_Crt>:
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Pgtbl, 
                    ptr_t Vaddr, ptr_t Start_Addr, ptr_t Top_Flag,
                    ptr_t Size_Order, ptr_t Num_Order)
{
    1b20:	f3 0f 1e fa          	endbr64 
    1b24:	49 89 fb             	mov    %rdi,%r11
    
    return UVM_CAP_OP(UVM_PGTBL_SVC(Num_Order,RME_SVC_PGT_CRT), Cap_Captbl,
    1b27:	48 c1 e2 10          	shl    $0x10,%rdx
    1b2b:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
{
    1b30:	49 89 ca             	mov    %rcx,%r10
    return UVM_CAP_OP(UVM_PGTBL_SVC(Num_Order,RME_SVC_PGT_CRT), Cap_Captbl,
    1b33:	0f b7 44 24 08       	movzwl 0x8(%rsp),%eax
    1b38:	89 d2                	mov    %edx,%edx
    1b3a:	48 c1 e6 20          	shl    $0x20,%rsi
    1b3e:	4c 89 c1             	mov    %r8,%rcx
    1b41:	48 09 d6             	or     %rdx,%rsi
    1b44:	48 c1 e7 30          	shl    $0x30,%rdi
    1b48:	4c 09 c9             	or     %r9,%rcx
    1b4b:	4c 89 d2             	mov    %r10,%rdx
    1b4e:	48 09 c6             	or     %rax,%rsi
    1b51:	4c 09 df             	or     %r11,%rdi
    1b54:	48 b8 00 00 00 00 0f 	movabs $0xf00000000,%rax
    1b5b:	00 00 00 
    1b5e:	48 09 c7             	or     %rax,%rdi
    1b61:	e9 87 e5 ff ff       	jmp    ed <UVM_Svc>
    1b66:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    1b6d:	00 00 00 

0000000000001b70 <UVM_Pgtbl_Del>:
                                page table capability to be in. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Del(cid_t Cap_Captbl, cid_t Cap_Pgtbl)
{
    1b70:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_PGT_DEL, Cap_Captbl,
    1b74:	48 0f ba ef 24       	bts    $0x24,%rdi
    1b79:	31 c9                	xor    %ecx,%ecx
    1b7b:	31 d2                	xor    %edx,%edx
    1b7d:	e9 6b e5 ff ff       	jmp    ed <UVM_Svc>
    1b82:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1b89:	00 00 00 00 
    1b8d:	0f 1f 00             	nopl   (%rax)

0000000000001b90 <UVM_Pgtbl_Add>:
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Add(cid_t Cap_Pgtbl_Dst, ptr_t Pos_Dst, ptr_t Flags_Dst,
                    cid_t Cap_Pgtbl_Src, ptr_t Pos_Src, ptr_t Index)
{
    1b90:	f3 0f 1e fa          	endbr64 
    1b94:	49 89 d2             	mov    %rdx,%r10
    return UVM_CAP_OP(RME_SVC_PGT_ADD, Flags_Dst,
    1b97:	48 c1 e1 20          	shl    $0x20,%rcx
    1b9b:	89 f6                	mov    %esi,%esi
    1b9d:	45 89 c0             	mov    %r8d,%r8d
    1ba0:	48 c1 e7 20          	shl    $0x20,%rdi
    1ba4:	48 89 ca             	mov    %rcx,%rdx
    1ba7:	4c 89 c9             	mov    %r9,%rcx
    1baa:	48 b8 00 00 00 00 11 	movabs $0x1100000000,%rax
    1bb1:	00 00 00 
    1bb4:	48 09 fe             	or     %rdi,%rsi
    1bb7:	4c 89 d7             	mov    %r10,%rdi
    1bba:	4c 09 c2             	or     %r8,%rdx
    1bbd:	48 09 c7             	or     %rax,%rdi
    1bc0:	e9 28 e5 ff ff       	jmp    ed <UVM_Svc>
    1bc5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1bcc:	00 00 00 00 

0000000000001bd0 <UVM_Pgtbl_Rem>:
              ptr_t Pos - The virtual address position to unmap from.
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Rem(cid_t Cap_Pgtbl, ptr_t Pos)
{
    1bd0:	f3 0f 1e fa          	endbr64 
    1bd4:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_PGT_REM, 0,
    1bd7:	31 c9                	xor    %ecx,%ecx
    1bd9:	48 89 fe             	mov    %rdi,%rsi
    1bdc:	48 bf 00 00 00 00 12 	movabs $0x1200000000,%rdi
    1be3:	00 00 00 
    1be6:	e9 02 e5 ff ff       	jmp    ed <UVM_Svc>
    1beb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001bf0 <UVM_Pgtbl_Con>:
              ptr_t Flags_Child - This have no effect on MPU-based architectures.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Con(cid_t Cap_Pgtbl_Parent, ptr_t Pos, cid_t Cap_Pgtbl_Child, ptr_t Flags_Child)
{
    1bf0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_PGT_CON, 0,
    1bf4:	48 c1 e7 20          	shl    $0x20,%rdi
{
    1bf8:	49 89 f0             	mov    %rsi,%r8
    return UVM_CAP_OP(RME_SVC_PGT_CON, 0,
    1bfb:	89 d2                	mov    %edx,%edx
    1bfd:	48 89 fe             	mov    %rdi,%rsi
    1c00:	48 bf 00 00 00 00 13 	movabs $0x1300000000,%rdi
    1c07:	00 00 00 
    1c0a:	48 09 d6             	or     %rdx,%rsi
    1c0d:	4c 89 c2             	mov    %r8,%rdx
    1c10:	e9 d8 e4 ff ff       	jmp    ed <UVM_Svc>
    1c15:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1c1c:	00 00 00 00 

0000000000001c20 <UVM_Pgtbl_Des>:
                          table from.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Des(cid_t Cap_Pgtbl, ptr_t Pos)
{
    1c20:	f3 0f 1e fa          	endbr64 
    1c24:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_PGT_DES, 0,
    1c27:	31 c9                	xor    %ecx,%ecx
    1c29:	48 89 fe             	mov    %rdi,%rsi
    1c2c:	48 bf 00 00 00 00 14 	movabs $0x1400000000,%rdi
    1c33:	00 00 00 
    1c36:	e9 b2 e4 ff ff       	jmp    ed <UVM_Svc>
    1c3b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001c40 <UVM_Proc_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, cid_t Cap_Proc,
                   cid_t Cap_Captbl, cid_t Cap_Pgtbl, ptr_t Vaddr)
{
    1c40:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_PRC_CRT, Cap_Captbl_Crt,
    1c44:	48 b8 00 00 00 00 15 	movabs $0x1500000000,%rax
    1c4b:	00 00 00 
{
    1c4e:	48 89 d6             	mov    %rdx,%rsi
    1c51:	48 89 ca             	mov    %rcx,%rdx
    1c54:	4c 89 c1             	mov    %r8,%rcx
    return UVM_CAP_OP(RME_SVC_PRC_CRT, Cap_Captbl_Crt,
    1c57:	48 09 c7             	or     %rax,%rdi
    1c5a:	e9 8e e4 ff ff       	jmp    ed <UVM_Svc>
    1c5f:	90                   	nop

0000000000001c60 <UVM_Proc_Del>:
              cid_t Cap_Proc - The capability to the process. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Del(cid_t Cap_Captbl, cid_t Cap_Proc)
{
    1c60:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_PRC_DEL, Cap_Captbl,
    1c64:	48 b8 00 00 00 00 16 	movabs $0x1600000000,%rax
    1c6b:	00 00 00 
    1c6e:	31 c9                	xor    %ecx,%ecx
    1c70:	31 d2                	xor    %edx,%edx
    1c72:	48 09 c7             	or     %rax,%rdi
    1c75:	e9 73 e4 ff ff       	jmp    ed <UVM_Svc>
    1c7a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001c80 <UVM_Proc_Cpt>:
                                 this process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Cpt(cid_t Cap_Proc, cid_t Cap_Captbl)
{
    1c80:	f3 0f 1e fa          	endbr64 
    1c84:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_PRC_CPT, 0,
    1c87:	31 c9                	xor    %ecx,%ecx
    1c89:	48 89 fe             	mov    %rdi,%rsi
    1c8c:	48 bf 00 00 00 00 17 	movabs $0x1700000000,%rdi
    1c93:	00 00 00 
    1c96:	e9 52 e4 ff ff       	jmp    ed <UVM_Svc>
    1c9b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001ca0 <UVM_Proc_Pgt>:
                                process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Pgt(cid_t Cap_Proc, cid_t Cap_Pgtbl)
{
    1ca0:	f3 0f 1e fa          	endbr64 
    1ca4:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_PRC_PGT, 0,
    1ca7:	31 c9                	xor    %ecx,%ecx
    1ca9:	48 89 fe             	mov    %rdi,%rsi
    1cac:	48 bf 00 00 00 00 18 	movabs $0x1800000000,%rdi
    1cb3:	00 00 00 
    1cb6:	e9 32 e4 ff ff       	jmp    ed <UVM_Svc>
    1cbb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001cc0 <UVM_Thd_Crt>:
Output      : None.
Return      : ret_t - If successful, the Thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Thd,
                  cid_t Cap_Proc, ptr_t Max_Prio, ptr_t Vaddr)
{
    1cc0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_THD_CRT, Cap_Captbl, 
    1cc4:	48 c1 e1 20          	shl    $0x20,%rcx
{
    1cc8:	49 89 d2             	mov    %rdx,%r10
    return UVM_CAP_OP(RME_SVC_THD_CRT, Cap_Captbl, 
    1ccb:	45 89 c0             	mov    %r8d,%r8d
    1cce:	48 c1 e6 20          	shl    $0x20,%rsi
    1cd2:	48 b8 00 00 00 00 19 	movabs $0x1900000000,%rax
    1cd9:	00 00 00 
    1cdc:	48 89 ca             	mov    %rcx,%rdx
    1cdf:	45 89 d2             	mov    %r10d,%r10d
    1ce2:	4c 89 c9             	mov    %r9,%rcx
    1ce5:	4c 09 c2             	or     %r8,%rdx
    1ce8:	4c 09 d6             	or     %r10,%rsi
    1ceb:	48 09 c7             	or     %rax,%rdi
    1cee:	e9 fa e3 ff ff       	jmp    ed <UVM_Svc>
    1cf3:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1cfa:	00 00 00 00 
    1cfe:	66 90                	xchg   %ax,%ax

0000000000001d00 <UVM_Thd_Del>:
              cid_t Cap_Thd - The capability to the thread in the captbl. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Del(cid_t Cap_Captbl, cid_t Cap_Thd)
{
    1d00:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_THD_DEL, Cap_Captbl,
    1d04:	48 b8 00 00 00 00 1a 	movabs $0x1a00000000,%rax
    1d0b:	00 00 00 
    1d0e:	31 c9                	xor    %ecx,%ecx
    1d10:	31 d2                	xor    %edx,%edx
    1d12:	48 09 c7             	or     %rax,%rdi
    1d15:	e9 d3 e3 ff ff       	jmp    ed <UVM_Svc>
    1d1a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001d20 <UVM_Thd_Exec_Set>:
              ptr_t Param - The parameter of the thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Exec_Set(cid_t Cap_Thd, ptr_t Entry, ptr_t Stack, ptr_t Param)
{
    1d20:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, Cap_Thd,
    1d24:	48 b8 00 00 00 00 06 	movabs $0x600000000,%rax
    1d2b:	00 00 00 
    1d2e:	48 09 c7             	or     %rax,%rdi
    1d31:	e9 b7 e3 ff ff       	jmp    ed <UVM_Svc>
    1d36:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    1d3d:	00 00 00 

0000000000001d40 <UVM_Thd_Hyp_Set>:
                            thread's register sets.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Hyp_Set(cid_t Cap_Thd, ptr_t Kaddr)
{
    1d40:	f3 0f 1e fa          	endbr64 
    1d44:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, 0,
    1d47:	31 c9                	xor    %ecx,%ecx
    1d49:	48 89 fe             	mov    %rdi,%rsi
    1d4c:	48 bf 00 00 00 00 06 	movabs $0x600000000,%rdi
    1d53:	00 00 00 
    1d56:	e9 92 e3 ff ff       	jmp    ed <UVM_Svc>
    1d5b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001d60 <UVM_Thd_Sched_Bind>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Bind(cid_t Cap_Thd, cid_t Cap_Thd_Sched, cid_t Cap_Sig, tid_t TID, ptr_t Prio)
{
    1d60:	f3 0f 1e fa          	endbr64 
    1d64:	49 89 d1             	mov    %rdx,%r9
    return UVM_CAP_OP(RME_SVC_THD_SCHED_BIND, Cap_Thd,
    1d67:	48 c1 e6 20          	shl    $0x20,%rsi
{
    1d6b:	48 89 ca             	mov    %rcx,%rdx
    return UVM_CAP_OP(RME_SVC_THD_SCHED_BIND, Cap_Thd,
    1d6e:	48 b8 00 00 00 00 1b 	movabs $0x1b00000000,%rax
    1d75:	00 00 00 
    1d78:	45 89 c9             	mov    %r9d,%r9d
{
    1d7b:	4c 89 c1             	mov    %r8,%rcx
    return UVM_CAP_OP(RME_SVC_THD_SCHED_BIND, Cap_Thd,
    1d7e:	48 09 c7             	or     %rax,%rdi
    1d81:	4c 09 ce             	or     %r9,%rsi
    1d84:	e9 64 e3 ff ff       	jmp    ed <UVM_Svc>
    1d89:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001d90 <UVM_Thd_Sched_Rcv>:
                              is simply not allowed. 2-Level.
Output      : None.
Return      : ret_t - If successful, the thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Rcv(cid_t Cap_Thd)
{
    1d90:	f3 0f 1e fa          	endbr64 
    1d94:	48 89 fe             	mov    %rdi,%rsi
    return UVM_CAP_OP(RME_SVC_THD_SCHED_RCV, 0,
    1d97:	31 c9                	xor    %ecx,%ecx
    1d99:	31 d2                	xor    %edx,%edx
    1d9b:	48 bf 00 00 00 00 1c 	movabs $0x1c00000000,%rdi
    1da2:	00 00 00 
    1da5:	e9 43 e3 ff ff       	jmp    ed <UVM_Svc>
    1daa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001db0 <UVM_Thd_Sched_Prio>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Prio(cid_t Cap_Thd, ptr_t Prio)
{
    1db0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_THD_SCHED_PRIO, 1,
    1db4:	89 ff                	mov    %edi,%edi
    1db6:	48 c1 e6 20          	shl    $0x20,%rsi
    1dba:	31 c9                	xor    %ecx,%ecx
    1dbc:	31 d2                	xor    %edx,%edx
    1dbe:	48 09 fe             	or     %rdi,%rsi
    1dc1:	48 bf 01 00 00 00 07 	movabs $0x700000001,%rdi
    1dc8:	00 00 00 
    1dcb:	e9 1d e3 ff ff       	jmp    ed <UVM_Svc>

0000000000001dd0 <UVM_Thd_Sched_Free>:
Input       : cid_t Cap_Thd - The capability to the thread. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Free(cid_t Cap_Thd)
{
    1dd0:	f3 0f 1e fa          	endbr64 
    1dd4:	48 89 fe             	mov    %rdi,%rsi
    return UVM_CAP_OP(RME_SVC_THD_SCHED_FREE, 0,
    1dd7:	31 c9                	xor    %ecx,%ecx
    1dd9:	31 d2                	xor    %edx,%edx
    1ddb:	48 bf 00 00 00 00 05 	movabs $0x500000000,%rdi
    1de2:	00 00 00 
    1de5:	e9 03 e3 ff ff       	jmp    ed <UVM_Svc>
    1dea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001df0 <UVM_Thd_Time_Xfer>:
                           order of 100us or 1ms.
Output      : None.
Return      : ret_t - If successful, the destination time amount; or an error code.
******************************************************************************/
ret_t UVM_Thd_Time_Xfer(cid_t Cap_Thd_Dst, cid_t Cap_Thd_Src, ptr_t Time)
{
    1df0:	f3 0f 1e fa          	endbr64 
    1df4:	48 89 d1             	mov    %rdx,%rcx
    return UVM_CAP_OP(RME_SVC_THD_TIME_XFER, 0,
    1df7:	48 89 f2             	mov    %rsi,%rdx
    1dfa:	48 89 fe             	mov    %rdi,%rsi
    1dfd:	48 bf 00 00 00 00 08 	movabs $0x800000000,%rdi
    1e04:	00 00 00 
    1e07:	e9 e1 e2 ff ff       	jmp    ed <UVM_Svc>
    1e0c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001e10 <UVM_Thd_Swt>:
                                 this thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Swt(cid_t Cap_Thd, ptr_t Full_Yield)
{
    1e10:	f3 0f 1e fa          	endbr64 
    1e14:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_THD_SWT, 0,
    1e17:	31 c9                	xor    %ecx,%ecx
    1e19:	48 89 fe             	mov    %rdi,%rsi
    1e1c:	48 bf 00 00 00 00 09 	movabs $0x900000000,%rdi
    1e23:	00 00 00 
    1e26:	e9 c2 e2 ff ff       	jmp    ed <UVM_Svc>
    1e2b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001e30 <UVM_Sig_Crt>:
                            within the kernel virtual address.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Sig, ptr_t Vaddr)
{
    1e30:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_SIG_CRT, Cap_Captbl,
    1e34:	48 b8 00 00 00 00 1d 	movabs $0x1d00000000,%rax
    1e3b:	00 00 00 
{
    1e3e:	49 89 f0             	mov    %rsi,%r8
    1e41:	48 89 d6             	mov    %rdx,%rsi
    return UVM_CAP_OP(RME_SVC_SIG_CRT, Cap_Captbl,
    1e44:	48 09 c7             	or     %rax,%rdi
    1e47:	4c 89 c2             	mov    %r8,%rdx
    1e4a:	e9 9e e2 ff ff       	jmp    ed <UVM_Svc>
    1e4f:	90                   	nop

0000000000001e50 <UVM_Sig_Del>:
              cid_t Cap_Sig - The capability to the signal. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Del(cid_t Cap_Captbl, cid_t Cap_Sig)
{
    1e50:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_SIG_DEL, Cap_Captbl,
    1e54:	48 b8 00 00 00 00 1e 	movabs $0x1e00000000,%rax
    1e5b:	00 00 00 
    1e5e:	31 c9                	xor    %ecx,%ecx
    1e60:	31 d2                	xor    %edx,%edx
    1e62:	48 09 c7             	or     %rax,%rdi
    1e65:	e9 83 e2 ff ff       	jmp    ed <UVM_Svc>
    1e6a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001e70 <UVM_Sig_Snd>:
Input       : cid_t Cap_Sig - The capability to the signal. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0, or an error code.
******************************************************************************/
ret_t UVM_Sig_Snd(cid_t Cap_Sig)
{
    1e70:	f3 0f 1e fa          	endbr64 
    1e74:	48 89 fe             	mov    %rdi,%rsi
    return UVM_CAP_OP(RME_SVC_SIG_SND, 0,
    1e77:	31 c9                	xor    %ecx,%ecx
    1e79:	31 d2                	xor    %edx,%edx
    1e7b:	48 bf 00 00 00 00 02 	movabs $0x200000000,%rdi
    1e82:	00 00 00 
    1e85:	e9 63 e2 ff ff       	jmp    ed <UVM_Svc>
    1e8a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001e90 <UVM_Sig_Rcv>:
Output      : None.
Return      : ret_t - If successful, a non-negative number containing the number of signals
                      received will be returned; else an error code.
******************************************************************************/
ret_t UVM_Sig_Rcv(cid_t Cap_Sig, ptr_t Option)
{
    1e90:	f3 0f 1e fa          	endbr64 
    1e94:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_SIG_RCV, 0,
    1e97:	31 c9                	xor    %ecx,%ecx
    1e99:	48 89 fe             	mov    %rdi,%rsi
    1e9c:	48 bf 00 00 00 00 03 	movabs $0x300000000,%rdi
    1ea3:	00 00 00 
    1ea6:	e9 42 e2 ff ff       	jmp    ed <UVM_Svc>
    1eab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001eb0 <UVM_Inv_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, 
                  cid_t Cap_Inv, cid_t Cap_Proc, ptr_t Vaddr)
{
    1eb0:	f3 0f 1e fa          	endbr64 
    1eb4:	49 89 d1             	mov    %rdx,%r9
    return UVM_CAP_OP(RME_SVC_INV_CRT, Cap_Captbl,
    1eb7:	48 c1 e6 20          	shl    $0x20,%rsi
{
    1ebb:	48 89 ca             	mov    %rcx,%rdx
    return UVM_CAP_OP(RME_SVC_INV_CRT, Cap_Captbl,
    1ebe:	48 b8 00 00 00 00 1f 	movabs $0x1f00000000,%rax
    1ec5:	00 00 00 
    1ec8:	45 89 c9             	mov    %r9d,%r9d
{
    1ecb:	4c 89 c1             	mov    %r8,%rcx
    return UVM_CAP_OP(RME_SVC_INV_CRT, Cap_Captbl,
    1ece:	48 09 c7             	or     %rax,%rdi
    1ed1:	4c 09 ce             	or     %r9,%rsi
    1ed4:	e9 14 e2 ff ff       	jmp    ed <UVM_Svc>
    1ed9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001ee0 <UVM_Inv_Del>:
              cid_t Cap_Inv - The capability to the invocation stub. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Del(cid_t Cap_Captbl, cid_t Cap_Inv)
{
    1ee0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_INV_DEL, Cap_Captbl,
    1ee4:	48 0f ba ef 25       	bts    $0x25,%rdi
    1ee9:	31 c9                	xor    %ecx,%ecx
    1eeb:	31 d2                	xor    %edx,%edx
    1eed:	e9 fb e1 ff ff       	jmp    ed <UVM_Svc>
    1ef2:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1ef9:	00 00 00 00 
    1efd:	0f 1f 00             	nopl   (%rax)

0000000000001f00 <UVM_Inv_Set>:
                                     immediately, or we wait for fault handling?
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Set(cid_t Cap_Inv, ptr_t Entry, ptr_t Stack, ptr_t Fault_Ret_Flag)
{
    1f00:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_INV_SET, 0,
    1f04:	48 c1 e1 20          	shl    $0x20,%rcx
{
    1f08:	49 89 f0             	mov    %rsi,%r8
    return UVM_CAP_OP(RME_SVC_INV_SET, 0,
    1f0b:	89 ff                	mov    %edi,%edi
    1f0d:	48 89 ce             	mov    %rcx,%rsi
    1f10:	48 89 d1             	mov    %rdx,%rcx
    1f13:	4c 89 c2             	mov    %r8,%rdx
    1f16:	48 09 fe             	or     %rdi,%rsi
    1f19:	48 bf 00 00 00 00 21 	movabs $0x2100000000,%rdi
    1f20:	00 00 00 
    1f23:	e9 c5 e1 ff ff       	jmp    ed <UVM_Svc>
    1f28:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    1f2f:	00 

0000000000001f30 <UVM_Putchar>:
Input       : char Char - The character to print.
Output      : None.
Return      : ptr_t - Always 0.
******************************************************************************/
ptr_t UVM_Putchar(char Char)
{
    1f30:	f3 0f 1e fa          	endbr64 
    1f34:	41 54                	push   %r12
    1f36:	41 89 fc             	mov    %edi,%r12d
    /* Wait until we have transmitted */
    while((__UVM_X64_In(UVM_X64_COM1+5)&0x20)==0);
    1f39:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1f40:	bf fd 03 00 00       	mov    $0x3fd,%edi
    1f45:	e8 bb e0 ff ff       	call   5 <__UVM_X64_In>
    1f4a:	a8 20                	test   $0x20,%al
    1f4c:	74 f2                	je     1f40 <UVM_Putchar+0x10>
    __UVM_X64_Out(UVM_X64_COM1, Char);
    1f4e:	4d 0f be e4          	movsbq %r12b,%r12
    1f52:	bf f8 03 00 00       	mov    $0x3f8,%edi
    1f57:	4c 89 e6             	mov    %r12,%rsi
    1f5a:	e8 b0 e0 ff ff       	call   f <__UVM_X64_Out>
    UVM_Kern_Act(UVM_BOOT_INIT_KERN,0,0,(ptr_t)Char,0);
    1f5f:	4c 89 e1             	mov    %r12,%rcx
    1f62:	45 31 c0             	xor    %r8d,%r8d
    1f65:	31 d2                	xor    %edx,%edx
    1f67:	31 f6                	xor    %esi,%esi
    1f69:	bf 04 00 00 00       	mov    $0x4,%edi
    1f6e:	e8 8d fb ff ff       	call   1b00 <UVM_Kern_Act>
    return 0;
}
    1f73:	31 c0                	xor    %eax,%eax
    1f75:	41 5c                	pop    %r12
    1f77:	c3                   	ret    
    1f78:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    1f7f:	00 

0000000000001f80 <_UVM_Stack_Init>:
Output      : None.
Return      : ptr_t - The actual stack address to use for system call.
******************************************************************************/
ptr_t _UVM_Stack_Init(ptr_t Stack, ptr_t Size, ptr_t Stub, ptr_t Entry,
                      ptr_t Param1, ptr_t Param2, ptr_t Param3, ptr_t Param4)
{
    1f80:	f3 0f 1e fa          	endbr64 
	ptr_t* Stack_Ptr;

    Stack_Ptr=(ptr_t*)(Stack+Size-UVM_STACK_SAFE_SIZE*sizeof(ptr_t));
    Stack_Ptr[0]=Param1;
    1f84:	66 49 0f 6e c0       	movq   %r8,%xmm0
    1f89:	66 49 0f 6e c9       	movq   %r9,%xmm1
    Stack_Ptr=(ptr_t*)(Stack+Size-UVM_STACK_SAFE_SIZE*sizeof(ptr_t));
    1f8e:	48 8d 84 37 00 ff ff 	lea    -0x100(%rdi,%rsi,1),%rax
    1f95:	ff 
    Stack_Ptr[0]=Param1;
    1f96:	66 0f 6c c1          	punpcklqdq %xmm1,%xmm0
    Stack_Ptr[1]=Param2;
    Stack_Ptr[2]=Param3;
    Stack_Ptr[3]=Param4;
    Stack_Ptr[4]=Entry;
    1f9a:	48 89 48 20          	mov    %rcx,0x20(%rax)
    Stack_Ptr[0]=Param1;
    1f9e:	0f 11 00             	movups %xmm0,(%rax)
    1fa1:	f3 0f 7e 44 24 08    	movq   0x8(%rsp),%xmm0
    1fa7:	0f 16 44 24 10       	movhps 0x10(%rsp),%xmm0
    1fac:	0f 11 40 10          	movups %xmm0,0x10(%rax)

    return (ptr_t)Stack_Ptr;
}
    1fb0:	c3                   	ret    
    1fb1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1fb8:	00 00 00 00 
    1fbc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001fc0 <_UVM_Idle>:
Input       : None.
Output      : None.
Return      : None.
******************************************************************************/
void _UVM_Idle(void)
{
    1fc0:	f3 0f 1e fa          	endbr64 
    /* Do nothing. In the future we may call a kernel function to put us to sleep */
}
    1fc4:	c3                   	ret    


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
     1aa:	bf a8 1f 00 00       	mov    $0x1fa8,%edi
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
     24a:	bf d0 1f 00 00       	mov    $0x1fd0,%edi
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
     2f7:	bf 08 20 00 00       	mov    $0x2008,%edi
     2fc:	e8 0f 16 00 00       	call   1910 <UVM_Print_String>
     301:	bf 08 22 00 00       	mov    $0x2208,%edi
     306:	e8 05 16 00 00       	call   1910 <UVM_Print_String>
     30b:	bf 14 22 00 00       	mov    $0x2214,%edi
     310:	e8 fb 15 00 00       	call   1910 <UVM_Print_String>
     315:	bf 9b 00 00 00       	mov    $0x9b,%edi
     31a:	e8 c1 13 00 00       	call   16e0 <UVM_Print_Int>
     31f:	bf 1c 22 00 00       	mov    $0x221c,%edi
     324:	e8 e7 15 00 00       	call   1910 <UVM_Print_String>
     329:	bf 1f 22 00 00       	mov    $0x221f,%edi
     32e:	e8 dd 15 00 00       	call   1910 <UVM_Print_String>
     333:	bf 2b 22 00 00       	mov    $0x222b,%edi
     338:	e8 d3 15 00 00       	call   1910 <UVM_Print_String>
     33d:	bf 2e 22 00 00       	mov    $0x222e,%edi
     342:	e8 c9 15 00 00       	call   1910 <UVM_Print_String>
     347:	bf 1c 22 00 00       	mov    $0x221c,%edi
     34c:	e8 bf 15 00 00       	call   1910 <UVM_Print_String>
     351:	eb fe                	jmp    351 <TEST_SIG_FUNC1+0xc1>
     353:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    }
    UVM_LOG_S("\r\nSignal sending-receiving takes clock cycles:");
     358:	bf 40 20 00 00       	mov    $0x2040,%edi
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
     395:	bf 08 20 00 00       	mov    $0x2008,%edi
     39a:	e8 71 15 00 00       	call   1910 <UVM_Print_String>
     39f:	bf 08 22 00 00       	mov    $0x2208,%edi
     3a4:	e8 67 15 00 00       	call   1910 <UVM_Print_String>
     3a9:	bf 14 22 00 00       	mov    $0x2214,%edi
     3ae:	e8 5d 15 00 00       	call   1910 <UVM_Print_String>
     3b3:	bf a1 00 00 00       	mov    $0xa1,%edi
     3b8:	e8 23 13 00 00       	call   16e0 <UVM_Print_Int>
     3bd:	bf 1c 22 00 00       	mov    $0x221c,%edi
     3c2:	e8 49 15 00 00       	call   1910 <UVM_Print_String>
     3c7:	bf 1f 22 00 00       	mov    $0x221f,%edi
     3cc:	e8 3f 15 00 00       	call   1910 <UVM_Print_String>
     3d1:	bf 2b 22 00 00       	mov    $0x222b,%edi
     3d6:	e8 35 15 00 00       	call   1910 <UVM_Print_String>
     3db:	bf 2e 22 00 00       	mov    $0x222e,%edi
     3e0:	e8 2b 15 00 00       	call   1910 <UVM_Print_String>
     3e5:	bf 1c 22 00 00       	mov    $0x221c,%edi
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
     467:	bf 08 20 00 00       	mov    $0x2008,%edi
     46c:	e8 9f 14 00 00       	call   1910 <UVM_Print_String>
     471:	bf 08 22 00 00       	mov    $0x2208,%edi
     476:	e8 95 14 00 00       	call   1910 <UVM_Print_String>
     47b:	bf 14 22 00 00       	mov    $0x2214,%edi
     480:	e8 8b 14 00 00       	call   1910 <UVM_Print_String>
     485:	bf ac 00 00 00       	mov    $0xac,%edi
     48a:	e8 51 12 00 00       	call   16e0 <UVM_Print_Int>
     48f:	bf 1c 22 00 00       	mov    $0x221c,%edi
     494:	e8 77 14 00 00       	call   1910 <UVM_Print_String>
     499:	bf 1f 22 00 00       	mov    $0x221f,%edi
     49e:	e8 6d 14 00 00       	call   1910 <UVM_Print_String>
     4a3:	bf 2b 22 00 00       	mov    $0x222b,%edi
     4a8:	e8 63 14 00 00       	call   1910 <UVM_Print_String>
     4ad:	bf 2e 22 00 00       	mov    $0x222e,%edi
     4b2:	e8 59 14 00 00       	call   1910 <UVM_Print_String>
     4b7:	bf 1c 22 00 00       	mov    $0x221c,%edi
     4bc:	e8 4f 14 00 00       	call   1910 <UVM_Print_String>
     4c1:	eb fe                	jmp    4c1 <TEST_SIG_FUNC2+0xc1>
     4c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    }
    UVM_LOG_S("\r\nCross-process signal sending-receiving takes clock cycles:");
     4c8:	bf 70 20 00 00       	mov    $0x2070,%edi
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
     505:	bf 08 20 00 00       	mov    $0x2008,%edi
     50a:	e8 01 14 00 00       	call   1910 <UVM_Print_String>
     50f:	bf 08 22 00 00       	mov    $0x2208,%edi
     514:	e8 f7 13 00 00       	call   1910 <UVM_Print_String>
     519:	bf 14 22 00 00       	mov    $0x2214,%edi
     51e:	e8 ed 13 00 00       	call   1910 <UVM_Print_String>
     523:	bf b2 00 00 00       	mov    $0xb2,%edi
     528:	e8 b3 11 00 00       	call   16e0 <UVM_Print_Int>
     52d:	bf 1c 22 00 00       	mov    $0x221c,%edi
     532:	e8 d9 13 00 00       	call   1910 <UVM_Print_String>
     537:	bf 1f 22 00 00       	mov    $0x221f,%edi
     53c:	e8 cf 13 00 00       	call   1910 <UVM_Print_String>
     541:	bf 2b 22 00 00       	mov    $0x222b,%edi
     546:	e8 c5 13 00 00       	call   1910 <UVM_Print_String>
     54b:	bf 2e 22 00 00       	mov    $0x222e,%edi
     550:	e8 bb 13 00 00       	call   1910 <UVM_Print_String>
     555:	bf 1c 22 00 00       	mov    $0x221c,%edi
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
    UVM_LOG_S("\r\nEnter user mode success!Welcome to RME system!");
     599:	bf b0 20 00 00       	mov    $0x20b0,%edi
{
     59e:	48 83 ec 08          	sub    $0x8,%rsp
    UVM_LOG_S("\r\nEnter user mode success!Welcome to RME system!");
     5a2:	e8 69 13 00 00       	call   1910 <UVM_Print_String>
    UVM_LOG_S("\r\nNow we are running init thread on cpu:");
     5a7:	bf e8 20 00 00       	mov    $0x20e8,%edi
     5ac:	e8 5f 13 00 00       	call   1910 <UVM_Print_String>
    UVM_LOG_I(CPUID);
     5b1:	48 89 df             	mov    %rbx,%rdi
     5b4:	e8 27 11 00 00       	call   16e0 <UVM_Print_Int>
    if(CPUID==0) 
     5b9:	48 85 db             	test   %rbx,%rbx
     5bc:	0f 85 b9 06 00 00    	jne    c7b <main+0x6eb>
    {
        /*Empty test begins here*/
        sum=0;
     5c2:	48 c7 05 43 2a 00 00 	movq   $0x0,0x2a43(%rip)        # 3010 <sum>
     5c9:	00 00 00 00 
     5cd:	bb 10 27 00 00       	mov    $0x2710,%ebx
     5d2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
        for(Count=0;Count<10000;Count++)
        {
            start=__UVM_X64_Read_TSC();
     5d8:	e8 3e fa ff ff       	call   1b <__UVM_X64_Read_TSC>
     5dd:	48 89 05 44 2a 00 00 	mov    %rax,0x2a44(%rip)        # 3028 <start>
            end=__UVM_X64_Read_TSC();
     5e4:	e8 32 fa ff ff       	call   1b <__UVM_X64_Read_TSC>
     5e9:	48 89 05 28 2a 00 00 	mov    %rax,0x2a28(%rip)        # 3018 <end>
            sum+=end-start;
     5f0:	48 8b 05 21 2a 00 00 	mov    0x2a21(%rip),%rax        # 3018 <end>
     5f7:	48 8b 15 2a 2a 00 00 	mov    0x2a2a(%rip),%rdx        # 3028 <start>
     5fe:	48 29 d0             	sub    %rdx,%rax
     601:	48 01 05 08 2a 00 00 	add    %rax,0x2a08(%rip)        # 3010 <sum>
        for(Count=0;Count<10000;Count++)
     608:	48 83 eb 01          	sub    $0x1,%rbx
     60c:	75 ca                	jne    5d8 <main+0x48>
        }
        UVM_LOG_S("\r\nEmpty test takes clock cycles:");
     60e:	bf 18 21 00 00       	mov    $0x2118,%edi
        UVM_LOG_I(sum/10000);
        /*Empty test ends here*/

        /*Empty system call test begins here*/
        sum=0;
     613:	bb 10 27 00 00       	mov    $0x2710,%ebx
        UVM_LOG_S("\r\nEmpty test takes clock cycles:");
     618:	e8 f3 12 00 00       	call   1910 <UVM_Print_String>
        UVM_LOG_I(sum/10000);
     61d:	48 8b 05 ec 29 00 00 	mov    0x29ec(%rip),%rax        # 3010 <sum>
     624:	b9 10 27 00 00       	mov    $0x2710,%ecx
     629:	31 d2                	xor    %edx,%edx
     62b:	48 f7 f1             	div    %rcx
     62e:	48 89 c7             	mov    %rax,%rdi
     631:	e8 aa 10 00 00       	call   16e0 <UVM_Print_Int>
        sum=0;
     636:	48 c7 05 cf 29 00 00 	movq   $0x0,0x29cf(%rip)        # 3010 <sum>
     63d:	00 00 00 00 
        for(Count=0;Count<10000;Count++)
     641:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
        {
            start=__UVM_X64_Read_TSC();
     648:	e8 ce f9 ff ff       	call   1b <__UVM_X64_Read_TSC>
            UVM_Svc(-1,-1,-1,-1);
     64d:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
     654:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
     65b:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
     662:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
            start=__UVM_X64_Read_TSC();
     669:	48 89 05 b8 29 00 00 	mov    %rax,0x29b8(%rip)        # 3028 <start>
            UVM_Svc(-1,-1,-1,-1);
     670:	e8 78 fa ff ff       	call   ed <UVM_Svc>
            end=__UVM_X64_Read_TSC();
     675:	e8 a1 f9 ff ff       	call   1b <__UVM_X64_Read_TSC>
     67a:	48 89 05 97 29 00 00 	mov    %rax,0x2997(%rip)        # 3018 <end>
            sum+=end-start;
     681:	48 8b 05 90 29 00 00 	mov    0x2990(%rip),%rax        # 3018 <end>
     688:	48 8b 15 99 29 00 00 	mov    0x2999(%rip),%rdx        # 3028 <start>
     68f:	48 29 d0             	sub    %rdx,%rax
     692:	48 01 05 77 29 00 00 	add    %rax,0x2977(%rip)        # 3010 <sum>
        for(Count=0;Count<10000;Count++)
     699:	48 83 eb 01          	sub    $0x1,%rbx
     69d:	75 a9                	jne    648 <main+0xb8>
        }
        UVM_LOG_S("\r\nEmpty system call takes clock cycles:");
     69f:	bf 40 21 00 00       	mov    $0x2140,%edi
     6a4:	e8 67 12 00 00       	call   1910 <UVM_Print_String>
        UVM_LOG_I(sum/10000);
     6a9:	48 8b 05 60 29 00 00 	mov    0x2960(%rip),%rax        # 3010 <sum>
     6b0:	b9 10 27 00 00       	mov    $0x2710,%ecx
     6b5:	31 d2                	xor    %edx,%edx
     6b7:	48 f7 f1             	div    %rcx
     6ba:	48 89 c7             	mov    %rax,%rdi
     6bd:	e8 1e 10 00 00       	call   16e0 <UVM_Print_Int>
        /*Now we begin to create UVM kernel objects*/
        Cur_Addr=UVM_OBJ_BASE;
        
        /*Thread switching test begins here, We place the thread stack at 12MB */
        /*Create test thread capability table*/
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD_TBL,Cur_Addr,16)>=0);
     6c2:	31 ff                	xor    %edi,%edi
     6c4:	41 b8 10 00 00 00    	mov    $0x10,%r8d
     6ca:	b9 00 00 a0 0e       	mov    $0xea00000,%ecx
     6cf:	ba 09 00 00 00       	mov    $0x9,%edx
     6d4:	be 00 80 05 00       	mov    $0x58000,%esi
     6d9:	e8 72 12 00 00       	call   1950 <UVM_Captbl_Crt>
     6de:	48 85 c0             	test   %rax,%rax
     6e1:	0f 88 9a 05 00 00    	js     c81 <main+0x6f1>
        Cur_Addr+=UVM_CAPTBL_SIZE(16);
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD1, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
     6e7:	31 d2                	xor    %edx,%edx
     6e9:	41 b9 00 04 a0 0e    	mov    $0xea00400,%r9d
     6ef:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
     6f5:	b9 02 00 00 00       	mov    $0x2,%ecx
     6fa:	be 00 80 05 00       	mov    $0x58000,%esi
     6ff:	bf 09 00 00 00       	mov    $0x9,%edi
     704:	e8 b7 15 00 00       	call   1cc0 <UVM_Thd_Crt>
     709:	48 85 c0             	test   %rax,%rax
     70c:	0f 88 cb 05 00 00    	js     cdd <main+0x74d>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD1),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
     712:	45 31 c0             	xor    %r8d,%r8d
     715:	31 c9                	xor    %ecx,%ecx
     717:	ba 00 00 00 80       	mov    $0x80000000,%edx
     71c:	be 00 80 03 00       	mov    $0x38000,%esi
     721:	bf 00 80 09 00       	mov    $0x98000,%edi
     726:	e8 35 16 00 00       	call   1d60 <UVM_Thd_Sched_Bind>
     72b:	48 85 c0             	test   %rax,%rax
     72e:	0f 88 05 06 00 00    	js     d39 <main+0x7a9>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD1),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     734:	be 00 80 03 00       	mov    $0x38000,%esi
     739:	bf 00 80 09 00       	mov    $0x98000,%edi
    Word_Inc=(ptr_t*)Addr;
     73e:	bb 00 00 c0 00       	mov    $0xc00000,%ebx
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD1),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     743:	48 ba fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rdx
     74a:	ff ff 7f 
     74d:	e8 9e 16 00 00       	call   1df0 <UVM_Thd_Time_Xfer>
     752:	48 85 c0             	test   %rax,%rax
     755:	0f 88 96 06 00 00    	js     df1 <main+0x861>
        *Word_Inc=0;
     75b:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
        Word_Inc++;
     762:	48 83 c3 08          	add    $0x8,%rbx
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
     766:	48 81 fb 00 00 d0 00 	cmp    $0xd00000,%rbx
     76d:	75 ec                	jne    75b <main+0x1cb>
        UVM_Clear((void*)(12*UVM_POW2(RME_PGT_SIZE_1M)), UVM_POW2(RME_PGT_SIZE_1M));
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD1),(ptr_t)TEST_THD_FUNC1,12*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     76f:	31 c9                	xor    %ecx,%ecx
     771:	ba 00 00 c0 00       	mov    $0xc00000,%edx
     776:	be 50 01 00 00       	mov    $0x150,%esi
     77b:	bf 00 80 09 00       	mov    $0x98000,%edi
     780:	e8 9b 15 00 00       	call   1d20 <UVM_Thd_Exec_Set>
     785:	48 85 c0             	test   %rax,%rax
     788:	0f 88 07 06 00 00    	js     d95 <main+0x805>
        Cur_Addr+=UVM_THD_SIZE;
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD2, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
     78e:	41 b9 d0 0d a0 0e    	mov    $0xea00dd0,%r9d
     794:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
     79a:	b9 02 00 00 00       	mov    $0x2,%ecx
     79f:	ba 01 00 00 00       	mov    $0x1,%edx
     7a4:	be 00 80 05 00       	mov    $0x58000,%esi
     7a9:	bf 09 00 00 00       	mov    $0x9,%edi
     7ae:	e8 0d 15 00 00       	call   1cc0 <UVM_Thd_Crt>
     7b3:	48 85 c0             	test   %rax,%rax
     7b6:	0f 88 91 06 00 00    	js     e4d <main+0x8bd>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD2),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
     7bc:	45 31 c0             	xor    %r8d,%r8d
     7bf:	31 c9                	xor    %ecx,%ecx
     7c1:	ba 00 00 00 80       	mov    $0x80000000,%edx
     7c6:	be 00 80 03 00       	mov    $0x38000,%esi
     7cb:	bf 01 80 09 00       	mov    $0x98001,%edi
     7d0:	e8 8b 15 00 00       	call   1d60 <UVM_Thd_Sched_Bind>
     7d5:	48 85 c0             	test   %rax,%rax
     7d8:	0f 88 cb 06 00 00    	js     ea9 <main+0x919>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD2),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     7de:	48 ba fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rdx
     7e5:	ff ff 7f 
     7e8:	be 00 80 03 00       	mov    $0x38000,%esi
     7ed:	bf 01 80 09 00       	mov    $0x98001,%edi
     7f2:	e8 f9 15 00 00       	call   1df0 <UVM_Thd_Time_Xfer>
     7f7:	48 85 c0             	test   %rax,%rax
     7fa:	0f 88 61 07 00 00    	js     f61 <main+0x9d1>
        *Word_Inc=0;
     800:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
        Word_Inc++;
     807:	48 83 c3 08          	add    $0x8,%rbx
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
     80b:	48 81 fb 00 00 e0 00 	cmp    $0xe00000,%rbx
     812:	75 ec                	jne    800 <main+0x270>
        UVM_Clear((void*)(13*UVM_POW2(RME_PGT_SIZE_1M)), UVM_POW2(RME_PGT_SIZE_1M));
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD2),(ptr_t)TEST_THD_FUNC2,13*UVM_POW2(RME_PGT_SIZE_1M),1)>=0);
     814:	b9 01 00 00 00       	mov    $0x1,%ecx
     819:	ba 00 00 d0 00       	mov    $0xd00000,%edx
     81e:	be 10 01 00 00       	mov    $0x110,%esi
     823:	bf 01 80 09 00       	mov    $0x98001,%edi
     828:	e8 f3 14 00 00       	call   1d20 <UVM_Thd_Exec_Set>
     82d:	48 85 c0             	test   %rax,%rax
     830:	0f 88 cf 06 00 00    	js     f05 <main+0x975>
        Cur_Addr+=UVM_THD_SIZE;
        UVM_LOG_S("\r\nSwtching thread...");
     836:	bf 37 22 00 00       	mov    $0x2237,%edi
     83b:	e8 d0 10 00 00       	call   1910 <UVM_Print_String>
        UVM_Thd_Swt(UVM_CAPID(TEST_THD_TBL,TEST_THD1),0);
     840:	31 f6                	xor    %esi,%esi
     842:	bf 00 80 09 00       	mov    $0x98000,%edi
     847:	e8 c4 15 00 00       	call   1e10 <UVM_Thd_Swt>
        UVM_LOG_S("\r\nBack to main thread!");
     84c:	bf 4c 22 00 00       	mov    $0x224c,%edi
     851:	e8 ba 10 00 00       	call   1910 <UVM_Print_String>
        /*Thread switching test ends here*/
        
        /*Signal Sending-receiving test begins here*/
        /*create endpoint first*/
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG1, Cur_Addr)>=0);
     856:	b9 a0 17 a0 0e       	mov    $0xea017a0,%ecx
     85b:	ba 0b 00 00 00       	mov    $0xb,%edx
     860:	31 ff                	xor    %edi,%edi
     862:	be 00 80 05 00       	mov    $0x58000,%esi
     867:	e8 c4 15 00 00       	call   1e30 <UVM_Sig_Crt>
     86c:	49 89 c0             	mov    %rax,%r8
    Word_Inc=(ptr_t*)Addr;
     86f:	b8 00 00 c0 00       	mov    $0xc00000,%eax
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG1, Cur_Addr)>=0);
     874:	4d 85 c0             	test   %r8,%r8
     877:	0f 88 40 07 00 00    	js     fbd <main+0xa2d>
        *Word_Inc=0;
     87d:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
        Word_Inc++;
     884:	48 83 c0 08          	add    $0x8,%rax
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
     888:	48 3d 00 00 d0 00    	cmp    $0xd00000,%rax
     88e:	75 ed                	jne    87d <main+0x2ed>
        Cur_Addr+=UVM_SIG_SIZE;
        /*reset two threads*/
        UVM_Clear((void*)(12*UVM_POW2(RME_PGT_SIZE_1M)), UVM_POW2(RME_PGT_SIZE_1M));
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD1),(ptr_t)TEST_SIG_FUNC1,12*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     890:	31 c9                	xor    %ecx,%ecx
     892:	ba 00 00 c0 00       	mov    $0xc00000,%edx
     897:	be 90 02 00 00       	mov    $0x290,%esi
     89c:	bf 00 80 09 00       	mov    $0x98000,%edi
     8a1:	e8 7a 14 00 00       	call   1d20 <UVM_Thd_Exec_Set>
     8a6:	48 85 c0             	test   %rax,%rax
     8a9:	0f 88 c6 07 00 00    	js     1075 <main+0xae5>
        /*throw away thread1 infinity time slices,and add finity time slices to it*/
        //UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(UVM_BOOT_TBL_THD,0),TEST_THD1,UVM_THD_INIT_TIME)>=0);
        //UVM_ASSERT(UVM_Thd_Time_Xfer(TEST_THD1,UVM_CAPID(UVM_BOOT_TBL_THD,0),100)>=0);
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD1),1)>=0);
     8af:	be 01 00 00 00       	mov    $0x1,%esi
     8b4:	bf 00 80 09 00       	mov    $0x98000,%edi
     8b9:	bd 10 27 00 00       	mov    $0x2710,%ebp
     8be:	e8 ed 14 00 00       	call   1db0 <UVM_Thd_Sched_Prio>
     8c3:	48 85 c0             	test   %rax,%rax
     8c6:	0f 88 4d 07 00 00    	js     1019 <main+0xa89>
        for(Count=0;Count<10000;Count++)
        {
            UVM_Sig_Snd(TEST_SIG1);
     8cc:	bf 0b 00 00 00       	mov    $0xb,%edi
     8d1:	e8 9a 15 00 00       	call   1e70 <UVM_Sig_Snd>
        for(Count=0;Count<10000;Count++)
     8d6:	48 83 ed 01          	sub    $0x1,%rbp
     8da:	75 f0                	jne    8cc <main+0x33c>
        }
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD1),0)>=0);
     8dc:	31 f6                	xor    %esi,%esi
     8de:	bf 00 80 09 00       	mov    $0x98000,%edi
     8e3:	e8 c8 14 00 00       	call   1db0 <UVM_Thd_Sched_Prio>
     8e8:	48 85 c0             	test   %rax,%rax
     8eb:	0f 88 64 0a 00 00    	js     1355 <main+0xdc5>
        //     }
        // }
        // UVM_LOG_S("\r\nAdd pages success!!!!");

        /*Create test process here*/
        UVM_ASSERT(UVM_Proc_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS,UVM_BOOT_CAPTBL,
     8f1:	31 c9                	xor    %ecx,%ecx
     8f3:	31 ff                	xor    %edi,%edi
     8f5:	41 b9 c0 17 a0 0e    	mov    $0xea017c0,%r9d
     8fb:	41 b8 00 80 01 00    	mov    $0x18000,%r8d
     901:	ba 0f 00 00 00       	mov    $0xf,%edx
     906:	be 00 80 05 00       	mov    $0x58000,%esi
     90b:	e8 30 13 00 00       	call   1c40 <UVM_Proc_Crt>
     910:	48 85 c0             	test   %rax,%rax
     913:	0f 88 e0 09 00 00    	js     12f9 <main+0xd69>
                                        UVM_CAPID(UVM_BOOT_TBL_PGTBL,0),Cur_Addr)>=0);
        Cur_Addr+=UVM_PROC_SIZE;
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD3, TEST_PROCESS, 10, Cur_Addr)>=0);
     919:	41 b9 e0 17 a0 0e    	mov    $0xea017e0,%r9d
     91f:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
     925:	b9 0f 00 00 00       	mov    $0xf,%ecx
     92a:	ba 02 00 00 00       	mov    $0x2,%edx
     92f:	be 00 80 05 00       	mov    $0x58000,%esi
     934:	bf 09 00 00 00       	mov    $0x9,%edi
     939:	e8 82 13 00 00       	call   1cc0 <UVM_Thd_Crt>
     93e:	48 85 c0             	test   %rax,%rax
     941:	0f 88 56 09 00 00    	js     129d <main+0xd0d>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD3),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
     947:	45 31 c0             	xor    %r8d,%r8d
     94a:	31 c9                	xor    %ecx,%ecx
     94c:	ba 00 00 00 80       	mov    $0x80000000,%edx
     951:	be 00 80 03 00       	mov    $0x38000,%esi
     956:	bf 02 80 09 00       	mov    $0x98002,%edi
     95b:	e8 00 14 00 00       	call   1d60 <UVM_Thd_Sched_Bind>
     960:	48 85 c0             	test   %rax,%rax
     963:	0f 88 d8 08 00 00    	js     1241 <main+0xcb1>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD3),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     969:	be 00 80 03 00       	mov    $0x38000,%esi
     96e:	bf 02 80 09 00       	mov    $0x98002,%edi
    Word_Inc=(ptr_t*)Addr;
     973:	bd 00 00 e0 00       	mov    $0xe00000,%ebp
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD3),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     978:	48 ba fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rdx
     97f:	ff ff 7f 
     982:	e8 69 14 00 00       	call   1df0 <UVM_Thd_Time_Xfer>
     987:	48 85 c0             	test   %rax,%rax
     98a:	0f 88 41 07 00 00    	js     10d1 <main+0xb41>
        *Word_Inc=0;
     990:	48 c7 45 00 00 00 00 	movq   $0x0,0x0(%rbp)
     997:	00 
        Word_Inc++;
     998:	48 83 c5 08          	add    $0x8,%rbp
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
     99c:	48 81 fd 00 00 f0 00 	cmp    $0xf00000,%rbp
     9a3:	75 eb                	jne    990 <main+0x400>
        UVM_Clear((void*)(14*UVM_POW2(RME_PGT_SIZE_1M)), UVM_POW2(RME_PGT_SIZE_1M));
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD3),(ptr_t)TEST_THD_FUNC3,14*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     9a5:	31 c9                	xor    %ecx,%ecx
     9a7:	ba 00 00 e0 00       	mov    $0xe00000,%edx
     9ac:	be f0 01 00 00       	mov    $0x1f0,%esi
     9b1:	bf 02 80 09 00       	mov    $0x98002,%edi
     9b6:	e8 65 13 00 00       	call   1d20 <UVM_Thd_Exec_Set>
     9bb:	48 85 c0             	test   %rax,%rax
     9be:	0f 88 21 08 00 00    	js     11e5 <main+0xc55>
        Cur_Addr+=UVM_THD_SIZE;

        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD4, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
     9c4:	41 b9 b0 21 a0 0e    	mov    $0xea021b0,%r9d
     9ca:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
     9d0:	b9 02 00 00 00       	mov    $0x2,%ecx
     9d5:	ba 03 00 00 00       	mov    $0x3,%edx
     9da:	be 00 80 05 00       	mov    $0x58000,%esi
     9df:	bf 09 00 00 00       	mov    $0x9,%edi
     9e4:	e8 d7 12 00 00       	call   1cc0 <UVM_Thd_Crt>
     9e9:	48 85 c0             	test   %rax,%rax
     9ec:	0f 88 97 07 00 00    	js     1189 <main+0xbf9>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD4),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
     9f2:	45 31 c0             	xor    %r8d,%r8d
     9f5:	31 c9                	xor    %ecx,%ecx
     9f7:	ba 00 00 00 80       	mov    $0x80000000,%edx
     9fc:	be 00 80 03 00       	mov    $0x38000,%esi
     a01:	bf 03 80 09 00       	mov    $0x98003,%edi
     a06:	e8 55 13 00 00       	call   1d60 <UVM_Thd_Sched_Bind>
     a0b:	48 85 c0             	test   %rax,%rax
     a0e:	0f 88 9d 09 00 00    	js     13b1 <main+0xe21>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD4),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     a14:	48 ba fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rdx
     a1b:	ff ff 7f 
     a1e:	be 00 80 03 00       	mov    $0x38000,%esi
     a23:	bf 03 80 09 00       	mov    $0x98003,%edi
     a28:	e8 c3 13 00 00       	call   1df0 <UVM_Thd_Time_Xfer>
     a2d:	48 85 c0             	test   %rax,%rax
     a30:	0f 88 f7 06 00 00    	js     112d <main+0xb9d>
        *Word_Inc=0;
     a36:	48 c7 45 00 00 00 00 	movq   $0x0,0x0(%rbp)
     a3d:	00 
        Word_Inc++;
     a3e:	48 83 c5 08          	add    $0x8,%rbp
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
     a42:	48 81 fd 00 00 00 01 	cmp    $0x1000000,%rbp
     a49:	75 eb                	jne    a36 <main+0x4a6>
        UVM_Clear((void*)(15*UVM_POW2(RME_PGT_SIZE_1M)), UVM_POW2(RME_PGT_SIZE_1M));
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD4),(ptr_t)TEST_THD_FUNC4,15*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     a4b:	31 c9                	xor    %ecx,%ecx
     a4d:	ba 00 00 f0 00       	mov    $0xf00000,%edx
     a52:	be 30 01 00 00       	mov    $0x130,%esi
     a57:	bf 03 80 09 00       	mov    $0x98003,%edi
     a5c:	e8 bf 12 00 00       	call   1d20 <UVM_Thd_Exec_Set>
     a61:	48 85 c0             	test   %rax,%rax
     a64:	0f 88 ff 09 00 00    	js     1469 <main+0xed9>
        Cur_Addr+=UVM_THD_SIZE;

        UVM_LOG_S("\r\nCross-process swtching thread...");
     a6a:	bf 68 21 00 00       	mov    $0x2168,%edi
     a6f:	e8 9c 0e 00 00       	call   1910 <UVM_Print_String>
        UVM_Thd_Swt(UVM_CAPID(TEST_THD_TBL,TEST_THD3),0);
     a74:	31 f6                	xor    %esi,%esi
     a76:	bf 02 80 09 00       	mov    $0x98002,%edi
     a7b:	e8 90 13 00 00       	call   1e10 <UVM_Thd_Swt>
        UVM_LOG_S("\r\nBack to main thread!");
     a80:	bf 4c 22 00 00       	mov    $0x224c,%edi
     a85:	e8 86 0e 00 00       	call   1910 <UVM_Print_String>

        /*Cross-process thread switching test ends here*/
       
        /*Cross-process signal Sending-receiving test begins here*/
        /*create endpoint first*/
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG2, Cur_Addr)>=0);
     a8a:	31 ff                	xor    %edi,%edi
     a8c:	b9 80 2b a0 0e       	mov    $0xea02b80,%ecx
     a91:	ba 0c 00 00 00       	mov    $0xc,%edx
     a96:	be 00 80 05 00       	mov    $0x58000,%esi
     a9b:	e8 90 13 00 00       	call   1e30 <UVM_Sig_Crt>
     aa0:	48 85 c0             	test   %rax,%rax
     aa3:	0f 88 64 09 00 00    	js     140d <main+0xe7d>
        *Word_Inc=0;
     aa9:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
        Word_Inc++;
     ab0:	48 83 c3 08          	add    $0x8,%rbx
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
     ab4:	48 81 fb 00 00 f0 00 	cmp    $0xf00000,%rbx
     abb:	75 ec                	jne    aa9 <main+0x519>
        Cur_Addr+=UVM_SIG_SIZE;
        UVM_Clear((void*)(14*UVM_POW2(RME_PGT_SIZE_1M)), UVM_POW2(RME_PGT_SIZE_1M));
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD3),(ptr_t)TEST_SIG_FUNC2,14*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     abd:	31 c9                	xor    %ecx,%ecx
     abf:	ba 00 00 e0 00       	mov    $0xe00000,%edx
     ac4:	be 00 04 00 00       	mov    $0x400,%esi
     ac9:	bf 02 80 09 00       	mov    $0x98002,%edi
     ace:	e8 4d 12 00 00       	call   1d20 <UVM_Thd_Exec_Set>
     ad3:	48 85 c0             	test   %rax,%rax
     ad6:	0f 88 45 0a 00 00    	js     1521 <main+0xf91>

        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD3),1)>=0);
     adc:	be 01 00 00 00       	mov    $0x1,%esi
     ae1:	bf 02 80 09 00       	mov    $0x98002,%edi
     ae6:	bd 10 27 00 00       	mov    $0x2710,%ebp
     aeb:	e8 c0 12 00 00       	call   1db0 <UVM_Thd_Sched_Prio>
     af0:	48 85 c0             	test   %rax,%rax
     af3:	0f 88 cc 09 00 00    	js     14c5 <main+0xf35>
        for(Count=0;Count<10000;Count++)
        {
            UVM_Sig_Snd(TEST_SIG2);
     af9:	bf 0c 00 00 00       	mov    $0xc,%edi
     afe:	e8 6d 13 00 00       	call   1e70 <UVM_Sig_Snd>
        for(Count=0;Count<10000;Count++)
     b03:	48 83 ed 01          	sub    $0x1,%rbp
     b07:	75 f0                	jne    af9 <main+0x569>
        }
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD3),0)>=0);
     b09:	31 f6                	xor    %esi,%esi
     b0b:	bf 02 80 09 00       	mov    $0x98002,%edi
     b10:	e8 9b 12 00 00       	call   1db0 <UVM_Thd_Sched_Prio>
     b15:	48 85 c0             	test   %rax,%rax
     b18:	0f 88 bb 0a 00 00    	js     15d9 <main+0x1049>

        /*Cross-process signal Sending-receiving test ends here*/

        /*Invocation stub test begins here*/
      
        UVM_ASSERT(UVM_Inv_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_INV1, TEST_PROCESS, Cur_Addr)>=0);
     b1e:	31 ff                	xor    %edi,%edi
     b20:	41 b8 a0 2b a0 0e    	mov    $0xea02ba0,%r8d
     b26:	b9 0f 00 00 00       	mov    $0xf,%ecx
     b2b:	ba 0a 00 00 00       	mov    $0xa,%edx
     b30:	be 00 80 05 00       	mov    $0x58000,%esi
     b35:	e8 76 13 00 00       	call   1eb0 <UVM_Inv_Crt>
     b3a:	48 85 c0             	test   %rax,%rax
     b3d:	0f 88 3a 0a 00 00    	js     157d <main+0xfed>
        *Word_Inc=0;
     b43:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
        Word_Inc++;
     b4a:	48 83 c3 08          	add    $0x8,%rbx
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
     b4e:	48 81 fb 00 00 00 01 	cmp    $0x1000000,%rbx
     b55:	75 ec                	jne    b43 <main+0x5b3>
        Cur_Addr+=UVM_INV_SIZE;
        UVM_Clear((void*)(15*UVM_POW2(RME_PGT_SIZE_1M)), UVM_POW2(RME_PGT_SIZE_1M));
        UVM_ASSERT(UVM_Inv_Set(TEST_INV1,(ptr_t)TEST_INV1_FUNC,15*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     b57:	31 c9                	xor    %ecx,%ecx
     b59:	ba 00 00 f0 00       	mov    $0xf00000,%edx
     b5e:	be 70 05 00 00       	mov    $0x570,%esi
     b63:	bf 0a 00 00 00       	mov    $0xa,%edi
     b68:	e8 93 13 00 00       	call   1f00 <UVM_Inv_Set>
     b6d:	48 85 c0             	test   %rax,%rax
     b70:	0f 88 bf 0a 00 00    	js     1635 <main+0x10a5>
        sum=0;
     b76:	48 c7 05 8f 24 00 00 	movq   $0x0,0x248f(%rip)        # 3010 <sum>
     b7d:	00 00 00 00 
        sumin=0;
        sumout=0;
     b81:	bb 10 27 00 00       	mov    $0x2710,%ebx
        sumin=0;
     b86:	48 c7 05 77 24 00 00 	movq   $0x0,0x2477(%rip)        # 3008 <sumin>
     b8d:	00 00 00 00 
        sumout=0;
     b91:	48 c7 05 64 24 00 00 	movq   $0x0,0x2464(%rip)        # 3000 <sumout>
     b98:	00 00 00 00 
        for(Count=0;Count<10000;Count++)
        {
            start=__UVM_X64_Read_TSC();
     b9c:	e8 7a f4 ff ff       	call   1b <__UVM_X64_Read_TSC>
            UVM_Inv_Act(TEST_INV1,0,0);
     ba1:	31 d2                	xor    %edx,%edx
     ba3:	31 f6                	xor    %esi,%esi
     ba5:	bf 0a 00 00 00       	mov    $0xa,%edi
            start=__UVM_X64_Read_TSC();
     baa:	48 89 05 77 24 00 00 	mov    %rax,0x2477(%rip)        # 3028 <start>
            UVM_Inv_Act(TEST_INV1,0,0);
     bb1:	e8 a3 f4 ff ff       	call   59 <UVM_Inv_Act>
            end=__UVM_X64_Read_TSC();
     bb6:	e8 60 f4 ff ff       	call   1b <__UVM_X64_Read_TSC>
     bbb:	48 89 05 56 24 00 00 	mov    %rax,0x2456(%rip)        # 3018 <end>
            sum+=end-start;
     bc2:	48 8b 05 4f 24 00 00 	mov    0x244f(%rip),%rax        # 3018 <end>
     bc9:	48 8b 15 58 24 00 00 	mov    0x2458(%rip),%rdx        # 3028 <start>
     bd0:	48 29 d0             	sub    %rdx,%rax
     bd3:	48 01 05 36 24 00 00 	add    %rax,0x2436(%rip)        # 3010 <sum>
            sumin+=middle-start;
     bda:	48 8b 05 3f 24 00 00 	mov    0x243f(%rip),%rax        # 3020 <middle>
     be1:	48 8b 15 40 24 00 00 	mov    0x2440(%rip),%rdx        # 3028 <start>
     be8:	48 29 d0             	sub    %rdx,%rax
     beb:	48 01 05 16 24 00 00 	add    %rax,0x2416(%rip)        # 3008 <sumin>
            sumout+=end-middle;
     bf2:	48 8b 05 1f 24 00 00 	mov    0x241f(%rip),%rax        # 3018 <end>
     bf9:	48 8b 15 20 24 00 00 	mov    0x2420(%rip),%rdx        # 3020 <middle>
     c00:	48 29 d0             	sub    %rdx,%rax
     c03:	48 01 05 f6 23 00 00 	add    %rax,0x23f6(%rip)        # 3000 <sumout>
        for(Count=0;Count<10000;Count++)
     c0a:	48 83 eb 01          	sub    $0x1,%rbx
     c0e:	75 8c                	jne    b9c <main+0x60c>
        }
        UVM_LOG_S("\r\nInvocation total takes clock cycles:");
     c10:	bf 90 21 00 00       	mov    $0x2190,%edi
        UVM_LOG_I(sum/10000);
     c15:	bb 10 27 00 00       	mov    $0x2710,%ebx
        UVM_LOG_S("\r\nInvocation total takes clock cycles:");
     c1a:	e8 f1 0c 00 00       	call   1910 <UVM_Print_String>
        UVM_LOG_I(sum/10000);
     c1f:	48 8b 05 ea 23 00 00 	mov    0x23ea(%rip),%rax        # 3010 <sum>
     c26:	31 d2                	xor    %edx,%edx
     c28:	48 f7 f3             	div    %rbx
     c2b:	48 89 c7             	mov    %rax,%rdi
     c2e:	e8 ad 0a 00 00       	call   16e0 <UVM_Print_Int>
        UVM_LOG_S("\r\nInvocation entry takes clock cycles:");
     c33:	bf b8 21 00 00       	mov    $0x21b8,%edi
     c38:	e8 d3 0c 00 00       	call   1910 <UVM_Print_String>
        UVM_LOG_I(sumin/10000);
     c3d:	48 8b 05 c4 23 00 00 	mov    0x23c4(%rip),%rax        # 3008 <sumin>
     c44:	31 d2                	xor    %edx,%edx
     c46:	48 f7 f3             	div    %rbx
     c49:	48 89 c7             	mov    %rax,%rdi
     c4c:	e8 8f 0a 00 00       	call   16e0 <UVM_Print_Int>
        UVM_LOG_S("\r\nInvocation return takes clock cycles:");
     c51:	bf e0 21 00 00       	mov    $0x21e0,%edi
     c56:	e8 b5 0c 00 00       	call   1910 <UVM_Print_String>
        UVM_LOG_I(sumout/10000);
     c5b:	48 8b 05 9e 23 00 00 	mov    0x239e(%rip),%rax        # 3000 <sumout>
     c62:	31 d2                	xor    %edx,%edx
     c64:	48 f7 f3             	div    %rbx
     c67:	48 89 c7             	mov    %rax,%rdi
     c6a:	e8 71 0a 00 00       	call   16e0 <UVM_Print_Int>
        
        /*Invocation stub test ends here*/

        /*Idle*/
        UVM_LOG_S("\r\nIdle......");
     c6f:	bf 63 22 00 00       	mov    $0x2263,%edi
     c74:	e8 97 0c 00 00       	call   1910 <UVM_Print_String>
        while (1);
     c79:	eb fe                	jmp    c79 <main+0x6e9>
    }
    return 0;
}
     c7b:	5a                   	pop    %rdx
     c7c:	31 c0                	xor    %eax,%eax
     c7e:	5b                   	pop    %rbx
     c7f:	5d                   	pop    %rbp
     c80:	c3                   	ret    
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD_TBL,Cur_Addr,16)>=0);
     c81:	bf 08 20 00 00       	mov    $0x2008,%edi
     c86:	e8 85 0c 00 00       	call   1910 <UVM_Print_String>
     c8b:	bf 08 22 00 00       	mov    $0x2208,%edi
     c90:	e8 7b 0c 00 00       	call   1910 <UVM_Print_String>
     c95:	bf 14 22 00 00       	mov    $0x2214,%edi
     c9a:	e8 71 0c 00 00       	call   1910 <UVM_Print_String>
     c9f:	bf e8 00 00 00       	mov    $0xe8,%edi
     ca4:	e8 37 0a 00 00       	call   16e0 <UVM_Print_Int>
     ca9:	bf 1c 22 00 00       	mov    $0x221c,%edi
     cae:	e8 5d 0c 00 00       	call   1910 <UVM_Print_String>
     cb3:	bf 1f 22 00 00       	mov    $0x221f,%edi
     cb8:	e8 53 0c 00 00       	call   1910 <UVM_Print_String>
     cbd:	bf 2b 22 00 00       	mov    $0x222b,%edi
     cc2:	e8 49 0c 00 00       	call   1910 <UVM_Print_String>
     cc7:	bf 2e 22 00 00       	mov    $0x222e,%edi
     ccc:	e8 3f 0c 00 00       	call   1910 <UVM_Print_String>
     cd1:	bf 1c 22 00 00       	mov    $0x221c,%edi
     cd6:	e8 35 0c 00 00       	call   1910 <UVM_Print_String>
     cdb:	eb fe                	jmp    cdb <main+0x74b>
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD1, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
     cdd:	bf 08 20 00 00       	mov    $0x2008,%edi
     ce2:	e8 29 0c 00 00       	call   1910 <UVM_Print_String>
     ce7:	bf 08 22 00 00       	mov    $0x2208,%edi
     cec:	e8 1f 0c 00 00       	call   1910 <UVM_Print_String>
     cf1:	bf 14 22 00 00       	mov    $0x2214,%edi
     cf6:	e8 15 0c 00 00       	call   1910 <UVM_Print_String>
     cfb:	bf ea 00 00 00       	mov    $0xea,%edi
     d00:	e8 db 09 00 00       	call   16e0 <UVM_Print_Int>
     d05:	bf 1c 22 00 00       	mov    $0x221c,%edi
     d0a:	e8 01 0c 00 00       	call   1910 <UVM_Print_String>
     d0f:	bf 1f 22 00 00       	mov    $0x221f,%edi
     d14:	e8 f7 0b 00 00       	call   1910 <UVM_Print_String>
     d19:	bf 2b 22 00 00       	mov    $0x222b,%edi
     d1e:	e8 ed 0b 00 00       	call   1910 <UVM_Print_String>
     d23:	bf 2e 22 00 00       	mov    $0x222e,%edi
     d28:	e8 e3 0b 00 00       	call   1910 <UVM_Print_String>
     d2d:	bf 1c 22 00 00       	mov    $0x221c,%edi
     d32:	e8 d9 0b 00 00       	call   1910 <UVM_Print_String>
     d37:	eb fe                	jmp    d37 <main+0x7a7>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD1),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
     d39:	bf 08 20 00 00       	mov    $0x2008,%edi
     d3e:	e8 cd 0b 00 00       	call   1910 <UVM_Print_String>
     d43:	bf 08 22 00 00       	mov    $0x2208,%edi
     d48:	e8 c3 0b 00 00       	call   1910 <UVM_Print_String>
     d4d:	bf 14 22 00 00       	mov    $0x2214,%edi
     d52:	e8 b9 0b 00 00       	call   1910 <UVM_Print_String>
     d57:	bf eb 00 00 00       	mov    $0xeb,%edi
     d5c:	e8 7f 09 00 00       	call   16e0 <UVM_Print_Int>
     d61:	bf 1c 22 00 00       	mov    $0x221c,%edi
     d66:	e8 a5 0b 00 00       	call   1910 <UVM_Print_String>
     d6b:	bf 1f 22 00 00       	mov    $0x221f,%edi
     d70:	e8 9b 0b 00 00       	call   1910 <UVM_Print_String>
     d75:	bf 2b 22 00 00       	mov    $0x222b,%edi
     d7a:	e8 91 0b 00 00       	call   1910 <UVM_Print_String>
     d7f:	bf 2e 22 00 00       	mov    $0x222e,%edi
     d84:	e8 87 0b 00 00       	call   1910 <UVM_Print_String>
     d89:	bf 1c 22 00 00       	mov    $0x221c,%edi
     d8e:	e8 7d 0b 00 00       	call   1910 <UVM_Print_String>
     d93:	eb fe                	jmp    d93 <main+0x803>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD1),(ptr_t)TEST_THD_FUNC1,12*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     d95:	bf 08 20 00 00       	mov    $0x2008,%edi
     d9a:	e8 71 0b 00 00       	call   1910 <UVM_Print_String>
     d9f:	bf 08 22 00 00       	mov    $0x2208,%edi
     da4:	e8 67 0b 00 00       	call   1910 <UVM_Print_String>
     da9:	bf 14 22 00 00       	mov    $0x2214,%edi
     dae:	e8 5d 0b 00 00       	call   1910 <UVM_Print_String>
     db3:	bf ee 00 00 00       	mov    $0xee,%edi
     db8:	e8 23 09 00 00       	call   16e0 <UVM_Print_Int>
     dbd:	bf 1c 22 00 00       	mov    $0x221c,%edi
     dc2:	e8 49 0b 00 00       	call   1910 <UVM_Print_String>
     dc7:	bf 1f 22 00 00       	mov    $0x221f,%edi
     dcc:	e8 3f 0b 00 00       	call   1910 <UVM_Print_String>
     dd1:	bf 2b 22 00 00       	mov    $0x222b,%edi
     dd6:	e8 35 0b 00 00       	call   1910 <UVM_Print_String>
     ddb:	bf 2e 22 00 00       	mov    $0x222e,%edi
     de0:	e8 2b 0b 00 00       	call   1910 <UVM_Print_String>
     de5:	bf 1c 22 00 00       	mov    $0x221c,%edi
     dea:	e8 21 0b 00 00       	call   1910 <UVM_Print_String>
     def:	eb fe                	jmp    def <main+0x85f>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD1),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     df1:	bf 08 20 00 00       	mov    $0x2008,%edi
     df6:	e8 15 0b 00 00       	call   1910 <UVM_Print_String>
     dfb:	bf 08 22 00 00       	mov    $0x2208,%edi
     e00:	e8 0b 0b 00 00       	call   1910 <UVM_Print_String>
     e05:	bf 14 22 00 00       	mov    $0x2214,%edi
     e0a:	e8 01 0b 00 00       	call   1910 <UVM_Print_String>
     e0f:	bf ec 00 00 00       	mov    $0xec,%edi
     e14:	e8 c7 08 00 00       	call   16e0 <UVM_Print_Int>
     e19:	bf 1c 22 00 00       	mov    $0x221c,%edi
     e1e:	e8 ed 0a 00 00       	call   1910 <UVM_Print_String>
     e23:	bf 1f 22 00 00       	mov    $0x221f,%edi
     e28:	e8 e3 0a 00 00       	call   1910 <UVM_Print_String>
     e2d:	bf 2b 22 00 00       	mov    $0x222b,%edi
     e32:	e8 d9 0a 00 00       	call   1910 <UVM_Print_String>
     e37:	bf 2e 22 00 00       	mov    $0x222e,%edi
     e3c:	e8 cf 0a 00 00       	call   1910 <UVM_Print_String>
     e41:	bf 1c 22 00 00       	mov    $0x221c,%edi
     e46:	e8 c5 0a 00 00       	call   1910 <UVM_Print_String>
     e4b:	eb fe                	jmp    e4b <main+0x8bb>
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD2, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
     e4d:	bf 08 20 00 00       	mov    $0x2008,%edi
     e52:	e8 b9 0a 00 00       	call   1910 <UVM_Print_String>
     e57:	bf 08 22 00 00       	mov    $0x2208,%edi
     e5c:	e8 af 0a 00 00       	call   1910 <UVM_Print_String>
     e61:	bf 14 22 00 00       	mov    $0x2214,%edi
     e66:	e8 a5 0a 00 00       	call   1910 <UVM_Print_String>
     e6b:	bf f0 00 00 00       	mov    $0xf0,%edi
     e70:	e8 6b 08 00 00       	call   16e0 <UVM_Print_Int>
     e75:	bf 1c 22 00 00       	mov    $0x221c,%edi
     e7a:	e8 91 0a 00 00       	call   1910 <UVM_Print_String>
     e7f:	bf 1f 22 00 00       	mov    $0x221f,%edi
     e84:	e8 87 0a 00 00       	call   1910 <UVM_Print_String>
     e89:	bf 2b 22 00 00       	mov    $0x222b,%edi
     e8e:	e8 7d 0a 00 00       	call   1910 <UVM_Print_String>
     e93:	bf 2e 22 00 00       	mov    $0x222e,%edi
     e98:	e8 73 0a 00 00       	call   1910 <UVM_Print_String>
     e9d:	bf 1c 22 00 00       	mov    $0x221c,%edi
     ea2:	e8 69 0a 00 00       	call   1910 <UVM_Print_String>
     ea7:	eb fe                	jmp    ea7 <main+0x917>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD2),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
     ea9:	bf 08 20 00 00       	mov    $0x2008,%edi
     eae:	e8 5d 0a 00 00       	call   1910 <UVM_Print_String>
     eb3:	bf 08 22 00 00       	mov    $0x2208,%edi
     eb8:	e8 53 0a 00 00       	call   1910 <UVM_Print_String>
     ebd:	bf 14 22 00 00       	mov    $0x2214,%edi
     ec2:	e8 49 0a 00 00       	call   1910 <UVM_Print_String>
     ec7:	bf f1 00 00 00       	mov    $0xf1,%edi
     ecc:	e8 0f 08 00 00       	call   16e0 <UVM_Print_Int>
     ed1:	bf 1c 22 00 00       	mov    $0x221c,%edi
     ed6:	e8 35 0a 00 00       	call   1910 <UVM_Print_String>
     edb:	bf 1f 22 00 00       	mov    $0x221f,%edi
     ee0:	e8 2b 0a 00 00       	call   1910 <UVM_Print_String>
     ee5:	bf 2b 22 00 00       	mov    $0x222b,%edi
     eea:	e8 21 0a 00 00       	call   1910 <UVM_Print_String>
     eef:	bf 2e 22 00 00       	mov    $0x222e,%edi
     ef4:	e8 17 0a 00 00       	call   1910 <UVM_Print_String>
     ef9:	bf 1c 22 00 00       	mov    $0x221c,%edi
     efe:	e8 0d 0a 00 00       	call   1910 <UVM_Print_String>
     f03:	eb fe                	jmp    f03 <main+0x973>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD2),(ptr_t)TEST_THD_FUNC2,13*UVM_POW2(RME_PGT_SIZE_1M),1)>=0);
     f05:	bf 08 20 00 00       	mov    $0x2008,%edi
     f0a:	e8 01 0a 00 00       	call   1910 <UVM_Print_String>
     f0f:	bf 08 22 00 00       	mov    $0x2208,%edi
     f14:	e8 f7 09 00 00       	call   1910 <UVM_Print_String>
     f19:	bf 14 22 00 00       	mov    $0x2214,%edi
     f1e:	e8 ed 09 00 00       	call   1910 <UVM_Print_String>
     f23:	bf f4 00 00 00       	mov    $0xf4,%edi
     f28:	e8 b3 07 00 00       	call   16e0 <UVM_Print_Int>
     f2d:	bf 1c 22 00 00       	mov    $0x221c,%edi
     f32:	e8 d9 09 00 00       	call   1910 <UVM_Print_String>
     f37:	bf 1f 22 00 00       	mov    $0x221f,%edi
     f3c:	e8 cf 09 00 00       	call   1910 <UVM_Print_String>
     f41:	bf 2b 22 00 00       	mov    $0x222b,%edi
     f46:	e8 c5 09 00 00       	call   1910 <UVM_Print_String>
     f4b:	bf 2e 22 00 00       	mov    $0x222e,%edi
     f50:	e8 bb 09 00 00       	call   1910 <UVM_Print_String>
     f55:	bf 1c 22 00 00       	mov    $0x221c,%edi
     f5a:	e8 b1 09 00 00       	call   1910 <UVM_Print_String>
     f5f:	eb fe                	jmp    f5f <main+0x9cf>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD2),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     f61:	bf 08 20 00 00       	mov    $0x2008,%edi
     f66:	e8 a5 09 00 00       	call   1910 <UVM_Print_String>
     f6b:	bf 08 22 00 00       	mov    $0x2208,%edi
     f70:	e8 9b 09 00 00       	call   1910 <UVM_Print_String>
     f75:	bf 14 22 00 00       	mov    $0x2214,%edi
     f7a:	e8 91 09 00 00       	call   1910 <UVM_Print_String>
     f7f:	bf f2 00 00 00       	mov    $0xf2,%edi
     f84:	e8 57 07 00 00       	call   16e0 <UVM_Print_Int>
     f89:	bf 1c 22 00 00       	mov    $0x221c,%edi
     f8e:	e8 7d 09 00 00       	call   1910 <UVM_Print_String>
     f93:	bf 1f 22 00 00       	mov    $0x221f,%edi
     f98:	e8 73 09 00 00       	call   1910 <UVM_Print_String>
     f9d:	bf 2b 22 00 00       	mov    $0x222b,%edi
     fa2:	e8 69 09 00 00       	call   1910 <UVM_Print_String>
     fa7:	bf 2e 22 00 00       	mov    $0x222e,%edi
     fac:	e8 5f 09 00 00       	call   1910 <UVM_Print_String>
     fb1:	bf 1c 22 00 00       	mov    $0x221c,%edi
     fb6:	e8 55 09 00 00       	call   1910 <UVM_Print_String>
     fbb:	eb fe                	jmp    fbb <main+0xa2b>
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG1, Cur_Addr)>=0);
     fbd:	bf 08 20 00 00       	mov    $0x2008,%edi
     fc2:	e8 49 09 00 00       	call   1910 <UVM_Print_String>
     fc7:	bf 08 22 00 00       	mov    $0x2208,%edi
     fcc:	e8 3f 09 00 00       	call   1910 <UVM_Print_String>
     fd1:	bf 14 22 00 00       	mov    $0x2214,%edi
     fd6:	e8 35 09 00 00       	call   1910 <UVM_Print_String>
     fdb:	bf fd 00 00 00       	mov    $0xfd,%edi
     fe0:	e8 fb 06 00 00       	call   16e0 <UVM_Print_Int>
     fe5:	bf 1c 22 00 00       	mov    $0x221c,%edi
     fea:	e8 21 09 00 00       	call   1910 <UVM_Print_String>
     fef:	bf 1f 22 00 00       	mov    $0x221f,%edi
     ff4:	e8 17 09 00 00       	call   1910 <UVM_Print_String>
     ff9:	bf 2b 22 00 00       	mov    $0x222b,%edi
     ffe:	e8 0d 09 00 00       	call   1910 <UVM_Print_String>
    1003:	bf 2e 22 00 00       	mov    $0x222e,%edi
    1008:	e8 03 09 00 00       	call   1910 <UVM_Print_String>
    100d:	bf 1c 22 00 00       	mov    $0x221c,%edi
    1012:	e8 f9 08 00 00       	call   1910 <UVM_Print_String>
    1017:	eb fe                	jmp    1017 <main+0xa87>
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD1),1)>=0);
    1019:	bf 08 20 00 00       	mov    $0x2008,%edi
    101e:	e8 ed 08 00 00       	call   1910 <UVM_Print_String>
    1023:	bf 08 22 00 00       	mov    $0x2208,%edi
    1028:	e8 e3 08 00 00       	call   1910 <UVM_Print_String>
    102d:	bf 14 22 00 00       	mov    $0x2214,%edi
    1032:	e8 d9 08 00 00       	call   1910 <UVM_Print_String>
    1037:	bf 05 01 00 00       	mov    $0x105,%edi
    103c:	e8 9f 06 00 00       	call   16e0 <UVM_Print_Int>
    1041:	bf 1c 22 00 00       	mov    $0x221c,%edi
    1046:	e8 c5 08 00 00       	call   1910 <UVM_Print_String>
    104b:	bf 1f 22 00 00       	mov    $0x221f,%edi
    1050:	e8 bb 08 00 00       	call   1910 <UVM_Print_String>
    1055:	bf 2b 22 00 00       	mov    $0x222b,%edi
    105a:	e8 b1 08 00 00       	call   1910 <UVM_Print_String>
    105f:	bf 2e 22 00 00       	mov    $0x222e,%edi
    1064:	e8 a7 08 00 00       	call   1910 <UVM_Print_String>
    1069:	bf 1c 22 00 00       	mov    $0x221c,%edi
    106e:	e8 9d 08 00 00       	call   1910 <UVM_Print_String>
    1073:	eb fe                	jmp    1073 <main+0xae3>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD1),(ptr_t)TEST_SIG_FUNC1,12*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
    1075:	bf 08 20 00 00       	mov    $0x2008,%edi
    107a:	e8 91 08 00 00       	call   1910 <UVM_Print_String>
    107f:	bf 08 22 00 00       	mov    $0x2208,%edi
    1084:	e8 87 08 00 00       	call   1910 <UVM_Print_String>
    1089:	bf 14 22 00 00       	mov    $0x2214,%edi
    108e:	e8 7d 08 00 00       	call   1910 <UVM_Print_String>
    1093:	bf 01 01 00 00       	mov    $0x101,%edi
    1098:	e8 43 06 00 00       	call   16e0 <UVM_Print_Int>
    109d:	bf 1c 22 00 00       	mov    $0x221c,%edi
    10a2:	e8 69 08 00 00       	call   1910 <UVM_Print_String>
    10a7:	bf 1f 22 00 00       	mov    $0x221f,%edi
    10ac:	e8 5f 08 00 00       	call   1910 <UVM_Print_String>
    10b1:	bf 2b 22 00 00       	mov    $0x222b,%edi
    10b6:	e8 55 08 00 00       	call   1910 <UVM_Print_String>
    10bb:	bf 2e 22 00 00       	mov    $0x222e,%edi
    10c0:	e8 4b 08 00 00       	call   1910 <UVM_Print_String>
    10c5:	bf 1c 22 00 00       	mov    $0x221c,%edi
    10ca:	e8 41 08 00 00       	call   1910 <UVM_Print_String>
    10cf:	eb fe                	jmp    10cf <main+0xb3f>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD3),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
    10d1:	bf 08 20 00 00       	mov    $0x2008,%edi
    10d6:	e8 35 08 00 00       	call   1910 <UVM_Print_String>
    10db:	bf 08 22 00 00       	mov    $0x2208,%edi
    10e0:	e8 2b 08 00 00       	call   1910 <UVM_Print_String>
    10e5:	bf 14 22 00 00       	mov    $0x2214,%edi
    10ea:	e8 21 08 00 00       	call   1910 <UVM_Print_String>
    10ef:	bf 3e 01 00 00       	mov    $0x13e,%edi
    10f4:	e8 e7 05 00 00       	call   16e0 <UVM_Print_Int>
    10f9:	bf 1c 22 00 00       	mov    $0x221c,%edi
    10fe:	e8 0d 08 00 00       	call   1910 <UVM_Print_String>
    1103:	bf 1f 22 00 00       	mov    $0x221f,%edi
    1108:	e8 03 08 00 00       	call   1910 <UVM_Print_String>
    110d:	bf 2b 22 00 00       	mov    $0x222b,%edi
    1112:	e8 f9 07 00 00       	call   1910 <UVM_Print_String>
    1117:	bf 2e 22 00 00       	mov    $0x222e,%edi
    111c:	e8 ef 07 00 00       	call   1910 <UVM_Print_String>
    1121:	bf 1c 22 00 00       	mov    $0x221c,%edi
    1126:	e8 e5 07 00 00       	call   1910 <UVM_Print_String>
    112b:	eb fe                	jmp    112b <main+0xb9b>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD4),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
    112d:	bf 08 20 00 00       	mov    $0x2008,%edi
    1132:	e8 d9 07 00 00       	call   1910 <UVM_Print_String>
    1137:	bf 08 22 00 00       	mov    $0x2208,%edi
    113c:	e8 cf 07 00 00       	call   1910 <UVM_Print_String>
    1141:	bf 14 22 00 00       	mov    $0x2214,%edi
    1146:	e8 c5 07 00 00       	call   1910 <UVM_Print_String>
    114b:	bf 45 01 00 00       	mov    $0x145,%edi
    1150:	e8 8b 05 00 00       	call   16e0 <UVM_Print_Int>
    1155:	bf 1c 22 00 00       	mov    $0x221c,%edi
    115a:	e8 b1 07 00 00       	call   1910 <UVM_Print_String>
    115f:	bf 1f 22 00 00       	mov    $0x221f,%edi
    1164:	e8 a7 07 00 00       	call   1910 <UVM_Print_String>
    1169:	bf 2b 22 00 00       	mov    $0x222b,%edi
    116e:	e8 9d 07 00 00       	call   1910 <UVM_Print_String>
    1173:	bf 2e 22 00 00       	mov    $0x222e,%edi
    1178:	e8 93 07 00 00       	call   1910 <UVM_Print_String>
    117d:	bf 1c 22 00 00       	mov    $0x221c,%edi
    1182:	e8 89 07 00 00       	call   1910 <UVM_Print_String>
    1187:	eb fe                	jmp    1187 <main+0xbf7>
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD4, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
    1189:	bf 08 20 00 00       	mov    $0x2008,%edi
    118e:	e8 7d 07 00 00       	call   1910 <UVM_Print_String>
    1193:	bf 08 22 00 00       	mov    $0x2208,%edi
    1198:	e8 73 07 00 00       	call   1910 <UVM_Print_String>
    119d:	bf 14 22 00 00       	mov    $0x2214,%edi
    11a2:	e8 69 07 00 00       	call   1910 <UVM_Print_String>
    11a7:	bf 43 01 00 00       	mov    $0x143,%edi
    11ac:	e8 2f 05 00 00       	call   16e0 <UVM_Print_Int>
    11b1:	bf 1c 22 00 00       	mov    $0x221c,%edi
    11b6:	e8 55 07 00 00       	call   1910 <UVM_Print_String>
    11bb:	bf 1f 22 00 00       	mov    $0x221f,%edi
    11c0:	e8 4b 07 00 00       	call   1910 <UVM_Print_String>
    11c5:	bf 2b 22 00 00       	mov    $0x222b,%edi
    11ca:	e8 41 07 00 00       	call   1910 <UVM_Print_String>
    11cf:	bf 2e 22 00 00       	mov    $0x222e,%edi
    11d4:	e8 37 07 00 00       	call   1910 <UVM_Print_String>
    11d9:	bf 1c 22 00 00       	mov    $0x221c,%edi
    11de:	e8 2d 07 00 00       	call   1910 <UVM_Print_String>
    11e3:	eb fe                	jmp    11e3 <main+0xc53>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD3),(ptr_t)TEST_THD_FUNC3,14*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
    11e5:	bf 08 20 00 00       	mov    $0x2008,%edi
    11ea:	e8 21 07 00 00       	call   1910 <UVM_Print_String>
    11ef:	bf 08 22 00 00       	mov    $0x2208,%edi
    11f4:	e8 17 07 00 00       	call   1910 <UVM_Print_String>
    11f9:	bf 14 22 00 00       	mov    $0x2214,%edi
    11fe:	e8 0d 07 00 00       	call   1910 <UVM_Print_String>
    1203:	bf 40 01 00 00       	mov    $0x140,%edi
    1208:	e8 d3 04 00 00       	call   16e0 <UVM_Print_Int>
    120d:	bf 1c 22 00 00       	mov    $0x221c,%edi
    1212:	e8 f9 06 00 00       	call   1910 <UVM_Print_String>
    1217:	bf 1f 22 00 00       	mov    $0x221f,%edi
    121c:	e8 ef 06 00 00       	call   1910 <UVM_Print_String>
    1221:	bf 2b 22 00 00       	mov    $0x222b,%edi
    1226:	e8 e5 06 00 00       	call   1910 <UVM_Print_String>
    122b:	bf 2e 22 00 00       	mov    $0x222e,%edi
    1230:	e8 db 06 00 00       	call   1910 <UVM_Print_String>
    1235:	bf 1c 22 00 00       	mov    $0x221c,%edi
    123a:	e8 d1 06 00 00       	call   1910 <UVM_Print_String>
    123f:	eb fe                	jmp    123f <main+0xcaf>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD3),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
    1241:	bf 08 20 00 00       	mov    $0x2008,%edi
    1246:	e8 c5 06 00 00       	call   1910 <UVM_Print_String>
    124b:	bf 08 22 00 00       	mov    $0x2208,%edi
    1250:	e8 bb 06 00 00       	call   1910 <UVM_Print_String>
    1255:	bf 14 22 00 00       	mov    $0x2214,%edi
    125a:	e8 b1 06 00 00       	call   1910 <UVM_Print_String>
    125f:	bf 3d 01 00 00       	mov    $0x13d,%edi
    1264:	e8 77 04 00 00       	call   16e0 <UVM_Print_Int>
    1269:	bf 1c 22 00 00       	mov    $0x221c,%edi
    126e:	e8 9d 06 00 00       	call   1910 <UVM_Print_String>
    1273:	bf 1f 22 00 00       	mov    $0x221f,%edi
    1278:	e8 93 06 00 00       	call   1910 <UVM_Print_String>
    127d:	bf 2b 22 00 00       	mov    $0x222b,%edi
    1282:	e8 89 06 00 00       	call   1910 <UVM_Print_String>
    1287:	bf 2e 22 00 00       	mov    $0x222e,%edi
    128c:	e8 7f 06 00 00       	call   1910 <UVM_Print_String>
    1291:	bf 1c 22 00 00       	mov    $0x221c,%edi
    1296:	e8 75 06 00 00       	call   1910 <UVM_Print_String>
    129b:	eb fe                	jmp    129b <main+0xd0b>
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD3, TEST_PROCESS, 10, Cur_Addr)>=0);
    129d:	bf 08 20 00 00       	mov    $0x2008,%edi
    12a2:	e8 69 06 00 00       	call   1910 <UVM_Print_String>
    12a7:	bf 08 22 00 00       	mov    $0x2208,%edi
    12ac:	e8 5f 06 00 00       	call   1910 <UVM_Print_String>
    12b1:	bf 14 22 00 00       	mov    $0x2214,%edi
    12b6:	e8 55 06 00 00       	call   1910 <UVM_Print_String>
    12bb:	bf 3c 01 00 00       	mov    $0x13c,%edi
    12c0:	e8 1b 04 00 00       	call   16e0 <UVM_Print_Int>
    12c5:	bf 1c 22 00 00       	mov    $0x221c,%edi
    12ca:	e8 41 06 00 00       	call   1910 <UVM_Print_String>
    12cf:	bf 1f 22 00 00       	mov    $0x221f,%edi
    12d4:	e8 37 06 00 00       	call   1910 <UVM_Print_String>
    12d9:	bf 2b 22 00 00       	mov    $0x222b,%edi
    12de:	e8 2d 06 00 00       	call   1910 <UVM_Print_String>
    12e3:	bf 2e 22 00 00       	mov    $0x222e,%edi
    12e8:	e8 23 06 00 00       	call   1910 <UVM_Print_String>
    12ed:	bf 1c 22 00 00       	mov    $0x221c,%edi
    12f2:	e8 19 06 00 00       	call   1910 <UVM_Print_String>
    12f7:	eb fe                	jmp    12f7 <main+0xd67>
        UVM_ASSERT(UVM_Proc_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS,UVM_BOOT_CAPTBL,
    12f9:	bf 08 20 00 00       	mov    $0x2008,%edi
    12fe:	e8 0d 06 00 00       	call   1910 <UVM_Print_String>
    1303:	bf 08 22 00 00       	mov    $0x2208,%edi
    1308:	e8 03 06 00 00       	call   1910 <UVM_Print_String>
    130d:	bf 14 22 00 00       	mov    $0x2214,%edi
    1312:	e8 f9 05 00 00       	call   1910 <UVM_Print_String>
    1317:	bf 39 01 00 00       	mov    $0x139,%edi
    131c:	e8 bf 03 00 00       	call   16e0 <UVM_Print_Int>
    1321:	bf 1c 22 00 00       	mov    $0x221c,%edi
    1326:	e8 e5 05 00 00       	call   1910 <UVM_Print_String>
    132b:	bf 1f 22 00 00       	mov    $0x221f,%edi
    1330:	e8 db 05 00 00       	call   1910 <UVM_Print_String>
    1335:	bf 2b 22 00 00       	mov    $0x222b,%edi
    133a:	e8 d1 05 00 00       	call   1910 <UVM_Print_String>
    133f:	bf 2e 22 00 00       	mov    $0x222e,%edi
    1344:	e8 c7 05 00 00       	call   1910 <UVM_Print_String>
    1349:	bf 1c 22 00 00       	mov    $0x221c,%edi
    134e:	e8 bd 05 00 00       	call   1910 <UVM_Print_String>
    1353:	eb fe                	jmp    1353 <main+0xdc3>
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD1),0)>=0);
    1355:	bf 08 20 00 00       	mov    $0x2008,%edi
    135a:	e8 b1 05 00 00       	call   1910 <UVM_Print_String>
    135f:	bf 08 22 00 00       	mov    $0x2208,%edi
    1364:	e8 a7 05 00 00       	call   1910 <UVM_Print_String>
    1369:	bf 14 22 00 00       	mov    $0x2214,%edi
    136e:	e8 9d 05 00 00       	call   1910 <UVM_Print_String>
    1373:	bf 0a 01 00 00       	mov    $0x10a,%edi
    1378:	e8 63 03 00 00       	call   16e0 <UVM_Print_Int>
    137d:	bf 1c 22 00 00       	mov    $0x221c,%edi
    1382:	e8 89 05 00 00       	call   1910 <UVM_Print_String>
    1387:	bf 1f 22 00 00       	mov    $0x221f,%edi
    138c:	e8 7f 05 00 00       	call   1910 <UVM_Print_String>
    1391:	bf 2b 22 00 00       	mov    $0x222b,%edi
    1396:	e8 75 05 00 00       	call   1910 <UVM_Print_String>
    139b:	bf 2e 22 00 00       	mov    $0x222e,%edi
    13a0:	e8 6b 05 00 00       	call   1910 <UVM_Print_String>
    13a5:	bf 1c 22 00 00       	mov    $0x221c,%edi
    13aa:	e8 61 05 00 00       	call   1910 <UVM_Print_String>
    13af:	eb fe                	jmp    13af <main+0xe1f>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD4),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
    13b1:	bf 08 20 00 00       	mov    $0x2008,%edi
    13b6:	e8 55 05 00 00       	call   1910 <UVM_Print_String>
    13bb:	bf 08 22 00 00       	mov    $0x2208,%edi
    13c0:	e8 4b 05 00 00       	call   1910 <UVM_Print_String>
    13c5:	bf 14 22 00 00       	mov    $0x2214,%edi
    13ca:	e8 41 05 00 00       	call   1910 <UVM_Print_String>
    13cf:	bf 44 01 00 00       	mov    $0x144,%edi
    13d4:	e8 07 03 00 00       	call   16e0 <UVM_Print_Int>
    13d9:	bf 1c 22 00 00       	mov    $0x221c,%edi
    13de:	e8 2d 05 00 00       	call   1910 <UVM_Print_String>
    13e3:	bf 1f 22 00 00       	mov    $0x221f,%edi
    13e8:	e8 23 05 00 00       	call   1910 <UVM_Print_String>
    13ed:	bf 2b 22 00 00       	mov    $0x222b,%edi
    13f2:	e8 19 05 00 00       	call   1910 <UVM_Print_String>
    13f7:	bf 2e 22 00 00       	mov    $0x222e,%edi
    13fc:	e8 0f 05 00 00       	call   1910 <UVM_Print_String>
    1401:	bf 1c 22 00 00       	mov    $0x221c,%edi
    1406:	e8 05 05 00 00       	call   1910 <UVM_Print_String>
    140b:	eb fe                	jmp    140b <main+0xe7b>
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG2, Cur_Addr)>=0);
    140d:	bf 08 20 00 00       	mov    $0x2008,%edi
    1412:	e8 f9 04 00 00       	call   1910 <UVM_Print_String>
    1417:	bf 08 22 00 00       	mov    $0x2208,%edi
    141c:	e8 ef 04 00 00       	call   1910 <UVM_Print_String>
    1421:	bf 14 22 00 00       	mov    $0x2214,%edi
    1426:	e8 e5 04 00 00       	call   1910 <UVM_Print_String>
    142b:	bf 52 01 00 00       	mov    $0x152,%edi
    1430:	e8 ab 02 00 00       	call   16e0 <UVM_Print_Int>
    1435:	bf 1c 22 00 00       	mov    $0x221c,%edi
    143a:	e8 d1 04 00 00       	call   1910 <UVM_Print_String>
    143f:	bf 1f 22 00 00       	mov    $0x221f,%edi
    1444:	e8 c7 04 00 00       	call   1910 <UVM_Print_String>
    1449:	bf 2b 22 00 00       	mov    $0x222b,%edi
    144e:	e8 bd 04 00 00       	call   1910 <UVM_Print_String>
    1453:	bf 2e 22 00 00       	mov    $0x222e,%edi
    1458:	e8 b3 04 00 00       	call   1910 <UVM_Print_String>
    145d:	bf 1c 22 00 00       	mov    $0x221c,%edi
    1462:	e8 a9 04 00 00       	call   1910 <UVM_Print_String>
    1467:	eb fe                	jmp    1467 <main+0xed7>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD4),(ptr_t)TEST_THD_FUNC4,15*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
    1469:	bf 08 20 00 00       	mov    $0x2008,%edi
    146e:	e8 9d 04 00 00       	call   1910 <UVM_Print_String>
    1473:	bf 08 22 00 00       	mov    $0x2208,%edi
    1478:	e8 93 04 00 00       	call   1910 <UVM_Print_String>
    147d:	bf 14 22 00 00       	mov    $0x2214,%edi
    1482:	e8 89 04 00 00       	call   1910 <UVM_Print_String>
    1487:	bf 47 01 00 00       	mov    $0x147,%edi
    148c:	e8 4f 02 00 00       	call   16e0 <UVM_Print_Int>
    1491:	bf 1c 22 00 00       	mov    $0x221c,%edi
    1496:	e8 75 04 00 00       	call   1910 <UVM_Print_String>
    149b:	bf 1f 22 00 00       	mov    $0x221f,%edi
    14a0:	e8 6b 04 00 00       	call   1910 <UVM_Print_String>
    14a5:	bf 2b 22 00 00       	mov    $0x222b,%edi
    14aa:	e8 61 04 00 00       	call   1910 <UVM_Print_String>
    14af:	bf 2e 22 00 00       	mov    $0x222e,%edi
    14b4:	e8 57 04 00 00       	call   1910 <UVM_Print_String>
    14b9:	bf 1c 22 00 00       	mov    $0x221c,%edi
    14be:	e8 4d 04 00 00       	call   1910 <UVM_Print_String>
    14c3:	eb fe                	jmp    14c3 <main+0xf33>
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD3),1)>=0);
    14c5:	bf 08 20 00 00       	mov    $0x2008,%edi
    14ca:	e8 41 04 00 00       	call   1910 <UVM_Print_String>
    14cf:	bf 08 22 00 00       	mov    $0x2208,%edi
    14d4:	e8 37 04 00 00       	call   1910 <UVM_Print_String>
    14d9:	bf 14 22 00 00       	mov    $0x2214,%edi
    14de:	e8 2d 04 00 00       	call   1910 <UVM_Print_String>
    14e3:	bf 57 01 00 00       	mov    $0x157,%edi
    14e8:	e8 f3 01 00 00       	call   16e0 <UVM_Print_Int>
    14ed:	bf 1c 22 00 00       	mov    $0x221c,%edi
    14f2:	e8 19 04 00 00       	call   1910 <UVM_Print_String>
    14f7:	bf 1f 22 00 00       	mov    $0x221f,%edi
    14fc:	e8 0f 04 00 00       	call   1910 <UVM_Print_String>
    1501:	bf 2b 22 00 00       	mov    $0x222b,%edi
    1506:	e8 05 04 00 00       	call   1910 <UVM_Print_String>
    150b:	bf 2e 22 00 00       	mov    $0x222e,%edi
    1510:	e8 fb 03 00 00       	call   1910 <UVM_Print_String>
    1515:	bf 1c 22 00 00       	mov    $0x221c,%edi
    151a:	e8 f1 03 00 00       	call   1910 <UVM_Print_String>
    151f:	eb fe                	jmp    151f <main+0xf8f>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD3),(ptr_t)TEST_SIG_FUNC2,14*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
    1521:	bf 08 20 00 00       	mov    $0x2008,%edi
    1526:	e8 e5 03 00 00       	call   1910 <UVM_Print_String>
    152b:	bf 08 22 00 00       	mov    $0x2208,%edi
    1530:	e8 db 03 00 00       	call   1910 <UVM_Print_String>
    1535:	bf 14 22 00 00       	mov    $0x2214,%edi
    153a:	e8 d1 03 00 00       	call   1910 <UVM_Print_String>
    153f:	bf 55 01 00 00       	mov    $0x155,%edi
    1544:	e8 97 01 00 00       	call   16e0 <UVM_Print_Int>
    1549:	bf 1c 22 00 00       	mov    $0x221c,%edi
    154e:	e8 bd 03 00 00       	call   1910 <UVM_Print_String>
    1553:	bf 1f 22 00 00       	mov    $0x221f,%edi
    1558:	e8 b3 03 00 00       	call   1910 <UVM_Print_String>
    155d:	bf 2b 22 00 00       	mov    $0x222b,%edi
    1562:	e8 a9 03 00 00       	call   1910 <UVM_Print_String>
    1567:	bf 2e 22 00 00       	mov    $0x222e,%edi
    156c:	e8 9f 03 00 00       	call   1910 <UVM_Print_String>
    1571:	bf 1c 22 00 00       	mov    $0x221c,%edi
    1576:	e8 95 03 00 00       	call   1910 <UVM_Print_String>
    157b:	eb fe                	jmp    157b <main+0xfeb>
        UVM_ASSERT(UVM_Inv_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_INV1, TEST_PROCESS, Cur_Addr)>=0);
    157d:	bf 08 20 00 00       	mov    $0x2008,%edi
    1582:	e8 89 03 00 00       	call   1910 <UVM_Print_String>
    1587:	bf 08 22 00 00       	mov    $0x2208,%edi
    158c:	e8 7f 03 00 00       	call   1910 <UVM_Print_String>
    1591:	bf 14 22 00 00       	mov    $0x2214,%edi
    1596:	e8 75 03 00 00       	call   1910 <UVM_Print_String>
    159b:	bf 62 01 00 00       	mov    $0x162,%edi
    15a0:	e8 3b 01 00 00       	call   16e0 <UVM_Print_Int>
    15a5:	bf 1c 22 00 00       	mov    $0x221c,%edi
    15aa:	e8 61 03 00 00       	call   1910 <UVM_Print_String>
    15af:	bf 1f 22 00 00       	mov    $0x221f,%edi
    15b4:	e8 57 03 00 00       	call   1910 <UVM_Print_String>
    15b9:	bf 2b 22 00 00       	mov    $0x222b,%edi
    15be:	e8 4d 03 00 00       	call   1910 <UVM_Print_String>
    15c3:	bf 2e 22 00 00       	mov    $0x222e,%edi
    15c8:	e8 43 03 00 00       	call   1910 <UVM_Print_String>
    15cd:	bf 1c 22 00 00       	mov    $0x221c,%edi
    15d2:	e8 39 03 00 00       	call   1910 <UVM_Print_String>
    15d7:	eb fe                	jmp    15d7 <main+0x1047>
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD3),0)>=0);
    15d9:	bf 08 20 00 00       	mov    $0x2008,%edi
    15de:	e8 2d 03 00 00       	call   1910 <UVM_Print_String>
    15e3:	bf 08 22 00 00       	mov    $0x2208,%edi
    15e8:	e8 23 03 00 00       	call   1910 <UVM_Print_String>
    15ed:	bf 14 22 00 00       	mov    $0x2214,%edi
    15f2:	e8 19 03 00 00       	call   1910 <UVM_Print_String>
    15f7:	bf 5c 01 00 00       	mov    $0x15c,%edi
    15fc:	e8 df 00 00 00       	call   16e0 <UVM_Print_Int>
    1601:	bf 1c 22 00 00       	mov    $0x221c,%edi
    1606:	e8 05 03 00 00       	call   1910 <UVM_Print_String>
    160b:	bf 1f 22 00 00       	mov    $0x221f,%edi
    1610:	e8 fb 02 00 00       	call   1910 <UVM_Print_String>
    1615:	bf 2b 22 00 00       	mov    $0x222b,%edi
    161a:	e8 f1 02 00 00       	call   1910 <UVM_Print_String>
    161f:	bf 2e 22 00 00       	mov    $0x222e,%edi
    1624:	e8 e7 02 00 00       	call   1910 <UVM_Print_String>
    1629:	bf 1c 22 00 00       	mov    $0x221c,%edi
    162e:	e8 dd 02 00 00       	call   1910 <UVM_Print_String>
    1633:	eb fe                	jmp    1633 <main+0x10a3>
        UVM_ASSERT(UVM_Inv_Set(TEST_INV1,(ptr_t)TEST_INV1_FUNC,15*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
    1635:	bf 08 20 00 00       	mov    $0x2008,%edi
    163a:	e8 d1 02 00 00       	call   1910 <UVM_Print_String>
    163f:	bf 08 22 00 00       	mov    $0x2208,%edi
    1644:	e8 c7 02 00 00       	call   1910 <UVM_Print_String>
    1649:	bf 14 22 00 00       	mov    $0x2214,%edi
    164e:	e8 bd 02 00 00       	call   1910 <UVM_Print_String>
    1653:	bf 65 01 00 00       	mov    $0x165,%edi
    1658:	e8 83 00 00 00       	call   16e0 <UVM_Print_Int>
    165d:	bf 1c 22 00 00       	mov    $0x221c,%edi
    1662:	e8 a9 02 00 00       	call   1910 <UVM_Print_String>
    1667:	bf 1f 22 00 00       	mov    $0x221f,%edi
    166c:	e8 9f 02 00 00       	call   1910 <UVM_Print_String>
    1671:	bf 2b 22 00 00       	mov    $0x222b,%edi
    1676:	e8 95 02 00 00       	call   1910 <UVM_Print_String>
    167b:	bf 2e 22 00 00       	mov    $0x222e,%edi
    1680:	e8 8b 02 00 00       	call   1910 <UVM_Print_String>
    1685:	bf 1c 22 00 00       	mov    $0x221c,%edi
    168a:	e8 81 02 00 00       	call   1910 <UVM_Print_String>
    168f:	eb fe                	jmp    168f <main+0x10ff>
    1691:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    1698:	00 00 00 
    169b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

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
    1f34:	53                   	push   %rbx
    1f35:	89 fb                	mov    %edi,%ebx
    /* Wait until we have transmitted */
    while((__UVM_X64_In(UVM_X64_COM1+5)&0x20)==0);
    1f37:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    1f3e:	00 00 
    1f40:	bf fd 03 00 00       	mov    $0x3fd,%edi
    1f45:	e8 bb e0 ff ff       	call   5 <__UVM_X64_In>
    1f4a:	a8 20                	test   $0x20,%al
    1f4c:	74 f2                	je     1f40 <UVM_Putchar+0x10>

    __UVM_X64_Out(UVM_X64_COM1, Char);
    1f4e:	48 0f be f3          	movsbq %bl,%rsi
    1f52:	bf f8 03 00 00       	mov    $0x3f8,%edi
    1f57:	e8 b3 e0 ff ff       	call   f <__UVM_X64_Out>

    return 0;
}
    1f5c:	31 c0                	xor    %eax,%eax
    1f5e:	5b                   	pop    %rbx
    1f5f:	c3                   	ret    

0000000000001f60 <_UVM_Stack_Init>:
Output      : None.
Return      : ptr_t - The actual stack address to use for system call.
******************************************************************************/
ptr_t _UVM_Stack_Init(ptr_t Stack, ptr_t Size, ptr_t Stub, ptr_t Entry,
                      ptr_t Param1, ptr_t Param2, ptr_t Param3, ptr_t Param4)
{
    1f60:	f3 0f 1e fa          	endbr64 
	ptr_t* Stack_Ptr;

    Stack_Ptr=(ptr_t*)(Stack+Size-UVM_STACK_SAFE_SIZE*sizeof(ptr_t));
    Stack_Ptr[0]=Param1;
    1f64:	66 49 0f 6e c0       	movq   %r8,%xmm0
    1f69:	66 49 0f 6e c9       	movq   %r9,%xmm1
    Stack_Ptr=(ptr_t*)(Stack+Size-UVM_STACK_SAFE_SIZE*sizeof(ptr_t));
    1f6e:	48 8d 84 37 00 ff ff 	lea    -0x100(%rdi,%rsi,1),%rax
    1f75:	ff 
    Stack_Ptr[0]=Param1;
    1f76:	66 0f 6c c1          	punpcklqdq %xmm1,%xmm0
    Stack_Ptr[1]=Param2;
    Stack_Ptr[2]=Param3;
    Stack_Ptr[3]=Param4;
    Stack_Ptr[4]=Entry;
    1f7a:	48 89 48 20          	mov    %rcx,0x20(%rax)
    Stack_Ptr[0]=Param1;
    1f7e:	0f 11 00             	movups %xmm0,(%rax)
    1f81:	f3 0f 7e 44 24 08    	movq   0x8(%rsp),%xmm0
    1f87:	0f 16 44 24 10       	movhps 0x10(%rsp),%xmm0
    1f8c:	0f 11 40 10          	movups %xmm0,0x10(%rax)

    return (ptr_t)Stack_Ptr;
}
    1f90:	c3                   	ret    
    1f91:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1f98:	00 00 00 00 
    1f9c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001fa0 <_UVM_Idle>:
Input       : None.
Output      : None.
Return      : None.
******************************************************************************/
void _UVM_Idle(void)
{
    1fa0:	f3 0f 1e fa          	endbr64 
    /* Do nothing. In the future we may call a kernel function to put us to sleep */
}
    1fa4:	c3                   	ret    

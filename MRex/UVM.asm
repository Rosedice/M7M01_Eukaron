
./Object/UVM:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <_UVM_Entry>:
              space very well.
Input       : None.
Output      : None.
*****************************************************************************/
_UVM_Entry:
    JMP                 main
       0:	e9 eb 01 00 00       	jmp    1f0 <main>

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

0000000000000110 <TEST_INV1_FUNC>:
        UVM_Thd_Swt(TEST_THD1,0);
    }
}

void TEST_INV1_FUNC(ptr_t param)
{
     110:	f3 0f 1e fa          	endbr64 
     114:	55                   	push   %rbp
     115:	48 89 fd             	mov    %rdi,%rbp
    middle=__UVM_X64_Read_TSC();
     118:	e8 fe fe ff ff       	call   1b <__UVM_X64_Read_TSC>
    UVM_Inv_Ret(param);
     11d:	48 89 ef             	mov    %rbp,%rdi
}
     120:	5d                   	pop    %rbp
    middle=__UVM_X64_Read_TSC();
     121:	48 89 05 f8 1e 00 00 	mov    %rax,0x1ef8(%rip)        # 2020 <middle>
    UVM_Inv_Ret(param);
     128:	e9 b7 ff ff ff       	jmp    e4 <UVM_Inv_Ret>
     12d:	0f 1f 00             	nopl   (%rax)

0000000000000130 <TEST_THD1_FUNC>:
{
     130:	f3 0f 1e fa          	endbr64 
    sum=0;
     134:	48 c7 05 d1 1e 00 00 	movq   $0x0,0x1ed1(%rip)        # 2010 <sum>
     13b:	00 00 00 00 
{
     13f:	53                   	push   %rbx
    sum=0;
     140:	bb 10 27 00 00       	mov    $0x2710,%ebx
     145:	0f 1f 00             	nopl   (%rax)
        start=__UVM_X64_Read_TSC();
     148:	e8 ce fe ff ff       	call   1b <__UVM_X64_Read_TSC>
        UVM_Thd_Swt(TEST_THD2,0);
     14d:	31 f6                	xor    %esi,%esi
     14f:	bf 0a 00 00 00       	mov    $0xa,%edi
        start=__UVM_X64_Read_TSC();
     154:	48 89 05 cd 1e 00 00 	mov    %rax,0x1ecd(%rip)        # 2028 <start>
        UVM_Thd_Swt(TEST_THD2,0);
     15b:	e8 50 0d 00 00       	call   eb0 <UVM_Thd_Swt>
        end=__UVM_X64_Read_TSC();
     160:	e8 b6 fe ff ff       	call   1b <__UVM_X64_Read_TSC>
     165:	48 89 05 ac 1e 00 00 	mov    %rax,0x1eac(%rip)        # 2018 <end>
        sum+=end-start;
     16c:	48 8b 05 a5 1e 00 00 	mov    0x1ea5(%rip),%rax        # 2018 <end>
     173:	48 8b 15 ae 1e 00 00 	mov    0x1eae(%rip),%rdx        # 2028 <start>
     17a:	48 29 d0             	sub    %rdx,%rax
     17d:	48 01 05 8c 1e 00 00 	add    %rax,0x1e8c(%rip)        # 2010 <sum>
    for(Count=0;Count<10000;Count++)
     184:	48 83 eb 01          	sub    $0x1,%rbx
     188:	75 be                	jne    148 <TEST_THD1_FUNC+0x18>
    UVM_LOG_S("\r\nThread Switching takes clock cycles:");
     18a:	bf 48 10 00 00       	mov    $0x1048,%edi
     18f:	e8 1c 08 00 00       	call   9b0 <UVM_Print_String>
    UVM_LOG_I(sum/10000);
     194:	48 ba 4b 59 86 38 d6 	movabs $0x346dc5d63886594b,%rdx
     19b:	c5 6d 34 
     19e:	48 89 d0             	mov    %rdx,%rax
     1a1:	48 f7 25 68 1e 00 00 	mulq   0x1e68(%rip)        # 2010 <sum>
     1a8:	48 89 d7             	mov    %rdx,%rdi
     1ab:	48 c1 ef 0b          	shr    $0xb,%rdi
     1af:	e8 cc 05 00 00       	call   780 <UVM_Print_Int>
    UVM_Thd_Swt(UVM_CAPID(UVM_BOOT_TBL_THD,0),0);
     1b4:	31 f6                	xor    %esi,%esi
     1b6:	bf 00 80 03 00       	mov    $0x38000,%edi
}
     1bb:	5b                   	pop    %rbx
    UVM_Thd_Swt(UVM_CAPID(UVM_BOOT_TBL_THD,0),0);
     1bc:	e9 ef 0c 00 00       	jmp    eb0 <UVM_Thd_Swt>
     1c1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
     1c8:	00 00 00 00 
     1cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000001d0 <TEST_THD2_FUNC>:
{
     1d0:	f3 0f 1e fa          	endbr64 
     1d4:	50                   	push   %rax
     1d5:	58                   	pop    %rax
     1d6:	48 83 ec 08          	sub    $0x8,%rsp
     1da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
        UVM_Thd_Swt(TEST_THD1,0);
     1e0:	31 f6                	xor    %esi,%esi
     1e2:	bf 09 00 00 00       	mov    $0x9,%edi
     1e7:	e8 c4 0c 00 00       	call   eb0 <UVM_Thd_Swt>
    while(1)
     1ec:	eb f2                	jmp    1e0 <TEST_THD2_FUNC+0x10>
     1ee:	66 90                	xchg   %ax,%ax

00000000000001f0 <main>:
Input       : None.
Output      : None.
Return      : int - This function shall never return.
******************************************************************************/
int main(ptr_t CPUID)
{
     1f0:	f3 0f 1e fa          	endbr64 
     1f4:	53                   	push   %rbx
     1f5:	48 89 fb             	mov    %rdi,%rbx
    ptr_t Cur_Addr;
    cnt_t Count;
    cnt_t Count1;
    cnt_t Count2;
    ptr_t TEST_INV_STACK[2048];
    UVM_LOG_S("\r\nEnter user mode success!Welcome to RME system!");
     1f8:	bf 70 10 00 00       	mov    $0x1070,%edi
     1fd:	e8 ae 07 00 00       	call   9b0 <UVM_Print_String>
    UVM_LOG_S("\r\nNow we are running init thread on cpu:");
     202:	bf a8 10 00 00       	mov    $0x10a8,%edi
     207:	e8 a4 07 00 00       	call   9b0 <UVM_Print_String>
    UVM_LOG_I(CPUID);
     20c:	48 89 df             	mov    %rbx,%rdi
     20f:	e8 6c 05 00 00       	call   780 <UVM_Print_Int>
    if(CPUID==0) {
     214:	48 85 db             	test   %rbx,%rbx
     217:	0f 85 f8 02 00 00    	jne    515 <main+0x325>
        /*Empty test begins here*/
        sum=0;
     21d:	48 c7 05 e8 1d 00 00 	movq   $0x0,0x1de8(%rip)        # 2010 <sum>
     224:	00 00 00 00 
     228:	bb 10 27 00 00       	mov    $0x2710,%ebx
     22d:	0f 1f 00             	nopl   (%rax)
        for(Count=0;Count<10000;Count++)
        {
            start=__UVM_X64_Read_TSC();
     230:	e8 e6 fd ff ff       	call   1b <__UVM_X64_Read_TSC>
     235:	48 89 05 ec 1d 00 00 	mov    %rax,0x1dec(%rip)        # 2028 <start>
            end=__UVM_X64_Read_TSC();
     23c:	e8 da fd ff ff       	call   1b <__UVM_X64_Read_TSC>
     241:	48 89 05 d0 1d 00 00 	mov    %rax,0x1dd0(%rip)        # 2018 <end>
            sum+=end-start;
     248:	48 8b 05 c9 1d 00 00 	mov    0x1dc9(%rip),%rax        # 2018 <end>
     24f:	48 8b 15 d2 1d 00 00 	mov    0x1dd2(%rip),%rdx        # 2028 <start>
     256:	48 29 d0             	sub    %rdx,%rax
     259:	48 01 05 b0 1d 00 00 	add    %rax,0x1db0(%rip)        # 2010 <sum>
        for(Count=0;Count<10000;Count++)
     260:	48 83 eb 01          	sub    $0x1,%rbx
     264:	75 ca                	jne    230 <main+0x40>
        }
        UVM_LOG_S("\r\nEmpty test takes clock cycles:");
     266:	bf d8 10 00 00       	mov    $0x10d8,%edi
        UVM_LOG_I(sum/10000);
        /*Empty test ends here*/

        /*Empty system call test begins here*/
        sum=0;
     26b:	bb 10 27 00 00       	mov    $0x2710,%ebx
        UVM_LOG_S("\r\nEmpty test takes clock cycles:");
     270:	e8 3b 07 00 00       	call   9b0 <UVM_Print_String>
        UVM_LOG_I(sum/10000);
     275:	48 8b 05 94 1d 00 00 	mov    0x1d94(%rip),%rax        # 2010 <sum>
     27c:	b9 10 27 00 00       	mov    $0x2710,%ecx
     281:	31 d2                	xor    %edx,%edx
     283:	48 f7 f1             	div    %rcx
     286:	48 89 c7             	mov    %rax,%rdi
     289:	e8 f2 04 00 00       	call   780 <UVM_Print_Int>
        sum=0;
     28e:	48 c7 05 77 1d 00 00 	movq   $0x0,0x1d77(%rip)        # 2010 <sum>
     295:	00 00 00 00 
        for(Count=0;Count<10000;Count++)
     299:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
        {
            start=__UVM_X64_Read_TSC();
     2a0:	e8 76 fd ff ff       	call   1b <__UVM_X64_Read_TSC>
            UVM_Svc(-1,-1,-1,-1);
     2a5:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
     2ac:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
     2b3:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
     2ba:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
            start=__UVM_X64_Read_TSC();
     2c1:	48 89 05 60 1d 00 00 	mov    %rax,0x1d60(%rip)        # 2028 <start>
            UVM_Svc(-1,-1,-1,-1);
     2c8:	e8 20 fe ff ff       	call   ed <UVM_Svc>
            end=__UVM_X64_Read_TSC();
     2cd:	e8 49 fd ff ff       	call   1b <__UVM_X64_Read_TSC>
     2d2:	48 89 05 3f 1d 00 00 	mov    %rax,0x1d3f(%rip)        # 2018 <end>
            sum+=end-start;
     2d9:	48 8b 05 38 1d 00 00 	mov    0x1d38(%rip),%rax        # 2018 <end>
     2e0:	48 8b 15 41 1d 00 00 	mov    0x1d41(%rip),%rdx        # 2028 <start>
     2e7:	48 29 d0             	sub    %rdx,%rax
     2ea:	48 01 05 1f 1d 00 00 	add    %rax,0x1d1f(%rip)        # 2010 <sum>
        for(Count=0;Count<10000;Count++)
     2f1:	48 83 eb 01          	sub    $0x1,%rbx
     2f5:	75 a9                	jne    2a0 <main+0xb0>
        }
        UVM_LOG_S("\r\nEmpty system call takes clock cycles:");
     2f7:	bf 00 11 00 00       	mov    $0x1100,%edi
     2fc:	e8 af 06 00 00       	call   9b0 <UVM_Print_String>
        UVM_LOG_I(sum/10000);
     301:	48 8b 05 08 1d 00 00 	mov    0x1d08(%rip),%rax        # 2010 <sum>
     308:	b9 10 27 00 00       	mov    $0x2710,%ecx
     30d:	31 d2                	xor    %edx,%edx
     30f:	48 f7 f1             	div    %rcx
     312:	48 89 c7             	mov    %rax,%rdi
     315:	e8 66 04 00 00       	call   780 <UVM_Print_Int>
        /*Signal send test ends here*/


        /*Invocation stub test begins here*/
        /*Create test process capability table*/
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROC_CAPTBL,Cur_Addr,16)>=0);
     31a:	31 ff                	xor    %edi,%edi
     31c:	41 b8 10 00 00 00    	mov    $0x10,%r8d
     322:	b9 00 00 a0 0e       	mov    $0xea00000,%ecx
     327:	ba 0d 00 00 00       	mov    $0xd,%edx
     32c:	be 00 80 05 00       	mov    $0x58000,%esi
     331:	e8 ba 06 00 00       	call   9f0 <UVM_Captbl_Crt>
     336:	48 85 c0             	test   %rax,%rax
     339:	0f 88 d8 01 00 00    	js     517 <main+0x327>
        Cur_Addr+=UVM_CAPTBL_SIZE(16);
        /*Create test process page table*/
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS_PGT,Cur_Addr,1+16+8192)>=0);
     33f:	31 ff                	xor    %edi,%edi
     341:	41 b8 11 20 00 00    	mov    $0x2011,%r8d
     347:	b9 00 04 a0 0e       	mov    $0xea00400,%ecx
     34c:	ba 0e 00 00 00       	mov    $0xe,%edx
     351:	be 00 80 05 00       	mov    $0x58000,%esi
     356:	e8 95 06 00 00       	call   9f0 <UVM_Captbl_Crt>
     35b:	48 85 c0             	test   %rax,%rax
     35e:	0f 88 0f 02 00 00    	js     573 <main+0x383>
        Cur_Addr+=UVM_CAPTBL_SIZE(1+16+8192);
        /*Create test process PML4*/
        Cur_Addr=UVM_ROUND_UP(Cur_Addr,12);
        UVM_ASSERT(UVM_Pgtbl_Crt(TEST_PROCESS_PGT,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS_PML4,Cur_Addr,0,1U,RME_PGT_SIZE_512G,RME_PGT_NUM_512)>=0);
     364:	6a 09                	push   $0x9
     366:	b9 00 10 a8 0e       	mov    $0xea81000,%ecx
     36b:	31 d2                	xor    %edx,%edx
     36d:	41 b9 01 00 00 00    	mov    $0x1,%r9d
     373:	6a 27                	push   $0x27
     375:	45 31 c0             	xor    %r8d,%r8d
     378:	be 00 80 05 00       	mov    $0x58000,%esi
     37d:	bf 0e 00 00 00       	mov    $0xe,%edi
     382:	e8 39 08 00 00       	call   bc0 <UVM_Pgtbl_Crt>
     387:	5a                   	pop    %rdx
     388:	59                   	pop    %rcx
     389:	48 85 c0             	test   %rax,%rax
     38c:	0f 88 3d 02 00 00    	js     5cf <main+0x3df>
                                    UVM_CAPID(UVM_BOOT_TBL_PGTBL,RME_TEST_PDE(Count1)),Count2,0)>=0);
            }
        }
        UVM_LOG_S("\r\nSuccess!!!!");*/
        /*Now we create the test process*/
        UVM_ASSERT(UVM_Proc_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS,UVM_BOOT_CAPTBL,
     392:	31 c9                	xor    %ecx,%ecx
     394:	31 ff                	xor    %edi,%edi
     396:	41 b9 00 10 ac 0e    	mov    $0xeac1000,%r9d
     39c:	41 b8 00 80 01 00    	mov    $0x18000,%r8d
     3a2:	ba 0f 00 00 00       	mov    $0xf,%edx
     3a7:	be 00 80 05 00       	mov    $0x58000,%esi
     3ac:	e8 2f 09 00 00       	call   ce0 <UVM_Proc_Crt>
     3b1:	48 85 c0             	test   %rax,%rax
     3b4:	0f 88 cd 02 00 00    	js     687 <main+0x497>
                                                UVM_CAPID(UVM_BOOT_TBL_PGTBL,0),Cur_Addr)>=0);
        Cur_Addr+=UVM_PROC_SIZE;

        /*create the test invacation stub */
        UVM_ASSERT(UVM_Inv_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_INV1, TEST_PROCESS, Cur_Addr)>=0);
     3ba:	31 ff                	xor    %edi,%edi
     3bc:	41 b8 20 10 ac 0e    	mov    $0xeac1020,%r8d
     3c2:	b9 0f 00 00 00       	mov    $0xf,%ecx
     3c7:	ba 0b 00 00 00       	mov    $0xb,%edx
     3cc:	be 00 80 05 00       	mov    $0x58000,%esi
     3d1:	e8 7a 0b 00 00       	call   f50 <UVM_Inv_Crt>
     3d6:	48 85 c0             	test   %rax,%rax
     3d9:	0f 88 4c 02 00 00    	js     62b <main+0x43b>
        UVM_LOG_S("\r\nSuccess!!!!");
     3df:	bf 88 11 00 00       	mov    $0x1188,%edi
     3e4:	e8 c7 05 00 00       	call   9b0 <UVM_Print_String>
        Cur_Addr+=UVM_INV_SIZE;
        UVM_ASSERT(UVM_Inv_Set(TEST_INV1, TEST_INV1_FUNC,12*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     3e9:	31 c9                	xor    %ecx,%ecx
     3eb:	ba 00 00 c0 00       	mov    $0xc00000,%edx
     3f0:	be 10 01 00 00       	mov    $0x110,%esi
     3f5:	bf 0b 00 00 00       	mov    $0xb,%edi
     3fa:	e8 a1 0b 00 00       	call   fa0 <UVM_Inv_Set>
     3ff:	48 85 c0             	test   %rax,%rax
     402:	0f 88 db 02 00 00    	js     6e3 <main+0x4f3>
        UVM_LOG_S("\r\nSuccess!!!!");
     408:	bf 88 11 00 00       	mov    $0x1188,%edi
        sum=0;
        sumin=0;
        sumout=0;
     40d:	bb 10 27 00 00       	mov    $0x2710,%ebx
        UVM_LOG_S("\r\nSuccess!!!!");
     412:	e8 99 05 00 00       	call   9b0 <UVM_Print_String>
        sum=0;
     417:	48 c7 05 ee 1b 00 00 	movq   $0x0,0x1bee(%rip)        # 2010 <sum>
     41e:	00 00 00 00 
        sumin=0;
     422:	48 c7 05 db 1b 00 00 	movq   $0x0,0x1bdb(%rip)        # 2008 <sumin>
     429:	00 00 00 00 
        sumout=0;
     42d:	48 c7 05 c8 1b 00 00 	movq   $0x0,0x1bc8(%rip)        # 2000 <sumout>
     434:	00 00 00 00 
        /* Run a raw test before we run anything else */
        for(Count=0;Count<10000;Count++)
     438:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
     43f:	00 
        {
            start=__UVM_X64_Read_TSC();
     440:	e8 d6 fb ff ff       	call   1b <__UVM_X64_Read_TSC>
            UVM_Inv_Act(TEST_INV1,0,0);
     445:	31 d2                	xor    %edx,%edx
     447:	31 f6                	xor    %esi,%esi
     449:	bf 0b 00 00 00       	mov    $0xb,%edi
            start=__UVM_X64_Read_TSC();
     44e:	48 89 05 d3 1b 00 00 	mov    %rax,0x1bd3(%rip)        # 2028 <start>
            UVM_Inv_Act(TEST_INV1,0,0);
     455:	e8 ff fb ff ff       	call   59 <UVM_Inv_Act>
            end=__UVM_X64_Read_TSC();
     45a:	e8 bc fb ff ff       	call   1b <__UVM_X64_Read_TSC>
     45f:	48 89 05 b2 1b 00 00 	mov    %rax,0x1bb2(%rip)        # 2018 <end>
            sum+=end-start;
     466:	48 8b 05 ab 1b 00 00 	mov    0x1bab(%rip),%rax        # 2018 <end>
     46d:	48 8b 15 b4 1b 00 00 	mov    0x1bb4(%rip),%rdx        # 2028 <start>
     474:	48 29 d0             	sub    %rdx,%rax
     477:	48 01 05 92 1b 00 00 	add    %rax,0x1b92(%rip)        # 2010 <sum>
            sumin+=middle-start;
     47e:	48 8b 05 9b 1b 00 00 	mov    0x1b9b(%rip),%rax        # 2020 <middle>
     485:	48 8b 15 9c 1b 00 00 	mov    0x1b9c(%rip),%rdx        # 2028 <start>
     48c:	48 29 d0             	sub    %rdx,%rax
     48f:	48 01 05 72 1b 00 00 	add    %rax,0x1b72(%rip)        # 2008 <sumin>
            sumout+=end-middle;
     496:	48 8b 05 7b 1b 00 00 	mov    0x1b7b(%rip),%rax        # 2018 <end>
     49d:	48 8b 15 7c 1b 00 00 	mov    0x1b7c(%rip),%rdx        # 2020 <middle>
     4a4:	48 29 d0             	sub    %rdx,%rax
     4a7:	48 01 05 52 1b 00 00 	add    %rax,0x1b52(%rip)        # 2000 <sumout>
        for(Count=0;Count<10000;Count++)
     4ae:	48 83 eb 01          	sub    $0x1,%rbx
     4b2:	75 8c                	jne    440 <main+0x250>
        }
        UVM_LOG_S("\r\ninv");
     4b4:	bf 96 11 00 00       	mov    $0x1196,%edi
        UVM_LOG_I(sum/10000);
     4b9:	bb 10 27 00 00       	mov    $0x2710,%ebx
        UVM_LOG_S("\r\ninv");
     4be:	e8 ed 04 00 00       	call   9b0 <UVM_Print_String>
        UVM_LOG_I(sum/10000);
     4c3:	48 8b 05 46 1b 00 00 	mov    0x1b46(%rip),%rax        # 2010 <sum>
     4ca:	31 d2                	xor    %edx,%edx
     4cc:	48 f7 f3             	div    %rbx
     4cf:	48 89 c7             	mov    %rax,%rdi
     4d2:	e8 a9 02 00 00       	call   780 <UVM_Print_Int>
        UVM_LOG_S("\r\nin");
     4d7:	bf 9c 11 00 00       	mov    $0x119c,%edi
     4dc:	e8 cf 04 00 00       	call   9b0 <UVM_Print_String>
        UVM_LOG_I(sumin/10000);
     4e1:	48 8b 05 20 1b 00 00 	mov    0x1b20(%rip),%rax        # 2008 <sumin>
     4e8:	31 d2                	xor    %edx,%edx
     4ea:	48 f7 f3             	div    %rbx
     4ed:	48 89 c7             	mov    %rax,%rdi
     4f0:	e8 8b 02 00 00       	call   780 <UVM_Print_Int>
        UVM_LOG_S("\r\nout");
     4f5:	bf a1 11 00 00       	mov    $0x11a1,%edi
     4fa:	e8 b1 04 00 00       	call   9b0 <UVM_Print_String>
        UVM_LOG_I(sumout/10000);
     4ff:	48 8b 05 fa 1a 00 00 	mov    0x1afa(%rip),%rax        # 2000 <sumout>
     506:	31 d2                	xor    %edx,%edx
     508:	48 f7 f3             	div    %rbx
     50b:	48 89 c7             	mov    %rax,%rdi
     50e:	e8 6d 02 00 00       	call   780 <UVM_Print_Int>
        while (1){}
     513:	eb fe                	jmp    513 <main+0x323>
        UVM_Thd_Swt(TEST_THD1,0);

        /*Cross-process thread switching test ends here*/
        while (1);/*Idle*/
    }
}
     515:	5b                   	pop    %rbx
     516:	c3                   	ret    
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROC_CAPTBL,Cur_Addr,16)>=0);
     517:	bf 28 11 00 00       	mov    $0x1128,%edi
     51c:	e8 8f 04 00 00       	call   9b0 <UVM_Print_String>
     521:	bf 59 11 00 00       	mov    $0x1159,%edi
     526:	e8 85 04 00 00       	call   9b0 <UVM_Print_String>
     52b:	bf 65 11 00 00       	mov    $0x1165,%edi
     530:	e8 7b 04 00 00       	call   9b0 <UVM_Print_String>
     535:	bf d2 00 00 00       	mov    $0xd2,%edi
     53a:	e8 41 02 00 00       	call   780 <UVM_Print_Int>
     53f:	bf 6d 11 00 00       	mov    $0x116d,%edi
     544:	e8 67 04 00 00       	call   9b0 <UVM_Print_String>
     549:	bf 70 11 00 00       	mov    $0x1170,%edi
     54e:	e8 5d 04 00 00       	call   9b0 <UVM_Print_String>
     553:	bf 7c 11 00 00       	mov    $0x117c,%edi
     558:	e8 53 04 00 00       	call   9b0 <UVM_Print_String>
     55d:	bf 7f 11 00 00       	mov    $0x117f,%edi
     562:	e8 49 04 00 00       	call   9b0 <UVM_Print_String>
     567:	bf 6d 11 00 00       	mov    $0x116d,%edi
     56c:	e8 3f 04 00 00       	call   9b0 <UVM_Print_String>
     571:	eb fe                	jmp    571 <main+0x381>
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS_PGT,Cur_Addr,1+16+8192)>=0);
     573:	bf 28 11 00 00       	mov    $0x1128,%edi
     578:	e8 33 04 00 00       	call   9b0 <UVM_Print_String>
     57d:	bf 59 11 00 00       	mov    $0x1159,%edi
     582:	e8 29 04 00 00       	call   9b0 <UVM_Print_String>
     587:	bf 65 11 00 00       	mov    $0x1165,%edi
     58c:	e8 1f 04 00 00       	call   9b0 <UVM_Print_String>
     591:	bf d5 00 00 00       	mov    $0xd5,%edi
     596:	e8 e5 01 00 00       	call   780 <UVM_Print_Int>
     59b:	bf 6d 11 00 00       	mov    $0x116d,%edi
     5a0:	e8 0b 04 00 00       	call   9b0 <UVM_Print_String>
     5a5:	bf 70 11 00 00       	mov    $0x1170,%edi
     5aa:	e8 01 04 00 00       	call   9b0 <UVM_Print_String>
     5af:	bf 7c 11 00 00       	mov    $0x117c,%edi
     5b4:	e8 f7 03 00 00       	call   9b0 <UVM_Print_String>
     5b9:	bf 7f 11 00 00       	mov    $0x117f,%edi
     5be:	e8 ed 03 00 00       	call   9b0 <UVM_Print_String>
     5c3:	bf 6d 11 00 00       	mov    $0x116d,%edi
     5c8:	e8 e3 03 00 00       	call   9b0 <UVM_Print_String>
     5cd:	eb fe                	jmp    5cd <main+0x3dd>
        UVM_ASSERT(UVM_Pgtbl_Crt(TEST_PROCESS_PGT,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS_PML4,Cur_Addr,0,1U,RME_PGT_SIZE_512G,RME_PGT_NUM_512)>=0);
     5cf:	bf 28 11 00 00       	mov    $0x1128,%edi
     5d4:	e8 d7 03 00 00       	call   9b0 <UVM_Print_String>
     5d9:	bf 59 11 00 00       	mov    $0x1159,%edi
     5de:	e8 cd 03 00 00       	call   9b0 <UVM_Print_String>
     5e3:	bf 65 11 00 00       	mov    $0x1165,%edi
     5e8:	e8 c3 03 00 00       	call   9b0 <UVM_Print_String>
     5ed:	bf d9 00 00 00       	mov    $0xd9,%edi
     5f2:	e8 89 01 00 00       	call   780 <UVM_Print_Int>
     5f7:	bf 6d 11 00 00       	mov    $0x116d,%edi
     5fc:	e8 af 03 00 00       	call   9b0 <UVM_Print_String>
     601:	bf 70 11 00 00       	mov    $0x1170,%edi
     606:	e8 a5 03 00 00       	call   9b0 <UVM_Print_String>
     60b:	bf 7c 11 00 00       	mov    $0x117c,%edi
     610:	e8 9b 03 00 00       	call   9b0 <UVM_Print_String>
     615:	bf 7f 11 00 00       	mov    $0x117f,%edi
     61a:	e8 91 03 00 00       	call   9b0 <UVM_Print_String>
     61f:	bf 6d 11 00 00       	mov    $0x116d,%edi
     624:	e8 87 03 00 00       	call   9b0 <UVM_Print_String>
     629:	eb fe                	jmp    629 <main+0x439>
        UVM_ASSERT(UVM_Inv_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_INV1, TEST_PROCESS, Cur_Addr)>=0);
     62b:	bf 28 11 00 00       	mov    $0x1128,%edi
     630:	e8 7b 03 00 00       	call   9b0 <UVM_Print_String>
     635:	bf 59 11 00 00       	mov    $0x1159,%edi
     63a:	e8 71 03 00 00       	call   9b0 <UVM_Print_String>
     63f:	bf 65 11 00 00       	mov    $0x1165,%edi
     644:	e8 67 03 00 00       	call   9b0 <UVM_Print_String>
     649:	bf ff 00 00 00       	mov    $0xff,%edi
     64e:	e8 2d 01 00 00       	call   780 <UVM_Print_Int>
     653:	bf 6d 11 00 00       	mov    $0x116d,%edi
     658:	e8 53 03 00 00       	call   9b0 <UVM_Print_String>
     65d:	bf 70 11 00 00       	mov    $0x1170,%edi
     662:	e8 49 03 00 00       	call   9b0 <UVM_Print_String>
     667:	bf 7c 11 00 00       	mov    $0x117c,%edi
     66c:	e8 3f 03 00 00       	call   9b0 <UVM_Print_String>
     671:	bf 7f 11 00 00       	mov    $0x117f,%edi
     676:	e8 35 03 00 00       	call   9b0 <UVM_Print_String>
     67b:	bf 6d 11 00 00       	mov    $0x116d,%edi
     680:	e8 2b 03 00 00       	call   9b0 <UVM_Print_String>
     685:	eb fe                	jmp    685 <main+0x495>
        UVM_ASSERT(UVM_Proc_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS,UVM_BOOT_CAPTBL,
     687:	bf 28 11 00 00       	mov    $0x1128,%edi
     68c:	e8 1f 03 00 00       	call   9b0 <UVM_Print_String>
     691:	bf 59 11 00 00       	mov    $0x1159,%edi
     696:	e8 15 03 00 00       	call   9b0 <UVM_Print_String>
     69b:	bf 65 11 00 00       	mov    $0x1165,%edi
     6a0:	e8 0b 03 00 00       	call   9b0 <UVM_Print_String>
     6a5:	bf fa 00 00 00       	mov    $0xfa,%edi
     6aa:	e8 d1 00 00 00       	call   780 <UVM_Print_Int>
     6af:	bf 6d 11 00 00       	mov    $0x116d,%edi
     6b4:	e8 f7 02 00 00       	call   9b0 <UVM_Print_String>
     6b9:	bf 70 11 00 00       	mov    $0x1170,%edi
     6be:	e8 ed 02 00 00       	call   9b0 <UVM_Print_String>
     6c3:	bf 7c 11 00 00       	mov    $0x117c,%edi
     6c8:	e8 e3 02 00 00       	call   9b0 <UVM_Print_String>
     6cd:	bf 7f 11 00 00       	mov    $0x117f,%edi
     6d2:	e8 d9 02 00 00       	call   9b0 <UVM_Print_String>
     6d7:	bf 6d 11 00 00       	mov    $0x116d,%edi
     6dc:	e8 cf 02 00 00       	call   9b0 <UVM_Print_String>
     6e1:	eb fe                	jmp    6e1 <main+0x4f1>
        UVM_ASSERT(UVM_Inv_Set(TEST_INV1, TEST_INV1_FUNC,12*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     6e3:	bf 28 11 00 00       	mov    $0x1128,%edi
     6e8:	e8 c3 02 00 00       	call   9b0 <UVM_Print_String>
     6ed:	bf 59 11 00 00       	mov    $0x1159,%edi
     6f2:	e8 b9 02 00 00       	call   9b0 <UVM_Print_String>
     6f7:	bf 65 11 00 00       	mov    $0x1165,%edi
     6fc:	e8 af 02 00 00       	call   9b0 <UVM_Print_String>
     701:	bf 02 01 00 00       	mov    $0x102,%edi
     706:	e8 75 00 00 00       	call   780 <UVM_Print_Int>
     70b:	bf 6d 11 00 00       	mov    $0x116d,%edi
     710:	e8 9b 02 00 00       	call   9b0 <UVM_Print_String>
     715:	bf 70 11 00 00       	mov    $0x1170,%edi
     71a:	e8 91 02 00 00       	call   9b0 <UVM_Print_String>
     71f:	bf 7c 11 00 00       	mov    $0x117c,%edi
     724:	e8 87 02 00 00       	call   9b0 <UVM_Print_String>
     729:	bf 7f 11 00 00       	mov    $0x117f,%edi
     72e:	e8 7d 02 00 00       	call   9b0 <UVM_Print_String>
     733:	bf 6d 11 00 00       	mov    $0x116d,%edi
     738:	e8 73 02 00 00       	call   9b0 <UVM_Print_String>
     73d:	eb fe                	jmp    73d <main+0x54d>
     73f:	90                   	nop

0000000000000740 <UVM_List_Crt>:
Input       : volatile struct UVM_List* Head - The pointer to the list head.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Crt(volatile struct UVM_List* Head)
{
     740:	f3 0f 1e fa          	endbr64 
    Head->Prev=(struct UVM_List*)Head;
     744:	48 89 3f             	mov    %rdi,(%rdi)
    Head->Next=(struct UVM_List*)Head;
     747:	48 89 7f 08          	mov    %rdi,0x8(%rdi)
}
     74b:	c3                   	ret    
     74c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000750 <UVM_List_Del>:
              volatile struct UVM_List* Next - The next node of the target node.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Del(volatile struct UVM_List* Prev,volatile struct UVM_List* Next)
{
     750:	f3 0f 1e fa          	endbr64 
    Next->Prev=(struct UVM_List*)Prev;
     754:	48 89 3e             	mov    %rdi,(%rsi)
    Prev->Next=(struct UVM_List*)Next;
     757:	48 89 77 08          	mov    %rsi,0x8(%rdi)
}
     75b:	c3                   	ret    
     75c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000760 <UVM_List_Ins>:
Return      : None.
******************************************************************************/
void UVM_List_Ins(volatile struct UVM_List* New,
                  volatile struct UVM_List* Prev,
                  volatile struct UVM_List* Next)
{
     760:	f3 0f 1e fa          	endbr64 
    Next->Prev=(struct UVM_List*)New;
     764:	48 89 3a             	mov    %rdi,(%rdx)
    New->Next=(struct UVM_List*)Next;
     767:	48 89 57 08          	mov    %rdx,0x8(%rdi)
    New->Prev=(struct UVM_List*)Prev;
     76b:	48 89 37             	mov    %rsi,(%rdi)
    Prev->Next=(struct UVM_List*)New;
     76e:	48 89 7e 08          	mov    %rdi,0x8(%rsi)
}
     772:	c3                   	ret    
     773:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
     77a:	00 00 00 00 
     77e:	66 90                	xchg   %ax,%ax

0000000000000780 <UVM_Print_Int>:
Input       : cnt_t Int - The integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Int(cnt_t Int)
{
     780:	f3 0f 1e fa          	endbr64 
     784:	41 57                	push   %r15
     786:	41 56                	push   %r14
     788:	41 55                	push   %r13
     78a:	41 54                	push   %r12
     78c:	55                   	push   %rbp
     78d:	53                   	push   %rbx
     78e:	48 83 ec 08          	sub    $0x8,%rsp
    cnt_t Count;
    cnt_t Num;
    ptr_t Div;
    
    /* how many digits are there? */
    if(Int==0)
     792:	48 85 ff             	test   %rdi,%rdi
     795:	0f 84 4d 01 00 00    	je     8e8 <UVM_Print_Int+0x168>
    {
        UVM_Putchar('0');
        return 1;
    }
    else if(Int<0)
     79b:	0f 88 a7 00 00 00    	js     848 <UVM_Print_Int+0xc8>
    else
    {
        /* How many digits are there? */
        Count=0;
        Div=1;
        Iter=Int;
     7a1:	48 89 fa             	mov    %rdi,%rdx
        Div=1;
     7a4:	bb 01 00 00 00       	mov    $0x1,%ebx
        Count=0;
     7a9:	45 31 e4             	xor    %r12d,%r12d
        while(Iter!=0)
        {
            Iter/=10;
     7ac:	48 be cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rsi
     7b3:	cc cc cc 
     7b6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
     7bd:	00 00 00 
     7c0:	48 89 d0             	mov    %rdx,%rax
     7c3:	48 89 d1             	mov    %rdx,%rcx
            Count++;
            Div*=10;
     7c6:	48 8d 1c 9b          	lea    (%rbx,%rbx,4),%rbx
            Count++;
     7ca:	49 83 c4 01          	add    $0x1,%r12
            Iter/=10;
     7ce:	48 f7 e6             	mul    %rsi
            Div*=10;
     7d1:	48 01 db             	add    %rbx,%rbx
            Iter/=10;
     7d4:	48 c1 ea 03          	shr    $0x3,%rdx
        while(Iter!=0)
     7d8:	48 83 f9 09          	cmp    $0x9,%rcx
     7dc:	77 e2                	ja     7c0 <UVM_Print_Int+0x40>
        while(Count>0)
        {
            Count--;
            UVM_Putchar(Iter/Div+'0');
            Iter=Iter%Div;
            Div/=10;
     7de:	48 bd cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rbp
     7e5:	cc cc cc 
        Div/=10;
     7e8:	48 89 d8             	mov    %rbx,%rax
            Count++;
     7eb:	4d 89 e6             	mov    %r12,%r14
        Div/=10;
     7ee:	48 f7 e6             	mul    %rsi
     7f1:	48 89 d3             	mov    %rdx,%rbx
     7f4:	48 c1 eb 03          	shr    $0x3,%rbx
        while(Count>0)
     7f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
     7ff:	00 
            Count--;
     800:	48 89 f8             	mov    %rdi,%rax
     803:	31 d2                	xor    %edx,%edx
     805:	49 83 ee 01          	sub    $0x1,%r14
            UVM_Putchar(Iter/Div+'0');
     809:	48 f7 f3             	div    %rbx
     80c:	48 89 c7             	mov    %rax,%rdi
     80f:	49 89 d5             	mov    %rdx,%r13
     812:	83 c7 30             	add    $0x30,%edi
     815:	40 0f be ff          	movsbl %dil,%edi
     819:	e8 b2 07 00 00       	call   fd0 <UVM_Putchar>
            Div/=10;
     81e:	48 89 d8             	mov    %rbx,%rax
            Iter=Iter%Div;
     821:	4c 89 ef             	mov    %r13,%rdi
            Div/=10;
     824:	48 f7 e5             	mul    %rbp
     827:	48 89 d3             	mov    %rdx,%rbx
     82a:	48 c1 eb 03          	shr    $0x3,%rbx
        while(Count>0)
     82e:	4d 85 f6             	test   %r14,%r14
     831:	75 cd                	jne    800 <UVM_Print_Int+0x80>
        }
    }
    
    return Num;
}
     833:	48 83 c4 08          	add    $0x8,%rsp
     837:	4c 89 e0             	mov    %r12,%rax
     83a:	5b                   	pop    %rbx
     83b:	5d                   	pop    %rbp
     83c:	41 5c                	pop    %r12
     83e:	41 5d                	pop    %r13
     840:	41 5e                	pop    %r14
     842:	41 5f                	pop    %r15
     844:	c3                   	ret    
     845:	0f 1f 00             	nopl   (%rax)
        Iter=-Int;
     848:	48 f7 df             	neg    %rdi
        Div=1;
     84b:	bb 01 00 00 00       	mov    $0x1,%ebx
        Count=0;
     850:	45 31 ff             	xor    %r15d,%r15d
            Iter/=10;
     853:	48 be cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rsi
     85a:	cc cc cc 
        Iter=-Int;
     85d:	49 89 fe             	mov    %rdi,%r14
     860:	48 89 fa             	mov    %rdi,%rdx
     863:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
            Iter/=10;
     868:	48 89 d0             	mov    %rdx,%rax
     86b:	48 89 d1             	mov    %rdx,%rcx
            Div*=10;
     86e:	48 8d 1c 9b          	lea    (%rbx,%rbx,4),%rbx
     872:	4d 89 fc             	mov    %r15,%r12
            Iter/=10;
     875:	48 f7 e6             	mul    %rsi
            Count++;
     878:	49 83 c7 01          	add    $0x1,%r15
            Div*=10;
     87c:	48 01 db             	add    %rbx,%rbx
            Iter/=10;
     87f:	48 c1 ea 03          	shr    $0x3,%rdx
        while(Iter!=0)
     883:	48 83 f9 09          	cmp    $0x9,%rcx
     887:	77 df                	ja     868 <UVM_Print_Int+0xe8>
        Div/=10;
     889:	48 89 d8             	mov    %rbx,%rax
        UVM_Putchar('-');
     88c:	bf 2d 00 00 00       	mov    $0x2d,%edi
        Num=Count+1;
     891:	49 83 c4 02          	add    $0x2,%r12
            Div/=10;
     895:	49 bd cd cc cc cc cc 	movabs $0xcccccccccccccccd,%r13
     89c:	cc cc cc 
        Div/=10;
     89f:	48 f7 e6             	mul    %rsi
     8a2:	48 89 d3             	mov    %rdx,%rbx
        UVM_Putchar('-');
     8a5:	e8 26 07 00 00       	call   fd0 <UVM_Putchar>
        Div/=10;
     8aa:	48 c1 eb 03          	shr    $0x3,%rbx
        while(Count>0)
     8ae:	66 90                	xchg   %ax,%ax
            Count--;
     8b0:	4c 89 f0             	mov    %r14,%rax
     8b3:	31 d2                	xor    %edx,%edx
     8b5:	49 83 ef 01          	sub    $0x1,%r15
            UVM_Putchar(Iter/Div+'0');
     8b9:	48 f7 f3             	div    %rbx
     8bc:	83 c0 30             	add    $0x30,%eax
     8bf:	49 89 d6             	mov    %rdx,%r14
     8c2:	0f be f8             	movsbl %al,%edi
     8c5:	e8 06 07 00 00       	call   fd0 <UVM_Putchar>
            Div/=10;
     8ca:	48 89 d8             	mov    %rbx,%rax
     8cd:	49 f7 e5             	mul    %r13
     8d0:	48 89 d3             	mov    %rdx,%rbx
     8d3:	48 c1 eb 03          	shr    $0x3,%rbx
        while(Count>0)
     8d7:	4d 85 ff             	test   %r15,%r15
     8da:	75 d4                	jne    8b0 <UVM_Print_Int+0x130>
     8dc:	e9 52 ff ff ff       	jmp    833 <UVM_Print_Int+0xb3>
     8e1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
        UVM_Putchar('0');
     8e8:	bf 30 00 00 00       	mov    $0x30,%edi
        return 1;
     8ed:	41 bc 01 00 00 00    	mov    $0x1,%r12d
        UVM_Putchar('0');
     8f3:	e8 d8 06 00 00       	call   fd0 <UVM_Putchar>
        return 1;
     8f8:	e9 36 ff ff ff       	jmp    833 <UVM_Print_Int+0xb3>
     8fd:	0f 1f 00             	nopl   (%rax)

0000000000000900 <UVM_Print_Uint>:
Input       : ptr_t Uint - The unsigned integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Uint(ptr_t Uint)
{
     900:	f3 0f 1e fa          	endbr64 
     904:	41 54                	push   %r12
     906:	55                   	push   %rbp
     907:	53                   	push   %rbx
    ptr_t Iter;
    cnt_t Count;
    cnt_t Num;
    
    /* how many digits are there? */
    if(Uint==0)
     908:	48 85 ff             	test   %rdi,%rdi
     90b:	0f 84 87 00 00 00    	je     998 <UVM_Print_Uint+0x98>
    else
    {
        /* Filter out all the zeroes */
        Count=0;
        Iter=Uint;
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
     911:	48 89 f9             	mov    %rdi,%rcx
        Count=0;
     914:	31 d2                	xor    %edx,%edx
     916:	48 89 fd             	mov    %rdi,%rbp
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
     919:	48 89 f8             	mov    %rdi,%rax
     91c:	48 c1 e9 3c          	shr    $0x3c,%rcx
        {
            Iter<<=4;
            Count++;
        }
        /* Count is the number of pts to print */
        Count=sizeof(ptr_t)*2-Count;
     920:	41 bc 10 00 00 00    	mov    $0x10,%r12d
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
     926:	75 27                	jne    94f <UVM_Print_Uint+0x4f>
     928:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
     92f:	00 
            Iter<<=4;
     930:	48 c1 e0 04          	shl    $0x4,%rax
            Count++;
     934:	48 83 c2 01          	add    $0x1,%rdx
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
     938:	48 89 c6             	mov    %rax,%rsi
     93b:	48 c1 ee 3c          	shr    $0x3c,%rsi
     93f:	74 ef                	je     930 <UVM_Print_Uint+0x30>
        Count=sizeof(ptr_t)*2-Count;
     941:	41 bc 10 00 00 00    	mov    $0x10,%r12d
     947:	49 29 d4             	sub    %rdx,%r12
        Num=Count;
        while(Count>0)
     94a:	4d 85 e4             	test   %r12,%r12
     94d:	7e 3d                	jle    98c <UVM_Print_Uint+0x8c>
        Count=sizeof(ptr_t)*2-Count;
     94f:	4c 89 e3             	mov    %r12,%rbx
     952:	eb 11                	jmp    965 <UVM_Print_Uint+0x65>
     954:	0f 1f 40 00          	nopl   0x0(%rax)
        {
            Count--;
            Iter=(Uint>>(Count*4))&0x0F;
            if(Iter<10)
                UVM_Putchar('0'+Iter);
     958:	8d 78 30             	lea    0x30(%rax),%edi
     95b:	e8 70 06 00 00       	call   fd0 <UVM_Putchar>
        while(Count>0)
     960:	48 85 db             	test   %rbx,%rbx
     963:	74 27                	je     98c <UVM_Print_Uint+0x8c>
            Count--;
     965:	48 83 eb 01          	sub    $0x1,%rbx
            Iter=(Uint>>(Count*4))&0x0F;
     969:	48 89 e8             	mov    %rbp,%rax
     96c:	8d 0c 9d 00 00 00 00 	lea    0x0(,%rbx,4),%ecx
     973:	48 d3 e8             	shr    %cl,%rax
     976:	83 e0 0f             	and    $0xf,%eax
            if(Iter<10)
     979:	48 83 f8 09          	cmp    $0x9,%rax
     97d:	76 d9                	jbe    958 <UVM_Print_Uint+0x58>
            else
                UVM_Putchar('A'+Iter-10);
     97f:	8d 78 37             	lea    0x37(%rax),%edi
     982:	e8 49 06 00 00       	call   fd0 <UVM_Putchar>
        while(Count>0)
     987:	48 85 db             	test   %rbx,%rbx
     98a:	75 d9                	jne    965 <UVM_Print_Uint+0x65>
        }
    }
    
    return Num;
}
     98c:	4c 89 e0             	mov    %r12,%rax
     98f:	5b                   	pop    %rbx
     990:	5d                   	pop    %rbp
     991:	41 5c                	pop    %r12
     993:	c3                   	ret    
     994:	0f 1f 40 00          	nopl   0x0(%rax)
        return 1;
     998:	41 bc 01 00 00 00    	mov    $0x1,%r12d
        UVM_Putchar('0');
     99e:	bf 30 00 00 00       	mov    $0x30,%edi
     9a3:	e8 28 06 00 00       	call   fd0 <UVM_Putchar>
}
     9a8:	4c 89 e0             	mov    %r12,%rax
     9ab:	5b                   	pop    %rbx
     9ac:	5d                   	pop    %rbp
     9ad:	41 5c                	pop    %r12
     9af:	c3                   	ret    

00000000000009b0 <UVM_Print_String>:
Input       : s8* String - The string to print.
Output      : None.
Return      : cnt_t - The length of the string printed, the '\0' is not included.
******************************************************************************/
cnt_t UVM_Print_String(s8* String)
{
     9b0:	f3 0f 1e fa          	endbr64 
     9b4:	41 54                	push   %r12
    cnt_t Count;
    
    Count=0;
     9b6:	45 31 e4             	xor    %r12d,%r12d
{
     9b9:	53                   	push   %rbx
     9ba:	48 89 fb             	mov    %rdi,%rbx
     9bd:	48 83 ec 08          	sub    $0x8,%rsp
     9c1:	eb 17                	jmp    9da <UVM_Print_String+0x2a>
     9c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    while(Count<UVM_USER_DEBUG_MAX_STR)
    {
        if(String[Count]=='\0')
            break;
        
        UVM_Putchar(String[Count++]);
     9c8:	49 83 c4 01          	add    $0x1,%r12
     9cc:	e8 ff 05 00 00       	call   fd0 <UVM_Putchar>
    while(Count<UVM_USER_DEBUG_MAX_STR)
     9d1:	49 81 fc 80 00 00 00 	cmp    $0x80,%r12
     9d8:	74 0a                	je     9e4 <UVM_Print_String+0x34>
        if(String[Count]=='\0')
     9da:	42 0f be 3c 23       	movsbl (%rbx,%r12,1),%edi
     9df:	40 84 ff             	test   %dil,%dil
     9e2:	75 e4                	jne    9c8 <UVM_Print_String+0x18>
    }
    
    return Count;
}
     9e4:	48 83 c4 08          	add    $0x8,%rsp
     9e8:	4c 89 e0             	mov    %r12,%rax
     9eb:	5b                   	pop    %rbx
     9ec:	41 5c                	pop    %r12
     9ee:	c3                   	ret    
     9ef:	90                   	nop

00000000000009f0 <UVM_Captbl_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, 
                     cid_t Cap_Captbl, ptr_t Vaddr, ptr_t Entry_Num)
{
     9f0:	f3 0f 1e fa          	endbr64 
     9f4:	49 89 d1             	mov    %rdx,%r9
    return UVM_CAP_OP(RME_SVC_CPT_CRT, Cap_Captbl_Crt,
     9f7:	48 c1 e6 20          	shl    $0x20,%rsi
{
     9fb:	48 89 ca             	mov    %rcx,%rdx
    return UVM_CAP_OP(RME_SVC_CPT_CRT, Cap_Captbl_Crt,
     9fe:	48 b8 00 00 00 00 0a 	movabs $0xa00000000,%rax
     a05:	00 00 00 
     a08:	45 89 c9             	mov    %r9d,%r9d
{
     a0b:	4c 89 c1             	mov    %r8,%rcx
    return UVM_CAP_OP(RME_SVC_CPT_CRT, Cap_Captbl_Crt,
     a0e:	48 09 c7             	or     %rax,%rdi
     a11:	4c 09 ce             	or     %r9,%rsi
     a14:	e9 d4 f6 ff ff       	jmp    ed <UVM_Svc>
     a19:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000a20 <UVM_Captbl_Del>:
              cid_t Cap_Del - The capability to the capability table to be deleted. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Del(cid_t Cap_Captbl_Del, cid_t Cap_Del)
{
     a20:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_CPT_DEL, Cap_Captbl_Del,
     a24:	48 b8 00 00 00 00 0b 	movabs $0xb00000000,%rax
     a2b:	00 00 00 
     a2e:	31 c9                	xor    %ecx,%ecx
     a30:	31 d2                	xor    %edx,%edx
     a32:	48 09 c7             	or     %rax,%rdi
     a35:	e9 b3 f6 ff ff       	jmp    ed <UVM_Svc>
     a3a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000a40 <UVM_Captbl_Frz>:
              cid_t Cap_Frz - The cap to the kernel object being freezed. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Frz(cid_t Cap_Captbl_Frz, cid_t Cap_Frz)
{
     a40:	f3 0f 1e fa          	endbr64 
        return UVM_CAP_OP(RME_SVC_CPT_FRZ, Cap_Captbl_Frz,
     a44:	48 b8 00 00 00 00 0c 	movabs $0xc00000000,%rax
     a4b:	00 00 00 
     a4e:	31 c9                	xor    %ecx,%ecx
     a50:	31 d2                	xor    %edx,%edx
     a52:	48 09 c7             	or     %rax,%rdi
     a55:	e9 93 f6 ff ff       	jmp    ed <UVM_Svc>
     a5a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000a60 <UVM_Captbl_Add>:
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Add(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                     cid_t Cap_Captbl_Src, cid_t Cap_Src, ptr_t Flags)
{
     a60:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
     a64:	48 c1 e7 20          	shl    $0x20,%rdi
{
     a68:	49 89 c9             	mov    %rcx,%r9
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
     a6b:	48 c1 e2 20          	shl    $0x20,%rdx
     a6f:	89 f6                	mov    %esi,%esi
     a71:	45 89 c9             	mov    %r9d,%r9d
     a74:	48 09 fe             	or     %rdi,%rsi
{
     a77:	4c 89 c1             	mov    %r8,%rcx
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
     a7a:	48 bf 00 00 00 00 0d 	movabs $0xd00000000,%rdi
     a81:	00 00 00 
     a84:	4c 09 ca             	or     %r9,%rdx
     a87:	e9 61 f6 ff ff       	jmp    ed <UVM_Svc>
     a8c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000a90 <UVM_Captbl_Pgtbl>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Pgtbl(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                       cid_t Cap_Captbl_Src, cid_t Cap_Src,
                       ptr_t Start, ptr_t End, ptr_t Flags)
{
     a90:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
     a94:	49 c1 e1 24          	shl    $0x24,%r9
{
     a98:	49 89 f2             	mov    %rsi,%r10
     a9b:	49 89 cb             	mov    %rcx,%r11
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
     a9e:	48 89 fe             	mov    %rdi,%rsi
     aa1:	4c 89 c1             	mov    %r8,%rcx
     aa4:	48 c1 e2 20          	shl    $0x20,%rdx
     aa8:	45 89 db             	mov    %r11d,%r11d
     aab:	45 89 d2             	mov    %r10d,%r10d
     aae:	48 c1 e1 08          	shl    $0x8,%rcx
     ab2:	48 c1 e6 20          	shl    $0x20,%rsi
     ab6:	4c 09 da             	or     %r11,%rdx
     ab9:	48 0b 4c 24 08       	or     0x8(%rsp),%rcx
     abe:	48 bf 00 00 00 00 0d 	movabs $0xd00000000,%rdi
     ac5:	00 00 00 
     ac8:	4c 09 c9             	or     %r9,%rcx
     acb:	4c 09 d6             	or     %r10,%rsi
     ace:	e9 1a f6 ff ff       	jmp    ed <UVM_Svc>
     ad3:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
     ada:	00 00 00 00 
     ade:	66 90                	xchg   %ax,%ax

0000000000000ae0 <UVM_Captbl_Kern>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kern(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End)
{
     ae0:	f3 0f 1e fa          	endbr64 
     ae4:	49 89 f2             	mov    %rsi,%r10
     ae7:	49 89 cb             	mov    %rcx,%r11
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
     aea:	48 89 fe             	mov    %rdi,%rsi
     aed:	4c 89 c9             	mov    %r9,%rcx
     af0:	48 c1 e1 20          	shl    $0x20,%rcx
     af4:	48 c1 e2 20          	shl    $0x20,%rdx
     af8:	45 89 db             	mov    %r11d,%r11d
     afb:	45 89 d2             	mov    %r10d,%r10d
     afe:	48 c1 e6 20          	shl    $0x20,%rsi
     b02:	4c 09 c1             	or     %r8,%rcx
     b05:	4c 09 da             	or     %r11,%rdx
     b08:	48 bf 00 00 00 00 0d 	movabs $0xd00000000,%rdi
     b0f:	00 00 00 
     b12:	4c 09 d6             	or     %r10,%rsi
     b15:	e9 d3 f5 ff ff       	jmp    ed <UVM_Svc>
     b1a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000b20 <UVM_Captbl_Kmem>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kmem(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End, ptr_t Flags)
{
     b20:	f3 0f 1e fa          	endbr64 
     b24:	49 89 cb             	mov    %rcx,%r11
     b27:	49 89 f2             	mov    %rsi,%r10
    return UVM_CAP_OP(UVM_KMEM_SVC(End,RME_SVC_CPT_ADD), UVM_KMEM_CAPID(Start,Flags),
     b2a:	4c 89 c0             	mov    %r8,%rax
     b2d:	48 89 fe             	mov    %rdi,%rsi
     b30:	4c 89 c7             	mov    %r8,%rdi
     b33:	48 c1 e8 20          	shr    $0x20,%rax
     b37:	45 89 db             	mov    %r11d,%r11d
     b3a:	45 89 d2             	mov    %r10d,%r10d
     b3d:	48 c1 e2 20          	shl    $0x20,%rdx
     b41:	83 e7 c0             	and    $0xffffffc0,%edi
     b44:	48 c1 e6 20          	shl    $0x20,%rsi
     b48:	48 b9 00 00 00 00 ff 	movabs $0xffffffff00000000,%rcx
     b4f:	ff ff ff 
     b52:	4c 21 c9             	and    %r9,%rcx
     b55:	49 c1 e9 06          	shr    $0x6,%r9
     b59:	4c 09 da             	or     %r11,%rdx
     b5c:	4c 09 d6             	or     %r10,%rsi
     b5f:	49 c1 e1 26          	shl    $0x26,%r9
     b63:	48 09 c1             	or     %rax,%rcx
     b66:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
     b6d:	00 00 00 
     b70:	4c 09 cf             	or     %r9,%rdi
     b73:	48 0b 7c 24 08       	or     0x8(%rsp),%rdi
     b78:	48 09 c7             	or     %rax,%rdi
     b7b:	e9 6d f5 ff ff       	jmp    ed <UVM_Svc>

0000000000000b80 <UVM_Captbl_Rem>:
              cid_t Cap_Rem - The capability slot you want to remove. 1-Level.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Rem(cid_t Cap_Captbl_Rem, cid_t Cap_Rem)
{
     b80:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_CPT_REM, Cap_Captbl_Rem,
     b84:	48 b8 00 00 00 00 0e 	movabs $0xe00000000,%rax
     b8b:	00 00 00 
     b8e:	31 c9                	xor    %ecx,%ecx
     b90:	31 d2                	xor    %edx,%edx
     b92:	48 09 c7             	or     %rax,%rdi
     b95:	e9 53 f5 ff ff       	jmp    ed <UVM_Svc>
     b9a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000ba0 <UVM_Kern_Act>:
                      kernel function ever causes a context switch, it is responsible
                      for setting the return value. On failure, a context switch 
                      in the kernel fucntion is banned.
******************************************************************************/
ret_t UVM_Kern_Act(cid_t Cap_Kern, ptr_t Func_ID, ptr_t Sub_ID, ptr_t Param1, ptr_t Param2)
{
     ba0:	f3 0f 1e fa          	endbr64 
     ba4:	49 89 c9             	mov    %rcx,%r9
    return UVM_CAP_OP(RME_SVC_KFN, Cap_Kern,
     ba7:	48 c1 e2 20          	shl    $0x20,%rdx
     bab:	89 f6                	mov    %esi,%esi
{
     bad:	4c 89 c1             	mov    %r8,%rcx
    return UVM_CAP_OP(RME_SVC_KFN, Cap_Kern,
     bb0:	48 09 d6             	or     %rdx,%rsi
     bb3:	48 0f ba ef 22       	bts    $0x22,%rdi
     bb8:	4c 89 ca             	mov    %r9,%rdx
     bbb:	e9 2d f5 ff ff       	jmp    ed <UVM_Svc>

0000000000000bc0 <UVM_Pgtbl_Crt>:
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Pgtbl, 
                    ptr_t Vaddr, ptr_t Start_Addr, ptr_t Top_Flag,
                    ptr_t Size_Order, ptr_t Num_Order)
{
     bc0:	f3 0f 1e fa          	endbr64 
     bc4:	49 89 fb             	mov    %rdi,%r11
    
    return UVM_CAP_OP(UVM_PGTBL_SVC(Num_Order,RME_SVC_PGT_CRT), Cap_Captbl,
     bc7:	48 c1 e2 10          	shl    $0x10,%rdx
     bcb:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
{
     bd0:	49 89 ca             	mov    %rcx,%r10
    return UVM_CAP_OP(UVM_PGTBL_SVC(Num_Order,RME_SVC_PGT_CRT), Cap_Captbl,
     bd3:	0f b7 44 24 08       	movzwl 0x8(%rsp),%eax
     bd8:	89 d2                	mov    %edx,%edx
     bda:	48 c1 e6 20          	shl    $0x20,%rsi
     bde:	4c 89 c1             	mov    %r8,%rcx
     be1:	48 09 d6             	or     %rdx,%rsi
     be4:	48 c1 e7 30          	shl    $0x30,%rdi
     be8:	4c 09 c9             	or     %r9,%rcx
     beb:	4c 89 d2             	mov    %r10,%rdx
     bee:	48 09 c6             	or     %rax,%rsi
     bf1:	4c 09 df             	or     %r11,%rdi
     bf4:	48 b8 00 00 00 00 0f 	movabs $0xf00000000,%rax
     bfb:	00 00 00 
     bfe:	48 09 c7             	or     %rax,%rdi
     c01:	e9 e7 f4 ff ff       	jmp    ed <UVM_Svc>
     c06:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
     c0d:	00 00 00 

0000000000000c10 <UVM_Pgtbl_Del>:
                                page table capability to be in. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Del(cid_t Cap_Captbl, cid_t Cap_Pgtbl)
{
     c10:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_PGT_DEL, Cap_Captbl,
     c14:	48 0f ba ef 24       	bts    $0x24,%rdi
     c19:	31 c9                	xor    %ecx,%ecx
     c1b:	31 d2                	xor    %edx,%edx
     c1d:	e9 cb f4 ff ff       	jmp    ed <UVM_Svc>
     c22:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
     c29:	00 00 00 00 
     c2d:	0f 1f 00             	nopl   (%rax)

0000000000000c30 <UVM_Pgtbl_Add>:
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Add(cid_t Cap_Pgtbl_Dst, ptr_t Pos_Dst, ptr_t Flags_Dst,
                    cid_t Cap_Pgtbl_Src, ptr_t Pos_Src, ptr_t Index)
{
     c30:	f3 0f 1e fa          	endbr64 
     c34:	49 89 d2             	mov    %rdx,%r10
    return UVM_CAP_OP(RME_SVC_PGT_ADD, Flags_Dst,
     c37:	48 c1 e1 20          	shl    $0x20,%rcx
     c3b:	89 f6                	mov    %esi,%esi
     c3d:	45 89 c0             	mov    %r8d,%r8d
     c40:	48 c1 e7 20          	shl    $0x20,%rdi
     c44:	48 89 ca             	mov    %rcx,%rdx
     c47:	4c 89 c9             	mov    %r9,%rcx
     c4a:	48 b8 00 00 00 00 11 	movabs $0x1100000000,%rax
     c51:	00 00 00 
     c54:	48 09 fe             	or     %rdi,%rsi
     c57:	4c 89 d7             	mov    %r10,%rdi
     c5a:	4c 09 c2             	or     %r8,%rdx
     c5d:	48 09 c7             	or     %rax,%rdi
     c60:	e9 88 f4 ff ff       	jmp    ed <UVM_Svc>
     c65:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
     c6c:	00 00 00 00 

0000000000000c70 <UVM_Pgtbl_Rem>:
              ptr_t Pos - The virtual address position to unmap from.
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Rem(cid_t Cap_Pgtbl, ptr_t Pos)
{
     c70:	f3 0f 1e fa          	endbr64 
     c74:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_PGT_REM, 0,
     c77:	31 c9                	xor    %ecx,%ecx
     c79:	48 89 fe             	mov    %rdi,%rsi
     c7c:	48 bf 00 00 00 00 12 	movabs $0x1200000000,%rdi
     c83:	00 00 00 
     c86:	e9 62 f4 ff ff       	jmp    ed <UVM_Svc>
     c8b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000c90 <UVM_Pgtbl_Con>:
              ptr_t Flags_Child - This have no effect on MPU-based architectures.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Con(cid_t Cap_Pgtbl_Parent, ptr_t Pos, cid_t Cap_Pgtbl_Child, ptr_t Flags_Child)
{
     c90:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_PGT_CON, 0,
     c94:	48 c1 e7 20          	shl    $0x20,%rdi
{
     c98:	49 89 f0             	mov    %rsi,%r8
    return UVM_CAP_OP(RME_SVC_PGT_CON, 0,
     c9b:	89 d2                	mov    %edx,%edx
     c9d:	48 89 fe             	mov    %rdi,%rsi
     ca0:	48 bf 00 00 00 00 13 	movabs $0x1300000000,%rdi
     ca7:	00 00 00 
     caa:	48 09 d6             	or     %rdx,%rsi
     cad:	4c 89 c2             	mov    %r8,%rdx
     cb0:	e9 38 f4 ff ff       	jmp    ed <UVM_Svc>
     cb5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
     cbc:	00 00 00 00 

0000000000000cc0 <UVM_Pgtbl_Des>:
                          table from.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Des(cid_t Cap_Pgtbl, ptr_t Pos)
{
     cc0:	f3 0f 1e fa          	endbr64 
     cc4:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_PGT_DES, 0,
     cc7:	31 c9                	xor    %ecx,%ecx
     cc9:	48 89 fe             	mov    %rdi,%rsi
     ccc:	48 bf 00 00 00 00 14 	movabs $0x1400000000,%rdi
     cd3:	00 00 00 
     cd6:	e9 12 f4 ff ff       	jmp    ed <UVM_Svc>
     cdb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000ce0 <UVM_Proc_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, cid_t Cap_Proc,
                   cid_t Cap_Captbl, cid_t Cap_Pgtbl, ptr_t Vaddr)
{
     ce0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_PRC_CRT, Cap_Captbl_Crt,
     ce4:	48 b8 00 00 00 00 15 	movabs $0x1500000000,%rax
     ceb:	00 00 00 
{
     cee:	48 89 d6             	mov    %rdx,%rsi
     cf1:	48 89 ca             	mov    %rcx,%rdx
     cf4:	4c 89 c1             	mov    %r8,%rcx
    return UVM_CAP_OP(RME_SVC_PRC_CRT, Cap_Captbl_Crt,
     cf7:	48 09 c7             	or     %rax,%rdi
     cfa:	e9 ee f3 ff ff       	jmp    ed <UVM_Svc>
     cff:	90                   	nop

0000000000000d00 <UVM_Proc_Del>:
              cid_t Cap_Proc - The capability to the process. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Del(cid_t Cap_Captbl, cid_t Cap_Proc)
{
     d00:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_PRC_DEL, Cap_Captbl,
     d04:	48 b8 00 00 00 00 16 	movabs $0x1600000000,%rax
     d0b:	00 00 00 
     d0e:	31 c9                	xor    %ecx,%ecx
     d10:	31 d2                	xor    %edx,%edx
     d12:	48 09 c7             	or     %rax,%rdi
     d15:	e9 d3 f3 ff ff       	jmp    ed <UVM_Svc>
     d1a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000d20 <UVM_Proc_Cpt>:
                                 this process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Cpt(cid_t Cap_Proc, cid_t Cap_Captbl)
{
     d20:	f3 0f 1e fa          	endbr64 
     d24:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_PRC_CPT, 0,
     d27:	31 c9                	xor    %ecx,%ecx
     d29:	48 89 fe             	mov    %rdi,%rsi
     d2c:	48 bf 00 00 00 00 17 	movabs $0x1700000000,%rdi
     d33:	00 00 00 
     d36:	e9 b2 f3 ff ff       	jmp    ed <UVM_Svc>
     d3b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000d40 <UVM_Proc_Pgt>:
                                process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Pgt(cid_t Cap_Proc, cid_t Cap_Pgtbl)
{
     d40:	f3 0f 1e fa          	endbr64 
     d44:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_PRC_PGT, 0,
     d47:	31 c9                	xor    %ecx,%ecx
     d49:	48 89 fe             	mov    %rdi,%rsi
     d4c:	48 bf 00 00 00 00 18 	movabs $0x1800000000,%rdi
     d53:	00 00 00 
     d56:	e9 92 f3 ff ff       	jmp    ed <UVM_Svc>
     d5b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000d60 <UVM_Thd_Crt>:
Output      : None.
Return      : ret_t - If successful, the Thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Thd,
                  cid_t Cap_Proc, ptr_t Max_Prio, ptr_t Vaddr)
{
     d60:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_THD_CRT, Cap_Captbl, 
     d64:	48 c1 e1 20          	shl    $0x20,%rcx
{
     d68:	49 89 d2             	mov    %rdx,%r10
    return UVM_CAP_OP(RME_SVC_THD_CRT, Cap_Captbl, 
     d6b:	45 89 c0             	mov    %r8d,%r8d
     d6e:	48 c1 e6 20          	shl    $0x20,%rsi
     d72:	48 b8 00 00 00 00 19 	movabs $0x1900000000,%rax
     d79:	00 00 00 
     d7c:	48 89 ca             	mov    %rcx,%rdx
     d7f:	45 89 d2             	mov    %r10d,%r10d
     d82:	4c 89 c9             	mov    %r9,%rcx
     d85:	4c 09 c2             	or     %r8,%rdx
     d88:	4c 09 d6             	or     %r10,%rsi
     d8b:	48 09 c7             	or     %rax,%rdi
     d8e:	e9 5a f3 ff ff       	jmp    ed <UVM_Svc>
     d93:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
     d9a:	00 00 00 00 
     d9e:	66 90                	xchg   %ax,%ax

0000000000000da0 <UVM_Thd_Del>:
              cid_t Cap_Thd - The capability to the thread in the captbl. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Del(cid_t Cap_Captbl, cid_t Cap_Thd)
{
     da0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_THD_DEL, Cap_Captbl,
     da4:	48 b8 00 00 00 00 1a 	movabs $0x1a00000000,%rax
     dab:	00 00 00 
     dae:	31 c9                	xor    %ecx,%ecx
     db0:	31 d2                	xor    %edx,%edx
     db2:	48 09 c7             	or     %rax,%rdi
     db5:	e9 33 f3 ff ff       	jmp    ed <UVM_Svc>
     dba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000dc0 <UVM_Thd_Exec_Set>:
              ptr_t Param - The parameter of the thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Exec_Set(cid_t Cap_Thd, ptr_t Entry, ptr_t Stack, ptr_t Param)
{
     dc0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, Cap_Thd,
     dc4:	48 b8 00 00 00 00 06 	movabs $0x600000000,%rax
     dcb:	00 00 00 
     dce:	48 09 c7             	or     %rax,%rdi
     dd1:	e9 17 f3 ff ff       	jmp    ed <UVM_Svc>
     dd6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
     ddd:	00 00 00 

0000000000000de0 <UVM_Thd_Hyp_Set>:
                            thread's register sets.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Hyp_Set(cid_t Cap_Thd, ptr_t Kaddr)
{
     de0:	f3 0f 1e fa          	endbr64 
     de4:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, 0,
     de7:	31 c9                	xor    %ecx,%ecx
     de9:	48 89 fe             	mov    %rdi,%rsi
     dec:	48 bf 00 00 00 00 06 	movabs $0x600000000,%rdi
     df3:	00 00 00 
     df6:	e9 f2 f2 ff ff       	jmp    ed <UVM_Svc>
     dfb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000e00 <UVM_Thd_Sched_Bind>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Bind(cid_t Cap_Thd, cid_t Cap_Thd_Sched, cid_t Cap_Sig, tid_t TID, ptr_t Prio)
{
     e00:	f3 0f 1e fa          	endbr64 
     e04:	49 89 d1             	mov    %rdx,%r9
    return UVM_CAP_OP(RME_SVC_THD_SCHED_BIND, Cap_Thd,
     e07:	48 c1 e6 20          	shl    $0x20,%rsi
{
     e0b:	48 89 ca             	mov    %rcx,%rdx
    return UVM_CAP_OP(RME_SVC_THD_SCHED_BIND, Cap_Thd,
     e0e:	48 b8 00 00 00 00 1b 	movabs $0x1b00000000,%rax
     e15:	00 00 00 
     e18:	45 89 c9             	mov    %r9d,%r9d
{
     e1b:	4c 89 c1             	mov    %r8,%rcx
    return UVM_CAP_OP(RME_SVC_THD_SCHED_BIND, Cap_Thd,
     e1e:	48 09 c7             	or     %rax,%rdi
     e21:	4c 09 ce             	or     %r9,%rsi
     e24:	e9 c4 f2 ff ff       	jmp    ed <UVM_Svc>
     e29:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000e30 <UVM_Thd_Sched_Rcv>:
                              is simply not allowed. 2-Level.
Output      : None.
Return      : ret_t - If successful, the thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Rcv(cid_t Cap_Thd)
{
     e30:	f3 0f 1e fa          	endbr64 
     e34:	48 89 fe             	mov    %rdi,%rsi
    return UVM_CAP_OP(RME_SVC_THD_SCHED_RCV, 0,
     e37:	31 c9                	xor    %ecx,%ecx
     e39:	31 d2                	xor    %edx,%edx
     e3b:	48 bf 00 00 00 00 1c 	movabs $0x1c00000000,%rdi
     e42:	00 00 00 
     e45:	e9 a3 f2 ff ff       	jmp    ed <UVM_Svc>
     e4a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000e50 <UVM_Thd_Sched_Prio>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Prio(cid_t Cap_Thd, ptr_t Prio)
{
     e50:	f3 0f 1e fa          	endbr64 
     e54:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_THD_SCHED_PRIO, 0,
     e57:	31 c9                	xor    %ecx,%ecx
     e59:	48 89 fe             	mov    %rdi,%rsi
     e5c:	48 bf 00 00 00 00 07 	movabs $0x700000000,%rdi
     e63:	00 00 00 
     e66:	e9 82 f2 ff ff       	jmp    ed <UVM_Svc>
     e6b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000e70 <UVM_Thd_Sched_Free>:
Input       : cid_t Cap_Thd - The capability to the thread. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Free(cid_t Cap_Thd)
{
     e70:	f3 0f 1e fa          	endbr64 
     e74:	48 89 fe             	mov    %rdi,%rsi
    return UVM_CAP_OP(RME_SVC_THD_SCHED_FREE, 0,
     e77:	31 c9                	xor    %ecx,%ecx
     e79:	31 d2                	xor    %edx,%edx
     e7b:	48 bf 00 00 00 00 05 	movabs $0x500000000,%rdi
     e82:	00 00 00 
     e85:	e9 63 f2 ff ff       	jmp    ed <UVM_Svc>
     e8a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000e90 <UVM_Thd_Time_Xfer>:
                           order of 100us or 1ms.
Output      : None.
Return      : ret_t - If successful, the destination time amount; or an error code.
******************************************************************************/
ret_t UVM_Thd_Time_Xfer(cid_t Cap_Thd_Dst, cid_t Cap_Thd_Src, ptr_t Time)
{
     e90:	f3 0f 1e fa          	endbr64 
     e94:	48 89 d1             	mov    %rdx,%rcx
    return UVM_CAP_OP(RME_SVC_THD_TIME_XFER, 0,
     e97:	48 89 f2             	mov    %rsi,%rdx
     e9a:	48 89 fe             	mov    %rdi,%rsi
     e9d:	48 bf 00 00 00 00 08 	movabs $0x800000000,%rdi
     ea4:	00 00 00 
     ea7:	e9 41 f2 ff ff       	jmp    ed <UVM_Svc>
     eac:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000eb0 <UVM_Thd_Swt>:
                                 this thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Swt(cid_t Cap_Thd, ptr_t Full_Yield)
{
     eb0:	f3 0f 1e fa          	endbr64 
     eb4:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_THD_SWT, 0,
     eb7:	31 c9                	xor    %ecx,%ecx
     eb9:	48 89 fe             	mov    %rdi,%rsi
     ebc:	48 bf 00 00 00 00 09 	movabs $0x900000000,%rdi
     ec3:	00 00 00 
     ec6:	e9 22 f2 ff ff       	jmp    ed <UVM_Svc>
     ecb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000ed0 <UVM_Sig_Crt>:
                            within the kernel virtual address.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Sig, ptr_t Vaddr)
{
     ed0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_SIG_CRT, Cap_Captbl,
     ed4:	48 b8 00 00 00 00 1d 	movabs $0x1d00000000,%rax
     edb:	00 00 00 
{
     ede:	49 89 f0             	mov    %rsi,%r8
     ee1:	48 89 d6             	mov    %rdx,%rsi
    return UVM_CAP_OP(RME_SVC_SIG_CRT, Cap_Captbl,
     ee4:	48 09 c7             	or     %rax,%rdi
     ee7:	4c 89 c2             	mov    %r8,%rdx
     eea:	e9 fe f1 ff ff       	jmp    ed <UVM_Svc>
     eef:	90                   	nop

0000000000000ef0 <UVM_Sig_Del>:
              cid_t Cap_Sig - The capability to the signal. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Del(cid_t Cap_Captbl, cid_t Cap_Sig)
{
     ef0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_SIG_DEL, Cap_Captbl,
     ef4:	48 b8 00 00 00 00 1e 	movabs $0x1e00000000,%rax
     efb:	00 00 00 
     efe:	31 c9                	xor    %ecx,%ecx
     f00:	31 d2                	xor    %edx,%edx
     f02:	48 09 c7             	or     %rax,%rdi
     f05:	e9 e3 f1 ff ff       	jmp    ed <UVM_Svc>
     f0a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000f10 <UVM_Sig_Snd>:
Input       : cid_t Cap_Sig - The capability to the signal. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0, or an error code.
******************************************************************************/
ret_t UVM_Sig_Snd(cid_t Cap_Sig)
{
     f10:	f3 0f 1e fa          	endbr64 
     f14:	48 89 fe             	mov    %rdi,%rsi
    return UVM_CAP_OP(RME_SVC_SIG_SND, 0,
     f17:	31 c9                	xor    %ecx,%ecx
     f19:	31 d2                	xor    %edx,%edx
     f1b:	48 bf 00 00 00 00 02 	movabs $0x200000000,%rdi
     f22:	00 00 00 
     f25:	e9 c3 f1 ff ff       	jmp    ed <UVM_Svc>
     f2a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000f30 <UVM_Sig_Rcv>:
Output      : None.
Return      : ret_t - If successful, a non-negative number containing the number of signals
                      received will be returned; else an error code.
******************************************************************************/
ret_t UVM_Sig_Rcv(cid_t Cap_Sig, ptr_t Option)
{
     f30:	f3 0f 1e fa          	endbr64 
     f34:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_SIG_RCV, 0,
     f37:	31 c9                	xor    %ecx,%ecx
     f39:	48 89 fe             	mov    %rdi,%rsi
     f3c:	48 bf 00 00 00 00 03 	movabs $0x300000000,%rdi
     f43:	00 00 00 
     f46:	e9 a2 f1 ff ff       	jmp    ed <UVM_Svc>
     f4b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000f50 <UVM_Inv_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, 
                  cid_t Cap_Inv, cid_t Cap_Proc, ptr_t Vaddr)
{
     f50:	f3 0f 1e fa          	endbr64 
     f54:	49 89 d1             	mov    %rdx,%r9
    return UVM_CAP_OP(RME_SVC_INV_CRT, Cap_Captbl,
     f57:	48 c1 e6 20          	shl    $0x20,%rsi
{
     f5b:	48 89 ca             	mov    %rcx,%rdx
    return UVM_CAP_OP(RME_SVC_INV_CRT, Cap_Captbl,
     f5e:	48 b8 00 00 00 00 1f 	movabs $0x1f00000000,%rax
     f65:	00 00 00 
     f68:	45 89 c9             	mov    %r9d,%r9d
{
     f6b:	4c 89 c1             	mov    %r8,%rcx
    return UVM_CAP_OP(RME_SVC_INV_CRT, Cap_Captbl,
     f6e:	48 09 c7             	or     %rax,%rdi
     f71:	4c 09 ce             	or     %r9,%rsi
     f74:	e9 74 f1 ff ff       	jmp    ed <UVM_Svc>
     f79:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000f80 <UVM_Inv_Del>:
              cid_t Cap_Inv - The capability to the invocation stub. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Del(cid_t Cap_Captbl, cid_t Cap_Inv)
{
     f80:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_INV_DEL, Cap_Captbl,
     f84:	48 0f ba ef 25       	bts    $0x25,%rdi
     f89:	31 c9                	xor    %ecx,%ecx
     f8b:	31 d2                	xor    %edx,%edx
     f8d:	e9 5b f1 ff ff       	jmp    ed <UVM_Svc>
     f92:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
     f99:	00 00 00 00 
     f9d:	0f 1f 00             	nopl   (%rax)

0000000000000fa0 <UVM_Inv_Set>:
                                     immediately, or we wait for fault handling?
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Set(cid_t Cap_Inv, ptr_t Entry, ptr_t Stack, ptr_t Fault_Ret_Flag)
{
     fa0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_INV_SET, 0,
     fa4:	48 c1 e1 20          	shl    $0x20,%rcx
{
     fa8:	49 89 f0             	mov    %rsi,%r8
    return UVM_CAP_OP(RME_SVC_INV_SET, 0,
     fab:	89 ff                	mov    %edi,%edi
     fad:	48 89 ce             	mov    %rcx,%rsi
     fb0:	48 89 d1             	mov    %rdx,%rcx
     fb3:	4c 89 c2             	mov    %r8,%rdx
     fb6:	48 09 fe             	or     %rdi,%rsi
     fb9:	48 bf 00 00 00 00 21 	movabs $0x2100000000,%rdi
     fc0:	00 00 00 
     fc3:	e9 25 f1 ff ff       	jmp    ed <UVM_Svc>
     fc8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
     fcf:	00 

0000000000000fd0 <UVM_Putchar>:
Input       : char Char - The character to print.
Output      : None.
Return      : ptr_t - Always 0.
******************************************************************************/
ptr_t UVM_Putchar(char Char)
{
     fd0:	f3 0f 1e fa          	endbr64 
     fd4:	53                   	push   %rbx
     fd5:	89 fb                	mov    %edi,%ebx
    /* Wait until we have transmitted */
    while((__UVM_X64_In(UVM_X64_COM1+5)&0x20)==0);
     fd7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
     fde:	00 00 
     fe0:	bf fd 03 00 00       	mov    $0x3fd,%edi
     fe5:	e8 1b f0 ff ff       	call   5 <__UVM_X64_In>
     fea:	a8 20                	test   $0x20,%al
     fec:	74 f2                	je     fe0 <UVM_Putchar+0x10>

    __UVM_X64_Out(UVM_X64_COM1, Char);
     fee:	48 0f be f3          	movsbq %bl,%rsi
     ff2:	bf f8 03 00 00       	mov    $0x3f8,%edi
     ff7:	e8 13 f0 ff ff       	call   f <__UVM_X64_Out>

    return 0;
}
     ffc:	31 c0                	xor    %eax,%eax
     ffe:	5b                   	pop    %rbx
     fff:	c3                   	ret    

0000000000001000 <_UVM_Stack_Init>:
Output      : None.
Return      : ptr_t - The actual stack address to use for system call.
******************************************************************************/
ptr_t _UVM_Stack_Init(ptr_t Stack, ptr_t Size, ptr_t Stub, ptr_t Entry,
                      ptr_t Param1, ptr_t Param2, ptr_t Param3, ptr_t Param4)
{
    1000:	f3 0f 1e fa          	endbr64 
	ptr_t* Stack_Ptr;

    Stack_Ptr=(ptr_t*)(Stack+Size-UVM_STACK_SAFE_SIZE*sizeof(ptr_t));
    Stack_Ptr[0]=Param1;
    1004:	66 49 0f 6e c0       	movq   %r8,%xmm0
    1009:	66 49 0f 6e c9       	movq   %r9,%xmm1
    Stack_Ptr=(ptr_t*)(Stack+Size-UVM_STACK_SAFE_SIZE*sizeof(ptr_t));
    100e:	48 8d 84 37 00 ff ff 	lea    -0x100(%rdi,%rsi,1),%rax
    1015:	ff 
    Stack_Ptr[0]=Param1;
    1016:	66 0f 6c c1          	punpcklqdq %xmm1,%xmm0
    Stack_Ptr[1]=Param2;
    Stack_Ptr[2]=Param3;
    Stack_Ptr[3]=Param4;
    Stack_Ptr[4]=Entry;
    101a:	48 89 48 20          	mov    %rcx,0x20(%rax)
    Stack_Ptr[0]=Param1;
    101e:	0f 11 00             	movups %xmm0,(%rax)
    1021:	f3 0f 7e 44 24 08    	movq   0x8(%rsp),%xmm0
    1027:	0f 16 44 24 10       	movhps 0x10(%rsp),%xmm0
    102c:	0f 11 40 10          	movups %xmm0,0x10(%rax)

    return (ptr_t)Stack_Ptr;
}
    1030:	c3                   	ret    
    1031:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1038:	00 00 00 00 
    103c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001040 <_UVM_Idle>:
Input       : None.
Output      : None.
Return      : None.
******************************************************************************/
void _UVM_Idle(void)
{
    1040:	f3 0f 1e fa          	endbr64 
    /* Do nothing. In the future we may call a kernel function to put us to sleep */
}
    1044:	c3                   	ret    

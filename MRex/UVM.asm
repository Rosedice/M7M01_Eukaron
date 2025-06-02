
./Object/UVM:     file format elf64-x86-64


Disassembly of section .text:

0000000020000000 <_UVM_Entry>:
              space very well.
Input       : None.
Output      : None.
*****************************************************************************/
_UVM_Entry:
    JMP                 main
    20000000:	e9 8b 05 00 00       	jmp    20000590 <main>

0000000020000005 <__UVM_X64_In>:
Output         : None.
Return         : ptr_t - The data received from that port.
Register Usage : None.
*****************************************************************************/
__UVM_X64_In:
    PUSHQ               %RDX
    20000005:	52                   	push   %rdx
    MOVQ                %RDI,%RDX
    20000006:	48 89 fa             	mov    %rdi,%rdx
    MOVQ                %RAX,%RAX
    20000009:	48 89 c0             	mov    %rax,%rax
    INB                 (%DX),%AL
    2000000c:	ec                   	in     (%dx),%al
    POPQ                %RDX
    2000000d:	5a                   	pop    %rdx
    RETQ
    2000000e:	c3                   	ret    

000000002000000f <__UVM_X64_Out>:
Output         : None.
Return         : None.
Register Usage : None.
*****************************************************************************/
__UVM_X64_Out:
    PUSHQ               %RDX
    2000000f:	52                   	push   %rdx
    PUSHQ               %RAX
    20000010:	50                   	push   %rax
    MOVQ                %RDI,%RDX
    20000011:	48 89 fa             	mov    %rdi,%rdx
    MOVQ                %RSI,%RAX
    20000014:	48 89 f0             	mov    %rsi,%rax
    OUTB                %AL,(%DX)
    20000017:	ee                   	out    %al,(%dx)
    POPQ                %RAX
    20000018:	58                   	pop    %rax
    POPQ                %RDX
    20000019:	5a                   	pop    %rdx
    RETQ
    2000001a:	c3                   	ret    

000000002000001b <__UVM_X64_Read_TSC>:
Output         : None.
Return         : ptr_t - The timestamp value returned.
Register Usage : None.
******************************************************************************/
__UVM_X64_Read_TSC:
    PUSHQ               %RDX
    2000001b:	52                   	push   %rdx
    RDTSC
    2000001c:	0f 31                	rdtsc  
    SHL                 $32,%RDX
    2000001e:	48 c1 e2 20          	shl    $0x20,%rdx
    ORQ                 %RDX,%RAX
    20000022:	48 09 d0             	or     %rdx,%rax
    POPQ                %RDX
    20000025:	5a                   	pop    %rdx
    RETQ
    20000026:	c3                   	ret    

0000000020000027 <_UVM_Set_TLS_Pos>:
Output      : None.
Return      : None.
*****************************************************************************/
_UVM_Set_TLS_Pos:
    /* The alignment mask is not used in x86-64 */
    WRFSBASE            %RSI
    20000027:	f3 48 0f ae d6       	wrfsbase %rsi
    RETQ
    2000002c:	c3                   	ret    

000000002000002d <_UVM_Get_TLS_Pos>:
Output      : None.
Return      : ptr_t* - The thread local storage position.
*****************************************************************************/
_UVM_Get_TLS_Pos:
    /* The alignment mask is not used in x86-64 */
    RDFSBASE            %RAX
    2000002d:	f3 48 0f ae c0       	rdfsbase %rax
    RETQ
    20000032:	c3                   	ret    

0000000020000033 <_UVM_Thd_Stub>:
Input       : RDI - The entry address.
              RSI - The stack address that we are using now.
Output      : None.
*****************************************************************************/
_UVM_Thd_Stub:
    MOVQ                (%RSP),%RDI
    20000033:	48 8b 3c 24          	mov    (%rsp),%rdi
    MOVQ                8(%RSP),%RSI
    20000037:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    MOVQ                16(%RSP),%RDX
    2000003c:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    MOVQ                24(%RSP),%RCX
    20000041:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    JMP                 *32(%RSP)           /* Jump to the actual entry address */
    20000046:	ff 64 24 20          	jmp    *0x20(%rsp)

000000002000004a <_UVM_Inv_Stub>:
Input       : R4 - The entry address.
              R5 - The stack address that we are using now.
Output      : None.
*****************************************************************************/
_UVM_Inv_Stub:
    MOVQ                %RSI,%RDI           /* Pass the parameter */
    2000004a:	48 89 f7             	mov    %rsi,%rdi
    CALLQ               *32(%RSP)           /* Branch to the actual entry address */
    2000004d:	ff 54 24 20          	call   *0x20(%rsp)

    XORQ                %RDI,%RDI           /* UVM_SVC_INV_RET */
    20000051:	48 31 ff             	xor    %rdi,%rdi
    MOVQ                %RAX,%RSI           /* return value in RSI */
    20000054:	48 89 c6             	mov    %rax,%rsi
    SYSCALL                                 /* System call */
    20000057:	0f 05                	syscall 

0000000020000059 <UVM_Inv_Act>:
              RSI - ptr_t Param - The parameter for the call.
Output      : RDX - ptr_t* Retval - The return value from the call.
Return      : RAX - ptr_t - The return value of the system call itself.
*****************************************************************************/
UVM_Inv_Act:
    PUSHQ               %RBX                /* The user-level should push all context */
    20000059:	53                   	push   %rbx
    PUSHQ               %RCX
    2000005a:	51                   	push   %rcx
    PUSHQ               %RDX
    2000005b:	52                   	push   %rdx
    PUSHQ               %RBP
    2000005c:	55                   	push   %rbp
    PUSHQ               %R8
    2000005d:	41 50                	push   %r8
    PUSHQ               %R9
    2000005f:	41 51                	push   %r9
    PUSHQ               %R10
    20000061:	41 52                	push   %r10
    PUSHQ               %R11
    20000063:	41 53                	push   %r11
    PUSHQ               %R12
    20000065:	41 54                	push   %r12
    PUSHQ               %R13
    20000067:	41 55                	push   %r13
    PUSHQ               %R14
    20000069:	41 56                	push   %r14
    PUSHQ               %R15
    2000006b:	41 57                	push   %r15
    PUSHFQ
    2000006d:	9c                   	pushf  

    MOVQ                %RSI,%RDX           /* Param */
    2000006e:	48 89 f2             	mov    %rsi,%rdx
    MOVQ                %RDI,%RSI           /* Cap_Inv */
    20000071:	48 89 fe             	mov    %rdi,%rsi
    MOVQ                $0x100000000,%RDI   /* UVM_SVC_INV_ACT */
    20000074:	48 bf 00 00 00 00 01 	movabs $0x100000000,%rdi
    2000007b:	00 00 00 
    SYSCALL
    2000007e:	0f 05                	syscall 

    POPFQ
    20000080:	9d                   	popf   
    POPQ                %R15
    20000081:	41 5f                	pop    %r15
    POPQ                %R14
    20000083:	41 5e                	pop    %r14
    POPQ                %R13
    20000085:	41 5d                	pop    %r13
    POPQ                %R12
    20000087:	41 5c                	pop    %r12
    POPQ                %R11
    20000089:	41 5b                	pop    %r11
    POPQ                %R10
    2000008b:	41 5a                	pop    %r10
    POPQ                %R9
    2000008d:	41 59                	pop    %r9
    POPQ                %R8
    2000008f:	41 58                	pop    %r8
    POPQ                %RBP
    20000091:	5d                   	pop    %rbp
    POPQ                %RDX
    20000092:	5a                   	pop    %rdx
    POPQ                %RCX
    20000093:	59                   	pop    %rcx
    POPQ                %RBX                /* POP all saved registers now */
    20000094:	5b                   	pop    %rbx

    CMPQ                $0,%RDX             /* See if this return value is desired */
    20000095:	48 83 fa 00          	cmp    $0x0,%rdx
    JZ                  No_Retval
    20000099:	74 03                	je     2000009e <No_Retval>
    MOVQ                %RSI,(%RDX)
    2000009b:	48 89 32             	mov    %rsi,(%rdx)

000000002000009e <No_Retval>:
No_Retval:
    RETQ
    2000009e:	c3                   	ret    

000000002000009f <UVM_Inv_Act_Dummy>:

UVM_Inv_Act_Dummy:
    .global UVM_Inv_Act_Dummy
    PUSHQ               %RBX                /* The user-level should push all context */
    2000009f:	53                   	push   %rbx
    PUSHQ               %RCX
    200000a0:	51                   	push   %rcx
    PUSHQ               %RDX
    200000a1:	52                   	push   %rdx
    PUSHQ               %RBP
    200000a2:	55                   	push   %rbp
    PUSHQ               %R8
    200000a3:	41 50                	push   %r8
    PUSHQ               %R9
    200000a5:	41 51                	push   %r9
    PUSHQ               %R10
    200000a7:	41 52                	push   %r10
    PUSHQ               %R11
    200000a9:	41 53                	push   %r11
    PUSHQ               %R12
    200000ab:	41 54                	push   %r12
    PUSHQ               %R13
    200000ad:	41 55                	push   %r13
    PUSHQ               %R14
    200000af:	41 56                	push   %r14
    PUSHQ               %R15
    200000b1:	41 57                	push   %r15
    PUSHFQ
    200000b3:	9c                   	pushf  

    MOVQ                %RSI,%RDX           /* Param */
    200000b4:	48 89 f2             	mov    %rsi,%rdx
    MOVQ                %RDI,%RSI           /* Cap_Inv */
    200000b7:	48 89 fe             	mov    %rdi,%rsi
    MOVQ                $0x100000000,%RDI   /* UVM_SVC_INV_ACT */
    200000ba:	48 bf 00 00 00 00 01 	movabs $0x100000000,%rdi
    200000c1:	00 00 00 

    POPFQ
    200000c4:	9d                   	popf   
    POPQ                %R15
    200000c5:	41 5f                	pop    %r15
    POPQ                %R14
    200000c7:	41 5e                	pop    %r14
    POPQ                %R13
    200000c9:	41 5d                	pop    %r13
    POPQ                %R12
    200000cb:	41 5c                	pop    %r12
    POPQ                %R11
    200000cd:	41 5b                	pop    %r11
    POPQ                %R10
    200000cf:	41 5a                	pop    %r10
    POPQ                %R9
    200000d1:	41 59                	pop    %r9
    POPQ                %R8
    200000d3:	41 58                	pop    %r8
    POPQ                %RBP
    200000d5:	5d                   	pop    %rbp
    POPQ                %RDX
    200000d6:	5a                   	pop    %rdx
    POPQ                %RCX
    200000d7:	59                   	pop    %rcx
    POPQ                %RBX                /* POP all saved registers now */
    200000d8:	5b                   	pop    %rbx

    CMPQ                $0,%RDX             /* See if this return value is desired */
    200000d9:	48 83 fa 00          	cmp    $0x0,%rdx
    JZ                  No_Retval_Dummy
    200000dd:	74 03                	je     200000e2 <No_Retval_Dummy>
    MOVQ                %RSI,(%RDX)
    200000df:	48 89 32             	mov    %rsi,(%rdx)

00000000200000e2 <No_Retval_Dummy>:
No_Retval_Dummy:
    RETQ
    200000e2:	c3                   	ret    

00000000200000e3 <UVM_cret>:

UVM_cret:
    .global     UVM_cret
    RETQ
    200000e3:	c3                   	ret    

00000000200000e4 <UVM_Inv_Ret>:
Input       : RDI - The returning result from the invocation.
Output      : None.
Return      : None.
*****************************************************************************/
UVM_Inv_Ret:
    MOVQ                %RDI,%RSI           /* Set return value to the register */
    200000e4:	48 89 fe             	mov    %rdi,%rsi
    XORQ                %RDI,%RDI           /* UVM_SVC_INV_RET */
    200000e7:	48 31 ff             	xor    %rdi,%rdi
    SYSCALL                                 /* System call */
    200000ea:	0f 05                	syscall 
    RETQ
    200000ec:	c3                   	ret    

00000000200000ed <UVM_Svc>:
              RCX - Argument 3. We need to move this to R8 because SYSCALL will use RCX.
Output      : None.
Retun       : RAX - The return value.
*****************************************************************************/
UVM_Svc:
    MOV                 %RCX,%R8
    200000ed:	49 89 c8             	mov    %rcx,%r8
    PUSH                %R11
    200000f0:	41 53                	push   %r11
    SYSCALL                                 /* Do the system call directly */
    200000f2:	0f 05                	syscall 
    POP                 %R11
    200000f4:	41 5b                	pop    %r11
    RETQ
    200000f6:	c3                   	ret    

00000000200000f7 <_UVM_MSB_Get>:
;Output         : None.
;Return         : ptr_t - The MSB position.   
;Register Usage : None. 
;*****************************************************************************/
_UVM_MSB_Get:
    LZCNTQ              %RDI,%RDI
    200000f7:	f3 48 0f bd ff       	lzcnt  %rdi,%rdi
    MOVQ                $63,%RAX
    200000fc:	48 c7 c0 3f 00 00 00 	mov    $0x3f,%rax
    SUBQ                %RDI,%RAX
    20000103:	48 29 f8             	sub    %rdi,%rax
    RETQ
    20000106:	c3                   	ret    
    20000107:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    2000010e:	00 00 

0000000020000110 <TEST_THD_FUNC2>:
    UVM_Thd_Swt(UVM_CAPID(UVM_BOOT_TBL_THD,0),0);
}

/*This function is for tread switching test*/
void TEST_THD_FUNC2(void)
{
    20000110:	f3 0f 1e fa          	endbr64 
    20000114:	50                   	push   %rax
    20000115:	58                   	pop    %rax
    20000116:	48 83 ec 08          	sub    $0x8,%rsp
    2000011a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    while(1)
    {
        UVM_Thd_Swt(UVM_CAPID(TEST_THD_TBL,TEST_THD1),0);
    20000120:	31 f6                	xor    %esi,%esi
    20000122:	bf 00 80 09 00       	mov    $0x98000,%edi
    20000127:	e8 c4 21 00 00       	call   200022f0 <UVM_Thd_Swt>
    while(1)
    2000012c:	eb f2                	jmp    20000120 <TEST_THD_FUNC2+0x10>
    2000012e:	66 90                	xchg   %ax,%ax

0000000020000130 <TEST_THD_FUNC4>:
    UVM_Thd_Swt(UVM_CAPID(UVM_BOOT_TBL_THD,0),0);
}

/*This function is for cross-process tread switching test*/
void TEST_THD_FUNC4(void)
{
    20000130:	f3 0f 1e fa          	endbr64 
    20000134:	50                   	push   %rax
    20000135:	58                   	pop    %rax
    20000136:	48 83 ec 08          	sub    $0x8,%rsp
    2000013a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    while(1)
    {
        UVM_Thd_Swt(UVM_CAPID(TEST_THD_TBL,TEST_THD3),0);
    20000140:	31 f6                	xor    %esi,%esi
    20000142:	bf 02 80 09 00       	mov    $0x98002,%edi
    20000147:	e8 a4 21 00 00       	call   200022f0 <UVM_Thd_Swt>
    while(1)
    2000014c:	eb f2                	jmp    20000140 <TEST_THD_FUNC4+0x10>
    2000014e:	66 90                	xchg   %ax,%ax

0000000020000150 <TEST_THD_FUNC1>:
{
    20000150:	f3 0f 1e fa          	endbr64 
    sum=0;
    20000154:	48 c7 05 b1 2e 00 00 	movq   $0x0,0x2eb1(%rip)        # 20003010 <sum>
    2000015b:	00 00 00 00 
{
    2000015f:	53                   	push   %rbx
    sum=0;
    20000160:	bb 10 27 00 00       	mov    $0x2710,%ebx
    20000165:	0f 1f 00             	nopl   (%rax)
        start=__UVM_X64_Read_TSC();
    20000168:	e8 ae fe ff ff       	call   2000001b <__UVM_X64_Read_TSC>
        UVM_Thd_Swt(UVM_CAPID(TEST_THD_TBL,TEST_THD2),0);
    2000016d:	31 f6                	xor    %esi,%esi
    2000016f:	bf 01 80 09 00       	mov    $0x98001,%edi
        start=__UVM_X64_Read_TSC();
    20000174:	48 89 05 ad 2e 00 00 	mov    %rax,0x2ead(%rip)        # 20003028 <start>
        UVM_Thd_Swt(UVM_CAPID(TEST_THD_TBL,TEST_THD2),0);
    2000017b:	e8 70 21 00 00       	call   200022f0 <UVM_Thd_Swt>
        end=__UVM_X64_Read_TSC();
    20000180:	e8 96 fe ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    20000185:	48 89 05 8c 2e 00 00 	mov    %rax,0x2e8c(%rip)        # 20003018 <end>
        sum+=end-start;
    2000018c:	48 8b 05 85 2e 00 00 	mov    0x2e85(%rip),%rax        # 20003018 <end>
    20000193:	48 8b 15 8e 2e 00 00 	mov    0x2e8e(%rip),%rdx        # 20003028 <start>
    2000019a:	48 29 d0             	sub    %rdx,%rax
    2000019d:	48 01 05 6c 2e 00 00 	add    %rax,0x2e6c(%rip)        # 20003010 <sum>
    for(Cnt=0;Cnt<10000;Cnt++)
    200001a4:	48 83 eb 01          	sub    $0x1,%rbx
    200001a8:	75 be                	jne    20000168 <TEST_THD_FUNC1+0x18>
    UVM_LOG_S("\r\nThread Switching takes clock cycles:");
    200001aa:	bf a8 24 00 20       	mov    $0x200024a8,%edi
    200001af:	e8 3c 1c 00 00       	call   20001df0 <UVM_Print_String>
    UVM_LOG_I(sum/10000);
    200001b4:	48 ba 4b 59 86 38 d6 	movabs $0x346dc5d63886594b,%rdx
    200001bb:	c5 6d 34 
    200001be:	48 89 d0             	mov    %rdx,%rax
    200001c1:	48 f7 25 48 2e 00 00 	mulq   0x2e48(%rip)        # 20003010 <sum>
    200001c8:	48 89 d7             	mov    %rdx,%rdi
    200001cb:	48 c1 ef 0b          	shr    $0xb,%rdi
    200001cf:	e8 ec 19 00 00       	call   20001bc0 <UVM_Print_Int>
    UVM_Thd_Swt(UVM_CAPID(UVM_BOOT_TBL_THD,0),0);
    200001d4:	31 f6                	xor    %esi,%esi
    200001d6:	bf 00 80 03 00       	mov    $0x38000,%edi
}
    200001db:	5b                   	pop    %rbx
    UVM_Thd_Swt(UVM_CAPID(UVM_BOOT_TBL_THD,0),0);
    200001dc:	e9 0f 21 00 00       	jmp    200022f0 <UVM_Thd_Swt>
    200001e1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    200001e8:	00 00 00 00 
    200001ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000200001f0 <TEST_THD_FUNC3>:
{
    200001f0:	f3 0f 1e fa          	endbr64 
    sum=0;
    200001f4:	48 c7 05 11 2e 00 00 	movq   $0x0,0x2e11(%rip)        # 20003010 <sum>
    200001fb:	00 00 00 00 
{
    200001ff:	53                   	push   %rbx
    sum=0;
    20000200:	bb 10 27 00 00       	mov    $0x2710,%ebx
    20000205:	0f 1f 00             	nopl   (%rax)
        start=__UVM_X64_Read_TSC();
    20000208:	e8 0e fe ff ff       	call   2000001b <__UVM_X64_Read_TSC>
        UVM_Thd_Swt(UVM_CAPID(TEST_THD_TBL,TEST_THD4),0);
    2000020d:	31 f6                	xor    %esi,%esi
    2000020f:	bf 03 80 09 00       	mov    $0x98003,%edi
        start=__UVM_X64_Read_TSC();
    20000214:	48 89 05 0d 2e 00 00 	mov    %rax,0x2e0d(%rip)        # 20003028 <start>
        UVM_Thd_Swt(UVM_CAPID(TEST_THD_TBL,TEST_THD4),0);
    2000021b:	e8 d0 20 00 00       	call   200022f0 <UVM_Thd_Swt>
        end=__UVM_X64_Read_TSC();
    20000220:	e8 f6 fd ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    20000225:	48 89 05 ec 2d 00 00 	mov    %rax,0x2dec(%rip)        # 20003018 <end>
        sum+=end-start;
    2000022c:	48 8b 05 e5 2d 00 00 	mov    0x2de5(%rip),%rax        # 20003018 <end>
    20000233:	48 8b 15 ee 2d 00 00 	mov    0x2dee(%rip),%rdx        # 20003028 <start>
    2000023a:	48 29 d0             	sub    %rdx,%rax
    2000023d:	48 01 05 cc 2d 00 00 	add    %rax,0x2dcc(%rip)        # 20003010 <sum>
    for(Cnt=0;Cnt<10000;Cnt++)
    20000244:	48 83 eb 01          	sub    $0x1,%rbx
    20000248:	75 be                	jne    20000208 <TEST_THD_FUNC3+0x18>
    UVM_LOG_S("\r\nCross-process thread Switching takes clock cycles:");
    2000024a:	bf d0 24 00 20       	mov    $0x200024d0,%edi
    2000024f:	e8 9c 1b 00 00       	call   20001df0 <UVM_Print_String>
    UVM_LOG_I(sum/10000);
    20000254:	48 ba 4b 59 86 38 d6 	movabs $0x346dc5d63886594b,%rdx
    2000025b:	c5 6d 34 
    2000025e:	48 89 d0             	mov    %rdx,%rax
    20000261:	48 f7 25 a8 2d 00 00 	mulq   0x2da8(%rip)        # 20003010 <sum>
    20000268:	48 89 d7             	mov    %rdx,%rdi
    2000026b:	48 c1 ef 0b          	shr    $0xb,%rdi
    2000026f:	e8 4c 19 00 00       	call   20001bc0 <UVM_Print_Int>
    UVM_Thd_Swt(UVM_CAPID(UVM_BOOT_TBL_THD,0),0);
    20000274:	31 f6                	xor    %esi,%esi
    20000276:	bf 00 80 03 00       	mov    $0x38000,%edi
}
    2000027b:	5b                   	pop    %rbx
    UVM_Thd_Swt(UVM_CAPID(UVM_BOOT_TBL_THD,0),0);
    2000027c:	e9 6f 20 00 00       	jmp    200022f0 <UVM_Thd_Swt>
    20000281:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    20000288:	00 00 00 00 
    2000028c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000020000290 <TEST_SIG_FUNC1>:
    }
}

/*This function is for signal sending-receiving test*/
void TEST_SIG_FUNC1(void)
{
    20000290:	f3 0f 1e fa          	endbr64 
    20000294:	53                   	push   %rbx
    cnt_t Cnt;
    sum=0;
    20000295:	bb 10 27 00 00       	mov    $0x2710,%ebx
    2000029a:	48 c7 05 6b 2d 00 00 	movq   $0x0,0x2d6b(%rip)        # 20003010 <sum>
    200002a1:	00 00 00 00 
    for(Cnt=0;Cnt<10000;Cnt++)
    200002a5:	eb 33                	jmp    200002da <TEST_SIG_FUNC1+0x4a>
    200002a7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    200002ae:	00 00 
    {
        start=__UVM_X64_Read_TSC();
        UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG1,RME_RCV_BS));
        end=__UVM_X64_Read_TSC();
    200002b0:	e8 66 fd ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    200002b5:	48 89 05 5c 2d 00 00 	mov    %rax,0x2d5c(%rip)        # 20003018 <end>
        sum+=end-start;
    200002bc:	48 8b 05 55 2d 00 00 	mov    0x2d55(%rip),%rax        # 20003018 <end>
    200002c3:	48 8b 15 5e 2d 00 00 	mov    0x2d5e(%rip),%rdx        # 20003028 <start>
    200002ca:	48 29 d0             	sub    %rdx,%rax
    200002cd:	48 01 05 3c 2d 00 00 	add    %rax,0x2d3c(%rip)        # 20003010 <sum>
    for(Cnt=0;Cnt<10000;Cnt++)
    200002d4:	48 83 eb 01          	sub    $0x1,%rbx
    200002d8:	74 7e                	je     20000358 <TEST_SIG_FUNC1+0xc8>
        start=__UVM_X64_Read_TSC();
    200002da:	e8 3c fd ff ff       	call   2000001b <__UVM_X64_Read_TSC>
        UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG1,RME_RCV_BS));
    200002df:	31 f6                	xor    %esi,%esi
    200002e1:	bf 0b 00 00 00       	mov    $0xb,%edi
        start=__UVM_X64_Read_TSC();
    200002e6:	48 89 05 3b 2d 00 00 	mov    %rax,0x2d3b(%rip)        # 20003028 <start>
        UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG1,RME_RCV_BS));
    200002ed:	e8 7e 20 00 00       	call   20002370 <UVM_Sig_Rcv>
    200002f2:	48 85 c0             	test   %rax,%rax
    200002f5:	75 b9                	jne    200002b0 <TEST_SIG_FUNC1+0x20>
    200002f7:	bf 08 25 00 20       	mov    $0x20002508,%edi
    200002fc:	e8 ef 1a 00 00       	call   20001df0 <UVM_Print_String>
    20000301:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20000306:	e8 e5 1a 00 00       	call   20001df0 <UVM_Print_String>
    2000030b:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20000310:	e8 db 1a 00 00       	call   20001df0 <UVM_Print_String>
    20000315:	bf 9b 00 00 00       	mov    $0x9b,%edi
    2000031a:	e8 a1 18 00 00       	call   20001bc0 <UVM_Print_Int>
    2000031f:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000324:	e8 c7 1a 00 00       	call   20001df0 <UVM_Print_String>
    20000329:	bf 47 27 00 20       	mov    $0x20002747,%edi
    2000032e:	e8 bd 1a 00 00       	call   20001df0 <UVM_Print_String>
    20000333:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20000338:	e8 b3 1a 00 00       	call   20001df0 <UVM_Print_String>
    2000033d:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20000342:	e8 a9 1a 00 00       	call   20001df0 <UVM_Print_String>
    20000347:	bf 44 27 00 20       	mov    $0x20002744,%edi
    2000034c:	e8 9f 1a 00 00       	call   20001df0 <UVM_Print_String>
    20000351:	eb fe                	jmp    20000351 <TEST_SIG_FUNC1+0xc1>
    20000353:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    }
    UVM_LOG_S("\r\nSignal sending-receiving takes clock cycles:");
    20000358:	bf 40 25 00 20       	mov    $0x20002540,%edi
    2000035d:	e8 8e 1a 00 00       	call   20001df0 <UVM_Print_String>
    UVM_LOG_I(sum/10000);
    20000362:	48 ba 4b 59 86 38 d6 	movabs $0x346dc5d63886594b,%rdx
    20000369:	c5 6d 34 
    2000036c:	48 89 d0             	mov    %rdx,%rax
    2000036f:	48 f7 25 9a 2c 00 00 	mulq   0x2c9a(%rip)        # 20003010 <sum>
    20000376:	48 89 d7             	mov    %rdx,%rdi
    20000379:	48 c1 ef 0b          	shr    $0xb,%rdi
    2000037d:	e8 3e 18 00 00       	call   20001bc0 <UVM_Print_Int>
    UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG1,RME_RCV_BS));
    20000382:	31 f6                	xor    %esi,%esi
    20000384:	bf 0b 00 00 00       	mov    $0xb,%edi
    20000389:	e8 e2 1f 00 00       	call   20002370 <UVM_Sig_Rcv>
    2000038e:	48 85 c0             	test   %rax,%rax
    20000391:	74 02                	je     20000395 <TEST_SIG_FUNC1+0x105>
}
    20000393:	5b                   	pop    %rbx
    20000394:	c3                   	ret    
    UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG1,RME_RCV_BS));
    20000395:	bf 08 25 00 20       	mov    $0x20002508,%edi
    2000039a:	e8 51 1a 00 00       	call   20001df0 <UVM_Print_String>
    2000039f:	bf 30 27 00 20       	mov    $0x20002730,%edi
    200003a4:	e8 47 1a 00 00       	call   20001df0 <UVM_Print_String>
    200003a9:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    200003ae:	e8 3d 1a 00 00       	call   20001df0 <UVM_Print_String>
    200003b3:	bf a1 00 00 00       	mov    $0xa1,%edi
    200003b8:	e8 03 18 00 00       	call   20001bc0 <UVM_Print_Int>
    200003bd:	bf 44 27 00 20       	mov    $0x20002744,%edi
    200003c2:	e8 29 1a 00 00       	call   20001df0 <UVM_Print_String>
    200003c7:	bf 47 27 00 20       	mov    $0x20002747,%edi
    200003cc:	e8 1f 1a 00 00       	call   20001df0 <UVM_Print_String>
    200003d1:	bf 53 27 00 20       	mov    $0x20002753,%edi
    200003d6:	e8 15 1a 00 00       	call   20001df0 <UVM_Print_String>
    200003db:	bf 56 27 00 20       	mov    $0x20002756,%edi
    200003e0:	e8 0b 1a 00 00       	call   20001df0 <UVM_Print_String>
    200003e5:	bf 44 27 00 20       	mov    $0x20002744,%edi
    200003ea:	e8 01 1a 00 00       	call   20001df0 <UVM_Print_String>
    200003ef:	eb fe                	jmp    200003ef <TEST_SIG_FUNC1+0x15f>
    200003f1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    200003f8:	00 00 00 00 
    200003fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000020000400 <TEST_SIG_FUNC2>:

/*This function is for Cross-process signal sending-receiving test*/
void TEST_SIG_FUNC2(void)
{
    20000400:	f3 0f 1e fa          	endbr64 
    20000404:	53                   	push   %rbx
    cnt_t Cnt;
    sum=0;
    20000405:	bb 10 27 00 00       	mov    $0x2710,%ebx
    2000040a:	48 c7 05 fb 2b 00 00 	movq   $0x0,0x2bfb(%rip)        # 20003010 <sum>
    20000411:	00 00 00 00 
    for(Cnt=0;Cnt<10000;Cnt++)
    20000415:	eb 33                	jmp    2000044a <TEST_SIG_FUNC2+0x4a>
    20000417:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    2000041e:	00 00 
    {
        start=__UVM_X64_Read_TSC();
        UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG2,RME_RCV_BS));
        end=__UVM_X64_Read_TSC();
    20000420:	e8 f6 fb ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    20000425:	48 89 05 ec 2b 00 00 	mov    %rax,0x2bec(%rip)        # 20003018 <end>
        sum+=end-start;
    2000042c:	48 8b 05 e5 2b 00 00 	mov    0x2be5(%rip),%rax        # 20003018 <end>
    20000433:	48 8b 15 ee 2b 00 00 	mov    0x2bee(%rip),%rdx        # 20003028 <start>
    2000043a:	48 29 d0             	sub    %rdx,%rax
    2000043d:	48 01 05 cc 2b 00 00 	add    %rax,0x2bcc(%rip)        # 20003010 <sum>
    for(Cnt=0;Cnt<10000;Cnt++)
    20000444:	48 83 eb 01          	sub    $0x1,%rbx
    20000448:	74 7e                	je     200004c8 <TEST_SIG_FUNC2+0xc8>
        start=__UVM_X64_Read_TSC();
    2000044a:	e8 cc fb ff ff       	call   2000001b <__UVM_X64_Read_TSC>
        UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG2,RME_RCV_BS));
    2000044f:	31 f6                	xor    %esi,%esi
    20000451:	bf 0c 00 00 00       	mov    $0xc,%edi
        start=__UVM_X64_Read_TSC();
    20000456:	48 89 05 cb 2b 00 00 	mov    %rax,0x2bcb(%rip)        # 20003028 <start>
        UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG2,RME_RCV_BS));
    2000045d:	e8 0e 1f 00 00       	call   20002370 <UVM_Sig_Rcv>
    20000462:	48 85 c0             	test   %rax,%rax
    20000465:	75 b9                	jne    20000420 <TEST_SIG_FUNC2+0x20>
    20000467:	bf 08 25 00 20       	mov    $0x20002508,%edi
    2000046c:	e8 7f 19 00 00       	call   20001df0 <UVM_Print_String>
    20000471:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20000476:	e8 75 19 00 00       	call   20001df0 <UVM_Print_String>
    2000047b:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20000480:	e8 6b 19 00 00       	call   20001df0 <UVM_Print_String>
    20000485:	bf ac 00 00 00       	mov    $0xac,%edi
    2000048a:	e8 31 17 00 00       	call   20001bc0 <UVM_Print_Int>
    2000048f:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000494:	e8 57 19 00 00       	call   20001df0 <UVM_Print_String>
    20000499:	bf 47 27 00 20       	mov    $0x20002747,%edi
    2000049e:	e8 4d 19 00 00       	call   20001df0 <UVM_Print_String>
    200004a3:	bf 53 27 00 20       	mov    $0x20002753,%edi
    200004a8:	e8 43 19 00 00       	call   20001df0 <UVM_Print_String>
    200004ad:	bf 56 27 00 20       	mov    $0x20002756,%edi
    200004b2:	e8 39 19 00 00       	call   20001df0 <UVM_Print_String>
    200004b7:	bf 44 27 00 20       	mov    $0x20002744,%edi
    200004bc:	e8 2f 19 00 00       	call   20001df0 <UVM_Print_String>
    200004c1:	eb fe                	jmp    200004c1 <TEST_SIG_FUNC2+0xc1>
    200004c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    }
    UVM_LOG_S("\r\nCross-process signal sending-receiving takes clock cycles:");
    200004c8:	bf 70 25 00 20       	mov    $0x20002570,%edi
    200004cd:	e8 1e 19 00 00       	call   20001df0 <UVM_Print_String>
    UVM_LOG_I(sum/10000);
    200004d2:	48 ba 4b 59 86 38 d6 	movabs $0x346dc5d63886594b,%rdx
    200004d9:	c5 6d 34 
    200004dc:	48 89 d0             	mov    %rdx,%rax
    200004df:	48 f7 25 2a 2b 00 00 	mulq   0x2b2a(%rip)        # 20003010 <sum>
    200004e6:	48 89 d7             	mov    %rdx,%rdi
    200004e9:	48 c1 ef 0b          	shr    $0xb,%rdi
    200004ed:	e8 ce 16 00 00       	call   20001bc0 <UVM_Print_Int>
    UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG2,RME_RCV_BS));
    200004f2:	31 f6                	xor    %esi,%esi
    200004f4:	bf 0c 00 00 00       	mov    $0xc,%edi
    200004f9:	e8 72 1e 00 00       	call   20002370 <UVM_Sig_Rcv>
    200004fe:	48 85 c0             	test   %rax,%rax
    20000501:	74 02                	je     20000505 <TEST_SIG_FUNC2+0x105>
}
    20000503:	5b                   	pop    %rbx
    20000504:	c3                   	ret    
    UVM_ASSERT(UVM_Sig_Rcv(TEST_SIG2,RME_RCV_BS));
    20000505:	bf 08 25 00 20       	mov    $0x20002508,%edi
    2000050a:	e8 e1 18 00 00       	call   20001df0 <UVM_Print_String>
    2000050f:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20000514:	e8 d7 18 00 00       	call   20001df0 <UVM_Print_String>
    20000519:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    2000051e:	e8 cd 18 00 00       	call   20001df0 <UVM_Print_String>
    20000523:	bf b2 00 00 00       	mov    $0xb2,%edi
    20000528:	e8 93 16 00 00       	call   20001bc0 <UVM_Print_Int>
    2000052d:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000532:	e8 b9 18 00 00       	call   20001df0 <UVM_Print_String>
    20000537:	bf 47 27 00 20       	mov    $0x20002747,%edi
    2000053c:	e8 af 18 00 00       	call   20001df0 <UVM_Print_String>
    20000541:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20000546:	e8 a5 18 00 00       	call   20001df0 <UVM_Print_String>
    2000054b:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20000550:	e8 9b 18 00 00       	call   20001df0 <UVM_Print_String>
    20000555:	bf 44 27 00 20       	mov    $0x20002744,%edi
    2000055a:	e8 91 18 00 00       	call   20001df0 <UVM_Print_String>
    2000055f:	eb fe                	jmp    2000055f <TEST_SIG_FUNC2+0x15f>
    20000561:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    20000568:	00 00 00 00 
    2000056c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000020000570 <TEST_INV1_FUNC>:

void TEST_INV1_FUNC(ptr_t param)
{
    20000570:	f3 0f 1e fa          	endbr64 
    20000574:	55                   	push   %rbp
    20000575:	48 89 fd             	mov    %rdi,%rbp
    middle=__UVM_X64_Read_TSC();
    20000578:	e8 9e fa ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    UVM_Inv_Ret(param);
    2000057d:	48 89 ef             	mov    %rbp,%rdi
}
    20000580:	5d                   	pop    %rbp
    middle=__UVM_X64_Read_TSC();
    20000581:	48 89 05 98 2a 00 00 	mov    %rax,0x2a98(%rip)        # 20003020 <middle>
    UVM_Inv_Ret(param);
    20000588:	e9 57 fb ff ff       	jmp    200000e4 <UVM_Inv_Ret>
    2000058d:	0f 1f 00             	nopl   (%rax)

0000000020000590 <main>:
Input       : None.
Output      : None.
Return      : int - This function shall never return.
******************************************************************************/
int main(ptr_t CPUID)
{
    20000590:	f3 0f 1e fa          	endbr64 
    20000594:	41 57                	push   %r15
    20000596:	41 56                	push   %r14
    20000598:	41 55                	push   %r13
    2000059a:	41 54                	push   %r12
    2000059c:	55                   	push   %rbp
    2000059d:	53                   	push   %rbx
    2000059e:	48 89 fb             	mov    %rdi,%rbx
    ptr_t Cur_Addr;
    cnt_t Count;
    cnt_t Count1;
    cnt_t Count2;
    UVM_LOG_S("........Booting RME system........");
    200005a1:	bf b0 25 00 20       	mov    $0x200025b0,%edi
{
    200005a6:	48 83 ec 08          	sub    $0x8,%rsp
    UVM_LOG_S("........Booting RME system........");
    200005aa:	e8 41 18 00 00       	call   20001df0 <UVM_Print_String>
    UVM_LOG_S("\r\nEnter user mode success!Welcome to RME system!");
    200005af:	bf d8 25 00 20       	mov    $0x200025d8,%edi
    200005b4:	e8 37 18 00 00       	call   20001df0 <UVM_Print_String>
    UVM_LOG_S("\r\nNow we are running init thread on cpu:");
    200005b9:	bf 10 26 00 20       	mov    $0x20002610,%edi
    200005be:	e8 2d 18 00 00       	call   20001df0 <UVM_Print_String>
    UVM_LOG_I(CPUID);
    200005c3:	48 89 df             	mov    %rbx,%rdi
    200005c6:	e8 f5 15 00 00       	call   20001bc0 <UVM_Print_Int>
    if(CPUID==0) 
    200005cb:	48 85 db             	test   %rbx,%rbx
    200005ce:	0f 85 0b 05 00 00    	jne    20000adf <main+0x54f>
    {
        /*Empty test begins here*/
        sum=0;
    200005d4:	48 c7 05 31 2a 00 00 	movq   $0x0,0x2a31(%rip)        # 20003010 <sum>
    200005db:	00 00 00 00 
    200005df:	bb 10 27 00 00       	mov    $0x2710,%ebx
    200005e4:	0f 1f 40 00          	nopl   0x0(%rax)
        for(Count=0;Count<10000;Count++)
        {
            start=__UVM_X64_Read_TSC();
    200005e8:	e8 2e fa ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    200005ed:	48 89 05 34 2a 00 00 	mov    %rax,0x2a34(%rip)        # 20003028 <start>
            end=__UVM_X64_Read_TSC();
    200005f4:	e8 22 fa ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    200005f9:	48 89 05 18 2a 00 00 	mov    %rax,0x2a18(%rip)        # 20003018 <end>
            sum+=end-start;
    20000600:	48 8b 05 11 2a 00 00 	mov    0x2a11(%rip),%rax        # 20003018 <end>
    20000607:	48 8b 15 1a 2a 00 00 	mov    0x2a1a(%rip),%rdx        # 20003028 <start>
    2000060e:	48 29 d0             	sub    %rdx,%rax
    20000611:	48 01 05 f8 29 00 00 	add    %rax,0x29f8(%rip)        # 20003010 <sum>
        for(Count=0;Count<10000;Count++)
    20000618:	48 83 eb 01          	sub    $0x1,%rbx
    2000061c:	75 ca                	jne    200005e8 <main+0x58>
        }
        UVM_LOG_S("\r\nEmpty test takes clock cycles:");
    2000061e:	bf 40 26 00 20       	mov    $0x20002640,%edi
        UVM_LOG_I(sum/10000);
        /*Empty test ends here*/

        /*Empty system call test begins here*/
        sum=0;
    20000623:	bb 10 27 00 00       	mov    $0x2710,%ebx
        UVM_LOG_S("\r\nEmpty test takes clock cycles:");
    20000628:	e8 c3 17 00 00       	call   20001df0 <UVM_Print_String>
        UVM_LOG_I(sum/10000);
    2000062d:	48 8b 05 dc 29 00 00 	mov    0x29dc(%rip),%rax        # 20003010 <sum>
    20000634:	b9 10 27 00 00       	mov    $0x2710,%ecx
    20000639:	31 d2                	xor    %edx,%edx
    2000063b:	48 f7 f1             	div    %rcx
    2000063e:	48 89 c7             	mov    %rax,%rdi
    20000641:	e8 7a 15 00 00       	call   20001bc0 <UVM_Print_Int>
        sum=0;
    20000646:	48 c7 05 bf 29 00 00 	movq   $0x0,0x29bf(%rip)        # 20003010 <sum>
    2000064d:	00 00 00 00 
        for(Count=0;Count<10000;Count++)
    20000651:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
        {
            start=__UVM_X64_Read_TSC();
    20000658:	e8 be f9 ff ff       	call   2000001b <__UVM_X64_Read_TSC>
            UVM_Svc(-1,-1,-1,-1);
    2000065d:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    20000664:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    2000066b:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
    20000672:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
            start=__UVM_X64_Read_TSC();
    20000679:	48 89 05 a8 29 00 00 	mov    %rax,0x29a8(%rip)        # 20003028 <start>
            UVM_Svc(-1,-1,-1,-1);
    20000680:	e8 68 fa ff ff       	call   200000ed <UVM_Svc>
            end=__UVM_X64_Read_TSC();
    20000685:	e8 91 f9 ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    2000068a:	48 89 05 87 29 00 00 	mov    %rax,0x2987(%rip)        # 20003018 <end>
            sum+=end-start;
    20000691:	48 8b 05 80 29 00 00 	mov    0x2980(%rip),%rax        # 20003018 <end>
    20000698:	48 8b 15 89 29 00 00 	mov    0x2989(%rip),%rdx        # 20003028 <start>
    2000069f:	48 29 d0             	sub    %rdx,%rax
    200006a2:	48 01 05 67 29 00 00 	add    %rax,0x2967(%rip)        # 20003010 <sum>
        for(Count=0;Count<10000;Count++)
    200006a9:	48 83 eb 01          	sub    $0x1,%rbx
    200006ad:	75 a9                	jne    20000658 <main+0xc8>
        }
        UVM_LOG_S("\r\nEmpty system call takes clock cycles:");
    200006af:	bf 68 26 00 20       	mov    $0x20002668,%edi
    200006b4:	e8 37 17 00 00       	call   20001df0 <UVM_Print_String>
        UVM_LOG_I(sum/10000);
    200006b9:	48 8b 05 50 29 00 00 	mov    0x2950(%rip),%rax        # 20003010 <sum>
    200006c0:	b9 10 27 00 00       	mov    $0x2710,%ecx
    200006c5:	31 d2                	xor    %edx,%edx
    200006c7:	48 f7 f1             	div    %rcx
    200006ca:	48 89 c7             	mov    %rax,%rdi
    200006cd:	e8 ee 14 00 00       	call   20001bc0 <UVM_Print_Int>
        /*Now we begin to create UVM kernel objects*/
        Cur_Addr=UVM_OBJ_BASE;
        
        /*Thread switching test begins here, We place the thread stack at 12MB */
        /*Create test thread capability table*/
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD_TBL,Cur_Addr,16)>=0);
    200006d2:	31 ff                	xor    %edi,%edi
    200006d4:	41 b8 10 00 00 00    	mov    $0x10,%r8d
    200006da:	b9 00 00 a0 0e       	mov    $0xea00000,%ecx
    200006df:	ba 09 00 00 00       	mov    $0x9,%edx
    200006e4:	be 00 80 05 00       	mov    $0x58000,%esi
    200006e9:	e8 42 17 00 00       	call   20001e30 <UVM_Captbl_Crt>
    200006ee:	48 85 c0             	test   %rax,%rax
    200006f1:	0f 88 f6 03 00 00    	js     20000aed <main+0x55d>
        Cur_Addr+=UVM_CAPTBL_SIZE(16);
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD1, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
    200006f7:	31 d2                	xor    %edx,%edx
    200006f9:	41 b9 00 04 a0 0e    	mov    $0xea00400,%r9d
    200006ff:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
    20000705:	b9 02 00 00 00       	mov    $0x2,%ecx
    2000070a:	be 00 80 05 00       	mov    $0x58000,%esi
    2000070f:	bf 09 00 00 00       	mov    $0x9,%edi
    20000714:	e8 87 1a 00 00       	call   200021a0 <UVM_Thd_Crt>
    20000719:	48 85 c0             	test   %rax,%rax
    2000071c:	0f 88 27 04 00 00    	js     20000b49 <main+0x5b9>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD1),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
    20000722:	45 31 c0             	xor    %r8d,%r8d
    20000725:	31 c9                	xor    %ecx,%ecx
    20000727:	ba 00 00 00 80       	mov    $0x80000000,%edx
    2000072c:	be 00 80 03 00       	mov    $0x38000,%esi
    20000731:	bf 00 80 09 00       	mov    $0x98000,%edi
    20000736:	e8 05 1b 00 00       	call   20002240 <UVM_Thd_Sched_Bind>
    2000073b:	48 85 c0             	test   %rax,%rax
    2000073e:	0f 88 61 04 00 00    	js     20000ba5 <main+0x615>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD1),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
    20000744:	be 00 80 03 00       	mov    $0x38000,%esi
    20000749:	bf 00 80 09 00       	mov    $0x98000,%edi
    Word_Inc=(ptr_t*)Addr;
    2000074e:	bb 00 00 c0 00       	mov    $0xc00000,%ebx
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD1),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
    20000753:	48 ba fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rdx
    2000075a:	ff ff 7f 
    2000075d:	e8 6e 1b 00 00       	call   200022d0 <UVM_Thd_Time_Xfer>
    20000762:	48 85 c0             	test   %rax,%rax
    20000765:	0f 88 f2 04 00 00    	js     20000c5d <main+0x6cd>
        *Word_Inc=0;
    2000076b:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
        Word_Inc++;
    20000772:	48 83 c3 08          	add    $0x8,%rbx
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
    20000776:	48 81 fb 00 00 d0 00 	cmp    $0xd00000,%rbx
    2000077d:	75 ec                	jne    2000076b <main+0x1db>
        UVM_Clear((void*)(12*UVM_POW2(RME_PGT_SIZE_1M)), UVM_POW2(RME_PGT_SIZE_1M));
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD1),(ptr_t)TEST_THD_FUNC1,12*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,0)>=0);
    2000077f:	31 c9                	xor    %ecx,%ecx
    20000781:	ba 00 00 c0 20       	mov    $0x20c00000,%edx
    20000786:	be 50 01 00 20       	mov    $0x20000150,%esi
    2000078b:	bf 00 80 09 00       	mov    $0x98000,%edi
    20000790:	e8 6b 1a 00 00       	call   20002200 <UVM_Thd_Exec_Set>
    20000795:	48 85 c0             	test   %rax,%rax
    20000798:	0f 88 63 04 00 00    	js     20000c01 <main+0x671>
        Cur_Addr+=UVM_THD_SIZE;
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD2, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
    2000079e:	41 b9 d0 0d a0 0e    	mov    $0xea00dd0,%r9d
    200007a4:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
    200007aa:	b9 02 00 00 00       	mov    $0x2,%ecx
    200007af:	ba 01 00 00 00       	mov    $0x1,%edx
    200007b4:	be 00 80 05 00       	mov    $0x58000,%esi
    200007b9:	bf 09 00 00 00       	mov    $0x9,%edi
    200007be:	e8 dd 19 00 00       	call   200021a0 <UVM_Thd_Crt>
    200007c3:	48 85 c0             	test   %rax,%rax
    200007c6:	0f 88 ed 04 00 00    	js     20000cb9 <main+0x729>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD2),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
    200007cc:	45 31 c0             	xor    %r8d,%r8d
    200007cf:	31 c9                	xor    %ecx,%ecx
    200007d1:	ba 00 00 00 80       	mov    $0x80000000,%edx
    200007d6:	be 00 80 03 00       	mov    $0x38000,%esi
    200007db:	bf 01 80 09 00       	mov    $0x98001,%edi
    200007e0:	e8 5b 1a 00 00       	call   20002240 <UVM_Thd_Sched_Bind>
    200007e5:	48 85 c0             	test   %rax,%rax
    200007e8:	0f 88 27 05 00 00    	js     20000d15 <main+0x785>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD2),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
    200007ee:	48 ba fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rdx
    200007f5:	ff ff 7f 
    200007f8:	be 00 80 03 00       	mov    $0x38000,%esi
    200007fd:	bf 01 80 09 00       	mov    $0x98001,%edi
    20000802:	e8 c9 1a 00 00       	call   200022d0 <UVM_Thd_Time_Xfer>
    20000807:	48 85 c0             	test   %rax,%rax
    2000080a:	0f 88 bd 05 00 00    	js     20000dcd <main+0x83d>
        *Word_Inc=0;
    20000810:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
        Word_Inc++;
    20000817:	48 83 c3 08          	add    $0x8,%rbx
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
    2000081b:	48 81 fb 00 00 e0 00 	cmp    $0xe00000,%rbx
    20000822:	75 ec                	jne    20000810 <main+0x280>
        UVM_Clear((void*)(13*UVM_POW2(RME_PGT_SIZE_1M)), UVM_POW2(RME_PGT_SIZE_1M));
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD2),(ptr_t)TEST_THD_FUNC2,13*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,1)>=0);
    20000824:	b9 01 00 00 00       	mov    $0x1,%ecx
    20000829:	ba 00 00 d0 20       	mov    $0x20d00000,%edx
    2000082e:	be 10 01 00 20       	mov    $0x20000110,%esi
    20000833:	bf 01 80 09 00       	mov    $0x98001,%edi
    20000838:	e8 c3 19 00 00       	call   20002200 <UVM_Thd_Exec_Set>
    2000083d:	48 85 c0             	test   %rax,%rax
    20000840:	0f 88 2b 05 00 00    	js     20000d71 <main+0x7e1>
        Cur_Addr+=UVM_THD_SIZE;
        UVM_LOG_S("\r\nSwtching thread...");
    20000846:	bf 5f 27 00 20       	mov    $0x2000275f,%edi
    2000084b:	e8 a0 15 00 00       	call   20001df0 <UVM_Print_String>
        UVM_Thd_Swt(UVM_CAPID(TEST_THD_TBL,TEST_THD1),0);
    20000850:	31 f6                	xor    %esi,%esi
    20000852:	bf 00 80 09 00       	mov    $0x98000,%edi
    20000857:	e8 94 1a 00 00       	call   200022f0 <UVM_Thd_Swt>
        UVM_LOG_S("\r\nBack to main thread!");
    2000085c:	bf 74 27 00 20       	mov    $0x20002774,%edi
    20000861:	e8 8a 15 00 00       	call   20001df0 <UVM_Print_String>
        /*Thread switching test ends here*/
        
        /*Signal Sending-receiving test begins here*/
        /*create endpoint first*/
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG1, Cur_Addr)>=0);
    20000866:	b9 a0 17 a0 0e       	mov    $0xea017a0,%ecx
    2000086b:	ba 0b 00 00 00       	mov    $0xb,%edx
    20000870:	31 ff                	xor    %edi,%edi
    20000872:	be 00 80 05 00       	mov    $0x58000,%esi
    20000877:	e8 94 1a 00 00       	call   20002310 <UVM_Sig_Crt>
    2000087c:	49 89 c0             	mov    %rax,%r8
    Word_Inc=(ptr_t*)Addr;
    2000087f:	b8 00 00 c0 00       	mov    $0xc00000,%eax
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG1, Cur_Addr)>=0);
    20000884:	4d 85 c0             	test   %r8,%r8
    20000887:	0f 88 9c 05 00 00    	js     20000e29 <main+0x899>
        *Word_Inc=0;
    2000088d:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
        Word_Inc++;
    20000894:	48 83 c0 08          	add    $0x8,%rax
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
    20000898:	48 3d 00 00 d0 00    	cmp    $0xd00000,%rax
    2000089e:	75 ed                	jne    2000088d <main+0x2fd>
        Cur_Addr+=UVM_SIG_SIZE;
        /*reset two threads*/
        UVM_Clear((void*)(12*UVM_POW2(RME_PGT_SIZE_1M)), UVM_POW2(RME_PGT_SIZE_1M));
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD1),(ptr_t)TEST_SIG_FUNC1,12*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,0)>=0);
    200008a0:	31 c9                	xor    %ecx,%ecx
    200008a2:	ba 00 00 c0 20       	mov    $0x20c00000,%edx
    200008a7:	be 90 02 00 20       	mov    $0x20000290,%esi
    200008ac:	bf 00 80 09 00       	mov    $0x98000,%edi
    200008b1:	e8 4a 19 00 00       	call   20002200 <UVM_Thd_Exec_Set>
    200008b6:	48 85 c0             	test   %rax,%rax
    200008b9:	0f 88 22 06 00 00    	js     20000ee1 <main+0x951>
        /*throw away thread1 infinity time slices,and add finity time slices to it*/
        //UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(UVM_BOOT_TBL_THD,0),TEST_THD1,UVM_THD_INIT_TIME)>=0);
        //UVM_ASSERT(UVM_Thd_Time_Xfer(TEST_THD1,UVM_CAPID(UVM_BOOT_TBL_THD,0),100)>=0);
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD1),1)>=0);
    200008bf:	be 01 00 00 00       	mov    $0x1,%esi
    200008c4:	bf 00 80 09 00       	mov    $0x98000,%edi
    200008c9:	bd 10 27 00 00       	mov    $0x2710,%ebp
    200008ce:	e8 bd 19 00 00       	call   20002290 <UVM_Thd_Sched_Prio>
    200008d3:	48 85 c0             	test   %rax,%rax
    200008d6:	0f 88 a9 05 00 00    	js     20000e85 <main+0x8f5>
        for(Count=0;Count<10000;Count++)
        {
            UVM_Sig_Snd(TEST_SIG1);
    200008dc:	bf 0b 00 00 00       	mov    $0xb,%edi
    200008e1:	e8 6a 1a 00 00       	call   20002350 <UVM_Sig_Snd>
        for(Count=0;Count<10000;Count++)
    200008e6:	48 83 ed 01          	sub    $0x1,%rbp
    200008ea:	75 f0                	jne    200008dc <main+0x34c>
        }
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD1),0)>=0);
    200008ec:	31 f6                	xor    %esi,%esi
    200008ee:	bf 00 80 09 00       	mov    $0x98000,%edi
    200008f3:	e8 98 19 00 00       	call   20002290 <UVM_Thd_Sched_Prio>
    200008f8:	48 85 c0             	test   %rax,%rax
    200008fb:	0f 88 1f 12 00 00    	js     20001b20 <main+0x1590>
        /*Signal Sending-receiving test ends here*/

        /*Cross-process thread switching test begins here*/

        /*Create test process capability table*/
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROC_CAPTBL,Cur_Addr,16)>=0);
    20000901:	31 ff                	xor    %edi,%edi
    20000903:	41 b8 10 00 00 00    	mov    $0x10,%r8d
    20000909:	b9 c0 17 a0 0e       	mov    $0xea017c0,%ecx
    2000090e:	ba 0d 00 00 00       	mov    $0xd,%edx
    20000913:	be 00 80 05 00       	mov    $0x58000,%esi
    20000918:	e8 13 15 00 00       	call   20001e30 <UVM_Captbl_Crt>
    2000091d:	48 85 c0             	test   %rax,%rax
    20000920:	0f 88 9e 11 00 00    	js     20001ac4 <main+0x1534>
        Cur_Addr+=UVM_CAPTBL_SIZE(16);
        /*Create test process page table*/
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS_PGT,Cur_Addr,1+16+8192)>=0);
    20000926:	31 ff                	xor    %edi,%edi
    20000928:	41 b8 11 20 00 00    	mov    $0x2011,%r8d
    2000092e:	b9 c0 1b a0 0e       	mov    $0xea01bc0,%ecx
    20000933:	ba 0e 00 00 00       	mov    $0xe,%edx
    20000938:	be 00 80 05 00       	mov    $0x58000,%esi
    2000093d:	e8 ee 14 00 00       	call   20001e30 <UVM_Captbl_Crt>
    20000942:	48 85 c0             	test   %rax,%rax
    20000945:	0f 88 1d 11 00 00    	js     20001a68 <main+0x14d8>
        Cur_Addr+=UVM_CAPTBL_SIZE(1+16+8192);
        /*Create test process PML4*/
        Cur_Addr=UVM_ROUND_UP(Cur_Addr,12);
        UVM_ASSERT(UVM_Pgtbl_Crt(TEST_PROCESS_PGT,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS_PML4,Cur_Addr,0,1U,RME_PGT_SIZE_512G,RME_PGT_NUM_512)>=0);
    2000094b:	6a 09                	push   $0x9
    2000094d:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    20000953:	45 31 c0             	xor    %r8d,%r8d
    20000956:	b9 00 20 a8 0e       	mov    $0xea82000,%ecx
    2000095b:	6a 27                	push   $0x27
    2000095d:	31 d2                	xor    %edx,%edx
    2000095f:	be 00 80 05 00       	mov    $0x58000,%esi
    20000964:	bf 0e 00 00 00       	mov    $0xe,%edi
    20000969:	e8 92 16 00 00       	call   20002000 <UVM_Pgtbl_Crt>
    2000096e:	41 59                	pop    %r9
    20000970:	41 5a                	pop    %r10
    20000972:	48 85 c0             	test   %rax,%rax
    20000975:	0f 88 91 10 00 00    	js     20001a0c <main+0x147c>
        Cur_Addr+=UVM_PGTBL_SIZE_NOM(RME_PGT_NUM_512);
        /* Create 16 PDPs*/
        for(Count=0;Count<16;Count++)
    2000097b:	45 31 e4             	xor    %r12d,%r12d
        Cur_Addr+=UVM_PGTBL_SIZE_NOM(RME_PGT_NUM_512);
    2000097e:	bd 00 a0 a8 0e       	mov    $0xea8a000,%ebp
        {
            UVM_ASSERT(UVM_Pgtbl_Crt(UVM_CAPID(UVM_BOOT_CAPTBL,TEST_PROCESS_PGT), UVM_CAPID(UVM_BOOT_TBL_KMEM,0), RME_TEST_PDP(Count),
    20000983:	6a 09                	push   $0x9
    20000985:	4d 89 e5             	mov    %r12,%r13
    20000988:	49 83 c4 01          	add    $0x1,%r12
    2000098c:	bf 0e 80 00 00       	mov    $0x800e,%edi
    20000991:	6a 1e                	push   $0x1e
    20000993:	4d 89 e8             	mov    %r13,%r8
    20000996:	45 31 c9             	xor    %r9d,%r9d
    20000999:	48 89 e9             	mov    %rbp,%rcx
    2000099c:	49 c1 e0 27          	shl    $0x27,%r8
    200009a0:	4c 89 e2             	mov    %r12,%rdx
    200009a3:	be 00 80 05 00       	mov    $0x58000,%esi
    200009a8:	e8 53 16 00 00       	call   20002000 <UVM_Pgtbl_Crt>
    200009ad:	5f                   	pop    %rdi
    200009ae:	41 58                	pop    %r8
    200009b0:	48 85 c0             	test   %rax,%rax
    200009b3:	0f 88 e0 05 00 00    	js     20000f99 <main+0xa09>
                                           Cur_Addr, (ptr_t)UVM_POW2(RME_PGT_SIZE_512G)*Count, 0U, RME_PGT_SIZE_1G, RME_PGT_NUM_512)>=0);
            Cur_Addr+=UVM_PGTBL_SIZE_NOM(RME_PGT_NUM_512);
            UVM_ASSERT(UVM_Pgtbl_Con(UVM_CAPID(TEST_PROCESS_PGT,TEST_PROCESS_PML4),Count,
    200009b9:	4c 89 e2             	mov    %r12,%rdx
    200009bc:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    200009c1:	4c 89 ee             	mov    %r13,%rsi
    200009c4:	bf 00 80 0e 00       	mov    $0xe8000,%edi
    200009c9:	48 81 ca 00 80 0e 00 	or     $0xe8000,%rdx
            Cur_Addr+=UVM_PGTBL_SIZE_NOM(RME_PGT_NUM_512);
    200009d0:	48 81 c5 00 80 00 00 	add    $0x8000,%rbp
            UVM_ASSERT(UVM_Pgtbl_Con(UVM_CAPID(TEST_PROCESS_PGT,TEST_PROCESS_PML4),Count,
    200009d7:	e8 f4 16 00 00       	call   200020d0 <UVM_Pgtbl_Con>
    200009dc:	48 85 c0             	test   %rax,%rax
    200009df:	0f 88 58 05 00 00    	js     20000f3d <main+0x9ad>
        for(Count=0;Count<16;Count++)
    200009e5:	48 81 fd 00 a0 b0 0e 	cmp    $0xeb0a000,%rbp
    200009ec:	75 95                	jne    20000983 <main+0x3f3>
                                                UVM_CAPID(TEST_PROCESS_PGT,RME_TEST_PDP(Count)),RME_PGT_ALL_PERM)>=0);
        }
        UVM_LOG_S("\r\nCreate PDPs success!");
    200009ee:	bf 8b 27 00 20       	mov    $0x2000278b,%edi
        /* Create 8192 PDEs*/
        for(Count=0;Count<8192;Count++)
    200009f3:	45 31 e4             	xor    %r12d,%r12d
        UVM_LOG_S("\r\nCreate PDPs success!");
    200009f6:	e8 f5 13 00 00       	call   20001df0 <UVM_Print_String>
        for(Count=0;Count<8192;Count++)
    200009fb:	eb 53                	jmp    20000a50 <main+0x4c0>
        {
            UVM_ASSERT(UVM_Pgtbl_Crt(UVM_CAPID(UVM_BOOT_CAPTBL,TEST_PROCESS_PGT), UVM_CAPID(UVM_BOOT_TBL_KMEM,0), RME_TEST_PDE(Count),
                                           Cur_Addr, (ptr_t)UVM_POW2(RME_PGT_SIZE_1G)*Count, 0U,  RME_PGT_SIZE_2M, RME_PGT_NUM_512)>=0);
            Cur_Addr+=UVM_PGTBL_SIZE_NOM(RME_PGT_NUM_512);
            UVM_ASSERT(UVM_Pgtbl_Con(UVM_CAPID(TEST_PROCESS_PGT,RME_TEST_PDP(Count>>9)),Count&0x1FF,
    200009fd:	4c 89 e7             	mov    %r12,%rdi
    20000a00:	4c 89 f2             	mov    %r14,%rdx
    20000a03:	4c 89 e6             	mov    %r12,%rsi
    20000a06:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    20000a0b:	48 c1 ff 09          	sar    $0x9,%rdi
    20000a0f:	48 81 ca 00 80 0e 00 	or     $0xe8000,%rdx
    20000a16:	81 e6 ff 01 00 00    	and    $0x1ff,%esi
    20000a1c:	48 83 c7 01          	add    $0x1,%rdi
            Cur_Addr+=UVM_PGTBL_SIZE_NOM(RME_PGT_NUM_512);
    20000a20:	4c 8d ad 00 80 00 00 	lea    0x8000(%rbp),%r13
            UVM_ASSERT(UVM_Pgtbl_Con(UVM_CAPID(TEST_PROCESS_PGT,RME_TEST_PDP(Count>>9)),Count&0x1FF,
    20000a27:	48 81 cf 00 80 0e 00 	or     $0xe8000,%rdi
    20000a2e:	e8 9d 16 00 00       	call   200020d0 <UVM_Pgtbl_Con>
    20000a33:	48 85 c0             	test   %rax,%rax
    20000a36:	0f 88 6a 06 00 00    	js     200010a6 <main+0xb16>
        for(Count=0;Count<8192;Count++)
    20000a3c:	49 83 c4 01          	add    $0x1,%r12
    20000a40:	49 81 fc 00 20 00 00 	cmp    $0x2000,%r12
    20000a47:	0f 84 a8 05 00 00    	je     20000ff5 <main+0xa65>
            Cur_Addr+=UVM_PGTBL_SIZE_NOM(RME_PGT_NUM_512);
    20000a4d:	4c 89 ed             	mov    %r13,%rbp
            UVM_ASSERT(UVM_Pgtbl_Crt(UVM_CAPID(UVM_BOOT_CAPTBL,TEST_PROCESS_PGT), UVM_CAPID(UVM_BOOT_TBL_KMEM,0), RME_TEST_PDE(Count),
    20000a50:	6a 09                	push   $0x9
    20000a52:	4d 8d 74 24 11       	lea    0x11(%r12),%r14
    20000a57:	4d 89 e0             	mov    %r12,%r8
    20000a5a:	48 89 e9             	mov    %rbp,%rcx
    20000a5d:	6a 15                	push   $0x15
    20000a5f:	be 00 80 05 00       	mov    $0x58000,%esi
    20000a64:	45 31 c9             	xor    %r9d,%r9d
    20000a67:	49 c1 e0 1e          	shl    $0x1e,%r8
    20000a6b:	4c 89 f2             	mov    %r14,%rdx
    20000a6e:	bf 0e 80 00 00       	mov    $0x800e,%edi
    20000a73:	e8 88 15 00 00       	call   20002000 <UVM_Pgtbl_Crt>
    20000a78:	59                   	pop    %rcx
    20000a79:	5e                   	pop    %rsi
    20000a7a:	48 85 c0             	test   %rax,%rax
    20000a7d:	0f 89 7a ff ff ff    	jns    200009fd <main+0x46d>
    20000a83:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20000a88:	e8 63 13 00 00       	call   20001df0 <UVM_Print_String>
    20000a8d:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20000a92:	e8 59 13 00 00       	call   20001df0 <UVM_Print_String>
    20000a97:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20000a9c:	e8 4f 13 00 00       	call   20001df0 <UVM_Print_String>
    20000aa1:	bf 29 01 00 00       	mov    $0x129,%edi
    20000aa6:	e8 15 11 00 00       	call   20001bc0 <UVM_Print_Int>
    20000aab:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000ab0:	e8 3b 13 00 00       	call   20001df0 <UVM_Print_String>
    20000ab5:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20000aba:	e8 31 13 00 00       	call   20001df0 <UVM_Print_String>
    20000abf:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20000ac4:	e8 27 13 00 00       	call   20001df0 <UVM_Print_String>
    20000ac9:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20000ace:	e8 1d 13 00 00       	call   20001df0 <UVM_Print_String>
    20000ad3:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000ad8:	e8 13 13 00 00       	call   20001df0 <UVM_Print_String>
    20000add:	eb fe                	jmp    20000add <main+0x54d>
        /*Idle*/
        UVM_LOG_S("\r\nIdle......");
        while (1);
    }
    return 0;
}
    20000adf:	5a                   	pop    %rdx
    20000ae0:	31 c0                	xor    %eax,%eax
    20000ae2:	5b                   	pop    %rbx
    20000ae3:	5d                   	pop    %rbp
    20000ae4:	41 5c                	pop    %r12
    20000ae6:	41 5d                	pop    %r13
    20000ae8:	41 5e                	pop    %r14
    20000aea:	41 5f                	pop    %r15
    20000aec:	c3                   	ret    
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD_TBL,Cur_Addr,16)>=0);
    20000aed:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20000af2:	e8 f9 12 00 00       	call   20001df0 <UVM_Print_String>
    20000af7:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20000afc:	e8 ef 12 00 00       	call   20001df0 <UVM_Print_String>
    20000b01:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20000b06:	e8 e5 12 00 00       	call   20001df0 <UVM_Print_String>
    20000b0b:	bf eb 00 00 00       	mov    $0xeb,%edi
    20000b10:	e8 ab 10 00 00       	call   20001bc0 <UVM_Print_Int>
    20000b15:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000b1a:	e8 d1 12 00 00       	call   20001df0 <UVM_Print_String>
    20000b1f:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20000b24:	e8 c7 12 00 00       	call   20001df0 <UVM_Print_String>
    20000b29:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20000b2e:	e8 bd 12 00 00       	call   20001df0 <UVM_Print_String>
    20000b33:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20000b38:	e8 b3 12 00 00       	call   20001df0 <UVM_Print_String>
    20000b3d:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000b42:	e8 a9 12 00 00       	call   20001df0 <UVM_Print_String>
    20000b47:	eb fe                	jmp    20000b47 <main+0x5b7>
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD1, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
    20000b49:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20000b4e:	e8 9d 12 00 00       	call   20001df0 <UVM_Print_String>
    20000b53:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20000b58:	e8 93 12 00 00       	call   20001df0 <UVM_Print_String>
    20000b5d:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20000b62:	e8 89 12 00 00       	call   20001df0 <UVM_Print_String>
    20000b67:	bf ed 00 00 00       	mov    $0xed,%edi
    20000b6c:	e8 4f 10 00 00       	call   20001bc0 <UVM_Print_Int>
    20000b71:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000b76:	e8 75 12 00 00       	call   20001df0 <UVM_Print_String>
    20000b7b:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20000b80:	e8 6b 12 00 00       	call   20001df0 <UVM_Print_String>
    20000b85:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20000b8a:	e8 61 12 00 00       	call   20001df0 <UVM_Print_String>
    20000b8f:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20000b94:	e8 57 12 00 00       	call   20001df0 <UVM_Print_String>
    20000b99:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000b9e:	e8 4d 12 00 00       	call   20001df0 <UVM_Print_String>
    20000ba3:	eb fe                	jmp    20000ba3 <main+0x613>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD1),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
    20000ba5:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20000baa:	e8 41 12 00 00       	call   20001df0 <UVM_Print_String>
    20000baf:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20000bb4:	e8 37 12 00 00       	call   20001df0 <UVM_Print_String>
    20000bb9:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20000bbe:	e8 2d 12 00 00       	call   20001df0 <UVM_Print_String>
    20000bc3:	bf ee 00 00 00       	mov    $0xee,%edi
    20000bc8:	e8 f3 0f 00 00       	call   20001bc0 <UVM_Print_Int>
    20000bcd:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000bd2:	e8 19 12 00 00       	call   20001df0 <UVM_Print_String>
    20000bd7:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20000bdc:	e8 0f 12 00 00       	call   20001df0 <UVM_Print_String>
    20000be1:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20000be6:	e8 05 12 00 00       	call   20001df0 <UVM_Print_String>
    20000beb:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20000bf0:	e8 fb 11 00 00       	call   20001df0 <UVM_Print_String>
    20000bf5:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000bfa:	e8 f1 11 00 00       	call   20001df0 <UVM_Print_String>
    20000bff:	eb fe                	jmp    20000bff <main+0x66f>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD1),(ptr_t)TEST_THD_FUNC1,12*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,0)>=0);
    20000c01:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20000c06:	e8 e5 11 00 00       	call   20001df0 <UVM_Print_String>
    20000c0b:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20000c10:	e8 db 11 00 00       	call   20001df0 <UVM_Print_String>
    20000c15:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20000c1a:	e8 d1 11 00 00       	call   20001df0 <UVM_Print_String>
    20000c1f:	bf f1 00 00 00       	mov    $0xf1,%edi
    20000c24:	e8 97 0f 00 00       	call   20001bc0 <UVM_Print_Int>
    20000c29:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000c2e:	e8 bd 11 00 00       	call   20001df0 <UVM_Print_String>
    20000c33:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20000c38:	e8 b3 11 00 00       	call   20001df0 <UVM_Print_String>
    20000c3d:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20000c42:	e8 a9 11 00 00       	call   20001df0 <UVM_Print_String>
    20000c47:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20000c4c:	e8 9f 11 00 00       	call   20001df0 <UVM_Print_String>
    20000c51:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000c56:	e8 95 11 00 00       	call   20001df0 <UVM_Print_String>
    20000c5b:	eb fe                	jmp    20000c5b <main+0x6cb>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD1),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
    20000c5d:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20000c62:	e8 89 11 00 00       	call   20001df0 <UVM_Print_String>
    20000c67:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20000c6c:	e8 7f 11 00 00       	call   20001df0 <UVM_Print_String>
    20000c71:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20000c76:	e8 75 11 00 00       	call   20001df0 <UVM_Print_String>
    20000c7b:	bf ef 00 00 00       	mov    $0xef,%edi
    20000c80:	e8 3b 0f 00 00       	call   20001bc0 <UVM_Print_Int>
    20000c85:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000c8a:	e8 61 11 00 00       	call   20001df0 <UVM_Print_String>
    20000c8f:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20000c94:	e8 57 11 00 00       	call   20001df0 <UVM_Print_String>
    20000c99:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20000c9e:	e8 4d 11 00 00       	call   20001df0 <UVM_Print_String>
    20000ca3:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20000ca8:	e8 43 11 00 00       	call   20001df0 <UVM_Print_String>
    20000cad:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000cb2:	e8 39 11 00 00       	call   20001df0 <UVM_Print_String>
    20000cb7:	eb fe                	jmp    20000cb7 <main+0x727>
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD2, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
    20000cb9:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20000cbe:	e8 2d 11 00 00       	call   20001df0 <UVM_Print_String>
    20000cc3:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20000cc8:	e8 23 11 00 00       	call   20001df0 <UVM_Print_String>
    20000ccd:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20000cd2:	e8 19 11 00 00       	call   20001df0 <UVM_Print_String>
    20000cd7:	bf f3 00 00 00       	mov    $0xf3,%edi
    20000cdc:	e8 df 0e 00 00       	call   20001bc0 <UVM_Print_Int>
    20000ce1:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000ce6:	e8 05 11 00 00       	call   20001df0 <UVM_Print_String>
    20000ceb:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20000cf0:	e8 fb 10 00 00       	call   20001df0 <UVM_Print_String>
    20000cf5:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20000cfa:	e8 f1 10 00 00       	call   20001df0 <UVM_Print_String>
    20000cff:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20000d04:	e8 e7 10 00 00       	call   20001df0 <UVM_Print_String>
    20000d09:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000d0e:	e8 dd 10 00 00       	call   20001df0 <UVM_Print_String>
    20000d13:	eb fe                	jmp    20000d13 <main+0x783>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD2),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
    20000d15:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20000d1a:	e8 d1 10 00 00       	call   20001df0 <UVM_Print_String>
    20000d1f:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20000d24:	e8 c7 10 00 00       	call   20001df0 <UVM_Print_String>
    20000d29:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20000d2e:	e8 bd 10 00 00       	call   20001df0 <UVM_Print_String>
    20000d33:	bf f4 00 00 00       	mov    $0xf4,%edi
    20000d38:	e8 83 0e 00 00       	call   20001bc0 <UVM_Print_Int>
    20000d3d:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000d42:	e8 a9 10 00 00       	call   20001df0 <UVM_Print_String>
    20000d47:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20000d4c:	e8 9f 10 00 00       	call   20001df0 <UVM_Print_String>
    20000d51:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20000d56:	e8 95 10 00 00       	call   20001df0 <UVM_Print_String>
    20000d5b:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20000d60:	e8 8b 10 00 00       	call   20001df0 <UVM_Print_String>
    20000d65:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000d6a:	e8 81 10 00 00       	call   20001df0 <UVM_Print_String>
    20000d6f:	eb fe                	jmp    20000d6f <main+0x7df>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD2),(ptr_t)TEST_THD_FUNC2,13*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,1)>=0);
    20000d71:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20000d76:	e8 75 10 00 00       	call   20001df0 <UVM_Print_String>
    20000d7b:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20000d80:	e8 6b 10 00 00       	call   20001df0 <UVM_Print_String>
    20000d85:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20000d8a:	e8 61 10 00 00       	call   20001df0 <UVM_Print_String>
    20000d8f:	bf f7 00 00 00       	mov    $0xf7,%edi
    20000d94:	e8 27 0e 00 00       	call   20001bc0 <UVM_Print_Int>
    20000d99:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000d9e:	e8 4d 10 00 00       	call   20001df0 <UVM_Print_String>
    20000da3:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20000da8:	e8 43 10 00 00       	call   20001df0 <UVM_Print_String>
    20000dad:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20000db2:	e8 39 10 00 00       	call   20001df0 <UVM_Print_String>
    20000db7:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20000dbc:	e8 2f 10 00 00       	call   20001df0 <UVM_Print_String>
    20000dc1:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000dc6:	e8 25 10 00 00       	call   20001df0 <UVM_Print_String>
    20000dcb:	eb fe                	jmp    20000dcb <main+0x83b>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD2),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
    20000dcd:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20000dd2:	e8 19 10 00 00       	call   20001df0 <UVM_Print_String>
    20000dd7:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20000ddc:	e8 0f 10 00 00       	call   20001df0 <UVM_Print_String>
    20000de1:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20000de6:	e8 05 10 00 00       	call   20001df0 <UVM_Print_String>
    20000deb:	bf f5 00 00 00       	mov    $0xf5,%edi
    20000df0:	e8 cb 0d 00 00       	call   20001bc0 <UVM_Print_Int>
    20000df5:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000dfa:	e8 f1 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000dff:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20000e04:	e8 e7 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000e09:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20000e0e:	e8 dd 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000e13:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20000e18:	e8 d3 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000e1d:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000e22:	e8 c9 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000e27:	eb fe                	jmp    20000e27 <main+0x897>
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG1, Cur_Addr)>=0);
    20000e29:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20000e2e:	e8 bd 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000e33:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20000e38:	e8 b3 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000e3d:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20000e42:	e8 a9 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000e47:	bf 00 01 00 00       	mov    $0x100,%edi
    20000e4c:	e8 6f 0d 00 00       	call   20001bc0 <UVM_Print_Int>
    20000e51:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000e56:	e8 95 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000e5b:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20000e60:	e8 8b 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000e65:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20000e6a:	e8 81 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000e6f:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20000e74:	e8 77 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000e79:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000e7e:	e8 6d 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000e83:	eb fe                	jmp    20000e83 <main+0x8f3>
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD1),1)>=0);
    20000e85:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20000e8a:	e8 61 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000e8f:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20000e94:	e8 57 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000e99:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20000e9e:	e8 4d 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000ea3:	bf 08 01 00 00       	mov    $0x108,%edi
    20000ea8:	e8 13 0d 00 00       	call   20001bc0 <UVM_Print_Int>
    20000ead:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000eb2:	e8 39 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000eb7:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20000ebc:	e8 2f 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000ec1:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20000ec6:	e8 25 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000ecb:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20000ed0:	e8 1b 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000ed5:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000eda:	e8 11 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000edf:	eb fe                	jmp    20000edf <main+0x94f>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD1),(ptr_t)TEST_SIG_FUNC1,12*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,0)>=0);
    20000ee1:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20000ee6:	e8 05 0f 00 00       	call   20001df0 <UVM_Print_String>
    20000eeb:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20000ef0:	e8 fb 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000ef5:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20000efa:	e8 f1 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000eff:	bf 04 01 00 00       	mov    $0x104,%edi
    20000f04:	e8 b7 0c 00 00       	call   20001bc0 <UVM_Print_Int>
    20000f09:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000f0e:	e8 dd 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000f13:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20000f18:	e8 d3 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000f1d:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20000f22:	e8 c9 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000f27:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20000f2c:	e8 bf 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000f31:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000f36:	e8 b5 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000f3b:	eb fe                	jmp    20000f3b <main+0x9ab>
            UVM_ASSERT(UVM_Pgtbl_Con(UVM_CAPID(TEST_PROCESS_PGT,TEST_PROCESS_PML4),Count,
    20000f3d:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20000f42:	e8 a9 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000f47:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20000f4c:	e8 9f 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000f51:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20000f56:	e8 95 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000f5b:	bf 22 01 00 00       	mov    $0x122,%edi
    20000f60:	e8 5b 0c 00 00       	call   20001bc0 <UVM_Print_Int>
    20000f65:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000f6a:	e8 81 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000f6f:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20000f74:	e8 77 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000f79:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20000f7e:	e8 6d 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000f83:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20000f88:	e8 63 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000f8d:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000f92:	e8 59 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000f97:	eb fe                	jmp    20000f97 <main+0xa07>
            UVM_ASSERT(UVM_Pgtbl_Crt(UVM_CAPID(UVM_BOOT_CAPTBL,TEST_PROCESS_PGT), UVM_CAPID(UVM_BOOT_TBL_KMEM,0), RME_TEST_PDP(Count),
    20000f99:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20000f9e:	e8 4d 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000fa3:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20000fa8:	e8 43 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000fad:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20000fb2:	e8 39 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000fb7:	bf 1f 01 00 00       	mov    $0x11f,%edi
    20000fbc:	e8 ff 0b 00 00       	call   20001bc0 <UVM_Print_Int>
    20000fc1:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000fc6:	e8 25 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000fcb:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20000fd0:	e8 1b 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000fd5:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20000fda:	e8 11 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000fdf:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20000fe4:	e8 07 0e 00 00       	call   20001df0 <UVM_Print_String>
    20000fe9:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20000fee:	e8 fd 0d 00 00       	call   20001df0 <UVM_Print_String>
    20000ff3:	eb fe                	jmp    20000ff3 <main+0xa63>
        UVM_LOG_S("\r\nCreate PDEs success!");
    20000ff5:	bf a2 27 00 20       	mov    $0x200027a2,%edi
    20000ffa:	41 bc 11 00 00 00    	mov    $0x11,%r12d
    20001000:	e8 eb 0d 00 00       	call   20001df0 <UVM_Print_String>
                UVM_ASSERT(UVM_Pgtbl_Add(UVM_CAPID(TEST_PROCESS_PGT,RME_TEST_PDE(Count1)),Count2,(RME_PGT_READ|RME_PGT_WRITE|RME_PGT_EXECUTE|RME_PGT_CACHE|RME_PGT_BUFFER),
    20001005:	4d 89 e6             	mov    %r12,%r14
            for (Count2=0;Count2<512;Count2++)
    20001008:	45 31 ff             	xor    %r15d,%r15d
                UVM_ASSERT(UVM_Pgtbl_Add(UVM_CAPID(TEST_PROCESS_PGT,RME_TEST_PDE(Count1)),Count2,(RME_PGT_READ|RME_PGT_WRITE|RME_PGT_EXECUTE|RME_PGT_CACHE|RME_PGT_BUFFER),
    2000100b:	49 81 ce 00 80 01 00 	or     $0x18000,%r14
    20001012:	eb 11                	jmp    20001025 <main+0xa95>
            for (Count2=0;Count2<512;Count2++)
    20001014:	49 83 c7 01          	add    $0x1,%r15
    20001018:	49 81 ff 00 02 00 00 	cmp    $0x200,%r15
    2000101f:	0f 84 dd 00 00 00    	je     20001102 <main+0xb72>
                UVM_ASSERT(UVM_Pgtbl_Add(UVM_CAPID(TEST_PROCESS_PGT,RME_TEST_PDE(Count1)),Count2,(RME_PGT_READ|RME_PGT_WRITE|RME_PGT_EXECUTE|RME_PGT_CACHE|RME_PGT_BUFFER),
    20001025:	4c 89 e7             	mov    %r12,%rdi
    20001028:	45 31 c9             	xor    %r9d,%r9d
    2000102b:	4d 89 f8             	mov    %r15,%r8
    2000102e:	4c 89 f1             	mov    %r14,%rcx
    20001031:	48 81 cf 00 80 0e 00 	or     $0xe8000,%rdi
    20001038:	ba 1f 00 00 00       	mov    $0x1f,%edx
    2000103d:	4c 89 fe             	mov    %r15,%rsi
    20001040:	e8 2b 10 00 00       	call   20002070 <UVM_Pgtbl_Add>
    20001045:	48 85 c0             	test   %rax,%rax
    20001048:	79 ca                	jns    20001014 <main+0xa84>
    2000104a:	bf 08 25 00 20       	mov    $0x20002508,%edi
    2000104f:	e8 9c 0d 00 00       	call   20001df0 <UVM_Print_String>
    20001054:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20001059:	e8 92 0d 00 00       	call   20001df0 <UVM_Print_String>
    2000105e:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20001063:	e8 88 0d 00 00       	call   20001df0 <UVM_Print_String>
    20001068:	bf 35 01 00 00       	mov    $0x135,%edi
    2000106d:	e8 4e 0b 00 00       	call   20001bc0 <UVM_Print_Int>
    20001072:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001077:	e8 74 0d 00 00       	call   20001df0 <UVM_Print_String>
    2000107c:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20001081:	e8 6a 0d 00 00       	call   20001df0 <UVM_Print_String>
    20001086:	bf 53 27 00 20       	mov    $0x20002753,%edi
    2000108b:	e8 60 0d 00 00       	call   20001df0 <UVM_Print_String>
    20001090:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20001095:	e8 56 0d 00 00       	call   20001df0 <UVM_Print_String>
    2000109a:	bf 44 27 00 20       	mov    $0x20002744,%edi
    2000109f:	e8 4c 0d 00 00       	call   20001df0 <UVM_Print_String>
    200010a4:	eb fe                	jmp    200010a4 <main+0xb14>
            UVM_ASSERT(UVM_Pgtbl_Con(UVM_CAPID(TEST_PROCESS_PGT,RME_TEST_PDP(Count>>9)),Count&0x1FF,
    200010a6:	bf 08 25 00 20       	mov    $0x20002508,%edi
    200010ab:	e8 40 0d 00 00       	call   20001df0 <UVM_Print_String>
    200010b0:	bf 30 27 00 20       	mov    $0x20002730,%edi
    200010b5:	e8 36 0d 00 00       	call   20001df0 <UVM_Print_String>
    200010ba:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    200010bf:	e8 2c 0d 00 00       	call   20001df0 <UVM_Print_String>
    200010c4:	bf 2c 01 00 00       	mov    $0x12c,%edi
    200010c9:	e8 f2 0a 00 00       	call   20001bc0 <UVM_Print_Int>
    200010ce:	bf 44 27 00 20       	mov    $0x20002744,%edi
    200010d3:	e8 18 0d 00 00       	call   20001df0 <UVM_Print_String>
    200010d8:	bf 47 27 00 20       	mov    $0x20002747,%edi
    200010dd:	e8 0e 0d 00 00       	call   20001df0 <UVM_Print_String>
    200010e2:	bf 53 27 00 20       	mov    $0x20002753,%edi
    200010e7:	e8 04 0d 00 00       	call   20001df0 <UVM_Print_String>
    200010ec:	bf 56 27 00 20       	mov    $0x20002756,%edi
    200010f1:	e8 fa 0c 00 00       	call   20001df0 <UVM_Print_String>
    200010f6:	bf 44 27 00 20       	mov    $0x20002744,%edi
    200010fb:	e8 f0 0c 00 00       	call   20001df0 <UVM_Print_String>
    20001100:	eb fe                	jmp    20001100 <main+0xb70>
        for (Count1=0;Count1<4;Count1++)
    20001102:	49 83 c4 01          	add    $0x1,%r12
    20001106:	49 83 fc 15          	cmp    $0x15,%r12
    2000110a:	0f 85 f5 fe ff ff    	jne    20001005 <main+0xa75>
        UVM_LOG_S("\r\nAdd pages success!");
    20001110:	bf b9 27 00 20       	mov    $0x200027b9,%edi
    20001115:	e8 d6 0c 00 00       	call   20001df0 <UVM_Print_String>
        UVM_ASSERT(UVM_Proc_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS,UVM_BOOT_CAPTBL,
    2000111a:	31 c9                	xor    %ecx,%ecx
    2000111c:	31 ff                	xor    %edi,%edi
    2000111e:	4d 89 e9             	mov    %r13,%r9
    20001121:	41 b8 00 80 0e 00    	mov    $0xe8000,%r8d
    20001127:	ba 0f 00 00 00       	mov    $0xf,%edx
    2000112c:	be 00 80 05 00       	mov    $0x58000,%esi
    20001131:	e8 ea 0f 00 00       	call   20002120 <UVM_Proc_Crt>
    20001136:	48 85 c0             	test   %rax,%rax
    20001139:	0f 88 71 08 00 00    	js     200019b0 <main+0x1420>
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD3, TEST_PROCESS, 10, Cur_Addr)>=0);
    2000113f:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
    20001145:	b9 0f 00 00 00       	mov    $0xf,%ecx
    2000114a:	ba 02 00 00 00       	mov    $0x2,%edx
    2000114f:	be 00 80 05 00       	mov    $0x58000,%esi
    20001154:	4c 8d 8d 20 80 00 00 	lea    0x8020(%rbp),%r9
    2000115b:	bf 09 00 00 00       	mov    $0x9,%edi
    20001160:	e8 3b 10 00 00       	call   200021a0 <UVM_Thd_Crt>
    20001165:	48 85 c0             	test   %rax,%rax
    20001168:	0f 88 e6 07 00 00    	js     20001954 <main+0x13c4>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD3),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
    2000116e:	45 31 c0             	xor    %r8d,%r8d
    20001171:	31 c9                	xor    %ecx,%ecx
    20001173:	ba 00 00 00 80       	mov    $0x80000000,%edx
    20001178:	be 00 80 03 00       	mov    $0x38000,%esi
    2000117d:	bf 02 80 09 00       	mov    $0x98002,%edi
    20001182:	e8 b9 10 00 00       	call   20002240 <UVM_Thd_Sched_Bind>
    20001187:	48 85 c0             	test   %rax,%rax
    2000118a:	0f 88 68 07 00 00    	js     200018f8 <main+0x1368>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD3),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
    20001190:	be 00 80 03 00       	mov    $0x38000,%esi
    20001195:	bf 02 80 09 00       	mov    $0x98002,%edi
    2000119a:	48 ba fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rdx
    200011a1:	ff ff 7f 
    Word_Inc=(ptr_t*)Addr;
    200011a4:	41 bc 00 00 e0 00    	mov    $0xe00000,%r12d
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD3),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
    200011aa:	e8 21 11 00 00       	call   200022d0 <UVM_Thd_Time_Xfer>
    200011af:	48 85 c0             	test   %rax,%rax
    200011b2:	0f 88 e4 06 00 00    	js     2000189c <main+0x130c>
        *Word_Inc=0;
    200011b8:	49 c7 04 24 00 00 00 	movq   $0x0,(%r12)
    200011bf:	00 
        Word_Inc++;
    200011c0:	49 83 c4 08          	add    $0x8,%r12
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
    200011c4:	49 81 fc 00 00 f0 00 	cmp    $0xf00000,%r12
    200011cb:	75 eb                	jne    200011b8 <main+0xc28>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD3),(ptr_t)TEST_THD_FUNC3,14*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,0)>=0);
    200011cd:	31 c9                	xor    %ecx,%ecx
    200011cf:	ba 00 00 e0 20       	mov    $0x20e00000,%edx
    200011d4:	be f0 01 00 20       	mov    $0x200001f0,%esi
    200011d9:	bf 02 80 09 00       	mov    $0x98002,%edi
    200011de:	e8 1d 10 00 00       	call   20002200 <UVM_Thd_Exec_Set>
    200011e3:	48 85 c0             	test   %rax,%rax
    200011e6:	0f 88 74 03 00 00    	js     20001560 <main+0xfd0>
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD4, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
    200011ec:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
    200011f2:	b9 02 00 00 00       	mov    $0x2,%ecx
    200011f7:	ba 03 00 00 00       	mov    $0x3,%edx
    200011fc:	be 00 80 05 00       	mov    $0x58000,%esi
    20001201:	4c 8d 8d f0 89 00 00 	lea    0x89f0(%rbp),%r9
    20001208:	bf 09 00 00 00       	mov    $0x9,%edi
    2000120d:	e8 8e 0f 00 00       	call   200021a0 <UVM_Thd_Crt>
    20001212:	48 85 c0             	test   %rax,%rax
    20001215:	0f 88 e9 02 00 00    	js     20001504 <main+0xf74>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD4),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
    2000121b:	45 31 c0             	xor    %r8d,%r8d
    2000121e:	31 c9                	xor    %ecx,%ecx
    20001220:	ba 00 00 00 80       	mov    $0x80000000,%edx
    20001225:	be 00 80 03 00       	mov    $0x38000,%esi
    2000122a:	bf 03 80 09 00       	mov    $0x98003,%edi
    2000122f:	e8 0c 10 00 00       	call   20002240 <UVM_Thd_Sched_Bind>
    20001234:	48 85 c0             	test   %rax,%rax
    20001237:	0f 88 7f 03 00 00    	js     200015bc <main+0x102c>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD4),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
    2000123d:	48 ba fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rdx
    20001244:	ff ff 7f 
    20001247:	be 00 80 03 00       	mov    $0x38000,%esi
    2000124c:	bf 03 80 09 00       	mov    $0x98003,%edi
    20001251:	e8 7a 10 00 00       	call   200022d0 <UVM_Thd_Time_Xfer>
    20001256:	48 85 c0             	test   %rax,%rax
    20001259:	0f 88 49 02 00 00    	js     200014a8 <main+0xf18>
        *Word_Inc=0;
    2000125f:	49 c7 04 24 00 00 00 	movq   $0x0,(%r12)
    20001266:	00 
        Word_Inc++;
    20001267:	49 83 c4 08          	add    $0x8,%r12
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
    2000126b:	49 81 fc 00 00 00 01 	cmp    $0x1000000,%r12
    20001272:	75 eb                	jne    2000125f <main+0xccf>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD4),(ptr_t)TEST_THD_FUNC4,15*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,0)>=0);
    20001274:	31 c9                	xor    %ecx,%ecx
    20001276:	ba 00 00 f0 20       	mov    $0x20f00000,%edx
    2000127b:	be 30 01 00 20       	mov    $0x20000130,%esi
    20001280:	bf 03 80 09 00       	mov    $0x98003,%edi
    20001285:	e8 76 0f 00 00       	call   20002200 <UVM_Thd_Exec_Set>
    2000128a:	48 85 c0             	test   %rax,%rax
    2000128d:	0f 88 3d 04 00 00    	js     200016d0 <main+0x1140>
        UVM_LOG_S("\r\nCross-process swtching thread...");
    20001293:	bf 90 26 00 20       	mov    $0x20002690,%edi
    20001298:	e8 53 0b 00 00       	call   20001df0 <UVM_Print_String>
        UVM_Thd_Swt(UVM_CAPID(TEST_THD_TBL,TEST_THD3),0);
    2000129d:	31 f6                	xor    %esi,%esi
    2000129f:	bf 02 80 09 00       	mov    $0x98002,%edi
    200012a4:	e8 47 10 00 00       	call   200022f0 <UVM_Thd_Swt>
        UVM_LOG_S("\r\nBack to main thread!");
    200012a9:	bf 74 27 00 20       	mov    $0x20002774,%edi
    200012ae:	e8 3d 0b 00 00       	call   20001df0 <UVM_Print_String>
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG2, Cur_Addr)>=0);
    200012b3:	31 ff                	xor    %edi,%edi
    200012b5:	ba 0c 00 00 00       	mov    $0xc,%edx
        Cur_Addr+=UVM_THD_SIZE;
    200012ba:	48 8d 8d c0 93 00 00 	lea    0x93c0(%rbp),%rcx
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG2, Cur_Addr)>=0);
    200012c1:	be 00 80 05 00       	mov    $0x58000,%esi
    200012c6:	e8 45 10 00 00       	call   20002310 <UVM_Sig_Crt>
    200012cb:	48 85 c0             	test   %rax,%rax
    200012ce:	0f 88 a0 03 00 00    	js     20001674 <main+0x10e4>
        *Word_Inc=0;
    200012d4:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
        Word_Inc++;
    200012db:	48 83 c3 08          	add    $0x8,%rbx
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
    200012df:	48 81 fb 00 00 f0 00 	cmp    $0xf00000,%rbx
    200012e6:	75 ec                	jne    200012d4 <main+0xd44>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD3),(ptr_t)TEST_SIG_FUNC2,14*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,0)>=0);
    200012e8:	31 c9                	xor    %ecx,%ecx
    200012ea:	ba 00 00 e0 20       	mov    $0x20e00000,%edx
    200012ef:	be 00 04 00 20       	mov    $0x20000400,%esi
    200012f4:	bf 02 80 09 00       	mov    $0x98002,%edi
    200012f9:	e8 02 0f 00 00       	call   20002200 <UVM_Thd_Exec_Set>
    200012fe:	48 85 c0             	test   %rax,%rax
    20001301:	0f 88 25 04 00 00    	js     2000172c <main+0x119c>
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD3),1)>=0);
    20001307:	be 01 00 00 00       	mov    $0x1,%esi
    2000130c:	bf 02 80 09 00       	mov    $0x98002,%edi
    20001311:	41 bc 10 27 00 00    	mov    $0x2710,%r12d
    20001317:	e8 74 0f 00 00       	call   20002290 <UVM_Thd_Sched_Prio>
    2000131c:	48 85 c0             	test   %rax,%rax
    2000131f:	0f 88 f3 02 00 00    	js     20001618 <main+0x1088>
            UVM_Sig_Snd(TEST_SIG2);
    20001325:	bf 0c 00 00 00       	mov    $0xc,%edi
    2000132a:	e8 21 10 00 00       	call   20002350 <UVM_Sig_Snd>
        for(Count=0;Count<10000;Count++)
    2000132f:	49 83 ec 01          	sub    $0x1,%r12
    20001333:	75 f0                	jne    20001325 <main+0xd95>
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD3),0)>=0);
    20001335:	31 f6                	xor    %esi,%esi
    20001337:	bf 02 80 09 00       	mov    $0x98002,%edi
    2000133c:	e8 4f 0f 00 00       	call   20002290 <UVM_Thd_Sched_Prio>
    20001341:	48 85 c0             	test   %rax,%rax
    20001344:	0f 88 f6 04 00 00    	js     20001840 <main+0x12b0>
        UVM_ASSERT(UVM_Inv_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_INV1, TEST_PROCESS, Cur_Addr)>=0);
    2000134a:	31 ff                	xor    %edi,%edi
    2000134c:	b9 0f 00 00 00       	mov    $0xf,%ecx
    20001351:	ba 0a 00 00 00       	mov    $0xa,%edx
    20001356:	be 00 80 05 00       	mov    $0x58000,%esi
    2000135b:	4c 8d 85 e0 93 00 00 	lea    0x93e0(%rbp),%r8
    20001362:	e8 29 10 00 00       	call   20002390 <UVM_Inv_Crt>
    20001367:	48 85 c0             	test   %rax,%rax
    2000136a:	0f 88 74 04 00 00    	js     200017e4 <main+0x1254>
        *Word_Inc=0;
    20001370:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
        Word_Inc++;
    20001377:	48 83 c3 08          	add    $0x8,%rbx
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
    2000137b:	48 81 fb 00 00 00 01 	cmp    $0x1000000,%rbx
    20001382:	75 ec                	jne    20001370 <main+0xde0>
        UVM_ASSERT(UVM_Inv_Set(TEST_INV1,(ptr_t)TEST_INV1_FUNC,15*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,0)>=0);
    20001384:	31 c9                	xor    %ecx,%ecx
    20001386:	ba 00 00 f0 20       	mov    $0x20f00000,%edx
    2000138b:	be 70 05 00 20       	mov    $0x20000570,%esi
    20001390:	bf 0a 00 00 00       	mov    $0xa,%edi
    20001395:	e8 46 10 00 00       	call   200023e0 <UVM_Inv_Set>
    2000139a:	48 85 c0             	test   %rax,%rax
    2000139d:	0f 88 e5 03 00 00    	js     20001788 <main+0x11f8>
        sum=0;
    200013a3:	48 c7 05 62 1c 00 00 	movq   $0x0,0x1c62(%rip)        # 20003010 <sum>
    200013aa:	00 00 00 00 
        sumout=0;
    200013ae:	bb 10 27 00 00       	mov    $0x2710,%ebx
        sumin=0;
    200013b3:	48 c7 05 4a 1c 00 00 	movq   $0x0,0x1c4a(%rip)        # 20003008 <sumin>
    200013ba:	00 00 00 00 
        sumout=0;
    200013be:	48 c7 05 37 1c 00 00 	movq   $0x0,0x1c37(%rip)        # 20003000 <sumout>
    200013c5:	00 00 00 00 
            start=__UVM_X64_Read_TSC();
    200013c9:	e8 4d ec ff ff       	call   2000001b <__UVM_X64_Read_TSC>
            UVM_Inv_Act(TEST_INV1,0,0);
    200013ce:	31 d2                	xor    %edx,%edx
    200013d0:	31 f6                	xor    %esi,%esi
    200013d2:	bf 0a 00 00 00       	mov    $0xa,%edi
            start=__UVM_X64_Read_TSC();
    200013d7:	48 89 05 4a 1c 00 00 	mov    %rax,0x1c4a(%rip)        # 20003028 <start>
            UVM_Inv_Act(TEST_INV1,0,0);
    200013de:	e8 76 ec ff ff       	call   20000059 <UVM_Inv_Act>
            end=__UVM_X64_Read_TSC();
    200013e3:	e8 33 ec ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    200013e8:	48 89 05 29 1c 00 00 	mov    %rax,0x1c29(%rip)        # 20003018 <end>
            sum+=end-start;
    200013ef:	48 8b 05 22 1c 00 00 	mov    0x1c22(%rip),%rax        # 20003018 <end>
    200013f6:	48 8b 15 2b 1c 00 00 	mov    0x1c2b(%rip),%rdx        # 20003028 <start>
    200013fd:	48 29 d0             	sub    %rdx,%rax
    20001400:	48 01 05 09 1c 00 00 	add    %rax,0x1c09(%rip)        # 20003010 <sum>
            sumin+=middle-start;
    20001407:	48 8b 05 12 1c 00 00 	mov    0x1c12(%rip),%rax        # 20003020 <middle>
    2000140e:	48 8b 15 13 1c 00 00 	mov    0x1c13(%rip),%rdx        # 20003028 <start>
    20001415:	48 29 d0             	sub    %rdx,%rax
    20001418:	48 01 05 e9 1b 00 00 	add    %rax,0x1be9(%rip)        # 20003008 <sumin>
            sumout+=end-middle;
    2000141f:	48 8b 05 f2 1b 00 00 	mov    0x1bf2(%rip),%rax        # 20003018 <end>
    20001426:	48 8b 15 f3 1b 00 00 	mov    0x1bf3(%rip),%rdx        # 20003020 <middle>
    2000142d:	48 29 d0             	sub    %rdx,%rax
    20001430:	48 01 05 c9 1b 00 00 	add    %rax,0x1bc9(%rip)        # 20003000 <sumout>
        for(Count=0;Count<10000;Count++)
    20001437:	48 83 eb 01          	sub    $0x1,%rbx
    2000143b:	75 8c                	jne    200013c9 <main+0xe39>
        UVM_LOG_S("\r\nInvocation total takes clock cycles:");
    2000143d:	bf b8 26 00 20       	mov    $0x200026b8,%edi
        UVM_LOG_I(sum/10000);
    20001442:	bb 10 27 00 00       	mov    $0x2710,%ebx
        UVM_LOG_S("\r\nInvocation total takes clock cycles:");
    20001447:	e8 a4 09 00 00       	call   20001df0 <UVM_Print_String>
        UVM_LOG_I(sum/10000);
    2000144c:	48 8b 05 bd 1b 00 00 	mov    0x1bbd(%rip),%rax        # 20003010 <sum>
    20001453:	31 d2                	xor    %edx,%edx
    20001455:	48 f7 f3             	div    %rbx
    20001458:	48 89 c7             	mov    %rax,%rdi
    2000145b:	e8 60 07 00 00       	call   20001bc0 <UVM_Print_Int>
        UVM_LOG_S("\r\nInvocation entry takes clock cycles:");
    20001460:	bf e0 26 00 20       	mov    $0x200026e0,%edi
    20001465:	e8 86 09 00 00       	call   20001df0 <UVM_Print_String>
        UVM_LOG_I(sumin/10000);
    2000146a:	48 8b 05 97 1b 00 00 	mov    0x1b97(%rip),%rax        # 20003008 <sumin>
    20001471:	31 d2                	xor    %edx,%edx
    20001473:	48 f7 f3             	div    %rbx
    20001476:	48 89 c7             	mov    %rax,%rdi
    20001479:	e8 42 07 00 00       	call   20001bc0 <UVM_Print_Int>
        UVM_LOG_S("\r\nInvocation return takes clock cycles:");
    2000147e:	bf 08 27 00 20       	mov    $0x20002708,%edi
    20001483:	e8 68 09 00 00       	call   20001df0 <UVM_Print_String>
        UVM_LOG_I(sumout/10000);
    20001488:	48 8b 05 71 1b 00 00 	mov    0x1b71(%rip),%rax        # 20003000 <sumout>
    2000148f:	31 d2                	xor    %edx,%edx
    20001491:	48 f7 f3             	div    %rbx
    20001494:	48 89 c7             	mov    %rax,%rdi
    20001497:	e8 24 07 00 00       	call   20001bc0 <UVM_Print_Int>
        UVM_LOG_S("\r\nIdle......");
    2000149c:	bf ce 27 00 20       	mov    $0x200027ce,%edi
    200014a1:	e8 4a 09 00 00       	call   20001df0 <UVM_Print_String>
        while (1);
    200014a6:	eb fe                	jmp    200014a6 <main+0xf16>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD4),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
    200014a8:	bf 08 25 00 20       	mov    $0x20002508,%edi
    200014ad:	e8 3e 09 00 00       	call   20001df0 <UVM_Print_String>
    200014b2:	bf 30 27 00 20       	mov    $0x20002730,%edi
    200014b7:	e8 34 09 00 00       	call   20001df0 <UVM_Print_String>
    200014bc:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    200014c1:	e8 2a 09 00 00       	call   20001df0 <UVM_Print_String>
    200014c6:	bf 48 01 00 00       	mov    $0x148,%edi
    200014cb:	e8 f0 06 00 00       	call   20001bc0 <UVM_Print_Int>
    200014d0:	bf 44 27 00 20       	mov    $0x20002744,%edi
    200014d5:	e8 16 09 00 00       	call   20001df0 <UVM_Print_String>
    200014da:	bf 47 27 00 20       	mov    $0x20002747,%edi
    200014df:	e8 0c 09 00 00       	call   20001df0 <UVM_Print_String>
    200014e4:	bf 53 27 00 20       	mov    $0x20002753,%edi
    200014e9:	e8 02 09 00 00       	call   20001df0 <UVM_Print_String>
    200014ee:	bf 56 27 00 20       	mov    $0x20002756,%edi
    200014f3:	e8 f8 08 00 00       	call   20001df0 <UVM_Print_String>
    200014f8:	bf 44 27 00 20       	mov    $0x20002744,%edi
    200014fd:	e8 ee 08 00 00       	call   20001df0 <UVM_Print_String>
    20001502:	eb fe                	jmp    20001502 <main+0xf72>
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD4, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
    20001504:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20001509:	e8 e2 08 00 00       	call   20001df0 <UVM_Print_String>
    2000150e:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20001513:	e8 d8 08 00 00       	call   20001df0 <UVM_Print_String>
    20001518:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    2000151d:	e8 ce 08 00 00       	call   20001df0 <UVM_Print_String>
    20001522:	bf 46 01 00 00       	mov    $0x146,%edi
    20001527:	e8 94 06 00 00       	call   20001bc0 <UVM_Print_Int>
    2000152c:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001531:	e8 ba 08 00 00       	call   20001df0 <UVM_Print_String>
    20001536:	bf 47 27 00 20       	mov    $0x20002747,%edi
    2000153b:	e8 b0 08 00 00       	call   20001df0 <UVM_Print_String>
    20001540:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20001545:	e8 a6 08 00 00       	call   20001df0 <UVM_Print_String>
    2000154a:	bf 56 27 00 20       	mov    $0x20002756,%edi
    2000154f:	e8 9c 08 00 00       	call   20001df0 <UVM_Print_String>
    20001554:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001559:	e8 92 08 00 00       	call   20001df0 <UVM_Print_String>
    2000155e:	eb fe                	jmp    2000155e <main+0xfce>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD3),(ptr_t)TEST_THD_FUNC3,14*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,0)>=0);
    20001560:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20001565:	e8 86 08 00 00       	call   20001df0 <UVM_Print_String>
    2000156a:	bf 30 27 00 20       	mov    $0x20002730,%edi
    2000156f:	e8 7c 08 00 00       	call   20001df0 <UVM_Print_String>
    20001574:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20001579:	e8 72 08 00 00       	call   20001df0 <UVM_Print_String>
    2000157e:	bf 43 01 00 00       	mov    $0x143,%edi
    20001583:	e8 38 06 00 00       	call   20001bc0 <UVM_Print_Int>
    20001588:	bf 44 27 00 20       	mov    $0x20002744,%edi
    2000158d:	e8 5e 08 00 00       	call   20001df0 <UVM_Print_String>
    20001592:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20001597:	e8 54 08 00 00       	call   20001df0 <UVM_Print_String>
    2000159c:	bf 53 27 00 20       	mov    $0x20002753,%edi
    200015a1:	e8 4a 08 00 00       	call   20001df0 <UVM_Print_String>
    200015a6:	bf 56 27 00 20       	mov    $0x20002756,%edi
    200015ab:	e8 40 08 00 00       	call   20001df0 <UVM_Print_String>
    200015b0:	bf 44 27 00 20       	mov    $0x20002744,%edi
    200015b5:	e8 36 08 00 00       	call   20001df0 <UVM_Print_String>
    200015ba:	eb fe                	jmp    200015ba <main+0x102a>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD4),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
    200015bc:	bf 08 25 00 20       	mov    $0x20002508,%edi
    200015c1:	e8 2a 08 00 00       	call   20001df0 <UVM_Print_String>
    200015c6:	bf 30 27 00 20       	mov    $0x20002730,%edi
    200015cb:	e8 20 08 00 00       	call   20001df0 <UVM_Print_String>
    200015d0:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    200015d5:	e8 16 08 00 00       	call   20001df0 <UVM_Print_String>
    200015da:	bf 47 01 00 00       	mov    $0x147,%edi
    200015df:	e8 dc 05 00 00       	call   20001bc0 <UVM_Print_Int>
    200015e4:	bf 44 27 00 20       	mov    $0x20002744,%edi
    200015e9:	e8 02 08 00 00       	call   20001df0 <UVM_Print_String>
    200015ee:	bf 47 27 00 20       	mov    $0x20002747,%edi
    200015f3:	e8 f8 07 00 00       	call   20001df0 <UVM_Print_String>
    200015f8:	bf 53 27 00 20       	mov    $0x20002753,%edi
    200015fd:	e8 ee 07 00 00       	call   20001df0 <UVM_Print_String>
    20001602:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20001607:	e8 e4 07 00 00       	call   20001df0 <UVM_Print_String>
    2000160c:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001611:	e8 da 07 00 00       	call   20001df0 <UVM_Print_String>
    20001616:	eb fe                	jmp    20001616 <main+0x1086>
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD3),1)>=0);
    20001618:	bf 08 25 00 20       	mov    $0x20002508,%edi
    2000161d:	e8 ce 07 00 00       	call   20001df0 <UVM_Print_String>
    20001622:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20001627:	e8 c4 07 00 00       	call   20001df0 <UVM_Print_String>
    2000162c:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20001631:	e8 ba 07 00 00       	call   20001df0 <UVM_Print_String>
    20001636:	bf 5a 01 00 00       	mov    $0x15a,%edi
    2000163b:	e8 80 05 00 00       	call   20001bc0 <UVM_Print_Int>
    20001640:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001645:	e8 a6 07 00 00       	call   20001df0 <UVM_Print_String>
    2000164a:	bf 47 27 00 20       	mov    $0x20002747,%edi
    2000164f:	e8 9c 07 00 00       	call   20001df0 <UVM_Print_String>
    20001654:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20001659:	e8 92 07 00 00       	call   20001df0 <UVM_Print_String>
    2000165e:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20001663:	e8 88 07 00 00       	call   20001df0 <UVM_Print_String>
    20001668:	bf 44 27 00 20       	mov    $0x20002744,%edi
    2000166d:	e8 7e 07 00 00       	call   20001df0 <UVM_Print_String>
    20001672:	eb fe                	jmp    20001672 <main+0x10e2>
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG2, Cur_Addr)>=0);
    20001674:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20001679:	e8 72 07 00 00       	call   20001df0 <UVM_Print_String>
    2000167e:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20001683:	e8 68 07 00 00       	call   20001df0 <UVM_Print_String>
    20001688:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    2000168d:	e8 5e 07 00 00       	call   20001df0 <UVM_Print_String>
    20001692:	bf 55 01 00 00       	mov    $0x155,%edi
    20001697:	e8 24 05 00 00       	call   20001bc0 <UVM_Print_Int>
    2000169c:	bf 44 27 00 20       	mov    $0x20002744,%edi
    200016a1:	e8 4a 07 00 00       	call   20001df0 <UVM_Print_String>
    200016a6:	bf 47 27 00 20       	mov    $0x20002747,%edi
    200016ab:	e8 40 07 00 00       	call   20001df0 <UVM_Print_String>
    200016b0:	bf 53 27 00 20       	mov    $0x20002753,%edi
    200016b5:	e8 36 07 00 00       	call   20001df0 <UVM_Print_String>
    200016ba:	bf 56 27 00 20       	mov    $0x20002756,%edi
    200016bf:	e8 2c 07 00 00       	call   20001df0 <UVM_Print_String>
    200016c4:	bf 44 27 00 20       	mov    $0x20002744,%edi
    200016c9:	e8 22 07 00 00       	call   20001df0 <UVM_Print_String>
    200016ce:	eb fe                	jmp    200016ce <main+0x113e>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD4),(ptr_t)TEST_THD_FUNC4,15*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,0)>=0);
    200016d0:	bf 08 25 00 20       	mov    $0x20002508,%edi
    200016d5:	e8 16 07 00 00       	call   20001df0 <UVM_Print_String>
    200016da:	bf 30 27 00 20       	mov    $0x20002730,%edi
    200016df:	e8 0c 07 00 00       	call   20001df0 <UVM_Print_String>
    200016e4:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    200016e9:	e8 02 07 00 00       	call   20001df0 <UVM_Print_String>
    200016ee:	bf 4a 01 00 00       	mov    $0x14a,%edi
    200016f3:	e8 c8 04 00 00       	call   20001bc0 <UVM_Print_Int>
    200016f8:	bf 44 27 00 20       	mov    $0x20002744,%edi
    200016fd:	e8 ee 06 00 00       	call   20001df0 <UVM_Print_String>
    20001702:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20001707:	e8 e4 06 00 00       	call   20001df0 <UVM_Print_String>
    2000170c:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20001711:	e8 da 06 00 00       	call   20001df0 <UVM_Print_String>
    20001716:	bf 56 27 00 20       	mov    $0x20002756,%edi
    2000171b:	e8 d0 06 00 00       	call   20001df0 <UVM_Print_String>
    20001720:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001725:	e8 c6 06 00 00       	call   20001df0 <UVM_Print_String>
    2000172a:	eb fe                	jmp    2000172a <main+0x119a>
        UVM_ASSERT(UVM_Thd_Exec_Set(UVM_CAPID(TEST_THD_TBL,TEST_THD3),(ptr_t)TEST_SIG_FUNC2,14*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,0)>=0);
    2000172c:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20001731:	e8 ba 06 00 00       	call   20001df0 <UVM_Print_String>
    20001736:	bf 30 27 00 20       	mov    $0x20002730,%edi
    2000173b:	e8 b0 06 00 00       	call   20001df0 <UVM_Print_String>
    20001740:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20001745:	e8 a6 06 00 00       	call   20001df0 <UVM_Print_String>
    2000174a:	bf 58 01 00 00       	mov    $0x158,%edi
    2000174f:	e8 6c 04 00 00       	call   20001bc0 <UVM_Print_Int>
    20001754:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001759:	e8 92 06 00 00       	call   20001df0 <UVM_Print_String>
    2000175e:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20001763:	e8 88 06 00 00       	call   20001df0 <UVM_Print_String>
    20001768:	bf 53 27 00 20       	mov    $0x20002753,%edi
    2000176d:	e8 7e 06 00 00       	call   20001df0 <UVM_Print_String>
    20001772:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20001777:	e8 74 06 00 00       	call   20001df0 <UVM_Print_String>
    2000177c:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001781:	e8 6a 06 00 00       	call   20001df0 <UVM_Print_String>
    20001786:	eb fe                	jmp    20001786 <main+0x11f6>
        UVM_ASSERT(UVM_Inv_Set(TEST_INV1,(ptr_t)TEST_INV1_FUNC,15*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,0)>=0);
    20001788:	bf 08 25 00 20       	mov    $0x20002508,%edi
    2000178d:	e8 5e 06 00 00       	call   20001df0 <UVM_Print_String>
    20001792:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20001797:	e8 54 06 00 00       	call   20001df0 <UVM_Print_String>
    2000179c:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    200017a1:	e8 4a 06 00 00       	call   20001df0 <UVM_Print_String>
    200017a6:	bf 68 01 00 00       	mov    $0x168,%edi
    200017ab:	e8 10 04 00 00       	call   20001bc0 <UVM_Print_Int>
    200017b0:	bf 44 27 00 20       	mov    $0x20002744,%edi
    200017b5:	e8 36 06 00 00       	call   20001df0 <UVM_Print_String>
    200017ba:	bf 47 27 00 20       	mov    $0x20002747,%edi
    200017bf:	e8 2c 06 00 00       	call   20001df0 <UVM_Print_String>
    200017c4:	bf 53 27 00 20       	mov    $0x20002753,%edi
    200017c9:	e8 22 06 00 00       	call   20001df0 <UVM_Print_String>
    200017ce:	bf 56 27 00 20       	mov    $0x20002756,%edi
    200017d3:	e8 18 06 00 00       	call   20001df0 <UVM_Print_String>
    200017d8:	bf 44 27 00 20       	mov    $0x20002744,%edi
    200017dd:	e8 0e 06 00 00       	call   20001df0 <UVM_Print_String>
    200017e2:	eb fe                	jmp    200017e2 <main+0x1252>
        UVM_ASSERT(UVM_Inv_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_INV1, TEST_PROCESS, Cur_Addr)>=0);
    200017e4:	bf 08 25 00 20       	mov    $0x20002508,%edi
    200017e9:	e8 02 06 00 00       	call   20001df0 <UVM_Print_String>
    200017ee:	bf 30 27 00 20       	mov    $0x20002730,%edi
    200017f3:	e8 f8 05 00 00       	call   20001df0 <UVM_Print_String>
    200017f8:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    200017fd:	e8 ee 05 00 00       	call   20001df0 <UVM_Print_String>
    20001802:	bf 65 01 00 00       	mov    $0x165,%edi
    20001807:	e8 b4 03 00 00       	call   20001bc0 <UVM_Print_Int>
    2000180c:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001811:	e8 da 05 00 00       	call   20001df0 <UVM_Print_String>
    20001816:	bf 47 27 00 20       	mov    $0x20002747,%edi
    2000181b:	e8 d0 05 00 00       	call   20001df0 <UVM_Print_String>
    20001820:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20001825:	e8 c6 05 00 00       	call   20001df0 <UVM_Print_String>
    2000182a:	bf 56 27 00 20       	mov    $0x20002756,%edi
    2000182f:	e8 bc 05 00 00       	call   20001df0 <UVM_Print_String>
    20001834:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001839:	e8 b2 05 00 00       	call   20001df0 <UVM_Print_String>
    2000183e:	eb fe                	jmp    2000183e <main+0x12ae>
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD3),0)>=0);
    20001840:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20001845:	e8 a6 05 00 00       	call   20001df0 <UVM_Print_String>
    2000184a:	bf 30 27 00 20       	mov    $0x20002730,%edi
    2000184f:	e8 9c 05 00 00       	call   20001df0 <UVM_Print_String>
    20001854:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20001859:	e8 92 05 00 00       	call   20001df0 <UVM_Print_String>
    2000185e:	bf 5f 01 00 00       	mov    $0x15f,%edi
    20001863:	e8 58 03 00 00       	call   20001bc0 <UVM_Print_Int>
    20001868:	bf 44 27 00 20       	mov    $0x20002744,%edi
    2000186d:	e8 7e 05 00 00       	call   20001df0 <UVM_Print_String>
    20001872:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20001877:	e8 74 05 00 00       	call   20001df0 <UVM_Print_String>
    2000187c:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20001881:	e8 6a 05 00 00       	call   20001df0 <UVM_Print_String>
    20001886:	bf 56 27 00 20       	mov    $0x20002756,%edi
    2000188b:	e8 60 05 00 00       	call   20001df0 <UVM_Print_String>
    20001890:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001895:	e8 56 05 00 00       	call   20001df0 <UVM_Print_String>
    2000189a:	eb fe                	jmp    2000189a <main+0x130a>
        UVM_ASSERT(UVM_Thd_Time_Xfer(UVM_CAPID(TEST_THD_TBL,TEST_THD3),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
    2000189c:	bf 08 25 00 20       	mov    $0x20002508,%edi
    200018a1:	e8 4a 05 00 00       	call   20001df0 <UVM_Print_String>
    200018a6:	bf 30 27 00 20       	mov    $0x20002730,%edi
    200018ab:	e8 40 05 00 00       	call   20001df0 <UVM_Print_String>
    200018b0:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    200018b5:	e8 36 05 00 00       	call   20001df0 <UVM_Print_String>
    200018ba:	bf 41 01 00 00       	mov    $0x141,%edi
    200018bf:	e8 fc 02 00 00       	call   20001bc0 <UVM_Print_Int>
    200018c4:	bf 44 27 00 20       	mov    $0x20002744,%edi
    200018c9:	e8 22 05 00 00       	call   20001df0 <UVM_Print_String>
    200018ce:	bf 47 27 00 20       	mov    $0x20002747,%edi
    200018d3:	e8 18 05 00 00       	call   20001df0 <UVM_Print_String>
    200018d8:	bf 53 27 00 20       	mov    $0x20002753,%edi
    200018dd:	e8 0e 05 00 00       	call   20001df0 <UVM_Print_String>
    200018e2:	bf 56 27 00 20       	mov    $0x20002756,%edi
    200018e7:	e8 04 05 00 00       	call   20001df0 <UVM_Print_String>
    200018ec:	bf 44 27 00 20       	mov    $0x20002744,%edi
    200018f1:	e8 fa 04 00 00       	call   20001df0 <UVM_Print_String>
    200018f6:	eb fe                	jmp    200018f6 <main+0x1366>
        UVM_ASSERT(UVM_Thd_Sched_Bind(UVM_CAPID(TEST_THD_TBL,TEST_THD3),UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
    200018f8:	bf 08 25 00 20       	mov    $0x20002508,%edi
    200018fd:	e8 ee 04 00 00       	call   20001df0 <UVM_Print_String>
    20001902:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20001907:	e8 e4 04 00 00       	call   20001df0 <UVM_Print_String>
    2000190c:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20001911:	e8 da 04 00 00       	call   20001df0 <UVM_Print_String>
    20001916:	bf 40 01 00 00       	mov    $0x140,%edi
    2000191b:	e8 a0 02 00 00       	call   20001bc0 <UVM_Print_Int>
    20001920:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001925:	e8 c6 04 00 00       	call   20001df0 <UVM_Print_String>
    2000192a:	bf 47 27 00 20       	mov    $0x20002747,%edi
    2000192f:	e8 bc 04 00 00       	call   20001df0 <UVM_Print_String>
    20001934:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20001939:	e8 b2 04 00 00       	call   20001df0 <UVM_Print_String>
    2000193e:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20001943:	e8 a8 04 00 00       	call   20001df0 <UVM_Print_String>
    20001948:	bf 44 27 00 20       	mov    $0x20002744,%edi
    2000194d:	e8 9e 04 00 00       	call   20001df0 <UVM_Print_String>
    20001952:	eb fe                	jmp    20001952 <main+0x13c2>
        UVM_ASSERT(UVM_Thd_Crt(TEST_THD_TBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_THD3, TEST_PROCESS, 10, Cur_Addr)>=0);
    20001954:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20001959:	e8 92 04 00 00       	call   20001df0 <UVM_Print_String>
    2000195e:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20001963:	e8 88 04 00 00       	call   20001df0 <UVM_Print_String>
    20001968:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    2000196d:	e8 7e 04 00 00       	call   20001df0 <UVM_Print_String>
    20001972:	bf 3f 01 00 00       	mov    $0x13f,%edi
    20001977:	e8 44 02 00 00       	call   20001bc0 <UVM_Print_Int>
    2000197c:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001981:	e8 6a 04 00 00       	call   20001df0 <UVM_Print_String>
    20001986:	bf 47 27 00 20       	mov    $0x20002747,%edi
    2000198b:	e8 60 04 00 00       	call   20001df0 <UVM_Print_String>
    20001990:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20001995:	e8 56 04 00 00       	call   20001df0 <UVM_Print_String>
    2000199a:	bf 56 27 00 20       	mov    $0x20002756,%edi
    2000199f:	e8 4c 04 00 00       	call   20001df0 <UVM_Print_String>
    200019a4:	bf 44 27 00 20       	mov    $0x20002744,%edi
    200019a9:	e8 42 04 00 00       	call   20001df0 <UVM_Print_String>
    200019ae:	eb fe                	jmp    200019ae <main+0x141e>
        UVM_ASSERT(UVM_Proc_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS,UVM_BOOT_CAPTBL,
    200019b0:	bf 08 25 00 20       	mov    $0x20002508,%edi
    200019b5:	e8 36 04 00 00       	call   20001df0 <UVM_Print_String>
    200019ba:	bf 30 27 00 20       	mov    $0x20002730,%edi
    200019bf:	e8 2c 04 00 00       	call   20001df0 <UVM_Print_String>
    200019c4:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    200019c9:	e8 22 04 00 00       	call   20001df0 <UVM_Print_String>
    200019ce:	bf 3c 01 00 00       	mov    $0x13c,%edi
    200019d3:	e8 e8 01 00 00       	call   20001bc0 <UVM_Print_Int>
    200019d8:	bf 44 27 00 20       	mov    $0x20002744,%edi
    200019dd:	e8 0e 04 00 00       	call   20001df0 <UVM_Print_String>
    200019e2:	bf 47 27 00 20       	mov    $0x20002747,%edi
    200019e7:	e8 04 04 00 00       	call   20001df0 <UVM_Print_String>
    200019ec:	bf 53 27 00 20       	mov    $0x20002753,%edi
    200019f1:	e8 fa 03 00 00       	call   20001df0 <UVM_Print_String>
    200019f6:	bf 56 27 00 20       	mov    $0x20002756,%edi
    200019fb:	e8 f0 03 00 00       	call   20001df0 <UVM_Print_String>
    20001a00:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001a05:	e8 e6 03 00 00       	call   20001df0 <UVM_Print_String>
    20001a0a:	eb fe                	jmp    20001a0a <main+0x147a>
        UVM_ASSERT(UVM_Pgtbl_Crt(TEST_PROCESS_PGT,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS_PML4,Cur_Addr,0,1U,RME_PGT_SIZE_512G,RME_PGT_NUM_512)>=0);
    20001a0c:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20001a11:	e8 da 03 00 00       	call   20001df0 <UVM_Print_String>
    20001a16:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20001a1b:	e8 d0 03 00 00       	call   20001df0 <UVM_Print_String>
    20001a20:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20001a25:	e8 c6 03 00 00       	call   20001df0 <UVM_Print_String>
    20001a2a:	bf 1a 01 00 00       	mov    $0x11a,%edi
    20001a2f:	e8 8c 01 00 00       	call   20001bc0 <UVM_Print_Int>
    20001a34:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001a39:	e8 b2 03 00 00       	call   20001df0 <UVM_Print_String>
    20001a3e:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20001a43:	e8 a8 03 00 00       	call   20001df0 <UVM_Print_String>
    20001a48:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20001a4d:	e8 9e 03 00 00       	call   20001df0 <UVM_Print_String>
    20001a52:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20001a57:	e8 94 03 00 00       	call   20001df0 <UVM_Print_String>
    20001a5c:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001a61:	e8 8a 03 00 00       	call   20001df0 <UVM_Print_String>
    20001a66:	eb fe                	jmp    20001a66 <main+0x14d6>
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS_PGT,Cur_Addr,1+16+8192)>=0);
    20001a68:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20001a6d:	e8 7e 03 00 00       	call   20001df0 <UVM_Print_String>
    20001a72:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20001a77:	e8 74 03 00 00       	call   20001df0 <UVM_Print_String>
    20001a7c:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20001a81:	e8 6a 03 00 00       	call   20001df0 <UVM_Print_String>
    20001a86:	bf 16 01 00 00       	mov    $0x116,%edi
    20001a8b:	e8 30 01 00 00       	call   20001bc0 <UVM_Print_Int>
    20001a90:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001a95:	e8 56 03 00 00       	call   20001df0 <UVM_Print_String>
    20001a9a:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20001a9f:	e8 4c 03 00 00       	call   20001df0 <UVM_Print_String>
    20001aa4:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20001aa9:	e8 42 03 00 00       	call   20001df0 <UVM_Print_String>
    20001aae:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20001ab3:	e8 38 03 00 00       	call   20001df0 <UVM_Print_String>
    20001ab8:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001abd:	e8 2e 03 00 00       	call   20001df0 <UVM_Print_String>
    20001ac2:	eb fe                	jmp    20001ac2 <main+0x1532>
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROC_CAPTBL,Cur_Addr,16)>=0);
    20001ac4:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20001ac9:	e8 22 03 00 00       	call   20001df0 <UVM_Print_String>
    20001ace:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20001ad3:	e8 18 03 00 00       	call   20001df0 <UVM_Print_String>
    20001ad8:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20001add:	e8 0e 03 00 00       	call   20001df0 <UVM_Print_String>
    20001ae2:	bf 13 01 00 00       	mov    $0x113,%edi
    20001ae7:	e8 d4 00 00 00       	call   20001bc0 <UVM_Print_Int>
    20001aec:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001af1:	e8 fa 02 00 00       	call   20001df0 <UVM_Print_String>
    20001af6:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20001afb:	e8 f0 02 00 00       	call   20001df0 <UVM_Print_String>
    20001b00:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20001b05:	e8 e6 02 00 00       	call   20001df0 <UVM_Print_String>
    20001b0a:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20001b0f:	e8 dc 02 00 00       	call   20001df0 <UVM_Print_String>
    20001b14:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001b19:	e8 d2 02 00 00       	call   20001df0 <UVM_Print_String>
    20001b1e:	eb fe                	jmp    20001b1e <main+0x158e>
        UVM_ASSERT(UVM_Thd_Sched_Prio(UVM_CAPID(TEST_THD_TBL,TEST_THD1),0)>=0);
    20001b20:	bf 08 25 00 20       	mov    $0x20002508,%edi
    20001b25:	e8 c6 02 00 00       	call   20001df0 <UVM_Print_String>
    20001b2a:	bf 30 27 00 20       	mov    $0x20002730,%edi
    20001b2f:	e8 bc 02 00 00       	call   20001df0 <UVM_Print_String>
    20001b34:	bf 3c 27 00 20       	mov    $0x2000273c,%edi
    20001b39:	e8 b2 02 00 00       	call   20001df0 <UVM_Print_String>
    20001b3e:	bf 0d 01 00 00       	mov    $0x10d,%edi
    20001b43:	e8 78 00 00 00       	call   20001bc0 <UVM_Print_Int>
    20001b48:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001b4d:	e8 9e 02 00 00       	call   20001df0 <UVM_Print_String>
    20001b52:	bf 47 27 00 20       	mov    $0x20002747,%edi
    20001b57:	e8 94 02 00 00       	call   20001df0 <UVM_Print_String>
    20001b5c:	bf 53 27 00 20       	mov    $0x20002753,%edi
    20001b61:	e8 8a 02 00 00       	call   20001df0 <UVM_Print_String>
    20001b66:	bf 56 27 00 20       	mov    $0x20002756,%edi
    20001b6b:	e8 80 02 00 00       	call   20001df0 <UVM_Print_String>
    20001b70:	bf 44 27 00 20       	mov    $0x20002744,%edi
    20001b75:	e8 76 02 00 00       	call   20001df0 <UVM_Print_String>
    20001b7a:	eb fe                	jmp    20001b7a <main+0x15ea>
    20001b7c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000020001b80 <UVM_List_Crt>:
Input       : volatile struct UVM_List* Head - The pointer to the list head.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Crt(volatile struct UVM_List* Head)
{
    20001b80:	f3 0f 1e fa          	endbr64 
    Head->Prev=(struct UVM_List*)Head;
    20001b84:	48 89 3f             	mov    %rdi,(%rdi)
    Head->Next=(struct UVM_List*)Head;
    20001b87:	48 89 7f 08          	mov    %rdi,0x8(%rdi)
}
    20001b8b:	c3                   	ret    
    20001b8c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000020001b90 <UVM_List_Del>:
              volatile struct UVM_List* Next - The next node of the target node.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Del(volatile struct UVM_List* Prev,volatile struct UVM_List* Next)
{
    20001b90:	f3 0f 1e fa          	endbr64 
    Next->Prev=(struct UVM_List*)Prev;
    20001b94:	48 89 3e             	mov    %rdi,(%rsi)
    Prev->Next=(struct UVM_List*)Next;
    20001b97:	48 89 77 08          	mov    %rsi,0x8(%rdi)
}
    20001b9b:	c3                   	ret    
    20001b9c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000020001ba0 <UVM_List_Ins>:
Return      : None.
******************************************************************************/
void UVM_List_Ins(volatile struct UVM_List* New,
                  volatile struct UVM_List* Prev,
                  volatile struct UVM_List* Next)
{
    20001ba0:	f3 0f 1e fa          	endbr64 
    Next->Prev=(struct UVM_List*)New;
    20001ba4:	48 89 3a             	mov    %rdi,(%rdx)
    New->Next=(struct UVM_List*)Next;
    20001ba7:	48 89 57 08          	mov    %rdx,0x8(%rdi)
    New->Prev=(struct UVM_List*)Prev;
    20001bab:	48 89 37             	mov    %rsi,(%rdi)
    Prev->Next=(struct UVM_List*)New;
    20001bae:	48 89 7e 08          	mov    %rdi,0x8(%rsi)
}
    20001bb2:	c3                   	ret    
    20001bb3:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    20001bba:	00 00 00 00 
    20001bbe:	66 90                	xchg   %ax,%ax

0000000020001bc0 <UVM_Print_Int>:
Input       : cnt_t Int - The integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Int(cnt_t Int)
{
    20001bc0:	f3 0f 1e fa          	endbr64 
    20001bc4:	41 57                	push   %r15
    20001bc6:	41 56                	push   %r14
    20001bc8:	41 55                	push   %r13
    20001bca:	41 54                	push   %r12
    20001bcc:	55                   	push   %rbp
    20001bcd:	53                   	push   %rbx
    20001bce:	48 83 ec 08          	sub    $0x8,%rsp
    cnt_t Count;
    cnt_t Num;
    ptr_t Div;

    /* how many digits are there? */
    if(Int==0)
    20001bd2:	48 85 ff             	test   %rdi,%rdi
    20001bd5:	0f 84 4d 01 00 00    	je     20001d28 <UVM_Print_Int+0x168>
    {
        UVM_Putchar('0');
        return 1;
    }
    else if(Int<0)
    20001bdb:	0f 88 a7 00 00 00    	js     20001c88 <UVM_Print_Int+0xc8>
    else
    {
        /* How many digits are there? */
        Count=0;
        Div=1;
        Iter=Int;
    20001be1:	48 89 fa             	mov    %rdi,%rdx
        Div=1;
    20001be4:	bb 01 00 00 00       	mov    $0x1,%ebx
        Count=0;
    20001be9:	45 31 e4             	xor    %r12d,%r12d
        while(Iter!=0)
        {
            Iter/=10;
    20001bec:	48 be cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rsi
    20001bf3:	cc cc cc 
    20001bf6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    20001bfd:	00 00 00 
    20001c00:	48 89 d0             	mov    %rdx,%rax
    20001c03:	48 89 d1             	mov    %rdx,%rcx
            Count++;
            Div*=10;
    20001c06:	48 8d 1c 9b          	lea    (%rbx,%rbx,4),%rbx
            Count++;
    20001c0a:	49 83 c4 01          	add    $0x1,%r12
            Iter/=10;
    20001c0e:	48 f7 e6             	mul    %rsi
            Div*=10;
    20001c11:	48 01 db             	add    %rbx,%rbx
            Iter/=10;
    20001c14:	48 c1 ea 03          	shr    $0x3,%rdx
        while(Iter!=0)
    20001c18:	48 83 f9 09          	cmp    $0x9,%rcx
    20001c1c:	77 e2                	ja     20001c00 <UVM_Print_Int+0x40>
        while(Count>0)
        {
            Count--;
            UVM_Putchar(Iter/Div+'0');
            Iter=Iter%Div;
            Div/=10;
    20001c1e:	48 bd cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rbp
    20001c25:	cc cc cc 
        Div/=10;
    20001c28:	48 89 d8             	mov    %rbx,%rax
            Count++;
    20001c2b:	4d 89 e6             	mov    %r12,%r14
        Div/=10;
    20001c2e:	48 f7 e6             	mul    %rsi
    20001c31:	48 89 d3             	mov    %rdx,%rbx
    20001c34:	48 c1 eb 03          	shr    $0x3,%rbx
        while(Count>0)
    20001c38:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    20001c3f:	00 
            Count--;
    20001c40:	48 89 f8             	mov    %rdi,%rax
    20001c43:	31 d2                	xor    %edx,%edx
    20001c45:	49 83 ee 01          	sub    $0x1,%r14
            UVM_Putchar(Iter/Div+'0');
    20001c49:	48 f7 f3             	div    %rbx
    20001c4c:	48 89 c7             	mov    %rax,%rdi
    20001c4f:	49 89 d5             	mov    %rdx,%r13
    20001c52:	83 c7 30             	add    $0x30,%edi
    20001c55:	40 0f be ff          	movsbl %dil,%edi
    20001c59:	e8 b2 07 00 00       	call   20002410 <UVM_Putchar>
            Div/=10;
    20001c5e:	48 89 d8             	mov    %rbx,%rax
            Iter=Iter%Div;
    20001c61:	4c 89 ef             	mov    %r13,%rdi
            Div/=10;
    20001c64:	48 f7 e5             	mul    %rbp
    20001c67:	48 89 d3             	mov    %rdx,%rbx
    20001c6a:	48 c1 eb 03          	shr    $0x3,%rbx
        while(Count>0)
    20001c6e:	4d 85 f6             	test   %r14,%r14
    20001c71:	75 cd                	jne    20001c40 <UVM_Print_Int+0x80>
        }
    }
    
    return Num;
}
    20001c73:	48 83 c4 08          	add    $0x8,%rsp
    20001c77:	4c 89 e0             	mov    %r12,%rax
    20001c7a:	5b                   	pop    %rbx
    20001c7b:	5d                   	pop    %rbp
    20001c7c:	41 5c                	pop    %r12
    20001c7e:	41 5d                	pop    %r13
    20001c80:	41 5e                	pop    %r14
    20001c82:	41 5f                	pop    %r15
    20001c84:	c3                   	ret    
    20001c85:	0f 1f 00             	nopl   (%rax)
        Iter=-Int;
    20001c88:	48 f7 df             	neg    %rdi
        Div=1;
    20001c8b:	bb 01 00 00 00       	mov    $0x1,%ebx
        Count=0;
    20001c90:	45 31 ff             	xor    %r15d,%r15d
            Iter/=10;
    20001c93:	48 be cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rsi
    20001c9a:	cc cc cc 
        Iter=-Int;
    20001c9d:	49 89 fe             	mov    %rdi,%r14
    20001ca0:	48 89 fa             	mov    %rdi,%rdx
    20001ca3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
            Iter/=10;
    20001ca8:	48 89 d0             	mov    %rdx,%rax
    20001cab:	48 89 d1             	mov    %rdx,%rcx
            Div*=10;
    20001cae:	48 8d 1c 9b          	lea    (%rbx,%rbx,4),%rbx
    20001cb2:	4d 89 fc             	mov    %r15,%r12
            Iter/=10;
    20001cb5:	48 f7 e6             	mul    %rsi
            Count++;
    20001cb8:	49 83 c7 01          	add    $0x1,%r15
            Div*=10;
    20001cbc:	48 01 db             	add    %rbx,%rbx
            Iter/=10;
    20001cbf:	48 c1 ea 03          	shr    $0x3,%rdx
        while(Iter!=0)
    20001cc3:	48 83 f9 09          	cmp    $0x9,%rcx
    20001cc7:	77 df                	ja     20001ca8 <UVM_Print_Int+0xe8>
        Div/=10;
    20001cc9:	48 89 d8             	mov    %rbx,%rax
        UVM_Putchar('-');
    20001ccc:	bf 2d 00 00 00       	mov    $0x2d,%edi
        Num=Count+1;
    20001cd1:	49 83 c4 02          	add    $0x2,%r12
            Div/=10;
    20001cd5:	49 bd cd cc cc cc cc 	movabs $0xcccccccccccccccd,%r13
    20001cdc:	cc cc cc 
        Div/=10;
    20001cdf:	48 f7 e6             	mul    %rsi
    20001ce2:	48 89 d3             	mov    %rdx,%rbx
        UVM_Putchar('-');
    20001ce5:	e8 26 07 00 00       	call   20002410 <UVM_Putchar>
        Div/=10;
    20001cea:	48 c1 eb 03          	shr    $0x3,%rbx
        while(Count>0)
    20001cee:	66 90                	xchg   %ax,%ax
            Count--;
    20001cf0:	4c 89 f0             	mov    %r14,%rax
    20001cf3:	31 d2                	xor    %edx,%edx
    20001cf5:	49 83 ef 01          	sub    $0x1,%r15
            UVM_Putchar(Iter/Div+'0');
    20001cf9:	48 f7 f3             	div    %rbx
    20001cfc:	83 c0 30             	add    $0x30,%eax
    20001cff:	49 89 d6             	mov    %rdx,%r14
    20001d02:	0f be f8             	movsbl %al,%edi
    20001d05:	e8 06 07 00 00       	call   20002410 <UVM_Putchar>
            Div/=10;
    20001d0a:	48 89 d8             	mov    %rbx,%rax
    20001d0d:	49 f7 e5             	mul    %r13
    20001d10:	48 89 d3             	mov    %rdx,%rbx
    20001d13:	48 c1 eb 03          	shr    $0x3,%rbx
        while(Count>0)
    20001d17:	4d 85 ff             	test   %r15,%r15
    20001d1a:	75 d4                	jne    20001cf0 <UVM_Print_Int+0x130>
    20001d1c:	e9 52 ff ff ff       	jmp    20001c73 <UVM_Print_Int+0xb3>
    20001d21:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
        UVM_Putchar('0');
    20001d28:	bf 30 00 00 00       	mov    $0x30,%edi
        return 1;
    20001d2d:	41 bc 01 00 00 00    	mov    $0x1,%r12d
        UVM_Putchar('0');
    20001d33:	e8 d8 06 00 00       	call   20002410 <UVM_Putchar>
        return 1;
    20001d38:	e9 36 ff ff ff       	jmp    20001c73 <UVM_Print_Int+0xb3>
    20001d3d:	0f 1f 00             	nopl   (%rax)

0000000020001d40 <UVM_Print_Uint>:
Input       : ptr_t Uint - The unsigned integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Uint(ptr_t Uint)
{
    20001d40:	f3 0f 1e fa          	endbr64 
    20001d44:	41 54                	push   %r12
    20001d46:	55                   	push   %rbp
    20001d47:	53                   	push   %rbx
    ptr_t Iter;
    cnt_t Count;
    cnt_t Num;
    
    /* how many digits are there? */
    if(Uint==0)
    20001d48:	48 85 ff             	test   %rdi,%rdi
    20001d4b:	0f 84 87 00 00 00    	je     20001dd8 <UVM_Print_Uint+0x98>
    else
    {
        /* Filter out all the zeroes */
        Count=0;
        Iter=Uint;
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    20001d51:	48 89 f9             	mov    %rdi,%rcx
        Count=0;
    20001d54:	31 d2                	xor    %edx,%edx
    20001d56:	48 89 fd             	mov    %rdi,%rbp
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    20001d59:	48 89 f8             	mov    %rdi,%rax
    20001d5c:	48 c1 e9 3c          	shr    $0x3c,%rcx
        {
            Iter<<=4;
            Count++;
        }
        /* Count is the number of pts to print */
        Count=sizeof(ptr_t)*2-Count;
    20001d60:	41 bc 10 00 00 00    	mov    $0x10,%r12d
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    20001d66:	75 27                	jne    20001d8f <UVM_Print_Uint+0x4f>
    20001d68:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    20001d6f:	00 
            Iter<<=4;
    20001d70:	48 c1 e0 04          	shl    $0x4,%rax
            Count++;
    20001d74:	48 83 c2 01          	add    $0x1,%rdx
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    20001d78:	48 89 c6             	mov    %rax,%rsi
    20001d7b:	48 c1 ee 3c          	shr    $0x3c,%rsi
    20001d7f:	74 ef                	je     20001d70 <UVM_Print_Uint+0x30>
        Count=sizeof(ptr_t)*2-Count;
    20001d81:	41 bc 10 00 00 00    	mov    $0x10,%r12d
    20001d87:	49 29 d4             	sub    %rdx,%r12
        Num=Count;
        while(Count>0)
    20001d8a:	4d 85 e4             	test   %r12,%r12
    20001d8d:	7e 3d                	jle    20001dcc <UVM_Print_Uint+0x8c>
        Count=sizeof(ptr_t)*2-Count;
    20001d8f:	4c 89 e3             	mov    %r12,%rbx
    20001d92:	eb 11                	jmp    20001da5 <UVM_Print_Uint+0x65>
    20001d94:	0f 1f 40 00          	nopl   0x0(%rax)
        {
            Count--;
            Iter=(Uint>>(Count*4))&0x0F;
            if(Iter<10)
                UVM_Putchar('0'+Iter);
    20001d98:	8d 78 30             	lea    0x30(%rax),%edi
    20001d9b:	e8 70 06 00 00       	call   20002410 <UVM_Putchar>
        while(Count>0)
    20001da0:	48 85 db             	test   %rbx,%rbx
    20001da3:	74 27                	je     20001dcc <UVM_Print_Uint+0x8c>
            Count--;
    20001da5:	48 83 eb 01          	sub    $0x1,%rbx
            Iter=(Uint>>(Count*4))&0x0F;
    20001da9:	48 89 e8             	mov    %rbp,%rax
    20001dac:	8d 0c 9d 00 00 00 00 	lea    0x0(,%rbx,4),%ecx
    20001db3:	48 d3 e8             	shr    %cl,%rax
    20001db6:	83 e0 0f             	and    $0xf,%eax
            if(Iter<10)
    20001db9:	48 83 f8 09          	cmp    $0x9,%rax
    20001dbd:	76 d9                	jbe    20001d98 <UVM_Print_Uint+0x58>
            else
                UVM_Putchar('A'+Iter-10);
    20001dbf:	8d 78 37             	lea    0x37(%rax),%edi
    20001dc2:	e8 49 06 00 00       	call   20002410 <UVM_Putchar>
        while(Count>0)
    20001dc7:	48 85 db             	test   %rbx,%rbx
    20001dca:	75 d9                	jne    20001da5 <UVM_Print_Uint+0x65>
        }
    }
    
    return Num;
}
    20001dcc:	4c 89 e0             	mov    %r12,%rax
    20001dcf:	5b                   	pop    %rbx
    20001dd0:	5d                   	pop    %rbp
    20001dd1:	41 5c                	pop    %r12
    20001dd3:	c3                   	ret    
    20001dd4:	0f 1f 40 00          	nopl   0x0(%rax)
        return 1;
    20001dd8:	41 bc 01 00 00 00    	mov    $0x1,%r12d
        UVM_Putchar('0');
    20001dde:	bf 30 00 00 00       	mov    $0x30,%edi
    20001de3:	e8 28 06 00 00       	call   20002410 <UVM_Putchar>
}
    20001de8:	4c 89 e0             	mov    %r12,%rax
    20001deb:	5b                   	pop    %rbx
    20001dec:	5d                   	pop    %rbp
    20001ded:	41 5c                	pop    %r12
    20001def:	c3                   	ret    

0000000020001df0 <UVM_Print_String>:
Input       : s8* String - The string to print.
Output      : None.
Return      : cnt_t - The length of the string printed, the '\0' is not included.
******************************************************************************/
cnt_t UVM_Print_String(s8* String)
{
    20001df0:	f3 0f 1e fa          	endbr64 
    20001df4:	41 54                	push   %r12
    cnt_t Count;
    
    Count=0;
    20001df6:	45 31 e4             	xor    %r12d,%r12d
{
    20001df9:	53                   	push   %rbx
    20001dfa:	48 89 fb             	mov    %rdi,%rbx
    20001dfd:	48 83 ec 08          	sub    $0x8,%rsp
    20001e01:	eb 17                	jmp    20001e1a <UVM_Print_String+0x2a>
    20001e03:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    while(Count<UVM_USER_DEBUG_MAX_STR)
    {
        if(String[Count]=='\0')
            break;
        
        UVM_Putchar(String[Count++]);
    20001e08:	49 83 c4 01          	add    $0x1,%r12
    20001e0c:	e8 ff 05 00 00       	call   20002410 <UVM_Putchar>
    while(Count<UVM_USER_DEBUG_MAX_STR)
    20001e11:	49 81 fc 80 00 00 00 	cmp    $0x80,%r12
    20001e18:	74 0a                	je     20001e24 <UVM_Print_String+0x34>
        if(String[Count]=='\0')
    20001e1a:	42 0f be 3c 23       	movsbl (%rbx,%r12,1),%edi
    20001e1f:	40 84 ff             	test   %dil,%dil
    20001e22:	75 e4                	jne    20001e08 <UVM_Print_String+0x18>
    }

    return Count;
}
    20001e24:	48 83 c4 08          	add    $0x8,%rsp
    20001e28:	4c 89 e0             	mov    %r12,%rax
    20001e2b:	5b                   	pop    %rbx
    20001e2c:	41 5c                	pop    %r12
    20001e2e:	c3                   	ret    
    20001e2f:	90                   	nop

0000000020001e30 <UVM_Captbl_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, 
                     cid_t Cap_Captbl, ptr_t Vaddr, ptr_t Entry_Num)
{
    20001e30:	f3 0f 1e fa          	endbr64 
    20001e34:	49 89 d1             	mov    %rdx,%r9
    return UVM_CAP_OP(RME_SVC_CPT_CRT, Cap_Captbl_Crt,
    20001e37:	48 c1 e6 20          	shl    $0x20,%rsi
{
    20001e3b:	48 89 ca             	mov    %rcx,%rdx
    return UVM_CAP_OP(RME_SVC_CPT_CRT, Cap_Captbl_Crt,
    20001e3e:	48 b8 00 00 00 00 0a 	movabs $0xa00000000,%rax
    20001e45:	00 00 00 
    20001e48:	45 89 c9             	mov    %r9d,%r9d
{
    20001e4b:	4c 89 c1             	mov    %r8,%rcx
    return UVM_CAP_OP(RME_SVC_CPT_CRT, Cap_Captbl_Crt,
    20001e4e:	48 09 c7             	or     %rax,%rdi
    20001e51:	4c 09 ce             	or     %r9,%rsi
    20001e54:	e9 94 e2 ff ff       	jmp    200000ed <UVM_Svc>
    20001e59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000020001e60 <UVM_Captbl_Del>:
              cid_t Cap_Del - The capability to the capability table to be deleted. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Del(cid_t Cap_Captbl_Del, cid_t Cap_Del)
{
    20001e60:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_CPT_DEL, Cap_Captbl_Del,
    20001e64:	48 b8 00 00 00 00 0b 	movabs $0xb00000000,%rax
    20001e6b:	00 00 00 
    20001e6e:	31 c9                	xor    %ecx,%ecx
    20001e70:	31 d2                	xor    %edx,%edx
    20001e72:	48 09 c7             	or     %rax,%rdi
    20001e75:	e9 73 e2 ff ff       	jmp    200000ed <UVM_Svc>
    20001e7a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000020001e80 <UVM_Captbl_Frz>:
              cid_t Cap_Frz - The cap to the kernel object being freezed. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Frz(cid_t Cap_Captbl_Frz, cid_t Cap_Frz)
{
    20001e80:	f3 0f 1e fa          	endbr64 
        return UVM_CAP_OP(RME_SVC_CPT_FRZ, Cap_Captbl_Frz,
    20001e84:	48 b8 00 00 00 00 0c 	movabs $0xc00000000,%rax
    20001e8b:	00 00 00 
    20001e8e:	31 c9                	xor    %ecx,%ecx
    20001e90:	31 d2                	xor    %edx,%edx
    20001e92:	48 09 c7             	or     %rax,%rdi
    20001e95:	e9 53 e2 ff ff       	jmp    200000ed <UVM_Svc>
    20001e9a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000020001ea0 <UVM_Captbl_Add>:
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Add(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                     cid_t Cap_Captbl_Src, cid_t Cap_Src, ptr_t Flags)
{
    20001ea0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    20001ea4:	48 c1 e7 20          	shl    $0x20,%rdi
{
    20001ea8:	49 89 c9             	mov    %rcx,%r9
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    20001eab:	48 c1 e2 20          	shl    $0x20,%rdx
    20001eaf:	89 f6                	mov    %esi,%esi
    20001eb1:	45 89 c9             	mov    %r9d,%r9d
    20001eb4:	48 09 fe             	or     %rdi,%rsi
{
    20001eb7:	4c 89 c1             	mov    %r8,%rcx
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    20001eba:	48 bf 00 00 00 00 0d 	movabs $0xd00000000,%rdi
    20001ec1:	00 00 00 
    20001ec4:	4c 09 ca             	or     %r9,%rdx
    20001ec7:	e9 21 e2 ff ff       	jmp    200000ed <UVM_Svc>
    20001ecc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000020001ed0 <UVM_Captbl_Pgtbl>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Pgtbl(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                       cid_t Cap_Captbl_Src, cid_t Cap_Src,
                       ptr_t Start, ptr_t End, ptr_t Flags)
{
    20001ed0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    20001ed4:	49 c1 e1 24          	shl    $0x24,%r9
{
    20001ed8:	49 89 f2             	mov    %rsi,%r10
    20001edb:	49 89 cb             	mov    %rcx,%r11
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    20001ede:	48 89 fe             	mov    %rdi,%rsi
    20001ee1:	4c 89 c1             	mov    %r8,%rcx
    20001ee4:	48 c1 e2 20          	shl    $0x20,%rdx
    20001ee8:	45 89 db             	mov    %r11d,%r11d
    20001eeb:	45 89 d2             	mov    %r10d,%r10d
    20001eee:	48 c1 e1 08          	shl    $0x8,%rcx
    20001ef2:	48 c1 e6 20          	shl    $0x20,%rsi
    20001ef6:	4c 09 da             	or     %r11,%rdx
    20001ef9:	48 0b 4c 24 08       	or     0x8(%rsp),%rcx
    20001efe:	48 bf 00 00 00 00 0d 	movabs $0xd00000000,%rdi
    20001f05:	00 00 00 
    20001f08:	4c 09 c9             	or     %r9,%rcx
    20001f0b:	4c 09 d6             	or     %r10,%rsi
    20001f0e:	e9 da e1 ff ff       	jmp    200000ed <UVM_Svc>
    20001f13:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    20001f1a:	00 00 00 00 
    20001f1e:	66 90                	xchg   %ax,%ax

0000000020001f20 <UVM_Captbl_Kern>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kern(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End)
{
    20001f20:	f3 0f 1e fa          	endbr64 
    20001f24:	49 89 f2             	mov    %rsi,%r10
    20001f27:	49 89 cb             	mov    %rcx,%r11
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    20001f2a:	48 89 fe             	mov    %rdi,%rsi
    20001f2d:	4c 89 c9             	mov    %r9,%rcx
    20001f30:	48 c1 e1 20          	shl    $0x20,%rcx
    20001f34:	48 c1 e2 20          	shl    $0x20,%rdx
    20001f38:	45 89 db             	mov    %r11d,%r11d
    20001f3b:	45 89 d2             	mov    %r10d,%r10d
    20001f3e:	48 c1 e6 20          	shl    $0x20,%rsi
    20001f42:	4c 09 c1             	or     %r8,%rcx
    20001f45:	4c 09 da             	or     %r11,%rdx
    20001f48:	48 bf 00 00 00 00 0d 	movabs $0xd00000000,%rdi
    20001f4f:	00 00 00 
    20001f52:	4c 09 d6             	or     %r10,%rsi
    20001f55:	e9 93 e1 ff ff       	jmp    200000ed <UVM_Svc>
    20001f5a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000020001f60 <UVM_Captbl_Kmem>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kmem(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End, ptr_t Flags)
{
    20001f60:	f3 0f 1e fa          	endbr64 
    20001f64:	49 89 cb             	mov    %rcx,%r11
    20001f67:	49 89 f2             	mov    %rsi,%r10
    return UVM_CAP_OP(UVM_KMEM_SVC(End,RME_SVC_CPT_ADD), UVM_KMEM_CAPID(Start,Flags),
    20001f6a:	4c 89 c0             	mov    %r8,%rax
    20001f6d:	48 89 fe             	mov    %rdi,%rsi
    20001f70:	4c 89 c7             	mov    %r8,%rdi
    20001f73:	48 c1 e8 20          	shr    $0x20,%rax
    20001f77:	45 89 db             	mov    %r11d,%r11d
    20001f7a:	45 89 d2             	mov    %r10d,%r10d
    20001f7d:	48 c1 e2 20          	shl    $0x20,%rdx
    20001f81:	83 e7 c0             	and    $0xffffffc0,%edi
    20001f84:	48 c1 e6 20          	shl    $0x20,%rsi
    20001f88:	48 b9 00 00 00 00 ff 	movabs $0xffffffff00000000,%rcx
    20001f8f:	ff ff ff 
    20001f92:	4c 21 c9             	and    %r9,%rcx
    20001f95:	49 c1 e9 06          	shr    $0x6,%r9
    20001f99:	4c 09 da             	or     %r11,%rdx
    20001f9c:	4c 09 d6             	or     %r10,%rsi
    20001f9f:	49 c1 e1 26          	shl    $0x26,%r9
    20001fa3:	48 09 c1             	or     %rax,%rcx
    20001fa6:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    20001fad:	00 00 00 
    20001fb0:	4c 09 cf             	or     %r9,%rdi
    20001fb3:	48 0b 7c 24 08       	or     0x8(%rsp),%rdi
    20001fb8:	48 09 c7             	or     %rax,%rdi
    20001fbb:	e9 2d e1 ff ff       	jmp    200000ed <UVM_Svc>

0000000020001fc0 <UVM_Captbl_Rem>:
              cid_t Cap_Rem - The capability slot you want to remove. 1-Level.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Rem(cid_t Cap_Captbl_Rem, cid_t Cap_Rem)
{
    20001fc0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_CPT_REM, Cap_Captbl_Rem,
    20001fc4:	48 b8 00 00 00 00 0e 	movabs $0xe00000000,%rax
    20001fcb:	00 00 00 
    20001fce:	31 c9                	xor    %ecx,%ecx
    20001fd0:	31 d2                	xor    %edx,%edx
    20001fd2:	48 09 c7             	or     %rax,%rdi
    20001fd5:	e9 13 e1 ff ff       	jmp    200000ed <UVM_Svc>
    20001fda:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000020001fe0 <UVM_Kern_Act>:
                      kernel function ever causes a context switch, it is responsible
                      for setting the return value. On failure, a context switch 
                      in the kernel fucntion is banned.
******************************************************************************/
ret_t UVM_Kern_Act(cid_t Cap_Kern, ptr_t Func_ID, ptr_t Sub_ID, ptr_t Param1, ptr_t Param2)
{
    20001fe0:	f3 0f 1e fa          	endbr64 
    20001fe4:	49 89 c9             	mov    %rcx,%r9
    return UVM_CAP_OP(RME_SVC_KFN, Cap_Kern,
    20001fe7:	48 c1 e2 20          	shl    $0x20,%rdx
    20001feb:	89 f6                	mov    %esi,%esi
{
    20001fed:	4c 89 c1             	mov    %r8,%rcx
    return UVM_CAP_OP(RME_SVC_KFN, Cap_Kern,
    20001ff0:	48 09 d6             	or     %rdx,%rsi
    20001ff3:	48 0f ba ef 22       	bts    $0x22,%rdi
    20001ff8:	4c 89 ca             	mov    %r9,%rdx
    20001ffb:	e9 ed e0 ff ff       	jmp    200000ed <UVM_Svc>

0000000020002000 <UVM_Pgtbl_Crt>:
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Pgtbl, 
                    ptr_t Vaddr, ptr_t Start_Addr, ptr_t Top_Flag,
                    ptr_t Size_Order, ptr_t Num_Order)
{
    20002000:	f3 0f 1e fa          	endbr64 
    20002004:	49 89 fb             	mov    %rdi,%r11
    
    return UVM_CAP_OP(UVM_PGTBL_SVC(Num_Order,RME_SVC_PGT_CRT), Cap_Captbl,
    20002007:	48 c1 e2 10          	shl    $0x10,%rdx
    2000200b:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
{
    20002010:	49 89 ca             	mov    %rcx,%r10
    return UVM_CAP_OP(UVM_PGTBL_SVC(Num_Order,RME_SVC_PGT_CRT), Cap_Captbl,
    20002013:	0f b7 44 24 08       	movzwl 0x8(%rsp),%eax
    20002018:	89 d2                	mov    %edx,%edx
    2000201a:	48 c1 e6 20          	shl    $0x20,%rsi
    2000201e:	4c 89 c1             	mov    %r8,%rcx
    20002021:	48 09 d6             	or     %rdx,%rsi
    20002024:	48 c1 e7 30          	shl    $0x30,%rdi
    20002028:	4c 09 c9             	or     %r9,%rcx
    2000202b:	4c 89 d2             	mov    %r10,%rdx
    2000202e:	48 09 c6             	or     %rax,%rsi
    20002031:	4c 09 df             	or     %r11,%rdi
    20002034:	48 b8 00 00 00 00 0f 	movabs $0xf00000000,%rax
    2000203b:	00 00 00 
    2000203e:	48 09 c7             	or     %rax,%rdi
    20002041:	e9 a7 e0 ff ff       	jmp    200000ed <UVM_Svc>
    20002046:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    2000204d:	00 00 00 

0000000020002050 <UVM_Pgtbl_Del>:
                                page table capability to be in. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Del(cid_t Cap_Captbl, cid_t Cap_Pgtbl)
{
    20002050:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_PGT_DEL, Cap_Captbl,
    20002054:	48 0f ba ef 24       	bts    $0x24,%rdi
    20002059:	31 c9                	xor    %ecx,%ecx
    2000205b:	31 d2                	xor    %edx,%edx
    2000205d:	e9 8b e0 ff ff       	jmp    200000ed <UVM_Svc>
    20002062:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    20002069:	00 00 00 00 
    2000206d:	0f 1f 00             	nopl   (%rax)

0000000020002070 <UVM_Pgtbl_Add>:
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Add(cid_t Cap_Pgtbl_Dst, ptr_t Pos_Dst, ptr_t Flags_Dst,
                    cid_t Cap_Pgtbl_Src, ptr_t Pos_Src, ptr_t Index)
{
    20002070:	f3 0f 1e fa          	endbr64 
    20002074:	49 89 d2             	mov    %rdx,%r10
    return UVM_CAP_OP(RME_SVC_PGT_ADD, Flags_Dst,
    20002077:	48 c1 e1 20          	shl    $0x20,%rcx
    2000207b:	89 f6                	mov    %esi,%esi
    2000207d:	45 89 c0             	mov    %r8d,%r8d
    20002080:	48 c1 e7 20          	shl    $0x20,%rdi
    20002084:	48 89 ca             	mov    %rcx,%rdx
    20002087:	4c 89 c9             	mov    %r9,%rcx
    2000208a:	48 b8 00 00 00 00 11 	movabs $0x1100000000,%rax
    20002091:	00 00 00 
    20002094:	48 09 fe             	or     %rdi,%rsi
    20002097:	4c 89 d7             	mov    %r10,%rdi
    2000209a:	4c 09 c2             	or     %r8,%rdx
    2000209d:	48 09 c7             	or     %rax,%rdi
    200020a0:	e9 48 e0 ff ff       	jmp    200000ed <UVM_Svc>
    200020a5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    200020ac:	00 00 00 00 

00000000200020b0 <UVM_Pgtbl_Rem>:
              ptr_t Pos - The virtual address position to unmap from.
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Rem(cid_t Cap_Pgtbl, ptr_t Pos)
{
    200020b0:	f3 0f 1e fa          	endbr64 
    200020b4:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_PGT_REM, 0,
    200020b7:	31 c9                	xor    %ecx,%ecx
    200020b9:	48 89 fe             	mov    %rdi,%rsi
    200020bc:	48 bf 00 00 00 00 12 	movabs $0x1200000000,%rdi
    200020c3:	00 00 00 
    200020c6:	e9 22 e0 ff ff       	jmp    200000ed <UVM_Svc>
    200020cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000200020d0 <UVM_Pgtbl_Con>:
              ptr_t Flags_Child - This have no effect on MPU-based architectures.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Con(cid_t Cap_Pgtbl_Parent, ptr_t Pos, cid_t Cap_Pgtbl_Child, ptr_t Flags_Child)
{
    200020d0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_PGT_CON, 0,
    200020d4:	48 c1 e7 20          	shl    $0x20,%rdi
{
    200020d8:	49 89 f0             	mov    %rsi,%r8
    return UVM_CAP_OP(RME_SVC_PGT_CON, 0,
    200020db:	89 d2                	mov    %edx,%edx
    200020dd:	48 89 fe             	mov    %rdi,%rsi
    200020e0:	48 bf 00 00 00 00 13 	movabs $0x1300000000,%rdi
    200020e7:	00 00 00 
    200020ea:	48 09 d6             	or     %rdx,%rsi
    200020ed:	4c 89 c2             	mov    %r8,%rdx
    200020f0:	e9 f8 df ff ff       	jmp    200000ed <UVM_Svc>
    200020f5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    200020fc:	00 00 00 00 

0000000020002100 <UVM_Pgtbl_Des>:
                          table from.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Des(cid_t Cap_Pgtbl, ptr_t Pos)
{
    20002100:	f3 0f 1e fa          	endbr64 
    20002104:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_PGT_DES, 0,
    20002107:	31 c9                	xor    %ecx,%ecx
    20002109:	48 89 fe             	mov    %rdi,%rsi
    2000210c:	48 bf 00 00 00 00 14 	movabs $0x1400000000,%rdi
    20002113:	00 00 00 
    20002116:	e9 d2 df ff ff       	jmp    200000ed <UVM_Svc>
    2000211b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000020002120 <UVM_Proc_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, cid_t Cap_Proc,
                   cid_t Cap_Captbl, cid_t Cap_Pgtbl, ptr_t Vaddr)
{
    20002120:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_PRC_CRT, Cap_Captbl_Crt,
    20002124:	48 b8 00 00 00 00 15 	movabs $0x1500000000,%rax
    2000212b:	00 00 00 
{
    2000212e:	48 89 d6             	mov    %rdx,%rsi
    20002131:	48 89 ca             	mov    %rcx,%rdx
    20002134:	4c 89 c1             	mov    %r8,%rcx
    return UVM_CAP_OP(RME_SVC_PRC_CRT, Cap_Captbl_Crt,
    20002137:	48 09 c7             	or     %rax,%rdi
    2000213a:	e9 ae df ff ff       	jmp    200000ed <UVM_Svc>
    2000213f:	90                   	nop

0000000020002140 <UVM_Proc_Del>:
              cid_t Cap_Proc - The capability to the process. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Del(cid_t Cap_Captbl, cid_t Cap_Proc)
{
    20002140:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_PRC_DEL, Cap_Captbl,
    20002144:	48 b8 00 00 00 00 16 	movabs $0x1600000000,%rax
    2000214b:	00 00 00 
    2000214e:	31 c9                	xor    %ecx,%ecx
    20002150:	31 d2                	xor    %edx,%edx
    20002152:	48 09 c7             	or     %rax,%rdi
    20002155:	e9 93 df ff ff       	jmp    200000ed <UVM_Svc>
    2000215a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000020002160 <UVM_Proc_Cpt>:
                                 this process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Cpt(cid_t Cap_Proc, cid_t Cap_Captbl)
{
    20002160:	f3 0f 1e fa          	endbr64 
    20002164:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_PRC_CPT, 0,
    20002167:	31 c9                	xor    %ecx,%ecx
    20002169:	48 89 fe             	mov    %rdi,%rsi
    2000216c:	48 bf 00 00 00 00 17 	movabs $0x1700000000,%rdi
    20002173:	00 00 00 
    20002176:	e9 72 df ff ff       	jmp    200000ed <UVM_Svc>
    2000217b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000020002180 <UVM_Proc_Pgt>:
                                process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Pgt(cid_t Cap_Proc, cid_t Cap_Pgtbl)
{
    20002180:	f3 0f 1e fa          	endbr64 
    20002184:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_PRC_PGT, 0,
    20002187:	31 c9                	xor    %ecx,%ecx
    20002189:	48 89 fe             	mov    %rdi,%rsi
    2000218c:	48 bf 00 00 00 00 18 	movabs $0x1800000000,%rdi
    20002193:	00 00 00 
    20002196:	e9 52 df ff ff       	jmp    200000ed <UVM_Svc>
    2000219b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000200021a0 <UVM_Thd_Crt>:
Output      : None.
Return      : ret_t - If successful, the Thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Thd,
                  cid_t Cap_Proc, ptr_t Max_Prio, ptr_t Vaddr)
{
    200021a0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_THD_CRT, Cap_Captbl, 
    200021a4:	48 c1 e1 20          	shl    $0x20,%rcx
{
    200021a8:	49 89 d2             	mov    %rdx,%r10
    return UVM_CAP_OP(RME_SVC_THD_CRT, Cap_Captbl, 
    200021ab:	45 89 c0             	mov    %r8d,%r8d
    200021ae:	48 c1 e6 20          	shl    $0x20,%rsi
    200021b2:	48 b8 00 00 00 00 19 	movabs $0x1900000000,%rax
    200021b9:	00 00 00 
    200021bc:	48 89 ca             	mov    %rcx,%rdx
    200021bf:	45 89 d2             	mov    %r10d,%r10d
    200021c2:	4c 89 c9             	mov    %r9,%rcx
    200021c5:	4c 09 c2             	or     %r8,%rdx
    200021c8:	4c 09 d6             	or     %r10,%rsi
    200021cb:	48 09 c7             	or     %rax,%rdi
    200021ce:	e9 1a df ff ff       	jmp    200000ed <UVM_Svc>
    200021d3:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    200021da:	00 00 00 00 
    200021de:	66 90                	xchg   %ax,%ax

00000000200021e0 <UVM_Thd_Del>:
              cid_t Cap_Thd - The capability to the thread in the captbl. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Del(cid_t Cap_Captbl, cid_t Cap_Thd)
{
    200021e0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_THD_DEL, Cap_Captbl,
    200021e4:	48 b8 00 00 00 00 1a 	movabs $0x1a00000000,%rax
    200021eb:	00 00 00 
    200021ee:	31 c9                	xor    %ecx,%ecx
    200021f0:	31 d2                	xor    %edx,%edx
    200021f2:	48 09 c7             	or     %rax,%rdi
    200021f5:	e9 f3 de ff ff       	jmp    200000ed <UVM_Svc>
    200021fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000020002200 <UVM_Thd_Exec_Set>:
              ptr_t Param - The parameter of the thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Exec_Set(cid_t Cap_Thd, ptr_t Entry, ptr_t Stack, ptr_t Param)
{
    20002200:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, Cap_Thd,
    20002204:	48 b8 00 00 00 00 06 	movabs $0x600000000,%rax
    2000220b:	00 00 00 
    2000220e:	48 09 c7             	or     %rax,%rdi
    20002211:	e9 d7 de ff ff       	jmp    200000ed <UVM_Svc>
    20002216:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    2000221d:	00 00 00 

0000000020002220 <UVM_Thd_Hyp_Set>:
                            thread's register sets.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Hyp_Set(cid_t Cap_Thd, ptr_t Kaddr)
{
    20002220:	f3 0f 1e fa          	endbr64 
    20002224:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, 0,
    20002227:	31 c9                	xor    %ecx,%ecx
    20002229:	48 89 fe             	mov    %rdi,%rsi
    2000222c:	48 bf 00 00 00 00 06 	movabs $0x600000000,%rdi
    20002233:	00 00 00 
    20002236:	e9 b2 de ff ff       	jmp    200000ed <UVM_Svc>
    2000223b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000020002240 <UVM_Thd_Sched_Bind>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Bind(cid_t Cap_Thd, cid_t Cap_Thd_Sched, cid_t Cap_Sig, tid_t TID, ptr_t Prio)
{
    20002240:	f3 0f 1e fa          	endbr64 
    20002244:	49 89 d1             	mov    %rdx,%r9
    return UVM_CAP_OP(RME_SVC_THD_SCHED_BIND, Cap_Thd,
    20002247:	48 c1 e6 20          	shl    $0x20,%rsi
{
    2000224b:	48 89 ca             	mov    %rcx,%rdx
    return UVM_CAP_OP(RME_SVC_THD_SCHED_BIND, Cap_Thd,
    2000224e:	48 b8 00 00 00 00 1b 	movabs $0x1b00000000,%rax
    20002255:	00 00 00 
    20002258:	45 89 c9             	mov    %r9d,%r9d
{
    2000225b:	4c 89 c1             	mov    %r8,%rcx
    return UVM_CAP_OP(RME_SVC_THD_SCHED_BIND, Cap_Thd,
    2000225e:	48 09 c7             	or     %rax,%rdi
    20002261:	4c 09 ce             	or     %r9,%rsi
    20002264:	e9 84 de ff ff       	jmp    200000ed <UVM_Svc>
    20002269:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000020002270 <UVM_Thd_Sched_Rcv>:
                              is simply not allowed. 2-Level.
Output      : None.
Return      : ret_t - If successful, the thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Rcv(cid_t Cap_Thd)
{
    20002270:	f3 0f 1e fa          	endbr64 
    20002274:	48 89 fe             	mov    %rdi,%rsi
    return UVM_CAP_OP(RME_SVC_THD_SCHED_RCV, 0,
    20002277:	31 c9                	xor    %ecx,%ecx
    20002279:	31 d2                	xor    %edx,%edx
    2000227b:	48 bf 00 00 00 00 1c 	movabs $0x1c00000000,%rdi
    20002282:	00 00 00 
    20002285:	e9 63 de ff ff       	jmp    200000ed <UVM_Svc>
    2000228a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000020002290 <UVM_Thd_Sched_Prio>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Prio(cid_t Cap_Thd, ptr_t Prio)
{
    20002290:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_THD_SCHED_PRIO, 1,
    20002294:	89 ff                	mov    %edi,%edi
    20002296:	48 c1 e6 20          	shl    $0x20,%rsi
    2000229a:	31 c9                	xor    %ecx,%ecx
    2000229c:	31 d2                	xor    %edx,%edx
    2000229e:	48 09 fe             	or     %rdi,%rsi
    200022a1:	48 bf 01 00 00 00 07 	movabs $0x700000001,%rdi
    200022a8:	00 00 00 
    200022ab:	e9 3d de ff ff       	jmp    200000ed <UVM_Svc>

00000000200022b0 <UVM_Thd_Sched_Free>:
Input       : cid_t Cap_Thd - The capability to the thread. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Free(cid_t Cap_Thd)
{
    200022b0:	f3 0f 1e fa          	endbr64 
    200022b4:	48 89 fe             	mov    %rdi,%rsi
    return UVM_CAP_OP(RME_SVC_THD_SCHED_FREE, 0,
    200022b7:	31 c9                	xor    %ecx,%ecx
    200022b9:	31 d2                	xor    %edx,%edx
    200022bb:	48 bf 00 00 00 00 05 	movabs $0x500000000,%rdi
    200022c2:	00 00 00 
    200022c5:	e9 23 de ff ff       	jmp    200000ed <UVM_Svc>
    200022ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000200022d0 <UVM_Thd_Time_Xfer>:
                           order of 100us or 1ms.
Output      : None.
Return      : ret_t - If successful, the destination time amount; or an error code.
******************************************************************************/
ret_t UVM_Thd_Time_Xfer(cid_t Cap_Thd_Dst, cid_t Cap_Thd_Src, ptr_t Time)
{
    200022d0:	f3 0f 1e fa          	endbr64 
    200022d4:	48 89 d1             	mov    %rdx,%rcx
    return UVM_CAP_OP(RME_SVC_THD_TIME_XFER, 0,
    200022d7:	48 89 f2             	mov    %rsi,%rdx
    200022da:	48 89 fe             	mov    %rdi,%rsi
    200022dd:	48 bf 00 00 00 00 08 	movabs $0x800000000,%rdi
    200022e4:	00 00 00 
    200022e7:	e9 01 de ff ff       	jmp    200000ed <UVM_Svc>
    200022ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000200022f0 <UVM_Thd_Swt>:
                                 this thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Swt(cid_t Cap_Thd, ptr_t Full_Yield)
{
    200022f0:	f3 0f 1e fa          	endbr64 
    200022f4:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_THD_SWT, 0,
    200022f7:	31 c9                	xor    %ecx,%ecx
    200022f9:	48 89 fe             	mov    %rdi,%rsi
    200022fc:	48 bf 00 00 00 00 09 	movabs $0x900000000,%rdi
    20002303:	00 00 00 
    20002306:	e9 e2 dd ff ff       	jmp    200000ed <UVM_Svc>
    2000230b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000020002310 <UVM_Sig_Crt>:
                            within the kernel virtual address.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Sig, ptr_t Vaddr)
{
    20002310:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_SIG_CRT, Cap_Captbl,
    20002314:	48 b8 00 00 00 00 1d 	movabs $0x1d00000000,%rax
    2000231b:	00 00 00 
{
    2000231e:	49 89 f0             	mov    %rsi,%r8
    20002321:	48 89 d6             	mov    %rdx,%rsi
    return UVM_CAP_OP(RME_SVC_SIG_CRT, Cap_Captbl,
    20002324:	48 09 c7             	or     %rax,%rdi
    20002327:	4c 89 c2             	mov    %r8,%rdx
    2000232a:	e9 be dd ff ff       	jmp    200000ed <UVM_Svc>
    2000232f:	90                   	nop

0000000020002330 <UVM_Sig_Del>:
              cid_t Cap_Sig - The capability to the signal. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Del(cid_t Cap_Captbl, cid_t Cap_Sig)
{
    20002330:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_SIG_DEL, Cap_Captbl,
    20002334:	48 b8 00 00 00 00 1e 	movabs $0x1e00000000,%rax
    2000233b:	00 00 00 
    2000233e:	31 c9                	xor    %ecx,%ecx
    20002340:	31 d2                	xor    %edx,%edx
    20002342:	48 09 c7             	or     %rax,%rdi
    20002345:	e9 a3 dd ff ff       	jmp    200000ed <UVM_Svc>
    2000234a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000020002350 <UVM_Sig_Snd>:
Input       : cid_t Cap_Sig - The capability to the signal. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0, or an error code.
******************************************************************************/
ret_t UVM_Sig_Snd(cid_t Cap_Sig)
{
    20002350:	f3 0f 1e fa          	endbr64 
    20002354:	48 89 fe             	mov    %rdi,%rsi
    return UVM_CAP_OP(RME_SVC_SIG_SND, 0,
    20002357:	31 c9                	xor    %ecx,%ecx
    20002359:	31 d2                	xor    %edx,%edx
    2000235b:	48 bf 00 00 00 00 02 	movabs $0x200000000,%rdi
    20002362:	00 00 00 
    20002365:	e9 83 dd ff ff       	jmp    200000ed <UVM_Svc>
    2000236a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000020002370 <UVM_Sig_Rcv>:
Output      : None.
Return      : ret_t - If successful, a non-negative number containing the number of signals
                      received will be returned; else an error code.
******************************************************************************/
ret_t UVM_Sig_Rcv(cid_t Cap_Sig, ptr_t Option)
{
    20002370:	f3 0f 1e fa          	endbr64 
    20002374:	48 89 f2             	mov    %rsi,%rdx
    return UVM_CAP_OP(RME_SVC_SIG_RCV, 0,
    20002377:	31 c9                	xor    %ecx,%ecx
    20002379:	48 89 fe             	mov    %rdi,%rsi
    2000237c:	48 bf 00 00 00 00 03 	movabs $0x300000000,%rdi
    20002383:	00 00 00 
    20002386:	e9 62 dd ff ff       	jmp    200000ed <UVM_Svc>
    2000238b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000020002390 <UVM_Inv_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, 
                  cid_t Cap_Inv, cid_t Cap_Proc, ptr_t Vaddr)
{
    20002390:	f3 0f 1e fa          	endbr64 
    20002394:	49 89 d1             	mov    %rdx,%r9
    return UVM_CAP_OP(RME_SVC_INV_CRT, Cap_Captbl,
    20002397:	48 c1 e6 20          	shl    $0x20,%rsi
{
    2000239b:	48 89 ca             	mov    %rcx,%rdx
    return UVM_CAP_OP(RME_SVC_INV_CRT, Cap_Captbl,
    2000239e:	48 b8 00 00 00 00 1f 	movabs $0x1f00000000,%rax
    200023a5:	00 00 00 
    200023a8:	45 89 c9             	mov    %r9d,%r9d
{
    200023ab:	4c 89 c1             	mov    %r8,%rcx
    return UVM_CAP_OP(RME_SVC_INV_CRT, Cap_Captbl,
    200023ae:	48 09 c7             	or     %rax,%rdi
    200023b1:	4c 09 ce             	or     %r9,%rsi
    200023b4:	e9 34 dd ff ff       	jmp    200000ed <UVM_Svc>
    200023b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000200023c0 <UVM_Inv_Del>:
              cid_t Cap_Inv - The capability to the invocation stub. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Del(cid_t Cap_Captbl, cid_t Cap_Inv)
{
    200023c0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_INV_DEL, Cap_Captbl,
    200023c4:	48 0f ba ef 25       	bts    $0x25,%rdi
    200023c9:	31 c9                	xor    %ecx,%ecx
    200023cb:	31 d2                	xor    %edx,%edx
    200023cd:	e9 1b dd ff ff       	jmp    200000ed <UVM_Svc>
    200023d2:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    200023d9:	00 00 00 00 
    200023dd:	0f 1f 00             	nopl   (%rax)

00000000200023e0 <UVM_Inv_Set>:
                                     immediately, or we wait for fault handling?
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Set(cid_t Cap_Inv, ptr_t Entry, ptr_t Stack, ptr_t Fault_Ret_Flag)
{
    200023e0:	f3 0f 1e fa          	endbr64 
    return UVM_CAP_OP(RME_SVC_INV_SET, 0,
    200023e4:	48 c1 e1 20          	shl    $0x20,%rcx
{
    200023e8:	49 89 f0             	mov    %rsi,%r8
    return UVM_CAP_OP(RME_SVC_INV_SET, 0,
    200023eb:	89 ff                	mov    %edi,%edi
    200023ed:	48 89 ce             	mov    %rcx,%rsi
    200023f0:	48 89 d1             	mov    %rdx,%rcx
    200023f3:	4c 89 c2             	mov    %r8,%rdx
    200023f6:	48 09 fe             	or     %rdi,%rsi
    200023f9:	48 bf 00 00 00 00 21 	movabs $0x2100000000,%rdi
    20002400:	00 00 00 
    20002403:	e9 e5 dc ff ff       	jmp    200000ed <UVM_Svc>
    20002408:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    2000240f:	00 

0000000020002410 <UVM_Putchar>:
Input       : char Char - The character to print.
Output      : None.
Return      : ptr_t - Always 0.
******************************************************************************/
ptr_t UVM_Putchar(char Char)
{
    20002410:	f3 0f 1e fa          	endbr64 
    20002414:	41 54                	push   %r12
    20002416:	41 89 fc             	mov    %edi,%r12d
    /* Wait until we have transmitted */
    while((__UVM_X64_In(UVM_X64_COM1+5)&0x20)==0);
    20002419:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    20002420:	bf fd 03 00 00       	mov    $0x3fd,%edi
    20002425:	e8 db db ff ff       	call   20000005 <__UVM_X64_In>
    2000242a:	a8 20                	test   $0x20,%al
    2000242c:	74 f2                	je     20002420 <UVM_Putchar+0x10>
    __UVM_X64_Out(UVM_X64_COM1, Char);
    2000242e:	4d 0f be e4          	movsbq %r12b,%r12
    20002432:	bf f8 03 00 00       	mov    $0x3f8,%edi
    20002437:	4c 89 e6             	mov    %r12,%rsi
    2000243a:	e8 d0 db ff ff       	call   2000000f <__UVM_X64_Out>
    UVM_Kern_Act(UVM_BOOT_INIT_KERN,0,0,(ptr_t)Char,0);
    2000243f:	4c 89 e1             	mov    %r12,%rcx
    20002442:	45 31 c0             	xor    %r8d,%r8d
    20002445:	31 d2                	xor    %edx,%edx
    20002447:	31 f6                	xor    %esi,%esi
    20002449:	bf 04 00 00 00       	mov    $0x4,%edi
    2000244e:	e8 8d fb ff ff       	call   20001fe0 <UVM_Kern_Act>
    return 0;
}
    20002453:	31 c0                	xor    %eax,%eax
    20002455:	41 5c                	pop    %r12
    20002457:	c3                   	ret    
    20002458:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    2000245f:	00 

0000000020002460 <_UVM_Stack_Init>:
Output      : None.
Return      : ptr_t - The actual stack address to use for system call.
******************************************************************************/
ptr_t _UVM_Stack_Init(ptr_t Stack, ptr_t Size, ptr_t Stub, ptr_t Entry,
                      ptr_t Param1, ptr_t Param2, ptr_t Param3, ptr_t Param4)
{
    20002460:	f3 0f 1e fa          	endbr64 
	ptr_t* Stack_Ptr;

    Stack_Ptr=(ptr_t*)(Stack+Size-UVM_STACK_SAFE_SIZE*sizeof(ptr_t));
    Stack_Ptr[0]=Param1;
    20002464:	66 49 0f 6e c0       	movq   %r8,%xmm0
    20002469:	66 49 0f 6e c9       	movq   %r9,%xmm1
    Stack_Ptr=(ptr_t*)(Stack+Size-UVM_STACK_SAFE_SIZE*sizeof(ptr_t));
    2000246e:	48 8d 84 37 00 ff ff 	lea    -0x100(%rdi,%rsi,1),%rax
    20002475:	ff 
    Stack_Ptr[0]=Param1;
    20002476:	66 0f 6c c1          	punpcklqdq %xmm1,%xmm0
    Stack_Ptr[1]=Param2;
    Stack_Ptr[2]=Param3;
    Stack_Ptr[3]=Param4;
    Stack_Ptr[4]=Entry;
    2000247a:	48 89 48 20          	mov    %rcx,0x20(%rax)
    Stack_Ptr[0]=Param1;
    2000247e:	0f 11 00             	movups %xmm0,(%rax)
    20002481:	f3 0f 7e 44 24 08    	movq   0x8(%rsp),%xmm0
    20002487:	0f 16 44 24 10       	movhps 0x10(%rsp),%xmm0
    2000248c:	0f 11 40 10          	movups %xmm0,0x10(%rax)

    return (ptr_t)Stack_Ptr;
}
    20002490:	c3                   	ret    
    20002491:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    20002498:	00 00 00 00 
    2000249c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000200024a0 <_UVM_Idle>:
Input       : None.
Output      : None.
Return      : None.
******************************************************************************/
void _UVM_Idle(void)
{
    200024a0:	f3 0f 1e fa          	endbr64 
    /* Do nothing. In the future we may call a kernel function to put us to sleep */
}
    200024a4:	c3                   	ret    

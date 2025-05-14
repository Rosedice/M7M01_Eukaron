
./Object/UVM:     file format elf64-x86-64


Disassembly of section .text:

0000000020000000 <_UVM_Entry>:
              space very well.
Input       : None.
Output      : None.
*****************************************************************************/
_UVM_Entry:
    JMP                 main
    20000000:	e9 ad 02 00 00       	jmp    200002b2 <main>

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

0000000020000107 <UVM_Clear>:
              ptr_t Size - The size to clear.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_Clear(void* Addr, ptr_t Size)
{
    20000107:	f3 0f 1e fa          	endbr64 
    2000010b:	55                   	push   %rbp
    2000010c:	48 89 e5             	mov    %rsp,%rbp
    2000010f:	48 83 ec 30          	sub    $0x30,%rsp
    20000113:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    20000117:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    u8* Byte_Inc;
    ptr_t Words;
    ptr_t Bytes;
    
    /* On processors not that fast, copy by word is really important */
    Word_Inc=(ptr_t*)Addr;
    2000011b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2000011f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
    20000123:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20000127:	48 c1 e8 03          	shr    $0x3,%rax
    2000012b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    2000012f:	eb 15                	jmp    20000146 <UVM_Clear+0x3f>
    {
        *Word_Inc=0;
    20000131:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000135:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
        Word_Inc++;
    2000013c:	48 83 45 f8 08       	addq   $0x8,-0x8(%rbp)
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
    20000141:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
    20000146:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
    2000014b:	75 e4                	jne    20000131 <UVM_Clear+0x2a>
    }
    
    /* Get the final bytes */
    Byte_Inc=(u8*)Word_Inc;
    2000014d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000151:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    for(Bytes=Size%sizeof(ptr_t);Bytes>0;Bytes--)
    20000155:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20000159:	83 e0 07             	and    $0x7,%eax
    2000015c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    20000160:	eb 11                	jmp    20000173 <UVM_Clear+0x6c>
    {
        *Byte_Inc=0;
    20000162:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000166:	c6 00 00             	movb   $0x0,(%rax)
        Byte_Inc++;
    20000169:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    for(Bytes=Size%sizeof(ptr_t);Bytes>0;Bytes--)
    2000016e:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
    20000173:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
    20000178:	75 e8                	jne    20000162 <UVM_Clear+0x5b>
    }
}
    2000017a:	90                   	nop
    2000017b:	90                   	nop
    2000017c:	c9                   	leave  
    2000017d:	c3                   	ret    

000000002000017e <test>:
ptr_t sum;
ptr_t sumin;
ptr_t sumout;

void test(void)
{
    2000017e:	f3 0f 1e fa          	endbr64 
    20000182:	55                   	push   %rbp
    20000183:	48 89 e5             	mov    %rsp,%rbp
    20000186:	48 83 ec 10          	sub    $0x10,%rsp
    cnt_t Count;
    sum=0;
    2000018a:	48 c7 05 8b 1e 00 00 	movq   $0x0,0x1e8b(%rip)        # 20002020 <sum>
    20000191:	00 00 00 00 

    for(Count=0;Count<1000000;Count++)
    20000195:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    2000019c:	00 
    2000019d:	eb 51                	jmp    200001f0 <test+0x72>
    {
        start=__UVM_X64_Read_TSC();
    2000019f:	e8 77 fe ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    200001a4:	48 89 05 5d 1e 00 00 	mov    %rax,0x1e5d(%rip)        # 20002008 <start>
        UVM_Thd_Swt(TEST_THD2,0);
    200001ab:	be 00 00 00 00       	mov    $0x0,%esi
    200001b0:	bf 0a 00 00 00       	mov    $0xa,%edi
    200001b5:	e8 01 14 00 00       	call   200015bb <UVM_Thd_Swt>
        end=__UVM_X64_Read_TSC();
    200001ba:	e8 5c fe ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    200001bf:	48 89 05 52 1e 00 00 	mov    %rax,0x1e52(%rip)        # 20002018 <end>
        sum+=end-start;
    200001c6:	48 8b 05 4b 1e 00 00 	mov    0x1e4b(%rip),%rax        # 20002018 <end>
    200001cd:	48 8b 15 34 1e 00 00 	mov    0x1e34(%rip),%rdx        # 20002008 <start>
    200001d4:	48 29 d0             	sub    %rdx,%rax
    200001d7:	48 89 c1             	mov    %rax,%rcx
    200001da:	48 8b 05 3f 1e 00 00 	mov    0x1e3f(%rip),%rax        # 20002020 <sum>
    200001e1:	48 01 c8             	add    %rcx,%rax
    200001e4:	48 89 05 35 1e 00 00 	mov    %rax,0x1e35(%rip)        # 20002020 <sum>
    for(Count=0;Count<1000000;Count++)
    200001eb:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    200001f0:	48 81 7d f8 3f 42 0f 	cmpq   $0xf423f,-0x8(%rbp)
    200001f7:	00 
    200001f8:	7e a5                	jle    2000019f <test+0x21>
    }

    UVM_LOG_S("\r\nswtch ");
    200001fa:	bf b0 18 00 20       	mov    $0x200018b0,%edi
    200001ff:	e8 47 0a 00 00       	call   20000c4b <UVM_Print_String>
    UVM_LOG_I(sum/1000000);
    20000204:	48 8b 05 15 1e 00 00 	mov    0x1e15(%rip),%rax        # 20002020 <sum>
    2000020b:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    20000212:	de 1b 43 
    20000215:	48 f7 e2             	mul    %rdx
    20000218:	48 89 d0             	mov    %rdx,%rax
    2000021b:	48 c1 e8 12          	shr    $0x12,%rax
    2000021f:	48 89 c7             	mov    %rax,%rdi
    20000222:	e8 5a 07 00 00       	call   20000981 <UVM_Print_Int>
    UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*8, sum/1000000, 0);
    20000227:	48 8b 05 f2 1d 00 00 	mov    0x1df2(%rip),%rax        # 20002020 <sum>
    2000022e:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    20000235:	de 1b 43 
    20000238:	48 f7 e2             	mul    %rdx
    2000023b:	48 89 d0             	mov    %rdx,%rax
    2000023e:	48 c1 e8 12          	shr    $0x12,%rax
    20000242:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    20000248:	48 89 c1             	mov    %rax,%rcx
    2000024b:	ba 00 05 00 00       	mov    $0x500,%edx
    20000250:	be 07 00 00 00       	mov    $0x7,%esi
    20000255:	bf 04 00 00 00       	mov    $0x4,%edi
    2000025a:	e8 65 0d 00 00       	call   20000fc4 <UVM_Kern_Act>
    while(1);
    2000025f:	eb fe                	jmp    2000025f <test+0xe1>

0000000020000261 <test2>:
}

void test2(void)
{
    20000261:	f3 0f 1e fa          	endbr64 
    20000265:	55                   	push   %rbp
    20000266:	48 89 e5             	mov    %rsp,%rbp
    while(1)
    {
        UVM_Thd_Swt(TEST_THD1,0);
    20000269:	be 00 00 00 00       	mov    $0x0,%esi
    2000026e:	bf 09 00 00 00       	mov    $0x9,%edi
    20000273:	e8 43 13 00 00       	call   200015bb <UVM_Thd_Swt>
    20000278:	eb ef                	jmp    20000269 <test2+0x8>

000000002000027a <sinvtest>:
    }
}

void sinvtest(ptr_t Param)
{
    2000027a:	f3 0f 1e fa          	endbr64 
    2000027e:	55                   	push   %rbp
    2000027f:	48 89 e5             	mov    %rsp,%rbp
    20000282:	48 83 ec 10          	sub    $0x10,%rsp
    20000286:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    middle=__UVM_X64_Read_TSC();
    2000028a:	e8 8c fd ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    2000028f:	48 89 05 7a 1d 00 00 	mov    %rax,0x1d7a(%rip)        # 20002010 <middle>
    UVM_Svc(0,0,0,0);
    20000296:	b9 00 00 00 00       	mov    $0x0,%ecx
    2000029b:	ba 00 00 00 00       	mov    $0x0,%edx
    200002a0:	be 00 00 00 00       	mov    $0x0,%esi
    200002a5:	bf 00 00 00 00       	mov    $0x0,%edi
    200002aa:	e8 3e fe ff ff       	call   200000ed <UVM_Svc>
}
    200002af:	90                   	nop
    200002b0:	c9                   	leave  
    200002b1:	c3                   	ret    

00000000200002b2 <main>:
Input       : None.
Output      : None.
Return      : int - This function shall never return.
******************************************************************************/
int main(ptr_t CPUID)
{
    200002b2:	f3 0f 1e fa          	endbr64 
    200002b6:	55                   	push   %rbp
    200002b7:	48 89 e5             	mov    %rsp,%rbp
    200002ba:	48 83 ec 20          	sub    $0x20,%rsp
    200002be:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)

    ptr_t Cur_Addr;
    cnt_t Count;

    UVM_LOG_I(CPUID);
    200002c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    200002c6:	48 89 c7             	mov    %rax,%rdi
    200002c9:	e8 b3 06 00 00       	call   20000981 <UVM_Print_Int>
    /* We only print information on the first CPU */
    if(CPUID==0)
    200002ce:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
    200002d3:	0f 85 05 06 00 00    	jne    200008de <main+0x62c>
    {
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0, 1234, 0);
    200002d9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    200002df:	b9 d2 04 00 00       	mov    $0x4d2,%ecx
    200002e4:	ba 00 00 00 00       	mov    $0x0,%edx
    200002e9:	be 07 00 00 00       	mov    $0x7,%esi
    200002ee:	bf 04 00 00 00       	mov    $0x4,%edi
    200002f3:	e8 cc 0c 00 00       	call   20000fc4 <UVM_Kern_Act>
        UVM_LOG_S("\r\n");
        UVM_LOG_S("                  Application Processor User-level Platform!\r\n");
        UVM_LOG_S("-------------------------------------------------------------------------------\r\n");
    UVM_LOG_U(__UVM_X64_Read_TSC());
    UVM_LOG_U(__UVM_X64_Read_TSC());*/
        sum=0;
    200002f8:	48 c7 05 1d 1d 00 00 	movq   $0x0,0x1d1d(%rip)        # 20002020 <sum>
    200002ff:	00 00 00 00 

        /* Run a raw test before we run anything else */
        for(Count=0;Count<1000000;Count++)
    20000303:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    2000030a:	00 
    2000030b:	eb 42                	jmp    2000034f <main+0x9d>
        {
            start=__UVM_X64_Read_TSC();
    2000030d:	e8 09 fd ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    20000312:	48 89 05 ef 1c 00 00 	mov    %rax,0x1cef(%rip)        # 20002008 <start>
            end=__UVM_X64_Read_TSC();
    20000319:	e8 fd fc ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    2000031e:	48 89 05 f3 1c 00 00 	mov    %rax,0x1cf3(%rip)        # 20002018 <end>
            sum+=end-start;
    20000325:	48 8b 05 ec 1c 00 00 	mov    0x1cec(%rip),%rax        # 20002018 <end>
    2000032c:	48 8b 15 d5 1c 00 00 	mov    0x1cd5(%rip),%rdx        # 20002008 <start>
    20000333:	48 29 d0             	sub    %rdx,%rax
    20000336:	48 89 c1             	mov    %rax,%rcx
    20000339:	48 8b 05 e0 1c 00 00 	mov    0x1ce0(%rip),%rax        # 20002020 <sum>
    20000340:	48 01 c8             	add    %rcx,%rax
    20000343:	48 89 05 d6 1c 00 00 	mov    %rax,0x1cd6(%rip)        # 20002020 <sum>
        for(Count=0;Count<1000000;Count++)
    2000034a:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    2000034f:	48 81 7d f0 3f 42 0f 	cmpq   $0xf423f,-0x10(%rbp)
    20000356:	00 
    20000357:	7e b4                	jle    2000030d <main+0x5b>
        }
        UVM_LOG_S("\r\nempty");
    20000359:	bf b9 18 00 20       	mov    $0x200018b9,%edi
    2000035e:	e8 e8 08 00 00       	call   20000c4b <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
    20000363:	48 8b 05 b6 1c 00 00 	mov    0x1cb6(%rip),%rax        # 20002020 <sum>
    2000036a:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    20000371:	de 1b 43 
    20000374:	48 f7 e2             	mul    %rdx
    20000377:	48 89 d0             	mov    %rdx,%rax
    2000037a:	48 c1 e8 12          	shr    $0x12,%rax
    2000037e:	48 89 c7             	mov    %rax,%rdi
    20000381:	e8 fb 05 00 00       	call   20000981 <UVM_Print_Int>
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0, sum/1000000, 0);
    20000386:	48 8b 05 93 1c 00 00 	mov    0x1c93(%rip),%rax        # 20002020 <sum>
    2000038d:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    20000394:	de 1b 43 
    20000397:	48 f7 e2             	mul    %rdx
    2000039a:	48 89 d0             	mov    %rdx,%rax
    2000039d:	48 c1 e8 12          	shr    $0x12,%rax
    200003a1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    200003a7:	48 89 c1             	mov    %rax,%rcx
    200003aa:	ba a0 00 00 00       	mov    $0xa0,%edx
    200003af:	be 07 00 00 00       	mov    $0x7,%esi
    200003b4:	bf 04 00 00 00       	mov    $0x4,%edi
    200003b9:	e8 06 0c 00 00       	call   20000fc4 <UVM_Kern_Act>

        sum=0;
    200003be:	48 c7 05 57 1c 00 00 	movq   $0x0,0x1c57(%rip)        # 20002020 <sum>
    200003c5:	00 00 00 00 

        /* Run a raw test before we run anything else */
        for(Count=0;Count<1000000;Count++)
    200003c9:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    200003d0:	00 
    200003d1:	eb 63                	jmp    20000436 <main+0x184>
        {
            start=__UVM_X64_Read_TSC();
    200003d3:	e8 43 fc ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    200003d8:	48 89 05 29 1c 00 00 	mov    %rax,0x1c29(%rip)        # 20002008 <start>
            UVM_Svc(-1,-1,-1,-1);
    200003df:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    200003e6:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    200003ed:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
    200003f4:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
    200003fb:	e8 ed fc ff ff       	call   200000ed <UVM_Svc>
            end=__UVM_X64_Read_TSC();
    20000400:	e8 16 fc ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    20000405:	48 89 05 0c 1c 00 00 	mov    %rax,0x1c0c(%rip)        # 20002018 <end>
            sum+=end-start;
    2000040c:	48 8b 05 05 1c 00 00 	mov    0x1c05(%rip),%rax        # 20002018 <end>
    20000413:	48 8b 15 ee 1b 00 00 	mov    0x1bee(%rip),%rdx        # 20002008 <start>
    2000041a:	48 29 d0             	sub    %rdx,%rax
    2000041d:	48 89 c1             	mov    %rax,%rcx
    20000420:	48 8b 05 f9 1b 00 00 	mov    0x1bf9(%rip),%rax        # 20002020 <sum>
    20000427:	48 01 c8             	add    %rcx,%rax
    2000042a:	48 89 05 ef 1b 00 00 	mov    %rax,0x1bef(%rip)        # 20002020 <sum>
        for(Count=0;Count<1000000;Count++)
    20000431:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    20000436:	48 81 7d f0 3f 42 0f 	cmpq   $0xf423f,-0x10(%rbp)
    2000043d:	00 
    2000043e:	7e 93                	jle    200003d3 <main+0x121>
        }
        UVM_LOG_S("\r\nraw");
    20000440:	bf c1 18 00 20       	mov    $0x200018c1,%edi
    20000445:	e8 01 08 00 00       	call   20000c4b <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
    2000044a:	48 8b 05 cf 1b 00 00 	mov    0x1bcf(%rip),%rax        # 20002020 <sum>
    20000451:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    20000458:	de 1b 43 
    2000045b:	48 f7 e2             	mul    %rdx
    2000045e:	48 89 d0             	mov    %rdx,%rax
    20000461:	48 c1 e8 12          	shr    $0x12,%rax
    20000465:	48 89 c7             	mov    %rax,%rdi
    20000468:	e8 14 05 00 00       	call   20000981 <UVM_Print_Int>
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*2, sum/1000000, 0);
    2000046d:	48 8b 05 ac 1b 00 00 	mov    0x1bac(%rip),%rax        # 20002020 <sum>
    20000474:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    2000047b:	de 1b 43 
    2000047e:	48 f7 e2             	mul    %rdx
    20000481:	48 89 d0             	mov    %rdx,%rax
    20000484:	48 c1 e8 12          	shr    $0x12,%rax
    20000488:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    2000048e:	48 89 c1             	mov    %rax,%rcx
    20000491:	ba 40 01 00 00       	mov    $0x140,%edx
    20000496:	be 07 00 00 00       	mov    $0x7,%esi
    2000049b:	bf 04 00 00 00       	mov    $0x4,%edi
    200004a0:	e8 1f 0b 00 00       	call   20000fc4 <UVM_Kern_Act>

        Cur_Addr=0xFFFF800010000000ULL;//0xFFFF800007000000ULL on phani
    200004a5:	48 b8 00 00 00 10 00 	movabs $0xffff800010000000,%rax
    200004ac:	80 ff ff 
    200004af:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        /* We create this in Kmem1 */
        UVM_ASSERT(UVM_Thd_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD1, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
    200004b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200004b7:	49 89 c1             	mov    %rax,%r9
    200004ba:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
    200004c0:	b9 02 00 00 00       	mov    $0x2,%ecx
    200004c5:	ba 09 00 00 00       	mov    $0x9,%edx
    200004ca:	be 00 80 05 00       	mov    $0x58000,%esi
    200004cf:	bf 00 00 00 00       	mov    $0x0,%edi
    200004d4:	e8 76 0e 00 00       	call   2000134f <UVM_Thd_Crt>
    200004d9:	48 85 c0             	test   %rax,%rax
    200004dc:	79 5c                	jns    2000053a <main+0x288>
    200004de:	bf c8 18 00 20       	mov    $0x200018c8,%edi
    200004e3:	e8 63 07 00 00       	call   20000c4b <UVM_Print_String>
    200004e8:	bf f9 18 00 20       	mov    $0x200018f9,%edi
    200004ed:	e8 59 07 00 00       	call   20000c4b <UVM_Print_String>
    200004f2:	bf 05 19 00 20       	mov    $0x20001905,%edi
    200004f7:	e8 4f 07 00 00       	call   20000c4b <UVM_Print_String>
    200004fc:	bf b4 00 00 00       	mov    $0xb4,%edi
    20000501:	e8 7b 04 00 00       	call   20000981 <UVM_Print_Int>
    20000506:	bf 0d 19 00 20       	mov    $0x2000190d,%edi
    2000050b:	e8 3b 07 00 00       	call   20000c4b <UVM_Print_String>
    20000510:	bf 10 19 00 20       	mov    $0x20001910,%edi
    20000515:	e8 31 07 00 00       	call   20000c4b <UVM_Print_String>
    2000051a:	bf 1c 19 00 20       	mov    $0x2000191c,%edi
    2000051f:	e8 27 07 00 00       	call   20000c4b <UVM_Print_String>
    20000524:	bf 1f 19 00 20       	mov    $0x2000191f,%edi
    20000529:	e8 1d 07 00 00       	call   20000c4b <UVM_Print_String>
    2000052e:	bf 0d 19 00 20       	mov    $0x2000190d,%edi
    20000533:	e8 13 07 00 00       	call   20000c4b <UVM_Print_String>
    20000538:	eb fe                	jmp    20000538 <main+0x286>
        UVM_ASSERT(UVM_Thd_Sched_Bind(TEST_THD1,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
    2000053a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    20000540:	b9 00 00 00 00       	mov    $0x0,%ecx
    20000545:	b8 00 00 00 80       	mov    $0x80000000,%eax
    2000054a:	48 89 c2             	mov    %rax,%rdx
    2000054d:	be 00 80 03 00       	mov    $0x38000,%esi
    20000552:	bf 09 00 00 00       	mov    $0x9,%edi
    20000557:	e8 22 0f 00 00       	call   2000147e <UVM_Thd_Sched_Bind>
    2000055c:	48 85 c0             	test   %rax,%rax
    2000055f:	79 5c                	jns    200005bd <main+0x30b>
    20000561:	bf c8 18 00 20       	mov    $0x200018c8,%edi
    20000566:	e8 e0 06 00 00       	call   20000c4b <UVM_Print_String>
    2000056b:	bf f9 18 00 20       	mov    $0x200018f9,%edi
    20000570:	e8 d6 06 00 00       	call   20000c4b <UVM_Print_String>
    20000575:	bf 05 19 00 20       	mov    $0x20001905,%edi
    2000057a:	e8 cc 06 00 00       	call   20000c4b <UVM_Print_String>
    2000057f:	bf b5 00 00 00       	mov    $0xb5,%edi
    20000584:	e8 f8 03 00 00       	call   20000981 <UVM_Print_Int>
    20000589:	bf 0d 19 00 20       	mov    $0x2000190d,%edi
    2000058e:	e8 b8 06 00 00       	call   20000c4b <UVM_Print_String>
    20000593:	bf 10 19 00 20       	mov    $0x20001910,%edi
    20000598:	e8 ae 06 00 00       	call   20000c4b <UVM_Print_String>
    2000059d:	bf 1c 19 00 20       	mov    $0x2000191c,%edi
    200005a2:	e8 a4 06 00 00       	call   20000c4b <UVM_Print_String>
    200005a7:	bf 1f 19 00 20       	mov    $0x2000191f,%edi
    200005ac:	e8 9a 06 00 00       	call   20000c4b <UVM_Print_String>
    200005b1:	bf 0d 19 00 20       	mov    $0x2000190d,%edi
    200005b6:	e8 90 06 00 00       	call   20000c4b <UVM_Print_String>
    200005bb:	eb fe                	jmp    200005bb <main+0x309>
        UVM_ASSERT(UVM_Thd_Time_Xfer(TEST_THD1,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
    200005bd:	48 b8 fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rax
    200005c4:	ff ff 7f 
    200005c7:	48 89 c2             	mov    %rax,%rdx
    200005ca:	be 00 80 03 00       	mov    $0x38000,%esi
    200005cf:	bf 09 00 00 00       	mov    $0x9,%edi
    200005d4:	e8 a7 0f 00 00       	call   20001580 <UVM_Thd_Time_Xfer>
    200005d9:	48 85 c0             	test   %rax,%rax
    200005dc:	79 5c                	jns    2000063a <main+0x388>
    200005de:	bf c8 18 00 20       	mov    $0x200018c8,%edi
    200005e3:	e8 63 06 00 00       	call   20000c4b <UVM_Print_String>
    200005e8:	bf f9 18 00 20       	mov    $0x200018f9,%edi
    200005ed:	e8 59 06 00 00       	call   20000c4b <UVM_Print_String>
    200005f2:	bf 05 19 00 20       	mov    $0x20001905,%edi
    200005f7:	e8 4f 06 00 00       	call   20000c4b <UVM_Print_String>
    200005fc:	bf b6 00 00 00       	mov    $0xb6,%edi
    20000601:	e8 7b 03 00 00       	call   20000981 <UVM_Print_Int>
    20000606:	bf 0d 19 00 20       	mov    $0x2000190d,%edi
    2000060b:	e8 3b 06 00 00       	call   20000c4b <UVM_Print_String>
    20000610:	bf 10 19 00 20       	mov    $0x20001910,%edi
    20000615:	e8 31 06 00 00       	call   20000c4b <UVM_Print_String>
    2000061a:	bf 1c 19 00 20       	mov    $0x2000191c,%edi
    2000061f:	e8 27 06 00 00       	call   20000c4b <UVM_Print_String>
    20000624:	bf 1f 19 00 20       	mov    $0x2000191f,%edi
    20000629:	e8 1d 06 00 00       	call   20000c4b <UVM_Print_String>
    2000062e:	bf 0d 19 00 20       	mov    $0x2000190d,%edi
    20000633:	e8 13 06 00 00       	call   20000c4b <UVM_Print_String>
    20000638:	eb fe                	jmp    20000638 <main+0x386>
        UVM_ASSERT(UVM_Thd_Exec_Set(TEST_THD1,test,12*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
    2000063a:	b8 7e 01 00 20       	mov    $0x2000017e,%eax
    2000063f:	b9 00 00 00 00       	mov    $0x0,%ecx
    20000644:	ba 00 00 c0 00       	mov    $0xc00000,%edx
    20000649:	48 89 c6             	mov    %rax,%rsi
    2000064c:	bf 09 00 00 00       	mov    $0x9,%edi
    20000651:	e8 aa 0d 00 00       	call   20001400 <UVM_Thd_Exec_Set>
    20000656:	48 85 c0             	test   %rax,%rax
    20000659:	79 5c                	jns    200006b7 <main+0x405>
    2000065b:	bf c8 18 00 20       	mov    $0x200018c8,%edi
    20000660:	e8 e6 05 00 00       	call   20000c4b <UVM_Print_String>
    20000665:	bf f9 18 00 20       	mov    $0x200018f9,%edi
    2000066a:	e8 dc 05 00 00       	call   20000c4b <UVM_Print_String>
    2000066f:	bf 05 19 00 20       	mov    $0x20001905,%edi
    20000674:	e8 d2 05 00 00       	call   20000c4b <UVM_Print_String>
    20000679:	bf b7 00 00 00       	mov    $0xb7,%edi
    2000067e:	e8 fe 02 00 00       	call   20000981 <UVM_Print_Int>
    20000683:	bf 0d 19 00 20       	mov    $0x2000190d,%edi
    20000688:	e8 be 05 00 00       	call   20000c4b <UVM_Print_String>
    2000068d:	bf 10 19 00 20       	mov    $0x20001910,%edi
    20000692:	e8 b4 05 00 00       	call   20000c4b <UVM_Print_String>
    20000697:	bf 1c 19 00 20       	mov    $0x2000191c,%edi
    2000069c:	e8 aa 05 00 00       	call   20000c4b <UVM_Print_String>
    200006a1:	bf 1f 19 00 20       	mov    $0x2000191f,%edi
    200006a6:	e8 a0 05 00 00       	call   20000c4b <UVM_Print_String>
    200006ab:	bf 0d 19 00 20       	mov    $0x2000190d,%edi
    200006b0:	e8 96 05 00 00       	call   20000c4b <UVM_Print_String>
    200006b5:	eb fe                	jmp    200006b5 <main+0x403>

        Cur_Addr+=UVM_THD_SIZE;
    200006b7:	48 81 45 f8 d0 09 00 	addq   $0x9d0,-0x8(%rbp)
    200006be:	00 
        UVM_ASSERT(UVM_Thd_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD2, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
    200006bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200006c3:	49 89 c1             	mov    %rax,%r9
    200006c6:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
    200006cc:	b9 02 00 00 00       	mov    $0x2,%ecx
    200006d1:	ba 0a 00 00 00       	mov    $0xa,%edx
    200006d6:	be 00 80 05 00       	mov    $0x58000,%esi
    200006db:	bf 00 00 00 00       	mov    $0x0,%edi
    200006e0:	e8 6a 0c 00 00       	call   2000134f <UVM_Thd_Crt>
    200006e5:	48 85 c0             	test   %rax,%rax
    200006e8:	79 5c                	jns    20000746 <main+0x494>
    200006ea:	bf c8 18 00 20       	mov    $0x200018c8,%edi
    200006ef:	e8 57 05 00 00       	call   20000c4b <UVM_Print_String>
    200006f4:	bf f9 18 00 20       	mov    $0x200018f9,%edi
    200006f9:	e8 4d 05 00 00       	call   20000c4b <UVM_Print_String>
    200006fe:	bf 05 19 00 20       	mov    $0x20001905,%edi
    20000703:	e8 43 05 00 00       	call   20000c4b <UVM_Print_String>
    20000708:	bf ba 00 00 00       	mov    $0xba,%edi
    2000070d:	e8 6f 02 00 00       	call   20000981 <UVM_Print_Int>
    20000712:	bf 0d 19 00 20       	mov    $0x2000190d,%edi
    20000717:	e8 2f 05 00 00       	call   20000c4b <UVM_Print_String>
    2000071c:	bf 10 19 00 20       	mov    $0x20001910,%edi
    20000721:	e8 25 05 00 00       	call   20000c4b <UVM_Print_String>
    20000726:	bf 1c 19 00 20       	mov    $0x2000191c,%edi
    2000072b:	e8 1b 05 00 00       	call   20000c4b <UVM_Print_String>
    20000730:	bf 1f 19 00 20       	mov    $0x2000191f,%edi
    20000735:	e8 11 05 00 00       	call   20000c4b <UVM_Print_String>
    2000073a:	bf 0d 19 00 20       	mov    $0x2000190d,%edi
    2000073f:	e8 07 05 00 00       	call   20000c4b <UVM_Print_String>
    20000744:	eb fe                	jmp    20000744 <main+0x492>
        UVM_ASSERT(UVM_Thd_Sched_Bind(TEST_THD2,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
    20000746:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    2000074c:	b9 00 00 00 00       	mov    $0x0,%ecx
    20000751:	b8 00 00 00 80       	mov    $0x80000000,%eax
    20000756:	48 89 c2             	mov    %rax,%rdx
    20000759:	be 00 80 03 00       	mov    $0x38000,%esi
    2000075e:	bf 0a 00 00 00       	mov    $0xa,%edi
    20000763:	e8 16 0d 00 00       	call   2000147e <UVM_Thd_Sched_Bind>
    20000768:	48 85 c0             	test   %rax,%rax
    2000076b:	79 5c                	jns    200007c9 <main+0x517>
    2000076d:	bf c8 18 00 20       	mov    $0x200018c8,%edi
    20000772:	e8 d4 04 00 00       	call   20000c4b <UVM_Print_String>
    20000777:	bf f9 18 00 20       	mov    $0x200018f9,%edi
    2000077c:	e8 ca 04 00 00       	call   20000c4b <UVM_Print_String>
    20000781:	bf 05 19 00 20       	mov    $0x20001905,%edi
    20000786:	e8 c0 04 00 00       	call   20000c4b <UVM_Print_String>
    2000078b:	bf bb 00 00 00       	mov    $0xbb,%edi
    20000790:	e8 ec 01 00 00       	call   20000981 <UVM_Print_Int>
    20000795:	bf 0d 19 00 20       	mov    $0x2000190d,%edi
    2000079a:	e8 ac 04 00 00       	call   20000c4b <UVM_Print_String>
    2000079f:	bf 10 19 00 20       	mov    $0x20001910,%edi
    200007a4:	e8 a2 04 00 00       	call   20000c4b <UVM_Print_String>
    200007a9:	bf 1c 19 00 20       	mov    $0x2000191c,%edi
    200007ae:	e8 98 04 00 00       	call   20000c4b <UVM_Print_String>
    200007b3:	bf 1f 19 00 20       	mov    $0x2000191f,%edi
    200007b8:	e8 8e 04 00 00       	call   20000c4b <UVM_Print_String>
    200007bd:	bf 0d 19 00 20       	mov    $0x2000190d,%edi
    200007c2:	e8 84 04 00 00       	call   20000c4b <UVM_Print_String>
    200007c7:	eb fe                	jmp    200007c7 <main+0x515>
        UVM_ASSERT(UVM_Thd_Time_Xfer(TEST_THD2,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
    200007c9:	48 b8 fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rax
    200007d0:	ff ff 7f 
    200007d3:	48 89 c2             	mov    %rax,%rdx
    200007d6:	be 00 80 03 00       	mov    $0x38000,%esi
    200007db:	bf 0a 00 00 00       	mov    $0xa,%edi
    200007e0:	e8 9b 0d 00 00       	call   20001580 <UVM_Thd_Time_Xfer>
    200007e5:	48 85 c0             	test   %rax,%rax
    200007e8:	79 5c                	jns    20000846 <main+0x594>
    200007ea:	bf c8 18 00 20       	mov    $0x200018c8,%edi
    200007ef:	e8 57 04 00 00       	call   20000c4b <UVM_Print_String>
    200007f4:	bf f9 18 00 20       	mov    $0x200018f9,%edi
    200007f9:	e8 4d 04 00 00       	call   20000c4b <UVM_Print_String>
    200007fe:	bf 05 19 00 20       	mov    $0x20001905,%edi
    20000803:	e8 43 04 00 00       	call   20000c4b <UVM_Print_String>
    20000808:	bf bc 00 00 00       	mov    $0xbc,%edi
    2000080d:	e8 6f 01 00 00       	call   20000981 <UVM_Print_Int>
    20000812:	bf 0d 19 00 20       	mov    $0x2000190d,%edi
    20000817:	e8 2f 04 00 00       	call   20000c4b <UVM_Print_String>
    2000081c:	bf 10 19 00 20       	mov    $0x20001910,%edi
    20000821:	e8 25 04 00 00       	call   20000c4b <UVM_Print_String>
    20000826:	bf 1c 19 00 20       	mov    $0x2000191c,%edi
    2000082b:	e8 1b 04 00 00       	call   20000c4b <UVM_Print_String>
    20000830:	bf 1f 19 00 20       	mov    $0x2000191f,%edi
    20000835:	e8 11 04 00 00       	call   20000c4b <UVM_Print_String>
    2000083a:	bf 0d 19 00 20       	mov    $0x2000190d,%edi
    2000083f:	e8 07 04 00 00       	call   20000c4b <UVM_Print_String>
    20000844:	eb fe                	jmp    20000844 <main+0x592>
        UVM_ASSERT(UVM_Thd_Exec_Set(TEST_THD2,test2,13*UVM_POW2(RME_PGT_SIZE_1M),1)>=0);
    20000846:	b8 61 02 00 20       	mov    $0x20000261,%eax
    2000084b:	b9 01 00 00 00       	mov    $0x1,%ecx
    20000850:	ba 00 00 d0 00       	mov    $0xd00000,%edx
    20000855:	48 89 c6             	mov    %rax,%rsi
    20000858:	bf 0a 00 00 00       	mov    $0xa,%edi
    2000085d:	e8 9e 0b 00 00       	call   20001400 <UVM_Thd_Exec_Set>
    20000862:	48 85 c0             	test   %rax,%rax
    20000865:	79 5c                	jns    200008c3 <main+0x611>
    20000867:	bf c8 18 00 20       	mov    $0x200018c8,%edi
    2000086c:	e8 da 03 00 00       	call   20000c4b <UVM_Print_String>
    20000871:	bf f9 18 00 20       	mov    $0x200018f9,%edi
    20000876:	e8 d0 03 00 00       	call   20000c4b <UVM_Print_String>
    2000087b:	bf 05 19 00 20       	mov    $0x20001905,%edi
    20000880:	e8 c6 03 00 00       	call   20000c4b <UVM_Print_String>
    20000885:	bf bd 00 00 00       	mov    $0xbd,%edi
    2000088a:	e8 f2 00 00 00       	call   20000981 <UVM_Print_Int>
    2000088f:	bf 0d 19 00 20       	mov    $0x2000190d,%edi
    20000894:	e8 b2 03 00 00       	call   20000c4b <UVM_Print_String>
    20000899:	bf 10 19 00 20       	mov    $0x20001910,%edi
    2000089e:	e8 a8 03 00 00       	call   20000c4b <UVM_Print_String>
    200008a3:	bf 1c 19 00 20       	mov    $0x2000191c,%edi
    200008a8:	e8 9e 03 00 00       	call   20000c4b <UVM_Print_String>
    200008ad:	bf 1f 19 00 20       	mov    $0x2000191f,%edi
    200008b2:	e8 94 03 00 00       	call   20000c4b <UVM_Print_String>
    200008b7:	bf 0d 19 00 20       	mov    $0x2000190d,%edi
    200008bc:	e8 8a 03 00 00       	call   20000c4b <UVM_Print_String>
    200008c1:	eb fe                	jmp    200008c1 <main+0x60f>

        UVM_Thd_Swt(TEST_THD1,0);
    200008c3:	be 00 00 00 00       	mov    $0x0,%esi
    200008c8:	bf 09 00 00 00       	mov    $0x9,%edi
    200008cd:	e8 e9 0c 00 00       	call   200015bb <UVM_Thd_Swt>
        UVM_LOG_S("\r\nShould not get here");
    200008d2:	bf 28 19 00 20       	mov    $0x20001928,%edi
    200008d7:	e8 6f 03 00 00       	call   20000c4b <UVM_Print_String>
        while(1);
    200008dc:	eb fe                	jmp    200008dc <main+0x62a>
core-local ctxsw wrt.cores
core-local IPC wrt.cores
map/unmap pages wrt.cores
WCIRT*/

    while(1);
    200008de:	eb fe                	jmp    200008de <main+0x62c>

00000000200008e0 <UVM_List_Crt>:
Input       : volatile struct UVM_List* Head - The pointer to the list head.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Crt(volatile struct UVM_List* Head)
{
    200008e0:	f3 0f 1e fa          	endbr64 
    200008e4:	55                   	push   %rbp
    200008e5:	48 89 e5             	mov    %rsp,%rbp
    200008e8:	48 83 ec 08          	sub    $0x8,%rsp
    200008ec:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    Head->Prev=(struct UVM_List*)Head;
    200008f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200008f4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    200008f8:	48 89 10             	mov    %rdx,(%rax)
    Head->Next=(struct UVM_List*)Head;
    200008fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200008ff:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000903:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
    20000907:	90                   	nop
    20000908:	c9                   	leave  
    20000909:	c3                   	ret    

000000002000090a <UVM_List_Del>:
              volatile struct UVM_List* Next - The next node of the target node.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Del(volatile struct UVM_List* Prev,volatile struct UVM_List* Next)
{
    2000090a:	f3 0f 1e fa          	endbr64 
    2000090e:	55                   	push   %rbp
    2000090f:	48 89 e5             	mov    %rsp,%rbp
    20000912:	48 83 ec 10          	sub    $0x10,%rsp
    20000916:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000091a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    Next->Prev=(struct UVM_List*)Prev;
    2000091e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000922:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000926:	48 89 10             	mov    %rdx,(%rax)
    Prev->Next=(struct UVM_List*)Next;
    20000929:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000092d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20000931:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
    20000935:	90                   	nop
    20000936:	c9                   	leave  
    20000937:	c3                   	ret    

0000000020000938 <UVM_List_Ins>:
Return      : None.
******************************************************************************/
void UVM_List_Ins(volatile struct UVM_List* New,
                  volatile struct UVM_List* Prev,
                  volatile struct UVM_List* Next)
{
    20000938:	f3 0f 1e fa          	endbr64 
    2000093c:	55                   	push   %rbp
    2000093d:	48 89 e5             	mov    %rsp,%rbp
    20000940:	48 83 ec 18          	sub    $0x18,%rsp
    20000944:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000948:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2000094c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    Next->Prev=(struct UVM_List*)New;
    20000950:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000954:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000958:	48 89 10             	mov    %rdx,(%rax)
    New->Next=(struct UVM_List*)Next;
    2000095b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000095f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20000963:	48 89 50 08          	mov    %rdx,0x8(%rax)
    New->Prev=(struct UVM_List*)Prev;
    20000967:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000096b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    2000096f:	48 89 10             	mov    %rdx,(%rax)
    Prev->Next=(struct UVM_List*)New;
    20000972:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000976:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    2000097a:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
    2000097e:	90                   	nop
    2000097f:	c9                   	leave  
    20000980:	c3                   	ret    

0000000020000981 <UVM_Print_Int>:
Input       : cnt_t Int - The integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Int(cnt_t Int)
{
    20000981:	f3 0f 1e fa          	endbr64 
    20000985:	55                   	push   %rbp
    20000986:	48 89 e5             	mov    %rsp,%rbp
    20000989:	48 83 ec 30          	sub    $0x30,%rsp
    2000098d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    cnt_t Count;
    cnt_t Num;
    ptr_t Div;
    
    /* how many digits are there? */
    if(Int==0)
    20000991:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
    20000996:	75 14                	jne    200009ac <UVM_Print_Int+0x2b>
    {
        UVM_Putchar('0');
    20000998:	bf 30 00 00 00       	mov    $0x30,%edi
    2000099d:	e8 39 0e 00 00       	call   200017db <UVM_Putchar>
        return 1;
    200009a2:	b8 01 00 00 00       	mov    $0x1,%eax
    200009a7:	e9 d8 01 00 00       	jmp    20000b84 <UVM_Print_Int+0x203>
    }
    else if(Int<0)
    200009ac:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
    200009b1:	0f 89 f1 00 00 00    	jns    20000aa8 <UVM_Print_Int+0x127>
    {
        /* How many digits are there? */
        Count=0;
    200009b7:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    200009be:	00 
        Div=1;
    200009bf:	48 c7 45 e0 01 00 00 	movq   $0x1,-0x20(%rbp)
    200009c6:	00 
        Iter=-Int;
    200009c7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    200009cb:	48 f7 d8             	neg    %rax
    200009ce:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while(Iter!=0)
    200009d2:	eb 36                	jmp    20000a0a <UVM_Print_Int+0x89>
        {
            Iter/=10;
    200009d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200009d8:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    200009df:	cc cc cc 
    200009e2:	48 f7 e2             	mul    %rdx
    200009e5:	48 89 d0             	mov    %rdx,%rax
    200009e8:	48 c1 e8 03          	shr    $0x3,%rax
    200009ec:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            Count++;
    200009f0:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
            Div*=10;
    200009f5:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    200009f9:	48 89 d0             	mov    %rdx,%rax
    200009fc:	48 c1 e0 02          	shl    $0x2,%rax
    20000a00:	48 01 d0             	add    %rdx,%rax
    20000a03:	48 01 c0             	add    %rax,%rax
    20000a06:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Iter!=0)
    20000a0a:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    20000a0f:	75 c3                	jne    200009d4 <UVM_Print_Int+0x53>
        }
        Div/=10;
    20000a11:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000a15:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000a1c:	cc cc cc 
    20000a1f:	48 f7 e2             	mul    %rdx
    20000a22:	48 89 d0             	mov    %rdx,%rax
    20000a25:	48 c1 e8 03          	shr    $0x3,%rax
    20000a29:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        
        UVM_Putchar('-');
    20000a2d:	bf 2d 00 00 00       	mov    $0x2d,%edi
    20000a32:	e8 a4 0d 00 00       	call   200017db <UVM_Putchar>
        Iter=-Int;
    20000a37:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000a3b:	48 f7 d8             	neg    %rax
    20000a3e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        Num=Count+1;
    20000a42:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000a46:	48 83 c0 01          	add    $0x1,%rax
    20000a4a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        
        while(Count>0)
    20000a4e:	eb 4c                	jmp    20000a9c <UVM_Print_Int+0x11b>
        {
            Count--;
    20000a50:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            UVM_Putchar(Iter/Div+'0');
    20000a55:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000a59:	ba 00 00 00 00       	mov    $0x0,%edx
    20000a5e:	48 f7 75 e0          	divq   -0x20(%rbp)
    20000a62:	83 c0 30             	add    $0x30,%eax
    20000a65:	0f be c0             	movsbl %al,%eax
    20000a68:	89 c7                	mov    %eax,%edi
    20000a6a:	e8 6c 0d 00 00       	call   200017db <UVM_Putchar>
            Iter=Iter%Div;
    20000a6f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000a73:	ba 00 00 00 00       	mov    $0x0,%edx
    20000a78:	48 f7 75 e0          	divq   -0x20(%rbp)
    20000a7c:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
            Div/=10;
    20000a80:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000a84:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000a8b:	cc cc cc 
    20000a8e:	48 f7 e2             	mul    %rdx
    20000a91:	48 89 d0             	mov    %rdx,%rax
    20000a94:	48 c1 e8 03          	shr    $0x3,%rax
    20000a98:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Count>0)
    20000a9c:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    20000aa1:	7f ad                	jg     20000a50 <UVM_Print_Int+0xcf>
    20000aa3:	e9 d8 00 00 00       	jmp    20000b80 <UVM_Print_Int+0x1ff>
        }
    }
    else
    {
        /* How many digits are there? */
        Count=0;
    20000aa8:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    20000aaf:	00 
        Div=1;
    20000ab0:	48 c7 45 e0 01 00 00 	movq   $0x1,-0x20(%rbp)
    20000ab7:	00 
        Iter=Int;
    20000ab8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000abc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while(Iter!=0)
    20000ac0:	eb 36                	jmp    20000af8 <UVM_Print_Int+0x177>
        {
            Iter/=10;
    20000ac2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000ac6:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000acd:	cc cc cc 
    20000ad0:	48 f7 e2             	mul    %rdx
    20000ad3:	48 89 d0             	mov    %rdx,%rax
    20000ad6:	48 c1 e8 03          	shr    $0x3,%rax
    20000ada:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            Count++;
    20000ade:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
            Div*=10;
    20000ae3:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    20000ae7:	48 89 d0             	mov    %rdx,%rax
    20000aea:	48 c1 e0 02          	shl    $0x2,%rax
    20000aee:	48 01 d0             	add    %rdx,%rax
    20000af1:	48 01 c0             	add    %rax,%rax
    20000af4:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Iter!=0)
    20000af8:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    20000afd:	75 c3                	jne    20000ac2 <UVM_Print_Int+0x141>
        }
        Div/=10;
    20000aff:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000b03:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000b0a:	cc cc cc 
    20000b0d:	48 f7 e2             	mul    %rdx
    20000b10:	48 89 d0             	mov    %rdx,%rax
    20000b13:	48 c1 e8 03          	shr    $0x3,%rax
    20000b17:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        
        Iter=Int;
    20000b1b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000b1f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        Num=Count;
    20000b23:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000b27:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        
        while(Count>0)
    20000b2b:	eb 4c                	jmp    20000b79 <UVM_Print_Int+0x1f8>
        {
            Count--;
    20000b2d:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            UVM_Putchar(Iter/Div+'0');
    20000b32:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000b36:	ba 00 00 00 00       	mov    $0x0,%edx
    20000b3b:	48 f7 75 e0          	divq   -0x20(%rbp)
    20000b3f:	83 c0 30             	add    $0x30,%eax
    20000b42:	0f be c0             	movsbl %al,%eax
    20000b45:	89 c7                	mov    %eax,%edi
    20000b47:	e8 8f 0c 00 00       	call   200017db <UVM_Putchar>
            Iter=Iter%Div;
    20000b4c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000b50:	ba 00 00 00 00       	mov    $0x0,%edx
    20000b55:	48 f7 75 e0          	divq   -0x20(%rbp)
    20000b59:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
            Div/=10;
    20000b5d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000b61:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000b68:	cc cc cc 
    20000b6b:	48 f7 e2             	mul    %rdx
    20000b6e:	48 89 d0             	mov    %rdx,%rax
    20000b71:	48 c1 e8 03          	shr    $0x3,%rax
    20000b75:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Count>0)
    20000b79:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    20000b7e:	7f ad                	jg     20000b2d <UVM_Print_Int+0x1ac>
        }
    }
    
    return Num;
    20000b80:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
    20000b84:	c9                   	leave  
    20000b85:	c3                   	ret    

0000000020000b86 <UVM_Print_Uint>:
Input       : ptr_t Uint - The unsigned integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Uint(ptr_t Uint)
{
    20000b86:	f3 0f 1e fa          	endbr64 
    20000b8a:	55                   	push   %rbp
    20000b8b:	48 89 e5             	mov    %rsp,%rbp
    20000b8e:	48 83 ec 30          	sub    $0x30,%rsp
    20000b92:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    ptr_t Iter;
    cnt_t Count;
    cnt_t Num;
    
    /* how many digits are there? */
    if(Uint==0)
    20000b96:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
    20000b9b:	75 14                	jne    20000bb1 <UVM_Print_Uint+0x2b>
    {
        UVM_Putchar('0');
    20000b9d:	bf 30 00 00 00       	mov    $0x30,%edi
    20000ba2:	e8 34 0c 00 00       	call   200017db <UVM_Putchar>
        return 1;
    20000ba7:	b8 01 00 00 00       	mov    $0x1,%eax
    20000bac:	e9 98 00 00 00       	jmp    20000c49 <UVM_Print_Uint+0xc3>
    }
    else
    {
        /* Filter out all the zeroes */
        Count=0;
    20000bb1:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    20000bb8:	00 
        Iter=Uint;
    20000bb9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000bbd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    20000bc1:	eb 0a                	jmp    20000bcd <UVM_Print_Uint+0x47>
        {
            Iter<<=4;
    20000bc3:	48 c1 65 f8 04       	shlq   $0x4,-0x8(%rbp)
            Count++;
    20000bc8:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    20000bcd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000bd1:	48 c1 e8 3c          	shr    $0x3c,%rax
    20000bd5:	48 85 c0             	test   %rax,%rax
    20000bd8:	74 e9                	je     20000bc3 <UVM_Print_Uint+0x3d>
        }
        /* Count is the number of pts to print */
        Count=sizeof(ptr_t)*2-Count;
    20000bda:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20000bde:	b8 10 00 00 00       	mov    $0x10,%eax
    20000be3:	48 29 d0             	sub    %rdx,%rax
    20000be6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        Num=Count;
    20000bea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000bee:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        while(Count>0)
    20000bf2:	eb 4a                	jmp    20000c3e <UVM_Print_Uint+0xb8>
        {
            Count--;
    20000bf4:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            Iter=(Uint>>(Count*4))&0x0F;
    20000bf9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000bfd:	c1 e0 02             	shl    $0x2,%eax
    20000c00:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    20000c04:	89 c1                	mov    %eax,%ecx
    20000c06:	48 d3 ea             	shr    %cl,%rdx
    20000c09:	48 89 d0             	mov    %rdx,%rax
    20000c0c:	83 e0 0f             	and    $0xf,%eax
    20000c0f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            if(Iter<10)
    20000c13:	48 83 7d f8 09       	cmpq   $0x9,-0x8(%rbp)
    20000c18:	77 13                	ja     20000c2d <UVM_Print_Uint+0xa7>
                UVM_Putchar('0'+Iter);
    20000c1a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000c1e:	83 c0 30             	add    $0x30,%eax
    20000c21:	0f be c0             	movsbl %al,%eax
    20000c24:	89 c7                	mov    %eax,%edi
    20000c26:	e8 b0 0b 00 00       	call   200017db <UVM_Putchar>
    20000c2b:	eb 11                	jmp    20000c3e <UVM_Print_Uint+0xb8>
            else
                UVM_Putchar('A'+Iter-10);
    20000c2d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000c31:	83 c0 37             	add    $0x37,%eax
    20000c34:	0f be c0             	movsbl %al,%eax
    20000c37:	89 c7                	mov    %eax,%edi
    20000c39:	e8 9d 0b 00 00       	call   200017db <UVM_Putchar>
        while(Count>0)
    20000c3e:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    20000c43:	7f af                	jg     20000bf4 <UVM_Print_Uint+0x6e>
        }
    }
    
    return Num;
    20000c45:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
    20000c49:	c9                   	leave  
    20000c4a:	c3                   	ret    

0000000020000c4b <UVM_Print_String>:
Input       : s8* String - The string to print.
Output      : None.
Return      : cnt_t - The length of the string printed, the '\0' is not included.
******************************************************************************/
cnt_t UVM_Print_String(s8* String)
{
    20000c4b:	f3 0f 1e fa          	endbr64 
    20000c4f:	55                   	push   %rbp
    20000c50:	48 89 e5             	mov    %rsp,%rbp
    20000c53:	48 83 ec 20          	sub    $0x20,%rsp
    20000c57:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    cnt_t Count;
    
    Count=0;
    20000c5b:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    20000c62:	00 
    while(Count<UVM_USER_DEBUG_MAX_STR)
    20000c63:	eb 35                	jmp    20000c9a <UVM_Print_String+0x4f>
    {
        if(String[Count]=='\0')
    20000c65:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000c69:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000c6d:	48 01 d0             	add    %rdx,%rax
    20000c70:	0f b6 00             	movzbl (%rax),%eax
    20000c73:	84 c0                	test   %al,%al
    20000c75:	74 2c                	je     20000ca3 <UVM_Print_String+0x58>
            break;
        
        UVM_Putchar(String[Count++]);
    20000c77:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000c7b:	48 8d 50 01          	lea    0x1(%rax),%rdx
    20000c7f:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
    20000c83:	48 89 c2             	mov    %rax,%rdx
    20000c86:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000c8a:	48 01 d0             	add    %rdx,%rax
    20000c8d:	0f b6 00             	movzbl (%rax),%eax
    20000c90:	0f be c0             	movsbl %al,%eax
    20000c93:	89 c7                	mov    %eax,%edi
    20000c95:	e8 41 0b 00 00       	call   200017db <UVM_Putchar>
    while(Count<UVM_USER_DEBUG_MAX_STR)
    20000c9a:	48 83 7d f8 7f       	cmpq   $0x7f,-0x8(%rbp)
    20000c9f:	7e c4                	jle    20000c65 <UVM_Print_String+0x1a>
    20000ca1:	eb 01                	jmp    20000ca4 <UVM_Print_String+0x59>
            break;
    20000ca3:	90                   	nop
    }
    
    return Count;
    20000ca4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
    20000ca8:	c9                   	leave  
    20000ca9:	c3                   	ret    

0000000020000caa <UVM_Captbl_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, 
                     cid_t Cap_Captbl, ptr_t Vaddr, ptr_t Entry_Num)
{
    20000caa:	f3 0f 1e fa          	endbr64 
    20000cae:	55                   	push   %rbp
    20000caf:	48 89 e5             	mov    %rsp,%rbp
    20000cb2:	48 83 ec 30          	sub    $0x30,%rsp
    20000cb6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000cba:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000cbe:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20000cc2:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20000cc6:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_CRT, Cap_Captbl_Crt,
    20000cca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000cce:	48 c1 e0 20          	shl    $0x20,%rax
    20000cd2:	48 89 c2             	mov    %rax,%rdx
    20000cd5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000cd9:	89 c0                	mov    %eax,%eax
    20000cdb:	48 89 d6             	mov    %rdx,%rsi
    20000cde:	48 09 c6             	or     %rax,%rsi
    20000ce1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000ce5:	48 ba 00 00 00 00 0a 	movabs $0xa00000000,%rdx
    20000cec:	00 00 00 
    20000cef:	48 09 d0             	or     %rdx,%rax
    20000cf2:	48 89 c7             	mov    %rax,%rdi
    20000cf5:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    20000cf9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000cfd:	48 89 d1             	mov    %rdx,%rcx
    20000d00:	48 89 c2             	mov    %rax,%rdx
    20000d03:	e8 e5 f3 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Captbl),
                      Vaddr,
                      Entry_Num);
}
    20000d08:	c9                   	leave  
    20000d09:	c3                   	ret    

0000000020000d0a <UVM_Captbl_Del>:
              cid_t Cap_Del - The capability to the capability table to be deleted. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Del(cid_t Cap_Captbl_Del, cid_t Cap_Del)
{
    20000d0a:	f3 0f 1e fa          	endbr64 
    20000d0e:	55                   	push   %rbp
    20000d0f:	48 89 e5             	mov    %rsp,%rbp
    20000d12:	48 83 ec 10          	sub    $0x10,%rsp
    20000d16:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000d1a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_DEL, Cap_Captbl_Del,
    20000d1e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000d22:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000d26:	48 b9 00 00 00 00 0b 	movabs $0xb00000000,%rcx
    20000d2d:	00 00 00 
    20000d30:	48 09 ca             	or     %rcx,%rdx
    20000d33:	48 89 d7             	mov    %rdx,%rdi
    20000d36:	b9 00 00 00 00       	mov    $0x0,%ecx
    20000d3b:	ba 00 00 00 00       	mov    $0x0,%edx
    20000d40:	48 89 c6             	mov    %rax,%rsi
    20000d43:	e8 a5 f3 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Del,
                      0,
                      0);
}
    20000d48:	c9                   	leave  
    20000d49:	c3                   	ret    

0000000020000d4a <UVM_Captbl_Frz>:
              cid_t Cap_Frz - The cap to the kernel object being freezed. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Frz(cid_t Cap_Captbl_Frz, cid_t Cap_Frz)
{
    20000d4a:	f3 0f 1e fa          	endbr64 
    20000d4e:	55                   	push   %rbp
    20000d4f:	48 89 e5             	mov    %rsp,%rbp
    20000d52:	48 83 ec 10          	sub    $0x10,%rsp
    20000d56:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000d5a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
        return UVM_CAP_OP(RME_SVC_CPT_FRZ, Cap_Captbl_Frz,
    20000d5e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000d62:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000d66:	48 b9 00 00 00 00 0c 	movabs $0xc00000000,%rcx
    20000d6d:	00 00 00 
    20000d70:	48 09 ca             	or     %rcx,%rdx
    20000d73:	48 89 d7             	mov    %rdx,%rdi
    20000d76:	b9 00 00 00 00       	mov    $0x0,%ecx
    20000d7b:	ba 00 00 00 00       	mov    $0x0,%edx
    20000d80:	48 89 c6             	mov    %rax,%rsi
    20000d83:	e8 65 f3 ff ff       	call   200000ed <UVM_Svc>
                          Cap_Frz,
                          0,
                          0);
}
    20000d88:	c9                   	leave  
    20000d89:	c3                   	ret    

0000000020000d8a <UVM_Captbl_Add>:
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Add(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                     cid_t Cap_Captbl_Src, cid_t Cap_Src, ptr_t Flags)
{
    20000d8a:	f3 0f 1e fa          	endbr64 
    20000d8e:	55                   	push   %rbp
    20000d8f:	48 89 e5             	mov    %rsp,%rbp
    20000d92:	48 83 ec 30          	sub    $0x30,%rsp
    20000d96:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000d9a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000d9e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20000da2:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20000da6:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    20000daa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000dae:	48 c1 e0 20          	shl    $0x20,%rax
    20000db2:	48 89 c2             	mov    %rax,%rdx
    20000db5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000db9:	89 c0                	mov    %eax,%eax
    20000dbb:	48 09 c2             	or     %rax,%rdx
    20000dbe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000dc2:	48 c1 e0 20          	shl    $0x20,%rax
    20000dc6:	48 89 c1             	mov    %rax,%rcx
    20000dc9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000dcd:	89 c0                	mov    %eax,%eax
    20000dcf:	48 09 c1             	or     %rax,%rcx
    20000dd2:	48 89 ce             	mov    %rcx,%rsi
    20000dd5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000dd9:	48 89 c1             	mov    %rax,%rcx
    20000ddc:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    20000de3:	00 00 00 
    20000de6:	48 89 c7             	mov    %rax,%rdi
    20000de9:	e8 ff f2 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),Flags);
}
    20000dee:	c9                   	leave  
    20000def:	c3                   	ret    

0000000020000df0 <UVM_Captbl_Pgtbl>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Pgtbl(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                       cid_t Cap_Captbl_Src, cid_t Cap_Src,
                       ptr_t Start, ptr_t End, ptr_t Flags)
{
    20000df0:	f3 0f 1e fa          	endbr64 
    20000df4:	55                   	push   %rbp
    20000df5:	48 89 e5             	mov    %rsp,%rbp
    20000df8:	48 83 ec 30          	sub    $0x30,%rsp
    20000dfc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000e00:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000e04:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20000e08:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20000e0c:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    20000e10:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    20000e14:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20000e18:	48 c1 e0 24          	shl    $0x24,%rax
    20000e1c:	48 89 c2             	mov    %rax,%rdx
    20000e1f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000e23:	48 c1 e0 08          	shl    $0x8,%rax
    20000e27:	48 09 d0             	or     %rdx,%rax
    20000e2a:	48 0b 45 10          	or     0x10(%rbp),%rax
    20000e2e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20000e32:	48 89 d1             	mov    %rdx,%rcx
    20000e35:	48 c1 e1 20          	shl    $0x20,%rcx
    20000e39:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    20000e3d:	89 d2                	mov    %edx,%edx
    20000e3f:	48 09 ca             	or     %rcx,%rdx
    20000e42:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    20000e46:	48 89 ce             	mov    %rcx,%rsi
    20000e49:	48 c1 e6 20          	shl    $0x20,%rsi
    20000e4d:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    20000e51:	89 c9                	mov    %ecx,%ecx
    20000e53:	48 09 ce             	or     %rcx,%rsi
    20000e56:	48 89 c1             	mov    %rax,%rcx
    20000e59:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    20000e60:	00 00 00 
    20000e63:	48 89 c7             	mov    %rax,%rdi
    20000e66:	e8 82 f2 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_PGTBL_FLAG(End,Start,Flags));
}
    20000e6b:	c9                   	leave  
    20000e6c:	c3                   	ret    

0000000020000e6d <UVM_Captbl_Kern>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kern(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End)
{
    20000e6d:	f3 0f 1e fa          	endbr64 
    20000e71:	55                   	push   %rbp
    20000e72:	48 89 e5             	mov    %rsp,%rbp
    20000e75:	48 83 ec 30          	sub    $0x30,%rsp
    20000e79:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000e7d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000e81:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20000e85:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20000e89:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    20000e8d:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    20000e91:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20000e95:	48 c1 e0 20          	shl    $0x20,%rax
    20000e99:	48 0b 45 d8          	or     -0x28(%rbp),%rax
    20000e9d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20000ea1:	48 c1 e2 20          	shl    $0x20,%rdx
    20000ea5:	48 89 d1             	mov    %rdx,%rcx
    20000ea8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    20000eac:	89 d2                	mov    %edx,%edx
    20000eae:	48 09 ca             	or     %rcx,%rdx
    20000eb1:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    20000eb5:	48 89 ce             	mov    %rcx,%rsi
    20000eb8:	48 c1 e6 20          	shl    $0x20,%rsi
    20000ebc:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    20000ec0:	89 c9                	mov    %ecx,%ecx
    20000ec2:	48 09 ce             	or     %rcx,%rsi
    20000ec5:	48 89 c1             	mov    %rax,%rcx
    20000ec8:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    20000ecf:	00 00 00 
    20000ed2:	48 89 c7             	mov    %rax,%rdi
    20000ed5:	e8 13 f2 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_KERN_FLAG(End,Start));
}
    20000eda:	c9                   	leave  
    20000edb:	c3                   	ret    

0000000020000edc <UVM_Captbl_Kmem>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kmem(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End, ptr_t Flags)
{
    20000edc:	f3 0f 1e fa          	endbr64 
    20000ee0:	55                   	push   %rbp
    20000ee1:	48 89 e5             	mov    %rsp,%rbp
    20000ee4:	48 83 ec 30          	sub    $0x30,%rsp
    20000ee8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000eec:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000ef0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20000ef4:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20000ef8:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    20000efc:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(UVM_KMEM_SVC(End,RME_SVC_CPT_ADD), UVM_KMEM_CAPID(Start,Flags),
    20000f00:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
    20000f07:	ff ff ff 
    20000f0a:	48 23 45 d0          	and    -0x30(%rbp),%rax
    20000f0e:	48 89 c2             	mov    %rax,%rdx
    20000f11:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000f15:	48 c1 e8 20          	shr    $0x20,%rax
    20000f19:	48 89 d1             	mov    %rdx,%rcx
    20000f1c:	48 09 c1             	or     %rax,%rcx
    20000f1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000f23:	48 c1 e0 20          	shl    $0x20,%rax
    20000f27:	48 89 c2             	mov    %rax,%rdx
    20000f2a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000f2e:	89 c0                	mov    %eax,%eax
    20000f30:	48 09 c2             	or     %rax,%rdx
    20000f33:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000f37:	48 c1 e0 20          	shl    $0x20,%rax
    20000f3b:	48 89 c6             	mov    %rax,%rsi
    20000f3e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000f42:	89 c0                	mov    %eax,%eax
    20000f44:	48 09 c6             	or     %rax,%rsi
    20000f47:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20000f4b:	48 c1 e8 06          	shr    $0x6,%rax
    20000f4f:	48 c1 e0 26          	shl    $0x26,%rax
    20000f53:	48 89 c7             	mov    %rax,%rdi
    20000f56:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000f5a:	48 c1 e8 06          	shr    $0x6,%rax
    20000f5e:	48 c1 e0 26          	shl    $0x26,%rax
    20000f62:	48 c1 e8 20          	shr    $0x20,%rax
    20000f66:	48 0b 45 10          	or     0x10(%rbp),%rax
    20000f6a:	48 09 c7             	or     %rax,%rdi
    20000f6d:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    20000f74:	00 00 00 
    20000f77:	48 09 f8             	or     %rdi,%rax
    20000f7a:	48 89 c7             	mov    %rax,%rdi
    20000f7d:	e8 6b f1 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_KMEM_FLAG(End,Start));
}
    20000f82:	c9                   	leave  
    20000f83:	c3                   	ret    

0000000020000f84 <UVM_Captbl_Rem>:
              cid_t Cap_Rem - The capability slot you want to remove. 1-Level.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Rem(cid_t Cap_Captbl_Rem, cid_t Cap_Rem)
{
    20000f84:	f3 0f 1e fa          	endbr64 
    20000f88:	55                   	push   %rbp
    20000f89:	48 89 e5             	mov    %rsp,%rbp
    20000f8c:	48 83 ec 10          	sub    $0x10,%rsp
    20000f90:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000f94:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_REM, Cap_Captbl_Rem,
    20000f98:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000f9c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000fa0:	48 b9 00 00 00 00 0e 	movabs $0xe00000000,%rcx
    20000fa7:	00 00 00 
    20000faa:	48 09 ca             	or     %rcx,%rdx
    20000fad:	48 89 d7             	mov    %rdx,%rdi
    20000fb0:	b9 00 00 00 00       	mov    $0x0,%ecx
    20000fb5:	ba 00 00 00 00       	mov    $0x0,%edx
    20000fba:	48 89 c6             	mov    %rax,%rsi
    20000fbd:	e8 2b f1 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Rem,
                      0,
                      0);
}
    20000fc2:	c9                   	leave  
    20000fc3:	c3                   	ret    

0000000020000fc4 <UVM_Kern_Act>:
                      kernel function ever causes a context switch, it is responsible
                      for setting the return value. On failure, a context switch 
                      in the kernel fucntion is banned.
******************************************************************************/
ret_t UVM_Kern_Act(cid_t Cap_Kern, ptr_t Func_ID, ptr_t Sub_ID, ptr_t Param1, ptr_t Param2)
{
    20000fc4:	f3 0f 1e fa          	endbr64 
    20000fc8:	55                   	push   %rbp
    20000fc9:	48 89 e5             	mov    %rsp,%rbp
    20000fcc:	48 83 ec 30          	sub    $0x30,%rsp
    20000fd0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000fd4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000fd8:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20000fdc:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20000fe0:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_KFN, Cap_Kern,
    20000fe4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000fe8:	48 c1 e0 20          	shl    $0x20,%rax
    20000fec:	48 89 c2             	mov    %rax,%rdx
    20000fef:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000ff3:	89 c0                	mov    %eax,%eax
    20000ff5:	48 89 d6             	mov    %rdx,%rsi
    20000ff8:	48 09 c6             	or     %rax,%rsi
    20000ffb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000fff:	48 ba 00 00 00 00 04 	movabs $0x400000000,%rdx
    20001006:	00 00 00 
    20001009:	48 09 d0             	or     %rdx,%rax
    2000100c:	48 89 c7             	mov    %rax,%rdi
    2000100f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    20001013:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20001017:	48 89 d1             	mov    %rdx,%rcx
    2000101a:	48 89 c2             	mov    %rax,%rdx
    2000101d:	e8 cb f0 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Sub_ID)|UVM_PARAM_D0(Func_ID),
                      Param1,
                      Param2);
}
    20001022:	c9                   	leave  
    20001023:	c3                   	ret    

0000000020001024 <UVM_Pgtbl_Crt>:
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Pgtbl, 
                    ptr_t Vaddr, ptr_t Start_Addr, ptr_t Top_Flag,
                    ptr_t Size_Order, ptr_t Num_Order)
{
    20001024:	f3 0f 1e fa          	endbr64 
    20001028:	55                   	push   %rbp
    20001029:	48 89 e5             	mov    %rsp,%rbp
    2000102c:	48 83 ec 30          	sub    $0x30,%rsp
    20001030:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001034:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001038:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    2000103c:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20001040:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    20001044:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    
    return UVM_CAP_OP(UVM_PGTBL_SVC(Num_Order,RME_SVC_PGT_CRT), Cap_Captbl,
    20001048:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2000104c:	48 0b 45 d0          	or     -0x30(%rbp),%rax
    20001050:	48 89 c2             	mov    %rax,%rdx
    20001053:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001057:	48 c1 e0 20          	shl    $0x20,%rax
    2000105b:	48 89 c1             	mov    %rax,%rcx
    2000105e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20001062:	48 c1 e0 10          	shl    $0x10,%rax
    20001066:	89 c0                	mov    %eax,%eax
    20001068:	48 09 c1             	or     %rax,%rcx
    2000106b:	48 8b 45 10          	mov    0x10(%rbp),%rax
    2000106f:	0f b7 c0             	movzwl %ax,%eax
    20001072:	48 89 ce             	mov    %rcx,%rsi
    20001075:	48 09 c6             	or     %rax,%rsi
    20001078:	48 8b 45 18          	mov    0x18(%rbp),%rax
    2000107c:	48 c1 e0 10          	shl    $0x10,%rax
    20001080:	48 c1 e0 20          	shl    $0x20,%rax
    20001084:	48 89 c1             	mov    %rax,%rcx
    20001087:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000108b:	48 09 c1             	or     %rax,%rcx
    2000108e:	48 b8 00 00 00 00 0f 	movabs $0xf00000000,%rax
    20001095:	00 00 00 
    20001098:	48 89 cf             	mov    %rcx,%rdi
    2000109b:	48 09 c7             	or     %rax,%rdi
    2000109e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    200010a2:	48 89 d1             	mov    %rdx,%rcx
    200010a5:	48 89 c2             	mov    %rax,%rdx
    200010a8:	e8 40 f0 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_Q1(Cap_Pgtbl)|UVM_PARAM_Q0(Size_Order),
                      Vaddr, 
                      Start_Addr|Top_Flag);
}
    200010ad:	c9                   	leave  
    200010ae:	c3                   	ret    

00000000200010af <UVM_Pgtbl_Del>:
                                page table capability to be in. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Del(cid_t Cap_Captbl, cid_t Cap_Pgtbl)
{
    200010af:	f3 0f 1e fa          	endbr64 
    200010b3:	55                   	push   %rbp
    200010b4:	48 89 e5             	mov    %rsp,%rbp
    200010b7:	48 83 ec 10          	sub    $0x10,%rsp
    200010bb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200010bf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_DEL, Cap_Captbl,
    200010c3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200010c7:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    200010cb:	48 b9 00 00 00 00 10 	movabs $0x1000000000,%rcx
    200010d2:	00 00 00 
    200010d5:	48 09 ca             	or     %rcx,%rdx
    200010d8:	48 89 d7             	mov    %rdx,%rdi
    200010db:	b9 00 00 00 00       	mov    $0x0,%ecx
    200010e0:	ba 00 00 00 00       	mov    $0x0,%edx
    200010e5:	48 89 c6             	mov    %rax,%rsi
    200010e8:	e8 00 f0 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Pgtbl,
                      0,
                      0);
}
    200010ed:	c9                   	leave  
    200010ee:	c3                   	ret    

00000000200010ef <UVM_Pgtbl_Add>:
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Add(cid_t Cap_Pgtbl_Dst, ptr_t Pos_Dst, ptr_t Flags_Dst,
                    cid_t Cap_Pgtbl_Src, ptr_t Pos_Src, ptr_t Index)
{
    200010ef:	f3 0f 1e fa          	endbr64 
    200010f3:	55                   	push   %rbp
    200010f4:	48 89 e5             	mov    %rsp,%rbp
    200010f7:	48 83 ec 30          	sub    $0x30,%rsp
    200010fb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200010ff:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001103:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001107:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    2000110b:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    2000110f:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_ADD, 0,
    20001113:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20001117:	48 c1 e0 20          	shl    $0x20,%rax
    2000111b:	48 89 c2             	mov    %rax,%rdx
    2000111e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20001122:	89 c0                	mov    %eax,%eax
    20001124:	48 89 d1             	mov    %rdx,%rcx
    20001127:	48 09 c1             	or     %rax,%rcx
    2000112a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2000112e:	48 c1 e0 20          	shl    $0x20,%rax
    20001132:	48 89 c2             	mov    %rax,%rdx
    20001135:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20001139:	89 c0                	mov    %eax,%eax
    2000113b:	48 09 c2             	or     %rax,%rdx
    2000113e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001142:	48 c1 e0 20          	shl    $0x20,%rax
    20001146:	48 89 c6             	mov    %rax,%rsi
    20001149:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2000114d:	89 c0                	mov    %eax,%eax
    2000114f:	48 09 f0             	or     %rsi,%rax
    20001152:	48 89 c6             	mov    %rax,%rsi
    20001155:	48 b8 00 00 00 00 11 	movabs $0x1100000000,%rax
    2000115c:	00 00 00 
    2000115f:	48 89 c7             	mov    %rax,%rdi
    20001162:	e8 86 ef ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Pgtbl_Dst)|UVM_PARAM_D0(Pos_Dst),
                      UVM_PARAM_D1(Cap_Pgtbl_Src)|UVM_PARAM_D0(Pos_Src),
                      UVM_PARAM_D1(Flags_Dst)|UVM_PARAM_D0(Index));
}
    20001167:	c9                   	leave  
    20001168:	c3                   	ret    

0000000020001169 <UVM_Pgtbl_Rem>:
              ptr_t Pos - The virtual address position to unmap from.
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Rem(cid_t Cap_Pgtbl, ptr_t Pos)
{
    20001169:	f3 0f 1e fa          	endbr64 
    2000116d:	55                   	push   %rbp
    2000116e:	48 89 e5             	mov    %rsp,%rbp
    20001171:	48 83 ec 10          	sub    $0x10,%rsp
    20001175:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001179:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_REM, 0,
    2000117d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001181:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20001185:	b9 00 00 00 00       	mov    $0x0,%ecx
    2000118a:	48 89 c6             	mov    %rax,%rsi
    2000118d:	48 b8 00 00 00 00 12 	movabs $0x1200000000,%rax
    20001194:	00 00 00 
    20001197:	48 89 c7             	mov    %rax,%rdi
    2000119a:	e8 4e ef ff ff       	call   200000ed <UVM_Svc>
                      Cap_Pgtbl,
                      Pos,
                      0);
}
    2000119f:	c9                   	leave  
    200011a0:	c3                   	ret    

00000000200011a1 <UVM_Pgtbl_Con>:
              ptr_t Flags_Child - This have no effect on MPU-based architectures.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Con(cid_t Cap_Pgtbl_Parent, ptr_t Pos, cid_t Cap_Pgtbl_Child, ptr_t Flags_Child)
{
    200011a1:	f3 0f 1e fa          	endbr64 
    200011a5:	55                   	push   %rbp
    200011a6:	48 89 e5             	mov    %rsp,%rbp
    200011a9:	48 83 ec 20          	sub    $0x20,%rsp
    200011ad:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200011b1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    200011b5:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    200011b9:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_CON, 0,
    200011bd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200011c1:	48 c1 e0 20          	shl    $0x20,%rax
    200011c5:	48 89 c2             	mov    %rax,%rdx
    200011c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    200011cc:	89 c0                	mov    %eax,%eax
    200011ce:	48 89 d6             	mov    %rdx,%rsi
    200011d1:	48 09 c6             	or     %rax,%rsi
    200011d4:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    200011d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200011dc:	48 89 d1             	mov    %rdx,%rcx
    200011df:	48 89 c2             	mov    %rax,%rdx
    200011e2:	48 b8 00 00 00 00 13 	movabs $0x1300000000,%rax
    200011e9:	00 00 00 
    200011ec:	48 89 c7             	mov    %rax,%rdi
    200011ef:	e8 f9 ee ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Pgtbl_Parent)|UVM_PARAM_D0(Cap_Pgtbl_Child),
                      Pos,
                      Flags_Child);
}
    200011f4:	c9                   	leave  
    200011f5:	c3                   	ret    

00000000200011f6 <UVM_Pgtbl_Des>:
                          table from.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Des(cid_t Cap_Pgtbl, ptr_t Pos)
{
    200011f6:	f3 0f 1e fa          	endbr64 
    200011fa:	55                   	push   %rbp
    200011fb:	48 89 e5             	mov    %rsp,%rbp
    200011fe:	48 83 ec 10          	sub    $0x10,%rsp
    20001202:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001206:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_DES, 0,
    2000120a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000120e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20001212:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001217:	48 89 c6             	mov    %rax,%rsi
    2000121a:	48 b8 00 00 00 00 14 	movabs $0x1400000000,%rax
    20001221:	00 00 00 
    20001224:	48 89 c7             	mov    %rax,%rdi
    20001227:	e8 c1 ee ff ff       	call   200000ed <UVM_Svc>
                      Cap_Pgtbl,
                      Pos,
                      0);
}
    2000122c:	c9                   	leave  
    2000122d:	c3                   	ret    

000000002000122e <UVM_Proc_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, cid_t Cap_Proc,
                   cid_t Cap_Captbl, cid_t Cap_Pgtbl, ptr_t Vaddr)
{
    2000122e:	f3 0f 1e fa          	endbr64 
    20001232:	55                   	push   %rbp
    20001233:	48 89 e5             	mov    %rsp,%rbp
    20001236:	48 83 ec 30          	sub    $0x30,%rsp
    2000123a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000123e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001242:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001246:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    2000124a:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    2000124e:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_CRT, Cap_Captbl_Crt,
    20001252:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20001256:	48 c1 e0 20          	shl    $0x20,%rax
    2000125a:	48 89 c2             	mov    %rax,%rdx
    2000125d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20001261:	89 c0                	mov    %eax,%eax
    20001263:	48 09 c2             	or     %rax,%rdx
    20001266:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2000126a:	48 c1 e0 20          	shl    $0x20,%rax
    2000126e:	48 89 c1             	mov    %rax,%rcx
    20001271:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20001275:	89 c0                	mov    %eax,%eax
    20001277:	48 89 ce             	mov    %rcx,%rsi
    2000127a:	48 09 c6             	or     %rax,%rsi
    2000127d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001281:	48 b9 00 00 00 00 15 	movabs $0x1500000000,%rcx
    20001288:	00 00 00 
    2000128b:	48 09 c8             	or     %rcx,%rax
    2000128e:	48 89 c7             	mov    %rax,%rdi
    20001291:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20001295:	48 89 c1             	mov    %rax,%rcx
    20001298:	e8 50 ee ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Proc),
                      UVM_PARAM_D1(Cap_Captbl)|UVM_PARAM_D0(Cap_Pgtbl),
                      Vaddr);
}
    2000129d:	c9                   	leave  
    2000129e:	c3                   	ret    

000000002000129f <UVM_Proc_Del>:
              cid_t Cap_Proc - The capability to the process. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Del(cid_t Cap_Captbl, cid_t Cap_Proc)
{
    2000129f:	f3 0f 1e fa          	endbr64 
    200012a3:	55                   	push   %rbp
    200012a4:	48 89 e5             	mov    %rsp,%rbp
    200012a7:	48 83 ec 10          	sub    $0x10,%rsp
    200012ab:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200012af:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_DEL, Cap_Captbl,
    200012b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200012b7:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    200012bb:	48 b9 00 00 00 00 16 	movabs $0x1600000000,%rcx
    200012c2:	00 00 00 
    200012c5:	48 09 ca             	or     %rcx,%rdx
    200012c8:	48 89 d7             	mov    %rdx,%rdi
    200012cb:	b9 00 00 00 00       	mov    $0x0,%ecx
    200012d0:	ba 00 00 00 00       	mov    $0x0,%edx
    200012d5:	48 89 c6             	mov    %rax,%rsi
    200012d8:	e8 10 ee ff ff       	call   200000ed <UVM_Svc>
                      Cap_Proc,
                      0,
                      0);
}
    200012dd:	c9                   	leave  
    200012de:	c3                   	ret    

00000000200012df <UVM_Proc_Cpt>:
                                 this process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Cpt(cid_t Cap_Proc, cid_t Cap_Captbl)
{
    200012df:	f3 0f 1e fa          	endbr64 
    200012e3:	55                   	push   %rbp
    200012e4:	48 89 e5             	mov    %rsp,%rbp
    200012e7:	48 83 ec 10          	sub    $0x10,%rsp
    200012eb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200012ef:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_CPT, 0,
    200012f3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200012f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200012fb:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001300:	48 89 c6             	mov    %rax,%rsi
    20001303:	48 b8 00 00 00 00 17 	movabs $0x1700000000,%rax
    2000130a:	00 00 00 
    2000130d:	48 89 c7             	mov    %rax,%rdi
    20001310:	e8 d8 ed ff ff       	call   200000ed <UVM_Svc>
                      Cap_Proc,
                      Cap_Captbl,
                      0);
}
    20001315:	c9                   	leave  
    20001316:	c3                   	ret    

0000000020001317 <UVM_Proc_Pgt>:
                                process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Pgt(cid_t Cap_Proc, cid_t Cap_Pgtbl)
{
    20001317:	f3 0f 1e fa          	endbr64 
    2000131b:	55                   	push   %rbp
    2000131c:	48 89 e5             	mov    %rsp,%rbp
    2000131f:	48 83 ec 10          	sub    $0x10,%rsp
    20001323:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001327:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_PGT, 0,
    2000132b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    2000132f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001333:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001338:	48 89 c6             	mov    %rax,%rsi
    2000133b:	48 b8 00 00 00 00 18 	movabs $0x1800000000,%rax
    20001342:	00 00 00 
    20001345:	48 89 c7             	mov    %rax,%rdi
    20001348:	e8 a0 ed ff ff       	call   200000ed <UVM_Svc>
                      Cap_Proc,
                      Cap_Pgtbl,
                      0);
}
    2000134d:	c9                   	leave  
    2000134e:	c3                   	ret    

000000002000134f <UVM_Thd_Crt>:
Output      : None.
Return      : ret_t - If successful, the Thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Thd,
                  cid_t Cap_Proc, ptr_t Max_Prio, ptr_t Vaddr)
{
    2000134f:	f3 0f 1e fa          	endbr64 
    20001353:	55                   	push   %rbp
    20001354:	48 89 e5             	mov    %rsp,%rbp
    20001357:	48 83 ec 30          	sub    $0x30,%rsp
    2000135b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000135f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001363:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001367:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    2000136b:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    2000136f:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_CRT, Cap_Captbl, 
    20001373:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20001377:	48 c1 e0 20          	shl    $0x20,%rax
    2000137b:	48 89 c2             	mov    %rax,%rdx
    2000137e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20001382:	89 c0                	mov    %eax,%eax
    20001384:	48 09 c2             	or     %rax,%rdx
    20001387:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2000138b:	48 c1 e0 20          	shl    $0x20,%rax
    2000138f:	48 89 c1             	mov    %rax,%rcx
    20001392:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20001396:	89 c0                	mov    %eax,%eax
    20001398:	48 89 ce             	mov    %rcx,%rsi
    2000139b:	48 09 c6             	or     %rax,%rsi
    2000139e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200013a2:	48 b9 00 00 00 00 19 	movabs $0x1900000000,%rcx
    200013a9:	00 00 00 
    200013ac:	48 09 c8             	or     %rcx,%rax
    200013af:	48 89 c7             	mov    %rax,%rdi
    200013b2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    200013b6:	48 89 c1             	mov    %rax,%rcx
    200013b9:	e8 2f ed ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Thd),
                      UVM_PARAM_D1(Cap_Proc)|UVM_PARAM_D0(Max_Prio),
                      Vaddr);
}
    200013be:	c9                   	leave  
    200013bf:	c3                   	ret    

00000000200013c0 <UVM_Thd_Del>:
              cid_t Cap_Thd - The capability to the thread in the captbl. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Del(cid_t Cap_Captbl, cid_t Cap_Thd)
{
    200013c0:	f3 0f 1e fa          	endbr64 
    200013c4:	55                   	push   %rbp
    200013c5:	48 89 e5             	mov    %rsp,%rbp
    200013c8:	48 83 ec 10          	sub    $0x10,%rsp
    200013cc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200013d0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_DEL, Cap_Captbl,
    200013d4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200013d8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    200013dc:	48 b9 00 00 00 00 1a 	movabs $0x1a00000000,%rcx
    200013e3:	00 00 00 
    200013e6:	48 09 ca             	or     %rcx,%rdx
    200013e9:	48 89 d7             	mov    %rdx,%rdi
    200013ec:	b9 00 00 00 00       	mov    $0x0,%ecx
    200013f1:	ba 00 00 00 00       	mov    $0x0,%edx
    200013f6:	48 89 c6             	mov    %rax,%rsi
    200013f9:	e8 ef ec ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      0,
                      0);
}
    200013fe:	c9                   	leave  
    200013ff:	c3                   	ret    

0000000020001400 <UVM_Thd_Exec_Set>:
              ptr_t Param - The parameter of the thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Exec_Set(cid_t Cap_Thd, ptr_t Entry, ptr_t Stack, ptr_t Param)
{
    20001400:	f3 0f 1e fa          	endbr64 
    20001404:	55                   	push   %rbp
    20001405:	48 89 e5             	mov    %rsp,%rbp
    20001408:	48 83 ec 20          	sub    $0x20,%rsp
    2000140c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001410:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001414:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001418:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, Cap_Thd,
    2000141c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001420:	48 ba 00 00 00 00 06 	movabs $0x600000000,%rdx
    20001427:	00 00 00 
    2000142a:	48 09 d0             	or     %rdx,%rax
    2000142d:	48 89 c7             	mov    %rax,%rdi
    20001430:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    20001434:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20001438:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2000143c:	48 89 c6             	mov    %rax,%rsi
    2000143f:	e8 a9 ec ff ff       	call   200000ed <UVM_Svc>
                      Entry, 
                      Stack,
                      Param);
}
    20001444:	c9                   	leave  
    20001445:	c3                   	ret    

0000000020001446 <UVM_Thd_Hyp_Set>:
                            thread's register sets.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Hyp_Set(cid_t Cap_Thd, ptr_t Kaddr)
{
    20001446:	f3 0f 1e fa          	endbr64 
    2000144a:	55                   	push   %rbp
    2000144b:	48 89 e5             	mov    %rsp,%rbp
    2000144e:	48 83 ec 10          	sub    $0x10,%rsp
    20001452:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001456:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, 0,
    2000145a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000145e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20001462:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001467:	48 89 c6             	mov    %rax,%rsi
    2000146a:	48 b8 00 00 00 00 06 	movabs $0x600000000,%rax
    20001471:	00 00 00 
    20001474:	48 89 c7             	mov    %rax,%rdi
    20001477:	e8 71 ec ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      Kaddr,
                      0);
}
    2000147c:	c9                   	leave  
    2000147d:	c3                   	ret    

000000002000147e <UVM_Thd_Sched_Bind>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Bind(cid_t Cap_Thd, cid_t Cap_Thd_Sched, cid_t Cap_Sig, tid_t TID, ptr_t Prio)
{
    2000147e:	f3 0f 1e fa          	endbr64 
    20001482:	55                   	push   %rbp
    20001483:	48 89 e5             	mov    %rsp,%rbp
    20001486:	48 83 ec 30          	sub    $0x30,%rsp
    2000148a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000148e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001492:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001496:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    2000149a:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_BIND, Cap_Thd,
    2000149e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    200014a2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200014a6:	48 89 d1             	mov    %rdx,%rcx
    200014a9:	48 c1 e1 20          	shl    $0x20,%rcx
    200014ad:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    200014b1:	89 d2                	mov    %edx,%edx
    200014b3:	48 89 ce             	mov    %rcx,%rsi
    200014b6:	48 09 d6             	or     %rdx,%rsi
    200014b9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    200014bd:	48 b9 00 00 00 00 1b 	movabs $0x1b00000000,%rcx
    200014c4:	00 00 00 
    200014c7:	48 89 d7             	mov    %rdx,%rdi
    200014ca:	48 09 cf             	or     %rcx,%rdi
    200014cd:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    200014d1:	48 89 d1             	mov    %rdx,%rcx
    200014d4:	48 89 c2             	mov    %rax,%rdx
    200014d7:	e8 11 ec ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Thd_Sched)|UVM_PARAM_D0(Cap_Sig),
                      TID, 
                      Prio);
}
    200014dc:	c9                   	leave  
    200014dd:	c3                   	ret    

00000000200014de <UVM_Thd_Sched_Rcv>:
                              is simply not allowed. 2-Level.
Output      : None.
Return      : ret_t - If successful, the thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Rcv(cid_t Cap_Thd)
{
    200014de:	f3 0f 1e fa          	endbr64 
    200014e2:	55                   	push   %rbp
    200014e3:	48 89 e5             	mov    %rsp,%rbp
    200014e6:	48 83 ec 10          	sub    $0x10,%rsp
    200014ea:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_RCV, 0,
    200014ee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200014f2:	b9 00 00 00 00       	mov    $0x0,%ecx
    200014f7:	ba 00 00 00 00       	mov    $0x0,%edx
    200014fc:	48 89 c6             	mov    %rax,%rsi
    200014ff:	48 b8 00 00 00 00 1c 	movabs $0x1c00000000,%rax
    20001506:	00 00 00 
    20001509:	48 89 c7             	mov    %rax,%rdi
    2000150c:	e8 dc eb ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      0, 
                      0);
}
    20001511:	c9                   	leave  
    20001512:	c3                   	ret    

0000000020001513 <UVM_Thd_Sched_Prio>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Prio(cid_t Cap_Thd, ptr_t Prio)
{
    20001513:	f3 0f 1e fa          	endbr64 
    20001517:	55                   	push   %rbp
    20001518:	48 89 e5             	mov    %rsp,%rbp
    2000151b:	48 83 ec 10          	sub    $0x10,%rsp
    2000151f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001523:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_PRIO, 0,
    20001527:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000152b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    2000152f:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001534:	48 89 c6             	mov    %rax,%rsi
    20001537:	48 b8 00 00 00 00 07 	movabs $0x700000000,%rax
    2000153e:	00 00 00 
    20001541:	48 89 c7             	mov    %rax,%rdi
    20001544:	e8 a4 eb ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      Prio, 
                      0);
}
    20001549:	c9                   	leave  
    2000154a:	c3                   	ret    

000000002000154b <UVM_Thd_Sched_Free>:
Input       : cid_t Cap_Thd - The capability to the thread. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Free(cid_t Cap_Thd)
{
    2000154b:	f3 0f 1e fa          	endbr64 
    2000154f:	55                   	push   %rbp
    20001550:	48 89 e5             	mov    %rsp,%rbp
    20001553:	48 83 ec 10          	sub    $0x10,%rsp
    20001557:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_FREE, 0,
    2000155b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000155f:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001564:	ba 00 00 00 00       	mov    $0x0,%edx
    20001569:	48 89 c6             	mov    %rax,%rsi
    2000156c:	48 b8 00 00 00 00 05 	movabs $0x500000000,%rax
    20001573:	00 00 00 
    20001576:	48 89 c7             	mov    %rax,%rdi
    20001579:	e8 6f eb ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      0, 
                      0);
}
    2000157e:	c9                   	leave  
    2000157f:	c3                   	ret    

0000000020001580 <UVM_Thd_Time_Xfer>:
                           order of 100us or 1ms.
Output      : None.
Return      : ret_t - If successful, the destination time amount; or an error code.
******************************************************************************/
ret_t UVM_Thd_Time_Xfer(cid_t Cap_Thd_Dst, cid_t Cap_Thd_Src, ptr_t Time)
{
    20001580:	f3 0f 1e fa          	endbr64 
    20001584:	55                   	push   %rbp
    20001585:	48 89 e5             	mov    %rsp,%rbp
    20001588:	48 83 ec 20          	sub    $0x20,%rsp
    2000158c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001590:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001594:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_TIME_XFER, 0,
    20001598:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    2000159c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200015a0:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    200015a4:	48 89 c6             	mov    %rax,%rsi
    200015a7:	48 b8 00 00 00 00 08 	movabs $0x800000000,%rax
    200015ae:	00 00 00 
    200015b1:	48 89 c7             	mov    %rax,%rdi
    200015b4:	e8 34 eb ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd_Dst,
                      Cap_Thd_Src, 
                      Time);
}
    200015b9:	c9                   	leave  
    200015ba:	c3                   	ret    

00000000200015bb <UVM_Thd_Swt>:
                                 this thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Swt(cid_t Cap_Thd, ptr_t Full_Yield)
{
    200015bb:	f3 0f 1e fa          	endbr64 
    200015bf:	55                   	push   %rbp
    200015c0:	48 89 e5             	mov    %rsp,%rbp
    200015c3:	48 83 ec 10          	sub    $0x10,%rsp
    200015c7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200015cb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SWT, 0,
    200015cf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200015d3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200015d7:	b9 00 00 00 00       	mov    $0x0,%ecx
    200015dc:	48 89 c6             	mov    %rax,%rsi
    200015df:	48 b8 00 00 00 00 09 	movabs $0x900000000,%rax
    200015e6:	00 00 00 
    200015e9:	48 89 c7             	mov    %rax,%rdi
    200015ec:	e8 fc ea ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      Full_Yield, 
                      0);
}
    200015f1:	c9                   	leave  
    200015f2:	c3                   	ret    

00000000200015f3 <UVM_Sig_Crt>:
                            within the kernel virtual address.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Sig, ptr_t Vaddr)
{
    200015f3:	f3 0f 1e fa          	endbr64 
    200015f7:	55                   	push   %rbp
    200015f8:	48 89 e5             	mov    %rsp,%rbp
    200015fb:	48 83 ec 20          	sub    $0x20,%rsp
    200015ff:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001603:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001607:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    2000160b:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_CRT, Cap_Captbl,
    2000160f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20001613:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001617:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    2000161b:	48 be 00 00 00 00 1d 	movabs $0x1d00000000,%rsi
    20001622:	00 00 00 
    20001625:	48 89 cf             	mov    %rcx,%rdi
    20001628:	48 09 f7             	or     %rsi,%rdi
    2000162b:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    2000162f:	48 89 c6             	mov    %rax,%rsi
    20001632:	e8 b6 ea ff ff       	call   200000ed <UVM_Svc>
                      Cap_Kmem,
                      Cap_Sig, 
                      Vaddr);
}
    20001637:	c9                   	leave  
    20001638:	c3                   	ret    

0000000020001639 <UVM_Sig_Del>:
              cid_t Cap_Sig - The capability to the signal. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Del(cid_t Cap_Captbl, cid_t Cap_Sig)
{
    20001639:	f3 0f 1e fa          	endbr64 
    2000163d:	55                   	push   %rbp
    2000163e:	48 89 e5             	mov    %rsp,%rbp
    20001641:	48 83 ec 10          	sub    $0x10,%rsp
    20001645:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001649:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_DEL, Cap_Captbl,
    2000164d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001651:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20001655:	48 b9 00 00 00 00 1e 	movabs $0x1e00000000,%rcx
    2000165c:	00 00 00 
    2000165f:	48 09 ca             	or     %rcx,%rdx
    20001662:	48 89 d7             	mov    %rdx,%rdi
    20001665:	b9 00 00 00 00       	mov    $0x0,%ecx
    2000166a:	ba 00 00 00 00       	mov    $0x0,%edx
    2000166f:	48 89 c6             	mov    %rax,%rsi
    20001672:	e8 76 ea ff ff       	call   200000ed <UVM_Svc>
                      Cap_Sig,
                      0, 
                      0);
}
    20001677:	c9                   	leave  
    20001678:	c3                   	ret    

0000000020001679 <UVM_Sig_Snd>:
Input       : cid_t Cap_Sig - The capability to the signal. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0, or an error code.
******************************************************************************/
ret_t UVM_Sig_Snd(cid_t Cap_Sig)
{
    20001679:	f3 0f 1e fa          	endbr64 
    2000167d:	55                   	push   %rbp
    2000167e:	48 89 e5             	mov    %rsp,%rbp
    20001681:	48 83 ec 10          	sub    $0x10,%rsp
    20001685:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_SND, 0,
    20001689:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000168d:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001692:	ba 00 00 00 00       	mov    $0x0,%edx
    20001697:	48 89 c6             	mov    %rax,%rsi
    2000169a:	48 b8 00 00 00 00 02 	movabs $0x200000000,%rax
    200016a1:	00 00 00 
    200016a4:	48 89 c7             	mov    %rax,%rdi
    200016a7:	e8 41 ea ff ff       	call   200000ed <UVM_Svc>
                      Cap_Sig,
                      0, 
                      0);
}
    200016ac:	c9                   	leave  
    200016ad:	c3                   	ret    

00000000200016ae <UVM_Sig_Rcv>:
Output      : None.
Return      : ret_t - If successful, a non-negative number containing the number of signals
                      received will be returned; else an error code.
******************************************************************************/
ret_t UVM_Sig_Rcv(cid_t Cap_Sig, ptr_t Option)
{
    200016ae:	f3 0f 1e fa          	endbr64 
    200016b2:	55                   	push   %rbp
    200016b3:	48 89 e5             	mov    %rsp,%rbp
    200016b6:	48 83 ec 10          	sub    $0x10,%rsp
    200016ba:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200016be:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_RCV, 0,
    200016c2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200016c6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200016ca:	b9 00 00 00 00       	mov    $0x0,%ecx
    200016cf:	48 89 c6             	mov    %rax,%rsi
    200016d2:	48 b8 00 00 00 00 03 	movabs $0x300000000,%rax
    200016d9:	00 00 00 
    200016dc:	48 89 c7             	mov    %rax,%rdi
    200016df:	e8 09 ea ff ff       	call   200000ed <UVM_Svc>
                      Cap_Sig,
                      Option, 
                      0);
}
    200016e4:	c9                   	leave  
    200016e5:	c3                   	ret    

00000000200016e6 <UVM_Inv_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, 
                  cid_t Cap_Inv, cid_t Cap_Proc, ptr_t Vaddr)
{
    200016e6:	f3 0f 1e fa          	endbr64 
    200016ea:	55                   	push   %rbp
    200016eb:	48 89 e5             	mov    %rsp,%rbp
    200016ee:	48 83 ec 30          	sub    $0x30,%rsp
    200016f2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200016f6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    200016fa:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    200016fe:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20001702:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_CRT, Cap_Captbl,
    20001706:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2000170a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    2000170e:	48 89 d1             	mov    %rdx,%rcx
    20001711:	48 c1 e1 20          	shl    $0x20,%rcx
    20001715:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20001719:	89 d2                	mov    %edx,%edx
    2000171b:	48 89 ce             	mov    %rcx,%rsi
    2000171e:	48 09 d6             	or     %rdx,%rsi
    20001721:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20001725:	48 b9 00 00 00 00 1f 	movabs $0x1f00000000,%rcx
    2000172c:	00 00 00 
    2000172f:	48 89 d7             	mov    %rdx,%rdi
    20001732:	48 09 cf             	or     %rcx,%rdi
    20001735:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    20001739:	48 89 d1             	mov    %rdx,%rcx
    2000173c:	48 89 c2             	mov    %rax,%rdx
    2000173f:	e8 a9 e9 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Inv),
                      Cap_Proc, 
                      Vaddr);
}
    20001744:	c9                   	leave  
    20001745:	c3                   	ret    

0000000020001746 <UVM_Inv_Del>:
              cid_t Cap_Inv - The capability to the invocation stub. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Del(cid_t Cap_Captbl, cid_t Cap_Inv)
{
    20001746:	f3 0f 1e fa          	endbr64 
    2000174a:	55                   	push   %rbp
    2000174b:	48 89 e5             	mov    %rsp,%rbp
    2000174e:	48 83 ec 10          	sub    $0x10,%rsp
    20001752:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001756:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_DEL, Cap_Captbl,
    2000175a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2000175e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20001762:	48 b9 00 00 00 00 20 	movabs $0x2000000000,%rcx
    20001769:	00 00 00 
    2000176c:	48 09 ca             	or     %rcx,%rdx
    2000176f:	48 89 d7             	mov    %rdx,%rdi
    20001772:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001777:	ba 00 00 00 00       	mov    $0x0,%edx
    2000177c:	48 89 c6             	mov    %rax,%rsi
    2000177f:	e8 69 e9 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Inv,
                      0, 
                      0);
}
    20001784:	c9                   	leave  
    20001785:	c3                   	ret    

0000000020001786 <UVM_Inv_Set>:
                                     immediately, or we wait for fault handling?
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Set(cid_t Cap_Inv, ptr_t Entry, ptr_t Stack, ptr_t Fault_Ret_Flag)
{
    20001786:	f3 0f 1e fa          	endbr64 
    2000178a:	55                   	push   %rbp
    2000178b:	48 89 e5             	mov    %rsp,%rbp
    2000178e:	48 83 ec 20          	sub    $0x20,%rsp
    20001792:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001796:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2000179a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    2000179e:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_SET, 0,
    200017a2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    200017a6:	48 c1 e0 20          	shl    $0x20,%rax
    200017aa:	48 89 c2             	mov    %rax,%rdx
    200017ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200017b1:	89 c0                	mov    %eax,%eax
    200017b3:	48 89 d6             	mov    %rdx,%rsi
    200017b6:	48 09 c6             	or     %rax,%rsi
    200017b9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    200017bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200017c1:	48 89 d1             	mov    %rdx,%rcx
    200017c4:	48 89 c2             	mov    %rax,%rdx
    200017c7:	48 b8 00 00 00 00 21 	movabs $0x2100000000,%rax
    200017ce:	00 00 00 
    200017d1:	48 89 c7             	mov    %rax,%rdi
    200017d4:	e8 14 e9 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Fault_Ret_Flag)|UVM_PARAM_D0(Cap_Inv),
                      Entry, 
                      Stack);
}
    200017d9:	c9                   	leave  
    200017da:	c3                   	ret    

00000000200017db <UVM_Putchar>:
Input       : char Char - The character to print.
Output      : None.
Return      : ptr_t - Always 0.
******************************************************************************/
ptr_t UVM_Putchar(char Char)
{
    200017db:	f3 0f 1e fa          	endbr64 
    200017df:	55                   	push   %rbp
    200017e0:	48 89 e5             	mov    %rsp,%rbp
    200017e3:	48 83 ec 10          	sub    $0x10,%rsp
    200017e7:	89 f8                	mov    %edi,%eax
    200017e9:	88 45 fc             	mov    %al,-0x4(%rbp)
    /* Wait until we have transmitted */
    while((__UVM_X64_In(UVM_X64_COM1+5)&0x20)==0);
    200017ec:	90                   	nop
    200017ed:	bf fd 03 00 00       	mov    $0x3fd,%edi
    200017f2:	e8 0e e8 ff ff       	call   20000005 <__UVM_X64_In>
    200017f7:	83 e0 20             	and    $0x20,%eax
    200017fa:	48 85 c0             	test   %rax,%rax
    200017fd:	74 ee                	je     200017ed <UVM_Putchar+0x12>

    __UVM_X64_Out(UVM_X64_COM1, Char);
    200017ff:	48 0f be 45 fc       	movsbq -0x4(%rbp),%rax
    20001804:	48 89 c6             	mov    %rax,%rsi
    20001807:	bf f8 03 00 00       	mov    $0x3f8,%edi
    2000180c:	e8 fe e7 ff ff       	call   2000000f <__UVM_X64_Out>

    return 0;
    20001811:	b8 00 00 00 00       	mov    $0x0,%eax
}
    20001816:	c9                   	leave  
    20001817:	c3                   	ret    

0000000020001818 <_UVM_Stack_Init>:
Output      : None.
Return      : ptr_t - The actual stack address to use for system call.
******************************************************************************/
ptr_t _UVM_Stack_Init(ptr_t Stack, ptr_t Size, ptr_t Stub, ptr_t Entry,
                      ptr_t Param1, ptr_t Param2, ptr_t Param3, ptr_t Param4)
{
    20001818:	f3 0f 1e fa          	endbr64 
    2000181c:	55                   	push   %rbp
    2000181d:	48 89 e5             	mov    %rsp,%rbp
    20001820:	48 83 ec 40          	sub    $0x40,%rsp
    20001824:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    20001828:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    2000182c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    20001830:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    20001834:	4c 89 45 c8          	mov    %r8,-0x38(%rbp)
    20001838:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
	ptr_t* Stack_Ptr;

    Stack_Ptr=(ptr_t*)(Stack+Size-UVM_STACK_SAFE_SIZE*sizeof(ptr_t));
    2000183c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20001840:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20001844:	48 01 d0             	add    %rdx,%rax
    20001847:	48 2d 00 01 00 00    	sub    $0x100,%rax
    2000184d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    Stack_Ptr[0]=Param1;
    20001851:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001855:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    20001859:	48 89 10             	mov    %rdx,(%rax)
    Stack_Ptr[1]=Param2;
    2000185c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001860:	48 8d 50 08          	lea    0x8(%rax),%rdx
    20001864:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    20001868:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[2]=Param3;
    2000186b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000186f:	48 8d 50 10          	lea    0x10(%rax),%rdx
    20001873:	48 8b 45 10          	mov    0x10(%rbp),%rax
    20001877:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[3]=Param4;
    2000187a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000187e:	48 8d 50 18          	lea    0x18(%rax),%rdx
    20001882:	48 8b 45 18          	mov    0x18(%rbp),%rax
    20001886:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[4]=Entry;
    20001889:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000188d:	48 8d 50 20          	lea    0x20(%rax),%rdx
    20001891:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20001895:	48 89 02             	mov    %rax,(%rdx)

    return (ptr_t)Stack_Ptr;
    20001898:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
    2000189c:	c9                   	leave  
    2000189d:	c3                   	ret    

000000002000189e <_UVM_Idle>:
Input       : None.
Output      : None.
Return      : None.
******************************************************************************/
void _UVM_Idle(void)
{
    2000189e:	f3 0f 1e fa          	endbr64 
    200018a2:	55                   	push   %rbp
    200018a3:	48 89 e5             	mov    %rsp,%rbp
    /* Do nothing. In the future we may call a kernel function to put us to sleep */
}
    200018a6:	90                   	nop
    200018a7:	5d                   	pop    %rbp
    200018a8:	c3                   	ret    

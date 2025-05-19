
./Object/UVM:     file format elf64-x86-64


Disassembly of section .text:

0000000020000000 <_UVM_Entry>:
              space very well.
Input       : None.
Output      : None.
*****************************************************************************/
_UVM_Entry:
    JMP                 main
    20000000:	e9 5d 02 00 00       	jmp    20000262 <main>

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

000000002000017e <TEST_THD1_FUNC>:
ptr_t sum;
ptr_t sumin;
ptr_t sumout;

void TEST_THD1_FUNC(void)
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
    2000019d:	eb 51                	jmp    200001f0 <TEST_THD1_FUNC+0x72>
    {
        start=__UVM_X64_Read_TSC();
    2000019f:	e8 77 fe ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    200001a4:	48 89 05 5d 1e 00 00 	mov    %rax,0x1e5d(%rip)        # 20002008 <start>
        UVM_Thd_Swt(TEST_THD2,0);
    200001ab:	be 00 00 00 00       	mov    $0x0,%esi
    200001b0:	bf 0a 00 00 00       	mov    $0xa,%edi
    200001b5:	e8 9a 12 00 00       	call   20001454 <UVM_Thd_Swt>
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
    200001f8:	7e a5                	jle    2000019f <TEST_THD1_FUNC+0x21>
    }
    UVM_LOG_S("\r\nThread Switching takes clock cycles:");
    200001fa:	bf 48 17 00 20       	mov    $0x20001748,%edi
    200001ff:	e8 e0 08 00 00       	call   20000ae4 <UVM_Print_String>
    UVM_LOG_I(sum/1000000);
    20000204:	48 8b 05 15 1e 00 00 	mov    0x1e15(%rip),%rax        # 20002020 <sum>
    2000020b:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    20000212:	de 1b 43 
    20000215:	48 f7 e2             	mul    %rdx
    20000218:	48 89 d0             	mov    %rdx,%rax
    2000021b:	48 c1 e8 12          	shr    $0x12,%rax
    2000021f:	48 89 c7             	mov    %rax,%rdi
    20000222:	e8 f3 05 00 00       	call   2000081a <UVM_Print_Int>
}
    20000227:	90                   	nop
    20000228:	c9                   	leave  
    20000229:	c3                   	ret    

000000002000022a <TEST_THD2_FUNC>:

void TEST_THD2_FUNC(void)
{
    2000022a:	f3 0f 1e fa          	endbr64 
    2000022e:	55                   	push   %rbp
    2000022f:	48 89 e5             	mov    %rsp,%rbp
    while(1)
    {
        UVM_Thd_Swt(TEST_THD1,0);
    20000232:	be 00 00 00 00       	mov    $0x0,%esi
    20000237:	bf 09 00 00 00       	mov    $0x9,%edi
    2000023c:	e8 13 12 00 00       	call   20001454 <UVM_Thd_Swt>
    20000241:	eb ef                	jmp    20000232 <TEST_THD2_FUNC+0x8>

0000000020000243 <TEST_INV1_FUNC>:
    }
}

void TEST_INV1_FUNC(ptr_t param)
{
    20000243:	f3 0f 1e fa          	endbr64 
    20000247:	55                   	push   %rbp
    20000248:	48 89 e5             	mov    %rsp,%rbp
    2000024b:	48 83 ec 10          	sub    $0x10,%rsp
    2000024f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    UVM_Inv_Ret(param);
    20000253:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000257:	48 89 c7             	mov    %rax,%rdi
    2000025a:	e8 85 fe ff ff       	call   200000e4 <UVM_Inv_Ret>
}
    2000025f:	90                   	nop
    20000260:	c9                   	leave  
    20000261:	c3                   	ret    

0000000020000262 <main>:
Input       : None.
Output      : None.
Return      : int - This function shall never return.
******************************************************************************/
int main(ptr_t CPUID)
{
    20000262:	f3 0f 1e fa          	endbr64 
    20000266:	55                   	push   %rbp
    20000267:	48 89 e5             	mov    %rsp,%rbp
    2000026a:	48 83 ec 20          	sub    $0x20,%rsp
    2000026e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    ptr_t Cur_Addr;
    cnt_t Count;
    UVM_LOG_S("\r\nEnter user mode success!Welcome to RME system!");
    20000272:	bf 70 17 00 20       	mov    $0x20001770,%edi
    20000277:	e8 68 08 00 00       	call   20000ae4 <UVM_Print_String>
    UVM_LOG_S("\r\nNow we are running init thread on cpu:");
    2000027c:	bf a8 17 00 20       	mov    $0x200017a8,%edi
    20000281:	e8 5e 08 00 00       	call   20000ae4 <UVM_Print_String>
    UVM_LOG_I(CPUID);
    20000286:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2000028a:	48 89 c7             	mov    %rax,%rdi
    2000028d:	e8 88 05 00 00       	call   2000081a <UVM_Print_Int>
    if(CPUID==0) {
    20000292:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
    20000297:	0f 85 d9 04 00 00    	jne    20000776 <main+0x514>
        /*Empty test begins here*/
        sum=0;
    2000029d:	48 c7 05 78 1d 00 00 	movq   $0x0,0x1d78(%rip)        # 20002020 <sum>
    200002a4:	00 00 00 00 
        for(Count=0;Count<1000000;Count++)
    200002a8:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    200002af:	00 
    200002b0:	eb 42                	jmp    200002f4 <main+0x92>
        {
            start=__UVM_X64_Read_TSC();
    200002b2:	e8 64 fd ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    200002b7:	48 89 05 4a 1d 00 00 	mov    %rax,0x1d4a(%rip)        # 20002008 <start>
            end=__UVM_X64_Read_TSC();
    200002be:	e8 58 fd ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    200002c3:	48 89 05 4e 1d 00 00 	mov    %rax,0x1d4e(%rip)        # 20002018 <end>
            sum+=end-start;
    200002ca:	48 8b 05 47 1d 00 00 	mov    0x1d47(%rip),%rax        # 20002018 <end>
    200002d1:	48 8b 15 30 1d 00 00 	mov    0x1d30(%rip),%rdx        # 20002008 <start>
    200002d8:	48 29 d0             	sub    %rdx,%rax
    200002db:	48 89 c1             	mov    %rax,%rcx
    200002de:	48 8b 05 3b 1d 00 00 	mov    0x1d3b(%rip),%rax        # 20002020 <sum>
    200002e5:	48 01 c8             	add    %rcx,%rax
    200002e8:	48 89 05 31 1d 00 00 	mov    %rax,0x1d31(%rip)        # 20002020 <sum>
        for(Count=0;Count<1000000;Count++)
    200002ef:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    200002f4:	48 81 7d f0 3f 42 0f 	cmpq   $0xf423f,-0x10(%rbp)
    200002fb:	00 
    200002fc:	7e b4                	jle    200002b2 <main+0x50>
        }
        UVM_LOG_S("\r\nEmpty test takes clock cycles:");
    200002fe:	bf d8 17 00 20       	mov    $0x200017d8,%edi
    20000303:	e8 dc 07 00 00       	call   20000ae4 <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
    20000308:	48 8b 05 11 1d 00 00 	mov    0x1d11(%rip),%rax        # 20002020 <sum>
    2000030f:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    20000316:	de 1b 43 
    20000319:	48 f7 e2             	mul    %rdx
    2000031c:	48 89 d0             	mov    %rdx,%rax
    2000031f:	48 c1 e8 12          	shr    $0x12,%rax
    20000323:	48 89 c7             	mov    %rax,%rdi
    20000326:	e8 ef 04 00 00       	call   2000081a <UVM_Print_Int>
        /*Empty test ends here*/

        /*Empty system call test begins here*/
        sum=0;
    2000032b:	48 c7 05 ea 1c 00 00 	movq   $0x0,0x1cea(%rip)        # 20002020 <sum>
    20000332:	00 00 00 00 
        for(Count=0;Count<1000000;Count++)
    20000336:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    2000033d:	00 
    2000033e:	eb 63                	jmp    200003a3 <main+0x141>
        {
            start=__UVM_X64_Read_TSC();
    20000340:	e8 d6 fc ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    20000345:	48 89 05 bc 1c 00 00 	mov    %rax,0x1cbc(%rip)        # 20002008 <start>
            UVM_Svc(-1,-1,-1,-1);
    2000034c:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    20000353:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    2000035a:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
    20000361:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
    20000368:	e8 80 fd ff ff       	call   200000ed <UVM_Svc>
            end=__UVM_X64_Read_TSC();
    2000036d:	e8 a9 fc ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    20000372:	48 89 05 9f 1c 00 00 	mov    %rax,0x1c9f(%rip)        # 20002018 <end>
            sum+=end-start;
    20000379:	48 8b 05 98 1c 00 00 	mov    0x1c98(%rip),%rax        # 20002018 <end>
    20000380:	48 8b 15 81 1c 00 00 	mov    0x1c81(%rip),%rdx        # 20002008 <start>
    20000387:	48 29 d0             	sub    %rdx,%rax
    2000038a:	48 89 c1             	mov    %rax,%rcx
    2000038d:	48 8b 05 8c 1c 00 00 	mov    0x1c8c(%rip),%rax        # 20002020 <sum>
    20000394:	48 01 c8             	add    %rcx,%rax
    20000397:	48 89 05 82 1c 00 00 	mov    %rax,0x1c82(%rip)        # 20002020 <sum>
        for(Count=0;Count<1000000;Count++)
    2000039e:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    200003a3:	48 81 7d f0 3f 42 0f 	cmpq   $0xf423f,-0x10(%rbp)
    200003aa:	00 
    200003ab:	7e 93                	jle    20000340 <main+0xde>
        }
        UVM_LOG_S("\r\nEmpty system call takes clock cycles:");
    200003ad:	bf 00 18 00 20       	mov    $0x20001800,%edi
    200003b2:	e8 2d 07 00 00       	call   20000ae4 <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
    200003b7:	48 8b 05 62 1c 00 00 	mov    0x1c62(%rip),%rax        # 20002020 <sum>
    200003be:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    200003c5:	de 1b 43 
    200003c8:	48 f7 e2             	mul    %rdx
    200003cb:	48 89 d0             	mov    %rdx,%rax
    200003ce:	48 c1 e8 12          	shr    $0x12,%rax
    200003d2:	48 89 c7             	mov    %rax,%rdi
    200003d5:	e8 40 04 00 00       	call   2000081a <UVM_Print_Int>
        /*Empty system call test ends here*/

        /*Now we begin to place kernel objects at this address,It must be a relative address*/
        Cur_Addr=0xFFFF800010000000ULL-0xFFFF800001600000ULL;
    200003da:	48 c7 45 f8 00 00 a0 	movq   $0xea00000,-0x8(%rbp)
    200003e1:	0e 
        UVM_Thd_Swt(TEST_THD1,0);
        UVM_LOG_S("\r\nExit THD1!");
        /*Thread switching test ends here#1#*/

        /*Signal send test begins here*/
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG1, Cur_Addr)>=0);
    200003e2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200003e6:	48 89 c1             	mov    %rax,%rcx
    200003e9:	ba 0c 00 00 00       	mov    $0xc,%edx
    200003ee:	be 00 80 05 00       	mov    $0x58000,%esi
    200003f3:	bf 00 00 00 00       	mov    $0x0,%edi
    200003f8:	e8 8f 10 00 00       	call   2000148c <UVM_Sig_Crt>
    200003fd:	48 85 c0             	test   %rax,%rax
    20000400:	79 5c                	jns    2000045e <main+0x1fc>
    20000402:	bf 28 18 00 20       	mov    $0x20001828,%edi
    20000407:	e8 d8 06 00 00       	call   20000ae4 <UVM_Print_String>
    2000040c:	bf 59 18 00 20       	mov    $0x20001859,%edi
    20000411:	e8 ce 06 00 00       	call   20000ae4 <UVM_Print_String>
    20000416:	bf 65 18 00 20       	mov    $0x20001865,%edi
    2000041b:	e8 c4 06 00 00       	call   20000ae4 <UVM_Print_String>
    20000420:	bf b5 00 00 00       	mov    $0xb5,%edi
    20000425:	e8 f0 03 00 00       	call   2000081a <UVM_Print_Int>
    2000042a:	bf 6d 18 00 20       	mov    $0x2000186d,%edi
    2000042f:	e8 b0 06 00 00       	call   20000ae4 <UVM_Print_String>
    20000434:	bf 70 18 00 20       	mov    $0x20001870,%edi
    20000439:	e8 a6 06 00 00       	call   20000ae4 <UVM_Print_String>
    2000043e:	bf 7c 18 00 20       	mov    $0x2000187c,%edi
    20000443:	e8 9c 06 00 00       	call   20000ae4 <UVM_Print_String>
    20000448:	bf 7f 18 00 20       	mov    $0x2000187f,%edi
    2000044d:	e8 92 06 00 00       	call   20000ae4 <UVM_Print_String>
    20000452:	bf 6d 18 00 20       	mov    $0x2000186d,%edi
    20000457:	e8 88 06 00 00       	call   20000ae4 <UVM_Print_String>
    2000045c:	eb fe                	jmp    2000045c <main+0x1fa>
        Cur_Addr+=UVM_SIG_SIZE;
    2000045e:	48 83 45 f8 20       	addq   $0x20,-0x8(%rbp)
        sum=0;
    20000463:	48 c7 05 b2 1b 00 00 	movq   $0x0,0x1bb2(%rip)        # 20002020 <sum>
    2000046a:	00 00 00 00 
        for(Count=0;Count<1000000;Count++)
    2000046e:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    20000475:	00 
    20000476:	eb 4c                	jmp    200004c4 <main+0x262>
        {
            start=__UVM_X64_Read_TSC();
    20000478:	e8 9e fb ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    2000047d:	48 89 05 84 1b 00 00 	mov    %rax,0x1b84(%rip)        # 20002008 <start>
            UVM_Sig_Snd(TEST_SIG1);
    20000484:	bf 0c 00 00 00       	mov    $0xc,%edi
    20000489:	e8 84 10 00 00       	call   20001512 <UVM_Sig_Snd>
            end=__UVM_X64_Read_TSC();
    2000048e:	e8 88 fb ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    20000493:	48 89 05 7e 1b 00 00 	mov    %rax,0x1b7e(%rip)        # 20002018 <end>
            sum+=end-start;
    2000049a:	48 8b 05 77 1b 00 00 	mov    0x1b77(%rip),%rax        # 20002018 <end>
    200004a1:	48 8b 15 60 1b 00 00 	mov    0x1b60(%rip),%rdx        # 20002008 <start>
    200004a8:	48 29 d0             	sub    %rdx,%rax
    200004ab:	48 89 c1             	mov    %rax,%rcx
    200004ae:	48 8b 05 6b 1b 00 00 	mov    0x1b6b(%rip),%rax        # 20002020 <sum>
    200004b5:	48 01 c8             	add    %rcx,%rax
    200004b8:	48 89 05 61 1b 00 00 	mov    %rax,0x1b61(%rip)        # 20002020 <sum>
        for(Count=0;Count<1000000;Count++)
    200004bf:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    200004c4:	48 81 7d f0 3f 42 0f 	cmpq   $0xf423f,-0x10(%rbp)
    200004cb:	00 
    200004cc:	7e aa                	jle    20000478 <main+0x216>
        }
        UVM_LOG_S("\r\nSignal send takes clock cycles:");
    200004ce:	bf 88 18 00 20       	mov    $0x20001888,%edi
    200004d3:	e8 0c 06 00 00       	call   20000ae4 <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
    200004d8:	48 8b 05 41 1b 00 00 	mov    0x1b41(%rip),%rax        # 20002020 <sum>
    200004df:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    200004e6:	de 1b 43 
    200004e9:	48 f7 e2             	mul    %rdx
    200004ec:	48 89 d0             	mov    %rdx,%rax
    200004ef:	48 c1 e8 12          	shr    $0x12,%rax
    200004f3:	48 89 c7             	mov    %rax,%rdi
    200004f6:	e8 1f 03 00 00       	call   2000081a <UVM_Print_Int>
        UVM_LOG_S("\r\n");
    200004fb:	bf 6d 18 00 20       	mov    $0x2000186d,%edi
    20000500:	e8 df 05 00 00       	call   20000ae4 <UVM_Print_String>
        /*Signal send test ends here*/


        /*Invocation stub test begins here*/
        /*Create test process capability table*/
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROC_CAPTBL,Cur_Addr,16)>=0);
    20000505:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000509:	41 b8 10 00 00 00    	mov    $0x10,%r8d
    2000050f:	48 89 c1             	mov    %rax,%rcx
    20000512:	ba 0d 00 00 00       	mov    $0xd,%edx
    20000517:	be 00 80 05 00       	mov    $0x58000,%esi
    2000051c:	bf 00 00 00 00       	mov    $0x0,%edi
    20000521:	e8 1d 06 00 00       	call   20000b43 <UVM_Captbl_Crt>
    20000526:	48 85 c0             	test   %rax,%rax
    20000529:	79 5c                	jns    20000587 <main+0x325>
    2000052b:	bf 28 18 00 20       	mov    $0x20001828,%edi
    20000530:	e8 af 05 00 00       	call   20000ae4 <UVM_Print_String>
    20000535:	bf 59 18 00 20       	mov    $0x20001859,%edi
    2000053a:	e8 a5 05 00 00       	call   20000ae4 <UVM_Print_String>
    2000053f:	bf 65 18 00 20       	mov    $0x20001865,%edi
    20000544:	e8 9b 05 00 00       	call   20000ae4 <UVM_Print_String>
    20000549:	bf c7 00 00 00       	mov    $0xc7,%edi
    2000054e:	e8 c7 02 00 00       	call   2000081a <UVM_Print_Int>
    20000553:	bf 6d 18 00 20       	mov    $0x2000186d,%edi
    20000558:	e8 87 05 00 00       	call   20000ae4 <UVM_Print_String>
    2000055d:	bf 70 18 00 20       	mov    $0x20001870,%edi
    20000562:	e8 7d 05 00 00       	call   20000ae4 <UVM_Print_String>
    20000567:	bf 7c 18 00 20       	mov    $0x2000187c,%edi
    2000056c:	e8 73 05 00 00       	call   20000ae4 <UVM_Print_String>
    20000571:	bf 7f 18 00 20       	mov    $0x2000187f,%edi
    20000576:	e8 69 05 00 00       	call   20000ae4 <UVM_Print_String>
    2000057b:	bf 6d 18 00 20       	mov    $0x2000186d,%edi
    20000580:	e8 5f 05 00 00       	call   20000ae4 <UVM_Print_String>
    20000585:	eb fe                	jmp    20000585 <main+0x323>
        Cur_Addr+=UVM_CAPTBL_SIZE(16);
    20000587:	48 81 45 f8 00 04 00 	addq   $0x400,-0x8(%rbp)
    2000058e:	00 
        /*Create test process page table*/
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS_PGT,Cur_Addr,1+16+8192)>=0);
    2000058f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000593:	41 b8 11 20 00 00    	mov    $0x2011,%r8d
    20000599:	48 89 c1             	mov    %rax,%rcx
    2000059c:	ba 0e 00 00 00       	mov    $0xe,%edx
    200005a1:	be 00 80 05 00       	mov    $0x58000,%esi
    200005a6:	bf 00 00 00 00       	mov    $0x0,%edi
    200005ab:	e8 93 05 00 00       	call   20000b43 <UVM_Captbl_Crt>
    200005b0:	48 85 c0             	test   %rax,%rax
    200005b3:	79 5c                	jns    20000611 <main+0x3af>
    200005b5:	bf 28 18 00 20       	mov    $0x20001828,%edi
    200005ba:	e8 25 05 00 00       	call   20000ae4 <UVM_Print_String>
    200005bf:	bf 59 18 00 20       	mov    $0x20001859,%edi
    200005c4:	e8 1b 05 00 00       	call   20000ae4 <UVM_Print_String>
    200005c9:	bf 65 18 00 20       	mov    $0x20001865,%edi
    200005ce:	e8 11 05 00 00       	call   20000ae4 <UVM_Print_String>
    200005d3:	bf ca 00 00 00       	mov    $0xca,%edi
    200005d8:	e8 3d 02 00 00       	call   2000081a <UVM_Print_Int>
    200005dd:	bf 6d 18 00 20       	mov    $0x2000186d,%edi
    200005e2:	e8 fd 04 00 00       	call   20000ae4 <UVM_Print_String>
    200005e7:	bf 70 18 00 20       	mov    $0x20001870,%edi
    200005ec:	e8 f3 04 00 00       	call   20000ae4 <UVM_Print_String>
    200005f1:	bf 7c 18 00 20       	mov    $0x2000187c,%edi
    200005f6:	e8 e9 04 00 00       	call   20000ae4 <UVM_Print_String>
    200005fb:	bf 7f 18 00 20       	mov    $0x2000187f,%edi
    20000600:	e8 df 04 00 00       	call   20000ae4 <UVM_Print_String>
    20000605:	bf 6d 18 00 20       	mov    $0x2000186d,%edi
    2000060a:	e8 d5 04 00 00       	call   20000ae4 <UVM_Print_String>
    2000060f:	eb fe                	jmp    2000060f <main+0x3ad>
        Cur_Addr+=UVM_CAPTBL_SIZE(1+16+8192);
    20000611:	48 81 45 f8 40 04 08 	addq   $0x80440,-0x8(%rbp)
    20000618:	00 
        /*Create test process PML4*/
        Cur_Addr+=UVM_ROUND_UP(Cur_Addr,12);
    20000619:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000061d:	48 05 ff 0f 00 00    	add    $0xfff,%rax
    20000623:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
    20000629:	48 01 45 f8          	add    %rax,-0x8(%rbp)
        UVM_ASSERT(UVM_Pgtbl_Crt(TEST_PROCESS_PGT,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS_PML4,Cur_Addr,0,1U,RME_PGT_SIZE_512G,RME_PGT_NUM_512)>=0);
    2000062d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000631:	6a 09                	push   $0x9
    20000633:	6a 27                	push   $0x27
    20000635:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    2000063b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    20000641:	48 89 c1             	mov    %rax,%rcx
    20000644:	ba 00 00 00 00       	mov    $0x0,%edx
    20000649:	be 00 80 05 00       	mov    $0x58000,%esi
    2000064e:	bf 0e 00 00 00       	mov    $0xe,%edi
    20000653:	e8 65 08 00 00       	call   20000ebd <UVM_Pgtbl_Crt>
    20000658:	48 83 c4 10          	add    $0x10,%rsp
    2000065c:	48 85 c0             	test   %rax,%rax
    2000065f:	79 5c                	jns    200006bd <main+0x45b>
    20000661:	bf 28 18 00 20       	mov    $0x20001828,%edi
    20000666:	e8 79 04 00 00       	call   20000ae4 <UVM_Print_String>
    2000066b:	bf 59 18 00 20       	mov    $0x20001859,%edi
    20000670:	e8 6f 04 00 00       	call   20000ae4 <UVM_Print_String>
    20000675:	bf 65 18 00 20       	mov    $0x20001865,%edi
    2000067a:	e8 65 04 00 00       	call   20000ae4 <UVM_Print_String>
    2000067f:	bf ce 00 00 00       	mov    $0xce,%edi
    20000684:	e8 91 01 00 00       	call   2000081a <UVM_Print_Int>
    20000689:	bf 6d 18 00 20       	mov    $0x2000186d,%edi
    2000068e:	e8 51 04 00 00       	call   20000ae4 <UVM_Print_String>
    20000693:	bf 70 18 00 20       	mov    $0x20001870,%edi
    20000698:	e8 47 04 00 00       	call   20000ae4 <UVM_Print_String>
    2000069d:	bf 7c 18 00 20       	mov    $0x2000187c,%edi
    200006a2:	e8 3d 04 00 00       	call   20000ae4 <UVM_Print_String>
    200006a7:	bf 7f 18 00 20       	mov    $0x2000187f,%edi
    200006ac:	e8 33 04 00 00       	call   20000ae4 <UVM_Print_String>
    200006b1:	bf 6d 18 00 20       	mov    $0x2000186d,%edi
    200006b6:	e8 29 04 00 00       	call   20000ae4 <UVM_Print_String>
    200006bb:	eb fe                	jmp    200006bb <main+0x459>
        Cur_Addr+=UVM_PGTBL_SIZE_NOM(RME_PGT_NUM_512);
    200006bd:	48 81 45 f8 00 00 04 	addq   $0x40000,-0x8(%rbp)
    200006c4:	00 
                                           Cur_Addr, 0, 0U,  RME_PGT_SIZE_2M, RME_PGT_NUM_512)>=0);
            Cur_Addr+=UVM_PGTBL_SIZE_NOM(RME_PGT_NUM_512);
            UVM_ASSERT(UVM_Pgtbl_Con(UVM_CAPID(TEST_PROCESS_PGT,RME_TEST_PDP(Count>>9)),Count&0x1FF,
                                       UVM_CAPID(TEST_PROCESS_PGT,RME_TEST_PDE(Count)),RME_PGT_ALL_PERM)>=0);
        }*/
        UVM_LOG_S("\r\nsuccess!!!!");
    200006c5:	bf aa 18 00 20       	mov    $0x200018aa,%edi
    200006ca:	e8 15 04 00 00       	call   20000ae4 <UVM_Print_String>
        Cur_Addr+=UVM_ROUND_UP(Cur_Addr,12);
    200006cf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200006d3:	48 05 ff 0f 00 00    	add    $0xfff,%rax
    200006d9:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
    200006df:	48 01 45 f8          	add    %rax,-0x8(%rbp)
        UVM_ASSERT(UVM_Proc_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS,TEST_PROC_CAPTBL,
    200006e3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200006e7:	49 89 c1             	mov    %rax,%r9
    200006ea:	41 b8 0e 00 00 00    	mov    $0xe,%r8d
    200006f0:	b9 0d 00 00 00       	mov    $0xd,%ecx
    200006f5:	ba 0f 00 00 00       	mov    $0xf,%edx
    200006fa:	be 00 80 05 00       	mov    $0x58000,%esi
    200006ff:	bf 00 00 00 00       	mov    $0x0,%edi
    20000704:	e8 be 09 00 00       	call   200010c7 <UVM_Proc_Crt>
    20000709:	48 85 c0             	test   %rax,%rax
    2000070c:	79 5c                	jns    2000076a <main+0x508>
    2000070e:	bf 28 18 00 20       	mov    $0x20001828,%edi
    20000713:	e8 cc 03 00 00       	call   20000ae4 <UVM_Print_String>
    20000718:	bf 59 18 00 20       	mov    $0x20001859,%edi
    2000071d:	e8 c2 03 00 00       	call   20000ae4 <UVM_Print_String>
    20000722:	bf 65 18 00 20       	mov    $0x20001865,%edi
    20000727:	e8 b8 03 00 00       	call   20000ae4 <UVM_Print_String>
    2000072c:	bf e6 00 00 00       	mov    $0xe6,%edi
    20000731:	e8 e4 00 00 00       	call   2000081a <UVM_Print_Int>
    20000736:	bf 6d 18 00 20       	mov    $0x2000186d,%edi
    2000073b:	e8 a4 03 00 00       	call   20000ae4 <UVM_Print_String>
    20000740:	bf 70 18 00 20       	mov    $0x20001870,%edi
    20000745:	e8 9a 03 00 00       	call   20000ae4 <UVM_Print_String>
    2000074a:	bf 7c 18 00 20       	mov    $0x2000187c,%edi
    2000074f:	e8 90 03 00 00       	call   20000ae4 <UVM_Print_String>
    20000754:	bf 7f 18 00 20       	mov    $0x2000187f,%edi
    20000759:	e8 86 03 00 00       	call   20000ae4 <UVM_Print_String>
    2000075e:	bf 6d 18 00 20       	mov    $0x2000186d,%edi
    20000763:	e8 7c 03 00 00       	call   20000ae4 <UVM_Print_String>
    20000768:	eb fe                	jmp    20000768 <main+0x506>
                                                TEST_PROCESS_PGT,Cur_Addr)>=0);
        UVM_LOG_S("\r\nsuccess!!!!");
    2000076a:	bf aa 18 00 20       	mov    $0x200018aa,%edi
    2000076f:	e8 70 03 00 00       	call   20000ae4 <UVM_Print_String>
        while (1);
    20000774:	eb fe                	jmp    20000774 <main+0x512>

        /*Invocation stub test ends here*/

        while (1);
    }
}
    20000776:	90                   	nop
    20000777:	c9                   	leave  
    20000778:	c3                   	ret    

0000000020000779 <UVM_List_Crt>:
Input       : volatile struct UVM_List* Head - The pointer to the list head.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Crt(volatile struct UVM_List* Head)
{
    20000779:	f3 0f 1e fa          	endbr64 
    2000077d:	55                   	push   %rbp
    2000077e:	48 89 e5             	mov    %rsp,%rbp
    20000781:	48 83 ec 08          	sub    $0x8,%rsp
    20000785:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    Head->Prev=(struct UVM_List*)Head;
    20000789:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000078d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000791:	48 89 10             	mov    %rdx,(%rax)
    Head->Next=(struct UVM_List*)Head;
    20000794:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000798:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    2000079c:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
    200007a0:	90                   	nop
    200007a1:	c9                   	leave  
    200007a2:	c3                   	ret    

00000000200007a3 <UVM_List_Del>:
              volatile struct UVM_List* Next - The next node of the target node.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Del(volatile struct UVM_List* Prev,volatile struct UVM_List* Next)
{
    200007a3:	f3 0f 1e fa          	endbr64 
    200007a7:	55                   	push   %rbp
    200007a8:	48 89 e5             	mov    %rsp,%rbp
    200007ab:	48 83 ec 10          	sub    $0x10,%rsp
    200007af:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200007b3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    Next->Prev=(struct UVM_List*)Prev;
    200007b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200007bb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    200007bf:	48 89 10             	mov    %rdx,(%rax)
    Prev->Next=(struct UVM_List*)Next;
    200007c2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200007c6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200007ca:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
    200007ce:	90                   	nop
    200007cf:	c9                   	leave  
    200007d0:	c3                   	ret    

00000000200007d1 <UVM_List_Ins>:
Return      : None.
******************************************************************************/
void UVM_List_Ins(volatile struct UVM_List* New,
                  volatile struct UVM_List* Prev,
                  volatile struct UVM_List* Next)
{
    200007d1:	f3 0f 1e fa          	endbr64 
    200007d5:	55                   	push   %rbp
    200007d6:	48 89 e5             	mov    %rsp,%rbp
    200007d9:	48 83 ec 18          	sub    $0x18,%rsp
    200007dd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200007e1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    200007e5:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    Next->Prev=(struct UVM_List*)New;
    200007e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    200007ed:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    200007f1:	48 89 10             	mov    %rdx,(%rax)
    New->Next=(struct UVM_List*)Next;
    200007f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200007f8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    200007fc:	48 89 50 08          	mov    %rdx,0x8(%rax)
    New->Prev=(struct UVM_List*)Prev;
    20000800:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000804:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20000808:	48 89 10             	mov    %rdx,(%rax)
    Prev->Next=(struct UVM_List*)New;
    2000080b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2000080f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000813:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
    20000817:	90                   	nop
    20000818:	c9                   	leave  
    20000819:	c3                   	ret    

000000002000081a <UVM_Print_Int>:
Input       : cnt_t Int - The integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Int(cnt_t Int)
{
    2000081a:	f3 0f 1e fa          	endbr64 
    2000081e:	55                   	push   %rbp
    2000081f:	48 89 e5             	mov    %rsp,%rbp
    20000822:	48 83 ec 30          	sub    $0x30,%rsp
    20000826:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    cnt_t Count;
    cnt_t Num;
    ptr_t Div;
    
    /* how many digits are there? */
    if(Int==0)
    2000082a:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
    2000082f:	75 14                	jne    20000845 <UVM_Print_Int+0x2b>
    {
        UVM_Putchar('0');
    20000831:	bf 30 00 00 00       	mov    $0x30,%edi
    20000836:	e8 39 0e 00 00       	call   20001674 <UVM_Putchar>
        return 1;
    2000083b:	b8 01 00 00 00       	mov    $0x1,%eax
    20000840:	e9 d8 01 00 00       	jmp    20000a1d <UVM_Print_Int+0x203>
    }
    else if(Int<0)
    20000845:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
    2000084a:	0f 89 f1 00 00 00    	jns    20000941 <UVM_Print_Int+0x127>
    {
        /* How many digits are there? */
        Count=0;
    20000850:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    20000857:	00 
        Div=1;
    20000858:	48 c7 45 e0 01 00 00 	movq   $0x1,-0x20(%rbp)
    2000085f:	00 
        Iter=-Int;
    20000860:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000864:	48 f7 d8             	neg    %rax
    20000867:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while(Iter!=0)
    2000086b:	eb 36                	jmp    200008a3 <UVM_Print_Int+0x89>
        {
            Iter/=10;
    2000086d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000871:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000878:	cc cc cc 
    2000087b:	48 f7 e2             	mul    %rdx
    2000087e:	48 89 d0             	mov    %rdx,%rax
    20000881:	48 c1 e8 03          	shr    $0x3,%rax
    20000885:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            Count++;
    20000889:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
            Div*=10;
    2000088e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    20000892:	48 89 d0             	mov    %rdx,%rax
    20000895:	48 c1 e0 02          	shl    $0x2,%rax
    20000899:	48 01 d0             	add    %rdx,%rax
    2000089c:	48 01 c0             	add    %rax,%rax
    2000089f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Iter!=0)
    200008a3:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    200008a8:	75 c3                	jne    2000086d <UVM_Print_Int+0x53>
        }
        Div/=10;
    200008aa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    200008ae:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    200008b5:	cc cc cc 
    200008b8:	48 f7 e2             	mul    %rdx
    200008bb:	48 89 d0             	mov    %rdx,%rax
    200008be:	48 c1 e8 03          	shr    $0x3,%rax
    200008c2:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        
        UVM_Putchar('-');
    200008c6:	bf 2d 00 00 00       	mov    $0x2d,%edi
    200008cb:	e8 a4 0d 00 00       	call   20001674 <UVM_Putchar>
        Iter=-Int;
    200008d0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    200008d4:	48 f7 d8             	neg    %rax
    200008d7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        Num=Count+1;
    200008db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200008df:	48 83 c0 01          	add    $0x1,%rax
    200008e3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        
        while(Count>0)
    200008e7:	eb 4c                	jmp    20000935 <UVM_Print_Int+0x11b>
        {
            Count--;
    200008e9:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            UVM_Putchar(Iter/Div+'0');
    200008ee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200008f2:	ba 00 00 00 00       	mov    $0x0,%edx
    200008f7:	48 f7 75 e0          	divq   -0x20(%rbp)
    200008fb:	83 c0 30             	add    $0x30,%eax
    200008fe:	0f be c0             	movsbl %al,%eax
    20000901:	89 c7                	mov    %eax,%edi
    20000903:	e8 6c 0d 00 00       	call   20001674 <UVM_Putchar>
            Iter=Iter%Div;
    20000908:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000090c:	ba 00 00 00 00       	mov    $0x0,%edx
    20000911:	48 f7 75 e0          	divq   -0x20(%rbp)
    20000915:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
            Div/=10;
    20000919:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2000091d:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000924:	cc cc cc 
    20000927:	48 f7 e2             	mul    %rdx
    2000092a:	48 89 d0             	mov    %rdx,%rax
    2000092d:	48 c1 e8 03          	shr    $0x3,%rax
    20000931:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Count>0)
    20000935:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    2000093a:	7f ad                	jg     200008e9 <UVM_Print_Int+0xcf>
    2000093c:	e9 d8 00 00 00       	jmp    20000a19 <UVM_Print_Int+0x1ff>
        }
    }
    else
    {
        /* How many digits are there? */
        Count=0;
    20000941:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    20000948:	00 
        Div=1;
    20000949:	48 c7 45 e0 01 00 00 	movq   $0x1,-0x20(%rbp)
    20000950:	00 
        Iter=Int;
    20000951:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000955:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while(Iter!=0)
    20000959:	eb 36                	jmp    20000991 <UVM_Print_Int+0x177>
        {
            Iter/=10;
    2000095b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000095f:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000966:	cc cc cc 
    20000969:	48 f7 e2             	mul    %rdx
    2000096c:	48 89 d0             	mov    %rdx,%rax
    2000096f:	48 c1 e8 03          	shr    $0x3,%rax
    20000973:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            Count++;
    20000977:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
            Div*=10;
    2000097c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    20000980:	48 89 d0             	mov    %rdx,%rax
    20000983:	48 c1 e0 02          	shl    $0x2,%rax
    20000987:	48 01 d0             	add    %rdx,%rax
    2000098a:	48 01 c0             	add    %rax,%rax
    2000098d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Iter!=0)
    20000991:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    20000996:	75 c3                	jne    2000095b <UVM_Print_Int+0x141>
        }
        Div/=10;
    20000998:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2000099c:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    200009a3:	cc cc cc 
    200009a6:	48 f7 e2             	mul    %rdx
    200009a9:	48 89 d0             	mov    %rdx,%rax
    200009ac:	48 c1 e8 03          	shr    $0x3,%rax
    200009b0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        
        Iter=Int;
    200009b4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    200009b8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        Num=Count;
    200009bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200009c0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        
        while(Count>0)
    200009c4:	eb 4c                	jmp    20000a12 <UVM_Print_Int+0x1f8>
        {
            Count--;
    200009c6:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            UVM_Putchar(Iter/Div+'0');
    200009cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200009cf:	ba 00 00 00 00       	mov    $0x0,%edx
    200009d4:	48 f7 75 e0          	divq   -0x20(%rbp)
    200009d8:	83 c0 30             	add    $0x30,%eax
    200009db:	0f be c0             	movsbl %al,%eax
    200009de:	89 c7                	mov    %eax,%edi
    200009e0:	e8 8f 0c 00 00       	call   20001674 <UVM_Putchar>
            Iter=Iter%Div;
    200009e5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200009e9:	ba 00 00 00 00       	mov    $0x0,%edx
    200009ee:	48 f7 75 e0          	divq   -0x20(%rbp)
    200009f2:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
            Div/=10;
    200009f6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    200009fa:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000a01:	cc cc cc 
    20000a04:	48 f7 e2             	mul    %rdx
    20000a07:	48 89 d0             	mov    %rdx,%rax
    20000a0a:	48 c1 e8 03          	shr    $0x3,%rax
    20000a0e:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Count>0)
    20000a12:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    20000a17:	7f ad                	jg     200009c6 <UVM_Print_Int+0x1ac>
        }
    }
    
    return Num;
    20000a19:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
    20000a1d:	c9                   	leave  
    20000a1e:	c3                   	ret    

0000000020000a1f <UVM_Print_Uint>:
Input       : ptr_t Uint - The unsigned integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Uint(ptr_t Uint)
{
    20000a1f:	f3 0f 1e fa          	endbr64 
    20000a23:	55                   	push   %rbp
    20000a24:	48 89 e5             	mov    %rsp,%rbp
    20000a27:	48 83 ec 30          	sub    $0x30,%rsp
    20000a2b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    ptr_t Iter;
    cnt_t Count;
    cnt_t Num;
    
    /* how many digits are there? */
    if(Uint==0)
    20000a2f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
    20000a34:	75 14                	jne    20000a4a <UVM_Print_Uint+0x2b>
    {
        UVM_Putchar('0');
    20000a36:	bf 30 00 00 00       	mov    $0x30,%edi
    20000a3b:	e8 34 0c 00 00       	call   20001674 <UVM_Putchar>
        return 1;
    20000a40:	b8 01 00 00 00       	mov    $0x1,%eax
    20000a45:	e9 98 00 00 00       	jmp    20000ae2 <UVM_Print_Uint+0xc3>
    }
    else
    {
        /* Filter out all the zeroes */
        Count=0;
    20000a4a:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    20000a51:	00 
        Iter=Uint;
    20000a52:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000a56:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    20000a5a:	eb 0a                	jmp    20000a66 <UVM_Print_Uint+0x47>
        {
            Iter<<=4;
    20000a5c:	48 c1 65 f8 04       	shlq   $0x4,-0x8(%rbp)
            Count++;
    20000a61:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    20000a66:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000a6a:	48 c1 e8 3c          	shr    $0x3c,%rax
    20000a6e:	48 85 c0             	test   %rax,%rax
    20000a71:	74 e9                	je     20000a5c <UVM_Print_Uint+0x3d>
        }
        /* Count is the number of pts to print */
        Count=sizeof(ptr_t)*2-Count;
    20000a73:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20000a77:	b8 10 00 00 00       	mov    $0x10,%eax
    20000a7c:	48 29 d0             	sub    %rdx,%rax
    20000a7f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        Num=Count;
    20000a83:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000a87:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        while(Count>0)
    20000a8b:	eb 4a                	jmp    20000ad7 <UVM_Print_Uint+0xb8>
        {
            Count--;
    20000a8d:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            Iter=(Uint>>(Count*4))&0x0F;
    20000a92:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000a96:	c1 e0 02             	shl    $0x2,%eax
    20000a99:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    20000a9d:	89 c1                	mov    %eax,%ecx
    20000a9f:	48 d3 ea             	shr    %cl,%rdx
    20000aa2:	48 89 d0             	mov    %rdx,%rax
    20000aa5:	83 e0 0f             	and    $0xf,%eax
    20000aa8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            if(Iter<10)
    20000aac:	48 83 7d f8 09       	cmpq   $0x9,-0x8(%rbp)
    20000ab1:	77 13                	ja     20000ac6 <UVM_Print_Uint+0xa7>
                UVM_Putchar('0'+Iter);
    20000ab3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000ab7:	83 c0 30             	add    $0x30,%eax
    20000aba:	0f be c0             	movsbl %al,%eax
    20000abd:	89 c7                	mov    %eax,%edi
    20000abf:	e8 b0 0b 00 00       	call   20001674 <UVM_Putchar>
    20000ac4:	eb 11                	jmp    20000ad7 <UVM_Print_Uint+0xb8>
            else
                UVM_Putchar('A'+Iter-10);
    20000ac6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000aca:	83 c0 37             	add    $0x37,%eax
    20000acd:	0f be c0             	movsbl %al,%eax
    20000ad0:	89 c7                	mov    %eax,%edi
    20000ad2:	e8 9d 0b 00 00       	call   20001674 <UVM_Putchar>
        while(Count>0)
    20000ad7:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    20000adc:	7f af                	jg     20000a8d <UVM_Print_Uint+0x6e>
        }
    }
    
    return Num;
    20000ade:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
    20000ae2:	c9                   	leave  
    20000ae3:	c3                   	ret    

0000000020000ae4 <UVM_Print_String>:
Input       : s8* String - The string to print.
Output      : None.
Return      : cnt_t - The length of the string printed, the '\0' is not included.
******************************************************************************/
cnt_t UVM_Print_String(s8* String)
{
    20000ae4:	f3 0f 1e fa          	endbr64 
    20000ae8:	55                   	push   %rbp
    20000ae9:	48 89 e5             	mov    %rsp,%rbp
    20000aec:	48 83 ec 20          	sub    $0x20,%rsp
    20000af0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    cnt_t Count;
    
    Count=0;
    20000af4:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    20000afb:	00 
    while(Count<UVM_USER_DEBUG_MAX_STR)
    20000afc:	eb 35                	jmp    20000b33 <UVM_Print_String+0x4f>
    {
        if(String[Count]=='\0')
    20000afe:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000b02:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000b06:	48 01 d0             	add    %rdx,%rax
    20000b09:	0f b6 00             	movzbl (%rax),%eax
    20000b0c:	84 c0                	test   %al,%al
    20000b0e:	74 2c                	je     20000b3c <UVM_Print_String+0x58>
            break;
        
        UVM_Putchar(String[Count++]);
    20000b10:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000b14:	48 8d 50 01          	lea    0x1(%rax),%rdx
    20000b18:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
    20000b1c:	48 89 c2             	mov    %rax,%rdx
    20000b1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000b23:	48 01 d0             	add    %rdx,%rax
    20000b26:	0f b6 00             	movzbl (%rax),%eax
    20000b29:	0f be c0             	movsbl %al,%eax
    20000b2c:	89 c7                	mov    %eax,%edi
    20000b2e:	e8 41 0b 00 00       	call   20001674 <UVM_Putchar>
    while(Count<UVM_USER_DEBUG_MAX_STR)
    20000b33:	48 83 7d f8 7f       	cmpq   $0x7f,-0x8(%rbp)
    20000b38:	7e c4                	jle    20000afe <UVM_Print_String+0x1a>
    20000b3a:	eb 01                	jmp    20000b3d <UVM_Print_String+0x59>
            break;
    20000b3c:	90                   	nop
    }
    
    return Count;
    20000b3d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
    20000b41:	c9                   	leave  
    20000b42:	c3                   	ret    

0000000020000b43 <UVM_Captbl_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, 
                     cid_t Cap_Captbl, ptr_t Vaddr, ptr_t Entry_Num)
{
    20000b43:	f3 0f 1e fa          	endbr64 
    20000b47:	55                   	push   %rbp
    20000b48:	48 89 e5             	mov    %rsp,%rbp
    20000b4b:	48 83 ec 30          	sub    $0x30,%rsp
    20000b4f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000b53:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000b57:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20000b5b:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20000b5f:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_CRT, Cap_Captbl_Crt,
    20000b63:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000b67:	48 c1 e0 20          	shl    $0x20,%rax
    20000b6b:	48 89 c2             	mov    %rax,%rdx
    20000b6e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000b72:	89 c0                	mov    %eax,%eax
    20000b74:	48 89 d6             	mov    %rdx,%rsi
    20000b77:	48 09 c6             	or     %rax,%rsi
    20000b7a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000b7e:	48 ba 00 00 00 00 0a 	movabs $0xa00000000,%rdx
    20000b85:	00 00 00 
    20000b88:	48 09 d0             	or     %rdx,%rax
    20000b8b:	48 89 c7             	mov    %rax,%rdi
    20000b8e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    20000b92:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000b96:	48 89 d1             	mov    %rdx,%rcx
    20000b99:	48 89 c2             	mov    %rax,%rdx
    20000b9c:	e8 4c f5 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Captbl),
                      Vaddr,
                      Entry_Num);
}
    20000ba1:	c9                   	leave  
    20000ba2:	c3                   	ret    

0000000020000ba3 <UVM_Captbl_Del>:
              cid_t Cap_Del - The capability to the capability table to be deleted. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Del(cid_t Cap_Captbl_Del, cid_t Cap_Del)
{
    20000ba3:	f3 0f 1e fa          	endbr64 
    20000ba7:	55                   	push   %rbp
    20000ba8:	48 89 e5             	mov    %rsp,%rbp
    20000bab:	48 83 ec 10          	sub    $0x10,%rsp
    20000baf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000bb3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_DEL, Cap_Captbl_Del,
    20000bb7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000bbb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000bbf:	48 b9 00 00 00 00 0b 	movabs $0xb00000000,%rcx
    20000bc6:	00 00 00 
    20000bc9:	48 09 ca             	or     %rcx,%rdx
    20000bcc:	48 89 d7             	mov    %rdx,%rdi
    20000bcf:	b9 00 00 00 00       	mov    $0x0,%ecx
    20000bd4:	ba 00 00 00 00       	mov    $0x0,%edx
    20000bd9:	48 89 c6             	mov    %rax,%rsi
    20000bdc:	e8 0c f5 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Del,
                      0,
                      0);
}
    20000be1:	c9                   	leave  
    20000be2:	c3                   	ret    

0000000020000be3 <UVM_Captbl_Frz>:
              cid_t Cap_Frz - The cap to the kernel object being freezed. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Frz(cid_t Cap_Captbl_Frz, cid_t Cap_Frz)
{
    20000be3:	f3 0f 1e fa          	endbr64 
    20000be7:	55                   	push   %rbp
    20000be8:	48 89 e5             	mov    %rsp,%rbp
    20000beb:	48 83 ec 10          	sub    $0x10,%rsp
    20000bef:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000bf3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
        return UVM_CAP_OP(RME_SVC_CPT_FRZ, Cap_Captbl_Frz,
    20000bf7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000bfb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000bff:	48 b9 00 00 00 00 0c 	movabs $0xc00000000,%rcx
    20000c06:	00 00 00 
    20000c09:	48 09 ca             	or     %rcx,%rdx
    20000c0c:	48 89 d7             	mov    %rdx,%rdi
    20000c0f:	b9 00 00 00 00       	mov    $0x0,%ecx
    20000c14:	ba 00 00 00 00       	mov    $0x0,%edx
    20000c19:	48 89 c6             	mov    %rax,%rsi
    20000c1c:	e8 cc f4 ff ff       	call   200000ed <UVM_Svc>
                          Cap_Frz,
                          0,
                          0);
}
    20000c21:	c9                   	leave  
    20000c22:	c3                   	ret    

0000000020000c23 <UVM_Captbl_Add>:
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Add(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                     cid_t Cap_Captbl_Src, cid_t Cap_Src, ptr_t Flags)
{
    20000c23:	f3 0f 1e fa          	endbr64 
    20000c27:	55                   	push   %rbp
    20000c28:	48 89 e5             	mov    %rsp,%rbp
    20000c2b:	48 83 ec 30          	sub    $0x30,%rsp
    20000c2f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000c33:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000c37:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20000c3b:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20000c3f:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    20000c43:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000c47:	48 c1 e0 20          	shl    $0x20,%rax
    20000c4b:	48 89 c2             	mov    %rax,%rdx
    20000c4e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000c52:	89 c0                	mov    %eax,%eax
    20000c54:	48 09 c2             	or     %rax,%rdx
    20000c57:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000c5b:	48 c1 e0 20          	shl    $0x20,%rax
    20000c5f:	48 89 c1             	mov    %rax,%rcx
    20000c62:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000c66:	89 c0                	mov    %eax,%eax
    20000c68:	48 09 c1             	or     %rax,%rcx
    20000c6b:	48 89 ce             	mov    %rcx,%rsi
    20000c6e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000c72:	48 89 c1             	mov    %rax,%rcx
    20000c75:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    20000c7c:	00 00 00 
    20000c7f:	48 89 c7             	mov    %rax,%rdi
    20000c82:	e8 66 f4 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),Flags);
}
    20000c87:	c9                   	leave  
    20000c88:	c3                   	ret    

0000000020000c89 <UVM_Captbl_Pgtbl>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Pgtbl(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                       cid_t Cap_Captbl_Src, cid_t Cap_Src,
                       ptr_t Start, ptr_t End, ptr_t Flags)
{
    20000c89:	f3 0f 1e fa          	endbr64 
    20000c8d:	55                   	push   %rbp
    20000c8e:	48 89 e5             	mov    %rsp,%rbp
    20000c91:	48 83 ec 30          	sub    $0x30,%rsp
    20000c95:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000c99:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000c9d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20000ca1:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20000ca5:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    20000ca9:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    20000cad:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20000cb1:	48 c1 e0 24          	shl    $0x24,%rax
    20000cb5:	48 89 c2             	mov    %rax,%rdx
    20000cb8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000cbc:	48 c1 e0 08          	shl    $0x8,%rax
    20000cc0:	48 09 d0             	or     %rdx,%rax
    20000cc3:	48 0b 45 10          	or     0x10(%rbp),%rax
    20000cc7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20000ccb:	48 89 d1             	mov    %rdx,%rcx
    20000cce:	48 c1 e1 20          	shl    $0x20,%rcx
    20000cd2:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    20000cd6:	89 d2                	mov    %edx,%edx
    20000cd8:	48 09 ca             	or     %rcx,%rdx
    20000cdb:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    20000cdf:	48 89 ce             	mov    %rcx,%rsi
    20000ce2:	48 c1 e6 20          	shl    $0x20,%rsi
    20000ce6:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    20000cea:	89 c9                	mov    %ecx,%ecx
    20000cec:	48 09 ce             	or     %rcx,%rsi
    20000cef:	48 89 c1             	mov    %rax,%rcx
    20000cf2:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    20000cf9:	00 00 00 
    20000cfc:	48 89 c7             	mov    %rax,%rdi
    20000cff:	e8 e9 f3 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_PGTBL_FLAG(End,Start,Flags));
}
    20000d04:	c9                   	leave  
    20000d05:	c3                   	ret    

0000000020000d06 <UVM_Captbl_Kern>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kern(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End)
{
    20000d06:	f3 0f 1e fa          	endbr64 
    20000d0a:	55                   	push   %rbp
    20000d0b:	48 89 e5             	mov    %rsp,%rbp
    20000d0e:	48 83 ec 30          	sub    $0x30,%rsp
    20000d12:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000d16:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000d1a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20000d1e:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20000d22:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    20000d26:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    20000d2a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20000d2e:	48 c1 e0 20          	shl    $0x20,%rax
    20000d32:	48 0b 45 d8          	or     -0x28(%rbp),%rax
    20000d36:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20000d3a:	48 c1 e2 20          	shl    $0x20,%rdx
    20000d3e:	48 89 d1             	mov    %rdx,%rcx
    20000d41:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    20000d45:	89 d2                	mov    %edx,%edx
    20000d47:	48 09 ca             	or     %rcx,%rdx
    20000d4a:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    20000d4e:	48 89 ce             	mov    %rcx,%rsi
    20000d51:	48 c1 e6 20          	shl    $0x20,%rsi
    20000d55:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    20000d59:	89 c9                	mov    %ecx,%ecx
    20000d5b:	48 09 ce             	or     %rcx,%rsi
    20000d5e:	48 89 c1             	mov    %rax,%rcx
    20000d61:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    20000d68:	00 00 00 
    20000d6b:	48 89 c7             	mov    %rax,%rdi
    20000d6e:	e8 7a f3 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_KERN_FLAG(End,Start));
}
    20000d73:	c9                   	leave  
    20000d74:	c3                   	ret    

0000000020000d75 <UVM_Captbl_Kmem>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kmem(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End, ptr_t Flags)
{
    20000d75:	f3 0f 1e fa          	endbr64 
    20000d79:	55                   	push   %rbp
    20000d7a:	48 89 e5             	mov    %rsp,%rbp
    20000d7d:	48 83 ec 30          	sub    $0x30,%rsp
    20000d81:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000d85:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000d89:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20000d8d:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20000d91:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    20000d95:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(UVM_KMEM_SVC(End,RME_SVC_CPT_ADD), UVM_KMEM_CAPID(Start,Flags),
    20000d99:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
    20000da0:	ff ff ff 
    20000da3:	48 23 45 d0          	and    -0x30(%rbp),%rax
    20000da7:	48 89 c2             	mov    %rax,%rdx
    20000daa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000dae:	48 c1 e8 20          	shr    $0x20,%rax
    20000db2:	48 89 d1             	mov    %rdx,%rcx
    20000db5:	48 09 c1             	or     %rax,%rcx
    20000db8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000dbc:	48 c1 e0 20          	shl    $0x20,%rax
    20000dc0:	48 89 c2             	mov    %rax,%rdx
    20000dc3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000dc7:	89 c0                	mov    %eax,%eax
    20000dc9:	48 09 c2             	or     %rax,%rdx
    20000dcc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000dd0:	48 c1 e0 20          	shl    $0x20,%rax
    20000dd4:	48 89 c6             	mov    %rax,%rsi
    20000dd7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000ddb:	89 c0                	mov    %eax,%eax
    20000ddd:	48 09 c6             	or     %rax,%rsi
    20000de0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20000de4:	48 c1 e8 06          	shr    $0x6,%rax
    20000de8:	48 c1 e0 26          	shl    $0x26,%rax
    20000dec:	48 89 c7             	mov    %rax,%rdi
    20000def:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000df3:	48 c1 e8 06          	shr    $0x6,%rax
    20000df7:	48 c1 e0 26          	shl    $0x26,%rax
    20000dfb:	48 c1 e8 20          	shr    $0x20,%rax
    20000dff:	48 0b 45 10          	or     0x10(%rbp),%rax
    20000e03:	48 09 c7             	or     %rax,%rdi
    20000e06:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    20000e0d:	00 00 00 
    20000e10:	48 09 f8             	or     %rdi,%rax
    20000e13:	48 89 c7             	mov    %rax,%rdi
    20000e16:	e8 d2 f2 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_KMEM_FLAG(End,Start));
}
    20000e1b:	c9                   	leave  
    20000e1c:	c3                   	ret    

0000000020000e1d <UVM_Captbl_Rem>:
              cid_t Cap_Rem - The capability slot you want to remove. 1-Level.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Rem(cid_t Cap_Captbl_Rem, cid_t Cap_Rem)
{
    20000e1d:	f3 0f 1e fa          	endbr64 
    20000e21:	55                   	push   %rbp
    20000e22:	48 89 e5             	mov    %rsp,%rbp
    20000e25:	48 83 ec 10          	sub    $0x10,%rsp
    20000e29:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000e2d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_REM, Cap_Captbl_Rem,
    20000e31:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000e35:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000e39:	48 b9 00 00 00 00 0e 	movabs $0xe00000000,%rcx
    20000e40:	00 00 00 
    20000e43:	48 09 ca             	or     %rcx,%rdx
    20000e46:	48 89 d7             	mov    %rdx,%rdi
    20000e49:	b9 00 00 00 00       	mov    $0x0,%ecx
    20000e4e:	ba 00 00 00 00       	mov    $0x0,%edx
    20000e53:	48 89 c6             	mov    %rax,%rsi
    20000e56:	e8 92 f2 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Rem,
                      0,
                      0);
}
    20000e5b:	c9                   	leave  
    20000e5c:	c3                   	ret    

0000000020000e5d <UVM_Kern_Act>:
                      kernel function ever causes a context switch, it is responsible
                      for setting the return value. On failure, a context switch 
                      in the kernel fucntion is banned.
******************************************************************************/
ret_t UVM_Kern_Act(cid_t Cap_Kern, ptr_t Func_ID, ptr_t Sub_ID, ptr_t Param1, ptr_t Param2)
{
    20000e5d:	f3 0f 1e fa          	endbr64 
    20000e61:	55                   	push   %rbp
    20000e62:	48 89 e5             	mov    %rsp,%rbp
    20000e65:	48 83 ec 30          	sub    $0x30,%rsp
    20000e69:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000e6d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000e71:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20000e75:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20000e79:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_KFN, Cap_Kern,
    20000e7d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000e81:	48 c1 e0 20          	shl    $0x20,%rax
    20000e85:	48 89 c2             	mov    %rax,%rdx
    20000e88:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000e8c:	89 c0                	mov    %eax,%eax
    20000e8e:	48 89 d6             	mov    %rdx,%rsi
    20000e91:	48 09 c6             	or     %rax,%rsi
    20000e94:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000e98:	48 ba 00 00 00 00 04 	movabs $0x400000000,%rdx
    20000e9f:	00 00 00 
    20000ea2:	48 09 d0             	or     %rdx,%rax
    20000ea5:	48 89 c7             	mov    %rax,%rdi
    20000ea8:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    20000eac:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000eb0:	48 89 d1             	mov    %rdx,%rcx
    20000eb3:	48 89 c2             	mov    %rax,%rdx
    20000eb6:	e8 32 f2 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Sub_ID)|UVM_PARAM_D0(Func_ID),
                      Param1,
                      Param2);
}
    20000ebb:	c9                   	leave  
    20000ebc:	c3                   	ret    

0000000020000ebd <UVM_Pgtbl_Crt>:
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Pgtbl, 
                    ptr_t Vaddr, ptr_t Start_Addr, ptr_t Top_Flag,
                    ptr_t Size_Order, ptr_t Num_Order)
{
    20000ebd:	f3 0f 1e fa          	endbr64 
    20000ec1:	55                   	push   %rbp
    20000ec2:	48 89 e5             	mov    %rsp,%rbp
    20000ec5:	48 83 ec 30          	sub    $0x30,%rsp
    20000ec9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000ecd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000ed1:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20000ed5:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20000ed9:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    20000edd:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    
    return UVM_CAP_OP(UVM_PGTBL_SVC(Num_Order,RME_SVC_PGT_CRT), Cap_Captbl,
    20000ee1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000ee5:	48 0b 45 d0          	or     -0x30(%rbp),%rax
    20000ee9:	48 89 c2             	mov    %rax,%rdx
    20000eec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000ef0:	48 c1 e0 20          	shl    $0x20,%rax
    20000ef4:	48 89 c1             	mov    %rax,%rcx
    20000ef7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000efb:	48 c1 e0 10          	shl    $0x10,%rax
    20000eff:	89 c0                	mov    %eax,%eax
    20000f01:	48 09 c1             	or     %rax,%rcx
    20000f04:	48 8b 45 10          	mov    0x10(%rbp),%rax
    20000f08:	0f b7 c0             	movzwl %ax,%eax
    20000f0b:	48 89 ce             	mov    %rcx,%rsi
    20000f0e:	48 09 c6             	or     %rax,%rsi
    20000f11:	48 8b 45 18          	mov    0x18(%rbp),%rax
    20000f15:	48 c1 e0 10          	shl    $0x10,%rax
    20000f19:	48 c1 e0 20          	shl    $0x20,%rax
    20000f1d:	48 89 c1             	mov    %rax,%rcx
    20000f20:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000f24:	48 09 c1             	or     %rax,%rcx
    20000f27:	48 b8 00 00 00 00 0f 	movabs $0xf00000000,%rax
    20000f2e:	00 00 00 
    20000f31:	48 89 cf             	mov    %rcx,%rdi
    20000f34:	48 09 c7             	or     %rax,%rdi
    20000f37:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000f3b:	48 89 d1             	mov    %rdx,%rcx
    20000f3e:	48 89 c2             	mov    %rax,%rdx
    20000f41:	e8 a7 f1 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_Q1(Cap_Pgtbl)|UVM_PARAM_Q0(Size_Order),
                      Vaddr, 
                      Start_Addr|Top_Flag);
}
    20000f46:	c9                   	leave  
    20000f47:	c3                   	ret    

0000000020000f48 <UVM_Pgtbl_Del>:
                                page table capability to be in. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Del(cid_t Cap_Captbl, cid_t Cap_Pgtbl)
{
    20000f48:	f3 0f 1e fa          	endbr64 
    20000f4c:	55                   	push   %rbp
    20000f4d:	48 89 e5             	mov    %rsp,%rbp
    20000f50:	48 83 ec 10          	sub    $0x10,%rsp
    20000f54:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000f58:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_DEL, Cap_Captbl,
    20000f5c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000f60:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000f64:	48 b9 00 00 00 00 10 	movabs $0x1000000000,%rcx
    20000f6b:	00 00 00 
    20000f6e:	48 09 ca             	or     %rcx,%rdx
    20000f71:	48 89 d7             	mov    %rdx,%rdi
    20000f74:	b9 00 00 00 00       	mov    $0x0,%ecx
    20000f79:	ba 00 00 00 00       	mov    $0x0,%edx
    20000f7e:	48 89 c6             	mov    %rax,%rsi
    20000f81:	e8 67 f1 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Pgtbl,
                      0,
                      0);
}
    20000f86:	c9                   	leave  
    20000f87:	c3                   	ret    

0000000020000f88 <UVM_Pgtbl_Add>:
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Add(cid_t Cap_Pgtbl_Dst, ptr_t Pos_Dst, ptr_t Flags_Dst,
                    cid_t Cap_Pgtbl_Src, ptr_t Pos_Src, ptr_t Index)
{
    20000f88:	f3 0f 1e fa          	endbr64 
    20000f8c:	55                   	push   %rbp
    20000f8d:	48 89 e5             	mov    %rsp,%rbp
    20000f90:	48 83 ec 30          	sub    $0x30,%rsp
    20000f94:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000f98:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000f9c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20000fa0:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20000fa4:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    20000fa8:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_ADD, 0,
    20000fac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000fb0:	48 c1 e0 20          	shl    $0x20,%rax
    20000fb4:	48 89 c2             	mov    %rax,%rdx
    20000fb7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20000fbb:	89 c0                	mov    %eax,%eax
    20000fbd:	48 89 d1             	mov    %rdx,%rcx
    20000fc0:	48 09 c1             	or     %rax,%rcx
    20000fc3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000fc7:	48 c1 e0 20          	shl    $0x20,%rax
    20000fcb:	48 89 c2             	mov    %rax,%rdx
    20000fce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000fd2:	89 c0                	mov    %eax,%eax
    20000fd4:	48 09 c2             	or     %rax,%rdx
    20000fd7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000fdb:	48 c1 e0 20          	shl    $0x20,%rax
    20000fdf:	48 89 c6             	mov    %rax,%rsi
    20000fe2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000fe6:	89 c0                	mov    %eax,%eax
    20000fe8:	48 09 f0             	or     %rsi,%rax
    20000feb:	48 89 c6             	mov    %rax,%rsi
    20000fee:	48 b8 00 00 00 00 11 	movabs $0x1100000000,%rax
    20000ff5:	00 00 00 
    20000ff8:	48 89 c7             	mov    %rax,%rdi
    20000ffb:	e8 ed f0 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Pgtbl_Dst)|UVM_PARAM_D0(Pos_Dst),
                      UVM_PARAM_D1(Cap_Pgtbl_Src)|UVM_PARAM_D0(Pos_Src),
                      UVM_PARAM_D1(Flags_Dst)|UVM_PARAM_D0(Index));
}
    20001000:	c9                   	leave  
    20001001:	c3                   	ret    

0000000020001002 <UVM_Pgtbl_Rem>:
              ptr_t Pos - The virtual address position to unmap from.
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Rem(cid_t Cap_Pgtbl, ptr_t Pos)
{
    20001002:	f3 0f 1e fa          	endbr64 
    20001006:	55                   	push   %rbp
    20001007:	48 89 e5             	mov    %rsp,%rbp
    2000100a:	48 83 ec 10          	sub    $0x10,%rsp
    2000100e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001012:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_REM, 0,
    20001016:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000101a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    2000101e:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001023:	48 89 c6             	mov    %rax,%rsi
    20001026:	48 b8 00 00 00 00 12 	movabs $0x1200000000,%rax
    2000102d:	00 00 00 
    20001030:	48 89 c7             	mov    %rax,%rdi
    20001033:	e8 b5 f0 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Pgtbl,
                      Pos,
                      0);
}
    20001038:	c9                   	leave  
    20001039:	c3                   	ret    

000000002000103a <UVM_Pgtbl_Con>:
              ptr_t Flags_Child - This have no effect on MPU-based architectures.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Con(cid_t Cap_Pgtbl_Parent, ptr_t Pos, cid_t Cap_Pgtbl_Child, ptr_t Flags_Child)
{
    2000103a:	f3 0f 1e fa          	endbr64 
    2000103e:	55                   	push   %rbp
    2000103f:	48 89 e5             	mov    %rsp,%rbp
    20001042:	48 83 ec 20          	sub    $0x20,%rsp
    20001046:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000104a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2000104e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001052:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_CON, 0,
    20001056:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000105a:	48 c1 e0 20          	shl    $0x20,%rax
    2000105e:	48 89 c2             	mov    %rax,%rdx
    20001061:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20001065:	89 c0                	mov    %eax,%eax
    20001067:	48 89 d6             	mov    %rdx,%rsi
    2000106a:	48 09 c6             	or     %rax,%rsi
    2000106d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    20001071:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001075:	48 89 d1             	mov    %rdx,%rcx
    20001078:	48 89 c2             	mov    %rax,%rdx
    2000107b:	48 b8 00 00 00 00 13 	movabs $0x1300000000,%rax
    20001082:	00 00 00 
    20001085:	48 89 c7             	mov    %rax,%rdi
    20001088:	e8 60 f0 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Pgtbl_Parent)|UVM_PARAM_D0(Cap_Pgtbl_Child),
                      Pos,
                      Flags_Child);
}
    2000108d:	c9                   	leave  
    2000108e:	c3                   	ret    

000000002000108f <UVM_Pgtbl_Des>:
                          table from.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Des(cid_t Cap_Pgtbl, ptr_t Pos)
{
    2000108f:	f3 0f 1e fa          	endbr64 
    20001093:	55                   	push   %rbp
    20001094:	48 89 e5             	mov    %rsp,%rbp
    20001097:	48 83 ec 10          	sub    $0x10,%rsp
    2000109b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000109f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_DES, 0,
    200010a3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200010a7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200010ab:	b9 00 00 00 00       	mov    $0x0,%ecx
    200010b0:	48 89 c6             	mov    %rax,%rsi
    200010b3:	48 b8 00 00 00 00 14 	movabs $0x1400000000,%rax
    200010ba:	00 00 00 
    200010bd:	48 89 c7             	mov    %rax,%rdi
    200010c0:	e8 28 f0 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Pgtbl,
                      Pos,
                      0);
}
    200010c5:	c9                   	leave  
    200010c6:	c3                   	ret    

00000000200010c7 <UVM_Proc_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, cid_t Cap_Proc,
                   cid_t Cap_Captbl, cid_t Cap_Pgtbl, ptr_t Vaddr)
{
    200010c7:	f3 0f 1e fa          	endbr64 
    200010cb:	55                   	push   %rbp
    200010cc:	48 89 e5             	mov    %rsp,%rbp
    200010cf:	48 83 ec 30          	sub    $0x30,%rsp
    200010d3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200010d7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    200010db:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    200010df:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    200010e3:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    200010e7:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_CRT, Cap_Captbl_Crt,
    200010eb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    200010ef:	48 c1 e0 20          	shl    $0x20,%rax
    200010f3:	48 89 c2             	mov    %rax,%rdx
    200010f6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    200010fa:	89 c0                	mov    %eax,%eax
    200010fc:	48 09 c2             	or     %rax,%rdx
    200010ff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001103:	48 c1 e0 20          	shl    $0x20,%rax
    20001107:	48 89 c1             	mov    %rax,%rcx
    2000110a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2000110e:	89 c0                	mov    %eax,%eax
    20001110:	48 89 ce             	mov    %rcx,%rsi
    20001113:	48 09 c6             	or     %rax,%rsi
    20001116:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000111a:	48 b9 00 00 00 00 15 	movabs $0x1500000000,%rcx
    20001121:	00 00 00 
    20001124:	48 09 c8             	or     %rcx,%rax
    20001127:	48 89 c7             	mov    %rax,%rdi
    2000112a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2000112e:	48 89 c1             	mov    %rax,%rcx
    20001131:	e8 b7 ef ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Proc),
                      UVM_PARAM_D1(Cap_Captbl)|UVM_PARAM_D0(Cap_Pgtbl),
                      Vaddr);
}
    20001136:	c9                   	leave  
    20001137:	c3                   	ret    

0000000020001138 <UVM_Proc_Del>:
              cid_t Cap_Proc - The capability to the process. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Del(cid_t Cap_Captbl, cid_t Cap_Proc)
{
    20001138:	f3 0f 1e fa          	endbr64 
    2000113c:	55                   	push   %rbp
    2000113d:	48 89 e5             	mov    %rsp,%rbp
    20001140:	48 83 ec 10          	sub    $0x10,%rsp
    20001144:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001148:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_DEL, Cap_Captbl,
    2000114c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001150:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20001154:	48 b9 00 00 00 00 16 	movabs $0x1600000000,%rcx
    2000115b:	00 00 00 
    2000115e:	48 09 ca             	or     %rcx,%rdx
    20001161:	48 89 d7             	mov    %rdx,%rdi
    20001164:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001169:	ba 00 00 00 00       	mov    $0x0,%edx
    2000116e:	48 89 c6             	mov    %rax,%rsi
    20001171:	e8 77 ef ff ff       	call   200000ed <UVM_Svc>
                      Cap_Proc,
                      0,
                      0);
}
    20001176:	c9                   	leave  
    20001177:	c3                   	ret    

0000000020001178 <UVM_Proc_Cpt>:
                                 this process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Cpt(cid_t Cap_Proc, cid_t Cap_Captbl)
{
    20001178:	f3 0f 1e fa          	endbr64 
    2000117c:	55                   	push   %rbp
    2000117d:	48 89 e5             	mov    %rsp,%rbp
    20001180:	48 83 ec 10          	sub    $0x10,%rsp
    20001184:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001188:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_CPT, 0,
    2000118c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20001190:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001194:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001199:	48 89 c6             	mov    %rax,%rsi
    2000119c:	48 b8 00 00 00 00 17 	movabs $0x1700000000,%rax
    200011a3:	00 00 00 
    200011a6:	48 89 c7             	mov    %rax,%rdi
    200011a9:	e8 3f ef ff ff       	call   200000ed <UVM_Svc>
                      Cap_Proc,
                      Cap_Captbl,
                      0);
}
    200011ae:	c9                   	leave  
    200011af:	c3                   	ret    

00000000200011b0 <UVM_Proc_Pgt>:
                                process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Pgt(cid_t Cap_Proc, cid_t Cap_Pgtbl)
{
    200011b0:	f3 0f 1e fa          	endbr64 
    200011b4:	55                   	push   %rbp
    200011b5:	48 89 e5             	mov    %rsp,%rbp
    200011b8:	48 83 ec 10          	sub    $0x10,%rsp
    200011bc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200011c0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_PGT, 0,
    200011c4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200011c8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200011cc:	b9 00 00 00 00       	mov    $0x0,%ecx
    200011d1:	48 89 c6             	mov    %rax,%rsi
    200011d4:	48 b8 00 00 00 00 18 	movabs $0x1800000000,%rax
    200011db:	00 00 00 
    200011de:	48 89 c7             	mov    %rax,%rdi
    200011e1:	e8 07 ef ff ff       	call   200000ed <UVM_Svc>
                      Cap_Proc,
                      Cap_Pgtbl,
                      0);
}
    200011e6:	c9                   	leave  
    200011e7:	c3                   	ret    

00000000200011e8 <UVM_Thd_Crt>:
Output      : None.
Return      : ret_t - If successful, the Thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Thd,
                  cid_t Cap_Proc, ptr_t Max_Prio, ptr_t Vaddr)
{
    200011e8:	f3 0f 1e fa          	endbr64 
    200011ec:	55                   	push   %rbp
    200011ed:	48 89 e5             	mov    %rsp,%rbp
    200011f0:	48 83 ec 30          	sub    $0x30,%rsp
    200011f4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200011f8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    200011fc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001200:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20001204:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    20001208:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_CRT, Cap_Captbl, 
    2000120c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20001210:	48 c1 e0 20          	shl    $0x20,%rax
    20001214:	48 89 c2             	mov    %rax,%rdx
    20001217:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2000121b:	89 c0                	mov    %eax,%eax
    2000121d:	48 09 c2             	or     %rax,%rdx
    20001220:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001224:	48 c1 e0 20          	shl    $0x20,%rax
    20001228:	48 89 c1             	mov    %rax,%rcx
    2000122b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2000122f:	89 c0                	mov    %eax,%eax
    20001231:	48 89 ce             	mov    %rcx,%rsi
    20001234:	48 09 c6             	or     %rax,%rsi
    20001237:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000123b:	48 b9 00 00 00 00 19 	movabs $0x1900000000,%rcx
    20001242:	00 00 00 
    20001245:	48 09 c8             	or     %rcx,%rax
    20001248:	48 89 c7             	mov    %rax,%rdi
    2000124b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2000124f:	48 89 c1             	mov    %rax,%rcx
    20001252:	e8 96 ee ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Thd),
                      UVM_PARAM_D1(Cap_Proc)|UVM_PARAM_D0(Max_Prio),
                      Vaddr);
}
    20001257:	c9                   	leave  
    20001258:	c3                   	ret    

0000000020001259 <UVM_Thd_Del>:
              cid_t Cap_Thd - The capability to the thread in the captbl. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Del(cid_t Cap_Captbl, cid_t Cap_Thd)
{
    20001259:	f3 0f 1e fa          	endbr64 
    2000125d:	55                   	push   %rbp
    2000125e:	48 89 e5             	mov    %rsp,%rbp
    20001261:	48 83 ec 10          	sub    $0x10,%rsp
    20001265:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001269:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_DEL, Cap_Captbl,
    2000126d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001271:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20001275:	48 b9 00 00 00 00 1a 	movabs $0x1a00000000,%rcx
    2000127c:	00 00 00 
    2000127f:	48 09 ca             	or     %rcx,%rdx
    20001282:	48 89 d7             	mov    %rdx,%rdi
    20001285:	b9 00 00 00 00       	mov    $0x0,%ecx
    2000128a:	ba 00 00 00 00       	mov    $0x0,%edx
    2000128f:	48 89 c6             	mov    %rax,%rsi
    20001292:	e8 56 ee ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      0,
                      0);
}
    20001297:	c9                   	leave  
    20001298:	c3                   	ret    

0000000020001299 <UVM_Thd_Exec_Set>:
              ptr_t Param - The parameter of the thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Exec_Set(cid_t Cap_Thd, ptr_t Entry, ptr_t Stack, ptr_t Param)
{
    20001299:	f3 0f 1e fa          	endbr64 
    2000129d:	55                   	push   %rbp
    2000129e:	48 89 e5             	mov    %rsp,%rbp
    200012a1:	48 83 ec 20          	sub    $0x20,%rsp
    200012a5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200012a9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    200012ad:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    200012b1:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, Cap_Thd,
    200012b5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200012b9:	48 ba 00 00 00 00 06 	movabs $0x600000000,%rdx
    200012c0:	00 00 00 
    200012c3:	48 09 d0             	or     %rdx,%rax
    200012c6:	48 89 c7             	mov    %rax,%rdi
    200012c9:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    200012cd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    200012d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200012d5:	48 89 c6             	mov    %rax,%rsi
    200012d8:	e8 10 ee ff ff       	call   200000ed <UVM_Svc>
                      Entry, 
                      Stack,
                      Param);
}
    200012dd:	c9                   	leave  
    200012de:	c3                   	ret    

00000000200012df <UVM_Thd_Hyp_Set>:
                            thread's register sets.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Hyp_Set(cid_t Cap_Thd, ptr_t Kaddr)
{
    200012df:	f3 0f 1e fa          	endbr64 
    200012e3:	55                   	push   %rbp
    200012e4:	48 89 e5             	mov    %rsp,%rbp
    200012e7:	48 83 ec 10          	sub    $0x10,%rsp
    200012eb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200012ef:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, 0,
    200012f3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200012f7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200012fb:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001300:	48 89 c6             	mov    %rax,%rsi
    20001303:	48 b8 00 00 00 00 06 	movabs $0x600000000,%rax
    2000130a:	00 00 00 
    2000130d:	48 89 c7             	mov    %rax,%rdi
    20001310:	e8 d8 ed ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      Kaddr,
                      0);
}
    20001315:	c9                   	leave  
    20001316:	c3                   	ret    

0000000020001317 <UVM_Thd_Sched_Bind>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Bind(cid_t Cap_Thd, cid_t Cap_Thd_Sched, cid_t Cap_Sig, tid_t TID, ptr_t Prio)
{
    20001317:	f3 0f 1e fa          	endbr64 
    2000131b:	55                   	push   %rbp
    2000131c:	48 89 e5             	mov    %rsp,%rbp
    2000131f:	48 83 ec 30          	sub    $0x30,%rsp
    20001323:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001327:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2000132b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    2000132f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20001333:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_BIND, Cap_Thd,
    20001337:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2000133b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    2000133f:	48 89 d1             	mov    %rdx,%rcx
    20001342:	48 c1 e1 20          	shl    $0x20,%rcx
    20001346:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    2000134a:	89 d2                	mov    %edx,%edx
    2000134c:	48 89 ce             	mov    %rcx,%rsi
    2000134f:	48 09 d6             	or     %rdx,%rsi
    20001352:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20001356:	48 b9 00 00 00 00 1b 	movabs $0x1b00000000,%rcx
    2000135d:	00 00 00 
    20001360:	48 89 d7             	mov    %rdx,%rdi
    20001363:	48 09 cf             	or     %rcx,%rdi
    20001366:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    2000136a:	48 89 d1             	mov    %rdx,%rcx
    2000136d:	48 89 c2             	mov    %rax,%rdx
    20001370:	e8 78 ed ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Thd_Sched)|UVM_PARAM_D0(Cap_Sig),
                      TID, 
                      Prio);
}
    20001375:	c9                   	leave  
    20001376:	c3                   	ret    

0000000020001377 <UVM_Thd_Sched_Rcv>:
                              is simply not allowed. 2-Level.
Output      : None.
Return      : ret_t - If successful, the thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Rcv(cid_t Cap_Thd)
{
    20001377:	f3 0f 1e fa          	endbr64 
    2000137b:	55                   	push   %rbp
    2000137c:	48 89 e5             	mov    %rsp,%rbp
    2000137f:	48 83 ec 10          	sub    $0x10,%rsp
    20001383:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_RCV, 0,
    20001387:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000138b:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001390:	ba 00 00 00 00       	mov    $0x0,%edx
    20001395:	48 89 c6             	mov    %rax,%rsi
    20001398:	48 b8 00 00 00 00 1c 	movabs $0x1c00000000,%rax
    2000139f:	00 00 00 
    200013a2:	48 89 c7             	mov    %rax,%rdi
    200013a5:	e8 43 ed ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      0, 
                      0);
}
    200013aa:	c9                   	leave  
    200013ab:	c3                   	ret    

00000000200013ac <UVM_Thd_Sched_Prio>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Prio(cid_t Cap_Thd, ptr_t Prio)
{
    200013ac:	f3 0f 1e fa          	endbr64 
    200013b0:	55                   	push   %rbp
    200013b1:	48 89 e5             	mov    %rsp,%rbp
    200013b4:	48 83 ec 10          	sub    $0x10,%rsp
    200013b8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200013bc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_PRIO, 0,
    200013c0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200013c4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200013c8:	b9 00 00 00 00       	mov    $0x0,%ecx
    200013cd:	48 89 c6             	mov    %rax,%rsi
    200013d0:	48 b8 00 00 00 00 07 	movabs $0x700000000,%rax
    200013d7:	00 00 00 
    200013da:	48 89 c7             	mov    %rax,%rdi
    200013dd:	e8 0b ed ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      Prio, 
                      0);
}
    200013e2:	c9                   	leave  
    200013e3:	c3                   	ret    

00000000200013e4 <UVM_Thd_Sched_Free>:
Input       : cid_t Cap_Thd - The capability to the thread. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Free(cid_t Cap_Thd)
{
    200013e4:	f3 0f 1e fa          	endbr64 
    200013e8:	55                   	push   %rbp
    200013e9:	48 89 e5             	mov    %rsp,%rbp
    200013ec:	48 83 ec 10          	sub    $0x10,%rsp
    200013f0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_FREE, 0,
    200013f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200013f8:	b9 00 00 00 00       	mov    $0x0,%ecx
    200013fd:	ba 00 00 00 00       	mov    $0x0,%edx
    20001402:	48 89 c6             	mov    %rax,%rsi
    20001405:	48 b8 00 00 00 00 05 	movabs $0x500000000,%rax
    2000140c:	00 00 00 
    2000140f:	48 89 c7             	mov    %rax,%rdi
    20001412:	e8 d6 ec ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      0, 
                      0);
}
    20001417:	c9                   	leave  
    20001418:	c3                   	ret    

0000000020001419 <UVM_Thd_Time_Xfer>:
                           order of 100us or 1ms.
Output      : None.
Return      : ret_t - If successful, the destination time amount; or an error code.
******************************************************************************/
ret_t UVM_Thd_Time_Xfer(cid_t Cap_Thd_Dst, cid_t Cap_Thd_Src, ptr_t Time)
{
    20001419:	f3 0f 1e fa          	endbr64 
    2000141d:	55                   	push   %rbp
    2000141e:	48 89 e5             	mov    %rsp,%rbp
    20001421:	48 83 ec 20          	sub    $0x20,%rsp
    20001425:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001429:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2000142d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_TIME_XFER, 0,
    20001431:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20001435:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001439:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    2000143d:	48 89 c6             	mov    %rax,%rsi
    20001440:	48 b8 00 00 00 00 08 	movabs $0x800000000,%rax
    20001447:	00 00 00 
    2000144a:	48 89 c7             	mov    %rax,%rdi
    2000144d:	e8 9b ec ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd_Dst,
                      Cap_Thd_Src, 
                      Time);
}
    20001452:	c9                   	leave  
    20001453:	c3                   	ret    

0000000020001454 <UVM_Thd_Swt>:
                                 this thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Swt(cid_t Cap_Thd, ptr_t Full_Yield)
{
    20001454:	f3 0f 1e fa          	endbr64 
    20001458:	55                   	push   %rbp
    20001459:	48 89 e5             	mov    %rsp,%rbp
    2000145c:	48 83 ec 10          	sub    $0x10,%rsp
    20001460:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001464:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SWT, 0,
    20001468:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000146c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20001470:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001475:	48 89 c6             	mov    %rax,%rsi
    20001478:	48 b8 00 00 00 00 09 	movabs $0x900000000,%rax
    2000147f:	00 00 00 
    20001482:	48 89 c7             	mov    %rax,%rdi
    20001485:	e8 63 ec ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      Full_Yield, 
                      0);
}
    2000148a:	c9                   	leave  
    2000148b:	c3                   	ret    

000000002000148c <UVM_Sig_Crt>:
                            within the kernel virtual address.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Sig, ptr_t Vaddr)
{
    2000148c:	f3 0f 1e fa          	endbr64 
    20001490:	55                   	push   %rbp
    20001491:	48 89 e5             	mov    %rsp,%rbp
    20001494:	48 83 ec 20          	sub    $0x20,%rsp
    20001498:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000149c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    200014a0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    200014a4:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_CRT, Cap_Captbl,
    200014a8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200014ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    200014b0:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    200014b4:	48 be 00 00 00 00 1d 	movabs $0x1d00000000,%rsi
    200014bb:	00 00 00 
    200014be:	48 89 cf             	mov    %rcx,%rdi
    200014c1:	48 09 f7             	or     %rsi,%rdi
    200014c4:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    200014c8:	48 89 c6             	mov    %rax,%rsi
    200014cb:	e8 1d ec ff ff       	call   200000ed <UVM_Svc>
                      Cap_Sig,
                      Cap_Kmem,
                      Vaddr);
}
    200014d0:	c9                   	leave  
    200014d1:	c3                   	ret    

00000000200014d2 <UVM_Sig_Del>:
              cid_t Cap_Sig - The capability to the signal. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Del(cid_t Cap_Captbl, cid_t Cap_Sig)
{
    200014d2:	f3 0f 1e fa          	endbr64 
    200014d6:	55                   	push   %rbp
    200014d7:	48 89 e5             	mov    %rsp,%rbp
    200014da:	48 83 ec 10          	sub    $0x10,%rsp
    200014de:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200014e2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_DEL, Cap_Captbl,
    200014e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200014ea:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    200014ee:	48 b9 00 00 00 00 1e 	movabs $0x1e00000000,%rcx
    200014f5:	00 00 00 
    200014f8:	48 09 ca             	or     %rcx,%rdx
    200014fb:	48 89 d7             	mov    %rdx,%rdi
    200014fe:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001503:	ba 00 00 00 00       	mov    $0x0,%edx
    20001508:	48 89 c6             	mov    %rax,%rsi
    2000150b:	e8 dd eb ff ff       	call   200000ed <UVM_Svc>
                      Cap_Sig,
                      0, 
                      0);
}
    20001510:	c9                   	leave  
    20001511:	c3                   	ret    

0000000020001512 <UVM_Sig_Snd>:
Input       : cid_t Cap_Sig - The capability to the signal. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0, or an error code.
******************************************************************************/
ret_t UVM_Sig_Snd(cid_t Cap_Sig)
{
    20001512:	f3 0f 1e fa          	endbr64 
    20001516:	55                   	push   %rbp
    20001517:	48 89 e5             	mov    %rsp,%rbp
    2000151a:	48 83 ec 10          	sub    $0x10,%rsp
    2000151e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_SND, 0,
    20001522:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001526:	b9 00 00 00 00       	mov    $0x0,%ecx
    2000152b:	ba 00 00 00 00       	mov    $0x0,%edx
    20001530:	48 89 c6             	mov    %rax,%rsi
    20001533:	48 b8 00 00 00 00 02 	movabs $0x200000000,%rax
    2000153a:	00 00 00 
    2000153d:	48 89 c7             	mov    %rax,%rdi
    20001540:	e8 a8 eb ff ff       	call   200000ed <UVM_Svc>
                      Cap_Sig,
                      0, 
                      0);
}
    20001545:	c9                   	leave  
    20001546:	c3                   	ret    

0000000020001547 <UVM_Sig_Rcv>:
Output      : None.
Return      : ret_t - If successful, a non-negative number containing the number of signals
                      received will be returned; else an error code.
******************************************************************************/
ret_t UVM_Sig_Rcv(cid_t Cap_Sig, ptr_t Option)
{
    20001547:	f3 0f 1e fa          	endbr64 
    2000154b:	55                   	push   %rbp
    2000154c:	48 89 e5             	mov    %rsp,%rbp
    2000154f:	48 83 ec 10          	sub    $0x10,%rsp
    20001553:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001557:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_RCV, 0,
    2000155b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000155f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20001563:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001568:	48 89 c6             	mov    %rax,%rsi
    2000156b:	48 b8 00 00 00 00 03 	movabs $0x300000000,%rax
    20001572:	00 00 00 
    20001575:	48 89 c7             	mov    %rax,%rdi
    20001578:	e8 70 eb ff ff       	call   200000ed <UVM_Svc>
                      Cap_Sig,
                      Option, 
                      0);
}
    2000157d:	c9                   	leave  
    2000157e:	c3                   	ret    

000000002000157f <UVM_Inv_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, 
                  cid_t Cap_Inv, cid_t Cap_Proc, ptr_t Vaddr)
{
    2000157f:	f3 0f 1e fa          	endbr64 
    20001583:	55                   	push   %rbp
    20001584:	48 89 e5             	mov    %rsp,%rbp
    20001587:	48 83 ec 30          	sub    $0x30,%rsp
    2000158b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000158f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001593:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001597:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    2000159b:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_CRT, Cap_Captbl,
    2000159f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    200015a3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200015a7:	48 89 d1             	mov    %rdx,%rcx
    200015aa:	48 c1 e1 20          	shl    $0x20,%rcx
    200015ae:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    200015b2:	89 d2                	mov    %edx,%edx
    200015b4:	48 89 ce             	mov    %rcx,%rsi
    200015b7:	48 09 d6             	or     %rdx,%rsi
    200015ba:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    200015be:	48 b9 00 00 00 00 1f 	movabs $0x1f00000000,%rcx
    200015c5:	00 00 00 
    200015c8:	48 89 d7             	mov    %rdx,%rdi
    200015cb:	48 09 cf             	or     %rcx,%rdi
    200015ce:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    200015d2:	48 89 d1             	mov    %rdx,%rcx
    200015d5:	48 89 c2             	mov    %rax,%rdx
    200015d8:	e8 10 eb ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Inv),
                      Cap_Proc, 
                      Vaddr);
}
    200015dd:	c9                   	leave  
    200015de:	c3                   	ret    

00000000200015df <UVM_Inv_Del>:
              cid_t Cap_Inv - The capability to the invocation stub. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Del(cid_t Cap_Captbl, cid_t Cap_Inv)
{
    200015df:	f3 0f 1e fa          	endbr64 
    200015e3:	55                   	push   %rbp
    200015e4:	48 89 e5             	mov    %rsp,%rbp
    200015e7:	48 83 ec 10          	sub    $0x10,%rsp
    200015eb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200015ef:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_DEL, Cap_Captbl,
    200015f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200015f7:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    200015fb:	48 b9 00 00 00 00 20 	movabs $0x2000000000,%rcx
    20001602:	00 00 00 
    20001605:	48 09 ca             	or     %rcx,%rdx
    20001608:	48 89 d7             	mov    %rdx,%rdi
    2000160b:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001610:	ba 00 00 00 00       	mov    $0x0,%edx
    20001615:	48 89 c6             	mov    %rax,%rsi
    20001618:	e8 d0 ea ff ff       	call   200000ed <UVM_Svc>
                      Cap_Inv,
                      0, 
                      0);
}
    2000161d:	c9                   	leave  
    2000161e:	c3                   	ret    

000000002000161f <UVM_Inv_Set>:
                                     immediately, or we wait for fault handling?
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Set(cid_t Cap_Inv, ptr_t Entry, ptr_t Stack, ptr_t Fault_Ret_Flag)
{
    2000161f:	f3 0f 1e fa          	endbr64 
    20001623:	55                   	push   %rbp
    20001624:	48 89 e5             	mov    %rsp,%rbp
    20001627:	48 83 ec 20          	sub    $0x20,%rsp
    2000162b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000162f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001633:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001637:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_SET, 0,
    2000163b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2000163f:	48 c1 e0 20          	shl    $0x20,%rax
    20001643:	48 89 c2             	mov    %rax,%rdx
    20001646:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000164a:	89 c0                	mov    %eax,%eax
    2000164c:	48 89 d6             	mov    %rdx,%rsi
    2000164f:	48 09 c6             	or     %rax,%rsi
    20001652:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20001656:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2000165a:	48 89 d1             	mov    %rdx,%rcx
    2000165d:	48 89 c2             	mov    %rax,%rdx
    20001660:	48 b8 00 00 00 00 21 	movabs $0x2100000000,%rax
    20001667:	00 00 00 
    2000166a:	48 89 c7             	mov    %rax,%rdi
    2000166d:	e8 7b ea ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Fault_Ret_Flag)|UVM_PARAM_D0(Cap_Inv),
                      Entry, 
                      Stack);
}
    20001672:	c9                   	leave  
    20001673:	c3                   	ret    

0000000020001674 <UVM_Putchar>:
Input       : char Char - The character to print.
Output      : None.
Return      : ptr_t - Always 0.
******************************************************************************/
ptr_t UVM_Putchar(char Char)
{
    20001674:	f3 0f 1e fa          	endbr64 
    20001678:	55                   	push   %rbp
    20001679:	48 89 e5             	mov    %rsp,%rbp
    2000167c:	48 83 ec 10          	sub    $0x10,%rsp
    20001680:	89 f8                	mov    %edi,%eax
    20001682:	88 45 fc             	mov    %al,-0x4(%rbp)
    /* Wait until we have transmitted */
    while((__UVM_X64_In(UVM_X64_COM1+5)&0x20)==0);
    20001685:	90                   	nop
    20001686:	bf fd 03 00 00       	mov    $0x3fd,%edi
    2000168b:	e8 75 e9 ff ff       	call   20000005 <__UVM_X64_In>
    20001690:	83 e0 20             	and    $0x20,%eax
    20001693:	48 85 c0             	test   %rax,%rax
    20001696:	74 ee                	je     20001686 <UVM_Putchar+0x12>

    __UVM_X64_Out(UVM_X64_COM1, Char);
    20001698:	48 0f be 45 fc       	movsbq -0x4(%rbp),%rax
    2000169d:	48 89 c6             	mov    %rax,%rsi
    200016a0:	bf f8 03 00 00       	mov    $0x3f8,%edi
    200016a5:	e8 65 e9 ff ff       	call   2000000f <__UVM_X64_Out>

    return 0;
    200016aa:	b8 00 00 00 00       	mov    $0x0,%eax
}
    200016af:	c9                   	leave  
    200016b0:	c3                   	ret    

00000000200016b1 <_UVM_Stack_Init>:
Output      : None.
Return      : ptr_t - The actual stack address to use for system call.
******************************************************************************/
ptr_t _UVM_Stack_Init(ptr_t Stack, ptr_t Size, ptr_t Stub, ptr_t Entry,
                      ptr_t Param1, ptr_t Param2, ptr_t Param3, ptr_t Param4)
{
    200016b1:	f3 0f 1e fa          	endbr64 
    200016b5:	55                   	push   %rbp
    200016b6:	48 89 e5             	mov    %rsp,%rbp
    200016b9:	48 83 ec 40          	sub    $0x40,%rsp
    200016bd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    200016c1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    200016c5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    200016c9:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    200016cd:	4c 89 45 c8          	mov    %r8,-0x38(%rbp)
    200016d1:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
	ptr_t* Stack_Ptr;

    Stack_Ptr=(ptr_t*)(Stack+Size-UVM_STACK_SAFE_SIZE*sizeof(ptr_t));
    200016d5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    200016d9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    200016dd:	48 01 d0             	add    %rdx,%rax
    200016e0:	48 2d 00 01 00 00    	sub    $0x100,%rax
    200016e6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    Stack_Ptr[0]=Param1;
    200016ea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200016ee:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    200016f2:	48 89 10             	mov    %rdx,(%rax)
    Stack_Ptr[1]=Param2;
    200016f5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200016f9:	48 8d 50 08          	lea    0x8(%rax),%rdx
    200016fd:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    20001701:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[2]=Param3;
    20001704:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001708:	48 8d 50 10          	lea    0x10(%rax),%rdx
    2000170c:	48 8b 45 10          	mov    0x10(%rbp),%rax
    20001710:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[3]=Param4;
    20001713:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001717:	48 8d 50 18          	lea    0x18(%rax),%rdx
    2000171b:	48 8b 45 18          	mov    0x18(%rbp),%rax
    2000171f:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[4]=Entry;
    20001722:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001726:	48 8d 50 20          	lea    0x20(%rax),%rdx
    2000172a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2000172e:	48 89 02             	mov    %rax,(%rdx)

    return (ptr_t)Stack_Ptr;
    20001731:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
    20001735:	c9                   	leave  
    20001736:	c3                   	ret    

0000000020001737 <_UVM_Idle>:
Input       : None.
Output      : None.
Return      : None.
******************************************************************************/
void _UVM_Idle(void)
{
    20001737:	f3 0f 1e fa          	endbr64 
    2000173b:	55                   	push   %rbp
    2000173c:	48 89 e5             	mov    %rsp,%rbp
    /* Do nothing. In the future we may call a kernel function to put us to sleep */
}
    2000173f:	90                   	nop
    20001740:	5d                   	pop    %rbp
    20001741:	c3                   	ret    
